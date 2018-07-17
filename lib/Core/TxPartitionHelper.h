//===-- TxPartitionHelper.h - Tracer-X symbolic execution tree -------------*-
// C++ -*-===//
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

#include "TxStore.h"
#include "klee/Internal/Support/ErrorHandling.h"
#include "llvm/IR/Value.h"
#include <iostream>
#include <map>
#include <string>

namespace klee {

class Partition {
public:
  std::set<ref<Expr> > exprs;
  std::set<std::string> vars;
  void print() {
    for (std::set<ref<Expr> >::const_iterator it = exprs.begin(),
                                              ie = exprs.end();
         it != ie; ++it) {
      (*it)->dump();
    }
    for (std::set<std::string>::const_iterator it = vars.begin(),
                                               ie = vars.end();
         it != ie; ++it) {
      llvm::outs() << (*it) << " ";
    }
  }
};

class TxPartitionHelper {
public:
  static std::vector<Partition> partitionOnCond(ref<Expr> cond,
                                                std::vector<ref<Expr> > exprs);
  static std::vector<Partition> partition(std::vector<ref<Expr> > exprs);

  static ref<Expr> createAnd(std::vector<ref<Expr> > exprs);
  static ref<Expr> createAnd(std::set<ref<Expr> > exprs);
  static void getExprsFromAndExpr(ref<Expr> e, std::vector<ref<Expr> > &exprs);

  static ref<Expr> True() { return ConstantExpr::alloc(1, Expr::Bool); };
  static ref<Expr> False() { return ConstantExpr::alloc(0, Expr::Bool); };

private:
  static void getExprVars(ref<Expr> e, std::set<std::string> &vars);
  static void visit(ref<Expr> node, std::set<ref<Expr> > &currentComp,
                    std::map<ref<Expr>, std::set<ref<Expr> > > &ref2ref,
                    std::set<ref<Expr> > &marked);
  static bool isShared(std::set<std::string> ss1, std::set<std::string> ss2);
};
}
#endif /* TXLIB_CORE_PARTITIONHELPER_H_ */
