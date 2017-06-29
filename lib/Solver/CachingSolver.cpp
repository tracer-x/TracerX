//===-- CachingSolver.cpp - Caching expression solver ---------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


#include "klee/Solver.h"

#include "klee/Constraints.h"
#include "klee/Expr.h"
#include "klee/IncompleteSolver.h"
#include "klee/SolverImpl.h"

#include "klee/SolverStats.h"

#include <ciso646>
#ifdef _LIBCPP_VERSION
#include <unordered_map>
#define unordered_map std::unordered_map
#else
#include <tr1/unordered_map>
#define unordered_map std::tr1::unordered_map
#endif

using namespace klee;

class CachingSolver : public SolverImpl {
private:
  ref<Expr> canonicalizeQuery(ref<Expr> originalQuery,
                              bool &negationUsed);

  void cacheInsert(const Query& query,
                   IncompleteSolver::PartialValidity result,
                   std::vector< ref<Expr> > core);

  bool cacheLookup(const Query &query,
                   IncompleteSolver::PartialValidity &result,
                   std::vector<ref<Expr> > &unsatCore);

  struct CacheEntry {
    CacheEntry(const ConstraintManager &c, ref<Expr> q)
      : constraints(c), query(q) {}

    CacheEntry(const CacheEntry &ce)
      : constraints(ce.constraints), query(ce.query) {}
    
    ConstraintManager constraints;
    ref<Expr> query;

    bool operator==(const CacheEntry &b) const {
      return constraints==b.constraints && *query.get()==*b.query.get();
    }
  };
  
  struct CacheEntryHash {
    unsigned operator()(const CacheEntry &ce) const {
      unsigned result = ce.query->hash();
      
      for (ConstraintManager::constraint_iterator it = ce.constraints.begin();
           it != ce.constraints.end(); ++it)
        result ^= (*it)->hash();
      
      return result;
    }
  };

  typedef unordered_map<CacheEntry, 
                        IncompleteSolver::PartialValidity, 
                        CacheEntryHash> cache_map;
  typedef unordered_map<CacheEntry, std::vector<ref<Expr> >, CacheEntryHash>
  UnsatCoreStoreMap;

  Solver *solver;
  cache_map cache;
  UnsatCoreStoreMap unsatCoreStore;

public:
  CachingSolver(Solver *s) : solver(s) {}
  ~CachingSolver() {
    cache.clear();
    unsatCoreStore.clear();
    delete solver;
  }

  bool computeValidity(const Query &, Solver::Validity &result,
                       std::vector<ref<Expr> > &unsatCore);
  bool computeTruth(const Query &, bool &isValid,
                    std::vector<ref<Expr> > &unsatCore);
  bool computeValue(const Query& query, ref<Expr> &result) {
    ++stats::queryCacheMisses;
    return solver->impl->computeValue(query, result);
  }
  bool computeInitialValues(const Query &query,
                            const std::vector<const Array *> &objects,
                            std::vector<std::vector<unsigned char> > &values,
                            bool &hasSolution,
                            std::vector<ref<Expr> > &unsatCore) {
    ++stats::queryCacheMisses;
    bool res = solver->impl->computeInitialValues(query, objects, values,
                                                  hasSolution, unsatCore);
    return res;
  }
  SolverRunStatus getOperationStatusCode();
  char *getConstraintLog(const Query&);
  void setCoreSolverTimeout(double timeout);
};

/** @returns the canonical version of the given query.  The reference
    negationUsed is set to true if the original query was negated in
    the canonicalization process. */
ref<Expr> CachingSolver::canonicalizeQuery(ref<Expr> originalQuery,
                                           bool &negationUsed) {
  ref<Expr> negatedQuery = Expr::createIsZero(originalQuery);

  // select the "smaller" query to the be canonical representation
  if (originalQuery.compare(negatedQuery) < 0) {
    negationUsed = false;
    return originalQuery;
  } else {
    negationUsed = true;
    return negatedQuery;
  }
}

/** @returns true on a cache hit, false of a cache miss.  Reference
    value result only valid on a cache hit. */
bool CachingSolver::cacheLookup(const Query &query,
                                IncompleteSolver::PartialValidity &result,
                                std::vector<ref<Expr> > &unsatCore) {
  bool negationUsed;
  ref<Expr> canonicalQuery = canonicalizeQuery(query.expr, negationUsed);

  CacheEntry ce(query.constraints, canonicalQuery);
  cache_map::iterator it = cache.find(ce);
  
  if (it != cache.end()) {
    result = (negationUsed ?
              IncompleteSolver::negatePartialValidity(it->second) :
              it->second);
    unsatCore.clear();
    UnsatCoreStoreMap::iterator it = unsatCoreStore.find(ce);
    if (it != unsatCoreStore.end()) {
      unsatCore.insert(unsatCore.begin(), it->second.begin(), it->second.end());
    }
    return true;
  }
  
  return false;
}

