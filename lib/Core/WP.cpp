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

using namespace klee;

/**/

WeakestPreCondition::WeakestPreCondition() {}

WeakestPreCondition::~WeakestPreCondition() {}

std::set<llvm::Value *> WeakestPreCondition::markVariables(
    std::map<KInstruction *, bool> reverseInstructionList) {
  std::set<llvm::Value *> markedVariables;
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
  return markedVariables;
}
