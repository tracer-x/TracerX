//===-- TxWP.cpp - Interpolation tree -------------------------*- C++ -*-===//
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

#include "TxWP.h"
#include "Context.h"
#include "TxTree.h"

#include <klee/Expr.h>
#include <klee/Internal/Support/ErrorHandling.h>

#include "TimingSolver.h"
#include "TxDependency.h"
#include "TxShadowArray.h"

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

TxWeakestPreCondition::TxWeakestPreCondition(TxTreeNode *_node,
                                             TxDependency *_dependency) {
  WPExpr = True();

  // Used to represent constants during the simplification of WPExpr to
  // canonical form
  node = _node;
  dependency = _dependency;
  if (dependency)
    debugSubsumptionLevel = dependency->debugSubsumptionLevel;
}

TxWeakestPreCondition::~TxWeakestPreCondition() {}

// std::vector<std::pair<KInstruction *, int> >
// TxWeakestPreCondition::markVariables(
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
// ref<Expr> TxWeakestPreCondition::GenerateWP(
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

// ref<Expr> TxWeakestPreCondition::replaceCallArguments(ref<Expr> interpolant,
//                                                      llvm::Value *funcArg,
//                                                      llvm::Value *callArg) {
//  switch (interpolant->getKind()) {
//  case Expr::InvalidKind:
//  case Expr::Constant: { return interpolant; }
//
//  case Expr::Read:
//  case Expr::Concat: {
//    llvm::Value *array = TxWPArrayStore::getValuePointer(interpolant);
//    if (array == funcArg) {
//      std::string arrayName = callArg->getName();
//      const std::string ext(".addr");
//      if (arrayName.find(ext))
//        arrayName = arrayName.substr(0, arrayName.size() - ext.size());
//      const Array *symArray =
// TxShadowArray::getSymbolicShadowArray(arrayName);
//      llvm::errs() << symArray->getName();
//
//      if (symArray != NULL) {
//        ref<Expr> Res(0);
//        unsigned NumBytes = symArray->getDomain() / 8;
//        assert(symArray->getDomain() == NumBytes * 8 && "Invalid read size!");
//        for (unsigned i = 0; i != NumBytes; ++i) {
//          unsigned idx =
//              Context::get().isLittleEndian() ? i : (NumBytes - i - 1);
//          ref<Expr> Byte =
//              ReadExpr::create(UpdateList(symArray, 0),
//                               ConstantExpr::alloc(idx,
// symArray->getDomain()));
//          Res = i ? ConcatExpr::create(Byte, Res) : Byte;
//        }
//        klee_error(
//            "TxWeakestPreCondition::replaceCallArguments Not tested yet");
//        return Res;
//      } else {
//        interpolant->dump();
//        klee_error("TxWeakestPreCondition::replaceCallArguments Shadow array "
//                   "doesn't exist!");
//      }
//    }
//    return interpolant;
//  }
//
//  case Expr::NotOptimized:
//  case Expr::Not:
//  case Expr::Extract:
//  case Expr::ZExt:
//  case Expr::SExt: {
//    ref<Expr> kids[1];
//    kids[0] = replaceCallArguments(interpolant->getKid(0), funcArg, callArg);
//    return interpolant->rebuild(kids);
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
//    kids[0] = replaceCallArguments(interpolant->getKid(0), funcArg, callArg);
//    kids[1] = replaceCallArguments(interpolant->getKid(1), funcArg, callArg);
//    return interpolant->rebuild(kids);
//  }
//
//  case Expr::Select: {
//    ref<Expr> kids[3];
//    kids[0] = replaceCallArguments(interpolant->getKid(0), funcArg, callArg);
//    kids[1] = replaceCallArguments(interpolant->getKid(1), funcArg, callArg);
//    kids[2] = replaceCallArguments(interpolant->getKid(2), funcArg, callArg);
//    return interpolant->rebuild(kids);
//  }
//  }
//  // Sanity check
//  klee_error("Control should not reach here in "
//             "TxWeakestPreCondition::replaceCallArguments");
//  return interpolant;
//}

// ref<Expr> TxWeakestPreCondition::getLHS(llvm::Instruction *i) {
//  ref<Expr> lhs = dependency->getAddress(i, &TxWPArrayStore::ac,
//                                         TxWPArrayStore::array, this);
//  return lhs;
//}
//
// void TxWeakestPreCondition::updateWPExpr(ref<Expr> result) {
//  if (WPExpr == eb->False()) {
//    WPExpr = result;
//  } else {
//    this->substituteExpr(result);
//    this->simplifyWPExpr();
//  }
//}
//
// void TxWeakestPreCondition::substituteExpr(ref<Expr> result) {
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
// ref<Expr> TxWeakestPreCondition::substituteExpr(ref<Expr> base,
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
// TxWeakestPreCondition::substituteExpr!");
//  return base;
//}
//
// void TxWeakestPreCondition::simplifyWPExpr() {
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
//          TxWPArrayStore::constValues);
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
// std::map<ref<Expr>, uint64_t> *TxWeakestPreCondition::simplifyWPTerm(
//    std::map<ref<Expr>, uint64_t> *newLinearTerm, ref<Expr> linearTerm) {
//  if (isa<ConstantExpr>(linearTerm)) {
//    ref<ConstantExpr> constant = dyn_cast<ConstantExpr>(linearTerm);
//    insertTerm(newLinearTerm, (-1) * constant->getZExtValue(),
//        TxWPArrayStore::constValues);
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
// void TxWeakestPreCondition::insertTerm(
//    std::map<ref<Expr>, uint64_t> *newLinearTerm, uint64_t coeff,
//    const ref<Expr> variable) {
//  std::map<ref<Expr>, uint64_t>::iterator it = newLinearTerm->find(variable);
//  if (it == newLinearTerm->end())
//    newLinearTerm->insert(std::pair<ref<Expr>, uint64_t>(variable, coeff));
//  else
//    it->second = it->second + coeff;
//}
//
// void TxWeakestPreCondition::convertToExpr(
//    std::map<ref<Expr>, uint64_t> *newLinearTerm) {
//  ref<Expr> kids[2];
//  ref<Expr> temp = eb->False();
//  for (std::map<ref<Expr>, uint64_t>::const_iterator it =
//      newLinearTerm->begin(), ie = newLinearTerm->end(); it != ie; ++it) {
//    if (it->first == TxWPArrayStore::constValues) {
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

/*****************************************************************************/

