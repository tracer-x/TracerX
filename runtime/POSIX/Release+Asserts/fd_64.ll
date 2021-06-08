; ModuleID = 'fd_64.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.stat64 = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.statfs = type { i64, i64, i64, i64, i64, i64, i64, %struct.__fsid_t, i64, i64, i64, [4 x i64] }
%struct.__fsid_t = type { [2 x i32] }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }

@__getdents64 = alias i32 (i32, %struct.dirent*, i32)* @getdents64

; Function Attrs: nounwind uwtable
define i32 @open64(i8* %pathname, i32 %flags, ...) #0 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !14), !dbg !198
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !15), !dbg !198
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !16), !dbg !199
  %1 = and i32 %flags, 64, !dbg !200
  %2 = icmp eq i32 %1, 0, !dbg !200
  br i1 %2, label %21, label %3, !dbg !200

; <label>:3                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !20), !dbg !201
  %4 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !202
  call void @llvm.va_start(i8* %4), !dbg !202
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !203
  %6 = load i32* %5, align 16, !dbg !203
  %7 = icmp ult i32 %6, 41, !dbg !203
  br i1 %7, label %8, label %14, !dbg !203

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !203
  %10 = load i8** %9, align 16, !dbg !203
  %11 = sext i32 %6 to i64, !dbg !203
  %12 = getelementptr i8* %10, i64 %11, !dbg !203
  %13 = add i32 %6, 8, !dbg !203
  store i32 %13, i32* %5, align 16, !dbg !203
  br label %18, !dbg !203

; <label>:14                                      ; preds = %3
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !203
  %16 = load i8** %15, align 8, !dbg !203
  %17 = getelementptr i8* %16, i64 8, !dbg !203
  store i8* %17, i8** %15, align 8, !dbg !203
  br label %18, !dbg !203

; <label>:18                                      ; preds = %14, %8
  %.in = phi i8* [ %12, %8 ], [ %16, %14 ]
  %19 = bitcast i8* %.in to i32*, !dbg !203
  %20 = load i32* %19, align 4, !dbg !203
  call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !16), !dbg !203
  call void @llvm.va_end(i8* %4), !dbg !204
  br label %21, !dbg !205

; <label>:21                                      ; preds = %0, %18
  %mode.0 = phi i32 [ %20, %18 ], [ 0, %0 ]
  %22 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) #2, !dbg !206
  ret i32 %22, !dbg !206
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

declare i32 @__fd_open(i8*, i32, i32) #3

; Function Attrs: nounwind uwtable
define i32 @openat64(i32 %fd, i8* %pathname, i32 %flags, ...) #0 {
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !41), !dbg !207
  call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !42), !dbg !207
  call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !43), !dbg !207
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !44), !dbg !208
  %1 = and i32 %flags, 64, !dbg !209
  %2 = icmp eq i32 %1, 0, !dbg !209
  br i1 %2, label %21, label %3, !dbg !209

; <label>:3                                       ; preds = %0
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !45), !dbg !210
  %4 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !211
  call void @llvm.va_start(i8* %4), !dbg !211
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !212
  %6 = load i32* %5, align 16, !dbg !212
  %7 = icmp ult i32 %6, 41, !dbg !212
  br i1 %7, label %8, label %14, !dbg !212

; <label>:8                                       ; preds = %3
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !212
  %10 = load i8** %9, align 16, !dbg !212
  %11 = sext i32 %6 to i64, !dbg !212
  %12 = getelementptr i8* %10, i64 %11, !dbg !212
  %13 = add i32 %6, 8, !dbg !212
  store i32 %13, i32* %5, align 16, !dbg !212
  br label %18, !dbg !212

; <label>:14                                      ; preds = %3
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !212
  %16 = load i8** %15, align 8, !dbg !212
  %17 = getelementptr i8* %16, i64 8, !dbg !212
  store i8* %17, i8** %15, align 8, !dbg !212
  br label %18, !dbg !212

; <label>:18                                      ; preds = %14, %8
  %.in = phi i8* [ %12, %8 ], [ %16, %14 ]
  %19 = bitcast i8* %.in to i32*, !dbg !212
  %20 = load i32* %19, align 4, !dbg !212
  call void @llvm.dbg.value(metadata !{i32 %20}, i64 0, metadata !44), !dbg !212
  call void @llvm.va_end(i8* %4), !dbg !213
  br label %21, !dbg !214

; <label>:21                                      ; preds = %0, %18
  %mode.0 = phi i32 [ %20, %18 ], [ 0, %0 ]
  %22 = call i32 @__fd_openat(i32 %fd, i8* %pathname, i32 %flags, i32 %mode.0) #2, !dbg !215
  ret i32 %22, !dbg !215
}

declare i32 @__fd_openat(i32, i8*, i32, i32) #3

