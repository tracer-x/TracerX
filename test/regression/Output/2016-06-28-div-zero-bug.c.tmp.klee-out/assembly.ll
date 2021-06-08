; ModuleID = '/home/sanghu/TracerX/tracerx/test/regression/Output/2016-06-28-div-zero-bug.c.tmp.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b = common global i32 0, align 4
@c = global i32* @b, align 8
@d = global i32* @b, align 8
@a = common global i32 0, align 4
@f = global i32* @a, align 8
@g = common global i32 0, align 4
@.str = private unnamed_addr constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c"klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @safe_div(i16 signext %p1, i32 %p2) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %p1, i16* %1, align 2
  store i32 %p2, i32* %2, align 4
  %3 = load i32* %2, align 4, !dbg !140
  %4 = icmp eq i32 %3, 0, !dbg !140
  br i1 %4, label %5, label %8, !dbg !140

; <label>:5                                       ; preds = %0
  %6 = load i16* %1, align 2, !dbg !140
  %7 = sext i16 %6 to i32, !dbg !140
  br label %10, !dbg !140

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4, !dbg !140
  br label %10, !dbg !140

; <label>:10                                      ; preds = %8, %5
  %11 = phi i32 [ %7, %5 ], [ %9, %8 ], !dbg !140
  ret i32 %11, !dbg !140
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 (i32*, i64, ...)* bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, ...)*)(i32* @b, i64 4), !dbg !141
  %3 = load i32** @c, align 8, !dbg !142
  %4 = load i32* %3, align 4, !dbg !142
  %5 = trunc i32 %4 to i16, !dbg !142
  %6 = call i32 @safe_div(i16 signext %5, i32 0), !dbg !142
  %7 = icmp ne i32 %6, 0, !dbg !142
  br i1 %7, label %8, label %13, !dbg !142

; <label>:8                                       ; preds = %0
  %9 = load i32** @c, align 8, !dbg !144
  %10 = load i32* %9, align 4, !dbg !144
  %int_cast_to_i64 = zext i32 %10 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !144
  %11 = srem i32 ptrtoint (i32* @b to i32), %10, !dbg !144
  %12 = load i32** @f, align 8, !dbg !144
  store i32 %11, i32* %12, align 4, !dbg !144
  br label %13, !dbg !144

; <label>:13                                      ; preds = %8, %0
  %14 = load i32* @a, align 4, !dbg !145
  %15 = icmp ne i32 %14, 0, !dbg !145
  br i1 %15, label %16, label %19, !dbg !145

; <label>:16                                      ; preds = %13
  %17 = load i32* @g, align 4, !dbg !145
  %18 = icmp ne i32 %17, 0, !dbg !145
  br label %19

; <label>:19                                      ; preds = %16, %13
  %20 = phi i1 [ false, %13 ], [ %18, %16 ]
  %21 = zext i1 %20 to i32
  %22 = trunc i32 %21 to i16
  %23 = load i32** @d, align 8, !dbg !145
  %24 = load i32* %23, align 4, !dbg !145
  %25 = call i32 @safe_div(i16 signext %22, i32 %24), !dbg !145
  %26 = load i32* %1, !dbg !146
  ret i32 %26, !dbg !146
}

declare i32 @klee_make_symbolic(...) #2

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #3 {
  %1 = icmp eq i64 %z, 0, !dbg !147
  br i1 %1, label %2, label %3, !dbg !147

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0)) #6, !dbg !149
  unreachable, !dbg !149

; <label>:3                                       ; preds = %0
  ret void, !dbg !150
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !151
  call void bitcast (i32 (...)* @klee_make_symbolic to void (i8*, i64, i8*)*)(i8* %1, i64 4, i8* %name) #7, !dbg !151
  %2 = load i32* %x, align 4, !dbg !152, !tbaa !153
  ret i32 %2, !dbg !152
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #3 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !157
  br i1 %1, label %3, label %2, !dbg !157

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str3, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #6, !dbg !159
  unreachable, !dbg !159

