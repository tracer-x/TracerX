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

ref<Expr> TxExprHelper::CONST_REF = ConstantExpr::create(1, Expr::Int32);

/**
 * Remove Not() at the beginning if possible
 */
ref<Expr> TxExprHelper::simplifyNot(ref<Expr> e) {

  ref<Expr> ret;
  if (e->getKind() == Expr::Not) {
    ref<Expr> inExpr = e->getKid(0);
    switch (inExpr->getKind()) {
    case Expr::Eq: {
      ref<Expr> kids[2];
      kids[0] = inExpr->getKid(0);
      kids[1] = inExpr->getKid(1);
      ret = NeExpr::create(kids[0], kids[1]);
      break;
    }
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

  return ret;
}

ref<Expr> TxExprHelper::simplifyLinear(ref<Expr> e) {

  switch (e->getKind()) {
  case Expr::And: {
    ref<Expr> kids[2];
    kids[0] = simplifyLinear(e->getKid(0));
    kids[1] = simplifyLinear(e->getKid(1));
    if (kids[0] == kids[1]) {
      return kids[0];
    }
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
    if (!b1)
      return e;

    bool b2 = extractCoeff(right, -1, ref2coeff);
    if (!b2) {
      return e;
    }

    //    llvm::outs() << "== begin simplifyLinear ==\n";
    //    e->dump();
    //    llvm::outs() << "---\n";
    //    for (std::map<ref<Expr>, int>::iterator it = ref2coeff.begin(),
    //                                            ie = ref2coeff.end();
    //         it != ie; ++it) {
    //      it->first->dump();
    //      llvm::outs() << it->second << "\n";
    //    }
    //    llvm::outs() << "== end simplifyLinear ==\n";
    return makeExpr(e, ref2coeff);
  }
  default:
    return e;
  }
}

/**
 * Create a map from var -> coeff
 * mul = 1 or -1
 * Return: true if input is linear, false otherwise
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

  //  llvm::outs() << "********\n";
  //  e->dump();
  //  for (std::map<ref<Expr>, int>::iterator it = ref2coeff.begin(),
  //                                          ie = ref2coeff.end();
  //       it != ie; ++it) {
  //    it->first->dump();
  //    llvm::outs() << it->second << "\n---\n";
  //  }
  //
  //  llvm::outs() << "========\n";

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
    if (neg.size() > 1) {
      for (; it != neg.end(); ++it) {
        kids[1] = AddExpr::create(kids[1], (*it));
      }
    }
  } else {
    // add pos to the left hand side
    std::vector<ref<Expr> >::const_iterator it = pos.begin();
    kids[0] = *(it);
    std::advance(it, 1);
    if (neg.size() > 1) {
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
  return e->rebuild(kids);
}

/**
 * Simplify single expression based on range
 */
ref<Expr> TxExprHelper::rangSimplify(ref<Expr> e) {
  // collect AndExpr
  std::vector<ref<Expr> > andExprs = TxPartitionHelper::getExprsFromAndExpr(e);
  std::vector<ref<Expr> > es = rangeSimplifyFromExprs(andExprs);
  return TxPartitionHelper::createAnd(es);
}

/**
 * Simplify multiple expressions on range
 */
std::vector<ref<Expr> >
TxExprHelper::rangeSimplifyFromExprs(std::vector<ref<Expr> > exprs) {
  std::vector<ref<Expr> > ret;

  // combine expressions sharing 1 variable into 1 entry, others are kept in ret
  std::map<std::string, std::vector<ref<Expr> > > var2refs;
  for (std::vector<ref<Expr> >::const_iterator it = exprs.begin(),
                                               ie = exprs.end();
       it != ie; ++it) {
    std::set<std::string> vars = TxPartitionHelper::getExprVars(*it);
    if (vars.size() == 1) {
      var2refs[*vars.begin()].push_back(*it);
    } else {
      ret.push_back(*it);
    }
  }

  // simplify vector of expressions in each entry
  for (std::map<std::string, std::vector<ref<Expr> > >::const_iterator
           mapIt = var2refs.begin(),
           mapIe = var2refs.end();
       mapIt != mapIe; ++mapIt) {
    if (mapIt->second.size() > 1) {
      std::vector<ref<Expr> > sv = combineSharedSingleVarExprs(mapIt->second);
      ret.insert(ret.begin(), sv.begin(), sv.end());
    } else {
      ret.insert(ret.begin(), mapIt->second.begin(), mapIt->second.end());
    }
  }

  return ret;
}

std::vector<ref<Expr> >
TxExprHelper::rangeSimplifyFromExprs(std::set<ref<Expr> > exprs) {
  std::vector<ref<Expr> > ret;

  // combine expressions sharing 1 variable into 1 entry, others are kept in ret
  std::map<std::string, std::vector<ref<Expr> > > var2refs;
  for (std::set<ref<Expr> >::const_iterator it = exprs.begin(),
                                            ie = exprs.end();
       it != ie; ++it) {
    std::set<std::string> vars = TxPartitionHelper::getExprVars(*it);
    if (vars.size() == 1) {
      var2refs[*vars.begin()].push_back(*it);
    } else {
      ret.push_back(*it);
    }
  }

  // simplify vector of expressions in each entry
  for (std::map<std::string, std::vector<ref<Expr> > >::const_iterator
           mapIt = var2refs.begin(),
           mapIe = var2refs.end();
       mapIt != mapIe; ++mapIt) {
    if (mapIt->second.size() > 1) {
      std::vector<ref<Expr> > sv = combineSharedSingleVarExprs(mapIt->second);
      ret.insert(ret.begin(), sv.begin(), sv.end());
    } else {
      ret.insert(ret.begin(), mapIt->second.begin(), mapIt->second.end());
    }
  }

  return ret;
}

std::vector<ref<Expr> >
TxExprHelper::combineSharedSingleVarExprs(std::vector<ref<Expr> > exprs) {
  std::vector<ref<Expr> > ret;
  Bound upper;
  Bound lower;
  for (std::vector<ref<Expr> >::const_iterator it = exprs.begin(),
                                               ie = exprs.end();
       it != ie; ++it) {
    Bound b = getBound(*it);

    if (b.type == Bound::invalid) {
      ret.push_back(*it);
      //      llvm::outs() <<
      //      "\n----TxExprHelper::combineSharedSingleVarExprs::Bound::"
      //                      "invalid----\n";
    } else if (b.type == Bound::lt) {
      // update upper bound if applicable
      if (upper.type == Bound::invalid ||
          (upper.type == Bound::lt && b.value < upper.value) ||
          (upper.type == Bound::le && b.value <= upper.value)) {
        upper = b;
      }
      //      llvm::outs()
      //          <<
      // "\n----TxExprHelper::combineSharedSingleVarExprs::Bound::lt----\n";
    } else if (b.type == Bound::le) {
      // update upper bound if applicable
      if (upper.type == Bound::invalid || b.value < upper.value) {
        upper = b;
      }
      //      llvm::outs()
      //          <<
      // "\n----TxExprHelper::combineSharedSingleVarExprs::Bound::le----\n";
    } else if (b.type == Bound::gt) {
      // update lower bound if applicable
      if (lower.type == Bound::invalid ||
          (lower.type == Bound::gt && b.value > lower.value) ||
          (lower.type == Bound::ge && b.value >= lower.value)) {
        lower = b;
      }
      //      llvm::outs()
      //          <<
      // "\n----TxExprHelper::combineSharedSingleVarExprs::Bound::gt----\n";
    } else if (b.type == Bound::ge) {

      // update lower bound if applicable
      if (lower.type == Bound::invalid || b.value > lower.value) {
        lower = b;
      }
    }
  }

  if (upper.type != Bound::invalid)
    ret.push_back(upper.e);
  if (lower.type != Bound::invalid)
    ret.push_back(lower.e);

  return ret;
}

Bound TxExprHelper::getBound(ref<Expr> e) {
  Bound b;
  bool isValidExpr = false;
  float c = 0;
  float coeff = 0;
  std::map<ref<Expr>, int> ref2coeff;
  switch (e->getKind()) {
  case Expr::Ult:
  case Expr::Slt:
  case Expr::Ule:
  case Expr::Sle:
  case Expr::Ugt:
  case Expr::Sgt:
  case Expr::Sge:
  case Expr::Uge: {
    isValidExpr = true;
    ref<Expr> left = e->getKid(0);
    ref<Expr> right = e->getKid(1);
    extractCoeff(left, 1, ref2coeff);
    extractCoeff(right, -1, ref2coeff);
    for (std::map<ref<Expr>, int>::const_iterator it = ref2coeff.begin(),
                                                  ie = ref2coeff.end();
         it != ie; ++it) {
      if (it->first == CONST_REF) { // CONST
        c = it->second;
      } else if (isaVar(it->first)) {
        coeff = it->second;
      }
    }
    break;
  }
  default: {
    isValidExpr = false;
    break;
  }
  }

  if (!isValidExpr) {
    b.type = Bound::invalid;
    return b;
  }
  if (coeff == 0.0) {
    klee_warning("TxExprHelper::getBound: There is no var in the expression!");
    b.type = Bound::invalid;
    return b;
  }

  float val = -c / coeff;

  switch (e->getKind()) {
  case Expr::Ult:
  case Expr::Slt: {
    if (coeff > 0) {
      b.type = Bound::lt;
    } else {
      b.type = Bound::gt;
    }
    b.value = val;
    break;
  }
  case Expr::Ule:
  case Expr::Sle: {
    if (coeff > 0) {
      b.type = Bound::le;
    } else {
      b.type = Bound::ge;
    }
    b.value = val;
    break;
  }
  case Expr::Ugt:
  case Expr::Sgt: {
    if (coeff > 0) {
      b.type = Bound::gt;
    } else {
      b.type = Bound::lt;
    }
    b.value = val;
    break;
  }
  case Expr::Sge:
  case Expr::Uge: {
    if (coeff > 0) {
      b.type = Bound::ge;
    } else {
      b.type = Bound::le;
    }
    b.value = val;
    break;
  }
  default: { break; }
  }
  b.e = e;

  return b;
}

bool TxExprHelper::isaVar(ref<Expr> e) {
  bool ret = false;
  if (e->getKind() == Expr::Concat) {
    if (isa<ReadExpr>(e->getKid(0)) || isa<WPVarExpr>(e->getKid(0))) {
      ret = true;
    }
  }
  if (e->getKind() == Expr::WPVar) {
    ret = true;
  }

  return ret;
}

// bool TxExprHelper::isFalse(ref<Expr> e) {
//  if (e->getKind() == Expr::Constant) {
//    ConstantExpr *ce = dyn_cast<ConstantExpr>(e);
//    bool ret = ce->getZExtValue(1);
//    return !ret;
//  }
//  return false;
//}

// ref<Expr>
// TxExprHelper::removeShadowExprs(ref<Expr> e,
//                                std::set<const Array *> shadowArrays) {
//  switch (e->getKind()) {
//  case Expr::InvalidKind:
//  case Expr::Constant: {
//    return e;
//  }
//
//  case Expr::Read: {
//    const Array *arr = llvm::dyn_cast<ReadExpr>(e)->getArray();
//    if (shadowArrays.find(arr) == shadowArrays.end())
//      return e;
//    else
//      return NULL;
//  }
//  case Expr::Concat: {
//    ref<ConcatExpr> concatVar = llvm::dyn_cast<ConcatExpr>(e);
//    const Array *arr =
//        llvm::dyn_cast<ReadExpr>(concatVar->getLeft())->getArray();
//    if (shadowArrays.find(arr) == shadowArrays.end())
//      return e;
//    else
//      return NULL;
//  }
//
//  case Expr::NotOptimized:
//  case Expr::Not:
//  case Expr::Extract:
//  case Expr::ZExt:
//  case Expr::SExt: {
//    // Extract the one kid and extract variable from that
//    ref<Expr> kid;
//    kid = e->getKid(0);
//    ref<Expr> newE = removeShadowExprs(kid, shadowArrays);
//    if (!newE.isNull())
//      return e;
//    else
//      return NULL;
//  }
//
//  case Expr::Eq:
//  case Expr::Ne:
//  case Expr::Ult:
//  case Expr::Ule:
//  case Expr::Ugt:
//  case Expr::Uge:
//  case Expr::Slt:
//  case Expr::Sle:
//  case Expr::Sgt:
//  case Expr::Sge:
//  case Expr::Add:
//  case Expr::Sub:
//  case Expr::Mul:
//  case Expr::UDiv:
//  case Expr::SDiv:
//  case Expr::URem:
//  case Expr::SRem:
//  case Expr::And:
//  case Expr::Or:
//  case Expr::Xor:
//  case Expr::Shl:
//  case Expr::LShr:
//  case Expr::AShr: {
//    // Extract the two kids and extract variable from that
//    ref<Expr> kids[2];
//    kids[0] = e->getKid(0);
//    kids[1] = e->getKid(1);
//    ref<Expr> newE1 = removeShadowExprs(kids[0], shadowArrays);
//    ref<Expr> newE2 = removeShadowExprs(kids[1], shadowArrays);
//    if (!newE1.isNull() && !newE2.isNull())
//      return e;
//    else
//      return NULL;
//  }
//
//  case Expr::Select: {
//    // Extract the three kids and extract variable from that
//    ref<Expr> kids[3];
//    kids[0] = e->getKid(0);
//    kids[1] = e->getKid(1);
//    kids[2] = e->getKid(2);
//    ref<Expr> newE1 = removeShadowExprs(kids[0], shadowArrays);
//    ref<Expr> newE2 = removeShadowExprs(kids[1], shadowArrays);
//    ref<Expr> newE3 = removeShadowExprs(kids[2], shadowArrays);
//    if (!newE1.isNull() && !newE2.isNull() && !newE3.isNull())
//      return e;
//    else
//      return NULL;
//  }
//  default:
//    klee_error(
//        "TxExprHelper::removeShadowExprs Control should not reach here!");
//    break;
//  }
//  return e;
//}

// void TxExprHelper::extractArrays(ref<Expr> e,
//                                 std::set<const Array *> &readArrays) {
//  switch (e->getKind()) {
//  case Expr::InvalidKind:
//  case Expr::Constant: {
//    break;
//  }
//
//  case Expr::Read: {
//    ReadExpr *readExpr = llvm::dyn_cast<ReadExpr>(e);
//    readArrays.insert(readExpr->getArray());
//    break;
//  }
//  case Expr::Concat: {
//    ref<ConcatExpr> concatVar = llvm::dyn_cast<ConcatExpr>(e);
//    readArrays.insert(
//        llvm::dyn_cast<ReadExpr>(concatVar->getLeft())->getArray());
//    break;
//  }
//
//  case Expr::NotOptimized:
//  case Expr::Not:
//  case Expr::Extract:
//  case Expr::ZExt:
//  case Expr::SExt: {
//    // Extract the one kid and extract variable from that
//    ref<Expr> kids[1];
//    kids[0] = e->getKid(0);
//    extractArrays(kids[0], readArrays);
//    break;
//  }
//
//  case Expr::Eq:
//  case Expr::Ne:
//  case Expr::Ult:
//  case Expr::Ule:
//  case Expr::Ugt:
//  case Expr::Uge:
//  case Expr::Slt:
//  case Expr::Sle:
//  case Expr::Sgt:
//  case Expr::Sge:
//  case Expr::Add:
//  case Expr::Sub:
//  case Expr::Mul:
//  case Expr::UDiv:
//  case Expr::SDiv:
//  case Expr::URem:
//  case Expr::SRem:
//  case Expr::And:
//  case Expr::Or:
//  case Expr::Xor:
//  case Expr::Shl:
//  case Expr::LShr:
//  case Expr::AShr: {
//    // Extract the two kids and extract variable from that
//    ref<Expr> kids[2];
//    kids[0] = e->getKid(0);
//    kids[1] = e->getKid(1);
//    extractArrays(kids[0], readArrays);
//    extractArrays(kids[1], readArrays);
//    break;
//  }
//
//  case Expr::Select: {
//    // Extract the three kids and extract variable from that
//    ref<Expr> kids[3];
//    kids[0] = e->getKid(0);
//    kids[1] = e->getKid(1);
//    kids[2] = e->getKid(2);
//    extractArrays(kids[0], readArrays);
//    extractArrays(kids[1], readArrays);
//    extractArrays(kids[2], readArrays);
//    break;
//  }
//  default:
//    break;
//  }
//}
} // namespace klee
