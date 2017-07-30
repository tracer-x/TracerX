//===-- TxTree.cpp - Interpolation tree -------------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementations of the classes for
/// interpolation and subsumption checks for search-space reduction.
///
//===----------------------------------------------------------------------===//

#include "TxTree.h"

#include "Dependency.h"
#include "ShadowArray.h"
#include "TimingSolver.h"

#include <klee/CommandLine.h>
#include <klee/Expr.h>
#include <klee/Solver.h>
#include <klee/SolverStats.h>
#include <klee/Internal/Support/ErrorHandling.h>
#include <klee/util/ExprPPrinter.h>
#include <klee/util/TxPrintUtil.h>
#include <fstream>
#include <vector>

#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 5)
#include <llvm/IR/DebugInfo.h>
#elif LLVM_VERSION_CODE >= LLVM_VERSION(3, 2)
#include <llvm/DebugInfo.h>
#else
#include <llvm/Analysis/DebugInfo.h>
#endif

using namespace klee;

/**/

PathCondition::PathCondition(
    ref<Expr> &constraint, Dependency *dependency, llvm::Value *_condition,
    const std::vector<llvm::Instruction *> &callHistory, PathCondition *prev)
    : constraint(constraint), shadowConstraint(constraint), shadowed(false),
      dependency(dependency), core(false), tail(prev) {
  ref<TxStateValue> emptyCondition;
  if (dependency) {
    condition =
        dependency->getLatestValue(_condition, callHistory, constraint, true);
    assert(!condition.isNull() && "null constraint on path condition");
  } else {
    condition = emptyCondition;
  }
}

PathCondition::~PathCondition() {}

ref<Expr> PathCondition::car() const { return constraint; }

PathCondition *PathCondition::cdr() const { return tail; }

void PathCondition::setAsCore(int debugSubsumptionLevel) {
  // We mark all values to which this constraint depends
  std::string reason = "";
  if (debugSubsumptionLevel >= 1) {
    llvm::raw_string_ostream stream(reason);
    stream << "path condition [";
    constraint->print(stream);
    stream << "] of [";
    if (llvm::Instruction *inst =
            llvm::dyn_cast<llvm::Instruction>(condition->getValue())) {
      if (inst->getParent()->getParent()) {
        stream << inst->getParent()->getParent()->getName().str() << ": ";
      }
      if (llvm::MDNode *n = inst->getMetadata("dbg")) {
        llvm::DILocation loc(n);
        stream << loc.getLineNumber();
      } else {
        condition->getValue()->print(stream);
      }
    } else {
      condition->getValue()->print(stream);
    }
    stream << "]";
    stream.flush();
  }
  dependency->markAllValues(condition, reason);

  // We mark this constraint itself as core
  core = true;

  // We mark constraint as core in the search tree graph as well.
  TxTreeGraph::setAsCore(this);
}

bool PathCondition::isCore() const { return core; }

ref<Expr>
PathCondition::packInterpolant(std::set<const Array *> &replacements) {
  ref<Expr> res;
  for (PathCondition *it = this; it != 0; it = it->tail) {
    if (it->core) {
      if (!it->shadowed) {
#ifdef ENABLE_Z3
        it->shadowConstraint =
            (NoExistential ? it->constraint
                           : ShadowArray::getShadowExpression(it->constraint,
                                                              replacements));
#else
        it->shadowConstraint = it->constraint;
#endif
        it->shadowed = true;
        it->boundVariables.insert(replacements.begin(), replacements.end());
      } else {
        // Already shadowed, we add the bound variables
        replacements.insert(it->boundVariables.begin(),
                            it->boundVariables.end());
      }
      if (!res.isNull()) {
        res = AndExpr::create(res, it->shadowConstraint);
      } else {
        res = it->shadowConstraint;
      }
    }
  }
  return res;
}

void PathCondition::dump() const {
  this->print(llvm::errs());
  llvm::errs() << "\n";
}

void PathCondition::print(llvm::raw_ostream &stream) const {
  stream << "[";
  for (const PathCondition *it = this; it != 0; it = it->tail) {
    it->constraint->print(stream);
    stream << ": " << (it->core ? "core" : "non-core");
    if (it->tail != 0)
      stream << ",";
  }
  stream << "]";
}

/**/

Statistic SubsumptionTableEntry::concretelyAddressedStoreExpressionBuildTime(
    "concretelyAddressedStoreExpressionBuildTime", "concreteStoreTime");
Statistic SubsumptionTableEntry::symbolicallyAddressedStoreExpressionBuildTime(
    "symbolicallyAddressedStoreExpressionBuildTime", "symbolicStoreTime");
Statistic SubsumptionTableEntry::solverAccessTime("solverAccessTime",
                                                  "solverAccessTime");

SubsumptionTableEntry::SubsumptionTableEntry(
    TxTreeNode *node, const std::vector<llvm::Instruction *> &callHistory)
    : programPoint(node->getProgramPoint()),
      nodeSequenceNumber(node->getNodeSequenceNumber()) {
  existentials.clear();
  interpolant = node->getInterpolant(existentials);

  node->getStoredCoreExpressions(
      callHistory, existentials, concretelyAddressedStore,
      symbolicallyAddressedStore, concretelyAddressedHistoricalStore,
      symbolicallyAddressedHistoricalStore);
}

SubsumptionTableEntry::~SubsumptionTableEntry() {
  concretelyAddressedStore.clear();
  symbolicallyAddressedStore.clear();
  concretelyAddressedHistoricalStore.clear();
  symbolicallyAddressedHistoricalStore.clear();
}

ref<Expr> SubsumptionTableEntry::makeConstraint(
    ExecutionState &state, ref<TxInterpolantValue> tabledValue,
    ref<TxInterpolantValue> stateValue, ref<Expr> tabledOffset,
    ref<Expr> stateOffset,
    std::map<ref<TxInterpolantValue>, std::set<ref<Expr> > > &corePointerValues,
    std::set<ref<TxInterpolantValue> > &coreExactPointerValues,
    std::map<ref<AllocationInfo>, ref<AllocationInfo> > &unifiedBases,
    int debugSubsumptionLevel) const {
  ref<Expr> constraint;

  if (tabledValue->getExpression()->getWidth() !=
      stateValue->getExpression()->getWidth()) {
    // We conservatively require that the addresses should not be
    // equal whenever their values are of different width
    constraint = EqExpr::create(ConstantExpr::create(0, Expr::Bool),
                                EqExpr::create(tabledOffset, stateOffset));
  } else if (Dependency::boundInterpolation() && tabledValue->isPointer() &&
             stateValue->isPointer()) {
    if (!ExactAddressInterpolant && tabledValue->useBound()) {
      std::set<ref<Expr> > bounds;
      ref<Expr> boundsCheck = tabledValue->getBoundsCheck(
          stateValue, bounds, unifiedBases, debugSubsumptionLevel);

      if (!boundsCheck->isTrue()) {
        if (!boundsCheck->isFalse()) {
          // Implication: if tabled (interpolant)'s address == state address
          // then bounds check must hold
          constraint =
              EqExpr::create(ConstantExpr::create(0, Expr::Bool),
                             EqExpr::create(tabledOffset, stateOffset));
          constraint = OrExpr::create(constraint, boundsCheck);
        } else {
          if (debugSubsumptionLevel >= 1) {
            std::string msg;
            klee_message("#%lu=>#%lu: Check failure due to failure in "
                         "memory bounds check%s",
                         state.txTreeNode->getNodeSequenceNumber(),
                         nodeSequenceNumber, msg.c_str());
          }

          assert(constraint.isNull() && "must return a null constraint");
          return constraint;
        }
      }

      // We record the LLVM value of the pointer
      corePointerValues[stateValue] = bounds;
    } else {
      ref<Expr> offsetsCheck = tabledValue->getOffsetsCheck(
          stateValue, unifiedBases, debugSubsumptionLevel);
      if (offsetsCheck->isFalse()) {
        if (debugSubsumptionLevel >= 1) {
          klee_message("#%lu=>#%lu: Check failure due to failure in "
                       "offset equality check",
                       state.txTreeNode->getNodeSequenceNumber(),
                       nodeSequenceNumber);
        }
        return constraint;
      }
      if (!offsetsCheck->isTrue())
        constraint = offsetsCheck;

      // We record the value of the pointer for interpolation marking
      coreExactPointerValues.insert(stateValue);
    }
  } else {
    // Implication: if tabledConcreteAddress == stateSymbolicAddress,
    // then tabledValue->getExpression() ==
    // stateValue->getExpression()
    constraint = OrExpr::create(
        EqExpr::create(ConstantExpr::create(0, Expr::Bool),
                       EqExpr::create(tabledOffset, stateOffset)),
        EqExpr::create(tabledValue->getExpression(),
                       stateValue->getExpression()));
  }
  return constraint;
}

bool
SubsumptionTableEntry::hasVariableInSet(std::set<const Array *> &existentials,
                                        ref<Expr> expr) {
  for (int i = 0, numKids = expr->getNumKids(); i < numKids; ++i) {
    if (llvm::isa<ReadExpr>(expr)) {
      ReadExpr *readExpr = llvm::dyn_cast<ReadExpr>(expr);
      const Array *array = (readExpr->updates).root;
      for (std::set<const Array *>::const_iterator it = existentials.begin(),
                                                   ie = existentials.end();
           it != ie; ++it) {
        if ((*it) == array)
          return true;
      }
    } else if (hasVariableInSet(existentials, expr->getKid(i)))
      return true;
  }
  return false;
}

bool SubsumptionTableEntry::hasVariableNotInSet(
    std::set<const Array *> &existentials, ref<Expr> expr) {
  for (int i = 0, numKids = expr->getNumKids(); i < numKids; ++i) {
    if (llvm::isa<ReadExpr>(expr)) {
      ReadExpr *readExpr = llvm::dyn_cast<ReadExpr>(expr);
      const Array *array = (readExpr->updates).root;
      for (std::set<const Array *>::const_iterator it = existentials.begin(),
                                                   ie = existentials.end();
           it != ie; ++it) {
        if ((*it) == array)
          return false;
      }
      return true;
    } else if (hasVariableNotInSet(existentials, expr->getKid(i)))
      return true;
  }
  return false;
}

