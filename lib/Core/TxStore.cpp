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

void TxStore::getConcreteStore(
    const std::vector<llvm::Instruction *> &callHistory,
    const StateStore &store,
    std::set<const Array *> &replacements, bool coreOnly,
    TopInterpolantStore &concreteStore) const {
  for (StateStore::const_iterator it = store.begin(), ie = store.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;

    if (it->second.isNull())
      continue;

    if (!coreOnly) {
      LowerInterpolantStore &map =
          concreteStore[it->first->getContext()->getValue()];
      map[it->first] = it->second->getContent()->getInterpolantStyleValue();
    } else if (it->second->getContent()->isCore()) {
      // An address is in the core if it stores a value that is in the core
      LowerInterpolantStore &map =
          concreteStore[it->first->getContext()->getValue()];
#ifdef ENABLE_Z3
      if (!NoExistential) {
        map[it->first] =
            it->second->getContent()->getInterpolantStyleValue(replacements);
      } else {
        map[it->first] = it->second->getContent()->getInterpolantStyleValue();
      }
#else
      map[it->first] =
          it->second->second->getContent()->getInterpolantStyleValue(
              replacements);
#endif
    }
  }
}

void TxStore::getSymbolicStore(
    const std::vector<llvm::Instruction *> &callHistory,
    const StateStore &store,
    std::set<const Array *> &replacements, bool coreOnly,
    TopInterpolantStore &symbolicStore) const {
  for (StateStore::const_iterator it = store.begin(), ie = store.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;

    if (it->second.isNull())
      continue;

    if (!coreOnly) {
      LowerInterpolantStore &map =
          symbolicStore[it->first->getContext()->getValue()];
      map[it->first] = it->second->getContent()->getInterpolantStyleValue();
    } else if (it->second->getContent()->isCore()) {
      // An address is in the core if it stores a value that is in the core
      LowerInterpolantStore &map =
          symbolicStore[it->first->getContext()->getValue()];
#ifdef ENABLE_Z3
      if (!NoExistential) {
        ref<TxInterpolantAddress> address =
            TxStateAddress::create(it->second->getAddress(), replacements)
                ->getInterpolantStyleAddress();
        map[address] =
            it->second->getContent()->getInterpolantStyleValue(replacements);
      } else {
        map[it->first] = it->second->getContent()->getInterpolantStyleValue();
      }
#else
      map[it->first] = it->second->getContent()->getInterpolantStyleValue();
#endif
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
    concretelyAddressedStore[loc->getInterpolantStyleAddress()] =
        ref<TxStoreEntry>(new TxStoreEntry(loc, address, value));
  } else {
    symbolicallyAddressedStore[loc->getInterpolantStyleAddress()] =
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
    for (StateStore::const_iterator is = concretelyAddressedStore.begin(),
                                    ie = concretelyAddressedStore.end(),
                                    it = is;
         it != ie; ++it) {
      if (it != is)
        stream << tabsNext << "------------------------------------------\n";
      stream << tabsNext << "address:\n";
      it->second->getAddress()->print(stream, tabsNextNext);
      stream << "\n";
      stream << tabsNext << "content:\n";
      it->second->getContent()->print(stream, tabsNextNext);
      stream << "\n";
    }
    stream << tabs << "]\n";
  }

  if (symbolicallyAddressedStore.empty()) {
    stream << tabs << "symbolic store = []\n";
  } else {
    stream << tabs << "symbolic store = [\n";
    for (StateStore::const_iterator is = symbolicallyAddressedStore.begin(),
                                    ie = symbolicallyAddressedStore.end(),
                                    it = is;
         it != ie; ++it) {
      if (it != is)
        stream << tabsNext << "------------------------------------------\n";
      stream << tabsNext << "address:\n";
      it->second->getAddress()->print(stream, tabsNextNext);
      stream << "\n";
      stream << tabsNext << "content:\n";
      it->second->getContent()->print(stream, tabsNextNext);
      stream << "\n";
    }
    stream << "]\n";
  }
}
}
