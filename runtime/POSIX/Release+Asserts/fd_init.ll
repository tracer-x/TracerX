; ModuleID = 'fd_init.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.exe_file_t = type { i32, i32, i64, %struct.exe_disk_file_t* }
%struct.exe_disk_file_t = type { i32, i8*, %struct.stat64* }
%struct.stat64 = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.exe_file_system_t = type { i32, %struct.exe_disk_file_t*, %struct.exe_disk_file_t*, i32, %struct.exe_disk_file_t*, i32, i32*, i32*, i32*, i32*, i32*, i32*, i32* }

@__exe_env = global { [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] } { [32 x %struct.exe_file_t] [%struct.exe_file_t { i32 0, i32 5, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t { i32 1, i32 9, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t { i32 2, i32 9, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer], i32 18, i32 0, i32 0, [4 x i8] undef }, align 8
@klee_init_fds.name = private unnamed_addr constant [7 x i8] c"?-data\00", align 1
@.str = private unnamed_addr constant [2 x i8] c".\00", align 1
@__exe_fs = common global %struct.exe_file_system_t zeroinitializer, align 8
@.str1 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"read_fail\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"write_fail\00", align 1
@.str4 = private unnamed_addr constant [11 x i8] c"close_fail\00", align 1
@.str5 = private unnamed_addr constant [15 x i8] c"ftruncate_fail\00", align 1
@.str6 = private unnamed_addr constant [12 x i8] c"getcwd_fail\00", align 1
@.str7 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1
@.str8 = private unnamed_addr constant [14 x i8] c"model_version\00", align 1
@.str9 = private unnamed_addr constant [6 x i8] c"-stat\00", align 1
@.str10 = private unnamed_addr constant [5 x i8] c"size\00", align 1
@.str11 = private unnamed_addr constant [10 x i8] c"fd_init.c\00", align 1
@__PRETTY_FUNCTION__.__create_new_dfile = private unnamed_addr constant [88 x i8] c"void __create_new_dfile(exe_disk_file_t *, unsigned int, const char *, struct stat64 *)\00", align 1

; Function Attrs: nounwind uwtable
define void @klee_init_fds(i32 %n_files, i32 %file_length, i32 %stdin_length, i32 %sym_stdout_flag, i32 %save_all_writes_flag, i32 %max_failures) #0 {
  %x.i = alloca i32, align 4
  %name = alloca [7 x i8], align 1
  %s = alloca %struct.stat64, align 8
  call void @llvm.dbg.value(metadata !{i32 %n_files}, i64 0, metadata !12), !dbg !147
  call void @llvm.dbg.value(metadata !{i32 %file_length}, i64 0, metadata !13), !dbg !147
  call void @llvm.dbg.value(metadata !{i32 %stdin_length}, i64 0, metadata !14), !dbg !148
  call void @llvm.dbg.value(metadata !{i32 %sym_stdout_flag}, i64 0, metadata !15), !dbg !148
  call void @llvm.dbg.value(metadata !{i32 %save_all_writes_flag}, i64 0, metadata !16), !dbg !149
  call void @llvm.dbg.value(metadata !{i32 %max_failures}, i64 0, metadata !17), !dbg !149
  call void @llvm.dbg.declare(metadata !{[7 x i8]* %name}, metadata !19), !dbg !150
  %1 = getelementptr inbounds [7 x i8]* %name, i64 0, i64 0, !dbg !150
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* getelementptr inbounds ([7 x i8]* @klee_init_fds.name, i64 0, i64 0), i64 7, i32 1, i1 false), !dbg !150
  %2 = bitcast %struct.stat64* %s to i8*, !dbg !151
  call void @llvm.lifetime.start(i64 144, i8* %2) #2, !dbg !151
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %s}, metadata !24), !dbg !151
  call void @llvm.dbg.value(metadata !152, i64 0, metadata !153) #2, !dbg !155
  call void @llvm.dbg.value(metadata !{%struct.stat64* %s}, i64 0, metadata !156) #2, !dbg !155
  %3 = call i32 @__xstat64(i32 1, i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0), %struct.stat64* %s) #2, !dbg !157
  store i32 %n_files, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !159, !tbaa !160
  %4 = zext i32 %n_files to i64, !dbg !166
  %5 = mul i64 %4, 24, !dbg !166
  %6 = call noalias i8* @malloc(i64 %5) #2, !dbg !166
  %7 = bitcast i8* %6 to %struct.exe_disk_file_t*, !dbg !166
  store %struct.exe_disk_file_t* %7, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !166, !tbaa !167
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !18), !dbg !168
  %8 = icmp eq i32 %n_files, 0, !dbg !168
  br i1 %8, label %._crit_edge, label %.lr.ph, !dbg !168

.lr.ph:                                           ; preds = %0, %._crit_edge2
  %9 = phi %struct.exe_disk_file_t* [ %.pre, %._crit_edge2 ], [ %7, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2 ], [ 0, %0 ]
  %10 = trunc i64 %indvars.iv to i8, !dbg !170
  %11 = add i8 %10, 65, !dbg !170
  store i8 %11, i8* %1, align 1, !dbg !170, !tbaa !172
  %12 = getelementptr inbounds %struct.exe_disk_file_t* %9, i64 %indvars.iv, !dbg !173
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %12, i32 %file_length, i8* %1, %struct.stat64* %s), !dbg !173
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !168
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !168
  %exitcond = icmp eq i32 %lftr.wideiv, %n_files, !dbg !168
  br i1 %exitcond, label %._crit_edge, label %._crit_edge2, !dbg !168

._crit_edge2:                                     ; preds = %.lr.ph
  %.pre = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !173, !tbaa !167
  br label %.lr.ph, !dbg !168

._crit_edge:                                      ; preds = %.lr.ph, %0
  %13 = icmp eq i32 %stdin_length, 0, !dbg !174
  br i1 %13, label %18, label %14, !dbg !174

; <label>:14                                      ; preds = %._crit_edge
  %15 = call noalias i8* @malloc(i64 24) #2, !dbg !176
  %16 = bitcast i8* %15 to %struct.exe_disk_file_t*, !dbg !176
  store %struct.exe_disk_file_t* %16, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 1), align 8, !dbg !176, !tbaa !178
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %16, i32 %stdin_length, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), %struct.stat64* %s), !dbg !179
  %17 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 1), align 8, !dbg !180, !tbaa !178
  store %struct.exe_disk_file_t* %17, %struct.exe_disk_file_t** getelementptr inbounds ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, i64 0, i32 0, i64 0, i32 3), align 8, !dbg !180, !tbaa !181
  br label %19, !dbg !184

; <label>:18                                      ; preds = %._crit_edge
  store %struct.exe_disk_file_t* null, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 1), align 8, !dbg !185, !tbaa !178
  br label %19

; <label>:19                                      ; preds = %18, %14
  store i32 %max_failures, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !186, !tbaa !187
  %20 = icmp eq i32 %max_failures, 0, !dbg !188
  br i1 %20, label %40, label %21, !dbg !188

