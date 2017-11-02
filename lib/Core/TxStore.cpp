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
#include "klee/Internal/Module/TxValues.h"
#include "klee/util/TxPrintUtil.h"

using namespace klee;

namespace klee {

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

ref<TxStoreEntry> TxStore::MiddleStateStore::updateStore(
    const TxStore *store, ref<TxStateAddress> loc, ref<TxStateValue> address,
    ref<TxStateValue> value, uint64_t _depth) {
  ref<TxStoreEntry> ret;

  // Return null entry in case allocation info do not match
  if (loc->getAllocationInfo() != allocInfo)
    return ret;

  ret = ref<TxStoreEntry>(new TxStoreEntry(loc, address, value, store, _depth));
  if (loc->hasConstantAddress()) {
    concretelyAddressedStore[loc->getAsVariable()] = ret;
  } else {
    symbolicallyAddressedStore[loc->getAsVariable()] = ret;
  }
  return ret;
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

bool TxStore::isInLeftSubtree(uint64_t targetDepth) const {
  const TxStore *current = this;
  bool inLeftSubtree = false;

  assert(current->depth < targetDepth &&
         "entry should have been defined in an ancestor node");

  while (current->depth < targetDepth) {
    if (current == current->parent->left) {
      inLeftSubtree = true;
    } else {
      inLeftSubtree = false;
    }
    current = current->parent;
  }

  return inLeftSubtree;
}

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
    const std::map<ref<Expr>, ref<Expr> > &substitution,
    std::set<const Array *> &replacements, bool coreOnly, bool leftRetrieval,
    TopInterpolantStore &_concretelyAddressedStore,
    TopInterpolantStore &_symbolicallyAddressedStore,
    LowerInterpolantStore &_concretelyAddressedHistoricalStore,
    LowerInterpolantStore &_symbolicallyAddressedHistoricalStore) const {
  getConcreteStore(callHistory, substitution, replacements, coreOnly,
                   leftRetrieval, _concretelyAddressedStore,
                   _concretelyAddressedHistoricalStore);
  getSymbolicStore(callHistory, substitution, replacements, coreOnly,
                   leftRetrieval, _symbolicallyAddressedStore,
                   _symbolicallyAddressedHistoricalStore);
}

inline void TxStore::concreteToInterpolant(
    ref<TxVariable> variable, ref<TxStoreEntry> entry,
    const std::map<ref<Expr>, ref<Expr> > &substitution,
    std::set<const Array *> &replacements, bool coreOnly,
    LowerInterpolantStore &map, bool leftRetrieval) const {
  if (!coreOnly) {
    ref<TxStateValue> stateValue = entry->getContent();
    ref<TxInterpolantValue> interpolantValue =
        stateValue->getInterpolantStyleValue();
    interpolantValue->setOriginalValue(stateValue);
    map[variable] = interpolantValue;
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
      map[variable] = entry->getContent()->getInterpolantStyleValue(
          substitution, replacements);
    } else {
      map[variable] = entry->getContent()->getInterpolantStyleValue();
    }
#else
    map[variable] = entry->getContent()->getInterpolantStyleValue(substitution,
                                                                  replacements);
#endif
  }
}

inline void TxStore::symbolicToInterpolant(
    ref<TxVariable> variable, ref<TxStoreEntry> entry,
    const std::map<ref<Expr>, ref<Expr> > &substitution,
    std::set<const Array *> &replacements, bool coreOnly,
    LowerInterpolantStore &map, bool leftRetrieval) const {
  if (!coreOnly) {
    ref<TxStateValue> stateValue = entry->getContent();
    ref<TxInterpolantValue> interpolantValue =
        stateValue->getInterpolantStyleValue();
    interpolantValue->setOriginalValue(stateValue);
    map[variable] = interpolantValue;
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
      map[address] = entry->getContent()->getInterpolantStyleValue(
          substitution, replacements);
    } else {
      map[variable] = entry->getContent()->getInterpolantStyleValue();
    }
#else
    ref<TxVariable> address = TxStateAddress::create(
        entry->getAddress(), replacements)->getAsVariable();
    map[address] = entry->getContent()->getInterpolantStyleValue(substitution,
                                                                 replacements);
#endif
  }
}

void TxStore::getConcreteStore(
    const std::vector<llvm::Instruction *> &callHistory,
    const std::map<ref<Expr>, ref<Expr> > &substitution,
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
        concreteToInterpolant(it1->first, it1->second, substitution,
                              replacements, coreOnly, map, leftRetrieval);
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
        concreteToInterpolant(it1->first, it1->second, substitution,
                              replacements, coreOnly, storeIter->second,
                              leftRetrieval);
      }
    }
  }

  for (LowerStateStore::const_iterator
           it = concretelyAddressedHistoricalStore.begin(),
           ie = concretelyAddressedHistoricalStore.end();
       it != ie; ++it) {
    concreteToInterpolant(it->first, it->second, substitution, replacements,
                          coreOnly, _concretelyAddressedHistoricalStore,
                          leftRetrieval);
  }
}

