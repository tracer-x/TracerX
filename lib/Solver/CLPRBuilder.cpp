//===-- CLPRBuilder.cpp ---------------------------------------------------===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


#include "klee/Expr.h"
#include "klee/Solver.h"
#include "klee/SolverStats.h"
#include "klee/util/Bits.h"
#include "klee/SolverStats.h"

#include "ConstantDivision.h"
#include "CLPRBuilder.h"

#ifdef SUPPORT_CLPR

#include "llvm/Support/CommandLine.h"

#include <cstdio>

#include <algorithm> // max, min
#include <cassert>
#include <map>
#include <sstream>
#include <vector>

using namespace klee;

namespace {
  llvm::cl::opt<bool>
  UseConstructHashCLPR("use-construct-hash-clpr",
                       llvm::cl::desc("Use hash-consing during CLP(R) query construction."),
                       llvm::cl::init(true));
}

///

CLPRArrayExprHash::~CLPRArrayExprHash() {}

/***/

CLPRBuilder::CLPRBuilder() {
  tempVars[0] = buildVar("__tmpInt8", 8);
  tempVars[1] = buildVar("__tmpInt16", 16);
  tempVars[2] = buildVar("__tmpInt32", 32);
  tempVars[3] = buildVar("__tmpInt64", 64);
}

CLPRBuilder::~CLPRBuilder() {}

///

/* Warning: be careful about what c_interface functions you use. Some of
   them look like they cons memory but in fact don't, which is bad when
   you call vc_DeleteExpr on them. */

clpr::CLPTerm CLPRBuilder::buildVar(const char *name, unsigned width) {
  return clpr::CLPTerm(name);
}

clpr::CLPTerm CLPRBuilder::buildArray(const char *name, unsigned indexWidth, unsigned valueWidth) {
  // We treat arrays as normal variables.
  return clpr::CLPTerm(name);
}

clpr::CLPTerm CLPRBuilder::getTempVar(Expr::Width w) {
  return clpr::CLPTerm("_");
}

/**
 * Make 1-bit bitvector whose only element is 1.
 */
clpr::CLPTerm CLPRBuilder::getTrue() { return clpr::CLPTerm("1"); }

/**
 * Make 1-bit bitvector whose only element is 0.
 */
clpr::CLPTerm CLPRBuilder::getFalse() { return clpr::CLPTerm("0"); }

clpr::CLPTerm CLPRBuilder::bvOne(unsigned width) { return getTrue(); }

clpr::CLPTerm CLPRBuilder::bvZero(unsigned width) { return getFalse(); }

clpr::CLPTerm CLPRBuilder::bvMinusOne(unsigned width) {
  return clpr::CLPTerm("(-1)");
}

clpr::CLPTerm CLPRBuilder::bvConst32(unsigned width, uint32_t value) {
  std::ostringstream stream;
  stream << "(" << value << ")";
  return clpr::CLPTerm(stream.str());
}

clpr::CLPTerm CLPRBuilder::bvConst64(unsigned width, uint64_t value) {
  std::ostringstream stream;
  stream << "(" << value << ")";
  return clpr::CLPTerm(stream.str());
}

clpr::CLPTerm CLPRBuilder::bvZExtConst(unsigned width, uint64_t value) {
  return bvConst64(width, value);
}

clpr::CLPTerm CLPRBuilder::bvSExtConst(unsigned width, uint64_t value) {
  return bvConst64(width, value);
}

clpr::CLPTerm CLPRBuilder::bvBoolExtract(clpr::CLPTerm expr, int bit) {
  return expr;
}

clpr::CLPTerm CLPRBuilder::bvExtract(clpr::CLPTerm expr, unsigned top, unsigned bottom) {
  return expr;
}

clpr::CLPTerm CLPRBuilder::eqExpr(clpr::CLPTerm a, clpr::CLPTerm b) {
  clpr::CLPTerm eq("=");
  eq.addArgument(a);
  eq.addArgument(b);
  return eq;
}