; <label>:21                                      ; preds = %19
  %22 = call noalias i8* @malloc(i64 4) #2, !dbg !190
  %23 = bitcast i8* %22 to i32*, !dbg !190
  store i32* %23, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 6), align 8, !dbg !190, !tbaa !192
  %24 = call noalias i8* @malloc(i64 4) #2, !dbg !193
  %25 = bitcast i8* %24 to i32*, !dbg !193
  store i32* %25, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !193, !tbaa !194
  %26 = call noalias i8* @malloc(i64 4) #2, !dbg !195
  %27 = bitcast i8* %26 to i32*, !dbg !195
  store i32* %27, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !195, !tbaa !196
  %28 = call noalias i8* @malloc(i64 4) #2, !dbg !197
  %29 = bitcast i8* %28 to i32*, !dbg !197
  store i32* %29, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !197, !tbaa !198
  %30 = call noalias i8* @malloc(i64 4) #2, !dbg !199
  %31 = bitcast i8* %30 to i32*, !dbg !199
  store i32* %31, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 8, !dbg !199, !tbaa !200
  call void @klee_make_symbolic(i8* %22, i64 4, i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) #2, !dbg !201
  %32 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !202, !tbaa !194
  %33 = bitcast i32* %32 to i8*, !dbg !202
  call void @klee_make_symbolic(i8* %33, i64 4, i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0)) #2, !dbg !202
  %34 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !203, !tbaa !196
  %35 = bitcast i32* %34 to i8*, !dbg !203
  call void @klee_make_symbolic(i8* %35, i64 4, i8* getelementptr inbounds ([11 x i8]* @.str4, i64 0, i64 0)) #2, !dbg !203
  %36 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !204, !tbaa !198
  %37 = bitcast i32* %36 to i8*, !dbg !204
  call void @klee_make_symbolic(i8* %37, i64 4, i8* getelementptr inbounds ([15 x i8]* @.str5, i64 0, i64 0)) #2, !dbg !204
  %38 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 8, !dbg !205, !tbaa !200
  %39 = bitcast i32* %38 to i8*, !dbg !205
  call void @klee_make_symbolic(i8* %39, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str6, i64 0, i64 0)) #2, !dbg !205
  br label %40, !dbg !206

; <label>:40                                      ; preds = %19, %21
  %41 = icmp eq i32 %sym_stdout_flag, 0, !dbg !207
  br i1 %41, label %46, label %42, !dbg !207

; <label>:42                                      ; preds = %40
  %43 = call noalias i8* @malloc(i64 24) #2, !dbg !209
  %44 = bitcast i8* %43 to %struct.exe_disk_file_t*, !dbg !209
  store %struct.exe_disk_file_t* %44, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !209, !tbaa !211
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %44, i32 1024, i8* getelementptr inbounds ([7 x i8]* @.str7, i64 0, i64 0), %struct.stat64* %s), !dbg !212
  %45 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !213, !tbaa !211
  store %struct.exe_disk_file_t* %45, %struct.exe_disk_file_t** getelementptr inbounds ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, i64 0, i32 0, i64 1, i32 3), align 8, !dbg !213, !tbaa !181
  store i32 0, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !214, !tbaa !215
  br label %47, !dbg !216

; <label>:46                                      ; preds = %40
  store %struct.exe_disk_file_t* null, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !217, !tbaa !211
  br label %47

; <label>:47                                      ; preds = %46, %42
  store i32 %save_all_writes_flag, i32* getelementptr inbounds ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, i64 0, i32 3), align 8, !dbg !218, !tbaa !219
  %48 = bitcast i32* %x.i to i8*, !dbg !221
  call void @llvm.lifetime.start(i64 4, i8* %48) #2, !dbg !221
  call void @llvm.dbg.value(metadata !223, i64 0, metadata !224) #2, !dbg !221
  call void @llvm.dbg.declare(metadata !{i32* %x.i}, metadata !71) #2, !dbg !225
  call void @klee_make_symbolic(i8* %48, i64 4, i8* getelementptr inbounds ([14 x i8]* @.str8, i64 0, i64 0)) #2, !dbg !226
  call void @llvm.dbg.value(metadata !{i32* %x.i}, i64 0, metadata !227) #2, !dbg !228
  call void @llvm.dbg.value(metadata !{i32* %x.i}, i64 0, metadata !71), !dbg !228
  %49 = load i32* %x.i, align 4, !dbg !228, !tbaa !229
  call void @llvm.lifetime.end(i64 4, i8* %48) #2, !dbg !228
  store i32 %49, i32* getelementptr inbounds ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, i64 0, i32 2), align 4, !dbg !222, !tbaa !230
  %50 = icmp eq i32 %49, 1, !dbg !231
  %51 = zext i1 %50 to i64, !dbg !231
  call void @klee_assume(i64 %51) #2, !dbg !231
  call void @llvm.lifetime.end(i64 144, i8* %2) #2, !dbg !232
  ret void, !dbg !232
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind uwtable
define internal fastcc void @__create_new_dfile(%struct.exe_disk_file_t* nocapture %dfile, i32 %size, i8* %name, %struct.stat64* nocapture readonly %defaults) #0 {
  %sname = alloca [64 x i8], align 16
  call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %dfile}, i64 0, metadata !86), !dbg !233
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !87), !dbg !233
  call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !88), !dbg !234
  call void @llvm.dbg.value(metadata !{%struct.stat64* %defaults}, i64 0, metadata !89), !dbg !234
  %1 = call noalias i8* @malloc(i64 144) #2, !dbg !235
  %2 = bitcast i8* %1 to %struct.stat64*, !dbg !235
  call void @llvm.dbg.value(metadata !{%struct.stat64* %2}, i64 0, metadata !90), !dbg !235
  %3 = getelementptr inbounds [64 x i8]* %sname, i64 0, i64 0, !dbg !236
  call void @llvm.lifetime.start(i64 64, i8* %3) #2, !dbg !236
  call void @llvm.dbg.declare(metadata !{[64 x i8]* %sname}, metadata !92), !dbg !236
  call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !91), !dbg !237
  %4 = load i8* %name, align 1, !dbg !237, !tbaa !172
  %5 = icmp eq i8 %4, 0, !dbg !237
  %6 = ptrtoint i8* %name to i64, !dbg !239
  br i1 %5, label %._crit_edge, label %.lr.ph, !dbg !237

.lr.ph:                                           ; preds = %0, %.lr.ph
  %7 = phi i8* [ %14, %.lr.ph ], [ %3, %0 ]
  %8 = phi i8 [ %10, %.lr.ph ], [ %4, %0 ]
  %sp.01 = phi i8* [ %9, %.lr.ph ], [ %name, %0 ]
  store i8 %8, i8* %7, align 1, !dbg !240, !tbaa !172
  %9 = getelementptr inbounds i8* %sp.01, i64 1, !dbg !237
  call void @llvm.dbg.value(metadata !{i8* %9}, i64 0, metadata !91), !dbg !237
  %10 = load i8* %9, align 1, !dbg !237, !tbaa !172
  %11 = icmp eq i8 %10, 0, !dbg !237
  %12 = ptrtoint i8* %9 to i64, !dbg !239
  %13 = sub i64 %12, %6, !dbg !239
  %14 = getelementptr inbounds [64 x i8]* %sname, i64 0, i64 %13, !dbg !239
  br i1 %11, label %._crit_edge, label %.lr.ph, !dbg !237

