; ModuleID = '/home/sanghu/TracerX/tracerx/test/Runtime/POSIX/Output/Fcntl.c.tmp2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.exe_file_t = type { i32, i32, i64, %struct.exe_disk_file_t* }
%struct.exe_disk_file_t = type { i32, i8*, %struct.stat64* }
%struct.stat64 = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.exe_file_system_t = type { i32, %struct.exe_disk_file_t*, %struct.exe_disk_file_t*, i32, %struct.exe_disk_file_t*, i32, i32*, i32*, i32*, i32*, i32*, i32*, i32* }
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }
%struct.exe_sym_env_t = type { [32 x %struct.exe_file_t], i32, i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.statfs = type { i64, i64, i64, i64, i64, i64, i64, %struct.__fsid_t, i64, i64, i64, [4 x i64] }
%struct.__fsid_t = type { [2 x i32] }
%struct.fd_set = type { [16 x i64] }
%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timezone = type { i32, i32 }
%struct.tms = type { i64, i64, i64, i64 }
%struct.utmpx = type opaque
%struct.utmp = type { i16, i32, [32 x i8], [4 x i8], [32 x i8], [256 x i8], %struct.exit_status, i32, %struct.anon.8, [4 x i32], [20 x i8] }
%struct.exit_status = type { i16, i16 }
%struct.anon.8 = type { i32, i32 }
%struct.utimbuf = type { i64, i64 }
%struct.rusage = type { %struct.timeval, %struct.timeval, %union.anon.9, %union.anon.10, %union.anon.11, %union.anon.12, %union.anon.13, %union.anon.14, %union.anon.15, %union.anon.16, %union.anon.17, %union.anon.18, %union.anon.19, %union.anon.20, %unio
%union.anon.9 = type { i64 }
%union.anon.10 = type { i64 }
%union.anon.11 = type { i64 }
%union.anon.12 = type { i64 }
%union.anon.13 = type { i64 }
%union.anon.14 = type { i64 }
%union.anon.15 = type { i64 }
%union.anon.16 = type { i64 }
%union.anon.17 = type { i64 }
%union.anon.18 = type { i64 }
%union.anon.19 = type { i64 }
%union.anon.20 = type { i64 }
%union.anon.21 = type { i64 }
%union.anon.22 = type { i64 }
%struct.siginfo_t = type { i32, i32, i32, %union.anon.0 }
%union.anon.0 = type { %struct.anon.3, [80 x i8] }
%struct.anon.3 = type { i32, i32, i32, i64, i64 }
%struct.rlimit = type { i64, i64 }
%struct.rlimit64 = type { i64, i64 }

@.str = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"fd == 3\00", align 1
@.str2 = private unnamed_addr constant [56 x i8] c"/home/sanghu/TracerX/tracerx/test/Runtime/POSIX/Fcntl.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [23 x i8] c"int main(int, char **)\00", align 1
@.str3 = private unnamed_addr constant [39 x i8] c"(fcntl(fd, F_GETFD) & FD_CLOEXEC) == 0\00", align 1
@.str4 = private unnamed_addr constant [39 x i8] c"fcntl(fd, F_SETFD, FD_CLOEXEC, 1) == 0\00", align 1
@.str5 = private unnamed_addr constant [39 x i8] c"(fcntl(fd, F_GETFD) & FD_CLOEXEC) != 0\00", align 1
@.str11 = private unnamed_addr constant [47 x i8] c"Undefined call to open(): O_EXCL w/o O_RDONLY\0A\00", align 1
@.str22 = private unnamed_addr constant [44 x i8] c"symbolic file descriptor, ignoring (ENOENT)\00", align 1
@close.n_calls = internal unnamed_addr global i32 0, align 4
@read.n_calls = internal unnamed_addr global i32 0, align 4
@.str33 = private unnamed_addr constant [12 x i8] c"f->off >= 0\00", align 1
@.str44 = private unnamed_addr constant [5 x i8] c"fd.c\00", align 1
@__PRETTY_FUNCTION__.read = private unnamed_addr constant [34 x i8] c"ssize_t read(int, void *, size_t)\00", align 1
@write.n_calls = internal unnamed_addr global i32 0, align 4
@.str55 = private unnamed_addr constant [7 x i8] c"r >= 0\00", align 1
@__PRETTY_FUNCTION__.write = private unnamed_addr constant [41 x i8] c"ssize_t write(int, const void *, size_t)\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str7 = private unnamed_addr constant [24 x i8] c"write() ignores bytes.\0A\00", align 1
@.str8 = private unnamed_addr constant [18 x i8] c"new_off == f->off\00", align 1
@__PRETTY_FUNCTION__.__fd_lseek = private unnamed_addr constant [38 x i8] c"off64_t __fd_lseek(int, off64_t, int)\00", align 1
@.str9 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (ENOENT)\00", align 1
@chmod.n_calls = internal unnamed_addr global i32 0, align 4
@fchmod.n_calls = internal unnamed_addr global i32 0, align 4
@__fd_ftruncate.n_calls = internal unnamed_addr global i32 0, align 4
@.str10 = private unnamed_addr constant [30 x i8] c"symbolic file, ignoring (EIO)\00", align 1
@.str116 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (EINVAL)\00", align 1
@.str12 = private unnamed_addr constant [18 x i8] c"s != (off64_t) -1\00", align 1
@__PRETTY_FUNCTION__.__fd_getdents = private unnamed_addr constant [65 x i8] c"int __fd_getdents(unsigned int, struct dirent64 *, unsigned int)\00", align 1
@.str13 = private unnamed_addr constant [41 x i8] c"(TCGETS) symbolic file, incomplete model\00", align 1
@.str14 = private unnamed_addr constant [42 x i8] c"(TCSETS) symbolic file, silently ignoring\00", align 1
@.str15 = private unnamed_addr constant [43 x i8] c"(TCSETSW) symbolic file, silently ignoring\00", align 1
@.str16 = private unnamed_addr constant [43 x i8] c"(TCSETSF) symbolic file, silently ignoring\00", align 1
@.str17 = private unnamed_addr constant [45 x i8] c"(TIOCGWINSZ) symbolic file, incomplete model\00", align 1
@.str18 = private unnamed_addr constant [46 x i8] c"(TIOCSWINSZ) symbolic file, ignoring (EINVAL)\00", align 1
@.str19 = private unnamed_addr constant [43 x i8] c"(FIONREAD) symbolic file, incomplete model\00", align 1
@.str20 = private unnamed_addr constant [44 x i8] c"(MTIOCGET) symbolic file, ignoring (EINVAL)\00", align 1
@.str21 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EBADF)\00", align 1
@.str227 = private unnamed_addr constant [17 x i8] c"ignoring (EPERM)\00", align 1
@getcwd.n_calls = internal unnamed_addr global i32 0, align 4
@.str23 = private unnamed_addr constant [18 x i8] c"ignoring (ENOENT)\00", align 1
@.str24 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EPERM)\00", align 1
@__exe_env = global { [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] } { [32 x %struct.exe_file_t] [%struct.exe_file_t { i32 0, i32 5, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t { i32 1, i32 9, i64 0, %struct.exe_disk_file_t* null }, 
@klee_init_fds.name = private unnamed_addr constant [7 x i8] c"?-data\00", align 1
@.str25 = private unnamed_addr constant [2 x i8] c".\00", align 1
@__exe_fs = common global %struct.exe_file_system_t zeroinitializer, align 8
@.str110 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@.str211 = private unnamed_addr constant [10 x i8] c"read_fail\00", align 1
@.str312 = private unnamed_addr constant [11 x i8] c"write_fail\00", align 1
@.str413 = private unnamed_addr constant [11 x i8] c"close_fail\00", align 1
@.str514 = private unnamed_addr constant [15 x i8] c"ftruncate_fail\00", align 1
@.str615 = private unnamed_addr constant [12 x i8] c"getcwd_fail\00", align 1
@.str716 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1
@.str817 = private unnamed_addr constant [14 x i8] c"model_version\00", align 1
@.str918 = private unnamed_addr constant [6 x i8] c"-stat\00", align 1
@.str1019 = private unnamed_addr constant [5 x i8] c"size\00", align 1
@.str1120 = private unnamed_addr constant [10 x i8] c"fd_init.c\00", align 1
@__PRETTY_FUNCTION__.__create_new_dfile = private unnamed_addr constant [88 x i8] c"void __create_new_dfile(exe_disk_file_t *, unsigned int, const char *, struct stat64 *)\00", align 1
@.str2526 = private unnamed_addr constant [17 x i8] c"ignoring (EPERM)\00", align 1
@.str126 = private unnamed_addr constant [9 x i8] c"ignoring\00", align 1
@.str22727 = private unnamed_addr constant [10 x i8] c"illegal.c\00", align 1
@.str328 = private unnamed_addr constant [20 x i8] c"longjmp unsupported\00", align 1
@.str429 = private unnamed_addr constant [8 x i8] c"xxx.err\00", align 1
@.str530 = private unnamed_addr constant [18 x i8] c"ignoring (EACCES)\00", align 1
@.str631 = private unnamed_addr constant [18 x i8] c"ignoring (ENOMEM)\00", align 1
@.str32 = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@.str133 = private unnamed_addr constant [964 x i8] c"klee_init_env\0A\0Ausage: (klee_init_env) [options] [program arguments]\0A  -sym-arg <N>              - Replace by a symbolic argument with length N\0A  -sym-args <MIN> <MAX> <N> - Replace by at least
@.str234 = private unnamed_addr constant [10 x i8] c"--sym-arg\00", align 1
@.str335 = private unnamed_addr constant [9 x i8] c"-sym-arg\00", align 1
@.str436 = private unnamed_addr constant [48 x i8] c"--sym-arg expects an integer argument <max-len>\00", align 1
@.str537 = private unnamed_addr constant [11 x i8] c"--sym-args\00", align 1
@.str638 = private unnamed_addr constant [10 x i8] c"-sym-args\00", align 1
@.str739 = private unnamed_addr constant [77 x i8] c"--sym-args expects three integer arguments <min-argvs> <max-argvs> <max-len>\00", align 1
@.str840 = private unnamed_addr constant [7 x i8] c"n_args\00", align 1
@.str941 = private unnamed_addr constant [12 x i8] c"--sym-files\00", align 1
@.str1042 = private unnamed_addr constant [11 x i8] c"-sym-files\00", align 1
@.str1143 = private unnamed_addr constant [72 x i8] c"--sym-files expects two integer arguments <no-sym-files> <sym-file-len>\00", align 1
@.str1244 = private unnamed_addr constant [12 x i8] c"--sym-stdin\00", align 1
@.str1345 = private unnamed_addr constant [11 x i8] c"-sym-stdin\00", align 1
@.str1446 = private unnamed_addr constant [57 x i8] c"--sym-stdin expects one integer argument <sym-stdin-len>\00", align 1
@.str1547 = private unnamed_addr constant [13 x i8] c"--sym-stdout\00", align 1
@.str1648 = private unnamed_addr constant [12 x i8] c"-sym-stdout\00", align 1
@.str1749 = private unnamed_addr constant [18 x i8] c"--save-all-writes\00", align 1
@.str1850 = private unnamed_addr constant [17 x i8] c"-save-all-writes\00", align 1
@.str1951 = private unnamed_addr constant [10 x i8] c"--fd-fail\00", align 1
@.str2052 = private unnamed_addr constant [9 x i8] c"-fd-fail\00", align 1
@.str2153 = private unnamed_addr constant [11 x i8] c"--max-fail\00", align 1
@.str2254 = private unnamed_addr constant [10 x i8] c"-max-fail\00", align 1
@.str2355 = private unnamed_addr constant [54 x i8] c"--max-fail expects an integer argument <max-failures>\00", align 1
@.str2456 = private unnamed_addr constant [37 x i8] c"too many arguments for klee_init_env\00", align 1
@.str2557 = private unnamed_addr constant [16 x i8] c"klee_init_env.c\00", align 1
@.str26 = private unnamed_addr constant [9 x i8] c"user.err\00", align 1
@.str58 = private unnamed_addr constant [18 x i8] c"silently ignoring\00", align 1
@.str159 = private unnamed_addr constant [24 x i8] c"ignoring (EAFNOSUPPORT)\00", align 1
@.str260 = private unnamed_addr constant [15 x i8] c"ignoring (EIO)\00", align 1
@.str361 = private unnamed_addr constant [18 x i8] c"ignoring (ENFILE)\00", align 1
@.str462 = private unnamed_addr constant [17 x i8] c"ignoring (EPERM)\00", align 1
@.str563 = private unnamed_addr constant [13 x i8] c"returning 0\0A\00", align 1
@.str664 = private unnamed_addr constant [40 x i8] c"setting all times to 0 and returning 0\0A\00", align 1
@.str765 = private unnamed_addr constant [17 x i8] c"ignoring (EBADF)\00", align 1
@.str866 = private unnamed_addr constant [21 x i8] c"ignoring (-1 result)\00", align 1
@.str967 = private unnamed_addr constant [18 x i8] c"ignoring (ECHILD)\00", align 1
@.str1068 = private unnamed_addr constant [32 x i8] c"silently ignoring (returning 0)\00", align 1
@.str34 = private unnamed_addr constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str135 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str236 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str337 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str1438 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str2539 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str640 = private unnamed_addr constant [13 x i8] c"klee_range.c\00", align 1
@.str1741 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

@__getdents = alias bitcast (i64 (i32, %struct.dirent*, i64)* @getdents to i32 (i32, %struct.dirent*, i32)*)
@__getdents64 = alias i32 (i32, %struct.dirent*, i32)* @getdents64

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %argcPtr = alloca i32
  %argvPtr = alloca i8**
  store i32 %argc, i32* %argcPtr
  store i8** %argv, i8*** %argvPtr
  call void @klee_init_env(i32* %argcPtr, i8*** %argvPtr)
  %newArgc = load i32* %argcPtr
  %newArgv = load i8*** %argvPtr
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %fd = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %newArgc, i32* %2, align 4
  store i8** %newArgv, i8*** %3, align 8
  %4 = call i32 (i8*, i32, ...)* @open(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i32 514)
  store i32 %4, i32* %fd, align 4
  %5 = load i32* %fd, align 4
  %6 = icmp eq i32 %5, -1
  br i1 %6, label %7, label %9

; <label>:7                                       ; preds = %0
  %8 = call i32 (i32, ...)* bitcast (i32 (...)* @klee_silent_exit to i32 (i32, ...)*)(i32 0)
  br label %9

; <label>:9                                       ; preds = %7, %0
  %10 = load i32* %fd, align 4
  %11 = icmp eq i32 %10, 3
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  br label %15

; <label>:13                                      ; preds = %9
  call void @__assert_fail(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8]* @.str2, i32 0, i32 0), i32 12, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #16
  unreachable
                                                  ; No predecessors!
  br label %15

; <label>:15                                      ; preds = %14, %12
  %16 = load i32* %fd, align 4
  %17 = call i32 (i32, i32, ...)* @fcntl(i32 %16, i32 1)
  %18 = and i32 %17, 1
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %15
  br label %23

; <label>:21                                      ; preds = %15
  call void @__assert_fail(i8* getelementptr inbounds ([39 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8]* @.str2, i32 0, i32 0), i32 13, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #16
  unreachable
                                                  ; No predecessors!
  br label %23

; <label>:23                                      ; preds = %22, %20
  %24 = load i32* %fd, align 4
  %25 = call i32 (i32, i32, ...)* @fcntl(i32 %24, i32 2, i32 1, i32 1)
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %23
  br label %30

; <label>:28                                      ; preds = %23
  call void @__assert_fail(i8* getelementptr inbounds ([39 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8]* @.str2, i32 0, i32 0), i32 14, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #16
  unreachable
                                                  ; No predecessors!
  br label %30

; <label>:30                                      ; preds = %29, %27
  %31 = load i32* %fd, align 4
  %32 = call i32 (i32, i32, ...)* @fcntl(i32 %31, i32 1)
  %33 = and i32 %32, 1
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %30
  br label %38

; <label>:36                                      ; preds = %30
  call void @__assert_fail(i8* getelementptr inbounds ([39 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8]* @.str2, i32 0, i32 0), i32 15, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #16
  unreachable
                                                  ; No predecessors!
  br label %38

; <label>:38                                      ; preds = %37, %35
  ret i32 0
}

; Function Attrs: noreturn
declare i32 @klee_silent_exit(...) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: nounwind uwtable
define i32 @access(i8* %pathname, i32 %mode) #3 {
  %1 = load i8* %pathname, align 1, !dbg !2140, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !2145
  %3 = icmp eq i8 %1, 0, !dbg !2145
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2145

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %pathname, i64 1, !dbg !2145
  %6 = load i8* %5, align 1, !dbg !2145, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !2145
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2145

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2147, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !2147
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2147

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2147
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2147

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2152
  %sext.i = shl i32 %i.02.i, 24, !dbg !2152
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2152
  %12 = ashr exact i32 %sext.i, 24, !dbg !2152
  %13 = add nsw i32 %12, 65, !dbg !2152
  %14 = icmp eq i32 %2, %13, !dbg !2152
  %15 = add i32 %i.02.i, 1, !dbg !2147
  br i1 %14, label %16, label %10, !dbg !2152

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2153
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2153, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2155
  %20 = load %struct.stat64** %19, align 8, !dbg !2155, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2155
  %22 = load i64* %21, align 8, !dbg !2155, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !2155
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2153
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2163
  %or.cond = or i1 %23, %25, !dbg !2155
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %56, !dbg !2155

__get_sym_file.exit.thread:                       ; preds = %16, %10, %.preheader.i, %4, %0
  %26 = ptrtoint i8* %pathname to i64, !dbg !2164
  %27 = tail call i64 @klee_get_valuel(i64 %26) #8, !dbg !2164
  %28 = inttoptr i64 %27 to i8*, !dbg !2164
  %29 = icmp eq i8* %28, %pathname, !dbg !2167
  %30 = zext i1 %29 to i64, !dbg !2167
  tail call void @klee_assume(i64 %30) #8, !dbg !2167
  br label %31, !dbg !2168

; <label>:31                                      ; preds = %48, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %49, %48 ]
  %sc.0.i = phi i8* [ %28, %__get_sym_file.exit.thread ], [ %sc.1.i, %48 ]
  %32 = load i8* %sc.0.i, align 1, !dbg !2169, !tbaa !2142
  %33 = add i32 %i.0.i, -1, !dbg !2170
  %34 = and i32 %33, %i.0.i, !dbg !2170
  %35 = icmp eq i32 %34, 0, !dbg !2170
  br i1 %35, label %36, label %40, !dbg !2170

; <label>:36                                      ; preds = %31
  switch i8 %32, label %48 [
    i8 0, label %37
    i8 47, label %38
  ], !dbg !2171

; <label>:37                                      ; preds = %36
  store i8 0, i8* %sc.0.i, align 1, !dbg !2174, !tbaa !2142
  br label %__concretize_string.exit, !dbg !2176

; <label>:38                                      ; preds = %36
  %39 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2177
  store i8 47, i8* %sc.0.i, align 1, !dbg !2177, !tbaa !2142
  br label %48, !dbg !2180

; <label>:40                                      ; preds = %31
  %41 = sext i8 %32 to i64, !dbg !2181
  %42 = tail call i64 @klee_get_valuel(i64 %41) #8, !dbg !2181
  %43 = trunc i64 %42 to i8, !dbg !2181
  %44 = icmp eq i8 %43, %32, !dbg !2182
  %45 = zext i1 %44 to i64, !dbg !2182
  tail call void @klee_assume(i64 %45) #8, !dbg !2182
  %46 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2183
  store i8 %43, i8* %sc.0.i, align 1, !dbg !2183, !tbaa !2142
  %47 = icmp eq i8 %43, 0, !dbg !2184
  br i1 %47, label %__concretize_string.exit, label %48, !dbg !2184

; <label>:48                                      ; preds = %40, %38, %36
  %sc.1.i = phi i8* [ %46, %40 ], [ %39, %38 ], [ %sc.0.i, %36 ]
  %49 = add i32 %i.0.i, 1, !dbg !2168
  br label %31, !dbg !2168

__concretize_string.exit:                         ; preds = %40, %37
  %50 = tail call i64 (i64, ...)* @syscall(i64 21, i8* %pathname, i32 %mode) #8, !dbg !2166
  %51 = trunc i64 %50 to i32, !dbg !2166
  %52 = icmp eq i32 %51, -1, !dbg !2186
  br i1 %52, label %53, label %56, !dbg !2186

; <label>:53                                      ; preds = %__concretize_string.exit
  %54 = tail call i32 @klee_get_errno() #8, !dbg !2188
  %55 = tail call i32* @__errno_location() #4, !dbg !2188
  store i32 %54, i32* %55, align 4, !dbg !2188, !tbaa !2189
  br label %56, !dbg !2188

; <label>:56                                      ; preds = %53, %__concretize_string.exit, %16
  %.0 = phi i32 [ -1, %53 ], [ %51, %__concretize_string.exit ], [ 0, %16 ]
  ret i32 %.0, !dbg !2190
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #4

; Function Attrs: nounwind
declare i64 @syscall(i64, ...) #5

declare i32 @klee_get_errno() #6

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #7

; Function Attrs: nounwind uwtable
define i32 @umask(i32 %mask) #3 {
  %1 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 1), align 8, !dbg !2191, !tbaa !2192
  %2 = and i32 %mask, 511, !dbg !2194
  store i32 %2, i32* getelementptr inbounds (%struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 1), align 8, !dbg !2194, !tbaa !2192
  ret i32 %1, !dbg !2195
}

; Function Attrs: nounwind uwtable
define i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode) #3 {
  br label %4, !dbg !2196

; <label>:1                                       ; preds = %4
  %2 = trunc i64 %indvars.iv.next to i32, !dbg !2196
  %3 = icmp slt i32 %2, 32, !dbg !2196
  br i1 %3, label %4, label %10, !dbg !2196

; <label>:4                                       ; preds = %1, %0
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %1 ]
  %fd.04 = phi i32 [ 0, %0 ], [ %9, %1 ]
  %5 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !2198
  %6 = load i32* %5, align 4, !dbg !2198, !tbaa !2200
  %7 = and i32 %6, 1, !dbg !2198
  %8 = icmp eq i32 %7, 0, !dbg !2198
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !2196
  %9 = add nsw i32 %fd.04, 1, !dbg !2196
  br i1 %8, label %10, label %1, !dbg !2198

; <label>:10                                      ; preds = %4, %1
  %fd.0.lcssa = phi i32 [ %fd.04, %4 ], [ %9, %1 ]
  %11 = icmp eq i32 %fd.0.lcssa, 32, !dbg !2202
  br i1 %11, label %12, label %14, !dbg !2202

; <label>:12                                      ; preds = %10
  %13 = tail call i32* @__errno_location() #4, !dbg !2204
  store i32 24, i32* %13, align 4, !dbg !2204, !tbaa !2189
  br label %105, !dbg !2206

; <label>:14                                      ; preds = %10
  %15 = sext i32 %fd.0.lcssa to i64, !dbg !2207
  %16 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %15, !dbg !2207
  %17 = bitcast %struct.exe_file_t* %16 to i8*, !dbg !2208
  %18 = call i8* @memset(i8* %17, i32 0, i64 24)
  %19 = load i8* %pathname, align 1, !dbg !2209, !tbaa !2142
  %20 = sext i8 %19 to i32, !dbg !2211
  %21 = icmp eq i8 %19, 0, !dbg !2211
  br i1 %21, label %__get_sym_file.exit.thread, label %22, !dbg !2211

; <label>:22                                      ; preds = %14
  %23 = getelementptr inbounds i8* %pathname, i64 1, !dbg !2211
  %24 = load i8* %23, align 1, !dbg !2211, !tbaa !2142
  %25 = icmp eq i8 %24, 0, !dbg !2211
  br i1 %25, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2211

.preheader.i:                                     ; preds = %22
  %26 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2212, !tbaa !2148
  %27 = icmp eq i32 %26, 0, !dbg !2212
  br i1 %27, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2212

; <label>:28                                      ; preds = %.lr.ph.i
  %29 = icmp ult i32 %33, %26, !dbg !2212
  br i1 %29, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2212

.lr.ph.i:                                         ; preds = %28, %.preheader.i
  %i.02.i = phi i32 [ %33, %28 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2213
  %sext.i = shl i32 %i.02.i, 24, !dbg !2213
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2213
  %30 = ashr exact i32 %sext.i, 24, !dbg !2213
  %31 = add nsw i32 %30, 65, !dbg !2213
  %32 = icmp eq i32 %20, %31, !dbg !2213
  %33 = add i32 %i.02.i, 1, !dbg !2212
  br i1 %32, label %34, label %28, !dbg !2213

; <label>:34                                      ; preds = %.lr.ph.i
  %35 = zext i32 %i.02.i to i64, !dbg !2214
  %36 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2214, !tbaa !2154
  %37 = getelementptr inbounds %struct.exe_disk_file_t* %36, i64 %35, i32 2, !dbg !2215
  %38 = load %struct.stat64** %37, align 8, !dbg !2215, !tbaa !2157
  %39 = getelementptr inbounds %struct.stat64* %38, i64 0, i32 1, !dbg !2215
  %40 = load i64* %39, align 8, !dbg !2215, !tbaa !2159
  %41 = icmp eq i64 %40, 0, !dbg !2215
  br i1 %41, label %__get_sym_file.exit.thread, label %__get_sym_file.exit, !dbg !2215

__get_sym_file.exit:                              ; preds = %34
  %42 = getelementptr inbounds %struct.exe_disk_file_t* %36, i64 %35, !dbg !2214
  %43 = icmp eq %struct.exe_disk_file_t* %42, null, !dbg !2216
  br i1 %43, label %__get_sym_file.exit.thread, label %44, !dbg !2216

; <label>:44                                      ; preds = %__get_sym_file.exit
  %45 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %15, i32 3, !dbg !2217
  store %struct.exe_disk_file_t* %42, %struct.exe_disk_file_t** %45, align 8, !dbg !2217, !tbaa !2219
  %46 = and i32 %flags, 192, !dbg !2220
  switch i32 %46, label %51 [
    i32 192, label %47
    i32 128, label %49
  ], !dbg !2220

; <label>:47                                      ; preds = %44
  %48 = tail call i32* @__errno_location() #4, !dbg !2222
  store i32 17, i32* %48, align 4, !dbg !2222, !tbaa !2189
  br label %105, !dbg !2224

; <label>:49                                      ; preds = %44
  tail call void @klee_warning(i8* getelementptr inbounds ([47 x i8]* @.str11, i64 0, i64 0)) #8, !dbg !2225
  %50 = tail call i32* @__errno_location() #4, !dbg !2228
  store i32 13, i32* %50, align 4, !dbg !2228, !tbaa !2189
  br label %105, !dbg !2229

; <label>:51                                      ; preds = %44
  %52 = getelementptr inbounds %struct.stat64* %38, i64 0, i32 3, !dbg !2230
  %53 = load i32* %52, align 4, !dbg !2230, !tbaa !2233
  %54 = and i32 %flags, 2, !dbg !2234
  %55 = icmp eq i32 %54, 0, !dbg !2234
  %56 = and i32 %53, 292, !dbg !2236
  %57 = icmp eq i32 %56, 0, !dbg !2236
  %or.cond3.i = or i1 %55, %57, !dbg !2236
  br i1 %or.cond3.i, label %has_permission.exit, label %has_permission.exit.thread, !dbg !2236

has_permission.exit:                              ; preds = %51
  %58 = and i32 %flags, 3, !dbg !2238
  %not..i = icmp ne i32 %58, 0, !dbg !2238
  %59 = and i32 %53, 146, !dbg !2240
  %60 = icmp eq i32 %59, 0, !dbg !2240
  %or.cond5.i = and i1 %not..i, %60, !dbg !2240
  br i1 %or.cond5.i, label %has_permission.exit.thread, label %62, !dbg !2231

has_permission.exit.thread:                       ; preds = %has_permission.exit, %51
  %61 = tail call i32* @__errno_location() #4, !dbg !2242
  store i32 13, i32* %61, align 4, !dbg !2242, !tbaa !2189
  br label %105, !dbg !2244

; <label>:62                                      ; preds = %has_permission.exit
  %63 = and i32 %53, -512, !dbg !2245
  %64 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 1), align 8, !dbg !2245, !tbaa !2192
  %65 = xor i32 %64, -1, !dbg !2245
  %66 = and i32 %65, %mode, !dbg !2245
  %67 = or i32 %66, %63, !dbg !2245
  store i32 %67, i32* %52, align 4, !dbg !2245, !tbaa !2233
  br label %100, !dbg !2246

__get_sym_file.exit.thread:                       ; preds = %__get_sym_file.exit, %34, %28, %.preheader.i, %22, %14
  %68 = ptrtoint i8* %pathname to i64, !dbg !2247
  %69 = tail call i64 @klee_get_valuel(i64 %68) #8, !dbg !2247
  %70 = inttoptr i64 %69 to i8*, !dbg !2247
  %71 = icmp eq i8* %70, %pathname, !dbg !2250
  %72 = zext i1 %71 to i64, !dbg !2250
  tail call void @klee_assume(i64 %72) #8, !dbg !2250
  br label %73, !dbg !2251

; <label>:73                                      ; preds = %90, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %91, %90 ]
  %sc.0.i = phi i8* [ %70, %__get_sym_file.exit.thread ], [ %sc.1.i, %90 ]
  %74 = load i8* %sc.0.i, align 1, !dbg !2252, !tbaa !2142
  %75 = add i32 %i.0.i, -1, !dbg !2253
  %76 = and i32 %75, %i.0.i, !dbg !2253
  %77 = icmp eq i32 %76, 0, !dbg !2253
  br i1 %77, label %78, label %82, !dbg !2253

; <label>:78                                      ; preds = %73
  switch i8 %74, label %90 [
    i8 0, label %79
    i8 47, label %80
  ], !dbg !2254

; <label>:79                                      ; preds = %78
  store i8 0, i8* %sc.0.i, align 1, !dbg !2255, !tbaa !2142
  br label %__concretize_string.exit, !dbg !2256

; <label>:80                                      ; preds = %78
  %81 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2257
  store i8 47, i8* %sc.0.i, align 1, !dbg !2257, !tbaa !2142
  br label %90, !dbg !2258

; <label>:82                                      ; preds = %73
  %83 = sext i8 %74 to i64, !dbg !2259
  %84 = tail call i64 @klee_get_valuel(i64 %83) #8, !dbg !2259
  %85 = trunc i64 %84 to i8, !dbg !2259
  %86 = icmp eq i8 %85, %74, !dbg !2260
  %87 = zext i1 %86 to i64, !dbg !2260
  tail call void @klee_assume(i64 %87) #8, !dbg !2260
  %88 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2261
  store i8 %85, i8* %sc.0.i, align 1, !dbg !2261, !tbaa !2142
  %89 = icmp eq i8 %85, 0, !dbg !2262
  br i1 %89, label %__concretize_string.exit, label %90, !dbg !2262

; <label>:90                                      ; preds = %82, %80, %78
  %sc.1.i = phi i8* [ %88, %82 ], [ %81, %80 ], [ %sc.0.i, %78 ]
  %91 = add i32 %i.0.i, 1, !dbg !2251
  br label %73, !dbg !2251

__concretize_string.exit:                         ; preds = %82, %79
  %92 = tail call i64 (i64, ...)* @syscall(i64 2, i8* %pathname, i32 %flags, i32 %mode) #8, !dbg !2249
  %93 = trunc i64 %92 to i32, !dbg !2249
  %94 = icmp eq i32 %93, -1, !dbg !2263
  br i1 %94, label %95, label %98, !dbg !2263

; <label>:95                                      ; preds = %__concretize_string.exit
  %96 = tail call i32 @klee_get_errno() #8, !dbg !2265
  %97 = tail call i32* @__errno_location() #4, !dbg !2265
  store i32 %96, i32* %97, align 4, !dbg !2265, !tbaa !2189
  br label %105, !dbg !2267

; <label>:98                                      ; preds = %__concretize_string.exit
  %99 = getelementptr inbounds %struct.exe_file_t* %16, i64 0, i32 0, !dbg !2268
  store i32 %93, i32* %99, align 8, !dbg !2268, !tbaa !2269
  %.pre = and i32 %flags, 3, !dbg !2270
  br label %100

; <label>:100                                     ; preds = %98, %62
  %.pre-phi = phi i32 [ %.pre, %98 ], [ %58, %62 ], !dbg !2270
  %101 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %15, i32 1, !dbg !2272
  store i32 1, i32* %101, align 4, !dbg !2272, !tbaa !2200
  switch i32 %.pre-phi, label %104 [
    i32 0, label %102
    i32 1, label %103
  ], !dbg !2270

; <label>:102                                     ; preds = %100
  store i32 5, i32* %101, align 4, !dbg !2273, !tbaa !2200
  br label %105, !dbg !2275

; <label>:103                                     ; preds = %100
  store i32 9, i32* %101, align 4, !dbg !2276, !tbaa !2200
  br label %105, !dbg !2279

; <label>:104                                     ; preds = %100
  store i32 13, i32* %101, align 4, !dbg !2280, !tbaa !2200
  br label %105

; <label>:105                                     ; preds = %104, %103, %102, %95, %has_permission.exit.thread, %49, %47, %12
  %.0 = phi i32 [ -1, %12 ], [ -1, %47 ], [ -1, %has_permission.exit.thread ], [ -1, %49 ], [ -1, %95 ], [ %fd.0.lcssa, %103 ], [ %fd.0.lcssa, %104 ], [ %fd.0.lcssa, %102 ]
  ret i32 %.0, !dbg !2282
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #8

declare void @klee_warning(i8*) #6

; Function Attrs: nounwind uwtable
define i32 @__fd_openat(i32 %basefd, i8* %pathname, i32 %flags, i32 %mode) #3 {
  %1 = icmp eq i32 %basefd, -100, !dbg !2283
  br i1 %1, label %22, label %2, !dbg !2283

; <label>:2                                       ; preds = %0
  %3 = icmp ult i32 %basefd, 32, !dbg !2284
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !2284

; <label>:4                                       ; preds = %2
  %5 = sext i32 %basefd to i64, !dbg !2286
  %6 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, i32 1, !dbg !2287
  %7 = load i32* %6, align 4, !dbg !2287, !tbaa !2200
  %8 = and i32 %7, 1, !dbg !2287
  %9 = icmp eq i32 %8, 0, !dbg !2287
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2287

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, !dbg !2286
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !2289
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !2289

__get_file.exit.thread:                           ; preds = %__get_file.exit, %4, %2
  %12 = tail call i32* @__errno_location() #4, !dbg !2291
  store i32 9, i32* %12, align 4, !dbg !2291, !tbaa !2189
  br label %104, !dbg !2293

; <label>:13                                      ; preds = %__get_file.exit
  %14 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, i32 3, !dbg !2294
  %15 = load %struct.exe_disk_file_t** %14, align 8, !dbg !2294, !tbaa !2219
  %16 = icmp eq %struct.exe_disk_file_t* %15, null, !dbg !2294
  br i1 %16, label %19, label %17, !dbg !2294

; <label>:17                                      ; preds = %13
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str22, i64 0, i64 0)) #8, !dbg !2296
  %18 = tail call i32* @__errno_location() #4, !dbg !2298
  store i32 2, i32* %18, align 4, !dbg !2298, !tbaa !2189
  br label %104, !dbg !2299

; <label>:19                                      ; preds = %13
  %20 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !2300
  %21 = load i32* %20, align 8, !dbg !2300, !tbaa !2269
  %phitmp = sext i32 %21 to i64, !dbg !2301
  br label %22, !dbg !2301

; <label>:22                                      ; preds = %19, %0
  %.01 = phi i64 [ %phitmp, %19 ], [ -100, %0 ]
  %23 = load i8* %pathname, align 1, !dbg !2302, !tbaa !2142
  %24 = sext i8 %23 to i32, !dbg !2305
  %25 = icmp eq i8 %23, 0, !dbg !2305
  br i1 %25, label %__get_sym_file.exit.thread.preheader, label %26, !dbg !2305

; <label>:26                                      ; preds = %22
  %27 = getelementptr inbounds i8* %pathname, i64 1, !dbg !2305
  %28 = load i8* %27, align 1, !dbg !2305, !tbaa !2142
  %29 = icmp eq i8 %28, 0, !dbg !2305
  br i1 %29, label %.preheader.i, label %__get_sym_file.exit.thread.preheader, !dbg !2305

.preheader.i:                                     ; preds = %26
  %30 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2306, !tbaa !2148
  %31 = icmp eq i32 %30, 0, !dbg !2306
  br i1 %31, label %__get_sym_file.exit.thread.preheader, label %.lr.ph.i, !dbg !2306

; <label>:32                                      ; preds = %.lr.ph.i
  %33 = icmp ult i32 %37, %30, !dbg !2306
  br i1 %33, label %.lr.ph.i, label %__get_sym_file.exit.thread.preheader, !dbg !2306

.lr.ph.i:                                         ; preds = %32, %.preheader.i
  %i.02.i = phi i32 [ %37, %32 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2307
  %sext.i = shl i32 %i.02.i, 24, !dbg !2307
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2307
  %34 = ashr exact i32 %sext.i, 24, !dbg !2307
  %35 = add nsw i32 %34, 65, !dbg !2307
  %36 = icmp eq i32 %24, %35, !dbg !2307
  %37 = add i32 %i.02.i, 1, !dbg !2306
  br i1 %36, label %38, label %32, !dbg !2307

; <label>:38                                      ; preds = %.lr.ph.i
  %39 = zext i32 %i.02.i to i64, !dbg !2308
  %40 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2308, !tbaa !2154
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, i32 2, !dbg !2309
  %42 = load %struct.stat64** %41, align 8, !dbg !2309, !tbaa !2157
  %43 = getelementptr inbounds %struct.stat64* %42, i64 0, i32 1, !dbg !2309
  %44 = load i64* %43, align 8, !dbg !2309, !tbaa !2159
  %45 = icmp eq i64 %44, 0, !dbg !2309
  %46 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, !dbg !2308
  %47 = icmp eq %struct.exe_disk_file_t* %46, null, !dbg !2303
  %or.cond = or i1 %45, %47, !dbg !2309
  br i1 %or.cond, label %__get_sym_file.exit.thread.preheader, label %48, !dbg !2309

; <label>:48                                      ; preds = %38
  %49 = tail call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode), !dbg !2310
  br label %104, !dbg !2310

__get_sym_file.exit.thread:                       ; preds = %__get_sym_file.exit.thread.preheader
  %50 = trunc i64 %indvars.iv.next to i32, !dbg !2312
  %51 = icmp slt i32 %50, 32, !dbg !2312
  br i1 %51, label %__get_sym_file.exit.thread.preheader, label %57, !dbg !2312

__get_sym_file.exit.thread.preheader:             ; preds = %__get_sym_file.exit.thread, %38, %32, %.preheader.i, %26, %22
  %indvars.iv = phi i64 [ %indvars.iv.next, %__get_sym_file.exit.thread ], [ 0, %32 ], [ 0, %22 ], [ 0, %26 ], [ 0, %.preheader.i ], [ 0, %38 ]
  %fd.05 = phi i32 [ %56, %__get_sym_file.exit.thread ], [ 0, %32 ], [ 0, %22 ], [ 0, %26 ], [ 0, %.preheader.i ], [ 0, %38 ]
  %52 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !2314
  %53 = load i32* %52, align 4, !dbg !2314, !tbaa !2200
  %54 = and i32 %53, 1, !dbg !2314
  %55 = icmp eq i32 %54, 0, !dbg !2314
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !2312
  %56 = add nsw i32 %fd.05, 1, !dbg !2312
  br i1 %55, label %57, label %__get_sym_file.exit.thread, !dbg !2314

; <label>:57                                      ; preds = %__get_sym_file.exit.thread.preheader, %__get_sym_file.exit.thread
  %fd.0.lcssa = phi i32 [ %fd.05, %__get_sym_file.exit.thread.preheader ], [ %56, %__get_sym_file.exit.thread ]
  %58 = icmp eq i32 %fd.0.lcssa, 32, !dbg !2316
  br i1 %58, label %59, label %61, !dbg !2316

; <label>:59                                      ; preds = %57
  %60 = tail call i32* @__errno_location() #4, !dbg !2318
  store i32 24, i32* %60, align 4, !dbg !2318, !tbaa !2189
  br label %104, !dbg !2320

; <label>:61                                      ; preds = %57
  %62 = sext i32 %fd.0.lcssa to i64, !dbg !2321
  %63 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %62, !dbg !2321
  %64 = bitcast %struct.exe_file_t* %63 to i8*, !dbg !2322
  %65 = call i8* @memset(i8* %64, i32 0, i64 24)
  %66 = ptrtoint i8* %pathname to i64, !dbg !2323
  %67 = tail call i64 @klee_get_valuel(i64 %66) #8, !dbg !2323
  %68 = inttoptr i64 %67 to i8*, !dbg !2323
  %69 = icmp eq i8* %68, %pathname, !dbg !2326
  %70 = zext i1 %69 to i64, !dbg !2326
  tail call void @klee_assume(i64 %70) #8, !dbg !2326
  br label %71, !dbg !2327

; <label>:71                                      ; preds = %88, %61
  %i.0.i = phi i32 [ 0, %61 ], [ %89, %88 ]
  %sc.0.i = phi i8* [ %68, %61 ], [ %sc.1.i, %88 ]
  %72 = load i8* %sc.0.i, align 1, !dbg !2328, !tbaa !2142
  %73 = add i32 %i.0.i, -1, !dbg !2329
  %74 = and i32 %73, %i.0.i, !dbg !2329
  %75 = icmp eq i32 %74, 0, !dbg !2329
  br i1 %75, label %76, label %80, !dbg !2329

; <label>:76                                      ; preds = %71
  switch i8 %72, label %88 [
    i8 0, label %77
    i8 47, label %78
  ], !dbg !2330

; <label>:77                                      ; preds = %76
  store i8 0, i8* %sc.0.i, align 1, !dbg !2331, !tbaa !2142
  br label %__concretize_string.exit, !dbg !2332

; <label>:78                                      ; preds = %76
  %79 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2333
  store i8 47, i8* %sc.0.i, align 1, !dbg !2333, !tbaa !2142
  br label %88, !dbg !2334

; <label>:80                                      ; preds = %71
  %81 = sext i8 %72 to i64, !dbg !2335
  %82 = tail call i64 @klee_get_valuel(i64 %81) #8, !dbg !2335
  %83 = trunc i64 %82 to i8, !dbg !2335
  %84 = icmp eq i8 %83, %72, !dbg !2336
  %85 = zext i1 %84 to i64, !dbg !2336
  tail call void @klee_assume(i64 %85) #8, !dbg !2336
  %86 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2337
  store i8 %83, i8* %sc.0.i, align 1, !dbg !2337, !tbaa !2142
  %87 = icmp eq i8 %83, 0, !dbg !2338
  br i1 %87, label %__concretize_string.exit, label %88, !dbg !2338

; <label>:88                                      ; preds = %80, %78, %76
  %sc.1.i = phi i8* [ %86, %80 ], [ %79, %78 ], [ %sc.0.i, %76 ]
  %89 = add i32 %i.0.i, 1, !dbg !2327
  br label %71, !dbg !2327

__concretize_string.exit:                         ; preds = %80, %77
  %90 = sext i32 %flags to i64, !dbg !2325
  %91 = tail call i64 (i64, ...)* @syscall(i64 257, i64 %.01, i8* %pathname, i64 %90, i32 %mode) #8, !dbg !2325
  %92 = trunc i64 %91 to i32, !dbg !2325
  %93 = icmp eq i32 %92, -1, !dbg !2339
  br i1 %93, label %94, label %97, !dbg !2339

; <label>:94                                      ; preds = %__concretize_string.exit
  %95 = tail call i32 @klee_get_errno() #8, !dbg !2341
  %96 = tail call i32* @__errno_location() #4, !dbg !2341
  store i32 %95, i32* %96, align 4, !dbg !2341, !tbaa !2189
  br label %104, !dbg !2343

; <label>:97                                      ; preds = %__concretize_string.exit
  %98 = getelementptr inbounds %struct.exe_file_t* %63, i64 0, i32 0, !dbg !2344
  store i32 %92, i32* %98, align 8, !dbg !2344, !tbaa !2269
  %99 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %62, i32 1, !dbg !2345
  store i32 1, i32* %99, align 4, !dbg !2345, !tbaa !2200
  %100 = and i32 %flags, 3, !dbg !2346
  switch i32 %100, label %103 [
    i32 0, label %101
    i32 1, label %102
  ], !dbg !2346

; <label>:101                                     ; preds = %97
  store i32 5, i32* %99, align 4, !dbg !2348, !tbaa !2200
  br label %104, !dbg !2350

; <label>:102                                     ; preds = %97
  store i32 9, i32* %99, align 4, !dbg !2351, !tbaa !2200
  br label %104, !dbg !2354

; <label>:103                                     ; preds = %97
  store i32 13, i32* %99, align 4, !dbg !2355, !tbaa !2200
  br label %104

; <label>:104                                     ; preds = %103, %102, %101, %94, %59, %48, %17, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %17 ], [ %49, %48 ], [ -1, %59 ], [ -1, %94 ], [ -1, %__get_file.exit.thread ], [ %fd.0.lcssa, %102 ], [ %fd.0.lcssa, %103 ], [ %fd.0.lcssa, %101 ]
  ret i32 %.0, !dbg !2357
}

; Function Attrs: nounwind uwtable
define i32 @utimes(i8* %path, %struct.timeval* %times) #3 {
  %1 = load i8* %path, align 1, !dbg !2358, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !2360
  %3 = icmp eq i8 %1, 0, !dbg !2360
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2360

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2360
  %6 = load i8* %5, align 1, !dbg !2360, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !2360
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2360

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2361, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !2361
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2361

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2361
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2361

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2362
  %sext.i = shl i32 %i.02.i, 24, !dbg !2362
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2362
  %12 = ashr exact i32 %sext.i, 24, !dbg !2362
  %13 = add nsw i32 %12, 65, !dbg !2362
  %14 = icmp eq i32 %2, %13, !dbg !2362
  %15 = add i32 %i.02.i, 1, !dbg !2361
  br i1 %14, label %16, label %10, !dbg !2362

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2363
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2363, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2364
  %20 = load %struct.stat64** %19, align 8, !dbg !2364, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2364
  %22 = load i64* %21, align 8, !dbg !2364, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !2364
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2363
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2365
  %or.cond = or i1 %23, %25, !dbg !2364
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2364

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.timeval* %times, i64 0, i32 0, !dbg !2367
  %28 = load i64* %27, align 8, !dbg !2367, !tbaa !2369
  %29 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 11, i32 0, !dbg !2367
  store i64 %28, i64* %29, align 8, !dbg !2367, !tbaa !2371
  %30 = getelementptr inbounds %struct.timeval* %times, i64 1, i32 0, !dbg !2372
  %31 = load i64* %30, align 8, !dbg !2372, !tbaa !2369
  %32 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 12, i32 0, !dbg !2372
  store i64 %31, i64* %32, align 8, !dbg !2372, !tbaa !2373
  br label %63, !dbg !2374

__get_sym_file.exit.thread:                       ; preds = %16, %10, %.preheader.i, %4, %0
  %33 = ptrtoint i8* %path to i64, !dbg !2375
  %34 = tail call i64 @klee_get_valuel(i64 %33) #8, !dbg !2375
  %35 = inttoptr i64 %34 to i8*, !dbg !2375
  %36 = icmp eq i8* %35, %path, !dbg !2378
  %37 = zext i1 %36 to i64, !dbg !2378
  tail call void @klee_assume(i64 %37) #8, !dbg !2378
  br label %38, !dbg !2379

; <label>:38                                      ; preds = %55, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %56, %55 ]
  %sc.0.i = phi i8* [ %35, %__get_sym_file.exit.thread ], [ %sc.1.i, %55 ]
  %39 = load i8* %sc.0.i, align 1, !dbg !2380, !tbaa !2142
  %40 = add i32 %i.0.i, -1, !dbg !2381
  %41 = and i32 %40, %i.0.i, !dbg !2381
  %42 = icmp eq i32 %41, 0, !dbg !2381
  br i1 %42, label %43, label %47, !dbg !2381

; <label>:43                                      ; preds = %38
  switch i8 %39, label %55 [
    i8 0, label %44
    i8 47, label %45
  ], !dbg !2382

; <label>:44                                      ; preds = %43
  store i8 0, i8* %sc.0.i, align 1, !dbg !2383, !tbaa !2142
  br label %__concretize_string.exit, !dbg !2384

; <label>:45                                      ; preds = %43
  %46 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2385
  store i8 47, i8* %sc.0.i, align 1, !dbg !2385, !tbaa !2142
  br label %55, !dbg !2386

; <label>:47                                      ; preds = %38
  %48 = sext i8 %39 to i64, !dbg !2387
  %49 = tail call i64 @klee_get_valuel(i64 %48) #8, !dbg !2387
  %50 = trunc i64 %49 to i8, !dbg !2387
  %51 = icmp eq i8 %50, %39, !dbg !2388
  %52 = zext i1 %51 to i64, !dbg !2388
  tail call void @klee_assume(i64 %52) #8, !dbg !2388
  %53 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2389
  store i8 %50, i8* %sc.0.i, align 1, !dbg !2389, !tbaa !2142
  %54 = icmp eq i8 %50, 0, !dbg !2390
  br i1 %54, label %__concretize_string.exit, label %55, !dbg !2390

; <label>:55                                      ; preds = %47, %45, %43
  %sc.1.i = phi i8* [ %53, %47 ], [ %46, %45 ], [ %sc.0.i, %43 ]
  %56 = add i32 %i.0.i, 1, !dbg !2379
  br label %38, !dbg !2379

__concretize_string.exit:                         ; preds = %47, %44
  %57 = tail call i64 (i64, ...)* @syscall(i64 235, i8* %path, %struct.timeval* %times) #8, !dbg !2377
  %58 = trunc i64 %57 to i32, !dbg !2377
  %59 = icmp eq i32 %58, -1, !dbg !2391
  br i1 %59, label %60, label %63, !dbg !2391

; <label>:60                                      ; preds = %__concretize_string.exit
  %61 = tail call i32 @klee_get_errno() #8, !dbg !2393
  %62 = tail call i32* @__errno_location() #4, !dbg !2393
  store i32 %61, i32* %62, align 4, !dbg !2393, !tbaa !2189
  br label %63, !dbg !2393

; <label>:63                                      ; preds = %60, %__concretize_string.exit, %26
  %.0 = phi i32 [ 0, %26 ], [ -1, %60 ], [ %58, %__concretize_string.exit ]
  ret i32 %.0, !dbg !2394
}

; Function Attrs: nounwind uwtable
define i32 @futimesat(i32 %fd, i8* %path, %struct.timeval* %times) #3 {
  %1 = icmp eq i32 %fd, -100, !dbg !2395
  br i1 %1, label %22, label %2, !dbg !2395

; <label>:2                                       ; preds = %0
  %3 = icmp ult i32 %fd, 32, !dbg !2396
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !2396

; <label>:4                                       ; preds = %2
  %5 = sext i32 %fd to i64, !dbg !2398
  %6 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, i32 1, !dbg !2399
  %7 = load i32* %6, align 4, !dbg !2399, !tbaa !2200
  %8 = and i32 %7, 1, !dbg !2399
  %9 = icmp eq i32 %8, 0, !dbg !2399
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2399

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, !dbg !2398
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !2400
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !2400

__get_file.exit.thread:                           ; preds = %__get_file.exit, %4, %2
  %12 = tail call i32* @__errno_location() #4, !dbg !2402
  store i32 9, i32* %12, align 4, !dbg !2402, !tbaa !2189
  br label %83, !dbg !2404

; <label>:13                                      ; preds = %__get_file.exit
  %14 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, i32 3, !dbg !2405
  %15 = load %struct.exe_disk_file_t** %14, align 8, !dbg !2405, !tbaa !2219
  %16 = icmp eq %struct.exe_disk_file_t* %15, null, !dbg !2405
  br i1 %16, label %19, label %17, !dbg !2405

; <label>:17                                      ; preds = %13
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str22, i64 0, i64 0)) #8, !dbg !2407
  %18 = tail call i32* @__errno_location() #4, !dbg !2409
  store i32 2, i32* %18, align 4, !dbg !2409, !tbaa !2189
  br label %83, !dbg !2410

; <label>:19                                      ; preds = %13
  %20 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !2411
  %21 = load i32* %20, align 8, !dbg !2411, !tbaa !2269
  %phitmp = sext i32 %21 to i64, !dbg !2412
  br label %22, !dbg !2412

; <label>:22                                      ; preds = %19, %0
  %.01 = phi i64 [ %phitmp, %19 ], [ -100, %0 ]
  %23 = load i8* %path, align 1, !dbg !2413, !tbaa !2142
  %24 = sext i8 %23 to i32, !dbg !2416
  %25 = icmp eq i8 %23, 0, !dbg !2416
  br i1 %25, label %__get_sym_file.exit.thread, label %26, !dbg !2416

; <label>:26                                      ; preds = %22
  %27 = getelementptr inbounds i8* %path, i64 1, !dbg !2416
  %28 = load i8* %27, align 1, !dbg !2416, !tbaa !2142
  %29 = icmp eq i8 %28, 0, !dbg !2416
  br i1 %29, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2416

.preheader.i:                                     ; preds = %26
  %30 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2417, !tbaa !2148
  %31 = icmp eq i32 %30, 0, !dbg !2417
  br i1 %31, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2417

; <label>:32                                      ; preds = %.lr.ph.i
  %33 = icmp ult i32 %37, %30, !dbg !2417
  br i1 %33, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2417

.lr.ph.i:                                         ; preds = %32, %.preheader.i
  %i.02.i = phi i32 [ %37, %32 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2418
  %sext.i = shl i32 %i.02.i, 24, !dbg !2418
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2418
  %34 = ashr exact i32 %sext.i, 24, !dbg !2418
  %35 = add nsw i32 %34, 65, !dbg !2418
  %36 = icmp eq i32 %24, %35, !dbg !2418
  %37 = add i32 %i.02.i, 1, !dbg !2417
  br i1 %36, label %38, label %32, !dbg !2418

; <label>:38                                      ; preds = %.lr.ph.i
  %39 = zext i32 %i.02.i to i64, !dbg !2419
  %40 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2419, !tbaa !2154
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, i32 2, !dbg !2420
  %42 = load %struct.stat64** %41, align 8, !dbg !2420, !tbaa !2157
  %43 = getelementptr inbounds %struct.stat64* %42, i64 0, i32 1, !dbg !2420
  %44 = load i64* %43, align 8, !dbg !2420, !tbaa !2159
  %45 = icmp eq i64 %44, 0, !dbg !2420
  %46 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, !dbg !2419
  %47 = icmp eq %struct.exe_disk_file_t* %46, null, !dbg !2414
  %or.cond = or i1 %45, %47, !dbg !2420
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %48, !dbg !2420

; <label>:48                                      ; preds = %38
  %49 = tail call i32 @utimes(i8* %path, %struct.timeval* %times), !dbg !2421
  br label %83, !dbg !2421

__get_sym_file.exit.thread:                       ; preds = %38, %32, %.preheader.i, %26, %22
  %50 = icmp eq i8* %path, null, !dbg !2423
  br i1 %50, label %__concretize_string.exit, label %51, !dbg !2423

; <label>:51                                      ; preds = %__get_sym_file.exit.thread
  %52 = ptrtoint i8* %path to i64, !dbg !2424
  %53 = tail call i64 @klee_get_valuel(i64 %52) #8, !dbg !2424
  %54 = inttoptr i64 %53 to i8*, !dbg !2424
  %55 = icmp eq i8* %54, %path, !dbg !2427
  %56 = zext i1 %55 to i64, !dbg !2427
  tail call void @klee_assume(i64 %56) #8, !dbg !2427
  br label %57, !dbg !2428

; <label>:57                                      ; preds = %74, %51
  %i.0.i = phi i32 [ 0, %51 ], [ %75, %74 ]
  %sc.0.i = phi i8* [ %54, %51 ], [ %sc.1.i, %74 ]
  %58 = load i8* %sc.0.i, align 1, !dbg !2429, !tbaa !2142
  %59 = add i32 %i.0.i, -1, !dbg !2430
  %60 = and i32 %59, %i.0.i, !dbg !2430
  %61 = icmp eq i32 %60, 0, !dbg !2430
  br i1 %61, label %62, label %66, !dbg !2430

; <label>:62                                      ; preds = %57
  switch i8 %58, label %74 [
    i8 0, label %63
    i8 47, label %64
  ], !dbg !2431

; <label>:63                                      ; preds = %62
  store i8 0, i8* %sc.0.i, align 1, !dbg !2432, !tbaa !2142
  br label %__concretize_string.exit, !dbg !2433

; <label>:64                                      ; preds = %62
  %65 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2434
  store i8 47, i8* %sc.0.i, align 1, !dbg !2434, !tbaa !2142
  br label %74, !dbg !2435

; <label>:66                                      ; preds = %57
  %67 = sext i8 %58 to i64, !dbg !2436
  %68 = tail call i64 @klee_get_valuel(i64 %67) #8, !dbg !2436
  %69 = trunc i64 %68 to i8, !dbg !2436
  %70 = icmp eq i8 %69, %58, !dbg !2437
  %71 = zext i1 %70 to i64, !dbg !2437
  tail call void @klee_assume(i64 %71) #8, !dbg !2437
  %72 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2438
  store i8 %69, i8* %sc.0.i, align 1, !dbg !2438, !tbaa !2142
  %73 = icmp eq i8 %69, 0, !dbg !2439
  br i1 %73, label %__concretize_string.exit, label %74, !dbg !2439

; <label>:74                                      ; preds = %66, %64, %62
  %sc.1.i = phi i8* [ %72, %66 ], [ %65, %64 ], [ %sc.0.i, %62 ]
  %75 = add i32 %i.0.i, 1, !dbg !2428
  br label %57, !dbg !2428

__concretize_string.exit:                         ; preds = %66, %63, %__get_sym_file.exit.thread
  %76 = phi i8* [ null, %__get_sym_file.exit.thread ], [ %path, %63 ], [ %path, %66 ], !dbg !2426
  %77 = tail call i64 (i64, ...)* @syscall(i64 261, i64 %.01, i8* %76, %struct.timeval* %times) #8, !dbg !2423
  %78 = trunc i64 %77 to i32, !dbg !2423
  %79 = icmp eq i32 %78, -1, !dbg !2440
  br i1 %79, label %80, label %83, !dbg !2440

; <label>:80                                      ; preds = %__concretize_string.exit
  %81 = tail call i32 @klee_get_errno() #8, !dbg !2442
  %82 = tail call i32* @__errno_location() #4, !dbg !2442
  store i32 %81, i32* %82, align 4, !dbg !2442, !tbaa !2189
  br label %83, !dbg !2442

; <label>:83                                      ; preds = %80, %__concretize_string.exit, %48, %17, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %17 ], [ %49, %48 ], [ -1, %__get_file.exit.thread ], [ -1, %80 ], [ %78, %__concretize_string.exit ]
  ret i32 %.0, !dbg !2443
}

; Function Attrs: nounwind uwtable
define i32 @close(i32 %fd) #3 {
  %1 = load i32* @close.n_calls, align 4, !dbg !2444, !tbaa !2189
  %2 = add nsw i32 %1, 1, !dbg !2444
  store i32 %2, i32* @close.n_calls, align 4, !dbg !2444, !tbaa !2189
  %3 = icmp ult i32 %fd, 32, !dbg !2445
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !2445

; <label>:4                                       ; preds = %0
  %5 = sext i32 %fd to i64, !dbg !2447
  %6 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, i32 1, !dbg !2448
  %7 = load i32* %6, align 4, !dbg !2448, !tbaa !2200
  %8 = and i32 %7, 1, !dbg !2448
  %9 = icmp eq i32 %8, 0, !dbg !2448
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2448

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, !dbg !2447
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !2449
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !2449

__get_file.exit.thread:                           ; preds = %__get_file.exit, %4, %0
  %12 = tail call i32* @__errno_location() #4, !dbg !2451
  store i32 9, i32* %12, align 4, !dbg !2451, !tbaa !2189
  br label %26, !dbg !2453

; <label>:13                                      ; preds = %__get_file.exit
  %14 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2454, !tbaa !2456
  %15 = icmp eq i32 %14, 0, !dbg !2454
  br i1 %15, label %23, label %16, !dbg !2454

; <label>:16                                      ; preds = %13
  %17 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !2454, !tbaa !2457
  %18 = load i32* %17, align 4, !dbg !2454, !tbaa !2189
  %19 = icmp eq i32 %18, %2, !dbg !2454
  br i1 %19, label %20, label %23, !dbg !2454

; <label>:20                                      ; preds = %16
  %21 = add i32 %14, -1, !dbg !2458
  store i32 %21, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2458, !tbaa !2456
  %22 = tail call i32* @__errno_location() #4, !dbg !2460
  store i32 5, i32* %22, align 4, !dbg !2460, !tbaa !2189
  br label %26, !dbg !2461

; <label>:23                                      ; preds = %16, %13
  %24 = bitcast %struct.exe_file_t* %10 to i8*, !dbg !2462
  %25 = call i8* @memset(i8* %24, i32 0, i64 24)
  br label %26, !dbg !2463

; <label>:26                                      ; preds = %23, %20, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %20 ], [ 0, %23 ], [ -1, %__get_file.exit.thread ]
  ret i32 %.0, !dbg !2464
}

; Function Attrs: nounwind uwtable
define i64 @read(i32 %fd, i8* %buf, i64 %count) #3 {
  %1 = load i32* @read.n_calls, align 4, !dbg !2465, !tbaa !2189
  %2 = add nsw i32 %1, 1, !dbg !2465
  store i32 %2, i32* @read.n_calls, align 4, !dbg !2465, !tbaa !2189
  %3 = icmp eq i64 %count, 0, !dbg !2466
  br i1 %3, label %._crit_edge, label %4, !dbg !2466

; <label>:4                                       ; preds = %0
  %5 = icmp eq i8* %buf, null, !dbg !2468
  br i1 %5, label %6, label %8, !dbg !2468

; <label>:6                                       ; preds = %4
  %7 = tail call i32* @__errno_location() #4, !dbg !2470
  store i32 14, i32* %7, align 4, !dbg !2470, !tbaa !2189
  br label %._crit_edge, !dbg !2472

; <label>:8                                       ; preds = %4
  %9 = icmp ult i32 %fd, 32, !dbg !2473
  br i1 %9, label %10, label %__get_file.exit.thread, !dbg !2473

; <label>:10                                      ; preds = %8
  %11 = sext i32 %fd to i64, !dbg !2475
  %12 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %11, i32 1, !dbg !2476
  %13 = load i32* %12, align 4, !dbg !2476, !tbaa !2200
  %14 = and i32 %13, 1, !dbg !2476
  %15 = icmp eq i32 %14, 0, !dbg !2476
  br i1 %15, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2476

__get_file.exit:                                  ; preds = %10
  %16 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %11, !dbg !2475
  %17 = icmp eq %struct.exe_file_t* %16, null, !dbg !2477
  br i1 %17, label %__get_file.exit.thread, label %19, !dbg !2477

__get_file.exit.thread:                           ; preds = %__get_file.exit, %10, %8
  %18 = tail call i32* @__errno_location() #4, !dbg !2479
  store i32 9, i32* %18, align 4, !dbg !2479, !tbaa !2189
  br label %._crit_edge, !dbg !2481

; <label>:19                                      ; preds = %__get_file.exit
  %20 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2482, !tbaa !2456
  %21 = icmp eq i32 %20, 0, !dbg !2482
  br i1 %21, label %29, label %22, !dbg !2482

; <label>:22                                      ; preds = %19
  %23 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 6), align 8, !dbg !2482, !tbaa !2484
  %24 = load i32* %23, align 4, !dbg !2482, !tbaa !2189
  %25 = icmp eq i32 %24, %2, !dbg !2482
  br i1 %25, label %26, label %29, !dbg !2482

; <label>:26                                      ; preds = %22
  %27 = add i32 %20, -1, !dbg !2485
  store i32 %27, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2485, !tbaa !2456
  %28 = tail call i32* @__errno_location() #4, !dbg !2487
  store i32 5, i32* %28, align 4, !dbg !2487, !tbaa !2189
  br label %._crit_edge, !dbg !2488

; <label>:29                                      ; preds = %22, %19
  %30 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %11, i32 3, !dbg !2489
  %31 = load %struct.exe_disk_file_t** %30, align 8, !dbg !2489, !tbaa !2219
  %32 = icmp eq %struct.exe_disk_file_t* %31, null, !dbg !2489
  br i1 %32, label %33, label %63, !dbg !2489

; <label>:33                                      ; preds = %29
  %34 = ptrtoint i8* %buf to i64, !dbg !2490
  %35 = tail call i64 @klee_get_valuel(i64 %34) #8, !dbg !2490
  %36 = inttoptr i64 %35 to i8*, !dbg !2490
  %37 = icmp eq i8* %36, %buf, !dbg !2492
  %38 = zext i1 %37 to i64, !dbg !2492
  tail call void @klee_assume(i64 %38) #8, !dbg !2492
  %39 = tail call i64 @klee_get_valuel(i64 %count) #8, !dbg !2493
  %40 = icmp eq i64 %39, %count, !dbg !2495
  %41 = zext i1 %40 to i64, !dbg !2495
  tail call void @klee_assume(i64 %41) #8, !dbg !2495
  tail call void @klee_check_memory_access(i8* %36, i64 %39) #8, !dbg !2496
  %42 = getelementptr inbounds %struct.exe_file_t* %16, i64 0, i32 0, !dbg !2497
  %43 = load i32* %42, align 8, !dbg !2497, !tbaa !2269
  %44 = icmp eq i32 %43, 0, !dbg !2497
  br i1 %44, label %45, label %47, !dbg !2497

; <label>:45                                      ; preds = %33
  %46 = tail call i64 (i64, ...)* @syscall(i64 0, i32 0, i8* %36, i64 %39) #8, !dbg !2499
  br label %51, !dbg !2499

; <label>:47                                      ; preds = %33
  %48 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %11, i32 2, !dbg !2500
  %49 = load i64* %48, align 8, !dbg !2500, !tbaa !2501
  %50 = tail call i64 (i64, ...)* @syscall(i64 17, i32 %43, i8* %36, i64 %39, i64 %49) #8, !dbg !2500
  br label %51

; <label>:51                                      ; preds = %47, %45
  %r.0.in = phi i64 [ %46, %45 ], [ %50, %47 ]
  %r.0 = trunc i64 %r.0.in to i32, !dbg !2499
  %52 = icmp eq i32 %r.0, -1, !dbg !2502
  br i1 %52, label %53, label %56, !dbg !2502

; <label>:53                                      ; preds = %51
  %54 = tail call i32 @klee_get_errno() #8, !dbg !2504
  %55 = tail call i32* @__errno_location() #4, !dbg !2504
  store i32 %54, i32* %55, align 4, !dbg !2504, !tbaa !2189
  br label %._crit_edge, !dbg !2506

; <label>:56                                      ; preds = %51
  %57 = load i32* %42, align 8, !dbg !2507, !tbaa !2269
  %58 = icmp eq i32 %57, 0, !dbg !2507
  %int_cast_to_i64 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i64), !dbg !2509
  %sext.pre = shl i64 %r.0.in, 32, !dbg !2509
  %int_cast_to_i641 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !2509
  %.pre = ashr exact i64 %sext.pre, 32, !dbg !2509
  br i1 %58, label %._crit_edge, label %59, !dbg !2507

; <label>:59                                      ; preds = %56
  %60 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %11, i32 2, !dbg !2510
  %61 = load i64* %60, align 8, !dbg !2510, !tbaa !2501
  %62 = add nsw i64 %61, %.pre, !dbg !2510
  store i64 %62, i64* %60, align 8, !dbg !2510, !tbaa !2501
  br label %._crit_edge, !dbg !2510

; <label>:63                                      ; preds = %29
  %64 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %11, i32 2, !dbg !2511
  %65 = load i64* %64, align 8, !dbg !2511, !tbaa !2501
  %66 = icmp sgt i64 %65, -1, !dbg !2511
  br i1 %66, label %68, label %67, !dbg !2511

; <label>:67                                      ; preds = %63
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str33, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str44, i64 0, i64 0), i32 386, i8* getelementptr inbounds ([34 x i8]* @__PRETTY_FUNCTION__.read, i64 0, i64 0)) #16, !d
  unreachable, !dbg !2511

; <label>:68                                      ; preds = %63
  %69 = getelementptr inbounds %struct.exe_disk_file_t* %31, i64 0, i32 0, !dbg !2513
  %70 = load i32* %69, align 4, !dbg !2513, !tbaa !2515
  %71 = zext i32 %70 to i64, !dbg !2513
  %72 = icmp slt i64 %71, %65, !dbg !2513
  br i1 %72, label %._crit_edge, label %73, !dbg !2513

; <label>:73                                      ; preds = %68
  %74 = add i64 %65, %count, !dbg !2516
  %75 = icmp ugt i64 %74, %71, !dbg !2516
  %76 = sub nsw i64 %71, %65, !dbg !2518
  %.count = select i1 %75, i64 %76, i64 %count, !dbg !2516
  %77 = getelementptr inbounds %struct.exe_disk_file_t* %31, i64 0, i32 1, !dbg !2520
  %78 = load i8** %77, align 8, !dbg !2520, !tbaa !2521
  %79 = getelementptr inbounds i8* %78, i64 %65, !dbg !2520
  %80 = call i8* @memcpy(i8* %buf, i8* %79, i64 %.count)
  %81 = load i64* %64, align 8, !dbg !2522, !tbaa !2501
  %82 = add i64 %81, %.count, !dbg !2522
  store i64 %82, i64* %64, align 8, !dbg !2522, !tbaa !2501
  br label %._crit_edge, !dbg !2523

._crit_edge:                                      ; preds = %73, %68, %59, %56, %53, %26, %__get_file.exit.thread, %6, %0
  %.0 = phi i64 [ -1, %6 ], [ -1, %26 ], [ %.count, %73 ], [ -1, %53 ], [ -1, %__get_file.exit.thread ], [ 0, %0 ], [ 0, %68 ], [ %.pre, %59 ], [ %.pre, %56 ]
  ret i64 %.0, !dbg !2524
}

declare void @klee_check_memory_access(i8*, i64) #6

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #8

; Function Attrs: nounwind uwtable
define i64 @write(i32 %fd, i8* %buf, i64 %count) #3 {
  %1 = load i32* @write.n_calls, align 4, !dbg !2525, !tbaa !2189
  %2 = add nsw i32 %1, 1, !dbg !2525
  store i32 %2, i32* @write.n_calls, align 4, !dbg !2525, !tbaa !2189
  %3 = icmp ult i32 %fd, 32, !dbg !2526
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !2526

; <label>:4                                       ; preds = %0
  %5 = sext i32 %fd to i64, !dbg !2528
  %6 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, i32 1, !dbg !2529
  %7 = load i32* %6, align 4, !dbg !2529, !tbaa !2200
  %8 = and i32 %7, 1, !dbg !2529
  %9 = icmp eq i32 %8, 0, !dbg !2529
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2529

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, !dbg !2528
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !2530
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !2530

__get_file.exit.thread:                           ; preds = %__get_file.exit, %4, %0
  %12 = tail call i32* @__errno_location() #4, !dbg !2532
  store i32 9, i32* %12, align 4, !dbg !2532, !tbaa !2189
  br label %._crit_edge, !dbg !2534

; <label>:13                                      ; preds = %__get_file.exit
  %14 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2535, !tbaa !2456
  %15 = icmp eq i32 %14, 0, !dbg !2535
  br i1 %15, label %23, label %16, !dbg !2535

; <label>:16                                      ; preds = %13
  %17 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !2535, !tbaa !2537
  %18 = load i32* %17, align 4, !dbg !2535, !tbaa !2189
  %19 = icmp eq i32 %18, %2, !dbg !2535
  br i1 %19, label %20, label %23, !dbg !2535

; <label>:20                                      ; preds = %16
  %21 = add i32 %14, -1, !dbg !2538
  store i32 %21, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2538, !tbaa !2456
  %22 = tail call i32* @__errno_location() #4, !dbg !2540
  store i32 5, i32* %22, align 4, !dbg !2540, !tbaa !2189
  br label %._crit_edge, !dbg !2541

; <label>:23                                      ; preds = %16, %13
  %24 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, i32 3, !dbg !2542
  %25 = load %struct.exe_disk_file_t** %24, align 8, !dbg !2542, !tbaa !2219
  %26 = icmp eq %struct.exe_disk_file_t* %25, null, !dbg !2542
  br i1 %26, label %27, label %58, !dbg !2542

; <label>:27                                      ; preds = %23
  %28 = ptrtoint i8* %buf to i64, !dbg !2543
  %29 = tail call i64 @klee_get_valuel(i64 %28) #8, !dbg !2543
  %30 = inttoptr i64 %29 to i8*, !dbg !2543
  %31 = icmp eq i8* %30, %buf, !dbg !2545
  %32 = zext i1 %31 to i64, !dbg !2545
  tail call void @klee_assume(i64 %32) #8, !dbg !2545
  %33 = tail call i64 @klee_get_valuel(i64 %count) #8, !dbg !2546
  %34 = icmp eq i64 %33, %count, !dbg !2548
  %35 = zext i1 %34 to i64, !dbg !2548
  tail call void @klee_assume(i64 %35) #8, !dbg !2548
  tail call void @klee_check_memory_access(i8* %30, i64 %33) #8, !dbg !2549
  %36 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !2550
  %37 = load i32* %36, align 8, !dbg !2550, !tbaa !2269
  %.off = add i32 %37, -1, !dbg !2550
  %switch = icmp ult i32 %.off, 2, !dbg !2550
  br i1 %switch, label %38, label %40, !dbg !2550

; <label>:38                                      ; preds = %27
  %39 = tail call i64 (i64, ...)* @syscall(i64 1, i32 %37, i8* %30, i64 %33) #8, !dbg !2552
  br label %44, !dbg !2552

; <label>:40                                      ; preds = %27
  %41 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, i32 2, !dbg !2553
  %42 = load i64* %41, align 8, !dbg !2553, !tbaa !2501
  %43 = tail call i64 (i64, ...)* @syscall(i64 18, i32 %37, i8* %30, i64 %33, i64 %42) #8, !dbg !2553
  br label %44

; <label>:44                                      ; preds = %40, %38
  %r.0.in = phi i64 [ %39, %38 ], [ %43, %40 ]
  %r.0 = trunc i64 %r.0.in to i32, !dbg !2552
  %45 = icmp eq i32 %r.0, -1, !dbg !2554
  br i1 %45, label %46, label %49, !dbg !2554

; <label>:46                                      ; preds = %44
  %47 = tail call i32 @klee_get_errno() #8, !dbg !2556
  %48 = tail call i32* @__errno_location() #4, !dbg !2556
  store i32 %47, i32* %48, align 4, !dbg !2556, !tbaa !2189
  br label %._crit_edge, !dbg !2558

; <label>:49                                      ; preds = %44
  %50 = icmp sgt i32 %r.0, -1, !dbg !2559
  br i1 %50, label %52, label %51, !dbg !2559

; <label>:51                                      ; preds = %49
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str55, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str44, i64 0, i64 0), i32 440, i8* getelementptr inbounds ([41 x i8]* @__PRETTY_FUNCTION__.write, i64 0, i64 0)) #16, !d
  unreachable, !dbg !2559

; <label>:52                                      ; preds = %49
  %53 = load i32* %36, align 8, !dbg !2560, !tbaa !2269
  %.off2 = add i32 %53, -1, !dbg !2560
  %switch3 = icmp ult i32 %.off2, 2, !dbg !2560
  %int_cast_to_i64 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i64), !dbg !2562
  %sext.pre = shl i64 %r.0.in, 32, !dbg !2562
  %int_cast_to_i641 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !2562
  %.pre = ashr exact i64 %sext.pre, 32, !dbg !2562
  br i1 %switch3, label %._crit_edge, label %54, !dbg !2560

; <label>:54                                      ; preds = %52
  %55 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, i32 2, !dbg !2563
  %56 = load i64* %55, align 8, !dbg !2563, !tbaa !2501
  %57 = add nsw i64 %56, %.pre, !dbg !2563
  store i64 %57, i64* %55, align 8, !dbg !2563, !tbaa !2501
  br label %._crit_edge, !dbg !2563

; <label>:58                                      ; preds = %23
  %59 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, i32 2, !dbg !2564
  %60 = load i64* %59, align 8, !dbg !2564, !tbaa !2501
  %61 = add i64 %60, %count, !dbg !2564
  %62 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 0, i32 0, !dbg !2564
  %63 = load i32* %62, align 4, !dbg !2564, !tbaa !2515
  %64 = zext i32 %63 to i64, !dbg !2564
  %65 = icmp ugt i64 %61, %64, !dbg !2564
  br i1 %65, label %66, label %select.unfold, !dbg !2564

; <label>:66                                      ; preds = %58
  %67 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 3), align 8, !dbg !2566, !tbaa !2569
  %68 = icmp eq i32 %67, 0, !dbg !2566
  br i1 %68, label %70, label %69, !dbg !2566

; <label>:69                                      ; preds = %66
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8]* @.str6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str44, i64 0, i64 0), i32 453, i8* getelementptr inbounds ([41 x i8]* @__PRETTY_FUNCTION__.write, i64 0, i64 0)) #16, !db
  unreachable, !dbg !2570

; <label>:70                                      ; preds = %66
  %71 = icmp sgt i64 %64, %60, !dbg !2571
  %72 = sub nsw i64 %64, %60, !dbg !2574
  br i1 %71, label %select.unfold, label %.thread

select.unfold:                                    ; preds = %70, %58
  %actual_count.0 = phi i64 [ %count, %58 ], [ %72, %70 ]
  %73 = icmp eq i64 %actual_count.0, 0, !dbg !2575
  br i1 %73, label %.thread, label %74, !dbg !2575

; <label>:74                                      ; preds = %select.unfold
  %75 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 0, i32 1, !dbg !2577
  %76 = load i8** %75, align 8, !dbg !2577, !tbaa !2521
  %77 = getelementptr inbounds i8* %76, i64 %60, !dbg !2577
  %78 = call i8* @memcpy(i8* %77, i8* %buf, i64 %actual_count.0)
  br label %.thread, !dbg !2577

.thread:                                          ; preds = %74, %select.unfold, %70
  %actual_count.04 = phi i64 [ 0, %select.unfold ], [ %actual_count.0, %74 ], [ 0, %70 ]
  %79 = icmp eq i64 %actual_count.04, %count, !dbg !2578
  br i1 %79, label %81, label %80, !dbg !2578

; <label>:80                                      ; preds = %.thread
  tail call void @klee_warning(i8* getelementptr inbounds ([24 x i8]* @.str7, i64 0, i64 0)) #8, !dbg !2580
  br label %81, !dbg !2580

; <label>:81                                      ; preds = %80, %.thread
  %82 = load %struct.exe_disk_file_t** %24, align 8, !dbg !2581, !tbaa !2219
  %83 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !2581, !tbaa !2583
  %84 = icmp eq %struct.exe_disk_file_t* %82, %83, !dbg !2581
  br i1 %84, label %85, label %90, !dbg !2581

; <label>:85                                      ; preds = %81
  %86 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !2584, !tbaa !2585
  %87 = zext i32 %86 to i64, !dbg !2584
  %88 = add i64 %87, %actual_count.04, !dbg !2584
  %89 = trunc i64 %88 to i32, !dbg !2584
  store i32 %89, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !2584, !tbaa !2585
  br label %90, !dbg !2584

; <label>:90                                      ; preds = %85, %81
  %91 = load i64* %59, align 8, !dbg !2586, !tbaa !2501
  %92 = add i64 %91, %count, !dbg !2586
  store i64 %92, i64* %59, align 8, !dbg !2586, !tbaa !2501
  br label %._crit_edge, !dbg !2587

._crit_edge:                                      ; preds = %90, %54, %52, %46, %20, %__get_file.exit.thread
  %.0 = phi i64 [ -1, %20 ], [ %count, %90 ], [ -1, %46 ], [ -1, %__get_file.exit.thread ], [ %.pre, %54 ], [ %.pre, %52 ]
  ret i64 %.0, !dbg !2588
}

; Function Attrs: nounwind uwtable
define i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) #3 {
  %1 = icmp ult i32 %fd, 32, !dbg !2589
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2589

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !2591
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !2592
  %5 = load i32* %4, align 4, !dbg !2592, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !2592
  %7 = icmp eq i32 %6, 0, !dbg !2592
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2592

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !2591
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2593
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !2593

__get_file.exit.thread:                           ; preds = %__get_file.exit, %2, %0
  %10 = tail call i32* @__errno_location() #4, !dbg !2595
  store i32 9, i32* %10, align 4, !dbg !2595, !tbaa !2189
  br label %57, !dbg !2597

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 3, !dbg !2598
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !2598, !tbaa !2219
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !2598
  br i1 %14, label %15, label %39, !dbg !2598

; <label>:15                                      ; preds = %11
  %16 = icmp eq i32 %whence, 0, !dbg !2600
  %17 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !2603
  %18 = load i32* %17, align 8, !dbg !2603, !tbaa !2269
  br i1 %16, label %19, label %21, !dbg !2600

; <label>:19                                      ; preds = %15
  %20 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %18, i64 %offset, i32 0) #8, !dbg !2603
  br label %33, !dbg !2605

; <label>:21                                      ; preds = %15
  %22 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 2, !dbg !2606
  %23 = load i64* %22, align 8, !dbg !2606, !tbaa !2501
  %24 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %18, i64 %23, i32 0) #8, !dbg !2606
  %25 = icmp eq i64 %24, -1, !dbg !2608
  br i1 %25, label %.thread, label %26, !dbg !2608

; <label>:26                                      ; preds = %21
  %27 = load i64* %22, align 8, !dbg !2610, !tbaa !2501
  %28 = icmp eq i64 %24, %27, !dbg !2610
  br i1 %28, label %30, label %29, !dbg !2610

; <label>:29                                      ; preds = %26
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str44, i64 0, i64 0), i32 499, i8* getelementptr inbounds ([38 x i8]* @__PRETTY_FUNCTION__.__fd_lseek, i64 0, i64 0)) #1
  unreachable, !dbg !2610

; <label>:30                                      ; preds = %26
  %31 = load i32* %17, align 8, !dbg !2612, !tbaa !2269
  %32 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %31, i64 %offset, i32 %whence) #8, !dbg !2612
  br label %33, !dbg !2613

; <label>:33                                      ; preds = %30, %19
  %new_off.0 = phi i64 [ %20, %19 ], [ %32, %30 ]
  %34 = icmp eq i64 %new_off.0, -1, !dbg !2614
  br i1 %34, label %.thread, label %37, !dbg !2614

.thread:                                          ; preds = %33, %21
  %35 = tail call i32 @klee_get_errno() #8, !dbg !2616
  %36 = tail call i32* @__errno_location() #4, !dbg !2616
  store i32 %35, i32* %36, align 4, !dbg !2616, !tbaa !2189
  br label %57, !dbg !2618

; <label>:37                                      ; preds = %33
  %38 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 2, !dbg !2619
  store i64 %new_off.0, i64* %38, align 8, !dbg !2619, !tbaa !2501
  br label %57, !dbg !2620

; <label>:39                                      ; preds = %11
  switch i32 %whence, label %49 [
    i32 0, label %51
    i32 1, label %40
    i32 2, label %44
  ], !dbg !2621

; <label>:40                                      ; preds = %39
  %41 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 2, !dbg !2622
  %42 = load i64* %41, align 8, !dbg !2622, !tbaa !2501
  %43 = add nsw i64 %42, %offset, !dbg !2622
  br label %51, !dbg !2622

; <label>:44                                      ; preds = %39
  %45 = getelementptr inbounds %struct.exe_disk_file_t* %13, i64 0, i32 0, !dbg !2624
  %46 = load i32* %45, align 4, !dbg !2624, !tbaa !2515
  %47 = zext i32 %46 to i64, !dbg !2624
  %48 = add nsw i64 %47, %offset, !dbg !2624
  br label %51, !dbg !2624

; <label>:49                                      ; preds = %39
  %50 = tail call i32* @__errno_location() #4, !dbg !2625
  store i32 22, i32* %50, align 4, !dbg !2625, !tbaa !2189
  br label %57, !dbg !2627

; <label>:51                                      ; preds = %44, %40, %39
  %new_off.1 = phi i64 [ %48, %44 ], [ %43, %40 ], [ %offset, %39 ]
  %52 = icmp slt i64 %new_off.1, 0, !dbg !2628
  br i1 %52, label %53, label %55, !dbg !2628

; <label>:53                                      ; preds = %51
  %54 = tail call i32* @__errno_location() #4, !dbg !2630
  store i32 22, i32* %54, align 4, !dbg !2630, !tbaa !2189
  br label %57, !dbg !2632

; <label>:55                                      ; preds = %51
  %56 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 2, !dbg !2633
  store i64 %new_off.1, i64* %56, align 8, !dbg !2633, !tbaa !2501
  br label %57, !dbg !2634

; <label>:57                                      ; preds = %55, %53, %49, %37, %.thread, %__get_file.exit.thread
  %.0 = phi i64 [ -1, %49 ], [ -1, %53 ], [ %new_off.1, %55 ], [ -1, %.thread ], [ %new_off.0, %37 ], [ -1, %__get_file.exit.thread ]
  ret i64 %.0, !dbg !2635
}

; Function Attrs: nounwind uwtable
define i32 @__fd_stat(i8* %path, %struct.stat64* %buf) #3 {
  %1 = load i8* %path, align 1, !dbg !2636, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !2638
  %3 = icmp eq i8 %1, 0, !dbg !2638
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2638

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2638
  %6 = load i8* %5, align 1, !dbg !2638, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !2638
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2638

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2639, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !2639
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2639

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2639
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2639

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2640
  %sext.i = shl i32 %i.02.i, 24, !dbg !2640
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2640
  %12 = ashr exact i32 %sext.i, 24, !dbg !2640
  %13 = add nsw i32 %12, 65, !dbg !2640
  %14 = icmp eq i32 %2, %13, !dbg !2640
  %15 = add i32 %i.02.i, 1, !dbg !2639
  br i1 %14, label %16, label %10, !dbg !2640

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2641
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2641, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2642
  %20 = load %struct.stat64** %19, align 8, !dbg !2642, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2642
  %22 = load i64* %21, align 8, !dbg !2642, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !2642
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2641
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2643
  %or.cond = or i1 %23, %25, !dbg !2642
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2642

; <label>:26                                      ; preds = %16
  %27 = bitcast %struct.stat64* %buf to i8*, !dbg !2645
  %28 = bitcast %struct.stat64* %20 to i8*, !dbg !2645
  %29 = call i8* @memcpy(i8* %27, i8* %28, i64 144)
  br label %60, !dbg !2647

__get_sym_file.exit.thread:                       ; preds = %16, %10, %.preheader.i, %4, %0
  %30 = ptrtoint i8* %path to i64, !dbg !2648
  %31 = tail call i64 @klee_get_valuel(i64 %30) #8, !dbg !2648
  %32 = inttoptr i64 %31 to i8*, !dbg !2648
  %33 = icmp eq i8* %32, %path, !dbg !2651
  %34 = zext i1 %33 to i64, !dbg !2651
  tail call void @klee_assume(i64 %34) #8, !dbg !2651
  br label %35, !dbg !2652

; <label>:35                                      ; preds = %52, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %53, %52 ]
  %sc.0.i = phi i8* [ %32, %__get_sym_file.exit.thread ], [ %sc.1.i, %52 ]
  %36 = load i8* %sc.0.i, align 1, !dbg !2653, !tbaa !2142
  %37 = add i32 %i.0.i, -1, !dbg !2654
  %38 = and i32 %37, %i.0.i, !dbg !2654
  %39 = icmp eq i32 %38, 0, !dbg !2654
  br i1 %39, label %40, label %44, !dbg !2654

; <label>:40                                      ; preds = %35
  switch i8 %36, label %52 [
    i8 0, label %41
    i8 47, label %42
  ], !dbg !2655

; <label>:41                                      ; preds = %40
  store i8 0, i8* %sc.0.i, align 1, !dbg !2656, !tbaa !2142
  br label %__concretize_string.exit, !dbg !2657

; <label>:42                                      ; preds = %40
  %43 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2658
  store i8 47, i8* %sc.0.i, align 1, !dbg !2658, !tbaa !2142
  br label %52, !dbg !2659

; <label>:44                                      ; preds = %35
  %45 = sext i8 %36 to i64, !dbg !2660
  %46 = tail call i64 @klee_get_valuel(i64 %45) #8, !dbg !2660
  %47 = trunc i64 %46 to i8, !dbg !2660
  %48 = icmp eq i8 %47, %36, !dbg !2661
  %49 = zext i1 %48 to i64, !dbg !2661
  tail call void @klee_assume(i64 %49) #8, !dbg !2661
  %50 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2662
  store i8 %47, i8* %sc.0.i, align 1, !dbg !2662, !tbaa !2142
  %51 = icmp eq i8 %47, 0, !dbg !2663
  br i1 %51, label %__concretize_string.exit, label %52, !dbg !2663

; <label>:52                                      ; preds = %44, %42, %40
  %sc.1.i = phi i8* [ %50, %44 ], [ %43, %42 ], [ %sc.0.i, %40 ]
  %53 = add i32 %i.0.i, 1, !dbg !2652
  br label %35, !dbg !2652

__concretize_string.exit:                         ; preds = %44, %41
  %54 = tail call i64 (i64, ...)* @syscall(i64 4, i8* %path, %struct.stat64* %buf) #8, !dbg !2650
  %55 = trunc i64 %54 to i32, !dbg !2650
  %56 = icmp eq i32 %55, -1, !dbg !2664
  br i1 %56, label %57, label %60, !dbg !2664

; <label>:57                                      ; preds = %__concretize_string.exit
  %58 = tail call i32 @klee_get_errno() #8, !dbg !2666
  %59 = tail call i32* @__errno_location() #4, !dbg !2666
  store i32 %58, i32* %59, align 4, !dbg !2666, !tbaa !2189
  br label %60, !dbg !2666

; <label>:60                                      ; preds = %57, %__concretize_string.exit, %26
  %.0 = phi i32 [ 0, %26 ], [ -1, %57 ], [ %55, %__concretize_string.exit ]
  ret i32 %.0, !dbg !2667
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @fstatat(i32 %fd, i8* %path, %struct.stat* %buf, i32 %flags) #9 {
  %1 = icmp eq i32 %fd, -100, !dbg !2668
  br i1 %1, label %22, label %2, !dbg !2668

; <label>:2                                       ; preds = %0
  %3 = icmp ult i32 %fd, 32, !dbg !2669
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !2669

; <label>:4                                       ; preds = %2
  %5 = sext i32 %fd to i64, !dbg !2671
  %6 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, i32 1, !dbg !2672
  %7 = load i32* %6, align 4, !dbg !2672, !tbaa !2200
  %8 = and i32 %7, 1, !dbg !2672
  %9 = icmp eq i32 %8, 0, !dbg !2672
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2672

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, !dbg !2671
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !2673
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !2673

__get_file.exit.thread:                           ; preds = %__get_file.exit, %4, %2
  %12 = tail call i32* @__errno_location() #4, !dbg !2675
  store i32 9, i32* %12, align 4, !dbg !2675, !tbaa !2189
  br label %86, !dbg !2677

; <label>:13                                      ; preds = %__get_file.exit
  %14 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %5, i32 3, !dbg !2678
  %15 = load %struct.exe_disk_file_t** %14, align 8, !dbg !2678, !tbaa !2219
  %16 = icmp eq %struct.exe_disk_file_t* %15, null, !dbg !2678
  br i1 %16, label %19, label %17, !dbg !2678

; <label>:17                                      ; preds = %13
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str22, i64 0, i64 0)) #8, !dbg !2680
  %18 = tail call i32* @__errno_location() #4, !dbg !2682
  store i32 2, i32* %18, align 4, !dbg !2682, !tbaa !2189
  br label %86, !dbg !2683

; <label>:19                                      ; preds = %13
  %20 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !2684
  %21 = load i32* %20, align 8, !dbg !2684, !tbaa !2269
  %phitmp = sext i32 %21 to i64, !dbg !2685
  br label %22, !dbg !2685

; <label>:22                                      ; preds = %19, %0
  %.01 = phi i64 [ %phitmp, %19 ], [ -100, %0 ]
  %23 = load i8* %path, align 1, !dbg !2686, !tbaa !2142
  %24 = sext i8 %23 to i32, !dbg !2688
  %25 = icmp eq i8 %23, 0, !dbg !2688
  br i1 %25, label %__get_sym_file.exit.thread, label %26, !dbg !2688

; <label>:26                                      ; preds = %22
  %27 = getelementptr inbounds i8* %path, i64 1, !dbg !2688
  %28 = load i8* %27, align 1, !dbg !2688, !tbaa !2142
  %29 = icmp eq i8 %28, 0, !dbg !2688
  br i1 %29, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2688

.preheader.i:                                     ; preds = %26
  %30 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2689, !tbaa !2148
  %31 = icmp eq i32 %30, 0, !dbg !2689
  br i1 %31, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2689

; <label>:32                                      ; preds = %.lr.ph.i
  %33 = icmp ult i32 %37, %30, !dbg !2689
  br i1 %33, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2689

.lr.ph.i:                                         ; preds = %32, %.preheader.i
  %i.02.i = phi i32 [ %37, %32 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2690
  %sext.i = shl i32 %i.02.i, 24, !dbg !2690
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2690
  %34 = ashr exact i32 %sext.i, 24, !dbg !2690
  %35 = add nsw i32 %34, 65, !dbg !2690
  %36 = icmp eq i32 %24, %35, !dbg !2690
  %37 = add i32 %i.02.i, 1, !dbg !2689
  br i1 %36, label %38, label %32, !dbg !2690

; <label>:38                                      ; preds = %.lr.ph.i
  %39 = zext i32 %i.02.i to i64, !dbg !2691
  %40 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2691, !tbaa !2154
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, i32 2, !dbg !2692
  %42 = load %struct.stat64** %41, align 8, !dbg !2692, !tbaa !2157
  %43 = getelementptr inbounds %struct.stat64* %42, i64 0, i32 1, !dbg !2692
  %44 = load i64* %43, align 8, !dbg !2692, !tbaa !2159
  %45 = icmp eq i64 %44, 0, !dbg !2692
  %46 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, !dbg !2691
  %47 = icmp eq %struct.exe_disk_file_t* %46, null, !dbg !2693
  %or.cond = or i1 %45, %47, !dbg !2692
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %48, !dbg !2692

; <label>:48                                      ; preds = %38
  %49 = bitcast %struct.stat* %buf to i8*, !dbg !2695
  %50 = bitcast %struct.stat64* %42 to i8*, !dbg !2695
  %51 = call i8* @memcpy(i8* %49, i8* %50, i64 144)
  br label %86, !dbg !2697

__get_sym_file.exit.thread:                       ; preds = %38, %32, %.preheader.i, %26, %22
  %52 = icmp eq i8* %path, null, !dbg !2698
  br i1 %52, label %__concretize_string.exit, label %53, !dbg !2698

; <label>:53                                      ; preds = %__get_sym_file.exit.thread
  %54 = ptrtoint i8* %path to i64, !dbg !2699
  %55 = tail call i64 @klee_get_valuel(i64 %54) #8, !dbg !2699
  %56 = inttoptr i64 %55 to i8*, !dbg !2699
  %57 = icmp eq i8* %56, %path, !dbg !2702
  %58 = zext i1 %57 to i64, !dbg !2702
  tail call void @klee_assume(i64 %58) #8, !dbg !2702
  br label %59, !dbg !2703

; <label>:59                                      ; preds = %76, %53
  %i.0.i = phi i32 [ 0, %53 ], [ %77, %76 ]
  %sc.0.i = phi i8* [ %56, %53 ], [ %sc.1.i, %76 ]
  %60 = load i8* %sc.0.i, align 1, !dbg !2704, !tbaa !2142
  %61 = add i32 %i.0.i, -1, !dbg !2705
  %62 = and i32 %61, %i.0.i, !dbg !2705
  %63 = icmp eq i32 %62, 0, !dbg !2705
  br i1 %63, label %64, label %68, !dbg !2705

; <label>:64                                      ; preds = %59
  switch i8 %60, label %76 [
    i8 0, label %65
    i8 47, label %66
  ], !dbg !2706

; <label>:65                                      ; preds = %64
  store i8 0, i8* %sc.0.i, align 1, !dbg !2707, !tbaa !2142
  br label %__concretize_string.exit, !dbg !2708

; <label>:66                                      ; preds = %64
  %67 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2709
  store i8 47, i8* %sc.0.i, align 1, !dbg !2709, !tbaa !2142
  br label %76, !dbg !2710

; <label>:68                                      ; preds = %59
  %69 = sext i8 %60 to i64, !dbg !2711
  %70 = tail call i64 @klee_get_valuel(i64 %69) #8, !dbg !2711
  %71 = trunc i64 %70 to i8, !dbg !2711
  %72 = icmp eq i8 %71, %60, !dbg !2712
  %73 = zext i1 %72 to i64, !dbg !2712
  tail call void @klee_assume(i64 %73) #8, !dbg !2712
  %74 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2713
  store i8 %71, i8* %sc.0.i, align 1, !dbg !2713, !tbaa !2142
  %75 = icmp eq i8 %71, 0, !dbg !2714
  br i1 %75, label %__concretize_string.exit, label %76, !dbg !2714

; <label>:76                                      ; preds = %68, %66, %64
  %sc.1.i = phi i8* [ %74, %68 ], [ %67, %66 ], [ %sc.0.i, %64 ]
  %77 = add i32 %i.0.i, 1, !dbg !2703
  br label %59, !dbg !2703

__concretize_string.exit:                         ; preds = %68, %65, %__get_sym_file.exit.thread
  %78 = phi i8* [ null, %__get_sym_file.exit.thread ], [ %path, %65 ], [ %path, %68 ], !dbg !2701
  %79 = sext i32 %flags to i64, !dbg !2698
  %80 = tail call i64 (i64, ...)* @syscall(i64 262, i64 %.01, i8* %78, %struct.stat* %buf, i64 %79) #8, !dbg !2698
  %81 = trunc i64 %80 to i32, !dbg !2698
  %82 = icmp eq i32 %81, -1, !dbg !2715
  br i1 %82, label %83, label %86, !dbg !2715

; <label>:83                                      ; preds = %__concretize_string.exit
  %84 = tail call i32 @klee_get_errno() #8, !dbg !2717
  %85 = tail call i32* @__errno_location() #4, !dbg !2717
  store i32 %84, i32* %85, align 4, !dbg !2717, !tbaa !2189
  br label %86, !dbg !2717

; <label>:86                                      ; preds = %83, %__concretize_string.exit, %48, %17, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %17 ], [ 0, %48 ], [ -1, %__get_file.exit.thread ], [ -1, %83 ], [ %81, %__concretize_string.exit ]
  ret i32 %.0, !dbg !2718
}

; Function Attrs: nounwind uwtable
define i32 @__fd_lstat(i8* %path, %struct.stat64* %buf) #3 {
  %1 = load i8* %path, align 1, !dbg !2719, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !2721
  %3 = icmp eq i8 %1, 0, !dbg !2721
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2721

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2721
  %6 = load i8* %5, align 1, !dbg !2721, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !2721
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2721

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2722, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !2722
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2722

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2722
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2722

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2723
  %sext.i = shl i32 %i.02.i, 24, !dbg !2723
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2723
  %12 = ashr exact i32 %sext.i, 24, !dbg !2723
  %13 = add nsw i32 %12, 65, !dbg !2723
  %14 = icmp eq i32 %2, %13, !dbg !2723
  %15 = add i32 %i.02.i, 1, !dbg !2722
  br i1 %14, label %16, label %10, !dbg !2723

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2724
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2724, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2725
  %20 = load %struct.stat64** %19, align 8, !dbg !2725, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2725
  %22 = load i64* %21, align 8, !dbg !2725, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !2725
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2724
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2726
  %or.cond = or i1 %23, %25, !dbg !2725
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2725

; <label>:26                                      ; preds = %16
  %27 = bitcast %struct.stat64* %buf to i8*, !dbg !2728
  %28 = bitcast %struct.stat64* %20 to i8*, !dbg !2728
  %29 = call i8* @memcpy(i8* %27, i8* %28, i64 144)
  br label %60, !dbg !2730

__get_sym_file.exit.thread:                       ; preds = %16, %10, %.preheader.i, %4, %0
  %30 = ptrtoint i8* %path to i64, !dbg !2731
  %31 = tail call i64 @klee_get_valuel(i64 %30) #8, !dbg !2731
  %32 = inttoptr i64 %31 to i8*, !dbg !2731
  %33 = icmp eq i8* %32, %path, !dbg !2734
  %34 = zext i1 %33 to i64, !dbg !2734
  tail call void @klee_assume(i64 %34) #8, !dbg !2734
  br label %35, !dbg !2735

; <label>:35                                      ; preds = %52, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %53, %52 ]
  %sc.0.i = phi i8* [ %32, %__get_sym_file.exit.thread ], [ %sc.1.i, %52 ]
  %36 = load i8* %sc.0.i, align 1, !dbg !2736, !tbaa !2142
  %37 = add i32 %i.0.i, -1, !dbg !2737
  %38 = and i32 %37, %i.0.i, !dbg !2737
  %39 = icmp eq i32 %38, 0, !dbg !2737
  br i1 %39, label %40, label %44, !dbg !2737

; <label>:40                                      ; preds = %35
  switch i8 %36, label %52 [
    i8 0, label %41
    i8 47, label %42
  ], !dbg !2738

; <label>:41                                      ; preds = %40
  store i8 0, i8* %sc.0.i, align 1, !dbg !2739, !tbaa !2142
  br label %__concretize_string.exit, !dbg !2740

; <label>:42                                      ; preds = %40
  %43 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2741
  store i8 47, i8* %sc.0.i, align 1, !dbg !2741, !tbaa !2142
  br label %52, !dbg !2742

; <label>:44                                      ; preds = %35
  %45 = sext i8 %36 to i64, !dbg !2743
  %46 = tail call i64 @klee_get_valuel(i64 %45) #8, !dbg !2743
  %47 = trunc i64 %46 to i8, !dbg !2743
  %48 = icmp eq i8 %47, %36, !dbg !2744
  %49 = zext i1 %48 to i64, !dbg !2744
  tail call void @klee_assume(i64 %49) #8, !dbg !2744
  %50 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2745
  store i8 %47, i8* %sc.0.i, align 1, !dbg !2745, !tbaa !2142
  %51 = icmp eq i8 %47, 0, !dbg !2746
  br i1 %51, label %__concretize_string.exit, label %52, !dbg !2746

; <label>:52                                      ; preds = %44, %42, %40
  %sc.1.i = phi i8* [ %50, %44 ], [ %43, %42 ], [ %sc.0.i, %40 ]
  %53 = add i32 %i.0.i, 1, !dbg !2735
  br label %35, !dbg !2735

__concretize_string.exit:                         ; preds = %44, %41
  %54 = tail call i64 (i64, ...)* @syscall(i64 6, i8* %path, %struct.stat64* %buf) #8, !dbg !2733
  %55 = trunc i64 %54 to i32, !dbg !2733
  %56 = icmp eq i32 %55, -1, !dbg !2747
  br i1 %56, label %57, label %60, !dbg !2747

; <label>:57                                      ; preds = %__concretize_string.exit
  %58 = tail call i32 @klee_get_errno() #8, !dbg !2749
  %59 = tail call i32* @__errno_location() #4, !dbg !2749
  store i32 %58, i32* %59, align 4, !dbg !2749, !tbaa !2189
  br label %60, !dbg !2749

; <label>:60                                      ; preds = %57, %__concretize_string.exit, %26
  %.0 = phi i32 [ 0, %26 ], [ -1, %57 ], [ %55, %__concretize_string.exit ]
  ret i32 %.0, !dbg !2750
}

; Function Attrs: nounwind uwtable
define i32 @chdir(i8* %path) #3 {
  %1 = load i8* %path, align 1, !dbg !2751, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !2753
  %3 = icmp eq i8 %1, 0, !dbg !2753
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2753

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2753
  %6 = load i8* %5, align 1, !dbg !2753, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !2753
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2753

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2754, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !2754
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2754

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2754
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2754

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2755
  %sext.i = shl i32 %i.02.i, 24, !dbg !2755
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2755
  %12 = ashr exact i32 %sext.i, 24, !dbg !2755
  %13 = add nsw i32 %12, 65, !dbg !2755
  %14 = icmp eq i32 %2, %13, !dbg !2755
  %15 = add i32 %i.02.i, 1, !dbg !2754
  br i1 %14, label %16, label %10, !dbg !2755

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2756
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2756, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2757
  %20 = load %struct.stat64** %19, align 8, !dbg !2757, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2757
  %22 = load i64* %21, align 8, !dbg !2757, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !2757
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2756
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2758
  %or.cond = or i1 %23, %25, !dbg !2757
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2757

; <label>:26                                      ; preds = %16
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str9, i64 0, i64 0)) #8, !dbg !2760
  %27 = tail call i32* @__errno_location() #4, !dbg !2762
  store i32 2, i32* %27, align 4, !dbg !2762, !tbaa !2189
  br label %58, !dbg !2763

__get_sym_file.exit.thread:                       ; preds = %16, %10, %.preheader.i, %4, %0
  %28 = ptrtoint i8* %path to i64, !dbg !2764
  %29 = tail call i64 @klee_get_valuel(i64 %28) #8, !dbg !2764
  %30 = inttoptr i64 %29 to i8*, !dbg !2764
  %31 = icmp eq i8* %30, %path, !dbg !2767
  %32 = zext i1 %31 to i64, !dbg !2767
  tail call void @klee_assume(i64 %32) #8, !dbg !2767
  br label %33, !dbg !2768

; <label>:33                                      ; preds = %50, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %51, %50 ]
  %sc.0.i = phi i8* [ %30, %__get_sym_file.exit.thread ], [ %sc.1.i, %50 ]
  %34 = load i8* %sc.0.i, align 1, !dbg !2769, !tbaa !2142
  %35 = add i32 %i.0.i, -1, !dbg !2770
  %36 = and i32 %35, %i.0.i, !dbg !2770
  %37 = icmp eq i32 %36, 0, !dbg !2770
  br i1 %37, label %38, label %42, !dbg !2770

; <label>:38                                      ; preds = %33
  switch i8 %34, label %50 [
    i8 0, label %39
    i8 47, label %40
  ], !dbg !2771

; <label>:39                                      ; preds = %38
  store i8 0, i8* %sc.0.i, align 1, !dbg !2772, !tbaa !2142
  br label %__concretize_string.exit, !dbg !2773

; <label>:40                                      ; preds = %38
  %41 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2774
  store i8 47, i8* %sc.0.i, align 1, !dbg !2774, !tbaa !2142
  br label %50, !dbg !2775

; <label>:42                                      ; preds = %33
  %43 = sext i8 %34 to i64, !dbg !2776
  %44 = tail call i64 @klee_get_valuel(i64 %43) #8, !dbg !2776
  %45 = trunc i64 %44 to i8, !dbg !2776
  %46 = icmp eq i8 %45, %34, !dbg !2777
  %47 = zext i1 %46 to i64, !dbg !2777
  tail call void @klee_assume(i64 %47) #8, !dbg !2777
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2778
  store i8 %45, i8* %sc.0.i, align 1, !dbg !2778, !tbaa !2142
  %49 = icmp eq i8 %45, 0, !dbg !2779
  br i1 %49, label %__concretize_string.exit, label %50, !dbg !2779

; <label>:50                                      ; preds = %42, %40, %38
  %sc.1.i = phi i8* [ %48, %42 ], [ %41, %40 ], [ %sc.0.i, %38 ]
  %51 = add i32 %i.0.i, 1, !dbg !2768
  br label %33, !dbg !2768

__concretize_string.exit:                         ; preds = %42, %39
  %52 = tail call i64 (i64, ...)* @syscall(i64 80, i8* %path) #8, !dbg !2766
  %53 = trunc i64 %52 to i32, !dbg !2766
  %54 = icmp eq i32 %53, -1, !dbg !2780
  br i1 %54, label %55, label %58, !dbg !2780

; <label>:55                                      ; preds = %__concretize_string.exit
  %56 = tail call i32 @klee_get_errno() #8, !dbg !2782
  %57 = tail call i32* @__errno_location() #4, !dbg !2782
  store i32 %56, i32* %57, align 4, !dbg !2782, !tbaa !2189
  br label %58, !dbg !2782

; <label>:58                                      ; preds = %55, %__concretize_string.exit, %26
  %.0 = phi i32 [ -1, %26 ], [ -1, %55 ], [ %53, %__concretize_string.exit ]
  ret i32 %.0, !dbg !2783
}

; Function Attrs: nounwind uwtable
define i32 @fchdir(i32 %fd) #3 {
  %1 = icmp ult i32 %fd, 32, !dbg !2784
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2784

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !2786
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !2787
  %5 = load i32* %4, align 4, !dbg !2787, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !2787
  %7 = icmp eq i32 %6, 0, !dbg !2787
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2787

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !2786
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2788
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !2788

__get_file.exit.thread:                           ; preds = %__get_file.exit, %2, %0
  %10 = tail call i32* @__errno_location() #4, !dbg !2790
  store i32 9, i32* %10, align 4, !dbg !2790, !tbaa !2189
  br label %26, !dbg !2792

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 3, !dbg !2793
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !2793, !tbaa !2219
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !2793
  br i1 %14, label %17, label %15, !dbg !2793

; <label>:15                                      ; preds = %11
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str9, i64 0, i64 0)) #8, !dbg !2794
  %16 = tail call i32* @__errno_location() #4, !dbg !2796
  store i32 2, i32* %16, align 4, !dbg !2796, !tbaa !2189
  br label %26, !dbg !2797

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !2798
  %19 = load i32* %18, align 8, !dbg !2798, !tbaa !2269
  %20 = tail call i64 (i64, ...)* @syscall(i64 81, i32 %19) #8, !dbg !2798
  %21 = trunc i64 %20 to i32, !dbg !2798
  %22 = icmp eq i32 %21, -1, !dbg !2799
  br i1 %22, label %23, label %26, !dbg !2799

; <label>:23                                      ; preds = %17
  %24 = tail call i32 @klee_get_errno() #8, !dbg !2801
  %25 = tail call i32* @__errno_location() #4, !dbg !2801
  store i32 %24, i32* %25, align 4, !dbg !2801, !tbaa !2189
  br label %26, !dbg !2801

; <label>:26                                      ; preds = %23, %17, %15, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %15 ], [ -1, %__get_file.exit.thread ], [ -1, %23 ], [ %21, %17 ]
  ret i32 %.0, !dbg !2802
}

; Function Attrs: nounwind uwtable
define i32 @chmod(i8* %path, i32 %mode) #3 {
  %1 = load i8* %path, align 1, !dbg !2803, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !2805
  %3 = icmp eq i8 %1, 0, !dbg !2805
  br i1 %3, label %__get_sym_file.exit, label %4, !dbg !2805

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2805
  %6 = load i8* %5, align 1, !dbg !2805, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !2805
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit, !dbg !2805

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2806, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !2806
  br i1 %9, label %__get_sym_file.exit, label %.lr.ph.i, !dbg !2806

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2806
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit, !dbg !2806

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2807
  %sext.i = shl i32 %i.02.i, 24, !dbg !2807
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2807
  %12 = ashr exact i32 %sext.i, 24, !dbg !2807
  %13 = add nsw i32 %12, 65, !dbg !2807
  %14 = icmp eq i32 %2, %13, !dbg !2807
  %15 = add i32 %i.02.i, 1, !dbg !2806
  br i1 %14, label %16, label %10, !dbg !2807

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2808
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2808, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2809
  %20 = load %struct.stat64** %19, align 8, !dbg !2809, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2809
  %22 = load i64* %21, align 8, !dbg !2809, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !2809
  br i1 %23, label %__get_sym_file.exit, label %24, !dbg !2809

; <label>:24                                      ; preds = %16
  %25 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2808
  br label %__get_sym_file.exit, !dbg !2810

__get_sym_file.exit:                              ; preds = %24, %16, %10, %.preheader.i, %4, %0
  %.0.i = phi %struct.exe_disk_file_t* [ %25, %24 ], [ null, %4 ], [ null, %0 ], [ null, %16 ], [ null, %.preheader.i ], [ null, %10 ]
  %26 = load i32* @chmod.n_calls, align 4, !dbg !2811, !tbaa !2189
  %27 = add nsw i32 %26, 1, !dbg !2811
  store i32 %27, i32* @chmod.n_calls, align 4, !dbg !2811, !tbaa !2189
  %28 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2812, !tbaa !2456
  %29 = icmp eq i32 %28, 0, !dbg !2812
  br i1 %29, label %37, label %30, !dbg !2812

; <label>:30                                      ; preds = %__get_sym_file.exit
  %31 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 11), align 8, !dbg !2812, !tbaa !2814
  %32 = load i32* %31, align 4, !dbg !2812, !tbaa !2189
  %33 = icmp eq i32 %32, %27, !dbg !2812
  br i1 %33, label %34, label %37, !dbg !2812

; <label>:34                                      ; preds = %30
  %35 = add i32 %28, -1, !dbg !2815
  store i32 %35, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2815, !tbaa !2456
  %36 = tail call i32* @__errno_location() #4, !dbg !2817
  store i32 5, i32* %36, align 4, !dbg !2817, !tbaa !2189
  br label %__df_chmod.exit, !dbg !2818

; <label>:37                                      ; preds = %30, %__get_sym_file.exit
  %38 = icmp eq %struct.exe_disk_file_t* %.0.i, null, !dbg !2819
  br i1 %38, label %60, label %39, !dbg !2819

; <label>:39                                      ; preds = %37
  %40 = tail call i32 @geteuid() #8, !dbg !2820
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %.0.i, i64 0, i32 2, !dbg !2820
  %42 = load %struct.stat64** %41, align 8, !dbg !2820, !tbaa !2157
  %43 = getelementptr inbounds %struct.stat64* %42, i64 0, i32 4, !dbg !2820
  %44 = load i32* %43, align 4, !dbg !2820, !tbaa !2824
  %45 = icmp eq i32 %40, %44, !dbg !2820
  br i1 %45, label %46, label %58, !dbg !2820

; <label>:46                                      ; preds = %39
  %47 = tail call i32 @getgid() #8, !dbg !2825
  %48 = load %struct.stat64** %41, align 8, !dbg !2825, !tbaa !2157
  %49 = getelementptr inbounds %struct.stat64* %48, i64 0, i32 5, !dbg !2825
  %50 = load i32* %49, align 4, !dbg !2825, !tbaa !2828
  %51 = icmp eq i32 %47, %50, !dbg !2825
  %52 = and i32 %mode, 3071, !dbg !2829
  %mode..i = select i1 %51, i32 %mode, i32 %52, !dbg !2825
  %53 = getelementptr inbounds %struct.stat64* %48, i64 0, i32 3, !dbg !2830
  %54 = load i32* %53, align 4, !dbg !2830, !tbaa !2233
  %55 = and i32 %54, -4096, !dbg !2830
  %56 = and i32 %mode..i, 4095, !dbg !2830
  %57 = or i32 %56, %55, !dbg !2830
  store i32 %57, i32* %53, align 4, !dbg !2830, !tbaa !2233
  br label %__df_chmod.exit, !dbg !2831

; <label>:58                                      ; preds = %39
  %59 = tail call i32* @__errno_location() #4, !dbg !2832
  store i32 1, i32* %59, align 4, !dbg !2832, !tbaa !2189
  br label %__df_chmod.exit, !dbg !2834

; <label>:60                                      ; preds = %37
  %61 = ptrtoint i8* %path to i64, !dbg !2835
  %62 = tail call i64 @klee_get_valuel(i64 %61) #8, !dbg !2835
  %63 = inttoptr i64 %62 to i8*, !dbg !2835
  %64 = icmp eq i8* %63, %path, !dbg !2838
  %65 = zext i1 %64 to i64, !dbg !2838
  tail call void @klee_assume(i64 %65) #8, !dbg !2838
  br label %66, !dbg !2839

; <label>:66                                      ; preds = %83, %60
  %i.0.i = phi i32 [ 0, %60 ], [ %84, %83 ]
  %sc.0.i = phi i8* [ %63, %60 ], [ %sc.1.i, %83 ]
  %67 = load i8* %sc.0.i, align 1, !dbg !2840, !tbaa !2142
  %68 = add i32 %i.0.i, -1, !dbg !2841
  %69 = and i32 %68, %i.0.i, !dbg !2841
  %70 = icmp eq i32 %69, 0, !dbg !2841
  br i1 %70, label %71, label %75, !dbg !2841

; <label>:71                                      ; preds = %66
  switch i8 %67, label %83 [
    i8 0, label %72
    i8 47, label %73
  ], !dbg !2842

; <label>:72                                      ; preds = %71
  store i8 0, i8* %sc.0.i, align 1, !dbg !2843, !tbaa !2142
  br label %__concretize_string.exit, !dbg !2844

; <label>:73                                      ; preds = %71
  %74 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2845
  store i8 47, i8* %sc.0.i, align 1, !dbg !2845, !tbaa !2142
  br label %83, !dbg !2846

; <label>:75                                      ; preds = %66
  %76 = sext i8 %67 to i64, !dbg !2847
  %77 = tail call i64 @klee_get_valuel(i64 %76) #8, !dbg !2847
  %78 = trunc i64 %77 to i8, !dbg !2847
  %79 = icmp eq i8 %78, %67, !dbg !2848
  %80 = zext i1 %79 to i64, !dbg !2848
  tail call void @klee_assume(i64 %80) #8, !dbg !2848
  %81 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2849
  store i8 %78, i8* %sc.0.i, align 1, !dbg !2849, !tbaa !2142
  %82 = icmp eq i8 %78, 0, !dbg !2850
  br i1 %82, label %__concretize_string.exit, label %83, !dbg !2850

; <label>:83                                      ; preds = %75, %73, %71
  %sc.1.i = phi i8* [ %81, %75 ], [ %74, %73 ], [ %sc.0.i, %71 ]
  %84 = add i32 %i.0.i, 1, !dbg !2839
  br label %66, !dbg !2839

__concretize_string.exit:                         ; preds = %75, %72
  %85 = tail call i64 (i64, ...)* @syscall(i64 90, i8* %path, i32 %mode) #8, !dbg !2837
  %86 = trunc i64 %85 to i32, !dbg !2837
  %87 = icmp eq i32 %86, -1, !dbg !2851
  br i1 %87, label %88, label %__df_chmod.exit, !dbg !2851

; <label>:88                                      ; preds = %__concretize_string.exit
  %89 = tail call i32 @klee_get_errno() #8, !dbg !2853
  %90 = tail call i32* @__errno_location() #4, !dbg !2853
  store i32 %89, i32* %90, align 4, !dbg !2853, !tbaa !2189
  br label %__df_chmod.exit, !dbg !2853

__df_chmod.exit:                                  ; preds = %88, %__concretize_string.exit, %58, %46, %34
  %.0 = phi i32 [ -1, %34 ], [ -1, %88 ], [ %86, %__concretize_string.exit ], [ 0, %46 ], [ -1, %58 ]
  ret i32 %.0, !dbg !2854
}

; Function Attrs: nounwind uwtable
define i32 @fchmod(i32 %fd, i32 %mode) #3 {
  %1 = icmp ult i32 %fd, 32, !dbg !2855
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2855

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !2857
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !2858
  %5 = load i32* %4, align 4, !dbg !2858, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !2858
  %7 = icmp eq i32 %6, 0, !dbg !2858
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2858

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !2857
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2859
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !2859

__get_file.exit.thread:                           ; preds = %__get_file.exit, %2, %0
  %10 = tail call i32* @__errno_location() #4, !dbg !2861
  store i32 9, i32* %10, align 4, !dbg !2861, !tbaa !2189
  br label %__df_chmod.exit, !dbg !2863

; <label>:11                                      ; preds = %__get_file.exit
  %12 = load i32* @fchmod.n_calls, align 4, !dbg !2864, !tbaa !2189
  %13 = add nsw i32 %12, 1, !dbg !2864
  store i32 %13, i32* @fchmod.n_calls, align 4, !dbg !2864, !tbaa !2189
  %14 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2865, !tbaa !2456
  %15 = icmp eq i32 %14, 0, !dbg !2865
  br i1 %15, label %23, label %16, !dbg !2865

; <label>:16                                      ; preds = %11
  %17 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 12), align 8, !dbg !2865, !tbaa !2867
  %18 = load i32* %17, align 4, !dbg !2865, !tbaa !2189
  %19 = icmp eq i32 %18, %13, !dbg !2865
  br i1 %19, label %20, label %23, !dbg !2865

; <label>:20                                      ; preds = %16
  %21 = add i32 %14, -1, !dbg !2868
  store i32 %21, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2868, !tbaa !2456
  %22 = tail call i32* @__errno_location() #4, !dbg !2870
  store i32 5, i32* %22, align 4, !dbg !2870, !tbaa !2189
  br label %__df_chmod.exit, !dbg !2871

; <label>:23                                      ; preds = %16, %11
  %24 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 3, !dbg !2872
  %25 = load %struct.exe_disk_file_t** %24, align 8, !dbg !2872, !tbaa !2219
  %26 = icmp eq %struct.exe_disk_file_t* %25, null, !dbg !2872
  br i1 %26, label %48, label %27, !dbg !2872

; <label>:27                                      ; preds = %23
  %28 = tail call i32 @geteuid() #8, !dbg !2873
  %29 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 0, i32 2, !dbg !2873
  %30 = load %struct.stat64** %29, align 8, !dbg !2873, !tbaa !2157
  %31 = getelementptr inbounds %struct.stat64* %30, i64 0, i32 4, !dbg !2873
  %32 = load i32* %31, align 4, !dbg !2873, !tbaa !2824
  %33 = icmp eq i32 %28, %32, !dbg !2873
  br i1 %33, label %34, label %46, !dbg !2873

; <label>:34                                      ; preds = %27
  %35 = tail call i32 @getgid() #8, !dbg !2876
  %36 = load %struct.stat64** %29, align 8, !dbg !2876, !tbaa !2157
  %37 = getelementptr inbounds %struct.stat64* %36, i64 0, i32 5, !dbg !2876
  %38 = load i32* %37, align 4, !dbg !2876, !tbaa !2828
  %39 = icmp eq i32 %35, %38, !dbg !2876
  %40 = and i32 %mode, 3071, !dbg !2877
  %mode..i = select i1 %39, i32 %mode, i32 %40, !dbg !2876
  %41 = getelementptr inbounds %struct.stat64* %36, i64 0, i32 3, !dbg !2878
  %42 = load i32* %41, align 4, !dbg !2878, !tbaa !2233
  %43 = and i32 %42, -4096, !dbg !2878
  %44 = and i32 %mode..i, 4095, !dbg !2878
  %45 = or i32 %44, %43, !dbg !2878
  store i32 %45, i32* %41, align 4, !dbg !2878, !tbaa !2233
  br label %__df_chmod.exit, !dbg !2879

; <label>:46                                      ; preds = %27
  %47 = tail call i32* @__errno_location() #4, !dbg !2880
  store i32 1, i32* %47, align 4, !dbg !2880, !tbaa !2189
  br label %__df_chmod.exit, !dbg !2881

; <label>:48                                      ; preds = %23
  %49 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !2882
  %50 = load i32* %49, align 8, !dbg !2882, !tbaa !2269
  %51 = tail call i64 (i64, ...)* @syscall(i64 91, i32 %50, i32 %mode) #8, !dbg !2882
  %52 = trunc i64 %51 to i32, !dbg !2882
  %53 = icmp eq i32 %52, -1, !dbg !2883
  br i1 %53, label %54, label %__df_chmod.exit, !dbg !2883

; <label>:54                                      ; preds = %48
  %55 = tail call i32 @klee_get_errno() #8, !dbg !2885
  %56 = tail call i32* @__errno_location() #4, !dbg !2885
  store i32 %55, i32* %56, align 4, !dbg !2885, !tbaa !2189
  br label %__df_chmod.exit, !dbg !2885

__df_chmod.exit:                                  ; preds = %54, %48, %46, %34, %20, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %20 ], [ -1, %__get_file.exit.thread ], [ -1, %54 ], [ %52, %48 ], [ 0, %34 ], [ -1, %46 ]
  ret i32 %.0, !dbg !2886
}

; Function Attrs: nounwind uwtable
define i32 @chown(i8* %path, i32 %owner, i32 %group) #3 {
  %1 = load i8* %path, align 1, !dbg !2887, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !2889
  %3 = icmp eq i8 %1, 0, !dbg !2889
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2889

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2889
  %6 = load i8* %5, align 1, !dbg !2889, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !2889
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2889

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2890, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !2890
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2890

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2890
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2890

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2891
  %sext.i = shl i32 %i.02.i, 24, !dbg !2891
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2891
  %12 = ashr exact i32 %sext.i, 24, !dbg !2891
  %13 = add nsw i32 %12, 65, !dbg !2891
  %14 = icmp eq i32 %2, %13, !dbg !2891
  %15 = add i32 %i.02.i, 1, !dbg !2890
  br i1 %14, label %16, label %10, !dbg !2891

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2892
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2892, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2893
  %20 = load %struct.stat64** %19, align 8, !dbg !2893, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2893
  %22 = load i64* %21, align 8, !dbg !2893, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !2893
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2892
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2894
  %or.cond = or i1 %23, %25, !dbg !2893
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2893

; <label>:26                                      ; preds = %16
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str24, i64 0, i64 0)) #8, !dbg !2895
  %27 = tail call i32* @__errno_location() #4, !dbg !2898
  store i32 1, i32* %27, align 4, !dbg !2898, !tbaa !2189
  br label %58, !dbg !2896

__get_sym_file.exit.thread:                       ; preds = %16, %10, %.preheader.i, %4, %0
  %28 = ptrtoint i8* %path to i64, !dbg !2899
  %29 = tail call i64 @klee_get_valuel(i64 %28) #8, !dbg !2899
  %30 = inttoptr i64 %29 to i8*, !dbg !2899
  %31 = icmp eq i8* %30, %path, !dbg !2902
  %32 = zext i1 %31 to i64, !dbg !2902
  tail call void @klee_assume(i64 %32) #8, !dbg !2902
  br label %33, !dbg !2903

; <label>:33                                      ; preds = %50, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %51, %50 ]
  %sc.0.i = phi i8* [ %30, %__get_sym_file.exit.thread ], [ %sc.1.i, %50 ]
  %34 = load i8* %sc.0.i, align 1, !dbg !2904, !tbaa !2142
  %35 = add i32 %i.0.i, -1, !dbg !2905
  %36 = and i32 %35, %i.0.i, !dbg !2905
  %37 = icmp eq i32 %36, 0, !dbg !2905
  br i1 %37, label %38, label %42, !dbg !2905

; <label>:38                                      ; preds = %33
  switch i8 %34, label %50 [
    i8 0, label %39
    i8 47, label %40
  ], !dbg !2906

; <label>:39                                      ; preds = %38
  store i8 0, i8* %sc.0.i, align 1, !dbg !2907, !tbaa !2142
  br label %__concretize_string.exit, !dbg !2908

; <label>:40                                      ; preds = %38
  %41 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2909
  store i8 47, i8* %sc.0.i, align 1, !dbg !2909, !tbaa !2142
  br label %50, !dbg !2910

; <label>:42                                      ; preds = %33
  %43 = sext i8 %34 to i64, !dbg !2911
  %44 = tail call i64 @klee_get_valuel(i64 %43) #8, !dbg !2911
  %45 = trunc i64 %44 to i8, !dbg !2911
  %46 = icmp eq i8 %45, %34, !dbg !2912
  %47 = zext i1 %46 to i64, !dbg !2912
  tail call void @klee_assume(i64 %47) #8, !dbg !2912
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2913
  store i8 %45, i8* %sc.0.i, align 1, !dbg !2913, !tbaa !2142
  %49 = icmp eq i8 %45, 0, !dbg !2914
  br i1 %49, label %__concretize_string.exit, label %50, !dbg !2914

; <label>:50                                      ; preds = %42, %40, %38
  %sc.1.i = phi i8* [ %48, %42 ], [ %41, %40 ], [ %sc.0.i, %38 ]
  %51 = add i32 %i.0.i, 1, !dbg !2903
  br label %33, !dbg !2903

__concretize_string.exit:                         ; preds = %42, %39
  %52 = tail call i64 (i64, ...)* @syscall(i64 92, i8* %path, i32 %owner, i32 %group) #8, !dbg !2901
  %53 = trunc i64 %52 to i32, !dbg !2901
  %54 = icmp eq i32 %53, -1, !dbg !2915
  br i1 %54, label %55, label %58, !dbg !2915

; <label>:55                                      ; preds = %__concretize_string.exit
  %56 = tail call i32 @klee_get_errno() #8, !dbg !2917
  %57 = tail call i32* @__errno_location() #4, !dbg !2917
  store i32 %56, i32* %57, align 4, !dbg !2917, !tbaa !2189
  br label %58, !dbg !2917

; <label>:58                                      ; preds = %55, %__concretize_string.exit, %26
  %.0 = phi i32 [ -1, %26 ], [ -1, %55 ], [ %53, %__concretize_string.exit ]
  ret i32 %.0, !dbg !2918
}

; Function Attrs: nounwind uwtable
define i32 @fchown(i32 %fd, i32 %owner, i32 %group) #3 {
  %1 = icmp ult i32 %fd, 32, !dbg !2919
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2919

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !2921
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !2922
  %5 = load i32* %4, align 4, !dbg !2922, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !2922
  %7 = icmp eq i32 %6, 0, !dbg !2922
  %8 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !2921
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2923
  %or.cond = or i1 %7, %9, !dbg !2922
  br i1 %or.cond, label %__get_file.exit.thread, label %11, !dbg !2922

__get_file.exit.thread:                           ; preds = %2, %0
  %10 = tail call i32* @__errno_location() #4, !dbg !2925
  store i32 9, i32* %10, align 4, !dbg !2925, !tbaa !2189
  br label %24, !dbg !2927

; <label>:11                                      ; preds = %2
  %12 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 3, !dbg !2928
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !2928, !tbaa !2219
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !2928
  br i1 %14, label %17, label %15, !dbg !2928

; <label>:15                                      ; preds = %11
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str24, i64 0, i64 0)) #8, !dbg !2929
  %16 = tail call i32* @__errno_location() #4, !dbg !2932
  store i32 1, i32* %16, align 4, !dbg !2932, !tbaa !2189
  br label %24, !dbg !2930

; <label>:17                                      ; preds = %11
  %18 = tail call i64 (i64, ...)* @syscall(i64 93, i32 %fd, i32 %owner, i32 %group) #8, !dbg !2933
  %19 = trunc i64 %18 to i32, !dbg !2933
  %20 = icmp eq i32 %19, -1, !dbg !2934
  br i1 %20, label %21, label %24, !dbg !2934

; <label>:21                                      ; preds = %17
  %22 = tail call i32 @klee_get_errno() #8, !dbg !2936
  %23 = tail call i32* @__errno_location() #4, !dbg !2936
  store i32 %22, i32* %23, align 4, !dbg !2936, !tbaa !2189
  br label %24, !dbg !2936

; <label>:24                                      ; preds = %21, %17, %15, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %15 ], [ -1, %__get_file.exit.thread ], [ -1, %21 ], [ %19, %17 ]
  ret i32 %.0, !dbg !2937
}

; Function Attrs: nounwind uwtable
define i32 @lchown(i8* %path, i32 %owner, i32 %group) #3 {
  %1 = load i8* %path, align 1, !dbg !2938, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !2940
  %3 = icmp eq i8 %1, 0, !dbg !2940
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2940

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2940
  %6 = load i8* %5, align 1, !dbg !2940, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !2940
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2940

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2941, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !2941
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2941

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2941
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2941

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2942
  %sext.i = shl i32 %i.02.i, 24, !dbg !2942
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2942
  %12 = ashr exact i32 %sext.i, 24, !dbg !2942
  %13 = add nsw i32 %12, 65, !dbg !2942
  %14 = icmp eq i32 %2, %13, !dbg !2942
  %15 = add i32 %i.02.i, 1, !dbg !2941
  br i1 %14, label %16, label %10, !dbg !2942

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2943
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2943, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2944
  %20 = load %struct.stat64** %19, align 8, !dbg !2944, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2944
  %22 = load i64* %21, align 8, !dbg !2944, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !2944
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2943
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2945
  %or.cond = or i1 %23, %25, !dbg !2944
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2944

; <label>:26                                      ; preds = %16
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str24, i64 0, i64 0)) #8, !dbg !2946
  %27 = tail call i32* @__errno_location() #4, !dbg !2949
  store i32 1, i32* %27, align 4, !dbg !2949, !tbaa !2189
  br label %58, !dbg !2947

__get_sym_file.exit.thread:                       ; preds = %16, %10, %.preheader.i, %4, %0
  %28 = ptrtoint i8* %path to i64, !dbg !2950
  %29 = tail call i64 @klee_get_valuel(i64 %28) #8, !dbg !2950
  %30 = inttoptr i64 %29 to i8*, !dbg !2950
  %31 = icmp eq i8* %30, %path, !dbg !2953
  %32 = zext i1 %31 to i64, !dbg !2953
  tail call void @klee_assume(i64 %32) #8, !dbg !2953
  br label %33, !dbg !2954

; <label>:33                                      ; preds = %50, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %51, %50 ]
  %sc.0.i = phi i8* [ %30, %__get_sym_file.exit.thread ], [ %sc.1.i, %50 ]
  %34 = load i8* %sc.0.i, align 1, !dbg !2955, !tbaa !2142
  %35 = add i32 %i.0.i, -1, !dbg !2956
  %36 = and i32 %35, %i.0.i, !dbg !2956
  %37 = icmp eq i32 %36, 0, !dbg !2956
  br i1 %37, label %38, label %42, !dbg !2956

; <label>:38                                      ; preds = %33
  switch i8 %34, label %50 [
    i8 0, label %39
    i8 47, label %40
  ], !dbg !2957

; <label>:39                                      ; preds = %38
  store i8 0, i8* %sc.0.i, align 1, !dbg !2958, !tbaa !2142
  br label %__concretize_string.exit, !dbg !2959

; <label>:40                                      ; preds = %38
  %41 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2960
  store i8 47, i8* %sc.0.i, align 1, !dbg !2960, !tbaa !2142
  br label %50, !dbg !2961

; <label>:42                                      ; preds = %33
  %43 = sext i8 %34 to i64, !dbg !2962
  %44 = tail call i64 @klee_get_valuel(i64 %43) #8, !dbg !2962
  %45 = trunc i64 %44 to i8, !dbg !2962
  %46 = icmp eq i8 %45, %34, !dbg !2963
  %47 = zext i1 %46 to i64, !dbg !2963
  tail call void @klee_assume(i64 %47) #8, !dbg !2963
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2964
  store i8 %45, i8* %sc.0.i, align 1, !dbg !2964, !tbaa !2142
  %49 = icmp eq i8 %45, 0, !dbg !2965
  br i1 %49, label %__concretize_string.exit, label %50, !dbg !2965

; <label>:50                                      ; preds = %42, %40, %38
  %sc.1.i = phi i8* [ %48, %42 ], [ %41, %40 ], [ %sc.0.i, %38 ]
  %51 = add i32 %i.0.i, 1, !dbg !2954
  br label %33, !dbg !2954

__concretize_string.exit:                         ; preds = %42, %39
  %52 = tail call i64 (i64, ...)* @syscall(i64 92, i8* %path, i32 %owner, i32 %group) #8, !dbg !2952
  %53 = trunc i64 %52 to i32, !dbg !2952
  %54 = icmp eq i32 %53, -1, !dbg !2966
  br i1 %54, label %55, label %58, !dbg !2966

; <label>:55                                      ; preds = %__concretize_string.exit
  %56 = tail call i32 @klee_get_errno() #8, !dbg !2968
  %57 = tail call i32* @__errno_location() #4, !dbg !2968
  store i32 %56, i32* %57, align 4, !dbg !2968, !tbaa !2189
  br label %58, !dbg !2968

; <label>:58                                      ; preds = %55, %__concretize_string.exit, %26
  %.0 = phi i32 [ -1, %26 ], [ -1, %55 ], [ %53, %__concretize_string.exit ]
  ret i32 %.0, !dbg !2969
}

; Function Attrs: nounwind uwtable
define i32 @__fd_fstat(i32 %fd, %struct.stat64* %buf) #3 {
  %1 = icmp ult i32 %fd, 32, !dbg !2970
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2970

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !2972
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !2973
  %5 = load i32* %4, align 4, !dbg !2973, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !2973
  %7 = icmp eq i32 %6, 0, !dbg !2973
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2973

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !2972
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2974
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !2974

__get_file.exit.thread:                           ; preds = %__get_file.exit, %2, %0
  %10 = tail call i32* @__errno_location() #4, !dbg !2976
  store i32 9, i32* %10, align 4, !dbg !2976, !tbaa !2189
  br label %30, !dbg !2978

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 3, !dbg !2979
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !2979, !tbaa !2219
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !2979
  br i1 %14, label %15, label %24, !dbg !2979

; <label>:15                                      ; preds = %11
  %16 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !2980
  %17 = load i32* %16, align 8, !dbg !2980, !tbaa !2269
  %18 = tail call i64 (i64, ...)* @syscall(i64 5, i32 %17, %struct.stat64* %buf) #8, !dbg !2980
  %19 = trunc i64 %18 to i32, !dbg !2980
  %20 = icmp eq i32 %19, -1, !dbg !2981
  br i1 %20, label %21, label %30, !dbg !2981

; <label>:21                                      ; preds = %15
  %22 = tail call i32 @klee_get_errno() #8, !dbg !2983
  %23 = tail call i32* @__errno_location() #4, !dbg !2983
  store i32 %22, i32* %23, align 4, !dbg !2983, !tbaa !2189
  br label %30, !dbg !2983

; <label>:24                                      ; preds = %11
  %25 = bitcast %struct.stat64* %buf to i8*, !dbg !2984
  %26 = getelementptr inbounds %struct.exe_disk_file_t* %13, i64 0, i32 2, !dbg !2984
  %27 = load %struct.stat64** %26, align 8, !dbg !2984, !tbaa !2157
  %28 = bitcast %struct.stat64* %27 to i8*, !dbg !2984
  %29 = call i8* @memcpy(i8* %25, i8* %28, i64 144)
  br label %30, !dbg !2985

; <label>:30                                      ; preds = %24, %21, %15, %__get_file.exit.thread
  %.0 = phi i32 [ 0, %24 ], [ -1, %__get_file.exit.thread ], [ -1, %21 ], [ %19, %15 ]
  ret i32 %.0, !dbg !2986
}

; Function Attrs: nounwind uwtable
define i32 @__fd_ftruncate(i32 %fd, i64 %length) #3 {
  %1 = icmp ult i32 %fd, 32, !dbg !2987
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2987

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !2989
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !2990
  %5 = load i32* %4, align 4, !dbg !2990, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !2990
  %7 = icmp eq i32 %6, 0, !dbg !2990
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2990

__get_file.exit.thread:                           ; preds = %2, %0
  %8 = load i32* @__fd_ftruncate.n_calls, align 4, !dbg !2991, !tbaa !2189
  %9 = add nsw i32 %8, 1, !dbg !2991
  store i32 %9, i32* @__fd_ftruncate.n_calls, align 4, !dbg !2991, !tbaa !2189
  br label %14, !dbg !2992

__get_file.exit:                                  ; preds = %2
  %10 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !2989
  %11 = load i32* @__fd_ftruncate.n_calls, align 4, !dbg !2991, !tbaa !2189
  %12 = add nsw i32 %11, 1, !dbg !2991
  store i32 %12, i32* @__fd_ftruncate.n_calls, align 4, !dbg !2991, !tbaa !2189
  %13 = icmp eq %struct.exe_file_t* %10, null, !dbg !2992
  br i1 %13, label %14, label %16, !dbg !2992

; <label>:14                                      ; preds = %__get_file.exit, %__get_file.exit.thread
  %15 = tail call i32* @__errno_location() #4, !dbg !2994
  store i32 9, i32* %15, align 4, !dbg !2994, !tbaa !2189
  br label %41, !dbg !2996

; <label>:16                                      ; preds = %__get_file.exit
  %17 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2997, !tbaa !2456
  %18 = icmp eq i32 %17, 0, !dbg !2997
  br i1 %18, label %26, label %19, !dbg !2997

; <label>:19                                      ; preds = %16
  %20 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !2997, !tbaa !2999
  %21 = load i32* %20, align 4, !dbg !2997, !tbaa !2189
  %22 = icmp eq i32 %21, %12, !dbg !2997
  br i1 %22, label %23, label %26, !dbg !2997

; <label>:23                                      ; preds = %19
  %24 = add i32 %17, -1, !dbg !3000
  store i32 %24, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !3000, !tbaa !2456
  %25 = tail call i32* @__errno_location() #4, !dbg !3002
  store i32 5, i32* %25, align 4, !dbg !3002, !tbaa !2189
  br label %41, !dbg !3003

; <label>:26                                      ; preds = %19, %16
  %27 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 3, !dbg !3004
  %28 = load %struct.exe_disk_file_t** %27, align 8, !dbg !3004, !tbaa !2219
  %29 = icmp eq %struct.exe_disk_file_t* %28, null, !dbg !3004
  br i1 %29, label %32, label %30, !dbg !3004

; <label>:30                                      ; preds = %26
  tail call void @klee_warning(i8* getelementptr inbounds ([30 x i8]* @.str10, i64 0, i64 0)) #8, !dbg !3005
  %31 = tail call i32* @__errno_location() #4, !dbg !3007
  store i32 5, i32* %31, align 4, !dbg !3007, !tbaa !2189
  br label %41, !dbg !3008

; <label>:32                                      ; preds = %26
  %33 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !3009
  %34 = load i32* %33, align 8, !dbg !3009, !tbaa !2269
  %35 = tail call i64 (i64, ...)* @syscall(i64 77, i32 %34, i64 %length) #8, !dbg !3009
  %36 = trunc i64 %35 to i32, !dbg !3009
  %37 = icmp eq i32 %36, -1, !dbg !3010
  br i1 %37, label %38, label %41, !dbg !3010

; <label>:38                                      ; preds = %32
  %39 = tail call i32 @klee_get_errno() #8, !dbg !3012
  %40 = tail call i32* @__errno_location() #4, !dbg !3012
  store i32 %39, i32* %40, align 4, !dbg !3012, !tbaa !2189
  br label %41, !dbg !3012

; <label>:41                                      ; preds = %38, %32, %30, %23, %14
  %.0 = phi i32 [ -1, %23 ], [ -1, %30 ], [ -1, %14 ], [ -1, %38 ], [ %36, %32 ]
  ret i32 %.0, !dbg !3013
}

; Function Attrs: nounwind uwtable
define i32 @__fd_getdents(i32 %fd, %struct.dirent64* %dirp, i32 %count) #3 {
  %1 = icmp ult i32 %fd, 32, !dbg !3014
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !3014

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !3016
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !3017
  %5 = load i32* %4, align 4, !dbg !3017, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !3017
  %7 = icmp eq i32 %6, 0, !dbg !3017
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !3017

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !3016
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !3018
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !3018

__get_file.exit.thread:                           ; preds = %__get_file.exit, %2, %0
  %10 = tail call i32* @__errno_location() #4, !dbg !3020
  store i32 9, i32* %10, align 4, !dbg !3020, !tbaa !2189
  br label %.loopexit, !dbg !3022

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 3, !dbg !3023
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !3023, !tbaa !2219
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !3023
  br i1 %14, label %17, label %15, !dbg !3023

; <label>:15                                      ; preds = %11
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str116, i64 0, i64 0)) #8, !dbg !3024
  %16 = tail call i32* @__errno_location() #4, !dbg !3026
  store i32 22, i32* %16, align 4, !dbg !3026, !tbaa !2189
  br label %.loopexit, !dbg !3027

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 2, !dbg !3028
  %19 = load i64* %18, align 8, !dbg !3028, !tbaa !2501
  %20 = icmp ult i64 %19, 4096, !dbg !3028
  br i1 %20, label %21, label %69, !dbg !3028

; <label>:21                                      ; preds = %17
  %int_cast_to_i64 = bitcast i64 280 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !3029
  %22 = udiv i64 %19, 280, !dbg !3029
  %23 = mul i64 %22, 280, !dbg !3030
  %24 = icmp eq i64 %23, %19, !dbg !3030
  br i1 %24, label %25, label %30, !dbg !3030

; <label>:25                                      ; preds = %21
  %26 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !3030, !tbaa !2148
  %27 = zext i32 %26 to i64, !dbg !3030
  %28 = icmp ugt i64 %22, %27, !dbg !3030
  br i1 %28, label %30, label %.preheader, !dbg !3030

.preheader:                                       ; preds = %25
  %29 = icmp ult i64 %22, %27, !dbg !3032
  br i1 %29, label %.lr.ph, label %._crit_edge, !dbg !3032

; <label>:30                                      ; preds = %25, %21
  %31 = tail call i32* @__errno_location() #4, !dbg !3033
  store i32 22, i32* %31, align 4, !dbg !3033, !tbaa !2189
  br label %.loopexit, !dbg !3035

.lr.ph:                                           ; preds = %.lr.ph, %.preheader
  %.015 = phi %struct.dirent64* [ %52, %.lr.ph ], [ %dirp, %.preheader ]
  %i.04 = phi i64 [ %48, %.lr.ph ], [ %22, %.preheader ]
  %bytes.03 = phi i64 [ %51, %.lr.ph ], [ 0, %.preheader ]
  %32 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !3036, !tbaa !2154
  %33 = getelementptr inbounds %struct.exe_disk_file_t* %32, i64 %i.04, i32 2, !dbg !3037
  %34 = load %struct.stat64** %33, align 8, !dbg !3037, !tbaa !2157
  %35 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 1, !dbg !3037
  %36 = load i64* %35, align 8, !dbg !3037, !tbaa !2159
  %37 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 0, !dbg !3037
  store i64 %36, i64* %37, align 8, !dbg !3037, !tbaa !3038
  %38 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 2, !dbg !3041
  store i16 280, i16* %38, align 2, !dbg !3041, !tbaa !3042
  %39 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !3043
  %40 = load i32* %39, align 4, !dbg !3043, !tbaa !2233
  %int_cast_to_i641 = zext i32 12 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3043
  %41 = lshr i32 %40, 12, !dbg !3043
  %.tr = trunc i32 %41 to i8, !dbg !3043
  %42 = and i8 %.tr, 15, !dbg !3043
  %43 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 3, !dbg !3043
  store i8 %42, i8* %43, align 1, !dbg !3043, !tbaa !3044
  %44 = add nsw i64 %i.04, 65, !dbg !3045
  %45 = trunc i64 %44 to i8, !dbg !3045
  %46 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 4, i64 0, !dbg !3045
  store i8 %45, i8* %46, align 1, !dbg !3045, !tbaa !2142
  %47 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 4, i64 1, !dbg !3046
  store i8 0, i8* %47, align 1, !dbg !3046, !tbaa !2142
  %48 = add nsw i64 %i.04, 1, !dbg !3047
  %49 = mul i64 %48, 280, !dbg !3047
  %50 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 1, !dbg !3047
  store i64 %49, i64* %50, align 8, !dbg !3047, !tbaa !3048
  %51 = add nsw i64 %bytes.03, 280, !dbg !3049
  %52 = getelementptr inbounds %struct.dirent64* %.015, i64 1, !dbg !3050
  %53 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !3032, !tbaa !2148
  %54 = zext i32 %53 to i64, !dbg !3032
  %55 = icmp slt i64 %48, %54, !dbg !3032
  br i1 %55, label %.lr.ph, label %._crit_edge, !dbg !3032

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %.01.lcssa = phi %struct.dirent64* [ %dirp, %.preheader ], [ %52, %.lr.ph ]
  %bytes.0.lcssa = phi i64 [ 0, %.preheader ], [ %51, %.lr.ph ]
  %56 = icmp ult i32 %count, 4096, !dbg !3051
  %57 = zext i32 %count to i64, !dbg !3051
  %58 = select i1 %56, i64 %57, i64 4096, !dbg !3051
  %59 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 0, !dbg !3052
  store i64 0, i64* %59, align 8, !dbg !3052, !tbaa !3038
  %60 = sub nsw i64 %58, %bytes.0.lcssa, !dbg !3053
  %61 = trunc i64 %60 to i16, !dbg !3053
  %62 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 2, !dbg !3053
  store i16 %61, i16* %62, align 2, !dbg !3053, !tbaa !3042
  %63 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 3, !dbg !3054
  store i8 0, i8* %63, align 1, !dbg !3054, !tbaa !3044
  %64 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 4, i64 0, !dbg !3055
  store i8 0, i8* %64, align 1, !dbg !3055, !tbaa !2142
  %65 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 1, !dbg !3056
  store i64 4096, i64* %65, align 8, !dbg !3056, !tbaa !3048
  %66 = and i64 %60, 65535, !dbg !3057
  %67 = add nsw i64 %66, %bytes.0.lcssa, !dbg !3057
  store i64 %58, i64* %18, align 8, !dbg !3058, !tbaa !2501
  %68 = trunc i64 %67 to i32, !dbg !3059
  br label %.loopexit, !dbg !3059

; <label>:69                                      ; preds = %17
  %70 = add nsw i64 %19, -4096, !dbg !3060
  %71 = bitcast %struct.dirent64* %dirp to i8*, !dbg !3061
  %72 = zext i32 %count to i64, !dbg !3061
  %73 = call i8* @memset(i8* %71, i32 0, i64 %72)
  %74 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !3062
  %75 = load i32* %74, align 8, !dbg !3062, !tbaa !2269
  %76 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %75, i64 %70, i32 0) #8, !dbg !3062
  %77 = icmp eq i64 %76, -1, !dbg !3063
  br i1 %77, label %78, label %79, !dbg !3063

; <label>:78                                      ; preds = %69
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str12, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str44, i64 0, i64 0), i32 875, i8* getelementptr inbounds ([65 x i8]* @__PRETTY_FUNCTION__.__fd_getdents, i64 0, i64 0)
  unreachable, !dbg !3063

; <label>:79                                      ; preds = %69
  %80 = load i32* %74, align 8, !dbg !3064, !tbaa !2269
  %81 = tail call i64 (i64, ...)* @syscall(i64 217, i32 %80, %struct.dirent64* %dirp, i32 %count) #8, !dbg !3064
  %82 = trunc i64 %81 to i32, !dbg !3064
  %83 = icmp eq i32 %82, -1, !dbg !3065
  br i1 %83, label %84, label %87, !dbg !3065

; <label>:84                                      ; preds = %79
  %85 = tail call i32 @klee_get_errno() #8, !dbg !3066
  %86 = tail call i32* @__errno_location() #4, !dbg !3066
  store i32 %85, i32* %86, align 4, !dbg !3066, !tbaa !2189
  br label %.loopexit, !dbg !3068

; <label>:87                                      ; preds = %79
  %88 = load i32* %74, align 8, !dbg !3069, !tbaa !2269
  %89 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %88, i32 0, i32 1) #8, !dbg !3069
  %90 = add nsw i64 %89, 4096, !dbg !3069
  store i64 %90, i64* %18, align 8, !dbg !3069, !tbaa !2501
  %91 = icmp sgt i32 %82, 0, !dbg !3070
  br i1 %91, label %.lr.ph9, label %.loopexit, !dbg !3070

.lr.ph9:                                          ; preds = %.lr.ph9, %87
  %pos.07 = phi i32 [ %101, %.lr.ph9 ], [ 0, %87 ]
  %92 = sext i32 %pos.07 to i64, !dbg !3071
  %.sum = add i64 %92, 8, !dbg !3072
  %93 = getelementptr inbounds i8* %71, i64 %.sum, !dbg !3072
  %94 = bitcast i8* %93 to i64*, !dbg !3072
  %95 = load i64* %94, align 8, !dbg !3072, !tbaa !3048
  %96 = add nsw i64 %95, 4096, !dbg !3072
  store i64 %96, i64* %94, align 8, !dbg !3072, !tbaa !3048
  %.sum2 = add i64 %92, 16, !dbg !3073
  %97 = getelementptr inbounds i8* %71, i64 %.sum2, !dbg !3073
  %98 = bitcast i8* %97 to i16*, !dbg !3073
  %99 = load i16* %98, align 2, !dbg !3073, !tbaa !3042
  %100 = zext i16 %99 to i32, !dbg !3073
  %101 = add nsw i32 %100, %pos.07, !dbg !3073
  %102 = icmp slt i32 %101, %82, !dbg !3070
  br i1 %102, label %.lr.ph9, label %.loopexit, !dbg !3070

.loopexit:                                        ; preds = %.lr.ph9, %87, %84, %._crit_edge, %30, %15, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %15 ], [ -1, %30 ], [ %68, %._crit_edge ], [ -1, %__get_file.exit.thread ], [ -1, %84 ], [ %82, %87 ], [ %82, %.lr.ph9 ]
  ret i32 %.0, !dbg !3074
}

; Function Attrs: nounwind uwtable
define i32 @ioctl(i32 %fd, i64 %request, ...) #3 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %1 = icmp ult i32 %fd, 32, !dbg !3075
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !3075

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !3077
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !3078
  %5 = load i32* %4, align 4, !dbg !3078, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !3078
  %7 = icmp eq i32 %6, 0, !dbg !3078
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !3078

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !3077
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !3079
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !3079

__get_file.exit.thread:                           ; preds = %__get_file.exit, %2, %0
  %10 = call i32* @__errno_location() #4, !dbg !3081
  store i32 9, i32* %10, align 4, !dbg !3081, !tbaa !2189
  br label %139, !dbg !3083

; <label>:11                                      ; preds = %__get_file.exit
  %12 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !3084
  call void @llvm.va_start(i8* %12), !dbg !3084
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !3085
  %14 = load i32* %13, align 16, !dbg !3085
  %15 = icmp ult i32 %14, 41, !dbg !3085
  br i1 %15, label %16, label %22, !dbg !3085

; <label>:16                                      ; preds = %11
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !3085
  %18 = load i8** %17, align 16, !dbg !3085
  %19 = sext i32 %14 to i64, !dbg !3085
  %20 = getelementptr i8* %18, i64 %19, !dbg !3085
  %21 = add i32 %14, 8, !dbg !3085
  store i32 %21, i32* %13, align 16, !dbg !3085
  br label %26, !dbg !3085

; <label>:22                                      ; preds = %11
  %23 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !3085
  %24 = load i8** %23, align 8, !dbg !3085
  %25 = getelementptr i8* %24, i64 8, !dbg !3085
  store i8* %25, i8** %23, align 8, !dbg !3085
  br label %26, !dbg !3085

; <label>:26                                      ; preds = %22, %16
  %.in = phi i8* [ %20, %16 ], [ %24, %22 ]
  %27 = bitcast i8* %.in to i8**, !dbg !3085
  %28 = load i8** %27, align 8, !dbg !3085
  call void @llvm.va_end(i8* %12), !dbg !3086
  %29 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 3, !dbg !3087
  %30 = load %struct.exe_disk_file_t** %29, align 8, !dbg !3087, !tbaa !2219
  %31 = icmp eq %struct.exe_disk_file_t* %30, null, !dbg !3087
  br i1 %31, label %130, label %32, !dbg !3087

; <label>:32                                      ; preds = %26
  %33 = getelementptr inbounds %struct.exe_disk_file_t* %30, i64 0, i32 2, !dbg !3088
  %34 = load %struct.stat64** %33, align 8, !dbg !3088, !tbaa !2157
  switch i64 %request, label %128 [
    i64 21505, label %35
    i64 21506, label %70
    i64 21507, label %77
    i64 21508, label %81
    i64 21523, label %88
    i64 21524, label %98
    i64 21531, label %106
    i64 2150657282, label %126
  ], !dbg !3089

; <label>:35                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([41 x i8]* @.str13, i64 0, i64 0)) #8, !dbg !3090
  %36 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !3091
  %37 = load i32* %36, align 4, !dbg !3091, !tbaa !3093
  %38 = and i32 %37, 61440, !dbg !3091
  %39 = icmp eq i32 %38, 8192, !dbg !3091
  br i1 %39, label %40, label %68, !dbg !3091

; <label>:40                                      ; preds = %35
  %41 = bitcast i8* %28 to i32*, !dbg !3095
  store i32 27906, i32* %41, align 4, !dbg !3095, !tbaa !3097
  %42 = getelementptr inbounds i8* %28, i64 4, !dbg !3099
  %43 = bitcast i8* %42 to i32*, !dbg !3099
  store i32 5, i32* %43, align 4, !dbg !3099, !tbaa !3100
  %44 = getelementptr inbounds i8* %28, i64 8, !dbg !3101
  %45 = bitcast i8* %44 to i32*, !dbg !3101
  store i32 1215, i32* %45, align 4, !dbg !3101, !tbaa !3102
  %46 = getelementptr inbounds i8* %28, i64 12, !dbg !3103
  %47 = bitcast i8* %46 to i32*, !dbg !3103
  store i32 35287, i32* %47, align 4, !dbg !3103, !tbaa !3104
  %48 = getelementptr inbounds i8* %28, i64 16, !dbg !3105
  store i8 0, i8* %48, align 1, !dbg !3105, !tbaa !3106
  %49 = getelementptr inbounds i8* %28, i64 17, !dbg !3107
  store i8 3, i8* %49, align 1, !dbg !3107, !tbaa !2142
  %50 = getelementptr inbounds i8* %28, i64 18, !dbg !3108
  store i8 28, i8* %50, align 1, !dbg !3108, !tbaa !2142
  %51 = getelementptr inbounds i8* %28, i64 19, !dbg !3109
  store i8 127, i8* %51, align 1, !dbg !3109, !tbaa !2142
  %52 = getelementptr inbounds i8* %28, i64 20, !dbg !3110
  store i8 21, i8* %52, align 1, !dbg !3110, !tbaa !2142
  %53 = getelementptr inbounds i8* %28, i64 21, !dbg !3111
  store i8 4, i8* %53, align 1, !dbg !3111, !tbaa !2142
  %54 = getelementptr inbounds i8* %28, i64 22, !dbg !3112
  store i8 0, i8* %54, align 1, !dbg !3112, !tbaa !2142
  %55 = getelementptr inbounds i8* %28, i64 23, !dbg !3113
  store i8 1, i8* %55, align 1, !dbg !3113, !tbaa !2142
  %56 = getelementptr inbounds i8* %28, i64 24, !dbg !3114
  store i8 -1, i8* %56, align 1, !dbg !3114, !tbaa !2142
  %57 = getelementptr inbounds i8* %28, i64 25, !dbg !3115
  store i8 17, i8* %57, align 1, !dbg !3115, !tbaa !2142
  %58 = getelementptr inbounds i8* %28, i64 26, !dbg !3116
  store i8 19, i8* %58, align 1, !dbg !3116, !tbaa !2142
  %59 = getelementptr inbounds i8* %28, i64 27, !dbg !3117
  store i8 26, i8* %59, align 1, !dbg !3117, !tbaa !2142
  %60 = getelementptr inbounds i8* %28, i64 28, !dbg !3118
  store i8 -1, i8* %60, align 1, !dbg !3118, !tbaa !2142
  %61 = getelementptr inbounds i8* %28, i64 29, !dbg !3119
  store i8 18, i8* %61, align 1, !dbg !3119, !tbaa !2142
  %62 = getelementptr inbounds i8* %28, i64 30, !dbg !3120
  store i8 15, i8* %62, align 1, !dbg !3120, !tbaa !2142
  %63 = getelementptr inbounds i8* %28, i64 31, !dbg !3121
  store i8 23, i8* %63, align 1, !dbg !3121, !tbaa !2142
  %64 = getelementptr inbounds i8* %28, i64 32, !dbg !3122
  store i8 22, i8* %64, align 1, !dbg !3122, !tbaa !2142
  %65 = getelementptr inbounds i8* %28, i64 33, !dbg !3123
  store i8 -1, i8* %65, align 1, !dbg !3123, !tbaa !2142
  %66 = getelementptr inbounds i8* %28, i64 34, !dbg !3124
  store i8 0, i8* %66, align 1, !dbg !3124, !tbaa !2142
  %67 = getelementptr inbounds i8* %28, i64 35, !dbg !3125
  store i8 0, i8* %67, align 1, !dbg !3125, !tbaa !2142
  br label %139, !dbg !3126

; <label>:68                                      ; preds = %35
  %69 = call i32* @__errno_location() #4, !dbg !3127
  store i32 25, i32* %69, align 4, !dbg !3127, !tbaa !2189
  br label %139, !dbg !3129

; <label>:70                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([42 x i8]* @.str14, i64 0, i64 0)) #8, !dbg !3130
  %71 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !3132
  %72 = load i32* %71, align 4, !dbg !3132, !tbaa !3093
  %73 = and i32 %72, 61440, !dbg !3132
  %74 = icmp eq i32 %73, 8192, !dbg !3132
  br i1 %74, label %139, label %75, !dbg !3132

; <label>:75                                      ; preds = %70
  %76 = call i32* @__errno_location() #4, !dbg !3134
  store i32 25, i32* %76, align 4, !dbg !3134, !tbaa !2189
  br label %139, !dbg !3136

; <label>:77                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str15, i64 0, i64 0)) #8, !dbg !3137
  %78 = icmp eq i32 %fd, 0, !dbg !3139
  br i1 %78, label %139, label %79, !dbg !3139

; <label>:79                                      ; preds = %77
  %80 = call i32* @__errno_location() #4, !dbg !3141
  store i32 25, i32* %80, align 4, !dbg !3141, !tbaa !2189
  br label %139, !dbg !3143

; <label>:81                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str16, i64 0, i64 0)) #8, !dbg !3144
  %82 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !3146
  %83 = load i32* %82, align 4, !dbg !3146, !tbaa !3093
  %84 = and i32 %83, 61440, !dbg !3146
  %85 = icmp eq i32 %84, 8192, !dbg !3146
  br i1 %85, label %139, label %86, !dbg !3146

; <label>:86                                      ; preds = %81
  %87 = call i32* @__errno_location() #4, !dbg !3148
  store i32 25, i32* %87, align 4, !dbg !3148, !tbaa !2189
  br label %139, !dbg !3150

; <label>:88                                      ; preds = %32
  %89 = bitcast i8* %28 to i16*, !dbg !3151
  store i16 24, i16* %89, align 2, !dbg !3151, !tbaa !3152
  %90 = getelementptr inbounds i8* %28, i64 2, !dbg !3154
  %91 = bitcast i8* %90 to i16*, !dbg !3154
  store i16 80, i16* %91, align 2, !dbg !3154, !tbaa !3155
  call void @klee_warning_once(i8* getelementptr inbounds ([45 x i8]* @.str17, i64 0, i64 0)) #8, !dbg !3156
  %92 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !3157
  %93 = load i32* %92, align 4, !dbg !3157, !tbaa !3093
  %94 = and i32 %93, 61440, !dbg !3157
  %95 = icmp eq i32 %94, 8192, !dbg !3157
  br i1 %95, label %139, label %96, !dbg !3157

; <label>:96                                      ; preds = %88
  %97 = call i32* @__errno_location() #4, !dbg !3159
  store i32 25, i32* %97, align 4, !dbg !3159, !tbaa !2189
  br label %139, !dbg !3161

; <label>:98                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([46 x i8]* @.str18, i64 0, i64 0)) #8, !dbg !3162
  %99 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !3164
  %100 = load i32* %99, align 4, !dbg !3164, !tbaa !3093
  %101 = and i32 %100, 61440, !dbg !3164
  %102 = icmp eq i32 %101, 8192, !dbg !3164
  %103 = call i32* @__errno_location() #4, !dbg !3166
  br i1 %102, label %104, label %105, !dbg !3164

; <label>:104                                     ; preds = %98
  store i32 22, i32* %103, align 4, !dbg !3166, !tbaa !2189
  br label %139, !dbg !3168

; <label>:105                                     ; preds = %98
  store i32 25, i32* %103, align 4, !dbg !3169, !tbaa !2189
  br label %139, !dbg !3171

; <label>:106                                     ; preds = %32
  %107 = bitcast i8* %28 to i32*, !dbg !3172
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str19, i64 0, i64 0)) #8, !dbg !3173
  %108 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !3174
  %109 = load i32* %108, align 4, !dbg !3174, !tbaa !3093
  %110 = and i32 %109, 61440, !dbg !3174
  %111 = icmp eq i32 %110, 8192, !dbg !3174
  br i1 %111, label %112, label %124, !dbg !3174

; <label>:112                                     ; preds = %106
  %113 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 2, !dbg !3176
  %114 = load i64* %113, align 8, !dbg !3176, !tbaa !2501
  %115 = load %struct.exe_disk_file_t** %29, align 8, !dbg !3176, !tbaa !2219
  %116 = getelementptr inbounds %struct.exe_disk_file_t* %115, i64 0, i32 0, !dbg !3176
  %117 = load i32* %116, align 4, !dbg !3176, !tbaa !2515
  %118 = zext i32 %117 to i64, !dbg !3176
  %119 = icmp sgt i64 %118, %114, !dbg !3176
  br i1 %119, label %120, label %123, !dbg !3176

; <label>:120                                     ; preds = %112
  %121 = sub nsw i64 %118, %114, !dbg !3179
  %122 = trunc i64 %121 to i32, !dbg !3179
  br label %123, !dbg !3181

; <label>:123                                     ; preds = %120, %112
  %storemerge = phi i32 [ %122, %120 ], [ 0, %112 ]
  store i32 %storemerge, i32* %107, align 4, !dbg !3179, !tbaa !2189
  br label %139, !dbg !3182

; <label>:124                                     ; preds = %106
  %125 = call i32* @__errno_location() #4, !dbg !3183
  store i32 25, i32* %125, align 4, !dbg !3183, !tbaa !2189
  br label %139, !dbg !3185

; <label>:126                                     ; preds = %32
  call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str20, i64 0, i64 0)) #8, !dbg !3186
  %127 = call i32* @__errno_location() #4, !dbg !3188
  store i32 22, i32* %127, align 4, !dbg !3188, !tbaa !2189
  br label %139, !dbg !3189

; <label>:128                                     ; preds = %32
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str116, i64 0, i64 0)) #8, !dbg !3190
  %129 = call i32* @__errno_location() #4, !dbg !3191
  store i32 22, i32* %129, align 4, !dbg !3191, !tbaa !2189
  br label %139, !dbg !3192

; <label>:130                                     ; preds = %26
  %131 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !3193
  %132 = load i32* %131, align 8, !dbg !3193, !tbaa !2269
  %133 = call i64 (i64, ...)* @syscall(i64 16, i32 %132, i64 %request, i8* %28) #8, !dbg !3193
  %134 = trunc i64 %133 to i32, !dbg !3193
  %135 = icmp eq i32 %134, -1, !dbg !3194
  br i1 %135, label %136, label %139, !dbg !3194

; <label>:136                                     ; preds = %130
  %137 = call i32 @klee_get_errno() #8, !dbg !3196
  %138 = call i32* @__errno_location() #4, !dbg !3196
  store i32 %137, i32* %138, align 4, !dbg !3196, !tbaa !2189
  br label %139, !dbg !3196

; <label>:139                                     ; preds = %136, %130, %128, %126, %124, %123, %105, %104, %96, %88, %86, %81, %79, %77, %75, %70, %68, %40, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %128 ], [ -1, %126 ], [ 0, %123 ], [ -1, %124 ], [ -1, %104 ], [ -1, %105 ], [ -1, %96 ], [ -1, %86 ], [ -1, %79 ], [ -1, %75 ], [ 0, %40 ], [ -1, %68 ], [ -1, %__get_file.exit.thread ], [ 0, %70 ], [ 0, %77 ], [ 0, %81 ], [ 0, %88 
  ret i32 %.0, !dbg !3197
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #8

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #8

declare void @klee_warning_once(i8*) #6

; Function Attrs: nounwind uwtable
define i32 @fcntl(i32 %fd, i32 %cmd, ...) #3 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %1 = icmp ult i32 %fd, 32, !dbg !3198
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !3198

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !3200
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !3201
  %5 = load i32* %4, align 4, !dbg !3201, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !3201
  %7 = icmp eq i32 %6, 0, !dbg !3201
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !3201

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !3200
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !3202
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !3202

__get_file.exit.thread:                           ; preds = %__get_file.exit, %2, %0
  %10 = call i32* @__errno_location() #4, !dbg !3204
  store i32 9, i32* %10, align 4, !dbg !3204, !tbaa !2189
  br label %55, !dbg !3206

; <label>:11                                      ; preds = %__get_file.exit
  switch i32 %cmd, label %12 [
    i32 1026, label %30
    i32 1025, label %30
    i32 11, label %30
    i32 9, label %30
    i32 3, label %30
    i32 1, label %30
  ], !dbg !3207

; <label>:12                                      ; preds = %11
  %13 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !3209
  call void @llvm.va_start(i8* %13), !dbg !3209
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !3211
  %15 = load i32* %14, align 16, !dbg !3211
  %16 = icmp ult i32 %15, 41, !dbg !3211
  br i1 %16, label %17, label %23, !dbg !3211

; <label>:17                                      ; preds = %12
  %18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !3211
  %19 = load i8** %18, align 16, !dbg !3211
  %20 = sext i32 %15 to i64, !dbg !3211
  %21 = getelementptr i8* %19, i64 %20, !dbg !3211
  %22 = add i32 %15, 8, !dbg !3211
  store i32 %22, i32* %14, align 16, !dbg !3211
  br label %27, !dbg !3211

; <label>:23                                      ; preds = %12
  %24 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !3211
  %25 = load i8** %24, align 8, !dbg !3211
  %26 = getelementptr i8* %25, i64 8, !dbg !3211
  store i8* %26, i8** %24, align 8, !dbg !3211
  br label %27, !dbg !3211

; <label>:27                                      ; preds = %23, %17
  %.in = phi i8* [ %21, %17 ], [ %25, %23 ]
  %28 = bitcast i8* %.in to i32*, !dbg !3211
  %29 = load i32* %28, align 4, !dbg !3211
  call void @llvm.va_end(i8* %13), !dbg !3212
  br label %30

; <label>:30                                      ; preds = %27, %11, %11, %11, %11, %11, %11
  %arg.0 = phi i32 [ %29, %27 ], [ 0, %11 ], [ 0, %11 ], [ 0, %11 ], [ 0, %11 ], [ 0, %11 ], [ 0, %11 ]
  %31 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 3, !dbg !3213
  %32 = load %struct.exe_disk_file_t** %31, align 8, !dbg !3213, !tbaa !2219
  %33 = icmp eq %struct.exe_disk_file_t* %32, null, !dbg !3213
  br i1 %33, label %46, label %34, !dbg !3213

; <label>:34                                      ; preds = %30
  switch i32 %cmd, label %44 [
    i32 1, label %35
    i32 2, label %38
    i32 3, label %55
  ], !dbg !3214

; <label>:35                                      ; preds = %34
  %36 = load i32* %4, align 4, !dbg !3215, !tbaa !2200
  %int_cast_to_i64 = zext i32 1 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3215
  %37 = lshr i32 %36, 1, !dbg !3215
  %.lobit = and i32 %37, 1, !dbg !3215
  br label %55, !dbg !3217

; <label>:38                                      ; preds = %34
  %39 = load i32* %4, align 4, !dbg !3218, !tbaa !2200
  %40 = and i32 %39, -3, !dbg !3218
  %41 = and i32 %arg.0, 1, !dbg !3220
  %42 = icmp eq i32 %41, 0, !dbg !3220
  %43 = or i32 %39, 2, !dbg !3222
  %.10 = select i1 %42, i32 %40, i32 %43, !dbg !3220
  store i32 %.10, i32* %4, align 4, !dbg !3218, !tbaa !2200
  br label %55, !dbg !3223

; <label>:44                                      ; preds = %34
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str116, i64 0, i64 0)) #8, !dbg !3224
  %45 = call i32* @__errno_location() #4, !dbg !3225
  store i32 22, i32* %45, align 4, !dbg !3225, !tbaa !2189
  br label %55, !dbg !3226

; <label>:46                                      ; preds = %30
  %47 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !3227
  %48 = load i32* %47, align 8, !dbg !3227, !tbaa !2269
  %49 = call i64 (i64, ...)* @syscall(i64 72, i32 %48, i32 %cmd, i32 %arg.0) #8, !dbg !3227
  %50 = trunc i64 %49 to i32, !dbg !3227
  %51 = icmp eq i32 %50, -1, !dbg !3228
  br i1 %51, label %52, label %55, !dbg !3228

; <label>:52                                      ; preds = %46
  %53 = call i32 @klee_get_errno() #8, !dbg !3230
  %54 = call i32* @__errno_location() #4, !dbg !3230
  store i32 %53, i32* %54, align 4, !dbg !3230, !tbaa !2189
  br label %55, !dbg !3230

; <label>:55                                      ; preds = %52, %46, %44, %38, %35, %34, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %44 ], [ 0, %38 ], [ %.lobit, %35 ], [ -1, %__get_file.exit.thread ], [ 0, %34 ], [ -1, %52 ], [ %50, %46 ]
  ret i32 %.0, !dbg !3231
}

; Function Attrs: nounwind uwtable
define i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) #3 {
  %1 = load i8* %path, align 1, !dbg !3232, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !3234
  %3 = icmp eq i8 %1, 0, !dbg !3234
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !3234

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !3234
  %6 = load i8* %5, align 1, !dbg !3234, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !3234
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !3234

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !3235, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !3235
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !3235

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !3235
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !3235

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3236
  %sext.i = shl i32 %i.02.i, 24, !dbg !3236
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3236
  %12 = ashr exact i32 %sext.i, 24, !dbg !3236
  %13 = add nsw i32 %12, 65, !dbg !3236
  %14 = icmp eq i32 %2, %13, !dbg !3236
  %15 = add i32 %i.02.i, 1, !dbg !3235
  br i1 %14, label %16, label %10, !dbg !3236

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !3237
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !3237, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !3238
  %20 = load %struct.stat64** %19, align 8, !dbg !3238, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !3238
  %22 = load i64* %21, align 8, !dbg !3238, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !3238
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !3237
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !3239
  %or.cond = or i1 %23, %25, !dbg !3238
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !3238

; <label>:26                                      ; preds = %16
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str9, i64 0, i64 0)) #8, !dbg !3241
  %27 = tail call i32* @__errno_location() #4, !dbg !3243
  store i32 2, i32* %27, align 4, !dbg !3243, !tbaa !2189
  br label %58, !dbg !3244

__get_sym_file.exit.thread:                       ; preds = %16, %10, %.preheader.i, %4, %0
  %28 = ptrtoint i8* %path to i64, !dbg !3245
  %29 = tail call i64 @klee_get_valuel(i64 %28) #8, !dbg !3245
  %30 = inttoptr i64 %29 to i8*, !dbg !3245
  %31 = icmp eq i8* %30, %path, !dbg !3248
  %32 = zext i1 %31 to i64, !dbg !3248
  tail call void @klee_assume(i64 %32) #8, !dbg !3248
  br label %33, !dbg !3249

; <label>:33                                      ; preds = %50, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %51, %50 ]
  %sc.0.i = phi i8* [ %30, %__get_sym_file.exit.thread ], [ %sc.1.i, %50 ]
  %34 = load i8* %sc.0.i, align 1, !dbg !3250, !tbaa !2142
  %35 = add i32 %i.0.i, -1, !dbg !3251
  %36 = and i32 %35, %i.0.i, !dbg !3251
  %37 = icmp eq i32 %36, 0, !dbg !3251
  br i1 %37, label %38, label %42, !dbg !3251

; <label>:38                                      ; preds = %33
  switch i8 %34, label %50 [
    i8 0, label %39
    i8 47, label %40
  ], !dbg !3252

; <label>:39                                      ; preds = %38
  store i8 0, i8* %sc.0.i, align 1, !dbg !3253, !tbaa !2142
  br label %__concretize_string.exit, !dbg !3254

; <label>:40                                      ; preds = %38
  %41 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !3255
  store i8 47, i8* %sc.0.i, align 1, !dbg !3255, !tbaa !2142
  br label %50, !dbg !3256

; <label>:42                                      ; preds = %33
  %43 = sext i8 %34 to i64, !dbg !3257
  %44 = tail call i64 @klee_get_valuel(i64 %43) #8, !dbg !3257
  %45 = trunc i64 %44 to i8, !dbg !3257
  %46 = icmp eq i8 %45, %34, !dbg !3258
  %47 = zext i1 %46 to i64, !dbg !3258
  tail call void @klee_assume(i64 %47) #8, !dbg !3258
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !3259
  store i8 %45, i8* %sc.0.i, align 1, !dbg !3259, !tbaa !2142
  %49 = icmp eq i8 %45, 0, !dbg !3260
  br i1 %49, label %__concretize_string.exit, label %50, !dbg !3260

; <label>:50                                      ; preds = %42, %40, %38
  %sc.1.i = phi i8* [ %48, %42 ], [ %41, %40 ], [ %sc.0.i, %38 ]
  %51 = add i32 %i.0.i, 1, !dbg !3249
  br label %33, !dbg !3249

__concretize_string.exit:                         ; preds = %42, %39
  %52 = tail call i64 (i64, ...)* @syscall(i64 137, i8* %path, %struct.statfs* %buf) #8, !dbg !3247
  %53 = trunc i64 %52 to i32, !dbg !3247
  %54 = icmp eq i32 %53, -1, !dbg !3261
  br i1 %54, label %55, label %58, !dbg !3261

; <label>:55                                      ; preds = %__concretize_string.exit
  %56 = tail call i32 @klee_get_errno() #8, !dbg !3263
  %57 = tail call i32* @__errno_location() #4, !dbg !3263
  store i32 %56, i32* %57, align 4, !dbg !3263, !tbaa !2189
  br label %58, !dbg !3263

; <label>:58                                      ; preds = %55, %__concretize_string.exit, %26
  %.0 = phi i32 [ -1, %26 ], [ -1, %55 ], [ %53, %__concretize_string.exit ]
  ret i32 %.0, !dbg !3264
}

; Function Attrs: nounwind uwtable
define i32 @fstatfs(i32 %fd, %struct.statfs* %buf) #3 {
  %1 = icmp ult i32 %fd, 32, !dbg !3265
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !3265

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !3267
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !3268
  %5 = load i32* %4, align 4, !dbg !3268, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !3268
  %7 = icmp eq i32 %6, 0, !dbg !3268
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !3268

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !3267
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !3269
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !3269

__get_file.exit.thread:                           ; preds = %__get_file.exit, %2, %0
  %10 = tail call i32* @__errno_location() #4, !dbg !3271
  store i32 9, i32* %10, align 4, !dbg !3271, !tbaa !2189
  br label %26, !dbg !3273

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 3, !dbg !3274
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !3274, !tbaa !2219
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !3274
  br i1 %14, label %17, label %15, !dbg !3274

; <label>:15                                      ; preds = %11
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str21, i64 0, i64 0)) #8, !dbg !3275
  %16 = tail call i32* @__errno_location() #4, !dbg !3277
  store i32 9, i32* %16, align 4, !dbg !3277, !tbaa !2189
  br label %26, !dbg !3278

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !3279
  %19 = load i32* %18, align 8, !dbg !3279, !tbaa !2269
  %20 = tail call i64 (i64, ...)* @syscall(i64 138, i32 %19, %struct.statfs* %buf) #8, !dbg !3279
  %21 = trunc i64 %20 to i32, !dbg !3279
  %22 = icmp eq i32 %21, -1, !dbg !3280
  br i1 %22, label %23, label %26, !dbg !3280

; <label>:23                                      ; preds = %17
  %24 = tail call i32 @klee_get_errno() #8, !dbg !3282
  %25 = tail call i32* @__errno_location() #4, !dbg !3282
  store i32 %24, i32* %25, align 4, !dbg !3282, !tbaa !2189
  br label %26, !dbg !3282

; <label>:26                                      ; preds = %23, %17, %15, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %15 ], [ -1, %__get_file.exit.thread ], [ -1, %23 ], [ %21, %17 ]
  ret i32 %.0, !dbg !3283
}

; Function Attrs: nounwind uwtable
define i32 @fsync(i32 %fd) #3 {
  %1 = icmp ult i32 %fd, 32, !dbg !3284
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !3284

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !3286
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !3287
  %5 = load i32* %4, align 4, !dbg !3287, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !3287
  %7 = icmp eq i32 %6, 0, !dbg !3287
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !3287

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !3286
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !3288
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !3288

__get_file.exit.thread:                           ; preds = %__get_file.exit, %2, %0
  %10 = tail call i32* @__errno_location() #4, !dbg !3289
  store i32 9, i32* %10, align 4, !dbg !3289, !tbaa !2189
  br label %24, !dbg !3291

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 3, !dbg !3292
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !3292, !tbaa !2219
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !3292
  br i1 %14, label %15, label %24, !dbg !3292

; <label>:15                                      ; preds = %11
  %16 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !3293
  %17 = load i32* %16, align 8, !dbg !3293, !tbaa !2269
  %18 = tail call i64 (i64, ...)* @syscall(i64 74, i32 %17) #8, !dbg !3293
  %19 = trunc i64 %18 to i32, !dbg !3293
  %20 = icmp eq i32 %19, -1, !dbg !3294
  br i1 %20, label %21, label %24, !dbg !3294

; <label>:21                                      ; preds = %15
  %22 = tail call i32 @klee_get_errno() #8, !dbg !3296
  %23 = tail call i32* @__errno_location() #4, !dbg !3296
  store i32 %22, i32* %23, align 4, !dbg !3296, !tbaa !2189
  br label %24, !dbg !3296

; <label>:24                                      ; preds = %21, %15, %11, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %__get_file.exit.thread ], [ 0, %11 ], [ -1, %21 ], [ %19, %15 ]
  ret i32 %.0, !dbg !3297
}

; Function Attrs: nounwind uwtable
define i32 @dup2(i32 %oldfd, i32 %newfd) #3 {
  %1 = icmp ult i32 %oldfd, 32, !dbg !3298
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !3298

; <label>:2                                       ; preds = %0
  %3 = sext i32 %oldfd to i64, !dbg !3300
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !3301
  %5 = load i32* %4, align 4, !dbg !3301, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !3301
  %7 = icmp eq i32 %6, 0, !dbg !3301
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !3301

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !3300
  %9 = icmp ne %struct.exe_file_t* %8, null, !dbg !3302
  %10 = icmp sgt i32 %newfd, -1, !dbg !3302
  %or.cond = and i1 %9, %10, !dbg !3302
  %11 = icmp slt i32 %newfd, 32, !dbg !3302
  %or.cond3 = and i1 %or.cond, %11, !dbg !3302
  br i1 %or.cond3, label %13, label %__get_file.exit.thread, !dbg !3302

__get_file.exit.thread:                           ; preds = %__get_file.exit, %2, %0
  %12 = tail call i32* @__errno_location() #4, !dbg !3303
  store i32 9, i32* %12, align 4, !dbg !3303, !tbaa !2189
  br label %44, !dbg !3305

; <label>:13                                      ; preds = %__get_file.exit
  %14 = sext i32 %newfd to i64, !dbg !3306
  %15 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %14, !dbg !3306
  %16 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %14, i32 1, !dbg !3307
  %17 = load i32* %16, align 4, !dbg !3307, !tbaa !2200
  %18 = and i32 %17, 1, !dbg !3307
  %19 = icmp eq i32 %18, 0, !dbg !3307
  br i1 %19, label %close.exit, label %20, !dbg !3307

; <label>:20                                      ; preds = %13
  %21 = load i32* @close.n_calls, align 4, !dbg !3309, !tbaa !2189
  %22 = add nsw i32 %21, 1, !dbg !3309
  store i32 %22, i32* @close.n_calls, align 4, !dbg !3309, !tbaa !2189
  %23 = icmp ugt i32 %newfd, 31, !dbg !3310
  %24 = icmp eq %struct.exe_file_t* %15, null, !dbg !3312
  %or.cond8 = or i1 %23, %24, !dbg !3310
  br i1 %or.cond8, label %__get_file.exit.thread.i, label %26, !dbg !3310

__get_file.exit.thread.i:                         ; preds = %20
  %25 = tail call i32* @__errno_location() #4, !dbg !3313
  store i32 9, i32* %25, align 4, !dbg !3313, !tbaa !2189
  br label %close.exit, !dbg !3314

; <label>:26                                      ; preds = %20
  %27 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !3315, !tbaa !2456
  %28 = icmp eq i32 %27, 0, !dbg !3315
  br i1 %28, label %36, label %29, !dbg !3315

; <label>:29                                      ; preds = %26
  %30 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !3315, !tbaa !2457
  %31 = load i32* %30, align 4, !dbg !3315, !tbaa !2189
  %32 = icmp eq i32 %31, %22, !dbg !3315
  br i1 %32, label %33, label %36, !dbg !3315

; <label>:33                                      ; preds = %29
  %34 = add i32 %27, -1, !dbg !3316
  store i32 %34, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !3316, !tbaa !2456
  %35 = tail call i32* @__errno_location() #4, !dbg !3317
  store i32 5, i32* %35, align 4, !dbg !3317, !tbaa !2189
  br label %close.exit, !dbg !3318

; <label>:36                                      ; preds = %29, %26
  %37 = bitcast %struct.exe_file_t* %15 to i8*, !dbg !3319
  %38 = call i8* @memset(i8* %37, i32 0, i64 24)
  br label %close.exit, !dbg !3320

close.exit:                                       ; preds = %36, %33, %__get_file.exit.thread.i, %13
  %39 = bitcast %struct.exe_file_t* %15 to i8*, !dbg !3321
  %40 = bitcast %struct.exe_file_t* %8 to i8*, !dbg !3321
  %41 = call i8* @memcpy(i8* %39, i8* %40, i64 24)
  %42 = load i32* %16, align 4, !dbg !3322, !tbaa !2200
  %43 = and i32 %42, -3, !dbg !3322
  store i32 %43, i32* %16, align 4, !dbg !3322, !tbaa !2200
  br label %44, !dbg !3323

; <label>:44                                      ; preds = %close.exit, %__get_file.exit.thread
  %.0 = phi i32 [ %newfd, %close.exit ], [ -1, %__get_file.exit.thread ]
  ret i32 %.0, !dbg !3324
}

; Function Attrs: nounwind uwtable
define i32 @dup(i32 %oldfd) #3 {
  %1 = icmp ult i32 %oldfd, 32, !dbg !3325
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !3325

; <label>:2                                       ; preds = %0
  %3 = sext i32 %oldfd to i64, !dbg !3327
  %4 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, i32 1, !dbg !3328
  %5 = load i32* %4, align 4, !dbg !3328, !tbaa !2200
  %6 = and i32 %5, 1, !dbg !3328
  %7 = icmp eq i32 %6, 0, !dbg !3328
  %8 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %3, !dbg !3327
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !3329
  %or.cond = or i1 %7, %9, !dbg !3328
  br i1 %or.cond, label %__get_file.exit.thread, label %.preheader, !dbg !3328

__get_file.exit.thread:                           ; preds = %2, %0
  %10 = tail call i32* @__errno_location() #4, !dbg !3330
  store i32 9, i32* %10, align 4, !dbg !3330, !tbaa !2189
  br label %25, !dbg !3332

; <label>:11                                      ; preds = %.preheader
  %12 = trunc i64 %indvars.iv.next to i32, !dbg !3333
  %13 = icmp slt i32 %12, 32, !dbg !3333
  br i1 %13, label %.preheader, label %19, !dbg !3333

.preheader:                                       ; preds = %11, %2
  %indvars.iv = phi i64 [ %indvars.iv.next, %11 ], [ 0, %2 ]
  %fd.02 = phi i32 [ %18, %11 ], [ 0, %2 ]
  %14 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !3335
  %15 = load i32* %14, align 4, !dbg !3335, !tbaa !2200
  %16 = and i32 %15, 1, !dbg !3335
  %17 = icmp eq i32 %16, 0, !dbg !3335
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !3333
  %18 = add nsw i32 %fd.02, 1, !dbg !3333
  br i1 %17, label %19, label %11, !dbg !3335

; <label>:19                                      ; preds = %.preheader, %11
  %fd.0.lcssa = phi i32 [ %fd.02, %.preheader ], [ %18, %11 ]
  %20 = icmp eq i32 %fd.0.lcssa, 32, !dbg !3337
  br i1 %20, label %21, label %23, !dbg !3337

; <label>:21                                      ; preds = %19
  %22 = tail call i32* @__errno_location() #4, !dbg !3339
  store i32 24, i32* %22, align 4, !dbg !3339, !tbaa !2189
  br label %25, !dbg !3341

; <label>:23                                      ; preds = %19
  %24 = tail call i32 @dup2(i32 %oldfd, i32 %fd.0.lcssa) #8, !dbg !3342
  br label %25, !dbg !3342

; <label>:25                                      ; preds = %23, %21, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %21 ], [ %24, %23 ], [ -1, %__get_file.exit.thread ]
  ret i32 %.0, !dbg !3344
}

; Function Attrs: nounwind uwtable
define i32 @rmdir(i8* nocapture readonly %pathname) #3 {
  %1 = load i8* %pathname, align 1, !dbg !3345, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !3347
  %3 = icmp eq i8 %1, 0, !dbg !3347
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !3347

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %pathname, i64 1, !dbg !3347
  %6 = load i8* %5, align 1, !dbg !3347, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !3347
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !3347

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !3348, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !3348
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !3348

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !3348
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !3348

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3349
  %sext.i = shl i32 %i.02.i, 24, !dbg !3349
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3349
  %12 = ashr exact i32 %sext.i, 24, !dbg !3349
  %13 = add nsw i32 %12, 65, !dbg !3349
  %14 = icmp eq i32 %2, %13, !dbg !3349
  %15 = add i32 %i.02.i, 1, !dbg !3348
  br i1 %14, label %16, label %10, !dbg !3349

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !3350
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !3350, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !3351
  %20 = load %struct.stat64** %19, align 8, !dbg !3351, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !3351
  %22 = load i64* %21, align 8, !dbg !3351, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !3351
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !3350
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !3352
  %or.cond = or i1 %23, %25, !dbg !3351
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !3351

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 3, !dbg !3354
  %28 = load i32* %27, align 4, !dbg !3354, !tbaa !2233
  %29 = and i32 %28, 61440, !dbg !3354
  %30 = icmp eq i32 %29, 16384, !dbg !3354
  br i1 %30, label %31, label %32, !dbg !3354

; <label>:31                                      ; preds = %26
  store i64 0, i64* %21, align 8, !dbg !3357, !tbaa !2159
  br label %35, !dbg !3359

; <label>:32                                      ; preds = %26
  %33 = tail call i32* @__errno_location() #4, !dbg !3360
  store i32 20, i32* %33, align 4, !dbg !3360, !tbaa !2189
  br label %35, !dbg !3362

__get_sym_file.exit.thread:                       ; preds = %16, %10, %.preheader.i, %4, %0
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str227, i64 0, i64 0)) #8, !dbg !3363
  %34 = tail call i32* @__errno_location() #4, !dbg !3364
  store i32 1, i32* %34, align 4, !dbg !3364, !tbaa !2189
  br label %35, !dbg !3365

; <label>:35                                      ; preds = %__get_sym_file.exit.thread, %32, %31
  %.0 = phi i32 [ 0, %31 ], [ -1, %32 ], [ -1, %__get_sym_file.exit.thread ]
  ret i32 %.0, !dbg !3366
}

; Function Attrs: nounwind uwtable
define i32 @unlink(i8* nocapture readonly %pathname) #3 {
  %1 = load i8* %pathname, align 1, !dbg !3367, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !3369
  %3 = icmp eq i8 %1, 0, !dbg !3369
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !3369

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %pathname, i64 1, !dbg !3369
  %6 = load i8* %5, align 1, !dbg !3369, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !3369
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !3369

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !3370, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !3370
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !3370

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !3370
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !3370

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3371
  %sext.i = shl i32 %i.02.i, 24, !dbg !3371
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3371
  %12 = ashr exact i32 %sext.i, 24, !dbg !3371
  %13 = add nsw i32 %12, 65, !dbg !3371
  %14 = icmp eq i32 %2, %13, !dbg !3371
  %15 = add i32 %i.02.i, 1, !dbg !3370
  br i1 %14, label %16, label %10, !dbg !3371

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !3372
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !3372, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !3373
  %20 = load %struct.stat64** %19, align 8, !dbg !3373, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !3373
  %22 = load i64* %21, align 8, !dbg !3373, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !3373
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !3372
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !3374
  %or.cond = or i1 %23, %25, !dbg !3373
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !3373

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 3, !dbg !3376
  %28 = load i32* %27, align 4, !dbg !3376, !tbaa !2233
  %29 = and i32 %28, 61440, !dbg !3376
  %30 = icmp eq i32 %29, 32768, !dbg !3376
  br i1 %30, label %31, label %32, !dbg !3376

; <label>:31                                      ; preds = %26
  store i64 0, i64* %21, align 8, !dbg !3379, !tbaa !2159
  br label %38, !dbg !3381

; <label>:32                                      ; preds = %26
  %33 = icmp eq i32 %29, 16384, !dbg !3382
  %34 = tail call i32* @__errno_location() #4, !dbg !3384
  br i1 %33, label %35, label %36, !dbg !3382

; <label>:35                                      ; preds = %32
  store i32 21, i32* %34, align 4, !dbg !3384, !tbaa !2189
  br label %38, !dbg !3386

; <label>:36                                      ; preds = %32
  store i32 1, i32* %34, align 4, !dbg !3387, !tbaa !2189
  br label %38, !dbg !3389

__get_sym_file.exit.thread:                       ; preds = %16, %10, %.preheader.i, %4, %0
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str227, i64 0, i64 0)) #8, !dbg !3390
  %37 = tail call i32* @__errno_location() #4, !dbg !3391
  store i32 1, i32* %37, align 4, !dbg !3391, !tbaa !2189
  br label %38, !dbg !3392

; <label>:38                                      ; preds = %__get_sym_file.exit.thread, %36, %35, %31
  %.0 = phi i32 [ 0, %31 ], [ -1, %35 ], [ -1, %36 ], [ -1, %__get_sym_file.exit.thread ]
  ret i32 %.0, !dbg !3393
}

; Function Attrs: nounwind uwtable
define i32 @unlinkat(i32 %dirfd, i8* nocapture readonly %pathname, i32 %flags) #3 {
  %1 = load i8* %pathname, align 1, !dbg !3394, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !3396
  %3 = icmp eq i8 %1, 0, !dbg !3396
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !3396

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %pathname, i64 1, !dbg !3396
  %6 = load i8* %5, align 1, !dbg !3396, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !3396
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !3396

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !3397, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !3397
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !3397

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !3397
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !3397

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3398
  %sext.i = shl i32 %i.02.i, 24, !dbg !3398
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3398
  %12 = ashr exact i32 %sext.i, 24, !dbg !3398
  %13 = add nsw i32 %12, 65, !dbg !3398
  %14 = icmp eq i32 %2, %13, !dbg !3398
  %15 = add i32 %i.02.i, 1, !dbg !3397
  br i1 %14, label %16, label %10, !dbg !3398

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !3399
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !3399, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !3400
  %20 = load %struct.stat64** %19, align 8, !dbg !3400, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !3400
  %22 = load i64* %21, align 8, !dbg !3400, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !3400
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !3399
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !3401
  %or.cond = or i1 %23, %25, !dbg !3400
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !3400

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 3, !dbg !3403
  %28 = load i32* %27, align 4, !dbg !3403, !tbaa !2233
  %29 = and i32 %28, 61440, !dbg !3403
  %30 = icmp eq i32 %29, 32768, !dbg !3403
  br i1 %30, label %31, label %32, !dbg !3403

; <label>:31                                      ; preds = %26
  store i64 0, i64* %21, align 8, !dbg !3406, !tbaa !2159
  br label %38, !dbg !3408

; <label>:32                                      ; preds = %26
  %33 = icmp eq i32 %29, 16384, !dbg !3409
  %34 = tail call i32* @__errno_location() #4, !dbg !3411
  br i1 %33, label %35, label %36, !dbg !3409

; <label>:35                                      ; preds = %32
  store i32 21, i32* %34, align 4, !dbg !3411, !tbaa !2189
  br label %38, !dbg !3413

; <label>:36                                      ; preds = %32
  store i32 1, i32* %34, align 4, !dbg !3414, !tbaa !2189
  br label %38, !dbg !3416

__get_sym_file.exit.thread:                       ; preds = %16, %10, %.preheader.i, %4, %0
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str227, i64 0, i64 0)) #8, !dbg !3417
  %37 = tail call i32* @__errno_location() #4, !dbg !3418
  store i32 1, i32* %37, align 4, !dbg !3418, !tbaa !2189
  br label %38, !dbg !3419

; <label>:38                                      ; preds = %__get_sym_file.exit.thread, %36, %35, %31
  %.0 = phi i32 [ 0, %31 ], [ -1, %35 ], [ -1, %36 ], [ -1, %__get_sym_file.exit.thread ]
  ret i32 %.0, !dbg !3420
}

; Function Attrs: nounwind uwtable
define i64 @readlink(i8* %path, i8* %buf, i64 %bufsize) #3 {
  %1 = load i8* %path, align 1, !dbg !3421, !tbaa !2142
  %2 = sext i8 %1 to i32, !dbg !3423
  %3 = icmp eq i8 %1, 0, !dbg !3423
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !3423

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !3423
  %6 = load i8* %5, align 1, !dbg !3423, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !3423
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !3423

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !3424, !tbaa !2148
  %9 = icmp eq i32 %8, 0, !dbg !3424
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !3424

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !3424
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !3424

.lr.ph.i:                                         ; preds = %10, %.preheader.i
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3425
  %sext.i = shl i32 %i.02.i, 24, !dbg !3425
  %int_cast_to_i641 = zext i32 24 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3425
  %12 = ashr exact i32 %sext.i, 24, !dbg !3425
  %13 = add nsw i32 %12, 65, !dbg !3425
  %14 = icmp eq i32 %2, %13, !dbg !3425
  %15 = add i32 %i.02.i, 1, !dbg !3424
  br i1 %14, label %16, label %10, !dbg !3425

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !3426
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !3426, !tbaa !2154
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !3427
  %20 = load %struct.stat64** %19, align 8, !dbg !3427, !tbaa !2157
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !3427
  %22 = load i64* %21, align 8, !dbg !3427, !tbaa !2159
  %23 = icmp eq i64 %22, 0, !dbg !3427
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !3426
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !3428
  %or.cond = or i1 %23, %25, !dbg !3427
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !3427

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 3, !dbg !3429
  %28 = load i32* %27, align 4, !dbg !3429, !tbaa !2233
  %29 = and i32 %28, 61440, !dbg !3429
  %30 = icmp eq i32 %29, 40960, !dbg !3429
  br i1 %30, label %31, label %45, !dbg !3429

; <label>:31                                      ; preds = %26
  store i8 %1, i8* %buf, align 1, !dbg !3432, !tbaa !2142
  %32 = icmp ugt i64 %bufsize, 1, !dbg !3434
  br i1 %32, label %33, label %.thread2, !dbg !3434

; <label>:33                                      ; preds = %31
  %34 = getelementptr inbounds i8* %buf, i64 1, !dbg !3434
  store i8 46, i8* %34, align 1, !dbg !3434, !tbaa !2142
  %35 = icmp ugt i64 %bufsize, 2, !dbg !3436
  br i1 %35, label %36, label %.thread2, !dbg !3436

; <label>:36                                      ; preds = %33
  %37 = getelementptr inbounds i8* %buf, i64 2, !dbg !3436
  store i8 108, i8* %37, align 1, !dbg !3436, !tbaa !2142
  %38 = icmp ugt i64 %bufsize, 3, !dbg !3438
  br i1 %38, label %.thread1, label %.thread2, !dbg !3438

.thread1:                                         ; preds = %36
  %39 = getelementptr inbounds i8* %buf, i64 3, !dbg !3438
  store i8 110, i8* %39, align 1, !dbg !3438, !tbaa !2142
  %40 = icmp ugt i64 %bufsize, 4, !dbg !3440
  br i1 %40, label %41, label %.thread2, !dbg !3440

; <label>:41                                      ; preds = %.thread1
  %42 = getelementptr inbounds i8* %buf, i64 4, !dbg !3440
  store i8 107, i8* %42, align 1, !dbg !3440, !tbaa !2142
  br label %.thread2, !dbg !3440

.thread2:                                         ; preds = %41, %.thread1, %36, %33, %31
  %43 = icmp ugt i64 %bufsize, 5, !dbg !3442
  %44 = select i1 %43, i64 5, i64 %bufsize, !dbg !3442
  br label %55, !dbg !3442

; <label>:45                                      ; preds = %26
  %46 = tail call i32* @__errno_location() #4, !dbg !3443
  store i32 22, i32* %46, align 4, !dbg !3443, !tbaa !2189
  br label %55, !dbg !3445

__get_sym_file.exit.thread:                       ; preds = %16, %10, %.preheader.i, %4, %0
  %47 = tail call i64 (i64, ...)* @syscall(i64 89, i8* %path, i8* %buf, i64 %bufsize) #8, !dbg !3446
  %48 = trunc i64 %47 to i32, !dbg !3446
  %49 = icmp eq i32 %48, -1, !dbg !3447
  br i1 %49, label %50, label %53, !dbg !3447

; <label>:50                                      ; preds = %__get_sym_file.exit.thread
  %51 = tail call i32 @klee_get_errno() #8, !dbg !3449
  %52 = tail call i32* @__errno_location() #4, !dbg !3449
  store i32 %51, i32* %52, align 4, !dbg !3449, !tbaa !2189
  br label %53, !dbg !3449

; <label>:53                                      ; preds = %50, %__get_sym_file.exit.thread
  %int_cast_to_i642 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i642), !dbg !3450
  %sext = shl i64 %47, 32, !dbg !3450
  %int_cast_to_i643 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i643), !dbg !3450
  %54 = ashr exact i64 %sext, 32, !dbg !3450
  br label %55, !dbg !3450

; <label>:55                                      ; preds = %53, %45, %.thread2
  %.0 = phi i64 [ %44, %.thread2 ], [ -1, %45 ], [ %54, %53 ]
  ret i64 %.0, !dbg !3451
}

; Function Attrs: nounwind uwtable
define i32 @select(i32 %nfds, %struct.fd_set* %read, %struct.fd_set* %write, %struct.fd_set* %except, %struct.timeval* nocapture readnone %timeout) #3 {
  %in_read = alloca %struct.fd_set, align 8
  %in_write = alloca %struct.fd_set, align 8
  %in_except = alloca %struct.fd_set, align 8
  %os_read = alloca %struct.fd_set, align 8
  %os_write = alloca %struct.fd_set, align 8
  %os_except = alloca %struct.fd_set, align 8
  %tv = alloca %struct.timeval, align 8
  %1 = bitcast %struct.fd_set* %in_read to i8*, !dbg !3452
  %2 = bitcast %struct.fd_set* %in_write to i8*, !dbg !3452
  %3 = bitcast %struct.fd_set* %in_except to i8*, !dbg !3452
  %4 = bitcast %struct.fd_set* %os_read to i8*, !dbg !3452
  %5 = bitcast %struct.fd_set* %os_write to i8*, !dbg !3452
  %6 = bitcast %struct.fd_set* %os_except to i8*, !dbg !3452
  %7 = icmp ne %struct.fd_set* %read, null, !dbg !3453
  br i1 %7, label %8, label %12, !dbg !3453

; <label>:8                                       ; preds = %0
  %9 = bitcast %struct.fd_set* %read to i8*, !dbg !3455
  %10 = call i8* @memcpy(i8* %1, i8* %9, i64 128)
  %11 = call i8* @memset(i8* %9, i32 0, i64 128)
  br label %14, !dbg !3457

; <label>:12                                      ; preds = %0
  %13 = call i8* @memset(i8* %1, i32 0, i64 128)
  br label %14

; <label>:14                                      ; preds = %12, %8
  %15 = icmp ne %struct.fd_set* %write, null, !dbg !3458
  br i1 %15, label %16, label %20, !dbg !3458

; <label>:16                                      ; preds = %14
  %17 = bitcast %struct.fd_set* %write to i8*, !dbg !3460
  %18 = call i8* @memcpy(i8* %2, i8* %17, i64 128)
  %19 = call i8* @memset(i8* %17, i32 0, i64 128)
  br label %22, !dbg !3462

; <label>:20                                      ; preds = %14
  %21 = call i8* @memset(i8* %2, i32 0, i64 128)
  br label %22

; <label>:22                                      ; preds = %20, %16
  %23 = icmp ne %struct.fd_set* %except, null, !dbg !3463
  br i1 %23, label %24, label %28, !dbg !3463

; <label>:24                                      ; preds = %22
  %25 = bitcast %struct.fd_set* %except to i8*, !dbg !3465
  %26 = call i8* @memcpy(i8* %3, i8* %25, i64 128)
  %27 = call i8* @memset(i8* %25, i32 0, i64 128)
  br label %30, !dbg !3467

; <label>:28                                      ; preds = %22
  %29 = call i8* @memset(i8* %3, i32 0, i64 128)
  br label %30

; <label>:30                                      ; preds = %28, %24
  %31 = call i8* @memset(i8* %4, i32 0, i64 128)
  %32 = call i8* @memset(i8* %5, i32 0, i64 128)
  %33 = call i8* @memset(i8* %6, i32 0, i64 128)
  %34 = icmp sgt i32 %nfds, 0, !dbg !3468
  br i1 %34, label %.lr.ph12, label %.loopexit, !dbg !3468

.lr.ph12:                                         ; preds = %136, %30
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %136 ], [ 0, %30 ]
  %count.09 = phi i32 [ %count.1, %136 ], [ 0, %30 ]
  %os_nfds.08 = phi i32 [ %os_nfds.1, %136 ], [ 0, %30 ]
  %35 = trunc i64 %indvars.iv14 to i32, !dbg !3469
  %int_cast_to_i64 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !3469
  %36 = sdiv i32 %35, 64, !dbg !3469
  %37 = sext i32 %36 to i64, !dbg !3469
  %38 = getelementptr inbounds %struct.fd_set* %in_read, i64 0, i32 0, i64 %37, !dbg !3469
  %39 = load i64* %38, align 8, !dbg !3469, !tbaa !3470
  %40 = and i32 %35, 63, !dbg !3469
  %int_cast_to_i6414 = zext i32 %40 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6414), !dbg !3469
  %41 = shl i32 1, %40, !dbg !3469
  %42 = sext i32 %41 to i64, !dbg !3469
  %43 = and i64 %39, %42, !dbg !3469
  %44 = icmp eq i64 %43, 0, !dbg !3469
  br i1 %44, label %45, label %55, !dbg !3469

; <label>:45                                      ; preds = %.lr.ph12
  %46 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %37, !dbg !3469
  %47 = load i64* %46, align 8, !dbg !3469, !tbaa !3470
  %48 = and i64 %47, %42, !dbg !3469
  %49 = icmp eq i64 %48, 0, !dbg !3469
  br i1 %49, label %50, label %55, !dbg !3469

; <label>:50                                      ; preds = %45
  %51 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %37, !dbg !3469
  %52 = load i64* %51, align 8, !dbg !3469, !tbaa !3470
  %53 = and i64 %52, %42, !dbg !3469
  %54 = icmp eq i64 %53, 0, !dbg !3469
  br i1 %54, label %136, label %55, !dbg !3469

; <label>:55                                      ; preds = %50, %45, %.lr.ph12
  %56 = icmp ult i32 %35, 32, !dbg !3471
  br i1 %56, label %57, label %__get_file.exit.thread, !dbg !3471

; <label>:57                                      ; preds = %55
  %58 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %indvars.iv14, i32 1, !dbg !3473
  %59 = load i32* %58, align 4, !dbg !3473, !tbaa !2200
  %60 = and i32 %59, 1, !dbg !3473
  %61 = icmp eq i32 %60, 0, !dbg !3473
  br i1 %61, label %__get_file.exit.thread, label %__get_file.exit, !dbg !3473

__get_file.exit:                                  ; preds = %57
  %62 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %indvars.iv14, !dbg !3474
  %63 = icmp eq %struct.exe_file_t* %62, null, !dbg !3475
  br i1 %63, label %__get_file.exit.thread, label %65, !dbg !3475

__get_file.exit.thread:                           ; preds = %__get_file.exit, %57, %55
  %64 = call i32* @__errno_location() #4, !dbg !3477
  store i32 9, i32* %64, align 4, !dbg !3477, !tbaa !2189
  br label %.loopexit, !dbg !3479

; <label>:65                                      ; preds = %__get_file.exit
  %66 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %indvars.iv14, i32 3, !dbg !3480
  %67 = load %struct.exe_disk_file_t** %66, align 8, !dbg !3480, !tbaa !2219
  %68 = icmp eq %struct.exe_disk_file_t* %67, null, !dbg !3480
  %69 = icmp ne i64 %43, 0, !dbg !3482
  br i1 %68, label %95, label %70, !dbg !3480

; <label>:70                                      ; preds = %65
  br i1 %69, label %71, label %75, !dbg !3482

; <label>:71                                      ; preds = %70
  %72 = getelementptr inbounds %struct.fd_set* %read, i64 0, i32 0, i64 %37, !dbg !3482
  %73 = load i64* %72, align 8, !dbg !3482, !tbaa !3470
  %74 = or i64 %73, %42, !dbg !3482
  store i64 %74, i64* %72, align 8, !dbg !3482, !tbaa !3470
  br label %75, !dbg !3482

; <label>:75                                      ; preds = %71, %70
  %76 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %37, !dbg !3485
  %77 = load i64* %76, align 8, !dbg !3485, !tbaa !3470
  %78 = and i64 %77, %42, !dbg !3485
  %79 = icmp eq i64 %78, 0, !dbg !3485
  br i1 %79, label %84, label %80, !dbg !3485

; <label>:80                                      ; preds = %75
  %81 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %37, !dbg !3485
  %82 = load i64* %81, align 8, !dbg !3485, !tbaa !3470
  %83 = or i64 %82, %42, !dbg !3485
  store i64 %83, i64* %81, align 8, !dbg !3485, !tbaa !3470
  br label %84, !dbg !3485

; <label>:84                                      ; preds = %80, %75
  %85 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %37, !dbg !3487
  %86 = load i64* %85, align 8, !dbg !3487, !tbaa !3470
  %87 = and i64 %86, %42, !dbg !3487
  %88 = icmp eq i64 %87, 0, !dbg !3487
  br i1 %88, label %93, label %89, !dbg !3487

; <label>:89                                      ; preds = %84
  %90 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %37, !dbg !3487
  %91 = load i64* %90, align 8, !dbg !3487, !tbaa !3470
  %92 = or i64 %91, %42, !dbg !3487
  store i64 %92, i64* %90, align 8, !dbg !3487, !tbaa !3470
  br label %93, !dbg !3487

; <label>:93                                      ; preds = %89, %84
  %94 = add nsw i32 %count.09, 1, !dbg !3489
  br label %136, !dbg !3490

; <label>:95                                      ; preds = %65
  br i1 %69, label %96, label %107, !dbg !3491

; <label>:96                                      ; preds = %95
  %97 = getelementptr inbounds %struct.exe_file_t* %62, i64 0, i32 0, !dbg !3491
  %98 = load i32* %97, align 8, !dbg !3491, !tbaa !2269
  %99 = and i32 %98, 63, !dbg !3491
  %int_cast_to_i6415 = zext i32 %99 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6415), !dbg !3491
  %100 = shl i32 1, %99, !dbg !3491
  %101 = sext i32 %100 to i64, !dbg !3491
  %int_cast_to_i641 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !3491
  %102 = sdiv i32 %98, 64, !dbg !3491
  %103 = sext i32 %102 to i64, !dbg !3491
  %104 = getelementptr inbounds %struct.fd_set* %os_read, i64 0, i32 0, i64 %103, !dbg !3491
  %105 = load i64* %104, align 8, !dbg !3491, !tbaa !3470
  %106 = or i64 %101, %105, !dbg !3491
  store i64 %106, i64* %104, align 8, !dbg !3491, !tbaa !3470
  br label %107, !dbg !3491

; <label>:107                                     ; preds = %96, %95
  %108 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %37, !dbg !3494
  %109 = load i64* %108, align 8, !dbg !3494, !tbaa !3470
  %110 = and i64 %109, %42, !dbg !3494
  %111 = icmp eq i64 %110, 0, !dbg !3494
  %.phi.trans.insert.phi.trans.insert = getelementptr inbounds %struct.exe_file_t* %62, i64 0, i32 0
  %.pre.pre = load i32* %.phi.trans.insert.phi.trans.insert, align 8, !dbg !3496, !tbaa !2269
  br i1 %111, label %._crit_edge5, label %112, !dbg !3494

; <label>:112                                     ; preds = %107
  %113 = and i32 %.pre.pre, 63, !dbg !3494
  %int_cast_to_i6416 = zext i32 %113 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6416), !dbg !3494
  %114 = shl i32 1, %113, !dbg !3494
  %115 = sext i32 %114 to i64, !dbg !3494
  %int_cast_to_i642 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !3494
  %116 = sdiv i32 %.pre.pre, 64, !dbg !3494
  %117 = sext i32 %116 to i64, !dbg !3494
  %118 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %117, !dbg !3494
  %119 = load i64* %118, align 8, !dbg !3494, !tbaa !3470
  %120 = or i64 %115, %119, !dbg !3494
  store i64 %120, i64* %118, align 8, !dbg !3494, !tbaa !3470
  br label %._crit_edge5, !dbg !3494

._crit_edge5:                                     ; preds = %112, %107
  %121 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %37, !dbg !3498
  %122 = load i64* %121, align 8, !dbg !3498, !tbaa !3470
  %123 = and i64 %122, %42, !dbg !3498
  %124 = icmp eq i64 %123, 0, !dbg !3498
  br i1 %124, label %._crit_edge16, label %125, !dbg !3498

; <label>:125                                     ; preds = %._crit_edge5
  %126 = and i32 %.pre.pre, 63, !dbg !3498
  %int_cast_to_i6417 = zext i32 %126 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6417), !dbg !3498
  %127 = shl i32 1, %126, !dbg !3498
  %128 = sext i32 %127 to i64, !dbg !3498
  %int_cast_to_i643 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !3498
  %129 = sdiv i32 %.pre.pre, 64, !dbg !3498
  %130 = sext i32 %129 to i64, !dbg !3498
  %131 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %130, !dbg !3498
  %132 = load i64* %131, align 8, !dbg !3498, !tbaa !3470
  %133 = or i64 %132, %128, !dbg !3498
  store i64 %133, i64* %131, align 8, !dbg !3498, !tbaa !3470
  br label %._crit_edge16, !dbg !3498

._crit_edge16:                                    ; preds = %125, %._crit_edge5
  %134 = icmp slt i32 %.pre.pre, %os_nfds.08, !dbg !3496
  %135 = add nsw i32 %.pre.pre, 1, !dbg !3496
  %os_nfds.0. = select i1 %134, i32 %os_nfds.08, i32 %135, !dbg !3496
  br label %136, !dbg !3496

; <label>:136                                     ; preds = %._crit_edge16, %93, %50
  %os_nfds.1 = phi i32 [ %os_nfds.08, %93 ], [ %os_nfds.08, %50 ], [ %os_nfds.0., %._crit_edge16 ]
  %count.1 = phi i32 [ %94, %93 ], [ %count.09, %50 ], [ %count.09, %._crit_edge16 ]
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1, !dbg !3468
  %137 = trunc i64 %indvars.iv.next15 to i32, !dbg !3468
  %138 = icmp slt i32 %137, %nfds, !dbg !3468
  br i1 %138, label %.lr.ph12, label %._crit_edge, !dbg !3468

._crit_edge:                                      ; preds = %136
  %139 = icmp sgt i32 %os_nfds.1, 0, !dbg !3500
  br i1 %139, label %140, label %.loopexit, !dbg !3500

; <label>:140                                     ; preds = %._crit_edge
  %141 = bitcast %struct.timeval* %tv to i8*, !dbg !3501
  %142 = call i8* @memset(i8* %141, i32 0, i64 16)
  %143 = call i64 (i64, ...)* @syscall(i64 23, i32 %os_nfds.1, %struct.fd_set* %os_read, %struct.fd_set* %os_write, %struct.fd_set* %os_except, %struct.timeval* %tv) #8, !dbg !3502
  %144 = trunc i64 %143 to i32, !dbg !3502
  %145 = icmp eq i32 %144, -1, !dbg !3503
  br i1 %145, label %146, label %.lr.ph.preheader, !dbg !3503

; <label>:146                                     ; preds = %140
  %147 = icmp eq i32 %count.1, 0, !dbg !3504
  br i1 %147, label %148, label %.loopexit, !dbg !3504

; <label>:148                                     ; preds = %146
  %149 = call i32 @klee_get_errno() #8, !dbg !3507
  %150 = call i32* @__errno_location() #4, !dbg !3507
  store i32 %149, i32* %150, align 4, !dbg !3507, !tbaa !2189
  br label %.loopexit, !dbg !3509

.lr.ph.preheader:                                 ; preds = %140
  %151 = add nsw i32 %144, %count.1, !dbg !3510
  br i1 %7, label %.lr.ph.us, label %.lr.ph

.lr.ph.us:                                        ; preds = %__get_file.exit3.thread.us, %.lr.ph.preheader
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us, %__get_file.exit3.thread.us ], [ 0, %.lr.ph.preheader ]
  %152 = trunc i64 %indvars.iv.us to i32, !dbg !3511
  %153 = icmp ult i32 %152, 32, !dbg !3511
  br i1 %153, label %154, label %__get_file.exit3.thread.us, !dbg !3511

; <label>:154                                     ; preds = %.lr.ph.us
  %155 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %indvars.iv.us, i32 1, !dbg !3513
  %156 = load i32* %155, align 4, !dbg !3513, !tbaa !2200
  %157 = and i32 %156, 1, !dbg !3513
  %158 = icmp eq i32 %157, 0, !dbg !3513
  br i1 %158, label %__get_file.exit3.thread.us, label %__get_file.exit3.us, !dbg !3513

__get_file.exit3.us:                              ; preds = %154
  %159 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %indvars.iv.us, !dbg !3514
  %160 = icmp eq %struct.exe_file_t* %159, null, !dbg !3515
  br i1 %160, label %__get_file.exit3.thread.us, label %161, !dbg !3515

; <label>:161                                     ; preds = %__get_file.exit3.us
  %162 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %indvars.iv.us, i32 3, !dbg !3515
  %163 = load %struct.exe_disk_file_t** %162, align 8, !dbg !3515, !tbaa !2219
  %164 = icmp eq %struct.exe_disk_file_t* %163, null, !dbg !3515
  br i1 %164, label %165, label %__get_file.exit3.thread.us, !dbg !3515

; <label>:165                                     ; preds = %161
  %166 = getelementptr inbounds %struct.exe_file_t* %159, i64 0, i32 0, !dbg !3517
  %167 = load i32* %166, align 8, !dbg !3517, !tbaa !2269
  %int_cast_to_i644 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !3517
  %168 = sdiv i32 %167, 64, !dbg !3517
  %169 = sext i32 %168 to i64, !dbg !3517
  %170 = getelementptr inbounds %struct.fd_set* %os_read, i64 0, i32 0, i64 %169, !dbg !3517
  %171 = load i64* %170, align 8, !dbg !3517, !tbaa !3470
  %172 = and i32 %167, 63, !dbg !3517
  %int_cast_to_i6418 = zext i32 %172 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6418), !dbg !3517
  %173 = shl i32 1, %172, !dbg !3517
  %174 = sext i32 %173 to i64, !dbg !3517
  %175 = and i64 %174, %171, !dbg !3517
  %176 = icmp eq i64 %175, 0, !dbg !3517
  br i1 %176, label %186, label %177, !dbg !3517

; <label>:177                                     ; preds = %165
  %178 = and i32 %152, 63, !dbg !3517
  %int_cast_to_i6419 = zext i32 %178 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6419), !dbg !3517
  %179 = shl i32 1, %178, !dbg !3517
  %180 = sext i32 %179 to i64, !dbg !3517
  %int_cast_to_i645 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !3517
  %181 = sdiv i32 %152, 64, !dbg !3517
  %182 = sext i32 %181 to i64, !dbg !3517
  %183 = getelementptr inbounds %struct.fd_set* %read, i64 0, i32 0, i64 %182, !dbg !3517
  %184 = load i64* %183, align 8, !dbg !3517, !tbaa !3470
  %185 = or i64 %184, %180, !dbg !3517
  store i64 %185, i64* %183, align 8, !dbg !3517, !tbaa !3470
  br label %186, !dbg !3517

; <label>:186                                     ; preds = %177, %165
  br i1 %15, label %187, label %208, !dbg !3520

; <label>:187                                     ; preds = %186
  %188 = getelementptr inbounds %struct.exe_file_t* %159, i64 0, i32 0, !dbg !3520
  %189 = load i32* %188, align 8, !dbg !3520, !tbaa !2269
  %int_cast_to_i646 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !3520
  %190 = sdiv i32 %189, 64, !dbg !3520
  %191 = sext i32 %190 to i64, !dbg !3520
  %192 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %191, !dbg !3520
  %193 = load i64* %192, align 8, !dbg !3520, !tbaa !3470
  %194 = and i32 %189, 63, !dbg !3520
  %int_cast_to_i6420 = zext i32 %194 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6420), !dbg !3520
  %195 = shl i32 1, %194, !dbg !3520
  %196 = sext i32 %195 to i64, !dbg !3520
  %197 = and i64 %196, %193, !dbg !3520
  %198 = icmp eq i64 %197, 0, !dbg !3520
  br i1 %198, label %208, label %199, !dbg !3520

; <label>:199                                     ; preds = %187
  %200 = and i32 %152, 63, !dbg !3520
  %int_cast_to_i6421 = zext i32 %200 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6421), !dbg !3520
  %201 = shl i32 1, %200, !dbg !3520
  %202 = sext i32 %201 to i64, !dbg !3520
  %int_cast_to_i647 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !3520
  %203 = sdiv i32 %152, 64, !dbg !3520
  %204 = sext i32 %203 to i64, !dbg !3520
  %205 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %204, !dbg !3520
  %206 = load i64* %205, align 8, !dbg !3520, !tbaa !3470
  %207 = or i64 %206, %202, !dbg !3520
  store i64 %207, i64* %205, align 8, !dbg !3520, !tbaa !3470
  br label %208, !dbg !3520

; <label>:208                                     ; preds = %199, %187, %186
  br i1 %23, label %209, label %__get_file.exit3.thread.us, !dbg !3522

; <label>:209                                     ; preds = %208
  %210 = getelementptr inbounds %struct.exe_file_t* %159, i64 0, i32 0, !dbg !3522
  %211 = load i32* %210, align 8, !dbg !3522, !tbaa !2269
  %int_cast_to_i648 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !3522
  %212 = sdiv i32 %211, 64, !dbg !3522
  %213 = sext i32 %212 to i64, !dbg !3522
  %214 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %213, !dbg !3522
  %215 = load i64* %214, align 8, !dbg !3522, !tbaa !3470
  %216 = and i32 %211, 63, !dbg !3522
  %int_cast_to_i6422 = zext i32 %216 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6422), !dbg !3522
  %217 = shl i32 1, %216, !dbg !3522
  %218 = sext i32 %217 to i64, !dbg !3522
  %219 = and i64 %218, %215, !dbg !3522
  %220 = icmp eq i64 %219, 0, !dbg !3522
  br i1 %220, label %__get_file.exit3.thread.us, label %221, !dbg !3522

; <label>:221                                     ; preds = %209
  %222 = and i32 %152, 63, !dbg !3522
  %int_cast_to_i6423 = zext i32 %222 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6423), !dbg !3522
  %223 = shl i32 1, %222, !dbg !3522
  %224 = sext i32 %223 to i64, !dbg !3522
  %int_cast_to_i649 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !3522
  %225 = sdiv i32 %152, 64, !dbg !3522
  %226 = sext i32 %225 to i64, !dbg !3522
  %227 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %226, !dbg !3522
  %228 = load i64* %227, align 8, !dbg !3522, !tbaa !3470
  %229 = or i64 %228, %224, !dbg !3522
  store i64 %229, i64* %227, align 8, !dbg !3522, !tbaa !3470
  br label %__get_file.exit3.thread.us, !dbg !3522

__get_file.exit3.thread.us:                       ; preds = %221, %209, %208, %161, %__get_file.exit3.us, %154, %.lr.ph.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1, !dbg !3524
  %lftr.wideiv = trunc i64 %indvars.iv.next.us to i32, !dbg !3524
  %exitcond = icmp eq i32 %lftr.wideiv, %nfds, !dbg !3524
  br i1 %exitcond, label %.loopexit, label %.lr.ph.us, !dbg !3524

.lr.ph:                                           ; preds = %__get_file.exit3.thread, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %__get_file.exit3.thread ], [ 0, %.lr.ph.preheader ]
  %230 = trunc i64 %indvars.iv to i32, !dbg !3511
  %231 = icmp ult i32 %230, 32, !dbg !3511
  br i1 %231, label %232, label %__get_file.exit3.thread, !dbg !3511

; <label>:232                                     ; preds = %.lr.ph
  %233 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !3513
  %234 = load i32* %233, align 4, !dbg !3513, !tbaa !2200
  %235 = and i32 %234, 1, !dbg !3513
  %236 = icmp eq i32 %235, 0, !dbg !3513
  br i1 %236, label %__get_file.exit3.thread, label %__get_file.exit3, !dbg !3513

__get_file.exit3:                                 ; preds = %232
  %237 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %indvars.iv, !dbg !3514
  %238 = icmp eq %struct.exe_file_t* %237, null, !dbg !3515
  br i1 %238, label %__get_file.exit3.thread, label %239, !dbg !3515

; <label>:239                                     ; preds = %__get_file.exit3
  %240 = getelementptr inbounds %struct.exe_sym_env_t* bitcast ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env to %struct.exe_sym_env_t*), i64 0, i32 0, i64 %indvars.iv, i32 3, !dbg !3515
  %241 = load %struct.exe_disk_file_t** %240, align 8, !dbg !3515, !tbaa !2219
  %242 = icmp eq %struct.exe_disk_file_t* %241, null, !dbg !3515
  br i1 %242, label %243, label %__get_file.exit3.thread, !dbg !3515

; <label>:243                                     ; preds = %239
  br i1 %15, label %244, label %265, !dbg !3520

; <label>:244                                     ; preds = %243
  %245 = getelementptr inbounds %struct.exe_file_t* %237, i64 0, i32 0, !dbg !3520
  %246 = load i32* %245, align 8, !dbg !3520, !tbaa !2269
  %int_cast_to_i6410 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !3520
  %247 = sdiv i32 %246, 64, !dbg !3520
  %248 = sext i32 %247 to i64, !dbg !3520
  %249 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %248, !dbg !3520
  %250 = load i64* %249, align 8, !dbg !3520, !tbaa !3470
  %251 = and i32 %246, 63, !dbg !3520
  %int_cast_to_i6424 = zext i32 %251 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6424), !dbg !3520
  %252 = shl i32 1, %251, !dbg !3520
  %253 = sext i32 %252 to i64, !dbg !3520
  %254 = and i64 %253, %250, !dbg !3520
  %255 = icmp eq i64 %254, 0, !dbg !3520
  br i1 %255, label %265, label %256, !dbg !3520

; <label>:256                                     ; preds = %244
  %257 = and i32 %230, 63, !dbg !3520
  %int_cast_to_i6425 = zext i32 %257 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6425), !dbg !3520
  %258 = shl i32 1, %257, !dbg !3520
  %259 = sext i32 %258 to i64, !dbg !3520
  %int_cast_to_i6411 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !3520
  %260 = sdiv i32 %230, 64, !dbg !3520
  %261 = sext i32 %260 to i64, !dbg !3520
  %262 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %261, !dbg !3520
  %263 = load i64* %262, align 8, !dbg !3520, !tbaa !3470
  %264 = or i64 %263, %259, !dbg !3520
  store i64 %264, i64* %262, align 8, !dbg !3520, !tbaa !3470
  br label %265, !dbg !3520

; <label>:265                                     ; preds = %256, %244, %243
  br i1 %23, label %266, label %__get_file.exit3.thread, !dbg !3522

; <label>:266                                     ; preds = %265
  %267 = getelementptr inbounds %struct.exe_file_t* %237, i64 0, i32 0, !dbg !3522
  %268 = load i32* %267, align 8, !dbg !3522, !tbaa !2269
  %int_cast_to_i6412 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i6412), !dbg !3522
  %269 = sdiv i32 %268, 64, !dbg !3522
  %270 = sext i32 %269 to i64, !dbg !3522
  %271 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %270, !dbg !3522
  %272 = load i64* %271, align 8, !dbg !3522, !tbaa !3470
  %273 = and i32 %268, 63, !dbg !3522
  %int_cast_to_i6426 = zext i32 %273 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6426), !dbg !3522
  %274 = shl i32 1, %273, !dbg !3522
  %275 = sext i32 %274 to i64, !dbg !3522
  %276 = and i64 %275, %272, !dbg !3522
  %277 = icmp eq i64 %276, 0, !dbg !3522
  br i1 %277, label %__get_file.exit3.thread, label %278, !dbg !3522

; <label>:278                                     ; preds = %266
  %279 = and i32 %230, 63, !dbg !3522
  %int_cast_to_i6427 = zext i32 %279 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i6427), !dbg !3522
  %280 = shl i32 1, %279, !dbg !3522
  %281 = sext i32 %280 to i64, !dbg !3522
  %int_cast_to_i6413 = zext i32 64 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i6413), !dbg !3522
  %282 = sdiv i32 %230, 64, !dbg !3522
  %283 = sext i32 %282 to i64, !dbg !3522
  %284 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %283, !dbg !3522
  %285 = load i64* %284, align 8, !dbg !3522, !tbaa !3470
  %286 = or i64 %285, %281, !dbg !3522
  store i64 %286, i64* %284, align 8, !dbg !3522, !tbaa !3470
  br label %__get_file.exit3.thread, !dbg !3522

__get_file.exit3.thread:                          ; preds = %278, %266, %265, %239, %__get_file.exit3, %232, %.lr.ph
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !3524
  %lftr.wideiv1 = trunc i64 %indvars.iv.next to i32, !dbg !3524
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %nfds, !dbg !3524
  br i1 %exitcond2, label %.loopexit, label %.lr.ph, !dbg !3524

.loopexit:                                        ; preds = %__get_file.exit3.thread, %__get_file.exit3.thread.us, %148, %146, %._crit_edge, %__get_file.exit.thread, %30
  %.0 = phi i32 [ -1, %__get_file.exit.thread ], [ -1, %148 ], [ %count.1, %146 ], [ %count.1, %._crit_edge ], [ 0, %30 ], [ %151, %__get_file.exit3.thread ], [ %151, %__get_file.exit3.thread.us ]
  ret i32 %.0, !dbg !3525
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #8

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #8

; Function Attrs: nounwind uwtable
define i8* @getcwd(i8* %buf, i64 %size) #3 {
  %1 = load i32* @getcwd.n_calls, align 4, !dbg !3526, !tbaa !2189
  %2 = add nsw i32 %1, 1, !dbg !3526
  store i32 %2, i32* @getcwd.n_calls, align 4, !dbg !3526, !tbaa !2189
  %3 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !3527, !tbaa !2456
  %4 = icmp eq i32 %3, 0, !dbg !3527
  br i1 %4, label %12, label %5, !dbg !3527

; <label>:5                                       ; preds = %0
  %6 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 8, !dbg !3527, !tbaa !3529
  %7 = load i32* %6, align 4, !dbg !3527, !tbaa !2189
  %8 = icmp eq i32 %7, %2, !dbg !3527
  br i1 %8, label %9, label %12, !dbg !3527

; <label>:9                                       ; preds = %5
  %10 = add i32 %3, -1, !dbg !3530
  store i32 %10, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !3530, !tbaa !2456
  %11 = tail call i32* @__errno_location() #4, !dbg !3532
  store i32 34, i32* %11, align 4, !dbg !3532, !tbaa !2189
  br label %32, !dbg !3533

; <label>:12                                      ; preds = %5, %0
  %13 = icmp eq i8* %buf, null, !dbg !3534
  br i1 %13, label %14, label %17, !dbg !3534

; <label>:14                                      ; preds = %12
  %15 = icmp eq i64 %size, 0, !dbg !3536
  %.size = select i1 %15, i64 1024, i64 %size, !dbg !3536
  %16 = tail call noalias i8* @malloc(i64 %.size) #8, !dbg !3539
  br label %17, !dbg !3540

; <label>:17                                      ; preds = %14, %12
  %.02 = phi i8* [ %buf, %12 ], [ %16, %14 ]
  %.1 = phi i64 [ %size, %12 ], [ %.size, %14 ]
  %18 = ptrtoint i8* %.02 to i64, !dbg !3541
  %19 = tail call i64 @klee_get_valuel(i64 %18) #8, !dbg !3541
  %20 = inttoptr i64 %19 to i8*, !dbg !3541
  %21 = icmp eq i8* %20, %.02, !dbg !3543
  %22 = zext i1 %21 to i64, !dbg !3543
  tail call void @klee_assume(i64 %22) #8, !dbg !3543
  %23 = tail call i64 @klee_get_valuel(i64 %.1) #8, !dbg !3544
  %24 = icmp eq i64 %23, %.1, !dbg !3546
  %25 = zext i1 %24 to i64, !dbg !3546
  tail call void @klee_assume(i64 %25) #8, !dbg !3546
  tail call void @klee_check_memory_access(i8* %20, i64 %23) #8, !dbg !3547
  %26 = tail call i64 (i64, ...)* @syscall(i64 79, i8* %20, i64 %23) #8, !dbg !3548
  %27 = trunc i64 %26 to i32, !dbg !3548
  %28 = icmp eq i32 %27, -1, !dbg !3549
  br i1 %28, label %29, label %32, !dbg !3549

; <label>:29                                      ; preds = %17
  %30 = tail call i32 @klee_get_errno() #8, !dbg !3551
  %31 = tail call i32* @__errno_location() #4, !dbg !3551
  store i32 %30, i32* %31, align 4, !dbg !3551, !tbaa !2189
  br label %32, !dbg !3553

; <label>:32                                      ; preds = %29, %17, %9
  %.0 = phi i8* [ null, %9 ], [ null, %29 ], [ %20, %17 ]
  ret i8* %.0, !dbg !3554
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #5

; Function Attrs: nounwind uwtable
define i32 @chroot(i8* nocapture readonly %path) #3 {
  %1 = load i8* %path, align 1, !dbg !3555, !tbaa !2142
  switch i8 %1, label %8 [
    i8 0, label %2
    i8 47, label %4
  ], !dbg !3555

; <label>:2                                       ; preds = %0
  %3 = tail call i32* @__errno_location() #4, !dbg !3557
  store i32 2, i32* %3, align 4, !dbg !3557, !tbaa !2189
  br label %10, !dbg !3559

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !3560
  %6 = load i8* %5, align 1, !dbg !3560, !tbaa !2142
  %7 = icmp eq i8 %6, 0, !dbg !3560
  br i1 %7, label %10, label %8, !dbg !3560

; <label>:8                                       ; preds = %4, %0
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str23, i64 0, i64 0)) #8, !dbg !3562
  %9 = tail call i32* @__errno_location() #4, !dbg !3563
  store i32 2, i32* %9, align 4, !dbg !3563, !tbaa !2189
  br label %10, !dbg !3564

; <label>:10                                      ; preds = %8, %4, %2
  %.0 = phi i32 [ -1, %2 ], [ -1, %8 ], [ 0, %4 ]
  ret i32 %.0, !dbg !3565
}

declare i64 @klee_get_valuel(i64) #6

declare void @klee_assume(i64) #6

; Function Attrs: nounwind
declare i32 @geteuid() #5

; Function Attrs: nounwind
declare i32 @getgid() #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #4

; Function Attrs: nounwind uwtable
define i32 @open(i8* %pathname, i32 %flags, ...) #3 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %1 = and i32 %flags, 64, !dbg !3566
  %2 = icmp eq i32 %1, 0, !dbg !3566
  br i1 %2, label %21, label %3, !dbg !3566

; <label>:3                                       ; preds = %0
  %4 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !3567
  call void @llvm.va_start(i8* %4), !dbg !3567
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !3568
  %6 = load i32* %5, align 16, !dbg !3568
  %7 = icmp ult i32 %6, 41, !dbg !3568
  br i1 %7, label %8, label %14, !dbg !3568

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !3568
  %10 = load i8** %9, align 16, !dbg !3568
  %11 = sext i32 %6 to i64, !dbg !3568
  %12 = getelementptr i8* %10, i64 %11, !dbg !3568
  %13 = add i32 %6, 8, !dbg !3568
  store i32 %13, i32* %5, align 16, !dbg !3568
  br label %18, !dbg !3568

; <label>:14                                      ; preds = %3
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !3568
  %16 = load i8** %15, align 8, !dbg !3568
  %17 = getelementptr i8* %16, i64 8, !dbg !3568
  store i8* %17, i8** %15, align 8, !dbg !3568
  br label %18, !dbg !3568

; <label>:18                                      ; preds = %14, %8
  %.in = phi i8* [ %12, %8 ], [ %16, %14 ]
  %19 = bitcast i8* %.in to i32*, !dbg !3568
  %20 = load i32* %19, align 4, !dbg !3568
  call void @llvm.va_end(i8* %4), !dbg !3569
  br label %21, !dbg !3570

; <label>:21                                      ; preds = %18, %0
  %mode.0 = phi i32 [ %20, %18 ], [ 0, %0 ]
  %22 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) #8, !dbg !3571
  ret i32 %22, !dbg !3571
}

; Function Attrs: nounwind uwtable
define i32 @openat(i32 %fd, i8* %pathname, i32 %flags, ...) #3 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %1 = and i32 %flags, 64, !dbg !3572
  %2 = icmp eq i32 %1, 0, !dbg !3572
  br i1 %2, label %21, label %3, !dbg !3572

; <label>:3                                       ; preds = %0
  %4 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !3573
  call void @llvm.va_start(i8* %4), !dbg !3573
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !3574
  %6 = load i32* %5, align 16, !dbg !3574
  %7 = icmp ult i32 %6, 41, !dbg !3574
  br i1 %7, label %8, label %14, !dbg !3574

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !3574
  %10 = load i8** %9, align 16, !dbg !3574
  %11 = sext i32 %6 to i64, !dbg !3574
  %12 = getelementptr i8* %10, i64 %11, !dbg !3574
  %13 = add i32 %6, 8, !dbg !3574
  store i32 %13, i32* %5, align 16, !dbg !3574
  br label %18, !dbg !3574

; <label>:14                                      ; preds = %3
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !3574
  %16 = load i8** %15, align 8, !dbg !3574
  %17 = getelementptr i8* %16, i64 8, !dbg !3574
  store i8* %17, i8** %15, align 8, !dbg !3574
  br label %18, !dbg !3574

; <label>:18                                      ; preds = %14, %8
  %.in = phi i8* [ %12, %8 ], [ %16, %14 ]
  %19 = bitcast i8* %.in to i32*, !dbg !3574
  %20 = load i32* %19, align 4, !dbg !3574
  call void @llvm.va_end(i8* %4), !dbg !3575
  br label %21, !dbg !3576

; <label>:21                                      ; preds = %18, %0
  %mode.0 = phi i32 [ %20, %18 ], [ 0, %0 ]
  %22 = call i32 @__fd_openat(i32 %fd, i8* %pathname, i32 %flags, i32 %mode.0) #8, !dbg !3577
  ret i32 %22, !dbg !3577
}

; Function Attrs: nounwind uwtable
define i64 @lseek(i32 %fd, i64 %off, i32 %whence) #3 {
  %1 = tail call i64 @__fd_lseek(i32 %fd, i64 %off, i32 %whence) #8, !dbg !3578
  ret i64 %1, !dbg !3578
}

; Function Attrs: nounwind uwtable
define i32 @__xstat(i32 %vers, i8* %path, %struct.stat* nocapture %buf) #3 {
  %tmp = alloca %struct.stat64, align 16
  %1 = bitcast %struct.stat64* %tmp to i8*, !dbg !3579
  %2 = call i32 @__fd_stat(i8* %path, %struct.stat64* %tmp) #8, !dbg !3580
  %3 = bitcast %struct.stat64* %tmp to <2 x i64>*, !dbg !3581
  %4 = load <2 x i64>* %3, align 16, !dbg !3581, !tbaa !3470
  %5 = bitcast %struct.stat* %buf to <2 x i64>*, !dbg !3581
  store <2 x i64> %4, <2 x i64>* %5, align 8, !dbg !3581, !tbaa !3470
  %6 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 3, !dbg !3583
  %7 = bitcast i32* %6 to i64*, !dbg !3583
  %8 = load i64* %7, align 8, !dbg !3583
  %9 = trunc i64 %8 to i32, !dbg !3583
  %10 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !3583
  store i32 %9, i32* %10, align 4, !dbg !3583, !tbaa !3093
  %11 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 2, !dbg !3584
  %12 = load i64* %11, align 16, !dbg !3584, !tbaa !3585
  %13 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !3584
  store i64 %12, i64* %13, align 8, !dbg !3584, !tbaa !3586
  %int_cast_to_i64 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i64)
  %14 = lshr i64 %8, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !3587
  store i32 %15, i32* %16, align 4, !dbg !3587, !tbaa !3588
  %17 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 5, !dbg !3589
  %18 = load i32* %17, align 16, !dbg !3589, !tbaa !2828
  %19 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !3589
  store i32 %18, i32* %19, align 4, !dbg !3589, !tbaa !3590
  %20 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 7, !dbg !3591
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !3591
  %22 = bitcast i64* %20 to <2 x i64>*, !dbg !3591
  %23 = load <2 x i64>* %22, align 8, !dbg !3591, !tbaa !3470
  %24 = bitcast i64* %21 to <2 x i64>*, !dbg !3591
  store <2 x i64> %23, <2 x i64>* %24, align 8, !dbg !3591, !tbaa !3470
  %25 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 0, !dbg !3592
  %26 = load i64* %25, align 8, !dbg !3592, !tbaa !2371
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !3592
  store i64 %26, i64* %27, align 8, !dbg !3592, !tbaa !3593
  %28 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 0, !dbg !3594
  %29 = load i64* %28, align 8, !dbg !3594, !tbaa !2373
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !3594
  store i64 %29, i64* %30, align 8, !dbg !3594, !tbaa !3595
  %31 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 0, !dbg !3596
  %32 = load i64* %31, align 8, !dbg !3596, !tbaa !3597
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !3596
  store i64 %32, i64* %33, align 8, !dbg !3596, !tbaa !3598
  %34 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 9, !dbg !3599
  %35 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !3599
  %36 = bitcast i64* %34 to <2 x i64>*, !dbg !3599
  %37 = load <2 x i64>* %36, align 8, !dbg !3599, !tbaa !3470
  %38 = bitcast i64* %35 to <2 x i64>*, !dbg !3599
  store <2 x i64> %37, <2 x i64>* %38, align 8, !dbg !3599, !tbaa !3470
  ret i32 %2, !dbg !3600
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @stat(i8* %path, %struct.stat* nocapture %buf) #9 {
  %tmp = alloca %struct.stat64, align 16
  %1 = bitcast %struct.stat64* %tmp to i8*, !dbg !3601
  %2 = call i32 @__fd_stat(i8* %path, %struct.stat64* %tmp) #8, !dbg !3602
  %3 = bitcast %struct.stat64* %tmp to <2 x i64>*, !dbg !3603
  %4 = load <2 x i64>* %3, align 16, !dbg !3603, !tbaa !3470
  %5 = bitcast %struct.stat* %buf to <2 x i64>*, !dbg !3603
  store <2 x i64> %4, <2 x i64>* %5, align 8, !dbg !3603, !tbaa !3470
  %6 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 3, !dbg !3605
  %7 = bitcast i32* %6 to i64*, !dbg !3605
  %8 = load i64* %7, align 8, !dbg !3605
  %9 = trunc i64 %8 to i32, !dbg !3605
  %10 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !3605
  store i32 %9, i32* %10, align 4, !dbg !3605, !tbaa !3093
  %11 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 2, !dbg !3606
  %12 = load i64* %11, align 16, !dbg !3606, !tbaa !3585
  %13 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !3606
  store i64 %12, i64* %13, align 8, !dbg !3606, !tbaa !3586
  %int_cast_to_i64 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i64)
  %14 = lshr i64 %8, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !3607
  store i32 %15, i32* %16, align 4, !dbg !3607, !tbaa !3588
  %17 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 5, !dbg !3608
  %18 = load i32* %17, align 16, !dbg !3608, !tbaa !2828
  %19 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !3608
  store i32 %18, i32* %19, align 4, !dbg !3608, !tbaa !3590
  %20 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 7, !dbg !3609
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !3609
  %22 = bitcast i64* %20 to <2 x i64>*, !dbg !3609
  %23 = load <2 x i64>* %22, align 8, !dbg !3609, !tbaa !3470
  %24 = bitcast i64* %21 to <2 x i64>*, !dbg !3609
  store <2 x i64> %23, <2 x i64>* %24, align 8, !dbg !3609, !tbaa !3470
  %25 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 0, !dbg !3610
  %26 = load i64* %25, align 8, !dbg !3610, !tbaa !2371
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !3610
  store i64 %26, i64* %27, align 8, !dbg !3610, !tbaa !3593
  %28 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 0, !dbg !3611
  %29 = load i64* %28, align 8, !dbg !3611, !tbaa !2373
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !3611
  store i64 %29, i64* %30, align 8, !dbg !3611, !tbaa !3595
  %31 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 0, !dbg !3612
  %32 = load i64* %31, align 8, !dbg !3612, !tbaa !3597
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !3612
  store i64 %32, i64* %33, align 8, !dbg !3612, !tbaa !3598
  %34 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 9, !dbg !3613
  %35 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !3613
  %36 = bitcast i64* %34 to <2 x i64>*, !dbg !3613
  %37 = load <2 x i64>* %36, align 8, !dbg !3613, !tbaa !3470
  %38 = bitcast i64* %35 to <2 x i64>*, !dbg !3613
  store <2 x i64> %37, <2 x i64>* %38, align 8, !dbg !3613, !tbaa !3470
  ret i32 %2, !dbg !3614
}

; Function Attrs: nounwind uwtable
define i32 @__lxstat(i32 %vers, i8* %path, %struct.stat* nocapture %buf) #3 {
  %tmp = alloca %struct.stat64, align 16
  %1 = bitcast %struct.stat64* %tmp to i8*, !dbg !3615
  %2 = call i32 @__fd_lstat(i8* %path, %struct.stat64* %tmp) #8, !dbg !3616
  %3 = bitcast %struct.stat64* %tmp to <2 x i64>*, !dbg !3617
  %4 = load <2 x i64>* %3, align 16, !dbg !3617, !tbaa !3470
  %5 = bitcast %struct.stat* %buf to <2 x i64>*, !dbg !3617
  store <2 x i64> %4, <2 x i64>* %5, align 8, !dbg !3617, !tbaa !3470
  %6 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 3, !dbg !3619
  %7 = bitcast i32* %6 to i64*, !dbg !3619
  %8 = load i64* %7, align 8, !dbg !3619
  %9 = trunc i64 %8 to i32, !dbg !3619
  %10 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !3619
  store i32 %9, i32* %10, align 4, !dbg !3619, !tbaa !3093
  %11 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 2, !dbg !3620
  %12 = load i64* %11, align 16, !dbg !3620, !tbaa !3585
  %13 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !3620
  store i64 %12, i64* %13, align 8, !dbg !3620, !tbaa !3586
  %int_cast_to_i64 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i64)
  %14 = lshr i64 %8, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !3621
  store i32 %15, i32* %16, align 4, !dbg !3621, !tbaa !3588
  %17 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 5, !dbg !3622
  %18 = load i32* %17, align 16, !dbg !3622, !tbaa !2828
  %19 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !3622
  store i32 %18, i32* %19, align 4, !dbg !3622, !tbaa !3590
  %20 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 7, !dbg !3623
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !3623
  %22 = bitcast i64* %20 to <2 x i64>*, !dbg !3623
  %23 = load <2 x i64>* %22, align 8, !dbg !3623, !tbaa !3470
  %24 = bitcast i64* %21 to <2 x i64>*, !dbg !3623
  store <2 x i64> %23, <2 x i64>* %24, align 8, !dbg !3623, !tbaa !3470
  %25 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 0, !dbg !3624
  %26 = load i64* %25, align 8, !dbg !3624, !tbaa !2371
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !3624
  store i64 %26, i64* %27, align 8, !dbg !3624, !tbaa !3593
  %28 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 0, !dbg !3625
  %29 = load i64* %28, align 8, !dbg !3625, !tbaa !2373
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !3625
  store i64 %29, i64* %30, align 8, !dbg !3625, !tbaa !3595
  %31 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 0, !dbg !3626
  %32 = load i64* %31, align 8, !dbg !3626, !tbaa !3597
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !3626
  store i64 %32, i64* %33, align 8, !dbg !3626, !tbaa !3598
  %34 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 9, !dbg !3627
  %35 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !3627
  %36 = bitcast i64* %34 to <2 x i64>*, !dbg !3627
  %37 = load <2 x i64>* %36, align 8, !dbg !3627, !tbaa !3470
  %38 = bitcast i64* %35 to <2 x i64>*, !dbg !3627
  store <2 x i64> %37, <2 x i64>* %38, align 8, !dbg !3627, !tbaa !3470
  ret i32 %2, !dbg !3628
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @lstat(i8* %path, %struct.stat* nocapture %buf) #9 {
  %tmp = alloca %struct.stat64, align 16
  %1 = bitcast %struct.stat64* %tmp to i8*, !dbg !3629
  %2 = call i32 @__fd_lstat(i8* %path, %struct.stat64* %tmp) #8, !dbg !3630
  %3 = bitcast %struct.stat64* %tmp to <2 x i64>*, !dbg !3631
  %4 = load <2 x i64>* %3, align 16, !dbg !3631, !tbaa !3470
  %5 = bitcast %struct.stat* %buf to <2 x i64>*, !dbg !3631
  store <2 x i64> %4, <2 x i64>* %5, align 8, !dbg !3631, !tbaa !3470
  %6 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 3, !dbg !3633
  %7 = bitcast i32* %6 to i64*, !dbg !3633
  %8 = load i64* %7, align 8, !dbg !3633
  %9 = trunc i64 %8 to i32, !dbg !3633
  %10 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !3633
  store i32 %9, i32* %10, align 4, !dbg !3633, !tbaa !3093
  %11 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 2, !dbg !3634
  %12 = load i64* %11, align 16, !dbg !3634, !tbaa !3585
  %13 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !3634
  store i64 %12, i64* %13, align 8, !dbg !3634, !tbaa !3586
  %int_cast_to_i64 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i64)
  %14 = lshr i64 %8, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !3635
  store i32 %15, i32* %16, align 4, !dbg !3635, !tbaa !3588
  %17 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 5, !dbg !3636
  %18 = load i32* %17, align 16, !dbg !3636, !tbaa !2828
  %19 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !3636
  store i32 %18, i32* %19, align 4, !dbg !3636, !tbaa !3590
  %20 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 7, !dbg !3637
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !3637
  %22 = bitcast i64* %20 to <2 x i64>*, !dbg !3637
  %23 = load <2 x i64>* %22, align 8, !dbg !3637, !tbaa !3470
  %24 = bitcast i64* %21 to <2 x i64>*, !dbg !3637
  store <2 x i64> %23, <2 x i64>* %24, align 8, !dbg !3637, !tbaa !3470
  %25 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 0, !dbg !3638
  %26 = load i64* %25, align 8, !dbg !3638, !tbaa !2371
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !3638
  store i64 %26, i64* %27, align 8, !dbg !3638, !tbaa !3593
  %28 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 0, !dbg !3639
  %29 = load i64* %28, align 8, !dbg !3639, !tbaa !2373
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !3639
  store i64 %29, i64* %30, align 8, !dbg !3639, !tbaa !3595
  %31 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 0, !dbg !3640
  %32 = load i64* %31, align 8, !dbg !3640, !tbaa !3597
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !3640
  store i64 %32, i64* %33, align 8, !dbg !3640, !tbaa !3598
  %34 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 9, !dbg !3641
  %35 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !3641
  %36 = bitcast i64* %34 to <2 x i64>*, !dbg !3641
  %37 = load <2 x i64>* %36, align 8, !dbg !3641, !tbaa !3470
  %38 = bitcast i64* %35 to <2 x i64>*, !dbg !3641
  store <2 x i64> %37, <2 x i64>* %38, align 8, !dbg !3641, !tbaa !3470
  ret i32 %2, !dbg !3642
}

; Function Attrs: nounwind uwtable
define i32 @__fxstat(i32 %vers, i32 %fd, %struct.stat* nocapture %buf) #3 {
  %tmp = alloca %struct.stat64, align 16
  %1 = bitcast %struct.stat64* %tmp to i8*, !dbg !3643
  %2 = call i32 @__fd_fstat(i32 %fd, %struct.stat64* %tmp) #8, !dbg !3644
  %3 = bitcast %struct.stat64* %tmp to <2 x i64>*, !dbg !3645
  %4 = load <2 x i64>* %3, align 16, !dbg !3645, !tbaa !3470
  %5 = bitcast %struct.stat* %buf to <2 x i64>*, !dbg !3645
  store <2 x i64> %4, <2 x i64>* %5, align 8, !dbg !3645, !tbaa !3470
  %6 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 3, !dbg !3647
  %7 = bitcast i32* %6 to i64*, !dbg !3647
  %8 = load i64* %7, align 8, !dbg !3647
  %9 = trunc i64 %8 to i32, !dbg !3647
  %10 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !3647
  store i32 %9, i32* %10, align 4, !dbg !3647, !tbaa !3093
  %11 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 2, !dbg !3648
  %12 = load i64* %11, align 16, !dbg !3648, !tbaa !3585
  %13 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !3648
  store i64 %12, i64* %13, align 8, !dbg !3648, !tbaa !3586
  %int_cast_to_i64 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i64)
  %14 = lshr i64 %8, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !3649
  store i32 %15, i32* %16, align 4, !dbg !3649, !tbaa !3588
  %17 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 5, !dbg !3650
  %18 = load i32* %17, align 16, !dbg !3650, !tbaa !2828
  %19 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !3650
  store i32 %18, i32* %19, align 4, !dbg !3650, !tbaa !3590
  %20 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 7, !dbg !3651
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !3651
  %22 = bitcast i64* %20 to <2 x i64>*, !dbg !3651
  %23 = load <2 x i64>* %22, align 8, !dbg !3651, !tbaa !3470
  %24 = bitcast i64* %21 to <2 x i64>*, !dbg !3651
  store <2 x i64> %23, <2 x i64>* %24, align 8, !dbg !3651, !tbaa !3470
  %25 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 0, !dbg !3652
  %26 = load i64* %25, align 8, !dbg !3652, !tbaa !2371
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !3652
  store i64 %26, i64* %27, align 8, !dbg !3652, !tbaa !3593
  %28 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 0, !dbg !3653
  %29 = load i64* %28, align 8, !dbg !3653, !tbaa !2373
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !3653
  store i64 %29, i64* %30, align 8, !dbg !3653, !tbaa !3595
  %31 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 0, !dbg !3654
  %32 = load i64* %31, align 8, !dbg !3654, !tbaa !3597
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !3654
  store i64 %32, i64* %33, align 8, !dbg !3654, !tbaa !3598
  %34 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 9, !dbg !3655
  %35 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !3655
  %36 = bitcast i64* %34 to <2 x i64>*, !dbg !3655
  %37 = load <2 x i64>* %36, align 8, !dbg !3655, !tbaa !3470
  %38 = bitcast i64* %35 to <2 x i64>*, !dbg !3655
  store <2 x i64> %37, <2 x i64>* %38, align 8, !dbg !3655, !tbaa !3470
  ret i32 %2, !dbg !3656
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @fstat(i32 %fd, %struct.stat* nocapture %buf) #9 {
  %tmp = alloca %struct.stat64, align 16
  %1 = bitcast %struct.stat64* %tmp to i8*, !dbg !3657
  %2 = call i32 @__fd_fstat(i32 %fd, %struct.stat64* %tmp) #8, !dbg !3658
  %3 = bitcast %struct.stat64* %tmp to <2 x i64>*, !dbg !3659
  %4 = load <2 x i64>* %3, align 16, !dbg !3659, !tbaa !3470
  %5 = bitcast %struct.stat* %buf to <2 x i64>*, !dbg !3659
  store <2 x i64> %4, <2 x i64>* %5, align 8, !dbg !3659, !tbaa !3470
  %6 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 3, !dbg !3661
  %7 = bitcast i32* %6 to i64*, !dbg !3661
  %8 = load i64* %7, align 8, !dbg !3661
  %9 = trunc i64 %8 to i32, !dbg !3661
  %10 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 3, !dbg !3661
  store i32 %9, i32* %10, align 4, !dbg !3661, !tbaa !3093
  %11 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 2, !dbg !3662
  %12 = load i64* %11, align 16, !dbg !3662, !tbaa !3585
  %13 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 2, !dbg !3662
  store i64 %12, i64* %13, align 8, !dbg !3662, !tbaa !3586
  %int_cast_to_i64 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i64)
  %14 = lshr i64 %8, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 4, !dbg !3663
  store i32 %15, i32* %16, align 4, !dbg !3663, !tbaa !3588
  %17 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 5, !dbg !3664
  %18 = load i32* %17, align 16, !dbg !3664, !tbaa !2828
  %19 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 5, !dbg !3664
  store i32 %18, i32* %19, align 4, !dbg !3664, !tbaa !3590
  %20 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 7, !dbg !3665
  %21 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 7, !dbg !3665
  %22 = bitcast i64* %20 to <2 x i64>*, !dbg !3665
  %23 = load <2 x i64>* %22, align 8, !dbg !3665, !tbaa !3470
  %24 = bitcast i64* %21 to <2 x i64>*, !dbg !3665
  store <2 x i64> %23, <2 x i64>* %24, align 8, !dbg !3665, !tbaa !3470
  %25 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 11, i32 0, !dbg !3666
  %26 = load i64* %25, align 8, !dbg !3666, !tbaa !2371
  %27 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 11, i32 0, !dbg !3666
  store i64 %26, i64* %27, align 8, !dbg !3666, !tbaa !3593
  %28 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 12, i32 0, !dbg !3667
  %29 = load i64* %28, align 8, !dbg !3667, !tbaa !2373
  %30 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 12, i32 0, !dbg !3667
  store i64 %29, i64* %30, align 8, !dbg !3667, !tbaa !3595
  %31 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 13, i32 0, !dbg !3668
  %32 = load i64* %31, align 8, !dbg !3668, !tbaa !3597
  %33 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 13, i32 0, !dbg !3668
  store i64 %32, i64* %33, align 8, !dbg !3668, !tbaa !3598
  %34 = getelementptr inbounds %struct.stat64* %tmp, i64 0, i32 9, !dbg !3669
  %35 = getelementptr inbounds %struct.stat* %buf, i64 0, i32 9, !dbg !3669
  %36 = bitcast i64* %34 to <2 x i64>*, !dbg !3669
  %37 = load <2 x i64>* %36, align 8, !dbg !3669, !tbaa !3470
  %38 = bitcast i64* %35 to <2 x i64>*, !dbg !3669
  store <2 x i64> %37, <2 x i64>* %38, align 8, !dbg !3669, !tbaa !3470
  ret i32 %2, !dbg !3670
}

; Function Attrs: nounwind uwtable
define i32 @ftruncate(i32 %fd, i64 %length) #3 {
  %1 = tail call i32 @__fd_ftruncate(i32 %fd, i64 %length) #8, !dbg !3671
  ret i32 %1, !dbg !3671
}

; Function Attrs: nounwind uwtable
define i32 @statfs(i8* %path, %struct.statfs* %buf32) #3 {
  %1 = tail call i32 @__fd_statfs(i8* %path, %struct.statfs* %buf32) #8, !dbg !3672
  ret i32 %1, !dbg !3672
}

; Function Attrs: nounwind uwtable
define i64 @getdents(i32 %fd, %struct.dirent* %dirp, i64 %nbytes) #3 {
  %1 = bitcast %struct.dirent* %dirp to %struct.dirent64*, !dbg !3673
  %2 = trunc i64 %nbytes to i32, !dbg !3674
  %3 = tail call i32 @__fd_getdents(i32 %fd, %struct.dirent64* %1, i32 %2) #8, !dbg !3674
  %4 = sext i32 %3 to i64, !dbg !3674
  %5 = icmp sgt i32 %3, 0, !dbg !3675
  br i1 %5, label %6, label %.loopexit, !dbg !3675

; <label>:6                                       ; preds = %0
  %7 = bitcast %struct.dirent* %dirp to i8*, !dbg !3676
  %8 = getelementptr inbounds i8* %7, i64 %4, !dbg !3676
  %9 = bitcast i8* %8 to %struct.dirent*, !dbg !3677
  %10 = icmp ugt %struct.dirent* %9, %dirp, !dbg !3677
  br i1 %10, label %.lr.ph, label %.loopexit, !dbg !3677

.lr.ph:                                           ; preds = %.lr.ph, %6
  %dp64.01 = phi %struct.dirent64* [ %16, %.lr.ph ], [ %1, %6 ]
  %11 = getelementptr inbounds %struct.dirent64* %dp64.01, i64 0, i32 2, !dbg !3678
  %12 = bitcast %struct.dirent64* %dp64.01 to i8*, !dbg !3679
  %13 = load i16* %11, align 2, !dbg !3679, !tbaa !3680
  %14 = zext i16 %13 to i64, !dbg !3679
  %15 = getelementptr inbounds i8* %12, i64 %14, !dbg !3679
  %16 = bitcast i8* %15 to %struct.dirent64*, !dbg !3679
  %17 = icmp ult i8* %15, %8, !dbg !3677
  br i1 %17, label %.lr.ph, label %.loopexit, !dbg !3677

.loopexit:                                        ; preds = %.lr.ph, %6, %0
  ret i64 %4, !dbg !3682
}

; Function Attrs: nounwind uwtable
define i32 @open64(i8* %pathname, i32 %flags, ...) #3 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %1 = and i32 %flags, 64, !dbg !3683
  %2 = icmp eq i32 %1, 0, !dbg !3683
  br i1 %2, label %21, label %3, !dbg !3683

; <label>:3                                       ; preds = %0
  %4 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !3684
  call void @llvm.va_start(i8* %4), !dbg !3684
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !3685
  %6 = load i32* %5, align 16, !dbg !3685
  %7 = icmp ult i32 %6, 41, !dbg !3685
  br i1 %7, label %8, label %14, !dbg !3685

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !3685
  %10 = load i8** %9, align 16, !dbg !3685
  %11 = sext i32 %6 to i64, !dbg !3685
  %12 = getelementptr i8* %10, i64 %11, !dbg !3685
  %13 = add i32 %6, 8, !dbg !3685
  store i32 %13, i32* %5, align 16, !dbg !3685
  br label %18, !dbg !3685

; <label>:14                                      ; preds = %3
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !3685
  %16 = load i8** %15, align 8, !dbg !3685
  %17 = getelementptr i8* %16, i64 8, !dbg !3685
  store i8* %17, i8** %15, align 8, !dbg !3685
  br label %18, !dbg !3685

; <label>:18                                      ; preds = %14, %8
  %.in = phi i8* [ %12, %8 ], [ %16, %14 ]
  %19 = bitcast i8* %.in to i32*, !dbg !3685
  %20 = load i32* %19, align 4, !dbg !3685
  call void @llvm.va_end(i8* %4), !dbg !3686
  br label %21, !dbg !3687

; <label>:21                                      ; preds = %18, %0
  %mode.0 = phi i32 [ %20, %18 ], [ 0, %0 ]
  %22 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) #8, !dbg !3688
  ret i32 %22, !dbg !3688
}

; Function Attrs: nounwind uwtable
define i32 @openat64(i32 %fd, i8* %pathname, i32 %flags, ...) #3 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %1 = and i32 %flags, 64, !dbg !3689
  %2 = icmp eq i32 %1, 0, !dbg !3689
  br i1 %2, label %21, label %3, !dbg !3689

; <label>:3                                       ; preds = %0
  %4 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !3690
  call void @llvm.va_start(i8* %4), !dbg !3690
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !3691
  %6 = load i32* %5, align 16, !dbg !3691
  %7 = icmp ult i32 %6, 41, !dbg !3691
  br i1 %7, label %8, label %14, !dbg !3691

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !3691
  %10 = load i8** %9, align 16, !dbg !3691
  %11 = sext i32 %6 to i64, !dbg !3691
  %12 = getelementptr i8* %10, i64 %11, !dbg !3691
  %13 = add i32 %6, 8, !dbg !3691
  store i32 %13, i32* %5, align 16, !dbg !3691
  br label %18, !dbg !3691

; <label>:14                                      ; preds = %3
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !3691
  %16 = load i8** %15, align 8, !dbg !3691
  %17 = getelementptr i8* %16, i64 8, !dbg !3691
  store i8* %17, i8** %15, align 8, !dbg !3691
  br label %18, !dbg !3691

; <label>:18                                      ; preds = %14, %8
  %.in = phi i8* [ %12, %8 ], [ %16, %14 ]
  %19 = bitcast i8* %.in to i32*, !dbg !3691
  %20 = load i32* %19, align 4, !dbg !3691
  call void @llvm.va_end(i8* %4), !dbg !3692
  br label %21, !dbg !3693

; <label>:21                                      ; preds = %18, %0
  %mode.0 = phi i32 [ %20, %18 ], [ 0, %0 ]
  %22 = call i32 @__fd_openat(i32 %fd, i8* %pathname, i32 %flags, i32 %mode.0) #8, !dbg !3694
  ret i32 %22, !dbg !3694
}

; Function Attrs: nounwind uwtable
define i64 @lseek64(i32 %fd, i64 %offset, i32 %whence) #3 {
  %1 = tail call i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) #8, !dbg !3695
  ret i64 %1, !dbg !3695
}

; Function Attrs: nounwind uwtable
define i32 @__xstat64(i32 %vers, i8* %path, %struct.stat* %buf) #3 {
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !3696
  %2 = tail call i32 @__fd_stat(i8* %path, %struct.stat64* %1) #8, !dbg !3696
  ret i32 %2, !dbg !3696
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @stat64(i8* %path, %struct.stat* %buf) #9 {
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !3697
  %2 = tail call i32 @__fd_stat(i8* %path, %struct.stat64* %1) #8, !dbg !3697
  ret i32 %2, !dbg !3697
}

; Function Attrs: nounwind uwtable
define i32 @__lxstat64(i32 %vers, i8* %path, %struct.stat* %buf) #3 {
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !3698
  %2 = tail call i32 @__fd_lstat(i8* %path, %struct.stat64* %1) #8, !dbg !3698
  ret i32 %2, !dbg !3698
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @lstat64(i8* %path, %struct.stat* %buf) #9 {
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !3699
  %2 = tail call i32 @__fd_lstat(i8* %path, %struct.stat64* %1) #8, !dbg !3699
  ret i32 %2, !dbg !3699
}

; Function Attrs: nounwind uwtable
define i32 @__fxstat64(i32 %vers, i32 %fd, %struct.stat* %buf) #3 {
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !3700
  %2 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat64* %1) #8, !dbg !3700
  ret i32 %2, !dbg !3700
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @fstat64(i32 %fd, %struct.stat* %buf) #9 {
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !3701
  %2 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat64* %1) #8, !dbg !3701
  ret i32 %2, !dbg !3701
}

; Function Attrs: nounwind uwtable
define i32 @ftruncate64(i32 %fd, i64 %length) #3 {
  %1 = tail call i32 @__fd_ftruncate(i32 %fd, i64 %length) #8, !dbg !3702
  ret i32 %1, !dbg !3702
}

; Function Attrs: nounwind uwtable
define weak i32 @statfs64(i8* %path, %struct.statfs* %buf) #3 {
  %1 = tail call i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) #8, !dbg !3703
  ret i32 %1, !dbg !3703
}

; Function Attrs: nounwind uwtable
define i32 @getdents64(i32 %fd, %struct.dirent* %dirp, i32 %count) #3 {
  %1 = bitcast %struct.dirent* %dirp to %struct.dirent64*, !dbg !3704
  %2 = tail call i32 @__fd_getdents(i32 %fd, %struct.dirent64* %1, i32 %count) #8, !dbg !3704
  ret i32 %2, !dbg !3704
}

; Function Attrs: nounwind uwtable
define void @klee_init_fds(i32 %n_files, i32 %file_length, i32 %stdin_length, i32 %sym_stdout_flag, i32 %save_all_writes_flag, i32 %max_failures) #3 {
  %x.i = alloca i32, align 4
  %name = alloca [7 x i8], align 1
  %s = alloca %struct.stat64, align 8
  %1 = getelementptr inbounds [7 x i8]* %name, i64 0, i64 0, !dbg !3705
  %2 = call i8* @memcpy(i8* %1, i8* getelementptr inbounds ([7 x i8]* @klee_init_fds.name, i64 0, i64 0), i64 7)
  %3 = bitcast %struct.stat64* %s to i8*, !dbg !3706
  %4 = call i32 bitcast (i32 (i32, i8*, %struct.stat*)* @__xstat64 to i32 (i32, i8*, %struct.stat64*)*)(i32 1, i8* getelementptr inbounds ([2 x i8]* @.str25, i64 0, i64 0), %struct.stat64* %s) #8, !dbg !3707
  store i32 %n_files, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !3710, !tbaa !2148
  %5 = zext i32 %n_files to i64, !dbg !3711
  %6 = mul i64 %5, 24, !dbg !3711
  %7 = call noalias i8* @malloc(i64 %6) #8, !dbg !3711
  %8 = bitcast i8* %7 to %struct.exe_disk_file_t*, !dbg !3711
  store %struct.exe_disk_file_t* %8, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !3711, !tbaa !2154
  %9 = icmp eq i32 %n_files, 0, !dbg !3712
  br i1 %9, label %._crit_edge, label %.lr.ph.preheader, !dbg !3712

.lr.ph.preheader:                                 ; preds = %0
  store i8 65, i8* %1, align 1, !dbg !3714, !tbaa !2142
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %8, i32 %file_length, i8* %1, %struct.stat64* %s), !dbg !3716
  %exitcond1 = icmp eq i32 %n_files, 1, !dbg !3712
  br i1 %exitcond1, label %._crit_edge, label %._crit_edge2, !dbg !3712

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph.preheader
  %indvars.iv.next2 = phi i64 [ %indvars.iv.next, %._crit_edge2 ], [ 1, %.lr.ph.preheader ]
  %.pre = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !3716, !tbaa !2154
  %10 = trunc i64 %indvars.iv.next2 to i8, !dbg !3714
  %11 = add i8 %10, 65, !dbg !3714
  store i8 %11, i8* %1, align 1, !dbg !3714, !tbaa !2142
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %.pre, i64 %indvars.iv.next2, !dbg !3716
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %12, i32 %file_length, i8* %1, %struct.stat64* %s), !dbg !3716
  %indvars.iv.next = add nuw nsw i64 %indvars.iv.next2, 1, !dbg !3712
  %lftr.wideiv3 = trunc i64 %indvars.iv.next to i32, !dbg !3712
  %exitcond4 = icmp eq i32 %lftr.wideiv3, %n_files, !dbg !3712
  br i1 %exitcond4, label %._crit_edge, label %._crit_edge2, !dbg !3712

._crit_edge:                                      ; preds = %._crit_edge2, %.lr.ph.preheader, %0
  %13 = icmp eq i32 %stdin_length, 0, !dbg !3717
  br i1 %13, label %18, label %14, !dbg !3717

; <label>:14                                      ; preds = %._crit_edge
  %15 = call noalias i8* @malloc(i64 24) #8, !dbg !3719
  %16 = bitcast i8* %15 to %struct.exe_disk_file_t*, !dbg !3719
  store %struct.exe_disk_file_t* %16, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 1), align 8, !dbg !3719, !tbaa !3721
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %16, i32 %stdin_length, i8* getelementptr inbounds ([6 x i8]* @.str110, i64 0, i64 0), %struct.stat64* %s), !dbg !3722
  %17 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 1), align 8, !dbg !3723, !tbaa !3721
  store %struct.exe_disk_file_t* %17, %struct.exe_disk_file_t** getelementptr inbounds ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, i64 0, i32 0, i64 0, i32 3), align 8, !dbg !3723, !tbaa !2219
  br label %19, !dbg !3724

; <label>:18                                      ; preds = %._crit_edge
  store %struct.exe_disk_file_t* null, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 1), align 8, !dbg !3725, !tbaa !3721
  br label %19

; <label>:19                                      ; preds = %18, %14
  store i32 %max_failures, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !3726, !tbaa !2456
  %20 = icmp eq i32 %max_failures, 0, !dbg !3727
  br i1 %20, label %40, label %21, !dbg !3727

; <label>:21                                      ; preds = %19
  %22 = call noalias i8* @malloc(i64 4) #8, !dbg !3729
  %23 = bitcast i8* %22 to i32*, !dbg !3729
  store i32* %23, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 6), align 8, !dbg !3729, !tbaa !2484
  %24 = call noalias i8* @malloc(i64 4) #8, !dbg !3731
  %25 = bitcast i8* %24 to i32*, !dbg !3731
  store i32* %25, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !3731, !tbaa !2537
  %26 = call noalias i8* @malloc(i64 4) #8, !dbg !3732
  %27 = bitcast i8* %26 to i32*, !dbg !3732
  store i32* %27, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !3732, !tbaa !2457
  %28 = call noalias i8* @malloc(i64 4) #8, !dbg !3733
  %29 = bitcast i8* %28 to i32*, !dbg !3733
  store i32* %29, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !3733, !tbaa !2999
  %30 = call noalias i8* @malloc(i64 4) #8, !dbg !3734
  %31 = bitcast i8* %30 to i32*, !dbg !3734
  store i32* %31, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 8, !dbg !3734, !tbaa !3529
  call void @klee_make_symbolic(i8* %22, i64 4, i8* getelementptr inbounds ([10 x i8]* @.str211, i64 0, i64 0)) #8, !dbg !3735
  %32 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !3736, !tbaa !2537
  %33 = bitcast i32* %32 to i8*, !dbg !3736
  call void @klee_make_symbolic(i8* %33, i64 4, i8* getelementptr inbounds ([11 x i8]* @.str312, i64 0, i64 0)) #8, !dbg !3736
  %34 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !3737, !tbaa !2457
  %35 = bitcast i32* %34 to i8*, !dbg !3737
  call void @klee_make_symbolic(i8* %35, i64 4, i8* getelementptr inbounds ([11 x i8]* @.str413, i64 0, i64 0)) #8, !dbg !3737
  %36 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !3738, !tbaa !2999
  %37 = bitcast i32* %36 to i8*, !dbg !3738
  call void @klee_make_symbolic(i8* %37, i64 4, i8* getelementptr inbounds ([15 x i8]* @.str514, i64 0, i64 0)) #8, !dbg !3738
  %38 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 8, !dbg !3739, !tbaa !3529
  %39 = bitcast i32* %38 to i8*, !dbg !3739
  call void @klee_make_symbolic(i8* %39, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str615, i64 0, i64 0)) #8, !dbg !3739
  br label %40, !dbg !3740

; <label>:40                                      ; preds = %21, %19
  %41 = icmp eq i32 %sym_stdout_flag, 0, !dbg !3741
  br i1 %41, label %46, label %42, !dbg !3741

; <label>:42                                      ; preds = %40
  %43 = call noalias i8* @malloc(i64 24) #8, !dbg !3743
  %44 = bitcast i8* %43 to %struct.exe_disk_file_t*, !dbg !3743
  store %struct.exe_disk_file_t* %44, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !3743, !tbaa !2583
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %44, i32 1024, i8* getelementptr inbounds ([7 x i8]* @.str716, i64 0, i64 0), %struct.stat64* %s), !dbg !3745
  %45 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !3746, !tbaa !2583
  store %struct.exe_disk_file_t* %45, %struct.exe_disk_file_t** getelementptr inbounds ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, i64 0, i32 0, i64 1, i32 3), align 8, !dbg !3746, !tbaa !2219
  store i32 0, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !3747, !tbaa !2585
  br label %47, !dbg !3748

; <label>:46                                      ; preds = %40
  store %struct.exe_disk_file_t* null, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !3749, !tbaa !2583
  br label %47

; <label>:47                                      ; preds = %46, %42
  store i32 %save_all_writes_flag, i32* getelementptr inbounds ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, i64 0, i32 3), align 8, !dbg !3750, !tbaa !2569
  %48 = bitcast i32* %x.i to i8*, !dbg !3751
  call void @klee_make_symbolic(i8* %48, i64 4, i8* getelementptr inbounds ([14 x i8]* @.str817, i64 0, i64 0)) #8, !dbg !3753
  %49 = load i32* %x.i, align 4, !dbg !3754, !tbaa !2189
  store i32 %49, i32* getelementptr inbounds ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, i64 0, i32 2), align 4, !dbg !3752, !tbaa !3755
  %50 = icmp eq i32 %49, 1, !dbg !3756
  %51 = zext i1 %50 to i64, !dbg !3756
  call void @klee_assume(i64 %51) #8, !dbg !3756
  ret void, !dbg !3757
}

declare void @klee_make_symbolic(i8*, i64, i8*) #6

declare i32 @klee_is_symbolic(i64) #6

declare void @klee_posix_prefer_cex(i8*, i64) #6

; Function Attrs: nounwind uwtable
define i32 @kill(i32 %pid, i32 %sig) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2526, i64 0, i64 0)) #8, !dbg !3758
  %1 = tail call i32* @__errno_location() #4, !dbg !3759
  store i32 1, i32* %1, align 4, !dbg !3759, !tbaa !2189
  ret i32 -1, !dbg !3760
}

; Function Attrs: nounwind returns_twice uwtable
define weak i32 @_setjmp(%struct.__jmp_buf_tag* %__env) #10 {
  tail call void @klee_warning_once(i8* getelementptr inbounds ([9 x i8]* @.str126, i64 0, i64 0)) #8, !dbg !3761
  ret i32 0, !dbg !3762
}

; Function Attrs: noreturn nounwind uwtable
define void @longjmp(%struct.__jmp_buf_tag* nocapture readnone %env, i32 %val) #11 {
  tail call void @klee_report_error(i8* getelementptr inbounds ([10 x i8]* @.str22727, i64 0, i64 0), i32 35, i8* getelementptr inbounds ([20 x i8]* @.str328, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str429, i64 0, i64 0)) #16, !dbg !3763
  unreachable, !dbg !3763
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #12

; Function Attrs: nounwind uwtable
define weak i32 @execl(i8* %path, i8* %arg, ...) #3 {
  call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str530, i64 0, i64 0)) #8, !dbg !3764
  %1 = call i32* @__errno_location() #4, !dbg !3764
  store i32 13, i32* %1, align 4, !dbg !3764, !tbaa !2189
  ret i32 -1, !dbg !3764
}

; Function Attrs: nounwind uwtable
define weak i32 @execlp(i8* %file, i8* %arg, ...) #3 {
  call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str530, i64 0, i64 0)) #8, !dbg !3765
  %1 = call i32* @__errno_location() #4, !dbg !3765
  store i32 13, i32* %1, align 4, !dbg !3765, !tbaa !2189
  ret i32 -1, !dbg !3765
}

; Function Attrs: nounwind uwtable
define weak i32 @execle(i8* %path, i8* %arg, ...) #3 {
  call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str530, i64 0, i64 0)) #8, !dbg !3766
  %1 = call i32* @__errno_location() #4, !dbg !3766
  store i32 13, i32* %1, align 4, !dbg !3766, !tbaa !2189
  ret i32 -1, !dbg !3766
}

; Function Attrs: nounwind uwtable
define weak i32 @execv(i8* %path, i8** %argv) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str530, i64 0, i64 0)) #8, !dbg !3767
  %1 = tail call i32* @__errno_location() #4, !dbg !3767
  store i32 13, i32* %1, align 4, !dbg !3767, !tbaa !2189
  ret i32 -1, !dbg !3767
}

; Function Attrs: nounwind uwtable
define weak i32 @execvp(i8* %file, i8** %argv) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str530, i64 0, i64 0)) #8, !dbg !3768
  %1 = tail call i32* @__errno_location() #4, !dbg !3768
  store i32 13, i32* %1, align 4, !dbg !3768, !tbaa !2189
  ret i32 -1, !dbg !3768
}

; Function Attrs: nounwind uwtable
define weak i32 @execve(i8* %file, i8** %argv, i8** %envp) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str530, i64 0, i64 0)) #8, !dbg !3769
  %1 = tail call i32* @__errno_location() #4, !dbg !3769
  store i32 13, i32* %1, align 4, !dbg !3769, !tbaa !2189
  ret i32 -1, !dbg !3769
}

; Function Attrs: nounwind uwtable
define i32 @fork() #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str631, i64 0, i64 0)) #8, !dbg !3770
  %1 = tail call i32* @__errno_location() #4, !dbg !3771
  store i32 12, i32* %1, align 4, !dbg !3771, !tbaa !2189
  ret i32 -1, !dbg !3772
}

; Function Attrs: nounwind returns_twice uwtable
define i32 @vfork() #10 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str631, i64 0, i64 0)) #8, !dbg !3773
  %1 = tail call i32* @__errno_location() #4, !dbg !3775
  store i32 12, i32* %1, align 4, !dbg !3775, !tbaa !2189
  ret i32 -1, !dbg !3774
}

; Function Attrs: nounwind uwtable
define void @klee_init_env(i32* nocapture %argcPtr, i8*** nocapture %argvPtr) #3 {
  %new_argv = alloca [1024 x i8*], align 16
  %sym_arg_name = alloca [5 x i8], align 4
  %1 = load i32* %argcPtr, align 4, !dbg !3776, !tbaa !2189
  %2 = load i8*** %argvPtr, align 8, !dbg !3777, !tbaa !3778
  %3 = bitcast [1024 x i8*]* %new_argv to i8*, !dbg !3779
  %4 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 0, !dbg !3780
  %5 = bitcast [5 x i8]* %sym_arg_name to i32*, !dbg !3780
  store i32 6779489, i32* %5, align 4, !dbg !3780
  %6 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 4, !dbg !3781
  store i8 0, i8* %6, align 4, !dbg !3781, !tbaa !2142
  %7 = icmp eq i32 %1, 2, !dbg !3782
  br i1 %7, label %8, label %__streq.exit.thread.preheader, !dbg !3782

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds i8** %2, i64 1, !dbg !3782
  %10 = load i8** %9, align 8, !dbg !3782, !tbaa !3778
  %11 = load i8* %10, align 1, !dbg !3784, !tbaa !2142
  %12 = icmp eq i8 %11, 45, !dbg !3784
  br i1 %12, label %.lr.ph.i, label %.lr.ph410, !dbg !3784

.lr.ph.i:                                         ; preds = %15, %8
  %13 = phi i8 [ %18, %15 ], [ 45, %8 ]
  %.04.i = phi i8* [ %17, %15 ], [ getelementptr inbounds ([7 x i8]* @.str32, i64 0, i64 0), %8 ]
  %.013.i = phi i8* [ %16, %15 ], [ %10, %8 ]
  %14 = icmp eq i8 %13, 0, !dbg !3785
  br i1 %14, label %23, label %15, !dbg !3785

; <label>:15                                      ; preds = %.lr.ph.i
  %16 = getelementptr inbounds i8* %.013.i, i64 1, !dbg !3788
  %17 = getelementptr inbounds i8* %.04.i, i64 1, !dbg !3789
  %18 = load i8* %16, align 1, !dbg !3784, !tbaa !2142
  %19 = load i8* %17, align 1, !dbg !3784, !tbaa !2142
  %20 = icmp eq i8 %18, %19, !dbg !3784
  br i1 %20, label %.lr.ph.i, label %__streq.exit.thread.preheader, !dbg !3784

__streq.exit.thread.preheader:                    ; preds = %15, %0
  %21 = icmp sgt i32 %1, 0, !dbg !3790
  br i1 %21, label %.lr.ph410, label %__streq.exit.thread._crit_edge, !dbg !3790

.lr.ph410:                                        ; preds = %__streq.exit.thread.preheader, %8
  %22 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 3, !dbg !3791
  br label %24, !dbg !3790

; <label>:23                                      ; preds = %.lr.ph.i
  call fastcc void @__emit_error(i8* getelementptr inbounds ([964 x i8]* @.str133, i64 0, i64 0)), !dbg !3792
  unreachable

; <label>:24                                      ; preds = %__streq.exit.thread.backedge, %.lr.ph410
  %sym_files.0402 = phi i32 [ 0, %.lr.ph410 ], [ %sym_files.0.be, %__streq.exit.thread.backedge ]
  %sym_file_len.0394 = phi i32 [ 0, %.lr.ph410 ], [ %sym_file_len.0.be, %__streq.exit.thread.backedge ]
  %sym_stdin_len.0386 = phi i32 [ 0, %.lr.ph410 ], [ %sym_stdin_len.0.be, %__streq.exit.thread.backedge ]
  %sym_stdout_flag.0378 = phi i32 [ 0, %.lr.ph410 ], [ %sym_stdout_flag.0.be, %__streq.exit.thread.backedge ]
  %k.0369 = phi i32 [ 0, %.lr.ph410 ], [ %k.0.be, %__streq.exit.thread.backedge ]
  %sym_arg_num.0360 = phi i32 [ 0, %.lr.ph410 ], [ %sym_arg_num.0.be, %__streq.exit.thread.backedge ]
  %save_all_writes_flag.0352 = phi i32 [ 0, %.lr.ph410 ], [ %save_all_writes_flag.0.be, %__streq.exit.thread.backedge ]
  %fd_fail.0345 = phi i32 [ 0, %.lr.ph410 ], [ %fd_fail.0.be, %__streq.exit.thread.backedge ]
  %25 = phi i32 [ 0, %.lr.ph410 ], [ %.be, %__streq.exit.thread.backedge ]
  %26 = sext i32 %k.0369 to i64, !dbg !3794
  %27 = getelementptr inbounds i8** %2, i64 %26, !dbg !3794
  %28 = load i8** %27, align 8, !dbg !3794, !tbaa !3778
  %29 = load i8* %28, align 1, !dbg !3795, !tbaa !2142
  %30 = icmp eq i8 %29, 45, !dbg !3795
  br i1 %30, label %.lr.ph.i7, label %.loopexit162, !dbg !3795

.lr.ph.i7:                                        ; preds = %33, %24
  %31 = phi i8 [ %36, %33 ], [ 45, %24 ]
  %.04.i5 = phi i8* [ %35, %33 ], [ getelementptr inbounds ([10 x i8]* @.str234, i64 0, i64 0), %24 ]
  %.013.i6 = phi i8* [ %34, %33 ], [ %28, %24 ]
  %32 = icmp eq i8 %31, 0, !dbg !3796
  br i1 %32, label %__streq.exit9.thread124, label %33, !dbg !3796

; <label>:33                                      ; preds = %.lr.ph.i7
  %34 = getelementptr inbounds i8* %.013.i6, i64 1, !dbg !3797
  %35 = getelementptr inbounds i8* %.04.i5, i64 1, !dbg !3798
  %36 = load i8* %34, align 1, !dbg !3795, !tbaa !2142
  %37 = load i8* %35, align 1, !dbg !3795, !tbaa !2142
  %38 = icmp eq i8 %36, %37, !dbg !3795
  br i1 %38, label %.lr.ph.i7, label %.lr.ph.i13, !dbg !3795

.lr.ph.i13:                                       ; preds = %41, %33
  %39 = phi i8 [ %44, %41 ], [ 45, %33 ]
  %.04.i11 = phi i8* [ %43, %41 ], [ getelementptr inbounds ([9 x i8]* @.str335, i64 0, i64 0), %33 ]
  %.013.i12 = phi i8* [ %42, %41 ], [ %28, %33 ]
  %40 = icmp eq i8 %39, 0, !dbg !3796
  br i1 %40, label %__streq.exit9.thread124, label %41, !dbg !3796

; <label>:41                                      ; preds = %.lr.ph.i13
  %42 = getelementptr inbounds i8* %.013.i12, i64 1, !dbg !3797
  %43 = getelementptr inbounds i8* %.04.i11, i64 1, !dbg !3798
  %44 = load i8* %42, align 1, !dbg !3795, !tbaa !2142
  %45 = load i8* %43, align 1, !dbg !3795, !tbaa !2142
  %46 = icmp eq i8 %44, %45, !dbg !3795
  br i1 %46, label %.lr.ph.i13, label %.lr.ph.i24, !dbg !3795

__streq.exit9.thread124:                          ; preds = %.lr.ph.i13, %.lr.ph.i7
  %47 = add nsw i32 %k.0369, 1, !dbg !3799
  %48 = icmp eq i32 %47, %1, !dbg !3799
  br i1 %48, label %49, label %50, !dbg !3799

; <label>:49                                      ; preds = %__streq.exit9.thread124
  call fastcc void @__emit_error(i8* getelementptr inbounds ([48 x i8]* @.str436, i64 0, i64 0)), !dbg !3801
  unreachable

; <label>:50                                      ; preds = %__streq.exit9.thread124
  %51 = add nsw i32 %k.0369, 2, !dbg !3802
  %52 = sext i32 %47 to i64, !dbg !3802
  %53 = getelementptr inbounds i8** %2, i64 %52, !dbg !3802
  %54 = load i8** %53, align 8, !dbg !3802, !tbaa !3778
  %55 = load i8* %54, align 1, !dbg !3803, !tbaa !2142
  %56 = icmp eq i8 %55, 0, !dbg !3803
  br i1 %56, label %57, label %.lr.ph.i19, !dbg !3803

; <label>:57                                      ; preds = %50
  call fastcc void @__emit_error(i8* getelementptr inbounds ([48 x i8]* @.str436, i64 0, i64 0)) #8, !dbg !3803
  unreachable

.lr.ph.i19:                                       ; preds = %61, %50
  %58 = phi i8 [ %66, %61 ], [ %55, %50 ]
  %s.pn.i16 = phi i8* [ %59, %61 ], [ %54, %50 ]
  %res.02.i17 = phi i64 [ %65, %61 ], [ 0, %50 ]
  %59 = getelementptr inbounds i8* %s.pn.i16, i64 1, !dbg !3805
  %.off.i18 = add i8 %58, -48, !dbg !3806
  %60 = icmp ult i8 %.off.i18, 10, !dbg !3806
  br i1 %60, label %61, label %68, !dbg !3806

; <label>:61                                      ; preds = %.lr.ph.i19
  %62 = sext i8 %58 to i64, !dbg !3810
  %63 = mul nsw i64 %res.02.i17, 10, !dbg !3811
  %64 = add i64 %62, -48, !dbg !3811
  %65 = add i64 %64, %63, !dbg !3811
  %66 = load i8* %59, align 1, !dbg !3805, !tbaa !2142
  %67 = icmp eq i8 %66, 0, !dbg !3805
  br i1 %67, label %__str_to_int.exit20, label %.lr.ph.i19, !dbg !3805

; <label>:68                                      ; preds = %.lr.ph.i19
  call fastcc void @__emit_error(i8* getelementptr inbounds ([48 x i8]* @.str436, i64 0, i64 0)) #8, !dbg !3813
  unreachable

__str_to_int.exit20:                              ; preds = %61
  %69 = trunc i64 %65 to i32, !dbg !3802
  %70 = add i32 %sym_arg_num.0360, 48, !dbg !3791
  %71 = trunc i32 %70 to i8, !dbg !3791
  store i8 %71, i8* %22, align 1, !dbg !3791, !tbaa !2142
  %72 = call fastcc i8* @__get_sym_str(i32 %69, i8* %4), !dbg !3815
  %73 = icmp eq i32 %25, 1024, !dbg !3816
  br i1 %73, label %74, label %__add_arg.exit21, !dbg !3816

; <label>:74                                      ; preds = %__str_to_int.exit20
  call fastcc void @__emit_error(i8* getelementptr inbounds ([37 x i8]* @.str2456, i64 0, i64 0)) #8, !dbg !3819
  unreachable

__add_arg.exit21:                                 ; preds = %__str_to_int.exit20
  %75 = add i32 %sym_arg_num.0360, 1, !dbg !3791
  %76 = sext i32 %25 to i64, !dbg !3821
  %77 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %76, !dbg !3821
  store i8* %72, i8** %77, align 8, !dbg !3821, !tbaa !3778
  %78 = add nsw i32 %25, 1, !dbg !3823
  br label %__streq.exit.thread.backedge, !dbg !3824

.lr.ph.i24:                                       ; preds = %81, %41
  %79 = phi i8 [ %84, %81 ], [ 45, %41 ]
  %.04.i22 = phi i8* [ %83, %81 ], [ getelementptr inbounds ([11 x i8]* @.str537, i64 0, i64 0), %41 ]
  %.013.i23 = phi i8* [ %82, %81 ], [ %28, %41 ]
  %80 = icmp eq i8 %79, 0, !dbg !3825
  br i1 %80, label %__streq.exit26.thread126, label %81, !dbg !3825

; <label>:81                                      ; preds = %.lr.ph.i24
  %82 = getelementptr inbounds i8* %.013.i23, i64 1, !dbg !3827
  %83 = getelementptr inbounds i8* %.04.i22, i64 1, !dbg !3828
  %84 = load i8* %82, align 1, !dbg !3829, !tbaa !2142
  %85 = load i8* %83, align 1, !dbg !3829, !tbaa !2142
  %86 = icmp eq i8 %84, %85, !dbg !3829
  br i1 %86, label %.lr.ph.i24, label %.lr.ph.i29, !dbg !3829

.lr.ph.i29:                                       ; preds = %89, %81
  %87 = phi i8 [ %92, %89 ], [ 45, %81 ]
  %.04.i27 = phi i8* [ %91, %89 ], [ getelementptr inbounds ([10 x i8]* @.str638, i64 0, i64 0), %81 ]
  %.013.i28 = phi i8* [ %90, %89 ], [ %28, %81 ]
  %88 = icmp eq i8 %87, 0, !dbg !3825
  br i1 %88, label %__streq.exit26.thread126, label %89, !dbg !3825

; <label>:89                                      ; preds = %.lr.ph.i29
  %90 = getelementptr inbounds i8* %.013.i28, i64 1, !dbg !3827
  %91 = getelementptr inbounds i8* %.04.i27, i64 1, !dbg !3828
  %92 = load i8* %90, align 1, !dbg !3829, !tbaa !2142
  %93 = load i8* %91, align 1, !dbg !3829, !tbaa !2142
  %94 = icmp eq i8 %92, %93, !dbg !3829
  br i1 %94, label %.lr.ph.i29, label %.lr.ph.i50, !dbg !3829

__streq.exit26.thread126:                         ; preds = %.lr.ph.i29, %.lr.ph.i24
  %95 = add nsw i32 %k.0369, 3, !dbg !3830
  %96 = icmp slt i32 %95, %1, !dbg !3830
  br i1 %96, label %98, label %97, !dbg !3830

; <label>:97                                      ; preds = %__streq.exit26.thread126
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str739, i64 0, i64 0)), !dbg !3832
  unreachable

; <label>:98                                      ; preds = %__streq.exit26.thread126
  %99 = add nsw i32 %k.0369, 1, !dbg !3833
  %100 = add nsw i32 %k.0369, 2, !dbg !3834
  %101 = sext i32 %99 to i64, !dbg !3834
  %102 = getelementptr inbounds i8** %2, i64 %101, !dbg !3834
  %103 = load i8** %102, align 8, !dbg !3834, !tbaa !3778
  %104 = load i8* %103, align 1, !dbg !3835, !tbaa !2142
  %105 = icmp eq i8 %104, 0, !dbg !3835
  br i1 %105, label %106, label %.lr.ph.i35, !dbg !3835

; <label>:106                                     ; preds = %98
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str739, i64 0, i64 0)) #8, !dbg !3835
  unreachable

.lr.ph.i35:                                       ; preds = %110, %98
  %107 = phi i8 [ %115, %110 ], [ %104, %98 ]
  %s.pn.i32 = phi i8* [ %108, %110 ], [ %103, %98 ]
  %res.02.i33 = phi i64 [ %114, %110 ], [ 0, %98 ]
  %108 = getelementptr inbounds i8* %s.pn.i32, i64 1, !dbg !3836
  %.off.i34 = add i8 %107, -48, !dbg !3837
  %109 = icmp ult i8 %.off.i34, 10, !dbg !3837
  br i1 %109, label %110, label %117, !dbg !3837

; <label>:110                                     ; preds = %.lr.ph.i35
  %111 = sext i8 %107 to i64, !dbg !3838
  %112 = mul nsw i64 %res.02.i33, 10, !dbg !3839
  %113 = add i64 %111, -48, !dbg !3839
  %114 = add i64 %113, %112, !dbg !3839
  %115 = load i8* %108, align 1, !dbg !3836, !tbaa !2142
  %116 = icmp eq i8 %115, 0, !dbg !3836
  br i1 %116, label %__str_to_int.exit36, label %.lr.ph.i35, !dbg !3836

; <label>:117                                     ; preds = %.lr.ph.i35
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str739, i64 0, i64 0)) #8, !dbg !3840
  unreachable

__str_to_int.exit36:                              ; preds = %110
  %118 = trunc i64 %114 to i32, !dbg !3834
  %119 = sext i32 %100 to i64, !dbg !3841
  %120 = getelementptr inbounds i8** %2, i64 %119, !dbg !3841
  %121 = load i8** %120, align 8, !dbg !3841, !tbaa !3778
  %122 = load i8* %121, align 1, !dbg !3842, !tbaa !2142
  %123 = icmp eq i8 %122, 0, !dbg !3842
  br i1 %123, label %124, label %.lr.ph.i40, !dbg !3842

; <label>:124                                     ; preds = %__str_to_int.exit36
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str739, i64 0, i64 0)) #8, !dbg !3842
  unreachable

.lr.ph.i40:                                       ; preds = %128, %__str_to_int.exit36
  %125 = phi i8 [ %133, %128 ], [ %122, %__str_to_int.exit36 ]
  %s.pn.i37 = phi i8* [ %126, %128 ], [ %121, %__str_to_int.exit36 ]
  %res.02.i38 = phi i64 [ %132, %128 ], [ 0, %__str_to_int.exit36 ]
  %126 = getelementptr inbounds i8* %s.pn.i37, i64 1, !dbg !3843
  %.off.i39 = add i8 %125, -48, !dbg !3844
  %127 = icmp ult i8 %.off.i39, 10, !dbg !3844
  br i1 %127, label %128, label %135, !dbg !3844

; <label>:128                                     ; preds = %.lr.ph.i40
  %129 = sext i8 %125 to i64, !dbg !3845
  %130 = mul nsw i64 %res.02.i38, 10, !dbg !3846
  %131 = add i64 %129, -48, !dbg !3846
  %132 = add i64 %131, %130, !dbg !3846
  %133 = load i8* %126, align 1, !dbg !3843, !tbaa !2142
  %134 = icmp eq i8 %133, 0, !dbg !3843
  br i1 %134, label %__str_to_int.exit41, label %.lr.ph.i40, !dbg !3843

; <label>:135                                     ; preds = %.lr.ph.i40
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str739, i64 0, i64 0)) #8, !dbg !3847
  unreachable

__str_to_int.exit41:                              ; preds = %128
  %136 = trunc i64 %132 to i32, !dbg !3841
  %137 = add nsw i32 %k.0369, 4, !dbg !3848
  %138 = sext i32 %95 to i64, !dbg !3848
  %139 = getelementptr inbounds i8** %2, i64 %138, !dbg !3848
  %140 = load i8** %139, align 8, !dbg !3848, !tbaa !3778
  %141 = load i8* %140, align 1, !dbg !3849, !tbaa !2142
  %142 = icmp eq i8 %141, 0, !dbg !3849
  br i1 %142, label %143, label %.lr.ph.i45, !dbg !3849

; <label>:143                                     ; preds = %__str_to_int.exit41
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str739, i64 0, i64 0)) #8, !dbg !3849
  unreachable

.lr.ph.i45:                                       ; preds = %147, %__str_to_int.exit41
  %144 = phi i8 [ %152, %147 ], [ %141, %__str_to_int.exit41 ]
  %s.pn.i42 = phi i8* [ %145, %147 ], [ %140, %__str_to_int.exit41 ]
  %res.02.i43 = phi i64 [ %151, %147 ], [ 0, %__str_to_int.exit41 ]
  %145 = getelementptr inbounds i8* %s.pn.i42, i64 1, !dbg !3850
  %.off.i44 = add i8 %144, -48, !dbg !3851
  %146 = icmp ult i8 %.off.i44, 10, !dbg !3851
  br i1 %146, label %147, label %154, !dbg !3851

; <label>:147                                     ; preds = %.lr.ph.i45
  %148 = sext i8 %144 to i64, !dbg !3852
  %149 = mul nsw i64 %res.02.i43, 10, !dbg !3853
  %150 = add i64 %148, -48, !dbg !3853
  %151 = add i64 %150, %149, !dbg !3853
  %152 = load i8* %145, align 1, !dbg !3850, !tbaa !2142
  %153 = icmp eq i8 %152, 0, !dbg !3850
  br i1 %153, label %__str_to_int.exit46, label %.lr.ph.i45, !dbg !3850

; <label>:154                                     ; preds = %.lr.ph.i45
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str739, i64 0, i64 0)) #8, !dbg !3854
  unreachable

__str_to_int.exit46:                              ; preds = %147
  %155 = trunc i64 %151 to i32, !dbg !3848
  %156 = add i32 %136, 1, !dbg !3855
  %157 = call i32 @klee_range(i32 %118, i32 %156, i8* getelementptr inbounds ([7 x i8]* @.str840, i64 0, i64 0)) #8, !dbg !3855
  %158 = icmp sgt i32 %157, 0, !dbg !3856
  br i1 %158, label %.lr.ph, label %__streq.exit.thread.backedge, !dbg !3856

.lr.ph:                                           ; preds = %__str_to_int.exit46
  %159 = sext i32 %25 to i64
  br label %160, !dbg !3856

; <label>:160                                     ; preds = %__add_arg.exit47, %.lr.ph
  %indvars.iv = phi i64 [ %159, %.lr.ph ], [ %indvars.iv.next, %__add_arg.exit47 ]
  %i.0173 = phi i32 [ 0, %.lr.ph ], [ %171, %__add_arg.exit47 ]
  %sym_arg_num.1172 = phi i32 [ %sym_arg_num.0360, %.lr.ph ], [ %168, %__add_arg.exit47 ]
  %161 = phi i32 [ %25, %.lr.ph ], [ %170, %__add_arg.exit47 ]
  %162 = add i32 %sym_arg_num.1172, 48, !dbg !3858
  %163 = trunc i32 %162 to i8, !dbg !3858
  store i8 %163, i8* %22, align 1, !dbg !3858, !tbaa !2142
  %164 = call fastcc i8* @__get_sym_str(i32 %155, i8* %4), !dbg !3860
  %165 = trunc i64 %indvars.iv to i32, !dbg !3861
  %166 = icmp eq i32 %165, 1024, !dbg !3861
  br i1 %166, label %167, label %__add_arg.exit47, !dbg !3861

; <label>:167                                     ; preds = %160
  call fastcc void @__emit_error(i8* getelementptr inbounds ([37 x i8]* @.str2456, i64 0, i64 0)) #8, !dbg !3863
  unreachable

__add_arg.exit47:                                 ; preds = %160
  %168 = add i32 %sym_arg_num.1172, 1, !dbg !3858
  %169 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %indvars.iv, !dbg !3864
  store i8* %164, i8** %169, align 8, !dbg !3864, !tbaa !3778
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !3856
  %170 = add nsw i32 %161, 1, !dbg !3865
  %171 = add nsw i32 %i.0173, 1, !dbg !3856
  %172 = icmp slt i32 %171, %157, !dbg !3856
  br i1 %172, label %160, label %__streq.exit.thread.backedge, !dbg !3856

.lr.ph.i50:                                       ; preds = %175, %89
  %173 = phi i8 [ %178, %175 ], [ 45, %89 ]
  %.04.i48 = phi i8* [ %177, %175 ], [ getelementptr inbounds ([12 x i8]* @.str941, i64 0, i64 0), %89 ]
  %.013.i49 = phi i8* [ %176, %175 ], [ %28, %89 ]
  %174 = icmp eq i8 %173, 0, !dbg !3866
  br i1 %174, label %__streq.exit52.thread128, label %175, !dbg !3866

; <label>:175                                     ; preds = %.lr.ph.i50
  %176 = getelementptr inbounds i8* %.013.i49, i64 1, !dbg !3868
  %177 = getelementptr inbounds i8* %.04.i48, i64 1, !dbg !3869
  %178 = load i8* %176, align 1, !dbg !3870, !tbaa !2142
  %179 = load i8* %177, align 1, !dbg !3870, !tbaa !2142
  %180 = icmp eq i8 %178, %179, !dbg !3870
  br i1 %180, label %.lr.ph.i50, label %.lr.ph.i55, !dbg !3870

.lr.ph.i55:                                       ; preds = %183, %175
  %181 = phi i8 [ %186, %183 ], [ 45, %175 ]
  %.04.i53 = phi i8* [ %185, %183 ], [ getelementptr inbounds ([11 x i8]* @.str1042, i64 0, i64 0), %175 ]
  %.013.i54 = phi i8* [ %184, %183 ], [ %28, %175 ]
  %182 = icmp eq i8 %181, 0, !dbg !3866
  br i1 %182, label %__streq.exit52.thread128, label %183, !dbg !3866

; <label>:183                                     ; preds = %.lr.ph.i55
  %184 = getelementptr inbounds i8* %.013.i54, i64 1, !dbg !3868
  %185 = getelementptr inbounds i8* %.04.i53, i64 1, !dbg !3869
  %186 = load i8* %184, align 1, !dbg !3870, !tbaa !2142
  %187 = load i8* %185, align 1, !dbg !3870, !tbaa !2142
  %188 = icmp eq i8 %186, %187, !dbg !3870
  br i1 %188, label %.lr.ph.i55, label %.lr.ph.i70, !dbg !3870

__streq.exit52.thread128:                         ; preds = %.lr.ph.i55, %.lr.ph.i50
  %189 = add nsw i32 %k.0369, 2, !dbg !3871
  %190 = icmp slt i32 %189, %1, !dbg !3871
  br i1 %190, label %192, label %191, !dbg !3871

; <label>:191                                     ; preds = %__streq.exit52.thread128
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str1143, i64 0, i64 0)), !dbg !3873
  unreachable

; <label>:192                                     ; preds = %__streq.exit52.thread128
  %193 = add nsw i32 %k.0369, 1, !dbg !3874
  %194 = sext i32 %193 to i64, !dbg !3875
  %195 = getelementptr inbounds i8** %2, i64 %194, !dbg !3875
  %196 = load i8** %195, align 8, !dbg !3875, !tbaa !3778
  %197 = load i8* %196, align 1, !dbg !3876, !tbaa !2142
  %198 = icmp eq i8 %197, 0, !dbg !3876
  br i1 %198, label %199, label %.lr.ph.i61, !dbg !3876

; <label>:199                                     ; preds = %192
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str1143, i64 0, i64 0)) #8, !dbg !3876
  unreachable

.lr.ph.i61:                                       ; preds = %203, %192
  %200 = phi i8 [ %208, %203 ], [ %197, %192 ]
  %s.pn.i58 = phi i8* [ %201, %203 ], [ %196, %192 ]
  %res.02.i59 = phi i64 [ %207, %203 ], [ 0, %192 ]
  %201 = getelementptr inbounds i8* %s.pn.i58, i64 1, !dbg !3877
  %.off.i60 = add i8 %200, -48, !dbg !3878
  %202 = icmp ult i8 %.off.i60, 10, !dbg !3878
  br i1 %202, label %203, label %210, !dbg !3878

; <label>:203                                     ; preds = %.lr.ph.i61
  %204 = sext i8 %200 to i64, !dbg !3879
  %205 = mul nsw i64 %res.02.i59, 10, !dbg !3880
  %206 = add i64 %204, -48, !dbg !3880
  %207 = add i64 %206, %205, !dbg !3880
  %208 = load i8* %201, align 1, !dbg !3877, !tbaa !2142
  %209 = icmp eq i8 %208, 0, !dbg !3877
  br i1 %209, label %__str_to_int.exit62, label %.lr.ph.i61, !dbg !3877

; <label>:210                                     ; preds = %.lr.ph.i61
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str1143, i64 0, i64 0)) #8, !dbg !3881
  unreachable

__str_to_int.exit62:                              ; preds = %203
  %211 = trunc i64 %207 to i32, !dbg !3875
  %212 = add nsw i32 %k.0369, 3, !dbg !3882
  %213 = sext i32 %189 to i64, !dbg !3882
  %214 = getelementptr inbounds i8** %2, i64 %213, !dbg !3882
  %215 = load i8** %214, align 8, !dbg !3882, !tbaa !3778
  %216 = load i8* %215, align 1, !dbg !3883, !tbaa !2142
  %217 = icmp eq i8 %216, 0, !dbg !3883
  br i1 %217, label %218, label %.lr.ph.i66, !dbg !3883

; <label>:218                                     ; preds = %__str_to_int.exit62
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str1143, i64 0, i64 0)) #8, !dbg !3883
  unreachable

.lr.ph.i66:                                       ; preds = %222, %__str_to_int.exit62
  %219 = phi i8 [ %227, %222 ], [ %216, %__str_to_int.exit62 ]
  %s.pn.i63 = phi i8* [ %220, %222 ], [ %215, %__str_to_int.exit62 ]
  %res.02.i64 = phi i64 [ %226, %222 ], [ 0, %__str_to_int.exit62 ]
  %220 = getelementptr inbounds i8* %s.pn.i63, i64 1, !dbg !3884
  %.off.i65 = add i8 %219, -48, !dbg !3885
  %221 = icmp ult i8 %.off.i65, 10, !dbg !3885
  br i1 %221, label %222, label %229, !dbg !3885

; <label>:222                                     ; preds = %.lr.ph.i66
  %223 = sext i8 %219 to i64, !dbg !3886
  %224 = mul nsw i64 %res.02.i64, 10, !dbg !3887
  %225 = add i64 %223, -48, !dbg !3887
  %226 = add i64 %225, %224, !dbg !3887
  %227 = load i8* %220, align 1, !dbg !3884, !tbaa !2142
  %228 = icmp eq i8 %227, 0, !dbg !3884
  br i1 %228, label %__str_to_int.exit67, label %.lr.ph.i66, !dbg !3884

; <label>:229                                     ; preds = %.lr.ph.i66
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str1143, i64 0, i64 0)) #8, !dbg !3888
  unreachable

__str_to_int.exit67:                              ; preds = %222
  %230 = trunc i64 %226 to i32, !dbg !3882
  br label %__streq.exit.thread.backedge, !dbg !3889

.lr.ph.i70:                                       ; preds = %233, %183
  %231 = phi i8 [ %236, %233 ], [ 45, %183 ]
  %.04.i68 = phi i8* [ %235, %233 ], [ getelementptr inbounds ([12 x i8]* @.str1244, i64 0, i64 0), %183 ]
  %.013.i69 = phi i8* [ %234, %233 ], [ %28, %183 ]
  %232 = icmp eq i8 %231, 0, !dbg !3890
  br i1 %232, label %__streq.exit72.thread130, label %233, !dbg !3890

; <label>:233                                     ; preds = %.lr.ph.i70
  %234 = getelementptr inbounds i8* %.013.i69, i64 1, !dbg !3892
  %235 = getelementptr inbounds i8* %.04.i68, i64 1, !dbg !3893
  %236 = load i8* %234, align 1, !dbg !3894, !tbaa !2142
  %237 = load i8* %235, align 1, !dbg !3894, !tbaa !2142
  %238 = icmp eq i8 %236, %237, !dbg !3894
  br i1 %238, label %.lr.ph.i70, label %.lr.ph.i75, !dbg !3894

.lr.ph.i75:                                       ; preds = %241, %233
  %239 = phi i8 [ %244, %241 ], [ 45, %233 ]
  %.04.i73 = phi i8* [ %243, %241 ], [ getelementptr inbounds ([11 x i8]* @.str1345, i64 0, i64 0), %233 ]
  %.013.i74 = phi i8* [ %242, %241 ], [ %28, %233 ]
  %240 = icmp eq i8 %239, 0, !dbg !3895
  br i1 %240, label %__streq.exit72.thread130, label %241, !dbg !3895

; <label>:241                                     ; preds = %.lr.ph.i75
  %242 = getelementptr inbounds i8* %.013.i74, i64 1, !dbg !3897
  %243 = getelementptr inbounds i8* %.04.i73, i64 1, !dbg !3898
  %244 = load i8* %242, align 1, !dbg !3899, !tbaa !2142
  %245 = load i8* %243, align 1, !dbg !3899, !tbaa !2142
  %246 = icmp eq i8 %244, %245, !dbg !3899
  br i1 %246, label %.lr.ph.i75, label %.lr.ph.i85, !dbg !3899

__streq.exit72.thread130:                         ; preds = %.lr.ph.i75, %.lr.ph.i70
  %247 = add nsw i32 %k.0369, 1, !dbg !3900
  %248 = icmp eq i32 %247, %1, !dbg !3900
  br i1 %248, label %249, label %250, !dbg !3900

; <label>:249                                     ; preds = %__streq.exit72.thread130
  call fastcc void @__emit_error(i8* getelementptr inbounds ([57 x i8]* @.str1446, i64 0, i64 0)), !dbg !3902
  unreachable

; <label>:250                                     ; preds = %__streq.exit72.thread130
  %251 = add nsw i32 %k.0369, 2, !dbg !3903
  %252 = sext i32 %247 to i64, !dbg !3903
  %253 = getelementptr inbounds i8** %2, i64 %252, !dbg !3903
  %254 = load i8** %253, align 8, !dbg !3903, !tbaa !3778
  %255 = load i8* %254, align 1, !dbg !3904, !tbaa !2142
  %256 = icmp eq i8 %255, 0, !dbg !3904
  br i1 %256, label %257, label %.lr.ph.i81, !dbg !3904

; <label>:257                                     ; preds = %250
  call fastcc void @__emit_error(i8* getelementptr inbounds ([57 x i8]* @.str1446, i64 0, i64 0)) #8, !dbg !3904
  unreachable

.lr.ph.i81:                                       ; preds = %261, %250
  %258 = phi i8 [ %266, %261 ], [ %255, %250 ]
  %s.pn.i78 = phi i8* [ %259, %261 ], [ %254, %250 ]
  %res.02.i79 = phi i64 [ %265, %261 ], [ 0, %250 ]
  %259 = getelementptr inbounds i8* %s.pn.i78, i64 1, !dbg !3905
  %.off.i80 = add i8 %258, -48, !dbg !3906
  %260 = icmp ult i8 %.off.i80, 10, !dbg !3906
  br i1 %260, label %261, label %268, !dbg !3906

; <label>:261                                     ; preds = %.lr.ph.i81
  %262 = sext i8 %258 to i64, !dbg !3907
  %263 = mul nsw i64 %res.02.i79, 10, !dbg !3908
  %264 = add i64 %262, -48, !dbg !3908
  %265 = add i64 %264, %263, !dbg !3908
  %266 = load i8* %259, align 1, !dbg !3905, !tbaa !2142
  %267 = icmp eq i8 %266, 0, !dbg !3905
  br i1 %267, label %__str_to_int.exit82, label %.lr.ph.i81, !dbg !3905

; <label>:268                                     ; preds = %.lr.ph.i81
  call fastcc void @__emit_error(i8* getelementptr inbounds ([57 x i8]* @.str1446, i64 0, i64 0)) #8, !dbg !3909
  unreachable

__str_to_int.exit82:                              ; preds = %261
  %269 = trunc i64 %265 to i32, !dbg !3903
  br label %__streq.exit.thread.backedge, !dbg !3910

__streq.exit.thread.backedge:                     ; preds = %__add_arg.exit, %__str_to_int.exit, %__streq.exit117.thread136, %__streq.exit97.thread134, %__streq.exit87.thread132, %__str_to_int.exit82, %__str_to_int.exit67, %__add_arg.exit47, %__str_to_in
  %.be = phi i32 [ %78, %__add_arg.exit21 ], [ %25, %__str_to_int.exit67 ], [ %25, %__str_to_int.exit82 ], [ %25, %__streq.exit87.thread132 ], [ %25, %__streq.exit97.thread134 ], [ %25, %__streq.exit117.thread136 ], [ %25, %__str_to_int.exit ], [ %366, %
  %fd_fail.0.be = phi i32 [ %fd_fail.0345, %__add_arg.exit21 ], [ %fd_fail.0345, %__str_to_int.exit67 ], [ %fd_fail.0345, %__str_to_int.exit82 ], [ %fd_fail.0345, %__streq.exit87.thread132 ], [ %fd_fail.0345, %__streq.exit97.thread134 ], [ 1, %__streq.ex
  %save_all_writes_flag.0.be = phi i32 [ %save_all_writes_flag.0352, %__add_arg.exit21 ], [ %save_all_writes_flag.0352, %__str_to_int.exit67 ], [ %save_all_writes_flag.0352, %__str_to_int.exit82 ], [ %save_all_writes_flag.0352, %__streq.exit87.thread132 
  %sym_arg_num.0.be = phi i32 [ %75, %__add_arg.exit21 ], [ %sym_arg_num.0360, %__str_to_int.exit67 ], [ %sym_arg_num.0360, %__str_to_int.exit82 ], [ %sym_arg_num.0360, %__streq.exit87.thread132 ], [ %sym_arg_num.0360, %__streq.exit97.thread134 ], [ %sym
  %k.0.be = phi i32 [ %51, %__add_arg.exit21 ], [ %212, %__str_to_int.exit67 ], [ %251, %__str_to_int.exit82 ], [ %287, %__streq.exit87.thread132 ], [ %304, %__streq.exit97.thread134 ], [ %321, %__streq.exit117.thread136 ], [ %342, %__str_to_int.exit ], 
  %sym_stdout_flag.0.be = phi i32 [ %sym_stdout_flag.0378, %__add_arg.exit21 ], [ %sym_stdout_flag.0378, %__str_to_int.exit67 ], [ %sym_stdout_flag.0378, %__str_to_int.exit82 ], [ 1, %__streq.exit87.thread132 ], [ %sym_stdout_flag.0378, %__streq.exit97.t
  %sym_stdin_len.0.be = phi i32 [ %sym_stdin_len.0386, %__add_arg.exit21 ], [ %sym_stdin_len.0386, %__str_to_int.exit67 ], [ %269, %__str_to_int.exit82 ], [ %sym_stdin_len.0386, %__streq.exit87.thread132 ], [ %sym_stdin_len.0386, %__streq.exit97.thread13
  %sym_file_len.0.be = phi i32 [ %sym_file_len.0394, %__add_arg.exit21 ], [ %230, %__str_to_int.exit67 ], [ %sym_file_len.0394, %__str_to_int.exit82 ], [ %sym_file_len.0394, %__streq.exit87.thread132 ], [ %sym_file_len.0394, %__streq.exit97.thread134 ], 
  %sym_files.0.be = phi i32 [ %sym_files.0402, %__add_arg.exit21 ], [ %211, %__str_to_int.exit67 ], [ %sym_files.0402, %__str_to_int.exit82 ], [ %sym_files.0402, %__streq.exit87.thread132 ], [ %sym_files.0402, %__streq.exit97.thread134 ], [ %sym_files.04
  %270 = icmp slt i32 %k.0.be, %1, !dbg !3790
  br i1 %270, label %24, label %__streq.exit.thread._crit_edge, !dbg !3790

.lr.ph.i85:                                       ; preds = %273, %241
  %271 = phi i8 [ %276, %273 ], [ 45, %241 ]
  %.04.i83 = phi i8* [ %275, %273 ], [ getelementptr inbounds ([13 x i8]* @.str1547, i64 0, i64 0), %241 ]
  %.013.i84 = phi i8* [ %274, %273 ], [ %28, %241 ]
  %272 = icmp eq i8 %271, 0, !dbg !3911
  br i1 %272, label %__streq.exit87.thread132, label %273, !dbg !3911

; <label>:273                                     ; preds = %.lr.ph.i85
  %274 = getelementptr inbounds i8* %.013.i84, i64 1, !dbg !3913
  %275 = getelementptr inbounds i8* %.04.i83, i64 1, !dbg !3914
  %276 = load i8* %274, align 1, !dbg !3915, !tbaa !2142
  %277 = load i8* %275, align 1, !dbg !3915, !tbaa !2142
  %278 = icmp eq i8 %276, %277, !dbg !3915
  br i1 %278, label %.lr.ph.i85, label %.lr.ph.i90, !dbg !3915

.lr.ph.i90:                                       ; preds = %281, %273
  %279 = phi i8 [ %284, %281 ], [ 45, %273 ]
  %.04.i88 = phi i8* [ %283, %281 ], [ getelementptr inbounds ([12 x i8]* @.str1648, i64 0, i64 0), %273 ]
  %.013.i89 = phi i8* [ %282, %281 ], [ %28, %273 ]
  %280 = icmp eq i8 %279, 0, !dbg !3916
  br i1 %280, label %__streq.exit87.thread132, label %281, !dbg !3916

; <label>:281                                     ; preds = %.lr.ph.i90
  %282 = getelementptr inbounds i8* %.013.i89, i64 1, !dbg !3918
  %283 = getelementptr inbounds i8* %.04.i88, i64 1, !dbg !3919
  %284 = load i8* %282, align 1, !dbg !3920, !tbaa !2142
  %285 = load i8* %283, align 1, !dbg !3920, !tbaa !2142
  %286 = icmp eq i8 %284, %285, !dbg !3920
  br i1 %286, label %.lr.ph.i90, label %.lr.ph.i95, !dbg !3920

__streq.exit87.thread132:                         ; preds = %.lr.ph.i90, %.lr.ph.i85
  %287 = add nsw i32 %k.0369, 1, !dbg !3921
  br label %__streq.exit.thread.backedge, !dbg !3923

.lr.ph.i95:                                       ; preds = %290, %281
  %288 = phi i8 [ %293, %290 ], [ 45, %281 ]
  %.04.i93 = phi i8* [ %292, %290 ], [ getelementptr inbounds ([18 x i8]* @.str1749, i64 0, i64 0), %281 ]
  %.013.i94 = phi i8* [ %291, %290 ], [ %28, %281 ]
  %289 = icmp eq i8 %288, 0, !dbg !3924
  br i1 %289, label %__streq.exit97.thread134, label %290, !dbg !3924

; <label>:290                                     ; preds = %.lr.ph.i95
  %291 = getelementptr inbounds i8* %.013.i94, i64 1, !dbg !3926
  %292 = getelementptr inbounds i8* %.04.i93, i64 1, !dbg !3927
  %293 = load i8* %291, align 1, !dbg !3928, !tbaa !2142
  %294 = load i8* %292, align 1, !dbg !3928, !tbaa !2142
  %295 = icmp eq i8 %293, %294, !dbg !3928
  br i1 %295, label %.lr.ph.i95, label %.lr.ph.i120, !dbg !3928

.lr.ph.i120:                                      ; preds = %298, %290
  %296 = phi i8 [ %301, %298 ], [ 45, %290 ]
  %.04.i118 = phi i8* [ %300, %298 ], [ getelementptr inbounds ([17 x i8]* @.str1850, i64 0, i64 0), %290 ]
  %.013.i119 = phi i8* [ %299, %298 ], [ %28, %290 ]
  %297 = icmp eq i8 %296, 0, !dbg !3924
  br i1 %297, label %__streq.exit97.thread134, label %298, !dbg !3924

; <label>:298                                     ; preds = %.lr.ph.i120
  %299 = getelementptr inbounds i8* %.013.i119, i64 1, !dbg !3926
  %300 = getelementptr inbounds i8* %.04.i118, i64 1, !dbg !3927
  %301 = load i8* %299, align 1, !dbg !3928, !tbaa !2142
  %302 = load i8* %300, align 1, !dbg !3928, !tbaa !2142
  %303 = icmp eq i8 %301, %302, !dbg !3928
  br i1 %303, label %.lr.ph.i120, label %.lr.ph.i115, !dbg !3928

__streq.exit97.thread134:                         ; preds = %.lr.ph.i120, %.lr.ph.i95
  %304 = add nsw i32 %k.0369, 1, !dbg !3929
  br label %__streq.exit.thread.backedge, !dbg !3931

.lr.ph.i115:                                      ; preds = %307, %298
  %305 = phi i8 [ %310, %307 ], [ 45, %298 ]
  %.04.i113 = phi i8* [ %309, %307 ], [ getelementptr inbounds ([10 x i8]* @.str1951, i64 0, i64 0), %298 ]
  %.013.i114 = phi i8* [ %308, %307 ], [ %28, %298 ]
  %306 = icmp eq i8 %305, 0, !dbg !3932
  br i1 %306, label %__streq.exit117.thread136, label %307, !dbg !3932

; <label>:307                                     ; preds = %.lr.ph.i115
  %308 = getelementptr inbounds i8* %.013.i114, i64 1, !dbg !3934
  %309 = getelementptr inbounds i8* %.04.i113, i64 1, !dbg !3935
  %310 = load i8* %308, align 1, !dbg !3936, !tbaa !2142
  %311 = load i8* %309, align 1, !dbg !3936, !tbaa !2142
  %312 = icmp eq i8 %310, %311, !dbg !3936
  br i1 %312, label %.lr.ph.i115, label %.lr.ph.i110, !dbg !3936

.lr.ph.i110:                                      ; preds = %315, %307
  %313 = phi i8 [ %318, %315 ], [ 45, %307 ]
  %.04.i108 = phi i8* [ %317, %315 ], [ getelementptr inbounds ([9 x i8]* @.str2052, i64 0, i64 0), %307 ]
  %.013.i109 = phi i8* [ %316, %315 ], [ %28, %307 ]
  %314 = icmp eq i8 %313, 0, !dbg !3932
  br i1 %314, label %__streq.exit117.thread136, label %315, !dbg !3932

; <label>:315                                     ; preds = %.lr.ph.i110
  %316 = getelementptr inbounds i8* %.013.i109, i64 1, !dbg !3934
  %317 = getelementptr inbounds i8* %.04.i108, i64 1, !dbg !3935
  %318 = load i8* %316, align 1, !dbg !3936, !tbaa !2142
  %319 = load i8* %317, align 1, !dbg !3936, !tbaa !2142
  %320 = icmp eq i8 %318, %319, !dbg !3936
  br i1 %320, label %.lr.ph.i110, label %.lr.ph.i105, !dbg !3936

__streq.exit117.thread136:                        ; preds = %.lr.ph.i110, %.lr.ph.i115
  %321 = add nsw i32 %k.0369, 1, !dbg !3937
  br label %__streq.exit.thread.backedge, !dbg !3939

.lr.ph.i105:                                      ; preds = %324, %315
  %322 = phi i8 [ %327, %324 ], [ 45, %315 ]
  %.04.i103 = phi i8* [ %326, %324 ], [ getelementptr inbounds ([11 x i8]* @.str2153, i64 0, i64 0), %315 ]
  %.013.i104 = phi i8* [ %325, %324 ], [ %28, %315 ]
  %323 = icmp eq i8 %322, 0, !dbg !3940
  br i1 %323, label %__streq.exit107.thread138, label %324, !dbg !3940

; <label>:324                                     ; preds = %.lr.ph.i105
  %325 = getelementptr inbounds i8* %.013.i104, i64 1, !dbg !3942
  %326 = getelementptr inbounds i8* %.04.i103, i64 1, !dbg !3943
  %327 = load i8* %325, align 1, !dbg !3944, !tbaa !2142
  %328 = load i8* %326, align 1, !dbg !3944, !tbaa !2142
  %329 = icmp eq i8 %327, %328, !dbg !3944
  br i1 %329, label %.lr.ph.i105, label %.lr.ph.i100, !dbg !3944

.lr.ph.i100:                                      ; preds = %332, %324
  %330 = phi i8 [ %335, %332 ], [ 45, %324 ]
  %.04.i98 = phi i8* [ %334, %332 ], [ getelementptr inbounds ([10 x i8]* @.str2254, i64 0, i64 0), %324 ]
  %.013.i99 = phi i8* [ %333, %332 ], [ %28, %324 ]
  %331 = icmp eq i8 %330, 0, !dbg !3940
  br i1 %331, label %__streq.exit107.thread138, label %332, !dbg !3940

; <label>:332                                     ; preds = %.lr.ph.i100
  %333 = getelementptr inbounds i8* %.013.i99, i64 1, !dbg !3942
  %334 = getelementptr inbounds i8* %.04.i98, i64 1, !dbg !3943
  %335 = load i8* %333, align 1, !dbg !3944, !tbaa !2142
  %336 = load i8* %334, align 1, !dbg !3944, !tbaa !2142
  %337 = icmp eq i8 %335, %336, !dbg !3944
  br i1 %337, label %.lr.ph.i100, label %.loopexit162, !dbg !3944

__streq.exit107.thread138:                        ; preds = %.lr.ph.i100, %.lr.ph.i105
  %338 = add nsw i32 %k.0369, 1, !dbg !3945
  %339 = icmp eq i32 %338, %1, !dbg !3945
  br i1 %339, label %340, label %341, !dbg !3945

; <label>:340                                     ; preds = %__streq.exit107.thread138
  call fastcc void @__emit_error(i8* getelementptr inbounds ([54 x i8]* @.str2355, i64 0, i64 0)), !dbg !3947
  unreachable

; <label>:341                                     ; preds = %__streq.exit107.thread138
  %342 = add nsw i32 %k.0369, 2, !dbg !3948
  %343 = sext i32 %338 to i64, !dbg !3948
  %344 = getelementptr inbounds i8** %2, i64 %343, !dbg !3948
  %345 = load i8** %344, align 8, !dbg !3948, !tbaa !3778
  %346 = load i8* %345, align 1, !dbg !3949, !tbaa !2142
  %347 = icmp eq i8 %346, 0, !dbg !3949
  br i1 %347, label %348, label %.lr.ph.i10, !dbg !3949

; <label>:348                                     ; preds = %341
  call fastcc void @__emit_error(i8* getelementptr inbounds ([54 x i8]* @.str2355, i64 0, i64 0)) #8, !dbg !3949
  unreachable

.lr.ph.i10:                                       ; preds = %352, %341
  %349 = phi i8 [ %357, %352 ], [ %346, %341 ]
  %s.pn.i = phi i8* [ %350, %352 ], [ %345, %341 ]
  %res.02.i = phi i64 [ %356, %352 ], [ 0, %341 ]
  %350 = getelementptr inbounds i8* %s.pn.i, i64 1, !dbg !3950
  %.off.i = add i8 %349, -48, !dbg !3951
  %351 = icmp ult i8 %.off.i, 10, !dbg !3951
  br i1 %351, label %352, label %359, !dbg !3951

; <label>:352                                     ; preds = %.lr.ph.i10
  %353 = sext i8 %349 to i64, !dbg !3952
  %354 = mul nsw i64 %res.02.i, 10, !dbg !3953
  %355 = add i64 %353, -48, !dbg !3953
  %356 = add i64 %355, %354, !dbg !3953
  %357 = load i8* %350, align 1, !dbg !3950, !tbaa !2142
  %358 = icmp eq i8 %357, 0, !dbg !3950
  br i1 %358, label %__str_to_int.exit, label %.lr.ph.i10, !dbg !3950

; <label>:359                                     ; preds = %.lr.ph.i10
  call fastcc void @__emit_error(i8* getelementptr inbounds ([54 x i8]* @.str2355, i64 0, i64 0)) #8, !dbg !3954
  unreachable

__str_to_int.exit:                                ; preds = %352
  %360 = trunc i64 %356 to i32, !dbg !3948
  br label %__streq.exit.thread.backedge, !dbg !3955

.loopexit162:                                     ; preds = %332, %24
  %361 = icmp eq i32 %25, 1024, !dbg !3956
  br i1 %361, label %362, label %__add_arg.exit, !dbg !3956

; <label>:362                                     ; preds = %.loopexit162
  call fastcc void @__emit_error(i8* getelementptr inbounds ([37 x i8]* @.str2456, i64 0, i64 0)) #8, !dbg !3959
  unreachable

__add_arg.exit:                                   ; preds = %.loopexit162
  %363 = add nsw i32 %k.0369, 1, !dbg !3957
  %364 = sext i32 %25 to i64, !dbg !3960
  %365 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %364, !dbg !3960
  store i8* %28, i8** %365, align 8, !dbg !3960, !tbaa !3778
  %366 = add nsw i32 %25, 1, !dbg !3961
  br label %__streq.exit.thread.backedge

__streq.exit.thread._crit_edge:                   ; preds = %__streq.exit.thread.backedge, %__streq.exit.thread.preheader
  %sym_files.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %sym_files.0.be, %__streq.exit.thread.backedge ]
  %sym_file_len.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %sym_file_len.0.be, %__streq.exit.thread.backedge ]
  %sym_stdin_len.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %sym_stdin_len.0.be, %__streq.exit.thread.backedge ]
  %sym_stdout_flag.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %sym_stdout_flag.0.be, %__streq.exit.thread.backedge ]
  %save_all_writes_flag.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %save_all_writes_flag.0.be, %__streq.exit.thread.backedge ]
  %fd_fail.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %fd_fail.0.be, %__streq.exit.thread.backedge ]
  %.lcssa176 = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %.be, %__streq.exit.thread.backedge ]
  %367 = add nsw i32 %.lcssa176, 1, !dbg !3962
  %368 = sext i32 %367 to i64, !dbg !3962
  %int_cast_to_i64 = bitcast i64 3 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i64), !dbg !3962
  %369 = shl nsw i64 %368, 3, !dbg !3962
  %370 = call noalias i8* @malloc(i64 %369) #8, !dbg !3962
  %371 = bitcast i8* %370 to i8**, !dbg !3962
  call void @klee_mark_global(i8* %370) #8, !dbg !3963
  %372 = sext i32 %.lcssa176 to i64, !dbg !3964
  %int_cast_to_i641 = bitcast i64 3 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !3964
  %373 = shl nsw i64 %372, 3, !dbg !3964
  %374 = call i8* @memcpy(i8* %370, i8* %3, i64 %373)
  %375 = getelementptr inbounds i8** %371, i64 %372, !dbg !3965
  store i8* null, i8** %375, align 8, !dbg !3965, !tbaa !3778
  store i32 %.lcssa176, i32* %argcPtr, align 4, !dbg !3966, !tbaa !2189
  store i8** %371, i8*** %argvPtr, align 8, !dbg !3967, !tbaa !3778
  call void @klee_init_fds(i32 %sym_files.0.lcssa, i32 %sym_file_len.0.lcssa, i32 %sym_stdin_len.0.lcssa, i32 %sym_stdout_flag.0.lcssa, i32 %save_all_writes_flag.0.lcssa, i32 %fd_fail.0.lcssa) #8, !dbg !3968
  ret void, !dbg !3969
}

declare void @klee_mark_global(i8*) #6

; Function Attrs: nounwind uwtable
define weak i32 @__syscall_rt_sigaction(i32 %signum, %struct.sigaction* %act, %struct.sigaction* %oldact, i64 %_something) #3 {
  tail call void @klee_warning_once(i8* getelementptr inbounds ([18 x i8]* @.str58, i64 0, i64 0)) #8, !dbg !3970
  ret i32 0, !dbg !3971
}

; Function Attrs: nounwind uwtable
define weak i32 @sigaction(i32 %signum, %struct.sigaction* %act, %struct.sigaction* %oldact) #3 {
  tail call void @klee_warning_once(i8* getelementptr inbounds ([18 x i8]* @.str58, i64 0, i64 0)) #8, !dbg !3972
  ret i32 0, !dbg !3973
}

; Function Attrs: nounwind uwtable
define weak i32 @sigprocmask(i32 %how, %struct.__sigset_t* %set, %struct.__sigset_t* %oldset) #3 {
  tail call void @klee_warning_once(i8* getelementptr inbounds ([18 x i8]* @.str58, i64 0, i64 0)) #8, !dbg !3974
  ret i32 0, !dbg !3975
}

; Function Attrs: nounwind uwtable
define weak i32 @fdatasync(i32 %fd) #3 {
  ret i32 0, !dbg !3976
}

; Function Attrs: nounwind uwtable
define weak void @sync() #3 {
  ret void, !dbg !3977
}

; Function Attrs: nounwind uwtable
define weak i32 @__socketcall(i32 %type, i32* %args) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([24 x i8]* @.str159, i64 0, i64 0)) #8, !dbg !3978
  %1 = tail call i32* @__errno_location() #4, !dbg !3979
  store i32 97, i32* %1, align 4, !dbg !3979, !tbaa !2189
  ret i32 -1, !dbg !3980
}

; Function Attrs: nounwind uwtable
define weak i32 @_IO_getc(%struct._IO_FILE* %f) #3 {
  %1 = tail call i32 @__fgetc_unlocked(%struct._IO_FILE* %f) #8, !dbg !3981
  ret i32 %1, !dbg !3981
}

declare i32 @__fgetc_unlocked(%struct._IO_FILE*) #6

; Function Attrs: nounwind uwtable
define weak i32 @_IO_putc(i32 %c, %struct._IO_FILE* %f) #3 {
  %1 = tail call i32 @__fputc_unlocked(i32 %c, %struct._IO_FILE* %f) #8, !dbg !3982
  ret i32 %1, !dbg !3982
}

declare i32 @__fputc_unlocked(i32, %struct._IO_FILE*) #6

; Function Attrs: nounwind uwtable
define weak i32 @mkdir(i8* %pathname, i32 %mode) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([15 x i8]* @.str260, i64 0, i64 0)) #8, !dbg !3983
  %1 = tail call i32* @__errno_location() #4, !dbg !3984
  store i32 5, i32* %1, align 4, !dbg !3984, !tbaa !2189
  ret i32 -1, !dbg !3985
}

; Function Attrs: nounwind uwtable
define weak i32 @mkfifo(i8* %pathname, i32 %mode) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([15 x i8]* @.str260, i64 0, i64 0)) #8, !dbg !3986
  %1 = tail call i32* @__errno_location() #4, !dbg !3987
  store i32 5, i32* %1, align 4, !dbg !3987, !tbaa !2189
  ret i32 -1, !dbg !3988
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @mknod(i8* nocapture readnone %pathname, i32 %mode, i64 %dev) #9 {
  tail call void @klee_warning(i8* getelementptr inbounds ([15 x i8]* @.str260, i64 0, i64 0)) #8, !dbg !3989
  %1 = tail call i32* @__errno_location() #4, !dbg !3990
  store i32 5, i32* %1, align 4, !dbg !3990, !tbaa !2189
  ret i32 -1, !dbg !3991
}

; Function Attrs: nounwind uwtable
define weak i32 @pipe(i32* %filedes) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str361, i64 0, i64 0)) #8, !dbg !3992
  %1 = tail call i32* @__errno_location() #4, !dbg !3993
  store i32 23, i32* %1, align 4, !dbg !3993, !tbaa !2189
  ret i32 -1, !dbg !3994
}

; Function Attrs: nounwind uwtable
define weak i32 @link(i8* %oldpath, i8* %newpath) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !3995
  %1 = tail call i32* @__errno_location() #4, !dbg !3996
  store i32 1, i32* %1, align 4, !dbg !3996, !tbaa !2189
  ret i32 -1, !dbg !3997
}

; Function Attrs: nounwind uwtable
define weak i32 @symlink(i8* %oldpath, i8* %newpath) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !3998
  %1 = tail call i32* @__errno_location() #4, !dbg !3999
  store i32 1, i32* %1, align 4, !dbg !3999, !tbaa !2189
  ret i32 -1, !dbg !4000
}

; Function Attrs: nounwind uwtable
define weak i32 @rename(i8* %oldpath, i8* %newpath) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4001
  %1 = tail call i32* @__errno_location() #4, !dbg !4002
  store i32 1, i32* %1, align 4, !dbg !4002, !tbaa !2189
  ret i32 -1, !dbg !4003
}

; Function Attrs: nounwind uwtable
define weak i32 @nanosleep(%struct.timespec* %req, %struct.timespec* %rem) #3 {
  ret i32 0, !dbg !4004
}

; Function Attrs: nounwind uwtable
define weak i32 @clock_gettime(i32 %clk_id, %struct.timespec* %res) #3 {
  %tv = alloca %struct.timeval, align 8
  %1 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #8, !dbg !4005
  %2 = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 0, !dbg !4006
  %3 = load i64* %2, align 8, !dbg !4006, !tbaa !2369
  %4 = getelementptr inbounds %struct.timespec* %res, i64 0, i32 0, !dbg !4006
  store i64 %3, i64* %4, align 8, !dbg !4006, !tbaa !4007
  %5 = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 1, !dbg !4008
  %6 = load i64* %5, align 8, !dbg !4008, !tbaa !4009
  %7 = mul nsw i64 %6, 1000, !dbg !4008
  %8 = getelementptr inbounds %struct.timespec* %res, i64 0, i32 1, !dbg !4008
  store i64 %7, i64* %8, align 8, !dbg !4008, !tbaa !4010
  ret i32 0, !dbg !4011
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #5

; Function Attrs: nounwind uwtable
define weak i32 @clock_settime(i32 %clk_id, %struct.timespec* %res) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4012
  %1 = tail call i32* @__errno_location() #4, !dbg !4013
  store i32 1, i32* %1, align 4, !dbg !4013, !tbaa !2189
  ret i32 -1, !dbg !4014
}

; Function Attrs: nounwind uwtable
define i64 @time(i64* %t) #3 {
  %tv = alloca %struct.timeval, align 8
  %1 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #8, !dbg !4015
  %2 = icmp eq i64* %t, null, !dbg !4016
  %.phi.trans.insert = getelementptr inbounds %struct.timeval* %tv, i64 0, i32 0
  %.pre = load i64* %.phi.trans.insert, align 8, !dbg !4018, !tbaa !2369
  br i1 %2, label %._crit_edge, label %3, !dbg !4016

; <label>:3                                       ; preds = %0
  store i64 %.pre, i64* %t, align 8, !dbg !4019, !tbaa !3470
  br label %._crit_edge, !dbg !4019

._crit_edge:                                      ; preds = %3, %0
  ret i64 %.pre, !dbg !4018
}

; Function Attrs: nounwind uwtable
define i64 @times(%struct.tms* %buf) #3 {
  %1 = icmp eq %struct.tms* %buf, null, !dbg !4020
  br i1 %1, label %2, label %3, !dbg !4020

; <label>:2                                       ; preds = %0
  tail call void @klee_warning(i8* getelementptr inbounds ([13 x i8]* @.str563, i64 0, i64 0)) #8, !dbg !4022
  br label %6, !dbg !4022

; <label>:3                                       ; preds = %0
  tail call void @klee_warning(i8* getelementptr inbounds ([40 x i8]* @.str664, i64 0, i64 0)) #8, !dbg !4023
  %4 = bitcast %struct.tms* %buf to i8*
  %5 = call i8* @memset(i8* %4, i32 0, i64 32)
  br label %6

; <label>:6                                       ; preds = %3, %2
  ret i64 0, !dbg !4025
}

; Function Attrs: nounwind uwtable
define weak %struct.utmpx* @getutxent() #3 {
  %1 = tail call %struct.utmp* @getutent() #8, !dbg !4026
  %2 = bitcast %struct.utmp* %1 to %struct.utmpx*, !dbg !4026
  ret %struct.utmpx* %2, !dbg !4026
}

; Function Attrs: nounwind
declare %struct.utmp* @getutent() #5

; Function Attrs: nounwind uwtable
define weak void @setutxent() #3 {
  tail call void @setutent() #8, !dbg !4027
  ret void, !dbg !4028
}

; Function Attrs: nounwind
declare void @setutent() #5

; Function Attrs: nounwind uwtable
define weak void @endutxent() #3 {
  tail call void @endutent() #8, !dbg !4029
  ret void, !dbg !4030
}

; Function Attrs: nounwind
declare void @endutent() #5

; Function Attrs: nounwind uwtable
define weak i32 @utmpxname(i8* %file) #3 {
  %1 = tail call i32 @utmpname(i8* %file) #8, !dbg !4031
  ret i32 0, !dbg !4032
}

; Function Attrs: nounwind
declare i32 @utmpname(i8*) #5

; Function Attrs: nounwind uwtable
define weak i32 @euidaccess(i8* %pathname, i32 %mode) #3 {
  %1 = tail call i32 @access(i8* %pathname, i32 %mode) #8, !dbg !4033
  ret i32 %1, !dbg !4033
}

; Function Attrs: nounwind uwtable
define weak i32 @eaccess(i8* %pathname, i32 %mode) #3 {
  %1 = tail call i32 @euidaccess(i8* %pathname, i32 %mode) #8, !dbg !4034
  ret i32 %1, !dbg !4034
}

; Function Attrs: nounwind uwtable
define weak i32 @group_member(i32 %__gid) #3 {
  %1 = tail call i32 @getgid() #8, !dbg !4035
  %2 = icmp eq i32 %1, %__gid, !dbg !4035
  br i1 %2, label %6, label %3, !dbg !4035

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @getegid() #8, !dbg !4035
  %5 = icmp eq i32 %4, %__gid, !dbg !4035
  br label %6, !dbg !4035

; <label>:6                                       ; preds = %3, %0
  %7 = phi i1 [ true, %0 ], [ %5, %3 ]
  %8 = zext i1 %7 to i32, !dbg !4035
  ret i32 %8, !dbg !4035
}

; Function Attrs: nounwind
declare i32 @getegid() #5

; Function Attrs: nounwind uwtable
define weak i32 @utime(i8* %filename, %struct.utimbuf* %buf) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4036
  %1 = tail call i32* @__errno_location() #4, !dbg !4037
  store i32 1, i32* %1, align 4, !dbg !4037, !tbaa !2189
  ret i32 -1, !dbg !4038
}

; Function Attrs: nounwind uwtable
define weak i32 @futimes(i32 %fd, %struct.timeval* %times) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str765, i64 0, i64 0)) #8, !dbg !4039
  %1 = tail call i32* @__errno_location() #4, !dbg !4040
  store i32 9, i32* %1, align 4, !dbg !4040, !tbaa !2189
  ret i32 -1, !dbg !4041
}

; Function Attrs: nounwind readonly uwtable
define i32 @strverscmp(i8* nocapture readonly %__s1, i8* nocapture readonly %__s2) #13 {
  %1 = tail call i32 @strcmp(i8* %__s1, i8* %__s2) #8, !dbg !4042
  ret i32 %1, !dbg !4042
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #14

; Function Attrs: inlinehint nounwind readnone uwtable
define i32 @gnu_dev_major(i64 %__dev) #15 {
  %int_cast_to_i64 = bitcast i64 8 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i64), !dbg !4043
  %1 = lshr i64 %__dev, 8, !dbg !4043
  %2 = and i64 %1, 4095, !dbg !4043
  %int_cast_to_i641 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !4043
  %3 = lshr i64 %__dev, 32, !dbg !4043
  %4 = and i64 %3, 4294963200, !dbg !4043
  %5 = or i64 %2, %4, !dbg !4043
  %6 = trunc i64 %5 to i32, !dbg !4043
  ret i32 %6, !dbg !4043
}

; Function Attrs: inlinehint nounwind readnone uwtable
define i32 @gnu_dev_minor(i64 %__dev) #15 {
  %1 = and i64 %__dev, 255, !dbg !4044
  %int_cast_to_i64 = bitcast i64 12 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i64), !dbg !4044
  %2 = lshr i64 %__dev, 12, !dbg !4044
  %3 = and i64 %2, 4294967040, !dbg !4044
  %4 = or i64 %3, %1, !dbg !4044
  %5 = trunc i64 %4 to i32, !dbg !4044
  ret i32 %5, !dbg !4044
}

; Function Attrs: inlinehint nounwind readnone uwtable
define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) #15 {
  %1 = and i32 %__minor, 255, !dbg !4045
  %int_cast_to_i64 = zext i32 8 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4045
  %2 = shl i32 %__major, 8, !dbg !4045
  %3 = and i32 %2, 1048320, !dbg !4045
  %4 = or i32 %1, %3, !dbg !4045
  %5 = zext i32 %4 to i64, !dbg !4045
  %6 = and i32 %__minor, -256, !dbg !4045
  %7 = zext i32 %6 to i64, !dbg !4045
  %int_cast_to_i641 = bitcast i64 12 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i641), !dbg !4045
  %8 = shl nuw nsw i64 %7, 12, !dbg !4045
  %9 = and i32 %__major, -4096, !dbg !4045
  %10 = zext i32 %9 to i64, !dbg !4045
  %int_cast_to_i642 = bitcast i64 32 to i64
  call void @klee_overshift_check(i64 64, i64 %int_cast_to_i642), !dbg !4045
  %11 = shl nuw i64 %10, 32, !dbg !4045
  %12 = or i64 %8, %11, !dbg !4045
  %13 = or i64 %12, %5, !dbg !4045
  ret i64 %13, !dbg !4045
}

; Function Attrs: nounwind uwtable
define weak i8* @canonicalize_file_name(i8* %name) #3 {
  %1 = tail call i8* @realpath(i8* %name, i8* null) #8, !dbg !4046
  ret i8* %1, !dbg !4046
}

; Function Attrs: nounwind
declare i8* @realpath(i8* nocapture readonly, i8*) #5

; Function Attrs: nounwind uwtable
define weak i32 @getloadavg(double* %loadavg, i32 %nelem) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([21 x i8]* @.str866, i64 0, i64 0)) #8, !dbg !4047
  ret i32 -1, !dbg !4048
}

; Function Attrs: nounwind uwtable
define weak i32 @wait(i32* %status) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str967, i64 0, i64 0)) #8, !dbg !4049
  %1 = tail call i32* @__errno_location() #4, !dbg !4050
  store i32 10, i32* %1, align 4, !dbg !4050, !tbaa !2189
  ret i32 -1, !dbg !4051
}

; Function Attrs: nounwind uwtable
define weak i32 @wait3(i32* %status, i32 %options, %struct.rusage* %rusage) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str967, i64 0, i64 0)) #8, !dbg !4052
  %1 = tail call i32* @__errno_location() #4, !dbg !4053
  store i32 10, i32* %1, align 4, !dbg !4053, !tbaa !2189
  ret i32 -1, !dbg !4054
}

; Function Attrs: nounwind uwtable
define weak i32 @wait4(i32 %pid, i32* %status, i32 %options, %struct.rusage* %rusage) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str967, i64 0, i64 0)) #8, !dbg !4055
  %1 = tail call i32* @__errno_location() #4, !dbg !4056
  store i32 10, i32* %1, align 4, !dbg !4056, !tbaa !2189
  ret i32 -1, !dbg !4057
}

; Function Attrs: nounwind uwtable
define weak i32 @waitpid(i32 %pid, i32* %status, i32 %options) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str967, i64 0, i64 0)) #8, !dbg !4058
  %1 = tail call i32* @__errno_location() #4, !dbg !4059
  store i32 10, i32* %1, align 4, !dbg !4059, !tbaa !2189
  ret i32 -1, !dbg !4060
}

; Function Attrs: nounwind uwtable
define weak i32 @waitid(i32 %idtype, i32 %id, %struct.siginfo_t* %infop, i32 %options) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str967, i64 0, i64 0)) #8, !dbg !4061
  %1 = tail call i32* @__errno_location() #4, !dbg !4062
  store i32 10, i32* %1, align 4, !dbg !4062, !tbaa !2189
  ret i32 -1, !dbg !4063
}

; Function Attrs: nounwind uwtable
define weak i32 @mount(i8* %source, i8* %target, i8* %filesystemtype, i64 %mountflags, i8* %data) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4064
  %1 = tail call i32* @__errno_location() #4, !dbg !4065
  store i32 1, i32* %1, align 4, !dbg !4065, !tbaa !2189
  ret i32 -1, !dbg !4066
}

; Function Attrs: nounwind uwtable
define weak i32 @umount(i8* %target) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4067
  %1 = tail call i32* @__errno_location() #4, !dbg !4068
  store i32 1, i32* %1, align 4, !dbg !4068, !tbaa !2189
  ret i32 -1, !dbg !4069
}

; Function Attrs: nounwind uwtable
define weak i32 @umount2(i8* %target, i32 %flags) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4070
  %1 = tail call i32* @__errno_location() #4, !dbg !4071
  store i32 1, i32* %1, align 4, !dbg !4071, !tbaa !2189
  ret i32 -1, !dbg !4072
}

; Function Attrs: nounwind uwtable
define weak i32 @swapon(i8* %path, i32 %swapflags) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4073
  %1 = tail call i32* @__errno_location() #4, !dbg !4074
  store i32 1, i32* %1, align 4, !dbg !4074, !tbaa !2189
  ret i32 -1, !dbg !4075
}

; Function Attrs: nounwind uwtable
define weak i32 @swapoff(i8* %path) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4076
  %1 = tail call i32* @__errno_location() #4, !dbg !4077
  store i32 1, i32* %1, align 4, !dbg !4077, !tbaa !2189
  ret i32 -1, !dbg !4078
}

; Function Attrs: nounwind uwtable
define weak i32 @setgid(i32 %gid) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str1068, i64 0, i64 0)) #8, !dbg !4079
  ret i32 0, !dbg !4080
}

; Function Attrs: nounwind uwtable
define weak i32 @setgroups(i64 %size, i32* %list) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4081
  %1 = tail call i32* @__errno_location() #4, !dbg !4082
  store i32 1, i32* %1, align 4, !dbg !4082, !tbaa !2189
  ret i32 -1, !dbg !4083
}

; Function Attrs: nounwind uwtable
define weak i32 @sethostname(i8* %name, i64 %len) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4084
  %1 = tail call i32* @__errno_location() #4, !dbg !4085
  store i32 1, i32* %1, align 4, !dbg !4085, !tbaa !2189
  ret i32 -1, !dbg !4086
}

; Function Attrs: nounwind uwtable
define weak i32 @setpgid(i32 %pid, i32 %pgid) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4087
  %1 = tail call i32* @__errno_location() #4, !dbg !4088
  store i32 1, i32* %1, align 4, !dbg !4088, !tbaa !2189
  ret i32 -1, !dbg !4089
}

; Function Attrs: nounwind uwtable
define weak i32 @setpgrp() #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4090
  %1 = tail call i32* @__errno_location() #4, !dbg !4091
  store i32 1, i32* %1, align 4, !dbg !4091, !tbaa !2189
  ret i32 -1, !dbg !4092
}

; Function Attrs: nounwind uwtable
define weak i32 @setpriority(i32 %which, i32 %who, i32 %prio) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4093
  %1 = tail call i32* @__errno_location() #4, !dbg !4094
  store i32 1, i32* %1, align 4, !dbg !4094, !tbaa !2189
  ret i32 -1, !dbg !4095
}

; Function Attrs: nounwind uwtable
define weak i32 @setresgid(i32 %rgid, i32 %egid, i32 %sgid) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4096
  %1 = tail call i32* @__errno_location() #4, !dbg !4097
  store i32 1, i32* %1, align 4, !dbg !4097, !tbaa !2189
  ret i32 -1, !dbg !4098
}

; Function Attrs: nounwind uwtable
define weak i32 @setresuid(i32 %ruid, i32 %euid, i32 %suid) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4099
  %1 = tail call i32* @__errno_location() #4, !dbg !4100
  store i32 1, i32* %1, align 4, !dbg !4100, !tbaa !2189
  ret i32 -1, !dbg !4101
}

; Function Attrs: nounwind uwtable
define weak i32 @setrlimit(i32 %resource, %struct.rlimit* %rlim) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4102
  %1 = tail call i32* @__errno_location() #4, !dbg !4103
  store i32 1, i32* %1, align 4, !dbg !4103, !tbaa !2189
  ret i32 -1, !dbg !4104
}

; Function Attrs: nounwind uwtable
define weak i32 @setrlimit64(i32 %resource, %struct.rlimit64* %rlim) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4105
  %1 = tail call i32* @__errno_location() #4, !dbg !4106
  store i32 1, i32* %1, align 4, !dbg !4106, !tbaa !2189
  ret i32 -1, !dbg !4107
}

; Function Attrs: nounwind uwtable
define weak i32 @setsid() #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4108
  %1 = tail call i32* @__errno_location() #4, !dbg !4109
  store i32 1, i32* %1, align 4, !dbg !4109, !tbaa !2189
  ret i32 -1, !dbg !4110
}

; Function Attrs: nounwind uwtable
define weak i32 @settimeofday(%struct.timeval* %tv, %struct.timezone* %tz) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4111
  %1 = tail call i32* @__errno_location() #4, !dbg !4112
  store i32 1, i32* %1, align 4, !dbg !4112, !tbaa !2189
  ret i32 -1, !dbg !4113
}

; Function Attrs: nounwind uwtable
define weak i32 @setuid(i32 %uid) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str1068, i64 0, i64 0)) #8, !dbg !4114
  ret i32 0, !dbg !4115
}

; Function Attrs: nounwind uwtable
define weak i32 @reboot(i32 %flag) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4116
  %1 = tail call i32* @__errno_location() #4, !dbg !4117
  store i32 1, i32* %1, align 4, !dbg !4117, !tbaa !2189
  ret i32 -1, !dbg !4118
}

; Function Attrs: nounwind uwtable
define weak i32 @mlock(i8* %addr, i64 %len) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4119
  %1 = tail call i32* @__errno_location() #4, !dbg !4120
  store i32 1, i32* %1, align 4, !dbg !4120, !tbaa !2189
  ret i32 -1, !dbg !4121
}

; Function Attrs: nounwind uwtable
define weak i32 @munlock(i8* %addr, i64 %len) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4122
  %1 = tail call i32* @__errno_location() #4, !dbg !4123
  store i32 1, i32* %1, align 4, !dbg !4123, !tbaa !2189
  ret i32 -1, !dbg !4124
}

; Function Attrs: nounwind uwtable
define weak i32 @pause() #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4125
  %1 = tail call i32* @__errno_location() #4, !dbg !4126
  store i32 1, i32* %1, align 4, !dbg !4126, !tbaa !2189
  ret i32 -1, !dbg !4127
}

; Function Attrs: nounwind uwtable
define weak i64 @readahead(i32 %fd, i64* %offset, i64 %count) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4128
  %1 = tail call i32* @__errno_location() #4, !dbg !4129
  store i32 1, i32* %1, align 4, !dbg !4129, !tbaa !2189
  ret i64 -1, !dbg !4130
}

; Function Attrs: nounwind uwtable
define weak i8* @mmap(i8* %start, i64 %length, i32 %prot, i32 %flags, i32 %fd, i64 %offset) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4131
  %1 = tail call i32* @__errno_location() #4, !dbg !4132
  store i32 1, i32* %1, align 4, !dbg !4132, !tbaa !2189
  ret i8* inttoptr (i64 -1 to i8*), !dbg !4133
}

; Function Attrs: nounwind uwtable
define weak i8* @mmap64(i8* %start, i64 %length, i32 %prot, i32 %flags, i32 %fd, i64 %offset) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4134
  %1 = tail call i32* @__errno_location() #4, !dbg !4135
  store i32 1, i32* %1, align 4, !dbg !4135, !tbaa !2189
  ret i8* inttoptr (i64 -1 to i8*), !dbg !4136
}

; Function Attrs: nounwind uwtable
define weak i32 @munmap(i8* %start, i64 %length) #3 {
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str462, i64 0, i64 0)) #8, !dbg !4137
  %1 = tail call i32* @__errno_location() #4, !dbg !4138
  store i32 1, i32* %1, align 4, !dbg !4138, !tbaa !2189
  ret i32 -1, !dbg !4139
}

; Function Attrs: nounwind uwtable
define internal fastcc void @__create_new_dfile(%struct.exe_disk_file_t* nocapture %dfile, i32 %size, i8* %name, %struct.stat64* nocapture readonly %defaults) #3 {
  %sname = alloca [64 x i8], align 16
  %1 = call noalias i8* @malloc(i64 144) #8, !dbg !4140
  %2 = bitcast i8* %1 to %struct.stat64*, !dbg !4140
  %3 = getelementptr inbounds [64 x i8]* %sname, i64 0, i64 0, !dbg !4141
  %4 = load i8* %name, align 1, !dbg !4142, !tbaa !2142
  %5 = icmp eq i8 %4, 0, !dbg !4142
  %6 = ptrtoint i8* %name to i64, !dbg !4144
  br i1 %5, label %._crit_edge, label %.lr.ph, !dbg !4142

.lr.ph:                                           ; preds = %.lr.ph, %0
  %7 = phi i8* [ %14, %.lr.ph ], [ %3, %0 ]
  %8 = phi i8 [ %10, %.lr.ph ], [ %4, %0 ]
  %sp.01 = phi i8* [ %9, %.lr.ph ], [ %name, %0 ]
  store i8 %8, i8* %7, align 1, !dbg !4145, !tbaa !2142
  %9 = getelementptr inbounds i8* %sp.01, i64 1, !dbg !4142
  %10 = load i8* %9, align 1, !dbg !4142, !tbaa !2142
  %11 = icmp eq i8 %10, 0, !dbg !4142
  %12 = ptrtoint i8* %9 to i64, !dbg !4144
  %13 = sub i64 %12, %6, !dbg !4144
  %14 = getelementptr inbounds [64 x i8]* %sname, i64 0, i64 %13, !dbg !4144
  br i1 %11, label %._crit_edge, label %.lr.ph, !dbg !4142

._crit_edge:                                      ; preds = %.lr.ph, %0
  %.lcssa = phi i8* [ %3, %0 ], [ %14, %.lr.ph ]
  %15 = call i8* @memcpy(i8* %.lcssa, i8* getelementptr inbounds ([6 x i8]* @.str918, i64 0, i64 0), i64 6)
  %16 = icmp eq i32 %size, 0, !dbg !4146
  br i1 %16, label %17, label %18, !dbg !4146

; <label>:17                                      ; preds = %._crit_edge
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8]* @.str1019, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str1120, i64 0, i64 0), i32 55, i8* getelementptr inbounds ([88 x i8]* @__PRETTY_FUNCTION__.__create_new_dfile, i64 0, i64
  unreachable, !dbg !4146

; <label>:18                                      ; preds = %._crit_edge
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i64 0, i32 0, !dbg !4147
  store i32 %size, i32* %19, align 4, !dbg !4147, !tbaa !2515
  %20 = zext i32 %size to i64, !dbg !4148
  %21 = call noalias i8* @malloc(i64 %20) #8, !dbg !4148
  %22 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i64 0, i32 1, !dbg !4148
  store i8* %21, i8** %22, align 8, !dbg !4148, !tbaa !2521
  call void @klee_make_symbolic(i8* %21, i64 %20, i8* %name) #8, !dbg !4149
  call void @klee_make_symbolic(i8* %1, i64 144, i8* %3) #8, !dbg !4150
  %23 = getelementptr inbounds i8* %1, i64 8, !dbg !4151
  %24 = bitcast i8* %23 to i64*, !dbg !4151
  %25 = load i64* %24, align 8, !dbg !4151, !tbaa !2159
  %26 = call i32 @klee_is_symbolic(i64 %25) #8, !dbg !4151
  %27 = icmp eq i32 %26, 0, !dbg !4151
  %28 = load i64* %24, align 8, !dbg !4151, !tbaa !2159
  %29 = and i64 %28, 2147483647, !dbg !4151
  %30 = icmp eq i64 %29, 0, !dbg !4151
  %or.cond = and i1 %27, %30, !dbg !4151
  br i1 %or.cond, label %31, label %._crit_edge3, !dbg !4151

; <label>:31                                      ; preds = %18
  %32 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 1, !dbg !4153
  %33 = load i64* %32, align 8, !dbg !4153, !tbaa !2159
  store i64 %33, i64* %24, align 8, !dbg !4153, !tbaa !2159
  br label %._crit_edge3, !dbg !4153

._crit_edge3:                                     ; preds = %31, %18
  %34 = phi i64 [ %33, %31 ], [ %28, %18 ]
  %35 = and i64 %34, 2147483647, !dbg !4154
  %36 = icmp ne i64 %35, 0, !dbg !4154
  %37 = zext i1 %36 to i64, !dbg !4154
  call void @klee_assume(i64 %37) #8, !dbg !4154
  %38 = getelementptr inbounds i8* %1, i64 56, !dbg !4155
  %39 = bitcast i8* %38 to i64*, !dbg !4155
  %40 = load i64* %39, align 8, !dbg !4155, !tbaa !4156
  %41 = icmp ult i64 %40, 65536, !dbg !4155
  %42 = zext i1 %41 to i64, !dbg !4155
  call void @klee_assume(i64 %42) #8, !dbg !4155
  %43 = getelementptr inbounds i8* %1, i64 24, !dbg !4157
  %44 = bitcast i8* %43 to i32*, !dbg !4157
  %45 = load i32* %44, align 4, !dbg !4157, !tbaa !2233
  %46 = and i32 %45, -61952, !dbg !4157
  %47 = icmp eq i32 %46, 0, !dbg !4157
  %48 = zext i1 %47 to i64, !dbg !4157
  call void @klee_posix_prefer_cex(i8* %1, i64 %48) #8, !dbg !4157
  %49 = bitcast i8* %1 to i64*, !dbg !4158
  %50 = load i64* %49, align 8, !dbg !4158, !tbaa !4159
  %51 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 0, !dbg !4158
  %52 = load i64* %51, align 8, !dbg !4158, !tbaa !4159
  %53 = icmp eq i64 %50, %52, !dbg !4158
  %54 = zext i1 %53 to i64, !dbg !4158
  call void @klee_posix_prefer_cex(i8* %1, i64 %54) #8, !dbg !4158
  %55 = getelementptr inbounds i8* %1, i64 40, !dbg !4160
  %56 = bitcast i8* %55 to i64*, !dbg !4160
  %57 = load i64* %56, align 8, !dbg !4160, !tbaa !4161
  %58 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 7, !dbg !4160
  %59 = load i64* %58, align 8, !dbg !4160, !tbaa !4161
  %60 = icmp eq i64 %57, %59, !dbg !4160
  %61 = zext i1 %60 to i64, !dbg !4160
  call void @klee_posix_prefer_cex(i8* %1, i64 %61) #8, !dbg !4160
  %62 = load i32* %44, align 4, !dbg !4162, !tbaa !2233
  %63 = and i32 %62, 448, !dbg !4162
  %64 = icmp eq i32 %63, 384, !dbg !4162
  %65 = zext i1 %64 to i64, !dbg !4162
  call void @klee_posix_prefer_cex(i8* %1, i64 %65) #8, !dbg !4162
  %66 = load i32* %44, align 4, !dbg !4163, !tbaa !2233
  %67 = and i32 %66, 56, !dbg !4163
  %68 = icmp eq i32 %67, 16, !dbg !4163
  %69 = zext i1 %68 to i64, !dbg !4163
  call void @klee_posix_prefer_cex(i8* %1, i64 %69) #8, !dbg !4163
  %70 = load i32* %44, align 4, !dbg !4164, !tbaa !2233
  %71 = and i32 %70, 7, !dbg !4164
  %72 = icmp eq i32 %71, 2, !dbg !4164
  %73 = zext i1 %72 to i64, !dbg !4164
  call void @klee_posix_prefer_cex(i8* %1, i64 %73) #8, !dbg !4164
  %74 = load i32* %44, align 4, !dbg !4165, !tbaa !2233
  %75 = and i32 %74, 61440, !dbg !4165
  %76 = icmp eq i32 %75, 32768, !dbg !4165
  %77 = zext i1 %76 to i64, !dbg !4165
  call void @klee_posix_prefer_cex(i8* %1, i64 %77) #8, !dbg !4165
  %78 = getelementptr inbounds i8* %1, i64 16, !dbg !4166
  %79 = bitcast i8* %78 to i64*, !dbg !4166
  %80 = load i64* %79, align 8, !dbg !4166, !tbaa !3585
  %81 = icmp eq i64 %80, 1, !dbg !4166
  %82 = zext i1 %81 to i64, !dbg !4166
  call void @klee_posix_prefer_cex(i8* %1, i64 %82) #8, !dbg !4166
  %83 = getelementptr inbounds i8* %1, i64 28, !dbg !4167
  %84 = bitcast i8* %83 to i32*, !dbg !4167
  %85 = load i32* %84, align 4, !dbg !4167, !tbaa !2824
  %86 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 4, !dbg !4167
  %87 = load i32* %86, align 4, !dbg !4167, !tbaa !2824
  %88 = icmp eq i32 %85, %87, !dbg !4167
  %89 = zext i1 %88 to i64, !dbg !4167
  call void @klee_posix_prefer_cex(i8* %1, i64 %89) #8, !dbg !4167
  %90 = getelementptr inbounds i8* %1, i64 32, !dbg !4168
  %91 = bitcast i8* %90 to i32*, !dbg !4168
  %92 = load i32* %91, align 4, !dbg !4168, !tbaa !2828
  %93 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 5, !dbg !4168
  %94 = load i32* %93, align 4, !dbg !4168, !tbaa !2828
  %95 = icmp eq i32 %92, %94, !dbg !4168
  %96 = zext i1 %95 to i64, !dbg !4168
  call void @klee_posix_prefer_cex(i8* %1, i64 %96) #8, !dbg !4168
  %97 = load i64* %39, align 8, !dbg !4169, !tbaa !4156
  %98 = icmp eq i64 %97, 4096, !dbg !4169
  %99 = zext i1 %98 to i64, !dbg !4169
  call void @klee_posix_prefer_cex(i8* %1, i64 %99) #8, !dbg !4169
  %100 = getelementptr inbounds i8* %1, i64 72, !dbg !4170
  %101 = bitcast i8* %100 to i64*, !dbg !4170
  %102 = load i64* %101, align 8, !dbg !4170, !tbaa !2371
  %103 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 11, i32 0, !dbg !4170
  %104 = load i64* %103, align 8, !dbg !4170, !tbaa !2371
  %105 = icmp eq i64 %102, %104, !dbg !4170
  %106 = zext i1 %105 to i64, !dbg !4170
  call void @klee_posix_prefer_cex(i8* %1, i64 %106) #8, !dbg !4170
  %107 = getelementptr inbounds i8* %1, i64 88, !dbg !4171
  %108 = bitcast i8* %107 to i64*, !dbg !4171
  %109 = load i64* %108, align 8, !dbg !4171, !tbaa !2373
  %110 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 12, i32 0, !dbg !4171
  %111 = load i64* %110, align 8, !dbg !4171, !tbaa !2373
  %112 = icmp eq i64 %109, %111, !dbg !4171
  %113 = zext i1 %112 to i64, !dbg !4171
  call void @klee_posix_prefer_cex(i8* %1, i64 %113) #8, !dbg !4171
  %114 = getelementptr inbounds i8* %1, i64 104, !dbg !4172
  %115 = bitcast i8* %114 to i64*, !dbg !4172
  %116 = load i64* %115, align 8, !dbg !4172, !tbaa !3597
  %117 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 13, i32 0, !dbg !4172
  %118 = load i64* %117, align 8, !dbg !4172, !tbaa !3597
  %119 = icmp eq i64 %116, %118, !dbg !4172
  %120 = zext i1 %119 to i64, !dbg !4172
  call void @klee_posix_prefer_cex(i8* %1, i64 %120) #8, !dbg !4172
  %121 = load i32* %19, align 4, !dbg !4173, !tbaa !2515
  %122 = zext i32 %121 to i64, !dbg !4173
  %123 = getelementptr inbounds i8* %1, i64 48, !dbg !4173
  %124 = bitcast i8* %123 to i64*, !dbg !4173
  store i64 %122, i64* %124, align 8, !dbg !4173, !tbaa !4174
  %125 = getelementptr inbounds i8* %1, i64 64, !dbg !4175
  %126 = bitcast i8* %125 to i64*, !dbg !4175
  store i64 8, i64* %126, align 8, !dbg !4175, !tbaa !4176
  %127 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i64 0, i32 2, !dbg !4177
  store %struct.stat64* %2, %struct.stat64** %127, align 8, !dbg !4177, !tbaa !2157
  ret void, !dbg !4178
}

; Function Attrs: noreturn nounwind uwtable
define internal fastcc void @__emit_error(i8* %msg) #11 {
  tail call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str2557, i64 0, i64 0), i32 24, i8* %msg, i8* getelementptr inbounds ([9 x i8]* @.str26, i64 0, i64 0)) #16, !dbg !4179
  unreachable, !dbg !4179
}

; Function Attrs: nounwind uwtable
define internal fastcc i8* @__get_sym_str(i32 %numChars, i8* %name) #3 {
  %1 = add nsw i32 %numChars, 1, !dbg !4180
  %2 = sext i32 %1 to i64, !dbg !4180
  %3 = tail call noalias i8* @malloc(i64 %2) #8, !dbg !4180
  tail call void @klee_mark_global(i8* %3) #8, !dbg !4181
  tail call void @klee_make_symbolic(i8* %3, i64 %2, i8* %name) #8, !dbg !4182
  %4 = icmp sgt i32 %numChars, 0, !dbg !4183
  br i1 %4, label %.lr.ph, label %._crit_edge, !dbg !4183

.lr.ph:                                           ; preds = %.lr.ph, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %0 ]
  %5 = getelementptr inbounds i8* %3, i64 %indvars.iv, !dbg !4185
  %6 = load i8* %5, align 1, !dbg !4185, !tbaa !2142
  %7 = icmp sgt i8 %6, 31, !dbg !4186
  %8 = icmp ne i8 %6, 127, !dbg !4186
  %..i = and i1 %7, %8, !dbg !4186
  %9 = zext i1 %..i to i64, !dbg !4185
  tail call void @klee_posix_prefer_cex(i8* %3, i64 %9) #8, !dbg !4185
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !4183
  %lftr.wideiv1 = trunc i64 %indvars.iv.next to i32, !dbg !4183
  %exitcond2 = icmp eq i32 %lftr.wideiv1, %numChars, !dbg !4183
  br i1 %exitcond2, label %._crit_edge, label %.lr.ph, !dbg !4183

._crit_edge:                                      ; preds = %.lr.ph, %0
  %10 = sext i32 %numChars to i64, !dbg !4187
  %11 = getelementptr inbounds i8* %3, i64 %10, !dbg !4187
  store i8 0, i8* %11, align 1, !dbg !4187, !tbaa !2142
  ret i8* %3, !dbg !4188
}

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #3 {
  %1 = icmp eq i64 %z, 0, !dbg !4189
  br i1 %1, label %2, label %3, !dbg !4189

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str34, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str135, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str236, i64 0, i64 0)) #17, !dbg !4191
  unreachable, !dbg !4191

; <label>:3                                       ; preds = %0
  ret void, !dbg !4192
}

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !4193
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #18, !dbg !4193
  %2 = load i32* %x, align 4, !dbg !4194, !tbaa !2189
  ret i32 %2, !dbg !4194
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #3 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !4195
  br i1 %1, label %3, label %2, !dbg !4195

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str337, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str1438, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str2539, i64 0, i64 0)) #17, !dbg !4197
  unreachable, !dbg !4197

; <label>:3                                       ; preds = %0
  ret void, !dbg !4199
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !4200
  br i1 %1, label %3, label %2, !dbg !4200

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str640, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str1741, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #17, !dbg !4202
  unreachable, !dbg !4202

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !4203
  %5 = icmp eq i32 %4, %end, !dbg !4203
  br i1 %5, label %21, label %6, !dbg !4203

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !4205
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #18, !dbg !4205
  %8 = icmp eq i32 %start, 0, !dbg !4207
  %9 = load i32* %x, align 4, !dbg !4209, !tbaa !2189
  br i1 %8, label %10, label %13, !dbg !4207

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !4209
  %12 = zext i1 %11 to i64, !dbg !4209
  call void @klee_assume(i64 %12) #18, !dbg !4209
  br label %19, !dbg !4211

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !4212
  %15 = zext i1 %14 to i64, !dbg !4212
  call void @klee_assume(i64 %15) #18, !dbg !4212
  %16 = load i32* %x, align 4, !dbg !4214, !tbaa !2189
  %17 = icmp slt i32 %16, %end, !dbg !4214
  %18 = zext i1 %17 to i64, !dbg !4214
  call void @klee_assume(i64 %18) #18, !dbg !4214
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !4215, !tbaa !2189
  br label %21, !dbg !4215

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !4216
}

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0, !dbg !4217
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !4217

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep4 = getelementptr i8* %srcaddr, i64 %2
  %scevgep = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep, %srcaddr
  %bound0 = icmp uge i8* %scevgep4, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end6 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep103 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !4218
  %wide.load = load <16 x i8>* %3, align 1, !dbg !4218
  %next.gep.sum279 = or i64 %index, 16, !dbg !4218
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !4218
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !4218
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !4218
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !4218
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !4218
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum279, !dbg !4218
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !4218
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !4218
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !4219

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val5 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end6, %vector.body ]
  %resume.val7 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val5, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val7, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !4217
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !4218
  %12 = load i8* %src.03, align 1, !dbg !4218, !tbaa !2142
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !4218
  store i8 %12, i8* %dest.02, align 1, !dbg !4218, !tbaa !2142
  %14 = icmp eq i64 %10, 0, !dbg !4217
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !4217, !llvm.loop !4222

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !4223
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #3 {
  %1 = icmp eq i8* %src, %dst, !dbg !4224
  br i1 %1, label %.loopexit, label %2, !dbg !4224

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !4226
  br i1 %3, label %.preheader, label %18, !dbg !4226

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !4228
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !4228

.lr.ph.preheader:                                 ; preds = %.preheader
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %5 = add i64 %count, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep11 = getelementptr i8* %src, i64 %5
  %scevgep = getelementptr i8* %dst, i64 %5
  %bound1 = icmp uge i8* %scevgep, %src
  %bound0 = icmp uge i8* %scevgep11, %dst
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %src, i64 %n.vec
  %ptr.ind.end13 = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep110 = getelementptr i8* %dst, i64 %index
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !4228
  %wide.load = load <16 x i8>* %6, align 1, !dbg !4228
  %next.gep.sum586 = or i64 %index, 16, !dbg !4228
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !4228
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !4228
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !4228
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !4228
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !4228
  %10 = getelementptr i8* %dst, i64 %next.gep.sum586, !dbg !4228
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !4228
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !4228
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !4230

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %src, %.lr.ph.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val12 = phi i8* [ %dst, %.lr.ph.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end13, %vector.body ]
  %resume.val14 = phi i64 [ %count, %.lr.ph.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %b.04 = phi i8* [ %14, %.lr.ph ], [ %resume.val, %middle.block ]
  %a.03 = phi i8* [ %16, %.lr.ph ], [ %resume.val12, %middle.block ]
  %.02 = phi i64 [ %13, %.lr.ph ], [ %resume.val14, %middle.block ]
  %13 = add i64 %.02, -1, !dbg !4228
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !4228
  %15 = load i8* %b.04, align 1, !dbg !4228, !tbaa !2142
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !4228
  store i8 %15, i8* %a.03, align 1, !dbg !4228, !tbaa !2142
  %17 = icmp eq i64 %13, 0, !dbg !4228
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !4228, !llvm.loop !4231

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !4232
  %20 = icmp eq i64 %count, 0, !dbg !4234
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !4234

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !4235
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !4232
  %n.vec215 = and i64 %count, -32
  %cmp.zero217 = icmp eq i64 %n.vec215, 0
  br i1 %cmp.zero217, label %middle.block210, label %vector.memcheck224

vector.memcheck224:                               ; preds = %.lr.ph9
  %bound1221 = icmp ule i8* %21, %dst
  %bound0220 = icmp ule i8* %22, %src
  %memcheck.conflict223 = and i1 %bound0220, %bound1221
  %.sum = sub i64 %19, %n.vec215
  %rev.ptr.ind.end = getelementptr i8* %src, i64 %.sum
  %rev.ptr.ind.end229 = getelementptr i8* %dst, i64 %.sum
  %rev.ind.end231 = sub i64 %count, %n.vec215
  br i1 %memcheck.conflict223, label %middle.block210, label %vector.body209

vector.body209:                                   ; preds = %vector.body209, %vector.memcheck224
  %index212 = phi i64 [ %index.next234, %vector.body209 ], [ 0, %vector.memcheck224 ]
  %.sum440 = sub i64 %19, %index212
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !4234
  %23 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !4234
  %24 = bitcast i8* %23 to <16 x i8>*, !dbg !4234
  %wide.load434 = load <16 x i8>* %24, align 1, !dbg !4234
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !4234
  %.sum505 = add i64 %.sum440, -31, !dbg !4234
  %25 = getelementptr i8* %src, i64 %.sum505, !dbg !4234
  %26 = bitcast i8* %25 to <16 x i8>*, !dbg !4234
  %wide.load435 = load <16 x i8>* %26, align 1, !dbg !4234
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !4234
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !4234
  %27 = getelementptr i8* %dst, i64 %next.gep236.sum, !dbg !4234
  %28 = bitcast i8* %27 to <16 x i8>*, !dbg !4234
  store <16 x i8> %reverse437, <16 x i8>* %28, align 1, !dbg !4234
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !4234
  %29 = getelementptr i8* %dst, i64 %.sum505, !dbg !4234
  %30 = bitcast i8* %29 to <16 x i8>*, !dbg !4234
  store <16 x i8> %reverse438, <16 x i8>* %30, align 1, !dbg !4234
  %index.next234 = add i64 %index212, 32
  %31 = icmp eq i64 %index.next234, %n.vec215
  br i1 %31, label %middle.block210, label %vector.body209, !llvm.loop !4236

middle.block210:                                  ; preds = %vector.body209, %vector.memcheck224, %.lr.ph9
  %resume.val225 = phi i8* [ %21, %.lr.ph9 ], [ %21, %vector.memcheck224 ], [ %rev.ptr.ind.end, %vector.body209 ]
  %resume.val227 = phi i8* [ %22, %.lr.ph9 ], [ %22, %vector.memcheck224 ], [ %rev.ptr.ind.end229, %vector.body209 ]
  %resume.val230 = phi i64 [ %count, %.lr.ph9 ], [ %count, %vector.memcheck224 ], [ %rev.ind.end231, %vector.body209 ]
  %new.indc.resume.val232 = phi i64 [ 0, %.lr.ph9 ], [ 0, %vector.memcheck224 ], [ %n.vec215, %vector.body209 ]
  %cmp.n233 = icmp eq i64 %new.indc.resume.val232, %count
  br i1 %cmp.n233, label %.loopexit, label %scalar.ph211

scalar.ph211:                                     ; preds = %scalar.ph211, %middle.block210
  %b.18 = phi i8* [ %33, %scalar.ph211 ], [ %resume.val225, %middle.block210 ]
  %a.17 = phi i8* [ %35, %scalar.ph211 ], [ %resume.val227, %middle.block210 ]
  %.16 = phi i64 [ %32, %scalar.ph211 ], [ %resume.val230, %middle.block210 ]
  %32 = add i64 %.16, -1, !dbg !4234
  %33 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !4234
  %34 = load i8* %b.18, align 1, !dbg !4234, !tbaa !2142
  %35 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !4234
  store i8 %34, i8* %a.17, align 1, !dbg !4234, !tbaa !2142
  %36 = icmp eq i64 %32, 0, !dbg !4234
  br i1 %36, label %.loopexit, label %scalar.ph211, !dbg !4234, !llvm.loop !4237

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !4238
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0, !dbg !4239
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !4239

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep5 = getelementptr i8* %srcaddr, i64 %2
  %scevgep4 = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep4, %srcaddr
  %bound0 = icmp uge i8* %scevgep5, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end7 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep104 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !4240
  %wide.load = load <16 x i8>* %3, align 1, !dbg !4240
  %next.gep.sum280 = or i64 %index, 16, !dbg !4240
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !4240
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !4240
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !4240
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !4240
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !4240
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum280, !dbg !4240
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !4240
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !4240
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !4241

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val6 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end7, %vector.body ]
  %resume.val8 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val6, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val8, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !4239
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !4240
  %12 = load i8* %src.03, align 1, !dbg !4240, !tbaa !2142
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !4240
  store i8 %12, i8* %dest.02, align 1, !dbg !4240, !tbaa !2142
  %14 = icmp eq i64 %10, 0, !dbg !4239
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !4239, !llvm.loop !4242

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !4239

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !4243
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #3 {
  %1 = icmp eq i64 %count, 0, !dbg !4244
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !4244

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !4245
  br label %3, !dbg !4244

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !4244
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !4245
  store volatile i8 %2, i8* %a.02, align 1, !dbg !4245, !tbaa !2142
  %6 = icmp eq i64 %4, 0, !dbg !4244
  br i1 %6, label %._crit_edge, label %3, !dbg !4244

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !4246
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-floa
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind returns_twice uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noreturn nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { inlinehint nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { noreturn nounwind }
attributes #17 = { nobuiltin noreturn nounwind }
attributes #18 = { nobuiltin nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.dbg.cu = !{!1, !687, !898, !1048, !1161, !1241, !1336, !1338, !1340, !2033, !2044, !2053, !2064, !2077, !2092, !2107, !2122}
!llvm.module.flags = !{!2138, !2139}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{i32 786449, metadata !2, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !23, metadata !24, metadata !679, metadata !23, metadata !""} ; [ DW_TAG_compile_unit ] [/ho
!2 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!3 = metadata !{metadata !4, metadata !11}
!4 = metadata !{i32 786436, metadata !5, null, metadata !"", i32 26, i64 32, i64 32, i32 0, i32 0, null, metadata !6, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 26, size 32, align 32, offset 0] [def] [from ]
!5 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!6 = metadata !{metadata !7, metadata !8, metadata !9, metadata !10}
!7 = metadata !{i32 786472, metadata !"eOpen", i64 1} ; [ DW_TAG_enumerator ] [eOpen :: 1]
!8 = metadata !{i32 786472, metadata !"eCloseOnExec", i64 2} ; [ DW_TAG_enumerator ] [eCloseOnExec :: 2]
!9 = metadata !{i32 786472, metadata !"eReadable", i64 4} ; [ DW_TAG_enumerator ] [eReadable :: 4]
!10 = metadata !{i32 786472, metadata !"eWriteable", i64 8} ; [ DW_TAG_enumerator ] [eWriteable :: 8]
!11 = metadata !{i32 786436, metadata !12, null, metadata !"", i32 97, i64 32, i64 32, i32 0, i32 0, null, metadata !13, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 97, size 32, align 32, offset 0] [def] [from ]
!12 = metadata !{metadata !"/usr/include/dirent.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22}
!14 = metadata !{i32 786472, metadata !"DT_UNKNOWN", i64 0} ; [ DW_TAG_enumerator ] [DT_UNKNOWN :: 0]
!15 = metadata !{i32 786472, metadata !"DT_FIFO", i64 1} ; [ DW_TAG_enumerator ] [DT_FIFO :: 1]
!16 = metadata !{i32 786472, metadata !"DT_CHR", i64 2} ; [ DW_TAG_enumerator ] [DT_CHR :: 2]
!17 = metadata !{i32 786472, metadata !"DT_DIR", i64 4} ; [ DW_TAG_enumerator ] [DT_DIR :: 4]
!18 = metadata !{i32 786472, metadata !"DT_BLK", i64 6} ; [ DW_TAG_enumerator ] [DT_BLK :: 6]
!19 = metadata !{i32 786472, metadata !"DT_REG", i64 8} ; [ DW_TAG_enumerator ] [DT_REG :: 8]
!20 = metadata !{i32 786472, metadata !"DT_LNK", i64 10} ; [ DW_TAG_enumerator ] [DT_LNK :: 10]
!21 = metadata !{i32 786472, metadata !"DT_SOCK", i64 12} ; [ DW_TAG_enumerator ] [DT_SOCK :: 12]
!22 = metadata !{i32 786472, metadata !"DT_WHT", i64 14} ; [ DW_TAG_enumerator ] [DT_WHT :: 14]
!23 = metadata !{i32 0}
!24 = metadata !{metadata !25, metadata !90, metadata !97, metadata !120, metadata !134, metadata !150, metadata !161, metadata !168, metadata !183, metadata !198, metadata !207, metadata !216, metadata !249, metadata !256, metadata !264, metadata !271, 
!25 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"access", metadata !"access", metadata !"", i32 73, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @access, null, null, metadata !34, i32 73} ; [ D
!26 = metadata !{metadata !"fd.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!27 = metadata !{i32 786473, metadata !26}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!28 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!29 = metadata !{metadata !30, metadata !31, metadata !30}
!30 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!31 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!32 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!33 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!34 = metadata !{metadata !35, metadata !36, metadata !37, metadata !87}
!35 = metadata !{i32 786689, metadata !25, metadata !"pathname", metadata !27, i32 16777289, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 73]
!36 = metadata !{i32 786689, metadata !25, metadata !"mode", metadata !27, i32 33554505, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 73]
!37 = metadata !{i32 786688, metadata !25, metadata !"dfile", metadata !27, i32 74, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 74]
!38 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !39} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from exe_disk_file_t]
!39 = metadata !{i32 786454, metadata !26, null, metadata !"exe_disk_file_t", i32 24, i64 0, i64 0, i64 0, i32 0, metadata !40} ; [ DW_TAG_typedef ] [exe_disk_file_t] [line 24, size 0, align 0, offset 0] [from ]
!40 = metadata !{i32 786451, metadata !5, null, metadata !"", i32 20, i64 192, i64 64, i32 0, i32 0, null, metadata !41, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 20, size 192, align 64, offset 0] [def] [from ]
!41 = metadata !{metadata !42, metadata !44, metadata !46}
!42 = metadata !{i32 786445, metadata !5, metadata !40, metadata !"size", i32 21, i64 32, i64 32, i64 0, i32 0, metadata !43} ; [ DW_TAG_member ] [size] [line 21, size 32, align 32, offset 0] [from unsigned int]
!43 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!44 = metadata !{i32 786445, metadata !5, metadata !40, metadata !"contents", i32 22, i64 64, i64 64, i64 64, i32 0, metadata !45} ; [ DW_TAG_member ] [contents] [line 22, size 64, align 64, offset 64] [from ]
!45 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!46 = metadata !{i32 786445, metadata !5, metadata !40, metadata !"stat", i32 23, i64 64, i64 64, i64 128, i32 0, metadata !47} ; [ DW_TAG_member ] [stat] [line 23, size 64, align 64, offset 128] [from ]
!47 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !48} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat64]
!48 = metadata !{i32 786451, metadata !49, null, metadata !"stat64", i32 119, i64 1152, i64 64, i32 0, i32 0, null, metadata !50, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat64] [line 119, size 1152, align 64, offset 0] [def] [from ]
!49 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/stat.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!50 = metadata !{metadata !51, metadata !54, metadata !56, metadata !58, metadata !60, metadata !62, metadata !64, metadata !65, metadata !66, metadata !69, metadata !71, metadata !73, metadata !81, metadata !82, metadata !83}
!51 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_dev", i32 121, i64 64, i64 64, i64 0, i32 0, metadata !52} ; [ DW_TAG_member ] [st_dev] [line 121, size 64, align 64, offset 0] [from __dev_t]
!52 = metadata !{i32 786454, metadata !49, null, metadata !"__dev_t", i32 124, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [__dev_t] [line 124, size 0, align 0, offset 0] [from long unsigned int]
!53 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!54 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_ino", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !55} ; [ DW_TAG_member ] [st_ino] [line 123, size 64, align 64, offset 64] [from __ino64_t]
!55 = metadata !{i32 786454, metadata !49, null, metadata !"__ino64_t", i32 128, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [__ino64_t] [line 128, size 0, align 0, offset 0] [from long unsigned int]
!56 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_nlink", i32 124, i64 64, i64 64, i64 128, i32 0, metadata !57} ; [ DW_TAG_member ] [st_nlink] [line 124, size 64, align 64, offset 128] [from __nlink_t]
!57 = metadata !{i32 786454, metadata !49, null, metadata !"__nlink_t", i32 130, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [__nlink_t] [line 130, size 0, align 0, offset 0] [from long unsigned int]
!58 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_mode", i32 125, i64 32, i64 32, i64 192, i32 0, metadata !59} ; [ DW_TAG_member ] [st_mode] [line 125, size 32, align 32, offset 192] [from __mode_t]
!59 = metadata !{i32 786454, metadata !49, null, metadata !"__mode_t", i32 129, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [__mode_t] [line 129, size 0, align 0, offset 0] [from unsigned int]
!60 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_uid", i32 132, i64 32, i64 32, i64 224, i32 0, metadata !61} ; [ DW_TAG_member ] [st_uid] [line 132, size 32, align 32, offset 224] [from __uid_t]
!61 = metadata !{i32 786454, metadata !49, null, metadata !"__uid_t", i32 125, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [__uid_t] [line 125, size 0, align 0, offset 0] [from unsigned int]
!62 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_gid", i32 133, i64 32, i64 32, i64 256, i32 0, metadata !63} ; [ DW_TAG_member ] [st_gid] [line 133, size 32, align 32, offset 256] [from __gid_t]
!63 = metadata !{i32 786454, metadata !49, null, metadata !"__gid_t", i32 126, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [__gid_t] [line 126, size 0, align 0, offset 0] [from unsigned int]
!64 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"__pad0", i32 135, i64 32, i64 32, i64 288, i32 0, metadata !30} ; [ DW_TAG_member ] [__pad0] [line 135, size 32, align 32, offset 288] [from int]
!65 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_rdev", i32 136, i64 64, i64 64, i64 320, i32 0, metadata !52} ; [ DW_TAG_member ] [st_rdev] [line 136, size 64, align 64, offset 320] [from __dev_t]
!66 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_size", i32 137, i64 64, i64 64, i64 384, i32 0, metadata !67} ; [ DW_TAG_member ] [st_size] [line 137, size 64, align 64, offset 384] [from __off_t]
!67 = metadata !{i32 786454, metadata !49, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!68 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!69 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_blksize", i32 143, i64 64, i64 64, i64 448, i32 0, metadata !70} ; [ DW_TAG_member ] [st_blksize] [line 143, size 64, align 64, offset 448] [from __blksize_t]
!70 = metadata !{i32 786454, metadata !49, null, metadata !"__blksize_t", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__blksize_t] [line 153, size 0, align 0, offset 0] [from long int]
!71 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_blocks", i32 144, i64 64, i64 64, i64 512, i32 0, metadata !72} ; [ DW_TAG_member ] [st_blocks] [line 144, size 64, align 64, offset 512] [from __blkcnt64_t]
!72 = metadata !{i32 786454, metadata !49, null, metadata !"__blkcnt64_t", i32 159, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__blkcnt64_t] [line 159, size 0, align 0, offset 0] [from long int]
!73 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_atim", i32 152, i64 128, i64 64, i64 576, i32 0, metadata !74} ; [ DW_TAG_member ] [st_atim] [line 152, size 128, align 64, offset 576] [from timespec]
!74 = metadata !{i32 786451, metadata !75, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !76, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!75 = metadata !{metadata !"/usr/include/time.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!76 = metadata !{metadata !77, metadata !79}
!77 = metadata !{i32 786445, metadata !75, metadata !74, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!78 = metadata !{i32 786454, metadata !75, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!79 = metadata !{i32 786445, metadata !75, metadata !74, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !80} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!80 = metadata !{i32 786454, metadata !75, null, metadata !"__syscall_slong_t", i32 175, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__syscall_slong_t] [line 175, size 0, align 0, offset 0] [from long int]
!81 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_mtim", i32 153, i64 128, i64 64, i64 704, i32 0, metadata !74} ; [ DW_TAG_member ] [st_mtim] [line 153, size 128, align 64, offset 704] [from timespec]
!82 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"st_ctim", i32 154, i64 128, i64 64, i64 832, i32 0, metadata !74} ; [ DW_TAG_member ] [st_ctim] [line 154, size 128, align 64, offset 832] [from timespec]
!83 = metadata !{i32 786445, metadata !49, metadata !48, metadata !"__glibc_reserved", i32 164, i64 192, i64 64, i64 960, i32 0, metadata !84} ; [ DW_TAG_member ] [__glibc_reserved] [line 164, size 192, align 64, offset 960] [from ]
!84 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !80, metadata !85, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __syscall_slong_t]
!85 = metadata !{metadata !86}
!86 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!87 = metadata !{i32 786688, metadata !88, metadata !"r", metadata !27, i32 81, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 81]
!88 = metadata !{i32 786443, metadata !26, metadata !89, i32 80, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!89 = metadata !{i32 786443, metadata !26, metadata !25, i32 76, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!90 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"umask", metadata !"umask", metadata !"", i32 88, metadata !91, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @umask, null, null, metadata !94, i32 88} ; [ DW_TAG_su
!91 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !92, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!92 = metadata !{metadata !59, metadata !93}
!93 = metadata !{i32 786454, metadata !26, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !59} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!94 = metadata !{metadata !95, metadata !96}
!95 = metadata !{i32 786689, metadata !90, metadata !"mask", metadata !27, i32 16777304, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mask] [line 88]
!96 = metadata !{i32 786688, metadata !90, metadata !"r", metadata !27, i32 89, metadata !93, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 89]
!97 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__fd_open", metadata !"__fd_open", metadata !"", i32 128, metadata !98, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @__fd_open, null, null, metadata !10
!98 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !99, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!99 = metadata !{metadata !30, metadata !31, metadata !30, metadata !93}
!100 = metadata !{metadata !101, metadata !102, metadata !103, metadata !104, metadata !105, metadata !116, metadata !117}
!101 = metadata !{i32 786689, metadata !97, metadata !"pathname", metadata !27, i32 16777344, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 128]
!102 = metadata !{i32 786689, metadata !97, metadata !"flags", metadata !27, i32 33554560, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 128]
!103 = metadata !{i32 786689, metadata !97, metadata !"mode", metadata !27, i32 50331776, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 128]
!104 = metadata !{i32 786688, metadata !97, metadata !"df", metadata !27, i32 129, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 129]
!105 = metadata !{i32 786688, metadata !97, metadata !"f", metadata !27, i32 130, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 130]
!106 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !107} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from exe_file_t]
!107 = metadata !{i32 786454, metadata !26, null, metadata !"exe_file_t", i32 40, i64 0, i64 0, i64 0, i32 0, metadata !108} ; [ DW_TAG_typedef ] [exe_file_t] [line 40, size 0, align 0, offset 0] [from ]
!108 = metadata !{i32 786451, metadata !5, null, metadata !"", i32 33, i64 192, i64 64, i32 0, i32 0, null, metadata !109, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 33, size 192, align 64, offset 0] [def] [from ]
!109 = metadata !{metadata !110, metadata !111, metadata !112, metadata !115}
!110 = metadata !{i32 786445, metadata !5, metadata !108, metadata !"fd", i32 34, i64 32, i64 32, i64 0, i32 0, metadata !30} ; [ DW_TAG_member ] [fd] [line 34, size 32, align 32, offset 0] [from int]
!111 = metadata !{i32 786445, metadata !5, metadata !108, metadata !"flags", i32 35, i64 32, i64 32, i64 32, i32 0, metadata !43} ; [ DW_TAG_member ] [flags] [line 35, size 32, align 32, offset 32] [from unsigned int]
!112 = metadata !{i32 786445, metadata !5, metadata !108, metadata !"off", i32 38, i64 64, i64 64, i64 64, i32 0, metadata !113} ; [ DW_TAG_member ] [off] [line 38, size 64, align 64, offset 64] [from off64_t]
!113 = metadata !{i32 786454, metadata !5, null, metadata !"off64_t", i32 93, i64 0, i64 0, i64 0, i32 0, metadata !114} ; [ DW_TAG_typedef ] [off64_t] [line 93, size 0, align 0, offset 0] [from __off64_t]
!114 = metadata !{i32 786454, metadata !5, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!115 = metadata !{i32 786445, metadata !5, metadata !108, metadata !"dfile", i32 39, i64 64, i64 64, i64 128, i32 0, metadata !38} ; [ DW_TAG_member ] [dfile] [line 39, size 64, align 64, offset 128] [from ]
!116 = metadata !{i32 786688, metadata !97, metadata !"fd", metadata !27, i32 131, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd] [line 131]
!117 = metadata !{i32 786688, metadata !118, metadata !"os_fd", metadata !27, i32 181, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_fd] [line 181]
!118 = metadata !{i32 786443, metadata !26, metadata !119, i32 180, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!119 = metadata !{i32 786443, metadata !26, metadata !97, i32 147, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!120 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__fd_openat", metadata !"__fd_openat", metadata !"", i32 201, metadata !121, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32, i32)* @__fd_openat, null, null,
!121 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !122, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!122 = metadata !{metadata !30, metadata !30, metadata !31, metadata !30, metadata !93}
!123 = metadata !{metadata !124, metadata !125, metadata !126, metadata !127, metadata !128, metadata !129, metadata !130, metadata !133}
!124 = metadata !{i32 786689, metadata !120, metadata !"basefd", metadata !27, i32 16777417, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [basefd] [line 201]
!125 = metadata !{i32 786689, metadata !120, metadata !"pathname", metadata !27, i32 33554633, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 201]
!126 = metadata !{i32 786689, metadata !120, metadata !"flags", metadata !27, i32 50331849, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 201]
!127 = metadata !{i32 786689, metadata !120, metadata !"mode", metadata !27, i32 67109065, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 201]
!128 = metadata !{i32 786688, metadata !120, metadata !"f", metadata !27, i32 202, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 202]
!129 = metadata !{i32 786688, metadata !120, metadata !"fd", metadata !27, i32 203, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd] [line 203]
!130 = metadata !{i32 786688, metadata !131, metadata !"bf", metadata !27, i32 205, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bf] [line 205]
!131 = metadata !{i32 786443, metadata !26, metadata !132, i32 204, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!132 = metadata !{i32 786443, metadata !26, metadata !120, i32 204, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!133 = metadata !{i32 786688, metadata !120, metadata !"os_fd", metadata !27, i32 236, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_fd] [line 236]
!134 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"utimes", metadata !"utimes", metadata !"", i32 256, metadata !135, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.timeval*)* @utimes, null, null, metadata !1
!135 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !136, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!136 = metadata !{metadata !30, metadata !31, metadata !137}
!137 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !138} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!138 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !139} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from timeval]
!139 = metadata !{i32 786451, metadata !140, null, metadata !"timeval", i32 30, i64 128, i64 64, i32 0, i32 0, null, metadata !141, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!140 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/time.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!141 = metadata !{metadata !142, metadata !143}
!142 = metadata !{i32 786445, metadata !140, metadata !139, metadata !"tv_sec", i32 32, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!143 = metadata !{i32 786445, metadata !140, metadata !139, metadata !"tv_usec", i32 33, i64 64, i64 64, i64 64, i32 0, metadata !144} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!144 = metadata !{i32 786454, metadata !140, null, metadata !"__suseconds_t", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!145 = metadata !{metadata !146, metadata !147, metadata !148, metadata !149}
!146 = metadata !{i32 786689, metadata !134, metadata !"path", metadata !27, i32 16777472, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 256]
!147 = metadata !{i32 786689, metadata !134, metadata !"times", metadata !27, i32 33554688, metadata !137, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [times] [line 256]
!148 = metadata !{i32 786688, metadata !134, metadata !"dfile", metadata !27, i32 257, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 257]
!149 = metadata !{i32 786688, metadata !134, metadata !"r", metadata !27, i32 269, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 269]
!150 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"futimesat", metadata !"futimesat", metadata !"", i32 277, metadata !151, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.timeval*)* @futimesat, null, nul
!151 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !152, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!152 = metadata !{metadata !30, metadata !30, metadata !31, metadata !137}
!153 = metadata !{metadata !154, metadata !155, metadata !156, metadata !157, metadata !160}
!154 = metadata !{i32 786689, metadata !150, metadata !"fd", metadata !27, i32 16777493, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 277]
!155 = metadata !{i32 786689, metadata !150, metadata !"path", metadata !27, i32 33554709, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 277]
!156 = metadata !{i32 786689, metadata !150, metadata !"times", metadata !27, i32 50331925, metadata !137, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [times] [line 277]
!157 = metadata !{i32 786688, metadata !158, metadata !"f", metadata !27, i32 279, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 279]
!158 = metadata !{i32 786443, metadata !26, metadata !159, i32 278, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!159 = metadata !{i32 786443, metadata !26, metadata !150, i32 278, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!160 = metadata !{i32 786688, metadata !150, metadata !"r", metadata !27, i32 295, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 295]
!161 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"close", metadata !"close", metadata !"", i32 303, metadata !162, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @close, null, null, metadata !164, i32 303} ; [ DW_T
!162 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !163, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!163 = metadata !{metadata !30, metadata !30}
!164 = metadata !{metadata !165, metadata !166, metadata !167}
!165 = metadata !{i32 786689, metadata !161, metadata !"fd", metadata !27, i32 16777519, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 303]
!166 = metadata !{i32 786688, metadata !161, metadata !"f", metadata !27, i32 305, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 305]
!167 = metadata !{i32 786688, metadata !161, metadata !"r", metadata !27, i32 306, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 306]
!168 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"read", metadata !"read", metadata !"", i32 335, metadata !169, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i8*, i64)* @read, null, null, metadata !175, i32 335} ;
!169 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !170, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!170 = metadata !{metadata !171, metadata !30, metadata !173, metadata !174}
!171 = metadata !{i32 786454, metadata !26, null, metadata !"ssize_t", i32 109, i64 0, i64 0, i64 0, i32 0, metadata !172} ; [ DW_TAG_typedef ] [ssize_t] [line 109, size 0, align 0, offset 0] [from __ssize_t]
!172 = metadata !{i32 786454, metadata !26, null, metadata !"__ssize_t", i32 172, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__ssize_t] [line 172, size 0, align 0, offset 0] [from long int]
!173 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!174 = metadata !{i32 786454, metadata !26, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!175 = metadata !{metadata !176, metadata !177, metadata !178, metadata !179, metadata !180}
!176 = metadata !{i32 786689, metadata !168, metadata !"fd", metadata !27, i32 16777551, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 335]
!177 = metadata !{i32 786689, metadata !168, metadata !"buf", metadata !27, i32 33554767, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 335]
!178 = metadata !{i32 786689, metadata !168, metadata !"count", metadata !27, i32 50331983, metadata !174, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 335]
!179 = metadata !{i32 786688, metadata !168, metadata !"f", metadata !27, i32 337, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 337]
!180 = metadata !{i32 786688, metadata !181, metadata !"r", metadata !27, i32 364, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 364]
!181 = metadata !{i32 786443, metadata !26, metadata !182, i32 362, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!182 = metadata !{i32 786443, metadata !26, metadata !168, i32 362, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!183 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"write", metadata !"write", metadata !"", i32 403, metadata !184, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i8*, i64)* @write, null, null, metadata !188, i32 403
!184 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !185, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!185 = metadata !{metadata !171, metadata !30, metadata !186, metadata !174}
!186 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !187} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!187 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!188 = metadata !{metadata !189, metadata !190, metadata !191, metadata !192, metadata !193, metadata !196}
!189 = metadata !{i32 786689, metadata !183, metadata !"fd", metadata !27, i32 16777619, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 403]
!190 = metadata !{i32 786689, metadata !183, metadata !"buf", metadata !27, i32 33554835, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 403]
!191 = metadata !{i32 786689, metadata !183, metadata !"count", metadata !27, i32 50332051, metadata !174, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 403]
!192 = metadata !{i32 786688, metadata !183, metadata !"f", metadata !27, i32 405, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 405]
!193 = metadata !{i32 786688, metadata !194, metadata !"r", metadata !27, i32 423, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 423]
!194 = metadata !{i32 786443, metadata !26, metadata !195, i32 422, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!195 = metadata !{i32 786443, metadata !26, metadata !183, i32 422, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!196 = metadata !{i32 786688, metadata !197, metadata !"actual_count", metadata !27, i32 448, metadata !174, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [actual_count] [line 448]
!197 = metadata !{i32 786443, metadata !26, metadata !195, i32 446, i32 0, i32 88} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!198 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__fd_lseek", metadata !"__fd_lseek", metadata !"", i32 475, metadata !199, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @__fd_lseek, null, null, metadat
!199 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !200, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!200 = metadata !{metadata !113, metadata !30, metadata !113, metadata !30}
!201 = metadata !{metadata !202, metadata !203, metadata !204, metadata !205, metadata !206}
!202 = metadata !{i32 786689, metadata !198, metadata !"fd", metadata !27, i32 16777691, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 475]
!203 = metadata !{i32 786689, metadata !198, metadata !"offset", metadata !27, i32 33554907, metadata !113, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 475]
!204 = metadata !{i32 786689, metadata !198, metadata !"whence", metadata !27, i32 50332123, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [whence] [line 475]
!205 = metadata !{i32 786688, metadata !198, metadata !"new_off", metadata !27, i32 476, metadata !113, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_off] [line 476]
!206 = metadata !{i32 786688, metadata !198, metadata !"f", metadata !27, i32 477, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 477]
!207 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__fd_stat", metadata !"__fd_stat", metadata !"", i32 532, metadata !208, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat64*)* @__fd_stat, null, null, met
!208 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !209, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!209 = metadata !{metadata !30, metadata !31, metadata !47}
!210 = metadata !{metadata !211, metadata !212, metadata !213, metadata !214}
!211 = metadata !{i32 786689, metadata !207, metadata !"path", metadata !27, i32 16777748, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 532]
!212 = metadata !{i32 786689, metadata !207, metadata !"buf", metadata !27, i32 33554964, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 532]
!213 = metadata !{i32 786688, metadata !207, metadata !"dfile", metadata !27, i32 533, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 533]
!214 = metadata !{i32 786688, metadata !215, metadata !"r", metadata !27, i32 541, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 541]
!215 = metadata !{i32 786443, metadata !26, metadata !207, i32 539, i32 0, i32 114} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!216 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"fstatat", metadata !"fstatat", metadata !"", i32 551, metadata !217, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*, i32)* @fstatat, null, null, m
!217 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !218, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!218 = metadata !{metadata !30, metadata !30, metadata !31, metadata !219, metadata !30}
!219 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !220} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat]
!220 = metadata !{i32 786451, metadata !49, null, metadata !"stat", i32 46, i64 1152, i64 64, i32 0, i32 0, null, metadata !221, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat] [line 46, size 1152, align 64, offset 0] [def] [from ]
!221 = metadata !{metadata !222, metadata !223, metadata !225, metadata !226, metadata !227, metadata !228, metadata !229, metadata !230, metadata !231, metadata !232, metadata !233, metadata !235, metadata !236, metadata !237, metadata !238}
!222 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_dev", i32 48, i64 64, i64 64, i64 0, i32 0, metadata !52} ; [ DW_TAG_member ] [st_dev] [line 48, size 64, align 64, offset 0] [from __dev_t]
!223 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_ino", i32 53, i64 64, i64 64, i64 64, i32 0, metadata !224} ; [ DW_TAG_member ] [st_ino] [line 53, size 64, align 64, offset 64] [from __ino_t]
!224 = metadata !{i32 786454, metadata !49, null, metadata !"__ino_t", i32 127, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [__ino_t] [line 127, size 0, align 0, offset 0] [from long unsigned int]
!225 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_nlink", i32 61, i64 64, i64 64, i64 128, i32 0, metadata !57} ; [ DW_TAG_member ] [st_nlink] [line 61, size 64, align 64, offset 128] [from __nlink_t]
!226 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_mode", i32 62, i64 32, i64 32, i64 192, i32 0, metadata !59} ; [ DW_TAG_member ] [st_mode] [line 62, size 32, align 32, offset 192] [from __mode_t]
!227 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_uid", i32 64, i64 32, i64 32, i64 224, i32 0, metadata !61} ; [ DW_TAG_member ] [st_uid] [line 64, size 32, align 32, offset 224] [from __uid_t]
!228 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_gid", i32 65, i64 32, i64 32, i64 256, i32 0, metadata !63} ; [ DW_TAG_member ] [st_gid] [line 65, size 32, align 32, offset 256] [from __gid_t]
!229 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"__pad0", i32 67, i64 32, i64 32, i64 288, i32 0, metadata !30} ; [ DW_TAG_member ] [__pad0] [line 67, size 32, align 32, offset 288] [from int]
!230 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_rdev", i32 69, i64 64, i64 64, i64 320, i32 0, metadata !52} ; [ DW_TAG_member ] [st_rdev] [line 69, size 64, align 64, offset 320] [from __dev_t]
!231 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_size", i32 74, i64 64, i64 64, i64 384, i32 0, metadata !67} ; [ DW_TAG_member ] [st_size] [line 74, size 64, align 64, offset 384] [from __off_t]
!232 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_blksize", i32 78, i64 64, i64 64, i64 448, i32 0, metadata !70} ; [ DW_TAG_member ] [st_blksize] [line 78, size 64, align 64, offset 448] [from __blksize_t]
!233 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_blocks", i32 80, i64 64, i64 64, i64 512, i32 0, metadata !234} ; [ DW_TAG_member ] [st_blocks] [line 80, size 64, align 64, offset 512] [from __blkcnt_t]
!234 = metadata !{i32 786454, metadata !49, null, metadata !"__blkcnt_t", i32 158, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__blkcnt_t] [line 158, size 0, align 0, offset 0] [from long int]
!235 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_atim", i32 91, i64 128, i64 64, i64 576, i32 0, metadata !74} ; [ DW_TAG_member ] [st_atim] [line 91, size 128, align 64, offset 576] [from timespec]
!236 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_mtim", i32 92, i64 128, i64 64, i64 704, i32 0, metadata !74} ; [ DW_TAG_member ] [st_mtim] [line 92, size 128, align 64, offset 704] [from timespec]
!237 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"st_ctim", i32 93, i64 128, i64 64, i64 832, i32 0, metadata !74} ; [ DW_TAG_member ] [st_ctim] [line 93, size 128, align 64, offset 832] [from timespec]
!238 = metadata !{i32 786445, metadata !49, metadata !220, metadata !"__glibc_reserved", i32 106, i64 192, i64 64, i64 960, i32 0, metadata !84} ; [ DW_TAG_member ] [__glibc_reserved] [line 106, size 192, align 64, offset 960] [from ]
!239 = metadata !{metadata !240, metadata !241, metadata !242, metadata !243, metadata !244, metadata !247, metadata !248}
!240 = metadata !{i32 786689, metadata !216, metadata !"fd", metadata !27, i32 16777767, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 551]
!241 = metadata !{i32 786689, metadata !216, metadata !"path", metadata !27, i32 33554983, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 551]
!242 = metadata !{i32 786689, metadata !216, metadata !"buf", metadata !27, i32 50332199, metadata !219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 551]
!243 = metadata !{i32 786689, metadata !216, metadata !"flags", metadata !27, i32 67109415, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 551]
!244 = metadata !{i32 786688, metadata !245, metadata !"f", metadata !27, i32 553, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 553]
!245 = metadata !{i32 786443, metadata !26, metadata !246, i32 552, i32 0, i32 117} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!246 = metadata !{i32 786443, metadata !26, metadata !216, i32 552, i32 0, i32 116} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!247 = metadata !{i32 786688, metadata !216, metadata !"dfile", metadata !27, i32 565, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 565]
!248 = metadata !{i32 786688, metadata !216, metadata !"r", metadata !27, i32 572, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 572]
!249 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__fd_lstat", metadata !"__fd_lstat", metadata !"", i32 587, metadata !208, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat64*)* @__fd_lstat, null, null, 
!250 = metadata !{metadata !251, metadata !252, metadata !253, metadata !254}
!251 = metadata !{i32 786689, metadata !249, metadata !"path", metadata !27, i32 16777803, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 587]
!252 = metadata !{i32 786689, metadata !249, metadata !"buf", metadata !27, i32 33555019, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 587]
!253 = metadata !{i32 786688, metadata !249, metadata !"dfile", metadata !27, i32 588, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 588]
!254 = metadata !{i32 786688, metadata !255, metadata !"r", metadata !27, i32 596, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 596]
!255 = metadata !{i32 786443, metadata !26, metadata !249, i32 594, i32 0, i32 127} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!256 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"chdir", metadata !"chdir", metadata !"", i32 606, metadata !257, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @chdir, null, null, metadata !259, i32 606} ; [ DW_T
!257 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !258, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!258 = metadata !{metadata !30, metadata !31}
!259 = metadata !{metadata !260, metadata !261, metadata !262}
!260 = metadata !{i32 786689, metadata !256, metadata !"path", metadata !27, i32 16777822, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 606]
!261 = metadata !{i32 786688, metadata !256, metadata !"dfile", metadata !27, i32 607, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 607]
!262 = metadata !{i32 786688, metadata !263, metadata !"r", metadata !27, i32 617, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 617]
!263 = metadata !{i32 786443, metadata !26, metadata !256, i32 616, i32 0, i32 131} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!264 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"fchdir", metadata !"fchdir", metadata !"", i32 624, metadata !162, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fchdir, null, null, metadata !265, i32 624} ; [ D
!265 = metadata !{metadata !266, metadata !267, metadata !268}
!266 = metadata !{i32 786689, metadata !264, metadata !"fd", metadata !27, i32 16777840, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 624]
!267 = metadata !{i32 786688, metadata !264, metadata !"f", metadata !27, i32 625, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 625]
!268 = metadata !{i32 786688, metadata !269, metadata !"r", metadata !27, i32 637, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 637]
!269 = metadata !{i32 786443, metadata !26, metadata !270, i32 636, i32 0, i32 137} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!270 = metadata !{i32 786443, metadata !26, metadata !264, i32 632, i32 0, i32 135} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!271 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"chmod", metadata !"chmod", metadata !"", i32 658, metadata !272, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @chmod, null, null, metadata !274, i32 658} ; [
!272 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !273, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!273 = metadata !{metadata !30, metadata !31, metadata !93}
!274 = metadata !{metadata !275, metadata !276, metadata !277, metadata !278}
!275 = metadata !{i32 786689, metadata !271, metadata !"path", metadata !27, i32 16777874, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 658]
!276 = metadata !{i32 786689, metadata !271, metadata !"mode", metadata !27, i32 33555090, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 658]
!277 = metadata !{i32 786688, metadata !271, metadata !"dfile", metadata !27, i32 661, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 661]
!278 = metadata !{i32 786688, metadata !279, metadata !"r", metadata !27, i32 673, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 673]
!279 = metadata !{i32 786443, metadata !26, metadata !280, i32 672, i32 0, i32 143} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!280 = metadata !{i32 786443, metadata !26, metadata !271, i32 670, i32 0, i32 141} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!281 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"fchmod", metadata !"fchmod", metadata !"", i32 680, metadata !282, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @fchmod, null, null, metadata !284, i32 680} 
!282 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !283, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!283 = metadata !{metadata !30, metadata !30, metadata !93}
!284 = metadata !{metadata !285, metadata !286, metadata !287, metadata !288}
!285 = metadata !{i32 786689, metadata !281, metadata !"fd", metadata !27, i32 16777896, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 680]
!286 = metadata !{i32 786689, metadata !281, metadata !"mode", metadata !27, i32 33555112, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 680]
!287 = metadata !{i32 786688, metadata !281, metadata !"f", metadata !27, i32 683, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 683]
!288 = metadata !{i32 786688, metadata !289, metadata !"r", metadata !27, i32 700, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 700]
!289 = metadata !{i32 786443, metadata !26, metadata !290, i32 699, i32 0, i32 151} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!290 = metadata !{i32 786443, metadata !26, metadata !281, i32 697, i32 0, i32 149} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!291 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"chown", metadata !"chown", metadata !"", i32 713, metadata !292, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @chown, null, null, metadata !296, i32 713
!292 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !293, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!293 = metadata !{metadata !30, metadata !31, metadata !294, metadata !295}
!294 = metadata !{i32 786454, metadata !26, null, metadata !"uid_t", i32 80, i64 0, i64 0, i64 0, i32 0, metadata !61} ; [ DW_TAG_typedef ] [uid_t] [line 80, size 0, align 0, offset 0] [from __uid_t]
!295 = metadata !{i32 786454, metadata !26, null, metadata !"gid_t", i32 65, i64 0, i64 0, i64 0, i32 0, metadata !63} ; [ DW_TAG_typedef ] [gid_t] [line 65, size 0, align 0, offset 0] [from __gid_t]
!296 = metadata !{metadata !297, metadata !298, metadata !299, metadata !300, metadata !301}
!297 = metadata !{i32 786689, metadata !291, metadata !"path", metadata !27, i32 16777929, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 713]
!298 = metadata !{i32 786689, metadata !291, metadata !"owner", metadata !27, i32 33555145, metadata !294, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 713]
!299 = metadata !{i32 786689, metadata !291, metadata !"group", metadata !27, i32 50332361, metadata !295, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 713]
!300 = metadata !{i32 786688, metadata !291, metadata !"df", metadata !27, i32 714, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 714]
!301 = metadata !{i32 786688, metadata !302, metadata !"r", metadata !27, i32 719, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 719]
!302 = metadata !{i32 786443, metadata !26, metadata !303, i32 718, i32 0, i32 155} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!303 = metadata !{i32 786443, metadata !26, metadata !291, i32 716, i32 0, i32 153} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!304 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"fchown", metadata !"fchown", metadata !"", i32 726, metadata !305, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @fchown, null, null, metadata !307, i32 
!305 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !306, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!306 = metadata !{metadata !30, metadata !30, metadata !294, metadata !295}
!307 = metadata !{metadata !308, metadata !309, metadata !310, metadata !311, metadata !312}
!308 = metadata !{i32 786689, metadata !304, metadata !"fd", metadata !27, i32 16777942, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 726]
!309 = metadata !{i32 786689, metadata !304, metadata !"owner", metadata !27, i32 33555158, metadata !294, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 726]
!310 = metadata !{i32 786689, metadata !304, metadata !"group", metadata !27, i32 50332374, metadata !295, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 726]
!311 = metadata !{i32 786688, metadata !304, metadata !"f", metadata !27, i32 727, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 727]
!312 = metadata !{i32 786688, metadata !313, metadata !"r", metadata !27, i32 737, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 737]
!313 = metadata !{i32 786443, metadata !26, metadata !314, i32 736, i32 0, i32 161} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!314 = metadata !{i32 786443, metadata !26, metadata !304, i32 734, i32 0, i32 159} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!315 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"lchown", metadata !"lchown", metadata !"", i32 744, metadata !292, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @lchown, null, null, metadata !316, i32 
!316 = metadata !{metadata !317, metadata !318, metadata !319, metadata !320, metadata !321}
!317 = metadata !{i32 786689, metadata !315, metadata !"path", metadata !27, i32 16777960, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 744]
!318 = metadata !{i32 786689, metadata !315, metadata !"owner", metadata !27, i32 33555176, metadata !294, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 744]
!319 = metadata !{i32 786689, metadata !315, metadata !"group", metadata !27, i32 50332392, metadata !295, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 744]
!320 = metadata !{i32 786688, metadata !315, metadata !"df", metadata !27, i32 746, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 746]
!321 = metadata !{i32 786688, metadata !322, metadata !"r", metadata !27, i32 751, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 751]
!322 = metadata !{i32 786443, metadata !26, metadata !323, i32 750, i32 0, i32 165} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!323 = metadata !{i32 786443, metadata !26, metadata !315, i32 748, i32 0, i32 163} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!324 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__fd_fstat", metadata !"__fd_fstat", metadata !"", i32 758, metadata !325, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat64*)* @__fd_fstat, null, null, 
!325 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !326, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!326 = metadata !{metadata !30, metadata !30, metadata !47}
!327 = metadata !{metadata !328, metadata !329, metadata !330, metadata !331}
!328 = metadata !{i32 786689, metadata !324, metadata !"fd", metadata !27, i32 16777974, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 758]
!329 = metadata !{i32 786689, metadata !324, metadata !"buf", metadata !27, i32 33555190, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 758]
!330 = metadata !{i32 786688, metadata !324, metadata !"f", metadata !27, i32 759, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 759]
!331 = metadata !{i32 786688, metadata !332, metadata !"r", metadata !27, i32 768, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 768]
!332 = metadata !{i32 786443, metadata !26, metadata !333, i32 766, i32 0, i32 170} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!333 = metadata !{i32 786443, metadata !26, metadata !324, i32 766, i32 0, i32 169} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!334 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__fd_ftruncate", metadata !"__fd_ftruncate", metadata !"", i32 781, metadata !335, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @__fd_ftruncate, null, null, 
!335 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !336, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!336 = metadata !{metadata !30, metadata !30, metadata !113}
!337 = metadata !{metadata !338, metadata !339, metadata !340, metadata !341}
!338 = metadata !{i32 786689, metadata !334, metadata !"fd", metadata !27, i32 16777997, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 781]
!339 = metadata !{i32 786689, metadata !334, metadata !"length", metadata !27, i32 33555213, metadata !113, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 781]
!340 = metadata !{i32 786688, metadata !334, metadata !"f", metadata !27, i32 783, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 783]
!341 = metadata !{i32 786688, metadata !342, metadata !"r", metadata !27, i32 804, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 804]
!342 = metadata !{i32 786443, metadata !26, metadata !343, i32 802, i32 0, i32 178} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!343 = metadata !{i32 786443, metadata !26, metadata !334, i32 798, i32 0, i32 176} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!344 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__fd_getdents", metadata !"__fd_getdents", metadata !"", i32 814, metadata !345, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.dirent64*, i32)* @__fd_getden
!345 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !346, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!346 = metadata !{metadata !30, metadata !43, metadata !347, metadata !43}
!347 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !348} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dirent64]
!348 = metadata !{i32 786451, metadata !349, null, metadata !"dirent64", i32 37, i64 2240, i64 64, i32 0, i32 0, null, metadata !350, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [dirent64] [line 37, size 2240, align 64, offset 0] [def] [from ]
!349 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/dirent.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!350 = metadata !{metadata !351, metadata !352, metadata !353, metadata !355, metadata !357}
!351 = metadata !{i32 786445, metadata !349, metadata !348, metadata !"d_ino", i32 39, i64 64, i64 64, i64 0, i32 0, metadata !55} ; [ DW_TAG_member ] [d_ino] [line 39, size 64, align 64, offset 0] [from __ino64_t]
!352 = metadata !{i32 786445, metadata !349, metadata !348, metadata !"d_off", i32 40, i64 64, i64 64, i64 64, i32 0, metadata !114} ; [ DW_TAG_member ] [d_off] [line 40, size 64, align 64, offset 64] [from __off64_t]
!353 = metadata !{i32 786445, metadata !349, metadata !348, metadata !"d_reclen", i32 41, i64 16, i64 16, i64 128, i32 0, metadata !354} ; [ DW_TAG_member ] [d_reclen] [line 41, size 16, align 16, offset 128] [from unsigned short]
!354 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!355 = metadata !{i32 786445, metadata !349, metadata !348, metadata !"d_type", i32 42, i64 8, i64 8, i64 144, i32 0, metadata !356} ; [ DW_TAG_member ] [d_type] [line 42, size 8, align 8, offset 144] [from unsigned char]
!356 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!357 = metadata !{i32 786445, metadata !349, metadata !348, metadata !"d_name", i32 43, i64 2048, i64 8, i64 152, i32 0, metadata !358} ; [ DW_TAG_member ] [d_name] [line 43, size 2048, align 8, offset 152] [from ]
!358 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !33, metadata !359, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!359 = metadata !{metadata !360}
!360 = metadata !{i32 786465, i64 0, i64 256}     ; [ DW_TAG_subrange_type ] [0, 255]
!361 = metadata !{metadata !362, metadata !363, metadata !364, metadata !365, metadata !366, metadata !371, metadata !372, metadata !373, metadata !376, metadata !378, metadata !379, metadata !380, metadata !383}
!362 = metadata !{i32 786689, metadata !344, metadata !"fd", metadata !27, i32 16778030, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 814]
!363 = metadata !{i32 786689, metadata !344, metadata !"dirp", metadata !27, i32 33555246, metadata !347, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirp] [line 814]
!364 = metadata !{i32 786689, metadata !344, metadata !"count", metadata !27, i32 50332462, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 814]
!365 = metadata !{i32 786688, metadata !344, metadata !"f", metadata !27, i32 815, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 815]
!366 = metadata !{i32 786688, metadata !367, metadata !"i", metadata !27, i32 829, metadata !113, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 829]
!367 = metadata !{i32 786443, metadata !26, metadata !368, i32 827, i32 0, i32 186} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!368 = metadata !{i32 786443, metadata !26, metadata !369, i32 827, i32 0, i32 185} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!369 = metadata !{i32 786443, metadata !26, metadata !370, i32 826, i32 0, i32 184} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!370 = metadata !{i32 786443, metadata !26, metadata !344, i32 822, i32 0, i32 182} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!371 = metadata !{i32 786688, metadata !367, metadata !"pad", metadata !27, i32 829, metadata !113, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pad] [line 829]
!372 = metadata !{i32 786688, metadata !367, metadata !"bytes", metadata !27, i32 829, metadata !113, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bytes] [line 829]
!373 = metadata !{i32 786688, metadata !374, metadata !"df", metadata !27, i32 839, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 839]
!374 = metadata !{i32 786443, metadata !26, metadata !375, i32 838, i32 0, i32 190} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!375 = metadata !{i32 786443, metadata !26, metadata !367, i32 838, i32 0, i32 189} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!376 = metadata !{i32 786688, metadata !377, metadata !"os_pos", metadata !27, i32 862, metadata !113, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_pos] [line 862]
!377 = metadata !{i32 786443, metadata !26, metadata !368, i32 861, i32 0, i32 191} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!378 = metadata !{i32 786688, metadata !377, metadata !"res", metadata !27, i32 863, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 863]
!379 = metadata !{i32 786688, metadata !377, metadata !"s", metadata !27, i32 864, metadata !113, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 864]
!380 = metadata !{i32 786688, metadata !381, metadata !"pos", metadata !27, i32 880, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 880]
!381 = metadata !{i32 786443, metadata !26, metadata !382, i32 879, i32 0, i32 194} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!382 = metadata !{i32 786443, metadata !26, metadata !377, i32 877, i32 0, i32 192} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!383 = metadata !{i32 786688, metadata !384, metadata !"dp", metadata !27, i32 886, metadata !347, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dp] [line 886]
!384 = metadata !{i32 786443, metadata !26, metadata !381, i32 885, i32 0, i32 195} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!385 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"ioctl", metadata !"ioctl", metadata !"", i32 898, metadata !386, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64, ...)* @ioctl, null, null, metadata !388, i32 898
!386 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !387, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!387 = metadata !{metadata !30, metadata !30, metadata !53}
!388 = metadata !{metadata !389, metadata !390, metadata !391, metadata !392, metadata !406, metadata !407, metadata !410, metadata !431, metadata !441, metadata !444}
!389 = metadata !{i32 786689, metadata !385, metadata !"fd", metadata !27, i32 16778114, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 898]
!390 = metadata !{i32 786689, metadata !385, metadata !"request", metadata !27, i32 33555330, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [request] [line 898]
!391 = metadata !{i32 786688, metadata !385, metadata !"f", metadata !27, i32 902, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 902]
!392 = metadata !{i32 786688, metadata !385, metadata !"ap", metadata !27, i32 903, metadata !393, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 903]
!393 = metadata !{i32 786454, metadata !26, null, metadata !"va_list", i32 79, i64 0, i64 0, i64 0, i32 0, metadata !394} ; [ DW_TAG_typedef ] [va_list] [line 79, size 0, align 0, offset 0] [from __gnuc_va_list]
!394 = metadata !{i32 786454, metadata !26, null, metadata !"__gnuc_va_list", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !395} ; [ DW_TAG_typedef ] [__gnuc_va_list] [line 48, size 0, align 0, offset 0] [from __builtin_va_list]
!395 = metadata !{i32 786454, metadata !26, null, metadata !"__builtin_va_list", i32 903, i64 0, i64 0, i64 0, i32 0, metadata !396} ; [ DW_TAG_typedef ] [__builtin_va_list] [line 903, size 0, align 0, offset 0] [from ]
!396 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !397, metadata !404, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __va_list_tag]
!397 = metadata !{i32 786454, metadata !26, null, metadata !"__va_list_tag", i32 903, i64 0, i64 0, i64 0, i32 0, metadata !398} ; [ DW_TAG_typedef ] [__va_list_tag] [line 903, size 0, align 0, offset 0] [from __va_list_tag]
!398 = metadata !{i32 786451, metadata !2, null, metadata !"__va_list_tag", i32 903, i64 192, i64 64, i32 0, i32 0, null, metadata !399, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 903, size 192, align 64, offset 0] [def] [
!399 = metadata !{metadata !400, metadata !401, metadata !402, metadata !403}
!400 = metadata !{i32 786445, metadata !2, metadata !398, metadata !"gp_offset", i32 903, i64 32, i64 32, i64 0, i32 0, metadata !43} ; [ DW_TAG_member ] [gp_offset] [line 903, size 32, align 32, offset 0] [from unsigned int]
!401 = metadata !{i32 786445, metadata !2, metadata !398, metadata !"fp_offset", i32 903, i64 32, i64 32, i64 32, i32 0, metadata !43} ; [ DW_TAG_member ] [fp_offset] [line 903, size 32, align 32, offset 32] [from unsigned int]
!402 = metadata !{i32 786445, metadata !2, metadata !398, metadata !"overflow_arg_area", i32 903, i64 64, i64 64, i64 64, i32 0, metadata !173} ; [ DW_TAG_member ] [overflow_arg_area] [line 903, size 64, align 64, offset 64] [from ]
!403 = metadata !{i32 786445, metadata !2, metadata !398, metadata !"reg_save_area", i32 903, i64 64, i64 64, i64 128, i32 0, metadata !173} ; [ DW_TAG_member ] [reg_save_area] [line 903, size 64, align 64, offset 128] [from ]
!404 = metadata !{metadata !405}
!405 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 0]
!406 = metadata !{i32 786688, metadata !385, metadata !"buf", metadata !27, i32 904, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 904]
!407 = metadata !{i32 786688, metadata !408, metadata !"stat", metadata !27, i32 920, metadata !219, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stat] [line 920]
!408 = metadata !{i32 786443, metadata !26, metadata !409, i32 919, i32 0, i32 199} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!409 = metadata !{i32 786443, metadata !26, metadata !385, i32 919, i32 0, i32 198} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!410 = metadata !{i32 786688, metadata !411, metadata !"ts", metadata !27, i32 924, metadata !413, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ts] [line 924]
!411 = metadata !{i32 786443, metadata !26, metadata !412, i32 923, i32 0, i32 201} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!412 = metadata !{i32 786443, metadata !26, metadata !408, i32 922, i32 0, i32 200} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!413 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !414} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from termios]
!414 = metadata !{i32 786451, metadata !415, null, metadata !"termios", i32 28, i64 480, i64 32, i32 0, i32 0, null, metadata !416, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [termios] [line 28, size 480, align 32, offset 0] [def] [from ]
!415 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/termios.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!416 = metadata !{metadata !417, metadata !419, metadata !420, metadata !421, metadata !422, metadata !424, metadata !428, metadata !430}
!417 = metadata !{i32 786445, metadata !415, metadata !414, metadata !"c_iflag", i32 30, i64 32, i64 32, i64 0, i32 0, metadata !418} ; [ DW_TAG_member ] [c_iflag] [line 30, size 32, align 32, offset 0] [from tcflag_t]
!418 = metadata !{i32 786454, metadata !415, null, metadata !"tcflag_t", i32 25, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [tcflag_t] [line 25, size 0, align 0, offset 0] [from unsigned int]
!419 = metadata !{i32 786445, metadata !415, metadata !414, metadata !"c_oflag", i32 31, i64 32, i64 32, i64 32, i32 0, metadata !418} ; [ DW_TAG_member ] [c_oflag] [line 31, size 32, align 32, offset 32] [from tcflag_t]
!420 = metadata !{i32 786445, metadata !415, metadata !414, metadata !"c_cflag", i32 32, i64 32, i64 32, i64 64, i32 0, metadata !418} ; [ DW_TAG_member ] [c_cflag] [line 32, size 32, align 32, offset 64] [from tcflag_t]
!421 = metadata !{i32 786445, metadata !415, metadata !414, metadata !"c_lflag", i32 33, i64 32, i64 32, i64 96, i32 0, metadata !418} ; [ DW_TAG_member ] [c_lflag] [line 33, size 32, align 32, offset 96] [from tcflag_t]
!422 = metadata !{i32 786445, metadata !415, metadata !414, metadata !"c_line", i32 34, i64 8, i64 8, i64 128, i32 0, metadata !423} ; [ DW_TAG_member ] [c_line] [line 34, size 8, align 8, offset 128] [from cc_t]
!423 = metadata !{i32 786454, metadata !415, null, metadata !"cc_t", i32 23, i64 0, i64 0, i64 0, i32 0, metadata !356} ; [ DW_TAG_typedef ] [cc_t] [line 23, size 0, align 0, offset 0] [from unsigned char]
!424 = metadata !{i32 786445, metadata !415, metadata !414, metadata !"c_cc", i32 35, i64 256, i64 8, i64 136, i32 0, metadata !425} ; [ DW_TAG_member ] [c_cc] [line 35, size 256, align 8, offset 136] [from ]
!425 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 8, i32 0, i32 0, metadata !423, metadata !426, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 8, offset 0] [from cc_t]
!426 = metadata !{metadata !427}
!427 = metadata !{i32 786465, i64 0, i64 32}      ; [ DW_TAG_subrange_type ] [0, 31]
!428 = metadata !{i32 786445, metadata !415, metadata !414, metadata !"c_ispeed", i32 36, i64 32, i64 32, i64 416, i32 0, metadata !429} ; [ DW_TAG_member ] [c_ispeed] [line 36, size 32, align 32, offset 416] [from speed_t]
!429 = metadata !{i32 786454, metadata !415, null, metadata !"speed_t", i32 24, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [speed_t] [line 24, size 0, align 0, offset 0] [from unsigned int]
!430 = metadata !{i32 786445, metadata !415, metadata !414, metadata !"c_ospeed", i32 37, i64 32, i64 32, i64 448, i32 0, metadata !429} ; [ DW_TAG_member ] [c_ospeed] [line 37, size 32, align 32, offset 448] [from speed_t]
!431 = metadata !{i32 786688, metadata !432, metadata !"ws", metadata !27, i32 993, metadata !433, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ws] [line 993]
!432 = metadata !{i32 786443, metadata !26, metadata !412, i32 992, i32 0, i32 217} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!433 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !434} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from winsize]
!434 = metadata !{i32 786451, metadata !435, null, metadata !"winsize", i32 27, i64 64, i64 16, i32 0, i32 0, null, metadata !436, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [winsize] [line 27, size 64, align 16, offset 0] [def] [from ]
!435 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/ioctl-types.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!436 = metadata !{metadata !437, metadata !438, metadata !439, metadata !440}
!437 = metadata !{i32 786445, metadata !435, metadata !434, metadata !"ws_row", i32 29, i64 16, i64 16, i64 0, i32 0, metadata !354} ; [ DW_TAG_member ] [ws_row] [line 29, size 16, align 16, offset 0] [from unsigned short]
!438 = metadata !{i32 786445, metadata !435, metadata !434, metadata !"ws_col", i32 30, i64 16, i64 16, i64 16, i32 0, metadata !354} ; [ DW_TAG_member ] [ws_col] [line 30, size 16, align 16, offset 16] [from unsigned short]
!439 = metadata !{i32 786445, metadata !435, metadata !434, metadata !"ws_xpixel", i32 31, i64 16, i64 16, i64 32, i32 0, metadata !354} ; [ DW_TAG_member ] [ws_xpixel] [line 31, size 16, align 16, offset 32] [from unsigned short]
!440 = metadata !{i32 786445, metadata !435, metadata !434, metadata !"ws_ypixel", i32 32, i64 16, i64 16, i64 48, i32 0, metadata !354} ; [ DW_TAG_member ] [ws_ypixel] [line 32, size 16, align 16, offset 48] [from unsigned short]
!441 = metadata !{i32 786688, metadata !442, metadata !"res", metadata !27, i32 1016, metadata !443, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 1016]
!442 = metadata !{i32 786443, metadata !26, metadata !412, i32 1015, i32 0, i32 225} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!443 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!444 = metadata !{i32 786688, metadata !445, metadata !"r", metadata !27, i32 1041, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1041]
!445 = metadata !{i32 786443, metadata !26, metadata !409, i32 1040, i32 0, i32 233} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!446 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"fcntl", metadata !"fcntl", metadata !"", i32 1048, metadata !447, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, ...)* @fcntl, null, null, metadata !449, i32 10
!447 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !448, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!448 = metadata !{metadata !30, metadata !30, metadata !30}
!449 = metadata !{metadata !450, metadata !451, metadata !452, metadata !453, metadata !454, metadata !455, metadata !460}
!450 = metadata !{i32 786689, metadata !446, metadata !"fd", metadata !27, i32 16778264, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 1048]
!451 = metadata !{i32 786689, metadata !446, metadata !"cmd", metadata !27, i32 33555480, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cmd] [line 1048]
!452 = metadata !{i32 786688, metadata !446, metadata !"f", metadata !27, i32 1049, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1049]
!453 = metadata !{i32 786688, metadata !446, metadata !"ap", metadata !27, i32 1050, metadata !393, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 1050]
!454 = metadata !{i32 786688, metadata !446, metadata !"arg", metadata !27, i32 1051, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [arg] [line 1051]
!455 = metadata !{i32 786688, metadata !456, metadata !"flags", metadata !27, i32 1070, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flags] [line 1070]
!456 = metadata !{i32 786443, metadata !26, metadata !457, i32 1069, i32 0, i32 243} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!457 = metadata !{i32 786443, metadata !26, metadata !458, i32 1068, i32 0, i32 242} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!458 = metadata !{i32 786443, metadata !26, metadata !459, i32 1067, i32 0, i32 241} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!459 = metadata !{i32 786443, metadata !26, metadata !446, i32 1067, i32 0, i32 240} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!460 = metadata !{i32 786688, metadata !461, metadata !"r", metadata !27, i32 1096, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1096]
!461 = metadata !{i32 786443, metadata !26, metadata !459, i32 1095, i32 0, i32 248} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!462 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__fd_statfs", metadata !"__fd_statfs", metadata !"", i32 1103, metadata !463, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @__fd_statfs, null, nu
!463 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !464, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!464 = metadata !{metadata !30, metadata !31, metadata !465}
!465 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !466} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from statfs]
!466 = metadata !{i32 786451, metadata !467, null, metadata !"statfs", i32 24, i64 960, i64 64, i32 0, i32 0, null, metadata !468, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [statfs] [line 24, size 960, align 64, offset 0] [def] [from ]
!467 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/statfs.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!468 = metadata !{metadata !469, metadata !471, metadata !472, metadata !474, metadata !475, metadata !476, metadata !478, metadata !479, metadata !488, metadata !489, metadata !490, metadata !491}
!469 = metadata !{i32 786445, metadata !467, metadata !466, metadata !"f_type", i32 26, i64 64, i64 64, i64 0, i32 0, metadata !470} ; [ DW_TAG_member ] [f_type] [line 26, size 64, align 64, offset 0] [from __fsword_t]
!470 = metadata !{i32 786454, metadata !467, null, metadata !"__fsword_t", i32 170, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__fsword_t] [line 170, size 0, align 0, offset 0] [from long int]
!471 = metadata !{i32 786445, metadata !467, metadata !466, metadata !"f_bsize", i32 27, i64 64, i64 64, i64 64, i32 0, metadata !470} ; [ DW_TAG_member ] [f_bsize] [line 27, size 64, align 64, offset 64] [from __fsword_t]
!472 = metadata !{i32 786445, metadata !467, metadata !466, metadata !"f_blocks", i32 29, i64 64, i64 64, i64 128, i32 0, metadata !473} ; [ DW_TAG_member ] [f_blocks] [line 29, size 64, align 64, offset 128] [from __fsblkcnt_t]
!473 = metadata !{i32 786454, metadata !467, null, metadata !"__fsblkcnt_t", i32 162, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [__fsblkcnt_t] [line 162, size 0, align 0, offset 0] [from long unsigned int]
!474 = metadata !{i32 786445, metadata !467, metadata !466, metadata !"f_bfree", i32 30, i64 64, i64 64, i64 192, i32 0, metadata !473} ; [ DW_TAG_member ] [f_bfree] [line 30, size 64, align 64, offset 192] [from __fsblkcnt_t]
!475 = metadata !{i32 786445, metadata !467, metadata !466, metadata !"f_bavail", i32 31, i64 64, i64 64, i64 256, i32 0, metadata !473} ; [ DW_TAG_member ] [f_bavail] [line 31, size 64, align 64, offset 256] [from __fsblkcnt_t]
!476 = metadata !{i32 786445, metadata !467, metadata !466, metadata !"f_files", i32 32, i64 64, i64 64, i64 320, i32 0, metadata !477} ; [ DW_TAG_member ] [f_files] [line 32, size 64, align 64, offset 320] [from __fsfilcnt_t]
!477 = metadata !{i32 786454, metadata !467, null, metadata !"__fsfilcnt_t", i32 166, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [__fsfilcnt_t] [line 166, size 0, align 0, offset 0] [from long unsigned int]
!478 = metadata !{i32 786445, metadata !467, metadata !466, metadata !"f_ffree", i32 33, i64 64, i64 64, i64 384, i32 0, metadata !477} ; [ DW_TAG_member ] [f_ffree] [line 33, size 64, align 64, offset 384] [from __fsfilcnt_t]
!479 = metadata !{i32 786445, metadata !467, metadata !466, metadata !"f_fsid", i32 41, i64 64, i64 32, i64 448, i32 0, metadata !480} ; [ DW_TAG_member ] [f_fsid] [line 41, size 64, align 32, offset 448] [from __fsid_t]
!480 = metadata !{i32 786454, metadata !467, null, metadata !"__fsid_t", i32 134, i64 0, i64 0, i64 0, i32 0, metadata !481} ; [ DW_TAG_typedef ] [__fsid_t] [line 134, size 0, align 0, offset 0] [from ]
!481 = metadata !{i32 786451, metadata !482, null, metadata !"", i32 134, i64 64, i64 32, i32 0, i32 0, null, metadata !483, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 134, size 64, align 32, offset 0] [def] [from ]
!482 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!483 = metadata !{metadata !484}
!484 = metadata !{i32 786445, metadata !482, metadata !481, metadata !"__val", i32 134, i64 64, i64 32, i64 0, i32 0, metadata !485} ; [ DW_TAG_member ] [__val] [line 134, size 64, align 32, offset 0] [from ]
!485 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 64, i64 32, i32 0, i32 0, metadata !30, metadata !486, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!486 = metadata !{metadata !487}
!487 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 1]
!488 = metadata !{i32 786445, metadata !467, metadata !466, metadata !"f_namelen", i32 42, i64 64, i64 64, i64 512, i32 0, metadata !470} ; [ DW_TAG_member ] [f_namelen] [line 42, size 64, align 64, offset 512] [from __fsword_t]
!489 = metadata !{i32 786445, metadata !467, metadata !466, metadata !"f_frsize", i32 43, i64 64, i64 64, i64 576, i32 0, metadata !470} ; [ DW_TAG_member ] [f_frsize] [line 43, size 64, align 64, offset 576] [from __fsword_t]
!490 = metadata !{i32 786445, metadata !467, metadata !466, metadata !"f_flags", i32 44, i64 64, i64 64, i64 640, i32 0, metadata !470} ; [ DW_TAG_member ] [f_flags] [line 44, size 64, align 64, offset 640] [from __fsword_t]
!491 = metadata !{i32 786445, metadata !467, metadata !466, metadata !"f_spare", i32 45, i64 256, i64 64, i64 704, i32 0, metadata !492} ; [ DW_TAG_member ] [f_spare] [line 45, size 256, align 64, offset 704] [from ]
!492 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 64, i32 0, i32 0, metadata !470, metadata !493, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from __fsword_t]
!493 = metadata !{metadata !494}
!494 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!495 = metadata !{metadata !496, metadata !497, metadata !498, metadata !499}
!496 = metadata !{i32 786689, metadata !462, metadata !"path", metadata !27, i32 16778319, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 1103]
!497 = metadata !{i32 786689, metadata !462, metadata !"buf", metadata !27, i32 33555535, metadata !465, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1103]
!498 = metadata !{i32 786688, metadata !462, metadata !"dfile", metadata !27, i32 1104, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1104]
!499 = metadata !{i32 786688, metadata !500, metadata !"r", metadata !27, i32 1113, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1113]
!500 = metadata !{i32 786443, metadata !26, metadata !462, i32 1112, i32 0, i32 252} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!501 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"fstatfs", metadata !"fstatfs", metadata !"", i32 1120, metadata !502, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.statfs*)* @fstatfs, null, null, metadata
!502 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !503, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!503 = metadata !{metadata !30, metadata !30, metadata !465}
!504 = metadata !{metadata !505, metadata !506, metadata !507, metadata !508}
!505 = metadata !{i32 786689, metadata !501, metadata !"fd", metadata !27, i32 16778336, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 1120]
!506 = metadata !{i32 786689, metadata !501, metadata !"buf", metadata !27, i32 33555552, metadata !465, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1120]
!507 = metadata !{i32 786688, metadata !501, metadata !"f", metadata !27, i32 1121, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1121]
!508 = metadata !{i32 786688, metadata !509, metadata !"r", metadata !27, i32 1133, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1133]
!509 = metadata !{i32 786443, metadata !26, metadata !510, i32 1132, i32 0, i32 258} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!510 = metadata !{i32 786443, metadata !26, metadata !501, i32 1128, i32 0, i32 256} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!511 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"fsync", metadata !"fsync", metadata !"", i32 1140, metadata !162, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fsync, null, null, metadata !512, i32 1140} ; [ DW
!512 = metadata !{metadata !513, metadata !514, metadata !515}
!513 = metadata !{i32 786689, metadata !511, metadata !"fd", metadata !27, i32 16778356, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 1140]
!514 = metadata !{i32 786688, metadata !511, metadata !"f", metadata !27, i32 1141, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1141]
!515 = metadata !{i32 786688, metadata !516, metadata !"r", metadata !27, i32 1149, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1149]
!516 = metadata !{i32 786443, metadata !26, metadata !517, i32 1148, i32 0, i32 264} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!517 = metadata !{i32 786443, metadata !26, metadata !518, i32 1146, i32 0, i32 262} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!518 = metadata !{i32 786443, metadata !26, metadata !511, i32 1143, i32 0, i32 260} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!519 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"dup2", metadata !"dup2", metadata !"", i32 1156, metadata !447, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @dup2, null, null, metadata !520, i32 1156} ; [ 
!520 = metadata !{metadata !521, metadata !522, metadata !523, metadata !524}
!521 = metadata !{i32 786689, metadata !519, metadata !"oldfd", metadata !27, i32 16778372, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldfd] [line 1156]
!522 = metadata !{i32 786689, metadata !519, metadata !"newfd", metadata !27, i32 33555588, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [newfd] [line 1156]
!523 = metadata !{i32 786688, metadata !519, metadata !"f", metadata !27, i32 1157, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1157]
!524 = metadata !{i32 786688, metadata !525, metadata !"f2", metadata !27, i32 1163, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f2] [line 1163]
!525 = metadata !{i32 786443, metadata !26, metadata !526, i32 1162, i32 0, i32 268} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!526 = metadata !{i32 786443, metadata !26, metadata !519, i32 1159, i32 0, i32 266} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!527 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"dup", metadata !"dup", metadata !"", i32 1181, metadata !162, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @dup, null, null, metadata !528, i32 1181} ; [ DW_TAG_s
!528 = metadata !{metadata !529, metadata !530, metadata !531}
!529 = metadata !{i32 786689, metadata !527, metadata !"oldfd", metadata !27, i32 16778397, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldfd] [line 1181]
!530 = metadata !{i32 786688, metadata !527, metadata !"f", metadata !27, i32 1182, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1182]
!531 = metadata !{i32 786688, metadata !532, metadata !"fd", metadata !27, i32 1187, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd] [line 1187]
!532 = metadata !{i32 786443, metadata !26, metadata !533, i32 1186, i32 0, i32 272} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!533 = metadata !{i32 786443, metadata !26, metadata !527, i32 1183, i32 0, i32 270} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!534 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"rmdir", metadata !"rmdir", metadata !"", i32 1200, metadata !257, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @rmdir, null, null, metadata !535, i32 1200} ; [ DW
!535 = metadata !{metadata !536, metadata !537}
!536 = metadata !{i32 786689, metadata !534, metadata !"pathname", metadata !27, i32 16778416, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 1200]
!537 = metadata !{i32 786688, metadata !534, metadata !"dfile", metadata !27, i32 1201, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1201]
!538 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"unlink", metadata !"unlink", metadata !"", i32 1218, metadata !257, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @unlink, null, null, metadata !539, i32 1218} ; [
!539 = metadata !{metadata !540, metadata !541}
!540 = metadata !{i32 786689, metadata !538, metadata !"pathname", metadata !27, i32 16778434, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 1218]
!541 = metadata !{i32 786688, metadata !538, metadata !"dfile", metadata !27, i32 1219, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1219]
!542 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"unlinkat", metadata !"unlinkat", metadata !"", i32 1239, metadata !543, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32)* @unlinkat, null, null, metadata !54
!543 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !544, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!544 = metadata !{metadata !30, metadata !30, metadata !31, metadata !30}
!545 = metadata !{metadata !546, metadata !547, metadata !548, metadata !549}
!546 = metadata !{i32 786689, metadata !542, metadata !"dirfd", metadata !27, i32 16778455, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirfd] [line 1239]
!547 = metadata !{i32 786689, metadata !542, metadata !"pathname", metadata !27, i32 33555671, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 1239]
!548 = metadata !{i32 786689, metadata !542, metadata !"flags", metadata !27, i32 50332887, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 1239]
!549 = metadata !{i32 786688, metadata !542, metadata !"dfile", metadata !27, i32 1242, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1242]
!550 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"readlink", metadata !"readlink", metadata !"", i32 1262, metadata !551, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i8*, i8*, i64)* @readlink, null, null, metadata !55
!551 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !552, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!552 = metadata !{metadata !171, metadata !31, metadata !45, metadata !174}
!553 = metadata !{metadata !554, metadata !555, metadata !556, metadata !557, metadata !558}
!554 = metadata !{i32 786689, metadata !550, metadata !"path", metadata !27, i32 16778478, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 1262]
!555 = metadata !{i32 786689, metadata !550, metadata !"buf", metadata !27, i32 33555694, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1262]
!556 = metadata !{i32 786689, metadata !550, metadata !"bufsize", metadata !27, i32 50332910, metadata !174, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bufsize] [line 1262]
!557 = metadata !{i32 786688, metadata !550, metadata !"dfile", metadata !27, i32 1263, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1263]
!558 = metadata !{i32 786688, metadata !559, metadata !"r", metadata !27, i32 1279, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1279]
!559 = metadata !{i32 786443, metadata !26, metadata !560, i32 1278, i32 0, i32 306} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!560 = metadata !{i32 786443, metadata !26, metadata !550, i32 1264, i32 0, i32 297} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!561 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"select", metadata !"select", metadata !"", i32 1294, metadata !562, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*,
!562 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !563, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!563 = metadata !{metadata !30, metadata !30, metadata !564, metadata !564, metadata !564, metadata !574}
!564 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !565} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from fd_set]
!565 = metadata !{i32 786454, metadata !26, null, metadata !"fd_set", i32 75, i64 0, i64 0, i64 0, i32 0, metadata !566} ; [ DW_TAG_typedef ] [fd_set] [line 75, size 0, align 0, offset 0] [from ]
!566 = metadata !{i32 786451, metadata !567, null, metadata !"", i32 64, i64 1024, i64 64, i32 0, i32 0, null, metadata !568, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 64, size 1024, align 64, offset 0] [def] [from ]
!567 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/sys/select.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!568 = metadata !{metadata !569}
!569 = metadata !{i32 786445, metadata !567, metadata !566, metadata !"fds_bits", i32 69, i64 1024, i64 64, i64 0, i32 0, metadata !570} ; [ DW_TAG_member ] [fds_bits] [line 69, size 1024, align 64, offset 0] [from ]
!570 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1024, i64 64, i32 0, i32 0, metadata !571, metadata !572, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 64, offset 0] [from __fd_mask]
!571 = metadata !{i32 786454, metadata !567, null, metadata !"__fd_mask", i32 54, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__fd_mask] [line 54, size 0, align 0, offset 0] [from long int]
!572 = metadata !{metadata !573}
!573 = metadata !{i32 786465, i64 0, i64 16}      ; [ DW_TAG_subrange_type ] [0, 15]
!574 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !139} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from timeval]
!575 = metadata !{metadata !576, metadata !577, metadata !578, metadata !579, metadata !580, metadata !581, metadata !582, metadata !583, metadata !584, metadata !585, metadata !586, metadata !587, metadata !588, metadata !589, metadata !590, metadata !5
!576 = metadata !{i32 786689, metadata !561, metadata !"nfds", metadata !27, i32 16778510, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nfds] [line 1294]
!577 = metadata !{i32 786689, metadata !561, metadata !"read", metadata !27, i32 33555726, metadata !564, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [read] [line 1294]
!578 = metadata !{i32 786689, metadata !561, metadata !"write", metadata !27, i32 50332942, metadata !564, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [write] [line 1294]
!579 = metadata !{i32 786689, metadata !561, metadata !"except", metadata !27, i32 67110159, metadata !564, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [except] [line 1295]
!580 = metadata !{i32 786689, metadata !561, metadata !"timeout", metadata !27, i32 83887375, metadata !574, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [timeout] [line 1295]
!581 = metadata !{i32 786688, metadata !561, metadata !"in_read", metadata !27, i32 1296, metadata !565, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [in_read] [line 1296]
!582 = metadata !{i32 786688, metadata !561, metadata !"in_write", metadata !27, i32 1296, metadata !565, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [in_write] [line 1296]
!583 = metadata !{i32 786688, metadata !561, metadata !"in_except", metadata !27, i32 1296, metadata !565, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [in_except] [line 1296]
!584 = metadata !{i32 786688, metadata !561, metadata !"os_read", metadata !27, i32 1296, metadata !565, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_read] [line 1296]
!585 = metadata !{i32 786688, metadata !561, metadata !"os_write", metadata !27, i32 1296, metadata !565, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_write] [line 1296]
!586 = metadata !{i32 786688, metadata !561, metadata !"os_except", metadata !27, i32 1296, metadata !565, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_except] [line 1296]
!587 = metadata !{i32 786688, metadata !561, metadata !"i", metadata !27, i32 1297, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 1297]
!588 = metadata !{i32 786688, metadata !561, metadata !"count", metadata !27, i32 1297, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 1297]
!589 = metadata !{i32 786688, metadata !561, metadata !"os_nfds", metadata !27, i32 1297, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_nfds] [line 1297]
!590 = metadata !{i32 786688, metadata !591, metadata !"f", metadata !27, i32 1327, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1327]
!591 = metadata !{i32 786443, metadata !26, metadata !592, i32 1326, i32 0, i32 320} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!592 = metadata !{i32 786443, metadata !26, metadata !593, i32 1326, i32 0, i32 319} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!593 = metadata !{i32 786443, metadata !26, metadata !594, i32 1325, i32 0, i32 318} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!594 = metadata !{i32 786443, metadata !26, metadata !561, i32 1325, i32 0, i32 317} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!595 = metadata !{i32 786688, metadata !596, metadata !"tv", metadata !27, i32 1349, metadata !139, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tv] [line 1349]
!596 = metadata !{i32 786443, metadata !26, metadata !597, i32 1346, i32 0, i32 334} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!597 = metadata !{i32 786443, metadata !26, metadata !561, i32 1346, i32 0, i32 333} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!598 = metadata !{i32 786688, metadata !596, metadata !"r", metadata !27, i32 1350, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1350]
!599 = metadata !{i32 786688, metadata !600, metadata !"f", metadata !27, i32 1365, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1365]
!600 = metadata !{i32 786443, metadata !26, metadata !601, i32 1364, i32 0, i32 341} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!601 = metadata !{i32 786443, metadata !26, metadata !602, i32 1364, i32 0, i32 340} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!602 = metadata !{i32 786443, metadata !26, metadata !603, i32 1360, i32 0, i32 339} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!603 = metadata !{i32 786443, metadata !26, metadata !596, i32 1353, i32 0, i32 335} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!604 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"getcwd", metadata !"getcwd", metadata !"", i32 1380, metadata !605, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i64)* @getcwd, null, null, metadata !607, i32 1380
!605 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !606, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!606 = metadata !{metadata !45, metadata !45, metadata !174}
!607 = metadata !{metadata !608, metadata !609, metadata !610}
!608 = metadata !{i32 786689, metadata !604, metadata !"buf", metadata !27, i32 16778596, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1380]
!609 = metadata !{i32 786689, metadata !604, metadata !"size", metadata !27, i32 33555812, metadata !174, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 1380]
!610 = metadata !{i32 786688, metadata !604, metadata !"r", metadata !27, i32 1382, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1382]
!611 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"chroot", metadata !"chroot", metadata !"", i32 1457, metadata !257, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @chroot, null, null, metadata !612, i32 1457} ; [
!612 = metadata !{metadata !613}
!613 = metadata !{i32 786689, metadata !611, metadata !"path", metadata !27, i32 16778673, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 1457]
!614 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__concretize_string", metadata !"__concretize_string", metadata !"", i32 1428, metadata !615, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !617, i3
!615 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !616, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!616 = metadata !{metadata !31, metadata !31}
!617 = metadata !{metadata !618, metadata !619, metadata !620, metadata !621, metadata !624}
!618 = metadata !{i32 786689, metadata !614, metadata !"s", metadata !27, i32 16778644, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!619 = metadata !{i32 786688, metadata !614, metadata !"sc", metadata !27, i32 1429, metadata !45, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!620 = metadata !{i32 786688, metadata !614, metadata !"i", metadata !27, i32 1430, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!621 = metadata !{i32 786688, metadata !622, metadata !"c", metadata !27, i32 1433, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!622 = metadata !{i32 786443, metadata !26, metadata !623, i32 1432, i32 0, i32 359} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!623 = metadata !{i32 786443, metadata !26, metadata !614, i32 1432, i32 0, i32 358} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!624 = metadata !{i32 786688, metadata !625, metadata !"cc", metadata !27, i32 1442, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!625 = metadata !{i32 786443, metadata !26, metadata !626, i32 1441, i32 0, i32 366} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!626 = metadata !{i32 786443, metadata !26, metadata !622, i32 1434, i32 0, i32 360} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!627 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__concretize_size", metadata !"__concretize_size", metadata !"", i32 1422, metadata !628, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !630, i32 14
!628 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !629, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!629 = metadata !{metadata !174, metadata !174}
!630 = metadata !{metadata !631, metadata !632}
!631 = metadata !{i32 786689, metadata !627, metadata !"s", metadata !27, i32 16778638, metadata !174, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!632 = metadata !{i32 786688, metadata !627, metadata !"sc", metadata !27, i32 1423, metadata !174, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!633 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__concretize_ptr", metadata !"__concretize_ptr", metadata !"", i32 1415, metadata !634, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !636, i32 1415
!634 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !635, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!635 = metadata !{metadata !173, metadata !186}
!636 = metadata !{metadata !637, metadata !638}
!637 = metadata !{i32 786689, metadata !633, metadata !"p", metadata !27, i32 16778631, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!638 = metadata !{i32 786688, metadata !633, metadata !"pc", metadata !27, i32 1417, metadata !45, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!639 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__df_chown", metadata !"__df_chown", metadata !"", i32 707, metadata !640, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !642, i32 707} ; [ DW_TAG_s
!640 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !641, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!641 = metadata !{metadata !30, metadata !38, metadata !294, metadata !295}
!642 = metadata !{metadata !643, metadata !644, metadata !645}
!643 = metadata !{i32 786689, metadata !639, metadata !"df", metadata !27, i32 16777923, metadata !38, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [df] [line 707]
!644 = metadata !{i32 786689, metadata !639, metadata !"owner", metadata !27, i32 33555139, metadata !294, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!645 = metadata !{i32 786689, metadata !639, metadata !"group", metadata !27, i32 50332355, metadata !295, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 707]
!646 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__df_chmod", metadata !"__df_chmod", metadata !"", i32 645, metadata !647, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !649, i32 645} ; [ DW_TAG_s
!647 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !648, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!648 = metadata !{metadata !30, metadata !38, metadata !93}
!649 = metadata !{metadata !650, metadata !651}
!650 = metadata !{i32 786689, metadata !646, metadata !"df", metadata !27, i32 16777861, metadata !38, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [df] [line 645]
!651 = metadata !{i32 786689, metadata !646, metadata !"mode", metadata !27, i32 33555077, metadata !93, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 645]
!652 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__get_file", metadata !"__get_file", metadata !"", i32 63, metadata !653, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !655, i32 63} ; [ DW_TAG_sub
!653 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !654, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!654 = metadata !{metadata !106, metadata !30}
!655 = metadata !{metadata !656, metadata !657}
!656 = metadata !{i32 786689, metadata !652, metadata !"fd", metadata !27, i32 16777279, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!657 = metadata !{i32 786688, metadata !658, metadata !"f", metadata !27, i32 65, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 65]
!658 = metadata !{i32 786443, metadata !26, metadata !659, i32 64, i32 0, i32 373} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!659 = metadata !{i32 786443, metadata !26, metadata !652, i32 64, i32 0, i32 372} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!660 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"has_permission", metadata !"has_permission", metadata !"", i32 97, metadata !325, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !661, i32 97} ; [ DW
!661 = metadata !{metadata !662, metadata !663, metadata !664, metadata !665, metadata !666}
!662 = metadata !{i32 786689, metadata !660, metadata !"flags", metadata !27, i32 16777313, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 97]
!663 = metadata !{i32 786689, metadata !660, metadata !"s", metadata !27, i32 33554529, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 97]
!664 = metadata !{i32 786688, metadata !660, metadata !"write_access", metadata !27, i32 98, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [write_access] [line 98]
!665 = metadata !{i32 786688, metadata !660, metadata !"read_access", metadata !27, i32 98, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [read_access] [line 98]
!666 = metadata !{i32 786688, metadata !660, metadata !"mode", metadata !27, i32 99, metadata !93, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 99]
!667 = metadata !{i32 786478, metadata !26, metadata !27, metadata !"__get_sym_file", metadata !"__get_sym_file", metadata !"", i32 39, metadata !668, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !670, i32 39} ; [ DW
!668 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !669, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!669 = metadata !{metadata !38, metadata !31}
!670 = metadata !{metadata !671, metadata !672, metadata !673, metadata !674}
!671 = metadata !{i32 786689, metadata !667, metadata !"pathname", metadata !27, i32 16777255, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!672 = metadata !{i32 786688, metadata !667, metadata !"c", metadata !27, i32 40, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 40]
!673 = metadata !{i32 786688, metadata !667, metadata !"i", metadata !27, i32 41, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 41]
!674 = metadata !{i32 786688, metadata !675, metadata !"df", metadata !27, i32 48, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 48]
!675 = metadata !{i32 786443, metadata !26, metadata !676, i32 47, i32 0, i32 383} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!676 = metadata !{i32 786443, metadata !26, metadata !677, i32 47, i32 0, i32 382} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!677 = metadata !{i32 786443, metadata !26, metadata !678, i32 46, i32 0, i32 381} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!678 = metadata !{i32 786443, metadata !26, metadata !667, i32 46, i32 0, i32 380} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!679 = metadata !{metadata !680, metadata !681, metadata !682, metadata !683, metadata !684, metadata !685, metadata !686}
!680 = metadata !{i32 786484, i32 0, metadata !161, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !27, i32 304, metadata !30, i32 1, i32 1, i32* @close.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 304] [local] [def]
!681 = metadata !{i32 786484, i32 0, metadata !168, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !27, i32 336, metadata !30, i32 1, i32 1, i32* @read.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 336] [local] [def]
!682 = metadata !{i32 786484, i32 0, metadata !183, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !27, i32 404, metadata !30, i32 1, i32 1, i32* @write.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 404] [local] [def]
!683 = metadata !{i32 786484, i32 0, metadata !271, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !27, i32 659, metadata !30, i32 1, i32 1, i32* @chmod.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 659] [local] [def]
!684 = metadata !{i32 786484, i32 0, metadata !281, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !27, i32 681, metadata !30, i32 1, i32 1, i32* @fchmod.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 681] [local] [def]
!685 = metadata !{i32 786484, i32 0, metadata !334, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !27, i32 782, metadata !30, i32 1, i32 1, i32* @__fd_ftruncate.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 782] [local] [def]
!686 = metadata !{i32 786484, i32 0, metadata !604, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !27, i32 1381, metadata !30, i32 1, i32 1, i32* @getcwd.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 1381] [local] [def]
!687 = metadata !{i32 786449, metadata !688, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !689, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_unit ]
!688 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_32.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!689 = metadata !{metadata !690, metadata !713, metadata !722, metadata !731, metadata !779, metadata !787, metadata !794, metadata !800, metadata !809, metadata !817, metadata !823, metadata !848, metadata !883, metadata !891}
!690 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"open", metadata !"open", metadata !"", i32 65, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, ...)* @open, null, null, metadata !693, i32 65} ; 
!691 = metadata !{metadata !"fd_32.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!692 = metadata !{i32 786473, metadata !691}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_32.c]
!693 = metadata !{metadata !694, metadata !695, metadata !696, metadata !699}
!694 = metadata !{i32 786689, metadata !690, metadata !"pathname", metadata !692, i32 16777281, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 65]
!695 = metadata !{i32 786689, metadata !690, metadata !"flags", metadata !692, i32 33554497, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 65]
!696 = metadata !{i32 786688, metadata !690, metadata !"mode", metadata !692, i32 66, metadata !697, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 66]
!697 = metadata !{i32 786454, metadata !691, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !698} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!698 = metadata !{i32 786454, metadata !691, null, metadata !"__mode_t", i32 129, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [__mode_t] [line 129, size 0, align 0, offset 0] [from unsigned int]
!699 = metadata !{i32 786688, metadata !700, metadata !"ap", metadata !692, i32 70, metadata !702, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 70]
!700 = metadata !{i32 786443, metadata !691, metadata !701, i32 68, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_32.c]
!701 = metadata !{i32 786443, metadata !691, metadata !690, i32 68, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_32.c]
!702 = metadata !{i32 786454, metadata !691, null, metadata !"va_list", i32 79, i64 0, i64 0, i64 0, i32 0, metadata !703} ; [ DW_TAG_typedef ] [va_list] [line 79, size 0, align 0, offset 0] [from __gnuc_va_list]
!703 = metadata !{i32 786454, metadata !691, null, metadata !"__gnuc_va_list", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !704} ; [ DW_TAG_typedef ] [__gnuc_va_list] [line 48, size 0, align 0, offset 0] [from __builtin_va_list]
!704 = metadata !{i32 786454, metadata !691, null, metadata !"__builtin_va_list", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !705} ; [ DW_TAG_typedef ] [__builtin_va_list] [line 70, size 0, align 0, offset 0] [from ]
!705 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !706, metadata !404, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __va_list_tag]
!706 = metadata !{i32 786454, metadata !691, null, metadata !"__va_list_tag", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !707} ; [ DW_TAG_typedef ] [__va_list_tag] [line 70, size 0, align 0, offset 0] [from __va_list_tag]
!707 = metadata !{i32 786451, metadata !688, null, metadata !"__va_list_tag", i32 70, i64 192, i64 64, i32 0, i32 0, null, metadata !708, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 70, size 192, align 64, offset 0] [def] [
!708 = metadata !{metadata !709, metadata !710, metadata !711, metadata !712}
!709 = metadata !{i32 786445, metadata !688, metadata !707, metadata !"gp_offset", i32 70, i64 32, i64 32, i64 0, i32 0, metadata !43} ; [ DW_TAG_member ] [gp_offset] [line 70, size 32, align 32, offset 0] [from unsigned int]
!710 = metadata !{i32 786445, metadata !688, metadata !707, metadata !"fp_offset", i32 70, i64 32, i64 32, i64 32, i32 0, metadata !43} ; [ DW_TAG_member ] [fp_offset] [line 70, size 32, align 32, offset 32] [from unsigned int]
!711 = metadata !{i32 786445, metadata !688, metadata !707, metadata !"overflow_arg_area", i32 70, i64 64, i64 64, i64 64, i32 0, metadata !173} ; [ DW_TAG_member ] [overflow_arg_area] [line 70, size 64, align 64, offset 64] [from ]
!712 = metadata !{i32 786445, metadata !688, metadata !707, metadata !"reg_save_area", i32 70, i64 64, i64 64, i64 128, i32 0, metadata !173} ; [ DW_TAG_member ] [reg_save_area] [line 70, size 64, align 64, offset 128] [from ]
!713 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"openat", metadata !"openat", metadata !"", i32 79, metadata !543, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32, ...)* @openat, null, null, metadata !714
!714 = metadata !{metadata !715, metadata !716, metadata !717, metadata !718, metadata !719}
!715 = metadata !{i32 786689, metadata !713, metadata !"fd", metadata !692, i32 16777295, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 79]
!716 = metadata !{i32 786689, metadata !713, metadata !"pathname", metadata !692, i32 33554511, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 79]
!717 = metadata !{i32 786689, metadata !713, metadata !"flags", metadata !692, i32 50331727, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 79]
!718 = metadata !{i32 786688, metadata !713, metadata !"mode", metadata !692, i32 80, metadata !697, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 80]
!719 = metadata !{i32 786688, metadata !720, metadata !"ap", metadata !692, i32 84, metadata !702, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 84]
!720 = metadata !{i32 786443, metadata !691, metadata !721, i32 82, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_32.c]
!721 = metadata !{i32 786443, metadata !691, metadata !713, i32 82, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_32.c]
!722 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"lseek", metadata !"lseek", metadata !"", i32 93, metadata !723, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @lseek, null, null, metadata !727, i32 93
!723 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !724, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!724 = metadata !{metadata !725, metadata !30, metadata !726, metadata !30}
!725 = metadata !{i32 786454, metadata !691, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!726 = metadata !{i32 786454, metadata !691, null, metadata !"off_t", i32 86, i64 0, i64 0, i64 0, i32 0, metadata !725} ; [ DW_TAG_typedef ] [off_t] [line 86, size 0, align 0, offset 0] [from __off_t]
!727 = metadata !{metadata !728, metadata !729, metadata !730}
!728 = metadata !{i32 786689, metadata !722, metadata !"fd", metadata !692, i32 16777309, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 93]
!729 = metadata !{i32 786689, metadata !722, metadata !"off", metadata !692, i32 33554525, metadata !726, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [off] [line 93]
!730 = metadata !{i32 786689, metadata !722, metadata !"whence", metadata !692, i32 50331741, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [whence] [line 93]
!731 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"__xstat", metadata !"__xstat", metadata !"", i32 97, metadata !732, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__xstat, null, null, metad
!732 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !733, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!733 = metadata !{metadata !30, metadata !30, metadata !31, metadata !734}
!734 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !735} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat]
!735 = metadata !{i32 786451, metadata !49, null, metadata !"stat", i32 46, i64 1152, i64 64, i32 0, i32 0, null, metadata !736, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat] [line 46, size 1152, align 64, offset 0] [def] [from ]
!736 = metadata !{metadata !737, metadata !738, metadata !739, metadata !740, metadata !741, metadata !742, metadata !743, metadata !744, metadata !745, metadata !746, metadata !747, metadata !748, metadata !753, metadata !754, metadata !755}
!737 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_dev", i32 48, i64 64, i64 64, i64 0, i32 0, metadata !52} ; [ DW_TAG_member ] [st_dev] [line 48, size 64, align 64, offset 0] [from __dev_t]
!738 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_ino", i32 53, i64 64, i64 64, i64 64, i32 0, metadata !224} ; [ DW_TAG_member ] [st_ino] [line 53, size 64, align 64, offset 64] [from __ino_t]
!739 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_nlink", i32 61, i64 64, i64 64, i64 128, i32 0, metadata !57} ; [ DW_TAG_member ] [st_nlink] [line 61, size 64, align 64, offset 128] [from __nlink_t]
!740 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_mode", i32 62, i64 32, i64 32, i64 192, i32 0, metadata !698} ; [ DW_TAG_member ] [st_mode] [line 62, size 32, align 32, offset 192] [from __mode_t]
!741 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_uid", i32 64, i64 32, i64 32, i64 224, i32 0, metadata !61} ; [ DW_TAG_member ] [st_uid] [line 64, size 32, align 32, offset 224] [from __uid_t]
!742 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_gid", i32 65, i64 32, i64 32, i64 256, i32 0, metadata !63} ; [ DW_TAG_member ] [st_gid] [line 65, size 32, align 32, offset 256] [from __gid_t]
!743 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"__pad0", i32 67, i64 32, i64 32, i64 288, i32 0, metadata !30} ; [ DW_TAG_member ] [__pad0] [line 67, size 32, align 32, offset 288] [from int]
!744 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_rdev", i32 69, i64 64, i64 64, i64 320, i32 0, metadata !52} ; [ DW_TAG_member ] [st_rdev] [line 69, size 64, align 64, offset 320] [from __dev_t]
!745 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_size", i32 74, i64 64, i64 64, i64 384, i32 0, metadata !725} ; [ DW_TAG_member ] [st_size] [line 74, size 64, align 64, offset 384] [from __off_t]
!746 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_blksize", i32 78, i64 64, i64 64, i64 448, i32 0, metadata !70} ; [ DW_TAG_member ] [st_blksize] [line 78, size 64, align 64, offset 448] [from __blksize_t]
!747 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_blocks", i32 80, i64 64, i64 64, i64 512, i32 0, metadata !234} ; [ DW_TAG_member ] [st_blocks] [line 80, size 64, align 64, offset 512] [from __blkcnt_t]
!748 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_atim", i32 91, i64 128, i64 64, i64 576, i32 0, metadata !749} ; [ DW_TAG_member ] [st_atim] [line 91, size 128, align 64, offset 576] [from timespec]
!749 = metadata !{i32 786451, metadata !75, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !750, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!750 = metadata !{metadata !751, metadata !752}
!751 = metadata !{i32 786445, metadata !75, metadata !749, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!752 = metadata !{i32 786445, metadata !75, metadata !749, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !80} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!753 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_mtim", i32 92, i64 128, i64 64, i64 704, i32 0, metadata !749} ; [ DW_TAG_member ] [st_mtim] [line 92, size 128, align 64, offset 704] [from timespec]
!754 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"st_ctim", i32 93, i64 128, i64 64, i64 832, i32 0, metadata !749} ; [ DW_TAG_member ] [st_ctim] [line 93, size 128, align 64, offset 832] [from timespec]
!755 = metadata !{i32 786445, metadata !49, metadata !735, metadata !"__glibc_reserved", i32 106, i64 192, i64 64, i64 960, i32 0, metadata !84} ; [ DW_TAG_member ] [__glibc_reserved] [line 106, size 192, align 64, offset 960] [from ]
!756 = metadata !{metadata !757, metadata !758, metadata !759, metadata !760, metadata !778}
!757 = metadata !{i32 786689, metadata !731, metadata !"vers", metadata !692, i32 16777313, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 97]
!758 = metadata !{i32 786689, metadata !731, metadata !"path", metadata !692, i32 33554529, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 97]
!759 = metadata !{i32 786689, metadata !731, metadata !"buf", metadata !692, i32 50331745, metadata !734, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 97]
!760 = metadata !{i32 786688, metadata !731, metadata !"tmp", metadata !692, i32 98, metadata !761, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 98]
!761 = metadata !{i32 786451, metadata !49, null, metadata !"stat64", i32 119, i64 1152, i64 64, i32 0, i32 0, null, metadata !762, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat64] [line 119, size 1152, align 64, offset 0] [def] [from ]
!762 = metadata !{metadata !763, metadata !764, metadata !765, metadata !766, metadata !767, metadata !768, metadata !769, metadata !770, metadata !771, metadata !772, metadata !773, metadata !774, metadata !775, metadata !776, metadata !777}
!763 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_dev", i32 121, i64 64, i64 64, i64 0, i32 0, metadata !52} ; [ DW_TAG_member ] [st_dev] [line 121, size 64, align 64, offset 0] [from __dev_t]
!764 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_ino", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !55} ; [ DW_TAG_member ] [st_ino] [line 123, size 64, align 64, offset 64] [from __ino64_t]
!765 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_nlink", i32 124, i64 64, i64 64, i64 128, i32 0, metadata !57} ; [ DW_TAG_member ] [st_nlink] [line 124, size 64, align 64, offset 128] [from __nlink_t]
!766 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_mode", i32 125, i64 32, i64 32, i64 192, i32 0, metadata !698} ; [ DW_TAG_member ] [st_mode] [line 125, size 32, align 32, offset 192] [from __mode_t]
!767 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_uid", i32 132, i64 32, i64 32, i64 224, i32 0, metadata !61} ; [ DW_TAG_member ] [st_uid] [line 132, size 32, align 32, offset 224] [from __uid_t]
!768 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_gid", i32 133, i64 32, i64 32, i64 256, i32 0, metadata !63} ; [ DW_TAG_member ] [st_gid] [line 133, size 32, align 32, offset 256] [from __gid_t]
!769 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"__pad0", i32 135, i64 32, i64 32, i64 288, i32 0, metadata !30} ; [ DW_TAG_member ] [__pad0] [line 135, size 32, align 32, offset 288] [from int]
!770 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_rdev", i32 136, i64 64, i64 64, i64 320, i32 0, metadata !52} ; [ DW_TAG_member ] [st_rdev] [line 136, size 64, align 64, offset 320] [from __dev_t]
!771 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_size", i32 137, i64 64, i64 64, i64 384, i32 0, metadata !725} ; [ DW_TAG_member ] [st_size] [line 137, size 64, align 64, offset 384] [from __off_t]
!772 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_blksize", i32 143, i64 64, i64 64, i64 448, i32 0, metadata !70} ; [ DW_TAG_member ] [st_blksize] [line 143, size 64, align 64, offset 448] [from __blksize_t]
!773 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_blocks", i32 144, i64 64, i64 64, i64 512, i32 0, metadata !72} ; [ DW_TAG_member ] [st_blocks] [line 144, size 64, align 64, offset 512] [from __blkcnt64_t]
!774 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_atim", i32 152, i64 128, i64 64, i64 576, i32 0, metadata !749} ; [ DW_TAG_member ] [st_atim] [line 152, size 128, align 64, offset 576] [from timespec]
!775 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_mtim", i32 153, i64 128, i64 64, i64 704, i32 0, metadata !749} ; [ DW_TAG_member ] [st_mtim] [line 153, size 128, align 64, offset 704] [from timespec]
!776 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"st_ctim", i32 154, i64 128, i64 64, i64 832, i32 0, metadata !749} ; [ DW_TAG_member ] [st_ctim] [line 154, size 128, align 64, offset 832] [from timespec]
!777 = metadata !{i32 786445, metadata !49, metadata !761, metadata !"__glibc_reserved", i32 164, i64 192, i64 64, i64 960, i32 0, metadata !84} ; [ DW_TAG_member ] [__glibc_reserved] [line 164, size 192, align 64, offset 960] [from ]
!778 = metadata !{i32 786688, metadata !731, metadata !"res", metadata !692, i32 99, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 99]
!779 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"stat", metadata !"stat", metadata !"", i32 104, metadata !780, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @stat, null, null, metadata !782, i32
!780 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !781, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!781 = metadata !{metadata !30, metadata !31, metadata !734}
!782 = metadata !{metadata !783, metadata !784, metadata !785, metadata !786}
!783 = metadata !{i32 786689, metadata !779, metadata !"path", metadata !692, i32 16777320, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 104]
!784 = metadata !{i32 786689, metadata !779, metadata !"buf", metadata !692, i32 33554536, metadata !734, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 104]
!785 = metadata !{i32 786688, metadata !779, metadata !"tmp", metadata !692, i32 105, metadata !761, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 105]
!786 = metadata !{i32 786688, metadata !779, metadata !"res", metadata !692, i32 106, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 106]
!787 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"__lxstat", metadata !"__lxstat", metadata !"", i32 111, metadata !732, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__lxstat, null, null, m
!788 = metadata !{metadata !789, metadata !790, metadata !791, metadata !792, metadata !793}
!789 = metadata !{i32 786689, metadata !787, metadata !"vers", metadata !692, i32 16777327, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 111]
!790 = metadata !{i32 786689, metadata !787, metadata !"path", metadata !692, i32 33554543, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 111]
!791 = metadata !{i32 786689, metadata !787, metadata !"buf", metadata !692, i32 50331759, metadata !734, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 111]
!792 = metadata !{i32 786688, metadata !787, metadata !"tmp", metadata !692, i32 112, metadata !761, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 112]
!793 = metadata !{i32 786688, metadata !787, metadata !"res", metadata !692, i32 113, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 113]
!794 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"lstat", metadata !"lstat", metadata !"", i32 118, metadata !780, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @lstat, null, null, metadata !795, 
!795 = metadata !{metadata !796, metadata !797, metadata !798, metadata !799}
!796 = metadata !{i32 786689, metadata !794, metadata !"path", metadata !692, i32 16777334, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 118]
!797 = metadata !{i32 786689, metadata !794, metadata !"buf", metadata !692, i32 33554550, metadata !734, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 118]
!798 = metadata !{i32 786688, metadata !794, metadata !"tmp", metadata !692, i32 119, metadata !761, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 119]
!799 = metadata !{i32 786688, metadata !794, metadata !"res", metadata !692, i32 120, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 120]
!800 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"__fxstat", metadata !"__fxstat", metadata !"", i32 125, metadata !801, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, %struct.stat*)* @__fxstat, null, null, m
!801 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !802, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!802 = metadata !{metadata !30, metadata !30, metadata !30, metadata !734}
!803 = metadata !{metadata !804, metadata !805, metadata !806, metadata !807, metadata !808}
!804 = metadata !{i32 786689, metadata !800, metadata !"vers", metadata !692, i32 16777341, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 125]
!805 = metadata !{i32 786689, metadata !800, metadata !"fd", metadata !692, i32 33554557, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 125]
!806 = metadata !{i32 786689, metadata !800, metadata !"buf", metadata !692, i32 50331773, metadata !734, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 125]
!807 = metadata !{i32 786688, metadata !800, metadata !"tmp", metadata !692, i32 126, metadata !761, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 126]
!808 = metadata !{i32 786688, metadata !800, metadata !"res", metadata !692, i32 127, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 127]
!809 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"fstat", metadata !"fstat", metadata !"", i32 132, metadata !810, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat*)* @fstat, null, null, metadata !812, 
!810 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !811, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!811 = metadata !{metadata !30, metadata !30, metadata !734}
!812 = metadata !{metadata !813, metadata !814, metadata !815, metadata !816}
!813 = metadata !{i32 786689, metadata !809, metadata !"fd", metadata !692, i32 16777348, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 132]
!814 = metadata !{i32 786689, metadata !809, metadata !"buf", metadata !692, i32 33554564, metadata !734, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 132]
!815 = metadata !{i32 786688, metadata !809, metadata !"tmp", metadata !692, i32 133, metadata !761, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 133]
!816 = metadata !{i32 786688, metadata !809, metadata !"res", metadata !692, i32 134, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 134]
!817 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"ftruncate", metadata !"ftruncate", metadata !"", i32 139, metadata !818, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @ftruncate, null, null, metadata !820
!818 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !819, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!819 = metadata !{metadata !30, metadata !30, metadata !726}
!820 = metadata !{metadata !821, metadata !822}
!821 = metadata !{i32 786689, metadata !817, metadata !"fd", metadata !692, i32 16777355, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 139]
!822 = metadata !{i32 786689, metadata !817, metadata !"length", metadata !692, i32 33554571, metadata !726, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 139]
!823 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"statfs", metadata !"statfs", metadata !"", i32 143, metadata !824, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @statfs, null, null, metadata !
!824 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !825, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!825 = metadata !{metadata !30, metadata !31, metadata !826}
!826 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !827} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from statfs]
!827 = metadata !{i32 786451, metadata !467, null, metadata !"statfs", i32 24, i64 960, i64 64, i32 0, i32 0, null, metadata !828, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [statfs] [line 24, size 960, align 64, offset 0] [def] [from ]
!828 = metadata !{metadata !829, metadata !830, metadata !831, metadata !832, metadata !833, metadata !834, metadata !835, metadata !836, metadata !841, metadata !842, metadata !843, metadata !844}
!829 = metadata !{i32 786445, metadata !467, metadata !827, metadata !"f_type", i32 26, i64 64, i64 64, i64 0, i32 0, metadata !470} ; [ DW_TAG_member ] [f_type] [line 26, size 64, align 64, offset 0] [from __fsword_t]
!830 = metadata !{i32 786445, metadata !467, metadata !827, metadata !"f_bsize", i32 27, i64 64, i64 64, i64 64, i32 0, metadata !470} ; [ DW_TAG_member ] [f_bsize] [line 27, size 64, align 64, offset 64] [from __fsword_t]
!831 = metadata !{i32 786445, metadata !467, metadata !827, metadata !"f_blocks", i32 29, i64 64, i64 64, i64 128, i32 0, metadata !473} ; [ DW_TAG_member ] [f_blocks] [line 29, size 64, align 64, offset 128] [from __fsblkcnt_t]
!832 = metadata !{i32 786445, metadata !467, metadata !827, metadata !"f_bfree", i32 30, i64 64, i64 64, i64 192, i32 0, metadata !473} ; [ DW_TAG_member ] [f_bfree] [line 30, size 64, align 64, offset 192] [from __fsblkcnt_t]
!833 = metadata !{i32 786445, metadata !467, metadata !827, metadata !"f_bavail", i32 31, i64 64, i64 64, i64 256, i32 0, metadata !473} ; [ DW_TAG_member ] [f_bavail] [line 31, size 64, align 64, offset 256] [from __fsblkcnt_t]
!834 = metadata !{i32 786445, metadata !467, metadata !827, metadata !"f_files", i32 32, i64 64, i64 64, i64 320, i32 0, metadata !477} ; [ DW_TAG_member ] [f_files] [line 32, size 64, align 64, offset 320] [from __fsfilcnt_t]
!835 = metadata !{i32 786445, metadata !467, metadata !827, metadata !"f_ffree", i32 33, i64 64, i64 64, i64 384, i32 0, metadata !477} ; [ DW_TAG_member ] [f_ffree] [line 33, size 64, align 64, offset 384] [from __fsfilcnt_t]
!836 = metadata !{i32 786445, metadata !467, metadata !827, metadata !"f_fsid", i32 41, i64 64, i64 32, i64 448, i32 0, metadata !837} ; [ DW_TAG_member ] [f_fsid] [line 41, size 64, align 32, offset 448] [from __fsid_t]
!837 = metadata !{i32 786454, metadata !467, null, metadata !"__fsid_t", i32 134, i64 0, i64 0, i64 0, i32 0, metadata !838} ; [ DW_TAG_typedef ] [__fsid_t] [line 134, size 0, align 0, offset 0] [from ]
!838 = metadata !{i32 786451, metadata !482, null, metadata !"", i32 134, i64 64, i64 32, i32 0, i32 0, null, metadata !839, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 134, size 64, align 32, offset 0] [def] [from ]
!839 = metadata !{metadata !840}
!840 = metadata !{i32 786445, metadata !482, metadata !838, metadata !"__val", i32 134, i64 64, i64 32, i64 0, i32 0, metadata !485} ; [ DW_TAG_member ] [__val] [line 134, size 64, align 32, offset 0] [from ]
!841 = metadata !{i32 786445, metadata !467, metadata !827, metadata !"f_namelen", i32 42, i64 64, i64 64, i64 512, i32 0, metadata !470} ; [ DW_TAG_member ] [f_namelen] [line 42, size 64, align 64, offset 512] [from __fsword_t]
!842 = metadata !{i32 786445, metadata !467, metadata !827, metadata !"f_frsize", i32 43, i64 64, i64 64, i64 576, i32 0, metadata !470} ; [ DW_TAG_member ] [f_frsize] [line 43, size 64, align 64, offset 576] [from __fsword_t]
!843 = metadata !{i32 786445, metadata !467, metadata !827, metadata !"f_flags", i32 44, i64 64, i64 64, i64 640, i32 0, metadata !470} ; [ DW_TAG_member ] [f_flags] [line 44, size 64, align 64, offset 640] [from __fsword_t]
!844 = metadata !{i32 786445, metadata !467, metadata !827, metadata !"f_spare", i32 45, i64 256, i64 64, i64 704, i32 0, metadata !492} ; [ DW_TAG_member ] [f_spare] [line 45, size 256, align 64, offset 704] [from ]
!845 = metadata !{metadata !846, metadata !847}
!846 = metadata !{i32 786689, metadata !823, metadata !"path", metadata !692, i32 16777359, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 143]
!847 = metadata !{i32 786689, metadata !823, metadata !"buf32", metadata !692, i32 33554575, metadata !826, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf32] [line 143]
!848 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"getdents", metadata !"getdents", metadata !"", i32 168, metadata !849, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, %struct.dirent*, i64)* @getdents, null, null,
!849 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !850, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!850 = metadata !{metadata !851, metadata !30, metadata !853, metadata !861}
!851 = metadata !{i32 786454, metadata !691, null, metadata !"ssize_t", i32 109, i64 0, i64 0, i64 0, i32 0, metadata !852} ; [ DW_TAG_typedef ] [ssize_t] [line 109, size 0, align 0, offset 0] [from __ssize_t]
!852 = metadata !{i32 786454, metadata !691, null, metadata !"__ssize_t", i32 172, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__ssize_t] [line 172, size 0, align 0, offset 0] [from long int]
!853 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !854} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dirent]
!854 = metadata !{i32 786451, metadata !349, null, metadata !"dirent", i32 22, i64 2240, i64 64, i32 0, i32 0, null, metadata !855, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [dirent] [line 22, size 2240, align 64, offset 0] [def] [from ]
!855 = metadata !{metadata !856, metadata !857, metadata !858, metadata !859, metadata !860}
!856 = metadata !{i32 786445, metadata !349, metadata !854, metadata !"d_ino", i32 25, i64 64, i64 64, i64 0, i32 0, metadata !224} ; [ DW_TAG_member ] [d_ino] [line 25, size 64, align 64, offset 0] [from __ino_t]
!857 = metadata !{i32 786445, metadata !349, metadata !854, metadata !"d_off", i32 26, i64 64, i64 64, i64 64, i32 0, metadata !725} ; [ DW_TAG_member ] [d_off] [line 26, size 64, align 64, offset 64] [from __off_t]
!858 = metadata !{i32 786445, metadata !349, metadata !854, metadata !"d_reclen", i32 31, i64 16, i64 16, i64 128, i32 0, metadata !354} ; [ DW_TAG_member ] [d_reclen] [line 31, size 16, align 16, offset 128] [from unsigned short]
!859 = metadata !{i32 786445, metadata !349, metadata !854, metadata !"d_type", i32 32, i64 8, i64 8, i64 144, i32 0, metadata !356} ; [ DW_TAG_member ] [d_type] [line 32, size 8, align 8, offset 144] [from unsigned char]
!860 = metadata !{i32 786445, metadata !349, metadata !854, metadata !"d_name", i32 33, i64 2048, i64 8, i64 152, i32 0, metadata !358} ; [ DW_TAG_member ] [d_name] [line 33, size 2048, align 8, offset 152] [from ]
!861 = metadata !{i32 786454, metadata !691, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!862 = metadata !{metadata !863, metadata !864, metadata !865, metadata !866, metadata !876, metadata !877, metadata !880, metadata !882}
!863 = metadata !{i32 786689, metadata !848, metadata !"fd", metadata !692, i32 16777384, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 168]
!864 = metadata !{i32 786689, metadata !848, metadata !"dirp", metadata !692, i32 33554600, metadata !853, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirp] [line 168]
!865 = metadata !{i32 786689, metadata !848, metadata !"nbytes", metadata !692, i32 50331816, metadata !861, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nbytes] [line 168]
!866 = metadata !{i32 786688, metadata !848, metadata !"dp64", metadata !692, i32 169, metadata !867, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dp64] [line 169]
!867 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !868} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dirent64]
!868 = metadata !{i32 786451, metadata !349, null, metadata !"dirent64", i32 37, i64 2240, i64 64, i32 0, i32 0, null, metadata !869, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [dirent64] [line 37, size 2240, align 64, offset 0] [def] [from ]
!869 = metadata !{metadata !870, metadata !871, metadata !873, metadata !874, metadata !875}
!870 = metadata !{i32 786445, metadata !349, metadata !868, metadata !"d_ino", i32 39, i64 64, i64 64, i64 0, i32 0, metadata !55} ; [ DW_TAG_member ] [d_ino] [line 39, size 64, align 64, offset 0] [from __ino64_t]
!871 = metadata !{i32 786445, metadata !349, metadata !868, metadata !"d_off", i32 40, i64 64, i64 64, i64 64, i32 0, metadata !872} ; [ DW_TAG_member ] [d_off] [line 40, size 64, align 64, offset 64] [from __off64_t]
!872 = metadata !{i32 786454, metadata !349, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!873 = metadata !{i32 786445, metadata !349, metadata !868, metadata !"d_reclen", i32 41, i64 16, i64 16, i64 128, i32 0, metadata !354} ; [ DW_TAG_member ] [d_reclen] [line 41, size 16, align 16, offset 128] [from unsigned short]
!874 = metadata !{i32 786445, metadata !349, metadata !868, metadata !"d_type", i32 42, i64 8, i64 8, i64 144, i32 0, metadata !356} ; [ DW_TAG_member ] [d_type] [line 42, size 8, align 8, offset 144] [from unsigned char]
!875 = metadata !{i32 786445, metadata !349, metadata !868, metadata !"d_name", i32 43, i64 2048, i64 8, i64 152, i32 0, metadata !358} ; [ DW_TAG_member ] [d_name] [line 43, size 2048, align 8, offset 152] [from ]
!876 = metadata !{i32 786688, metadata !848, metadata !"res", metadata !692, i32 170, metadata !851, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 170]
!877 = metadata !{i32 786688, metadata !878, metadata !"end", metadata !692, i32 173, metadata !867, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [end] [line 173]
!878 = metadata !{i32 786443, metadata !691, metadata !879, i32 172, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_32.c]
!879 = metadata !{i32 786443, metadata !691, metadata !848, i32 172, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_32.c]
!880 = metadata !{i32 786688, metadata !881, metadata !"dp", metadata !692, i32 175, metadata !853, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dp] [line 175]
!881 = metadata !{i32 786443, metadata !691, metadata !878, i32 174, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_32.c]
!882 = metadata !{i32 786688, metadata !881, metadata !"name_len", metadata !692, i32 176, metadata !861, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [name_len] [line 176]
!883 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"open64", metadata !"open64", metadata !"", i32 194, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, ...)* @open64, null, null, metadata !884, i32
!884 = metadata !{metadata !885, metadata !886, metadata !887, metadata !888}
!885 = metadata !{i32 786689, metadata !883, metadata !"pathname", metadata !692, i32 16777410, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 194]
!886 = metadata !{i32 786689, metadata !883, metadata !"flags", metadata !692, i32 33554626, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 194]
!887 = metadata !{i32 786688, metadata !883, metadata !"mode", metadata !692, i32 195, metadata !697, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 195]
!888 = metadata !{i32 786688, metadata !889, metadata !"ap", metadata !692, i32 199, metadata !702, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 199]
!889 = metadata !{i32 786443, metadata !691, metadata !890, i32 197, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_32.c]
!890 = metadata !{i32 786443, metadata !691, metadata !883, i32 197, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_32.c]
!891 = metadata !{i32 786478, metadata !691, metadata !692, metadata !"__stat64_to_stat", metadata !"__stat64_to_stat", metadata !"", i32 41, metadata !892, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !895, i32 41} 
!892 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !893, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!893 = metadata !{null, metadata !894, metadata !734}
!894 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !761} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat64]
!895 = metadata !{metadata !896, metadata !897}
!896 = metadata !{i32 786689, metadata !891, metadata !"a", metadata !692, i32 16777257, metadata !894, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 41]
!897 = metadata !{i32 786689, metadata !891, metadata !"b", metadata !692, i32 33554473, metadata !734, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 41]
!898 = metadata !{i32 786449, metadata !899, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !900, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_unit ]
!899 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!900 = metadata !{metadata !901, metadata !924, metadata !933, metadata !942, metadata !971, metadata !977, metadata !982, metadata !986, metadata !993, metadata !999, metadata !1005, metadata !1032}
!901 = metadata !{i32 786478, metadata !902, metadata !903, metadata !"open", metadata !"open", metadata !"open64", i32 45, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, ...)* @open64, null, null, metadata !904, i3
!902 = metadata !{metadata !"fd_64.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!903 = metadata !{i32 786473, metadata !902}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c]
!904 = metadata !{metadata !905, metadata !906, metadata !907, metadata !910}
!905 = metadata !{i32 786689, metadata !901, metadata !"pathname", metadata !903, i32 16777261, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 45]
!906 = metadata !{i32 786689, metadata !901, metadata !"flags", metadata !903, i32 33554477, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 45]
!907 = metadata !{i32 786688, metadata !901, metadata !"mode", metadata !903, i32 46, metadata !908, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 46]
!908 = metadata !{i32 786454, metadata !902, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !909} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!909 = metadata !{i32 786454, metadata !902, null, metadata !"__mode_t", i32 129, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [__mode_t] [line 129, size 0, align 0, offset 0] [from unsigned int]
!910 = metadata !{i32 786688, metadata !911, metadata !"ap", metadata !903, i32 50, metadata !913, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 50]
!911 = metadata !{i32 786443, metadata !902, metadata !912, i32 48, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c]
!912 = metadata !{i32 786443, metadata !902, metadata !901, i32 48, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c]
!913 = metadata !{i32 786454, metadata !902, null, metadata !"va_list", i32 79, i64 0, i64 0, i64 0, i32 0, metadata !914} ; [ DW_TAG_typedef ] [va_list] [line 79, size 0, align 0, offset 0] [from __gnuc_va_list]
!914 = metadata !{i32 786454, metadata !902, null, metadata !"__gnuc_va_list", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !915} ; [ DW_TAG_typedef ] [__gnuc_va_list] [line 48, size 0, align 0, offset 0] [from __builtin_va_list]
!915 = metadata !{i32 786454, metadata !902, null, metadata !"__builtin_va_list", i32 50, i64 0, i64 0, i64 0, i32 0, metadata !916} ; [ DW_TAG_typedef ] [__builtin_va_list] [line 50, size 0, align 0, offset 0] [from ]
!916 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !917, metadata !404, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __va_list_tag]
!917 = metadata !{i32 786454, metadata !902, null, metadata !"__va_list_tag", i32 50, i64 0, i64 0, i64 0, i32 0, metadata !918} ; [ DW_TAG_typedef ] [__va_list_tag] [line 50, size 0, align 0, offset 0] [from __va_list_tag]
!918 = metadata !{i32 786451, metadata !899, null, metadata !"__va_list_tag", i32 50, i64 192, i64 64, i32 0, i32 0, null, metadata !919, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 50, size 192, align 64, offset 0] [def] [
!919 = metadata !{metadata !920, metadata !921, metadata !922, metadata !923}
!920 = metadata !{i32 786445, metadata !899, metadata !918, metadata !"gp_offset", i32 50, i64 32, i64 32, i64 0, i32 0, metadata !43} ; [ DW_TAG_member ] [gp_offset] [line 50, size 32, align 32, offset 0] [from unsigned int]
!921 = metadata !{i32 786445, metadata !899, metadata !918, metadata !"fp_offset", i32 50, i64 32, i64 32, i64 32, i32 0, metadata !43} ; [ DW_TAG_member ] [fp_offset] [line 50, size 32, align 32, offset 32] [from unsigned int]
!922 = metadata !{i32 786445, metadata !899, metadata !918, metadata !"overflow_arg_area", i32 50, i64 64, i64 64, i64 64, i32 0, metadata !173} ; [ DW_TAG_member ] [overflow_arg_area] [line 50, size 64, align 64, offset 64] [from ]
!923 = metadata !{i32 786445, metadata !899, metadata !918, metadata !"reg_save_area", i32 50, i64 64, i64 64, i64 128, i32 0, metadata !173} ; [ DW_TAG_member ] [reg_save_area] [line 50, size 64, align 64, offset 128] [from ]
!924 = metadata !{i32 786478, metadata !902, metadata !903, metadata !"openat", metadata !"openat", metadata !"openat64", i32 59, metadata !543, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32, ...)* @openat64, null, null, met
!925 = metadata !{metadata !926, metadata !927, metadata !928, metadata !929, metadata !930}
!926 = metadata !{i32 786689, metadata !924, metadata !"fd", metadata !903, i32 16777275, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 59]
!927 = metadata !{i32 786689, metadata !924, metadata !"pathname", metadata !903, i32 33554491, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 59]
!928 = metadata !{i32 786689, metadata !924, metadata !"flags", metadata !903, i32 50331707, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 59]
!929 = metadata !{i32 786688, metadata !924, metadata !"mode", metadata !903, i32 60, metadata !908, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 60]
!930 = metadata !{i32 786688, metadata !931, metadata !"ap", metadata !903, i32 64, metadata !913, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 64]
!931 = metadata !{i32 786443, metadata !902, metadata !932, i32 62, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c]
!932 = metadata !{i32 786443, metadata !902, metadata !924, i32 62, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c]
!933 = metadata !{i32 786478, metadata !902, metadata !903, metadata !"lseek", metadata !"lseek", metadata !"lseek64", i32 73, metadata !934, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @lseek64, null, null, metadata !93
!934 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !935, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!935 = metadata !{metadata !936, metadata !30, metadata !937, metadata !30}
!936 = metadata !{i32 786454, metadata !902, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!937 = metadata !{i32 786454, metadata !902, null, metadata !"off64_t", i32 93, i64 0, i64 0, i64 0, i32 0, metadata !936} ; [ DW_TAG_typedef ] [off64_t] [line 93, size 0, align 0, offset 0] [from __off64_t]
!938 = metadata !{metadata !939, metadata !940, metadata !941}
!939 = metadata !{i32 786689, metadata !933, metadata !"fd", metadata !903, i32 16777289, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 73]
!940 = metadata !{i32 786689, metadata !933, metadata !"offset", metadata !903, i32 33554505, metadata !937, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 73]
!941 = metadata !{i32 786689, metadata !933, metadata !"whence", metadata !903, i32 50331721, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [whence] [line 73]
!942 = metadata !{i32 786478, metadata !902, metadata !903, metadata !"__xstat", metadata !"__xstat", metadata !"__xstat64", i32 77, metadata !943, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__xstat64, null, 
!943 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !944, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!944 = metadata !{metadata !30, metadata !30, metadata !31, metadata !945}
!945 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !946} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat]
!946 = metadata !{i32 786451, metadata !49, null, metadata !"stat", i32 46, i64 1152, i64 64, i32 0, i32 0, null, metadata !947, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat] [line 46, size 1152, align 64, offset 0] [def] [from ]
!947 = metadata !{metadata !948, metadata !949, metadata !950, metadata !951, metadata !952, metadata !953, metadata !954, metadata !955, metadata !956, metadata !957, metadata !958, metadata !959, metadata !964, metadata !965, metadata !966}
!948 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_dev", i32 48, i64 64, i64 64, i64 0, i32 0, metadata !52} ; [ DW_TAG_member ] [st_dev] [line 48, size 64, align 64, offset 0] [from __dev_t]
!949 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_ino", i32 53, i64 64, i64 64, i64 64, i32 0, metadata !224} ; [ DW_TAG_member ] [st_ino] [line 53, size 64, align 64, offset 64] [from __ino_t]
!950 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_nlink", i32 61, i64 64, i64 64, i64 128, i32 0, metadata !57} ; [ DW_TAG_member ] [st_nlink] [line 61, size 64, align 64, offset 128] [from __nlink_t]
!951 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_mode", i32 62, i64 32, i64 32, i64 192, i32 0, metadata !909} ; [ DW_TAG_member ] [st_mode] [line 62, size 32, align 32, offset 192] [from __mode_t]
!952 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_uid", i32 64, i64 32, i64 32, i64 224, i32 0, metadata !61} ; [ DW_TAG_member ] [st_uid] [line 64, size 32, align 32, offset 224] [from __uid_t]
!953 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_gid", i32 65, i64 32, i64 32, i64 256, i32 0, metadata !63} ; [ DW_TAG_member ] [st_gid] [line 65, size 32, align 32, offset 256] [from __gid_t]
!954 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"__pad0", i32 67, i64 32, i64 32, i64 288, i32 0, metadata !30} ; [ DW_TAG_member ] [__pad0] [line 67, size 32, align 32, offset 288] [from int]
!955 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_rdev", i32 69, i64 64, i64 64, i64 320, i32 0, metadata !52} ; [ DW_TAG_member ] [st_rdev] [line 69, size 64, align 64, offset 320] [from __dev_t]
!956 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_size", i32 74, i64 64, i64 64, i64 384, i32 0, metadata !67} ; [ DW_TAG_member ] [st_size] [line 74, size 64, align 64, offset 384] [from __off_t]
!957 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_blksize", i32 78, i64 64, i64 64, i64 448, i32 0, metadata !70} ; [ DW_TAG_member ] [st_blksize] [line 78, size 64, align 64, offset 448] [from __blksize_t]
!958 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_blocks", i32 80, i64 64, i64 64, i64 512, i32 0, metadata !234} ; [ DW_TAG_member ] [st_blocks] [line 80, size 64, align 64, offset 512] [from __blkcnt_t]
!959 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_atim", i32 91, i64 128, i64 64, i64 576, i32 0, metadata !960} ; [ DW_TAG_member ] [st_atim] [line 91, size 128, align 64, offset 576] [from timespec]
!960 = metadata !{i32 786451, metadata !75, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !961, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!961 = metadata !{metadata !962, metadata !963}
!962 = metadata !{i32 786445, metadata !75, metadata !960, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!963 = metadata !{i32 786445, metadata !75, metadata !960, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !80} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!964 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_mtim", i32 92, i64 128, i64 64, i64 704, i32 0, metadata !960} ; [ DW_TAG_member ] [st_mtim] [line 92, size 128, align 64, offset 704] [from timespec]
!965 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"st_ctim", i32 93, i64 128, i64 64, i64 832, i32 0, metadata !960} ; [ DW_TAG_member ] [st_ctim] [line 93, size 128, align 64, offset 832] [from timespec]
!966 = metadata !{i32 786445, metadata !49, metadata !946, metadata !"__glibc_reserved", i32 106, i64 192, i64 64, i64 960, i32 0, metadata !84} ; [ DW_TAG_member ] [__glibc_reserved] [line 106, size 192, align 64, offset 960] [from ]
!967 = metadata !{metadata !968, metadata !969, metadata !970}
!968 = metadata !{i32 786689, metadata !942, metadata !"vers", metadata !903, i32 16777293, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 77]
!969 = metadata !{i32 786689, metadata !942, metadata !"path", metadata !903, i32 33554509, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 77]
!970 = metadata !{i32 786689, metadata !942, metadata !"buf", metadata !903, i32 50331725, metadata !945, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 77]
!971 = metadata !{i32 786478, metadata !902, metadata !903, metadata !"stat", metadata !"stat", metadata !"stat64", i32 81, metadata !972, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @stat64, null, null, metadata !9
!972 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !973, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!973 = metadata !{metadata !30, metadata !31, metadata !945}
!974 = metadata !{metadata !975, metadata !976}
!975 = metadata !{i32 786689, metadata !971, metadata !"path", metadata !903, i32 16777297, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 81]
!976 = metadata !{i32 786689, metadata !971, metadata !"buf", metadata !903, i32 33554513, metadata !945, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 81]
!977 = metadata !{i32 786478, metadata !902, metadata !903, metadata !"__lxstat", metadata !"__lxstat", metadata !"__lxstat64", i32 85, metadata !943, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__lxstat64, nu
!978 = metadata !{metadata !979, metadata !980, metadata !981}
!979 = metadata !{i32 786689, metadata !977, metadata !"vers", metadata !903, i32 16777301, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 85]
!980 = metadata !{i32 786689, metadata !977, metadata !"path", metadata !903, i32 33554517, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 85]
!981 = metadata !{i32 786689, metadata !977, metadata !"buf", metadata !903, i32 50331733, metadata !945, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 85]
!982 = metadata !{i32 786478, metadata !902, metadata !903, metadata !"lstat", metadata !"lstat", metadata !"lstat64", i32 89, metadata !972, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @lstat64, null, null, metadat
!983 = metadata !{metadata !984, metadata !985}
!984 = metadata !{i32 786689, metadata !982, metadata !"path", metadata !903, i32 16777305, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 89]
!985 = metadata !{i32 786689, metadata !982, metadata !"buf", metadata !903, i32 33554521, metadata !945, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 89]
!986 = metadata !{i32 786478, metadata !902, metadata !903, metadata !"__fxstat", metadata !"__fxstat", metadata !"__fxstat64", i32 93, metadata !987, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, %struct.stat*)* @__fxstat64, nu
!987 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !988, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!988 = metadata !{metadata !30, metadata !30, metadata !30, metadata !945}
!989 = metadata !{metadata !990, metadata !991, metadata !992}
!990 = metadata !{i32 786689, metadata !986, metadata !"vers", metadata !903, i32 16777309, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 93]
!991 = metadata !{i32 786689, metadata !986, metadata !"fd", metadata !903, i32 33554525, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 93]
!992 = metadata !{i32 786689, metadata !986, metadata !"buf", metadata !903, i32 50331741, metadata !945, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 93]
!993 = metadata !{i32 786478, metadata !902, metadata !903, metadata !"fstat", metadata !"fstat", metadata !"fstat64", i32 97, metadata !994, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat*)* @fstat64, null, null, metadat
!994 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !995, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!995 = metadata !{metadata !30, metadata !30, metadata !945}
!996 = metadata !{metadata !997, metadata !998}
!997 = metadata !{i32 786689, metadata !993, metadata !"fd", metadata !903, i32 16777313, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 97]
!998 = metadata !{i32 786689, metadata !993, metadata !"buf", metadata !903, i32 33554529, metadata !945, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 97]
!999 = metadata !{i32 786478, metadata !902, metadata !903, metadata !"ftruncate64", metadata !"ftruncate64", metadata !"", i32 101, metadata !1000, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @ftruncate64, null, null, metada
!1000 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1001, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1001 = metadata !{metadata !30, metadata !30, metadata !937}
!1002 = metadata !{metadata !1003, metadata !1004}
!1003 = metadata !{i32 786689, metadata !999, metadata !"fd", metadata !903, i32 16777317, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 101]
!1004 = metadata !{i32 786689, metadata !999, metadata !"length", metadata !903, i32 33554533, metadata !937, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 101]
!1005 = metadata !{i32 786478, metadata !902, metadata !903, metadata !"statfs", metadata !"statfs", metadata !"statfs64", i32 106, metadata !1006, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @statfs64, null, null
!1006 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1007, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1007 = metadata !{metadata !30, metadata !31, metadata !1008}
!1008 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1009} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from statfs]
!1009 = metadata !{i32 786451, metadata !467, null, metadata !"statfs", i32 24, i64 960, i64 64, i32 0, i32 0, null, metadata !1010, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [statfs] [line 24, size 960, align 64, offset 0] [def] [from ]
!1010 = metadata !{metadata !1011, metadata !1012, metadata !1013, metadata !1015, metadata !1016, metadata !1017, metadata !1019, metadata !1020, metadata !1025, metadata !1026, metadata !1027, metadata !1028}
!1011 = metadata !{i32 786445, metadata !467, metadata !1009, metadata !"f_type", i32 26, i64 64, i64 64, i64 0, i32 0, metadata !470} ; [ DW_TAG_member ] [f_type] [line 26, size 64, align 64, offset 0] [from __fsword_t]
!1012 = metadata !{i32 786445, metadata !467, metadata !1009, metadata !"f_bsize", i32 27, i64 64, i64 64, i64 64, i32 0, metadata !470} ; [ DW_TAG_member ] [f_bsize] [line 27, size 64, align 64, offset 64] [from __fsword_t]
!1013 = metadata !{i32 786445, metadata !467, metadata !1009, metadata !"f_blocks", i32 35, i64 64, i64 64, i64 128, i32 0, metadata !1014} ; [ DW_TAG_member ] [f_blocks] [line 35, size 64, align 64, offset 128] [from __fsblkcnt64_t]
!1014 = metadata !{i32 786454, metadata !467, null, metadata !"__fsblkcnt64_t", i32 163, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [__fsblkcnt64_t] [line 163, size 0, align 0, offset 0] [from long unsigned int]
!1015 = metadata !{i32 786445, metadata !467, metadata !1009, metadata !"f_bfree", i32 36, i64 64, i64 64, i64 192, i32 0, metadata !1014} ; [ DW_TAG_member ] [f_bfree] [line 36, size 64, align 64, offset 192] [from __fsblkcnt64_t]
!1016 = metadata !{i32 786445, metadata !467, metadata !1009, metadata !"f_bavail", i32 37, i64 64, i64 64, i64 256, i32 0, metadata !1014} ; [ DW_TAG_member ] [f_bavail] [line 37, size 64, align 64, offset 256] [from __fsblkcnt64_t]
!1017 = metadata !{i32 786445, metadata !467, metadata !1009, metadata !"f_files", i32 38, i64 64, i64 64, i64 320, i32 0, metadata !1018} ; [ DW_TAG_member ] [f_files] [line 38, size 64, align 64, offset 320] [from __fsfilcnt64_t]
!1018 = metadata !{i32 786454, metadata !467, null, metadata !"__fsfilcnt64_t", i32 167, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [__fsfilcnt64_t] [line 167, size 0, align 0, offset 0] [from long unsigned int]
!1019 = metadata !{i32 786445, metadata !467, metadata !1009, metadata !"f_ffree", i32 39, i64 64, i64 64, i64 384, i32 0, metadata !1018} ; [ DW_TAG_member ] [f_ffree] [line 39, size 64, align 64, offset 384] [from __fsfilcnt64_t]
!1020 = metadata !{i32 786445, metadata !467, metadata !1009, metadata !"f_fsid", i32 41, i64 64, i64 32, i64 448, i32 0, metadata !1021} ; [ DW_TAG_member ] [f_fsid] [line 41, size 64, align 32, offset 448] [from __fsid_t]
!1021 = metadata !{i32 786454, metadata !467, null, metadata !"__fsid_t", i32 134, i64 0, i64 0, i64 0, i32 0, metadata !1022} ; [ DW_TAG_typedef ] [__fsid_t] [line 134, size 0, align 0, offset 0] [from ]
!1022 = metadata !{i32 786451, metadata !482, null, metadata !"", i32 134, i64 64, i64 32, i32 0, i32 0, null, metadata !1023, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 134, size 64, align 32, offset 0] [def] [from ]
!1023 = metadata !{metadata !1024}
!1024 = metadata !{i32 786445, metadata !482, metadata !1022, metadata !"__val", i32 134, i64 64, i64 32, i64 0, i32 0, metadata !485} ; [ DW_TAG_member ] [__val] [line 134, size 64, align 32, offset 0] [from ]
!1025 = metadata !{i32 786445, metadata !467, metadata !1009, metadata !"f_namelen", i32 42, i64 64, i64 64, i64 512, i32 0, metadata !470} ; [ DW_TAG_member ] [f_namelen] [line 42, size 64, align 64, offset 512] [from __fsword_t]
!1026 = metadata !{i32 786445, metadata !467, metadata !1009, metadata !"f_frsize", i32 43, i64 64, i64 64, i64 576, i32 0, metadata !470} ; [ DW_TAG_member ] [f_frsize] [line 43, size 64, align 64, offset 576] [from __fsword_t]
!1027 = metadata !{i32 786445, metadata !467, metadata !1009, metadata !"f_flags", i32 44, i64 64, i64 64, i64 640, i32 0, metadata !470} ; [ DW_TAG_member ] [f_flags] [line 44, size 64, align 64, offset 640] [from __fsword_t]
!1028 = metadata !{i32 786445, metadata !467, metadata !1009, metadata !"f_spare", i32 45, i64 256, i64 64, i64 704, i32 0, metadata !492} ; [ DW_TAG_member ] [f_spare] [line 45, size 256, align 64, offset 704] [from ]
!1029 = metadata !{metadata !1030, metadata !1031}
!1030 = metadata !{i32 786689, metadata !1005, metadata !"path", metadata !903, i32 16777322, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 106]
!1031 = metadata !{i32 786689, metadata !1005, metadata !"buf", metadata !903, i32 33554538, metadata !1008, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 106]
!1032 = metadata !{i32 786478, metadata !902, metadata !903, metadata !"getdents64", metadata !"getdents64", metadata !"", i32 110, metadata !1033, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.dirent*, i32)* @getdents64, nul
!1033 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1034, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1034 = metadata !{metadata !30, metadata !43, metadata !1035, metadata !43}
!1035 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1036} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dirent]
!1036 = metadata !{i32 786451, metadata !349, null, metadata !"dirent", i32 22, i64 2240, i64 64, i32 0, i32 0, null, metadata !1037, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [dirent] [line 22, size 2240, align 64, offset 0] [def] [from ]
!1037 = metadata !{metadata !1038, metadata !1040, metadata !1041, metadata !1042, metadata !1043}
!1038 = metadata !{i32 786445, metadata !349, metadata !1036, metadata !"d_ino", i32 28, i64 64, i64 64, i64 0, i32 0, metadata !1039} ; [ DW_TAG_member ] [d_ino] [line 28, size 64, align 64, offset 0] [from __ino64_t]
!1039 = metadata !{i32 786454, metadata !349, null, metadata !"__ino64_t", i32 128, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [__ino64_t] [line 128, size 0, align 0, offset 0] [from long unsigned int]
!1040 = metadata !{i32 786445, metadata !349, metadata !1036, metadata !"d_off", i32 29, i64 64, i64 64, i64 64, i32 0, metadata !936} ; [ DW_TAG_member ] [d_off] [line 29, size 64, align 64, offset 64] [from __off64_t]
!1041 = metadata !{i32 786445, metadata !349, metadata !1036, metadata !"d_reclen", i32 31, i64 16, i64 16, i64 128, i32 0, metadata !354} ; [ DW_TAG_member ] [d_reclen] [line 31, size 16, align 16, offset 128] [from unsigned short]
!1042 = metadata !{i32 786445, metadata !349, metadata !1036, metadata !"d_type", i32 32, i64 8, i64 8, i64 144, i32 0, metadata !356} ; [ DW_TAG_member ] [d_type] [line 32, size 8, align 8, offset 144] [from unsigned char]
!1043 = metadata !{i32 786445, metadata !349, metadata !1036, metadata !"d_name", i32 33, i64 2048, i64 8, i64 152, i32 0, metadata !358} ; [ DW_TAG_member ] [d_name] [line 33, size 2048, align 8, offset 152] [from ]
!1044 = metadata !{metadata !1045, metadata !1046, metadata !1047}
!1045 = metadata !{i32 786689, metadata !1032, metadata !"fd", metadata !903, i32 16777326, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 110]
!1046 = metadata !{i32 786689, metadata !1032, metadata !"dirp", metadata !903, i32 33554542, metadata !1035, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirp] [line 110]
!1047 = metadata !{i32 786689, metadata !1032, metadata !"count", metadata !903, i32 50331758, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 110]
!1048 = metadata !{i32 786449, metadata !1049, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !1050, metadata !1126, metadata !23, metadata !""} ; [ DW_TAG_compile_u
!1049 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1050 = metadata !{metadata !1051, metadata !1090, metadata !1096, metadata !1118}
!1051 = metadata !{i32 786478, metadata !1052, metadata !1053, metadata !"klee_init_fds", metadata !"klee_init_fds", metadata !"", i32 110, metadata !1054, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, i32, i32, i32, i32)* @kle
!1052 = metadata !{metadata !"fd_init.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1053 = metadata !{i32 786473, metadata !1052}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!1054 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1055, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1055 = metadata !{null, metadata !43, metadata !43, metadata !43, metadata !30, metadata !30, metadata !43}
!1056 = metadata !{metadata !1057, metadata !1058, metadata !1059, metadata !1060, metadata !1061, metadata !1062, metadata !1063, metadata !1064, metadata !1068}
!1057 = metadata !{i32 786689, metadata !1051, metadata !"n_files", metadata !1053, i32 16777326, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n_files] [line 110]
!1058 = metadata !{i32 786689, metadata !1051, metadata !"file_length", metadata !1053, i32 33554542, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [file_length] [line 110]
!1059 = metadata !{i32 786689, metadata !1051, metadata !"stdin_length", metadata !1053, i32 50331759, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stdin_length] [line 111]
!1060 = metadata !{i32 786689, metadata !1051, metadata !"sym_stdout_flag", metadata !1053, i32 67108975, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sym_stdout_flag] [line 111]
!1061 = metadata !{i32 786689, metadata !1051, metadata !"save_all_writes_flag", metadata !1053, i32 83886192, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [save_all_writes_flag] [line 112]
!1062 = metadata !{i32 786689, metadata !1051, metadata !"max_failures", metadata !1053, i32 100663408, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max_failures] [line 112]
!1063 = metadata !{i32 786688, metadata !1051, metadata !"k", metadata !1053, i32 113, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 113]
!1064 = metadata !{i32 786688, metadata !1051, metadata !"name", metadata !1053, i32 114, metadata !1065, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [name] [line 114]
!1065 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 56, i64 8, i32 0, i32 0, metadata !33, metadata !1066, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 56, align 8, offset 0] [from char]
!1066 = metadata !{metadata !1067}
!1067 = metadata !{i32 786465, i64 0, i64 7}      ; [ DW_TAG_subrange_type ] [0, 6]
!1068 = metadata !{i32 786688, metadata !1051, metadata !"s", metadata !1053, i32 115, metadata !1069, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 115]
!1069 = metadata !{i32 786451, metadata !49, null, metadata !"stat64", i32 119, i64 1152, i64 64, i32 0, i32 0, null, metadata !1070, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat64] [line 119, size 1152, align 64, offset 0] [def] [from ]
!1070 = metadata !{metadata !1071, metadata !1072, metadata !1073, metadata !1074, metadata !1075, metadata !1076, metadata !1077, metadata !1078, metadata !1079, metadata !1080, metadata !1081, metadata !1082, metadata !1087, metadata !1088, metadata !1
!1071 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_dev", i32 121, i64 64, i64 64, i64 0, i32 0, metadata !52} ; [ DW_TAG_member ] [st_dev] [line 121, size 64, align 64, offset 0] [from __dev_t]
!1072 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_ino", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !55} ; [ DW_TAG_member ] [st_ino] [line 123, size 64, align 64, offset 64] [from __ino64_t]
!1073 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_nlink", i32 124, i64 64, i64 64, i64 128, i32 0, metadata !57} ; [ DW_TAG_member ] [st_nlink] [line 124, size 64, align 64, offset 128] [from __nlink_t]
!1074 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_mode", i32 125, i64 32, i64 32, i64 192, i32 0, metadata !59} ; [ DW_TAG_member ] [st_mode] [line 125, size 32, align 32, offset 192] [from __mode_t]
!1075 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_uid", i32 132, i64 32, i64 32, i64 224, i32 0, metadata !61} ; [ DW_TAG_member ] [st_uid] [line 132, size 32, align 32, offset 224] [from __uid_t]
!1076 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_gid", i32 133, i64 32, i64 32, i64 256, i32 0, metadata !63} ; [ DW_TAG_member ] [st_gid] [line 133, size 32, align 32, offset 256] [from __gid_t]
!1077 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"__pad0", i32 135, i64 32, i64 32, i64 288, i32 0, metadata !30} ; [ DW_TAG_member ] [__pad0] [line 135, size 32, align 32, offset 288] [from int]
!1078 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_rdev", i32 136, i64 64, i64 64, i64 320, i32 0, metadata !52} ; [ DW_TAG_member ] [st_rdev] [line 136, size 64, align 64, offset 320] [from __dev_t]
!1079 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_size", i32 137, i64 64, i64 64, i64 384, i32 0, metadata !67} ; [ DW_TAG_member ] [st_size] [line 137, size 64, align 64, offset 384] [from __off_t]
!1080 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_blksize", i32 143, i64 64, i64 64, i64 448, i32 0, metadata !70} ; [ DW_TAG_member ] [st_blksize] [line 143, size 64, align 64, offset 448] [from __blksize_t]
!1081 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_blocks", i32 144, i64 64, i64 64, i64 512, i32 0, metadata !72} ; [ DW_TAG_member ] [st_blocks] [line 144, size 64, align 64, offset 512] [from __blkcnt64_t]
!1082 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_atim", i32 152, i64 128, i64 64, i64 576, i32 0, metadata !1083} ; [ DW_TAG_member ] [st_atim] [line 152, size 128, align 64, offset 576] [from timespec]
!1083 = metadata !{i32 786451, metadata !75, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !1084, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!1084 = metadata !{metadata !1085, metadata !1086}
!1085 = metadata !{i32 786445, metadata !75, metadata !1083, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!1086 = metadata !{i32 786445, metadata !75, metadata !1083, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !80} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!1087 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_mtim", i32 153, i64 128, i64 64, i64 704, i32 0, metadata !1083} ; [ DW_TAG_member ] [st_mtim] [line 153, size 128, align 64, offset 704] [from timespec]
!1088 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"st_ctim", i32 154, i64 128, i64 64, i64 832, i32 0, metadata !1083} ; [ DW_TAG_member ] [st_ctim] [line 154, size 128, align 64, offset 832] [from timespec]
!1089 = metadata !{i32 786445, metadata !49, metadata !1069, metadata !"__glibc_reserved", i32 164, i64 192, i64 64, i64 960, i32 0, metadata !84} ; [ DW_TAG_member ] [__glibc_reserved] [line 164, size 192, align 64, offset 960] [from ]
!1090 = metadata !{i32 786478, metadata !1052, metadata !1053, metadata !"__sym_uint32", metadata !"__sym_uint32", metadata !"", i32 97, metadata !1091, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1093, i32 97} ; [
!1091 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1092, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1092 = metadata !{metadata !43, metadata !31}
!1093 = metadata !{metadata !1094, metadata !1095}
!1094 = metadata !{i32 786689, metadata !1090, metadata !"name", metadata !1053, i32 16777313, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 97]
!1095 = metadata !{i32 786688, metadata !1090, metadata !"x", metadata !1053, i32 98, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 98]
!1096 = metadata !{i32 786478, metadata !1052, metadata !1053, metadata !"__create_new_dfile", metadata !"__create_new_dfile", metadata !"", i32 46, metadata !1097, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.exe_disk_file_t*, i
!1097 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1098, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1098 = metadata !{null, metadata !1099, metadata !43, metadata !31, metadata !1106}
!1099 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1100} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from exe_disk_file_t]
!1100 = metadata !{i32 786454, metadata !5, null, metadata !"exe_disk_file_t", i32 24, i64 0, i64 0, i64 0, i32 0, metadata !1101} ; [ DW_TAG_typedef ] [exe_disk_file_t] [line 24, size 0, align 0, offset 0] [from ]
!1101 = metadata !{i32 786451, metadata !5, null, metadata !"", i32 20, i64 192, i64 64, i32 0, i32 0, null, metadata !1102, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 20, size 192, align 64, offset 0] [def] [from ]
!1102 = metadata !{metadata !1103, metadata !1104, metadata !1105}
!1103 = metadata !{i32 786445, metadata !5, metadata !1101, metadata !"size", i32 21, i64 32, i64 32, i64 0, i32 0, metadata !43} ; [ DW_TAG_member ] [size] [line 21, size 32, align 32, offset 0] [from unsigned int]
!1104 = metadata !{i32 786445, metadata !5, metadata !1101, metadata !"contents", i32 22, i64 64, i64 64, i64 64, i32 0, metadata !45} ; [ DW_TAG_member ] [contents] [line 22, size 64, align 64, offset 64] [from ]
!1105 = metadata !{i32 786445, metadata !5, metadata !1101, metadata !"stat", i32 23, i64 64, i64 64, i64 128, i32 0, metadata !1106} ; [ DW_TAG_member ] [stat] [line 23, size 64, align 64, offset 128] [from ]
!1106 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1069} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat64]
!1107 = metadata !{metadata !1108, metadata !1109, metadata !1110, metadata !1111, metadata !1112, metadata !1113, metadata !1114}
!1108 = metadata !{i32 786689, metadata !1096, metadata !"dfile", metadata !1053, i32 16777262, metadata !1099, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dfile] [line 46]
!1109 = metadata !{i32 786689, metadata !1096, metadata !"size", metadata !1053, i32 33554478, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 46]
!1110 = metadata !{i32 786689, metadata !1096, metadata !"name", metadata !1053, i32 50331695, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 47]
!1111 = metadata !{i32 786689, metadata !1096, metadata !"defaults", metadata !1053, i32 67108911, metadata !1106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [defaults] [line 47]
!1112 = metadata !{i32 786688, metadata !1096, metadata !"s", metadata !1053, i32 48, metadata !1106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 48]
!1113 = metadata !{i32 786688, metadata !1096, metadata !"sp", metadata !1053, i32 49, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sp] [line 49]
!1114 = metadata !{i32 786688, metadata !1096, metadata !"sname", metadata !1053, i32 50, metadata !1115, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sname] [line 50]
!1115 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 8, i32 0, i32 0, metadata !33, metadata !1116, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!1116 = metadata !{metadata !1117}
!1117 = metadata !{i32 786465, i64 0, i64 64}     ; [ DW_TAG_subrange_type ] [0, 63]
!1118 = metadata !{i32 786478, metadata !1119, metadata !1120, metadata !"stat64", metadata !"stat64", metadata !"", i32 501, metadata !1121, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1123, i32 502} ; [ DW_TAG_s
!1119 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/sys/stat.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1120 = metadata !{i32 786473, metadata !1119}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX//usr/include/x86_64-linux-gnu/sys/stat.h]
!1121 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1122, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1122 = metadata !{metadata !30, metadata !31, metadata !1106}
!1123 = metadata !{metadata !1124, metadata !1125}
!1124 = metadata !{i32 786689, metadata !1118, metadata !"__path", metadata !1120, i32 16777717, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__path] [line 501]
!1125 = metadata !{i32 786689, metadata !1118, metadata !"__statbuf", metadata !1120, i32 33554933, metadata !1106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__statbuf] [line 501]
!1126 = metadata !{metadata !1127, metadata !1144}
!1127 = metadata !{i32 786484, i32 0, null, metadata !"__exe_env", metadata !"__exe_env", metadata !"", metadata !1053, i32 37, metadata !1128, i32 0, i32 1, { [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, null} ; [ DW_TAG_variable ] 
!1128 = metadata !{i32 786454, metadata !1052, null, metadata !"exe_sym_env_t", i32 69, i64 0, i64 0, i64 0, i32 0, metadata !1129} ; [ DW_TAG_typedef ] [exe_sym_env_t] [line 69, size 0, align 0, offset 0] [from ]
!1129 = metadata !{i32 786451, metadata !5, null, metadata !"", i32 61, i64 6272, i64 64, i32 0, i32 0, null, metadata !1130, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 61, size 6272, align 64, offset 0] [def] [from ]
!1130 = metadata !{metadata !1131, metadata !1140, metadata !1142, metadata !1143}
!1131 = metadata !{i32 786445, metadata !5, metadata !1129, metadata !"fds", i32 62, i64 6144, i64 64, i64 0, i32 0, metadata !1132} ; [ DW_TAG_member ] [fds] [line 62, size 6144, align 64, offset 0] [from ]
!1132 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 6144, i64 64, i32 0, i32 0, metadata !1133, metadata !426, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6144, align 64, offset 0] [from exe_file_t]
!1133 = metadata !{i32 786454, metadata !5, null, metadata !"exe_file_t", i32 40, i64 0, i64 0, i64 0, i32 0, metadata !1134} ; [ DW_TAG_typedef ] [exe_file_t] [line 40, size 0, align 0, offset 0] [from ]
!1134 = metadata !{i32 786451, metadata !5, null, metadata !"", i32 33, i64 192, i64 64, i32 0, i32 0, null, metadata !1135, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 33, size 192, align 64, offset 0] [def] [from ]
!1135 = metadata !{metadata !1136, metadata !1137, metadata !1138, metadata !1139}
!1136 = metadata !{i32 786445, metadata !5, metadata !1134, metadata !"fd", i32 34, i64 32, i64 32, i64 0, i32 0, metadata !30} ; [ DW_TAG_member ] [fd] [line 34, size 32, align 32, offset 0] [from int]
!1137 = metadata !{i32 786445, metadata !5, metadata !1134, metadata !"flags", i32 35, i64 32, i64 32, i64 32, i32 0, metadata !43} ; [ DW_TAG_member ] [flags] [line 35, size 32, align 32, offset 32] [from unsigned int]
!1138 = metadata !{i32 786445, metadata !5, metadata !1134, metadata !"off", i32 38, i64 64, i64 64, i64 64, i32 0, metadata !113} ; [ DW_TAG_member ] [off] [line 38, size 64, align 64, offset 64] [from off64_t]
!1139 = metadata !{i32 786445, metadata !5, metadata !1134, metadata !"dfile", i32 39, i64 64, i64 64, i64 128, i32 0, metadata !1099} ; [ DW_TAG_member ] [dfile] [line 39, size 64, align 64, offset 128] [from ]
!1140 = metadata !{i32 786445, metadata !5, metadata !1129, metadata !"umask", i32 63, i64 32, i64 32, i64 6144, i32 0, metadata !1141} ; [ DW_TAG_member ] [umask] [line 63, size 32, align 32, offset 6144] [from mode_t]
!1141 = metadata !{i32 786454, metadata !5, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !59} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!1142 = metadata !{i32 786445, metadata !5, metadata !1129, metadata !"version", i32 64, i64 32, i64 32, i64 6176, i32 0, metadata !43} ; [ DW_TAG_member ] [version] [line 64, size 32, align 32, offset 6176] [from unsigned int]
!1143 = metadata !{i32 786445, metadata !5, metadata !1129, metadata !"save_all_writes", i32 68, i64 32, i64 32, i64 6208, i32 0, metadata !30} ; [ DW_TAG_member ] [save_all_writes] [line 68, size 32, align 32, offset 6208] [from int]
!1144 = metadata !{i32 786484, i32 0, null, metadata !"__exe_fs", metadata !"__exe_fs", metadata !"", metadata !1053, i32 24, metadata !1145, i32 0, i32 1, %struct.exe_file_system_t* @__exe_fs, null} ; [ DW_TAG_variable ] [__exe_fs] [line 24] [def]
!1145 = metadata !{i32 786454, metadata !1052, null, metadata !"exe_file_system_t", i32 54, i64 0, i64 0, i64 0, i32 0, metadata !1146} ; [ DW_TAG_typedef ] [exe_file_system_t] [line 54, size 0, align 0, offset 0] [from ]
!1146 = metadata !{i32 786451, metadata !5, null, metadata !"", i32 42, i64 832, i64 64, i32 0, i32 0, null, metadata !1147, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 42, size 832, align 64, offset 0] [def] [from ]
!1147 = metadata !{metadata !1148, metadata !1149, metadata !1150, metadata !1151, metadata !1152, metadata !1153, metadata !1154, metadata !1155, metadata !1156, metadata !1157, metadata !1158, metadata !1159, metadata !1160}
!1148 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"n_sym_files", i32 43, i64 32, i64 32, i64 0, i32 0, metadata !43} ; [ DW_TAG_member ] [n_sym_files] [line 43, size 32, align 32, offset 0] [from unsigned int]
!1149 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"sym_stdin", i32 44, i64 64, i64 64, i64 64, i32 0, metadata !1099} ; [ DW_TAG_member ] [sym_stdin] [line 44, size 64, align 64, offset 64] [from ]
!1150 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"sym_stdout", i32 44, i64 64, i64 64, i64 128, i32 0, metadata !1099} ; [ DW_TAG_member ] [sym_stdout] [line 44, size 64, align 64, offset 128] [from ]
!1151 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"stdout_writes", i32 45, i64 32, i64 32, i64 192, i32 0, metadata !43} ; [ DW_TAG_member ] [stdout_writes] [line 45, size 32, align 32, offset 192] [from unsigned int]
!1152 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"sym_files", i32 46, i64 64, i64 64, i64 256, i32 0, metadata !1099} ; [ DW_TAG_member ] [sym_files] [line 46, size 64, align 64, offset 256] [from ]
!1153 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"max_failures", i32 49, i64 32, i64 32, i64 320, i32 0, metadata !43} ; [ DW_TAG_member ] [max_failures] [line 49, size 32, align 32, offset 320] [from unsigned int]
!1154 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"read_fail", i32 52, i64 64, i64 64, i64 384, i32 0, metadata !443} ; [ DW_TAG_member ] [read_fail] [line 52, size 64, align 64, offset 384] [from ]
!1155 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"write_fail", i32 52, i64 64, i64 64, i64 448, i32 0, metadata !443} ; [ DW_TAG_member ] [write_fail] [line 52, size 64, align 64, offset 448] [from ]
!1156 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"close_fail", i32 52, i64 64, i64 64, i64 512, i32 0, metadata !443} ; [ DW_TAG_member ] [close_fail] [line 52, size 64, align 64, offset 512] [from ]
!1157 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"ftruncate_fail", i32 52, i64 64, i64 64, i64 576, i32 0, metadata !443} ; [ DW_TAG_member ] [ftruncate_fail] [line 52, size 64, align 64, offset 576] [from ]
!1158 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"getcwd_fail", i32 52, i64 64, i64 64, i64 640, i32 0, metadata !443} ; [ DW_TAG_member ] [getcwd_fail] [line 52, size 64, align 64, offset 640] [from ]
!1159 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"chmod_fail", i32 53, i64 64, i64 64, i64 704, i32 0, metadata !443} ; [ DW_TAG_member ] [chmod_fail] [line 53, size 64, align 64, offset 704] [from ]
!1160 = metadata !{i32 786445, metadata !5, metadata !1146, metadata !"fchmod_fail", i32 53, i64 64, i64 64, i64 768, i32 0, metadata !443} ; [ DW_TAG_member ] [fchmod_fail] [line 53, size 64, align 64, offset 768] [from ]
!1161 = metadata !{i32 786449, metadata !1162, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !1163, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_uni
!1162 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/illegal.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1163 = metadata !{metadata !1164, metadata !1174, metadata !1196, metadata !1202, metadata !1208, metadata !1212, metadata !1216, metadata !1224, metadata !1228, metadata !1235, metadata !1238}
!1164 = metadata !{i32 786478, metadata !1165, metadata !1166, metadata !"kill", metadata !"kill", metadata !"", i32 22, metadata !1167, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @kill, null, null, metadata !1171, i32 22} ;
!1165 = metadata !{metadata !"illegal.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1166 = metadata !{i32 786473, metadata !1165}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/illegal.c]
!1167 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1168, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1168 = metadata !{metadata !30, metadata !1169, metadata !30}
!1169 = metadata !{i32 786454, metadata !1165, null, metadata !"pid_t", i32 263, i64 0, i64 0, i64 0, i32 0, metadata !1170} ; [ DW_TAG_typedef ] [pid_t] [line 263, size 0, align 0, offset 0] [from __pid_t]
!1170 = metadata !{i32 786454, metadata !1165, null, metadata !"__pid_t", i32 133, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ] [__pid_t] [line 133, size 0, align 0, offset 0] [from int]
!1171 = metadata !{metadata !1172, metadata !1173}
!1172 = metadata !{i32 786689, metadata !1164, metadata !"pid", metadata !1166, i32 16777238, metadata !1169, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pid] [line 22]
!1173 = metadata !{i32 786689, metadata !1164, metadata !"sig", metadata !1166, i32 33554454, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sig] [line 22]
!1174 = metadata !{i32 786478, metadata !1165, metadata !1166, metadata !"_setjmp", metadata !"_setjmp", metadata !"", i32 29, metadata !1175, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.__jmp_buf_tag*)* @_setjmp, null, null, me
!1175 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1176, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1176 = metadata !{metadata !30, metadata !1177}
!1177 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1178} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __jmp_buf_tag]
!1178 = metadata !{i32 786451, metadata !1179, null, metadata !"__jmp_buf_tag", i32 34, i64 1600, i64 64, i32 0, i32 0, null, metadata !1180, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__jmp_buf_tag] [line 34, size 1600, align 64, offset 0] [d
!1179 = metadata !{metadata !"/usr/include/setjmp.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1180 = metadata !{metadata !1181, metadata !1186, metadata !1187}
!1181 = metadata !{i32 786445, metadata !1179, metadata !1178, metadata !"__jmpbuf", i32 40, i64 512, i64 64, i64 0, i32 0, metadata !1182} ; [ DW_TAG_member ] [__jmpbuf] [line 40, size 512, align 64, offset 0] [from __jmp_buf]
!1182 = metadata !{i32 786454, metadata !1179, null, metadata !"__jmp_buf", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !1183} ; [ DW_TAG_typedef ] [__jmp_buf] [line 31, size 0, align 0, offset 0] [from ]
!1183 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 64, i32 0, i32 0, metadata !68, metadata !1184, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 64, offset 0] [from long int]
!1184 = metadata !{metadata !1185}
!1185 = metadata !{i32 786465, i64 0, i64 8}      ; [ DW_TAG_subrange_type ] [0, 7]
!1186 = metadata !{i32 786445, metadata !1179, metadata !1178, metadata !"__mask_was_saved", i32 41, i64 32, i64 32, i64 512, i32 0, metadata !30} ; [ DW_TAG_member ] [__mask_was_saved] [line 41, size 32, align 32, offset 512] [from int]
!1187 = metadata !{i32 786445, metadata !1179, metadata !1178, metadata !"__saved_mask", i32 42, i64 1024, i64 64, i64 576, i32 0, metadata !1188} ; [ DW_TAG_member ] [__saved_mask] [line 42, size 1024, align 64, offset 576] [from __sigset_t]
!1188 = metadata !{i32 786454, metadata !1179, null, metadata !"__sigset_t", i32 30, i64 0, i64 0, i64 0, i32 0, metadata !1189} ; [ DW_TAG_typedef ] [__sigset_t] [line 30, size 0, align 0, offset 0] [from ]
!1189 = metadata !{i32 786451, metadata !1190, null, metadata !"", i32 27, i64 1024, i64 64, i32 0, i32 0, null, metadata !1191, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 27, size 1024, align 64, offset 0] [def] [from ]
!1190 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/sigset.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1191 = metadata !{metadata !1192}
!1192 = metadata !{i32 786445, metadata !1190, metadata !1189, metadata !"__val", i32 29, i64 1024, i64 64, i64 0, i32 0, metadata !1193} ; [ DW_TAG_member ] [__val] [line 29, size 1024, align 64, offset 0] [from ]
!1193 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1024, i64 64, i32 0, i32 0, metadata !53, metadata !572, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 64, offset 0] [from long unsigned int]
!1194 = metadata !{metadata !1195}
!1195 = metadata !{i32 786689, metadata !1174, metadata !"__env", metadata !1166, i32 16777245, metadata !1177, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__env] [line 29]
!1196 = metadata !{i32 786478, metadata !1165, metadata !1166, metadata !"longjmp", metadata !"longjmp", metadata !"", i32 34, metadata !1197, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.__jmp_buf_tag*, i32)* @longjmp, null, nu
!1197 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1198, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1198 = metadata !{null, metadata !1177, metadata !30}
!1199 = metadata !{metadata !1200, metadata !1201}
!1200 = metadata !{i32 786689, metadata !1196, metadata !"env", metadata !1166, i32 16777250, metadata !1177, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [env] [line 34]
!1201 = metadata !{i32 786689, metadata !1196, metadata !"val", metadata !1166, i32 33554466, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 34]
!1202 = metadata !{i32 786478, metadata !1165, metadata !1166, metadata !"execl", metadata !"execl", metadata !"", i32 55, metadata !1203, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, ...)* @execl, null, null, metadata !1205, i
!1203 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1204, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1204 = metadata !{metadata !30, metadata !31, metadata !31}
!1205 = metadata !{metadata !1206, metadata !1207}
!1206 = metadata !{i32 786689, metadata !1202, metadata !"path", metadata !1166, i32 16777271, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 55]
!1207 = metadata !{i32 786689, metadata !1202, metadata !"arg", metadata !1166, i32 33554487, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg] [line 55]
!1208 = metadata !{i32 786478, metadata !1165, metadata !1166, metadata !"execlp", metadata !"execlp", metadata !"", i32 56, metadata !1203, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, ...)* @execlp, null, null, metadata !1209
!1209 = metadata !{metadata !1210, metadata !1211}
!1210 = metadata !{i32 786689, metadata !1208, metadata !"file", metadata !1166, i32 16777272, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [file] [line 56]
!1211 = metadata !{i32 786689, metadata !1208, metadata !"arg", metadata !1166, i32 33554488, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg] [line 56]
!1212 = metadata !{i32 786478, metadata !1165, metadata !1166, metadata !"execle", metadata !"execle", metadata !"", i32 57, metadata !1203, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, ...)* @execle, null, null, metadata !1213
!1213 = metadata !{metadata !1214, metadata !1215}
!1214 = metadata !{i32 786689, metadata !1212, metadata !"path", metadata !1166, i32 16777273, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 57]
!1215 = metadata !{i32 786689, metadata !1212, metadata !"arg", metadata !1166, i32 33554489, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg] [line 57]
!1216 = metadata !{i32 786478, metadata !1165, metadata !1166, metadata !"execv", metadata !"execv", metadata !"", i32 58, metadata !1217, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8**)* @execv, null, null, metadata !1221, i32 5
!1217 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1218, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1218 = metadata !{metadata !30, metadata !31, metadata !1219}
!1219 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1220} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1220 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!1221 = metadata !{metadata !1222, metadata !1223}
!1222 = metadata !{i32 786689, metadata !1216, metadata !"path", metadata !1166, i32 16777274, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 58]
!1223 = metadata !{i32 786689, metadata !1216, metadata !"argv", metadata !1166, i32 33554490, metadata !1219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 58]
!1224 = metadata !{i32 786478, metadata !1165, metadata !1166, metadata !"execvp", metadata !"execvp", metadata !"", i32 59, metadata !1217, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8**)* @execvp, null, null, metadata !1225, i3
!1225 = metadata !{metadata !1226, metadata !1227}
!1226 = metadata !{i32 786689, metadata !1224, metadata !"file", metadata !1166, i32 16777275, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [file] [line 59]
!1227 = metadata !{i32 786689, metadata !1224, metadata !"argv", metadata !1166, i32 33554491, metadata !1219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 59]
!1228 = metadata !{i32 786478, metadata !1165, metadata !1166, metadata !"execve", metadata !"execve", metadata !"", i32 60, metadata !1229, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8**, i8**)* @execve, null, null, metadata !12
!1229 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1230, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1230 = metadata !{metadata !30, metadata !31, metadata !1219, metadata !1219}
!1231 = metadata !{metadata !1232, metadata !1233, metadata !1234}
!1232 = metadata !{i32 786689, metadata !1228, metadata !"file", metadata !1166, i32 16777276, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [file] [line 60]
!1233 = metadata !{i32 786689, metadata !1228, metadata !"argv", metadata !1166, i32 33554492, metadata !1219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 60]
!1234 = metadata !{i32 786689, metadata !1228, metadata !"envp", metadata !1166, i32 50331708, metadata !1219, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [envp] [line 60]
!1235 = metadata !{i32 786478, metadata !1165, metadata !1166, metadata !"fork", metadata !"fork", metadata !"", i32 62, metadata !1236, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @fork, null, null, metadata !23, i32 62} ; [ DW_TAG_
!1236 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1237, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1237 = metadata !{metadata !1170}
!1238 = metadata !{i32 786478, metadata !1165, metadata !1166, metadata !"vfork", metadata !"vfork", metadata !"", i32 68, metadata !1239, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @vfork, null, null, metadata !23, i32 68} ; [ DW_T
!1239 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1240, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1240 = metadata !{metadata !30}
!1241 = metadata !{i32 786449, metadata !1242, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !1243, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_uni
!1242 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1243 = metadata !{metadata !1244, metadata !1298, metadata !1306, metadata !1311, metadata !1319, metadata !1327, metadata !1332}
!1244 = metadata !{i32 786478, metadata !1245, metadata !1246, metadata !"klee_init_env", metadata !"klee_init_env", metadata !"", i32 85, metadata !1247, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i8***)* @klee_init_env, null, 
!1245 = metadata !{metadata !"klee_init_env.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1246 = metadata !{i32 786473, metadata !1245}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1247 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1248, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1248 = metadata !{null, metadata !443, metadata !1249}
!1249 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1250} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1250 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1251 = metadata !{metadata !1252, metadata !1253, metadata !1254, metadata !1255, metadata !1256, metadata !1257, metadata !1258, metadata !1262, metadata !1263, metadata !1264, metadata !1265, metadata !1266, metadata !1267, metadata !1268, metadata !1
!1252 = metadata !{i32 786689, metadata !1244, metadata !"argcPtr", metadata !1246, i32 16777301, metadata !443, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argcPtr] [line 85]
!1253 = metadata !{i32 786689, metadata !1244, metadata !"argvPtr", metadata !1246, i32 33554517, metadata !1249, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argvPtr] [line 85]
!1254 = metadata !{i32 786688, metadata !1244, metadata !"argc", metadata !1246, i32 86, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [argc] [line 86]
!1255 = metadata !{i32 786688, metadata !1244, metadata !"argv", metadata !1246, i32 87, metadata !1250, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [argv] [line 87]
!1256 = metadata !{i32 786688, metadata !1244, metadata !"new_argc", metadata !1246, i32 89, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_argc] [line 89]
!1257 = metadata !{i32 786688, metadata !1244, metadata !"n_args", metadata !1246, i32 89, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n_args] [line 89]
!1258 = metadata !{i32 786688, metadata !1244, metadata !"new_argv", metadata !1246, i32 90, metadata !1259, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_argv] [line 90]
!1259 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 65536, i64 64, i32 0, i32 0, metadata !45, metadata !1260, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from ]
!1260 = metadata !{metadata !1261}
!1261 = metadata !{i32 786465, i64 0, i64 1024}   ; [ DW_TAG_subrange_type ] [0, 1023]
!1262 = metadata !{i32 786688, metadata !1244, metadata !"max_len", metadata !1246, i32 91, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_len] [line 91]
!1263 = metadata !{i32 786688, metadata !1244, metadata !"min_argvs", metadata !1246, i32 91, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [min_argvs] [line 91]
!1264 = metadata !{i32 786688, metadata !1244, metadata !"max_argvs", metadata !1246, i32 91, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_argvs] [line 91]
!1265 = metadata !{i32 786688, metadata !1244, metadata !"sym_files", metadata !1246, i32 92, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_files] [line 92]
!1266 = metadata !{i32 786688, metadata !1244, metadata !"sym_file_len", metadata !1246, i32 92, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_file_len] [line 92]
!1267 = metadata !{i32 786688, metadata !1244, metadata !"sym_stdin_len", metadata !1246, i32 93, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_stdin_len] [line 93]
!1268 = metadata !{i32 786688, metadata !1244, metadata !"sym_stdout_flag", metadata !1246, i32 94, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_stdout_flag] [line 94]
!1269 = metadata !{i32 786688, metadata !1244, metadata !"save_all_writes_flag", metadata !1246, i32 95, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [save_all_writes_flag] [line 95]
!1270 = metadata !{i32 786688, metadata !1244, metadata !"fd_fail", metadata !1246, i32 96, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd_fail] [line 96]
!1271 = metadata !{i32 786688, metadata !1244, metadata !"final_argv", metadata !1246, i32 97, metadata !1250, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [final_argv] [line 97]
!1272 = metadata !{i32 786688, metadata !1244, metadata !"sym_arg_name", metadata !1246, i32 98, metadata !1273, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_arg_name] [line 98]
!1273 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 40, i64 8, i32 0, i32 0, metadata !33, metadata !1274, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 40, align 8, offset 0] [from char]
!1274 = metadata !{metadata !1275}
!1275 = metadata !{i32 786465, i64 0, i64 5}      ; [ DW_TAG_subrange_type ] [0, 4]
!1276 = metadata !{i32 786688, metadata !1244, metadata !"sym_arg_num", metadata !1246, i32 99, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_arg_num] [line 99]
!1277 = metadata !{i32 786688, metadata !1244, metadata !"k", metadata !1246, i32 100, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 100]
!1278 = metadata !{i32 786688, metadata !1244, metadata !"i", metadata !1246, i32 100, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 100]
!1279 = metadata !{i32 786688, metadata !1280, metadata !"msg", metadata !1246, i32 125, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 125]
!1280 = metadata !{i32 786443, metadata !1245, metadata !1281, i32 124, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1281 = metadata !{i32 786443, metadata !1245, metadata !1282, i32 124, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1282 = metadata !{i32 786443, metadata !1245, metadata !1244, i32 123, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1283 = metadata !{i32 786688, metadata !1284, metadata !"msg", metadata !1246, i32 136, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 136]
!1284 = metadata !{i32 786443, metadata !1245, metadata !1285, i32 135, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1285 = metadata !{i32 786443, metadata !1245, metadata !1281, i32 135, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1286 = metadata !{i32 786688, metadata !1287, metadata !"msg", metadata !1246, i32 156, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 156]
!1287 = metadata !{i32 786443, metadata !1245, metadata !1288, i32 155, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1288 = metadata !{i32 786443, metadata !1245, metadata !1285, i32 155, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1289 = metadata !{i32 786688, metadata !1290, metadata !"msg", metadata !1246, i32 167, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 167]
!1290 = metadata !{i32 786443, metadata !1245, metadata !1291, i32 166, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1291 = metadata !{i32 786443, metadata !1245, metadata !1288, i32 165, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1292 = metadata !{i32 786688, metadata !1293, metadata !"msg", metadata !1246, i32 188, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 188]
!1293 = metadata !{i32 786443, metadata !1245, metadata !1294, i32 187, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1294 = metadata !{i32 786443, metadata !1245, metadata !1295, i32 187, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1295 = metadata !{i32 786443, metadata !1245, metadata !1296, i32 183, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1296 = metadata !{i32 786443, metadata !1245, metadata !1297, i32 179, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1297 = metadata !{i32 786443, metadata !1245, metadata !1291, i32 174, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!1298 = metadata !{i32 786478, metadata !1245, metadata !1246, metadata !"__get_sym_str", metadata !"__get_sym_str", metadata !"", i32 63, metadata !1299, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i32, i8*)* @__get_sym_str, null, null,
!1299 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1300, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1300 = metadata !{metadata !45, metadata !30, metadata !45}
!1301 = metadata !{metadata !1302, metadata !1303, metadata !1304, metadata !1305}
!1302 = metadata !{i32 786689, metadata !1298, metadata !"numChars", metadata !1246, i32 16777279, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [numChars] [line 63]
!1303 = metadata !{i32 786689, metadata !1298, metadata !"name", metadata !1246, i32 33554495, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 63]
!1304 = metadata !{i32 786688, metadata !1298, metadata !"i", metadata !1246, i32 64, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 64]
!1305 = metadata !{i32 786688, metadata !1298, metadata !"s", metadata !1246, i32 65, metadata !45, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 65]
!1306 = metadata !{i32 786478, metadata !1245, metadata !1246, metadata !"__isprint", metadata !"__isprint", metadata !"", i32 48, metadata !1307, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1309, i32 48} ; [ DW_TA
!1307 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1308, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1308 = metadata !{metadata !30, metadata !32}
!1309 = metadata !{metadata !1310}
!1310 = metadata !{i32 786689, metadata !1306, metadata !"c", metadata !1246, i32 16777264, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 48]
!1311 = metadata !{i32 786478, metadata !1245, metadata !1246, metadata !"__add_arg", metadata !"__add_arg", metadata !"", i32 76, metadata !1312, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1314, i32 76} ; [ DW_TA
!1312 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1313, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1313 = metadata !{null, metadata !443, metadata !1250, metadata !45, metadata !30}
!1314 = metadata !{metadata !1315, metadata !1316, metadata !1317, metadata !1318}
!1315 = metadata !{i32 786689, metadata !1311, metadata !"argc", metadata !1246, i32 16777292, metadata !443, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 76]
!1316 = metadata !{i32 786689, metadata !1311, metadata !"argv", metadata !1246, i32 33554508, metadata !1250, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 76]
!1317 = metadata !{i32 786689, metadata !1311, metadata !"arg", metadata !1246, i32 50331724, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg] [line 76]
!1318 = metadata !{i32 786689, metadata !1311, metadata !"argcMax", metadata !1246, i32 67108940, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!1319 = metadata !{i32 786478, metadata !1245, metadata !1246, metadata !"__str_to_int", metadata !"__str_to_int", metadata !"", i32 30, metadata !1320, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1322, i32 30} ; [
!1320 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1321, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1321 = metadata !{metadata !68, metadata !45, metadata !31}
!1322 = metadata !{metadata !1323, metadata !1324, metadata !1325, metadata !1326}
!1323 = metadata !{i32 786689, metadata !1319, metadata !"s", metadata !1246, i32 16777246, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 30]
!1324 = metadata !{i32 786689, metadata !1319, metadata !"error_msg", metadata !1246, i32 33554462, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!1325 = metadata !{i32 786688, metadata !1319, metadata !"res", metadata !1246, i32 31, metadata !68, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 31]
!1326 = metadata !{i32 786688, metadata !1319, metadata !"c", metadata !1246, i32 32, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 32]
!1327 = metadata !{i32 786478, metadata !1245, metadata !1246, metadata !"__emit_error", metadata !"__emit_error", metadata !"", i32 23, metadata !1328, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*)* @__emit_error, null, null, metada
!1328 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1329, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1329 = metadata !{null, metadata !31}
!1330 = metadata !{metadata !1331}
!1331 = metadata !{i32 786689, metadata !1327, metadata !"msg", metadata !1246, i32 16777239, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [msg] [line 23]
!1332 = metadata !{i32 786478, metadata !1245, metadata !1246, metadata !"__streq", metadata !"__streq", metadata !"", i32 53, metadata !1203, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1333, i32 53} ; [ DW_TAG_su
!1333 = metadata !{metadata !1334, metadata !1335}
!1334 = metadata !{i32 786689, metadata !1332, metadata !"a", metadata !1246, i32 16777269, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 53]
!1335 = metadata !{i32 786689, metadata !1332, metadata !"b", metadata !1246, i32 33554485, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 53]
!1336 = metadata !{i32 786449, metadata !1337, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !23, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_unit 
!1337 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/misc.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1338 = metadata !{i32 786449, metadata !1339, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !23, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_unit 
!1339 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/selinux.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1340 = metadata !{i32 786449, metadata !1341, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !1342, metadata !23, metadata !1376, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_u
!1341 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/stubs.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1342 = metadata !{metadata !1343, metadata !1349, metadata !1355}
!1343 = metadata !{i32 786436, metadata !1344, null, metadata !"", i32 50, i64 32, i64 32, i32 0, i32 0, null, metadata !1345, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 50, size 32, align 32, offset 0] [def] [from ]
!1344 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/waitflags.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1345 = metadata !{metadata !1346, metadata !1347, metadata !1348}
!1346 = metadata !{i32 786472, metadata !"P_ALL", i64 0} ; [ DW_TAG_enumerator ] [P_ALL :: 0]
!1347 = metadata !{i32 786472, metadata !"P_PID", i64 1} ; [ DW_TAG_enumerator ] [P_PID :: 1]
!1348 = metadata !{i32 786472, metadata !"P_PGID", i64 2} ; [ DW_TAG_enumerator ] [P_PGID :: 2]
!1349 = metadata !{i32 786436, metadata !1350, null, metadata !"__priority_which", i32 292, i64 32, i64 32, i32 0, i32 0, null, metadata !1351, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [__priority_which] [line 292, size 32, align 32, offset
!1350 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/resource.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1351 = metadata !{metadata !1352, metadata !1353, metadata !1354}
!1352 = metadata !{i32 786472, metadata !"PRIO_PROCESS", i64 0} ; [ DW_TAG_enumerator ] [PRIO_PROCESS :: 0]
!1353 = metadata !{i32 786472, metadata !"PRIO_PGRP", i64 1} ; [ DW_TAG_enumerator ] [PRIO_PGRP :: 1]
!1354 = metadata !{i32 786472, metadata !"PRIO_USER", i64 2} ; [ DW_TAG_enumerator ] [PRIO_USER :: 2]
!1355 = metadata !{i32 786436, metadata !1350, null, metadata !"__rlimit_resource", i32 31, i64 32, i64 32, i32 0, i32 0, null, metadata !1356, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [__rlimit_resource] [line 31, size 32, align 32, offset
!1356 = metadata !{metadata !1357, metadata !1358, metadata !1359, metadata !1360, metadata !1361, metadata !1362, metadata !1363, metadata !1364, metadata !1365, metadata !1366, metadata !1367, metadata !1368, metadata !1369, metadata !1370, metadata !1
!1357 = metadata !{i32 786472, metadata !"RLIMIT_CPU", i64 0} ; [ DW_TAG_enumerator ] [RLIMIT_CPU :: 0]
!1358 = metadata !{i32 786472, metadata !"RLIMIT_FSIZE", i64 1} ; [ DW_TAG_enumerator ] [RLIMIT_FSIZE :: 1]
!1359 = metadata !{i32 786472, metadata !"RLIMIT_DATA", i64 2} ; [ DW_TAG_enumerator ] [RLIMIT_DATA :: 2]
!1360 = metadata !{i32 786472, metadata !"RLIMIT_STACK", i64 3} ; [ DW_TAG_enumerator ] [RLIMIT_STACK :: 3]
!1361 = metadata !{i32 786472, metadata !"RLIMIT_CORE", i64 4} ; [ DW_TAG_enumerator ] [RLIMIT_CORE :: 4]
!1362 = metadata !{i32 786472, metadata !"__RLIMIT_RSS", i64 5} ; [ DW_TAG_enumerator ] [__RLIMIT_RSS :: 5]
!1363 = metadata !{i32 786472, metadata !"RLIMIT_NOFILE", i64 7} ; [ DW_TAG_enumerator ] [RLIMIT_NOFILE :: 7]
!1364 = metadata !{i32 786472, metadata !"__RLIMIT_OFILE", i64 7} ; [ DW_TAG_enumerator ] [__RLIMIT_OFILE :: 7]
!1365 = metadata !{i32 786472, metadata !"RLIMIT_AS", i64 9} ; [ DW_TAG_enumerator ] [RLIMIT_AS :: 9]
!1366 = metadata !{i32 786472, metadata !"__RLIMIT_NPROC", i64 6} ; [ DW_TAG_enumerator ] [__RLIMIT_NPROC :: 6]
!1367 = metadata !{i32 786472, metadata !"__RLIMIT_MEMLOCK", i64 8} ; [ DW_TAG_enumerator ] [__RLIMIT_MEMLOCK :: 8]
!1368 = metadata !{i32 786472, metadata !"__RLIMIT_LOCKS", i64 10} ; [ DW_TAG_enumerator ] [__RLIMIT_LOCKS :: 10]
!1369 = metadata !{i32 786472, metadata !"__RLIMIT_SIGPENDING", i64 11} ; [ DW_TAG_enumerator ] [__RLIMIT_SIGPENDING :: 11]
!1370 = metadata !{i32 786472, metadata !"__RLIMIT_MSGQUEUE", i64 12} ; [ DW_TAG_enumerator ] [__RLIMIT_MSGQUEUE :: 12]
!1371 = metadata !{i32 786472, metadata !"__RLIMIT_NICE", i64 13} ; [ DW_TAG_enumerator ] [__RLIMIT_NICE :: 13]
!1372 = metadata !{i32 786472, metadata !"__RLIMIT_RTPRIO", i64 14} ; [ DW_TAG_enumerator ] [__RLIMIT_RTPRIO :: 14]
!1373 = metadata !{i32 786472, metadata !"__RLIMIT_RTTIME", i64 15} ; [ DW_TAG_enumerator ] [__RLIMIT_RTTIME :: 15]
!1374 = metadata !{i32 786472, metadata !"__RLIMIT_NLIMITS", i64 16} ; [ DW_TAG_enumerator ] [__RLIMIT_NLIMITS :: 16]
!1375 = metadata !{i32 786472, metadata !"__RLIM_NLIMITS", i64 16} ; [ DW_TAG_enumerator ] [__RLIM_NLIMITS :: 16]
!1376 = metadata !{metadata !1377, metadata !1487, metadata !1494, metadata !1505, metadata !1508, metadata !1509, metadata !1515, metadata !1568, metadata !1574, metadata !1582, metadata !1586, metadata !1595, metadata !1600, metadata !1604, metadata !1
!1377 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"__syscall_rt_sigaction", metadata !"__syscall_rt_sigaction", metadata !"", i32 40, metadata !1380, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.sigact
!1378 = metadata !{metadata !"stubs.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1379 = metadata !{i32 786473, metadata !1378}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/stubs.c]
!1380 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1381, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1381 = metadata !{metadata !30, metadata !30, metadata !1382, metadata !1480, metadata !1481}
!1382 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1383} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1383 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1384} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from sigaction]
!1384 = metadata !{i32 786451, metadata !1385, null, metadata !"sigaction", i32 24, i64 1216, i64 64, i32 0, i32 0, null, metadata !1386, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [sigaction] [line 24, size 1216, align 64, offset 0] [def] [fro
!1385 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/sigaction.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1386 = metadata !{metadata !1387, metadata !1470, metadata !1475, metadata !1476}
!1387 = metadata !{i32 786445, metadata !1385, metadata !1384, metadata !"__sigaction_handler", i32 35, i64 64, i64 64, i64 0, i32 0, metadata !1388} ; [ DW_TAG_member ] [__sigaction_handler] [line 35, size 64, align 64, offset 0] [from ]
!1388 = metadata !{i32 786455, metadata !1385, metadata !1384, metadata !"", i32 28, i64 64, i64 64, i64 0, i32 0, null, metadata !1389, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 28, size 64, align 64, offset 0] [def] [from ]
!1389 = metadata !{metadata !1390, metadata !1395}
!1390 = metadata !{i32 786445, metadata !1385, metadata !1388, metadata !"sa_handler", i32 31, i64 64, i64 64, i64 0, i32 0, metadata !1391} ; [ DW_TAG_member ] [sa_handler] [line 31, size 64, align 64, offset 0] [from __sighandler_t]
!1391 = metadata !{i32 786454, metadata !1385, null, metadata !"__sighandler_t", i32 85, i64 0, i64 0, i64 0, i32 0, metadata !1392} ; [ DW_TAG_typedef ] [__sighandler_t] [line 85, size 0, align 0, offset 0] [from ]
!1392 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1393} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1393 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1394, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1394 = metadata !{null, metadata !30}
!1395 = metadata !{i32 786445, metadata !1385, metadata !1388, metadata !"sa_sigaction", i32 33, i64 64, i64 64, i64 0, i32 0, metadata !1396} ; [ DW_TAG_member ] [sa_sigaction] [line 33, size 64, align 64, offset 0] [from ]
!1396 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1397} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1397 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1398, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1398 = metadata !{null, metadata !30, metadata !1399, metadata !173}
!1399 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1400} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from siginfo_t]
!1400 = metadata !{i32 786454, metadata !1385, null, metadata !"siginfo_t", i32 133, i64 0, i64 0, i64 0, i32 0, metadata !1401} ; [ DW_TAG_typedef ] [siginfo_t] [line 133, size 0, align 0, offset 0] [from ]
!1401 = metadata !{i32 786451, metadata !1402, null, metadata !"", i32 62, i64 1024, i64 64, i32 0, i32 0, null, metadata !1403, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 62, size 1024, align 64, offset 0] [def] [from ]
!1402 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/siginfo.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1403 = metadata !{metadata !1404, metadata !1405, metadata !1406, metadata !1407}
!1404 = metadata !{i32 786445, metadata !1402, metadata !1401, metadata !"si_signo", i32 64, i64 32, i64 32, i64 0, i32 0, metadata !30} ; [ DW_TAG_member ] [si_signo] [line 64, size 32, align 32, offset 0] [from int]
!1405 = metadata !{i32 786445, metadata !1402, metadata !1401, metadata !"si_errno", i32 65, i64 32, i64 32, i64 32, i32 0, metadata !30} ; [ DW_TAG_member ] [si_errno] [line 65, size 32, align 32, offset 32] [from int]
!1406 = metadata !{i32 786445, metadata !1402, metadata !1401, metadata !"si_code", i32 67, i64 32, i64 32, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ] [si_code] [line 67, size 32, align 32, offset 64] [from int]
!1407 = metadata !{i32 786445, metadata !1402, metadata !1401, metadata !"_sifields", i32 132, i64 896, i64 64, i64 128, i32 0, metadata !1408} ; [ DW_TAG_member ] [_sifields] [line 132, size 896, align 64, offset 128] [from ]
!1408 = metadata !{i32 786455, metadata !1402, metadata !1401, metadata !"", i32 69, i64 896, i64 64, i64 0, i32 0, null, metadata !1409, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 69, size 896, align 64, offset 0] [def] [from ]
!1409 = metadata !{metadata !1410, metadata !1414, metadata !1421, metadata !1432, metadata !1438, metadata !1448, metadata !1459, metadata !1464}
!1410 = metadata !{i32 786445, metadata !1402, metadata !1408, metadata !"_pad", i32 71, i64 896, i64 32, i64 0, i32 0, metadata !1411} ; [ DW_TAG_member ] [_pad] [line 71, size 896, align 32, offset 0] [from ]
!1411 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 896, i64 32, i32 0, i32 0, metadata !30, metadata !1412, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 896, align 32, offset 0] [from int]
!1412 = metadata !{metadata !1413}
!1413 = metadata !{i32 786465, i64 0, i64 28}     ; [ DW_TAG_subrange_type ] [0, 27]
!1414 = metadata !{i32 786445, metadata !1402, metadata !1408, metadata !"_kill", i32 78, i64 64, i64 32, i64 0, i32 0, metadata !1415} ; [ DW_TAG_member ] [_kill] [line 78, size 64, align 32, offset 0] [from ]
!1415 = metadata !{i32 786451, metadata !1402, metadata !1408, metadata !"", i32 74, i64 64, i64 32, i32 0, i32 0, null, metadata !1416, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 74, size 64, align 32, offset 0] [def] [from ]
!1416 = metadata !{metadata !1417, metadata !1419}
!1417 = metadata !{i32 786445, metadata !1402, metadata !1415, metadata !"si_pid", i32 76, i64 32, i64 32, i64 0, i32 0, metadata !1418} ; [ DW_TAG_member ] [si_pid] [line 76, size 32, align 32, offset 0] [from __pid_t]
!1418 = metadata !{i32 786454, metadata !1402, null, metadata !"__pid_t", i32 133, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ] [__pid_t] [line 133, size 0, align 0, offset 0] [from int]
!1419 = metadata !{i32 786445, metadata !1402, metadata !1415, metadata !"si_uid", i32 77, i64 32, i64 32, i64 32, i32 0, metadata !1420} ; [ DW_TAG_member ] [si_uid] [line 77, size 32, align 32, offset 32] [from __uid_t]
!1420 = metadata !{i32 786454, metadata !1402, null, metadata !"__uid_t", i32 125, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [__uid_t] [line 125, size 0, align 0, offset 0] [from unsigned int]
!1421 = metadata !{i32 786445, metadata !1402, metadata !1408, metadata !"_timer", i32 86, i64 128, i64 64, i64 0, i32 0, metadata !1422} ; [ DW_TAG_member ] [_timer] [line 86, size 128, align 64, offset 0] [from ]
!1422 = metadata !{i32 786451, metadata !1402, metadata !1408, metadata !"", i32 81, i64 128, i64 64, i32 0, i32 0, null, metadata !1423, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 81, size 128, align 64, offset 0] [def] [from ]
!1423 = metadata !{metadata !1424, metadata !1425, metadata !1426}
!1424 = metadata !{i32 786445, metadata !1402, metadata !1422, metadata !"si_tid", i32 83, i64 32, i64 32, i64 0, i32 0, metadata !30} ; [ DW_TAG_member ] [si_tid] [line 83, size 32, align 32, offset 0] [from int]
!1425 = metadata !{i32 786445, metadata !1402, metadata !1422, metadata !"si_overrun", i32 84, i64 32, i64 32, i64 32, i32 0, metadata !30} ; [ DW_TAG_member ] [si_overrun] [line 84, size 32, align 32, offset 32] [from int]
!1426 = metadata !{i32 786445, metadata !1402, metadata !1422, metadata !"si_sigval", i32 85, i64 64, i64 64, i64 64, i32 0, metadata !1427} ; [ DW_TAG_member ] [si_sigval] [line 85, size 64, align 64, offset 64] [from sigval_t]
!1427 = metadata !{i32 786454, metadata !1402, null, metadata !"sigval_t", i32 36, i64 0, i64 0, i64 0, i32 0, metadata !1428} ; [ DW_TAG_typedef ] [sigval_t] [line 36, size 0, align 0, offset 0] [from sigval]
!1428 = metadata !{i32 786455, metadata !1402, null, metadata !"sigval", i32 32, i64 64, i64 64, i64 0, i32 0, null, metadata !1429, i32 0, null, null, null} ; [ DW_TAG_union_type ] [sigval] [line 32, size 64, align 64, offset 0] [def] [from ]
!1429 = metadata !{metadata !1430, metadata !1431}
!1430 = metadata !{i32 786445, metadata !1402, metadata !1428, metadata !"sival_int", i32 34, i64 32, i64 32, i64 0, i32 0, metadata !30} ; [ DW_TAG_member ] [sival_int] [line 34, size 32, align 32, offset 0] [from int]
!1431 = metadata !{i32 786445, metadata !1402, metadata !1428, metadata !"sival_ptr", i32 35, i64 64, i64 64, i64 0, i32 0, metadata !173} ; [ DW_TAG_member ] [sival_ptr] [line 35, size 64, align 64, offset 0] [from ]
!1432 = metadata !{i32 786445, metadata !1402, metadata !1408, metadata !"_rt", i32 94, i64 128, i64 64, i64 0, i32 0, metadata !1433} ; [ DW_TAG_member ] [_rt] [line 94, size 128, align 64, offset 0] [from ]
!1433 = metadata !{i32 786451, metadata !1402, metadata !1408, metadata !"", i32 89, i64 128, i64 64, i32 0, i32 0, null, metadata !1434, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 89, size 128, align 64, offset 0] [def] [from ]
!1434 = metadata !{metadata !1435, metadata !1436, metadata !1437}
!1435 = metadata !{i32 786445, metadata !1402, metadata !1433, metadata !"si_pid", i32 91, i64 32, i64 32, i64 0, i32 0, metadata !1418} ; [ DW_TAG_member ] [si_pid] [line 91, size 32, align 32, offset 0] [from __pid_t]
!1436 = metadata !{i32 786445, metadata !1402, metadata !1433, metadata !"si_uid", i32 92, i64 32, i64 32, i64 32, i32 0, metadata !1420} ; [ DW_TAG_member ] [si_uid] [line 92, size 32, align 32, offset 32] [from __uid_t]
!1437 = metadata !{i32 786445, metadata !1402, metadata !1433, metadata !"si_sigval", i32 93, i64 64, i64 64, i64 64, i32 0, metadata !1427} ; [ DW_TAG_member ] [si_sigval] [line 93, size 64, align 64, offset 64] [from sigval_t]
!1438 = metadata !{i32 786445, metadata !1402, metadata !1408, metadata !"_sigchld", i32 104, i64 256, i64 64, i64 0, i32 0, metadata !1439} ; [ DW_TAG_member ] [_sigchld] [line 104, size 256, align 64, offset 0] [from ]
!1439 = metadata !{i32 786451, metadata !1402, metadata !1408, metadata !"", i32 97, i64 256, i64 64, i32 0, i32 0, null, metadata !1440, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 97, size 256, align 64, offset 0] [def] [from ]
!1440 = metadata !{metadata !1441, metadata !1442, metadata !1443, metadata !1444, metadata !1447}
!1441 = metadata !{i32 786445, metadata !1402, metadata !1439, metadata !"si_pid", i32 99, i64 32, i64 32, i64 0, i32 0, metadata !1418} ; [ DW_TAG_member ] [si_pid] [line 99, size 32, align 32, offset 0] [from __pid_t]
!1442 = metadata !{i32 786445, metadata !1402, metadata !1439, metadata !"si_uid", i32 100, i64 32, i64 32, i64 32, i32 0, metadata !1420} ; [ DW_TAG_member ] [si_uid] [line 100, size 32, align 32, offset 32] [from __uid_t]
!1443 = metadata !{i32 786445, metadata !1402, metadata !1439, metadata !"si_status", i32 101, i64 32, i64 32, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ] [si_status] [line 101, size 32, align 32, offset 64] [from int]
!1444 = metadata !{i32 786445, metadata !1402, metadata !1439, metadata !"si_utime", i32 102, i64 64, i64 64, i64 128, i32 0, metadata !1445} ; [ DW_TAG_member ] [si_utime] [line 102, size 64, align 64, offset 128] [from __sigchld_clock_t]
!1445 = metadata !{i32 786454, metadata !1402, null, metadata !"__sigchld_clock_t", i32 58, i64 0, i64 0, i64 0, i32 0, metadata !1446} ; [ DW_TAG_typedef ] [__sigchld_clock_t] [line 58, size 0, align 0, offset 0] [from __clock_t]
!1446 = metadata !{i32 786454, metadata !1402, null, metadata !"__clock_t", i32 135, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__clock_t] [line 135, size 0, align 0, offset 0] [from long int]
!1447 = metadata !{i32 786445, metadata !1402, metadata !1439, metadata !"si_stime", i32 103, i64 64, i64 64, i64 192, i32 0, metadata !1445} ; [ DW_TAG_member ] [si_stime] [line 103, size 64, align 64, offset 192] [from __sigchld_clock_t]
!1448 = metadata !{i32 786445, metadata !1402, metadata !1408, metadata !"_sigfault", i32 116, i64 256, i64 64, i64 0, i32 0, metadata !1449} ; [ DW_TAG_member ] [_sigfault] [line 116, size 256, align 64, offset 0] [from ]
!1449 = metadata !{i32 786451, metadata !1402, metadata !1408, metadata !"", i32 107, i64 256, i64 64, i32 0, i32 0, null, metadata !1450, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 107, size 256, align 64, offset 0] [def] [from ]
!1450 = metadata !{metadata !1451, metadata !1452, metadata !1454}
!1451 = metadata !{i32 786445, metadata !1402, metadata !1449, metadata !"si_addr", i32 109, i64 64, i64 64, i64 0, i32 0, metadata !173} ; [ DW_TAG_member ] [si_addr] [line 109, size 64, align 64, offset 0] [from ]
!1452 = metadata !{i32 786445, metadata !1402, metadata !1449, metadata !"si_addr_lsb", i32 110, i64 16, i64 16, i64 64, i32 0, metadata !1453} ; [ DW_TAG_member ] [si_addr_lsb] [line 110, size 16, align 16, offset 64] [from short]
!1453 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!1454 = metadata !{i32 786445, metadata !1402, metadata !1449, metadata !"si_addr_bnd", i32 115, i64 128, i64 64, i64 128, i32 0, metadata !1455} ; [ DW_TAG_member ] [si_addr_bnd] [line 115, size 128, align 64, offset 128] [from ]
!1455 = metadata !{i32 786451, metadata !1402, metadata !1449, metadata !"", i32 111, i64 128, i64 64, i32 0, i32 0, null, metadata !1456, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 111, size 128, align 64, offset 0] [def] [from ]
!1456 = metadata !{metadata !1457, metadata !1458}
!1457 = metadata !{i32 786445, metadata !1402, metadata !1455, metadata !"_lower", i32 113, i64 64, i64 64, i64 0, i32 0, metadata !173} ; [ DW_TAG_member ] [_lower] [line 113, size 64, align 64, offset 0] [from ]
!1458 = metadata !{i32 786445, metadata !1402, metadata !1455, metadata !"_upper", i32 114, i64 64, i64 64, i64 64, i32 0, metadata !173} ; [ DW_TAG_member ] [_upper] [line 114, size 64, align 64, offset 64] [from ]
!1459 = metadata !{i32 786445, metadata !1402, metadata !1408, metadata !"_sigpoll", i32 123, i64 128, i64 64, i64 0, i32 0, metadata !1460} ; [ DW_TAG_member ] [_sigpoll] [line 123, size 128, align 64, offset 0] [from ]
!1460 = metadata !{i32 786451, metadata !1402, metadata !1408, metadata !"", i32 119, i64 128, i64 64, i32 0, i32 0, null, metadata !1461, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 119, size 128, align 64, offset 0] [def] [from ]
!1461 = metadata !{metadata !1462, metadata !1463}
!1462 = metadata !{i32 786445, metadata !1402, metadata !1460, metadata !"si_band", i32 121, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [si_band] [line 121, size 64, align 64, offset 0] [from long int]
!1463 = metadata !{i32 786445, metadata !1402, metadata !1460, metadata !"si_fd", i32 122, i64 32, i64 32, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ] [si_fd] [line 122, size 32, align 32, offset 64] [from int]
!1464 = metadata !{i32 786445, metadata !1402, metadata !1408, metadata !"_sigsys", i32 131, i64 128, i64 64, i64 0, i32 0, metadata !1465} ; [ DW_TAG_member ] [_sigsys] [line 131, size 128, align 64, offset 0] [from ]
!1465 = metadata !{i32 786451, metadata !1402, metadata !1408, metadata !"", i32 126, i64 128, i64 64, i32 0, i32 0, null, metadata !1466, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 126, size 128, align 64, offset 0] [def] [from ]
!1466 = metadata !{metadata !1467, metadata !1468, metadata !1469}
!1467 = metadata !{i32 786445, metadata !1402, metadata !1465, metadata !"_call_addr", i32 128, i64 64, i64 64, i64 0, i32 0, metadata !173} ; [ DW_TAG_member ] [_call_addr] [line 128, size 64, align 64, offset 0] [from ]
!1468 = metadata !{i32 786445, metadata !1402, metadata !1465, metadata !"_syscall", i32 129, i64 32, i64 32, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ] [_syscall] [line 129, size 32, align 32, offset 64] [from int]
!1469 = metadata !{i32 786445, metadata !1402, metadata !1465, metadata !"_arch", i32 130, i64 32, i64 32, i64 96, i32 0, metadata !43} ; [ DW_TAG_member ] [_arch] [line 130, size 32, align 32, offset 96] [from unsigned int]
!1470 = metadata !{i32 786445, metadata !1385, metadata !1384, metadata !"sa_mask", i32 43, i64 1024, i64 64, i64 64, i32 0, metadata !1471} ; [ DW_TAG_member ] [sa_mask] [line 43, size 1024, align 64, offset 64] [from __sigset_t]
!1471 = metadata !{i32 786454, metadata !1385, null, metadata !"__sigset_t", i32 30, i64 0, i64 0, i64 0, i32 0, metadata !1472} ; [ DW_TAG_typedef ] [__sigset_t] [line 30, size 0, align 0, offset 0] [from ]
!1472 = metadata !{i32 786451, metadata !1190, null, metadata !"", i32 27, i64 1024, i64 64, i32 0, i32 0, null, metadata !1473, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 27, size 1024, align 64, offset 0] [def] [from ]
!1473 = metadata !{metadata !1474}
!1474 = metadata !{i32 786445, metadata !1190, metadata !1472, metadata !"__val", i32 29, i64 1024, i64 64, i64 0, i32 0, metadata !1193} ; [ DW_TAG_member ] [__val] [line 29, size 1024, align 64, offset 0] [from ]
!1475 = metadata !{i32 786445, metadata !1385, metadata !1384, metadata !"sa_flags", i32 46, i64 32, i64 32, i64 1088, i32 0, metadata !30} ; [ DW_TAG_member ] [sa_flags] [line 46, size 32, align 32, offset 1088] [from int]
!1476 = metadata !{i32 786445, metadata !1385, metadata !1384, metadata !"sa_restorer", i32 49, i64 64, i64 64, i64 1152, i32 0, metadata !1477} ; [ DW_TAG_member ] [sa_restorer] [line 49, size 64, align 64, offset 1152] [from ]
!1477 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1478} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1478 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1479, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1479 = metadata !{null}
!1480 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1384} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from sigaction]
!1481 = metadata !{i32 786454, metadata !1378, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!1482 = metadata !{metadata !1483, metadata !1484, metadata !1485, metadata !1486}
!1483 = metadata !{i32 786689, metadata !1377, metadata !"signum", metadata !1379, i32 16777256, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [signum] [line 40]
!1484 = metadata !{i32 786689, metadata !1377, metadata !"act", metadata !1379, i32 33554472, metadata !1382, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [act] [line 40]
!1485 = metadata !{i32 786689, metadata !1377, metadata !"oldact", metadata !1379, i32 50331689, metadata !1480, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldact] [line 41]
!1486 = metadata !{i32 786689, metadata !1377, metadata !"_something", metadata !1379, i32 67108905, metadata !1481, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [_something] [line 41]
!1487 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"sigaction", metadata !"sigaction", metadata !"", i32 49, metadata !1488, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.sigaction*, %struct.sigaction*)*
!1488 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1489, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1489 = metadata !{metadata !30, metadata !30, metadata !1382, metadata !1480}
!1490 = metadata !{metadata !1491, metadata !1492, metadata !1493}
!1491 = metadata !{i32 786689, metadata !1487, metadata !"signum", metadata !1379, i32 16777265, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [signum] [line 49]
!1492 = metadata !{i32 786689, metadata !1487, metadata !"act", metadata !1379, i32 33554481, metadata !1382, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [act] [line 49]
!1493 = metadata !{i32 786689, metadata !1487, metadata !"oldact", metadata !1379, i32 50331698, metadata !1480, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldact] [line 50]
!1494 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"sigprocmask", metadata !"sigprocmask", metadata !"", i32 57, metadata !1495, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.__sigset_t*, %struct.__sigse
!1495 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1496, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1496 = metadata !{metadata !30, metadata !30, metadata !1497, metadata !1500}
!1497 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1498} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1498 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1499} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from sigset_t]
!1499 = metadata !{i32 786454, metadata !1378, null, metadata !"sigset_t", i32 49, i64 0, i64 0, i64 0, i32 0, metadata !1471} ; [ DW_TAG_typedef ] [sigset_t] [line 49, size 0, align 0, offset 0] [from __sigset_t]
!1500 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1499} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from sigset_t]
!1501 = metadata !{metadata !1502, metadata !1503, metadata !1504}
!1502 = metadata !{i32 786689, metadata !1494, metadata !"how", metadata !1379, i32 16777273, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [how] [line 57]
!1503 = metadata !{i32 786689, metadata !1494, metadata !"set", metadata !1379, i32 33554489, metadata !1497, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [set] [line 57]
!1504 = metadata !{i32 786689, metadata !1494, metadata !"oldset", metadata !1379, i32 50331705, metadata !1500, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldset] [line 57]
!1505 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"fdatasync", metadata !"fdatasync", metadata !"", i32 64, metadata !162, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fdatasync, null, null, metadata !1506, 
!1506 = metadata !{metadata !1507}
!1507 = metadata !{i32 786689, metadata !1505, metadata !"fd", metadata !1379, i32 16777280, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 64]
!1508 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"sync", metadata !"sync", metadata !"", i32 70, metadata !1478, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ()* @sync, null, null, metadata !23, i32 70} ; [ DW_TAG
!1509 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"__socketcall", metadata !"__socketcall", metadata !"", i32 79, metadata !1510, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32*)* @__socketcall, null, null, 
!1510 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1511, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1511 = metadata !{metadata !30, metadata !30, metadata !443}
!1512 = metadata !{metadata !1513, metadata !1514}
!1513 = metadata !{i32 786689, metadata !1509, metadata !"type", metadata !1379, i32 16777295, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [type] [line 79]
!1514 = metadata !{i32 786689, metadata !1509, metadata !"args", metadata !1379, i32 33554511, metadata !443, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [args] [line 79]
!1515 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"_IO_getc", metadata !"_IO_getc", metadata !"", i32 86, metadata !1516, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct._IO_FILE*)* @_IO_getc, null, null, meta
!1516 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1517, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1517 = metadata !{metadata !30, metadata !1518}
!1518 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1519} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!1519 = metadata !{i32 786454, metadata !1378, null, metadata !"FILE", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !1520} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!1520 = metadata !{i32 786451, metadata !1521, null, metadata !"_IO_FILE", i32 241, i64 1728, i64 64, i32 0, i32 0, null, metadata !1522, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 241, size 1728, align 64, offset 0] [def] [fro
!1521 = metadata !{metadata !"/usr/include/libio.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1522 = metadata !{metadata !1523, metadata !1524, metadata !1525, metadata !1526, metadata !1527, metadata !1528, metadata !1529, metadata !1530, metadata !1531, metadata !1532, metadata !1533, metadata !1534, metadata !1535, metadata !1543, metadata !1
!1523 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_flags", i32 242, i64 32, i64 32, i64 0, i32 0, metadata !30} ; [ DW_TAG_member ] [_flags] [line 242, size 32, align 32, offset 0] [from int]
!1524 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_IO_read_ptr", i32 247, i64 64, i64 64, i64 64, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_ptr] [line 247, size 64, align 64, offset 64] [from ]
!1525 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_IO_read_end", i32 248, i64 64, i64 64, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_end] [line 248, size 64, align 64, offset 128] [from ]
!1526 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_IO_read_base", i32 249, i64 64, i64 64, i64 192, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_read_base] [line 249, size 64, align 64, offset 192] [from ]
!1527 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_IO_write_base", i32 250, i64 64, i64 64, i64 256, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_base] [line 250, size 64, align 64, offset 256] [from ]
!1528 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_IO_write_ptr", i32 251, i64 64, i64 64, i64 320, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_ptr] [line 251, size 64, align 64, offset 320] [from ]
!1529 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_IO_write_end", i32 252, i64 64, i64 64, i64 384, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_write_end] [line 252, size 64, align 64, offset 384] [from ]
!1530 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_IO_buf_base", i32 253, i64 64, i64 64, i64 448, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_base] [line 253, size 64, align 64, offset 448] [from ]
!1531 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_IO_buf_end", i32 254, i64 64, i64 64, i64 512, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_buf_end] [line 254, size 64, align 64, offset 512] [from ]
!1532 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_IO_save_base", i32 256, i64 64, i64 64, i64 576, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_base] [line 256, size 64, align 64, offset 576] [from ]
!1533 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_IO_backup_base", i32 257, i64 64, i64 64, i64 640, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_backup_base] [line 257, size 64, align 64, offset 640] [from ]
!1534 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_IO_save_end", i32 258, i64 64, i64 64, i64 704, i32 0, metadata !45} ; [ DW_TAG_member ] [_IO_save_end] [line 258, size 64, align 64, offset 704] [from ]
!1535 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_markers", i32 260, i64 64, i64 64, i64 768, i32 0, metadata !1536} ; [ DW_TAG_member ] [_markers] [line 260, size 64, align 64, offset 768] [from ]
!1536 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1537} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!1537 = metadata !{i32 786451, metadata !1521, null, metadata !"_IO_marker", i32 156, i64 192, i64 64, i32 0, i32 0, null, metadata !1538, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 156, size 192, align 64, offset 0] [def] [f
!1538 = metadata !{metadata !1539, metadata !1540, metadata !1542}
!1539 = metadata !{i32 786445, metadata !1521, metadata !1537, metadata !"_next", i32 157, i64 64, i64 64, i64 0, i32 0, metadata !1536} ; [ DW_TAG_member ] [_next] [line 157, size 64, align 64, offset 0] [from ]
!1540 = metadata !{i32 786445, metadata !1521, metadata !1537, metadata !"_sbuf", i32 158, i64 64, i64 64, i64 64, i32 0, metadata !1541} ; [ DW_TAG_member ] [_sbuf] [line 158, size 64, align 64, offset 64] [from ]
!1541 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1520} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!1542 = metadata !{i32 786445, metadata !1521, metadata !1537, metadata !"_pos", i32 162, i64 32, i64 32, i64 128, i32 0, metadata !30} ; [ DW_TAG_member ] [_pos] [line 162, size 32, align 32, offset 128] [from int]
!1543 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_chain", i32 262, i64 64, i64 64, i64 832, i32 0, metadata !1541} ; [ DW_TAG_member ] [_chain] [line 262, size 64, align 64, offset 832] [from ]
!1544 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_fileno", i32 264, i64 32, i64 32, i64 896, i32 0, metadata !30} ; [ DW_TAG_member ] [_fileno] [line 264, size 32, align 32, offset 896] [from int]
!1545 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_flags2", i32 268, i64 32, i64 32, i64 928, i32 0, metadata !30} ; [ DW_TAG_member ] [_flags2] [line 268, size 32, align 32, offset 928] [from int]
!1546 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_old_offset", i32 270, i64 64, i64 64, i64 960, i32 0, metadata !1547} ; [ DW_TAG_member ] [_old_offset] [line 270, size 64, align 64, offset 960] [from __off_t]
!1547 = metadata !{i32 786454, metadata !1521, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!1548 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_cur_column", i32 274, i64 16, i64 16, i64 1024, i32 0, metadata !354} ; [ DW_TAG_member ] [_cur_column] [line 274, size 16, align 16, offset 1024] [from unsigned short]
!1549 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_vtable_offset", i32 275, i64 8, i64 8, i64 1040, i32 0, metadata !1550} ; [ DW_TAG_member ] [_vtable_offset] [line 275, size 8, align 8, offset 1040] [from signed char]
!1550 = metadata !{i32 786468, null, null, metadata !"signed char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!1551 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_shortbuf", i32 276, i64 8, i64 8, i64 1048, i32 0, metadata !1552} ; [ DW_TAG_member ] [_shortbuf] [line 276, size 8, align 8, offset 1048] [from ]
!1552 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8, i64 8, i32 0, i32 0, metadata !33, metadata !404, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!1553 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_lock", i32 280, i64 64, i64 64, i64 1088, i32 0, metadata !173} ; [ DW_TAG_member ] [_lock] [line 280, size 64, align 64, offset 1088] [from ]
!1554 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_offset", i32 289, i64 64, i64 64, i64 1152, i32 0, metadata !1555} ; [ DW_TAG_member ] [_offset] [line 289, size 64, align 64, offset 1152] [from __off64_t]
!1555 = metadata !{i32 786454, metadata !1521, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!1556 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"__pad1", i32 297, i64 64, i64 64, i64 1216, i32 0, metadata !173} ; [ DW_TAG_member ] [__pad1] [line 297, size 64, align 64, offset 1216] [from ]
!1557 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"__pad2", i32 298, i64 64, i64 64, i64 1280, i32 0, metadata !173} ; [ DW_TAG_member ] [__pad2] [line 298, size 64, align 64, offset 1280] [from ]
!1558 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"__pad3", i32 299, i64 64, i64 64, i64 1344, i32 0, metadata !173} ; [ DW_TAG_member ] [__pad3] [line 299, size 64, align 64, offset 1344] [from ]
!1559 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"__pad4", i32 300, i64 64, i64 64, i64 1408, i32 0, metadata !173} ; [ DW_TAG_member ] [__pad4] [line 300, size 64, align 64, offset 1408] [from ]
!1560 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"__pad5", i32 302, i64 64, i64 64, i64 1472, i32 0, metadata !1481} ; [ DW_TAG_member ] [__pad5] [line 302, size 64, align 64, offset 1472] [from size_t]
!1561 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_mode", i32 303, i64 32, i64 32, i64 1536, i32 0, metadata !30} ; [ DW_TAG_member ] [_mode] [line 303, size 32, align 32, offset 1536] [from int]
!1562 = metadata !{i32 786445, metadata !1521, metadata !1520, metadata !"_unused2", i32 305, i64 160, i64 8, i64 1568, i32 0, metadata !1563} ; [ DW_TAG_member ] [_unused2] [line 305, size 160, align 8, offset 1568] [from ]
!1563 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160, i64 8, i32 0, i32 0, metadata !33, metadata !1564, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!1564 = metadata !{metadata !1565}
!1565 = metadata !{i32 786465, i64 0, i64 20}     ; [ DW_TAG_subrange_type ] [0, 19]
!1566 = metadata !{metadata !1567}
!1567 = metadata !{i32 786689, metadata !1515, metadata !"f", metadata !1379, i32 16777302, metadata !1518, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 86]
!1568 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"_IO_putc", metadata !"_IO_putc", metadata !"", i32 91, metadata !1569, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct._IO_FILE*)* @_IO_putc, null, null,
!1569 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1570, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1570 = metadata !{metadata !30, metadata !30, metadata !1518}
!1571 = metadata !{metadata !1572, metadata !1573}
!1572 = metadata !{i32 786689, metadata !1568, metadata !"c", metadata !1379, i32 16777307, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 91]
!1573 = metadata !{i32 786689, metadata !1568, metadata !"f", metadata !1379, i32 33554523, metadata !1518, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [f] [line 91]
!1574 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"mkdir", metadata !"mkdir", metadata !"", i32 96, metadata !1575, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @mkdir, null, null, metadata !1579, i32 96
!1575 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1576, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1576 = metadata !{metadata !30, metadata !31, metadata !1577}
!1577 = metadata !{i32 786454, metadata !1378, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !1578} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!1578 = metadata !{i32 786454, metadata !1378, null, metadata !"__mode_t", i32 129, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [__mode_t] [line 129, size 0, align 0, offset 0] [from unsigned int]
!1579 = metadata !{metadata !1580, metadata !1581}
!1580 = metadata !{i32 786689, metadata !1574, metadata !"pathname", metadata !1379, i32 16777312, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 96]
!1581 = metadata !{i32 786689, metadata !1574, metadata !"mode", metadata !1379, i32 33554528, metadata !1577, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 96]
!1582 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"mkfifo", metadata !"mkfifo", metadata !"", i32 103, metadata !1575, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @mkfifo, null, null, metadata !1583, i3
!1583 = metadata !{metadata !1584, metadata !1585}
!1584 = metadata !{i32 786689, metadata !1582, metadata !"pathname", metadata !1379, i32 16777319, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 103]
!1585 = metadata !{i32 786689, metadata !1582, metadata !"mode", metadata !1379, i32 33554535, metadata !1577, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 103]
!1586 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"mknod", metadata !"mknod", metadata !"", i32 110, metadata !1587, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @mknod, null, null, metadata !1591, 
!1587 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1588, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1588 = metadata !{metadata !30, metadata !31, metadata !1577, metadata !1589}
!1589 = metadata !{i32 786454, metadata !1378, null, metadata !"dev_t", i32 60, i64 0, i64 0, i64 0, i32 0, metadata !1590} ; [ DW_TAG_typedef ] [dev_t] [line 60, size 0, align 0, offset 0] [from __dev_t]
!1590 = metadata !{i32 786454, metadata !1378, null, metadata !"__dev_t", i32 124, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [__dev_t] [line 124, size 0, align 0, offset 0] [from long unsigned int]
!1591 = metadata !{metadata !1592, metadata !1593, metadata !1594}
!1592 = metadata !{i32 786689, metadata !1586, metadata !"pathname", metadata !1379, i32 16777326, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 110]
!1593 = metadata !{i32 786689, metadata !1586, metadata !"mode", metadata !1379, i32 33554542, metadata !1577, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 110]
!1594 = metadata !{i32 786689, metadata !1586, metadata !"dev", metadata !1379, i32 50331758, metadata !1589, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dev] [line 110]
!1595 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"pipe", metadata !"pipe", metadata !"", i32 117, metadata !1596, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @pipe, null, null, metadata !1598, i32 117} ; [
!1596 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1597, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1597 = metadata !{metadata !30, metadata !443}
!1598 = metadata !{metadata !1599}
!1599 = metadata !{i32 786689, metadata !1595, metadata !"filedes", metadata !1379, i32 16777333, metadata !443, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [filedes] [line 117]
!1600 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"link", metadata !"link", metadata !"", i32 124, metadata !1203, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*)* @link, null, null, metadata !1601, i32 124}
!1601 = metadata !{metadata !1602, metadata !1603}
!1602 = metadata !{i32 786689, metadata !1600, metadata !"oldpath", metadata !1379, i32 16777340, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldpath] [line 124]
!1603 = metadata !{i32 786689, metadata !1600, metadata !"newpath", metadata !1379, i32 33554556, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [newpath] [line 124]
!1604 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"symlink", metadata !"symlink", metadata !"", i32 131, metadata !1203, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*)* @symlink, null, null, metadata !1605,
!1605 = metadata !{metadata !1606, metadata !1607}
!1606 = metadata !{i32 786689, metadata !1604, metadata !"oldpath", metadata !1379, i32 16777347, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldpath] [line 131]
!1607 = metadata !{i32 786689, metadata !1604, metadata !"newpath", metadata !1379, i32 33554563, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [newpath] [line 131]
!1608 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"rename", metadata !"rename", metadata !"", i32 138, metadata !1203, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*)* @rename, null, null, metadata !1609, i3
!1609 = metadata !{metadata !1610, metadata !1611}
!1610 = metadata !{i32 786689, metadata !1608, metadata !"oldpath", metadata !1379, i32 16777354, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldpath] [line 138]
!1611 = metadata !{i32 786689, metadata !1608, metadata !"newpath", metadata !1379, i32 33554570, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [newpath] [line 138]
!1612 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"nanosleep", metadata !"nanosleep", metadata !"", i32 145, metadata !1613, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.timespec*, %struct.timespec*)* @nano
!1613 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1614, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1614 = metadata !{metadata !30, metadata !1615, metadata !1621}
!1615 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1616} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1616 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1617} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from timespec]
!1617 = metadata !{i32 786451, metadata !75, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !1618, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!1618 = metadata !{metadata !1619, metadata !1620}
!1619 = metadata !{i32 786445, metadata !75, metadata !1617, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!1620 = metadata !{i32 786445, metadata !75, metadata !1617, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !80} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!1621 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1617} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from timespec]
!1622 = metadata !{metadata !1623, metadata !1624}
!1623 = metadata !{i32 786689, metadata !1612, metadata !"req", metadata !1379, i32 16777361, metadata !1615, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [req] [line 145]
!1624 = metadata !{i32 786689, metadata !1612, metadata !"rem", metadata !1379, i32 33554577, metadata !1621, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rem] [line 145]
!1625 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"clock_gettime", metadata !"clock_gettime", metadata !"", i32 151, metadata !1626, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.timespec*)* @clock_gett
!1626 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1627, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1627 = metadata !{metadata !30, metadata !1628, metadata !1621}
!1628 = metadata !{i32 786454, metadata !1378, null, metadata !"clockid_t", i32 91, i64 0, i64 0, i64 0, i32 0, metadata !1629} ; [ DW_TAG_typedef ] [clockid_t] [line 91, size 0, align 0, offset 0] [from __clockid_t]
!1629 = metadata !{i32 786454, metadata !1378, null, metadata !"__clockid_t", i32 147, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ] [__clockid_t] [line 147, size 0, align 0, offset 0] [from int]
!1630 = metadata !{metadata !1631, metadata !1632, metadata !1633}
!1631 = metadata !{i32 786689, metadata !1625, metadata !"clk_id", metadata !1379, i32 16777367, metadata !1628, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [clk_id] [line 151]
!1632 = metadata !{i32 786689, metadata !1625, metadata !"res", metadata !1379, i32 33554583, metadata !1621, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [res] [line 151]
!1633 = metadata !{i32 786688, metadata !1625, metadata !"tv", metadata !1379, i32 153, metadata !1634, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tv] [line 153]
!1634 = metadata !{i32 786451, metadata !140, null, metadata !"timeval", i32 30, i64 128, i64 64, i32 0, i32 0, null, metadata !1635, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!1635 = metadata !{metadata !1636, metadata !1637}
!1636 = metadata !{i32 786445, metadata !140, metadata !1634, metadata !"tv_sec", i32 32, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!1637 = metadata !{i32 786445, metadata !140, metadata !1634, metadata !"tv_usec", i32 33, i64 64, i64 64, i64 64, i32 0, metadata !144} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!1638 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"clock_settime", metadata !"clock_settime", metadata !"", i32 161, metadata !1639, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.timespec*)* @clock_sett
!1639 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1640, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1640 = metadata !{metadata !30, metadata !1628, metadata !1615}
!1641 = metadata !{metadata !1642, metadata !1643}
!1642 = metadata !{i32 786689, metadata !1638, metadata !"clk_id", metadata !1379, i32 16777377, metadata !1628, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [clk_id] [line 161]
!1643 = metadata !{i32 786689, metadata !1638, metadata !"res", metadata !1379, i32 33554593, metadata !1615, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [res] [line 161]
!1644 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"time", metadata !"time", metadata !"", i32 167, metadata !1645, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i64*)* @time, null, null, metadata !1649, i32 167} ; [
!1645 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1646, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1646 = metadata !{metadata !1647, metadata !1648}
!1647 = metadata !{i32 786454, metadata !1378, null, metadata !"time_t", i32 75, i64 0, i64 0, i64 0, i32 0, metadata !78} ; [ DW_TAG_typedef ] [time_t] [line 75, size 0, align 0, offset 0] [from __time_t]
!1648 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1647} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from time_t]
!1649 = metadata !{metadata !1650, metadata !1651}
!1650 = metadata !{i32 786689, metadata !1644, metadata !"t", metadata !1379, i32 16777383, metadata !1648, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [t] [line 167]
!1651 = metadata !{i32 786688, metadata !1644, metadata !"tv", metadata !1379, i32 168, metadata !1634, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tv] [line 168]
!1652 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"times", metadata !"times", metadata !"", i32 175, metadata !1653, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (%struct.tms*)* @times, null, null, metadata !1664, i
!1653 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1654, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1654 = metadata !{metadata !1655, metadata !1656}
!1655 = metadata !{i32 786454, metadata !1378, null, metadata !"clock_t", i32 59, i64 0, i64 0, i64 0, i32 0, metadata !1446} ; [ DW_TAG_typedef ] [clock_t] [line 59, size 0, align 0, offset 0] [from __clock_t]
!1656 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1657} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from tms]
!1657 = metadata !{i32 786451, metadata !1658, null, metadata !"tms", i32 34, i64 256, i64 64, i32 0, i32 0, null, metadata !1659, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [tms] [line 34, size 256, align 64, offset 0] [def] [from ]
!1658 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/sys/times.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1659 = metadata !{metadata !1660, metadata !1661, metadata !1662, metadata !1663}
!1660 = metadata !{i32 786445, metadata !1658, metadata !1657, metadata !"tms_utime", i32 36, i64 64, i64 64, i64 0, i32 0, metadata !1655} ; [ DW_TAG_member ] [tms_utime] [line 36, size 64, align 64, offset 0] [from clock_t]
!1661 = metadata !{i32 786445, metadata !1658, metadata !1657, metadata !"tms_stime", i32 37, i64 64, i64 64, i64 64, i32 0, metadata !1655} ; [ DW_TAG_member ] [tms_stime] [line 37, size 64, align 64, offset 64] [from clock_t]
!1662 = metadata !{i32 786445, metadata !1658, metadata !1657, metadata !"tms_cutime", i32 39, i64 64, i64 64, i64 128, i32 0, metadata !1655} ; [ DW_TAG_member ] [tms_cutime] [line 39, size 64, align 64, offset 128] [from clock_t]
!1663 = metadata !{i32 786445, metadata !1658, metadata !1657, metadata !"tms_cstime", i32 40, i64 64, i64 64, i64 192, i32 0, metadata !1655} ; [ DW_TAG_member ] [tms_cstime] [line 40, size 64, align 64, offset 192] [from clock_t]
!1664 = metadata !{metadata !1665}
!1665 = metadata !{i32 786689, metadata !1652, metadata !"buf", metadata !1379, i32 16777391, metadata !1656, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 175]
!1666 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"getutxent", metadata !"getutxent", metadata !"", i32 190, metadata !1667, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, %struct.utmpx* ()* @getutxent, null, null, metada
!1667 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1668, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1668 = metadata !{metadata !1669}
!1669 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1670} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from utmpx]
!1670 = metadata !{i32 786451, metadata !1378, null, metadata !"utmpx", i32 189, i64 0, i64 0, i32 0, i32 4, null, null, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [utmpx] [line 189, size 0, align 0, offset 0] [decl] [from ]
!1671 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"setutxent", metadata !"setutxent", metadata !"", i32 195, metadata !1478, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ()* @setutxent, null, null, metadata !23, i3
!1672 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"endutxent", metadata !"endutxent", metadata !"", i32 200, metadata !1478, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ()* @endutxent, null, null, metadata !23, i3
!1673 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"utmpxname", metadata !"utmpxname", metadata !"", i32 205, metadata !257, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @utmpxname, null, null, metadata !1674,
!1674 = metadata !{metadata !1675}
!1675 = metadata !{i32 786689, metadata !1673, metadata !"file", metadata !1379, i32 16777421, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [file] [line 205]
!1676 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"euidaccess", metadata !"euidaccess", metadata !"", i32 211, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @euidaccess, null, null, metadata
!1677 = metadata !{metadata !1678, metadata !1679}
!1678 = metadata !{i32 786689, metadata !1676, metadata !"pathname", metadata !1379, i32 16777427, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 211]
!1679 = metadata !{i32 786689, metadata !1676, metadata !"mode", metadata !1379, i32 33554643, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 211]
!1680 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"eaccess", metadata !"eaccess", metadata !"", i32 216, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @eaccess, null, null, metadata !1681, i
!1681 = metadata !{metadata !1682, metadata !1683}
!1682 = metadata !{i32 786689, metadata !1680, metadata !"pathname", metadata !1379, i32 16777432, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 216]
!1683 = metadata !{i32 786689, metadata !1680, metadata !"mode", metadata !1379, i32 33554648, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 216]
!1684 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"group_member", metadata !"group_member", metadata !"", i32 221, metadata !1685, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @group_member, null, null, metad
!1685 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1686, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1686 = metadata !{metadata !30, metadata !1687}
!1687 = metadata !{i32 786454, metadata !1378, null, metadata !"gid_t", i32 65, i64 0, i64 0, i64 0, i32 0, metadata !1688} ; [ DW_TAG_typedef ] [gid_t] [line 65, size 0, align 0, offset 0] [from __gid_t]
!1688 = metadata !{i32 786454, metadata !1378, null, metadata !"__gid_t", i32 126, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [__gid_t] [line 126, size 0, align 0, offset 0] [from unsigned int]
!1689 = metadata !{metadata !1690}
!1690 = metadata !{i32 786689, metadata !1684, metadata !"__gid", metadata !1379, i32 16777437, metadata !1687, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__gid] [line 221]
!1691 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"utime", metadata !"utime", metadata !"", i32 226, metadata !1692, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.utimbuf*)* @utime, null, null, metadata
!1692 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1693, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1693 = metadata !{metadata !30, metadata !31, metadata !1694}
!1694 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1695} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1695 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1696} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from utimbuf]
!1696 = metadata !{i32 786451, metadata !1697, null, metadata !"utimbuf", i32 37, i64 128, i64 64, i32 0, i32 0, null, metadata !1698, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [utimbuf] [line 37, size 128, align 64, offset 0] [def] [from ]
!1697 = metadata !{metadata !"/usr/include/utime.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1698 = metadata !{metadata !1699, metadata !1700}
!1699 = metadata !{i32 786445, metadata !1697, metadata !1696, metadata !"actime", i32 39, i64 64, i64 64, i64 0, i32 0, metadata !78} ; [ DW_TAG_member ] [actime] [line 39, size 64, align 64, offset 0] [from __time_t]
!1700 = metadata !{i32 786445, metadata !1697, metadata !1696, metadata !"modtime", i32 40, i64 64, i64 64, i64 64, i32 0, metadata !78} ; [ DW_TAG_member ] [modtime] [line 40, size 64, align 64, offset 64] [from __time_t]
!1701 = metadata !{metadata !1702, metadata !1703}
!1702 = metadata !{i32 786689, metadata !1691, metadata !"filename", metadata !1379, i32 16777442, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [filename] [line 226]
!1703 = metadata !{i32 786689, metadata !1691, metadata !"buf", metadata !1379, i32 33554658, metadata !1694, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 226]
!1704 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"futimes", metadata !"futimes", metadata !"", i32 233, metadata !1705, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.timeval*)* @futimes, null, null, me
!1705 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1706, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1706 = metadata !{metadata !30, metadata !30, metadata !1707}
!1707 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1708} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1708 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1634} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from timeval]
!1709 = metadata !{metadata !1710, metadata !1711}
!1710 = metadata !{i32 786689, metadata !1704, metadata !"fd", metadata !1379, i32 16777449, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 233]
!1711 = metadata !{i32 786689, metadata !1704, metadata !"times", metadata !1379, i32 33554665, metadata !1707, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [times] [line 233]
!1712 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"strverscmp", metadata !"strverscmp", metadata !"", i32 239, metadata !1203, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*)* @strverscmp, null, null, metada
!1713 = metadata !{metadata !1714, metadata !1715, metadata !1716, metadata !1718}
!1714 = metadata !{i32 786689, metadata !1712, metadata !"__s1", metadata !1379, i32 16777455, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__s1] [line 239]
!1715 = metadata !{i32 786689, metadata !1712, metadata !"__s2", metadata !1379, i32 33554671, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__s2] [line 239]
!1716 = metadata !{i32 786688, metadata !1717, metadata !"__s1_len", metadata !1379, i32 240, metadata !1481, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s1_len] [line 240]
!1717 = metadata !{i32 786443, metadata !1378, metadata !1712, i32 240, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/stubs.c]
!1718 = metadata !{i32 786688, metadata !1717, metadata !"__s2_len", metadata !1379, i32 240, metadata !1481, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [__s2_len] [line 240]
!1719 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"gnu_dev_major", metadata !"gnu_dev_major", metadata !"", i32 244, metadata !1720, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64)* @gnu_dev_major, null, null, me
!1720 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1721, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1721 = metadata !{metadata !43, metadata !1722}
!1722 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!1723 = metadata !{metadata !1724}
!1724 = metadata !{i32 786689, metadata !1719, metadata !"__dev", metadata !1379, i32 16777460, metadata !1722, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__dev] [line 244]
!1725 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"gnu_dev_minor", metadata !"gnu_dev_minor", metadata !"", i32 249, metadata !1720, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64)* @gnu_dev_minor, null, null, me
!1726 = metadata !{metadata !1727}
!1727 = metadata !{i32 786689, metadata !1725, metadata !"__dev", metadata !1379, i32 16777465, metadata !1722, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__dev] [line 249]
!1728 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"gnu_dev_makedev", metadata !"gnu_dev_makedev", metadata !"", i32 254, metadata !1729, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i32)* @gnu_dev_makedev, nul
!1729 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1730, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1730 = metadata !{metadata !1722, metadata !43, metadata !43}
!1731 = metadata !{metadata !1732, metadata !1733}
!1732 = metadata !{i32 786689, metadata !1728, metadata !"__major", metadata !1379, i32 16777470, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__major] [line 254]
!1733 = metadata !{i32 786689, metadata !1728, metadata !"__minor", metadata !1379, i32 33554686, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__minor] [line 254]
!1734 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"canonicalize_file_name", metadata !"canonicalize_file_name", metadata !"", i32 261, metadata !1735, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*)* @canonicaliz
!1735 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1736, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1736 = metadata !{metadata !45, metadata !31}
!1737 = metadata !{metadata !1738}
!1738 = metadata !{i32 786689, metadata !1734, metadata !"name", metadata !1379, i32 16777477, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 261]
!1739 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"getloadavg", metadata !"getloadavg", metadata !"", i32 266, metadata !1740, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (double*, i32)* @getloadavg, null, null, me
!1740 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1741, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1741 = metadata !{metadata !30, metadata !1742, metadata !30}
!1742 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1743} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!1743 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!1744 = metadata !{metadata !1745, metadata !1746}
!1745 = metadata !{i32 786689, metadata !1739, metadata !"loadavg", metadata !1379, i32 16777482, metadata !1742, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [loadavg] [line 266]
!1746 = metadata !{i32 786689, metadata !1739, metadata !"nelem", metadata !1379, i32 33554698, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nelem] [line 266]
!1747 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"wait", metadata !"wait", metadata !"", i32 272, metadata !1748, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @wait, null, null, metadata !1751, i32 272} ; [
!1748 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1749, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1749 = metadata !{metadata !1750, metadata !443}
!1750 = metadata !{i32 786454, metadata !1378, null, metadata !"pid_t", i32 61, i64 0, i64 0, i64 0, i32 0, metadata !1418} ; [ DW_TAG_typedef ] [pid_t] [line 61, size 0, align 0, offset 0] [from __pid_t]
!1751 = metadata !{metadata !1752}
!1752 = metadata !{i32 786689, metadata !1747, metadata !"status", metadata !1379, i32 16777488, metadata !443, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [status] [line 272]
!1753 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"wait3", metadata !"wait3", metadata !"", i32 279, metadata !1754, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i32, %struct.rusage*)* @wait3, null, null, met
!1754 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1755, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1755 = metadata !{metadata !1750, metadata !443, metadata !30, metadata !1756}
!1756 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1757} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from rusage]
!1757 = metadata !{i32 786451, metadata !1350, null, metadata !"rusage", i32 187, i64 1152, i64 64, i32 0, i32 0, null, metadata !1758, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [rusage] [line 187, size 1152, align 64, offset 0] [def] [from ]
!1758 = metadata !{metadata !1759, metadata !1760, metadata !1761, metadata !1766, metadata !1771, metadata !1776, metadata !1781, metadata !1786, metadata !1791, metadata !1796, metadata !1801, metadata !1806, metadata !1811, metadata !1816, metadata !1
!1759 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"ru_utime", i32 190, i64 128, i64 64, i64 0, i32 0, metadata !1634} ; [ DW_TAG_member ] [ru_utime] [line 190, size 128, align 64, offset 0] [from timeval]
!1760 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"ru_stime", i32 192, i64 128, i64 64, i64 128, i32 0, metadata !1634} ; [ DW_TAG_member ] [ru_stime] [line 192, size 128, align 64, offset 128] [from timeval]
!1761 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 194, i64 64, i64 64, i64 256, i32 0, metadata !1762} ; [ DW_TAG_member ] [line 194, size 64, align 64, offset 256] [from ]
!1762 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 194, i64 64, i64 64, i64 0, i32 0, null, metadata !1763, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 194, size 64, align 64, offset 0] [def] [from ]
!1763 = metadata !{metadata !1764, metadata !1765}
!1764 = metadata !{i32 786445, metadata !1350, metadata !1762, metadata !"ru_maxrss", i32 196, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_maxrss] [line 196, size 64, align 64, offset 0] [from long int]
!1765 = metadata !{i32 786445, metadata !1350, metadata !1762, metadata !"__ru_maxrss_word", i32 197, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_maxrss_word] [line 197, size 64, align 64, offset 0] [from __syscall_slong_t]
!1766 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 202, i64 64, i64 64, i64 320, i32 0, metadata !1767} ; [ DW_TAG_member ] [line 202, size 64, align 64, offset 320] [from ]
!1767 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 202, i64 64, i64 64, i64 0, i32 0, null, metadata !1768, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 202, size 64, align 64, offset 0] [def] [from ]
!1768 = metadata !{metadata !1769, metadata !1770}
!1769 = metadata !{i32 786445, metadata !1350, metadata !1767, metadata !"ru_ixrss", i32 204, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_ixrss] [line 204, size 64, align 64, offset 0] [from long int]
!1770 = metadata !{i32 786445, metadata !1350, metadata !1767, metadata !"__ru_ixrss_word", i32 205, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_ixrss_word] [line 205, size 64, align 64, offset 0] [from __syscall_slong_t]
!1771 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 208, i64 64, i64 64, i64 384, i32 0, metadata !1772} ; [ DW_TAG_member ] [line 208, size 64, align 64, offset 384] [from ]
!1772 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 208, i64 64, i64 64, i64 0, i32 0, null, metadata !1773, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 208, size 64, align 64, offset 0] [def] [from ]
!1773 = metadata !{metadata !1774, metadata !1775}
!1774 = metadata !{i32 786445, metadata !1350, metadata !1772, metadata !"ru_idrss", i32 210, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_idrss] [line 210, size 64, align 64, offset 0] [from long int]
!1775 = metadata !{i32 786445, metadata !1350, metadata !1772, metadata !"__ru_idrss_word", i32 211, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_idrss_word] [line 211, size 64, align 64, offset 0] [from __syscall_slong_t]
!1776 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 214, i64 64, i64 64, i64 448, i32 0, metadata !1777} ; [ DW_TAG_member ] [line 214, size 64, align 64, offset 448] [from ]
!1777 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 214, i64 64, i64 64, i64 0, i32 0, null, metadata !1778, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 214, size 64, align 64, offset 0] [def] [from ]
!1778 = metadata !{metadata !1779, metadata !1780}
!1779 = metadata !{i32 786445, metadata !1350, metadata !1777, metadata !"ru_isrss", i32 216, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_isrss] [line 216, size 64, align 64, offset 0] [from long int]
!1780 = metadata !{i32 786445, metadata !1350, metadata !1777, metadata !"__ru_isrss_word", i32 217, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_isrss_word] [line 217, size 64, align 64, offset 0] [from __syscall_slong_t]
!1781 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 221, i64 64, i64 64, i64 512, i32 0, metadata !1782} ; [ DW_TAG_member ] [line 221, size 64, align 64, offset 512] [from ]
!1782 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 221, i64 64, i64 64, i64 0, i32 0, null, metadata !1783, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 221, size 64, align 64, offset 0] [def] [from ]
!1783 = metadata !{metadata !1784, metadata !1785}
!1784 = metadata !{i32 786445, metadata !1350, metadata !1782, metadata !"ru_minflt", i32 223, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_minflt] [line 223, size 64, align 64, offset 0] [from long int]
!1785 = metadata !{i32 786445, metadata !1350, metadata !1782, metadata !"__ru_minflt_word", i32 224, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_minflt_word] [line 224, size 64, align 64, offset 0] [from __syscall_slong_t]
!1786 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 227, i64 64, i64 64, i64 576, i32 0, metadata !1787} ; [ DW_TAG_member ] [line 227, size 64, align 64, offset 576] [from ]
!1787 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 227, i64 64, i64 64, i64 0, i32 0, null, metadata !1788, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 227, size 64, align 64, offset 0] [def] [from ]
!1788 = metadata !{metadata !1789, metadata !1790}
!1789 = metadata !{i32 786445, metadata !1350, metadata !1787, metadata !"ru_majflt", i32 229, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_majflt] [line 229, size 64, align 64, offset 0] [from long int]
!1790 = metadata !{i32 786445, metadata !1350, metadata !1787, metadata !"__ru_majflt_word", i32 230, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_majflt_word] [line 230, size 64, align 64, offset 0] [from __syscall_slong_t]
!1791 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 233, i64 64, i64 64, i64 640, i32 0, metadata !1792} ; [ DW_TAG_member ] [line 233, size 64, align 64, offset 640] [from ]
!1792 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 233, i64 64, i64 64, i64 0, i32 0, null, metadata !1793, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 233, size 64, align 64, offset 0] [def] [from ]
!1793 = metadata !{metadata !1794, metadata !1795}
!1794 = metadata !{i32 786445, metadata !1350, metadata !1792, metadata !"ru_nswap", i32 235, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_nswap] [line 235, size 64, align 64, offset 0] [from long int]
!1795 = metadata !{i32 786445, metadata !1350, metadata !1792, metadata !"__ru_nswap_word", i32 236, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_nswap_word] [line 236, size 64, align 64, offset 0] [from __syscall_slong_t]
!1796 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 240, i64 64, i64 64, i64 704, i32 0, metadata !1797} ; [ DW_TAG_member ] [line 240, size 64, align 64, offset 704] [from ]
!1797 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 240, i64 64, i64 64, i64 0, i32 0, null, metadata !1798, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 240, size 64, align 64, offset 0] [def] [from ]
!1798 = metadata !{metadata !1799, metadata !1800}
!1799 = metadata !{i32 786445, metadata !1350, metadata !1797, metadata !"ru_inblock", i32 242, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_inblock] [line 242, size 64, align 64, offset 0] [from long int]
!1800 = metadata !{i32 786445, metadata !1350, metadata !1797, metadata !"__ru_inblock_word", i32 243, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_inblock_word] [line 243, size 64, align 64, offset 0] [from __syscall_slong_t]
!1801 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 246, i64 64, i64 64, i64 768, i32 0, metadata !1802} ; [ DW_TAG_member ] [line 246, size 64, align 64, offset 768] [from ]
!1802 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 246, i64 64, i64 64, i64 0, i32 0, null, metadata !1803, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 246, size 64, align 64, offset 0] [def] [from ]
!1803 = metadata !{metadata !1804, metadata !1805}
!1804 = metadata !{i32 786445, metadata !1350, metadata !1802, metadata !"ru_oublock", i32 248, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_oublock] [line 248, size 64, align 64, offset 0] [from long int]
!1805 = metadata !{i32 786445, metadata !1350, metadata !1802, metadata !"__ru_oublock_word", i32 249, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_oublock_word] [line 249, size 64, align 64, offset 0] [from __syscall_slong_t]
!1806 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 252, i64 64, i64 64, i64 832, i32 0, metadata !1807} ; [ DW_TAG_member ] [line 252, size 64, align 64, offset 832] [from ]
!1807 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 252, i64 64, i64 64, i64 0, i32 0, null, metadata !1808, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 252, size 64, align 64, offset 0] [def] [from ]
!1808 = metadata !{metadata !1809, metadata !1810}
!1809 = metadata !{i32 786445, metadata !1350, metadata !1807, metadata !"ru_msgsnd", i32 254, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_msgsnd] [line 254, size 64, align 64, offset 0] [from long int]
!1810 = metadata !{i32 786445, metadata !1350, metadata !1807, metadata !"__ru_msgsnd_word", i32 255, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_msgsnd_word] [line 255, size 64, align 64, offset 0] [from __syscall_slong_t]
!1811 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 258, i64 64, i64 64, i64 896, i32 0, metadata !1812} ; [ DW_TAG_member ] [line 258, size 64, align 64, offset 896] [from ]
!1812 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 258, i64 64, i64 64, i64 0, i32 0, null, metadata !1813, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 258, size 64, align 64, offset 0] [def] [from ]
!1813 = metadata !{metadata !1814, metadata !1815}
!1814 = metadata !{i32 786445, metadata !1350, metadata !1812, metadata !"ru_msgrcv", i32 260, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_msgrcv] [line 260, size 64, align 64, offset 0] [from long int]
!1815 = metadata !{i32 786445, metadata !1350, metadata !1812, metadata !"__ru_msgrcv_word", i32 261, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_msgrcv_word] [line 261, size 64, align 64, offset 0] [from __syscall_slong_t]
!1816 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 264, i64 64, i64 64, i64 960, i32 0, metadata !1817} ; [ DW_TAG_member ] [line 264, size 64, align 64, offset 960] [from ]
!1817 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 264, i64 64, i64 64, i64 0, i32 0, null, metadata !1818, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 264, size 64, align 64, offset 0] [def] [from ]
!1818 = metadata !{metadata !1819, metadata !1820}
!1819 = metadata !{i32 786445, metadata !1350, metadata !1817, metadata !"ru_nsignals", i32 266, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_nsignals] [line 266, size 64, align 64, offset 0] [from long int]
!1820 = metadata !{i32 786445, metadata !1350, metadata !1817, metadata !"__ru_nsignals_word", i32 267, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_nsignals_word] [line 267, size 64, align 64, offset 0] [from __syscall_slong_t]
!1821 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 272, i64 64, i64 64, i64 1024, i32 0, metadata !1822} ; [ DW_TAG_member ] [line 272, size 64, align 64, offset 1024] [from ]
!1822 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 272, i64 64, i64 64, i64 0, i32 0, null, metadata !1823, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 272, size 64, align 64, offset 0] [def] [from ]
!1823 = metadata !{metadata !1824, metadata !1825}
!1824 = metadata !{i32 786445, metadata !1350, metadata !1822, metadata !"ru_nvcsw", i32 274, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_nvcsw] [line 274, size 64, align 64, offset 0] [from long int]
!1825 = metadata !{i32 786445, metadata !1350, metadata !1822, metadata !"__ru_nvcsw_word", i32 275, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_nvcsw_word] [line 275, size 64, align 64, offset 0] [from __syscall_slong_t]
!1826 = metadata !{i32 786445, metadata !1350, metadata !1757, metadata !"", i32 279, i64 64, i64 64, i64 1088, i32 0, metadata !1827} ; [ DW_TAG_member ] [line 279, size 64, align 64, offset 1088] [from ]
!1827 = metadata !{i32 786455, metadata !1350, metadata !1757, metadata !"", i32 279, i64 64, i64 64, i64 0, i32 0, null, metadata !1828, i32 0, null, null, null} ; [ DW_TAG_union_type ] [line 279, size 64, align 64, offset 0] [def] [from ]
!1828 = metadata !{metadata !1829, metadata !1830}
!1829 = metadata !{i32 786445, metadata !1350, metadata !1827, metadata !"ru_nivcsw", i32 281, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ] [ru_nivcsw] [line 281, size 64, align 64, offset 0] [from long int]
!1830 = metadata !{i32 786445, metadata !1350, metadata !1827, metadata !"__ru_nivcsw_word", i32 282, i64 64, i64 64, i64 0, i32 0, metadata !80} ; [ DW_TAG_member ] [__ru_nivcsw_word] [line 282, size 64, align 64, offset 0] [from __syscall_slong_t]
!1831 = metadata !{metadata !1832, metadata !1833, metadata !1834}
!1832 = metadata !{i32 786689, metadata !1753, metadata !"status", metadata !1379, i32 16777495, metadata !443, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [status] [line 279]
!1833 = metadata !{i32 786689, metadata !1753, metadata !"options", metadata !1379, i32 33554711, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [options] [line 279]
!1834 = metadata !{i32 786689, metadata !1753, metadata !"rusage", metadata !1379, i32 50331927, metadata !1756, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rusage] [line 279]
!1835 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"wait4", metadata !"wait4", metadata !"", i32 286, metadata !1836, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32*, i32, %struct.rusage*)* @wait4, null, null
!1836 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1837, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1837 = metadata !{metadata !1750, metadata !1750, metadata !443, metadata !30, metadata !1756}
!1838 = metadata !{metadata !1839, metadata !1840, metadata !1841, metadata !1842}
!1839 = metadata !{i32 786689, metadata !1835, metadata !"pid", metadata !1379, i32 16777502, metadata !1750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pid] [line 286]
!1840 = metadata !{i32 786689, metadata !1835, metadata !"status", metadata !1379, i32 33554718, metadata !443, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [status] [line 286]
!1841 = metadata !{i32 786689, metadata !1835, metadata !"options", metadata !1379, i32 50331934, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [options] [line 286]
!1842 = metadata !{i32 786689, metadata !1835, metadata !"rusage", metadata !1379, i32 67109150, metadata !1756, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rusage] [line 286]
!1843 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"waitpid", metadata !"waitpid", metadata !"", i32 293, metadata !1844, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32*, i32)* @waitpid, null, null, metadata 
!1844 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1845, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1845 = metadata !{metadata !1418, metadata !1750, metadata !443, metadata !30}
!1846 = metadata !{metadata !1847, metadata !1848, metadata !1849}
!1847 = metadata !{i32 786689, metadata !1843, metadata !"pid", metadata !1379, i32 16777509, metadata !1750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pid] [line 293]
!1848 = metadata !{i32 786689, metadata !1843, metadata !"status", metadata !1379, i32 33554725, metadata !443, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [status] [line 293]
!1849 = metadata !{i32 786689, metadata !1843, metadata !"options", metadata !1379, i32 50331941, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [options] [line 293]
!1850 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"waitid", metadata !"waitid", metadata !"", i32 300, metadata !1851, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, %struct.siginfo_t*, i32)* @waitid, null,
!1851 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1852, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1852 = metadata !{metadata !30, metadata !1853, metadata !1854, metadata !1399, metadata !30}
!1853 = metadata !{i32 786454, metadata !1378, null, metadata !"idtype_t", i32 55, i64 0, i64 0, i64 0, i32 0, metadata !1343} ; [ DW_TAG_typedef ] [idtype_t] [line 55, size 0, align 0, offset 0] [from ]
!1854 = metadata !{i32 786454, metadata !1378, null, metadata !"id_t", i32 104, i64 0, i64 0, i64 0, i32 0, metadata !1855} ; [ DW_TAG_typedef ] [id_t] [line 104, size 0, align 0, offset 0] [from __id_t]
!1855 = metadata !{i32 786454, metadata !1378, null, metadata !"__id_t", i32 138, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_typedef ] [__id_t] [line 138, size 0, align 0, offset 0] [from unsigned int]
!1856 = metadata !{metadata !1857, metadata !1858, metadata !1859, metadata !1860}
!1857 = metadata !{i32 786689, metadata !1850, metadata !"idtype", metadata !1379, i32 16777516, metadata !1853, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [idtype] [line 300]
!1858 = metadata !{i32 786689, metadata !1850, metadata !"id", metadata !1379, i32 33554732, metadata !1854, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [id] [line 300]
!1859 = metadata !{i32 786689, metadata !1850, metadata !"infop", metadata !1379, i32 50331948, metadata !1399, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [infop] [line 300]
!1860 = metadata !{i32 786689, metadata !1850, metadata !"options", metadata !1379, i32 67109164, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [options] [line 300]
!1861 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"mount", metadata !"mount", metadata !"", i32 380, metadata !1862, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i8*, i64, i8*)* @mount, null, null, metada
!1862 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1863, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1863 = metadata !{metadata !30, metadata !31, metadata !31, metadata !31, metadata !53, metadata !186}
!1864 = metadata !{metadata !1865, metadata !1866, metadata !1867, metadata !1868, metadata !1869}
!1865 = metadata !{i32 786689, metadata !1861, metadata !"source", metadata !1379, i32 16777596, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [source] [line 380]
!1866 = metadata !{i32 786689, metadata !1861, metadata !"target", metadata !1379, i32 33554812, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [target] [line 380]
!1867 = metadata !{i32 786689, metadata !1861, metadata !"filesystemtype", metadata !1379, i32 50332028, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [filesystemtype] [line 380]
!1868 = metadata !{i32 786689, metadata !1861, metadata !"mountflags", metadata !1379, i32 67109244, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mountflags] [line 380]
!1869 = metadata !{i32 786689, metadata !1861, metadata !"data", metadata !1379, i32 83886460, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 380]
!1870 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"umount", metadata !"umount", metadata !"", i32 387, metadata !257, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @umount, null, null, metadata !1871, i32 387}
!1871 = metadata !{metadata !1872}
!1872 = metadata !{i32 786689, metadata !1870, metadata !"target", metadata !1379, i32 16777603, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [target] [line 387]
!1873 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"umount2", metadata !"umount2", metadata !"", i32 394, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @umount2, null, null, metadata !1874, i
!1874 = metadata !{metadata !1875, metadata !1876}
!1875 = metadata !{i32 786689, metadata !1873, metadata !"target", metadata !1379, i32 16777610, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [target] [line 394]
!1876 = metadata !{i32 786689, metadata !1873, metadata !"flags", metadata !1379, i32 33554826, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 394]
!1877 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"swapon", metadata !"swapon", metadata !"", i32 401, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @swapon, null, null, metadata !1878, i32 
!1878 = metadata !{metadata !1879, metadata !1880}
!1879 = metadata !{i32 786689, metadata !1877, metadata !"path", metadata !1379, i32 16777617, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 401]
!1880 = metadata !{i32 786689, metadata !1877, metadata !"swapflags", metadata !1379, i32 33554833, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [swapflags] [line 401]
!1881 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"swapoff", metadata !"swapoff", metadata !"", i32 408, metadata !257, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @swapoff, null, null, metadata !1882, i32 4
!1882 = metadata !{metadata !1883}
!1883 = metadata !{i32 786689, metadata !1881, metadata !"path", metadata !1379, i32 16777624, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 408]
!1884 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"setgid", metadata !"setgid", metadata !"", i32 415, metadata !1685, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @setgid, null, null, metadata !1885, i32 415
!1885 = metadata !{metadata !1886}
!1886 = metadata !{i32 786689, metadata !1884, metadata !"gid", metadata !1379, i32 16777631, metadata !1687, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [gid] [line 415]
!1887 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"setgroups", metadata !"setgroups", metadata !"", i32 421, metadata !1888, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64, i32*)* @setgroups, null, null, metadata
!1888 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1889, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1889 = metadata !{metadata !30, metadata !1481, metadata !1890}
!1890 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1891} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1891 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1687} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from gid_t]
!1892 = metadata !{metadata !1893, metadata !1894}
!1893 = metadata !{i32 786689, metadata !1887, metadata !"size", metadata !1379, i32 16777637, metadata !1481, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 421]
!1894 = metadata !{i32 786689, metadata !1887, metadata !"list", metadata !1379, i32 33554853, metadata !1890, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [list] [line 421]
!1895 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"sethostname", metadata !"sethostname", metadata !"", i32 428, metadata !1896, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64)* @sethostname, null, null, met
!1896 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1897, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1897 = metadata !{metadata !30, metadata !31, metadata !1481}
!1898 = metadata !{metadata !1899, metadata !1900}
!1899 = metadata !{i32 786689, metadata !1895, metadata !"name", metadata !1379, i32 16777644, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 428]
!1900 = metadata !{i32 786689, metadata !1895, metadata !"len", metadata !1379, i32 33554860, metadata !1481, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 428]
!1901 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"setpgid", metadata !"setpgid", metadata !"", i32 435, metadata !1902, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @setpgid, null, null, metadata !1904,
!1902 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1903, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1903 = metadata !{metadata !30, metadata !1750, metadata !1750}
!1904 = metadata !{metadata !1905, metadata !1906}
!1905 = metadata !{i32 786689, metadata !1901, metadata !"pid", metadata !1379, i32 16777651, metadata !1750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pid] [line 435]
!1906 = metadata !{i32 786689, metadata !1901, metadata !"pgid", metadata !1379, i32 33554867, metadata !1750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pgid] [line 435]
!1907 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"setpgrp", metadata !"setpgrp", metadata !"", i32 442, metadata !1239, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @setpgrp, null, null, metadata !23, i32 442} 
!1908 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"setpriority", metadata !"setpriority", metadata !"", i32 449, metadata !1909, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @setpriority, null, null
!1909 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1910, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1910 = metadata !{metadata !30, metadata !1911, metadata !1854, metadata !30}
!1911 = metadata !{i32 786454, metadata !1378, null, metadata !"__priority_which_t", i32 40, i64 0, i64 0, i64 0, i32 0, metadata !1349} ; [ DW_TAG_typedef ] [__priority_which_t] [line 40, size 0, align 0, offset 0] [from __priority_which]
!1912 = metadata !{metadata !1913, metadata !1914, metadata !1915}
!1913 = metadata !{i32 786689, metadata !1908, metadata !"which", metadata !1379, i32 16777665, metadata !1911, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [which] [line 449]
!1914 = metadata !{i32 786689, metadata !1908, metadata !"who", metadata !1379, i32 33554881, metadata !1854, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [who] [line 449]
!1915 = metadata !{i32 786689, metadata !1908, metadata !"prio", metadata !1379, i32 50332097, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prio] [line 449]
!1916 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"setresgid", metadata !"setresgid", metadata !"", i32 456, metadata !1917, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @setresgid, null, null, meta
!1917 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1918, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1918 = metadata !{metadata !30, metadata !1687, metadata !1687, metadata !1687}
!1919 = metadata !{metadata !1920, metadata !1921, metadata !1922}
!1920 = metadata !{i32 786689, metadata !1916, metadata !"rgid", metadata !1379, i32 16777672, metadata !1687, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rgid] [line 456]
!1921 = metadata !{i32 786689, metadata !1916, metadata !"egid", metadata !1379, i32 33554888, metadata !1687, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [egid] [line 456]
!1922 = metadata !{i32 786689, metadata !1916, metadata !"sgid", metadata !1379, i32 50332104, metadata !1687, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sgid] [line 456]
!1923 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"setresuid", metadata !"setresuid", metadata !"", i32 463, metadata !1924, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @setresuid, null, null, meta
!1924 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1925, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1925 = metadata !{metadata !30, metadata !1926, metadata !1926, metadata !1926}
!1926 = metadata !{i32 786454, metadata !1378, null, metadata !"uid_t", i32 67, i64 0, i64 0, i64 0, i32 0, metadata !1420} ; [ DW_TAG_typedef ] [uid_t] [line 67, size 0, align 0, offset 0] [from __uid_t]
!1927 = metadata !{metadata !1928, metadata !1929, metadata !1930}
!1928 = metadata !{i32 786689, metadata !1923, metadata !"ruid", metadata !1379, i32 16777679, metadata !1926, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ruid] [line 463]
!1929 = metadata !{i32 786689, metadata !1923, metadata !"euid", metadata !1379, i32 33554895, metadata !1926, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [euid] [line 463]
!1930 = metadata !{i32 786689, metadata !1923, metadata !"suid", metadata !1379, i32 50332111, metadata !1926, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [suid] [line 463]
!1931 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"setrlimit", metadata !"setrlimit", metadata !"", i32 470, metadata !1932, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.rlimit*)* @setrlimit, null, nul
!1932 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1933, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1933 = metadata !{metadata !30, metadata !1934, metadata !1935}
!1934 = metadata !{i32 786454, metadata !1378, null, metadata !"__rlimit_resource_t", i32 38, i64 0, i64 0, i64 0, i32 0, metadata !1355} ; [ DW_TAG_typedef ] [__rlimit_resource_t] [line 38, size 0, align 0, offset 0] [from __rlimit_resource]
!1935 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1936} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1936 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1937} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from rlimit]
!1937 = metadata !{i32 786451, metadata !1350, null, metadata !"rlimit", i32 139, i64 128, i64 64, i32 0, i32 0, null, metadata !1938, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [rlimit] [line 139, size 128, align 64, offset 0] [def] [from ]
!1938 = metadata !{metadata !1939, metadata !1942}
!1939 = metadata !{i32 786445, metadata !1350, metadata !1937, metadata !"rlim_cur", i32 142, i64 64, i64 64, i64 0, i32 0, metadata !1940} ; [ DW_TAG_member ] [rlim_cur] [line 142, size 64, align 64, offset 0] [from rlim_t]
!1940 = metadata !{i32 786454, metadata !1350, null, metadata !"rlim_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !1941} ; [ DW_TAG_typedef ] [rlim_t] [line 131, size 0, align 0, offset 0] [from __rlim_t]
!1941 = metadata !{i32 786454, metadata !1350, null, metadata !"__rlim_t", i32 136, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [__rlim_t] [line 136, size 0, align 0, offset 0] [from long unsigned int]
!1942 = metadata !{i32 786445, metadata !1350, metadata !1937, metadata !"rlim_max", i32 144, i64 64, i64 64, i64 64, i32 0, metadata !1940} ; [ DW_TAG_member ] [rlim_max] [line 144, size 64, align 64, offset 64] [from rlim_t]
!1943 = metadata !{metadata !1944, metadata !1945}
!1944 = metadata !{i32 786689, metadata !1931, metadata !"resource", metadata !1379, i32 16777686, metadata !1934, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [resource] [line 470]
!1945 = metadata !{i32 786689, metadata !1931, metadata !"rlim", metadata !1379, i32 33554902, metadata !1935, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rlim] [line 470]
!1946 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"setrlimit64", metadata !"setrlimit64", metadata !"", i32 477, metadata !1947, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.rlimit64*)* @setrlimit64, n
!1947 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1948, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1948 = metadata !{metadata !30, metadata !1934, metadata !1949}
!1949 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1950} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1950 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1951} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from rlimit64]
!1951 = metadata !{i32 786451, metadata !1350, null, metadata !"rlimit64", i32 148, i64 128, i64 64, i32 0, i32 0, null, metadata !1952, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [rlimit64] [line 148, size 128, align 64, offset 0] [def] [from 
!1952 = metadata !{metadata !1953, metadata !1956}
!1953 = metadata !{i32 786445, metadata !1350, metadata !1951, metadata !"rlim_cur", i32 151, i64 64, i64 64, i64 0, i32 0, metadata !1954} ; [ DW_TAG_member ] [rlim_cur] [line 151, size 64, align 64, offset 0] [from rlim64_t]
!1954 = metadata !{i32 786454, metadata !1350, null, metadata !"rlim64_t", i32 136, i64 0, i64 0, i64 0, i32 0, metadata !1955} ; [ DW_TAG_typedef ] [rlim64_t] [line 136, size 0, align 0, offset 0] [from __rlim64_t]
!1955 = metadata !{i32 786454, metadata !1350, null, metadata !"__rlim64_t", i32 137, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [__rlim64_t] [line 137, size 0, align 0, offset 0] [from long unsigned int]
!1956 = metadata !{i32 786445, metadata !1350, metadata !1951, metadata !"rlim_max", i32 153, i64 64, i64 64, i64 64, i32 0, metadata !1954} ; [ DW_TAG_member ] [rlim_max] [line 153, size 64, align 64, offset 64] [from rlim64_t]
!1957 = metadata !{metadata !1958, metadata !1959}
!1958 = metadata !{i32 786689, metadata !1946, metadata !"resource", metadata !1379, i32 16777693, metadata !1934, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [resource] [line 477]
!1959 = metadata !{i32 786689, metadata !1946, metadata !"rlim", metadata !1379, i32 33554909, metadata !1949, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rlim] [line 477]
!1960 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"setsid", metadata !"setsid", metadata !"", i32 484, metadata !1961, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @setsid, null, null, metadata !23, i32 484} ; [
!1961 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1962, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1962 = metadata !{metadata !1418}
!1963 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"settimeofday", metadata !"settimeofday", metadata !"", i32 491, metadata !1964, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.timeval*, %struct.timezone*)* 
!1964 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1965, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1965 = metadata !{metadata !30, metadata !1707, metadata !1966}
!1966 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1967} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1967 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1968} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from timezone]
!1968 = metadata !{i32 786451, metadata !1969, null, metadata !"timezone", i32 55, i64 64, i64 32, i32 0, i32 0, null, metadata !1970, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timezone] [line 55, size 64, align 32, offset 0] [def] [from ]
!1969 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/sys/time.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!1970 = metadata !{metadata !1971, metadata !1972}
!1971 = metadata !{i32 786445, metadata !1969, metadata !1968, metadata !"tz_minuteswest", i32 57, i64 32, i64 32, i64 0, i32 0, metadata !30} ; [ DW_TAG_member ] [tz_minuteswest] [line 57, size 32, align 32, offset 0] [from int]
!1972 = metadata !{i32 786445, metadata !1969, metadata !1968, metadata !"tz_dsttime", i32 58, i64 32, i64 32, i64 32, i32 0, metadata !30} ; [ DW_TAG_member ] [tz_dsttime] [line 58, size 32, align 32, offset 32] [from int]
!1973 = metadata !{metadata !1974, metadata !1975}
!1974 = metadata !{i32 786689, metadata !1963, metadata !"tv", metadata !1379, i32 16777707, metadata !1707, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [tv] [line 491]
!1975 = metadata !{i32 786689, metadata !1963, metadata !"tz", metadata !1379, i32 33554923, metadata !1966, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [tz] [line 491]
!1976 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"setuid", metadata !"setuid", metadata !"", i32 498, metadata !1977, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @setuid, null, null, metadata !1979, i32 498
!1977 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1978, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1978 = metadata !{metadata !30, metadata !1926}
!1979 = metadata !{metadata !1980}
!1980 = metadata !{i32 786689, metadata !1976, metadata !"uid", metadata !1379, i32 16777714, metadata !1926, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [uid] [line 498]
!1981 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"reboot", metadata !"reboot", metadata !"", i32 504, metadata !162, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @reboot, null, null, metadata !1982, i32 504}
!1982 = metadata !{metadata !1983}
!1983 = metadata !{i32 786689, metadata !1981, metadata !"flag", metadata !1379, i32 16777720, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flag] [line 504]
!1984 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"mlock", metadata !"mlock", metadata !"", i32 511, metadata !1985, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64)* @mlock, null, null, metadata !1987, i32 5
!1985 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1986, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1986 = metadata !{metadata !30, metadata !186, metadata !1481}
!1987 = metadata !{metadata !1988, metadata !1989}
!1988 = metadata !{i32 786689, metadata !1984, metadata !"addr", metadata !1379, i32 16777727, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [addr] [line 511]
!1989 = metadata !{i32 786689, metadata !1984, metadata !"len", metadata !1379, i32 33554943, metadata !1481, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 511]
!1990 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"munlock", metadata !"munlock", metadata !"", i32 518, metadata !1985, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64)* @munlock, null, null, metadata !1991,
!1991 = metadata !{metadata !1992, metadata !1993}
!1992 = metadata !{i32 786689, metadata !1990, metadata !"addr", metadata !1379, i32 16777734, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [addr] [line 518]
!1993 = metadata !{i32 786689, metadata !1990, metadata !"len", metadata !1379, i32 33554950, metadata !1481, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 518]
!1994 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"pause", metadata !"pause", metadata !"", i32 525, metadata !1239, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @pause, null, null, metadata !23, i32 525} ; [ DW
!1995 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"readahead", metadata !"readahead", metadata !"", i32 532, metadata !1996, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64*, i64)* @readahead, null, null, met
!1996 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1997, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1997 = metadata !{metadata !1998, metadata !30, metadata !2000, metadata !1481}
!1998 = metadata !{i32 786454, metadata !1378, null, metadata !"ssize_t", i32 102, i64 0, i64 0, i64 0, i32 0, metadata !1999} ; [ DW_TAG_typedef ] [ssize_t] [line 102, size 0, align 0, offset 0] [from __ssize_t]
!1999 = metadata !{i32 786454, metadata !1378, null, metadata !"__ssize_t", i32 172, i64 0, i64 0, i64 0, i32 0, metadata !68} ; [ DW_TAG_typedef ] [__ssize_t] [line 172, size 0, align 0, offset 0] [from long int]
!2000 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !2001} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from off64_t]
!2001 = metadata !{i32 786454, metadata !1378, null, metadata !"off64_t", i32 97, i64 0, i64 0, i64 0, i32 0, metadata !1555} ; [ DW_TAG_typedef ] [off64_t] [line 97, size 0, align 0, offset 0] [from __off64_t]
!2002 = metadata !{metadata !2003, metadata !2004, metadata !2005}
!2003 = metadata !{i32 786689, metadata !1995, metadata !"fd", metadata !1379, i32 16777748, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 532]
!2004 = metadata !{i32 786689, metadata !1995, metadata !"offset", metadata !1379, i32 33554964, metadata !2000, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 532]
!2005 = metadata !{i32 786689, metadata !1995, metadata !"count", metadata !1379, i32 50332180, metadata !1481, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 532]
!2006 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"mmap", metadata !"mmap", metadata !"", i32 539, metadata !2007, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i64, i32, i32, i32, i64)* @mmap, null, null, meta
!2007 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2008, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!2008 = metadata !{metadata !173, metadata !173, metadata !1481, metadata !30, metadata !30, metadata !30, metadata !2009}
!2009 = metadata !{i32 786454, metadata !1378, null, metadata !"off_t", i32 90, i64 0, i64 0, i64 0, i32 0, metadata !1547} ; [ DW_TAG_typedef ] [off_t] [line 90, size 0, align 0, offset 0] [from __off_t]
!2010 = metadata !{metadata !2011, metadata !2012, metadata !2013, metadata !2014, metadata !2015, metadata !2016}
!2011 = metadata !{i32 786689, metadata !2006, metadata !"start", metadata !1379, i32 16777755, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 539]
!2012 = metadata !{i32 786689, metadata !2006, metadata !"length", metadata !1379, i32 33554971, metadata !1481, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 539]
!2013 = metadata !{i32 786689, metadata !2006, metadata !"prot", metadata !1379, i32 50332187, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prot] [line 539]
!2014 = metadata !{i32 786689, metadata !2006, metadata !"flags", metadata !1379, i32 67109403, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 539]
!2015 = metadata !{i32 786689, metadata !2006, metadata !"fd", metadata !1379, i32 83886619, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 539]
!2016 = metadata !{i32 786689, metadata !2006, metadata !"offset", metadata !1379, i32 100663835, metadata !2009, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 539]
!2017 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"mmap64", metadata !"mmap64", metadata !"", i32 546, metadata !2018, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i64, i32, i32, i32, i64)* @mmap64, null, null
!2018 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2019, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!2019 = metadata !{metadata !173, metadata !173, metadata !1481, metadata !30, metadata !30, metadata !30, metadata !2001}
!2020 = metadata !{metadata !2021, metadata !2022, metadata !2023, metadata !2024, metadata !2025, metadata !2026}
!2021 = metadata !{i32 786689, metadata !2017, metadata !"start", metadata !1379, i32 16777762, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 546]
!2022 = metadata !{i32 786689, metadata !2017, metadata !"length", metadata !1379, i32 33554978, metadata !1481, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 546]
!2023 = metadata !{i32 786689, metadata !2017, metadata !"prot", metadata !1379, i32 50332194, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prot] [line 546]
!2024 = metadata !{i32 786689, metadata !2017, metadata !"flags", metadata !1379, i32 67109410, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 546]
!2025 = metadata !{i32 786689, metadata !2017, metadata !"fd", metadata !1379, i32 83886626, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 546]
!2026 = metadata !{i32 786689, metadata !2017, metadata !"offset", metadata !1379, i32 100663842, metadata !2001, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 546]
!2027 = metadata !{i32 786478, metadata !1378, metadata !1379, metadata !"munmap", metadata !"munmap", metadata !"", i32 553, metadata !2028, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64)* @munmap, null, null, metadata !2030, i3
!2028 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2029, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!2029 = metadata !{metadata !30, metadata !173, metadata !1481}
!2030 = metadata !{metadata !2031, metadata !2032}
!2031 = metadata !{i32 786689, metadata !2027, metadata !"start", metadata !1379, i32 16777769, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 553]
!2032 = metadata !{i32 786689, metadata !2027, metadata !"length", metadata !1379, i32 33554985, metadata !1481, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 553]
!2033 = metadata !{i32 786449, metadata !2034, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !2035, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_uni
!2034 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2035 = metadata !{metadata !2036}
!2036 = metadata !{i32 786478, metadata !2037, metadata !2038, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !2039, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_che
!2037 = metadata !{metadata !"klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2038 = metadata !{i32 786473, metadata !2037}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!2039 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2040, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!2040 = metadata !{null, metadata !2041}
!2041 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!2042 = metadata !{metadata !2043}
!2043 = metadata !{i32 786689, metadata !2036, metadata !"z", metadata !2038, i32 16777228, metadata !2041, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!2044 = metadata !{i32 786449, metadata !2045, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !2046, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_uni
!2045 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2046 = metadata !{metadata !2047}
!2047 = metadata !{i32 786478, metadata !2048, metadata !2049, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !257, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !2050, i32
!2048 = metadata !{metadata !"klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2049 = metadata !{i32 786473, metadata !2048}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c]
!2050 = metadata !{metadata !2051, metadata !2052}
!2051 = metadata !{i32 786689, metadata !2047, metadata !"name", metadata !2049, i32 16777229, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!2052 = metadata !{i32 786688, metadata !2047, metadata !"x", metadata !2049, i32 14, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!2053 = metadata !{i32 786449, metadata !2054, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !2055, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_uni
!2054 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2055 = metadata !{metadata !2056}
!2056 = metadata !{i32 786478, metadata !2057, metadata !2058, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !2059, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overs
!2057 = metadata !{metadata !"klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2058 = metadata !{i32 786473, metadata !2057}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!2059 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2060, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!2060 = metadata !{null, metadata !1722, metadata !1722}
!2061 = metadata !{metadata !2062, metadata !2063}
!2062 = metadata !{i32 786689, metadata !2056, metadata !"bitWidth", metadata !2058, i32 16777236, metadata !1722, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!2063 = metadata !{i32 786689, metadata !2056, metadata !"shift", metadata !2058, i32 33554452, metadata !1722, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!2064 = metadata !{i32 786449, metadata !2065, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !2066, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_uni
!2065 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2066 = metadata !{metadata !2067}
!2067 = metadata !{i32 786478, metadata !2068, metadata !2069, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !2070, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, me
!2068 = metadata !{metadata !"klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2069 = metadata !{i32 786473, metadata !2068}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!2070 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2071, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!2071 = metadata !{metadata !30, metadata !30, metadata !30, metadata !31}
!2072 = metadata !{metadata !2073, metadata !2074, metadata !2075, metadata !2076}
!2073 = metadata !{i32 786689, metadata !2067, metadata !"start", metadata !2069, i32 16777229, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!2074 = metadata !{i32 786689, metadata !2067, metadata !"end", metadata !2069, i32 33554445, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!2075 = metadata !{i32 786689, metadata !2067, metadata !"name", metadata !2069, i32 50331661, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!2076 = metadata !{i32 786688, metadata !2067, metadata !"x", metadata !2069, i32 14, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!2077 = metadata !{i32 786449, metadata !2078, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !2079, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_uni
!2078 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2079 = metadata !{metadata !2080}
!2080 = metadata !{i32 786478, metadata !2081, metadata !2082, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !2083, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !2086
!2081 = metadata !{metadata !"memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2082 = metadata !{i32 786473, metadata !2081}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c]
!2083 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2084, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!2084 = metadata !{metadata !173, metadata !173, metadata !186, metadata !2085}
!2085 = metadata !{i32 786454, metadata !2081, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!2086 = metadata !{metadata !2087, metadata !2088, metadata !2089, metadata !2090, metadata !2091}
!2087 = metadata !{i32 786689, metadata !2080, metadata !"destaddr", metadata !2082, i32 16777228, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!2088 = metadata !{i32 786689, metadata !2080, metadata !"srcaddr", metadata !2082, i32 33554444, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!2089 = metadata !{i32 786689, metadata !2080, metadata !"len", metadata !2082, i32 50331660, metadata !2085, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!2090 = metadata !{i32 786688, metadata !2080, metadata !"dest", metadata !2082, i32 13, metadata !45, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!2091 = metadata !{i32 786688, metadata !2080, metadata !"src", metadata !2082, i32 14, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!2092 = metadata !{i32 786449, metadata !2093, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !2094, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_uni
!2093 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2094 = metadata !{metadata !2095}
!2095 = metadata !{i32 786478, metadata !2096, metadata !2097, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !2098, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !2
!2096 = metadata !{metadata !"memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2097 = metadata !{i32 786473, metadata !2096}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!2098 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2099, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!2099 = metadata !{metadata !173, metadata !173, metadata !186, metadata !2100}
!2100 = metadata !{i32 786454, metadata !2096, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!2101 = metadata !{metadata !2102, metadata !2103, metadata !2104, metadata !2105, metadata !2106}
!2102 = metadata !{i32 786689, metadata !2095, metadata !"dst", metadata !2097, i32 16777228, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!2103 = metadata !{i32 786689, metadata !2095, metadata !"src", metadata !2097, i32 33554444, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!2104 = metadata !{i32 786689, metadata !2095, metadata !"count", metadata !2097, i32 50331660, metadata !2100, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!2105 = metadata !{i32 786688, metadata !2095, metadata !"a", metadata !2097, i32 13, metadata !45, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!2106 = metadata !{i32 786688, metadata !2095, metadata !"b", metadata !2097, i32 14, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!2107 = metadata !{i32 786449, metadata !2108, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !2109, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_uni
!2108 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2109 = metadata !{metadata !2110}
!2110 = metadata !{i32 786478, metadata !2111, metadata !2112, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !2113, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !2
!2111 = metadata !{metadata !"mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2112 = metadata !{i32 786473, metadata !2111}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c]
!2113 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2114, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!2114 = metadata !{metadata !173, metadata !173, metadata !186, metadata !2115}
!2115 = metadata !{i32 786454, metadata !2111, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!2116 = metadata !{metadata !2117, metadata !2118, metadata !2119, metadata !2120, metadata !2121}
!2117 = metadata !{i32 786689, metadata !2110, metadata !"destaddr", metadata !2112, i32 16777227, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!2118 = metadata !{i32 786689, metadata !2110, metadata !"srcaddr", metadata !2112, i32 33554443, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!2119 = metadata !{i32 786689, metadata !2110, metadata !"len", metadata !2112, i32 50331659, metadata !2115, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!2120 = metadata !{i32 786688, metadata !2110, metadata !"dest", metadata !2112, i32 12, metadata !45, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!2121 = metadata !{i32 786688, metadata !2110, metadata !"src", metadata !2112, i32 13, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!2122 = metadata !{i32 786449, metadata !2123, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !23, metadata !23, metadata !2124, metadata !23, metadata !23, metadata !""} ; [ DW_TAG_compile_uni
!2123 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2124 = metadata !{metadata !2125}
!2125 = metadata !{i32 786478, metadata !2126, metadata !2127, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !2128, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !2131
!2126 = metadata !{metadata !"memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2127 = metadata !{i32 786473, metadata !2126}    ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c]
!2128 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !2129, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!2129 = metadata !{metadata !173, metadata !173, metadata !30, metadata !2130}
!2130 = metadata !{i32 786454, metadata !2126, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!2131 = metadata !{metadata !2132, metadata !2133, metadata !2134, metadata !2135}
!2132 = metadata !{i32 786689, metadata !2125, metadata !"dst", metadata !2127, i32 16777227, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!2133 = metadata !{i32 786689, metadata !2125, metadata !"s", metadata !2127, i32 33554443, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!2134 = metadata !{i32 786689, metadata !2125, metadata !"count", metadata !2127, i32 50331659, metadata !2130, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!2135 = metadata !{i32 786688, metadata !2125, metadata !"a", metadata !2127, i32 12, metadata !2136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!2136 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !2137} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!2137 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!2138 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!2139 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!2140 = metadata !{i32 40, i32 0, metadata !667, metadata !2141}
!2141 = metadata !{i32 74, i32 0, metadata !25, null}
!2142 = metadata !{metadata !2143, metadata !2143, i64 0}
!2143 = metadata !{metadata !"omnipotent char", metadata !2144, i64 0}
!2144 = metadata !{metadata !"Simple C/C++ TBAA"}
!2145 = metadata !{i32 43, i32 0, metadata !2146, metadata !2141}
!2146 = metadata !{i32 786443, metadata !26, metadata !667, i32 43, i32 0, i32 379} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2147 = metadata !{i32 46, i32 0, metadata !678, metadata !2141}
!2148 = metadata !{metadata !2149, metadata !2150, i64 0}
!2149 = metadata !{metadata !"", metadata !2150, i64 0, metadata !2151, i64 8, metadata !2151, i64 16, metadata !2150, i64 24, metadata !2151, i64 32, metadata !2150, i64 40, metadata !2151, i64 48, metadata !2151, i64 56, metadata !2151, i64 64, metadat
!2150 = metadata !{metadata !"int", metadata !2143, i64 0}
!2151 = metadata !{metadata !"any pointer", metadata !2143, i64 0}
!2152 = metadata !{i32 47, i32 0, metadata !676, metadata !2141}
!2153 = metadata !{i32 48, i32 0, metadata !675, metadata !2141}
!2154 = metadata !{metadata !2149, metadata !2151, i64 32}
!2155 = metadata !{i32 49, i32 0, metadata !2156, metadata !2141}
!2156 = metadata !{i32 786443, metadata !26, metadata !675, i32 49, i32 0, i32 384} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2157 = metadata !{metadata !2158, metadata !2151, i64 16}
!2158 = metadata !{metadata !"", metadata !2150, i64 0, metadata !2151, i64 8, metadata !2151, i64 16}
!2159 = metadata !{metadata !2160, metadata !2161, i64 8}
!2160 = metadata !{metadata !"stat64", metadata !2161, i64 0, metadata !2161, i64 8, metadata !2161, i64 16, metadata !2150, i64 24, metadata !2150, i64 28, metadata !2150, i64 32, metadata !2150, i64 36, metadata !2161, i64 40, metadata !2161, i64 48, m
!2161 = metadata !{metadata !"long", metadata !2143, i64 0}
!2162 = metadata !{metadata !"timespec", metadata !2161, i64 0, metadata !2161, i64 8}
!2163 = metadata !{i32 76, i32 0, metadata !89, null}
!2164 = metadata !{i32 1417, i32 0, metadata !633, metadata !2165}
!2165 = metadata !{i32 1429, i32 0, metadata !614, metadata !2166}
!2166 = metadata !{i32 81, i32 0, metadata !88, null}
!2167 = metadata !{i32 1418, i32 0, metadata !633, metadata !2165}
!2168 = metadata !{i32 1432, i32 0, metadata !623, metadata !2166}
!2169 = metadata !{i32 1433, i32 0, metadata !622, metadata !2166}
!2170 = metadata !{i32 1434, i32 0, metadata !626, metadata !2166}
!2171 = metadata !{i32 1435, i32 0, metadata !2172, metadata !2166}
!2172 = metadata !{i32 786443, metadata !26, metadata !2173, i32 1435, i32 0, i32 362} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2173 = metadata !{i32 786443, metadata !26, metadata !626, i32 1434, i32 0, i32 361} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2174 = metadata !{i32 1436, i32 0, metadata !2175, metadata !2166}
!2175 = metadata !{i32 786443, metadata !26, metadata !2172, i32 1435, i32 0, i32 363} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2176 = metadata !{i32 1437, i32 0, metadata !2175, metadata !2166}
!2177 = metadata !{i32 1439, i32 0, metadata !2178, metadata !2166}
!2178 = metadata !{i32 786443, metadata !26, metadata !2179, i32 1438, i32 0, i32 365} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2179 = metadata !{i32 786443, metadata !26, metadata !2172, i32 1438, i32 0, i32 364} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2180 = metadata !{i32 1440, i32 0, metadata !2178, metadata !2166}
!2181 = metadata !{i32 1442, i32 0, metadata !625, metadata !2166}
!2182 = metadata !{i32 1443, i32 0, metadata !625, metadata !2166}
!2183 = metadata !{i32 1444, i32 0, metadata !625, metadata !2166}
!2184 = metadata !{i32 1445, i32 0, metadata !2185, metadata !2166}
!2185 = metadata !{i32 786443, metadata !26, metadata !625, i32 1445, i32 0, i32 367} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2186 = metadata !{i32 82, i32 0, metadata !2187, null}
!2187 = metadata !{i32 786443, metadata !26, metadata !88, i32 82, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2188 = metadata !{i32 83, i32 0, metadata !2187, null}
!2189 = metadata !{metadata !2150, metadata !2150, i64 0}
!2190 = metadata !{i32 86, i32 0, metadata !25, null}
!2191 = metadata !{i32 89, i32 0, metadata !90, null}
!2192 = metadata !{metadata !2193, metadata !2150, i64 768}
!2193 = metadata !{metadata !"", metadata !2143, i64 0, metadata !2150, i64 768, metadata !2150, i64 772, metadata !2150, i64 776}
!2194 = metadata !{i32 90, i32 0, metadata !90, null}
!2195 = metadata !{i32 91, i32 0, metadata !90, null}
!2196 = metadata !{i32 133, i32 0, metadata !2197, null}
!2197 = metadata !{i32 786443, metadata !26, metadata !97, i32 133, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2198 = metadata !{i32 134, i32 0, metadata !2199, null}
!2199 = metadata !{i32 786443, metadata !26, metadata !2197, i32 134, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2200 = metadata !{metadata !2201, metadata !2150, i64 4}
!2201 = metadata !{metadata !"", metadata !2150, i64 0, metadata !2150, i64 4, metadata !2161, i64 8, metadata !2151, i64 16}
!2202 = metadata !{i32 136, i32 0, metadata !2203, null}
!2203 = metadata !{i32 786443, metadata !26, metadata !97, i32 136, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2204 = metadata !{i32 137, i32 0, metadata !2205, null}
!2205 = metadata !{i32 786443, metadata !26, metadata !2203, i32 136, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2206 = metadata !{i32 138, i32 0, metadata !2205, null}
!2207 = metadata !{i32 141, i32 0, metadata !97, null}
!2208 = metadata !{i32 144, i32 0, metadata !97, null}
!2209 = metadata !{i32 40, i32 0, metadata !667, metadata !2210}
!2210 = metadata !{i32 146, i32 0, metadata !97, null}
!2211 = metadata !{i32 43, i32 0, metadata !2146, metadata !2210}
!2212 = metadata !{i32 46, i32 0, metadata !678, metadata !2210}
!2213 = metadata !{i32 47, i32 0, metadata !676, metadata !2210}
!2214 = metadata !{i32 48, i32 0, metadata !675, metadata !2210}
!2215 = metadata !{i32 49, i32 0, metadata !2156, metadata !2210}
!2216 = metadata !{i32 147, i32 0, metadata !119, null}
!2217 = metadata !{i32 150, i32 0, metadata !2218, null}
!2218 = metadata !{i32 786443, metadata !26, metadata !119, i32 147, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2219 = metadata !{metadata !2201, metadata !2151, i64 16}
!2220 = metadata !{i32 152, i32 0, metadata !2221, null}
!2221 = metadata !{i32 786443, metadata !26, metadata !2218, i32 152, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2222 = metadata !{i32 153, i32 0, metadata !2223, null}
!2223 = metadata !{i32 786443, metadata !26, metadata !2221, i32 152, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2224 = metadata !{i32 154, i32 0, metadata !2223, null}
!2225 = metadata !{i32 168, i32 0, metadata !2226, null}
!2226 = metadata !{i32 786443, metadata !26, metadata !2227, i32 165, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2227 = metadata !{i32 786443, metadata !26, metadata !2218, i32 165, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2228 = metadata !{i32 169, i32 0, metadata !2226, null}
!2229 = metadata !{i32 170, i32 0, metadata !2226, null}
!2230 = metadata !{i32 99, i32 0, metadata !660, metadata !2231}
!2231 = metadata !{i32 173, i32 0, metadata !2232, null}
!2232 = metadata !{i32 786443, metadata !26, metadata !2218, i32 173, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2233 = metadata !{metadata !2160, metadata !2150, i64 24}
!2234 = metadata !{i32 101, i32 0, metadata !2235, metadata !2231}
!2235 = metadata !{i32 786443, metadata !26, metadata !660, i32 101, i32 0, i32 375} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2236 = metadata !{i32 118, i32 0, metadata !2237, metadata !2231}
!2237 = metadata !{i32 786443, metadata !26, metadata !660, i32 118, i32 0, i32 377} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2238 = metadata !{i32 105, i32 0, metadata !2239, metadata !2231}
!2239 = metadata !{i32 786443, metadata !26, metadata !660, i32 105, i32 0, i32 376} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2240 = metadata !{i32 121, i32 0, metadata !2241, metadata !2231}
!2241 = metadata !{i32 786443, metadata !26, metadata !660, i32 121, i32 0, i32 378} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2242 = metadata !{i32 174, i32 0, metadata !2243, null}
!2243 = metadata !{i32 786443, metadata !26, metadata !2232, i32 173, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2244 = metadata !{i32 175, i32 0, metadata !2243, null}
!2245 = metadata !{i32 178, i32 0, metadata !2232, null}
!2246 = metadata !{i32 180, i32 0, metadata !2218, null}
!2247 = metadata !{i32 1417, i32 0, metadata !633, metadata !2248}
!2248 = metadata !{i32 1429, i32 0, metadata !614, metadata !2249}
!2249 = metadata !{i32 181, i32 0, metadata !118, null}
!2250 = metadata !{i32 1418, i32 0, metadata !633, metadata !2248}
!2251 = metadata !{i32 1432, i32 0, metadata !623, metadata !2249}
!2252 = metadata !{i32 1433, i32 0, metadata !622, metadata !2249}
!2253 = metadata !{i32 1434, i32 0, metadata !626, metadata !2249}
!2254 = metadata !{i32 1435, i32 0, metadata !2172, metadata !2249}
!2255 = metadata !{i32 1436, i32 0, metadata !2175, metadata !2249}
!2256 = metadata !{i32 1437, i32 0, metadata !2175, metadata !2249}
!2257 = metadata !{i32 1439, i32 0, metadata !2178, metadata !2249}
!2258 = metadata !{i32 1440, i32 0, metadata !2178, metadata !2249}
!2259 = metadata !{i32 1442, i32 0, metadata !625, metadata !2249}
!2260 = metadata !{i32 1443, i32 0, metadata !625, metadata !2249}
!2261 = metadata !{i32 1444, i32 0, metadata !625, metadata !2249}
!2262 = metadata !{i32 1445, i32 0, metadata !2185, metadata !2249}
!2263 = metadata !{i32 182, i32 0, metadata !2264, null}
!2264 = metadata !{i32 786443, metadata !26, metadata !118, i32 182, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2265 = metadata !{i32 183, i32 0, metadata !2266, null}
!2266 = metadata !{i32 786443, metadata !26, metadata !2264, i32 182, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2267 = metadata !{i32 184, i32 0, metadata !2266, null}
!2268 = metadata !{i32 186, i32 0, metadata !118, null}
!2269 = metadata !{metadata !2201, metadata !2150, i64 0}
!2270 = metadata !{i32 190, i32 0, metadata !2271, null}
!2271 = metadata !{i32 786443, metadata !26, metadata !97, i32 190, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2272 = metadata !{i32 189, i32 0, metadata !97, null}
!2273 = metadata !{i32 191, i32 0, metadata !2274, null}
!2274 = metadata !{i32 786443, metadata !26, metadata !2271, i32 190, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2275 = metadata !{i32 192, i32 0, metadata !2274, null}
!2276 = metadata !{i32 193, i32 0, metadata !2277, null}
!2277 = metadata !{i32 786443, metadata !26, metadata !2278, i32 192, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2278 = metadata !{i32 786443, metadata !26, metadata !2271, i32 192, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2279 = metadata !{i32 194, i32 0, metadata !2277, null}
!2280 = metadata !{i32 195, i32 0, metadata !2281, null}
!2281 = metadata !{i32 786443, metadata !26, metadata !2278, i32 194, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2282 = metadata !{i32 199, i32 0, metadata !97, null}
!2283 = metadata !{i32 204, i32 0, metadata !132, null}
!2284 = metadata !{i32 64, i32 0, metadata !659, metadata !2285}
!2285 = metadata !{i32 205, i32 0, metadata !131, null}
!2286 = metadata !{i32 65, i32 0, metadata !658, metadata !2285}
!2287 = metadata !{i32 66, i32 0, metadata !2288, metadata !2285}
!2288 = metadata !{i32 786443, metadata !26, metadata !658, i32 66, i32 0, i32 374} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2289 = metadata !{i32 207, i32 0, metadata !2290, null}
!2290 = metadata !{i32 786443, metadata !26, metadata !131, i32 207, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2291 = metadata !{i32 208, i32 0, metadata !2292, null}
!2292 = metadata !{i32 786443, metadata !26, metadata !2290, i32 207, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2293 = metadata !{i32 209, i32 0, metadata !2292, null}
!2294 = metadata !{i32 210, i32 0, metadata !2295, null}
!2295 = metadata !{i32 786443, metadata !26, metadata !2290, i32 210, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2296 = metadata !{i32 211, i32 0, metadata !2297, null}
!2297 = metadata !{i32 786443, metadata !26, metadata !2295, i32 210, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2298 = metadata !{i32 212, i32 0, metadata !2297, null}
!2299 = metadata !{i32 213, i32 0, metadata !2297, null}
!2300 = metadata !{i32 215, i32 0, metadata !131, null}
!2301 = metadata !{i32 216, i32 0, metadata !131, null}
!2302 = metadata !{i32 40, i32 0, metadata !667, metadata !2303}
!2303 = metadata !{i32 218, i32 0, metadata !2304, null}
!2304 = metadata !{i32 786443, metadata !26, metadata !120, i32 218, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2305 = metadata !{i32 43, i32 0, metadata !2146, metadata !2303}
!2306 = metadata !{i32 46, i32 0, metadata !678, metadata !2303}
!2307 = metadata !{i32 47, i32 0, metadata !676, metadata !2303}
!2308 = metadata !{i32 48, i32 0, metadata !675, metadata !2303}
!2309 = metadata !{i32 49, i32 0, metadata !2156, metadata !2303}
!2310 = metadata !{i32 220, i32 0, metadata !2311, null}
!2311 = metadata !{i32 786443, metadata !26, metadata !2304, i32 218, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2312 = metadata !{i32 223, i32 0, metadata !2313, null}
!2313 = metadata !{i32 786443, metadata !26, metadata !120, i32 223, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2314 = metadata !{i32 224, i32 0, metadata !2315, null}
!2315 = metadata !{i32 786443, metadata !26, metadata !2313, i32 224, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2316 = metadata !{i32 226, i32 0, metadata !2317, null}
!2317 = metadata !{i32 786443, metadata !26, metadata !120, i32 226, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2318 = metadata !{i32 227, i32 0, metadata !2319, null}
!2319 = metadata !{i32 786443, metadata !26, metadata !2317, i32 226, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2320 = metadata !{i32 228, i32 0, metadata !2319, null}
!2321 = metadata !{i32 231, i32 0, metadata !120, null}
!2322 = metadata !{i32 234, i32 0, metadata !120, null}
!2323 = metadata !{i32 1417, i32 0, metadata !633, metadata !2324}
!2324 = metadata !{i32 1429, i32 0, metadata !614, metadata !2325}
!2325 = metadata !{i32 236, i32 0, metadata !120, null}
!2326 = metadata !{i32 1418, i32 0, metadata !633, metadata !2324}
!2327 = metadata !{i32 1432, i32 0, metadata !623, metadata !2325}
!2328 = metadata !{i32 1433, i32 0, metadata !622, metadata !2325}
!2329 = metadata !{i32 1434, i32 0, metadata !626, metadata !2325}
!2330 = metadata !{i32 1435, i32 0, metadata !2172, metadata !2325}
!2331 = metadata !{i32 1436, i32 0, metadata !2175, metadata !2325}
!2332 = metadata !{i32 1437, i32 0, metadata !2175, metadata !2325}
!2333 = metadata !{i32 1439, i32 0, metadata !2178, metadata !2325}
!2334 = metadata !{i32 1440, i32 0, metadata !2178, metadata !2325}
!2335 = metadata !{i32 1442, i32 0, metadata !625, metadata !2325}
!2336 = metadata !{i32 1443, i32 0, metadata !625, metadata !2325}
!2337 = metadata !{i32 1444, i32 0, metadata !625, metadata !2325}
!2338 = metadata !{i32 1445, i32 0, metadata !2185, metadata !2325}
!2339 = metadata !{i32 237, i32 0, metadata !2340, null}
!2340 = metadata !{i32 786443, metadata !26, metadata !120, i32 237, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2341 = metadata !{i32 238, i32 0, metadata !2342, null}
!2342 = metadata !{i32 786443, metadata !26, metadata !2340, i32 237, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2343 = metadata !{i32 239, i32 0, metadata !2342, null}
!2344 = metadata !{i32 242, i32 0, metadata !120, null}
!2345 = metadata !{i32 243, i32 0, metadata !120, null}
!2346 = metadata !{i32 244, i32 0, metadata !2347, null}
!2347 = metadata !{i32 786443, metadata !26, metadata !120, i32 244, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2348 = metadata !{i32 245, i32 0, metadata !2349, null}
!2349 = metadata !{i32 786443, metadata !26, metadata !2347, i32 244, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2350 = metadata !{i32 246, i32 0, metadata !2349, null}
!2351 = metadata !{i32 247, i32 0, metadata !2352, null}
!2352 = metadata !{i32 786443, metadata !26, metadata !2353, i32 246, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2353 = metadata !{i32 786443, metadata !26, metadata !2347, i32 246, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2354 = metadata !{i32 248, i32 0, metadata !2352, null}
!2355 = metadata !{i32 249, i32 0, metadata !2356, null}
!2356 = metadata !{i32 786443, metadata !26, metadata !2353, i32 248, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2357 = metadata !{i32 253, i32 0, metadata !120, null}
!2358 = metadata !{i32 40, i32 0, metadata !667, metadata !2359}
!2359 = metadata !{i32 257, i32 0, metadata !134, null}
!2360 = metadata !{i32 43, i32 0, metadata !2146, metadata !2359}
!2361 = metadata !{i32 46, i32 0, metadata !678, metadata !2359}
!2362 = metadata !{i32 47, i32 0, metadata !676, metadata !2359}
!2363 = metadata !{i32 48, i32 0, metadata !675, metadata !2359}
!2364 = metadata !{i32 49, i32 0, metadata !2156, metadata !2359}
!2365 = metadata !{i32 259, i32 0, metadata !2366, null}
!2366 = metadata !{i32 786443, metadata !26, metadata !134, i32 259, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2367 = metadata !{i32 261, i32 0, metadata !2368, null}
!2368 = metadata !{i32 786443, metadata !26, metadata !2366, i32 259, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2369 = metadata !{metadata !2370, metadata !2161, i64 0}
!2370 = metadata !{metadata !"timeval", metadata !2161, i64 0, metadata !2161, i64 8}
!2371 = metadata !{metadata !2160, metadata !2161, i64 72}
!2372 = metadata !{i32 262, i32 0, metadata !2368, null}
!2373 = metadata !{metadata !2160, metadata !2161, i64 88}
!2374 = metadata !{i32 267, i32 0, metadata !2368, null}
!2375 = metadata !{i32 1417, i32 0, metadata !633, metadata !2376}
!2376 = metadata !{i32 1429, i32 0, metadata !614, metadata !2377}
!2377 = metadata !{i32 269, i32 0, metadata !134, null}
!2378 = metadata !{i32 1418, i32 0, metadata !633, metadata !2376}
!2379 = metadata !{i32 1432, i32 0, metadata !623, metadata !2377}
!2380 = metadata !{i32 1433, i32 0, metadata !622, metadata !2377}
!2381 = metadata !{i32 1434, i32 0, metadata !626, metadata !2377}
!2382 = metadata !{i32 1435, i32 0, metadata !2172, metadata !2377}
!2383 = metadata !{i32 1436, i32 0, metadata !2175, metadata !2377}
!2384 = metadata !{i32 1437, i32 0, metadata !2175, metadata !2377}
!2385 = metadata !{i32 1439, i32 0, metadata !2178, metadata !2377}
!2386 = metadata !{i32 1440, i32 0, metadata !2178, metadata !2377}
!2387 = metadata !{i32 1442, i32 0, metadata !625, metadata !2377}
!2388 = metadata !{i32 1443, i32 0, metadata !625, metadata !2377}
!2389 = metadata !{i32 1444, i32 0, metadata !625, metadata !2377}
!2390 = metadata !{i32 1445, i32 0, metadata !2185, metadata !2377}
!2391 = metadata !{i32 270, i32 0, metadata !2392, null}
!2392 = metadata !{i32 786443, metadata !26, metadata !134, i32 270, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2393 = metadata !{i32 271, i32 0, metadata !2392, null}
!2394 = metadata !{i32 274, i32 0, metadata !134, null}
!2395 = metadata !{i32 278, i32 0, metadata !159, null}
!2396 = metadata !{i32 64, i32 0, metadata !659, metadata !2397}
!2397 = metadata !{i32 279, i32 0, metadata !158, null}
!2398 = metadata !{i32 65, i32 0, metadata !658, metadata !2397}
!2399 = metadata !{i32 66, i32 0, metadata !2288, metadata !2397}
!2400 = metadata !{i32 281, i32 0, metadata !2401, null}
!2401 = metadata !{i32 786443, metadata !26, metadata !158, i32 281, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2402 = metadata !{i32 282, i32 0, metadata !2403, null}
!2403 = metadata !{i32 786443, metadata !26, metadata !2401, i32 281, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2404 = metadata !{i32 283, i32 0, metadata !2403, null}
!2405 = metadata !{i32 284, i32 0, metadata !2406, null}
!2406 = metadata !{i32 786443, metadata !26, metadata !2401, i32 284, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2407 = metadata !{i32 285, i32 0, metadata !2408, null}
!2408 = metadata !{i32 786443, metadata !26, metadata !2406, i32 284, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2409 = metadata !{i32 286, i32 0, metadata !2408, null}
!2410 = metadata !{i32 287, i32 0, metadata !2408, null}
!2411 = metadata !{i32 289, i32 0, metadata !158, null}
!2412 = metadata !{i32 290, i32 0, metadata !158, null}
!2413 = metadata !{i32 40, i32 0, metadata !667, metadata !2414}
!2414 = metadata !{i32 291, i32 0, metadata !2415, null}
!2415 = metadata !{i32 786443, metadata !26, metadata !150, i32 291, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2416 = metadata !{i32 43, i32 0, metadata !2146, metadata !2414}
!2417 = metadata !{i32 46, i32 0, metadata !678, metadata !2414}
!2418 = metadata !{i32 47, i32 0, metadata !676, metadata !2414}
!2419 = metadata !{i32 48, i32 0, metadata !675, metadata !2414}
!2420 = metadata !{i32 49, i32 0, metadata !2156, metadata !2414}
!2421 = metadata !{i32 292, i32 0, metadata !2422, null}
!2422 = metadata !{i32 786443, metadata !26, metadata !2415, i32 291, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2423 = metadata !{i32 295, i32 0, metadata !150, null}
!2424 = metadata !{i32 1417, i32 0, metadata !633, metadata !2425}
!2425 = metadata !{i32 1429, i32 0, metadata !614, metadata !2426}
!2426 = metadata !{i32 296, i32 0, metadata !150, null}
!2427 = metadata !{i32 1418, i32 0, metadata !633, metadata !2425}
!2428 = metadata !{i32 1432, i32 0, metadata !623, metadata !2426}
!2429 = metadata !{i32 1433, i32 0, metadata !622, metadata !2426}
!2430 = metadata !{i32 1434, i32 0, metadata !626, metadata !2426}
!2431 = metadata !{i32 1435, i32 0, metadata !2172, metadata !2426}
!2432 = metadata !{i32 1436, i32 0, metadata !2175, metadata !2426}
!2433 = metadata !{i32 1437, i32 0, metadata !2175, metadata !2426}
!2434 = metadata !{i32 1439, i32 0, metadata !2178, metadata !2426}
!2435 = metadata !{i32 1440, i32 0, metadata !2178, metadata !2426}
!2436 = metadata !{i32 1442, i32 0, metadata !625, metadata !2426}
!2437 = metadata !{i32 1443, i32 0, metadata !625, metadata !2426}
!2438 = metadata !{i32 1444, i32 0, metadata !625, metadata !2426}
!2439 = metadata !{i32 1445, i32 0, metadata !2185, metadata !2426}
!2440 = metadata !{i32 298, i32 0, metadata !2441, null}
!2441 = metadata !{i32 786443, metadata !26, metadata !150, i32 298, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2442 = metadata !{i32 299, i32 0, metadata !2441, null}
!2443 = metadata !{i32 301, i32 0, metadata !150, null}
!2444 = metadata !{i32 308, i32 0, metadata !161, null}
!2445 = metadata !{i32 64, i32 0, metadata !659, metadata !2446}
!2446 = metadata !{i32 310, i32 0, metadata !161, null}
!2447 = metadata !{i32 65, i32 0, metadata !658, metadata !2446}
!2448 = metadata !{i32 66, i32 0, metadata !2288, metadata !2446}
!2449 = metadata !{i32 311, i32 0, metadata !2450, null}
!2450 = metadata !{i32 786443, metadata !26, metadata !161, i32 311, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2451 = metadata !{i32 312, i32 0, metadata !2452, null}
!2452 = metadata !{i32 786443, metadata !26, metadata !2450, i32 311, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2453 = metadata !{i32 313, i32 0, metadata !2452, null}
!2454 = metadata !{i32 316, i32 0, metadata !2455, null}
!2455 = metadata !{i32 786443, metadata !26, metadata !161, i32 316, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2456 = metadata !{metadata !2149, metadata !2150, i64 40}
!2457 = metadata !{metadata !2149, metadata !2151, i64 64}
!2458 = metadata !{i32 317, i32 0, metadata !2459, null}
!2459 = metadata !{i32 786443, metadata !26, metadata !2455, i32 316, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2460 = metadata !{i32 318, i32 0, metadata !2459, null}
!2461 = metadata !{i32 319, i32 0, metadata !2459, null}
!2462 = metadata !{i32 330, i32 0, metadata !161, null}
!2463 = metadata !{i32 332, i32 0, metadata !161, null}
!2464 = metadata !{i32 333, i32 0, metadata !161, null}
!2465 = metadata !{i32 339, i32 0, metadata !168, null}
!2466 = metadata !{i32 341, i32 0, metadata !2467, null}
!2467 = metadata !{i32 786443, metadata !26, metadata !168, i32 341, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2468 = metadata !{i32 344, i32 0, metadata !2469, null}
!2469 = metadata !{i32 786443, metadata !26, metadata !168, i32 344, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2470 = metadata !{i32 345, i32 0, metadata !2471, null}
!2471 = metadata !{i32 786443, metadata !26, metadata !2469, i32 344, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2472 = metadata !{i32 346, i32 0, metadata !2471, null}
!2473 = metadata !{i32 64, i32 0, metadata !659, metadata !2474}
!2474 = metadata !{i32 349, i32 0, metadata !168, null}
!2475 = metadata !{i32 65, i32 0, metadata !658, metadata !2474}
!2476 = metadata !{i32 66, i32 0, metadata !2288, metadata !2474}
!2477 = metadata !{i32 351, i32 0, metadata !2478, null}
!2478 = metadata !{i32 786443, metadata !26, metadata !168, i32 351, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2479 = metadata !{i32 352, i32 0, metadata !2480, null}
!2480 = metadata !{i32 786443, metadata !26, metadata !2478, i32 351, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2481 = metadata !{i32 353, i32 0, metadata !2480, null}
!2482 = metadata !{i32 356, i32 0, metadata !2483, null}
!2483 = metadata !{i32 786443, metadata !26, metadata !168, i32 356, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2484 = metadata !{metadata !2149, metadata !2151, i64 48}
!2485 = metadata !{i32 357, i32 0, metadata !2486, null}
!2486 = metadata !{i32 786443, metadata !26, metadata !2483, i32 356, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2487 = metadata !{i32 358, i32 0, metadata !2486, null}
!2488 = metadata !{i32 359, i32 0, metadata !2486, null}
!2489 = metadata !{i32 362, i32 0, metadata !182, null}
!2490 = metadata !{i32 1417, i32 0, metadata !633, metadata !2491}
!2491 = metadata !{i32 365, i32 0, metadata !181, null}
!2492 = metadata !{i32 1418, i32 0, metadata !633, metadata !2491}
!2493 = metadata !{i32 1423, i32 0, metadata !627, metadata !2494}
!2494 = metadata !{i32 366, i32 0, metadata !181, null}
!2495 = metadata !{i32 1424, i32 0, metadata !627, metadata !2494}
!2496 = metadata !{i32 370, i32 0, metadata !181, null}
!2497 = metadata !{i32 371, i32 0, metadata !2498, null}
!2498 = metadata !{i32 786443, metadata !26, metadata !181, i32 371, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2499 = metadata !{i32 372, i32 0, metadata !2498, null}
!2500 = metadata !{i32 374, i32 0, metadata !2498, null}
!2501 = metadata !{metadata !2201, metadata !2161, i64 8}
!2502 = metadata !{i32 376, i32 0, metadata !2503, null}
!2503 = metadata !{i32 786443, metadata !26, metadata !181, i32 376, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2504 = metadata !{i32 377, i32 0, metadata !2505, null}
!2505 = metadata !{i32 786443, metadata !26, metadata !2503, i32 376, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2506 = metadata !{i32 378, i32 0, metadata !2505, null}
!2507 = metadata !{i32 381, i32 0, metadata !2508, null}
!2508 = metadata !{i32 786443, metadata !26, metadata !181, i32 381, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2509 = metadata !{i32 383, i32 0, metadata !181, null}
!2510 = metadata !{i32 382, i32 0, metadata !2508, null}
!2511 = metadata !{i32 386, i32 0, metadata !2512, null}
!2512 = metadata !{i32 786443, metadata !26, metadata !182, i32 385, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2513 = metadata !{i32 387, i32 0, metadata !2514, null}
!2514 = metadata !{i32 786443, metadata !26, metadata !2512, i32 387, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2515 = metadata !{metadata !2158, metadata !2150, i64 0}
!2516 = metadata !{i32 391, i32 0, metadata !2517, null}
!2517 = metadata !{i32 786443, metadata !26, metadata !2512, i32 391, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2518 = metadata !{i32 392, i32 0, metadata !2519, null}
!2519 = metadata !{i32 786443, metadata !26, metadata !2517, i32 391, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2520 = metadata !{i32 395, i32 0, metadata !2512, null}
!2521 = metadata !{metadata !2158, metadata !2151, i64 8}
!2522 = metadata !{i32 396, i32 0, metadata !2512, null}
!2523 = metadata !{i32 398, i32 0, metadata !2512, null}
!2524 = metadata !{i32 400, i32 0, metadata !168, null}
!2525 = metadata !{i32 407, i32 0, metadata !183, null}
!2526 = metadata !{i32 64, i32 0, metadata !659, metadata !2527}
!2527 = metadata !{i32 409, i32 0, metadata !183, null}
!2528 = metadata !{i32 65, i32 0, metadata !658, metadata !2527}
!2529 = metadata !{i32 66, i32 0, metadata !2288, metadata !2527}
!2530 = metadata !{i32 411, i32 0, metadata !2531, null}
!2531 = metadata !{i32 786443, metadata !26, metadata !183, i32 411, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2532 = metadata !{i32 412, i32 0, metadata !2533, null}
!2533 = metadata !{i32 786443, metadata !26, metadata !2531, i32 411, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2534 = metadata !{i32 413, i32 0, metadata !2533, null}
!2535 = metadata !{i32 416, i32 0, metadata !2536, null}
!2536 = metadata !{i32 786443, metadata !26, metadata !183, i32 416, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2537 = metadata !{metadata !2149, metadata !2151, i64 56}
!2538 = metadata !{i32 417, i32 0, metadata !2539, null}
!2539 = metadata !{i32 786443, metadata !26, metadata !2536, i32 416, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2540 = metadata !{i32 418, i32 0, metadata !2539, null}
!2541 = metadata !{i32 419, i32 0, metadata !2539, null}
!2542 = metadata !{i32 422, i32 0, metadata !195, null}
!2543 = metadata !{i32 1417, i32 0, metadata !633, metadata !2544}
!2544 = metadata !{i32 425, i32 0, metadata !194, null}
!2545 = metadata !{i32 1418, i32 0, metadata !633, metadata !2544}
!2546 = metadata !{i32 1423, i32 0, metadata !627, metadata !2547}
!2547 = metadata !{i32 426, i32 0, metadata !194, null}
!2548 = metadata !{i32 1424, i32 0, metadata !627, metadata !2547}
!2549 = metadata !{i32 430, i32 0, metadata !194, null}
!2550 = metadata !{i32 431, i32 0, metadata !2551, null}
!2551 = metadata !{i32 786443, metadata !26, metadata !194, i32 431, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2552 = metadata !{i32 432, i32 0, metadata !2551, null}
!2553 = metadata !{i32 433, i32 0, metadata !2551, null}
!2554 = metadata !{i32 435, i32 0, metadata !2555, null}
!2555 = metadata !{i32 786443, metadata !26, metadata !194, i32 435, i32 0, i32 85} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2556 = metadata !{i32 436, i32 0, metadata !2557, null}
!2557 = metadata !{i32 786443, metadata !26, metadata !2555, i32 435, i32 0, i32 86} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2558 = metadata !{i32 437, i32 0, metadata !2557, null}
!2559 = metadata !{i32 440, i32 0, metadata !194, null}
!2560 = metadata !{i32 441, i32 0, metadata !2561, null}
!2561 = metadata !{i32 786443, metadata !26, metadata !194, i32 441, i32 0, i32 87} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2562 = metadata !{i32 444, i32 0, metadata !194, null}
!2563 = metadata !{i32 442, i32 0, metadata !2561, null}
!2564 = metadata !{i32 449, i32 0, metadata !2565, null}
!2565 = metadata !{i32 786443, metadata !26, metadata !197, i32 449, i32 0, i32 89} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2566 = metadata !{i32 452, i32 0, metadata !2567, null}
!2567 = metadata !{i32 786443, metadata !26, metadata !2568, i32 452, i32 0, i32 91} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2568 = metadata !{i32 786443, metadata !26, metadata !2565, i32 451, i32 0, i32 90} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2569 = metadata !{metadata !2193, metadata !2150, i64 776}
!2570 = metadata !{i32 453, i32 0, metadata !2567, null}
!2571 = metadata !{i32 455, i32 0, metadata !2572, null}
!2572 = metadata !{i32 786443, metadata !26, metadata !2573, i32 455, i32 0, i32 93} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2573 = metadata !{i32 786443, metadata !26, metadata !2567, i32 454, i32 0, i32 92} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2574 = metadata !{i32 456, i32 0, metadata !2572, null}
!2575 = metadata !{i32 460, i32 0, metadata !2576, null}
!2576 = metadata !{i32 786443, metadata !26, metadata !197, i32 460, i32 0, i32 94} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2577 = metadata !{i32 461, i32 0, metadata !2576, null}
!2578 = metadata !{i32 463, i32 0, metadata !2579, null}
!2579 = metadata !{i32 786443, metadata !26, metadata !197, i32 463, i32 0, i32 95} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2580 = metadata !{i32 464, i32 0, metadata !2579, null}
!2581 = metadata !{i32 466, i32 0, metadata !2582, null}
!2582 = metadata !{i32 786443, metadata !26, metadata !197, i32 466, i32 0, i32 96} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2583 = metadata !{metadata !2149, metadata !2151, i64 16}
!2584 = metadata !{i32 467, i32 0, metadata !2582, null}
!2585 = metadata !{metadata !2149, metadata !2150, i64 24}
!2586 = metadata !{i32 469, i32 0, metadata !197, null}
!2587 = metadata !{i32 470, i32 0, metadata !197, null}
!2588 = metadata !{i32 472, i32 0, metadata !183, null}
!2589 = metadata !{i32 64, i32 0, metadata !659, metadata !2590}
!2590 = metadata !{i32 477, i32 0, metadata !198, null}
!2591 = metadata !{i32 65, i32 0, metadata !658, metadata !2590}
!2592 = metadata !{i32 66, i32 0, metadata !2288, metadata !2590}
!2593 = metadata !{i32 479, i32 0, metadata !2594, null}
!2594 = metadata !{i32 786443, metadata !26, metadata !198, i32 479, i32 0, i32 97} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2595 = metadata !{i32 480, i32 0, metadata !2596, null}
!2596 = metadata !{i32 786443, metadata !26, metadata !2594, i32 479, i32 0, i32 98} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2597 = metadata !{i32 481, i32 0, metadata !2596, null}
!2598 = metadata !{i32 484, i32 0, metadata !2599, null}
!2599 = metadata !{i32 786443, metadata !26, metadata !198, i32 484, i32 0, i32 99} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2600 = metadata !{i32 491, i32 0, metadata !2601, null}
!2601 = metadata !{i32 786443, metadata !26, metadata !2602, i32 491, i32 0, i32 101} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2602 = metadata !{i32 786443, metadata !26, metadata !2599, i32 484, i32 0, i32 100} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2603 = metadata !{i32 492, i32 0, metadata !2604, null}
!2604 = metadata !{i32 786443, metadata !26, metadata !2601, i32 491, i32 0, i32 102} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2605 = metadata !{i32 493, i32 0, metadata !2604, null}
!2606 = metadata !{i32 494, i32 0, metadata !2607, null}
!2607 = metadata !{i32 786443, metadata !26, metadata !2601, i32 493, i32 0, i32 103} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2608 = metadata !{i32 498, i32 0, metadata !2609, null}
!2609 = metadata !{i32 786443, metadata !26, metadata !2607, i32 498, i32 0, i32 104} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2610 = metadata !{i32 499, i32 0, metadata !2611, null}
!2611 = metadata !{i32 786443, metadata !26, metadata !2609, i32 498, i32 0, i32 105} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2612 = metadata !{i32 500, i32 0, metadata !2611, null}
!2613 = metadata !{i32 501, i32 0, metadata !2611, null}
!2614 = metadata !{i32 504, i32 0, metadata !2615, null}
!2615 = metadata !{i32 786443, metadata !26, metadata !2602, i32 504, i32 0, i32 106} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2616 = metadata !{i32 505, i32 0, metadata !2617, null}
!2617 = metadata !{i32 786443, metadata !26, metadata !2615, i32 504, i32 0, i32 107} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2618 = metadata !{i32 506, i32 0, metadata !2617, null}
!2619 = metadata !{i32 509, i32 0, metadata !2602, null}
!2620 = metadata !{i32 510, i32 0, metadata !2602, null}
!2621 = metadata !{i32 513, i32 0, metadata !198, null}
!2622 = metadata !{i32 515, i32 0, metadata !2623, null}
!2623 = metadata !{i32 786443, metadata !26, metadata !198, i32 513, i32 0, i32 108} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2624 = metadata !{i32 516, i32 0, metadata !2623, null}
!2625 = metadata !{i32 518, i32 0, metadata !2626, null}
!2626 = metadata !{i32 786443, metadata !26, metadata !2623, i32 517, i32 0, i32 109} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2627 = metadata !{i32 519, i32 0, metadata !2626, null}
!2628 = metadata !{i32 523, i32 0, metadata !2629, null}
!2629 = metadata !{i32 786443, metadata !26, metadata !198, i32 523, i32 0, i32 110} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2630 = metadata !{i32 524, i32 0, metadata !2631, null}
!2631 = metadata !{i32 786443, metadata !26, metadata !2629, i32 523, i32 0, i32 111} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2632 = metadata !{i32 525, i32 0, metadata !2631, null}
!2633 = metadata !{i32 528, i32 0, metadata !198, null}
!2634 = metadata !{i32 529, i32 0, metadata !198, null}
!2635 = metadata !{i32 530, i32 0, metadata !198, null}
!2636 = metadata !{i32 40, i32 0, metadata !667, metadata !2637}
!2637 = metadata !{i32 533, i32 0, metadata !207, null}
!2638 = metadata !{i32 43, i32 0, metadata !2146, metadata !2637}
!2639 = metadata !{i32 46, i32 0, metadata !678, metadata !2637}
!2640 = metadata !{i32 47, i32 0, metadata !676, metadata !2637}
!2641 = metadata !{i32 48, i32 0, metadata !675, metadata !2637}
!2642 = metadata !{i32 49, i32 0, metadata !2156, metadata !2637}
!2643 = metadata !{i32 534, i32 0, metadata !2644, null}
!2644 = metadata !{i32 786443, metadata !26, metadata !207, i32 534, i32 0, i32 112} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2645 = metadata !{i32 535, i32 0, metadata !2646, null}
!2646 = metadata !{i32 786443, metadata !26, metadata !2644, i32 534, i32 0, i32 113} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2647 = metadata !{i32 536, i32 0, metadata !2646, null}
!2648 = metadata !{i32 1417, i32 0, metadata !633, metadata !2649}
!2649 = metadata !{i32 1429, i32 0, metadata !614, metadata !2650}
!2650 = metadata !{i32 541, i32 0, metadata !215, null}
!2651 = metadata !{i32 1418, i32 0, metadata !633, metadata !2649}
!2652 = metadata !{i32 1432, i32 0, metadata !623, metadata !2650}
!2653 = metadata !{i32 1433, i32 0, metadata !622, metadata !2650}
!2654 = metadata !{i32 1434, i32 0, metadata !626, metadata !2650}
!2655 = metadata !{i32 1435, i32 0, metadata !2172, metadata !2650}
!2656 = metadata !{i32 1436, i32 0, metadata !2175, metadata !2650}
!2657 = metadata !{i32 1437, i32 0, metadata !2175, metadata !2650}
!2658 = metadata !{i32 1439, i32 0, metadata !2178, metadata !2650}
!2659 = metadata !{i32 1440, i32 0, metadata !2178, metadata !2650}
!2660 = metadata !{i32 1442, i32 0, metadata !625, metadata !2650}
!2661 = metadata !{i32 1443, i32 0, metadata !625, metadata !2650}
!2662 = metadata !{i32 1444, i32 0, metadata !625, metadata !2650}
!2663 = metadata !{i32 1445, i32 0, metadata !2185, metadata !2650}
!2664 = metadata !{i32 545, i32 0, metadata !2665, null}
!2665 = metadata !{i32 786443, metadata !26, metadata !215, i32 545, i32 0, i32 115} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2666 = metadata !{i32 546, i32 0, metadata !2665, null}
!2667 = metadata !{i32 549, i32 0, metadata !207, null}
!2668 = metadata !{i32 552, i32 0, metadata !246, null}
!2669 = metadata !{i32 64, i32 0, metadata !659, metadata !2670}
!2670 = metadata !{i32 553, i32 0, metadata !245, null}
!2671 = metadata !{i32 65, i32 0, metadata !658, metadata !2670}
!2672 = metadata !{i32 66, i32 0, metadata !2288, metadata !2670}
!2673 = metadata !{i32 555, i32 0, metadata !2674, null}
!2674 = metadata !{i32 786443, metadata !26, metadata !245, i32 555, i32 0, i32 118} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2675 = metadata !{i32 556, i32 0, metadata !2676, null}
!2676 = metadata !{i32 786443, metadata !26, metadata !2674, i32 555, i32 0, i32 119} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2677 = metadata !{i32 557, i32 0, metadata !2676, null}
!2678 = metadata !{i32 558, i32 0, metadata !2679, null}
!2679 = metadata !{i32 786443, metadata !26, metadata !2674, i32 558, i32 0, i32 120} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2680 = metadata !{i32 559, i32 0, metadata !2681, null}
!2681 = metadata !{i32 786443, metadata !26, metadata !2679, i32 558, i32 0, i32 121} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2682 = metadata !{i32 560, i32 0, metadata !2681, null}
!2683 = metadata !{i32 561, i32 0, metadata !2681, null}
!2684 = metadata !{i32 563, i32 0, metadata !245, null}
!2685 = metadata !{i32 564, i32 0, metadata !245, null}
!2686 = metadata !{i32 40, i32 0, metadata !667, metadata !2687}
!2687 = metadata !{i32 565, i32 0, metadata !216, null}
!2688 = metadata !{i32 43, i32 0, metadata !2146, metadata !2687}
!2689 = metadata !{i32 46, i32 0, metadata !678, metadata !2687}
!2690 = metadata !{i32 47, i32 0, metadata !676, metadata !2687}
!2691 = metadata !{i32 48, i32 0, metadata !675, metadata !2687}
!2692 = metadata !{i32 49, i32 0, metadata !2156, metadata !2687}
!2693 = metadata !{i32 566, i32 0, metadata !2694, null}
!2694 = metadata !{i32 786443, metadata !26, metadata !216, i32 566, i32 0, i32 122} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2695 = metadata !{i32 567, i32 0, metadata !2696, null}
!2696 = metadata !{i32 786443, metadata !26, metadata !2694, i32 566, i32 0, i32 123} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2697 = metadata !{i32 568, i32 0, metadata !2696, null}
!2698 = metadata !{i32 572, i32 0, metadata !216, null}
!2699 = metadata !{i32 1417, i32 0, metadata !633, metadata !2700}
!2700 = metadata !{i32 1429, i32 0, metadata !614, metadata !2701}
!2701 = metadata !{i32 573, i32 0, metadata !216, null}
!2702 = metadata !{i32 1418, i32 0, metadata !633, metadata !2700}
!2703 = metadata !{i32 1432, i32 0, metadata !623, metadata !2701}
!2704 = metadata !{i32 1433, i32 0, metadata !622, metadata !2701}
!2705 = metadata !{i32 1434, i32 0, metadata !626, metadata !2701}
!2706 = metadata !{i32 1435, i32 0, metadata !2172, metadata !2701}
!2707 = metadata !{i32 1436, i32 0, metadata !2175, metadata !2701}
!2708 = metadata !{i32 1437, i32 0, metadata !2175, metadata !2701}
!2709 = metadata !{i32 1439, i32 0, metadata !2178, metadata !2701}
!2710 = metadata !{i32 1440, i32 0, metadata !2178, metadata !2701}
!2711 = metadata !{i32 1442, i32 0, metadata !625, metadata !2701}
!2712 = metadata !{i32 1443, i32 0, metadata !625, metadata !2701}
!2713 = metadata !{i32 1444, i32 0, metadata !625, metadata !2701}
!2714 = metadata !{i32 1445, i32 0, metadata !2185, metadata !2701}
!2715 = metadata !{i32 581, i32 0, metadata !2716, null}
!2716 = metadata !{i32 786443, metadata !26, metadata !216, i32 581, i32 0, i32 124} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2717 = metadata !{i32 582, i32 0, metadata !2716, null}
!2718 = metadata !{i32 584, i32 0, metadata !216, null}
!2719 = metadata !{i32 40, i32 0, metadata !667, metadata !2720}
!2720 = metadata !{i32 588, i32 0, metadata !249, null}
!2721 = metadata !{i32 43, i32 0, metadata !2146, metadata !2720}
!2722 = metadata !{i32 46, i32 0, metadata !678, metadata !2720}
!2723 = metadata !{i32 47, i32 0, metadata !676, metadata !2720}
!2724 = metadata !{i32 48, i32 0, metadata !675, metadata !2720}
!2725 = metadata !{i32 49, i32 0, metadata !2156, metadata !2720}
!2726 = metadata !{i32 589, i32 0, metadata !2727, null}
!2727 = metadata !{i32 786443, metadata !26, metadata !249, i32 589, i32 0, i32 125} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2728 = metadata !{i32 590, i32 0, metadata !2729, null}
!2729 = metadata !{i32 786443, metadata !26, metadata !2727, i32 589, i32 0, i32 126} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2730 = metadata !{i32 591, i32 0, metadata !2729, null}
!2731 = metadata !{i32 1417, i32 0, metadata !633, metadata !2732}
!2732 = metadata !{i32 1429, i32 0, metadata !614, metadata !2733}
!2733 = metadata !{i32 596, i32 0, metadata !255, null}
!2734 = metadata !{i32 1418, i32 0, metadata !633, metadata !2732}
!2735 = metadata !{i32 1432, i32 0, metadata !623, metadata !2733}
!2736 = metadata !{i32 1433, i32 0, metadata !622, metadata !2733}
!2737 = metadata !{i32 1434, i32 0, metadata !626, metadata !2733}
!2738 = metadata !{i32 1435, i32 0, metadata !2172, metadata !2733}
!2739 = metadata !{i32 1436, i32 0, metadata !2175, metadata !2733}
!2740 = metadata !{i32 1437, i32 0, metadata !2175, metadata !2733}
!2741 = metadata !{i32 1439, i32 0, metadata !2178, metadata !2733}
!2742 = metadata !{i32 1440, i32 0, metadata !2178, metadata !2733}
!2743 = metadata !{i32 1442, i32 0, metadata !625, metadata !2733}
!2744 = metadata !{i32 1443, i32 0, metadata !625, metadata !2733}
!2745 = metadata !{i32 1444, i32 0, metadata !625, metadata !2733}
!2746 = metadata !{i32 1445, i32 0, metadata !2185, metadata !2733}
!2747 = metadata !{i32 600, i32 0, metadata !2748, null}
!2748 = metadata !{i32 786443, metadata !26, metadata !255, i32 600, i32 0, i32 128} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2749 = metadata !{i32 601, i32 0, metadata !2748, null}
!2750 = metadata !{i32 604, i32 0, metadata !249, null}
!2751 = metadata !{i32 40, i32 0, metadata !667, metadata !2752}
!2752 = metadata !{i32 607, i32 0, metadata !256, null}
!2753 = metadata !{i32 43, i32 0, metadata !2146, metadata !2752}
!2754 = metadata !{i32 46, i32 0, metadata !678, metadata !2752}
!2755 = metadata !{i32 47, i32 0, metadata !676, metadata !2752}
!2756 = metadata !{i32 48, i32 0, metadata !675, metadata !2752}
!2757 = metadata !{i32 49, i32 0, metadata !2156, metadata !2752}
!2758 = metadata !{i32 609, i32 0, metadata !2759, null}
!2759 = metadata !{i32 786443, metadata !26, metadata !256, i32 609, i32 0, i32 129} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2760 = metadata !{i32 611, i32 0, metadata !2761, null}
!2761 = metadata !{i32 786443, metadata !26, metadata !2759, i32 609, i32 0, i32 130} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2762 = metadata !{i32 612, i32 0, metadata !2761, null}
!2763 = metadata !{i32 613, i32 0, metadata !2761, null}
!2764 = metadata !{i32 1417, i32 0, metadata !633, metadata !2765}
!2765 = metadata !{i32 1429, i32 0, metadata !614, metadata !2766}
!2766 = metadata !{i32 617, i32 0, metadata !263, null}
!2767 = metadata !{i32 1418, i32 0, metadata !633, metadata !2765}
!2768 = metadata !{i32 1432, i32 0, metadata !623, metadata !2766}
!2769 = metadata !{i32 1433, i32 0, metadata !622, metadata !2766}
!2770 = metadata !{i32 1434, i32 0, metadata !626, metadata !2766}
!2771 = metadata !{i32 1435, i32 0, metadata !2172, metadata !2766}
!2772 = metadata !{i32 1436, i32 0, metadata !2175, metadata !2766}
!2773 = metadata !{i32 1437, i32 0, metadata !2175, metadata !2766}
!2774 = metadata !{i32 1439, i32 0, metadata !2178, metadata !2766}
!2775 = metadata !{i32 1440, i32 0, metadata !2178, metadata !2766}
!2776 = metadata !{i32 1442, i32 0, metadata !625, metadata !2766}
!2777 = metadata !{i32 1443, i32 0, metadata !625, metadata !2766}
!2778 = metadata !{i32 1444, i32 0, metadata !625, metadata !2766}
!2779 = metadata !{i32 1445, i32 0, metadata !2185, metadata !2766}
!2780 = metadata !{i32 618, i32 0, metadata !2781, null}
!2781 = metadata !{i32 786443, metadata !26, metadata !263, i32 618, i32 0, i32 132} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2782 = metadata !{i32 619, i32 0, metadata !2781, null}
!2783 = metadata !{i32 622, i32 0, metadata !256, null}
!2784 = metadata !{i32 64, i32 0, metadata !659, metadata !2785}
!2785 = metadata !{i32 625, i32 0, metadata !264, null}
!2786 = metadata !{i32 65, i32 0, metadata !658, metadata !2785}
!2787 = metadata !{i32 66, i32 0, metadata !2288, metadata !2785}
!2788 = metadata !{i32 627, i32 0, metadata !2789, null}
!2789 = metadata !{i32 786443, metadata !26, metadata !264, i32 627, i32 0, i32 133} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2790 = metadata !{i32 628, i32 0, metadata !2791, null}
!2791 = metadata !{i32 786443, metadata !26, metadata !2789, i32 627, i32 0, i32 134} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2792 = metadata !{i32 629, i32 0, metadata !2791, null}
!2793 = metadata !{i32 632, i32 0, metadata !270, null}
!2794 = metadata !{i32 633, i32 0, metadata !2795, null}
!2795 = metadata !{i32 786443, metadata !26, metadata !270, i32 632, i32 0, i32 136} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2796 = metadata !{i32 634, i32 0, metadata !2795, null}
!2797 = metadata !{i32 635, i32 0, metadata !2795, null}
!2798 = metadata !{i32 637, i32 0, metadata !269, null}
!2799 = metadata !{i32 638, i32 0, metadata !2800, null}
!2800 = metadata !{i32 786443, metadata !26, metadata !269, i32 638, i32 0, i32 138} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2801 = metadata !{i32 639, i32 0, metadata !2800, null}
!2802 = metadata !{i32 642, i32 0, metadata !264, null}
!2803 = metadata !{i32 40, i32 0, metadata !667, metadata !2804}
!2804 = metadata !{i32 661, i32 0, metadata !271, null}
!2805 = metadata !{i32 43, i32 0, metadata !2146, metadata !2804}
!2806 = metadata !{i32 46, i32 0, metadata !678, metadata !2804}
!2807 = metadata !{i32 47, i32 0, metadata !676, metadata !2804}
!2808 = metadata !{i32 48, i32 0, metadata !675, metadata !2804}
!2809 = metadata !{i32 49, i32 0, metadata !2156, metadata !2804}
!2810 = metadata !{i32 51, i32 0, metadata !675, metadata !2804}
!2811 = metadata !{i32 663, i32 0, metadata !271, null}
!2812 = metadata !{i32 664, i32 0, metadata !2813, null}
!2813 = metadata !{i32 786443, metadata !26, metadata !271, i32 664, i32 0, i32 139} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2814 = metadata !{metadata !2149, metadata !2151, i64 88}
!2815 = metadata !{i32 665, i32 0, metadata !2816, null}
!2816 = metadata !{i32 786443, metadata !26, metadata !2813, i32 664, i32 0, i32 140} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2817 = metadata !{i32 666, i32 0, metadata !2816, null}
!2818 = metadata !{i32 667, i32 0, metadata !2816, null}
!2819 = metadata !{i32 670, i32 0, metadata !280, null}
!2820 = metadata !{i32 646, i32 0, metadata !2821, metadata !2822}
!2821 = metadata !{i32 786443, metadata !26, metadata !646, i32 646, i32 0, i32 368} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2822 = metadata !{i32 671, i32 0, metadata !2823, null}
!2823 = metadata !{i32 786443, metadata !26, metadata !280, i32 670, i32 0, i32 142} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2824 = metadata !{metadata !2160, metadata !2150, i64 28}
!2825 = metadata !{i32 647, i32 0, metadata !2826, metadata !2822}
!2826 = metadata !{i32 786443, metadata !26, metadata !2827, i32 647, i32 0, i32 370} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2827 = metadata !{i32 786443, metadata !26, metadata !2821, i32 646, i32 0, i32 369} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2828 = metadata !{metadata !2160, metadata !2150, i64 32}
!2829 = metadata !{i32 648, i32 0, metadata !2826, metadata !2822}
!2830 = metadata !{i32 649, i32 0, metadata !2827, metadata !2822}
!2831 = metadata !{i32 651, i32 0, metadata !2827, metadata !2822}
!2832 = metadata !{i32 653, i32 0, metadata !2833, metadata !2822}
!2833 = metadata !{i32 786443, metadata !26, metadata !2821, i32 652, i32 0, i32 371} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2834 = metadata !{i32 654, i32 0, metadata !2833, metadata !2822}
!2835 = metadata !{i32 1417, i32 0, metadata !633, metadata !2836}
!2836 = metadata !{i32 1429, i32 0, metadata !614, metadata !2837}
!2837 = metadata !{i32 673, i32 0, metadata !279, null}
!2838 = metadata !{i32 1418, i32 0, metadata !633, metadata !2836}
!2839 = metadata !{i32 1432, i32 0, metadata !623, metadata !2837}
!2840 = metadata !{i32 1433, i32 0, metadata !622, metadata !2837}
!2841 = metadata !{i32 1434, i32 0, metadata !626, metadata !2837}
!2842 = metadata !{i32 1435, i32 0, metadata !2172, metadata !2837}
!2843 = metadata !{i32 1436, i32 0, metadata !2175, metadata !2837}
!2844 = metadata !{i32 1437, i32 0, metadata !2175, metadata !2837}
!2845 = metadata !{i32 1439, i32 0, metadata !2178, metadata !2837}
!2846 = metadata !{i32 1440, i32 0, metadata !2178, metadata !2837}
!2847 = metadata !{i32 1442, i32 0, metadata !625, metadata !2837}
!2848 = metadata !{i32 1443, i32 0, metadata !625, metadata !2837}
!2849 = metadata !{i32 1444, i32 0, metadata !625, metadata !2837}
!2850 = metadata !{i32 1445, i32 0, metadata !2185, metadata !2837}
!2851 = metadata !{i32 674, i32 0, metadata !2852, null}
!2852 = metadata !{i32 786443, metadata !26, metadata !279, i32 674, i32 0, i32 144} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2853 = metadata !{i32 675, i32 0, metadata !2852, null}
!2854 = metadata !{i32 678, i32 0, metadata !271, null}
!2855 = metadata !{i32 64, i32 0, metadata !659, metadata !2856}
!2856 = metadata !{i32 683, i32 0, metadata !281, null}
!2857 = metadata !{i32 65, i32 0, metadata !658, metadata !2856}
!2858 = metadata !{i32 66, i32 0, metadata !2288, metadata !2856}
!2859 = metadata !{i32 685, i32 0, metadata !2860, null}
!2860 = metadata !{i32 786443, metadata !26, metadata !281, i32 685, i32 0, i32 145} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2861 = metadata !{i32 686, i32 0, metadata !2862, null}
!2862 = metadata !{i32 786443, metadata !26, metadata !2860, i32 685, i32 0, i32 146} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2863 = metadata !{i32 687, i32 0, metadata !2862, null}
!2864 = metadata !{i32 690, i32 0, metadata !281, null}
!2865 = metadata !{i32 691, i32 0, metadata !2866, null}
!2866 = metadata !{i32 786443, metadata !26, metadata !281, i32 691, i32 0, i32 147} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2867 = metadata !{metadata !2149, metadata !2151, i64 96}
!2868 = metadata !{i32 692, i32 0, metadata !2869, null}
!2869 = metadata !{i32 786443, metadata !26, metadata !2866, i32 691, i32 0, i32 148} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2870 = metadata !{i32 693, i32 0, metadata !2869, null}
!2871 = metadata !{i32 694, i32 0, metadata !2869, null}
!2872 = metadata !{i32 697, i32 0, metadata !290, null}
!2873 = metadata !{i32 646, i32 0, metadata !2821, metadata !2874}
!2874 = metadata !{i32 698, i32 0, metadata !2875, null}
!2875 = metadata !{i32 786443, metadata !26, metadata !290, i32 697, i32 0, i32 150} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2876 = metadata !{i32 647, i32 0, metadata !2826, metadata !2874}
!2877 = metadata !{i32 648, i32 0, metadata !2826, metadata !2874}
!2878 = metadata !{i32 649, i32 0, metadata !2827, metadata !2874}
!2879 = metadata !{i32 651, i32 0, metadata !2827, metadata !2874}
!2880 = metadata !{i32 653, i32 0, metadata !2833, metadata !2874}
!2881 = metadata !{i32 654, i32 0, metadata !2833, metadata !2874}
!2882 = metadata !{i32 700, i32 0, metadata !289, null}
!2883 = metadata !{i32 701, i32 0, metadata !2884, null}
!2884 = metadata !{i32 786443, metadata !26, metadata !289, i32 701, i32 0, i32 152} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2885 = metadata !{i32 702, i32 0, metadata !2884, null}
!2886 = metadata !{i32 705, i32 0, metadata !281, null}
!2887 = metadata !{i32 40, i32 0, metadata !667, metadata !2888}
!2888 = metadata !{i32 714, i32 0, metadata !291, null}
!2889 = metadata !{i32 43, i32 0, metadata !2146, metadata !2888}
!2890 = metadata !{i32 46, i32 0, metadata !678, metadata !2888}
!2891 = metadata !{i32 47, i32 0, metadata !676, metadata !2888}
!2892 = metadata !{i32 48, i32 0, metadata !675, metadata !2888}
!2893 = metadata !{i32 49, i32 0, metadata !2156, metadata !2888}
!2894 = metadata !{i32 716, i32 0, metadata !303, null}
!2895 = metadata !{i32 708, i32 0, metadata !639, metadata !2896}
!2896 = metadata !{i32 717, i32 0, metadata !2897, null}
!2897 = metadata !{i32 786443, metadata !26, metadata !303, i32 716, i32 0, i32 154} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2898 = metadata !{i32 709, i32 0, metadata !639, metadata !2896}
!2899 = metadata !{i32 1417, i32 0, metadata !633, metadata !2900}
!2900 = metadata !{i32 1429, i32 0, metadata !614, metadata !2901}
!2901 = metadata !{i32 719, i32 0, metadata !302, null}
!2902 = metadata !{i32 1418, i32 0, metadata !633, metadata !2900}
!2903 = metadata !{i32 1432, i32 0, metadata !623, metadata !2901}
!2904 = metadata !{i32 1433, i32 0, metadata !622, metadata !2901}
!2905 = metadata !{i32 1434, i32 0, metadata !626, metadata !2901}
!2906 = metadata !{i32 1435, i32 0, metadata !2172, metadata !2901}
!2907 = metadata !{i32 1436, i32 0, metadata !2175, metadata !2901}
!2908 = metadata !{i32 1437, i32 0, metadata !2175, metadata !2901}
!2909 = metadata !{i32 1439, i32 0, metadata !2178, metadata !2901}
!2910 = metadata !{i32 1440, i32 0, metadata !2178, metadata !2901}
!2911 = metadata !{i32 1442, i32 0, metadata !625, metadata !2901}
!2912 = metadata !{i32 1443, i32 0, metadata !625, metadata !2901}
!2913 = metadata !{i32 1444, i32 0, metadata !625, metadata !2901}
!2914 = metadata !{i32 1445, i32 0, metadata !2185, metadata !2901}
!2915 = metadata !{i32 720, i32 0, metadata !2916, null}
!2916 = metadata !{i32 786443, metadata !26, metadata !302, i32 720, i32 0, i32 156} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2917 = metadata !{i32 721, i32 0, metadata !2916, null}
!2918 = metadata !{i32 724, i32 0, metadata !291, null}
!2919 = metadata !{i32 64, i32 0, metadata !659, metadata !2920}
!2920 = metadata !{i32 727, i32 0, metadata !304, null}
!2921 = metadata !{i32 65, i32 0, metadata !658, metadata !2920}
!2922 = metadata !{i32 66, i32 0, metadata !2288, metadata !2920}
!2923 = metadata !{i32 729, i32 0, metadata !2924, null}
!2924 = metadata !{i32 786443, metadata !26, metadata !304, i32 729, i32 0, i32 157} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2925 = metadata !{i32 730, i32 0, metadata !2926, null}
!2926 = metadata !{i32 786443, metadata !26, metadata !2924, i32 729, i32 0, i32 158} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2927 = metadata !{i32 731, i32 0, metadata !2926, null}
!2928 = metadata !{i32 734, i32 0, metadata !314, null}
!2929 = metadata !{i32 708, i32 0, metadata !639, metadata !2930}
!2930 = metadata !{i32 735, i32 0, metadata !2931, null}
!2931 = metadata !{i32 786443, metadata !26, metadata !314, i32 734, i32 0, i32 160} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2932 = metadata !{i32 709, i32 0, metadata !639, metadata !2930}
!2933 = metadata !{i32 737, i32 0, metadata !313, null}
!2934 = metadata !{i32 738, i32 0, metadata !2935, null}
!2935 = metadata !{i32 786443, metadata !26, metadata !313, i32 738, i32 0, i32 162} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2936 = metadata !{i32 739, i32 0, metadata !2935, null}
!2937 = metadata !{i32 742, i32 0, metadata !304, null}
!2938 = metadata !{i32 40, i32 0, metadata !667, metadata !2939}
!2939 = metadata !{i32 746, i32 0, metadata !315, null}
!2940 = metadata !{i32 43, i32 0, metadata !2146, metadata !2939}
!2941 = metadata !{i32 46, i32 0, metadata !678, metadata !2939}
!2942 = metadata !{i32 47, i32 0, metadata !676, metadata !2939}
!2943 = metadata !{i32 48, i32 0, metadata !675, metadata !2939}
!2944 = metadata !{i32 49, i32 0, metadata !2156, metadata !2939}
!2945 = metadata !{i32 748, i32 0, metadata !323, null}
!2946 = metadata !{i32 708, i32 0, metadata !639, metadata !2947}
!2947 = metadata !{i32 749, i32 0, metadata !2948, null}
!2948 = metadata !{i32 786443, metadata !26, metadata !323, i32 748, i32 0, i32 164} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2949 = metadata !{i32 709, i32 0, metadata !639, metadata !2947}
!2950 = metadata !{i32 1417, i32 0, metadata !633, metadata !2951}
!2951 = metadata !{i32 1429, i32 0, metadata !614, metadata !2952}
!2952 = metadata !{i32 751, i32 0, metadata !322, null}
!2953 = metadata !{i32 1418, i32 0, metadata !633, metadata !2951}
!2954 = metadata !{i32 1432, i32 0, metadata !623, metadata !2952}
!2955 = metadata !{i32 1433, i32 0, metadata !622, metadata !2952}
!2956 = metadata !{i32 1434, i32 0, metadata !626, metadata !2952}
!2957 = metadata !{i32 1435, i32 0, metadata !2172, metadata !2952}
!2958 = metadata !{i32 1436, i32 0, metadata !2175, metadata !2952}
!2959 = metadata !{i32 1437, i32 0, metadata !2175, metadata !2952}
!2960 = metadata !{i32 1439, i32 0, metadata !2178, metadata !2952}
!2961 = metadata !{i32 1440, i32 0, metadata !2178, metadata !2952}
!2962 = metadata !{i32 1442, i32 0, metadata !625, metadata !2952}
!2963 = metadata !{i32 1443, i32 0, metadata !625, metadata !2952}
!2964 = metadata !{i32 1444, i32 0, metadata !625, metadata !2952}
!2965 = metadata !{i32 1445, i32 0, metadata !2185, metadata !2952}
!2966 = metadata !{i32 752, i32 0, metadata !2967, null}
!2967 = metadata !{i32 786443, metadata !26, metadata !322, i32 752, i32 0, i32 166} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2968 = metadata !{i32 753, i32 0, metadata !2967, null}
!2969 = metadata !{i32 756, i32 0, metadata !315, null}
!2970 = metadata !{i32 64, i32 0, metadata !659, metadata !2971}
!2971 = metadata !{i32 759, i32 0, metadata !324, null}
!2972 = metadata !{i32 65, i32 0, metadata !658, metadata !2971}
!2973 = metadata !{i32 66, i32 0, metadata !2288, metadata !2971}
!2974 = metadata !{i32 761, i32 0, metadata !2975, null}
!2975 = metadata !{i32 786443, metadata !26, metadata !324, i32 761, i32 0, i32 167} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2976 = metadata !{i32 762, i32 0, metadata !2977, null}
!2977 = metadata !{i32 786443, metadata !26, metadata !2975, i32 761, i32 0, i32 168} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2978 = metadata !{i32 763, i32 0, metadata !2977, null}
!2979 = metadata !{i32 766, i32 0, metadata !333, null}
!2980 = metadata !{i32 768, i32 0, metadata !332, null}
!2981 = metadata !{i32 772, i32 0, metadata !2982, null}
!2982 = metadata !{i32 786443, metadata !26, metadata !332, i32 772, i32 0, i32 171} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2983 = metadata !{i32 773, i32 0, metadata !2982, null}
!2984 = metadata !{i32 777, i32 0, metadata !324, null}
!2985 = metadata !{i32 778, i32 0, metadata !324, null}
!2986 = metadata !{i32 779, i32 0, metadata !324, null}
!2987 = metadata !{i32 64, i32 0, metadata !659, metadata !2988}
!2988 = metadata !{i32 783, i32 0, metadata !334, null}
!2989 = metadata !{i32 65, i32 0, metadata !658, metadata !2988}
!2990 = metadata !{i32 66, i32 0, metadata !2288, metadata !2988}
!2991 = metadata !{i32 785, i32 0, metadata !334, null}
!2992 = metadata !{i32 787, i32 0, metadata !2993, null}
!2993 = metadata !{i32 786443, metadata !26, metadata !334, i32 787, i32 0, i32 172} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2994 = metadata !{i32 788, i32 0, metadata !2995, null}
!2995 = metadata !{i32 786443, metadata !26, metadata !2993, i32 787, i32 0, i32 173} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2996 = metadata !{i32 789, i32 0, metadata !2995, null}
!2997 = metadata !{i32 792, i32 0, metadata !2998, null}
!2998 = metadata !{i32 786443, metadata !26, metadata !334, i32 792, i32 0, i32 174} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2999 = metadata !{metadata !2149, metadata !2151, i64 72}
!3000 = metadata !{i32 793, i32 0, metadata !3001, null}
!3001 = metadata !{i32 786443, metadata !26, metadata !2998, i32 792, i32 0, i32 175} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3002 = metadata !{i32 794, i32 0, metadata !3001, null}
!3003 = metadata !{i32 795, i32 0, metadata !3001, null}
!3004 = metadata !{i32 798, i32 0, metadata !343, null}
!3005 = metadata !{i32 799, i32 0, metadata !3006, null}
!3006 = metadata !{i32 786443, metadata !26, metadata !343, i32 798, i32 0, i32 177} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3007 = metadata !{i32 800, i32 0, metadata !3006, null}
!3008 = metadata !{i32 801, i32 0, metadata !3006, null}
!3009 = metadata !{i32 804, i32 0, metadata !342, null}
!3010 = metadata !{i32 808, i32 0, metadata !3011, null}
!3011 = metadata !{i32 786443, metadata !26, metadata !342, i32 808, i32 0, i32 179} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3012 = metadata !{i32 809, i32 0, metadata !3011, null}
!3013 = metadata !{i32 812, i32 0, metadata !334, null}
!3014 = metadata !{i32 64, i32 0, metadata !659, metadata !3015}
!3015 = metadata !{i32 815, i32 0, metadata !344, null}
!3016 = metadata !{i32 65, i32 0, metadata !658, metadata !3015}
!3017 = metadata !{i32 66, i32 0, metadata !2288, metadata !3015}
!3018 = metadata !{i32 817, i32 0, metadata !3019, null}
!3019 = metadata !{i32 786443, metadata !26, metadata !344, i32 817, i32 0, i32 180} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3020 = metadata !{i32 818, i32 0, metadata !3021, null}
!3021 = metadata !{i32 786443, metadata !26, metadata !3019, i32 817, i32 0, i32 181} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3022 = metadata !{i32 819, i32 0, metadata !3021, null}
!3023 = metadata !{i32 822, i32 0, metadata !370, null}
!3024 = metadata !{i32 823, i32 0, metadata !3025, null}
!3025 = metadata !{i32 786443, metadata !26, metadata !370, i32 822, i32 0, i32 183} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3026 = metadata !{i32 824, i32 0, metadata !3025, null}
!3027 = metadata !{i32 825, i32 0, metadata !3025, null}
!3028 = metadata !{i32 827, i32 0, metadata !368, null}
!3029 = metadata !{i32 832, i32 0, metadata !367, null}
!3030 = metadata !{i32 833, i32 0, metadata !3031, null}
!3031 = metadata !{i32 786443, metadata !26, metadata !367, i32 833, i32 0, i32 187} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3032 = metadata !{i32 838, i32 0, metadata !375, null}
!3033 = metadata !{i32 835, i32 0, metadata !3034, null}
!3034 = metadata !{i32 786443, metadata !26, metadata !3031, i32 834, i32 0, i32 188} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3035 = metadata !{i32 836, i32 0, metadata !3034, null}
!3036 = metadata !{i32 839, i32 0, metadata !374, null}
!3037 = metadata !{i32 840, i32 0, metadata !374, null}
!3038 = metadata !{metadata !3039, metadata !2161, i64 0}
!3039 = metadata !{metadata !"dirent64", metadata !2161, i64 0, metadata !2161, i64 8, metadata !3040, i64 16, metadata !2143, i64 18, metadata !2143, i64 19}
!3040 = metadata !{metadata !"short", metadata !2143, i64 0}
!3041 = metadata !{i32 841, i32 0, metadata !374, null}
!3042 = metadata !{metadata !3039, metadata !3040, i64 16}
!3043 = metadata !{i32 842, i32 0, metadata !374, null}
!3044 = metadata !{metadata !3039, metadata !2143, i64 18}
!3045 = metadata !{i32 843, i32 0, metadata !374, null}
!3046 = metadata !{i32 844, i32 0, metadata !374, null}
!3047 = metadata !{i32 845, i32 0, metadata !374, null}
!3048 = metadata !{metadata !3039, metadata !2161, i64 8}
!3049 = metadata !{i32 846, i32 0, metadata !374, null}
!3050 = metadata !{i32 847, i32 0, metadata !374, null}
!3051 = metadata !{i32 851, i32 0, metadata !367, null}
!3052 = metadata !{i32 852, i32 0, metadata !367, null}
!3053 = metadata !{i32 853, i32 0, metadata !367, null}
!3054 = metadata !{i32 854, i32 0, metadata !367, null}
!3055 = metadata !{i32 855, i32 0, metadata !367, null}
!3056 = metadata !{i32 856, i32 0, metadata !367, null}
!3057 = metadata !{i32 857, i32 0, metadata !367, null}
!3058 = metadata !{i32 858, i32 0, metadata !367, null}
!3059 = metadata !{i32 860, i32 0, metadata !367, null}
!3060 = metadata !{i32 862, i32 0, metadata !377, null}
!3061 = metadata !{i32 873, i32 0, metadata !377, null}
!3062 = metadata !{i32 874, i32 0, metadata !377, null}
!3063 = metadata !{i32 875, i32 0, metadata !377, null}
!3064 = metadata !{i32 876, i32 0, metadata !377, null}
!3065 = metadata !{i32 877, i32 0, metadata !382, null}
!3066 = metadata !{i32 878, i32 0, metadata !3067, null}
!3067 = metadata !{i32 786443, metadata !26, metadata !382, i32 877, i32 0, i32 193} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3068 = metadata !{i32 879, i32 0, metadata !3067, null}
!3069 = metadata !{i32 881, i32 0, metadata !381, null}
!3070 = metadata !{i32 885, i32 0, metadata !381, null}
!3071 = metadata !{i32 886, i32 0, metadata !384, null}
!3072 = metadata !{i32 887, i32 0, metadata !384, null}
!3073 = metadata !{i32 888, i32 0, metadata !384, null}
!3074 = metadata !{i32 895, i32 0, metadata !344, null}
!3075 = metadata !{i32 64, i32 0, metadata !659, metadata !3076}
!3076 = metadata !{i32 902, i32 0, metadata !385, null}
!3077 = metadata !{i32 65, i32 0, metadata !658, metadata !3076}
!3078 = metadata !{i32 66, i32 0, metadata !2288, metadata !3076}
!3079 = metadata !{i32 910, i32 0, metadata !3080, null}
!3080 = metadata !{i32 786443, metadata !26, metadata !385, i32 910, i32 0, i32 196} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3081 = metadata !{i32 911, i32 0, metadata !3082, null}
!3082 = metadata !{i32 786443, metadata !26, metadata !3080, i32 910, i32 0, i32 197} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3083 = metadata !{i32 912, i32 0, metadata !3082, null}
!3084 = metadata !{i32 915, i32 0, metadata !385, null}
!3085 = metadata !{i32 916, i32 0, metadata !385, null}
!3086 = metadata !{i32 917, i32 0, metadata !385, null}
!3087 = metadata !{i32 919, i32 0, metadata !409, null}
!3088 = metadata !{i32 920, i32 0, metadata !408, null}
!3089 = metadata !{i32 922, i32 0, metadata !408, null}
!3090 = metadata !{i32 926, i32 0, metadata !411, null}
!3091 = metadata !{i32 929, i32 0, metadata !3092, null}
!3092 = metadata !{i32 786443, metadata !26, metadata !411, i32 929, i32 0, i32 202} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3093 = metadata !{metadata !3094, metadata !2150, i64 24}
!3094 = metadata !{metadata !"stat", metadata !2161, i64 0, metadata !2161, i64 8, metadata !2161, i64 16, metadata !2150, i64 24, metadata !2150, i64 28, metadata !2150, i64 32, metadata !2150, i64 36, metadata !2161, i64 40, metadata !2161, i64 48, met
!3095 = metadata !{i32 932, i32 0, metadata !3096, null}
!3096 = metadata !{i32 786443, metadata !26, metadata !3092, i32 929, i32 0, i32 203} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3097 = metadata !{metadata !3098, metadata !2150, i64 0}
!3098 = metadata !{metadata !"termios", metadata !2150, i64 0, metadata !2150, i64 4, metadata !2150, i64 8, metadata !2150, i64 12, metadata !2143, i64 16, metadata !2143, i64 17, metadata !2150, i64 52, metadata !2150, i64 56}
!3099 = metadata !{i32 933, i32 0, metadata !3096, null}
!3100 = metadata !{metadata !3098, metadata !2150, i64 4}
!3101 = metadata !{i32 934, i32 0, metadata !3096, null}
!3102 = metadata !{metadata !3098, metadata !2150, i64 8}
!3103 = metadata !{i32 935, i32 0, metadata !3096, null}
!3104 = metadata !{metadata !3098, metadata !2150, i64 12}
!3105 = metadata !{i32 936, i32 0, metadata !3096, null}
!3106 = metadata !{metadata !3098, metadata !2143, i64 16}
!3107 = metadata !{i32 937, i32 0, metadata !3096, null}
!3108 = metadata !{i32 938, i32 0, metadata !3096, null}
!3109 = metadata !{i32 939, i32 0, metadata !3096, null}
!3110 = metadata !{i32 940, i32 0, metadata !3096, null}
!3111 = metadata !{i32 941, i32 0, metadata !3096, null}
!3112 = metadata !{i32 942, i32 0, metadata !3096, null}
!3113 = metadata !{i32 943, i32 0, metadata !3096, null}
!3114 = metadata !{i32 944, i32 0, metadata !3096, null}
!3115 = metadata !{i32 945, i32 0, metadata !3096, null}
!3116 = metadata !{i32 946, i32 0, metadata !3096, null}
!3117 = metadata !{i32 947, i32 0, metadata !3096, null}
!3118 = metadata !{i32 948, i32 0, metadata !3096, null}
!3119 = metadata !{i32 949, i32 0, metadata !3096, null}
!3120 = metadata !{i32 950, i32 0, metadata !3096, null}
!3121 = metadata !{i32 951, i32 0, metadata !3096, null}
!3122 = metadata !{i32 952, i32 0, metadata !3096, null}
!3123 = metadata !{i32 953, i32 0, metadata !3096, null}
!3124 = metadata !{i32 954, i32 0, metadata !3096, null}
!3125 = metadata !{i32 955, i32 0, metadata !3096, null}
!3126 = metadata !{i32 956, i32 0, metadata !3096, null}
!3127 = metadata !{i32 958, i32 0, metadata !3128, null}
!3128 = metadata !{i32 786443, metadata !26, metadata !3092, i32 957, i32 0, i32 204} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3129 = metadata !{i32 959, i32 0, metadata !3128, null}
!3130 = metadata !{i32 964, i32 0, metadata !3131, null}
!3131 = metadata !{i32 786443, metadata !26, metadata !412, i32 962, i32 0, i32 205} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3132 = metadata !{i32 965, i32 0, metadata !3133, null}
!3133 = metadata !{i32 786443, metadata !26, metadata !3131, i32 965, i32 0, i32 206} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3134 = metadata !{i32 968, i32 0, metadata !3135, null}
!3135 = metadata !{i32 786443, metadata !26, metadata !3133, i32 967, i32 0, i32 208} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3136 = metadata !{i32 969, i32 0, metadata !3135, null}
!3137 = metadata !{i32 974, i32 0, metadata !3138, null}
!3138 = metadata !{i32 786443, metadata !26, metadata !412, i32 972, i32 0, i32 209} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3139 = metadata !{i32 975, i32 0, metadata !3140, null}
!3140 = metadata !{i32 786443, metadata !26, metadata !3138, i32 975, i32 0, i32 210} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3141 = metadata !{i32 978, i32 0, metadata !3142, null}
!3142 = metadata !{i32 786443, metadata !26, metadata !3140, i32 977, i32 0, i32 212} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3143 = metadata !{i32 979, i32 0, metadata !3142, null}
!3144 = metadata !{i32 984, i32 0, metadata !3145, null}
!3145 = metadata !{i32 786443, metadata !26, metadata !412, i32 982, i32 0, i32 213} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3146 = metadata !{i32 985, i32 0, metadata !3147, null}
!3147 = metadata !{i32 786443, metadata !26, metadata !3145, i32 985, i32 0, i32 214} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3148 = metadata !{i32 988, i32 0, metadata !3149, null}
!3149 = metadata !{i32 786443, metadata !26, metadata !3147, i32 987, i32 0, i32 216} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3150 = metadata !{i32 989, i32 0, metadata !3149, null}
!3151 = metadata !{i32 994, i32 0, metadata !432, null}
!3152 = metadata !{metadata !3153, metadata !3040, i64 0}
!3153 = metadata !{metadata !"winsize", metadata !3040, i64 0, metadata !3040, i64 2, metadata !3040, i64 4, metadata !3040, i64 6}
!3154 = metadata !{i32 995, i32 0, metadata !432, null}
!3155 = metadata !{metadata !3153, metadata !3040, i64 2}
!3156 = metadata !{i32 996, i32 0, metadata !432, null}
!3157 = metadata !{i32 997, i32 0, metadata !3158, null}
!3158 = metadata !{i32 786443, metadata !26, metadata !432, i32 997, i32 0, i32 218} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3159 = metadata !{i32 1000, i32 0, metadata !3160, null}
!3160 = metadata !{i32 786443, metadata !26, metadata !3158, i32 999, i32 0, i32 220} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3161 = metadata !{i32 1001, i32 0, metadata !3160, null}
!3162 = metadata !{i32 1006, i32 0, metadata !3163, null}
!3163 = metadata !{i32 786443, metadata !26, metadata !412, i32 1004, i32 0, i32 221} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3164 = metadata !{i32 1007, i32 0, metadata !3165, null}
!3165 = metadata !{i32 786443, metadata !26, metadata !3163, i32 1007, i32 0, i32 222} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3166 = metadata !{i32 1008, i32 0, metadata !3167, null}
!3167 = metadata !{i32 786443, metadata !26, metadata !3165, i32 1007, i32 0, i32 223} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3168 = metadata !{i32 1009, i32 0, metadata !3167, null}
!3169 = metadata !{i32 1011, i32 0, metadata !3170, null}
!3170 = metadata !{i32 786443, metadata !26, metadata !3165, i32 1010, i32 0, i32 224} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3171 = metadata !{i32 1012, i32 0, metadata !3170, null}
!3172 = metadata !{i32 1016, i32 0, metadata !442, null}
!3173 = metadata !{i32 1017, i32 0, metadata !442, null}
!3174 = metadata !{i32 1018, i32 0, metadata !3175, null}
!3175 = metadata !{i32 786443, metadata !26, metadata !442, i32 1018, i32 0, i32 226} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3176 = metadata !{i32 1019, i32 0, metadata !3177, null}
!3177 = metadata !{i32 786443, metadata !26, metadata !3178, i32 1019, i32 0, i32 228} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3178 = metadata !{i32 786443, metadata !26, metadata !3175, i32 1018, i32 0, i32 227} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3179 = metadata !{i32 1020, i32 0, metadata !3180, null}
!3180 = metadata !{i32 786443, metadata !26, metadata !3177, i32 1019, i32 0, i32 229} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3181 = metadata !{i32 1021, i32 0, metadata !3180, null}
!3182 = metadata !{i32 1024, i32 0, metadata !3178, null}
!3183 = metadata !{i32 1026, i32 0, metadata !3184, null}
!3184 = metadata !{i32 786443, metadata !26, metadata !3175, i32 1025, i32 0, i32 231} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3185 = metadata !{i32 1027, i32 0, metadata !3184, null}
!3186 = metadata !{i32 1031, i32 0, metadata !3187, null}
!3187 = metadata !{i32 786443, metadata !26, metadata !412, i32 1030, i32 0, i32 232} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3188 = metadata !{i32 1032, i32 0, metadata !3187, null}
!3189 = metadata !{i32 1033, i32 0, metadata !3187, null}
!3190 = metadata !{i32 1036, i32 0, metadata !412, null}
!3191 = metadata !{i32 1037, i32 0, metadata !412, null}
!3192 = metadata !{i32 1038, i32 0, metadata !412, null}
!3193 = metadata !{i32 1041, i32 0, metadata !445, null}
!3194 = metadata !{i32 1042, i32 0, metadata !3195, null}
!3195 = metadata !{i32 786443, metadata !26, metadata !445, i32 1042, i32 0, i32 234} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3196 = metadata !{i32 1043, i32 0, metadata !3195, null}
!3197 = metadata !{i32 1046, i32 0, metadata !385, null}
!3198 = metadata !{i32 64, i32 0, metadata !659, metadata !3199}
!3199 = metadata !{i32 1049, i32 0, metadata !446, null}
!3200 = metadata !{i32 65, i32 0, metadata !658, metadata !3199}
!3201 = metadata !{i32 66, i32 0, metadata !2288, metadata !3199}
!3202 = metadata !{i32 1053, i32 0, metadata !3203, null}
!3203 = metadata !{i32 786443, metadata !26, metadata !446, i32 1053, i32 0, i32 235} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3204 = metadata !{i32 1054, i32 0, metadata !3205, null}
!3205 = metadata !{i32 786443, metadata !26, metadata !3203, i32 1053, i32 0, i32 236} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3206 = metadata !{i32 1055, i32 0, metadata !3205, null}
!3207 = metadata !{i32 1058, i32 0, metadata !3208, null}
!3208 = metadata !{i32 786443, metadata !26, metadata !446, i32 1058, i32 0, i32 237} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3209 = metadata !{i32 1062, i32 0, metadata !3210, null}
!3210 = metadata !{i32 786443, metadata !26, metadata !3208, i32 1061, i32 0, i32 239} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3211 = metadata !{i32 1063, i32 0, metadata !3210, null}
!3212 = metadata !{i32 1064, i32 0, metadata !3210, null}
!3213 = metadata !{i32 1067, i32 0, metadata !459, null}
!3214 = metadata !{i32 1068, i32 0, metadata !458, null}
!3215 = metadata !{i32 1071, i32 0, metadata !3216, null}
!3216 = metadata !{i32 786443, metadata !26, metadata !456, i32 1071, i32 0, i32 244} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3217 = metadata !{i32 1073, i32 0, metadata !456, null}
!3218 = metadata !{i32 1076, i32 0, metadata !3219, null}
!3219 = metadata !{i32 786443, metadata !26, metadata !457, i32 1075, i32 0, i32 245} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3220 = metadata !{i32 1077, i32 0, metadata !3221, null}
!3221 = metadata !{i32 786443, metadata !26, metadata !3219, i32 1077, i32 0, i32 246} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3222 = metadata !{i32 1078, i32 0, metadata !3221, null}
!3223 = metadata !{i32 1079, i32 0, metadata !3219, null}
!3224 = metadata !{i32 1091, i32 0, metadata !457, null}
!3225 = metadata !{i32 1092, i32 0, metadata !457, null}
!3226 = metadata !{i32 1093, i32 0, metadata !457, null}
!3227 = metadata !{i32 1096, i32 0, metadata !461, null}
!3228 = metadata !{i32 1097, i32 0, metadata !3229, null}
!3229 = metadata !{i32 786443, metadata !26, metadata !461, i32 1097, i32 0, i32 249} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3230 = metadata !{i32 1098, i32 0, metadata !3229, null}
!3231 = metadata !{i32 1101, i32 0, metadata !446, null}
!3232 = metadata !{i32 40, i32 0, metadata !667, metadata !3233}
!3233 = metadata !{i32 1104, i32 0, metadata !462, null}
!3234 = metadata !{i32 43, i32 0, metadata !2146, metadata !3233}
!3235 = metadata !{i32 46, i32 0, metadata !678, metadata !3233}
!3236 = metadata !{i32 47, i32 0, metadata !676, metadata !3233}
!3237 = metadata !{i32 48, i32 0, metadata !675, metadata !3233}
!3238 = metadata !{i32 49, i32 0, metadata !2156, metadata !3233}
!3239 = metadata !{i32 1105, i32 0, metadata !3240, null}
!3240 = metadata !{i32 786443, metadata !26, metadata !462, i32 1105, i32 0, i32 250} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3241 = metadata !{i32 1107, i32 0, metadata !3242, null}
!3242 = metadata !{i32 786443, metadata !26, metadata !3240, i32 1105, i32 0, i32 251} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3243 = metadata !{i32 1108, i32 0, metadata !3242, null}
!3244 = metadata !{i32 1109, i32 0, metadata !3242, null}
!3245 = metadata !{i32 1417, i32 0, metadata !633, metadata !3246}
!3246 = metadata !{i32 1429, i32 0, metadata !614, metadata !3247}
!3247 = metadata !{i32 1113, i32 0, metadata !500, null}
!3248 = metadata !{i32 1418, i32 0, metadata !633, metadata !3246}
!3249 = metadata !{i32 1432, i32 0, metadata !623, metadata !3247}
!3250 = metadata !{i32 1433, i32 0, metadata !622, metadata !3247}
!3251 = metadata !{i32 1434, i32 0, metadata !626, metadata !3247}
!3252 = metadata !{i32 1435, i32 0, metadata !2172, metadata !3247}
!3253 = metadata !{i32 1436, i32 0, metadata !2175, metadata !3247}
!3254 = metadata !{i32 1437, i32 0, metadata !2175, metadata !3247}
!3255 = metadata !{i32 1439, i32 0, metadata !2178, metadata !3247}
!3256 = metadata !{i32 1440, i32 0, metadata !2178, metadata !3247}
!3257 = metadata !{i32 1442, i32 0, metadata !625, metadata !3247}
!3258 = metadata !{i32 1443, i32 0, metadata !625, metadata !3247}
!3259 = metadata !{i32 1444, i32 0, metadata !625, metadata !3247}
!3260 = metadata !{i32 1445, i32 0, metadata !2185, metadata !3247}
!3261 = metadata !{i32 1114, i32 0, metadata !3262, null}
!3262 = metadata !{i32 786443, metadata !26, metadata !500, i32 1114, i32 0, i32 253} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3263 = metadata !{i32 1115, i32 0, metadata !3262, null}
!3264 = metadata !{i32 1118, i32 0, metadata !462, null}
!3265 = metadata !{i32 64, i32 0, metadata !659, metadata !3266}
!3266 = metadata !{i32 1121, i32 0, metadata !501, null}
!3267 = metadata !{i32 65, i32 0, metadata !658, metadata !3266}
!3268 = metadata !{i32 66, i32 0, metadata !2288, metadata !3266}
!3269 = metadata !{i32 1123, i32 0, metadata !3270, null}
!3270 = metadata !{i32 786443, metadata !26, metadata !501, i32 1123, i32 0, i32 254} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3271 = metadata !{i32 1124, i32 0, metadata !3272, null}
!3272 = metadata !{i32 786443, metadata !26, metadata !3270, i32 1123, i32 0, i32 255} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3273 = metadata !{i32 1125, i32 0, metadata !3272, null}
!3274 = metadata !{i32 1128, i32 0, metadata !510, null}
!3275 = metadata !{i32 1129, i32 0, metadata !3276, null}
!3276 = metadata !{i32 786443, metadata !26, metadata !510, i32 1128, i32 0, i32 257} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3277 = metadata !{i32 1130, i32 0, metadata !3276, null}
!3278 = metadata !{i32 1131, i32 0, metadata !3276, null}
!3279 = metadata !{i32 1133, i32 0, metadata !509, null}
!3280 = metadata !{i32 1134, i32 0, metadata !3281, null}
!3281 = metadata !{i32 786443, metadata !26, metadata !509, i32 1134, i32 0, i32 259} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3282 = metadata !{i32 1135, i32 0, metadata !3281, null}
!3283 = metadata !{i32 1138, i32 0, metadata !501, null}
!3284 = metadata !{i32 64, i32 0, metadata !659, metadata !3285}
!3285 = metadata !{i32 1141, i32 0, metadata !511, null}
!3286 = metadata !{i32 65, i32 0, metadata !658, metadata !3285}
!3287 = metadata !{i32 66, i32 0, metadata !2288, metadata !3285}
!3288 = metadata !{i32 1143, i32 0, metadata !518, null}
!3289 = metadata !{i32 1144, i32 0, metadata !3290, null}
!3290 = metadata !{i32 786443, metadata !26, metadata !518, i32 1143, i32 0, i32 261} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3291 = metadata !{i32 1145, i32 0, metadata !3290, null}
!3292 = metadata !{i32 1146, i32 0, metadata !517, null}
!3293 = metadata !{i32 1149, i32 0, metadata !516, null}
!3294 = metadata !{i32 1150, i32 0, metadata !3295, null}
!3295 = metadata !{i32 786443, metadata !26, metadata !516, i32 1150, i32 0, i32 265} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3296 = metadata !{i32 1151, i32 0, metadata !3295, null}
!3297 = metadata !{i32 1154, i32 0, metadata !511, null}
!3298 = metadata !{i32 64, i32 0, metadata !659, metadata !3299}
!3299 = metadata !{i32 1157, i32 0, metadata !519, null}
!3300 = metadata !{i32 65, i32 0, metadata !658, metadata !3299}
!3301 = metadata !{i32 66, i32 0, metadata !2288, metadata !3299}
!3302 = metadata !{i32 1159, i32 0, metadata !526, null}
!3303 = metadata !{i32 1160, i32 0, metadata !3304, null}
!3304 = metadata !{i32 786443, metadata !26, metadata !526, i32 1159, i32 0, i32 267} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3305 = metadata !{i32 1161, i32 0, metadata !3304, null}
!3306 = metadata !{i32 1163, i32 0, metadata !525, null}
!3307 = metadata !{i32 1164, i32 0, metadata !3308, null}
!3308 = metadata !{i32 786443, metadata !26, metadata !525, i32 1164, i32 0, i32 269} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3309 = metadata !{i32 308, i32 0, metadata !161, metadata !3307}
!3310 = metadata !{i32 64, i32 0, metadata !659, metadata !3311}
!3311 = metadata !{i32 310, i32 0, metadata !161, metadata !3307}
!3312 = metadata !{i32 311, i32 0, metadata !2450, metadata !3307}
!3313 = metadata !{i32 312, i32 0, metadata !2452, metadata !3307}
!3314 = metadata !{i32 313, i32 0, metadata !2452, metadata !3307}
!3315 = metadata !{i32 316, i32 0, metadata !2455, metadata !3307}
!3316 = metadata !{i32 317, i32 0, metadata !2459, metadata !3307}
!3317 = metadata !{i32 318, i32 0, metadata !2459, metadata !3307}
!3318 = metadata !{i32 319, i32 0, metadata !2459, metadata !3307}
!3319 = metadata !{i32 330, i32 0, metadata !161, metadata !3307}
!3320 = metadata !{i32 332, i32 0, metadata !161, metadata !3307}
!3321 = metadata !{i32 1168, i32 0, metadata !525, null}
!3322 = metadata !{i32 1170, i32 0, metadata !525, null}
!3323 = metadata !{i32 1177, i32 0, metadata !525, null}
!3324 = metadata !{i32 1179, i32 0, metadata !519, null}
!3325 = metadata !{i32 64, i32 0, metadata !659, metadata !3326}
!3326 = metadata !{i32 1182, i32 0, metadata !527, null}
!3327 = metadata !{i32 65, i32 0, metadata !658, metadata !3326}
!3328 = metadata !{i32 66, i32 0, metadata !2288, metadata !3326}
!3329 = metadata !{i32 1183, i32 0, metadata !533, null}
!3330 = metadata !{i32 1184, i32 0, metadata !3331, null}
!3331 = metadata !{i32 786443, metadata !26, metadata !533, i32 1183, i32 0, i32 271} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3332 = metadata !{i32 1185, i32 0, metadata !3331, null}
!3333 = metadata !{i32 1188, i32 0, metadata !3334, null}
!3334 = metadata !{i32 786443, metadata !26, metadata !532, i32 1188, i32 0, i32 273} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3335 = metadata !{i32 1189, i32 0, metadata !3336, null}
!3336 = metadata !{i32 786443, metadata !26, metadata !3334, i32 1189, i32 0, i32 274} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3337 = metadata !{i32 1191, i32 0, metadata !3338, null}
!3338 = metadata !{i32 786443, metadata !26, metadata !532, i32 1191, i32 0, i32 275} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3339 = metadata !{i32 1192, i32 0, metadata !3340, null}
!3340 = metadata !{i32 786443, metadata !26, metadata !3338, i32 1191, i32 0, i32 276} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3341 = metadata !{i32 1193, i32 0, metadata !3340, null}
!3342 = metadata !{i32 1195, i32 0, metadata !3343, null}
!3343 = metadata !{i32 786443, metadata !26, metadata !3338, i32 1194, i32 0, i32 277} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3344 = metadata !{i32 1198, i32 0, metadata !527, null}
!3345 = metadata !{i32 40, i32 0, metadata !667, metadata !3346}
!3346 = metadata !{i32 1201, i32 0, metadata !534, null}
!3347 = metadata !{i32 43, i32 0, metadata !2146, metadata !3346}
!3348 = metadata !{i32 46, i32 0, metadata !678, metadata !3346}
!3349 = metadata !{i32 47, i32 0, metadata !676, metadata !3346}
!3350 = metadata !{i32 48, i32 0, metadata !675, metadata !3346}
!3351 = metadata !{i32 49, i32 0, metadata !2156, metadata !3346}
!3352 = metadata !{i32 1202, i32 0, metadata !3353, null}
!3353 = metadata !{i32 786443, metadata !26, metadata !534, i32 1202, i32 0, i32 278} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3354 = metadata !{i32 1204, i32 0, metadata !3355, null}
!3355 = metadata !{i32 786443, metadata !26, metadata !3356, i32 1204, i32 0, i32 280} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3356 = metadata !{i32 786443, metadata !26, metadata !3353, i32 1202, i32 0, i32 279} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3357 = metadata !{i32 1205, i32 0, metadata !3358, null}
!3358 = metadata !{i32 786443, metadata !26, metadata !3355, i32 1204, i32 0, i32 281} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3359 = metadata !{i32 1206, i32 0, metadata !3358, null}
!3360 = metadata !{i32 1208, i32 0, metadata !3361, null}
!3361 = metadata !{i32 786443, metadata !26, metadata !3355, i32 1207, i32 0, i32 282} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3362 = metadata !{i32 1209, i32 0, metadata !3361, null}
!3363 = metadata !{i32 1213, i32 0, metadata !534, null}
!3364 = metadata !{i32 1214, i32 0, metadata !534, null}
!3365 = metadata !{i32 1215, i32 0, metadata !534, null}
!3366 = metadata !{i32 1216, i32 0, metadata !534, null}
!3367 = metadata !{i32 40, i32 0, metadata !667, metadata !3368}
!3368 = metadata !{i32 1219, i32 0, metadata !538, null}
!3369 = metadata !{i32 43, i32 0, metadata !2146, metadata !3368}
!3370 = metadata !{i32 46, i32 0, metadata !678, metadata !3368}
!3371 = metadata !{i32 47, i32 0, metadata !676, metadata !3368}
!3372 = metadata !{i32 48, i32 0, metadata !675, metadata !3368}
!3373 = metadata !{i32 49, i32 0, metadata !2156, metadata !3368}
!3374 = metadata !{i32 1220, i32 0, metadata !3375, null}
!3375 = metadata !{i32 786443, metadata !26, metadata !538, i32 1220, i32 0, i32 283} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3376 = metadata !{i32 1222, i32 0, metadata !3377, null}
!3377 = metadata !{i32 786443, metadata !26, metadata !3378, i32 1222, i32 0, i32 285} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3378 = metadata !{i32 786443, metadata !26, metadata !3375, i32 1220, i32 0, i32 284} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3379 = metadata !{i32 1223, i32 0, metadata !3380, null}
!3380 = metadata !{i32 786443, metadata !26, metadata !3377, i32 1222, i32 0, i32 286} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3381 = metadata !{i32 1224, i32 0, metadata !3380, null}
!3382 = metadata !{i32 1225, i32 0, metadata !3383, null}
!3383 = metadata !{i32 786443, metadata !26, metadata !3377, i32 1225, i32 0, i32 287} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3384 = metadata !{i32 1226, i32 0, metadata !3385, null}
!3385 = metadata !{i32 786443, metadata !26, metadata !3383, i32 1225, i32 0, i32 288} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3386 = metadata !{i32 1227, i32 0, metadata !3385, null}
!3387 = metadata !{i32 1229, i32 0, metadata !3388, null}
!3388 = metadata !{i32 786443, metadata !26, metadata !3383, i32 1228, i32 0, i32 289} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3389 = metadata !{i32 1230, i32 0, metadata !3388, null}
!3390 = metadata !{i32 1234, i32 0, metadata !538, null}
!3391 = metadata !{i32 1235, i32 0, metadata !538, null}
!3392 = metadata !{i32 1236, i32 0, metadata !538, null}
!3393 = metadata !{i32 1237, i32 0, metadata !538, null}
!3394 = metadata !{i32 40, i32 0, metadata !667, metadata !3395}
!3395 = metadata !{i32 1242, i32 0, metadata !542, null}
!3396 = metadata !{i32 43, i32 0, metadata !2146, metadata !3395}
!3397 = metadata !{i32 46, i32 0, metadata !678, metadata !3395}
!3398 = metadata !{i32 47, i32 0, metadata !676, metadata !3395}
!3399 = metadata !{i32 48, i32 0, metadata !675, metadata !3395}
!3400 = metadata !{i32 49, i32 0, metadata !2156, metadata !3395}
!3401 = metadata !{i32 1243, i32 0, metadata !3402, null}
!3402 = metadata !{i32 786443, metadata !26, metadata !542, i32 1243, i32 0, i32 290} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3403 = metadata !{i32 1245, i32 0, metadata !3404, null}
!3404 = metadata !{i32 786443, metadata !26, metadata !3405, i32 1245, i32 0, i32 292} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3405 = metadata !{i32 786443, metadata !26, metadata !3402, i32 1243, i32 0, i32 291} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3406 = metadata !{i32 1246, i32 0, metadata !3407, null}
!3407 = metadata !{i32 786443, metadata !26, metadata !3404, i32 1245, i32 0, i32 293} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3408 = metadata !{i32 1247, i32 0, metadata !3407, null}
!3409 = metadata !{i32 1248, i32 0, metadata !3410, null}
!3410 = metadata !{i32 786443, metadata !26, metadata !3404, i32 1248, i32 0, i32 294} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3411 = metadata !{i32 1249, i32 0, metadata !3412, null}
!3412 = metadata !{i32 786443, metadata !26, metadata !3410, i32 1248, i32 0, i32 295} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3413 = metadata !{i32 1250, i32 0, metadata !3412, null}
!3414 = metadata !{i32 1252, i32 0, metadata !3415, null}
!3415 = metadata !{i32 786443, metadata !26, metadata !3410, i32 1251, i32 0, i32 296} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3416 = metadata !{i32 1253, i32 0, metadata !3415, null}
!3417 = metadata !{i32 1257, i32 0, metadata !542, null}
!3418 = metadata !{i32 1258, i32 0, metadata !542, null}
!3419 = metadata !{i32 1259, i32 0, metadata !542, null}
!3420 = metadata !{i32 1260, i32 0, metadata !542, null}
!3421 = metadata !{i32 40, i32 0, metadata !667, metadata !3422}
!3422 = metadata !{i32 1263, i32 0, metadata !550, null}
!3423 = metadata !{i32 43, i32 0, metadata !2146, metadata !3422}
!3424 = metadata !{i32 46, i32 0, metadata !678, metadata !3422}
!3425 = metadata !{i32 47, i32 0, metadata !676, metadata !3422}
!3426 = metadata !{i32 48, i32 0, metadata !675, metadata !3422}
!3427 = metadata !{i32 49, i32 0, metadata !2156, metadata !3422}
!3428 = metadata !{i32 1264, i32 0, metadata !560, null}
!3429 = metadata !{i32 1267, i32 0, metadata !3430, null}
!3430 = metadata !{i32 786443, metadata !26, metadata !3431, i32 1267, i32 0, i32 299} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3431 = metadata !{i32 786443, metadata !26, metadata !560, i32 1264, i32 0, i32 298} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3432 = metadata !{i32 1268, i32 0, metadata !3433, null}
!3433 = metadata !{i32 786443, metadata !26, metadata !3430, i32 1267, i32 0, i32 300} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3434 = metadata !{i32 1269, i32 0, metadata !3435, null}
!3435 = metadata !{i32 786443, metadata !26, metadata !3433, i32 1269, i32 0, i32 301} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3436 = metadata !{i32 1270, i32 0, metadata !3437, null}
!3437 = metadata !{i32 786443, metadata !26, metadata !3433, i32 1270, i32 0, i32 302} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3438 = metadata !{i32 1271, i32 0, metadata !3439, null}
!3439 = metadata !{i32 786443, metadata !26, metadata !3433, i32 1271, i32 0, i32 303} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3440 = metadata !{i32 1272, i32 0, metadata !3441, null}
!3441 = metadata !{i32 786443, metadata !26, metadata !3433, i32 1272, i32 0, i32 304} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3442 = metadata !{i32 1273, i32 0, metadata !3433, null}
!3443 = metadata !{i32 1275, i32 0, metadata !3444, null}
!3444 = metadata !{i32 786443, metadata !26, metadata !3430, i32 1274, i32 0, i32 305} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3445 = metadata !{i32 1276, i32 0, metadata !3444, null}
!3446 = metadata !{i32 1279, i32 0, metadata !559, null}
!3447 = metadata !{i32 1280, i32 0, metadata !3448, null}
!3448 = metadata !{i32 786443, metadata !26, metadata !559, i32 1280, i32 0, i32 307} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3449 = metadata !{i32 1281, i32 0, metadata !3448, null}
!3450 = metadata !{i32 1282, i32 0, metadata !559, null}
!3451 = metadata !{i32 1284, i32 0, metadata !550, null}
!3452 = metadata !{i32 1296, i32 0, metadata !561, null}
!3453 = metadata !{i32 1299, i32 0, metadata !3454, null}
!3454 = metadata !{i32 786443, metadata !26, metadata !561, i32 1299, i32 0, i32 308} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3455 = metadata !{i32 1300, i32 0, metadata !3456, null}
!3456 = metadata !{i32 786443, metadata !26, metadata !3454, i32 1299, i32 0, i32 309} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3457 = metadata !{i32 1302, i32 0, metadata !3456, null}
!3458 = metadata !{i32 1306, i32 0, metadata !3459, null}
!3459 = metadata !{i32 786443, metadata !26, metadata !561, i32 1306, i32 0, i32 311} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3460 = metadata !{i32 1307, i32 0, metadata !3461, null}
!3461 = metadata !{i32 786443, metadata !26, metadata !3459, i32 1306, i32 0, i32 312} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3462 = metadata !{i32 1309, i32 0, metadata !3461, null}
!3463 = metadata !{i32 1313, i32 0, metadata !3464, null}
!3464 = metadata !{i32 786443, metadata !26, metadata !561, i32 1313, i32 0, i32 314} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3465 = metadata !{i32 1314, i32 0, metadata !3466, null}
!3466 = metadata !{i32 786443, metadata !26, metadata !3464, i32 1313, i32 0, i32 315} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3467 = metadata !{i32 1316, i32 0, metadata !3466, null}
!3468 = metadata !{i32 1325, i32 0, metadata !594, null}
!3469 = metadata !{i32 1326, i32 0, metadata !592, null}
!3470 = metadata !{metadata !2161, metadata !2161, i64 0}
!3471 = metadata !{i32 64, i32 0, metadata !659, metadata !3472}
!3472 = metadata !{i32 1327, i32 0, metadata !591, null}
!3473 = metadata !{i32 66, i32 0, metadata !2288, metadata !3472}
!3474 = metadata !{i32 65, i32 0, metadata !658, metadata !3472}
!3475 = metadata !{i32 1328, i32 0, metadata !3476, null}
!3476 = metadata !{i32 786443, metadata !26, metadata !591, i32 1328, i32 0, i32 321} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3477 = metadata !{i32 1329, i32 0, metadata !3478, null}
!3478 = metadata !{i32 786443, metadata !26, metadata !3476, i32 1328, i32 0, i32 322} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3479 = metadata !{i32 1330, i32 0, metadata !3478, null}
!3480 = metadata !{i32 1331, i32 0, metadata !3481, null}
!3481 = metadata !{i32 786443, metadata !26, metadata !3476, i32 1331, i32 0, i32 323} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3482 = metadata !{i32 1333, i32 0, metadata !3483, null}
!3483 = metadata !{i32 786443, metadata !26, metadata !3484, i32 1333, i32 0, i32 325} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3484 = metadata !{i32 786443, metadata !26, metadata !3481, i32 1331, i32 0, i32 324} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3485 = metadata !{i32 1334, i32 0, metadata !3486, null}
!3486 = metadata !{i32 786443, metadata !26, metadata !3484, i32 1334, i32 0, i32 326} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3487 = metadata !{i32 1335, i32 0, metadata !3488, null}
!3488 = metadata !{i32 786443, metadata !26, metadata !3484, i32 1335, i32 0, i32 327} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3489 = metadata !{i32 1336, i32 0, metadata !3484, null}
!3490 = metadata !{i32 1337, i32 0, metadata !3484, null}
!3491 = metadata !{i32 1338, i32 0, metadata !3492, null}
!3492 = metadata !{i32 786443, metadata !26, metadata !3493, i32 1338, i32 0, i32 329} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3493 = metadata !{i32 786443, metadata !26, metadata !3481, i32 1337, i32 0, i32 328} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3494 = metadata !{i32 1339, i32 0, metadata !3495, null}
!3495 = metadata !{i32 786443, metadata !26, metadata !3493, i32 1339, i32 0, i32 330} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3496 = metadata !{i32 1341, i32 0, metadata !3497, null}
!3497 = metadata !{i32 786443, metadata !26, metadata !3493, i32 1341, i32 0, i32 332} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3498 = metadata !{i32 1340, i32 0, metadata !3499, null}
!3499 = metadata !{i32 786443, metadata !26, metadata !3493, i32 1340, i32 0, i32 331} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3500 = metadata !{i32 1346, i32 0, metadata !597, null}
!3501 = metadata !{i32 1349, i32 0, metadata !596, null}
!3502 = metadata !{i32 1350, i32 0, metadata !596, null}
!3503 = metadata !{i32 1353, i32 0, metadata !603, null}
!3504 = metadata !{i32 1356, i32 0, metadata !3505, null}
!3505 = metadata !{i32 786443, metadata !26, metadata !3506, i32 1356, i32 0, i32 337} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3506 = metadata !{i32 786443, metadata !26, metadata !603, i32 1353, i32 0, i32 336} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3507 = metadata !{i32 1357, i32 0, metadata !3508, null}
!3508 = metadata !{i32 786443, metadata !26, metadata !3505, i32 1356, i32 0, i32 338} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3509 = metadata !{i32 1358, i32 0, metadata !3508, null}
!3510 = metadata !{i32 1361, i32 0, metadata !602, null}
!3511 = metadata !{i32 64, i32 0, metadata !659, metadata !3512}
!3512 = metadata !{i32 1365, i32 0, metadata !600, null}
!3513 = metadata !{i32 66, i32 0, metadata !2288, metadata !3512}
!3514 = metadata !{i32 65, i32 0, metadata !658, metadata !3512}
!3515 = metadata !{i32 1366, i32 0, metadata !3516, null}
!3516 = metadata !{i32 786443, metadata !26, metadata !600, i32 1366, i32 0, i32 342} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3517 = metadata !{i32 1367, i32 0, metadata !3518, null}
!3518 = metadata !{i32 786443, metadata !26, metadata !3519, i32 1367, i32 0, i32 344} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3519 = metadata !{i32 786443, metadata !26, metadata !3516, i32 1366, i32 0, i32 343} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3520 = metadata !{i32 1368, i32 0, metadata !3521, null}
!3521 = metadata !{i32 786443, metadata !26, metadata !3519, i32 1368, i32 0, i32 345} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3522 = metadata !{i32 1369, i32 0, metadata !3523, null}
!3523 = metadata !{i32 786443, metadata !26, metadata !3519, i32 1369, i32 0, i32 346} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3524 = metadata !{i32 1364, i32 0, metadata !601, null}
!3525 = metadata !{i32 1376, i32 0, metadata !561, null}
!3526 = metadata !{i32 1384, i32 0, metadata !604, null}
!3527 = metadata !{i32 1386, i32 0, metadata !3528, null}
!3528 = metadata !{i32 786443, metadata !26, metadata !604, i32 1386, i32 0, i32 347} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3529 = metadata !{metadata !2149, metadata !2151, i64 80}
!3530 = metadata !{i32 1387, i32 0, metadata !3531, null}
!3531 = metadata !{i32 786443, metadata !26, metadata !3528, i32 1386, i32 0, i32 348} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3532 = metadata !{i32 1388, i32 0, metadata !3531, null}
!3533 = metadata !{i32 1389, i32 0, metadata !3531, null}
!3534 = metadata !{i32 1392, i32 0, metadata !3535, null}
!3535 = metadata !{i32 786443, metadata !26, metadata !604, i32 1392, i32 0, i32 349} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3536 = metadata !{i32 1393, i32 0, metadata !3537, null}
!3537 = metadata !{i32 786443, metadata !26, metadata !3538, i32 1393, i32 0, i32 351} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3538 = metadata !{i32 786443, metadata !26, metadata !3535, i32 1392, i32 0, i32 350} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3539 = metadata !{i32 1395, i32 0, metadata !3538, null}
!3540 = metadata !{i32 1396, i32 0, metadata !3538, null}
!3541 = metadata !{i32 1417, i32 0, metadata !633, metadata !3542}
!3542 = metadata !{i32 1398, i32 0, metadata !604, null}
!3543 = metadata !{i32 1418, i32 0, metadata !633, metadata !3542}
!3544 = metadata !{i32 1423, i32 0, metadata !627, metadata !3545}
!3545 = metadata !{i32 1399, i32 0, metadata !604, null}
!3546 = metadata !{i32 1424, i32 0, metadata !627, metadata !3545}
!3547 = metadata !{i32 1403, i32 0, metadata !604, null}
!3548 = metadata !{i32 1404, i32 0, metadata !604, null}
!3549 = metadata !{i32 1405, i32 0, metadata !3550, null}
!3550 = metadata !{i32 786443, metadata !26, metadata !604, i32 1405, i32 0, i32 352} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3551 = metadata !{i32 1406, i32 0, metadata !3552, null}
!3552 = metadata !{i32 786443, metadata !26, metadata !3550, i32 1405, i32 0, i32 353} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3553 = metadata !{i32 1407, i32 0, metadata !3552, null}
!3554 = metadata !{i32 1411, i32 0, metadata !604, null}
!3555 = metadata !{i32 1458, i32 0, metadata !3556, null}
!3556 = metadata !{i32 786443, metadata !26, metadata !611, i32 1458, i32 0, i32 354} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3557 = metadata !{i32 1459, i32 0, metadata !3558, null}
!3558 = metadata !{i32 786443, metadata !26, metadata !3556, i32 1458, i32 0, i32 355} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3559 = metadata !{i32 1460, i32 0, metadata !3558, null}
!3560 = metadata !{i32 1463, i32 0, metadata !3561, null}
!3561 = metadata !{i32 786443, metadata !26, metadata !611, i32 1463, i32 0, i32 356} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!3562 = metadata !{i32 1467, i32 0, metadata !611, null}
!3563 = metadata !{i32 1468, i32 0, metadata !611, null}
!3564 = metadata !{i32 1469, i32 0, metadata !611, null}
!3565 = metadata !{i32 1470, i32 0, metadata !611, null}
!3566 = metadata !{i32 68, i32 0, metadata !701, null}
!3567 = metadata !{i32 71, i32 0, metadata !700, null}
!3568 = metadata !{i32 72, i32 0, metadata !700, null}
!3569 = metadata !{i32 73, i32 0, metadata !700, null}
!3570 = metadata !{i32 74, i32 0, metadata !700, null}
!3571 = metadata !{i32 76, i32 0, metadata !690, null}
!3572 = metadata !{i32 82, i32 0, metadata !721, null}
!3573 = metadata !{i32 85, i32 0, metadata !720, null}
!3574 = metadata !{i32 86, i32 0, metadata !720, null}
!3575 = metadata !{i32 87, i32 0, metadata !720, null}
!3576 = metadata !{i32 88, i32 0, metadata !720, null}
!3577 = metadata !{i32 90, i32 0, metadata !713, null}
!3578 = metadata !{i32 94, i32 0, metadata !722, null}
!3579 = metadata !{i32 98, i32 0, metadata !731, null}
!3580 = metadata !{i32 99, i32 0, metadata !731, null}
!3581 = metadata !{i32 42, i32 0, metadata !891, metadata !3582}
!3582 = metadata !{i32 100, i32 0, metadata !731, null}
!3583 = metadata !{i32 44, i32 0, metadata !891, metadata !3582}
!3584 = metadata !{i32 45, i32 0, metadata !891, metadata !3582}
!3585 = metadata !{metadata !2160, metadata !2161, i64 16}
!3586 = metadata !{metadata !3094, metadata !2161, i64 16}
!3587 = metadata !{i32 46, i32 0, metadata !891, metadata !3582}
!3588 = metadata !{metadata !3094, metadata !2150, i64 28}
!3589 = metadata !{i32 47, i32 0, metadata !891, metadata !3582}
!3590 = metadata !{metadata !3094, metadata !2150, i64 32}
!3591 = metadata !{i32 48, i32 0, metadata !891, metadata !3582}
!3592 = metadata !{i32 50, i32 0, metadata !891, metadata !3582}
!3593 = metadata !{metadata !3094, metadata !2161, i64 72}
!3594 = metadata !{i32 51, i32 0, metadata !891, metadata !3582}
!3595 = metadata !{metadata !3094, metadata !2161, i64 88}
!3596 = metadata !{i32 52, i32 0, metadata !891, metadata !3582}
!3597 = metadata !{metadata !2160, metadata !2161, i64 104}
!3598 = metadata !{metadata !3094, metadata !2161, i64 104}
!3599 = metadata !{i32 53, i32 0, metadata !891, metadata !3582}
!3600 = metadata !{i32 102, i32 0, metadata !731, null}
!3601 = metadata !{i32 105, i32 0, metadata !779, null}
!3602 = metadata !{i32 106, i32 0, metadata !779, null}
!3603 = metadata !{i32 42, i32 0, metadata !891, metadata !3604}
!3604 = metadata !{i32 107, i32 0, metadata !779, null}
!3605 = metadata !{i32 44, i32 0, metadata !891, metadata !3604}
!3606 = metadata !{i32 45, i32 0, metadata !891, metadata !3604}
!3607 = metadata !{i32 46, i32 0, metadata !891, metadata !3604}
!3608 = metadata !{i32 47, i32 0, metadata !891, metadata !3604}
!3609 = metadata !{i32 48, i32 0, metadata !891, metadata !3604}
!3610 = metadata !{i32 50, i32 0, metadata !891, metadata !3604}
!3611 = metadata !{i32 51, i32 0, metadata !891, metadata !3604}
!3612 = metadata !{i32 52, i32 0, metadata !891, metadata !3604}
!3613 = metadata !{i32 53, i32 0, metadata !891, metadata !3604}
!3614 = metadata !{i32 109, i32 0, metadata !779, null}
!3615 = metadata !{i32 112, i32 0, metadata !787, null}
!3616 = metadata !{i32 113, i32 0, metadata !787, null}
!3617 = metadata !{i32 42, i32 0, metadata !891, metadata !3618}
!3618 = metadata !{i32 114, i32 0, metadata !787, null}
!3619 = metadata !{i32 44, i32 0, metadata !891, metadata !3618}
!3620 = metadata !{i32 45, i32 0, metadata !891, metadata !3618}
!3621 = metadata !{i32 46, i32 0, metadata !891, metadata !3618}
!3622 = metadata !{i32 47, i32 0, metadata !891, metadata !3618}
!3623 = metadata !{i32 48, i32 0, metadata !891, metadata !3618}
!3624 = metadata !{i32 50, i32 0, metadata !891, metadata !3618}
!3625 = metadata !{i32 51, i32 0, metadata !891, metadata !3618}
!3626 = metadata !{i32 52, i32 0, metadata !891, metadata !3618}
!3627 = metadata !{i32 53, i32 0, metadata !891, metadata !3618}
!3628 = metadata !{i32 116, i32 0, metadata !787, null}
!3629 = metadata !{i32 119, i32 0, metadata !794, null}
!3630 = metadata !{i32 120, i32 0, metadata !794, null}
!3631 = metadata !{i32 42, i32 0, metadata !891, metadata !3632}
!3632 = metadata !{i32 121, i32 0, metadata !794, null}
!3633 = metadata !{i32 44, i32 0, metadata !891, metadata !3632}
!3634 = metadata !{i32 45, i32 0, metadata !891, metadata !3632}
!3635 = metadata !{i32 46, i32 0, metadata !891, metadata !3632}
!3636 = metadata !{i32 47, i32 0, metadata !891, metadata !3632}
!3637 = metadata !{i32 48, i32 0, metadata !891, metadata !3632}
!3638 = metadata !{i32 50, i32 0, metadata !891, metadata !3632}
!3639 = metadata !{i32 51, i32 0, metadata !891, metadata !3632}
!3640 = metadata !{i32 52, i32 0, metadata !891, metadata !3632}
!3641 = metadata !{i32 53, i32 0, metadata !891, metadata !3632}
!3642 = metadata !{i32 123, i32 0, metadata !794, null}
!3643 = metadata !{i32 126, i32 0, metadata !800, null}
!3644 = metadata !{i32 127, i32 0, metadata !800, null}
!3645 = metadata !{i32 42, i32 0, metadata !891, metadata !3646}
!3646 = metadata !{i32 128, i32 0, metadata !800, null}
!3647 = metadata !{i32 44, i32 0, metadata !891, metadata !3646}
!3648 = metadata !{i32 45, i32 0, metadata !891, metadata !3646}
!3649 = metadata !{i32 46, i32 0, metadata !891, metadata !3646}
!3650 = metadata !{i32 47, i32 0, metadata !891, metadata !3646}
!3651 = metadata !{i32 48, i32 0, metadata !891, metadata !3646}
!3652 = metadata !{i32 50, i32 0, metadata !891, metadata !3646}
!3653 = metadata !{i32 51, i32 0, metadata !891, metadata !3646}
!3654 = metadata !{i32 52, i32 0, metadata !891, metadata !3646}
!3655 = metadata !{i32 53, i32 0, metadata !891, metadata !3646}
!3656 = metadata !{i32 130, i32 0, metadata !800, null}
!3657 = metadata !{i32 133, i32 0, metadata !809, null}
!3658 = metadata !{i32 134, i32 0, metadata !809, null}
!3659 = metadata !{i32 42, i32 0, metadata !891, metadata !3660}
!3660 = metadata !{i32 135, i32 0, metadata !809, null}
!3661 = metadata !{i32 44, i32 0, metadata !891, metadata !3660}
!3662 = metadata !{i32 45, i32 0, metadata !891, metadata !3660}
!3663 = metadata !{i32 46, i32 0, metadata !891, metadata !3660}
!3664 = metadata !{i32 47, i32 0, metadata !891, metadata !3660}
!3665 = metadata !{i32 48, i32 0, metadata !891, metadata !3660}
!3666 = metadata !{i32 50, i32 0, metadata !891, metadata !3660}
!3667 = metadata !{i32 51, i32 0, metadata !891, metadata !3660}
!3668 = metadata !{i32 52, i32 0, metadata !891, metadata !3660}
!3669 = metadata !{i32 53, i32 0, metadata !891, metadata !3660}
!3670 = metadata !{i32 137, i32 0, metadata !809, null}
!3671 = metadata !{i32 140, i32 0, metadata !817, null}
!3672 = metadata !{i32 162, i32 0, metadata !823, null}
!3673 = metadata !{i32 169, i32 0, metadata !848, null}
!3674 = metadata !{i32 170, i32 0, metadata !848, null}
!3675 = metadata !{i32 172, i32 0, metadata !879, null}
!3676 = metadata !{i32 173, i32 0, metadata !878, null}
!3677 = metadata !{i32 174, i32 0, metadata !878, null}
!3678 = metadata !{i32 176, i32 0, metadata !881, null}
!3679 = metadata !{i32 183, i32 0, metadata !881, null}
!3680 = metadata !{metadata !3681, metadata !3040, i64 16}
!3681 = metadata !{metadata !"dirent", metadata !2161, i64 0, metadata !2161, i64 8, metadata !3040, i64 16, metadata !2143, i64 18, metadata !2143, i64 19}
!3682 = metadata !{i32 187, i32 0, metadata !848, null}
!3683 = metadata !{i32 48, i32 0, metadata !912, null}
!3684 = metadata !{i32 51, i32 0, metadata !911, null}
!3685 = metadata !{i32 52, i32 0, metadata !911, null}
!3686 = metadata !{i32 53, i32 0, metadata !911, null}
!3687 = metadata !{i32 54, i32 0, metadata !911, null}
!3688 = metadata !{i32 56, i32 0, metadata !901, null}
!3689 = metadata !{i32 62, i32 0, metadata !932, null}
!3690 = metadata !{i32 65, i32 0, metadata !931, null}
!3691 = metadata !{i32 66, i32 0, metadata !931, null}
!3692 = metadata !{i32 67, i32 0, metadata !931, null}
!3693 = metadata !{i32 68, i32 0, metadata !931, null}
!3694 = metadata !{i32 70, i32 0, metadata !924, null}
!3695 = metadata !{i32 74, i32 0, metadata !933, null}
!3696 = metadata !{i32 78, i32 0, metadata !942, null}
!3697 = metadata !{i32 82, i32 0, metadata !971, null}
!3698 = metadata !{i32 86, i32 0, metadata !977, null}
!3699 = metadata !{i32 90, i32 0, metadata !982, null}
!3700 = metadata !{i32 94, i32 0, metadata !986, null}
!3701 = metadata !{i32 98, i32 0, metadata !993, null}
!3702 = metadata !{i32 102, i32 0, metadata !999, null}
!3703 = metadata !{i32 107, i32 0, metadata !1005, null}
!3704 = metadata !{i32 111, i32 0, metadata !1032, null}
!3705 = metadata !{i32 114, i32 0, metadata !1051, null}
!3706 = metadata !{i32 115, i32 0, metadata !1051, null}
!3707 = metadata !{i32 503, i32 0, metadata !3708, metadata !3709}
!3708 = metadata !{i32 786443, metadata !1119, metadata !1118} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX//usr/include/x86_64-linux-gnu/sys/stat.h]
!3709 = metadata !{i32 117, i32 0, metadata !1051, null}
!3710 = metadata !{i32 119, i32 0, metadata !1051, null}
!3711 = metadata !{i32 120, i32 0, metadata !1051, null}
!3712 = metadata !{i32 121, i32 0, metadata !3713, null}
!3713 = metadata !{i32 786443, metadata !1052, metadata !1051, i32 121, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!3714 = metadata !{i32 122, i32 0, metadata !3715, null}
!3715 = metadata !{i32 786443, metadata !1052, metadata !3713, i32 121, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!3716 = metadata !{i32 123, i32 0, metadata !3715, null}
!3717 = metadata !{i32 127, i32 0, metadata !3718, null}
!3718 = metadata !{i32 786443, metadata !1052, metadata !1051, i32 127, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!3719 = metadata !{i32 128, i32 0, metadata !3720, null}
!3720 = metadata !{i32 786443, metadata !1052, metadata !3718, i32 127, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!3721 = metadata !{metadata !2149, metadata !2151, i64 8}
!3722 = metadata !{i32 129, i32 0, metadata !3720, null}
!3723 = metadata !{i32 130, i32 0, metadata !3720, null}
!3724 = metadata !{i32 131, i32 0, metadata !3720, null}
!3725 = metadata !{i32 132, i32 0, metadata !3718, null}
!3726 = metadata !{i32 134, i32 0, metadata !1051, null}
!3727 = metadata !{i32 135, i32 0, metadata !3728, null}
!3728 = metadata !{i32 786443, metadata !1052, metadata !1051, i32 135, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!3729 = metadata !{i32 136, i32 0, metadata !3730, null}
!3730 = metadata !{i32 786443, metadata !1052, metadata !3728, i32 135, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!3731 = metadata !{i32 137, i32 0, metadata !3730, null}
!3732 = metadata !{i32 138, i32 0, metadata !3730, null}
!3733 = metadata !{i32 139, i32 0, metadata !3730, null}
!3734 = metadata !{i32 140, i32 0, metadata !3730, null}
!3735 = metadata !{i32 142, i32 0, metadata !3730, null}
!3736 = metadata !{i32 143, i32 0, metadata !3730, null}
!3737 = metadata !{i32 144, i32 0, metadata !3730, null}
!3738 = metadata !{i32 145, i32 0, metadata !3730, null}
!3739 = metadata !{i32 146, i32 0, metadata !3730, null}
!3740 = metadata !{i32 147, i32 0, metadata !3730, null}
!3741 = metadata !{i32 150, i32 0, metadata !3742, null}
!3742 = metadata !{i32 786443, metadata !1052, metadata !1051, i32 150, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!3743 = metadata !{i32 151, i32 0, metadata !3744, null}
!3744 = metadata !{i32 786443, metadata !1052, metadata !3742, i32 150, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!3745 = metadata !{i32 152, i32 0, metadata !3744, null}
!3746 = metadata !{i32 153, i32 0, metadata !3744, null}
!3747 = metadata !{i32 154, i32 0, metadata !3744, null}
!3748 = metadata !{i32 155, i32 0, metadata !3744, null}
!3749 = metadata !{i32 156, i32 0, metadata !3742, null}
!3750 = metadata !{i32 158, i32 0, metadata !1051, null}
!3751 = metadata !{i32 97, i32 0, metadata !1090, metadata !3752}
!3752 = metadata !{i32 159, i32 0, metadata !1051, null}
!3753 = metadata !{i32 99, i32 0, metadata !1090, metadata !3752}
!3754 = metadata !{i32 100, i32 0, metadata !1090, metadata !3752}
!3755 = metadata !{metadata !2193, metadata !2150, i64 772}
!3756 = metadata !{i32 160, i32 0, metadata !1051, null}
!3757 = metadata !{i32 161, i32 0, metadata !1051, null}
!3758 = metadata !{i32 23, i32 0, metadata !1164, null}
!3759 = metadata !{i32 24, i32 0, metadata !1164, null}
!3760 = metadata !{i32 25, i32 0, metadata !1164, null}
!3761 = metadata !{i32 30, i32 0, metadata !1174, null}
!3762 = metadata !{i32 31, i32 0, metadata !1174, null}
!3763 = metadata !{i32 35, i32 0, metadata !1196, null}
!3764 = metadata !{i32 55, i32 0, metadata !1202, null}
!3765 = metadata !{i32 56, i32 0, metadata !1208, null}
!3766 = metadata !{i32 57, i32 0, metadata !1212, null}
!3767 = metadata !{i32 58, i32 0, metadata !1216, null} ; [ DW_TAG_imported_module ]
!3768 = metadata !{i32 59, i32 0, metadata !1224, null}
!3769 = metadata !{i32 60, i32 0, metadata !1228, null}
!3770 = metadata !{i32 63, i32 0, metadata !1235, null}
!3771 = metadata !{i32 64, i32 0, metadata !1235, null}
!3772 = metadata !{i32 65, i32 0, metadata !1235, null}
!3773 = metadata !{i32 63, i32 0, metadata !1235, metadata !3774}
!3774 = metadata !{i32 69, i32 0, metadata !1238, null}
!3775 = metadata !{i32 64, i32 0, metadata !1235, metadata !3774}
!3776 = metadata !{i32 86, i32 0, metadata !1244, null}
!3777 = metadata !{i32 87, i32 0, metadata !1244, null}
!3778 = metadata !{metadata !2151, metadata !2151, i64 0}
!3779 = metadata !{i32 90, i32 0, metadata !1244, null}
!3780 = metadata !{i32 98, i32 0, metadata !1244, null}
!3781 = metadata !{i32 102, i32 0, metadata !1244, null}
!3782 = metadata !{i32 105, i32 0, metadata !3783, null}
!3783 = metadata !{i32 786443, metadata !1245, metadata !1244, i32 105, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3784 = metadata !{i32 54, i32 0, metadata !1332, metadata !3782}
!3785 = metadata !{i32 55, i32 0, metadata !3786, metadata !3782}
!3786 = metadata !{i32 786443, metadata !1245, metadata !3787, i32 55, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3787 = metadata !{i32 786443, metadata !1245, metadata !1332, i32 54, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3788 = metadata !{i32 57, i32 0, metadata !3787, metadata !3782}
!3789 = metadata !{i32 58, i32 0, metadata !3787, metadata !3782} ; [ DW_TAG_imported_module ]
!3790 = metadata !{i32 123, i32 0, metadata !1244, null}
!3791 = metadata !{i32 130, i32 0, metadata !1280, null}
!3792 = metadata !{i32 106, i32 0, metadata !3793, null}
!3793 = metadata !{i32 786443, metadata !1245, metadata !3783, i32 105, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3794 = metadata !{i32 124, i32 0, metadata !1281, null}
!3795 = metadata !{i32 54, i32 0, metadata !1332, metadata !3794}
!3796 = metadata !{i32 55, i32 0, metadata !3786, metadata !3794}
!3797 = metadata !{i32 57, i32 0, metadata !3787, metadata !3794}
!3798 = metadata !{i32 58, i32 0, metadata !3787, metadata !3794} ; [ DW_TAG_imported_module ]
!3799 = metadata !{i32 126, i32 0, metadata !3800, null}
!3800 = metadata !{i32 786443, metadata !1245, metadata !1280, i32 126, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3801 = metadata !{i32 127, i32 0, metadata !3800, null}
!3802 = metadata !{i32 129, i32 0, metadata !1280, null}
!3803 = metadata !{i32 34, i32 0, metadata !3804, metadata !3802}
!3804 = metadata !{i32 786443, metadata !1245, metadata !1319, i32 34, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3805 = metadata !{i32 36, i32 0, metadata !1319, metadata !3802}
!3806 = metadata !{i32 39, i32 0, metadata !3807, metadata !3802}
!3807 = metadata !{i32 786443, metadata !1245, metadata !3808, i32 39, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3808 = metadata !{i32 786443, metadata !1245, metadata !3809, i32 37, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3809 = metadata !{i32 786443, metadata !1245, metadata !1319, i32 36, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3810 = metadata !{i32 37, i32 0, metadata !3808, metadata !3802}
!3811 = metadata !{i32 40, i32 0, metadata !3812, metadata !3802}
!3812 = metadata !{i32 786443, metadata !1245, metadata !3807, i32 39, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3813 = metadata !{i32 42, i32 0, metadata !3814, metadata !3802}
!3814 = metadata !{i32 786443, metadata !1245, metadata !3807, i32 41, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3815 = metadata !{i32 132, i32 0, metadata !1280, null}
!3816 = metadata !{i32 77, i32 0, metadata !3817, metadata !3818}
!3817 = metadata !{i32 786443, metadata !1245, metadata !1311, i32 77, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3818 = metadata !{i32 131, i32 0, metadata !1280, null}
!3819 = metadata !{i32 78, i32 0, metadata !3820, metadata !3818}
!3820 = metadata !{i32 786443, metadata !1245, metadata !3817, i32 77, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3821 = metadata !{i32 80, i32 0, metadata !3822, metadata !3818}
!3822 = metadata !{i32 786443, metadata !1245, metadata !3817, i32 79, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3823 = metadata !{i32 81, i32 0, metadata !3822, metadata !3818}
!3824 = metadata !{i32 134, i32 0, metadata !1280, null}
!3825 = metadata !{i32 55, i32 0, metadata !3786, metadata !3826}
!3826 = metadata !{i32 135, i32 0, metadata !1285, null}
!3827 = metadata !{i32 57, i32 0, metadata !3787, metadata !3826}
!3828 = metadata !{i32 58, i32 0, metadata !3787, metadata !3826} ; [ DW_TAG_imported_module ]
!3829 = metadata !{i32 54, i32 0, metadata !1332, metadata !3826}
!3830 = metadata !{i32 139, i32 0, metadata !3831, null}
!3831 = metadata !{i32 786443, metadata !1245, metadata !1284, i32 139, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3832 = metadata !{i32 140, i32 0, metadata !3831, null}
!3833 = metadata !{i32 142, i32 0, metadata !1284, null}
!3834 = metadata !{i32 143, i32 0, metadata !1284, null}
!3835 = metadata !{i32 34, i32 0, metadata !3804, metadata !3834}
!3836 = metadata !{i32 36, i32 0, metadata !1319, metadata !3834}
!3837 = metadata !{i32 39, i32 0, metadata !3807, metadata !3834}
!3838 = metadata !{i32 37, i32 0, metadata !3808, metadata !3834}
!3839 = metadata !{i32 40, i32 0, metadata !3812, metadata !3834}
!3840 = metadata !{i32 42, i32 0, metadata !3814, metadata !3834}
!3841 = metadata !{i32 144, i32 0, metadata !1284, null}
!3842 = metadata !{i32 34, i32 0, metadata !3804, metadata !3841}
!3843 = metadata !{i32 36, i32 0, metadata !1319, metadata !3841}
!3844 = metadata !{i32 39, i32 0, metadata !3807, metadata !3841}
!3845 = metadata !{i32 37, i32 0, metadata !3808, metadata !3841}
!3846 = metadata !{i32 40, i32 0, metadata !3812, metadata !3841}
!3847 = metadata !{i32 42, i32 0, metadata !3814, metadata !3841}
!3848 = metadata !{i32 145, i32 0, metadata !1284, null}
!3849 = metadata !{i32 34, i32 0, metadata !3804, metadata !3848}
!3850 = metadata !{i32 36, i32 0, metadata !1319, metadata !3848}
!3851 = metadata !{i32 39, i32 0, metadata !3807, metadata !3848}
!3852 = metadata !{i32 37, i32 0, metadata !3808, metadata !3848}
!3853 = metadata !{i32 40, i32 0, metadata !3812, metadata !3848}
!3854 = metadata !{i32 42, i32 0, metadata !3814, metadata !3848}
!3855 = metadata !{i32 147, i32 0, metadata !1284, null}
!3856 = metadata !{i32 148, i32 0, metadata !3857, null}
!3857 = metadata !{i32 786443, metadata !1245, metadata !1284, i32 148, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3858 = metadata !{i32 149, i32 0, metadata !3859, null}
!3859 = metadata !{i32 786443, metadata !1245, metadata !3857, i32 148, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3860 = metadata !{i32 151, i32 0, metadata !3859, null}
!3861 = metadata !{i32 77, i32 0, metadata !3817, metadata !3862}
!3862 = metadata !{i32 150, i32 0, metadata !3859, null}
!3863 = metadata !{i32 78, i32 0, metadata !3820, metadata !3862}
!3864 = metadata !{i32 80, i32 0, metadata !3822, metadata !3862}
!3865 = metadata !{i32 81, i32 0, metadata !3822, metadata !3862}
!3866 = metadata !{i32 55, i32 0, metadata !3786, metadata !3867}
!3867 = metadata !{i32 155, i32 0, metadata !1288, null}
!3868 = metadata !{i32 57, i32 0, metadata !3787, metadata !3867}
!3869 = metadata !{i32 58, i32 0, metadata !3787, metadata !3867} ; [ DW_TAG_imported_module ]
!3870 = metadata !{i32 54, i32 0, metadata !1332, metadata !3867}
!3871 = metadata !{i32 158, i32 0, metadata !3872, null}
!3872 = metadata !{i32 786443, metadata !1245, metadata !1287, i32 158, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3873 = metadata !{i32 159, i32 0, metadata !3872, null}
!3874 = metadata !{i32 161, i32 0, metadata !1287, null}
!3875 = metadata !{i32 162, i32 0, metadata !1287, null}
!3876 = metadata !{i32 34, i32 0, metadata !3804, metadata !3875}
!3877 = metadata !{i32 36, i32 0, metadata !1319, metadata !3875}
!3878 = metadata !{i32 39, i32 0, metadata !3807, metadata !3875}
!3879 = metadata !{i32 37, i32 0, metadata !3808, metadata !3875}
!3880 = metadata !{i32 40, i32 0, metadata !3812, metadata !3875}
!3881 = metadata !{i32 42, i32 0, metadata !3814, metadata !3875}
!3882 = metadata !{i32 163, i32 0, metadata !1287, null}
!3883 = metadata !{i32 34, i32 0, metadata !3804, metadata !3882}
!3884 = metadata !{i32 36, i32 0, metadata !1319, metadata !3882}
!3885 = metadata !{i32 39, i32 0, metadata !3807, metadata !3882}
!3886 = metadata !{i32 37, i32 0, metadata !3808, metadata !3882}
!3887 = metadata !{i32 40, i32 0, metadata !3812, metadata !3882}
!3888 = metadata !{i32 42, i32 0, metadata !3814, metadata !3882}
!3889 = metadata !{i32 165, i32 0, metadata !1287, null}
!3890 = metadata !{i32 55, i32 0, metadata !3786, metadata !3891}
!3891 = metadata !{i32 165, i32 0, metadata !1291, null}
!3892 = metadata !{i32 57, i32 0, metadata !3787, metadata !3891}
!3893 = metadata !{i32 58, i32 0, metadata !3787, metadata !3891} ; [ DW_TAG_imported_module ]
!3894 = metadata !{i32 54, i32 0, metadata !1332, metadata !3891}
!3895 = metadata !{i32 55, i32 0, metadata !3786, metadata !3896}
!3896 = metadata !{i32 166, i32 0, metadata !1291, null}
!3897 = metadata !{i32 57, i32 0, metadata !3787, metadata !3896}
!3898 = metadata !{i32 58, i32 0, metadata !3787, metadata !3896} ; [ DW_TAG_imported_module ]
!3899 = metadata !{i32 54, i32 0, metadata !1332, metadata !3896}
!3900 = metadata !{i32 170, i32 0, metadata !3901, null}
!3901 = metadata !{i32 786443, metadata !1245, metadata !1290, i32 170, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3902 = metadata !{i32 171, i32 0, metadata !3901, null}
!3903 = metadata !{i32 173, i32 0, metadata !1290, null}
!3904 = metadata !{i32 34, i32 0, metadata !3804, metadata !3903}
!3905 = metadata !{i32 36, i32 0, metadata !1319, metadata !3903}
!3906 = metadata !{i32 39, i32 0, metadata !3807, metadata !3903}
!3907 = metadata !{i32 37, i32 0, metadata !3808, metadata !3903}
!3908 = metadata !{i32 40, i32 0, metadata !3812, metadata !3903}
!3909 = metadata !{i32 42, i32 0, metadata !3814, metadata !3903}
!3910 = metadata !{i32 174, i32 0, metadata !1290, null}
!3911 = metadata !{i32 55, i32 0, metadata !3786, metadata !3912}
!3912 = metadata !{i32 174, i32 0, metadata !1297, null}
!3913 = metadata !{i32 57, i32 0, metadata !3787, metadata !3912}
!3914 = metadata !{i32 58, i32 0, metadata !3787, metadata !3912} ; [ DW_TAG_imported_module ]
!3915 = metadata !{i32 54, i32 0, metadata !1332, metadata !3912}
!3916 = metadata !{i32 55, i32 0, metadata !3786, metadata !3917}
!3917 = metadata !{i32 175, i32 0, metadata !1297, null}
!3918 = metadata !{i32 57, i32 0, metadata !3787, metadata !3917}
!3919 = metadata !{i32 58, i32 0, metadata !3787, metadata !3917} ; [ DW_TAG_imported_module ]
!3920 = metadata !{i32 54, i32 0, metadata !1332, metadata !3917}
!3921 = metadata !{i32 177, i32 0, metadata !3922, null}
!3922 = metadata !{i32 786443, metadata !1245, metadata !1297, i32 175, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3923 = metadata !{i32 178, i32 0, metadata !3922, null}
!3924 = metadata !{i32 55, i32 0, metadata !3786, metadata !3925}
!3925 = metadata !{i32 179, i32 0, metadata !1296, null}
!3926 = metadata !{i32 57, i32 0, metadata !3787, metadata !3925}
!3927 = metadata !{i32 58, i32 0, metadata !3787, metadata !3925} ; [ DW_TAG_imported_module ]
!3928 = metadata !{i32 54, i32 0, metadata !1332, metadata !3925}
!3929 = metadata !{i32 181, i32 0, metadata !3930, null}
!3930 = metadata !{i32 786443, metadata !1245, metadata !1296, i32 179, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3931 = metadata !{i32 182, i32 0, metadata !3930, null}
!3932 = metadata !{i32 55, i32 0, metadata !3786, metadata !3933}
!3933 = metadata !{i32 183, i32 0, metadata !1295, null}
!3934 = metadata !{i32 57, i32 0, metadata !3787, metadata !3933}
!3935 = metadata !{i32 58, i32 0, metadata !3787, metadata !3933} ; [ DW_TAG_imported_module ]
!3936 = metadata !{i32 54, i32 0, metadata !1332, metadata !3933}
!3937 = metadata !{i32 185, i32 0, metadata !3938, null}
!3938 = metadata !{i32 786443, metadata !1245, metadata !1295, i32 183, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3939 = metadata !{i32 186, i32 0, metadata !3938, null}
!3940 = metadata !{i32 55, i32 0, metadata !3786, metadata !3941}
!3941 = metadata !{i32 187, i32 0, metadata !1294, null}
!3942 = metadata !{i32 57, i32 0, metadata !3787, metadata !3941}
!3943 = metadata !{i32 58, i32 0, metadata !3787, metadata !3941} ; [ DW_TAG_imported_module ]
!3944 = metadata !{i32 54, i32 0, metadata !1332, metadata !3941}
!3945 = metadata !{i32 189, i32 0, metadata !3946, null}
!3946 = metadata !{i32 786443, metadata !1245, metadata !1293, i32 189, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3947 = metadata !{i32 190, i32 0, metadata !3946, null}
!3948 = metadata !{i32 192, i32 0, metadata !1293, null}
!3949 = metadata !{i32 34, i32 0, metadata !3804, metadata !3948}
!3950 = metadata !{i32 36, i32 0, metadata !1319, metadata !3948}
!3951 = metadata !{i32 39, i32 0, metadata !3807, metadata !3948}
!3952 = metadata !{i32 37, i32 0, metadata !3808, metadata !3948}
!3953 = metadata !{i32 40, i32 0, metadata !3812, metadata !3948}
!3954 = metadata !{i32 42, i32 0, metadata !3814, metadata !3948}
!3955 = metadata !{i32 193, i32 0, metadata !1293, null}
!3956 = metadata !{i32 77, i32 0, metadata !3817, metadata !3957}
!3957 = metadata !{i32 196, i32 0, metadata !3958, null}
!3958 = metadata !{i32 786443, metadata !1245, metadata !1294, i32 194, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!3959 = metadata !{i32 78, i32 0, metadata !3820, metadata !3957}
!3960 = metadata !{i32 80, i32 0, metadata !3822, metadata !3957}
!3961 = metadata !{i32 81, i32 0, metadata !3822, metadata !3957}
!3962 = metadata !{i32 200, i32 0, metadata !1244, null}
!3963 = metadata !{i32 201, i32 0, metadata !1244, null}
!3964 = metadata !{i32 202, i32 0, metadata !1244, null}
!3965 = metadata !{i32 203, i32 0, metadata !1244, null}
!3966 = metadata !{i32 205, i32 0, metadata !1244, null}
!3967 = metadata !{i32 206, i32 0, metadata !1244, null}
!3968 = metadata !{i32 208, i32 0, metadata !1244, null}
!3969 = metadata !{i32 210, i32 0, metadata !1244, null}
!3970 = metadata !{i32 42, i32 0, metadata !1377, null}
!3971 = metadata !{i32 43, i32 0, metadata !1377, null}
!3972 = metadata !{i32 51, i32 0, metadata !1487, null}
!3973 = metadata !{i32 52, i32 0, metadata !1487, null}
!3974 = metadata !{i32 58, i32 0, metadata !1494, null} ; [ DW_TAG_imported_module ]
!3975 = metadata !{i32 59, i32 0, metadata !1494, null}
!3976 = metadata !{i32 65, i32 0, metadata !1505, null}
!3977 = metadata !{i32 71, i32 0, metadata !1508, null}
!3978 = metadata !{i32 80, i32 0, metadata !1509, null}
!3979 = metadata !{i32 81, i32 0, metadata !1509, null}
!3980 = metadata !{i32 82, i32 0, metadata !1509, null}
!3981 = metadata !{i32 87, i32 0, metadata !1515, null}
!3982 = metadata !{i32 92, i32 0, metadata !1568, null}
!3983 = metadata !{i32 97, i32 0, metadata !1574, null}
!3984 = metadata !{i32 98, i32 0, metadata !1574, null}
!3985 = metadata !{i32 99, i32 0, metadata !1574, null}
!3986 = metadata !{i32 104, i32 0, metadata !1582, null}
!3987 = metadata !{i32 105, i32 0, metadata !1582, null}
!3988 = metadata !{i32 106, i32 0, metadata !1582, null}
!3989 = metadata !{i32 111, i32 0, metadata !1586, null}
!3990 = metadata !{i32 112, i32 0, metadata !1586, null}
!3991 = metadata !{i32 113, i32 0, metadata !1586, null}
!3992 = metadata !{i32 118, i32 0, metadata !1595, null}
!3993 = metadata !{i32 119, i32 0, metadata !1595, null}
!3994 = metadata !{i32 120, i32 0, metadata !1595, null}
!3995 = metadata !{i32 125, i32 0, metadata !1600, null}
!3996 = metadata !{i32 126, i32 0, metadata !1600, null}
!3997 = metadata !{i32 127, i32 0, metadata !1600, null}
!3998 = metadata !{i32 132, i32 0, metadata !1604, null}
!3999 = metadata !{i32 133, i32 0, metadata !1604, null}
!4000 = metadata !{i32 134, i32 0, metadata !1604, null}
!4001 = metadata !{i32 139, i32 0, metadata !1608, null}
!4002 = metadata !{i32 140, i32 0, metadata !1608, null}
!4003 = metadata !{i32 141, i32 0, metadata !1608, null}
!4004 = metadata !{i32 146, i32 0, metadata !1612, null}
!4005 = metadata !{i32 154, i32 0, metadata !1625, null}
!4006 = metadata !{i32 155, i32 0, metadata !1625, null}
!4007 = metadata !{metadata !2162, metadata !2161, i64 0}
!4008 = metadata !{i32 156, i32 0, metadata !1625, null}
!4009 = metadata !{metadata !2370, metadata !2161, i64 8}
!4010 = metadata !{metadata !2162, metadata !2161, i64 8}
!4011 = metadata !{i32 157, i32 0, metadata !1625, null}
!4012 = metadata !{i32 162, i32 0, metadata !1638, null}
!4013 = metadata !{i32 163, i32 0, metadata !1638, null}
!4014 = metadata !{i32 164, i32 0, metadata !1638, null}
!4015 = metadata !{i32 169, i32 0, metadata !1644, null}
!4016 = metadata !{i32 170, i32 0, metadata !4017, null}
!4017 = metadata !{i32 786443, metadata !1378, metadata !1644, i32 170, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/stubs.c]
!4018 = metadata !{i32 172, i32 0, metadata !1644, null}
!4019 = metadata !{i32 171, i32 0, metadata !4017, null}
!4020 = metadata !{i32 177, i32 0, metadata !4021, null}
!4021 = metadata !{i32 786443, metadata !1378, metadata !1652, i32 177, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/stubs.c]
!4022 = metadata !{i32 178, i32 0, metadata !4021, null}
!4023 = metadata !{i32 180, i32 0, metadata !4024, null}
!4024 = metadata !{i32 786443, metadata !1378, metadata !4021, i32 179, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/stubs.c]
!4025 = metadata !{i32 186, i32 0, metadata !1652, null}
!4026 = metadata !{i32 191, i32 0, metadata !1666, null}
!4027 = metadata !{i32 196, i32 0, metadata !1671, null}
!4028 = metadata !{i32 197, i32 0, metadata !1671, null}
!4029 = metadata !{i32 201, i32 0, metadata !1672, null}
!4030 = metadata !{i32 202, i32 0, metadata !1672, null}
!4031 = metadata !{i32 206, i32 0, metadata !1673, null}
!4032 = metadata !{i32 207, i32 0, metadata !1673, null}
!4033 = metadata !{i32 212, i32 0, metadata !1676, null}
!4034 = metadata !{i32 217, i32 0, metadata !1680, null}
!4035 = metadata !{i32 222, i32 0, metadata !1684, null}
!4036 = metadata !{i32 227, i32 0, metadata !1691, null}
!4037 = metadata !{i32 228, i32 0, metadata !1691, null}
!4038 = metadata !{i32 229, i32 0, metadata !1691, null}
!4039 = metadata !{i32 234, i32 0, metadata !1704, null}
!4040 = metadata !{i32 235, i32 0, metadata !1704, null}
!4041 = metadata !{i32 236, i32 0, metadata !1704, null}
!4042 = metadata !{i32 240, i32 0, metadata !1717, null}
!4043 = metadata !{i32 245, i32 0, metadata !1719, null}
!4044 = metadata !{i32 250, i32 0, metadata !1725, null}
!4045 = metadata !{i32 255, i32 0, metadata !1728, null}
!4046 = metadata !{i32 262, i32 0, metadata !1734, null}
!4047 = metadata !{i32 267, i32 0, metadata !1739, null}
!4048 = metadata !{i32 268, i32 0, metadata !1739, null}
!4049 = metadata !{i32 273, i32 0, metadata !1747, null}
!4050 = metadata !{i32 274, i32 0, metadata !1747, null}
!4051 = metadata !{i32 275, i32 0, metadata !1747, null}
!4052 = metadata !{i32 280, i32 0, metadata !1753, null}
!4053 = metadata !{i32 281, i32 0, metadata !1753, null}
!4054 = metadata !{i32 282, i32 0, metadata !1753, null}
!4055 = metadata !{i32 287, i32 0, metadata !1835, null}
!4056 = metadata !{i32 288, i32 0, metadata !1835, null}
!4057 = metadata !{i32 289, i32 0, metadata !1835, null}
!4058 = metadata !{i32 294, i32 0, metadata !1843, null}
!4059 = metadata !{i32 295, i32 0, metadata !1843, null}
!4060 = metadata !{i32 296, i32 0, metadata !1843, null}
!4061 = metadata !{i32 301, i32 0, metadata !1850, null}
!4062 = metadata !{i32 302, i32 0, metadata !1850, null}
!4063 = metadata !{i32 303, i32 0, metadata !1850, null}
!4064 = metadata !{i32 381, i32 0, metadata !1861, null}
!4065 = metadata !{i32 382, i32 0, metadata !1861, null}
!4066 = metadata !{i32 383, i32 0, metadata !1861, null}
!4067 = metadata !{i32 388, i32 0, metadata !1870, null}
!4068 = metadata !{i32 389, i32 0, metadata !1870, null}
!4069 = metadata !{i32 390, i32 0, metadata !1870, null}
!4070 = metadata !{i32 395, i32 0, metadata !1873, null}
!4071 = metadata !{i32 396, i32 0, metadata !1873, null}
!4072 = metadata !{i32 397, i32 0, metadata !1873, null}
!4073 = metadata !{i32 402, i32 0, metadata !1877, null}
!4074 = metadata !{i32 403, i32 0, metadata !1877, null}
!4075 = metadata !{i32 404, i32 0, metadata !1877, null}
!4076 = metadata !{i32 409, i32 0, metadata !1881, null}
!4077 = metadata !{i32 410, i32 0, metadata !1881, null}
!4078 = metadata !{i32 411, i32 0, metadata !1881, null}
!4079 = metadata !{i32 416, i32 0, metadata !1884, null}
!4080 = metadata !{i32 417, i32 0, metadata !1884, null}
!4081 = metadata !{i32 422, i32 0, metadata !1887, null}
!4082 = metadata !{i32 423, i32 0, metadata !1887, null}
!4083 = metadata !{i32 424, i32 0, metadata !1887, null}
!4084 = metadata !{i32 429, i32 0, metadata !1895, null}
!4085 = metadata !{i32 430, i32 0, metadata !1895, null}
!4086 = metadata !{i32 431, i32 0, metadata !1895, null}
!4087 = metadata !{i32 436, i32 0, metadata !1901, null}
!4088 = metadata !{i32 437, i32 0, metadata !1901, null}
!4089 = metadata !{i32 438, i32 0, metadata !1901, null}
!4090 = metadata !{i32 443, i32 0, metadata !1907, null}
!4091 = metadata !{i32 444, i32 0, metadata !1907, null}
!4092 = metadata !{i32 445, i32 0, metadata !1907, null}
!4093 = metadata !{i32 450, i32 0, metadata !1908, null}
!4094 = metadata !{i32 451, i32 0, metadata !1908, null}
!4095 = metadata !{i32 452, i32 0, metadata !1908, null}
!4096 = metadata !{i32 457, i32 0, metadata !1916, null}
!4097 = metadata !{i32 458, i32 0, metadata !1916, null}
!4098 = metadata !{i32 459, i32 0, metadata !1916, null}
!4099 = metadata !{i32 464, i32 0, metadata !1923, null}
!4100 = metadata !{i32 465, i32 0, metadata !1923, null}
!4101 = metadata !{i32 466, i32 0, metadata !1923, null}
!4102 = metadata !{i32 471, i32 0, metadata !1931, null}
!4103 = metadata !{i32 472, i32 0, metadata !1931, null}
!4104 = metadata !{i32 473, i32 0, metadata !1931, null}
!4105 = metadata !{i32 478, i32 0, metadata !1946, null}
!4106 = metadata !{i32 479, i32 0, metadata !1946, null}
!4107 = metadata !{i32 480, i32 0, metadata !1946, null}
!4108 = metadata !{i32 485, i32 0, metadata !1960, null}
!4109 = metadata !{i32 486, i32 0, metadata !1960, null}
!4110 = metadata !{i32 487, i32 0, metadata !1960, null}
!4111 = metadata !{i32 492, i32 0, metadata !1963, null}
!4112 = metadata !{i32 493, i32 0, metadata !1963, null}
!4113 = metadata !{i32 494, i32 0, metadata !1963, null}
!4114 = metadata !{i32 499, i32 0, metadata !1976, null}
!4115 = metadata !{i32 500, i32 0, metadata !1976, null}
!4116 = metadata !{i32 505, i32 0, metadata !1981, null}
!4117 = metadata !{i32 506, i32 0, metadata !1981, null}
!4118 = metadata !{i32 507, i32 0, metadata !1981, null}
!4119 = metadata !{i32 512, i32 0, metadata !1984, null}
!4120 = metadata !{i32 513, i32 0, metadata !1984, null}
!4121 = metadata !{i32 514, i32 0, metadata !1984, null}
!4122 = metadata !{i32 519, i32 0, metadata !1990, null}
!4123 = metadata !{i32 520, i32 0, metadata !1990, null}
!4124 = metadata !{i32 521, i32 0, metadata !1990, null}
!4125 = metadata !{i32 526, i32 0, metadata !1994, null}
!4126 = metadata !{i32 527, i32 0, metadata !1994, null}
!4127 = metadata !{i32 528, i32 0, metadata !1994, null}
!4128 = metadata !{i32 533, i32 0, metadata !1995, null}
!4129 = metadata !{i32 534, i32 0, metadata !1995, null}
!4130 = metadata !{i32 535, i32 0, metadata !1995, null}
!4131 = metadata !{i32 540, i32 0, metadata !2006, null}
!4132 = metadata !{i32 541, i32 0, metadata !2006, null}
!4133 = metadata !{i32 542, i32 0, metadata !2006, null}
!4134 = metadata !{i32 547, i32 0, metadata !2017, null}
!4135 = metadata !{i32 548, i32 0, metadata !2017, null}
!4136 = metadata !{i32 549, i32 0, metadata !2017, null}
!4137 = metadata !{i32 554, i32 0, metadata !2027, null}
!4138 = metadata !{i32 555, i32 0, metadata !2027, null}
!4139 = metadata !{i32 556, i32 0, metadata !2027, null}
!4140 = metadata !{i32 48, i32 0, metadata !1096, null}
!4141 = metadata !{i32 50, i32 0, metadata !1096, null}
!4142 = metadata !{i32 51, i32 0, metadata !4143, null}
!4143 = metadata !{i32 786443, metadata !1052, metadata !1096, i32 51, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!4144 = metadata !{i32 53, i32 0, metadata !1096, null}
!4145 = metadata !{i32 52, i32 0, metadata !4143, null}
!4146 = metadata !{i32 55, i32 0, metadata !1096, null}
!4147 = metadata !{i32 57, i32 0, metadata !1096, null}
!4148 = metadata !{i32 58, i32 0, metadata !1096, null} ; [ DW_TAG_imported_module ]
!4149 = metadata !{i32 59, i32 0, metadata !1096, null}
!4150 = metadata !{i32 61, i32 0, metadata !1096, null}
!4151 = metadata !{i32 64, i32 0, metadata !4152, null}
!4152 = metadata !{i32 786443, metadata !1052, metadata !1096, i32 64, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!4153 = metadata !{i32 66, i32 0, metadata !4152, null}
!4154 = metadata !{i32 71, i32 0, metadata !1096, null}
!4155 = metadata !{i32 75, i32 0, metadata !1096, null}
!4156 = metadata !{metadata !2160, metadata !2161, i64 56}
!4157 = metadata !{i32 77, i32 0, metadata !1096, null}
!4158 = metadata !{i32 78, i32 0, metadata !1096, null}
!4159 = metadata !{metadata !2160, metadata !2161, i64 0}
!4160 = metadata !{i32 79, i32 0, metadata !1096, null}
!4161 = metadata !{metadata !2160, metadata !2161, i64 40}
!4162 = metadata !{i32 80, i32 0, metadata !1096, null}
!4163 = metadata !{i32 81, i32 0, metadata !1096, null}
!4164 = metadata !{i32 82, i32 0, metadata !1096, null}
!4165 = metadata !{i32 83, i32 0, metadata !1096, null}
!4166 = metadata !{i32 84, i32 0, metadata !1096, null}
!4167 = metadata !{i32 85, i32 0, metadata !1096, null}
!4168 = metadata !{i32 86, i32 0, metadata !1096, null}
!4169 = metadata !{i32 87, i32 0, metadata !1096, null}
!4170 = metadata !{i32 88, i32 0, metadata !1096, null}
!4171 = metadata !{i32 89, i32 0, metadata !1096, null}
!4172 = metadata !{i32 90, i32 0, metadata !1096, null}
!4173 = metadata !{i32 92, i32 0, metadata !1096, null}
!4174 = metadata !{metadata !2160, metadata !2161, i64 48}
!4175 = metadata !{i32 93, i32 0, metadata !1096, null}
!4176 = metadata !{metadata !2160, metadata !2161, i64 64}
!4177 = metadata !{i32 94, i32 0, metadata !1096, null}
!4178 = metadata !{i32 95, i32 0, metadata !1096, null}
!4179 = metadata !{i32 24, i32 0, metadata !1327, null}
!4180 = metadata !{i32 65, i32 0, metadata !1298, null}
!4181 = metadata !{i32 66, i32 0, metadata !1298, null}
!4182 = metadata !{i32 67, i32 0, metadata !1298, null}
!4183 = metadata !{i32 69, i32 0, metadata !4184, null}
!4184 = metadata !{i32 786443, metadata !1245, metadata !1298, i32 69, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!4185 = metadata !{i32 70, i32 0, metadata !4184, null}
!4186 = metadata !{i32 50, i32 0, metadata !1306, metadata !4185}
!4187 = metadata !{i32 72, i32 0, metadata !1298, null}
!4188 = metadata !{i32 73, i32 0, metadata !1298, null}
!4189 = metadata !{i32 13, i32 0, metadata !4190, null}
!4190 = metadata !{i32 786443, metadata !2037, metadata !2036, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!4191 = metadata !{i32 14, i32 0, metadata !4190, null}
!4192 = metadata !{i32 15, i32 0, metadata !2036, null}
!4193 = metadata !{i32 15, i32 0, metadata !2047, null}
!4194 = metadata !{i32 16, i32 0, metadata !2047, null}
!4195 = metadata !{i32 21, i32 0, metadata !4196, null}
!4196 = metadata !{i32 786443, metadata !2057, metadata !2056, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!4197 = metadata !{i32 27, i32 0, metadata !4198, null}
!4198 = metadata !{i32 786443, metadata !2057, metadata !4196, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!4199 = metadata !{i32 29, i32 0, metadata !2056, null}
!4200 = metadata !{i32 16, i32 0, metadata !4201, null}
!4201 = metadata !{i32 786443, metadata !2068, metadata !2067, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!4202 = metadata !{i32 17, i32 0, metadata !4201, null}
!4203 = metadata !{i32 19, i32 0, metadata !4204, null}
!4204 = metadata !{i32 786443, metadata !2068, metadata !2067, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!4205 = metadata !{i32 22, i32 0, metadata !4206, null}
!4206 = metadata !{i32 786443, metadata !2068, metadata !4204, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!4207 = metadata !{i32 25, i32 0, metadata !4208, null}
!4208 = metadata !{i32 786443, metadata !2068, metadata !4206, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!4209 = metadata !{i32 26, i32 0, metadata !4210, null}
!4210 = metadata !{i32 786443, metadata !2068, metadata !4208, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!4211 = metadata !{i32 27, i32 0, metadata !4210, null}
!4212 = metadata !{i32 28, i32 0, metadata !4213, null}
!4213 = metadata !{i32 786443, metadata !2068, metadata !4208, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!4214 = metadata !{i32 29, i32 0, metadata !4213, null}
!4215 = metadata !{i32 32, i32 0, metadata !4206, null}
!4216 = metadata !{i32 34, i32 0, metadata !2067, null}
!4217 = metadata !{i32 16, i32 0, metadata !2080, null}
!4218 = metadata !{i32 17, i32 0, metadata !2080, null}
!4219 = metadata !{metadata !4219, metadata !4220, metadata !4221}
!4220 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!4221 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!4222 = metadata !{metadata !4222, metadata !4220, metadata !4221}
!4223 = metadata !{i32 18, i32 0, metadata !2080, null}
!4224 = metadata !{i32 16, i32 0, metadata !4225, null}
!4225 = metadata !{i32 786443, metadata !2096, metadata !2095, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!4226 = metadata !{i32 19, i32 0, metadata !4227, null}
!4227 = metadata !{i32 786443, metadata !2096, metadata !2095, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!4228 = metadata !{i32 20, i32 0, metadata !4229, null}
!4229 = metadata !{i32 786443, metadata !2096, metadata !4227, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!4230 = metadata !{metadata !4230, metadata !4220, metadata !4221}
!4231 = metadata !{metadata !4231, metadata !4220, metadata !4221}
!4232 = metadata !{i32 22, i32 0, metadata !4233, null}
!4233 = metadata !{i32 786443, metadata !2096, metadata !4227, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!4234 = metadata !{i32 24, i32 0, metadata !4233, null}
!4235 = metadata !{i32 23, i32 0, metadata !4233, null}
!4236 = metadata !{metadata !4236, metadata !4220, metadata !4221}
!4237 = metadata !{metadata !4237, metadata !4220, metadata !4221}
!4238 = metadata !{i32 28, i32 0, metadata !2095, null}
!4239 = metadata !{i32 15, i32 0, metadata !2110, null}
!4240 = metadata !{i32 16, i32 0, metadata !2110, null}
!4241 = metadata !{metadata !4241, metadata !4220, metadata !4221}
!4242 = metadata !{metadata !4242, metadata !4220, metadata !4221}
!4243 = metadata !{i32 17, i32 0, metadata !2110, null}
!4244 = metadata !{i32 13, i32 0, metadata !2125, null}
!4245 = metadata !{i32 14, i32 0, metadata !2125, null}
!4246 = metadata !{i32 15, i32 0, metadata !2125, null}
