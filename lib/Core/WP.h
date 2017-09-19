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
#include "TxDependency.h"
#include "TxTree.h"

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
  TxDependency *dependency;

  int debugSubsumptionLevel;

  std::map<llvm::Value *, std::pair<const Array *, ref<Expr> > > arrayStore;

  const Array *array;

public:
  WeakestPreCondition(TxTreeNode *_node, TxDependency *_dependency);

  ~WeakestPreCondition();

  ref<Expr> True() { return eb->True(); };
  ref<Expr> False() { return eb->False(); };

  void resetWPExpr() { WPExpr = eb->False(); }

  void setWPExpr(ref<Expr> expr) { WPExpr = expr; }

  ref<Expr> getWPExpr() { return WPExpr; }

  // \brief Preprocessing phase: marking the instructions that contribute
  // to the target or an infeasible path.
  std::vector<std::pair<KInstruction *, int> > markVariables(
      std::vector<std::pair<KInstruction *, int> > reverseInstructionList);

  // \brief Generate and return the weakest precondition expression.
  ref<Expr> GenerateWP(
      std::vector<std::pair<KInstruction *, int> > reverseInstructionList,
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

  // \brief Store a row in arrayStore with llvm::Value and the respective Array
  // and Expr
  void storeArrayRef(llvm::Value *value, const Array *array, ref<Expr> expr);

  // \brief Get respective reference to array of an LLVM value
  const Array *getArrayRef(llvm::Value *value);

  // \brief Get respective value pointer of a read/concat Expr
  llvm::Value *getValuePointer(ref<Expr> expr);

  // \brief Instantiates the variables in WPExpr by their latest value for the
  // implication test.
  ref<Expr>
  instantiateWPExpression(TxDependency *dependency,
                          const std::vector<llvm::Instruction *> &callHistory,
                          ref<Expr> WPExpr);

  // \brief Perform the intersection of two weakest precondition expression
  ref<Expr> intersectExpr(ref<Expr> expr1,ref<Expr> expr2);

  // \brief Return the minimum of two constant expressions
  ref<ConstantExpr> getMinOfConstExpr(ref<ConstantExpr> expr1,ref<ConstantExpr> expr2);

  // \brief Return the maximum of two constant expressions
  ref<ConstantExpr> getMaxOfConstExpr(ref<ConstantExpr> expr1,ref<ConstantExpr> expr2);

  // \brief Return true if the destination of the LLVM instruction appears in
  // the WP expression
  bool isTargetDependent(llvm::Instruction *inst, ref<Expr> wp);

  // \brief Update subsumption table entry based on the WP Expr
  TxSubsumptionTableEntry *
  updateSubsumptionTableEntry(TxSubsumptionTableEntry *entry, ref<Expr> wp);

  // \brief Update concretelyAddressedStore based on the WP Expr
  TxStore::TopInterpolantStore updateConcretelyAddressedStore(
      TxStore::TopInterpolantStore concretelyAddressedStore, ref<Expr> wp);

  // \brief Get variable stored in the frame
  ref<Expr> getVarFromExpr(ref<Expr> wp);

  // \brief Update interpolant based on the WP Expr
  ref<Expr> updateInterpolant(ref<Expr> interpolant, ref<Expr> wp);

  // \brief Replace array with shadow array in an expression
  ref<Expr> replaceArrayWithShadow(ref<Expr> interpolant);

  // \brief Add new existential variables to the list
  std::set<const Array *>
  updateExistentials(std::set<const Array *> existentials, ref<Expr> wp);
};
}
#endif /* WP_H_ */
