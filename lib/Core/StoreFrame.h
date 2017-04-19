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
  // DO NOT IMPLEMENT.
  StoreFrame(const StoreFrame &);
  void operator=(const StoreFrame &);

protected:
  StoreFrame() {}

public:
  virtual ~StoreFrame() {}

  virtual void
  getConcreteStore(const std::vector<llvm::Instruction *> &callHistory,
                   std::set<const Array *> &replacements, bool coreOnly,
                   TxConcreteStore &concreteStore) const;

  virtual void
  getSymbolicStore(const std::vector<llvm::Instruction *> &callHistory,
                   std::set<const Array *> &replacements, bool coreOnly,
                   TxSymbolicStore &symbolicStore) const;

  virtual void updateStore(ref<MemoryLocation> loc, ref<VersionedValue> address,
                           ref<VersionedValue> value);

  virtual std::pair<ref<VersionedValue>, ref<VersionedValue> >
  read(ref<MemoryLocation> loc);

  virtual void print(llvm::raw_ostream &stream) const;

  virtual void print(llvm::raw_ostream &stream,
                     const std::string &prefix) const;

  virtual void dump() const;
};

/// \brief Class for global store frame
class GlobalStoreFrame : public StoreFrame {
  /// \brief The mapping of concrete locations to stored value
  std::map<ref<MemoryLocation>,
           std::pair<ref<VersionedValue>, ref<VersionedValue> > >
  concretelyAddressedStore;

  /// \brief The mapping of symbolic locations to stored value
  std::map<ref<MemoryLocation>,
           std::pair<ref<VersionedValue>, ref<VersionedValue> > >
  symbolicallyAddressedStore;

  /// \brief Non-hollow source of this frame, which stores concrete data
  GlobalStoreFrame *source;

  /// \brief Constructor
  GlobalStoreFrame(GlobalStoreFrame *_source) : source(_source) {}

public:
  ~GlobalStoreFrame() {
    // Delete the locally-constructed relations
    concretelyAddressedStore.clear();
    symbolicallyAddressedStore.clear();
  }

  static GlobalStoreFrame *create(GlobalStoreFrame *source = 0) {
    return new GlobalStoreFrame(source);
  }

  void getConcreteStore(const std::vector<llvm::Instruction *> &callHistory,
                        std::set<const Array *> &replacements, bool coreOnly,
                        TxConcreteStore &concreteStore) const;

  void getSymbolicStore(const std::vector<llvm::Instruction *> &callHistory,
                        std::set<const Array *> &replacements, bool coreOnly,
                        TxSymbolicStore &symbolicStore) const;

  void updateStore(ref<MemoryLocation> loc, ref<VersionedValue> address,
                   ref<VersionedValue> value);

  std::pair<ref<VersionedValue>, ref<VersionedValue> >
  read(ref<MemoryLocation> loc);

  void print(llvm::raw_ostream &stream) const { print(stream, ""); }

  void print(llvm::raw_ostream &stream, const std::string &prefix) const;

  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }
};

/// \brief Class defining local and global frames of store
class StackStoreFrame : public StoreFrame {
  /// \brief The mapping of concrete locations to stored value
  std::map<ref<MemoryLocation>,
           std::pair<ref<VersionedValue>, ref<VersionedValue> > >
  concretelyAddressedStore;

  /// \brief The mapping of symbolic locations to stored value
  std::map<ref<MemoryLocation>,
           std::pair<ref<VersionedValue>, ref<VersionedValue> > >
  symbolicallyAddressedStore;

  /// \brief The previous frame lower in the stack
  StackStoreFrame *parent;

  /// \brief Non-hollow source of this frame, which stores concrete data
  StackStoreFrame *source;

  /// \brief The call site this frame belongs to
  llvm::Instruction *callsite;

  /// \brief The height of this frame on the stack
  uint64_t height;

  /// \brief Constructor
  StackStoreFrame(StackStoreFrame *_parent, llvm::Instruction *_callsite,
                  uint64_t _height, StackStoreFrame *_source)
      : parent(_parent), source(_source), callsite(_callsite), height(_height) {
  }

  StackStoreFrame *findFrame(const ref<MemoryLocation> loc);

  static StackStoreFrame *replicateRecursively(StackStoreFrame *current) {
    if (current == 0)
      return 0;
    StackStoreFrame *ret =
        new StackStoreFrame(0, current->callsite, current->height, current);
    ret->parent = replicateRecursively(current->parent);
    return ret;
  }

public:
  ~StackStoreFrame() {
    // Delete the locally-constructed relations
    concretelyAddressedStore.clear();
    symbolicallyAddressedStore.clear();
  }

  static StackStoreFrame *create(StackStoreFrame *parent,
                                 llvm::Instruction *site, uint64_t height,
                                 StackStoreFrame *source = 0) {
    return new StackStoreFrame(parent, site, height, source);
  }

  /// \brief Replicating the stack
  StackStoreFrame *replicate() { return replicateRecursively(this); }

  /// \brief Clearing the stack
  static void clearRecursively(StackStoreFrame *frame) {
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

  void updateStore(ref<MemoryLocation> loc, ref<VersionedValue> address,
                   ref<VersionedValue> value);

  std::pair<ref<VersionedValue>, ref<VersionedValue> >
  read(ref<MemoryLocation> loc);

  StackStoreFrame *getParent() const { return parent; }

  uint64_t getHeight() const { return height; }

  void print(llvm::raw_ostream &stream) const { print(stream, ""); }

  void print(llvm::raw_ostream &stream, const std::string &prefix) const;

  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }
};
}

#endif // KLEE_STOREFRAME_H
