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

template <class T> class Partition {
public:
  std::set<T> exprs;
  std::set<std::string> vars;
  void print() {
    for (typename std::set<T>::const_iterator it = exprs.begin(),
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
  static std::vector<Partition<ref<Expr> > >
  partitionExprsOnCond(ref<Expr> cond, std::vector<ref<Expr> > exprs);
  static std::vector<Partition<ref<Expr> > >
  partitionExprs(std::vector<ref<Expr> > exprs);

  static std::vector<Partition<ref<TxAllocationContext> > >
  partitionConAddStore(TxStore::TopInterpolantStore conAddStore);
  static std::vector<Partition<ref<TxAllocationContext> > >
  partitionConAddStoreOnCond(ref<Expr> cond,
                             TxStore::TopInterpolantStore conAddStore);

  static ref<Expr> createAnd(std::vector<ref<Expr> > exprs);
  static ref<Expr> createAnd(std::set<ref<Expr> > exprs);
  static void getExprsFromAndExpr(ref<Expr> e, std::vector<ref<Expr> > &exprs);

  static ref<Expr> True() { return ConstantExpr::alloc(1, Expr::Bool); };
  static ref<Expr> False() { return ConstantExpr::alloc(0, Expr::Bool); };

  static void getExprVars(ref<Expr> e, std::set<std::string> &vars);
  static bool isShared(std::set<std::string> ss1, std::set<std::string> ss2);

  template <class T>
  static std::vector<std::set<T> >
  findConnectedComps(std::map<T, std::set<T> > graph);
  template <class T>
  static void visit(T node, std::set<T> &curComp,
                    std::map<T, std::set<T> > &graph, std::set<T> &marked);
};
}
#endif /* TXLIB_CORE_PARTITIONHELPER_H_ */