ref<Expr> TxWeakestPreCondition::intersectWPExpr(ref<Expr> branchCondition,
                                                 ref<Expr> expr1,
                                                 ref<Expr> expr2) {
  // v
  std::set<std::string> bvars = TxPartitionHelper::getExprVars(branchCondition);

  // Closure(W1,v)
  std::set<std::string> closure1 = bvars;
  std::vector<ref<Expr> > expr1Comps =
      TxPartitionHelper::getExprsFromAndExpr(expr1);
  for (std::vector<ref<Expr> >::iterator it = expr1Comps.begin(),
                                         ie = expr1Comps.end();
       it != ie; ++it) {
    std::set<std::string> tmpVars = TxPartitionHelper::getExprVars(*it);
    if (TxPartitionHelper::isShared(closure1, tmpVars)) {
      closure1.insert(tmpVars.begin(), tmpVars.end());
    }
  }

  // Closure(W2,v)
  std::set<std::string> closure2 = bvars;
  std::vector<ref<Expr> > expr2Comps =
      TxPartitionHelper::getExprsFromAndExpr(expr2);
  for (std::vector<ref<Expr> >::iterator it = expr2Comps.begin(),
                                         ie = expr2Comps.end();
       it != ie; ++it) {
    std::set<std::string> tmpVars = TxPartitionHelper::getExprVars(*it);
    if (TxPartitionHelper::isShared(closure2, tmpVars)) {
      closure2.insert(tmpVars.begin(), tmpVars.end());
    }
  }

  std::set<std::string> closure = closure1;
  closure.insert(closure2.begin(), closure2.end());

  // v1, v2
  std::set<std::string> wp1vars = TxPartitionHelper::getExprVars(expr1);
  std::set<std::string> v1 = TxPartitionHelper::diff(wp1vars, closure);
  std::set<std::string> wp2vars = TxPartitionHelper::getExprVars(expr2);
  std::set<std::string> v2 = TxPartitionHelper::diff(wp2vars, closure);

  std::vector<ref<Expr> > expr0Comps;
  // proj(W1, v1)
  for (std::vector<ref<Expr> >::iterator it = expr1Comps.begin(),
                                         ie = expr1Comps.end();
       it != ie; ++it) {
    std::set<std::string> tmpVars = TxPartitionHelper::getExprVars(*it);
    if (TxPartitionHelper::isShared(v1, tmpVars)) {
      expr0Comps.push_back(*it);
    }
  }

  // proj(W2, v2)
  for (std::vector<ref<Expr> >::iterator it = expr2Comps.begin(),
                                         ie = expr2Comps.end();
       it != ie; ++it) {
    std::set<std::string> tmpVars = TxPartitionHelper::getExprVars(*it);
    if (TxPartitionHelper::isShared(v2, tmpVars)) {
      expr0Comps.push_back(*it);
    }
  }

  ref<Expr> expr0 = TxPartitionHelper::createAnd(expr0Comps);
  return expr0;
}

// std::map<std::string, ref<Expr> > TxWeakestPreCondition::extractExprs(
//    TxStore::TopInterpolantStore concretelyAddressedStore) {
//  std::map<std::string, ref<Expr> > res;
//  for (TxStore::TopInterpolantStore::const_iterator
//           topIs = concretelyAddressedStore.begin(),
//           topIe = concretelyAddressedStore.end(), topIt = topIs;
//       topIt != topIe; ++topIt) {
//    std::string var(topIt->first->getValue()->getName().data());
//    ref<Expr> value = topIt->second.begin()->second->getExpression();
//    res.insert(std::pair<std::string, ref<Expr> >(var, value));
//  }
//  return res;
//}

/*std::vector<ref<Expr> >
TxWeakestPreCondition::intersectExpr_aux(std::vector<ref<Expr> > expr1,
                                         std::vector<ref<Expr> > expr2) {
  if(expr1->getKind() == Expr::Sle && expr2->getKind() == Expr::Sle) {
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
   klee_error("TxWeakestPreCondition::intersectExpr left operands
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
   "TxWeakestPreCondition::intersectExpr left operands are not the same.");
   return AndExpr::create(expr1, expr2);
   }
   }else{
   expr1->dump();
   expr2->dump();
   klee_error("TxWeakestPreCondition::intersectExpr for these expressions
   is not implemented yet.");
   return AndExpr::create(expr1,expr2);
   }
}*/

// ref<ConstantExpr>
// TxWeakestPreCondition::getMinOfConstExpr(ref<ConstantExpr> expr1,
//                                         ref<ConstantExpr> expr2) {
//  if ((expr1->getAPValue().getSExtValue() <
// expr2->getAPValue().getSExtValue()))
//    return expr1;
//  else
//    return expr2;
//}

// ref<ConstantExpr>
// TxWeakestPreCondition::getMaxOfConstExpr(ref<ConstantExpr> expr1,
//                                         ref<ConstantExpr> expr2) {
//  if (expr1.compare(expr2) <= 0)
//    return expr1;
//  else
//    return expr2;
//}

// bool TxWeakestPreCondition::isTargetDependent(llvm::Value *inst, ref<Expr>
// wp) {
//  switch (wp->getKind()) {
//  case Expr::InvalidKind:
//  case Expr::Constant: { return false; }
//
//  case Expr::Read: {
//    if (inst == TxWPArrayStore::getValuePointer(wp)) {
//      return true;
//    }
//    return false;
//  }
//
//  case Expr::Concat: {
//    if (inst == TxWPArrayStore::getValuePointer(
//                    TxWPArrayStore::getFunctionName(inst), wp)) {
//      return true;
//    }
//    return false;
//  }
//
//  case Expr::NotOptimized:
//  case Expr::Not:
//  case Expr::Extract:
//  case Expr::ZExt:
//  case Expr::SExt: {
//    ref<Expr> kids[1];
//    kids[0] = WPExpr->getKid(0);
//    return isTargetDependent(inst, kids[0]);
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
//    kids[0] = WPExpr->getKid(0);
//    kids[1] = WPExpr->getKid(1);
//    return (isTargetDependent(inst, kids[0]) ||
//            isTargetDependent(inst, kids[1]));
//  }
//
//  case Expr::Select: {
//    ref<Expr> kids[3];
//    kids[0] = WPExpr->getKid(0);
//    kids[1] = WPExpr->getKid(1);
//    kids[2] = WPExpr->getKid(2);
//    return (isTargetDependent(inst, kids[0]) ||
//            isTargetDependent(inst, kids[1]) ||
//            isTargetDependent(inst, kids[2]));
//  }
//  }
//  // Sanity check
//  klee_error("Control should not reach here in "
//             "TxWeakestPreCondition::isTargetDependent!");
//  return false;
//}

// =========================================================================
// Functions Updating the Subsumption Table Entry
// =========================================================================

/**
 * Use WP to update MIU & PI in markings
 */
