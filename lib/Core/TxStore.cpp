//===-- TxStore.cpp - A view of program memory -------------------*- C++
//-*-===//
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

void TxStore::getStoredExpressions(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly,
    TopInterpolantStore &_concretelyAddressedStore,
    TopInterpolantStore &_symbolicallyAddressedStore) {
  getConcreteStore(callHistory, concretelyAddressedStore,
                   concretelyAddressedStoreKeys, replacements, coreOnly,
                   _concretelyAddressedStore);
  getSymbolicStore(callHistory, symbolicallyAddressedStore,
                   symbolicallyAddressedStoreKeys, replacements, coreOnly,
                   _symbolicallyAddressedStore);
}

void TxStore::removeAddressValue(
    std::map<ref<TxStateAddress>, ref<TxStateValue> > &simpleStore,
    TopInterpolantStore &concreteStore, std::set<const Array *> &replacements,
    bool coreOnly) const {
  std::map<ref<TxStateAddress>, ref<TxStateValue> > _concreteStore;
  std::set<ref<TxStateAddress> > addressToBeReplaced;

  for (std::map<ref<TxStateAddress>, ref<TxStateValue> >::iterator
           it = simpleStore.begin(),
           ie = simpleStore.end();
       it != ie; ++it) {
    ref<TxStateAddress> keyAddress = it->first;
    const std::set<ref<TxStateAddress> > &addresses =
        it->second->getLocations();
    if (addresses.size() > 0) {
      std::map<ref<TxStateAddress>, ref<TxStateValue> >::iterator it1;
      for (std::set<ref<TxStateAddress> >::const_iterator
               it2 = addresses.begin(),
               ie2 = addresses.end();
           it2 != ie2; ++it2) {
        it1 = simpleStore.find(*it2);
        if (it1 != simpleStore.end()) {
          addressToBeReplaced.insert(*it2);
          // Found the address in the map;
          _concreteStore[keyAddress->copyWithIndirectionCountIncrement()] =
              it1->second;
          break;
        }
      }
    }
  }

  std::set<ref<TxStateAddress> >::iterator addressesToRemoveEnd =
      addressToBeReplaced.end();

  // FIXME: Perhaps it is more efficient to iterate on
  // Dependency::concretelyAddressedStoreKeys earlier.
  for (std::vector<ref<TxStateAddress> >::const_reverse_iterator
           it = concretelyAddressedStoreKeys.rbegin(),
           ie = concretelyAddressedStoreKeys.rend();
       it != ie; ++it) {
    std::map<ref<TxStateAddress>, ref<TxStateValue> >::iterator it1 =
        simpleStore.find(*it);
    if (it1 != simpleStore.end() &&
        addressToBeReplaced.find(it1->first) == addressesToRemoveEnd) {
      const llvm::Value *base = it1->first->getValue();
      ref<TxInterpolantAddress> address =
          it1->first->getInterpolantStyleAddress();
      std::map<ref<TxInterpolantAddress>, ref<TxInterpolantValue> > &
      addressValueMap = concreteStore[base];
      if (addressValueMap.find(address) == addressValueMap.end()) {
        ref<TxInterpolantValue> storedValue;
#ifdef ENABLE_Z3
        if (coreOnly && !NoExistential) {
          storedValue = it1->second->getInterpolantStyleValue(replacements);
        } else {
          storedValue = it1->second->getInterpolantStyleValue();
        }
#else
        storedValue = it1->second->getInterpolantStyleValue();
#endif
        addressValueMap[address] = storedValue;
      }
    }

    for (std::map<ref<TxStateAddress>, ref<TxStateValue> >::iterator
             it1 = _concreteStore.begin(),
             ie1 = _concreteStore.end();
         it1 != ie1; ++it1) {
      const llvm::Value *base = it1->first->getValue();
      ref<TxInterpolantAddress> address =
          it1->first->getInterpolantStyleAddress();
      std::map<ref<TxInterpolantAddress>, ref<TxInterpolantValue> > &
      addressValueMap = concreteStore[base];
      if (addressValueMap.find(address) == addressValueMap.end()) {
        ref<TxInterpolantValue> storedValue;
#ifdef ENABLE_Z3
        if (coreOnly && !NoExistential) {
          storedValue = it1->second->getInterpolantStyleValue(replacements);
        } else {
          storedValue = it1->second->getInterpolantStyleValue();
        }
#else
        storedValue = it1->second->getInterpolantStyleValue();
#endif
        addressValueMap[address] = storedValue;
      }
    }
  }
}