; Function Attrs: nounwind uwtable
define i64 @lseek64(i32 %fd, i64 %offset, i32 %whence) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !55), !dbg !216
  tail call void @llvm.dbg.value(metadata !{i64 %offset}, i64 0, metadata !56), !dbg !216
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !57), !dbg !216
  %1 = tail call i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) #2, !dbg !217
  ret i64 %1, !dbg !217
}

declare i64 @__fd_lseek(i32, i64, i32) #3

; Function Attrs: nounwind uwtable
define i32 @__xstat64(i32 %vers, i8* %path, %struct.stat* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !100), !dbg !218
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !101), !dbg !218
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !102), !dbg !218
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !219
  %2 = tail call i32 @__fd_stat(i8* %path, %struct.stat64* %1) #2, !dbg !219
  ret i32 %2, !dbg !219
}

declare i32 @__fd_stat(i8*, %struct.stat64*) #3

; Function Attrs: inlinehint nounwind uwtable
define i32 @stat64(i8* %path, %struct.stat* %buf) #4 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !107), !dbg !220
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !108), !dbg !220
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !221
  %2 = tail call i32 @__fd_stat(i8* %path, %struct.stat64* %1) #2, !dbg !221
  ret i32 %2, !dbg !221
}

; Function Attrs: nounwind uwtable
define i32 @__lxstat64(i32 %vers, i8* %path, %struct.stat* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !111), !dbg !222
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !112), !dbg !222
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !113), !dbg !222
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !223
  %2 = tail call i32 @__fd_lstat(i8* %path, %struct.stat64* %1) #2, !dbg !223
  ret i32 %2, !dbg !223
}

declare i32 @__fd_lstat(i8*, %struct.stat64*) #3

; Function Attrs: inlinehint nounwind uwtable
define i32 @lstat64(i8* %path, %struct.stat* %buf) #4 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !116), !dbg !224
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !117), !dbg !224
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !225
  %2 = tail call i32 @__fd_lstat(i8* %path, %struct.stat64* %1) #2, !dbg !225
  ret i32 %2, !dbg !225
}

; Function Attrs: nounwind uwtable
define i32 @__fxstat64(i32 %vers, i32 %fd, %struct.stat* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %vers}, i64 0, metadata !122), !dbg !226
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !123), !dbg !226
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !124), !dbg !226
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !227
  %2 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat64* %1) #2, !dbg !227
  ret i32 %2, !dbg !227
}

declare i32 @__fd_fstat(i32, %struct.stat64*) #3

; Function Attrs: inlinehint nounwind uwtable
define i32 @fstat64(i32 %fd, %struct.stat* %buf) #4 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !129), !dbg !228
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !130), !dbg !228
  %1 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !229
  %2 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat64* %1) #2, !dbg !229
  ret i32 %2, !dbg !229
}

; Function Attrs: nounwind uwtable
define i32 @ftruncate64(i32 %fd, i64 %length) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !135), !dbg !230
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !136), !dbg !230
  %1 = tail call i32 @__fd_ftruncate(i32 %fd, i64 %length) #2, !dbg !231
  ret i32 %1, !dbg !231
}

declare i32 @__fd_ftruncate(i32, i64) #3

; Function Attrs: nounwind uwtable
define weak i32 @statfs64(i8* %path, %struct.statfs* %buf) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !171), !dbg !232
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !172), !dbg !232
  %1 = tail call i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) #2, !dbg !233
  ret i32 %1, !dbg !233
}

declare i32 @__fd_statfs(i8*, %struct.statfs*) #3

; Function Attrs: nounwind uwtable
define i32 @getdents64(i32 %fd, %struct.dirent* %dirp, i32 %count) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !192), !dbg !234
  tail call void @llvm.dbg.value(metadata !{%struct.dirent* %dirp}, i64 0, metadata !193), !dbg !234
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !194), !dbg !234
  %1 = bitcast %struct.dirent* %dirp to %struct.dirent64*, !dbg !235
  %2 = tail call i32 @__fd_getdents(i32 %fd, %struct.dirent64* %1, i32 %count) #2, !dbg !235
  ret i32 %2, !dbg !235
}