; <label>:3                                       ; preds = %0
  ret void, !dbg !161
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !162
  br i1 %1, label %3, label %2, !dbg !162

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #6, !dbg !164
  unreachable, !dbg !164

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !165
  %5 = icmp eq i32 %4, %end, !dbg !165
  br i1 %5, label %21, label %6, !dbg !165

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !167
  call void bitcast (i32 (...)* @klee_make_symbolic to void (i8*, i64, i8*)*)(i8* %7, i64 4, i8* %name) #7, !dbg !167
  %8 = icmp eq i32 %start, 0, !dbg !169
  %9 = load i32* %x, align 4, !dbg !171, !tbaa !153
  br i1 %8, label %10, label %13, !dbg !169

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !171
  %12 = zext i1 %11 to i64, !dbg !171
  call void @klee_assume(i64 %12) #7, !dbg !171
  br label %19, !dbg !173

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !174
  %15 = zext i1 %14 to i64, !dbg !174
  call void @klee_assume(i64 %15) #7, !dbg !174
  %16 = load i32* %x, align 4, !dbg !176, !tbaa !153
  %17 = icmp slt i32 %16, %end, !dbg !176
  %18 = zext i1 %17 to i64, !dbg !176
  call void @klee_assume(i64 %18) #7, !dbg !176
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !177, !tbaa !153
  br label %21, !dbg !177

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !178
}

