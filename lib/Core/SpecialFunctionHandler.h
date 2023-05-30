//===-- SpecialFunctionHandler.h --------------------------------*- C++ -*-===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef KLEE_SPECIALFUNCTIONHANDLER_H
#define KLEE_SPECIALFUNCTIONHANDLER_H

#include "TxTree.h"
#include <iterator>
#include <map>
#include <string>
#include <vector>

namespace llvm {
  class Function;
}

namespace klee {
  class Executor;
  class Expr;
  class ExecutionState;
  struct KInstruction;
  template<typename T> class ref;
  
  class SpecialFunctionHandler {
  public:
    typedef void (SpecialFunctionHandler::*Handler)(ExecutionState &state,
                                                    KInstruction *target, 
                                                    std::vector<ref<Expr> > 
                                                      &arguments);
    typedef std::map<const llvm::Function*, 
                     std::pair<Handler,bool> > handlers_ty;

    handlers_ty handlers;
    class Executor &executor;

    struct HandlerInfo {
      const char *name;
      SpecialFunctionHandler::Handler handler;
      bool doesNotReturn; /// Intrinsic terminates the process
      bool hasReturnValue; /// Intrinsic has a return value
      bool doNotOverride; /// Intrinsic should not be used if already defined
    };

    // const_iterator to iterate over stored HandlerInfo
    // FIXME: Implement >, >=, <=, < operators
    class const_iterator : public std::iterator<std::random_access_iterator_tag, HandlerInfo>
    {
      private:
        value_type* base;
        int index;
      public:
      const_iterator(value_type* hi) : base(hi), index(0) {};
      const_iterator& operator++();  // pre-fix
      const_iterator operator++(int); // post-fix
      const value_type& operator*() { return base[index];}
      const value_type* operator->() { return &(base[index]);}
      const value_type& operator[](int i) { return base[i];}
      bool operator==(const_iterator& rhs) { return (rhs.base + rhs.index) == (this->base + this->index);}
      bool operator!=(const_iterator& rhs) { return !(*this == rhs);}
    };

    static const_iterator begin();
    static const_iterator end();
    static int size();

    // const_iterator to iterate over stored HandlerInfo
    // FIXME: Implement >, >=, <=, < operators
    class persistentObject {
    private:
      std::vector<std::vector<int> > objects;
      int count;

    public:
      void insert(std::vector<int> items) { objects.push_back(items); }
      bool contains(std::vector<int> items) {
        return std::find(objects.begin(), objects.end(), items) !=
               objects.end();
      }
    };

    persistentObject po;
    class extPersistentObject {
        private:
          std::vector<std::pair<std::vector<int>,uintptr_t> > objects;
          //std::vector<std::pair<int,int> > objects1;
          int count;

        public:
          void insert(std::pair<std::vector<int>,uintptr_t> items) { objects.push_back(items); }
          bool contains(std::pair<std::vector<int>,uintptr_t> items) {
            return std::find(objects.begin(), objects.end(), items) !=
                   objects.end();
          }
        };

    extPersistentObject epo;
 
    class persistentVarCount {
        private:
          int count;

        public:
          void inc(){
          count++;
          //std::cout<<"****************\n The count value here is:"<<count<<"\n****************\n\n";
          }
          void print(){            
          std::cout<<"****************\n The count value is:"<<count<<"\n****************\n\n";
          }
        };

    persistentVarCount po1;

    class persistentVar {
        private:
         std::map<int, int> objects;

        public:
          void inc(int p){
            if(objects.find(p) != objects.end()){
            int oldCount=objects[p];
            int newcount=oldCount+1;
            objects[p]=newcount;
            }
            else{
              objects[p]=1;
            }
          }

          void print(int p){
            std::cout<<"****************\n The count value of point-"<<p<<" is:"<<objects[p]<<"\n****************\n\n";
          }
        };

    persistentVar po2;
    
    class persistentVarDetail {
      private:
      std::map< ref<Expr>, std::pair<int,std::vector<std::pair<int,uintptr_t> > > > objects;

