; ModuleID = 'strtol.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @strtol(i8* %nptr, i8** %endptr, i32 %base) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %nptr}, i64 0, metadata !33), !dbg !47
  tail call void @llvm.dbg.value(metadata !{i8** %endptr}, i64 0, metadata !34), !dbg !47
  tail call void @llvm.dbg.value(metadata !{i32 %base}, i64 0, metadata !35), !dbg !47
  tail call void @llvm.dbg.value(metadata !{i8* %nptr}, i64 0, metadata !36), !dbg !48
  %1 = tail call i16** @__ctype_b_loc() #2, !dbg !49
  %2 = load i16** %1, align 8, !dbg !49, !tbaa !50
  br label %3, !dbg !54

; <label>:3                                       ; preds = %3, %0
  %s.0 = phi i8* [ %nptr, %0 ], [ %4, %3 ]
  %4 = getelementptr inbounds i8* %s.0, i64 1, !dbg !55
  tail call void @llvm.dbg.value(metadata !{i8* %4}, i64 0, metadata !36), !dbg !55
  %5 = load i8* %s.0, align 1, !dbg !55, !tbaa !57
  tail call void @llvm.dbg.value(metadata !{i8 %5}, i64 0, metadata !39), !dbg !55
  %6 = zext i8 %5 to i64, !dbg !58
  %7 = getelementptr inbounds i16* %2, i64 %6, !dbg !49
  %8 = load i16* %7, align 2, !dbg !49, !tbaa !59
  %9 = and i16 %8, 8192, !dbg !49
  %10 = icmp eq i16 %9, 0, !dbg !49
  br i1 %10, label %11, label %3, !dbg !49

; <label>:11                                      ; preds = %3
  switch i8 %5, label %18 [
    i8 45, label %12
    i8 43, label %15
  ], !dbg !61

; <label>:12                                      ; preds = %11
  tail call void @llvm.dbg.value(metadata !63, i64 0, metadata !41), !dbg !64
  %13 = getelementptr inbounds i8* %s.0, i64 2, !dbg !66
  tail call void @llvm.dbg.value(metadata !{i8* %13}, i64 0, metadata !36), !dbg !66
  %14 = load i8* %4, align 1, !dbg !66, !tbaa !57
  tail call void @llvm.dbg.value(metadata !{i8 %14}, i64 0, metadata !39), !dbg !66
  br label %18, !dbg !67

; <label>:15                                      ; preds = %11
  %16 = getelementptr inbounds i8* %s.0, i64 2, !dbg !68
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !36), !dbg !68
  %17 = load i8* %4, align 1, !dbg !68, !tbaa !57
  tail call void @llvm.dbg.value(metadata !{i8 %17}, i64 0, metadata !39), !dbg !68
  br label %18, !dbg !68

; <label>:18                                      ; preds = %11, %15, %12
  %s.1 = phi i8* [ %13, %12 ], [ %16, %15 ], [ %4, %11 ]
  %c.0 = phi i8 [ %14, %12 ], [ %17, %15 ], [ %5, %11 ]
  %neg.0 = phi i32 [ 1, %12 ], [ 0, %15 ], [ 0, %11 ]
  %19 = and i32 %base, -17, !dbg !71
  %20 = icmp eq i32 %19, 0, !dbg !71
  %21 = icmp eq i8 %c.0, 48, !dbg !71
  %or.cond = and i1 %20, %21, !dbg !71
  br i1 %or.cond, label %22, label %27, !dbg !71

; <label>:22                                      ; preds = %18
  %23 = load i8* %s.1, align 1, !dbg !71, !tbaa !57
  switch i8 %23, label %27 [
    i8 120, label %.thread11
    i8 88, label %.thread11
  ], !dbg !71

.thread11:                                        ; preds = %22, %22
  %24 = getelementptr inbounds i8* %s.1, i64 1, !dbg !73
  %25 = load i8* %24, align 1, !dbg !73, !tbaa !57
  tail call void @llvm.dbg.value(metadata !{i8 %25}, i64 0, metadata !39), !dbg !73
  %26 = getelementptr inbounds i8* %s.1, i64 2, !dbg !75
  tail call void @llvm.dbg.value(metadata !{i8* %26}, i64 0, metadata !36), !dbg !75
  tail call void @llvm.dbg.value(metadata !76, i64 0, metadata !35), !dbg !77
  tail call void @llvm.dbg.value(metadata !18, i64 0, metadata !42), !dbg !78
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !37), !dbg !78
  br label %33, !dbg !80

