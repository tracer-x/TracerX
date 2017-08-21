//===--- TxPathCondition.h - Path condition management ----------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementations for the management of path conditions
/// to generate interpolants from.
///
//===----------------------------------------------------------------------===//

#include "TxPathCondition.h"

using namespace klee;

namespace klee {

void TxPathCondition::addConstraint(ref<Expr> constraint) {
  pcDepth[constraint] = depth;
  if (llvm::isa<OrExpr>(constraint)) {
    // FIXME: Break up disjunction into its components, because each disjunct is
    // solved separately. The or constraint was due to state merge. Hence, the
    // following is just a makeshift for when state merge is properly
    // implemented.
    pcDepth[constraint->getKid(0)] = depth;
    pcDepth[constraint->getKid(1)] = depth;
  }
}

void TxPathCondition::unsatCoreInterpolation(
    const std::vector<ref<Expr> > &unsatCore) {
  std::map<uint64_t, std::set<ref<Expr> > > depthToConstraintSet;
  std::set<uint64_t> keySet;
  std::vector<uint64_t> sortedKeys;

  for (std::vector<ref<Expr> >::const_iterator it = unsatCore.begin(),
                                               ie = unsatCore.end();
       it != ie; ++it) {
    std::map<ref<Expr>, uint64_t>::iterator pcDepthIter = pcDepth.find(*it);
    // FIXME: Sometimes some constraints are not in the PC. This is
    // because constraints are not properly added at state merge.
    if (pcDepthIter != pcDepth.end()) {
      depthToConstraintSet[pcDepthIter->second].insert(*it);
      keySet.insert(pcDepthIter->second);
    }
  }

  for (std::set<uint64_t>::iterator it = keySet.begin(), ie = keySet.end();
       it != ie; ++it) {
    sortedKeys.push_back(*it);
  }

  std::sort(sortedKeys.begin(), sortedKeys.end());

  std::set<ref<Expr> > currentSet;
  for (std::vector<uint64_t>::iterator it = sortedKeys.begin(),
                                       ie = sortedKeys.end();
       it != ie; ++it) {
    std::set<ref<Expr> > constraintSet = depthToConstraintSet[*it];
    currentSet.insert(constraintSet.begin(), constraintSet.end());
    depthToConstraintSet[*it] = currentSet;
  }

  TxPathCondition *currentPC = this;
  for (std::vector<uint64_t>::reverse_iterator it = sortedKeys.rbegin(),
                                               ie = sortedKeys.rend();
       it != ie; ++it) {
    uint64_t constraintDepth = *it;
    std::set<ref<Expr> > &constraintSet = depthToConstraintSet[constraintDepth];

    while (currentPC && currentPC->depth > constraintDepth) {
      if (currentPC->parent->left == currentPC) {
        currentPC = currentPC->parent;
        currentPC->usedByLeftPath.insert(constraintSet.begin(),
                                         constraintSet.end());
      } else if (currentPC->parent->right == currentPC) {
        currentPC = currentPC->parent;
        currentPC->usedByRightPath.insert(constraintSet.begin(),
                                          constraintSet.end());
      }
    }
  }
}

void TxPathCondition::print(llvm::raw_ostream &stream) const {
  print(stream, 0);
}

void TxPathCondition::print(llvm::raw_ostream &stream,
                            const unsigned paddingAmount) const {
  std::string tabs = makeTabs(paddingAmount);
  std::string tabsNext = appendTab(tabs);
  std::string tabsNextNext = appendTab(tabsNext);
}
}
