//===--- TxDependency.h - Memory location dependency ------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the declarations for the dependency analysis to compute
/// the memory locations upon which the unsatisfiability core depends, which is
/// used in computing the interpolant.
///
//===----------------------------------------------------------------------===//

#ifndef KLEE_DEPENDENCY_H
#define KLEE_DEPENDENCY_H

#include "TxPathCondition.h"
#include "TxStore.h"

#include "klee/Config/Version.h"
#include "klee/Internal/Module/TxValues.h"

#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Value.h>
#else
#include <llvm/Constants.h>
#include <llvm/Function.h>
#include <llvm/Instruction.h>
#include <llvm/Instructions.h>
#include <llvm/Value.h>
#endif

#include "llvm/Support/raw_ostream.h"

#include <vector>

namespace klee {

class WeakestPreCondition;

/// \brief Computation of memory regions the unsatisfiability core depends
/// upon, which is used to compute the interpolant stored in the table.
///
/// <b>Problem Statement</b>
///
/// Memory regions of program states upon which the unsatisfiability
/// core depends need to be computed. These regions are represented
/// neither on the path condition nor the unsatisfiability core,
/// which is just the subset of the path condition. More precisely,
/// at a particular point \f$p\f$ of the symbolic execution, we have
/// a program state that can be represented as \f$x_p\f$, which is a
/// mapping of memory regions (e.g., variables) to their
/// values. Within the KLEE implementation, constraints on the path
/// condition always constrain only the initial symbolic values, for
/// example, the constraint \f$c(f(x_0))\f$, where \f$x_0\f$
/// represents the initial state, and \f$f\f$ (a function with
/// program state as its domain and codomain) represents the state
/// update from the initial state to the point where \f$c\f$ is
/// introduced via e.g., branch condition. The problem here is how
/// to relate \f$c(f(x_0))\f$ with \f$x_p\f$ such the constraints
/// can be used to constrain \f$x_p\f$, which is the state at an
/// arbitrary point \f$p\f$ in the execution.
///
/// <b>Solution</b>
///
/// When \f$g\f$ is a function with program state as its domain and
/// codomain represents all the state updates from the initial state
/// \f$x_0\f$ to the point \f$p\f$, then \f$c(f(x_0))\f$ constrains
/// \f$x_p\f$ in the following way:
/// \f[
/// \exists x_0 ~.~ c(f(x_0)) \wedge x_p = g(x_0)
/// \f]
/// This is indeed the specification of an already-visited
/// intermediate state at stage \f$p\f$ of the execution that can be
/// used to subsume other states. We could store the whole of
/// \f$x_p\f$ as an interpolant, however, we would not gain much
/// subsumptions in this way, as only a subset of \f$x_p\f$ is
/// relevant for \f$c(f(x_0))\f$. Other components of \f$x_p\f$
/// would provide extra constraints that fail subsumption.
///
/// Here we note that the function \f$f\f$ can be composed of
/// functions \f$g\f$ and \f$h\f$ such that \f$f = h \cdot g\f$, and
/// therefore \f$c(f(x_0))\f$ is equivalent to
/// \f$c(h(g(x_0)))\f$. Here, only a subset of \f$g\f$ and \f$h\f$
/// are actually relevant to \f$c\f$. Call these \f$g'\f$ and
/// \f$h'\f$ respectively, where \f$c(h'(g'(x_0)))\f$ is equivalent
/// to \f$c(h(g(x_0)))\f$, and therefore is also equivalent to
/// \f$c(f(x_0))\f$. Now, instead of the above equation, the
/// following alternative provides a specification that constrains
/// only a subset \f$x_p'\f$ of \f$x_p\f$:
/// \f[
/// \exists x_0 ~.~ c(h'(g'(x_0))) \wedge x_p' = g'(x_0)
/// \f]
/// or simply:
/// \f[
/// \exists x_0 ~.~ c(f(x_0)) \wedge x_p' = g'(x_0)
/// \f]
/// The essence of the dependency computation implemented by this
/// class is the computation of the <b>domain</b> of \f$h'\f$, which
/// represents all the mappings relevant to the constraint
/// \f$c(f(x_0))\f$. For this we build \f$h'\f$ utilizing the flow
/// dependency relation from stage \f$p\f$ to the point of
/// introduction of the constraint \f$c(f(x_0))\f$, such that when
/// \f$c(f(x_0))\f$ is found to be in the core, we know which subset
/// \f$x_p'\f$ of \f$x_p\f$ that are relevant based on the computed
/// domain of \f$h'\f$.
///
/// <b>Data Types</b>
///
/// We assume a <i>state</i> to be a mapping of memory
/// locations to the values stored in them. <i>State update</i> is
/// the loading of values from the memory locations, their
/// manipulation, and the subsequent storing of their values into
/// memory locations. The memory dependency computation to compute
/// the domain of \f$h'\f$ is based on shadow data structure with
/// the following main components:
///
/// - The <i>path condition</i> TxDependency#pathCondition. This field
///   maintains all the constraints accumulated through the execution.
///
/// - The <i>store</i> TxDependency#store. This field points to an object of TxStore
///   class. The store is essentially a continer of mappings from addresses to values.
///   The store has two such mappings, depending on whether the address is
///   concrete or is a symbolic expression.
///   Each entry in the mappings represents an element of the mapping.
///   Objects of the following classes are used in a store entry.
///
///   * The TxStateAddress class represents pointers. It is important
///     to note that each pointer is associated with memory allocation
///     and its displacement (offset) wrt. the base address of the
///     allocation.
///
///   * TxStateValue: LLVM values (i.e., variables) with versioning
///     index. This represents the values loaded from memory into LLVM
///     temporary variables. They have versioning index, as, different
///     from LLVM values themselves which are static entities, a
///     (symbolic) execution may go through the same instruction
///     multiple times.
///
/// <b>Notes on Pointer Flow Propagation</b>
///
/// A TxStateValue object may represent a pointer value, in which
/// case it is linked to possibly several TxStateAddress objects via
/// TxStateValue#locations member variable. Such TxStateValue
/// object may be used in memory access operations of LLVM
/// (<b>load</b> or <b>store</b>). The memory dependency computation
/// propagates such pointer value information in TxStateAddress from
/// one TxStateValue to another such that there is no need to
/// inefficiently hunt for the pointer value at the point of use of
/// the pointer. For example, a symbolic execution of LLVM's
/// <b>getelementptr</b> instruction would create a new
/// TxStateValue representing the return value of the
/// instruction. This new TxStateValue would inherit all members
/// of the TxStateValue#locations variable of the TxStateValue
/// object representing the pointer argument of the instruction,
/// with modified offsets according to the offset argument of the
/// instruction.
///
/// \see TxPathCondition
/// \see TxTree
/// \see TxTreeNode
/// \see TxStore
/// \see TxStateValue
/// \see TxStateAddress
class TxDependency {
  /// \brief The path condition manager
  TxPathCondition *pathCondition;