ref<Expr>
SubsumptionTableEntry::simplifyArithmeticBody(ref<Expr> existsExpr,
                                              bool &hasExistentialsOnly) {
  ExistsExpr *expr = llvm::dyn_cast<ExistsExpr>(existsExpr);

  assert(expr && "expression is not existentially quantified");

  // Assume the we shall return general ExistsExpr that does not contain
  // only existential variables.
  hasExistentialsOnly = false;

  // We assume that the body is always a conjunction of interpolant in terms of
  // shadow (existentially-quantified) variables and state equality constraints,
  // which may contain both normal and shadow variables.
  ref<Expr> body = expr->body;

  // If the post-simplified body was a constant, simply return the body;
  if (llvm::isa<ConstantExpr>(body))
    return body;

  // We only simplify a conjunction of interpolant and equalities
  if (!llvm::isa<AndExpr>(body)) {
    hasExistentialsOnly = !hasVariableNotInSet(expr->variables, body);
    return existsExpr;
  }

  // The equality constraint is only a single disjunctive clause
  // of a CNF formula. In this case we simplify nothing.
  if (llvm::isa<OrExpr>(body->getKid(1)))
    return existsExpr;

  // Here we process equality constraints of shadow and normal variables.
  // The following procedure returns simplified version of the expression
  // by reducing any equality expression into constant (TRUE/FALSE).
  // if body is A and (Eq 2 4), body can be simplified into false.
  // if body is A and (Eq 2 2), body can be simplified into A.
  //
  // Along the way, It also collects the remaining equalities in equalityPack.
  // The equality constraints (body->getKid(1)) is a CNF of the form
  // c1 /\ ... /\ cn. This procedure collects into equalityPack all ci for
  // 1<=i<=n which are atomic equalities, to be used in simplifying the
  // interpolant.
  std::vector<ref<Expr> > equalityPack;

  ref<Expr> fullEqualityConstraint =
      simplifyEqualityExpr(equalityPack, body->getKid(1));

  if (fullEqualityConstraint->isFalse())
    return fullEqualityConstraint;

  // Try to simplify the interpolant. If the resulting simplification
  // was the constant true, then the equality constraints would contain
  // equality with constants only and no equality with shadow (existential)
  // variables, hence it should be safe to simply return the equality
  // constraint.
  std::vector<ref<Expr> > interpolantPack;

  ref<Expr> simplifiedInterpolant =
      simplifyInterpolantExpr(interpolantPack, body->getKid(0));
  if (simplifiedInterpolant->isTrue())
    return fullEqualityConstraint;

  if (fullEqualityConstraint->isTrue()) {
    // This is the case when the result is still an existentially-quantified
    // formula, but one that does not contain free variables.
    hasExistentialsOnly =
        !hasVariableNotInSet(expr->variables, simplifiedInterpolant);
    if (hasExistentialsOnly) {
      return existsExpr->rebuild(&simplifiedInterpolant);
    }
  }

  ref<Expr> newInterpolant;

  for (std::vector<ref<Expr> >::iterator it = interpolantPack.begin(),
                                         ie = interpolantPack.end();
       it != ie; ++it) {

    ref<Expr> interpolantAtom = (*it); // For example C cmp D

    // only process the interpolant that still has existential variables in
    // it.
    if (hasVariableInSet(expr->variables, interpolantAtom)) {
      for (std::vector<ref<Expr> >::iterator it1 = equalityPack.begin(),
                                             ie1 = equalityPack.end();
           it1 != ie1; ++it1) {

        ref<Expr> equalityConstraint =
            *it1; // For example, say this constraint is A == B
        if (equalityConstraint->isFalse()) {
          return ConstantExpr::create(0, Expr::Bool);
        } else if (equalityConstraint->isTrue()) {
          return ConstantExpr::create(1, Expr::Bool);
        }
        // Left-hand side of the equality formula (A in our example) that
        // contains
        // the shadow expression (we assume that the
        // existentially-quantified
        // shadow variable is always on the left side).
        ref<Expr> equalityConstraintLeft = equalityConstraint->getKid(0);

        // Right-hand side of the equality formula (B in our example) that
        // does
        // not contain existentially-quantified shadow variables.
        ref<Expr> equalityConstraintRight = equalityConstraint->getKid(1);

        ref<Expr> newIntpLeft;
        ref<Expr> newIntpRight;

        // When the if condition holds, we perform substitution
        if (hasSubExpression(equalityConstraintLeft,
                             interpolantAtom->getKid(0))) {
          // Here we perform substitution, where given
          // an interpolant atom and an equality constraint,
          // we try to find a subexpression in the equality constraint
          // that matches the lhs expression of the interpolant atom.

          // Here we assume that the equality constraint is A == B and the
          // interpolant atom is C cmp D.

          // newIntpLeft == B
          newIntpLeft = equalityConstraintRight;

          // If equalityConstraintLeft does not have any arithmetic
          // operation
          // we could directly assign newIntpRight = D, otherwise,
          // newIntpRight == A[D/C]
          if (!llvm::isa<BinaryExpr>(equalityConstraintLeft))
            newIntpRight = interpolantAtom->getKid(1);
          else {
            // newIntpRight is A, but with every occurrence of C replaced
            // with D
            // i.e., newIntpRight == A[D/C]
            newIntpRight =
                replaceExpr(equalityConstraintLeft, interpolantAtom->getKid(0),
                            interpolantAtom->getKid(1));
          }

          interpolantAtom = ShadowArray::createBinaryOfSameKind(
              interpolantAtom, newIntpLeft, newIntpRight);
        }
      }
    }

    // We add the modified interpolant conjunct into a conjunction of
    // new interpolants.
    if (!newInterpolant.isNull()) {
      newInterpolant = AndExpr::create(newInterpolant, interpolantAtom);
    } else {
      newInterpolant = interpolantAtom;
    }
  }

  ref<Expr> newBody;

  if (!newInterpolant.isNull()) {
    if (!hasVariableInSet(expr->variables, newInterpolant))
      return newInterpolant;

    newBody = AndExpr::create(newInterpolant, fullEqualityConstraint);
  } else {
    newBody = AndExpr::create(simplifiedInterpolant, fullEqualityConstraint);
  }

  return existsExpr->rebuild(&newBody);
}

ref<Expr> SubsumptionTableEntry::replaceExpr(ref<Expr> originalExpr,
                                             ref<Expr> replacedExpr,
                                             ref<Expr> replacementExpr) {
  // We only handle binary expressions
  if (!llvm::isa<BinaryExpr>(originalExpr) ||
      llvm::isa<ConcatExpr>(originalExpr))
    return originalExpr;

  if (originalExpr->getKid(0) == replacedExpr)
    return ShadowArray::createBinaryOfSameKind(originalExpr, replacementExpr,
                                               originalExpr->getKid(1));

  if (originalExpr->getKid(1) == replacedExpr)
    return ShadowArray::createBinaryOfSameKind(
        originalExpr, originalExpr->getKid(0), replacementExpr);

  return ShadowArray::createBinaryOfSameKind(
      originalExpr,
      replaceExpr(originalExpr->getKid(0), replacedExpr, replacementExpr),
      replaceExpr(originalExpr->getKid(1), replacedExpr, replacementExpr));
}

bool SubsumptionTableEntry::hasSubExpression(ref<Expr> expr,
                                             ref<Expr> subExpr) {
  if (expr == subExpr)
    return true;
  if (expr->getNumKids() < 2 && expr != subExpr)
    return false;

  return hasSubExpression(expr->getKid(0), subExpr) ||
         hasSubExpression(expr->getKid(1), subExpr);
}

ref<Expr> SubsumptionTableEntry::simplifyInterpolantExpr(
    std::vector<ref<Expr> > &interpolantPack, ref<Expr> expr) {
  if (expr->getNumKids() < 2)
    return expr;

  if (llvm::isa<EqExpr>(expr) && llvm::isa<ConstantExpr>(expr->getKid(0)) &&
      llvm::isa<ConstantExpr>(expr->getKid(1))) {
    return (expr->getKid(0) == expr->getKid(1))
               ? ConstantExpr::create(1, Expr::Bool)
               : ConstantExpr::create(0, Expr::Bool);
  } else if (llvm::isa<NeExpr>(expr) &&
             llvm::isa<ConstantExpr>(expr->getKid(0)) &&
             llvm::isa<ConstantExpr>(expr->getKid(1))) {
    return (expr->getKid(0) != expr->getKid(1))
               ? ConstantExpr::create(1, Expr::Bool)
               : ConstantExpr::create(0, Expr::Bool);
  }

  ref<Expr> lhs = expr->getKid(0);
  ref<Expr> rhs = expr->getKid(1);

  if (!llvm::isa<AndExpr>(expr)) {

    // If the current expression has a form like (Eq false P), where P is some
    // comparison, we change it into the negation of P.
    if (llvm::isa<EqExpr>(expr) && expr->getKid(0)->getWidth() == Expr::Bool &&
        expr->getKid(0)->isFalse()) {
      if (llvm::isa<SltExpr>(rhs)) {
        expr = SgeExpr::create(rhs->getKid(0), rhs->getKid(1));
      } else if (llvm::isa<SgeExpr>(rhs)) {
        expr = SltExpr::create(rhs->getKid(0), rhs->getKid(1));
      } else if (llvm::isa<SleExpr>(rhs)) {
        expr = SgtExpr::create(rhs->getKid(0), rhs->getKid(1));
      } else if (llvm::isa<SgtExpr>(rhs)) {
        expr = SleExpr::create(rhs->getKid(0), rhs->getKid(1));
      }
    }

    // Collect unique interpolant expressions in one vector
    if (std::find(interpolantPack.begin(), interpolantPack.end(), expr) ==
        interpolantPack.end())
      interpolantPack.push_back(expr);

    return expr;
  }

  ref<Expr> simplifiedLhs = simplifyInterpolantExpr(interpolantPack, lhs);
  if (simplifiedLhs->isFalse())
    return simplifiedLhs;

  ref<Expr> simplifiedRhs = simplifyInterpolantExpr(interpolantPack, rhs);
  if (simplifiedRhs->isFalse())
    return simplifiedRhs;

  if (simplifiedLhs->isTrue())
    return simplifiedRhs;

  if (simplifiedRhs->isTrue())
    return simplifiedLhs;

  return AndExpr::create(simplifiedLhs, simplifiedRhs);
}

ref<Expr> SubsumptionTableEntry::simplifyEqualityExpr(
    std::vector<ref<Expr> > &equalityPack, ref<Expr> expr) {
  if (expr->getNumKids() < 2)
    return expr;

  if (llvm::isa<EqExpr>(expr)) {
    if (llvm::isa<ConstantExpr>(expr->getKid(0)) &&
        llvm::isa<ConstantExpr>(expr->getKid(1))) {
      return (expr->getKid(0) == expr->getKid(1))
                 ? ConstantExpr::create(1, Expr::Bool)
                 : ConstantExpr::create(0, Expr::Bool);
    }

    // Collect unique equality and in-equality expressions in one vector
    if (std::find(equalityPack.begin(), equalityPack.end(), expr) ==
        equalityPack.end())
      equalityPack.push_back(expr);

    return expr;
  }

  if (llvm::isa<AndExpr>(expr)) {
    ref<Expr> lhs = simplifyEqualityExpr(equalityPack, expr->getKid(0));
    if (lhs->isFalse())
      return lhs;

    ref<Expr> rhs = simplifyEqualityExpr(equalityPack, expr->getKid(1));
    if (rhs->isFalse())
      return rhs;

    if (lhs->isTrue())
      return rhs;

    if (rhs->isTrue())
      return lhs;

    return AndExpr::create(lhs, rhs);
  } else if (llvm::isa<OrExpr>(expr)) {
    // We provide throw-away dummy equalityPack, as we do not use the atomic
    // equalities within disjunctive clause to simplify the interpolant.
    std::vector<ref<Expr> > dummy;
    ref<Expr> lhs = simplifyEqualityExpr(dummy, expr->getKid(0));
    if (lhs->isTrue())
      return lhs;

    ref<Expr> rhs = simplifyEqualityExpr(dummy, expr->getKid(1));
    if (rhs->isTrue())
      return rhs;

    if (lhs->isFalse())
      return rhs;

    if (rhs->isFalse())
      return lhs;

    return OrExpr::create(lhs, rhs);
  }

  if (expr->getWidth() == Expr::Bool)
    return expr;

  assert(!"Invalid expression type.");
}

