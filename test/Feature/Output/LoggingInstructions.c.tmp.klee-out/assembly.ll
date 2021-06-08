; ModuleID = '/home/sanghu/TracerX/tracerx/test/Feature/Output/LoggingInstructions.c.tmp2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@array = global [5 x i8] c"\01\02\03\FC\05", align 1
@.str = private unnamed_addr constant [2 x i8] c"k\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"Yes\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str13 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str24 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c"klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast i32* %k to i8*, !dbg !133
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !133
  %3 = load i32* %k, align 4, !dbg !134
  %4 = icmp ult i32 %3, 5, !dbg !134
  %5 = zext i1 %4 to i32, !dbg !134
  %6 = sext i32 %5 to i64, !dbg !134
  call void @klee_assume(i64 %6), !dbg !134
  %7 = load i32* %k, align 4, !dbg !135
  %8 = zext i32 %7 to i64, !dbg !135
  %9 = getelementptr inbounds [5 x i8]* @array, i32 0, i64 %8, !dbg !135
  %10 = load i8* %9, align 1, !dbg !135
  %11 = sext i8 %10 to i32, !dbg !135
  %12 = icmp eq i32 %11, -4, !dbg !135
  br i1 %12, label %13, label %15, !dbg !135

; <label>:13                                      ; preds = %0
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0)), !dbg !137
  br label %15, !dbg !137

; <label>:15                                      ; preds = %13, %0
  ret i32 0, !dbg !138
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare void @klee_make_symbolic(i8*, i64, i8*) #2

declare void @klee_assume(i64) #2

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #3 {
  %1 = icmp eq i64 %z, 0, !dbg !139
  br i1 %1, label %2, label %3, !dbg !139

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str13, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str24, i64 0, i64 0)) #5, !dbg !141
  unreachable, !dbg !141

; <label>:3                                       ; preds = %0
  ret void, !dbg !142
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !143
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #6, !dbg !143
  %2 = load i32* %x, align 4, !dbg !144, !tbaa !145
  ret i32 %2, !dbg !144
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #3 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !149
  br i1 %1, label %3, label %2, !dbg !149

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str3, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #5, !dbg !151
  unreachable, !dbg !151

