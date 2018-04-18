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

typedef std::map<ref<TxVariable>, ref<TxInterpolantValue> > LowerInterpolantStore;
typedef std::map<ref<TxAllocationContext>, LowerInterpolantStore> TopInterpolantStore;

std::map<std::pair<std::string, llvm::Value *>,
    std::pair<const Array *, ref<Expr> > > WPArrayStore::arrayStore;
ArrayCache WPArrayStore::ac;
const Array *WPArrayStore::array;
ref<Expr> WPArrayStore::constValues;

void WPArrayStore::insert(llvm::Value *value, const Array *array,
    ref<Expr> expr) {
  static std::map<std::pair<std::string, llvm::Value *>,
      std::pair<const Array *, ref<Expr> > >::iterator it = arrayStore.find(
      std::make_pair(getFunctionName(value), value));
  if (it == arrayStore.end()) {
    // value not found in map
    arrayStore.insert(
        std::make_pair(std::make_pair(getFunctionName(value), value),
            std::make_pair(array, expr)));
  } else {
    klee_error("WPArrayStore::insert not checked yet");

    // value found in map so it's a memory location
    // sanity check
    if (it->second.first != array) {
      klee_error("WPArrayStore::insert updating Expr value of wrong array.");
    }
    it->second = std::make_pair(array, expr);
  }
}

ref<Expr> WPArrayStore::createAndInsert(std::string arrayName,
    llvm::Value *value) {
  static std::map<std::pair<std::string, llvm::Value *>,
      std::pair<const Array *, ref<Expr> > >::iterator it = arrayStore.find(
      std::make_pair(getFunctionName(value), value));

  // Only catching the type of integer and pointers now
  unsigned int size = 0;
  if (value->getType()->isIntegerTy()) {
    size = value->getType()->getIntegerBitWidth();
  } else if (value->getType()->isPointerTy()
      && value->getType()->getArrayElementType()->isPointerTy()
      && value->getType()->getArrayElementType()->getArrayElementType()->isIntegerTy()) {
    size =
        value->getType()->getArrayElementType()->getArrayElementType()->getIntegerBitWidth();
    ;
  } else if (value->getType()->isPointerTy()
      && value->getType()->getArrayElementType()->isIntegerTy()) {
    size = value->getType()->getArrayElementType()->getIntegerBitWidth();
  } else if (value->getType()->isPointerTy()
      && value->getType()->getArrayElementType()->isArrayTy()
      && value->getType()->getArrayElementType()->getArrayElementType()->isIntegerTy()) {
    size =
        value->getType()->getArrayElementType()->getArrayElementType()->getIntegerBitWidth();
  } else {
//    value->getType()->dump();
    klee_error(
        "WPArrayStore::createAndInsert getting size is not defined for this "
            "type yet");
  }

  // Todo: tmpArray object should be reclaimed sometime later
  array = ac.CreateArray(arrayName, size);
  ref<Expr> expr = Expr::createTempRead(array, size);
  WPArrayStore::insert(value, array, expr);

  if (it == arrayStore.end()) {
    // value not found in map
    arrayStore.insert(
        std::make_pair(std::make_pair(getFunctionName(value), value),
            std::make_pair(array, expr)));

  } else {
    // value found in map so it's a memory location
    // sanity check
    if (it->second.first != array) {
      klee_error("WPArrayStore::insert updating Expr value of wrong array.");
    }
    it->second = std::make_pair(array, expr);
  }
  return expr;
}

const Array *WPArrayStore::getArrayRef(llvm::Value *value) {
  std::map<std::pair<std::string, llvm::Value *>,
      std::pair<const Array *, ref<Expr> > >::iterator it = arrayStore.find(
      std::make_pair(getFunctionName(value), value));
  if (it != arrayStore.end()) {
    return it->second.first;
  } else {
    klee_error("WeakestPreCondition::getArrayRef trying to get Array ref for "
        "wrong value*.");
    return it->second.first;
  }
}

llvm::Value *WPArrayStore::getValuePointer(ref<Expr> expr) {
  for (std::map<std::pair<std::string, llvm::Value *>,
      std::pair<const Array *, ref<Expr> > >::const_iterator it =
      arrayStore.begin(), ie = arrayStore.end(); it != ie; ++it) {
    if (it->second.second == expr) {
      return it->first.second;
    }
  }
  return NULL;
}

llvm::Value *WPArrayStore::getValuePointer(std::string func, ref<Expr> expr) {
  for (std::map<std::pair<std::string, llvm::Value *>,
      std::pair<const Array *, ref<Expr> > >::const_iterator it =
      arrayStore.begin(), ie = arrayStore.end(); it != ie; ++it) {
    if (it->second.second == expr && it->first.first == func) {
      return it->first.second;
    }
  }
  return NULL;
}

std::string WPArrayStore::getFunctionName(llvm::Value *i) {
  llvm::Instruction *inst;
  if (isa<llvm::Instruction>(i)) {
    inst = dyn_cast<llvm::Instruction>(i);
  } else if (isa<llvm::GlobalValue>(i)) {
    return "Global";
  } else if (isa<llvm::ConstantExpr>(i)) {
    // llvm::ConstantExpr* ce = dyn_cast<llvm::ConstantExpr>(i);
    // klee_error("WeakestPreCondition::getFunctionName");
    return "Constant";
  } else {
//    i->dump();
    klee_error("WeakestPreCondition::getFunctionName LLVM Value is not an "
        "instruction");
  }
  llvm::BasicBlock *BB = inst->getParent();
  if (!BB) {
//    inst->dump();
    klee_error("WeakestPreCondition::getFunctionName Basic Block is Null");
  }
  llvm::Function *func = BB->getParent();
  if (!func) {
//    BB->dump();
    klee_error("WeakestPreCondition::getFunctionName Function is Null");
  }
  if (!func->hasName()) {
//    func->dump();
    klee_error("WeakestPreCondition::getFunctionName Function has no name");
  }
  return func->getName();
}

/**/

WeakestPreCondition::WeakestPreCondition(TxTreeNode *_node,
    TxDependency *_dependency) {
  WPExpr = False();

  // Used to represent constants during the simplification of WPExpr to
  // canonical form

  node = _node;
  dependency = _dependency;
  debugSubsumptionLevel = dependency->debugSubsumptionLevel;
}

WeakestPreCondition::~WeakestPreCondition() {
}

