//===--- TxValues.h ---------------------------------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the declarations of the classes related to values in the
/// symbolic execution state and interpolant table. Values that belong to the
/// interpolant are versioned such as TxStateAddress, which is distinguished by
/// its base address, and TxStateValue, which is distinguished by its version,
/// and TxStateValue, which is distinguished by its own object id.
///
//===----------------------------------------------------------------------===//

#ifndef KLEE_VERSIONEDVALUE_H
#define KLEE_VERSIONEDVALUE_H

#include "klee/Config/Version.h"
#include "klee/Expr.h"

#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Value.h>
#else
#include <llvm/BasicBlock.h>
#include <llvm/Instruction.h>
#include <llvm/Instructions.h>
#include <llvm/Value.h>
#endif

#include <vector>

namespace klee {

class TxStateAddress;

class TxStateValue;

class TxStoreEntry;

class TxStore;

const uint64_t symbolicBoundId = ULONG_MAX;

class TxAllocationContext {

public:
  unsigned refCount;

private:
  /// \brief The location's LLVM value
  llvm::Value *value;

  /// \brief The call history by which the allocation is reached
  std::vector<llvm::Instruction *> callHistory;

  TxAllocationContext(llvm::Value *_value,
                      const std::vector<llvm::Instruction *> &_callHistory)
      : refCount(0), value(_value), callHistory(_callHistory) {}

public:
  ~TxAllocationContext() { callHistory.clear(); }

  static ref<TxAllocationContext>
  create(llvm::Value *_value,
         const std::vector<llvm::Instruction *> &_callHistory);

  llvm::Value *getValue() const { return value; }

  const std::vector<llvm::Instruction *> &getCallHistory() const {
    return callHistory;
  }

  int compare(const TxAllocationContext &other) const {
    if (value == other.value) {
      // Please note the use of reverse iterator here, which improves
      // performance.
      for (std::vector<llvm::Instruction *>::const_reverse_iterator
               it1 = callHistory.rbegin(),
               ie1 = callHistory.rend(), it2 = other.callHistory.rbegin(),
               ie2 = other.callHistory.rend();
           ; ++it1, ++it2) {
        if (it1 == ie1) {
          if (it2 == ie2) {
            break;
          } else
            return -1;
        }
        if (it2 == ie2)
          return 1;
        if (it1 == ie1)
          return 1;
        if ((*it1) > (*it2))
          return 2;
        if (it2 == ie2)
          return -1;
        if ((*it1) < (*it2))
          return -2;
      }
      return 0;
    } else if (value < other.value) {
      return -3;
    }
    return 3;
  }

  /// \brief Print the content of the object to the LLVM error stream
  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }

  /// \brief Print the content of the object into a stream.
  ///
  /// \param stream The stream to print the data to.
  void print(llvm::raw_ostream &stream) const {
    std::string emptyString;
    print(stream, emptyString);
  }

  /// \brief Print the content of the object into a stream.
  ///
  /// \param stream The stream to print the data to.
  /// \param prefix Padding spaces to print before the actual data.
  void print(llvm::raw_ostream &stream, const std::string &prefix) const;
};

class TxAllocationInfo {
public:
  unsigned refCount;

private:
  ref<TxAllocationContext> context;

  ref<Expr> base;

  uint64_t size;

  TxAllocationInfo(ref<TxAllocationContext> &_context, ref<Expr> _base,
                   uint64_t _size)
      : refCount(0), context(_context), base(_base), size(_size) {}

public:
  ~TxAllocationInfo() {}

  static ref<TxAllocationInfo> create(ref<TxAllocationContext> &context,
                                      ref<Expr> base, uint64_t size) {
    return ref<TxAllocationInfo>(new TxAllocationInfo(context, base, size));
  }

  ref<TxAllocationContext> getContext() { return context; }

  ref<Expr> getBase() { return base; }

  uint64_t getSize() { return size; }

