; ModuleID = 'htonl.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define zeroext i16 @htons(i16 zeroext %v) #0 {
  tail call void @llvm.dbg.value(metadata !{i16 %v}, i64 0, metadata !12), !dbg !29
  %1 = tail call i16 @llvm.bswap.i16(i16 %v), !dbg !30
  ret i16 %1, !dbg !30
}

; Function Attrs: nounwind readnone uwtable
define i32 @htonl(i32 %v) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %v}, i64 0, metadata !19), !dbg !31
  %1 = lshr i32 %v, 16, !dbg !32
  %2 = trunc i32 %1 to i16, !dbg !32
  tail call void @llvm.dbg.value(metadata !{i16 %2}, i64 0, metadata !33) #2, !dbg !34
  %3 = tail call i16 @llvm.bswap.i16(i16 %2) #2, !dbg !35
  %4 = zext i16 %3 to i32, !dbg !32
  %5 = trunc i32 %v to i16, !dbg !32
  tail call void @llvm.dbg.value(metadata !{i16 %5}, i64 0, metadata !33) #2, !dbg !34
  %6 = tail call i16 @llvm.bswap.i16(i16 %5) #2, !dbg !35
  %7 = zext i16 %6 to i32, !dbg !32
  %8 = shl nuw i32 %7, 16, !dbg !32
  %9 = or i32 %8, %4, !dbg !32
  ret i32 %9, !dbg !32
}

; Function Attrs: nounwind readnone uwtable
define zeroext i16 @ntohs(i16 zeroext %v) #0 {
  tail call void @llvm.dbg.value(metadata !{i16 %v}, i64 0, metadata !22), !dbg !36
  tail call void @llvm.dbg.value(metadata !{i16 %v}, i64 0, metadata !37) #2, !dbg !39
  %1 = tail call i16 @llvm.bswap.i16(i16 %v) #2, !dbg !40
  ret i16 %1, !dbg !38
}

; Function Attrs: nounwind readnone uwtable
define i32 @ntohl(i32 %v) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %v}, i64 0, metadata !25), !dbg !41
  tail call void @llvm.dbg.value(metadata !{i32 %v}, i64 0, metadata !42) #2, !dbg !44
  %1 = lshr i32 %v, 16, !dbg !45
  %2 = trunc i32 %1 to i16, !dbg !45
  tail call void @llvm.dbg.value(metadata !{i16 %2}, i64 0, metadata !46) #2, !dbg !47
  %3 = tail call i16 @llvm.bswap.i16(i16 %2) #2, !dbg !48
  %4 = zext i16 %3 to i32, !dbg !45
  %5 = trunc i32 %v to i16, !dbg !45
  tail call void @llvm.dbg.value(metadata !{i16 %5}, i64 0, metadata !46) #2, !dbg !47
  %6 = tail call i16 @llvm.bswap.i16(i16 %5) #2, !dbg !48
  %7 = zext i16 %6 to i32, !dbg !45
  %8 = shl nuw i32 %7, 16, !dbg !45
  %9 = or i32 %8, %4, !dbg !45
  ret i32 %9, !dbg !43
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind readnone
declare i16 @llvm.bswap.i16(i16) #1

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!26, !27}
!llvm.ident = !{!28}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/htonl.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/htonl.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !13, metadata !20, metadata !23}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"htons", metadata !"htons", metadata !"", i32 26, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i16 (i16)* @htons, null, null, metadata !11, i32 26} ; [ DW_TAG_subprogram ] [line 26] [def] [htons]
!5 = metadata !{metadata !"htonl.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/htonl.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9}
!9 = metadata !{i32 786454, metadata !5, null, metadata !"uint16_t", i32 49, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ] [uint16_t] [line 49, size 0, align 0, offset 0] [from unsigned short]
!10 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786689, metadata !4, metadata !"v", metadata !6, i32 16777242, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 26]
!13 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"htonl", metadata !"htonl", metadata !"", i32 29, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @htonl, null, null, metadata !18, i32 29} ; [ DW_TAG_subprogram ] [line 29] [def] [htonl]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !16, metadata !16}
!16 = metadata !{i32 786454, metadata !5, null, metadata !"uint32_t", i32 51, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!17 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!18 = metadata !{metadata !19}
!19 = metadata !{i32 786689, metadata !13, metadata !"v", metadata !6, i32 16777245, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 29]
!20 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ntohs", metadata !"ntohs", metadata !"", i32 44, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i16 (i16)* @ntohs, null, null, metadata !21, i32 44} ; [ DW_TAG_subprogram ] [line 44] [def] [ntohs]
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786689, metadata !20, metadata !"v", metadata !6, i32 16777260, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 44]
!23 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"ntohl", metadata !"ntohl", metadata !"", i32 47, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @ntohl, null, null, metadata !24, i32 47} ; [ DW_TAG_subprogram ] [line 47] [def] [ntohl]
!24 = metadata !{metadata !25}
!25 = metadata !{i32 786689, metadata !23, metadata !"v", metadata !6, i32 16777263, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 47]
!26 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!27 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!28 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!29 = metadata !{i32 26, i32 0, metadata !4, null}
!30 = metadata !{i32 27, i32 0, metadata !4, null}
!31 = metadata !{i32 29, i32 0, metadata !13, null}
!32 = metadata !{i32 30, i32 0, metadata !13, null}
!33 = metadata !{i32 786689, metadata !4, metadata !"v", metadata !6, i32 16777242, metadata !9, i32 0, metadata !32} ; [ DW_TAG_arg_variable ] [v] [line 26]
!34 = metadata !{i32 26, i32 0, metadata !4, metadata !32}
!35 = metadata !{i32 27, i32 0, metadata !4, metadata !32}
!36 = metadata !{i32 44, i32 0, metadata !20, null}
!37 = metadata !{i32 786689, metadata !4, metadata !"v", metadata !6, i32 16777242, metadata !9, i32 0, metadata !38} ; [ DW_TAG_arg_variable ] [v] [line 26]
!38 = metadata !{i32 45, i32 0, metadata !20, null}
!39 = metadata !{i32 26, i32 0, metadata !4, metadata !38}
!40 = metadata !{i32 27, i32 0, metadata !4, metadata !38}
!41 = metadata !{i32 47, i32 0, metadata !23, null}
!42 = metadata !{i32 786689, metadata !13, metadata !"v", metadata !6, i32 16777245, metadata !16, i32 0, metadata !43} ; [ DW_TAG_arg_variable ] [v] [line 29]
!43 = metadata !{i32 48, i32 0, metadata !23, null}
!44 = metadata !{i32 29, i32 0, metadata !13, metadata !43}
!45 = metadata !{i32 30, i32 0, metadata !13, metadata !43}
!46 = metadata !{i32 786689, metadata !4, metadata !"v", metadata !6, i32 16777242, metadata !9, i32 0, metadata !45} ; [ DW_TAG_arg_variable ] [v] [line 26]
!47 = metadata !{i32 26, i32 0, metadata !4, metadata !45}
!48 = metadata !{i32 27, i32 0, metadata !4, metadata !45}
