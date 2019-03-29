//===-- Speculation.h - Tracer-X symbolic execution tree -------------*- C++
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
/// This file contains declarations of the classes that implements the
/// speculation mode.
///
//===----------------------------------------------------------------------===//

#ifndef TXSPECULATION_H_
#define TXSPECULATION_H_

#include "klee/ExecutionState.h"
#include <iostream>
#include <map>
#include <vector>

namespace klee {

/// \brief Implements the speculation mode
class TxSpeculativeRun {
public:
  static bool isSpeculable(ExecutionState &current);
  static void sort(std::map<uintptr_t, unsigned int> m) {};
};
} // namespace klee

#endif /* TXSPECULATION_H_ */
