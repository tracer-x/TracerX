; ModuleID = 'mempcpy.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i8* @mempcpy(i8* %destaddr, i8* nocapture readonly %srcaddr, i64 %len) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %destaddr}, i64 0, metadata !15), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i8* %srcaddr}, i64 0, metadata !16), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i64 %len}, i64 0, metadata !17), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i8* %destaddr}, i64 0, metadata !18), !dbg !28
  tail call void @llvm.dbg.value(metadata !{i8* %srcaddr}, i64 0, metadata !21), !dbg !29
  tail call void @llvm.dbg.value(metadata !{i64 %10}, i64 0, metadata !17), !dbg !30
  %1 = icmp eq i64 %len, 0, !dbg !30
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !30

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep5 = getelementptr i8* %srcaddr, i64 %2
  %scevgep4 = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep4, %srcaddr
  %bound0 = icmp uge i8* %scevgep5, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end7 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep104 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !31
  %wide.load = load <16 x i8>* %3, align 1, !dbg !31
  %next.gep.sum280 = or i64 %index, 16, !dbg !31
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !31
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !31
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !31
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !31
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !31
  %next.gep104.sum297 = or i64 %index, 16, !dbg !31
  %7 = getelementptr i8* %destaddr, i64 %next.gep104.sum297, !dbg !31
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !31
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !31
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !32

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val6 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end7, %vector.body ]
  %resume.val8 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val6, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val8, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !30
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !31
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !21), !dbg !31
  %12 = load i8* %src.03, align 1, !dbg !31, !tbaa !35
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !31
  tail call void @llvm.dbg.value(metadata !{i8* %scevgep}, i64 0, metadata !18), !dbg !31
  store i8 %12, i8* %dest.02, align 1, !dbg !31, !tbaa !35
  tail call void @llvm.dbg.value(metadata !{i64 %10}, i64 0, metadata !17), !dbg !30
  %14 = icmp eq i64 %10, 0, !dbg !30
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !30, !llvm.loop !38

._crit_edge:                                      ; preds = %middle.block, %.lr.ph
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !30

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !39
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25}
!llvm.ident = !{!26}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/mempcpy.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !14, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [mempcpy]
!5 = metadata !{metadata !"mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/mempcpy.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10, metadata !12}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{i32 786454, metadata !5, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!13 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!14 = metadata !{metadata !15, metadata !16, metadata !17, metadata !18, metadata !21}
!15 = metadata !{i32 786689, metadata !4, metadata !"destaddr", metadata !6, i32 16777228, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!16 = metadata !{i32 786689, metadata !4, metadata !"srcaddr", metadata !6, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!17 = metadata !{i32 786689, metadata !4, metadata !"len", metadata !6, i32 50331660, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!18 = metadata !{i32 786688, metadata !4, metadata !"dest", metadata !6, i32 13, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!19 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!20 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!21 = metadata !{i32 786688, metadata !4, metadata !"src", metadata !6, i32 14, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!24 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!25 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!26 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!27 = metadata !{i32 12, i32 0, metadata !4, null}
!28 = metadata !{i32 13, i32 0, metadata !4, null}
!29 = metadata !{i32 14, i32 0, metadata !4, null}
!30 = metadata !{i32 16, i32 0, metadata !4, null}
!31 = metadata !{i32 17, i32 0, metadata !4, null}
!32 = metadata !{metadata !32, metadata !33, metadata !34}
!33 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!34 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!35 = metadata !{metadata !36, metadata !36, i64 0}
!36 = metadata !{metadata !"omnipotent char", metadata !37, i64 0}
!37 = metadata !{metadata !"Simple C/C++ TBAA"}
!38 = metadata !{metadata !38, metadata !33, metadata !34}
!39 = metadata !{i32 18, i32 0, metadata !4, null}
