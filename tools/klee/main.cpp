/* -*- mode: c++; c-basic-offset: 2; -*- */

//===-- main.cpp ------------------------------------------------*- C++ -*-===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "klee/CommandLine.h"
#include "klee/ExecutionState.h"
#include "klee/Expr.h"
#include "klee/Interpreter.h"
#include "klee/Statistics.h"
#include "klee/Config/Version.h"
#include "klee/Internal/ADT/KTest.h"
#include "klee/Internal/ADT/TreeStream.h"
#include "klee/Internal/Support/Debug.h"
#include "klee/Internal/Support/ModuleUtil.h"
#include "klee/Internal/System/Time.h"
#include "klee/Internal/Support/PrintVersion.h"
#include "klee/Internal/Support/ErrorHandling.h"
#include "klee/util/TxTreeGraph.h"

#if LLVM_VERSION_CODE > LLVM_VERSION(3, 2)
#include "llvm/IR/Constants.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#else
#include "llvm/Constants.h"
#include "llvm/Module.h"
#include "llvm/Type.h"
#include "llvm/InstrTypes.h"
#include "llvm/Instruction.h"
#include "llvm/Instructions.h"
#include "llvm/LLVMContext.h"
#include "llvm/Support/FileSystem.h"
#endif
#include "llvm/Support/Errno.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/raw_ostream.h"

#if LLVM_VERSION_CODE < LLVM_VERSION(3, 0)
#include "llvm/Target/TargetSelect.h"
#else
#include "llvm/Support/TargetSelect.h"
#endif
#include "llvm/Support/Signals.h"

#if LLVM_VERSION_CODE < LLVM_VERSION(3, 5)
#include "llvm/Support/system_error.h"
#endif

#include <dirent.h>
#include <signal.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/wait.h>

#include <cerrno>
#include <fstream>
#include <iomanip>
#include <iterator>
#include <sstream>


using namespace llvm;
using namespace klee;

namespace {
  cl::opt<std::string>
  InputFile(cl::desc("<input bytecode>"), cl::Positional, cl::init("-"));

  cl::opt<std::string>
  EntryPoint("entry-point",
               cl::desc("Consider the function with the given name as the entrypoint"),
               cl::init("main"));

  cl::opt<std::string>
  RunInDir("run-in", cl::desc("Change to the given directory prior to executing"));

  cl::opt<std::string>
  Environ("environ", cl::desc("Parse environ from given file (in \"env\" format)"));

  cl::list<std::string>
  InputArgv(cl::ConsumeAfter,
            cl::desc("<program arguments>..."));

  cl::opt<bool>
  NoOutput("no-output",
           cl::desc("Don't generate test files"));

  cl::opt<bool>
  WarnAllExternals("warn-all-externals",
                   cl::desc("Give initial warning for all externals."));

  cl::opt<bool>
  WriteCVCs("write-cvcs",
            cl::desc("Write .cvc files for each test case"));

  cl::opt<bool>
  WritePCs("write-pcs",
            cl::desc("Write .pc files for each test case"));

  cl::opt<bool>
  WriteSMT2s("write-smt2s",
            cl::desc("Write .smt2 (SMT-LIBv2) files for each test case"));

  cl::opt<bool>
  WriteCov("write-cov",
           cl::desc("Write coverage information for each test case"));

  cl::opt<bool>
  WriteTestInfo("write-test-info",
                cl::desc("Write additional test case information"));

  cl::opt<bool>
  WritePaths("write-paths",
                cl::desc("Write .path files for each test case"));

  cl::opt<bool>
  WriteSymPaths("write-sym-paths",
                cl::desc("Write .sym.path files for each test case"));

  cl::opt<bool>
  ExitOnError("exit-on-error",
              cl::desc("Exit if errors occur"));


  enum LibcType {
    NoLibc, KleeLibc, UcLibc
  };

  cl::opt<LibcType>
  Libc("libc",
       cl::desc("Choose libc version (none by default)."),
       cl::values(clEnumValN(NoLibc, "none", "Don't link in a libc"),
                  clEnumValN(KleeLibc, "klee", "Link in klee libc"),
		  clEnumValN(UcLibc, "uclibc", "Link in uclibc (adapted for klee)"),
		  clEnumValEnd),
       cl::init(NoLibc));


  cl::opt<bool>
  WithPOSIXRuntime("posix-runtime",
		cl::desc("Link with POSIX runtime.  Options that can be passed as arguments to the programs are: --sym-arg <max-len>  --sym-args <min-argvs> <max-argvs> <max-len> + file model options"),
		cl::init(false));

  cl::opt<bool>
  OptimizeModule("optimize",
                 cl::desc("Optimize before execution"),
		 cl::init(false));

  cl::opt<bool>
  CheckDivZero("check-div-zero",
               cl::desc("Inject checks for division-by-zero"),
               cl::init(true));

  cl::opt<bool>
  CheckOvershift("check-overshift",
               cl::desc("Inject checks for overshift"),
               cl::init(true));

  cl::opt<std::string>
  OutputDir("output-dir",
            cl::desc("Directory to write results in (defaults to klee-out-N)"),
            cl::init(""));

  cl::opt<bool>
  ReplayKeepSymbolic("replay-keep-symbolic",
                     cl::desc("Replay the test cases only by asserting "
                              "the bytes, not necessarily making them concrete."));

  cl::list<std::string>
  ReplayKTestFile("replay-ktest-file",
                  cl::desc("Specify a ktest file to use for replay"),
                  cl::value_desc("ktest file"));

  cl::list<std::string>
  ReplayKTestDir("replay-ktest-dir",
                 cl::desc("Specify a directory to replay ktest files from"),
                 cl::value_desc("output directory"));

  cl::opt<std::string>
  ReplayPathFile("replay-path",
                 cl::desc("Specify a path file to replay"),
                 cl::value_desc("path file"));

  cl::list<std::string>
  SeedOutFile("seed-out");

  cl::list<std::string>
  SeedOutDir("seed-out-dir");

  cl::list<std::string>
  LinkLibraries("link-llvm-lib",
                cl::desc("Link the given libraries before execution"),
                cl::value_desc("library file"));

  cl::opt<unsigned>
  MakeConcreteSymbolic("make-concrete-symbolic",
                       cl::desc("Probabilistic rate at which to make concrete reads symbolic, "
				"i.e. approximately 1 in n concrete reads will be made symbolic (0=off, 1=all).  "
				"Used for testing."),
                       cl::init(0));

  cl::opt<unsigned>
  StopAfterNTests("stop-after-n-tests",
	     cl::desc("Stop execution after generating the given number of tests.  Extra tests corresponding to partially explored paths will also be dumped."),
	     cl::init(0));

  cl::opt<bool>
  Watchdog("watchdog",
           cl::desc("Use a watchdog process to enforce --max-time."),
           cl::init(0));
}

extern cl::opt<double> MaxTime;

/***/

class KleeHandler : public InterpreterHandler {
private:
  Interpreter *m_interpreter;
  TreeStreamWriter *m_pathWriter, *m_symPathWriter;
  llvm::raw_ostream *m_infoFile;

  SmallString<128> m_outputDirectory;

  unsigned m_testIndex;  // number of tests written so far
  unsigned m_pathsExplored; // number of paths explored so far

  unsigned m_totalBranchingDepthOnExitTermination; // total depth paths explored so far
                                            // on exit
  unsigned m_totalInstructionsDepthOnExitTermination; // total instructions explored so far on
                                      // exit
  unsigned m_totalBranchingDepthOnEarlyTermination; // total depth paths explored so
                                             // far on early
  unsigned m_totalInstructionsDepthOnEarlyTermination; // total instructions explored so far on
                                       // early
  unsigned m_totalBranchingDepthOnErrorTermination; // total depth paths explored so
                                             // far on error
  unsigned m_totalInstructionsDepthOnErrorTermination; // total instructions explored so far on
                                       // error
  unsigned m_totalBranchingDepthOnSubsumption; // total depth explored so
                                                   // far on subsumption
  unsigned m_totalInstructionsDepthOnSubsumption; // total instruction explored so
                                             // far on subsumption

