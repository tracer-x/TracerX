//===-- TxExprRangeHelper.h - Tracer-X symbolic execution tree -------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains declarations of the classes that support for simplifying expr
///
//===----------------------------------------------------------------------===//

#ifndef LIB_CORE_TXEXPRRANGEHELPER_H_
#define LIB_CORE_TXEXPRRANGEHELPER_H_

#include "klee/ExecutionState.h"
#include "Memory.h"

namespace klee {

class Range {
public:
	int lower;
	int upper;
};

class TxExprRangeHelper {
public:
	static Range getRange(std::vector<ref<Expr> > exprs);
	TxExprRangeHelper();
	virtual ~TxExprRangeHelper();
};

}

#endif /* LIB_CORE_TXEXPRRANGEHELPER_H_ */
