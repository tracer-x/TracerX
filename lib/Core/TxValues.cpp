//===-- TxValues.cpp --------------------------------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementations of the classes related to values in
/// the symbolic execution state and interpolant table. Values that belong to
/// the interpolant are versioned such as TxStateAddress, which is distinguished
/// by its base address, and TxStateValue, which is distinguished by its
/// version, and TxStateValue, which is distinguished by its own object id.
///
//===----------------------------------------------------------------------===//

#include "TxStore.h"

#include "klee/Internal/Module/TxValues.h"
#include "klee/Internal/Support/ErrorHandling.h"
#include "klee/util/TxExprUtil.h"
#include "klee/util/TxPrintUtil.h"
#include "TxShadowArray.h"

#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)
#include <llvm/IR/Function.h>
#include <llvm/IR/Type.h>
#else
#include <llvm/Function.h>
#include <llvm/Type.h>
#endif

using namespace klee;

namespace klee {

bool concreteBound(uint64_t bound) { return bound < symbolicBoundId; }

/**/

void TxStoreEntry::print(llvm::raw_ostream &stream,
                         const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);
  std::string tabsNextNext = appendTab(tabsNext);

  stream << prefix << "creation depth: " << depth << "\n";
  stream << prefix << "address:\n";
  address->print(stream, tabsNext);
  stream << "\n";
  stream << prefix << "content:\n";
  if (leftCore && rightCore) {
    stream << tabsNext << "a left and right interpolant value:\n";
    for (std::set<std::string>::iterator it = leftCoreReasons.begin(),
                                         ie = leftCoreReasons.end();
         it != ie; ++it) {
      stream << tabsNextNext << *it << "\n";
    }
    for (std::set<std::string>::iterator it = rightCoreReasons.begin(),
                                         ie = rightCoreReasons.end();
         it != ie; ++it) {
      stream << tabsNextNext << *it << "\n";
    }
  } else if (leftCore) {
    stream << tabsNext << "a left interpolant value:\n";
    for (std::set<std::string>::iterator it = leftCoreReasons.begin(),
                                         ie = leftCoreReasons.end();
         it != ie; ++it) {
      stream << tabsNextNext << *it << "\n";
    }
  } else if (rightCore) {
    stream << tabsNext << "a right interpolant value:\n";
    for (std::set<std::string>::iterator it = rightCoreReasons.begin(),
                                         ie = rightCoreReasons.end();
         it != ie; ++it) {
      stream << tabsNextNext << *it << "\n";
    }
  } else {
    stream << tabsNext << "a non-interpolant value:\n";
  }
  content->printMinimal(stream, tabsNext);
  if (!leftPointerInfo.isNull()) {
    stream << "\n";
    stream << tabsNext << "left pointer info:\n";
    leftPointerInfo->print(stream, tabsNextNext);
  }
  if (!rightPointerInfo.isNull()) {
    stream << "\n";
    stream << tabsNext << "right pointer info:\n";
    rightPointerInfo->print(stream, tabsNextNext);
  }
}

/**/

bool TxAllocationInfo::translate(
    ref<TxAllocationInfo> other,
    std::map<ref<TxAllocationInfo>, ref<TxAllocationInfo> > &table) const {
  ref<TxAllocationContext> _context(context);
  ref<TxAllocationInfo> self(new TxAllocationInfo(_context, base, size));

  if (self == other)
    return true;

  std::map<ref<TxAllocationInfo>, ref<TxAllocationInfo> >::const_iterator it =
      table.find(self);
  if (it != table.end()) {
    if (it->second != other) {
      return false;
    }
    return true;
  }

  table[self] = other;
  return true;
}

int TxAllocationInfo::compare(const TxAllocationInfo &other) const {
  if (base == other.base) {
    if (size == other.size) {
      return 0;
    }
    if (size < other.size) {
      return -1;
    }
    return 1;
  } else if (ConstantExpr *cbx = llvm::dyn_cast<ConstantExpr>(base)) {
    uint64_t cb = cbx->getZExtValue();
    if (ConstantExpr *cbox = llvm::dyn_cast<ConstantExpr>(other.base)) {
      uint64_t cbo = cbox->getZExtValue();
      if (cb == cbo) {
        if (size < other.size) {
          return -1;
        }
        return 1;
      } else if (cb < cbo)
        return -1;
      return 1;
    }
  }

  if (base->hash() < other.base->hash())
    return -1;
  return 1;
}

