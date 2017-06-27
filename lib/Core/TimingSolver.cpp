//===-- TimingSolver.cpp --------------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "TimingSolver.h"

#include "klee/CommandLine.h"
#include "klee/Config/Version.h"
#include "klee/ExecutionState.h"
#include "klee/Solver.h"
#include "klee/Statistics.h"
#include "klee/Internal/System/Time.h"

#include "CoreStats.h"

#include "llvm/Support/TimeValue.h"

using namespace klee;
using namespace llvm;

/***/

void TimingSolver::buildCachedUnsatCore(const ExecutionState &state) {
  std::vector<unsigned> simplificationCore;
  buildCachedUnsatCore(state, simplificationCore);
}

void
TimingSolver::buildCachedUnsatCore(const ExecutionState &state,
                                   std::vector<unsigned> &simplificationCore) {
  cachedUnsatCore.clear();
  std::vector<ref<Expr> > unsatCore = solver->getUnsatCore();
  if (!simplificationCore.empty()) {
    if (!unsatCore.empty()) {
      std::vector<unsigned>::iterator simplificationIt =
          simplificationCore.begin();
      std::vector<unsigned>::iterator simplificationItEnd =
          simplificationCore.end();
      std::vector<ref<Expr> >::iterator unsatIt = unsatCore.begin();
      std::vector<ref<Expr> >::iterator unsatItEnd = unsatCore.end();

      unsigned constraintIndex = 0;
      for (ConstraintManager::const_iterator it = state.constraints.begin(),
                                             itEnd = state.constraints.end();
           it != itEnd; ++it) {
        if (simplificationIt != simplificationItEnd) {
          if (constraintIndex == *simplificationIt) {
            ++simplificationIt;
            if (unsatIt != unsatItEnd && *it == *unsatIt) {
              ++unsatIt;
            }
            cachedUnsatCore.push_back(*it);
            ++constraintIndex;
            continue;
          }
        } else if (unsatIt == unsatItEnd) {
          break;
        }

        if (*it == *unsatIt) {
          ++unsatIt;
          cachedUnsatCore.push_back(*it);
        }
        ++constraintIndex;
      }
    } else {
      for (std::vector<unsigned>::iterator it = simplificationCore.begin(),
                                           itEnd = simplificationCore.end();
           it != itEnd; ++it) {
        cachedUnsatCore.push_back(state.constraints.getConstraints().at(*it));
      }
    }
  } else {
    cachedUnsatCore = unsatCore;
  }
}

bool TimingSolver::evaluate(const ExecutionState& state, ref<Expr> expr,
                            Solver::Validity &result) {
  // Fast path, to avoid timer and OS overhead.
  if (ConstantExpr *CE = dyn_cast<ConstantExpr>(expr)) {
    result = CE->isTrue() ? Solver::True : Solver::False;
    return true;
  }

  sys::TimeValue now = util::getWallTimeVal();

  std::vector<unsigned> simplificationCore;
  if (simplifyExprs)
    expr = state.constraints.simplifyExpr(expr, simplificationCore);

  bool success = solver->evaluate(Query(state.constraints, expr), result);
  if (INTERPOLATION_ENABLED)
    buildCachedUnsatCore(state, simplificationCore);

  sys::TimeValue delta = util::getWallTimeVal();
  delta -= now;
  stats::solverTime += delta.usec();
  state.queryCost += delta.usec()/1000000.;

  return success;
}

bool TimingSolver::mustBeTrue(const ExecutionState& state, ref<Expr> expr, 
                              bool &result) {
  // Fast path, to avoid timer and OS overhead.
  if (ConstantExpr *CE = dyn_cast<ConstantExpr>(expr)) {
    result = CE->isTrue() ? true : false;
    return true;
  }

  sys::TimeValue now = util::getWallTimeVal();

  std::vector<unsigned> simplificationCore;
  if (simplifyExprs)
    expr = state.constraints.simplifyExpr(expr, simplificationCore);

  bool success = solver->mustBeTrue(Query(state.constraints, expr), result);
  if (INTERPOLATION_ENABLED)
    buildCachedUnsatCore(state, simplificationCore);

  sys::TimeValue delta = util::getWallTimeVal();
  delta -= now;
  stats::solverTime += delta.usec();
  state.queryCost += delta.usec()/1000000.;

  return success;
}

bool TimingSolver::mustBeFalse(const ExecutionState& state, ref<Expr> expr,
                               bool &result) {
  return mustBeTrue(state, Expr::createIsZero(expr), result);
}

bool TimingSolver::mayBeTrue(const ExecutionState& state, ref<Expr> expr, 
                             bool &result) {
  bool res;
  if (!mustBeFalse(state, expr, res))
    return false;
  result = !res;
  return true;
}

bool TimingSolver::mayBeFalse(const ExecutionState& state, ref<Expr> expr, 
                              bool &result) {
  bool res;
  if (!mustBeTrue(state, expr, res))
    return false;
  result = !res;
  return true;
}

bool TimingSolver::getValue(const ExecutionState& state, ref<Expr> expr, 
                            ref<ConstantExpr> &result) {
  // Fast path, to avoid timer and OS overhead.
  if (ConstantExpr *CE = dyn_cast<ConstantExpr>(expr)) {
    result = CE;
    return true;
  }
  
  sys::TimeValue now = util::getWallTimeVal();

  std::vector<unsigned> simplificationCore;
  if (simplifyExprs)
    expr = state.constraints.simplifyExpr(expr, simplificationCore);

  bool success = solver->getValue(Query(state.constraints, expr), result);
  if (INTERPOLATION_ENABLED)
    buildCachedUnsatCore(state, simplificationCore);

  sys::TimeValue delta = util::getWallTimeVal();
  delta -= now;
  stats::solverTime += delta.usec();
  state.queryCost += delta.usec()/1000000.;

  return success;
}

bool 
TimingSolver::getInitialValues(const ExecutionState& state, 
                               const std::vector<const Array*>
                                 &objects,
                               std::vector< std::vector<unsigned char> >
                                 &result) {
  if (objects.empty())
    return true;

  sys::TimeValue now = util::getWallTimeVal();

  bool success = solver->getInitialValues(Query(state.constraints,
                                                ConstantExpr::alloc(0, Expr::Bool)), 
                                          objects, result);
  if (INTERPOLATION_ENABLED)
    buildCachedUnsatCore(state);

  sys::TimeValue delta = util::getWallTimeVal();
  delta -= now;
  stats::solverTime += delta.usec();
  state.queryCost += delta.usec()/1000000.;
  
  return success;
}

std::pair< ref<Expr>, ref<Expr> >
TimingSolver::getRange(const ExecutionState& state, ref<Expr> expr) {
  std::pair<ref<Expr>, ref<Expr> > ret =
      solver->getRange(Query(state.constraints, expr));
  if (INTERPOLATION_ENABLED)
    buildCachedUnsatCore(state);
  return ret;
}

std::vector<ref<Expr> > &TimingSolver::getUnsatCore() { return cachedUnsatCore; }