TxSubsumptionTableEntry *TxWeakestPreCondition::updateSubsumptionTableEntry(
    TxSubsumptionTableEntry *entry) {

  if (entry->getWPInterpolant() == ConstantExpr::alloc(0, Expr::Bool))
    entry->setWPInterpolant(ConstantExpr::alloc(1, Expr::Bool));

  // vars(w)
  std::set<std::string> wpVars;
  if (!entry->getWPInterpolant().isNull())
    wpVars = TxPartitionHelper::getExprVars(entry->getWPInterpolant());

  // get vars(pi, miu)
  // vars(pi)
  std::set<std::string> pimiuVars;
  if (!entry->getInterpolant().isNull())
    pimiuVars = TxPartitionHelper::getExprVars(entry->getInterpolant());

  // vars(miu)
  TxStore::TopInterpolantStore concretelyAddressedStore =
      entry->getConcretelyAddressedStore();
  for (TxStore::TopInterpolantStore::iterator
           it1 = concretelyAddressedStore.begin(),
           ie1 = concretelyAddressedStore.end();
       it1 != ie1; ++it1) {
    if (strcmp(it1->first->getValue()->getName().data(), "") != 0) {
      pimiuVars.insert(it1->first->getValue()->getName().data());
      std::set<std::string> right = TxPartitionHelper::getExprVars(
          it1->second.begin()->second->getExpression());
      pimiuVars.insert(right.begin(), right.end());
    }
  }

  // revmoving __shadow__ from var names
  std::set<std::string> pimiuVars2;
  for (std::set<std::string>::iterator it1 = pimiuVars.begin(),
                                       ie1 = pimiuVars.end();
       it1 != ie1; ++it1) {
    std::string toErase = "__shadow__";
    size_t pos = (*it1).find(toErase);
    if (pos != std::string::npos) {
      std::string str = (*it1);
      str.erase(pos, toErase.length());
      pimiuVars2.insert(str);
    }
  }

  // get v1 = vars(pi,miu) - vars(w)
  std::set<std::string> v1 = TxPartitionHelper::diff(pimiuVars2, wpVars);

  // closure(pi,miu,v1)
  std::set<std::string> v1star = v1;
  // closure on pi
  std::vector<ref<Expr> > piComps =
      TxPartitionHelper::getExprsFromAndExpr(entry->getInterpolant());
  for (std::vector<ref<Expr> >::iterator it = piComps.begin(),
                                         ie = piComps.end();
       it != ie; ++it) {
    std::set<std::string> tmp = TxPartitionHelper::getExprVars(*it);
    if (TxPartitionHelper::isShared(tmp, v1star)) {
      v1star.insert(tmp.begin(), tmp.end());
    }
  }

  // closure on miu
  for (TxStore::TopInterpolantStore::iterator
           it1 = concretelyAddressedStore.begin(),
           ie1 = concretelyAddressedStore.end();
       it1 != ie1; ++it1) {
    std::set<std::string> tmp;
    if (strcmp(it1->first->getValue()->getName().data(), "") == 0) {
      tmp.insert(it1->first->getValue()->getName().data());
      std::set<std::string> right = TxPartitionHelper::getExprVars(
          it1->second.begin()->second->getExpression());
      tmp.insert(right.begin(), right.end());
      if (TxPartitionHelper::isShared(tmp, v1star)) {
        v1star.insert(tmp.begin(), tmp.end());
      }
    }
  }

  // v2
  std::set<std::string> v2 = TxPartitionHelper::diff(wpVars, v1star);

  // update pi by (wp,v2) and (pi,v1star)
  std::vector<ref<Expr> > wpComps =
      TxPartitionHelper::getExprsFromAndExpr(entry->getWPInterpolant());

  std::vector<ref<Expr> > newWPComps;
  for (std::vector<ref<Expr> >::iterator it = wpComps.begin(),
                                         ie = wpComps.end();
       it != ie; ++it) {
    std::set<std::string> tmp = TxPartitionHelper::getExprVars(*it);
    if (TxPartitionHelper::isSubset(tmp, v2)) {
      newWPComps.push_back(*it);
    }
  }

  std::vector<ref<Expr> > newpiComps;
  for (std::vector<ref<Expr> >::iterator it = piComps.begin(),
                                         ie = piComps.end();
       it != ie; ++it) {
    std::set<std::string> tmp = TxPartitionHelper::getExprVars(*it);
    if (TxPartitionHelper::isShared(tmp, v1star)) {
      newpiComps.push_back(*it);
    }
  }

  if (!entry->getWPInterpolant().isNull())
    entry->setWPInterpolant(TxPartitionHelper::createAnd(newWPComps));

  if (!entry->getInterpolant().isNull())
    entry->setInterpolant(TxPartitionHelper::createAnd(newpiComps));

  // update miu by (miu, v1star)
  for (TxStore::TopInterpolantStore::iterator
           it1 = concretelyAddressedStore.begin(),
           ie1 = concretelyAddressedStore.end();
       it1 != ie1; ++it1) {
    std::set<std::string> tmp;
    if (strcmp(it1->first->getValue()->getName().data(), "") != 0) {
      tmp.insert(it1->first->getValue()->getName().data());
      std::set<std::string> right = TxPartitionHelper::getExprVars(
          it1->second.begin()->second->getExpression());
      tmp.insert(right.begin(), right.end());

      if (!TxPartitionHelper::isShared(tmp, v1star)) {
        concretelyAddressedStore.erase(it1);
      }
    }
  }

  entry->setConcretelyAddressedStore(concretelyAddressedStore);
  return entry;
}

// TxStore::TopInterpolantStore
// TxWeakestPreCondition::updateConcretelyAddressedStore(
//    TxStore::TopInterpolantStore concretelyAddressedStore, ref<Expr> wp) {
//
//  ref<Expr> var = getVarFromExpr(wp);
//
//  llvm::Value *allocaVar = wpStore->getValuePointer(var);
//  TopInterpolantStore::iterator candidateForRemove =
//      concretelyAddressedStore.end();
//  for (TopInterpolantStore::iterator it = concretelyAddressedStore.begin(),
//                                     ie = concretelyAddressedStore.end();
//       it != ie; ++it) {
//
//    if ((*it).first->getValue() == allocaVar)
//      candidateForRemove = it;
//  }
//
//  if (candidateForRemove != concretelyAddressedStore.end()) {
//    concretelyAddressedStore.erase(candidateForRemove);
//  }
//  return concretelyAddressedStore;
//}

// ref<Expr> TxWeakestPreCondition::getVarFromExpr(ref<Expr> wp) {
//
//  switch (wp->getKind()) {
//  case Expr::InvalidKind:
//  case Expr::Read:
//  case Expr::Concat:
//  case Expr::Constant: {
//    return wp;
//  }
//
//  case Expr::NotOptimized:
//  case Expr::Not:
//  case Expr::Extract:
//  case Expr::ZExt:
//  case Expr::SExt: {
//    ref<Expr> kids[1];
//    kids[0] = getVarFromExpr(wp->getKid(0));
//    return kids[0];
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
//    kids[0] = getVarFromExpr(wp->getKid(0));
//    kids[1] = getVarFromExpr(wp->getKid(1));
//    if (isa<ReadExpr>(kids[0]) || isa<ConcatExpr>(kids[0]))
//      return kids[0];
//    else
//      return kids[1];
//  }
//
//  case Expr::Select: {
//    ref<Expr> kids[3];
//    kids[0] = getVarFromExpr(wp->getKid(0));
//    kids[1] = getVarFromExpr(wp->getKid(1));
//    kids[2] = getVarFromExpr(wp->getKid(2));
//    if (isa<ReadExpr>(kids[0]) || isa<ConcatExpr>(kids[0]))
//      return kids[0];
//    else if (isa<ReadExpr>(kids[1]) || isa<ConcatExpr>(kids[1]))
//      return kids[1];
//    else
//      return kids[1];
//  }
//  default: {
//    // Sanity check
//    klee_error("Control should not reach here in"
//               "TxWeakestPreCondition::getVarFromExpr");
//  }
//  }
//  return wp;
//}

// ref<Expr> TxWeakestPreCondition::updateInterpolant(ref<Expr> interpolant,
//                                                   ref<Expr> wp) {
//  klee_error("TxWeakestPreCondition::updateInterpolant");
//  if (interpolant.isNull())
//    return wp;
//
//  ref<Expr> var = getVarFromExpr(wp);
//  ref<Expr> unrelatedFrame = extractUnrelatedFrame(interpolant, var);
//  if (unrelatedFrame == wpStore->constValues)
//    return wp;
//  else
//    return AndExpr::create(unrelatedFrame, wp);
//}