void
SubsumptionTableEntry::getSubstitution1(ref<Expr> equalities,
                                        std::map<ref<Expr>, ref<Expr> > &map) {
  // It is assumed the lhs is an expression on the existentially-quantified
  // variable whereas the rhs is an expression on the free variables.
  if (llvm::isa<EqExpr>(equalities)) {
    ref<Expr> lhs = equalities->getKid(0);
    if (isVariable(lhs)) {
      map[lhs] = equalities->getKid(1);
    } else if (SExtExpr *lhsSExt = llvm::dyn_cast<SExtExpr>(lhs)) {
      // Here we skin a sign-extend expression to retrieve the variable within
      if (SExtExpr *rhsSExt = llvm::dyn_cast<SExtExpr>(equalities->getKid(1))) {
        if (lhsSExt->getWidth() == rhsSExt->getWidth()) {
          lhs = lhsSExt->getKid(0);
          if (isVariable(lhs)) {
            map[lhs] = rhsSExt->getKid(0);
          }
        }
      }
    } else if (ZExtExpr *lhsZExt = llvm::dyn_cast<ZExtExpr>(lhs)) {
      // Here we skin a zero-extend expression to retrieve the variable within
      if (ZExtExpr *rhsZExt = llvm::dyn_cast<ZExtExpr>(equalities->getKid(1))) {
        if (lhsZExt->getWidth() == rhsZExt->getWidth()) {
          lhs = lhsZExt->getKid(0);
          if (isVariable(lhs)) {
            map[lhs] = rhsZExt->getKid(0);
          }
        }
      }
    }
  } else if (llvm::isa<AndExpr>(equalities)) {
    getSubstitution1(equalities->getKid(0), map);
    getSubstitution1(equalities->getKid(1), map);
  }
}

void
SubsumptionTableEntry::getSubstitution2(std::set<const Array *> &replaced,
                                        ref<Expr> equalities,
                                        std::map<ref<Expr>, ref<Expr> > &map) {
  // It is assumed the lhs is an expression on the existentially-quantified
  // variable whereas the rhs is an expression on the free variables.
  if (llvm::isa<EqExpr>(equalities)) {
    ref<Expr> lhs = equalities->getKid(0);
    ref<Expr> rhs = equalities->getKid(1);
    if (isVariable(lhs) && hasVariableInSet(replaced, lhs) &&
        !hasVariableInSet(replaced, rhs)) {
      map[lhs] = rhs;
    } else if (!hasVariableInSet(replaced, lhs) && isVariable(rhs) &&
               hasVariableInSet(replaced, rhs)) {
      map[rhs] = lhs;
    }
  } else if (llvm::isa<AndExpr>(equalities)) {
    getSubstitution2(replaced, equalities->getKid(0), map);
    getSubstitution2(replaced, equalities->getKid(1), map);
  }
}

ref<Expr>
SubsumptionTableEntry::removeUnsubstituted(std::set<const Array *> &variables,
                                           ref<Expr> equalities) {
  // It is assumed the lhs is an expression on the existentially-quantified
  // variable whereas the rhs is an expression on the free variables.
  if (llvm::isa<EqExpr>(equalities)) {
    ref<Expr> lhs = equalities->getKid(0);
    if (isVariable(lhs) && hasVariableInSet(variables, lhs)) {
      return ConstantExpr::create(1, Expr::Bool);
    } else if (SExtExpr *lhsSExt = llvm::dyn_cast<SExtExpr>(lhs)) {
      // Here we skin a sign-extend expression to retrieve the variable within
      if (SExtExpr *rhsSExt = llvm::dyn_cast<SExtExpr>(equalities->getKid(1))) {
        if (lhsSExt->getWidth() == rhsSExt->getWidth()) {
          lhs = lhsSExt->getKid(0);
          if (isVariable(lhs) && hasVariableInSet(variables, lhs)) {
            return ConstantExpr::create(1, Expr::Bool);
          }
        }
      }
    } else if (ZExtExpr *lhsZExt = llvm::dyn_cast<ZExtExpr>(lhs)) {
      // Here we skin a zero-extend expression to retrieve the variable within
      if (ZExtExpr *rhsZExt = llvm::dyn_cast<ZExtExpr>(equalities->getKid(1))) {
        if (lhsZExt->getWidth() == rhsZExt->getWidth()) {
          lhs = lhsZExt->getKid(0);
          if (isVariable(lhs) && hasVariableInSet(variables, lhs)) {
            return ConstantExpr::create(1, Expr::Bool);
          }
        }
      }
    }
    return equalities;
  }

  if (llvm::isa<AndExpr>(equalities)) {
    ref<Expr> lhs = removeUnsubstituted(variables, equalities->getKid(0));
    ref<Expr> rhs = removeUnsubstituted(variables, equalities->getKid(1));
    if (lhs->isTrue()) {
      if (rhs->isTrue()) {
        return ConstantExpr::create(1, Expr::Bool);
      }
      return rhs;
    } else {
      if (rhs->isTrue()) {
        return lhs;
      }
      return AndExpr::create(lhs, rhs);
    }
  }
  return equalities;
}

bool SubsumptionTableEntry::detectConflictPrimitives(ExecutionState &state,
                                                     ref<Expr> expr) {
  if (llvm::isa<ExistsExpr>(expr))
    return true;

  std::vector<ref<Expr> > conjunction;
  if (!fetchExprEqualityConjucts(conjunction, expr)) {
    return false;
  }

  for (std::vector<ref<Expr> >::const_iterator it1 = state.constraints.begin(),
                                               ie1 = state.constraints.end();
       it1 != ie1; ++it1) {

    if ((*it1)->getKind() != Expr::Eq)
      continue;

    for (std::vector<ref<Expr> >::const_iterator it2 = conjunction.begin(),
                                                 ie2 = conjunction.end();
         it2 != ie2; ++it2) {

      ref<Expr> stateConstraintExpr = it1->get();
      ref<Expr> exprEqConstraint = it2->get();

      if (stateConstraintExpr != exprEqConstraint &&
          (llvm::isa<EqExpr>(stateConstraintExpr) ||
           llvm::isa<EqExpr>(exprEqConstraint))) {

        if (stateConstraintExpr ==
                EqExpr::create(ConstantExpr::create(0, Expr::Bool),
                               exprEqConstraint) ||
            EqExpr::create(ConstantExpr::create(0, Expr::Bool),
                           stateConstraintExpr) == exprEqConstraint) {
          return false;
        }
      }
    }
  }

  return true;
}

bool SubsumptionTableEntry::fetchExprEqualityConjucts(
    std::vector<ref<Expr> > &conjunction, ref<Expr> expr) {

  if (!llvm::isa<AndExpr>(expr)) {
    if (expr->getKind() == Expr::Eq) {

      EqExpr *equality = llvm::dyn_cast<EqExpr>(expr);

      if (llvm::isa<ConstantExpr>(equality->getKid(0)) &&
          llvm::isa<ConstantExpr>(equality->getKid(1)) &&
          equality->getKid(0) != equality->getKid(1)) {
        return false;
      } else {
        conjunction.push_back(expr);
      }
    }
    return true;
  }

  return fetchExprEqualityConjucts(conjunction, expr->getKid(0)) &&
         fetchExprEqualityConjucts(conjunction, expr->getKid(1));
}

ref<Expr> SubsumptionTableEntry::simplifyExistsExpr(ref<Expr> existsExpr,
                                                    bool &hasExistentialsOnly) {
  assert(llvm::isa<ExistsExpr>(existsExpr));

  ExistsExpr *expr = llvm::dyn_cast<ExistsExpr>(existsExpr);
  ref<Expr> body = expr->body;

  assert(llvm::isa<AndExpr>(body));

  std::map<ref<Expr>, ref<Expr> > substitution1;
  ref<Expr> equalities = body->getKid(1);
  getSubstitution1(equalities, substitution1);

  ref<Expr> interpolant =
      ApplySubstitutionVisitor(substitution1).visit(body->getKid(0));

  if (hasVariableInSet(expr->variables, equalities)) {
    // we could also replace the occurrence of some variables with its
    // corresponding substitution mapping.
    equalities = ApplySubstitutionVisitor(substitution1).visit(equalities);
    equalities = removeUnsubstituted(expr->variables, equalities);
  }

  // We look for substitutions in the interpolant part and apply them to the
  // interpolant itself.
  std::map<ref<Expr>, ref<Expr> > substitution2;
  getSubstitution2(expr->variables, interpolant, substitution2);
  interpolant = ApplySubstitutionVisitor(substitution2).visit(interpolant);

  ref<Expr> newBody = AndExpr::create(interpolant, equalities);

  // FIXME: Need to test the performance of the following.
  if (!hasVariableInSet(expr->variables, newBody))
    return newBody;

  ref<Expr> ret = simplifyArithmeticBody(existsExpr->rebuild(&newBody),
                                         hasExistentialsOnly);
  return ret;
}