// logical right shift
clpr::CLPTerm CLPRBuilder::bvRightShift(clpr::CLPTerm expr, unsigned shift) {
  std::ostringstream stream;
  stream << "(" << (2 ^ (shift)) << ")";

  clpr::CLPTerm div("/");
  div.addArgument(expr);
  div.addArgument(stream.str());

  return div;
}

// logical left shift
clpr::CLPTerm CLPRBuilder::bvLeftShift(clpr::CLPTerm expr, unsigned shift) {
  std::ostringstream stream;
  stream << "(" << (2 ^ (shift)) << ")";

  clpr::CLPTerm mul("*");
  mul.addArgument(expr);
  mul.addArgument(stream.str());

  return mul;
}

// left shift by a variable amount on an expression of the specified width
clpr::CLPTerm CLPRBuilder::bvVarLeftShift(clpr::CLPTerm expr, clpr::CLPTerm shift) {
  // There is no theory for left shift, so we return unknown.
  return clpr::CLPTerm("_");
}

// logical right shift by a variable amount on an expression of the specified width
clpr::CLPTerm CLPRBuilder::bvVarRightShift(clpr::CLPTerm expr, clpr::CLPTerm shift) {
  // There is no theory for right shift, so we return unknown.
  return clpr::CLPTerm("_");
}

// arithmetic right shift by a variable amount on an expression of the specified width
clpr::CLPTerm CLPRBuilder::bvVarArithRightShift(clpr::CLPTerm expr, clpr::CLPTerm shift) {
  return clpr::CLPTerm("_");
}

clpr::CLPTerm CLPRBuilder::bvMinusExpr(unsigned width, clpr::CLPTerm minuend, clpr::CLPTerm subtrahend) {
  clpr::CLPTerm sub("-");
  sub.addArgument(minuend);
  sub.addArgument(subtrahend);
  return sub;
}

clpr::CLPTerm CLPRBuilder::bvPlusExpr(unsigned width, clpr::CLPTerm augend, clpr::CLPTerm addend) {
  clpr::CLPTerm addition("+");
  addition.addArgument(augend);
  addition.addArgument(addend);
  return addition;
}

clpr::CLPTerm CLPRBuilder::bvMultExpr(unsigned width, clpr::CLPTerm multiplacand, clpr::CLPTerm multiplier) {
  clpr::CLPTerm mul("*");
  mul.addArgument(multiplacand);
  mul.addArgument(multiplier);
  return mul;
}

clpr::CLPTerm CLPRBuilder::bvDivExpr(unsigned width, clpr::CLPTerm dividend, clpr::CLPTerm divisor) {
  clpr::CLPTerm div("/");
  div.addArgument(dividend);
  div.addArgument(divisor);
  return div;
}

clpr::CLPTerm CLPRBuilder::sbvDivExpr(unsigned width, clpr::CLPTerm dividend, clpr::CLPTerm divisor) {
  return bvDivExpr(width, dividend, divisor);
}

clpr::CLPTerm CLPRBuilder::bvModExpr(unsigned width, clpr::CLPTerm dividend, clpr::CLPTerm divisor) {
  // CLP(R) has no modulo operator, simply return unknown.
  return clpr::CLPTerm("_");
}

clpr::CLPTerm CLPRBuilder::sbvModExpr(unsigned width, clpr::CLPTerm dividend, clpr::CLPTerm divisor) {
  // CLP(R) has no modulo operator, simply return unknown.
  return clpr::CLPTerm("_");
}

clpr::CLPTerm CLPRBuilder::notExpr(clpr::CLPTerm expr) {
  clpr::CLPTerm ret("not");
  ret.addArgument(expr);
  return ret;
}

clpr::CLPTerm CLPRBuilder::bvNotExpr(clpr::CLPTerm expr) {
  // We do not handle bitwise not
  return clpr::CLPTerm("_");
}

