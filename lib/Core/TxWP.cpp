//===-- TxWP.cpp - Interpolation tree -------------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementations of the classes for weakest
/// precondition.
///
//===----------------------------------------------------------------------===//

#include "TxWP.h"
#include "Context.h"
#include "TxTree.h"

#include <klee/Expr.h>
#include <klee/Internal/Support/ErrorHandling.h>

#include "TimingSolver.h"
#include "TxDependency.h"
#include "TxShadowArray.h"

#include <fstream>
#include <klee/CommandLine.h>
#include <klee/Solver.h>
#include <klee/SolverStats.h>
#include <klee/util/ExprPPrinter.h>
#include <klee/util/TxPrintUtil.h>
#include <vector>
// Arpi Added Headers
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/IntrinsicInst.h"
//#include "llvm/IR/DebugInfoMetadata.h"



#include <cstdio>
#include <iostream>
#include <map>
#include <set>
#include <stack>

using namespace klee;
using namespace llvm;

typedef std::map<ref<TxVariable>, ref<TxInterpolantValue> > LowerInterpolantStore;
typedef std::map<ref<TxAllocationContext>, LowerInterpolantStore> TopInterpolantStore;

TxWeakestPreCondition::TxWeakestPreCondition(TxTreeNode *_node,
		TxDependency *_dependency, llvm::DataLayout *_targetData) {
	WPExpr = True();

	// Used to represent constants during the simplification of WPExpr to
	// canonical form
	node = _node;
	dependency = _dependency;
	targetData = _targetData;
	if (dependency)
		debugSubsumptionLevel = dependency->debugSubsumptionLevel;
}

TxWeakestPreCondition::~TxWeakestPreCondition() {
}

/*****************************************************************************/

ref<Expr> TxWeakestPreCondition::intersectWPExpr(ref<Expr> branchCondition,
		ref<Expr> expr1, ref<Expr> expr2) {
	// v
	std::set<std::string> bvars = TxPartitionHelper::getExprVars(
			branchCondition);

	// Closure(W1,v)
	std::set<std::string> closure1 = bvars;
	std::vector<ref<Expr> > expr1Comps = TxPartitionHelper::getExprsFromAndExpr(
			expr1);
	for (std::vector<ref<Expr> >::iterator it = expr1Comps.begin(), ie =
			expr1Comps.end(); it != ie; ++it) {
		std::set<std::string> tmpVars = TxPartitionHelper::getExprVars(*it);
		if (TxPartitionHelper::isShared(closure1, tmpVars)) {
			closure1.insert(tmpVars.begin(), tmpVars.end());
		}
	}

	// Closure(W2,v)
	std::set<std::string> closure2 = bvars;
	std::vector<ref<Expr> > expr2Comps = TxPartitionHelper::getExprsFromAndExpr(
			expr2);
	for (std::vector<ref<Expr> >::iterator it = expr2Comps.begin(), ie =
			expr2Comps.end(); it != ie; ++it) {
		std::set<std::string> tmpVars = TxPartitionHelper::getExprVars(*it);
		if (TxPartitionHelper::isShared(closure2, tmpVars)) {
			closure2.insert(tmpVars.begin(), tmpVars.end());
		}
	}

	std::set<std::string> closure = closure1;
	closure.insert(closure2.begin(), closure2.end());

	// v1, v2
	std::set<std::string> wp1vars = TxPartitionHelper::getExprVars(expr1);
	std::set<std::string> v1 = TxPartitionHelper::diff(wp1vars, closure);
	std::set<std::string> wp2vars = TxPartitionHelper::getExprVars(expr2);
	std::set<std::string> v2 = TxPartitionHelper::diff(wp2vars, closure);

	std::vector<ref<Expr> > expr0Comps;
	// proj(W1, v1)
	for (std::vector<ref<Expr> >::iterator it = expr1Comps.begin(), ie =
			expr1Comps.end(); it != ie; ++it) {
		std::set<std::string> tmpVars = TxPartitionHelper::getExprVars(*it);
		if (TxPartitionHelper::isShared(v1, tmpVars)) {
			expr0Comps.push_back(*it);
		}
	}

	// proj(W2, v2)
	for (std::vector<ref<Expr> >::iterator it = expr2Comps.begin(), ie =
			expr2Comps.end(); it != ie; ++it) {
		std::set<std::string> tmpVars = TxPartitionHelper::getExprVars(*it);
		if (TxPartitionHelper::isShared(v2, tmpVars)) {
			expr0Comps.push_back(*it);
		}
	}

	ref<Expr> expr0 = TxPartitionHelper::createAnd(expr0Comps);
	return expr0;
}

// =========================================================================
// Functions Updating the Subsumption Table Entry
// =========================================================================

/**
 * Use WP to update MIU & PI in markings
 */
