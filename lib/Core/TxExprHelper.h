//===-- TxExprHelper.h - Tracer-X symbolic execution tree -------------*- C++
//-*-===//
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

#ifndef LIB_CORE_TXEXPRHELPER_H_
#define LIB_CORE_TXEXPRHELPER_H_

#include "TxPartitionHelper.h"
#include "TxWPHelper.h"
#include <iostream>
#include <limits>
#include <map>
#include <set>
#include <string>

namespace klee {
class Bound {
public:
  float value;
  bool isEq;
  Bound() {
    value = std::numeric_limits<float>::max();
    isEq = false;
  }
};

class TxExprHelper {
private:
  static ref<Expr> CONST_REF;

public:
  TxExprHelper();
  virtual ~TxExprHelper();

  static ref<Expr> singleSimplify(ref<Expr> e);
  static ref<Expr> simplifyNot(ref<Expr> e);
  static ref<Expr> simplifyLinear(ref<Expr> e);
  static bool extractCoeff(ref<Expr> e, int mul,
                           std::map<ref<Expr>, int> &ref2coeff);
  static ref<Expr> makeExpr(ref<Expr> e,
                            std::map<ref<Expr>, int> &ref2coeff);

  static ref<Expr> multipleSimplify(ref<Expr> expr);

  static std::vector<ref<Expr> > simplify(std::set<ref<Expr> > exprs);
  static std::vector<ref<Expr> > rangeSimplify(std::vector<ref<Expr> > exprs);
  static float getBound(ref<Expr> expr);
  static bool isaVar(ref<Expr> e);
};
}
#endif /* LIB_CORE_TXEXPRHELPER_H_ */