  /// \brief The store
  TxStore *store;

  /// \brief Parent and left and right children of the dependency information
  TxDependency *parent, *left, *right;

  /// \brief Argument values to be passed onto callee
  std::vector<ref<TxStateValue> > argumentValuesList;

  /// \brief The store of the versioned values
  std::map<llvm::Value *, std::vector<ref<TxStateValue> > > valuesMap;

  /// \brief The data layout of the analysis target program
  llvm::DataLayout *targetData;

  /// \brief Map of globals to their bound address. This also includes globals
  /// that have no representative object (i.e. functions). This member
  /// variable is just a pointer to the one in klee::Executor.
  std::map<const llvm::GlobalValue *, ref<ConstantExpr> > *globalAddresses;

  /// \brief Tests if a pointer points to a main function's argument
  static bool isMainArgument(const llvm::Value *loc);

  /// \brief Register new versioned value, used by getNewTxStateValue
  /// member functions
  ref<TxStateValue> registerNewTxStateValue(llvm::Value *value,
                                            ref<TxStateValue> vvalue);

  /// \brief Create a new versioned value object, typically when executing a
  /// new instruction, as a value for the instruction.
  ref<TxStateValue>
  getNewTxStateValue(llvm::Value *value,
                     const std::vector<llvm::Instruction *> &callHistory,
                     ref<Expr> valueExpr) {
    return registerNewTxStateValue(
        value,
        TxStateValue::create(store->getDepth(), value, callHistory, valueExpr));
  }