TxSubsumptionTableEntry *TxWeakestPreCondition::updateSubsumptionTableEntry(
		TxSubsumptionTableEntry *entry) {

	if (entry->getWPInterpolant() == ConstantExpr::alloc(0, Expr::Bool))
		entry->setWPInterpolant(ConstantExpr::alloc(1, Expr::Bool));

	 // vars(w)
	 std::set<std::string> wpVars;
	 if (!entry->getWPInterpolant().isNull())
	 wpVars = TxPartitionHelper::getExprVars(entry->getWPInterpolant());

	 // get vars(pi, miu)
	 // vars(pi)
	 std::set<std::string> pimiuVars;
	 if (!entry->getInterpolant().isNull())
	 pimiuVars = TxPartitionHelper::getExprVars(entry->getInterpolant());

	 // vars(miu)
	 TxStore::TopInterpolantStore concretelyAddressedStore =
	 entry->getConcretelyAddressedStore();
	 for (TxStore::TopInterpolantStore::iterator
	 it1 = concretelyAddressedStore.begin(),
	 ie1 = concretelyAddressedStore.end();
	 it1 != ie1; ++it1) {
	 if (strcmp(it1->first->getValue()->getName().data(), "") != 0) {
	 pimiuVars.insert(it1->first->getValue()->getName().data());
	 std::set<std::string> right = TxPartitionHelper::getExprVars(
	 it1->second.begin()->second->getExpression());
	 pimiuVars.insert(right.begin(), right.end());
	 }
	 }

	 // add normal names of __shadow__ variables
	 std::set<std::string> pimiuVars2;
	 for (std::set<std::string>::iterator it1 = pimiuVars.begin(),
	 ie1 = pimiuVars.end();
	 it1 != ie1; ++it1) {
	 // keep both normal & __shadow__
	 pimiuVars2.insert((*it1));
	 std::string toErase = "__shadow__";
	 size_t pos = (*it1).find(toErase);
	 if (pos == std::string::npos) {
	 pimiuVars2.insert(*it1);
	 }
	 }

	 // get v1 = vars(pi,miu) - vars(w)
	 std::set<std::string> v1 = TxPartitionHelper::diff(pimiuVars2, wpVars);

	 // closure(pi,miu,v1)
	 std::set<std::string> v1star = v1;
	 // closure on pi
	 std::vector<ref<Expr> > piComps =
	 TxPartitionHelper::getExprsFromAndExpr(entry->getInterpolant());
	 for (std::vector<ref<Expr> >::iterator it = piComps.begin(),
	 ie = piComps.end();
	 it != ie; ++it) {
	 std::set<std::string> tmp = TxPartitionHelper::getExprVars(*it);
	 if (TxPartitionHelper::isShared(tmp, v1star)) {
	 v1star.insert(tmp.begin(), tmp.end());
	 }
	 }

	 // closure on miu
	 for (TxStore::TopInterpolantStore::iterator
	 it1 = concretelyAddressedStore.begin(),
	 ie1 = concretelyAddressedStore.end();
	 it1 != ie1; ++it1) {
	 std::set<std::string> tmp;
	 if (strcmp(it1->first->getValue()->getName().data(), "") == 0) {
	 tmp.insert(it1->first->getValue()->getName().data());
	 std::set<std::string> right = TxPartitionHelper::getExprVars(
	 it1->second.begin()->second->getExpression());
	 tmp.insert(right.begin(), right.end());
	 if (TxPartitionHelper::isShared(tmp, v1star)) {
	 v1star.insert(tmp.begin(), tmp.end());
	 }
	 }
	 }

	 // v2
	 std::set<std::string> v2 = TxPartitionHelper::diff(wpVars, v1star);

	 // update pi by (wp,v2) and (pi,v1star)
	 std::vector<ref<Expr> > wpComps =
	 TxPartitionHelper::getExprsFromAndExpr(entry->getWPInterpolant());

	 std::vector<ref<Expr> > newWPComps;
	 for (std::vector<ref<Expr> >::iterator it = wpComps.begin(),
	 ie = wpComps.end();
	 it != ie; ++it) {
	 std::set<std::string> tmp = TxPartitionHelper::getExprVars(*it);
	 if (TxPartitionHelper::isSubset(tmp, v2)) {
	 newWPComps.push_back(*it);
	 }
	 }

	 std::vector<ref<Expr> > newpiComps;
	 for (std::vector<ref<Expr> >::iterator it = piComps.begin(),
	 ie = piComps.end();
	 it != ie; ++it) {
	 std::set<std::string> tmp = TxPartitionHelper::getExprVars(*it);
	 if (TxPartitionHelper::isShared(tmp, v1star)) {
	 newpiComps.push_back(*it);
	 }
	 }

	 if (!entry->getWPInterpolant().isNull())
	 entry->setWPInterpolant(TxPartitionHelper::createAnd(newWPComps));

	 if (!entry->getInterpolant().isNull())
	 entry->setInterpolant(TxPartitionHelper::createAnd(newpiComps));

	 // update miu by (miu, v1star)
	 std::set<ref<TxAllocationContext> > dels;
	 for (TxStore::TopInterpolantStore::iterator
	 it1 = concretelyAddressedStore.begin(),
	 ie1 = concretelyAddressedStore.end();
	 it1 != ie1; ++it1) {
	 std::set<std::string> tmp;
	 if (strcmp(it1->first->getValue()->getName().data(), "") != 0) {
	 tmp.insert(it1->first->getValue()->getName().data());
	 std::set<std::string> right = TxPartitionHelper::getExprVars(
	 it1->second.begin()->second->getExpression());
	 tmp.insert(right.begin(), right.end());
	 if (!TxPartitionHelper::isShared(tmp, v1star)) {
	 dels.insert(it1->first);
	 }
	 }
	 }
	 for (std::set<ref<TxAllocationContext> >::iterator it = dels.begin(),
	 ie = dels.end();
	 it != ie; ++it) {
	 concretelyAddressedStore.erase((*it));
	 }

	 entry->setConcretelyAddressedStore(concretelyAddressedStore);
	return entry;
}

// =========================================================================
// Updated Version of Weakest PreCondition
// =========================================================================

/**
 * Push up expression to top of the  basic block
 */

std::vector<std::pair<KInstruction *, int> > WPInstructionSeq;
llvm::Instruction *CurrentWPInst;
ref<Expr> TxWeakestPreCondition::PushUp(
		std::vector<std::pair<KInstruction *, int> > reverseInstructionList) {
	WPInstructionSeq = reverseInstructionList;
	for (std::vector<std::pair<KInstruction *, int> >::const_reverse_iterator
			it = reverseInstructionList.rbegin(), ie =
					reverseInstructionList.rend(); it != ie; ++it) {
		llvm::Instruction *i = (*it).first->inst;
		CurrentWPInst = i;
		//llvm::outs()<<"\n the current CurrentWPInst is:";
		//i->dump();
		int flag = (*it).second;
		//llvm::outs()<<"\n the flag value is:"<<flag;
		if (flag == 1) {
			// 1- call getCondition on the cond argument of the branch instruction
			// 2- create and expression from the condition and this->WPExpr
			ref<Expr> result = getBrCondition(i);
			if (result.isNull()) {
				WPExpr = result;
				return WPExpr;
			}
			ref<Expr> cond = result;

			      llvm::outs() << "****** Flag = 1 ******\n";
			      cond->dump();
			      llvm::outs() << "****** End Flag = 1 ******\n";

			if (True() == WPExpr) {
				WPExpr = cond;
			} else {
				if (WPExpr->getWidth() > cond->getWidth())
					cond = ZExtExpr::create(cond, WPExpr->getWidth());
				else if (WPExpr->getWidth() < cond->getWidth())
					WPExpr = ZExtExpr::create(WPExpr, cond->getWidth());

				WPExpr = AndExpr::create(WPExpr, cond);
			}

		} else if (flag == 2) {
			// 1- call getCondition on the cond argument of the branch instruction
			// 2- generate not(condition): expr::not(condition)
			// 3- create and expression from the condition and this->WPExpr
			ref<Expr> result = getBrCondition(i);
			llvm::outs()<<"\nThe result from the flag 2::::::::::::::::::::::::::::\n"<<result;
			llvm::outs()<<"\n\n";
			if (result.isNull()) {
				WPExpr = result;
				return WPExpr;
			}
			ref<Expr> negCond = NotExpr::create(result);
			      llvm::outs() << "****** Flag = 2 ******\n";
			      negCond->dump();
			      llvm::outs() << "****** End Flag = 2 ******\n";

			if (True() == WPExpr) {
				WPExpr = negCond;
			} else {
				if (WPExpr->getWidth() > negCond->getWidth())
					negCond = ZExtExpr::create(negCond, WPExpr->getWidth());
				else if (WPExpr->getWidth() < negCond->getWidth())
					WPExpr = ZExtExpr::create(WPExpr, negCond->getWidth());

				WPExpr = AndExpr::create(WPExpr, negCond);
			}

		} else if (i->getOpcode() == llvm::Instruction::Store) {
			llvm::outs() << "\n****** Flag = 3 *******\n";
			i->dump();
			llvm::outs() << "------\n";
			if (TxWPHelper::isTargetDependent(i->getOperand(1), WPExpr)) {
				llvm::outs() << "****** Flag = 4 *******\n";
				i->dump();
				llvm::outs() << "------\n";
				ref<Expr> left = this->generateExprFromOperand(
						i->getOperand(0));

				llvm::outs() << "----checkpoint--\n";
				ref<Expr> right = this->generateExprFromOperand(
						i->getOperand(1));

				if (left.isNull() || right.isNull()) {
					ref<Expr> result;
					return result;
				}

				WPExpr = TxWPHelper::substituteExpr(WPExpr, right, left);
				        llvm::outs() << "****** Flag = 5 *******\n";
				        WPExpr->dump();
				        llvm::outs() << "------\n";
				WPExpr = Z3Simplification::simplify(WPExpr);
				        WPExpr->dump();
				        llvm::outs() << "******* End Flag = 5 *******\n";
			} else if (isa<llvm::GetElementPtrInst>(i->getOperand(1))) { // Update Array
				llvm::GetElementPtrInst *parentGEP = dyn_cast<
						llvm::GetElementPtrInst>(i->getOperand(1));
				std::pair<ref<Expr>, ref<Expr> > pair = getPointer(parentGEP);
				if (pair.first.isNull()) {
					WPExpr = pair.first;
					return WPExpr;
				}
				if (pair.second.isNull()) {
					WPExpr = pair.second;
					return WPExpr;
				}

				// If WPExpr has connection with array, replace by the UpdateExpr
				ref<Expr> val = this->generateExprFromOperand(i->getOperand(0));
				if (val.isNull())
					return val;
				ref<Expr> update = UpdExpr::create(pair.second, pair.first,
						val);
				        llvm::outs() << "****** Flag = 0 for Update Array *******\n";
				        i->dump();
				        WPExpr->dump();
				WPExpr = TxWPHelper::substituteExpr(WPExpr, pair.second,
						update);
				        WPExpr->dump();
			       llvm::outs() << "****** End Flag = 0 for Update Array*******\n";
			}
		}
	}
	//llvm::outs()<<"\n The expression returned by the PushUp function is<<<<<<<<<<<<<<<<<<<<<<<<"<<WPExpr<<"\n";
	return WPExpr;
}