bool SubsumptionTableEntry::subsumed(
    TimingSolver *solver, ExecutionState &state, double timeout,
    TxStore::TopInterpolantStore &_concretelyAddressedStore,
    TxStore::TopInterpolantStore &_symbolicallyAddressedStore,
    TxStore::LowerInterpolantStore &_concretelyAddressedHistoricalStore,
    TxStore::LowerInterpolantStore &_symbolicallyAddressedHistoricalStore,
    int debugSubsumptionLevel) {
#ifdef ENABLE_Z3
  // Tell the solver implementation that we are checking for subsumption for
  // collecting statistics of solver calls.
  SubsumptionCheckMarker subsumptionCheckMarker;

  // Quick check for subsumption in case the interpolant is empty
  if (empty()) {
    if (debugSubsumptionLevel >= 1) {
      klee_message("#%lu=>#%lu: Check success due to empty table entry",
                   state.txTreeNode->getNodeSequenceNumber(),
                   nodeSequenceNumber);
    }
    return true;
  }

  ref<Expr> stateEqualityConstraints;

  // Translation of allocation in the current state into an allocation in the
  // tabled interpolant. This translation is used to equate absolute address
  // values for allocations of matching sizes.
  std::map<ref<AllocationInfo>, ref<AllocationInfo> > unifiedBases;

  // Pointer values in the core for memory bounds interpolation.
  std::map<ref<TxInterpolantValue>, std::set<ref<Expr> > > corePointerValues;

  // Pointer values in the core for exact equality
  std::set<ref<TxInterpolantValue> > coreExactPointerValues;

  {
    TimerStatIncrementer t(concretelyAddressedStoreExpressionBuildTime);

    // Build constraints from concrete-address interpolant store
    for (TxStore::TopInterpolantStore::const_iterator
             it1 = _concretelyAddressedStore.begin(),
             ie1 = _concretelyAddressedStore.end();
         it1 != ie1; ++it1) {

      const TxStore::LowerInterpolantStore &tabledConcreteMap = it1->second;
      const TxStore::LowerInterpolantStore &stateConcreteMap =
          _concretelyAddressedStore[it1->first];
      const TxStore::LowerInterpolantStore &stateSymbolicMap =
          _symbolicallyAddressedStore[it1->first];

      // If the current state is empty, subsumption fails.
      if (stateConcreteMap.empty() && stateSymbolicMap.empty()) {
        if (debugSubsumptionLevel >= 1) {
          klee_message("#%lu=>#%lu: Check failure due to empty state concrete "
                       "and symbolic maps",
                       state.txTreeNode->getNodeSequenceNumber(),
                       nodeSequenceNumber);
        }
        return false;
      }

      for (TxStore::LowerInterpolantStore::const_iterator
               it2 = tabledConcreteMap.begin(),
               ie2 = tabledConcreteMap.end();
           it2 != ie2; ++it2) {

        // The address is not constrained by the current state, therefore
        // the current state is incomparable to the stored interpolant,
        // and we therefore fail the subsumption.
        if (!stateConcreteMap.count(it2->first)) {
          if (debugSubsumptionLevel >= 1) {
            std::string msg;
            std::string padding(makeTabs(1));
            llvm::raw_string_ostream stream(msg);
            it2->first->print(stream, padding);
            stream.flush();
            klee_message("#%lu=>#%lu: Check failure as memory region in the "
                         "table does not exist in the state:\n%s",
                         state.txTreeNode->getNodeSequenceNumber(),
                         nodeSequenceNumber, msg.c_str());
          }
          return false;
        }

        const ref<TxInterpolantValue> tabledValue = it2->second;
        ref<TxInterpolantValue> stateValue = stateConcreteMap.at(it2->first);
        ref<Expr> res;

        if (!stateValue.isNull()) {
          // There is the corresponding concrete allocation
          if (tabledValue->getExpression()->getWidth() !=
              stateValue->getExpression()->getWidth()) {
            // We conservatively fail the subsumption in case the sizes do not
            // match.
            if (debugSubsumptionLevel >= 1) {
              std::string msg;
              klee_message("#%lu=>#%lu: Check failure as sizes of stored "
                           "values do not match%s",
                           state.txTreeNode->getNodeSequenceNumber(),
                           nodeSequenceNumber, msg.c_str());
            }
            return false;
          } else if (Dependency::boundInterpolation() &&
                     tabledValue->isPointer() && stateValue->isPointer()) {
            if (!ExactAddressInterpolant && tabledValue->useBound()) {
              std::set<ref<Expr> > bounds;
              ref<Expr> boundsCheck = tabledValue->getBoundsCheck(
                  stateValue, bounds, unifiedBases, debugSubsumptionLevel);
              if (boundsCheck->isFalse()) {
                if (debugSubsumptionLevel >= 1) {
                  std::string msg;
                  klee_message("#%lu=>#%lu: Check failure due to failure in "
                               "memory bounds check%s",
                               state.txTreeNode->getNodeSequenceNumber(),
                               nodeSequenceNumber, msg.c_str());
                }
                return false;
              }
              if (!boundsCheck->isTrue())
                res = boundsCheck;

              // We record the LLVM value of the pointer
              corePointerValues[stateValue] = bounds;
            } else {
              ref<Expr> offsetsCheck = tabledValue->getOffsetsCheck(
                  stateValue, unifiedBases, debugSubsumptionLevel);

              if (offsetsCheck->isFalse()) {
                if (debugSubsumptionLevel >= 1) {
                  std::string msg;
                  klee_message("#%lu=>#%lu: Check failure due to failure in "
                               "offset equality check%s",
                               state.txTreeNode->getNodeSequenceNumber(),
                               nodeSequenceNumber, msg.c_str());
                }
                return false;
              }
              if (!offsetsCheck->isTrue())
                res = offsetsCheck;

              // We record the value of the pointer for interpolation marking
              coreExactPointerValues.insert(stateValue);
            }
          } else {
            res = EqExpr::create(tabledValue->getExpression(),
                                 stateValue->getExpression());
            if (res->isFalse()) {
              if (debugSubsumptionLevel >= 1) {
                if (debugSubsumptionLevel >= 2) {
                  std::string msg;
                  llvm::raw_string_ostream stream(msg);
                  tabledValue->getExpression()->print(stream);
                  stream << " (interpolant) vs. ";
                  stateValue->getExpression()->print(stream);
                  stream << " (state)";
                  stream.flush();
                  klee_message(
                      "#%lu=>#%lu: Check failure due to unequal content: %s",
                      state.txTreeNode->getNodeSequenceNumber(),
                      nodeSequenceNumber, msg.c_str());
                } else {
                  klee_message(
                      "#%lu=>#%lu: Check failure due to unequal content",
                      state.txTreeNode->getNodeSequenceNumber(),
                      nodeSequenceNumber);
                }

                if (debugSubsumptionLevel >= 3) {
                  std::string msg;
                  llvm::raw_string_ostream stream1(msg);

                  it2->first->print(stream1, makeTabs(1));
                  stream1.flush();

                  klee_message("with value stored in address:\n%s",
                               msg.c_str());
                }
              }
              return false;
            } else if (debugSubsumptionLevel >= 1 && res->isTrue()) {
              if (debugSubsumptionLevel >= 2) {
                std::string msg;
                llvm::raw_string_ostream stream(msg);
                tabledValue->getExpression()->print(stream);
                stream.flush();
                klee_message("#%lu=>#%lu: Equal contents: %s",
                             state.txTreeNode->getNodeSequenceNumber(),
                             nodeSequenceNumber, msg.c_str());
              } else {
                klee_message("#%lu=>#%lu: Equal contents",
                             state.txTreeNode->getNodeSequenceNumber(),
                             nodeSequenceNumber);
              }

              if (debugSubsumptionLevel >= 3) {
                std::string msg3;
                llvm::raw_string_ostream stream1(msg3);

                it2->first->print(stream1, makeTabs(1));
                stream1.flush();

                klee_message("with value stored in address:\n%s", msg3.c_str());
              }
            }
          }
        }

        if (!stateSymbolicMap.empty()) {
          const ref<Expr> tabledConcreteOffset = it2->first->getOffset();
          ref<Expr> conjunction;

          for (TxStore::LowerInterpolantStore::const_iterator
                   it3 = stateSymbolicMap.begin(),
                   ie3 = stateSymbolicMap.end();
               it3 != ie3; ++it3) {

            // We make sure the context part of the addresses (the allocation
            // site and the call history) are equivalent.
            if (it2->first->getContext() != it3->first->getContext())
              continue;

            ref<Expr> constraint = makeConstraint(
                state, it2->second, it3->second, it2->first->getOffset(),
                it3->first->getOffset(), corePointerValues,
                coreExactPointerValues, unifiedBases, debugSubsumptionLevel);

            if (constraint.isNull())
              return false;

            if (!conjunction.isNull()) {
              conjunction = AndExpr::create(constraint, conjunction);
            } else {
              conjunction = constraint;
            }
          }
          // If there were corresponding concrete as well as symbolic
          // allocations in the current state, conjunct them
          if (!conjunction.isNull()) {
            res = (!res.isNull() ? AndExpr::create(res, conjunction)
                                 : conjunction);
          }
        }

        if (!res.isNull()) {
          stateEqualityConstraints =
              (stateEqualityConstraints.isNull()
                   ? res
                   : AndExpr::create(res, stateEqualityConstraints));
        }
      }
    }

    //------------------------------------------------------------------------
    // Historical concretely-addressed store
    //------------------------------------------------------------------------
    for (TxStore::LowerInterpolantStore::const_iterator
             it1 = concretelyAddressedHistoricalStore.begin(),
             ie1 = concretelyAddressedHistoricalStore.end();
         it1 != ie1; ++it1) {
      ref<Expr> constraint;
      TxStore::LowerInterpolantStore::const_iterator stateIt =
          _concretelyAddressedHistoricalStore.find(it1->first);

      if (stateIt == _concretelyAddressedHistoricalStore.end()) {
        // FIXME: This is horribly inefficient: should implement better indexing
        // based on the allocation info instead
        bool matchFound = false;
        for (TxStore::LowerInterpolantStore::const_iterator
                 it2 = _symbolicallyAddressedHistoricalStore.begin(),
                 ie2 = _symbolicallyAddressedHistoricalStore.end();
             it2 != ie2; ++it2) {
          if (it1->first->getAllocationInfo() ==
              it2->first->getAllocationInfo()) {
            matchFound = true;
            constraint = makeConstraint(
                state, it1->second, it2->second, it1->first->getOffset(),
                it2->first->getOffset(), corePointerValues,
                coreExactPointerValues, unifiedBases, debugSubsumptionLevel);
            if (constraint.isNull())
              return false;
            if (stateEqualityConstraints.isNull()) {
              stateEqualityConstraints = constraint;
            } else {
              stateEqualityConstraints =
                  AndExpr::create(constraint, stateEqualityConstraints);
            }
          }
        }
        if (!matchFound)
          return false;
      } else {
        constraint = EqExpr::create(it1->second->getExpression(),
                                    stateIt->second->getExpression());
      }

      if (stateEqualityConstraints.isNull()) {
        stateEqualityConstraints = constraint;
      } else {
        stateEqualityConstraints =
            AndExpr::create(constraint, stateEqualityConstraints);
      }
    }
  }

  {
    TimerStatIncrementer t(symbolicallyAddressedStoreExpressionBuildTime);
    // Build constraints from symbolic-address interpolant store
    for (TxStore::TopInterpolantStore::const_iterator
             it1 = _symbolicallyAddressedStore.begin(),
             ie1 = _symbolicallyAddressedStore.end();
         it1 != ie1; ++it1) {
      const TxStore::LowerInterpolantStore &tabledSymbolicMap = it1->second;
      const TxStore::LowerInterpolantStore &stateConcreteMap =
          _concretelyAddressedStore[it1->first];
      const TxStore::LowerInterpolantStore &stateSymbolicMap =
          _symbolicallyAddressedStore[it1->first];

      ref<Expr> conjunction;

      for (TxStore::LowerInterpolantStore::const_iterator
               it2 = tabledSymbolicMap.begin(),
               ie2 = tabledSymbolicMap.end();
           it2 != ie2; ++it2) {

        for (TxStore::LowerInterpolantStore::const_iterator
                 it3 = stateConcreteMap.begin(),
                 ie3 = stateConcreteMap.end();
             it3 != ie3; ++it3) {

          // We make sure the context part of the addresses (the allocation
          // site and the call history) are equivalent.
          if (it2->first->getContext() != it3->first->getContext())
            continue;

          ref<Expr> constraint = makeConstraint(
              state, it2->second, it3->second, it2->first->getOffset(),
              it3->first->getOffset(), corePointerValues,
              coreExactPointerValues, unifiedBases, debugSubsumptionLevel);

          if (constraint.isNull())
            return false;

          if (!constraint.isNull()) {
            if (!conjunction.isNull()) {
              conjunction = AndExpr::create(constraint, conjunction);
            } else {
              conjunction = constraint;
            }
          }
        }

        for (TxStore::LowerInterpolantStore::const_iterator
                 it3 = stateSymbolicMap.begin(),
                 ie3 = stateSymbolicMap.end();
             it3 != ie3; ++it3) {

          // We make sure the context part of the addresses (the allocation
          // site and the call history) are equivalent.
          if (it2->first->getContext() != it3->first->getContext())
            continue;

          ref<Expr> constraint = makeConstraint(
              state, it2->second, it3->second, it2->first->getOffset(),
              it3->first->getOffset(), corePointerValues,
              coreExactPointerValues, unifiedBases, debugSubsumptionLevel);

          if (constraint.isNull())
            return false;

            if (!conjunction.isNull()) {
              conjunction = AndExpr::create(constraint, conjunction);
            } else {
              conjunction = constraint;
            }
        }
      }

      if (!conjunction.isNull()) {
        stateEqualityConstraints =
            (stateEqualityConstraints.isNull()
                 ? conjunction
                 : AndExpr::create(conjunction, stateEqualityConstraints));
      }
    }

    //------------------------------------------------------------------------
    // Historical symbolically-addressed store
    //------------------------------------------------------------------------
    for (TxStore::LowerInterpolantStore::const_iterator
             it1 = symbolicallyAddressedHistoricalStore.begin(),
             ie1 = symbolicallyAddressedHistoricalStore.end();
         it1 != ie1; ++it1) {
      bool matchFound = false;
      // FIXME: This is horribly inefficient: should implement better indexing
      // based on allocation info instead
      for (TxStore::LowerInterpolantStore::const_iterator
               it2 = _concretelyAddressedHistoricalStore.begin(),
               ie2 = _concretelyAddressedHistoricalStore.end();
           it2 != ie2; ++it2) {
        if (it1->first->getAllocationInfo() ==
            it2->first->getAllocationInfo()) {
          ref<Expr> constraint = makeConstraint(
              state, it1->second, it2->second, it1->first->getOffset(),
              it2->first->getOffset(), corePointerValues,
              coreExactPointerValues, unifiedBases, debugSubsumptionLevel);
          if (constraint.isNull())
            return false;
          if (stateEqualityConstraints.isNull()) {
            stateEqualityConstraints = constraint;
          } else {
            stateEqualityConstraints =
                AndExpr::create(constraint, stateEqualityConstraints);
          }
          matchFound = true;
        }
      }

      // FIXME: This is horribly inefficient: should implement better indexing
      // based on allocation info instead
      for (TxStore::LowerInterpolantStore::const_iterator
               it2 = _symbolicallyAddressedHistoricalStore.begin(),
               ie2 = _symbolicallyAddressedHistoricalStore.end();
           it2 != ie2; ++it2) {
        if (it1->first->getAllocationInfo() ==
            it2->first->getAllocationInfo()) {
          ref<Expr> constraint = makeConstraint(
              state, it1->second, it2->second, it1->first->getOffset(),
              it2->first->getOffset(), corePointerValues,
              coreExactPointerValues, unifiedBases, debugSubsumptionLevel);
          if (constraint.isNull())
            return false;
          if (stateEqualityConstraints.isNull()) {
            stateEqualityConstraints = constraint;
          } else {
            stateEqualityConstraints =
                AndExpr::create(constraint, stateEqualityConstraints);
          }
          matchFound = true;
        }
      }

      if (!matchFound)
        return false;
    }
  }

  Solver::Validity result;
  ref<Expr> expr; // The query expression

  {
    TimerStatIncrementer t(solverAccessTime);

    // Here we build the query expression, after which it is always a
    // conjunction of the interpolant and the state equality constraints. Here
    // we call AndExpr::alloc instead of AndExpr::create as we need to guarantee
    // that the resulting expression is an AndExpr, otherwise simplifyExistsExpr
    // would not work.
    if (!interpolant.isNull()) {
      expr = !stateEqualityConstraints.isNull()
                 ? AndExpr::alloc(interpolant, stateEqualityConstraints)
                 : AndExpr::alloc(interpolant,
                                  ConstantExpr::create(1, Expr::Bool));
    } else if (!stateEqualityConstraints.isNull()) {
      expr = AndExpr::alloc(ConstantExpr::create(1, Expr::Bool),
                            stateEqualityConstraints);
    } else {
      // Here both the interpolant constraints and state equality
      // constraints are empty, therefore everything gets subsumed
      if (debugSubsumptionLevel >= 1) {
        std::string msg = "";
        if (!corePointerValues.empty()) {
          msg += " (with successful memory bound checks)";
        }
        klee_message("#%lu=>#%lu: Check success as interpolant is empty%s",
                     state.txTreeNode->getNodeSequenceNumber(),
                     nodeSequenceNumber, msg.c_str());
      }

      // We build memory bounds interpolants from pointer values
      std::string reason = "";
      if (debugSubsumptionLevel >= 1) {
        llvm::raw_string_ostream stream(reason);
        llvm::Instruction *instr = state.pc->inst;
        stream << "interpolating memory bound for subsumption at ";
        if (instr->getParent()->getParent()) {
          std::string functionName(
              instr->getParent()->getParent()->getName().str());
          stream << functionName << ": ";
          if (llvm::MDNode *n = instr->getMetadata("dbg")) {
            llvm::DILocation loc(n);
            stream << "Line " << loc.getLineNumber();
          } else {
            instr->print(stream);
          }
        } else {
          instr->print(stream);
        }
      }
      for (std::map<ref<TxInterpolantValue>, std::set<ref<Expr> > >::iterator
               it = corePointerValues.begin(),
               ie = corePointerValues.end();
           it != ie; ++it) {
        bool memoryError = state.txTreeNode->pointerValuesInterpolation(
            it->first->getValue(), it->first->getExpression(), it->second,
            reason);
        assert(!memoryError &&
               "interpolation should not result in memory error");
      }

      for (std::set<ref<TxInterpolantValue> >::iterator
               it = coreExactPointerValues.begin(),
               ie = coreExactPointerValues.end();
           it != ie; ++it) {
        state.txTreeNode->exactPointerValuesInterpolation(
            (*it)->getValue(), (*it)->getExpression(), reason);
      }
      return true;
    }

    bool exprHasNoFreeVariables = false;

    if (!existentials.empty()) {
      ref<Expr> existsExpr = ExistsExpr::create(existentials, expr);
      if (debugSubsumptionLevel >= 2) {
        klee_message("Before simplification:\n%s",
                     PrettyExpressionBuilder::constructQuery(
                         state.constraints, existsExpr).c_str());
      }
      expr = simplifyExistsExpr(existsExpr, exprHasNoFreeVariables);
    }

    // If query expression simplification result was false, we quickly fail
    // without calling the solver
    if (expr->isFalse()) {
      if (debugSubsumptionLevel >= 1) {
        klee_message("#%lu=>#%lu: Check failure as consequent is unsatisfiable",
                     state.txTreeNode->getNodeSequenceNumber(),
                     nodeSequenceNumber);
      }
      return false;
    }

    bool success = false;

    if (!detectConflictPrimitives(state, expr)) {
      if (debugSubsumptionLevel >= 1) {
        klee_message(
            "#%lu=>#%lu: Check failure as contradictory equalities detected",
            state.txTreeNode->getNodeSequenceNumber(), nodeSequenceNumber);
      }
      return false;
    }

    std::vector<ref<Expr> > unsatCore;

    // We call the solver only when the simplified query expression is not a
    // constant and no contradictory unary constraints found from
    // solvingUnaryConstraints method.
    if (!llvm::isa<ConstantExpr>(expr)) {
      if (!existentials.empty() && llvm::isa<ExistsExpr>(expr)) {
        if (debugSubsumptionLevel >= 2) {
          klee_message("Existentials not empty");
        }

        if (exprHasNoFreeVariables) {
          // In case the query expression has no free variables, we reformulate
          // the solver call as satisfiability check of the body of the query
          // expression.
          ConstraintManager constraints;

          ref<Expr> falseExpr = ConstantExpr::create(0, Expr::Bool);
          constraints.addConstraint(expr->getKid(0));

          if (debugSubsumptionLevel >= 2) {
            klee_message("Querying for satisfiability check:\n%s",
                         PrettyExpressionBuilder::constructQuery(
                             constraints, falseExpr).c_str());
          }

          bool noSolution;
          solver->setTimeout(timeout);
          success = solver->solver->mustBeTrue(Query(constraints, falseExpr),
                                               noSolution);
          solver->setTimeout(0);

          if (!success || noSolution)
            return false;

          // We can return here as there is no need to compute the
          // interpolation.
          return true;
        } else {
          if (debugSubsumptionLevel >= 2) {
            klee_message("Querying for subsumption check:\n%s",
                         PrettyExpressionBuilder::constructQuery(
                             state.constraints, expr).c_str());
          }

          // Instantiate a new Z3 solver to make sure we use Z3
          // without pre-solving optimizations. It would be nice
          // in the future to just run solver->evaluate so that
          // the optimizations can be used, but this requires
          // handling of quantified expressions by KLEE's pre-solving
          // procedure, which does not exist currently.
          Z3Solver *z3solver = new Z3Solver();
          z3solver->setCoreSolverTimeout(timeout);
          success = z3solver->directComputeValidity(
              Query(state.constraints, expr), result, unsatCore);
          z3solver->setCoreSolverTimeout(0);
          delete z3solver;

          if (!success || result != Solver::True)
            return false;
        }


      } else {
        if (debugSubsumptionLevel >= 2) {
          klee_message("Querying for subsumption check:\n%s",
                       PrettyExpressionBuilder::constructQuery(
                           state.constraints, expr).c_str());
        }
        // We call the solver in the standard way if the
        // formula is unquantified.
        solver->setTimeout(timeout);
        success = solver->evaluate(state, expr, result, unsatCore);
        solver->setTimeout(0);

        if (!success || result != Solver::True)
          return false;
      }
    } else {
      // expr is a constant expression
      if (expr->isTrue()) {
        if (debugSubsumptionLevel >= 1) {
          std::string msg = "";
          if (!corePointerValues.empty()) {
            msg += " (with successful memory bound checks)";
          }
          klee_message(
              "#%lu=>#%lu: Check success as query expression is true%s",
              state.txTreeNode->getNodeSequenceNumber(), nodeSequenceNumber,
              msg.c_str());
        }

        if (Dependency::boundInterpolation() && !ExactAddressInterpolant) {
          // We build memory bounds interpolants from pointer values
          std::string reason = "";
          if (debugSubsumptionLevel >= 1) {
            llvm::raw_string_ostream stream(reason);
            llvm::Instruction *instr = state.pc->inst;
            stream << "interpolating memory bound for subsumption at ";
            if (instr->getParent()->getParent()) {
              std::string functionName(
                  instr->getParent()->getParent()->getName().str());
              stream << functionName << ": ";
              if (llvm::MDNode *n = instr->getMetadata("dbg")) {
                llvm::DILocation loc(n);
                stream << "Line " << loc.getLineNumber();
              } else {
                instr->print(stream);
              }
            } else {
              instr->print(stream);
            }
          }
          for (std::map<ref<TxInterpolantValue>,
                        std::set<ref<Expr> > >::iterator
                   it = corePointerValues.begin(),
                   ie = corePointerValues.end();
               it != ie; ++it) {
            bool memoryError = state.txTreeNode->pointerValuesInterpolation(
                it->first->getValue(), it->first->getExpression(), it->second,
                reason);
            assert(!memoryError &&
                   "interpolation should not result in memory error");
          }
        }
        return true;
      }
      if (debugSubsumptionLevel >= 1) {
        klee_message(
            "#%lu=>#%lu: Check failure as query expression is non-true",
            state.txTreeNode->getNodeSequenceNumber(), nodeSequenceNumber);
      }
      return false;
    }

      // State subsumed, we mark needed constraints on the
      // path condition.
      if (debugSubsumptionLevel >= 1) {
        std::string msg = "";
        if (!corePointerValues.empty()) {
          msg += " (with successful memory bound checks)";
        }
        klee_message("#%lu=>#%lu: Check success as solver decided validity%s",
                     state.txTreeNode->getNodeSequenceNumber(),
                     nodeSequenceNumber, msg.c_str());
      }

      // We create path condition marking structure and mark core constraints
      state.txTreeNode->unsatCoreInterpolation(unsatCore);

      if (Dependency::boundInterpolation() && !ExactAddressInterpolant) {
        // We build memory bounds interpolants from pointer values
        std::string reason = "";
        if (debugSubsumptionLevel >= 1) {
          llvm::raw_string_ostream stream(reason);
          llvm::Instruction *instr = state.pc->inst;
          stream << "interpolating memory bound for subsumption at ";
          if (instr->getParent()->getParent()) {
            std::string functionName(
                instr->getParent()->getParent()->getName().str());
            stream << functionName << ": ";
            if (llvm::MDNode *n = instr->getMetadata("dbg")) {
              llvm::DILocation loc(n);
              stream << "Line " << loc.getLineNumber();
            } else {
              instr->print(stream);
            }
          } else {
            instr->print(stream);
          }
        }
        for (std::map<ref<TxInterpolantValue>, std::set<ref<Expr> > >::iterator
                 it = corePointerValues.begin(),
                 ie = corePointerValues.end();
             it != ie; ++it) {
          bool memoryError = state.txTreeNode->pointerValuesInterpolation(
              it->first->getValue(), it->first->getExpression(), it->second,
              reason);
          assert(!memoryError &&
                 "interpolation should not result in memory error");
        }
      }

      return true;
  }
#endif /* ENABLE_Z3 */
  return false;
}

