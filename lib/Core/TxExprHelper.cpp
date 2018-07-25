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
    if (mapIt->second.size() > 1) {
      std::vector<ref<Expr> > sv = rangeSimplify(mapIt->second);
      ret.insert(ret.begin(), sv.begin(), sv.end());
    } else {
      ret.insert(ret.begin(), mapIt->second.begin(), mapIt->second.end());
    }
  }
  return ret;
}

std::vector<ref<Expr> >
TxExprHelper::rangeSimplify(std::vector<ref<Expr> > exprs) {
  std::vector<ref<Expr> > ret;
  ref<Expr> less;
  Bound upper;
  ref<Expr> greater;
  Bound lower;

  //  bool eqUpperBound = false;
  //  bool eqLowerBound = false;
  //  float upperBound = std::numeric_limits<float>::max();
  //  float lowerBound = std::numeric_limits<float>::min();
  for (std::vector<ref<Expr> >::const_iterator it = exprs.begin(),
                                               ie = exprs.end();
       it != ie; ++it) {
    ref<Expr> tmp = TxWPHelper::simplifyWPExpr(*it);

    // if cannot compute the bound then skip
    float boundVal = getBound(tmp);
    if (boundVal == std::numeric_limits<float>::max()) {
      ret.push_back(tmp);
      continue;
    }
    switch (tmp->getKind()) {
    case Expr::Ult:
    case Expr::Slt: {
      if (less.isNull()) {
        less = tmp;
        upper.value = boundVal;
        upper.isEq = false;
      } else if (boundVal < upper.value) {
        // if upper bound is valid and lower than current upper bound
        // then take the new one and update bound
        less = tmp;
        upper.value = boundVal;
        upper.isEq = false;
      }
      break;
    }
    case Expr::Ule:
    case Expr::Sle: {
      if (less.isNull()) {
        less = tmp;
        upper.value = boundVal;
        upper.isEq = true;
      } else {
        if (boundVal == upper.value && upper.isEq == false) {
          upper.isEq = true;
        } else if (boundVal < upper.value) {
          less = tmp;
          upper.value = boundVal;
          upper.isEq = true;
        }
      }
      break;
    }
    case Expr::Ugt:
    case Expr::Sgt: {
      if (less.isNull()) {
        greater = tmp;
        lower.value = boundVal;
        lower.isEq = false;
      } else if (boundVal > lower.value) {
        greater = tmp;
        lower.value = boundVal;
        lower.isEq = false;
      }
      break;
    }
    case Expr::Sge:
    case Expr::Uge: {
      if (less.isNull()) {
        greater = tmp;
        lower.value = true;
      } else {
        if (boundVal == lower.value && lower.isEq == false) {
          lower.isEq = true;
        } else if (boundVal > lower.value) {
          greater = tmp;
          lower.value = boundVal;
          lower.isEq = true;
        }
      }
      break;
    }
    default:
      ret.push_back(tmp);
    }
  }

  if (!less.isNull())
    ret.push_back(less);
  if (!greater.isNull())
    ret.push_back(greater);
  return ret;
}

float TxExprHelper::getBound(ref<Expr> e) {
  float ret = std::numeric_limits<float>::max();
  switch (e->getKind()) {
  case Expr::Ult:
  case Expr::Slt:
  case Expr::Ule:
  case Expr::Sle:
  case Expr::Ugt:
  case Expr::Sgt:
  case Expr::Sge:
  case Expr::Uge: {
    ref<Expr> left = e->getKid(0);
    ref<Expr> right = e->getKid(1);
    if (isa<ConstantExpr>(right)) {
      float rightVal = dyn_cast<ConstantExpr>(right)->getZExtValue();
      if (isaVar(left)) {
        ret = rightVal;
      } else {
        switch (left->getKind()) {
        case Expr::Mul: {
          ref<Expr> kids[2];
          kids[0] = left->getKid(0);
          kids[1] = left->getKid(1);
          if (isa<ConstantExpr>(kids[0]) && isaVar(kids[1])) {
            float coeff = dyn_cast<ConstantExpr>(kids[0])->getZExtValue();
            ret = rightVal / coeff;
          } else if (isa<ConstantExpr>(kids[1]) && isaVar(kids[0])) {
            float coeff = dyn_cast<ConstantExpr>(kids[1])->getZExtValue();
            ret = rightVal / coeff;
          }
          break;
        }
        }
      }
    }
  }
  }
  return ret;
}

bool TxExprHelper::isaVar(ref<Expr> e) {
  bool ret = false;
  if (e->getKind() == Expr::Concat) {
    if (isa<ReadExpr>(e->getKid(0))) {
      ret = true;
    }
  }
  return ret;
}
}
