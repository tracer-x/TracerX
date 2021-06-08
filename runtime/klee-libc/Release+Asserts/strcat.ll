; ModuleID = 'strcat.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i8* @strcat(i8* %s, i8* nocapture readonly %append) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %s}, i64 0, metadata !14), !dbg !20
  tail call void @llvm.dbg.value(metadata !{i8* %append}, i64 0, metadata !15), !dbg !20
  tail call void @llvm.dbg.value(metadata !{i8* %s}, i64 0, metadata !16), !dbg !21
  br label %1, !dbg !22

; <label>:1                                       ; preds = %1, %0
  %.0 = phi i8* [ %s, %0 ], [ %4, %1 ]
  %2 = load i8* %.0, align 1, !dbg !22, !tbaa !24
  %3 = icmp eq i8 %2, 0, !dbg !22
  %4 = getelementptr inbounds i8* %.0, i64 1, !dbg !22
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !14), !dbg !22
  br i1 %3, label %.preheader, label %1, !dbg !22

.preheader:                                       ; preds = %1, %.preheader
  %.01 = phi i8* [ %5, %.preheader ], [ %append, %1 ]
  %.1 = phi i8* [ %7, %.preheader ], [ %.0, %1 ]
  %5 = getelementptr inbounds i8* %.01, i64 1, !dbg !27
  tail call void @llvm.dbg.value(metadata !{i8* %5}, i64 0, metadata !15), !dbg !27
  %6 = load i8* %.01, align 1, !dbg !27, !tbaa !24
  %7 = getelementptr inbounds i8* %.1, i64 1, !dbg !27
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !14), !dbg !27
  store i8 %6, i8* %.1, align 1, !dbg !27, !tbaa !24
  %8 = icmp eq i8 %6, 0, !dbg !27
  br i1 %8, label %9, label %.preheader, !dbg !27

; <label>:9                                       ; preds = %.preheader
  ret i8* %s, !dbg !28
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!17, !18}
!llvm.ident = !{!19}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/strcat.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/strcat.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"strcat", metadata !"strcat", metadata !"", i32 39, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*)* @strcat, null, null, metadata !13, i32 39} ; [ DW_TAG_subprogram ] [line 39] [def] [strcat]
!5 = metadata !{metadata !"strcat.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strcat.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !11}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!10 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!11 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!12 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!13 = metadata !{metadata !14, metadata !15, metadata !16}
!14 = metadata !{i32 786689, metadata !4, metadata !"s", metadata !6, i32 16777255, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 39]
!15 = metadata !{i32 786689, metadata !4, metadata !"append", metadata !6, i32 33554471, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [append] [line 39]
!16 = metadata !{i32 786688, metadata !4, metadata !"save", metadata !6, i32 40, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [save] [line 40]
!17 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!18 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!19 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!20 = metadata !{i32 39, i32 0, metadata !4, null}
!21 = metadata !{i32 40, i32 0, metadata !4, null}
!22 = metadata !{i32 42, i32 0, metadata !23, null}
!23 = metadata !{i32 786443, metadata !5, metadata !4, i32 42, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strcat.c]
!24 = metadata !{metadata !25, metadata !25, i64 0}
!25 = metadata !{metadata !"omnipotent char", metadata !26, i64 0}
!26 = metadata !{metadata !"Simple C/C++ TBAA"}
!27 = metadata !{i32 44, i32 0, metadata !4, null}
!28 = metadata !{i32 46, i32 0, metadata !4, null}
