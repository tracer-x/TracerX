//===-- TxTree.h - Tracer-X symbolic execution tree -------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains declarations of the classes that implements the
/// interpolation and subsumption checks for search-space reduction.
///
//===----------------------------------------------------------------------===//

#ifndef TXTREE_H_
#define TXTREE_H_

#include <klee/Expr.h>
#include "klee/CommandLine.h"
#include "klee/Config/Version.h"
#include "klee/ExecutionState.h"
#include "klee/Solver.h"
#include "klee/Statistic.h"
#include "klee/TimerStatIncrementer.h"
#include "klee/util/ExprVisitor.h"
#include "klee/util/TxTreeGraph.h"
#include "llvm/Support/raw_ostream.h"
#include "TxDependency.h"
#include "WP.h"

namespace klee {

/// \brief The subsumption table.
///
/// This is the database of states that have been generalized by the
/// interpolation process to be used in subsuming other states. This
/// member variable is a map indexed by code fragment id, which is the
/// pointer value of the first instruction of a basic block. It
/// represents control location in a program. In a subsumption check,
/// the map is queried for such id of a state. If the entry of the id
/// is found in the subsumption table, then the corresponding
/// subsubmption table entries are compared against the state,
/// possibly via a call to the constraint solver.
///
/// \see TxSubsumptionTableEntry
class TxSubsumptionTable {
  typedef std::deque<TxSubsumptionTableEntry *>::const_reverse_iterator
  EntryIterator;

  class CallHistoryIndexedTable {
    class Node {
      friend class CallHistoryIndexedTable;

      llvm::Instruction *id;

      std::deque<TxSubsumptionTableEntry *> entryList;

      std::map<llvm::Instruction *, Node *> next;

      Node(llvm::Instruction *_id) : id(_id) {}

      void dump() const {
        this->print(llvm::errs());
        llvm::errs() << "\n";
      }

      void print(llvm::raw_ostream &stream) const;

      void print(llvm::raw_ostream &stream, const unsigned paddingAmount) const;

      void print(llvm::raw_ostream &stream, const std::string &prefix) const;
    };

    Node *root;

    void printNode(llvm::raw_ostream &stream, Node *n, std::string edges) const;

  public:
    CallHistoryIndexedTable() { root = new Node(0); }

    ~CallHistoryIndexedTable() { clearTree(root); }

    void clearTree(Node *node);

    void insert(const std::vector<llvm::Instruction *> &callHistory,
                TxSubsumptionTableEntry *entry);

    std::pair<EntryIterator, EntryIterator>
    find(const std::vector<llvm::Instruction *> &callHistory,
         bool &found) const;

    void dump() const {
      this->print(llvm::errs());
      llvm::errs() << "\n";
    }

    void print(llvm::raw_ostream &stream) const;
  };

  static std::map<uintptr_t, CallHistoryIndexedTable *> instance;

public:
  static void insert(uintptr_t id,
                     const std::vector<llvm::Instruction *> &callHistory,
                     TxSubsumptionTableEntry *entry);

  static bool check(TimingSolver *solver, ExecutionState &state, double timeout,
                    int debugSubsumptionLevel);

  static void clear();

  static void print(llvm::raw_ostream &stream) {
    for (std::map<uintptr_t, CallHistoryIndexedTable *>::const_iterator
             it = instance.begin(),
             ie = instance.end();
         it != ie; ++it) {
      stream << it->first << ": ";
      it->second->print(stream);
      stream << "\n";
    }
  }
};

/// \brief The class that implements an entry (record) in the subsumption table.
///
/// The subsumption table records the generalization of state such that
/// starting from this generalization, all symbolic execution will reach
/// the same conclusion (falsity of branch or successful memory bounds check).
/// Such generalization is a form of Craig interpolation. It is used to
/// subsume other symbolic execution paths encountered later, as any
/// extension of a subsumed path would only reach infeasibility or
/// the same conclusion that has already been seen.
///
/// This class implements an entry in the subsumption table. It is
/// instantiated when the a traversal of a symbolic execution subtree has
/// finished in the TxTree#remove method. This class basically stores a
/// subset of the path condition (the TxSubsumptionTableEntry#interpolant
/// field), plus the fragment of memory (allocations). They are components
/// that are needed to ensure the previously-seen conclusions. The memory
/// fragments are stored in either
/// TxSubsumptionTableEntry#concretelyAddressedStore
/// or TxSubsumptionTableEntry#symbolicallyAddressedStore, depending on whether
/// the memory fragment is concretely addressed or symbolically addressed.
/// Both fields are multi-level maps that are first indexed by the LLVM
/// value that represents the allocation (e.g., the call to <b>malloc</b>,
/// the <b>alloca</b> instruction, etc.).
///
/// \see TxTree
/// \see TxTreeNode
/// \see TxDependency
/// \see TxSubsumptionTable
class TxSubsumptionTableEntry {
  friend class TxTree;

#ifdef ENABLE_Z3
  /// \brief Mark begin and end of subsumption check for use within a scope
  struct SubsumptionCheckMarker {
    SubsumptionCheckMarker() { Z3Solver::subsumptionCheck = true; }
    ~SubsumptionCheckMarker() { Z3Solver::subsumptionCheck = false; }
  };
#endif

