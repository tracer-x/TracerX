/*
 * StackFramUtils.cpp
 *
 *  Created on: 18 Mar 2019
 *      Author: xuanlinhha
 */

#include "StackFrameUtils.h"

namespace klee {

void StackFrameUtils::printLocals(StackFrame *sf) {
  if (!sf)
    return;
  KFunction *kf = sf->kf;
  Cell *locals = sf->locals;
  std::vector<const MemoryObject *> allocas = sf->allocas;
  llvm::errs() << "Function: " << kf->function->getName().data() << "\n";
  int tmp = 0;
  llvm::errs() << "---args---\n";
  for (llvm::Function::arg_iterator it = kf->function->arg_begin(),
                                    ie = kf->function->arg_end();
       it != ie; ++it) {
    if (!locals[tmp].value.isNull()) {
      it->dump();
      locals[tmp].value->dump();
    }
    tmp++;
  }
  llvm::errs() << "---instructions---\n";
  for (unsigned int i = 0; i < kf->numInstructions; i++) {
    if (!locals[kf->instructions[i]->dest].value.isNull()) {
      kf->instructions[i]->inst->dump();
      locals[kf->instructions[i]->dest].value->dump();
    }
  }
  llvm::errs() << "--- allocas ---\n";
  for (std::vector<const MemoryObject *>::iterator it = allocas.begin(),
                                                   ie = allocas.end();
       it != ie; ++it) {
    llvm::errs() << (*it)->address << "\n";
  }

  llvm::errs() << "---End Function---\n";
}

} /* namespace klee */
