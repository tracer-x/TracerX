; ModuleID = 'strncpy.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i8* @strncpy(i8* %dst, i8* nocapture readonly %src, i64 %n) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %dst}, i64 0, metadata !16), !dbg !26
  tail call void @llvm.dbg.value(metadata !{i8* %src}, i64 0, metadata !17), !dbg !26
  tail call void @llvm.dbg.value(metadata !{i64 %n}, i64 0, metadata !18), !dbg !26
  %1 = icmp eq i64 %n, 0, !dbg !27
  br i1 %1, label %.loopexit, label %.preheader2, !dbg !27

.preheader2:                                      ; preds = %0, %8
  %indvar = phi i64 [ %indvar.next, %8 ], [ 0, %0 ]
  %.0 = phi i64 [ %11, %8 ], [ %n, %0 ]
  %d.0 = phi i8* [ %9, %8 ], [ %dst, %0 ]
  %s.0 = phi i8* [ %10, %8 ], [ %src, %0 ]
  tail call void @llvm.dbg.value(metadata !{i8* %10}, i64 0, metadata !22), !dbg !28
  %2 = load i8* %s.0, align 1, !dbg !28, !tbaa !31
  tail call void @llvm.dbg.value(metadata !{i8* %9}, i64 0, metadata !19), !dbg !28
  store i8 %2, i8* %d.0, align 1, !dbg !28, !tbaa !31
  %3 = icmp eq i8 %2, 0, !dbg !28
  br i1 %3, label %.preheader, label %8, !dbg !28

.preheader:                                       ; preds = %.preheader2
  %4 = icmp eq i64 %.0, 1, !dbg !34
  br i1 %4, label %.loopexit, label %.lr.ph, !dbg !34

.lr.ph:                                           ; preds = %.preheader
  %5 = add i64 %indvar, 1, !dbg !34
  %scevgep = getelementptr i8* %dst, i64 %5
  %6 = add i64 %n, -1, !dbg !34
  %7 = sub i64 %6, %indvar, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %7, i32 1, i1 false), !dbg !36
  br label %.loopexit, !dbg !34

; <label>:8                                       ; preds = %.preheader2
  %9 = getelementptr inbounds i8* %d.0, i64 1, !dbg !28
  %10 = getelementptr inbounds i8* %s.0, i64 1, !dbg !28
  %11 = add i64 %.0, -1, !dbg !37
  tail call void @llvm.dbg.value(metadata !{i64 %11}, i64 0, metadata !18), !dbg !37
  %12 = icmp eq i64 %11, 0, !dbg !37
  %indvar.next = add i64 %indvar, 1, !dbg !37
  br i1 %12, label %.loopexit, label %.preheader2, !dbg !37

.loopexit:                                        ; preds = %8, %.preheader, %.lr.ph, %0
  ret i8* %dst, !dbg !38
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24}
!llvm.ident = !{!25}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/strncpy.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"strncpy", metadata !"strncpy", metadata !"", i32 42, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @strncpy, null, null, metadata !15, i32 43} ; [ DW_TAG_subprogram ] [line 42] [def] [scope 43] [strncpy]
!5 = metadata !{metadata !"strncpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncpy.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !11, metadata !13}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!10 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!11 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!12 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!13 = metadata !{i32 786454, metadata !5, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!14 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!15 = metadata !{metadata !16, metadata !17, metadata !18, metadata !19, metadata !22}
!16 = metadata !{i32 786689, metadata !4, metadata !"dst", metadata !6, i32 16777258, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 42]
!17 = metadata !{i32 786689, metadata !4, metadata !"src", metadata !6, i32 33554474, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 42]
!18 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !6, i32 50331690, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 42]
!19 = metadata !{i32 786688, metadata !20, metadata !"d", metadata !6, i32 45, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [d] [line 45]
!20 = metadata !{i32 786443, metadata !5, metadata !21, i32 44, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncpy.c]
!21 = metadata !{i32 786443, metadata !5, metadata !4, i32 44, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncpy.c]
!22 = metadata !{i32 786688, metadata !20, metadata !"s", metadata !6, i32 46, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 46]
!23 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!24 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!25 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!26 = metadata !{i32 42, i32 0, metadata !4, null}
!27 = metadata !{i32 44, i32 0, metadata !21, null}
!28 = metadata !{i32 49, i32 0, metadata !29, null}
!29 = metadata !{i32 786443, metadata !5, metadata !30, i32 49, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncpy.c]
!30 = metadata !{i32 786443, metadata !5, metadata !20, i32 48, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncpy.c]
!31 = metadata !{metadata !32, metadata !32, i64 0}
!32 = metadata !{metadata !"omnipotent char", metadata !33, i64 0}
!33 = metadata !{metadata !"Simple C/C++ TBAA"}
!34 = metadata !{i32 51, i32 0, metadata !35, null}
!35 = metadata !{i32 786443, metadata !5, metadata !29, i32 49, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strncpy.c]
!36 = metadata !{i32 52, i32 0, metadata !35, null}
!37 = metadata !{i32 55, i32 0, metadata !30, null}
!38 = metadata !{i32 57, i32 0, metadata !4, null}