  /// \brief Translate this allocation info into another.
  ///
  /// \param other The other translation info to translate to
  /// \param table The translation table. This table gets updated if this is a
  /// new translation.
  ///
  /// \return true if the translation was successful, false otherwise.
  bool translate(ref<TxAllocationInfo> other,
                 std::map<ref<TxAllocationInfo>, ref<TxAllocationInfo> > &table)
      const;

  int compare(const TxAllocationInfo &other) const;

  /// \brief Print the content of the object to the LLVM error stream
  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }

  /// \brief Print the content of the object into a stream.
  ///
  /// \param stream The stream to print the data to.
  void print(llvm::raw_ostream &stream) const {
    std::string emptyString;
    print(stream, emptyString);
  }

  /// \brief Print the content of the object into a stream.
  ///
  /// \param stream The stream to print the data to.
  /// \param prefix Padding spaces to print before the actual data.
  void print(llvm::raw_ostream &stream, const std::string &prefix) const;
};

/// \brief TxVariable represents a variable. Here a variable is distinct from an
/// address: A variable takes different addresses throughout the execution: it
/// is identified by only allocation site, callsite stack, and an offset. Given
/// a variable, addresses can be ordered according to the time they are
/// associated to the variable, and thus there is a notion of a more / less
/// recent address associated to a variable.
///
/// A variable is also used as the index in the subsumption table: It provides a
/// weaker equality comparison to addresses for the purpose of subsumption
/// checking.
class TxVariable {
public:
  unsigned refCount;

private:
  /// \brief The allocation information of this variable
  ref<TxAllocationInfo> allocInfo;

  /// \brief The offset wrt. the allocation
  ref<Expr> offset;

  /// \brief Indicates concrete address / offset
  bool isConcrete;

  /// \brief The value of the concrete offset
  uint64_t concreteOffset;

  /// \brief The copy constructor.
  TxVariable(const TxVariable &src)
      : refCount(0), allocInfo(src.allocInfo), offset(src.offset),
        isConcrete(src.isConcrete), concreteOffset(src.concreteOffset) {}

  /// \brief The normal constructor.
  TxVariable(ref<TxAllocationInfo> _allocInfo, ref<Expr> _offset)
      : refCount(0), allocInfo(_allocInfo), offset(_offset) {
    isConcrete = false;
    concreteOffset = 0;

    if (ConstantExpr *ce = llvm::dyn_cast<ConstantExpr>(offset)) {
      isConcrete = true;
      concreteOffset = ce->getZExtValue();
    }
  }

public:
  static ref<TxVariable> create(ref<TxAllocationInfo> allocInfo,
                                ref<Expr> offset) {
    ref<TxVariable> ret(new TxVariable(allocInfo, offset));
    return ret;
  }

  ref<TxAllocationInfo> getAllocationInfo() const { return allocInfo; }

  llvm::Value *getValue() const { return allocInfo->getContext()->getValue(); }

  ref<Expr> getBase() const { return allocInfo->getBase(); }

  ref<TxAllocationContext> getContext() const {
    return allocInfo->getContext();
  }

  ref<Expr> getOffset() const { return offset; }

  bool hasConstantAddress() const { return isConcrete; }

  /// \brief The comparator of this class' objects. This member function checks
  /// for the equality of TxInterpolantAddress#indirectionCount member variables
  /// to
  /// match the number of indirections of an address. If the indirection counts
  /// were equal, it performs further comparison. The further comparison is
  /// weaker than standard comparator for TxStateAddress in that it does not
  /// check for the equality of base addresses. Allocation base address is used
  /// in TxStateAddress (member variable TxStateAddress#base) for the purpose of
  /// distinguishing memory allocations of the same callsite and call history,
  /// but of different loop iterations. This does not make sense when comparing
  /// states for subsumption as in subsumption, related allocations in different
  /// paths may have different base addresses.
  int compare(const TxVariable &other) const {
    int res = allocInfo->compare(*(other.allocInfo.get()));
    if (res)
      return res;

    if (offset == other.offset)
      return 0;
    if (isConcrete && other.isConcrete) {
      if (concreteOffset < other.concreteOffset)
        return -1;
      return 1;
    }

    if (offset->hash() < other.offset->hash())
      return -1;

    return 1;
  }