; <label>:27                                      ; preds = %22, %18
  %28 = icmp eq i32 %base, 0, !dbg !82
  br i1 %28, label %29, label %31, !dbg !82

; <label>:29                                      ; preds = %27
  %30 = select i1 %21, i32 8, i32 10, !dbg !84
  tail call void @llvm.dbg.value(metadata !{i32 %30}, i64 0, metadata !35), !dbg !84
  br label %31, !dbg !84

; <label>:31                                      ; preds = %29, %27
  %.1 = phi i32 [ %30, %29 ], [ %base, %27 ]
  tail call void @llvm.dbg.value(metadata !18, i64 0, metadata !42), !dbg !78
  tail call void @llvm.dbg.value(metadata !79, i64 0, metadata !37), !dbg !78
  %.1.off = add i32 %.1, -2, !dbg !80
  %32 = icmp ugt i32 %.1.off, 34, !dbg !80
  br i1 %32, label %72, label %33, !dbg !80

; <label>:33                                      ; preds = %.thread11, %31
  %.115 = phi i32 [ 16, %.thread11 ], [ %.1, %31 ]
  %s.2914 = phi i8* [ %26, %.thread11 ], [ %s.1, %31 ]
  %c.11013 = phi i8 [ %25, %.thread11 ], [ %c.0, %31 ]
  %34 = icmp ne i32 %neg.0, 0, !dbg !85
  %35 = select i1 %34, i64 -9223372036854775808, i64 9223372036854775807, !dbg !85
  tail call void @llvm.dbg.value(metadata !{i64 %35}, i64 0, metadata !40), !dbg !85
  %36 = sext i32 %.115 to i64, !dbg !86
  %37 = urem i64 %35, %36, !dbg !86
  %38 = trunc i64 %37 to i32, !dbg !86
  tail call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !43), !dbg !86
  %39 = udiv i64 %35, %36, !dbg !87
  tail call void @llvm.dbg.value(metadata !{i64 %39}, i64 0, metadata !40), !dbg !87
  br label %40, !dbg !88

; <label>:40                                      ; preds = %63, %33
  %s.3 = phi i8* [ %s.2914, %33 ], [ %64, %63 ]
  %acc.0 = phi i64 [ 0, %33 ], [ %acc.1, %63 ]
  %c.2 = phi i8 [ %c.11013, %33 ], [ %65, %63 ]
  %any.0 = phi i32 [ 0, %33 ], [ %any.1, %63 ]
  %c.2.off = add i8 %c.2, -48, !dbg !90
  %41 = icmp ult i8 %c.2.off, 10, !dbg !90
  br i1 %41, label %50, label %42, !dbg !90

; <label>:42                                      ; preds = %40
  %c.2.off16 = add i8 %c.2, -65, !dbg !93
  %43 = icmp ult i8 %c.2.off16, 26, !dbg !93
  br i1 %43, label %44, label %46, !dbg !93

; <label>:44                                      ; preds = %42
  %45 = add i8 %c.2, -55, !dbg !95
  tail call void @llvm.dbg.value(metadata !{i8 %45}, i64 0, metadata !39), !dbg !95
  br label %50, !dbg !95

; <label>:46                                      ; preds = %42
  %c.2.off17 = add i8 %c.2, -97, !dbg !96
  %47 = icmp ult i8 %c.2.off17, 26, !dbg !96
  br i1 %47, label %48, label %66, !dbg !96

; <label>:48                                      ; preds = %46
  %49 = add i8 %c.2, -87, !dbg !98
  tail call void @llvm.dbg.value(metadata !{i8 %49}, i64 0, metadata !39), !dbg !98
  br label %50

; <label>:50                                      ; preds = %40, %44, %48
  %c.3 = phi i8 [ %45, %44 ], [ %49, %48 ], [ %c.2.off, %40 ]
  %51 = sext i8 %c.3 to i32, !dbg !99
  %52 = icmp slt i32 %51, %.115, !dbg !99
  br i1 %52, label %53, label %66, !dbg !99

; <label>:53                                      ; preds = %50
  %54 = icmp slt i32 %any.0, 0, !dbg !101
  %55 = icmp ugt i64 %acc.0, %39, !dbg !101
  %or.cond7 = or i1 %54, %55, !dbg !101
  br i1 %or.cond7, label %63, label %56, !dbg !101

; <label>:56                                      ; preds = %53
  %57 = icmp eq i64 %acc.0, %39, !dbg !101
  %58 = icmp sgt i32 %51, %38, !dbg !101
  %or.cond8 = and i1 %57, %58, !dbg !101
  br i1 %or.cond8, label %63, label %59, !dbg !101