  unsigned m_subsumptionTermination;     // number of termination by subsumption
  unsigned m_subsumptionTerminationTest; // number of tests generated from
                                         // termination by subsumption
  unsigned m_earlyTermination;     // number of early termination
  unsigned m_earlyTerminationTest; // number of tests generated from early termination
  unsigned m_errorTermination;     // number of error termination
  unsigned m_errorTerminationTest; // number of tests generated from error termination
  unsigned m_exitTermination;      // number of exit termination
  unsigned m_exitTerminationTest;  // number of tests generated from exit termination
  unsigned m_otherTermination;     // number of other termination (strategy, state merging,
                                   // not in seed, etc.

  std::string m_subsumptionStats; // subsumption statistics result

  // used for writing .ktest files
  int m_argc;
  char **m_argv;

public:
  KleeHandler(int argc, char **argv);
  ~KleeHandler();

  llvm::raw_ostream &getInfoStream() const { return *m_infoFile; }
  unsigned getNumTestCases() { return m_testIndex; }
  unsigned getNumPathsExplored() { return m_pathsExplored; }
  void incPathsExplored() { m_pathsExplored++; }

  void incBranchingDepthOnExitTermination(unsigned branchingDepth) {
    m_totalBranchingDepthOnExitTermination += branchingDepth;
  }

  void incTotalInstructionsOnExit(unsigned instructionsDepth) {
    m_totalInstructionsDepthOnExitTermination += instructionsDepth;
  }
  unsigned getTotalBranchingDepthOnExitTermination() {
    return m_totalBranchingDepthOnExitTermination;
  }
  unsigned getTotalInstructionsDepthOnExitTermination() {
    return m_totalInstructionsDepthOnExitTermination;
  }
  void incBranchingDepthOnEarlyTermination(unsigned branchingDepth) {
    m_totalBranchingDepthOnEarlyTermination += branchingDepth;
  }

  void incInstructionsDepthOnEarlyTermination(unsigned instructionsDepth) {
    m_totalInstructionsDepthOnEarlyTermination += instructionsDepth;
  }
  unsigned getTotalBranchingDepthOnEarlyTermination() {
    return m_totalBranchingDepthOnEarlyTermination;
  }
  unsigned getTotalInstructionsDepthOnEarlyTermination() {
    return m_totalInstructionsDepthOnEarlyTermination;
  }
  void incBranchingDepthOnErrorTermination(unsigned branchingDepth) {
    m_totalBranchingDepthOnErrorTermination += branchingDepth;
  }

  void incInstructionsDepthOnErrorTermination(unsigned instructionsDepth) {
    m_totalInstructionsDepthOnErrorTermination += instructionsDepth;
  }
  unsigned getTotalBranchingDepthOnErrorTermination() {
    return m_totalBranchingDepthOnErrorTermination;
  }
  unsigned getTotalInstructionsDepthOnErrorTermination() {
    return m_totalInstructionsDepthOnErrorTermination;
  }
  unsigned getTotalInstructionPathsExploredOnSubsumption() {
    return m_totalInstructionsDepthOnSubsumption;
  }
  void incInstructionsDepthOnSubsumption(unsigned branchingDepth) {
    m_totalBranchingDepthOnSubsumption += branchingDepth;
  }

  void incTotalInstructionsOnSubsumption(unsigned instructionsDepth) {
    m_totalInstructionsDepthOnSubsumption += instructionsDepth;
  }
  unsigned getTotalBranchingDepthOnSubsumption() {
    return m_totalBranchingDepthOnSubsumption;
  }
  unsigned getSubsumptionTermination() { return m_subsumptionTermination; }
  void incSubsumptionTermination() { m_subsumptionTermination++; }
  unsigned getSubsumptionTerminationTest() {
    return m_subsumptionTerminationTest;
  }
  void incSubsumptionTerminationTest() {
    if (!NoOutput) {
      m_subsumptionTerminationTest++;
    }
  }
  unsigned getEarlyTermination() { return m_earlyTermination; }
  void incEarlyTermination() { m_earlyTermination++; }
  unsigned getEarlyTerminationTest() { return m_earlyTerminationTest; }
  void incEarlyTerminationTest() {
    if (!NoOutput) {
      m_earlyTerminationTest++;
    }
  }
  unsigned getErrorTermination() { return m_errorTermination; }
  void incErrorTermination() { m_errorTermination++; }
  unsigned getErrorTerminationTest() { return m_errorTerminationTest; }
  void incErrorTerminationTest() {
    if (!NoOutput) {
      m_errorTerminationTest++;
    }
  }
  unsigned getExitTermination() { return m_exitTermination; }
  void incExitTermination() { m_exitTermination++; }
  unsigned getExitTerminationTest() { return m_exitTerminationTest; }
  void incExitTerminationTest() {
    if (!NoOutput) {
      m_exitTerminationTest++;
    }
  }

  void assignSubsumptionStats(std::string currentStats) {
    m_subsumptionStats = currentStats;
  }

  std::string getSubsumptionStats() { return m_subsumptionStats; }

  void setInterpreter(Interpreter *i);

  void processTestCase(const ExecutionState  &state,
                       const char *errorMessage,
                       const char *errorSuffix);

  std::string getOutputFilename(const std::string &filename);
  llvm::raw_fd_ostream *openOutputFile(const std::string &filename);
  std::string getTestFilename(const std::string &suffix, unsigned id);
  llvm::raw_fd_ostream *openTestFile(const std::string &suffix, unsigned id);

  // load a .path file
  static void loadPathFile(std::string name,
                           std::vector<bool> &buffer);

  static void getKTestFilesInDir(std::string directoryPath,
                                 std::vector<std::string> &results);

  static std::string getRunTimeLibraryPath(const char *argv0);
};

