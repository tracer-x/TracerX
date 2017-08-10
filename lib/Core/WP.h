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

#include "Dependency.h"

namespace klee {

/// \brief The class that implements weakest precondition interpolant.
class WeakestPreCondition {

  friend class TxTree;

  friend class ExecutionState;

  std::set<llvm::Value *> markedVariables;
  // Used to represent constants during the simplification of WPExpr to
  // canonical form
  ref<Expr> constValues;
  ref<Expr> WPExpr;
  ExprBuilder *eb;
  ArrayCache ac;

  // Respective interpolation tree node
  TxTreeNode *node;

  /// \brief The dependency information for the respective interpolation tree
  /// node
  Dependency *dependency;

  const Array *array;

public:
  WeakestPreCondition(TxTreeNode *_node, Dependency *_dependency);

  ~WeakestPreCondition();

  ref<Expr> True() { return eb->True(); };
  ref<Expr> False() { return eb->False(); };

  void resetWPExpr() { WPExpr = eb->False(); }

  void setWPExpr(ref<Expr> expr) { WPExpr = expr; }

  // \brief Preprocessing phase: marking the instructions that contribute
  // to the target or an infeasible path.
  std::map<KInstruction *, bool>
  markVariables(std::map<KInstruction *, bool> reverseInstructionList);

  // \brief Generate and return the weakest precondition expression.
  ref<Expr> GenerateWP(std::map<KInstruction *, bool> reverseInstructionList,
                       bool markAllFlag);

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

  // \brief Simplify terms in the weakest precondition expression to canonical
  // form
  std::map<ref<Expr>, uint64_t> *
  simplifyWPTerm(std::map<ref<Expr>, uint64_t> *newLinearTerm,
                 ref<Expr> linearTerm);

  // \brief Insert a variable with coefficient in newLinearTerm
  void insertTerm(std::map<ref<Expr>, uint64_t> *newLinearTerm, uint64_t coeff,
                  ref<Expr> variable);

  // \brief Convert newLinearTerm to an expression and store it at WPExpr(in
  // canonical form)
  void convertToExpr(std::map<ref<Expr>, uint64_t> *newLinearTerm);
};
}
#endif /* WP_H_ */