  static Statistic concretelyAddressedStoreExpressionBuildTime;
  static Statistic symbolicallyAddressedStoreExpressionBuildTime;
  static Statistic solverAccessTime;

  ref<Expr> interpolant;

  TxStore::LowerInterpolantStore concretelyAddressedHistoricalStore;

  TxStore::LowerInterpolantStore symbolicallyAddressedHistoricalStore;

  TxStore::TopInterpolantStore concretelyAddressedStore;

  TxStore::TopInterpolantStore symbolicallyAddressedStore;

  ref<Expr> wpInterpolant;

  std::set<const Array *> existentials;

  /// \brief A procedure for building subsumption check constraints using
  /// symbolically-addressed store elements
  ///
  /// \return A null expression upon failure, otherwise the constructed
  /// constraint
  ref<Expr> makeConstraint(
      ExecutionState &state, ref<TxInterpolantValue> tabledValue,
      ref<TxInterpolantValue> stateValue, ref<Expr> tabledOffset,
      ref<Expr> stateOffset, std::set<ref<TxStateValue> > &coreValues,
      std::map<ref<TxStateValue>, std::set<uint64_t> > &corePointerValues,
      std::map<ref<TxAllocationInfo>, ref<TxAllocationInfo> > &unifiedBases,
      int debugSubsumptionLevel) const;

  /// \brief Test for the existence of a variable in a set in an expression.
  ///
  /// \param existentials A set of variables (KLEE arrays).
  /// \param expr The expression to test for the existence of the variables in
  /// the set.
  /// \return true if a variable in the set is found in the expression, false
  /// otherwise.
  static bool hasVariableInSet(std::set<const Array *> &existentials,
                               ref<Expr> expr);

  /// \brief Here we try to get bound-variables-free conjunction, if there is no
  /// constraints with both bound and non-bound variables.
  ///
  /// \param existentials A set of variables (KLEE arrays).
  /// \param expr The original conjunction of constrains to test
  /// \return a conjuction of constraints without bound variables, in case there
  /// is no costraint with both bound and non-bound variables, otherwise a null
  /// expression.
  static ref<Expr>
  getBoundFreeConjunction(std::set<const Array *> &existentials,
                          ref<Expr> expr);

  /// \brief Test for the non-existence of a variable in a set in an expression.
  ///
  /// \param existentials A set of variables (KLEE arrays).
  /// \param expr The expression to test for the non-existence of the variables
  /// in the set.
  /// \return true if none of the variable in the set is found in the
  /// expression, false otherwise.
  static bool hasVariableNotInSet(std::set<const Array *> &existentials,
                                  ref<Expr> expr);

  /// \brief Determines if a subexpression is in an expression
  static bool hasSubExpression(ref<Expr> expr, ref<Expr> subExpr);

  /// \brief Replace a sub-expression with another within an original expression
  static ref<Expr> replaceExpr(ref<Expr> originalExpr, ref<Expr> replacedExpr,
                               ref<Expr> replacementExpr);

  /// \brief Simplifies the interpolant condition in subsumption check whenever
  /// it contains constant equalities or disequalities.
  static ref<Expr>
  simplifyInterpolantExpr(std::vector<ref<Expr> > &interpolantPack,
                          ref<Expr> expr);

  /// \brief Simplifies the equality conditions in subsumption check whenever it
  /// contains constant equalities.
  static ref<Expr> simplifyEqualityExpr(std::vector<ref<Expr> > &equalityPack,
                                        ref<Expr> expr);

  /// \brief Simplify if possible an existentially-quantified expression,
  /// possibly removing the quantification.
  static ref<Expr> simplifyExistsExpr(ref<Expr> existsExpr,
                                      bool &hasExistentialsOnly);