  /// \brief Create a new versioned value object, which is a pointer with
  /// absolute address
  ref<TxStateValue>
  getNewPointerValue(llvm::Value *loc,
                     const std::vector<llvm::Instruction *> &callHistory,
                     ref<Expr> address, uint64_t size) {
    ref<TxStateValue> vvalue =
        TxStateValue::create(store->getDepth(), loc, callHistory, address);
    vvalue->addPointerInfo(
        TxStateAddress::create(loc, callHistory, address, size));
    return registerNewTxStateValue(loc, vvalue);
  }

  /// \brief Get a KLEE expression from a constant. This was shamelessly
  /// copied from Executor::evalConstant.
  ref<TxStateValue>
  evalConstant(llvm::Constant *c,
               const std::vector<llvm::Instruction *> &callHistory);

  /// \brief Get a KLEE expression from a constant expression. This was
  /// shamelessly copied from Executor::evalConstantExpr.
  ref<TxStateValue>
  evalConstantExpr(llvm::ConstantExpr *ce,
                   const std::vector<llvm::Instruction *> &callHistory);

  /// \brief Gets the latest version of the location, but without checking
  /// for whether the value is constant or not.
  ref<TxStateValue>
  getLatestValueNoConstantCheck(llvm::Value *value, ref<Expr> expr,
                                bool allowInconsistency = false) const;

  /// \brief Find existing value or if not found immediately register a new
  /// one.
  inline ref<TxStateValue>
  createConstantValue(llvm::Value *value,
                      const std::vector<llvm::Instruction *> &callHistory,
                      ref<Expr> expr);

  /// \brief Gets the latest pointer value for marking
  ref<TxStateValue> getLatestValueForMarking(llvm::Value *val, ref<Expr> expr);

  /// \brief Add flow dependency between source and target value
  void addDependency(ref<TxStateValue> source, ref<TxStateValue> target);

  void addTwoDependencies(ref<TxStateValue> source1, ref<TxStateValue> source2,
                          ref<TxStateValue> target);

  /// \brief Add flow dependency between source and target value
  void addDependencyOfPossiblePointer(ref<TxStateValue> source,
                                      ref<TxStateValue> target);

  /// \brief Add flow dependency between source and target pointers, offset by
  /// some amount
  void addDependencyWithOffset(ref<TxStateValue> source,
                               ref<TxStateValue> target, ref<Expr> offsetDelta);

  /// \brief Add a flow dependency from a pointer value to a non-pointer
  /// value, for an external function call.
  ///
  /// Here the target is not a pointer, and we assume that the source is
  /// is checked for memory access validity at the current index, meaning that
  /// we assumed all memory access within the external function is valid.
  void addDependencyViaExternalFunction(
      const std::vector<llvm::Instruction *> &callHistory,
      ref<TxStateValue> source, ref<TxStateValue> target);

  /// \brief Add a flow dependency from a pointer value to a non-pointer
  /// value.
  void addDependencyToNonPointer(ref<TxStateValue> source,
                                 ref<TxStateValue> target);

  /// \brief Record the expressions of a call's arguments
  void populateArgumentValuesList(
      llvm::CallInst *site, const std::vector<llvm::Instruction *> &callHistory,
      std::vector<ref<Expr> > &arguments,
      std::vector<ref<TxStateValue> > &argumentValuesList);

  void getStoredExpressions(
      const TxStore *referenceStore,
      const std::vector<llvm::Instruction *> &callHistory,
      const std::map<ref<Expr>, ref<Expr> > &substitution,
      std::set<const Array *> &replacements, bool coreOnly, bool leftRetrieval,
      TxStore::TopStateStore &__internalStore,
      TxStore::LowerStateStore &__concretelyAddressedHistoricalStore,
      TxStore::LowerStateStore &__symbolicallyAddressedHistoricalStore) {
    store->getStoredExpressions(
        referenceStore, callHistory, substitution, replacements, coreOnly,
        leftRetrieval, __internalStore, __concretelyAddressedHistoricalStore,
        __symbolicallyAddressedHistoricalStore);
  }

