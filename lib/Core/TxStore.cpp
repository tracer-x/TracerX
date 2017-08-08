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

ref<TxStoreEntry>
TxStore::MiddleStateStore::find(ref<TxStateAddress> loc) const {
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

bool TxStore::MiddleStateStore::updateStore(ref<TxStateAddress> loc,
                                            ref<TxStateValue> address,
                                            ref<TxStateValue> value,
                                            uint64_t _depth) {
  if (loc->getAllocationInfo() != allocInfo)
    return false;

  if (loc->hasConstantAddress()) {
    concretelyAddressedStore[loc->getAsVariable()] =
        ref<TxStoreEntry>(new TxStoreEntry(loc, address, value, _depth));
  } else {
    symbolicallyAddressedStore[loc->getAsVariable()] =
        ref<TxStoreEntry>(new TxStoreEntry(loc, address, value, _depth));
  }
  return true;
}

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
  TopStateStore::const_iterator storeIter =
      internalStore.find(loc->getContext());
  if (storeIter != internalStore.end()) {
    return storeIter->second.find(loc);
  }

  ref<TxStoreEntry> nullEntry;
  return nullEntry;
}

void TxStore::getStoredExpressions(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly, bool leftRetrieval,
    TopInterpolantStore &_concretelyAddressedStore,
    TopInterpolantStore &_symbolicallyAddressedStore,
    LowerInterpolantStore &_concretelyAddressedHistoricalStore,
    LowerInterpolantStore &_symbolicallyAddressedHistoricalStore) const {
  getConcreteStore(callHistory, replacements, coreOnly, leftRetrieval,
                   _concretelyAddressedStore,
                   _concretelyAddressedHistoricalStore);
  getSymbolicStore(callHistory, replacements, coreOnly, leftRetrieval,
                   _symbolicallyAddressedStore,
                   _symbolicallyAddressedHistoricalStore);
}