declare void @klee_assume(i64) #5

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0, !dbg !179
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !179

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !180
  %wide.load = load <16 x i8>* %3, align 1, !dbg !180
  %next.gep.sum279 = or i64 %index, 16, !dbg !180
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !180
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !180
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !180
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !180
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !180
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum279, !dbg !180
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !180
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !180
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !181

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
  %10 = add i64 %.01, -1, !dbg !179
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !180
  %12 = load i8* %src.03, align 1, !dbg !180, !tbaa !184
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !180
  store i8 %12, i8* %dest.02, align 1, !dbg !180, !tbaa !184
  %14 = icmp eq i64 %10, 0, !dbg !179
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !179, !llvm.loop !185

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !186
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #3 {
  %1 = icmp eq i8* %src, %dst, !dbg !187
  br i1 %1, label %.loopexit, label %2, !dbg !187

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !189
  br i1 %3, label %.preheader, label %18, !dbg !189

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !191
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !191

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
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !191
  %wide.load = load <16 x i8>* %6, align 1, !dbg !191
  %next.gep.sum586 = or i64 %index, 16, !dbg !191
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !191
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !191
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !191
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !191
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !191
  %10 = getelementptr i8* %dst, i64 %next.gep.sum586, !dbg !191
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !191
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !191
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !193

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
  %13 = add i64 %.02, -1, !dbg !191
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !191
  %15 = load i8* %b.04, align 1, !dbg !191, !tbaa !184
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !191
  store i8 %15, i8* %a.03, align 1, !dbg !191, !tbaa !184
  %17 = icmp eq i64 %13, 0, !dbg !191
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !191, !llvm.loop !194

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !195
  %20 = icmp eq i64 %count, 0, !dbg !197
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !197

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !198
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !195
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
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !197
  %23 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !197
  %24 = bitcast i8* %23 to <16 x i8>*, !dbg !197
  %wide.load434 = load <16 x i8>* %24, align 1, !dbg !197
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !197
  %.sum505 = add i64 %.sum440, -31, !dbg !197
  %25 = getelementptr i8* %src, i64 %.sum505, !dbg !197
  %26 = bitcast i8* %25 to <16 x i8>*, !dbg !197
  %wide.load435 = load <16 x i8>* %26, align 1, !dbg !197
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !197
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !197
  %27 = getelementptr i8* %dst, i64 %next.gep236.sum, !dbg !197
  %28 = bitcast i8* %27 to <16 x i8>*, !dbg !197
  store <16 x i8> %reverse437, <16 x i8>* %28, align 1, !dbg !197
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !197
  %29 = getelementptr i8* %dst, i64 %.sum505, !dbg !197
  %30 = bitcast i8* %29 to <16 x i8>*, !dbg !197
  store <16 x i8> %reverse438, <16 x i8>* %30, align 1, !dbg !197
  %index.next234 = add i64 %index212, 32
  %31 = icmp eq i64 %index.next234, %n.vec215
  br i1 %31, label %middle.block210, label %vector.body209, !llvm.loop !199

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
  %32 = add i64 %.16, -1, !dbg !197
  %33 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !197
  %34 = load i8* %b.18, align 1, !dbg !197, !tbaa !184
  %35 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !197
  store i8 %34, i8* %a.17, align 1, !dbg !197, !tbaa !184
  %36 = icmp eq i64 %32, 0, !dbg !197
  br i1 %36, label %.loopexit, label %scalar.ph211, !dbg !197, !llvm.loop !200

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !201
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0, !dbg !202
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !202

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !203
  %wide.load = load <16 x i8>* %3, align 1, !dbg !203
  %next.gep.sum280 = or i64 %index, 16, !dbg !203
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !203
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !203
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !203
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !203
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !203
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum280, !dbg !203
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !203
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !203
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !204

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
  %10 = add i64 %.01, -1, !dbg !202
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !203
  %12 = load i8* %src.03, align 1, !dbg !203, !tbaa !184
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !203
  store i8 %12, i8* %dest.02, align 1, !dbg !203, !tbaa !184
  %14 = icmp eq i64 %10, 0, !dbg !202
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !202, !llvm.loop !205

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !202

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !206
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #3 {
  %1 = icmp eq i64 %count, 0, !dbg !207
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !207

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !208
  br label %3, !dbg !207

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !207
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !208
  store volatile i8 %2, i8* %a.02, align 1, !dbg !208, !tbaa !184
  %6 = icmp eq i64 %4, 0, !dbg !207
  br i1 %6, label %._crit_edge, label %3, !dbg !207

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !209
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin noreturn nounwind }
attributes #7 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0, !21, !32, !46, !58, !71, !91, !106, !121}
!llvm.module.flags = !{!137, !138}
!llvm.ident = !{!139, !139, !139, !139, !139, !139, !139, !139, !139}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !13, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/test/regression/2016-06-28-div-zero-bug.c", metadata !"/home/sanghu/TracerX/tracerx/test/regression"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !10}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"safe_div", metadata !"safe_div", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i16, i32)* @safe_div, null, null, metadata !2, i32 13} ; [
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/test/regression//home/sanghu/TracerX/tracerx/test/regression/2016-06-28-div-zero-bug.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !9, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786468, null, null, metadata !"short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 15, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram ]
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !8}
!13 = metadata !{metadata !14, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20}
!14 = metadata !{i32 786484, i32 0, null, metadata !"c", metadata !"c", metadata !"", metadata !5, i32 11, metadata !15, i32 0, i32 1, i32** @c, null} ; [ DW_TAG_variable ] [c] [line 11] [def]
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!16 = metadata !{i32 786484, i32 0, null, metadata !"d", metadata !"d", metadata !"", metadata !5, i32 11, metadata !15, i32 0, i32 1, i32** @d, null} ; [ DW_TAG_variable ] [d] [line 11] [def]
!17 = metadata !{i32 786484, i32 0, null, metadata !"f", metadata !"f", metadata !"", metadata !5, i32 11, metadata !15, i32 0, i32 1, i32** @f, null} ; [ DW_TAG_variable ] [f] [line 11] [def]
!18 = metadata !{i32 786484, i32 0, null, metadata !"b", metadata !"b", metadata !"", metadata !5, i32 9, metadata !8, i32 0, i32 1, i32* @b, null} ; [ DW_TAG_variable ] [b] [line 9] [def]
!19 = metadata !{i32 786484, i32 0, null, metadata !"a", metadata !"a", metadata !"", metadata !5, i32 9, metadata !8, i32 0, i32 1, i32* @a, null} ; [ DW_TAG_variable ] [a] [line 9] [def]
!20 = metadata !{i32 786484, i32 0, null, metadata !"g", metadata !"g", metadata !"", metadata !5, i32 9, metadata !8, i32 0, i32 1, i32* @g, null} ; [ DW_TAG_variable ] [g] [line 9] [def]
!21 = metadata !{i32 786449, metadata !22, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !23, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!22 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!25 = metadata !{metadata !"klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!26 = metadata !{i32 786473, metadata !25}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!27 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{null, metadata !29}
!29 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!30 = metadata !{metadata !31}
!31 = metadata !{i32 786689, metadata !24, metadata !"z", metadata !26, i32 16777228, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!32 = metadata !{i32 786449, metadata !33, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !34, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!33 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!34 = metadata !{metadata !35}
!35 = metadata !{i32 786478, metadata !36, metadata !37, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !43, i32 13} ; [ 
!36 = metadata !{metadata !"klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!37 = metadata !{i32 786473, metadata !36}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{metadata !8, metadata !40}
!40 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!41 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!42 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!43 = metadata !{metadata !44, metadata !45}
!44 = metadata !{i32 786689, metadata !35, metadata !"name", metadata !37, i32 16777229, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!45 = metadata !{i32 786688, metadata !35, metadata !"x", metadata !37, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!46 = metadata !{i32 786449, metadata !47, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !48, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!47 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786478, metadata !50, metadata !51, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !52, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!50 = metadata !{metadata !"klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!51 = metadata !{i32 786473, metadata !50}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!52 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = metadata !{null, metadata !54, metadata !54}
!54 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!55 = metadata !{metadata !56, metadata !57}
!56 = metadata !{i32 786689, metadata !49, metadata !"bitWidth", metadata !51, i32 16777236, metadata !54, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!57 = metadata !{i32 786689, metadata !49, metadata !"shift", metadata !51, i32 33554452, metadata !54, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!58 = metadata !{i32 786449, metadata !59, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !60, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!59 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786478, metadata !62, metadata !63, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !64, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!62 = metadata !{metadata !"klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!63 = metadata !{i32 786473, metadata !62}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!64 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !65, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!65 = metadata !{metadata !8, metadata !8, metadata !8, metadata !40}
!66 = metadata !{metadata !67, metadata !68, metadata !69, metadata !70}
!67 = metadata !{i32 786689, metadata !61, metadata !"start", metadata !63, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!68 = metadata !{i32 786689, metadata !61, metadata !"end", metadata !63, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!69 = metadata !{i32 786689, metadata !61, metadata !"name", metadata !63, i32 50331661, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!70 = metadata !{i32 786688, metadata !61, metadata !"x", metadata !63, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!71 = metadata !{i32 786449, metadata !72, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !73, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!72 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!73 = metadata !{metadata !74}
!74 = metadata !{i32 786478, metadata !75, metadata !76, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !84, i32 12} 
!75 = metadata !{metadata !"memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!76 = metadata !{i32 786473, metadata !75}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c]
!77 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !78, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!78 = metadata !{metadata !79, metadata !79, metadata !80, metadata !82}
!79 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!80 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !81} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!81 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = metadata !{i32 786454, metadata !75, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!83 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!84 = metadata !{metadata !85, metadata !86, metadata !87, metadata !88, metadata !90}
!85 = metadata !{i32 786689, metadata !74, metadata !"destaddr", metadata !76, i32 16777228, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!86 = metadata !{i32 786689, metadata !74, metadata !"srcaddr", metadata !76, i32 33554444, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!87 = metadata !{i32 786689, metadata !74, metadata !"len", metadata !76, i32 50331660, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!88 = metadata !{i32 786688, metadata !74, metadata !"dest", metadata !76, i32 13, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!89 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!90 = metadata !{i32 786688, metadata !74, metadata !"src", metadata !76, i32 14, metadata !40, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!91 = metadata !{i32 786449, metadata !92, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !93, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!92 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!93 = metadata !{metadata !94}
!94 = metadata !{i32 786478, metadata !95, metadata !96, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !97, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !100, i32 
!95 = metadata !{metadata !"memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!96 = metadata !{i32 786473, metadata !95}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!97 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !98, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!98 = metadata !{metadata !79, metadata !79, metadata !80, metadata !99}
!99 = metadata !{i32 786454, metadata !95, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!100 = metadata !{metadata !101, metadata !102, metadata !103, metadata !104, metadata !105}
!101 = metadata !{i32 786689, metadata !94, metadata !"dst", metadata !96, i32 16777228, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!102 = metadata !{i32 786689, metadata !94, metadata !"src", metadata !96, i32 33554444, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!103 = metadata !{i32 786689, metadata !94, metadata !"count", metadata !96, i32 50331660, metadata !99, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!104 = metadata !{i32 786688, metadata !94, metadata !"a", metadata !96, i32 13, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!105 = metadata !{i32 786688, metadata !94, metadata !"b", metadata !96, i32 14, metadata !40, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!106 = metadata !{i32 786449, metadata !107, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !108, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!107 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!108 = metadata !{metadata !109}
!109 = metadata !{i32 786478, metadata !110, metadata !111, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !112, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !115, 
!110 = metadata !{metadata !"mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!111 = metadata !{i32 786473, metadata !110}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c]
!112 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !113, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!113 = metadata !{metadata !79, metadata !79, metadata !80, metadata !114}
!114 = metadata !{i32 786454, metadata !110, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!115 = metadata !{metadata !116, metadata !117, metadata !118, metadata !119, metadata !120}
!116 = metadata !{i32 786689, metadata !109, metadata !"destaddr", metadata !111, i32 16777227, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!117 = metadata !{i32 786689, metadata !109, metadata !"srcaddr", metadata !111, i32 33554443, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!118 = metadata !{i32 786689, metadata !109, metadata !"len", metadata !111, i32 50331659, metadata !114, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!119 = metadata !{i32 786688, metadata !109, metadata !"dest", metadata !111, i32 12, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!120 = metadata !{i32 786688, metadata !109, metadata !"src", metadata !111, i32 13, metadata !40, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!121 = metadata !{i32 786449, metadata !122, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !123, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!122 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!123 = metadata !{metadata !124}
!124 = metadata !{i32 786478, metadata !125, metadata !126, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !127, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !130, i32
!125 = metadata !{metadata !"memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!126 = metadata !{i32 786473, metadata !125}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c]
!127 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !128, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!128 = metadata !{metadata !79, metadata !79, metadata !8, metadata !129}
!129 = metadata !{i32 786454, metadata !125, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!130 = metadata !{metadata !131, metadata !132, metadata !133, metadata !134}
!131 = metadata !{i32 786689, metadata !124, metadata !"dst", metadata !126, i32 16777227, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!132 = metadata !{i32 786689, metadata !124, metadata !"s", metadata !126, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!133 = metadata !{i32 786689, metadata !124, metadata !"count", metadata !126, i32 50331659, metadata !129, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!134 = metadata !{i32 786688, metadata !124, metadata !"a", metadata !126, i32 12, metadata !135, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!135 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !136} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!136 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!137 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!138 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!139 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!140 = metadata !{i32 13, i32 0, metadata !4, null}
!141 = metadata !{i32 16, i32 0, metadata !10, null}
!142 = metadata !{i32 17, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !10, i32 17, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/regression//home/sanghu/TracerX/tracerx/test/regression/2016-06-28-div-zero-bug.c]
!144 = metadata !{i32 18, i32 0, metadata !143, null}
!145 = metadata !{i32 20, i32 0, metadata !10, null}
!146 = metadata !{i32 21, i32 0, metadata !10, null}
!147 = metadata !{i32 13, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !25, metadata !24, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!149 = metadata !{i32 14, i32 0, metadata !148, null}
!150 = metadata !{i32 15, i32 0, metadata !24, null}
!151 = metadata !{i32 15, i32 0, metadata !35, null}
!152 = metadata !{i32 16, i32 0, metadata !35, null}
!153 = metadata !{metadata !154, metadata !154, i64 0}
!154 = metadata !{metadata !"int", metadata !155, i64 0}
!155 = metadata !{metadata !"omnipotent char", metadata !156, i64 0}
!156 = metadata !{metadata !"Simple C/C++ TBAA"}
!157 = metadata !{i32 21, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !50, metadata !49, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!159 = metadata !{i32 27, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !50, metadata !158, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!161 = metadata !{i32 29, i32 0, metadata !49, null}
!162 = metadata !{i32 16, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !62, metadata !61, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!164 = metadata !{i32 17, i32 0, metadata !163, null}
!165 = metadata !{i32 19, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !62, metadata !61, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!167 = metadata !{i32 22, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !62, metadata !166, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!169 = metadata !{i32 25, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !62, metadata !168, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!171 = metadata !{i32 26, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !62, metadata !170, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!173 = metadata !{i32 27, i32 0, metadata !172, null}
!174 = metadata !{i32 28, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !62, metadata !170, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!176 = metadata !{i32 29, i32 0, metadata !175, null}
!177 = metadata !{i32 32, i32 0, metadata !168, null}
!178 = metadata !{i32 34, i32 0, metadata !61, null}
!179 = metadata !{i32 16, i32 0, metadata !74, null}
!180 = metadata !{i32 17, i32 0, metadata !74, null}
!181 = metadata !{metadata !181, metadata !182, metadata !183}
!182 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!183 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!184 = metadata !{metadata !155, metadata !155, i64 0}
!185 = metadata !{metadata !185, metadata !182, metadata !183}
!186 = metadata !{i32 18, i32 0, metadata !74, null}
!187 = metadata !{i32 16, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !95, metadata !94, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!189 = metadata !{i32 19, i32 0, metadata !190, null}
!190 = metadata !{i32 786443, metadata !95, metadata !94, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!191 = metadata !{i32 20, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !95, metadata !190, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!193 = metadata !{metadata !193, metadata !182, metadata !183}
!194 = metadata !{metadata !194, metadata !182, metadata !183}
!195 = metadata !{i32 22, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !95, metadata !190, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!197 = metadata !{i32 24, i32 0, metadata !196, null}
!198 = metadata !{i32 23, i32 0, metadata !196, null}
!199 = metadata !{metadata !199, metadata !182, metadata !183}
!200 = metadata !{metadata !200, metadata !182, metadata !183}
!201 = metadata !{i32 28, i32 0, metadata !94, null}
!202 = metadata !{i32 15, i32 0, metadata !109, null}
!203 = metadata !{i32 16, i32 0, metadata !109, null}
!204 = metadata !{metadata !204, metadata !182, metadata !183}
!205 = metadata !{metadata !205, metadata !182, metadata !183}
!206 = metadata !{i32 17, i32 0, metadata !109, null}
!207 = metadata !{i32 13, i32 0, metadata !124, null}
!208 = metadata !{i32 14, i32 0, metadata !124, null}
!209 = metadata !{i32 15, i32 0, metadata !124, null}
