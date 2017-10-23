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

#include "ShadowArray.h"
#include "TxPathCondition.h"

#include "klee/CommandLine.h"
#include "klee/util/TxTreeGraph.h"

using namespace klee;

namespace klee {

PCConstraint::PCConstraint(ref<Expr> _constraint, ref<TxStateValue> _condition,
                           uint64_t _depth)
    : refCount(0), constraint(_constraint), shadowConstraint(_constraint),
      shadowed(false), condition(_condition), depth(_depth) {}

PCConstraint::~PCConstraint() {}

ref<Expr> PCConstraint::packInterpolant(std::set<const Array *> &replacements) {
  ref<Expr> res;
  if (!shadowed) {
#ifdef ENABLE_Z3
    shadowConstraint =
        (NoExistential ? constraint : ShadowArray::getShadowExpression(
                                          constraint, replacements));
#else
    shadowConstraint = constraint;
#endif
    shadowed = true;
    boundVariables.insert(replacements.begin(), replacements.end());
  } else {
    // Already shadowed, we add the bound variables
    replacements.insert(boundVariables.begin(), boundVariables.end());
  }
  if (!res.isNull()) {
    res = AndExpr::create(res, shadowConstraint);
  } else {
    res = shadowConstraint;
  }
  return res;
}

int PCConstraint::compare(const PCConstraint &other) const {
  Expr &otherExpr = *(other.constraint.get());
  return constraint->compare(otherExpr);
}

void PCConstraint::dump() const {
  this->print(llvm::errs());
  llvm::errs() << "\n";
}

void PCConstraint::print(llvm::raw_ostream &stream) const {
  constraint->print(stream);
}

/**/

ref<PCConstraint> TxPathCondition::addConstraint(ref<Expr> constraint,
                                                 ref<TxStateValue> condition) {
  ref<PCConstraint> pcConstraint(new PCConstraint(constraint, condition, depth));
  pcDepth[constraint] = pcConstraint;
  if (llvm::isa<OrExpr>(constraint)) {
    // FIXME: Break up disjunction into its components, because each disjunct is
    // solved separately. The or constraint was due to state merge. Hence, the
    // following is just a makeshift for when state merge is properly
    // implemented.
    pcDepth[constraint->getKid(0)] = pcConstraint;
    pcDepth[constraint->getKid(1)] = pcConstraint;
  }
  return pcConstraint;
}

void TxPathCondition::unsatCoreInterpolation(
    const std::vector<ref<Expr> > &unsatCore) {
  std::map<uint64_t, std::set<ref<PCConstraint> > > depthToConstraintSet;
  std::set<uint64_t> keySet;
  std::vector<uint64_t> sortedKeys;

  for (std::vector<ref<Expr> >::const_iterator it = unsatCore.begin(),
                                               ie = unsatCore.end();
       it != ie; ++it) {
    std::map<ref<Expr>, ref<PCConstraint> >::iterator pcDepthIter =
        pcDepth.find(*it);
    // FIXME: Sometimes some constraints are not in the PC. This is
    // because constraints are not properly added at state merge.
    if (pcDepthIter != pcDepth.end()) {
      ref<PCConstraint> &pcConstraint = pcDepthIter->second;
      depthToConstraintSet[pcConstraint->getDepth()].insert(pcConstraint);
      keySet.insert(pcConstraint->getDepth());

      TxTreeGraph::setAsCore(pcConstraint.get());
    }
  }

  for (std::set<uint64_t>::iterator it = keySet.begin(), ie = keySet.end();
       it != ie; ++it) {
    sortedKeys.push_back(*it);
  }

  std::sort(sortedKeys.begin(), sortedKeys.end());

  std::set<ref<PCConstraint> > currentSet;
  for (std::vector<uint64_t>::iterator it = sortedKeys.begin(),
                                       ie = sortedKeys.end();
       it != ie; ++it) {
    std::set<ref<PCConstraint> > &constraintSet = depthToConstraintSet[*it];
    currentSet.insert(constraintSet.begin(), constraintSet.end());
    depthToConstraintSet[*it] = currentSet;
  }

  for (std::vector<uint64_t>::reverse_iterator it = sortedKeys.rbegin(),
                                               ie = sortedKeys.rend();
       it != ie; ++it) {
    uint64_t constraintDepth = *it;
    std::set<ref<PCConstraint> > &constraintSet =
        depthToConstraintSet[constraintDepth];
    TxPathCondition *currentPC = this;

    while (currentPC && currentPC->parent && currentPC->depth >= constraintDepth) {
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

ref<Expr>
TxPathCondition::packInterpolant(std::set<const Array *> &replacements) const {
  ref<Expr> res;
  std::set<ref<PCConstraint> > *usedList;

  if (parent) {
    if (parent->left == this) {
      usedList = &(parent->usedByLeftPath);
    } else {
      usedList = &(parent->usedByRightPath);
    }

    for (std::set<ref<PCConstraint> >::iterator it = usedList->begin(),
                                                ie = usedList->end();
         it != ie; ++it) {
      if (res.isNull()) {
        res = (*it)->packInterpolant(replacements);
      } else {
        res = AndExpr::create((*it)->packInterpolant(replacements), res);
      }
    }
  }

  return res;
}

void TxPathCondition::print(llvm::raw_ostream &stream) const {
  print(stream, 0);
}

void TxPathCondition::print(llvm::raw_ostream &stream,
                            const unsigned paddingAmount) const {
  std::string tabs = makeTabs(paddingAmount);
  std::string tabsNext = appendTab(tabs);

  stream << tabs << "path condition = [";
  for (std::map<ref<Expr>, ref<PCConstraint> >::const_iterator
           is = pcDepth.begin(),
           it = is, ie = pcDepth.end();
       it != ie; ++it) {
    if (it != is)
      stream << ",";
    stream << "\n";
    stream << tabsNext;
    it->first->print(stream);
  }
  stream << "]";
}
}