  void print(llvm::raw_ostream &stream) const { print(stream, ""); }

  void print(llvm::raw_ostream &stream, const std::string &prefix) const;

  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }
};

/// \brief A processed form of a value to be stored in the subsumption table
class TxInterpolantValue {
public:
  unsigned refCount;

private:
  ref<Expr> expr;

  /// \brief In case the stored value was a pointer, then this should be a
  /// non-empty map mapping of allocation sites to the set of offset bounds.
  /// This constitutes the weakest liberal precondition of the memory checks
  /// against which the offsets of the pointer values of the current state are
  /// to be checked.
  std::map<ref<TxAllocationInfo>, std::set<uint64_t> > allocationBounds;

  /// \brief In case the stored value was a pointer, then this should be a
  /// non-empty map mapping of allocation sites to the set of offsets. This is
  /// the offset values of the current state to be checked against the offset
  /// bounds.
  std::map<ref<TxAllocationInfo>, std::set<ref<Expr> > > allocationOffsets;

  /// \brief The id of this object
  uint64_t id;

  /// \brief The LLVM value of this object
  llvm::Value *value;

  /// \brief Do not use bound in subsumption check
  bool doNotUseBound;

  /// \brief Reason this was stored as needed value
  std::set<std::string> coreReasons;

  /// \brief The original state value, which is used in subsumption check
  /// interpolation to propagate this value to interpolation marking
  ref<TxStateValue> originalValue;

  void init(llvm::Value *_value, ref<Expr> _expr, bool canInterpolateBound,
            const std::set<std::string> &_coreReasons,
            ref<TxStateAddress> _locations,
            const std::map<ref<Expr>, ref<Expr> > &substitution,
            std::set<const Array *> &replacements, bool shadowing = false);

  TxInterpolantValue(llvm::Value *value, ref<Expr> expr,
                     bool canInterpolateBound,
                     const std::set<std::string> &coreReasons,
                     ref<TxStateAddress> location,
                     const std::map<ref<Expr>, ref<Expr> > &substitution,
                     std::set<const Array *> &replacements) {
    init(value, expr, canInterpolateBound, coreReasons, location, substitution,
         replacements, true);
  }

  TxInterpolantValue(llvm::Value *value, ref<Expr> expr,
                     bool canInterpolateBound,
                     const std::set<std::string> &coreReasons,
                     ref<TxStateAddress> location) {
    const std::map<ref<Expr>, ref<Expr> > dummySubstitution;
    std::set<const Array *> dummyReplacements;
    init(value, expr, canInterpolateBound, coreReasons, location,
         dummySubstitution, dummyReplacements);
  }

public:
  static ref<TxInterpolantValue>
  create(llvm::Value *value, ref<Expr> expr, bool canInterpolateBound,
         const std::set<std::string> &coreReasons, ref<TxStateAddress> location,
         const std::map<ref<Expr>, ref<Expr> > &substitution,
         std::set<const Array *> &replacements) {
    ref<TxInterpolantValue> sv(
        new TxInterpolantValue(value, expr, canInterpolateBound, coreReasons,
                               location, substitution, replacements));
    return sv;
  }

  static ref<TxInterpolantValue> create(llvm::Value *value, ref<Expr> expr,
                                        ref<TxStateAddress> location) {
    std::set<std::string> dummyCoreReasons;
    ref<TxInterpolantValue> sv(
        new TxInterpolantValue(value, expr, false, dummyCoreReasons, location));
    return sv;
  }

  ~TxInterpolantValue() {}