/// Inserts the given query, result pair into the cache.
void CachingSolver::cacheInsert(const Query& query,
                                IncompleteSolver::PartialValidity result,
                                std::vector< ref<Expr> > core) {
  bool negationUsed;
  ref<Expr> canonicalQuery = canonicalizeQuery(query.expr, negationUsed);

  CacheEntry ce(query.constraints, canonicalQuery);
  IncompleteSolver::PartialValidity cachedResult = 
    (negationUsed ? IncompleteSolver::negatePartialValidity(result) : result);
  
  cache.insert(std::make_pair(ce, cachedResult));
  unsatCoreStore.insert(std::make_pair(ce, core));
}

bool CachingSolver::computeValidity(const Query &query,
                                    Solver::Validity &result,
                                    std::vector<ref<Expr> > &unsatCore) {
  IncompleteSolver::PartialValidity cachedResult;
  bool tmp, cacheHit = cacheLookup(query, cachedResult, unsatCore);

  if (cacheHit) {
    switch(cachedResult) {
    case IncompleteSolver::MustBeTrue:   
      result = Solver::True;
      ++stats::queryCacheHits;
      return true;
    case IncompleteSolver::MustBeFalse:  
      result = Solver::False;
      ++stats::queryCacheHits;
      return true;
    case IncompleteSolver::TrueOrFalse:  
      result = Solver::Unknown;
      ++stats::queryCacheHits;
      return true;
    case IncompleteSolver::MayBeTrue: {
      ++stats::queryCacheMisses;
      if (!solver->impl->computeTruth(query, tmp, unsatCore))
        return false;
      if (tmp) {
        cacheInsert(query, IncompleteSolver::MustBeTrue, unsatCore);
        result = Solver::True;
        return true;
      } else {
        unsatCore.clear();
        cacheInsert(query, IncompleteSolver::TrueOrFalse, unsatCore);
        result = Solver::Unknown;
        return true;
      }
    }
    case IncompleteSolver::MayBeFalse: {
      ++stats::queryCacheMisses;
      if (!solver->impl->computeTruth(query.negateExpr(), tmp, unsatCore))
        return false;
      if (tmp) {
        cacheInsert(query, IncompleteSolver::MustBeFalse, unsatCore);
        result = Solver::False;
        return true;
      } else {
        unsatCore.clear();
        cacheInsert(query, IncompleteSolver::TrueOrFalse, unsatCore);
        result = Solver::Unknown;
        return true;
      }
    }
    default: assert(0 && "unreachable");
    }
  }

  ++stats::queryCacheMisses;

  if (!solver->impl->computeValidity(query, result, unsatCore))
    return false;

  switch (result) {
  case Solver::True: 
    cachedResult = IncompleteSolver::MustBeTrue;
    break;
  case Solver::False: 
    cachedResult = IncompleteSolver::MustBeFalse;
    break;
  default:
    unsatCore.clear();
    cachedResult = IncompleteSolver::TrueOrFalse; break;
  }

  cacheInsert(query, cachedResult, unsatCore);
  return true;
}

bool CachingSolver::computeTruth(const Query &query, bool &isValid,
                                 std::vector<ref<Expr> > &unsatCore) {
  IncompleteSolver::PartialValidity cachedResult;
  bool cacheHit = cacheLookup(query, cachedResult, unsatCore);

  // a cached result of MayBeTrue forces us to check whether
  // a False assignment exists.
  if (cacheHit && cachedResult != IncompleteSolver::MayBeTrue) {
    ++stats::queryCacheHits;
    isValid = (cachedResult == IncompleteSolver::MustBeTrue);
    return true;
  }

  ++stats::queryCacheMisses;
  
  // cache miss: query solver
  if (!solver->impl->computeTruth(query, isValid, unsatCore))
    return false;

  if (isValid) {
    cachedResult = IncompleteSolver::MustBeTrue;
  } else if (cacheHit) {
    // We know a true assignment exists, and query isn't valid, so
    // must be TrueOrFalse.
    assert(cachedResult == IncompleteSolver::MayBeTrue);
    cachedResult = IncompleteSolver::TrueOrFalse;
    unsatCore.clear();
  } else {
    cachedResult = IncompleteSolver::MayBeFalse;
    unsatCore.clear();
  }

  cacheInsert(query, cachedResult, unsatCore);
  return true;
}

SolverImpl::SolverRunStatus CachingSolver::getOperationStatusCode() {
  return solver->impl->getOperationStatusCode();
}

char *CachingSolver::getConstraintLog(const Query& query) {
  return solver->impl->getConstraintLog(query);
}

void CachingSolver::setCoreSolverTimeout(double timeout) {
  solver->impl->setCoreSolverTimeout(timeout);
}

///

Solver *klee::createCachingSolver(Solver *_solver) {
  return new Solver(new CachingSolver(_solver));
}