ref<Expr> TxWeakestPreCondition::getBrCondition(llvm::Instruction *ins) {
	if (!llvm::isa<llvm::BranchInst>(ins)) {
		klee_error(
				"TxWeakestPreCondition::getBrCondition: not a Branch instruction!");
		return True();
	}
	llvm::BranchInst *br = llvm::dyn_cast<llvm::BranchInst>(ins);
	ref<Expr> result = getCondition(br->getCondition());
	return result;
}

ref<Expr> TxWeakestPreCondition::generateExprFromOperand(llvm::Value *val,
		ref<Expr> offset) {
	ref<Expr> ret;
	llvm::outs()<<"Cp1\n";
	//    klee_warning("TxWeakestPreCondition::generateExprFromOperand0");
	//    val->dump();
	//    klee_warning("TxWeakestPreCondition::generateExprFromOperand1");
	if (isa<llvm::ConstantInt>(val)) {
		llvm::outs()<<"Cp2\n";
		llvm::ConstantInt *constInt = dyn_cast<llvm::ConstantInt>(val);
		ret = getConstantInt(constInt);
	} else if (isa<llvm::ConstantFP>(val)) {
		llvm::outs()<<"Cp3\n";
		llvm::ConstantFP *constFP = dyn_cast<llvm::ConstantFP>(val);
		ret = getConstantFP(constFP);
	} else if (isa<llvm::GlobalValue>(val)) {
		llvm::outs()<<"Cp4\n";
		llvm::GlobalValue *gv = dyn_cast<llvm::GlobalValue>(val);
		ret = getGlobalValue(gv);
	} else if (isa<llvm::ConstantExpr>(val)) {
		llvm::outs()<<"Cp5\n";
		llvm::ConstantExpr *constantExpr = dyn_cast<llvm::ConstantExpr>(val);
		ret = getConstantExpr(constantExpr);
	} else if (isa<llvm::LoadInst>(val)) {
		llvm::outs()<<"Cp6\n";
		llvm::LoadInst *inst = dyn_cast<llvm::LoadInst>(val);
		if (isa<llvm::ConstantExpr>(inst->getOperand(0))) {
			llvm::outs()<<"Cp6-1\n";
			llvm::ConstantExpr *ce = dyn_cast<llvm::ConstantExpr>(
					inst->getOperand(0));
			ret = getConstantExpr(ce);
			//      ret = getLoadGep(inst);
		} else if (isa<llvm::GetElementPtrInst>(inst->getOperand(0))) {
			llvm::outs()<<"Cp6-2\n";
			llvm::GetElementPtrInst *parentGEP = dyn_cast<
					llvm::GetElementPtrInst>(inst->getOperand(0));
			llvm::outs()<<"Cp6-21\n";
			inst->dump();
			inst->getOperand(0)->dump();
			parentGEP->dump();
			std::pair<ref<Expr>, ref<Expr> > pair = getPointer(parentGEP);
			llvm::outs()<<"Cp6-22\n";
			if (!pair.first.isNull())
				{llvm::outs()<<"Cp6-221\n";
				ret = SelExpr::create(pair.second, pair.first);}
			else{
				llvm::outs()<<"Cp6-222\n";
				ret = pair.first;}
		} else {
			ret = getLoad(inst);
		}
	} else if (isa<llvm::BinaryOperator>(val)) {
		llvm::outs()<<"Cp7\n";
		llvm::BinaryOperator *bo = dyn_cast<llvm::BinaryOperator>(val);
		ret = getBinaryInst(bo);
	} else if (isa<llvm::CastInst>(val)) {
		llvm::outs()<<"Cp8\n";
		llvm::CastInst *ci = dyn_cast<llvm::CastInst>(val);
		ret = getCastInst(ci);
	} else if (isa<llvm::CallInst>(val)) {
		llvm::outs()<<"Cp9\n";
		llvm::CallInst *ci = dyn_cast<llvm::CallInst>(val);
		ret = getCallInst(ci);
	} else if (llvm::isa<llvm::CmpInst>(val)) {
		llvm::outs()<<"Cp10\n";
		llvm::CmpInst *cmp = dyn_cast<llvm::CmpInst>(val);
		ret = getCmpCondition(cmp);
	} else if (llvm::isa<llvm::GlobalVariable>(val)) {
		llvm::outs()<<"Cp11\n";
		klee_error("not implemented yet!");
	} else if (llvm::isa<llvm::Argument>(val)) {
		llvm::outs()<<"Cp12\n";
		llvm::Argument *arg = dyn_cast<llvm::Argument>(val);
		llvm::outs()<<"the value passed\n";
				val->dump();
		llvm::outs()<<"the argument passed\n";
		arg->dump();
		ret = getFunctionArgument(arg);
	} else if (llvm::isa<llvm::PHINode>(val)) {
		llvm::outs()<<"Cp13\n";
		llvm::PHINode *phi = dyn_cast<llvm::PHINode>(val);
		ret = getPhiInst(phi);
	} else if (llvm::isa<llvm::AllocaInst>(val)) {
		llvm::outs()<<"Cp14\n";
		llvm::AllocaInst *alc = dyn_cast<llvm::AllocaInst>(val);
		ret = getAllocaInst(alc);
	} else if (isa<llvm::GetElementPtrInst>(val)) {
		llvm::outs()<<"Cp15\n";
		llvm::GetElementPtrInst *gep = dyn_cast<llvm::GetElementPtrInst>(val);
		ret = getGepInst(gep);
	} else if (isa<llvm::Constant>(val)) {
		llvm::outs()<<"Cp16\n";
		if (isa<llvm::ConstantPointerNull>(val)) {
			return Expr::createPointer(0);
		} else {
			llvm::errs() << "Value:";
			val->dump();
			llvm::errs() << "\nType:";
			val->getType()->dump();
			klee_error(
					"\nTxWeakestPreCondition::generateExprFromOperand, This constant"
							" case not implemented yet\n");
		}
	} else {
		llvm::outs()<<"Cp17\n";
		llvm::errs() << "Value:";
		val->dump();
		llvm::errs() << "\nType:";
		val->getType()->dump();
		klee_error("\nTxWeakestPreCondition::generateExprFromOperand Remaining"
				" cases not implemented yet\n");
	}
	//    klee_warning("TxWeakestPreCondition::generateExprFromOperand2");
	//    if(!ret.isNull())
	//           ret->dump();
	//    klee_warning("TxWeakestPreCondition::generateExprFromOperand3\n\n");
	return ret;
}