void TxStore::getSymbolicStore(
    const std::vector<llvm::Instruction *> &callHistory,
    const std::map<ref<Expr>, ref<Expr> > &substitution,
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
        symbolicToInterpolant(it1->first, it1->second, substitution,
                              replacements, coreOnly, map, leftRetrieval);
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
        symbolicToInterpolant(it1->first, it1->second, substitution,
                              replacements, coreOnly, storeIter->second,
                              leftRetrieval);
      }
    }
  }

  for (LowerStateStore::const_iterator
           it = symbolicallyAddressedHistoricalStore.begin(),
           ie = symbolicallyAddressedHistoricalStore.end();
       it != ie; ++it) {
    symbolicToInterpolant(it->first, it->second, substitution, replacements,
                          coreOnly, _symbolicallyAddressedHistoricalStore,
                          leftRetrieval);
  }
}

void TxStore::updateStoreWithLoadedValue(ref<TxStateAddress> loc,
                                         ref<TxStateValue> address,
                                         ref<TxStateValue> value) {
  updateStore(loc, address, value);
  value->addLoadAddress(address);
}

void TxStore::updateStore(ref<TxStateAddress> location,
                          ref<TxStateValue> address, ref<TxStateValue> value) {
  if (location.isNull())
    return;

  // Here we also mark the entries used to build the value as used. Only used
  // entries will be in the interpolant
  markUsed(value->getAllowBoundEntryList());
  markUsed(value->getDisableBoundEntryList());

  // We want to renew the table entry list, so we first remove the old ones
  value->resetStoreEntryList();

  TopStateStore::iterator middleStoreIter =
      internalStore.find(location->getContext());

  if (middleStoreIter != internalStore.end()) {
    MiddleStateStore &middleStore = middleStoreIter->second;
    if (middleStore.hasAllocationInfo(location->getAllocationInfo())) {
      ref<TxStoreEntry> entry =
          middleStore.updateStore(this, location, address, value, depth);
      if (!entry.isNull()) {
        // We associate this value with the store entry, signifying that the
        // entry is important whenever the value is used. This is used for
        // computing the interpolant.
        value->addStoreEntry(entry);
      }
      return;
    }

    // Here we save the old store
    concretelyAddressedHistoricalStore.insert(middleStore.concreteBegin(),
                                              middleStore.concreteEnd());
    symbolicallyAddressedHistoricalStore.insert(middleStore.symbolicBegin(),
                                                middleStore.symbolicEnd());
  }

  MiddleStateStore newMiddleStateStore(location->getAllocationInfo());
  internalStore[location->getContext()] = newMiddleStateStore;
  MiddleStateStore &middleStateStore = internalStore[location->getContext()];
  ref<TxStoreEntry> entry =
      middleStateStore.updateStore(this, location, address, value, depth);
  if (!entry.isNull()) {
    // We associate this value with the store entry, signifying that the entry
    // is important whenever the value is used. This is used for computing the
    // interpolant.
    value->addStoreEntry(entry);
  }
}

void TxStore::markUsed(const std::set<ref<TxStoreEntry> > &entryList) {
  for (std::set<ref<TxStoreEntry> >::const_iterator it = entryList.begin(),
                                                    ie = entryList.end();
       it != ie; ++it) {
    uint64_t entryDepth = (*it)->getDepth();

    // Note that it is possible that entryDepth > depth, due to the association
    // of values with newly-created entries in TxStore::updateStore().
    if (entryDepth >= depth)
      continue;

    // We now register the used entry as used after it was instantiated in
    // previous depth levels
    TxStore *prev = 0, *current = parent;
    while (current && entryDepth <= current->depth) {
      const TxStore *constPrev;
      if (!prev) {
        constPrev = this;
      } else {
        constPrev = prev;
      }
      if (current->left == constPrev) {
        std::set<ref<TxStoreEntry> >::iterator usedEntryIter =
            current->usedByLeftPath.find(*it);
        if (usedEntryIter == current->usedByLeftPath.end()) {
          current->usedByLeftPath.insert(*it);
        } else {
          break;
        }
      } else if (current->right == constPrev) {
        std::set<ref<TxStoreEntry> >::iterator usedEntryIter =
            current->usedByRightPath.find(*it);
        if (usedEntryIter == current->usedByRightPath.end()) {
          current->usedByRightPath.insert(*it);
        } else {
          break;
        }
      } else {
        assert(!"child is neither left not right");
      }
      prev = current;
      current = current->parent;
    }
  }
}