ref<Expr> SubsumptionTableEntry::getInterpolant() const { return interpolant; }

void SubsumptionTableEntry::print(llvm::raw_ostream &stream) const {
  print(stream, 0);
}

void SubsumptionTableEntry::print(llvm::raw_ostream &stream,
                                  const unsigned paddingAmount) const {
  print(stream, makeTabs(paddingAmount));
}

void SubsumptionTableEntry::print(llvm::raw_ostream &stream,
                                  const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);
  std::string tabsNextNext = appendTab(tabsNext);

  stream << prefix << "------------ Subsumption Table Entry ------------\n";
  stream << prefix << "Program point = " << programPoint << "\n";
  stream << prefix << "interpolant = ";
  if (!interpolant.isNull())
    interpolant->print(stream);
  else
    stream << "(empty)";

  stream << "\n" << prefix << "concretely-addressed store = [";
  if (!concretelyAddressedStore.empty()) {
    stream << "\n";
    for (TxStore::TopInterpolantStore::const_iterator
             is1 = concretelyAddressedStore.begin(),
             ie1 = concretelyAddressedStore.end(), it1 = is1;
         it1 != ie1; ++it1) {
      for (TxStore::LowerInterpolantStore::const_iterator
               is2 = it1->second.begin(),
               ie2 = it1->second.end(), it2 = is2;
           it2 != ie2; ++it2) {
        if (it1 != is1 || it2 != is2)
          stream << tabsNext << "------------------------------------------\n";
        stream << tabsNext << "address:\n";
        it2->first->print(stream, tabsNextNext);
        stream << "\n";
        stream << tabsNext << "content:\n";
        it2->second->print(stream, tabsNextNext);
        stream << "\n";
      }
    }
    stream << prefix;
  }
  stream << "]";

  stream << "\n" << prefix << "symbolically-addressed store = [";
  if (!symbolicallyAddressedStore.empty()) {
    stream << "\n";
    for (TxStore::TopInterpolantStore::const_iterator
             is1 = symbolicallyAddressedStore.begin(),
             ie1 = symbolicallyAddressedStore.end(), it1 = is1;
         it1 != ie1; ++it1) {
      for (TxStore::LowerInterpolantStore::const_iterator
               is2 = it1->second.begin(),
               ie2 = it1->second.end(), it2 = is2;
           it2 != ie2; ++it2) {
        if (it1 != is1 || it2 != is2)
          stream << tabsNext << "------------------------------------------\n";
        stream << tabsNext << "address:\n";
        it2->first->print(stream, tabsNextNext);
        stream << "\n";
        stream << tabsNext << "content:\n";
        it2->second->print(stream, tabsNextNext);
        stream << "\n";
      }
    }
    stream << prefix;
  }
  stream << "]";

  stream << "\n" << prefix << "concretely-addressed historical store = [";
  if (!concretelyAddressedHistoricalStore.empty()) {
    stream << "\n";
    for (TxStore::LowerInterpolantStore::const_iterator
             is1 = concretelyAddressedHistoricalStore.begin(),
             ie1 = concretelyAddressedHistoricalStore.end(), it1 = is1;
         it1 != ie1; ++it1) {
      if (it1 != is1)
        stream << tabsNext << "------------------------------------------\n";
      stream << tabsNext << "address:\n";
      it1->first->print(stream, tabsNextNext);
      stream << "\n";
      stream << tabsNext << "content:\n";
      it1->second->print(stream, tabsNextNext);
      stream << "\n";
    }
    stream << prefix;
  }
  stream << "]";

  stream << "\n" << prefix << "symbolically-addressed historical store = [";
  if (!symbolicallyAddressedHistoricalStore.empty()) {
    stream << "\n";
    for (TxStore::LowerInterpolantStore::const_iterator
             is1 = symbolicallyAddressedHistoricalStore.begin(),
             ie1 = symbolicallyAddressedHistoricalStore.end(), it1 = is1;
         it1 != ie1; ++it1) {
      if (it1 != is1)
        stream << tabsNext << "------------------------------------------\n";
      stream << tabsNext << "address:\n";
      it1->first->print(stream, tabsNextNext);
      stream << "\n";
      stream << tabsNext << "content:\n";
      it1->second->print(stream, tabsNextNext);
      stream << "\n";
    }
    stream << prefix;
  }
  stream << "]";

  stream << "\n" << prefix << "existentials = [";
  if (!existentials.empty()) {
    for (std::set<const Array *>::const_iterator is = existentials.begin(),
                                                 ie = existentials.end(),
                                                 it = is;
         it != ie; ++it) {
      if (it != is)
        stream << ", ";
      stream << (*it)->name;
    }
  }
  stream << "]";
}

