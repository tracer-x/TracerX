//===-- Cell.h --------------------------------------------------*- C++ -*-===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef KLEE_CELL_H
#define KLEE_CELL_H

#include <klee/Expr.h>
#include <klee/Internal/Module/VersionedValue.h>

namespace klee {
  class MemoryObject;

  struct Cell {
    ref<Expr> value;
    ref<VersionedValue> vvalue;
  };

  inline bool operator<(const Cell &lhs, const Cell &rhs) {
    return lhs.value < rhs.value;
  }
}

#endif
