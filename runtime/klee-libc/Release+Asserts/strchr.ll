; ModuleID = 'strchr.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i8* @strchr(i8* readonly %p, i32 %ch) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %p}, i64 0, metadata !15), !dbg !21
  tail call void @llvm.dbg.value(metadata !{i32 %ch}, i64 0, metadata !16), !dbg !21
  %1 = load i8* %p, align 1, !dbg !22, !tbaa !26
  %2 = sext i8 %1 to i32, !dbg !22
  %sext = shl i32 %ch, 24, !dbg !22
  %3 = ashr exact i32 %sext, 24, !dbg !22
  %4 = icmp eq i32 %2, %3, !dbg !22
  br i1 %4, label %split3, label %.lr.ph, !dbg !22

; <label>:5                                       ; preds = %.lr.ph
  %6 = load i8* %11, align 1, !dbg !22, !tbaa !26
  %7 = sext i8 %6 to i32, !dbg !22
  %8 = icmp eq i32 %7, %3, !dbg !22
  br i1 %8, label %split3, label %.lr.ph, !dbg !22

.lr.ph:                                           ; preds = %0, %5
  %9 = phi i8 [ %6, %5 ], [ %1, %0 ]
  %.012 = phi i8* [ %11, %5 ], [ %p, %0 ]
  %10 = icmp eq i8 %9, 0, !dbg !29
  %11 = getelementptr inbounds i8* %.012, i64 1, !dbg !31
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !15), !dbg !31
  br i1 %10, label %split3, label %5, !dbg !29

split3:                                           ; preds = %5, %.lr.ph, %0
  %.0 = phi i8* [ %p, %0 ], [ %11, %5 ], [ null, %.lr.ph ]
  ret i8* %.0, !dbg !32
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19}
!llvm.ident = !{!20}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/strchr.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/strchr.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"strchr", metadata !"strchr", metadata !"", i32 10, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32)* @strchr, null, null, metadata !14, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [strchr]
!5 = metadata !{metadata !"strchr.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strchr.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !11, metadata !13}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!10 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!11 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!12 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{metadata !15, metadata !16, metadata !17}
!15 = metadata !{i32 786689, metadata !4, metadata !"p", metadata !6, i32 16777226, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 10]
!16 = metadata !{i32 786689, metadata !4, metadata !"ch", metadata !6, i32 33554442, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ch] [line 10]
!17 = metadata !{i32 786688, metadata !4, metadata !"c", metadata !6, i32 11, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 11]
!18 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!19 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!20 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!21 = metadata !{i32 10, i32 0, metadata !4, null}
!22 = metadata !{i32 15, i32 0, metadata !23, null}
!23 = metadata !{i32 786443, metadata !5, metadata !24, i32 15, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strchr.c]
!24 = metadata !{i32 786443, metadata !5, metadata !25, i32 14, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strchr.c]
!25 = metadata !{i32 786443, metadata !5, metadata !4, i32 14, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strchr.c]
!26 = metadata !{metadata !27, metadata !27, i64 0}
!27 = metadata !{metadata !"omnipotent char", metadata !28, i64 0}
!28 = metadata !{metadata !"Simple C/C++ TBAA"}
!29 = metadata !{i32 17, i32 0, metadata !30, null}
!30 = metadata !{i32 786443, metadata !5, metadata !23, i32 17, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strchr.c]
!31 = metadata !{i32 14, i32 0, metadata !25, null}
!32 = metadata !{i32 23, i32 0, metadata !4, null}
