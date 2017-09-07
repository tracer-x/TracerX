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

class AllocationContext {

public:
  unsigned refCount;

private:
  /// \brief The location's LLVM value
  llvm::Value *value;

  /// \brief The call history by which the allocation is reached
  std::vector<llvm::Instruction *> callHistory;

  AllocationContext(llvm::Value *_value,
                    const std::vector<llvm::Instruction *> &_callHistory)
      : refCount(0), value(_value), callHistory(_callHistory) {}

public:
  ~AllocationContext() { callHistory.clear(); }

  static ref<AllocationContext>
  create(llvm::Value *_value,
         const std::vector<llvm::Instruction *> &_callHistory);

  llvm::Value *getValue() const { return value; }

  const std::vector<llvm::Instruction *> &getCallHistory() const {
    return callHistory;
  }

  int compare(const AllocationContext &other) const {
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

class AllocationInfo {
public:
  unsigned refCount;

private:
  ref<AllocationContext> context;

  ref<Expr> base;

  uint64_t size;

  AllocationInfo(ref<AllocationContext> &_context, ref<Expr> _base,
                 uint64_t _size)
      : refCount(0), context(_context), base(_base), size(_size) {}

public:
  ~AllocationInfo() {}

  static ref<AllocationInfo> create(ref<AllocationContext> &context,
                                    ref<Expr> base, uint64_t size) {
    return ref<AllocationInfo>(new AllocationInfo(context, base, size));
  }

  ref<AllocationContext> getContext() { return context; }

  ref<Expr> getBase() { return base; }

  uint64_t getSize() { return size; }

  /// \brief Translate this allocation info into another.
  ///
  /// \param other The other translation info to translate to
  /// \param table The translation table. This table gets updated if this is a
  /// new translation.
  ///
  /// \return true if the translation was successful, false otherwise.
  bool
  translate(ref<AllocationInfo> other,
            std::map<ref<AllocationInfo>, ref<AllocationInfo> > &table) const;

  int compare(const AllocationInfo &other) const;

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
  ref<AllocationInfo> allocInfo;

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
  TxVariable(ref<AllocationInfo> _allocInfo, ref<Expr> _offset)
      : refCount(0), allocInfo(_allocInfo), offset(_offset) {
    isConcrete = false;
    concreteOffset = 0;

    if (ConstantExpr *ce = llvm::dyn_cast<ConstantExpr>(offset)) {
      isConcrete = true;
      concreteOffset = ce->getZExtValue();
    }
  }

public:
  static ref<TxVariable> create(ref<AllocationInfo> allocInfo,
                                ref<Expr> offset) {
    ref<TxVariable> ret(new TxVariable(allocInfo, offset));
    return ret;
  }

  ref<AllocationInfo> getAllocationInfo() const { return allocInfo; }

  llvm::Value *getValue() const { return allocInfo->getContext()->getValue(); }

  ref<Expr> getBase() const { return allocInfo->getBase(); }

  ref<AllocationContext> getContext() const { return allocInfo->getContext(); }

  ref<Expr> getOffset() const { return offset; }

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
  std::map<ref<AllocationInfo>, std::set<ref<Expr> > > allocationBounds;

  /// \brief In case the stored value was a pointer, then this should be a
  /// non-empty map mapping of allocation sites to the set of offsets. This is
  /// the offset values of the current state to be checked against the offset
  /// bounds.
  std::map<ref<AllocationInfo>, std::set<ref<Expr> > > allocationOffsets;

  /// \brief The id of this object
  uint64_t id;

  /// \brief The LLVM value of this object
  llvm::Value *value;

  /// \brief Do not use bound in subsumption check
  bool doNotUseBound;

  /// \brief Reason this was stored as needed value
  std::set<std::string> coreReasons;

  void init(llvm::Value *_value, ref<Expr> _expr, bool canInterpolateBound,
            const std::set<std::string> &_coreReasons,
            const std::set<ref<TxStateAddress> > _locations,
            std::set<const Array *> &replacements, bool shadowing = false);

  TxInterpolantValue(llvm::Value *value, ref<Expr> expr,
                     bool canInterpolateBound,
                     const std::set<std::string> &coreReasons,
                     const std::set<ref<TxStateAddress> > locations,
                     std::set<const Array *> &replacements) {
    init(value, expr, canInterpolateBound, coreReasons, locations, replacements,
         true);
  }

  TxInterpolantValue(llvm::Value *value, ref<Expr> expr,
                     bool canInterpolateBound,
                     const std::set<std::string> &coreReasons,
                     const std::set<ref<TxStateAddress> > locations) {
    std::set<const Array *> dummyReplacements;
    init(value, expr, canInterpolateBound, coreReasons, locations,
         dummyReplacements);
  }

public:
  static ref<TxInterpolantValue>
  create(llvm::Value *value, ref<Expr> expr, bool canInterpolateBound,
         const std::set<std::string> &coreReasons,
         const std::set<ref<TxStateAddress> > locations,
         std::set<const Array *> &replacements) {
    ref<TxInterpolantValue> sv(
        new TxInterpolantValue(value, expr, canInterpolateBound, coreReasons,
                               locations, replacements));
    return sv;
  }

  static ref<TxInterpolantValue>
  create(llvm::Value *value, ref<Expr> expr, bool canInterpolateBound,
         const std::set<std::string> &coreReasons,
         const std::set<ref<TxStateAddress> > locations) {
    ref<TxInterpolantValue> sv(new TxInterpolantValue(
        value, expr, canInterpolateBound, coreReasons, locations));
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

  ref<Expr> getBoundsCheck(
      ref<TxInterpolantValue> svalue, std::set<ref<Expr> > &bounds,
      std::map<ref<AllocationInfo>, ref<AllocationInfo> > &unifiedBases,
      int debugSubsumptionLevel) const;

  ref<Expr> getOffsetsCheck(
      ref<TxInterpolantValue> svalue,
      std::map<ref<AllocationInfo>, ref<AllocationInfo> > &unifiedBases,
      int debugSubsumptionLevel) const;

  ref<Expr> getExpression() const { return expr; }

  llvm::Value *getValue() const { return value; }

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

  /// \brief The expressions representing the bound on the offset, i.e., the
  /// interpolant, in case it is symbolic.
  std::set<ref<Expr> > symbolicOffsetBounds;

  /// \brief This is the concrete offset bound
  uint64_t concreteOffsetBound;

  /// \brief The size of this allocation (0 means unknown)
  uint64_t size;

  TxStateAddress(ref<AllocationContext> _context, ref<Expr> &_address,
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

    ref<AllocationInfo> allocInfo;
    if (_base->getWidth() < pointerWidth) {
      allocInfo = AllocationInfo::create(
          _context, ZExtExpr::create(_base, pointerWidth), _size);
    } else {
      allocInfo = AllocationInfo::create(_context, _base, _size);
    }

    if (unknownBase) {
      ref<Expr> tmpOffset;
      if (_offset->getWidth() < pointerWidth) {
        tmpOffset = ZExtExpr::create(_offset, pointerWidth);
      } else {
        tmpOffset = _offset;
      }
      allocInfo = AllocationInfo::create(
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
        new TxStateAddress(AllocationContext::create(value, _callHistory),
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
                         std::set<ref<Expr> > &bounds, bool &boundUpdated);

  bool hasConstantAddress() const { return llvm::isa<ConstantExpr>(address); }

  uint64_t getUIntAddress() const {
    return llvm::dyn_cast<ConstantExpr>(address)->getZExtValue();
  }

  ref<Expr> getAddress() const { return address; }

  ref<Expr> getBase() const { return variable->getBase(); }

  const std::set<ref<Expr> > &getSymbolicOffsetBounds() const {
    return symbolicOffsetBounds;
  }

  ref<AllocationContext> getContext() const { return variable->getContext(); }

  ref<AllocationInfo> getAllocationInfo() const {
    return variable->getAllocationInfo();
  }

  uint64_t getConcreteOffsetBound() const { return concreteOffsetBound; }

  ref<Expr> getOffset() const { return variable->getOffset(); }

  uint64_t getSize() const { return size; }

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
  std::set<ref<TxStateAddress> > locations;

  /// \brief Member variable to indicate if any unsatisfiability core depends
  /// on this value.
  bool core;

  /// \brief The id of this object
  uint64_t id;

  /// \brief Dependency sources of this value
  std::map<ref<TxStateValue>, ref<TxStateAddress> > sources;

  /// \brief The context of this value
  std::vector<llvm::Instruction *> callHistory;

  /// \brief Do not compute bounds in interpolation of this value if it was a
  /// pointer; instead, use exact address
  bool doNotInterpolateBound;

  /// \brief The load addresses of this value: These are the addresses the loads
  /// that influence this value was executed on
  std::set<ref<TxStateValue> > loadAddresses;

  /// \brief The addresses by which this loaded value was stored
  std::set<ref<TxStateValue> > storeAddresses;

  /// \brief Reasons for this value to be in the core. This may not contain all
  /// the reasons since values are no longer marked if they were already found
  /// to be marked, therefore the reasons are not propagated to all the values
  /// this value is dependent upon.
  std::set<std::string> coreReasons;

  /// \brief Store entries this value is dependent upon
  std::set<ref<TxStoreEntry> > entryList;

  TxStateValue(llvm::Value *value,
               const std::vector<llvm::Instruction *> &_callHistory,
               ref<Expr> _valueExpr)
      : refCount(0), value(value), valueExpr(_valueExpr), core(false),
        id(reinterpret_cast<uint64_t>(this)), callHistory(_callHistory),
        doNotInterpolateBound(false) {}

public:
  ~TxStateValue() { locations.clear(); }

  static ref<TxStateValue>
  create(llvm::Value *value,
         const std::vector<llvm::Instruction *> &_callHistory,
         ref<Expr> valueExpr) {
    ref<TxStateValue> vvalue(new TxStateValue(value, _callHistory, valueExpr));
    return vvalue;
  }

  bool canInterpolateBound() { return !doNotInterpolateBound; }

  void disableBoundInterpolation() { doNotInterpolateBound = true; }

  /// \brief Set the address this value was loaded from for inclusion in the
  /// interpolant
  void addLoadAddress(ref<TxStateValue> _loadAddress);

  std::set<ref<TxStateValue> > &getLoadAddresses() { return loadAddresses; }

  /// \brief Set the address this value was stored into for inclusion in the
  /// interpolant
  void addStoreAddress(ref<TxStateValue> _storeAddress);

  std::set<ref<TxStateValue> > &getStoreAddresses() { return storeAddresses; }

  /// \brief The core routine for adding flow dependency between source and
  /// target value
  void addDependency(ref<TxStateValue> source, ref<TxStateAddress> via);

  /// \brief Add the store entry used to store the value used to compute this
  /// value
  void addStoreEntry(ref<TxStoreEntry> entry);

  /// \brief Clear the contents of the list of entries this value was loaded
  /// from
  void resetStoreEntryList() { entryList.clear(); }

  const std::set<ref<TxStoreEntry> > &getEntryList() const;

  const std::map<ref<TxStateValue>, ref<TxStateAddress> > &getSources() {
    return sources;
  }

  int compare(const TxStateValue other) const {
    if (id == other.id)
      return 0;
    if (id < other.id)
      return -1;
    return 1;
  }

  void addLocation(ref<TxStateAddress> loc) {
    if (locations.find(loc) == locations.end())
      locations.insert(loc);
  }

  const std::set<ref<TxStateAddress> > &getLocations() const {
    return locations;
  }

  bool hasValue(llvm::Value *value) const { return this->value == value; }

  ref<Expr> getExpression() const { return valueExpr; }

  void setAsCore(std::string reason) {
    core = true;
    if (!reason.empty())
      coreReasons.insert(reason);
  }

  bool isCore() const { return core; }

  llvm::Value *getValue() const { return value; }

  const std::vector<llvm::Instruction *> &getCallHistory() const {
    return callHistory;
  }

  const std::set<std::string> &getReasons() const { return coreReasons; }

  ref<TxInterpolantValue> getInterpolantStyleValue() {
    return TxInterpolantValue::create(value, valueExpr, canInterpolateBound(),
                                      coreReasons, locations);
  }

  ref<TxInterpolantValue>
  getInterpolantStyleValue(std::set<const Array *> &replacements) {
    return TxInterpolantValue::create(value, valueExpr, canInterpolateBound(),
                                      coreReasons, locations, replacements);
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

class TxStoreEntry {
public:
  unsigned refCount;

private:
  ref<TxStateAddress> address;

  ref<TxStateValue> addressValue;

  ref<TxStateValue> content;

  /// \brief The creation depth of this entry
  uint64_t depth;

public:
  TxStoreEntry(ref<TxStateAddress> _address, ref<TxStateValue> _addressValue,
               ref<TxStateValue> _content, uint64_t _depth)
      : refCount(0), address(_address), addressValue(_addressValue),
        content(_content), depth(_depth) {}

  ~TxStoreEntry() {}

  ref<TxVariable> getIndex() { return address->getAsVariable(); }

  ref<TxStateAddress> getAddress() { return address; }

  ref<TxStateValue> getAddressValue() { return addressValue; }

  ref<TxStateValue> getContent() { return content; }

  uint64_t getDepth() { return depth; }

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
