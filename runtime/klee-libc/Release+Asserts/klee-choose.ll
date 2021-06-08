; ModuleID = 'klee-choose.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"klee_choose\00", align 1

; Function Attrs: nounwind uwtable
define i64 @klee_choose(i64 %n) #0 {
  %x = alloca i64, align 8
  call void @llvm.dbg.value(metadata !{i64 %n}, i64 0, metadata !12), !dbg !17
  call void @llvm.dbg.declare(metadata !{i64* %x}, metadata !13), !dbg !18
  %1 = bitcast i64* %x to i8*, !dbg !19
  call void @klee_make_symbolic(i8* %1, i64 8, i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0)) #4, !dbg !19
  call void @llvm.dbg.value(metadata !{i64* %x}, i64 0, metadata !13), !dbg !20
  %2 = load i64* %x, align 8, !dbg !20, !tbaa !22
  %3 = icmp ult i64 %2, %n, !dbg !20
  br i1 %3, label %5, label %4, !dbg !20

; <label>:4                                       ; preds = %0
  call void @klee_silent_exit(i32 0) #5, !dbg !26
  unreachable, !dbg !26

; <label>:5                                       ; preds = %0
  ret i64 %2, !dbg !27
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noreturn
declare void @klee_silent_exit(i32) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!16}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/klee-choose.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/klee-choose.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"klee_choose", metadata !"klee_choose", metadata !"", i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i64)* @klee_choose, null, null, metadata !11, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [klee_choose]
!5 = metadata !{metadata !"klee-choose.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/klee-choose.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9}
!9 = metadata !{i32 786454, metadata !5, null, metadata !"uintptr_t", i32 122, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [uintptr_t] [line 122, size 0, align 0, offset 0] [from long unsigned int]
!10 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!11 = metadata !{metadata !12, metadata !13}
!12 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !6, i32 16777228, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 12]
!13 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !6, i32 13, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 13]
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!15 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!17 = metadata !{i32 12, i32 0, metadata !4, null}
!18 = metadata !{i32 13, i32 0, metadata !4, null}
!19 = metadata !{i32 14, i32 0, metadata !4, null}
!20 = metadata !{i32 17, i32 0, metadata !21, null}
!21 = metadata !{i32 786443, metadata !5, metadata !4, i32 17, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/klee-choose.c]
!22 = metadata !{metadata !23, metadata !23, i64 0}
!23 = metadata !{metadata !"long", metadata !24, i64 0}
!24 = metadata !{metadata !"omnipotent char", metadata !25, i64 0}
!25 = metadata !{metadata !"Simple C/C++ TBAA"}
!26 = metadata !{i32 18, i32 0, metadata !21, null}
!27 = metadata !{i32 19, i32 0, metadata !4, null}
