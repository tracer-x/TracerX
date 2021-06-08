; ModuleID = 'strncmp.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i32 @strncmp(i8* nocapture readonly %s1, i8* nocapture readonly %s2, i64 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %s1}, i64 0, metadata !16), !dbg !22
  tail call void @llvm.dbg.value(metadata !{i8* %s2}, i64 0, metadata !17), !dbg !22
  tail call void @llvm.dbg.value(metadata !{i64 %n}, i64 0, metadata !18), !dbg !22
  %1 = icmp eq i64 %n, 0, !dbg !23
  br i1 %1, label %.loopexit, label %.preheader, !dbg !23

.preheader:                                       ; preds = %0, %12
  %.02 = phi i8* [ %13, %12 ], [ %s1, %0 ]
  %.01 = phi i8* [ %3, %12 ], [ %s2, %0 ]
  %.0 = phi i64 [ %14, %12 ], [ %n, %0 ]
  %2 = load i8* %.02, align 1, !dbg !25, !tbaa !28
  %3 = getelementptr inbounds i8* %.01, i64 1, !dbg !25
  tail call void @llvm.dbg.value(metadata !{i8* %3}, i64 0, metadata !17), !dbg !25
  %4 = load i8* %.01, align 1, !dbg !25, !tbaa !28
  %5 = icmp eq i8 %2, %4, !dbg !25
  br i1 %5, label %10, label %6, !dbg !25

; <label>:6                                       ; preds = %.preheader
  %7 = zext i8 %2 to i32, !dbg !31
  %8 = zext i8 %4 to i32, !dbg !31
  %9 = sub nsw i32 %7, %8, !dbg !31
  br label %.loopexit, !dbg !31

; <label>:10                                      ; preds = %.preheader
  tail call void @llvm.dbg.value(metadata !{i8* %13}, i64 0, metadata !16), !dbg !32
  %11 = icmp eq i8 %2, 0, !dbg !32
  br i1 %11, label %.loopexit, label %12, !dbg !32

; <label>:12                                      ; preds = %10
  %13 = getelementptr inbounds i8* %.02, i64 1, !dbg !32
  %14 = add i64 %.0, -1, !dbg !34
  tail call void @llvm.dbg.value(metadata !{i64 %14}, i64 0, metadata !18), !dbg !34
  %15 = icmp eq i64 %14, 0, !dbg !34
  br i1 %15, label %.loopexit, label %.preheader, !dbg !34

.loopexit:                                        ; preds = %10, %12, %0, %6
  %.03 = phi i32 [ %9, %6 ], [ 0, %0 ], [ 0, %12 ], [ 0, %10 ]
  ret i32 %.03, !dbg !35
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/strncmp.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncmp.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"strncmp", metadata !"strncmp", metadata !"", i32 36, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64)* @strncmp, null, null, metadata !15, i32 37} ; [ DW_TAG_subprogram ] [line 36] [def] [scope 37] [strncmp]
!5 = metadata !{metadata !"strncmp.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncmp.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !10, metadata !10, metadata !13}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!12 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{i32 786454, metadata !5, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!14 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!15 = metadata !{metadata !16, metadata !17, metadata !18}
!16 = metadata !{i32 786689, metadata !4, metadata !"s1", metadata !6, i32 16777252, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s1] [line 36]
!17 = metadata !{i32 786689, metadata !4, metadata !"s2", metadata !6, i32 33554468, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s2] [line 36]
!18 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !6, i32 50331684, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 36]
!19 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!20 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!21 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!22 = metadata !{i32 36, i32 0, metadata !4, null}
!23 = metadata !{i32 39, i32 0, metadata !24, null}
!24 = metadata !{i32 786443, metadata !5, metadata !4, i32 39, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncmp.c]
!25 = metadata !{i32 42, i32 0, metadata !26, null}
!26 = metadata !{i32 786443, metadata !5, metadata !27, i32 42, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncmp.c]
!27 = metadata !{i32 786443, metadata !5, metadata !4, i32 41, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncmp.c]
!28 = metadata !{metadata !29, metadata !29, i64 0}
!29 = metadata !{metadata !"omnipotent char", metadata !30, i64 0}
!30 = metadata !{metadata !"Simple C/C++ TBAA"}
!31 = metadata !{i32 43, i32 0, metadata !26, null}
!32 = metadata !{i32 45, i32 0, metadata !33, null}
!33 = metadata !{i32 786443, metadata !5, metadata !27, i32 45, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncmp.c]
!34 = metadata !{i32 47, i32 0, metadata !27, null}
!35 = metadata !{i32 49, i32 0, metadata !4, null}