; <label>:59                                      ; preds = %56
  tail call void @llvm.dbg.value(metadata !63, i64 0, metadata !42), !dbg !103
  %60 = mul i64 %acc.0, %36, !dbg !105
  tail call void @llvm.dbg.value(metadata !{i64 %60}, i64 0, metadata !37), !dbg !105
  %61 = sext i8 %c.3 to i64, !dbg !106
  %62 = add i64 %61, %60, !dbg !106
  tail call void @llvm.dbg.value(metadata !{i64 %62}, i64 0, metadata !37), !dbg !106
  br label %63

; <label>:63                                      ; preds = %53, %56, %59
  %acc.1 = phi i64 [ %62, %59 ], [ %39, %56 ], [ %acc.0, %53 ]
  %any.1 = phi i32 [ 1, %59 ], [ -1, %56 ], [ -1, %53 ]
  %64 = getelementptr inbounds i8* %s.3, i64 1, !dbg !88
  tail call void @llvm.dbg.value(metadata !{i8* %64}, i64 0, metadata !36), !dbg !88
  %65 = load i8* %s.3, align 1, !dbg !88, !tbaa !57
  tail call void @llvm.dbg.value(metadata !{i8 %65}, i64 0, metadata !39), !dbg !88
  br label %40, !dbg !88

; <label>:66                                      ; preds = %50, %46
  %67 = icmp slt i32 %any.0, 0, !dbg !107
  br i1 %67, label %68, label %70, !dbg !107

; <label>:68                                      ; preds = %66
  tail call void @llvm.dbg.value(metadata !{i64 %35}, i64 0, metadata !37), !dbg !109
  %69 = tail call i32* @__errno_location() #2, !dbg !111
  store i32 34, i32* %69, align 4, !dbg !111, !tbaa !112
  br label %76, !dbg !114

; <label>:70                                      ; preds = %66
  %71 = icmp eq i32 %any.0, 0, !dbg !115
  br i1 %71, label %72, label %74, !dbg !115

; <label>:72                                      ; preds = %70, %31
  %s.4 = phi i8* [ %s.1, %31 ], [ %s.3, %70 ]
  %acc.2 = phi i64 [ 0, %31 ], [ %acc.0, %70 ]
  %73 = tail call i32* @__errno_location() #2, !dbg !117
  store i32 22, i32* %73, align 4, !dbg !117, !tbaa !112
  br label %76, !dbg !119

; <label>:74                                      ; preds = %70
  %75 = sub i64 0, %acc.0, !dbg !120
  tail call void @llvm.dbg.value(metadata !{i64 %75}, i64 0, metadata !37), !dbg !120
  %.acc.0 = select i1 %34, i64 %75, i64 %acc.0, !dbg !122
  br label %76, !dbg !122

; <label>:76                                      ; preds = %74, %72, %68
  %s.5 = phi i8* [ %s.4, %72 ], [ %s.3, %68 ], [ %s.3, %74 ]
  %acc.3 = phi i64 [ %acc.2, %72 ], [ %35, %68 ], [ %.acc.0, %74 ]
  %any.3 = phi i32 [ 0, %72 ], [ %any.0, %68 ], [ %any.0, %74 ]
  %77 = icmp eq i8** %endptr, null, !dbg !123
  br i1 %77, label %82, label %78, !dbg !123

; <label>:78                                      ; preds = %76
  %79 = icmp eq i32 %any.3, 0, !dbg !125
  %80 = getelementptr inbounds i8* %s.5, i64 -1, !dbg !125
  %81 = select i1 %79, i8* %nptr, i8* %80, !dbg !125
  store i8* %81, i8** %endptr, align 8, !dbg !125, !tbaa !50
  br label %82, !dbg !125

