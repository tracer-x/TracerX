//===--- TxInterpolantTypes.h -----------------------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef KLEE_INTERPOLANTTYPES_H
#define KLEE_INTERPOLANTTYPES_H

#include "klee/Internal/Module/VersionedValue.h"

#include <map>

namespace klee {

/// \brief A processed form of a value to be stored in the subsumption table
class StoredValue {
public:
  unsigned refCount;

private:
  ref<Expr> expr;

  /// \brief In case the stored value was a pointer, then this should be a
  /// non-empty map mapping of allocation sites to the set of offset bounds.
  /// This constitutes the weakest liberal precondition of the memory checks
  /// against which the offsets of the pointer values of the current state are
  /// to be checked against.
  std::map<const llvm::Value *, std::set<ref<Expr> > > allocationBounds;

  /// \brief In case the stored value was a pointer, then this should be a
  /// non-empty map mapping of allocation sites to the set of offsets. This is
  /// the offset values of the current state to be checked against the offset
  /// bounds.
  std::map<const llvm::Value *, std::set<ref<Expr> > > allocationOffsets;

  /// \brief The id of this object
  uint64_t id;

  /// \brief The LLVM value of this object
  llvm::Value *value;

  /// \brief Do not use bound in subsumption check
  bool doNotUseBound;

  /// \brief Reason this was stored as needed value
  std::set<std::string> coreReasons;

  void init(ref<VersionedValue> vvalue, std::set<const Array *> &replacements,
            const std::set<std::string> &coreReasons, bool shadowing = false);

  StoredValue(ref<VersionedValue> vvalue, std::set<const Array *> &replacements,
              const std::set<std::string> &coreReasons) {
    init(vvalue, replacements, coreReasons, true);
  }

  StoredValue(ref<VersionedValue> vvalue,
              const std::set<std::string> &coreReasons) {
    std::set<const Array *> dummyReplacements;
    init(vvalue, dummyReplacements, coreReasons);
  }

public:
  static ref<StoredValue> create(ref<VersionedValue> vvalue,
                                 std::set<const Array *> &replacements) {
    ref<StoredValue> sv(
        new StoredValue(vvalue, replacements, vvalue->getReasons()));
    return sv;
  }

  static ref<StoredValue> create(ref<VersionedValue> vvalue) {
    ref<StoredValue> sv(new StoredValue(vvalue, vvalue->getReasons()));
    return sv;
  }

  ~StoredValue() {}

  int compare(const StoredValue other) const {
    if (id == other.id)
      return 0;
    if (id < other.id)
      return -1;
    return 1;
  }

  bool useBound() { return !doNotUseBound; }

  bool isPointer() const { return !allocationBounds.empty(); }

  ref<Expr> getBoundsCheck(ref<StoredValue> svalue,
                           std::set<ref<Expr> > &bounds,
                           int debugSubsumptionLevel) const;

  ref<Expr> getExpression() const { return expr; }

  const std::set<ref<Expr> > &getBounds(llvm::Value *value) const {
    return allocationBounds.at(value);
  }

  llvm::Value *getValue() const { return value; }

  void print(llvm::raw_ostream &stream) const { print(stream, ""); }

  void print(llvm::raw_ostream &stream, const std::string &prefix) const;

  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }
};

typedef std::pair<ref<StoredAddress>, ref<StoredValue> > TxAddressValuePair;
typedef std::map<ref<StoredAddress>, ref<StoredValue> > TxConcreteStoreMap;
typedef std::vector<TxAddressValuePair> TxSymbolicStoreMap;
typedef std::map<const llvm::Value *, TxConcreteStoreMap> TxConcreteStore;
typedef std::map<const llvm::Value *, TxSymbolicStoreMap> TxSymbolicStore;
}

#endif // KLEE_TXINTERPOLANTTYPES_H
