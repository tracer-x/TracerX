//===-- TxPartitionHelper.cpp - Interpolation tree -------------------------*-
// C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementations Partition class
///
//===----------------------------------------------------------------------===//

#include "TxPartitionHelper.h"

using namespace klee;

void TxPartitionHelper::getExprVars(ref<Expr> e, std::set<std::string> &vars) {
  switch (e->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    break;
  }

  case Expr::Read: {
    ReadExpr *re = dyn_cast<ReadExpr>(e);
    vars.insert(re->updates.root->name);
    break;
  }
  case Expr::Concat: {
    ConcatExpr *ce = dyn_cast<ConcatExpr>(e);
    if (ce->getLeft()->getKind() == Expr::Read) {
      ReadExpr *re = dyn_cast<ReadExpr>(ce->getLeft());
      vars.insert(re->updates.root->name);
      break;
    } else {
      klee_error("Partition::generateExprPartition shouldn't reach here1");
    }

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

ref<Expr> TxPartitionHelper::createAnd(std::vector<ref<Expr> > exprs) {
  std::vector<ref<Expr> >::const_iterator it = exprs.begin();
  ref<Expr> result = *(it);
  std::advance(it, 1);
  if (exprs.size() >= 1) {
    for (; it != exprs.end(); ++it) {
      ref<Expr> currentExpr = (*it);
      result = AndExpr::create(result, currentExpr);
    }
  }
  return result;
}

void TxPartitionHelper::getExprsFromAndExpr(ref<Expr> e,
                                            std::vector<ref<Expr> > &exprs) {
  if (!e.isNull()) {
    if (e->getKind() == Expr::And) {
      getExprsFromAndExpr(e->getKid(0), exprs);
      getExprsFromAndExpr(e->getKid(1), exprs);
    } else {
      exprs.push_back(e);
    }
  }
}

bool TxPartitionHelper::isShared(std::set<std::string> ss1,
                                 std::set<std::string> ss2) {
  for (std::set<std::string>::const_iterator it1 = ss1.begin(), ie1 = ss1.end();
       it1 != ie1; ++it1) {
    for (std::set<std::string>::const_iterator it2 = ss2.begin(),
                                               ie2 = ss2.end();
         it2 != ie2; ++it2) {
      if ((*it2).compare(*it1) == 0) {
        return true;
      }
    }
  }
  return false;
}

std::vector<Partition>
TxPartitionHelper::partition(std::vector<ref<Expr> > exprs) {

  // build relation map [var -> set<ref<Expr>>]
  std::map<ref<Expr>, std::set<std::string> > ref2var;
  std::map<std::string, std::set<ref<Expr> > > var2ref;
  for (std::vector<ref<Expr> >::const_iterator exprIt = exprs.begin(),
                                               exprIe = exprs.end();
       exprIt != exprIe; ++exprIt) {
    std::set<std::string> vars;
    getExprVars(*exprIt, vars);
    ref2var[*exprIt] = vars;
    for (std::set<std::string>::const_iterator strIt = vars.begin(),
                                               strIe = vars.end();
         strIt != strIe; ++strIt) {
      var2ref[*strIt].insert(*exprIt);
    }
  }

  // build map [ref<Expr> -> vector<ref<Expr>>]
  std::map<ref<Expr>, std::set<ref<Expr> > > ref2ref;
  for (std::vector<ref<Expr> >::const_iterator exprIt = exprs.begin(),
                                               exprIe = exprs.end();
       exprIt != exprIe; ++exprIt) {
    // get set of vars
    std::set<std::string> vars = ref2var[*exprIt];
    // collect related refs
    for (std::set<std::string>::const_iterator strIt = vars.begin(),
                                               strIe = vars.end();
         strIt != strIe; ++strIt) {
      ref2ref[*exprIt].insert(var2ref[*strIt].begin(), var2ref[*strIt].end());
    }
  }

  // build connected components as partitions
  std::set<ref<Expr> > marked;
  std::vector<Partition> partitions;
  for (std::map<ref<Expr>, std::set<ref<Expr> > >::const_iterator
           mapIt = ref2ref.begin(),
           mapIe = ref2ref.end();
       mapIt != mapIe; ++mapIt) {
    // visit un-marked nodes
    if (marked.find(mapIt->first) == marked.end()) {
      std::set<ref<Expr> > currentComp;
      visit(mapIt->first, currentComp, ref2ref, marked);

      Partition p;
      p.exprs = currentComp;
      for (std::set<ref<Expr> >::const_iterator exprIt = currentComp.begin(),
                                                exprIe = currentComp.end();
           exprIt != exprIe; ++exprIt) {
        p.vars.insert(ref2var[*exprIt].begin(), ref2var[*exprIt].end());
      }
      partitions.push_back(p);
    }
  }
  return partitions;
}

void TxPartitionHelper::visit(
    ref<Expr> node, std::set<ref<Expr> > &currentComp,
    std::map<ref<Expr>, std::set<ref<Expr> > > &ref2ref,
    std::set<ref<Expr> > &marked) {
  marked.insert(node);
  currentComp.insert(node);
  // recursively call on adjacent nodes
  for (std::set<ref<Expr> >::const_iterator it = ref2ref[node].begin(),
                                            ie = ref2ref[node].end();
       it != ie; ++it) {
    if (marked.find(*it) == marked.end()) {
      visit(*it, currentComp, ref2ref, marked);
    }
  }
}

std::vector<Partition>
TxPartitionHelper::partitionOnCond(ref<Expr> cond,
                                   std::vector<ref<Expr> > exprs) {
  std::vector<Partition> partitions = partition(exprs);

  Partition nonRelated;
  Partition related;
  std::set<std::string> condVars;
  getExprVars(cond, condVars);
  for (std::vector<Partition>::const_iterator partIt = partitions.begin(),
                                              partIe = partitions.end();
       partIt != partIe; ++partIt) {
    if (!isShared(condVars, partIt->vars)) {
      nonRelated.exprs.insert(partIt->exprs.begin(), partIt->exprs.end());
      nonRelated.vars.insert(partIt->vars.begin(), partIt->vars.end());
    } else {
      related.exprs.insert(partIt->exprs.begin(), partIt->exprs.end());
      related.vars.insert(partIt->vars.begin(), partIt->vars.end());
    }
  }
  std::vector<Partition> ret;
  ret.push_back(nonRelated);
  ret.push_back(related);
  return ret;
}
