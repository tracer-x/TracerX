; ModuleID = '/home/sanghu/TracerX/tracerx/test/Feature/Output/srem.c.tmp.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"1 % y == 0\00", align 1
@.str2 = private unnamed_addr constant [49 x i8] c"/home/sanghu/TracerX/tracerx/test/Feature/srem.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [23 x i8] c"int main(int, char **)\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"1 % y == 1\00", align 1
@.str4 = private unnamed_addr constant [11 x i8] c"0 % y == 0\00", align 1
@.str5 = private unnamed_addr constant [13 x i8] c"-1 % y == -1\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str17 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str28 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str39 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str610 = private unnamed_addr constant [13 x i8] c"klee_range.c\00", align 1
@.str1711 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str2812 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %y = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 (i32*, i64, i8*, ...)* bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %y, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !129
  %5 = load i32* %y, align 4, !dbg !130
  %6 = icmp sge i32 %5, 0, !dbg !130
  br i1 %6, label %7, label %27, !dbg !130

; <label>:7                                       ; preds = %0
  %8 = load i32* %y, align 4, !dbg !132
  %9 = icmp slt i32 %8, 2, !dbg !132
  br i1 %9, label %10, label %18, !dbg !132

; <label>:10                                      ; preds = %7
  %11 = load i32* %y, align 4, !dbg !135
  %int_cast_to_i64 = zext i32 %11 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !135
  %12 = srem i32 1, %11, !dbg !135
  %13 = icmp eq i32 %12, 0, !dbg !135
  br i1 %13, label %14, label %15, !dbg !135

; <label>:14                                      ; preds = %10
  br label %17, !dbg !135

; <label>:15                                      ; preds = %10
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([49 x i8]* @.str2, i32 0, i32 0), i32 19, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !135
  unreachable, !dbg !135
                                                  ; No predecessors!
  br label %17, !dbg !135

; <label>:17                                      ; preds = %16, %14
  br label %26, !dbg !137

; <label>:18                                      ; preds = %7
  %19 = load i32* %y, align 4, !dbg !138
  %int_cast_to_i641 = zext i32 %19 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !138
  %20 = srem i32 1, %19, !dbg !138
  %21 = icmp eq i32 %20, 1, !dbg !138
  br i1 %21, label %22, label %23, !dbg !138

; <label>:22                                      ; preds = %18
  br label %25, !dbg !138

; <label>:23                                      ; preds = %18
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([49 x i8]* @.str2, i32 0, i32 0), i32 21, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !138
  unreachable, !dbg !138
                                                  ; No predecessors!
  br label %25, !dbg !138

; <label>:25                                      ; preds = %24, %22
  br label %26

; <label>:26                                      ; preds = %25, %17
  br label %47, !dbg !140

; <label>:27                                      ; preds = %0
  %28 = load i32* %y, align 4, !dbg !141
  %29 = icmp sgt i32 %28, -2, !dbg !141
  br i1 %29, label %30, label %38, !dbg !141

; <label>:30                                      ; preds = %27
  %31 = load i32* %y, align 4, !dbg !144
  %int_cast_to_i642 = zext i32 %31 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !144
  %32 = srem i32 1, %31, !dbg !144
  %33 = icmp eq i32 %32, 0, !dbg !144
  br i1 %33, label %34, label %35, !dbg !144

; <label>:34                                      ; preds = %30
  br label %37, !dbg !144

; <label>:35                                      ; preds = %30
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([49 x i8]* @.str2, i32 0, i32 0), i32 25, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !144
  unreachable, !dbg !144
                                                  ; No predecessors!
  br label %37, !dbg !144

; <label>:37                                      ; preds = %36, %34
  br label %46, !dbg !146

; <label>:38                                      ; preds = %27
  %39 = load i32* %y, align 4, !dbg !147
  %int_cast_to_i643 = zext i32 %39 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !147
  %40 = srem i32 1, %39, !dbg !147
  %41 = icmp eq i32 %40, 1, !dbg !147
  br i1 %41, label %42, label %43, !dbg !147

