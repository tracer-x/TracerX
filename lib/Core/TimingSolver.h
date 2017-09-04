//===-- TimingSolver.h ------------------------------------------*- C++ -*-===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef KLEE_TIMINGSOLVER_H
#define KLEE_TIMINGSOLVER_H

#include "klee/Expr.h"
#include "klee/Solver.h"

#include <vector>

namespace klee {
  class ExecutionState;
  class Solver;

  /// TimingSolver - A simple class which wraps a solver and handles
  /// tracking the statistics that we care about.
  class TimingSolver {
  public:
    Solver *solver;
    bool simplifyExprs;

  public:
    /// TimingSolver - Construct a new timing solver.
    ///
    /// \param _simplifyExprs - Whether expressions should be
    /// simplified (via the constraint manager interface) prior to
    /// querying.
    TimingSolver(Solver *_solver, bool _simplifyExprs = true) 
      : solver(_solver), simplifyExprs(_simplifyExprs) {}
    ~TimingSolver() {
      delete solver;
    }

    void setTimeout(double t) {
      solver->setCoreSolverTimeout(t);
    }
    
    char *getConstraintLog(const Query& query) {
      return solver->getConstraintLog(query);
    }

    bool evaluate(const ExecutionState &, ref<Expr>, Solver::Validity &result,
                  std::vector<ref<Expr> > &unsatCore);

    bool mustBeTrue(const ExecutionState &, ref<Expr>, bool &result,
                    std::vector<ref<Expr> > &unsatCore);

    bool mustBeFalse(const ExecutionState &, ref<Expr>, bool &result,
                     std::vector<ref<Expr> > &unsatCore);

    bool mayBeTrue(const ExecutionState &, ref<Expr>, bool &result,
                   std::vector<ref<Expr> > &unsatCore);

    bool mayBeFalse(const ExecutionState &, ref<Expr>, bool &result,
                    std::vector<ref<Expr> > &unsatCore);

    bool mustBeTrue(const ExecutionState &state, ref<Expr> expr, bool &result) {
      std::vector<ref<Expr> > dummyUnsatCore;
      return mustBeTrue(state, expr, result, dummyUnsatCore);
    }

    bool mustBeFalse(const ExecutionState &state, ref<Expr> expr,
                     bool &result) {
      std::vector<ref<Expr> > dummyUnsatCore;
      return mustBeFalse(state, expr, result, dummyUnsatCore);
    }

    bool mayBeTrue(const ExecutionState &state, ref<Expr> expr, bool &result) {
      std::vector<ref<Expr> > dummyUnsatCore;
      return mayBeTrue(state, expr, result, dummyUnsatCore);
    }

    bool mayBeFalse(const ExecutionState &state, ref<Expr> expr, bool &result) {
      std::vector<ref<Expr> > dummyUnsatCore;
      return mayBeFalse(state, expr, result, dummyUnsatCore);
    }

    bool getValue(const ExecutionState &, ref<Expr> expr, 
                  ref<ConstantExpr> &result);

    bool getInitialValues(const ExecutionState &,
                          const std::vector<const Array *> &objects,
                          std::vector<std::vector<unsigned char> > &result,
                          std::vector<ref<Expr> > &unsatCore);

    std::pair< ref<Expr>, ref<Expr> >
    getRange(const ExecutionState&, ref<Expr> query);
  };

}

#endif