void TxStore::recursivelyMarkFlow(ref<TxStoreEntry> entry, bool leftMarking,
                                  const std::string &reason) const {
  if (entry.isNull())
    return;

  if (entry->isCore(leftMarking)) {
    if (!entry->canInterpolateBound(leftMarking))
      return;
  }

  entry->setAsCore(leftMarking, reason);
  entry->disableBoundInterpolation(leftMarking);

  std::map<ref<TxStoreEntry>, bool> &allowBoundEntryList(
      entry->getAllowBoundEntryList());
  for (std::map<ref<TxStoreEntry>, bool>::iterator
           it = allowBoundEntryList.begin(),
           ie = allowBoundEntryList.end();
       it != ie; ++it) {
    recursivelyMarkFlow(it->first, it->second, reason);
  }

  std::map<ref<TxStoreEntry>, bool> &disableBoundEntryList(
      entry->getDisableBoundEntryList());
  for (std::map<ref<TxStoreEntry>, bool>::iterator
           it = disableBoundEntryList.begin(),
           ie = disableBoundEntryList.end();
       it != ie; ++it) {
    recursivelyMarkFlow(it->first, it->second, reason);
  }
}

void TxStore::markFlow(ref<TxStateValue> target,
                       const std::string &reason) const {
  if (target.isNull())
    return;

  const std::set<ref<TxStoreEntry> > &allowBoundEntryList(
      target->getAllowBoundEntryList());
  for (std::set<ref<TxStoreEntry> >::const_iterator
           it = allowBoundEntryList.begin(),
           ie = allowBoundEntryList.end();
       it != ie; ++it) {
    recursivelyMarkFlow(*it, isInLeftSubtree((*it)->getDepth()), reason);
  }

  const std::set<ref<TxStoreEntry> > &disableBoundEntryList(
      target->getDisableBoundEntryList());
  for (std::set<ref<TxStoreEntry> >::const_iterator
           it = disableBoundEntryList.begin(),
           ie = disableBoundEntryList.end();
       it != ie; ++it) {
    recursivelyMarkFlow(*it, isInLeftSubtree((*it)->getDepth()), reason);
  }
}

bool TxStore::recursivelyMarkPointerFlow(ref<TxStoreEntry> entry,
                                         bool leftMarking,
                                         ref<TxStateValue> checkedAddress,
                                         std::set<uint64_t> &bounds,
                                         const std::string &reason) const {
  bool memoryError = false;
  bool boundUpdated = false;

  if (entry.isNull())
    return memoryError;

  if (entry->canInterpolateBound(leftMarking)) {
    memoryError = entry->getPointerInfo(leftMarking)
                      ->adjustOffsetBound(checkedAddress, bounds, boundUpdated);
  }

  // If this was the first time this value gets marked, we should propagate the
  // marking further
  if (!entry->isCore(leftMarking))
    boundUpdated = true;

  entry->setAsCore(leftMarking, reason);

  if (memoryError) {
    std::map<ref<TxStoreEntry>, bool> &allowBoundEntryList(
        entry->getAllowBoundEntryList());
    for (std::map<ref<TxStoreEntry>, bool>::iterator
             it = allowBoundEntryList.begin(),
             ie = allowBoundEntryList.end();
         it != ie; ++it) {
      recursivelyMarkFlow(it->first, it->second, reason);
    }
  } else {
    if (boundUpdated) {
      std::map<ref<TxStoreEntry>, bool> &allowBoundEntryList(
          entry->getAllowBoundEntryList());
      for (std::map<ref<TxStoreEntry>, bool>::iterator
               it = allowBoundEntryList.begin(),
               ie = allowBoundEntryList.end();
           it != ie; ++it) {
        if (!it->first->isPointer()) {
          recursivelyMarkFlow(it->first, it->second, reason);
        } else {
          memoryError =
              recursivelyMarkPointerFlow(it->first, it->second, checkedAddress,
                                         bounds, reason)
                  ? true
                  : memoryError;
        }
      }
    }
  }

  std::map<ref<TxStoreEntry>, bool> &disableBoundEntryList(
      entry->getDisableBoundEntryList());
  for (std::map<ref<TxStoreEntry>, bool>::iterator
           it = disableBoundEntryList.begin(),
           ie = disableBoundEntryList.end();
       it != ie; ++it) {
    recursivelyMarkFlow(it->first, it->second, reason);
  }

  return memoryError;
}

void TxStore::markPointerFlow(ref<TxStateValue> target,
                              ref<TxStateValue> checkedAddress,
                              std::set<uint64_t> &bounds,
                              const std::string &reason) const {
  if (target.isNull())
    return;

  const std::set<ref<TxStoreEntry> > &allowBoundEntryList(
      target->getAllowBoundEntryList());
  for (std::set<ref<TxStoreEntry> >::const_iterator
           it = allowBoundEntryList.begin(),
           ie = allowBoundEntryList.end();
       it != ie; ++it) {
    recursivelyMarkPointerFlow(*it, isInLeftSubtree((*it)->getDepth()),
                               checkedAddress, bounds, reason);
  }

  const std::set<ref<TxStoreEntry> > &disableBoundEntryList(
      target->getDisableBoundEntryList());
  for (std::set<ref<TxStoreEntry> >::const_iterator
           it = disableBoundEntryList.begin(),
           ie = disableBoundEntryList.end();
       it != ie; ++it) {
    recursivelyMarkFlow(*it, isInLeftSubtree((*it)->getDepth()), reason);
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
