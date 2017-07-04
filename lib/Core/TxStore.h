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
  typedef std::map<ref<TxInterpolantAddress>, ref<TxInterpolantValue> >
  LowerInterpolantStore;
  typedef std::map<const llvm::Value *, LowerInterpolantStore>
  TopInterpolantStore;
  typedef std::map<ref<TxStateAddress>,
                   std::pair<ref<TxStateValue>, ref<TxStateValue> > >
  StateStore;

private:
  /// \brief The mapping of concrete locations to stored value
  StateStore concretelyAddressedStore;

  /// \brief Ordered keys of the concretely-addressed store.
  std::vector<ref<TxStateAddress> > concretelyAddressedStoreKeys;

  /// \brief The mapping of symbolic locations to stored value
  StateStore symbolicallyAddressedStore;

  /// \brief Ordered keys of the symbolically-addressed store.
  std::vector<ref<TxStateAddress> > symbolicallyAddressedStoreKeys;

  void removeAddressValue(
      std::map<ref<TxStateAddress>, ref<TxStateValue> > &simpleStore,
      TopInterpolantStore &concreteStore, std::set<const Array *> &replacements,
      bool coreOnly) const;

  void
  getConcreteStore(const std::vector<llvm::Instruction *> &callHistory,
                   const StateStore &store,
                   const std::vector<ref<TxStateAddress> > &orderedStoreKeys,
                   std::set<const Array *> &replacements, bool coreOnly,
                   TopInterpolantStore &concreteStore) const;

  void
  getSymbolicStore(const std::vector<llvm::Instruction *> &callHistory,
                   const StateStore &store,
                   const std::vector<ref<TxStateAddress> > &orderedStoreKeys,
                   std::set<const Array *> &replacements, bool coreOnly,
                   TopInterpolantStore &symbolicStore) const;

public:
  /// \brief Constructor for an empty store.
  TxStore() {}

  /// \brief The copy constructor of this class.
  TxStore(const TxStore &src)
      : concretelyAddressedStore(src.concretelyAddressedStore),
        concretelyAddressedStoreKeys(src.concretelyAddressedStoreKeys),
        symbolicallyAddressedStore(src.symbolicallyAddressedStore),
        symbolicallyAddressedStoreKeys(src.symbolicallyAddressedStoreKeys) {}

  ~TxStore() {
    // Delete the locally-constructed relations
    concretelyAddressedStore.clear();
    concretelyAddressedStoreKeys.clear();
    symbolicallyAddressedStore.clear();
    symbolicallyAddressedStoreKeys.clear();
  }

  StateStore::iterator concreteFind(ref<TxStateAddress> loc) {
    return concretelyAddressedStore.find(loc);
  }

  StateStore::iterator concreteBegin() {
    return concretelyAddressedStore.begin();
  }

  StateStore::iterator concreteEnd() { return concretelyAddressedStore.end(); }

  StateStore::iterator symbolicFind(ref<TxStateAddress> loc) {
    return symbolicallyAddressedStore.find(loc);
  }

  StateStore::iterator symbolicBegin() {
    return symbolicallyAddressedStore.begin();
  }

  StateStore::iterator symbolicEnd() {
    return symbolicallyAddressedStore.end();
  }

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
