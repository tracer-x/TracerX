//===-- Constraints.cpp ---------------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "klee/Constraints.h"

#include "klee/util/ExprPPrinter.h"
#include "klee/util/ExprVisitor.h"
#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)
#include "llvm/IR/Function.h"
#else
#include "llvm/Function.h"
#endif
#include "llvm/Support/CommandLine.h"
#include "klee/Internal/Module/KModule.h"

#include <map>

using namespace klee;

namespace {
  llvm::cl::opt<bool>
  RewriteEqualities("rewrite-equalities",
		    llvm::cl::init(true),
		    llvm::cl::desc("Rewrite existing constraints when an equality with a constant is added (default=on)"));
}


class ExprReplaceVisitor : public ExprVisitor {
private:
  ref<Expr> src, dst;

public:
  ExprReplaceVisitor(ref<Expr> _src, ref<Expr> _dst) : src(_src), dst(_dst) {}

  Action visitExpr(const Expr &e) {
    if (e == *src.get()) {
      return Action::changeTo(dst);
    } else {
      return Action::doChildren();
    }
  }

  Action visitExprPost(const Expr &e) {
    if (e == *src.get()) {
      return Action::changeTo(dst);
    } else {
      return Action::doChildren();
    }
  }
};

class ExprReplaceVisitor2 : public ExprVisitor {
private:
  const std::map<ref<Expr>, std::pair<ref<Expr>, unsigned> > &replacements;

  std::set<unsigned> usedEqualities;

public:
  ExprReplaceVisitor2(
      const std::map<ref<Expr>, std::pair<ref<Expr>, unsigned> > &_replacements)
      : ExprVisitor(true), replacements(_replacements) {}

  void getCore(std::vector<unsigned> &core) {
    core.insert(core.begin(), usedEqualities.begin(), usedEqualities.end());
    std::sort(core.begin(), core.end());
  }

  Action visitExprPost(const Expr &e) {
    std::map<ref<Expr>, std::pair<ref<Expr>, unsigned> >::const_iterator it =
        replacements.find(ref<Expr>(const_cast<Expr *>(&e)));
    if (it!=replacements.end()) {
      usedEqualities.insert(it->second.second);
      return Action::changeTo(it->second.first);
    } else {
      return Action::doChildren();
    }
  }
};

bool ConstraintManager::rewriteConstraints(ExprVisitor &visitor) {
  ConstraintManager::constraints_ty old;
  bool changed = false;

  constraints.swap(old);
  for (ConstraintManager::constraints_ty::iterator 
         it = old.begin(), ie = old.end(); it != ie; ++it) {
    ref<Expr> &ce = *it;
    ref<Expr> e = visitor.visit(ce);

    if (e!=ce) {
      addConstraintInternal(e); // enable further reductions
      changed = true;
    } else {
      constraints.push_back(ce);
    }
  }

  return changed;
}

void ConstraintManager::simplifyForValidConstraint(ref<Expr> e) {
  // XXX 
}

ref<Expr> ConstraintManager::simplifyExpr(ref<Expr> e) const {
  std::vector<unsigned> simplificationCore;
  return simplifyExpr(e, simplificationCore);
}

ref<Expr> ConstraintManager::simplifyExpr(ref<Expr> e,
                                          std::vector<unsigned> &core) const {
  if (isa<ConstantExpr>(e))
    return e;

  std::map<ref<Expr>, std::pair<ref<Expr>, unsigned> > equalities;

  unsigned constraintIndex = 0;
  for (ConstraintManager::constraints_ty::const_iterator 
         it = constraints.begin(), ie = constraints.end(); it != ie; ++it) {
    if (const EqExpr *ee = dyn_cast<EqExpr>(*it)) {
      if (isa<ConstantExpr>(ee->left)) {
        equalities.insert(std::make_pair(
            ee->right, std::make_pair(ee->left, constraintIndex)));
      } else {
        equalities.insert(std::make_pair(
            *it, std::make_pair(ConstantExpr::alloc(1, Expr::Bool),
                                constraintIndex)));
      }
    } else {
      equalities.insert(
          std::make_pair(*it, std::make_pair(ConstantExpr::alloc(1, Expr::Bool),
                                             constraintIndex)));
    }
    ++constraintIndex;
  }

  ExprReplaceVisitor2 visitor(equalities);
  ref<Expr> ret = visitor.visit(e);
  visitor.getCore(core);
  return ret;
}

void ConstraintManager::addConstraintInternal(ref<Expr> e) {
  // rewrite any known equalities and split Ands into different conjuncts

  switch (e->getKind()) {
  case Expr::Constant:
    assert(cast<ConstantExpr>(e)->isTrue() && 
           "attempt to add invalid (false) constraint");
    break;
    
    // split to enable finer grained independence and other optimizations
  case Expr::And: {
    BinaryExpr *be = cast<BinaryExpr>(e);
    addConstraintInternal(be->left);
    addConstraintInternal(be->right);
    break;
  }

  case Expr::Eq: {
    if (RewriteEqualities) {
      // XXX: should profile the effects of this and the overhead.
      // traversing the constraints looking for equalities is hardly the
      // slowest thing we do, but it is probably nicer to have a
      // ConstraintSet ADT which efficiently remembers obvious patterns
      // (byte-constant comparison).
      BinaryExpr *be = cast<BinaryExpr>(e);
      if (isa<ConstantExpr>(be->left)) {
	ExprReplaceVisitor visitor(be->right, be->left);
	rewriteConstraints(visitor);
      }
    }
    constraints.push_back(e);
    break;
  }
    
  default:
    constraints.push_back(e);
    break;
  }
}

void ConstraintManager::addConstraint(ref<Expr> e) {
  e = simplifyExpr(e);
  addConstraintInternal(e);
}
