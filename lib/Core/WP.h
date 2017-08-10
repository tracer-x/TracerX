//===-- WP.h - Tracer-X symbolic execution tree -------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains declarations of the classes that implements the
/// weakest precondition interpolation.
///
//===----------------------------------------------------------------------===//

#ifndef WP_H_
#define WP_H_

#include "klee/ExecutionState.h"
#include <klee/Expr.h>

namespace klee {

/// \brief The class that implements weakest precondition interpolant.
class WeakestPreCondition {

public:
  WeakestPreCondition();

  ~WeakestPreCondition();

  // \brief Preprocessing phase: marking the instructions that contribute
  // to the target or an infeasible path.
  std::set<llvm::Value *>
  markVariables(std::map<KInstruction *, bool> reverseInstructionList);
};
}
#endif /* WP_H_ */
