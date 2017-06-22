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
/// This file contains the implementation of the Tracer-X tree DOT graph, useful
/// for viewing and debugging.
///
//===----------------------------------------------------------------------===//

#include "klee/util/TxTreeGraph.h"

#include "klee/ExecutionState.h"
#include "klee/util/TxPrintUtil.h"

#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#else
#include "llvm/BasicBlock.h"
#include "llvm/Function.h"
#endif

#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 5)
#include <llvm/IR/DebugInfo.h>
#elif LLVM_VERSION_CODE >= LLVM_VERSION(3, 2)
#include <llvm/DebugInfo.h>
#else
#include <llvm/Analysis/DebugInfo.h>
#endif

#include <fstream>
#include <string>

using namespace klee;

/**/

std::string TxTreeGraph::NumberedEdge::render() const {
  std::ostringstream stream;
  stream << "Node" << source->nodeSequenceNumber << " -> Node"
         << destination->nodeSequenceNumber << " [style=dashed,label=\""
         << number << "\"];";
  return stream.str();
}

/**/

uint64_t TxTreeGraph::nodeCount = 1;

TxTreeGraph *TxTreeGraph::instance = 0;

std::string TxTreeGraph::recurseRender(TxTreeGraph::Node *node) {
  std::ostringstream stream;

  if (node->nodeSequenceNumber) {
    stream << "Node" << node->nodeSequenceNumber;
  } else {
    // Node sequence number is zero; this must be an internal node created due
    // to splitting in memory access
    if (!node->internalNodeId) {
      node->internalNodeId = (++internalNodeId);
    }
    stream << "InternalNode" << node->internalNodeId;
  }
  std::string sourceNodeName = stream.str();

  size_t pos = 0;
  std::string replacementName(node->name);
  std::stringstream repStream1;
  while ((pos = replacementName.find("{")) != std::string::npos) {
    if (pos != std::string::npos) {
      repStream1 << replacementName.substr(0, pos) << "\\{";
      replacementName = replacementName.substr(pos + 2);
    }
  }
  repStream1 << replacementName;
  replacementName = repStream1.str();
  std::stringstream repStream2;
  while ((pos = replacementName.find("}")) != std::string::npos) {
    if (pos != std::string::npos) {
      repStream2 << replacementName.substr(0, pos) << "\\}";
      replacementName = replacementName.substr(pos + 2);
    }
  }
  repStream2 << replacementName;
  replacementName = repStream2.str();

  stream << " [shape=record,";
  if (node->errorPath) {
    stream << "style=bold,";
  }
  stream << "label=\"{";
  if (node->nodeSequenceNumber) {
    stream << node->nodeSequenceNumber << ": " << replacementName;
  } else {
    // The internal node id must have been set earlier
    assert(node->internalNodeId && "id for internal node must have been set");
    stream << "Internal node " << node->internalNodeId << ": ";
  }
  stream << "\\l";
  for (std::map<PathCondition *, std::pair<std::string, bool> >::const_iterator
           it = node->pathConditionTable.begin(),
           ie = node->pathConditionTable.end();
       it != ie; ++it) {
    stream << it->second.first;
    if (it->second.second)
      stream << " ITP";
    stream << "\\l";
  }
  switch (node->errorType) {
  case ASSERTION: {
    stream << "ASSERTION FAIL: " << node->errorLocation << "\\l";
    break;
  }
  case MEMORY: {
    stream << "OUT-OF-BOUND: " << node->errorLocation << "\\l";
    break;
  }
  case GENERIC: {
    stream << "GENERIC FAIL: " << node->errorLocation << "\\l";
    break;
  }
  case NONE:
  default: { break; }
  }
  if (node->subsumed) {
    stream << "(subsumed)\\l";
  }
  if (node->falseTarget || node->trueTarget)
    stream << "|{<s0>F|<s1>T}";
  stream << "}\"];\n";

  if (node->falseTarget) {
    if (node->falseTarget->nodeSequenceNumber) {
      stream << sourceNodeName << ":s0 -> Node"
             << node->falseTarget->nodeSequenceNumber;
    } else {
      if (!node->falseTarget->internalNodeId) {
        node->falseTarget->internalNodeId = (++internalNodeId);
      }
      stream << sourceNodeName << ":s0 -> InternalNode"
             << node->falseTarget->internalNodeId;
    }
    if (node->falseTarget->errorPath) {
      stream << " [style=bold,label=\"ERR\"];\n";
    } else {
      stream << ";\n";
    }
  }
  if (node->trueTarget) {
    if (node->trueTarget->nodeSequenceNumber) {
      stream << sourceNodeName + ":s1 -> Node"
             << node->trueTarget->nodeSequenceNumber;
    } else {
      if (!node->trueTarget->internalNodeId) {
        node->trueTarget->internalNodeId = (++internalNodeId);
      }
      stream << sourceNodeName << ":s1 -> InternalNode"
             << node->trueTarget->internalNodeId;
    }
    if (node->trueTarget->errorPath) {
      stream << " [style=bold,label=\"ERR\"];\n";
    } else {
      stream << ";\n";
    }
  }
  if (node->falseTarget) {
    stream << recurseRender(node->falseTarget);
  }
  if (node->trueTarget) {
    stream << recurseRender(node->trueTarget);
  }
  return stream.str();
}

