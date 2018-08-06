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

ref<Expr> TxExprHelper::singleSimplify(ref<Expr> e) {}

ref<Expr> TxExprHelper::CONST_REF = ConstantExpr::create(1, Expr::Int32);

/**
 * Remove Not() at the beginning if possible
 */
ref<Expr> TxExprHelper::simplifyNot(ref<Expr> e) {
  ref<Expr> ret;
  if (e->getKind() == Expr::Not) {
    ref<Expr> inExpr = e->getKid(0);
    switch (inExpr->getKind()) {
    case Expr::Ne: {
      ref<Expr> kids[2];
      kids[0] = inExpr->getKid(0);
      kids[1] = inExpr->getKid(1);
      ret = EqExpr::create(kids[0], kids[1]);
      break;
    }
    case Expr::Sle: {
      ref<Expr> kids[2];
      kids[0] = inExpr->getKid(0);
      kids[1] = inExpr->getKid(1);
      ret = SgtExpr::create(kids[0], kids[1]);
      break;
    }
    case Expr::Slt: {
      ref<Expr> kids[2];
      kids[0] = inExpr->getKid(0);
      kids[1] = inExpr->getKid(1);
      ret = SgeExpr::create(kids[0], kids[1]);
      break;
    }
    case Expr::Sge: {
      ref<Expr> kids[2];
      kids[0] = inExpr->getKid(0);
      kids[1] = inExpr->getKid(1);
      ret = SltExpr::create(kids[0], kids[1]);
      break;
    }
    case Expr::Sgt: {
      ref<Expr> kids[2];
      kids[0] = inExpr->getKid(0);
      kids[1] = inExpr->getKid(1);
      ret = SleExpr::create(kids[0], kids[1]);
      break;
    }
    case Expr::Ule: {
      ref<Expr> kids[2];
      kids[0] = inExpr->getKid(0);
      kids[1] = inExpr->getKid(1);
      ret = UgtExpr::create(kids[0], kids[1]);
      break;
    }
    case Expr::Ult: {
      ref<Expr> kids[2];
      kids[0] = inExpr->getKid(0);
      kids[1] = inExpr->getKid(1);
      ret = UgeExpr::create(kids[0], kids[1]);
      break;
    }
    case Expr::Uge: {
      ref<Expr> kids[2];
      kids[0] = inExpr->getKid(0);
      kids[1] = inExpr->getKid(1);
      ret = UltExpr::create(kids[0], kids[1]);
      break;
    }
    case Expr::Ugt: {
      ref<Expr> kids[2];
      kids[0] = inExpr->getKid(0);
      kids[1] = inExpr->getKid(1);
      ret = UleExpr::create(kids[0], kids[1]);
      break;
    }
    default: {
      ret = e;
      break;
    }
    }
  } else {
    ret = e;
  }

  //  llvm::outs() << "\n------TxExprHelper::simplifyNot-------\n";
  //  e->dump();
  //  ret->dump();
  //  llvm::outs() << "\n===============\n";
  return ret;
}

