; ModuleID = 'tolower.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define i32 @tolower(i32 %ch) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %ch}, i64 0, metadata !11), !dbg !15
  %1 = add nsw i32 %ch, -65, !dbg !16
  %2 = icmp ult i32 %1, 26, !dbg !16
  %3 = add nsw i32 %ch, 32, !dbg !18
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !11), !dbg !18
  %.ch = select i1 %2, i32 %3, i32 %ch, !dbg !16
  ret i32 %.ch, !dbg !19
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13}
!llvm.ident = !{!14}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/tolower.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/tolower.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"tolower", metadata !"tolower", metadata !"", i32 10, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @tolower, null, null, metadata !10, i32 10} ; [ DW_TAG_subprogram ] [line 10] [def] [tolower]
!5 = metadata !{metadata !"tolower.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/tolower.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786689, metadata !4, metadata !"ch", metadata !6, i32 16777226, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ch] [line 10]
!12 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!13 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!14 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!15 = metadata !{i32 10, i32 0, metadata !4, null}
!16 = metadata !{i32 11, i32 0, metadata !17, null}
!17 = metadata !{i32 786443, metadata !5, metadata !4, i32 11, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/tolower.c]
!18 = metadata !{i32 12, i32 0, metadata !17, null}
!19 = metadata !{i32 13, i32 0, metadata !4, null}
