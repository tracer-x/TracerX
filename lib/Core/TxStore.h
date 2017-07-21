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
};

class TxStore {
public:
  typedef std::map<ref<TxVariable>, ref<TxInterpolantValue> >
  LowerInterpolantStore;
  typedef std::map<const llvm::Value *, LowerInterpolantStore>
  TopInterpolantStore;
  typedef std::map<ref<TxVariable>, ref<TxStoreEntry> > LowerStateStore;
  typedef std::map<ref<AllocationContext>, LowerStateStore> TopStateStore;

private:
  /// \brief The mapping of concrete locations to stored value
  TopStateStore concretelyAddressedStore;

  /// \brief The mapping of symbolic locations to stored value
  TopStateStore symbolicallyAddressedStore;

  void getConcreteStore(const std::vector<llvm::Instruction *> &callHistory,
                        const TopStateStore &store,
                        std::set<const Array *> &replacements, bool coreOnly,
                        TopInterpolantStore &concreteStore) const;

  void getSymbolicStore(const std::vector<llvm::Instruction *> &callHistory,
                        const TopStateStore &store,
                        std::set<const Array *> &replacements, bool coreOnly,
                        TopInterpolantStore &symbolicStore) const;

public:
  /// \brief Constructor for an empty store.
  TxStore() {}

  /// \brief The copy constructor of this class.
  TxStore(const TxStore &src)
      : concretelyAddressedStore(src.concretelyAddressedStore),
        symbolicallyAddressedStore(src.symbolicallyAddressedStore) {}

  ~TxStore() {
    // Delete the locally-constructed relations
    concretelyAddressedStore.clear();
    symbolicallyAddressedStore.clear();
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
  void getStoredExpressions(const std::vector<llvm::Instruction *> &callHistory,
                            std::set<const Array *> &replacements,
                            bool coreOnly,
                            TopInterpolantStore &_concretelyAddressedStore,
                            TopInterpolantStore &_symbolicallyAddressedStore);

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
