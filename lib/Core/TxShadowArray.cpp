//===-- TxShadowArray.cpp ---------------------------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementations for the shadow array, which
/// replaces KLEE arrays with their shadow counterparts as
/// existentially-quantified variables in the interpolant.
///
//===----------------------------------------------------------------------===//

#include "TxShadowArray.h"

using namespace klee;

namespace klee {

std::map<const Array *, const Array *> TxShadowArray::shadowArray;

UpdateNode *
TxShadowArray::getShadowUpdate(const UpdateNode *source,
                             std::set<const Array *> &replacements) {
  if (!source)
    return 0;

  return new UpdateNode(getShadowUpdate(source->next, replacements),
                        getShadowExpression(source->index, replacements),
                        getShadowExpression(source->value, replacements));
}

ref<Expr> TxShadowArray::createBinaryOfSameKind(ref<Expr> originalExpr,
                                              ref<Expr> newLhs,
                                              ref<Expr> newRhs) {
  std::vector<Expr::CreateArg> exprs;
  Expr::CreateArg arg1(newLhs);
  Expr::CreateArg arg2(newRhs);
  exprs.push_back(arg1);
  exprs.push_back(arg2);
  return Expr::createFromKind(originalExpr->getKind(), exprs);
}

void TxShadowArray::addShadowArrayMap(const Array *source, const Array *target) {
  shadowArray[source] = target;
}

ref<Expr>
TxShadowArray::getShadowExpression(ref<Expr> expr,
                                 std::set<const Array *> &replacements) {
  ref<Expr> ret;

  switch (expr->getKind()) {
  case Expr::Read: {
    ReadExpr *readExpr = llvm::dyn_cast<ReadExpr>(expr);
    const Array *replacementArray = shadowArray[readExpr->updates.root];

    if (std::find(replacements.begin(), replacements.end(), replacementArray) ==
        replacements.end()) {
      replacements.insert(replacementArray);
    }

    UpdateList newUpdates(
        replacementArray,
        getShadowUpdate(readExpr->updates.head, replacements));
    ret = ReadExpr::create(newUpdates,
                           getShadowExpression(readExpr->index, replacements));
    break;
  }
  case Expr::Constant: {
    ret = expr;
    break;
  }
  case Expr::Select: {
    ret =
        SelectExpr::create(getShadowExpression(expr->getKid(0), replacements),
                           getShadowExpression(expr->getKid(1), replacements),
                           getShadowExpression(expr->getKid(2), replacements));
    break;
  }
  case Expr::Extract: {
    ExtractExpr *extractExpr = llvm::dyn_cast<ExtractExpr>(expr);
    ret =
        ExtractExpr::create(getShadowExpression(expr->getKid(0), replacements),
                            extractExpr->offset, extractExpr->width);
    break;
  }
  case Expr::ZExt: {
    CastExpr *castExpr = llvm::dyn_cast<CastExpr>(expr);
    ret = ZExtExpr::create(getShadowExpression(expr->getKid(0), replacements),
                           castExpr->getWidth());
    break;
  }
  case Expr::SExt: {
    CastExpr *castExpr = llvm::dyn_cast<CastExpr>(expr);
    ret = SExtExpr::create(getShadowExpression(expr->getKid(0), replacements),
                           castExpr->getWidth());
    break;
  }
  case Expr::Concat:
  case Expr::Add:
  case Expr::Sub:
  case Expr::Mul:
  case Expr::UDiv:
  case Expr::SDiv:
  case Expr::URem:
  case Expr::SRem:
  case Expr::Not:
  case Expr::And:
  case Expr::Or:
  case Expr::Xor:
  case Expr::Shl:
  case Expr::LShr:
  case Expr::AShr:
  case Expr::Eq:
  case Expr::Ne:
  case Expr::Ult:
  case Expr::Ule:
  case Expr::Ugt:
  case Expr::Uge:
  case Expr::Slt:
  case Expr::Sle:
  case Expr::Sgt:
  case Expr::Sge: {
    ret = createBinaryOfSameKind(
        expr, getShadowExpression(expr->getKid(0), replacements),
        getShadowExpression(expr->getKid(1), replacements));
    break;
  }
  case Expr::NotOptimized: {
    ret = NotOptimizedExpr::create(getShadowExpression(expr->getKid(0), replacements));
    break;
  }
  default:
    assert(!"unhandled Expr type");
  }

  return ret;
}

}

const Array *TxShadowArray::getSymbolicArray(std::string name) {
  for (std::map<const Array *, const Array *>::iterator
           it = shadowArray.begin(),
           ie = shadowArray.end();
       it != ie; ++it) {
    if ((*it).first->getName() == name) {
      return (*it).first;
    }
  }
  return NULL;
}

const Array *TxShadowArray::getSymbolicShadowArray(std::string name) {
  for (std::map<const Array *, const Array *>::iterator
           it = shadowArray.begin(),
           ie = shadowArray.end();
       it != ie; ++it) {
    if ((*it).first->getName() == name) {
      return (*it).second;
    }
  }
  return NULL;
}
