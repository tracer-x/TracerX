//===-- CLPRSolver.cpp -----------------------------------------*- C++ -*-====//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
#include "klee/Config/config.h"
#ifdef ENABLE_CLPR
#include "CLPRBuilder.h"
#include "klee/Constraints.h"
#include "klee/Solver.h"
#include "klee/SolverImpl.h"
#include "klee/Internal/Support/ErrorHandling.h"
#include "klee/util/Assignment.h"
#include "klee/util/ExprUtil.h"
#include <stdio.h>

namespace klee {

// CLP(R) files to load
llvm::cl::list<std::string>
CLPRLib("use-clpr",
        llvm::cl::desc("Load a CLP(R) file (option can be multiply specified)"),
        llvm::cl::value_desc("filespec"));

llvm::cl::opt<bool>
CLPRLog("clpr-log", llvm::cl::init(false),
        llvm::cl::desc("Log communication with CLP(R) backend in "
                       "/tmp/clpr-XXXXXX with XXXXXX some character sequence"));

class CLPRSolverImpl : public SolverImpl {
private:
  CLPRBuilder *builder;
  clpr::CLPEngine *engine;
  double timeout;
  SolverRunStatus runStatusCode;
  std::vector<ref<Expr> > unsatCore;

  static void getModel(CLPRBuilder *builder,
                       const std::vector<const Array *> &objects,
                       std::vector<std::vector<unsigned char> > &values);

  /// getUnsatCoreVector - Declare the routine to extract the unsatisfiability
  /// core vector
  ///
  /// \return - A ref<Expr> vector of unsatisfiability core: empty if there was
  /// no core.
  static std::vector<ref<Expr> >
  getUnsatCoreVector(const Query &query, const CLPRBuilder *builder,
                     const clpr::CLPEngine solver);

  /// runAndGetCex - Determine the satisfiability of a query, given assertions
  /// that already included in the Z3 solver.
  ///
  /// \param [out] hasSolution - On success, a boolean indicating the
  /// satisfiability
  /// of the formula.
  /// \param [out] values - On success and satisfiable, a vector containing the
  /// solution.
  /// \return A value of SolverRunStatus: SOLVER_RUN_STATUS_SUCCESS_SOLVABLE
  /// (satisfiable)
  /// or SOLVER_RUN_STATUS_SUCCESS_UNSOLVABLE (unsatisfiable) indicates success,
  /// others
  /// indicate solver failure.
  SolverRunStatus runAndGetCex(const Query &query, clpr::CLPQuery assertions,
                               const clpr::CLPTerm expr,
                               const std::vector<const Array *> &objects,
                               std::vector<std::vector<unsigned char> > &values,
                               bool &hasSolution);

public:
  CLPRSolverImpl();
  ~CLPRSolverImpl();

  char *getConstraintLog(const Query &);
  void setCoreSolverTimeout(double _timeout) {
    timeout = _timeout;

    unsigned timeout_buffer_size = 100;
    char *timeout_amount = new char[timeout_buffer_size];

    int ret = snprintf(timeout_amount, timeout_buffer_size, "%lu",
                       (timeout > 0 ? ((uint64_t)(timeout * 1000)) : UINT_MAX));
    assert(ret >= 0 && "invalid timeout value specification");

    // Set solver timeout here.
  }

  bool computeTruth(const Query &, bool &isValid);
  bool computeValue(const Query &, ref<Expr> &result);
  bool computeInitialValues(const Query &,
                            const std::vector<const Array *> &objects,
                            std::vector<std::vector<unsigned char> > &values,
                            bool &hasSolution);
  SolverRunStatus getOperationStatusCode();
  std::vector<ref<Expr> > getUnsatCore();

