//===-- TxInterpolantTypes.cpp ----------------------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "ShadowArray.h"
#include "TxInterpolantTypes.h"
#include "TxPrintUtil.h"

#include "klee/Internal/Support/ErrorHandling.h"

using namespace klee;

namespace klee {

void StoredValue::init(ref<VersionedValue> vvalue,
                       std::set<const Array *> &replacements,
                       const std::set<std::string> &_coreReasons,
                       bool shadowing) {
  refCount = 0;
  id = reinterpret_cast<uintptr_t>(this);
  expr = shadowing ? ShadowArray::getShadowExpression(vvalue->getExpression(),
                                                      replacements)
                   : vvalue->getExpression();
  value = vvalue->getValue();

  doNotUseBound = !(vvalue->canInterpolateBound());

  coreReasons = _coreReasons;

  if (doNotUseBound)
    return;

  const std::set<ref<MemoryLocation> > locations(vvalue->getLocations());

  if (!locations.empty()) {
    // Here we compute memory bounds for checking pointer values. The memory
    // bound is the size of the allocation minus the offset; this is the weakest
    // precondition (interpolant) of memory bound checks done by KLEE.
    for (std::set<ref<MemoryLocation> >::const_iterator it = locations.begin(),
                                                        ie = locations.end();
         it != ie; ++it) {
      const llvm::Value *v =
          (*it)->getContext()->getValue(); // The allocation site

      // Concrete bound
      uint64_t concreteBound = (*it)->getConcreteOffsetBound();
      std::set<ref<Expr> > newBounds;

      if (concreteBound > 0)
        allocationBounds[v].insert(Expr::createPointer(concreteBound));

      // Symbolic bounds
      const std::set<ref<Expr> > &bounds = (*it)->getSymbolicOffsetBounds();

      if (shadowing) {
        std::set<ref<Expr> > shadowBounds;
        for (std::set<ref<Expr> >::const_iterator it1 = bounds.begin(),
                                                  ie1 = bounds.end();
             it1 != ie1; ++it1) {
          shadowBounds.insert(
              ShadowArray::getShadowExpression(*it1, replacements));
        }
        if (!shadowBounds.empty()) {
          allocationBounds[v].insert(shadowBounds.begin(), shadowBounds.end());
        }
      } else if (!bounds.empty()) {
        allocationBounds[v].insert(bounds.begin(), bounds.end());
      }

      ref<Expr> offset = shadowing ? ShadowArray::getShadowExpression(
                                         (*it)->getOffset(), replacements)
                                   : (*it)->getOffset();

      // We next build the offsets to be compared against stored allocation
      // offset bounds
      ConstantExpr *oe = llvm::dyn_cast<ConstantExpr>(offset);
      if (oe && !allocationOffsets[v].empty()) {
        // Here we check if smaller offset exists, in which case we replace it
        // with the new offset; as we want the greater offset to possibly
        // violate an offset bound.
        std::set<ref<Expr> > res;
        uint64_t offsetInt = oe->getZExtValue();
        for (std::set<ref<Expr> >::iterator it1 = allocationOffsets[v].begin(),
                                            ie1 = allocationOffsets[v].end();
             it1 != ie1; ++it1) {
          if (ConstantExpr *ce = llvm::dyn_cast<ConstantExpr>(*it1)) {
            uint64_t c = ce->getZExtValue();
            if (offsetInt > c) {
              res.insert(offset);
              continue;
            }
          }
          res.insert(*it1);
        }
        allocationOffsets[v] = res;
      } else {
        allocationOffsets[v].insert(offset);
      }
    }
  }
}

ref<Expr> StoredValue::getBoundsCheck(ref<StoredValue> stateValue,
                                      std::set<ref<Expr> > &bounds,
                                      int debugSubsumptionLevel) const {
  ref<Expr> res;
#ifdef ENABLE_Z3

  // In principle, for a state to be subsumed, the subsuming state must be
  // weaker, which in this case means that it should specify less allocations,
  // so all allocations in the subsuming (this), should be specified by the
  // subsumed (the stateValue argument), and we iterate over allocation of
  // the current object and for each such allocation, retrieve the
  // information from the argument object; in this way resulting in
  // less iterations compared to doing it the other way around.
  bool matchFound = false;
  for (std::map<const llvm::Value *, std::set<ref<Expr> > >::const_iterator
           it = allocationBounds.begin(),
           ie = allocationBounds.end();
       it != ie; ++it) {
    std::set<ref<Expr> > tabledBounds = it->second;
    std::map<const llvm::Value *, std::set<ref<Expr> > >::iterator iter =
        stateValue->allocationOffsets.find(it->first);
    if (iter == stateValue->allocationOffsets.end()) {
      continue;
    }
    matchFound = true;

    std::set<ref<Expr> > stateOffsets = iter->second;

    assert(!tabledBounds.empty() && "tabled bounds empty");

    if (stateOffsets.empty()) {
      if (debugSubsumptionLevel >= 3) {
        std::string msg;
        llvm::raw_string_ostream stream(msg);
        it->first->print(stream);
        stream.flush();
        klee_message("No offset defined in state for %s", msg.c_str());
      }
      return ConstantExpr::create(0, Expr::Bool);
    }

    for (std::set<ref<Expr> >::const_iterator it1 = stateOffsets.begin(),
                                              ie1 = stateOffsets.end();
         it1 != ie1; ++it1) {
      for (std::set<ref<Expr> >::const_iterator it2 = tabledBounds.begin(),
                                                ie2 = tabledBounds.end();
           it2 != ie2; ++it2) {
        if (ConstantExpr *tabledBound = llvm::dyn_cast<ConstantExpr>(*it2)) {
          uint64_t tabledBoundInt = tabledBound->getZExtValue();
          if (ConstantExpr *stateOffset = llvm::dyn_cast<ConstantExpr>(*it1)) {
            if (tabledBoundInt > 0) {
              uint64_t stateOffsetInt = stateOffset->getZExtValue();
              if (stateOffsetInt >= tabledBoundInt) {
                if (debugSubsumptionLevel >= 3) {
                  std::string msg;
                  llvm::raw_string_ostream stream(msg);
                  it->first->print(stream);
                  stream.flush();
                  klee_message("Offset %lu out of bound %lu for %s",
                               stateOffsetInt, tabledBoundInt, msg.c_str());
                }
                return ConstantExpr::create(0, Expr::Bool);
              }
            }
          }

          if (tabledBoundInt > 0) {
            // Symbolic state offset, but concrete tabled bound. Here the bound
            // is known (non-zero), so we create constraints
            if (res.isNull()) {
              res = UltExpr::create(*it1, *it2);
            } else {
              res = AndExpr::create(UltExpr::create(*it1, *it2), res);
            }
            bounds.insert(*it2);
          }
          continue;
        }
        // Create constraints for symbolic bounds
        if (res.isNull()) {
          res = UltExpr::create(*it1, *it2);
        } else {
          res = AndExpr::create(UltExpr::create(*it1, *it2), res);
        }
        bounds.insert(*it2);
      }
    }
  }

  // Bounds check successful if no constraints added
  if (res.isNull()) {
    if (matchFound)
      return ConstantExpr::create(1, Expr::Bool);
    else
      return ConstantExpr::create(0, Expr::Bool);
  }
#endif // ENABLE_Z3
  return res;
}

void StoredValue::print(llvm::raw_ostream &stream,
                        const std::string &prefix) const {
  std::string nextTabs = appendTab(prefix);

  if (!doNotUseBound && !allocationBounds.empty()) {
    stream << prefix << "BOUNDS:";
    for (std::map<const llvm::Value *, std::set<ref<Expr> > >::const_iterator
             it = allocationBounds.begin(),
             ie = allocationBounds.end();
         it != ie; ++it) {
      std::set<ref<Expr> > boundsSet = it->second;
      stream << "\n";
      stream << prefix << "[";
      it->first->print(stream);
      stream << "<={";
      for (std::set<ref<Expr> >::const_iterator it1 = it->second.begin(),
                                                is1 = it1,
                                                ie1 = it->second.end();
           it1 != ie1; ++it1) {
        if (it1 != is1)
          stream << ",";
        (*it1)->print(stream);
      }
      stream << "}]";
    }

    if (!allocationOffsets.empty()) {
      stream << "\n";
      stream << prefix << "OFFSETS:";
      for (std::map<const llvm::Value *, std::set<ref<Expr> > >::const_iterator
               it = allocationOffsets.begin(),
               ie = allocationOffsets.end();
           it != ie; ++it) {
        std::set<ref<Expr> > boundsSet = it->second;
        stream << "\n";
        stream << prefix << "[";
        it->first->print(stream);
        stream << "=={";
        for (std::set<ref<Expr> >::const_iterator it1 = it->second.begin(),
                                                  is1 = it1,
                                                  ie1 = it->second.end();
             it1 != ie1; ++it1) {
          if (it1 != is1)
            stream << ",";
          (*it1)->print(stream);
        }
        stream << "}]";
      }
    }
  } else {
    stream << prefix;
    expr->print(stream);
  }

  if (!coreReasons.empty()) {
    stream << "\n";
    stream << prefix << "reason(s) for storage:\n";
    for (std::set<std::string>::const_iterator is = coreReasons.begin(),
                                               ie = coreReasons.end(), it = is;
         it != ie; ++it) {
      if (it != is)
        stream << "\n";
      stream << nextTabs << *it;
    }
  }
}
}