  int compare(const TxInterpolantValue other) const {
    if (id == other.id)
      return 0;
    if (id < other.id)
      return -1;
    return 1;
  }

  bool useBound() const { return !doNotUseBound; }

  bool isPointer() const { return !allocationOffsets.empty(); }

  /// \brief Get bounds check expression.
  ///
  /// \param svalue The value that comes from the program state to be checked
  /// for subsumption.
  /// \param [out] bounds The checked bounds to be used in bounds interpolation.
  /// \param [out] unifiedBases The mapping between base addresses to be
  /// considered the same in subsumption check.
  /// \param debugSubsumptionLevel The verbosity level of debug information
  /// display.
  ///
  /// \return Null expression when a symbolic bound exists in the interpolant,
  /// the bound checking constraint otherwise.
  ref<Expr> getBoundsCheck(
      ref<TxInterpolantValue> svalue, std::set<uint64_t> &bounds,
      std::map<ref<TxAllocationInfo>, ref<TxAllocationInfo> > &unifiedBases,
      int debugSubsumptionLevel) const;

  ref<Expr> getOffsetsCheck(
      ref<TxInterpolantValue> svalue,
      std::map<ref<TxAllocationInfo>, ref<TxAllocationInfo> > &unifiedBases,
      int debugSubsumptionLevel) const;

  ref<Expr> getExpression() const { return expr; }

  void updateExpression(ref<Expr> _expr) { expr = _expr; }

  llvm::Value *getValue() const { return value; }

  void setOriginalValue(ref<TxStateValue> value) { originalValue = value; }

  ref<TxStateValue> getOriginalValue() const { return originalValue; }

  void print(llvm::raw_ostream &stream) const;

  void print(llvm::raw_ostream &stream, const std::string &prefix) const;

  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }
};

/// \brief A class to represent memory locations.
class TxStateAddress {

public:
  unsigned refCount;

private:
  /// \brief This address as a variable, with less information
  ref<TxVariable> variable;

  /// \brief The absolute address
  ref<Expr> address;

  /// \brief This is the concrete offset bound. Its value is
  /// klee::symbolicBoundId in case the bound should be symbolic
  uint64_t concreteOffsetBound;

  /// \brief The size of this allocation (0 means unknown)
  uint64_t size;

  TxStateAddress(ref<TxVariable> _variable, ref<Expr> _address,
                 uint64_t _concreteOffsetBound, uint64_t _size)
      : refCount(0), variable(_variable), address(_address),
        concreteOffsetBound(_concreteOffsetBound), size(_size) {}

  TxStateAddress(ref<TxVariable> _variable, ref<Expr> _address, uint64_t _size)
      : refCount(0), variable(_variable), address(_address),
        concreteOffsetBound(_size), size(_size) {}

  TxStateAddress(ref<TxAllocationContext> _context, ref<Expr> &_address,
                 ref<Expr> &_base, ref<Expr> &_offset, uint64_t _size)
      : refCount(0), concreteOffsetBound(_size), size(_size) {
    bool unknownBase = false;

    if (ConstantExpr *co = llvm::dyn_cast<ConstantExpr>(_offset)) {
      uint64_t concreteOffset = co->getZExtValue();

      if (ConstantExpr *ca = llvm::dyn_cast<ConstantExpr>(_address)) {
        if (ConstantExpr *cb = llvm::dyn_cast<ConstantExpr>(_base)) {
          uint64_t a = ca->getZExtValue();
          uint64_t b = cb->getZExtValue();

          if (b == 0 && a != 0) {
            unknownBase = true;
          } else {
            assert(concreteOffset == (a - b) && "wrong offset");
          }
        }
      }
    }

    Expr::Width pointerWidth = Expr::createPointer(0)->getWidth();
    if (_address->getWidth() < pointerWidth) {
      address = ZExtExpr::create(_address, pointerWidth);
    } else {
      address = _address;
    }

    if (!llvm::isa<ConstantExpr>(address)) {
      concreteOffsetBound = symbolicBoundId;
    }

    ref<TxAllocationInfo> allocInfo;
    if (_base->getWidth() < pointerWidth) {
      allocInfo = TxAllocationInfo::create(
          _context, ZExtExpr::create(_base, pointerWidth), _size);
    } else {
      allocInfo = TxAllocationInfo::create(_context, _base, _size);
    }

    if (unknownBase) {
      ref<Expr> tmpOffset;
      if (_offset->getWidth() < pointerWidth) {
        tmpOffset = ZExtExpr::create(_offset, pointerWidth);
      } else {
        tmpOffset = _offset;
      }
      allocInfo = TxAllocationInfo::create(
          _context, SubExpr::create(address, tmpOffset), _size);
    }

    variable = TxVariable::create(allocInfo, _offset);
  }

public:
  ~TxStateAddress() {}