void SubsumptionTableEntry::printStat(std::stringstream &stream) {
  stream << "KLEE: done:     Time for actual solver calls in subsumption check "
            "(ms) = " << ((double)stats::subsumptionQueryTime.getValue()) / 1000
         << "\n";
  stream << "KLEE: done:     Number of solver calls for subsumption check "
            "(failed) = " << stats::subsumptionQueryCount.getValue() << " ("
         << stats::subsumptionQueryFailureCount.getValue() << ")\n";
  stream << "KLEE: done:     Concrete store expression build time (ms) = "
         << ((double)concretelyAddressedStoreExpressionBuildTime.getValue()) /
                1000 << "\n";
  stream << "KLEE: done:     Symbolic store expression build time (ms) = "
         << ((double)symbolicallyAddressedStoreExpressionBuildTime.getValue()) /
                1000 << "\n";
  stream << "KLEE: done:     Solver access time (ms) = "
         << ((double)solverAccessTime.getValue()) / 1000 << "\n";
}

/**/

void SubsumptionTable::CallHistoryIndexedTable::Node::print(
    llvm::raw_ostream &stream) const {
  print(stream, 0);
}

void SubsumptionTable::CallHistoryIndexedTable::Node::print(
    llvm::raw_ostream &stream, const unsigned paddingAmount) const {
  print(stream, makeTabs(paddingAmount));
}

void SubsumptionTable::CallHistoryIndexedTable::Node::print(
    llvm::raw_ostream &stream, const std::string &prefix) const {
  std::string tabsNext = appendTab(prefix);

  stream << "\n";
  stream << tabsNext << "Call history-indexed table tree node\n";
  if (id) {
    stream << tabsNext << "node Id = " << reinterpret_cast<uintptr_t>(id)
           << "\n";
  } else {
    stream << tabsNext << "node Id = (root)\n";
  }
  stream << tabsNext << "Entries:\n";
  for (EntryIterator it = entryList.rbegin(), ie = entryList.rend(); it != ie;
       ++it) {
    (*it)->print(stream, tabsNext);
    stream << "\n";
  }
  for (std::map<llvm::Instruction *, Node *>::const_iterator it = next.begin(),
                                                             ie = next.end();
       it != ie; ++it) {
    stream << tabsNext << "Next call:\n";
    it->second->print(stream, appendTab(prefix));
    stream << "\n";
  }
}

/**/

void SubsumptionTable::CallHistoryIndexedTable::clearTree(Node *node) {
  for (std::map<llvm::Instruction *, Node *>::iterator it = node->next.begin(),
                                                       ie = node->next.end();
       it != ie; ++it) {
    clearTree(it->second);
    delete it->second;
  }

  for (std::deque<SubsumptionTableEntry *>::iterator
           it = node->entryList.begin(),
           ie = node->entryList.end();
       it != ie; ++it) {
    delete (*it);
  }
}

void SubsumptionTable::CallHistoryIndexedTable::insert(
    const std::vector<llvm::Instruction *> &callHistory,
    SubsumptionTableEntry *entry) {
  Node *current = root;

  for (std::vector<llvm::Instruction *>::const_iterator
           it = callHistory.begin(),
           ie = callHistory.end();
       it != ie; ++it) {
    llvm::Instruction *call = *it;
    std::map<llvm::Instruction *, Node *>::const_iterator it1 =
        current->next.find(call);
    if (it1 == current->next.end()) {
      Node *newNode = new Node(call);
      current->next[*it] = newNode;
      current = newNode;
    } else {
      current = it1->second;
    }
  }
  current->entryList.push_back(entry);
}

std::pair<SubsumptionTable::EntryIterator, SubsumptionTable::EntryIterator>
SubsumptionTable::CallHistoryIndexedTable::find(
    const std::vector<llvm::Instruction *> &callHistory, bool &found) const {
  Node *current = root;
  std::pair<EntryIterator, EntryIterator> ret;

  for (std::vector<llvm::Instruction *>::const_iterator
           it = callHistory.begin(),
           ie = callHistory.end();
       it != ie; ++it) {
    llvm::Instruction *call = *it;
    std::map<llvm::Instruction *, Node *>::const_iterator it1 =
        current->next.find(call);
    if (it1 == current->next.end()) {
      found = false;
      return ret;
    }
    current = it1->second;
  }
  found = true;
  return std::pair<EntryIterator, EntryIterator>(current->entryList.rbegin(),
                                                 current->entryList.rend());
}

void SubsumptionTable::CallHistoryIndexedTable::printNode(
    llvm::raw_ostream &stream, Node *n, std::string edges) const {
  for (std::map<llvm::Instruction *, Node *>::const_iterator
           it = n->next.begin(),
           ie = n->next.end();
       it != ie; ++it) {
    stream << "\n";
    it->second->print(stream, edges + "    ");
    stream << "\n";
    printNode(stream, it->second, edges + "    ");
  }
}

void SubsumptionTable::CallHistoryIndexedTable::print(llvm::raw_ostream &stream)
    const {
  root->print(stream);
  printNode(stream, root, "");
}

/**/

std::map<uintptr_t, SubsumptionTable::CallHistoryIndexedTable *>
SubsumptionTable::instance;

void
SubsumptionTable::insert(uintptr_t id,
                         const std::vector<llvm::Instruction *> &callHistory,
                         SubsumptionTableEntry *entry) {
  CallHistoryIndexedTable *subTable = 0;

  TxTree::entryNumber++; // Count of entries in the table

  std::map<uintptr_t, CallHistoryIndexedTable *>::iterator it =
      instance.find(id);

  if (it == instance.end()) {
    subTable = new CallHistoryIndexedTable();
    subTable->insert(callHistory, entry);
    instance[id] = subTable;
    return;
  }
  subTable = it->second;
  subTable->insert(callHistory, entry);
}

bool SubsumptionTable::check(TimingSolver *solver, ExecutionState &state,
                             double timeout, int debugSubsumptionLevel) {
  CallHistoryIndexedTable *subTable = 0;
  TxTreeNode *txTreeNode = state.txTreeNode;

  std::map<uintptr_t, CallHistoryIndexedTable *>::iterator it =
      instance.find(state.txTreeNode->getProgramPoint());
  if (it == instance.end()) {
    if (debugSubsumptionLevel >= 1) {
      klee_message(
          "#%lu: Check failure due to control point not found in table",
          state.txTreeNode->getNodeSequenceNumber());
    }
    return false;
  }
  subTable = it->second;

  bool found;
  std::pair<EntryIterator, EntryIterator> iterPair =
      subTable->find(txTreeNode->entryCallHistory, found);
  if (!found) {
    if (debugSubsumptionLevel >= 1) {
      klee_message("#%lu: Check failure due to entry not found",
                   state.txTreeNode->getNodeSequenceNumber());
    }
    return false;
  }

  if (iterPair.first != iterPair.second) {

    TxStore::TopInterpolantStore concretelyAddressedStore;
    TxStore::TopInterpolantStore symbolicallyAddressedStore;
    TxStore::LowerInterpolantStore concretelyAddressedHistoricalStore;
    TxStore::LowerInterpolantStore symbolicallyAddressedHistoricalStore;

    txTreeNode->getStoredExpressions(
        txTreeNode->entryCallHistory, concretelyAddressedStore,
        symbolicallyAddressedStore, concretelyAddressedHistoricalStore,
        symbolicallyAddressedHistoricalStore);

    // Iterate the subsumption table entry with reverse iterator because
    // the successful subsumption mostly happen in the newest entry.
    for (EntryIterator it = iterPair.first, ie = iterPair.second; it != ie;
         ++it) {
      if ((*it)->subsumed(
              solver, state, timeout, concretelyAddressedStore,
              symbolicallyAddressedStore, concretelyAddressedHistoricalStore,
              symbolicallyAddressedHistoricalStore, debugSubsumptionLevel)) {
        // We mark as subsumed such that the node will not be
        // stored into table (the table already contains a more
        // general entry).
        txTreeNode->isSubsumed = true;

        // Mark the node as subsumed, and create a subsumption edge
        TxTreeGraph::markAsSubsumed(txTreeNode, (*it));
        return true;
      }
    }
  }
  return false;
}