ref<Expr> TxWeakestPreCondition::getCondition(llvm::Value *value) {
	ref<Expr> result;
	if (llvm::isa<llvm::CmpInst>(value)) {
		llvm::CmpInst *cmp = dyn_cast<llvm::CmpInst>(value);
		result = getCmpCondition(cmp);
		if (result.isNull())
			;
		return result;
	} else if (llvm::isa<llvm::BinaryOperator>(value)) {
		llvm::Instruction *binOp = dyn_cast<llvm::Instruction>(value);
		ref<Expr> left = this->generateExprFromOperand(binOp->getOperand(0));
		ref<Expr> right = this->generateExprFromOperand(binOp->getOperand(1));
		if (left.isNull() || right.isNull())
			return result;
		if (left->getWidth() > right->getWidth())
			right = ZExtExpr::create(right, left->getWidth());
		else if (left->getWidth() < right->getWidth())
			left = ZExtExpr::create(left, right->getWidth());
		switch (binOp->getOpcode()) {
		case llvm::Instruction::And: {
			result = AndExpr::create(left, right);
			break;
		}
		case llvm::Instruction::Or: {
			result = OrExpr::create(left, right);
			break;
		}
		case llvm::Instruction::Xor: {
			result = XorExpr::create(left, right);
			break;
		}
		default: {
			binOp->dump();
			klee_error(
					"TxWeakestPreCondition::getCondition: Binary operator is not "
							"implemented yet!");
		}
		}
	} else if (llvm::isa<llvm::PHINode>(value)) {
		llvm::PHINode *phi = dyn_cast<llvm::PHINode>(value);
		result = getPhiInst(phi);
		if (result.isNull())
			return result;
	} else {
		value->dump();
		klee_error("TxWeakestPreCondition::getCondition: value is not "
				"implemented yet!");
	}
	return result;
}

ref<Expr> TxWeakestPreCondition::getConstantInt(llvm::ConstantInt *CI) {
	ref<Expr> result;
	if (CI->getBitWidth() <= 8)
		result = ConstantExpr::create(CI->getZExtValue(), Expr::Int8);
	else if (CI->getBitWidth() <= 16)
		result = ConstantExpr::create(CI->getZExtValue(), Expr::Int16);
	else if (CI->getBitWidth() <= 32)
		result = ConstantExpr::create(CI->getZExtValue(), Expr::Int32);
	else
		result = ConstantExpr::create(CI->getZExtValue(), Expr::Int64);
	return result;
}

ref<Expr> TxWeakestPreCondition::getConstantFP(llvm::ConstantFP *CI) {
	ref<Expr> result;
	klee_warning("Silently skipping WP (reason: Constant Floating Point): "
			"TxWeakestPreCondition::getConstantFP");
	return result;
}

ref<Expr> TxWeakestPreCondition::getConstantExpr(llvm::ConstantExpr *ce) {
	ref<Expr> result;
	// klee_warning("PUSHUP1");
	//return result;

	switch (ce->getOpcode()) {
	case llvm::Instruction::GetElementPtr: {
		// generate index expression
		ref<Expr> idx = generateExprFromOperand(ce->getOperand(2));
		if (idx.isNull())
			return idx;
		unsigned width = idx->getWidth();
		unsigned dimension = ce->getNumOperands() - 2;
		llvm::ArrayType *at =
				dyn_cast<llvm::ArrayType>(
						dyn_cast<llvm::PointerType>(
								ce->getOperand(0)->getType())->getElementType());
		for (unsigned i = 0; i < dimension - 1; i++) {
			at = dyn_cast<llvm::ArrayType>(at->getElementType());
			ref<Expr> tmp1 = ConstantExpr::create(at->getNumElements(), width);
			ref<Expr> tmp2 = generateExprFromOperand(ce->getOperand(3 + i));
			if (tmp2.isNull())
				return tmp2;
			idx = AddExpr::create(MulExpr::create(tmp1, idx), tmp2);
		}

		// generate array expression
		ref<Expr> arr = generateExprFromOperand(ce->getOperand(0));
		if (arr.isNull())
			return arr;
		result = SelExpr::create(arr, idx);
		//    result->dump();
		break;
	}
	default: {
		klee_warning(
				"TxWeakestPreCondition::getConstantExpr: ConstantExpr is not support");
		ce->dump();
	}
	}

	return result;
}

ref<Expr> TxWeakestPreCondition::getGlobalValue(llvm::GlobalValue *gv) {
	unsigned width;
	ref<Expr> index, result;
	width = getGlobalVariabletSize(gv);
	index = ConstantExpr::create(0, width);
	result = WPVarExpr::create(gv, gv->getName(), index);
	return result;
}
//-----------------------------
ref<Expr> TxWeakestPreCondition::getFunctionArgument(llvm::Argument *arg) {
	unsigned width;
	ref<Expr> index, result, finalExpr;
	width = getFunctionArgumentSize(arg);
	index = ConstantExpr::create(0, width);
	result = WPVarExpr::create(arg, arg->getName(), index);
	int flg_gt = 0;
	llvm::Instruction *RegInst;
	for (std::vector<std::pair<KInstruction *, int> >::const_reverse_iterator
			it = WPInstructionSeq.rbegin(), ie = WPInstructionSeq.rend();
			it != ie; ++it) {
		llvm::Instruction *i = (*it).first->inst;
		if (i == CurrentWPInst) {
			flg_gt = 1;
		}
		if (flg_gt == 1 and i->getOpcodeName() == "call") {
			RegInst = i;
			break;
		}
	}
	CallInst* call_inst = dyn_cast<CallInst>(RegInst);
	 Function* fn = call_inst->getCalledFunction();
	 int whicharg=-1;
	 for(llvm::Function::arg_iterator arg1 = fn->arg_begin(); arg1 != fn->arg_end(); ++arg1) {
		 whicharg++;
		 if (arg->getName().compare(arg1->getName())==0)
		 {break;}
	 }
	if (CallInst *call = dyn_cast<CallInst>(RegInst)) {
		llvm::outs()<<"If there any help----------------------------";
		call->getArgOperand(whicharg)->dump();
		finalExpr = this->generateExprFromOperand(call->getArgOperand(whicharg));
	}
	return finalExpr;
}


std::pair<ref<Expr>, ref<Expr> > TxWeakestPreCondition::getPointer(
		llvm::GetElementPtrInst *gep) {
	std::pair<ref<Expr>, ref<Expr> > pair;
	// klee_warning("PUSHUP3");
	//return pair;
	if (isa<llvm::GetElementPtrInst>(gep->getOperand(0))) {
		llvm::GetElementPtrInst *parentGEP = dyn_cast<llvm::GetElementPtrInst>(
				gep->getOperand(0));
		std::pair<ref<Expr>, ref<Expr> > parentPair = getPointer(parentGEP);
		ref<Expr> offset = this->generateExprFromOperand(gep->getOperand(2));
		if (offset.isNull())
			return pair;
		unsigned width = getGepSize(gep->getType());
		llvm::PointerType *pt = dyn_cast<llvm::PointerType>(
				gep->getOperand(0)->getType());
		llvm::ArrayType *at = dyn_cast<llvm::ArrayType>(pt->getElementType());
		ref<Expr> size = ConstantExpr::create(at->getNumElements(), width);
		pair.first = AddExpr::create(
				MulExpr::create(parentPair.first->getKid(0), size),
				offset->getKid(0));
		ref<Expr> kids[1];
		kids[0] = pair.first;
		pair.first = offset->rebuild(kids);
		pair.second = parentPair.second;
	} else {
		bool isFirstZero = false;
		if (llvm::ConstantInt *c = dyn_cast<llvm::ConstantInt>(
				gep->getOperand(1))) {
			if (c->getZExtValue() == 0) {
				isFirstZero = true;
			}
		}
		unsigned opsNo = gep->getNumOperands();
		if (opsNo == 2) {
			pair.first = this->generateExprFromOperand(gep->getOperand(1));
			pair.second = this->generateExprFromOperand(gep->getOperand(0));
		} else if (opsNo > 2) {
			if (isFirstZero) {
				pair.first = this->generateExprFromOperand(gep->getOperand(2));
				pair.second = this->generateExprFromOperand(gep->getOperand(0));
			} else {
				pair.first = this->generateExprFromOperand(gep->getOperand(1));
				pair.second = this->generateExprFromOperand(gep->getOperand(0));
			}
		}
	}
	return pair;
}