// std::vector<std::pair<KInstruction *, int> >
// WeakestPreCondition::markVariables(
//    std::vector<std::pair<KInstruction *, int> > reverseInstructionList) {
//
//  for (std::vector<std::pair<KInstruction *, int> >::const_reverse_iterator
//           it = reverseInstructionList.rbegin(),
//           ie = reverseInstructionList.rend();
//       it != ie; ++it) {
//
//    // Retrieve the instruction
//    KInstruction *i = (*it).first;
//
//    std::vector<std::pair<KInstruction *, int> >::iterator iter =
//        std::find(reverseInstructionList.begin(),
// reverseInstructionList.end(),
//                  std::pair<KInstruction *, int>(i, 0));
//
//    // Mark the instructions
//    if (markedVariables.find(i->inst) != markedVariables.end()) {
//      iter->second = 1;
//    } else if (dyn_cast<llvm::StoreInst>(i->inst) &&
//               markedVariables.find(i->inst->getOperand(1)) !=
//                   markedVariables.end()) {
//      iter->second = 1;
//    }
//
//    // Add the variables in the RHS of marked instructions to markedVariables
//    // set
//    if ((*it).second == 1) {
//      if (dyn_cast<llvm::BinaryOperator>(i->inst) ||
//          dyn_cast<llvm::LoadInst>(i->inst) ||
//          dyn_cast<llvm::UnaryInstruction>(i->inst) ||
//          dyn_cast<llvm::StoreInst>(i->inst) ||
//          dyn_cast<llvm::CmpInst>(i->inst)) {
//        unsigned int j = 0;
//        while (j < i->inst->getNumOperands()) {
//          llvm::Value *operand = i->inst->getOperand(j);
//          if ((!isa<llvm::Constant>(operand) ||
//               isa<llvm::GlobalValue>(operand)) &&
//              markedVariables.find(operand) == markedVariables.end()) {
//            markedVariables.insert(operand);
//          }
//          j++;
//        }
//      } else {
//        switch (i->inst->getOpcode()) {
//        case llvm::Instruction::Br: {
//          llvm::BranchInst *bi = cast<llvm::BranchInst>(i->inst);
//          if (bi->isUnconditional()) {
//            klee_error("Unconditional BR should not be marked in WP!");
//          } else {
//            markedVariables.insert(bi->getCondition());
//          }
//          break;
//        }
//        case llvm::Instruction::Call: {
//          // Interprocedural Marking not implemented yet!
//          // At the current moment it is not needed.
//          break;
//        }
//        default: {
//          i->inst->dump();
//          klee_error("Marking not implemented for this instruction yet!");
//        }
//        }
//      }
//    } else if ((*it).second == 2) {
//      // Marking not implemented for false dependency in instruction yet!
//      // At the current moment it is not needed.
//    }
//  }
//
//  // Printing reverseInstructionList will be omitted in the final commit
//  /*for (std::vector<std::pair<KInstruction *, int> >::const_reverse_iterator
//           it = reverseInstructionList.rbegin(),
//           ie = reverseInstructionList.rend();
//       it != ie; ++it) {
//    (*it).first->inst->dump();
//    llvm::errs() << " " << (*it).second << "\n";
//  }*/
//  return reverseInstructionList;
//}
//
// ref<Expr> WeakestPreCondition::GenerateWP(
//    std::vector<std::pair<KInstruction *, int> > reverseInstructionList,
//    bool markAllFlag) {
//
//  if (debugSubsumptionLevel >= 4)
//    klee_message("**********WP Interpolant Start************");
//  for (std::vector<std::pair<KInstruction *, int> >::const_reverse_iterator it
// =
//      reverseInstructionList.rbegin(), ie = reverseInstructionList.rend();
//      it != ie; ++it) {
//    llvm::Instruction *i = (*it).first->inst;
//    if ((*it).second == 1 || markAllFlag == true) {
//      // Retrieve the instruction
//      if (debugSubsumptionLevel >= 4) {
//        klee_message("Printing LLVM Instruction: ");
//        i->dump();
//        klee_message("---------------------------------------------");
//      }
//
//      switch (i->getOpcode()) {
//
//      case llvm::Instruction::Br: {
//        llvm::BranchInst *bi = cast<llvm::BranchInst>(i);
//        if (bi->isUnconditional()) {
//          if (markAllFlag != true)
//            klee_error("Unconditional BR is not marked in WP!");
//          // else
//          // Nothing is needed to be done	.
//        } else {
//          // llvm::Value* cond = bi->getCondition();
//          // Nothing specific is needed to be done for now.
//        }
//        break;
//      }
//
//      case llvm::Instruction::FCmp:
//      case llvm::Instruction::ICmp: {
//        if (markAllFlag == true && !isTargetDependent(i, this->WPExpr)) {
//          break;
//        }
//
//        // Getting the expressions from the left and right operand
//        ref<Expr> left = this->generateExprFromOperand(i, 0);
//        ref<Expr> right = this->generateExprFromOperand(i, 1);
//        ref<Expr> result;
//        // second step is to Storing the updated WP expression
//        llvm::CmpInst *ICC = dyn_cast<llvm::CmpInst>(i);
//        switch (ICC->getPredicate()) {
//        case llvm::CmpInst::ICMP_EQ:
//          result = EqExpr::create(left, right);
//          break;
//        case llvm::CmpInst::ICMP_NE:
//          result = NeExpr::create(left, right);
//          break;
//        case llvm::CmpInst::ICMP_UGT:
//          result = UgtExpr::create(left, right);
//          break;
//        case llvm::CmpInst::ICMP_UGE:
//          result = UgeExpr::create(left, right);
//          break;
//        case llvm::CmpInst::ICMP_ULT:
//          result = UltExpr::create(left, right);
//          break;
//        case llvm::CmpInst::ICMP_ULE:
//          result = UleExpr::create(left, right);
//          break;
//        case llvm::CmpInst::ICMP_SGT:
//          result = SgtExpr::create(left, right);
//          break;
//        case llvm::CmpInst::ICMP_SGE:
//          result = SgeExpr::create(left, right);
//          break;
//        case llvm::CmpInst::ICMP_SLT:
//          result = SltExpr::create(left, right);
//          break;
//        case llvm::CmpInst::ICMP_SLE:
//          result = SleExpr::create(left, right);
//          break;
//          // todo Handle Floating Point
//        case llvm::CmpInst::FCMP_FALSE:
//          klee_error("FCMP_FALSE not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_OEQ:
//          klee_error("FCMP_OEQ not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_OGT:
//          klee_error("FCMP_OGT not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_OGE:
//          klee_error("FCMP_OGE not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_OLT:
//          klee_error("FCMP_OLT not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_OLE:
//          klee_error("FCMP_OLE not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_ONE:
//          klee_error("FCMP_ONE not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_ORD:
//          klee_error("FCMP_ORD not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_UNO:
//          klee_error("FCMP_UNO not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_UEQ:
//          klee_error("FCMP_UEQ not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_UGT:
//          klee_error("FCMP_UGT not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_UGE:
//          klee_error("FCMP_UGE not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_ULT:
//          klee_error("FCMP_ULT not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_ULE:
//          klee_error("FCMP_ULE not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_UNE:
//          klee_error("FCMP_UNE not implemented yet!");
//          break;
//        case llvm::CmpInst::FCMP_TRUE:
//          klee_error("FCMP_TRUE not implemented yet!");
//          break;
//        case llvm::CmpInst::BAD_FCMP_PREDICATE:
//          klee_error("BAD_FCMP_PREDICATE not implemented yet!");
//          break;
//        case llvm::CmpInst::BAD_ICMP_PREDICATE:
//          klee_error("BAD_ICMP_PREDICATE not implemented yet!");
//          break;
//        }
//
//        this->updateWPExpr(result);
//        break;
//      }
//
//      case llvm::Instruction::FAdd:
//      case llvm::Instruction::Add:
//      case llvm::Instruction::Sub:
//      case llvm::Instruction::FSub:
//      case llvm::Instruction::Mul:
//      case llvm::Instruction::FMul:
//      case llvm::Instruction::FDiv:
//      case llvm::Instruction::UDiv:
//      case llvm::Instruction::SDiv:
//      case llvm::Instruction::URem:
//      case llvm::Instruction::SRem:
//      case llvm::Instruction::And:
//      case llvm::Instruction::Or:
//      case llvm::Instruction::Xor:
//      case llvm::Instruction::Shl:
//      case llvm::Instruction::LShr:
//      case llvm::Instruction::AShr: {
//        if (markAllFlag == true && !isTargetDependent(i, this->WPExpr)) {
//          break;
//        }
//        // Getting the expressions from the left and right operand
//        ref<Expr> left = this->generateExprFromOperand(i, 0);
//        ref<Expr> right = this->generateExprFromOperand(i, 1);
//
//        ref<Expr> rhs;
//        switch (i->getOpcode()) {
//        case llvm::Instruction::Add:
//          rhs = AddExpr::create(left, right);
//          break;
//        case llvm::Instruction::Sub:
//          rhs = SubExpr::create(left, right);
//          break;
//        case llvm::Instruction::Mul:
//          rhs = MulExpr::create(left, right);
//          break;
//        case llvm::Instruction::UDiv:
//          rhs = UDivExpr::create(left, right);
//          break;
//        case llvm::Instruction::SDiv:
//          rhs = SDivExpr::create(left, right);
//          break;
//        case llvm::Instruction::URem:
//          rhs = URemExpr::create(left, right);
//          break;
//        case llvm::Instruction::SRem:
//          rhs = SRemExpr::create(left, right);
//          break;
//        case llvm::Instruction::And:
//          rhs = AndExpr::create(left, right);
//          break;
//        case llvm::Instruction::Or:
//          rhs = OrExpr::create(left, right);
//          break;
//        case llvm::Instruction::Xor:
//          rhs = XorExpr::create(left, right);
//          break;
//        case llvm::Instruction::Shl:
//          rhs = ShlExpr::create(left, right);
//          break;
//        case llvm::Instruction::LShr:
//          rhs = LShrExpr::create(left, right);
//          break;
//        case llvm::Instruction::AShr:
//          rhs = AShrExpr::create(left, right);
//          break;
//        }
//
//        ref<Expr> lhs = this->getLHS(i);
//        ref<Expr> result = EqExpr::create(lhs, rhs);
//        this->updateWPExpr(result);
//        break;
//      }
//
//      case llvm::Instruction::Load: {
//        // Do nothing, Load instructions are handled by the
//        // generateExprFromOperand
//        // function in binary operations
//        break;
//      }
//
//      case llvm::Instruction::Store: {
//        if (markAllFlag == true
//            && !isTargetDependent(i->getOperand(1), this->WPExpr)) {
//          break;
//        }
//        ref<Expr> left = this->generateExprFromOperand(i, 0);
//        ref<Expr> right = this->generateExprFromOperand(i, 1);
//        ref<Expr> result = EqExpr::create(right, left);
//        this->updateWPExpr(result);
//        break;
//      }
//
//      case llvm::Instruction::Call: {
//        if (markAllFlag == true && !isTargetDependent(i, this->WPExpr)) {
//          break;
//        }
//
//        llvm::CallInst *call = dyn_cast<llvm::CallInst>(i);
//
//        if (call->getCalledFunction()->getName() == "klee_assume") {
//          // Nothing specific is needed to be done for now.
//        } else if (call->getCalledFunction()->getName()
//            == "klee_make_symbolic") {
//          // Nothing specific is needed to be done for now.
//        } else {
//          if (call->doesNotReturn()) {
//            klee_error("Call Instructions without return value are not yet "
//                "implemented.");
//          } else {
//            llvm::Function *CalledFunc = call->getCalledFunction();
//            llvm::Function::ArgumentListType &args =
//                CalledFunc->getArgumentList();
//            llvm::Function::ArgumentListType::iterator firstArg =
// args.begin();
//            llvm::Function::ArgumentListType::iterator lastArg = args.end();
//            uint64_t i = 0;
//            for (; firstArg != lastArg && i < call->getNumOperands();
//                ++firstArg, i++) {
//              llvm::Value *funcArg = dyn_cast<llvm::Value>(firstArg);
//              this->WPExpr = replaceCallArguments(this->WPExpr, funcArg,
//                  call->getOperand(i));
//            }
//            klee_error(
//                "Call Instructions with return value are not yet
// implemented.");
//          }
//        }
//        break;
//      }
//
//      case llvm::Instruction::ZExt:
//      case llvm::Instruction::SExt:
//      case llvm::Instruction::Trunc:
//      case llvm::Instruction::BitCast: {
//        // Getting the expressions from the operand
//        ref<Expr> operand = this->generateExprFromOperand(i, 0);
//        if (markAllFlag == true && !isTargetDependent(i, this->WPExpr)) {
//          break;
//        }
//        ref<Expr> lhs = this->getLHS(i);
//        ref<Expr> result = EqExpr::create(lhs, operand);
//        this->updateWPExpr(result);
//        break;
//      }
//
//      case llvm::Instruction::FPToSI:
//      case llvm::Instruction::SIToFP:
//      case llvm::Instruction::Alloca: {
//        // Nothing specific is needed to be done for now.
//        break;
//      }
//
//      case llvm::Instruction::GetElementPtr: {
//        if (markAllFlag == true && !isTargetDependent(i, this->WPExpr)) {
//          break;
//        }
//        klee_error("GetElementPtr Instruction is not yet implemented.");
//      }
//
//      case llvm::Instruction::Ret: {
//        if (markAllFlag == true && !isTargetDependent(i, this->WPExpr)) {
//          break;
//        }
//        klee_error("Ret Instruction is not yet implemented.");
//      }
//
//      case llvm::Instruction::Switch: {
//        llvm::SwitchInst *si = cast<llvm::SwitchInst>(i);
//        if (markAllFlag == true
//            && !isTargetDependent(si->getCondition(), this->WPExpr)) {
//          break;
//        }
//        klee_error("Switch Instruction is not yet implemented.");
//      }
//
//      default: {
//        klee_message("+++++++++++++++++++++++++++++++++++++++++++++");
//        klee_message("LLVM Instruction Not Implemeneted Yet: ");
//        i->dump();
//        klee_error("+++++++++++++++++++++++++++++++++++++++++++++");
//      }
//      }
//      if (debugSubsumptionLevel >= 4) {
//        klee_message("**** Weakest PreCondition At Each Instruction ****");
//        WPExpr->dump();
//        klee_message("***************************************");
//      }
//    } else if ((*it).second == 2) {
//      klee_message("False case of LLVM Instruction Not Implemeneted Yet");
//      i->dump();
//    }
//  }
//
//  if (debugSubsumptionLevel >= 3) {
//    klee_message("***************************************");
//    klee_message("******** Weakest PreCondition *********");
//    WPExpr->dump();
//    klee_message("***************************************");
//  }
//
//  if (debugSubsumptionLevel >= 4)
//    klee_message("**********Generating WP finished**********");
//
//  return WPExpr;
//}

