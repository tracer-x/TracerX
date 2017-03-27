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

  /// \brief Replicating the stack
  StoreFrame *replicate() {
    StoreFrame *sourceFrame = this;
    StoreFrame *t, *ret = 0;

    if (sourceFrame != 0) {
      ret = t = new StoreFrame(0, sourceFrame);
      while (sourceFrame != 0) {
        sourceFrame = sourceFrame->parent;
        if (sourceFrame != 0) {
          t->parent = new StoreFrame(0, sourceFrame);
          t = t->parent;
        } else {
          t->parent = 0;
        }
      }
    }
    return ret;
  }

  /// \brief Clearing the stack
  static void clearRecursively(StoreFrame *frame) {
    if (!frame)
      return;
    clearRecursively(frame->parent);
    if (frame->parent)
      delete frame->parent;
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
                   ref<VersionedValue> value);

  std::pair<ref<VersionedValue>, ref<VersionedValue> >
  read(ref<MemoryLocation> address);

  StoreFrame *getParent() const { return parent; }

  void print(llvm::raw_ostream &stream) const { print(stream, ""); }

  void print(llvm::raw_ostream &stream, const std::string &prefix) const;

  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }
};
}

#endif // KLEE_STOREFRAME_H
