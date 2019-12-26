//===-- TxWPHelper.h - Tracer-X symbolic execution tree -------------*- C++
//-*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains declarations of the classes that support for generating
/// weakest precondition interpolation.
///
//===----------------------------------------------------------------------===//

#ifndef LIB_CORE_TXWPHELPER_H_
#define LIB_CORE_TXWPHELPER_H_

#include "TxWP.h"
#include "klee/ExecutionState.h"
#include <klee/Expr.h>
#include <klee/ExprBuilder.h>
#include <klee/Internal/Support/ErrorHandling.h>
#include <klee/util/ArrayCache.h>
#include <vector>

namespace klee {

class TxWPArrayStore;

class TxWPHelper {

public:
  static ref<Expr> simplifyWPExpr(ref<Expr> e);

  //  // \brief Simplify terms in the weakest precondition expression to
  //  canonical
  //  // form
  //  static std::map<ref<Expr>, uint64_t> *
  //  simplifyWPTerm(std::map<ref<Expr>, uint64_t> *newLinearTerm,
  //                 ref<Expr> linearTerm);

  //  // \brief Insert a variable with coefficient in newLinearTerm
  //  static void insertTerm(std::map<ref<Expr>, uint64_t> *newLinearTerm,
  //                         uint64_t coeff, ref<Expr> variable);

  //  // \brief Convert newLinearTerm to an expression (in
  //  // canonical form)
  //  static ref<Expr> convertToExpr(ref<Expr> e,
  //                                 std::map<ref<Expr>, uint64_t>
  //                                 *newLinearTerm);

  static bool isTargetDependent(llvm::Value *inst, ref<Expr> expr);

  static ref<Expr> substituteExpr(ref<Expr> base, const ref<Expr> lhs,
                                  const ref<Expr> rhs);

  //  static ref<Expr> substituteArray(ref<Expr> base, const Array *lhs,
  //                                   const Array *rhs);
  //
  //  static ref<ReadExpr> ExtractReadExpr(ref<Expr> expr);
  //
  //  static std::set<ref<Expr> > extractVariables(ref<Expr> expr);
};

} /* namespace klee */

#endif /* LIB_CORE_TXWPHELPER_H_ */
