KLEE Symbolic Virtual Machine
=============================

[![Build Status](https://travis-ci.org/klee/klee.svg?branch=master)](https://travis-ci.org/klee/klee)

`KLEE` is a symbolic virtual machine built on top of the LLVM compiler
infrastructure. This version contains parts that implement the
[Tracer-X](http://www.comp.nus.edu.sg/~tracerx/) approach to
symbolic execution. This approach builds upon the experience with
[TRACER](http://www.comp.nus.edu.sg/~tracerx) symbolic execution
tool where it combines the core technology of TRACER with advanced
symbolic execution approaches. The Tracer-X extension is still being
actively developed by its team and not yet ready for release. There
are several [example
programs](https://github.com/feliciahalim/klee-examples) that we use
for testing it.

Currently in this version, there are three primary components:

  1. The core symbolic virtual machine engine; this is responsible for
     executing LLVM bitcode modules with support for symbolic
     values. This is comprised of the code in lib/.

  2. A POSIX/Linux emulation layer oriented towards supporting uClibc,
     with additional support for making parts of the operating system
     environment symbolic.

  3. The Tracer-X extension that implements TRACER technology and is
     plugged into the KLEE's core symbolic virtual machine engine.

Additionally, there is a simple library for replaying computed inputs
on native code (for closed programs). There is also a more complicated
infrastructure for replaying the inputs generated for the POSIX/Linux
emulation layer, which handles running native programs in an
environment that matches a computed test input, including setting up
files, pipes, environment variables, and passing command line
arguments.

Coverage information for KLEE can be found [here](http://vm-klee.doc.ic.ac.uk:55555/index.html).

For further information on KLEE, see its [webpage](http://klee.github.io/).

For further information on Tracer-X see its [webpage](http://www.comp.nus.edu.sg/~tracerx).

# Use with docker
```bash
# In this repo's root directory
docker build -t tracerx .
docker run -it tracerx
```

Then, you will enter the docker container where you can use the command `klee` to execute TracerX.
To compile subject programs to be executed under TracerX, you must use clang with compatible version. Such clang command is available in container as `clang-tx`.

## TracerX Development
To develop TracerX inside docker, follow the steps above. The TracerX source code is at `/home/klee/klee_src/` inside the container where you can perform modification. Optionally, you can also perform docker volume mount to that directory, so that you can modify the code outside the container while being synced and compiled in container.

To compile, you need change your working directory to `/home/klee/klee_build/klee/` first. Then, you can perform the normal compilation commands (e.g. `make` and `/home/klee/klee_src/configure`).
