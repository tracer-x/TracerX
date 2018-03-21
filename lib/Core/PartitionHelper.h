#ifndef LIB_CORE_PARTITIONHELPER_H_
#define LIB_CORE_PARTITIONHELPER_H_

#include "klee/ExecutionState.h"
#include "Memory.h"

namespace klee {

class Partition {
public:
	std::vector<ref<Expr> > exprs;
	std::set<std::string> vars;
};

class PartitionHelper {
public:
	static void test(ExecutionState &state, ref<Expr> e);
	static void test1(ExecutionState &state);
	static Partition getNeededPartition(ConstraintManager constraints,
			ref<Expr> e);
	static std::vector<Partition> partition(ConstraintManager constraints);
  static std::vector<Partition> partition(std::vector<ref<Expr> > exprs);
  static ref<Expr> createAnd(std::vector<ref<Expr> > exprs);
	// printing functions
	static void printInfo(ExecutionState &state);
private:
	static bool isShared(std::set<std::string> ss1, std::set<std::string> ss2);
	static void getExprVars(ref<Expr> e, std::set<std::string>& vars);

	// printing functions
	static void printExprInfo(ref<Expr> expr);

};

}
#endif /* LIB_CORE_PARTITIONHELPER_H_ */
