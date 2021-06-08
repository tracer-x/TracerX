; ModuleID = 'strrchr.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i8* @strrchr(i8* readonly %t, i32 %c) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %t}, i64 0, metadata !15), !dbg !22
  tail call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !16), !dbg !22
  tail call void @llvm.dbg.value(metadata !23, i64 0, metadata !18), !dbg !24
  %sext = shl i32 %c, 24, !dbg !25
  %1 = ashr exact i32 %sext, 24, !dbg !25
  br label %2, !dbg !29

; <label>:2                                       ; preds = %2, %0
  %.0 = phi i8* [ %t, %0 ], [ %7, %2 ]
  %l.0 = phi i8* [ null, %0 ], [ %.0.l.0, %2 ]
  %3 = load i8* %.0, align 1, !dbg !25, !tbaa !30
  %4 = sext i8 %3 to i32, !dbg !25
  %5 = icmp eq i32 %4, %1, !dbg !25
  tail call void @llvm.dbg.value(metadata !{i8* %.0}, i64 0, metadata !18), !dbg !25
  %.0.l.0 = select i1 %5, i8* %.0, i8* %l.0, !dbg !25
  %6 = icmp eq i8 %3, 0, !dbg !33
  %7 = getelementptr inbounds i8* %.0, i64 1, !dbg !35
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !15), !dbg !35
  br i1 %6, label %8, label %2, !dbg !33

; <label>:8                                       ; preds = %2
  ret i8* %.0.l.0, !dbg !33
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20}
!llvm.ident = !{!21}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/strrchr.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/strrchr.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"strrchr", metadata !"strrchr", metadata !"", i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32)* @strrchr, null, null, metadata !14, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [strrchr]
!5 = metadata !{metadata !"strrchr.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strrchr.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !11, metadata !13}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!10 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!11 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!12 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!13 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!14 = metadata !{metadata !15, metadata !16, metadata !17, metadata !18}
!15 = metadata !{i32 786689, metadata !4, metadata !"t", metadata !6, i32 16777228, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [t] [line 12]
!16 = metadata !{i32 786689, metadata !4, metadata !"c", metadata !6, i32 33554444, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 12]
!17 = metadata !{i32 786688, metadata !4, metadata !"ch", metadata !6, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ch] [line 13]
!18 = metadata !{i32 786688, metadata !4, metadata !"l", metadata !6, i32 14, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 14]
!19 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!20 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!21 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!22 = metadata !{i32 12, i32 0, metadata !4, null}
!23 = metadata !{i8* null}
!24 = metadata !{i32 14, i32 0, metadata !4, null}
!25 = metadata !{i32 18, i32 0, metadata !26, null}
!26 = metadata !{i32 786443, metadata !5, metadata !27, i32 18, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strrchr.c]
!27 = metadata !{i32 786443, metadata !5, metadata !28, i32 17, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strrchr.c]
!28 = metadata !{i32 786443, metadata !5, metadata !4, i32 17, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strrchr.c]
!29 = metadata !{i32 17, i32 0, metadata !28, null}
!30 = metadata !{metadata !31, metadata !31, i64 0}
!31 = metadata !{metadata !"omnipotent char", metadata !32, i64 0}
!32 = metadata !{metadata !"Simple C/C++ TBAA"}
!33 = metadata !{i32 18, i32 0, metadata !34, null}
!34 = metadata !{i32 786443, metadata !5, metadata !27, i32 18, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strrchr.c]
!35 = metadata !{i32 18, i32 0, metadata !27, null}
