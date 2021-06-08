; ModuleID = 'klee_overshift_check.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str1 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str2 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #0 {
  tail call void @llvm.dbg.value(metadata !{i64 %bitWidth}, i64 0, metadata !11), !dbg !16
  tail call void @llvm.dbg.value(metadata !{i64 %shift}, i64 0, metadata !12), !dbg !16
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !17
  br i1 %1, label %3, label %2, !dbg !17

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str2, i64 0, i64 0)) #3, !dbg !19
  unreachable, !dbg !19

; <label>:3                                       ; preds = %0
  ret void, !dbg !21
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nobuiltin noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14}
!llvm.ident = !{!15}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic//home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_check, null, null, metadata !10, i32 20} ; [ DW_TAG_subprogram ] [line 20] [def] [klee_overshift_check]
!5 = metadata !{metadata !"klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!10 = metadata !{metadata !11, metadata !12}
!11 = metadata !{i32 786689, metadata !4, metadata !"bitWidth", metadata !6, i32 16777236, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!12 = metadata !{i32 786689, metadata !4, metadata !"shift", metadata !6, i32 33554452, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!13 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!14 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!15 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!16 = metadata !{i32 20, i32 0, metadata !4, null}
!17 = metadata !{i32 21, i32 0, metadata !18, null}
!18 = metadata !{i32 786443, metadata !5, metadata !4, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!19 = metadata !{i32 27, i32 0, metadata !20, null}
!20 = metadata !{i32 786443, metadata !5, metadata !18, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!21 = metadata !{i32 29, i32 0, metadata !4, null}