// ref<Expr> TxWeakestPreCondition::extractUnrelatedFrame(ref<Expr> interpolant,
//                                                       ref<Expr> var) {
//  klee_error("TxWeakestPreCondition::extractUnrelatedFrame");
//  switch (interpolant->getKind()) {
//  case Expr::InvalidKind:
//  case Expr::Constant: {
//    return interpolant;
//  }
//
//  case Expr::Read:
//  case Expr::Concat: {
//    if (interpolant == var)
//      return wpStore->constValues;
//    else
//      return interpolant;
//  }
//
//  case Expr::NotOptimized:
//  case Expr::Not:
//  case Expr::Extract:
//  case Expr::ZExt:
//  case Expr::SExt: {
//    ref<Expr> kids[1];
//    kids[0] = extractUnrelatedFrame(interpolant->getKid(0), var);
//    if (kids[0] == wpStore->constValues)
//      return wpStore->constValues;
//    else
//      return interpolant->rebuild(kids);
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
//  case Expr::Shl:
//  case Expr::LShr:
//  case Expr::AShr: {
//    ref<Expr> kids[2];
//    kids[0] = extractUnrelatedFrame(interpolant->getKid(0), var);
//    kids[1] = extractUnrelatedFrame(interpolant->getKid(1), var);
//    if (kids[0] == wpStore->constValues || kids[1] == wpStore->constValues) {
//      return wpStore->constValues;
//    } else {
//      return interpolant->rebuild(kids);
//    }
//  }
//
//  // pass the other one as frame
//  case Expr::Or:
//  case Expr::Xor:
//  case Expr::And: {
//    ref<Expr> kids[2];
//    kids[0] = extractUnrelatedFrame(interpolant->getKid(0), var);
//    kids[1] = extractUnrelatedFrame(interpolant->getKid(1), var);
//    if (kids[0] == wpStore->constValues && kids[1] == wpStore->constValues)
//      klee_error(
//          "TxWeakestPreCondition::extractUnrelatedFrame This AND case is "
//          "not implemented yet!");
//    if (kids[0] == wpStore->constValues && !(kids[1] == wpStore->constValues))
//    {
//      return kids[1];
//    } else if (!(kids[0] == wpStore->constValues) &&
//               kids[1] == wpStore->constValues) {
//      return kids[0];
//    } else {
//      return interpolant->rebuild(kids);
//    }
//  }
//
//  case Expr::Select: {
//    ref<Expr> kids[3];
//    kids[0] = extractUnrelatedFrame(interpolant->getKid(0), var);
//    kids[1] = extractUnrelatedFrame(interpolant->getKid(1), var);
//    kids[2] = extractUnrelatedFrame(interpolant->getKid(2), var);
//
//    if (kids[0] == wpStore->constValues || kids[1] == wpStore->constValues ||
//        kids[2] == wpStore->constValues)
//      return wpStore->constValues;
//    else
//      return interpolant->rebuild(kids);
//  }
//  default: {
//	  // Sanity check
//	  klee_error("Control should not reach here in "
//	             "TxWeakestPreCondition::extractUnrelatedFrame");
//  }
//  }
//  return interpolant;
//}

// ref<Expr> TxWeakestPreCondition::replaceArrayWithShadow(ref<Expr>
// interpolant) {
//  klee_error("TxWeakestPreCondition::replaceArrayWithShadow");
//
//  switch (interpolant->getKind()) {
//  case Expr::InvalidKind:
//  case Expr::Constant: {
//    return interpolant;
//  }
//
//  case Expr::Read:
//  case Expr::Concat: {
//    llvm::Value *array = wpStore->getValuePointer(interpolant);
//    std::string arrayName = array->getName();
//    const std::string ext(".addr");
//    if (arrayName.find(ext))
//      arrayName = arrayName.substr(0, arrayName.size() - ext.size());
//    const Array *symArray =
//        TxShadowArray::getSymbolicShadowArray(array->getName());
//    if (symArray != NULL) {
//      ref<Expr> Res(0);
//      unsigned NumBytes = symArray->getDomain() / 8;
//      assert(symArray->getDomain() == NumBytes * 8 && "Invalid read size!");
//      for (unsigned i = 0; i != NumBytes; ++i) {
//        unsigned idx = Context::get().isLittleEndian() ? i : (NumBytes - i -
//        1);
//        ref<Expr> Byte =
//            ReadExpr::create(UpdateList(symArray, 0),
//                             ConstantExpr::alloc(idx, symArray->getDomain()));
//        Res = i ? ConcatExpr::create(Byte, Res) : Byte;
//      }
//      return Res;
//    } else {
//      interpolant->dump();
//      klee_error("TxWeakestPreCondition::replaceArrayWithShadow Shadow array "
//                 "doesn't exist!");
//    }
//  }
//
//  case Expr::NotOptimized:
//  case Expr::Not:
//  case Expr::Extract:
//  case Expr::ZExt:
//  case Expr::SExt: {
//    ref<Expr> kids[1];
//    kids[0] = replaceArrayWithShadow(interpolant->getKid(0));
//    return interpolant->rebuild(kids);
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
//    kids[0] = replaceArrayWithShadow(interpolant->getKid(0));
//    kids[1] = replaceArrayWithShadow(interpolant->getKid(1));
//    return interpolant->rebuild(kids);
//  }
//
//  case Expr::Select: {
//    ref<Expr> kids[3];
//    kids[0] = replaceArrayWithShadow(interpolant->getKid(0));
//    kids[1] = replaceArrayWithShadow(interpolant->getKid(1));
//    kids[2] = replaceArrayWithShadow(interpolant->getKid(2));
//    return interpolant->rebuild(kids);
//  }
//  default: {
//	  // Sanity check
//	  klee_error(
//	      "Control should not reach here in
// TxWeakestPreCondition::getVarFromExpr");
//  }
//  }
//  return interpolant;
//}

// std::set<const Array *>
// TxWeakestPreCondition::updateExistentials(std::set<const Array *>
// existentials,
//                                          ref<Expr> wp) {
//  klee_error("TxWeakestPreCondition::updateExistentials");
//
//  switch (wp->getKind()) {
//  case Expr::InvalidKind:
//  case Expr::Constant: {
//    return existentials;
//  }
//
//  case Expr::Read:
//  case Expr::Concat: {
//    llvm::Value *array = wpStore->getValuePointer(wp);
//    std::string arrayName = array->getName();
//    const std::string ext(".addr");
//    if (arrayName.find(ext))
//      arrayName = arrayName.substr(0, arrayName.size() - ext.size());
//    const Array *symArray =
//        TxShadowArray::getSymbolicShadowArray(array->getName());
//    if (!symArray) {
//      wp->dump();
//      klee_error(
//          "TxWeakestPreCondition::updateExistentials Shadow array doesn't "
//          "exist!");
//    }
//    if (existentials.find(symArray) == existentials.end()) {
//      existentials.insert(symArray);
//    }
//    return existentials;
//  }
//
//  case Expr::NotOptimized:
//  case Expr::Not:
//  case Expr::Extract:
//  case Expr::ZExt:
//  case Expr::SExt: {
//    std::set<const Array *> newExistentials =
//        updateExistentials(existentials, wp->getKid(0));
//    return newExistentials;
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
//    std::set<const Array *> newExistentials =
//        updateExistentials(existentials, wp->getKid(0));
//    std::set<const Array *> newExistentials2 =
//        updateExistentials(newExistentials, wp->getKid(1));
//    return newExistentials2;
//  }
//
//  case Expr::Select: {
//    std::set<const Array *> newExistentials =
//        updateExistentials(existentials, wp->getKid(0));
//    std::set<const Array *> newExistentials2 =
//        updateExistentials(newExistentials, wp->getKid(1));
//    std::set<const Array *> newExistentials3 =
//        updateExistentials(newExistentials2, wp->getKid(2));
//    return newExistentials3;
//  }
//  default: {
//	  // Sanity check
//	  klee_error(
//	      "Control should not reach here in
// TxWeakestPreCondition::getVarFromExpr");
//  }
//  }
//  return existentials;
//}