ref<Expr> WeakestPreCondition::generateExprFromOperand(llvm::Instruction *i,
    int operand) {
  // Generating WP from Operand1
  ref<Expr> left;
  // TODO WP: FIX THE CODE BASED ON THE CHANGE OF WP FROM EXPR TO VECTOR<EXPR>
  llvm::Value *operand1 = i->getOperand(operand);
  if (isa<llvm::ConstantInt>(operand1)) {
    llvm::ConstantInt *CI = dyn_cast<llvm::ConstantInt>(operand1);
    if (CI->getBitWidth() <= 32)
      left = ConstantExpr::create(CI->getZExtValue(), Expr::Int32);
    else
      left = ConstantExpr::create(CI->getZExtValue(), Expr::Int64);
  } else if (isa<llvm::LoadInst>(operand1)) {
    llvm::LoadInst *inst = dyn_cast<llvm::LoadInst>(operand1);
    if (isa<llvm::GlobalValue>(inst->getOperand(0))) {
      left = dependency->getAddress(inst->getOperand(0), &WPArrayStore::ac,
          WPArrayStore::array, this);
    } else if (isa<llvm::ConstantExpr>(inst->getOperand(0))) {
      llvm::ConstantExpr *gep = dyn_cast<llvm::ConstantExpr>(
          inst->getOperand(0));
      left = dependency->getPointerAddress(gep, &WPArrayStore::ac,
          WPArrayStore::array, this);
    } else if (isa<llvm::LoadInst>(inst->getOperand(0))) {
      llvm::LoadInst *inst2 = dyn_cast<llvm::LoadInst>(inst->getOperand(0));
      left = dependency->getAddress(inst2->getOperand(0), &WPArrayStore::ac,
          WPArrayStore::array, this);
    } else {
      left = dependency->getAddress(inst->getOperand(0), &WPArrayStore::ac,
          WPArrayStore::array, this);
    }
  } else if (isa<llvm::BinaryOperator>(operand1)) {
    llvm::Instruction *op1 = dyn_cast<llvm::Instruction>(operand1);
    ref<Expr> arg1 = generateExprFromOperand(op1, 0);
    ref<Expr> arg2 = generateExprFromOperand(op1, 1);

    switch (op1->getOpcode()) {
    case llvm::Instruction::Add: {
      left = AddExpr::create(arg1, arg2);
      break;
    }
    case llvm::Instruction::Sub: {
      left = SubExpr::create(arg1, arg2);
      break;
    }
    case llvm::Instruction::Mul: {
      left = MulExpr::create(arg1, arg2);
      break;
    }
    case llvm::Instruction::UDiv: {
      left = UDivExpr::create(arg1, arg2);
      break;
    }
    case llvm::Instruction::SDiv: {
      left = SDivExpr::create(arg1, arg2);
      break;
    }
    case llvm::Instruction::URem: {
      left = URemExpr::create(arg1, arg2);
      break;
    }
    case llvm::Instruction::SRem: {
      left = SRemExpr::create(arg1, arg2);
      break;
    }
    case llvm::Instruction::And: {
      left = AndExpr::create(arg1, arg2);
      break;
    }
    case llvm::Instruction::Or: {
      left = OrExpr::create(arg1, arg2);
      break;
    }
    case llvm::Instruction::Xor: {
      left = XorExpr::create(arg1, arg2);
      break;
    }
    case llvm::Instruction::Shl: {
      left = ShlExpr::create(arg1, arg2);
      break;
    }
    case llvm::Instruction::LShr: {
      left = LShrExpr::create(arg1, arg2);
      break;
    }
    case llvm::Instruction::AShr: {
      left = AShrExpr::create(arg1, arg2);
      break;
    }
    default: {
      klee_error("WeakestPreCondition::generateExprFromOperand Binary Operand "
                 "not implemented...\n");
    }
    }

  } else {
//    klee_error("WeakestPreCondition::generateExprFromOperand Remaining cases"
//               "not implemented...\n");
     left = dependency->getAddress(operand1, &WPArrayStore::ac,
                                  WPArrayStore::array, this);
  }
  return left;
}

