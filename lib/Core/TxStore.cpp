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

void TxStore::getStoredExpressions(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly,
    TopInterpolantStore &_concretelyAddressedStore,
    TopInterpolantStore &_symbolicallyAddressedStore) {
  getConcreteStore(callHistory, concretelyAddressedStore, replacements,
                   coreOnly, _concretelyAddressedStore);
  getSymbolicStore(callHistory, symbolicallyAddressedStore, replacements,
                   coreOnly, _symbolicallyAddressedStore);
}

void
TxStore::getConcreteStore(const std::vector<llvm::Instruction *> &callHistory,
                          const TopStateStore &store,
                          std::set<const Array *> &replacements, bool coreOnly,
                          TopInterpolantStore &concreteStore) const {
  for (TopStateStore::const_iterator it = store.begin(), ie = store.end();
       it != ie; ++it) {
    if (!it->first->isPrefixOf(callHistory))
      continue;

    if (it->second.empty())
      continue;

    LowerInterpolantStore &map = concreteStore[it->first->getValue()];
    const LowerStateStore &lowerStore = it->second;
    for (LowerStateStore::const_iterator it1 = lowerStore.begin(),
                                         ie1 = lowerStore.end();
         it1 != ie1; ++it1) {
      if (!coreOnly) {
        map[it1->first] = it1->second->getContent()->getInterpolantStyleValue();
      } else if (it1->second->getContent()->isCore()) {
        // An address is in the core if it stores a value that is in the core
#ifdef ENABLE_Z3
        if (!NoExistential) {
          map[it1->first] =
              it1->second->getContent()->getInterpolantStyleValue(replacements);
        } else {
          map[it1->first] =
              it1->second->getContent()->getInterpolantStyleValue();
        }
#else
        map[it1->first] =
            it1->second->getContent()->getInterpolantStyleValue(replacements);
#endif
      }
    }
  }
}

void
TxStore::getSymbolicStore(const std::vector<llvm::Instruction *> &callHistory,
                          const TopStateStore &store,
                          std::set<const Array *> &replacements, bool coreOnly,
                          TopInterpolantStore &symbolicStore) const {
  for (TopStateStore::const_iterator it = store.begin(), ie = store.end();
       it != ie; ++it) {
    if (!it->first->isPrefixOf(callHistory))
      continue;

    if (it->second.empty())
      continue;

    LowerInterpolantStore &map = symbolicStore[it->first->getValue()];
    const LowerStateStore &lowerStore = it->second;
    for (LowerStateStore::const_iterator it1 = lowerStore.begin(),
                                         ie1 = lowerStore.end();
         it1 != ie1; ++it1) {
      if (!coreOnly) {
        map[it1->first] = it1->second->getContent()->getInterpolantStyleValue();
      } else if (it1->second->getContent()->isCore()) {
        // An address is in the core if it stores a value that is in the core
#ifdef ENABLE_Z3
        if (!NoExistential) {
          ref<TxVariable> address = TxStateAddress::create(
              it1->second->getAddress(), replacements)->getAsVariable();
          map[address] =
              it1->second->getContent()->getInterpolantStyleValue(replacements);
        } else {
          map[it1->first] =
              it1->second->getContent()->getInterpolantStyleValue();
        }
#else
        ref<TxVariable> address = TxStateAddress::create(
            it1->second->getAddress(), replacements)->getAsVariable();
        map[address] =
            it1->second->getContent()->getInterpolantStyleValue(replacements);
#endif
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
    concretelyAddressedStore[loc->getContext()][loc->getAsVariable()] =
        ref<TxStoreEntry>(new TxStoreEntry(loc, address, value));
  } else {
    symbolicallyAddressedStore[loc->getContext()][loc->getAsVariable()] =
        ref<TxStoreEntry>(new TxStoreEntry(loc, address, value));
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
    for (TopStateStore::const_iterator topIs = concretelyAddressedStore.begin(),
                                       topIe = concretelyAddressedStore.end(),
                                       topIt = topIs;
         topIt != topIe; ++topIt) {
      for (LowerStateStore::const_iterator lowerIs = topIs->second.begin(),
                                           lowerIe = topIs->second.end(),
                                           lowerIt = lowerIs;
           lowerIt != lowerIe; ++lowerIt) {
        if (topIt != topIs || lowerIt != lowerIs)
          stream << tabsNext << "------------------------------------------\n";
        stream << tabsNext << "address:\n";
        lowerIt->second->getAddress()->print(stream, tabsNextNext);
        stream << "\n";
        stream << tabsNext << "content:\n";
        lowerIt->second->getContent()->print(stream, tabsNextNext);
        stream << "\n";
      }
    }
    stream << tabs << "]\n";
  }

  if (symbolicallyAddressedStore.empty()) {
    stream << tabs << "symbolic store = []\n";
  } else {
    stream << tabs << "symbolic store = [\n";
    for (TopStateStore::const_iterator
             topIs = symbolicallyAddressedStore.begin(),
             topIe = symbolicallyAddressedStore.end(), topIt = topIs;
         topIt != topIe; ++topIt) {
      for (LowerStateStore::const_iterator lowerIs = topIt->second.begin(),
                                           lowerIe = topIt->second.end(),
                                           lowerIt = lowerIs;
           lowerIt != lowerIe; ++lowerIt) {
        if (topIt != topIs || lowerIt != lowerIs)
          stream << tabsNext << "------------------------------------------\n";
        stream << tabsNext << "address:\n";
        lowerIt->second->getAddress()->print(stream, tabsNextNext);
        stream << "\n";
        stream << tabsNext << "content:\n";
        lowerIt->second->getContent()->print(stream, tabsNextNext);
        stream << "\n";
      }
    }
    stream << "]\n";
  }
}
}
