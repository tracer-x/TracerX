; ModuleID = 'stpcpy.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i8* @stpcpy(i8* %to, i8* nocapture readonly %from) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %to}, i64 0, metadata !14), !dbg !19
  tail call void @llvm.dbg.value(metadata !{i8* %from}, i64 0, metadata !15), !dbg !19
  %1 = load i8* %from, align 1, !dbg !20, !tbaa !22
  store i8 %1, i8* %to, align 1, !dbg !20, !tbaa !22
  %2 = icmp eq i8 %1, 0, !dbg !20
  br i1 %2, label %._crit_edge, label %.lr.ph, !dbg !20

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.03 = phi i8* [ %3, %.lr.ph ], [ %from, %0 ]
  %.012 = phi i8* [ %4, %.lr.ph ], [ %to, %0 ]
  %3 = getelementptr inbounds i8* %.03, i64 1, !dbg !20
  tail call void @llvm.dbg.value(metadata !{i8* %3}, i64 0, metadata !15), !dbg !20
  %4 = getelementptr inbounds i8* %.012, i64 1, !dbg !20
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !14), !dbg !20
  %5 = load i8* %3, align 1, !dbg !20, !tbaa !22
  store i8 %5, i8* %4, align 1, !dbg !20, !tbaa !22
  %6 = icmp eq i8 %5, 0, !dbg !20
  br i1 %6, label %._crit_edge, label %.lr.ph, !dbg !20

._crit_edge:                                      ; preds = %.lr.ph, %0
  %.01.lcssa = phi i8* [ %to, %0 ], [ %4, %.lr.ph ]
  ret i8* %.01.lcssa, !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/stpcpy.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/stpcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"stpcpy", metadata !"stpcpy", metadata !"", i32 38, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*)* @stpcpy, null, null, metadata !13, i32 39} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [stpcpy]
!5 = metadata !{metadata !"stpcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/stpcpy.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !11}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!10 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!11 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!12 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!13 = metadata !{metadata !14, metadata !15}
!14 = metadata !{i32 786689, metadata !4, metadata !"to", metadata !6, i32 16777254, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [to] [line 38]
!15 = metadata !{i32 786689, metadata !4, metadata !"from", metadata !6, i32 33554470, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [from] [line 38]
!16 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!17 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!18 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!19 = metadata !{i32 38, i32 0, metadata !4, null}
!20 = metadata !{i32 41, i32 0, metadata !21, null}
!21 = metadata !{i32 786443, metadata !5, metadata !4, i32 41, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/stpcpy.c]
!22 = metadata !{metadata !23, metadata !23, i64 0}
!23 = metadata !{metadata !"omnipotent char", metadata !24, i64 0}
!24 = metadata !{metadata !"Simple C/C++ TBAA"}
!25 = metadata !{i32 42, i32 0, metadata !4, null}