; <label>:82                                      ; preds = %76, %78
  ret i64 %acc.3, !dbg !126
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #1

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!44, !45}
!llvm.ident = !{!46}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !18, metadata !19, metadata !18, metadata !18, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc//home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, metadata !4, null, metadata !"", i32 46, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 46, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !"/usr/include/ctype.h", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !17}
!6 = metadata !{i32 786472, metadata !"_ISupper", i64 256} ; [ DW_TAG_enumerator ] [_ISupper :: 256]
!7 = metadata !{i32 786472, metadata !"_ISlower", i64 512} ; [ DW_TAG_enumerator ] [_ISlower :: 512]
!8 = metadata !{i32 786472, metadata !"_ISalpha", i64 1024} ; [ DW_TAG_enumerator ] [_ISalpha :: 1024]
!9 = metadata !{i32 786472, metadata !"_ISdigit", i64 2048} ; [ DW_TAG_enumerator ] [_ISdigit :: 2048]
!10 = metadata !{i32 786472, metadata !"_ISxdigit", i64 4096} ; [ DW_TAG_enumerator ] [_ISxdigit :: 4096]
!11 = metadata !{i32 786472, metadata !"_ISspace", i64 8192} ; [ DW_TAG_enumerator ] [_ISspace :: 8192]
!12 = metadata !{i32 786472, metadata !"_ISprint", i64 16384} ; [ DW_TAG_enumerator ] [_ISprint :: 16384]
!13 = metadata !{i32 786472, metadata !"_ISgraph", i64 32768} ; [ DW_TAG_enumerator ] [_ISgraph :: 32768]
!14 = metadata !{i32 786472, metadata !"_ISblank", i64 1} ; [ DW_TAG_enumerator ] [_ISblank :: 1]
!15 = metadata !{i32 786472, metadata !"_IScntrl", i64 2} ; [ DW_TAG_enumerator ] [_IScntrl :: 2]
!16 = metadata !{i32 786472, metadata !"_ISpunct", i64 4} ; [ DW_TAG_enumerator ] [_ISpunct :: 4]
!17 = metadata !{i32 786472, metadata !"_ISalnum", i64 8} ; [ DW_TAG_enumerator ] [_ISalnum :: 8]
!18 = metadata !{i32 0}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786478, metadata !21, metadata !22, metadata !"strtol", metadata !"strtol", metadata !"", i32 47, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i8*, i8**, i32)* @strtol, null, null, metadata !32, i32 48} ; [ DW_TAG_subprogram ] [line 47] [def] [scope 48] [strtol]
!21 = metadata !{metadata !"strtol.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/klee-libc"}
!22 = metadata !{i32 786473, metadata !21}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!23 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = metadata !{metadata !25, metadata !26, metadata !29, metadata !31}
!25 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!26 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!27 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!28 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!29 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!30 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!31 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!32 = metadata !{metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43}
!33 = metadata !{i32 786689, metadata !20, metadata !"nptr", metadata !22, i32 16777263, metadata !26, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nptr] [line 47]
!34 = metadata !{i32 786689, metadata !20, metadata !"endptr", metadata !22, i32 33554479, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [endptr] [line 47]
!35 = metadata !{i32 786689, metadata !20, metadata !"base", metadata !22, i32 50331695, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [base] [line 47]
!36 = metadata !{i32 786688, metadata !20, metadata !"s", metadata !22, i32 49, metadata !26, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 49]
!37 = metadata !{i32 786688, metadata !20, metadata !"acc", metadata !22, i32 50, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [acc] [line 50]
!38 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!39 = metadata !{i32 786688, metadata !20, metadata !"c", metadata !22, i32 51, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 51]
!40 = metadata !{i32 786688, metadata !20, metadata !"cutoff", metadata !22, i32 52, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cutoff] [line 52]
!41 = metadata !{i32 786688, metadata !20, metadata !"neg", metadata !22, i32 53, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [neg] [line 53]
!42 = metadata !{i32 786688, metadata !20, metadata !"any", metadata !22, i32 53, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [any] [line 53]
!43 = metadata !{i32 786688, metadata !20, metadata !"cutlim", metadata !22, i32 53, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cutlim] [line 53]
!44 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!45 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!46 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!47 = metadata !{i32 47, i32 0, metadata !20, null}
!48 = metadata !{i32 60, i32 0, metadata !20, null}
!49 = metadata !{i32 63, i32 0, metadata !20, null}
!50 = metadata !{metadata !51, metadata !51, i64 0}
!51 = metadata !{metadata !"any pointer", metadata !52, i64 0}
!52 = metadata !{metadata !"omnipotent char", metadata !53, i64 0}
!53 = metadata !{metadata !"Simple C/C++ TBAA"}
!54 = metadata !{i32 61, i32 0, metadata !20, null}
!55 = metadata !{i32 62, i32 0, metadata !56, null}
!56 = metadata !{i32 786443, metadata !21, metadata !20, i32 61, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!57 = metadata !{metadata !52, metadata !52, i64 0}
!58 = metadata !{i32 63, i32 0, metadata !56, null}
!59 = metadata !{metadata !60, metadata !60, i64 0}
!60 = metadata !{metadata !"short", metadata !52, i64 0}
!61 = metadata !{i32 64, i32 0, metadata !62, null}
!62 = metadata !{i32 786443, metadata !21, metadata !20, i32 64, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!63 = metadata !{i32 1}
!64 = metadata !{i32 65, i32 0, metadata !65, null}
!65 = metadata !{i32 786443, metadata !21, metadata !62, i32 64, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!66 = metadata !{i32 66, i32 0, metadata !65, null}
!67 = metadata !{i32 67, i32 0, metadata !65, null}
!68 = metadata !{i32 70, i32 0, metadata !69, null}
!69 = metadata !{i32 786443, metadata !21, metadata !70, i32 69, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!70 = metadata !{i32 786443, metadata !21, metadata !62, i32 67, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!71 = metadata !{i32 72, i32 0, metadata !72, null}
!72 = metadata !{i32 786443, metadata !21, metadata !20, i32 72, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!73 = metadata !{i32 74, i32 0, metadata !74, null}
!74 = metadata !{i32 786443, metadata !21, metadata !72, i32 73, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!75 = metadata !{i32 75, i32 0, metadata !74, null}
!76 = metadata !{i32 16}
!77 = metadata !{i32 76, i32 0, metadata !74, null}
!78 = metadata !{i32 80, i32 0, metadata !20, null}
!79 = metadata !{i64 0}
!80 = metadata !{i32 81, i32 0, metadata !81, null}
!81 = metadata !{i32 786443, metadata !21, metadata !20, i32 81, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!82 = metadata !{i32 78, i32 0, metadata !83, null}
!83 = metadata !{i32 786443, metadata !21, metadata !20, i32 78, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!84 = metadata !{i32 79, i32 0, metadata !83, null}
!85 = metadata !{i32 101, i32 0, metadata !20, null}
!86 = metadata !{i32 103, i32 0, metadata !20, null}
!87 = metadata !{i32 104, i32 0, metadata !20, null}
!88 = metadata !{i32 105, i32 0, metadata !89, null}
!89 = metadata !{i32 786443, metadata !21, metadata !20, i32 105, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!90 = metadata !{i32 106, i32 0, metadata !91, null}
!91 = metadata !{i32 786443, metadata !21, metadata !92, i32 106, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!92 = metadata !{i32 786443, metadata !21, metadata !89, i32 105, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!93 = metadata !{i32 108, i32 0, metadata !94, null}
!94 = metadata !{i32 786443, metadata !21, metadata !91, i32 108, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!95 = metadata !{i32 109, i32 0, metadata !94, null}
!96 = metadata !{i32 110, i32 0, metadata !97, null}
!97 = metadata !{i32 786443, metadata !21, metadata !94, i32 110, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!98 = metadata !{i32 111, i32 0, metadata !97, null}
!99 = metadata !{i32 114, i32 0, metadata !100, null}
!100 = metadata !{i32 786443, metadata !21, metadata !92, i32 114, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!101 = metadata !{i32 116, i32 0, metadata !102, null}
!102 = metadata !{i32 786443, metadata !21, metadata !92, i32 116, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!103 = metadata !{i32 119, i32 0, metadata !104, null}
!104 = metadata !{i32 786443, metadata !21, metadata !102, i32 118, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!105 = metadata !{i32 120, i32 0, metadata !104, null}
!106 = metadata !{i32 121, i32 0, metadata !104, null}
!107 = metadata !{i32 124, i32 0, metadata !108, null}
!108 = metadata !{i32 786443, metadata !21, metadata !20, i32 124, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!109 = metadata !{i32 125, i32 0, metadata !110, null}
!110 = metadata !{i32 786443, metadata !21, metadata !108, i32 124, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!111 = metadata !{i32 126, i32 0, metadata !110, null}
!112 = metadata !{metadata !113, metadata !113, i64 0}
!113 = metadata !{metadata !"int", metadata !52, i64 0}
!114 = metadata !{i32 127, i32 0, metadata !110, null}
!115 = metadata !{i32 127, i32 0, metadata !116, null}
!116 = metadata !{i32 786443, metadata !21, metadata !108, i32 127, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!117 = metadata !{i32 129, i32 0, metadata !118, null}
!118 = metadata !{i32 786443, metadata !21, metadata !116, i32 127, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!119 = metadata !{i32 130, i32 0, metadata !118, null}
!120 = metadata !{i32 131, i32 0, metadata !121, null}
!121 = metadata !{i32 786443, metadata !21, metadata !116, i32 130, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!122 = metadata !{i32 130, i32 0, metadata !121, null}
!123 = metadata !{i32 132, i32 0, metadata !124, null}
!124 = metadata !{i32 786443, metadata !21, metadata !20, i32 132, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/klee-libc/strtol.c]
!125 = metadata !{i32 133, i32 0, metadata !124, null}
!126 = metadata !{i32 134, i32 0, metadata !20, null}
