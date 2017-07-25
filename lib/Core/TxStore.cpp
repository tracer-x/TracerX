//===-- TxStore.cpp - A view of program memory ------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementations of the shadow memory to support the
/// dependency computation of memory locations and the generation of
/// interpolants.
///
//===----------------------------------------------------------------------===//

#include "TxStore.h"

#include "klee/CommandLine.h"
#include "klee/util/TxPrintUtil.h"

using namespace klee;

namespace klee {

void TxStore::MiddleStateStore::print(llvm::raw_ostream &stream,
                                      const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);
  std::string tabsNextNext = appendTab(tabsNext);

  allocInfo->print(stream, prefix);
  stream << ":\n";
  if (concretelyAddressedStore.empty()) {
    stream << prefix << "concretely-addressed store = []\n";
  } else {
    stream << prefix << "concretely-addressed store = [\n";
    for (LowerStateStore::const_iterator
             lowerIs = concretelyAddressedStore.begin(),
             lowerIe = concretelyAddressedStore.end(), lowerIt = lowerIs;
         lowerIt != lowerIe; ++lowerIt) {
      if (lowerIt != lowerIs)
        stream << tabsNext << "------------------------------------------\n";
      stream << tabsNext << "address:\n";
      lowerIt->second->getAddress()->print(stream, tabsNextNext);
      stream << "\n";
      stream << tabsNext << "content:\n";
      lowerIt->second->getContent()->print(stream, tabsNextNext);
      stream << "\n";
    }
    stream << prefix << "]\n";
  }

  if (symbolicallyAddressedStore.empty()) {
    stream << prefix << "symbolically-addressed store = []";
  } else {
    stream << prefix << "symbolically-addressed store = [\n";
    for (LowerStateStore::const_iterator
             lowerIs = symbolicallyAddressedStore.begin(),
             lowerIe = symbolicallyAddressedStore.end(), lowerIt = lowerIs;
         lowerIt != lowerIe; ++lowerIt) {
      if (lowerIt != lowerIs)
        stream << tabsNext << "------------------------------------------\n";
      stream << tabsNext << "address:\n";
      lowerIt->second->getAddress()->print(stream, tabsNextNext);
      stream << "\n";
      stream << tabsNext << "content:\n";
      lowerIt->second->getContent()->print(stream, tabsNextNext);
      stream << "\n";
    }
    stream << prefix << "]";
  }
}

/**/

ref<TxStoreEntry> TxStore::find(ref<TxStateAddress> loc) const {
  TopStateStore::const_iterator storeIter = store.find(loc->getContext());
  if (storeIter != store.end()) {
    return storeIter->second->find(loc);
  }

  ref<TxStoreEntry> nullEntry;
  return nullEntry;
}

void TxStore::getStoredExpressions(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly,
    TopInterpolantStore &_concretelyAddressedStore,
    TopInterpolantStore &_symbolicallyAddressedStore,
    LowerInterpolantStore &_concretelyAddressedHistoricalStore,
    LowerInterpolantStore &_symbolicallyAddressedHistoricalStore) const {
  getConcreteStore(callHistory, store, concretelyAddressedHistoricalStore,
                   replacements, coreOnly, _concretelyAddressedStore,
                   _concretelyAddressedHistoricalStore);
  getSymbolicStore(callHistory, store, symbolicallyAddressedHistoricalStore,
                   replacements, coreOnly, _symbolicallyAddressedStore,
                   _symbolicallyAddressedHistoricalStore);
}

inline void
TxStore::concreteToInterpolant(ref<TxVariable> variable,
                               ref<TxStoreEntry> entry,
                               std::set<const Array *> &replacements,
                               bool coreOnly, LowerInterpolantStore &map) {
  if (!coreOnly) {
    map[variable] = entry->getContent()->getInterpolantStyleValue();
  } else {
// An address is in the core if it stores a value that is in the core
#ifdef ENABLE_Z3
    if (!NoExistential) {
      map[variable] =
          entry->getContent()->getInterpolantStyleValue(replacements);
    } else {
      map[variable] = entry->getContent()->getInterpolantStyleValue();
    }
#else
    map[variable] = entry->getContent()->getInterpolantStyleValue(replacements);
#endif
  }
}

inline void
TxStore::symbolicToInterpolant(ref<TxVariable> variable,
                               ref<TxStoreEntry> entry,
                               std::set<const Array *> &replacements,
                               bool coreOnly, LowerInterpolantStore &map) {
  if (!coreOnly) {
    map[variable] = entry->getContent()->getInterpolantStyleValue();
  } else if (entry->getContent()->isCore()) {
// An address is in the core if it stores a value that is in the core
#ifdef ENABLE_Z3
    if (!NoExistential) {
      ref<TxVariable> address = TxStateAddress::create(
          entry->getAddress(), replacements)->getAsVariable();
      map[address] =
          entry->getContent()->getInterpolantStyleValue(replacements);
    } else {
      map[variable] = entry->getContent()->getInterpolantStyleValue();
    }
#else
    ref<TxVariable> address = TxStateAddress::create(
        entry->getAddress(), replacements)->getAsVariable();
    map[address] = entry->getContent()->getInterpolantStyleValue(replacements);
#endif
  }
}

