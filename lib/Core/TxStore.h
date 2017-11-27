//===--- TxStore.h - A view of program memory -------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the declarations for the implementations of the shadow
/// memory to support the dependency computation of memory locations and the
/// generation of interpolants.
///
//===----------------------------------------------------------------------===//

#ifndef KLEE_TXSTORE_H
#define KLEE_TXSTORE_H

#include "klee/Internal/Module/TxValues.h"
#include "klee/util/Ref.h"

#include <map>

namespace klee {

class TxStore {
public:
  class MiddleStateStore;

  typedef std::map<ref<TxVariable>, ref<TxInterpolantValue> >
  LowerInterpolantStore;
  typedef std::map<ref<AllocationContext>, LowerInterpolantStore>
  TopInterpolantStore;
  typedef std::map<ref<TxVariable>, ref<TxStoreEntry> > LowerStateStore;
  typedef std::map<ref<AllocationContext>, MiddleStateStore> TopStateStore;

  class MiddleStateStore {
  private:
    LowerStateStore concretelyAddressedStore;

    LowerStateStore symbolicallyAddressedStore;

    ref<AllocationInfo> allocInfo;


  public:
    MiddleStateStore() {}

    MiddleStateStore(ref<AllocationInfo> _allocInfo) : allocInfo(_allocInfo) {}

    /// \brief The copy constructor
    MiddleStateStore(const MiddleStateStore &obj) {
      concretelyAddressedStore = obj.concretelyAddressedStore;
      symbolicallyAddressedStore = obj.symbolicallyAddressedStore;
      allocInfo = obj.allocInfo;
    }

    LowerStateStore::const_iterator concreteBegin() const {
      return concretelyAddressedStore.begin();
    }

    LowerStateStore::const_iterator concreteEnd() const {
      return concretelyAddressedStore.end();
    }

    LowerStateStore::const_iterator symbolicBegin() const {
      return symbolicallyAddressedStore.begin();
    }

    LowerStateStore::const_iterator symbolicEnd() const {
      return symbolicallyAddressedStore.end();
    }

    bool hasAllocationInfo(ref<AllocationInfo> _allocInfo) const {
      return allocInfo == _allocInfo;
    }

    ref<TxStoreEntry> find(ref<TxStateAddress> loc) const;

    ref<TxStoreEntry> findConcrete(
        ref<TxVariable> var,
        std::map<ref<AllocationInfo>, ref<AllocationInfo> > &unifiedBases)
        const;

    ref<TxStoreEntry> findSymbolic(ref<TxVariable> var) const;

    ref<TxStoreEntry> updateStore(const TxStore *store, ref<TxStateAddress> loc,
                                  ref<TxStateValue> address,
                                  ref<TxStateValue> value, uint64_t depth);

    /// \brief Print the content of the object to the LLVM error stream
    void dump() const {
      this->print(llvm::errs());
      llvm::errs() << "\n";
    }

    /// \brief Print the content of the object into a stream.
    ///
    /// \param stream The stream to print the data to.
    void print(llvm::raw_ostream &stream) const { print(stream, ""); }

    /// \brief Print the content of the object into a stream.
    ///
    /// \param stream The stream to print the data to.
    /// \param paddingAmount The number of whitespaces to be printed before each
    /// line.
    void print(llvm::raw_ostream &stream, const std::string &prefix) const;
  };

private:
  /// \brief A concretely-addressed store of the earlier versions of all
  /// addresses
  LowerStateStore concretelyAddressedHistoricalStore;

  /// \brief A symbolically-addressed store of the earlier versions of all
  /// addresses
  LowerStateStore symbolicallyAddressedHistoricalStore;

  /// \brief The mapping of locations to stored value
  TopStateStore internalStore;

  /// \brief Store elements used by left path
  std::set<ref<TxStoreEntry> > usedByLeftPath;

  /// \brief Store elements used by right path
  std::set<ref<TxStoreEntry> > usedByRightPath;

  /// \brief The depth level of this store
  uint64_t depth;

  /// \brief The parent and left and right children of this store
  TxStore *parent, *left, *right;

  void concreteToInterpolant(ref<TxVariable> variable, ref<TxStoreEntry> entry,
                             const std::map<ref<Expr>, ref<Expr> > &substition,
                             std::set<const Array *> &replacements,
                             bool coreOnly, LowerInterpolantStore &map,
                             bool leftOfEntry) const;

  void
  symbolicToInterpolant(ref<TxVariable> variable, ref<TxStoreEntry> entry,
                        const std::map<ref<Expr>, ref<Expr> > &substitution,
                        std::set<const Array *> &replacements, bool coreOnly,
                        LowerInterpolantStore &map, bool leftOfEntry) const;

  void getConcreteStore(
      const TxStore *referenceStore,
      const std::vector<llvm::Instruction *> &callHistory,
      const std::map<ref<Expr>, ref<Expr> > &substitution,
      std::set<const Array *> &replacements, bool coreOnly, bool leftRetrieval,
      TopInterpolantStore &_concretelyAddressedStore,
      LowerInterpolantStore &_concretelyAddressedHistoricalStore) const;

  void getSymbolicStore(
      const TxStore *referenceStore,
      const std::vector<llvm::Instruction *> &callHistory,
      const std::map<ref<Expr>, ref<Expr> > &substitution,
      std::set<const Array *> &replacements, bool coreOnly, bool leftRetrieval,
      TopInterpolantStore &_symbolicallyAddressedStore,
      LowerInterpolantStore &_symbolicallyAddressedHistoricalStore) const;

  void recursivelyMarkFlow(ref<TxStoreEntry> entry, bool leftMarking,
                           const std::string &reason) const;

