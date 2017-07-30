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

void TxStoreEntry::print(llvm::raw_ostream &stream,
                         const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);

  stream << prefix << "address:\n";
  address->print(stream, tabsNext);
  stream << "\n";
  stream << prefix << "content:\n";
  content->print(stream, tabsNext);
}

/**/

void TxStore::MiddleStateStore::print(llvm::raw_ostream &stream,
                                      const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);
  std::string tabsNextNext = appendTab(tabsNext);

  allocInfo->print(stream, prefix);
  stream << ":";
  stream << "\n" << prefix << "concretely-addressed store = [";
  if (!concretelyAddressedStore.empty()) {
    stream << "\n";
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
    stream << prefix;
  }
  stream << "]";

  stream << "\n" << prefix << "symbolically-addressed store = [";
  if (!symbolicallyAddressedStore.empty()) {
    stream << "\n";
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
    stream << prefix;
  }
  stream << "]";
}

/**/

ref<TxStoreEntry> TxStore::find(ref<TxStateAddress> loc) const {
  TopStateStore::const_iterator storeIter = store.find(loc->getContext());
  if (storeIter != store.end()) {
    return storeIter->second.find(loc);
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

    TopInterpolantStore::iterator storeIter =
        concretelyAddressedStore.find(it->first->getValue());

    const MiddleStateStore &middleStore = it->second;

    if (storeIter == concretelyAddressedStore.end()) {
      LowerInterpolantStore map;

      for (LowerStateStore::const_iterator it1 = middleStore.concreteBegin(),
                                           ie1 = middleStore.concreteEnd();
           it1 != ie1; ++it1) {
        concreteToInterpolant(it1->first, it1->second, replacements, coreOnly,
                              map);
      }

      // The map is only added when it is not empty; this is to avoid entries
      // mapped to empty structure in concretelyAddressedStore
      if (!map.empty()) {
        concretelyAddressedStore[it->first->getValue()] = map;
      }
    } else {
      for (LowerStateStore::const_iterator it1 = middleStore.concreteBegin(),
                                           ie1 = middleStore.concreteEnd();
           it1 != ie1; ++it1) {
        concreteToInterpolant(it1->first, it1->second, replacements, coreOnly,
                              storeIter->second);
      }
    }
  }

  for (LowerStateStore::const_iterator it = historicalStore.begin(),
                                       ie = historicalStore.end();
       it != ie; ++it) {
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

    TopInterpolantStore::iterator storeIter =
        symbolicallyAddressedStore.find(it->first->getValue());

    const MiddleStateStore &middleStore = it->second;

    if (storeIter == symbolicallyAddressedStore.end()) {
      LowerInterpolantStore map;

      for (LowerStateStore::const_iterator it1 = middleStore.symbolicBegin(),
                                           ie1 = middleStore.symbolicEnd();
           it1 != ie1; ++it1) {
        symbolicToInterpolant(it1->first, it1->second, replacements, coreOnly,
                              map);
      }

      // The map is only added when it is not empty; this is to avoid entries
      // mapped to empty structure in symbolicallyAddressedStore
      if (!map.empty()) {
        symbolicallyAddressedStore[it->first->getValue()] = map;
      }
    } else {
      for (LowerStateStore::const_iterator it1 = middleStore.symbolicBegin(),
                                           ie1 = middleStore.symbolicEnd();
           it1 != ie1; ++it1) {
        symbolicToInterpolant(it1->first, it1->second, replacements, coreOnly,
                              storeIter->second);
      }
    }
  }

  for (LowerStateStore::const_iterator it = historicalStore.begin(),
                                       ie = historicalStore.end();
       it != ie; ++it) {
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
    MiddleStateStore &middleStore = middleStoreIter->second;
    if (middleStore.hasAllocationInfo(loc->getAllocationInfo())) {
      middleStore.updateStore(loc, address, value);
      return;
    }

    // Here we save the old store
    concretelyAddressedHistoricalStore.insert(middleStore.concreteBegin(),
                                              middleStore.concreteEnd());
    symbolicallyAddressedHistoricalStore.insert(middleStore.symbolicBegin(),
                                                middleStore.symbolicEnd());
  }

  MiddleStateStore newMiddleStateStore(loc->getAllocationInfo());
  store[loc->getContext()] = newMiddleStateStore;
  newMiddleStateStore.updateStore(loc, address, value);
}

/// \brief Print the content of the object to the LLVM error stream
void TxStore::print(llvm::raw_ostream &stream) const { this->print(stream, 0); }

void TxStore::print(llvm::raw_ostream &stream,
                    const unsigned paddingAmount) const {
  std::string tabs = makeTabs(paddingAmount);
  std::string tabsNext = appendTab(tabs);
  std::string tabsNextNext = appendTab(tabsNext);

  stream << tabs << "store = [";
  if (!store.empty()) {
    stream << "\n";
    for (TopStateStore::const_iterator topIs = store.begin(),
                                       topIe = store.end(), topIt = topIs;
         topIt != topIe; ++topIt) {
      topIt->first->print(stream, tabsNext);
      stream << ":\n";
      topIt->second.print(stream, tabsNextNext);
    }
    stream << tabs;
  }
  stream << "]";

  stream << "\n" << tabs << "concretely-addressed historical store = [";
  if (!concretelyAddressedHistoricalStore.empty()) {
    stream << "\n";
    for (TxStore::LowerStateStore::const_iterator
             is1 = concretelyAddressedHistoricalStore.begin(),
             ie1 = concretelyAddressedHistoricalStore.end(), it1 = is1;
         it1 != ie1; ++it1) {
      if (it1 != is1)
        stream << tabsNext << "------------------------------------------\n";
      it1->second->print(stream, tabsNext);
      stream << "\n";
    }
    stream << tabs;
  }
  stream << "]";

  stream << "\n" << tabs << "symbolically-addressed historical store = [";
  if (!symbolicallyAddressedHistoricalStore.empty()) {
    stream << "\n";
    for (TxStore::LowerStateStore::const_iterator
             is1 = symbolicallyAddressedHistoricalStore.begin(),
             ie1 = symbolicallyAddressedHistoricalStore.end(), it1 = is1;
         it1 != ie1; ++it1) {
      if (it1 != is1)
        stream << tabsNext << "------------------------------------------\n";
      it1->second->print(stream, tabsNext);
      stream << "\n";
    }
    stream << tabs;
  }
  stream << "]";
}
}