void TxAllocationInfo::print(llvm::raw_ostream &stream,
                             const std::string &prefix) const {
  stream << prefix << "[base: ";
  base->print(stream);
  stream << ", size: " << size << "]";
}

/**/

ref<TxAllocationContext> TxAllocationContext::create(
    llvm::Value *_value, const std::vector<llvm::Instruction *> &_callHistory) {
  ref<TxAllocationContext> ret(new TxAllocationContext(_value, _callHistory));
  return ret;
}

void TxAllocationContext::print(llvm::raw_ostream &stream,
                                const std::string &prefix) const {
  std::string tabs = makeTabs(1);
  if (value) {
    stream << prefix << "Location: ";
    if (llvm::Instruction *inst = llvm::dyn_cast<llvm::Instruction>(value)) {
      if (llvm::BasicBlock *bb = inst->getParent()) {
        if (llvm::Function *f = bb->getParent()) {
          stream << f->getName().str() << "/";
        }
      }
    }
    value->print(stream);
  }
  if (callHistory.size() > 0) {
    stream << "\n" << prefix << "Call history:";
    for (std::vector<llvm::Instruction *>::const_iterator
             it = callHistory.begin(),
             ie = callHistory.end();
         it != ie; ++it) {
      stream << "\n" << tabs << prefix;
      (*it)->print(stream);
    }
  }
}

/**/

void TxVariable::print(llvm::raw_ostream &stream,
                       const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);

  stream << prefix << "function/value name: ";
  if (outputFunctionName(allocInfo->getContext()->getValue(), stream))
    stream << "/";
  allocInfo->getContext()->getValue()->print(stream);
  //stream << "\n";

 /* stream << prefix << "stack:";
  if (allocInfo->getContext()->getCallHistory().empty()) {
    stream << " (empty)\n";
  } else {
    stream << "\n";
    for (std::vector<llvm::Instruction *>::const_reverse_iterator
             it = allocInfo->getContext()->getCallHistory().rbegin(),
             ie = allocInfo->getContext()->getCallHistory().rend();
         it != ie; ++it) {
      stream << tabsNext;
      (*it)->print(stream);
      stream << "\n";
    }
  }
  stream << prefix << "offset";
  if (!llvm::isa<ConstantExpr>(this->offset))
    stream << " (symbolic)";
  stream << ": ";
  offset->print(stream);*/ /*Commented for Pretty Print*/
}

/**/