  static ref<TxStateAddress>
  create(llvm::Value *value,
         const std::vector<llvm::Instruction *> &_callHistory,
         ref<Expr> &address, uint64_t size) {
    ref<Expr> zeroPointer = Expr::createPointer(0);
    ref<TxStateAddress> ret(
        new TxStateAddress(TxAllocationContext::create(value, _callHistory),
                           address, address, zeroPointer, size));
    return ret;
  }

  static ref<TxStateAddress> create(ref<TxStateAddress> loc,
                                    std::set<const Array *> &replacements);

  static ref<TxStateAddress> create(ref<TxStateAddress> loc, ref<Expr> &address,
                                    ref<Expr> &offsetDelta) {
    ConstantExpr *c = llvm::dyn_cast<ConstantExpr>(offsetDelta);
    if (c && c->getZExtValue() == 0) {
      ref<Expr> base = loc->getBase();
      ref<Expr> offset = loc->getOffset();
      ref<TxStateAddress> ret(new TxStateAddress(loc->getContext(), address,
                                                 base, offset, loc->size));
      return ret;
    }

    ref<Expr> base = loc->getBase();
    ref<Expr> newOffset = AddExpr::create(loc->getOffset(), offsetDelta);
    ref<TxStateAddress> ret(new TxStateAddress(loc->getContext(), address, base,
                                               newOffset, loc->size));
    return ret;
  }

  ref<TxVariable> &getAsVariable() { return variable; }

  int compare(const TxStateAddress &other) const {
    int res = variable->compare(*(other.variable.get()));
    if (res)
      return res;

    // FIXME: Should this just be allocInfo == other.allocInfo?
    if (variable->getBase() == other.variable->getBase())
      return 0;

    if (variable->getBase()->hash() < other.variable->getBase()->hash())
      return -3;

    return 3;
  }

  /// \brief Adjust the offset bound for interpolation (a.k.a. slackening).
  /// Returns true if a memory bound violation is detected, and false if not.
  bool adjustOffsetBound(ref<TxStateValue> checkedAddress,
                         std::set<uint64_t> &bounds, bool &boundUpdated);

  bool hasConstantAddress() const { return llvm::isa<ConstantExpr>(address); }

  uint64_t getUIntAddress() const {
    return llvm::dyn_cast<ConstantExpr>(address)->getZExtValue();
  }

  ref<Expr> getAddress() const { return address; }

  ref<Expr> getBase() const { return variable->getBase(); }

  inline bool hasSymbolicOffsetBounds() const;

  ref<TxAllocationContext> getContext() const { return variable->getContext(); }

  ref<TxAllocationInfo> getAllocationInfo() const {
    return variable->getAllocationInfo();
  }

  uint64_t getConcreteOffsetBound() const { return concreteOffsetBound; }

  ref<Expr> getOffset() const { return variable->getOffset(); }

  uint64_t getSize() const { return size; }

  /// \brief Copying function
  ref<TxStateAddress> copy() const {
    ref<TxStateAddress> ret(new TxStateAddress(variable, address, size));
    return ret;
  }