; <label>:42                                      ; preds = %38
  br label %45, !dbg !147

; <label>:43                                      ; preds = %38
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([49 x i8]* @.str2, i32 0, i32 0), i32 27, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !147
  unreachable, !dbg !147
                                                  ; No predecessors!
  br label %45, !dbg !147

; <label>:45                                      ; preds = %44, %42
  br label %46

; <label>:46                                      ; preds = %45, %37
  br label %47

; <label>:47                                      ; preds = %46, %26
  %48 = load i32* %y, align 4, !dbg !149
  %int_cast_to_i644 = zext i32 %48 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !149
  %49 = srem i32 0, %48, !dbg !149
  %50 = icmp eq i32 %49, 0, !dbg !149
  br i1 %50, label %51, label %52, !dbg !149

; <label>:51                                      ; preds = %47
  br label %54, !dbg !149

; <label>:52                                      ; preds = %47
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([49 x i8]* @.str2, i32 0, i32 0), i32 31, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !149
  unreachable, !dbg !149
                                                  ; No predecessors!
  br label %54, !dbg !149

; <label>:54                                      ; preds = %53, %51
  %55 = load i32* %y, align 4, !dbg !150
  %int_cast_to_i645 = zext i32 %55 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !150
  %56 = srem i32 -1, %55, !dbg !150
  %57 = icmp eq i32 %56, -1, !dbg !150
  br i1 %57, label %58, label %59, !dbg !150

; <label>:58                                      ; preds = %54
  br label %61, !dbg !150

; <label>:59                                      ; preds = %54
  call void @__assert_fail(i8* getelementptr inbounds ([13 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([49 x i8]* @.str2, i32 0, i32 0), i32 32, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !150
  unreachable, !dbg !150
                                                  ; No predecessors!
  br label %61, !dbg !150

; <label>:61                                      ; preds = %60, %58
  %62 = load i32* %1, !dbg !151
  ret i32 %62, !dbg !151
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @klee_make_symbolic(...) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #4 {
  %1 = icmp eq i64 %z, 0, !dbg !152
  br i1 %1, label %2, label %3, !dbg !152

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str28, i64 0, i64 0)) #8, !dbg !154
  unreachable, !dbg !154

; <label>:3                                       ; preds = %0
  ret void, !dbg !155
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !156
  call void bitcast (i32 (...)* @klee_make_symbolic to void (i8*, i64, i8*)*)(i8* %1, i64 4, i8* %name) #9, !dbg !156
  %2 = load i32* %x, align 4, !dbg !157, !tbaa !158
  ret i32 %2, !dbg !157
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #4 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !162
  br i1 %1, label %3, label %2, !dbg !162

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str39, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #8, !dbg !164
  unreachable, !dbg !164

; <label>:3                                       ; preds = %0
  ret void, !dbg !166
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !167
  br i1 %1, label %3, label %2, !dbg !167

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str610, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str1711, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str2812, i64 0, i64 0)) #8, !dbg !169
  unreachable, !dbg !169

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !170
  %5 = icmp eq i32 %4, %end, !dbg !170
  br i1 %5, label %21, label %6, !dbg !170

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !172
  call void bitcast (i32 (...)* @klee_make_symbolic to void (i8*, i64, i8*)*)(i8* %7, i64 4, i8* %name) #9, !dbg !172
  %8 = icmp eq i32 %start, 0, !dbg !174
  %9 = load i32* %x, align 4, !dbg !176, !tbaa !158
  br i1 %8, label %10, label %13, !dbg !174

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !176
  %12 = zext i1 %11 to i64, !dbg !176
  call void @klee_assume(i64 %12) #9, !dbg !176
  br label %19, !dbg !178

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !179
  %15 = zext i1 %14 to i64, !dbg !179
  call void @klee_assume(i64 %15) #9, !dbg !179
  %16 = load i32* %x, align 4, !dbg !181, !tbaa !158
  %17 = icmp slt i32 %16, %end, !dbg !181
  %18 = zext i1 %17 to i64, !dbg !181
  call void @klee_assume(i64 %18) #9, !dbg !181
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !182, !tbaa !158
  br label %21, !dbg !182

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !183
}

