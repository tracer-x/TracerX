#!/bin/bash -x
# Make sure we exit if there is a failure
set -e
: ${SOLVERS?"Solvers must be specified"}

# Calculate LLVM branch name to retrieve missing files from
SVN_BRANCH="release_$( echo ${LLVM_VERSION} | sed 's/\.//g')"

###############################################################################
# Select the compiler to use to generate LLVM bitcode
###############################################################################
KLEE_CC="$(which clang-"${LLVM_VERSION}")"
KLEE_CXX="$(which clang++-"${LLVM_VERSION}")"

###############################################################################
# klee-uclibc
###############################################################################
if [ "${KLEE_UCLIBC}" != "0" ]; then
    git clone --depth 1 -b ${KLEE_UCLIBC} git://github.com/klee/klee-uclibc.git
    cd klee-uclibc
    ./configure --make-llvm-lib --with-cc "${KLEE_CC}" --with-llvm-config /usr/bin/llvm-config-${LLVM_VERSION}
    make
    KLEE_UCLIBC_CONFIGURE_OPTION="--with-uclibc=$(pwd) --enable-posix-runtime"
    cd ../
else
    KLEE_UCLIBC_CONFIGURE_OPTION=""
fi

COVERAGE_FLAGS=""
if [ ${COVERAGE} -eq 1 ]; then
    COVERAGE_FLAGS='-fprofile-arcs -ftest-coverage'
fi


###############################################################################
# Handle setting up solver configure flags for KLEE
###############################################################################
KLEE_Z3_CONFIGURE_OPTION=""
KLEE_STP_CONFIGURE_OPTION=""
KLEE_METASMT_CONFIGURE_OPTION=""
SOLVER_LIST=$(echo "${SOLVERS}" | sed 's/:/ /')

for solver in ${SOLVER_LIST}; do
  echo "Setting configuration option for ${solver}"
  case ${solver} in
  STP)
    KLEE_STP_CONFIGURE_OPTION="--with-stp=${BUILD_DIR}/stp/build"
    ;;
  Z3)
    echo "Z3"
    KLEE_Z3_CONFIGURE_OPTION="--with-z3=/tmp/z3-4.8.4-install/"
    ;;
  metaSMT)
    echo "metaSMT"
    KLEE_METASMT_CONFIGURE_OPTION="--with-metasmt=${BUILD_DIR}/metaSMT/build/root --with-metasmt-default-backend=${METASMT_DEFAULT}"
    ;;
  *)
    echo "Unknown solver ${solver}"
    exit 1
  esac
done


TCMALLOC_OPTION=$([ "${USE_TCMALLOC:-0}" == 1 ] && echo "--with-tcmalloc" || echo "--without-tcmalloc")
###############################################################################
# KLEE
###############################################################################
mkdir -p klee
cd klee

# Build KLEE
# Note: ENABLE_SHARED=0 is required because llvm-2.9 is incorectly packaged
# and is missing the shared library that was supposed to be built that the build
# system will try to use by default.
${KLEE_SRC}/configure --with-llvmsrc="${LLVM_SRC_DIR}" \
            --with-llvmobj=/usr/lib/llvm-${LLVM_VERSION}/build \
            --with-llvmcc=${KLEE_CC} \
            --with-llvmcxx=${KLEE_CXX} \
            ${KLEE_STP_CONFIGURE_OPTION} \
            ${KLEE_Z3_CONFIGURE_OPTION} \
            ${KLEE_METASMT_CONFIGURE_OPTION} \
            ${KLEE_UCLIBC_CONFIGURE_OPTION} \
            ${TCMALLOC_OPTION} \
            CXXFLAGS="${COVERAGE_FLAGS}" \
            && make -j "$(nproc)" DISABLE_ASSERTIONS=${DISABLE_ASSERTIONS} \
                    ENABLE_OPTIMIZED=${ENABLE_OPTIMIZED} \
                    ENABLE_SHARED=0

# FIXME: skip all tests in build script
exit 0

###############################################################################
# Testing
###############################################################################
set +e # We want to let all the tests run before we exit

###############################################################################
# Unit tests
###############################################################################
# The unittests makefile doesn't seem to have been packaged so get it from SVN
sudo mkdir -p /usr/lib/llvm-${LLVM_VERSION}/build/unittests/
svn export  http://llvm.org/svn/llvm-project/llvm/branches/${SVN_BRANCH}/unittests/Makefile.unittest \
    ../Makefile.unittest
sudo mv ../Makefile.unittest /usr/lib/llvm-${LLVM_VERSION}/build/unittests/

make unittests \
    DISABLE_ASSERTIONS=${DISABLE_ASSERTIONS} \
    ENABLE_OPTIMIZED=${ENABLE_OPTIMIZED} \
    ENABLE_SHARED=0
RETURN="$?"

###############################################################################
# lit tests
###############################################################################
# Note can't use ``make check`` because llvm-lit is not available
cd test
# The build system needs to generate this file before we can run lit
make lit.site.cfg \
    DISABLE_ASSERTIONS=${DISABLE_ASSERTIONS} \
    ENABLE_OPTIMIZED=${ENABLE_OPTIMIZED} \
    ENABLE_SHARED=0

set +e # We want to let all the tests run before we exit
lit -v .
RETURN="${RETURN}$?"

#generate and upload coverage if COVERAGE is set
if [ ${COVERAGE} -eq 1 ]; then

#get zcov that works with gcov v4.8
    git clone https://github.com/ddunbar/zcov.git
    cd zcov
    sudo python setup.py install
    sudo mkdir /usr/local/lib/python2.7/dist-packages/zcov-0.3.0.dev0-py2.7.egg/zcov/js
    cd zcov

#these files are not where zcov expects them to be after install so we move them
    sudo cp js/sorttable.js /usr/local/lib/python2.7/dist-packages/zcov-0.3.0.dev0-py2.7.egg/zcov/js/sorttable.js 
    sudo cp js/sourceview.js /usr/local/lib/python2.7/dist-packages/zcov-0.3.0.dev0-py2.7.egg/zcov/js/sourceview.js 
    sudo cp style.css /usr/local/lib/python2.7/dist-packages/zcov-0.3.0.dev0-py2.7.egg/zcov/style.css

#install zcov dependency
    sudo apt-get install -y enscript

#update gcov from v4.6 to v4.8. This is becauase gcda files are made for v4.8 and cause 
#a segmentation fault in v4.6
    sudo apt-get install -y ggcov
    sudo rm /usr/bin/gcov
    sudo ln -s /usr/bin/gcov-4.8 /usr/bin/gcov

#scan and generate coverage
    zcov scan output.zcov ${BUILD_DIR}
    zcov genhtml output.zcov coverage/
#upload the coverage data, currently to a random ftp server
    tar -zcvf coverage.tar.gz coverage/
    curl --form "file=@coverage.tar.gz" -u ${USER}:${PASSWORD} ${COVERAGE_SERVER}
fi
###############################################################################
# Result
###############################################################################
if [ "${RETURN}" != "00" ]; then
    echo "Running tests failed"
    exit 1
fi