  /// \brief Detect contradictory equalities in subsumption check beforehand to
  /// reduce the expensive call to the actual solver.
  ///
  /// \return false if there is contradictory equality constraints between state
  /// constraints and query expression, otherwise, return true.
  static bool detectConflictPrimitives(ExecutionState &state, ref<Expr> expr);

  /// \brief Get a conjunction of equalities that are top-level conjuncts in the
  /// query.
  ///
  /// \param conjunction The output conjunction of top-level conjuncts in the
  /// query expression.
  /// \param expr The query expression.
  /// \return false if there is an equality conjunct that is simplifiable to
  /// false, true otherwise.
  static bool fetchExprEqualityConjucts(std::vector<ref<Expr> > &conjunction,
                                        ref<Expr> expr);

  static ref<Expr> simplifyArithmeticBody(ref<Expr> existsExpr,
                                          bool &hasExistentialsOnly);

  /// \brief Function to collect substitution from a conjunction of equalities.
  static void getSubstitution(std::set<const Array *> &existentials,
                              ref<Expr> equalities,
                              std::map<ref<Expr>, ref<Expr> > &map);

  /// \brief Function to remove equalities whose lhs is a variable in the set.
  static ref<Expr> removeUnsubstituted(std::set<const Array *> &variables,
                                       ref<Expr> equalities);

  static void interpolateValues(
      ExecutionState &state, std::set<ref<TxStateValue> > &coreValues,
      std::map<ref<TxStateValue>, std::set<uint64_t> > &corePointerValues,
      int debugSubsumptionLevel);

  bool empty() {
    return interpolant.isNull() && concretelyAddressedStore.empty() &&
           symbolicallyAddressedStore.empty();
  }

  /// \brief For printing member functions running time statistics,
  static void printStat(std::stringstream &stream);

public:
  const uintptr_t programPoint;

  const uint64_t nodeSequenceNumber;

  TxSubsumptionTableEntry(TxTreeNode *node,
                          const std::vector<llvm::Instruction *> &callHistory);

  ~TxSubsumptionTableEntry();

  bool subsumed(
      TimingSolver *solver, ExecutionState &state, double timeout,
      bool leftRetrieval, TxStore::TopStateStore &__internalStore,
      TxStore::LowerStateStore &__concretelyAddressedHistoricalStore,
      TxStore::LowerStateStore &__symbolicallyAddressedHistoricalStore,
      int debugSubsumptionLevel);

  /// Tests if the argument is a variable. A variable here is defined to be
  /// either a symbolic concatenation or a symbolic read. A concatenation in
  /// KLEE concatenates reads, and hence can be considered to be a symbolic
  /// read.
  ///
  /// \param expr A KLEE expression.
  /// \return true if the parameter is either a concatenation or a read,
  ///         otherwise, return false.
  static bool isVariable(ref<Expr> expr) {
    return llvm::isa<ConcatExpr>(expr) || llvm::isa<ReadExpr>(expr);
  }

  ref<Expr> getInterpolant() const;

  ref<Expr> getWPInterpolant() const;

  TxStore::LowerInterpolantStore getConcretelyAddressedHistoricalStore() const;

  TxStore::LowerInterpolantStore
  getSymbolicallyAddressedHistoricalStore() const;

  TxStore::TopInterpolantStore getConcretelyAddressedStore() const;

  TxStore::TopInterpolantStore getSymbolicallyAddressedStore() const;

  void setInterpolant(ref<Expr> _interpolant);

  void setConcretelyAddressedHistoricalStore(
      TxStore::LowerInterpolantStore _concretelyAddressedHistoricalStore);

  void setSymbolicallyAddressedHistoricalStore(
      TxStore::LowerInterpolantStore _symbolicallyAddressedHistoricalStore);

  void setConcretelyAddressedStore(
      TxStore::TopInterpolantStore _concretelyAddressedStore);

  void setSymbolicallyAddressedStore(
      TxStore::TopInterpolantStore _symbolicallyAddressedStore);

  void dump() const {
    this->print(llvm::errs());
    llvm::errs() << "\n";
    this->printWP(llvm::errs());
    llvm::errs() << "\n";
  }

  void print(llvm::raw_ostream &stream) const;

  void print(llvm::raw_ostream &stream, const unsigned paddingAmount) const;

  void print(llvm::raw_ostream &stream, const std::string &prefix) const;

  void printWP(llvm::raw_ostream &stream) const;

  void printWP(llvm::raw_ostream &stream, const unsigned paddingAmount) const;

