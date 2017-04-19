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

void GlobalStoreFrame::updateStore(ref<MemoryLocation> loc,
                                   ref<VersionedValue> address,
                                   ref<VersionedValue> value) {
  // We copy the store to update on demand, only when this function is invoked
  if (source) {
    concretelyAddressedStore = source->concretelyAddressedStore;
    symbolicallyAddressedStore = source->symbolicallyAddressedStore;
    source = 0;
  }

  if (loc->hasConstantAddress()) {
    concretelyAddressedStore[loc->getStoredAddress()] =
        std::pair<ref<VersionedValue>, ref<VersionedValue> >(address, value);
  } else {
    symbolicallyAddressedStore[loc->getStoredAddress()] =
        std::pair<ref<VersionedValue>, ref<VersionedValue> >(address, value);
  }
}

std::pair<ref<VersionedValue>, ref<VersionedValue> >
GlobalStoreFrame::read(ref<MemoryLocation> loc) {
  std::map<
      ref<StoredAddress>,
      std::pair<ref<VersionedValue>, ref<VersionedValue> > >::const_iterator it;

  if (loc->hasConstantAddress()) {
    const std::map<ref<StoredAddress>,
                   std::pair<ref<VersionedValue>, ref<VersionedValue> > > &
    concreteStore =
        (source ? source->concretelyAddressedStore : concretelyAddressedStore);
    it = concreteStore.find(loc->getStoredAddress());
    if (it != concreteStore.end())
      return it->second;
  } else {
    const std::map<ref<StoredAddress>,
                   std::pair<ref<VersionedValue>, ref<VersionedValue> > > &
    symbolicStore = (source ? source->symbolicallyAddressedStore
                            : symbolicallyAddressedStore);
    it = symbolicStore.find(loc->getStoredAddress());
    // FIXME: Here we assume that the expressions have to exactly be the
    // same expression object. More properly, this should instead add an
    // ite constraint onto the path condition.
    if (it != symbolicStore.end())
      return it->second;
  }

  std::pair<ref<VersionedValue>, ref<VersionedValue> > dummyReturnValue;
  return dummyReturnValue;
}

void GlobalStoreFrame::getConcreteStore(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly,
    TxConcreteStore &concreteStore) const {
  const std::map<ref<StoredAddress>,
                 std::pair<ref<VersionedValue>, ref<VersionedValue> > > &store =
      (source ? source->concretelyAddressedStore : concretelyAddressedStore);

  for (std::map<ref<StoredAddress>,
                std::pair<ref<VersionedValue>,
                          ref<VersionedValue> > >::const_iterator
           it = store.begin(),
           ie = store.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;

    if (it->second.second.isNull())
      continue;

    if (!coreOnly) {
      const llvm::Value *base = it->first->getContext()->getValue();
      concreteStore[base][it->first] = StoredValue::create(it->second.second);
    } else if (it->second.second->isCore()) {
      // An address is in the core if it stores a value that is in the core
      const llvm::Value *base = it->first->getContext()->getValue();
#ifdef ENABLE_Z3
      if (!NoExistential) {
        concreteStore[base][it->first] =
            StoredValue::create(it->second.second, replacements);
      } else
#endif
        concreteStore[base][it->first] = StoredValue::create(it->second.second);
    }
  }
}

