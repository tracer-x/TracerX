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

class TxStoreEntry {
public:
  unsigned refCount;

private:
  ref<TxStateAddress> address;

  ref<TxStateValue> addressValue;

  ref<TxStateValue> content;

public:
  TxStoreEntry(ref<TxStateAddress> _address, ref<TxStateValue> _addressValue,
               ref<TxStateValue> _content)
      : refCount(0), address(_address), addressValue(_addressValue),
        content(_content) {}

  ~TxStoreEntry() {}

  ref<TxVariable> getIndex() { return address->getAsVariable(); }

  ref<TxStateAddress> getAddress() { return address; }

  ref<TxStateValue> getAddressValue() { return addressValue; }

  ref<TxStateValue> getContent() { return content; }

  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }

  void print(llvm::raw_ostream &stream) const { print(stream, ""); }

  void print(llvm::raw_ostream &stream, const std::string &prefix) const;
};

class TxStore {
public:
  class MiddleStateStore;

  typedef std::map<ref<TxVariable>, ref<TxInterpolantValue> >
  LowerInterpolantStore;
  typedef std::map<const llvm::Value *, LowerInterpolantStore>
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

    ref<TxStoreEntry> find(ref<TxStateAddress> loc) const {
      ref<TxStoreEntry> ret;

      if (loc->hasConstantAddress()) {
        TxStore::LowerStateStore::const_iterator lowerStoreIter =
            concretelyAddressedStore.find(loc->getAsVariable());

        if (lowerStoreIter != concretelyAddressedStore.end()) {
          ret = lowerStoreIter->second;
        }
      } else {
        TxStore::LowerStateStore::const_iterator lowerStoreIter =
            symbolicallyAddressedStore.find(loc->getAsVariable());
        if (lowerStoreIter != symbolicallyAddressedStore.end()) {
          ret = lowerStoreIter->second;
        }
      }

      return ret;
    }

    bool updateStore(ref<TxStateAddress> loc, ref<TxStateValue> address,
                     ref<TxStateValue> value) {
      if (loc->getAllocationInfo() != allocInfo)
        return false;

      if (loc->hasConstantAddress()) {
        concretelyAddressedStore[loc->getAsVariable()] =
            ref<TxStoreEntry>(new TxStoreEntry(loc, address, value));
      } else {
        symbolicallyAddressedStore[loc->getAsVariable()] =
            ref<TxStoreEntry>(new TxStoreEntry(loc, address, value));
      }
      return true;
    }

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
  TopStateStore store;

  static void concreteToInterpolant(ref<TxVariable> variable,
                                    ref<TxStoreEntry> entry,
                                    std::set<const Array *> &replacements,
                                    bool coreOnly, LowerInterpolantStore &map);

  static void symbolicToInterpolant(ref<TxVariable> variable,
                                    ref<TxStoreEntry> entry,
                                    std::set<const Array *> &replacements,
                                    bool coreOnly, LowerInterpolantStore &map);

  static void
  getConcreteStore(const std::vector<llvm::Instruction *> &callHistory,
                   const TopStateStore &store,
                   const LowerStateStore &historicalStore,
                   std::set<const Array *> &replacements, bool coreOnly,
                   TopInterpolantStore &concretelyAddressedStore,
                   LowerInterpolantStore &concretelyAddressedHistoricalStore);

  static void
  getSymbolicStore(const std::vector<llvm::Instruction *> &callHistory,
                   const TopStateStore &store,
                   const LowerStateStore &historicalStore,
                   std::set<const Array *> &replacements, bool coreOnly,
                   TopInterpolantStore &symbolicallyAddressedStore,
                   LowerInterpolantStore &symbolicallyAddressedHistoricalStore);

  /// \brief Constructor for an empty store.
  TxStore() {}

public:
  ~TxStore() {}

  /// \brief Copy from another object
  static TxStore *create(TxStore *src) {
    TxStore *ret = new TxStore();
    if (!src) {
      return ret;
    }
    ret->concretelyAddressedHistoricalStore =
        src->concretelyAddressedHistoricalStore;
    ret->symbolicallyAddressedHistoricalStore =
        src->symbolicallyAddressedHistoricalStore;
    ret->store = src->store;
    return ret;
  }

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
  void getStoredExpressions(
      const std::vector<llvm::Instruction *> &callHistory,
      std::set<const Array *> &replacements, bool coreOnly,
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
  void updateStore(ref<TxStateAddress> loc, ref<TxStateValue> address,
                   ref<TxStateValue> value);

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