void TxStore::getConcreteStore(
    const std::vector<llvm::Instruction *> &callHistory,
    const std::map<ref<TxStateAddress>,
                   std::pair<ref<TxStateValue>, ref<TxStateValue> > > &store,
    const std::vector<ref<TxStateAddress> > &orderedStoreKeys,
    std::set<const Array *> &replacements, bool coreOnly,
    TopInterpolantStore &concreteStore) const {
  std::map<ref<TxStateAddress>, ref<TxStateValue> > _concreteStore;

  std::map<ref<TxStateValue>, uint64_t> useCount;

  for (std::map<
           ref<TxStateAddress>,
           std::pair<ref<TxStateValue>, ref<TxStateValue> > >::const_iterator
           it = store.begin(),
           ie = store.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;

    if (it->second.second.isNull())
      continue;

    _concreteStore[it->first] = it->second.second;
    if (coreOnly && it->second.second->isCore()) {
      // An address is in the core if it stores a value that is in the core
      useCount[it->second.second] = it->second.second->getDirectUseCount();
    }
  }

  if (coreOnly) {
    std::map<ref<TxStateAddress>, ref<TxStateValue> > __concreteStore;

    //    llvm::errs() << "STEP0:\n";
    //    for (std::map<ref<TxStateAddress>, ref<TxStateValue> >::iterator
    //             it = _concreteStore.begin(),
    //             ie = _concreteStore.end();
    //         it != ie; ++it) {
    //      llvm::errs() << "-----------------------------\n";
    //      it->first->dump();
    //      it->second->dump();
    //    }

    // The following performs computation of values that are dominated by other
    // values, wrt. flow to the interpolant / unsat core.
    for (std::map<ref<TxStateValue>, uint64_t>::iterator it = useCount.begin(),
                                                         ie = useCount.end();
         it != ie; ++it) {
      std::map<ref<TxStateValue>, uint64_t>::iterator mapIter;
      const std::map<ref<TxStateValue>, ref<TxStateAddress> > &sources =
          it->first->getSources();
      for (std::map<ref<TxStateValue>, ref<TxStateAddress> >::const_iterator
               it1 = sources.begin(),
               ie1 = sources.end();
           it1 != ie1; ++it1) {
        mapIter = useCount.find(it1->first);
        if (mapIter != useCount.end() && mapIter->second > 0)
          --(mapIter->second);
      }
    }

    // Copy only values whose use count not reduced to zero
    for (std::map<ref<TxStateAddress>, ref<TxStateValue> >::iterator
             it = _concreteStore.begin(),
             ie = _concreteStore.end();
         it != ie; ++it) {
      std::map<ref<TxStateValue>, uint64_t>::iterator it1 =
          useCount.find(it->second);
      if (it1 != useCount.end() && it1->second > 0)
        __concreteStore[it->first] = it->second;
    }

    //    llvm::errs() << "STEP1:\n";
    //    for (std::map<ref<TxStateAddress>, ref<TxStateValue> >::iterator
    //             it = __concreteStore.begin(),
    //             ie = __concreteStore.end();
    //         it != ie; ++it) {
    //      llvm::errs() << "-----------------------------\n";
    //      it->first->dump();
    //      it->second->dump();
    //    }

    removeAddressValue(__concreteStore, concreteStore, replacements, true);

    //    llvm::errs() << "AFTER:\n";
    //    for (Dependency::InterpolantStore::iterator it =
    // concreteStore.begin(),
    //                                                ie = concreteStore.end();
    //         it != ie; ++it) {
    //      std::map<ref<TxInterpolantAddress>, ref<TxInterpolantValue> >
    //      addressValueMap = it->second;
    //      for (std::map<ref<TxInterpolantAddress>,
    //                    ref<TxInterpolantValue> >::iterator
    //               it1 = addressValueMap.begin(),
    //               ie1 = addressValueMap.end();
    //           it1 != ie1; ++it1) {
    //        llvm::errs() << "-----------------------------\n";
    //        it1->first->dump();
    //        it1->second->dump();
    //      }
    //    }
  } else {
    removeAddressValue(_concreteStore, concreteStore, replacements, false);
  }
}

