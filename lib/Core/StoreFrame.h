//===--- StoreFrame.h -------------------------------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef KLEE_STOREFRAME_H
#define KLEE_STOREFRAME_H

#include "TxInterpolantTypes.h"

#include "klee/Internal/Module/VersionedValue.h"

#include <map>

namespace klee {

/// \brief Class defining local and global frames of store
class StoreFrame {
  /// \brief The mapping of concrete locations to stored value
  std::map<ref<MemoryLocation>,
           std::pair<ref<VersionedValue>, ref<VersionedValue> > >
  concretelyAddressedStore;

  /// \brief The mapping of symbolic locations to stored value
  std::map<ref<MemoryLocation>,
           std::pair<ref<VersionedValue>, ref<VersionedValue> > >
  symbolicallyAddressedStore;

  /// \brief The previous frame lower in the stack
  StoreFrame *parent;

  /// \brief Non-hollow source of this frame, which stores concrete data
  StoreFrame *source;

  /// \brief Constructor
  StoreFrame(StoreFrame *_parent, StoreFrame *_source)
      : parent(_parent), source(_source) {}

public:

  ~StoreFrame() {
    // Delete the locally-constructed relations
    concretelyAddressedStore.clear();
    symbolicallyAddressedStore.clear();
  }

  static StoreFrame *create(StoreFrame *_parent, StoreFrame *_source = 0) {
    return new StoreFrame(_parent, _source);
  }

  void getConcreteStore(const std::vector<llvm::Instruction *> &callHistory,
                        std::set<const Array *> &replacements, bool coreOnly,
                        TxConcreteStore &concreteStore) const;

  void getSymbolicStore(const std::vector<llvm::Instruction *> &callHistory,
                        std::set<const Array *> &replacements, bool coreOnly,
                        TxSymbolicStore &symbolicStore) const;

  std::pair<bool, std::map<ref<MemoryLocation>,
                           std::pair<ref<VersionedValue>,
                                     ref<VersionedValue> > >::const_iterator>
  findInConcreteStore(ref<MemoryLocation> loc) const;

  std::pair<bool, std::map<ref<MemoryLocation>,
                           std::pair<ref<VersionedValue>,
                                     ref<VersionedValue> > >::const_iterator>
  findInSymbolicStore(ref<MemoryLocation> loc) const;

  void updateStore(ref<MemoryLocation> loc, ref<VersionedValue> address,
                   ref<VersionedValue> value) {

    // We copy the store to update on demand, only when this function is invoked
    if (source) {
      concretelyAddressedStore = source->concretelyAddressedStore;
      symbolicallyAddressedStore = source->symbolicallyAddressedStore;
      source = 0;
    }

    if (loc->hasConstantAddress()) {
      concretelyAddressedStore[loc] =
          std::pair<ref<VersionedValue>, ref<VersionedValue> >(address, value);
    } else {
      symbolicallyAddressedStore[loc] =
          std::pair<ref<VersionedValue>, ref<VersionedValue> >(address, value);
    }
  }

  std::pair<ref<VersionedValue>, ref<VersionedValue> >
  read(ref<MemoryLocation> address) {
    std::pair<ref<VersionedValue>, ref<VersionedValue> > ret;
    std::map<ref<MemoryLocation>,
             std::pair<ref<VersionedValue>,
                       ref<VersionedValue> > >::const_iterator it;
    if (address->hasConstantAddress()) {
      it = concretelyAddressedStore.find(address);
      if (it != concretelyAddressedStore.end())
        ret = it->second;
    } else {
      it = symbolicallyAddressedStore.find(address);
      // FIXME: Here we assume that the expressions have to exactly be the
      // same expression object. More properly, this should instead add an
      // ite constraint onto the path condition.
      if (it != symbolicallyAddressedStore.end())
        ret = it->second;
    }
    return ret;
  }

  void print(llvm::raw_ostream &stream) const { print(stream, ""); }

  void print(llvm::raw_ostream &stream, const std::string &prefix) const;

  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }
};
}

#endif // KLEE_STOREFRAME_H
