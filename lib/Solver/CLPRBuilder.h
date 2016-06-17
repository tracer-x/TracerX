//===-- CLPRBuilder.h -------------------------------------------*- C++ -*-===//
//
//                The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef __UTIL_CLPRBUILDER_H__
#define __UTIL_CLPRBUILDER_H__

#include "klee/util/ExprHashMap.h"
#include "klee/util/ArrayExprHash.h"
#include "klee/Config/config.h"

#ifdef SUPPORT_CLPR

#include <sstream>
#include <vector>

#include <clpr_api++.h>

namespace klee {

  class CLPRArrayExprHash : public ArrayExprHash< clpr::CLPTerm > {
    
    friend class CLPRBuilder;
    
  public:
    CLPRArrayExprHash() {};
    virtual ~CLPRArrayExprHash();
  };

class CLPRBuilder {

  clpr::CLPTerm tempVars[4];
  ExprHashMap< std::pair<clpr::CLPTerm, unsigned> > constructed;

  /// optimizeDivides - Rewrite division and reminders by constants
  /// into multiplies and shifts. STP should probably handle this for
  /// use.
  bool optimizeDivides;

  CLPRArrayExprHash _arr_hash;

  std::vector<clpr::CLPTerm> auxiliaryConstraints;

private:  

  clpr::CLPTerm bvOne(unsigned width);
  clpr::CLPTerm bvZero(unsigned width);
  clpr::CLPTerm bvMinusOne(unsigned width);
  clpr::CLPTerm bvConst32(unsigned width, uint32_t value);
  clpr::CLPTerm bvConst64(unsigned width, uint64_t value);
  clpr::CLPTerm bvZExtConst(unsigned width, uint64_t value);
  clpr::CLPTerm bvSExtConst(unsigned width, uint64_t value);

  clpr::CLPTerm bvBoolExtract(clpr::CLPTerm expr, int bit);
  clpr::CLPTerm bvExtract(clpr::CLPTerm expr, unsigned top, unsigned bottom);
  clpr::CLPTerm eqExpr(clpr::CLPTerm a, clpr::CLPTerm b);

  //logical left and right shift (not arithmetic)
  clpr::CLPTerm bvLeftShift(clpr::CLPTerm expr, unsigned shift);
  clpr::CLPTerm bvRightShift(clpr::CLPTerm expr, unsigned shift);
  clpr::CLPTerm bvVarLeftShift(clpr::CLPTerm expr, clpr::CLPTerm shift);
  clpr::CLPTerm bvVarRightShift(clpr::CLPTerm expr, clpr::CLPTerm shift);
  clpr::CLPTerm bvVarArithRightShift(clpr::CLPTerm expr, clpr::CLPTerm shift);

  // Some STP-style bitvector arithmetic
  clpr::CLPTerm bvMinusExpr(unsigned width, clpr::CLPTerm minuend, clpr::CLPTerm subtrahend);
  clpr::CLPTerm bvPlusExpr(unsigned width, clpr::CLPTerm augend, clpr::CLPTerm addend);
  clpr::CLPTerm bvMultExpr(unsigned width, clpr::CLPTerm multiplacand, clpr::CLPTerm multiplier);
  clpr::CLPTerm bvDivExpr(unsigned width, clpr::CLPTerm dividend, clpr::CLPTerm divisor);
  clpr::CLPTerm sbvDivExpr(unsigned width, clpr::CLPTerm dividend, clpr::CLPTerm divisor);
  clpr::CLPTerm bvModExpr(unsigned width, clpr::CLPTerm dividend, clpr::CLPTerm divisor);
  clpr::CLPTerm sbvModExpr(unsigned width, clpr::CLPTerm dividend, clpr::CLPTerm divisor);
  clpr::CLPTerm notExpr(clpr::CLPTerm expr);
  clpr::CLPTerm bvNotExpr(clpr::CLPTerm expr);
  clpr::CLPTerm andExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs);
  clpr::CLPTerm bvAndExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs);
  clpr::CLPTerm orExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs);
  clpr::CLPTerm bvOrExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs);
  clpr::CLPTerm iffExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs);
  clpr::CLPTerm bvXorExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs);
  clpr::CLPTerm bvSignExtend(clpr::CLPTerm src, unsigned width);

  // Some STP-style array domain interface
  clpr::CLPTerm writeExpr(clpr::CLPTerm array, clpr::CLPTerm index, clpr::CLPTerm value);
  clpr::CLPTerm readExpr(clpr::CLPTerm array, clpr::CLPTerm index);

  // ITE-expression constructor
  clpr::CLPTerm iteExpr(clpr::CLPTerm condition, clpr::CLPTerm whenTrue, clpr::CLPTerm whenFalse);

  // Bitvector length
  int getBVLength(clpr::CLPTerm expr);

  // Bitvector comparison
  clpr::CLPTerm bvLtExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs);
  clpr::CLPTerm bvLeExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs);
  clpr::CLPTerm sbvLtExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs);
  clpr::CLPTerm sbvLeExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs);

  clpr::CLPTerm existsExpr(clpr::CLPTerm body);

  clpr::CLPTerm constructAShrByConstant(clpr::CLPTerm expr, unsigned shift,
                                       clpr::CLPTerm isSigned);
  clpr::CLPTerm constructMulByConstant(clpr::CLPTerm expr, unsigned width, uint64_t x);
  clpr::CLPTerm constructUDivByConstant(clpr::CLPTerm expr_n, unsigned width, uint64_t d);
  clpr::CLPTerm constructSDivByConstant(clpr::CLPTerm expr_n, unsigned width, uint64_t d);

  clpr::CLPTerm getInitialArray(const Array *os);
  clpr::CLPTerm getArrayForUpdate(const Array *root, const UpdateNode *un);

  clpr::CLPTerm constructActual(ref<Expr> e, int *width_out);
  clpr::CLPTerm construct(ref<Expr> e, int *width_out);
  
  clpr::CLPTerm buildVar(const char *name, unsigned width);
  clpr::CLPTerm buildArray(const char *name, unsigned indexWidth, unsigned valueWidth);

public:

  CLPRBuilder();
  ~CLPRBuilder();

  clpr::CLPTerm getTrue();
  clpr::CLPTerm getFalse();
  clpr::CLPTerm getTempVar(Expr::Width w);
  clpr::CLPTerm getInitialRead(const Array *os, unsigned index);

  clpr::CLPTerm construct(ref<Expr> e) {
    clpr::CLPTerm res = construct(e, 0);
    constructed.clear();
    return res;
  }

};

}

#endif /* SUPPORT_CLPR */

#endif /* __UTIL_CLPRBUILDER_H__ */
