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

#include "klee/CommandLine.h"
#include "klee/util/TxExprUtil.h"
#include "klee/util/TxTreeGraph.h"
#include "TxShadowArray.h"

using namespace klee;

namespace klee {

TxPCConstraint::TxPCConstraint(ref<Expr> _constraint,
                               ref<TxStateValue> _condition, uint64_t _depth)
    : refCount(0), constraint(_constraint), shadowConstraint(_constraint),
      shadowed(false), condition(_condition), depth(_depth) {}

TxPCConstraint::~TxPCConstraint() {}

ref<Expr>
TxPCConstraint::packInterpolant(std::set<const Array *> &replacements) {
  ref<Expr> res;
  ref<Expr> constraintToUse =
      replacementConstraint.isNull() ? constraint : replacementConstraint;

  if (!shadowed) {
#ifdef ENABLE_Z3
    shadowConstraint =
        (NoExistential ? constraintToUse : TxShadowArray::getShadowExpression(
                                               constraintToUse, replacements));
#else
    shadowConstraint = constraintToUse;
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

int TxPCConstraint::compare(const TxPCConstraint &other) const {
  Expr &otherExpr = *(other.constraint.get());
  return constraint->compare(otherExpr);
}

void TxPCConstraint::dump() const {
  this->print(llvm::errs());
  llvm::errs() << "\n";
}

void TxPCConstraint::print(llvm::raw_ostream &stream) const {
  constraint->print(stream);
}

/**/

ref<TxPCConstraint>
TxPathCondition::addConstraint(ref<Expr> constraint,
                               ref<TxStateValue> condition) {
  ref<TxPCConstraint> pcConstraint(
      new TxPCConstraint(constraint, condition, depth));
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
    const std::vector<ref<Expr> > &unsatCore, ref<Expr> replacementConstraint) {

  if (unsatCore.size() == 1 && !replacementConstraint.isNull()) {
    if (llvm::isa<EqExpr>(replacementConstraint) &&
        llvm::isa<ConstantExpr>(replacementConstraint->getKid(0)) &&
        replacementConstraint->getKid(0)->getWidth() != Expr::Bool) {
      std::map<ref<Expr>, ref<TxPCConstraint> >::iterator pcDepthIter =
          pcDepth.find(*(unsatCore.begin()));

      assert(pcDepthIter != pcDepth.end() &&
             "unsat core constraint not found on path condition");

      uint64_t constraintDepth = pcDepthIter->second->getDepth();
      ref<TxPCConstraint> pcConstraint = pcDepthIter->second;

      TxPathCondition *currentPC = this;

      while (currentPC && currentPC->parent &&
             currentPC->depth >= constraintDepth) {
        if (currentPC->parent->left == currentPC) {
          currentPC = currentPC->parent;
          currentPC->usedByLeftPath.insert(pcConstraint);
          pcConstraint->setReplacementConstraint(replacementConstraint);
        } else if (currentPC->parent->right == currentPC) {
          currentPC = currentPC->parent;
          pcConstraint = pcConstraint->copy();
          currentPC->usedByRightPath.insert(pcConstraint);
          pcConstraint->setReplacementConstraint(replacementConstraint);
        }
      }

      return;
    }
  }

  std::map<uint64_t, std::set<ref<TxPCConstraint> > > depthToConstraintSet;
  std::set<uint64_t> keySet;
  std::vector<uint64_t> sortedKeys;

  for (std::vector<ref<Expr> >::const_iterator it = unsatCore.begin(),
                                               ie = unsatCore.end();
       it != ie; ++it) {
    std::map<ref<Expr>, ref<TxPCConstraint> >::iterator pcDepthIter =
        pcDepth.find(*it);
    // FIXME: Sometimes some constraints are not in the PC. This is
    // because constraints are not properly added at state merge.
    if (pcDepthIter != pcDepth.end()) {
      ref<TxPCConstraint> &pcConstraint = pcDepthIter->second;
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

  std::set<ref<TxPCConstraint> > currentSet;
  for (std::vector<uint64_t>::iterator it = sortedKeys.begin(),
                                       ie = sortedKeys.end();
       it != ie; ++it) {
    std::set<ref<TxPCConstraint> > &constraintSet = depthToConstraintSet[*it];
    currentSet.insert(constraintSet.begin(), constraintSet.end());
    depthToConstraintSet[*it] = currentSet;
  }

  for (std::vector<uint64_t>::reverse_iterator it = sortedKeys.rbegin(),
                                               ie = sortedKeys.rend();
       it != ie; ++it) {
    uint64_t constraintDepth = *it;
    std::set<ref<TxPCConstraint> > &constraintSet =
        depthToConstraintSet[constraintDepth];
    TxPathCondition *currentPC = this;

    while (currentPC && currentPC->parent && currentPC->depth >= constraintDepth) {
      if (currentPC->parent->left == currentPC) {
        currentPC = currentPC->parent;
        currentPC->usedByLeftPath.insert(constraintSet.begin(),
                                         constraintSet.end());
      } else if (currentPC->parent->right == currentPC) {
        currentPC = currentPC->parent;
        for (std::set<ref<TxPCConstraint> >::iterator
                 it = constraintSet.begin(),
                 ie = constraintSet.end();
             it != ie; ++it) {
          currentPC->usedByRightPath.insert((*it)->copy());
        }
      }
    }
  }
}

ref<Expr> TxPathCondition::packInterpolant(
    std::set<const Array *> &replacements,
    std::map<ref<Expr>, ref<Expr> > &substitution) const {
  ref<Expr> res;
  std::set<ref<TxPCConstraint> > *usedList;
  std::vector<ref<Expr> > constraintsList;

  if (parent) {
    if (parent->left == this) {
      usedList = &(parent->usedByLeftPath);
    } else {
      usedList = &(parent->usedByRightPath);
    }

    for (std::set<ref<TxPCConstraint> >::iterator it = usedList->begin(),
                                                  ie = usedList->end();
         it != ie; ++it) {
      ref<Expr> constraint = (*it)->packInterpolant(replacements);
      if (llvm::isa<EqExpr>(constraint)) {
        if (llvm::isa<ConcatExpr>(constraint->getKid(0)) ||
            llvm::isa<ReadExpr>(constraint->getKid(0))) {
          substitution[constraint->getKid(0)] = constraint->getKid(1);
        } else if (llvm::isa<ConcatExpr>(constraint->getKid(1)) ||
                   llvm::isa<ReadExpr>(constraint->getKid(1))) {
          substitution[constraint->getKid(1)] = constraint->getKid(0);
        }
      }
      constraintsList.push_back(constraint);
    }

    for (std::vector<ref<Expr> >::iterator it = constraintsList.begin(),
                                           ie = constraintsList.end();
         it != ie; ++it) {
      ref<Expr> constraint = TxSubstitutionVisitor(substitution).visit(*it);
      if (!constraint->isTrue()) {
        if (res.isNull()) {
          res = constraint;
        } else {
          res = AndExpr::create(constraint, res);
        }
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
  for (std::map<ref<Expr>, ref<TxPCConstraint> >::const_iterator
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