  void printWP(llvm::raw_ostream &stream, const std::string &prefix) const;
};

/// \brief The Tracer-X symbolic execution tree node.
///
/// Each Tracer-X tree node has an associated KLEE execution state
/// (implemented using the type ExecutionState) from which it is referenced
/// via the member variable ExecutionState#txTreeNode.
/// It adds information for lazy annotation to the ExecutionState object.
/// The whole structure of the Tracer-X tree itself is maintained by
/// the class TxTree, which also refers to objects of type TxTreeNode via
/// its TxTree#root and TxTree#currentTxTreeNode member variables.
///
/// \see TxTree
/// \see TxDependency
/// \see TxSubsumptionTable
/// \see TxSubsumptionTableEntry
class TxTreeNode {
  friend class TxTree;

  friend class ExecutionState;

  // Timers for profiling the execution times of the member functions of this
  // class

  static Statistic getInterpolantTime;
  static Statistic getWPInterpolantTime;
  static Statistic addConstraintTime;
  static Statistic splitTime;
  static Statistic executeTime;
  static Statistic bindCallArgumentsTime;
  static Statistic bindReturnValueTime;
  static Statistic getStoredExpressionsTime;
  static Statistic getStoredCoreExpressionsTime;

  /// \brief Counter for the next visited node id for logging and debugging
  /// purposes
  static uint64_t nextNodeSequenceNumber;

  /// \brief Value dependencies
  TxDependency *dependency;

  // \brief Instance of weakest precondition class used to generate WP
  // interpolant
  WeakestPreCondition *wp;

  /// \brief Value dependencies
  ref<Expr> childWPInterpolant[2];

  TxTreeNode *parent, *left, *right;

  uintptr_t programPoint;

  /// \brief List of the instructions in the node in a reverse order (used only
  /// in WP interpolation)
  /// Second argument is 0 means instruction is not dependent to any target
  /// Second argument is 1 means instruction is dependent to a target
  /// Second argument is 2 means negation of the instruction is dependent to a
  /// target
  std::map<KInstruction *, int> reverseInstructionList;

  uint64_t nodeSequenceNumber;

  bool storable;

  /// \brief Graph for displaying as .dot file
  TxTreeGraph *graph;

  /// \brief For statistics on the number of instructions executed along a path.
  uint64_t instructionsDepth;

  /// \brief The data layout of the analysis target
  llvm::DataLayout *targetData;

  /// \brief Map of globals to their bound address. This also includes globals
  /// that have no representative object (i.e. functions). This member variable
  /// is just a pointer to the one in klee::Executor.
  std::map<const llvm::GlobalValue *, ref<ConstantExpr> > *globalAddresses;

  /// \brief Indicates that a generic error was encountered in this node
  bool genericEarlyTermination;

  void setProgramPoint(llvm::Instruction *instr) {
    if (!programPoint)
      programPoint = reinterpret_cast<uintptr_t>(instr);

    // Disabling the subsumption check within KLEE's own API
    // (call sites of klee_ and at any location within the klee_ function)
    // by never store a table entry for KLEE's own API, marked with flag storable.
    storable = !(instr->getParent()->getParent()->getName().substr(0, 5).equals("klee_"));
  }

  /// \brief for printing member function running time statistics
  static void printTimeStat(std::stringstream &stream);

  void execute(llvm::Instruction *instr, std::vector<ref<Expr> > &args,
               bool symbolicExecutionError);

  void print(llvm::raw_ostream &stream, const unsigned paddingAmount) const;

  TxTreeNode(TxTreeNode *_parent, llvm::DataLayout *_targetData,
             std::map<const llvm::GlobalValue *, ref<ConstantExpr> > *
                 _globalAddresses);

  ~TxTreeNode();

  static TxTreeNode *createRoot(llvm::DataLayout *targetData,
                                std::map<const llvm::GlobalValue *,
                                         ref<ConstantExpr> > *globalAddresses) {
    return new TxTreeNode(0, targetData, globalAddresses);
  }

  TxTreeNode *createLeftChild() {
    left = new TxTreeNode(this, targetData, globalAddresses);
    dependency->setLeftChild(left->dependency);
    return left;
  }

  TxTreeNode *createRightChild() {
    right = new TxTreeNode(this, targetData, globalAddresses);
    dependency->setRightChild(right->dependency);
    return right;
  }

public:
  bool isSubsumed;

  /// \brief The entry call history
  std::vector<llvm::Instruction *> entryCallHistory;

  /// \brief The current call history
  std::vector<llvm::Instruction *> callHistory;

  uintptr_t getProgramPoint() { return programPoint; }

  uint64_t getNodeSequenceNumber() { return nodeSequenceNumber; }