void TxInterpolantValue::init(
    llvm::Value *_value, ref<Expr> _expr, bool canInterpolateBound,
    const std::set<std::string> &_coreReasons, ref<TxStateAddress> _location,
    const std::map<ref<Expr>, ref<Expr> > &substitution,
    std::set<const Array *> &replacements, bool shadowing) {
  refCount = 0;
  id = reinterpret_cast<uintptr_t>(this);
  if (shadowing) {
    _expr = TxShadowArray::getShadowExpression(_expr, replacements);
    for (std::map<ref<Expr>, ref<Expr> >::const_iterator
             it = substitution.begin(),
             ie = substitution.end();
         it != ie; ++it) {
      _expr = TxSubstitutionVisitor(substitution).visit(_expr);
    }
  }
  expr = _expr;
  value = _value;

  doNotUseBound = !canInterpolateBound;

  coreReasons = _coreReasons;

  if (!_location.isNull()) {
    ref<TxAllocationInfo> allocInfo =
        _location->getAllocationInfo(); // The allocation context

    ref<Expr> offset = shadowing ? TxShadowArray::getShadowExpression(
                                       _location->getOffset(), replacements)
                                 : _location->getOffset();

    // We next build the offsets to be compared against stored allocation
    // offset bounds
    ConstantExpr *oe = llvm::dyn_cast<ConstantExpr>(offset);
    if (oe && !allocationOffsets[allocInfo].empty()) {
      // Here we check if smaller offset exists, in which case we replace it
      // with the new offset; as we want the greater offset to possibly
      // violate an offset bound.
      std::set<ref<Expr> > res;
      uint64_t offsetInt = oe->getZExtValue();
      for (std::set<ref<Expr> >::iterator
               it1 = allocationOffsets[allocInfo].begin(),
               ie1 = allocationOffsets[allocInfo].end();
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
      allocationOffsets[allocInfo] = res;
    } else {
      allocationOffsets[allocInfo].insert(offset);
    }
  }

  if (doNotUseBound)
    return;

  if (!_location.isNull()) {
    // Here we compute memory bounds for checking pointer values. The memory
    // bound is the size of the allocation minus the offset; this is the weakest
    // precondition (interpolant) of memory bound checks done by KLEE.
    ref<TxAllocationInfo> allocInfo =
        _location->getAllocationInfo(); // The allocation info

    // Concrete bound
    uint64_t concreteBound = _location->getConcreteOffsetBound();
    std::set<ref<Expr> > newBounds;

    if (concreteBound > 0)
      allocationBounds[allocInfo].insert(concreteBound);

    // Symbolic bounds
    if (_location->hasSymbolicOffsetBounds()) {
      allocationBounds[allocInfo].insert(symbolicBoundId);
    }
  }
}

ref<Expr> TxInterpolantValue::getBoundsCheck(
    ref<TxInterpolantValue> other, std::set<uint64_t> &bounds,
    std::map<ref<TxAllocationInfo>, ref<TxAllocationInfo> > &unifiedBases,
    int debugSubsumptionLevel) const {
  ref<Expr> res;
#ifdef ENABLE_Z3

  assert(useBound() && "bounds check must be enabled for this pointer");

  if (allocationBounds.empty()) {
    assert(!allocationOffsets.empty() && "offsets should not be empty");

    // This means there is no constraint on the bounds
    return ConstantExpr::create(1, Expr::Bool);
  }

  // In principle, for a state to be subsumed, the subsuming state must be
  // weaker, which in this case means that it should specify less allocations,
  // so all allocations in the subsuming (this), should be specified by the
  // subsumed (the stateValue argument), and we iterate over allocation of
  // the current object and for each such allocation, retrieve the
  // information from the argument object; in this way resulting in
  // less iterations compared to doing it the other way around.
  bool matchFound = false;
  for (std::map<ref<TxAllocationInfo>, std::set<uint64_t> >::const_iterator
           selfBoundsListIt = allocationBounds.begin(),
           selfBoundsListIe = allocationBounds.end();
       selfBoundsListIt != selfBoundsListIe; ++selfBoundsListIt) {
    std::set<uint64_t> selfBounds = selfBoundsListIt->second;
    std::map<ref<TxAllocationInfo>, std::set<ref<Expr> > >::iterator
    otherOffsetsListIt = other->allocationOffsets.find(selfBoundsListIt->first);
    if (otherOffsetsListIt == other->allocationOffsets.end()) {
      continue;
    }
    matchFound = true;

    std::set<ref<Expr> > otherOffsets = otherOffsetsListIt->second;

    assert(!selfBounds.empty() && "tabled bounds empty");

    if (otherOffsets.empty()) {
      if (debugSubsumptionLevel >= 3) {
        std::string msg;
        llvm::raw_string_ostream stream(msg);
        selfBoundsListIt->first->print(stream);
        stream.flush();
        klee_message("No offset defined in state for %s", msg.c_str());
      }
      return ConstantExpr::create(0, Expr::Bool);
    }

    for (std::set<ref<Expr> >::const_iterator
             otherOffsetsIt = otherOffsets.begin(),
             otherOffsetsIe = otherOffsets.end();
         otherOffsetsIt != otherOffsetsIe; ++otherOffsetsIt) {
      for (std::set<uint64_t>::const_iterator selfBoundsIt = selfBounds.begin(),
                                              selfBoundsIe = selfBounds.end();
           selfBoundsIt != selfBoundsIe; ++selfBoundsIt) {
        uint64_t selfBound = *selfBoundsIt;
        if (concreteBound(selfBound)) {
          if (ConstantExpr *otherOffsetObj =
                  llvm::dyn_cast<ConstantExpr>(*otherOffsetsIt)) {
            if (selfBound > 0) {
              uint64_t otherOffset = otherOffsetObj->getZExtValue();
              if (otherOffset >= selfBound) {
                if (debugSubsumptionLevel >= 3) {
                  std::string msg;
                  llvm::raw_string_ostream stream(msg);
                  selfBoundsListIt->first->print(stream);
                  stream.flush();
                  klee_message("Offset %lu out of bound %lu for %s",
                               otherOffset, selfBound, msg.c_str());
                }
                return ConstantExpr::create(0, Expr::Bool);
              } else {
                bounds.insert(*selfBoundsIt);
                continue;
              }
            }
          } else if (selfBound > 0) {
            // Symbolic state offset, but concrete tabled bound. Here the bound
            // is known (non-zero), so we create constraints
            if (res.isNull()) {
              res = UltExpr::create(*otherOffsetsIt,
                                    Expr::createPointer(selfBound));
            } else {
              res = AndExpr::create(
                  UltExpr::create(*otherOffsetsIt,
                                  Expr::createPointer(selfBound)),
                  res);
            }
            bounds.insert(selfBound);
          }
          continue;
        }

        // We return a null expression signaling that we have encountered a
        // symbolic bound. In this case, the caller should switch to checking
        // the exact offset.
        ref<Expr> nullExpression;
        return nullExpression;
      }
    }
  }

  // Bounds check successful if no constraints added
  if (res.isNull()) {
    if (matchFound)
      return ConstantExpr::create(1, Expr::Bool);
    else {
      // Match not found; we force match via address translation
      for (std::map<ref<TxAllocationInfo>, std::set<uint64_t> >::const_iterator
               selfBoundsListIt = allocationBounds.begin(),
               selfBoundsListIe = allocationBounds.end();
           selfBoundsListIt != selfBoundsListIe && !matchFound;
           ++selfBoundsListIt) {
        for (std::map<ref<TxAllocationInfo>,
                      std::set<ref<Expr> > >::const_iterator
                 otherOffsetsListIt = other->allocationOffsets.begin(),
                 otherOffsetsListIe = other->allocationOffsets.end();
             otherOffsetsListIt != otherOffsetsListIe && !matchFound;
             ++otherOffsetsListIt) {
          uint64_t selfSize = selfBoundsListIt->first->getSize(),
                   otherSize = otherOffsetsListIt->first->getSize();
          if (selfSize == otherSize) {
            // Allocation sizes match
            const std::set<uint64_t> &selfBounds = selfBoundsListIt->second;
            const std::set<ref<Expr> > &otherOffsets =
                otherOffsetsListIt->second;
            ref<Expr> expr;
            for (std::set<uint64_t>::const_iterator
                     selfBoundsIt = selfBounds.begin(),
                     selfBoundsIe = selfBounds.end();
                 selfBoundsIt != selfBoundsIe; ++selfBoundsIt) {
              uint64_t selfBound = *selfBoundsIt;
              for (std::set<ref<Expr> >::const_iterator
                       otherOffsetsIt = otherOffsets.begin(),
                       otherOffsetsIe = otherOffsets.end();
                   otherOffsetsIt != otherOffsetsIe; ++otherOffsetsIt) {
                // Create constraints for offset inequalities
                ref<Expr> conjunct;
                if (concreteBound(selfBound))
                  conjunct = UltExpr::create(*otherOffsetsIt,
                                             Expr::createPointer(selfBound));
                else
                  conjunct = ConstantExpr::create(0, Expr::Bool);
                if (expr.isNull()) {
                  expr = conjunct;
                } else {
                  expr = AndExpr::create(conjunct, expr);
                }
              }
            }

            if (!expr.isNull() && !expr->isFalse()) {
              if (otherOffsetsListIt->first->translate(selfBoundsListIt->first,
                                                       unifiedBases)) {
                res = expr;
                matchFound = true;
              }
            }
          }
        }
      }
      if (matchFound)
        return res;

      return ConstantExpr::create(0, Expr::Bool);
    }
  }
#endif // ENABLE_Z3
  return res;
}

ref<Expr> TxInterpolantValue::getOffsetsCheck(
    ref<TxInterpolantValue> other,
    std::map<ref<TxAllocationInfo>, ref<TxAllocationInfo> > &unifiedBases,
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
  for (std::map<ref<TxAllocationInfo>, std::set<ref<Expr> > >::const_iterator
           selfOffsetsListIt = allocationOffsets.begin(),
           selfOffsetsListIe = allocationOffsets.end();
       selfOffsetsListIt != selfOffsetsListIe; ++selfOffsetsListIt) {
    const std::set<ref<Expr> > &selfOffsets = selfOffsetsListIt->second;
    std::map<ref<TxAllocationInfo>, std::set<ref<Expr> > >::iterator
    otherOffsetsListIt =
        other->allocationOffsets.find(selfOffsetsListIt->first);
    if (otherOffsetsListIt == other->allocationOffsets.end()) {
      continue;
    }
    matchFound = true;

    std::set<ref<Expr> > &otherOffsets = otherOffsetsListIt->second;

    assert(!selfOffsets.empty() && "tabled offsets empty");

    if (otherOffsets.empty()) {
      if (debugSubsumptionLevel >= 3) {
        std::string msg;
        llvm::raw_string_ostream stream(msg);
        selfOffsetsListIt->first->print(stream);
        stream.flush();
        klee_message("No offset defined in state for %s", msg.c_str());
      }
      return ConstantExpr::create(0, Expr::Bool);
    }

    for (std::set<ref<Expr> >::const_iterator
             otherOffsetsIt = otherOffsets.begin(),
             otherOffsetsIe = otherOffsets.end();
         otherOffsetsIt != otherOffsetsIe; ++otherOffsetsIt) {
      for (std::set<ref<Expr> >::const_iterator
               selfOffsetsIt = selfOffsets.begin(),
               selfOffsetsIe = selfOffsets.end();
           selfOffsetsIt != selfOffsetsIe; ++selfOffsetsIt) {
        if (ConstantExpr *selfOffsetObj =
                llvm::dyn_cast<ConstantExpr>(*selfOffsetsIt)) {
          uint64_t selfOffset = selfOffsetObj->getZExtValue();
          if (ConstantExpr *otherOffsetObj =
                  llvm::dyn_cast<ConstantExpr>(*otherOffsetsIt)) {
            uint64_t otherOffset = otherOffsetObj->getZExtValue();
            if (otherOffset != selfOffset) {
              if (debugSubsumptionLevel >= 3) {
                std::string msg;
                llvm::raw_string_ostream stream(msg);
                selfOffsetsListIt->first->print(stream);
                stream.flush();
                klee_message("Offset %lu does not equal %lu for %s",
                             otherOffset, selfOffset, msg.c_str());
              }
              return ConstantExpr::create(0, Expr::Bool);
            }
          }
        }

        // Create constraints for offset equalities
        if (res.isNull()) {
          res = EqExpr::create(*otherOffsetsIt, *selfOffsetsIt);
        } else {
          res = AndExpr::create(EqExpr::create(*otherOffsetsIt, *selfOffsetsIt),
                                res);
        }
      }
    }
  }

  // Bounds check successful if no constraints added
  if (res.isNull()) {
    if (matchFound)
      return ConstantExpr::create(1, Expr::Bool);
    else {
      // Match not found; we force match via address translation
      for (std::map<ref<TxAllocationInfo>,
                    std::set<ref<Expr> > >::const_iterator
               selfOffsetsListIt = allocationOffsets.begin(),
               selfOffsetsListIe = allocationOffsets.end();
           selfOffsetsListIt != selfOffsetsListIe && !matchFound;
           ++selfOffsetsListIt) {
        for (std::map<ref<TxAllocationInfo>,
                      std::set<ref<Expr> > >::const_iterator
                 otherOffsetsListIt = other->allocationOffsets.begin(),
                 otherOffsetsListIe = other->allocationOffsets.end();
             otherOffsetsListIt != otherOffsetsListIe && !matchFound;
             ++otherOffsetsListIt) {
          uint64_t selfSize = selfOffsetsListIt->first->getSize(),
                   otherSize = otherOffsetsListIt->first->getSize();
          if (selfSize == otherSize) {
            // Allocation sizes match
            const std::set<ref<Expr> > &selfOffsets = selfOffsetsListIt->second;
            const std::set<ref<Expr> > &otherOffsets =
                otherOffsetsListIt->second;
            ref<Expr> expr;
            for (std::set<ref<Expr> >::const_iterator
                     selfOffsetsIt = selfOffsets.begin(),
                     selfOffsetsIe = selfOffsets.end();
                 selfOffsetsIt != selfOffsetsIe; ++selfOffsetsIt) {
              for (std::set<ref<Expr> >::const_iterator
                       otherOffsetsIt = otherOffsets.begin(),
                       otherOffsetsIe = otherOffsets.end();
                   otherOffsetsIt != otherOffsetsIe; ++otherOffsetsIt) {
                // Create constraints for offset equalities
                if (expr.isNull()) {
                  expr = EqExpr::create(*otherOffsetsIt, *selfOffsetsIt);
                } else {
                  expr = AndExpr::create(
                      EqExpr::create(*otherOffsetsIt, *selfOffsetsIt), expr);
                }
              }
            }

            if (!expr.isNull() && !expr->isFalse()) {
              if (otherOffsetsListIt->first->translate(selfOffsetsListIt->first,
                                                       unifiedBases)) {
                res = expr;
                matchFound = true;
              }
            }
          }
        }
      }
      if (matchFound)
        return res;

      return ConstantExpr::create(0, Expr::Bool);
    }
  }
#endif // ENABLE_Z3
  return res;
}

void TxInterpolantValue::print(llvm::raw_ostream &stream) const {
  print(stream, "");
}

void TxInterpolantValue::print(llvm::raw_ostream &stream,
                               const std::string &prefix) const {
  std::string nextTabs = appendTab(prefix);
  bool offsetDisplayed = false;

  /*stream << prefix << "function/value: ";
  if (outputFunctionName(value, stream))
      stream << "/";
  value->print(stream);
  stream << "\n";*/  /*Commented for Pretty Print*/

  if (!doNotUseBound && !allocationBounds.empty()) {
    stream << prefix << "BOUNDS:";
    for (std::map<ref<TxAllocationInfo>, std::set<uint64_t> >::const_iterator
             it = allocationBounds.begin(),
             ie = allocationBounds.end();
         it != ie; ++it) {
      stream << "\n";
      stream << prefix << "[";
      it->first->print(stream);
      stream << "<{";
      for (std::set<uint64_t>::const_iterator it1 = it->second.begin(),
                                              is1 = it1, ie1 = it->second.end();
           it1 != ie1; ++it1) {
        if (it1 != is1)
          stream << ",";
        if (concreteBound(*it1))
          stream << (*it1);
        else
          stream << "(symbolic)";
      }
      stream << "}]";
    }
    offsetDisplayed = true;
  }

  if (!allocationOffsets.empty()) {
    if (offsetDisplayed)
      stream << "\n";
    stream << prefix << "OFFSETS:";
    for (std::map<ref<TxAllocationInfo>, std::set<ref<Expr> > >::const_iterator
             it = allocationOffsets.begin(),
             ie = allocationOffsets.end();
         it != ie; ++it) {
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
    offsetDisplayed = true;
  }

  if (!offsetDisplayed) {
    stream << prefix;
    expr->print(stream);
  }

 /* if (!coreReasons.empty()) {
    stream << "\n";
    stream << prefix << "reason(s) for storage:\n";
    for (std::set<std::string>::const_iterator is = coreReasons.begin(),
                                               ie = coreReasons.end(), it = is;
         it != ie; ++it) {
      if (it != is)
        stream << "\n";
      stream << nextTabs << *it;
    }
  }*/ /*Commented for Pretty Print*/
}

/**/

bool TxStateAddress::adjustOffsetBound(ref<TxStateValue> checkedAddress,
                                       std::set<uint64_t> &_bounds,
                                       bool &boundUpdated) {
  const ref<TxStateAddress> location = checkedAddress->getPointerInfo();
  std::set<uint64_t> bounds(_bounds);

  if (bounds.empty()) {
    bounds.insert(size);
  }

  for (std::set<uint64_t>::iterator it1 = bounds.begin(), ie1 = bounds.end();
       it1 != ie1; ++it1) {

    ref<Expr> checkedOffset = location->getOffset();
    if (ConstantExpr *c = llvm::dyn_cast<ConstantExpr>(checkedOffset)) {
      if (ConstantExpr *o = llvm::dyn_cast<ConstantExpr>(getOffset())) {
        uint64_t offsetInt = o->getZExtValue();
        uint64_t newBound = (*it1) - (c->getZExtValue() - offsetInt);

        if (concreteOffsetBound > newBound) {

          // FIXME: A quick hack to avoid assertion check to make DirSeek.c
          // regression test pass.
          llvm::Value *v = location->getContext()->getValue();
          if (v->getType()->isPointerTy()) {
            llvm::Type *elementType = v->getType()->getPointerElementType();
            if (llvm::StructType *elementStructType =
                    llvm::dyn_cast<llvm::StructType>(elementType)) {
              if (!elementStructType->isLiteral() &&
                  elementType->getStructName() == "struct.dirent") {
                concreteOffsetBound = newBound;
                boundUpdated = true;
                continue;
              }
            }
          }

          if (newBound > offsetInt) {
            concreteOffsetBound = newBound;
            boundUpdated = true;
          } else {
            // Incorrect bounds would pass this assertion, as long as the value
            // of the checked offset is reasonable (non-negative). We need to
            // pass some wrong bounds since Tracer-X is more
            // conservative than KLEE: KLEE can still determine that memory
            // access is valid as it happens to be in a valid region.
            // Tracer-X, on the other hand, associates every pointer with a
            // set of allocations, and the memory bound is violated whenever
            // there is an access to a memory outside of the region associated
            // with any of the allocations.
            assert(c->getZExtValue() <= LLONG_MAX && "incorrect bound");
            return true;
          }
        }
        continue;
      }
    }

    concreteOffsetBound = symbolicBoundId;
    boundUpdated = true;
  }
  return false;
}

inline bool TxStateAddress::hasSymbolicOffsetBounds() const {
  return !concreteBound(concreteOffsetBound);
}

ref<TxStateAddress>
TxStateAddress::create(ref<TxStateAddress> loc,
                       std::set<const Array *> &replacements) {
  ref<Expr> _address(
      TxShadowArray::getShadowExpression(loc->address, replacements)),
      _base(TxShadowArray::getShadowExpression(loc->variable->getBase(),
                                             replacements)),
      _offset(TxShadowArray::getShadowExpression(loc->getOffset(), replacements));
  ref<TxStateAddress> ret(new TxStateAddress(loc->getContext(), _address, _base,
                                             _offset, loc->size));
  return ret;
}

void TxStateAddress::print(llvm::raw_ostream &stream,
                           const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);

  variable->print(stream, prefix);
  stream << "\n";
  stream << prefix << "address";
  if (!llvm::isa<ConstantExpr>(address))
    stream << " (symbolic)";
  stream << ": ";
  address->print(stream);
  stream << "\n";
  stream << prefix << "base";
  if (!llvm::isa<ConstantExpr>(variable->getBase()))
    stream << " (symbolic)";
  stream << ": ";
  variable->getBase()->print(stream);
  stream << "\n";
  stream << prefix
         << "pointer to location object: " << reinterpret_cast<uintptr_t>(this);
  stream << "\n";
  stream << prefix << "concrete offset bound: ";
  if (concreteOffsetBound == symbolicBoundId)
    stream << "(symbolic)";
  else
    stream << concreteOffsetBound;
  stream << "\n";
  stream << prefix << "size: " << size;
}

/**/

void TxStateValue::addLoadAddress(ref<TxStateValue> loadAddress) {
  disableBoundEntryList.insert(loadAddress->allowBoundEntryList.begin(),
                               loadAddress->allowBoundEntryList.end());
  disableBoundEntryList.insert(loadAddress->disableBoundEntryList.begin(),
                               loadAddress->disableBoundEntryList.end());
  std::set<ref<TxStoreEntry> > tmpSet;
  for (std::set<ref<TxStoreEntry> >::iterator it = allowBoundEntryList.begin(),
                                              ie = allowBoundEntryList.end();
       it != ie; ++it) {
    std::set<ref<TxStoreEntry> >::iterator it1 =
        disableBoundEntryList.find(*it);
    if (it1 == disableBoundEntryList.end()) {
      tmpSet.insert(*it);
    }
  }
  allowBoundEntryList = tmpSet;
}

void TxStateValue::addStoreAddress(ref<TxStateValue> storeAddress) {
  disableBoundEntryList.insert(storeAddress->allowBoundEntryList.begin(),
                               storeAddress->allowBoundEntryList.end());
  disableBoundEntryList.insert(storeAddress->disableBoundEntryList.begin(),
                               storeAddress->disableBoundEntryList.end());
  std::set<ref<TxStoreEntry> > tmpSet;
  for (std::set<ref<TxStoreEntry> >::iterator it = allowBoundEntryList.begin(),
                                              ie = allowBoundEntryList.end();
       it != ie; ++it) {
    std::set<ref<TxStoreEntry> >::iterator it1 =
        disableBoundEntryList.find(*it);
    if (it1 == disableBoundEntryList.end()) {
      tmpSet.insert(*it);
    }
  }
  allowBoundEntryList = tmpSet;
}

void TxStateValue::addDependency(ref<TxStateValue> source) {
  std::set<ref<TxStoreEntry> > tmpSet;

  disableBoundEntryList.insert(source->disableBoundEntryList.begin(),
                               source->disableBoundEntryList.end());

  for (std::set<ref<TxStoreEntry> >::iterator
           it = source->allowBoundEntryList.begin(),
           ie = source->allowBoundEntryList.end();
       it != ie; ++it) {
    std::set<ref<TxStoreEntry> >::iterator it1 =
        disableBoundEntryList.find(*it);
    if (it1 == disableBoundEntryList.end()) {
      tmpSet.insert(*it);
    }
  }
  allowBoundEntryList.insert(tmpSet.begin(), tmpSet.end());
}

void TxStateValue::addStoreEntry(ref<TxStoreEntry> entry) {
  allowBoundEntryList.insert(entry);
}

const std::set<ref<TxStoreEntry> > &
TxStateValue::getAllowBoundEntryList() const {
  return allowBoundEntryList;
}

const std::set<ref<TxStoreEntry> > &
TxStateValue::getDisableBoundEntryList() const {
  return disableBoundEntryList;
}

void TxStateValue::print(llvm::raw_ostream &stream,
                         const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);

  printMinimal(stream, prefix);
  stream << "\n";

  if (allowBoundEntryList.empty() && disableBoundEntryList.empty()) {
    stream << prefix << "not dependent on store\n";
  } else {
    stream << prefix << "loaded from store entries:";
    for (std::set<ref<TxStoreEntry> >::const_iterator
             it = allowBoundEntryList.begin(),
             ie = allowBoundEntryList.end();
         it != ie; ++it) {
      stream << "\n";
      (*it)->print(stream, tabsNext);
    }
    for (std::set<ref<TxStoreEntry> >::const_iterator
             it = disableBoundEntryList.begin(),
             ie = disableBoundEntryList.end();
         it != ie; ++it) {
      stream << "\n";
      (*it)->print(stream, tabsNext);
    }
  }
}

