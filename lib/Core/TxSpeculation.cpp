//===-- TxSpeculationHelper.cpp - Interpolation tree -----*- C++ -*-===//
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

std::string TxSpeculationHelper::WHITESPACE = " \n\r\t\f\v";

bool TxSpeculationHelper::isStateSpeculable(ExecutionState &current) {
  if (current.stack.back().kf->function->getName().substr(0, 5) == "klee_" ||
      current.stack.back().kf->function->getName().substr(0, 3) == "tx_") {
    return false;
  }

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

bool TxSpeculationHelper::isOverlap(std::set<std::string> &s1,
                                    std::set<std::string> &s2) {
  for (std::set<std::string>::iterator it1 = s1.begin(), ie1 = s1.end();
       it1 != ie1; ++it1) {
    for (std::set<std::string>::iterator it2 = s2.begin(), ie2 = s2.end();
         it2 != ie2; ++it2) {
      if (*it1 == *it2) {
        return true;
      }
    }
  }
  return false;
}

bool TxSpeculationHelper::isIndependent(
    std::set<std::string> &vars,
    std::map<int, std::set<std::string> > &avoidance) {
  for (std::map<int, std::set<std::string> >::iterator it = avoidance.begin(),
                                                       ie = avoidance.end();
       it != ie; ++it) {
    if (isOverlap(it->second, vars)) {
      return false;
    }
  }
  return true;
}
