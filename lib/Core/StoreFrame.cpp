//===-- StoreFrame.cpp ------------------------------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "StoreFrame.h"
#include "TxPrintUtil.h"

#include "klee/CommandLine.h"

using namespace klee;

namespace klee {

std::pair<bool, std::map<ref<MemoryLocation>,
                         std::pair<ref<VersionedValue>,
                                   ref<VersionedValue> > >::const_iterator>
StoreFrame::findInConcreteStore(ref<MemoryLocation> loc) const {
  std::pair<bool, std::map<ref<MemoryLocation>,
                           std::pair<ref<VersionedValue>,
                                     ref<VersionedValue> > >::const_iterator>
  ret;
  ret.second = concretelyAddressedStore.find(loc);
  ret.first = (ret.second != concretelyAddressedStore.end());
  return ret;
}

std::pair<bool, std::map<ref<MemoryLocation>,
                         std::pair<ref<VersionedValue>,
                                   ref<VersionedValue> > >::const_iterator>
StoreFrame::findInSymbolicStore(ref<MemoryLocation> loc) const {
  std::pair<bool, std::map<ref<MemoryLocation>,
                           std::pair<ref<VersionedValue>,
                                     ref<VersionedValue> > >::const_iterator>
  ret;
  ret.second = symbolicallyAddressedStore.find(loc);
  ret.first = (ret.second != symbolicallyAddressedStore.end());
  return ret;
}

void StoreFrame::getConcreteStore(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly,
    TxConcreteStore &concreteStore) const {

  for (std::map<ref<MemoryLocation>,
                std::pair<ref<VersionedValue>,
                          ref<VersionedValue> > >::const_iterator
           it = concretelyAddressedStore.begin(),
           ie = concretelyAddressedStore.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;
    if (it->second.second.isNull())
      continue;

    if (!coreOnly) {
      const llvm::Value *base = it->first->getContext()->getValue();
      concreteStore[base][StoredAddress::create(it->first)] =
          StoredValue::create(it->second.second);
    } else if (it->second.second->isCore()) {
      // An address is in the core if it stores a value that is in the core
      const llvm::Value *base = it->first->getContext()->getValue();
#ifdef ENABLE_Z3
      if (!NoExistential) {
        concreteStore[base][StoredAddress::create(it->first)] =
            StoredValue::create(it->second.second, replacements);
      } else
#endif
        concreteStore[base][StoredAddress::create(it->first)] =
            StoredValue::create(it->second.second);
    }
  }
}

void StoreFrame::getSymbolicStore(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly,
    TxSymbolicStore &symbolicStore) const {
  for (std::map<ref<MemoryLocation>,
                std::pair<ref<VersionedValue>,
                          ref<VersionedValue> > >::const_iterator
           it = symbolicallyAddressedStore.begin(),
           ie = symbolicallyAddressedStore.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;

    if (it->second.second.isNull())
      continue;

    if (!coreOnly) {
      llvm::Value *base = it->first->getContext()->getValue();
      symbolicStore[base].push_back(
          TxAddressValuePair(StoredAddress::create(it->first),
                             StoredValue::create(it->second.second)));
    } else if (it->second.second->isCore()) {
      // An address is in the core if it stores a value that is in the core
      llvm::Value *base = it->first->getContext()->getValue();
#ifdef ENABLE_Z3
      if (!NoExistential) {
        symbolicStore[base].push_back(TxAddressValuePair(
            StoredAddress::create(
                MemoryLocation::create(it->first, replacements)),
            StoredValue::create(it->second.second, replacements)));
      } else
#endif
        symbolicStore[base].push_back(
            TxAddressValuePair(StoredAddress::create(it->first),
                               StoredValue::create(it->second.second)));
    }
  }
}

void StoreFrame::print(llvm::raw_ostream &stream,
                       const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);
  std::string tabsNextNext = appendTab(tabsNext);

  if (concretelyAddressedStore.empty()) {
    stream << prefix << "concrete store = []\n";
  } else {
    stream << prefix << "concrete store = [\n";
    for (std::map<ref<MemoryLocation>,
                  std::pair<ref<VersionedValue>,
                            ref<VersionedValue> > >::const_iterator
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
    stream << prefix << "]\n";
  }

  if (symbolicallyAddressedStore.empty()) {
    stream << prefix << "symbolic store = []\n";
  } else {
    stream << prefix << "symbolic store = [\n";
    for (std::map<ref<MemoryLocation>,
                  std::pair<ref<VersionedValue>,
                            ref<VersionedValue> > >::const_iterator
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