  /// \brief Retrieve the interpolant for this node as KLEE expression object
  ///
  /// \param replacements The replacement bound variables for replacing the
  /// variables in the path condition.
  /// \return The interpolant expression.
  ref<Expr> getInterpolant(std::set<const Array *> &replacements,
                           std::map<ref<Expr>, ref<Expr> > &substitution) const;

  /// \brief Retrieve the weakest precondition interpolant for this node as KLEE expression object
  ///
  /// \return The weakest precondition interpolant expression.
  ref<Expr> getWPInterpolant();

  /// \brief Store the child WP interpolants in the parent node
  void setChildWPInterpolant(ref<Expr> interpolant);

  /// \brief Get the stored child WP interpolants in the parent node
  ref<Expr> getChildWPInterpolant(int flag);

  /// \brief Extend the path condition with another constraint
  ///
  /// \param constraint The constraint to extend the current path condition with
  /// \param value The LLVM value that corresponds to the constraint
  void addConstraint(ref<Expr> &constraint, llvm::Value *value);

  /// \brief Creates fresh interpolation data holder for the two given KLEE
  /// execution states.
  /// This member function is to be invoked after KLEE splits its own state due
  /// to state
  /// forking.
  ///
  /// \param leftData The first KLEE execution state
  /// \param rightData The second KLEE execution state
  void split(ExecutionState *leftData, ExecutionState *rightData);

  /// \brief Record call arguments in a function call
  void bindCallArguments(llvm::Instruction *site,
                         std::vector<ref<Expr> > &arguments);

  /// \brief This propagates the dependency due to the return value of a call
  void bindReturnValue(llvm::CallInst *site, llvm::Instruction *inst,
                       ref<Expr> returnValue);

  /// \brief This retrieves the allocations known at this state, and the
  /// expressions stored in the allocations. This returns as the two last
  /// arguments a pair of the store part indexed by constants, and the store
  /// part indexed by symbolic expressions.
  void getStoredExpressions(
      const std::vector<llvm::Instruction *> &callHistory,
      bool &leftRetrieval, TxStore::TopStateStore &__internalStore,
      TxStore::LowerStateStore &__concretelyAddressedHistoricalStore,
      TxStore::LowerStateStore &__symbolicallyAddressedHistoricalStore) const;

  /// \brief This retrieves the allocations known at this state, and the
  /// expressions stored in the allocations, as long as the allocation is
  /// relevant as an interpolant. This function is typically used when creating
  /// an entry in the subsumption table. This returns as the two last arguments
  /// a pair of the store part indexed by constants, and the store part indexed
  /// by symbolic expressions.
  ///
  /// \param replacements The replacement bound variables: As the resulting
  /// expression will
  /// be used for storing in the subsumption table, the variables need to be
  /// replaced with the bound ones.
  void getStoredCoreExpressions(
      const std::vector<llvm::Instruction *> &callHistory,
      const std::map<ref<Expr>, ref<Expr> > &substitution,
      std::set<const Array *> &replacements,
      TxStore::TopInterpolantStore &concretelyAddressedStore,
      TxStore::TopInterpolantStore &symbolicallyAddressedStore,
      TxStore::LowerInterpolantStore &concretelyAddressedHistoricalStore,
      TxStore::LowerInterpolantStore &symbolicallyAddressedHistoricalStore)
      const;

  void incInstructionsDepth();

  uint64_t getInstructionsDepth();

  /// \brief Marking the core constraints on the path condition, and all the
  /// relevant values on the dependency graph, given an unsatistiability core.
  void unsatCoreInterpolation(const std::vector<ref<Expr> > &unsatCore);

  /// \brief Memory bounds interpolation from a target address. Returns true if
  /// memory bounds check fails somehow.
  bool pointerValuesInterpolation(ref<TxStateValue> value,
                                  std::set<uint64_t> &bounds,
                                  const std::string &reason) {
    return dependency->markAllPointerValues(value, bounds, reason);
  }

  /// \brief Interpolation for memory bound violation
  void memoryBoundViolationInterpolation(llvm::Instruction *inst,
                                         ref<Expr> address) {
    dependency->memoryBoundViolationInterpolation(inst, address);
  }

  /// \brief Exact / non-pointer value interpolation
  void valuesInterpolation(ref<TxStateValue> value, const std::string &reason) {
    dependency->markAllValues(value, reason);
  }

  void setGenericEarlyTermination() { genericEarlyTermination = true; }

  TxStore *getStore() const { return dependency->getStore(); }

  /// \brief Print the content of the tree node object to the LLVM error stream.
  void dump() const;