; <label>:3                                       ; preds = %0
  ret void, !dbg !153
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !154
  br i1 %1, label %3, label %2, !dbg !154

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #5, !dbg !156
  unreachable, !dbg !156

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !157
  %5 = icmp eq i32 %4, %end, !dbg !157
  br i1 %5, label %21, label %6, !dbg !157

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !159
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #6, !dbg !159
  %8 = icmp eq i32 %start, 0, !dbg !161
  %9 = load i32* %x, align 4, !dbg !163, !tbaa !145
  br i1 %8, label %10, label %13, !dbg !161

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !163
  %12 = zext i1 %11 to i64, !dbg !163
  call void @klee_assume(i64 %12) #6, !dbg !163
  br label %19, !dbg !165

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !166
  %15 = zext i1 %14 to i64, !dbg !166
  call void @klee_assume(i64 %15) #6, !dbg !166
  %16 = load i32* %x, align 4, !dbg !168, !tbaa !145
  %17 = icmp slt i32 %16, %end, !dbg !168
  %18 = zext i1 %17 to i64, !dbg !168
  call void @klee_assume(i64 %18) #6, !dbg !168
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !169, !tbaa !145
  br label %21, !dbg !169

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !170
}

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0, !dbg !171
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !171

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !172
  %wide.load = load <16 x i8>* %3, align 1, !dbg !172
  %next.gep.sum279 = or i64 %index, 16, !dbg !172
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !172
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !172
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !172
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !172
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !172
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum279, !dbg !172
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !172
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !172
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !173

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
  %10 = add i64 %.01, -1, !dbg !171
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !172
  %12 = load i8* %src.03, align 1, !dbg !172, !tbaa !176
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !172
  store i8 %12, i8* %dest.02, align 1, !dbg !172, !tbaa !176
  %14 = icmp eq i64 %10, 0, !dbg !171
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !171, !llvm.loop !177

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !178
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #3 {
  %1 = icmp eq i8* %src, %dst, !dbg !179
  br i1 %1, label %.loopexit, label %2, !dbg !179

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !181
  br i1 %3, label %.preheader, label %18, !dbg !181

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !183
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !183

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
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !183
  %wide.load = load <16 x i8>* %6, align 1, !dbg !183
  %next.gep.sum586 = or i64 %index, 16, !dbg !183
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !183
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !183
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !183
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !183
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !183
  %10 = getelementptr i8* %dst, i64 %next.gep.sum586, !dbg !183
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !183
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !183
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !185

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
  %13 = add i64 %.02, -1, !dbg !183
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !183
  %15 = load i8* %b.04, align 1, !dbg !183, !tbaa !176
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !183
  store i8 %15, i8* %a.03, align 1, !dbg !183, !tbaa !176
  %17 = icmp eq i64 %13, 0, !dbg !183
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !183, !llvm.loop !186

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !187
  %20 = icmp eq i64 %count, 0, !dbg !189
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !189

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !190
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !187
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
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !189
  %23 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !189
  %24 = bitcast i8* %23 to <16 x i8>*, !dbg !189
  %wide.load434 = load <16 x i8>* %24, align 1, !dbg !189
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !189
  %.sum505 = add i64 %.sum440, -31, !dbg !189
  %25 = getelementptr i8* %src, i64 %.sum505, !dbg !189
  %26 = bitcast i8* %25 to <16 x i8>*, !dbg !189
  %wide.load435 = load <16 x i8>* %26, align 1, !dbg !189
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !189
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !189
  %27 = getelementptr i8* %dst, i64 %next.gep236.sum, !dbg !189
  %28 = bitcast i8* %27 to <16 x i8>*, !dbg !189
  store <16 x i8> %reverse437, <16 x i8>* %28, align 1, !dbg !189
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !189
  %29 = getelementptr i8* %dst, i64 %.sum505, !dbg !189
  %30 = bitcast i8* %29 to <16 x i8>*, !dbg !189
  store <16 x i8> %reverse438, <16 x i8>* %30, align 1, !dbg !189
  %index.next234 = add i64 %index212, 32
  %31 = icmp eq i64 %index.next234, %n.vec215
  br i1 %31, label %middle.block210, label %vector.body209, !llvm.loop !191

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
  %32 = add i64 %.16, -1, !dbg !189
  %33 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !189
  %34 = load i8* %b.18, align 1, !dbg !189, !tbaa !176
  %35 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !189
  store i8 %34, i8* %a.17, align 1, !dbg !189, !tbaa !176
  %36 = icmp eq i64 %32, 0, !dbg !189
  br i1 %36, label %.loopexit, label %scalar.ph211, !dbg !189, !llvm.loop !192

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !193
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0, !dbg !194
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !194

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !195
  %wide.load = load <16 x i8>* %3, align 1, !dbg !195
  %next.gep.sum280 = or i64 %index, 16, !dbg !195
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !195
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !195
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !195
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !195
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !195
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum280, !dbg !195
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !195
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !195
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !196

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
  %10 = add i64 %.01, -1, !dbg !194
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !195
  %12 = load i8* %src.03, align 1, !dbg !195, !tbaa !176
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !195
  store i8 %12, i8* %dest.02, align 1, !dbg !195, !tbaa !176
  %14 = icmp eq i64 %10, 0, !dbg !194
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !194, !llvm.loop !197

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !194

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !198
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #3 {
  %1 = icmp eq i64 %count, 0, !dbg !199
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !199

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !200
  br label %3, !dbg !199

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !199
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !200
  store volatile i8 %2, i8* %a.02, align 1, !dbg !200, !tbaa !176
  %6 = icmp eq i64 %4, 0, !dbg !199
  br i1 %6, label %._crit_edge, label %3, !dbg !199

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !201
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin noreturn nounwind }
attributes #6 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0, !15, !26, !39, !51, !64, !84, !99, !114}
!llvm.module.flags = !{!130, !131}
!llvm.ident = !{!132, !132, !132, !132, !132, !132, !132, !132, !132}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !9, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/test/Feature/LoggingInstructions.c", metadata !"/home/sanghu/TracerX/tracerx/test/Feature"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 24, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 24} ; [ DW_TAG_subprogram ] [
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/LoggingInstructions.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{metadata !10}
!10 = metadata !{i32 786484, i32 0, null, metadata !"array", metadata !"array", metadata !"", metadata !5, i32 22, metadata !11, i32 0, i32 1, [5 x i8]* @array, null} ; [ DW_TAG_variable ] [array] [line 22] [def]
!11 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 40, i64 8, i32 0, i32 0, metadata !12, metadata !13, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 40, align 8, offset 0] [from char]
!12 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!13 = metadata !{metadata !14}
!14 = metadata !{i32 786465, i64 0, i64 5}        ; [ DW_TAG_subrange_type ] [0, 4]
!15 = metadata !{i32 786449, metadata !16, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !17, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!16 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786478, metadata !19, metadata !20, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!19 = metadata !{metadata !"klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!20 = metadata !{i32 786473, metadata !19}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!21 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{null, metadata !23}
!23 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!24 = metadata !{metadata !25}
!25 = metadata !{i32 786689, metadata !18, metadata !"z", metadata !20, i32 16777228, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!26 = metadata !{i32 786449, metadata !27, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !28, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!27 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!28 = metadata !{metadata !29}
!29 = metadata !{i32 786478, metadata !30, metadata !31, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !32, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !36, i32 13} ; [ 
!30 = metadata !{metadata !"klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!31 = metadata !{i32 786473, metadata !30}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c]
!32 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !33, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = metadata !{metadata !8, metadata !34}
!34 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!35 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!36 = metadata !{metadata !37, metadata !38}
!37 = metadata !{i32 786689, metadata !29, metadata !"name", metadata !31, i32 16777229, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!38 = metadata !{i32 786688, metadata !29, metadata !"x", metadata !31, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!39 = metadata !{i32 786449, metadata !40, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !41, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!40 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 786478, metadata !43, metadata !44, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !45, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!43 = metadata !{metadata !"klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!44 = metadata !{i32 786473, metadata !43}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!45 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !46, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = metadata !{null, metadata !47, metadata !47}
!47 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!48 = metadata !{metadata !49, metadata !50}
!49 = metadata !{i32 786689, metadata !42, metadata !"bitWidth", metadata !44, i32 16777236, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!50 = metadata !{i32 786689, metadata !42, metadata !"shift", metadata !44, i32 33554452, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!51 = metadata !{i32 786449, metadata !52, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !53, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!52 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!53 = metadata !{metadata !54}
!54 = metadata !{i32 786478, metadata !55, metadata !56, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !57, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!55 = metadata !{metadata !"klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!56 = metadata !{i32 786473, metadata !55}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!57 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !8, metadata !8, metadata !8, metadata !34}
!59 = metadata !{metadata !60, metadata !61, metadata !62, metadata !63}
!60 = metadata !{i32 786689, metadata !54, metadata !"start", metadata !56, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!61 = metadata !{i32 786689, metadata !54, metadata !"end", metadata !56, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!62 = metadata !{i32 786689, metadata !54, metadata !"name", metadata !56, i32 50331661, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!63 = metadata !{i32 786688, metadata !54, metadata !"x", metadata !56, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!64 = metadata !{i32 786449, metadata !65, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !66, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!65 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!66 = metadata !{metadata !67}
!67 = metadata !{i32 786478, metadata !68, metadata !69, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !70, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !77, i32 12} 
!68 = metadata !{metadata !"memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!69 = metadata !{i32 786473, metadata !68}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c]
!70 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !71, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!71 = metadata !{metadata !72, metadata !72, metadata !73, metadata !75}
!72 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!73 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !74} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!74 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = metadata !{i32 786454, metadata !68, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!76 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!77 = metadata !{metadata !78, metadata !79, metadata !80, metadata !81, metadata !83}
!78 = metadata !{i32 786689, metadata !67, metadata !"destaddr", metadata !69, i32 16777228, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!79 = metadata !{i32 786689, metadata !67, metadata !"srcaddr", metadata !69, i32 33554444, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!80 = metadata !{i32 786689, metadata !67, metadata !"len", metadata !69, i32 50331660, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!81 = metadata !{i32 786688, metadata !67, metadata !"dest", metadata !69, i32 13, metadata !82, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!82 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!83 = metadata !{i32 786688, metadata !67, metadata !"src", metadata !69, i32 14, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!84 = metadata !{i32 786449, metadata !85, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !86, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!85 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!86 = metadata !{metadata !87}
!87 = metadata !{i32 786478, metadata !88, metadata !89, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !90, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !93, i32 1
!88 = metadata !{metadata !"memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!89 = metadata !{i32 786473, metadata !88}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!90 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !91, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!91 = metadata !{metadata !72, metadata !72, metadata !73, metadata !92}
!92 = metadata !{i32 786454, metadata !88, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!93 = metadata !{metadata !94, metadata !95, metadata !96, metadata !97, metadata !98}
!94 = metadata !{i32 786689, metadata !87, metadata !"dst", metadata !89, i32 16777228, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!95 = metadata !{i32 786689, metadata !87, metadata !"src", metadata !89, i32 33554444, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!96 = metadata !{i32 786689, metadata !87, metadata !"count", metadata !89, i32 50331660, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!97 = metadata !{i32 786688, metadata !87, metadata !"a", metadata !89, i32 13, metadata !82, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!98 = metadata !{i32 786688, metadata !87, metadata !"b", metadata !89, i32 14, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!99 = metadata !{i32 786449, metadata !100, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !101, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/ho
!100 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!101 = metadata !{metadata !102}
!102 = metadata !{i32 786478, metadata !103, metadata !104, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !105, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !108, 
!103 = metadata !{metadata !"mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!104 = metadata !{i32 786473, metadata !103}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c]
!105 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !106, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!106 = metadata !{metadata !72, metadata !72, metadata !73, metadata !107}
!107 = metadata !{i32 786454, metadata !103, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!108 = metadata !{metadata !109, metadata !110, metadata !111, metadata !112, metadata !113}
!109 = metadata !{i32 786689, metadata !102, metadata !"destaddr", metadata !104, i32 16777227, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!110 = metadata !{i32 786689, metadata !102, metadata !"srcaddr", metadata !104, i32 33554443, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!111 = metadata !{i32 786689, metadata !102, metadata !"len", metadata !104, i32 50331659, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!112 = metadata !{i32 786688, metadata !102, metadata !"dest", metadata !104, i32 12, metadata !82, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!113 = metadata !{i32 786688, metadata !102, metadata !"src", metadata !104, i32 13, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!114 = metadata !{i32 786449, metadata !115, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !116, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!115 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!116 = metadata !{metadata !117}
!117 = metadata !{i32 786478, metadata !118, metadata !119, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !120, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !123, i32
!118 = metadata !{metadata !"memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!119 = metadata !{i32 786473, metadata !118}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c]
!120 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !121, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!121 = metadata !{metadata !72, metadata !72, metadata !8, metadata !122}
!122 = metadata !{i32 786454, metadata !118, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!123 = metadata !{metadata !124, metadata !125, metadata !126, metadata !127}
!124 = metadata !{i32 786689, metadata !117, metadata !"dst", metadata !119, i32 16777227, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!125 = metadata !{i32 786689, metadata !117, metadata !"s", metadata !119, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!126 = metadata !{i32 786689, metadata !117, metadata !"count", metadata !119, i32 50331659, metadata !122, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!127 = metadata !{i32 786688, metadata !117, metadata !"a", metadata !119, i32 12, metadata !128, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!128 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !129} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!129 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!130 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!131 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!132 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!133 = metadata !{i32 27, i32 0, metadata !4, null}
!134 = metadata !{i32 28, i32 0, metadata !4, null}
!135 = metadata !{i32 30, i32 0, metadata !136, null}
!136 = metadata !{i32 786443, metadata !1, metadata !4, i32 30, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/LoggingInstructions.c]
!137 = metadata !{i32 31, i32 0, metadata !136, null}
!138 = metadata !{i32 46, i32 0, metadata !4, null}
!139 = metadata !{i32 13, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !19, metadata !18, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!141 = metadata !{i32 14, i32 0, metadata !140, null}
!142 = metadata !{i32 15, i32 0, metadata !18, null}
!143 = metadata !{i32 15, i32 0, metadata !29, null}
!144 = metadata !{i32 16, i32 0, metadata !29, null}
!145 = metadata !{metadata !146, metadata !146, i64 0}
!146 = metadata !{metadata !"int", metadata !147, i64 0}
!147 = metadata !{metadata !"omnipotent char", metadata !148, i64 0}
!148 = metadata !{metadata !"Simple C/C++ TBAA"}
!149 = metadata !{i32 21, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !43, metadata !42, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!151 = metadata !{i32 27, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !43, metadata !150, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!153 = metadata !{i32 29, i32 0, metadata !42, null}
!154 = metadata !{i32 16, i32 0, metadata !155, null}
!155 = metadata !{i32 786443, metadata !55, metadata !54, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!156 = metadata !{i32 17, i32 0, metadata !155, null}
!157 = metadata !{i32 19, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !55, metadata !54, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!159 = metadata !{i32 22, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !55, metadata !158, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!161 = metadata !{i32 25, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !55, metadata !160, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!163 = metadata !{i32 26, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !55, metadata !162, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!165 = metadata !{i32 27, i32 0, metadata !164, null}
!166 = metadata !{i32 28, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !55, metadata !162, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!168 = metadata !{i32 29, i32 0, metadata !167, null}
!169 = metadata !{i32 32, i32 0, metadata !160, null}
!170 = metadata !{i32 34, i32 0, metadata !54, null}
!171 = metadata !{i32 16, i32 0, metadata !67, null}
!172 = metadata !{i32 17, i32 0, metadata !67, null}
!173 = metadata !{metadata !173, metadata !174, metadata !175}
!174 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!175 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!176 = metadata !{metadata !147, metadata !147, i64 0}
!177 = metadata !{metadata !177, metadata !174, metadata !175}
!178 = metadata !{i32 18, i32 0, metadata !67, null}
!179 = metadata !{i32 16, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !88, metadata !87, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!181 = metadata !{i32 19, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !88, metadata !87, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!183 = metadata !{i32 20, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !88, metadata !182, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!185 = metadata !{metadata !185, metadata !174, metadata !175}
!186 = metadata !{metadata !186, metadata !174, metadata !175}
!187 = metadata !{i32 22, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !88, metadata !182, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!189 = metadata !{i32 24, i32 0, metadata !188, null}
!190 = metadata !{i32 23, i32 0, metadata !188, null}
!191 = metadata !{metadata !191, metadata !174, metadata !175}
!192 = metadata !{metadata !192, metadata !174, metadata !175}
!193 = metadata !{i32 28, i32 0, metadata !87, null}
!194 = metadata !{i32 15, i32 0, metadata !102, null}
!195 = metadata !{i32 16, i32 0, metadata !102, null}
!196 = metadata !{metadata !196, metadata !174, metadata !175}
!197 = metadata !{metadata !197, metadata !174, metadata !175}
!198 = metadata !{i32 17, i32 0, metadata !102, null}
!199 = metadata !{i32 13, i32 0, metadata !117, null}
!200 = metadata !{i32 14, i32 0, metadata !117, null}
!201 = metadata !{i32 15, i32 0, metadata !117, null}