ref<Expr> WeakestPreCondition::getLHS(llvm::Instruction *i) {
  ref<Expr> lhs =
      dependency->getAddress(i, &WPArrayStore::ac, WPArrayStore::array, this);
  return lhs;
}
//
// void WeakestPreCondition::updateWPExpr(ref<Expr> result) {
//  if (WPExpr == eb->False()) {
//    WPExpr = result;
//  } else {
//    this->substituteExpr(result);
//    this->simplifyWPExpr();
//  }
//}
//
// void WeakestPreCondition::substituteExpr(ref<Expr> result) {
//  switch (result->getKind()) {
//  case Expr::Constant: {
//    // Nothing is needed to be done, it's either true or false
//    break;
//  }
//  case Expr::Eq: {
//    ref<Expr> lhs = result->getKid(0);
//    ref<Expr> rhs = result->getKid(1);
//    if (isa<ConstantExpr>(rhs)) {
//      ref<Expr> temp = lhs;
//      lhs = rhs;
//      rhs = temp;
//    }
//
//    WPExpr = this->substituteExpr(WPExpr, lhs, rhs);
//    break;
//  }
//  default: {
//    result->dump();
//    klee_error("Substitution for this expressions is not defined yet!");
//  }
//  }
//}
//
// ref<Expr> WeakestPreCondition::substituteExpr(ref<Expr> base,
//    const ref<Expr> lhs, const ref<Expr> rhs) {
//  if (base.compare(lhs) == 0)
//    return rhs;
//  else if (base.compare(rhs) == 0)
//    return lhs;
//  else {
//    switch (base->getKind()) {
//    case Expr::InvalidKind:
//    case Expr::Constant: {
//      return base;
//    }
//
//    case Expr::NotOptimized:
//    case Expr::Read:
//    case Expr::Not:
//    case Expr::Extract:
//    case Expr::ZExt:
//    case Expr::SExt: {
//      ref<Expr> kids[1];
//      kids[0] = this->substituteExpr(base->getKid(0), lhs, rhs);
//      return base->rebuild(kids);
//    }
//
//    case Expr::Concat:
//    case Expr::Eq:
//    case Expr::Ne:
//    case Expr::Ult:
//    case Expr::Ule:
//    case Expr::Ugt:
//    case Expr::Uge:
//    case Expr::Slt:
//    case Expr::Sle:
//    case Expr::Sgt:
//    case Expr::Sge:
//    case Expr::LastKind:
//    case Expr::Add:
//    case Expr::Sub:
//    case Expr::Mul:
//    case Expr::UDiv:
//    case Expr::SDiv:
//    case Expr::URem:
//    case Expr::SRem:
//    case Expr::And:
//    case Expr::Or:
//    case Expr::Xor:
//    case Expr::Shl:
//    case Expr::LShr:
//    case Expr::AShr: {
//      ref<Expr> kids[2];
//      kids[0] = this->substituteExpr(base->getKid(0), lhs, rhs);
//      kids[1] = this->substituteExpr(base->getKid(1), lhs, rhs);
//      return base->rebuild(kids);
//    }
//
//    case Expr::Select: {
//      ref<Expr> kids[3];
//      kids[0] = this->substituteExpr(base->getKid(0), lhs, rhs);
//      kids[1] = this->substituteExpr(base->getKid(1), lhs, rhs);
//      kids[2] = this->substituteExpr(base->getKid(1), lhs, rhs);
//      return base->rebuild(kids);
//    }
//    }
//  }
//  // Sanity check
//  klee_error(
//      "Control should not reach here in
// WeakestPreCondition::substituteExpr!");
//  return base;
//}
//
// void WeakestPreCondition::simplifyWPExpr() {
//
//  switch (WPExpr->getKind()) {
//  case Expr::Eq:
//  case Expr::Ne:
//  case Expr::Ult:
//  case Expr::Ule:
//  case Expr::Ugt:
//  case Expr::Uge:
//  case Expr::Slt:
//  case Expr::Sle:
//  case Expr::Sgt:
//  case Expr::Sge: {
//    ref<Expr> kids[2];
//    kids[0] = WPExpr->getKid(0);
//    kids[1] = WPExpr->getKid(1);
//    std::map<ref<Expr>, uint64_t> *newLinearTerm = new std::map<ref<Expr>,
//        uint64_t>;
//    if (isa<ConstantExpr>(kids[1])) {
//      ref<ConstantExpr> constant = dyn_cast<ConstantExpr>(kids[1]);
//      insertTerm(newLinearTerm, constant->getZExtValue(),
//          WPArrayStore::constValues);
//    } else {
//      newLinearTerm = this->simplifyWPTerm(newLinearTerm, kids[1]);
//    }
//    newLinearTerm = this->simplifyWPTerm(newLinearTerm, kids[0]);
//    convertToExpr(newLinearTerm);
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
//    WPExpr->dump();
//    klee_error("All WP Expressions should be in the form LinearTerm CMP "
//        "Constant. Ex. X + 2Y < 5");
//  }
//  }
//}
//
// std::map<ref<Expr>, uint64_t> *WeakestPreCondition::simplifyWPTerm(
//    std::map<ref<Expr>, uint64_t> *newLinearTerm, ref<Expr> linearTerm) {
//  if (isa<ConstantExpr>(linearTerm)) {
//    ref<ConstantExpr> constant = dyn_cast<ConstantExpr>(linearTerm);
//    insertTerm(newLinearTerm, (-1) * constant->getZExtValue(),
//        WPArrayStore::constValues);
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
//
// void WeakestPreCondition::insertTerm(
//    std::map<ref<Expr>, uint64_t> *newLinearTerm, uint64_t coeff,
//    const ref<Expr> variable) {
//  std::map<ref<Expr>, uint64_t>::iterator it = newLinearTerm->find(variable);
//  if (it == newLinearTerm->end())
//    newLinearTerm->insert(std::pair<ref<Expr>, uint64_t>(variable, coeff));
//  else
//    it->second = it->second + coeff;
//}
//
// void WeakestPreCondition::convertToExpr(
//    std::map<ref<Expr>, uint64_t> *newLinearTerm) {
//  ref<Expr> kids[2];
//  ref<Expr> temp = eb->False();
//  for (std::map<ref<Expr>, uint64_t>::const_iterator it =
//      newLinearTerm->begin(), ie = newLinearTerm->end(); it != ie; ++it) {
//    if (it->first == WPArrayStore::constValues) {
//      kids[1] = ConstantExpr::create(it->second, Expr::Int32);
//    } else {
//      ref<Expr> lhs;
//      if (it->second == 1) {
//        lhs = it->first;
//      } else {
//        lhs = MulExpr::create(ConstantExpr::create(it->second, Expr::Int32),
//            it->first);
//      }
//      if (temp == eb->False()) {
//        temp = lhs;
//      } else {
//        temp = AddExpr::create(lhs, temp);
//      }
//    }
//  }
//  kids[0] = temp;
//  WPExpr = WPExpr->rebuild(kids);
//}

