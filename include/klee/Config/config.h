/* include/klee/Config/config.h.  Generated from config.h.in by configure.  */
/* include/klee/Config/config.h.in.  Generated from autoconf/configure.tmp.ac by autoheader.  */

#ifndef KLEE_CONFIG_CONFIG_H
#define KLEE_CONFIG_CONFIG_H

/* Enable KLEE DEBUG checks */
/* #undef ENABLE_KLEE_DEBUG */

/* Enable metaSMT API */
/* #undef ENABLE_METASMT */

/* Using STP Solver backend */
#define ENABLE_STP 1

/* Using Z3 Solver backend */
#define ENABLE_Z3 1

/* Does the platform use __ctype_b_loc, etc. */
#define HAVE_CTYPE_EXTERNALS 1

/* Define to 1 if you have the <gperftools/malloc_extension.h> header file. */
#define HAVE_GPERFTOOLS_MALLOC_EXTENSION_H 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define if mallinfo() is available on this platform. */
#define HAVE_MALLINFO 1

/* Define to 1 if you have the <malloc/malloc.h> header file. */
/* #undef HAVE_MALLOC_MALLOC_H */

/* Define to 1 if you have the `malloc_zone_statistics' function. */
/* #undef HAVE_MALLOC_ZONE_STATISTICS */

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the <selinux/selinux.h> header file. */
/* #undef HAVE_SELINUX_SELINUX_H */

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <sys/acl.h> header file. */
/* #undef HAVE_SYS_ACL_H */

/* Define to 1 if you have the <sys/capability.h> header file. */
#define HAVE_SYS_CAPABILITY_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Z3 needs a Z3_context passed to Z3_get_error_msg() */
#define HAVE_Z3_GET_ERROR_MSG_NEEDS_CONTEXT 1

/* Define to 1 if you have the <zlib.h> header file. */
#define HAVE_ZLIB_H 1

/* Enable time stamping the sources */
/* #undef KLEE_ENABLE_TIMESTAMP */

/* Define to empty or 'const' depending on how SELinux qualifies its security
   context parameters. */
/* #undef KLEE_SELINUX_CTX_CONST */

/* LLVM version is release (instead of development) */
#define LLVM_IS_RELEASE 1

/* LLVM major version number */
#define LLVM_VERSION_MAJOR 3

/* LLVM minor version number */
#define LLVM_VERSION_MINOR 4

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "klee-dev@imperial.ac.uk"

/* Define to the full name of this package. */
#define PACKAGE_NAME "KLEE"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "KLEE 1.2.0"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "klee-"

/* Define to the home page for this package. */
#define PACKAGE_URL "https://klee.github.io"

/* Define to the version of this package. */
#define PACKAGE_VERSION "1.2.0"

/* Configuration for runtime libraries */
#define RUNTIME_CONFIGURATION "Release+Asserts"

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* klee-uclibc is supported */
#define SUPPORT_KLEE_UCLIBC 1

#endif