declare void @klee_assume(i64) #6

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !184
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !184

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep4 = getelementptr i8* %srcaddr, i64 %2
  %scevgep = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep, %srcaddr
  %bound0 = icmp uge i8* %scevgep4, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end6 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep103 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !185
  %wide.load = load <16 x i8>* %3, align 1, !dbg !185
  %next.gep.sum279 = or i64 %index, 16, !dbg !185
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !185
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !185
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !185
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !185
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !185
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum279, !dbg !185
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !185
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !185
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !186

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val5 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end6, %vector.body ]
  %resume.val7 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val5, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val7, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !184
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !185
  %12 = load i8* %src.03, align 1, !dbg !185, !tbaa !189
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !185
  store i8 %12, i8* %dest.02, align 1, !dbg !185, !tbaa !189
  %14 = icmp eq i64 %10, 0, !dbg !184
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !184, !llvm.loop !190

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !191
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #4 {
  %1 = icmp eq i8* %src, %dst, !dbg !192
  br i1 %1, label %.loopexit, label %2, !dbg !192

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !194
  br i1 %3, label %.preheader, label %18, !dbg !194

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !196
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !196

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

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep110 = getelementptr i8* %dst, i64 %index
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !196
  %wide.load = load <16 x i8>* %6, align 1, !dbg !196
  %next.gep.sum586 = or i64 %index, 16, !dbg !196
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !196
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !196
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !196
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !196
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !196
  %10 = getelementptr i8* %dst, i64 %next.gep.sum586, !dbg !196
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !196
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !196
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !198

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %src, %.lr.ph.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val12 = phi i8* [ %dst, %.lr.ph.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end13, %vector.body ]
  %resume.val14 = phi i64 [ %count, %.lr.ph.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %b.04 = phi i8* [ %14, %.lr.ph ], [ %resume.val, %middle.block ]
  %a.03 = phi i8* [ %16, %.lr.ph ], [ %resume.val12, %middle.block ]
  %.02 = phi i64 [ %13, %.lr.ph ], [ %resume.val14, %middle.block ]
  %13 = add i64 %.02, -1, !dbg !196
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !196
  %15 = load i8* %b.04, align 1, !dbg !196, !tbaa !189
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !196
  store i8 %15, i8* %a.03, align 1, !dbg !196, !tbaa !189
  %17 = icmp eq i64 %13, 0, !dbg !196
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !196, !llvm.loop !199

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !200
  %20 = icmp eq i64 %count, 0, !dbg !202
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !202

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !203
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !200
  %n.vec215 = and i64 %count, -32
  %cmp.zero217 = icmp eq i64 %n.vec215, 0
  br i1 %cmp.zero217, label %middle.block210, label %vector.memcheck224

vector.memcheck224:                               ; preds = %.lr.ph9
  %bound1221 = icmp ule i8* %21, %dst
  %bound0220 = icmp ule i8* %22, %src
  %memcheck.conflict223 = and i1 %bound0220, %bound1221
  %.sum = sub i64 %19, %n.vec215
  %rev.ptr.ind.end = getelementptr i8* %src, i64 %.sum
  %rev.ptr.ind.end229 = getelementptr i8* %dst, i64 %.sum
  %rev.ind.end231 = sub i64 %count, %n.vec215
  br i1 %memcheck.conflict223, label %middle.block210, label %vector.body209

vector.body209:                                   ; preds = %vector.body209, %vector.memcheck224
  %index212 = phi i64 [ %index.next234, %vector.body209 ], [ 0, %vector.memcheck224 ]
  %.sum440 = sub i64 %19, %index212
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !202
  %23 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !202
  %24 = bitcast i8* %23 to <16 x i8>*, !dbg !202
  %wide.load434 = load <16 x i8>* %24, align 1, !dbg !202
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !202
  %.sum505 = add i64 %.sum440, -31, !dbg !202
  %25 = getelementptr i8* %src, i64 %.sum505, !dbg !202
  %26 = bitcast i8* %25 to <16 x i8>*, !dbg !202
  %wide.load435 = load <16 x i8>* %26, align 1, !dbg !202
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !202
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !202
  %27 = getelementptr i8* %dst, i64 %next.gep236.sum, !dbg !202
  %28 = bitcast i8* %27 to <16 x i8>*, !dbg !202
  store <16 x i8> %reverse437, <16 x i8>* %28, align 1, !dbg !202
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !202
  %29 = getelementptr i8* %dst, i64 %.sum505, !dbg !202
  %30 = bitcast i8* %29 to <16 x i8>*, !dbg !202
  store <16 x i8> %reverse438, <16 x i8>* %30, align 1, !dbg !202
  %index.next234 = add i64 %index212, 32
  %31 = icmp eq i64 %index.next234, %n.vec215
  br i1 %31, label %middle.block210, label %vector.body209, !llvm.loop !204

middle.block210:                                  ; preds = %vector.body209, %vector.memcheck224, %.lr.ph9
  %resume.val225 = phi i8* [ %21, %.lr.ph9 ], [ %21, %vector.memcheck224 ], [ %rev.ptr.ind.end, %vector.body209 ]
  %resume.val227 = phi i8* [ %22, %.lr.ph9 ], [ %22, %vector.memcheck224 ], [ %rev.ptr.ind.end229, %vector.body209 ]
  %resume.val230 = phi i64 [ %count, %.lr.ph9 ], [ %count, %vector.memcheck224 ], [ %rev.ind.end231, %vector.body209 ]
  %new.indc.resume.val232 = phi i64 [ 0, %.lr.ph9 ], [ 0, %vector.memcheck224 ], [ %n.vec215, %vector.body209 ]
  %cmp.n233 = icmp eq i64 %new.indc.resume.val232, %count
  br i1 %cmp.n233, label %.loopexit, label %scalar.ph211

scalar.ph211:                                     ; preds = %scalar.ph211, %middle.block210
  %b.18 = phi i8* [ %33, %scalar.ph211 ], [ %resume.val225, %middle.block210 ]
  %a.17 = phi i8* [ %35, %scalar.ph211 ], [ %resume.val227, %middle.block210 ]
  %.16 = phi i64 [ %32, %scalar.ph211 ], [ %resume.val230, %middle.block210 ]
  %32 = add i64 %.16, -1, !dbg !202
  %33 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !202
  %34 = load i8* %b.18, align 1, !dbg !202, !tbaa !189
  %35 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !202
  store i8 %34, i8* %a.17, align 1, !dbg !202, !tbaa !189
  %36 = icmp eq i64 %32, 0, !dbg !202
  br i1 %36, label %.loopexit, label %scalar.ph211, !dbg !202, !llvm.loop !205

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !206
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !207
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !207

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

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep104 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !208
  %wide.load = load <16 x i8>* %3, align 1, !dbg !208
  %next.gep.sum280 = or i64 %index, 16, !dbg !208
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !208
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !208
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !208
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !208
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !208
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum280, !dbg !208
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !208
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !208
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !209

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val6 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end7, %vector.body ]
  %resume.val8 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val6, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val8, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !207
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !208
  %12 = load i8* %src.03, align 1, !dbg !208, !tbaa !189
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !208
  store i8 %12, i8* %dest.02, align 1, !dbg !208, !tbaa !189
  %14 = icmp eq i64 %10, 0, !dbg !207
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !207, !llvm.loop !210

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !207

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !211
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #4 {
  %1 = icmp eq i64 %count, 0, !dbg !212
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !212

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !213
  br label %3, !dbg !212

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !212
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !213
  store volatile i8 %2, i8* %a.02, align 1, !dbg !213, !tbaa !189
  %6 = icmp eq i64 %4, 0, !dbg !212
  br i1 %6, label %._crit_edge, label %3, !dbg !212

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !214
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-floa
attributes #4 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nobuiltin noreturn nounwind }
attributes #9 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0, !12, !23, !36, !48, !61, !80, !95, !110}
!llvm.module.flags = !{!126, !127}
!llvm.ident = !{!128, !128, !128, !128, !128, !128, !128, !128, !128}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/test/Feature/srem.c", metadata !"/home/sanghu/TracerX/tracerx/test/Feature"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 9, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 10} ; [ DW_TAG_subp
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/srem.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786449, metadata !13, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !14, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!13 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786478, metadata !16, metadata !17, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!16 = metadata !{metadata !"klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!17 = metadata !{i32 786473, metadata !16}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{null, metadata !20}
!20 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786689, metadata !15, metadata !"z", metadata !17, i32 16777228, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!23 = metadata !{i32 786449, metadata !24, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !25, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!24 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!25 = metadata !{metadata !26}
!26 = metadata !{i32 786478, metadata !27, metadata !28, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !33, i32 13} ; [ 
!27 = metadata !{metadata !"klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!28 = metadata !{i32 786473, metadata !27}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !8, metadata !31}
!31 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!32 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!33 = metadata !{metadata !34, metadata !35}
!34 = metadata !{i32 786689, metadata !26, metadata !"name", metadata !28, i32 16777229, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!35 = metadata !{i32 786688, metadata !26, metadata !"x", metadata !28, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!36 = metadata !{i32 786449, metadata !37, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !38, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!37 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!38 = metadata !{metadata !39}
!39 = metadata !{i32 786478, metadata !40, metadata !41, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !42, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!40 = metadata !{metadata !"klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!41 = metadata !{i32 786473, metadata !40}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!42 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = metadata !{null, metadata !44, metadata !44}
!44 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!45 = metadata !{metadata !46, metadata !47}
!46 = metadata !{i32 786689, metadata !39, metadata !"bitWidth", metadata !41, i32 16777236, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!47 = metadata !{i32 786689, metadata !39, metadata !"shift", metadata !41, i32 33554452, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!48 = metadata !{i32 786449, metadata !49, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !50, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!49 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!50 = metadata !{metadata !51}
!51 = metadata !{i32 786478, metadata !52, metadata !53, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !54, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!52 = metadata !{metadata !"klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!53 = metadata !{i32 786473, metadata !52}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!54 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !55, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = metadata !{metadata !8, metadata !8, metadata !8, metadata !31}
!56 = metadata !{metadata !57, metadata !58, metadata !59, metadata !60}
!57 = metadata !{i32 786689, metadata !51, metadata !"start", metadata !53, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!58 = metadata !{i32 786689, metadata !51, metadata !"end", metadata !53, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!59 = metadata !{i32 786689, metadata !51, metadata !"name", metadata !53, i32 50331661, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!60 = metadata !{i32 786688, metadata !51, metadata !"x", metadata !53, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!61 = metadata !{i32 786449, metadata !62, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !63, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!62 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!63 = metadata !{metadata !64}
!64 = metadata !{i32 786478, metadata !65, metadata !66, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !67, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !74, i32 12} 
!65 = metadata !{metadata !"memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!66 = metadata !{i32 786473, metadata !65}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c]
!67 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !68, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!68 = metadata !{metadata !69, metadata !69, metadata !70, metadata !72}
!69 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!70 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !71} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!71 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = metadata !{i32 786454, metadata !65, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!73 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!74 = metadata !{metadata !75, metadata !76, metadata !77, metadata !78, metadata !79}
!75 = metadata !{i32 786689, metadata !64, metadata !"destaddr", metadata !66, i32 16777228, metadata !69, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!76 = metadata !{i32 786689, metadata !64, metadata !"srcaddr", metadata !66, i32 33554444, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!77 = metadata !{i32 786689, metadata !64, metadata !"len", metadata !66, i32 50331660, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!78 = metadata !{i32 786688, metadata !64, metadata !"dest", metadata !66, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!79 = metadata !{i32 786688, metadata !64, metadata !"src", metadata !66, i32 14, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!80 = metadata !{i32 786449, metadata !81, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !82, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!81 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!82 = metadata !{metadata !83}
!83 = metadata !{i32 786478, metadata !84, metadata !85, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !86, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !89, i32 1
!84 = metadata !{metadata !"memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!85 = metadata !{i32 786473, metadata !84}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!86 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !87, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!87 = metadata !{metadata !69, metadata !69, metadata !70, metadata !88}
!88 = metadata !{i32 786454, metadata !84, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!89 = metadata !{metadata !90, metadata !91, metadata !92, metadata !93, metadata !94}
!90 = metadata !{i32 786689, metadata !83, metadata !"dst", metadata !85, i32 16777228, metadata !69, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!91 = metadata !{i32 786689, metadata !83, metadata !"src", metadata !85, i32 33554444, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!92 = metadata !{i32 786689, metadata !83, metadata !"count", metadata !85, i32 50331660, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!93 = metadata !{i32 786688, metadata !83, metadata !"a", metadata !85, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!94 = metadata !{i32 786688, metadata !83, metadata !"b", metadata !85, i32 14, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!95 = metadata !{i32 786449, metadata !96, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !97, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!96 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!97 = metadata !{metadata !98}
!98 = metadata !{i32 786478, metadata !99, metadata !100, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !101, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !104, i3
!99 = metadata !{metadata !"mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!100 = metadata !{i32 786473, metadata !99}       ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c]
!101 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !102, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!102 = metadata !{metadata !69, metadata !69, metadata !70, metadata !103}
!103 = metadata !{i32 786454, metadata !99, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!104 = metadata !{metadata !105, metadata !106, metadata !107, metadata !108, metadata !109}
!105 = metadata !{i32 786689, metadata !98, metadata !"destaddr", metadata !100, i32 16777227, metadata !69, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!106 = metadata !{i32 786689, metadata !98, metadata !"srcaddr", metadata !100, i32 33554443, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!107 = metadata !{i32 786689, metadata !98, metadata !"len", metadata !100, i32 50331659, metadata !103, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!108 = metadata !{i32 786688, metadata !98, metadata !"dest", metadata !100, i32 12, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!109 = metadata !{i32 786688, metadata !98, metadata !"src", metadata !100, i32 13, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!110 = metadata !{i32 786449, metadata !111, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !112, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!111 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!112 = metadata !{metadata !113}
!113 = metadata !{i32 786478, metadata !114, metadata !115, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !116, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !119, i32
!114 = metadata !{metadata !"memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!115 = metadata !{i32 786473, metadata !114}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c]
!116 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !117, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!117 = metadata !{metadata !69, metadata !69, metadata !8, metadata !118}
!118 = metadata !{i32 786454, metadata !114, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!119 = metadata !{metadata !120, metadata !121, metadata !122, metadata !123}
!120 = metadata !{i32 786689, metadata !113, metadata !"dst", metadata !115, i32 16777227, metadata !69, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!121 = metadata !{i32 786689, metadata !113, metadata !"s", metadata !115, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!122 = metadata !{i32 786689, metadata !113, metadata !"count", metadata !115, i32 50331659, metadata !118, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!123 = metadata !{i32 786688, metadata !113, metadata !"a", metadata !115, i32 12, metadata !124, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!124 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !125} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!125 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!126 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!127 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!128 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!129 = metadata !{i32 13, i32 0, metadata !4, null}
!130 = metadata !{i32 16, i32 0, metadata !131, null}
!131 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/srem.c]
!132 = metadata !{i32 17, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !134, i32 17, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/srem.c]
!134 = metadata !{i32 786443, metadata !1, metadata !131, i32 16, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/srem.c]
!135 = metadata !{i32 19, i32 0, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !133, i32 17, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/srem.c]
!137 = metadata !{i32 20, i32 0, metadata !136, null}
!138 = metadata !{i32 21, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !133, i32 20, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/srem.c]
!140 = metadata !{i32 23, i32 0, metadata !134, null}
!141 = metadata !{i32 24, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !1, metadata !143, i32 24, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/srem.c]
!143 = metadata !{i32 786443, metadata !1, metadata !131, i32 23, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/srem.c]
!144 = metadata !{i32 25, i32 0, metadata !145, null}
!145 = metadata !{i32 786443, metadata !1, metadata !142, i32 24, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/srem.c]
!146 = metadata !{i32 26, i32 0, metadata !145, null}
!147 = metadata !{i32 27, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !142, i32 26, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/srem.c]
!149 = metadata !{i32 31, i32 0, metadata !4, null}
!150 = metadata !{i32 32, i32 0, metadata !4, null}
!151 = metadata !{i32 33, i32 0, metadata !4, null}
!152 = metadata !{i32 13, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !16, metadata !15, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!154 = metadata !{i32 14, i32 0, metadata !153, null}
!155 = metadata !{i32 15, i32 0, metadata !15, null}
!156 = metadata !{i32 15, i32 0, metadata !26, null}
!157 = metadata !{i32 16, i32 0, metadata !26, null}
!158 = metadata !{metadata !159, metadata !159, i64 0}
!159 = metadata !{metadata !"int", metadata !160, i64 0}
!160 = metadata !{metadata !"omnipotent char", metadata !161, i64 0}
!161 = metadata !{metadata !"Simple C/C++ TBAA"}
!162 = metadata !{i32 21, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !40, metadata !39, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!164 = metadata !{i32 27, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !40, metadata !163, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!166 = metadata !{i32 29, i32 0, metadata !39, null}
!167 = metadata !{i32 16, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !52, metadata !51, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!169 = metadata !{i32 17, i32 0, metadata !168, null}
!170 = metadata !{i32 19, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !52, metadata !51, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!172 = metadata !{i32 22, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !52, metadata !171, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!174 = metadata !{i32 25, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !52, metadata !173, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!176 = metadata !{i32 26, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !52, metadata !175, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!178 = metadata !{i32 27, i32 0, metadata !177, null}
!179 = metadata !{i32 28, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !52, metadata !175, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!181 = metadata !{i32 29, i32 0, metadata !180, null}
!182 = metadata !{i32 32, i32 0, metadata !173, null}
!183 = metadata !{i32 34, i32 0, metadata !51, null}
!184 = metadata !{i32 16, i32 0, metadata !64, null}
!185 = metadata !{i32 17, i32 0, metadata !64, null}
!186 = metadata !{metadata !186, metadata !187, metadata !188}
!187 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!188 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!189 = metadata !{metadata !160, metadata !160, i64 0}
!190 = metadata !{metadata !190, metadata !187, metadata !188}
!191 = metadata !{i32 18, i32 0, metadata !64, null}
!192 = metadata !{i32 16, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !84, metadata !83, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!194 = metadata !{i32 19, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !84, metadata !83, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!196 = metadata !{i32 20, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !84, metadata !195, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!198 = metadata !{metadata !198, metadata !187, metadata !188}
!199 = metadata !{metadata !199, metadata !187, metadata !188}
!200 = metadata !{i32 22, i32 0, metadata !201, null}
!201 = metadata !{i32 786443, metadata !84, metadata !195, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!202 = metadata !{i32 24, i32 0, metadata !201, null}
!203 = metadata !{i32 23, i32 0, metadata !201, null}
!204 = metadata !{metadata !204, metadata !187, metadata !188}
!205 = metadata !{metadata !205, metadata !187, metadata !188}
!206 = metadata !{i32 28, i32 0, metadata !83, null}
!207 = metadata !{i32 15, i32 0, metadata !98, null}
!208 = metadata !{i32 16, i32 0, metadata !98, null}
!209 = metadata !{metadata !209, metadata !187, metadata !188}
!210 = metadata !{metadata !210, metadata !187, metadata !188}
!211 = metadata !{i32 17, i32 0, metadata !98, null}
!212 = metadata !{i32 13, i32 0, metadata !113, null}
!213 = metadata !{i32 14, i32 0, metadata !113, null}
!214 = metadata !{i32 15, i32 0, metadata !113, null}