  bool validateRecursivePredicate(
      const ConstraintManager &constraints,
      std::map<const Array *, uint64_t> &arrayAddressRegistry,
      std::string predicateName, std::vector<ref<Expr> > &arguments) const;
};

CLPRSolverImpl::CLPRSolverImpl()
    : builder(new CLPRBuilder()), timeout(0.0),
      runStatusCode(SOLVER_RUN_STATUS_FAILURE) {
  assert(builder && "unable to create CLPRBuilder");
  if (CLPRLog) {
    klee_message("Logging CLP(R) output in /tmp/clpr-XXXXXX");
    engine = new clpr::CLPEngine(LOG_TMP);
  } else {
    engine = new clpr::CLPEngine(LOG_NONE);
  }

  // Load multiset and McCarthy's axiom
  engine->loadLibrary("multiset");
  engine->loadLibrary("mccarthy");

  if (CLPRLib.size()) {
    std::ostringstream stream;
    stream << "Loading CLP(R) file(s)";

    // Load user libraries specified in the command line
    for (llvm::cl::list<std::string>::const_iterator it = CLPRLib.begin(),
                                                     itEnd = CLPRLib.end();
         it != itEnd; ++it) {
      stream << " " << (*it);
      engine->loadLibraryWithFilespec((*it));
    }
    klee_message("%s", stream.str().c_str());
  }
}

CLPRSolverImpl::~CLPRSolverImpl() {
  delete builder;
  delete engine;
}

/**/

CLPRSolver::CLPRSolver() : Solver(new CLPRSolverImpl()) {}

char *CLPRSolver::getConstraintLog(const Query &query) {
  return impl->getConstraintLog(query);
}

void CLPRSolver::setCoreSolverTimeout(double timeout) {
  impl->setCoreSolverTimeout(timeout);
}

/***/

char *CLPRSolverImpl::getConstraintLog(const Query &query) {
  std::string ret;

  for (std::vector<ref<Expr> >::const_iterator it = query.constraints.begin(),
                                               ie = query.constraints.end();
       it != ie; ++it) {
    ret += builder->construct(*it).str();
    ret += "\n";
  }
  return strdup(ret.c_str());
}

bool CLPRSolverImpl::computeTruth(const Query &query, bool &isValid) {
  std::vector<const Array *> objects;
  std::vector<std::vector<unsigned char> > values;
  bool hasSolution;

  if (!computeInitialValues(query, objects, values, hasSolution))
    return false;

  isValid = !hasSolution;
  return true;
}

bool CLPRSolverImpl::computeValue(const Query &query, ref<Expr> &result) {
  std::vector<const Array *> objects;
  std::vector<std::vector<unsigned char> > values;
  bool hasSolution;

  // Find the object used in the expression, and compute an assignment
  // for them.
  findSymbolicObjects(query.expr, objects);
  if (!computeInitialValues(query.withFalse(), objects, values, hasSolution))
    return false;
  assert(hasSolution && "state has invalid constraint set");

  // Evaluate the expression with the computed assignment.
  Assignment a(objects, values);
  result = a.evaluate(query.expr);

  return true;
}

bool CLPRSolverImpl::computeInitialValues(
    const Query &query, const std::vector<const Array *> &objects,
    std::vector<std::vector<unsigned char> > &values, bool &hasSolution) {
  runStatusCode = SOLVER_RUN_STATUS_FAILURE;

  TimerStatIncrementer t(stats::queryTime);

  int counter = 1;
  clpr::CLPQuery assertions;
  for (ConstraintManager::const_iterator it = query.constraints.begin(),
                                         ie = query.constraints.end();
       it != ie; ++it) {
    assertions.addTerm(builder->construct(*it));
    counter++;
  }
  ++stats::queries;
  ++stats::queryCounterexamples;

  clpr::CLPTerm q(builder->construct(query.expr));

  bool success;
  runStatusCode =
      runAndGetCex(query, assertions, q, objects, values, hasSolution);

  success = (runStatusCode == SOLVER_RUN_STATUS_SUCCESS_SOLVABLE ||
             runStatusCode == SOLVER_RUN_STATUS_SUCCESS_UNSOLVABLE);

  if (success) {
    if (hasSolution)
      ++stats::queriesInvalid;
    else
      ++stats::queriesValid;
  }

  return success;
}

void
CLPRSolverImpl::getModel(CLPRBuilder *builder,
                         const std::vector<const Array *> &objects,
                         std::vector<std::vector<unsigned char> > &values) {

  values.reserve(objects.size());
  for (std::vector<const Array *>::const_iterator it = objects.begin(),
                                                  ie = objects.end();
       it != ie; ++it) {
    const Array *array = *it;
    std::vector<unsigned char> data;

    data.reserve(array->size);
    for (unsigned offset = 0; offset < array->size; offset++) {
      int val = 0;
      // Get actual value
      data.push_back(val);
    }
    values.push_back(data);
  }
}

SolverImpl::SolverRunStatus CLPRSolverImpl::runAndGetCex(
    const Query &query, clpr::CLPQuery assertions, const clpr::CLPTerm expr,
    const std::vector<const Array *> &objects,
    std::vector<std::vector<unsigned char> > &values, bool &hasSolution) {
  SolverRunStatus ret = SOLVER_RUN_STATUS_FAILURE;
  hasSolution = false;

  clpr::CLPTerm q("not");
  q.addArgument(expr);

  assertions.addTerm(q);

  // llvm::errs() << "Solving: " << assertions.str()
  //              << "\n";

  engine->query(assertions);

  if (engine->hasSolution()) {
    getModel(builder, objects, values);
    hasSolution = true;
    ret = SOLVER_RUN_STATUS_SUCCESS_SOLVABLE;
  } else {
    ret = SOLVER_RUN_STATUS_SUCCESS_UNSOLVABLE;
  }

  return ret;
}

std::vector<ref<Expr> >
CLPRSolverImpl::getUnsatCoreVector(const Query &query,
                                   const CLPRBuilder *builder,
                                   const clpr::CLPEngine the_solver) {
  std::vector<ref<Expr> > local_unsat_core;
  // Do nothing for now
  return local_unsat_core;
}

SolverImpl::SolverRunStatus CLPRSolverImpl::getOperationStatusCode() {
  return runStatusCode;
}

std::vector<ref<Expr> > CLPRSolverImpl::getUnsatCore() { return unsatCore; }

bool CLPRSolverImpl::validateRecursivePredicate(
    const ConstraintManager &constraints,
    std::map<const Array *, uint64_t> &arrayAddressRegistry,
    std::string predicateName, std::vector<ref<Expr> > &arguments) const {
  clpr::CLPTerm queryAtom(predicateName);
  std::vector<clpr::CLPTerm> constraintsList;

  // First we clear the auxiliary constraints and
  // register the registry.
  builder->init(arrayAddressRegistry);

  // We add the global heap as the first argument always
  queryAtom.addArgument(builder->globalHeap);

  unsigned i = 0;
  for (std::vector<ref<Expr> >::const_iterator it = ++(arguments.begin()),
                                               itEnd = arguments.end();
       it != itEnd; ++it) {
    clpr::CLPTerm clpExpr = builder->construct(*it);
    std::ostringstream tmpVarName;
    tmpVarName << "__clpr__arg" << i++ << "__";
    clpr::CLPTerm varName(tmpVarName.str());
    queryAtom.addArgument(varName);
    clpr::CLPTerm constraint("=");
    constraint.addArgument(varName);
    constraint.addArgument(clpExpr);
    constraintsList.push_back(constraint);
  }

  // Build the query
  clpr::CLPQuery query;

  // Add the constraints on the path condition
  for (ConstraintManager::const_iterator it = constraints.begin(),
                                         itEnd = constraints.end();
       it != itEnd; ++it) {
    clpr::CLPTerm clprConstraint = builder->construct(*it);
    query.addTerm(clprConstraint);
  }

  for (std::vector<clpr::CLPTerm>::const_iterator it = constraintsList.begin(),
                                                  itEnd = constraintsList.end();
       it != itEnd; ++it) {
    query.addTerm(*it);
  }

  for (std::vector<clpr::CLPTerm>::iterator
           it = builder->auxiliaryConstraintsBegin(),
           itEnd = builder->auxiliaryConstraintsEnd();
       it != itEnd; ++it) {
    query.addTerm(*it);
  }

  // Remember order is important in SLDNF, the consequent has to be last.
  clpr::CLPTerm consequent("not");
  consequent.addArgument(queryAtom);
  query.addTerm(consequent);

  engine->query(query);
  if (!engine->hasSolution()) {
    return true;
  }
  return false;
}
}
#endif // ENABLE_CLPR
