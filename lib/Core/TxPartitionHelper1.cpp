//===-- TxPartitionHelper1.cpp - Interpolation tree -------------------------*- C++ -*-===//
//
//               The Tracer-X KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementations Partition class
///
//===----------------------------------------------------------------------===//

#include "TxPartitionHelper1.h"
using namespace klee;

void TxPartitionHelper1::getExprVars(ref<Expr> e, std::set<std::string> &vars) {
	switch (e->getKind()) {
	case Expr::InvalidKind:
	case Expr::Constant: {
		break;
	}

	case Expr::Read: {
		ReadExpr *re = dyn_cast<ReadExpr>(e);
		vars.insert(re->updates.root->name);
		break;
	}
	case Expr::Concat: {
		ConcatExpr *ce = dyn_cast<ConcatExpr>(e);
		if (ce->getLeft()->getKind() == Expr::Read) {
			ReadExpr *re = dyn_cast<ReadExpr>(ce->getLeft());
			vars.insert(re->updates.root->name);
			break;
		} else {
			klee_error(
					"Partition::generateExprPartition shouldn't reach here1");
		}

		break;
	}

	case Expr::NotOptimized:
	case Expr::Not:
	case Expr::Extract:
	case Expr::ZExt:
	case Expr::SExt: {
		// Extract the one kid and extract variable from that
		ref<Expr> kids[1];
		kids[0] = e->getKid(0);
		getExprVars(kids[0], vars);
		break;
	}

	case Expr::Eq:
	case Expr::Ne:
	case Expr::Ult:
	case Expr::Ule:
	case Expr::Ugt:
	case Expr::Uge:
	case Expr::Slt:
	case Expr::Sle:
	case Expr::Sgt:
	case Expr::Sge:
	case Expr::Add:
	case Expr::Sub:
	case Expr::Mul:
	case Expr::UDiv:
	case Expr::SDiv:
	case Expr::URem:
	case Expr::SRem:
	case Expr::And:
	case Expr::Or:
	case Expr::Xor:
	case Expr::Shl:
	case Expr::LShr:
	case Expr::AShr: {
		// Extract the two kids and extract variable from that
		ref<Expr> kids[2];
		kids[0] = e->getKid(0);
		kids[1] = e->getKid(1);
		getExprVars(kids[0], vars);
		getExprVars(kids[1], vars);
		break;
	}

	case Expr::Select: {
		// Extract the three kids and extract variable from that
		ref<Expr> kids[3];
		kids[0] = e->getKid(0);
		kids[1] = e->getKid(1);
		kids[2] = e->getKid(2);
		getExprVars(kids[0], vars);
		getExprVars(kids[1], vars);
		getExprVars(kids[2], vars);
		break;
	}
	default:
		break;
	}
}

bool TxPartitionHelper1::isShared(std::set<std::string> ss1,
		std::set<std::string> ss2) {
	for (std::set<std::string>::const_iterator it1 = ss1.begin(), ie1 =
			ss1.end(); it1 != ie1; ++it1) {
		for (std::set<std::string>::const_iterator it2 = ss2.begin(), ie2 =
				ss2.end(); it2 != ie2; ++it2) {
			if ((*it2).compare(*it1) == 0) {
				return true;
			}
		}
	}
	return false;
}

ref<Expr> TxPartitionHelper1::createAnd(std::vector<ref<Expr> > exprs) {
	std::vector<ref<Expr> >::const_iterator it = exprs.begin();
	ref<Expr> result = *(it);
	std::advance(it, 1);
	if (exprs.size() >= 1) {
		for (; it != exprs.end(); ++it) {
			ref<Expr> currentExpr = (*it);
			result = AndExpr::create(result, currentExpr);
		}
	}
	return result;
}

void TxPartitionHelper1::getExprsFromAndExpr(ref<Expr> e,
		std::vector<ref<Expr> >& exprs) {
	if (!e.isNull()) {
		if (e->getKind() == Expr::And) {
			getExprsFromAndExpr(e->getKid(0), exprs);
			getExprsFromAndExpr(e->getKid(1), exprs);
		} else {
			exprs.push_back(e);
		}
	}
}