void SubsumptionTable::clear() {
  for (std::map<uintptr_t, CallHistoryIndexedTable *>::iterator
           it = instance.begin(),
           ie = instance.end();
       it != ie; ++it) {
    if (it->second) {
      ++TxTree::programPointNumber;
      delete it->second;
    }
  }
}

/**/

Statistic TxTree::setCurrentINodeTime("SetCurrentINodeTime",
                                      "SetCurrentINodeTime");
Statistic TxTree::removeTime("RemoveTime", "RemoveTime");
Statistic TxTree::subsumptionCheckTime("SubsumptionCheckTime",
                                       "SubsumptionCheckTime");
Statistic TxTree::markPathConditionTime("MarkPathConditionTime", "MarkPCTime");
Statistic TxTree::splitTime("SplitTime", "SplitTime");
Statistic TxTree::executeOnNodeTime("ExecuteOnNodeTime", "ExecuteOnNodeTime");
Statistic TxTree::executeMemoryOperationTime("ExecuteMemoryOperationTime",
                                             "ExecuteMemoryOperationTime");

double TxTree::entryNumber;

double TxTree::programPointNumber;

bool TxTree::symbolicExecutionError = false;

uint64_t TxTree::subsumptionCheckCount = 0;

uint64_t TxTree::blockCount = 1;

void TxTree::printTimeStat(std::stringstream &stream) {
  stream << "KLEE: done:     setCurrentINode = "
         << ((double)setCurrentINodeTime.getValue()) / 1000 << "\n";
  stream << "KLEE: done:     remove = " << ((double)removeTime.getValue()) /
                                               1000 << "\n";
  stream << "KLEE: done:     subsumptionCheck = "
         << ((double)subsumptionCheckTime.getValue()) / 1000 << "\n";
  stream << "KLEE: done:     markPathCondition = "
         << ((double)markPathConditionTime.getValue()) / 1000 << "\n";
  stream << "KLEE: done:     split = " << ((double)splitTime.getValue()) / 1000
         << "\n";
  stream << "KLEE: done:     executeOnNode = "
         << ((double)executeOnNodeTime.getValue()) / 1000 << "\n";
  stream << "KLEE: done:     executeMemoryOperation = "
         << ((double)executeMemoryOperationTime.getValue()) / 1000 << "\n";
}

void TxTree::printTableStat(std::stringstream &stream) {
  SubsumptionTableEntry::printStat(stream);

  stream
      << "KLEE: done:     Average table entries per subsumption checkpoint = "
      << inTwoDecimalPoints(entryNumber / programPointNumber) << "\n";

  stream << "KLEE: done:     Number of subsumption checks = "
         << subsumptionCheckCount << "\n";

  stream << "KLEE: done:     Average solver calls per subsumption check = "
         << inTwoDecimalPoints((double)stats::subsumptionQueryCount /
                               (double)subsumptionCheckCount) << "\n";
}

std::string TxTree::inTwoDecimalPoints(const double n) {
  std::ostringstream stream;
  unsigned long x = (unsigned)((n - ((unsigned)n)) * 100);
  unsigned y = (unsigned)n;
  stream << y << ".";
  if (x > 9)
    stream << x;
  else if (x > 0)
    stream << "0" << x;
  else
    stream << "00";
  return stream.str();
}

std::string TxTree::getInterpolationStat() {
  std::stringstream stream;
  stream << "KLEE: done: Total reduced symbolic execution tree nodes = "
		 << TxTreeGraph::nodeCount  << "\n";
  stream << "KLEE: done: Total number of visited basic blocks = "
		 << blockCount  << "\n";
  stream << "\nKLEE: done: Subsumption statistics\n";
  printTableStat(stream);
  stream << "\nKLEE: done: TxTree method execution times (ms):\n";
  printTimeStat(stream);
  stream << "\nKLEE: done: TxTreeNode method execution times (ms):\n";
  TxTreeNode::printTimeStat(stream);
  // printing node count
  return stream.str();
}

TxTree::TxTree(
    ExecutionState *_root, llvm::DataLayout *_targetData,
    std::map<const llvm::GlobalValue *, ref<ConstantExpr> > *_globalAddresses)
    : targetData(_targetData), globalAddresses(_globalAddresses) {
  currentTxTreeNode = 0;
  assert(_targetData && "target data layout not provided");
  if (!_root->txTreeNode) {
    currentTxTreeNode = new TxTreeNode(0, _targetData, _globalAddresses);
  }
  root = currentTxTreeNode;
}

bool TxTree::subsumptionCheck(TimingSolver *solver, ExecutionState &state,
                              double timeout) {
#ifdef ENABLE_Z3
  assert(state.txTreeNode == currentTxTreeNode);

  // Immediately return if the state's instruction is not the
  // the interpolation node id. The interpolation node id is the
  // first instruction executed of the sequence executed for a state
  // node, typically this the first instruction of a basic block.
  // Subsumption check only matches against this first instruction.
  if (!state.txTreeNode || reinterpret_cast<uintptr_t>(state.pc->inst) !=
                               state.txTreeNode->getProgramPoint())
    return false;

  int debugSubsumptionLevel =
      currentTxTreeNode->dependency->debugSubsumptionLevel;

  if (debugSubsumptionLevel >= 2) {
    klee_message("Subsumption check for Node #%lu, Program Point %lu",
                 state.txTreeNode->getNodeSequenceNumber(),
                 state.txTreeNode->getProgramPoint());
  } else if (debugSubsumptionLevel >= 1) {
    klee_message("Subsumption check for Node #%lu",
                 state.txTreeNode->getNodeSequenceNumber());
  }

  ++subsumptionCheckCount; // For profiling

  TimerStatIncrementer t(subsumptionCheckTime);

  return SubsumptionTable::check(solver, state, timeout, debugSubsumptionLevel);
#endif
  return false;
}

void TxTree::setCurrentINode(ExecutionState &state) {
  TimerStatIncrementer t(setCurrentINodeTime);
  currentTxTreeNode = state.txTreeNode;
  currentTxTreeNode->setProgramPoint(state.pc->inst);
  if (!currentTxTreeNode->nodeSequenceNumber)
    currentTxTreeNode->nodeSequenceNumber =
        TxTreeNode::nextNodeSequenceNumber++;
  TxTreeGraph::setCurrentNode(state, currentTxTreeNode->nodeSequenceNumber);
}

void TxTree::remove(TxTreeNode *node, bool dumping) {
#ifdef ENABLE_Z3
  TimerStatIncrementer t(removeTime);
  assert(!node->left && !node->right);
  do {
    TxTreeNode *p = node->parent;

    // As the node is about to be deleted, it must have been completely
    // traversed, hence the correct time to table the interpolant.
    if (!dumping && !node->isSubsumed && node->storable) {
      int debugSubsumptionLevel = node->dependency->debugSubsumptionLevel;

      if (debugSubsumptionLevel >= 2) {
        klee_message("Storing entry for Node #%lu, Program Point %lu",
                     node->getNodeSequenceNumber(), node->getProgramPoint());
      } else if (debugSubsumptionLevel >= 1) {
        klee_message("Storing entry for Node #%lu",
                     node->getNodeSequenceNumber());
      }

      SubsumptionTableEntry *entry =
          new SubsumptionTableEntry(node, node->entryCallHistory);
      SubsumptionTable::insert(node->getProgramPoint(), node->entryCallHistory,
                               entry);

      TxTreeGraph::addTableEntryMapping(node, entry);

      if (debugSubsumptionLevel >= 2) {
        std::string msg;
        llvm::raw_string_ostream out(msg);
        entry->print(out);
        out.flush();
        klee_message("%s", msg.c_str());
      }
    }

    delete node;
    if (p) {
      if (node == p->left) {
        p->left = 0;
      } else {
        assert(node == p->right);
        p->right = 0;
      }
    }
    node = p;
  } while (node && !node->left && !node->right);
#endif
}

std::pair<TxTreeNode *, TxTreeNode *>
TxTree::split(TxTreeNode *parent, ExecutionState *left, ExecutionState *right) {
  TimerStatIncrementer t(splitTime);
  parent->split(left, right);
  TxTreeGraph::addChildren(parent, parent->left, parent->right);
  std::pair<TxTreeNode *, TxTreeNode *> ret(parent->left, parent->right);
  return ret;
}

void TxTree::markPathCondition(ExecutionState &state, TimingSolver *solver,
                               std::vector<ref<Expr> > &unsatCore) {
  TimerStatIncrementer t(markPathConditionTime);
  int debugSubsumptionLevel =
      currentTxTreeNode->dependency->debugSubsumptionLevel;

  llvm::BranchInst *binst =
      llvm::dyn_cast<llvm::BranchInst>(state.prevPC->inst);
  if (binst) {
    ref<Expr> unknownExpression;
    std::string reason = "";
    if (debugSubsumptionLevel >= 1) {
      llvm::raw_string_ostream stream(reason);
      stream << "branch infeasibility [";
      if (binst->getParent()->getParent()) {
        stream << binst->getParent()->getParent()->getName().str() << ": ";
      }
      if (llvm::MDNode *n = binst->getMetadata("dbg")) {
        llvm::DILocation loc(n);
        stream << "Line " << loc.getLineNumber();
      } else {
        binst->print(stream);
      }
      stream << "]";
      stream.flush();
    }
    currentTxTreeNode->dependency->markAllValues(binst->getCondition(),
                                                 unknownExpression, reason);
  }

  // We create path condition marking structure and mark core constraints
  currentTxTreeNode->unsatCoreInterpolation(unsatCore);
}

void TxTree::execute(llvm::Instruction *instr) {
  std::vector<ref<Expr> > dummyArgs;
  executeOnNode(currentTxTreeNode, instr, dummyArgs);
}

void TxTree::execute(llvm::Instruction *instr, ref<Expr> arg1) {
  std::vector<ref<Expr> > args;
  args.push_back(arg1);
  executeOnNode(currentTxTreeNode, instr, args);
}

void TxTree::execute(llvm::Instruction *instr, ref<Expr> arg1, ref<Expr> arg2) {
  std::vector<ref<Expr> > args;
  args.push_back(arg1);
  args.push_back(arg2);
  executeOnNode(currentTxTreeNode, instr, args);
}

void TxTree::execute(llvm::Instruction *instr, ref<Expr> arg1, ref<Expr> arg2,
                     ref<Expr> arg3) {
  std::vector<ref<Expr> > args;
  args.push_back(arg1);
  args.push_back(arg2);
  args.push_back(arg3);
  executeOnNode(currentTxTreeNode, instr, args);
}

void TxTree::execute(llvm::Instruction *instr, std::vector<ref<Expr> > &args) {
  executeOnNode(currentTxTreeNode, instr, args);
}

void TxTree::executePHI(llvm::Instruction *instr, unsigned incomingBlock,
                        ref<Expr> valueExpr) {
  currentTxTreeNode->dependency->executePHI(instr, incomingBlock,
                                            currentTxTreeNode->callHistory,
                                            valueExpr, symbolicExecutionError);
  symbolicExecutionError = false;
}