void TxStore::getSymbolicStore(
    const std::vector<llvm::Instruction *> &callHistory,
    const std::map<ref<TxStateAddress>,
                   std::pair<ref<TxStateValue>, ref<TxStateValue> > > &store,
    const std::vector<ref<TxStateAddress> > &orderedStoreKeys,
    std::set<const Array *> &replacements, bool coreOnly,
    TopInterpolantStore &symbolicStore) const {
  for (std::vector<ref<TxStateAddress> >::const_reverse_iterator
           it = orderedStoreKeys.rbegin(),
           ie = orderedStoreKeys.rend();
       it != ie; ++it) {
    std::map<ref<TxStateAddress>,
             std::pair<ref<TxStateValue>, ref<TxStateValue> > >::const_iterator
    it1 = store.find(*it);
    if (it1 == store.end())
      continue;

    if (!it1->first->contextIsPrefixOf(callHistory))
      continue;

    if (it1->second.second.isNull())
      continue;

    if (!coreOnly) {
      const llvm::Value *base = it1->first->getContext()->getValue();
      ref<TxInterpolantAddress> address =
          it1->first->getInterpolantStyleAddress();
      std::map<ref<TxInterpolantAddress>, ref<TxInterpolantValue> > &
      addressValueMap = symbolicStore[base];
      if (addressValueMap.find(address) == addressValueMap.end()) {
        addressValueMap[address] =
            it1->second.second->getInterpolantStyleValue();
      }
    } else if (it1->second.second->isCore()) {
      // An address is in the core if it stores a value that is in the core
      const llvm::Value *base = it1->first->getContext()->getValue();
      ref<TxInterpolantAddress> address =
          it1->first->getInterpolantStyleAddress();
      std::map<ref<TxInterpolantAddress>, ref<TxInterpolantValue> > &
      addressValueMap = symbolicStore[base];
      if (addressValueMap.find(address) == addressValueMap.end()) {
#ifdef ENABLE_Z3
        if (!NoExistential) {
          address = TxStateAddress::create(it1->first, replacements)
                        ->getInterpolantStyleAddress();
          addressValueMap[address] =
              it1->second.second->getInterpolantStyleValue(replacements);
        } else
#endif
          addressValueMap[address] =
              it1->second.second->getInterpolantStyleValue();
      }
    }
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
  if (loc->hasConstantAddress()) {
    concretelyAddressedStore[loc] =
        std::pair<ref<TxStateValue>, ref<TxStateValue> >(address, value);
    concretelyAddressedStoreKeys.push_back(loc);
  } else {
    symbolicallyAddressedStore[loc] =
        std::pair<ref<TxStateValue>, ref<TxStateValue> >(address, value);
    symbolicallyAddressedStoreKeys.push_back(loc);
  }
}

/// \brief Print the content of the object to the LLVM error stream
void TxStore::print(llvm::raw_ostream &stream) const { this->print(stream, 0); }

void TxStore::print(llvm::raw_ostream &stream,
                    const unsigned paddingAmount) const {
  std::string tabs = makeTabs(paddingAmount);
  std::string tabsNext = appendTab(tabs);
  std::string tabsNextNext = appendTab(tabsNext);

  if (concretelyAddressedStore.empty()) {
    stream << tabs << "concrete store = []\n";
  } else {
    stream << tabs << "concrete store = [\n";
    for (std::map<
             ref<TxStateAddress>,
             std::pair<ref<TxStateValue>, ref<TxStateValue> > >::const_iterator
             is = concretelyAddressedStore.begin(),
             ie = concretelyAddressedStore.end(), it = is;
         it != ie; ++it) {
      if (it != is)
        stream << tabsNext << "------------------------------------------\n";
      stream << tabsNext << "address:\n";
      it->first->print(stream, tabsNextNext);
      stream << "\n";
      stream << tabsNext << "content:\n";
      it->second.second->print(stream, tabsNextNext);
      stream << "\n";
    }
    stream << tabs << "]\n";
  }

  if (symbolicallyAddressedStore.empty()) {
    stream << tabs << "symbolic store = []\n";
  } else {
    stream << tabs << "symbolic store = [\n";
    for (std::map<
             ref<TxStateAddress>,
             std::pair<ref<TxStateValue>, ref<TxStateValue> > >::const_iterator
             is = symbolicallyAddressedStore.begin(),
             ie = symbolicallyAddressedStore.end(), it = is;
         it != ie; ++it) {
      if (it != is)
        stream << tabsNext << "------------------------------------------\n";
      stream << tabsNext << "address:\n";
      it->first->print(stream, tabsNextNext);
      stream << "\n";
      stream << tabsNext << "content:\n";
      it->second.second->print(stream, tabsNextNext);
      stream << "\n";
    }
    stream << "]\n";
  }
}
}