._crit_edge:                                      ; preds = %.lr.ph, %0
  %.lcssa = phi i8* [ %3, %0 ], [ %14, %.lr.ph ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %.lcssa, i8* getelementptr inbounds ([6 x i8]* @.str9, i64 0, i64 0), i64 6, i32 1, i1 false), !dbg !239
  %15 = icmp eq i32 %size, 0, !dbg !241
  br i1 %15, label %16, label %17, !dbg !241

; <label>:16                                      ; preds = %._crit_edge
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8]* @.str10, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str11, i64 0, i64 0), i32 55, i8* getelementptr inbounds ([88 x i8]* @__PRETTY_FUNCTION__.__create_new_dfile, i64 0, i64 0)) #6, !dbg !241
  unreachable, !dbg !241

; <label>:17                                      ; preds = %._crit_edge
  %18 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i64 0, i32 0, !dbg !242
  store i32 %size, i32* %18, align 4, !dbg !242, !tbaa !243
  %19 = zext i32 %size to i64, !dbg !245
  %20 = call noalias i8* @malloc(i64 %19) #2, !dbg !245
  %21 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i64 0, i32 1, !dbg !245
  store i8* %20, i8** %21, align 8, !dbg !245, !tbaa !246
  call void @klee_make_symbolic(i8* %20, i64 %19, i8* %name) #2, !dbg !247
  call void @klee_make_symbolic(i8* %1, i64 144, i8* %3) #2, !dbg !248
  %22 = getelementptr inbounds i8* %1, i64 8, !dbg !249
  %23 = bitcast i8* %22 to i64*, !dbg !249
  %24 = load i64* %23, align 8, !dbg !249, !tbaa !251
  %25 = call i32 @klee_is_symbolic(i64 %24) #2, !dbg !249
  %26 = icmp eq i32 %25, 0, !dbg !249
  %27 = load i64* %23, align 8, !dbg !249, !tbaa !251
  %28 = and i64 %27, 2147483647, !dbg !249
  %29 = icmp eq i64 %28, 0, !dbg !249
  %or.cond = and i1 %26, %29, !dbg !249
  br i1 %or.cond, label %30, label %._crit_edge3, !dbg !249

; <label>:30                                      ; preds = %17
  %31 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 1, !dbg !254
  %32 = load i64* %31, align 8, !dbg !254, !tbaa !251
  store i64 %32, i64* %23, align 8, !dbg !254, !tbaa !251
  br label %._crit_edge3, !dbg !254

._crit_edge3:                                     ; preds = %17, %30
  %33 = phi i64 [ %32, %30 ], [ %27, %17 ]
  %34 = and i64 %33, 2147483647, !dbg !255
  %35 = icmp ne i64 %34, 0, !dbg !255
  %36 = zext i1 %35 to i64, !dbg !255
  call void @klee_assume(i64 %36) #2, !dbg !255
  %37 = getelementptr inbounds i8* %1, i64 56, !dbg !256
  %38 = bitcast i8* %37 to i64*, !dbg !256
  %39 = load i64* %38, align 8, !dbg !256, !tbaa !257
  %40 = icmp ult i64 %39, 65536, !dbg !256
  %41 = zext i1 %40 to i64, !dbg !256
  call void @klee_assume(i64 %41) #2, !dbg !256
  %42 = getelementptr inbounds i8* %1, i64 24, !dbg !258
  %43 = bitcast i8* %42 to i32*, !dbg !258
  %44 = load i32* %43, align 4, !dbg !258, !tbaa !259
  %45 = and i32 %44, -61952, !dbg !258
  %46 = icmp eq i32 %45, 0, !dbg !258
  %47 = zext i1 %46 to i64, !dbg !258
  call void @klee_posix_prefer_cex(i8* %1, i64 %47) #2, !dbg !258
  %48 = bitcast i8* %1 to i64*, !dbg !260
  %49 = load i64* %48, align 8, !dbg !260, !tbaa !261
  %50 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 0, !dbg !260
  %51 = load i64* %50, align 8, !dbg !260, !tbaa !261
  %52 = icmp eq i64 %49, %51, !dbg !260
  %53 = zext i1 %52 to i64, !dbg !260
  call void @klee_posix_prefer_cex(i8* %1, i64 %53) #2, !dbg !260
  %54 = getelementptr inbounds i8* %1, i64 40, !dbg !262
  %55 = bitcast i8* %54 to i64*, !dbg !262
  %56 = load i64* %55, align 8, !dbg !262, !tbaa !263
  %57 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 7, !dbg !262
  %58 = load i64* %57, align 8, !dbg !262, !tbaa !263
  %59 = icmp eq i64 %56, %58, !dbg !262
  %60 = zext i1 %59 to i64, !dbg !262
  call void @klee_posix_prefer_cex(i8* %1, i64 %60) #2, !dbg !262
  %61 = load i32* %43, align 4, !dbg !264, !tbaa !259
  %62 = and i32 %61, 448, !dbg !264
  %63 = icmp eq i32 %62, 384, !dbg !264
  %64 = zext i1 %63 to i64, !dbg !264
  call void @klee_posix_prefer_cex(i8* %1, i64 %64) #2, !dbg !264
  %65 = load i32* %43, align 4, !dbg !265, !tbaa !259
  %66 = and i32 %65, 56, !dbg !265
  %67 = icmp eq i32 %66, 16, !dbg !265
  %68 = zext i1 %67 to i64, !dbg !265
  call void @klee_posix_prefer_cex(i8* %1, i64 %68) #2, !dbg !265
  %69 = load i32* %43, align 4, !dbg !266, !tbaa !259
  %70 = and i32 %69, 7, !dbg !266
  %71 = icmp eq i32 %70, 2, !dbg !266
  %72 = zext i1 %71 to i64, !dbg !266
  call void @klee_posix_prefer_cex(i8* %1, i64 %72) #2, !dbg !266
  %73 = load i32* %43, align 4, !dbg !267, !tbaa !259
  %74 = and i32 %73, 61440, !dbg !267
  %75 = icmp eq i32 %74, 32768, !dbg !267
  %76 = zext i1 %75 to i64, !dbg !267
  call void @klee_posix_prefer_cex(i8* %1, i64 %76) #2, !dbg !267
  %77 = getelementptr inbounds i8* %1, i64 16, !dbg !268
  %78 = bitcast i8* %77 to i64*, !dbg !268
  %79 = load i64* %78, align 8, !dbg !268, !tbaa !269
  %80 = icmp eq i64 %79, 1, !dbg !268
  %81 = zext i1 %80 to i64, !dbg !268
  call void @klee_posix_prefer_cex(i8* %1, i64 %81) #2, !dbg !268
  %82 = getelementptr inbounds i8* %1, i64 28, !dbg !270
  %83 = bitcast i8* %82 to i32*, !dbg !270
  %84 = load i32* %83, align 4, !dbg !270, !tbaa !271
  %85 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 4, !dbg !270
  %86 = load i32* %85, align 4, !dbg !270, !tbaa !271
  %87 = icmp eq i32 %84, %86, !dbg !270
  %88 = zext i1 %87 to i64, !dbg !270
  call void @klee_posix_prefer_cex(i8* %1, i64 %88) #2, !dbg !270
  %89 = getelementptr inbounds i8* %1, i64 32, !dbg !272
  %90 = bitcast i8* %89 to i32*, !dbg !272
  %91 = load i32* %90, align 4, !dbg !272, !tbaa !273
  %92 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 5, !dbg !272
  %93 = load i32* %92, align 4, !dbg !272, !tbaa !273
  %94 = icmp eq i32 %91, %93, !dbg !272
  %95 = zext i1 %94 to i64, !dbg !272
  call void @klee_posix_prefer_cex(i8* %1, i64 %95) #2, !dbg !272
  %96 = load i64* %38, align 8, !dbg !274, !tbaa !257
  %97 = icmp eq i64 %96, 4096, !dbg !274
  %98 = zext i1 %97 to i64, !dbg !274
  call void @klee_posix_prefer_cex(i8* %1, i64 %98) #2, !dbg !274
  %99 = getelementptr inbounds i8* %1, i64 72, !dbg !275
  %100 = bitcast i8* %99 to i64*, !dbg !275
  %101 = load i64* %100, align 8, !dbg !275, !tbaa !276
  %102 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 11, i32 0, !dbg !275
  %103 = load i64* %102, align 8, !dbg !275, !tbaa !276
  %104 = icmp eq i64 %101, %103, !dbg !275
  %105 = zext i1 %104 to i64, !dbg !275
  call void @klee_posix_prefer_cex(i8* %1, i64 %105) #2, !dbg !275
  %106 = getelementptr inbounds i8* %1, i64 88, !dbg !277
  %107 = bitcast i8* %106 to i64*, !dbg !277
  %108 = load i64* %107, align 8, !dbg !277, !tbaa !278
  %109 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 12, i32 0, !dbg !277
  %110 = load i64* %109, align 8, !dbg !277, !tbaa !278
  %111 = icmp eq i64 %108, %110, !dbg !277
  %112 = zext i1 %111 to i64, !dbg !277
  call void @klee_posix_prefer_cex(i8* %1, i64 %112) #2, !dbg !277
  %113 = getelementptr inbounds i8* %1, i64 104, !dbg !279
  %114 = bitcast i8* %113 to i64*, !dbg !279
  %115 = load i64* %114, align 8, !dbg !279, !tbaa !280
  %116 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 13, i32 0, !dbg !279
  %117 = load i64* %116, align 8, !dbg !279, !tbaa !280
  %118 = icmp eq i64 %115, %117, !dbg !279
  %119 = zext i1 %118 to i64, !dbg !279
  call void @klee_posix_prefer_cex(i8* %1, i64 %119) #2, !dbg !279
  %120 = load i32* %18, align 4, !dbg !281, !tbaa !243
  %121 = zext i32 %120 to i64, !dbg !281
  %122 = getelementptr inbounds i8* %1, i64 48, !dbg !281
  %123 = bitcast i8* %122 to i64*, !dbg !281
  store i64 %121, i64* %123, align 8, !dbg !281, !tbaa !282
  %124 = getelementptr inbounds i8* %1, i64 64, !dbg !283
  %125 = bitcast i8* %124 to i64*, !dbg !283
  store i64 8, i64* %125, align 8, !dbg !283, !tbaa !284
  %126 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i64 0, i32 2, !dbg !285
  store %struct.stat64* %2, %struct.stat64** %126, align 8, !dbg !285, !tbaa !286
  call void @llvm.lifetime.end(i64 64, i8* %3) #2, !dbg !287
  ret void, !dbg !287
}

