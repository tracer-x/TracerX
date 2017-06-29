//===-- IncompleteSolver.cpp ----------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "klee/IncompleteSolver.h"

#include "klee/Constraints.h"

using namespace klee;
using namespace llvm;

/***/

IncompleteSolver::PartialValidity 
IncompleteSolver::negatePartialValidity(PartialValidity pv) {
  switch(pv) {
  default: assert(0 && "invalid partial validity");  
  case MustBeTrue:  return MustBeFalse;
  case MustBeFalse: return MustBeTrue;
  case MayBeTrue:   return MayBeFalse;
  case MayBeFalse:  return MayBeTrue;
  case TrueOrFalse: return TrueOrFalse;
  }
}

IncompleteSolver::PartialValidity
IncompleteSolver::computeValidity(const Query &query,
                                  std::vector<ref<Expr> > &unsatCore) {
  PartialValidity trueResult = computeTruth(query, unsatCore);

  if (trueResult == MustBeTrue) {
    return MustBeTrue;
  } else {
    PartialValidity falseResult = computeTruth(query.negateExpr(), unsatCore);

    if (falseResult == MustBeTrue) {
      return MustBeFalse;
    } else {
      bool trueCorrect = trueResult != None,
        falseCorrect = falseResult != None;
      
      if (trueCorrect && falseCorrect) {
        return TrueOrFalse;
      } else if (trueCorrect) { // ==> trueResult == MayBeFalse
        return MayBeFalse;
      } else if (falseCorrect) { // ==> falseResult == MayBeFalse
        return MayBeTrue;
      } else {
        return None;
      }
    }
  }
}

/***/

StagedSolverImpl::StagedSolverImpl(IncompleteSolver *_primary, 
                                   Solver *_secondary) 
  : primary(_primary),
    secondary(_secondary) {
}

StagedSolverImpl::~StagedSolverImpl() {
  delete primary;
  delete secondary;
}

bool StagedSolverImpl::computeTruth(const Query &query, bool &isValid,
                                    std::vector<ref<Expr> > &unsatCore) {
  IncompleteSolver::PartialValidity trueResult =
      primary->computeTruth(query, unsatCore);

  if (trueResult != IncompleteSolver::None) {
    isValid = (trueResult == IncompleteSolver::MustBeTrue);
    return true;
  }

  return secondary->impl->computeTruth(query, isValid, unsatCore);
}

bool StagedSolverImpl::computeValidity(const Query &query,
                                       Solver::Validity &result,
                                       std::vector<ref<Expr> > &unsatCore) {
  bool tmp;
  switch (primary->computeValidity(query, unsatCore)) {
  case IncompleteSolver::MustBeTrue: 
    result = Solver::True;
    break;
  case IncompleteSolver::MustBeFalse: 
    result = Solver::False;
    break;
  case IncompleteSolver::TrueOrFalse: 
    result = Solver::Unknown;
    break;
  case IncompleteSolver::MayBeTrue:
    if (!secondary->impl->computeTruth(query, tmp, unsatCore))
      return false;
    result = tmp ? Solver::True : Solver::Unknown;
    break;
  case IncompleteSolver::MayBeFalse:
    if (!secondary->impl->computeTruth(query.negateExpr(), tmp, unsatCore))
      return false;
    result = tmp ? Solver::False : Solver::Unknown;
    break;
  default:
    if (!secondary->impl->computeValidity(query, result, unsatCore))
      return false;
    break;
  }

  return true;
}

bool StagedSolverImpl::computeValue(const Query& query,
                                    ref<Expr> &result) {
  if (primary->computeValue(query, result))
    return true;

  return secondary->impl->computeValue(query, result);
}

bool StagedSolverImpl::computeInitialValues(
    const Query &query, const std::vector<const Array *> &objects,
    std::vector<std::vector<unsigned char> > &values, bool &hasSolution,
    std::vector<ref<Expr> > &unsatCore) {
  if (primary->computeInitialValues(query, objects, values, hasSolution,
                                    unsatCore))
    return true;

  return secondary->impl->computeInitialValues(query, objects, values,
                                               hasSolution, unsatCore);
}

SolverImpl::SolverRunStatus StagedSolverImpl::getOperationStatusCode() {
  return secondary->impl->getOperationStatusCode();
}

char *StagedSolverImpl::getConstraintLog(const Query& query) {
  return secondary->impl->getConstraintLog(query);
}

void StagedSolverImpl::setCoreSolverTimeout(double timeout) {
  secondary->impl->setCoreSolverTimeout(timeout);
}

