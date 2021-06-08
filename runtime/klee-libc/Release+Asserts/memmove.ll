; ModuleID = 'memmove.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i8* @memmove(i8* %dst, i8* readonly %src, i64 %count) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %dst}, i64 0, metadata !15), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i8* %src}, i64 0, metadata !16), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !17), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i8* %dst}, i64 0, metadata !18), !dbg !28
  tail call void @llvm.dbg.value(metadata !{i8* %src}, i64 0, metadata !21), !dbg !29
  %1 = icmp eq i8* %src, %dst, !dbg !30
  br i1 %1, label %.loopexit, label %2, !dbg !30

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !32
  br i1 %3, label %.preheader, label %18, !dbg !32

.preheader:                                       ; preds = %2
  tail call void @llvm.dbg.value(metadata !{i64 %13}, i64 0, metadata !17), !dbg !34
  %4 = icmp eq i64 %count, 0, !dbg !34
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !34

.lr.ph.preheader:                                 ; preds = %.preheader
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %5 = add i64 %count, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep11 = getelementptr i8* %src, i64 %5
  %scevgep = getelementptr i8* %dst, i64 %5
  %bound1 = icmp uge i8* %scevgep, %src
  %bound0 = icmp uge i8* %scevgep11, %dst
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %src, i64 %n.vec
  %ptr.ind.end13 = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep110 = getelementptr i8* %dst, i64 %index
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !34
  %wide.load = load <16 x i8>* %6, align 1, !dbg !34
  %next.gep.sum586 = or i64 %index, 16, !dbg !34
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !34
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !34
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !34
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !34
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !34
  %next.gep110.sum603 = or i64 %index, 16, !dbg !34
  %10 = getelementptr i8* %dst, i64 %next.gep110.sum603, !dbg !34
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !34
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !34
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !36

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %src, %.lr.ph.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val12 = phi i8* [ %dst, %.lr.ph.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end13, %vector.body ]
  %resume.val14 = phi i64 [ %count, %.lr.ph.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %middle.block, %.lr.ph
  %b.04 = phi i8* [ %14, %.lr.ph ], [ %resume.val, %middle.block ]
  %a.03 = phi i8* [ %16, %.lr.ph ], [ %resume.val12, %middle.block ]
  %.02 = phi i64 [ %13, %.lr.ph ], [ %resume.val14, %middle.block ]
  %13 = add i64 %.02, -1, !dbg !34
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !34
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !21), !dbg !34
  %15 = load i8* %b.04, align 1, !dbg !34, !tbaa !39
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !34
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !18), !dbg !34
  store i8 %15, i8* %a.03, align 1, !dbg !34, !tbaa !39
  tail call void @llvm.dbg.value(metadata !{i64 %13}, i64 0, metadata !17), !dbg !34
  %17 = icmp eq i64 %13, 0, !dbg !34
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !34, !llvm.loop !42

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !43
  tail call void @llvm.dbg.value(metadata !{i8* %22}, i64 0, metadata !18), !dbg !43
  tail call void @llvm.dbg.value(metadata !{i8* %21}, i64 0, metadata !21), !dbg !45
  tail call void @llvm.dbg.value(metadata !{i64 %33}, i64 0, metadata !17), !dbg !46
  %20 = icmp eq i64 %count, 0, !dbg !46
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !46

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !45
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !43
  %n.vec215 = and i64 %count, -32
  %cmp.zero217 = icmp eq i64 %n.vec215, 0
  %23 = add i64 %count, -1
  br i1 %cmp.zero217, label %middle.block210, label %vector.memcheck224

vector.memcheck224:                               ; preds = %.lr.ph9
  %scevgep219 = getelementptr i8* %src, i64 %23
  %scevgep218 = getelementptr i8* %dst, i64 %23
  %bound1221 = icmp ule i8* %scevgep219, %dst
  %bound0220 = icmp ule i8* %scevgep218, %src
  %memcheck.conflict223 = and i1 %bound0220, %bound1221
  %.sum = sub i64 %19, %n.vec215
  %rev.ptr.ind.end = getelementptr i8* %src, i64 %.sum
  %.sum439 = sub i64 %19, %n.vec215
  %rev.ptr.ind.end229 = getelementptr i8* %dst, i64 %.sum439
  %rev.ind.end231 = sub i64 %count, %n.vec215
  br i1 %memcheck.conflict223, label %middle.block210, label %vector.body209

vector.body209:                                   ; preds = %vector.memcheck224, %vector.body209
  %index212 = phi i64 [ %index.next234, %vector.body209 ], [ 0, %vector.memcheck224 ]
  %.sum440 = sub i64 %19, %index212
  %.sum472 = sub i64 %19, %index212
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !46
  %24 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !46
  %25 = bitcast i8* %24 to <16 x i8>*, !dbg !46
  %wide.load434 = load <16 x i8>* %25, align 1, !dbg !46
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !46
  %.sum505 = add i64 %.sum440, -31, !dbg !46
  %26 = getelementptr i8* %src, i64 %.sum505, !dbg !46
  %27 = bitcast i8* %26 to <16 x i8>*, !dbg !46
  %wide.load435 = load <16 x i8>* %27, align 1, !dbg !46
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !46
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !46
  %next.gep333.sum = add i64 %.sum472, -15, !dbg !46
  %28 = getelementptr i8* %dst, i64 %next.gep333.sum, !dbg !46
  %29 = bitcast i8* %28 to <16 x i8>*, !dbg !46
  store <16 x i8> %reverse437, <16 x i8>* %29, align 1, !dbg !46
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !46
  %.sum507 = add i64 %.sum472, -31, !dbg !46
  %30 = getelementptr i8* %dst, i64 %.sum507, !dbg !46
  %31 = bitcast i8* %30 to <16 x i8>*, !dbg !46
  store <16 x i8> %reverse438, <16 x i8>* %31, align 1, !dbg !46
  %index.next234 = add i64 %index212, 32
  %32 = icmp eq i64 %index.next234, %n.vec215
  br i1 %32, label %middle.block210, label %vector.body209, !llvm.loop !47

