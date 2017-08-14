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

#include "TxTree.h"

#include <klee/Expr.h>
#include <klee/Internal/Support/ErrorHandling.h>

#include "Dependency.h"
#include "ShadowArray.h"
#include "TimingSolver.h"

#include <fstream>
#include <klee/CommandLine.h>
#include <klee/Solver.h>
#include <klee/SolverStats.h>
#include <klee/util/ExprPPrinter.h>
#include <klee/util/TxPrintUtil.h>
#include <vector>

using namespace klee;

/**/

WeakestPreCondition::WeakestPreCondition() { WPExpr = eb->False(); }

WeakestPreCondition::~WeakestPreCondition() {}

std::map<KInstruction *, bool> WeakestPreCondition::markVariables(
    std::map<KInstruction *, bool> reverseInstructionList) {

  for (std::map<KInstruction *, bool>::const_reverse_iterator
           it = reverseInstructionList.rbegin(),
           ie = reverseInstructionList.rend();
       it != ie; ++it) {

    // Retrieve the instruction
    KInstruction *i = (*it).first;

    // Mark the instructions
    if (markedVariables.find(i->inst) != markedVariables.end()) {
      reverseInstructionList[i] = true;
    } else if (dyn_cast<llvm::StoreInst>(i->inst) &&
               markedVariables.find(i->inst->getOperand(1)) !=
                   markedVariables.end()) {
      reverseInstructionList[i] = true;
    }

    // Add the variables in the RHS of marked instructions to markedVariables
    // set
    if ((*it).second == true) {
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
          break;
        }
        default: {
          i->inst->dump();
          klee_error("Marking not implemented for this instruction yet!");
        }
        }
      }
    }
  }
  return reverseInstructionList;
}

ref<Expr> WeakestPreCondition::GenerateWP(
    std::map<KInstruction *, bool> reverseInstructionList) {

  klee_message("**********WP Interpolant Start************");
  std::map<llvm::Value *, ref<Expr> > wpMap;
  for (std::map<KInstruction *, bool>::const_reverse_iterator
           it = reverseInstructionList.rbegin(),
           ie = reverseInstructionList.rend();
       it != ie; ++it) {
    if ((*it).second == false) {

    } else {
      // Retrieve the instruction
      llvm::Instruction *i = (*it).first->inst;
      klee_message("Printing LLVM Instruction: ");
      i->dump();
      klee_message("---------------------------------------------");

      switch (i->getOpcode()) {

      case llvm::Instruction::Br: {
        llvm::BranchInst *bi = cast<llvm::BranchInst>(i);
        if (bi->isUnconditional()) {
          klee_error("Unconditional BR is not marked in WP!");
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

      default: {
        klee_message("+++++++++++++++++++++++++++++++++++++++++++++");
        klee_message("LLVM Instruction Not Implemeneted Yet: ");
        i->dump();
        klee_message("+++++++++++++++++++++++++++++++++++++++++++++");
      }
      }
      klee_message("**** Weakest PreCondition ****");
      WPExpr->dump();
      klee_message("***************************************");
    }
  }
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
    llvm::AllocaInst *alloca = dyn_cast<llvm::AllocaInst>(inst->getOperand(0));
    std::string arrayName;
    if (alloca->hasName())
      arrayName = alloca->getName();
    else {
      arrayName = "tmpAlloca";
    }
    unsigned arrayWidth = Expr::Int32;
    array = ac.CreateArray(arrayName, arrayWidth);
    left = Expr::createTempRead(array, Expr::Int32);
  } else {
    std::string arrayName;
    if (operand1->hasName())
      arrayName = operand1->getName();
    else {
      arrayName = "tmp";
    }
    unsigned arrayWidth = Expr::Int32;
    array = ac.CreateArray(arrayName, arrayWidth);
    left = Expr::createTempRead(array, Expr::Int32);
  }
  return left;
}

ref<Expr> WeakestPreCondition::getLHS(llvm::Instruction *i) {

  std::string arrayName;
  if (i->hasName())
    arrayName = i->getName();
  else {
    arrayName = "tmpLHS";
  }
  unsigned arrayWidth = Expr::Int32;
  array = ac.CreateArray(arrayName, arrayWidth);
  return Expr::createTempRead(array, Expr::Int32);
  ;
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
    const ref<Expr> lhs = result->getKid(0);
    const ref<Expr> rhs = result->getKid(1);

    WPExpr = this->substituteExpr(WPExpr, lhs, rhs);
    break;
  }
  default: {
    klee_error("Substitution for this expressions is not defined yet!");
  }
  }
}

ref<Expr> WeakestPreCondition::substituteExpr(ref<Expr> base,
                                              const ref<Expr> lhs,
                                              const ref<Expr> rhs) {

  if (base.compare(lhs) == 0)
    return rhs;
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

void WeakestPreCondition::simplifyWPExpr() {}
