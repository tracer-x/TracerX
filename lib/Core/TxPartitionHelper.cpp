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

ref<Expr> TxPartitionHelper::createAnd(std::set<ref<Expr> > exprs) {
  std::set<ref<Expr> >::const_iterator it = exprs.begin();
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

std::vector<Partition<ref<Expr> > >
TxPartitionHelper::partitionExprs(std::vector<ref<Expr> > exprs) {
  // build relation map [var -> set<ref<Expr>>]
  std::map<ref<Expr>, std::set<std::string> > ref2vars;
  std::map<std::string, std::set<ref<Expr> > > var2refs;
  for (std::vector<ref<Expr> >::const_iterator exprIt = exprs.begin(),
                                               exprIe = exprs.end();
       exprIt != exprIe; ++exprIt) {
    std::set<std::string> vars;
    getExprVars(*exprIt, vars);
    ref2vars[*exprIt] = vars;
    for (std::set<std::string>::const_iterator strIt = vars.begin(),
                                               strIe = vars.end();
         strIt != strIe; ++strIt) {
      var2refs[*strIt].insert(*exprIt);
    }
  }

  // build map [ref<Expr> -> vector<ref<Expr>>]
  std::map<ref<Expr>, std::set<ref<Expr> > > ref2refs;
  for (std::vector<ref<Expr> >::const_iterator exprIt = exprs.begin(),
                                               exprIe = exprs.end();
       exprIt != exprIe; ++exprIt) {
    // get set of vars
    std::set<std::string> vars = ref2vars[*exprIt];
    // collect related refs
    for (std::set<std::string>::const_iterator strIt = vars.begin(),
                                               strIe = vars.end();
         strIt != strIe; ++strIt) {
      ref2refs[*exprIt].insert(var2refs[*strIt].begin(),
                               var2refs[*strIt].end());
    }
  }

  // build connected components as partitions
  std::vector<std::set<ref<Expr> > > ccs =
      findConnectedComps<ref<Expr> >(ref2refs);
  std::vector<Partition<ref<Expr> > > partitions;
  for (std::vector<std::set<ref<Expr> > >::const_iterator it = ccs.begin(),
                                                          ie = ccs.end();
       it != ie; ++it) {
    Partition<ref<Expr> > p;
    p.exprs = *it;
    for (std::set<ref<Expr> >::const_iterator exprIt = it->begin(),
                                              exprIe = it->end();
         exprIt != exprIe; ++exprIt) {
      p.vars.insert(ref2vars[*exprIt].begin(), ref2vars[*exprIt].end());
    }
    partitions.push_back(p);
  }
  return partitions;
}

std::vector<Partition<ref<Expr> > >
TxPartitionHelper::partitionExprsOnCond(ref<Expr> cond,
                                        std::vector<ref<Expr> > exprs) {
  std::vector<Partition<ref<Expr> > > partitions = partitionExprs(exprs);

  Partition<ref<Expr> > nonRelated;
  Partition<ref<Expr> > related;
  std::set<std::string> condVars;
  getExprVars(cond, condVars);
  for (std::vector<Partition<ref<Expr> > >::const_iterator
           partIt = partitions.begin(),
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
  std::vector<Partition<ref<Expr> > > ret;
  ret.push_back(nonRelated);
  ret.push_back(related);
  return ret;
}

std::vector<Partition<ref<TxAllocationContext> > >
TxPartitionHelper::partitionConAddStore(
    TxStore::TopInterpolantStore conAddStore) {
  // build relation map [var -> set<entry>]
  std::map<ref<TxAllocationContext>, std::set<std::string> > entry2vars;
  std::map<std::string, std::set<ref<TxAllocationContext> > > var2entries;
  for (TxStore::TopInterpolantStore::const_iterator mapIt = conAddStore.begin(),
                                                    mapIe = conAddStore.end();
       mapIt != mapIe; ++mapIt) {
    std::set<std::string> vars;
    std::string var(mapIt->first->getValue()->getName().data());
    vars.insert(var);
    getExprVars(mapIt->second.begin()->second->getExpression(), vars);
    entry2vars[mapIt->first] = vars;
    for (std::set<std::string>::const_iterator strIt = vars.begin(),
                                               strIe = vars.end();
         strIt != strIe; ++strIt) {
      var2entries[*strIt].insert(mapIt->first);
    }
  }

  // build map [ref<TxAllocationContext> -> vector<ref<TxAllocationContext>>]
  std::map<ref<TxAllocationContext>, std::set<ref<TxAllocationContext> > > entry2entries;
  for (std::map<ref<TxAllocationContext>, std::set<std::string> >::const_iterator
           entryIt = entry2vars.begin(),
           entryIe = entry2vars.end();
       entryIt != entryIe; ++entryIt) {
    // collect related entries
    for (std::set<std::string>::const_iterator strIt = entryIt->second.begin(),
                                               strIe = entryIt->second.end();
         strIt != strIe; ++strIt) {
      entry2entries[entryIt->first].insert(var2entries[*strIt].begin(),
                                           var2entries[*strIt].end());
    }
  }

  // build connected components as partitions
  std::vector<std::set<ref<TxAllocationContext> > > ccs =
      findConnectedComps<ref<TxAllocationContext> >(entry2entries);
  std::vector<Partition<ref<TxAllocationContext> > > partitions;
  for (std::vector<std::set<ref<TxAllocationContext> > >::const_iterator
           it = ccs.begin(),
           ie = ccs.end();
       it != ie; ++it) {
    Partition<ref<TxAllocationContext> > p;
    p.exprs = *it;
    for (std::set<ref<TxAllocationContext> >::const_iterator exprIt = it->begin(),
                                                    exprIe = it->end();
         exprIt != exprIe; ++exprIt) {
      p.vars.insert(entry2vars[*exprIt].begin(), entry2vars[*exprIt].end());
    }
    partitions.push_back(p);
  }
  return partitions;
}

std::vector<Partition<ref<TxAllocationContext> > >
TxPartitionHelper::partitionConAddStoreOnCond(
    ref<Expr> cond, TxStore::TopInterpolantStore conAddStore) {
  std::vector<Partition<ref<TxAllocationContext> > > partitions =
      partitionConAddStore(conAddStore);
  Partition<ref<TxAllocationContext> > nonRelated;
  Partition<ref<TxAllocationContext> > related;
  std::set<std::string> condVars;
  getExprVars(cond, condVars);

  for (std::vector<Partition<ref<TxAllocationContext> > >::const_iterator
           partIt = partitions.begin(),
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
  std::vector<Partition<ref<TxAllocationContext> > > ret;
  ret.push_back(nonRelated);
  ret.push_back(related);
  return ret;
  return partitions;
}

template <class T>
std::vector<std::set<T> >
TxPartitionHelper::findConnectedComps(std::map<T, std::set<T> > graph) {
  std::vector<std::set<T> > ret;
  std::set<T> marked;
  for (typename std::map<T, std::set<T> >::const_iterator mapIt = graph.begin(),
                                                          mapIe = graph.end();
       mapIt != mapIe; ++mapIt) {
    // visit un-marked nodes
    if (marked.find(mapIt->first) == marked.end()) {
      std::set<T> curComp;
      visit(mapIt->first, curComp, graph, marked);
      ret.push_back(curComp);
    }
  }
  return ret;
}

template <class T>
void TxPartitionHelper::visit(T node, std::set<T> &curComp,
                              std::map<T, std::set<T> > &graph,
                              std::set<T> &marked) {
  marked.insert(node);
  curComp.insert(node);
  // recursively call on adjacent nodes
  for (typename std::set<T>::const_iterator it = graph[node].begin(),
                                            ie = graph[node].end();
       it != ie; ++it) {
    if (marked.find(*it) == marked.end()) {
      visit(*it, curComp, graph, marked);
    }
  }
}
