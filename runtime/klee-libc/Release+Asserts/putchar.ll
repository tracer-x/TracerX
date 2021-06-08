; ModuleID = 'putchar.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @putchar(i32 %c) #0 {
  %x = alloca i8, align 1
  tail call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !11), !dbg !17
  tail call void @llvm.dbg.declare(metadata !{i8* %x}, metadata !12), !dbg !18
  %1 = trunc i32 %c to i8, !dbg !18
  tail call void @llvm.dbg.value(metadata !{i8 %1}, i64 0, metadata !12), !dbg !18
  store i8 %1, i8* %x, align 1, !dbg !18, !tbaa !19
  %2 = call i64 @write(i32 1, i8* %x, i64 1) #3, !dbg !22
  %3 = icmp eq i64 %2, 1, !dbg !22
  %c. = select i1 %3, i32 %c, i32 -1, !dbg !24
  ret i32 %c., !dbg !25
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i64 @write(i32, i8* nocapture readonly, i64) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!16}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/putchar.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/putchar.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"putchar", metadata !"putchar", metadata !"", i32 16, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @putchar, null, null, metadata !10, i32 16} ; [ DW_TAG_subprogram ] [line 16] [def] [putchar]
!5 = metadata !{metadata !"putchar.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/putchar.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11, metadata !12}
!11 = metadata !{i32 786689, metadata !4, metadata !"c", metadata !6, i32 16777232, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 16]
!12 = metadata !{i32 786688, metadata !4, metadata !"x", metadata !6, i32 17, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 17]
!13 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!14 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!15 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!16 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!17 = metadata !{i32 16, i32 0, metadata !4, null}
!18 = metadata !{i32 17, i32 0, metadata !4, null}
!19 = metadata !{metadata !20, metadata !20, i64 0}
!20 = metadata !{metadata !"omnipotent char", metadata !21, i64 0}
!21 = metadata !{metadata !"Simple C/C++ TBAA"}
!22 = metadata !{i32 18, i32 0, metadata !23, null}
!23 = metadata !{i32 786443, metadata !5, metadata !4, i32 18, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/putchar.c]
!24 = metadata !{i32 19, i32 0, metadata !23, null}
!25 = metadata !{i32 21, i32 0, metadata !4, null}