ref<Expr> TxExprHelper::simplifyLinear(ref<Expr> e) {

  switch (e->getKind()) {
  case Expr::And: {
    ref<Expr> kids[2];
    kids[0] = simplifyLinear(e->getKid(0));
    kids[1] = simplifyLinear(e->getKid(1));
    return e->rebuild(kids);
  }
  case Expr::Eq:
  case Expr::Ne:
  case Expr::Ult:
  case Expr::Ule:
  case Expr::Ugt:
  case Expr::Uge:
  case Expr::Slt:
  case Expr::Sle:
  case Expr::Sgt:
  case Expr::Sge: {
    std::map<ref<Expr>, int> ref2coeff;
    ref<Expr> left = e->getKid(0);
    ref<Expr> right = e->getKid(1);

    bool b1 = extractCoeff(left, 1, ref2coeff);

    //    llvm::outs() << "\n------TxExprHelper::simplifyLinear::left-------\n";
    //    llvm::outs() << "[E]:\n";
    //    e->dump();
    //    llvm::outs() << "Left:\n";
    //    left->dump();
    //    for (std::map<ref<Expr>, int>::const_iterator it = ref2coeff.begin(),
    //                                                  ie = ref2coeff.end();
    //         it != ie; ++it) {
    //      llvm::outs() << "First:\n";
    //      it->first->dump();
    //      llvm::outs() << "Second:" << it->second << "\n";
    //    }
    //    llvm::outs() << "\n===============\n";

    if (!b1)
      return e;
    bool b2 = extractCoeff(right, -1, ref2coeff);

    //    llvm::outs() << "\n------TxExprHelper::simplifyLinear-------\n";
    //    llvm::outs() << "Left:\n";
    //    left->dump();
    //    llvm::outs() << "Right:\n";
    //    right->dump();
    //    for (std::map<ref<Expr>, int>::const_iterator it = ref2coeff.begin(),
    //                                                  ie = ref2coeff.end();
    //         it != ie; ++it) {
    //      llvm::outs() << "First:\n";
    //      it->first->dump();
    //      llvm::outs() << "Second:" << it->second << "\n";
    //    }
    //    llvm::outs() << "\n===============\n";

    if (!b2) {
      return e;
    }

    //    llvm::outs() << "\n------TxExprHelper::simplifyLinear-------\n";
    //    llvm::outs() << "e:\n";
    //    e->dump();
    //    llvm::outs() << "makeExpr(e, ref2coeff):\n";
    //    makeExpr(e, ref2coeff)->dump();
    //    llvm::outs() << "\n===============\n";
    return makeExpr(e, ref2coeff);
  }
  default:
    return e;
  }
}

/**
 * Create a map from var -> coeff
 */
bool TxExprHelper::extractCoeff(ref<Expr> e, int mul,
                                std::map<ref<Expr>, int> &ref2coeff) {

  if (isaVar(e)) {
    ref2coeff[e] = ref2coeff[e] + mul;
    return true;
  } else {
    switch (e->getKind()) {
    case Expr::Constant: {
      ref<ConstantExpr> coeff = dyn_cast<ConstantExpr>(e);
      ref2coeff[CONST_REF] = ref2coeff[CONST_REF] + coeff->getZExtValue() * mul;
      return true;
    }
    case Expr::Mul: {
      ref<Expr> kids[2];
      kids[0] = e->getKid(0);
      kids[1] = e->getKid(1);
      if (isa<ConstantExpr>(kids[0]) && isaVar(kids[1])) {
        ref<ConstantExpr> coeff = dyn_cast<ConstantExpr>(kids[0]);
        ref2coeff[kids[1]] = ref2coeff[kids[1]] + coeff->getZExtValue() * mul;
        return true;
      } else if (isa<ConstantExpr>(kids[1]) && isaVar(kids[0])) {
        ref<ConstantExpr> coeff = dyn_cast<ConstantExpr>(kids[1]);
        ref2coeff[kids[0]] = ref2coeff[kids[0]] + coeff->getZExtValue() * mul;
        return true;
      } else {
        return false;
      }
    }
    case Expr::Add: {
      ref<Expr> kids[2];
      kids[0] = e->getKid(0);
      kids[1] = e->getKid(1);
      bool b1 = extractCoeff(kids[0], mul, ref2coeff);
      if (!b1)
        return false;
      bool b2 = extractCoeff(kids[1], mul, ref2coeff);
      if (!b2)
        return false;
      return true;
    }
    case Expr::Sub: {
      ref<Expr> kids[2];
      kids[0] = e->getKid(0);
      kids[1] = e->getKid(1);
      bool b1 = extractCoeff(kids[0], mul, ref2coeff);
      if (!b1)
        return false;
      bool b2 = extractCoeff(kids[1], -mul, ref2coeff);
      if (!b2)
        return false;
      return true;
    }
    default: { return false; }
    }
  }
}

