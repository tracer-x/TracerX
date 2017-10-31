//===--- TxExprUtil.h - Utilities for handling expressions ------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// Utilities for handling expressions.
///
//===----------------------------------------------------------------------===//

#ifndef KLEE_TXEXPRUTIL_H
#define KLEE_TXEXPRUTIL_H

#include "klee/util/ExprVisitor.h"

namespace klee {

/// \brief General substitution mechanism
class TxSubstitutionVisitor : public ExprVisitor {
private:
  const std::map<ref<Expr>, ref<Expr> > &replacements;

public:
  TxSubstitutionVisitor(const std::map<ref<Expr>, ref<Expr> > &_replacements)
      : ExprVisitor(true), replacements(_replacements) {}

  Action visitExprPost(const Expr &e) {
    std::map<ref<Expr>, ref<Expr> >::const_iterator it =
        replacements.find(ref<Expr>(const_cast<Expr *>(&e)));
    if (it != replacements.end()) {
      return Action::changeTo(it->second);
    } else {
      return Action::doChildren();
    }
  }
};
}

#endif // KLEE_TXEXPRUTIL_H