void TxTree::executeOnNode(TxTreeNode *node, llvm::Instruction *instr,
                           std::vector<ref<Expr> > &args) {
  TimerStatIncrementer t(executeOnNodeTime);
  node->execute(instr, args, symbolicExecutionError);
  symbolicExecutionError = false;
}

void TxTree::printNode(llvm::raw_ostream &stream, TxTreeNode *n,
                       std::string edges) const {
  if (n->left != 0) {
    stream << "\n";
    stream << edges << "+-- L:" << n->left->programPoint;
    if (this->currentTxTreeNode == n->left) {
      stream << " (active)";
    }
    if (n->right != 0) {
      printNode(stream, n->left, edges + "|   ");
    } else {
      printNode(stream, n->left, edges + "    ");
    }
  }
  if (n->right != 0) {
    stream << "\n";
    stream << edges << "+-- R:" << n->right->programPoint;
    if (this->currentTxTreeNode == n->right) {
      stream << " (active)";
    }
    printNode(stream, n->right, edges + "    ");
  }
}

void TxTree::print(llvm::raw_ostream &stream) const {
  stream << "------------------------- TxTree Structure "
            "--------------------------\n";
  stream << this->root->programPoint;
  if (this->root == this->currentTxTreeNode) {
    stream << " (active)";
  }
  this->printNode(stream, this->root, "");
  stream << "\n------------------------- Subsumption Table "
            "-------------------------\n";
  SubsumptionTable::print(stream);
}

void TxTree::dump() const { this->print(llvm::errs()); }

/**/

// Statistics
Statistic TxTreeNode::getInterpolantTime("GetInterpolantTime",
                                         "GetInterpolantTime");
Statistic TxTreeNode::addConstraintTime("AddConstraintTime",
                                        "AddConstraintTime");
Statistic TxTreeNode::splitTime("SplitTime", "SplitTime");
Statistic TxTreeNode::executeTime("ExecuteTime", "ExecuteTime");
Statistic TxTreeNode::bindCallArgumentsTime("BindCallArgumentsTime",
                                            "BindCallArgumentsTime");
Statistic TxTreeNode::bindReturnValueTime("BindReturnValueTime",
                                          "BindReturnValueTime");
Statistic TxTreeNode::getStoredExpressionsTime("GetStoredExpressionsTime",
                                               "GetStoredExpressionsTime");
Statistic
TxTreeNode::getStoredCoreExpressionsTime("GetStoredCoreExpressionsTime",
                                         "GetStoredCoreExpressionsTime");

// The interpolation tree node sequence number
uint64_t TxTreeNode::nextNodeSequenceNumber = 1;

void TxTreeNode::printTimeStat(std::stringstream &stream) {
  stream << "KLEE: done:     getInterpolant = "
         << ((double)getInterpolantTime.getValue()) / 1000 << "\n";
  stream << "KLEE: done:     addConstraintTime = "
         << ((double)addConstraintTime.getValue()) / 1000 << "\n";
  stream << "KLEE: done:     splitTime = " << ((double)splitTime.getValue()) /
                                                  1000 << "\n";
  stream << "KLEE: done:     execute = " << ((double)executeTime.getValue()) /
                                                1000 << "\n";
  stream << "KLEE: done:     bindCallArguments = "
         << ((double)bindCallArgumentsTime.getValue()) / 1000 << "\n";
  stream << "KLEE: done:     bindReturnValue = "
         << ((double)bindReturnValueTime.getValue()) / 1000 << "\n";
  stream << "KLEE: done:     getStoredExpressions = "
         << ((double)getStoredExpressionsTime.getValue()) / 1000 << "\n";
  stream << "KLEE: done:     getStoredCoreExpressions = "
         << ((double)getStoredCoreExpressionsTime.getValue()) / 1000 << "\n";
}

TxTreeNode::TxTreeNode(
    TxTreeNode *_parent, llvm::DataLayout *_targetData,
    std::map<const llvm::GlobalValue *, ref<ConstantExpr> > *_globalAddresses)
    : parent(_parent), left(0), right(0), programPoint(0),
      nodeSequenceNumber(0), storable(true),
      graph(_parent ? _parent->graph : 0),
      instructionsDepth(_parent ? _parent->instructionsDepth : 0),
      targetData(_targetData), globalAddresses(_globalAddresses),
      isSubsumed(false) {

  pathCondition = 0;
  if (_parent) {
    pathCondition = _parent->pathCondition;
    entryCallHistory = _parent->callHistory;
    callHistory = _parent->callHistory;
  }

  // Inherit the abstract dependency or NULL
  dependency = new Dependency(_parent ? _parent->dependency : 0, _targetData,
                              _globalAddresses);
}

TxTreeNode::~TxTreeNode() {
  // Only delete the path condition if it's not
  // also the parent's path condition
  PathCondition *ie = parent ? parent->pathCondition : 0;

  PathCondition *it = pathCondition;
  while (it != ie) {
    PathCondition *tmp = it;
    it = it->cdr();
    delete tmp;
  }

  if (dependency)
    delete dependency;
}

ref<Expr>
TxTreeNode::getInterpolant(std::set<const Array *> &replacements) const {
  TimerStatIncrementer t(getInterpolantTime);
  ref<Expr> expr = this->pathCondition->packInterpolant(replacements);
  return expr;
}

void TxTreeNode::addConstraint(ref<Expr> &constraint, llvm::Value *condition) {
  TimerStatIncrementer t(addConstraintTime);
  pathCondition = new PathCondition(constraint, dependency, condition,
                                    callHistory, pathCondition);
  graph->addPathCondition(this, pathCondition, constraint);
}

void TxTreeNode::split(ExecutionState *leftData, ExecutionState *rightData) {
  TimerStatIncrementer t(splitTime);
  assert(left == 0 && right == 0);
  leftData->txTreeNode = left =
      new TxTreeNode(this, targetData, globalAddresses);
  rightData->txTreeNode = right =
      new TxTreeNode(this, targetData, globalAddresses);
}

void TxTreeNode::execute(llvm::Instruction *instr,
                         std::vector<ref<Expr> > &args,
                         bool symbolicExecutionError) {
  TimerStatIncrementer t(executeTime);
  dependency->execute(instr, callHistory, args, symbolicExecutionError);
}

void TxTreeNode::bindCallArguments(llvm::Instruction *site,
                                   std::vector<ref<Expr> > &arguments) {
  TimerStatIncrementer t(bindCallArgumentsTime);
  dependency->bindCallArguments(site, callHistory, arguments);
}

void TxTreeNode::bindReturnValue(llvm::CallInst *site, llvm::Instruction *inst,
                                 ref<Expr> returnValue) {
  // TODO: This is probably where we should simplify
  // the dependency graph by removing callee values.
  TimerStatIncrementer t(bindReturnValueTime);
  dependency->bindReturnValue(site, callHistory, inst, returnValue);
}

void TxTreeNode::getStoredExpressions(
    const std::vector<llvm::Instruction *> &_callHistory,
    TxStore::TopInterpolantStore &concretelyAddressedStore,
    TxStore::TopInterpolantStore &symbolicallyAddressedStore,
    TxStore::LowerInterpolantStore &concretelyAddressedHistoricalStore,
    TxStore::LowerInterpolantStore &symbolicallyAddressedHistoricalStore)
    const {
  TimerStatIncrementer t(getStoredExpressionsTime);
  std::set<const Array *> dummyReplacements;

  // Since a program point index is a first statement in a basic block,
  // the allocations to be stored in subsumption table should be obtained
  // from the parent node.
  if (parent)
    parent->dependency->getStoredExpressions(
        _callHistory, dummyReplacements, false, concretelyAddressedStore,
        symbolicallyAddressedStore, concretelyAddressedHistoricalStore,
        symbolicallyAddressedHistoricalStore);
}

void TxTreeNode::getStoredCoreExpressions(
    const std::vector<llvm::Instruction *> &_callHistory,
    std::set<const Array *> &replacements,
    TxStore::TopInterpolantStore &concretelyAddressedStore,
    TxStore::TopInterpolantStore &symbolicallyAddressedStore,
    TxStore::LowerInterpolantStore &concretelyAddressedHistoricalStore,
    TxStore::LowerInterpolantStore &symbolicallyAddressedHistoricalStore)
    const {
  TimerStatIncrementer t(getStoredCoreExpressionsTime);

  // Since a program point index is a first statement in a basic block,
  // the allocations to be stored in subsumption table should be obtained
  // from the parent node.
  if (parent)
    parent->dependency->getStoredExpressions(
        _callHistory, replacements, true, concretelyAddressedStore,
        symbolicallyAddressedStore, concretelyAddressedHistoricalStore,
        symbolicallyAddressedHistoricalStore);
}

uint64_t TxTreeNode::getInstructionsDepth() { return instructionsDepth; }

void TxTreeNode::incInstructionsDepth() { ++instructionsDepth; }

void
TxTreeNode::unsatCoreInterpolation(const std::vector<ref<Expr> > &unsatCore) {
  // State subsumed, we mark needed constraints on the path condition. We create
  // path condition marking structure to mark core constraints
  std::map<Expr *, PathCondition *> markerMap;
  for (PathCondition *it = pathCondition; it != 0; it = it->cdr()) {
    if (llvm::isa<OrExpr>(it->car())) {
      // FIXME: Break up disjunction into its components, because each disjunct
      // is solved separately. The or constraint was due to state merge.
      // Hence, the following is just a makeshift for when state merge is
      // properly implemented.
      markerMap[it->car()->getKid(0).get()] = it;
      markerMap[it->car()->getKid(1).get()] = it;
    }
    markerMap[it->car().get()] = it;
  }

  for (std::vector<ref<Expr> >::const_iterator it1 = unsatCore.begin(),
                                               ie1 = unsatCore.end();
       it1 != ie1; ++it1) {
    // FIXME: Sometimes some constraints are not in the PC. This is
    // because constraints are not properly added at state merge.
    PathCondition *cond = markerMap[it1->get()];
    if (cond)
      cond->setAsCore(dependency->debugSubsumptionLevel);
  }
}

void TxTreeNode::dump() const {
  llvm::errs() << "------------------------- TxTree Node "
                  "-------------------------------\n";
  this->print(llvm::errs());
  llvm::errs() << "\n";
}

void TxTreeNode::print(llvm::raw_ostream &stream) const {
  this->print(stream, 0);
}

void TxTreeNode::print(llvm::raw_ostream &stream,
                       const unsigned paddingAmount) const {
  std::string tabs = makeTabs(paddingAmount);
  std::string tabsNext = appendTab(tabs);

  stream << tabs << "TxTreeNode\n";
  stream << tabsNext << "node Id = " << programPoint << "\n";
  stream << tabsNext << "pathCondition = ";
  if (pathCondition == 0) {
    stream << "NULL";
  } else {
    pathCondition->print(stream);
  }
  stream << "\n";
  stream << tabsNext << "Left:\n";
  if (!left) {
    stream << tabsNext << "NULL\n";
  } else {
    left->print(stream, paddingAmount + 1);
    stream << "\n";
  }
  stream << tabsNext << "Right:\n";
  if (!right) {
    stream << tabsNext << "NULL\n";
  } else {
    right->print(stream, paddingAmount + 1);
    stream << "\n";
  }
  stream << tabsNext << "Call history:\n";
  for (std::vector<llvm::Instruction *>::const_reverse_iterator
           it = callHistory.rbegin(),
           ie = callHistory.rend();
       it != ie; ++it) {
    stream << tabsNext;
    (*it)->print(stream);
    stream << "\n";
  }
  if (dependency) {
    stream << tabsNext << "------- Abstract Dependencies ----------\n";
    dependency->print(stream, paddingAmount + 1);
  }
}
