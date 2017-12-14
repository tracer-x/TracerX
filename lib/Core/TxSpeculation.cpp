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

  if (isa<llvm::BranchInst>(current.prevPC->inst) &&
      (current.prevPC->inst->getOperand(1)->getName() != "cond.false")) {
    return true;
  }
  return false;
}