void GlobalStoreFrame::getSymbolicStore(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly,
    TxSymbolicStore &symbolicStore) const {
  const std::map<ref<StoredAddress>,
                 std::pair<ref<VersionedValue>, ref<VersionedValue> > > &store =
      (source ? source->symbolicallyAddressedStore
              : symbolicallyAddressedStore);

  for (std::map<ref<StoredAddress>,
                std::pair<ref<VersionedValue>,
                          ref<VersionedValue> > >::const_iterator
           it = store.begin(),
           ie = store.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;

    if (it->second.second.isNull())
      continue;

    if (!coreOnly) {
      llvm::Value *base = it->first->getContext()->getValue();
      symbolicStore[base].push_back(TxAddressValuePair(
          it->first, StoredValue::create(it->second.second)));
    } else if (it->second.second->isCore()) {
      // An address is in the core if it stores a value that is in the core
      llvm::Value *base = it->first->getContext()->getValue();
#ifdef ENABLE_Z3
      if (!NoExistential) {
        symbolicStore[base].push_back(TxAddressValuePair(
            it->first->copyWithNewVariables(replacements),
            StoredValue::create(it->second.second, replacements)));
      } else
#endif
        symbolicStore[base].push_back(TxAddressValuePair(
            it->first, StoredValue::create(it->second.second)));
    }
  }
}