  /// \brief Print the content of the object to the LLVM error stream
  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }

  /// \brief Print the content of the object into a stream.
  ///
  /// \param stream The stream to print the data to.
  void print(llvm::raw_ostream &stream) const {
    std::string emptyString;
    print(stream, emptyString);
  }

  /// \brief Print the content of the object into a stream.
  ///
  /// \param stream The stream to print the data to.
  /// \param prefix Padding spaces to print before the actual data.
  void print(llvm::raw_ostream &stream, const std::string &prefix) const;
};

/// \brief A class that represents LLVM value that can be destructively
/// updated (versioned).
class TxStateValue {
public:
  unsigned refCount;

private:
  llvm::Value *value;

  const ref<Expr> valueExpr;

  /// \brief Set of memory locations possibly being pointed to
  ref<TxStateAddress> pointerInfo;

  /// \brief The id of this object
  uint64_t id;

  /// \brief The context of this value
  std::vector<llvm::Instruction *> callHistory;

  /// \brief Store entries this value is dependent upon, on which memory bound
  /// interpolation may be enabled.
  std::set<ref<TxStoreEntry> > allowBoundEntryList;

  /// \brief Store entries this value is dependent upon, upon which memory bound
  /// interpolation may not be enabled.
  std::set<ref<TxStoreEntry> > disableBoundEntryList;

  /// \brief The creation depth of this value.
  uint64_t depth;

  TxStateValue(llvm::Value *value,
               const std::vector<llvm::Instruction *> &_callHistory,
               ref<Expr> _valueExpr, uint64_t _depth)
      : refCount(0), value(value), valueExpr(_valueExpr),
        id(reinterpret_cast<uint64_t>(this)), callHistory(_callHistory),
        depth(_depth) {}

public:
  ~TxStateValue() {}

  static ref<TxStateValue>
  create(uint64_t depth, llvm::Value *value,
         const std::vector<llvm::Instruction *> &_callHistory,
         ref<Expr> valueExpr) {
    ref<TxStateValue> vvalue(
        new TxStateValue(value, _callHistory, valueExpr, depth));
    return vvalue;
  }

  ref<TxStateValue> copy(uint64_t depth) const {
    ref<TxStateValue> vvalue(
        new TxStateValue(value, callHistory, valueExpr, depth));
    vvalue->allowBoundEntryList = allowBoundEntryList;
    vvalue->disableBoundEntryList = disableBoundEntryList;
    return vvalue;
  }

  uint64_t getDepth() const { return depth; }

  /// \brief Set the address this value was loaded from for inclusion in the
  /// interpolant
  void addLoadAddress(ref<TxStateValue> _loadAddress);

  /// \brief Set the address this value was stored into for inclusion in the
  /// interpolant
  void addStoreAddress(ref<TxStateValue> _storeAddress);

  /// \brief The core routine for adding flow dependency between source and
  /// target value
  void addDependency(ref<TxStateValue> source);

  /// \brief Add the store entry used to store the value used to compute this
  /// value
  void addStoreEntry(ref<TxStoreEntry> entry);

  /// \brief Clear the contents of the list of entries this value was loaded
  /// from
  void resetStoreEntryList() {
    allowBoundEntryList.clear();
    disableBoundEntryList.clear();
  }

  const std::set<ref<TxStoreEntry> > &getAllowBoundEntryList() const;

  const std::set<ref<TxStoreEntry> > &getDisableBoundEntryList() const;

  int compare(const TxStateValue other) const {
    if (id == other.id)
      return 0;
    if (id < other.id)
      return -1;
    return 1;
  }

  void addPointerInfo(ref<TxStateAddress> loc) {
    assert(pointerInfo.isNull() && "location already defined");
    pointerInfo = loc;
  }

  const ref<TxStateAddress> getPointerInfo() const { return pointerInfo; }

  bool isPointer() const { return !pointerInfo.isNull(); }