declare void @klee_make_symbolic(i8*, i64, i8*) #4

declare void @klee_assume(i64) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #5

declare i32 @klee_is_symbolic(i64) #4

declare void @klee_posix_prefer_cex(i8*, i64) #4

; Function Attrs: nounwind
declare i32 @__xstat64(i32, i8*, %struct.stat64*) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!144, !145}
!llvm.ident = !{!146}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !104, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/POSIX//home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !64, metadata !72, metadata !96}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"klee_init_fds", metadata !"klee_init_fds", metadata !"", i32 110, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, i32, i32, i32, i32)* @klee_init_fds, null, null, metadata !11, i32 112} ; [ DW_TAG_subprogram ] [line 110] [def] [scope 112] [klee_init_fds]
!5 = metadata !{metadata !"fd_init.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !9, metadata !10, metadata !10, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!10 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = metadata !{metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !24}
!12 = metadata !{i32 786689, metadata !4, metadata !"n_files", metadata !6, i32 16777326, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n_files] [line 110]
!13 = metadata !{i32 786689, metadata !4, metadata !"file_length", metadata !6, i32 33554542, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [file_length] [line 110]
!14 = metadata !{i32 786689, metadata !4, metadata !"stdin_length", metadata !6, i32 50331759, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stdin_length] [line 111]
!15 = metadata !{i32 786689, metadata !4, metadata !"sym_stdout_flag", metadata !6, i32 67108975, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sym_stdout_flag] [line 111]
!16 = metadata !{i32 786689, metadata !4, metadata !"save_all_writes_flag", metadata !6, i32 83886192, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [save_all_writes_flag] [line 112]
!17 = metadata !{i32 786689, metadata !4, metadata !"max_failures", metadata !6, i32 100663408, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max_failures] [line 112]
!18 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !6, i32 113, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 113]
!19 = metadata !{i32 786688, metadata !4, metadata !"name", metadata !6, i32 114, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [name] [line 114]
!20 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 56, i64 8, i32 0, i32 0, metadata !21, metadata !22, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 56, align 8, offset 0] [from char]
!21 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!22 = metadata !{metadata !23}
!23 = metadata !{i32 786465, i64 0, i64 7}        ; [ DW_TAG_subrange_type ] [0, 6]
!24 = metadata !{i32 786688, metadata !4, metadata !"s", metadata !6, i32 115, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 115]
!25 = metadata !{i32 786451, metadata !26, null, metadata !"stat64", i32 119, i64 1152, i64 64, i32 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat64] [line 119, size 1152, align 64, offset 0] [def] [from ]
!26 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/stat.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!27 = metadata !{metadata !28, metadata !31, metadata !33, metadata !35, metadata !37, metadata !39, metadata !41, metadata !42, metadata !43, metadata !46, metadata !48, metadata !50, metadata !58, metadata !59, metadata !60}
!28 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_dev", i32 121, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_member ] [st_dev] [line 121, size 64, align 64, offset 0] [from __dev_t]
!29 = metadata !{i32 786454, metadata !26, null, metadata !"__dev_t", i32 124, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ] [__dev_t] [line 124, size 0, align 0, offset 0] [from long unsigned int]
!30 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!31 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_ino", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !32} ; [ DW_TAG_member ] [st_ino] [line 123, size 64, align 64, offset 64] [from __ino64_t]
!32 = metadata !{i32 786454, metadata !26, null, metadata !"__ino64_t", i32 128, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ] [__ino64_t] [line 128, size 0, align 0, offset 0] [from long unsigned int]
!33 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_nlink", i32 124, i64 64, i64 64, i64 128, i32 0, metadata !34} ; [ DW_TAG_member ] [st_nlink] [line 124, size 64, align 64, offset 128] [from __nlink_t]
!34 = metadata !{i32 786454, metadata !26, null, metadata !"__nlink_t", i32 130, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ] [__nlink_t] [line 130, size 0, align 0, offset 0] [from long unsigned int]
!35 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_mode", i32 125, i64 32, i64 32, i64 192, i32 0, metadata !36} ; [ DW_TAG_member ] [st_mode] [line 125, size 32, align 32, offset 192] [from __mode_t]
!36 = metadata !{i32 786454, metadata !26, null, metadata !"__mode_t", i32 129, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__mode_t] [line 129, size 0, align 0, offset 0] [from unsigned int]
!37 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_uid", i32 132, i64 32, i64 32, i64 224, i32 0, metadata !38} ; [ DW_TAG_member ] [st_uid] [line 132, size 32, align 32, offset 224] [from __uid_t]
!38 = metadata !{i32 786454, metadata !26, null, metadata !"__uid_t", i32 125, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__uid_t] [line 125, size 0, align 0, offset 0] [from unsigned int]
!39 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_gid", i32 133, i64 32, i64 32, i64 256, i32 0, metadata !40} ; [ DW_TAG_member ] [st_gid] [line 133, size 32, align 32, offset 256] [from __gid_t]
!40 = metadata !{i32 786454, metadata !26, null, metadata !"__gid_t", i32 126, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__gid_t] [line 126, size 0, align 0, offset 0] [from unsigned int]
!41 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"__pad0", i32 135, i64 32, i64 32, i64 288, i32 0, metadata !10} ; [ DW_TAG_member ] [__pad0] [line 135, size 32, align 32, offset 288] [from int]
!42 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_rdev", i32 136, i64 64, i64 64, i64 320, i32 0, metadata !29} ; [ DW_TAG_member ] [st_rdev] [line 136, size 64, align 64, offset 320] [from __dev_t]
!43 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_size", i32 137, i64 64, i64 64, i64 384, i32 0, metadata !44} ; [ DW_TAG_member ] [st_size] [line 137, size 64, align 64, offset 384] [from __off_t]
!44 = metadata !{i32 786454, metadata !26, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!45 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!46 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_blksize", i32 143, i64 64, i64 64, i64 448, i32 0, metadata !47} ; [ DW_TAG_member ] [st_blksize] [line 143, size 64, align 64, offset 448] [from __blksize_t]
!47 = metadata !{i32 786454, metadata !26, null, metadata !"__blksize_t", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_typedef ] [__blksize_t] [line 153, size 0, align 0, offset 0] [from long int]
!48 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_blocks", i32 144, i64 64, i64 64, i64 512, i32 0, metadata !49} ; [ DW_TAG_member ] [st_blocks] [line 144, size 64, align 64, offset 512] [from __blkcnt64_t]
!49 = metadata !{i32 786454, metadata !26, null, metadata !"__blkcnt64_t", i32 159, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_typedef ] [__blkcnt64_t] [line 159, size 0, align 0, offset 0] [from long int]
!50 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_atim", i32 152, i64 128, i64 64, i64 576, i32 0, metadata !51} ; [ DW_TAG_member ] [st_atim] [line 152, size 128, align 64, offset 576] [from timespec]
!51 = metadata !{i32 786451, metadata !52, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !53, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!52 = metadata !{metadata !"/usr/include/time.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!53 = metadata !{metadata !54, metadata !56}
!54 = metadata !{i32 786445, metadata !52, metadata !51, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !55} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!55 = metadata !{i32 786454, metadata !52, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!56 = metadata !{i32 786445, metadata !52, metadata !51, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!57 = metadata !{i32 786454, metadata !52, null, metadata !"__syscall_slong_t", i32 175, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_typedef ] [__syscall_slong_t] [line 175, size 0, align 0, offset 0] [from long int]
!58 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_mtim", i32 153, i64 128, i64 64, i64 704, i32 0, metadata !51} ; [ DW_TAG_member ] [st_mtim] [line 153, size 128, align 64, offset 704] [from timespec]
!59 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"st_ctim", i32 154, i64 128, i64 64, i64 832, i32 0, metadata !51} ; [ DW_TAG_member ] [st_ctim] [line 154, size 128, align 64, offset 832] [from timespec]
!60 = metadata !{i32 786445, metadata !26, metadata !25, metadata !"__glibc_reserved", i32 164, i64 192, i64 64, i64 960, i32 0, metadata !61} ; [ DW_TAG_member ] [__glibc_reserved] [line 164, size 192, align 64, offset 960] [from ]
!61 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !57, metadata !62, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __syscall_slong_t]
!62 = metadata !{metadata !63}
!63 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!64 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__sym_uint32", metadata !"__sym_uint32", metadata !"", i32 97, metadata !65, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !69, i32 97} ; [ DW_TAG_subprogram ] [line 97] [local] [def] [__sym_uint32]
!65 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{metadata !9, metadata !67}
!67 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!68 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!69 = metadata !{metadata !70, metadata !71}
!70 = metadata !{i32 786689, metadata !64, metadata !"name", metadata !6, i32 16777313, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 97]
!71 = metadata !{i32 786688, metadata !64, metadata !"x", metadata !6, i32 98, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 98]
!72 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__create_new_dfile", metadata !"__create_new_dfile", metadata !"", i32 46, metadata !73, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.exe_disk_file_t*, i32, i8*, %struct.stat64*)* @__create_new_dfile, null, null, metadata !85, i32 47} ; [ DW_TAG_subprogram ] [line 46] [local] [def] [scope 47] [__create_new_dfile]
!73 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = metadata !{null, metadata !75, metadata !9, metadata !67, metadata !84}
!75 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !76} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from exe_disk_file_t]
!76 = metadata !{i32 786454, metadata !77, null, metadata !"exe_disk_file_t", i32 24, i64 0, i64 0, i64 0, i32 0, metadata !78} ; [ DW_TAG_typedef ] [exe_disk_file_t] [line 24, size 0, align 0, offset 0] [from ]
!77 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/fd.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!78 = metadata !{i32 786451, metadata !77, null, metadata !"", i32 20, i64 192, i64 64, i32 0, i32 0, null, metadata !79, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 20, size 192, align 64, offset 0] [def] [from ]
!79 = metadata !{metadata !80, metadata !81, metadata !83}
!80 = metadata !{i32 786445, metadata !77, metadata !78, metadata !"size", i32 21, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [size] [line 21, size 32, align 32, offset 0] [from unsigned int]
!81 = metadata !{i32 786445, metadata !77, metadata !78, metadata !"contents", i32 22, i64 64, i64 64, i64 64, i32 0, metadata !82} ; [ DW_TAG_member ] [contents] [line 22, size 64, align 64, offset 64] [from ]
!82 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!83 = metadata !{i32 786445, metadata !77, metadata !78, metadata !"stat", i32 23, i64 64, i64 64, i64 128, i32 0, metadata !84} ; [ DW_TAG_member ] [stat] [line 23, size 64, align 64, offset 128] [from ]
!84 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat64]
!85 = metadata !{metadata !86, metadata !87, metadata !88, metadata !89, metadata !90, metadata !91, metadata !92}
!86 = metadata !{i32 786689, metadata !72, metadata !"dfile", metadata !6, i32 16777262, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dfile] [line 46]
!87 = metadata !{i32 786689, metadata !72, metadata !"size", metadata !6, i32 33554478, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 46]
!88 = metadata !{i32 786689, metadata !72, metadata !"name", metadata !6, i32 50331695, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 47]
!89 = metadata !{i32 786689, metadata !72, metadata !"defaults", metadata !6, i32 67108911, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [defaults] [line 47]
!90 = metadata !{i32 786688, metadata !72, metadata !"s", metadata !6, i32 48, metadata !84, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 48]
!91 = metadata !{i32 786688, metadata !72, metadata !"sp", metadata !6, i32 49, metadata !67, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sp] [line 49]
!92 = metadata !{i32 786688, metadata !72, metadata !"sname", metadata !6, i32 50, metadata !93, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sname] [line 50]
!93 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 8, i32 0, i32 0, metadata !21, metadata !94, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!94 = metadata !{metadata !95}
!95 = metadata !{i32 786465, i64 0, i64 64}       ; [ DW_TAG_subrange_type ] [0, 63]
!96 = metadata !{i32 786478, metadata !97, metadata !98, metadata !"stat64", metadata !"stat64", metadata !"", i32 501, metadata !99, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !101, i32 502} ; [ DW_TAG_subprogram ] [line 501] [def] [scope 502] [stat64]
!97 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/sys/stat.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!98 = metadata !{i32 786473, metadata !97}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX//usr/include/x86_64-linux-gnu/sys/stat.h]
!99 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !100, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!100 = metadata !{metadata !10, metadata !67, metadata !84}
!101 = metadata !{metadata !102, metadata !103}
!102 = metadata !{i32 786689, metadata !96, metadata !"__path", metadata !98, i32 16777717, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__path] [line 501]
!103 = metadata !{i32 786689, metadata !96, metadata !"__statbuf", metadata !98, i32 33554933, metadata !84, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__statbuf] [line 501]
!104 = metadata !{metadata !105, metadata !126}
!105 = metadata !{i32 786484, i32 0, null, metadata !"__exe_env", metadata !"__exe_env", metadata !"", metadata !6, i32 37, metadata !106, i32 0, i32 1, { [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, null} ; [ DW_TAG_variable ] [__exe_env] [line 37] [def]
!106 = metadata !{i32 786454, metadata !5, null, metadata !"exe_sym_env_t", i32 69, i64 0, i64 0, i64 0, i32 0, metadata !107} ; [ DW_TAG_typedef ] [exe_sym_env_t] [line 69, size 0, align 0, offset 0] [from ]
!107 = metadata !{i32 786451, metadata !77, null, metadata !"", i32 61, i64 6272, i64 64, i32 0, i32 0, null, metadata !108, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 61, size 6272, align 64, offset 0] [def] [from ]
!108 = metadata !{metadata !109, metadata !122, metadata !124, metadata !125}
!109 = metadata !{i32 786445, metadata !77, metadata !107, metadata !"fds", i32 62, i64 6144, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_member ] [fds] [line 62, size 6144, align 64, offset 0] [from ]
!110 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 6144, i64 64, i32 0, i32 0, metadata !111, metadata !120, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6144, align 64, offset 0] [from exe_file_t]
!111 = metadata !{i32 786454, metadata !77, null, metadata !"exe_file_t", i32 40, i64 0, i64 0, i64 0, i32 0, metadata !112} ; [ DW_TAG_typedef ] [exe_file_t] [line 40, size 0, align 0, offset 0] [from ]
!112 = metadata !{i32 786451, metadata !77, null, metadata !"", i32 33, i64 192, i64 64, i32 0, i32 0, null, metadata !113, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 33, size 192, align 64, offset 0] [def] [from ]
!113 = metadata !{metadata !114, metadata !115, metadata !116, metadata !119}
!114 = metadata !{i32 786445, metadata !77, metadata !112, metadata !"fd", i32 34, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ] [fd] [line 34, size 32, align 32, offset 0] [from int]
!115 = metadata !{i32 786445, metadata !77, metadata !112, metadata !"flags", i32 35, i64 32, i64 32, i64 32, i32 0, metadata !9} ; [ DW_TAG_member ] [flags] [line 35, size 32, align 32, offset 32] [from unsigned int]
!116 = metadata !{i32 786445, metadata !77, metadata !112, metadata !"off", i32 38, i64 64, i64 64, i64 64, i32 0, metadata !117} ; [ DW_TAG_member ] [off] [line 38, size 64, align 64, offset 64] [from off64_t]
!117 = metadata !{i32 786454, metadata !77, null, metadata !"off64_t", i32 93, i64 0, i64 0, i64 0, i32 0, metadata !118} ; [ DW_TAG_typedef ] [off64_t] [line 93, size 0, align 0, offset 0] [from __off64_t]
!118 = metadata !{i32 786454, metadata !77, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !45} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!119 = metadata !{i32 786445, metadata !77, metadata !112, metadata !"dfile", i32 39, i64 64, i64 64, i64 128, i32 0, metadata !75} ; [ DW_TAG_member ] [dfile] [line 39, size 64, align 64, offset 128] [from ]
!120 = metadata !{metadata !121}
!121 = metadata !{i32 786465, i64 0, i64 32}      ; [ DW_TAG_subrange_type ] [0, 31]
!122 = metadata !{i32 786445, metadata !77, metadata !107, metadata !"umask", i32 63, i64 32, i64 32, i64 6144, i32 0, metadata !123} ; [ DW_TAG_member ] [umask] [line 63, size 32, align 32, offset 6144] [from mode_t]
!123 = metadata !{i32 786454, metadata !77, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !36} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!124 = metadata !{i32 786445, metadata !77, metadata !107, metadata !"version", i32 64, i64 32, i64 32, i64 6176, i32 0, metadata !9} ; [ DW_TAG_member ] [version] [line 64, size 32, align 32, offset 6176] [from unsigned int]
!125 = metadata !{i32 786445, metadata !77, metadata !107, metadata !"save_all_writes", i32 68, i64 32, i64 32, i64 6208, i32 0, metadata !10} ; [ DW_TAG_member ] [save_all_writes] [line 68, size 32, align 32, offset 6208] [from int]
!126 = metadata !{i32 786484, i32 0, null, metadata !"__exe_fs", metadata !"__exe_fs", metadata !"", metadata !6, i32 24, metadata !127, i32 0, i32 1, %struct.exe_file_system_t* @__exe_fs, null} ; [ DW_TAG_variable ] [__exe_fs] [line 24] [def]
!127 = metadata !{i32 786454, metadata !5, null, metadata !"exe_file_system_t", i32 54, i64 0, i64 0, i64 0, i32 0, metadata !128} ; [ DW_TAG_typedef ] [exe_file_system_t] [line 54, size 0, align 0, offset 0] [from ]
!128 = metadata !{i32 786451, metadata !77, null, metadata !"", i32 42, i64 832, i64 64, i32 0, i32 0, null, metadata !129, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 42, size 832, align 64, offset 0] [def] [from ]
!129 = metadata !{metadata !130, metadata !131, metadata !132, metadata !133, metadata !134, metadata !135, metadata !136, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143}
!130 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"n_sym_files", i32 43, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [n_sym_files] [line 43, size 32, align 32, offset 0] [from unsigned int]
!131 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"sym_stdin", i32 44, i64 64, i64 64, i64 64, i32 0, metadata !75} ; [ DW_TAG_member ] [sym_stdin] [line 44, size 64, align 64, offset 64] [from ]
!132 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"sym_stdout", i32 44, i64 64, i64 64, i64 128, i32 0, metadata !75} ; [ DW_TAG_member ] [sym_stdout] [line 44, size 64, align 64, offset 128] [from ]
!133 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"stdout_writes", i32 45, i64 32, i64 32, i64 192, i32 0, metadata !9} ; [ DW_TAG_member ] [stdout_writes] [line 45, size 32, align 32, offset 192] [from unsigned int]
!134 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"sym_files", i32 46, i64 64, i64 64, i64 256, i32 0, metadata !75} ; [ DW_TAG_member ] [sym_files] [line 46, size 64, align 64, offset 256] [from ]
!135 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"max_failures", i32 49, i64 32, i64 32, i64 320, i32 0, metadata !9} ; [ DW_TAG_member ] [max_failures] [line 49, size 32, align 32, offset 320] [from unsigned int]
!136 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"read_fail", i32 52, i64 64, i64 64, i64 384, i32 0, metadata !137} ; [ DW_TAG_member ] [read_fail] [line 52, size 64, align 64, offset 384] [from ]
!137 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!138 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"write_fail", i32 52, i64 64, i64 64, i64 448, i32 0, metadata !137} ; [ DW_TAG_member ] [write_fail] [line 52, size 64, align 64, offset 448] [from ]
!139 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"close_fail", i32 52, i64 64, i64 64, i64 512, i32 0, metadata !137} ; [ DW_TAG_member ] [close_fail] [line 52, size 64, align 64, offset 512] [from ]
!140 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"ftruncate_fail", i32 52, i64 64, i64 64, i64 576, i32 0, metadata !137} ; [ DW_TAG_member ] [ftruncate_fail] [line 52, size 64, align 64, offset 576] [from ]
!141 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"getcwd_fail", i32 52, i64 64, i64 64, i64 640, i32 0, metadata !137} ; [ DW_TAG_member ] [getcwd_fail] [line 52, size 64, align 64, offset 640] [from ]
!142 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"chmod_fail", i32 53, i64 64, i64 64, i64 704, i32 0, metadata !137} ; [ DW_TAG_member ] [chmod_fail] [line 53, size 64, align 64, offset 704] [from ]
!143 = metadata !{i32 786445, metadata !77, metadata !128, metadata !"fchmod_fail", i32 53, i64 64, i64 64, i64 768, i32 0, metadata !137} ; [ DW_TAG_member ] [fchmod_fail] [line 53, size 64, align 64, offset 768] [from ]
!144 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!145 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!146 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!147 = metadata !{i32 110, i32 0, metadata !4, null}
!148 = metadata !{i32 111, i32 0, metadata !4, null}
!149 = metadata !{i32 112, i32 0, metadata !4, null}
!150 = metadata !{i32 114, i32 0, metadata !4, null}
!151 = metadata !{i32 115, i32 0, metadata !4, null}
!152 = metadata !{i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0)}
!153 = metadata !{i32 786689, metadata !96, metadata !"__path", metadata !98, i32 16777717, metadata !67, i32 0, metadata !154} ; [ DW_TAG_arg_variable ] [__path] [line 501]
!154 = metadata !{i32 117, i32 0, metadata !4, null}
!155 = metadata !{i32 501, i32 0, metadata !96, metadata !154}
!156 = metadata !{i32 786689, metadata !96, metadata !"__statbuf", metadata !98, i32 33554933, metadata !84, i32 0, metadata !154} ; [ DW_TAG_arg_variable ] [__statbuf] [line 501]
!157 = metadata !{i32 503, i32 0, metadata !158, metadata !154}
!158 = metadata !{i32 786443, metadata !97, metadata !96} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX//usr/include/x86_64-linux-gnu/sys/stat.h]
!159 = metadata !{i32 119, i32 0, metadata !4, null}
!160 = metadata !{metadata !161, metadata !162, i64 0}
!161 = metadata !{metadata !"", metadata !162, i64 0, metadata !165, i64 8, metadata !165, i64 16, metadata !162, i64 24, metadata !165, i64 32, metadata !162, i64 40, metadata !165, i64 48, metadata !165, i64 56, metadata !165, i64 64, metadata !165, i64 72, metadata !165, i64 80, metadata !165, i64 88, metadata !165, i64 96}
!162 = metadata !{metadata !"int", metadata !163, i64 0}
!163 = metadata !{metadata !"omnipotent char", metadata !164, i64 0}
!164 = metadata !{metadata !"Simple C/C++ TBAA"}
!165 = metadata !{metadata !"any pointer", metadata !163, i64 0}
!166 = metadata !{i32 120, i32 0, metadata !4, null}
!167 = metadata !{metadata !161, metadata !165, i64 32}
!168 = metadata !{i32 121, i32 0, metadata !169, null}
!169 = metadata !{i32 786443, metadata !5, metadata !4, i32 121, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!170 = metadata !{i32 122, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !5, metadata !169, i32 121, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!172 = metadata !{metadata !163, metadata !163, i64 0}
!173 = metadata !{i32 123, i32 0, metadata !171, null}
!174 = metadata !{i32 127, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !5, metadata !4, i32 127, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!176 = metadata !{i32 128, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !5, metadata !175, i32 127, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!178 = metadata !{metadata !161, metadata !165, i64 8}
!179 = metadata !{i32 129, i32 0, metadata !177, null}
!180 = metadata !{i32 130, i32 0, metadata !177, null}
!181 = metadata !{metadata !182, metadata !165, i64 16}
!182 = metadata !{metadata !"", metadata !162, i64 0, metadata !162, i64 4, metadata !183, i64 8, metadata !165, i64 16}
!183 = metadata !{metadata !"long", metadata !163, i64 0}
!184 = metadata !{i32 131, i32 0, metadata !177, null}
!185 = metadata !{i32 132, i32 0, metadata !175, null}
!186 = metadata !{i32 134, i32 0, metadata !4, null}
!187 = metadata !{metadata !161, metadata !162, i64 40}
!188 = metadata !{i32 135, i32 0, metadata !189, null}
!189 = metadata !{i32 786443, metadata !5, metadata !4, i32 135, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!190 = metadata !{i32 136, i32 0, metadata !191, null}
!191 = metadata !{i32 786443, metadata !5, metadata !189, i32 135, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!192 = metadata !{metadata !161, metadata !165, i64 48}
!193 = metadata !{i32 137, i32 0, metadata !191, null}
!194 = metadata !{metadata !161, metadata !165, i64 56}
!195 = metadata !{i32 138, i32 0, metadata !191, null}
!196 = metadata !{metadata !161, metadata !165, i64 64}
!197 = metadata !{i32 139, i32 0, metadata !191, null}
!198 = metadata !{metadata !161, metadata !165, i64 72}
!199 = metadata !{i32 140, i32 0, metadata !191, null}
!200 = metadata !{metadata !161, metadata !165, i64 80}
!201 = metadata !{i32 142, i32 0, metadata !191, null}
!202 = metadata !{i32 143, i32 0, metadata !191, null}
!203 = metadata !{i32 144, i32 0, metadata !191, null}
!204 = metadata !{i32 145, i32 0, metadata !191, null}
!205 = metadata !{i32 146, i32 0, metadata !191, null}
!206 = metadata !{i32 147, i32 0, metadata !191, null}
!207 = metadata !{i32 150, i32 0, metadata !208, null}
!208 = metadata !{i32 786443, metadata !5, metadata !4, i32 150, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!209 = metadata !{i32 151, i32 0, metadata !210, null}
!210 = metadata !{i32 786443, metadata !5, metadata !208, i32 150, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!211 = metadata !{metadata !161, metadata !165, i64 16}
!212 = metadata !{i32 152, i32 0, metadata !210, null}
!213 = metadata !{i32 153, i32 0, metadata !210, null}
!214 = metadata !{i32 154, i32 0, metadata !210, null}
!215 = metadata !{metadata !161, metadata !162, i64 24}
!216 = metadata !{i32 155, i32 0, metadata !210, null}
!217 = metadata !{i32 156, i32 0, metadata !208, null}
!218 = metadata !{i32 158, i32 0, metadata !4, null}
!219 = metadata !{metadata !220, metadata !162, i64 776}
!220 = metadata !{metadata !"", metadata !163, i64 0, metadata !162, i64 768, metadata !162, i64 772, metadata !162, i64 776}
!221 = metadata !{i32 97, i32 0, metadata !64, metadata !222}
!222 = metadata !{i32 159, i32 0, metadata !4, null}
!223 = metadata !{null}
!224 = metadata !{i32 786689, metadata !64, metadata !"name", metadata !6, i32 16777313, metadata !67, i32 0, metadata !222} ; [ DW_TAG_arg_variable ] [name] [line 97]
!225 = metadata !{i32 98, i32 0, metadata !64, metadata !222}
!226 = metadata !{i32 99, i32 0, metadata !64, metadata !222}
!227 = metadata !{i32 786688, metadata !64, metadata !"x", metadata !6, i32 98, metadata !9, i32 0, metadata !222} ; [ DW_TAG_auto_variable ] [x] [line 98]
!228 = metadata !{i32 100, i32 0, metadata !64, metadata !222}
!229 = metadata !{metadata !162, metadata !162, i64 0}
!230 = metadata !{metadata !220, metadata !162, i64 772}
!231 = metadata !{i32 160, i32 0, metadata !4, null}
!232 = metadata !{i32 161, i32 0, metadata !4, null}
!233 = metadata !{i32 46, i32 0, metadata !72, null}
!234 = metadata !{i32 47, i32 0, metadata !72, null}
!235 = metadata !{i32 48, i32 0, metadata !72, null}
!236 = metadata !{i32 50, i32 0, metadata !72, null}
!237 = metadata !{i32 51, i32 0, metadata !238, null}
!238 = metadata !{i32 786443, metadata !5, metadata !72, i32 51, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!239 = metadata !{i32 53, i32 0, metadata !72, null}
!240 = metadata !{i32 52, i32 0, metadata !238, null}
!241 = metadata !{i32 55, i32 0, metadata !72, null}
!242 = metadata !{i32 57, i32 0, metadata !72, null}
!243 = metadata !{metadata !244, metadata !162, i64 0}
!244 = metadata !{metadata !"", metadata !162, i64 0, metadata !165, i64 8, metadata !165, i64 16}
!245 = metadata !{i32 58, i32 0, metadata !72, null} ; [ DW_TAG_imported_module ]
!246 = metadata !{metadata !244, metadata !165, i64 8}
!247 = metadata !{i32 59, i32 0, metadata !72, null}
!248 = metadata !{i32 61, i32 0, metadata !72, null}
!249 = metadata !{i32 64, i32 0, metadata !250, null}
!250 = metadata !{i32 786443, metadata !5, metadata !72, i32 64, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_init.c]
!251 = metadata !{metadata !252, metadata !183, i64 8}
!252 = metadata !{metadata !"stat64", metadata !183, i64 0, metadata !183, i64 8, metadata !183, i64 16, metadata !162, i64 24, metadata !162, i64 28, metadata !162, i64 32, metadata !162, i64 36, metadata !183, i64 40, metadata !183, i64 48, metadata !183, i64 56, metadata !183, i64 64, metadata !253, i64 72, metadata !253, i64 88, metadata !253, i64 104, metadata !163, i64 120}
!253 = metadata !{metadata !"timespec", metadata !183, i64 0, metadata !183, i64 8}
!254 = metadata !{i32 66, i32 0, metadata !250, null}
!255 = metadata !{i32 71, i32 0, metadata !72, null}
!256 = metadata !{i32 75, i32 0, metadata !72, null}
!257 = metadata !{metadata !252, metadata !183, i64 56}
!258 = metadata !{i32 77, i32 0, metadata !72, null}
!259 = metadata !{metadata !252, metadata !162, i64 24}
!260 = metadata !{i32 78, i32 0, metadata !72, null}
!261 = metadata !{metadata !252, metadata !183, i64 0}
!262 = metadata !{i32 79, i32 0, metadata !72, null}
!263 = metadata !{metadata !252, metadata !183, i64 40}
!264 = metadata !{i32 80, i32 0, metadata !72, null}
!265 = metadata !{i32 81, i32 0, metadata !72, null}
!266 = metadata !{i32 82, i32 0, metadata !72, null}
!267 = metadata !{i32 83, i32 0, metadata !72, null}
!268 = metadata !{i32 84, i32 0, metadata !72, null}
!269 = metadata !{metadata !252, metadata !183, i64 16}
!270 = metadata !{i32 85, i32 0, metadata !72, null}
!271 = metadata !{metadata !252, metadata !162, i64 28}
!272 = metadata !{i32 86, i32 0, metadata !72, null}
!273 = metadata !{metadata !252, metadata !162, i64 32}
!274 = metadata !{i32 87, i32 0, metadata !72, null}
!275 = metadata !{i32 88, i32 0, metadata !72, null}
!276 = metadata !{metadata !252, metadata !183, i64 72}
!277 = metadata !{i32 89, i32 0, metadata !72, null}
!278 = metadata !{metadata !252, metadata !183, i64 88}
!279 = metadata !{i32 90, i32 0, metadata !72, null}
!280 = metadata !{metadata !252, metadata !183, i64 104}
!281 = metadata !{i32 92, i32 0, metadata !72, null}
!282 = metadata !{metadata !252, metadata !183, i64 48}
!283 = metadata !{i32 93, i32 0, metadata !72, null}
!284 = metadata !{metadata !252, metadata !183, i64 64}
!285 = metadata !{i32 94, i32 0, metadata !72, null}
!286 = metadata !{metadata !244, metadata !165, i64 16}
!287 = metadata !{i32 95, i32 0, metadata !72, null}