  void getStoredCoreExpressions(
      const TxStore *referenceStore,
      const std::vector<llvm::Instruction *> &callHistory,
      const std::map<ref<Expr>, ref<Expr> > &substitution,
      std::set<const Array *> &replacements, bool coreOnly, bool leftRetrieval,
      TxStore::TopInterpolantStore &concretelyAddressedStore,
      TxStore::TopInterpolantStore &symbolicallyAddressedStore,
      TxStore::LowerInterpolantStore &concretelyAddressedHistoricalStore,
      TxStore::LowerInterpolantStore &symbolicallyAddressedHistoricalStore) {
    store->getStoredCoreExpressions(
        referenceStore, callHistory, substitution, replacements, coreOnly,
        leftRetrieval, concretelyAddressedStore, symbolicallyAddressedStore,
        concretelyAddressedHistoricalStore,
        symbolicallyAddressedHistoricalStore);
  }

public:
  /// \brief This is for dynamic setting up of debug messages.
  int debugSubsumptionLevel;

  /// \brief Flag to display debug information on the state.
  uint64_t debugStateLevel;

  TxDependency(TxDependency *parent, llvm::DataLayout *_targetData,
               std::map<const llvm::GlobalValue *, ref<ConstantExpr> > *
                   _globalAddresses);

  ~TxDependency();

  TxDependency *cdr() const;

  /// \brief This retrieves the locations known at this state, and the
  /// expressions stored in the locations. Returns as the last argument a pair
  /// of the store part indexed by constants, and the store part indexed by
  /// symbolic expressions.
  ///
  /// \param callHistory The current call history context of the state
  /// \param replacements The replacement bound variables when
  /// retrieving state for creating subsumption table entry: As the
  /// resulting expression will be used for storing in the
  /// subsumption table, the variables need to be replaced with the
  /// bound ones.
  /// \param coreOnly Indicates whether we are retrieving only data
  /// for locations relevant to an unsatisfiability core.
  /// \param leftRetrieval Whether the retrieval is requested by the left
  /// child of the store, otherwise, we assume it is requested by the right
  /// child of the store.
  /// \param [out] concretelyAddressedStore The output concretely-addressed
  /// store.
  /// \param [out] symbolicallyAddressedStore The output
  /// symbolically-addressed store.
  /// \param [out] concretelyAddressedHistoricalStore The output
  /// concretely-addressed historical store, whose domain consists of
  /// historical concrete addresses that are no longer valid due to exiting of
  /// scope.
  /// \param [out] symbolicallyAddressedHistoricalStore The output
  /// symbolically-addressed historical store, whose domain consists of
  /// historical symbolic addresses that are no longer valid due to exiting of
  /// scope.
  ///
  /// \sa TxStore#getStoredExpressions()
  void getParentStoredExpressions(
      const std::vector<llvm::Instruction *> &callHistory,
      const std::map<ref<Expr>, ref<Expr> > &substitution,
      std::set<const Array *> &replacements, bool coreOnly, bool &leftRetrieval,
      TxStore::TopStateStore &__internalStore,
      TxStore::LowerStateStore &__concretelyAddressedHistoricalStore,
      TxStore::LowerStateStore &__symbolicallyAddressedHistoricalStore) {
    if (parent->left == this)
      leftRetrieval = true;
    else
      assert(parent->right == this && "mismatched tree edge");

    parent->getStoredExpressions(store, callHistory, substitution, replacements,
                                 coreOnly, leftRetrieval, __internalStore,
                                 __concretelyAddressedHistoricalStore,
                                 __symbolicallyAddressedHistoricalStore);
  }