      public:
      void inc(ref<Expr> p, std::pair<int,uintptr_t> info ){
      if(objects.find(p) != objects.end()){
      int oldCount=objects[p].first;
      int newcount=oldCount+1;
      objects[p].first=newcount;
      objects[p].second.push_back(info);
      }
      else{
        objects[p].first=1;
        objects[p].second.push_back(info);
      }
      }

      void print(ref<Expr> p){
        llvm::outs()<<"************************\n";
        llvm::outs()<<"The count value of program tag point - ";
        p->dump();
        llvm::outs()<<"is: "<<objects[p].first<<"\n";
        llvm::outs()<<"Program points updated its value are:\n";
        for ( std::vector < std::pair<int,uintptr_t> >::const_iterator it = objects[p].second.begin() ; it != objects[p].second.end(); it++){
                llvm::outs()<<"Node: "<<it->first <<", Program Point: "<<it->second<<"\n";
            }

        llvm::outs()<<"************************\n";
      }
	 };

 persistentVarDetail PV_det;
  public:
    SpecialFunctionHandler(Executor &_executor);

    /// Perform any modifications on the LLVM module before it is
    /// prepared for execution. At the moment this involves deleting
    /// unused function bodies and marking intrinsics with appropriate
    /// flags for use in optimizations.
    void prepare();

    /// Initialize the internal handler map after the module has been
    /// prepared for execution.
    void bind();

    bool handle(ExecutionState &state, 
                llvm::Function *f,
                KInstruction *target,
                std::vector< ref<Expr> > &arguments);

    /* Convenience routines */

    std::string readStringAtAddress(ExecutionState &state, ref<Expr> address);
    
    /* Handlers */

#define HANDLER(name) void name(ExecutionState &state, \
                                KInstruction *target, \
                                std::vector< ref<Expr> > &arguments)
    HANDLER(handleAbort);
    HANDLER(handleAssert);
    HANDLER(handleAssertFail);
    HANDLER(handleAssume);
    HANDLER(handleCalloc);
    HANDLER(handleCheckMemoryAccess);
    HANDLER(handleDebugState);
    HANDLER(handleDebugStateOff);
    HANDLER(handleDebugSubsumption);
    HANDLER(handleDebugSubsumptionOff);
    HANDLER(handleMemoCheck);
    HANDLER(handleMemo);
    HANDLER(handleExtMemoCheck);
    HANDLER(handleExtMemo);
    HANDLER(handleIncrCount);
    HANDLER(handlePrintCount);
    HANDLER(handleIncrVar);
    HANDLER(handlePrintVar);
    HANDLER(handleIncrDetVar);
    HANDLER(handlePrintDetVar);
    HANDLER(handleDefineFixedObject);
    HANDLER(handleDelete);    
    HANDLER(handleDeleteArray);
    HANDLER(handleExit);
    HANDLER(handleAliasFunction);
    HANDLER(handleFree);
    HANDLER(handleGetErrno);
    HANDLER(handleGetObjSize);
    HANDLER(handleGetValue);
    HANDLER(handleIsSymbolic);
    HANDLER(handleMakeSymbolic);
    HANDLER(handleMalloc);
    HANDLER(handleMarkGlobal);
    HANDLER(handleMerge);
    HANDLER(handleNew);
    HANDLER(handleNewArray);
    HANDLER(handlePreferCex);
    HANDLER(handlePosixPreferCex);
    HANDLER(handlePrintExpr);
    HANDLER(handlePrintRange);
    HANDLER(handleRange);
    HANDLER(handleRealloc);
    HANDLER(handleReportError);
    HANDLER(handleRevirtObjects);
    HANDLER(handleSetForking);
    HANDLER(handleSilentExit);
    HANDLER(handleStackTrace);
    HANDLER(handleUnderConstrained);
    HANDLER(handleWarning);
    HANDLER(handleWarningOnce);
    HANDLER(handleAddOverflow);
    HANDLER(handleMulOverflow);
    HANDLER(handleSubOverflow);
    HANDLER(handleDivRemOverflow);
#undef HANDLER
  };
} // End klee namespace

#endif