  /// \brief Print the content of the tree node object into a stream.
  ///
  /// \param stream The stream to print the data to.
  void print(llvm::raw_ostream &stream) const;
};

/// \brief The top-level structure that implements lazy annotation.
///
/// The TxTree is the symbolic execution tree, a parallel of what is implemented
/// by KLEE's existing PTree class. It implements shadow information for use
/// in lazy annotation. Each node of the tree is implemented by
/// the TxTreeNode class. The TxTree class itself contains two important
/// components:
///
/// 1. The root of the Tracer-X tree, which is an object of type TxTreeNode,
///    and referenced by the member TxTree#root.
///
/// 2. The currently-active tree node, which is also an object of
///    type TxTreeNode, and referenced by the member TxTree#currentTxTreeNode.
///
/// TxTree has several public member functions, most importantly, the various
/// versions of the TxTree#execute function, including TxTree#executePHI,
/// TxTree#executeMemoryOperation, TxTree#executeOnNode. These are called mainly
/// from
/// KLEE's Executor class, which is the core symbolic executor of KLEE.
/// The main functionality of the TxTree#execute versions
/// themselves is to simply delegate the call to TxDependency#execute and related
/// functions, which
/// implements the construction of memory dependency used in computing the
/// regions of memory
/// that need to be kept as part of the interpolant stored in the subsumption
/// table.
///
/// The member function TxTree#subsumptionCheck is the topmost interface to the
/// subsumption checking mechanism. The function consults the subsumption table
/// (implemented by the TxSubsumptionTable class)
/// to compare the current state to a state stored in the subsumption table.
/// TxSubsumptionTable#insert is called from the
/// TxTree#remove member function, which is invoked when the symbolic execution
/// starting from a certain
/// state has completed and the state is to be removed. The completion of
/// the symbolic execution here is assumed to mean that the interpolants have
/// been completely recorded from all the execution paths that start from the
/// state.
/// The TxTree#subsumptionCheck function builds an object of
/// TxSubsumptionTableEntry
/// and stores it in the subsumption table via a call to
/// TxSubsumptionTable#insert.
///
/// To see how everything fits together, first we explain the important parts of
/// KLEE's
/// algorithm, and then we explain the modifications to KLEE's algorithm for
/// lazy annotation.
///
/// Following is the pseudocode of KLEE relevant to our discussion:
///
/// <hr>
/// <pre>
/// 1. Put the initial LLVM instruction into the tree root
/// 2. While there are leaves, do the following:
///    a. Pick a leaf
///    b. Symbolically execute the instruction:
///       i. If it is a branch instruction, test if one of branches is
/// unsatisfiable
///          * If yes, execute the instruction without creating tree node
///          * Otherwise, generate the two tree nodes for the branches
///       ii. If it is an error/end point, register the leaf for deletion
///    c. Delete nodes registered for deletion. Recursively, if a
///       parent tree node is found to no longer have any children,
///       delete the parent as well, and recursively its parent
/// </pre>
/// <hr>
///
/// For comparison, following is the pseudocode of Tracer-X KLEE. Please note that to
/// support interpolation, each leaf is now augmented with a path condition.
/// We highlight the added procedures using CAPITAL LETTERS, and we note the
/// functions involved.
///
/// <hr>
/// <pre>
/// 1. Put the initial LLVM instruction into the tree root
/// 2. While there are leaves, do the following:
///    a. Pick a leaf
///    b. IF THE LEAF IS SUBSUMED (TxTree::subsumptionCheck)
///       i. REGISTER IT FOR DELETION
///       ii. MARK CONSTRAINTS NEEDED FOR SUBSUMPTION
///       iii. GOTO d
///    c. Symbolically execute the instruction (TxTree::execute, TxTree::executePHI,
///       TxTree::executeMemoryOperation, TxTree::executeOnNode):
///       i. If it is a branch instruction, test if one of branches is
/// unsatisfiable
///          * If yes, execute the instruction without creating tree node
///            MARK CONSTRAINTS NEEDED FOR UNSATISFIABILITY
///            (TxTree::markPathCondition)
///          * Otherwise, generate the two tree nodes for the branches
///            ADDING THE CONDITION AND NEGATION TO PATH CONDITION
///            (TxTreeNode::addConstraint)
///       ii. If it is an error/end point, register the leaf for deletion
///    d. Delete nodes registered for deletion. Recursively, if a
///       parent tree node is found to no longer have any children,
///       delete the parent as well, and recursively its parent
///       FOR EACH DELETED NODE, STORE MARKED
///       CONSTRAINTS ON PC AS INTERPOLANT (TxSubsumptionTable::insert)
/// </pre>
/// <hr>
///
/// \see TxTreeNode
/// \see TxDependency
/// \see Executor
/// \see TxSubsumptionTable
/// \see TxSubsumptionTableEntry
class TxTree {
  typedef std::vector<ref<Expr> > ExprList;
  typedef ExprList::iterator iterator;
  typedef ExprList::const_iterator const_iterator;