std::string TxTreeGraph::render() {
  std::string res("");

  // Simply return empty string when root is undefined
  if (!root)
    return res;

  std::ostringstream stream;
  for (std::vector<TxTreeGraph::NumberedEdge *>::iterator
           it = subsumptionEdges.begin(),
           ie = subsumptionEdges.end();
       it != ie; ++it) {
    stream << (*it)->render() << "\n";
  }

  res = "digraph search_tree {\n";
  res += recurseRender(root);
  res += stream.str();
  res += "}\n";
  return res;
}

TxTreeGraph::TxTreeGraph(TxTreeNode *_root)
    : subsumptionEdgeNumber(0), internalNodeId(0) {
  root = TxTreeGraph::Node::createNode();
  txTreeNodeMap[_root] = root;
}

TxTreeGraph::~TxTreeGraph() {
  if (root)
    delete root;

  txTreeNodeMap.clear();

  for (std::vector<TxTreeGraph::NumberedEdge *>::iterator
           it = subsumptionEdges.begin(),
           ie = subsumptionEdges.end();
       it != ie; ++it) {
    delete *it;
  }
  subsumptionEdges.clear();
}

void TxTreeGraph::addChildren(TxTreeNode *parent, TxTreeNode *falseChild,
                              TxTreeNode *trueChild) {
  nodeCount += 2;

  if (!OUTPUT_INTERPOLATION_TREE)
    return;

  assert(TxTreeGraph::instance && "Search tree graph not initialized");

  TxTreeGraph::Node *parentNode = instance->txTreeNodeMap[parent];

  parentNode->falseTarget = TxTreeGraph::Node::createNode();
  parentNode->falseTarget->parent = parentNode;
  parentNode->trueTarget = TxTreeGraph::Node::createNode();
  parentNode->trueTarget->parent = parentNode;
  instance->txTreeNodeMap[falseChild] = parentNode->falseTarget;
  instance->txTreeNodeMap[trueChild] = parentNode->trueTarget;
}

