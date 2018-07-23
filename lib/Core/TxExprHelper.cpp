//===-- TxExprRangeHelper.cpp - Tracer-X symbolic execution tree -------------*-
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
/// This file contains implementation of the classes that support for
/// simplifying expr
///
//===----------------------------------------------------------------------===//

#include "TxExprHelper.h"

namespace klee {

std::vector<ref<Expr> > TxExprHelper::simplify(std::set<ref<Expr> > exprs) {
  std::vector<ref<Expr> > ret;

  // combine expressions sharing 1 variable
  std::map<std::string, std::vector<ref<Expr> > > var2ref;
  std::set<std::string> vars;
  for (std::set<ref<Expr> >::const_iterator it = exprs.begin(),
                                            ie = exprs.end();
       it != ie; ++it) {
    TxPartitionHelper::getExprVars(*it, vars);
    if (vars.size() == 1) {
      var2ref[*vars.begin()].push_back(*it);
    } else {
      ret.push_back(*it);
    }
  }

  // simplify and insert to ret
  for (std::map<std::string, std::vector<ref<Expr> > >::const_iterator
           mapIt = var2ref.begin(),
           mapIe = var2ref.end();
       mapIt != mapIe; ++mapIt) {
    std::vector<ref<Expr> > sv = rangeSimplify(mapIt->second);
    ret.insert(ret.begin(), sv.begin(), sv.end());
  }

  return ret;
}

std::vector<ref<Expr> >
TxExprHelper::rangeSimplify(std::vector<ref<Expr> > exprs) {
  std::vector<ref<Expr> > ret;
  for (std::vector<ref<Expr> >::const_iterator it = exprs.begin(),
                                               ie = exprs.end();
       it != ie; ++it) {
    ret.push_back(*it);
  }
  return ret;
}
}