clpr::CLPTerm CLPRBuilder::andExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs) {
  clpr::CLPTerm conjunction(",");
  conjunction.addArgument(lhs);
  conjunction.addArgument(rhs);
  return conjunction;
}

clpr::CLPTerm CLPRBuilder::bvAndExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs) {
  // No support for bitwise and
  return clpr::CLPTerm("_");
}

clpr::CLPTerm CLPRBuilder::orExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs) {
  clpr::CLPTerm disjunction(";");
  disjunction.addArgument(lhs);
  disjunction.addArgument(rhs);
  return disjunction;
}

clpr::CLPTerm CLPRBuilder::bvOrExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs) {
  // We do not support bitwise or
  return clpr::CLPTerm("_");
}

clpr::CLPTerm CLPRBuilder::iffExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs) {
  // We do not support bitwise iff
  return clpr::CLPTerm("_");
}

clpr::CLPTerm CLPRBuilder::bvXorExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs) {
  // We do not support bitwise xor
  return clpr::CLPTerm("_");
}

clpr::CLPTerm CLPRBuilder::bvSignExtend(clpr::CLPTerm src, unsigned width) {
  return src;
}

clpr::CLPTerm CLPRBuilder::writeExpr(clpr::CLPTerm array, clpr::CLPTerm index, clpr::CLPTerm value) {
  clpr::CLPTerm upd("mcc_update");
  upd.addArgument(array);
  upd.addArgument(index);

  std::ostringstream tmpVarNameStream;
  tmpVarNameStream << "_t" << (&upd);

  clpr::CLPTerm tmpVar(tmpVarNameStream.str());
  upd.addArgument(tmpVar);

  auxiliaryConstraints.push_back(upd);
  return tmpVar;
}

clpr::CLPTerm CLPRBuilder::readExpr(clpr::CLPTerm array, clpr::CLPTerm index) {
  clpr::CLPTerm select("mcc_select");
  select.addArgument(array);
  select.addArgument(index);

  std::ostringstream tmpVarNameStream;
  tmpVarNameStream << "_t" << (&select);

  clpr::CLPTerm tmpVar(tmpVarNameStream.str());
  select.addArgument(tmpVar);

  auxiliaryConstraints.push_back(select);
  return tmpVar;
}

clpr::CLPTerm CLPRBuilder::iteExpr(clpr::CLPTerm condition, clpr::CLPTerm whenTrue, clpr::CLPTerm whenFalse) {
  clpr::CLPTerm implication1("->");
  implication1.addArgument(condition);
  implication1.addArgument(whenTrue);

  clpr::CLPTerm implication2("->");
  clpr::CLPTerm negatedCondition("not");
  negatedCondition.addArgument(condition);
  implication2.addArgument(negatedCondition);
  implication2.addArgument(whenFalse);

  return andExpr(implication1, implication2);
}

clpr::CLPTerm CLPRBuilder::bvLtExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs) {
  clpr::CLPTerm ltConstraint("<");
  ltConstraint.addArgument(lhs);
  ltConstraint.addArgument(rhs);
  return ltConstraint;
}

clpr::CLPTerm CLPRBuilder::bvLeExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs) {
  clpr::CLPTerm leConstraint("<=");
  leConstraint.addArgument(lhs);
  leConstraint.addArgument(rhs);
  return leConstraint;
}

clpr::CLPTerm CLPRBuilder::sbvLtExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs) {
  return bvLtExpr(lhs, rhs);
}

clpr::CLPTerm CLPRBuilder::sbvLeExpr(clpr::CLPTerm lhs, clpr::CLPTerm rhs) {
  return bvLeExpr(lhs, rhs);
}

clpr::CLPTerm CLPRBuilder::existsExpr(clpr::CLPTerm body) {
  // We don't have special existentail quantification: it is implemented
  // simply by fresh variables within body.
  return body;
}

clpr::CLPTerm CLPRBuilder::constructAShrByConstant(clpr::CLPTerm expr,
                                                   unsigned shift,
                                                   clpr::CLPTerm isSigned) {
  return CLPRBuilder::bvRightShift(expr, shift);
}