  TxTreeNode *currentTxTreeNode;

  llvm::DataLayout *targetData;

  /// Map of globals to their bound address. This also includes
  /// globals that have no representative object (i.e. functions). This member
  /// variable is just a pointer to the one in klee::Executor.
  std::map<const llvm::GlobalValue *, ref<ConstantExpr> > *globalAddresses;

  void printNode(llvm::raw_ostream &stream, TxTreeNode *n,
                 std::string edges) const;

  /// \brief Displays member functions running time statistics
  static void printTimeStat(std::stringstream &stream);

  /// \brief Displays subsumption table statistics
  static void printTableStat(std::stringstream &stream);

  /// \brief Utility function to represent double-precision floating point in
  /// two decimal points.
  static std::string inTwoDecimalPoints(const double n);

public:
  // Several static member variables for profiling the execution time of
  // this class's member functions.
  static Statistic setCurrentINodeTime;
  static Statistic removeTime;
  static Statistic subsumptionCheckTime;
  static Statistic markPathConditionTime;
  static Statistic splitTime;
  static Statistic executeOnNodeTime;
  static Statistic executeMemoryOperationTime;
  static double entryNumber;
  static double programPointNumber;

  /// \brief Number of subsumption checks for statistical purposes
  static uint64_t subsumptionCheckCount;

  /// \brief Number of visited basic blocks for statistical purposes
  static uint64_t blockCount;

  /// \brief The root node of the tree
  TxTreeNode *root;

  /// \brief This static member variable is to indicate if we recovered from an
  /// error,
  /// e.g., memory bounds error, where the value of the previous instruction
  /// may not have been computed.
  static bool symbolicExecutionError;

  TxTree(ExecutionState *_root, llvm::DataLayout *_targetData,
         std::map<const llvm::GlobalValue *, ref<ConstantExpr> > *
             _globalAddresses);

  ~TxTree() { TxSubsumptionTable::clear(); }

  /// \brief Set the reference to the KLEE state in the current interpolation
  /// data holder (Tracer-X tree node) that is currently being processed.
  /// This also sets the id of the Tracer-X tree node to be the given
  /// pointer value.
  ///
  /// \param state The KLEE execution state to associate the current node with.
  void setCurrentINode(ExecutionState &state);

  /// \brief Deletes the Tracer-X tree node
  ///
  /// \param node The Tracer-X tree node to delete
  /// \param dumping Indicates whether we are dumping the states at the point
  /// KLEE itself is about to terminate. Here we should not create subsumption
  /// table entry.
  void remove(ExecutionState *state, TimingSolver *solver, bool dumping);

  /// \brief Invokes the subsumption check
  bool subsumptionCheck(TimingSolver *solver, ExecutionState &state,
                        double timeout);

  /// \brief Mark the path condition in the Tracer-X tree node associated with
  /// the given KLEE execution state.
  void markPathCondition(ExecutionState &state,
                         std::vector<ref<Expr> > &unsatCore);

  /// \brief Creates fresh interpolation data holder for the two given KLEE
  /// execution states.
  /// This member function is to be invoked after KLEE splits its own state due
  /// to state
  /// forking.
  std::pair<TxTreeNode *, TxTreeNode *>
  split(TxTreeNode *parent, ExecutionState *left, ExecutionState *right);

  /// \brief Execute an instruction of no argument for building dependency
  /// information.
  void execute(llvm::Instruction *instr) {
    executeOnNode(currentTxTreeNode, instr);
  }

  /// \brief Execute an instruction of one argument for building dependency
  /// information.
  void execute(llvm::Instruction *instr, ref<Expr> arg1) {
    executeOnNode(currentTxTreeNode, instr, arg1);
  }

  /// \brief Execute an instruction of two arguments for building dependency
  /// information.
  void execute(llvm::Instruction *instr, ref<Expr> arg1, ref<Expr> arg2) {
    executeOnNode(currentTxTreeNode, instr, arg1, arg2);
  }

