//===-- TXWP.h - Tracer-X symbolic execution tree -------------*- C++ -*-===//
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

#ifndef TXWP_H_
#define TXWP_H_

#include "TxDependency.h"
#include "TxExprHelper.h"
#include "TxPartitionHelper.h"
#include "TxTree.h"
#include "TxWPHelper.h"
#include "Z3Simplification.h"
#include "klee/ExecutionState.h"
#include <klee/Expr.h>
#include <klee/ExprBuilder.h>
#include <klee/Internal/Support/ErrorHandling.h>
#include <klee/util/ArrayCache.h>
#include <vector>

namespace klee {

/// \brief The class that implements weakest precondition interpolant.
class TxWeakestPreCondition {

  friend class TxTree;
  friend class ExecutionState;

  std::set<llvm::Value *> markedVariables;

  ref<Expr> WPExpr;

  // Respective interpolation tree node
  TxTreeNode *node;

  /// \brief The dependency information for the respective interpolation tree
  /// node
  TxDependency *dependency;

  int debugSubsumptionLevel;

public:
  TxWeakestPreCondition(TxTreeNode *_node, TxDependency *_dependency);

  ~TxWeakestPreCondition();

  ref<Expr> True() { return ConstantExpr::alloc(1, Expr::Bool); };
  ref<Expr> False() { return ConstantExpr::alloc(0, Expr::Bool); };

  void resetFalseWPExpr() { WPExpr = False(); }

  void resetWPExpr() { WPExpr = True(); }

  void setWPExpr(ref<Expr> expr) { WPExpr = expr; }

  ref<Expr> getWPExpr() { return WPExpr; }

  // \brief Preprocessing phase: marking the instructions that contribute
  // to the target or an infeasible path.
  // std::vector<std::pair<KInstruction *, int> > markVariables(
  //      std::vector<std::pair<KInstruction *, int> > reverseInstructionList);

  // \brief Replace arguments passed to a call with the function arguments in
  // the WPExpr
  //  ref<Expr> replaceCallArguments(ref<Expr> wp, llvm::Value *funcArg,
  //                                 llvm::Value *callArg);

  // \brief Return LHS of an instruction as a read expression
  //  ref<Expr> getLHS(llvm::Instruction *i);

  /*****************************************************************************/
  /// \brief Perform the intersection of two weakest precondition expressions
  /// with respect to the branchCondition
  ref<Expr> intersectWPExpr(ref<Expr> branchCondition, ref<Expr> expr1,
                            ref<Expr> expr2);

  //  std::map<std::string, ref<Expr> >
  //  extractExprs(TxStore::TopInterpolantStore concretelyAddressedStore);
  //
  //  std::vector<ref<Expr> > intersectExpr_aux(std::vector<ref<Expr> > expr1,
  //                                            std::vector<ref<Expr> > expr2);

  // \brief Return the minimum of two constant expressions
  //  ref<ConstantExpr> getMinOfConstExpr(ref<ConstantExpr> expr1,
  //                                      ref<ConstantExpr> expr2);

  // \brief Return the maximum of two constant expressions
  //  ref<ConstantExpr> getMaxOfConstExpr(ref<ConstantExpr> expr1,
  //                                      ref<ConstantExpr> expr2);

  // \brief Return true if the destination of the LLVM instruction appears in
  // the WP expression
  //  bool isTargetDependent(llvm::Value *inst, ref<Expr> wp);

  // =========================================================================
  // Functions Updating the Subsumption Table Entry
  // =========================================================================

  // \brief Update subsumption table entry based on one Partition from WP Expr
  TxSubsumptionTableEntry *
  updateSubsumptionTableEntry(TxSubsumptionTableEntry *entry);

  // \brief Update concretelyAddressedStore based on the WP Expr
  //  TxStore::TopInterpolantStore updateConcretelyAddressedStore(
  //      TxStore::TopInterpolantStore concretelyAddressedStore, ref<Expr> wp);
  //
  // \brief Get variable stored in the Partition
  //  ref<Expr> getVarFromExpr(ref<Expr> wp);

  // \brief Update interpolant based on the WP Expr
  //  ref<Expr> updateInterpolant(ref<Expr> interpolant, ref<Expr> wp);

  // \brief Extracts unrelated frames from interpolant to be passed in
  // conjunction with the WP Expr
  //  ref<Expr> extractUnrelatedFrame(ref<Expr> interpolant, ref<Expr> var);

  // \brief Replace array with shadow array in an expression
  //  ref<Expr> replaceArrayWithShadow(ref<Expr> interpolant);

  // \brief Add new existential variables to the list
  //  std::set<const Array *>
  //  updateExistentials(std::set<const Array *> existentials, ref<Expr> wp);

  // =========================================================================
  // Updated Version of Weakest PreCondition
  // =========================================================================

  // \brief Generate and return the weakest precondition expression.
  ref<Expr>
  PushUp(std::vector<std::pair<KInstruction *, int> > reverseInstructionList);

  ref<Expr> getBrCondition(llvm::Instruction *ins);

  // \brief Generate expression from operand of an instruction
  // The offset is only used when a pointer or array instruction are handled and
  // first the offset is computed.
  ref<Expr> generateExprFromOperand(llvm::Value *val, ref<Expr> offset = NULL);

private:
  ref<Expr> getCondition(llvm::Value *value);

  // \brief Handling ConstantInt LLVM Value
  ref<Expr> getConstantInt(llvm::ConstantInt *cmp);

  // \brief Handling ConstantExpr LLVM Value
  ref<Expr> getConstantExpr(llvm::ConstantExpr *ce);

  ref<Expr> getGlobalValue(llvm::GlobalValue *gv);

  // \brief Handling Function Argument LLVM Value
  ref<Expr> getFunctionArgument(llvm::Argument *arg);

  // \brief Handling Pointer LLVM Value
  ref<Expr> getPointer(llvm::LoadInst *p);

  // \brief Handling Load GEP LLVM Value
  ref<Expr> getLoadGep(llvm::LoadInst *p);

  // \brief Handling Load LLVM Value
  ref<Expr> getLoad(llvm::LoadInst *p);

  // \brief Handling Alloca LLVM Value
  ref<Expr> getAllocaInst(llvm::AllocaInst *alc);

  // \brief Handling Binary Operator
  ref<Expr> getBinaryInst(llvm::BinaryOperator *bo);

  // \brief Handling Casting Instructions
  ref<Expr> getCastInst(llvm::CastInst *ci);

  // \brief Handling Cmp Instructions
  ref<Expr> getCmpCondition(llvm::CmpInst *cmp);

  // \brief Handling GEP Instructions
  ref<Expr> getGepInst(llvm::GetElementPtrInst *gep);

  // \brief Handling Switch Instructions
  ref<Expr> getSwitchInst(llvm::SwitchInst *si);

  // \brief Handling Phi Instructions
  ref<Expr> getPhiInst(llvm::PHINode *phi);

  // \brief Handling Call Instructions
  ref<Expr> getCallInst(llvm::CallInst *ci);

  // \brief Handling Call kLEE_assume
  ref<Expr> getCallAssume(llvm::CallInst *ci);

  // \brief Retrieving Alloca LLVM Value size
  unsigned int getAllocaInstSize(llvm::AllocaInst *alc);

  // \brief Retrieving Global Variable LLVM Value size
  unsigned int getGlobalVariabletSize(llvm::GlobalValue *gv);

  // \brief Retrieving Function Argument size
  unsigned int getFunctionArgumentSize(llvm::Argument *arg);
};
}
#endif /* TXWP_H_ */