std::vector<ref<Expr> > WeakestPreCondition::instantiateWPExpression(
    TxDependency *dependency,
    const std::vector<llvm::Instruction *> &callHistory,
    std::vector<ref<Expr> > WPExpr) {
  std::vector<ref<Expr> > result;
  for (std::vector<ref<Expr> >::const_iterator it = WPExpr.begin(), ie =
      WPExpr.end(); it != ie; ++it) {
    result.push_back(instantiateSingleExpression(dependency, callHistory, *it));
  }
  return result;
}

ref<Expr> WeakestPreCondition::instantiateSingleExpression(
    TxDependency *dependency,
    const std::vector<llvm::Instruction *> &callHistory,
    ref<Expr> singleWPExpr) {
  ref<Expr> dummy = ConstantExpr::create(0, Expr::Bool);
  switch (singleWPExpr->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    return singleWPExpr;
  }

  case Expr::Read: {
    llvm::Value *tempInstr = WPArrayStore::getValuePointer(singleWPExpr);
    if (tempInstr == NULL)
      klee_error(
          "WeakestPreCondition::instantiateWPExpression Value ref is null");
    ref<Expr> storeValue = dependency->getLatestValueOfAddress(tempInstr,
        callHistory);
    if (storeValue == dummy)
      return singleWPExpr;
    return storeValue;
  }

  case Expr::Concat: {
    llvm::Value *tempInstr = WPArrayStore::getValuePointer(singleWPExpr);
    if (tempInstr == NULL)
      klee_error(
          "WeakestPreCondition::instantiateWPExpression Value ref is null");
    ref<Expr> storeValue = dependency->getLatestValueOfAddress(tempInstr,
        callHistory);
    if (storeValue == dummy)
      return singleWPExpr;
    return storeValue;
  }

  case Expr::NotOptimized:
  case Expr::Not:
  case Expr::Extract:
  case Expr::ZExt:
  case Expr::SExt: {
    ref<Expr> kids[1];
    kids[0] = instantiateSingleExpression(dependency, callHistory,
        singleWPExpr->getKid(0));
    return singleWPExpr->rebuild(kids);
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
    kids[0] = instantiateSingleExpression(dependency, callHistory,
        singleWPExpr->getKid(0));
    kids[1] = instantiateSingleExpression(dependency, callHistory,
        singleWPExpr->getKid(1));
    return singleWPExpr->rebuild(kids);
  }

  case Expr::Select: {
    ref<Expr> kids[3];
    kids[0] = instantiateSingleExpression(dependency, callHistory,
        singleWPExpr->getKid(0));
    kids[1] = instantiateSingleExpression(dependency, callHistory,
        singleWPExpr->getKid(1));
    kids[2] = instantiateSingleExpression(dependency, callHistory,
        singleWPExpr->getKid(2));
    return singleWPExpr->rebuild(kids);
  }
  }
  // Sanity check
  klee_error("Control should not reach here in "
      "WeakestPreCondition::instantiateWPExpression!");
  return singleWPExpr;
}