  ref<Expr> getExpression() const { return valueExpr; }

  llvm::Value *getValue() const { return value; }

  const std::vector<llvm::Instruction *> &getCallHistory() const {
    return callHistory;
  }

  /// \brief Print minimal information about this object.
  ///
  /// \param stream The stream to print the data to.
  void printMinimal(llvm::raw_ostream &stream) const {
    std::string emptyString;
    printMinimal(stream, emptyString);
  }

  /// \brief Print minimal information about this object.
  ///
  /// \param stream The stream to print the data to.
  /// \param prefix Padding spaces to print before the actual data.
  void printMinimal(llvm::raw_ostream &stream, const std::string &prefix) const;

  /// \brief Print the content of the object into a stream
  ///
  /// \param stream The stream to print the data to.
  void print(llvm::raw_ostream &stream) const {
    std::string emptyString;
    print(stream, emptyString);
  }

  /// \brief Print the content of the object into a stream.
  ///
  /// \param stream The stream to print the data to.
  void print(llvm::raw_ostream &stream, const std::string &prefix) const;

  /// \brief Print the content of the object to the LLVM error stream
  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }
};

/// \brief A class for each entry in the store. This class also stores the
/// information for memory bound interpolation. Hence, it has a static (e.g.,
/// TxStoreEntry#value, TxStoreEntry#valueExpr, TxStoreEnty#entryList) as well
/// as a dynamic part (TxStoreEntry#leftPointerInfo,
/// TxStoreEntry#rightPointerInfo,
/// TxStoreEntry#leftDoNotInterpolateBound,
/// TxStoreEntry#rightDoNotInterpolateBound, TxStoreEntry#leftCore,
/// TxStoreEntry#rightCore,
/// TxStoreEntry#leftCoreReasons, TxStoreEntry#rightCoreReasons).
class TxStoreEntry {
public:
  unsigned refCount;

private:
  ref<TxStateAddress> address;

  ref<TxStateValue> addressValue;

  ref<TxStateValue> content;

  /// \brief The creation depth of this entry
  uint64_t depth;

  llvm::Value *value;

  const ref<Expr> valueExpr;

  /// \brief Store entries this value is dependent upon
  std::map<ref<TxStoreEntry>, bool> allowBoundEntryList;

  std::map<ref<TxStoreEntry>, bool> disableBoundEntryList;

  /// \brief Set of memory locations possibly being pointed to, which can be
  /// modified by the subtree of the immediate left child.
  ref<TxStateAddress> leftPointerInfo;

  /// \brief Set of memory locations possibly being pointed to, which can be
  /// modified by the subtree of the immediate right child.
  ref<TxStateAddress> rightPointerInfo;

  /// \brief Flag to ignore bound interpolation, set from the subtree of the
  /// immediate left child.
  bool leftDoNotInterpolateBound;

  /// \brief Flag to ignore bound interpolation, set from the subtree of the
  /// immediate right child.
  bool rightDoNotInterpolateBound;

  /// \brief Member variable to indicate if an interpolant depends on this
  /// value, set from the subtree of the immediate left child.
  bool leftCore;

  /// \brief Member variable to indicate if an interpolant depends on this
  /// value, set from the subtree of the immediate right child.
  bool rightCore;

  /// \brief Reasons for the interpolant marking, from the subtree of the
  /// immediate left child. This is used for debugging.
  std::set<std::string> leftCoreReasons;

  /// \brief Reasons for the interpolant marking, from the subtree of the
  /// immediate right child. This is used for debugging.
  std::set<std::string> rightCoreReasons;

  /// \brief Cached interpolant-style value for left querying in subsumption
  /// check.
  ref<TxInterpolantValue> leftInterpolantStyleValue;

  /// \brief Cached interpolant-style value for right querying in subsumption
  /// check.
  ref<TxInterpolantValue> rightInterpolantStyleValue;

public:
  TxStoreEntry(ref<TxStateAddress> _address, ref<TxStateValue> _addressValue,
               ref<TxStateValue> _content, const TxStore *store,
               uint64_t _depth);

