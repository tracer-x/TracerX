//===-- WP.cpp - Interpolation tree -------------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementations of the classes for weakest
/// precondition.
///
//===----------------------------------------------------------------------===//

#include "WP.h"
#include "Context.h"
#include "TxTree.h"

#include <klee/Expr.h>
#include <klee/Internal/Support/ErrorHandling.h>

#include "TxDependency.h"
#include "TxShadowArray.h"
#include "TimingSolver.h"

#include <fstream>
#include <klee/CommandLine.h>
#include <klee/Solver.h>
#include <klee/SolverStats.h>
#include <klee/util/ExprPPrinter.h>
#include <klee/util/TxPrintUtil.h>
#include <vector>

using namespace klee;

typedef std::map<ref<TxVariable>, ref<TxInterpolantValue> >
    LowerInterpolantStore;
typedef std::map<ref<TxAllocationContext>, LowerInterpolantStore>
    TopInterpolantStore;
       
/**/

WeakestPreCondition::WeakestPreCondition(TxTreeNode *_node,
                                         TxDependency *_dependency) {
  WPExpr = eb->False();

  // Used to represent constants during the simplification of WPExpr to
  // canonical form

  const Array *array = ac.CreateArray("const", 128);
  constValues = Expr::createTempRead(array, Expr::Int32);
  node = _node;
  dependency = _dependency;
  debugSubsumptionLevel = dependency->debugSubsumptionLevel;
}

WeakestPreCondition::~WeakestPreCondition() {}

std::map<KInstruction *, int> WeakestPreCondition::markVariables(
    std::map<KInstruction *, int> reverseInstructionList) {

  for (std::map<KInstruction *, int>::const_reverse_iterator
           it = reverseInstructionList.rbegin(),
           ie = reverseInstructionList.rend();
       it != ie; ++it) {

    // Retrieve the instruction
    KInstruction *i = (*it).first;

    // Mark the instructions
    if (markedVariables.find(i->inst) != markedVariables.end()) {
      reverseInstructionList[i] = 1;
    } else if (dyn_cast<llvm::StoreInst>(i->inst) &&
               markedVariables.find(i->inst->getOperand(1)) !=
                   markedVariables.end()) {
      reverseInstructionList[i] = 1;
    }

    // Add the variables in the RHS of marked instructions to markedVariables
    // set
    if ((*it).second == 1) {
      if (dyn_cast<llvm::BinaryOperator>(i->inst) ||
          dyn_cast<llvm::UnaryInstruction>(i->inst) ||
          dyn_cast<llvm::StoreInst>(i->inst) ||
          dyn_cast<llvm::CmpInst>(i->inst)) {
        unsigned int j = 0;
        while (j < i->inst->getNumOperands()) {
          llvm::Value *operand = i->inst->getOperand(j);
          if (markedVariables.find(operand) == markedVariables.end() &&
              !dyn_cast<llvm::Constant>(operand)) {
            markedVariables.insert(operand);
          }
          j++;
        }
      } else {
        switch (i->inst->getOpcode()) {
        case llvm::Instruction::Br: {
          llvm::BranchInst *bi = cast<llvm::BranchInst>(i->inst);
          if (bi->isUnconditional()) {
            klee_error("Unconditional BR should not be marked in WP!");
          } else {
            markedVariables.insert(bi->getCondition());
          }
          break;
        }
        case llvm::Instruction::Call: {
          // TODO: Add interprocedural marking
          klee_error("Marking not implemented for call instruction yet!");
          break;
        }
        default: {
          i->inst->dump();
          klee_error("Marking not implemented for this instruction yet!");
        }
        }
      }
    } else if ((*it).second == 2) {
      klee_error(
          "Marking not implemented for false dependency in instruction yet!");
    }
  }

  // Printing reverseInstructionList will be omitted in the final commit
  /*for (std::map<KInstruction *, int>::const_reverse_iterator
           it = reverseInstructionList.rbegin(),
           ie = reverseInstructionList.rend();
       it != ie; ++it) {
          (*it).first->inst->dump();
          llvm::errs() <<  " " << (*it).second << "\n";
  }*/
  return reverseInstructionList;
}