void TxStore::getConcreteStore(
    const std::vector<llvm::Instruction *> &callHistory,
    const TopStateStore &store, const LowerStateStore &historicalStore,
    std::set<const Array *> &replacements, bool coreOnly,
    TopInterpolantStore &concretelyAddressedStore,
    LowerInterpolantStore &concretelyAddressedHistoricalStore) {
  for (TopStateStore::const_iterator it = store.begin(), ie = store.end();
       it != ie; ++it) {
    if (!it->first->isPrefixOf(callHistory))
      continue;

    LowerInterpolantStore &map =
        concretelyAddressedStore[it->first->getValue()];

    ref<MiddleStateStore> middleStore = it->second;

    for (LowerStateStore::const_iterator it1 = middleStore->concreteBegin(),
                                         ie1 = middleStore->concreteEnd();
         it1 != ie1; ++it1) {
      concreteToInterpolant(it1->first, it1->second, replacements, coreOnly,
                            map);
    }
  }

  for (LowerStateStore::const_iterator it = historicalStore.begin(),
                                       ie = historicalStore.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;

    concreteToInterpolant(it->first, it->second, replacements, coreOnly,
                          concretelyAddressedHistoricalStore);
  }
}

void TxStore::getSymbolicStore(
    const std::vector<llvm::Instruction *> &callHistory,
    const TopStateStore &store, const LowerStateStore &historicalStore,
    std::set<const Array *> &replacements, bool coreOnly,
    TopInterpolantStore &symbolicallyAddressedStore,
    LowerInterpolantStore &symbolicallyAddressedHistoricalStore) {
  for (TopStateStore::const_iterator it = store.begin(), ie = store.end();
       it != ie; ++it) {
    if (!it->first->isPrefixOf(callHistory))
      continue;

    LowerInterpolantStore &map =
        symbolicallyAddressedStore[it->first->getValue()];

    ref<MiddleStateStore> middleStore = it->second;

    for (LowerStateStore::const_iterator it1 = middleStore->symbolicBegin(),
                                         ie1 = middleStore->symbolicEnd();
         it1 != ie1; ++it1) {
      symbolicToInterpolant(it1->first, it1->second, replacements, coreOnly,
                            map);
    }
  }

  for (LowerStateStore::const_iterator it = historicalStore.begin(),
                                       ie = historicalStore.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;

    symbolicToInterpolant(it->first, it->second, replacements, coreOnly,
                          symbolicallyAddressedHistoricalStore);
  }
}

void TxStore::updateStoreWithLoadedValue(ref<TxStateAddress> loc,
                                         ref<TxStateValue> address,
                                         ref<TxStateValue> value) {
  updateStore(loc, address, value);
  value->setLoadAddress(address);
}

void TxStore::updateStore(ref<TxStateAddress> loc, ref<TxStateValue> address,
                          ref<TxStateValue> value) {
  TopStateStore::iterator middleStoreIter = store.find(loc->getContext());

  if (middleStoreIter != store.end()) {
    ref<MiddleStateStore> middleStore = middleStoreIter->second;
    if (middleStore->hasAllocationInfo(loc->getAllocationInfo())) {
      middleStore->updateStore(loc, address, value);
      return;
    }

    // Here we save the old store
    concretelyAddressedHistoricalStore.insert(middleStore->concreteBegin(),
                                              middleStore->concreteEnd());
    symbolicallyAddressedHistoricalStore.insert(middleStore->symbolicBegin(),
                                                middleStore->symbolicEnd());
  }

  ref<MiddleStateStore> newMiddleStateStore =
      MiddleStateStore::create(loc->getAllocationInfo());
  store[loc->getContext()] = newMiddleStateStore;
  newMiddleStateStore->updateStore(loc, address, value);
}

/// \brief Print the content of the object to the LLVM error stream
void TxStore::print(llvm::raw_ostream &stream) const { this->print(stream, 0); }

void TxStore::print(llvm::raw_ostream &stream,
                    const unsigned paddingAmount) const {
  std::string tabs = makeTabs(paddingAmount);
  std::string tabsNext = appendTab(tabs);
  std::string tabsNextNext = appendTab(tabsNext);

  if (store.empty()) {
    stream << tabs << "store = []\n";
  } else {
    stream << tabs << "store = [\n";
    for (TopStateStore::const_iterator topIs = store.begin(),
                                       topIe = store.end(), topIt = topIs;
         topIt != topIe; ++topIt) {
      topIt->first->print(stream, tabsNext);
      stream << ":\n";
      topIt->second->print(stream, tabsNextNext);
    }
    stream << tabs << "]\n";
  }
}
}
