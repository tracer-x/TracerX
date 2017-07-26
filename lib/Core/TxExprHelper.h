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
  enum BType { invalid, lt, le, gt, ge };
  ref<Expr> e;
  BType type;
  float value;
  Bound() {
    value = std::numeric_limits<float>::max();
    type = invalid;
  }
};

class TxExprHelper {
private:
  static ref<Expr> CONST_REF;

public:
  //  TxExprHelper();
  //  virtual ~TxExprHelper();

  static ref<Expr> simplifyNot(ref<Expr> e);

  // If input is linear, combine coefficient of same variable togethers
  // eg: 2X + 4X + 3Y - 2 < 8 is siplied to
  // 6X + 3Y < 10
  static ref<Expr> simplifyLinear(ref<Expr> e);
  static bool extractCoeff(ref<Expr> e, int mul,
                           std::map<ref<Expr>, int> &ref2coeff);
  static ref<Expr> makeExpr(ref<Expr> e, std::map<ref<Expr>, int> &ref2coeff);

  static ref<Expr> rangSimplify(ref<Expr> e);
  static std::vector<ref<Expr> >
  rangeSimplifyFromExprs(std::vector<ref<Expr> > exprs);
  static std::vector<ref<Expr> >
  rangeSimplifyFromExprs(std::set<ref<Expr> > exprs);
  static std::vector<ref<Expr> >
  combineSharedSingleVarExprs(std::vector<ref<Expr> > exprs);
  static Bound getBound(ref<Expr> expr);
  static bool isaVar(ref<Expr> e);
  //  static bool isFalse(ref<Expr> e);

  //  static ref<Expr> removeShadowExprs(ref<Expr> e,
  //                                     std::set<const Array *> shadowArrays);

  //  static void extractArrays(ref<Expr> e, std::set<const Array *>
  //  &readArrays);
};
}
#endif /* LIB_CORE_TXEXPRHELPER_H_ */
