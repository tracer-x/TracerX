//===-- TxTreeGraph.h - Tracer-X tree DOT graph -----------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains declarations of the classes that implements the Tracer-X
/// tree DOT graph, useful for viewing and debugging.
///
//===----------------------------------------------------------------------===//

#ifndef TXTREEGRAPH_H_
#define TXTREEGRAPH_H_

#include "klee/CommandLine.h"
#include "klee/Expr.h"
#include "klee/Internal/Module/KModule.h"

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

#include <map>
#include <set>

namespace klee {

class ExecutionState;

class TxPCConstraint;

class TxSubsumptionTableEntry;

class TxTreeNode;

/// \brief The interpolation tree graph for outputting to .dot file.
class TxTreeGraph {

public:
  enum Error {
    ASSERTION,
    MEMORY,
    GENERIC,
    NONE
  };

private:
  /// \brief Global tree graph instance
  static TxTreeGraph *instance;

  /// Node information
  class Node {
    friend class TxTreeGraph;

    /// \brief The node id, also the order in which it is traversed
    uint64_t nodeSequenceNumber;

    /// \brief The id in case this was an internal node created in branchings
    /// due to memory access.
    uint64_t internalNodeId;

    /// \brief False and true children of this node
    TxTreeGraph::Node *parent, *falseTarget, *trueTarget;

    /// \brief Indicates that node is subsumed
    bool subsumed;

    /// \brief Conditions under which this node is visited from its parent
    std::map<TxPCConstraint *, std::pair<std::string, bool> >
    pathConditionTable;

    /// \brief Human-readable identifier of this node
    std::string name;

    /// \brief Location information of the error
    std::string errorLocation;

    /// \brief The error type, of type Error
    Error errorType;

    /// \brief Flag to indicate if this node belongs to a path to memory error.
    /// Note that memoryError or assertionError implies errorPath.
    bool errorPath;

    /// \brief The number of marked instruction visited along the path. A marked
    /// instruction is a return from a function named tracerx_mark.
    uint64_t markCount;

    std::vector<llvm::BasicBlock *> executedBBs;

    /// \brief The addition to the number of interesting instruction executed
    /// while processing a node: The interesting instruction is a return from a
    /// function named tracerx_mark.
    uint64_t markAddition;

    Node(uint64_t _markCount)
        : nodeSequenceNumber(0), internalNodeId(0), parent(0), falseTarget(0),
          trueTarget(0), subsumed(false), errorType(TxTreeGraph::NONE),
          errorPath(false), markCount(_markCount), markAddition(0) {}

    ~Node() {
      if (falseTarget)
        delete falseTarget;

      if (trueTarget)
        delete trueTarget;

      pathConditionTable.clear();
    }

    static TxTreeGraph::Node *createNode(uint64_t markCount) {
      return new TxTreeGraph::Node(markCount);
    }
  };

  class NumberedEdge {
    TxTreeGraph::Node *source;
    TxTreeGraph::Node *destination;
    uint64_t number;

  public:
    NumberedEdge(TxTreeGraph::Node *_source, TxTreeGraph::Node *_destination,
                 uint64_t _number)
        : source(_source), destination(_destination), number(_number) {}

    ~NumberedEdge() {
      delete source;
      delete destination;
    }

    std::string render() const;
    TxTreeGraph::Node *getSource() {
      return source;
    };
    TxTreeGraph::Node *getDest() {
      return destination;
    };
  };

  TxTreeGraph::Node *root;
  std::map<TxTreeNode *, TxTreeGraph::Node *> txTreeNodeMap;
  std::map<TxSubsumptionTableEntry *, TxTreeGraph::Node *> tableEntryMap;
  std::vector<TxTreeGraph::NumberedEdge *> subsumptionEdges;
  std::map<TxPCConstraint *, TxTreeGraph::Node *> pathConditionMap;
  std::set<llvm::Function *> executedFuncs;

  /// \brief The set of known leaves
  std::set<TxTreeGraph::Node *> leaves;

  /// \brief Maps leaves to leaf ids
  std::map<TxTreeGraph::Node *, uint64_t> leafToLeafSequenceNumber;

  uint64_t subsumptionEdgeNumber;

  uint64_t internalNodeId;

  std::string recurseRender(TxTreeGraph::Node *node);

  std::string render();

  TxTreeGraph(TxTreeNode *_root);

  ~TxTreeGraph();

public:
  static uint64_t nodeCount;

  static void initialize(TxTreeNode *root) {
    if (!OUTPUT_INTERPOLATION_TREE)
      return;

    if (!instance)
      delete instance;
    instance = new TxTreeGraph(root);
  }

  static void deallocate() {
    if (!OUTPUT_INTERPOLATION_TREE)
      return;

    if (!instance)
      delete instance;
    instance = 0;
  }

  static void addChildren(TxTreeNode *parent, TxTreeNode *falseChild,
                          TxTreeNode *trueChild);

  static void setCurrentNode(ExecutionState &state,
                             const uint64_t _nodeSequenceNumber);

  static void markAsSubsumed(TxTreeNode *txTreeNode,
                             TxSubsumptionTableEntry *entry);

  static void addPathCondition(TxTreeNode *txTreeNode,
                               TxPCConstraint *pathCondition,
                               ref<Expr> condition);

  static void addTableEntryMapping(TxTreeNode *txTreeNode,
                                   TxSubsumptionTableEntry *entry);

  static void setAsCore(TxPCConstraint *pathCondition);

  static void setError(const ExecutionState &state,
                       TxTreeGraph::Error errorType);

  /// \brief Save the graph
  static void save(std::string dotFileName);

  static void copyTxTreeNodeData(TxTreeNode *txTreeNode);
  static llvm::BasicBlock *copyBB(llvm::BasicBlock *bb,
                                  llvm::BasicBlock *nextBB);
  static void generatePSSCFG(KModule *kmodule);
};
}

#endif // TXTREEGRAPH_H_
