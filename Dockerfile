FROM klee/llvm:34_O_D_A_ubuntu_xenial-20181005 AS llvm
FROM klee/z3:4.8.4_ubuntu_bionic-20200807 AS z3

FROM ubuntu:24.04

# FIXME: Docker doesn't currently offer a way to
# squash the layers from within a Dockerfile so
# the resulting image is unnecessarily large!


RUN apt-get update && \
apt-get -y --no-install-recommends install \
#clang-${LLVM_VERSION} \
#llvm-${LLVM_VERSION} \
#llvm-${LLVM_VERSION}-dev \
#llvm-${LLVM_VERSION}-runtime \
        #llvm \
        clang \
        libcap-dev \
        git \
        subversion \
        cmake \
        make \
        libboost-program-options-dev \
        python3 \
        python3-dev \
        pipx \
        python3-tabulate \
        perl \
        flex \
        bison \
        libncurses-dev \
        zlib1g-dev \
        patch \
        wget \
        unzip \
        libgtest-dev \
        binutils \
        sudo \
    && \
        update-alternatives --install /usr/bin/python python /usr/bin/python3 50
        
        
        # Create ``klee`` user for container with password ``klee``.
        # and give it password-less sudo access (temporarily so we can use the TravisCI scripts)
RUN useradd -m klee && \
    echo klee:klee | chpasswd && \
    cp /etc/sudoers /etc/sudoers.bak && \
    echo 'klee  ALL=(root) NOPASSWD: ALL' >> /etc/sudoers
USER klee
WORKDIR /home/klee

RUN pipx install lit

COPY --from=llvm /tmp/ /tmp/
COPY --from=z3 /tmp/ /tmp/


ENV LLVM_VERSION=3.4 \
    DISABLE_ASSERTIONS=0 \
    ENABLE_OPTIMIZED=1 \
    SOLVERS=Z3 \
    #KLEE_UCLIBC=klee_uclibc_v1.4 \
    # FIXME: support uclibc
    KLEE_UCLIBC=0 \
    KLEE_SRC=/home/klee/klee_src \
    COVERAGE=0 \
    BUILD_DIR=/home/klee/klee_build \
    LLVM_BUILD_DIR=/tmp/llvm-34-build_O_D_A/ \
    LLVM_SRC_DIR=/tmp/llvm-34/ \
    LLVM_INSTALL_DIR=/tmp/llvm-34-install_O_D_A/

RUN mkdir "${LLVM_BUILD_DIR}"
RUN cd "${LLVM_BUILD_DIR}" && \
    "${LLVM_SRC_DIR}"/configure --enable-jit --prefix="${LLVM_INSTALL_DIR}" --enable-optimized --enable-assertions --enable-debug-runtime --enable-debug-symbols

# Copy across source files needed for build
RUN mkdir ${KLEE_SRC}
COPY --chown=klee: configure \
    LICENSE.TXT \
    Makefile \
    Makefile.* \
    README.md \
    MetaSMT.mk \
    TODO.txt \
    ${KLEE_SRC}/
COPY --chown=klee: .travis ${KLEE_SRC}/.travis/
COPY --chown=klee: autoconf ${KLEE_SRC}/autoconf/
COPY --chown=klee: docs ${KLEE_SRC}/docs/
COPY --chown=klee: include ${KLEE_SRC}/include/
COPY --chown=klee: lib ${KLEE_SRC}/lib/
COPY --chown=klee: runtime ${KLEE_SRC}/runtime/
COPY --chown=klee: scripts ${KLEE_SRC}/scripts/
COPY --chown=klee: test ${KLEE_SRC}/test/
COPY --chown=klee: tools ${KLEE_SRC}/tools/
COPY --chown=klee: unittests ${KLEE_SRC}/unittests/
COPY --chown=klee: utils ${KLEE_SRC}/utils/

# Create build directory
RUN mkdir -p ${BUILD_DIR}

    
SHELL ["/bin/bash", "-c"]
    
# Build/Install SMT solvers (use TravisCI script)
#RUN cd ${BUILD_DIR} && ${KLEE_SRC}/.travis/solvers.sh

# Install testing utils (use TravisCI script)
#RUN cd ${BUILD_DIR} && mkdir testing-utils && cd testing-utils && \
#    ${KLEE_SRC}/.travis/testing-utils.sh

# FIXME: This is a nasty hack so KLEE's configure and build finds
# LLVM's headers file, libraries and tools
RUN sudo mkdir -p --verbose /usr/lib/llvm-${LLVM_VERSION}/build/{include,Release+Debug+Asserts/{bin,lib}}/
RUN sudo ln -s "${LLVM_INSTALL_DIR}"/bin/* /usr/lib/llvm-${LLVM_VERSION}/build/Release+Debug+Asserts/bin/
RUN sudo ln -s "${LLVM_INSTALL_DIR}"/include/* /usr/lib/llvm-${LLVM_VERSION}/build/include/
RUN sudo ln -s "${LLVM_INSTALL_DIR}"/lib/* /usr/lib/llvm-${LLVM_VERSION}/build/Release+Debug+Asserts/lib
RUN sudo ln -s "${LLVM_BUILD_DIR}"/Makefile.config /usr/lib/llvm-"${LLVM_VERSION}"/build/
        

# For this outdated clang to find gcc
RUN sudo ln -s /usr/lib/gcc/x86_64-linux-gnu/13/ /usr/lib/gcc/x86_64-linux-gnu/13.0.0

RUN for i in "${LLVM_INSTALL_DIR}"/bin/*; do \
        for name in "${LLVM_VERSION}" 'tx'; do \
            sudo ln -s "${i}" /usr/bin/"$(basename "${i}")-${name}"; \
        done \
    done

RUN sudo ln -s /tmp/z3-4.8.4-install/lib/* /usr/lib/x86_64-linux-gnu/
RUN sudo ln -s /tmp/z3-4.8.4-install/bin/* /usr/bin/

# Build KLEE (use TravisCI script)
RUN cd ${BUILD_DIR} && ${KLEE_SRC}/.travis/klee.sh

# Revoke password-less sudo and Set up sudo access for the ``klee`` user so it
# requires a password
USER root
RUN mv /etc/sudoers.bak /etc/sudoers && \
    echo 'klee  ALL=(root) ALL' >> /etc/sudoers
USER klee

RUN ln -s "${BUILD_DIR}"/klee/Release+{Debug+,}Asserts/bin
RUN cp --link "${BUILD_DIR}"/klee/Release+Debug+Asserts/lib/* "${BUILD_DIR}"/klee/Release+Asserts/lib/

# Add KLEE binary directory to PATH
RUN echo 'export PATH=$PATH:'${BUILD_DIR}'/klee/Release+Asserts/bin' >> /home/klee/.bashrc

# Link klee to /usr/bin so that it can be used by docker run
USER root
RUN for exec in ${BUILD_DIR}/klee/Release+Asserts/bin/* ; do ln -s ${exec} /usr/bin/`basename ${exec}`; done

# Link klee to the libkleeRuntest library needed by docker run
RUN ln -s ${BUILD_DIR}/klee/Release+Asserts/lib/libkleeRuntest.so /usr/lib/libkleeRuntest.so.1.0
USER klee