ref<Expr> TxExprHelper::makeExpr(ref<Expr> e,
                                 std::map<ref<Expr>, int> &ref2coeff) {
  std::vector<ref<Expr> > pos;
  std::vector<ref<Expr> > neg;
  int c = 0;
  for (std::map<ref<Expr>, int>::const_iterator it = ref2coeff.begin(),
                                                ie = ref2coeff.end();
       it != ie; ++it) {
    if (it->first == CONST_REF) { // CONST
      c = it->second;
    } else { // VAR
      if (it->second > 0) {
        ref<Expr> tmp =
            (it->second == 1)
                ? it->first
                : MulExpr::create(ConstantExpr::create(it->second, Expr::Int32),
                                  it->first);
        pos.push_back(tmp);
      } else if (it->second < 0) {
        // convert to positive coeff and sub
        uint32_t uc = -(it->second);
        ref<Expr> tmp =
            (uc == 1) ? it->first
                      : MulExpr::create(ConstantExpr::create(uc, Expr::Int32),
                                        it->first);
        neg.push_back(tmp);
      }
    }
  }

  ref<Expr> kids[2];
  // if no positive coeff then use for kids[1]
  if (pos.size() == 0) {
    if (neg.size() == 0) {
      klee_warning(
          "TxExprHelper::makeExpr: There is no variable in expression!");
      return e;
    }
    // add all neg to the right hand side
    std::vector<ref<Expr> >::const_iterator it = neg.begin();
    kids[1] = *(it);
    std::advance(it, 1);
    if (neg.size() >= 1) {
      for (; it != neg.end(); ++it) {
        kids[1] = AddExpr::create(kids[1], (*it));
      }
    }
  } else {
    // add pos to the left hand side
    std::vector<ref<Expr> >::const_iterator it = pos.begin();
    kids[0] = *(it);
    std::advance(it, 1);
    if (neg.size() >= 1) {
      for (; it != neg.end(); ++it) {
        kids[0] = AddExpr::create(kids[0], (*it));
      }
    }
    // sub neg to the left hand side
    for (std::vector<ref<Expr> >::const_iterator it = neg.begin(),
                                                 ie = neg.end();
         it != ie; ++it) {
      kids[0] = SubExpr::create(kids[0], (*it));
    }
  }

  //  llvm::outs() << "\n------TxExprHelper::makeExpr-------\n";
  //  if (!kids[0].isNull())
  //    kids[0]->dump();
  //  else
  //    llvm::outs() << "kids[0] is null\n";
  //  llvm::outs() << "\n---------------\n";
  //  if (!kids[1].isNull())
  //    kids[1]->dump();
  //  else
  //    llvm::outs() << "kids[1] is null\n";
  //  llvm::outs() << "\n===============\n";

  if (c > 0) { // add to left
    ref<Expr> cExpr = ConstantExpr::create(c, Expr::Int32);
    kids[0] = kids[0].isNull() ? cExpr : AddExpr::create(kids[0], cExpr);
  } else if (c < 0) { // add to right
    uint32_t tmpc = -c;
    ref<Expr> ce = ConstantExpr::create(tmpc, Expr::Int32);
    kids[1] = kids[1].isNull() ? ce : AddExpr::create(kids[1], ce);
  }

  if (kids[0].isNull()) {
    kids[0] = ConstantExpr::create(0, Expr::Int32);
  }
  if (kids[1].isNull()) {
    kids[1] = ConstantExpr::create(0, Expr::Int32);
  }

  //  llvm::outs() << "\n------TxExprHelper::makeExpr-------\n";
  //  if (!kids[0].isNull())
  //    kids[0]->dump();
  //  llvm::outs() << "\n---------------\n";
  //  if (!kids[1].isNull())
  //    kids[1]->dump();
  //  llvm::outs() << "\n===============\n";

  return e->rebuild(kids);
}

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
