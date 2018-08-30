#ifndef LIB_CORE_EXECUTIONSTATEUTILS_H_
#define LIB_CORE_EXECUTIONSTATEUTILS_H_
#include "Memory.h"
#include "klee/ExecutionState.h"
#include "klee/Expr.h"
#include "klee/Internal/Module/KInstruction.h"
#include "klee/Internal/Module/KModule.h"
#include "klee/Internal/Module/Cell.h"

namespace klee {

class ExecutionStateUtils {
public:
  ExecutionStateUtils();
  virtual ~ExecutionStateUtils();

  static void printSymbolicMemory(ExecutionState &state);
  static void printConcreteMemory(ExecutionState &state);
};
}
#endif /* LIB_CORE_EXECUTIONSTATEUTILS_H_ */

/*

KFunction:
	basicBlockEntry: BasicBlock* -> number of instructions
	numInstructions: sum(number of instructions in all block)
	numRegisters: sum(number of instructions in all block + n_arg)
	instructions: KInstruction*[numInstructions]
	registerMap: std::map<Instruction*, unsigned> (first n_arg in the function + all instructions in the function)

KInstruction
	inst: Instruction*
	dest: index in the function (starting from n_arg of the function)
	operands: registerMap[Instruction*]

StackFrame
	locals: new Cell[s.kf->numRegisters] (value of instructions in a functions)
	allocas: std::vector<const MemoryObject *> (generated from instruction in a function)

MemoryObject
	const llvm::Value *allocSite;

*/