// =========================================================================
// Updated Version of Weakest PreCondition
// =========================================================================

/**
 * Push up expression to top of the  basic block
 */
ref<Expr> TxWeakestPreCondition::PushUp(
    std::vector<std::pair<KInstruction *, int> > reverseInstructionList) {

  for (std::vector<std::pair<KInstruction *, int> >::const_reverse_iterator
           it = reverseInstructionList.rbegin(),
           ie = reverseInstructionList.rend();
       it != ie; ++it) {
    llvm::Instruction *i = (*it).first->inst;
    int flag = (*it).second;
    if (flag == 1) {
      // 1- call getCondition on the cond argument of the branch instruction
      // 2- create and expression from the condition and this->WPExpr
      ref<Expr> result = getBrCondition(i);
      if (result.isNull()) {
        WPExpr = result;
        return WPExpr;
      }
      ref<Expr> cond = result;

      //      llvm::outs() << "****** Flag = 1 ******\n";
      //      cond->dump();
      //      llvm::outs() << "****** End Flag = 1 ******\n";

      if (True() == WPExpr) {
        WPExpr = cond;
      } else {
        if (WPExpr->getWidth() > cond->getWidth())
          cond = ZExtExpr::create(cond, WPExpr->getWidth());
        else if (WPExpr->getWidth() < cond->getWidth())
          WPExpr = ZExtExpr::create(WPExpr, cond->getWidth());

        WPExpr = AndExpr::create(WPExpr, cond);
      }

    } else if (flag == 2) {
      // 1- call getCondition on the cond argument of the branch instruction
      // 2- generate not(condition): expr::not(condition)
      // 3- create and expression from the condition and this->WPExpr
      ref<Expr> result = getBrCondition(i);
      if (result.isNull()) {
        WPExpr = result;
        return WPExpr;
      }
      ref<Expr> negCond = NotExpr::create(result);
      //      llvm::outs() << "****** Flag = 2 ******\n";
      //      negCond->dump();
      //      llvm::outs() << "****** End Flag = 2 ******\n";

      if (True() == WPExpr) {
        WPExpr = negCond;
      } else {
        if (WPExpr->getWidth() > negCond->getWidth())
          negCond = ZExtExpr::create(negCond, WPExpr->getWidth());
        else if (WPExpr->getWidth() < negCond->getWidth())
          WPExpr = ZExtExpr::create(WPExpr, negCond->getWidth());

        WPExpr = AndExpr::create(WPExpr, negCond);
      }

    } else if (i->getOpcode() == llvm::Instruction::Store) {
      if (TxWPHelper::isTargetDependent(i->getOperand(1), WPExpr)) {

        ref<Expr> left = this->generateExprFromOperand(i->getOperand(0));
        ref<Expr> right = this->generateExprFromOperand(i->getOperand(1));

        if (left.isNull() || right.isNull()) {
          ref<Expr> result;
          return result;
        }

        WPExpr = TxWPHelper::substituteExpr(WPExpr, right, left);
        //        llvm::outs() << "****** Flag = 0 *******\n";
        //        WPExpr->dump();
        //        llvm::outs() << "------\n";
        WPExpr = Z3Simplification::simplify(WPExpr);
        //        WPExpr->dump();
        //        llvm::outs() << "******* End Flag = 0 *******\n";
      }
    }
  }
  return WPExpr;
}

ref<Expr> TxWeakestPreCondition::getBrCondition(llvm::Instruction *ins) {
  if (!llvm::isa<llvm::BranchInst>(ins)) {
    klee_error(
        "TxWeakestPreCondition::getBrCondition: not a Branch instruction!");
    return True();
  }
  llvm::BranchInst *br = llvm::dyn_cast<llvm::BranchInst>(ins);
  ref<Expr> result = getCondition(br->getCondition());
  return result;
}

ref<Expr> TxWeakestPreCondition::generateExprFromOperand(llvm::Value *val,
                                                         ref<Expr> offset) {
  ref<Expr> ret;
  //    klee_warning("TxWeakestPreCondition::generateExprFromOperand0");
  //    val->dump();
  //    klee_warning("TxWeakestPreCondition::generateExprFromOperand1");
  if (isa<llvm::ConstantInt>(val)) {
    llvm::ConstantInt *constInt = dyn_cast<llvm::ConstantInt>(val);
    ret = getConstantInt(constInt);
  } else if (isa<llvm::GlobalValue>(val)) {
    llvm::GlobalValue *gv = dyn_cast<llvm::GlobalValue>(val);
    ret = getGlobalValue(gv);
  } else if (isa<llvm::ConstantExpr>(val)) {
    llvm::ConstantExpr *constantExpr = dyn_cast<llvm::ConstantExpr>(val);
    ret = getConstantExpr(constantExpr);
  } else if (isa<llvm::LoadInst>(val)) {
    llvm::LoadInst *inst = dyn_cast<llvm::LoadInst>(val);
    if (isa<llvm::ConstantExpr>(inst->getOperand(0))) {
      ret = getLoadGep(inst);
    } else if (isa<llvm::GetElementPtrInst>(inst->getOperand(0))) {
      llvm::GetElementPtrInst *parentGEP =
          dyn_cast<llvm::GetElementPtrInst>(inst->getOperand(0));
      std::pair<ref<Expr>, ref<Expr> > pair = getPointer(parentGEP);
      ret = SelExpr::create(pair.second, pair.first);
    } else {
      ret = getLoad(inst);
    }
  } else if (isa<llvm::BinaryOperator>(val)) {
    llvm::BinaryOperator *bo = dyn_cast<llvm::BinaryOperator>(val);
    ret = getBinaryInst(bo);
  } else if (isa<llvm::CastInst>(val)) {
    llvm::CastInst *ci = dyn_cast<llvm::CastInst>(val);
    ret = getCastInst(ci);
  } else if (isa<llvm::CallInst>(val)) {
    llvm::CallInst *ci = dyn_cast<llvm::CallInst>(val);
    ret = getCallInst(ci);
  } else if (llvm::isa<llvm::CmpInst>(val)) {
    llvm::CmpInst *cmp = dyn_cast<llvm::CmpInst>(val);
    ret = getCmpCondition(cmp);
  } else if (llvm::isa<llvm::GlobalVariable>(val)) {
    klee_error("not implemented yet!");
  } else if (llvm::isa<llvm::Argument>(val)) {
    llvm::Argument *arg = dyn_cast<llvm::Argument>(val);
    ret = getFunctionArgument(arg);
  } else if (llvm::isa<llvm::PHINode>(val)) {
    llvm::PHINode *phi = dyn_cast<llvm::PHINode>(val);
    ret = getPhiInst(phi);
  } else if (llvm::isa<llvm::AllocaInst>(val)) {
    llvm::AllocaInst *alc = dyn_cast<llvm::AllocaInst>(val);
    ret = getAllocaInst(alc);
  } else if (isa<llvm::GetElementPtrInst>(val)) {
    llvm::GetElementPtrInst *gep = dyn_cast<llvm::GetElementPtrInst>(val);
    ret = getGepInst(gep);
  } else {
    llvm::errs() << "Value:";
    val->dump();
    llvm::errs() << "\nType:";
    val->getType()->dump();
    klee_error("\nTxWeakestPreCondition::generateExprFromOperand Remaining"
               " cases not implemented yet\n");
  }
  //    klee_warning("TxWeakestPreCondition::generateExprFromOperand2");
  //    if(!ret.isNull())
  //           ret->dump();
  //    klee_warning("TxWeakestPreCondition::generateExprFromOperand3\n\n");
  return ret;
}