ref<Expr> TxWeakestPreCondition::getLoadGep(llvm::LoadInst *p) {
	ref<Expr> result;
	 klee_warning("PUSHUP4");
	return result;
}

ref<Expr> TxWeakestPreCondition::getLoad(llvm::LoadInst *p) {
	unsigned width;
	ref<Expr> index, result;
//	llvm::outs()<<"Passed Instruction is:\n";
//	p->dump();
//	p->getOperand(0)->dump();
//	llvm::AllocaInst *p1=dyn_cast<AllocaInst>(p->getOperand(0));
//
//	p1->dump();
//	//p1->getAllocatedType()->dump();
//	llvm::outs()<<"::::::::::::::::::::::::::: "<<p1->getName()<<"\n";
//	llvm::outs()<<"::::::::::::::::::::::::::: "<<p1->getName()<<"\n";
//	if(p1->getName().empty()){
//	p1->setName("some");}
//
//	llvm::outs()<<"::::::::::::::::::::::::::: "<<p1->getName()<<"\n";

	if (isa<llvm::AllocaInst>(p->getOperand(0))) {
		llvm::AllocaInst *alc = dyn_cast<llvm::AllocaInst>(p->getOperand(0));
		if(alc->getName().empty()){
			alc->setName("TX_named_var");}
		width = getAllocaInstSize(alc);
		index = ConstantExpr::create(0, width);
		result = WPVarExpr::create(p->getOperand(0),
				p->getOperand(0)->getName(), index);


	} else if (isa<llvm::GlobalValue>(p->getOperand(0))) {
		llvm::GlobalValue *gv = dyn_cast<llvm::GlobalValue>(p->getOperand(0));
		if(gv->getName().empty()){
					gv->setName("TX_named_var");}
		width = getGlobalVariabletSize(gv);
		index = ConstantExpr::create(0, width);
		result = WPVarExpr::create(p->getOperand(0),
				p->getOperand(0)->getName(), index);

	} else {
		p->getOperand(0)->dump();
		klee_warning("TxWeakestPreCondition::getLoad: Not implemented yet!");
	}

	return result;

}

ref<Expr> TxWeakestPreCondition::getAllocaInst(llvm::AllocaInst *alc) {
	unsigned width;
	ref<Expr> index, result;
	if(alc->getName().empty()){
				alc->setName("TX_named_var");}
	width = getAllocaInstSize(alc);
	index = ConstantExpr::create(0, width);
	result = WPVarExpr::create(alc, alc->getName(), index);
	return result;
}

ref<Expr> TxWeakestPreCondition::getBinaryInst(llvm::BinaryOperator *bo) {
	ref<Expr> ret;
	ref<Expr> arg1 = generateExprFromOperand(bo->getOperand(0));
	ref<Expr> arg2 = generateExprFromOperand(bo->getOperand(1));
	if (arg1.isNull() || arg2.isNull())
		;
	//return ret;
	if (arg1->getWidth() > arg2->getWidth())
		arg2 = ZExtExpr::create(arg2, arg1->getWidth());
	else if (arg1->getWidth() < arg2->getWidth())
		arg1 = ZExtExpr::create(arg1, arg2->getWidth());

	switch (bo->getOpcode()) {
	case llvm::Instruction::Add: {
		ret = AddExpr::create(arg1, arg2);
		break;
	}
	case llvm::Instruction::Sub: {
		ret = SubExpr::create(arg1, arg2);
		break;
	}
	case llvm::Instruction::Mul: {
		ret = MulExpr::create(arg1, arg2);
		break;
	}
	case llvm::Instruction::UDiv: {
		ret = UDivExpr::create(arg1, arg2);
		break;
	}
	case llvm::Instruction::SDiv: {
		ret = SDivExpr::create(arg1, arg2);
		break;
	}
	case llvm::Instruction::URem: {
		ret = URemExpr::create(arg1, arg2);
		break;
	}
	case llvm::Instruction::SRem: {
		ret = SRemExpr::create(arg1, arg2);
		break;
	}
	case llvm::Instruction::And: {
		ret = AndExpr::create(arg1, arg2);
		break;
	}
	case llvm::Instruction::Or: {
		ret = OrExpr::create(arg1, arg2);
		break;
	}
	case llvm::Instruction::Xor: {
		ret = XorExpr::create(arg1, arg2);
		break;
	}
	case llvm::Instruction::Shl: {
		ret = ShlExpr::create(arg1, arg2);
		break;
	}
	case llvm::Instruction::LShr: {
		ret = LShrExpr::create(arg1, arg2);
		break;
	}
	case llvm::Instruction::AShr: {
		ret = AShrExpr::create(arg1, arg2);
		break;
	}
	default: {
		klee_error("TxWeakestPreCondition::getBinaryInst Binary Operand "
				"not implemented...\n");
	}
	}
	return ret;
}

ref<Expr> TxWeakestPreCondition::getCastInst(llvm::CastInst *ci) {
	ref<Expr> result;
	ref<Expr> arg1 = generateExprFromOperand(ci->getOperand(0));
	if (arg1.isNull())
		return result;

	Expr::Width width = Expr::InvalidWidth;
	if (ci->getDestTy()->isEmptyTy())
		width = Expr::InvalidWidth;
	else if (ci->getDestTy()->isIntegerTy(1))
		width = Expr::Bool;
	else if (ci->getDestTy()->isIntegerTy(8))
		width = Expr::Int8;
	else if (ci->getDestTy()->isIntegerTy(16))
		width = Expr::Int16;
	else if (ci->getDestTy()->isIntegerTy(32))
		width = Expr::Int32;
	else if (ci->getDestTy()->isIntegerTy(64))
		width = Expr::Int64;
	else if (ci->getDestTy()->isDoubleTy())
		width = Expr::Fl80;
	else {
		ci->getDestTy()->dump();
		klee_warning(
				"TxWeakestPreCondition::getCastInst size not supported yet!");
		return result;
	}

	switch (ci->getOpcode()) {
	case llvm::Instruction::SExt: {
		result = SExtExpr::create(arg1, width);
		break;
	}
	case llvm::Instruction::ZExt: {
		result = ZExtExpr::create(arg1, width);
		break;
	}
	case llvm::Instruction::Trunc: {
		result = ExtractExpr::create(arg1, 0, width);
		break;
	}
	case llvm::Instruction::SIToFP:
	case llvm::Instruction::UIToFP: {
		// ci->dump();
		klee_warning("Silently skipping WP (reason: SIToFP or UIToFP "
				"instructions): "
				"TxWeakestPreCondition::generateExprFromOperand\n");
		return result;
	}
	case llvm::Instruction::AddrSpaceCast:
	case llvm::Instruction::BitCast:
	case llvm::Instruction::FPExt:
	case llvm::Instruction::FPToSI:
	case llvm::Instruction::FPToUI:
	case llvm::Instruction::FPTrunc:
	case llvm::Instruction::IntToPtr:
	case llvm::Instruction::PtrToInt:
	default: {
		ci->dump();
		klee_warning(
				"TxWeakestPreCondition::generateExprFromOperand Unary Operand "
						"not implemented...\n");
		return result;
	}
	}
	return result;
}

