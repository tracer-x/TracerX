//==- TxSpeculationHelper.h - Tracer-X symbolic execution tree -*- C++ -*-==//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains declarations of the classes that implements the
/// speculation mode.
///
//===----------------------------------------------------------------------===//

#ifndef TXSPECULATION_H_
#define TXSPECULATION_H_

#include "klee/ExecutionState.h"
#include "klee/Internal/Module/KModule.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include <iostream>
#include <map>
#include <vector>

namespace klee {

/// \brief Implements the speculation mode
class TxSpeculationHelper {
public:
  static std::string WHITESPACE;
  static bool isStateSpeculable(ExecutionState &current);

  static bool isIndependent(std::set<std::string> &vars,
                            std::map<int, std::set<std::string> > &avoidance);

  static bool isOverlap(std::set<std::string> &s1, std::set<std::string> &s2);

  static std::string ltrim(const std::string &s) {
    size_t start = s.find_first_not_of(WHITESPACE);
    return (start == std::string::npos) ? "" : s.substr(start);
  }

  static std::string rtrim(const std::string &s) {
    size_t end = s.find_last_not_of(WHITESPACE);
    return (end == std::string::npos) ? "" : s.substr(0, end + 1);
  }

  static std::string trim(const std::string &s) { return rtrim(ltrim(s)); }
};
} // namespace klee

#endif /* TXSPECULATION_H_ */