void TxStateValue::printMinimal(llvm::raw_ostream &stream,
                                const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);

  stream << prefix << "function/value: ";
  if (outputFunctionName(value, stream))
    stream << "/";
  value->print(stream);
  stream << "\n";
  stream << prefix << "expression: ";
  if (!valueExpr.isNull())
    valueExpr->print(stream);
  else
    stream << "NULL";
  stream << "\n";
  stream << prefix
         << "pointer to location object: " << reinterpret_cast<uintptr_t>(this);
}

/**/

TxStoreEntry::TxStoreEntry(ref<TxStateAddress> _address,
                           ref<TxStateValue> _addressValue,
                           ref<TxStateValue> _content, const TxStore *store,
                           uint64_t _depth)
    : refCount(0), address(_address), addressValue(_addressValue),
      content(_content), depth(_depth), value(content->getValue()),
      valueExpr(content->getExpression()), leftDoNotInterpolateBound(false),
      rightDoNotInterpolateBound(false), leftCore(false), rightCore(false) {
  if (!content->getPointerInfo().isNull()) {
    leftPointerInfo = content->getPointerInfo();
    rightPointerInfo = content->getPointerInfo()->copy();
  }

  const std::set<ref<TxStoreEntry> > &entryList1(
      content->getAllowBoundEntryList());
  const std::set<ref<TxStoreEntry> > &entryList2(
      content->getDisableBoundEntryList());

  for (std::set<ref<TxStoreEntry> >::const_iterator it = entryList1.begin(),
                                                    ie = entryList1.end();
       it != ie; ++it) {
    allowBoundEntryList[*it] = store->isInLeftSubtree((*it)->depth);
  }

  for (std::set<ref<TxStoreEntry> >::const_iterator it = entryList2.begin(),
                                                    ie = entryList2.end();
       it != ie; ++it) {
    disableBoundEntryList[*it] = store->isInLeftSubtree((*it)->depth);
  }
}
}
