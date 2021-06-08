; ModuleID = 'memset.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i8* @memset(i8* %dst, i32 %s, i64 %count) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %dst}, i64 0, metadata !14), !dbg !23
  tail call void @llvm.dbg.value(metadata !{i32 %s}, i64 0, metadata !15), !dbg !23
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !16), !dbg !23
  tail call void @llvm.dbg.value(metadata !{i8* %dst}, i64 0, metadata !17), !dbg !24
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !16), !dbg !25
  %1 = icmp eq i64 %count, 0, !dbg !25
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !25

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !26
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ptr.ind.end = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph
  %broadcast.splatinsert99 = insertelement <16 x i8> undef, i8 %2, i32 0
  %broadcast.splat100 = shufflevector <16 x i8> %broadcast.splatinsert99, <16 x i8> undef, <16 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %next.gep = getelementptr i8* %dst, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !26
  store <16 x i8> %broadcast.splat100, <16 x i8>* %3, align 1, !dbg !26
  %next.gep.sum148 = or i64 %index, 16, !dbg !26
  %4 = getelementptr i8* %dst, i64 %next.gep.sum148, !dbg !26
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !26
  store <16 x i8> %broadcast.splat100, <16 x i8>* %5, align 1, !dbg !26
  %index.next = add i64 %index, 32
  %6 = icmp eq i64 %index.next, %n.vec
  br i1 %6, label %middle.block, label %vector.body, !llvm.loop !27

middle.block:                                     ; preds = %vector.body, %.lr.ph
  %resume.val = phi i8* [ %dst, %.lr.ph ], [ %ptr.ind.end, %vector.body ]
  %resume.val3 = phi i64 [ %count, %.lr.ph ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %scalar.ph
  %a.02 = phi i8* [ %8, %scalar.ph ], [ %resume.val, %middle.block ]
  %.01 = phi i64 [ %7, %scalar.ph ], [ %resume.val3, %middle.block ]
  %7 = add i64 %.01, -1, !dbg !25
  %8 = getelementptr inbounds i8* %a.02, i64 1, !dbg !26
  tail call void @llvm.dbg.value(metadata !{i8* %8}, i64 0, metadata !17), !dbg !26
  store i8 %2, i8* %a.02, align 1, !dbg !26, !tbaa !30
  tail call void @llvm.dbg.value(metadata !{i64 %7}, i64 0, metadata !16), !dbg !25
  %9 = icmp eq i64 %7, 0, !dbg !25
  br i1 %9, label %._crit_edge, label %scalar.ph, !dbg !25, !llvm.loop !33

._crit_edge:                                      ; preds = %scalar.ph, %middle.block, %0
  ret i8* %dst, !dbg !34
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!20, !21}
!llvm.ident = !{!22}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/memset.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"memset", metadata !"memset", metadata !"", i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !13, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [memset]
!5 = metadata !{metadata !"memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/memset.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10, metadata !11}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = metadata !{i32 786454, metadata !5, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!12 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !17}
!14 = metadata !{i32 786689, metadata !4, metadata !"dst", metadata !6, i32 16777228, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!15 = metadata !{i32 786689, metadata !4, metadata !"s", metadata !6, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!16 = metadata !{i32 786689, metadata !4, metadata !"count", metadata !6, i32 50331660, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!17 = metadata !{i32 786688, metadata !4, metadata !"a", metadata !6, i32 13, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!18 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!19 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!21 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!22 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!23 = metadata !{i32 12, i32 0, metadata !4, null}
!24 = metadata !{i32 13, i32 0, metadata !4, null}
!25 = metadata !{i32 14, i32 0, metadata !4, null}
!26 = metadata !{i32 15, i32 0, metadata !4, null}
!27 = metadata !{metadata !27, metadata !28, metadata !29}
!28 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!29 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!30 = metadata !{metadata !31, metadata !31, i64 0}
!31 = metadata !{metadata !"omnipotent char", metadata !32, i64 0}
!32 = metadata !{metadata !"Simple C/C++ TBAA"}
!33 = metadata !{metadata !33, metadata !28, metadata !29}
!34 = metadata !{i32 16, i32 0, metadata !4, null}