clpr::CLPTerm CLPRBuilder::constructMulByConstant(clpr::CLPTerm expr, unsigned width, uint64_t x) {
  clpr::CLPTerm ret("*");
  ret.addArgument(expr);
  ret.addArgument(bvConst64(width, x));
  return ret;
}

/* 
 * Compute the 32-bit unsigned integer division of n by a divisor d based on 
 * the constants derived from the constant divisor d.
 *
 * Returns n/d without doing explicit division.  The cost is 2 adds, 3 shifts, 
 * and a (64-bit) multiply.
 *
 * @param n      numerator (dividend) as an expression
 * @param width  number of bits used to represent the value
 * @param d      the divisor
 *
 * @return n/d without doing explicit division
 */
clpr::CLPTerm CLPRBuilder::constructUDivByConstant(clpr::CLPTerm expr_n, unsigned width, uint64_t d) {
  assert(width==32 && "can only compute udiv constants for 32-bit division");

  clpr::CLPTerm div("/");

  std::ostringstream stream;
  stream << d;
  clpr::CLPTerm divisor(stream.str());

  div.addArgument(expr_n);
  div.addArgument(divisor);
  return div;
}

/* 
 * Compute the 32-bitnsigned integer division of n by a divisor d based on 
 * the constants derived from the constant divisor d.
 *
 * Returns n/d without doing explicit division.  The cost is 3 adds, 3 shifts, 
 * a (64-bit) multiply, and an XOR.
 *
 * @param n      numerator (dividend) as an expression
 * @param width  number of bits used to represent the value
 * @param d      the divisor
 *
 * @return n/d without doing explicit division
 */
clpr::CLPTerm CLPRBuilder::constructSDivByConstant(clpr::CLPTerm expr_n, unsigned width, uint64_t d) {
  // Refactor using APInt::ms APInt::magic();
  assert(width==32 && "can only compute udiv constants for 32-bit division");

  clpr::CLPTerm div("/");

  std::ostringstream stream;
  stream << d;
  clpr::CLPTerm divisor(stream.str());

  div.addArgument(expr_n);
  div.addArgument(divisor);

  return div;
}

clpr::CLPTerm CLPRBuilder::getInitialArray(const Array *root) {
  
  assert(root);
  clpr::CLPTerm array_expr;
  bool hashed = _arr_hash.lookupArrayExpr(root, array_expr);
  
  if (!hashed) {
    // STP uniques arrays by name, so we make sure the name is unique by
    // including the address.
    char buf[32];
    unsigned const addrlen = sprintf(buf, "_%p", (const void*)root) + 1; // +1 for null-termination
    unsigned const space = (root->name.length() > 32 - addrlen)?(32 - addrlen):root->name.length();
    memmove(buf + space, buf, addrlen); // moving the address part to the end
    memcpy(buf, root->name.c_str(), space); // filling out the name part
    
    array_expr = buildArray(buf, root->getDomain(), root->getRange());
    
    if (root->isConstantArray()) {
    	// FIXME: Flush the concrete values into STP. Ideally we would do this
    	// using assertions, which is much faster, but we need to fix the caching
    	// to work correctly in that case.
    	for (unsigned i = 0, e = root->size; i != e; ++i) {
    		clpr::CLPTerm prev = array_expr;
    		array_expr = writeExpr(prev,
    				construct(ConstantExpr::alloc(i, root->getDomain()), 0),
    				construct(root->constantValues[i], 0));
    	}
    }

    _arr_hash.hashArrayExpr(root, array_expr);
  }
  
  return(array_expr); 
}

clpr::CLPTerm CLPRBuilder::getInitialRead(const Array *root, unsigned index) {
  return readExpr(getInitialArray(root), bvConst32(32, index));
}