void GlobalStoreFrame::print(llvm::raw_ostream &stream,
                             const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);
  std::string tabsNextNext = appendTab(tabsNext);

  const std::map<ref<StoredAddress>,
                 std::pair<ref<VersionedValue>, ref<VersionedValue> > > &
  concreteStore =
      (source ? source->concretelyAddressedStore : concretelyAddressedStore);

  const std::map<ref<StoredAddress>,
                 std::pair<ref<VersionedValue>, ref<VersionedValue> > > &
  symbolicStore = (source ? source->symbolicallyAddressedStore
                          : symbolicallyAddressedStore);

  if (concreteStore.empty()) {
    stream << prefix << "concrete store = []\n";
  } else {
    stream << prefix << "concrete store = [\n";
    for (std::map<ref<StoredAddress>,
                  std::pair<ref<VersionedValue>,
                            ref<VersionedValue> > >::const_iterator
             is = concreteStore.begin(),
             ie = concreteStore.end(), it = is;
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

  if (symbolicStore.empty()) {
    stream << prefix << "symbolic store = []\n";
  } else {
    stream << prefix << "symbolic store = [\n";
    for (std::map<ref<StoredAddress>,
                  std::pair<ref<VersionedValue>,
                            ref<VersionedValue> > >::const_iterator
             is = symbolicStore.begin(),
             ie = symbolicStore.end(), it = is;
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

/**/

void HeapStoreFrame::updateStore(ref<MemoryLocation> loc,
                                 ref<VersionedValue> address,
                                 ref<VersionedValue> value) {
  // We copy the store to update on demand, only when this function is invoked
  if (source) {
    concretelyAddressedStore = source->concretelyAddressedStore;
    symbolicallyAddressedStore = source->symbolicallyAddressedStore;
    source = 0;
  }

  if (loc->hasConstantAddress()) {
    concretelyAddressedStore[loc] =
        std::pair<ref<VersionedValue>, ref<VersionedValue> >(address, value);
  } else {
    symbolicallyAddressedStore[loc] =
        std::pair<ref<VersionedValue>, ref<VersionedValue> >(address, value);
  }
}

std::pair<ref<VersionedValue>, ref<VersionedValue> >
HeapStoreFrame::read(ref<MemoryLocation> loc) {
  std::map<
      ref<MemoryLocation>,
      std::pair<ref<VersionedValue>, ref<VersionedValue> > >::const_iterator it;

  if (loc->hasConstantAddress()) {
    const std::map<ref<MemoryLocation>,
                   std::pair<ref<VersionedValue>, ref<VersionedValue> > > &
    concreteStore =
        (source ? source->concretelyAddressedStore : concretelyAddressedStore);
    it = concreteStore.find(loc);
    if (it != concreteStore.end())
      return it->second;
  } else {
    const std::map<ref<MemoryLocation>,
                   std::pair<ref<VersionedValue>, ref<VersionedValue> > > &
    symbolicStore = (source ? source->symbolicallyAddressedStore
                            : symbolicallyAddressedStore);
    it = symbolicStore.find(loc);
    // FIXME: Here we assume that the expressions have to exactly be the
    // same expression object. More properly, this should instead add an
    // ite constraint onto the path condition.
    if (it != symbolicStore.end())
      return it->second;
  }

  std::pair<ref<VersionedValue>, ref<VersionedValue> > dummyReturnValue;
  return dummyReturnValue;
}

void HeapStoreFrame::getConcreteStore(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly,
    TxConcreteStore &concreteStore) const {
  const std::map<ref<MemoryLocation>,
                 std::pair<ref<VersionedValue>, ref<VersionedValue> > > &store =
      (source ? source->concretelyAddressedStore : concretelyAddressedStore);

  for (std::map<ref<MemoryLocation>,
                std::pair<ref<VersionedValue>,
                          ref<VersionedValue> > >::const_iterator
           it = store.begin(),
           ie = store.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;

    if (it->second.second.isNull())
      continue;

    if (!coreOnly) {
      const llvm::Value *base = it->first->getContext()->getValue();
      concreteStore[base][it->first->getStoredAddress()] =
          StoredValue::create(it->second.second);
    } else if (it->second.second->isCore()) {
      // An address is in the core if it stores a value that is in the core
      const llvm::Value *base = it->first->getContext()->getValue();
#ifdef ENABLE_Z3
      if (!NoExistential) {
        concreteStore[base][it->first->getStoredAddress()] =
            StoredValue::create(it->second.second, replacements);
      } else
#endif
        concreteStore[base][it->first->getStoredAddress()] =
            StoredValue::create(it->second.second);
    }
  }
}

void HeapStoreFrame::getSymbolicStore(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly,
    TxSymbolicStore &symbolicStore) const {
  const std::map<ref<MemoryLocation>,
                 std::pair<ref<VersionedValue>, ref<VersionedValue> > > &store =
      (source ? source->symbolicallyAddressedStore
              : symbolicallyAddressedStore);

  for (std::map<ref<MemoryLocation>,
                std::pair<ref<VersionedValue>,
                          ref<VersionedValue> > >::const_iterator
           it = store.begin(),
           ie = store.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;

    if (it->second.second.isNull())
      continue;

    if (!coreOnly) {
      llvm::Value *base = it->first->getContext()->getValue();
      symbolicStore[base].push_back(
          TxAddressValuePair(it->first->getStoredAddress(),
                             StoredValue::create(it->second.second)));
    } else if (it->second.second->isCore()) {
      // An address is in the core if it stores a value that is in the core
      llvm::Value *base = it->first->getContext()->getValue();
#ifdef ENABLE_Z3
      if (!NoExistential) {
        symbolicStore[base].push_back(TxAddressValuePair(
            it->first->getStoredAddress(replacements),
            StoredValue::create(it->second.second, replacements)));
      } else
#endif
        symbolicStore[base].push_back(
            TxAddressValuePair(it->first->getStoredAddress(),
                               StoredValue::create(it->second.second)));
    }
  }
}

void HeapStoreFrame::print(llvm::raw_ostream &stream,
                           const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);
  std::string tabsNextNext = appendTab(tabsNext);

  const std::map<ref<MemoryLocation>,
                 std::pair<ref<VersionedValue>, ref<VersionedValue> > > &
  concreteStore =
      (source ? source->concretelyAddressedStore : concretelyAddressedStore);

  const std::map<ref<MemoryLocation>,
                 std::pair<ref<VersionedValue>, ref<VersionedValue> > > &
  symbolicStore = (source ? source->symbolicallyAddressedStore
                          : symbolicallyAddressedStore);

  if (concreteStore.empty()) {
    stream << prefix << "concrete store = []\n";
  } else {
    stream << prefix << "concrete store = [\n";
    for (std::map<ref<MemoryLocation>,
                  std::pair<ref<VersionedValue>,
                            ref<VersionedValue> > >::const_iterator
             is = concreteStore.begin(),
             ie = concreteStore.end(), it = is;
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

  if (symbolicStore.empty()) {
    stream << prefix << "symbolic store = []\n";
  } else {
    stream << prefix << "symbolic store = [\n";
    for (std::map<ref<MemoryLocation>,
                  std::pair<ref<VersionedValue>,
                            ref<VersionedValue> > >::const_iterator
             is = symbolicStore.begin(),
             ie = symbolicStore.end(), it = is;
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

/**/

StackStoreFrame *StackStoreFrame::findFrame(const ref<MemoryLocation> loc) {
  std::vector<llvm::Instruction *> callHistory =
      loc->getContext()->getCallHistory();
  const uint64_t historyHeight = callHistory.size();

  if (height < historyHeight)
    return 0;

  StackStoreFrame *current = this;
  for (uint64_t i = height; i > historyHeight; --i) {
    current = current->parent;
  }

  // Strictly speaking, we need to check that all elements match, but here we
  // just do a quick check that the top callsites match.
  if (current->callsite == 0 && callHistory.empty())
    return current;

  if (current->callsite == callHistory.back())
    return current;

  return 0;
}

void StackStoreFrame::updateStore(ref<MemoryLocation> loc,
                                  ref<VersionedValue> address,
                                  ref<VersionedValue> value) {
  assert(loc->getContext()->ty == AllocationContext::LOCAL &&
         "location should not be global");

  StackStoreFrame *frame = findFrame(loc);

  assert(frame && "frame not found");

  // We copy the store to update on demand, only when this function is invoked
  if (frame->source) {
    frame->concretelyAddressedStore = frame->source->concretelyAddressedStore;
    frame->symbolicallyAddressedStore =
        frame->source->symbolicallyAddressedStore;
    frame->source = 0;
  }

  if (loc->hasConstantAddress()) {
    (frame->concretelyAddressedStore)[loc] =
        std::pair<ref<VersionedValue>, ref<VersionedValue> >(address, value);
  } else {
    (frame->symbolicallyAddressedStore)[loc] =
        std::pair<ref<VersionedValue>, ref<VersionedValue> >(address, value);
  }
}

std::pair<ref<VersionedValue>, ref<VersionedValue> >
StackStoreFrame::read(ref<MemoryLocation> loc) {
  std::map<
      ref<MemoryLocation>,
      std::pair<ref<VersionedValue>, ref<VersionedValue> > >::const_iterator it;

  assert(loc->getContext()->ty == AllocationContext::LOCAL &&
         "location should not be global");

  StackStoreFrame *frame = findFrame(loc);

  assert(frame && "frame not found");

  if (loc->hasConstantAddress()) {
    const std::map<ref<MemoryLocation>,
                   std::pair<ref<VersionedValue>, ref<VersionedValue> > > &
    concreteStore = (frame->source ? frame->source->concretelyAddressedStore
                                   : frame->concretelyAddressedStore);
    it = concreteStore.find(loc);
    if (it != concreteStore.end())
      return it->second;
  } else {
    const std::map<ref<MemoryLocation>,
                   std::pair<ref<VersionedValue>, ref<VersionedValue> > > &
    symbolicStore = (frame->source ? frame->source->symbolicallyAddressedStore
                                   : frame->symbolicallyAddressedStore);
    it = symbolicStore.find(loc);
    // FIXME: Here we assume that the expressions have to exactly be the
    // same expression object. More properly, this should instead add an
    // ite constraint onto the path condition.
    if (it != symbolicStore.end())
      return it->second;
  }

  std::pair<ref<VersionedValue>, ref<VersionedValue> > dummyReturnValue;
  return dummyReturnValue;
}

void StackStoreFrame::getConcreteStore(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly,
    TxConcreteStore &concreteStore) const {
  const std::map<ref<MemoryLocation>,
                 std::pair<ref<VersionedValue>, ref<VersionedValue> > > &store =
      (source ? source->concretelyAddressedStore : concretelyAddressedStore);

  for (std::map<ref<MemoryLocation>,
                std::pair<ref<VersionedValue>,
                          ref<VersionedValue> > >::const_iterator
           it = store.begin(),
           ie = store.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;

    if (it->second.second.isNull())
      continue;

    if (!coreOnly) {
      const llvm::Value *base = it->first->getContext()->getValue();
      concreteStore[base][it->first->getStoredAddress()] =
          StoredValue::create(it->second.second);
    } else if (it->second.second->isCore()) {
      // An address is in the core if it stores a value that is in the core
      const llvm::Value *base = it->first->getContext()->getValue();
#ifdef ENABLE_Z3
      if (!NoExistential) {
        concreteStore[base][it->first->getStoredAddress()] =
            StoredValue::create(it->second.second, replacements);
      } else
#endif
        concreteStore[base][it->first->getStoredAddress()] =
            StoredValue::create(it->second.second);
    }
  }
}

void StackStoreFrame::getSymbolicStore(
    const std::vector<llvm::Instruction *> &callHistory,
    std::set<const Array *> &replacements, bool coreOnly,
    TxSymbolicStore &symbolicStore) const {
  const std::map<ref<MemoryLocation>,
                 std::pair<ref<VersionedValue>, ref<VersionedValue> > > &store =
      (source ? source->symbolicallyAddressedStore
              : symbolicallyAddressedStore);

  for (std::map<ref<MemoryLocation>,
                std::pair<ref<VersionedValue>,
                          ref<VersionedValue> > >::const_iterator
           it = store.begin(),
           ie = store.end();
       it != ie; ++it) {
    if (!it->first->contextIsPrefixOf(callHistory))
      continue;

    if (it->second.second.isNull())
      continue;

    if (!coreOnly) {
      llvm::Value *base = it->first->getContext()->getValue();
      symbolicStore[base].push_back(
          TxAddressValuePair(it->first->getStoredAddress(),
                             StoredValue::create(it->second.second)));
    } else if (it->second.second->isCore()) {
      // An address is in the core if it stores a value that is in the core
      llvm::Value *base = it->first->getContext()->getValue();
#ifdef ENABLE_Z3
      if (!NoExistential) {
        symbolicStore[base].push_back(TxAddressValuePair(
            it->first->getStoredAddress(replacements),
            StoredValue::create(it->second.second, replacements)));
      } else
#endif
        symbolicStore[base].push_back(
            TxAddressValuePair(it->first->getStoredAddress(),
                               StoredValue::create(it->second.second)));
    }
  }
}

void StackStoreFrame::print(llvm::raw_ostream &stream,
                            const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);
  std::string tabsNextNext = appendTab(tabsNext);

  const std::map<ref<MemoryLocation>,
                 std::pair<ref<VersionedValue>, ref<VersionedValue> > > &
  concreteStore =
      (source ? source->concretelyAddressedStore : concretelyAddressedStore);

  const std::map<ref<MemoryLocation>,
                 std::pair<ref<VersionedValue>, ref<VersionedValue> > > &
  symbolicStore = (source ? source->symbolicallyAddressedStore
                          : symbolicallyAddressedStore);

  if (concreteStore.empty()) {
    stream << prefix << "concrete store = []\n";
  } else {
    stream << prefix << "concrete store = [\n";
    for (std::map<ref<MemoryLocation>,
                  std::pair<ref<VersionedValue>,
                            ref<VersionedValue> > >::const_iterator
             is = concreteStore.begin(),
             ie = concreteStore.end(), it = is;
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

  if (symbolicStore.empty()) {
    stream << prefix << "symbolic store = []\n";
  } else {
    stream << prefix << "symbolic store = [\n";
    for (std::map<ref<MemoryLocation>,
                  std::pair<ref<VersionedValue>,
                            ref<VersionedValue> > >::const_iterator
             is = symbolicStore.begin(),
             ie = symbolicStore.end(), it = is;
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