ref<Expr> TxWeakestPreCondition::getCondition(llvm::Value *value) {
  ref<Expr> result;
  if (llvm::isa<llvm::CmpInst>(value)) {
    llvm::CmpInst *cmp = dyn_cast<llvm::CmpInst>(value);
    result = getCmpCondition(cmp);
    if (result.isNull())
      return result;
  } else if (llvm::isa<llvm::BinaryOperator>(value)) {
    llvm::Instruction *binOp = dyn_cast<llvm::Instruction>(value);
    ref<Expr> left = this->generateExprFromOperand(binOp->getOperand(0));
    ref<Expr> right = this->generateExprFromOperand(binOp->getOperand(1));
    if (left.isNull() || right.isNull())
      return result;
    if (left->getWidth() > right->getWidth())
      right = ZExtExpr::create(right, left->getWidth());
    else if (left->getWidth() < right->getWidth())
      left = ZExtExpr::create(left, right->getWidth());
    switch (binOp->getOpcode()) {
    case llvm::Instruction::And: {
      result = AndExpr::create(left, right);
      break;
    }
    case llvm::Instruction::Or: {
      result = OrExpr::create(left, right);
      break;
    }
    case llvm::Instruction::Xor: {
      result = XorExpr::create(left, right);
      break;
    }
    default: {
      binOp->dump();
      klee_error("TxWeakestPreCondition::getCondition: Binary operator is not "
                 "implemented yet!");
    }
    }
  } else {
    value->dump();
    klee_error("TxWeakestPreCondition::getCondition: value is not "
               "implemented yet!");
  }
  return result;
}

ref<Expr> TxWeakestPreCondition::getConstantInt(llvm::ConstantInt *CI) {
  ref<Expr> result;
  if (CI->getBitWidth() <= 8)
    result = ConstantExpr::create(CI->getZExtValue(), Expr::Int8);
  else if (CI->getBitWidth() <= 16)
    result = ConstantExpr::create(CI->getZExtValue(), Expr::Int16);
  else if (CI->getBitWidth() <= 32)
    result = ConstantExpr::create(CI->getZExtValue(), Expr::Int32);
  else
    result = ConstantExpr::create(CI->getZExtValue(), Expr::Int64);
  return result;
}

ref<Expr> TxWeakestPreCondition::getConstantExpr(llvm::ConstantExpr *ce) {
  ref<Expr> result;
  klee_warning("PUSHUP2");
  return result;
}

ref<Expr> TxWeakestPreCondition::getGlobalValue(llvm::GlobalValue *gv) {
  unsigned width;
  ref<Expr> index, result;
  width = getGlobalVariabletSize(gv);
  index = ConstantExpr::create(0, width);
  result = WPVarExpr::create(gv, gv->getName(), index);

  return result;
}

ref<Expr> TxWeakestPreCondition::getFunctionArgument(llvm::Argument *arg) {
  unsigned width;
  ref<Expr> index, result;
  width = getFunctionArgumentSize(arg);
  index = ConstantExpr::create(0, width);
  result = WPVarExpr::create(arg, arg->getName(), index);
  return result;
}

std::pair<ref<Expr>, ref<Expr> >
TxWeakestPreCondition::getPointer(llvm::GetElementPtrInst *gep) {
  std::pair<ref<Expr>, ref<Expr> > pair;
  if (isa<llvm::GetElementPtrInst>(gep->getOperand(0))) {
    llvm::GetElementPtrInst *parentGEP =
        dyn_cast<llvm::GetElementPtrInst>(gep->getOperand(0));
    std::pair<ref<Expr>, ref<Expr> > parentPair = getPointer(parentGEP);
    ref<Expr> offset = this->generateExprFromOperand(gep->getOperand(2));
    unsigned width = getGepSize(gep->getType());
    llvm::PointerType *pt =
        dyn_cast<llvm::PointerType>(gep->getOperand(0)->getType());
    llvm::ArrayType *at = dyn_cast<llvm::ArrayType>(pt->getElementType());
    ref<Expr> size = ConstantExpr::create(at->getNumElements(), width);
    pair.first = AddExpr::create(
        MulExpr::create(parentPair.first->getKid(0), size), offset->getKid(0));
    ref<Expr> kids[1];
    kids[0] = pair.first;
    pair.first = offset->rebuild(kids);
    pair.second = parentPair.second;
  } else {
    pair.first = this->generateExprFromOperand(gep->getOperand(2));
    pair.second = this->generateExprFromOperand(gep->getOperand(0));
  }
  return pair;
}

ref<Expr> TxWeakestPreCondition::getLoadGep(llvm::LoadInst *p) {
  ref<Expr> result;
  klee_warning("PUSHUP6");
  return result;
}

ref<Expr> TxWeakestPreCondition::getLoad(llvm::LoadInst *p) {
  unsigned width;
  ref<Expr> index, result;
  if (isa<llvm::AllocaInst>(p->getOperand(0))) {
    llvm::AllocaInst *alc = dyn_cast<llvm::AllocaInst>(p->getOperand(0));
    width = getAllocaInstSize(alc);
    index = ConstantExpr::create(0, width);
    result =
        WPVarExpr::create(p->getOperand(0), p->getOperand(0)->getName(), index);
  } else if (isa<llvm::GlobalValue>(p->getOperand(0))) {
    llvm::GlobalValue *gv = dyn_cast<llvm::GlobalValue>(p->getOperand(0));
    width = getGlobalVariabletSize(gv);
    index = ConstantExpr::create(0, width);
    result =
        WPVarExpr::create(p->getOperand(0), p->getOperand(0)->getName(), index);
  } else {
    p->getOperand(0)->dump();
    klee_warning("TxWeakestPreCondition::getLoad: Not implemented yet!");
  }
  return result;
}

ref<Expr> TxWeakestPreCondition::getAllocaInst(llvm::AllocaInst *alc) {
  unsigned width;
  ref<Expr> index, result;
  width = getAllocaInstSize(alc);
  index = ConstantExpr::create(0, width);
  result = WPVarExpr::create(alc, alc->getName(), index);
  return result;
}

