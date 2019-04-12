/*
 * StackFramUtils.h
 *
 *  Created on: 18 Mar 2019
 *      Author: xuanlinhha
 */

#ifndef LIB_CORE_STACKFRAMEUTILS_H_
#define LIB_CORE_STACKFRAMEUTILS_H_

#include "Memory.h"
#include "klee/ExecutionState.h"
#include "klee/Expr.h"
#include "klee/Internal/Module/Cell.h"
#include "klee/Internal/Module/KInstruction.h"
#include "klee/Internal/Module/KModule.h"
#include <llvm/IR/Value.h>
#include <llvm/IR/Function.h>

namespace klee {

class StackFrameUtils {
public:
  StackFrameUtils();
  virtual ~StackFrameUtils();
  static void printLocals(StackFrame *sf);
};

} /* namespace klee */

#endif /* LIB_CORE_STACKFRAMEUTILS_H_ */
