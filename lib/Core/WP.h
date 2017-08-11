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
#include <klee/ExprBuilder.h>
#include <klee/util/ArrayCache.h>

namespace klee {

/// \brief The class that implements weakest precondition interpolant.
class WeakestPreCondition {

  friend class TxTree;

  friend class ExecutionState;

  std::set<llvm::Value *> markedVariables;
  ref<Expr> WPExpr;
  ExprBuilder *eb;
  ArrayCache ac;
  const Array *array;

public:
  WeakestPreCondition();

  ~WeakestPreCondition();

  // \brief Preprocessing phase: marking the instructions that contribute
  // to the target or an infeasible path.
  std::map<KInstruction *, bool>
  markVariables(std::map<KInstruction *, bool> reverseInstructionList);

  // \brief Generate and return the weakest precondition expression.
  ref<Expr> GenerateWP(std::map<KInstruction *, bool> reverseInstructionList);

  // \brief Generate expression from operand of an instruction
  ref<Expr> generateExprFromOperand(llvm::Instruction *i, int operand);

  // \brief Return LHS of an instruction as a read expression
  ref<Expr> getLHS(llvm::Instruction *i);

  // \brief Update the weakest precondition with a new condition
  void updateWPExpr(ref<Expr> result);

  // \brief Substitute the rhs of result with its lhs in the weakest
  // precondition expression
  void substituteExpr(ref<Expr> result);

  // \brief Recursive substitute function
  ref<Expr> substituteExpr(ref<Expr> Base, const ref<Expr> lhs,
                           const ref<Expr> rhs);

  // \brief Convert the weakest precondition expression to canonical form
  void simplifyWPExpr();
};
}
#endif /* WP_H_ */