  /// \brief This retrieves the locations known at this state, and the
  /// expressions stored in the locations. Returns as the last argument a pair
  /// of the store part indexed by constants, and the store part indexed by
  /// symbolic expressions.
  ///
  /// \param callHistory The current call history context of the state
  /// \param replacements The replacement bound variables when
  /// retrieving state for creating subsumption table entry: As the
  /// resulting expression will be used for storing in the
  /// subsumption table, the variables need to be replaced with the
  /// bound ones.
  /// \param coreOnly Indicates whether we are retrieving only data
  /// for locations relevant to an unsatisfiability core.
  /// \param leftRetrieval Whether the retrieval is requested by the left
  /// child of the store, otherwise, we assume it is requested by the right
  /// child of the store.
  /// \param [out] concretelyAddressedStore The output concretely-addressed
  /// store.
  /// \param [out] symbolicallyAddressedStore The output
  /// symbolically-addressed store.
  /// \param [out] concretelyAddressedHistoricalStore The output
  /// concretely-addressed historical store, whose domain consists of
  /// historical concrete addresses that are no longer valid due to exiting of
  /// scope.
  /// \param [out] symbolicallyAddressedHistoricalStore The output
  /// symbolically-addressed historical store, whose domain consists of
  /// historical symbolic addresses that are no longer valid due to exiting of
  /// scope.
  ///
  /// \sa TxStore#getStoredExpressions()
  void getParentStoredCoreExpressions(
      const std::vector<llvm::Instruction *> &callHistory,
      const std::map<ref<Expr>, ref<Expr> > &substitution,
      std::set<const Array *> &replacements, bool coreOnly,
      TxStore::TopInterpolantStore &concretelyAddressedStore,
      TxStore::TopInterpolantStore &symbolicallyAddressedStore,
      TxStore::LowerInterpolantStore &concretelyAddressedHistoricalStore,
      TxStore::LowerInterpolantStore &symbolicallyAddressedHistoricalStore) {
    bool leftRetrieval = false;

    if (parent->left == this)
      leftRetrieval = true;
    else
      assert(parent->right == this && "mismatched tree edge");

    parent->getStoredCoreExpressions(
        store, callHistory, substitution, replacements, coreOnly, leftRetrieval,
        concretelyAddressedStore, symbolicallyAddressedStore,
        concretelyAddressedHistoricalStore,
        symbolicallyAddressedHistoricalStore);
  }
  
  // \brief This function is used in WP analysis, in case the variable
  // has no address in the memory (is a register) a temporary array is
  // created for it in the memory
  ref<Expr> getAddress(llvm::Value *value, ArrayCache *ac,
                         const Array *array,
                         WeakestPreCondition *wp);

  // \brief This function is used in WP analysis, where the value is pointing
  // to a pointer type. in case the variable has no address in the memory (is
  // a register) a temporary array is created for it in the memory
  ref<Expr> getPointerAddress(llvm::ConstantExpr *gep, ArrayCache *ac,
                         const Array *tmpArray, WeakestPreCondition *wp);

  // \brief This function is used in WP analysis, it returns the value of an
  // address
  ref<Expr>
  getLatestValueOfAddress(llvm::Value *value,
                         const std::vector<llvm::Instruction *> &callHistory);

  ref<TxStateValue>
  getLatestValue(llvm::Value *value,
                 const std::vector<llvm::Instruction *> &callHistory,
                 ref<Expr> valueExpr, bool allowInconsistency = false);

  /// \brief Abstract dependency state transition with argument(s)
  void execute(llvm::Instruction *instr,
               const std::vector<llvm::Instruction *> &callHistory,
               std::vector<ref<Expr> > &args, bool symbolicExecutionError);

  /// \brief Execution of klee_make_symbolic
  void executeMakeSymbolic(llvm::Instruction *instr,
                           const std::vector<llvm::Instruction *> &callHistory,
                           ref<Expr> address, const Array *array);

  /// \brief Build dependencies from PHI node
  void executePHI(llvm::Instruction *instr, unsigned int incomingBlock,
                  const std::vector<llvm::Instruction *> &callHistory,
                  ref<Expr> valueExpr, bool symbolicExecutionError);

