//===-- TxPartitionHelper1.h - Tracer-X symbolic execution tree -------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains declarations of the classes that support for partitioning
///
//===----------------------------------------------------------------------===//

#ifndef LIB_CORE_TXPARTITIONHELPER1_H_
#define LIB_CORE_TXPARTITIONHELPER1_H_

#include "klee/ExecutionState.h"
#include "Memory.h"
#include "llvm/IR/Value.h"
#include "klee/Internal/Support/ErrorHandling.h"
#include <iostream>

namespace klee {

class Partition1 {
public:
	std::vector<ref<Expr> > wp1;
	std::vector<ref<Expr> > wp2;
	std::vector<ref<Expr> > pcs;
	std::map<std::string, ref<Expr> > entries;
	std::set<std::string> vars;
	void print() {
		llvm::errs() << "+wp1: \n";
		for (unsigned int i = 0; i < wp1.size(); i++) {
			wp1.at(i)->dump();
		}
		llvm::errs() << "\n+wp2: \n";
		for (unsigned int i = 0; i < wp2.size(); i++) {
			wp2.at(i)->dump();
		}
		llvm::errs() << "\n+pcs: \n";
		for (unsigned int i = 0; i < pcs.size(); i++) {
			pcs.at(i)->dump();
		}
		llvm::errs() << "\n+entries: \n";
		for (std::map<std::string, ref<Expr> >::const_iterator it =
				entries.begin(); it != entries.end(); ++it) {
			llvm::errs() << it->first << "=";
			it->second->dump();
		}
		llvm::errs() << "\n+vars: \n";
		for (std::set<std::string>::const_iterator it = vars.begin();
				it != vars.end(); ++it) {
			llvm::errs() << *it << "; ";
		}
		llvm::errs() << "\n";
	}
};

class TxPartitionHelper1 {
public:
	TxPartitionHelper1();
	virtual ~TxPartitionHelper1();

	static ref<Expr> createAnd(std::vector<ref<Expr> > exprs);
	static void getExprsFromAndExpr(ref<Expr> e,
			std::vector<ref<Expr> >& exprs);
	static ref<Expr> True() {
		return ConstantExpr::alloc(1, Expr::Bool);
	}
	;
	static ref<Expr> False() {
		return ConstantExpr::alloc(0, Expr::Bool);
	}
	;
	static std::vector<Partition1> partition(std::vector<ref<Expr> > wp1,
			std::vector<ref<Expr> > wp2, std::vector<ref<Expr> > pcs,
			std::map<std::string, ref<Expr> > entries);

	static std::vector<Partition1> paritionOnCond(ref<Expr> cond, std::vector<ref<Expr> > wp1,
				std::vector<ref<Expr> > wp2, std::vector<ref<Expr> > pcs,
				std::map<std::string, ref<Expr> > entries);
private:
	static bool isShared(std::set<std::string> ss1, std::set<std::string> ss2);
	static void getExprVars(ref<Expr> e, std::set<std::string> &vars);
	static void combine(std::vector<Partition1>& parts, std::vector<int> indexs);
};

}
#endif /* LIB_CORE_TXPARTITIONHELPER1_H_ */