ref<Expr> TxWeakestPreCondition::getCmpCondition(llvm::CmpInst *cmp) {
	// Getting the expressions from the left and right operand
	ref<Expr> result;
	ref<Expr> left = this->generateExprFromOperand(cmp->getOperand(0));
	ref<Expr> right = this->generateExprFromOperand(cmp->getOperand(1));
	if (left.isNull() || right.isNull())
		return result;

	if (left->getWidth() > right->getWidth())
		right = ZExtExpr::create(right, left->getWidth());
	else if (left->getWidth() < right->getWidth())
		left = ZExtExpr::create(left, right->getWidth());

	// second step is to create the expression
	switch (cmp->getPredicate()) {
	case llvm::CmpInst::ICMP_EQ:
		result = EqExpr::create(left, right);
		break;
	case llvm::CmpInst::ICMP_NE:
		result = NeExpr::create(left, right);
		break;
	case llvm::CmpInst::ICMP_UGT:
		result = UgtExpr::create(left, right);
		break;
	case llvm::CmpInst::ICMP_UGE:
		result = UgeExpr::create(left, right);
		break;
	case llvm::CmpInst::ICMP_ULT:
		result = UltExpr::create(left, right);
		break;
	case llvm::CmpInst::ICMP_ULE:
		result = UleExpr::create(left, right);
		break;
	case llvm::CmpInst::ICMP_SGT:
		result = SgtExpr::create(left, right);
		break;
	case llvm::CmpInst::ICMP_SGE:
		result = SgeExpr::create(left, right);
		break;
	case llvm::CmpInst::ICMP_SLT:
		result = SltExpr::create(left, right);
		break;
	case llvm::CmpInst::ICMP_SLE:
		result = SleExpr::create(left, right);
		break;
	case llvm::CmpInst::FCMP_FALSE:
		klee_error("FCMP_FALSE not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_OEQ:
		klee_error("FCMP_OEQ not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_OGT:
		klee_error("FCMP_OGT not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_OGE:
		klee_error("FCMP_OGE not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_OLT:
		klee_error("FCMP_OLT not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_OLE:
		klee_error("FCMP_OLE not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_ONE:
		klee_error("FCMP_ONE not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_ORD:
		klee_error("FCMP_ORD not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_UNO:
		klee_error("FCMP_UNO not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_UEQ:
		klee_error("FCMP_UEQ not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_UGT:
		klee_error("FCMP_UGT not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_UGE:
		klee_error("FCMP_UGE not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_ULT:
		klee_error("FCMP_ULT not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_ULE:
		klee_error("FCMP_ULE not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_UNE:
		klee_error("FCMP_UNE not implemented yet!");
		break;
	case llvm::CmpInst::FCMP_TRUE:
		klee_error("FCMP_TRUE not implemented yet!");
		break;
	case llvm::CmpInst::BAD_FCMP_PREDICATE:
		klee_error("BAD_FCMP_PREDICATE not implemented yet!");
		break;
	case llvm::CmpInst::BAD_ICMP_PREDICATE:
		klee_error("BAD_ICMP_PREDICATE not implemented yet!");
		break;
	}
	return result;
}

ref<Expr> TxWeakestPreCondition::getGepInst(llvm::GetElementPtrInst *gep) {
	ref<Expr> result;
	/*
	 gep->dump();
	 if (gep->getNumOperands() == 2){
	 gep->getOperand(0)->dump();
	 gep->getOperand(1)->dump();
	 ref<Expr> offset = this->generateExprFromOperand(gep->getOperand(1));
	 offset->dump();
	 result = this->generateExprFromOperand(gep->getOperand(0));


	 }*/
	// klee_warning("PUSHUP5");
	return result;
}

ref<Expr> TxWeakestPreCondition::getSwitchInst(llvm::SwitchInst *si) {
	ref<Expr> result;
	// klee_warning("PUSHUP6");
	return result;
}

ref<Expr> TxWeakestPreCondition::getPhiInst(llvm::PHINode *phi) {
#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 0)
	llvm::Value *inputArg = phi->getOperand(node->phiNodeArg[phi]);
#else
	llvm::Value *inputArg = phi->getOperand(node->phiNodeArg[phi] * 2);
#endif
	ref<Expr> result = this->generateExprFromOperand(inputArg);
	return result;
}

ref<Expr> TxWeakestPreCondition::getCallInst(llvm::CallInst *ci) {
	llvm::Function *function = ci->getCalledFunction();
	// TODO: This loop can further be optimized if we had access to the
	// iterator pointing to the call instruction. That way, we could
	// find the respective return instruction much faster. The iterator
	// can be accessed from the pushup function. We leave this optimization
	// as future work.
	llvm::Instruction *ret = 0;
	for (std::vector<std::pair<KInstruction *, int> >::reverse_iterator it =
			this->node->reverseInstructionList.rbegin(), ie =
			this->node->reverseInstructionList.rend(); it != ie; ++it) {
		if (isa<llvm::ReturnInst>(it->first->inst)
				&& inFunction(it->first->inst, function)) {
			ret = it->first->inst;
		}
	}
	assert(ret && "Return instruction is null!");
	ref<Expr> result = this->generateExprFromOperand(ret->getOperand(0));
	return result;
}

bool TxWeakestPreCondition::inFunction(llvm::Instruction *ins,
		llvm::Function *function) {
	bool result = false;
	for (llvm::Function::iterator bbit = function->begin(), bbie =
			function->end(); bbit != bbie; ++bbit) {
		for (llvm::BasicBlock::iterator it = bbit->begin(), ie = bbit->end();
				it != ie; ++it) {
			if (ins == it)
				return true;
		}
	}
	return result;
}

ref<Expr> TxWeakestPreCondition::getCallAssume(llvm::CallInst *ci) {
	ref<Expr> result;
	// klee_warning("PUSHUP8");
	return result;
}

unsigned int TxWeakestPreCondition::getAllocaInstSize(llvm::AllocaInst *alc) {
	unsigned int size;

	if (alc->getAllocatedType()->isIntegerTy(1)) {
		size = Expr::Bool;
	} else if (alc->getAllocatedType()->isIntegerTy(8)) {
		size = Expr::Int8;
	} else if (alc->getAllocatedType()->isIntegerTy(16)) {
		size = Expr::Int16;
	} else if (alc->getAllocatedType()->isIntegerTy(32)) {
		size = Expr::Int32;
	} else if (alc->getAllocatedType()->isIntegerTy(64)) {
		size = Expr::Int64;
	} else {
		size = Expr::Int32;
		//    llvm::errs() << "Size = " <<
		// dependency->getTargetData()->getTypeStoreSize(alc->getType()->getElementType())
		// << "\n";

		//    klee_error("TxWeakestPreCondition::getAllocaInstSize getting size is
		// not "
		//               "defined for this type yet");
	}
	return size;
}

unsigned int TxWeakestPreCondition::getGlobalVariabletSize(
		llvm::GlobalValue *gv) {
	unsigned int size;

	if (gv->getType()->getElementType()->isIntegerTy(1)) {
		size = Expr::Int8;
	} else if (gv->getType()->getElementType()->isIntegerTy(8)) {
		size = Expr::Int8;
	} else if (gv->getType()->getElementType()->isIntegerTy(16)) {
		size = Expr::Int16;
	} else if (gv->getType()->getElementType()->isIntegerTy(32)) {
		size = Expr::Int32;
	} else if (gv->getType()->getElementType()->isPointerTy()) {
		size = Expr::Int32;
	} else if (gv->getType()->getElementType()->isArrayTy()) {
		size = Expr::Int32;
	} else if (gv->getType()->isIntegerTy(1)) {
		size = Expr::Bool;
	} else if (gv->getType()->isIntegerTy(8)) {
		size = Expr::Int8;
	} else if (gv->getType()->isIntegerTy(16)) {
		size = Expr::Int16;
	} else if (gv->getType()->isIntegerTy(32)) {
		size = Expr::Int32;
	} else if (gv->getType()->isPointerTy()) {
		size = Expr::Int32;
	} else if (gv->getType()->isArrayTy()) {
		size = Expr::Int32;
	} else {
		gv->dump();
		gv->getType()->dump();
		gv->getType()->getElementType()->dump();
		klee_error(
				"TxWeakestPreCondition::getGlobalVariabletSize getting size is not "
						"defined for this type yet");
	}
	return size;
}

unsigned int TxWeakestPreCondition::getFunctionArgumentSize(
		llvm::Argument *arg) {
	unsigned int size;
	if (arg->getType()->isIntegerTy(1)) {
		size = Expr::Bool;
	} else if (arg->getType()->isIntegerTy(8)) {
		size = Expr::Int8;
	} else if (arg->getType()->isIntegerTy(16)) {
		size = Expr::Int16;
	} else if (arg->getType()->isIntegerTy(32)) {
		size = Expr::Int32;
	} else if (arg->getType()->isPointerTy()) {
		size = Expr::Int32;
	} else {
		arg->dump();
		arg->getType()->dump();
		klee_error(
				"TxWeakestPreCondition::getGlobalVariabletSize getting size is not "
						"defined for this type yet");
	}
	return size;
}

unsigned int TxWeakestPreCondition::getGepSize(llvm::Type *ty) {
	unsigned int size;

	if (ty->isIntegerTy(1)) {
		size = Expr::Bool;
	} else if (ty->isIntegerTy(8)) {
		size = Expr::Int8;
	} else if (ty->isIntegerTy(16)) {
		size = Expr::Int16;
	} else if (ty->isIntegerTy(32)) {
		size = Expr::Int32;
	} else if (ty->isPointerTy()) {
		size = getGepSize(ty->getPointerElementType());
	} else {
		ty->dump();
		klee_error(
				"TxWeakestPreCondition::getGlobalVariabletSize getting size is not "
						"defined for this type yet");
	}
	return size;
}




//ref<Expr> TxWeakestPreCondition::getFunctionArgument(llvm::Argument *arg) {
//	unsigned width;
//	ref<Expr> index, result, finalExpr;
//	// klee_warning("PUSHUP2");
//	//return result;
//	width = getFunctionArgumentSize(arg);
//	index = ConstantExpr::create(0, width);
//	result = WPVarExpr::create(arg, arg->getName(), index);
//	//llvm::outs()<<"----Here in function the getFunctionArgument is:"<<arg->getName()<<"\n";
//
//	int flg_gt = 0;
//	llvm::Instruction *RegInst;
//	for (std::vector<std::pair<KInstruction *, int> >::const_reverse_iterator
//			it = WPInstructionSeq.rbegin(), ie = WPInstructionSeq.rend();
//			it != ie; ++it) {
//		llvm::Instruction *i = (*it).first->inst;
//		if (i == CurrentWPInst) {
//			flg_gt = 1;
//		}
//		if (flg_gt == 1 and i->getOpcodeName() == "call") {
//			//llvm::outs()<<"Argument----------------------------------";
//			//i->dump();
//			RegInst = i;
//			//llvm::outs()<<"RegInst----------------------------------";
//			//RegInst->dump();
//			break;
//		}
//	}
//
//	CallInst* call_inst = dyn_cast<CallInst>(RegInst);
//	call_inst->getCalledFunction()->dump();
//	 Value *val11 = call_inst->getArgOperand(0);
//	 val11->dump();
//
//	 Function* fn = call_inst->getCalledFunction();
//	 llvm::outs()<<fn->getName();
//	 int whicharg=-1;
//	 for(llvm::Function::arg_iterator arg1 = fn->arg_begin(); arg1 != fn->arg_end(); ++arg1) {
//		 whicharg++;
//		// if(ConstantInt* ci = dyn_cast<ConstantInt>(arg1))
//		 //llvm::outs()<<*arg1<< "checking values2\n";
//		 //llvm::outs()<<"----Here in function the getFunctionArgument we are getting is:"<<arg1->getName()<<"\n";
//		 if (arg->getName().compare(arg1->getName())==0)
//		 {
//			 llvm::outs()<<"Yes equal";
//			 break;
//		 }
//	 }
//llvm::outs()<<"\nwhich arg value::::::::::::::::"<<whicharg;
//	//call_inst->getCalledFunction()->dump();
//	if (CallInst *call = dyn_cast<CallInst>(RegInst)) {
//		llvm::outs()<<"call->getArgOperand(0)-------------\n";
//		arg->dump();
//		call->dump();
//		//call->getCalledFunction()->dump();
//		llvm::outs()<<"\nGet called function argument list:";
//	//call->getCalledFunction()->OperandList->Val;
//		llvm::outs()<<call->getNumArgOperands()<<" Number of operands\n";
//		for (int pi=0;pi<call->getNumArgOperands();pi++){
//			llvm::outs()<<"\nThe pi value is:"<<pi;
//			call->getArgOperand(pi)->dump();
//		}
//
//		call->getArgOperand(whicharg)->dump();
//		finalExpr = this->generateExprFromOperand(call->getArgOperand(whicharg));
//		//llvm::outs()<<"Final Expr----------------------------------\n";
//		finalExpr->dump();
//	}
//	return finalExpr;
//}


//for(llvm::Function::arg_iterator arg1 = fn->arg_begin(); arg1 != fn->arg_end(); ++arg1) {
//		 if(ConstantInt* ci = dyn_cast<ConstantInt>(arg1))
//		 //    	    errs() << ci->getValue() << "\n";
//		 //    	  errs() << *arg << "\n";
//	   //if(auto* ci = dyn_cast<ConstantInt>(arg1))
//			 llvm::outs()<<ci->getValue() << "checking values\n";
//		 llvm::outs()<<*arg1 << "checking values2\n";
//	     //errs() << ci->getValue() << "\n";
//	   //errs() << *arg1 << "\n";
//	 }
//
//	//call_inst->getCalledFunction()->dump();
//	if (CallInst *call = dyn_cast<CallInst>(RegInst)) {
//		llvm::outs()<<"call->getArgOperand(0)-------------\n";
//		arg->dump();
//		call->dump();
//		//call->getCalledFunction()->dump();
//		llvm::outs()<<"\nGet called function argument list:";
//	//call->getCalledFunction()->OperandList->Val;
//		llvm::outs()<<call->getNumArgOperands()<<" Number of operands\n";
//		for (int pi=0;pi<call->getNumArgOperands();pi++){
//			llvm::outs()<<"\nThe pi value is:"<<pi;
//			call->getArgOperand(pi)->dump();
//		}
//
//		call->getArgOperand(1)->dump();
//		finalExpr = this->generateExprFromOperand(call->getArgOperand(1));
//		llvm::outs()<<"Final Expr----------------------------------\n";
//		finalExpr->dump();
//	}
//	return finalExpr;
//-------------------------------
//llvm::outs()<<"The current instruction is:"<<CurrentWPInst->getOpcodeName()<<"\n";

// WPInstructionSeq = reverseInstructionList;
//llvm::outs() << "------ Sanghu: "<< CurrentWPInst->getParent()->getParent()->getName() <<"\n";
// llvm::outs()<<RegInst<<"cheking correct inst\n";
// RegInst->dump();
//Function* fn = call->getCalledFunction();
//llvm::outs()<<call->getArgOperand(0)->getValueName()->getValue();
//llvm::outs()<<"Arpi";
//call->getArgOperand(0)->dump();

//    	llvm::outs()<<finalExpr;
//    	llvm::outs()<<call->getNumArgOperands()<<"nis\n";
//    	//llvm::outs()<<call->getOperand(0)->HasValueHandle<<"arpi\n";
//    	StringRef fn_name = fn->getName();
//    	llvm::outs()<<fn_name<<" fun name\n";
//    	llvm::outs()<<fn->arg_size()<<" fun size\n";
//fn->arg
//llvm::outs()<<fn->getArgumentList();
//for(llvm::Function::arg_iterator arg1 = fn->arg_begin(); arg1 != fn->arg_end(); ++arg1) {

//llvm::outs()<<arg1->getParent()->getEntryBlock()<<"\n";

//llvm::outs()<<call->getCalledValue()->getName()<<"\n";

//llvm::outs()<<arg1->getName()<<"\n";
//ref<Expr> finalExpr = this->generateExprFromOperand(arg1);
//llvm::outs()<<"final expr"<<finalExpr<<"\n";
//finalExpr->dump();
//    	  if(ConstantInt* ci = dyn_cast<ConstantInt>(arg1))
//    	    errs() << ci->getValue() << "\n";
//    	  errs() << *arg << "\n";
//	}

//                   Value *val11 = call->getArgOperand(0);
//                   Value *valarrayIdx = call->getArgOperand(1);
//                   val11->dump();
//
//                   Type *val11ty = val11->getType(); // this should be of float
// Type *valarrayIdx = valarrayIdx->getType(); // this should be of i32 address(1)*

//    	  while(i->getOpcodeName()!="Call"){
//    	 	  llvm::outs()<<"The current instruction is:"<<CurrentWPInst->getOpcodeName()<<"\n";
//    	 	  CurrentWPInst=CurrentWPInst->getPrevNode();
//    	   }

// i->getPrevNode()->dump();}
//     CurrentWPInst= i;
//  if (CurrentWPInst->getOpcodeName()=="call" && CurrentWPInst->getNumOperands()==2){
//  	llvm::outs()<<"CurrentWPInst->getOpcodeName() "<<CurrentWPInst->getOpcodeName()<<"\n";
//
//  	llvm::outs()<<"CurrentWPInst->getName() "<<CurrentWPInst->getName()<<"\n";
//  	llvm::outs()<<"CurrentWPInst->getOpcode() "<<CurrentWPInst->getOpcode()<<"\n";
//  	llvm::outs()<<"CurrentWPInst->getOpcode() "<<CurrentWPInst->getNumOperands()<<"\n";
//  llvm::outs()<<"CurrentWPInst->getOperandUse(0)->getName() "<<CurrentWPInst->getOperandUse(0)->getName()<<"\n";
//  llvm::outs()<<"<CurrentWPInst->getOperandUse(1)->getName() "<<CurrentWPInst->getOperandUse(1)->getName()<<"\n";
//  llvm::outs()<<"CurrentWPInst->getOperandUse(1) "<<CurrentWPInst->getOperandUse(1)<<"\n";
//  llvm::outs()<<"CurrentWPInst->getValueID() "<<CurrentWPInst->getValueID()<<"\n";
//
//  llvm::outs()<<"CurrentWPInst->getValueName() "<<CurrentWPInst->getValueName()<<"\n";
//
//
//  }
//   for (std::vector<std::pair<KInstruction *, int> >::iterator it1 = reverseInstructionList.begin(),
//                                       ie1 = reverseInstructionList.end();
//       it1 != ie1; ++it1) {
//   llvm::outs()<<*it1<<"\n";
//  }
//CurrentWPInst->dump();

//  while(CurrentWPInst->getOpcodeName()!="Call"){
//	  llvm::outs()<<"The current instruction is:"<<CurrentWPInst->getOpcodeName()<<"\n";
//	  CurrentWPInst=CurrentWPInst->getPrevNode();
//  }

//llvm::outs()<<"---Sanghu2"<< CurrentWPInst->getNextNode()->dump()<<"\n";

//llvm::outs() << "------ check-getNumOperands: "<<CurrentWPInst->getNumOperands()<<"\n";
//llvm::outs() << "------ check-getNumOperands: "<<CurrentWPInst->getNextNode()->getOpcodeName()<<"\n";
//llvm::outs() << "------ check-getNumOperands: "<<CurrentWPInst->getOpcodeName()<<"\n";
//llvm::outs() << "------ check-getNumOperands: "<<CurrentWPInst->getName()<<"\n";
//llvm::outs() << "------ check-1: "<<arg->getName()<<"\n";

//llvm::outs() << "------ check-getPrevNode: "<<CurrentWPInst->getPrevNode()->getOpcodeName()<<"\n";


//		llvm::outs()<<"\n-----------------------GET NAME1----------------\n";
//					//llvm::outs()<<alc->getName();
//					llvm::outs()<<p->getOperand(0)->getName();
//
//					llvm::outs()<<"\n-----------------------GET NAME1-2----------------\n";
//					std::string Str;
//					raw_string_ostream OS(Str);
//					p->getOperand(0)->print(OS);// printAsOperand(OS, false);
//					llvm::outs()<<"\n-----------------------GET NAME2----------------\n";
//					//llvm::outs()<<p->getOperand(0)->print(OS,false);

//AllocaInst *alloca = dyn_cast<AllocaInst>(&*inst); errs()<<"Alloca instruction :"<<*alloca<<" Name is : "<<alloca->getName()<<"\n";
//	llvm::outs()<<"\nlets see::"<<p->getOperand(0)->getName().str();;
//	StringRef bbName(p->getOperand(0)->getName());
//	                errs() << "BasicBlock: "  << bbName << "\n";
//
//	                llvm::outs()<<"If there any help22----------------------------";
//	                		p->getOperand(0)->dump();
//	                		generateExprFromOperand(p->getOperand(0))->dump();
//	                		llvm::outs()<<"If there any help33----------------------------\n";
//	                		llvm::outs()<<p->getOpcode();
//	                		//finalExpr = this->generateExprFromOperand(call->getArgOperand(whicharg));
//	                std::string Str;
//	                    raw_string_ostream OS(Str);
//
//	                    p->getOperand(0)->print(OS, false);
//	                     llvm::outs()<<"now is it :::::::\n"<<OS.str();
//
//	                     llvm::outs()<<generateExprFromOperand(p->getOperand(0));
//	                     generateExprFromOperand(p->getOperand(0))->dump();
//
//		llvm::outs()<<"\n-----------------------GET NAME3----------------\n";
//							//llvm::outs()<<alc->getName();
//							llvm::outs()<<p->getOperand(0)->getName();
//
//							llvm::outs()<<"\n-----------------------GET NAME1-2----------------\n";
//							std::string Str;
//							raw_string_ostream OS(Str);
//					p->getOperand(0)->print(OS,false);// printAsOperand(OS, false);
//							llvm::outs()<<"\n-----------------------GET NAME4----------------\n";
					//llvm::outs()<<p->getOperand(0)->print(OS,false);
//	llvm::outs()<<"\n-----------------------GET NAME----------------\n";
//	llvm::outs()<<alc->getName();
//	llvm::outs()<<result;
//
//	if(result.isNull())
//	{std::string Str;
//    raw_string_ostream OS(Str);
//}
