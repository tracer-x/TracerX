#include "WPHelper.h"

namespace klee {

ref<Expr> WPHelper::simplifyWPExpr(ref<Expr> e) {
  ref<Expr> result = e;
  switch (e->getKind()) {
  case Expr::And: {
    ref<Expr> kids[2];
    kids[0] = e->getKid(0);
    kids[1] = e->getKid(1);
    kids[0] = simplifyWPExpr(kids[0]);
    kids[1] = simplifyWPExpr(kids[1]);
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
    ref<Expr> kids[2];
    kids[0] = e->getKid(0);
    kids[1] = e->getKid(1);
    std::map<ref<Expr>, uint64_t> *newLinearTerm =
        new std::map<ref<Expr>, uint64_t>;
    if (isa<ConstantExpr>(kids[1])) {
      ref<ConstantExpr> constant = dyn_cast<ConstantExpr>(kids[1]);
      insertTerm(newLinearTerm, constant->getZExtValue(),
                 WPArrayStore::constValues);
    } else {
      newLinearTerm = simplifyWPTerm(newLinearTerm, kids[1]);
    }
    newLinearTerm = simplifyWPTerm(newLinearTerm, kids[0]);
    result = convertToExpr(e, newLinearTerm);

    delete newLinearTerm;
    break;
  }
  case Expr::Constant: {
    // Do nothing. The expression is in the form of True or False
    break;
  }

  default: {
    klee_message("Error while parsing WP Expression:");
    e->dump();
    klee_error("All WP Expressions should be in the form LinearTerm CMP "
               "Constant. Ex. X + 2Y < 5");
  }
  }
  return result;
}

std::map<ref<Expr>, uint64_t> *
WPHelper::simplifyWPTerm(std::map<ref<Expr>, uint64_t> *newLinearTerm,
                         ref<Expr> linearTerm) {
  if (isa<ConstantExpr>(linearTerm)) {
    ref<ConstantExpr> constant = dyn_cast<ConstantExpr>(linearTerm);
    insertTerm(newLinearTerm, (-1) * constant->getZExtValue(),
               WPArrayStore::constValues);
  } else {
    switch (linearTerm->getKind()) {
    case Expr::Concat:
    case Expr::Read: {
      insertTerm(newLinearTerm, 1, linearTerm);
      break;
    }
    case Expr::Add:
    case Expr::Sub: {
      ref<Expr> kids[2];
      kids[0] = linearTerm->getKid(0);
      simplifyWPTerm(newLinearTerm, kids[0]);
      kids[1] = linearTerm->getKid(1);
      simplifyWPTerm(newLinearTerm, kids[1]);
      break;
    }
    case Expr::Mul:
    case Expr::UDiv:
    case Expr::SDiv: {
      ref<Expr> kids[2];
      kids[0] = linearTerm->getKid(0);
      kids[1] = linearTerm->getKid(1);
      if (isa<ConstantExpr>(kids[0]) && isa<ReadExpr>(kids[1])) {
        ref<ConstantExpr> coeff = dyn_cast<ConstantExpr>(kids[0]);
        insertTerm(newLinearTerm, coeff->getZExtValue(), kids[1]);
      } else {
        klee_message(
            "Error while parsing WP Expression. Not in canonical form:");
        linearTerm->dump();
        klee_error("The Coefficient should come first. Ex. 2*M");
      }
      break;
    }
    default: {
      linearTerm->dump();
      klee_error("LHS simplification for this term is not implemented yet");
    }
    }
  }
  return newLinearTerm;
}

void WPHelper::insertTerm(std::map<ref<Expr>, uint64_t> *newLinearTerm,
                          uint64_t coeff, const ref<Expr> variable) {
  std::map<ref<Expr>, uint64_t>::iterator it = newLinearTerm->find(variable);
  if (it == newLinearTerm->end())
    newLinearTerm->insert(std::pair<ref<Expr>, uint64_t>(variable, coeff));
  else
    it->second = it->second + coeff;
}

ref<Expr>
WPHelper::convertToExpr(ref<Expr> e,
                        std::map<ref<Expr>, uint64_t> *newLinearTerm) {
  ref<Expr> kids[2];
  ref<Expr> temp = ConstantExpr::alloc(0, Expr::Bool);
  for (std::map<ref<Expr>, uint64_t>::const_iterator
           it = newLinearTerm->begin(),
           ie = newLinearTerm->end();
       it != ie; ++it) {
    if (it->first == WPArrayStore::constValues) {
      kids[1] = ConstantExpr::create(it->second, Expr::Int32);
    } else {
      ref<Expr> lhs;
      if (it->second == 1) {
        lhs = it->first;
      } else {
        lhs = MulExpr::create(ConstantExpr::create(it->second, Expr::Int32),
                              it->first);
      }
      if (temp == ConstantExpr::alloc(0, Expr::Bool)) {
        temp = lhs;
      } else {
        temp = AddExpr::create(lhs, temp);
      }
    }
  }
  kids[0] = temp;
  return e->rebuild(kids);
}

bool WPHelper::isTargetDependent(llvm::Value *inst, ref<Expr> expr) {
  //  llvm::outs() << "***********\n";
  //  expr->dump();
  //  llvm::outs() << expr->getKind() << "\n";
  //  llvm::outs() << "***********\n";
  switch (expr->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: { return false; }

  case Expr::Read: {
    if (inst == WPArrayStore::getValuePointer(expr)) {
      return true;
    }
    return false;
  }

  case Expr::Concat: {

    if (inst == WPArrayStore::getValuePointer(
                    WPArrayStore::getFunctionName(inst), expr)) {
      return true;
    }
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
    //    llvm::outs() << isTargetDependent(inst, kids[0]) << "\n";
    //    llvm::outs() << isTargetDependent(inst, kids[1]) << "\n";
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
  }
  // Sanity check
  klee_error("Control should not reach here in "
             "WPHelper::isTargetDependent!");
  return false;
}

ref<Expr> WPHelper::substituteExpr(ref<Expr> e, ref<Expr> eq) {
  ref<Expr> result;
  switch (eq->getKind()) {
  case Expr::Constant: {
    // Nothing is needed to be done, it's either true or false
    break;
  }
  case Expr::Eq: {
    ref<Expr> lhs = eq->getKid(0);
    ref<Expr> rhs = eq->getKid(1);
    if (isa<ConstantExpr>(rhs)) {
      ref<Expr> temp = lhs;
      lhs = rhs;
      rhs = temp;
    }

    result = substituteExpr(e, lhs, rhs);
    break;
  }
  default: {
    e->dump();
    klee_error("Substitution for this expressions is not defined yet!");
  }
  }
  return result;
}

ref<Expr> WPHelper::substituteExpr(ref<Expr> base, const ref<Expr> lhs,
                                   const ref<Expr> rhs) {
  if (base.compare(lhs) == 0)
    return rhs;
  else if (base.compare(rhs) == 0)
    return lhs;
  else {
    switch (base->getKind()) {
    case Expr::InvalidKind:
    case Expr::Constant: { return base; }

    case Expr::NotOptimized:
    case Expr::Read:
    case Expr::Not:
    case Expr::Extract:
    case Expr::ZExt:
    case Expr::SExt: {
      ref<Expr> kids[1];
      kids[0] = substituteExpr(base->getKid(0), lhs, rhs);
      return base->rebuild(kids);
    }

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
    case Expr::And:
    case Expr::Or:
    case Expr::Xor:
    case Expr::Shl:
    case Expr::LShr:
    case Expr::AShr: {
      ref<Expr> kids[2];
      kids[0] = substituteExpr(base->getKid(0), lhs, rhs);
      kids[1] = substituteExpr(base->getKid(1), lhs, rhs);
      return base->rebuild(kids);
    }

    case Expr::Select: {
      ref<Expr> kids[3];
      kids[0] = substituteExpr(base->getKid(0), lhs, rhs);
      kids[1] = substituteExpr(base->getKid(1), lhs, rhs);
      kids[2] = substituteExpr(base->getKid(1), lhs, rhs);
      return base->rebuild(kids);
    }
    }
  }
  // Sanity check
  klee_error("Control should not reach here in WPHelper::substituteExpr!");
  return base;
}

} /* namespace klee */
