//===-- Dependency.cpp - Memory location dependency -------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementation of the dependency analysis to
/// compute the locations upon which the unsatisfiability core depends,
/// which is used in computing the interpolant.
///
//===----------------------------------------------------------------------===//

#include "TxDependency.h"
#include "TxShadowArray.h"
#include "Context.h"
#include "WP.h"
#include <klee/util/ArrayCache.h>

#include "Context.h"
#include "klee/CommandLine.h"
#include "klee/Internal/Support/ErrorHandling.h"
#include "klee/util/GetElementPtrTypeIterator.h"
#include "klee/util/TxPrintUtil.h"
#include "TxShadowArray.h"

#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 5)
#include <llvm/IR/DebugInfo.h>
#elif LLVM_VERSION_CODE >= LLVM_VERSION(3, 2)
#include <llvm/DebugInfo.h>
#else
#include <llvm/Analysis/DebugInfo.h>
#endif

#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)
#include <llvm/IR/Constants.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/Intrinsics.h>
#else
#include <llvm/Constants.h>
#include <llvm/DataLayout.h>
#include <llvm/Intrinsics.h>
#endif

using namespace klee;

namespace klee {

bool TxDependency::isMainArgument(const llvm::Value *loc) {
  const llvm::Argument *vArg = llvm::dyn_cast<llvm::Argument>(loc);

  // FIXME: We need a more precise way to detect main argument
  if (vArg && vArg->getParent() &&
      (vArg->getParent()->getName().equals("main") ||
       vArg->getParent()->getName().equals("__user_main"))) {
    return true;
  }
  return false;
}

ref<TxStateValue>
TxDependency::registerNewTxStateValue(llvm::Value *value,
                                      ref<TxStateValue> vvalue) {
  valuesMap[value].push_back(vvalue);
  return vvalue;
}

ref<Expr> TxDependency::getAddress(llvm::Value *value, ArrayCache *ac,
                                 const Array *tmpArray,
                                 WeakestPreCondition *wp) {
  if (!value->hasName()) {
    klee_error("Dependency::getAddress:Instruction has no name!\n");
  }
  std::string arrayName = value->getName();
  const std::string ext(".addr");
  if (arrayName.find(ext))
    arrayName = arrayName.substr(0, arrayName.size() - ext.size());
  const Array *symArray = TxShadowArray::getSymbolicArray(value->getName());
  if (symArray != NULL) {
    ref<Expr> Res(0);
    unsigned NumBytes = symArray->getDomain() / 8;
    assert(symArray->getDomain() == NumBytes * 8 && "Invalid read size!");
    for (unsigned i = 0; i != NumBytes; ++i) {
      unsigned idx = Context::get().isLittleEndian() ? i : (NumBytes - i - 1);
      ref<Expr> Byte =
          ReadExpr::create(UpdateList(symArray, 0),
                           ConstantExpr::alloc(idx, symArray->getDomain()));
      Res = i ? ConcatExpr::create(Byte, Res) : Byte;
    }
    wp->storeArrayRef(value, symArray, Res);
    return Res;
  }

  // Todo: only catching the type of integer and pointers
  unsigned int size = 0;
  if (value->getType()->isPointerTy()) {
    size = value->getType()->getArrayElementType()->getIntegerBitWidth();
  } else {
    size = value->getType()->getIntegerBitWidth();
  }
  // Todo: tmpArray object should be reclaimed sometime later
  tmpArray = ac->CreateArray(arrayName, size);
  ref<Expr> tmpExpr = Expr::createTempRead(tmpArray, size);
  wp->storeArrayRef(value, tmpArray, tmpExpr);
  return tmpExpr;
}

ref<Expr> TxDependency::getLatestValueOfAddress(
    llvm::Value *value, const std::vector<llvm::Instruction *> &callHistory) {
    
  bool allowInconsistency = true;
  ref<Expr> dummy = ConstantExpr::create(0, Expr::Bool);

  ref<TxStateValue> addressValue =
      this->getLatestValue(value, callHistory, dummy, allowInconsistency);

  if (addressValue.isNull())
    return dummy;
  ref<TxStateAddress> address = addressValue->getPointerInfo();
  if (address.isNull())
    klee_error("Dependency::getLatestValueOfAddress Address is null");
  ref<TxStoreEntry> entry = store->find(address);
  if (entry.isNull())
    klee_error("Dependency::getLatestValueOfAddress No entry found");
  return entry->getContent()->getExpression();
}

ref<TxStateValue> TxDependency::getLatestValue(
    llvm::Value *value, const std::vector<llvm::Instruction *> &callHistory,
    ref<Expr> valueExpr, bool allowInconsistency) {
  assert(value && !valueExpr.isNull() && "value cannot be null");

  ref<TxStateValue> ret;

  if (llvm::Constant *c = llvm::dyn_cast<llvm::Constant>(value)) {
    ret = evalConstant(c, callHistory);
  } else {
    ret = getLatestValueNoConstantCheck(value, valueExpr, allowInconsistency);
  }

  return ret;
}

ref<TxStateValue> TxDependency::getLatestValueNoConstantCheck(
    llvm::Value *value, ref<Expr> valueExpr, bool allowInconsistency) const {
  assert(value && "value cannot be null");

  std::map<llvm::Value *, std::vector<ref<TxStateValue> > >::const_iterator
  valuesMapIter = valuesMap.find(value);

  if (valuesMapIter != valuesMap.end()) {
    if (!valueExpr.isNull()) {
      // Slight complication here that the latest version of an LLVM
      // value may not be at the end of the vector; it is possible other
      // values in a call stack has been appended to the vector, before
      // the function returned, so the end part of the vector contains
      // local values in a call already returned. To resolve this issue,
      // here we naively search for values with equivalent expression.
      const std::vector<ref<TxStateValue> > &allValues = valuesMapIter->second;

      // In case this was for adding constraints, simply assume the
      // latest value is the one without checking for its consistency. This is
      // due to the difficulty in that the constraint in valueExpr is already
      // processed into a different syntax (a negation of the original value).
      if (allowInconsistency)
        return allValues.back();

      for (std::vector<ref<TxStateValue> >::const_reverse_iterator
               it = allValues.rbegin(),
               ie = allValues.rend();
           it != ie; ++it) {
        ref<Expr> e = (*it)->getExpression();
        if (e == valueExpr)
          return *it;
      }
    } else {
      return valuesMapIter->second.back();
    }
  }

  if (parent)
    return parent->getLatestValueNoConstantCheck(value, valueExpr,
                                                 allowInconsistency);

  return 0;
}

ref<TxStateValue> TxDependency::getLatestValueForMarking(llvm::Value *val,
                                                         ref<Expr> expr) {
  ref<TxStateValue> value = getLatestValueNoConstantCheck(val, expr);

  // Right now we simply ignore the __dso_handle values. They are due
  // to library / linking errors caused by missing options (-shared) in the
  // compilation involving shared library.
  if (value.isNull()) {
    if (llvm::ConstantExpr *cVal = llvm::dyn_cast<llvm::ConstantExpr>(val)) {
      for (unsigned i = 0; i < cVal->getNumOperands(); ++i) {
        if (cVal->getOperand(i)->getName().equals("__dso_handle")) {
          return value;
        }
      }
    }

    if (llvm::isa<llvm::Constant>(val))
      return value;

    assert(!"unknown value");
  }
  return value;
}

void TxDependency::addDependency(ref<TxStateValue> source,
                                 ref<TxStateValue> target) {
  if (source.isNull() || target.isNull())
    return;

  addDependencyOfPossiblePointer(source, target);
}

void TxDependency::addTwoDependencies(ref<TxStateValue> source1,
                                      ref<TxStateValue> source2,
                                      ref<TxStateValue> target) {
  if (source1.isNull() || source2.isNull() || target.isNull())
    return;

  unsigned locCount1 = !source1->isPointer();
  unsigned locCount2 = !source2->isPointer();

  if (locCount1 + locCount2 == 0 || locCount1 + locCount2 == 2) {
    // Both sources are pointers, the result is non-pointer
    addDependencyToNonPointer(source1, target);
    addDependencyToNonPointer(source2, target);
  } else if (locCount1 == 1) {
    addDependencyToNonPointer(source1, target);
    addDependencyOfPossiblePointer(source2, target);
  } else {
    addDependencyOfPossiblePointer(source1, target);
    addDependencyToNonPointer(source2, target);
  }
}

void TxDependency::addDependencyOfPossiblePointer(ref<TxStateValue> source,
                                                  ref<TxStateValue> target) {
  if (source.isNull() || target.isNull())
    return;

  if (source->isPointer()) {
    ref<TxStateAddress> pointerInfo = source->getPointerInfo();
    ref<Expr> targetExpr(ZExtExpr::create(target->getExpression(),
                                          Context::get().getPointerWidth()));
    ref<Expr> sourceBase(pointerInfo->getBase());
    ref<Expr> offsetDelta(SubExpr::create(
        SubExpr::create(targetExpr, sourceBase), pointerInfo->getOffset()));
    target->addPointerInfo(
        TxStateAddress::create(pointerInfo, targetExpr, offsetDelta));
  }
  target->addDependency(source);
}

void TxDependency::addDependencyWithOffset(ref<TxStateValue> source,
                                           ref<TxStateValue> target,
                                           ref<Expr> offsetDelta) {
  if (source.isNull() || target.isNull())
    return;

  ConstantExpr *de = llvm::dyn_cast<ConstantExpr>(offsetDelta);
  uint64_t d = de ? de->getZExtValue() : 0;

  // Do not build dependency when the index is negative. Tracer-X does not
  // support negative indexing.
  if (d > LLONG_MAX)
    return;

  ref<TxStateAddress> pointerInfo = source->getPointerInfo();
  ref<Expr> targetExpr(target->getExpression());

  ConstantExpr *ce = llvm::dyn_cast<ConstantExpr>(targetExpr);
  uint64_t a = ce ? ce->getZExtValue() : 0;

  ConstantExpr *be = llvm::dyn_cast<ConstantExpr>(pointerInfo->getBase());
  uint64_t b = be ? be->getZExtValue() : 0;

  ConstantExpr *oe = llvm::dyn_cast<ConstantExpr>(pointerInfo->getOffset());
  uint64_t o = (oe ? oe->getZExtValue() : 0) + d;

  // The following if conditional implements a mechanism to
  // only add memory locations that make sense; that is, when
  // the offset is address minus base
  if (!(ce && de && be && oe && o != (a - b) && (b != 0))) {
    target->addPointerInfo(
        TxStateAddress::create(pointerInfo, targetExpr, offsetDelta));
  }

  target->addDependency(source);
}

void TxDependency::addDependencyViaExternalFunction(
    const std::vector<llvm::Instruction *> &callHistory,
    ref<TxStateValue> source, ref<TxStateValue> target) {
  if (source.isNull() || target.isNull())
    return;

  if (source->isPointer()) {
    std::string reason = "";
    if (debugSubsumptionLevel >= 1) {
      llvm::raw_string_ostream stream(reason);
      stream << "parameter [";
      source->getValue()->print(stream);
      stream << "] of external call [";
      target->getValue()->print(stream);
      stream << "]";
      stream.flush();
    }
    store->markPointerFlow(source, source, reason);
  }

  // Add new location to the target in case of pointer return value
  llvm::Type *t = target->getValue()->getType();
  if (t->isPointerTy() && !target->isPointer()) {
    uint64_t size = 0;
    ref<Expr> address(target->getExpression());

    llvm::Type *elementType = t->getPointerElementType();
    if (elementType->isSized()) {
      size = targetData->getTypeStoreSize(elementType);
    }

    target->addPointerInfo(
        TxStateAddress::create(target->getValue(), callHistory, address, size));
  }

  addDependencyToNonPointer(source, target);
}

void TxDependency::addDependencyToNonPointer(ref<TxStateValue> source,
                                             ref<TxStateValue> target) {
  if (source.isNull() || target.isNull())
    return;

  target->addDependency(source);
}

void TxDependency::populateArgumentValuesList(
    llvm::CallInst *site, const std::vector<llvm::Instruction *> &callHistory,
    std::vector<ref<Expr> > &arguments,
    std::vector<ref<TxStateValue> > &argumentValuesList) {
  unsigned numArgs = site->getCalledFunction()->arg_size();
  for (unsigned i = numArgs; i > 0;) {
    llvm::Value *argOperand = site->getArgOperand(--i);
    ref<TxStateValue> latestValue =
        getLatestValue(argOperand, callHistory, arguments.at(i));

    if (!latestValue.isNull())
      argumentValuesList.push_back(latestValue);
    else {
      // This is for the case when latestValue was NULL, which means there is
      // no source dependency information for this node, e.g., a constant.
      argumentValuesList.push_back(TxStateValue::create(
          store->getDepth(), argOperand, callHistory, arguments[i]));
    }
  }
}

TxDependency::TxDependency(
    TxDependency *parent, llvm::DataLayout *_targetData,
    std::map<const llvm::GlobalValue *, ref<ConstantExpr> > *_globalAddresses)
    : parent(parent), left(0), right(0), targetData(_targetData),
      globalAddresses(_globalAddresses) {
  if (parent) {
    pathCondition = TxPathCondition::create(parent->pathCondition);
    store = TxStore::create(parent->store);
    debugSubsumptionLevel = parent->debugSubsumptionLevel;
    debugStateLevel = parent->debugStateLevel;
  } else {
    pathCondition = TxPathCondition::create(0);
    store = TxStore::create(0);
#ifdef ENABLE_Z3
    debugSubsumptionLevel = DebugSubsumption;
    debugStateLevel = DebugState;
#else
    debugSubsumptionLevel = 0;
    debugStateLevel = 0;
#endif
  }
}

TxDependency::~TxDependency() {
  // Delete valuesMap
  for (std::map<llvm::Value *, std::vector<ref<TxStateValue> > >::iterator
           it = valuesMap.begin(),
           ie = valuesMap.end();
       it != ie; ++it) {
    it->second.clear();
  }
  delete pathCondition;
  delete store;
  valuesMap.clear();
}

TxDependency *TxDependency::cdr() const { return parent; }

void TxDependency::execute(llvm::Instruction *instr,
                           const std::vector<llvm::Instruction *> &callHistory,
                           std::vector<ref<Expr> > &args,
                           bool symbolicExecutionError) {
  // The basic design principle that we need to be careful here
  // is that we should not store quadratic-sized structures in
  // the database of computed relations, e.g., not storing the
  // result of traversals of the graph. We keep the
  // quadratic blow up for only when querying the database.

  if (llvm::isa<llvm::CallInst>(instr)) {
    llvm::CallInst *callInst = llvm::dyn_cast<llvm::CallInst>(instr);
    llvm::Function *f = callInst->getCalledFunction();

    if (!f) {
      // Handles the case when the callee is wrapped within another expression
      llvm::ConstantExpr *calledValue =
          llvm::dyn_cast<llvm::ConstantExpr>(callInst->getCalledValue());
      if (calledValue && calledValue->getOperand(0)) {
        f = llvm::dyn_cast<llvm::Function>(calledValue->getOperand(0));
      }
    }

    if (f && f->getIntrinsicID() == llvm::Intrinsic::not_intrinsic) {
      llvm::StringRef calleeName = f->getName();
      // FIXME: We need a more precise way to determine invoked method
      // rather than just using the name.
      std::string getValuePrefix("klee_get_value");

      if (calleeName.equals("_Znwm") || calleeName.equals("_Znam")) {
        ConstantExpr *sizeExpr = llvm::dyn_cast<ConstantExpr>(args.at(1));
        getNewPointerValue(instr, callHistory, args.at(0),
                           sizeExpr->getZExtValue());
      } else if ((calleeName.equals("getpagesize") && args.size() == 1) ||
                 (calleeName.equals("ioctl") && args.size() == 4) ||
                 (calleeName.equals("__ctype_b_loc") && args.size() == 1) ||
                 (calleeName.equals("__ctype_b_locargs") && args.size() == 1) ||
                 calleeName.equals("puts") || calleeName.equals("fflush") ||
                 calleeName.equals("strcmp") || calleeName.equals("strncmp") ||
                 (calleeName.equals("__errno_location") && args.size() == 1) ||
                 (calleeName.equals("geteuid") && args.size() == 1)) {
        getNewTxStateValue(instr, callHistory, args.at(0));
      } else if (calleeName.equals("_ZNSi5seekgElSt12_Ios_Seekdir") &&
                 args.size() == 4) {
        ref<TxStateValue> returnValue =
            getNewTxStateValue(instr, callHistory, args.at(0));
        for (unsigned i = 0; i < 3; ++i) {
          addDependencyViaExternalFunction(
              callHistory,
              getLatestValue(instr->getOperand(i), callHistory, args.at(i + 1)),
              returnValue);
        }
      } else if (calleeName.equals(
                     "_ZNSt13basic_fstreamIcSt11char_traitsIcEE7is_openEv") &&
                 args.size() == 2) {
        addDependencyViaExternalFunction(
            callHistory,
            getLatestValue(instr->getOperand(0), callHistory, args.at(1)),
            getNewTxStateValue(instr, callHistory, args.at(0)));
      } else if (calleeName.equals("_ZNSi5tellgEv") && args.size() == 2) {
        addDependencyViaExternalFunction(
            callHistory,
            getLatestValue(instr->getOperand(0), callHistory, args.at(1)),
            getNewTxStateValue(instr, callHistory, args.at(0)));
      } else if ((calleeName.equals("powl") && args.size() == 3) ||
                 (calleeName.equals("gettimeofday") && args.size() == 3)) {
        ref<TxStateValue> returnValue =
            getNewTxStateValue(instr, callHistory, args.at(0));
        for (unsigned i = 0; i < 2; ++i) {
          addDependencyViaExternalFunction(
              callHistory,
              getLatestValue(instr->getOperand(i), callHistory, args.at(i + 1)),
              returnValue);
        }
      } else if (calleeName.equals("malloc") && args.size() == 1) {
        // malloc is an location-type instruction. This is for the case when the
        // allocation size is unknown (0), so the
        // single argument here is the return address, for which KLEE provides
        // 0.
        getNewPointerValue(instr, callHistory, args.at(0), 0);
      } else if (calleeName.equals("malloc") && args.size() == 2) {
        // malloc is an location-type instruction. This is the case when it has
        // a determined size
        uint64_t size = 0;
        if (ConstantExpr *ce = llvm::dyn_cast<ConstantExpr>(args.at(1)))
          size = ce->getZExtValue();
        getNewPointerValue(instr, callHistory, args.at(0), size);
      } else if (calleeName.equals("realloc") && args.size() == 1) {
        // realloc is an location-type instruction: its single argument is the
        // return address.
        addDependency(
            getLatestValue(instr->getOperand(0), callHistory, args.at(0)),
            getNewTxStateValue(instr, callHistory, args.at(0)));
      } else if (calleeName.equals("calloc") && args.size() == 1) {
        // calloc is a location-type instruction: its single argument is the
        // return address. We assume its allocation size is unknown
        getNewPointerValue(instr, callHistory, args.at(0), 0);
      } else if (calleeName.equals("syscall") && args.size() >= 2) {
        ref<TxStateValue> returnValue =
            getNewTxStateValue(instr, callHistory, args.at(0));
        for (unsigned i = 0; i + 1 < args.size(); ++i) {
          addDependencyViaExternalFunction(
              callHistory,
              getLatestValue(instr->getOperand(i), callHistory, args.at(i + 1)),
              returnValue);
        }
      } else if (std::mismatch(getValuePrefix.begin(), getValuePrefix.end(),
                               calleeName.begin()).first ==
                     getValuePrefix.end() &&
                 args.size() == 2) {
        addDependencyViaExternalFunction(
            callHistory,
            getLatestValue(instr->getOperand(0), callHistory, args.at(1)),
            getNewTxStateValue(instr, callHistory, args.at(0)));
      } else if (calleeName.equals("getenv") && args.size() == 2) {
        // We assume getenv has unknown allocation size
        getNewPointerValue(instr, callHistory, args.at(0), 0);
      } else if (calleeName.equals("printf") && args.size() >= 2) {
        ref<TxStateValue> returnValue =
            getNewTxStateValue(instr, callHistory, args.at(0));
        addDependencyViaExternalFunction(
            callHistory,
            getLatestValue(instr->getOperand(0), callHistory, args.at(1)),
            returnValue);
        for (unsigned i = 2, argsNum = args.size(); i < argsNum; ++i) {
          addDependencyViaExternalFunction(
              callHistory,
              getLatestValue(instr->getOperand(i - 1), callHistory, args.at(i)),
              returnValue);
        }
      } else if (calleeName.equals("vprintf") && args.size() == 3) {
        ref<TxStateValue> returnValue =
            getNewTxStateValue(instr, callHistory, args.at(0));
        addDependencyViaExternalFunction(
            callHistory,
            getLatestValue(instr->getOperand(0), callHistory, args.at(1)),
            returnValue);
        addDependencyViaExternalFunction(
            callHistory,
            getLatestValue(instr->getOperand(1), callHistory, args.at(2)),
            returnValue);
      } else if (((calleeName.equals("fchmodat") && args.size() == 5)) ||
                 (calleeName.equals("fchownat") && args.size() == 6)) {
        ref<TxStateValue> returnValue =
            getNewTxStateValue(instr, callHistory, args.at(0));
        for (unsigned i = 0; i < 2; ++i) {
          addDependencyViaExternalFunction(
              callHistory,
              getLatestValue(instr->getOperand(i), callHistory, args.at(i + 1)),
              returnValue);
        }
      } else {
        // Default external function handler: We ignore functions that return
        // void, and we DO NOT build dependency of return value to the
        // arguments.
        if (!instr->getType()->isVoidTy()) {
          assert(args.size() && "non-void call missing return expression");
          klee_warning("using default handler for external function %s",
                       calleeName.str().c_str());
          getNewTxStateValue(instr, callHistory, args.at(0));
        }
      }
    }
    return;
  }

  switch (args.size()) {
  case 0: {
    switch (instr->getOpcode()) {
    case llvm::Instruction::Br: {
      llvm::BranchInst *binst = llvm::dyn_cast<llvm::BranchInst>(instr);
      if (binst && binst->isConditional()) {
        ref<Expr> unknownExpression;
        std::string reason = "";
        if (debugSubsumptionLevel >= 1) {
          llvm::raw_string_ostream stream(reason);
          stream << "branch instruction [";
          if (binst->getParent()->getParent()) {
            stream << binst->getParent()->getParent()->getName().str() << ": ";
          }
          if (llvm::MDNode *n = binst->getMetadata("dbg")) {
            llvm::DILocation loc(n);
            stream << "Line " << loc.getLineNumber();
          } else {
            binst->print(stream);
          }
          stream << "]";
          stream.flush();
        }
        markAllValues(binst->getCondition(), unknownExpression, reason);
      }
      break;
    }
    default:
      break;
    }
    return;
  }
  case 1: {
    ref<Expr> argExpr = args.at(0);

    switch (instr->getOpcode()) {
    case llvm::Instruction::BitCast: {
      ref<TxStateValue> val =
          getLatestValue(instr->getOperand(0), callHistory, argExpr);

      if (!val.isNull()) {
        addDependency(val, getNewTxStateValue(instr, callHistory, argExpr));
      } else if (!llvm::isa<llvm::Constant>(instr->getOperand(0)))
          // Constants would kill dependencies, the remaining is for
          // cases that may actually require dependencies.
      {
        if (instr->getOperand(0)->getType()->isPointerTy()) {
          uint64_t size = targetData->getTypeStoreSize(
              instr->getOperand(0)->getType()->getPointerElementType());
          addDependency(getNewPointerValue(instr->getOperand(0), callHistory,
                                           argExpr, size),
                        getNewTxStateValue(instr, callHistory, argExpr));
        } else if (llvm::isa<llvm::Argument>(instr->getOperand(0)) ||
                   llvm::isa<llvm::CallInst>(instr->getOperand(0)) ||
                   symbolicExecutionError) {
          addDependency(
              getNewTxStateValue(instr->getOperand(0), callHistory, argExpr),
              getNewTxStateValue(instr, callHistory, argExpr));
        } else {
          assert(!"operand not found");
        }
      }
      break;
    }
    case llvm::Instruction::Switch: {
      // This handles only the case when the switch argument can be reduced to a
      // constant. Here we interpolate since a constant switch argument means
      // that there are infeasible branches.

      std::string reason = "";
      if (debugSubsumptionLevel > 1) {
        llvm::raw_string_ostream stream(reason);
        stream << "infeasible switch case [";
        stream << instr->getParent()->getParent()->getName().str() << ": ";
        if (llvm::MDNode *n = instr->getMetadata("dbg")) {
          llvm::DILocation loc(n);
          stream << "Line " << loc.getLineNumber();
        }
        stream << "]";
        stream.flush();
      }
      markAllValues(instr->getOperand(0), argExpr, reason);
      break;
    }
    default: { assert(!"unhandled unary instruction"); }
    }
    return;
  }
  case 2: {
    ref<Expr> valueExpr = args.at(0);
    ref<Expr> address = args.at(1);

    switch (instr->getOpcode()) {
    case llvm::Instruction::Alloca: {
      // In case of alloca, the valueExpr is the address, and address is the
      // allocation size.
      uint64_t size = 0;
      if (ConstantExpr *ce = llvm::dyn_cast<ConstantExpr>(address)) {
        size = ce->getZExtValue();
      }
      getNewPointerValue(instr, callHistory, valueExpr, size);
      break;
    }
    case llvm::Instruction::Load: {
      ref<TxStateValue> addressValue =
          getLatestValue(instr->getOperand(0), callHistory, address);
      llvm::Type *loadedType =
          instr->getOperand(0)->getType()->getPointerElementType();

      if (!addressValue.isNull()) {
        if (!addressValue->isPointer()) {
          // The size of the allocation is unknown here as the memory region
          // might have been allocated by the environment
          ref<TxStateAddress> loc = TxStateAddress::create(
              instr->getOperand(0), callHistory, address, 0);
          addressValue->addPointerInfo(loc);

          // Build the loaded value
          ref<TxStateValue> loadedValue =
              loadedType->isPointerTy()
                  ? getNewPointerValue(instr, callHistory, valueExpr, 0)
                  : getNewTxStateValue(instr, callHistory, valueExpr);

          store->updateStoreWithLoadedValue(valuesMap, loc, addressValue,
                                            loadedValue);
          break;
        } else {
          ref<TxStateAddress> pointerInfo = addressValue->getPointerInfo();
          // Check the possible mismatch between Tracer-X and KLEE loaded value
          ref<TxStoreEntry> target = store->find(pointerInfo);

          if (!target.isNull() && valueExpr != target->getExpression()) {
            // Print a warning when the expressions mismatch, unless when the
            // expression comes from klee_make_symbolic in a loop, as the
            // expected expression recorded in Tracer-X shadow memory may be
            // outdated, and the expression that comes from KLEE is the updated
            // one from klee_make_symbolic.
            llvm::CallInst *ci =
                llvm::dyn_cast<llvm::CallInst>(target->getValue());
            if (ci) {
              // Here we determine if this was a call to klee_make_symbolic from
              // the LLVM source of the call instruction instead of
              // Function::getName(). This is to circumvent segmentation fault
              // issue when the KLEE runtime library is not linked.
              std::string instrSrc;
              llvm::raw_string_ostream s1(instrSrc);
              ci->print(s1);
              s1.flush();
              if (instrSrc.find("klee_make_symbolic") == std::string::npos) {
                std::string msg;
                llvm::raw_string_ostream s2(msg);
                s2 << "Loaded value ";
                target->getExpression()->print(s2);
                s2 << " should be ";
                valueExpr->print(s2);
                s2.flush();
                klee_warning("%s", msg.c_str());
              }
            }
          }

          if (isMainArgument(pointerInfo->getContext()->getValue())) {
            // The load corresponding to a load of the main function's argument
            // that was never allocated within this program.

            // Build the loaded value
            ref<TxStateValue> loadedValue =
                loadedType->isPointerTy()
                    ? getNewPointerValue(instr, callHistory, valueExpr, 0)
                    : getNewTxStateValue(instr, callHistory, valueExpr);

            store->updateStoreWithLoadedValue(valuesMap, pointerInfo,
                                              addressValue, loadedValue);
            break;
          }
        }
      } else {
        // assert(!"loaded allocation size must not be zero");
        addressValue =
            getNewPointerValue(instr->getOperand(0), callHistory, address, 0);

        if (llvm::isa<llvm::GlobalVariable>(instr->getOperand(0))) {
          // Build the loaded value
          ref<TxStateValue> loadedValue =
              loadedType->isPointerTy()
                  ? getNewPointerValue(instr, callHistory, valueExpr, 0)
                  : getNewTxStateValue(instr, callHistory, valueExpr);

          store->updateStoreWithLoadedValue(valuesMap,
                                            addressValue->getPointerInfo(),
                                            addressValue, loadedValue);
          break;
        }
      }

      ref<TxStateAddress> pointerInfo = addressValue->getPointerInfo();

      ref<TxStoreEntry> storeEntry = store->find(pointerInfo);

      if (storeEntry.isNull() || valueExpr != storeEntry->getExpression()) {
        // Build the loaded value
        ref<TxStateValue> loadedValue =
            (storeEntry.isNull() || !storeEntry->isPointer()) &&
                    loadedType->isPointerTy()
                ? getNewPointerValue(instr, callHistory, valueExpr, 0)
                : getNewTxStateValue(instr, callHistory, valueExpr);
        // We could not find the stored value, create a new one.
        store->updateStoreWithLoadedValue(valuesMap, pointerInfo, addressValue,
                                          loadedValue);
      } else {
        // Build the loaded value
        ref<TxStateValue> loadedValue =
            getNewTxStateValue(instr, callHistory, valueExpr);
        addDependency(storeEntry->getContent(), loadedValue);
        loadedValue->resetStoreEntryList();
        loadedValue->addStoreEntry(storeEntry);
        loadedValue->addLoadAddress(addressValue);
        loadedValue->addStoreAddress(storeEntry->getAddressValue());
      }
      break;
    }
    case llvm::Instruction::Store: {
      ref<TxStateValue> storedValue =
          getLatestValue(instr->getOperand(0), callHistory, valueExpr);
      ref<TxStateValue> addressValue =
          getLatestValue(instr->getOperand(1), callHistory, address);

      // If there was no dependency found, we should create
      // a new value
      if (storedValue.isNull())
        storedValue =
            getNewTxStateValue(instr->getOperand(0), callHistory, valueExpr);

      if (addressValue.isNull()) {
        // assert(!"null address");
        addressValue =
            getNewPointerValue(instr->getOperand(1), callHistory, address, 0);
      } else if (!addressValue->isPointer()) {
        if (instr->getOperand(1)->getType()->isPointerTy()) {
          addressValue->addPointerInfo(TxStateAddress::create(
              instr->getOperand(1), callHistory, address, 0));
        } else {
          assert(!"address is not a pointer");
        }
      }

      store->updateStore(valuesMap, addressValue->getPointerInfo(),
                         addressValue, storedValue);
      break;
    }
    case llvm::Instruction::Trunc:
    case llvm::Instruction::ZExt:
    case llvm::Instruction::FPTrunc:
    case llvm::Instruction::FPExt:
    case llvm::Instruction::FPToUI:
    case llvm::Instruction::FPToSI:
    case llvm::Instruction::UIToFP:
    case llvm::Instruction::SIToFP:
    case llvm::Instruction::IntToPtr:
    case llvm::Instruction::PtrToInt:
    case llvm::Instruction::SExt:
    case llvm::Instruction::ExtractValue: {
      ref<Expr> result = args.at(0);
      ref<Expr> argExpr = args.at(1);

      ref<TxStateValue> val =
          getLatestValue(instr->getOperand(0), callHistory, argExpr);

      if (!val.isNull()) {
        if (llvm::isa<llvm::IntToPtrInst>(instr)) {
          if (!val->isPointer()) {
            // 0 signifies unknown allocation size
            addDependencyToNonPointer(
                val, getNewPointerValue(instr, callHistory, result, 0));
          } else {
            addDependencyOfPossiblePointer(
                val, getNewTxStateValue(instr, callHistory, result));
          }
        } else {
          addDependencyToNonPointer(
              val, getNewTxStateValue(instr, callHistory, result));
        }
      } else if (!llvm::isa<llvm::Constant>(instr->getOperand(0)))
          // Constants would kill dependencies, the remaining is for
          // cases that may actually require dependencies.
      {
        if (instr->getOperand(0)->getType()->isPointerTy()) {
          uint64_t size = targetData->getTypeStoreSize(
              instr->getOperand(0)->getType()->getPointerElementType());
          // Here we create normal non-pointer value for the
          // dependency target as it will be properly made a
          // pointer value by addDependency.
          addDependency(getNewPointerValue(instr->getOperand(0), callHistory,
                                           argExpr, size),
                        getNewTxStateValue(instr, callHistory, result));
        } else if (llvm::isa<llvm::Argument>(instr->getOperand(0)) ||
                   llvm::isa<llvm::CallInst>(instr->getOperand(0)) ||
                   symbolicExecutionError) {
          if (llvm::isa<llvm::IntToPtrInst>(instr)) {
            // 0 signifies unknown allocation size
            addDependency(
                getNewTxStateValue(instr->getOperand(0), callHistory, argExpr),
                getNewPointerValue(instr, callHistory, result, 0));
          } else {
            addDependency(
                getNewTxStateValue(instr->getOperand(0), callHistory, argExpr),
                getNewTxStateValue(instr, callHistory, result));
          }
        } else {
          assert(!"operand not found");
        }
      }
      break;
    }
    default: { assert(!"unhandled binary instruction"); }
    }
    return;
  }
  case 3: {
    ref<Expr> result = args.at(0);
    ref<Expr> op1Expr = args.at(1);
    ref<Expr> op2Expr = args.at(2);

    switch (instr->getOpcode()) {
    case llvm::Instruction::Select: {
      ref<TxStateValue> op1 =
          getLatestValue(instr->getOperand(1), callHistory, op1Expr);
      ref<TxStateValue> op2 =
          getLatestValue(instr->getOperand(2), callHistory, op2Expr);
      ref<TxStateValue> newValue =
          getNewTxStateValue(instr, callHistory, result);

      if (result == op1Expr) {
        addDependency(op1, newValue);
      } else if (result == op2Expr) {
        addDependency(op2, newValue);
      } else {
        addTwoDependencies(op1, op2, newValue);
      }
      break;
    }

    case llvm::Instruction::Add:
    case llvm::Instruction::Sub:
    case llvm::Instruction::Mul:
    case llvm::Instruction::UDiv:
    case llvm::Instruction::SDiv:
    case llvm::Instruction::URem:
    case llvm::Instruction::SRem:
    case llvm::Instruction::And:
    case llvm::Instruction::Or:
    case llvm::Instruction::Xor:
    case llvm::Instruction::Shl:
    case llvm::Instruction::LShr:
    case llvm::Instruction::AShr:
    case llvm::Instruction::ICmp:
    case llvm::Instruction::FAdd:
    case llvm::Instruction::FSub:
    case llvm::Instruction::FMul:
    case llvm::Instruction::FDiv:
    case llvm::Instruction::FRem:
    case llvm::Instruction::FCmp:
    case llvm::Instruction::InsertValue: {
      ref<TxStateValue> op1 =
          getLatestValue(instr->getOperand(0), callHistory, op1Expr);
      ref<TxStateValue> op2 =
          getLatestValue(instr->getOperand(1), callHistory, op2Expr);
      ref<TxStateValue> newValue;

      if (op1.isNull() &&
          (instr->getParent()->getParent()->getName().equals("klee_range") &&
           instr->getOperand(0)->getName().equals("start"))) {
        op1 = getNewTxStateValue(instr->getOperand(0), callHistory, op1Expr);
      }
      if (op2.isNull() &&
          (instr->getParent()->getParent()->getName().equals("klee_range") &&
           instr->getOperand(1)->getName().equals("end"))) {
        op2 = getNewTxStateValue(instr->getOperand(1), callHistory, op2Expr);
      }

      if (!op1.isNull() || !op2.isNull()) {
        newValue = getNewTxStateValue(instr, callHistory, result);
        addTwoDependencies(op1, op2, newValue);
      }
      break;
    }
    case llvm::Instruction::GetElementPtr: {
      ref<Expr> resultAddress = args.at(0);
      ref<Expr> inputAddress = args.at(1);
      ref<Expr> inputOffset = args.at(2);

      ref<TxStateValue> addressValue =
          getLatestValue(instr->getOperand(0), callHistory, inputAddress);
      if (addressValue.isNull()) {
        // assert(!"null address");
        addressValue = getNewPointerValue(instr->getOperand(0), callHistory,
                                          inputAddress, 0);
      } else if (!addressValue->isPointer()) {
        // Note that the allocation has unknown size here (0).
        addressValue->addPointerInfo(TxStateAddress::create(
            instr->getOperand(0), callHistory, inputAddress, 0));
      }

      addDependencyWithOffset(
          addressValue, getNewTxStateValue(instr, callHistory, resultAddress),
          inputOffset);
      break;
    }
    default:
      assert(!"unhandled ternary instruction");
    }
    return;
  }
  default:
    break;
  }
  assert(!"unhandled instruction arguments number");
}

void TxDependency::executeMakeSymbolic(
    llvm::Instruction *instr,
    const std::vector<llvm::Instruction *> &callHistory, ref<Expr> address,
    const Array *array) {
  llvm::Value *pointer = instr->getOperand(0);

  ref<TxStateValue> storedValue = getNewTxStateValue(
      instr, callHistory, ConstantExpr::create(0, Expr::Bool));
  ref<TxStateValue> addressValue =
      getLatestValue(pointer, callHistory, address);

  if (addressValue.isNull()) {
    // assert(!"null address");
    addressValue = getNewPointerValue(pointer, callHistory, address, 0);
  } else if (!addressValue->isPointer()) {
    if (pointer->getType()->isPointerTy()) {
      addressValue->addPointerInfo(
          TxStateAddress::create(pointer, callHistory, address, 0));
    } else {
      assert(!"address is not a pointer");
    }
  }

  store->updateStore(valuesMap, addressValue->getPointerInfo(), addressValue,
                     storedValue);
}

void
TxDependency::executePHI(llvm::Instruction *instr, unsigned int incomingBlock,
                         const std::vector<llvm::Instruction *> &callHistory,
                         ref<Expr> valueExpr, bool symbolicExecutionError) {
  llvm::PHINode *node = llvm::dyn_cast<llvm::PHINode>(instr);
  llvm::Value *llvmArgValue = node->getIncomingValue(incomingBlock);
  ref<TxStateValue> val = getLatestValue(llvmArgValue, callHistory, valueExpr);
  if (!val.isNull()) {
    addDependency(val, getNewTxStateValue(instr, callHistory, valueExpr));
  } else if (llvm::isa<llvm::Constant>(llvmArgValue) ||
             llvm::isa<llvm::Argument>(llvmArgValue) ||
             symbolicExecutionError) {
    getNewTxStateValue(instr, callHistory, valueExpr);
  } else {
    assert(!"operand not found");
  }
}

bool TxDependency::executeMemoryOperation(
    llvm::Instruction *instr,
    const std::vector<llvm::Instruction *> &callHistory,
    std::vector<ref<Expr> > &args, bool inBounds, bool symbolicExecutionError) {
  bool ret = false;
  if (inBounds)
    execute(instr, callHistory, args, symbolicExecutionError);
#ifdef ENABLE_Z3
  if (boundInterpolation(instr) && inBounds) {
    // The bounds check has been proven valid, we keep the dependency on the
    // address.
    llvm::Value *addressOperand;
    ref<Expr> address(args.at(1));
    switch (instr->getOpcode()) {
    case llvm::Instruction::Load: {
      addressOperand = instr->getOperand(0);
      break;
    }
    case llvm::Instruction::Store: {
      addressOperand = instr->getOperand(1);
      break;
    }
    default: {
      assert(!"unknown memory operation");
      break;
    }
    }

    ref<TxStateValue> val(getLatestValueForMarking(addressOperand, address));
    if (val->isPointer()) {
      std::string reason = "";
      if (debugSubsumptionLevel > 1) {
        llvm::raw_string_ostream stream(reason);
        stream << "pointer use [";
        stream << instr->getParent()->getParent()->getName().str() << ": ";
        if (llvm::MDNode *n = instr->getMetadata("dbg")) {
          llvm::DILocation loc(n);
          stream << "Line " << loc.getLineNumber();
        }
        stream << "]";
        stream.flush();
      }
      if (ExactAddressInterpolant) {
        markAllValues(val, reason);
      } else {
        ret = markAllPointerValues(val, reason);
        if (ret && !TracerXPointerError) {
          markAllValues(val, reason);
          ret = false;
        }
      }
    }
  }
#endif
  return ret;
}

void
TxDependency::bindCallArguments(llvm::Instruction *i,
                                std::vector<llvm::Instruction *> &callHistory,
                                std::vector<ref<Expr> > &arguments) {
  llvm::CallInst *site = llvm::dyn_cast<llvm::CallInst>(i);

  if (!site)
    return;

  llvm::Function *callee = site->getCalledFunction();

  // Sometimes the callee information is missing, in which case
  // the callee is not to be symbolically tracked.
  if (!callee)
    return;

  argumentValuesList.clear();
  populateArgumentValuesList(site, callHistory, arguments, argumentValuesList);

  unsigned index = 0;
  callHistory.push_back(i);
  for (llvm::Function::ArgumentListType::iterator
           it = callee->getArgumentList().begin(),
           ie = callee->getArgumentList().end();
       it != ie; ++it) {
    if (!argumentValuesList.back().isNull()) {

      addDependency(
          argumentValuesList.back(),
          getNewTxStateValue(it, callHistory,
                             argumentValuesList.back()->getExpression()));
    }
    argumentValuesList.pop_back();
    ++index;
  }
}

void
TxDependency::bindReturnValue(llvm::CallInst *site,
                              std::vector<llvm::Instruction *> &callHistory,
                              llvm::Instruction *i, ref<Expr> returnValue) {
  llvm::ReturnInst *retInst = llvm::dyn_cast<llvm::ReturnInst>(i);
  if (site && retInst &&
      retInst->getReturnValue() // For functions returning void
      ) {
    ref<TxStateValue> value =
        getLatestValue(retInst->getReturnValue(), callHistory, returnValue);
    if (!callHistory.empty()) {
      callHistory.pop_back();
    }
    if (!value.isNull())
      addDependency(value, getNewTxStateValue(site, callHistory, returnValue));
  }
}

void TxDependency::markAllValues(ref<TxStateValue> value,
                                 const std::string &reason) {
  if (value.isNull())
    return;

  store->markFlow(value, reason);

  store->markUsed(value->getAllowBoundEntryList());
  store->markUsed(value->getDisableBoundEntryList());
}

bool TxDependency::markAllPointerValues(ref<TxStateValue> value,
                                        std::set<uint64_t> &bounds,
                                        const std::string &reason) {
  if (value.isNull())
    return false;

  bool ret = store->markPointerFlow(value, value, bounds, reason);

  store->markUsed(value->getAllowBoundEntryList());
  store->markUsed(value->getDisableBoundEntryList());
  return ret;
}

/// \brief Tests if bound interpolation shold be enabled
bool TxDependency::boundInterpolation(llvm::Value *val) {
#ifdef ENABLE_Z3
  if (SpecialFunctionBoundInterpolation) {
    if (!val)
      return true;

    if (llvm::Instruction *instr = llvm::dyn_cast<llvm::Instruction>(val)) {
      if (instr->getParent() && instr->getParent()->getParent() &&
          instr->getParent()->getParent()->getName().str() == "tracerx_check")
        return true;
    }
    return false;
  }
  return true;
#else
  return false;
#endif // ENABLE_Z3
}

void TxDependency::memoryBoundViolationInterpolation(llvm::Instruction *inst,
                                                     ref<Expr> address) {
  // Memory bounds violation with constant address.
  llvm::Value *addressOperand;

  if (!llvm::isa<ConstantExpr>(address))
    return;

  switch (inst->getOpcode()) {
  case llvm::Instruction::Load: {
    addressOperand = inst->getOperand(0);
    break;
  }
  case llvm::Instruction::Store: {
    addressOperand = inst->getOperand(1);
    break;
  }
  default: {
    assert(!"unknown memory operation");
    break;
  }
  }

  ref<TxStateValue> val(getLatestValueForMarking(addressOperand, address));
  if (val->isPointer()) {
    std::string reason = "";
    if (debugSubsumptionLevel > 1) {
      llvm::raw_string_ostream stream(reason);
      stream << "memory bound violation [";
      stream << inst->getParent()->getParent()->getName().str() << ": ";
      if (llvm::MDNode *n = inst->getMetadata("dbg")) {
        llvm::DILocation loc(n);
        stream << "Line " << loc.getLineNumber();
      }
      stream << "]";
      stream.flush();
    }
    markAllValues(val, reason);
  }
}

inline ref<TxStateValue> TxDependency::createConstantValue(
    llvm::Value *value, const std::vector<llvm::Instruction *> &callHistory,
    ref<Expr> expr) {
  if (value->getType()->isPointerTy()) {
    llvm::Type *ty = value->getType()->getPointerElementType();
    uint64_t size = ty->isSized() ? targetData->getTypeStoreSize(ty) : 0;
    return getNewPointerValue(value, callHistory, expr, size);
  }
  return getNewTxStateValue(value, callHistory, expr);
}

ref<TxStateValue> TxDependency::evalConstant(
    llvm::Constant *c, const std::vector<llvm::Instruction *> &callHistory) {
  if (llvm::ConstantExpr *ce = llvm::dyn_cast<llvm::ConstantExpr>(c)) {
    return evalConstantExpr(ce, callHistory);
  } else {
    // We use empty call history for constants, since they are in a sense global
    const std::vector<llvm::Instruction *> emptyCallHistory;

    if (const llvm::ConstantInt *ci = llvm::dyn_cast<llvm::ConstantInt>(c)) {
      return createConstantValue(c, emptyCallHistory,
                                 ConstantExpr::alloc(ci->getValue()));
    } else if (const llvm::ConstantFP *cf =
                   llvm::dyn_cast<llvm::ConstantFP>(c)) {
      return createConstantValue(
          c, emptyCallHistory,
          ConstantExpr::alloc(cf->getValueAPF().bitcastToAPInt()));
    } else if (const llvm::GlobalValue *gv =
                   llvm::dyn_cast<llvm::GlobalValue>(c)) {
      return createConstantValue(c, emptyCallHistory,
                                 globalAddresses->find(gv)->second);
    } else if (llvm::isa<llvm::ConstantPointerNull>(c)) {
      return createConstantValue(c, emptyCallHistory, Expr::createPointer(0));
    } else if (llvm::isa<llvm::UndefValue>(c) ||
               llvm::isa<llvm::ConstantAggregateZero>(c)) {
      return createConstantValue(
          c, emptyCallHistory,
          ConstantExpr::create(0, targetData->getTypeSizeInBits(c->getType())));
#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 1)
    } else if (const llvm::ConstantDataSequential *cds =
                   llvm::dyn_cast<llvm::ConstantDataSequential>(c)) {
      std::vector<ref<Expr> > kids;
      for (unsigned i = 0, e = cds->getNumElements(); i != e; ++i) {
        ref<Expr> kid = evalConstant(cds->getElementAsConstant(i),
                                     emptyCallHistory)->getExpression();
        kids.push_back(kid);
      }
      return createConstantValue(
          c, emptyCallHistory,
          cast<ConstantExpr>(ConcatExpr::createN(kids.size(), kids.data())));
#endif
    } else if (const llvm::ConstantStruct *cs =
                   llvm::dyn_cast<llvm::ConstantStruct>(c)) {
      const llvm::StructLayout *sl = targetData->getStructLayout(cs->getType());
      llvm::SmallVector<ref<Expr>, 4> kids;
      for (unsigned i = cs->getNumOperands(); i != 0; --i) {
        unsigned op = i - 1;
        ref<Expr> kid =
            evalConstant(cs->getOperand(op), emptyCallHistory)->getExpression();

        uint64_t thisOffset = sl->getElementOffsetInBits(op),
                 nextOffset = (op == cs->getNumOperands() - 1)
                                  ? sl->getSizeInBits()
                                  : sl->getElementOffsetInBits(op + 1);
        if (nextOffset - thisOffset > kid->getWidth()) {
          uint64_t paddingWidth = nextOffset - thisOffset - kid->getWidth();
          kids.push_back(ConstantExpr::create(0, paddingWidth));
        }

        kids.push_back(kid);
      }
      return createConstantValue(
          c, emptyCallHistory,
          cast<ConstantExpr>(ConcatExpr::createN(kids.size(), kids.data())));
    } else if (const llvm::ConstantArray *ca =
                   llvm::dyn_cast<llvm::ConstantArray>(c)) {
      llvm::SmallVector<ref<Expr>, 4> kids;
      for (unsigned i = ca->getNumOperands(); i != 0; --i) {
        unsigned op = i - 1;
        ref<Expr> kid =
            evalConstant(ca->getOperand(op), emptyCallHistory)->getExpression();
        kids.push_back(kid);
      }
      return createConstantValue(
          c, emptyCallHistory,
          cast<ConstantExpr>(ConcatExpr::createN(kids.size(), kids.data())));
    } else {
      // Constant{Vector}
      llvm::report_fatal_error("invalid argument to evalConstant()");
    }
  }
}

ref<TxStateValue> TxDependency::evalConstantExpr(
    llvm::ConstantExpr *ce,
    const std::vector<llvm::Instruction *> &callHistory) {
  LLVM_TYPE_Q llvm::Type *type = ce->getType();

  ref<TxStateValue> op1(0), op2(0), op3(0);
  ref<ConstantExpr> op1Expr(0), op2Expr(0), op3Expr(0);

  int numOperands = ce->getNumOperands();

  if (numOperands > 0) {
    op1 = evalConstant(ce->getOperand(0), callHistory);
    op1Expr = cast<ConstantExpr>(op1->getExpression());
  }
  if (numOperands > 1) {
    op2 = evalConstant(ce->getOperand(1), callHistory);
    op2Expr = cast<ConstantExpr>(op2->getExpression());
  }
  if (numOperands > 2) {
    op3 = evalConstant(ce->getOperand(2), callHistory);
    op3Expr = cast<ConstantExpr>(op3->getExpression());
  }

  switch (ce->getOpcode()) {
  default:
    ce->dump();
    llvm::errs() << "error: unknown ConstantExpr type\n"
                 << "opcode: " << ce->getOpcode() << "\n";
    abort();

  case llvm::Instruction::Trunc: {
    ref<Expr> expr = op1Expr->Extract(0, targetData->getTypeSizeInBits(type));
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::ZExt: {
    ref<Expr> expr = op1Expr->ZExt(targetData->getTypeSizeInBits(type));
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::SExt: {
    ref<Expr> expr = op1Expr->SExt(targetData->getTypeSizeInBits(type));
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::Add: {
    ref<Expr> expr = op1Expr->Add(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::Sub: {
    ref<Expr> expr = op1Expr->Sub(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::Mul: {
    ref<Expr> expr = op1Expr->Mul(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::SDiv: {
    ref<Expr> expr = op1Expr->SDiv(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::UDiv: {
    ref<Expr> expr = op1Expr->UDiv(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::SRem: {
    ref<Expr> expr = op1Expr->SRem(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::URem: {
    ref<Expr> expr = op1Expr->URem(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::And: {
    ref<Expr> expr = op1Expr->And(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::Or: {
    ref<Expr> expr = op1Expr->Or(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::Xor: {
    ref<Expr> expr = op1Expr->Xor(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::Shl: {
    ref<Expr> expr = op1Expr->Shl(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::LShr: {
    ref<Expr> expr = op1Expr->LShr(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::AShr: {
    ref<Expr> expr = op1Expr->AShr(op2Expr);
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::BitCast: {
    ref<Expr> expr = op1Expr;
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }

  case llvm::Instruction::IntToPtr: {
    ref<Expr> expr = op1Expr->ZExt(targetData->getTypeSizeInBits(type));
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::PtrToInt: {
    ref<Expr> expr = op1Expr->ZExt(targetData->getTypeSizeInBits(type));
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::GetElementPtr: {
    ref<ConstantExpr> op1Base = op1Expr->ZExt(Context::get().getPointerWidth());
    ref<ConstantExpr> offset =
        ConstantExpr::alloc(0, Context::get().getPointerWidth());

    for (gep_type_iterator ii = gep_type_begin(ce), ie = gep_type_end(ce);
         ii != ie; ++ii) {
      ;
      ref<ConstantExpr> addend =
          ConstantExpr::alloc(0, Context::get().getPointerWidth());

      if (LLVM_TYPE_Q llvm::StructType *st =
              llvm::dyn_cast<llvm::StructType>(*ii)) {
        const llvm::StructLayout *sl = targetData->getStructLayout(st);
        const llvm::ConstantInt *ci = cast<llvm::ConstantInt>(ii.getOperand());

        addend = ConstantExpr::alloc(
            sl->getElementOffset((unsigned)ci->getZExtValue()),
            Context::get().getPointerWidth());
      } else {
        const llvm::SequentialType *set = cast<llvm::SequentialType>(*ii);
        ref<ConstantExpr> index = cast<ConstantExpr>(
            evalConstant(cast<llvm::Constant>(ii.getOperand()), callHistory)
                ->getExpression());
        unsigned elementSize =
            targetData->getTypeStoreSize(set->getElementType());

        index = index->ZExt(Context::get().getPointerWidth());
        addend = index->Mul(
            ConstantExpr::alloc(elementSize, Context::get().getPointerWidth()));
      }

      offset = offset->Add(addend);
      op1Base = op1Base->Add(addend);
    }

    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, op1Base);
    addDependencyWithOffset(op1, ret, offset);
    return ret;
  }

  case llvm::Instruction::ICmp: {
    switch (ce->getPredicate()) {
    default: { assert(0 && "unhandled ICmp predicate"); }
    case llvm::ICmpInst::ICMP_EQ: {
      ref<Expr> expr = op1Expr->Eq(op2Expr);
      ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
      addDependency(op1, ret);
      return ret;
    }
    case llvm::ICmpInst::ICMP_NE: {
      ref<Expr> expr = op1Expr->Ne(op2Expr);
      ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
      addDependency(op1, ret);
      return ret;
    }
    case llvm::ICmpInst::ICMP_UGT: {
      ref<Expr> expr = op1Expr->Ugt(op2Expr);
      ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
      addDependency(op1, ret);
      return ret;
    }
    case llvm::ICmpInst::ICMP_UGE: {
      ref<Expr> expr = op1Expr->Uge(op2Expr);
      ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
      addDependency(op1, ret);
      return ret;
    }
    case llvm::ICmpInst::ICMP_ULT: {
      ref<Expr> expr = op1Expr->Ult(op2Expr);
      ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
      addDependency(op1, ret);
      return ret;
    }
    case llvm::ICmpInst::ICMP_ULE: {
      ref<Expr> expr = op1Expr->Ule(op2Expr);
      ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
      addDependency(op1, ret);
      return ret;
    }
    case llvm::ICmpInst::ICMP_SGT: {
      ref<Expr> expr = op1Expr->Sgt(op2Expr);
      ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
      addDependency(op1, ret);
      return ret;
    }
    case llvm::ICmpInst::ICMP_SGE: {
      ref<Expr> expr = op1Expr->Sge(op2Expr);
      ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
      addDependency(op1, ret);
      return ret;
    }
    case llvm::ICmpInst::ICMP_SLT: {
      ref<Expr> expr = op1Expr->Slt(op2Expr);
      ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
      addDependency(op1, ret);
      return ret;
    }
    case llvm::ICmpInst::ICMP_SLE: {
      ref<Expr> expr = op1Expr->Sle(op2Expr);
      ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
      addDependency(op1, ret);
      return ret;
    }
    }
  }

  case llvm::Instruction::Select: {
    ref<Expr> expr = op1Expr->isTrue() ? op2Expr : op3Expr;
    ref<TxStateValue> ret = getNewTxStateValue(ce, callHistory, expr);
    addDependency(op1, ret);
    return ret;
  }
  case llvm::Instruction::FAdd:
  case llvm::Instruction::FSub:
  case llvm::Instruction::FMul:
  case llvm::Instruction::FDiv:
  case llvm::Instruction::FRem:
  case llvm::Instruction::FPTrunc:
  case llvm::Instruction::FPExt:
  case llvm::Instruction::UIToFP:
  case llvm::Instruction::SIToFP:
  case llvm::Instruction::FPToUI:
  case llvm::Instruction::FPToSI:
  case llvm::Instruction::FCmp: {
    assert(0 && "floating point ConstantExprs unsupported");
  }
  }
}

/// \brief Print the content of the object to the LLVM error stream
void TxDependency::print(llvm::raw_ostream &stream) const {
  this->print(stream, 0);
}

void TxDependency::print(llvm::raw_ostream &stream,
                         const unsigned paddingAmount) const {
  std::string tabs = makeTabs(paddingAmount);

  pathCondition->print(stream, paddingAmount);
  stream << "\n";

  store->print(stream, paddingAmount);

  if (parent) {
    stream << tabs << "\n--------- Parent Dependencies ----------\n";
    parent->print(stream, paddingAmount);
  }
}
}