std::vector<ref<Expr> > WeakestPreCondition::intersectExpr(
    std::vector<ref<Expr> > expr1, std::vector<ref<Expr> > expr2) {
  expr1.insert(expr1.end(), expr2.begin(), expr2.end());
  std::vector<Partition> partitions = PartitionHelper::partition(expr1);
  std::vector<ref<Expr> > result;
  for (std::vector<Partition>::const_iterator it = partitions.begin(), ie =
      partitions.end(); it != ie; ++it) {
    Partition exprsVars = (*it);
    // TODO WP: FIX THE CODE BASED ON THE CHANGE OF WP FROM EXPR TO VECTOR<EXPR>
    result.push_back(PartitionHelper::createAnd(exprsVars.exprs));
  }
  return result;
}

std::vector<ref<Expr> >
WeakestPreCondition::intersectExpr_aux(std::vector<ref<Expr> > expr1,
                                       std::vector<ref<Expr> > expr2) {
  return expr1;
  // TODO WP: FIX THE CODE BASED ON THE CHANGE OF WP FROM EXPR TO VECTOR<EXPR>
  /*if(expr1->getKind() == Expr::Sle && expr2->getKind() == Expr::Sle) {
   if (expr1->getKid(0) == expr2->getKid(0)){
   ref<Expr> kids[2];
   kids[0] = expr1->getKid(0);
   //sanity check
   assert(isa<ConstantExpr>(expr1->getKid(1)) &&
   "expr1->getKid(1) should be constant expression");
   assert(isa<ConstantExpr>(expr2->getKid(1)) &&
   "expr2->getKid(1) should be constant expression");
   kids[1] =
   this->getMinOfConstExpr(dyn_cast<ConstantExpr>(expr1->getKid(1)),dyn_cast<ConstantExpr>(expr2->getKid(1)));
   return expr1->rebuild(kids);
   }else{
   expr1->dump();
   expr2->dump();
   klee_error("WeakestPreCondition::intersectExpr left operands
   are not the same.");
   return AndExpr::create(expr1,expr2);
   }
   } else if (expr1->getKind() == Expr::Slt && expr2->getKind() == Expr::Slt) {
   if (expr1->getKid(0) == expr2->getKid(0)) {
   ref<Expr> kids[2];
   kids[0] = expr1->getKid(0);
   // sanity check
   assert(isa<ConstantExpr>(expr1->getKid(1)) &&
   "expr1->getKid(1) should be constant expression");
   assert(isa<ConstantExpr>(expr2->getKid(1)) &&
   "expr2->getKid(1) should be constant expression");
   kids[1] =
   this->getMinOfConstExpr(dyn_cast<ConstantExpr>(expr1->getKid(1)),
   dyn_cast<ConstantExpr>(expr2->getKid(1)));
   return expr1->rebuild(kids);
   } else {
   expr1->dump();
   expr2->dump();
   klee_error(
   "WeakestPreCondition::intersectExpr left operands are not the same.");
   return AndExpr::create(expr1, expr2);
   }
   }else{
   expr1->dump();
   expr2->dump();
   klee_error("WeakestPreCondition::intersectExpr for these expressions
   is not implemented yet.");
   return AndExpr::create(expr1,expr2);
   }*/
}

ref<ConstantExpr> WeakestPreCondition::getMinOfConstExpr(
    ref<ConstantExpr> expr1, ref<ConstantExpr> expr2) {
  if ((expr1->getAPValue().getSExtValue() < expr2->getAPValue().getSExtValue()))
    return expr1;
  else
    return expr2;
}

ref<ConstantExpr> WeakestPreCondition::getMaxOfConstExpr(
    ref<ConstantExpr> expr1, ref<ConstantExpr> expr2) {
  if (expr1.compare(expr2) <= 0)
    return expr1;
  else
    return expr2;
}