declare i32 @__fd_getdents(i32, %struct.dirent64*, i32) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!195, !196}
!llvm.ident = !{!197}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/POSIX//home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !37, metadata !48, metadata !58, metadata !103, metadata !109, metadata !114, metadata !118, metadata !125, metadata !131, metadata !137, metadata !173}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"open", metadata !"open", metadata !"open64", i32 45, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, ...)* @open64, null, null, metadata !13, i32 45} ; [ DW_TAG_subprogram ] [line 45] [def] [open]
!5 = metadata !{metadata !"fd_64.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !10, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!12 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !20}
!14 = metadata !{i32 786689, metadata !4, metadata !"pathname", metadata !6, i32 16777261, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 45]
!15 = metadata !{i32 786689, metadata !4, metadata !"flags", metadata !6, i32 33554477, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 45]
!16 = metadata !{i32 786688, metadata !4, metadata !"mode", metadata !6, i32 46, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 46]
!17 = metadata !{i32 786454, metadata !5, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!18 = metadata !{i32 786454, metadata !5, null, metadata !"__mode_t", i32 129, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ] [__mode_t] [line 129, size 0, align 0, offset 0] [from unsigned int]
!19 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!20 = metadata !{i32 786688, metadata !21, metadata !"ap", metadata !6, i32 50, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 50]
!21 = metadata !{i32 786443, metadata !5, metadata !22, i32 48, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c]
!22 = metadata !{i32 786443, metadata !5, metadata !4, i32 48, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c]
!23 = metadata !{i32 786454, metadata !5, null, metadata !"va_list", i32 79, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_typedef ] [va_list] [line 79, size 0, align 0, offset 0] [from __gnuc_va_list]
!24 = metadata !{i32 786454, metadata !5, null, metadata !"__gnuc_va_list", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !25} ; [ DW_TAG_typedef ] [__gnuc_va_list] [line 48, size 0, align 0, offset 0] [from __builtin_va_list]
!25 = metadata !{i32 786454, metadata !5, null, metadata !"__builtin_va_list", i32 50, i64 0, i64 0, i64 0, i32 0, metadata !26} ; [ DW_TAG_typedef ] [__builtin_va_list] [line 50, size 0, align 0, offset 0] [from ]
!26 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !27, metadata !35, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __va_list_tag]
!27 = metadata !{i32 786454, metadata !5, null, metadata !"__va_list_tag", i32 50, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_typedef ] [__va_list_tag] [line 50, size 0, align 0, offset 0] [from __va_list_tag]
!28 = metadata !{i32 786451, metadata !1, null, metadata !"__va_list_tag", i32 50, i64 192, i64 64, i32 0, i32 0, null, metadata !29, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 50, size 192, align 64, offset 0] [def] [from ]
!29 = metadata !{metadata !30, metadata !31, metadata !32, metadata !34}
!30 = metadata !{i32 786445, metadata !1, metadata !28, metadata !"gp_offset", i32 50, i64 32, i64 32, i64 0, i32 0, metadata !19} ; [ DW_TAG_member ] [gp_offset] [line 50, size 32, align 32, offset 0] [from unsigned int]
!31 = metadata !{i32 786445, metadata !1, metadata !28, metadata !"fp_offset", i32 50, i64 32, i64 32, i64 32, i32 0, metadata !19} ; [ DW_TAG_member ] [fp_offset] [line 50, size 32, align 32, offset 32] [from unsigned int]
!32 = metadata !{i32 786445, metadata !1, metadata !28, metadata !"overflow_arg_area", i32 50, i64 64, i64 64, i64 64, i32 0, metadata !33} ; [ DW_TAG_member ] [overflow_arg_area] [line 50, size 64, align 64, offset 64] [from ]
!33 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!34 = metadata !{i32 786445, metadata !1, metadata !28, metadata !"reg_save_area", i32 50, i64 64, i64 64, i64 128, i32 0, metadata !33} ; [ DW_TAG_member ] [reg_save_area] [line 50, size 64, align 64, offset 128] [from ]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786465, i64 0, i64 1}        ; [ DW_TAG_subrange_type ] [0, 0]
!37 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"openat", metadata !"openat", metadata !"openat64", i32 59, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32, ...)* @openat64, null, null, metadata !40, i32 59} ; [ DW_TAG_subprogram ] [line 59] [def] [openat]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{metadata !9, metadata !9, metadata !10, metadata !9}
!40 = metadata !{metadata !41, metadata !42, metadata !43, metadata !44, metadata !45}
!41 = metadata !{i32 786689, metadata !37, metadata !"fd", metadata !6, i32 16777275, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 59]
!42 = metadata !{i32 786689, metadata !37, metadata !"pathname", metadata !6, i32 33554491, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 59]
!43 = metadata !{i32 786689, metadata !37, metadata !"flags", metadata !6, i32 50331707, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 59]
!44 = metadata !{i32 786688, metadata !37, metadata !"mode", metadata !6, i32 60, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 60]
!45 = metadata !{i32 786688, metadata !46, metadata !"ap", metadata !6, i32 64, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 64]
!46 = metadata !{i32 786443, metadata !5, metadata !47, i32 62, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c]
!47 = metadata !{i32 786443, metadata !5, metadata !37, i32 62, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/fd_64.c]
!48 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"lseek", metadata !"lseek", metadata !"lseek64", i32 73, metadata !49, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @lseek64, null, null, metadata !54, i32 73} ; [ DW_TAG_subprogram ] [line 73] [def] [lseek]
!49 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !50, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = metadata !{metadata !51, metadata !9, metadata !53, metadata !9}
!51 = metadata !{i32 786454, metadata !5, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!52 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!53 = metadata !{i32 786454, metadata !5, null, metadata !"off64_t", i32 93, i64 0, i64 0, i64 0, i32 0, metadata !51} ; [ DW_TAG_typedef ] [off64_t] [line 93, size 0, align 0, offset 0] [from __off64_t]
!54 = metadata !{metadata !55, metadata !56, metadata !57}
!55 = metadata !{i32 786689, metadata !48, metadata !"fd", metadata !6, i32 16777289, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 73]
!56 = metadata !{i32 786689, metadata !48, metadata !"offset", metadata !6, i32 33554505, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 73]
!57 = metadata !{i32 786689, metadata !48, metadata !"whence", metadata !6, i32 50331721, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [whence] [line 73]
!58 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__xstat", metadata !"__xstat", metadata !"__xstat64", i32 77, metadata !59, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__xstat64, null, null, metadata !99, i32 77} ; [ DW_TAG_subprogram ] [line 77] [def] [__xstat]
!59 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !60, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = metadata !{metadata !9, metadata !9, metadata !10, metadata !61}
!61 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !62} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat]
!62 = metadata !{i32 786451, metadata !63, null, metadata !"stat", i32 46, i64 1152, i64 64, i32 0, i32 0, null, metadata !64, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat] [line 46, size 1152, align 64, offset 0] [def] [from ]
!63 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/stat.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!64 = metadata !{metadata !65, metadata !68, metadata !70, metadata !72, metadata !73, metadata !75, metadata !77, metadata !78, metadata !79, metadata !81, metadata !83, metadata !85, metadata !93, metadata !94, metadata !95}
!65 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_dev", i32 48, i64 64, i64 64, i64 0, i32 0, metadata !66} ; [ DW_TAG_member ] [st_dev] [line 48, size 64, align 64, offset 0] [from __dev_t]
!66 = metadata !{i32 786454, metadata !63, null, metadata !"__dev_t", i32 124, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__dev_t] [line 124, size 0, align 0, offset 0] [from long unsigned int]
!67 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!68 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_ino", i32 53, i64 64, i64 64, i64 64, i32 0, metadata !69} ; [ DW_TAG_member ] [st_ino] [line 53, size 64, align 64, offset 64] [from __ino_t]
!69 = metadata !{i32 786454, metadata !63, null, metadata !"__ino_t", i32 127, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__ino_t] [line 127, size 0, align 0, offset 0] [from long unsigned int]
!70 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_nlink", i32 61, i64 64, i64 64, i64 128, i32 0, metadata !71} ; [ DW_TAG_member ] [st_nlink] [line 61, size 64, align 64, offset 128] [from __nlink_t]
!71 = metadata !{i32 786454, metadata !63, null, metadata !"__nlink_t", i32 130, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__nlink_t] [line 130, size 0, align 0, offset 0] [from long unsigned int]
!72 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_mode", i32 62, i64 32, i64 32, i64 192, i32 0, metadata !18} ; [ DW_TAG_member ] [st_mode] [line 62, size 32, align 32, offset 192] [from __mode_t]
!73 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_uid", i32 64, i64 32, i64 32, i64 224, i32 0, metadata !74} ; [ DW_TAG_member ] [st_uid] [line 64, size 32, align 32, offset 224] [from __uid_t]
!74 = metadata !{i32 786454, metadata !63, null, metadata !"__uid_t", i32 125, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ] [__uid_t] [line 125, size 0, align 0, offset 0] [from unsigned int]
!75 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_gid", i32 65, i64 32, i64 32, i64 256, i32 0, metadata !76} ; [ DW_TAG_member ] [st_gid] [line 65, size 32, align 32, offset 256] [from __gid_t]
!76 = metadata !{i32 786454, metadata !63, null, metadata !"__gid_t", i32 126, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ] [__gid_t] [line 126, size 0, align 0, offset 0] [from unsigned int]
!77 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"__pad0", i32 67, i64 32, i64 32, i64 288, i32 0, metadata !9} ; [ DW_TAG_member ] [__pad0] [line 67, size 32, align 32, offset 288] [from int]
!78 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_rdev", i32 69, i64 64, i64 64, i64 320, i32 0, metadata !66} ; [ DW_TAG_member ] [st_rdev] [line 69, size 64, align 64, offset 320] [from __dev_t]
!79 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_size", i32 74, i64 64, i64 64, i64 384, i32 0, metadata !80} ; [ DW_TAG_member ] [st_size] [line 74, size 64, align 64, offset 384] [from __off_t]
!80 = metadata !{i32 786454, metadata !63, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!81 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_blksize", i32 78, i64 64, i64 64, i64 448, i32 0, metadata !82} ; [ DW_TAG_member ] [st_blksize] [line 78, size 64, align 64, offset 448] [from __blksize_t]
!82 = metadata !{i32 786454, metadata !63, null, metadata !"__blksize_t", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__blksize_t] [line 153, size 0, align 0, offset 0] [from long int]
!83 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_blocks", i32 80, i64 64, i64 64, i64 512, i32 0, metadata !84} ; [ DW_TAG_member ] [st_blocks] [line 80, size 64, align 64, offset 512] [from __blkcnt_t]
!84 = metadata !{i32 786454, metadata !63, null, metadata !"__blkcnt_t", i32 158, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__blkcnt_t] [line 158, size 0, align 0, offset 0] [from long int]
!85 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_atim", i32 91, i64 128, i64 64, i64 576, i32 0, metadata !86} ; [ DW_TAG_member ] [st_atim] [line 91, size 128, align 64, offset 576] [from timespec]
!86 = metadata !{i32 786451, metadata !87, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !88, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!87 = metadata !{metadata !"/usr/include/time.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!88 = metadata !{metadata !89, metadata !91}
!89 = metadata !{i32 786445, metadata !87, metadata !86, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !90} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!90 = metadata !{i32 786454, metadata !87, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!91 = metadata !{i32 786445, metadata !87, metadata !86, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !92} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!92 = metadata !{i32 786454, metadata !87, null, metadata !"__syscall_slong_t", i32 175, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__syscall_slong_t] [line 175, size 0, align 0, offset 0] [from long int]
!93 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_mtim", i32 92, i64 128, i64 64, i64 704, i32 0, metadata !86} ; [ DW_TAG_member ] [st_mtim] [line 92, size 128, align 64, offset 704] [from timespec]
!94 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"st_ctim", i32 93, i64 128, i64 64, i64 832, i32 0, metadata !86} ; [ DW_TAG_member ] [st_ctim] [line 93, size 128, align 64, offset 832] [from timespec]
!95 = metadata !{i32 786445, metadata !63, metadata !62, metadata !"__glibc_reserved", i32 106, i64 192, i64 64, i64 960, i32 0, metadata !96} ; [ DW_TAG_member ] [__glibc_reserved] [line 106, size 192, align 64, offset 960] [from ]
!96 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !92, metadata !97, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __syscall_slong_t]
!97 = metadata !{metadata !98}
!98 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!99 = metadata !{metadata !100, metadata !101, metadata !102}
!100 = metadata !{i32 786689, metadata !58, metadata !"vers", metadata !6, i32 16777293, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 77]
!101 = metadata !{i32 786689, metadata !58, metadata !"path", metadata !6, i32 33554509, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 77]
!102 = metadata !{i32 786689, metadata !58, metadata !"buf", metadata !6, i32 50331725, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 77]
!103 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"stat", metadata !"stat", metadata !"stat64", i32 81, metadata !104, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @stat64, null, null, metadata !106, i32 81} ; [ DW_TAG_subprogram ] [line 81] [def] [stat]
!104 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !105, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!105 = metadata !{metadata !9, metadata !10, metadata !61}
!106 = metadata !{metadata !107, metadata !108}
!107 = metadata !{i32 786689, metadata !103, metadata !"path", metadata !6, i32 16777297, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 81]
!108 = metadata !{i32 786689, metadata !103, metadata !"buf", metadata !6, i32 33554513, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 81]
!109 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__lxstat", metadata !"__lxstat", metadata !"__lxstat64", i32 85, metadata !59, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*)* @__lxstat64, null, null, metadata !110, i32 85} ; [ DW_TAG_subprogram ] [line 85] [def] [__lxstat]
!110 = metadata !{metadata !111, metadata !112, metadata !113}
!111 = metadata !{i32 786689, metadata !109, metadata !"vers", metadata !6, i32 16777301, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 85]
!112 = metadata !{i32 786689, metadata !109, metadata !"path", metadata !6, i32 33554517, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 85]
!113 = metadata !{i32 786689, metadata !109, metadata !"buf", metadata !6, i32 50331733, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 85]
!114 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"lstat", metadata !"lstat", metadata !"lstat64", i32 89, metadata !104, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat*)* @lstat64, null, null, metadata !115, i32 89} ; [ DW_TAG_subprogram ] [line 89] [def] [lstat]
!115 = metadata !{metadata !116, metadata !117}
!116 = metadata !{i32 786689, metadata !114, metadata !"path", metadata !6, i32 16777305, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 89]
!117 = metadata !{i32 786689, metadata !114, metadata !"buf", metadata !6, i32 33554521, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 89]
!118 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__fxstat", metadata !"__fxstat", metadata !"__fxstat64", i32 93, metadata !119, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, %struct.stat*)* @__fxstat64, null, null, metadata !121, i32 93} ; [ DW_TAG_subprogram ] [line 93] [def] [__fxstat]
!119 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !120, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!120 = metadata !{metadata !9, metadata !9, metadata !9, metadata !61}
!121 = metadata !{metadata !122, metadata !123, metadata !124}
!122 = metadata !{i32 786689, metadata !118, metadata !"vers", metadata !6, i32 16777309, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vers] [line 93]
!123 = metadata !{i32 786689, metadata !118, metadata !"fd", metadata !6, i32 33554525, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 93]
!124 = metadata !{i32 786689, metadata !118, metadata !"buf", metadata !6, i32 50331741, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 93]
!125 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"fstat", metadata !"fstat", metadata !"fstat64", i32 97, metadata !126, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat*)* @fstat64, null, null, metadata !128, i32 97} ; [ DW_TAG_subprogram ] [line 97] [def] [fstat]
!126 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !127, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!127 = metadata !{metadata !9, metadata !9, metadata !61}
!128 = metadata !{metadata !129, metadata !130}
!129 = metadata !{i32 786689, metadata !125, metadata !"fd", metadata !6, i32 16777313, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 97]
!130 = metadata !{i32 786689, metadata !125, metadata !"buf", metadata !6, i32 33554529, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 97]
!131 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ftruncate64", metadata !"ftruncate64", metadata !"", i32 101, metadata !132, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @ftruncate64, null, null, metadata !134, i32 101} ; [ DW_TAG_subprogram ] [line 101] [def] [ftruncate64]
!132 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !133, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!133 = metadata !{metadata !9, metadata !9, metadata !53}
!134 = metadata !{metadata !135, metadata !136}
!135 = metadata !{i32 786689, metadata !131, metadata !"fd", metadata !6, i32 16777317, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 101]
!136 = metadata !{i32 786689, metadata !131, metadata !"length", metadata !6, i32 33554533, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 101]
!137 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"statfs", metadata !"statfs", metadata !"statfs64", i32 106, metadata !138, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @statfs64, null, null, metadata !170, i32 106} ; [ DW_TAG_subprogram ] [line 106] [def] [statfs]
!138 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !139, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!139 = metadata !{metadata !9, metadata !10, metadata !140}
!140 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !141} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from statfs]
!141 = metadata !{i32 786451, metadata !142, null, metadata !"statfs", i32 24, i64 960, i64 64, i32 0, i32 0, null, metadata !143, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [statfs] [line 24, size 960, align 64, offset 0] [def] [from ]
!142 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/statfs.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!143 = metadata !{metadata !144, metadata !146, metadata !147, metadata !149, metadata !150, metadata !151, metadata !153, metadata !154, metadata !163, metadata !164, metadata !165, metadata !166}
!144 = metadata !{i32 786445, metadata !142, metadata !141, metadata !"f_type", i32 26, i64 64, i64 64, i64 0, i32 0, metadata !145} ; [ DW_TAG_member ] [f_type] [line 26, size 64, align 64, offset 0] [from __fsword_t]
!145 = metadata !{i32 786454, metadata !142, null, metadata !"__fsword_t", i32 170, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__fsword_t] [line 170, size 0, align 0, offset 0] [from long int]
!146 = metadata !{i32 786445, metadata !142, metadata !141, metadata !"f_bsize", i32 27, i64 64, i64 64, i64 64, i32 0, metadata !145} ; [ DW_TAG_member ] [f_bsize] [line 27, size 64, align 64, offset 64] [from __fsword_t]
!147 = metadata !{i32 786445, metadata !142, metadata !141, metadata !"f_blocks", i32 35, i64 64, i64 64, i64 128, i32 0, metadata !148} ; [ DW_TAG_member ] [f_blocks] [line 35, size 64, align 64, offset 128] [from __fsblkcnt64_t]
!148 = metadata !{i32 786454, metadata !142, null, metadata !"__fsblkcnt64_t", i32 163, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__fsblkcnt64_t] [line 163, size 0, align 0, offset 0] [from long unsigned int]
!149 = metadata !{i32 786445, metadata !142, metadata !141, metadata !"f_bfree", i32 36, i64 64, i64 64, i64 192, i32 0, metadata !148} ; [ DW_TAG_member ] [f_bfree] [line 36, size 64, align 64, offset 192] [from __fsblkcnt64_t]
!150 = metadata !{i32 786445, metadata !142, metadata !141, metadata !"f_bavail", i32 37, i64 64, i64 64, i64 256, i32 0, metadata !148} ; [ DW_TAG_member ] [f_bavail] [line 37, size 64, align 64, offset 256] [from __fsblkcnt64_t]
!151 = metadata !{i32 786445, metadata !142, metadata !141, metadata !"f_files", i32 38, i64 64, i64 64, i64 320, i32 0, metadata !152} ; [ DW_TAG_member ] [f_files] [line 38, size 64, align 64, offset 320] [from __fsfilcnt64_t]
!152 = metadata !{i32 786454, metadata !142, null, metadata !"__fsfilcnt64_t", i32 167, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__fsfilcnt64_t] [line 167, size 0, align 0, offset 0] [from long unsigned int]
!153 = metadata !{i32 786445, metadata !142, metadata !141, metadata !"f_ffree", i32 39, i64 64, i64 64, i64 384, i32 0, metadata !152} ; [ DW_TAG_member ] [f_ffree] [line 39, size 64, align 64, offset 384] [from __fsfilcnt64_t]
!154 = metadata !{i32 786445, metadata !142, metadata !141, metadata !"f_fsid", i32 41, i64 64, i64 32, i64 448, i32 0, metadata !155} ; [ DW_TAG_member ] [f_fsid] [line 41, size 64, align 32, offset 448] [from __fsid_t]
!155 = metadata !{i32 786454, metadata !142, null, metadata !"__fsid_t", i32 134, i64 0, i64 0, i64 0, i32 0, metadata !156} ; [ DW_TAG_typedef ] [__fsid_t] [line 134, size 0, align 0, offset 0] [from ]
!156 = metadata !{i32 786451, metadata !157, null, metadata !"", i32 134, i64 64, i64 32, i32 0, i32 0, null, metadata !158, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 134, size 64, align 32, offset 0] [def] [from ]
!157 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!158 = metadata !{metadata !159}
!159 = metadata !{i32 786445, metadata !157, metadata !156, metadata !"__val", i32 134, i64 64, i64 32, i64 0, i32 0, metadata !160} ; [ DW_TAG_member ] [__val] [line 134, size 64, align 32, offset 0] [from ]
!160 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 64, i64 32, i32 0, i32 0, metadata !9, metadata !161, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!161 = metadata !{metadata !162}
!162 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 1]
!163 = metadata !{i32 786445, metadata !142, metadata !141, metadata !"f_namelen", i32 42, i64 64, i64 64, i64 512, i32 0, metadata !145} ; [ DW_TAG_member ] [f_namelen] [line 42, size 64, align 64, offset 512] [from __fsword_t]
!164 = metadata !{i32 786445, metadata !142, metadata !141, metadata !"f_frsize", i32 43, i64 64, i64 64, i64 576, i32 0, metadata !145} ; [ DW_TAG_member ] [f_frsize] [line 43, size 64, align 64, offset 576] [from __fsword_t]
!165 = metadata !{i32 786445, metadata !142, metadata !141, metadata !"f_flags", i32 44, i64 64, i64 64, i64 640, i32 0, metadata !145} ; [ DW_TAG_member ] [f_flags] [line 44, size 64, align 64, offset 640] [from __fsword_t]
!166 = metadata !{i32 786445, metadata !142, metadata !141, metadata !"f_spare", i32 45, i64 256, i64 64, i64 704, i32 0, metadata !167} ; [ DW_TAG_member ] [f_spare] [line 45, size 256, align 64, offset 704] [from ]
!167 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 64, i32 0, i32 0, metadata !145, metadata !168, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from __fsword_t]
!168 = metadata !{metadata !169}
!169 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!170 = metadata !{metadata !171, metadata !172}
!171 = metadata !{i32 786689, metadata !137, metadata !"path", metadata !6, i32 16777322, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 106]
!172 = metadata !{i32 786689, metadata !137, metadata !"buf", metadata !6, i32 33554538, metadata !140, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 106]
!173 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"getdents64", metadata !"getdents64", metadata !"", i32 110, metadata !174, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.dirent*, i32)* @getdents64, null, null, metadata !191, i32 110} ; [ DW_TAG_subprogram ] [line 110] [def] [getdents64]
!174 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !175, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!175 = metadata !{metadata !9, metadata !19, metadata !176, metadata !19}
!176 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !177} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dirent]
!177 = metadata !{i32 786451, metadata !178, null, metadata !"dirent", i32 22, i64 2240, i64 64, i32 0, i32 0, null, metadata !179, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [dirent] [line 22, size 2240, align 64, offset 0] [def] [from ]
!178 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/dirent.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!179 = metadata !{metadata !180, metadata !182, metadata !183, metadata !185, metadata !187}
!180 = metadata !{i32 786445, metadata !178, metadata !177, metadata !"d_ino", i32 28, i64 64, i64 64, i64 0, i32 0, metadata !181} ; [ DW_TAG_member ] [d_ino] [line 28, size 64, align 64, offset 0] [from __ino64_t]
!181 = metadata !{i32 786454, metadata !178, null, metadata !"__ino64_t", i32 128, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__ino64_t] [line 128, size 0, align 0, offset 0] [from long unsigned int]
!182 = metadata !{i32 786445, metadata !178, metadata !177, metadata !"d_off", i32 29, i64 64, i64 64, i64 64, i32 0, metadata !51} ; [ DW_TAG_member ] [d_off] [line 29, size 64, align 64, offset 64] [from __off64_t]
!183 = metadata !{i32 786445, metadata !178, metadata !177, metadata !"d_reclen", i32 31, i64 16, i64 16, i64 128, i32 0, metadata !184} ; [ DW_TAG_member ] [d_reclen] [line 31, size 16, align 16, offset 128] [from unsigned short]
!184 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!185 = metadata !{i32 786445, metadata !178, metadata !177, metadata !"d_type", i32 32, i64 8, i64 8, i64 144, i32 0, metadata !186} ; [ DW_TAG_member ] [d_type] [line 32, size 8, align 8, offset 144] [from unsigned char]
!186 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!187 = metadata !{i32 786445, metadata !178, metadata !177, metadata !"d_name", i32 33, i64 2048, i64 8, i64 152, i32 0, metadata !188} ; [ DW_TAG_member ] [d_name] [line 33, size 2048, align 8, offset 152] [from ]
!188 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !12, metadata !189, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!189 = metadata !{metadata !190}
!190 = metadata !{i32 786465, i64 0, i64 256}     ; [ DW_TAG_subrange_type ] [0, 255]
!191 = metadata !{metadata !192, metadata !193, metadata !194}
!192 = metadata !{i32 786689, metadata !173, metadata !"fd", metadata !6, i32 16777326, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 110]
!193 = metadata !{i32 786689, metadata !173, metadata !"dirp", metadata !6, i32 33554542, metadata !176, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirp] [line 110]
!194 = metadata !{i32 786689, metadata !173, metadata !"count", metadata !6, i32 50331758, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 110]
!195 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!196 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!197 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!198 = metadata !{i32 45, i32 0, metadata !4, null}
!199 = metadata !{i32 46, i32 0, metadata !4, null}
!200 = metadata !{i32 48, i32 0, metadata !22, null}
!201 = metadata !{i32 50, i32 0, metadata !21, null}
!202 = metadata !{i32 51, i32 0, metadata !21, null}
!203 = metadata !{i32 52, i32 0, metadata !21, null}
!204 = metadata !{i32 53, i32 0, metadata !21, null}
!205 = metadata !{i32 54, i32 0, metadata !21, null}
!206 = metadata !{i32 56, i32 0, metadata !4, null}
!207 = metadata !{i32 59, i32 0, metadata !37, null}
!208 = metadata !{i32 60, i32 0, metadata !37, null}
!209 = metadata !{i32 62, i32 0, metadata !47, null}
!210 = metadata !{i32 64, i32 0, metadata !46, null}
!211 = metadata !{i32 65, i32 0, metadata !46, null}
!212 = metadata !{i32 66, i32 0, metadata !46, null}
!213 = metadata !{i32 67, i32 0, metadata !46, null}
!214 = metadata !{i32 68, i32 0, metadata !46, null}
!215 = metadata !{i32 70, i32 0, metadata !37, null}
!216 = metadata !{i32 73, i32 0, metadata !48, null}
!217 = metadata !{i32 74, i32 0, metadata !48, null}
!218 = metadata !{i32 77, i32 0, metadata !58, null}
!219 = metadata !{i32 78, i32 0, metadata !58, null}
!220 = metadata !{i32 81, i32 0, metadata !103, null}
!221 = metadata !{i32 82, i32 0, metadata !103, null}
!222 = metadata !{i32 85, i32 0, metadata !109, null}
!223 = metadata !{i32 86, i32 0, metadata !109, null}
!224 = metadata !{i32 89, i32 0, metadata !114, null}
!225 = metadata !{i32 90, i32 0, metadata !114, null}
!226 = metadata !{i32 93, i32 0, metadata !118, null}
!227 = metadata !{i32 94, i32 0, metadata !118, null}
!228 = metadata !{i32 97, i32 0, metadata !125, null}
!229 = metadata !{i32 98, i32 0, metadata !125, null}
!230 = metadata !{i32 101, i32 0, metadata !131, null}
!231 = metadata !{i32 102, i32 0, metadata !131, null}
!232 = metadata !{i32 106, i32 0, metadata !137, null}
!233 = metadata !{i32 107, i32 0, metadata !137, null}
!234 = metadata !{i32 110, i32 0, metadata !173, null}
!235 = metadata !{i32 111, i32 0, metadata !173, null}
