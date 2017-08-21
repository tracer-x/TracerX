//===--- TxPathCondition.h - Path condition management ----------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the declarations for the management of path conditions to
/// generate interpolants from.
///
//===----------------------------------------------------------------------===//

#ifndef KLEE_TXPATHCONDITION_H
#define KLEE_TXPATHCONDITION_H

#include "klee/Constraints.h"
#include "klee/util/TxPrintUtil.h"

namespace klee {

class TxPathCondition {
  /// \brief The path condition, with the levels each one is introduced
  std::map<ref<Expr>, uint64_t> pcDepth;

  /// \brief Store elements used by left path
  std::set<ref<Expr> > usedByLeftPath;

  /// \brief Store elements used by right path
  std::set<ref<Expr> > usedByRightPath;

  /// \brief The depth level of this store
  uint64_t depth;

  /// \brief The parent and left and right children of this store
  TxPathCondition *parent, *left, *right;

  /// \brief Constructor for an empty path condition manager.
  TxPathCondition() : depth(0), parent(0), left(0), right(0) {}

public:
  ~TxPathCondition() {}

  static TxPathCondition *create(TxPathCondition *src) {
    TxPathCondition *ret = new TxPathCondition();
    if (!src) {
      return ret;
    }
    ret->depth = src->depth + 1;
    ret->pcDepth = src->pcDepth;
    ret->parent = src;
    return ret;
  }

  void setLeftChild(TxPathCondition *child) { left = child; }

  void setRightChild(TxPathCondition *child) { right = child; }

  void addConstraint(ref<Expr> constraint);

  void unsatCoreInterpolation(const std::vector<ref<Expr> > &unsatCore);

  /// \brief Print the content of the object to the LLVM error stream
  void dump() const {
    this->print(llvm::errs());
    llvm::errs() << "\n";
  }

  /// \brief Print the content of the object into a stream.
  ///
  /// \param stream The stream to print the data to.
  void print(llvm::raw_ostream &stream) const;

  /// \brief Print the content of the object into a stream.
  ///
  /// \param stream The stream to print the data to.
  /// \param paddingAmount The number of whitespaces to be printed before each
  /// line.
  void print(llvm::raw_ostream &stream, const unsigned paddingAmount) const;
};
}

#endif
