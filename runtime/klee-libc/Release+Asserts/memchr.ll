; ModuleID = 'memchr.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readonly uwtable
define i8* @memchr(i8* readonly %s, i32 %c, i64 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %s}, i64 0, metadata !16), !dbg !28
  tail call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !17), !dbg !29
  tail call void @llvm.dbg.value(metadata !{i64 %n}, i64 0, metadata !18), !dbg !30
  %1 = icmp eq i64 %n, 0, !dbg !31
  br i1 %1, label %.loopexit, label %.preheader, !dbg !31

.preheader:                                       ; preds = %0, %5
  %.0 = phi i64 [ %7, %5 ], [ %n, %0 ]
  %p.0 = phi i8* [ %6, %5 ], [ %s, %0 ]
  tail call void @llvm.dbg.value(metadata !{i8* %6}, i64 0, metadata !19), !dbg !32
  %2 = load i8* %p.0, align 1, !dbg !32, !tbaa !35
  %3 = zext i8 %2 to i32, !dbg !32
  %4 = icmp eq i32 %3, %c, !dbg !32
  br i1 %4, label %.loopexit, label %5, !dbg !32

; <label>:5                                       ; preds = %.preheader
  %6 = getelementptr inbounds i8* %p.0, i64 1, !dbg !32
  %7 = add i64 %.0, -1, !dbg !38
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !18), !dbg !38
  %8 = icmp eq i64 %7, 0, !dbg !38
  br i1 %8, label %.loopexit, label %.preheader, !dbg !38

.loopexit:                                        ; preds = %5, %.preheader, %0
  %.01 = phi i8* [ null, %0 ], [ null, %5 ], [ %p.0, %.preheader ]
  ret i8* %.01, !dbg !39
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!25, !26}
!llvm.ident = !{!27}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/memchr.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/memchr.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"memchr", metadata !"memchr", metadata !"", i32 40, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i8* (i8*, i32, i64)* @memchr, null, null, metadata !15, i32 44} ; [ DW_TAG_subprogram ] [line 40] [def] [scope 44] [memchr]
!5 = metadata !{metadata !"memchr.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/memchr.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !10, metadata !12, metadata !13}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 786454, metadata !5, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!14 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!15 = metadata !{metadata !16, metadata !17, metadata !18, metadata !19}
!16 = metadata !{i32 786689, metadata !4, metadata !"s", metadata !6, i32 16777257, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 41]
!17 = metadata !{i32 786689, metadata !4, metadata !"c", metadata !6, i32 33554474, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 42]
!18 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !6, i32 50331691, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 43]
!19 = metadata !{i32 786688, metadata !20, metadata !"p", metadata !6, i32 46, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 46]
!20 = metadata !{i32 786443, metadata !5, metadata !21, i32 45, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/memchr.c]
!21 = metadata !{i32 786443, metadata !5, metadata !4, i32 45, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/memchr.c]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned char]
!24 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!25 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!26 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!27 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!28 = metadata !{i32 41, i32 0, metadata !4, null}
!29 = metadata !{i32 42, i32 0, metadata !4, null}
!30 = metadata !{i32 43, i32 0, metadata !4, null}
!31 = metadata !{i32 45, i32 0, metadata !21, null}
!32 = metadata !{i32 49, i32 0, metadata !33, null}
!33 = metadata !{i32 786443, metadata !5, metadata !34, i32 49, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/memchr.c]
!34 = metadata !{i32 786443, metadata !5, metadata !20, i32 48, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/memchr.c]
!35 = metadata !{metadata !36, metadata !36, i64 0}
!36 = metadata !{metadata !"omnipotent char", metadata !37, i64 0}
!37 = metadata !{metadata !"Simple C/C++ TBAA"}
!38 = metadata !{i32 51, i32 0, metadata !34, null}
!39 = metadata !{i32 54, i32 0, metadata !4, null}