middle.block210:                                  ; preds = %vector.body209, %vector.memcheck224, %.lr.ph9
  %resume.val225 = phi i8* [ %21, %.lr.ph9 ], [ %21, %vector.memcheck224 ], [ %rev.ptr.ind.end, %vector.body209 ]
  %resume.val227 = phi i8* [ %22, %.lr.ph9 ], [ %22, %vector.memcheck224 ], [ %rev.ptr.ind.end229, %vector.body209 ]
  %resume.val230 = phi i64 [ %count, %.lr.ph9 ], [ %count, %vector.memcheck224 ], [ %rev.ind.end231, %vector.body209 ]
  %new.indc.resume.val232 = phi i64 [ 0, %.lr.ph9 ], [ 0, %vector.memcheck224 ], [ %n.vec215, %vector.body209 ]
  %cmp.n233 = icmp eq i64 %new.indc.resume.val232, %count
  br i1 %cmp.n233, label %.loopexit, label %scalar.ph211

scalar.ph211:                                     ; preds = %middle.block210, %scalar.ph211
  %b.18 = phi i8* [ %34, %scalar.ph211 ], [ %resume.val225, %middle.block210 ]
  %a.17 = phi i8* [ %36, %scalar.ph211 ], [ %resume.val227, %middle.block210 ]
  %.16 = phi i64 [ %33, %scalar.ph211 ], [ %resume.val230, %middle.block210 ]
  %33 = add i64 %.16, -1, !dbg !46
  %34 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !46
  tail call void @llvm.dbg.value(metadata !{i8* %34}, i64 0, metadata !21), !dbg !46
  %35 = load i8* %b.18, align 1, !dbg !46, !tbaa !39
  %36 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !46
  tail call void @llvm.dbg.value(metadata !{i8* %36}, i64 0, metadata !18), !dbg !46
  store i8 %35, i8* %a.17, align 1, !dbg !46, !tbaa !39
  tail call void @llvm.dbg.value(metadata !{i64 %33}, i64 0, metadata !17), !dbg !46
  %37 = icmp eq i64 %33, 0, !dbg !46
  br i1 %37, label %.loopexit, label %scalar.ph211, !dbg !46, !llvm.loop !48

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %.lr.ph, %middle.block, %18, %.preheader, %0
  ret i8* %dst, !dbg !49
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25}
!llvm.ident = !{!26}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/memmove.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !14, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [memmove]
!5 = metadata !{metadata !"memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/memmove.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10, metadata !12}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{i32 786454, metadata !5, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!13 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!14 = metadata !{metadata !15, metadata !16, metadata !17, metadata !18, metadata !21}
!15 = metadata !{i32 786689, metadata !4, metadata !"dst", metadata !6, i32 16777228, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!16 = metadata !{i32 786689, metadata !4, metadata !"src", metadata !6, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!17 = metadata !{i32 786689, metadata !4, metadata !"count", metadata !6, i32 50331660, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!18 = metadata !{i32 786688, metadata !4, metadata !"a", metadata !6, i32 13, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!19 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!20 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!21 = metadata !{i32 786688, metadata !4, metadata !"b", metadata !6, i32 14, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!24 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!25 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!26 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!27 = metadata !{i32 12, i32 0, metadata !4, null}
!28 = metadata !{i32 13, i32 0, metadata !4, null}
!29 = metadata !{i32 14, i32 0, metadata !4, null}
!30 = metadata !{i32 16, i32 0, metadata !31, null}
!31 = metadata !{i32 786443, metadata !5, metadata !4, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/memmove.c]
!32 = metadata !{i32 19, i32 0, metadata !33, null}
!33 = metadata !{i32 786443, metadata !5, metadata !4, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/memmove.c]
!34 = metadata !{i32 20, i32 0, metadata !35, null}
!35 = metadata !{i32 786443, metadata !5, metadata !33, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/memmove.c]
!36 = metadata !{metadata !36, metadata !37, metadata !38}
!37 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!38 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!39 = metadata !{metadata !40, metadata !40, i64 0}
!40 = metadata !{metadata !"omnipotent char", metadata !41, i64 0}
!41 = metadata !{metadata !"Simple C/C++ TBAA"}
!42 = metadata !{metadata !42, metadata !37, metadata !38}
!43 = metadata !{i32 22, i32 0, metadata !44, null}
!44 = metadata !{i32 786443, metadata !5, metadata !33, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/memmove.c]
!45 = metadata !{i32 23, i32 0, metadata !44, null}
!46 = metadata !{i32 24, i32 0, metadata !44, null}
!47 = metadata !{metadata !47, metadata !37, metadata !38}
!48 = metadata !{metadata !48, metadata !37, metadata !38}
!49 = metadata !{i32 28, i32 0, metadata !4, null}