  bool recursivelyMarkPointerFlow(ref<TxStoreEntry> entry, bool leftMarking,
                                  ref<TxStateValue> checkedAddress,
                                  std::set<uint64_t> &bounds,
                                  const std::string &reason,
                                  uint64_t startingDepth) const;

  static bool adjustOffsetBound(ref<TxStoreEntry> entry, bool leftMarking,
                                ref<TxStateValue> checkedAddress,
                                std::set<uint64_t> &bounds,
                                const std::string &reason, bool &boundUpdated);

  /// \brief Constructor for an empty store.
  TxStore() : depth(0), parent(0), left(0), right(0) {}

public:
  ~TxStore() {}

  static TxStore *create(TxStore *src) {
    TxStore *ret = new TxStore();
    if (!src) {
      return ret;
    }
    ret->concretelyAddressedHistoricalStore =
        src->concretelyAddressedHistoricalStore;
    ret->symbolicallyAddressedHistoricalStore =
        src->symbolicallyAddressedHistoricalStore;
    ret->internalStore = src->internalStore;
    ret->depth = src->depth + 1;
    ret->parent = src;
    return ret;
  }

  /// \brief Returns true if this store is in the left subtree of its ancestor
  /// at level targetDepth, false otherwise (either local or in the right
  /// subtree of its ancestor at level targetDepth).
  bool isInLeftSubtree(uint64_t targetDepth) const;

  void setLeftChild(TxStore *child) { left = child; }

  void setRightChild(TxStore *child) { right = child; }

  /// \brief Finds a store entry given an address
  ref<TxStoreEntry> find(ref<TxStateAddress> loc) const;

  /// \brief This retrieves the locations known at this state, and the
  /// expressions stored in the locations. Returns as the last argument a pair
  /// of the store part indexed by constants, and the store part indexed by
  /// symbolic expressions.
  ///
  /// \param replacements The replacement bound variables when
  /// retrieving state for creating subsumption table entry: As the
  /// resulting expression will be used for storing in the
  /// subsumption table, the variables need to be replaced with the
  /// bound ones.
  /// \param coreOnly Indicate whether we are retrieving only data
  /// for locations relevant to an unsatisfiability core.
  /// \param leftRetrieval Whether the retrieval is requested by the left child
  /// of the store, otherwise, we assume it is requested by the right child of
  /// the store.
  void getStoredExpressions(
      const TxStore *store, const std::vector<llvm::Instruction *> &callHistory,
      const std::map<ref<Expr>, ref<Expr> > &substitution,
      std::set<const Array *> &replacements, bool coreOnly, bool leftRetrieval,
      TopStateStore &__internalStore,
      LowerStateStore &__concretelyAddressedHistoricalStore,
      LowerStateStore &__symbolicallyAddressedHistoricalStore) const;

  /// \brief This retrieves the locations known at this state, and the
  /// expressions stored in the locations. Returns as the last argument a pair
  /// of the store part indexed by constants, and the store part indexed by
  /// symbolic expressions.
  ///
  /// \param replacements The replacement bound variables when
  /// retrieving state for creating subsumption table entry: As the
  /// resulting expression will be used for storing in the
  /// subsumption table, the variables need to be replaced with the
  /// bound ones.
  /// \param coreOnly Indicate whether we are retrieving only data
  /// for locations relevant to an unsatisfiability core.
  /// \param leftRetrieval Whether the retrieval is requested by the left child
  /// of the store, otherwise, we assume it is requested by the right child of
  /// the store.
  void getStoredCoreExpressions(
      const TxStore *store, const std::vector<llvm::Instruction *> &callHistory,
      const std::map<ref<Expr>, ref<Expr> > &substitution,
      std::set<const Array *> &replacements, bool coreOnly, bool leftRetrieval,
      TopInterpolantStore &_concretelyAddressedStore,
      TopInterpolantStore &_symbolicallyAddressedStore,
      LowerInterpolantStore &_concretelyAddressedHistoricalStore,
      LowerInterpolantStore &_symbolicallyAddressedHistoricalStore) const;

  /// \brief Newly relate a location with its stored value, when the value is
  /// loaded from the location
  void updateStoreWithLoadedValue(ref<TxStateAddress> loc,
                                  ref<TxStateValue> address,
                                  ref<TxStateValue> value);

  /// \brief Newly relate an location with its stored value
  void updateStore(ref<TxStateAddress> location, ref<TxStateValue> address,
                   ref<TxStateValue> value);

  /// \brief Register the entries in the entry list as used
  void markUsed(const std::set<ref<TxStoreEntry> > &entryList);

  /// \brief Mark as core all the values and locations that flows to the
  /// target
  void markFlow(ref<TxStateValue> target, const std::string &reason) const;

  /// \brief Mark as core all the pointer values and that flows to the target;
  /// and adjust its offset bound for memory bounds interpolation (a.k.a.
  /// slackening). Returns true if memory bounds violation is detected; false
  /// otherwise.
  bool markPointerFlow(ref<TxStateValue> target,
                       ref<TxStateValue> checkedOffset,
                       const std::string &reason) const {
      std::set<uint64_t> bounds;
      return markPointerFlow(target, checkedOffset, bounds, reason);
  }

  /// \brief Mark as core all the pointer values and that flows to the target;
  /// and adjust its offset bound for memory bounds interpolation (a.k.a.
  /// slackening)
  bool markPointerFlow(ref<TxStateValue> target,
                       ref<TxStateValue> checkedOffset,
                       std::set<uint64_t> &bounds,
                       const std::string &reason) const;

  uint64_t getDepth() const { return depth; }

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
