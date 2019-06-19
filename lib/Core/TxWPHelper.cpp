//===-- TxWPHelper.cpp - Interpolation tree -------------------------*- C++
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
/// This file contains the implementations of helper function for generating
/// weakest
/// precondition.
///
//===----------------------------------------------------------------------===//

#include "TxWPHelper.h"

namespace klee {

ref<Expr> TxWPHelper::simplifyWPExpr(ref<Expr> e) {
  return e;
  //  klee_error("TxWPHelper::simplifyWPExpr\n");
  //
  //  ref<Expr> result = e;
  //  switch (e->getKind()) {
  //  case Expr::And: {
  //    ref<Expr> kids[2];
  //    kids[0] = e->getKid(0);
  //    kids[1] = e->getKid(1);
  //    kids[0] = simplifyWPExpr(kids[0]);
  //    kids[1] = simplifyWPExpr(kids[1]);
  //    return e->rebuild(kids);
  //  }
  //  case Expr::Eq:
  //  case Expr::Ne: {
  //    ref<Expr> kids[2];
  //    kids[0] = e->getKid(0);
  //    kids[1] = e->getKid(1);
  //    if (kids[0]->getKind() == Expr::Eq || kids[0]->getKind() == Expr::Ne ||
  //        kids[1]->getKind() == Expr::Eq || kids[1]->getKind() == Expr::Ne) {
  //      return e;
  //    }
  //    std::map<ref<Expr>, uint64_t> *newLinearTerm =
  //        new std::map<ref<Expr>, uint64_t>;
  //    if (isa<ConstantExpr>(kids[1])) {
  //      ref<ConstantExpr> constant = dyn_cast<ConstantExpr>(kids[1]);
  //      // TODO: uncomment
  //      //      insertTerm(newLinearTerm, constant->getZExtValue(),
  //      //                 TxWPArrayStore::constValues);
  //    } else {
  //      newLinearTerm = simplifyWPTerm(newLinearTerm, kids[1]);
  //    }
  //    newLinearTerm = simplifyWPTerm(newLinearTerm, kids[0]);
  //    result = convertToExpr(e, newLinearTerm);
  //
  //    delete newLinearTerm;
  //    break;
  //  }
  //  case Expr::Ult:
  //  case Expr::Ule:
  //  case Expr::Ugt:
  //  case Expr::Uge:
  //  case Expr::Slt:
  //  case Expr::Sle:
  //  case Expr::Sgt:
  //  case Expr::Sge: {
  //    ref<Expr> kids[2];
  //    kids[0] = e->getKid(0);
  //    kids[1] = e->getKid(1);
  //    std::map<ref<Expr>, uint64_t> *newLinearTerm =
  //        new std::map<ref<Expr>, uint64_t>;
  //    if (isa<ConstantExpr>(kids[1])) {
  //      ref<ConstantExpr> constant = dyn_cast<ConstantExpr>(kids[1]);
  //      // TODO: uncomment
  //      //      insertTerm(newLinearTerm, constant->getZExtValue(),
  //      //                 TxWPArrayStore::constValues);
  //    } else {
  //      newLinearTerm = simplifyWPTerm(newLinearTerm, kids[1]);
  //    }
  //    newLinearTerm = simplifyWPTerm(newLinearTerm, kids[0]);
  //    result = convertToExpr(e, newLinearTerm);
  //
  //    delete newLinearTerm;
  //    break;
  //  }
  //  case Expr::Constant: {
  //    // Do nothing. The expression is in the form of True or False
  //    break;
  //  }
  //
  //  default: {
  //    klee_message("Error while parsing WP Expression:");
  //    e->dump();
  //    klee_error("All WP Expressions should be in the form LinearTerm CMP "
  //               "Constant. Ex. X + 2Y < 5");
  //  }
  //  }
  //  return result;
}

// std::map<ref<Expr>, uint64_t> *
// TxWPHelper::simplifyWPTerm(std::map<ref<Expr>, uint64_t> *newLinearTerm,
//                           ref<Expr> linearTerm) {
//  klee_error("TxWPHelper::simplifyWPTerm\n");
//  if (isa<ConstantExpr>(linearTerm)) {
//    ref<ConstantExpr> constant = dyn_cast<ConstantExpr>(linearTerm);
//    // TODO: uncomment
//    //    insertTerm(newLinearTerm, (-1) * constant->getZExtValue(),
//    //               TxWPArrayStore::constValues);
//  } else {
//    switch (linearTerm->getKind()) {
//    case Expr::Concat:
//    case Expr::Read: {
//      insertTerm(newLinearTerm, 1, linearTerm);
//      break;
//    }
//    case Expr::Add:
//    case Expr::Sub: {
//      ref<Expr> kids[2];
//      kids[0] = linearTerm->getKid(0);
//      simplifyWPTerm(newLinearTerm, kids[0]);
//      kids[1] = linearTerm->getKid(1);
//      simplifyWPTerm(newLinearTerm, kids[1]);
//      break;
//    }
//    case Expr::Mul:
//    case Expr::UDiv:
//    case Expr::SDiv: {
//      ref<Expr> kids[2];
//      kids[0] = linearTerm->getKid(0);
//      kids[1] = linearTerm->getKid(1);
//      if (isa<ConstantExpr>(kids[0]) && isa<ReadExpr>(kids[1])) {
//        ref<ConstantExpr> coeff = dyn_cast<ConstantExpr>(kids[0]);
//        insertTerm(newLinearTerm, coeff->getZExtValue(), kids[1]);
//      } else {
//        klee_message(
//            "Error while parsing WP Expression. Not in canonical form:");
//        linearTerm->dump();
//        klee_error("The Coefficient should come first. Ex. 2*M");
//      }
//      break;
//    }
//    default: {
//      linearTerm->dump();
//      klee_error("LHS simplification for this term is not implemented yet");
//    }
//    }
//  }
//  return newLinearTerm;
//}

// void TxWPHelper::insertTerm(std::map<ref<Expr>, uint64_t> *newLinearTerm,
//                            uint64_t coeff, const ref<Expr> variable) {
//  std::map<ref<Expr>, uint64_t>::iterator it = newLinearTerm->find(variable);
//  if (it == newLinearTerm->end())
//    newLinearTerm->insert(std::pair<ref<Expr>, uint64_t>(variable, coeff));
//  else
//    it->second = it->second + coeff;
//}

// ref<Expr>
// TxWPHelper::convertToExpr(ref<Expr> e,
//                          std::map<ref<Expr>, uint64_t> *newLinearTerm) {
//  klee_error("TxWPHelper::convertToExpr\n");
//  ref<Expr> kids[2];
//  ref<Expr> temp = ConstantExpr::alloc(0, Expr::Bool);
//  for (std::map<ref<Expr>, uint64_t>::const_iterator
//           it = newLinearTerm->begin(),
//           ie = newLinearTerm->end();
//       it != ie; ++it) {
//    // TODO: uncomment
//    if (it->first == 0) { // == TxWPArrayStore::constValues) {
//      kids[1] = ConstantExpr::create(it->second, Expr::Int32);
//    } else {
//      ref<Expr> lhs;
//      if (it->second == 1) {
//        lhs = it->first;
//      } else {
//        lhs = MulExpr::create(ConstantExpr::create(it->second, Expr::Int32),
//                              it->first);
//      }
//      if (temp == ConstantExpr::alloc(0, Expr::Bool)) {
//        temp = lhs;
//      } else {
//        temp = AddExpr::create(lhs, temp);
//      }
//    }
//  }
//  kids[0] = temp;
//  return e->rebuild(kids);
//}

bool TxWPHelper::isTargetDependent(llvm::Value *inst, ref<Expr> expr) {
  switch (expr->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    return false;
  }

  case Expr::WPVar: {
    ref<WPVarExpr> wp1 = dyn_cast<WPVarExpr>(expr);
    if (wp1->address == inst) {
      return true;
    } else
      return false;
  }

  case Expr::NotOptimized:
  case Expr::Not:
  case Expr::Extract:
  case Expr::ZExt:
  case Expr::SExt: {
    ref<Expr> kids[1];
    kids[0] = expr->getKid(0);
    return isTargetDependent(inst, kids[0]);
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
  case Expr::Sge:
  case Expr::LastKind:
  case Expr::Add:
  case Expr::Sub:
  case Expr::Mul:
  case Expr::UDiv:
  case Expr::SDiv:
  case Expr::URem:
  case Expr::SRem:
  case Expr::And:
  case Expr::Or:
  case Expr::Xor:
  case Expr::Shl:
  case Expr::LShr:
  case Expr::AShr: {
    ref<Expr> kids[2];
    kids[0] = expr->getKid(0);
    kids[1] = expr->getKid(1);
    return (isTargetDependent(inst, kids[0]) ||
            isTargetDependent(inst, kids[1]));
  }

  case Expr::Select: {
    ref<Expr> kids[3];
    kids[0] = expr->getKid(0);
    kids[1] = expr->getKid(1);
    kids[2] = expr->getKid(2);
    return (isTargetDependent(inst, kids[0]) ||
            isTargetDependent(inst, kids[1]) ||
            isTargetDependent(inst, kids[2]));
  }
  case Expr::Upd: {
    ref<Expr> kids[3];
    kids[0] = expr->getKid(0);
    kids[1] = expr->getKid(1);
    kids[2] = expr->getKid(2);
    return (isTargetDependent(inst, kids[0]) ||
            isTargetDependent(inst, kids[1]) ||
            isTargetDependent(inst, kids[2]));
  }
  case Expr::Sel: {
    ref<Expr> kids[2];
    kids[0] = expr->getKid(0);
    kids[1] = expr->getKid(1);
    return (isTargetDependent(inst, kids[0]) ||
            isTargetDependent(inst, kids[1]));
  }
  default: {
    // Sanity check
    expr->dump();
    klee_error("Control should not reach here in "
               "TxWPHelper::isTargetDependent!");
  }
  }
  return false;
}

ref<Expr> TxWPHelper::substituteExpr(ref<Expr> base, const ref<Expr> lhs,
                                     const ref<Expr> rhs) {

  if (rhs.isNull()) {
    return rhs;
  } else if (base.compare(lhs) == 0) { // base case
    return rhs;
  } else {
    switch (base->getKind()) {
    case Expr::InvalidKind:
    case Expr::Constant: {
      return base;
    }

    case Expr::WPVar: {
      ref<WPVarExpr> wp1 = dyn_cast<WPVarExpr>(base);
      ref<WPVarExpr> wp2 = dyn_cast<WPVarExpr>(lhs);
      if (wp1->address == wp2->address) {
        return rhs;
      } else
        return base;
    }

    case Expr::NotOptimized:
    case Expr::Not:
    case Expr::Extract:
    case Expr::ZExt:
    case Expr::SExt: {
      ref<Expr> kids[1];
      kids[0] = substituteExpr(base->getKid(0), lhs, rhs);
      if (kids[0].isNull())
        return kids[0];
      else
        return base->rebuild(kids);
    }

    case Expr::Sel:
    case Expr::Concat:
    case Expr::Eq:
    case Expr::Ne:
    case Expr::Ult:
    case Expr::Ule:
    case Expr::Ugt:
    case Expr::Uge:
    case Expr::Slt:
    case Expr::Sle:
    case Expr::Sgt:
    case Expr::Sge:
    case Expr::LastKind:
    case Expr::Add:
    case Expr::Sub:
    case Expr::Mul:
    case Expr::UDiv:
    case Expr::SDiv:
    case Expr::URem:
    case Expr::SRem:
    case Expr::Shl:
    case Expr::LShr:
    case Expr::AShr: {
      ref<Expr> kids[2];
      kids[0] = substituteExpr(base->getKid(0), lhs, rhs);
      kids[1] = substituteExpr(base->getKid(1), lhs, rhs);

      if (kids[0].isNull())
        return kids[0];
      else if (kids[1].isNull())
        return kids[1];
      else
        return base->rebuild(kids);
    }

    case Expr::And:
    case Expr::Or:
    case Expr::Xor: {
      ref<Expr> kids[2];
      kids[0] = substituteExpr(base->getKid(0), lhs, rhs);
      kids[1] = substituteExpr(base->getKid(1), lhs, rhs);
      if (kids[0].isNull())
        return kids[1];
      else if (kids[1].isNull())
        return kids[0];
      else
        return base->rebuild(kids);
    }

    case Expr::Upd:
    case Expr::Select: {
      ref<Expr> kids[3];
      kids[0] = substituteExpr(base->getKid(0), lhs, rhs);
      kids[1] = substituteExpr(base->getKid(1), lhs, rhs);
      kids[2] = substituteExpr(base->getKid(2), lhs, rhs);
      if (kids[0].isNull())
        return kids[0];
      else if (kids[1].isNull())
        return kids[1];
      else if (kids[2].isNull())
        return kids[2];
      else
        return base->rebuild(kids);
    }

    default: {
      base->dump();
      lhs->dump();
      rhs->dump();
      klee_error("TxWPHelper::substituteExpr: Expression not supported yet!");
    }
    }
  }

  return base;
}

// ref<Expr> TxWPHelper::substituteArray(ref<Expr> base, const Array *lhs,
//                                      const Array *rhs) {
//
//  switch (base->getKind()) {
//  case Expr::InvalidKind:
//  case Expr::Constant: {
//    return base;
//  }
//
//  case Expr::Read: {
//    ref<ReadExpr> re = dyn_cast<ReadExpr>(base);
//    if (re->getArray() == lhs) {
//      re->replaceArray(rhs);
//      return re;
//    } else
//      return base;
//  }
//
//  case Expr::NotOptimized:
//  case Expr::Not:
//  case Expr::Extract:
//  case Expr::ZExt:
//  case Expr::SExt: {
//    ref<Expr> kids[1];
//    kids[0] = substituteArray(base->getKid(0), lhs, rhs);
//    return base->rebuild(kids);
//  }
//
//  case Expr::Concat:
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
//  case Expr::LastKind:
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
//    ref<Expr> kids[2];
//    //      llvm::outs() << "--- Begin substitution - " << base->getKind()
//    //                   << " ---\n";
//    //      base->dump();
//    //      llvm::outs() << "--------------------------\n";
//
//    kids[0] = substituteArray(base->getKid(0), lhs, rhs);
//    //      kids[0]->dump();
//    //      llvm::outs() << "--------------------------\n";
//
//    kids[1] = substituteArray(base->getKid(1), lhs, rhs);
//    //      kids[1]->dump();
//    //      llvm::outs() << "--------------------------\n";
//
//    base = base->rebuild(kids);
//    //      base->dump();
//    //      llvm::outs() << "--- End substitution - " << base->getKind() <<
//    //      "---\n ";
//
//    return base;
//  }
//
//  case Expr::Select: {
//    ref<Expr> kids[3];
//    kids[0] = substituteArray(base->getKid(0), lhs, rhs);
//    kids[1] = substituteArray(base->getKid(1), lhs, rhs);
//    kids[2] = substituteArray(base->getKid(1), lhs, rhs);
//    return base->rebuild(kids);
//  }
//  default: {
//    // Sanity check
//    klee_error("Control should not reach here in
//    TxWPHelper::substituteArray!");
//  }
//  }
//  return base;
//}

// ref<ReadExpr> TxWPHelper::ExtractReadExpr(ref<Expr> expr) {
//
//  switch (expr->getKind()) {
//
//  case Expr::Concat: {
//    if (isa<ReadExpr>(expr->getKid(0)))
//      return dyn_cast<ReadExpr>(expr->getKid(0));
//    else if (isa<ReadExpr>(expr->getKid(1)))
//      return dyn_cast<ReadExpr>(expr->getKid(1));
//    else
//      klee_error(
//          "Control should not reach here in TxWPHelper::ExtractReadExpr!");
//  }
//  default: {
//    klee_error("Control should not reach here in
//    TxWPHelper::ExtractReadExpr!");
//    return dyn_cast<ReadExpr>(expr);
//  }
//  }
//
//  // Sanity check
//  klee_error("Control should not reach here in TxWPHelper::ExtractReadExpr!");
//  return dyn_cast<ReadExpr>(expr);
//}
//
// std::set<ref<Expr> > TxWPHelper::extractVariables(ref<Expr> expr) {
//
//  std::set<ref<Expr> > set;
//
//  switch (expr->getKind()) {
//  case Expr::InvalidKind:
//  case Expr::Constant: {
//    return set;
//  }
//
//  case Expr::WPVar: {
//    set.insert(expr);
//    return set;
//  }
//
//  case Expr::NotOptimized:
//  case Expr::Not:
//  case Expr::Extract:
//  case Expr::ZExt:
//  case Expr::SExt: {
//    ref<Expr> kids[1];
//    kids[0] = expr->getKid(0);
//    return extractVariables(kids[0]);
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
//  case Expr::LastKind:
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
//    ref<Expr> kids[2];
//    kids[0] = expr->getKid(0);
//    kids[1] = expr->getKid(1);
//    std::set<ref<Expr> > set1 = extractVariables(kids[0]);
//    std::set<ref<Expr> > set2 = extractVariables(kids[1]);
//    set1.insert(set2.begin(), set2.end());
//    return set1;
//  }
//
//  case Expr::Select: {
//    ref<Expr> kids[3];
//    kids[0] = expr->getKid(0);
//    kids[1] = expr->getKid(1);
//    kids[2] = expr->getKid(2);
//    std::set<ref<Expr> > set1 = extractVariables(kids[0]);
//    std::set<ref<Expr> > set2 = extractVariables(kids[1]);
//    std::set<ref<Expr> > set3 = extractVariables(kids[2]);
//    set1.insert(set2.begin(), set2.end());
//    set1.insert(set3.begin(), set3.end());
//    return set1;
//  }
//  default: {
//    // Sanity check
//    klee_error("Control should not reach here in "
//               "TxWPHelper::isTargetDependent!");
//  }
//  }
//  return set;
//}

} /* namespace klee */