ref<Expr> TxWeakestPreCondition::getBinaryInst(llvm::BinaryOperator *bo) {
  ref<Expr> ret;
  ref<Expr> arg1 = generateExprFromOperand(bo->getOperand(0));
  ref<Expr> arg2 = generateExprFromOperand(bo->getOperand(1));
  if (arg1.isNull() || arg2.isNull())
    return ret;
  if (arg1->getWidth() > arg2->getWidth())
    arg2 = ZExtExpr::create(arg2, arg1->getWidth());
  else if (arg1->getWidth() < arg2->getWidth())
    arg1 = ZExtExpr::create(arg1, arg2->getWidth());

  switch (bo->getOpcode()) {
  case llvm::Instruction::Add: {
    ret = AddExpr::create(arg1, arg2);
    break;
  }
  case llvm::Instruction::Sub: {
    ret = SubExpr::create(arg1, arg2);
    break;
  }
  case llvm::Instruction::Mul: {
    ret = MulExpr::create(arg1, arg2);
    break;
  }
  case llvm::Instruction::UDiv: {
    ret = UDivExpr::create(arg1, arg2);
    break;
  }
  case llvm::Instruction::SDiv: {
    ret = SDivExpr::create(arg1, arg2);
    break;
  }
  case llvm::Instruction::URem: {
    ret = URemExpr::create(arg1, arg2);
    break;
  }
  case llvm::Instruction::SRem: {
    ret = SRemExpr::create(arg1, arg2);
    break;
  }
  case llvm::Instruction::And: {
    ret = AndExpr::create(arg1, arg2);
    break;
  }
  case llvm::Instruction::Or: {
    ret = OrExpr::create(arg1, arg2);
    break;
  }
  case llvm::Instruction::Xor: {
    ret = XorExpr::create(arg1, arg2);
    break;
  }
  case llvm::Instruction::Shl: {
    ret = ShlExpr::create(arg1, arg2);
    break;
  }
  case llvm::Instruction::LShr: {
    ret = LShrExpr::create(arg1, arg2);
    break;
  }
  case llvm::Instruction::AShr: {
    ret = AShrExpr::create(arg1, arg2);
    break;
  }
  default: {
    klee_error("TxWeakestPreCondition::getBinaryInst Binary Operand "
               "not implemented...\n");
  }
  }
  return ret;
}

ref<Expr> TxWeakestPreCondition::getCastInst(llvm::CastInst *ci) {
  ref<Expr> result;
  ref<Expr> arg1 = generateExprFromOperand(ci->getOperand(0));
  if (arg1.isNull())
    return result;

  Expr::Width width = Expr::InvalidWidth;
  if (ci->getDestTy()->isEmptyTy())
    width = Expr::InvalidWidth;
  else if (ci->getDestTy()->isIntegerTy(1))
    width = Expr::Bool;
  else if (ci->getDestTy()->isIntegerTy(8))
    width = Expr::Int8;
  else if (ci->getDestTy()->isIntegerTy(16))
    width = Expr::Int16;
  else if (ci->getDestTy()->isIntegerTy(32))
    width = Expr::Int32;
  else if (ci->getDestTy()->isIntegerTy(64))
    width = Expr::Int64;
  else {
    ci->getDestTy()->dump();
    klee_warning("TxWeakestPreCondition::getCastInst size not supported yet!");
    return result;
  }

  switch (ci->getOpcode()) {
  case llvm::Instruction::SExt: {
    result = SExtExpr::create(arg1, width);
    break;
  }
  case llvm::Instruction::ZExt: {
    result = ZExtExpr::create(arg1, width);
    break;
  }
  case llvm::Instruction::Trunc: {
    result = ExtractExpr::create(arg1, 0, width);
    break;
  }
  case llvm::Instruction::AddrSpaceCast:
  case llvm::Instruction::BitCast:
  case llvm::Instruction::FPExt:
  case llvm::Instruction::FPToSI:
  case llvm::Instruction::FPToUI:
  case llvm::Instruction::FPTrunc:
  case llvm::Instruction::IntToPtr:
  case llvm::Instruction::PtrToInt:
  case llvm::Instruction::SIToFP:
  case llvm::Instruction::UIToFP:
  default: {
    ci->dump();
    klee_warning("TxWeakestPreCondition::generateExprFromOperand Unary Operand "
                 "not implemented...\n");
    return result;
  }
  }
  return result;
}

