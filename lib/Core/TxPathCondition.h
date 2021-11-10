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
#include "klee/Internal/Module/TxValues.h"

namespace klee {

/// \brief A conjunct on the path condition
class TxPCConstraint {
public:
  unsigned refCount;

private:
  /// \brief KLEE expression
  ref<Expr> constraint;

  /// \brief KLEE expression with variables (arrays) replaced by their shadows
  ref<Expr> shadowConstraint;

  /// \brief If shadow constraint had been generated: We generate shadow
  /// constraint on demand only when the constraint is required in an
  /// interpolant.
  bool shadowed;

  /// \brief The set of bound variables
  std::set<const Array *> boundVariables;

  /// \brief the condition value from which the constraint was generated
  ref<TxStateValue> condition;

  /// \brief The depth this condition was introduced
  uint64_t depth;

public:
  TxPCConstraint(ref<Expr> _constraint, ref<TxStateValue> _condition,
                 uint64_t _depth);

  ~TxPCConstraint();

  ref<Expr> packInterpolant(std::set<const Array *> &replacements);

  uint64_t getDepth() const { return depth; }

  int compare(const TxPCConstraint &other) const;

  void dump() const;

  void print(llvm::raw_ostream &stream) const;
};

class TxPathCondition {
  /// \brief The path condition, with the levels each one is introduced
  std::map<ref<Expr>, ref<TxPCConstraint> > pcDepth;

  /// \brief Store elements used by left path
  std::set<ref<TxPCConstraint> > usedByLeftPath;

  /// \brief Store elements used by right path
  std::set<ref<TxPCConstraint> > usedByRightPath;

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

  ref<TxPCConstraint> addConstraint(ref<Expr> constraint,
                                    ref<TxStateValue> condition);

  void unsatCoreInterpolation(const std::vector<ref<Expr> > &unsatCore);

  ref<Expr>
  packInterpolant(std::set<const Array *> &replacements,
                  std::map<ref<Expr>, ref<Expr> > &substitution) const;

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
  void print(llvm::raw_ostream &stream, const unsigned paddingAmount, int debugSubsumptionLevel) const;
};
}

#endif
