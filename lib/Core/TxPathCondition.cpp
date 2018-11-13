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

#include "TxShadowArray.h"
#include "klee/CommandLine.h"
#include "klee/util/TxExprUtil.h"
#include "klee/util/TxTreeGraph.h"
#include <klee/Internal/Support/ErrorHandling.h>

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
  if (!shadowed) {
#ifdef ENABLE_Z3
    shadowConstraint =
        (NoExistential ? constraint : TxShadowArray::getShadowExpression(
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
    const std::vector<ref<Expr> > &unsatCore) {
  std::map<uint64_t, std::set<ref<TxPCConstraint> > > depthToConstraintSet;
  std::set<uint64_t> keySet;
  std::vector<uint64_t> sortedKeys;
  //  if(unsatCore.size()>0){
  //	  std::vector<ref<Expr> > unsatCore2 = unsatCore;
  //	  llvm::errs() << "=======================================>sajjad1\n";
  //	  for (std::vector<ref<Expr> >::iterator
  //	           it = unsatCore2.begin(),
  //	           ie = unsatCore2.end();
  //	       it != ie; ++it) {
  //		  (*it)->dump();
  //		  llvm::errs() <<
  //"=======================================>sajjad1.5\n";
  //
  //	  }
  //	  llvm::errs() << "=======================================>sajjad2\n";
  //  }
  //
  //
  //  for (std::map<ref<Expr>, ref<TxPCConstraint> >::iterator it =
  //  pcDepth.begin(),
  //                                               ie = pcDepth.end();
  //       it != ie; ++it) {
  //	  llvm::errs() << "=======================================>sajjad3\n";
  //	  (*it).first->dump();
  //	  llvm::errs() << "=======================================>sajjad4\n";
  //	  (*it).second->dump();
  //	  llvm::errs() << "=======================================>sajjad5\n";
  //  }

  for (std::vector<ref<Expr> >::const_iterator it = unsatCore.begin(),
                                               ie = unsatCore.end();
       it != ie; ++it) {
    std::map<ref<Expr>, ref<TxPCConstraint> >::iterator pcDepthIter =
        pcDepth.find(*it);
    if (pcDepthIter != pcDepth.end()) {
      ref<TxPCConstraint> &pcConstraint = pcDepthIter->second;
      depthToConstraintSet[pcConstraint->getDepth()].insert(pcConstraint);
      keySet.insert(pcConstraint->getDepth());

      TxTreeGraph::setAsCore(pcConstraint.get());
    } else {
      klee_error("Not handled yet!");
      //    	std::set<ref<Expr> > vars;
      //    	this->getExprVars((*it),vars);
      //    	for (std::set<ref<Expr> >::iterator it2 = vars.begin(),
      //    										ie2
      //    =
      //    vars.end();
      //    	    	       it2 != ie2; ++it2) {
      //        	for (std::map<ref<Expr>, ref<TxPCConstraint> >::iterator
      //        it3 = pcDepth.begin(),
      //        	                                               	   	   	 ie3
      //        = pcDepth.end();
      //        	       it3 != ie3; ++it3) {
      //        		if(this->containsVar((*it3).first,(*it2))){
      //				  ref<TxPCConstraint> &pcConstraint =
      //(*it3).second;
      //				  depthToConstraintSet[pcConstraint->getDepth()].insert(pcConstraint);
      //				  keySet.insert(pcConstraint->getDepth());
      //
      //				  TxTreeGraph::setAsCore(pcConstraint.get());
      //        		}
      //        	}
      //    	}
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
        currentPC->usedByRightPath.insert(constraintSet.begin(),
                                          constraintSet.end());
      }
    }
  }
}

void TxPathCondition::getExprVars(ref<Expr> e, std::set<ref<Expr> > &vars) {
  switch (e->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    break;
  }
  case Expr::Read: {
    vars.insert(e);
    break;
  }
  case Expr::Concat: {
    vars.insert(e);
    break;
  }
  case Expr::NotOptimized:
  case Expr::Not:
  case Expr::Extract:
  case Expr::ZExt:
  case Expr::SExt: {
    // Extract the one kid and extract variable from that
    ref<Expr> kids[1];
    kids[0] = e->getKid(0);
    getExprVars(kids[0], vars);
    break;
  }
  case Expr::Eq:
  case Expr::Ne:
  case Expr::Ult:
  case Expr::Ule:
  case Expr::Ugt:
  case Expr::Uge:
  case Expr::Slt:
  case Expr::Sle:
  case Expr::Sgt:
  case Expr::Sge:
  case Expr::Add:
  case Expr::Sub:
  case Expr::Mul:
  case Expr::UDiv:
  case Expr::SDiv:
  case Expr::URem:
  case Expr::SRem:
  case Expr::And:
  case Expr::Or:
  case Expr::Xor:
  case Expr::Shl:
  case Expr::LShr:
  case Expr::AShr: {
    // Extract the two kids and extract variable from that
    ref<Expr> kids[2];
    kids[0] = e->getKid(0);
    kids[1] = e->getKid(1);
    getExprVars(kids[0], vars);
    getExprVars(kids[1], vars);
    break;
  }
  case Expr::Select: {
    // Extract the three kids and extract variable from that
    ref<Expr> kids[3];
    kids[0] = e->getKid(0);
    kids[1] = e->getKid(1);
    kids[2] = e->getKid(2);
    getExprVars(kids[0], vars);
    getExprVars(kids[1], vars);
    getExprVars(kids[2], vars);
    break;
  }
  default:
    break;
  }
}

bool TxPathCondition::containsVar(ref<Expr> e, ref<Expr> var) {
  switch (e->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    return false;
  }
  case Expr::Read: {
    if (e == var)
      return true;
    else
      return false;
    break;
  }
  case Expr::Concat: {
    if (e == var)
      return true;
    else
      return false;
    break;
  }
  case Expr::NotOptimized:
  case Expr::Not:
  case Expr::Extract:
  case Expr::ZExt:
  case Expr::SExt: {
    // Extract the one kid and extract variable from that
    ref<Expr> kids[1];
    kids[0] = e->getKid(0);
    return containsVar(kids[0], var);
    break;
  }
  case Expr::Eq:
  case Expr::Ne:
  case Expr::Ult:
  case Expr::Ule:
  case Expr::Ugt:
  case Expr::Uge:
  case Expr::Slt:
  case Expr::Sle:
  case Expr::Sgt:
  case Expr::Sge:
  case Expr::Add:
  case Expr::Sub:
  case Expr::Mul:
  case Expr::UDiv:
  case Expr::SDiv:
  case Expr::URem:
  case Expr::SRem:
  case Expr::And:
  case Expr::Or:
  case Expr::Xor:
  case Expr::Shl:
  case Expr::LShr:
  case Expr::AShr: {
    // Extract the two kids and extract variable from that
    ref<Expr> kids[2];
    kids[0] = e->getKid(0);
    kids[1] = e->getKid(1);
    if (containsVar(kids[0], var) || containsVar(kids[1], var))
      return true;
    else
      return false;
    break;
  }
  case Expr::Select: {
    // Extract the three kids and extract variable from that
    ref<Expr> kids[3];
    kids[0] = e->getKid(0);
    kids[1] = e->getKid(1);
    kids[2] = e->getKid(2);
    if (containsVar(kids[0], var) || containsVar(kids[1], var) ||
        containsVar(kids[2], var))
      return true;
    else
      return false;
    break;
  }
  default:
    break;
  }
  return false;
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