ref<Expr> TxWeakestPreCondition::getCmpCondition(llvm::CmpInst *cmp) {
  // Getting the expressions from the left and right operand
  ref<Expr> result;
  ref<Expr> left = this->generateExprFromOperand(cmp->getOperand(0));
  ref<Expr> right = this->generateExprFromOperand(cmp->getOperand(1));

  if (left.isNull() || right.isNull())
    return result;
  if (left->getWidth() > right->getWidth())
    right = ZExtExpr::create(right, left->getWidth());
  else if (left->getWidth() < right->getWidth())
    left = ZExtExpr::create(left, right->getWidth());

  // second step is to create the expression
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

ref<Expr> TxWeakestPreCondition::getGepInst(llvm::GetElementPtrInst *gep) {
  ref<Expr> result;
  /*
  gep->dump();
  if (gep->getNumOperands() == 2){
          gep->getOperand(0)->dump();
          gep->getOperand(1)->dump();
          ref<Expr> offset = this->generateExprFromOperand(gep->getOperand(1));
          offset->dump();
          result = this->generateExprFromOperand(gep->getOperand(0));


  }*/
  klee_warning("PUSHUP10");
  return result;
}

ref<Expr> TxWeakestPreCondition::getSwitchInst(llvm::SwitchInst *si) {
  ref<Expr> result;
  klee_warning("PUSHUP11");
  return result;
}

ref<Expr> TxWeakestPreCondition::getPhiInst(llvm::PHINode *phi) {
  ref<Expr> result;
  klee_warning("PUSHUP12");
  return result;
}

ref<Expr> TxWeakestPreCondition::getCallInst(llvm::CallInst *ci) {
  llvm::Function *function = ci->getCalledFunction();

  // TODO: This loop can further be optimized if we had access to the
  // iterator pointing to the call instruction. That way, we could
  // find the respective return instruction much faster. The iterator
  // can be accessed from the pushup function. We leave this optimization
  // as future work.
  llvm::Instruction *ret = 0;
  for (std::vector<std::pair<KInstruction *, int> >::reverse_iterator
           it = this->node->reverseInstructionList.rbegin(),
           ie = this->node->reverseInstructionList.rend();
       it != ie; ++it) {
    if (isa<llvm::ReturnInst>(it->first->inst) &&
        inFunction(it->first->inst, function)) {
      ret = it->first->inst;
    }
  }
  assert(ret && "Return instruction is null!");
  ref<Expr> result = this->generateExprFromOperand(ret->getOperand(0));
  return result;
}

bool TxWeakestPreCondition::inFunction(llvm::Instruction *ins,
                                       llvm::Function *function) {
  bool result = false;
  for (llvm::Function::iterator bbit = function->begin(),
                                bbie = function->end();
       bbit != bbie; ++bbit) {
    for (llvm::BasicBlock::iterator it = bbit->begin(), ie = bbit->end();
         it != ie; ++it) {
      if (ins == it)
        return true;
    }
  }
  return result;
}

ref<Expr> TxWeakestPreCondition::getCallAssume(llvm::CallInst *ci) {
  ref<Expr> result;
  klee_warning("PUSHUP14");
  return result;
}

unsigned int TxWeakestPreCondition::getAllocaInstSize(llvm::AllocaInst *alc) {
  unsigned int size;

  if (alc->getAllocatedType()->isIntegerTy(1)) {
    size = Expr::Bool;
  } else if (alc->getAllocatedType()->isIntegerTy(8)) {
    size = Expr::Int8;
  } else if (alc->getAllocatedType()->isIntegerTy(16)) {
    size = Expr::Int16;
  } else if (alc->getAllocatedType()->isIntegerTy(32)) {
    size = Expr::Int32;
  } else if (alc->getAllocatedType()->isIntegerTy(64)) {
    size = Expr::Int64;
  } else {
    alc->dump();
    alc->getType()->dump();
    klee_error("TxWeakestPreCondition::getAllocaInstSize getting size is not "
               "defined for this type yet");
  }
  return size;
}

unsigned int
TxWeakestPreCondition::getGlobalVariabletSize(llvm::GlobalValue *gv) {
  unsigned int size;

  if (gv->getType()->getElementType()->isIntegerTy(1)) {
    size = Expr::Int8;
  } else if (gv->getType()->getElementType()->isIntegerTy(8)) {
    size = Expr::Int8;
  } else if (gv->getType()->getElementType()->isIntegerTy(16)) {
    size = Expr::Int16;
  } else if (gv->getType()->getElementType()->isIntegerTy(32)) {
    size = Expr::Int32;
  } else if (gv->getType()->getElementType()->isPointerTy()) {
    size = Expr::Int32;
  } else if (gv->getType()->getElementType()->isArrayTy()) {
    size = Expr::Int32;
  } else if (gv->getType()->isIntegerTy(1)) {
    size = Expr::Bool;
  } else if (gv->getType()->isIntegerTy(8)) {
    size = Expr::Int8;
  } else if (gv->getType()->isIntegerTy(16)) {
    size = Expr::Int16;
  } else if (gv->getType()->isIntegerTy(32)) {
    size = Expr::Int32;
  } else if (gv->getType()->isPointerTy()) {
    size = Expr::Int32;
  } else if (gv->getType()->isArrayTy()) {
    size = Expr::Int32;
  } else {
    gv->dump();
    gv->getType()->dump();
    gv->getType()->getElementType()->dump();
    klee_error(
        "TxWeakestPreCondition::getGlobalVariabletSize getting size is not "
        "defined for this type yet");
  }
  return size;
}

unsigned int
TxWeakestPreCondition::getFunctionArgumentSize(llvm::Argument *arg) {
  unsigned int size;

  if (arg->getType()->isIntegerTy(1)) {
    size = Expr::Bool;
  } else if (arg->getType()->isIntegerTy(8)) {
    size = Expr::Int8;
  } else if (arg->getType()->isIntegerTy(16)) {
    size = Expr::Int16;
  } else if (arg->getType()->isIntegerTy(32)) {
    size = Expr::Int32;
  } else if (arg->getType()->isPointerTy()) {
    size = Expr::Int32;
  } else {
    arg->dump();
    arg->getType()->dump();
    klee_error(
        "TxWeakestPreCondition::getGlobalVariabletSize getting size is not "
        "defined for this type yet");
  }
  return size;
}

unsigned int TxWeakestPreCondition::getGepSize(llvm::Type *ty) {
  unsigned int size;

  if (ty->isIntegerTy(1)) {
    size = Expr::Bool;
  } else if (ty->isIntegerTy(8)) {
    size = Expr::Int8;
  } else if (ty->isIntegerTy(16)) {
    size = Expr::Int16;
  } else if (ty->isIntegerTy(32)) {
    size = Expr::Int32;
  } else if (ty->isPointerTy()) {
    size = getGepSize(ty->getPointerElementType());
  } else {
    ty->dump();
    klee_error(
        "TxWeakestPreCondition::getGlobalVariabletSize getting size is not "
        "defined for this type yet");
  }
  return size;
}

/*
   if (isa<llvm::LoadInst>(val)) {
    llvm::LoadInst *inst = dyn_cast<llvm::LoadInst>(val);
    if (isa<llvm::GlobalValue>(inst->getOperand(0))) {
      ret = dependency->getAddress(inst->getOperand(0), &(wpStore->ac),
                                   wpStore->array, this, offset);

    } else if (isa<llvm::ConstantExpr>(inst->getOperand(0))) {
      llvm::ConstantExpr *gep =
          dyn_cast<llvm::ConstantExpr>(inst->getOperand(0));
      inst->dump();
      klee_error("Constant GEP not handled yet!");
      ret = dependency->getPointerAddress(gep, &(wpStore->ac), wpStore->array,
                                          this);
    } else if (isa<llvm::LoadInst>(inst->getOperand(0))) {
      llvm::LoadInst *inst2 = dyn_cast<llvm::LoadInst>(inst->getOperand(0));
      ret = dependency->getAddress(inst2->getOperand(0), &(wpStore->ac),
                                   wpStore->array, this, offset);
    } else if (isa<llvm::GetElementPtrInst>(inst->getOperand(0))) {
      llvm::GetElementPtrInst *gep =
          dyn_cast<llvm::GetElementPtrInst>(inst->getOperand(0));

      // Offset
      ref<Expr> offset = this->generateExprFromOperand(gep, 2);
      ret = this->generateExprFromOperand(gep, 0, offset);

    } else {
      ret = dependency->getAddress(inst->getOperand(0), &(wpStore->ac),
                                   wpStore->array, this, offset);
    }

  } else if (llvm::isa<llvm::PHINode>(val)) {
    llvm::PHINode *phi = dyn_cast<llvm::PHINode>(val);
    llvm::Instruction *prevInst = node->getPreviousInstruction(phi);
    llvm::BasicBlock *prevInstBB = prevInst->getParent();
    int phiFlag = false;
    for (int i = 0; i < phi->getNumIncomingValues(); i++) {
      if (phi->getIncomingBlock(i) == prevInstBB) {
        llvm::Value *prevValue = phi->getIncomingValue(i);
        ret = dependency->getAddress(prevValue, &(wpStore->ac), wpStore->array,
                                     this, offset);
        phiFlag = true;
      }
    }
    if (!phiFlag)
      klee_error("TxWeakestPreCondition::generateExprFromOperand Phi "
                 "instruction is not matching any incoming values!");
  } else if (isa<llvm::GetElementPtrInst>(val)) {
    llvm::GetElementPtrInst *gep = dyn_cast<llvm::GetElementPtrInst>(val);

    // Offset
    ref<Expr> newOffset = this->generateExprFromOperand(gep, 2);
    ref<Expr> arraySize = ConstantExpr::create(gep->getPointerOperandType()
                                                   ->getArrayElementType()
                                                   ->getArrayNumElements(),
                                               Expr::Int32);
    if (!offset.isNull())
      newOffset =
          AddExpr::create(MulExpr::create(newOffset, arraySize), offset);
    ret = this->generateExprFromOperand(gep, 0, newOffset);

  }
  return ret;*/