KleeHandler::KleeHandler(int argc, char **argv)
    : m_interpreter(0), m_pathWriter(0), m_symPathWriter(0), m_infoFile(0),
      m_outputDirectory(), m_testIndex(0), m_pathsExplored(0),
      m_totalBranchingDepthOnExitTermination(0),
      m_totalInstructionsDepthOnExitTermination(0),
      m_totalBranchingDepthOnEarlyTermination(0),
      m_totalInstructionsDepthOnEarlyTermination(0),
      m_totalBranchingDepthOnErrorTermination(0),
      m_totalInstructionsDepthOnErrorTermination(0),
      m_totalBranchingDepthOnSubsumption(0),
      m_totalInstructionsDepthOnSubsumption(0), m_subsumptionTermination(0),
      m_subsumptionTerminationTest(0), m_earlyTermination(0),
      m_earlyTerminationTest(0), m_errorTermination(0),
      m_errorTerminationTest(0), m_exitTermination(0), m_exitTerminationTest(0),
      m_otherTermination(0), m_argc(argc), m_argv(argv) {

  // create output directory (OutputDir or "klee-out-<i>")
  bool dir_given = OutputDir != "";
  SmallString<128> directory(dir_given ? OutputDir : InputFile);

  if (!dir_given) sys::path::remove_filename(directory);
#if LLVM_VERSION_CODE < LLVM_VERSION(3, 5)
  error_code ec;
  if ((ec = sys::fs::make_absolute(directory)) != errc::success) {
#else
  if (auto ec = sys::fs::make_absolute(directory)) {
#endif
    klee_error("unable to determine absolute path: %s", ec.message().c_str());
  }

  if (dir_given) {
    // OutputDir
    if (mkdir(directory.c_str(), 0775) < 0)
      klee_error("cannot create \"%s\": %s", directory.c_str(), strerror(errno));

    m_outputDirectory = directory;
  } else {
    // "klee-out-<i>"
    int i = 0;
    for (; i <= INT_MAX; ++i) {
      SmallString<128> d(directory);
      llvm::sys::path::append(d, "klee-out-");
      raw_svector_ostream ds(d); ds << i; ds.flush();

      // create directory and try to link klee-last
      if (mkdir(d.c_str(), 0775) == 0) {
        m_outputDirectory = d;

        SmallString<128> klee_last(directory);
        llvm::sys::path::append(klee_last, "klee-last");

        if (((unlink(klee_last.c_str()) < 0) && (errno != ENOENT)) ||
            symlink(m_outputDirectory.c_str(), klee_last.c_str()) < 0) {

          klee_warning("cannot create klee-last symlink: %s", strerror(errno));
        }

        break;
      }

      // otherwise try again or exit on error
      if (errno != EEXIST)
        klee_error("cannot create \"%s\": %s", m_outputDirectory.c_str(), strerror(errno));
    }
    if (i == INT_MAX && m_outputDirectory.str().equals(""))
        klee_error("cannot create output directory: index out of range");
  }

  klee_message("output directory is \"%s\"", m_outputDirectory.c_str());

  // open warnings.txt
  std::string file_path = getOutputFilename("warnings.txt");
  if ((klee_warning_file = fopen(file_path.c_str(), "w")) == NULL)
    klee_error("cannot open file \"%s\": %s", file_path.c_str(), strerror(errno));

  // open messages.txt
  file_path = getOutputFilename("messages.txt");
  if ((klee_message_file = fopen(file_path.c_str(), "w")) == NULL)
    klee_error("cannot open file \"%s\": %s", file_path.c_str(), strerror(errno));

  // open info
  m_infoFile = openOutputFile("info");
}

KleeHandler::~KleeHandler() {
  if (m_pathWriter) delete m_pathWriter;
  if (m_symPathWriter) delete m_symPathWriter;
  fclose(klee_warning_file);
  fclose(klee_message_file);
  delete m_infoFile;
}

void KleeHandler::setInterpreter(Interpreter *i) {
  m_interpreter = i;

  if (WritePaths) {
    m_pathWriter = new TreeStreamWriter(getOutputFilename("paths.ts"));
    assert(m_pathWriter->good());
    m_interpreter->setPathWriter(m_pathWriter);
  }

  if (WriteSymPaths) {
    m_symPathWriter = new TreeStreamWriter(getOutputFilename("symPaths.ts"));
    assert(m_symPathWriter->good());
    m_interpreter->setSymbolicPathWriter(m_symPathWriter);
  }
}

std::string KleeHandler::getOutputFilename(const std::string &filename) {
  SmallString<128> path = m_outputDirectory;
  sys::path::append(path,filename);
  return path.str();
}

llvm::raw_fd_ostream *KleeHandler::openOutputFile(const std::string &filename) {
  llvm::raw_fd_ostream *f;
  std::string Error;
  std::string path = getOutputFilename(filename);
#if LLVM_VERSION_CODE >= LLVM_VERSION(3,5)
  f = new llvm::raw_fd_ostream(path.c_str(), Error, llvm::sys::fs::F_None);
#elif LLVM_VERSION_CODE >= LLVM_VERSION(3,4)
  f = new llvm::raw_fd_ostream(path.c_str(), Error, llvm::sys::fs::F_Binary);
#else
  f = new llvm::raw_fd_ostream(path.c_str(), Error, llvm::raw_fd_ostream::F_Binary);
#endif
  if (!Error.empty()) {
    klee_warning("error opening file \"%s\".  KLEE may have run out of file "
                 "descriptors: try to increase the maximum number of open file "
                 "descriptors by using ulimit (%s).",
                 filename.c_str(), Error.c_str());
    delete f;
    f = NULL;
  }

  return f;
}

std::string KleeHandler::getTestFilename(const std::string &suffix, unsigned id) {
  std::stringstream filename;
  filename << "test" << std::setfill('0') << std::setw(6) << id << '.' << suffix;
  return filename.str();
}

llvm::raw_fd_ostream *KleeHandler::openTestFile(const std::string &suffix,
                                                unsigned id) {
  return openOutputFile(getTestFilename(suffix, id));
}


/* Outputs all files (.ktest, .pc, .cov etc.) describing a test case */
void KleeHandler::processTestCase(const ExecutionState &state,
                                  const char *errorMessage,
                                  const char *errorSuffix) {
  if (errorMessage && ExitOnError) {
    llvm::errs() << "EXITING ON ERROR:\n" << errorMessage << "\n";
    if (INTERPOLATION_ENABLED) {
      TxTreeGraph::setError(state, TxTreeGraph::GENERIC);
      TxTreeGraph::save(getOutputFilename("tree.dot"));
      TxTreeGraph::deallocate();
    }
    exit(1);
  }

  if (!NoOutput) {
    std::vector< std::pair<std::string, std::vector<unsigned char> > > out;
    bool success = m_interpreter->getSymbolicSolution(state, out);

    if (!success)
      klee_warning("unable to get symbolic solution, losing test case");

    double start_time = util::getWallTime();

    unsigned id = ++m_testIndex;

    if (success) {
      KTest b;
      b.numArgs = m_argc;
      b.args = m_argv;
      b.symArgvs = 0;
      b.symArgvLen = 0;
      b.numObjects = out.size();
      b.objects = new KTestObject[b.numObjects];
      assert(b.objects);
      for (unsigned i=0; i<b.numObjects; i++) {
        KTestObject *o = &b.objects[i];
        o->name = const_cast<char*>(out[i].first.c_str());
        o->numBytes = out[i].second.size();
        o->bytes = new unsigned char[o->numBytes];
        assert(o->bytes);
        std::copy(out[i].second.begin(), out[i].second.end(), o->bytes);
      }

      if (!kTest_toFile(&b, getOutputFilename(getTestFilename("ktest", id)).c_str())) {
        klee_warning("unable to write output test case, losing it");
      }

      for (unsigned i=0; i<b.numObjects; i++)
        delete[] b.objects[i].bytes;
      delete[] b.objects;
    }

    if (errorMessage) {
      llvm::raw_ostream *f = openTestFile(errorSuffix, id);
      *f << errorMessage;
      delete f;
    }

    if (m_pathWriter) {
      std::vector<unsigned char> concreteBranches;
      m_pathWriter->readStream(m_interpreter->getPathStreamID(state),
                               concreteBranches);
      llvm::raw_fd_ostream *f = openTestFile("path", id);
      for (std::vector<unsigned char>::iterator I = concreteBranches.begin(),
                                                E = concreteBranches.end();
           I != E; ++I) {
        *f << *I << "\n";
      }
      delete f;
    }

    if (errorMessage || WritePCs) {
      std::string constraints;
      m_interpreter->getConstraintLog(state, constraints,Interpreter::KQUERY);
      llvm::raw_ostream *f = openTestFile("pc", id);
      *f << constraints;
      delete f;
    }

    if (WriteCVCs) {
      // FIXME: If using Z3 as the core solver the emitted file is actually
      // SMT-LIBv2 not CVC which is a bit confusing
      std::string constraints;
      m_interpreter->getConstraintLog(state, constraints, Interpreter::STP);
      llvm::raw_ostream *f = openTestFile("cvc", id);
      *f << constraints;
      delete f;
    }

    if(WriteSMT2s) {
      std::string constraints;
        m_interpreter->getConstraintLog(state, constraints, Interpreter::SMTLIB2);
        llvm::raw_ostream *f = openTestFile("smt2", id);
        *f << constraints;
        delete f;
    }

    if (m_symPathWriter) {
      std::vector<unsigned char> symbolicBranches;
      m_symPathWriter->readStream(m_interpreter->getSymbolicPathStreamID(state),
                                  symbolicBranches);
      llvm::raw_fd_ostream *f = openTestFile("sym.path", id);
      for (std::vector<unsigned char>::iterator I = symbolicBranches.begin(), E = symbolicBranches.end(); I!=E; ++I) {
        *f << *I << "\n";
      }
      delete f;
    }

    if (WriteCov) {
      std::map<const std::string*, std::set<unsigned> > cov;
      m_interpreter->getCoveredLines(state, cov);
      llvm::raw_ostream *f = openTestFile("cov", id);
      for (std::map<const std::string*, std::set<unsigned> >::iterator
             it = cov.begin(), ie = cov.end();
           it != ie; ++it) {
        for (std::set<unsigned>::iterator
               it2 = it->second.begin(), ie = it->second.end();
             it2 != ie; ++it2)
          *f << *it->first << ":" << *it2 << "\n";
      }
      delete f;
    }

    if (m_testIndex == StopAfterNTests)
      m_interpreter->setHaltExecution(true);

    if (WriteTestInfo) {
      double elapsed_time = util::getWallTime() - start_time;
      llvm::raw_ostream *f = openTestFile("info", id);
      *f << "Time to generate test case: "
         << elapsed_time << "s\n";
      delete f;
    }
  }
}

  // load a .path file
void KleeHandler::loadPathFile(std::string name,
                                     std::vector<bool> &buffer) {
  std::ifstream f(name.c_str(), std::ios::in | std::ios::binary);

  if (!f.good())
    assert(0 && "unable to open path file");

  while (f.good()) {
    unsigned value;
    f >> value;
    buffer.push_back(!!value);
    f.get();
  }
}

void KleeHandler::getKTestFilesInDir(std::string directoryPath,
                                     std::vector<std::string> &results) {
#if LLVM_VERSION_CODE < LLVM_VERSION(3, 5)
  error_code ec;
#else
  std::error_code ec;
#endif
  for (llvm::sys::fs::directory_iterator i(directoryPath, ec), e; i != e && !ec;
       i.increment(ec)) {
    std::string f = (*i).path();
    if (f.substr(f.size()-6,f.size()) == ".ktest") {
          results.push_back(f);
    }
  }

  if (ec) {
    llvm::errs() << "ERROR: unable to read output directory: " << directoryPath
                 << ": " << ec.message() << "\n";
    exit(1);
  }
}

std::string KleeHandler::getRunTimeLibraryPath(const char *argv0) {
  // allow specifying the path to the runtime library
  const char *env = getenv("KLEE_RUNTIME_LIBRARY_PATH");
  if (env)
    return std::string(env);

  // Take any function from the execution binary but not main (as not allowed by
  // C++ standard)
  void *MainExecAddr = (void *)(intptr_t)getRunTimeLibraryPath;
  SmallString<128> toolRoot(
      #if LLVM_VERSION_CODE >= LLVM_VERSION(3,4)
      llvm::sys::fs::getMainExecutable(argv0, MainExecAddr)
      #else
      llvm::sys::Path::GetMainExecutable(argv0, MainExecAddr).str()
      #endif
      );

  // Strip off executable so we have a directory path
  llvm::sys::path::remove_filename(toolRoot);

  SmallString<128> libDir;

  if (strlen(KLEE_INSTALL_BIN_DIR) != 0 &&
      strlen(KLEE_INSTALL_RUNTIME_DIR) != 0 &&
      toolRoot.str().endswith(KLEE_INSTALL_BIN_DIR)) {
    KLEE_DEBUG_WITH_TYPE("klee_runtime", llvm::dbgs() <<
                         "Using installed KLEE library runtime: ");
    libDir = toolRoot.str().substr(0, toolRoot.str().size() -
                                          strlen(KLEE_INSTALL_BIN_DIR));
    llvm::sys::path::append(libDir, KLEE_INSTALL_RUNTIME_DIR);
  }
  else
  {
    KLEE_DEBUG_WITH_TYPE("klee_runtime", llvm::dbgs() <<
                         "Using build directory KLEE library runtime :");
    libDir = KLEE_DIR;
    llvm::sys::path::append(libDir,RUNTIME_CONFIGURATION);
    llvm::sys::path::append(libDir,"lib");
  }

  KLEE_DEBUG_WITH_TYPE("klee_runtime", llvm::dbgs() <<
                       libDir.c_str() << "\n");
  return libDir.str();
}

//===----------------------------------------------------------------------===//
// main Driver function
//
static std::string strip(std::string &in) {
  unsigned len = in.size();
  unsigned lead = 0, trail = len;
  while (lead<len && isspace(in[lead]))
    ++lead;
  while (trail>lead && isspace(in[trail-1]))
    --trail;
  return in.substr(lead, trail-lead);
}

static void parseArguments(int argc, char **argv) {
  cl::SetVersionPrinter(klee::printVersion);
#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 2)
  // This version always reads response files
  cl::ParseCommandLineOptions(argc, argv, " klee\n");
#else
  cl::ParseCommandLineOptions(argc, argv, " klee\n", /*ReadResponseFiles=*/ true);
#endif
}

static int initEnv(Module *mainModule) {

  /*
    nArgcP = alloc oldArgc->getType()
    nArgvV = alloc oldArgv->getType()
    store oldArgc nArgcP
    store oldArgv nArgvP
    klee_init_environment(nArgcP, nArgvP)
    nArgc = load nArgcP
    nArgv = load nArgvP
    oldArgc->replaceAllUsesWith(nArgc)
    oldArgv->replaceAllUsesWith(nArgv)
  */

  Function *mainFn = mainModule->getFunction(EntryPoint);
  if (!mainFn) {
    klee_error("'%s' function not found in module.", EntryPoint.c_str());
  }

  if (mainFn->arg_size() < 2) {
    klee_error("Cannot handle ""--posix-runtime"" when main() has less than two arguments.\n");
  }

  Instruction* firstInst = mainFn->begin()->begin();

  Value* oldArgc = mainFn->arg_begin();
  Value* oldArgv = ++mainFn->arg_begin();

  AllocaInst* argcPtr =
    new AllocaInst(oldArgc->getType(), "argcPtr", firstInst);
  AllocaInst* argvPtr =
    new AllocaInst(oldArgv->getType(), "argvPtr", firstInst);

  /* Insert void klee_init_env(int* argc, char*** argv) */
  std::vector<const Type*> params;
  params.push_back(Type::getInt32Ty(getGlobalContext()));
  params.push_back(Type::getInt32Ty(getGlobalContext()));
  Function* initEnvFn =
    cast<Function>(mainModule->getOrInsertFunction("klee_init_env",
                                                   Type::getVoidTy(getGlobalContext()),
                                                   argcPtr->getType(),
                                                   argvPtr->getType(),
                                                   NULL));
  assert(initEnvFn);
  std::vector<Value*> args;
  args.push_back(argcPtr);
  args.push_back(argvPtr);
#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 0)
  Instruction* initEnvCall = CallInst::Create(initEnvFn, args,
					      "", firstInst);
#else
  Instruction* initEnvCall = CallInst::Create(initEnvFn, args.begin(), args.end(),
					      "", firstInst);
#endif
  Value *argc = new LoadInst(argcPtr, "newArgc", firstInst);
  Value *argv = new LoadInst(argvPtr, "newArgv", firstInst);

  oldArgc->replaceAllUsesWith(argc);
  oldArgv->replaceAllUsesWith(argv);

  new StoreInst(oldArgc, argcPtr, initEnvCall);
  new StoreInst(oldArgv, argvPtr, initEnvCall);

  return 0;
}


// This is a terrible hack until we get some real modeling of the
// system. All we do is check the undefined symbols and warn about
// any "unrecognized" externals and about any obviously unsafe ones.

// Symbols we explicitly support
static const char *modelledExternals[] = {
  "_ZTVN10__cxxabiv117__class_type_infoE",
  "_ZTVN10__cxxabiv120__si_class_type_infoE",
  "_ZTVN10__cxxabiv121__vmi_class_type_infoE",

  // special functions
  "_assert",
  "__assert_fail",
  "__assert_rtn",
  "calloc",
  "_exit",
  "exit",
  "free",
  "abort",
  "klee_abort",
  "klee_assume",
  "klee_check_memory_access",
  "klee_define_fixed_object",
  "klee_get_errno",
  "klee_get_valuef",
  "klee_get_valued",
  "klee_get_valuel",
  "klee_get_valuell",
  "klee_get_value_i32",
  "klee_get_value_i64",
  "klee_get_obj_size",
  "klee_is_symbolic",
  "klee_make_symbolic",
  "klee_mark_global",
  "klee_merge",
  "klee_prefer_cex",
  "klee_print_expr",
  "klee_print_range",
  "klee_report_error",
  "klee_set_forking",
  "klee_silent_exit",
  "klee_warning",
  "klee_warning_once",
  "klee_alias_function",
  "klee_stack_trace",
#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 1)
  "llvm.dbg.declare",
  "llvm.dbg.value",
#endif
  "llvm.va_start",
  "llvm.va_end",
  "malloc",
  "realloc",
  "_ZdaPv",
  "_ZdlPv",
  "_Znaj",
  "_Znwj",
  "_Znam",
  "_Znwm",
  "__ubsan_handle_add_overflow",
  "__ubsan_handle_sub_overflow",
  "__ubsan_handle_mul_overflow",
  "__ubsan_handle_divrem_overflow",
  "tracerx_debug_subsumption",
  "tracerx_debug_subsumption_off",
  "tracerx_debug_state",
  "tracerx_debug_state_off",
  "tracerx_memo",
  "tracerx_memo_check",
  "tracerx_node_tag"
};
// Symbols we aren't going to warn about
static const char *dontCareExternals[] = {
#if 0
  // stdio
  "fprintf",
  "fflush",
  "fopen",
  "fclose",
  "fputs_unlocked",
  "putchar_unlocked",
  "vfprintf",
  "fwrite",
  "puts",
  "printf",
  "stdin",
  "stdout",
  "stderr",
  "_stdio_term",
  "__errno_location",
  "fstat",
#endif

  // static information, pretty ok to return
  "getegid",
  "geteuid",
  "getgid",
  "getuid",
  "getpid",
  "gethostname",
  "getpgrp",
  "getppid",
  "getpagesize",
  "getpriority",
  "getgroups",
  "getdtablesize",
  "getrlimit",
  "getrlimit64",
  "getcwd",
  "getwd",
  "gettimeofday",
  "uname",

  // fp stuff we just don't worry about yet
  "frexp",
  "ldexp",
  "__isnan",
  "__signbit",
};
// Extra symbols we aren't going to warn about with klee-libc
static const char *dontCareKlee[] = {
  "__ctype_b_loc",
  "__ctype_get_mb_cur_max",

  // io system calls
  "open",
  "write",
  "read",
  "close",
};
// Extra symbols we aren't going to warn about with uclibc
static const char *dontCareUclibc[] = {
  "__dso_handle",

  // Don't warn about these since we explicitly commented them out of
  // uclibc.
  "printf",
  "vprintf"
};
// Symbols we consider unsafe
static const char *unsafeExternals[] = {
  "fork", // oh lord
  "exec", // heaven help us
  "error", // calls _exit
  "raise", // yeah
  "kill", // mmmhmmm
};
#define NELEMS(array) (sizeof(array)/sizeof(array[0]))
void externalsAndGlobalsCheck(const Module *m) {
  std::map<std::string, bool> externals;
  std::set<std::string> modelled(modelledExternals,
                                 modelledExternals+NELEMS(modelledExternals));
  std::set<std::string> dontCare(dontCareExternals,
                                 dontCareExternals+NELEMS(dontCareExternals));
  std::set<std::string> unsafe(unsafeExternals,
                               unsafeExternals+NELEMS(unsafeExternals));

  switch (Libc) {
  case KleeLibc:
    dontCare.insert(dontCareKlee, dontCareKlee+NELEMS(dontCareKlee));
    break;
  case UcLibc:
    dontCare.insert(dontCareUclibc,
                    dontCareUclibc+NELEMS(dontCareUclibc));
    break;
  case NoLibc: /* silence compiler warning */
    break;
  }

  if (WithPOSIXRuntime)
    dontCare.insert("syscall");

  for (Module::const_iterator fnIt = m->begin(), fn_ie = m->end();
       fnIt != fn_ie; ++fnIt) {
    if (fnIt->isDeclaration() && !fnIt->use_empty())
      externals.insert(std::make_pair(fnIt->getName(), false));
    for (Function::const_iterator bbIt = fnIt->begin(), bb_ie = fnIt->end();
         bbIt != bb_ie; ++bbIt) {
      for (BasicBlock::const_iterator it = bbIt->begin(), ie = bbIt->end();
           it != ie; ++it) {
        if (const CallInst *ci = dyn_cast<CallInst>(it)) {
          if (isa<InlineAsm>(ci->getCalledValue())) {
            klee_warning_once(&*fnIt,
                              "function \"%s\" has inline asm",
                              fnIt->getName().data());
          }
        }
      }
    }
  }
  for (Module::const_global_iterator
         it = m->global_begin(), ie = m->global_end();
       it != ie; ++it)
    if (it->isDeclaration() && !it->use_empty())
      externals.insert(std::make_pair(it->getName(), true));
  // and remove aliases (they define the symbol after global
  // initialization)
  for (Module::const_alias_iterator
         it = m->alias_begin(), ie = m->alias_end();
       it != ie; ++it) {
    std::map<std::string, bool>::iterator it2 =
      externals.find(it->getName());
    if (it2!=externals.end())
      externals.erase(it2);
  }

  std::map<std::string, bool> foundUnsafe;
  for (std::map<std::string, bool>::iterator
         it = externals.begin(), ie = externals.end();
       it != ie; ++it) {
    const std::string &ext = it->first;
    if (!modelled.count(ext) && (WarnAllExternals ||
                                 !dontCare.count(ext))) {
      if (unsafe.count(ext)) {
        foundUnsafe.insert(*it);
      } else {
        klee_warning("undefined reference to %s: %s",
                     it->second ? "variable" : "function",
                     ext.c_str());
      }
    }
  }

  for (std::map<std::string, bool>::iterator
         it = foundUnsafe.begin(), ie = foundUnsafe.end();
       it != ie; ++it) {
    const std::string &ext = it->first;
    klee_warning("undefined reference to %s: %s (UNSAFE)!",
                 it->second ? "variable" : "function",
                 ext.c_str());
  }
}

static Interpreter *theInterpreter = 0;

static bool interrupted = false;

// Pulled out so it can be easily called from a debugger.
extern "C"
void halt_execution() {
  theInterpreter->setHaltExecution(true);
}

extern "C"
void stop_forking() {
  theInterpreter->setInhibitForking(true);
}

static void interrupt_handle() {
  if (!interrupted && theInterpreter) {
    llvm::errs() << "KLEE: ctrl-c detected, requesting interpreter to halt.\n";
    halt_execution();
    sys::SetInterruptFunction(interrupt_handle);
  } else {
    llvm::errs() << "KLEE: ctrl-c detected, exiting.\n";
    exit(1);
  }
  interrupted = true;
}

static void interrupt_handle_watchdog() {
  // just wait for the child to finish
}

// This is a temporary hack. If the running process has access to
// externals then it can disable interrupts, which screws up the
// normal "nice" watchdog termination process. We try to request the
// interpreter to halt using this mechanism as a last resort to save
// the state data before going ahead and killing it.
static void halt_via_gdb(int pid) {
  char buffer[256];
  sprintf(buffer,
          "gdb --batch --eval-command=\"p halt_execution()\" "
          "--eval-command=detach --pid=%d &> /dev/null",
          pid);
  //  fprintf(stderr, "KLEE: WATCHDOG: running: %s\n", buffer);
  if (system(buffer)==-1)
    perror("system");
}

// returns the end of the string put in buf
static char *format_tdiff(char *buf, long seconds)
{
  assert(seconds >= 0);

  long minutes = seconds / 60;  seconds %= 60;
  long hours   = minutes / 60;  minutes %= 60;
  long days    = hours   / 24;  hours   %= 24;

  buf = strrchr(buf, '\0');
  if (days > 0) buf += sprintf(buf, "%ld days, ", days);
  buf += sprintf(buf, "%02ld:%02ld:%02ld", hours, minutes, seconds);
  return buf;
}

#ifndef SUPPORT_KLEE_UCLIBC
static llvm::Module *linkWithUclibc(llvm::Module *mainModule, StringRef libDir) {
  klee_error("invalid libc, no uclibc support!\n");
}
#else
static void replaceOrRenameFunction(llvm::Module *module,
		const char *old_name, const char *new_name)
{
  Function *f, *f2;
  f = module->getFunction(new_name);
  f2 = module->getFunction(old_name);
  if (f2) {
    if (f) {
      f2->replaceAllUsesWith(f);
      f2->eraseFromParent();
    } else {
      f2->setName(new_name);
      assert(f2->getName() == new_name);
    }
  }
}
static llvm::Module *linkWithUclibc(llvm::Module *mainModule, StringRef libDir) {
  // Ensure that klee-uclibc exists
  SmallString<128> uclibcBCA(libDir);
  llvm::sys::path::append(uclibcBCA, KLEE_UCLIBC_BCA_NAME);

  bool uclibcExists=false;
  llvm::sys::fs::exists(uclibcBCA.c_str(), uclibcExists);
  if (!uclibcExists)
    klee_error("Cannot find klee-uclibc : %s", uclibcBCA.c_str());

  Function *f;
  // force import of __uClibc_main
  mainModule->getOrInsertFunction("__uClibc_main",
                                  FunctionType::get(Type::getVoidTy(getGlobalContext()),
                                               std::vector<LLVM_TYPE_Q Type*>(),
                                                    true));

  // force various imports
  if (WithPOSIXRuntime) {
    LLVM_TYPE_Q llvm::Type *i8Ty = Type::getInt8Ty(getGlobalContext());
    mainModule->getOrInsertFunction("realpath",
                                    PointerType::getUnqual(i8Ty),
                                    PointerType::getUnqual(i8Ty),
                                    PointerType::getUnqual(i8Ty),
                                    NULL);
    mainModule->getOrInsertFunction("getutent",
                                    PointerType::getUnqual(i8Ty),
                                    NULL);
    mainModule->getOrInsertFunction("__fgetc_unlocked",
                                    Type::getInt32Ty(getGlobalContext()),
                                    PointerType::getUnqual(i8Ty),
                                    NULL);
    mainModule->getOrInsertFunction("__fputc_unlocked",
                                    Type::getInt32Ty(getGlobalContext()),
                                    Type::getInt32Ty(getGlobalContext()),
                                    PointerType::getUnqual(i8Ty),
                                    NULL);
  }

  f = mainModule->getFunction("__ctype_get_mb_cur_max");
  if (f) f->setName("_stdlib_mb_cur_max");

  // Strip of asm prefixes for 64 bit versions because they are not
  // present in uclibc and we want to make sure stuff will get
  // linked. In the off chance that both prefixed and unprefixed
  // versions are present in the module, make sure we don't create a
  // naming conflict.
  for (Module::iterator fi = mainModule->begin(), fe = mainModule->end();
       fi != fe; ++fi) {
    Function *f = fi;
    const std::string &name = f->getName();
    if (name[0]=='\01') {
      unsigned size = name.size();
      if (name[size-2]=='6' && name[size-1]=='4') {
        std::string unprefixed = name.substr(1);

        // See if the unprefixed version exists.
        if (Function *f2 = mainModule->getFunction(unprefixed)) {
          f->replaceAllUsesWith(f2);
          f->eraseFromParent();
        } else {
          f->setName(unprefixed);
        }
      }
    }
  }

  mainModule = klee::linkWithLibrary(mainModule, uclibcBCA.c_str());
  assert(mainModule && "unable to link with uclibc");


  replaceOrRenameFunction(mainModule, "__libc_open", "open");
  replaceOrRenameFunction(mainModule, "__libc_fcntl", "fcntl");

  // Take care of fortified functions
  replaceOrRenameFunction(mainModule, "__fprintf_chk", "fprintf");

  // XXX we need to rearchitect so this can also be used with
  // programs externally linked with uclibc.

  // We now need to swap things so that __uClibc_main is the entry
  // point, in such a way that the arguments are passed to
  // __uClibc_main correctly. We do this by renaming the user main
  // and generating a stub function to call __uClibc_main. There is
  // also an implicit cooperation in that runFunctionAsMain sets up
  // the environment arguments to what uclibc expects (following
  // argv), since it does not explicitly take an envp argument.
  Function *userMainFn = mainModule->getFunction(EntryPoint);
  assert(userMainFn && "unable to get user main");
  Function *uclibcMainFn = mainModule->getFunction("__uClibc_main");
  assert(uclibcMainFn && "unable to get uclibc main");
  userMainFn->setName("__user_main");

  const FunctionType *ft = uclibcMainFn->getFunctionType();
  assert(ft->getNumParams() == 7);

  std::vector<LLVM_TYPE_Q Type*> fArgs;
  fArgs.push_back(ft->getParamType(1)); // argc
  fArgs.push_back(ft->getParamType(2)); // argv
  Function *stub = Function::Create(FunctionType::get(Type::getInt32Ty(getGlobalContext()), fArgs, false),
                                    GlobalVariable::ExternalLinkage,
                                    EntryPoint,
                                    mainModule);
  BasicBlock *bb = BasicBlock::Create(getGlobalContext(), "entry", stub);

  std::vector<llvm::Value*> args;
  args.push_back(llvm::ConstantExpr::getBitCast(userMainFn,
                                                ft->getParamType(0)));
  args.push_back(stub->arg_begin()); // argc
  args.push_back(++stub->arg_begin()); // argv
  args.push_back(Constant::getNullValue(ft->getParamType(3))); // app_init
  args.push_back(Constant::getNullValue(ft->getParamType(4))); // app_fini
  args.push_back(Constant::getNullValue(ft->getParamType(5))); // rtld_fini
  args.push_back(Constant::getNullValue(ft->getParamType(6))); // stack_end
#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 0)
  CallInst::Create(uclibcMainFn, args, "", bb);
#else
  CallInst::Create(uclibcMainFn, args.begin(), args.end(), "", bb);
#endif

  new UnreachableInst(getGlobalContext(), bb);

  klee_message("NOTE: Using klee-uclibc : %s", uclibcBCA.c_str());
  return mainModule;
}
#endif

int main(int argc, char **argv, char **envp) {
  atexit(llvm_shutdown);  // Call llvm_shutdown() on exit.

  llvm::InitializeNativeTarget();

  parseArguments(argc, argv);
  sys::PrintStackTraceOnErrorSignal();

  if (Watchdog) {
    if (MaxTime==0) {
      klee_error("--watchdog used without --max-time");
    }

    int pid = fork();
    if (pid<0) {
      klee_error("unable to fork watchdog");
    } else if (pid) {
      klee_message("KLEE: WATCHDOG: watching %d\n", pid);
      fflush(stderr);
      sys::SetInterruptFunction(interrupt_handle_watchdog);

      double nextStep = util::getWallTime() + MaxTime*1.1;
      int level = 0;

      // Simple stupid code...
      while (1) {
        sleep(1);

        int status, res = waitpid(pid, &status, WNOHANG);

        if (res < 0) {
          if (errno==ECHILD) { // No child, no need to watch but
                               // return error since we didn't catch
                               // the exit.
            klee_warning("KLEE: watchdog exiting (no child)\n");
            return 1;
          } else if (errno!=EINTR) {
            perror("watchdog waitpid");
            exit(1);
          }
        } else if (res==pid && WIFEXITED(status)) {
          return WEXITSTATUS(status);
        } else {
          double time = util::getWallTime();

          if (time > nextStep) {
            ++level;

            if (level==1) {
              klee_warning(
                  "KLEE: WATCHDOG: time expired, attempting halt via INT\n");
              kill(pid, SIGINT);
            } else if (level==2) {
              klee_warning(
                  "KLEE: WATCHDOG: time expired, attempting halt via gdb\n");
              halt_via_gdb(pid);
            } else {
              klee_warning(
                  "KLEE: WATCHDOG: kill(9)ing child (I tried to be nice)\n");
              kill(pid, SIGKILL);
              return 1; // what more can we do
            }

            // Ideally this triggers a dump, which may take a while,
            // so try and give the process extra time to clean up.
            nextStep = util::getWallTime() + std::max(15., MaxTime*.1);
          }
        }
      }

      return 0;
    }
  }

  sys::SetInterruptFunction(interrupt_handle);

  // Load the bytecode...
  std::string ErrorMsg;
  Module *mainModule = 0;
#if LLVM_VERSION_CODE < LLVM_VERSION(3, 5)
  OwningPtr<MemoryBuffer> BufferPtr;
  error_code ec=MemoryBuffer::getFileOrSTDIN(InputFile.c_str(), BufferPtr);
  if (ec) {
    klee_error("error loading program '%s': %s", InputFile.c_str(),
               ec.message().c_str());
  }

  mainModule = getLazyBitcodeModule(BufferPtr.get(), getGlobalContext(), &ErrorMsg);

  if (mainModule) {
    if (mainModule->MaterializeAllPermanently(&ErrorMsg)) {
      delete mainModule;
      mainModule = 0;
    }
  }
  if (!mainModule)
    klee_error("error loading program '%s': %s", InputFile.c_str(),
               ErrorMsg.c_str());
#else
  auto Buffer = MemoryBuffer::getFileOrSTDIN(InputFile.c_str());
  if (!Buffer)
    klee_error("error loading program '%s': %s", InputFile.c_str(),
               Buffer.getError().message().c_str());

  auto mainModuleOrError = getLazyBitcodeModule(Buffer->get(), getGlobalContext());

  if (!mainModuleOrError) {
    klee_error("error loading program '%s': %s", InputFile.c_str(),
               mainModuleOrError.getError().message().c_str());
  }
  else {
    // The module has taken ownership of the MemoryBuffer so release it
    // from the std::unique_ptr
    Buffer->release();
  }

  mainModule = *mainModuleOrError;
  if (auto ec = mainModule->materializeAllPermanently()) {
    klee_error("error loading program '%s': %s", InputFile.c_str(),
               ec.message().c_str());
  }
#endif

  if (WithPOSIXRuntime) {
    int r = initEnv(mainModule);
    if (r != 0)
      return r;
  }

  std::string LibraryDir = KleeHandler::getRunTimeLibraryPath(argv[0]);
  Interpreter::ModuleOptions Opts(LibraryDir.c_str(), EntryPoint,
                                  /*Optimize=*/OptimizeModule,
                                  /*CheckDivZero=*/CheckDivZero,
                                  /*CheckOvershift=*/CheckOvershift);

  switch (Libc) {
  case NoLibc: /* silence compiler warning */
    break;

  case KleeLibc: {
    // FIXME: Find a reasonable solution for this.
    SmallString<128> Path(Opts.LibraryDir);
#if LLVM_VERSION_CODE >= LLVM_VERSION(3,3)
    llvm::sys::path::append(Path, "klee-libc.bc");
#else
    llvm::sys::path::append(Path, "libklee-libc.bca");
#endif
    mainModule = klee::linkWithLibrary(mainModule, Path.c_str());
    assert(mainModule && "unable to link with klee-libc");
    break;
  }

  case UcLibc:
    mainModule = linkWithUclibc(mainModule, LibraryDir);
    break;
  }

  if (WithPOSIXRuntime) {
    SmallString<128> Path(Opts.LibraryDir);
    llvm::sys::path::append(Path, "libkleeRuntimePOSIX.bca");
    klee_message("NOTE: Using model: %s", Path.c_str());
    mainModule = klee::linkWithLibrary(mainModule, Path.c_str());
    assert(mainModule && "unable to link with simple model");
  }

  std::vector<std::string>::iterator libs_it;
  std::vector<std::string>::iterator libs_ie;
  for (libs_it = LinkLibraries.begin(), libs_ie = LinkLibraries.end();
       libs_it != libs_ie; ++libs_it) {
    const char *libFilename = libs_it->c_str();
    klee_message("Linking in library: %s.\n", libFilename);
    mainModule = klee::linkWithLibrary(mainModule, libFilename);
  }
  // Get the desired main function.  klee_main initializes uClibc
  // locale and other data and then calls main.
  Function *mainFn = mainModule->getFunction(EntryPoint);
  if (!mainFn) {
    klee_error("'%s' function not found in module.", EntryPoint.c_str());
  }

  // FIXME: Change me to std types.
  int pArgc;
  char **pArgv;
  char **pEnvp;
  if (Environ != "") {
    std::vector<std::string> items;
    std::ifstream f(Environ.c_str());
    if (!f.good())
      klee_error("unable to open --environ file: %s", Environ.c_str());
    while (!f.eof()) {
      std::string line;
      std::getline(f, line);
      line = strip(line);
      if (!line.empty())
        items.push_back(line);
    }
    f.close();
    pEnvp = new char *[items.size()+1];
    unsigned i=0;
    for (; i != items.size(); ++i)
      pEnvp[i] = strdup(items[i].c_str());
    pEnvp[i] = 0;
  } else {
    pEnvp = envp;
  }

  pArgc = InputArgv.size() + 1;
  pArgv = new char *[pArgc];
  for (unsigned i=0; i<InputArgv.size()+1; i++) {
    std::string &arg = (i==0 ? InputFile : InputArgv[i-1]);
    unsigned size = arg.size() + 1;
    char *pArg = new char[size];

    std::copy(arg.begin(), arg.end(), pArg);
    pArg[size - 1] = 0;

    pArgv[i] = pArg;
  }

  std::vector<bool> replayPath;

  if (ReplayPathFile != "") {
    KleeHandler::loadPathFile(ReplayPathFile, replayPath);
  }

  Interpreter::InterpreterOptions IOpts;
  IOpts.MakeConcreteSymbolic = MakeConcreteSymbolic;
  KleeHandler *handler = new KleeHandler(pArgc, pArgv);
  Interpreter *interpreter =
    theInterpreter = Interpreter::create(IOpts, handler);
  handler->setInterpreter(interpreter);

  for (int i=0; i<argc; i++) {
    handler->getInfoStream() << argv[i] << (i + 1 < argc ? " " : "\n");
  }
  handler->getInfoStream() << "PID: " << getpid() << "\n";

  const Module *finalModule =
    interpreter->setModule(mainModule, Opts);
  externalsAndGlobalsCheck(finalModule);

  if (ReplayPathFile != "") {
    interpreter->setReplayPath(&replayPath);
  }

  char buf[256];
  time_t t[2];
  t[0] = time(NULL);
  strftime(buf, sizeof(buf), "Started: %Y-%m-%d %H:%M:%S\n", localtime(&t[0]));
  handler->getInfoStream() << buf;
  handler->getInfoStream().flush();

  if (!ReplayKTestDir.empty() || !ReplayKTestFile.empty()) {
    assert(SeedOutFile.empty());
    assert(SeedOutDir.empty());

    std::vector<std::string> kTestFiles = ReplayKTestFile;
    for (std::vector<std::string>::iterator it = ReplayKTestDir.begin(),
                                            ie = ReplayKTestDir.end();
         it != ie; ++it)
      KleeHandler::getKTestFilesInDir(*it, kTestFiles);
    std::vector<KTest*> kTests;
    for (std::vector<std::string>::iterator it = kTestFiles.begin(),
                                            ie = kTestFiles.end();
         it != ie; ++it) {
      KTest *out = kTest_fromFile(it->c_str());
      if (out) {
        kTests.push_back(out);
      } else {
        klee_warning("unable to open: %s\n", (*it).c_str());
      }
    }

    if (RunInDir != "") {
      int res = chdir(RunInDir.c_str());
      if (res < 0) {
        klee_error("Unable to change directory to: %s - %s", RunInDir.c_str(),
                   sys::StrError(errno).c_str());
      }
    }

    unsigned i=0;
    for (std::vector<KTest*>::iterator
           it = kTests.begin(), ie = kTests.end();
         it != ie; ++it) {
      KTest *out = *it;
      interpreter->setReplayKTest(out);
      llvm::errs() << "KLEE: replaying: " << *it << " (" << kTest_numBytes(out)
                   << " bytes)"
                   << " (" << ++i << "/" << kTestFiles.size() << ")\n";
      // XXX should put envp in .ktest ?
      interpreter->runFunctionAsMain(mainFn, out->numArgs, out->args, pEnvp);
      if (interrupted) break;
    }
    interpreter->setReplayKTest(0);
    while (!kTests.empty()) {
      kTest_free(kTests.back());
      kTests.pop_back();
    }
  } else {
    std::vector<KTest *> seeds;
    for (std::vector<std::string>::iterator
           it = SeedOutFile.begin(), ie = SeedOutFile.end();
         it != ie; ++it) {
      KTest *out = kTest_fromFile(it->c_str());
      if (!out) {
        klee_error("unable to open: %s\n", (*it).c_str());
      }
      seeds.push_back(out);
    }
    for (std::vector<std::string>::iterator
           it = SeedOutDir.begin(), ie = SeedOutDir.end();
         it != ie; ++it) {
      std::vector<std::string> kTestFiles;
      KleeHandler::getKTestFilesInDir(*it, kTestFiles);
      for (std::vector<std::string>::iterator it2 = kTestFiles.begin(),
                                              ie = kTestFiles.end();
           it2 != ie; ++it2) {
        KTest *out = kTest_fromFile(it2->c_str());
        if (!out) {
          klee_error("unable to open: %s\n", (*it2).c_str());
        }
        seeds.push_back(out);
      }
      if (kTestFiles.empty()) {
        klee_error("seeds directory is empty: %s\n", (*it).c_str());
      }
    }

    if (!seeds.empty()) {
      klee_message("KLEE: using %lu seeds\n", seeds.size());
      interpreter->useSeeds(&seeds);
    }
    if (RunInDir != "") {
      int res = chdir(RunInDir.c_str());
      if (res < 0) {
        klee_error("Unable to change directory to: %s - %s", RunInDir.c_str(),
                   sys::StrError(errno).c_str());
      }
    }
    if (BBCoverage > 0)
      interpreter->InputFile = InputFile;
    interpreter->runFunctionAsMain(mainFn, pArgc, pArgv, pEnvp);

    while (!seeds.empty()) {
      kTest_free(seeds.back());
      seeds.pop_back();
    }
  }

  t[1] = time(NULL);
  strftime(buf, sizeof(buf), "Finished: %Y-%m-%d %H:%M:%S\n", localtime(&t[1]));
  handler->getInfoStream() << buf;

  strcpy(buf, "Elapsed: ");
  strcpy(format_tdiff(buf, t[1] - t[0]), "\n");
  handler->getInfoStream() << buf;

  // Free all the args.
  for (unsigned i=0; i<InputArgv.size()+1; i++)
    delete[] pArgv[i];
  delete[] pArgv;

  delete interpreter;

  uint64_t queries =
    *theStatisticManager->getStatisticByName("Queries");
  uint64_t queriesValid =
    *theStatisticManager->getStatisticByName("QueriesValid");
  uint64_t queriesInvalid =
    *theStatisticManager->getStatisticByName("QueriesInvalid");
  uint64_t queryCounterexamples =
    *theStatisticManager->getStatisticByName("QueriesCEX");
  uint64_t queryConstructs =
    *theStatisticManager->getStatisticByName("QueriesConstructs");
  uint64_t instructions =
    *theStatisticManager->getStatisticByName("Instructions");
  uint64_t forks =
    *theStatisticManager->getStatisticByName("Forks");

  handler->getInfoStream()
    << "KLEE: done: explored paths = " << 1 + forks << "\n";

  // Write some extra information in the info file which users won't
  // necessarily care about or understand.
  if (queries)
    handler->getInfoStream()
      << "KLEE: done: avg. constructs per query = "
                             << queryConstructs / queries << "\n";
  handler->getInfoStream()
    << "KLEE: done: total queries = " << queries << "\n"
    << "KLEE: done: valid queries = " << queriesValid << "\n"
    << "KLEE: done: invalid queries = " << queriesInvalid << "\n"
    << "KLEE: done: query cex = " << queryCounterexamples << "\n";

  std::stringstream stats;
  if (INTERPOLATION_ENABLED) {
    stats << handler->getSubsumptionStats();
  }

  stats << "\n";
  stats << "KLEE: done: total instructions = "
        << instructions << "\n";
  stats << "KLEE: done: completed paths = "
        << handler->getNumPathsExplored() << ", among which\n";
  stats << "KLEE: done:     early-terminating paths (instruction time limit, solver timeout, max-depth reached) = "
        << handler->getEarlyTermination() << "\n";

  if (INTERPOLATION_ENABLED) {
    stats << "KLEE: done:     average branching depth of completed paths = "
          << (double)(handler->getTotalBranchingDepthOnExitTermination() +
                      handler->getTotalBranchingDepthOnEarlyTermination() +
                      handler->getTotalBranchingDepthOnErrorTermination()) /
                 (double)(handler->getExitTermination() +
                          handler->getEarlyTermination() +
                          handler->getErrorTermination()) << "\n";
    if (handler->getSubsumptionTermination() == 0.0) {
      stats << "KLEE: done:     average branching depth of subsumed paths = "
            << 0 << "\n";
    } else {
      stats << "KLEE: done:     average branching depth of subsumed paths = "
            << (double)handler->getTotalBranchingDepthOnSubsumption() /
                   (double)handler->getSubsumptionTermination() << "\n";
    }
  }

  if (INTERPOLATION_ENABLED) {
    stats << "KLEE: done:     average instructions of completed paths = "
          << (double)(handler->getTotalInstructionsDepthOnExitTermination() +
                      handler->getTotalInstructionsDepthOnEarlyTermination() +
                      handler->getTotalInstructionsDepthOnErrorTermination()) /
                 (double)(handler->getExitTermination() +
                          handler->getEarlyTermination() +
                          handler->getErrorTermination()) << "\n";
    if (handler->getSubsumptionTermination() == 0.0) {
      stats << "KLEE: done:     average instructions of subsumed paths = " << 0
            << "\n";
    } else {
      stats << "KLEE: done:     average instructions of subsumed paths = "
            << (double)
                   handler->getTotalInstructionPathsExploredOnSubsumption() /
                   (double)handler->getSubsumptionTermination() << "\n";
    }
  }

  if (INTERPOLATION_ENABLED)
    stats << "KLEE: done:     subsumed paths = "
          << handler->getSubsumptionTermination() << "\n";
  stats << "KLEE: done:     error paths = "
        << handler->getErrorTermination() << "\n";
  stats << "KLEE: done:     program exit paths = "
        << handler->getExitTermination() << "\n";
  stats << "KLEE: done: generated tests = "
        << handler->getNumTestCases() << ", among which\n";
  stats << "KLEE: done:     early-terminating tests (instruction time limit, solver timeout, max-depth reached) = "
        << handler->getEarlyTerminationTest() << "\n";
#ifdef ENABLE_Z3
  if (SubsumedTest)
    stats << "KLEE: done:     subsumed tests = "
          << handler->getSubsumptionTerminationTest() << "\n";
#endif
  stats << "KLEE: done:     error tests = "
        << handler->getErrorTerminationTest() << "\n";
  stats << "KLEE: done:     program exit tests = "
        << handler->getExitTerminationTest() << "\n";

  if (INTERPOLATION_ENABLED) {
    stats << "\n";
    stats << "KLEE: done: NOTE:\n";
    stats << "KLEE: done:     Subsumed paths / tests counts are "
             "nondeterministic for\n";
    stats << "KLEE: done:     programs with dynamically-allocated memory such "
             "as those\n";
    stats << "KLEE: done:     using malloc, since KLEE may reuse the address "
             "of the\n";
    stats << "KLEE: done:     same malloc calls in different paths. This "
             "nondeterminism\n";
    stats << "KLEE: done:     does not cause loss of error reports.\n";
  }

  bool useColors = llvm::errs().is_displayed();
  if (useColors)
    llvm::errs().changeColor(llvm::raw_ostream::GREEN,
                             /*bold=*/true,
                             /*bg=*/false);

  llvm::errs() << stats.str();

  if (useColors)
    llvm::errs().resetColor();

  handler->getInfoStream() << stats.str();

#if LLVM_VERSION_CODE < LLVM_VERSION(3, 5)
  // FIXME: This really doesn't look right
  // This is preventing the module from being
  // deleted automatically
  BufferPtr.take();
#endif
  delete handler;

  return 0;
}