void TxTreeGraph::setCurrentNode(ExecutionState &state,
                                 const uint64_t _nodeSequenceNumber) {
  if (!OUTPUT_INTERPOLATION_TREE)
    return;

  assert(TxTreeGraph::instance && "Search tree graph not initialized");

  TxTreeNode *txTreeNode = state.txTreeNode;
  TxTreeGraph::Node *node = instance->txTreeNodeMap[txTreeNode];
  if (!node->nodeSequenceNumber) {
    std::string functionName(
        state.pc->inst->getParent()->getParent()->getName().str());
    node->name = functionName + "\\l";
    llvm::raw_string_ostream out(node->name);
    if (llvm::MDNode *n = state.pc->inst->getMetadata("dbg")) {
      // Display the line, char position of this instruction
      llvm::DILocation loc(n);
      unsigned line = loc.getLineNumber();
      llvm::StringRef file = loc.getFilename();
      out << file << ":" << line << "\n";
    } else {
      state.pc->inst->print(out);
    }
    node->name = out.str();
    node->nodeSequenceNumber = _nodeSequenceNumber;
  }
}

void TxTreeGraph::markAsSubsumed(TxTreeNode *txTreeNode,
                                 SubsumptionTableEntry *entry) {
  if (!OUTPUT_INTERPOLATION_TREE)
    return;

  assert(TxTreeGraph::instance && "Search tree graph not initialized");

  TxTreeGraph::Node *node = instance->txTreeNodeMap[txTreeNode];
  node->subsumed = true;
  TxTreeGraph::Node *subsuming = instance->tableEntryMap[entry];
  instance->subsumptionEdges.push_back(new TxTreeGraph::NumberedEdge(
      node, subsuming, ++(instance->subsumptionEdgeNumber)));
}

void TxTreeGraph::addPathCondition(TxTreeNode *txTreeNode,
                                   PathCondition *pathCondition,
                                   ref<Expr> condition) {
  if (!OUTPUT_INTERPOLATION_TREE)
    return;

  assert(TxTreeGraph::instance && "Search tree graph not initialized");

  TxTreeGraph::Node *node = instance->txTreeNodeMap[txTreeNode];

  std::string s = PrettyExpressionBuilder::construct(condition);

  std::pair<std::string, bool> p(s, false);
  node->pathConditionTable[pathCondition] = p;
  instance->pathConditionMap[pathCondition] = node;
}

void TxTreeGraph::addTableEntryMapping(TxTreeNode *txTreeNode,
                                       SubsumptionTableEntry *entry) {
  if (!OUTPUT_INTERPOLATION_TREE)
    return;

  assert(TxTreeGraph::instance && "Search tree graph not initialized");

  TxTreeGraph::Node *node = instance->txTreeNodeMap[txTreeNode];
  instance->tableEntryMap[entry] = node;
}

void TxTreeGraph::setAsCore(PathCondition *pathCondition) {
  if (!OUTPUT_INTERPOLATION_TREE)
    return;

  assert(TxTreeGraph::instance && "Search tree graph not initialized");

  instance->pathConditionMap[pathCondition]
      ->pathConditionTable[pathCondition]
      .second = true;
}

void TxTreeGraph::setError(ExecutionState &state,
                           TxTreeGraph::Error errorType) {
  if (!OUTPUT_INTERPOLATION_TREE)
    return;

  TxTreeGraph::Node *node = instance->txTreeNodeMap[state.txTreeNode];
  node->errorType = errorType;

  node->errorLocation = "";
  llvm::raw_string_ostream out(node->errorLocation);
  if (llvm::MDNode *n = state.pc->inst->getMetadata("dbg")) {
    // Display the line, char position of this instruction
    llvm::DILocation loc(n);
    unsigned line = loc.getLineNumber();
    llvm::StringRef file = loc.getFilename();
    out << file << ":" << line << "\n";
  } else {
    state.pc->inst->print(out);
  }

  // Mark the path as leading to memory error
  while (node) {
    node->errorPath = true;
    node = node->parent;
  }
}

void TxTreeGraph::save(std::string dotFileName) {
  if (!OUTPUT_INTERPOLATION_TREE)
    return;

  assert(TxTreeGraph::instance && "Search tree graph not initialized");

  std::string g(instance->render());
  std::ofstream out(dotFileName.c_str());
  if (!out.fail()) {
    out << g;
    out.close();
  }
}
