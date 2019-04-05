//===-- Speculation.cpp - Interpolation tree -------------------------*- C++
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
/// This file contains the implementations of the classes for weakest
/// precondition.
///
//===----------------------------------------------------------------------===//

#include "TxSpeculation.h"

using namespace klee;

bool TxSpeculativeRun::isSpeculable(ExecutionState &current) {
  if (isa<llvm::BranchInst>(current.prevPC->inst)) {
    llvm::BranchInst *bi = dyn_cast<llvm::BranchInst>(current.prevPC->inst);
    llvm::BasicBlock *bb = dyn_cast<llvm::BasicBlock>(bi->getOperand(1));
    if (isa<llvm::CallInst>(bb->getInstList().front())) {
      llvm::CallInst *ci = dyn_cast<llvm::CallInst>(&bb->getInstList().front());
      std::string str;
      llvm::raw_string_ostream os(str);
      ci->getCalledValue()->print(os);
      //      llvm::outs() << "os: " << os.str() << "\n";
      //      llvm::outs() << "assert fail = " <<
      //      (os.str().find("@__assert_fail") != std::string::npos) << "\n";
      if (os.str().find("@__assert_fail") != std::string::npos) {
        return false;
      }
    }
  }
  return true;
}