clpr::CLPTerm CLPRBuilder::getArrayForUpdate(const Array *root,
                                       const UpdateNode *un) {
  if (!un) {
      return(getInitialArray(root));
  }
  else {
	  // FIXME: This really needs to be non-recursive.
	  clpr::CLPTerm un_expr;
	  bool hashed = _arr_hash.lookupUpdateNodeExpr(un, un_expr);

	  if (!hashed) {
		  un_expr = writeExpr(getArrayForUpdate(root, un->next),
				  construct(un->index, 0),
				  construct(un->value, 0));

		  _arr_hash.hashUpdateNodeExpr(un, un_expr);
	  }

	  return(un_expr);
  }
}

/** if *width_out!=1 then result is a bitvector,
    otherwise it is a bool */
clpr::CLPTerm CLPRBuilder::construct(ref<Expr> e, int *width_out) {
  if (!UseConstructHashCLPR || isa<ConstantExpr>(e)) {
    return constructActual(e, width_out);
  } else {
    ExprHashMap< std::pair<clpr::CLPTerm, unsigned> >::iterator it =
      constructed.find(e);
    if (it!=constructed.end()) {
      if (width_out)
        *width_out = it->second.second;
      return it->second.first;
    } else {
      int width;
      if (!width_out) width_out = &width;
      clpr::CLPTerm res = constructActual(e, width_out);
      constructed.insert(std::make_pair(e, std::make_pair(res, *width_out)));
      return res;
    }
  }
}


/** if *width_out!=1 then result is a bitvector,
    otherwise it is a bool */
