#include "PartitionHelper.h"

#include "llvm/IR/Value.h"

#include "klee/Internal/Support/ErrorHandling.h"

#include <iostream>

using namespace klee;

void PartitionHelper::test1(ExecutionState &state) {
  std::cout << "\n**************\n";
  std::cout << "\nOriginal constraints: \n";
  for (ConstraintManager::const_iterator it = state.constraints.begin(), ie =
      state.constraints.end(); it != ie; ++it) {
    (*it)->dump();
  }
  std::cout << "\nPartitions: \n";
  std::vector<Partition> evs = partition(state.constraints);
  for (std::vector<Partition>::const_iterator it = evs.begin(), ie = evs.end();
      it != ie; ++it) {
    Partition exprsVars = (*it);
    for (std::vector<ref<Expr> >::const_iterator it1 = exprsVars.exprs.begin(),
        ie1 = exprsVars.exprs.end(); it1 != ie1; ++it1) {
      (*it1)->dump();
    }
    std::cout << "\n------------\n";
  }
  std::cout << "\n**************\n";
}

void PartitionHelper::test(ExecutionState &state, ref<Expr> e) {
  std::cout << "\n**************\n";
  std::cout << "Expression: \n";
  e->dump();
  std::cout << "\nOriginal constraints: \n";
  for (ConstraintManager::const_iterator it = state.constraints.begin(), ie =
      state.constraints.end(); it != ie; ++it) {
    (*it)->dump();
  }
  std::cout << "\nNeeded partition: \n";
  Partition evs = getNeededPartition(state.constraints, e);
  for (std::vector<ref<Expr> >::const_iterator it = evs.exprs.begin(), ie =
      evs.exprs.end(); it != ie; ++it) {
    (*it)->dump();
  }
  std::cout << "\n**************\n";
}

Partition PartitionHelper::getNeededPartition(ConstraintManager constraints,
    ref<Expr> e) {
  // get partitions
  std::vector<Partition> evs = partition(constraints);

  // variables in expression
  std::set < std::string > eVars;
  getExprVars(e, eVars);

  // get partition that share variables with expression
  Partition exprsVars;
  for (std::vector<Partition>::const_iterator it = evs.begin(), ie = evs.end();
      it != ie; ++it) {
//		exprsVars = (*it);
    if (isShared((*it).vars, eVars)) {
      return (*it);
    }
  }
  return exprsVars;
}

std::vector<Partition> PartitionHelper::partition(
    ConstraintManager constraints) {
  // empty partition
  std::vector<Partition> partitions;

  for (ConstraintManager::const_iterator it1 = constraints.begin(), ie1 =
      constraints.end(); it1 != ie1; ++it1) {
    // var set of each expression
    ref<Expr> currentExpr = (*it1);
    std::set < std::string > eVars;
    getExprVars(currentExpr, eVars);

    // put current expression to correct partition, otherwise create a new partition to store
    bool isPut = false;
    for (std::vector<Partition>::iterator it2 = partitions.begin(), ie2 =
        partitions.end(); it2 != ie2; ++it2) {
      if (isShared(eVars, (*it2).vars)) {
        (*it2).exprs.push_back(currentExpr);
        (*it2).vars.insert(eVars.begin(), eVars.end());
        isPut = true;
        break;
      }
    }
    if (!isPut) {
      Partition newPartition;
      newPartition.exprs.push_back(currentExpr);
      newPartition.vars = eVars;
      partitions.push_back(newPartition);
    }
  }
  return partitions;
}

std::vector<Partition> PartitionHelper::partition(
    std::vector<ref<Expr> > exprs) {
  // empty partition
  std::vector<Partition> partitions;

  for (std::vector<ref<Expr> >::const_iterator it1 = exprs.begin(), ie1 =
      exprs.end(); it1 != ie1; ++it1) {
    // var set of each expression
    ref<Expr> currentExpr = (*it1);
    std::set < std::string > eVars;
    getExprVars(currentExpr, eVars);

    // put current expression to correct partition, otherwise create a new partition to store
    bool isPut = false;
    for (std::vector<Partition>::iterator it2 = partitions.begin(), ie2 =
        partitions.end(); it2 != ie2; ++it2) {
      if (isShared(eVars, (*it2).vars)) {
        (*it2).exprs.push_back(currentExpr);
        (*it2).vars.insert(eVars.begin(), eVars.end());
        isPut = true;
        break;
      }
    }
    if (!isPut) {
      Partition newPartition;
      newPartition.exprs.push_back(currentExpr);
      newPartition.vars = eVars;
      partitions.push_back(newPartition);
    }
  }
  return partitions;
}