  /// \brief Execute an instruction of three arguments for building dependency
  /// information.
  void execute(llvm::Instruction *instr, ref<Expr> arg1, ref<Expr> arg2,
               ref<Expr> arg3) {
    executeOnNode(currentTxTreeNode, instr, arg1, arg2, arg3);
  }

  /// \brief Execute an instruction of a number of arguments for building
  /// dependency information.
  void execute(llvm::Instruction *instr, std::vector<ref<Expr> > &args) {
    executeOnNode(currentTxTreeNode, instr, args);
  }

  /// \brief Execution of klee_make_symbolic
  void executeMakeSymbolic(llvm::Instruction *instr, ref<Expr> address,
                           const Array *array) {
    currentTxTreeNode->dependency->executeMakeSymbolic(
        instr, currentTxTreeNode->callHistory, address, array);
  }

  /// \brief Abstractly execute a PHI instruction for building dependency
  /// information.
  void executePHI(llvm::Instruction *instr, unsigned incomingBlock,
                  ref<Expr> valueExpr);

  /// \brief For executing memory operations, called by
  /// Executor::executeMemoryOperation. Returns true if memory bounds violation
  /// was detected; false otherwise.
  bool executeMemoryOperation(llvm::Instruction *instr, ref<Expr> value,
                              ref<Expr> address, bool inBounds) {
    return executeMemoryOperationOnNode(currentTxTreeNode, instr, value,
                                        address, inBounds);
  }

  /// \brief Internal method for executing memory operations. Returns true if
  /// memory bounds violation was detected, false otherwise.
  static bool executeMemoryOperationOnNode(TxTreeNode *node,
                                           llvm::Instruction *instr,
                                           ref<Expr> value, ref<Expr> address,
                                           bool inBounds) {
    TimerStatIncrementer t(executeMemoryOperationTime);
    std::vector<ref<Expr> > args;
    args.push_back(value);
    args.push_back(address);
    bool ret = node->dependency->executeMemoryOperation(
        instr, node->callHistory, args, inBounds, symbolicExecutionError);
    symbolicExecutionError = false;
    return ret;
  }

  /// \brief Execute an instruction of no argument for building dependency
  /// information, given a particular interpolation tree node.
  static void executeOnNode(TxTreeNode *node, llvm::Instruction *instr) {
    std::vector<ref<Expr> > dummyArgs;
    executeOnNode(node, instr, dummyArgs);
  }

  /// \brief Execute an instruction of one argument for building dependency
  /// information, given a particular interpolation tree node.
  static void executeOnNode(TxTreeNode *node, llvm::Instruction *instr,
                            ref<Expr> arg1) {
    std::vector<ref<Expr> > args;
    args.push_back(arg1);
    executeOnNode(node, instr, args);
  }

  /// \brief Execute an instruction of two arguments for building dependency
  /// information, given a particular interpolation tree node.
  static void executeOnNode(TxTreeNode *node, llvm::Instruction *instr,
                            ref<Expr> arg1, ref<Expr> arg2) {
    std::vector<ref<Expr> > args;
    args.push_back(arg1);
    args.push_back(arg2);
    executeOnNode(node, instr, args);
  }

  /// \brief Execute an instruction of three arguments for building dependency
  /// information, given a particular interpolation tree node.
  static void executeOnNode(TxTreeNode *node, llvm::Instruction *instr,
                            ref<Expr> arg1, ref<Expr> arg2, ref<Expr> arg3) {
    std::vector<ref<Expr> > args;
    args.push_back(arg1);
    args.push_back(arg2);
    args.push_back(arg3);
    executeOnNode(node, instr, args);
  }

  /// \brief General member function for executing an instruction for building
  /// dependency information, given a particular interpolation tree node.
  static void executeOnNode(TxTreeNode *node, llvm::Instruction *instr,
                            std::vector<ref<Expr> > &args);

  /// \brief Store instruction in a node for computing weakest precondition
  /// interpolant
  void storeInstruction(KInstruction *instr);

  /// \brief Mark an instruction in a node which contributes to computing
  /// weakest precondition interpolant
  void markInstruction(KInstruction *instr, bool branchFlag);

  /// \brief Print the content of the tree node object into a stream.
  ///
  /// \param stream The stream to print the data to.
  void print(llvm::raw_ostream &stream) const;

  /// \brief Print the content of the tree object to the LLVM error stream
  void dump() const;

  /// \brief Retrieve subsumption statistics result in std::string format
  static std::string getInterpolationStat();

  /// \brief Get the current debug state flag
  uint64_t getDebugState() {
    return currentTxTreeNode->dependency->debugStateLevel;
  }
};
}
#endif /* TXTREE_H_ */