std::vector<Partition1> TxPartitionHelper1::partition(
		std::vector<ref<Expr> > wp1, std::vector<ref<Expr> > wp2,
		std::vector<ref<Expr> > pcs,
		std::map<std::string, ref<Expr> > entries) {
	std::vector<Partition1> partitions;
	// process wp1
	for (std::vector<ref<Expr> >::const_iterator it = wp1.begin(), ie =
			wp1.end(); it != ie; ++it) {
		std::set<std::string> eVars;
		getExprVars(*it, eVars);

		// find all partitions sharing variables
		std::vector<int> idxs;
		for (unsigned int i = 0; i < partitions.size(); i++) {
			if (isShared(eVars, partitions.at(i).vars)) {
				idxs.push_back(i);
			}
		}
		if (idxs.size() == 0) {
			// create a new partition & add to partitions
			Partition1 p;
			p.wp1.push_back(*it);
			p.vars.insert(eVars.begin(), eVars.end());
			partitions.push_back(p);

		} else {
			// combine sharing partitions and add current expression to the combined one
			combine(partitions, idxs);
			partitions.at(partitions.size() - 1).wp1.push_back(*it);
			partitions.at(partitions.size() - 1).vars.insert(eVars.begin(),
					eVars.end());
		}
	}

	// process wp2
	for (std::vector<ref<Expr> >::const_iterator it = wp2.begin(), ie =
			wp2.end(); it != ie; ++it) {
		std::set<std::string> eVars;
		getExprVars(*it, eVars);

		// find all partitions sharing variables
		std::vector<int> idxs;
		for (unsigned int i = 0; i < partitions.size(); i++) {
			if (isShared(eVars, partitions.at(i).vars)) {
				idxs.push_back(i);
			}
		}
		if (idxs.size() == 0) {
			// create a new partition
			Partition1 p;
			p.wp2.push_back(*it);
			p.vars.insert(eVars.begin(), eVars.end());
			partitions.push_back(p);
		} else {
			// combine sharing partition and add current expression to combined one
			combine(partitions, idxs);
			partitions.at(partitions.size() - 1).wp2.push_back(*it);
			partitions.at(partitions.size() - 1).vars.insert(eVars.begin(),
					eVars.end());
		}
	}

	// process path constraints
	for (std::vector<ref<Expr> >::const_iterator it = pcs.begin(), ie =
			pcs.end(); it != ie; ++it) {
		std::set<std::string> eVars;
		getExprVars(*it, eVars);

		// find all partitions sharing variables
		std::vector<int> idxs;
		for (unsigned int i = 0; i < partitions.size(); i++) {
			if (isShared(eVars, partitions.at(i).vars)) {
				idxs.push_back(i);
			}
		}
		if (idxs.size() == 0) {
			// create a new partition
			Partition1 p;
			p.pcs.push_back(*it);
			p.vars.insert(eVars.begin(), eVars.end());
			partitions.push_back(p);
		} else {
			// combine sharing partition and add current expression to combined one
			combine(partitions, idxs);
			partitions.at(partitions.size() - 1).pcs.push_back(*it);
			partitions.at(partitions.size() - 1).vars.insert(eVars.begin(),
					eVars.end());
		}
	}

	// process store entries
	for (std::map<std::string, ref<Expr> >::const_iterator it = entries.begin(),
			ie = entries.end(); it != ie; ++it) {
		std::set<std::string> eVars;
		getExprVars(it->second, eVars);
		eVars.insert(it->first);

		// find all partitions sharing variables
		std::vector<int> idxs;
		for (unsigned int i = 0; i < partitions.size(); i++) {
			if (isShared(eVars, partitions.at(i).vars)) {
				idxs.push_back(i);
			}
		}
		if (idxs.size() == 0) {
			// create a new partition
			Partition1 p;
			p.entries.insert(*it);
			p.vars.insert(eVars.begin(), eVars.end());
			partitions.push_back(p);
		} else {
			// combine sharing partition and add current expression to combined one
			combine(partitions, idxs);
			partitions.at(partitions.size() - 1).entries.insert(*it);
			partitions.at(partitions.size() - 1).vars.insert(eVars.begin(),
					eVars.end());
		}
	}
	return partitions;
}

void TxPartitionHelper1::combine(std::vector<Partition1>& partitions,
		std::vector<int> indexs) {

	Partition1 np;
	for (unsigned int i = 0; i < indexs.size(); i++) {
		Partition1 tmp = partitions.at(indexs.at(i));
		np.wp1.insert(np.wp1.end(), tmp.wp1.begin(), tmp.wp1.end());
		np.wp2.insert(np.wp2.end(), tmp.wp2.begin(), tmp.wp2.end());
		np.pcs.insert(np.pcs.end(), tmp.pcs.begin(), tmp.pcs.end());
		np.entries.insert(tmp.entries.begin(), tmp.entries.end());
		np.vars.insert(tmp.vars.begin(), tmp.vars.end());
		partitions.erase(partitions.begin() + indexs.at(i));

	}
	partitions.push_back(np);
}

std::vector<Partition1> TxPartitionHelper1::paritionOnCond(ref<Expr> cond,
		std::vector<ref<Expr> > wp1, std::vector<ref<Expr> > wp2,
		std::vector<ref<Expr> > pcs,
		std::map<std::string, ref<Expr> > entries) {
	std::vector<Partition1> ps = partition(wp1, wp2, pcs, entries);
	std::set<std::string> condVars;
	getExprVars(cond, condVars);

	// find sharing and independent partitions
	std::vector<int> sharingIdxs;
	std::vector<int> independentIdxs;
	for (unsigned int i = 0; i < ps.size(); i++) {
		if (isShared(condVars, ps.at(i).vars)) {
			sharingIdxs.push_back(i);
		} else {
			independentIdxs.push_back(i);
		}
	}
	combine(ps, independentIdxs);
	combine(ps, sharingIdxs);
	return ps;
}