  /// \brief Execute memory operation (load/store). Returns true if memory
  /// bounds violation was detected, false otherwise.
  ///
  /// Calling va_start within a variadic function also triggers memory
  /// operation, but we ignored it here as this method is only called when
  /// load / store instruction is processed.
  bool
  executeMemoryOperation(llvm::Instruction *instr,
                         const std::vector<llvm::Instruction *> &callHistory,
                         std::vector<ref<Expr> > &args, bool inBounds,
                         bool symbolicExecutionError);

  /// \brief Record call arguments in a function call
  void bindCallArguments(llvm::Instruction *instr,
                         std::vector<llvm::Instruction *> &callHistory,
                         std::vector<ref<Expr> > &arguments);

  /// \brief This propagates the dependency due to the return value of a call
  void bindReturnValue(llvm::CallInst *site,
                       std::vector<llvm::Instruction *> &callHistory,
                       llvm::Instruction *inst, ref<Expr> returnValue);

  /// \brief Given an LLVM value and the expression it is associated with,
  /// retrieve all the sources and mark them as in the core
  void markAllValues(llvm::Value *value, ref<Expr> expr,
                     const std::string &reason) {
    ref<TxStateValue> stateValue = getLatestValueForMarking(value, expr);
    markAllValues(stateValue, reason);
  }

  /// \brief Given a state value, retrieve all its sources and mark them as in
  /// the core
  void markAllValues(ref<TxStateValue> value, const std::string &reason);

  /// \brief Given an LLVM value which is used as an address, retrieve all its
  /// sources and mark them as in the core. Returns true if bounds error was
  /// detected; false otherwise.
  bool markAllPointerValues(ref<TxStateValue> value,
                            const std::string &reason) {
    std::set<uint64_t> bounds;
    return markAllPointerValues(value, bounds, reason);
  }

  /// \brief Given an LLVM value which is used as an address, retrieve all its
  /// sources and mark them as in the core. Returns true if bounds error was
  /// detected; false otherwise.
  bool markAllPointerValues(ref<TxStateValue> value, std::set<uint64_t> &bounds,
                            const std::string &reason);

  /// \brief Tests if bound interpolation shold be enabled
  static bool boundInterpolation(llvm::Value *val = 0);

  /// \brief Set the left child
  void setLeftChild(TxDependency *child) {
    left = child;
    pathCondition->setLeftChild(child->pathCondition);
    store->setLeftChild(child->store);
  }

  /// \brief Set the right child
  void setRightChild(TxDependency *child) {
    right = child;
    pathCondition->setRightChild(child->pathCondition);
    store->setRightChild(child->store);
  }

  /// \brief Add constraint onto the path condition
  ref<TxPCConstraint>
  addConstraint(ref<Expr> constraint, llvm::Value *condition,
                std::vector<llvm::Instruction *> &callHistory) {
    return pathCondition->addConstraint(
        constraint, getLatestValue(condition, callHistory, constraint, true));
  }

  /// \brief Retrieve the path condition interpolant
  ref<Expr>
  packInterpolant(std::set<const Array *> &replacements,
                  std::map<ref<Expr>, ref<Expr> > &substitution) const {
    return pathCondition->packInterpolant(replacements, substitution);
  }

  /// \brief Marking the core constraints on the path condition, and all the
  /// relevant values on the dependency graph, given an unsatistiability core.
  void unsatCoreInterpolation(const std::vector<ref<Expr> > &unsatCore) {
    pathCondition->unsatCoreInterpolation(unsatCore);
  }

  /// \brief Interpolation for memory bound violation
  void memoryBoundViolationInterpolation(llvm::Instruction *inst,
                                         ref<Expr> address);

  TxStore *getStore() const { return store; }

  /// \brief Print the content of the object to the LLVM error stream
  void dump() const {
    this->print(llvm::errs());
    llvm::errs() << "\n";
  }

  /// \brief Print the content of the object into a stream.
  ///
  /// \param stream The stream to print the data to.
  void print(llvm::raw_ostream &stream) const;

  /// \brief Print the content of the object into a stream.
  ///
  /// \param stream The stream to print the data to.
  /// \param paddingAmount The number of whitespaces to be printed before each
  /// line.
  void print(llvm::raw_ostream &stream, const unsigned paddingAmount) const;
};
}

#endif