inline void TxStore::concreteToInterpolant(
    ref<TxVariable> variable, ref<TxStoreEntry> entry,
    std::set<const Array *> &replacements, bool coreOnly,
    LowerInterpolantStore &map, bool leftRetrieval) const {
  if (!coreOnly) {
    map[variable] = entry->getContent()->getInterpolantStyleValue();
  } else if (entry->getContent()->isCore()) {
    // Do not add to the map if entry is not used
    if (leftRetrieval) {
      if (usedByLeftPath.find(entry) == usedByLeftPath.end())
        return;
    } else if (usedByRightPath.find(entry) == usedByRightPath.end()) {
      return;
    }

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

inline void TxStore::symbolicToInterpolant(
    ref<TxVariable> variable, ref<TxStoreEntry> entry,
    std::set<const Array *> &replacements, bool coreOnly,
    LowerInterpolantStore &map, bool leftRetrieval) const {
  if (!coreOnly) {
    map[variable] = entry->getContent()->getInterpolantStyleValue();
  } else if (entry->getContent()->isCore()) {
    // Do not add to the map if entry is not used
    if (leftRetrieval) {
      if (usedByLeftPath.find(entry) == usedByLeftPath.end())
        return;
    } else if (usedByRightPath.find(entry) == usedByRightPath.end()) {
      return;
    }

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
    std::set<const Array *> &replacements, bool coreOnly, bool leftRetrieval,
    TopInterpolantStore &_concretelyAddressedStore,
    LowerInterpolantStore &_concretelyAddressedHistoricalStore) const {
  for (TopStateStore::const_iterator it = internalStore.begin(),
                                     ie = internalStore.end();
       it != ie; ++it) {
    TopInterpolantStore::iterator storeIter =
        _concretelyAddressedStore.find(it->first);

    const MiddleStateStore &middleStore = it->second;

    if (storeIter == _concretelyAddressedStore.end()) {
      LowerInterpolantStore map;

      for (LowerStateStore::const_iterator it1 = middleStore.concreteBegin(),
                                           ie1 = middleStore.concreteEnd();
           it1 != ie1; ++it1) {
        concreteToInterpolant(it1->first, it1->second, replacements, coreOnly,
                              map, leftRetrieval);
      }

      // The map is only added when it is not empty; this is to avoid entries
      // mapped to empty structure in concretelyAddressedStore
      if (!map.empty()) {
        _concretelyAddressedStore[it->first] = map;
      }
    } else {
      for (LowerStateStore::const_iterator it1 = middleStore.concreteBegin(),
                                           ie1 = middleStore.concreteEnd();
           it1 != ie1; ++it1) {
        concreteToInterpolant(it1->first, it1->second, replacements, coreOnly,
                              storeIter->second, leftRetrieval);
      }
    }
  }

  for (LowerStateStore::const_iterator
           it = concretelyAddressedHistoricalStore.begin(),
           ie = concretelyAddressedHistoricalStore.end();
       it != ie; ++it) {
    concreteToInterpolant(it->first, it->second, replacements, coreOnly,
                          _concretelyAddressedHistoricalStore, leftRetrieval);
  }
}

void TxStore::getSymbolicStore(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly, bool leftRetrieval,
    TopInterpolantStore &_symbolicallyAddressedStore,
    LowerInterpolantStore &_symbolicallyAddressedHistoricalStore) const {
  for (TopStateStore::const_iterator it = internalStore.begin(),
                                     ie = internalStore.end();
       it != ie; ++it) {
    TopInterpolantStore::iterator storeIter =
        _symbolicallyAddressedStore.find(it->first);

    const MiddleStateStore &middleStore = it->second;

    if (storeIter == _symbolicallyAddressedStore.end()) {
      LowerInterpolantStore map;

      for (LowerStateStore::const_iterator it1 = middleStore.symbolicBegin(),
                                           ie1 = middleStore.symbolicEnd();
           it1 != ie1; ++it1) {
        symbolicToInterpolant(it1->first, it1->second, replacements, coreOnly,
                              map, leftRetrieval);
      }

      // The map is only added when it is not empty; this is to avoid entries
      // mapped to empty structure in symbolicallyAddressedStore
      if (!map.empty()) {
        _symbolicallyAddressedStore[it->first] = map;
      }
    } else {
      for (LowerStateStore::const_iterator it1 = middleStore.symbolicBegin(),
                                           ie1 = middleStore.symbolicEnd();
           it1 != ie1; ++it1) {
        symbolicToInterpolant(it1->first, it1->second, replacements, coreOnly,
                              storeIter->second, leftRetrieval);
      }
    }
  }

  for (LowerStateStore::const_iterator
           it = symbolicallyAddressedHistoricalStore.begin(),
           ie = symbolicallyAddressedHistoricalStore.end();
       it != ie; ++it) {
    symbolicToInterpolant(it->first, it->second, replacements, coreOnly,
                          _symbolicallyAddressedHistoricalStore, leftRetrieval);
  }
}

void TxStore::updateStoreWithLoadedValue(ref<TxStateAddress> loc,
                                         ref<TxStateValue> address,
                                         ref<TxStateValue> value) {
  std::set<ref<TxStateAddress> > locations;
  locations.insert(loc);
  updateStore(locations, address, value);
  value->setLoadAddress(address);
}

void TxStore::updateStore(const std::set<ref<TxStateAddress> > &locations,
                          ref<TxStateValue> address, ref<TxStateValue> value) {
  for (std::set<ref<TxStateAddress> >::const_iterator it = locations.begin(),
                                                      ie = locations.end();
       it != ie; ++it) {
    TopStateStore::iterator middleStoreIter =
        internalStore.find((*it)->getContext());

    if (middleStoreIter != internalStore.end()) {
      MiddleStateStore &middleStore = middleStoreIter->second;
      if (middleStore.hasAllocationInfo((*it)->getAllocationInfo())) {
        middleStore.updateStore((*it), address, value, depth);
        return;
      }

      // Here we save the old store
      concretelyAddressedHistoricalStore.insert(middleStore.concreteBegin(),
                                                middleStore.concreteEnd());
      symbolicallyAddressedHistoricalStore.insert(middleStore.symbolicBegin(),
                                                  middleStore.symbolicEnd());
    }

    MiddleStateStore newMiddleStateStore((*it)->getAllocationInfo());
    internalStore[(*it)->getContext()] = newMiddleStateStore;
    MiddleStateStore &middleStateStore = internalStore[(*it)->getContext()];
    middleStateStore.updateStore((*it), address, value, depth);
  }
}

/// \brief Print the content of the object to the LLVM error stream
void TxStore::print(llvm::raw_ostream &stream) const { this->print(stream, 0); }

void TxStore::print(llvm::raw_ostream &stream,
                    const unsigned paddingAmount) const {
  std::string tabs = makeTabs(paddingAmount);
  std::string tabsNext = appendTab(tabs);
  std::string tabsNextNext = appendTab(tabsNext);

  stream << tabs << "store = [";
  if (!internalStore.empty()) {
    stream << "\n";
    for (TopStateStore::const_iterator topIs = internalStore.begin(),
                                       topIe = internalStore.end(),
                                       topIt = topIs;
         topIt != topIe; ++topIt) {
      if (topIt != topIs) {
        stream << "\n";
      }
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