ref<Expr> WeakestPreCondition::GenerateWP(
    std::map<KInstruction *, int> reverseInstructionList, bool markAllFlag) {

  if (debugSubsumptionLevel >= 2)
    klee_message("**********WP Interpolant Start************");
  for (std::map<KInstruction *, int>::const_reverse_iterator
           it = reverseInstructionList.rbegin(),
           ie = reverseInstructionList.rend();
       it != ie; ++it) {
    llvm::Instruction *i = (*it).first->inst;
    if ((*it).second == 1 || markAllFlag == true) {
      // Retrieve the instruction
      if (debugSubsumptionLevel >= 3) {
        klee_message("Printing LLVM Instruction: ");
        i->dump();
        klee_message("---------------------------------------------");
      }

      switch (i->getOpcode()) {

      case llvm::Instruction::Br: {
        llvm::BranchInst *bi = cast<llvm::BranchInst>(i);
        if (bi->isUnconditional()) {
          if (markAllFlag != true)
            klee_error("Unconditional BR is not marked in WP!");
          // else
          // Nothing is needed to be done	.
        } else {
          // llvm::Value* cond = bi->getCondition();
          // TODO: Nothing specific is needed to be done for now.
        }
        break;
      }

      case llvm::Instruction::FCmp:
      case llvm::Instruction::ICmp: {

        // Getting the expressions from the left and right operand
        ref<Expr> left = this->generateExprFromOperand(i, 0);
        ref<Expr> right = this->generateExprFromOperand(i, 1);

        if (markAllFlag == true && !isTargetDependent(i, this->WPExpr)) {
          break;
        }

        ref<Expr> result;
        // second step is to Storing the updated WP expression
        llvm::CmpInst *ICC = dyn_cast<llvm::CmpInst>(i);
        switch (ICC->getPredicate()) {
        case llvm::CmpInst::ICMP_EQ:
          result = EqExpr::create(left, right);
          break;
        case llvm::CmpInst::ICMP_NE:
          result = NeExpr::create(left, right);
          break;
        case llvm::CmpInst::ICMP_UGT:
          result = UgtExpr::create(left, right);
          break;
        case llvm::CmpInst::ICMP_UGE:
          result = UgeExpr::create(left, right);
          break;
        case llvm::CmpInst::ICMP_ULT:
          result = UltExpr::create(left, right);
          break;
        case llvm::CmpInst::ICMP_ULE:
          result = UleExpr::create(left, right);
          break;
        case llvm::CmpInst::ICMP_SGT:
          result = SgtExpr::create(left, right);
          break;
        case llvm::CmpInst::ICMP_SGE:
          result = SgeExpr::create(left, right);
          break;
        case llvm::CmpInst::ICMP_SLT:
          result = SltExpr::create(left, right);
          break;
        case llvm::CmpInst::ICMP_SLE:
          result = SleExpr::create(left, right);
          break;
        // todo Handle Floating Point
        case llvm::CmpInst::FCMP_FALSE:
          klee_error("FCMP_FALSE not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_OEQ:
          klee_error("FCMP_OEQ not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_OGT:
          klee_error("FCMP_OGT not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_OGE:
          klee_error("FCMP_OGE not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_OLT:
          klee_error("FCMP_OLT not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_OLE:
          klee_error("FCMP_OLE not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_ONE:
          klee_error("FCMP_ONE not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_ORD:
          klee_error("FCMP_ORD not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_UNO:
          klee_error("FCMP_UNO not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_UEQ:
          klee_error("FCMP_UEQ not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_UGT:
          klee_error("FCMP_UGT not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_UGE:
          klee_error("FCMP_UGE not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_ULT:
          klee_error("FCMP_ULT not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_ULE:
          klee_error("FCMP_ULE not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_UNE:
          klee_error("FCMP_UNE not implemented yet!");
          break;
        case llvm::CmpInst::FCMP_TRUE:
          klee_error("FCMP_TRUE not implemented yet!");
          break;
        case llvm::CmpInst::BAD_FCMP_PREDICATE:
          klee_error("BAD_FCMP_PREDICATE not implemented yet!");
          break;
        case llvm::CmpInst::BAD_ICMP_PREDICATE:
          klee_error("BAD_ICMP_PREDICATE not implemented yet!");
          break;
        }

        this->updateWPExpr(result);
        break;
      }

      case llvm::Instruction::Add:
      case llvm::Instruction::Sub:
      case llvm::Instruction::Mul:
      case llvm::Instruction::UDiv:
      case llvm::Instruction::SDiv:
      case llvm::Instruction::URem:
      case llvm::Instruction::SRem:
      case llvm::Instruction::And:
      case llvm::Instruction::Or:
      case llvm::Instruction::Xor:
      case llvm::Instruction::Shl:
      case llvm::Instruction::LShr:
      case llvm::Instruction::AShr: {
        // Getting the expressions from the left and right operand
        ref<Expr> left = this->generateExprFromOperand(i, 0);
        ref<Expr> right = this->generateExprFromOperand(i, 1);

        if (markAllFlag == true && !isTargetDependent(i, this->WPExpr)) {
          break;
        }

        ref<Expr> rhs;
        switch (i->getOpcode()) {
        case llvm::Instruction::Add:
          rhs = AddExpr::create(left, right);
          break;
        case llvm::Instruction::Sub:
          rhs = SubExpr::create(left, right);
          break;
        case llvm::Instruction::Mul:
          rhs = MulExpr::create(left, right);
          break;
        case llvm::Instruction::UDiv:
          rhs = UDivExpr::create(left, right);
          break;
        case llvm::Instruction::SDiv:
          rhs = SDivExpr::create(left, right);
          break;
        case llvm::Instruction::URem:
          rhs = URemExpr::create(left, right);
          break;
        case llvm::Instruction::SRem:
          rhs = SRemExpr::create(left, right);
          break;
        case llvm::Instruction::And:
          rhs = AndExpr::create(left, right);
          break;
        case llvm::Instruction::Or:
          rhs = OrExpr::create(left, right);
          break;
        case llvm::Instruction::Xor:
          rhs = XorExpr::create(left, right);
          break;
        case llvm::Instruction::Shl:
          rhs = ShlExpr::create(left, right);
          break;
        case llvm::Instruction::LShr:
          rhs = LShrExpr::create(left, right);
          break;
        case llvm::Instruction::AShr:
          rhs = AShrExpr::create(left, right);
          break;
        }

        ref<Expr> lhs = this->getLHS(i);
        ref<Expr> result = EqExpr::create(lhs, rhs);
        this->updateWPExpr(result);
        break;
      }

      case llvm::Instruction::Load: {
        // Do nothing, Load instructions are handled by the
        // generateExprFromOperand
        // function in binary operations
        break;
      }

      case llvm::Instruction::Store: {
        ref<Expr> left = this->generateExprFromOperand(i, 0);
        ref<Expr> right = this->generateExprFromOperand(i, 1);
        if (markAllFlag == true &&
            !isTargetDependent(dyn_cast<llvm::Instruction>(i->getOperand(1)),
                               this->WPExpr)) {
          break;
        }
        ref<Expr> result = EqExpr::create(right, left);
        this->updateWPExpr(result);
        break;
      }

      case llvm::Instruction::Call: {
        llvm::CallInst *call = dyn_cast<llvm::CallInst>(i);

        if (call->getCalledFunction()->getName() == "klee_assume") {
          // TODO: Nothing specific is needed to be done for now.
        } else if (call->getCalledFunction()->getName() ==
                   "klee_make_symbolic") {
          // TODO: Nothing specific is needed to be done for now.
        } else {
          if (call->doesNotReturn())
            klee_error("Call Instructions are not yet implemented.");
          else
            klee_error("Call Instructions are not yet implemented.");
        }
        break;
      }

      case llvm::Instruction::BitCast: {
        // Getting the expressions from the operand
        ref<Expr> operand = this->generateExprFromOperand(i, 0);
        if (markAllFlag == true && !isTargetDependent(i, this->WPExpr)) {
          break;
        }
        ref<Expr> lhs = this->getLHS(i);
        ref<Expr> result = EqExpr::create(lhs, operand);
        this->updateWPExpr(result);
        break;
      }

      case llvm::Instruction::Alloca: {
        // TODO: Nothing specific is needed to be done for now.
        break;
      }
      default: {
        klee_message("+++++++++++++++++++++++++++++++++++++++++++++");
        klee_message("LLVM Instruction Not Implemeneted Yet: ");
        i->dump();
        klee_error("+++++++++++++++++++++++++++++++++++++++++++++");
      }
      }
      if (debugSubsumptionLevel >= 2) {
        klee_message("**** Weakest PreCondition ****");
        WPExpr->dump();
        klee_message("***************************************");
      }
    } else if ((*it).second == 2) {
      klee_message("False case of LLVM Instruction Not Implemeneted Yet");
      i->dump();
    }
  }

  if (debugSubsumptionLevel >= 2)
    klee_message("**********Generating WP finished**********");

  return WPExpr;
}

ref<Expr> WeakestPreCondition::generateExprFromOperand(llvm::Instruction *i,
                                                       int operand) {
  // Generating WP from Operand1
  ref<Expr> left;

  llvm::Value *operand1 = i->getOperand(operand);
  if (isa<llvm::ConstantInt>(operand1)) {
    llvm::ConstantInt *CI = dyn_cast<llvm::ConstantInt>(operand1);
    if (CI->getBitWidth() <= 32)
      left = ConstantExpr::create(CI->getZExtValue(), Expr::Int32);
    else
      left = ConstantExpr::create(CI->getZExtValue(), Expr::Int64);
  } else if (isa<llvm::LoadInst>(operand1)) {
    llvm::LoadInst *inst = dyn_cast<llvm::LoadInst>(operand1);
    left = dependency->getAddress(inst->getOperand(0), &ac, array, this);
  } else {
    left = dependency->getAddress(operand1, &ac, array, this);
  }
  return left;
}

ref<Expr> WeakestPreCondition::getLHS(llvm::Instruction *i) {

  std::string arrayName;
  if (i->hasName())
    arrayName = i->getName();
  else {
    arrayName = "tmpLHS";
    klee_error("Instruction has no name: tmpLHS!\n");
  }
  unsigned arrayWidth = Expr::Int32;
  array = ac.CreateArray(arrayName, arrayWidth);
  return dependency->getAddress(i, &ac, array, this);
}

void WeakestPreCondition::updateWPExpr(ref<Expr> result) {
  if (WPExpr == eb->False()) {
    WPExpr = result;
  } else {
    this->substituteExpr(result);
    this->simplifyWPExpr();
  }
}

void WeakestPreCondition::substituteExpr(ref<Expr> result) {
  switch (result->getKind()) {
  case Expr::Eq: {
    ref<Expr> lhs = result->getKid(0);
    ref<Expr> rhs = result->getKid(1);
    if (isa<ConstantExpr>(rhs)) {
      ref<Expr> temp = lhs;
      lhs = rhs;
      rhs = temp;
    }

    WPExpr = this->substituteExpr(WPExpr, lhs, rhs);
    break;
  }
  default: {
    result->dump();
    klee_error("Substitution for this expressions is not defined yet!");
  }
  }
}

ref<Expr> WeakestPreCondition::substituteExpr(ref<Expr> base,
                                              const ref<Expr> lhs,
                                              const ref<Expr> rhs) {
  if (base.compare(lhs) == 0)
    return rhs;
  else if (base.compare(rhs) == 0)
    return lhs;
  else {
    switch (base->getKind()) {
    case Expr::InvalidKind:
    case Expr::Constant: {
      return base;
    }

    case Expr::NotOptimized:
    case Expr::Read:
    case Expr::Not:
    case Expr::Extract:
    case Expr::ZExt:
    case Expr::SExt: {
      ref<Expr> kids[1];
      kids[0] = this->substituteExpr(base->getKid(0), lhs, rhs);
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
      kids[0] = this->substituteExpr(base->getKid(0), lhs, rhs);
      kids[1] = this->substituteExpr(base->getKid(1), lhs, rhs);
      return base->rebuild(kids);
    }

    case Expr::Select: {
      ref<Expr> kids[3];
      kids[0] = this->substituteExpr(base->getKid(0), lhs, rhs);
      kids[1] = this->substituteExpr(base->getKid(1), lhs, rhs);
      kids[2] = this->substituteExpr(base->getKid(1), lhs, rhs);
      return base->rebuild(kids);
    }
    }
  }
  // Sanity check
  klee_error(
      "Control should not reach here in WeakestPreCondition::substituteExpr!");
  return base;
}

void WeakestPreCondition::simplifyWPExpr() {

  switch (WPExpr->getKind()) {
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
    kids[0] = WPExpr->getKid(0);
    kids[1] = WPExpr->getKid(1);
    std::map<ref<Expr>, uint64_t> *newLinearTerm =
        new std::map<ref<Expr>, uint64_t>;
    if (isa<ConstantExpr>(kids[1])) {
      ref<ConstantExpr> constant = dyn_cast<ConstantExpr>(kids[1]);
      insertTerm(newLinearTerm, constant->getZExtValue(), constValues);
    } else {
      newLinearTerm = this->simplifyWPTerm(newLinearTerm, kids[1]);
    }
    newLinearTerm = this->simplifyWPTerm(newLinearTerm, kids[0]);
    convertToExpr(newLinearTerm);
    delete newLinearTerm;
    break;
  }
  case Expr::Constant: {
    // Do nothing. The expression is in the form of True or False
    break;
  }

  default: {
    klee_message("Error while parsing WP Expression:");
    WPExpr->dump();
    klee_error("All WP Expressions should be in the form LinearTerm CMP "
               "Constant. Ex. X + 2Y < 5");
  }
  }
}

std::map<ref<Expr>, uint64_t> *WeakestPreCondition::simplifyWPTerm(
    std::map<ref<Expr>, uint64_t> *newLinearTerm, ref<Expr> linearTerm) {
  if (isa<ConstantExpr>(linearTerm)) {
    ref<ConstantExpr> constant = dyn_cast<ConstantExpr>(linearTerm);
    insertTerm(newLinearTerm, (-1) * constant->getZExtValue(), constValues);
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

void WeakestPreCondition::insertTerm(
    std::map<ref<Expr>, uint64_t> *newLinearTerm, uint64_t coeff,
    const ref<Expr> variable) {
  std::map<ref<Expr>, uint64_t>::iterator it = newLinearTerm->find(variable);
  if (it == newLinearTerm->end())
    newLinearTerm->insert(std::pair<ref<Expr>, uint64_t>(variable, coeff));
  else
    it->second = it->second + coeff;
}

void WeakestPreCondition::convertToExpr(
    std::map<ref<Expr>, uint64_t> *newLinearTerm) {
  ref<Expr> kids[2];
  ref<Expr> temp = eb->False();
  for (std::map<ref<Expr>, uint64_t>::const_iterator
           it = newLinearTerm->begin(),
           ie = newLinearTerm->end();
       it != ie; ++it) {
    if (it->first == constValues) {
      kids[1] = ConstantExpr::create(it->second, Expr::Int32);
    } else {
      ref<Expr> lhs;
      if (it->second == 1) {
        lhs = it->first;
      } else {
        lhs = MulExpr::create(ConstantExpr::create(it->second, Expr::Int32),
                              it->first);
      }
      if (temp == eb->False()) {
        temp = lhs;
      } else {
        temp = AddExpr::create(lhs, temp);
      }
    }
  }
  kids[0] = temp;
  WPExpr = WPExpr->rebuild(kids);
}

void WeakestPreCondition::storeArrayRef(llvm::Value *value, const Array *array,
                                        ref<Expr> expr) {
  std::map<llvm::Value *, std::pair<const Array *, ref<Expr> > >::iterator it =
      arrayStore.find(value);
  if (it == arrayStore.end()) {
    // value not found in map
    arrayStore.insert(std::make_pair(value, std::make_pair(array, expr)));
  } else {
    // value found in map so it's a memory location
    // sanity check
    if (it->second.first != array)
      klee_error("WeakestPreCondition::storeArrayRef updating Expr value of "
                 "wrong array.");
    it->second = std::make_pair(array, expr);
  }
}

const Array *WeakestPreCondition::getArrayRef(llvm::Value *value) {
  std::map<llvm::Value *, std::pair<const Array *, ref<Expr> > >::iterator it =
      arrayStore.find(value);
  if (it != arrayStore.end()) {
    return it->second.first;
  } else {
    klee_error("WeakestPreCondition::getArrayRef trying to get Array ref for "
               "wrong value*.");
  }
}

llvm::Value *WeakestPreCondition::getValuePointer(ref<Expr> expr) {
  for (std::map<llvm::Value *,
                std::pair<const Array *, ref<Expr> > >::const_iterator
           it = arrayStore.begin(),
           ie = arrayStore.end();
       it != ie; ++it) {
    if (it->second.second == expr) {
      return it->first;
    }
  }
  return NULL;
}

ref<Expr> WeakestPreCondition::instantiateWPExpression(
    TxDependency *dependency, const std::vector<llvm::Instruction *> &callHistory,
    ref<Expr> WPExpr) {
  switch (WPExpr->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    return WPExpr;
  }

  case Expr::Read: {
    llvm::Value *tempInstr = getValuePointer(WPExpr);
    if (tempInstr == NULL)
      klee_error(
          "WeakestPreCondition::instantiateWPExpression Value ref is null");
    ref<Expr> storeValue =
        dependency->getLatestValueOfAddress(tempInstr, callHistory);
    return storeValue;
  }

  case Expr::Concat: {
    llvm::Value *tempInstr = getValuePointer(WPExpr);
    if (tempInstr == NULL)
      klee_error(
          "WeakestPreCondition::instantiateWPExpression Value ref is null");
    ref<Expr> storeValue =
        dependency->getLatestValueOfAddress(tempInstr, callHistory);
    return storeValue;
  }

  case Expr::NotOptimized:
  case Expr::Not:
  case Expr::Extract:
  case Expr::ZExt:
  case Expr::SExt: {
    ref<Expr> kids[1];
    kids[0] =
        instantiateWPExpression(dependency, callHistory, WPExpr->getKid(0));
    return WPExpr->rebuild(kids);
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
    kids[0] =
        instantiateWPExpression(dependency, callHistory, WPExpr->getKid(0));
    kids[1] =
        instantiateWPExpression(dependency, callHistory, WPExpr->getKid(1));
    return WPExpr->rebuild(kids);
  }

  case Expr::Select: {
    ref<Expr> kids[3];
    kids[0] =
        instantiateWPExpression(dependency, callHistory, WPExpr->getKid(0));
    kids[1] =
        instantiateWPExpression(dependency, callHistory, WPExpr->getKid(1));
    kids[2] =
        instantiateWPExpression(dependency, callHistory, WPExpr->getKid(2));
    return WPExpr->rebuild(kids);
  }
  }
  // Sanity check
  klee_error("Control should not reach here in "
             "WeakestPreCondition::instantiateWPExpression!");
  return WPExpr;
}


ref<Expr> WeakestPreCondition::intersectExpr(ref<Expr> expr1,ref<Expr> expr2){
  if(expr1->getKind() == Expr::Sle && expr2->getKind() == Expr::Sle) {
	  if (expr1->getKid(0) == expr2->getKid(0)){
		  ref<Expr> kids[2];
		  kids[0] = expr1->getKid(0);
			//sanity check
		  assert(isa<ConstantExpr>(expr1->getKid(1)) && "expr1->getKid(1) should be constant expression");
		  assert(isa<ConstantExpr>(expr2->getKid(1)) && "expr2->getKid(1) should be constant expression");
		  kids[1] = this->getMinOfConstExpr(dyn_cast<ConstantExpr>(expr1->getKid(1)),dyn_cast<ConstantExpr>(expr2->getKid(1)));
		  return expr1->rebuild(kids);
	  }else{
		  expr1->dump();
		  expr2->dump();
		  klee_error("WeakestPreCondition::intersectExpr left operands are not the same.");
		  return AndExpr::create(expr1,expr2);
	  }
  }else{
	  expr1->dump();
	  expr2->dump();
	  klee_error("WeakestPreCondition::intersectExpr for these expressions is not implemented yet.");
	  return AndExpr::create(expr1,expr2);
  }
}

ref<ConstantExpr> WeakestPreCondition::getMinOfConstExpr(ref<ConstantExpr> expr1,ref<ConstantExpr> expr2){
	if(expr1.compare(expr2) >= 0)
		return expr1;
	else
		return expr2;
}

ref<ConstantExpr> WeakestPreCondition::getMaxOfConstExpr(ref<ConstantExpr> expr1,ref<ConstantExpr> expr2){
	if(expr1.compare(expr2) <= 0)
		return expr1;
	else
		return expr2;
}

bool WeakestPreCondition::isTargetDependent(llvm::Instruction *inst,
                                            ref<Expr> wp) {
  switch (wp->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    return false;
  }

  case Expr::Read: {
    if (inst == getValuePointer(wp)) {
      return true;
    }
    return false;
  }

  case Expr::Concat: {
    if (inst == getValuePointer(wp)) {
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
    kids[0] = WPExpr->getKid(0);
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
    kids[0] = WPExpr->getKid(0);
    kids[1] = WPExpr->getKid(1);
    return (isTargetDependent(inst, kids[0]) ||
            isTargetDependent(inst, kids[1]));
  }

  case Expr::Select: {
    ref<Expr> kids[3];
    kids[0] = WPExpr->getKid(0);
    kids[1] = WPExpr->getKid(1);
    kids[2] = WPExpr->getKid(2);
    return (isTargetDependent(inst, kids[0]) ||
            isTargetDependent(inst, kids[1]) ||
            isTargetDependent(inst, kids[2]));
  }
  }
  // Sanity check
  klee_error("Control should not reach here in "
             "WeakestPreCondition::isTargetDependent!");
  return false;
}

TxSubsumptionTableEntry *
WeakestPreCondition::updateSubsumptionTableEntry(TxSubsumptionTableEntry *entry,
                                                 ref<Expr> wp) {
  ref<Expr> interpolant = entry->getInterpolant();
  TxStore::LowerInterpolantStore concretelyAddressedHistoricalStore =
      entry->getConcretelyAddressedHistoricalStore();
  TxStore::LowerInterpolantStore symbolicallyAddressedHistoricalStore =
      entry->getSymbolicallyAddressedHistoricalStore();
  TxStore::TopInterpolantStore concretelyAddressedStore =
      entry->getConcretelyAddressedStore();
  TxStore::TopInterpolantStore symbolicallyAddressedStore =
      entry->getSymbolicallyAddressedStore();

  if (concretelyAddressedStore.size() == 0)
    klee_error("WeakestPreCondition::updateSubsumptionTableEntry for this case "
               "is not implemented yet.");
  else {
    // TODO: Assuming WP is one frame, fix this
    TxStore::TopInterpolantStore newConcretelyAddressedStore =
        updateConcretelyAddressedStore(concretelyAddressedStore, wp);
    ref<Expr> newInterpolant =
        replaceArrayWithShadow(updateInterpolant(interpolant, wp));
    entry->setConcretelyAddressedStore(newConcretelyAddressedStore);
    // TODO: Should be handled, not working
    // entry->setInterpolant(newInterpolant);
  }
  if (debugSubsumptionLevel >= 3) {
    // For future reference
    if (!interpolant.isNull())
      interpolant->dump();

    concretelyAddressedStore = entry->getConcretelyAddressedStore();
    for (TopInterpolantStore::const_iterator
             it = concretelyAddressedStore.begin(),
             ie = concretelyAddressedStore.end();
         it != ie; ++it) {
      (*it).first->dump();
      LowerInterpolantStore temp = (*it).second;
      for (LowerInterpolantStore::const_iterator it2 = temp.begin(),
                                                 ie2 = temp.end();
           it2 != ie2; ++it2) {
        (*it2).first->dump();
        (*it2).second->dump();
      }
    }
    for (TopInterpolantStore::const_iterator
             it = symbolicallyAddressedStore.begin(),
             ie = symbolicallyAddressedStore.end();
         it != ie; ++it) {
      (*it).first->dump();
      LowerInterpolantStore temp = (*it).second;
      for (LowerInterpolantStore::const_iterator it2 = temp.begin(),
                                                 ie2 = temp.end();
           it2 != ie2; ++it2) {
        (*it2).first->dump();
        (*it2).second->dump();
      }
    }

    for (LowerInterpolantStore::const_iterator
             it = concretelyAddressedHistoricalStore.begin(),
             ie = concretelyAddressedHistoricalStore.end();
         it != ie; ++it) {
      (*it).first->dump();
      (*it).second->dump();
    }

    for (LowerInterpolantStore::const_iterator
             it = symbolicallyAddressedHistoricalStore.begin(),
             ie = symbolicallyAddressedHistoricalStore.end();
         it != ie; ++it) {
      (*it).first->dump();
      (*it).second->dump();
    }
  }
  return entry;
}

TxStore::TopInterpolantStore
WeakestPreCondition::updateConcretelyAddressedStore(
    TxStore::TopInterpolantStore concretelyAddressedStore, ref<Expr> wp) {

  ref<Expr> var = getVarFromExpr(wp);
  llvm::Value *allocaVar = getValuePointer(var);
  TopInterpolantStore::iterator candidateForRemove =
      concretelyAddressedStore.end();
  for (TopInterpolantStore::iterator it = concretelyAddressedStore.begin(),
                                     ie = concretelyAddressedStore.end();
       it != ie; ++it) {

    if ((*it).first->getValue() == allocaVar)
      candidateForRemove = it;
  }
  if (candidateForRemove != concretelyAddressedStore.end()) {
    // TODO: Should be handled, not working
    // concretelyAddressedStore.erase(candidateForRemove);
  }
  return concretelyAddressedStore;
}

ref<Expr> WeakestPreCondition::getVarFromExpr(ref<Expr> wp) {
  // TODO: Assuming frame has only one variable. Fix it.
  switch (wp->getKind()) {
  case Expr::InvalidKind:
  case Expr::Read:
  case Expr::Concat:
  case Expr::Constant: {
    return wp;
  }

  case Expr::NotOptimized:
  case Expr::Not:
  case Expr::Extract:
  case Expr::ZExt:
  case Expr::SExt: {
    ref<Expr> kids[1];
    kids[0] = getVarFromExpr(wp->getKid(0));
    return kids[0];
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
    kids[0] = getVarFromExpr(wp->getKid(0));
    kids[1] = getVarFromExpr(wp->getKid(1));
    if (isa<ReadExpr>(kids[0]) || isa<ConcatExpr>(kids[0]))
      return kids[0];
    else
      return kids[1];
  }

  case Expr::Select: {
    ref<Expr> kids[3];
    kids[0] = getVarFromExpr(wp->getKid(0));
    kids[1] = getVarFromExpr(wp->getKid(1));
    kids[2] = getVarFromExpr(wp->getKid(2));
    if (isa<ReadExpr>(kids[0]) || isa<ConcatExpr>(kids[0]))
      return kids[0];
    else if (isa<ReadExpr>(kids[1]) || isa<ConcatExpr>(kids[1]))
      return kids[1];
    else
      return kids[1];
  }
  }
  // Sanity check
  klee_error(
      "Control should not reach here in WeakestPreCondition::getVarFromExpr");
  return wp;
}

ref<Expr> WeakestPreCondition::updateInterpolant(ref<Expr> interpolant,
                                                 ref<Expr> wp) {
  if (interpolant.isNull())
    return wp;
  else
    return AndExpr::create(interpolant, wp);
}

ref<Expr> WeakestPreCondition::replaceArrayWithShadow(ref<Expr> interpolant) {
  switch (interpolant->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    return interpolant;
  }

  case Expr::Read:
  case Expr::Concat: {
    llvm::Value *array = getValuePointer(interpolant);
    array->dump();
    const Array *symArray =
        ShadowArray::getSymbolicShadowArray(array->getName());
    if (symArray != NULL) {
      ref<Expr> Res(0);
      unsigned NumBytes = symArray->getDomain() / 8;
      assert(symArray->getDomain() == NumBytes * 8 && "Invalid read size!");
      for (unsigned i = 0; i != NumBytes; ++i) {
        unsigned idx = Context::get().isLittleEndian() ? i : (NumBytes - i - 1);
        ref<Expr> Byte =
            ReadExpr::create(UpdateList(symArray, 0),
                             ConstantExpr::alloc(idx, symArray->getDomain()));
        Res = i ? ConcatExpr::create(Byte, Res) : Byte;
      }
      return Res;
    } else {
      klee_error("WeakestPreCondition::replaceArrayWithShadow Shadow array "
                 "doesn't exist!");
    }
  }

  case Expr::NotOptimized:
  case Expr::Not:
  case Expr::Extract:
  case Expr::ZExt:
  case Expr::SExt: {
    ref<Expr> kids[1];
    kids[0] = replaceArrayWithShadow(interpolant->getKid(0));
    return interpolant->rebuild(kids);
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
    kids[0] = replaceArrayWithShadow(interpolant->getKid(0));
    kids[1] = replaceArrayWithShadow(interpolant->getKid(1));
    return interpolant->rebuild(kids);
  }

  case Expr::Select: {
    ref<Expr> kids[3];
    kids[0] = replaceArrayWithShadow(interpolant->getKid(0));
    kids[1] = replaceArrayWithShadow(interpolant->getKid(1));
    kids[2] = replaceArrayWithShadow(interpolant->getKid(2));
    return interpolant->rebuild(kids);
  }
  }
  // Sanity check
  klee_error(
      "Control should not reach here in WeakestPreCondition::getVarFromExpr");
  return interpolant;
}
