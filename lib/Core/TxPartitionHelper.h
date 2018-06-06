//===-- TxPartitionHelper.h - Tracer-X symbolic execution tree -------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains declarations of the classes that support for partitioning
///
//===----------------------------------------------------------------------===//


#ifndef LIB_CORE_TXPARTITIONHELPER_H_
#define LIB_CORE_TXPARTITIONHELPER_H_

#include "klee/ExecutionState.h"
#include "Memory.h"
//#include <klee/Expr.h>

namespace klee {

class Partition {
public:
  std::vector<ref<Expr> > exprs;
  std::set<std::string> vars;
};

class TxPartitionHelper {
public:
  static void test(ExecutionState &state, ref<Expr> e);
  static void test1(ExecutionState &state);
  static Partition getNeededPartition(ConstraintManager constraints,
                                      ref<Expr> e);
  static std::vector<Partition> partition(ConstraintManager constraints);
  static std::vector<Partition> partition(std::vector<ref<Expr> > exprs);
  static std::vector<Partition> getUnrelatedPartition(ref<Expr> cond, std::vector<ref<Expr> > exprs);
  static std::vector<Partition> get2Or3Partitions(ref<Expr> cond, std::vector<ref<Expr> > exprs1, std::vector<ref<Expr> > exprs2);
  static ref<Expr> createAnd(std::vector<ref<Expr> > exprs);

  // printing functions
  static void printInfo(ExecutionState &state);
  static ref<Expr> True() {
    return ConstantExpr::alloc(1, Expr::Bool);
  };
  static ref<Expr> False() {
    return ConstantExpr::alloc(0, Expr::Bool);
  };
private:
  static bool isShared(std::set<std::string> ss1, std::set<std::string> ss2);
  static void getExprVars(ref<Expr> e, std::set<std::string> &vars);


  // printing functions
  static void printExprInfo(ref<Expr> expr);
};
}
#endif /* TXLIB_CORE_PARTITIONHELPER_H_ */
