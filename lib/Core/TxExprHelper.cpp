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
  ref<Expr> ltex;
  bool eqUpperBound = false;
  ref<Expr> gtex;
  bool eqLowerBound = false;
  float upperBound = std::numeric_limits<float>::max();
  float lowerBound = std::numeric_limits<float>::min();
  for (std::vector<ref<Expr> >::const_iterator it = exprs.begin(),
                                               ie = exprs.end();
       it != ie; ++it) {
    ref<Expr> tmp = TxWPHelper::simplifyWPExpr(*it);

    // if cannot compute the bound then skip
    float bound = getBound(tmp);
    if (bound == std::numeric_limits<float>::max()) {
      ret.push_back(tmp);
      continue;
    }
    switch (tmp->getKind()) {
    case Expr::Ult:
    case Expr::Slt: {
      if (ltex.isNull()) {
        ltex = tmp;
        upperBound = bound;
        eqUpperBound = false;
      } else if (bound < upperBound) {
        // if upper bound is valid and lower than current upper bound
        // then take the new one and update bound
        ltex = tmp;
        upperBound = bound;
        eqUpperBound = false;
      } else {
        ret.push_back(tmp);
      }
      break;
    }

    case Expr::Ule:
    case Expr::Sle: {
      if (ltex.isNull()) {
        ltex = tmp;
        upperBound = bound;
        eqUpperBound = true;
      } else {
        if (bound == upperBound && eqUpperBound == false) {
          eqUpperBound = true;
        } else if (bound < upperBound) {
          ltex = tmp;
          upperBound = bound;
          eqUpperBound = true;
        } else {
          ret.push_back(tmp);
        }
      }
      break;
    }

    case Expr::Ugt:
    case Expr::Sgt: {
      if (ltex.isNull()) {
        gtex = tmp;
        lowerBound = bound;
        eqLowerBound = false;
      } else if (bound > lowerBound) {
        lowerBound = bound;
        gtex = tmp;
        eqLowerBound = false;
      } else {
        ret.push_back(tmp);
      }
      break;
    }

    case Expr::Sge:
    case Expr::Uge: {
      if (ltex.isNull()) {
        gtex = tmp;
        eqLowerBound = true;
      } else {
        if (bound == lowerBound && eqLowerBound == false) {
          eqLowerBound = true;
        } else if (bound > lowerBound) {
          gtex = tmp;
          lowerBound = bound;
          eqLowerBound = true;
        } else {
          ret.push_back(tmp);
        }
      }
      break;
    }
    default:
      ret.push_back(tmp);
    }
  }

  if (!ltex.isNull())
    ret.push_back(ltex);
  if (!gtex.isNull())
    ret.push_back(gtex);
  return ret;
}

float TxExprHelper::getBound(ref<Expr> e) {
  float bound = std::numeric_limits<float>::max();
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
    if (isaVar(left) && isa<ConstantExpr>(right)) {
      ref<ConstantExpr> boundEx = dyn_cast<ConstantExpr>(right);
      bound = (float)boundEx->getZExtValue();
    }
  }
  }
  return bound;
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