bool WeakestPreCondition::isTargetDependent(llvm::Value *inst, ref<Expr> wp) {
  switch (wp->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    return false;
  }

  case Expr::Read: {
    if (inst == WPArrayStore::getValuePointer(wp)) {
      return true;
    }
    return false;
  }

  case Expr::Concat: {
    if (inst
        == WPArrayStore::getValuePointer(WPArrayStore::getFunctionName(inst),
            wp)) {
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
    return (isTargetDependent(inst, kids[0]) || isTargetDependent(inst, kids[1]));
  }

  case Expr::Select: {
    ref<Expr> kids[3];
    kids[0] = WPExpr->getKid(0);
    kids[1] = WPExpr->getKid(1);
    kids[2] = WPExpr->getKid(2);
    return (isTargetDependent(inst, kids[0]) || isTargetDependent(inst, kids[1])
        || isTargetDependent(inst, kids[2]));
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
  std::set<const Array *> existentials = entry->getExistentials();

  if (concretelyAddressedStore.size() == 0)
    klee_error("WeakestPreCondition::updateSubsumptionTableEntry for this case "
        "is not implemented yet.");
  else {
    // TODO: Assuming WP is one frame
    TxStore::TopInterpolantStore newConcretelyAddressedStore =
        updateConcretelyAddressedStore(concretelyAddressedStore, wp);
    entry->setConcretelyAddressedStore(newConcretelyAddressedStore);
    // TODO: Currently we don't need to update the interpolant & the
    // existentials
    // ref<Expr> newInterpolant =
    //    updateInterpolant(interpolant, replaceArrayWithShadow(wp));
    // std::set<const Array *> newExistentials =
    //    updateExistentials(existentials, wp);
    // entry->setInterpolant(newInterpolant);
    // entry->setExistentials(newExistentials);
  }
  if (debugSubsumptionLevel >= 4) {
    // For future reference
    if (!interpolant.isNull())
      interpolant->dump();

    concretelyAddressedStore = entry->getConcretelyAddressedStore();
    for (TopInterpolantStore::const_iterator it =
        concretelyAddressedStore.begin(), ie = concretelyAddressedStore.end();
        it != ie; ++it) {
      (*it).first->dump();
      LowerInterpolantStore temp = (*it).second;
      for (LowerInterpolantStore::const_iterator it2 = temp.begin(), ie2 =
          temp.end(); it2 != ie2; ++it2) {
        (*it2).first->dump();
        (*it2).second->dump();
      }
    }
    for (TopInterpolantStore::const_iterator it =
        symbolicallyAddressedStore.begin(), ie =
        symbolicallyAddressedStore.end(); it != ie; ++it) {
      (*it).first->dump();
      LowerInterpolantStore temp = (*it).second;
      for (LowerInterpolantStore::const_iterator it2 = temp.begin(), ie2 =
          temp.end(); it2 != ie2; ++it2) {
        (*it2).first->dump();
        (*it2).second->dump();
      }
    }

    for (LowerInterpolantStore::const_iterator it =
        concretelyAddressedHistoricalStore.begin(), ie =
        concretelyAddressedHistoricalStore.end(); it != ie; ++it) {
      (*it).first->dump();
      (*it).second->dump();
    }

    for (LowerInterpolantStore::const_iterator it =
        symbolicallyAddressedHistoricalStore.begin(), ie =
        symbolicallyAddressedHistoricalStore.end(); it != ie; ++it) {
      (*it).first->dump();
      (*it).second->dump();
    }
  }
  return entry;
}

TxStore::TopInterpolantStore WeakestPreCondition::updateConcretelyAddressedStore(
    TxStore::TopInterpolantStore concretelyAddressedStore, ref<Expr> wp) {

  ref<Expr> var = getVarFromExpr(wp);
  llvm::Value *allocaVar = WPArrayStore::getValuePointer(var);
  TopInterpolantStore::iterator candidateForRemove =
      concretelyAddressedStore.end();
  for (TopInterpolantStore::iterator it = concretelyAddressedStore.begin(), ie =
      concretelyAddressedStore.end(); it != ie; ++it) {

    if ((*it).first->getValue() == allocaVar)
      candidateForRemove = it;
  }

  if (candidateForRemove != concretelyAddressedStore.end()) {
    concretelyAddressedStore.erase(candidateForRemove);
  }
  return concretelyAddressedStore;
}

ref<Expr> WeakestPreCondition::getVarFromExpr(ref<Expr> wp) {
  // TODO: Assuming frame has only one variable.
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

  // At this point the WP has more than one frame. The algorithm to update is as
  // follow:
  // 1- Partition the interpolant to frames related and unrelated to WCET
  // 2- Replace the frame related to WCET with the WP formula

  ref<Expr> var = getVarFromExpr(wp);
  ref<Expr> unrelatedFrame = extractUnrelatedFrame(interpolant, var);
  if (unrelatedFrame == WPArrayStore::constValues)
    return wp;
  else
    return AndExpr::create(unrelatedFrame, wp);
}

ref<Expr> WeakestPreCondition::extractUnrelatedFrame(ref<Expr> interpolant,
    ref<Expr> var) {
  switch (interpolant->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    return interpolant;
  }

  case Expr::Read:
  case Expr::Concat: {
    if (interpolant == var)
      return WPArrayStore::constValues;
    else
      return interpolant;
  }

  case Expr::NotOptimized:
  case Expr::Not:
  case Expr::Extract:
  case Expr::ZExt:
  case Expr::SExt: {
    ref<Expr> kids[1];
    kids[0] = extractUnrelatedFrame(interpolant->getKid(0), var);
    if (kids[0] == WPArrayStore::constValues)
      return WPArrayStore::constValues;
    else
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
  case Expr::Shl:
  case Expr::LShr:
  case Expr::AShr: {
    ref<Expr> kids[2];
    kids[0] = extractUnrelatedFrame(interpolant->getKid(0), var);
    kids[1] = extractUnrelatedFrame(interpolant->getKid(1), var);
    if (kids[0] == WPArrayStore::constValues
        || kids[1] == WPArrayStore::constValues) {
      return WPArrayStore::constValues;
    } else {
      return interpolant->rebuild(kids);
    }
  }

    // pass the other one as frame
  case Expr::Or:
  case Expr::Xor:
  case Expr::And: {
    ref<Expr> kids[2];
    kids[0] = extractUnrelatedFrame(interpolant->getKid(0), var);
    kids[1] = extractUnrelatedFrame(interpolant->getKid(1), var);
    if (kids[0] == WPArrayStore::constValues
        && kids[1] == WPArrayStore::constValues)
      klee_error("WeakestPreCondition::extractUnrelatedFrame This AND case is "
          "not implemented yet!");
    if (kids[0] == WPArrayStore::constValues
        && !(kids[1] == WPArrayStore::constValues)) {
      return kids[1];
    } else if (!(kids[0] == WPArrayStore::constValues)
        && kids[1] == WPArrayStore::constValues) {
      return kids[0];
    } else {
      return interpolant->rebuild(kids);
    }
  }

  case Expr::Select: {
    ref<Expr> kids[3];
    kids[0] = extractUnrelatedFrame(interpolant->getKid(0), var);
    kids[1] = extractUnrelatedFrame(interpolant->getKid(1), var);
    kids[2] = extractUnrelatedFrame(interpolant->getKid(2), var);
    if (kids[0] == WPArrayStore::constValues
        || kids[1] == WPArrayStore::constValues
        || kids[2] == WPArrayStore::constValues)
      return WPArrayStore::constValues;
    else
      return interpolant->rebuild(kids);
  }
  }
  // Sanity check
  klee_error("Control should not reach here in "
      "WeakestPreCondition::extractUnrelatedFrame");
  return interpolant;
}

ref<Expr> WeakestPreCondition::replaceArrayWithShadow(ref<Expr> interpolant) {
  switch (interpolant->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    return interpolant;
  }

  case Expr::Read:
  case Expr::Concat: {
    llvm::Value *array = WPArrayStore::getValuePointer(interpolant);
    std::string arrayName = array->getName();
    const std::string ext(".addr");
    if (arrayName.find(ext))
      arrayName = arrayName.substr(0, arrayName.size() - ext.size());
    const Array *symArray = TxShadowArray::getSymbolicShadowArray(
        array->getName());
    if (symArray != NULL) {
      ref<Expr> Res(0);
      unsigned NumBytes = symArray->getDomain() / 8;
      assert(symArray->getDomain() == NumBytes * 8 && "Invalid read size!");
      for (unsigned i = 0; i != NumBytes; ++i) {
        unsigned idx = Context::get().isLittleEndian() ? i : (NumBytes - i - 1);
        ref<Expr> Byte = ReadExpr::create(UpdateList(symArray, 0),
            ConstantExpr::alloc(idx, symArray->getDomain()));
        Res = i ? ConcatExpr::create(Byte, Res) : Byte;
      }
      return Res;
    } else {
      interpolant->dump();
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

std::set<const Array *> WeakestPreCondition::updateExistentials(
    std::set<const Array *> existentials, ref<Expr> wp) {
  switch (wp->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    return existentials;
  }

  case Expr::Read:
  case Expr::Concat: {
    llvm::Value *array = WPArrayStore::getValuePointer(wp);
    std::string arrayName = array->getName();
    const std::string ext(".addr");
    if (arrayName.find(ext))
      arrayName = arrayName.substr(0, arrayName.size() - ext.size());
    const Array *symArray = TxShadowArray::getSymbolicShadowArray(
        array->getName());
    if (!symArray) {
      wp->dump();
      klee_error("WeakestPreCondition::updateExistentials Shadow array doesn't "
          "exist!");
    }
    if (existentials.find(symArray) == existentials.end()) {
      existentials.insert(symArray);
    }
    return existentials;
  }

  case Expr::NotOptimized:
  case Expr::Not:
  case Expr::Extract:
  case Expr::ZExt:
  case Expr::SExt: {
    std::set<const Array *> newExistentials = updateExistentials(existentials,
        wp->getKid(0));
    return newExistentials;
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
    std::set<const Array *> newExistentials = updateExistentials(existentials,
        wp->getKid(0));
    std::set<const Array *> newExistentials2 = updateExistentials(
        newExistentials, wp->getKid(1));
    return newExistentials2;
  }

  case Expr::Select: {
    std::set<const Array *> newExistentials = updateExistentials(existentials,
        wp->getKid(0));
    std::set<const Array *> newExistentials2 = updateExistentials(
        newExistentials, wp->getKid(1));
    std::set<const Array *> newExistentials3 = updateExistentials(
        newExistentials2, wp->getKid(2));
    return newExistentials3;
  }
  }
  // Sanity check
  klee_error(
      "Control should not reach here in WeakestPreCondition::getVarFromExpr");
  return existentials;
}

ref<Expr> WeakestPreCondition::replaceCallArguments(ref<Expr> interpolant,
    llvm::Value *funcArg, llvm::Value *callArg) {
  switch (interpolant->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    return interpolant;
  }

  case Expr::Read:
  case Expr::Concat: {
    llvm::Value *array = WPArrayStore::getValuePointer(interpolant);
    if (array == funcArg) {
      std::string arrayName = callArg->getName();
      const std::string ext(".addr");
      if (arrayName.find(ext))
        arrayName = arrayName.substr(0, arrayName.size() - ext.size());
      const Array *symArray = TxShadowArray::getSymbolicShadowArray(arrayName);
      llvm::errs() << symArray->getName();

      if (symArray != NULL) {
        ref<Expr> Res(0);
        unsigned NumBytes = symArray->getDomain() / 8;
        assert(symArray->getDomain() == NumBytes * 8 && "Invalid read size!");
        for (unsigned i = 0; i != NumBytes; ++i) {
          unsigned idx =
              Context::get().isLittleEndian() ? i : (NumBytes - i - 1);
          ref<Expr> Byte = ReadExpr::create(UpdateList(symArray, 0),
              ConstantExpr::alloc(idx, symArray->getDomain()));
          Res = i ? ConcatExpr::create(Byte, Res) : Byte;
        }
        klee_error("WeakestPreCondition::replaceCallArguments Not tested yet");
        return Res;
      } else {
        interpolant->dump();
        klee_error("WeakestPreCondition::replaceCallArguments Shadow array "
            "doesn't exist!");
      }
    }
    return interpolant;
  }

  case Expr::NotOptimized:
  case Expr::Not:
  case Expr::Extract:
  case Expr::ZExt:
  case Expr::SExt: {
    ref<Expr> kids[1];
    kids[0] = replaceCallArguments(interpolant->getKid(0), funcArg, callArg);
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
    kids[0] = replaceCallArguments(interpolant->getKid(0), funcArg, callArg);
    kids[1] = replaceCallArguments(interpolant->getKid(1), funcArg, callArg);
    return interpolant->rebuild(kids);
  }

  case Expr::Select: {
    ref<Expr> kids[3];
    kids[0] = replaceCallArguments(interpolant->getKid(0), funcArg, callArg);
    kids[1] = replaceCallArguments(interpolant->getKid(1), funcArg, callArg);
    kids[2] = replaceCallArguments(interpolant->getKid(2), funcArg, callArg);
    return interpolant->rebuild(kids);
  }
  }
  // Sanity check
  klee_error("Control should not reach here in "
      "WeakestPreCondition::replaceCallArguments");
  return interpolant;
}

// =========================================================================
// Updated Version of Weakest PreCondition
// =========================================================================
std::vector<ref<Expr> > WeakestPreCondition::GenerateWP(
    std::vector<std::pair<KInstruction *, int> > reverseInstructionList) {

  for (std::vector<std::pair<KInstruction *, int> >::const_reverse_iterator it =
      reverseInstructionList.rbegin(), ie = reverseInstructionList.rend();
      it != ie; ++it) {
    llvm::Instruction *i = (*it).first->inst;

    int flag = (*it).second;
    if (flag == 1) {
      // 1- call getCondition on the cond argument of the branch instruction
      // 2- create and expression from the condition and this->WPExpr
      ref<Expr> cond = getCondition(i);
      //      llvm::outs() << "--- start 1 ---\n";
      //      i->dump();
      //      cond->dump();
      //      llvm::outs() << "--- end 1 ---\n";
      WPExprs.push_back(cond);
    } else if (flag == 2) {
      // 1- call getCondition on the cond argument of the branch instruction
      // 2- generate not(condition): expr::not(condition)
      // 3- create and expression from the condition and this->WPExpr
      //      llvm::outs() << "--- start 2 ---\n";
      //      getCondition(i)->dump();
      ref<Expr> negCond = NotExpr::create(getCondition(i));

      //      i->dump();
      //      negCond->dump();
      //      llvm::outs() << "--- end 2 ---\n";
      WPExprs.push_back(negCond);
    } else if (i->getOpcode() == llvm::Instruction::Store) {
      // i is 0
      std::vector<ref<Expr> > tmp;
      for (std::vector<ref<Expr> >::const_iterator it = WPExprs.begin(),
                                                   ie = WPExprs.end();
           it != ie; ++it) {
        tmp.push_back(getPrevExpr(*it, i));
      }
      WPExprs = tmp;
    }
  }

  klee_warning("Start printing the WP");
  if (WPExprs.size() > 0) {
    for (std::vector<ref<Expr> >::const_reverse_iterator it = WPExprs.rbegin(),
        ie = WPExprs.rend(); it != ie; ++it) {
      (*it)->dump();
    }
  }
  klee_warning("End of printing the WP");
  return WPExprs;
}

ref<Expr> WeakestPreCondition::getPrevExpr(ref<Expr> e, llvm::Instruction *i) {
  ref<Expr> ret = e;
  switch (i->getOpcode()) {
  case llvm::Instruction::Store: {
    if (!WPHelper::isTargetDependent(i->getOperand(1), e)) {
      break;
    }
    ref<Expr> left = this->generateExprFromOperand(i, 0);
    ref<Expr> right = this->generateExprFromOperand(i, 1);
    ref<Expr> result = EqExpr::create(right, left);
    ref<Expr> result1 = WPHelper::substituteExpr(e, result);
    ret = WPHelper::simplifyWPExpr(WPHelper::substituteExpr(e, result));
    break;
  }

  default: {
    //    klee_message("+++++++++++++++++++++++++++++++++++++++++++++");
    //    klee_message("Instruction ignored: ");
    //    i->dump();
    //    klee_message("+++++++++++++++++++++++++++++++++++++++++++++");
  }
  }
  return ret;
}

ref<Expr> WeakestPreCondition::getCondition(llvm::Instruction *ins) {
  if (!llvm::isa<llvm::BranchInst>(ins))
    return True();

  llvm::BranchInst *br = llvm::dyn_cast<llvm::BranchInst>(ins);

  if (!llvm::isa<llvm::CmpInst>(br->getCondition()))
    return True();

  llvm::CmpInst *cmp = dyn_cast<llvm::CmpInst>(br->getCondition());

  // Getting the expressions from the left and right operand
  ref<Expr> left = this->generateExprFromOperand(cmp, 0);
  ref<Expr> right = this->generateExprFromOperand(cmp, 1);
  ref<Expr> result;
  // second step is to Storing the updated WP expression
  switch (cmp->getPredicate()) {
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
  return result;
}