  ~TxStoreEntry() {}

  ref<TxVariable> getIndex() { return address->getAsVariable(); }

  ref<TxStateAddress> getAddress() { return address; }

  ref<TxStateValue> getAddressValue() { return addressValue; }

  ref<TxStateValue> getContent() { return content; }

  llvm::Value *getValue() const { return value; }

  ref<Expr> getExpression() const { return valueExpr; }

  std::map<ref<TxStoreEntry>, bool> &getAllowBoundEntryList() {
    return allowBoundEntryList;
  }

  std::map<ref<TxStoreEntry>, bool> &getDisableBoundEntryList() {
    return disableBoundEntryList;
  }

  ref<TxStateAddress> getPointerInfo(bool leftMarking) const {
    if (leftMarking)
      return leftPointerInfo;
    return rightPointerInfo;
  }

  bool canInterpolateBound(bool leftMarking) const {
    if (leftMarking)
      return !leftDoNotInterpolateBound;
    return !rightDoNotInterpolateBound;
  }

  void disableBoundInterpolation(bool leftMarking) {
    if (leftMarking) {
      leftDoNotInterpolateBound = true;
      return;
    }
    rightDoNotInterpolateBound = true;
  }

  void setAsCore(bool leftMarking, const std::string &reason) {
    if (leftMarking) {
      leftCore = true;
      if (!reason.empty())
        leftCoreReasons.insert(reason);
      return;
    }
    rightCore = true;
    if (!reason.empty())
      rightCoreReasons.insert(reason);
  }

  bool isCore(bool leftMarking) const {
    if (leftMarking)
      return leftCore;
    return rightCore;
  }

  bool isPointer() const { return !leftPointerInfo.isNull(); }

  uint64_t getDepth() { return depth; }

  ref<TxInterpolantValue> getInterpolantStyleValue(bool leftUse) {
    if (leftUse) {
      if (!leftInterpolantStyleValue.get()) {
        leftInterpolantStyleValue =
            TxInterpolantValue::create(value, valueExpr, leftPointerInfo);
        leftInterpolantStyleValue->setOriginalValue(content);
      }
      return leftInterpolantStyleValue;
    }
    if (!rightInterpolantStyleValue.get()) {
      rightInterpolantStyleValue =
          TxInterpolantValue::create(value, valueExpr, rightPointerInfo);
      rightInterpolantStyleValue->setOriginalValue(content);
    }
    return rightInterpolantStyleValue;
  }

  ref<TxInterpolantValue> getInterpolantValue(bool leftUse) const {
    const std::map<ref<Expr>, ref<Expr> > dummySubstitution;
    std::set<const Array *> dummyReplacements;
    return getInterpolantValue(leftUse, dummySubstitution, dummyReplacements);
  }

  ref<TxInterpolantValue>
  getInterpolantValue(bool leftUse,
                      const std::map<ref<Expr>, ref<Expr> > &substitution,
                      std::set<const Array *> &replacements) const {
    if (leftUse) {
      return TxInterpolantValue::create(
          value, valueExpr, !leftDoNotInterpolateBound, leftCoreReasons,
          leftPointerInfo, substitution, replacements);
    }
    return TxInterpolantValue::create(
        value, valueExpr, !rightDoNotInterpolateBound, rightCoreReasons,
        rightPointerInfo, substitution, replacements);
  }

  /// \brief A simple pointer comparison
  int compare(const TxStoreEntry &other) const {
    if (this < &other)
      return -1;
    if (this > &other)
      return 1;
    return 0;
  }

  void dump() const {
    print(llvm::errs());
    llvm::errs() << "\n";
  }

  void print(llvm::raw_ostream &stream) const { print(stream, ""); }

  void print(llvm::raw_ostream &stream, const std::string &prefix) const;
};
}

#endif