clpr::CLPTerm CLPRBuilder::constructActual(ref<Expr> e, int *width_out) {
  int width;
  if (!width_out) width_out = &width;

  ++stats::queryConstructs;

  switch (e->getKind()) {
  case Expr::Constant: {
    ConstantExpr *CE = cast<ConstantExpr>(e);
    *width_out = CE->getWidth();

    // Coerce to bool if necessary.
    if (*width_out == 1)
      return CE->isTrue() ? getTrue() : getFalse();

    // Fast path.
    if (*width_out <= 32)
      return bvConst32(*width_out, CE->getZExtValue(32));

    return bvConst64(*width_out, CE->getZExtValue());
  }
    
  // Special
  case Expr::NotOptimized: {
    NotOptimizedExpr *noe = cast<NotOptimizedExpr>(e);
    return construct(noe->src, width_out);
  }

  case Expr::Read: {
    ReadExpr *re = cast<ReadExpr>(e);
    assert(re && re->updates.root);
    *width_out = re->updates.root->getRange();
    return readExpr(getArrayForUpdate(re->updates.root, re->updates.head),
                    construct(re->index, 0));
  }
    
  case Expr::Select: {
    SelectExpr *se = cast<SelectExpr>(e);
    clpr::CLPTerm cond = construct(se->cond, 0);
    clpr::CLPTerm tExpr = construct(se->trueExpr, width_out);
    clpr::CLPTerm fExpr = construct(se->falseExpr, width_out);
    return iteExpr(cond, tExpr, fExpr);
  }

  case Expr::Concat: {
    ConcatExpr *ce = cast<ConcatExpr>(e);
    ReadExpr *re = cast<ReadExpr>(ce->getKid((ce->numKids) - 1));
    assert(re && re->updates.root);

    clpr::CLPTerm res(re->updates.root->name);
    return res;
  }

  case Expr::Extract: {
    ExtractExpr *ee = cast<ExtractExpr>(e);
    clpr::CLPTerm src = construct(ee->expr, width_out);
    *width_out = ee->getWidth();
    if (*width_out==1) {
      return bvBoolExtract(src, ee->offset);
    } else {
      return bvExtract(src, ee->offset + *width_out - 1, ee->offset);
    }
  }

    // Casting

  case Expr::ZExt: {
    int srcWidth;
    CastExpr *ce = cast<CastExpr>(e);
    clpr::CLPTerm src = construct(ce->src, &srcWidth);
    *width_out = ce->getWidth();
    if (srcWidth==1) {
      return iteExpr(src, bvOne(*width_out), bvZero(*width_out));
    } else {
      return src;
    }
  }

  case Expr::SExt: {
    int srcWidth;
    CastExpr *ce = cast<CastExpr>(e);
    clpr::CLPTerm src = construct(ce->src, &srcWidth);
    *width_out = ce->getWidth();
    if (srcWidth==1) {
      return iteExpr(src, bvMinusOne(*width_out), bvZero(*width_out));
    } else {
      return bvSignExtend(src, *width_out);
    }
  }

    // Arithmetic

  case Expr::Add: {
    AddExpr *ae = cast<AddExpr>(e);
    clpr::CLPTerm left = construct(ae->left, width_out);
    clpr::CLPTerm right = construct(ae->right, width_out);
    assert(*width_out!=1 && "uncanonicalized add");
    return bvPlusExpr(*width_out, left, right);
  }

  case Expr::Sub: {
    SubExpr *se = cast<SubExpr>(e);
    clpr::CLPTerm left = construct(se->left, width_out);
    clpr::CLPTerm right = construct(se->right, width_out);
    assert(*width_out!=1 && "uncanonicalized sub");
    return bvMinusExpr(*width_out, left, right);
  } 

  case Expr::Mul: {
	  MulExpr *me = cast<MulExpr>(e);
	  clpr::CLPTerm right = construct(me->right, width_out);
	  assert(*width_out!=1 && "uncanonicalized mul");

	  if (ConstantExpr *CE = dyn_cast<ConstantExpr>(me->left))
		  if (CE->getWidth() <= 64)
			  return constructMulByConstant(right, *width_out,
					  CE->getZExtValue());

	  clpr::CLPTerm left = construct(me->left, width_out);
	  return bvMultExpr(*width_out, left, right);
  }

  case Expr::UDiv: {
	  UDivExpr *de = cast<UDivExpr>(e);
	  clpr::CLPTerm left = construct(de->left, width_out);
	  assert(*width_out!=1 && "uncanonicalized udiv");

	  if (ConstantExpr *CE = dyn_cast<ConstantExpr>(de->right)) {
		  if (CE->getWidth() <= 64) {
			  uint64_t divisor = CE->getZExtValue();

			  if (bits64::isPowerOfTwo(divisor)) {
				  return bvRightShift(left,
						  bits64::indexOfSingleBit(divisor));
			  } else if (optimizeDivides) {
				  if (*width_out == 32) //only works for 32-bit division
					  return constructUDivByConstant( left, *width_out,
							  (uint32_t) divisor);
			  }
		  }
	  }

    clpr::CLPTerm right = construct(de->right, width_out);
    return bvDivExpr(*width_out, left, right);
  }

  case Expr::SDiv: {
    SDivExpr *de = cast<SDivExpr>(e);
    clpr::CLPTerm left = construct(de->left, width_out);
    assert(*width_out!=1 && "uncanonicalized sdiv");

    if (ConstantExpr *CE = dyn_cast<ConstantExpr>(de->right))
      if (optimizeDivides) {
        llvm::APInt divisor = CE->getAPValue();
        if (divisor != llvm::APInt(CE->getWidth(),1, false /*unsigned*/) &&
            divisor != llvm::APInt(CE->getWidth(), -1, true /*signed*/))
            if (*width_out == 32) //only works for 32-bit division
               return constructSDivByConstant( left, *width_out,
                                          CE->getZExtValue(32));
      }
    // XXX need to test for proper handling of sign, not sure I
    // trust STP
    clpr::CLPTerm right = construct(de->right, width_out);
    return sbvDivExpr(*width_out, left, right);
  }

  case Expr::URem: {
    URemExpr *de = cast<URemExpr>(e);
    clpr::CLPTerm left = construct(de->left, width_out);
    assert(*width_out!=1 && "uncanonicalized urem");
    
    if (ConstantExpr *CE = dyn_cast<ConstantExpr>(de->right)) {
      if (CE->getWidth() <= 64) {
        uint64_t divisor = CE->getZExtValue();

        if (bits64::isPowerOfTwo(divisor)) {
          unsigned bits = bits64::indexOfSingleBit(divisor);

          // special case for modding by 1 or else we bvExtract -1:0
          if (bits == 0) {
            return bvZero(*width_out);
          } else {
            return left;
          }
        }

        // Use fast division to compute modulo without explicit division for
        // constant divisor.

        if (optimizeDivides) {
          if (*width_out == 32) { //only works for 32-bit division
            clpr::CLPTerm quotient = constructUDivByConstant( left, *width_out, (uint32_t)divisor );
            clpr::CLPTerm quot_times_divisor = constructMulByConstant( quotient, *width_out, divisor );
            clpr::CLPTerm rem = bvMinusExpr( *width_out, left, quot_times_divisor );
            return rem;
          }
        }
      }
    }
    
    clpr::CLPTerm right = construct(de->right, width_out);
    return bvModExpr(*width_out, left, right);
  }

  case Expr::SRem: {
    SRemExpr *de = cast<SRemExpr>(e);
    clpr::CLPTerm left = construct(de->left, width_out);
    clpr::CLPTerm right = construct(de->right, width_out);
    assert(*width_out!=1 && "uncanonicalized srem");

#if 0 //not faster per first benchmark
    if (optimizeDivides) {
      if (ConstantExpr *cre = de->right->asConstant()) {
	uint64_t divisor = cre->asUInt64;

	//use fast division to compute modulo without explicit division for constant divisor
      	if( *width_out == 32 ) { //only works for 32-bit division
	  clpr::CLPTerm quotient = constructSDivByConstant( left, *width_out, divisor );
	  clpr::CLPTerm quot_times_divisor = constructMulByConstant( quotient, *width_out, divisor );
	  clpr::CLPTerm rem = vc_bvMinusExpr( vc, *width_out, left, quot_times_divisor );
	  return rem;
	}
      }
    }
#endif

    // XXX implement my fast path and test for proper handling of sign
    return sbvModExpr(*width_out, left, right);
  }

    // Bitwise

  case Expr::Not: {
    NotExpr *ne = cast<NotExpr>(e);
    clpr::CLPTerm expr = construct(ne->expr, width_out);
    if (*width_out==1) {
      return notExpr(expr);
    } else {
      return bvNotExpr(expr);
    }
  }    

  case Expr::And: {
    AndExpr *ae = cast<AndExpr>(e);
    clpr::CLPTerm left = construct(ae->left, width_out);
    clpr::CLPTerm right = construct(ae->right, width_out);
    if (*width_out==1) {
      return andExpr(left, right);
    } else {
      return bvAndExpr(left, right);
    }
  }

  case Expr::Or: {
    OrExpr *oe = cast<OrExpr>(e);
    clpr::CLPTerm left = construct(oe->left, width_out);
    clpr::CLPTerm right = construct(oe->right, width_out);
    if (*width_out==1) {
      return orExpr(left, right);
    } else {
      return bvOrExpr(left, right);
    }
  }

  case Expr::Xor: {
    XorExpr *xe = cast<XorExpr>(e);
    clpr::CLPTerm left = construct(xe->left, width_out);
    clpr::CLPTerm right = construct(xe->right, width_out);
    
    if (*width_out==1) {
      // XXX check for most efficient?
      return iteExpr(left,
                        clpr::CLPTerm(notExpr(right)), right);
    } else {
      return bvXorExpr(left, right);
    }
  }

  case Expr::Shl: {
    ShlExpr *se = cast<ShlExpr>(e);
    clpr::CLPTerm left = construct(se->left, width_out);
    assert(*width_out!=1 && "uncanonicalized shl");

    if (ConstantExpr *CE = dyn_cast<ConstantExpr>(se->right)) {
      return bvLeftShift(left, (unsigned) CE->getLimitedValue());
    } else {
      int shiftWidth;
      clpr::CLPTerm amount = construct(se->right, &shiftWidth);
      return bvVarLeftShift( left, amount);
    }
  }

  case Expr::LShr: {
    LShrExpr *lse = cast<LShrExpr>(e);
    clpr::CLPTerm left = construct(lse->left, width_out);
    assert(*width_out!=1 && "uncanonicalized lshr");

    if (ConstantExpr *CE = dyn_cast<ConstantExpr>(lse->right)) {
      return bvRightShift(left, (unsigned) CE->getLimitedValue());
    } else {
      int shiftWidth;
      clpr::CLPTerm amount = construct(lse->right, &shiftWidth);
      return bvVarRightShift( left, amount);
    }
  }

  case Expr::AShr: {
    AShrExpr *ase = cast<AShrExpr>(e);
    clpr::CLPTerm left = construct(ase->left, width_out);
    assert(*width_out!=1 && "uncanonicalized ashr");
    
    if (ConstantExpr *CE = dyn_cast<ConstantExpr>(ase->right)) {
      unsigned shift = (unsigned) CE->getLimitedValue();
      clpr::CLPTerm signedBool = bvBoolExtract(left, *width_out-1);
      return constructAShrByConstant(left, shift, signedBool);
    } else {
      int shiftWidth;
      clpr::CLPTerm amount = construct(ase->right, &shiftWidth);
      return bvVarArithRightShift( left, amount);
    }
  }

    // Comparison

  case Expr::Eq: {
    EqExpr *ee = cast<EqExpr>(e);
    clpr::CLPTerm left = construct(ee->left, width_out);
    clpr::CLPTerm right = construct(ee->right, width_out);
    if (*width_out==1) {
      if (ConstantExpr *CE = dyn_cast<ConstantExpr>(ee->left)) {
        if (CE->isTrue())
          return right;
        return notExpr(right);
      } else {
        return iffExpr(left, right);
      }
    } else {
      *width_out = 1;
      return eqExpr(left, right);
    }
  }

  case Expr::Ult: {
    UltExpr *ue = cast<UltExpr>(e);
    clpr::CLPTerm left = construct(ue->left, width_out);
    clpr::CLPTerm right = construct(ue->right, width_out);
    assert(*width_out!=1 && "uncanonicalized ult");
    *width_out = 1;
    return bvLtExpr(left, right);
  }

  case Expr::Ule: {
    UleExpr *ue = cast<UleExpr>(e);
    clpr::CLPTerm left = construct(ue->left, width_out);
    clpr::CLPTerm right = construct(ue->right, width_out);
    assert(*width_out!=1 && "uncanonicalized ule");
    *width_out = 1;
    return bvLeExpr(left, right);
  }

  case Expr::Slt: {
    SltExpr *se = cast<SltExpr>(e);
    clpr::CLPTerm left = construct(se->left, width_out);
    clpr::CLPTerm right = construct(se->right, width_out);
    assert(*width_out!=1 && "uncanonicalized slt");
    *width_out = 1;
    return sbvLtExpr(left, right);
  }

  case Expr::Sle: {
    SleExpr *se = cast<SleExpr>(e);
    clpr::CLPTerm left = construct(se->left, width_out);
    clpr::CLPTerm right = construct(se->right, width_out);
    assert(*width_out!=1 && "uncanonicalized sle");
    *width_out = 1;
    return sbvLeExpr(left, right);
  }

    // unused due to canonicalization
#if 0
  case Expr::Ne:
  case Expr::Ugt:
  case Expr::Uge:
  case Expr::Sgt:
  case Expr::Sge:
#endif

  case Expr::Exists: {
    ExistsExpr *xe = cast<ExistsExpr>(e);
    clpr::CLPTerm ret = existsExpr(construct(xe->body, width_out));
    *width_out = 1;
    return ret;
  }

  default: 
    assert(0 && "unhandled Expr type");
    return getTrue();
  }
}

#endif /* SUPPORT_CLPR */
