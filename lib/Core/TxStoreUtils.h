
#ifndef LIB_CORE_TXSTOREUTILS_H_
#define LIB_CORE_TXSTOREUTILS_H_

#include "TimingSolver.h"
#include "TxDependency.h"
#include "TxStore.h"
#include "TxWP.h"
#include "klee/CommandLine.h"
#include "klee/Config/Version.h"
#include "klee/ExecutionState.h"
#include "klee/Solver.h"
#include "klee/Statistic.h"
#include "klee/TimerStatIncrementer.h"
#include "klee/util/ExprVisitor.h"
#include "klee/util/TxTreeGraph.h"
#include "llvm/Support/raw_ostream.h"
#include <klee/Expr.h>

#include "TxDependency.h"
#include "TxShadowArray.h"
#include <fstream>
#include <klee/CommandLine.h>
#include <klee/Expr.h>
#include <klee/Internal/Support/ErrorHandling.h>
#include <klee/Solver.h>
#include <klee/SolverStats.h>
#include <klee/util/ExprPPrinter.h>
#include <klee/util/TxExprUtil.h>
#include <klee/util/TxPrintUtil.h>
#include <vector>

namespace klee {

class TxStoreUtils {
public:
  TxStoreUtils();
  virtual ~TxStoreUtils();

  static void printTopInterpolantStore(
      TxStore::TopInterpolantStore concretelyAddressedStore);
};
}

#endif /* LIB_CORE_TXSTOREUTILS_H_ */
