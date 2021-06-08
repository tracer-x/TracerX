; ModuleID = 'fd.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.exe_sym_env_t = type { [32 x %struct.exe_file_t], i32, i32, i32 }
%struct.exe_file_t = type { i32, i32, i64, %struct.exe_disk_file_t* }
%struct.exe_disk_file_t = type { i32, i8*, %struct.stat64* }
%struct.stat64 = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.exe_file_system_t = type { i32, %struct.exe_disk_file_t*, %struct.exe_disk_file_t*, i32, %struct.exe_disk_file_t*, i32, i32*, i32*, i32*, i32*, i32*, i32*, i32* }
%struct.timeval = type { i64, i64 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.statfs = type { i64, i64, i64, i64, i64, i64, i64, %struct.__fsid_t, i64, i64, i64, [4 x i64] }
%struct.__fsid_t = type { [2 x i32] }
%struct.fd_set = type { [16 x i64] }

@__exe_env = external global %struct.exe_sym_env_t
@.str1 = private unnamed_addr constant [47 x i8] c"Undefined call to open(): O_EXCL w/o O_RDONLY\0A\00", align 1
@.str2 = private unnamed_addr constant [44 x i8] c"symbolic file descriptor, ignoring (ENOENT)\00", align 1
@close.n_calls = internal unnamed_addr global i32 0, align 4
@__exe_fs = external global %struct.exe_file_system_t
@read.n_calls = internal unnamed_addr global i32 0, align 4
@.str3 = private unnamed_addr constant [12 x i8] c"f->off >= 0\00", align 1
@.str4 = private unnamed_addr constant [5 x i8] c"fd.c\00", align 1
@__PRETTY_FUNCTION__.read = private unnamed_addr constant [34 x i8] c"ssize_t read(int, void *, size_t)\00", align 1
@write.n_calls = internal unnamed_addr global i32 0, align 4
@.str5 = private unnamed_addr constant [7 x i8] c"r >= 0\00", align 1
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
@.str11 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (EINVAL)\00", align 1
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
@.str22 = private unnamed_addr constant [17 x i8] c"ignoring (EPERM)\00", align 1
@getcwd.n_calls = internal unnamed_addr global i32 0, align 4
@.str23 = private unnamed_addr constant [18 x i8] c"ignoring (ENOENT)\00", align 1
@.str24 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EPERM)\00", align 1

; Function Attrs: nounwind uwtable
define i32 @access(i8* %pathname, i32 %mode) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !34), !dbg !689
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !35), !dbg !689
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !690), !dbg !692
  %1 = load i8* %pathname, align 1, !dbg !693, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !697), !dbg !693
  %2 = sext i8 %1 to i32, !dbg !698
  %3 = icmp eq i8 %1, 0, !dbg !698
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !698

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %pathname, i64 1, !dbg !698
  %6 = load i8* %5, align 1, !dbg !698, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !698
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !698

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !700, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !700
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !700

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !700
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !700

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !705
  %12 = ashr exact i32 %sext.i, 24, !dbg !705
  %13 = add nsw i32 %12, 65, !dbg !705
  %14 = icmp eq i32 %2, %13, !dbg !705
  %15 = add i32 %i.02.i, 1, !dbg !700
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !706), !dbg !700
  br i1 %14, label %16, label %10, !dbg !705

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !707
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !707, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !709
  %20 = load %struct.stat64** %19, align 8, !dbg !709, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !709
  %22 = load i64* %21, align 8, !dbg !709, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !709
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !707
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !717
  %or.cond = or i1 %23, %25, !dbg !709
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %56, !dbg !709

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !718) #5, !dbg !720
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !721) #5, !dbg !723
  %26 = ptrtoint i8* %pathname to i64, !dbg !724
  %27 = tail call i64 @klee_get_valuel(i64 %26) #5, !dbg !724
  %28 = inttoptr i64 %27 to i8*, !dbg !724
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !725) #5, !dbg !724
  %29 = icmp eq i8* %28, %pathname, !dbg !726
  %30 = zext i1 %29 to i64, !dbg !726
  tail call void @klee_assume(i64 %30) #5, !dbg !726
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !727) #5, !dbg !722
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !728) #5, !dbg !729
  br label %31, !dbg !729

; <label>:31                                      ; preds = %48, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %49, %48 ]
  %sc.0.i = phi i8* [ %28, %__get_sym_file.exit.thread ], [ %sc.1.i, %48 ]
  %32 = load i8* %sc.0.i, align 1, !dbg !730, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %32}, i64 0, metadata !731) #5, !dbg !730
  %33 = add i32 %i.0.i, -1, !dbg !732
  %34 = and i32 %33, %i.0.i, !dbg !732
  %35 = icmp eq i32 %34, 0, !dbg !732
  br i1 %35, label %36, label %40, !dbg !732

; <label>:36                                      ; preds = %31
  switch i8 %32, label %48 [
    i8 0, label %37
    i8 47, label %38
  ], !dbg !733

; <label>:37                                      ; preds = %36
  store i8 0, i8* %sc.0.i, align 1, !dbg !736, !tbaa !694
  br label %__concretize_string.exit, !dbg !738

; <label>:38                                      ; preds = %36
  %39 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !739
  tail call void @llvm.dbg.value(metadata !{i8* %39}, i64 0, metadata !727) #5, !dbg !739
  store i8 47, i8* %sc.0.i, align 1, !dbg !739, !tbaa !694
  br label %48, !dbg !742

; <label>:40                                      ; preds = %31
  %41 = sext i8 %32 to i64, !dbg !743
  %42 = tail call i64 @klee_get_valuel(i64 %41) #5, !dbg !743
  %43 = trunc i64 %42 to i8, !dbg !743
  tail call void @llvm.dbg.value(metadata !{i8 %43}, i64 0, metadata !744) #5, !dbg !743
  %44 = icmp eq i8 %43, %32, !dbg !745
  %45 = zext i1 %44 to i64, !dbg !745
  tail call void @klee_assume(i64 %45) #5, !dbg !745
  %46 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !746
  tail call void @llvm.dbg.value(metadata !{i8* %46}, i64 0, metadata !727) #5, !dbg !746
  store i8 %43, i8* %sc.0.i, align 1, !dbg !746, !tbaa !694
  %47 = icmp eq i8 %43, 0, !dbg !747
  br i1 %47, label %__concretize_string.exit, label %48, !dbg !747

; <label>:48                                      ; preds = %40, %38, %36
  %sc.1.i = phi i8* [ %46, %40 ], [ %39, %38 ], [ %sc.0.i, %36 ]
  %49 = add i32 %i.0.i, 1, !dbg !729
  tail call void @llvm.dbg.value(metadata !{i32 %49}, i64 0, metadata !728) #5, !dbg !729
  br label %31, !dbg !729

__concretize_string.exit:                         ; preds = %40, %37
  %50 = tail call i64 (i64, ...)* @syscall(i64 21, i8* %pathname, i32 %mode) #5, !dbg !719
  %51 = trunc i64 %50 to i32, !dbg !719
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !86), !dbg !719
  %52 = icmp eq i32 %51, -1, !dbg !749
  br i1 %52, label %53, label %56, !dbg !749

; <label>:53                                      ; preds = %__concretize_string.exit
  %54 = tail call i32 @klee_get_errno() #5, !dbg !751
  %55 = tail call i32* @__errno_location() #1, !dbg !751
  store i32 %54, i32* %55, align 4, !dbg !751, !tbaa !752
  br label %56, !dbg !751

; <label>:56                                      ; preds = %16, %__concretize_string.exit, %53
  %.0 = phi i32 [ -1, %53 ], [ %51, %__concretize_string.exit ], [ 0, %16 ]
  ret i32 %.0, !dbg !753
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare i64 @syscall(i64, ...) #2

declare i32 @klee_get_errno() #3

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #4

; Function Attrs: nounwind uwtable
define i32 @umask(i32 %mask) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %mask}, i64 0, metadata !94), !dbg !754
  %1 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !755, !tbaa !756
  tail call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !95), !dbg !755
  %2 = and i32 %mask, 511, !dbg !758
  store i32 %2, i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !758, !tbaa !756
  ret i32 %1, !dbg !759
}

; Function Attrs: nounwind uwtable
define i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !100), !dbg !760
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !101), !dbg !760
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !102), !dbg !760
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !115), !dbg !761
  br label %4, !dbg !761

; <label>:1                                       ; preds = %4
  %2 = trunc i64 %indvars.iv.next to i32, !dbg !761
  %3 = icmp slt i32 %2, 32, !dbg !761
  br i1 %3, label %4, label %10, !dbg !761

; <label>:4                                       ; preds = %0, %1
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %1 ]
  %fd.04 = phi i32 [ 0, %0 ], [ %9, %1 ]
  %5 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !763
  %6 = load i32* %5, align 4, !dbg !763, !tbaa !765
  %7 = and i32 %6, 1, !dbg !763
  %8 = icmp eq i32 %7, 0, !dbg !763
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !761
  %9 = add nsw i32 %fd.04, 1, !dbg !761
  tail call void @llvm.dbg.value(metadata !{i32 %9}, i64 0, metadata !115), !dbg !761
  br i1 %8, label %10, label %1, !dbg !763

; <label>:10                                      ; preds = %4, %1
  %fd.0.lcssa = phi i32 [ %fd.04, %4 ], [ %9, %1 ]
  %11 = icmp eq i32 %fd.0.lcssa, 32, !dbg !767
  br i1 %11, label %12, label %14, !dbg !767

; <label>:12                                      ; preds = %10
  %13 = tail call i32* @__errno_location() #1, !dbg !769
  store i32 24, i32* %13, align 4, !dbg !769, !tbaa !752
  br label %104, !dbg !771

; <label>:14                                      ; preds = %10
  %15 = sext i32 %fd.0.lcssa to i64, !dbg !772
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %15, !dbg !772
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %16}, i64 0, metadata !104), !dbg !772
  %17 = bitcast %struct.exe_file_t* %16 to i8*, !dbg !773
  tail call void @llvm.memset.p0i8.i64(i8* %17, i8 0, i64 24, i32 8, i1 false), !dbg !773
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !774), !dbg !776
  %18 = load i8* %pathname, align 1, !dbg !777, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %18}, i64 0, metadata !778), !dbg !777
  %19 = sext i8 %18 to i32, !dbg !779
  %20 = icmp eq i8 %18, 0, !dbg !779
  br i1 %20, label %__get_sym_file.exit.thread, label %21, !dbg !779

; <label>:21                                      ; preds = %14
  %22 = getelementptr inbounds i8* %pathname, i64 1, !dbg !779
  %23 = load i8* %22, align 1, !dbg !779, !tbaa !694
  %24 = icmp eq i8 %23, 0, !dbg !779
  br i1 %24, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !779

.preheader.i:                                     ; preds = %21
  %25 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !780, !tbaa !701
  %26 = icmp eq i32 %25, 0, !dbg !780
  br i1 %26, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !780

; <label>:27                                      ; preds = %.lr.ph.i
  %28 = icmp ult i32 %32, %25, !dbg !780
  br i1 %28, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !780

.lr.ph.i:                                         ; preds = %.preheader.i, %27
  %i.02.i = phi i32 [ %32, %27 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !781
  %29 = ashr exact i32 %sext.i, 24, !dbg !781
  %30 = add nsw i32 %29, 65, !dbg !781
  %31 = icmp eq i32 %19, %30, !dbg !781
  %32 = add i32 %i.02.i, 1, !dbg !780
  tail call void @llvm.dbg.value(metadata !{i32 %32}, i64 0, metadata !782), !dbg !780
  br i1 %31, label %33, label %27, !dbg !781

; <label>:33                                      ; preds = %.lr.ph.i
  %34 = zext i32 %i.02.i to i64, !dbg !783
  %35 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !783, !tbaa !708
  %36 = getelementptr inbounds %struct.exe_disk_file_t* %35, i64 %34, i32 2, !dbg !784
  %37 = load %struct.stat64** %36, align 8, !dbg !784, !tbaa !711
  %38 = getelementptr inbounds %struct.stat64* %37, i64 0, i32 1, !dbg !784
  %39 = load i64* %38, align 8, !dbg !784, !tbaa !713
  %40 = icmp eq i64 %39, 0, !dbg !784
  br i1 %40, label %__get_sym_file.exit.thread, label %__get_sym_file.exit, !dbg !784

__get_sym_file.exit:                              ; preds = %33
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %35, i64 %34, !dbg !783
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %41}, i64 0, metadata !103), !dbg !775
  %42 = icmp eq %struct.exe_disk_file_t* %41, null, !dbg !785
  br i1 %42, label %__get_sym_file.exit.thread, label %43, !dbg !785

; <label>:43                                      ; preds = %__get_sym_file.exit
  %44 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %15, i32 3, !dbg !786
  store %struct.exe_disk_file_t* %41, %struct.exe_disk_file_t** %44, align 8, !dbg !786, !tbaa !788
  %45 = and i32 %flags, 192, !dbg !789
  switch i32 %45, label %50 [
    i32 192, label %46
    i32 128, label %48
  ], !dbg !789

; <label>:46                                      ; preds = %43
  %47 = tail call i32* @__errno_location() #1, !dbg !791
  store i32 17, i32* %47, align 4, !dbg !791, !tbaa !752
  br label %104, !dbg !793

; <label>:48                                      ; preds = %43
  tail call void @klee_warning(i8* getelementptr inbounds ([47 x i8]* @.str1, i64 0, i64 0)) #5, !dbg !794
  %49 = tail call i32* @__errno_location() #1, !dbg !797
  store i32 13, i32* %49, align 4, !dbg !797, !tbaa !752
  br label %104, !dbg !798

; <label>:50                                      ; preds = %43
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !799), !dbg !802
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %37}, i64 0, metadata !803), !dbg !802
  %51 = getelementptr inbounds %struct.stat64* %37, i64 0, i32 3, !dbg !804
  %52 = load i32* %51, align 4, !dbg !804, !tbaa !805
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !806), !dbg !804
  %53 = and i32 %flags, 2, !dbg !807
  %54 = icmp eq i32 %53, 0, !dbg !807
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !809), !dbg !810
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !811), !dbg !812
  %55 = and i32 %52, 292, !dbg !814
  %56 = icmp eq i32 %55, 0, !dbg !814
  %or.cond3.i = or i1 %54, %56, !dbg !814
  br i1 %or.cond3.i, label %has_permission.exit, label %has_permission.exit.thread, !dbg !814

has_permission.exit:                              ; preds = %50
  %57 = and i32 %flags, 3, !dbg !816
  %not..i = icmp ne i32 %57, 0, !dbg !816
  %58 = and i32 %52, 146, !dbg !817
  %59 = icmp eq i32 %58, 0, !dbg !817
  %or.cond5.i = and i1 %not..i, %59, !dbg !817
  br i1 %or.cond5.i, label %has_permission.exit.thread, label %61, !dbg !800

has_permission.exit.thread:                       ; preds = %50, %has_permission.exit
  %60 = tail call i32* @__errno_location() #1, !dbg !819
  store i32 13, i32* %60, align 4, !dbg !819, !tbaa !752
  br label %104, !dbg !821

; <label>:61                                      ; preds = %has_permission.exit
  %62 = and i32 %52, -512, !dbg !822
  %63 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !822, !tbaa !756
  %64 = xor i32 %63, -1, !dbg !822
  %65 = and i32 %64, %mode, !dbg !822
  %66 = or i32 %65, %62, !dbg !822
  store i32 %66, i32* %51, align 4, !dbg !822, !tbaa !805
  br label %99, !dbg !823

__get_sym_file.exit.thread:                       ; preds = %27, %.preheader.i, %33, %14, %21, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !824) #5, !dbg !826
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !827) #5, !dbg !829
  %67 = ptrtoint i8* %pathname to i64, !dbg !830
  %68 = tail call i64 @klee_get_valuel(i64 %67) #5, !dbg !830
  %69 = inttoptr i64 %68 to i8*, !dbg !830
  tail call void @llvm.dbg.value(metadata !{i8* %69}, i64 0, metadata !831) #5, !dbg !830
  %70 = icmp eq i8* %69, %pathname, !dbg !832
  %71 = zext i1 %70 to i64, !dbg !832
  tail call void @klee_assume(i64 %71) #5, !dbg !832
  tail call void @llvm.dbg.value(metadata !{i8* %69}, i64 0, metadata !833) #5, !dbg !828
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !834) #5, !dbg !835
  br label %72, !dbg !835

; <label>:72                                      ; preds = %89, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %90, %89 ]
  %sc.0.i = phi i8* [ %69, %__get_sym_file.exit.thread ], [ %sc.1.i, %89 ]
  %73 = load i8* %sc.0.i, align 1, !dbg !836, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %73}, i64 0, metadata !837) #5, !dbg !836
  %74 = add i32 %i.0.i, -1, !dbg !838
  %75 = and i32 %74, %i.0.i, !dbg !838
  %76 = icmp eq i32 %75, 0, !dbg !838
  br i1 %76, label %77, label %81, !dbg !838

; <label>:77                                      ; preds = %72
  switch i8 %73, label %89 [
    i8 0, label %78
    i8 47, label %79
  ], !dbg !839

; <label>:78                                      ; preds = %77
  store i8 0, i8* %sc.0.i, align 1, !dbg !840, !tbaa !694
  br label %__concretize_string.exit, !dbg !841

; <label>:79                                      ; preds = %77
  %80 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !842
  tail call void @llvm.dbg.value(metadata !{i8* %80}, i64 0, metadata !833) #5, !dbg !842
  store i8 47, i8* %sc.0.i, align 1, !dbg !842, !tbaa !694
  br label %89, !dbg !843

; <label>:81                                      ; preds = %72
  %82 = sext i8 %73 to i64, !dbg !844
  %83 = tail call i64 @klee_get_valuel(i64 %82) #5, !dbg !844
  %84 = trunc i64 %83 to i8, !dbg !844
  tail call void @llvm.dbg.value(metadata !{i8 %84}, i64 0, metadata !845) #5, !dbg !844
  %85 = icmp eq i8 %84, %73, !dbg !846
  %86 = zext i1 %85 to i64, !dbg !846
  tail call void @klee_assume(i64 %86) #5, !dbg !846
  %87 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !847
  tail call void @llvm.dbg.value(metadata !{i8* %87}, i64 0, metadata !833) #5, !dbg !847
  store i8 %84, i8* %sc.0.i, align 1, !dbg !847, !tbaa !694
  %88 = icmp eq i8 %84, 0, !dbg !848
  br i1 %88, label %__concretize_string.exit, label %89, !dbg !848

; <label>:89                                      ; preds = %81, %79, %77
  %sc.1.i = phi i8* [ %87, %81 ], [ %80, %79 ], [ %sc.0.i, %77 ]
  %90 = add i32 %i.0.i, 1, !dbg !835
  tail call void @llvm.dbg.value(metadata !{i32 %90}, i64 0, metadata !834) #5, !dbg !835
  br label %72, !dbg !835

__concretize_string.exit:                         ; preds = %81, %78
  %91 = tail call i64 (i64, ...)* @syscall(i64 2, i8* %pathname, i32 %flags, i32 %mode) #5, !dbg !825
  %92 = trunc i64 %91 to i32, !dbg !825
  tail call void @llvm.dbg.value(metadata !{i32 %92}, i64 0, metadata !116), !dbg !825
  %93 = icmp eq i32 %92, -1, !dbg !849
  br i1 %93, label %94, label %97, !dbg !849

; <label>:94                                      ; preds = %__concretize_string.exit
  %95 = tail call i32 @klee_get_errno() #5, !dbg !851
  %96 = tail call i32* @__errno_location() #1, !dbg !851
  store i32 %95, i32* %96, align 4, !dbg !851, !tbaa !752
  br label %104, !dbg !853

; <label>:97                                      ; preds = %__concretize_string.exit
  %98 = getelementptr inbounds %struct.exe_file_t* %16, i64 0, i32 0, !dbg !854
  store i32 %92, i32* %98, align 8, !dbg !854, !tbaa !855
  %.pre = and i32 %flags, 3, !dbg !856
  br label %99

; <label>:99                                      ; preds = %97, %61
  %.pre-phi = phi i32 [ %.pre, %97 ], [ %57, %61 ], !dbg !856
  %100 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %15, i32 1, !dbg !858
  store i32 1, i32* %100, align 4, !dbg !858, !tbaa !765
  switch i32 %.pre-phi, label %103 [
    i32 0, label %101
    i32 1, label %102
  ], !dbg !856

; <label>:101                                     ; preds = %99
  store i32 5, i32* %100, align 4, !dbg !859, !tbaa !765
  br label %104, !dbg !861

; <label>:102                                     ; preds = %99
  store i32 9, i32* %100, align 4, !dbg !862, !tbaa !765
  br label %104, !dbg !865

; <label>:103                                     ; preds = %99
  store i32 13, i32* %100, align 4, !dbg !866, !tbaa !765
  br label %104

; <label>:104                                     ; preds = %101, %103, %102, %94, %has_permission.exit.thread, %48, %46, %12
  %.0 = phi i32 [ -1, %12 ], [ -1, %46 ], [ -1, %has_permission.exit.thread ], [ -1, %48 ], [ -1, %94 ], [ %fd.0.lcssa, %102 ], [ %fd.0.lcssa, %103 ], [ %fd.0.lcssa, %101 ]
  ret i32 %.0, !dbg !868
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

declare void @klee_warning(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @__fd_openat(i32 %basefd, i8* %pathname, i32 %flags, i32 %mode) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %basefd}, i64 0, metadata !123), !dbg !869
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !124), !dbg !869
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !125), !dbg !869
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !126), !dbg !869
  %1 = icmp eq i32 %basefd, -100, !dbg !870
  br i1 %1, label %22, label %2, !dbg !870

; <label>:2                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %basefd}, i64 0, metadata !871), !dbg !873
  %3 = icmp ult i32 %basefd, 32, !dbg !874
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !874

; <label>:4                                       ; preds = %2
  %5 = sext i32 %basefd to i64, !dbg !875
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 1, !dbg !876
  %7 = load i32* %6, align 4, !dbg !876, !tbaa !765
  %8 = and i32 %7, 1, !dbg !876
  %9 = icmp eq i32 %8, 0, !dbg !876
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !876

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, !dbg !875
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !129), !dbg !872
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !878
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !878

__get_file.exit.thread:                           ; preds = %2, %4, %__get_file.exit
  %12 = tail call i32* @__errno_location() #1, !dbg !880
  store i32 9, i32* %12, align 4, !dbg !880, !tbaa !752
  br label %103, !dbg !882

; <label>:13                                      ; preds = %__get_file.exit
  %14 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 3, !dbg !883
  %15 = load %struct.exe_disk_file_t** %14, align 8, !dbg !883, !tbaa !788
  %16 = icmp eq %struct.exe_disk_file_t* %15, null, !dbg !883
  br i1 %16, label %19, label %17, !dbg !883

; <label>:17                                      ; preds = %13
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str2, i64 0, i64 0)) #5, !dbg !885
  %18 = tail call i32* @__errno_location() #1, !dbg !887
  store i32 2, i32* %18, align 4, !dbg !887, !tbaa !752
  br label %103, !dbg !888

; <label>:19                                      ; preds = %13
  %20 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !889
  %21 = load i32* %20, align 8, !dbg !889, !tbaa !855
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !123), !dbg !889
  %phitmp = sext i32 %21 to i64, !dbg !890
  br label %22, !dbg !890

; <label>:22                                      ; preds = %0, %19
  %.01 = phi i64 [ %phitmp, %19 ], [ -100, %0 ]
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !891), !dbg !894
  %23 = load i8* %pathname, align 1, !dbg !895, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %23}, i64 0, metadata !896), !dbg !895
  %24 = sext i8 %23 to i32, !dbg !897
  %25 = icmp eq i8 %23, 0, !dbg !897
  br i1 %25, label %__get_sym_file.exit.thread.preheader, label %26, !dbg !897

; <label>:26                                      ; preds = %22
  %27 = getelementptr inbounds i8* %pathname, i64 1, !dbg !897
  %28 = load i8* %27, align 1, !dbg !897, !tbaa !694
  %29 = icmp eq i8 %28, 0, !dbg !897
  br i1 %29, label %.preheader.i, label %__get_sym_file.exit.thread.preheader, !dbg !897

.preheader.i:                                     ; preds = %26
  %30 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !898, !tbaa !701
  %31 = icmp eq i32 %30, 0, !dbg !898
  br i1 %31, label %__get_sym_file.exit.thread.preheader, label %.lr.ph.i, !dbg !898

; <label>:32                                      ; preds = %.lr.ph.i
  %33 = icmp ult i32 %37, %30, !dbg !898
  br i1 %33, label %.lr.ph.i, label %__get_sym_file.exit.thread.preheader, !dbg !898

.lr.ph.i:                                         ; preds = %.preheader.i, %32
  %i.02.i = phi i32 [ %37, %32 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !899
  %34 = ashr exact i32 %sext.i, 24, !dbg !899
  %35 = add nsw i32 %34, 65, !dbg !899
  %36 = icmp eq i32 %24, %35, !dbg !899
  %37 = add i32 %i.02.i, 1, !dbg !898
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !900), !dbg !898
  br i1 %36, label %38, label %32, !dbg !899

; <label>:38                                      ; preds = %.lr.ph.i
  %39 = zext i32 %i.02.i to i64, !dbg !901
  %40 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !901, !tbaa !708
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, i32 2, !dbg !902
  %42 = load %struct.stat64** %41, align 8, !dbg !902, !tbaa !711
  %43 = getelementptr inbounds %struct.stat64* %42, i64 0, i32 1, !dbg !902
  %44 = load i64* %43, align 8, !dbg !902, !tbaa !713
  %45 = icmp eq i64 %44, 0, !dbg !902
  %46 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, !dbg !901
  %47 = icmp eq %struct.exe_disk_file_t* %46, null, !dbg !892
  %or.cond = or i1 %45, %47, !dbg !902
  br i1 %or.cond, label %__get_sym_file.exit.thread.preheader, label %48, !dbg !902

; <label>:48                                      ; preds = %38
  %49 = tail call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode), !dbg !903
  br label %103, !dbg !903

__get_sym_file.exit.thread:                       ; preds = %__get_sym_file.exit.thread.preheader
  %50 = trunc i64 %indvars.iv.next to i32, !dbg !905
  %51 = icmp slt i32 %50, 32, !dbg !905
  br i1 %51, label %__get_sym_file.exit.thread.preheader, label %57, !dbg !905

__get_sym_file.exit.thread.preheader:             ; preds = %.preheader.i, %38, %22, %26, %32, %__get_sym_file.exit.thread
  %indvars.iv = phi i64 [ %indvars.iv.next, %__get_sym_file.exit.thread ], [ 0, %32 ], [ 0, %26 ], [ 0, %22 ], [ 0, %38 ], [ 0, %.preheader.i ]
  %fd.05 = phi i32 [ %56, %__get_sym_file.exit.thread ], [ 0, %32 ], [ 0, %26 ], [ 0, %22 ], [ 0, %38 ], [ 0, %.preheader.i ]
  %52 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !907
  %53 = load i32* %52, align 4, !dbg !907, !tbaa !765
  %54 = and i32 %53, 1, !dbg !907
  %55 = icmp eq i32 %54, 0, !dbg !907
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !905
  %56 = add nsw i32 %fd.05, 1, !dbg !905
  tail call void @llvm.dbg.value(metadata !{i32 %56}, i64 0, metadata !128), !dbg !905
  br i1 %55, label %57, label %__get_sym_file.exit.thread, !dbg !907

; <label>:57                                      ; preds = %__get_sym_file.exit.thread.preheader, %__get_sym_file.exit.thread
  %fd.0.lcssa = phi i32 [ %fd.05, %__get_sym_file.exit.thread.preheader ], [ %56, %__get_sym_file.exit.thread ]
  %58 = icmp eq i32 %fd.0.lcssa, 32, !dbg !909
  br i1 %58, label %59, label %61, !dbg !909

; <label>:59                                      ; preds = %57
  %60 = tail call i32* @__errno_location() #1, !dbg !911
  store i32 24, i32* %60, align 4, !dbg !911, !tbaa !752
  br label %103, !dbg !913

; <label>:61                                      ; preds = %57
  %62 = sext i32 %fd.0.lcssa to i64, !dbg !914
  %63 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %62, !dbg !914
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %63}, i64 0, metadata !127), !dbg !914
  %64 = bitcast %struct.exe_file_t* %63 to i8*, !dbg !915
  tail call void @llvm.memset.p0i8.i64(i8* %64, i8 0, i64 24, i32 8, i1 false), !dbg !915
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !916) #5, !dbg !918
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !919) #5, !dbg !921
  %65 = ptrtoint i8* %pathname to i64, !dbg !922
  %66 = tail call i64 @klee_get_valuel(i64 %65) #5, !dbg !922
  %67 = inttoptr i64 %66 to i8*, !dbg !922
  tail call void @llvm.dbg.value(metadata !{i8* %67}, i64 0, metadata !923) #5, !dbg !922
  %68 = icmp eq i8* %67, %pathname, !dbg !924
  %69 = zext i1 %68 to i64, !dbg !924
  tail call void @klee_assume(i64 %69) #5, !dbg !924
  tail call void @llvm.dbg.value(metadata !{i8* %67}, i64 0, metadata !925) #5, !dbg !920
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !926) #5, !dbg !927
  br label %70, !dbg !927

; <label>:70                                      ; preds = %87, %61
  %i.0.i = phi i32 [ 0, %61 ], [ %88, %87 ]
  %sc.0.i = phi i8* [ %67, %61 ], [ %sc.1.i, %87 ]
  %71 = load i8* %sc.0.i, align 1, !dbg !928, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %71}, i64 0, metadata !929) #5, !dbg !928
  %72 = add i32 %i.0.i, -1, !dbg !930
  %73 = and i32 %72, %i.0.i, !dbg !930
  %74 = icmp eq i32 %73, 0, !dbg !930
  br i1 %74, label %75, label %79, !dbg !930

; <label>:75                                      ; preds = %70
  switch i8 %71, label %87 [
    i8 0, label %76
    i8 47, label %77
  ], !dbg !931

; <label>:76                                      ; preds = %75
  store i8 0, i8* %sc.0.i, align 1, !dbg !932, !tbaa !694
  br label %__concretize_string.exit, !dbg !933

; <label>:77                                      ; preds = %75
  %78 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !934
  tail call void @llvm.dbg.value(metadata !{i8* %78}, i64 0, metadata !925) #5, !dbg !934
  store i8 47, i8* %sc.0.i, align 1, !dbg !934, !tbaa !694
  br label %87, !dbg !935

; <label>:79                                      ; preds = %70
  %80 = sext i8 %71 to i64, !dbg !936
  %81 = tail call i64 @klee_get_valuel(i64 %80) #5, !dbg !936
  %82 = trunc i64 %81 to i8, !dbg !936
  tail call void @llvm.dbg.value(metadata !{i8 %82}, i64 0, metadata !937) #5, !dbg !936
  %83 = icmp eq i8 %82, %71, !dbg !938
  %84 = zext i1 %83 to i64, !dbg !938
  tail call void @klee_assume(i64 %84) #5, !dbg !938
  %85 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !939
  tail call void @llvm.dbg.value(metadata !{i8* %85}, i64 0, metadata !925) #5, !dbg !939
  store i8 %82, i8* %sc.0.i, align 1, !dbg !939, !tbaa !694
  %86 = icmp eq i8 %82, 0, !dbg !940
  br i1 %86, label %__concretize_string.exit, label %87, !dbg !940

; <label>:87                                      ; preds = %79, %77, %75
  %sc.1.i = phi i8* [ %85, %79 ], [ %78, %77 ], [ %sc.0.i, %75 ]
  %88 = add i32 %i.0.i, 1, !dbg !927
  tail call void @llvm.dbg.value(metadata !{i32 %88}, i64 0, metadata !926) #5, !dbg !927
  br label %70, !dbg !927

__concretize_string.exit:                         ; preds = %79, %76
  %89 = sext i32 %flags to i64, !dbg !917
  %90 = tail call i64 (i64, ...)* @syscall(i64 257, i64 %.01, i8* %pathname, i64 %89, i32 %mode) #5, !dbg !917
  %91 = trunc i64 %90 to i32, !dbg !917
  tail call void @llvm.dbg.value(metadata !{i32 %91}, i64 0, metadata !132), !dbg !917
  %92 = icmp eq i32 %91, -1, !dbg !941
  br i1 %92, label %93, label %96, !dbg !941

; <label>:93                                      ; preds = %__concretize_string.exit
  %94 = tail call i32 @klee_get_errno() #5, !dbg !943
  %95 = tail call i32* @__errno_location() #1, !dbg !943
  store i32 %94, i32* %95, align 4, !dbg !943, !tbaa !752
  br label %103, !dbg !945

; <label>:96                                      ; preds = %__concretize_string.exit
  %97 = getelementptr inbounds %struct.exe_file_t* %63, i64 0, i32 0, !dbg !946
  store i32 %91, i32* %97, align 8, !dbg !946, !tbaa !855
  %98 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %62, i32 1, !dbg !947
  store i32 1, i32* %98, align 4, !dbg !947, !tbaa !765
  %99 = and i32 %flags, 3, !dbg !948
  switch i32 %99, label %102 [
    i32 0, label %100
    i32 1, label %101
  ], !dbg !948

; <label>:100                                     ; preds = %96
  store i32 5, i32* %98, align 4, !dbg !950, !tbaa !765
  br label %103, !dbg !952

; <label>:101                                     ; preds = %96
  store i32 9, i32* %98, align 4, !dbg !953, !tbaa !765
  br label %103, !dbg !956

; <label>:102                                     ; preds = %96
  store i32 13, i32* %98, align 4, !dbg !957, !tbaa !765
  br label %103

; <label>:103                                     ; preds = %100, %102, %101, %93, %59, %48, %17, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %17 ], [ %49, %48 ], [ -1, %59 ], [ -1, %93 ], [ -1, %__get_file.exit.thread ], [ %fd.0.lcssa, %101 ], [ %fd.0.lcssa, %102 ], [ %fd.0.lcssa, %100 ]
  ret i32 %.0, !dbg !959
}

; Function Attrs: nounwind uwtable
define i32 @utimes(i8* %path, %struct.timeval* %times) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !145), !dbg !960
  tail call void @llvm.dbg.value(metadata !{%struct.timeval* %times}, i64 0, metadata !146), !dbg !960
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !961), !dbg !963
  %1 = load i8* %path, align 1, !dbg !964, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !965), !dbg !964
  %2 = sext i8 %1 to i32, !dbg !966
  %3 = icmp eq i8 %1, 0, !dbg !966
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !966

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !966
  %6 = load i8* %5, align 1, !dbg !966, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !966
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !966

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !967, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !967
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !967

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !967
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !967

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !968
  %12 = ashr exact i32 %sext.i, 24, !dbg !968
  %13 = add nsw i32 %12, 65, !dbg !968
  %14 = icmp eq i32 %2, %13, !dbg !968
  %15 = add i32 %i.02.i, 1, !dbg !967
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !969), !dbg !967
  br i1 %14, label %16, label %10, !dbg !968

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !970
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !970, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !971
  %20 = load %struct.stat64** %19, align 8, !dbg !971, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !971
  %22 = load i64* %21, align 8, !dbg !971, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !971
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !970
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !972
  %or.cond = or i1 %23, %25, !dbg !971
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !971

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.timeval* %times, i64 0, i32 0, !dbg !974
  %28 = load i64* %27, align 8, !dbg !974, !tbaa !976
  %29 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 11, i32 0, !dbg !974
  store i64 %28, i64* %29, align 8, !dbg !974, !tbaa !978
  %30 = getelementptr inbounds %struct.timeval* %times, i64 1, i32 0, !dbg !979
  %31 = load i64* %30, align 8, !dbg !979, !tbaa !976
  %32 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 12, i32 0, !dbg !979
  store i64 %31, i64* %32, align 8, !dbg !979, !tbaa !980
  br label %63, !dbg !981

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !982) #5, !dbg !984
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !985) #5, !dbg !987
  %33 = ptrtoint i8* %path to i64, !dbg !988
  %34 = tail call i64 @klee_get_valuel(i64 %33) #5, !dbg !988
  %35 = inttoptr i64 %34 to i8*, !dbg !988
  tail call void @llvm.dbg.value(metadata !{i8* %35}, i64 0, metadata !989) #5, !dbg !988
  %36 = icmp eq i8* %35, %path, !dbg !990
  %37 = zext i1 %36 to i64, !dbg !990
  tail call void @klee_assume(i64 %37) #5, !dbg !990
  tail call void @llvm.dbg.value(metadata !{i8* %35}, i64 0, metadata !991) #5, !dbg !986
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !992) #5, !dbg !993
  br label %38, !dbg !993

; <label>:38                                      ; preds = %55, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %56, %55 ]
  %sc.0.i = phi i8* [ %35, %__get_sym_file.exit.thread ], [ %sc.1.i, %55 ]
  %39 = load i8* %sc.0.i, align 1, !dbg !994, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %39}, i64 0, metadata !995) #5, !dbg !994
  %40 = add i32 %i.0.i, -1, !dbg !996
  %41 = and i32 %40, %i.0.i, !dbg !996
  %42 = icmp eq i32 %41, 0, !dbg !996
  br i1 %42, label %43, label %47, !dbg !996

; <label>:43                                      ; preds = %38
  switch i8 %39, label %55 [
    i8 0, label %44
    i8 47, label %45
  ], !dbg !997

; <label>:44                                      ; preds = %43
  store i8 0, i8* %sc.0.i, align 1, !dbg !998, !tbaa !694
  br label %__concretize_string.exit, !dbg !999

; <label>:45                                      ; preds = %43
  %46 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1000
  tail call void @llvm.dbg.value(metadata !{i8* %46}, i64 0, metadata !991) #5, !dbg !1000
  store i8 47, i8* %sc.0.i, align 1, !dbg !1000, !tbaa !694
  br label %55, !dbg !1001

; <label>:47                                      ; preds = %38
  %48 = sext i8 %39 to i64, !dbg !1002
  %49 = tail call i64 @klee_get_valuel(i64 %48) #5, !dbg !1002
  %50 = trunc i64 %49 to i8, !dbg !1002
  tail call void @llvm.dbg.value(metadata !{i8 %50}, i64 0, metadata !1003) #5, !dbg !1002
  %51 = icmp eq i8 %50, %39, !dbg !1004
  %52 = zext i1 %51 to i64, !dbg !1004
  tail call void @klee_assume(i64 %52) #5, !dbg !1004
  %53 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1005
  tail call void @llvm.dbg.value(metadata !{i8* %53}, i64 0, metadata !991) #5, !dbg !1005
  store i8 %50, i8* %sc.0.i, align 1, !dbg !1005, !tbaa !694
  %54 = icmp eq i8 %50, 0, !dbg !1006
  br i1 %54, label %__concretize_string.exit, label %55, !dbg !1006

; <label>:55                                      ; preds = %47, %45, %43
  %sc.1.i = phi i8* [ %53, %47 ], [ %46, %45 ], [ %sc.0.i, %43 ]
  %56 = add i32 %i.0.i, 1, !dbg !993
  tail call void @llvm.dbg.value(metadata !{i32 %56}, i64 0, metadata !992) #5, !dbg !993
  br label %38, !dbg !993

__concretize_string.exit:                         ; preds = %47, %44
  %57 = tail call i64 (i64, ...)* @syscall(i64 235, i8* %path, %struct.timeval* %times) #5, !dbg !983
  %58 = trunc i64 %57 to i32, !dbg !983
  tail call void @llvm.dbg.value(metadata !{i32 %58}, i64 0, metadata !148), !dbg !983
  %59 = icmp eq i32 %58, -1, !dbg !1007
  br i1 %59, label %60, label %63, !dbg !1007

; <label>:60                                      ; preds = %__concretize_string.exit
  %61 = tail call i32 @klee_get_errno() #5, !dbg !1009
  %62 = tail call i32* @__errno_location() #1, !dbg !1009
  store i32 %61, i32* %62, align 4, !dbg !1009, !tbaa !752
  br label %63, !dbg !1009

; <label>:63                                      ; preds = %__concretize_string.exit, %60, %26
  %.0 = phi i32 [ 0, %26 ], [ -1, %60 ], [ %58, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1010
}

; Function Attrs: nounwind uwtable
define i32 @futimesat(i32 %fd, i8* %path, %struct.timeval* %times) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !153), !dbg !1011
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !154), !dbg !1011
  tail call void @llvm.dbg.value(metadata !{%struct.timeval* %times}, i64 0, metadata !155), !dbg !1011
  %1 = icmp eq i32 %fd, -100, !dbg !1012
  br i1 %1, label %22, label %2, !dbg !1012

; <label>:2                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1013), !dbg !1015
  %3 = icmp ult i32 %fd, 32, !dbg !1016
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !1016

; <label>:4                                       ; preds = %2
  %5 = sext i32 %fd to i64, !dbg !1017
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 1, !dbg !1018
  %7 = load i32* %6, align 4, !dbg !1018, !tbaa !765
  %8 = and i32 %7, 1, !dbg !1018
  %9 = icmp eq i32 %8, 0, !dbg !1018
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1018

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, !dbg !1017
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !156), !dbg !1014
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !1019
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !1019

__get_file.exit.thread:                           ; preds = %2, %4, %__get_file.exit
  %12 = tail call i32* @__errno_location() #1, !dbg !1021
  store i32 9, i32* %12, align 4, !dbg !1021, !tbaa !752
  br label %83, !dbg !1023

; <label>:13                                      ; preds = %__get_file.exit
  %14 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 3, !dbg !1024
  %15 = load %struct.exe_disk_file_t** %14, align 8, !dbg !1024, !tbaa !788
  %16 = icmp eq %struct.exe_disk_file_t* %15, null, !dbg !1024
  br i1 %16, label %19, label %17, !dbg !1024

; <label>:17                                      ; preds = %13
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str2, i64 0, i64 0)) #5, !dbg !1026
  %18 = tail call i32* @__errno_location() #1, !dbg !1028
  store i32 2, i32* %18, align 4, !dbg !1028, !tbaa !752
  br label %83, !dbg !1029

; <label>:19                                      ; preds = %13
  %20 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !1030
  %21 = load i32* %20, align 8, !dbg !1030, !tbaa !855
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !153), !dbg !1030
  %phitmp = sext i32 %21 to i64, !dbg !1031
  br label %22, !dbg !1031

; <label>:22                                      ; preds = %0, %19
  %.01 = phi i64 [ %phitmp, %19 ], [ -100, %0 ]
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1032), !dbg !1035
  %23 = load i8* %path, align 1, !dbg !1036, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %23}, i64 0, metadata !1037), !dbg !1036
  %24 = sext i8 %23 to i32, !dbg !1038
  %25 = icmp eq i8 %23, 0, !dbg !1038
  br i1 %25, label %__get_sym_file.exit.thread, label %26, !dbg !1038

; <label>:26                                      ; preds = %22
  %27 = getelementptr inbounds i8* %path, i64 1, !dbg !1038
  %28 = load i8* %27, align 1, !dbg !1038, !tbaa !694
  %29 = icmp eq i8 %28, 0, !dbg !1038
  br i1 %29, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1038

.preheader.i:                                     ; preds = %26
  %30 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1039, !tbaa !701
  %31 = icmp eq i32 %30, 0, !dbg !1039
  br i1 %31, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1039

; <label>:32                                      ; preds = %.lr.ph.i
  %33 = icmp ult i32 %37, %30, !dbg !1039
  br i1 %33, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1039

.lr.ph.i:                                         ; preds = %.preheader.i, %32
  %i.02.i = phi i32 [ %37, %32 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1040
  %34 = ashr exact i32 %sext.i, 24, !dbg !1040
  %35 = add nsw i32 %34, 65, !dbg !1040
  %36 = icmp eq i32 %24, %35, !dbg !1040
  %37 = add i32 %i.02.i, 1, !dbg !1039
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !1041), !dbg !1039
  br i1 %36, label %38, label %32, !dbg !1040

; <label>:38                                      ; preds = %.lr.ph.i
  %39 = zext i32 %i.02.i to i64, !dbg !1042
  %40 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1042, !tbaa !708
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, i32 2, !dbg !1043
  %42 = load %struct.stat64** %41, align 8, !dbg !1043, !tbaa !711
  %43 = getelementptr inbounds %struct.stat64* %42, i64 0, i32 1, !dbg !1043
  %44 = load i64* %43, align 8, !dbg !1043, !tbaa !713
  %45 = icmp eq i64 %44, 0, !dbg !1043
  %46 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, !dbg !1042
  %47 = icmp eq %struct.exe_disk_file_t* %46, null, !dbg !1033
  %or.cond = or i1 %45, %47, !dbg !1043
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %48, !dbg !1043

; <label>:48                                      ; preds = %38
  %49 = tail call i32 @utimes(i8* %path, %struct.timeval* %times), !dbg !1044
  br label %83, !dbg !1044

__get_sym_file.exit.thread:                       ; preds = %32, %.preheader.i, %38, %22, %26
  %50 = icmp eq i8* %path, null, !dbg !1046
  br i1 %50, label %__concretize_string.exit, label %51, !dbg !1046

; <label>:51                                      ; preds = %__get_sym_file.exit.thread
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1047) #5, !dbg !1049
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1050) #5, !dbg !1052
  %52 = ptrtoint i8* %path to i64, !dbg !1053
  %53 = tail call i64 @klee_get_valuel(i64 %52) #5, !dbg !1053
  %54 = inttoptr i64 %53 to i8*, !dbg !1053
  tail call void @llvm.dbg.value(metadata !{i8* %54}, i64 0, metadata !1054) #5, !dbg !1053
  %55 = icmp eq i8* %54, %path, !dbg !1055
  %56 = zext i1 %55 to i64, !dbg !1055
  tail call void @klee_assume(i64 %56) #5, !dbg !1055
  tail call void @llvm.dbg.value(metadata !{i8* %54}, i64 0, metadata !1056) #5, !dbg !1051
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1057) #5, !dbg !1058
  br label %57, !dbg !1058

; <label>:57                                      ; preds = %74, %51
  %i.0.i = phi i32 [ 0, %51 ], [ %75, %74 ]
  %sc.0.i = phi i8* [ %54, %51 ], [ %sc.1.i, %74 ]
  %58 = load i8* %sc.0.i, align 1, !dbg !1059, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %58}, i64 0, metadata !1060) #5, !dbg !1059
  %59 = add i32 %i.0.i, -1, !dbg !1061
  %60 = and i32 %59, %i.0.i, !dbg !1061
  %61 = icmp eq i32 %60, 0, !dbg !1061
  br i1 %61, label %62, label %66, !dbg !1061

; <label>:62                                      ; preds = %57
  switch i8 %58, label %74 [
    i8 0, label %63
    i8 47, label %64
  ], !dbg !1062

; <label>:63                                      ; preds = %62
  store i8 0, i8* %sc.0.i, align 1, !dbg !1063, !tbaa !694
  br label %__concretize_string.exit, !dbg !1064

; <label>:64                                      ; preds = %62
  %65 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1065
  tail call void @llvm.dbg.value(metadata !{i8* %65}, i64 0, metadata !1056) #5, !dbg !1065
  store i8 47, i8* %sc.0.i, align 1, !dbg !1065, !tbaa !694
  br label %74, !dbg !1066

; <label>:66                                      ; preds = %57
  %67 = sext i8 %58 to i64, !dbg !1067
  %68 = tail call i64 @klee_get_valuel(i64 %67) #5, !dbg !1067
  %69 = trunc i64 %68 to i8, !dbg !1067
  tail call void @llvm.dbg.value(metadata !{i8 %69}, i64 0, metadata !1068) #5, !dbg !1067
  %70 = icmp eq i8 %69, %58, !dbg !1069
  %71 = zext i1 %70 to i64, !dbg !1069
  tail call void @klee_assume(i64 %71) #5, !dbg !1069
  %72 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1070
  tail call void @llvm.dbg.value(metadata !{i8* %72}, i64 0, metadata !1056) #5, !dbg !1070
  store i8 %69, i8* %sc.0.i, align 1, !dbg !1070, !tbaa !694
  %73 = icmp eq i8 %69, 0, !dbg !1071
  br i1 %73, label %__concretize_string.exit, label %74, !dbg !1071

; <label>:74                                      ; preds = %66, %64, %62
  %sc.1.i = phi i8* [ %72, %66 ], [ %65, %64 ], [ %sc.0.i, %62 ]
  %75 = add i32 %i.0.i, 1, !dbg !1058
  tail call void @llvm.dbg.value(metadata !{i32 %75}, i64 0, metadata !1057) #5, !dbg !1058
  br label %57, !dbg !1058

__concretize_string.exit:                         ; preds = %66, %63, %__get_sym_file.exit.thread
  %76 = phi i8* [ null, %__get_sym_file.exit.thread ], [ %path, %63 ], [ %path, %66 ], !dbg !1048
  %77 = tail call i64 (i64, ...)* @syscall(i64 261, i64 %.01, i8* %76, %struct.timeval* %times) #5, !dbg !1046
  %78 = trunc i64 %77 to i32, !dbg !1046
  tail call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !159), !dbg !1046
  %79 = icmp eq i32 %78, -1, !dbg !1072
  br i1 %79, label %80, label %83, !dbg !1072

; <label>:80                                      ; preds = %__concretize_string.exit
  %81 = tail call i32 @klee_get_errno() #5, !dbg !1074
  %82 = tail call i32* @__errno_location() #1, !dbg !1074
  store i32 %81, i32* %82, align 4, !dbg !1074, !tbaa !752
  br label %83, !dbg !1074

; <label>:83                                      ; preds = %__concretize_string.exit, %80, %48, %17, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %17 ], [ %49, %48 ], [ -1, %__get_file.exit.thread ], [ -1, %80 ], [ %78, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1075
}

; Function Attrs: nounwind uwtable
define i32 @close(i32 %fd) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !164), !dbg !1076
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !166), !dbg !1077
  %1 = load i32* @close.n_calls, align 4, !dbg !1078, !tbaa !752
  %2 = add nsw i32 %1, 1, !dbg !1078
  store i32 %2, i32* @close.n_calls, align 4, !dbg !1078, !tbaa !752
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1079), !dbg !1081
  %3 = icmp ult i32 %fd, 32, !dbg !1082
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !1082

; <label>:4                                       ; preds = %0
  %5 = sext i32 %fd to i64, !dbg !1083
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 1, !dbg !1084
  %7 = load i32* %6, align 4, !dbg !1084, !tbaa !765
  %8 = and i32 %7, 1, !dbg !1084
  %9 = icmp eq i32 %8, 0, !dbg !1084
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1084

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, !dbg !1083
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !165), !dbg !1080
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !1085
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !1085

__get_file.exit.thread:                           ; preds = %0, %4, %__get_file.exit
  %12 = tail call i32* @__errno_location() #1, !dbg !1087
  store i32 9, i32* %12, align 4, !dbg !1087, !tbaa !752
  br label %25, !dbg !1089

; <label>:13                                      ; preds = %__get_file.exit
  %14 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1090, !tbaa !1092
  %15 = icmp eq i32 %14, 0, !dbg !1090
  br i1 %15, label %23, label %16, !dbg !1090

; <label>:16                                      ; preds = %13
  %17 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !1090, !tbaa !1093
  %18 = load i32* %17, align 4, !dbg !1090, !tbaa !752
  %19 = icmp eq i32 %18, %2, !dbg !1090
  br i1 %19, label %20, label %23, !dbg !1090

; <label>:20                                      ; preds = %16
  %21 = add i32 %14, -1, !dbg !1094
  store i32 %21, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1094, !tbaa !1092
  %22 = tail call i32* @__errno_location() #1, !dbg !1096
  store i32 5, i32* %22, align 4, !dbg !1096, !tbaa !752
  br label %25, !dbg !1097

; <label>:23                                      ; preds = %13, %16
  %24 = bitcast %struct.exe_file_t* %10 to i8*, !dbg !1098
  tail call void @llvm.memset.p0i8.i64(i8* %24, i8 0, i64 24, i32 8, i1 false), !dbg !1098
  br label %25, !dbg !1099

; <label>:25                                      ; preds = %23, %20, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %20 ], [ 0, %23 ], [ -1, %__get_file.exit.thread ]
  ret i32 %.0, !dbg !1100
}

; Function Attrs: nounwind uwtable
define i64 @read(i32 %fd, i8* %buf, i64 %count) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !175), !dbg !1101
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !176), !dbg !1101
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !177), !dbg !1101
  %1 = load i32* @read.n_calls, align 4, !dbg !1102, !tbaa !752
  %2 = add nsw i32 %1, 1, !dbg !1102
  store i32 %2, i32* @read.n_calls, align 4, !dbg !1102, !tbaa !752
  %3 = icmp eq i64 %count, 0, !dbg !1103
  br i1 %3, label %._crit_edge, label %4, !dbg !1103

; <label>:4                                       ; preds = %0
  %5 = icmp eq i8* %buf, null, !dbg !1105
  br i1 %5, label %6, label %8, !dbg !1105

; <label>:6                                       ; preds = %4
  %7 = tail call i32* @__errno_location() #1, !dbg !1107
  store i32 14, i32* %7, align 4, !dbg !1107, !tbaa !752
  br label %._crit_edge, !dbg !1109

; <label>:8                                       ; preds = %4
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1110), !dbg !1112
  %9 = icmp ult i32 %fd, 32, !dbg !1113
  br i1 %9, label %10, label %__get_file.exit.thread, !dbg !1113

; <label>:10                                      ; preds = %8
  %11 = sext i32 %fd to i64, !dbg !1114
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %11, i32 1, !dbg !1115
  %13 = load i32* %12, align 4, !dbg !1115, !tbaa !765
  %14 = and i32 %13, 1, !dbg !1115
  %15 = icmp eq i32 %14, 0, !dbg !1115
  br i1 %15, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1115

__get_file.exit:                                  ; preds = %10
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %11, !dbg !1114
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %16}, i64 0, metadata !178), !dbg !1111
  %17 = icmp eq %struct.exe_file_t* %16, null, !dbg !1116
  br i1 %17, label %__get_file.exit.thread, label %19, !dbg !1116

__get_file.exit.thread:                           ; preds = %8, %10, %__get_file.exit
  %18 = tail call i32* @__errno_location() #1, !dbg !1118
  store i32 9, i32* %18, align 4, !dbg !1118, !tbaa !752
  br label %._crit_edge, !dbg !1120

; <label>:19                                      ; preds = %__get_file.exit
  %20 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1121, !tbaa !1092
  %21 = icmp eq i32 %20, 0, !dbg !1121
  br i1 %21, label %29, label %22, !dbg !1121

; <label>:22                                      ; preds = %19
  %23 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 6), align 8, !dbg !1121, !tbaa !1123
  %24 = load i32* %23, align 4, !dbg !1121, !tbaa !752
  %25 = icmp eq i32 %24, %2, !dbg !1121
  br i1 %25, label %26, label %29, !dbg !1121

; <label>:26                                      ; preds = %22
  %27 = add i32 %20, -1, !dbg !1124
  store i32 %27, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1124, !tbaa !1092
  %28 = tail call i32* @__errno_location() #1, !dbg !1126
  store i32 5, i32* %28, align 4, !dbg !1126, !tbaa !752
  br label %._crit_edge, !dbg !1127

; <label>:29                                      ; preds = %19, %22
  %30 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %11, i32 3, !dbg !1128
  %31 = load %struct.exe_disk_file_t** %30, align 8, !dbg !1128, !tbaa !788
  %32 = icmp eq %struct.exe_disk_file_t* %31, null, !dbg !1128
  br i1 %32, label %33, label %63, !dbg !1128

; <label>:33                                      ; preds = %29
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !1129) #5, !dbg !1131
  %34 = ptrtoint i8* %buf to i64, !dbg !1132
  %35 = tail call i64 @klee_get_valuel(i64 %34) #5, !dbg !1132
  %36 = inttoptr i64 %35 to i8*, !dbg !1132
  tail call void @llvm.dbg.value(metadata !{i8* %36}, i64 0, metadata !1133) #5, !dbg !1132
  %37 = icmp eq i8* %36, %buf, !dbg !1134
  %38 = zext i1 %37 to i64, !dbg !1134
  tail call void @klee_assume(i64 %38) #5, !dbg !1134
  tail call void @llvm.dbg.value(metadata !{i8* %36}, i64 0, metadata !176), !dbg !1130
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !1135) #5, !dbg !1137
  %39 = tail call i64 @klee_get_valuel(i64 %count) #5, !dbg !1138
  tail call void @llvm.dbg.value(metadata !{i64 %39}, i64 0, metadata !1139) #5, !dbg !1138
  %40 = icmp eq i64 %39, %count, !dbg !1140
  %41 = zext i1 %40 to i64, !dbg !1140
  tail call void @klee_assume(i64 %41) #5, !dbg !1140
  tail call void @llvm.dbg.value(metadata !{i64 %39}, i64 0, metadata !177), !dbg !1136
  tail call void @klee_check_memory_access(i8* %36, i64 %39) #5, !dbg !1141
  %42 = getelementptr inbounds %struct.exe_file_t* %16, i64 0, i32 0, !dbg !1142
  %43 = load i32* %42, align 8, !dbg !1142, !tbaa !855
  %44 = icmp eq i32 %43, 0, !dbg !1142
  br i1 %44, label %45, label %47, !dbg !1142

; <label>:45                                      ; preds = %33
  %46 = tail call i64 (i64, ...)* @syscall(i64 0, i32 0, i8* %36, i64 %39) #5, !dbg !1144
  br label %51, !dbg !1144

; <label>:47                                      ; preds = %33
  %48 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %11, i32 2, !dbg !1145
  %49 = load i64* %48, align 8, !dbg !1145, !tbaa !1146
  %50 = tail call i64 (i64, ...)* @syscall(i64 17, i32 %43, i8* %36, i64 %39, i64 %49) #5, !dbg !1145
  br label %51

; <label>:51                                      ; preds = %47, %45
  %r.0.in = phi i64 [ %46, %45 ], [ %50, %47 ]
  %r.0 = trunc i64 %r.0.in to i32, !dbg !1144
  %52 = icmp eq i32 %r.0, -1, !dbg !1147
  br i1 %52, label %53, label %56, !dbg !1147

; <label>:53                                      ; preds = %51
  %54 = tail call i32 @klee_get_errno() #5, !dbg !1149
  %55 = tail call i32* @__errno_location() #1, !dbg !1149
  store i32 %54, i32* %55, align 4, !dbg !1149, !tbaa !752
  br label %._crit_edge, !dbg !1151

; <label>:56                                      ; preds = %51
  %57 = load i32* %42, align 8, !dbg !1152, !tbaa !855
  %58 = icmp eq i32 %57, 0, !dbg !1152
  %sext.pre = shl i64 %r.0.in, 32, !dbg !1154
  %.pre = ashr exact i64 %sext.pre, 32, !dbg !1154
  br i1 %58, label %._crit_edge, label %59, !dbg !1152

; <label>:59                                      ; preds = %56
  %60 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %11, i32 2, !dbg !1155
  %61 = load i64* %60, align 8, !dbg !1155, !tbaa !1146
  %62 = add nsw i64 %61, %.pre, !dbg !1155
  store i64 %62, i64* %60, align 8, !dbg !1155, !tbaa !1146
  br label %._crit_edge, !dbg !1155

; <label>:63                                      ; preds = %29
  %64 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %11, i32 2, !dbg !1156
  %65 = load i64* %64, align 8, !dbg !1156, !tbaa !1146
  %66 = icmp sgt i64 %65, -1, !dbg !1156
  br i1 %66, label %68, label %67, !dbg !1156

; <label>:67                                      ; preds = %63
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str3, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str4, i64 0, i64 0), i32 386, i8* getelementptr inbounds ([34 x i8]* @__PRETTY_FUNCTION__.read, i64 0, i64 0)) #8, !dbg !1156
  unreachable, !dbg !1156

; <label>:68                                      ; preds = %63
  %69 = getelementptr inbounds %struct.exe_disk_file_t* %31, i64 0, i32 0, !dbg !1158
  %70 = load i32* %69, align 4, !dbg !1158, !tbaa !1160
  %71 = zext i32 %70 to i64, !dbg !1158
  %72 = icmp slt i64 %71, %65, !dbg !1158
  br i1 %72, label %._crit_edge, label %73, !dbg !1158

; <label>:73                                      ; preds = %68
  %74 = add i64 %65, %count, !dbg !1161
  %75 = icmp ugt i64 %74, %71, !dbg !1161
  %76 = sub nsw i64 %71, %65, !dbg !1163
  tail call void @llvm.dbg.value(metadata !{i64 %76}, i64 0, metadata !177), !dbg !1163
  %.count = select i1 %75, i64 %76, i64 %count, !dbg !1161
  %77 = getelementptr inbounds %struct.exe_disk_file_t* %31, i64 0, i32 1, !dbg !1165
  %78 = load i8** %77, align 8, !dbg !1165, !tbaa !1166
  %79 = getelementptr inbounds i8* %78, i64 %65, !dbg !1165
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %buf, i8* %79, i64 %.count, i32 1, i1 false), !dbg !1165
  %80 = load i64* %64, align 8, !dbg !1167, !tbaa !1146
  %81 = add i64 %80, %.count, !dbg !1167
  store i64 %81, i64* %64, align 8, !dbg !1167, !tbaa !1146
  br label %._crit_edge, !dbg !1168

._crit_edge:                                      ; preds = %56, %59, %68, %0, %73, %53, %26, %__get_file.exit.thread, %6
  %.0 = phi i64 [ -1, %6 ], [ -1, %26 ], [ %.count, %73 ], [ -1, %53 ], [ -1, %__get_file.exit.thread ], [ 0, %0 ], [ 0, %68 ], [ %.pre, %59 ], [ %.pre, %56 ]
  ret i64 %.0, !dbg !1169
}

declare void @klee_check_memory_access(i8*, i64) #3

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #6

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: nounwind uwtable
define i64 @write(i32 %fd, i8* %buf, i64 %count) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !188), !dbg !1170
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !189), !dbg !1170
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !190), !dbg !1170
  %1 = load i32* @write.n_calls, align 4, !dbg !1171, !tbaa !752
  %2 = add nsw i32 %1, 1, !dbg !1171
  store i32 %2, i32* @write.n_calls, align 4, !dbg !1171, !tbaa !752
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1172), !dbg !1174
  %3 = icmp ult i32 %fd, 32, !dbg !1175
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !1175

; <label>:4                                       ; preds = %0
  %5 = sext i32 %fd to i64, !dbg !1176
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 1, !dbg !1177
  %7 = load i32* %6, align 4, !dbg !1177, !tbaa !765
  %8 = and i32 %7, 1, !dbg !1177
  %9 = icmp eq i32 %8, 0, !dbg !1177
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1177

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, !dbg !1176
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !191), !dbg !1173
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !1178
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !1178

__get_file.exit.thread:                           ; preds = %0, %4, %__get_file.exit
  %12 = tail call i32* @__errno_location() #1, !dbg !1180
  store i32 9, i32* %12, align 4, !dbg !1180, !tbaa !752
  br label %._crit_edge, !dbg !1182

; <label>:13                                      ; preds = %__get_file.exit
  %14 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1183, !tbaa !1092
  %15 = icmp eq i32 %14, 0, !dbg !1183
  br i1 %15, label %23, label %16, !dbg !1183

; <label>:16                                      ; preds = %13
  %17 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !1183, !tbaa !1185
  %18 = load i32* %17, align 4, !dbg !1183, !tbaa !752
  %19 = icmp eq i32 %18, %2, !dbg !1183
  br i1 %19, label %20, label %23, !dbg !1183

; <label>:20                                      ; preds = %16
  %21 = add i32 %14, -1, !dbg !1186
  store i32 %21, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1186, !tbaa !1092
  %22 = tail call i32* @__errno_location() #1, !dbg !1188
  store i32 5, i32* %22, align 4, !dbg !1188, !tbaa !752
  br label %._crit_edge, !dbg !1189

; <label>:23                                      ; preds = %13, %16
  %24 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 3, !dbg !1190
  %25 = load %struct.exe_disk_file_t** %24, align 8, !dbg !1190, !tbaa !788
  %26 = icmp eq %struct.exe_disk_file_t* %25, null, !dbg !1190
  br i1 %26, label %27, label %58, !dbg !1190

; <label>:27                                      ; preds = %23
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !1191) #5, !dbg !1193
  %28 = ptrtoint i8* %buf to i64, !dbg !1194
  %29 = tail call i64 @klee_get_valuel(i64 %28) #5, !dbg !1194
  %30 = inttoptr i64 %29 to i8*, !dbg !1194
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1195) #5, !dbg !1194
  %31 = icmp eq i8* %30, %buf, !dbg !1196
  %32 = zext i1 %31 to i64, !dbg !1196
  tail call void @klee_assume(i64 %32) #5, !dbg !1196
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !189), !dbg !1192
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !1197) #5, !dbg !1199
  %33 = tail call i64 @klee_get_valuel(i64 %count) #5, !dbg !1200
  tail call void @llvm.dbg.value(metadata !{i64 %33}, i64 0, metadata !1201) #5, !dbg !1200
  %34 = icmp eq i64 %33, %count, !dbg !1202
  %35 = zext i1 %34 to i64, !dbg !1202
  tail call void @klee_assume(i64 %35) #5, !dbg !1202
  tail call void @llvm.dbg.value(metadata !{i64 %33}, i64 0, metadata !190), !dbg !1198
  tail call void @klee_check_memory_access(i8* %30, i64 %33) #5, !dbg !1203
  %36 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !1204
  %37 = load i32* %36, align 8, !dbg !1204, !tbaa !855
  %.off = add i32 %37, -1, !dbg !1204
  %switch = icmp ult i32 %.off, 2, !dbg !1204
  br i1 %switch, label %38, label %40, !dbg !1204

; <label>:38                                      ; preds = %27
  %39 = tail call i64 (i64, ...)* @syscall(i64 1, i32 %37, i8* %30, i64 %33) #5, !dbg !1206
  br label %44, !dbg !1206

; <label>:40                                      ; preds = %27
  %41 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 2, !dbg !1207
  %42 = load i64* %41, align 8, !dbg !1207, !tbaa !1146
  %43 = tail call i64 (i64, ...)* @syscall(i64 18, i32 %37, i8* %30, i64 %33, i64 %42) #5, !dbg !1207
  br label %44

; <label>:44                                      ; preds = %40, %38
  %r.0.in = phi i64 [ %39, %38 ], [ %43, %40 ]
  %r.0 = trunc i64 %r.0.in to i32, !dbg !1206
  %45 = icmp eq i32 %r.0, -1, !dbg !1208
  br i1 %45, label %46, label %49, !dbg !1208

; <label>:46                                      ; preds = %44
  %47 = tail call i32 @klee_get_errno() #5, !dbg !1210
  %48 = tail call i32* @__errno_location() #1, !dbg !1210
  store i32 %47, i32* %48, align 4, !dbg !1210, !tbaa !752
  br label %._crit_edge, !dbg !1212

; <label>:49                                      ; preds = %44
  %50 = icmp sgt i32 %r.0, -1, !dbg !1213
  br i1 %50, label %52, label %51, !dbg !1213

; <label>:51                                      ; preds = %49
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str4, i64 0, i64 0), i32 440, i8* getelementptr inbounds ([41 x i8]* @__PRETTY_FUNCTION__.write, i64 0, i64 0)) #8, !dbg !1213
  unreachable, !dbg !1213

; <label>:52                                      ; preds = %49
  %53 = load i32* %36, align 8, !dbg !1214, !tbaa !855
  %.off2 = add i32 %53, -1, !dbg !1214
  %switch3 = icmp ult i32 %.off2, 2, !dbg !1214
  %sext.pre = shl i64 %r.0.in, 32, !dbg !1216
  %.pre = ashr exact i64 %sext.pre, 32, !dbg !1216
  br i1 %switch3, label %._crit_edge, label %54, !dbg !1214

; <label>:54                                      ; preds = %52
  %55 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 2, !dbg !1217
  %56 = load i64* %55, align 8, !dbg !1217, !tbaa !1146
  %57 = add nsw i64 %56, %.pre, !dbg !1217
  store i64 %57, i64* %55, align 8, !dbg !1217, !tbaa !1146
  br label %._crit_edge, !dbg !1217

; <label>:58                                      ; preds = %23
  tail call void @llvm.dbg.value(metadata !1218, i64 0, metadata !195), !dbg !1219
  %59 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 2, !dbg !1220
  %60 = load i64* %59, align 8, !dbg !1220, !tbaa !1146
  %61 = add i64 %60, %count, !dbg !1220
  %62 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 0, i32 0, !dbg !1220
  %63 = load i32* %62, align 4, !dbg !1220, !tbaa !1160
  %64 = zext i32 %63 to i64, !dbg !1220
  %65 = icmp ugt i64 %61, %64, !dbg !1220
  br i1 %65, label %66, label %select.unfold, !dbg !1220

; <label>:66                                      ; preds = %58
  %67 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 3), align 8, !dbg !1222, !tbaa !1225
  %68 = icmp eq i32 %67, 0, !dbg !1222
  br i1 %68, label %70, label %69, !dbg !1222

; <label>:69                                      ; preds = %66
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8]* @.str6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str4, i64 0, i64 0), i32 453, i8* getelementptr inbounds ([41 x i8]* @__PRETTY_FUNCTION__.write, i64 0, i64 0)) #8, !dbg !1226
  unreachable, !dbg !1226

; <label>:70                                      ; preds = %66
  %71 = icmp sgt i64 %64, %60, !dbg !1227
  %72 = sub nsw i64 %64, %60, !dbg !1230
  tail call void @llvm.dbg.value(metadata !{i64 %72}, i64 0, metadata !195), !dbg !1230
  br i1 %71, label %select.unfold, label %.thread

select.unfold:                                    ; preds = %70, %58
  %actual_count.0 = phi i64 [ %count, %58 ], [ %72, %70 ]
  %73 = icmp eq i64 %actual_count.0, 0, !dbg !1231
  br i1 %73, label %.thread, label %74, !dbg !1231

; <label>:74                                      ; preds = %select.unfold
  %75 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 0, i32 1, !dbg !1233
  %76 = load i8** %75, align 8, !dbg !1233, !tbaa !1166
  %77 = getelementptr inbounds i8* %76, i64 %60, !dbg !1233
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %77, i8* %buf, i64 %actual_count.0, i32 1, i1 false), !dbg !1233
  br label %.thread, !dbg !1233

.thread:                                          ; preds = %70, %select.unfold, %74
  %actual_count.04 = phi i64 [ 0, %select.unfold ], [ %actual_count.0, %74 ], [ 0, %70 ]
  %78 = icmp eq i64 %actual_count.04, %count, !dbg !1234
  br i1 %78, label %80, label %79, !dbg !1234

; <label>:79                                      ; preds = %.thread
  tail call void @klee_warning(i8* getelementptr inbounds ([24 x i8]* @.str7, i64 0, i64 0)) #5, !dbg !1236
  br label %80, !dbg !1236

; <label>:80                                      ; preds = %.thread, %79
  %81 = load %struct.exe_disk_file_t** %24, align 8, !dbg !1237, !tbaa !788
  %82 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !1237, !tbaa !1239
  %83 = icmp eq %struct.exe_disk_file_t* %81, %82, !dbg !1237
  br i1 %83, label %84, label %89, !dbg !1237

; <label>:84                                      ; preds = %80
  %85 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !1240, !tbaa !1241
  %86 = zext i32 %85 to i64, !dbg !1240
  %87 = add i64 %86, %actual_count.04, !dbg !1240
  %88 = trunc i64 %87 to i32, !dbg !1240
  store i32 %88, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !1240, !tbaa !1241
  br label %89, !dbg !1240

; <label>:89                                      ; preds = %84, %80
  %90 = load i64* %59, align 8, !dbg !1242, !tbaa !1146
  %91 = add i64 %90, %count, !dbg !1242
  store i64 %91, i64* %59, align 8, !dbg !1242, !tbaa !1146
  br label %._crit_edge, !dbg !1243

._crit_edge:                                      ; preds = %52, %54, %89, %46, %20, %__get_file.exit.thread
  %.0 = phi i64 [ -1, %20 ], [ %count, %89 ], [ -1, %46 ], [ -1, %__get_file.exit.thread ], [ %.pre, %54 ], [ %.pre, %52 ]
  ret i64 %.0, !dbg !1244
}

; Function Attrs: nounwind uwtable
define i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !201), !dbg !1245
  tail call void @llvm.dbg.value(metadata !{i64 %offset}, i64 0, metadata !202), !dbg !1245
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !203), !dbg !1245
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1246), !dbg !1248
  %1 = icmp ult i32 %fd, 32, !dbg !1249
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1249

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1250
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1251
  %5 = load i32* %4, align 4, !dbg !1251, !tbaa !765
  %6 = and i32 %5, 1, !dbg !1251
  %7 = icmp eq i32 %6, 0, !dbg !1251
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1251

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1250
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !205), !dbg !1247
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1252
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !1252

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !1254
  store i32 9, i32* %10, align 4, !dbg !1254, !tbaa !752
  br label %57, !dbg !1256

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1257
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !1257, !tbaa !788
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !1257
  br i1 %14, label %15, label %39, !dbg !1257

; <label>:15                                      ; preds = %11
  %16 = icmp eq i32 %whence, 0, !dbg !1259
  %17 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !1262
  %18 = load i32* %17, align 8, !dbg !1262, !tbaa !855
  br i1 %16, label %19, label %21, !dbg !1259

; <label>:19                                      ; preds = %15
  %20 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %18, i64 %offset, i32 0) #5, !dbg !1262
  tail call void @llvm.dbg.value(metadata !{i64 %20}, i64 0, metadata !204), !dbg !1262
  br label %33, !dbg !1264

; <label>:21                                      ; preds = %15
  %22 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1265
  %23 = load i64* %22, align 8, !dbg !1265, !tbaa !1146
  %24 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %18, i64 %23, i32 0) #5, !dbg !1265
  tail call void @llvm.dbg.value(metadata !{i64 %24}, i64 0, metadata !204), !dbg !1265
  %25 = icmp eq i64 %24, -1, !dbg !1267
  br i1 %25, label %.thread, label %26, !dbg !1267

; <label>:26                                      ; preds = %21
  %27 = load i64* %22, align 8, !dbg !1269, !tbaa !1146
  %28 = icmp eq i64 %24, %27, !dbg !1269
  br i1 %28, label %30, label %29, !dbg !1269

; <label>:29                                      ; preds = %26
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str4, i64 0, i64 0), i32 499, i8* getelementptr inbounds ([38 x i8]* @__PRETTY_FUNCTION__.__fd_lseek, i64 0, i64 0)) #8, !dbg !1269
  unreachable, !dbg !1269

; <label>:30                                      ; preds = %26
  %31 = load i32* %17, align 8, !dbg !1271, !tbaa !855
  %32 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %31, i64 %offset, i32 %whence) #5, !dbg !1271
  tail call void @llvm.dbg.value(metadata !{i64 %32}, i64 0, metadata !204), !dbg !1271
  br label %33, !dbg !1272

; <label>:33                                      ; preds = %30, %19
  %new_off.0 = phi i64 [ %20, %19 ], [ %32, %30 ]
  %34 = icmp eq i64 %new_off.0, -1, !dbg !1273
  br i1 %34, label %.thread, label %37, !dbg !1273

.thread:                                          ; preds = %21, %33
  %35 = tail call i32 @klee_get_errno() #5, !dbg !1275
  %36 = tail call i32* @__errno_location() #1, !dbg !1275
  store i32 %35, i32* %36, align 4, !dbg !1275, !tbaa !752
  br label %57, !dbg !1277

; <label>:37                                      ; preds = %33
  %38 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1278
  store i64 %new_off.0, i64* %38, align 8, !dbg !1278, !tbaa !1146
  br label %57, !dbg !1279

; <label>:39                                      ; preds = %11
  switch i32 %whence, label %49 [
    i32 0, label %51
    i32 1, label %40
    i32 2, label %44
  ], !dbg !1280

; <label>:40                                      ; preds = %39
  %41 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1281
  %42 = load i64* %41, align 8, !dbg !1281, !tbaa !1146
  %43 = add nsw i64 %42, %offset, !dbg !1281
  tail call void @llvm.dbg.value(metadata !{i64 %43}, i64 0, metadata !204), !dbg !1281
  br label %51, !dbg !1281

; <label>:44                                      ; preds = %39
  %45 = getelementptr inbounds %struct.exe_disk_file_t* %13, i64 0, i32 0, !dbg !1283
  %46 = load i32* %45, align 4, !dbg !1283, !tbaa !1160
  %47 = zext i32 %46 to i64, !dbg !1283
  %48 = add nsw i64 %47, %offset, !dbg !1283
  tail call void @llvm.dbg.value(metadata !{i64 %48}, i64 0, metadata !204), !dbg !1283
  br label %51, !dbg !1283

; <label>:49                                      ; preds = %39
  %50 = tail call i32* @__errno_location() #1, !dbg !1284
  store i32 22, i32* %50, align 4, !dbg !1284, !tbaa !752
  br label %57, !dbg !1286

; <label>:51                                      ; preds = %39, %44, %40
  %new_off.1 = phi i64 [ %48, %44 ], [ %43, %40 ], [ %offset, %39 ]
  %52 = icmp slt i64 %new_off.1, 0, !dbg !1287
  br i1 %52, label %53, label %55, !dbg !1287

; <label>:53                                      ; preds = %51
  %54 = tail call i32* @__errno_location() #1, !dbg !1289
  store i32 22, i32* %54, align 4, !dbg !1289, !tbaa !752
  br label %57, !dbg !1291

; <label>:55                                      ; preds = %51
  %56 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1292
  store i64 %new_off.1, i64* %56, align 8, !dbg !1292, !tbaa !1146
  br label %57, !dbg !1293

; <label>:57                                      ; preds = %55, %53, %49, %37, %.thread, %__get_file.exit.thread
  %.0 = phi i64 [ -1, %49 ], [ -1, %53 ], [ %new_off.1, %55 ], [ -1, %.thread ], [ %new_off.0, %37 ], [ -1, %__get_file.exit.thread ]
  ret i64 %.0, !dbg !1294
}

; Function Attrs: nounwind uwtable
define i32 @__fd_stat(i8* %path, %struct.stat64* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !210), !dbg !1295
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !211), !dbg !1295
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1296), !dbg !1298
  %1 = load i8* %path, align 1, !dbg !1299, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !1300), !dbg !1299
  %2 = sext i8 %1 to i32, !dbg !1301
  %3 = icmp eq i8 %1, 0, !dbg !1301
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !1301

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !1301
  %6 = load i8* %5, align 1, !dbg !1301, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !1301
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1301

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1302, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !1302
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1302

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !1302
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1302

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1303
  %12 = ashr exact i32 %sext.i, 24, !dbg !1303
  %13 = add nsw i32 %12, 65, !dbg !1303
  %14 = icmp eq i32 %2, %13, !dbg !1303
  %15 = add i32 %i.02.i, 1, !dbg !1302
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !1304), !dbg !1302
  br i1 %14, label %16, label %10, !dbg !1303

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !1305
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1305, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !1306
  %20 = load %struct.stat64** %19, align 8, !dbg !1306, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !1306
  %22 = load i64* %21, align 8, !dbg !1306, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !1306
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !1305
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !1307
  %or.cond = or i1 %23, %25, !dbg !1306
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !1306

; <label>:26                                      ; preds = %16
  %27 = bitcast %struct.stat64* %buf to i8*, !dbg !1309
  %28 = bitcast %struct.stat64* %20 to i8*, !dbg !1309
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* %28, i64 144, i32 8, i1 false), !dbg !1309
  br label %59, !dbg !1311

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1312) #5, !dbg !1314
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1315) #5, !dbg !1317
  %29 = ptrtoint i8* %path to i64, !dbg !1318
  %30 = tail call i64 @klee_get_valuel(i64 %29) #5, !dbg !1318
  %31 = inttoptr i64 %30 to i8*, !dbg !1318
  tail call void @llvm.dbg.value(metadata !{i8* %31}, i64 0, metadata !1319) #5, !dbg !1318
  %32 = icmp eq i8* %31, %path, !dbg !1320
  %33 = zext i1 %32 to i64, !dbg !1320
  tail call void @klee_assume(i64 %33) #5, !dbg !1320
  tail call void @llvm.dbg.value(metadata !{i8* %31}, i64 0, metadata !1321) #5, !dbg !1316
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1322) #5, !dbg !1323
  br label %34, !dbg !1323

; <label>:34                                      ; preds = %51, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %52, %51 ]
  %sc.0.i = phi i8* [ %31, %__get_sym_file.exit.thread ], [ %sc.1.i, %51 ]
  %35 = load i8* %sc.0.i, align 1, !dbg !1324, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %35}, i64 0, metadata !1325) #5, !dbg !1324
  %36 = add i32 %i.0.i, -1, !dbg !1326
  %37 = and i32 %36, %i.0.i, !dbg !1326
  %38 = icmp eq i32 %37, 0, !dbg !1326
  br i1 %38, label %39, label %43, !dbg !1326

; <label>:39                                      ; preds = %34
  switch i8 %35, label %51 [
    i8 0, label %40
    i8 47, label %41
  ], !dbg !1327

; <label>:40                                      ; preds = %39
  store i8 0, i8* %sc.0.i, align 1, !dbg !1328, !tbaa !694
  br label %__concretize_string.exit, !dbg !1329

; <label>:41                                      ; preds = %39
  %42 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1330
  tail call void @llvm.dbg.value(metadata !{i8* %42}, i64 0, metadata !1321) #5, !dbg !1330
  store i8 47, i8* %sc.0.i, align 1, !dbg !1330, !tbaa !694
  br label %51, !dbg !1331

; <label>:43                                      ; preds = %34
  %44 = sext i8 %35 to i64, !dbg !1332
  %45 = tail call i64 @klee_get_valuel(i64 %44) #5, !dbg !1332
  %46 = trunc i64 %45 to i8, !dbg !1332
  tail call void @llvm.dbg.value(metadata !{i8 %46}, i64 0, metadata !1333) #5, !dbg !1332
  %47 = icmp eq i8 %46, %35, !dbg !1334
  %48 = zext i1 %47 to i64, !dbg !1334
  tail call void @klee_assume(i64 %48) #5, !dbg !1334
  %49 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1335
  tail call void @llvm.dbg.value(metadata !{i8* %49}, i64 0, metadata !1321) #5, !dbg !1335
  store i8 %46, i8* %sc.0.i, align 1, !dbg !1335, !tbaa !694
  %50 = icmp eq i8 %46, 0, !dbg !1336
  br i1 %50, label %__concretize_string.exit, label %51, !dbg !1336

; <label>:51                                      ; preds = %43, %41, %39
  %sc.1.i = phi i8* [ %49, %43 ], [ %42, %41 ], [ %sc.0.i, %39 ]
  %52 = add i32 %i.0.i, 1, !dbg !1323
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !1322) #5, !dbg !1323
  br label %34, !dbg !1323

__concretize_string.exit:                         ; preds = %43, %40
  %53 = tail call i64 (i64, ...)* @syscall(i64 4, i8* %path, %struct.stat64* %buf) #5, !dbg !1313
  %54 = trunc i64 %53 to i32, !dbg !1313
  tail call void @llvm.dbg.value(metadata !{i32 %54}, i64 0, metadata !213), !dbg !1313
  %55 = icmp eq i32 %54, -1, !dbg !1337
  br i1 %55, label %56, label %59, !dbg !1337

; <label>:56                                      ; preds = %__concretize_string.exit
  %57 = tail call i32 @klee_get_errno() #5, !dbg !1339
  %58 = tail call i32* @__errno_location() #1, !dbg !1339
  store i32 %57, i32* %58, align 4, !dbg !1339, !tbaa !752
  br label %59, !dbg !1339

; <label>:59                                      ; preds = %__concretize_string.exit, %56, %26
  %.0 = phi i32 [ 0, %26 ], [ -1, %56 ], [ %54, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1340
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @fstatat(i32 %fd, i8* %path, %struct.stat* %buf, i32 %flags) #7 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !239), !dbg !1341
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !240), !dbg !1341
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !241), !dbg !1341
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !242), !dbg !1341
  %1 = icmp eq i32 %fd, -100, !dbg !1342
  br i1 %1, label %22, label %2, !dbg !1342

; <label>:2                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1343), !dbg !1345
  %3 = icmp ult i32 %fd, 32, !dbg !1346
  br i1 %3, label %4, label %__get_file.exit.thread, !dbg !1346

; <label>:4                                       ; preds = %2
  %5 = sext i32 %fd to i64, !dbg !1347
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 1, !dbg !1348
  %7 = load i32* %6, align 4, !dbg !1348, !tbaa !765
  %8 = and i32 %7, 1, !dbg !1348
  %9 = icmp eq i32 %8, 0, !dbg !1348
  br i1 %9, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1348

__get_file.exit:                                  ; preds = %4
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, !dbg !1347
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !243), !dbg !1344
  %11 = icmp eq %struct.exe_file_t* %10, null, !dbg !1349
  br i1 %11, label %__get_file.exit.thread, label %13, !dbg !1349

__get_file.exit.thread:                           ; preds = %2, %4, %__get_file.exit
  %12 = tail call i32* @__errno_location() #1, !dbg !1351
  store i32 9, i32* %12, align 4, !dbg !1351, !tbaa !752
  br label %85, !dbg !1353

; <label>:13                                      ; preds = %__get_file.exit
  %14 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %5, i32 3, !dbg !1354
  %15 = load %struct.exe_disk_file_t** %14, align 8, !dbg !1354, !tbaa !788
  %16 = icmp eq %struct.exe_disk_file_t* %15, null, !dbg !1354
  br i1 %16, label %19, label %17, !dbg !1354

; <label>:17                                      ; preds = %13
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str2, i64 0, i64 0)) #5, !dbg !1356
  %18 = tail call i32* @__errno_location() #1, !dbg !1358
  store i32 2, i32* %18, align 4, !dbg !1358, !tbaa !752
  br label %85, !dbg !1359

; <label>:19                                      ; preds = %13
  %20 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !1360
  %21 = load i32* %20, align 8, !dbg !1360, !tbaa !855
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !239), !dbg !1360
  %phitmp = sext i32 %21 to i64, !dbg !1361
  br label %22, !dbg !1361

; <label>:22                                      ; preds = %0, %19
  %.01 = phi i64 [ %phitmp, %19 ], [ -100, %0 ]
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1362), !dbg !1364
  %23 = load i8* %path, align 1, !dbg !1365, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %23}, i64 0, metadata !1366), !dbg !1365
  %24 = sext i8 %23 to i32, !dbg !1367
  %25 = icmp eq i8 %23, 0, !dbg !1367
  br i1 %25, label %__get_sym_file.exit.thread, label %26, !dbg !1367

; <label>:26                                      ; preds = %22
  %27 = getelementptr inbounds i8* %path, i64 1, !dbg !1367
  %28 = load i8* %27, align 1, !dbg !1367, !tbaa !694
  %29 = icmp eq i8 %28, 0, !dbg !1367
  br i1 %29, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1367

.preheader.i:                                     ; preds = %26
  %30 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1368, !tbaa !701
  %31 = icmp eq i32 %30, 0, !dbg !1368
  br i1 %31, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1368

; <label>:32                                      ; preds = %.lr.ph.i
  %33 = icmp ult i32 %37, %30, !dbg !1368
  br i1 %33, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1368

.lr.ph.i:                                         ; preds = %.preheader.i, %32
  %i.02.i = phi i32 [ %37, %32 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1369
  %34 = ashr exact i32 %sext.i, 24, !dbg !1369
  %35 = add nsw i32 %34, 65, !dbg !1369
  %36 = icmp eq i32 %24, %35, !dbg !1369
  %37 = add i32 %i.02.i, 1, !dbg !1368
  tail call void @llvm.dbg.value(metadata !{i32 %37}, i64 0, metadata !1370), !dbg !1368
  br i1 %36, label %38, label %32, !dbg !1369

; <label>:38                                      ; preds = %.lr.ph.i
  %39 = zext i32 %i.02.i to i64, !dbg !1371
  %40 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1371, !tbaa !708
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, i32 2, !dbg !1372
  %42 = load %struct.stat64** %41, align 8, !dbg !1372, !tbaa !711
  %43 = getelementptr inbounds %struct.stat64* %42, i64 0, i32 1, !dbg !1372
  %44 = load i64* %43, align 8, !dbg !1372, !tbaa !713
  %45 = icmp eq i64 %44, 0, !dbg !1372
  %46 = getelementptr inbounds %struct.exe_disk_file_t* %40, i64 %39, !dbg !1371
  %47 = icmp eq %struct.exe_disk_file_t* %46, null, !dbg !1373
  %or.cond = or i1 %45, %47, !dbg !1372
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %48, !dbg !1372

; <label>:48                                      ; preds = %38
  %49 = bitcast %struct.stat* %buf to i8*, !dbg !1375
  %50 = bitcast %struct.stat64* %42 to i8*, !dbg !1375
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %49, i8* %50, i64 144, i32 8, i1 false), !dbg !1375
  br label %85, !dbg !1377

__get_sym_file.exit.thread:                       ; preds = %32, %.preheader.i, %38, %22, %26
  %51 = icmp eq i8* %path, null, !dbg !1378
  br i1 %51, label %__concretize_string.exit, label %52, !dbg !1378

; <label>:52                                      ; preds = %__get_sym_file.exit.thread
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1379) #5, !dbg !1381
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1382) #5, !dbg !1384
  %53 = ptrtoint i8* %path to i64, !dbg !1385
  %54 = tail call i64 @klee_get_valuel(i64 %53) #5, !dbg !1385
  %55 = inttoptr i64 %54 to i8*, !dbg !1385
  tail call void @llvm.dbg.value(metadata !{i8* %55}, i64 0, metadata !1386) #5, !dbg !1385
  %56 = icmp eq i8* %55, %path, !dbg !1387
  %57 = zext i1 %56 to i64, !dbg !1387
  tail call void @klee_assume(i64 %57) #5, !dbg !1387
  tail call void @llvm.dbg.value(metadata !{i8* %55}, i64 0, metadata !1388) #5, !dbg !1383
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1389) #5, !dbg !1390
  br label %58, !dbg !1390

; <label>:58                                      ; preds = %75, %52
  %i.0.i = phi i32 [ 0, %52 ], [ %76, %75 ]
  %sc.0.i = phi i8* [ %55, %52 ], [ %sc.1.i, %75 ]
  %59 = load i8* %sc.0.i, align 1, !dbg !1391, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %59}, i64 0, metadata !1392) #5, !dbg !1391
  %60 = add i32 %i.0.i, -1, !dbg !1393
  %61 = and i32 %60, %i.0.i, !dbg !1393
  %62 = icmp eq i32 %61, 0, !dbg !1393
  br i1 %62, label %63, label %67, !dbg !1393

; <label>:63                                      ; preds = %58
  switch i8 %59, label %75 [
    i8 0, label %64
    i8 47, label %65
  ], !dbg !1394

; <label>:64                                      ; preds = %63
  store i8 0, i8* %sc.0.i, align 1, !dbg !1395, !tbaa !694
  br label %__concretize_string.exit, !dbg !1396

; <label>:65                                      ; preds = %63
  %66 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1397
  tail call void @llvm.dbg.value(metadata !{i8* %66}, i64 0, metadata !1388) #5, !dbg !1397
  store i8 47, i8* %sc.0.i, align 1, !dbg !1397, !tbaa !694
  br label %75, !dbg !1398

; <label>:67                                      ; preds = %58
  %68 = sext i8 %59 to i64, !dbg !1399
  %69 = tail call i64 @klee_get_valuel(i64 %68) #5, !dbg !1399
  %70 = trunc i64 %69 to i8, !dbg !1399
  tail call void @llvm.dbg.value(metadata !{i8 %70}, i64 0, metadata !1400) #5, !dbg !1399
  %71 = icmp eq i8 %70, %59, !dbg !1401
  %72 = zext i1 %71 to i64, !dbg !1401
  tail call void @klee_assume(i64 %72) #5, !dbg !1401
  %73 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1402
  tail call void @llvm.dbg.value(metadata !{i8* %73}, i64 0, metadata !1388) #5, !dbg !1402
  store i8 %70, i8* %sc.0.i, align 1, !dbg !1402, !tbaa !694
  %74 = icmp eq i8 %70, 0, !dbg !1403
  br i1 %74, label %__concretize_string.exit, label %75, !dbg !1403

; <label>:75                                      ; preds = %67, %65, %63
  %sc.1.i = phi i8* [ %73, %67 ], [ %66, %65 ], [ %sc.0.i, %63 ]
  %76 = add i32 %i.0.i, 1, !dbg !1390
  tail call void @llvm.dbg.value(metadata !{i32 %76}, i64 0, metadata !1389) #5, !dbg !1390
  br label %58, !dbg !1390

__concretize_string.exit:                         ; preds = %67, %64, %__get_sym_file.exit.thread
  %77 = phi i8* [ null, %__get_sym_file.exit.thread ], [ %path, %64 ], [ %path, %67 ], !dbg !1380
  %78 = sext i32 %flags to i64, !dbg !1378
  %79 = tail call i64 (i64, ...)* @syscall(i64 262, i64 %.01, i8* %77, %struct.stat* %buf, i64 %78) #5, !dbg !1378
  %80 = trunc i64 %79 to i32, !dbg !1378
  tail call void @llvm.dbg.value(metadata !{i32 %80}, i64 0, metadata !247), !dbg !1378
  %81 = icmp eq i32 %80, -1, !dbg !1404
  br i1 %81, label %82, label %85, !dbg !1404

; <label>:82                                      ; preds = %__concretize_string.exit
  %83 = tail call i32 @klee_get_errno() #5, !dbg !1406
  %84 = tail call i32* @__errno_location() #1, !dbg !1406
  store i32 %83, i32* %84, align 4, !dbg !1406, !tbaa !752
  br label %85, !dbg !1406

; <label>:85                                      ; preds = %__concretize_string.exit, %82, %48, %17, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %17 ], [ 0, %48 ], [ -1, %__get_file.exit.thread ], [ -1, %82 ], [ %80, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1407
}

; Function Attrs: nounwind uwtable
define i32 @__fd_lstat(i8* %path, %struct.stat64* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !250), !dbg !1408
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !251), !dbg !1408
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1409), !dbg !1411
  %1 = load i8* %path, align 1, !dbg !1412, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !1413), !dbg !1412
  %2 = sext i8 %1 to i32, !dbg !1414
  %3 = icmp eq i8 %1, 0, !dbg !1414
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !1414

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !1414
  %6 = load i8* %5, align 1, !dbg !1414, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !1414
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1414

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1415, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !1415
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1415

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !1415
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1415

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1416
  %12 = ashr exact i32 %sext.i, 24, !dbg !1416
  %13 = add nsw i32 %12, 65, !dbg !1416
  %14 = icmp eq i32 %2, %13, !dbg !1416
  %15 = add i32 %i.02.i, 1, !dbg !1415
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !1417), !dbg !1415
  br i1 %14, label %16, label %10, !dbg !1416

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !1418
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1418, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !1419
  %20 = load %struct.stat64** %19, align 8, !dbg !1419, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !1419
  %22 = load i64* %21, align 8, !dbg !1419, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !1419
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !1418
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !1420
  %or.cond = or i1 %23, %25, !dbg !1419
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !1419

; <label>:26                                      ; preds = %16
  %27 = bitcast %struct.stat64* %buf to i8*, !dbg !1422
  %28 = bitcast %struct.stat64* %20 to i8*, !dbg !1422
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* %28, i64 144, i32 8, i1 false), !dbg !1422
  br label %59, !dbg !1424

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1425) #5, !dbg !1427
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1428) #5, !dbg !1430
  %29 = ptrtoint i8* %path to i64, !dbg !1431
  %30 = tail call i64 @klee_get_valuel(i64 %29) #5, !dbg !1431
  %31 = inttoptr i64 %30 to i8*, !dbg !1431
  tail call void @llvm.dbg.value(metadata !{i8* %31}, i64 0, metadata !1432) #5, !dbg !1431
  %32 = icmp eq i8* %31, %path, !dbg !1433
  %33 = zext i1 %32 to i64, !dbg !1433
  tail call void @klee_assume(i64 %33) #5, !dbg !1433
  tail call void @llvm.dbg.value(metadata !{i8* %31}, i64 0, metadata !1434) #5, !dbg !1429
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1435) #5, !dbg !1436
  br label %34, !dbg !1436

; <label>:34                                      ; preds = %51, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %52, %51 ]
  %sc.0.i = phi i8* [ %31, %__get_sym_file.exit.thread ], [ %sc.1.i, %51 ]
  %35 = load i8* %sc.0.i, align 1, !dbg !1437, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %35}, i64 0, metadata !1438) #5, !dbg !1437
  %36 = add i32 %i.0.i, -1, !dbg !1439
  %37 = and i32 %36, %i.0.i, !dbg !1439
  %38 = icmp eq i32 %37, 0, !dbg !1439
  br i1 %38, label %39, label %43, !dbg !1439

; <label>:39                                      ; preds = %34
  switch i8 %35, label %51 [
    i8 0, label %40
    i8 47, label %41
  ], !dbg !1440

; <label>:40                                      ; preds = %39
  store i8 0, i8* %sc.0.i, align 1, !dbg !1441, !tbaa !694
  br label %__concretize_string.exit, !dbg !1442

; <label>:41                                      ; preds = %39
  %42 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1443
  tail call void @llvm.dbg.value(metadata !{i8* %42}, i64 0, metadata !1434) #5, !dbg !1443
  store i8 47, i8* %sc.0.i, align 1, !dbg !1443, !tbaa !694
  br label %51, !dbg !1444

; <label>:43                                      ; preds = %34
  %44 = sext i8 %35 to i64, !dbg !1445
  %45 = tail call i64 @klee_get_valuel(i64 %44) #5, !dbg !1445
  %46 = trunc i64 %45 to i8, !dbg !1445
  tail call void @llvm.dbg.value(metadata !{i8 %46}, i64 0, metadata !1446) #5, !dbg !1445
  %47 = icmp eq i8 %46, %35, !dbg !1447
  %48 = zext i1 %47 to i64, !dbg !1447
  tail call void @klee_assume(i64 %48) #5, !dbg !1447
  %49 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1448
  tail call void @llvm.dbg.value(metadata !{i8* %49}, i64 0, metadata !1434) #5, !dbg !1448
  store i8 %46, i8* %sc.0.i, align 1, !dbg !1448, !tbaa !694
  %50 = icmp eq i8 %46, 0, !dbg !1449
  br i1 %50, label %__concretize_string.exit, label %51, !dbg !1449

; <label>:51                                      ; preds = %43, %41, %39
  %sc.1.i = phi i8* [ %49, %43 ], [ %42, %41 ], [ %sc.0.i, %39 ]
  %52 = add i32 %i.0.i, 1, !dbg !1436
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !1435) #5, !dbg !1436
  br label %34, !dbg !1436

__concretize_string.exit:                         ; preds = %43, %40
  %53 = tail call i64 (i64, ...)* @syscall(i64 6, i8* %path, %struct.stat64* %buf) #5, !dbg !1426
  %54 = trunc i64 %53 to i32, !dbg !1426
  tail call void @llvm.dbg.value(metadata !{i32 %54}, i64 0, metadata !253), !dbg !1426
  %55 = icmp eq i32 %54, -1, !dbg !1450
  br i1 %55, label %56, label %59, !dbg !1450

; <label>:56                                      ; preds = %__concretize_string.exit
  %57 = tail call i32 @klee_get_errno() #5, !dbg !1452
  %58 = tail call i32* @__errno_location() #1, !dbg !1452
  store i32 %57, i32* %58, align 4, !dbg !1452, !tbaa !752
  br label %59, !dbg !1452

; <label>:59                                      ; preds = %__concretize_string.exit, %56, %26
  %.0 = phi i32 [ 0, %26 ], [ -1, %56 ], [ %54, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1453
}

; Function Attrs: nounwind uwtable
define i32 @chdir(i8* %path) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !259), !dbg !1454
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1455), !dbg !1457
  %1 = load i8* %path, align 1, !dbg !1458, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !1459), !dbg !1458
  %2 = sext i8 %1 to i32, !dbg !1460
  %3 = icmp eq i8 %1, 0, !dbg !1460
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !1460

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !1460
  %6 = load i8* %5, align 1, !dbg !1460, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !1460
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1460

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1461, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !1461
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1461

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !1461
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1461

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1462
  %12 = ashr exact i32 %sext.i, 24, !dbg !1462
  %13 = add nsw i32 %12, 65, !dbg !1462
  %14 = icmp eq i32 %2, %13, !dbg !1462
  %15 = add i32 %i.02.i, 1, !dbg !1461
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !1463), !dbg !1461
  br i1 %14, label %16, label %10, !dbg !1462

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !1464
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1464, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !1465
  %20 = load %struct.stat64** %19, align 8, !dbg !1465, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !1465
  %22 = load i64* %21, align 8, !dbg !1465, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !1465
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !1464
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !1466
  %or.cond = or i1 %23, %25, !dbg !1465
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !1465

; <label>:26                                      ; preds = %16
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str9, i64 0, i64 0)) #5, !dbg !1468
  %27 = tail call i32* @__errno_location() #1, !dbg !1470
  store i32 2, i32* %27, align 4, !dbg !1470, !tbaa !752
  br label %58, !dbg !1471

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1472) #5, !dbg !1474
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1475) #5, !dbg !1477
  %28 = ptrtoint i8* %path to i64, !dbg !1478
  %29 = tail call i64 @klee_get_valuel(i64 %28) #5, !dbg !1478
  %30 = inttoptr i64 %29 to i8*, !dbg !1478
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1479) #5, !dbg !1478
  %31 = icmp eq i8* %30, %path, !dbg !1480
  %32 = zext i1 %31 to i64, !dbg !1480
  tail call void @klee_assume(i64 %32) #5, !dbg !1480
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1481) #5, !dbg !1476
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1482) #5, !dbg !1483
  br label %33, !dbg !1483

; <label>:33                                      ; preds = %50, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %51, %50 ]
  %sc.0.i = phi i8* [ %30, %__get_sym_file.exit.thread ], [ %sc.1.i, %50 ]
  %34 = load i8* %sc.0.i, align 1, !dbg !1484, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %34}, i64 0, metadata !1485) #5, !dbg !1484
  %35 = add i32 %i.0.i, -1, !dbg !1486
  %36 = and i32 %35, %i.0.i, !dbg !1486
  %37 = icmp eq i32 %36, 0, !dbg !1486
  br i1 %37, label %38, label %42, !dbg !1486

; <label>:38                                      ; preds = %33
  switch i8 %34, label %50 [
    i8 0, label %39
    i8 47, label %40
  ], !dbg !1487

; <label>:39                                      ; preds = %38
  store i8 0, i8* %sc.0.i, align 1, !dbg !1488, !tbaa !694
  br label %__concretize_string.exit, !dbg !1489

; <label>:40                                      ; preds = %38
  %41 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1490
  tail call void @llvm.dbg.value(metadata !{i8* %41}, i64 0, metadata !1481) #5, !dbg !1490
  store i8 47, i8* %sc.0.i, align 1, !dbg !1490, !tbaa !694
  br label %50, !dbg !1491

; <label>:42                                      ; preds = %33
  %43 = sext i8 %34 to i64, !dbg !1492
  %44 = tail call i64 @klee_get_valuel(i64 %43) #5, !dbg !1492
  %45 = trunc i64 %44 to i8, !dbg !1492
  tail call void @llvm.dbg.value(metadata !{i8 %45}, i64 0, metadata !1493) #5, !dbg !1492
  %46 = icmp eq i8 %45, %34, !dbg !1494
  %47 = zext i1 %46 to i64, !dbg !1494
  tail call void @klee_assume(i64 %47) #5, !dbg !1494
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1495
  tail call void @llvm.dbg.value(metadata !{i8* %48}, i64 0, metadata !1481) #5, !dbg !1495
  store i8 %45, i8* %sc.0.i, align 1, !dbg !1495, !tbaa !694
  %49 = icmp eq i8 %45, 0, !dbg !1496
  br i1 %49, label %__concretize_string.exit, label %50, !dbg !1496

; <label>:50                                      ; preds = %42, %40, %38
  %sc.1.i = phi i8* [ %48, %42 ], [ %41, %40 ], [ %sc.0.i, %38 ]
  %51 = add i32 %i.0.i, 1, !dbg !1483
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !1482) #5, !dbg !1483
  br label %33, !dbg !1483

__concretize_string.exit:                         ; preds = %42, %39
  %52 = tail call i64 (i64, ...)* @syscall(i64 80, i8* %path) #5, !dbg !1473
  %53 = trunc i64 %52 to i32, !dbg !1473
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !261), !dbg !1473
  %54 = icmp eq i32 %53, -1, !dbg !1497
  br i1 %54, label %55, label %58, !dbg !1497

; <label>:55                                      ; preds = %__concretize_string.exit
  %56 = tail call i32 @klee_get_errno() #5, !dbg !1499
  %57 = tail call i32* @__errno_location() #1, !dbg !1499
  store i32 %56, i32* %57, align 4, !dbg !1499, !tbaa !752
  br label %58, !dbg !1499

; <label>:58                                      ; preds = %__concretize_string.exit, %55, %26
  %.0 = phi i32 [ -1, %26 ], [ -1, %55 ], [ %53, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1500
}

; Function Attrs: nounwind uwtable
define i32 @fchdir(i32 %fd) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !265), !dbg !1501
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1502), !dbg !1504
  %1 = icmp ult i32 %fd, 32, !dbg !1505
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1505

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1506
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1507
  %5 = load i32* %4, align 4, !dbg !1507, !tbaa !765
  %6 = and i32 %5, 1, !dbg !1507
  %7 = icmp eq i32 %6, 0, !dbg !1507
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1507

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1506
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !266), !dbg !1503
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1508
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !1508

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !1510
  store i32 9, i32* %10, align 4, !dbg !1510, !tbaa !752
  br label %26, !dbg !1512

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1513
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !1513, !tbaa !788
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !1513
  br i1 %14, label %17, label %15, !dbg !1513

; <label>:15                                      ; preds = %11
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str9, i64 0, i64 0)) #5, !dbg !1514
  %16 = tail call i32* @__errno_location() #1, !dbg !1516
  store i32 2, i32* %16, align 4, !dbg !1516, !tbaa !752
  br label %26, !dbg !1517

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !1518
  %19 = load i32* %18, align 8, !dbg !1518, !tbaa !855
  %20 = tail call i64 (i64, ...)* @syscall(i64 81, i32 %19) #5, !dbg !1518
  %21 = trunc i64 %20 to i32, !dbg !1518
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !267), !dbg !1518
  %22 = icmp eq i32 %21, -1, !dbg !1519
  br i1 %22, label %23, label %26, !dbg !1519

; <label>:23                                      ; preds = %17
  %24 = tail call i32 @klee_get_errno() #5, !dbg !1521
  %25 = tail call i32* @__errno_location() #1, !dbg !1521
  store i32 %24, i32* %25, align 4, !dbg !1521, !tbaa !752
  br label %26, !dbg !1521

; <label>:26                                      ; preds = %17, %23, %15, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %15 ], [ -1, %__get_file.exit.thread ], [ -1, %23 ], [ %21, %17 ]
  ret i32 %.0, !dbg !1522
}

; Function Attrs: nounwind uwtable
define i32 @chmod(i8* %path, i32 %mode) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !274), !dbg !1523
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !275), !dbg !1523
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1524), !dbg !1526
  %1 = load i8* %path, align 1, !dbg !1527, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !1528), !dbg !1527
  %2 = sext i8 %1 to i32, !dbg !1529
  %3 = icmp eq i8 %1, 0, !dbg !1529
  br i1 %3, label %__get_sym_file.exit, label %4, !dbg !1529

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !1529
  %6 = load i8* %5, align 1, !dbg !1529, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !1529
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit, !dbg !1529

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1530, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !1530
  br i1 %9, label %__get_sym_file.exit, label %.lr.ph.i, !dbg !1530

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !1530
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit, !dbg !1530

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1531
  %12 = ashr exact i32 %sext.i, 24, !dbg !1531
  %13 = add nsw i32 %12, 65, !dbg !1531
  %14 = icmp eq i32 %2, %13, !dbg !1531
  %15 = add i32 %i.02.i, 1, !dbg !1530
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !1532), !dbg !1530
  br i1 %14, label %16, label %10, !dbg !1531

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !1533
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1533, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !1534
  %20 = load %struct.stat64** %19, align 8, !dbg !1534, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !1534
  %22 = load i64* %21, align 8, !dbg !1534, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !1534
  br i1 %23, label %__get_sym_file.exit, label %24, !dbg !1534

; <label>:24                                      ; preds = %16
  %25 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !1533
  br label %__get_sym_file.exit, !dbg !1535

__get_sym_file.exit:                              ; preds = %10, %0, %4, %.preheader.i, %16, %24
  %.0.i = phi %struct.exe_disk_file_t* [ %25, %24 ], [ null, %4 ], [ null, %0 ], [ null, %16 ], [ null, %.preheader.i ], [ null, %10 ]
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %.0.i}, i64 0, metadata !276), !dbg !1525
  %26 = load i32* @chmod.n_calls, align 4, !dbg !1536, !tbaa !752
  %27 = add nsw i32 %26, 1, !dbg !1536
  store i32 %27, i32* @chmod.n_calls, align 4, !dbg !1536, !tbaa !752
  %28 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1537, !tbaa !1092
  %29 = icmp eq i32 %28, 0, !dbg !1537
  br i1 %29, label %37, label %30, !dbg !1537

; <label>:30                                      ; preds = %__get_sym_file.exit
  %31 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 11), align 8, !dbg !1537, !tbaa !1539
  %32 = load i32* %31, align 4, !dbg !1537, !tbaa !752
  %33 = icmp eq i32 %32, %27, !dbg !1537
  br i1 %33, label %34, label %37, !dbg !1537

; <label>:34                                      ; preds = %30
  %35 = add i32 %28, -1, !dbg !1540
  store i32 %35, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1540, !tbaa !1092
  %36 = tail call i32* @__errno_location() #1, !dbg !1542
  store i32 5, i32* %36, align 4, !dbg !1542, !tbaa !752
  br label %__df_chmod.exit, !dbg !1543

; <label>:37                                      ; preds = %__get_sym_file.exit, %30
  %38 = icmp eq %struct.exe_disk_file_t* %.0.i, null, !dbg !1544
  br i1 %38, label %60, label %39, !dbg !1544

; <label>:39                                      ; preds = %37
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %.0.i}, i64 0, metadata !1545) #5, !dbg !1548
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !1549) #5, !dbg !1548
  %40 = tail call i32 @geteuid() #5, !dbg !1550
  %41 = getelementptr inbounds %struct.exe_disk_file_t* %.0.i, i64 0, i32 2, !dbg !1550
  %42 = load %struct.stat64** %41, align 8, !dbg !1550, !tbaa !711
  %43 = getelementptr inbounds %struct.stat64* %42, i64 0, i32 4, !dbg !1550
  %44 = load i32* %43, align 4, !dbg !1550, !tbaa !1552
  %45 = icmp eq i32 %40, %44, !dbg !1550
  br i1 %45, label %46, label %58, !dbg !1550

; <label>:46                                      ; preds = %39
  %47 = tail call i32 @getgid() #5, !dbg !1553
  %48 = load %struct.stat64** %41, align 8, !dbg !1553, !tbaa !711
  %49 = getelementptr inbounds %struct.stat64* %48, i64 0, i32 5, !dbg !1553
  %50 = load i32* %49, align 4, !dbg !1553, !tbaa !1556
  %51 = icmp eq i32 %47, %50, !dbg !1553
  %52 = and i32 %mode, 3071, !dbg !1557
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !1549) #5, !dbg !1557
  %mode..i = select i1 %51, i32 %mode, i32 %52, !dbg !1553
  %53 = getelementptr inbounds %struct.stat64* %48, i64 0, i32 3, !dbg !1558
  %54 = load i32* %53, align 4, !dbg !1558, !tbaa !805
  %55 = and i32 %54, -4096, !dbg !1558
  %56 = and i32 %mode..i, 4095, !dbg !1558
  %57 = or i32 %56, %55, !dbg !1558
  store i32 %57, i32* %53, align 4, !dbg !1558, !tbaa !805
  br label %__df_chmod.exit, !dbg !1559

; <label>:58                                      ; preds = %39
  %59 = tail call i32* @__errno_location() #1, !dbg !1560
  store i32 1, i32* %59, align 4, !dbg !1560, !tbaa !752
  br label %__df_chmod.exit, !dbg !1562

; <label>:60                                      ; preds = %37
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1563) #5, !dbg !1565
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1566) #5, !dbg !1568
  %61 = ptrtoint i8* %path to i64, !dbg !1569
  %62 = tail call i64 @klee_get_valuel(i64 %61) #5, !dbg !1569
  %63 = inttoptr i64 %62 to i8*, !dbg !1569
  tail call void @llvm.dbg.value(metadata !{i8* %63}, i64 0, metadata !1570) #5, !dbg !1569
  %64 = icmp eq i8* %63, %path, !dbg !1571
  %65 = zext i1 %64 to i64, !dbg !1571
  tail call void @klee_assume(i64 %65) #5, !dbg !1571
  tail call void @llvm.dbg.value(metadata !{i8* %63}, i64 0, metadata !1572) #5, !dbg !1567
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1573) #5, !dbg !1574
  br label %66, !dbg !1574

; <label>:66                                      ; preds = %83, %60
  %i.0.i = phi i32 [ 0, %60 ], [ %84, %83 ]
  %sc.0.i = phi i8* [ %63, %60 ], [ %sc.1.i, %83 ]
  %67 = load i8* %sc.0.i, align 1, !dbg !1575, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %67}, i64 0, metadata !1576) #5, !dbg !1575
  %68 = add i32 %i.0.i, -1, !dbg !1577
  %69 = and i32 %68, %i.0.i, !dbg !1577
  %70 = icmp eq i32 %69, 0, !dbg !1577
  br i1 %70, label %71, label %75, !dbg !1577

; <label>:71                                      ; preds = %66
  switch i8 %67, label %83 [
    i8 0, label %72
    i8 47, label %73
  ], !dbg !1578

; <label>:72                                      ; preds = %71
  store i8 0, i8* %sc.0.i, align 1, !dbg !1579, !tbaa !694
  br label %__concretize_string.exit, !dbg !1580

; <label>:73                                      ; preds = %71
  %74 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1581
  tail call void @llvm.dbg.value(metadata !{i8* %74}, i64 0, metadata !1572) #5, !dbg !1581
  store i8 47, i8* %sc.0.i, align 1, !dbg !1581, !tbaa !694
  br label %83, !dbg !1582

; <label>:75                                      ; preds = %66
  %76 = sext i8 %67 to i64, !dbg !1583
  %77 = tail call i64 @klee_get_valuel(i64 %76) #5, !dbg !1583
  %78 = trunc i64 %77 to i8, !dbg !1583
  tail call void @llvm.dbg.value(metadata !{i8 %78}, i64 0, metadata !1584) #5, !dbg !1583
  %79 = icmp eq i8 %78, %67, !dbg !1585
  %80 = zext i1 %79 to i64, !dbg !1585
  tail call void @klee_assume(i64 %80) #5, !dbg !1585
  %81 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1586
  tail call void @llvm.dbg.value(metadata !{i8* %81}, i64 0, metadata !1572) #5, !dbg !1586
  store i8 %78, i8* %sc.0.i, align 1, !dbg !1586, !tbaa !694
  %82 = icmp eq i8 %78, 0, !dbg !1587
  br i1 %82, label %__concretize_string.exit, label %83, !dbg !1587

; <label>:83                                      ; preds = %75, %73, %71
  %sc.1.i = phi i8* [ %81, %75 ], [ %74, %73 ], [ %sc.0.i, %71 ]
  %84 = add i32 %i.0.i, 1, !dbg !1574
  tail call void @llvm.dbg.value(metadata !{i32 %84}, i64 0, metadata !1573) #5, !dbg !1574
  br label %66, !dbg !1574

__concretize_string.exit:                         ; preds = %75, %72
  %85 = tail call i64 (i64, ...)* @syscall(i64 90, i8* %path, i32 %mode) #5, !dbg !1564
  %86 = trunc i64 %85 to i32, !dbg !1564
  tail call void @llvm.dbg.value(metadata !{i32 %86}, i64 0, metadata !277), !dbg !1564
  %87 = icmp eq i32 %86, -1, !dbg !1588
  br i1 %87, label %88, label %__df_chmod.exit, !dbg !1588

; <label>:88                                      ; preds = %__concretize_string.exit
  %89 = tail call i32 @klee_get_errno() #5, !dbg !1590
  %90 = tail call i32* @__errno_location() #1, !dbg !1590
  store i32 %89, i32* %90, align 4, !dbg !1590, !tbaa !752
  br label %__df_chmod.exit, !dbg !1590

__df_chmod.exit:                                  ; preds = %58, %46, %__concretize_string.exit, %88, %34
  %.0 = phi i32 [ -1, %34 ], [ -1, %88 ], [ %86, %__concretize_string.exit ], [ 0, %46 ], [ -1, %58 ]
  ret i32 %.0, !dbg !1591
}

; Function Attrs: nounwind uwtable
define i32 @fchmod(i32 %fd, i32 %mode) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !284), !dbg !1592
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !285), !dbg !1592
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1593), !dbg !1595
  %1 = icmp ult i32 %fd, 32, !dbg !1596
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1596

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1597
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1598
  %5 = load i32* %4, align 4, !dbg !1598, !tbaa !765
  %6 = and i32 %5, 1, !dbg !1598
  %7 = icmp eq i32 %6, 0, !dbg !1598
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1598

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1597
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !286), !dbg !1594
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1599
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !1599

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !1601
  store i32 9, i32* %10, align 4, !dbg !1601, !tbaa !752
  br label %__df_chmod.exit, !dbg !1603

; <label>:11                                      ; preds = %__get_file.exit
  %12 = load i32* @fchmod.n_calls, align 4, !dbg !1604, !tbaa !752
  %13 = add nsw i32 %12, 1, !dbg !1604
  store i32 %13, i32* @fchmod.n_calls, align 4, !dbg !1604, !tbaa !752
  %14 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1605, !tbaa !1092
  %15 = icmp eq i32 %14, 0, !dbg !1605
  br i1 %15, label %23, label %16, !dbg !1605

; <label>:16                                      ; preds = %11
  %17 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 12), align 8, !dbg !1605, !tbaa !1607
  %18 = load i32* %17, align 4, !dbg !1605, !tbaa !752
  %19 = icmp eq i32 %18, %13, !dbg !1605
  br i1 %19, label %20, label %23, !dbg !1605

; <label>:20                                      ; preds = %16
  %21 = add i32 %14, -1, !dbg !1608
  store i32 %21, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1608, !tbaa !1092
  %22 = tail call i32* @__errno_location() #1, !dbg !1610
  store i32 5, i32* %22, align 4, !dbg !1610, !tbaa !752
  br label %__df_chmod.exit, !dbg !1611

; <label>:23                                      ; preds = %11, %16
  %24 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1612
  %25 = load %struct.exe_disk_file_t** %24, align 8, !dbg !1612, !tbaa !788
  %26 = icmp eq %struct.exe_disk_file_t* %25, null, !dbg !1612
  br i1 %26, label %48, label %27, !dbg !1612

; <label>:27                                      ; preds = %23
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %25}, i64 0, metadata !1613) #5, !dbg !1616
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !1617) #5, !dbg !1616
  %28 = tail call i32 @geteuid() #5, !dbg !1618
  %29 = getelementptr inbounds %struct.exe_disk_file_t* %25, i64 0, i32 2, !dbg !1618
  %30 = load %struct.stat64** %29, align 8, !dbg !1618, !tbaa !711
  %31 = getelementptr inbounds %struct.stat64* %30, i64 0, i32 4, !dbg !1618
  %32 = load i32* %31, align 4, !dbg !1618, !tbaa !1552
  %33 = icmp eq i32 %28, %32, !dbg !1618
  br i1 %33, label %34, label %46, !dbg !1618

; <label>:34                                      ; preds = %27
  %35 = tail call i32 @getgid() #5, !dbg !1619
  %36 = load %struct.stat64** %29, align 8, !dbg !1619, !tbaa !711
  %37 = getelementptr inbounds %struct.stat64* %36, i64 0, i32 5, !dbg !1619
  %38 = load i32* %37, align 4, !dbg !1619, !tbaa !1556
  %39 = icmp eq i32 %35, %38, !dbg !1619
  %40 = and i32 %mode, 3071, !dbg !1620
  tail call void @llvm.dbg.value(metadata !{i32 %40}, i64 0, metadata !1617) #5, !dbg !1620
  %mode..i = select i1 %39, i32 %mode, i32 %40, !dbg !1619
  %41 = getelementptr inbounds %struct.stat64* %36, i64 0, i32 3, !dbg !1621
  %42 = load i32* %41, align 4, !dbg !1621, !tbaa !805
  %43 = and i32 %42, -4096, !dbg !1621
  %44 = and i32 %mode..i, 4095, !dbg !1621
  %45 = or i32 %44, %43, !dbg !1621
  store i32 %45, i32* %41, align 4, !dbg !1621, !tbaa !805
  br label %__df_chmod.exit, !dbg !1622

; <label>:46                                      ; preds = %27
  %47 = tail call i32* @__errno_location() #1, !dbg !1623
  store i32 1, i32* %47, align 4, !dbg !1623, !tbaa !752
  br label %__df_chmod.exit, !dbg !1624

; <label>:48                                      ; preds = %23
  %49 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !1625
  %50 = load i32* %49, align 8, !dbg !1625, !tbaa !855
  %51 = tail call i64 (i64, ...)* @syscall(i64 91, i32 %50, i32 %mode) #5, !dbg !1625
  %52 = trunc i64 %51 to i32, !dbg !1625
  tail call void @llvm.dbg.value(metadata !{i32 %52}, i64 0, metadata !287), !dbg !1625
  %53 = icmp eq i32 %52, -1, !dbg !1626
  br i1 %53, label %54, label %__df_chmod.exit, !dbg !1626

; <label>:54                                      ; preds = %48
  %55 = tail call i32 @klee_get_errno() #5, !dbg !1628
  %56 = tail call i32* @__errno_location() #1, !dbg !1628
  store i32 %55, i32* %56, align 4, !dbg !1628, !tbaa !752
  br label %__df_chmod.exit, !dbg !1628

__df_chmod.exit:                                  ; preds = %46, %34, %48, %54, %20, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %20 ], [ -1, %__get_file.exit.thread ], [ -1, %54 ], [ %52, %48 ], [ 0, %34 ], [ -1, %46 ]
  ret i32 %.0, !dbg !1629
}

; Function Attrs: nounwind uwtable
define i32 @chown(i8* %path, i32 %owner, i32 %group) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !296), !dbg !1630
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !297), !dbg !1630
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !298), !dbg !1630
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1631), !dbg !1633
  %1 = load i8* %path, align 1, !dbg !1634, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !1635), !dbg !1634
  %2 = sext i8 %1 to i32, !dbg !1636
  %3 = icmp eq i8 %1, 0, !dbg !1636
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !1636

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !1636
  %6 = load i8* %5, align 1, !dbg !1636, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !1636
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1636

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1637, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !1637
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1637

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !1637
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1637

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1638
  %12 = ashr exact i32 %sext.i, 24, !dbg !1638
  %13 = add nsw i32 %12, 65, !dbg !1638
  %14 = icmp eq i32 %2, %13, !dbg !1638
  %15 = add i32 %i.02.i, 1, !dbg !1637
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !1639), !dbg !1637
  br i1 %14, label %16, label %10, !dbg !1638

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !1640
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1640, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !1641
  %20 = load %struct.stat64** %19, align 8, !dbg !1641, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !1641
  %22 = load i64* %21, align 8, !dbg !1641, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !1641
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !1640
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !1642
  %or.cond = or i1 %23, %25, !dbg !1641
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !1641

; <label>:26                                      ; preds = %16
  tail call void @llvm.dbg.value(metadata !1643, i64 0, metadata !1644) #5, !dbg !1647
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1648) #5, !dbg !1647
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1649) #5, !dbg !1647
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str24, i64 0, i64 0)) #5, !dbg !1650
  %27 = tail call i32* @__errno_location() #1, !dbg !1651
  store i32 1, i32* %27, align 4, !dbg !1651, !tbaa !752
  br label %58, !dbg !1645

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1652) #5, !dbg !1654
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1655) #5, !dbg !1657
  %28 = ptrtoint i8* %path to i64, !dbg !1658
  %29 = tail call i64 @klee_get_valuel(i64 %28) #5, !dbg !1658
  %30 = inttoptr i64 %29 to i8*, !dbg !1658
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1659) #5, !dbg !1658
  %31 = icmp eq i8* %30, %path, !dbg !1660
  %32 = zext i1 %31 to i64, !dbg !1660
  tail call void @klee_assume(i64 %32) #5, !dbg !1660
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1661) #5, !dbg !1656
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1662) #5, !dbg !1663
  br label %33, !dbg !1663

; <label>:33                                      ; preds = %50, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %51, %50 ]
  %sc.0.i = phi i8* [ %30, %__get_sym_file.exit.thread ], [ %sc.1.i, %50 ]
  %34 = load i8* %sc.0.i, align 1, !dbg !1664, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %34}, i64 0, metadata !1665) #5, !dbg !1664
  %35 = add i32 %i.0.i, -1, !dbg !1666
  %36 = and i32 %35, %i.0.i, !dbg !1666
  %37 = icmp eq i32 %36, 0, !dbg !1666
  br i1 %37, label %38, label %42, !dbg !1666

; <label>:38                                      ; preds = %33
  switch i8 %34, label %50 [
    i8 0, label %39
    i8 47, label %40
  ], !dbg !1667

; <label>:39                                      ; preds = %38
  store i8 0, i8* %sc.0.i, align 1, !dbg !1668, !tbaa !694
  br label %__concretize_string.exit, !dbg !1669

; <label>:40                                      ; preds = %38
  %41 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1670
  tail call void @llvm.dbg.value(metadata !{i8* %41}, i64 0, metadata !1661) #5, !dbg !1670
  store i8 47, i8* %sc.0.i, align 1, !dbg !1670, !tbaa !694
  br label %50, !dbg !1671

; <label>:42                                      ; preds = %33
  %43 = sext i8 %34 to i64, !dbg !1672
  %44 = tail call i64 @klee_get_valuel(i64 %43) #5, !dbg !1672
  %45 = trunc i64 %44 to i8, !dbg !1672
  tail call void @llvm.dbg.value(metadata !{i8 %45}, i64 0, metadata !1673) #5, !dbg !1672
  %46 = icmp eq i8 %45, %34, !dbg !1674
  %47 = zext i1 %46 to i64, !dbg !1674
  tail call void @klee_assume(i64 %47) #5, !dbg !1674
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1675
  tail call void @llvm.dbg.value(metadata !{i8* %48}, i64 0, metadata !1661) #5, !dbg !1675
  store i8 %45, i8* %sc.0.i, align 1, !dbg !1675, !tbaa !694
  %49 = icmp eq i8 %45, 0, !dbg !1676
  br i1 %49, label %__concretize_string.exit, label %50, !dbg !1676

; <label>:50                                      ; preds = %42, %40, %38
  %sc.1.i = phi i8* [ %48, %42 ], [ %41, %40 ], [ %sc.0.i, %38 ]
  %51 = add i32 %i.0.i, 1, !dbg !1663
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !1662) #5, !dbg !1663
  br label %33, !dbg !1663

__concretize_string.exit:                         ; preds = %42, %39
  %52 = tail call i64 (i64, ...)* @syscall(i64 92, i8* %path, i32 %owner, i32 %group) #5, !dbg !1653
  %53 = trunc i64 %52 to i32, !dbg !1653
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !300), !dbg !1653
  %54 = icmp eq i32 %53, -1, !dbg !1677
  br i1 %54, label %55, label %58, !dbg !1677

; <label>:55                                      ; preds = %__concretize_string.exit
  %56 = tail call i32 @klee_get_errno() #5, !dbg !1679
  %57 = tail call i32* @__errno_location() #1, !dbg !1679
  store i32 %56, i32* %57, align 4, !dbg !1679, !tbaa !752
  br label %58, !dbg !1679

; <label>:58                                      ; preds = %__concretize_string.exit, %55, %26
  %.0 = phi i32 [ -1, %26 ], [ -1, %55 ], [ %53, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1680
}

; Function Attrs: nounwind uwtable
define i32 @fchown(i32 %fd, i32 %owner, i32 %group) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !307), !dbg !1681
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !308), !dbg !1681
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !309), !dbg !1681
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1682), !dbg !1684
  %1 = icmp ult i32 %fd, 32, !dbg !1685
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1685

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1686
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1687
  %5 = load i32* %4, align 4, !dbg !1687, !tbaa !765
  %6 = and i32 %5, 1, !dbg !1687
  %7 = icmp eq i32 %6, 0, !dbg !1687
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1686
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1688
  %or.cond = or i1 %7, %9, !dbg !1687
  br i1 %or.cond, label %__get_file.exit.thread, label %11, !dbg !1687

__get_file.exit.thread:                           ; preds = %0, %2
  %10 = tail call i32* @__errno_location() #1, !dbg !1690
  store i32 9, i32* %10, align 4, !dbg !1690, !tbaa !752
  br label %24, !dbg !1692

; <label>:11                                      ; preds = %2
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1693
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !1693, !tbaa !788
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !1693
  br i1 %14, label %17, label %15, !dbg !1693

; <label>:15                                      ; preds = %11
  tail call void @llvm.dbg.value(metadata !1643, i64 0, metadata !1694) #5, !dbg !1697
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1698) #5, !dbg !1697
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1699) #5, !dbg !1697
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str24, i64 0, i64 0)) #5, !dbg !1700
  %16 = tail call i32* @__errno_location() #1, !dbg !1701
  store i32 1, i32* %16, align 4, !dbg !1701, !tbaa !752
  br label %24, !dbg !1695

; <label>:17                                      ; preds = %11
  %18 = tail call i64 (i64, ...)* @syscall(i64 93, i32 %fd, i32 %owner, i32 %group) #5, !dbg !1702
  %19 = trunc i64 %18 to i32, !dbg !1702
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !311), !dbg !1702
  %20 = icmp eq i32 %19, -1, !dbg !1703
  br i1 %20, label %21, label %24, !dbg !1703

; <label>:21                                      ; preds = %17
  %22 = tail call i32 @klee_get_errno() #5, !dbg !1705
  %23 = tail call i32* @__errno_location() #1, !dbg !1705
  store i32 %22, i32* %23, align 4, !dbg !1705, !tbaa !752
  br label %24, !dbg !1705

; <label>:24                                      ; preds = %17, %21, %15, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %15 ], [ -1, %__get_file.exit.thread ], [ -1, %21 ], [ %19, %17 ]
  ret i32 %.0, !dbg !1706
}

; Function Attrs: nounwind uwtable
define i32 @lchown(i8* %path, i32 %owner, i32 %group) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !316), !dbg !1707
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !317), !dbg !1707
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !318), !dbg !1707
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1708), !dbg !1710
  %1 = load i8* %path, align 1, !dbg !1711, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !1712), !dbg !1711
  %2 = sext i8 %1 to i32, !dbg !1713
  %3 = icmp eq i8 %1, 0, !dbg !1713
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !1713

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !1713
  %6 = load i8* %5, align 1, !dbg !1713, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !1713
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !1713

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1714, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !1714
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !1714

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !1714
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !1714

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !1715
  %12 = ashr exact i32 %sext.i, 24, !dbg !1715
  %13 = add nsw i32 %12, 65, !dbg !1715
  %14 = icmp eq i32 %2, %13, !dbg !1715
  %15 = add i32 %i.02.i, 1, !dbg !1714
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !1716), !dbg !1714
  br i1 %14, label %16, label %10, !dbg !1715

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !1717
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1717, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !1718
  %20 = load %struct.stat64** %19, align 8, !dbg !1718, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !1718
  %22 = load i64* %21, align 8, !dbg !1718, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !1718
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !1717
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !1719
  %or.cond = or i1 %23, %25, !dbg !1718
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !1718

; <label>:26                                      ; preds = %16
  tail call void @llvm.dbg.value(metadata !1643, i64 0, metadata !1720) #5, !dbg !1723
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1724) #5, !dbg !1723
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1725) #5, !dbg !1723
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str24, i64 0, i64 0)) #5, !dbg !1726
  %27 = tail call i32* @__errno_location() #1, !dbg !1727
  store i32 1, i32* %27, align 4, !dbg !1727, !tbaa !752
  br label %58, !dbg !1721

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1728) #5, !dbg !1730
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1731) #5, !dbg !1733
  %28 = ptrtoint i8* %path to i64, !dbg !1734
  %29 = tail call i64 @klee_get_valuel(i64 %28) #5, !dbg !1734
  %30 = inttoptr i64 %29 to i8*, !dbg !1734
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1735) #5, !dbg !1734
  %31 = icmp eq i8* %30, %path, !dbg !1736
  %32 = zext i1 %31 to i64, !dbg !1736
  tail call void @klee_assume(i64 %32) #5, !dbg !1736
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !1737) #5, !dbg !1732
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1738) #5, !dbg !1739
  br label %33, !dbg !1739

; <label>:33                                      ; preds = %50, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %51, %50 ]
  %sc.0.i = phi i8* [ %30, %__get_sym_file.exit.thread ], [ %sc.1.i, %50 ]
  %34 = load i8* %sc.0.i, align 1, !dbg !1740, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %34}, i64 0, metadata !1741) #5, !dbg !1740
  %35 = add i32 %i.0.i, -1, !dbg !1742
  %36 = and i32 %35, %i.0.i, !dbg !1742
  %37 = icmp eq i32 %36, 0, !dbg !1742
  br i1 %37, label %38, label %42, !dbg !1742

; <label>:38                                      ; preds = %33
  switch i8 %34, label %50 [
    i8 0, label %39
    i8 47, label %40
  ], !dbg !1743

; <label>:39                                      ; preds = %38
  store i8 0, i8* %sc.0.i, align 1, !dbg !1744, !tbaa !694
  br label %__concretize_string.exit, !dbg !1745

; <label>:40                                      ; preds = %38
  %41 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1746
  tail call void @llvm.dbg.value(metadata !{i8* %41}, i64 0, metadata !1737) #5, !dbg !1746
  store i8 47, i8* %sc.0.i, align 1, !dbg !1746, !tbaa !694
  br label %50, !dbg !1747

; <label>:42                                      ; preds = %33
  %43 = sext i8 %34 to i64, !dbg !1748
  %44 = tail call i64 @klee_get_valuel(i64 %43) #5, !dbg !1748
  %45 = trunc i64 %44 to i8, !dbg !1748
  tail call void @llvm.dbg.value(metadata !{i8 %45}, i64 0, metadata !1749) #5, !dbg !1748
  %46 = icmp eq i8 %45, %34, !dbg !1750
  %47 = zext i1 %46 to i64, !dbg !1750
  tail call void @klee_assume(i64 %47) #5, !dbg !1750
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1751
  tail call void @llvm.dbg.value(metadata !{i8* %48}, i64 0, metadata !1737) #5, !dbg !1751
  store i8 %45, i8* %sc.0.i, align 1, !dbg !1751, !tbaa !694
  %49 = icmp eq i8 %45, 0, !dbg !1752
  br i1 %49, label %__concretize_string.exit, label %50, !dbg !1752

; <label>:50                                      ; preds = %42, %40, %38
  %sc.1.i = phi i8* [ %48, %42 ], [ %41, %40 ], [ %sc.0.i, %38 ]
  %51 = add i32 %i.0.i, 1, !dbg !1739
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !1738) #5, !dbg !1739
  br label %33, !dbg !1739

__concretize_string.exit:                         ; preds = %42, %39
  %52 = tail call i64 (i64, ...)* @syscall(i64 92, i8* %path, i32 %owner, i32 %group) #5, !dbg !1729
  %53 = trunc i64 %52 to i32, !dbg !1729
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !320), !dbg !1729
  %54 = icmp eq i32 %53, -1, !dbg !1753
  br i1 %54, label %55, label %58, !dbg !1753

; <label>:55                                      ; preds = %__concretize_string.exit
  %56 = tail call i32 @klee_get_errno() #5, !dbg !1755
  %57 = tail call i32* @__errno_location() #1, !dbg !1755
  store i32 %56, i32* %57, align 4, !dbg !1755, !tbaa !752
  br label %58, !dbg !1755

; <label>:58                                      ; preds = %__concretize_string.exit, %55, %26
  %.0 = phi i32 [ -1, %26 ], [ -1, %55 ], [ %53, %__concretize_string.exit ]
  ret i32 %.0, !dbg !1756
}

; Function Attrs: nounwind uwtable
define i32 @__fd_fstat(i32 %fd, %struct.stat64* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !327), !dbg !1757
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !328), !dbg !1757
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1758), !dbg !1760
  %1 = icmp ult i32 %fd, 32, !dbg !1761
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1761

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1762
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1763
  %5 = load i32* %4, align 4, !dbg !1763, !tbaa !765
  %6 = and i32 %5, 1, !dbg !1763
  %7 = icmp eq i32 %6, 0, !dbg !1763
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1763

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1762
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !329), !dbg !1759
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1764
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !1764

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !1766
  store i32 9, i32* %10, align 4, !dbg !1766, !tbaa !752
  br label %29, !dbg !1768

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1769
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !1769, !tbaa !788
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !1769
  br i1 %14, label %15, label %24, !dbg !1769

; <label>:15                                      ; preds = %11
  %16 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !1770
  %17 = load i32* %16, align 8, !dbg !1770, !tbaa !855
  %18 = tail call i64 (i64, ...)* @syscall(i64 5, i32 %17, %struct.stat64* %buf) #5, !dbg !1770
  %19 = trunc i64 %18 to i32, !dbg !1770
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !330), !dbg !1770
  %20 = icmp eq i32 %19, -1, !dbg !1771
  br i1 %20, label %21, label %29, !dbg !1771

; <label>:21                                      ; preds = %15
  %22 = tail call i32 @klee_get_errno() #5, !dbg !1773
  %23 = tail call i32* @__errno_location() #1, !dbg !1773
  store i32 %22, i32* %23, align 4, !dbg !1773, !tbaa !752
  br label %29, !dbg !1773

; <label>:24                                      ; preds = %11
  %25 = bitcast %struct.stat64* %buf to i8*, !dbg !1774
  %26 = getelementptr inbounds %struct.exe_disk_file_t* %13, i64 0, i32 2, !dbg !1774
  %27 = load %struct.stat64** %26, align 8, !dbg !1774, !tbaa !711
  %28 = bitcast %struct.stat64* %27 to i8*, !dbg !1774
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %28, i64 144, i32 8, i1 false), !dbg !1774
  br label %29, !dbg !1775

; <label>:29                                      ; preds = %15, %21, %24, %__get_file.exit.thread
  %.0 = phi i32 [ 0, %24 ], [ -1, %__get_file.exit.thread ], [ -1, %21 ], [ %19, %15 ]
  ret i32 %.0, !dbg !1776
}

; Function Attrs: nounwind uwtable
define i32 @__fd_ftruncate(i32 %fd, i64 %length) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !337), !dbg !1777
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !338), !dbg !1777
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1778), !dbg !1780
  %1 = icmp ult i32 %fd, 32, !dbg !1781
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1781

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1782
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1783
  %5 = load i32* %4, align 4, !dbg !1783, !tbaa !765
  %6 = and i32 %5, 1, !dbg !1783
  %7 = icmp eq i32 %6, 0, !dbg !1783
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1783

__get_file.exit.thread:                           ; preds = %2, %0
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !339), !dbg !1779
  %8 = load i32* @__fd_ftruncate.n_calls, align 4, !dbg !1784, !tbaa !752
  %9 = add nsw i32 %8, 1, !dbg !1784
  store i32 %9, i32* @__fd_ftruncate.n_calls, align 4, !dbg !1784, !tbaa !752
  br label %14, !dbg !1785

__get_file.exit:                                  ; preds = %2
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1782
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %10}, i64 0, metadata !339), !dbg !1779
  %11 = load i32* @__fd_ftruncate.n_calls, align 4, !dbg !1784, !tbaa !752
  %12 = add nsw i32 %11, 1, !dbg !1784
  store i32 %12, i32* @__fd_ftruncate.n_calls, align 4, !dbg !1784, !tbaa !752
  %13 = icmp eq %struct.exe_file_t* %10, null, !dbg !1785
  br i1 %13, label %14, label %16, !dbg !1785

; <label>:14                                      ; preds = %__get_file.exit.thread, %__get_file.exit
  %15 = tail call i32* @__errno_location() #1, !dbg !1787
  store i32 9, i32* %15, align 4, !dbg !1787, !tbaa !752
  br label %41, !dbg !1789

; <label>:16                                      ; preds = %__get_file.exit
  %17 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1790, !tbaa !1092
  %18 = icmp eq i32 %17, 0, !dbg !1790
  br i1 %18, label %26, label %19, !dbg !1790

; <label>:19                                      ; preds = %16
  %20 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !1790, !tbaa !1792
  %21 = load i32* %20, align 4, !dbg !1790, !tbaa !752
  %22 = icmp eq i32 %21, %12, !dbg !1790
  br i1 %22, label %23, label %26, !dbg !1790

; <label>:23                                      ; preds = %19
  %24 = add i32 %17, -1, !dbg !1793
  store i32 %24, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1793, !tbaa !1092
  %25 = tail call i32* @__errno_location() #1, !dbg !1795
  store i32 5, i32* %25, align 4, !dbg !1795, !tbaa !752
  br label %41, !dbg !1796

; <label>:26                                      ; preds = %16, %19
  %27 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1797
  %28 = load %struct.exe_disk_file_t** %27, align 8, !dbg !1797, !tbaa !788
  %29 = icmp eq %struct.exe_disk_file_t* %28, null, !dbg !1797
  br i1 %29, label %32, label %30, !dbg !1797

; <label>:30                                      ; preds = %26
  tail call void @klee_warning(i8* getelementptr inbounds ([30 x i8]* @.str10, i64 0, i64 0)) #5, !dbg !1798
  %31 = tail call i32* @__errno_location() #1, !dbg !1800
  store i32 5, i32* %31, align 4, !dbg !1800, !tbaa !752
  br label %41, !dbg !1801

; <label>:32                                      ; preds = %26
  %33 = getelementptr inbounds %struct.exe_file_t* %10, i64 0, i32 0, !dbg !1802
  %34 = load i32* %33, align 8, !dbg !1802, !tbaa !855
  %35 = tail call i64 (i64, ...)* @syscall(i64 77, i32 %34, i64 %length) #5, !dbg !1802
  %36 = trunc i64 %35 to i32, !dbg !1802
  tail call void @llvm.dbg.value(metadata !{i32 %36}, i64 0, metadata !340), !dbg !1802
  %37 = icmp eq i32 %36, -1, !dbg !1803
  br i1 %37, label %38, label %41, !dbg !1803

; <label>:38                                      ; preds = %32
  %39 = tail call i32 @klee_get_errno() #5, !dbg !1805
  %40 = tail call i32* @__errno_location() #1, !dbg !1805
  store i32 %39, i32* %40, align 4, !dbg !1805, !tbaa !752
  br label %41, !dbg !1805

; <label>:41                                      ; preds = %32, %38, %30, %23, %14
  %.0 = phi i32 [ -1, %23 ], [ -1, %30 ], [ -1, %14 ], [ -1, %38 ], [ %36, %32 ]
  ret i32 %.0, !dbg !1806
}

; Function Attrs: nounwind uwtable
define i32 @__fd_getdents(i32 %fd, %struct.dirent64* %dirp, i32 %count) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !361), !dbg !1807
  tail call void @llvm.dbg.value(metadata !{%struct.dirent64* %dirp}, i64 0, metadata !362), !dbg !1807
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !363), !dbg !1807
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1808), !dbg !1810
  %1 = icmp ult i32 %fd, 32, !dbg !1811
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1811

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1812
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1813
  %5 = load i32* %4, align 4, !dbg !1813, !tbaa !765
  %6 = and i32 %5, 1, !dbg !1813
  %7 = icmp eq i32 %6, 0, !dbg !1813
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1813

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1812
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !364), !dbg !1809
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1814
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !1814

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !1816
  store i32 9, i32* %10, align 4, !dbg !1816, !tbaa !752
  br label %.loopexit, !dbg !1818

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1819
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !1819, !tbaa !788
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !1819
  br i1 %14, label %17, label %15, !dbg !1819

; <label>:15                                      ; preds = %11
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str11, i64 0, i64 0)) #5, !dbg !1820
  %16 = tail call i32* @__errno_location() #1, !dbg !1822
  store i32 22, i32* %16, align 4, !dbg !1822, !tbaa !752
  br label %.loopexit, !dbg !1823

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1824
  %19 = load i64* %18, align 8, !dbg !1824, !tbaa !1146
  %20 = icmp ult i64 %19, 4096, !dbg !1824
  br i1 %20, label %21, label %69, !dbg !1824

; <label>:21                                      ; preds = %17
  tail call void @llvm.dbg.value(metadata !1218, i64 0, metadata !371), !dbg !1825
  %22 = udiv i64 %19, 280, !dbg !1826
  tail call void @llvm.dbg.value(metadata !{i64 %22}, i64 0, metadata !365), !dbg !1826
  %23 = mul i64 %22, 280, !dbg !1827
  %24 = icmp eq i64 %23, %19, !dbg !1827
  br i1 %24, label %25, label %30, !dbg !1827

; <label>:25                                      ; preds = %21
  %26 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1827, !tbaa !701
  %27 = zext i32 %26 to i64, !dbg !1827
  %28 = icmp ugt i64 %22, %27, !dbg !1827
  br i1 %28, label %30, label %.preheader, !dbg !1827

.preheader:                                       ; preds = %25
  %29 = icmp ult i64 %22, %27, !dbg !1829
  br i1 %29, label %.lr.ph, label %._crit_edge, !dbg !1829

; <label>:30                                      ; preds = %21, %25
  %31 = tail call i32* @__errno_location() #1, !dbg !1830
  store i32 22, i32* %31, align 4, !dbg !1830, !tbaa !752
  br label %.loopexit, !dbg !1832

.lr.ph:                                           ; preds = %.preheader, %.lr.ph
  %.015 = phi %struct.dirent64* [ %52, %.lr.ph ], [ %dirp, %.preheader ]
  %i.04 = phi i64 [ %48, %.lr.ph ], [ %22, %.preheader ]
  %bytes.03 = phi i64 [ %51, %.lr.ph ], [ 0, %.preheader ]
  %32 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1833, !tbaa !708
  %33 = getelementptr inbounds %struct.exe_disk_file_t* %32, i64 %i.04, i32 2, !dbg !1834
  %34 = load %struct.stat64** %33, align 8, !dbg !1834, !tbaa !711
  %35 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 1, !dbg !1834
  %36 = load i64* %35, align 8, !dbg !1834, !tbaa !713
  %37 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 0, !dbg !1834
  store i64 %36, i64* %37, align 8, !dbg !1834, !tbaa !1835
  %38 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 2, !dbg !1838
  store i16 280, i16* %38, align 2, !dbg !1838, !tbaa !1839
  %39 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1840
  %40 = load i32* %39, align 4, !dbg !1840, !tbaa !805
  %41 = lshr i32 %40, 12, !dbg !1840
  %.tr = trunc i32 %41 to i8, !dbg !1840
  %42 = and i8 %.tr, 15, !dbg !1840
  %43 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 3, !dbg !1840
  store i8 %42, i8* %43, align 1, !dbg !1840, !tbaa !1841
  %44 = add nsw i64 %i.04, 65, !dbg !1842
  %45 = trunc i64 %44 to i8, !dbg !1842
  %46 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 4, i64 0, !dbg !1842
  store i8 %45, i8* %46, align 1, !dbg !1842, !tbaa !694
  %47 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 4, i64 1, !dbg !1843
  store i8 0, i8* %47, align 1, !dbg !1843, !tbaa !694
  %48 = add nsw i64 %i.04, 1, !dbg !1844
  %49 = mul i64 %48, 280, !dbg !1844
  %50 = getelementptr inbounds %struct.dirent64* %.015, i64 0, i32 1, !dbg !1844
  store i64 %49, i64* %50, align 8, !dbg !1844, !tbaa !1845
  %51 = add nsw i64 %bytes.03, 280, !dbg !1846
  tail call void @llvm.dbg.value(metadata !{i64 %51}, i64 0, metadata !371), !dbg !1846
  %52 = getelementptr inbounds %struct.dirent64* %.015, i64 1, !dbg !1847
  tail call void @llvm.dbg.value(metadata !{%struct.dirent64* %52}, i64 0, metadata !362), !dbg !1847
  tail call void @llvm.dbg.value(metadata !{i64 %48}, i64 0, metadata !365), !dbg !1829
  %53 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1829, !tbaa !701
  %54 = zext i32 %53 to i64, !dbg !1829
  %55 = icmp slt i64 %48, %54, !dbg !1829
  br i1 %55, label %.lr.ph, label %._crit_edge, !dbg !1829

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %.01.lcssa = phi %struct.dirent64* [ %dirp, %.preheader ], [ %52, %.lr.ph ]
  %bytes.0.lcssa = phi i64 [ 0, %.preheader ], [ %51, %.lr.ph ]
  %56 = icmp ult i32 %count, 4096, !dbg !1848
  %57 = zext i32 %count to i64, !dbg !1848
  %58 = select i1 %56, i64 %57, i64 4096, !dbg !1848
  tail call void @llvm.dbg.value(metadata !{i64 %58}, i64 0, metadata !370), !dbg !1848
  %59 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 0, !dbg !1849
  store i64 0, i64* %59, align 8, !dbg !1849, !tbaa !1835
  %60 = sub nsw i64 %58, %bytes.0.lcssa, !dbg !1850
  %61 = trunc i64 %60 to i16, !dbg !1850
  %62 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 2, !dbg !1850
  store i16 %61, i16* %62, align 2, !dbg !1850, !tbaa !1839
  %63 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 3, !dbg !1851
  store i8 0, i8* %63, align 1, !dbg !1851, !tbaa !1841
  %64 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 4, i64 0, !dbg !1852
  store i8 0, i8* %64, align 1, !dbg !1852, !tbaa !694
  %65 = getelementptr inbounds %struct.dirent64* %.01.lcssa, i64 0, i32 1, !dbg !1853
  store i64 4096, i64* %65, align 8, !dbg !1853, !tbaa !1845
  %66 = and i64 %60, 65535, !dbg !1854
  %67 = add nsw i64 %66, %bytes.0.lcssa, !dbg !1854
  tail call void @llvm.dbg.value(metadata !{i64 %67}, i64 0, metadata !371), !dbg !1854
  store i64 %58, i64* %18, align 8, !dbg !1855, !tbaa !1146
  %68 = trunc i64 %67 to i32, !dbg !1856
  br label %.loopexit, !dbg !1856

; <label>:69                                      ; preds = %17
  %70 = add nsw i64 %19, -4096, !dbg !1857
  tail call void @llvm.dbg.value(metadata !{i64 %70}, i64 0, metadata !375), !dbg !1857
  tail call void @llvm.dbg.value(metadata !1218, i64 0, metadata !378), !dbg !1858
  %71 = bitcast %struct.dirent64* %dirp to i8*, !dbg !1859
  %72 = zext i32 %count to i64, !dbg !1859
  tail call void @llvm.memset.p0i8.i64(i8* %71, i8 0, i64 %72, i32 8, i1 false), !dbg !1859
  %73 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !1860
  %74 = load i32* %73, align 8, !dbg !1860, !tbaa !855
  %75 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %74, i64 %70, i32 0) #5, !dbg !1860
  tail call void @llvm.dbg.value(metadata !{i64 %75}, i64 0, metadata !378), !dbg !1860
  %76 = icmp eq i64 %75, -1, !dbg !1861
  br i1 %76, label %77, label %78, !dbg !1861

; <label>:77                                      ; preds = %69
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str12, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str4, i64 0, i64 0), i32 875, i8* getelementptr inbounds ([65 x i8]* @__PRETTY_FUNCTION__.__fd_getdents, i64 0, i64 0)) #8, !dbg !1861
  unreachable, !dbg !1861

; <label>:78                                      ; preds = %69
  %79 = load i32* %73, align 8, !dbg !1862, !tbaa !855
  %80 = tail call i64 (i64, ...)* @syscall(i64 217, i32 %79, %struct.dirent64* %dirp, i32 %count) #5, !dbg !1862
  %81 = trunc i64 %80 to i32, !dbg !1862
  tail call void @llvm.dbg.value(metadata !{i32 %81}, i64 0, metadata !377), !dbg !1862
  %82 = icmp eq i32 %81, -1, !dbg !1863
  br i1 %82, label %83, label %86, !dbg !1863

; <label>:83                                      ; preds = %78
  %84 = tail call i32 @klee_get_errno() #5, !dbg !1864
  %85 = tail call i32* @__errno_location() #1, !dbg !1864
  store i32 %84, i32* %85, align 4, !dbg !1864, !tbaa !752
  br label %.loopexit, !dbg !1866

; <label>:86                                      ; preds = %78
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !379), !dbg !1867
  %87 = load i32* %73, align 8, !dbg !1868, !tbaa !855
  %88 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %87, i32 0, i32 1) #5, !dbg !1868
  %89 = add nsw i64 %88, 4096, !dbg !1868
  store i64 %89, i64* %18, align 8, !dbg !1868, !tbaa !1146
  %90 = icmp sgt i32 %81, 0, !dbg !1869
  br i1 %90, label %.lr.ph9, label %.loopexit, !dbg !1869

.lr.ph9:                                          ; preds = %86, %.lr.ph9
  %pos.07 = phi i32 [ %100, %.lr.ph9 ], [ 0, %86 ]
  %91 = sext i32 %pos.07 to i64, !dbg !1870
  %.sum = add i64 %91, 8, !dbg !1871
  %92 = getelementptr inbounds i8* %71, i64 %.sum, !dbg !1871
  %93 = bitcast i8* %92 to i64*, !dbg !1871
  %94 = load i64* %93, align 8, !dbg !1871, !tbaa !1845
  %95 = add nsw i64 %94, 4096, !dbg !1871
  store i64 %95, i64* %93, align 8, !dbg !1871, !tbaa !1845
  %.sum2 = add i64 %91, 16, !dbg !1872
  %96 = getelementptr inbounds i8* %71, i64 %.sum2, !dbg !1872
  %97 = bitcast i8* %96 to i16*, !dbg !1872
  %98 = load i16* %97, align 2, !dbg !1872, !tbaa !1839
  %99 = zext i16 %98 to i32, !dbg !1872
  %100 = add nsw i32 %99, %pos.07, !dbg !1872
  tail call void @llvm.dbg.value(metadata !{i32 %100}, i64 0, metadata !379), !dbg !1872
  %101 = icmp slt i32 %100, %81, !dbg !1869
  br i1 %101, label %.lr.ph9, label %.loopexit, !dbg !1869

.loopexit:                                        ; preds = %.lr.ph9, %86, %83, %._crit_edge, %30, %15, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %15 ], [ -1, %30 ], [ %68, %._crit_edge ], [ -1, %__get_file.exit.thread ], [ -1, %83 ], [ %81, %86 ], [ %81, %.lr.ph9 ]
  ret i32 %.0, !dbg !1873
}

; Function Attrs: nounwind uwtable
define i32 @ioctl(i32 %fd, i64 %request, ...) #0 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !388), !dbg !1874
  call void @llvm.dbg.value(metadata !{i64 %request}, i64 0, metadata !389), !dbg !1874
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1875), !dbg !1877
  %1 = icmp ult i32 %fd, 32, !dbg !1878
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !1878

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !1879
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !1880
  %5 = load i32* %4, align 4, !dbg !1880, !tbaa !765
  %6 = and i32 %5, 1, !dbg !1880
  %7 = icmp eq i32 %6, 0, !dbg !1880
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1880

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !1879
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !390), !dbg !1876
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !391), !dbg !1881
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !1882
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !1882

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = call i32* @__errno_location() #1, !dbg !1884
  store i32 9, i32* %10, align 4, !dbg !1884, !tbaa !752
  br label %139, !dbg !1886

; <label>:11                                      ; preds = %__get_file.exit
  %12 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !1887
  call void @llvm.va_start(i8* %12), !dbg !1887
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !1888
  %14 = load i32* %13, align 16, !dbg !1888
  %15 = icmp ult i32 %14, 41, !dbg !1888
  br i1 %15, label %16, label %22, !dbg !1888

; <label>:16                                      ; preds = %11
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !1888
  %18 = load i8** %17, align 16, !dbg !1888
  %19 = sext i32 %14 to i64, !dbg !1888
  %20 = getelementptr i8* %18, i64 %19, !dbg !1888
  %21 = add i32 %14, 8, !dbg !1888
  store i32 %21, i32* %13, align 16, !dbg !1888
  br label %26, !dbg !1888

; <label>:22                                      ; preds = %11
  %23 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !1888
  %24 = load i8** %23, align 8, !dbg !1888
  %25 = getelementptr i8* %24, i64 8, !dbg !1888
  store i8* %25, i8** %23, align 8, !dbg !1888
  br label %26, !dbg !1888

; <label>:26                                      ; preds = %22, %16
  %.in = phi i8* [ %20, %16 ], [ %24, %22 ]
  %27 = bitcast i8* %.in to i8**, !dbg !1888
  %28 = load i8** %27, align 8, !dbg !1888
  call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !405), !dbg !1888
  call void @llvm.va_end(i8* %12), !dbg !1889
  %29 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !1890
  %30 = load %struct.exe_disk_file_t** %29, align 8, !dbg !1890, !tbaa !788
  %31 = icmp eq %struct.exe_disk_file_t* %30, null, !dbg !1890
  br i1 %31, label %130, label %32, !dbg !1890

; <label>:32                                      ; preds = %26
  %33 = getelementptr inbounds %struct.exe_disk_file_t* %30, i64 0, i32 2, !dbg !1891
  %34 = load %struct.stat64** %33, align 8, !dbg !1891, !tbaa !711
  switch i64 %request, label %128 [
    i64 21505, label %35
    i64 21506, label %70
    i64 21507, label %77
    i64 21508, label %81
    i64 21523, label %88
    i64 21524, label %98
    i64 21531, label %106
    i64 2150657282, label %126
  ], !dbg !1892

; <label>:35                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([41 x i8]* @.str13, i64 0, i64 0)) #5, !dbg !1893
  %36 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1894
  %37 = load i32* %36, align 4, !dbg !1894, !tbaa !1896
  %38 = and i32 %37, 61440, !dbg !1894
  %39 = icmp eq i32 %38, 8192, !dbg !1894
  br i1 %39, label %40, label %68, !dbg !1894

; <label>:40                                      ; preds = %35
  %41 = bitcast i8* %28 to i32*, !dbg !1898
  store i32 27906, i32* %41, align 4, !dbg !1898, !tbaa !1900
  %42 = getelementptr inbounds i8* %28, i64 4, !dbg !1902
  %43 = bitcast i8* %42 to i32*, !dbg !1902
  store i32 5, i32* %43, align 4, !dbg !1902, !tbaa !1903
  %44 = getelementptr inbounds i8* %28, i64 8, !dbg !1904
  %45 = bitcast i8* %44 to i32*, !dbg !1904
  store i32 1215, i32* %45, align 4, !dbg !1904, !tbaa !1905
  %46 = getelementptr inbounds i8* %28, i64 12, !dbg !1906
  %47 = bitcast i8* %46 to i32*, !dbg !1906
  store i32 35287, i32* %47, align 4, !dbg !1906, !tbaa !1907
  %48 = getelementptr inbounds i8* %28, i64 16, !dbg !1908
  store i8 0, i8* %48, align 1, !dbg !1908, !tbaa !1909
  %49 = getelementptr inbounds i8* %28, i64 17, !dbg !1910
  store i8 3, i8* %49, align 1, !dbg !1910, !tbaa !694
  %50 = getelementptr inbounds i8* %28, i64 18, !dbg !1911
  store i8 28, i8* %50, align 1, !dbg !1911, !tbaa !694
  %51 = getelementptr inbounds i8* %28, i64 19, !dbg !1912
  store i8 127, i8* %51, align 1, !dbg !1912, !tbaa !694
  %52 = getelementptr inbounds i8* %28, i64 20, !dbg !1913
  store i8 21, i8* %52, align 1, !dbg !1913, !tbaa !694
  %53 = getelementptr inbounds i8* %28, i64 21, !dbg !1914
  store i8 4, i8* %53, align 1, !dbg !1914, !tbaa !694
  %54 = getelementptr inbounds i8* %28, i64 22, !dbg !1915
  store i8 0, i8* %54, align 1, !dbg !1915, !tbaa !694
  %55 = getelementptr inbounds i8* %28, i64 23, !dbg !1916
  store i8 1, i8* %55, align 1, !dbg !1916, !tbaa !694
  %56 = getelementptr inbounds i8* %28, i64 24, !dbg !1917
  store i8 -1, i8* %56, align 1, !dbg !1917, !tbaa !694
  %57 = getelementptr inbounds i8* %28, i64 25, !dbg !1918
  store i8 17, i8* %57, align 1, !dbg !1918, !tbaa !694
  %58 = getelementptr inbounds i8* %28, i64 26, !dbg !1919
  store i8 19, i8* %58, align 1, !dbg !1919, !tbaa !694
  %59 = getelementptr inbounds i8* %28, i64 27, !dbg !1920
  store i8 26, i8* %59, align 1, !dbg !1920, !tbaa !694
  %60 = getelementptr inbounds i8* %28, i64 28, !dbg !1921
  store i8 -1, i8* %60, align 1, !dbg !1921, !tbaa !694
  %61 = getelementptr inbounds i8* %28, i64 29, !dbg !1922
  store i8 18, i8* %61, align 1, !dbg !1922, !tbaa !694
  %62 = getelementptr inbounds i8* %28, i64 30, !dbg !1923
  store i8 15, i8* %62, align 1, !dbg !1923, !tbaa !694
  %63 = getelementptr inbounds i8* %28, i64 31, !dbg !1924
  store i8 23, i8* %63, align 1, !dbg !1924, !tbaa !694
  %64 = getelementptr inbounds i8* %28, i64 32, !dbg !1925
  store i8 22, i8* %64, align 1, !dbg !1925, !tbaa !694
  %65 = getelementptr inbounds i8* %28, i64 33, !dbg !1926
  store i8 -1, i8* %65, align 1, !dbg !1926, !tbaa !694
  %66 = getelementptr inbounds i8* %28, i64 34, !dbg !1927
  store i8 0, i8* %66, align 1, !dbg !1927, !tbaa !694
  %67 = getelementptr inbounds i8* %28, i64 35, !dbg !1928
  store i8 0, i8* %67, align 1, !dbg !1928, !tbaa !694
  br label %139, !dbg !1929

; <label>:68                                      ; preds = %35
  %69 = call i32* @__errno_location() #1, !dbg !1930
  store i32 25, i32* %69, align 4, !dbg !1930, !tbaa !752
  br label %139, !dbg !1932

; <label>:70                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([42 x i8]* @.str14, i64 0, i64 0)) #5, !dbg !1933
  %71 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1935
  %72 = load i32* %71, align 4, !dbg !1935, !tbaa !1896
  %73 = and i32 %72, 61440, !dbg !1935
  %74 = icmp eq i32 %73, 8192, !dbg !1935
  br i1 %74, label %139, label %75, !dbg !1935

; <label>:75                                      ; preds = %70
  %76 = call i32* @__errno_location() #1, !dbg !1937
  store i32 25, i32* %76, align 4, !dbg !1937, !tbaa !752
  br label %139, !dbg !1939

; <label>:77                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str15, i64 0, i64 0)) #5, !dbg !1940
  %78 = icmp eq i32 %fd, 0, !dbg !1942
  br i1 %78, label %139, label %79, !dbg !1942

; <label>:79                                      ; preds = %77
  %80 = call i32* @__errno_location() #1, !dbg !1944
  store i32 25, i32* %80, align 4, !dbg !1944, !tbaa !752
  br label %139, !dbg !1946

; <label>:81                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str16, i64 0, i64 0)) #5, !dbg !1947
  %82 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1949
  %83 = load i32* %82, align 4, !dbg !1949, !tbaa !1896
  %84 = and i32 %83, 61440, !dbg !1949
  %85 = icmp eq i32 %84, 8192, !dbg !1949
  br i1 %85, label %139, label %86, !dbg !1949

; <label>:86                                      ; preds = %81
  %87 = call i32* @__errno_location() #1, !dbg !1951
  store i32 25, i32* %87, align 4, !dbg !1951, !tbaa !752
  br label %139, !dbg !1953

; <label>:88                                      ; preds = %32
  %89 = bitcast i8* %28 to i16*, !dbg !1954
  store i16 24, i16* %89, align 2, !dbg !1954, !tbaa !1955
  %90 = getelementptr inbounds i8* %28, i64 2, !dbg !1957
  %91 = bitcast i8* %90 to i16*, !dbg !1957
  store i16 80, i16* %91, align 2, !dbg !1957, !tbaa !1958
  call void @klee_warning_once(i8* getelementptr inbounds ([45 x i8]* @.str17, i64 0, i64 0)) #5, !dbg !1959
  %92 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1960
  %93 = load i32* %92, align 4, !dbg !1960, !tbaa !1896
  %94 = and i32 %93, 61440, !dbg !1960
  %95 = icmp eq i32 %94, 8192, !dbg !1960
  br i1 %95, label %139, label %96, !dbg !1960

; <label>:96                                      ; preds = %88
  %97 = call i32* @__errno_location() #1, !dbg !1962
  store i32 25, i32* %97, align 4, !dbg !1962, !tbaa !752
  br label %139, !dbg !1964

; <label>:98                                      ; preds = %32
  call void @klee_warning_once(i8* getelementptr inbounds ([46 x i8]* @.str18, i64 0, i64 0)) #5, !dbg !1965
  %99 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1967
  %100 = load i32* %99, align 4, !dbg !1967, !tbaa !1896
  %101 = and i32 %100, 61440, !dbg !1967
  %102 = icmp eq i32 %101, 8192, !dbg !1967
  %103 = call i32* @__errno_location() #1, !dbg !1969
  br i1 %102, label %104, label %105, !dbg !1967

; <label>:104                                     ; preds = %98
  store i32 22, i32* %103, align 4, !dbg !1969, !tbaa !752
  br label %139, !dbg !1971

; <label>:105                                     ; preds = %98
  store i32 25, i32* %103, align 4, !dbg !1972, !tbaa !752
  br label %139, !dbg !1974

; <label>:106                                     ; preds = %32
  %107 = bitcast i8* %28 to i32*, !dbg !1975
  call void @llvm.dbg.value(metadata !{i32* %107}, i64 0, metadata !440), !dbg !1975
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str19, i64 0, i64 0)) #5, !dbg !1976
  %108 = getelementptr inbounds %struct.stat64* %34, i64 0, i32 3, !dbg !1977
  %109 = load i32* %108, align 4, !dbg !1977, !tbaa !1896
  %110 = and i32 %109, 61440, !dbg !1977
  %111 = icmp eq i32 %110, 8192, !dbg !1977
  br i1 %111, label %112, label %124, !dbg !1977

; <label>:112                                     ; preds = %106
  %113 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 2, !dbg !1979
  %114 = load i64* %113, align 8, !dbg !1979, !tbaa !1146
  %115 = load %struct.exe_disk_file_t** %29, align 8, !dbg !1979, !tbaa !788
  %116 = getelementptr inbounds %struct.exe_disk_file_t* %115, i64 0, i32 0, !dbg !1979
  %117 = load i32* %116, align 4, !dbg !1979, !tbaa !1160
  %118 = zext i32 %117 to i64, !dbg !1979
  %119 = icmp sgt i64 %118, %114, !dbg !1979
  br i1 %119, label %120, label %123, !dbg !1979

; <label>:120                                     ; preds = %112
  %121 = sub nsw i64 %118, %114, !dbg !1982
  %122 = trunc i64 %121 to i32, !dbg !1982
  br label %123, !dbg !1984

; <label>:123                                     ; preds = %112, %120
  %storemerge = phi i32 [ %122, %120 ], [ 0, %112 ]
  store i32 %storemerge, i32* %107, align 4, !dbg !1982, !tbaa !752
  br label %139, !dbg !1985

; <label>:124                                     ; preds = %106
  %125 = call i32* @__errno_location() #1, !dbg !1986
  store i32 25, i32* %125, align 4, !dbg !1986, !tbaa !752
  br label %139, !dbg !1988

; <label>:126                                     ; preds = %32
  call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str20, i64 0, i64 0)) #5, !dbg !1989
  %127 = call i32* @__errno_location() #1, !dbg !1991
  store i32 22, i32* %127, align 4, !dbg !1991, !tbaa !752
  br label %139, !dbg !1992

; <label>:128                                     ; preds = %32
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str11, i64 0, i64 0)) #5, !dbg !1993
  %129 = call i32* @__errno_location() #1, !dbg !1994
  store i32 22, i32* %129, align 4, !dbg !1994, !tbaa !752
  br label %139, !dbg !1995

; <label>:130                                     ; preds = %26
  %131 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !1996
  %132 = load i32* %131, align 8, !dbg !1996, !tbaa !855
  %133 = call i64 (i64, ...)* @syscall(i64 16, i32 %132, i64 %request, i8* %28) #5, !dbg !1996
  %134 = trunc i64 %133 to i32, !dbg !1996
  call void @llvm.dbg.value(metadata !{i32 %134}, i64 0, metadata !443), !dbg !1996
  %135 = icmp eq i32 %134, -1, !dbg !1997
  br i1 %135, label %136, label %139, !dbg !1997

; <label>:136                                     ; preds = %130
  %137 = call i32 @klee_get_errno() #5, !dbg !1999
  %138 = call i32* @__errno_location() #1, !dbg !1999
  store i32 %137, i32* %138, align 4, !dbg !1999, !tbaa !752
  br label %139, !dbg !1999

; <label>:139                                     ; preds = %130, %136, %88, %81, %77, %70, %128, %126, %124, %123, %105, %104, %96, %86, %79, %75, %68, %40, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %128 ], [ -1, %126 ], [ 0, %123 ], [ -1, %124 ], [ -1, %104 ], [ -1, %105 ], [ -1, %96 ], [ -1, %86 ], [ -1, %79 ], [ -1, %75 ], [ 0, %40 ], [ -1, %68 ], [ -1, %__get_file.exit.thread ], [ 0, %70 ], [ 0, %77 ], [ 0, %81 ], [ 0, %88 ], [ -1, %136 ], [ %134, %130 ]
  ret i32 %.0, !dbg !2000
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #5

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #5

declare void @klee_warning_once(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @fcntl(i32 %fd, i32 %cmd, ...) #0 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !449), !dbg !2001
  call void @llvm.dbg.value(metadata !{i32 %cmd}, i64 0, metadata !450), !dbg !2001
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !2002), !dbg !2004
  %1 = icmp ult i32 %fd, 32, !dbg !2005
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2005

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !2006
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !2007
  %5 = load i32* %4, align 4, !dbg !2007, !tbaa !765
  %6 = and i32 %5, 1, !dbg !2007
  %7 = icmp eq i32 %6, 0, !dbg !2007
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2007

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !2006
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !451), !dbg !2003
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !452), !dbg !2008
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2009
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !2009

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = call i32* @__errno_location() #1, !dbg !2011
  store i32 9, i32* %10, align 4, !dbg !2011, !tbaa !752
  br label %55, !dbg !2013

; <label>:11                                      ; preds = %__get_file.exit
  switch i32 %cmd, label %12 [
    i32 1026, label %30
    i32 1025, label %30
    i32 11, label %30
    i32 9, label %30
    i32 3, label %30
    i32 1, label %30
  ], !dbg !2014

; <label>:12                                      ; preds = %11
  %13 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !2016
  call void @llvm.va_start(i8* %13), !dbg !2016
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !2018
  %15 = load i32* %14, align 16, !dbg !2018
  %16 = icmp ult i32 %15, 41, !dbg !2018
  br i1 %16, label %17, label %23, !dbg !2018

; <label>:17                                      ; preds = %12
  %18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !2018
  %19 = load i8** %18, align 16, !dbg !2018
  %20 = sext i32 %15 to i64, !dbg !2018
  %21 = getelementptr i8* %19, i64 %20, !dbg !2018
  %22 = add i32 %15, 8, !dbg !2018
  store i32 %22, i32* %14, align 16, !dbg !2018
  br label %27, !dbg !2018

; <label>:23                                      ; preds = %12
  %24 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !2018
  %25 = load i8** %24, align 8, !dbg !2018
  %26 = getelementptr i8* %25, i64 8, !dbg !2018
  store i8* %26, i8** %24, align 8, !dbg !2018
  br label %27, !dbg !2018

; <label>:27                                      ; preds = %23, %17
  %.in = phi i8* [ %21, %17 ], [ %25, %23 ]
  %28 = bitcast i8* %.in to i32*, !dbg !2018
  %29 = load i32* %28, align 4, !dbg !2018
  call void @llvm.dbg.value(metadata !{i32 %29}, i64 0, metadata !453), !dbg !2018
  call void @llvm.va_end(i8* %13), !dbg !2019
  br label %30

; <label>:30                                      ; preds = %11, %11, %11, %11, %11, %11, %27
  %arg.0 = phi i32 [ %29, %27 ], [ 0, %11 ], [ 0, %11 ], [ 0, %11 ], [ 0, %11 ], [ 0, %11 ], [ 0, %11 ]
  %31 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !2020
  %32 = load %struct.exe_disk_file_t** %31, align 8, !dbg !2020, !tbaa !788
  %33 = icmp eq %struct.exe_disk_file_t* %32, null, !dbg !2020
  br i1 %33, label %46, label %34, !dbg !2020

; <label>:34                                      ; preds = %30
  switch i32 %cmd, label %44 [
    i32 1, label %35
    i32 2, label %38
    i32 3, label %55
  ], !dbg !2021

; <label>:35                                      ; preds = %34
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !454), !dbg !2022
  %36 = load i32* %4, align 4, !dbg !2023, !tbaa !765
  call void @llvm.dbg.value(metadata !2025, i64 0, metadata !454), !dbg !2026
  %37 = lshr i32 %36, 1, !dbg !2023
  %.lobit = and i32 %37, 1, !dbg !2023
  br label %55, !dbg !2027

; <label>:38                                      ; preds = %34
  %39 = load i32* %4, align 4, !dbg !2028, !tbaa !765
  %40 = and i32 %39, -3, !dbg !2028
  %41 = and i32 %arg.0, 1, !dbg !2030
  %42 = icmp eq i32 %41, 0, !dbg !2030
  %43 = or i32 %39, 2, !dbg !2032
  %.10 = select i1 %42, i32 %40, i32 %43, !dbg !2030
  store i32 %.10, i32* %4, align 4, !dbg !2028, !tbaa !765
  br label %55, !dbg !2033

; <label>:44                                      ; preds = %34
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str11, i64 0, i64 0)) #5, !dbg !2034
  %45 = call i32* @__errno_location() #1, !dbg !2035
  store i32 22, i32* %45, align 4, !dbg !2035, !tbaa !752
  br label %55, !dbg !2036

; <label>:46                                      ; preds = %30
  %47 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !2037
  %48 = load i32* %47, align 8, !dbg !2037, !tbaa !855
  %49 = call i64 (i64, ...)* @syscall(i64 72, i32 %48, i32 %cmd, i32 %arg.0) #5, !dbg !2037
  %50 = trunc i64 %49 to i32, !dbg !2037
  call void @llvm.dbg.value(metadata !{i32 %50}, i64 0, metadata !459), !dbg !2037
  %51 = icmp eq i32 %50, -1, !dbg !2038
  br i1 %51, label %52, label %55, !dbg !2038

; <label>:52                                      ; preds = %46
  %53 = call i32 @klee_get_errno() #5, !dbg !2040
  %54 = call i32* @__errno_location() #1, !dbg !2040
  store i32 %53, i32* %54, align 4, !dbg !2040, !tbaa !752
  br label %55, !dbg !2040

; <label>:55                                      ; preds = %46, %52, %34, %44, %38, %35, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %44 ], [ 0, %38 ], [ %.lobit, %35 ], [ -1, %__get_file.exit.thread ], [ 0, %34 ], [ -1, %52 ], [ %50, %46 ]
  ret i32 %.0, !dbg !2041
}

; Function Attrs: nounwind uwtable
define i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !495), !dbg !2042
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !496), !dbg !2042
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !2043), !dbg !2045
  %1 = load i8* %path, align 1, !dbg !2046, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !2047), !dbg !2046
  %2 = sext i8 %1 to i32, !dbg !2048
  %3 = icmp eq i8 %1, 0, !dbg !2048
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2048

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2048
  %6 = load i8* %5, align 1, !dbg !2048, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !2048
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2048

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2049, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !2049
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2049

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2049
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2049

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !2050
  %12 = ashr exact i32 %sext.i, 24, !dbg !2050
  %13 = add nsw i32 %12, 65, !dbg !2050
  %14 = icmp eq i32 %2, %13, !dbg !2050
  %15 = add i32 %i.02.i, 1, !dbg !2049
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !2051), !dbg !2049
  br i1 %14, label %16, label %10, !dbg !2050

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2052
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2052, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2053
  %20 = load %struct.stat64** %19, align 8, !dbg !2053, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2053
  %22 = load i64* %21, align 8, !dbg !2053, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !2053
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2052
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2054
  %or.cond = or i1 %23, %25, !dbg !2053
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2053

; <label>:26                                      ; preds = %16
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str9, i64 0, i64 0)) #5, !dbg !2056
  %27 = tail call i32* @__errno_location() #1, !dbg !2058
  store i32 2, i32* %27, align 4, !dbg !2058, !tbaa !752
  br label %58, !dbg !2059

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !2060) #5, !dbg !2062
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !2063) #5, !dbg !2065
  %28 = ptrtoint i8* %path to i64, !dbg !2066
  %29 = tail call i64 @klee_get_valuel(i64 %28) #5, !dbg !2066
  %30 = inttoptr i64 %29 to i8*, !dbg !2066
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !2067) #5, !dbg !2066
  %31 = icmp eq i8* %30, %path, !dbg !2068
  %32 = zext i1 %31 to i64, !dbg !2068
  tail call void @klee_assume(i64 %32) #5, !dbg !2068
  tail call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !2069) #5, !dbg !2064
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !2070) #5, !dbg !2071
  br label %33, !dbg !2071

; <label>:33                                      ; preds = %50, %__get_sym_file.exit.thread
  %i.0.i = phi i32 [ 0, %__get_sym_file.exit.thread ], [ %51, %50 ]
  %sc.0.i = phi i8* [ %30, %__get_sym_file.exit.thread ], [ %sc.1.i, %50 ]
  %34 = load i8* %sc.0.i, align 1, !dbg !2072, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %34}, i64 0, metadata !2073) #5, !dbg !2072
  %35 = add i32 %i.0.i, -1, !dbg !2074
  %36 = and i32 %35, %i.0.i, !dbg !2074
  %37 = icmp eq i32 %36, 0, !dbg !2074
  br i1 %37, label %38, label %42, !dbg !2074

; <label>:38                                      ; preds = %33
  switch i8 %34, label %50 [
    i8 0, label %39
    i8 47, label %40
  ], !dbg !2075

; <label>:39                                      ; preds = %38
  store i8 0, i8* %sc.0.i, align 1, !dbg !2076, !tbaa !694
  br label %__concretize_string.exit, !dbg !2077

; <label>:40                                      ; preds = %38
  %41 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2078
  tail call void @llvm.dbg.value(metadata !{i8* %41}, i64 0, metadata !2069) #5, !dbg !2078
  store i8 47, i8* %sc.0.i, align 1, !dbg !2078, !tbaa !694
  br label %50, !dbg !2079

; <label>:42                                      ; preds = %33
  %43 = sext i8 %34 to i64, !dbg !2080
  %44 = tail call i64 @klee_get_valuel(i64 %43) #5, !dbg !2080
  %45 = trunc i64 %44 to i8, !dbg !2080
  tail call void @llvm.dbg.value(metadata !{i8 %45}, i64 0, metadata !2081) #5, !dbg !2080
  %46 = icmp eq i8 %45, %34, !dbg !2082
  %47 = zext i1 %46 to i64, !dbg !2082
  tail call void @klee_assume(i64 %47) #5, !dbg !2082
  %48 = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2083
  tail call void @llvm.dbg.value(metadata !{i8* %48}, i64 0, metadata !2069) #5, !dbg !2083
  store i8 %45, i8* %sc.0.i, align 1, !dbg !2083, !tbaa !694
  %49 = icmp eq i8 %45, 0, !dbg !2084
  br i1 %49, label %__concretize_string.exit, label %50, !dbg !2084

; <label>:50                                      ; preds = %42, %40, %38
  %sc.1.i = phi i8* [ %48, %42 ], [ %41, %40 ], [ %sc.0.i, %38 ]
  %51 = add i32 %i.0.i, 1, !dbg !2071
  tail call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !2070) #5, !dbg !2071
  br label %33, !dbg !2071

__concretize_string.exit:                         ; preds = %42, %39
  %52 = tail call i64 (i64, ...)* @syscall(i64 137, i8* %path, %struct.statfs* %buf) #5, !dbg !2061
  %53 = trunc i64 %52 to i32, !dbg !2061
  tail call void @llvm.dbg.value(metadata !{i32 %53}, i64 0, metadata !498), !dbg !2061
  %54 = icmp eq i32 %53, -1, !dbg !2085
  br i1 %54, label %55, label %58, !dbg !2085

; <label>:55                                      ; preds = %__concretize_string.exit
  %56 = tail call i32 @klee_get_errno() #5, !dbg !2087
  %57 = tail call i32* @__errno_location() #1, !dbg !2087
  store i32 %56, i32* %57, align 4, !dbg !2087, !tbaa !752
  br label %58, !dbg !2087

; <label>:58                                      ; preds = %__concretize_string.exit, %55, %26
  %.0 = phi i32 [ -1, %26 ], [ -1, %55 ], [ %53, %__concretize_string.exit ]
  ret i32 %.0, !dbg !2088
}

; Function Attrs: nounwind uwtable
define i32 @fstatfs(i32 %fd, %struct.statfs* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !504), !dbg !2089
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !505), !dbg !2089
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !2090), !dbg !2092
  %1 = icmp ult i32 %fd, 32, !dbg !2093
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2093

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !2094
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !2095
  %5 = load i32* %4, align 4, !dbg !2095, !tbaa !765
  %6 = and i32 %5, 1, !dbg !2095
  %7 = icmp eq i32 %6, 0, !dbg !2095
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2095

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !2094
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !506), !dbg !2091
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2096
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !2096

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !2098
  store i32 9, i32* %10, align 4, !dbg !2098, !tbaa !752
  br label %26, !dbg !2100

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !2101
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !2101, !tbaa !788
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !2101
  br i1 %14, label %17, label %15, !dbg !2101

; <label>:15                                      ; preds = %11
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str21, i64 0, i64 0)) #5, !dbg !2102
  %16 = tail call i32* @__errno_location() #1, !dbg !2104
  store i32 9, i32* %16, align 4, !dbg !2104, !tbaa !752
  br label %26, !dbg !2105

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !2106
  %19 = load i32* %18, align 8, !dbg !2106, !tbaa !855
  %20 = tail call i64 (i64, ...)* @syscall(i64 138, i32 %19, %struct.statfs* %buf) #5, !dbg !2106
  %21 = trunc i64 %20 to i32, !dbg !2106
  tail call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !507), !dbg !2106
  %22 = icmp eq i32 %21, -1, !dbg !2107
  br i1 %22, label %23, label %26, !dbg !2107

; <label>:23                                      ; preds = %17
  %24 = tail call i32 @klee_get_errno() #5, !dbg !2109
  %25 = tail call i32* @__errno_location() #1, !dbg !2109
  store i32 %24, i32* %25, align 4, !dbg !2109, !tbaa !752
  br label %26, !dbg !2109

; <label>:26                                      ; preds = %17, %23, %15, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %15 ], [ -1, %__get_file.exit.thread ], [ -1, %23 ], [ %21, %17 ]
  ret i32 %.0, !dbg !2110
}

; Function Attrs: nounwind uwtable
define i32 @fsync(i32 %fd) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !512), !dbg !2111
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !2112), !dbg !2114
  %1 = icmp ult i32 %fd, 32, !dbg !2115
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2115

; <label>:2                                       ; preds = %0
  %3 = sext i32 %fd to i64, !dbg !2116
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !2117
  %5 = load i32* %4, align 4, !dbg !2117, !tbaa !765
  %6 = and i32 %5, 1, !dbg !2117
  %7 = icmp eq i32 %6, 0, !dbg !2117
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2117

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !2116
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !513), !dbg !2113
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2118
  br i1 %9, label %__get_file.exit.thread, label %11, !dbg !2118

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %10 = tail call i32* @__errno_location() #1, !dbg !2119
  store i32 9, i32* %10, align 4, !dbg !2119, !tbaa !752
  br label %24, !dbg !2121

; <label>:11                                      ; preds = %__get_file.exit
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 3, !dbg !2122
  %13 = load %struct.exe_disk_file_t** %12, align 8, !dbg !2122, !tbaa !788
  %14 = icmp eq %struct.exe_disk_file_t* %13, null, !dbg !2122
  br i1 %14, label %15, label %24, !dbg !2122

; <label>:15                                      ; preds = %11
  %16 = getelementptr inbounds %struct.exe_file_t* %8, i64 0, i32 0, !dbg !2123
  %17 = load i32* %16, align 8, !dbg !2123, !tbaa !855
  %18 = tail call i64 (i64, ...)* @syscall(i64 74, i32 %17) #5, !dbg !2123
  %19 = trunc i64 %18 to i32, !dbg !2123
  tail call void @llvm.dbg.value(metadata !{i32 %19}, i64 0, metadata !514), !dbg !2123
  %20 = icmp eq i32 %19, -1, !dbg !2124
  br i1 %20, label %21, label %24, !dbg !2124

; <label>:21                                      ; preds = %15
  %22 = tail call i32 @klee_get_errno() #5, !dbg !2126
  %23 = tail call i32* @__errno_location() #1, !dbg !2126
  store i32 %22, i32* %23, align 4, !dbg !2126, !tbaa !752
  br label %24, !dbg !2126

; <label>:24                                      ; preds = %15, %21, %11, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %__get_file.exit.thread ], [ 0, %11 ], [ -1, %21 ], [ %19, %15 ]
  ret i32 %.0, !dbg !2127
}

; Function Attrs: nounwind uwtable
define i32 @dup2(i32 %oldfd, i32 %newfd) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !520), !dbg !2128
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !521), !dbg !2128
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !2129), !dbg !2131
  %1 = icmp ult i32 %oldfd, 32, !dbg !2132
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2132

; <label>:2                                       ; preds = %0
  %3 = sext i32 %oldfd to i64, !dbg !2133
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !2134
  %5 = load i32* %4, align 4, !dbg !2134, !tbaa !765
  %6 = and i32 %5, 1, !dbg !2134
  %7 = icmp eq i32 %6, 0, !dbg !2134
  br i1 %7, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2134

__get_file.exit:                                  ; preds = %2
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !2133
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %8}, i64 0, metadata !522), !dbg !2130
  %9 = icmp ne %struct.exe_file_t* %8, null, !dbg !2135
  %10 = icmp sgt i32 %newfd, -1, !dbg !2135
  %or.cond = and i1 %9, %10, !dbg !2135
  %11 = icmp slt i32 %newfd, 32, !dbg !2135
  %or.cond3 = and i1 %or.cond, %11, !dbg !2135
  br i1 %or.cond3, label %13, label %__get_file.exit.thread, !dbg !2135

__get_file.exit.thread:                           ; preds = %0, %2, %__get_file.exit
  %12 = tail call i32* @__errno_location() #1, !dbg !2136
  store i32 9, i32* %12, align 4, !dbg !2136, !tbaa !752
  br label %42, !dbg !2138

; <label>:13                                      ; preds = %__get_file.exit
  %14 = sext i32 %newfd to i64, !dbg !2139
  %15 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %14, !dbg !2139
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %15}, i64 0, metadata !523), !dbg !2139
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %14, i32 1, !dbg !2140
  %17 = load i32* %16, align 4, !dbg !2140, !tbaa !765
  %18 = and i32 %17, 1, !dbg !2140
  %19 = icmp eq i32 %18, 0, !dbg !2140
  br i1 %19, label %close.exit, label %20, !dbg !2140

; <label>:20                                      ; preds = %13
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !2142) #5, !dbg !2143
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !2144) #5, !dbg !2145
  %21 = load i32* @close.n_calls, align 4, !dbg !2146, !tbaa !752
  %22 = add nsw i32 %21, 1, !dbg !2146
  store i32 %22, i32* @close.n_calls, align 4, !dbg !2146, !tbaa !752
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !2147) #5, !dbg !2149
  %23 = icmp ugt i32 %newfd, 31, !dbg !2150
  %24 = icmp eq %struct.exe_file_t* %15, null, !dbg !2151
  %or.cond8 = or i1 %23, %24, !dbg !2150
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %15}, i64 0, metadata !2152) #5, !dbg !2148
  br i1 %or.cond8, label %__get_file.exit.thread.i, label %26, !dbg !2150

__get_file.exit.thread.i:                         ; preds = %20
  %25 = tail call i32* @__errno_location() #1, !dbg !2153
  store i32 9, i32* %25, align 4, !dbg !2153, !tbaa !752
  br label %close.exit, !dbg !2154

; <label>:26                                      ; preds = %20
  %27 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2155, !tbaa !1092
  %28 = icmp eq i32 %27, 0, !dbg !2155
  br i1 %28, label %36, label %29, !dbg !2155

; <label>:29                                      ; preds = %26
  %30 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !2155, !tbaa !1093
  %31 = load i32* %30, align 4, !dbg !2155, !tbaa !752
  %32 = icmp eq i32 %31, %22, !dbg !2155
  br i1 %32, label %33, label %36, !dbg !2155

; <label>:33                                      ; preds = %29
  %34 = add i32 %27, -1, !dbg !2156
  store i32 %34, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2156, !tbaa !1092
  %35 = tail call i32* @__errno_location() #1, !dbg !2157
  store i32 5, i32* %35, align 4, !dbg !2157, !tbaa !752
  br label %close.exit, !dbg !2158

; <label>:36                                      ; preds = %29, %26
  %37 = bitcast %struct.exe_file_t* %15 to i8*, !dbg !2159
  tail call void @llvm.memset.p0i8.i64(i8* %37, i8 0, i64 24, i32 8, i1 false) #5, !dbg !2159
  br label %close.exit, !dbg !2160

close.exit:                                       ; preds = %36, %33, %__get_file.exit.thread.i, %13
  %38 = bitcast %struct.exe_file_t* %15 to i8*, !dbg !2161
  %39 = bitcast %struct.exe_file_t* %8 to i8*, !dbg !2161
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %38, i8* %39, i64 24, i32 8, i1 false), !dbg !2161, !tbaa.struct !2162
  %40 = load i32* %16, align 4, !dbg !2165, !tbaa !765
  %41 = and i32 %40, -3, !dbg !2165
  store i32 %41, i32* %16, align 4, !dbg !2165, !tbaa !765
  br label %42, !dbg !2166

; <label>:42                                      ; preds = %close.exit, %__get_file.exit.thread
  %.0 = phi i32 [ %newfd, %close.exit ], [ -1, %__get_file.exit.thread ]
  ret i32 %.0, !dbg !2167
}

; Function Attrs: nounwind uwtable
define i32 @dup(i32 %oldfd) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !528), !dbg !2168
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !2169), !dbg !2171
  %1 = icmp ult i32 %oldfd, 32, !dbg !2172
  br i1 %1, label %2, label %__get_file.exit.thread, !dbg !2172

; <label>:2                                       ; preds = %0
  %3 = sext i32 %oldfd to i64, !dbg !2173
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, i32 1, !dbg !2174
  %5 = load i32* %4, align 4, !dbg !2174, !tbaa !765
  %6 = and i32 %5, 1, !dbg !2174
  %7 = icmp eq i32 %6, 0, !dbg !2174
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %3, !dbg !2173
  %9 = icmp eq %struct.exe_file_t* %8, null, !dbg !2175
  %or.cond = or i1 %7, %9, !dbg !2174
  br i1 %or.cond, label %__get_file.exit.thread, label %.preheader, !dbg !2174

__get_file.exit.thread:                           ; preds = %0, %2
  %10 = tail call i32* @__errno_location() #1, !dbg !2176
  store i32 9, i32* %10, align 4, !dbg !2176, !tbaa !752
  br label %25, !dbg !2178

; <label>:11                                      ; preds = %.preheader
  %12 = trunc i64 %indvars.iv.next to i32, !dbg !2179
  %13 = icmp slt i32 %12, 32, !dbg !2179
  br i1 %13, label %.preheader, label %19, !dbg !2179

.preheader:                                       ; preds = %2, %11
  %indvars.iv = phi i64 [ %indvars.iv.next, %11 ], [ 0, %2 ]
  %fd.02 = phi i32 [ %18, %11 ], [ 0, %2 ]
  %14 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !2181
  %15 = load i32* %14, align 4, !dbg !2181, !tbaa !765
  %16 = and i32 %15, 1, !dbg !2181
  %17 = icmp eq i32 %16, 0, !dbg !2181
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !2179
  %18 = add nsw i32 %fd.02, 1, !dbg !2179
  tail call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !530), !dbg !2179
  br i1 %17, label %19, label %11, !dbg !2181

; <label>:19                                      ; preds = %.preheader, %11
  %fd.0.lcssa = phi i32 [ %fd.02, %.preheader ], [ %18, %11 ]
  %20 = icmp eq i32 %fd.0.lcssa, 32, !dbg !2183
  br i1 %20, label %21, label %23, !dbg !2183

; <label>:21                                      ; preds = %19
  %22 = tail call i32* @__errno_location() #1, !dbg !2185
  store i32 24, i32* %22, align 4, !dbg !2185, !tbaa !752
  br label %25, !dbg !2187

; <label>:23                                      ; preds = %19
  %24 = tail call i32 @dup2(i32 %oldfd, i32 %fd.0.lcssa) #5, !dbg !2188
  br label %25, !dbg !2188

; <label>:25                                      ; preds = %23, %21, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %21 ], [ %24, %23 ], [ -1, %__get_file.exit.thread ]
  ret i32 %.0, !dbg !2190
}

; Function Attrs: nounwind uwtable
define i32 @rmdir(i8* nocapture readonly %pathname) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !535), !dbg !2191
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !2192), !dbg !2194
  %1 = load i8* %pathname, align 1, !dbg !2195, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !2196), !dbg !2195
  %2 = sext i8 %1 to i32, !dbg !2197
  %3 = icmp eq i8 %1, 0, !dbg !2197
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2197

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %pathname, i64 1, !dbg !2197
  %6 = load i8* %5, align 1, !dbg !2197, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !2197
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2197

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2198, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !2198
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2198

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2198
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2198

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !2199
  %12 = ashr exact i32 %sext.i, 24, !dbg !2199
  %13 = add nsw i32 %12, 65, !dbg !2199
  %14 = icmp eq i32 %2, %13, !dbg !2199
  %15 = add i32 %i.02.i, 1, !dbg !2198
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !2200), !dbg !2198
  br i1 %14, label %16, label %10, !dbg !2199

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2201
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2201, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2202
  %20 = load %struct.stat64** %19, align 8, !dbg !2202, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2202
  %22 = load i64* %21, align 8, !dbg !2202, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !2202
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2201
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2203
  %or.cond = or i1 %23, %25, !dbg !2202
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2202

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 3, !dbg !2205
  %28 = load i32* %27, align 4, !dbg !2205, !tbaa !805
  %29 = and i32 %28, 61440, !dbg !2205
  %30 = icmp eq i32 %29, 16384, !dbg !2205
  br i1 %30, label %31, label %32, !dbg !2205

; <label>:31                                      ; preds = %26
  store i64 0, i64* %21, align 8, !dbg !2208, !tbaa !713
  br label %35, !dbg !2210

; <label>:32                                      ; preds = %26
  %33 = tail call i32* @__errno_location() #1, !dbg !2211
  store i32 20, i32* %33, align 4, !dbg !2211, !tbaa !752
  br label %35, !dbg !2213

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str22, i64 0, i64 0)) #5, !dbg !2214
  %34 = tail call i32* @__errno_location() #1, !dbg !2215
  store i32 1, i32* %34, align 4, !dbg !2215, !tbaa !752
  br label %35, !dbg !2216

; <label>:35                                      ; preds = %__get_sym_file.exit.thread, %32, %31
  %.0 = phi i32 [ 0, %31 ], [ -1, %32 ], [ -1, %__get_sym_file.exit.thread ]
  ret i32 %.0, !dbg !2217
}

; Function Attrs: nounwind uwtable
define i32 @unlink(i8* nocapture readonly %pathname) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !539), !dbg !2218
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !2219), !dbg !2221
  %1 = load i8* %pathname, align 1, !dbg !2222, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !2223), !dbg !2222
  %2 = sext i8 %1 to i32, !dbg !2224
  %3 = icmp eq i8 %1, 0, !dbg !2224
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2224

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %pathname, i64 1, !dbg !2224
  %6 = load i8* %5, align 1, !dbg !2224, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !2224
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2224

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2225, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !2225
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2225

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2225
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2225

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !2226
  %12 = ashr exact i32 %sext.i, 24, !dbg !2226
  %13 = add nsw i32 %12, 65, !dbg !2226
  %14 = icmp eq i32 %2, %13, !dbg !2226
  %15 = add i32 %i.02.i, 1, !dbg !2225
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !2227), !dbg !2225
  br i1 %14, label %16, label %10, !dbg !2226

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2228
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2228, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2229
  %20 = load %struct.stat64** %19, align 8, !dbg !2229, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2229
  %22 = load i64* %21, align 8, !dbg !2229, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !2229
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2228
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2230
  %or.cond = or i1 %23, %25, !dbg !2229
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2229

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 3, !dbg !2232
  %28 = load i32* %27, align 4, !dbg !2232, !tbaa !805
  %29 = and i32 %28, 61440, !dbg !2232
  %30 = icmp eq i32 %29, 32768, !dbg !2232
  br i1 %30, label %31, label %32, !dbg !2232

; <label>:31                                      ; preds = %26
  store i64 0, i64* %21, align 8, !dbg !2235, !tbaa !713
  br label %38, !dbg !2237

; <label>:32                                      ; preds = %26
  %33 = icmp eq i32 %29, 16384, !dbg !2238
  %34 = tail call i32* @__errno_location() #1, !dbg !2240
  br i1 %33, label %35, label %36, !dbg !2238

; <label>:35                                      ; preds = %32
  store i32 21, i32* %34, align 4, !dbg !2240, !tbaa !752
  br label %38, !dbg !2242

; <label>:36                                      ; preds = %32
  store i32 1, i32* %34, align 4, !dbg !2243, !tbaa !752
  br label %38, !dbg !2245

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str22, i64 0, i64 0)) #5, !dbg !2246
  %37 = tail call i32* @__errno_location() #1, !dbg !2247
  store i32 1, i32* %37, align 4, !dbg !2247, !tbaa !752
  br label %38, !dbg !2248

; <label>:38                                      ; preds = %__get_sym_file.exit.thread, %36, %35, %31
  %.0 = phi i32 [ 0, %31 ], [ -1, %35 ], [ -1, %36 ], [ -1, %__get_sym_file.exit.thread ]
  ret i32 %.0, !dbg !2249
}

; Function Attrs: nounwind uwtable
define i32 @unlinkat(i32 %dirfd, i8* nocapture readonly %pathname, i32 %flags) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %dirfd}, i64 0, metadata !545), !dbg !2250
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !546), !dbg !2250
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !547), !dbg !2250
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !2251), !dbg !2253
  %1 = load i8* %pathname, align 1, !dbg !2254, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !2255), !dbg !2254
  %2 = sext i8 %1 to i32, !dbg !2256
  %3 = icmp eq i8 %1, 0, !dbg !2256
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2256

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %pathname, i64 1, !dbg !2256
  %6 = load i8* %5, align 1, !dbg !2256, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !2256
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2256

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2257, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !2257
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2257

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2257
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2257

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !2258
  %12 = ashr exact i32 %sext.i, 24, !dbg !2258
  %13 = add nsw i32 %12, 65, !dbg !2258
  %14 = icmp eq i32 %2, %13, !dbg !2258
  %15 = add i32 %i.02.i, 1, !dbg !2257
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !2259), !dbg !2257
  br i1 %14, label %16, label %10, !dbg !2258

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2260
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2260, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2261
  %20 = load %struct.stat64** %19, align 8, !dbg !2261, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2261
  %22 = load i64* %21, align 8, !dbg !2261, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !2261
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2260
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2262
  %or.cond = or i1 %23, %25, !dbg !2261
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2261

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 3, !dbg !2264
  %28 = load i32* %27, align 4, !dbg !2264, !tbaa !805
  %29 = and i32 %28, 61440, !dbg !2264
  %30 = icmp eq i32 %29, 32768, !dbg !2264
  br i1 %30, label %31, label %32, !dbg !2264

; <label>:31                                      ; preds = %26
  store i64 0, i64* %21, align 8, !dbg !2267, !tbaa !713
  br label %38, !dbg !2269

; <label>:32                                      ; preds = %26
  %33 = icmp eq i32 %29, 16384, !dbg !2270
  %34 = tail call i32* @__errno_location() #1, !dbg !2272
  br i1 %33, label %35, label %36, !dbg !2270

; <label>:35                                      ; preds = %32
  store i32 21, i32* %34, align 4, !dbg !2272, !tbaa !752
  br label %38, !dbg !2274

; <label>:36                                      ; preds = %32
  store i32 1, i32* %34, align 4, !dbg !2275, !tbaa !752
  br label %38, !dbg !2277

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str22, i64 0, i64 0)) #5, !dbg !2278
  %37 = tail call i32* @__errno_location() #1, !dbg !2279
  store i32 1, i32* %37, align 4, !dbg !2279, !tbaa !752
  br label %38, !dbg !2280

; <label>:38                                      ; preds = %__get_sym_file.exit.thread, %36, %35, %31
  %.0 = phi i32 [ 0, %31 ], [ -1, %35 ], [ -1, %36 ], [ -1, %__get_sym_file.exit.thread ]
  ret i32 %.0, !dbg !2281
}

; Function Attrs: nounwind uwtable
define i64 @readlink(i8* %path, i8* %buf, i64 %bufsize) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !553), !dbg !2282
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !554), !dbg !2282
  tail call void @llvm.dbg.value(metadata !{i64 %bufsize}, i64 0, metadata !555), !dbg !2282
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !2283), !dbg !2285
  %1 = load i8* %path, align 1, !dbg !2286, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !2287), !dbg !2286
  %2 = sext i8 %1 to i32, !dbg !2288
  %3 = icmp eq i8 %1, 0, !dbg !2288
  br i1 %3, label %__get_sym_file.exit.thread, label %4, !dbg !2288

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2288
  %6 = load i8* %5, align 1, !dbg !2288, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !2288
  br i1 %7, label %.preheader.i, label %__get_sym_file.exit.thread, !dbg !2288

.preheader.i:                                     ; preds = %4
  %8 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2289, !tbaa !701
  %9 = icmp eq i32 %8, 0, !dbg !2289
  br i1 %9, label %__get_sym_file.exit.thread, label %.lr.ph.i, !dbg !2289

; <label>:10                                      ; preds = %.lr.ph.i
  %11 = icmp ult i32 %15, %8, !dbg !2289
  br i1 %11, label %.lr.ph.i, label %__get_sym_file.exit.thread, !dbg !2289

.lr.ph.i:                                         ; preds = %.preheader.i, %10
  %i.02.i = phi i32 [ %15, %10 ], [ 0, %.preheader.i ]
  %sext.i = shl i32 %i.02.i, 24, !dbg !2290
  %12 = ashr exact i32 %sext.i, 24, !dbg !2290
  %13 = add nsw i32 %12, 65, !dbg !2290
  %14 = icmp eq i32 %2, %13, !dbg !2290
  %15 = add i32 %i.02.i, 1, !dbg !2289
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !2291), !dbg !2289
  br i1 %14, label %16, label %10, !dbg !2290

; <label>:16                                      ; preds = %.lr.ph.i
  %17 = zext i32 %i.02.i to i64, !dbg !2292
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2292, !tbaa !708
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, i32 2, !dbg !2293
  %20 = load %struct.stat64** %19, align 8, !dbg !2293, !tbaa !711
  %21 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 1, !dbg !2293
  %22 = load i64* %21, align 8, !dbg !2293, !tbaa !713
  %23 = icmp eq i64 %22, 0, !dbg !2293
  %24 = getelementptr inbounds %struct.exe_disk_file_t* %18, i64 %17, !dbg !2292
  %25 = icmp eq %struct.exe_disk_file_t* %24, null, !dbg !2294
  %or.cond = or i1 %23, %25, !dbg !2293
  br i1 %or.cond, label %__get_sym_file.exit.thread, label %26, !dbg !2293

; <label>:26                                      ; preds = %16
  %27 = getelementptr inbounds %struct.stat64* %20, i64 0, i32 3, !dbg !2295
  %28 = load i32* %27, align 4, !dbg !2295, !tbaa !805
  %29 = and i32 %28, 61440, !dbg !2295
  %30 = icmp eq i32 %29, 40960, !dbg !2295
  br i1 %30, label %31, label %45, !dbg !2295

; <label>:31                                      ; preds = %26
  store i8 %1, i8* %buf, align 1, !dbg !2298, !tbaa !694
  %32 = icmp ugt i64 %bufsize, 1, !dbg !2300
  br i1 %32, label %33, label %.thread2, !dbg !2300

; <label>:33                                      ; preds = %31
  %34 = getelementptr inbounds i8* %buf, i64 1, !dbg !2300
  store i8 46, i8* %34, align 1, !dbg !2300, !tbaa !694
  %35 = icmp ugt i64 %bufsize, 2, !dbg !2302
  br i1 %35, label %36, label %.thread2, !dbg !2302

; <label>:36                                      ; preds = %33
  %37 = getelementptr inbounds i8* %buf, i64 2, !dbg !2302
  store i8 108, i8* %37, align 1, !dbg !2302, !tbaa !694
  %38 = icmp ugt i64 %bufsize, 3, !dbg !2304
  br i1 %38, label %.thread1, label %.thread2, !dbg !2304

.thread1:                                         ; preds = %36
  %39 = getelementptr inbounds i8* %buf, i64 3, !dbg !2304
  store i8 110, i8* %39, align 1, !dbg !2304, !tbaa !694
  %40 = icmp ugt i64 %bufsize, 4, !dbg !2306
  br i1 %40, label %41, label %.thread2, !dbg !2306

; <label>:41                                      ; preds = %.thread1
  %42 = getelementptr inbounds i8* %buf, i64 4, !dbg !2306
  store i8 107, i8* %42, align 1, !dbg !2306, !tbaa !694
  br label %.thread2, !dbg !2306

.thread2:                                         ; preds = %33, %31, %36, %41, %.thread1
  %43 = icmp ugt i64 %bufsize, 5, !dbg !2308
  %44 = select i1 %43, i64 5, i64 %bufsize, !dbg !2308
  br label %55, !dbg !2308

; <label>:45                                      ; preds = %26
  %46 = tail call i32* @__errno_location() #1, !dbg !2309
  store i32 22, i32* %46, align 4, !dbg !2309, !tbaa !752
  br label %55, !dbg !2311

__get_sym_file.exit.thread:                       ; preds = %10, %.preheader.i, %16, %0, %4
  %47 = tail call i64 (i64, ...)* @syscall(i64 89, i8* %path, i8* %buf, i64 %bufsize) #5, !dbg !2312
  %48 = trunc i64 %47 to i32, !dbg !2312
  tail call void @llvm.dbg.value(metadata !{i32 %48}, i64 0, metadata !557), !dbg !2312
  %49 = icmp eq i32 %48, -1, !dbg !2313
  br i1 %49, label %50, label %53, !dbg !2313

; <label>:50                                      ; preds = %__get_sym_file.exit.thread
  %51 = tail call i32 @klee_get_errno() #5, !dbg !2315
  %52 = tail call i32* @__errno_location() #1, !dbg !2315
  store i32 %51, i32* %52, align 4, !dbg !2315, !tbaa !752
  br label %53, !dbg !2315

; <label>:53                                      ; preds = %50, %__get_sym_file.exit.thread
  %sext = shl i64 %47, 32, !dbg !2316
  %54 = ashr exact i64 %sext, 32, !dbg !2316
  br label %55, !dbg !2316

; <label>:55                                      ; preds = %53, %45, %.thread2
  %.0 = phi i64 [ %44, %.thread2 ], [ -1, %45 ], [ %54, %53 ]
  ret i64 %.0, !dbg !2317
}

; Function Attrs: nounwind uwtable
define i32 @select(i32 %nfds, %struct.fd_set* %read, %struct.fd_set* %write, %struct.fd_set* %except, %struct.timeval* nocapture readnone %timeout) #0 {
  %in_read = alloca %struct.fd_set, align 8
  %in_write = alloca %struct.fd_set, align 8
  %in_except = alloca %struct.fd_set, align 8
  %os_read = alloca %struct.fd_set, align 8
  %os_write = alloca %struct.fd_set, align 8
  %os_except = alloca %struct.fd_set, align 8
  %tv = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata !{i32 %nfds}, i64 0, metadata !575), !dbg !2318
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %read}, i64 0, metadata !576), !dbg !2318
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %write}, i64 0, metadata !577), !dbg !2318
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %except}, i64 0, metadata !578), !dbg !2319
  call void @llvm.dbg.value(metadata !{%struct.timeval* %timeout}, i64 0, metadata !579), !dbg !2319
  %1 = bitcast %struct.fd_set* %in_read to i8*, !dbg !2320
  call void @llvm.lifetime.start(i64 128, i8* %1) #5, !dbg !2320
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_read}, metadata !580), !dbg !2320
  %2 = bitcast %struct.fd_set* %in_write to i8*, !dbg !2320
  call void @llvm.lifetime.start(i64 128, i8* %2) #5, !dbg !2320
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_write}, metadata !581), !dbg !2320
  %3 = bitcast %struct.fd_set* %in_except to i8*, !dbg !2320
  call void @llvm.lifetime.start(i64 128, i8* %3) #5, !dbg !2320
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_except}, metadata !582), !dbg !2320
  %4 = bitcast %struct.fd_set* %os_read to i8*, !dbg !2320
  call void @llvm.lifetime.start(i64 128, i8* %4) #5, !dbg !2320
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_read}, metadata !583), !dbg !2320
  %5 = bitcast %struct.fd_set* %os_write to i8*, !dbg !2320
  call void @llvm.lifetime.start(i64 128, i8* %5) #5, !dbg !2320
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_write}, metadata !584), !dbg !2320
  %6 = bitcast %struct.fd_set* %os_except to i8*, !dbg !2320
  call void @llvm.lifetime.start(i64 128, i8* %6) #5, !dbg !2320
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_except}, metadata !585), !dbg !2320
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !587), !dbg !2321
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !588), !dbg !2321
  %7 = icmp ne %struct.fd_set* %read, null, !dbg !2322
  br i1 %7, label %8, label %10, !dbg !2322

; <label>:8                                       ; preds = %0
  %9 = bitcast %struct.fd_set* %read to i8*, !dbg !2324
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %9, i64 128, i32 8, i1 false), !dbg !2324, !tbaa.struct !2326
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 128, i32 1, i1 false), !dbg !2327
  br label %11, !dbg !2328

; <label>:10                                      ; preds = %0
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 128, i32 8, i1 false), !dbg !2329
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = icmp ne %struct.fd_set* %write, null, !dbg !2331
  br i1 %12, label %13, label %15, !dbg !2331

; <label>:13                                      ; preds = %11
  %14 = bitcast %struct.fd_set* %write to i8*, !dbg !2333
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %14, i64 128, i32 8, i1 false), !dbg !2333, !tbaa.struct !2326
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 128, i32 1, i1 false), !dbg !2335
  br label %16, !dbg !2336

; <label>:15                                      ; preds = %11
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 128, i32 8, i1 false), !dbg !2337
  br label %16

; <label>:16                                      ; preds = %15, %13
  %17 = icmp ne %struct.fd_set* %except, null, !dbg !2339
  br i1 %17, label %18, label %20, !dbg !2339

; <label>:18                                      ; preds = %16
  %19 = bitcast %struct.fd_set* %except to i8*, !dbg !2341
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %19, i64 128, i32 8, i1 false), !dbg !2341, !tbaa.struct !2326
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 128, i32 1, i1 false), !dbg !2343
  br label %21, !dbg !2344

; <label>:20                                      ; preds = %16
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 128, i32 8, i1 false), !dbg !2345
  br label %21

; <label>:21                                      ; preds = %20, %18
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 128, i32 8, i1 false), !dbg !2347
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 128, i32 8, i1 false), !dbg !2348
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 128, i32 8, i1 false), !dbg !2349
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !586), !dbg !2350
  %22 = icmp sgt i32 %nfds, 0, !dbg !2350
  br i1 %22, label %.lr.ph12, label %.loopexit, !dbg !2350

.lr.ph12:                                         ; preds = %21, %127
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %127 ], [ 0, %21 ]
  %count.09 = phi i32 [ %count.1, %127 ], [ 0, %21 ]
  %os_nfds.08 = phi i32 [ %os_nfds.1, %127 ], [ 0, %21 ]
  %23 = trunc i64 %indvars.iv14 to i32, !dbg !2351
  %24 = sdiv i32 %23, 64, !dbg !2351
  %25 = sext i32 %24 to i64, !dbg !2351
  %26 = getelementptr inbounds %struct.fd_set* %in_read, i64 0, i32 0, i64 %25, !dbg !2351
  %27 = load i64* %26, align 8, !dbg !2351, !tbaa !2163
  %28 = and i32 %23, 63, !dbg !2351
  %29 = shl i32 1, %28, !dbg !2351
  %30 = sext i32 %29 to i64, !dbg !2351
  %31 = and i64 %27, %30, !dbg !2351
  %32 = icmp eq i64 %31, 0, !dbg !2351
  br i1 %32, label %33, label %43, !dbg !2351

; <label>:33                                      ; preds = %.lr.ph12
  %34 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %25, !dbg !2351
  %35 = load i64* %34, align 8, !dbg !2351, !tbaa !2163
  %36 = and i64 %35, %30, !dbg !2351
  %37 = icmp eq i64 %36, 0, !dbg !2351
  br i1 %37, label %38, label %43, !dbg !2351

; <label>:38                                      ; preds = %33
  %39 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %25, !dbg !2351
  %40 = load i64* %39, align 8, !dbg !2351, !tbaa !2163
  %41 = and i64 %40, %30, !dbg !2351
  %42 = icmp eq i64 %41, 0, !dbg !2351
  br i1 %42, label %127, label %43, !dbg !2351

; <label>:43                                      ; preds = %38, %33, %.lr.ph12
  tail call void @llvm.dbg.value(metadata !2352, i64 0, metadata !2353), !dbg !2355
  %44 = icmp ult i32 %23, 32, !dbg !2356
  br i1 %44, label %45, label %__get_file.exit.thread, !dbg !2356

; <label>:45                                      ; preds = %43
  %46 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv14, i32 1, !dbg !2357
  %47 = load i32* %46, align 4, !dbg !2357, !tbaa !765
  %48 = and i32 %47, 1, !dbg !2357
  %49 = icmp eq i32 %48, 0, !dbg !2357
  br i1 %49, label %__get_file.exit.thread, label %__get_file.exit, !dbg !2357

__get_file.exit:                                  ; preds = %45
  %50 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv14, !dbg !2358
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %50}, i64 0, metadata !589), !dbg !2354
  %51 = icmp eq %struct.exe_file_t* %50, null, !dbg !2359
  br i1 %51, label %__get_file.exit.thread, label %53, !dbg !2359

__get_file.exit.thread:                           ; preds = %43, %45, %__get_file.exit
  %52 = call i32* @__errno_location() #1, !dbg !2361
  store i32 9, i32* %52, align 4, !dbg !2361, !tbaa !752
  br label %.loopexit, !dbg !2363

; <label>:53                                      ; preds = %__get_file.exit
  %54 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv14, i32 3, !dbg !2364
  %55 = load %struct.exe_disk_file_t** %54, align 8, !dbg !2364, !tbaa !788
  %56 = icmp eq %struct.exe_disk_file_t* %55, null, !dbg !2364
  %57 = icmp ne i64 %31, 0, !dbg !2366
  br i1 %56, label %83, label %58, !dbg !2364

; <label>:58                                      ; preds = %53
  br i1 %57, label %59, label %63, !dbg !2366

; <label>:59                                      ; preds = %58
  %60 = getelementptr inbounds %struct.fd_set* %read, i64 0, i32 0, i64 %25, !dbg !2366
  %61 = load i64* %60, align 8, !dbg !2366, !tbaa !2163
  %62 = or i64 %61, %30, !dbg !2366
  store i64 %62, i64* %60, align 8, !dbg !2366, !tbaa !2163
  br label %63, !dbg !2366

; <label>:63                                      ; preds = %59, %58
  %64 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %25, !dbg !2369
  %65 = load i64* %64, align 8, !dbg !2369, !tbaa !2163
  %66 = and i64 %65, %30, !dbg !2369
  %67 = icmp eq i64 %66, 0, !dbg !2369
  br i1 %67, label %72, label %68, !dbg !2369

; <label>:68                                      ; preds = %63
  %69 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %25, !dbg !2369
  %70 = load i64* %69, align 8, !dbg !2369, !tbaa !2163
  %71 = or i64 %70, %30, !dbg !2369
  store i64 %71, i64* %69, align 8, !dbg !2369, !tbaa !2163
  br label %72, !dbg !2369

; <label>:72                                      ; preds = %63, %68
  %73 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %25, !dbg !2371
  %74 = load i64* %73, align 8, !dbg !2371, !tbaa !2163
  %75 = and i64 %74, %30, !dbg !2371
  %76 = icmp eq i64 %75, 0, !dbg !2371
  br i1 %76, label %81, label %77, !dbg !2371

; <label>:77                                      ; preds = %72
  %78 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %25, !dbg !2371
  %79 = load i64* %78, align 8, !dbg !2371, !tbaa !2163
  %80 = or i64 %79, %30, !dbg !2371
  store i64 %80, i64* %78, align 8, !dbg !2371, !tbaa !2163
  br label %81, !dbg !2371

; <label>:81                                      ; preds = %72, %77
  %82 = add nsw i32 %count.09, 1, !dbg !2373
  call void @llvm.dbg.value(metadata !{i32 %82}, i64 0, metadata !587), !dbg !2373
  br label %127, !dbg !2374

; <label>:83                                      ; preds = %53
  br i1 %57, label %84, label %95, !dbg !2375

; <label>:84                                      ; preds = %83
  %85 = getelementptr inbounds %struct.exe_file_t* %50, i64 0, i32 0, !dbg !2375
  %86 = load i32* %85, align 8, !dbg !2375, !tbaa !855
  %87 = and i32 %86, 63, !dbg !2375
  %88 = shl i32 1, %87, !dbg !2375
  %89 = sext i32 %88 to i64, !dbg !2375
  %90 = sdiv i32 %86, 64, !dbg !2375
  %91 = sext i32 %90 to i64, !dbg !2375
  %92 = getelementptr inbounds %struct.fd_set* %os_read, i64 0, i32 0, i64 %91, !dbg !2375
  %93 = load i64* %92, align 8, !dbg !2375, !tbaa !2163
  %94 = or i64 %89, %93, !dbg !2375
  store i64 %94, i64* %92, align 8, !dbg !2375, !tbaa !2163
  br label %95, !dbg !2375

; <label>:95                                      ; preds = %84, %83
  %96 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %25, !dbg !2378
  %97 = load i64* %96, align 8, !dbg !2378, !tbaa !2163
  %98 = and i64 %97, %30, !dbg !2378
  %99 = icmp eq i64 %98, 0, !dbg !2378
  br i1 %99, label %111, label %100, !dbg !2378

; <label>:100                                     ; preds = %95
  %101 = getelementptr inbounds %struct.exe_file_t* %50, i64 0, i32 0, !dbg !2378
  %102 = load i32* %101, align 8, !dbg !2378, !tbaa !855
  %103 = and i32 %102, 63, !dbg !2378
  %104 = shl i32 1, %103, !dbg !2378
  %105 = sext i32 %104 to i64, !dbg !2378
  %106 = sdiv i32 %102, 64, !dbg !2378
  %107 = sext i32 %106 to i64, !dbg !2378
  %108 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %107, !dbg !2378
  %109 = load i64* %108, align 8, !dbg !2378, !tbaa !2163
  %110 = or i64 %105, %109, !dbg !2378
  store i64 %110, i64* %108, align 8, !dbg !2378, !tbaa !2163
  br label %111, !dbg !2378

; <label>:111                                     ; preds = %95, %100
  %112 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %25, !dbg !2380
  %113 = load i64* %112, align 8, !dbg !2380, !tbaa !2163
  %114 = and i64 %113, %30, !dbg !2380
  %115 = icmp eq i64 %114, 0, !dbg !2380
  %.phi.trans.insert = getelementptr inbounds %struct.exe_file_t* %50, i64 0, i32 0
  %.pre = load i32* %.phi.trans.insert, align 8, !dbg !2382, !tbaa !855
  br i1 %115, label %._crit_edge16, label %116, !dbg !2380

; <label>:116                                     ; preds = %111
  %117 = and i32 %.pre, 63, !dbg !2380
  %118 = shl i32 1, %117, !dbg !2380
  %119 = sext i32 %118 to i64, !dbg !2380
  %120 = sdiv i32 %.pre, 64, !dbg !2380
  %121 = sext i32 %120 to i64, !dbg !2380
  %122 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %121, !dbg !2380
  %123 = load i64* %122, align 8, !dbg !2380, !tbaa !2163
  %124 = or i64 %119, %123, !dbg !2380
  store i64 %124, i64* %122, align 8, !dbg !2380, !tbaa !2163
  br label %._crit_edge16, !dbg !2380

._crit_edge16:                                    ; preds = %111, %116
  %125 = icmp slt i32 %.pre, %os_nfds.08, !dbg !2382
  %126 = add nsw i32 %.pre, 1, !dbg !2382
  call void @llvm.dbg.value(metadata !{i32 %126}, i64 0, metadata !588), !dbg !2382
  %os_nfds.0. = select i1 %125, i32 %os_nfds.08, i32 %126, !dbg !2382
  br label %127, !dbg !2382

; <label>:127                                     ; preds = %._crit_edge16, %38, %81
  %os_nfds.1 = phi i32 [ %os_nfds.08, %81 ], [ %os_nfds.08, %38 ], [ %os_nfds.0., %._crit_edge16 ]
  %count.1 = phi i32 [ %82, %81 ], [ %count.09, %38 ], [ %count.09, %._crit_edge16 ]
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1, !dbg !2350
  %128 = trunc i64 %indvars.iv.next15 to i32, !dbg !2350
  %129 = icmp slt i32 %128, %nfds, !dbg !2350
  br i1 %129, label %.lr.ph12, label %._crit_edge, !dbg !2350

._crit_edge:                                      ; preds = %127
  %130 = icmp sgt i32 %os_nfds.1, 0, !dbg !2384
  br i1 %130, label %131, label %.loopexit, !dbg !2384

; <label>:131                                     ; preds = %._crit_edge
  call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv}, metadata !594), !dbg !2385
  %132 = bitcast %struct.timeval* %tv to i8*, !dbg !2385
  call void @llvm.memset.p0i8.i64(i8* %132, i8 0, i64 16, i32 8, i1 false), !dbg !2385
  %133 = call i64 (i64, ...)* @syscall(i64 23, i32 %os_nfds.1, %struct.fd_set* %os_read, %struct.fd_set* %os_write, %struct.fd_set* %os_except, %struct.timeval* %tv) #5, !dbg !2386
  %134 = trunc i64 %133 to i32, !dbg !2386
  call void @llvm.dbg.value(metadata !{i32 %134}, i64 0, metadata !597), !dbg !2386
  %135 = icmp eq i32 %134, -1, !dbg !2387
  br i1 %135, label %136, label %141, !dbg !2387

; <label>:136                                     ; preds = %131
  %137 = icmp eq i32 %count.1, 0, !dbg !2388
  br i1 %137, label %138, label %.loopexit, !dbg !2388

; <label>:138                                     ; preds = %136
  %139 = call i32 @klee_get_errno() #5, !dbg !2391
  %140 = call i32* @__errno_location() #1, !dbg !2391
  store i32 %139, i32* %140, align 4, !dbg !2391, !tbaa !752
  br label %.loopexit, !dbg !2393

; <label>:141                                     ; preds = %131
  %142 = add nsw i32 %134, %count.1, !dbg !2394
  call void @llvm.dbg.value(metadata !{i32 %142}, i64 0, metadata !587), !dbg !2394
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !586), !dbg !2395
  br i1 %22, label %.lr.ph, label %.loopexit, !dbg !2395

.lr.ph:                                           ; preds = %141, %__get_file.exit3.thread
  %indvars.iv = phi i64 [ %indvars.iv.next, %__get_file.exit3.thread ], [ 0, %141 ]
  tail call void @llvm.dbg.value(metadata !2352, i64 0, metadata !2396), !dbg !2398
  %143 = trunc i64 %indvars.iv to i32, !dbg !2399
  %144 = icmp ult i32 %143, 32, !dbg !2399
  br i1 %144, label %145, label %__get_file.exit3.thread, !dbg !2399

; <label>:145                                     ; preds = %.lr.ph
  %146 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !2400
  %147 = load i32* %146, align 4, !dbg !2400, !tbaa !765
  %148 = and i32 %147, 1, !dbg !2400
  %149 = icmp eq i32 %148, 0, !dbg !2400
  br i1 %149, label %__get_file.exit3.thread, label %__get_file.exit3, !dbg !2400

__get_file.exit3:                                 ; preds = %145
  %150 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, !dbg !2401
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %150}, i64 0, metadata !598), !dbg !2397
  %151 = icmp eq %struct.exe_file_t* %150, null, !dbg !2402
  br i1 %151, label %__get_file.exit3.thread, label %152, !dbg !2402

; <label>:152                                     ; preds = %__get_file.exit3
  %153 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 3, !dbg !2402
  %154 = load %struct.exe_disk_file_t** %153, align 8, !dbg !2402, !tbaa !788
  %155 = icmp eq %struct.exe_disk_file_t* %154, null, !dbg !2402
  br i1 %155, label %156, label %__get_file.exit3.thread, !dbg !2402

; <label>:156                                     ; preds = %152
  br i1 %7, label %157, label %178, !dbg !2404

; <label>:157                                     ; preds = %156
  %158 = getelementptr inbounds %struct.exe_file_t* %150, i64 0, i32 0, !dbg !2404
  %159 = load i32* %158, align 8, !dbg !2404, !tbaa !855
  %160 = sdiv i32 %159, 64, !dbg !2404
  %161 = sext i32 %160 to i64, !dbg !2404
  %162 = getelementptr inbounds %struct.fd_set* %os_read, i64 0, i32 0, i64 %161, !dbg !2404
  %163 = load i64* %162, align 8, !dbg !2404, !tbaa !2163
  %164 = and i32 %159, 63, !dbg !2404
  %165 = shl i32 1, %164, !dbg !2404
  %166 = sext i32 %165 to i64, !dbg !2404
  %167 = and i64 %166, %163, !dbg !2404
  %168 = icmp eq i64 %167, 0, !dbg !2404
  br i1 %168, label %178, label %169, !dbg !2404

; <label>:169                                     ; preds = %157
  %170 = and i32 %143, 63, !dbg !2404
  %171 = shl i32 1, %170, !dbg !2404
  %172 = sext i32 %171 to i64, !dbg !2404
  %173 = sdiv i32 %143, 64, !dbg !2404
  %174 = sext i32 %173 to i64, !dbg !2404
  %175 = getelementptr inbounds %struct.fd_set* %read, i64 0, i32 0, i64 %174, !dbg !2404
  %176 = load i64* %175, align 8, !dbg !2404, !tbaa !2163
  %177 = or i64 %176, %172, !dbg !2404
  store i64 %177, i64* %175, align 8, !dbg !2404, !tbaa !2163
  br label %178, !dbg !2404

; <label>:178                                     ; preds = %157, %169, %156
  br i1 %12, label %179, label %200, !dbg !2407

; <label>:179                                     ; preds = %178
  %180 = getelementptr inbounds %struct.exe_file_t* %150, i64 0, i32 0, !dbg !2407
  %181 = load i32* %180, align 8, !dbg !2407, !tbaa !855
  %182 = sdiv i32 %181, 64, !dbg !2407
  %183 = sext i32 %182 to i64, !dbg !2407
  %184 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %183, !dbg !2407
  %185 = load i64* %184, align 8, !dbg !2407, !tbaa !2163
  %186 = and i32 %181, 63, !dbg !2407
  %187 = shl i32 1, %186, !dbg !2407
  %188 = sext i32 %187 to i64, !dbg !2407
  %189 = and i64 %188, %185, !dbg !2407
  %190 = icmp eq i64 %189, 0, !dbg !2407
  br i1 %190, label %200, label %191, !dbg !2407

; <label>:191                                     ; preds = %179
  %192 = and i32 %143, 63, !dbg !2407
  %193 = shl i32 1, %192, !dbg !2407
  %194 = sext i32 %193 to i64, !dbg !2407
  %195 = sdiv i32 %143, 64, !dbg !2407
  %196 = sext i32 %195 to i64, !dbg !2407
  %197 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %196, !dbg !2407
  %198 = load i64* %197, align 8, !dbg !2407, !tbaa !2163
  %199 = or i64 %198, %194, !dbg !2407
  store i64 %199, i64* %197, align 8, !dbg !2407, !tbaa !2163
  br label %200, !dbg !2407

; <label>:200                                     ; preds = %179, %191, %178
  br i1 %17, label %201, label %__get_file.exit3.thread, !dbg !2409

; <label>:201                                     ; preds = %200
  %202 = getelementptr inbounds %struct.exe_file_t* %150, i64 0, i32 0, !dbg !2409
  %203 = load i32* %202, align 8, !dbg !2409, !tbaa !855
  %204 = sdiv i32 %203, 64, !dbg !2409
  %205 = sext i32 %204 to i64, !dbg !2409
  %206 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %205, !dbg !2409
  %207 = load i64* %206, align 8, !dbg !2409, !tbaa !2163
  %208 = and i32 %203, 63, !dbg !2409
  %209 = shl i32 1, %208, !dbg !2409
  %210 = sext i32 %209 to i64, !dbg !2409
  %211 = and i64 %210, %207, !dbg !2409
  %212 = icmp eq i64 %211, 0, !dbg !2409
  br i1 %212, label %__get_file.exit3.thread, label %213, !dbg !2409

; <label>:213                                     ; preds = %201
  %214 = and i32 %143, 63, !dbg !2409
  %215 = shl i32 1, %214, !dbg !2409
  %216 = sext i32 %215 to i64, !dbg !2409
  %217 = sdiv i32 %143, 64, !dbg !2409
  %218 = sext i32 %217 to i64, !dbg !2409
  %219 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %218, !dbg !2409
  %220 = load i64* %219, align 8, !dbg !2409, !tbaa !2163
  %221 = or i64 %220, %216, !dbg !2409
  store i64 %221, i64* %219, align 8, !dbg !2409, !tbaa !2163
  br label %__get_file.exit3.thread, !dbg !2409

__get_file.exit3.thread:                          ; preds = %.lr.ph, %145, %201, %152, %__get_file.exit3, %213, %200
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !2395
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !2395
  %exitcond = icmp eq i32 %lftr.wideiv, %nfds, !dbg !2395
  br i1 %exitcond, label %.loopexit, label %.lr.ph, !dbg !2395

.loopexit:                                        ; preds = %__get_file.exit3.thread, %21, %141, %._crit_edge, %136, %138, %__get_file.exit.thread
  %.0 = phi i32 [ -1, %__get_file.exit.thread ], [ -1, %138 ], [ %count.1, %136 ], [ %count.1, %._crit_edge ], [ %142, %141 ], [ 0, %21 ], [ %142, %__get_file.exit3.thread ]
  call void @llvm.lifetime.end(i64 128, i8* %6) #5, !dbg !2411
  call void @llvm.lifetime.end(i64 128, i8* %5) #5, !dbg !2411
  call void @llvm.lifetime.end(i64 128, i8* %4) #5, !dbg !2411
  call void @llvm.lifetime.end(i64 128, i8* %3) #5, !dbg !2411
  call void @llvm.lifetime.end(i64 128, i8* %2) #5, !dbg !2411
  call void @llvm.lifetime.end(i64 128, i8* %1) #5, !dbg !2411
  ret i32 %.0, !dbg !2411
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #5

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #5

; Function Attrs: nounwind uwtable
define i8* @getcwd(i8* %buf, i64 %size) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !607), !dbg !2412
  tail call void @llvm.dbg.value(metadata !{i64 %size}, i64 0, metadata !608), !dbg !2412
  %1 = load i32* @getcwd.n_calls, align 4, !dbg !2413, !tbaa !752
  %2 = add nsw i32 %1, 1, !dbg !2413
  store i32 %2, i32* @getcwd.n_calls, align 4, !dbg !2413, !tbaa !752
  %3 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2414, !tbaa !1092
  %4 = icmp eq i32 %3, 0, !dbg !2414
  br i1 %4, label %12, label %5, !dbg !2414

; <label>:5                                       ; preds = %0
  %6 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 8, !dbg !2414, !tbaa !2416
  %7 = load i32* %6, align 4, !dbg !2414, !tbaa !752
  %8 = icmp eq i32 %7, %2, !dbg !2414
  br i1 %8, label %9, label %12, !dbg !2414

; <label>:9                                       ; preds = %5
  %10 = add i32 %3, -1, !dbg !2417
  store i32 %10, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2417, !tbaa !1092
  %11 = tail call i32* @__errno_location() #1, !dbg !2419
  store i32 34, i32* %11, align 4, !dbg !2419, !tbaa !752
  br label %32, !dbg !2420

; <label>:12                                      ; preds = %0, %5
  %13 = icmp eq i8* %buf, null, !dbg !2421
  br i1 %13, label %14, label %17, !dbg !2421

; <label>:14                                      ; preds = %12
  %15 = icmp eq i64 %size, 0, !dbg !2423
  tail call void @llvm.dbg.value(metadata !2426, i64 0, metadata !608), !dbg !2427
  %.size = select i1 %15, i64 1024, i64 %size, !dbg !2423
  %16 = tail call noalias i8* @malloc(i64 %.size) #5, !dbg !2428
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !607), !dbg !2428
  br label %17, !dbg !2429

; <label>:17                                      ; preds = %12, %14
  %.02 = phi i8* [ %buf, %12 ], [ %16, %14 ]
  %.1 = phi i64 [ %size, %12 ], [ %.size, %14 ]
  tail call void @llvm.dbg.value(metadata !{i8* %.02}, i64 0, metadata !2430) #5, !dbg !2432
  %18 = ptrtoint i8* %.02 to i64, !dbg !2433
  %19 = tail call i64 @klee_get_valuel(i64 %18) #5, !dbg !2433
  %20 = inttoptr i64 %19 to i8*, !dbg !2433
  tail call void @llvm.dbg.value(metadata !{i8* %20}, i64 0, metadata !2434) #5, !dbg !2433
  %21 = icmp eq i8* %20, %.02, !dbg !2435
  %22 = zext i1 %21 to i64, !dbg !2435
  tail call void @klee_assume(i64 %22) #5, !dbg !2435
  tail call void @llvm.dbg.value(metadata !{i8* %20}, i64 0, metadata !607), !dbg !2431
  tail call void @llvm.dbg.value(metadata !{i64 %.1}, i64 0, metadata !2436) #5, !dbg !2438
  %23 = tail call i64 @klee_get_valuel(i64 %.1) #5, !dbg !2439
  tail call void @llvm.dbg.value(metadata !{i64 %23}, i64 0, metadata !2440) #5, !dbg !2439
  %24 = icmp eq i64 %23, %.1, !dbg !2441
  %25 = zext i1 %24 to i64, !dbg !2441
  tail call void @klee_assume(i64 %25) #5, !dbg !2441
  tail call void @llvm.dbg.value(metadata !{i64 %23}, i64 0, metadata !608), !dbg !2437
  tail call void @klee_check_memory_access(i8* %20, i64 %23) #5, !dbg !2442
  %26 = tail call i64 (i64, ...)* @syscall(i64 79, i8* %20, i64 %23) #5, !dbg !2443
  %27 = trunc i64 %26 to i32, !dbg !2443
  tail call void @llvm.dbg.value(metadata !{i32 %27}, i64 0, metadata !609), !dbg !2443
  %28 = icmp eq i32 %27, -1, !dbg !2444
  br i1 %28, label %29, label %32, !dbg !2444

; <label>:29                                      ; preds = %17
  %30 = tail call i32 @klee_get_errno() #5, !dbg !2446
  %31 = tail call i32* @__errno_location() #1, !dbg !2446
  store i32 %30, i32* %31, align 4, !dbg !2446, !tbaa !752
  br label %32, !dbg !2448

; <label>:32                                      ; preds = %17, %29, %9
  %.0 = phi i8* [ null, %9 ], [ null, %29 ], [ %20, %17 ]
  ret i8* %.0, !dbg !2449
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define i32 @chroot(i8* nocapture readonly %path) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !612), !dbg !2450
  %1 = load i8* %path, align 1, !dbg !2451, !tbaa !694
  switch i8 %1, label %8 [
    i8 0, label %2
    i8 47, label %4
  ], !dbg !2451

; <label>:2                                       ; preds = %0
  %3 = tail call i32* @__errno_location() #1, !dbg !2453
  store i32 2, i32* %3, align 4, !dbg !2453, !tbaa !752
  br label %10, !dbg !2455

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds i8* %path, i64 1, !dbg !2456
  %6 = load i8* %5, align 1, !dbg !2456, !tbaa !694
  %7 = icmp eq i8 %6, 0, !dbg !2456
  br i1 %7, label %10, label %8, !dbg !2456

; <label>:8                                       ; preds = %0, %4
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str23, i64 0, i64 0)) #5, !dbg !2458
  %9 = tail call i32* @__errno_location() #1, !dbg !2459
  store i32 2, i32* %9, align 4, !dbg !2459, !tbaa !752
  br label %10, !dbg !2460

; <label>:10                                      ; preds = %4, %8, %2
  %.0 = phi i32 [ -1, %2 ], [ -1, %8 ], [ 0, %4 ]
  ret i32 %.0, !dbg !2461
}

declare i64 @klee_get_valuel(i64) #3

declare void @klee_assume(i64) #3

; Function Attrs: nounwind
declare i32 @geteuid() #2

; Function Attrs: nounwind
declare i32 @getgid() #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!686, !687}
!llvm.ident = !{!688}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !22, metadata !23, metadata !678, metadata !22, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/POSIX//home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!2 = metadata !{metadata !3, metadata !10}
!3 = metadata !{i32 786436, metadata !4, null, metadata !"", i32 26, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 26, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9}
!6 = metadata !{i32 786472, metadata !"eOpen", i64 1} ; [ DW_TAG_enumerator ] [eOpen :: 1]
!7 = metadata !{i32 786472, metadata !"eCloseOnExec", i64 2} ; [ DW_TAG_enumerator ] [eCloseOnExec :: 2]
!8 = metadata !{i32 786472, metadata !"eReadable", i64 4} ; [ DW_TAG_enumerator ] [eReadable :: 4]
!9 = metadata !{i32 786472, metadata !"eWriteable", i64 8} ; [ DW_TAG_enumerator ] [eWriteable :: 8]
!10 = metadata !{i32 786436, metadata !11, null, metadata !"", i32 97, i64 32, i64 32, i32 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 97, size 32, align 32, offset 0] [def] [from ]
!11 = metadata !{metadata !"/usr/include/dirent.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21}
!13 = metadata !{i32 786472, metadata !"DT_UNKNOWN", i64 0} ; [ DW_TAG_enumerator ] [DT_UNKNOWN :: 0]
!14 = metadata !{i32 786472, metadata !"DT_FIFO", i64 1} ; [ DW_TAG_enumerator ] [DT_FIFO :: 1]
!15 = metadata !{i32 786472, metadata !"DT_CHR", i64 2} ; [ DW_TAG_enumerator ] [DT_CHR :: 2]
!16 = metadata !{i32 786472, metadata !"DT_DIR", i64 4} ; [ DW_TAG_enumerator ] [DT_DIR :: 4]
!17 = metadata !{i32 786472, metadata !"DT_BLK", i64 6} ; [ DW_TAG_enumerator ] [DT_BLK :: 6]
!18 = metadata !{i32 786472, metadata !"DT_REG", i64 8} ; [ DW_TAG_enumerator ] [DT_REG :: 8]
!19 = metadata !{i32 786472, metadata !"DT_LNK", i64 10} ; [ DW_TAG_enumerator ] [DT_LNK :: 10]
!20 = metadata !{i32 786472, metadata !"DT_SOCK", i64 12} ; [ DW_TAG_enumerator ] [DT_SOCK :: 12]
!21 = metadata !{i32 786472, metadata !"DT_WHT", i64 14} ; [ DW_TAG_enumerator ] [DT_WHT :: 14]
!22 = metadata !{i32 0}
!23 = metadata !{metadata !24, metadata !89, metadata !96, metadata !119, metadata !133, metadata !149, metadata !160, metadata !167, metadata !182, metadata !197, metadata !206, metadata !215, metadata !248, metadata !255, metadata !263, metadata !270, metadata !280, metadata !290, metadata !303, metadata !314, metadata !323, metadata !333, metadata !343, metadata !384, metadata !445, metadata !461, metadata !500, metadata !510, metadata !518, metadata !526, metadata !533, metadata !537, metadata !541, metadata !549, metadata !560, metadata !603, metadata !610, metadata !613, metadata !626, metadata !632, metadata !638, metadata !645, metadata !651, metadata !659, metadata !666}
!24 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"access", metadata !"access", metadata !"", i32 73, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @access, null, null, metadata !33, i32 73} ; [ DW_TAG_subprogram ] [line 73] [def] [access]
!25 = metadata !{metadata !"fd.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!26 = metadata !{i32 786473, metadata !25}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!27 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{metadata !29, metadata !30, metadata !29}
!29 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!32 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!33 = metadata !{metadata !34, metadata !35, metadata !36, metadata !86}
!34 = metadata !{i32 786689, metadata !24, metadata !"pathname", metadata !26, i32 16777289, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 73]
!35 = metadata !{i32 786689, metadata !24, metadata !"mode", metadata !26, i32 33554505, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 73]
!36 = metadata !{i32 786688, metadata !24, metadata !"dfile", metadata !26, i32 74, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 74]
!37 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from exe_disk_file_t]
!38 = metadata !{i32 786454, metadata !25, null, metadata !"exe_disk_file_t", i32 24, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ] [exe_disk_file_t] [line 24, size 0, align 0, offset 0] [from ]
!39 = metadata !{i32 786451, metadata !4, null, metadata !"", i32 20, i64 192, i64 64, i32 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 20, size 192, align 64, offset 0] [def] [from ]
!40 = metadata !{metadata !41, metadata !43, metadata !45}
!41 = metadata !{i32 786445, metadata !4, metadata !39, metadata !"size", i32 21, i64 32, i64 32, i64 0, i32 0, metadata !42} ; [ DW_TAG_member ] [size] [line 21, size 32, align 32, offset 0] [from unsigned int]
!42 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!43 = metadata !{i32 786445, metadata !4, metadata !39, metadata !"contents", i32 22, i64 64, i64 64, i64 64, i32 0, metadata !44} ; [ DW_TAG_member ] [contents] [line 22, size 64, align 64, offset 64] [from ]
!44 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!45 = metadata !{i32 786445, metadata !4, metadata !39, metadata !"stat", i32 23, i64 64, i64 64, i64 128, i32 0, metadata !46} ; [ DW_TAG_member ] [stat] [line 23, size 64, align 64, offset 128] [from ]
!46 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !47} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat64]
!47 = metadata !{i32 786451, metadata !48, null, metadata !"stat64", i32 119, i64 1152, i64 64, i32 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat64] [line 119, size 1152, align 64, offset 0] [def] [from ]
!48 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/stat.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!49 = metadata !{metadata !50, metadata !53, metadata !55, metadata !57, metadata !59, metadata !61, metadata !63, metadata !64, metadata !65, metadata !68, metadata !70, metadata !72, metadata !80, metadata !81, metadata !82}
!50 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_dev", i32 121, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_member ] [st_dev] [line 121, size 64, align 64, offset 0] [from __dev_t]
!51 = metadata !{i32 786454, metadata !48, null, metadata !"__dev_t", i32 124, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__dev_t] [line 124, size 0, align 0, offset 0] [from long unsigned int]
!52 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!53 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_ino", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !54} ; [ DW_TAG_member ] [st_ino] [line 123, size 64, align 64, offset 64] [from __ino64_t]
!54 = metadata !{i32 786454, metadata !48, null, metadata !"__ino64_t", i32 128, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__ino64_t] [line 128, size 0, align 0, offset 0] [from long unsigned int]
!55 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_nlink", i32 124, i64 64, i64 64, i64 128, i32 0, metadata !56} ; [ DW_TAG_member ] [st_nlink] [line 124, size 64, align 64, offset 128] [from __nlink_t]
!56 = metadata !{i32 786454, metadata !48, null, metadata !"__nlink_t", i32 130, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__nlink_t] [line 130, size 0, align 0, offset 0] [from long unsigned int]
!57 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_mode", i32 125, i64 32, i64 32, i64 192, i32 0, metadata !58} ; [ DW_TAG_member ] [st_mode] [line 125, size 32, align 32, offset 192] [from __mode_t]
!58 = metadata !{i32 786454, metadata !48, null, metadata !"__mode_t", i32 129, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ] [__mode_t] [line 129, size 0, align 0, offset 0] [from unsigned int]
!59 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_uid", i32 132, i64 32, i64 32, i64 224, i32 0, metadata !60} ; [ DW_TAG_member ] [st_uid] [line 132, size 32, align 32, offset 224] [from __uid_t]
!60 = metadata !{i32 786454, metadata !48, null, metadata !"__uid_t", i32 125, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ] [__uid_t] [line 125, size 0, align 0, offset 0] [from unsigned int]
!61 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_gid", i32 133, i64 32, i64 32, i64 256, i32 0, metadata !62} ; [ DW_TAG_member ] [st_gid] [line 133, size 32, align 32, offset 256] [from __gid_t]
!62 = metadata !{i32 786454, metadata !48, null, metadata !"__gid_t", i32 126, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ] [__gid_t] [line 126, size 0, align 0, offset 0] [from unsigned int]
!63 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"__pad0", i32 135, i64 32, i64 32, i64 288, i32 0, metadata !29} ; [ DW_TAG_member ] [__pad0] [line 135, size 32, align 32, offset 288] [from int]
!64 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_rdev", i32 136, i64 64, i64 64, i64 320, i32 0, metadata !51} ; [ DW_TAG_member ] [st_rdev] [line 136, size 64, align 64, offset 320] [from __dev_t]
!65 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_size", i32 137, i64 64, i64 64, i64 384, i32 0, metadata !66} ; [ DW_TAG_member ] [st_size] [line 137, size 64, align 64, offset 384] [from __off_t]
!66 = metadata !{i32 786454, metadata !48, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!67 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!68 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_blksize", i32 143, i64 64, i64 64, i64 448, i32 0, metadata !69} ; [ DW_TAG_member ] [st_blksize] [line 143, size 64, align 64, offset 448] [from __blksize_t]
!69 = metadata !{i32 786454, metadata !48, null, metadata !"__blksize_t", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__blksize_t] [line 153, size 0, align 0, offset 0] [from long int]
!70 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_blocks", i32 144, i64 64, i64 64, i64 512, i32 0, metadata !71} ; [ DW_TAG_member ] [st_blocks] [line 144, size 64, align 64, offset 512] [from __blkcnt64_t]
!71 = metadata !{i32 786454, metadata !48, null, metadata !"__blkcnt64_t", i32 159, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__blkcnt64_t] [line 159, size 0, align 0, offset 0] [from long int]
!72 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_atim", i32 152, i64 128, i64 64, i64 576, i32 0, metadata !73} ; [ DW_TAG_member ] [st_atim] [line 152, size 128, align 64, offset 576] [from timespec]
!73 = metadata !{i32 786451, metadata !74, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !75, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!74 = metadata !{metadata !"/usr/include/time.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!75 = metadata !{metadata !76, metadata !78}
!76 = metadata !{i32 786445, metadata !74, metadata !73, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !77} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!77 = metadata !{i32 786454, metadata !74, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!78 = metadata !{i32 786445, metadata !74, metadata !73, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !79} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!79 = metadata !{i32 786454, metadata !74, null, metadata !"__syscall_slong_t", i32 175, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__syscall_slong_t] [line 175, size 0, align 0, offset 0] [from long int]
!80 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_mtim", i32 153, i64 128, i64 64, i64 704, i32 0, metadata !73} ; [ DW_TAG_member ] [st_mtim] [line 153, size 128, align 64, offset 704] [from timespec]
!81 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_ctim", i32 154, i64 128, i64 64, i64 832, i32 0, metadata !73} ; [ DW_TAG_member ] [st_ctim] [line 154, size 128, align 64, offset 832] [from timespec]
!82 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"__glibc_reserved", i32 164, i64 192, i64 64, i64 960, i32 0, metadata !83} ; [ DW_TAG_member ] [__glibc_reserved] [line 164, size 192, align 64, offset 960] [from ]
!83 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !79, metadata !84, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __syscall_slong_t]
!84 = metadata !{metadata !85}
!85 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!86 = metadata !{i32 786688, metadata !87, metadata !"r", metadata !26, i32 81, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 81]
!87 = metadata !{i32 786443, metadata !25, metadata !88, i32 80, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!88 = metadata !{i32 786443, metadata !25, metadata !24, i32 76, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!89 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"umask", metadata !"umask", metadata !"", i32 88, metadata !90, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @umask, null, null, metadata !93, i32 88} ; [ DW_TAG_subprogram ] [line 88] [def] [umask]
!90 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !91, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!91 = metadata !{metadata !58, metadata !92}
!92 = metadata !{i32 786454, metadata !25, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !58} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!93 = metadata !{metadata !94, metadata !95}
!94 = metadata !{i32 786689, metadata !89, metadata !"mask", metadata !26, i32 16777304, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mask] [line 88]
!95 = metadata !{i32 786688, metadata !89, metadata !"r", metadata !26, i32 89, metadata !92, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 89]
!96 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_open", metadata !"__fd_open", metadata !"", i32 128, metadata !97, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @__fd_open, null, null, metadata !99, i32 128} ; [ DW_TAG_subprogram ] [line 128] [def] [__fd_open]
!97 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !98, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!98 = metadata !{metadata !29, metadata !30, metadata !29, metadata !92}
!99 = metadata !{metadata !100, metadata !101, metadata !102, metadata !103, metadata !104, metadata !115, metadata !116}
!100 = metadata !{i32 786689, metadata !96, metadata !"pathname", metadata !26, i32 16777344, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 128]
!101 = metadata !{i32 786689, metadata !96, metadata !"flags", metadata !26, i32 33554560, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 128]
!102 = metadata !{i32 786689, metadata !96, metadata !"mode", metadata !26, i32 50331776, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 128]
!103 = metadata !{i32 786688, metadata !96, metadata !"df", metadata !26, i32 129, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 129]
!104 = metadata !{i32 786688, metadata !96, metadata !"f", metadata !26, i32 130, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 130]
!105 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !106} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from exe_file_t]
!106 = metadata !{i32 786454, metadata !25, null, metadata !"exe_file_t", i32 40, i64 0, i64 0, i64 0, i32 0, metadata !107} ; [ DW_TAG_typedef ] [exe_file_t] [line 40, size 0, align 0, offset 0] [from ]
!107 = metadata !{i32 786451, metadata !4, null, metadata !"", i32 33, i64 192, i64 64, i32 0, i32 0, null, metadata !108, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 33, size 192, align 64, offset 0] [def] [from ]
!108 = metadata !{metadata !109, metadata !110, metadata !111, metadata !114}
!109 = metadata !{i32 786445, metadata !4, metadata !107, metadata !"fd", i32 34, i64 32, i64 32, i64 0, i32 0, metadata !29} ; [ DW_TAG_member ] [fd] [line 34, size 32, align 32, offset 0] [from int]
!110 = metadata !{i32 786445, metadata !4, metadata !107, metadata !"flags", i32 35, i64 32, i64 32, i64 32, i32 0, metadata !42} ; [ DW_TAG_member ] [flags] [line 35, size 32, align 32, offset 32] [from unsigned int]
!111 = metadata !{i32 786445, metadata !4, metadata !107, metadata !"off", i32 38, i64 64, i64 64, i64 64, i32 0, metadata !112} ; [ DW_TAG_member ] [off] [line 38, size 64, align 64, offset 64] [from off64_t]
!112 = metadata !{i32 786454, metadata !4, null, metadata !"off64_t", i32 93, i64 0, i64 0, i64 0, i32 0, metadata !113} ; [ DW_TAG_typedef ] [off64_t] [line 93, size 0, align 0, offset 0] [from __off64_t]
!113 = metadata !{i32 786454, metadata !4, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!114 = metadata !{i32 786445, metadata !4, metadata !107, metadata !"dfile", i32 39, i64 64, i64 64, i64 128, i32 0, metadata !37} ; [ DW_TAG_member ] [dfile] [line 39, size 64, align 64, offset 128] [from ]
!115 = metadata !{i32 786688, metadata !96, metadata !"fd", metadata !26, i32 131, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd] [line 131]
!116 = metadata !{i32 786688, metadata !117, metadata !"os_fd", metadata !26, i32 181, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_fd] [line 181]
!117 = metadata !{i32 786443, metadata !25, metadata !118, i32 180, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!118 = metadata !{i32 786443, metadata !25, metadata !96, i32 147, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!119 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_openat", metadata !"__fd_openat", metadata !"", i32 201, metadata !120, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32, i32)* @__fd_openat, null, null, metadata !122, i32 201} ; [ DW_TAG_subprogram ] [line 201] [def] [__fd_openat]
!120 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !121, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!121 = metadata !{metadata !29, metadata !29, metadata !30, metadata !29, metadata !92}
!122 = metadata !{metadata !123, metadata !124, metadata !125, metadata !126, metadata !127, metadata !128, metadata !129, metadata !132}
!123 = metadata !{i32 786689, metadata !119, metadata !"basefd", metadata !26, i32 16777417, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [basefd] [line 201]
!124 = metadata !{i32 786689, metadata !119, metadata !"pathname", metadata !26, i32 33554633, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 201]
!125 = metadata !{i32 786689, metadata !119, metadata !"flags", metadata !26, i32 50331849, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 201]
!126 = metadata !{i32 786689, metadata !119, metadata !"mode", metadata !26, i32 67109065, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 201]
!127 = metadata !{i32 786688, metadata !119, metadata !"f", metadata !26, i32 202, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 202]
!128 = metadata !{i32 786688, metadata !119, metadata !"fd", metadata !26, i32 203, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd] [line 203]
!129 = metadata !{i32 786688, metadata !130, metadata !"bf", metadata !26, i32 205, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bf] [line 205]
!130 = metadata !{i32 786443, metadata !25, metadata !131, i32 204, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!131 = metadata !{i32 786443, metadata !25, metadata !119, i32 204, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!132 = metadata !{i32 786688, metadata !119, metadata !"os_fd", metadata !26, i32 236, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_fd] [line 236]
!133 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"utimes", metadata !"utimes", metadata !"", i32 256, metadata !134, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.timeval*)* @utimes, null, null, metadata !144, i32 256} ; [ DW_TAG_subprogram ] [line 256] [def] [utimes]
!134 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !135, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!135 = metadata !{metadata !29, metadata !30, metadata !136}
!136 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !137} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!137 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !138} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from timeval]
!138 = metadata !{i32 786451, metadata !139, null, metadata !"timeval", i32 30, i64 128, i64 64, i32 0, i32 0, null, metadata !140, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!139 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/time.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!140 = metadata !{metadata !141, metadata !142}
!141 = metadata !{i32 786445, metadata !139, metadata !138, metadata !"tv_sec", i32 32, i64 64, i64 64, i64 0, i32 0, metadata !77} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!142 = metadata !{i32 786445, metadata !139, metadata !138, metadata !"tv_usec", i32 33, i64 64, i64 64, i64 64, i32 0, metadata !143} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!143 = metadata !{i32 786454, metadata !139, null, metadata !"__suseconds_t", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!144 = metadata !{metadata !145, metadata !146, metadata !147, metadata !148}
!145 = metadata !{i32 786689, metadata !133, metadata !"path", metadata !26, i32 16777472, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 256]
!146 = metadata !{i32 786689, metadata !133, metadata !"times", metadata !26, i32 33554688, metadata !136, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [times] [line 256]
!147 = metadata !{i32 786688, metadata !133, metadata !"dfile", metadata !26, i32 257, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 257]
!148 = metadata !{i32 786688, metadata !133, metadata !"r", metadata !26, i32 269, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 269]
!149 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"futimesat", metadata !"futimesat", metadata !"", i32 277, metadata !150, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.timeval*)* @futimesat, null, null, metadata !152, i32 277} ; [ DW_TAG_subprogram ] [line 277] [def] [futimesat]
!150 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !151, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!151 = metadata !{metadata !29, metadata !29, metadata !30, metadata !136}
!152 = metadata !{metadata !153, metadata !154, metadata !155, metadata !156, metadata !159}
!153 = metadata !{i32 786689, metadata !149, metadata !"fd", metadata !26, i32 16777493, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 277]
!154 = metadata !{i32 786689, metadata !149, metadata !"path", metadata !26, i32 33554709, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 277]
!155 = metadata !{i32 786689, metadata !149, metadata !"times", metadata !26, i32 50331925, metadata !136, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [times] [line 277]
!156 = metadata !{i32 786688, metadata !157, metadata !"f", metadata !26, i32 279, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 279]
!157 = metadata !{i32 786443, metadata !25, metadata !158, i32 278, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!158 = metadata !{i32 786443, metadata !25, metadata !149, i32 278, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!159 = metadata !{i32 786688, metadata !149, metadata !"r", metadata !26, i32 295, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 295]
!160 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"close", metadata !"close", metadata !"", i32 303, metadata !161, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @close, null, null, metadata !163, i32 303} ; [ DW_TAG_subprogram ] [line 303] [def] [close]
!161 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !162, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!162 = metadata !{metadata !29, metadata !29}
!163 = metadata !{metadata !164, metadata !165, metadata !166}
!164 = metadata !{i32 786689, metadata !160, metadata !"fd", metadata !26, i32 16777519, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 303]
!165 = metadata !{i32 786688, metadata !160, metadata !"f", metadata !26, i32 305, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 305]
!166 = metadata !{i32 786688, metadata !160, metadata !"r", metadata !26, i32 306, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 306]
!167 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"read", metadata !"read", metadata !"", i32 335, metadata !168, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i8*, i64)* @read, null, null, metadata !174, i32 335} ; [ DW_TAG_subprogram ] [line 335] [def] [read]
!168 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !169, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!169 = metadata !{metadata !170, metadata !29, metadata !172, metadata !173}
!170 = metadata !{i32 786454, metadata !25, null, metadata !"ssize_t", i32 109, i64 0, i64 0, i64 0, i32 0, metadata !171} ; [ DW_TAG_typedef ] [ssize_t] [line 109, size 0, align 0, offset 0] [from __ssize_t]
!171 = metadata !{i32 786454, metadata !25, null, metadata !"__ssize_t", i32 172, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__ssize_t] [line 172, size 0, align 0, offset 0] [from long int]
!172 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!173 = metadata !{i32 786454, metadata !25, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!174 = metadata !{metadata !175, metadata !176, metadata !177, metadata !178, metadata !179}
!175 = metadata !{i32 786689, metadata !167, metadata !"fd", metadata !26, i32 16777551, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 335]
!176 = metadata !{i32 786689, metadata !167, metadata !"buf", metadata !26, i32 33554767, metadata !172, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 335]
!177 = metadata !{i32 786689, metadata !167, metadata !"count", metadata !26, i32 50331983, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 335]
!178 = metadata !{i32 786688, metadata !167, metadata !"f", metadata !26, i32 337, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 337]
!179 = metadata !{i32 786688, metadata !180, metadata !"r", metadata !26, i32 364, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 364]
!180 = metadata !{i32 786443, metadata !25, metadata !181, i32 362, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!181 = metadata !{i32 786443, metadata !25, metadata !167, i32 362, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!182 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"write", metadata !"write", metadata !"", i32 403, metadata !183, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i8*, i64)* @write, null, null, metadata !187, i32 403} ; [ DW_TAG_subprogram ] [line 403] [def] [write]
!183 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !184, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!184 = metadata !{metadata !170, metadata !29, metadata !185, metadata !173}
!185 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !186} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!186 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!187 = metadata !{metadata !188, metadata !189, metadata !190, metadata !191, metadata !192, metadata !195}
!188 = metadata !{i32 786689, metadata !182, metadata !"fd", metadata !26, i32 16777619, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 403]
!189 = metadata !{i32 786689, metadata !182, metadata !"buf", metadata !26, i32 33554835, metadata !185, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 403]
!190 = metadata !{i32 786689, metadata !182, metadata !"count", metadata !26, i32 50332051, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 403]
!191 = metadata !{i32 786688, metadata !182, metadata !"f", metadata !26, i32 405, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 405]
!192 = metadata !{i32 786688, metadata !193, metadata !"r", metadata !26, i32 423, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 423]
!193 = metadata !{i32 786443, metadata !25, metadata !194, i32 422, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!194 = metadata !{i32 786443, metadata !25, metadata !182, i32 422, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!195 = metadata !{i32 786688, metadata !196, metadata !"actual_count", metadata !26, i32 448, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [actual_count] [line 448]
!196 = metadata !{i32 786443, metadata !25, metadata !194, i32 446, i32 0, i32 88} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!197 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_lseek", metadata !"__fd_lseek", metadata !"", i32 475, metadata !198, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @__fd_lseek, null, null, metadata !200, i32 475} ; [ DW_TAG_subprogram ] [line 475] [def] [__fd_lseek]
!198 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !199, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!199 = metadata !{metadata !112, metadata !29, metadata !112, metadata !29}
!200 = metadata !{metadata !201, metadata !202, metadata !203, metadata !204, metadata !205}
!201 = metadata !{i32 786689, metadata !197, metadata !"fd", metadata !26, i32 16777691, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 475]
!202 = metadata !{i32 786689, metadata !197, metadata !"offset", metadata !26, i32 33554907, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 475]
!203 = metadata !{i32 786689, metadata !197, metadata !"whence", metadata !26, i32 50332123, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [whence] [line 475]
!204 = metadata !{i32 786688, metadata !197, metadata !"new_off", metadata !26, i32 476, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_off] [line 476]
!205 = metadata !{i32 786688, metadata !197, metadata !"f", metadata !26, i32 477, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 477]
!206 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_stat", metadata !"__fd_stat", metadata !"", i32 532, metadata !207, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat64*)* @__fd_stat, null, null, metadata !209, i32 532} ; [ DW_TAG_subprogram ] [line 532] [def] [__fd_stat]
!207 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !208, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!208 = metadata !{metadata !29, metadata !30, metadata !46}
!209 = metadata !{metadata !210, metadata !211, metadata !212, metadata !213}
!210 = metadata !{i32 786689, metadata !206, metadata !"path", metadata !26, i32 16777748, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 532]
!211 = metadata !{i32 786689, metadata !206, metadata !"buf", metadata !26, i32 33554964, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 532]
!212 = metadata !{i32 786688, metadata !206, metadata !"dfile", metadata !26, i32 533, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 533]
!213 = metadata !{i32 786688, metadata !214, metadata !"r", metadata !26, i32 541, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 541]
!214 = metadata !{i32 786443, metadata !25, metadata !206, i32 539, i32 0, i32 114} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!215 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fstatat", metadata !"fstatat", metadata !"", i32 551, metadata !216, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*, i32)* @fstatat, null, null, metadata !238, i32 551} ; [ DW_TAG_subprogram ] [line 551] [def] [fstatat]
!216 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !217, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!217 = metadata !{metadata !29, metadata !29, metadata !30, metadata !218, metadata !29}
!218 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !219} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat]
!219 = metadata !{i32 786451, metadata !48, null, metadata !"stat", i32 46, i64 1152, i64 64, i32 0, i32 0, null, metadata !220, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat] [line 46, size 1152, align 64, offset 0] [def] [from ]
!220 = metadata !{metadata !221, metadata !222, metadata !224, metadata !225, metadata !226, metadata !227, metadata !228, metadata !229, metadata !230, metadata !231, metadata !232, metadata !234, metadata !235, metadata !236, metadata !237}
!221 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_dev", i32 48, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_member ] [st_dev] [line 48, size 64, align 64, offset 0] [from __dev_t]
!222 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_ino", i32 53, i64 64, i64 64, i64 64, i32 0, metadata !223} ; [ DW_TAG_member ] [st_ino] [line 53, size 64, align 64, offset 64] [from __ino_t]
!223 = metadata !{i32 786454, metadata !48, null, metadata !"__ino_t", i32 127, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__ino_t] [line 127, size 0, align 0, offset 0] [from long unsigned int]
!224 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_nlink", i32 61, i64 64, i64 64, i64 128, i32 0, metadata !56} ; [ DW_TAG_member ] [st_nlink] [line 61, size 64, align 64, offset 128] [from __nlink_t]
!225 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_mode", i32 62, i64 32, i64 32, i64 192, i32 0, metadata !58} ; [ DW_TAG_member ] [st_mode] [line 62, size 32, align 32, offset 192] [from __mode_t]
!226 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_uid", i32 64, i64 32, i64 32, i64 224, i32 0, metadata !60} ; [ DW_TAG_member ] [st_uid] [line 64, size 32, align 32, offset 224] [from __uid_t]
!227 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_gid", i32 65, i64 32, i64 32, i64 256, i32 0, metadata !62} ; [ DW_TAG_member ] [st_gid] [line 65, size 32, align 32, offset 256] [from __gid_t]
!228 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"__pad0", i32 67, i64 32, i64 32, i64 288, i32 0, metadata !29} ; [ DW_TAG_member ] [__pad0] [line 67, size 32, align 32, offset 288] [from int]
!229 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_rdev", i32 69, i64 64, i64 64, i64 320, i32 0, metadata !51} ; [ DW_TAG_member ] [st_rdev] [line 69, size 64, align 64, offset 320] [from __dev_t]
!230 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_size", i32 74, i64 64, i64 64, i64 384, i32 0, metadata !66} ; [ DW_TAG_member ] [st_size] [line 74, size 64, align 64, offset 384] [from __off_t]
!231 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_blksize", i32 78, i64 64, i64 64, i64 448, i32 0, metadata !69} ; [ DW_TAG_member ] [st_blksize] [line 78, size 64, align 64, offset 448] [from __blksize_t]
!232 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_blocks", i32 80, i64 64, i64 64, i64 512, i32 0, metadata !233} ; [ DW_TAG_member ] [st_blocks] [line 80, size 64, align 64, offset 512] [from __blkcnt_t]
!233 = metadata !{i32 786454, metadata !48, null, metadata !"__blkcnt_t", i32 158, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__blkcnt_t] [line 158, size 0, align 0, offset 0] [from long int]
!234 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_atim", i32 91, i64 128, i64 64, i64 576, i32 0, metadata !73} ; [ DW_TAG_member ] [st_atim] [line 91, size 128, align 64, offset 576] [from timespec]
!235 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_mtim", i32 92, i64 128, i64 64, i64 704, i32 0, metadata !73} ; [ DW_TAG_member ] [st_mtim] [line 92, size 128, align 64, offset 704] [from timespec]
!236 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_ctim", i32 93, i64 128, i64 64, i64 832, i32 0, metadata !73} ; [ DW_TAG_member ] [st_ctim] [line 93, size 128, align 64, offset 832] [from timespec]
!237 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"__glibc_reserved", i32 106, i64 192, i64 64, i64 960, i32 0, metadata !83} ; [ DW_TAG_member ] [__glibc_reserved] [line 106, size 192, align 64, offset 960] [from ]
!238 = metadata !{metadata !239, metadata !240, metadata !241, metadata !242, metadata !243, metadata !246, metadata !247}
!239 = metadata !{i32 786689, metadata !215, metadata !"fd", metadata !26, i32 16777767, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 551]
!240 = metadata !{i32 786689, metadata !215, metadata !"path", metadata !26, i32 33554983, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 551]
!241 = metadata !{i32 786689, metadata !215, metadata !"buf", metadata !26, i32 50332199, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 551]
!242 = metadata !{i32 786689, metadata !215, metadata !"flags", metadata !26, i32 67109415, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 551]
!243 = metadata !{i32 786688, metadata !244, metadata !"f", metadata !26, i32 553, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 553]
!244 = metadata !{i32 786443, metadata !25, metadata !245, i32 552, i32 0, i32 117} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!245 = metadata !{i32 786443, metadata !25, metadata !215, i32 552, i32 0, i32 116} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!246 = metadata !{i32 786688, metadata !215, metadata !"dfile", metadata !26, i32 565, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 565]
!247 = metadata !{i32 786688, metadata !215, metadata !"r", metadata !26, i32 572, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 572]
!248 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_lstat", metadata !"__fd_lstat", metadata !"", i32 587, metadata !207, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat64*)* @__fd_lstat, null, null, metadata !249, i32 587} ; [ DW_TAG_subprogram ] [line 587] [def] [__fd_lstat]
!249 = metadata !{metadata !250, metadata !251, metadata !252, metadata !253}
!250 = metadata !{i32 786689, metadata !248, metadata !"path", metadata !26, i32 16777803, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 587]
!251 = metadata !{i32 786689, metadata !248, metadata !"buf", metadata !26, i32 33555019, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 587]
!252 = metadata !{i32 786688, metadata !248, metadata !"dfile", metadata !26, i32 588, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 588]
!253 = metadata !{i32 786688, metadata !254, metadata !"r", metadata !26, i32 596, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 596]
!254 = metadata !{i32 786443, metadata !25, metadata !248, i32 594, i32 0, i32 127} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!255 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"chdir", metadata !"chdir", metadata !"", i32 606, metadata !256, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @chdir, null, null, metadata !258, i32 606} ; [ DW_TAG_subprogram ] [line 606] [def] [chdir]
!256 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !257, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!257 = metadata !{metadata !29, metadata !30}
!258 = metadata !{metadata !259, metadata !260, metadata !261}
!259 = metadata !{i32 786689, metadata !255, metadata !"path", metadata !26, i32 16777822, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 606]
!260 = metadata !{i32 786688, metadata !255, metadata !"dfile", metadata !26, i32 607, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 607]
!261 = metadata !{i32 786688, metadata !262, metadata !"r", metadata !26, i32 617, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 617]
!262 = metadata !{i32 786443, metadata !25, metadata !255, i32 616, i32 0, i32 131} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!263 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fchdir", metadata !"fchdir", metadata !"", i32 624, metadata !161, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fchdir, null, null, metadata !264, i32 624} ; [ DW_TAG_subprogram ] [line 624] [def] [fchdir]
!264 = metadata !{metadata !265, metadata !266, metadata !267}
!265 = metadata !{i32 786689, metadata !263, metadata !"fd", metadata !26, i32 16777840, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 624]
!266 = metadata !{i32 786688, metadata !263, metadata !"f", metadata !26, i32 625, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 625]
!267 = metadata !{i32 786688, metadata !268, metadata !"r", metadata !26, i32 637, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 637]
!268 = metadata !{i32 786443, metadata !25, metadata !269, i32 636, i32 0, i32 137} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!269 = metadata !{i32 786443, metadata !25, metadata !263, i32 632, i32 0, i32 135} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!270 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"chmod", metadata !"chmod", metadata !"", i32 658, metadata !271, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @chmod, null, null, metadata !273, i32 658} ; [ DW_TAG_subprogram ] [line 658] [def] [chmod]
!271 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !272, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!272 = metadata !{metadata !29, metadata !30, metadata !92}
!273 = metadata !{metadata !274, metadata !275, metadata !276, metadata !277}
!274 = metadata !{i32 786689, metadata !270, metadata !"path", metadata !26, i32 16777874, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 658]
!275 = metadata !{i32 786689, metadata !270, metadata !"mode", metadata !26, i32 33555090, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 658]
!276 = metadata !{i32 786688, metadata !270, metadata !"dfile", metadata !26, i32 661, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 661]
!277 = metadata !{i32 786688, metadata !278, metadata !"r", metadata !26, i32 673, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 673]
!278 = metadata !{i32 786443, metadata !25, metadata !279, i32 672, i32 0, i32 143} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!279 = metadata !{i32 786443, metadata !25, metadata !270, i32 670, i32 0, i32 141} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!280 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fchmod", metadata !"fchmod", metadata !"", i32 680, metadata !281, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @fchmod, null, null, metadata !283, i32 680} ; [ DW_TAG_subprogram ] [line 680] [def] [fchmod]
!281 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !282, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!282 = metadata !{metadata !29, metadata !29, metadata !92}
!283 = metadata !{metadata !284, metadata !285, metadata !286, metadata !287}
!284 = metadata !{i32 786689, metadata !280, metadata !"fd", metadata !26, i32 16777896, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 680]
!285 = metadata !{i32 786689, metadata !280, metadata !"mode", metadata !26, i32 33555112, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 680]
!286 = metadata !{i32 786688, metadata !280, metadata !"f", metadata !26, i32 683, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 683]
!287 = metadata !{i32 786688, metadata !288, metadata !"r", metadata !26, i32 700, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 700]
!288 = metadata !{i32 786443, metadata !25, metadata !289, i32 699, i32 0, i32 151} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!289 = metadata !{i32 786443, metadata !25, metadata !280, i32 697, i32 0, i32 149} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!290 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"chown", metadata !"chown", metadata !"", i32 713, metadata !291, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @chown, null, null, metadata !295, i32 713} ; [ DW_TAG_subprogram ] [line 713] [def] [chown]
!291 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !292, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!292 = metadata !{metadata !29, metadata !30, metadata !293, metadata !294}
!293 = metadata !{i32 786454, metadata !25, null, metadata !"uid_t", i32 80, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_typedef ] [uid_t] [line 80, size 0, align 0, offset 0] [from __uid_t]
!294 = metadata !{i32 786454, metadata !25, null, metadata !"gid_t", i32 65, i64 0, i64 0, i64 0, i32 0, metadata !62} ; [ DW_TAG_typedef ] [gid_t] [line 65, size 0, align 0, offset 0] [from __gid_t]
!295 = metadata !{metadata !296, metadata !297, metadata !298, metadata !299, metadata !300}
!296 = metadata !{i32 786689, metadata !290, metadata !"path", metadata !26, i32 16777929, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 713]
!297 = metadata !{i32 786689, metadata !290, metadata !"owner", metadata !26, i32 33555145, metadata !293, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 713]
!298 = metadata !{i32 786689, metadata !290, metadata !"group", metadata !26, i32 50332361, metadata !294, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 713]
!299 = metadata !{i32 786688, metadata !290, metadata !"df", metadata !26, i32 714, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 714]
!300 = metadata !{i32 786688, metadata !301, metadata !"r", metadata !26, i32 719, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 719]
!301 = metadata !{i32 786443, metadata !25, metadata !302, i32 718, i32 0, i32 155} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!302 = metadata !{i32 786443, metadata !25, metadata !290, i32 716, i32 0, i32 153} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!303 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fchown", metadata !"fchown", metadata !"", i32 726, metadata !304, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @fchown, null, null, metadata !306, i32 726} ; [ DW_TAG_subprogram ] [line 726] [def] [fchown]
!304 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !305, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!305 = metadata !{metadata !29, metadata !29, metadata !293, metadata !294}
!306 = metadata !{metadata !307, metadata !308, metadata !309, metadata !310, metadata !311}
!307 = metadata !{i32 786689, metadata !303, metadata !"fd", metadata !26, i32 16777942, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 726]
!308 = metadata !{i32 786689, metadata !303, metadata !"owner", metadata !26, i32 33555158, metadata !293, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 726]
!309 = metadata !{i32 786689, metadata !303, metadata !"group", metadata !26, i32 50332374, metadata !294, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 726]
!310 = metadata !{i32 786688, metadata !303, metadata !"f", metadata !26, i32 727, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 727]
!311 = metadata !{i32 786688, metadata !312, metadata !"r", metadata !26, i32 737, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 737]
!312 = metadata !{i32 786443, metadata !25, metadata !313, i32 736, i32 0, i32 161} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!313 = metadata !{i32 786443, metadata !25, metadata !303, i32 734, i32 0, i32 159} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!314 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"lchown", metadata !"lchown", metadata !"", i32 744, metadata !291, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @lchown, null, null, metadata !315, i32 744} ; [ DW_TAG_subprogram ] [line 744] [def] [lchown]
!315 = metadata !{metadata !316, metadata !317, metadata !318, metadata !319, metadata !320}
!316 = metadata !{i32 786689, metadata !314, metadata !"path", metadata !26, i32 16777960, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 744]
!317 = metadata !{i32 786689, metadata !314, metadata !"owner", metadata !26, i32 33555176, metadata !293, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 744]
!318 = metadata !{i32 786689, metadata !314, metadata !"group", metadata !26, i32 50332392, metadata !294, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 744]
!319 = metadata !{i32 786688, metadata !314, metadata !"df", metadata !26, i32 746, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 746]
!320 = metadata !{i32 786688, metadata !321, metadata !"r", metadata !26, i32 751, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 751]
!321 = metadata !{i32 786443, metadata !25, metadata !322, i32 750, i32 0, i32 165} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!322 = metadata !{i32 786443, metadata !25, metadata !314, i32 748, i32 0, i32 163} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!323 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_fstat", metadata !"__fd_fstat", metadata !"", i32 758, metadata !324, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat64*)* @__fd_fstat, null, null, metadata !326, i32 758} ; [ DW_TAG_subprogram ] [line 758] [def] [__fd_fstat]
!324 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !325, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!325 = metadata !{metadata !29, metadata !29, metadata !46}
!326 = metadata !{metadata !327, metadata !328, metadata !329, metadata !330}
!327 = metadata !{i32 786689, metadata !323, metadata !"fd", metadata !26, i32 16777974, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 758]
!328 = metadata !{i32 786689, metadata !323, metadata !"buf", metadata !26, i32 33555190, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 758]
!329 = metadata !{i32 786688, metadata !323, metadata !"f", metadata !26, i32 759, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 759]
!330 = metadata !{i32 786688, metadata !331, metadata !"r", metadata !26, i32 768, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 768]
!331 = metadata !{i32 786443, metadata !25, metadata !332, i32 766, i32 0, i32 170} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!332 = metadata !{i32 786443, metadata !25, metadata !323, i32 766, i32 0, i32 169} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!333 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_ftruncate", metadata !"__fd_ftruncate", metadata !"", i32 781, metadata !334, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @__fd_ftruncate, null, null, metadata !336, i32 781} ; [ DW_TAG_subprogram ] [line 781] [def] [__fd_ftruncate]
!334 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !335, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!335 = metadata !{metadata !29, metadata !29, metadata !112}
!336 = metadata !{metadata !337, metadata !338, metadata !339, metadata !340}
!337 = metadata !{i32 786689, metadata !333, metadata !"fd", metadata !26, i32 16777997, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 781]
!338 = metadata !{i32 786689, metadata !333, metadata !"length", metadata !26, i32 33555213, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 781]
!339 = metadata !{i32 786688, metadata !333, metadata !"f", metadata !26, i32 783, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 783]
!340 = metadata !{i32 786688, metadata !341, metadata !"r", metadata !26, i32 804, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 804]
!341 = metadata !{i32 786443, metadata !25, metadata !342, i32 802, i32 0, i32 178} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!342 = metadata !{i32 786443, metadata !25, metadata !333, i32 798, i32 0, i32 176} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!343 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_getdents", metadata !"__fd_getdents", metadata !"", i32 814, metadata !344, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.dirent64*, i32)* @__fd_getdents, null, null, metadata !360, i32 814} ; [ DW_TAG_subprogram ] [line 814] [def] [__fd_getdents]
!344 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !345, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!345 = metadata !{metadata !29, metadata !42, metadata !346, metadata !42}
!346 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !347} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dirent64]
!347 = metadata !{i32 786451, metadata !348, null, metadata !"dirent64", i32 37, i64 2240, i64 64, i32 0, i32 0, null, metadata !349, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [dirent64] [line 37, size 2240, align 64, offset 0] [def] [from ]
!348 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/dirent.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!349 = metadata !{metadata !350, metadata !351, metadata !352, metadata !354, metadata !356}
!350 = metadata !{i32 786445, metadata !348, metadata !347, metadata !"d_ino", i32 39, i64 64, i64 64, i64 0, i32 0, metadata !54} ; [ DW_TAG_member ] [d_ino] [line 39, size 64, align 64, offset 0] [from __ino64_t]
!351 = metadata !{i32 786445, metadata !348, metadata !347, metadata !"d_off", i32 40, i64 64, i64 64, i64 64, i32 0, metadata !113} ; [ DW_TAG_member ] [d_off] [line 40, size 64, align 64, offset 64] [from __off64_t]
!352 = metadata !{i32 786445, metadata !348, metadata !347, metadata !"d_reclen", i32 41, i64 16, i64 16, i64 128, i32 0, metadata !353} ; [ DW_TAG_member ] [d_reclen] [line 41, size 16, align 16, offset 128] [from unsigned short]
!353 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!354 = metadata !{i32 786445, metadata !348, metadata !347, metadata !"d_type", i32 42, i64 8, i64 8, i64 144, i32 0, metadata !355} ; [ DW_TAG_member ] [d_type] [line 42, size 8, align 8, offset 144] [from unsigned char]
!355 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!356 = metadata !{i32 786445, metadata !348, metadata !347, metadata !"d_name", i32 43, i64 2048, i64 8, i64 152, i32 0, metadata !357} ; [ DW_TAG_member ] [d_name] [line 43, size 2048, align 8, offset 152] [from ]
!357 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !32, metadata !358, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!358 = metadata !{metadata !359}
!359 = metadata !{i32 786465, i64 0, i64 256}     ; [ DW_TAG_subrange_type ] [0, 255]
!360 = metadata !{metadata !361, metadata !362, metadata !363, metadata !364, metadata !365, metadata !370, metadata !371, metadata !372, metadata !375, metadata !377, metadata !378, metadata !379, metadata !382}
!361 = metadata !{i32 786689, metadata !343, metadata !"fd", metadata !26, i32 16778030, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 814]
!362 = metadata !{i32 786689, metadata !343, metadata !"dirp", metadata !26, i32 33555246, metadata !346, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirp] [line 814]
!363 = metadata !{i32 786689, metadata !343, metadata !"count", metadata !26, i32 50332462, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 814]
!364 = metadata !{i32 786688, metadata !343, metadata !"f", metadata !26, i32 815, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 815]
!365 = metadata !{i32 786688, metadata !366, metadata !"i", metadata !26, i32 829, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 829]
!366 = metadata !{i32 786443, metadata !25, metadata !367, i32 827, i32 0, i32 186} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!367 = metadata !{i32 786443, metadata !25, metadata !368, i32 827, i32 0, i32 185} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!368 = metadata !{i32 786443, metadata !25, metadata !369, i32 826, i32 0, i32 184} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!369 = metadata !{i32 786443, metadata !25, metadata !343, i32 822, i32 0, i32 182} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!370 = metadata !{i32 786688, metadata !366, metadata !"pad", metadata !26, i32 829, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pad] [line 829]
!371 = metadata !{i32 786688, metadata !366, metadata !"bytes", metadata !26, i32 829, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bytes] [line 829]
!372 = metadata !{i32 786688, metadata !373, metadata !"df", metadata !26, i32 839, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 839]
!373 = metadata !{i32 786443, metadata !25, metadata !374, i32 838, i32 0, i32 190} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!374 = metadata !{i32 786443, metadata !25, metadata !366, i32 838, i32 0, i32 189} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!375 = metadata !{i32 786688, metadata !376, metadata !"os_pos", metadata !26, i32 862, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_pos] [line 862]
!376 = metadata !{i32 786443, metadata !25, metadata !367, i32 861, i32 0, i32 191} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!377 = metadata !{i32 786688, metadata !376, metadata !"res", metadata !26, i32 863, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 863]
!378 = metadata !{i32 786688, metadata !376, metadata !"s", metadata !26, i32 864, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 864]
!379 = metadata !{i32 786688, metadata !380, metadata !"pos", metadata !26, i32 880, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 880]
!380 = metadata !{i32 786443, metadata !25, metadata !381, i32 879, i32 0, i32 194} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!381 = metadata !{i32 786443, metadata !25, metadata !376, i32 877, i32 0, i32 192} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!382 = metadata !{i32 786688, metadata !383, metadata !"dp", metadata !26, i32 886, metadata !346, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dp] [line 886]
!383 = metadata !{i32 786443, metadata !25, metadata !380, i32 885, i32 0, i32 195} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!384 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"ioctl", metadata !"ioctl", metadata !"", i32 898, metadata !385, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64, ...)* @ioctl, null, null, metadata !387, i32 898} ; [ DW_TAG_subprogram ] [line 898] [def] [ioctl]
!385 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !386, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!386 = metadata !{metadata !29, metadata !29, metadata !52}
!387 = metadata !{metadata !388, metadata !389, metadata !390, metadata !391, metadata !405, metadata !406, metadata !409, metadata !430, metadata !440, metadata !443}
!388 = metadata !{i32 786689, metadata !384, metadata !"fd", metadata !26, i32 16778114, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 898]
!389 = metadata !{i32 786689, metadata !384, metadata !"request", metadata !26, i32 33555330, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [request] [line 898]
!390 = metadata !{i32 786688, metadata !384, metadata !"f", metadata !26, i32 902, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 902]
!391 = metadata !{i32 786688, metadata !384, metadata !"ap", metadata !26, i32 903, metadata !392, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 903]
!392 = metadata !{i32 786454, metadata !25, null, metadata !"va_list", i32 79, i64 0, i64 0, i64 0, i32 0, metadata !393} ; [ DW_TAG_typedef ] [va_list] [line 79, size 0, align 0, offset 0] [from __gnuc_va_list]
!393 = metadata !{i32 786454, metadata !25, null, metadata !"__gnuc_va_list", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !394} ; [ DW_TAG_typedef ] [__gnuc_va_list] [line 48, size 0, align 0, offset 0] [from __builtin_va_list]
!394 = metadata !{i32 786454, metadata !25, null, metadata !"__builtin_va_list", i32 903, i64 0, i64 0, i64 0, i32 0, metadata !395} ; [ DW_TAG_typedef ] [__builtin_va_list] [line 903, size 0, align 0, offset 0] [from ]
!395 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !396, metadata !403, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __va_list_tag]
!396 = metadata !{i32 786454, metadata !25, null, metadata !"__va_list_tag", i32 903, i64 0, i64 0, i64 0, i32 0, metadata !397} ; [ DW_TAG_typedef ] [__va_list_tag] [line 903, size 0, align 0, offset 0] [from __va_list_tag]
!397 = metadata !{i32 786451, metadata !1, null, metadata !"__va_list_tag", i32 903, i64 192, i64 64, i32 0, i32 0, null, metadata !398, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 903, size 192, align 64, offset 0] [def] [from ]
!398 = metadata !{metadata !399, metadata !400, metadata !401, metadata !402}
!399 = metadata !{i32 786445, metadata !1, metadata !397, metadata !"gp_offset", i32 903, i64 32, i64 32, i64 0, i32 0, metadata !42} ; [ DW_TAG_member ] [gp_offset] [line 903, size 32, align 32, offset 0] [from unsigned int]
!400 = metadata !{i32 786445, metadata !1, metadata !397, metadata !"fp_offset", i32 903, i64 32, i64 32, i64 32, i32 0, metadata !42} ; [ DW_TAG_member ] [fp_offset] [line 903, size 32, align 32, offset 32] [from unsigned int]
!401 = metadata !{i32 786445, metadata !1, metadata !397, metadata !"overflow_arg_area", i32 903, i64 64, i64 64, i64 64, i32 0, metadata !172} ; [ DW_TAG_member ] [overflow_arg_area] [line 903, size 64, align 64, offset 64] [from ]
!402 = metadata !{i32 786445, metadata !1, metadata !397, metadata !"reg_save_area", i32 903, i64 64, i64 64, i64 128, i32 0, metadata !172} ; [ DW_TAG_member ] [reg_save_area] [line 903, size 64, align 64, offset 128] [from ]
!403 = metadata !{metadata !404}
!404 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 0]
!405 = metadata !{i32 786688, metadata !384, metadata !"buf", metadata !26, i32 904, metadata !172, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 904]
!406 = metadata !{i32 786688, metadata !407, metadata !"stat", metadata !26, i32 920, metadata !218, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stat] [line 920]
!407 = metadata !{i32 786443, metadata !25, metadata !408, i32 919, i32 0, i32 199} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!408 = metadata !{i32 786443, metadata !25, metadata !384, i32 919, i32 0, i32 198} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!409 = metadata !{i32 786688, metadata !410, metadata !"ts", metadata !26, i32 924, metadata !412, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ts] [line 924]
!410 = metadata !{i32 786443, metadata !25, metadata !411, i32 923, i32 0, i32 201} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!411 = metadata !{i32 786443, metadata !25, metadata !407, i32 922, i32 0, i32 200} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!412 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !413} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from termios]
!413 = metadata !{i32 786451, metadata !414, null, metadata !"termios", i32 28, i64 480, i64 32, i32 0, i32 0, null, metadata !415, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [termios] [line 28, size 480, align 32, offset 0] [def] [from ]
!414 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/termios.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!415 = metadata !{metadata !416, metadata !418, metadata !419, metadata !420, metadata !421, metadata !423, metadata !427, metadata !429}
!416 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_iflag", i32 30, i64 32, i64 32, i64 0, i32 0, metadata !417} ; [ DW_TAG_member ] [c_iflag] [line 30, size 32, align 32, offset 0] [from tcflag_t]
!417 = metadata !{i32 786454, metadata !414, null, metadata !"tcflag_t", i32 25, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ] [tcflag_t] [line 25, size 0, align 0, offset 0] [from unsigned int]
!418 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_oflag", i32 31, i64 32, i64 32, i64 32, i32 0, metadata !417} ; [ DW_TAG_member ] [c_oflag] [line 31, size 32, align 32, offset 32] [from tcflag_t]
!419 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_cflag", i32 32, i64 32, i64 32, i64 64, i32 0, metadata !417} ; [ DW_TAG_member ] [c_cflag] [line 32, size 32, align 32, offset 64] [from tcflag_t]
!420 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_lflag", i32 33, i64 32, i64 32, i64 96, i32 0, metadata !417} ; [ DW_TAG_member ] [c_lflag] [line 33, size 32, align 32, offset 96] [from tcflag_t]
!421 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_line", i32 34, i64 8, i64 8, i64 128, i32 0, metadata !422} ; [ DW_TAG_member ] [c_line] [line 34, size 8, align 8, offset 128] [from cc_t]
!422 = metadata !{i32 786454, metadata !414, null, metadata !"cc_t", i32 23, i64 0, i64 0, i64 0, i32 0, metadata !355} ; [ DW_TAG_typedef ] [cc_t] [line 23, size 0, align 0, offset 0] [from unsigned char]
!423 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_cc", i32 35, i64 256, i64 8, i64 136, i32 0, metadata !424} ; [ DW_TAG_member ] [c_cc] [line 35, size 256, align 8, offset 136] [from ]
!424 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 8, i32 0, i32 0, metadata !422, metadata !425, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 8, offset 0] [from cc_t]
!425 = metadata !{metadata !426}
!426 = metadata !{i32 786465, i64 0, i64 32}      ; [ DW_TAG_subrange_type ] [0, 31]
!427 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_ispeed", i32 36, i64 32, i64 32, i64 416, i32 0, metadata !428} ; [ DW_TAG_member ] [c_ispeed] [line 36, size 32, align 32, offset 416] [from speed_t]
!428 = metadata !{i32 786454, metadata !414, null, metadata !"speed_t", i32 24, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ] [speed_t] [line 24, size 0, align 0, offset 0] [from unsigned int]
!429 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_ospeed", i32 37, i64 32, i64 32, i64 448, i32 0, metadata !428} ; [ DW_TAG_member ] [c_ospeed] [line 37, size 32, align 32, offset 448] [from speed_t]
!430 = metadata !{i32 786688, metadata !431, metadata !"ws", metadata !26, i32 993, metadata !432, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ws] [line 993]
!431 = metadata !{i32 786443, metadata !25, metadata !411, i32 992, i32 0, i32 217} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!432 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !433} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from winsize]
!433 = metadata !{i32 786451, metadata !434, null, metadata !"winsize", i32 27, i64 64, i64 16, i32 0, i32 0, null, metadata !435, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [winsize] [line 27, size 64, align 16, offset 0] [def] [from ]
!434 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/ioctl-types.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!435 = metadata !{metadata !436, metadata !437, metadata !438, metadata !439}
!436 = metadata !{i32 786445, metadata !434, metadata !433, metadata !"ws_row", i32 29, i64 16, i64 16, i64 0, i32 0, metadata !353} ; [ DW_TAG_member ] [ws_row] [line 29, size 16, align 16, offset 0] [from unsigned short]
!437 = metadata !{i32 786445, metadata !434, metadata !433, metadata !"ws_col", i32 30, i64 16, i64 16, i64 16, i32 0, metadata !353} ; [ DW_TAG_member ] [ws_col] [line 30, size 16, align 16, offset 16] [from unsigned short]
!438 = metadata !{i32 786445, metadata !434, metadata !433, metadata !"ws_xpixel", i32 31, i64 16, i64 16, i64 32, i32 0, metadata !353} ; [ DW_TAG_member ] [ws_xpixel] [line 31, size 16, align 16, offset 32] [from unsigned short]
!439 = metadata !{i32 786445, metadata !434, metadata !433, metadata !"ws_ypixel", i32 32, i64 16, i64 16, i64 48, i32 0, metadata !353} ; [ DW_TAG_member ] [ws_ypixel] [line 32, size 16, align 16, offset 48] [from unsigned short]
!440 = metadata !{i32 786688, metadata !441, metadata !"res", metadata !26, i32 1016, metadata !442, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 1016]
!441 = metadata !{i32 786443, metadata !25, metadata !411, i32 1015, i32 0, i32 225} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!442 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!443 = metadata !{i32 786688, metadata !444, metadata !"r", metadata !26, i32 1041, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1041]
!444 = metadata !{i32 786443, metadata !25, metadata !408, i32 1040, i32 0, i32 233} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!445 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fcntl", metadata !"fcntl", metadata !"", i32 1048, metadata !446, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, ...)* @fcntl, null, null, metadata !448, i32 1048} ; [ DW_TAG_subprogram ] [line 1048] [def] [fcntl]
!446 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !447, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!447 = metadata !{metadata !29, metadata !29, metadata !29}
!448 = metadata !{metadata !449, metadata !450, metadata !451, metadata !452, metadata !453, metadata !454, metadata !459}
!449 = metadata !{i32 786689, metadata !445, metadata !"fd", metadata !26, i32 16778264, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 1048]
!450 = metadata !{i32 786689, metadata !445, metadata !"cmd", metadata !26, i32 33555480, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cmd] [line 1048]
!451 = metadata !{i32 786688, metadata !445, metadata !"f", metadata !26, i32 1049, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1049]
!452 = metadata !{i32 786688, metadata !445, metadata !"ap", metadata !26, i32 1050, metadata !392, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 1050]
!453 = metadata !{i32 786688, metadata !445, metadata !"arg", metadata !26, i32 1051, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [arg] [line 1051]
!454 = metadata !{i32 786688, metadata !455, metadata !"flags", metadata !26, i32 1070, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flags] [line 1070]
!455 = metadata !{i32 786443, metadata !25, metadata !456, i32 1069, i32 0, i32 243} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!456 = metadata !{i32 786443, metadata !25, metadata !457, i32 1068, i32 0, i32 242} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!457 = metadata !{i32 786443, metadata !25, metadata !458, i32 1067, i32 0, i32 241} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!458 = metadata !{i32 786443, metadata !25, metadata !445, i32 1067, i32 0, i32 240} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!459 = metadata !{i32 786688, metadata !460, metadata !"r", metadata !26, i32 1096, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1096]
!460 = metadata !{i32 786443, metadata !25, metadata !458, i32 1095, i32 0, i32 248} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!461 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_statfs", metadata !"__fd_statfs", metadata !"", i32 1103, metadata !462, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @__fd_statfs, null, null, metadata !494, i32 1103} ; [ DW_TAG_subprogram ] [line 1103] [def] [__fd_statfs]
!462 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !463, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!463 = metadata !{metadata !29, metadata !30, metadata !464}
!464 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !465} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from statfs]
!465 = metadata !{i32 786451, metadata !466, null, metadata !"statfs", i32 24, i64 960, i64 64, i32 0, i32 0, null, metadata !467, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [statfs] [line 24, size 960, align 64, offset 0] [def] [from ]
!466 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/statfs.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!467 = metadata !{metadata !468, metadata !470, metadata !471, metadata !473, metadata !474, metadata !475, metadata !477, metadata !478, metadata !487, metadata !488, metadata !489, metadata !490}
!468 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_type", i32 26, i64 64, i64 64, i64 0, i32 0, metadata !469} ; [ DW_TAG_member ] [f_type] [line 26, size 64, align 64, offset 0] [from __fsword_t]
!469 = metadata !{i32 786454, metadata !466, null, metadata !"__fsword_t", i32 170, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__fsword_t] [line 170, size 0, align 0, offset 0] [from long int]
!470 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_bsize", i32 27, i64 64, i64 64, i64 64, i32 0, metadata !469} ; [ DW_TAG_member ] [f_bsize] [line 27, size 64, align 64, offset 64] [from __fsword_t]
!471 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_blocks", i32 29, i64 64, i64 64, i64 128, i32 0, metadata !472} ; [ DW_TAG_member ] [f_blocks] [line 29, size 64, align 64, offset 128] [from __fsblkcnt_t]
!472 = metadata !{i32 786454, metadata !466, null, metadata !"__fsblkcnt_t", i32 162, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__fsblkcnt_t] [line 162, size 0, align 0, offset 0] [from long unsigned int]
!473 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_bfree", i32 30, i64 64, i64 64, i64 192, i32 0, metadata !472} ; [ DW_TAG_member ] [f_bfree] [line 30, size 64, align 64, offset 192] [from __fsblkcnt_t]
!474 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_bavail", i32 31, i64 64, i64 64, i64 256, i32 0, metadata !472} ; [ DW_TAG_member ] [f_bavail] [line 31, size 64, align 64, offset 256] [from __fsblkcnt_t]
!475 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_files", i32 32, i64 64, i64 64, i64 320, i32 0, metadata !476} ; [ DW_TAG_member ] [f_files] [line 32, size 64, align 64, offset 320] [from __fsfilcnt_t]
!476 = metadata !{i32 786454, metadata !466, null, metadata !"__fsfilcnt_t", i32 166, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__fsfilcnt_t] [line 166, size 0, align 0, offset 0] [from long unsigned int]
!477 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_ffree", i32 33, i64 64, i64 64, i64 384, i32 0, metadata !476} ; [ DW_TAG_member ] [f_ffree] [line 33, size 64, align 64, offset 384] [from __fsfilcnt_t]
!478 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_fsid", i32 41, i64 64, i64 32, i64 448, i32 0, metadata !479} ; [ DW_TAG_member ] [f_fsid] [line 41, size 64, align 32, offset 448] [from __fsid_t]
!479 = metadata !{i32 786454, metadata !466, null, metadata !"__fsid_t", i32 134, i64 0, i64 0, i64 0, i32 0, metadata !480} ; [ DW_TAG_typedef ] [__fsid_t] [line 134, size 0, align 0, offset 0] [from ]
!480 = metadata !{i32 786451, metadata !481, null, metadata !"", i32 134, i64 64, i64 32, i32 0, i32 0, null, metadata !482, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 134, size 64, align 32, offset 0] [def] [from ]
!481 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!482 = metadata !{metadata !483}
!483 = metadata !{i32 786445, metadata !481, metadata !480, metadata !"__val", i32 134, i64 64, i64 32, i64 0, i32 0, metadata !484} ; [ DW_TAG_member ] [__val] [line 134, size 64, align 32, offset 0] [from ]
!484 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 64, i64 32, i32 0, i32 0, metadata !29, metadata !485, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!485 = metadata !{metadata !486}
!486 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 1]
!487 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_namelen", i32 42, i64 64, i64 64, i64 512, i32 0, metadata !469} ; [ DW_TAG_member ] [f_namelen] [line 42, size 64, align 64, offset 512] [from __fsword_t]
!488 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_frsize", i32 43, i64 64, i64 64, i64 576, i32 0, metadata !469} ; [ DW_TAG_member ] [f_frsize] [line 43, size 64, align 64, offset 576] [from __fsword_t]
!489 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_flags", i32 44, i64 64, i64 64, i64 640, i32 0, metadata !469} ; [ DW_TAG_member ] [f_flags] [line 44, size 64, align 64, offset 640] [from __fsword_t]
!490 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_spare", i32 45, i64 256, i64 64, i64 704, i32 0, metadata !491} ; [ DW_TAG_member ] [f_spare] [line 45, size 256, align 64, offset 704] [from ]
!491 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 64, i32 0, i32 0, metadata !469, metadata !492, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from __fsword_t]
!492 = metadata !{metadata !493}
!493 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!494 = metadata !{metadata !495, metadata !496, metadata !497, metadata !498}
!495 = metadata !{i32 786689, metadata !461, metadata !"path", metadata !26, i32 16778319, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 1103]
!496 = metadata !{i32 786689, metadata !461, metadata !"buf", metadata !26, i32 33555535, metadata !464, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1103]
!497 = metadata !{i32 786688, metadata !461, metadata !"dfile", metadata !26, i32 1104, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1104]
!498 = metadata !{i32 786688, metadata !499, metadata !"r", metadata !26, i32 1113, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1113]
!499 = metadata !{i32 786443, metadata !25, metadata !461, i32 1112, i32 0, i32 252} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!500 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fstatfs", metadata !"fstatfs", metadata !"", i32 1120, metadata !501, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.statfs*)* @fstatfs, null, null, metadata !503, i32 1120} ; [ DW_TAG_subprogram ] [line 1120] [def] [fstatfs]
!501 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !502, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!502 = metadata !{metadata !29, metadata !29, metadata !464}
!503 = metadata !{metadata !504, metadata !505, metadata !506, metadata !507}
!504 = metadata !{i32 786689, metadata !500, metadata !"fd", metadata !26, i32 16778336, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 1120]
!505 = metadata !{i32 786689, metadata !500, metadata !"buf", metadata !26, i32 33555552, metadata !464, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1120]
!506 = metadata !{i32 786688, metadata !500, metadata !"f", metadata !26, i32 1121, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1121]
!507 = metadata !{i32 786688, metadata !508, metadata !"r", metadata !26, i32 1133, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1133]
!508 = metadata !{i32 786443, metadata !25, metadata !509, i32 1132, i32 0, i32 258} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!509 = metadata !{i32 786443, metadata !25, metadata !500, i32 1128, i32 0, i32 256} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!510 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fsync", metadata !"fsync", metadata !"", i32 1140, metadata !161, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fsync, null, null, metadata !511, i32 1140} ; [ DW_TAG_subprogram ] [line 1140] [def] [fsync]
!511 = metadata !{metadata !512, metadata !513, metadata !514}
!512 = metadata !{i32 786689, metadata !510, metadata !"fd", metadata !26, i32 16778356, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 1140]
!513 = metadata !{i32 786688, metadata !510, metadata !"f", metadata !26, i32 1141, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1141]
!514 = metadata !{i32 786688, metadata !515, metadata !"r", metadata !26, i32 1149, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1149]
!515 = metadata !{i32 786443, metadata !25, metadata !516, i32 1148, i32 0, i32 264} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!516 = metadata !{i32 786443, metadata !25, metadata !517, i32 1146, i32 0, i32 262} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!517 = metadata !{i32 786443, metadata !25, metadata !510, i32 1143, i32 0, i32 260} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!518 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"dup2", metadata !"dup2", metadata !"", i32 1156, metadata !446, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @dup2, null, null, metadata !519, i32 1156} ; [ DW_TAG_subprogram ] [line 1156] [def] [dup2]
!519 = metadata !{metadata !520, metadata !521, metadata !522, metadata !523}
!520 = metadata !{i32 786689, metadata !518, metadata !"oldfd", metadata !26, i32 16778372, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldfd] [line 1156]
!521 = metadata !{i32 786689, metadata !518, metadata !"newfd", metadata !26, i32 33555588, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [newfd] [line 1156]
!522 = metadata !{i32 786688, metadata !518, metadata !"f", metadata !26, i32 1157, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1157]
!523 = metadata !{i32 786688, metadata !524, metadata !"f2", metadata !26, i32 1163, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f2] [line 1163]
!524 = metadata !{i32 786443, metadata !25, metadata !525, i32 1162, i32 0, i32 268} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!525 = metadata !{i32 786443, metadata !25, metadata !518, i32 1159, i32 0, i32 266} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!526 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"dup", metadata !"dup", metadata !"", i32 1181, metadata !161, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @dup, null, null, metadata !527, i32 1181} ; [ DW_TAG_subprogram ] [line 1181] [def] [dup]
!527 = metadata !{metadata !528, metadata !529, metadata !530}
!528 = metadata !{i32 786689, metadata !526, metadata !"oldfd", metadata !26, i32 16778397, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldfd] [line 1181]
!529 = metadata !{i32 786688, metadata !526, metadata !"f", metadata !26, i32 1182, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1182]
!530 = metadata !{i32 786688, metadata !531, metadata !"fd", metadata !26, i32 1187, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd] [line 1187]
!531 = metadata !{i32 786443, metadata !25, metadata !532, i32 1186, i32 0, i32 272} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!532 = metadata !{i32 786443, metadata !25, metadata !526, i32 1183, i32 0, i32 270} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!533 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"rmdir", metadata !"rmdir", metadata !"", i32 1200, metadata !256, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @rmdir, null, null, metadata !534, i32 1200} ; [ DW_TAG_subprogram ] [line 1200] [def] [rmdir]
!534 = metadata !{metadata !535, metadata !536}
!535 = metadata !{i32 786689, metadata !533, metadata !"pathname", metadata !26, i32 16778416, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 1200]
!536 = metadata !{i32 786688, metadata !533, metadata !"dfile", metadata !26, i32 1201, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1201]
!537 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"unlink", metadata !"unlink", metadata !"", i32 1218, metadata !256, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @unlink, null, null, metadata !538, i32 1218} ; [ DW_TAG_subprogram ] [line 1218] [def] [unlink]
!538 = metadata !{metadata !539, metadata !540}
!539 = metadata !{i32 786689, metadata !537, metadata !"pathname", metadata !26, i32 16778434, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 1218]
!540 = metadata !{i32 786688, metadata !537, metadata !"dfile", metadata !26, i32 1219, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1219]
!541 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"unlinkat", metadata !"unlinkat", metadata !"", i32 1239, metadata !542, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32)* @unlinkat, null, null, metadata !544, i32 1239} ; [ DW_TAG_subprogram ] [line 1239] [def] [unlinkat]
!542 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !543, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!543 = metadata !{metadata !29, metadata !29, metadata !30, metadata !29}
!544 = metadata !{metadata !545, metadata !546, metadata !547, metadata !548}
!545 = metadata !{i32 786689, metadata !541, metadata !"dirfd", metadata !26, i32 16778455, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirfd] [line 1239]
!546 = metadata !{i32 786689, metadata !541, metadata !"pathname", metadata !26, i32 33555671, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 1239]
!547 = metadata !{i32 786689, metadata !541, metadata !"flags", metadata !26, i32 50332887, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 1239]
!548 = metadata !{i32 786688, metadata !541, metadata !"dfile", metadata !26, i32 1242, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1242]
!549 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"readlink", metadata !"readlink", metadata !"", i32 1262, metadata !550, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i8*, i8*, i64)* @readlink, null, null, metadata !552, i32 1262} ; [ DW_TAG_subprogram ] [line 1262] [def] [readlink]
!550 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !551, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!551 = metadata !{metadata !170, metadata !30, metadata !44, metadata !173}
!552 = metadata !{metadata !553, metadata !554, metadata !555, metadata !556, metadata !557}
!553 = metadata !{i32 786689, metadata !549, metadata !"path", metadata !26, i32 16778478, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 1262]
!554 = metadata !{i32 786689, metadata !549, metadata !"buf", metadata !26, i32 33555694, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1262]
!555 = metadata !{i32 786689, metadata !549, metadata !"bufsize", metadata !26, i32 50332910, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bufsize] [line 1262]
!556 = metadata !{i32 786688, metadata !549, metadata !"dfile", metadata !26, i32 1263, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1263]
!557 = metadata !{i32 786688, metadata !558, metadata !"r", metadata !26, i32 1279, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1279]
!558 = metadata !{i32 786443, metadata !25, metadata !559, i32 1278, i32 0, i32 306} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!559 = metadata !{i32 786443, metadata !25, metadata !549, i32 1264, i32 0, i32 297} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!560 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"select", metadata !"select", metadata !"", i32 1294, metadata !561, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timeval*)* @select, null, null, metadata !574, i32 1295} ; [ DW_TAG_subprogram ] [line 1294] [def] [scope 1295] [select]
!561 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !562, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!562 = metadata !{metadata !29, metadata !29, metadata !563, metadata !563, metadata !563, metadata !573}
!563 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !564} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from fd_set]
!564 = metadata !{i32 786454, metadata !25, null, metadata !"fd_set", i32 75, i64 0, i64 0, i64 0, i32 0, metadata !565} ; [ DW_TAG_typedef ] [fd_set] [line 75, size 0, align 0, offset 0] [from ]
!565 = metadata !{i32 786451, metadata !566, null, metadata !"", i32 64, i64 1024, i64 64, i32 0, i32 0, null, metadata !567, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 64, size 1024, align 64, offset 0] [def] [from ]
!566 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/sys/select.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!567 = metadata !{metadata !568}
!568 = metadata !{i32 786445, metadata !566, metadata !565, metadata !"fds_bits", i32 69, i64 1024, i64 64, i64 0, i32 0, metadata !569} ; [ DW_TAG_member ] [fds_bits] [line 69, size 1024, align 64, offset 0] [from ]
!569 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1024, i64 64, i32 0, i32 0, metadata !570, metadata !571, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 64, offset 0] [from __fd_mask]
!570 = metadata !{i32 786454, metadata !566, null, metadata !"__fd_mask", i32 54, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__fd_mask] [line 54, size 0, align 0, offset 0] [from long int]
!571 = metadata !{metadata !572}
!572 = metadata !{i32 786465, i64 0, i64 16}      ; [ DW_TAG_subrange_type ] [0, 15]
!573 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !138} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from timeval]
!574 = metadata !{metadata !575, metadata !576, metadata !577, metadata !578, metadata !579, metadata !580, metadata !581, metadata !582, metadata !583, metadata !584, metadata !585, metadata !586, metadata !587, metadata !588, metadata !589, metadata !594, metadata !597, metadata !598}
!575 = metadata !{i32 786689, metadata !560, metadata !"nfds", metadata !26, i32 16778510, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nfds] [line 1294]
!576 = metadata !{i32 786689, metadata !560, metadata !"read", metadata !26, i32 33555726, metadata !563, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [read] [line 1294]
!577 = metadata !{i32 786689, metadata !560, metadata !"write", metadata !26, i32 50332942, metadata !563, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [write] [line 1294]
!578 = metadata !{i32 786689, metadata !560, metadata !"except", metadata !26, i32 67110159, metadata !563, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [except] [line 1295]
!579 = metadata !{i32 786689, metadata !560, metadata !"timeout", metadata !26, i32 83887375, metadata !573, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [timeout] [line 1295]
!580 = metadata !{i32 786688, metadata !560, metadata !"in_read", metadata !26, i32 1296, metadata !564, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [in_read] [line 1296]
!581 = metadata !{i32 786688, metadata !560, metadata !"in_write", metadata !26, i32 1296, metadata !564, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [in_write] [line 1296]
!582 = metadata !{i32 786688, metadata !560, metadata !"in_except", metadata !26, i32 1296, metadata !564, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [in_except] [line 1296]
!583 = metadata !{i32 786688, metadata !560, metadata !"os_read", metadata !26, i32 1296, metadata !564, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_read] [line 1296]
!584 = metadata !{i32 786688, metadata !560, metadata !"os_write", metadata !26, i32 1296, metadata !564, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_write] [line 1296]
!585 = metadata !{i32 786688, metadata !560, metadata !"os_except", metadata !26, i32 1296, metadata !564, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_except] [line 1296]
!586 = metadata !{i32 786688, metadata !560, metadata !"i", metadata !26, i32 1297, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 1297]
!587 = metadata !{i32 786688, metadata !560, metadata !"count", metadata !26, i32 1297, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 1297]
!588 = metadata !{i32 786688, metadata !560, metadata !"os_nfds", metadata !26, i32 1297, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_nfds] [line 1297]
!589 = metadata !{i32 786688, metadata !590, metadata !"f", metadata !26, i32 1327, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1327]
!590 = metadata !{i32 786443, metadata !25, metadata !591, i32 1326, i32 0, i32 320} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!591 = metadata !{i32 786443, metadata !25, metadata !592, i32 1326, i32 0, i32 319} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!592 = metadata !{i32 786443, metadata !25, metadata !593, i32 1325, i32 0, i32 318} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!593 = metadata !{i32 786443, metadata !25, metadata !560, i32 1325, i32 0, i32 317} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!594 = metadata !{i32 786688, metadata !595, metadata !"tv", metadata !26, i32 1349, metadata !138, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tv] [line 1349]
!595 = metadata !{i32 786443, metadata !25, metadata !596, i32 1346, i32 0, i32 334} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!596 = metadata !{i32 786443, metadata !25, metadata !560, i32 1346, i32 0, i32 333} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!597 = metadata !{i32 786688, metadata !595, metadata !"r", metadata !26, i32 1350, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1350]
!598 = metadata !{i32 786688, metadata !599, metadata !"f", metadata !26, i32 1365, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1365]
!599 = metadata !{i32 786443, metadata !25, metadata !600, i32 1364, i32 0, i32 341} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!600 = metadata !{i32 786443, metadata !25, metadata !601, i32 1364, i32 0, i32 340} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!601 = metadata !{i32 786443, metadata !25, metadata !602, i32 1360, i32 0, i32 339} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!602 = metadata !{i32 786443, metadata !25, metadata !595, i32 1353, i32 0, i32 335} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!603 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"getcwd", metadata !"getcwd", metadata !"", i32 1380, metadata !604, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i64)* @getcwd, null, null, metadata !606, i32 1380} ; [ DW_TAG_subprogram ] [line 1380] [def] [getcwd]
!604 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !605, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!605 = metadata !{metadata !44, metadata !44, metadata !173}
!606 = metadata !{metadata !607, metadata !608, metadata !609}
!607 = metadata !{i32 786689, metadata !603, metadata !"buf", metadata !26, i32 16778596, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1380]
!608 = metadata !{i32 786689, metadata !603, metadata !"size", metadata !26, i32 33555812, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 1380]
!609 = metadata !{i32 786688, metadata !603, metadata !"r", metadata !26, i32 1382, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1382]
!610 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"chroot", metadata !"chroot", metadata !"", i32 1457, metadata !256, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @chroot, null, null, metadata !611, i32 1457} ; [ DW_TAG_subprogram ] [line 1457] [def] [chroot]
!611 = metadata !{metadata !612}
!612 = metadata !{i32 786689, metadata !610, metadata !"path", metadata !26, i32 16778673, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 1457]
!613 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__concretize_string", metadata !"__concretize_string", metadata !"", i32 1428, metadata !614, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !616, i32 1428} ; [ DW_TAG_subprogram ] [line 1428] [local] [def] [__concretize_string]
!614 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !615, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!615 = metadata !{metadata !30, metadata !30}
!616 = metadata !{metadata !617, metadata !618, metadata !619, metadata !620, metadata !623}
!617 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!618 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!619 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!620 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!621 = metadata !{i32 786443, metadata !25, metadata !622, i32 1432, i32 0, i32 359} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!622 = metadata !{i32 786443, metadata !25, metadata !613, i32 1432, i32 0, i32 358} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!623 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!624 = metadata !{i32 786443, metadata !25, metadata !625, i32 1441, i32 0, i32 366} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!625 = metadata !{i32 786443, metadata !25, metadata !621, i32 1434, i32 0, i32 360} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!626 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__concretize_size", metadata !"__concretize_size", metadata !"", i32 1422, metadata !627, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !629, i32 1422} ; [ DW_TAG_subprogram ] [line 1422] [local] [def] [__concretize_size]
!627 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !628, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!628 = metadata !{metadata !173, metadata !173}
!629 = metadata !{metadata !630, metadata !631}
!630 = metadata !{i32 786689, metadata !626, metadata !"s", metadata !26, i32 16778638, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!631 = metadata !{i32 786688, metadata !626, metadata !"sc", metadata !26, i32 1423, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!632 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__concretize_ptr", metadata !"__concretize_ptr", metadata !"", i32 1415, metadata !633, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !635, i32 1415} ; [ DW_TAG_subprogram ] [line 1415] [local] [def] [__concretize_ptr]
!633 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !634, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!634 = metadata !{metadata !172, metadata !185}
!635 = metadata !{metadata !636, metadata !637}
!636 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!637 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!638 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__df_chown", metadata !"__df_chown", metadata !"", i32 707, metadata !639, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !641, i32 707} ; [ DW_TAG_subprogram ] [line 707] [local] [def] [__df_chown]
!639 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !640, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!640 = metadata !{metadata !29, metadata !37, metadata !293, metadata !294}
!641 = metadata !{metadata !642, metadata !643, metadata !644}
!642 = metadata !{i32 786689, metadata !638, metadata !"df", metadata !26, i32 16777923, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [df] [line 707]
!643 = metadata !{i32 786689, metadata !638, metadata !"owner", metadata !26, i32 33555139, metadata !293, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!644 = metadata !{i32 786689, metadata !638, metadata !"group", metadata !26, i32 50332355, metadata !294, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 707]
!645 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__df_chmod", metadata !"__df_chmod", metadata !"", i32 645, metadata !646, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !648, i32 645} ; [ DW_TAG_subprogram ] [line 645] [local] [def] [__df_chmod]
!646 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !647, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!647 = metadata !{metadata !29, metadata !37, metadata !92}
!648 = metadata !{metadata !649, metadata !650}
!649 = metadata !{i32 786689, metadata !645, metadata !"df", metadata !26, i32 16777861, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [df] [line 645]
!650 = metadata !{i32 786689, metadata !645, metadata !"mode", metadata !26, i32 33555077, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 645]
!651 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__get_file", metadata !"__get_file", metadata !"", i32 63, metadata !652, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !654, i32 63} ; [ DW_TAG_subprogram ] [line 63] [local] [def] [__get_file]
!652 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !653, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!653 = metadata !{metadata !105, metadata !29}
!654 = metadata !{metadata !655, metadata !656}
!655 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!656 = metadata !{i32 786688, metadata !657, metadata !"f", metadata !26, i32 65, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 65]
!657 = metadata !{i32 786443, metadata !25, metadata !658, i32 64, i32 0, i32 373} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!658 = metadata !{i32 786443, metadata !25, metadata !651, i32 64, i32 0, i32 372} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!659 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"has_permission", metadata !"has_permission", metadata !"", i32 97, metadata !324, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !660, i32 97} ; [ DW_TAG_subprogram ] [line 97] [local] [def] [has_permission]
!660 = metadata !{metadata !661, metadata !662, metadata !663, metadata !664, metadata !665}
!661 = metadata !{i32 786689, metadata !659, metadata !"flags", metadata !26, i32 16777313, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 97]
!662 = metadata !{i32 786689, metadata !659, metadata !"s", metadata !26, i32 33554529, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 97]
!663 = metadata !{i32 786688, metadata !659, metadata !"write_access", metadata !26, i32 98, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [write_access] [line 98]
!664 = metadata !{i32 786688, metadata !659, metadata !"read_access", metadata !26, i32 98, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [read_access] [line 98]
!665 = metadata !{i32 786688, metadata !659, metadata !"mode", metadata !26, i32 99, metadata !92, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 99]
!666 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__get_sym_file", metadata !"__get_sym_file", metadata !"", i32 39, metadata !667, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !669, i32 39} ; [ DW_TAG_subprogram ] [line 39] [local] [def] [__get_sym_file]
!667 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !668, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!668 = metadata !{metadata !37, metadata !30}
!669 = metadata !{metadata !670, metadata !671, metadata !672, metadata !673}
!670 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!671 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 40]
!672 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 41]
!673 = metadata !{i32 786688, metadata !674, metadata !"df", metadata !26, i32 48, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 48]
!674 = metadata !{i32 786443, metadata !25, metadata !675, i32 47, i32 0, i32 383} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!675 = metadata !{i32 786443, metadata !25, metadata !676, i32 47, i32 0, i32 382} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!676 = metadata !{i32 786443, metadata !25, metadata !677, i32 46, i32 0, i32 381} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!677 = metadata !{i32 786443, metadata !25, metadata !666, i32 46, i32 0, i32 380} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!678 = metadata !{metadata !679, metadata !680, metadata !681, metadata !682, metadata !683, metadata !684, metadata !685}
!679 = metadata !{i32 786484, i32 0, metadata !160, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 304, metadata !29, i32 1, i32 1, i32* @close.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 304] [local] [def]
!680 = metadata !{i32 786484, i32 0, metadata !167, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 336, metadata !29, i32 1, i32 1, i32* @read.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 336] [local] [def]
!681 = metadata !{i32 786484, i32 0, metadata !182, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 404, metadata !29, i32 1, i32 1, i32* @write.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 404] [local] [def]
!682 = metadata !{i32 786484, i32 0, metadata !270, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 659, metadata !29, i32 1, i32 1, i32* @chmod.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 659] [local] [def]
!683 = metadata !{i32 786484, i32 0, metadata !280, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 681, metadata !29, i32 1, i32 1, i32* @fchmod.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 681] [local] [def]
!684 = metadata !{i32 786484, i32 0, metadata !333, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 782, metadata !29, i32 1, i32 1, i32* @__fd_ftruncate.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 782] [local] [def]
!685 = metadata !{i32 786484, i32 0, metadata !603, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 1381, metadata !29, i32 1, i32 1, i32* @getcwd.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 1381] [local] [def]
!686 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!687 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!688 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!689 = metadata !{i32 73, i32 0, metadata !24, null}
!690 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !691} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!691 = metadata !{i32 74, i32 0, metadata !24, null}
!692 = metadata !{i32 39, i32 0, metadata !666, metadata !691}
!693 = metadata !{i32 40, i32 0, metadata !666, metadata !691}
!694 = metadata !{metadata !695, metadata !695, i64 0}
!695 = metadata !{metadata !"omnipotent char", metadata !696, i64 0}
!696 = metadata !{metadata !"Simple C/C++ TBAA"}
!697 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !691} ; [ DW_TAG_auto_variable ] [c] [line 40]
!698 = metadata !{i32 43, i32 0, metadata !699, metadata !691}
!699 = metadata !{i32 786443, metadata !25, metadata !666, i32 43, i32 0, i32 379} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!700 = metadata !{i32 46, i32 0, metadata !677, metadata !691}
!701 = metadata !{metadata !702, metadata !703, i64 0}
!702 = metadata !{metadata !"", metadata !703, i64 0, metadata !704, i64 8, metadata !704, i64 16, metadata !703, i64 24, metadata !704, i64 32, metadata !703, i64 40, metadata !704, i64 48, metadata !704, i64 56, metadata !704, i64 64, metadata !704, i64 72, metadata !704, i64 80, metadata !704, i64 88, metadata !704, i64 96}
!703 = metadata !{metadata !"int", metadata !695, i64 0}
!704 = metadata !{metadata !"any pointer", metadata !695, i64 0}
!705 = metadata !{i32 47, i32 0, metadata !675, metadata !691}
!706 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !691} ; [ DW_TAG_auto_variable ] [i] [line 41]
!707 = metadata !{i32 48, i32 0, metadata !674, metadata !691}
!708 = metadata !{metadata !702, metadata !704, i64 32}
!709 = metadata !{i32 49, i32 0, metadata !710, metadata !691}
!710 = metadata !{i32 786443, metadata !25, metadata !674, i32 49, i32 0, i32 384} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!711 = metadata !{metadata !712, metadata !704, i64 16}
!712 = metadata !{metadata !"", metadata !703, i64 0, metadata !704, i64 8, metadata !704, i64 16}
!713 = metadata !{metadata !714, metadata !715, i64 8}
!714 = metadata !{metadata !"stat64", metadata !715, i64 0, metadata !715, i64 8, metadata !715, i64 16, metadata !703, i64 24, metadata !703, i64 28, metadata !703, i64 32, metadata !703, i64 36, metadata !715, i64 40, metadata !715, i64 48, metadata !715, i64 56, metadata !715, i64 64, metadata !716, i64 72, metadata !716, i64 88, metadata !716, i64 104, metadata !695, i64 120}
!715 = metadata !{metadata !"long", metadata !695, i64 0}
!716 = metadata !{metadata !"timespec", metadata !715, i64 0, metadata !715, i64 8}
!717 = metadata !{i32 76, i32 0, metadata !88, null}
!718 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !719} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!719 = metadata !{i32 81, i32 0, metadata !87, null}
!720 = metadata !{i32 1428, i32 0, metadata !613, metadata !719}
!721 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !722} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!722 = metadata !{i32 1429, i32 0, metadata !613, metadata !719}
!723 = metadata !{i32 1415, i32 0, metadata !632, metadata !722}
!724 = metadata !{i32 1417, i32 0, metadata !632, metadata !722}
!725 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !722} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!726 = metadata !{i32 1418, i32 0, metadata !632, metadata !722}
!727 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !719} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!728 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !719} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!729 = metadata !{i32 1432, i32 0, metadata !622, metadata !719}
!730 = metadata !{i32 1433, i32 0, metadata !621, metadata !719}
!731 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !719} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!732 = metadata !{i32 1434, i32 0, metadata !625, metadata !719}
!733 = metadata !{i32 1435, i32 0, metadata !734, metadata !719}
!734 = metadata !{i32 786443, metadata !25, metadata !735, i32 1435, i32 0, i32 362} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!735 = metadata !{i32 786443, metadata !25, metadata !625, i32 1434, i32 0, i32 361} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!736 = metadata !{i32 1436, i32 0, metadata !737, metadata !719}
!737 = metadata !{i32 786443, metadata !25, metadata !734, i32 1435, i32 0, i32 363} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!738 = metadata !{i32 1437, i32 0, metadata !737, metadata !719}
!739 = metadata !{i32 1439, i32 0, metadata !740, metadata !719}
!740 = metadata !{i32 786443, metadata !25, metadata !741, i32 1438, i32 0, i32 365} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!741 = metadata !{i32 786443, metadata !25, metadata !734, i32 1438, i32 0, i32 364} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!742 = metadata !{i32 1440, i32 0, metadata !740, metadata !719}
!743 = metadata !{i32 1442, i32 0, metadata !624, metadata !719}
!744 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !719} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!745 = metadata !{i32 1443, i32 0, metadata !624, metadata !719}
!746 = metadata !{i32 1444, i32 0, metadata !624, metadata !719}
!747 = metadata !{i32 1445, i32 0, metadata !748, metadata !719}
!748 = metadata !{i32 786443, metadata !25, metadata !624, i32 1445, i32 0, i32 367} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!749 = metadata !{i32 82, i32 0, metadata !750, null}
!750 = metadata !{i32 786443, metadata !25, metadata !87, i32 82, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!751 = metadata !{i32 83, i32 0, metadata !750, null}
!752 = metadata !{metadata !703, metadata !703, i64 0}
!753 = metadata !{i32 86, i32 0, metadata !24, null}
!754 = metadata !{i32 88, i32 0, metadata !89, null}
!755 = metadata !{i32 89, i32 0, metadata !89, null}
!756 = metadata !{metadata !757, metadata !703, i64 768}
!757 = metadata !{metadata !"", metadata !695, i64 0, metadata !703, i64 768, metadata !703, i64 772, metadata !703, i64 776}
!758 = metadata !{i32 90, i32 0, metadata !89, null}
!759 = metadata !{i32 91, i32 0, metadata !89, null}
!760 = metadata !{i32 128, i32 0, metadata !96, null}
!761 = metadata !{i32 133, i32 0, metadata !762, null}
!762 = metadata !{i32 786443, metadata !25, metadata !96, i32 133, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!763 = metadata !{i32 134, i32 0, metadata !764, null}
!764 = metadata !{i32 786443, metadata !25, metadata !762, i32 134, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!765 = metadata !{metadata !766, metadata !703, i64 4}
!766 = metadata !{metadata !"", metadata !703, i64 0, metadata !703, i64 4, metadata !715, i64 8, metadata !704, i64 16}
!767 = metadata !{i32 136, i32 0, metadata !768, null}
!768 = metadata !{i32 786443, metadata !25, metadata !96, i32 136, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!769 = metadata !{i32 137, i32 0, metadata !770, null}
!770 = metadata !{i32 786443, metadata !25, metadata !768, i32 136, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!771 = metadata !{i32 138, i32 0, metadata !770, null}
!772 = metadata !{i32 141, i32 0, metadata !96, null}
!773 = metadata !{i32 144, i32 0, metadata !96, null}
!774 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !775} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!775 = metadata !{i32 146, i32 0, metadata !96, null}
!776 = metadata !{i32 39, i32 0, metadata !666, metadata !775}
!777 = metadata !{i32 40, i32 0, metadata !666, metadata !775}
!778 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !775} ; [ DW_TAG_auto_variable ] [c] [line 40]
!779 = metadata !{i32 43, i32 0, metadata !699, metadata !775}
!780 = metadata !{i32 46, i32 0, metadata !677, metadata !775}
!781 = metadata !{i32 47, i32 0, metadata !675, metadata !775}
!782 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !775} ; [ DW_TAG_auto_variable ] [i] [line 41]
!783 = metadata !{i32 48, i32 0, metadata !674, metadata !775}
!784 = metadata !{i32 49, i32 0, metadata !710, metadata !775}
!785 = metadata !{i32 147, i32 0, metadata !118, null}
!786 = metadata !{i32 150, i32 0, metadata !787, null}
!787 = metadata !{i32 786443, metadata !25, metadata !118, i32 147, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!788 = metadata !{metadata !766, metadata !704, i64 16}
!789 = metadata !{i32 152, i32 0, metadata !790, null}
!790 = metadata !{i32 786443, metadata !25, metadata !787, i32 152, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!791 = metadata !{i32 153, i32 0, metadata !792, null}
!792 = metadata !{i32 786443, metadata !25, metadata !790, i32 152, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!793 = metadata !{i32 154, i32 0, metadata !792, null}
!794 = metadata !{i32 168, i32 0, metadata !795, null}
!795 = metadata !{i32 786443, metadata !25, metadata !796, i32 165, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!796 = metadata !{i32 786443, metadata !25, metadata !787, i32 165, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!797 = metadata !{i32 169, i32 0, metadata !795, null}
!798 = metadata !{i32 170, i32 0, metadata !795, null}
!799 = metadata !{i32 786689, metadata !659, metadata !"flags", metadata !26, i32 16777313, metadata !29, i32 0, metadata !800} ; [ DW_TAG_arg_variable ] [flags] [line 97]
!800 = metadata !{i32 173, i32 0, metadata !801, null}
!801 = metadata !{i32 786443, metadata !25, metadata !787, i32 173, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!802 = metadata !{i32 97, i32 0, metadata !659, metadata !800}
!803 = metadata !{i32 786689, metadata !659, metadata !"s", metadata !26, i32 33554529, metadata !46, i32 0, metadata !800} ; [ DW_TAG_arg_variable ] [s] [line 97]
!804 = metadata !{i32 99, i32 0, metadata !659, metadata !800}
!805 = metadata !{metadata !714, metadata !703, i64 24}
!806 = metadata !{i32 786688, metadata !659, metadata !"mode", metadata !26, i32 99, metadata !92, i32 0, metadata !800} ; [ DW_TAG_auto_variable ] [mode] [line 99]
!807 = metadata !{i32 101, i32 0, metadata !808, metadata !800}
!808 = metadata !{i32 786443, metadata !25, metadata !659, i32 101, i32 0, i32 375} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!809 = metadata !{i32 786688, metadata !659, metadata !"read_access", metadata !26, i32 98, metadata !29, i32 0, metadata !800} ; [ DW_TAG_auto_variable ] [read_access] [line 98]
!810 = metadata !{i32 103, i32 0, metadata !808, metadata !800}
!811 = metadata !{i32 786688, metadata !659, metadata !"write_access", metadata !26, i32 98, metadata !29, i32 0, metadata !800} ; [ DW_TAG_auto_variable ] [write_access] [line 98]
!812 = metadata !{i32 107, i32 0, metadata !813, metadata !800}
!813 = metadata !{i32 786443, metadata !25, metadata !659, i32 105, i32 0, i32 376} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!814 = metadata !{i32 118, i32 0, metadata !815, metadata !800}
!815 = metadata !{i32 786443, metadata !25, metadata !659, i32 118, i32 0, i32 377} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!816 = metadata !{i32 105, i32 0, metadata !813, metadata !800}
!817 = metadata !{i32 121, i32 0, metadata !818, metadata !800}
!818 = metadata !{i32 786443, metadata !25, metadata !659, i32 121, i32 0, i32 378} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!819 = metadata !{i32 174, i32 0, metadata !820, null}
!820 = metadata !{i32 786443, metadata !25, metadata !801, i32 173, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!821 = metadata !{i32 175, i32 0, metadata !820, null}
!822 = metadata !{i32 178, i32 0, metadata !801, null}
!823 = metadata !{i32 180, i32 0, metadata !787, null}
!824 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !825} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!825 = metadata !{i32 181, i32 0, metadata !117, null}
!826 = metadata !{i32 1428, i32 0, metadata !613, metadata !825}
!827 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !828} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!828 = metadata !{i32 1429, i32 0, metadata !613, metadata !825}
!829 = metadata !{i32 1415, i32 0, metadata !632, metadata !828}
!830 = metadata !{i32 1417, i32 0, metadata !632, metadata !828}
!831 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !828} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!832 = metadata !{i32 1418, i32 0, metadata !632, metadata !828}
!833 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !825} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!834 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !825} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!835 = metadata !{i32 1432, i32 0, metadata !622, metadata !825}
!836 = metadata !{i32 1433, i32 0, metadata !621, metadata !825}
!837 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !825} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!838 = metadata !{i32 1434, i32 0, metadata !625, metadata !825}
!839 = metadata !{i32 1435, i32 0, metadata !734, metadata !825}
!840 = metadata !{i32 1436, i32 0, metadata !737, metadata !825}
!841 = metadata !{i32 1437, i32 0, metadata !737, metadata !825}
!842 = metadata !{i32 1439, i32 0, metadata !740, metadata !825}
!843 = metadata !{i32 1440, i32 0, metadata !740, metadata !825}
!844 = metadata !{i32 1442, i32 0, metadata !624, metadata !825}
!845 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !825} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!846 = metadata !{i32 1443, i32 0, metadata !624, metadata !825}
!847 = metadata !{i32 1444, i32 0, metadata !624, metadata !825}
!848 = metadata !{i32 1445, i32 0, metadata !748, metadata !825}
!849 = metadata !{i32 182, i32 0, metadata !850, null}
!850 = metadata !{i32 786443, metadata !25, metadata !117, i32 182, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!851 = metadata !{i32 183, i32 0, metadata !852, null}
!852 = metadata !{i32 786443, metadata !25, metadata !850, i32 182, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!853 = metadata !{i32 184, i32 0, metadata !852, null}
!854 = metadata !{i32 186, i32 0, metadata !117, null}
!855 = metadata !{metadata !766, metadata !703, i64 0}
!856 = metadata !{i32 190, i32 0, metadata !857, null}
!857 = metadata !{i32 786443, metadata !25, metadata !96, i32 190, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!858 = metadata !{i32 189, i32 0, metadata !96, null}
!859 = metadata !{i32 191, i32 0, metadata !860, null}
!860 = metadata !{i32 786443, metadata !25, metadata !857, i32 190, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!861 = metadata !{i32 192, i32 0, metadata !860, null}
!862 = metadata !{i32 193, i32 0, metadata !863, null}
!863 = metadata !{i32 786443, metadata !25, metadata !864, i32 192, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!864 = metadata !{i32 786443, metadata !25, metadata !857, i32 192, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!865 = metadata !{i32 194, i32 0, metadata !863, null}
!866 = metadata !{i32 195, i32 0, metadata !867, null}
!867 = metadata !{i32 786443, metadata !25, metadata !864, i32 194, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!868 = metadata !{i32 199, i32 0, metadata !96, null}
!869 = metadata !{i32 201, i32 0, metadata !119, null}
!870 = metadata !{i32 204, i32 0, metadata !131, null}
!871 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !872} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!872 = metadata !{i32 205, i32 0, metadata !130, null}
!873 = metadata !{i32 63, i32 0, metadata !651, metadata !872}
!874 = metadata !{i32 64, i32 0, metadata !658, metadata !872}
!875 = metadata !{i32 65, i32 0, metadata !657, metadata !872}
!876 = metadata !{i32 66, i32 0, metadata !877, metadata !872}
!877 = metadata !{i32 786443, metadata !25, metadata !657, i32 66, i32 0, i32 374} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!878 = metadata !{i32 207, i32 0, metadata !879, null}
!879 = metadata !{i32 786443, metadata !25, metadata !130, i32 207, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!880 = metadata !{i32 208, i32 0, metadata !881, null}
!881 = metadata !{i32 786443, metadata !25, metadata !879, i32 207, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!882 = metadata !{i32 209, i32 0, metadata !881, null}
!883 = metadata !{i32 210, i32 0, metadata !884, null}
!884 = metadata !{i32 786443, metadata !25, metadata !879, i32 210, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!885 = metadata !{i32 211, i32 0, metadata !886, null}
!886 = metadata !{i32 786443, metadata !25, metadata !884, i32 210, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!887 = metadata !{i32 212, i32 0, metadata !886, null}
!888 = metadata !{i32 213, i32 0, metadata !886, null}
!889 = metadata !{i32 215, i32 0, metadata !130, null}
!890 = metadata !{i32 216, i32 0, metadata !130, null}
!891 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !892} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!892 = metadata !{i32 218, i32 0, metadata !893, null}
!893 = metadata !{i32 786443, metadata !25, metadata !119, i32 218, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!894 = metadata !{i32 39, i32 0, metadata !666, metadata !892}
!895 = metadata !{i32 40, i32 0, metadata !666, metadata !892}
!896 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !892} ; [ DW_TAG_auto_variable ] [c] [line 40]
!897 = metadata !{i32 43, i32 0, metadata !699, metadata !892}
!898 = metadata !{i32 46, i32 0, metadata !677, metadata !892}
!899 = metadata !{i32 47, i32 0, metadata !675, metadata !892}
!900 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !892} ; [ DW_TAG_auto_variable ] [i] [line 41]
!901 = metadata !{i32 48, i32 0, metadata !674, metadata !892}
!902 = metadata !{i32 49, i32 0, metadata !710, metadata !892}
!903 = metadata !{i32 220, i32 0, metadata !904, null}
!904 = metadata !{i32 786443, metadata !25, metadata !893, i32 218, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!905 = metadata !{i32 223, i32 0, metadata !906, null}
!906 = metadata !{i32 786443, metadata !25, metadata !119, i32 223, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!907 = metadata !{i32 224, i32 0, metadata !908, null}
!908 = metadata !{i32 786443, metadata !25, metadata !906, i32 224, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!909 = metadata !{i32 226, i32 0, metadata !910, null}
!910 = metadata !{i32 786443, metadata !25, metadata !119, i32 226, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!911 = metadata !{i32 227, i32 0, metadata !912, null}
!912 = metadata !{i32 786443, metadata !25, metadata !910, i32 226, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!913 = metadata !{i32 228, i32 0, metadata !912, null}
!914 = metadata !{i32 231, i32 0, metadata !119, null}
!915 = metadata !{i32 234, i32 0, metadata !119, null}
!916 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !917} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!917 = metadata !{i32 236, i32 0, metadata !119, null}
!918 = metadata !{i32 1428, i32 0, metadata !613, metadata !917}
!919 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !920} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!920 = metadata !{i32 1429, i32 0, metadata !613, metadata !917}
!921 = metadata !{i32 1415, i32 0, metadata !632, metadata !920}
!922 = metadata !{i32 1417, i32 0, metadata !632, metadata !920}
!923 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !920} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!924 = metadata !{i32 1418, i32 0, metadata !632, metadata !920}
!925 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !917} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!926 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !917} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!927 = metadata !{i32 1432, i32 0, metadata !622, metadata !917}
!928 = metadata !{i32 1433, i32 0, metadata !621, metadata !917}
!929 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !917} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!930 = metadata !{i32 1434, i32 0, metadata !625, metadata !917}
!931 = metadata !{i32 1435, i32 0, metadata !734, metadata !917}
!932 = metadata !{i32 1436, i32 0, metadata !737, metadata !917}
!933 = metadata !{i32 1437, i32 0, metadata !737, metadata !917}
!934 = metadata !{i32 1439, i32 0, metadata !740, metadata !917}
!935 = metadata !{i32 1440, i32 0, metadata !740, metadata !917}
!936 = metadata !{i32 1442, i32 0, metadata !624, metadata !917}
!937 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !917} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!938 = metadata !{i32 1443, i32 0, metadata !624, metadata !917}
!939 = metadata !{i32 1444, i32 0, metadata !624, metadata !917}
!940 = metadata !{i32 1445, i32 0, metadata !748, metadata !917}
!941 = metadata !{i32 237, i32 0, metadata !942, null}
!942 = metadata !{i32 786443, metadata !25, metadata !119, i32 237, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!943 = metadata !{i32 238, i32 0, metadata !944, null}
!944 = metadata !{i32 786443, metadata !25, metadata !942, i32 237, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!945 = metadata !{i32 239, i32 0, metadata !944, null}
!946 = metadata !{i32 242, i32 0, metadata !119, null}
!947 = metadata !{i32 243, i32 0, metadata !119, null}
!948 = metadata !{i32 244, i32 0, metadata !949, null}
!949 = metadata !{i32 786443, metadata !25, metadata !119, i32 244, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!950 = metadata !{i32 245, i32 0, metadata !951, null}
!951 = metadata !{i32 786443, metadata !25, metadata !949, i32 244, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!952 = metadata !{i32 246, i32 0, metadata !951, null}
!953 = metadata !{i32 247, i32 0, metadata !954, null}
!954 = metadata !{i32 786443, metadata !25, metadata !955, i32 246, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!955 = metadata !{i32 786443, metadata !25, metadata !949, i32 246, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!956 = metadata !{i32 248, i32 0, metadata !954, null}
!957 = metadata !{i32 249, i32 0, metadata !958, null}
!958 = metadata !{i32 786443, metadata !25, metadata !955, i32 248, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!959 = metadata !{i32 253, i32 0, metadata !119, null}
!960 = metadata !{i32 256, i32 0, metadata !133, null}
!961 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !962} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!962 = metadata !{i32 257, i32 0, metadata !133, null}
!963 = metadata !{i32 39, i32 0, metadata !666, metadata !962}
!964 = metadata !{i32 40, i32 0, metadata !666, metadata !962}
!965 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !962} ; [ DW_TAG_auto_variable ] [c] [line 40]
!966 = metadata !{i32 43, i32 0, metadata !699, metadata !962}
!967 = metadata !{i32 46, i32 0, metadata !677, metadata !962}
!968 = metadata !{i32 47, i32 0, metadata !675, metadata !962}
!969 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !962} ; [ DW_TAG_auto_variable ] [i] [line 41]
!970 = metadata !{i32 48, i32 0, metadata !674, metadata !962}
!971 = metadata !{i32 49, i32 0, metadata !710, metadata !962}
!972 = metadata !{i32 259, i32 0, metadata !973, null}
!973 = metadata !{i32 786443, metadata !25, metadata !133, i32 259, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!974 = metadata !{i32 261, i32 0, metadata !975, null}
!975 = metadata !{i32 786443, metadata !25, metadata !973, i32 259, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!976 = metadata !{metadata !977, metadata !715, i64 0}
!977 = metadata !{metadata !"timeval", metadata !715, i64 0, metadata !715, i64 8}
!978 = metadata !{metadata !714, metadata !715, i64 72}
!979 = metadata !{i32 262, i32 0, metadata !975, null}
!980 = metadata !{metadata !714, metadata !715, i64 88}
!981 = metadata !{i32 267, i32 0, metadata !975, null}
!982 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !983} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!983 = metadata !{i32 269, i32 0, metadata !133, null}
!984 = metadata !{i32 1428, i32 0, metadata !613, metadata !983}
!985 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !986} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!986 = metadata !{i32 1429, i32 0, metadata !613, metadata !983}
!987 = metadata !{i32 1415, i32 0, metadata !632, metadata !986}
!988 = metadata !{i32 1417, i32 0, metadata !632, metadata !986}
!989 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !986} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!990 = metadata !{i32 1418, i32 0, metadata !632, metadata !986}
!991 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !983} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!992 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !983} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!993 = metadata !{i32 1432, i32 0, metadata !622, metadata !983}
!994 = metadata !{i32 1433, i32 0, metadata !621, metadata !983}
!995 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !983} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!996 = metadata !{i32 1434, i32 0, metadata !625, metadata !983}
!997 = metadata !{i32 1435, i32 0, metadata !734, metadata !983}
!998 = metadata !{i32 1436, i32 0, metadata !737, metadata !983}
!999 = metadata !{i32 1437, i32 0, metadata !737, metadata !983}
!1000 = metadata !{i32 1439, i32 0, metadata !740, metadata !983}
!1001 = metadata !{i32 1440, i32 0, metadata !740, metadata !983}
!1002 = metadata !{i32 1442, i32 0, metadata !624, metadata !983}
!1003 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !983} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1004 = metadata !{i32 1443, i32 0, metadata !624, metadata !983}
!1005 = metadata !{i32 1444, i32 0, metadata !624, metadata !983}
!1006 = metadata !{i32 1445, i32 0, metadata !748, metadata !983}
!1007 = metadata !{i32 270, i32 0, metadata !1008, null}
!1008 = metadata !{i32 786443, metadata !25, metadata !133, i32 270, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1009 = metadata !{i32 271, i32 0, metadata !1008, null}
!1010 = metadata !{i32 274, i32 0, metadata !133, null}
!1011 = metadata !{i32 277, i32 0, metadata !149, null}
!1012 = metadata !{i32 278, i32 0, metadata !158, null}
!1013 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1014} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1014 = metadata !{i32 279, i32 0, metadata !157, null}
!1015 = metadata !{i32 63, i32 0, metadata !651, metadata !1014}
!1016 = metadata !{i32 64, i32 0, metadata !658, metadata !1014}
!1017 = metadata !{i32 65, i32 0, metadata !657, metadata !1014}
!1018 = metadata !{i32 66, i32 0, metadata !877, metadata !1014}
!1019 = metadata !{i32 281, i32 0, metadata !1020, null}
!1020 = metadata !{i32 786443, metadata !25, metadata !157, i32 281, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1021 = metadata !{i32 282, i32 0, metadata !1022, null}
!1022 = metadata !{i32 786443, metadata !25, metadata !1020, i32 281, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1023 = metadata !{i32 283, i32 0, metadata !1022, null}
!1024 = metadata !{i32 284, i32 0, metadata !1025, null}
!1025 = metadata !{i32 786443, metadata !25, metadata !1020, i32 284, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1026 = metadata !{i32 285, i32 0, metadata !1027, null}
!1027 = metadata !{i32 786443, metadata !25, metadata !1025, i32 284, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1028 = metadata !{i32 286, i32 0, metadata !1027, null}
!1029 = metadata !{i32 287, i32 0, metadata !1027, null}
!1030 = metadata !{i32 289, i32 0, metadata !157, null}
!1031 = metadata !{i32 290, i32 0, metadata !157, null}
!1032 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1033} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1033 = metadata !{i32 291, i32 0, metadata !1034, null}
!1034 = metadata !{i32 786443, metadata !25, metadata !149, i32 291, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1035 = metadata !{i32 39, i32 0, metadata !666, metadata !1033}
!1036 = metadata !{i32 40, i32 0, metadata !666, metadata !1033}
!1037 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1033} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1038 = metadata !{i32 43, i32 0, metadata !699, metadata !1033}
!1039 = metadata !{i32 46, i32 0, metadata !677, metadata !1033}
!1040 = metadata !{i32 47, i32 0, metadata !675, metadata !1033}
!1041 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1033} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1042 = metadata !{i32 48, i32 0, metadata !674, metadata !1033}
!1043 = metadata !{i32 49, i32 0, metadata !710, metadata !1033}
!1044 = metadata !{i32 292, i32 0, metadata !1045, null}
!1045 = metadata !{i32 786443, metadata !25, metadata !1034, i32 291, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1046 = metadata !{i32 295, i32 0, metadata !149, null}
!1047 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1048} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1048 = metadata !{i32 296, i32 0, metadata !149, null}
!1049 = metadata !{i32 1428, i32 0, metadata !613, metadata !1048}
!1050 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1051} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1051 = metadata !{i32 1429, i32 0, metadata !613, metadata !1048}
!1052 = metadata !{i32 1415, i32 0, metadata !632, metadata !1051}
!1053 = metadata !{i32 1417, i32 0, metadata !632, metadata !1051}
!1054 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1051} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1055 = metadata !{i32 1418, i32 0, metadata !632, metadata !1051}
!1056 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1048} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1057 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1048} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1058 = metadata !{i32 1432, i32 0, metadata !622, metadata !1048}
!1059 = metadata !{i32 1433, i32 0, metadata !621, metadata !1048}
!1060 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1048} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1061 = metadata !{i32 1434, i32 0, metadata !625, metadata !1048}
!1062 = metadata !{i32 1435, i32 0, metadata !734, metadata !1048}
!1063 = metadata !{i32 1436, i32 0, metadata !737, metadata !1048}
!1064 = metadata !{i32 1437, i32 0, metadata !737, metadata !1048}
!1065 = metadata !{i32 1439, i32 0, metadata !740, metadata !1048}
!1066 = metadata !{i32 1440, i32 0, metadata !740, metadata !1048}
!1067 = metadata !{i32 1442, i32 0, metadata !624, metadata !1048}
!1068 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1048} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1069 = metadata !{i32 1443, i32 0, metadata !624, metadata !1048}
!1070 = metadata !{i32 1444, i32 0, metadata !624, metadata !1048}
!1071 = metadata !{i32 1445, i32 0, metadata !748, metadata !1048}
!1072 = metadata !{i32 298, i32 0, metadata !1073, null}
!1073 = metadata !{i32 786443, metadata !25, metadata !149, i32 298, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1074 = metadata !{i32 299, i32 0, metadata !1073, null}
!1075 = metadata !{i32 301, i32 0, metadata !149, null}
!1076 = metadata !{i32 303, i32 0, metadata !160, null}
!1077 = metadata !{i32 306, i32 0, metadata !160, null}
!1078 = metadata !{i32 308, i32 0, metadata !160, null}
!1079 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1080} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1080 = metadata !{i32 310, i32 0, metadata !160, null}
!1081 = metadata !{i32 63, i32 0, metadata !651, metadata !1080}
!1082 = metadata !{i32 64, i32 0, metadata !658, metadata !1080}
!1083 = metadata !{i32 65, i32 0, metadata !657, metadata !1080}
!1084 = metadata !{i32 66, i32 0, metadata !877, metadata !1080}
!1085 = metadata !{i32 311, i32 0, metadata !1086, null}
!1086 = metadata !{i32 786443, metadata !25, metadata !160, i32 311, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1087 = metadata !{i32 312, i32 0, metadata !1088, null}
!1088 = metadata !{i32 786443, metadata !25, metadata !1086, i32 311, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1089 = metadata !{i32 313, i32 0, metadata !1088, null}
!1090 = metadata !{i32 316, i32 0, metadata !1091, null}
!1091 = metadata !{i32 786443, metadata !25, metadata !160, i32 316, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1092 = metadata !{metadata !702, metadata !703, i64 40}
!1093 = metadata !{metadata !702, metadata !704, i64 64}
!1094 = metadata !{i32 317, i32 0, metadata !1095, null}
!1095 = metadata !{i32 786443, metadata !25, metadata !1091, i32 316, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1096 = metadata !{i32 318, i32 0, metadata !1095, null}
!1097 = metadata !{i32 319, i32 0, metadata !1095, null}
!1098 = metadata !{i32 330, i32 0, metadata !160, null}
!1099 = metadata !{i32 332, i32 0, metadata !160, null}
!1100 = metadata !{i32 333, i32 0, metadata !160, null}
!1101 = metadata !{i32 335, i32 0, metadata !167, null}
!1102 = metadata !{i32 339, i32 0, metadata !167, null}
!1103 = metadata !{i32 341, i32 0, metadata !1104, null}
!1104 = metadata !{i32 786443, metadata !25, metadata !167, i32 341, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1105 = metadata !{i32 344, i32 0, metadata !1106, null}
!1106 = metadata !{i32 786443, metadata !25, metadata !167, i32 344, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1107 = metadata !{i32 345, i32 0, metadata !1108, null}
!1108 = metadata !{i32 786443, metadata !25, metadata !1106, i32 344, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1109 = metadata !{i32 346, i32 0, metadata !1108, null}
!1110 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1111} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1111 = metadata !{i32 349, i32 0, metadata !167, null}
!1112 = metadata !{i32 63, i32 0, metadata !651, metadata !1111}
!1113 = metadata !{i32 64, i32 0, metadata !658, metadata !1111}
!1114 = metadata !{i32 65, i32 0, metadata !657, metadata !1111}
!1115 = metadata !{i32 66, i32 0, metadata !877, metadata !1111}
!1116 = metadata !{i32 351, i32 0, metadata !1117, null}
!1117 = metadata !{i32 786443, metadata !25, metadata !167, i32 351, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1118 = metadata !{i32 352, i32 0, metadata !1119, null}
!1119 = metadata !{i32 786443, metadata !25, metadata !1117, i32 351, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1120 = metadata !{i32 353, i32 0, metadata !1119, null}
!1121 = metadata !{i32 356, i32 0, metadata !1122, null}
!1122 = metadata !{i32 786443, metadata !25, metadata !167, i32 356, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1123 = metadata !{metadata !702, metadata !704, i64 48}
!1124 = metadata !{i32 357, i32 0, metadata !1125, null}
!1125 = metadata !{i32 786443, metadata !25, metadata !1122, i32 356, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1126 = metadata !{i32 358, i32 0, metadata !1125, null}
!1127 = metadata !{i32 359, i32 0, metadata !1125, null}
!1128 = metadata !{i32 362, i32 0, metadata !181, null}
!1129 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1130} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1130 = metadata !{i32 365, i32 0, metadata !180, null}
!1131 = metadata !{i32 1415, i32 0, metadata !632, metadata !1130}
!1132 = metadata !{i32 1417, i32 0, metadata !632, metadata !1130}
!1133 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1130} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1134 = metadata !{i32 1418, i32 0, metadata !632, metadata !1130}
!1135 = metadata !{i32 786689, metadata !626, metadata !"s", metadata !26, i32 16778638, metadata !173, i32 0, metadata !1136} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!1136 = metadata !{i32 366, i32 0, metadata !180, null}
!1137 = metadata !{i32 1422, i32 0, metadata !626, metadata !1136}
!1138 = metadata !{i32 1423, i32 0, metadata !626, metadata !1136}
!1139 = metadata !{i32 786688, metadata !626, metadata !"sc", metadata !26, i32 1423, metadata !173, i32 0, metadata !1136} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!1140 = metadata !{i32 1424, i32 0, metadata !626, metadata !1136}
!1141 = metadata !{i32 370, i32 0, metadata !180, null}
!1142 = metadata !{i32 371, i32 0, metadata !1143, null}
!1143 = metadata !{i32 786443, metadata !25, metadata !180, i32 371, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1144 = metadata !{i32 372, i32 0, metadata !1143, null}
!1145 = metadata !{i32 374, i32 0, metadata !1143, null}
!1146 = metadata !{metadata !766, metadata !715, i64 8}
!1147 = metadata !{i32 376, i32 0, metadata !1148, null}
!1148 = metadata !{i32 786443, metadata !25, metadata !180, i32 376, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1149 = metadata !{i32 377, i32 0, metadata !1150, null}
!1150 = metadata !{i32 786443, metadata !25, metadata !1148, i32 376, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1151 = metadata !{i32 378, i32 0, metadata !1150, null}
!1152 = metadata !{i32 381, i32 0, metadata !1153, null}
!1153 = metadata !{i32 786443, metadata !25, metadata !180, i32 381, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1154 = metadata !{i32 383, i32 0, metadata !180, null}
!1155 = metadata !{i32 382, i32 0, metadata !1153, null}
!1156 = metadata !{i32 386, i32 0, metadata !1157, null}
!1157 = metadata !{i32 786443, metadata !25, metadata !181, i32 385, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1158 = metadata !{i32 387, i32 0, metadata !1159, null}
!1159 = metadata !{i32 786443, metadata !25, metadata !1157, i32 387, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1160 = metadata !{metadata !712, metadata !703, i64 0}
!1161 = metadata !{i32 391, i32 0, metadata !1162, null}
!1162 = metadata !{i32 786443, metadata !25, metadata !1157, i32 391, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1163 = metadata !{i32 392, i32 0, metadata !1164, null}
!1164 = metadata !{i32 786443, metadata !25, metadata !1162, i32 391, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1165 = metadata !{i32 395, i32 0, metadata !1157, null}
!1166 = metadata !{metadata !712, metadata !704, i64 8}
!1167 = metadata !{i32 396, i32 0, metadata !1157, null}
!1168 = metadata !{i32 398, i32 0, metadata !1157, null}
!1169 = metadata !{i32 400, i32 0, metadata !167, null}
!1170 = metadata !{i32 403, i32 0, metadata !182, null}
!1171 = metadata !{i32 407, i32 0, metadata !182, null}
!1172 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1173} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1173 = metadata !{i32 409, i32 0, metadata !182, null}
!1174 = metadata !{i32 63, i32 0, metadata !651, metadata !1173}
!1175 = metadata !{i32 64, i32 0, metadata !658, metadata !1173}
!1176 = metadata !{i32 65, i32 0, metadata !657, metadata !1173}
!1177 = metadata !{i32 66, i32 0, metadata !877, metadata !1173}
!1178 = metadata !{i32 411, i32 0, metadata !1179, null}
!1179 = metadata !{i32 786443, metadata !25, metadata !182, i32 411, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1180 = metadata !{i32 412, i32 0, metadata !1181, null}
!1181 = metadata !{i32 786443, metadata !25, metadata !1179, i32 411, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1182 = metadata !{i32 413, i32 0, metadata !1181, null}
!1183 = metadata !{i32 416, i32 0, metadata !1184, null}
!1184 = metadata !{i32 786443, metadata !25, metadata !182, i32 416, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1185 = metadata !{metadata !702, metadata !704, i64 56}
!1186 = metadata !{i32 417, i32 0, metadata !1187, null}
!1187 = metadata !{i32 786443, metadata !25, metadata !1184, i32 416, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1188 = metadata !{i32 418, i32 0, metadata !1187, null}
!1189 = metadata !{i32 419, i32 0, metadata !1187, null}
!1190 = metadata !{i32 422, i32 0, metadata !194, null}
!1191 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1192} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1192 = metadata !{i32 425, i32 0, metadata !193, null}
!1193 = metadata !{i32 1415, i32 0, metadata !632, metadata !1192}
!1194 = metadata !{i32 1417, i32 0, metadata !632, metadata !1192}
!1195 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1192} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1196 = metadata !{i32 1418, i32 0, metadata !632, metadata !1192}
!1197 = metadata !{i32 786689, metadata !626, metadata !"s", metadata !26, i32 16778638, metadata !173, i32 0, metadata !1198} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!1198 = metadata !{i32 426, i32 0, metadata !193, null}
!1199 = metadata !{i32 1422, i32 0, metadata !626, metadata !1198}
!1200 = metadata !{i32 1423, i32 0, metadata !626, metadata !1198}
!1201 = metadata !{i32 786688, metadata !626, metadata !"sc", metadata !26, i32 1423, metadata !173, i32 0, metadata !1198} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!1202 = metadata !{i32 1424, i32 0, metadata !626, metadata !1198}
!1203 = metadata !{i32 430, i32 0, metadata !193, null}
!1204 = metadata !{i32 431, i32 0, metadata !1205, null}
!1205 = metadata !{i32 786443, metadata !25, metadata !193, i32 431, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1206 = metadata !{i32 432, i32 0, metadata !1205, null}
!1207 = metadata !{i32 433, i32 0, metadata !1205, null}
!1208 = metadata !{i32 435, i32 0, metadata !1209, null}
!1209 = metadata !{i32 786443, metadata !25, metadata !193, i32 435, i32 0, i32 85} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1210 = metadata !{i32 436, i32 0, metadata !1211, null}
!1211 = metadata !{i32 786443, metadata !25, metadata !1209, i32 435, i32 0, i32 86} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1212 = metadata !{i32 437, i32 0, metadata !1211, null}
!1213 = metadata !{i32 440, i32 0, metadata !193, null}
!1214 = metadata !{i32 441, i32 0, metadata !1215, null}
!1215 = metadata !{i32 786443, metadata !25, metadata !193, i32 441, i32 0, i32 87} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1216 = metadata !{i32 444, i32 0, metadata !193, null}
!1217 = metadata !{i32 442, i32 0, metadata !1215, null}
!1218 = metadata !{i64 0}
!1219 = metadata !{i32 448, i32 0, metadata !196, null}
!1220 = metadata !{i32 449, i32 0, metadata !1221, null}
!1221 = metadata !{i32 786443, metadata !25, metadata !196, i32 449, i32 0, i32 89} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1222 = metadata !{i32 452, i32 0, metadata !1223, null}
!1223 = metadata !{i32 786443, metadata !25, metadata !1224, i32 452, i32 0, i32 91} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1224 = metadata !{i32 786443, metadata !25, metadata !1221, i32 451, i32 0, i32 90} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1225 = metadata !{metadata !757, metadata !703, i64 776}
!1226 = metadata !{i32 453, i32 0, metadata !1223, null}
!1227 = metadata !{i32 455, i32 0, metadata !1228, null}
!1228 = metadata !{i32 786443, metadata !25, metadata !1229, i32 455, i32 0, i32 93} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1229 = metadata !{i32 786443, metadata !25, metadata !1223, i32 454, i32 0, i32 92} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1230 = metadata !{i32 456, i32 0, metadata !1228, null}
!1231 = metadata !{i32 460, i32 0, metadata !1232, null}
!1232 = metadata !{i32 786443, metadata !25, metadata !196, i32 460, i32 0, i32 94} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1233 = metadata !{i32 461, i32 0, metadata !1232, null}
!1234 = metadata !{i32 463, i32 0, metadata !1235, null}
!1235 = metadata !{i32 786443, metadata !25, metadata !196, i32 463, i32 0, i32 95} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1236 = metadata !{i32 464, i32 0, metadata !1235, null}
!1237 = metadata !{i32 466, i32 0, metadata !1238, null}
!1238 = metadata !{i32 786443, metadata !25, metadata !196, i32 466, i32 0, i32 96} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1239 = metadata !{metadata !702, metadata !704, i64 16}
!1240 = metadata !{i32 467, i32 0, metadata !1238, null}
!1241 = metadata !{metadata !702, metadata !703, i64 24}
!1242 = metadata !{i32 469, i32 0, metadata !196, null}
!1243 = metadata !{i32 470, i32 0, metadata !196, null}
!1244 = metadata !{i32 472, i32 0, metadata !182, null}
!1245 = metadata !{i32 475, i32 0, metadata !197, null}
!1246 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1247} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1247 = metadata !{i32 477, i32 0, metadata !197, null}
!1248 = metadata !{i32 63, i32 0, metadata !651, metadata !1247}
!1249 = metadata !{i32 64, i32 0, metadata !658, metadata !1247}
!1250 = metadata !{i32 65, i32 0, metadata !657, metadata !1247}
!1251 = metadata !{i32 66, i32 0, metadata !877, metadata !1247}
!1252 = metadata !{i32 479, i32 0, metadata !1253, null}
!1253 = metadata !{i32 786443, metadata !25, metadata !197, i32 479, i32 0, i32 97} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1254 = metadata !{i32 480, i32 0, metadata !1255, null}
!1255 = metadata !{i32 786443, metadata !25, metadata !1253, i32 479, i32 0, i32 98} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1256 = metadata !{i32 481, i32 0, metadata !1255, null}
!1257 = metadata !{i32 484, i32 0, metadata !1258, null}
!1258 = metadata !{i32 786443, metadata !25, metadata !197, i32 484, i32 0, i32 99} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1259 = metadata !{i32 491, i32 0, metadata !1260, null}
!1260 = metadata !{i32 786443, metadata !25, metadata !1261, i32 491, i32 0, i32 101} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1261 = metadata !{i32 786443, metadata !25, metadata !1258, i32 484, i32 0, i32 100} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1262 = metadata !{i32 492, i32 0, metadata !1263, null}
!1263 = metadata !{i32 786443, metadata !25, metadata !1260, i32 491, i32 0, i32 102} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1264 = metadata !{i32 493, i32 0, metadata !1263, null}
!1265 = metadata !{i32 494, i32 0, metadata !1266, null}
!1266 = metadata !{i32 786443, metadata !25, metadata !1260, i32 493, i32 0, i32 103} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1267 = metadata !{i32 498, i32 0, metadata !1268, null}
!1268 = metadata !{i32 786443, metadata !25, metadata !1266, i32 498, i32 0, i32 104} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1269 = metadata !{i32 499, i32 0, metadata !1270, null}
!1270 = metadata !{i32 786443, metadata !25, metadata !1268, i32 498, i32 0, i32 105} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1271 = metadata !{i32 500, i32 0, metadata !1270, null}
!1272 = metadata !{i32 501, i32 0, metadata !1270, null}
!1273 = metadata !{i32 504, i32 0, metadata !1274, null}
!1274 = metadata !{i32 786443, metadata !25, metadata !1261, i32 504, i32 0, i32 106} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1275 = metadata !{i32 505, i32 0, metadata !1276, null}
!1276 = metadata !{i32 786443, metadata !25, metadata !1274, i32 504, i32 0, i32 107} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1277 = metadata !{i32 506, i32 0, metadata !1276, null}
!1278 = metadata !{i32 509, i32 0, metadata !1261, null}
!1279 = metadata !{i32 510, i32 0, metadata !1261, null}
!1280 = metadata !{i32 513, i32 0, metadata !197, null}
!1281 = metadata !{i32 515, i32 0, metadata !1282, null}
!1282 = metadata !{i32 786443, metadata !25, metadata !197, i32 513, i32 0, i32 108} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1283 = metadata !{i32 516, i32 0, metadata !1282, null}
!1284 = metadata !{i32 518, i32 0, metadata !1285, null}
!1285 = metadata !{i32 786443, metadata !25, metadata !1282, i32 517, i32 0, i32 109} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1286 = metadata !{i32 519, i32 0, metadata !1285, null}
!1287 = metadata !{i32 523, i32 0, metadata !1288, null}
!1288 = metadata !{i32 786443, metadata !25, metadata !197, i32 523, i32 0, i32 110} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1289 = metadata !{i32 524, i32 0, metadata !1290, null}
!1290 = metadata !{i32 786443, metadata !25, metadata !1288, i32 523, i32 0, i32 111} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1291 = metadata !{i32 525, i32 0, metadata !1290, null}
!1292 = metadata !{i32 528, i32 0, metadata !197, null}
!1293 = metadata !{i32 529, i32 0, metadata !197, null}
!1294 = metadata !{i32 530, i32 0, metadata !197, null}
!1295 = metadata !{i32 532, i32 0, metadata !206, null}
!1296 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1297} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1297 = metadata !{i32 533, i32 0, metadata !206, null}
!1298 = metadata !{i32 39, i32 0, metadata !666, metadata !1297}
!1299 = metadata !{i32 40, i32 0, metadata !666, metadata !1297}
!1300 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1297} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1301 = metadata !{i32 43, i32 0, metadata !699, metadata !1297}
!1302 = metadata !{i32 46, i32 0, metadata !677, metadata !1297}
!1303 = metadata !{i32 47, i32 0, metadata !675, metadata !1297}
!1304 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1297} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1305 = metadata !{i32 48, i32 0, metadata !674, metadata !1297}
!1306 = metadata !{i32 49, i32 0, metadata !710, metadata !1297}
!1307 = metadata !{i32 534, i32 0, metadata !1308, null}
!1308 = metadata !{i32 786443, metadata !25, metadata !206, i32 534, i32 0, i32 112} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1309 = metadata !{i32 535, i32 0, metadata !1310, null}
!1310 = metadata !{i32 786443, metadata !25, metadata !1308, i32 534, i32 0, i32 113} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1311 = metadata !{i32 536, i32 0, metadata !1310, null}
!1312 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1313} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1313 = metadata !{i32 541, i32 0, metadata !214, null}
!1314 = metadata !{i32 1428, i32 0, metadata !613, metadata !1313}
!1315 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1316} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1316 = metadata !{i32 1429, i32 0, metadata !613, metadata !1313}
!1317 = metadata !{i32 1415, i32 0, metadata !632, metadata !1316}
!1318 = metadata !{i32 1417, i32 0, metadata !632, metadata !1316}
!1319 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1316} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1320 = metadata !{i32 1418, i32 0, metadata !632, metadata !1316}
!1321 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1313} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1322 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1313} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1323 = metadata !{i32 1432, i32 0, metadata !622, metadata !1313}
!1324 = metadata !{i32 1433, i32 0, metadata !621, metadata !1313}
!1325 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1313} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1326 = metadata !{i32 1434, i32 0, metadata !625, metadata !1313}
!1327 = metadata !{i32 1435, i32 0, metadata !734, metadata !1313}
!1328 = metadata !{i32 1436, i32 0, metadata !737, metadata !1313}
!1329 = metadata !{i32 1437, i32 0, metadata !737, metadata !1313}
!1330 = metadata !{i32 1439, i32 0, metadata !740, metadata !1313}
!1331 = metadata !{i32 1440, i32 0, metadata !740, metadata !1313}
!1332 = metadata !{i32 1442, i32 0, metadata !624, metadata !1313}
!1333 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1313} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1334 = metadata !{i32 1443, i32 0, metadata !624, metadata !1313}
!1335 = metadata !{i32 1444, i32 0, metadata !624, metadata !1313}
!1336 = metadata !{i32 1445, i32 0, metadata !748, metadata !1313}
!1337 = metadata !{i32 545, i32 0, metadata !1338, null}
!1338 = metadata !{i32 786443, metadata !25, metadata !214, i32 545, i32 0, i32 115} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1339 = metadata !{i32 546, i32 0, metadata !1338, null}
!1340 = metadata !{i32 549, i32 0, metadata !206, null}
!1341 = metadata !{i32 551, i32 0, metadata !215, null}
!1342 = metadata !{i32 552, i32 0, metadata !245, null}
!1343 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1344} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1344 = metadata !{i32 553, i32 0, metadata !244, null}
!1345 = metadata !{i32 63, i32 0, metadata !651, metadata !1344}
!1346 = metadata !{i32 64, i32 0, metadata !658, metadata !1344}
!1347 = metadata !{i32 65, i32 0, metadata !657, metadata !1344}
!1348 = metadata !{i32 66, i32 0, metadata !877, metadata !1344}
!1349 = metadata !{i32 555, i32 0, metadata !1350, null}
!1350 = metadata !{i32 786443, metadata !25, metadata !244, i32 555, i32 0, i32 118} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1351 = metadata !{i32 556, i32 0, metadata !1352, null}
!1352 = metadata !{i32 786443, metadata !25, metadata !1350, i32 555, i32 0, i32 119} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1353 = metadata !{i32 557, i32 0, metadata !1352, null}
!1354 = metadata !{i32 558, i32 0, metadata !1355, null}
!1355 = metadata !{i32 786443, metadata !25, metadata !1350, i32 558, i32 0, i32 120} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1356 = metadata !{i32 559, i32 0, metadata !1357, null}
!1357 = metadata !{i32 786443, metadata !25, metadata !1355, i32 558, i32 0, i32 121} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1358 = metadata !{i32 560, i32 0, metadata !1357, null}
!1359 = metadata !{i32 561, i32 0, metadata !1357, null}
!1360 = metadata !{i32 563, i32 0, metadata !244, null}
!1361 = metadata !{i32 564, i32 0, metadata !244, null}
!1362 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1363} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1363 = metadata !{i32 565, i32 0, metadata !215, null}
!1364 = metadata !{i32 39, i32 0, metadata !666, metadata !1363}
!1365 = metadata !{i32 40, i32 0, metadata !666, metadata !1363}
!1366 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1363} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1367 = metadata !{i32 43, i32 0, metadata !699, metadata !1363}
!1368 = metadata !{i32 46, i32 0, metadata !677, metadata !1363}
!1369 = metadata !{i32 47, i32 0, metadata !675, metadata !1363}
!1370 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1363} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1371 = metadata !{i32 48, i32 0, metadata !674, metadata !1363}
!1372 = metadata !{i32 49, i32 0, metadata !710, metadata !1363}
!1373 = metadata !{i32 566, i32 0, metadata !1374, null}
!1374 = metadata !{i32 786443, metadata !25, metadata !215, i32 566, i32 0, i32 122} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1375 = metadata !{i32 567, i32 0, metadata !1376, null}
!1376 = metadata !{i32 786443, metadata !25, metadata !1374, i32 566, i32 0, i32 123} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1377 = metadata !{i32 568, i32 0, metadata !1376, null}
!1378 = metadata !{i32 572, i32 0, metadata !215, null}
!1379 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1380} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1380 = metadata !{i32 573, i32 0, metadata !215, null}
!1381 = metadata !{i32 1428, i32 0, metadata !613, metadata !1380}
!1382 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1383} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1383 = metadata !{i32 1429, i32 0, metadata !613, metadata !1380}
!1384 = metadata !{i32 1415, i32 0, metadata !632, metadata !1383}
!1385 = metadata !{i32 1417, i32 0, metadata !632, metadata !1383}
!1386 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1383} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1387 = metadata !{i32 1418, i32 0, metadata !632, metadata !1383}
!1388 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1380} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1389 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1380} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1390 = metadata !{i32 1432, i32 0, metadata !622, metadata !1380}
!1391 = metadata !{i32 1433, i32 0, metadata !621, metadata !1380}
!1392 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1380} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1393 = metadata !{i32 1434, i32 0, metadata !625, metadata !1380}
!1394 = metadata !{i32 1435, i32 0, metadata !734, metadata !1380}
!1395 = metadata !{i32 1436, i32 0, metadata !737, metadata !1380}
!1396 = metadata !{i32 1437, i32 0, metadata !737, metadata !1380}
!1397 = metadata !{i32 1439, i32 0, metadata !740, metadata !1380}
!1398 = metadata !{i32 1440, i32 0, metadata !740, metadata !1380}
!1399 = metadata !{i32 1442, i32 0, metadata !624, metadata !1380}
!1400 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1380} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1401 = metadata !{i32 1443, i32 0, metadata !624, metadata !1380}
!1402 = metadata !{i32 1444, i32 0, metadata !624, metadata !1380}
!1403 = metadata !{i32 1445, i32 0, metadata !748, metadata !1380}
!1404 = metadata !{i32 581, i32 0, metadata !1405, null}
!1405 = metadata !{i32 786443, metadata !25, metadata !215, i32 581, i32 0, i32 124} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1406 = metadata !{i32 582, i32 0, metadata !1405, null}
!1407 = metadata !{i32 584, i32 0, metadata !215, null}
!1408 = metadata !{i32 587, i32 0, metadata !248, null}
!1409 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1410} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1410 = metadata !{i32 588, i32 0, metadata !248, null}
!1411 = metadata !{i32 39, i32 0, metadata !666, metadata !1410}
!1412 = metadata !{i32 40, i32 0, metadata !666, metadata !1410}
!1413 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1410} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1414 = metadata !{i32 43, i32 0, metadata !699, metadata !1410}
!1415 = metadata !{i32 46, i32 0, metadata !677, metadata !1410}
!1416 = metadata !{i32 47, i32 0, metadata !675, metadata !1410}
!1417 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1410} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1418 = metadata !{i32 48, i32 0, metadata !674, metadata !1410}
!1419 = metadata !{i32 49, i32 0, metadata !710, metadata !1410}
!1420 = metadata !{i32 589, i32 0, metadata !1421, null}
!1421 = metadata !{i32 786443, metadata !25, metadata !248, i32 589, i32 0, i32 125} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1422 = metadata !{i32 590, i32 0, metadata !1423, null}
!1423 = metadata !{i32 786443, metadata !25, metadata !1421, i32 589, i32 0, i32 126} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1424 = metadata !{i32 591, i32 0, metadata !1423, null}
!1425 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1426} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1426 = metadata !{i32 596, i32 0, metadata !254, null}
!1427 = metadata !{i32 1428, i32 0, metadata !613, metadata !1426}
!1428 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1429} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1429 = metadata !{i32 1429, i32 0, metadata !613, metadata !1426}
!1430 = metadata !{i32 1415, i32 0, metadata !632, metadata !1429}
!1431 = metadata !{i32 1417, i32 0, metadata !632, metadata !1429}
!1432 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1429} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1433 = metadata !{i32 1418, i32 0, metadata !632, metadata !1429}
!1434 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1426} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1435 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1426} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1436 = metadata !{i32 1432, i32 0, metadata !622, metadata !1426}
!1437 = metadata !{i32 1433, i32 0, metadata !621, metadata !1426}
!1438 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1426} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1439 = metadata !{i32 1434, i32 0, metadata !625, metadata !1426}
!1440 = metadata !{i32 1435, i32 0, metadata !734, metadata !1426}
!1441 = metadata !{i32 1436, i32 0, metadata !737, metadata !1426}
!1442 = metadata !{i32 1437, i32 0, metadata !737, metadata !1426}
!1443 = metadata !{i32 1439, i32 0, metadata !740, metadata !1426}
!1444 = metadata !{i32 1440, i32 0, metadata !740, metadata !1426}
!1445 = metadata !{i32 1442, i32 0, metadata !624, metadata !1426}
!1446 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1426} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1447 = metadata !{i32 1443, i32 0, metadata !624, metadata !1426}
!1448 = metadata !{i32 1444, i32 0, metadata !624, metadata !1426}
!1449 = metadata !{i32 1445, i32 0, metadata !748, metadata !1426}
!1450 = metadata !{i32 600, i32 0, metadata !1451, null}
!1451 = metadata !{i32 786443, metadata !25, metadata !254, i32 600, i32 0, i32 128} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1452 = metadata !{i32 601, i32 0, metadata !1451, null}
!1453 = metadata !{i32 604, i32 0, metadata !248, null}
!1454 = metadata !{i32 606, i32 0, metadata !255, null}
!1455 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1456} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1456 = metadata !{i32 607, i32 0, metadata !255, null}
!1457 = metadata !{i32 39, i32 0, metadata !666, metadata !1456}
!1458 = metadata !{i32 40, i32 0, metadata !666, metadata !1456}
!1459 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1456} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1460 = metadata !{i32 43, i32 0, metadata !699, metadata !1456}
!1461 = metadata !{i32 46, i32 0, metadata !677, metadata !1456}
!1462 = metadata !{i32 47, i32 0, metadata !675, metadata !1456}
!1463 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1456} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1464 = metadata !{i32 48, i32 0, metadata !674, metadata !1456}
!1465 = metadata !{i32 49, i32 0, metadata !710, metadata !1456}
!1466 = metadata !{i32 609, i32 0, metadata !1467, null}
!1467 = metadata !{i32 786443, metadata !25, metadata !255, i32 609, i32 0, i32 129} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1468 = metadata !{i32 611, i32 0, metadata !1469, null}
!1469 = metadata !{i32 786443, metadata !25, metadata !1467, i32 609, i32 0, i32 130} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1470 = metadata !{i32 612, i32 0, metadata !1469, null}
!1471 = metadata !{i32 613, i32 0, metadata !1469, null}
!1472 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1473} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1473 = metadata !{i32 617, i32 0, metadata !262, null}
!1474 = metadata !{i32 1428, i32 0, metadata !613, metadata !1473}
!1475 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1476} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1476 = metadata !{i32 1429, i32 0, metadata !613, metadata !1473}
!1477 = metadata !{i32 1415, i32 0, metadata !632, metadata !1476}
!1478 = metadata !{i32 1417, i32 0, metadata !632, metadata !1476}
!1479 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1476} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1480 = metadata !{i32 1418, i32 0, metadata !632, metadata !1476}
!1481 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1473} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1482 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1473} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1483 = metadata !{i32 1432, i32 0, metadata !622, metadata !1473}
!1484 = metadata !{i32 1433, i32 0, metadata !621, metadata !1473}
!1485 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1473} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1486 = metadata !{i32 1434, i32 0, metadata !625, metadata !1473}
!1487 = metadata !{i32 1435, i32 0, metadata !734, metadata !1473}
!1488 = metadata !{i32 1436, i32 0, metadata !737, metadata !1473}
!1489 = metadata !{i32 1437, i32 0, metadata !737, metadata !1473}
!1490 = metadata !{i32 1439, i32 0, metadata !740, metadata !1473}
!1491 = metadata !{i32 1440, i32 0, metadata !740, metadata !1473}
!1492 = metadata !{i32 1442, i32 0, metadata !624, metadata !1473}
!1493 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1473} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1494 = metadata !{i32 1443, i32 0, metadata !624, metadata !1473}
!1495 = metadata !{i32 1444, i32 0, metadata !624, metadata !1473}
!1496 = metadata !{i32 1445, i32 0, metadata !748, metadata !1473}
!1497 = metadata !{i32 618, i32 0, metadata !1498, null}
!1498 = metadata !{i32 786443, metadata !25, metadata !262, i32 618, i32 0, i32 132} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1499 = metadata !{i32 619, i32 0, metadata !1498, null}
!1500 = metadata !{i32 622, i32 0, metadata !255, null}
!1501 = metadata !{i32 624, i32 0, metadata !263, null}
!1502 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1503} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1503 = metadata !{i32 625, i32 0, metadata !263, null}
!1504 = metadata !{i32 63, i32 0, metadata !651, metadata !1503}
!1505 = metadata !{i32 64, i32 0, metadata !658, metadata !1503}
!1506 = metadata !{i32 65, i32 0, metadata !657, metadata !1503}
!1507 = metadata !{i32 66, i32 0, metadata !877, metadata !1503}
!1508 = metadata !{i32 627, i32 0, metadata !1509, null}
!1509 = metadata !{i32 786443, metadata !25, metadata !263, i32 627, i32 0, i32 133} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1510 = metadata !{i32 628, i32 0, metadata !1511, null}
!1511 = metadata !{i32 786443, metadata !25, metadata !1509, i32 627, i32 0, i32 134} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1512 = metadata !{i32 629, i32 0, metadata !1511, null}
!1513 = metadata !{i32 632, i32 0, metadata !269, null}
!1514 = metadata !{i32 633, i32 0, metadata !1515, null}
!1515 = metadata !{i32 786443, metadata !25, metadata !269, i32 632, i32 0, i32 136} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1516 = metadata !{i32 634, i32 0, metadata !1515, null}
!1517 = metadata !{i32 635, i32 0, metadata !1515, null}
!1518 = metadata !{i32 637, i32 0, metadata !268, null}
!1519 = metadata !{i32 638, i32 0, metadata !1520, null}
!1520 = metadata !{i32 786443, metadata !25, metadata !268, i32 638, i32 0, i32 138} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1521 = metadata !{i32 639, i32 0, metadata !1520, null}
!1522 = metadata !{i32 642, i32 0, metadata !263, null}
!1523 = metadata !{i32 658, i32 0, metadata !270, null}
!1524 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1525} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1525 = metadata !{i32 661, i32 0, metadata !270, null}
!1526 = metadata !{i32 39, i32 0, metadata !666, metadata !1525}
!1527 = metadata !{i32 40, i32 0, metadata !666, metadata !1525}
!1528 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1525} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1529 = metadata !{i32 43, i32 0, metadata !699, metadata !1525}
!1530 = metadata !{i32 46, i32 0, metadata !677, metadata !1525}
!1531 = metadata !{i32 47, i32 0, metadata !675, metadata !1525}
!1532 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1525} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1533 = metadata !{i32 48, i32 0, metadata !674, metadata !1525}
!1534 = metadata !{i32 49, i32 0, metadata !710, metadata !1525}
!1535 = metadata !{i32 51, i32 0, metadata !674, metadata !1525}
!1536 = metadata !{i32 663, i32 0, metadata !270, null}
!1537 = metadata !{i32 664, i32 0, metadata !1538, null}
!1538 = metadata !{i32 786443, metadata !25, metadata !270, i32 664, i32 0, i32 139} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1539 = metadata !{metadata !702, metadata !704, i64 88}
!1540 = metadata !{i32 665, i32 0, metadata !1541, null}
!1541 = metadata !{i32 786443, metadata !25, metadata !1538, i32 664, i32 0, i32 140} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1542 = metadata !{i32 666, i32 0, metadata !1541, null}
!1543 = metadata !{i32 667, i32 0, metadata !1541, null}
!1544 = metadata !{i32 670, i32 0, metadata !279, null}
!1545 = metadata !{i32 786689, metadata !645, metadata !"df", metadata !26, i32 16777861, metadata !37, i32 0, metadata !1546} ; [ DW_TAG_arg_variable ] [df] [line 645]
!1546 = metadata !{i32 671, i32 0, metadata !1547, null}
!1547 = metadata !{i32 786443, metadata !25, metadata !279, i32 670, i32 0, i32 142} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1548 = metadata !{i32 645, i32 0, metadata !645, metadata !1546}
!1549 = metadata !{i32 786689, metadata !645, metadata !"mode", metadata !26, i32 33555077, metadata !92, i32 0, metadata !1546} ; [ DW_TAG_arg_variable ] [mode] [line 645]
!1550 = metadata !{i32 646, i32 0, metadata !1551, metadata !1546}
!1551 = metadata !{i32 786443, metadata !25, metadata !645, i32 646, i32 0, i32 368} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1552 = metadata !{metadata !714, metadata !703, i64 28}
!1553 = metadata !{i32 647, i32 0, metadata !1554, metadata !1546}
!1554 = metadata !{i32 786443, metadata !25, metadata !1555, i32 647, i32 0, i32 370} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1555 = metadata !{i32 786443, metadata !25, metadata !1551, i32 646, i32 0, i32 369} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1556 = metadata !{metadata !714, metadata !703, i64 32}
!1557 = metadata !{i32 648, i32 0, metadata !1554, metadata !1546}
!1558 = metadata !{i32 649, i32 0, metadata !1555, metadata !1546}
!1559 = metadata !{i32 651, i32 0, metadata !1555, metadata !1546}
!1560 = metadata !{i32 653, i32 0, metadata !1561, metadata !1546}
!1561 = metadata !{i32 786443, metadata !25, metadata !1551, i32 652, i32 0, i32 371} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1562 = metadata !{i32 654, i32 0, metadata !1561, metadata !1546}
!1563 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1564} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1564 = metadata !{i32 673, i32 0, metadata !278, null}
!1565 = metadata !{i32 1428, i32 0, metadata !613, metadata !1564}
!1566 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1567} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1567 = metadata !{i32 1429, i32 0, metadata !613, metadata !1564}
!1568 = metadata !{i32 1415, i32 0, metadata !632, metadata !1567}
!1569 = metadata !{i32 1417, i32 0, metadata !632, metadata !1567}
!1570 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1567} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1571 = metadata !{i32 1418, i32 0, metadata !632, metadata !1567}
!1572 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1564} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1573 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1564} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1574 = metadata !{i32 1432, i32 0, metadata !622, metadata !1564}
!1575 = metadata !{i32 1433, i32 0, metadata !621, metadata !1564}
!1576 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1564} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1577 = metadata !{i32 1434, i32 0, metadata !625, metadata !1564}
!1578 = metadata !{i32 1435, i32 0, metadata !734, metadata !1564}
!1579 = metadata !{i32 1436, i32 0, metadata !737, metadata !1564}
!1580 = metadata !{i32 1437, i32 0, metadata !737, metadata !1564}
!1581 = metadata !{i32 1439, i32 0, metadata !740, metadata !1564}
!1582 = metadata !{i32 1440, i32 0, metadata !740, metadata !1564}
!1583 = metadata !{i32 1442, i32 0, metadata !624, metadata !1564}
!1584 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1564} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1585 = metadata !{i32 1443, i32 0, metadata !624, metadata !1564}
!1586 = metadata !{i32 1444, i32 0, metadata !624, metadata !1564}
!1587 = metadata !{i32 1445, i32 0, metadata !748, metadata !1564}
!1588 = metadata !{i32 674, i32 0, metadata !1589, null}
!1589 = metadata !{i32 786443, metadata !25, metadata !278, i32 674, i32 0, i32 144} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1590 = metadata !{i32 675, i32 0, metadata !1589, null}
!1591 = metadata !{i32 678, i32 0, metadata !270, null}
!1592 = metadata !{i32 680, i32 0, metadata !280, null}
!1593 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1594} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1594 = metadata !{i32 683, i32 0, metadata !280, null}
!1595 = metadata !{i32 63, i32 0, metadata !651, metadata !1594}
!1596 = metadata !{i32 64, i32 0, metadata !658, metadata !1594}
!1597 = metadata !{i32 65, i32 0, metadata !657, metadata !1594}
!1598 = metadata !{i32 66, i32 0, metadata !877, metadata !1594}
!1599 = metadata !{i32 685, i32 0, metadata !1600, null}
!1600 = metadata !{i32 786443, metadata !25, metadata !280, i32 685, i32 0, i32 145} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1601 = metadata !{i32 686, i32 0, metadata !1602, null}
!1602 = metadata !{i32 786443, metadata !25, metadata !1600, i32 685, i32 0, i32 146} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1603 = metadata !{i32 687, i32 0, metadata !1602, null}
!1604 = metadata !{i32 690, i32 0, metadata !280, null}
!1605 = metadata !{i32 691, i32 0, metadata !1606, null}
!1606 = metadata !{i32 786443, metadata !25, metadata !280, i32 691, i32 0, i32 147} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1607 = metadata !{metadata !702, metadata !704, i64 96}
!1608 = metadata !{i32 692, i32 0, metadata !1609, null}
!1609 = metadata !{i32 786443, metadata !25, metadata !1606, i32 691, i32 0, i32 148} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1610 = metadata !{i32 693, i32 0, metadata !1609, null}
!1611 = metadata !{i32 694, i32 0, metadata !1609, null}
!1612 = metadata !{i32 697, i32 0, metadata !289, null}
!1613 = metadata !{i32 786689, metadata !645, metadata !"df", metadata !26, i32 16777861, metadata !37, i32 0, metadata !1614} ; [ DW_TAG_arg_variable ] [df] [line 645]
!1614 = metadata !{i32 698, i32 0, metadata !1615, null}
!1615 = metadata !{i32 786443, metadata !25, metadata !289, i32 697, i32 0, i32 150} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1616 = metadata !{i32 645, i32 0, metadata !645, metadata !1614}
!1617 = metadata !{i32 786689, metadata !645, metadata !"mode", metadata !26, i32 33555077, metadata !92, i32 0, metadata !1614} ; [ DW_TAG_arg_variable ] [mode] [line 645]
!1618 = metadata !{i32 646, i32 0, metadata !1551, metadata !1614}
!1619 = metadata !{i32 647, i32 0, metadata !1554, metadata !1614}
!1620 = metadata !{i32 648, i32 0, metadata !1554, metadata !1614}
!1621 = metadata !{i32 649, i32 0, metadata !1555, metadata !1614}
!1622 = metadata !{i32 651, i32 0, metadata !1555, metadata !1614}
!1623 = metadata !{i32 653, i32 0, metadata !1561, metadata !1614}
!1624 = metadata !{i32 654, i32 0, metadata !1561, metadata !1614}
!1625 = metadata !{i32 700, i32 0, metadata !288, null}
!1626 = metadata !{i32 701, i32 0, metadata !1627, null}
!1627 = metadata !{i32 786443, metadata !25, metadata !288, i32 701, i32 0, i32 152} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1628 = metadata !{i32 702, i32 0, metadata !1627, null}
!1629 = metadata !{i32 705, i32 0, metadata !280, null}
!1630 = metadata !{i32 713, i32 0, metadata !290, null}
!1631 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1632} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1632 = metadata !{i32 714, i32 0, metadata !290, null}
!1633 = metadata !{i32 39, i32 0, metadata !666, metadata !1632}
!1634 = metadata !{i32 40, i32 0, metadata !666, metadata !1632}
!1635 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1632} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1636 = metadata !{i32 43, i32 0, metadata !699, metadata !1632}
!1637 = metadata !{i32 46, i32 0, metadata !677, metadata !1632}
!1638 = metadata !{i32 47, i32 0, metadata !675, metadata !1632}
!1639 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1632} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1640 = metadata !{i32 48, i32 0, metadata !674, metadata !1632}
!1641 = metadata !{i32 49, i32 0, metadata !710, metadata !1632}
!1642 = metadata !{i32 716, i32 0, metadata !302, null}
!1643 = metadata !{%struct.exe_disk_file_t* null}
!1644 = metadata !{i32 786689, metadata !638, metadata !"df", metadata !26, i32 16777923, metadata !37, i32 0, metadata !1645} ; [ DW_TAG_arg_variable ] [df] [line 707]
!1645 = metadata !{i32 717, i32 0, metadata !1646, null}
!1646 = metadata !{i32 786443, metadata !25, metadata !302, i32 716, i32 0, i32 154} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1647 = metadata !{i32 707, i32 0, metadata !638, metadata !1645}
!1648 = metadata !{i32 786689, metadata !638, metadata !"owner", metadata !26, i32 33555139, metadata !293, i32 0, metadata !1645} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!1649 = metadata !{i32 786689, metadata !638, metadata !"group", metadata !26, i32 50332355, metadata !294, i32 0, metadata !1645} ; [ DW_TAG_arg_variable ] [group] [line 707]
!1650 = metadata !{i32 708, i32 0, metadata !638, metadata !1645}
!1651 = metadata !{i32 709, i32 0, metadata !638, metadata !1645}
!1652 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1653} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1653 = metadata !{i32 719, i32 0, metadata !301, null}
!1654 = metadata !{i32 1428, i32 0, metadata !613, metadata !1653}
!1655 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1656} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1656 = metadata !{i32 1429, i32 0, metadata !613, metadata !1653}
!1657 = metadata !{i32 1415, i32 0, metadata !632, metadata !1656}
!1658 = metadata !{i32 1417, i32 0, metadata !632, metadata !1656}
!1659 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1656} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1660 = metadata !{i32 1418, i32 0, metadata !632, metadata !1656}
!1661 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1653} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1662 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1653} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1663 = metadata !{i32 1432, i32 0, metadata !622, metadata !1653}
!1664 = metadata !{i32 1433, i32 0, metadata !621, metadata !1653}
!1665 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1653} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1666 = metadata !{i32 1434, i32 0, metadata !625, metadata !1653}
!1667 = metadata !{i32 1435, i32 0, metadata !734, metadata !1653}
!1668 = metadata !{i32 1436, i32 0, metadata !737, metadata !1653}
!1669 = metadata !{i32 1437, i32 0, metadata !737, metadata !1653}
!1670 = metadata !{i32 1439, i32 0, metadata !740, metadata !1653}
!1671 = metadata !{i32 1440, i32 0, metadata !740, metadata !1653}
!1672 = metadata !{i32 1442, i32 0, metadata !624, metadata !1653}
!1673 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1653} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1674 = metadata !{i32 1443, i32 0, metadata !624, metadata !1653}
!1675 = metadata !{i32 1444, i32 0, metadata !624, metadata !1653}
!1676 = metadata !{i32 1445, i32 0, metadata !748, metadata !1653}
!1677 = metadata !{i32 720, i32 0, metadata !1678, null}
!1678 = metadata !{i32 786443, metadata !25, metadata !301, i32 720, i32 0, i32 156} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1679 = metadata !{i32 721, i32 0, metadata !1678, null}
!1680 = metadata !{i32 724, i32 0, metadata !290, null}
!1681 = metadata !{i32 726, i32 0, metadata !303, null}
!1682 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1683} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1683 = metadata !{i32 727, i32 0, metadata !303, null}
!1684 = metadata !{i32 63, i32 0, metadata !651, metadata !1683}
!1685 = metadata !{i32 64, i32 0, metadata !658, metadata !1683}
!1686 = metadata !{i32 65, i32 0, metadata !657, metadata !1683}
!1687 = metadata !{i32 66, i32 0, metadata !877, metadata !1683}
!1688 = metadata !{i32 729, i32 0, metadata !1689, null}
!1689 = metadata !{i32 786443, metadata !25, metadata !303, i32 729, i32 0, i32 157} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1690 = metadata !{i32 730, i32 0, metadata !1691, null}
!1691 = metadata !{i32 786443, metadata !25, metadata !1689, i32 729, i32 0, i32 158} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1692 = metadata !{i32 731, i32 0, metadata !1691, null}
!1693 = metadata !{i32 734, i32 0, metadata !313, null}
!1694 = metadata !{i32 786689, metadata !638, metadata !"df", metadata !26, i32 16777923, metadata !37, i32 0, metadata !1695} ; [ DW_TAG_arg_variable ] [df] [line 707]
!1695 = metadata !{i32 735, i32 0, metadata !1696, null}
!1696 = metadata !{i32 786443, metadata !25, metadata !313, i32 734, i32 0, i32 160} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1697 = metadata !{i32 707, i32 0, metadata !638, metadata !1695}
!1698 = metadata !{i32 786689, metadata !638, metadata !"owner", metadata !26, i32 33555139, metadata !293, i32 0, metadata !1695} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!1699 = metadata !{i32 786689, metadata !638, metadata !"group", metadata !26, i32 50332355, metadata !294, i32 0, metadata !1695} ; [ DW_TAG_arg_variable ] [group] [line 707]
!1700 = metadata !{i32 708, i32 0, metadata !638, metadata !1695}
!1701 = metadata !{i32 709, i32 0, metadata !638, metadata !1695}
!1702 = metadata !{i32 737, i32 0, metadata !312, null}
!1703 = metadata !{i32 738, i32 0, metadata !1704, null}
!1704 = metadata !{i32 786443, metadata !25, metadata !312, i32 738, i32 0, i32 162} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1705 = metadata !{i32 739, i32 0, metadata !1704, null}
!1706 = metadata !{i32 742, i32 0, metadata !303, null}
!1707 = metadata !{i32 744, i32 0, metadata !314, null}
!1708 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1709} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1709 = metadata !{i32 746, i32 0, metadata !314, null}
!1710 = metadata !{i32 39, i32 0, metadata !666, metadata !1709}
!1711 = metadata !{i32 40, i32 0, metadata !666, metadata !1709}
!1712 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1709} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1713 = metadata !{i32 43, i32 0, metadata !699, metadata !1709}
!1714 = metadata !{i32 46, i32 0, metadata !677, metadata !1709}
!1715 = metadata !{i32 47, i32 0, metadata !675, metadata !1709}
!1716 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1709} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1717 = metadata !{i32 48, i32 0, metadata !674, metadata !1709}
!1718 = metadata !{i32 49, i32 0, metadata !710, metadata !1709}
!1719 = metadata !{i32 748, i32 0, metadata !322, null}
!1720 = metadata !{i32 786689, metadata !638, metadata !"df", metadata !26, i32 16777923, metadata !37, i32 0, metadata !1721} ; [ DW_TAG_arg_variable ] [df] [line 707]
!1721 = metadata !{i32 749, i32 0, metadata !1722, null}
!1722 = metadata !{i32 786443, metadata !25, metadata !322, i32 748, i32 0, i32 164} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1723 = metadata !{i32 707, i32 0, metadata !638, metadata !1721}
!1724 = metadata !{i32 786689, metadata !638, metadata !"owner", metadata !26, i32 33555139, metadata !293, i32 0, metadata !1721} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!1725 = metadata !{i32 786689, metadata !638, metadata !"group", metadata !26, i32 50332355, metadata !294, i32 0, metadata !1721} ; [ DW_TAG_arg_variable ] [group] [line 707]
!1726 = metadata !{i32 708, i32 0, metadata !638, metadata !1721}
!1727 = metadata !{i32 709, i32 0, metadata !638, metadata !1721}
!1728 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1729} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1729 = metadata !{i32 751, i32 0, metadata !321, null}
!1730 = metadata !{i32 1428, i32 0, metadata !613, metadata !1729}
!1731 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1732} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1732 = metadata !{i32 1429, i32 0, metadata !613, metadata !1729}
!1733 = metadata !{i32 1415, i32 0, metadata !632, metadata !1732}
!1734 = metadata !{i32 1417, i32 0, metadata !632, metadata !1732}
!1735 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1732} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1736 = metadata !{i32 1418, i32 0, metadata !632, metadata !1732}
!1737 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1729} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1738 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1729} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1739 = metadata !{i32 1432, i32 0, metadata !622, metadata !1729}
!1740 = metadata !{i32 1433, i32 0, metadata !621, metadata !1729}
!1741 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1729} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1742 = metadata !{i32 1434, i32 0, metadata !625, metadata !1729}
!1743 = metadata !{i32 1435, i32 0, metadata !734, metadata !1729}
!1744 = metadata !{i32 1436, i32 0, metadata !737, metadata !1729}
!1745 = metadata !{i32 1437, i32 0, metadata !737, metadata !1729}
!1746 = metadata !{i32 1439, i32 0, metadata !740, metadata !1729}
!1747 = metadata !{i32 1440, i32 0, metadata !740, metadata !1729}
!1748 = metadata !{i32 1442, i32 0, metadata !624, metadata !1729}
!1749 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1729} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1750 = metadata !{i32 1443, i32 0, metadata !624, metadata !1729}
!1751 = metadata !{i32 1444, i32 0, metadata !624, metadata !1729}
!1752 = metadata !{i32 1445, i32 0, metadata !748, metadata !1729}
!1753 = metadata !{i32 752, i32 0, metadata !1754, null}
!1754 = metadata !{i32 786443, metadata !25, metadata !321, i32 752, i32 0, i32 166} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1755 = metadata !{i32 753, i32 0, metadata !1754, null}
!1756 = metadata !{i32 756, i32 0, metadata !314, null}
!1757 = metadata !{i32 758, i32 0, metadata !323, null}
!1758 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1759} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1759 = metadata !{i32 759, i32 0, metadata !323, null}
!1760 = metadata !{i32 63, i32 0, metadata !651, metadata !1759}
!1761 = metadata !{i32 64, i32 0, metadata !658, metadata !1759}
!1762 = metadata !{i32 65, i32 0, metadata !657, metadata !1759}
!1763 = metadata !{i32 66, i32 0, metadata !877, metadata !1759}
!1764 = metadata !{i32 761, i32 0, metadata !1765, null}
!1765 = metadata !{i32 786443, metadata !25, metadata !323, i32 761, i32 0, i32 167} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1766 = metadata !{i32 762, i32 0, metadata !1767, null}
!1767 = metadata !{i32 786443, metadata !25, metadata !1765, i32 761, i32 0, i32 168} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1768 = metadata !{i32 763, i32 0, metadata !1767, null}
!1769 = metadata !{i32 766, i32 0, metadata !332, null}
!1770 = metadata !{i32 768, i32 0, metadata !331, null}
!1771 = metadata !{i32 772, i32 0, metadata !1772, null}
!1772 = metadata !{i32 786443, metadata !25, metadata !331, i32 772, i32 0, i32 171} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1773 = metadata !{i32 773, i32 0, metadata !1772, null}
!1774 = metadata !{i32 777, i32 0, metadata !323, null}
!1775 = metadata !{i32 778, i32 0, metadata !323, null}
!1776 = metadata !{i32 779, i32 0, metadata !323, null}
!1777 = metadata !{i32 781, i32 0, metadata !333, null}
!1778 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1779} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1779 = metadata !{i32 783, i32 0, metadata !333, null}
!1780 = metadata !{i32 63, i32 0, metadata !651, metadata !1779}
!1781 = metadata !{i32 64, i32 0, metadata !658, metadata !1779}
!1782 = metadata !{i32 65, i32 0, metadata !657, metadata !1779}
!1783 = metadata !{i32 66, i32 0, metadata !877, metadata !1779}
!1784 = metadata !{i32 785, i32 0, metadata !333, null}
!1785 = metadata !{i32 787, i32 0, metadata !1786, null}
!1786 = metadata !{i32 786443, metadata !25, metadata !333, i32 787, i32 0, i32 172} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1787 = metadata !{i32 788, i32 0, metadata !1788, null}
!1788 = metadata !{i32 786443, metadata !25, metadata !1786, i32 787, i32 0, i32 173} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1789 = metadata !{i32 789, i32 0, metadata !1788, null}
!1790 = metadata !{i32 792, i32 0, metadata !1791, null}
!1791 = metadata !{i32 786443, metadata !25, metadata !333, i32 792, i32 0, i32 174} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1792 = metadata !{metadata !702, metadata !704, i64 72}
!1793 = metadata !{i32 793, i32 0, metadata !1794, null}
!1794 = metadata !{i32 786443, metadata !25, metadata !1791, i32 792, i32 0, i32 175} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1795 = metadata !{i32 794, i32 0, metadata !1794, null}
!1796 = metadata !{i32 795, i32 0, metadata !1794, null}
!1797 = metadata !{i32 798, i32 0, metadata !342, null}
!1798 = metadata !{i32 799, i32 0, metadata !1799, null}
!1799 = metadata !{i32 786443, metadata !25, metadata !342, i32 798, i32 0, i32 177} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1800 = metadata !{i32 800, i32 0, metadata !1799, null}
!1801 = metadata !{i32 801, i32 0, metadata !1799, null}
!1802 = metadata !{i32 804, i32 0, metadata !341, null}
!1803 = metadata !{i32 808, i32 0, metadata !1804, null}
!1804 = metadata !{i32 786443, metadata !25, metadata !341, i32 808, i32 0, i32 179} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1805 = metadata !{i32 809, i32 0, metadata !1804, null}
!1806 = metadata !{i32 812, i32 0, metadata !333, null}
!1807 = metadata !{i32 814, i32 0, metadata !343, null}
!1808 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1809} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1809 = metadata !{i32 815, i32 0, metadata !343, null}
!1810 = metadata !{i32 63, i32 0, metadata !651, metadata !1809}
!1811 = metadata !{i32 64, i32 0, metadata !658, metadata !1809}
!1812 = metadata !{i32 65, i32 0, metadata !657, metadata !1809}
!1813 = metadata !{i32 66, i32 0, metadata !877, metadata !1809}
!1814 = metadata !{i32 817, i32 0, metadata !1815, null}
!1815 = metadata !{i32 786443, metadata !25, metadata !343, i32 817, i32 0, i32 180} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1816 = metadata !{i32 818, i32 0, metadata !1817, null}
!1817 = metadata !{i32 786443, metadata !25, metadata !1815, i32 817, i32 0, i32 181} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1818 = metadata !{i32 819, i32 0, metadata !1817, null}
!1819 = metadata !{i32 822, i32 0, metadata !369, null}
!1820 = metadata !{i32 823, i32 0, metadata !1821, null}
!1821 = metadata !{i32 786443, metadata !25, metadata !369, i32 822, i32 0, i32 183} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1822 = metadata !{i32 824, i32 0, metadata !1821, null}
!1823 = metadata !{i32 825, i32 0, metadata !1821, null}
!1824 = metadata !{i32 827, i32 0, metadata !367, null}
!1825 = metadata !{i32 829, i32 0, metadata !366, null}
!1826 = metadata !{i32 832, i32 0, metadata !366, null}
!1827 = metadata !{i32 833, i32 0, metadata !1828, null}
!1828 = metadata !{i32 786443, metadata !25, metadata !366, i32 833, i32 0, i32 187} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1829 = metadata !{i32 838, i32 0, metadata !374, null}
!1830 = metadata !{i32 835, i32 0, metadata !1831, null}
!1831 = metadata !{i32 786443, metadata !25, metadata !1828, i32 834, i32 0, i32 188} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1832 = metadata !{i32 836, i32 0, metadata !1831, null}
!1833 = metadata !{i32 839, i32 0, metadata !373, null}
!1834 = metadata !{i32 840, i32 0, metadata !373, null}
!1835 = metadata !{metadata !1836, metadata !715, i64 0}
!1836 = metadata !{metadata !"dirent64", metadata !715, i64 0, metadata !715, i64 8, metadata !1837, i64 16, metadata !695, i64 18, metadata !695, i64 19}
!1837 = metadata !{metadata !"short", metadata !695, i64 0}
!1838 = metadata !{i32 841, i32 0, metadata !373, null}
!1839 = metadata !{metadata !1836, metadata !1837, i64 16}
!1840 = metadata !{i32 842, i32 0, metadata !373, null}
!1841 = metadata !{metadata !1836, metadata !695, i64 18}
!1842 = metadata !{i32 843, i32 0, metadata !373, null}
!1843 = metadata !{i32 844, i32 0, metadata !373, null}
!1844 = metadata !{i32 845, i32 0, metadata !373, null}
!1845 = metadata !{metadata !1836, metadata !715, i64 8}
!1846 = metadata !{i32 846, i32 0, metadata !373, null}
!1847 = metadata !{i32 847, i32 0, metadata !373, null}
!1848 = metadata !{i32 851, i32 0, metadata !366, null}
!1849 = metadata !{i32 852, i32 0, metadata !366, null}
!1850 = metadata !{i32 853, i32 0, metadata !366, null}
!1851 = metadata !{i32 854, i32 0, metadata !366, null}
!1852 = metadata !{i32 855, i32 0, metadata !366, null}
!1853 = metadata !{i32 856, i32 0, metadata !366, null}
!1854 = metadata !{i32 857, i32 0, metadata !366, null}
!1855 = metadata !{i32 858, i32 0, metadata !366, null}
!1856 = metadata !{i32 860, i32 0, metadata !366, null}
!1857 = metadata !{i32 862, i32 0, metadata !376, null}
!1858 = metadata !{i32 864, i32 0, metadata !376, null}
!1859 = metadata !{i32 873, i32 0, metadata !376, null}
!1860 = metadata !{i32 874, i32 0, metadata !376, null}
!1861 = metadata !{i32 875, i32 0, metadata !376, null}
!1862 = metadata !{i32 876, i32 0, metadata !376, null}
!1863 = metadata !{i32 877, i32 0, metadata !381, null}
!1864 = metadata !{i32 878, i32 0, metadata !1865, null}
!1865 = metadata !{i32 786443, metadata !25, metadata !381, i32 877, i32 0, i32 193} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1866 = metadata !{i32 879, i32 0, metadata !1865, null}
!1867 = metadata !{i32 880, i32 0, metadata !380, null}
!1868 = metadata !{i32 881, i32 0, metadata !380, null}
!1869 = metadata !{i32 885, i32 0, metadata !380, null}
!1870 = metadata !{i32 886, i32 0, metadata !383, null}
!1871 = metadata !{i32 887, i32 0, metadata !383, null}
!1872 = metadata !{i32 888, i32 0, metadata !383, null}
!1873 = metadata !{i32 895, i32 0, metadata !343, null}
!1874 = metadata !{i32 898, i32 0, metadata !384, null}
!1875 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1876} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1876 = metadata !{i32 902, i32 0, metadata !384, null}
!1877 = metadata !{i32 63, i32 0, metadata !651, metadata !1876}
!1878 = metadata !{i32 64, i32 0, metadata !658, metadata !1876}
!1879 = metadata !{i32 65, i32 0, metadata !657, metadata !1876}
!1880 = metadata !{i32 66, i32 0, metadata !877, metadata !1876}
!1881 = metadata !{i32 903, i32 0, metadata !384, null}
!1882 = metadata !{i32 910, i32 0, metadata !1883, null}
!1883 = metadata !{i32 786443, metadata !25, metadata !384, i32 910, i32 0, i32 196} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1884 = metadata !{i32 911, i32 0, metadata !1885, null}
!1885 = metadata !{i32 786443, metadata !25, metadata !1883, i32 910, i32 0, i32 197} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1886 = metadata !{i32 912, i32 0, metadata !1885, null}
!1887 = metadata !{i32 915, i32 0, metadata !384, null}
!1888 = metadata !{i32 916, i32 0, metadata !384, null}
!1889 = metadata !{i32 917, i32 0, metadata !384, null}
!1890 = metadata !{i32 919, i32 0, metadata !408, null}
!1891 = metadata !{i32 920, i32 0, metadata !407, null}
!1892 = metadata !{i32 922, i32 0, metadata !407, null}
!1893 = metadata !{i32 926, i32 0, metadata !410, null}
!1894 = metadata !{i32 929, i32 0, metadata !1895, null}
!1895 = metadata !{i32 786443, metadata !25, metadata !410, i32 929, i32 0, i32 202} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1896 = metadata !{metadata !1897, metadata !703, i64 24}
!1897 = metadata !{metadata !"stat", metadata !715, i64 0, metadata !715, i64 8, metadata !715, i64 16, metadata !703, i64 24, metadata !703, i64 28, metadata !703, i64 32, metadata !703, i64 36, metadata !715, i64 40, metadata !715, i64 48, metadata !715, i64 56, metadata !715, i64 64, metadata !716, i64 72, metadata !716, i64 88, metadata !716, i64 104, metadata !695, i64 120}
!1898 = metadata !{i32 932, i32 0, metadata !1899, null}
!1899 = metadata !{i32 786443, metadata !25, metadata !1895, i32 929, i32 0, i32 203} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1900 = metadata !{metadata !1901, metadata !703, i64 0}
!1901 = metadata !{metadata !"termios", metadata !703, i64 0, metadata !703, i64 4, metadata !703, i64 8, metadata !703, i64 12, metadata !695, i64 16, metadata !695, i64 17, metadata !703, i64 52, metadata !703, i64 56}
!1902 = metadata !{i32 933, i32 0, metadata !1899, null}
!1903 = metadata !{metadata !1901, metadata !703, i64 4}
!1904 = metadata !{i32 934, i32 0, metadata !1899, null}
!1905 = metadata !{metadata !1901, metadata !703, i64 8}
!1906 = metadata !{i32 935, i32 0, metadata !1899, null}
!1907 = metadata !{metadata !1901, metadata !703, i64 12}
!1908 = metadata !{i32 936, i32 0, metadata !1899, null}
!1909 = metadata !{metadata !1901, metadata !695, i64 16}
!1910 = metadata !{i32 937, i32 0, metadata !1899, null}
!1911 = metadata !{i32 938, i32 0, metadata !1899, null}
!1912 = metadata !{i32 939, i32 0, metadata !1899, null}
!1913 = metadata !{i32 940, i32 0, metadata !1899, null}
!1914 = metadata !{i32 941, i32 0, metadata !1899, null}
!1915 = metadata !{i32 942, i32 0, metadata !1899, null}
!1916 = metadata !{i32 943, i32 0, metadata !1899, null}
!1917 = metadata !{i32 944, i32 0, metadata !1899, null}
!1918 = metadata !{i32 945, i32 0, metadata !1899, null}
!1919 = metadata !{i32 946, i32 0, metadata !1899, null}
!1920 = metadata !{i32 947, i32 0, metadata !1899, null}
!1921 = metadata !{i32 948, i32 0, metadata !1899, null}
!1922 = metadata !{i32 949, i32 0, metadata !1899, null}
!1923 = metadata !{i32 950, i32 0, metadata !1899, null}
!1924 = metadata !{i32 951, i32 0, metadata !1899, null}
!1925 = metadata !{i32 952, i32 0, metadata !1899, null}
!1926 = metadata !{i32 953, i32 0, metadata !1899, null}
!1927 = metadata !{i32 954, i32 0, metadata !1899, null}
!1928 = metadata !{i32 955, i32 0, metadata !1899, null}
!1929 = metadata !{i32 956, i32 0, metadata !1899, null}
!1930 = metadata !{i32 958, i32 0, metadata !1931, null}
!1931 = metadata !{i32 786443, metadata !25, metadata !1895, i32 957, i32 0, i32 204} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1932 = metadata !{i32 959, i32 0, metadata !1931, null}
!1933 = metadata !{i32 964, i32 0, metadata !1934, null}
!1934 = metadata !{i32 786443, metadata !25, metadata !411, i32 962, i32 0, i32 205} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1935 = metadata !{i32 965, i32 0, metadata !1936, null}
!1936 = metadata !{i32 786443, metadata !25, metadata !1934, i32 965, i32 0, i32 206} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1937 = metadata !{i32 968, i32 0, metadata !1938, null}
!1938 = metadata !{i32 786443, metadata !25, metadata !1936, i32 967, i32 0, i32 208} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1939 = metadata !{i32 969, i32 0, metadata !1938, null}
!1940 = metadata !{i32 974, i32 0, metadata !1941, null}
!1941 = metadata !{i32 786443, metadata !25, metadata !411, i32 972, i32 0, i32 209} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1942 = metadata !{i32 975, i32 0, metadata !1943, null}
!1943 = metadata !{i32 786443, metadata !25, metadata !1941, i32 975, i32 0, i32 210} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1944 = metadata !{i32 978, i32 0, metadata !1945, null}
!1945 = metadata !{i32 786443, metadata !25, metadata !1943, i32 977, i32 0, i32 212} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1946 = metadata !{i32 979, i32 0, metadata !1945, null}
!1947 = metadata !{i32 984, i32 0, metadata !1948, null}
!1948 = metadata !{i32 786443, metadata !25, metadata !411, i32 982, i32 0, i32 213} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1949 = metadata !{i32 985, i32 0, metadata !1950, null}
!1950 = metadata !{i32 786443, metadata !25, metadata !1948, i32 985, i32 0, i32 214} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1951 = metadata !{i32 988, i32 0, metadata !1952, null}
!1952 = metadata !{i32 786443, metadata !25, metadata !1950, i32 987, i32 0, i32 216} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1953 = metadata !{i32 989, i32 0, metadata !1952, null}
!1954 = metadata !{i32 994, i32 0, metadata !431, null}
!1955 = metadata !{metadata !1956, metadata !1837, i64 0}
!1956 = metadata !{metadata !"winsize", metadata !1837, i64 0, metadata !1837, i64 2, metadata !1837, i64 4, metadata !1837, i64 6}
!1957 = metadata !{i32 995, i32 0, metadata !431, null}
!1958 = metadata !{metadata !1956, metadata !1837, i64 2}
!1959 = metadata !{i32 996, i32 0, metadata !431, null}
!1960 = metadata !{i32 997, i32 0, metadata !1961, null}
!1961 = metadata !{i32 786443, metadata !25, metadata !431, i32 997, i32 0, i32 218} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1962 = metadata !{i32 1000, i32 0, metadata !1963, null}
!1963 = metadata !{i32 786443, metadata !25, metadata !1961, i32 999, i32 0, i32 220} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1964 = metadata !{i32 1001, i32 0, metadata !1963, null}
!1965 = metadata !{i32 1006, i32 0, metadata !1966, null}
!1966 = metadata !{i32 786443, metadata !25, metadata !411, i32 1004, i32 0, i32 221} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1967 = metadata !{i32 1007, i32 0, metadata !1968, null}
!1968 = metadata !{i32 786443, metadata !25, metadata !1966, i32 1007, i32 0, i32 222} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1969 = metadata !{i32 1008, i32 0, metadata !1970, null}
!1970 = metadata !{i32 786443, metadata !25, metadata !1968, i32 1007, i32 0, i32 223} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1971 = metadata !{i32 1009, i32 0, metadata !1970, null}
!1972 = metadata !{i32 1011, i32 0, metadata !1973, null}
!1973 = metadata !{i32 786443, metadata !25, metadata !1968, i32 1010, i32 0, i32 224} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1974 = metadata !{i32 1012, i32 0, metadata !1973, null}
!1975 = metadata !{i32 1016, i32 0, metadata !441, null}
!1976 = metadata !{i32 1017, i32 0, metadata !441, null}
!1977 = metadata !{i32 1018, i32 0, metadata !1978, null}
!1978 = metadata !{i32 786443, metadata !25, metadata !441, i32 1018, i32 0, i32 226} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1979 = metadata !{i32 1019, i32 0, metadata !1980, null}
!1980 = metadata !{i32 786443, metadata !25, metadata !1981, i32 1019, i32 0, i32 228} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1981 = metadata !{i32 786443, metadata !25, metadata !1978, i32 1018, i32 0, i32 227} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1982 = metadata !{i32 1020, i32 0, metadata !1983, null}
!1983 = metadata !{i32 786443, metadata !25, metadata !1980, i32 1019, i32 0, i32 229} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1984 = metadata !{i32 1021, i32 0, metadata !1983, null}
!1985 = metadata !{i32 1024, i32 0, metadata !1981, null}
!1986 = metadata !{i32 1026, i32 0, metadata !1987, null}
!1987 = metadata !{i32 786443, metadata !25, metadata !1978, i32 1025, i32 0, i32 231} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1988 = metadata !{i32 1027, i32 0, metadata !1987, null}
!1989 = metadata !{i32 1031, i32 0, metadata !1990, null}
!1990 = metadata !{i32 786443, metadata !25, metadata !411, i32 1030, i32 0, i32 232} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1991 = metadata !{i32 1032, i32 0, metadata !1990, null}
!1992 = metadata !{i32 1033, i32 0, metadata !1990, null}
!1993 = metadata !{i32 1036, i32 0, metadata !411, null}
!1994 = metadata !{i32 1037, i32 0, metadata !411, null}
!1995 = metadata !{i32 1038, i32 0, metadata !411, null}
!1996 = metadata !{i32 1041, i32 0, metadata !444, null}
!1997 = metadata !{i32 1042, i32 0, metadata !1998, null}
!1998 = metadata !{i32 786443, metadata !25, metadata !444, i32 1042, i32 0, i32 234} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!1999 = metadata !{i32 1043, i32 0, metadata !1998, null}
!2000 = metadata !{i32 1046, i32 0, metadata !384, null}
!2001 = metadata !{i32 1048, i32 0, metadata !445, null}
!2002 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2003} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2003 = metadata !{i32 1049, i32 0, metadata !445, null}
!2004 = metadata !{i32 63, i32 0, metadata !651, metadata !2003}
!2005 = metadata !{i32 64, i32 0, metadata !658, metadata !2003}
!2006 = metadata !{i32 65, i32 0, metadata !657, metadata !2003}
!2007 = metadata !{i32 66, i32 0, metadata !877, metadata !2003}
!2008 = metadata !{i32 1050, i32 0, metadata !445, null}
!2009 = metadata !{i32 1053, i32 0, metadata !2010, null}
!2010 = metadata !{i32 786443, metadata !25, metadata !445, i32 1053, i32 0, i32 235} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2011 = metadata !{i32 1054, i32 0, metadata !2012, null}
!2012 = metadata !{i32 786443, metadata !25, metadata !2010, i32 1053, i32 0, i32 236} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2013 = metadata !{i32 1055, i32 0, metadata !2012, null}
!2014 = metadata !{i32 1058, i32 0, metadata !2015, null}
!2015 = metadata !{i32 786443, metadata !25, metadata !445, i32 1058, i32 0, i32 237} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2016 = metadata !{i32 1062, i32 0, metadata !2017, null}
!2017 = metadata !{i32 786443, metadata !25, metadata !2015, i32 1061, i32 0, i32 239} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2018 = metadata !{i32 1063, i32 0, metadata !2017, null}
!2019 = metadata !{i32 1064, i32 0, metadata !2017, null}
!2020 = metadata !{i32 1067, i32 0, metadata !458, null}
!2021 = metadata !{i32 1068, i32 0, metadata !457, null}
!2022 = metadata !{i32 1070, i32 0, metadata !455, null}
!2023 = metadata !{i32 1071, i32 0, metadata !2024, null}
!2024 = metadata !{i32 786443, metadata !25, metadata !455, i32 1071, i32 0, i32 244} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2025 = metadata !{i32 1}
!2026 = metadata !{i32 1072, i32 0, metadata !2024, null}
!2027 = metadata !{i32 1073, i32 0, metadata !455, null}
!2028 = metadata !{i32 1076, i32 0, metadata !2029, null}
!2029 = metadata !{i32 786443, metadata !25, metadata !456, i32 1075, i32 0, i32 245} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2030 = metadata !{i32 1077, i32 0, metadata !2031, null}
!2031 = metadata !{i32 786443, metadata !25, metadata !2029, i32 1077, i32 0, i32 246} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2032 = metadata !{i32 1078, i32 0, metadata !2031, null}
!2033 = metadata !{i32 1079, i32 0, metadata !2029, null}
!2034 = metadata !{i32 1091, i32 0, metadata !456, null}
!2035 = metadata !{i32 1092, i32 0, metadata !456, null}
!2036 = metadata !{i32 1093, i32 0, metadata !456, null}
!2037 = metadata !{i32 1096, i32 0, metadata !460, null}
!2038 = metadata !{i32 1097, i32 0, metadata !2039, null}
!2039 = metadata !{i32 786443, metadata !25, metadata !460, i32 1097, i32 0, i32 249} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2040 = metadata !{i32 1098, i32 0, metadata !2039, null}
!2041 = metadata !{i32 1101, i32 0, metadata !445, null}
!2042 = metadata !{i32 1103, i32 0, metadata !461, null}
!2043 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !2044} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2044 = metadata !{i32 1104, i32 0, metadata !461, null}
!2045 = metadata !{i32 39, i32 0, metadata !666, metadata !2044}
!2046 = metadata !{i32 40, i32 0, metadata !666, metadata !2044}
!2047 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !2044} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2048 = metadata !{i32 43, i32 0, metadata !699, metadata !2044}
!2049 = metadata !{i32 46, i32 0, metadata !677, metadata !2044}
!2050 = metadata !{i32 47, i32 0, metadata !675, metadata !2044}
!2051 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !2044} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2052 = metadata !{i32 48, i32 0, metadata !674, metadata !2044}
!2053 = metadata !{i32 49, i32 0, metadata !710, metadata !2044}
!2054 = metadata !{i32 1105, i32 0, metadata !2055, null}
!2055 = metadata !{i32 786443, metadata !25, metadata !461, i32 1105, i32 0, i32 250} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2056 = metadata !{i32 1107, i32 0, metadata !2057, null}
!2057 = metadata !{i32 786443, metadata !25, metadata !2055, i32 1105, i32 0, i32 251} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2058 = metadata !{i32 1108, i32 0, metadata !2057, null}
!2059 = metadata !{i32 1109, i32 0, metadata !2057, null}
!2060 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !2061} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!2061 = metadata !{i32 1113, i32 0, metadata !499, null}
!2062 = metadata !{i32 1428, i32 0, metadata !613, metadata !2061}
!2063 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !2064} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!2064 = metadata !{i32 1429, i32 0, metadata !613, metadata !2061}
!2065 = metadata !{i32 1415, i32 0, metadata !632, metadata !2064}
!2066 = metadata !{i32 1417, i32 0, metadata !632, metadata !2064}
!2067 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !2064} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!2068 = metadata !{i32 1418, i32 0, metadata !632, metadata !2064}
!2069 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !2061} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!2070 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !2061} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!2071 = metadata !{i32 1432, i32 0, metadata !622, metadata !2061}
!2072 = metadata !{i32 1433, i32 0, metadata !621, metadata !2061}
!2073 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !2061} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!2074 = metadata !{i32 1434, i32 0, metadata !625, metadata !2061}
!2075 = metadata !{i32 1435, i32 0, metadata !734, metadata !2061}
!2076 = metadata !{i32 1436, i32 0, metadata !737, metadata !2061}
!2077 = metadata !{i32 1437, i32 0, metadata !737, metadata !2061}
!2078 = metadata !{i32 1439, i32 0, metadata !740, metadata !2061}
!2079 = metadata !{i32 1440, i32 0, metadata !740, metadata !2061}
!2080 = metadata !{i32 1442, i32 0, metadata !624, metadata !2061}
!2081 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !2061} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!2082 = metadata !{i32 1443, i32 0, metadata !624, metadata !2061}
!2083 = metadata !{i32 1444, i32 0, metadata !624, metadata !2061}
!2084 = metadata !{i32 1445, i32 0, metadata !748, metadata !2061}
!2085 = metadata !{i32 1114, i32 0, metadata !2086, null}
!2086 = metadata !{i32 786443, metadata !25, metadata !499, i32 1114, i32 0, i32 253} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2087 = metadata !{i32 1115, i32 0, metadata !2086, null}
!2088 = metadata !{i32 1118, i32 0, metadata !461, null}
!2089 = metadata !{i32 1120, i32 0, metadata !500, null}
!2090 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2091} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2091 = metadata !{i32 1121, i32 0, metadata !500, null}
!2092 = metadata !{i32 63, i32 0, metadata !651, metadata !2091}
!2093 = metadata !{i32 64, i32 0, metadata !658, metadata !2091}
!2094 = metadata !{i32 65, i32 0, metadata !657, metadata !2091}
!2095 = metadata !{i32 66, i32 0, metadata !877, metadata !2091}
!2096 = metadata !{i32 1123, i32 0, metadata !2097, null}
!2097 = metadata !{i32 786443, metadata !25, metadata !500, i32 1123, i32 0, i32 254} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2098 = metadata !{i32 1124, i32 0, metadata !2099, null}
!2099 = metadata !{i32 786443, metadata !25, metadata !2097, i32 1123, i32 0, i32 255} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2100 = metadata !{i32 1125, i32 0, metadata !2099, null}
!2101 = metadata !{i32 1128, i32 0, metadata !509, null}
!2102 = metadata !{i32 1129, i32 0, metadata !2103, null}
!2103 = metadata !{i32 786443, metadata !25, metadata !509, i32 1128, i32 0, i32 257} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2104 = metadata !{i32 1130, i32 0, metadata !2103, null}
!2105 = metadata !{i32 1131, i32 0, metadata !2103, null}
!2106 = metadata !{i32 1133, i32 0, metadata !508, null}
!2107 = metadata !{i32 1134, i32 0, metadata !2108, null}
!2108 = metadata !{i32 786443, metadata !25, metadata !508, i32 1134, i32 0, i32 259} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2109 = metadata !{i32 1135, i32 0, metadata !2108, null}
!2110 = metadata !{i32 1138, i32 0, metadata !500, null}
!2111 = metadata !{i32 1140, i32 0, metadata !510, null}
!2112 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2113} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2113 = metadata !{i32 1141, i32 0, metadata !510, null}
!2114 = metadata !{i32 63, i32 0, metadata !651, metadata !2113}
!2115 = metadata !{i32 64, i32 0, metadata !658, metadata !2113}
!2116 = metadata !{i32 65, i32 0, metadata !657, metadata !2113}
!2117 = metadata !{i32 66, i32 0, metadata !877, metadata !2113}
!2118 = metadata !{i32 1143, i32 0, metadata !517, null}
!2119 = metadata !{i32 1144, i32 0, metadata !2120, null}
!2120 = metadata !{i32 786443, metadata !25, metadata !517, i32 1143, i32 0, i32 261} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2121 = metadata !{i32 1145, i32 0, metadata !2120, null}
!2122 = metadata !{i32 1146, i32 0, metadata !516, null}
!2123 = metadata !{i32 1149, i32 0, metadata !515, null}
!2124 = metadata !{i32 1150, i32 0, metadata !2125, null}
!2125 = metadata !{i32 786443, metadata !25, metadata !515, i32 1150, i32 0, i32 265} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2126 = metadata !{i32 1151, i32 0, metadata !2125, null}
!2127 = metadata !{i32 1154, i32 0, metadata !510, null}
!2128 = metadata !{i32 1156, i32 0, metadata !518, null}
!2129 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2130} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2130 = metadata !{i32 1157, i32 0, metadata !518, null}
!2131 = metadata !{i32 63, i32 0, metadata !651, metadata !2130}
!2132 = metadata !{i32 64, i32 0, metadata !658, metadata !2130}
!2133 = metadata !{i32 65, i32 0, metadata !657, metadata !2130}
!2134 = metadata !{i32 66, i32 0, metadata !877, metadata !2130}
!2135 = metadata !{i32 1159, i32 0, metadata !525, null}
!2136 = metadata !{i32 1160, i32 0, metadata !2137, null}
!2137 = metadata !{i32 786443, metadata !25, metadata !525, i32 1159, i32 0, i32 267} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2138 = metadata !{i32 1161, i32 0, metadata !2137, null}
!2139 = metadata !{i32 1163, i32 0, metadata !524, null}
!2140 = metadata !{i32 1164, i32 0, metadata !2141, null}
!2141 = metadata !{i32 786443, metadata !25, metadata !524, i32 1164, i32 0, i32 269} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2142 = metadata !{i32 786689, metadata !160, metadata !"fd", metadata !26, i32 16777519, metadata !29, i32 0, metadata !2140} ; [ DW_TAG_arg_variable ] [fd] [line 303]
!2143 = metadata !{i32 303, i32 0, metadata !160, metadata !2140}
!2144 = metadata !{i32 786688, metadata !160, metadata !"r", metadata !26, i32 306, metadata !29, i32 0, metadata !2140} ; [ DW_TAG_auto_variable ] [r] [line 306]
!2145 = metadata !{i32 306, i32 0, metadata !160, metadata !2140}
!2146 = metadata !{i32 308, i32 0, metadata !160, metadata !2140}
!2147 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2148} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2148 = metadata !{i32 310, i32 0, metadata !160, metadata !2140}
!2149 = metadata !{i32 63, i32 0, metadata !651, metadata !2148}
!2150 = metadata !{i32 64, i32 0, metadata !658, metadata !2148}
!2151 = metadata !{i32 311, i32 0, metadata !1086, metadata !2140}
!2152 = metadata !{i32 786688, metadata !160, metadata !"f", metadata !26, i32 305, metadata !105, i32 0, metadata !2140} ; [ DW_TAG_auto_variable ] [f] [line 305]
!2153 = metadata !{i32 312, i32 0, metadata !1088, metadata !2140}
!2154 = metadata !{i32 313, i32 0, metadata !1088, metadata !2140}
!2155 = metadata !{i32 316, i32 0, metadata !1091, metadata !2140}
!2156 = metadata !{i32 317, i32 0, metadata !1095, metadata !2140}
!2157 = metadata !{i32 318, i32 0, metadata !1095, metadata !2140}
!2158 = metadata !{i32 319, i32 0, metadata !1095, metadata !2140}
!2159 = metadata !{i32 330, i32 0, metadata !160, metadata !2140}
!2160 = metadata !{i32 332, i32 0, metadata !160, metadata !2140}
!2161 = metadata !{i32 1168, i32 0, metadata !524, null}
!2162 = metadata !{i64 0, i64 4, metadata !752, i64 4, i64 4, metadata !752, i64 8, i64 8, metadata !2163, i64 16, i64 8, metadata !2164}
!2163 = metadata !{metadata !715, metadata !715, i64 0}
!2164 = metadata !{metadata !704, metadata !704, i64 0}
!2165 = metadata !{i32 1170, i32 0, metadata !524, null}
!2166 = metadata !{i32 1177, i32 0, metadata !524, null}
!2167 = metadata !{i32 1179, i32 0, metadata !518, null}
!2168 = metadata !{i32 1181, i32 0, metadata !526, null}
!2169 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2170} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2170 = metadata !{i32 1182, i32 0, metadata !526, null}
!2171 = metadata !{i32 63, i32 0, metadata !651, metadata !2170}
!2172 = metadata !{i32 64, i32 0, metadata !658, metadata !2170}
!2173 = metadata !{i32 65, i32 0, metadata !657, metadata !2170}
!2174 = metadata !{i32 66, i32 0, metadata !877, metadata !2170}
!2175 = metadata !{i32 1183, i32 0, metadata !532, null}
!2176 = metadata !{i32 1184, i32 0, metadata !2177, null}
!2177 = metadata !{i32 786443, metadata !25, metadata !532, i32 1183, i32 0, i32 271} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2178 = metadata !{i32 1185, i32 0, metadata !2177, null}
!2179 = metadata !{i32 1188, i32 0, metadata !2180, null}
!2180 = metadata !{i32 786443, metadata !25, metadata !531, i32 1188, i32 0, i32 273} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2181 = metadata !{i32 1189, i32 0, metadata !2182, null}
!2182 = metadata !{i32 786443, metadata !25, metadata !2180, i32 1189, i32 0, i32 274} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2183 = metadata !{i32 1191, i32 0, metadata !2184, null}
!2184 = metadata !{i32 786443, metadata !25, metadata !531, i32 1191, i32 0, i32 275} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2185 = metadata !{i32 1192, i32 0, metadata !2186, null}
!2186 = metadata !{i32 786443, metadata !25, metadata !2184, i32 1191, i32 0, i32 276} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2187 = metadata !{i32 1193, i32 0, metadata !2186, null}
!2188 = metadata !{i32 1195, i32 0, metadata !2189, null}
!2189 = metadata !{i32 786443, metadata !25, metadata !2184, i32 1194, i32 0, i32 277} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2190 = metadata !{i32 1198, i32 0, metadata !526, null}
!2191 = metadata !{i32 1200, i32 0, metadata !533, null}
!2192 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !2193} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2193 = metadata !{i32 1201, i32 0, metadata !533, null}
!2194 = metadata !{i32 39, i32 0, metadata !666, metadata !2193}
!2195 = metadata !{i32 40, i32 0, metadata !666, metadata !2193}
!2196 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !2193} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2197 = metadata !{i32 43, i32 0, metadata !699, metadata !2193}
!2198 = metadata !{i32 46, i32 0, metadata !677, metadata !2193}
!2199 = metadata !{i32 47, i32 0, metadata !675, metadata !2193}
!2200 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !2193} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2201 = metadata !{i32 48, i32 0, metadata !674, metadata !2193}
!2202 = metadata !{i32 49, i32 0, metadata !710, metadata !2193}
!2203 = metadata !{i32 1202, i32 0, metadata !2204, null}
!2204 = metadata !{i32 786443, metadata !25, metadata !533, i32 1202, i32 0, i32 278} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2205 = metadata !{i32 1204, i32 0, metadata !2206, null}
!2206 = metadata !{i32 786443, metadata !25, metadata !2207, i32 1204, i32 0, i32 280} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2207 = metadata !{i32 786443, metadata !25, metadata !2204, i32 1202, i32 0, i32 279} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2208 = metadata !{i32 1205, i32 0, metadata !2209, null}
!2209 = metadata !{i32 786443, metadata !25, metadata !2206, i32 1204, i32 0, i32 281} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2210 = metadata !{i32 1206, i32 0, metadata !2209, null}
!2211 = metadata !{i32 1208, i32 0, metadata !2212, null}
!2212 = metadata !{i32 786443, metadata !25, metadata !2206, i32 1207, i32 0, i32 282} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2213 = metadata !{i32 1209, i32 0, metadata !2212, null}
!2214 = metadata !{i32 1213, i32 0, metadata !533, null}
!2215 = metadata !{i32 1214, i32 0, metadata !533, null}
!2216 = metadata !{i32 1215, i32 0, metadata !533, null}
!2217 = metadata !{i32 1216, i32 0, metadata !533, null}
!2218 = metadata !{i32 1218, i32 0, metadata !537, null}
!2219 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !2220} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2220 = metadata !{i32 1219, i32 0, metadata !537, null}
!2221 = metadata !{i32 39, i32 0, metadata !666, metadata !2220}
!2222 = metadata !{i32 40, i32 0, metadata !666, metadata !2220}
!2223 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !2220} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2224 = metadata !{i32 43, i32 0, metadata !699, metadata !2220}
!2225 = metadata !{i32 46, i32 0, metadata !677, metadata !2220}
!2226 = metadata !{i32 47, i32 0, metadata !675, metadata !2220}
!2227 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !2220} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2228 = metadata !{i32 48, i32 0, metadata !674, metadata !2220}
!2229 = metadata !{i32 49, i32 0, metadata !710, metadata !2220}
!2230 = metadata !{i32 1220, i32 0, metadata !2231, null}
!2231 = metadata !{i32 786443, metadata !25, metadata !537, i32 1220, i32 0, i32 283} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2232 = metadata !{i32 1222, i32 0, metadata !2233, null}
!2233 = metadata !{i32 786443, metadata !25, metadata !2234, i32 1222, i32 0, i32 285} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2234 = metadata !{i32 786443, metadata !25, metadata !2231, i32 1220, i32 0, i32 284} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2235 = metadata !{i32 1223, i32 0, metadata !2236, null}
!2236 = metadata !{i32 786443, metadata !25, metadata !2233, i32 1222, i32 0, i32 286} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2237 = metadata !{i32 1224, i32 0, metadata !2236, null}
!2238 = metadata !{i32 1225, i32 0, metadata !2239, null}
!2239 = metadata !{i32 786443, metadata !25, metadata !2233, i32 1225, i32 0, i32 287} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2240 = metadata !{i32 1226, i32 0, metadata !2241, null}
!2241 = metadata !{i32 786443, metadata !25, metadata !2239, i32 1225, i32 0, i32 288} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2242 = metadata !{i32 1227, i32 0, metadata !2241, null}
!2243 = metadata !{i32 1229, i32 0, metadata !2244, null}
!2244 = metadata !{i32 786443, metadata !25, metadata !2239, i32 1228, i32 0, i32 289} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2245 = metadata !{i32 1230, i32 0, metadata !2244, null}
!2246 = metadata !{i32 1234, i32 0, metadata !537, null}
!2247 = metadata !{i32 1235, i32 0, metadata !537, null}
!2248 = metadata !{i32 1236, i32 0, metadata !537, null}
!2249 = metadata !{i32 1237, i32 0, metadata !537, null}
!2250 = metadata !{i32 1239, i32 0, metadata !541, null}
!2251 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !2252} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2252 = metadata !{i32 1242, i32 0, metadata !541, null}
!2253 = metadata !{i32 39, i32 0, metadata !666, metadata !2252}
!2254 = metadata !{i32 40, i32 0, metadata !666, metadata !2252}
!2255 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !2252} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2256 = metadata !{i32 43, i32 0, metadata !699, metadata !2252}
!2257 = metadata !{i32 46, i32 0, metadata !677, metadata !2252}
!2258 = metadata !{i32 47, i32 0, metadata !675, metadata !2252}
!2259 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !2252} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2260 = metadata !{i32 48, i32 0, metadata !674, metadata !2252}
!2261 = metadata !{i32 49, i32 0, metadata !710, metadata !2252}
!2262 = metadata !{i32 1243, i32 0, metadata !2263, null}
!2263 = metadata !{i32 786443, metadata !25, metadata !541, i32 1243, i32 0, i32 290} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2264 = metadata !{i32 1245, i32 0, metadata !2265, null}
!2265 = metadata !{i32 786443, metadata !25, metadata !2266, i32 1245, i32 0, i32 292} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2266 = metadata !{i32 786443, metadata !25, metadata !2263, i32 1243, i32 0, i32 291} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2267 = metadata !{i32 1246, i32 0, metadata !2268, null}
!2268 = metadata !{i32 786443, metadata !25, metadata !2265, i32 1245, i32 0, i32 293} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2269 = metadata !{i32 1247, i32 0, metadata !2268, null}
!2270 = metadata !{i32 1248, i32 0, metadata !2271, null}
!2271 = metadata !{i32 786443, metadata !25, metadata !2265, i32 1248, i32 0, i32 294} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2272 = metadata !{i32 1249, i32 0, metadata !2273, null}
!2273 = metadata !{i32 786443, metadata !25, metadata !2271, i32 1248, i32 0, i32 295} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2274 = metadata !{i32 1250, i32 0, metadata !2273, null}
!2275 = metadata !{i32 1252, i32 0, metadata !2276, null}
!2276 = metadata !{i32 786443, metadata !25, metadata !2271, i32 1251, i32 0, i32 296} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2277 = metadata !{i32 1253, i32 0, metadata !2276, null}
!2278 = metadata !{i32 1257, i32 0, metadata !541, null}
!2279 = metadata !{i32 1258, i32 0, metadata !541, null}
!2280 = metadata !{i32 1259, i32 0, metadata !541, null}
!2281 = metadata !{i32 1260, i32 0, metadata !541, null}
!2282 = metadata !{i32 1262, i32 0, metadata !549, null}
!2283 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !2284} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2284 = metadata !{i32 1263, i32 0, metadata !549, null}
!2285 = metadata !{i32 39, i32 0, metadata !666, metadata !2284}
!2286 = metadata !{i32 40, i32 0, metadata !666, metadata !2284}
!2287 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !2284} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2288 = metadata !{i32 43, i32 0, metadata !699, metadata !2284}
!2289 = metadata !{i32 46, i32 0, metadata !677, metadata !2284}
!2290 = metadata !{i32 47, i32 0, metadata !675, metadata !2284}
!2291 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !2284} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2292 = metadata !{i32 48, i32 0, metadata !674, metadata !2284}
!2293 = metadata !{i32 49, i32 0, metadata !710, metadata !2284}
!2294 = metadata !{i32 1264, i32 0, metadata !559, null}
!2295 = metadata !{i32 1267, i32 0, metadata !2296, null}
!2296 = metadata !{i32 786443, metadata !25, metadata !2297, i32 1267, i32 0, i32 299} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2297 = metadata !{i32 786443, metadata !25, metadata !559, i32 1264, i32 0, i32 298} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2298 = metadata !{i32 1268, i32 0, metadata !2299, null}
!2299 = metadata !{i32 786443, metadata !25, metadata !2296, i32 1267, i32 0, i32 300} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2300 = metadata !{i32 1269, i32 0, metadata !2301, null}
!2301 = metadata !{i32 786443, metadata !25, metadata !2299, i32 1269, i32 0, i32 301} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2302 = metadata !{i32 1270, i32 0, metadata !2303, null}
!2303 = metadata !{i32 786443, metadata !25, metadata !2299, i32 1270, i32 0, i32 302} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2304 = metadata !{i32 1271, i32 0, metadata !2305, null}
!2305 = metadata !{i32 786443, metadata !25, metadata !2299, i32 1271, i32 0, i32 303} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2306 = metadata !{i32 1272, i32 0, metadata !2307, null}
!2307 = metadata !{i32 786443, metadata !25, metadata !2299, i32 1272, i32 0, i32 304} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2308 = metadata !{i32 1273, i32 0, metadata !2299, null}
!2309 = metadata !{i32 1275, i32 0, metadata !2310, null}
!2310 = metadata !{i32 786443, metadata !25, metadata !2296, i32 1274, i32 0, i32 305} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2311 = metadata !{i32 1276, i32 0, metadata !2310, null}
!2312 = metadata !{i32 1279, i32 0, metadata !558, null}
!2313 = metadata !{i32 1280, i32 0, metadata !2314, null}
!2314 = metadata !{i32 786443, metadata !25, metadata !558, i32 1280, i32 0, i32 307} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2315 = metadata !{i32 1281, i32 0, metadata !2314, null}
!2316 = metadata !{i32 1282, i32 0, metadata !558, null}
!2317 = metadata !{i32 1284, i32 0, metadata !549, null}
!2318 = metadata !{i32 1294, i32 0, metadata !560, null}
!2319 = metadata !{i32 1295, i32 0, metadata !560, null}
!2320 = metadata !{i32 1296, i32 0, metadata !560, null}
!2321 = metadata !{i32 1297, i32 0, metadata !560, null}
!2322 = metadata !{i32 1299, i32 0, metadata !2323, null}
!2323 = metadata !{i32 786443, metadata !25, metadata !560, i32 1299, i32 0, i32 308} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2324 = metadata !{i32 1300, i32 0, metadata !2325, null}
!2325 = metadata !{i32 786443, metadata !25, metadata !2323, i32 1299, i32 0, i32 309} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2326 = metadata !{i64 0, i64 128, metadata !694}
!2327 = metadata !{i32 1301, i32 0, metadata !2325, null}
!2328 = metadata !{i32 1302, i32 0, metadata !2325, null}
!2329 = metadata !{i32 1303, i32 0, metadata !2330, null}
!2330 = metadata !{i32 786443, metadata !25, metadata !2323, i32 1302, i32 0, i32 310} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2331 = metadata !{i32 1306, i32 0, metadata !2332, null}
!2332 = metadata !{i32 786443, metadata !25, metadata !560, i32 1306, i32 0, i32 311} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2333 = metadata !{i32 1307, i32 0, metadata !2334, null}
!2334 = metadata !{i32 786443, metadata !25, metadata !2332, i32 1306, i32 0, i32 312} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2335 = metadata !{i32 1308, i32 0, metadata !2334, null}
!2336 = metadata !{i32 1309, i32 0, metadata !2334, null}
!2337 = metadata !{i32 1310, i32 0, metadata !2338, null}
!2338 = metadata !{i32 786443, metadata !25, metadata !2332, i32 1309, i32 0, i32 313} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2339 = metadata !{i32 1313, i32 0, metadata !2340, null}
!2340 = metadata !{i32 786443, metadata !25, metadata !560, i32 1313, i32 0, i32 314} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2341 = metadata !{i32 1314, i32 0, metadata !2342, null}
!2342 = metadata !{i32 786443, metadata !25, metadata !2340, i32 1313, i32 0, i32 315} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2343 = metadata !{i32 1315, i32 0, metadata !2342, null}
!2344 = metadata !{i32 1316, i32 0, metadata !2342, null}
!2345 = metadata !{i32 1317, i32 0, metadata !2346, null}
!2346 = metadata !{i32 786443, metadata !25, metadata !2340, i32 1316, i32 0, i32 316} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2347 = metadata !{i32 1320, i32 0, metadata !560, null}
!2348 = metadata !{i32 1321, i32 0, metadata !560, null}
!2349 = metadata !{i32 1322, i32 0, metadata !560, null}
!2350 = metadata !{i32 1325, i32 0, metadata !593, null}
!2351 = metadata !{i32 1326, i32 0, metadata !591, null}
!2352 = metadata !{i32 undef}
!2353 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2354} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2354 = metadata !{i32 1327, i32 0, metadata !590, null}
!2355 = metadata !{i32 63, i32 0, metadata !651, metadata !2354}
!2356 = metadata !{i32 64, i32 0, metadata !658, metadata !2354}
!2357 = metadata !{i32 66, i32 0, metadata !877, metadata !2354}
!2358 = metadata !{i32 65, i32 0, metadata !657, metadata !2354}
!2359 = metadata !{i32 1328, i32 0, metadata !2360, null}
!2360 = metadata !{i32 786443, metadata !25, metadata !590, i32 1328, i32 0, i32 321} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2361 = metadata !{i32 1329, i32 0, metadata !2362, null}
!2362 = metadata !{i32 786443, metadata !25, metadata !2360, i32 1328, i32 0, i32 322} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2363 = metadata !{i32 1330, i32 0, metadata !2362, null}
!2364 = metadata !{i32 1331, i32 0, metadata !2365, null}
!2365 = metadata !{i32 786443, metadata !25, metadata !2360, i32 1331, i32 0, i32 323} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2366 = metadata !{i32 1333, i32 0, metadata !2367, null}
!2367 = metadata !{i32 786443, metadata !25, metadata !2368, i32 1333, i32 0, i32 325} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2368 = metadata !{i32 786443, metadata !25, metadata !2365, i32 1331, i32 0, i32 324} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2369 = metadata !{i32 1334, i32 0, metadata !2370, null}
!2370 = metadata !{i32 786443, metadata !25, metadata !2368, i32 1334, i32 0, i32 326} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2371 = metadata !{i32 1335, i32 0, metadata !2372, null}
!2372 = metadata !{i32 786443, metadata !25, metadata !2368, i32 1335, i32 0, i32 327} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2373 = metadata !{i32 1336, i32 0, metadata !2368, null}
!2374 = metadata !{i32 1337, i32 0, metadata !2368, null}
!2375 = metadata !{i32 1338, i32 0, metadata !2376, null}
!2376 = metadata !{i32 786443, metadata !25, metadata !2377, i32 1338, i32 0, i32 329} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2377 = metadata !{i32 786443, metadata !25, metadata !2365, i32 1337, i32 0, i32 328} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2378 = metadata !{i32 1339, i32 0, metadata !2379, null}
!2379 = metadata !{i32 786443, metadata !25, metadata !2377, i32 1339, i32 0, i32 330} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2380 = metadata !{i32 1340, i32 0, metadata !2381, null}
!2381 = metadata !{i32 786443, metadata !25, metadata !2377, i32 1340, i32 0, i32 331} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2382 = metadata !{i32 1341, i32 0, metadata !2383, null}
!2383 = metadata !{i32 786443, metadata !25, metadata !2377, i32 1341, i32 0, i32 332} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2384 = metadata !{i32 1346, i32 0, metadata !596, null}
!2385 = metadata !{i32 1349, i32 0, metadata !595, null}
!2386 = metadata !{i32 1350, i32 0, metadata !595, null}
!2387 = metadata !{i32 1353, i32 0, metadata !602, null}
!2388 = metadata !{i32 1356, i32 0, metadata !2389, null}
!2389 = metadata !{i32 786443, metadata !25, metadata !2390, i32 1356, i32 0, i32 337} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2390 = metadata !{i32 786443, metadata !25, metadata !602, i32 1353, i32 0, i32 336} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2391 = metadata !{i32 1357, i32 0, metadata !2392, null}
!2392 = metadata !{i32 786443, metadata !25, metadata !2389, i32 1356, i32 0, i32 338} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2393 = metadata !{i32 1358, i32 0, metadata !2392, null}
!2394 = metadata !{i32 1361, i32 0, metadata !601, null}
!2395 = metadata !{i32 1364, i32 0, metadata !600, null}
!2396 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2397} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2397 = metadata !{i32 1365, i32 0, metadata !599, null}
!2398 = metadata !{i32 63, i32 0, metadata !651, metadata !2397}
!2399 = metadata !{i32 64, i32 0, metadata !658, metadata !2397}
!2400 = metadata !{i32 66, i32 0, metadata !877, metadata !2397}
!2401 = metadata !{i32 65, i32 0, metadata !657, metadata !2397}
!2402 = metadata !{i32 1366, i32 0, metadata !2403, null}
!2403 = metadata !{i32 786443, metadata !25, metadata !599, i32 1366, i32 0, i32 342} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2404 = metadata !{i32 1367, i32 0, metadata !2405, null}
!2405 = metadata !{i32 786443, metadata !25, metadata !2406, i32 1367, i32 0, i32 344} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2406 = metadata !{i32 786443, metadata !25, metadata !2403, i32 1366, i32 0, i32 343} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2407 = metadata !{i32 1368, i32 0, metadata !2408, null}
!2408 = metadata !{i32 786443, metadata !25, metadata !2406, i32 1368, i32 0, i32 345} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2409 = metadata !{i32 1369, i32 0, metadata !2410, null}
!2410 = metadata !{i32 786443, metadata !25, metadata !2406, i32 1369, i32 0, i32 346} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2411 = metadata !{i32 1376, i32 0, metadata !560, null}
!2412 = metadata !{i32 1380, i32 0, metadata !603, null}
!2413 = metadata !{i32 1384, i32 0, metadata !603, null}
!2414 = metadata !{i32 1386, i32 0, metadata !2415, null}
!2415 = metadata !{i32 786443, metadata !25, metadata !603, i32 1386, i32 0, i32 347} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2416 = metadata !{metadata !702, metadata !704, i64 80}
!2417 = metadata !{i32 1387, i32 0, metadata !2418, null}
!2418 = metadata !{i32 786443, metadata !25, metadata !2415, i32 1386, i32 0, i32 348} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2419 = metadata !{i32 1388, i32 0, metadata !2418, null}
!2420 = metadata !{i32 1389, i32 0, metadata !2418, null}
!2421 = metadata !{i32 1392, i32 0, metadata !2422, null}
!2422 = metadata !{i32 786443, metadata !25, metadata !603, i32 1392, i32 0, i32 349} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2423 = metadata !{i32 1393, i32 0, metadata !2424, null}
!2424 = metadata !{i32 786443, metadata !25, metadata !2425, i32 1393, i32 0, i32 351} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2425 = metadata !{i32 786443, metadata !25, metadata !2422, i32 1392, i32 0, i32 350} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2426 = metadata !{i64 1024}
!2427 = metadata !{i32 1394, i32 0, metadata !2424, null}
!2428 = metadata !{i32 1395, i32 0, metadata !2425, null}
!2429 = metadata !{i32 1396, i32 0, metadata !2425, null}
!2430 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !2431} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!2431 = metadata !{i32 1398, i32 0, metadata !603, null}
!2432 = metadata !{i32 1415, i32 0, metadata !632, metadata !2431}
!2433 = metadata !{i32 1417, i32 0, metadata !632, metadata !2431}
!2434 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !2431} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!2435 = metadata !{i32 1418, i32 0, metadata !632, metadata !2431}
!2436 = metadata !{i32 786689, metadata !626, metadata !"s", metadata !26, i32 16778638, metadata !173, i32 0, metadata !2437} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!2437 = metadata !{i32 1399, i32 0, metadata !603, null}
!2438 = metadata !{i32 1422, i32 0, metadata !626, metadata !2437}
!2439 = metadata !{i32 1423, i32 0, metadata !626, metadata !2437}
!2440 = metadata !{i32 786688, metadata !626, metadata !"sc", metadata !26, i32 1423, metadata !173, i32 0, metadata !2437} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!2441 = metadata !{i32 1424, i32 0, metadata !626, metadata !2437}
!2442 = metadata !{i32 1403, i32 0, metadata !603, null}
!2443 = metadata !{i32 1404, i32 0, metadata !603, null}
!2444 = metadata !{i32 1405, i32 0, metadata !2445, null}
!2445 = metadata !{i32 786443, metadata !25, metadata !603, i32 1405, i32 0, i32 352} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2446 = metadata !{i32 1406, i32 0, metadata !2447, null}
!2447 = metadata !{i32 786443, metadata !25, metadata !2445, i32 1405, i32 0, i32 353} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2448 = metadata !{i32 1407, i32 0, metadata !2447, null}
!2449 = metadata !{i32 1411, i32 0, metadata !603, null}
!2450 = metadata !{i32 1457, i32 0, metadata !610, null}
!2451 = metadata !{i32 1458, i32 0, metadata !2452, null}
!2452 = metadata !{i32 786443, metadata !25, metadata !610, i32 1458, i32 0, i32 354} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2453 = metadata !{i32 1459, i32 0, metadata !2454, null}
!2454 = metadata !{i32 786443, metadata !25, metadata !2452, i32 1458, i32 0, i32 355} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2455 = metadata !{i32 1460, i32 0, metadata !2454, null}
!2456 = metadata !{i32 1463, i32 0, metadata !2457, null}
!2457 = metadata !{i32 786443, metadata !25, metadata !610, i32 1463, i32 0, i32 356} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.c]
!2458 = metadata !{i32 1467, i32 0, metadata !610, null}
!2459 = metadata !{i32 1468, i32 0, metadata !610, null}
!2460 = metadata !{i32 1469, i32 0, metadata !610, null}
!2461 = metadata !{i32 1470, i32 0, metadata !610, null}
