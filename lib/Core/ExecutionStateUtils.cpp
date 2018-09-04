#include "ExecutionStateUtils.h"

using namespace klee;

void ExecutionStateUtils::printSymbolicMemory(ExecutionState &state) {
  for (std::vector<
           std::pair<const MemoryObject *, const Array *> >::const_iterator
           it = state.symbolics.begin(),
           ie = state.symbolics.end();
       it != ie; ++it) {
    it->first->allocSite->dump();
    llvm::outs() << "Name: " << it->second->name << "\n";
  }
}

void ExecutionStateUtils::printConcreteMemory(ExecutionState &state) {
  for (unsigned int i = state.stack.back().kf->numArgs;
       i < state.stack.back().kf->numRegisters; i++) {
    ref<Expr> val = state.stack.back().locals[i].value;
    if (!val.isNull()) {
      val->dump();
    }
  }
}