ref<Expr> PartitionHelper::createAnd(std::vector<ref<Expr> > exprs) {
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

bool PartitionHelper::isShared(std::set<std::string> ss1,
    std::set<std::string> ss2) {
  for (std::set<std::string>::const_iterator it1 = ss1.begin(), ie1 = ss1.end();
      it1 != ie1; ++it1) {
    for (std::set<std::string>::const_iterator it2 = ss2.begin(), ie2 =
        ss2.end(); it2 != ie2; ++it2) {
      if ((*it2).compare(*it1) == 0) {
        return true;
      }
    }
  }
  return false;
}

/**
 * Get set of ReadExpr or ConcatExpr in one Expr
 Should eliminate AndExpr in Pi before using this
 */
void PartitionHelper::getExprVars(ref<Expr> e, std::set<std::string>& vars) {
  switch (e->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    break;
  }

  case Expr::Read: {
    ReadExpr* re = dyn_cast<ReadExpr>(e);
    vars.insert(re->updates.root->name);
    break;
  }
  case Expr::Concat: {
    ConcatExpr* ce = dyn_cast<ConcatExpr>(e);
    if (ce->getLeft()->getKind() == Expr::Read) {
      ReadExpr* re = dyn_cast<ReadExpr>(ce->getLeft());
      vars.insert(re->updates.root->name);
      break;
    } else {
      klee_error("Partition::generateExprPartition shouldn't reach here1");
    }

    break;
  }

  case Expr::NotOptimized:
  case Expr::Not:
  case Expr::Extract:
  case Expr::ZExt:
  case Expr::SExt: {
    //Extract the one kid and extract variable from that
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
    //Extract the two kids and extract variable from that
    ref<Expr> kids[2];
    kids[0] = e->getKid(0);
    kids[1] = e->getKid(1);
    getExprVars(kids[0], vars);
    getExprVars(kids[1], vars);
    break;
  }

  case Expr::Select: {
    //Extract the three kids and extract variable from that
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

void PartitionHelper::printInfo(ExecutionState &state) {

  llvm::outs() << "\n**********************\n";
  std::cout << "Symbolics:\n";
  for (std::vector<std::pair<const MemoryObject *, const Array *> >::iterator it =
      state.symbolics.begin(); it != state.symbolics.end(); ++it) {
    const MemoryObject * mo = it->first;
    const Array* arr = it->second;
    std::cout << mo->id << " - " << mo->size << " - " << arr->name << "\n";
  }
  std::cout << "=============\n";
  std::cout << "Pi:\n";
  for (ConstraintManager::const_iterator it = state.constraints.begin(), ie =
      state.constraints.end(); it != ie; ++it) {
    (*it)->dump();
    printExprInfo(*it);
  }
  llvm::outs() << "\n**********************\n";
}

void PartitionHelper::printExprInfo(ref<Expr> ex) {
  switch (ex->getKind()) {
  case Expr::InvalidKind:
  case Expr::Constant: {
    break;
  }

  case Expr::Read: {
    ReadExpr* e = dyn_cast<ReadExpr>(ex);
    std::cout << e->updates.root->name << "\n";
    break;
  }
  case Expr::Concat: {
    ConcatExpr* e = dyn_cast<ConcatExpr>(ex);
    if (e->getLeft()->getKind() == Expr::Read) {
      std::cout << dyn_cast<ReadExpr>(e->getLeft())->updates.root->name << "\n";
      // ignore the right
    } else {
      // Sanity check
      klee_warning(
          "Partition::printExprInfo: Concat Expression not having a ReadExpr at its left child!");
      printExprInfo(e->getLeft());
      printExprInfo(e->getRight());

    }
    break;
  }

  case Expr::NotOptimized:
  case Expr::Not:
  case Expr::Extract:
  case Expr::ZExt:
  case Expr::SExt: {
    //Extract the one kid and extract variable from that
    ref<Expr> kids[1];
    kids[0] = ex->getKid(0);
    printExprInfo(kids[0]);
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
    //Extract the two kids and extract variable from that
    ref<Expr> kids[2];
    kids[0] = ex->getKid(0);
    kids[1] = ex->getKid(1);
    printExprInfo(kids[0]);
    printExprInfo(kids[1]);
    break;
  }

  case Expr::Select: {
    //Extract the three kids and extract variable from that
    ref<Expr> kids[3];
    kids[0] = ex->getKid(0);
    kids[1] = ex->getKid(1);
    kids[2] = ex->getKid(2);
    printExprInfo(kids[0]);
    printExprInfo(kids[1]);
    printExprInfo(kids[2]);
    break;
  }
  default:
    break;

  }
}
