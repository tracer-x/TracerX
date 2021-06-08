; ModuleID = '/home/sanghu/TracerX/tracerx/test/Feature/Output/FunctionPointer.c.tmp1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"foo: %s\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"baz: %s\0A\00", align 1
@xx = global void (i8*)* @foo, align 8
@.str2 = private unnamed_addr constant [15 x i8] c"called via bar\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"going to call through fp\0A\00", align 1
@.str4 = private unnamed_addr constant [14 x i8] c"called via fp\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"calling via pass through\0A\00", align 1
@.str6 = private unnamed_addr constant [14 x i8] c"called via xx\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str18 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str29 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str310 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str611 = private unnamed_addr constant [13 x i8] c"klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define void @foo(i8* %msg) #0 {
  %1 = alloca i8*, align 8
  store i8* %msg, i8** %1, align 8
  %2 = load i8** %1, align 8, !dbg !139
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i8* %2), !dbg !139
  ret void, !dbg !139
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @baz(i8* %msg) #0 {
  %1 = alloca i8*, align 8
  store i8* %msg, i8** %1, align 8
  %2 = load i8** %1, align 8, !dbg !140
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i8* %2), !dbg !140
  ret void, !dbg !140
}

; Function Attrs: nounwind uwtable
define void @bar(void (i8*)* %fp) #0 {
  %1 = alloca void (i8*)*, align 8
  store void (i8*)* %fp, void (i8*)** %1, align 8
  %2 = load void (i8*)** %1, align 8, !dbg !141
  call void %2(i8* getelementptr inbounds ([15 x i8]* @.str2, i32 0, i32 0)), !dbg !141
  ret void, !dbg !141
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %fp = alloca void (i8*)*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store void (i8*)* @foo, void (i8*)** %fp, align 8, !dbg !142
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0)), !dbg !143
  %5 = load void (i8*)** %fp, align 8, !dbg !144
  call void %5(i8* getelementptr inbounds ([14 x i8]* @.str4, i32 0, i32 0)), !dbg !144
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i32 0, i32 0)), !dbg !145
  call void @bar(void (i8*)* @foo), !dbg !146
  store void (i8*)* @baz, void (i8*)** %fp, align 8, !dbg !147
  %7 = load void (i8*)** %fp, align 8, !dbg !148
  call void %7(i8* getelementptr inbounds ([14 x i8]* @.str4, i32 0, i32 0)), !dbg !148
  %8 = load void (i8*)** @xx, align 8, !dbg !149
  call void %8(i8* getelementptr inbounds ([14 x i8]* @.str6, i32 0, i32 0)), !dbg !149
  ret i32 0, !dbg !150
}

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #3 {
  %1 = icmp eq i64 %z, 0, !dbg !151
  br i1 %1, label %2, label %3, !dbg !151

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str18, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str29, i64 0, i64 0)) #6, !dbg !153
  unreachable, !dbg !153

; <label>:3                                       ; preds = %0
  ret void, !dbg !154
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !155
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #7, !dbg !155
  %2 = load i32* %x, align 4, !dbg !156, !tbaa !157
  ret i32 %2, !dbg !156
}

declare void @klee_make_symbolic(i8*, i64, i8*) #5

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #3 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !161
  br i1 %1, label %3, label %2, !dbg !161

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str310, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #6, !dbg !163
  unreachable, !dbg !163

; <label>:3                                       ; preds = %0
  ret void, !dbg !165
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !166
  br i1 %1, label %3, label %2, !dbg !166

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str611, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #6, !dbg !168
  unreachable, !dbg !168

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !169
  %5 = icmp eq i32 %4, %end, !dbg !169
  br i1 %5, label %21, label %6, !dbg !169

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !171
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #7, !dbg !171
  %8 = icmp eq i32 %start, 0, !dbg !173
  %9 = load i32* %x, align 4, !dbg !175, !tbaa !157
  br i1 %8, label %10, label %13, !dbg !173

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !175
  %12 = zext i1 %11 to i64, !dbg !175
  call void @klee_assume(i64 %12) #7, !dbg !175
  br label %19, !dbg !177

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !178
  %15 = zext i1 %14 to i64, !dbg !178
  call void @klee_assume(i64 %15) #7, !dbg !178
  %16 = load i32* %x, align 4, !dbg !180, !tbaa !157
  %17 = icmp slt i32 %16, %end, !dbg !180
  %18 = zext i1 %17 to i64, !dbg !180
  call void @klee_assume(i64 %18) #7, !dbg !180
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !181, !tbaa !157
  br label %21, !dbg !181

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !182
}

declare void @klee_assume(i64) #5

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0, !dbg !183
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !183

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !184
  %wide.load = load <16 x i8>* %3, align 1, !dbg !184
  %next.gep.sum279 = or i64 %index, 16, !dbg !184
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !184
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !184
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !184
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !184
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !184
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum279, !dbg !184
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !184
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !184
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !185

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
  %10 = add i64 %.01, -1, !dbg !183
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !184
  %12 = load i8* %src.03, align 1, !dbg !184, !tbaa !188
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !184
  store i8 %12, i8* %dest.02, align 1, !dbg !184, !tbaa !188
  %14 = icmp eq i64 %10, 0, !dbg !183
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !183, !llvm.loop !189

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !190
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #3 {
  %1 = icmp eq i8* %src, %dst, !dbg !191
  br i1 %1, label %.loopexit, label %2, !dbg !191

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !193
  br i1 %3, label %.preheader, label %18, !dbg !193

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !195
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !195

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
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !195
  %wide.load = load <16 x i8>* %6, align 1, !dbg !195
  %next.gep.sum586 = or i64 %index, 16, !dbg !195
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !195
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !195
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !195
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !195
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !195
  %10 = getelementptr i8* %dst, i64 %next.gep.sum586, !dbg !195
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !195
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !195
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !197

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
  %13 = add i64 %.02, -1, !dbg !195
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !195
  %15 = load i8* %b.04, align 1, !dbg !195, !tbaa !188
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !195
  store i8 %15, i8* %a.03, align 1, !dbg !195, !tbaa !188
  %17 = icmp eq i64 %13, 0, !dbg !195
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !195, !llvm.loop !198

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !199
  %20 = icmp eq i64 %count, 0, !dbg !201
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !201

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !202
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !199
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
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !201
  %23 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !201
  %24 = bitcast i8* %23 to <16 x i8>*, !dbg !201
  %wide.load434 = load <16 x i8>* %24, align 1, !dbg !201
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !201
  %.sum505 = add i64 %.sum440, -31, !dbg !201
  %25 = getelementptr i8* %src, i64 %.sum505, !dbg !201
  %26 = bitcast i8* %25 to <16 x i8>*, !dbg !201
  %wide.load435 = load <16 x i8>* %26, align 1, !dbg !201
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !201
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !201
  %27 = getelementptr i8* %dst, i64 %next.gep236.sum, !dbg !201
  %28 = bitcast i8* %27 to <16 x i8>*, !dbg !201
  store <16 x i8> %reverse437, <16 x i8>* %28, align 1, !dbg !201
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !201
  %29 = getelementptr i8* %dst, i64 %.sum505, !dbg !201
  %30 = bitcast i8* %29 to <16 x i8>*, !dbg !201
  store <16 x i8> %reverse438, <16 x i8>* %30, align 1, !dbg !201
  %index.next234 = add i64 %index212, 32
  %31 = icmp eq i64 %index.next234, %n.vec215
  br i1 %31, label %middle.block210, label %vector.body209, !llvm.loop !203

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
  %32 = add i64 %.16, -1, !dbg !201
  %33 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !201
  %34 = load i8* %b.18, align 1, !dbg !201, !tbaa !188
  %35 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !201
  store i8 %34, i8* %a.17, align 1, !dbg !201, !tbaa !188
  %36 = icmp eq i64 %32, 0, !dbg !201
  br i1 %36, label %.loopexit, label %scalar.ph211, !dbg !201, !llvm.loop !204

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !205
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0, !dbg !206
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !206

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !207
  %wide.load = load <16 x i8>* %3, align 1, !dbg !207
  %next.gep.sum280 = or i64 %index, 16, !dbg !207
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !207
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !207
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !207
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !207
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !207
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum280, !dbg !207
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !207
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !207
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !208

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
  %10 = add i64 %.01, -1, !dbg !206
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !207
  %12 = load i8* %src.03, align 1, !dbg !207, !tbaa !188
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !207
  store i8 %12, i8* %dest.02, align 1, !dbg !207, !tbaa !188
  %14 = icmp eq i64 %10, 0, !dbg !206
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !206, !llvm.loop !209

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !206

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !210
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #3 {
  %1 = icmp eq i64 %count, 0, !dbg !211
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !211

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !212
  br label %3, !dbg !211

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !211
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !212
  store volatile i8 %2, i8* %a.02, align 1, !dbg !212, !tbaa !188
  %6 = icmp eq i64 %4, 0, !dbg !211
  br i1 %6, label %._crit_edge, label %3, !dbg !211

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !213
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin noreturn nounwind }
attributes #7 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0, !24, !35, !46, !58, !71, !90, !105, !120}
!llvm.module.flags = !{!136, !137}
!llvm.ident = !{!138, !138, !138, !138, !138, !138, !138, !138, !138}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !22, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/test/Feature/FunctionPointer.c", metadata !"/home/sanghu/TracerX/tracerx/test/Feature"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !11, metadata !12, metadata !16}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"foo", metadata !"foo", metadata !"", i32 7, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @foo, null, null, metadata !2, i32 7} ; [ DW_TAG_subprogram ] 
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/FunctionPointer.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!10 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!11 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"baz", metadata !"baz", metadata !"", i32 8, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8*)* @baz, null, null, metadata !2, i32 8} ; [ DW_TAG_subprogram ]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"bar", metadata !"bar", metadata !"", i32 12, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (void (i8*)*)* @bar, null, null, metadata !2, i32 12} ; [ DW_TAG_s
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{null, metadata !15}
!15 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 14, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 14} ; [ DW_TAG_s
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !19, metadata !20}
!19 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!20 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!22 = metadata !{metadata !23}
!23 = metadata !{i32 786484, i32 0, null, metadata !"xx", metadata !"xx", metadata !"", metadata !5, i32 10, metadata !15, i32 0, i32 1, void (i8*)** @xx, null} ; [ DW_TAG_variable ] [xx] [line 10] [def]
!24 = metadata !{i32 786449, metadata !25, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !26, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!25 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 786478, metadata !28, metadata !29, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!28 = metadata !{metadata !"klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!29 = metadata !{i32 786473, metadata !28}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!30 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = metadata !{null, metadata !32}
!32 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!33 = metadata !{metadata !34}
!34 = metadata !{i32 786689, metadata !27, metadata !"z", metadata !29, i32 16777228, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!35 = metadata !{i32 786449, metadata !36, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !37, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!36 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!37 = metadata !{metadata !38}
!38 = metadata !{i32 786478, metadata !39, metadata !40, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !41, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !43, i32 13} ; [ 
!39 = metadata !{metadata !"klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!40 = metadata !{i32 786473, metadata !39}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c]
!41 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !42, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!42 = metadata !{metadata !19, metadata !8}
!43 = metadata !{metadata !44, metadata !45}
!44 = metadata !{i32 786689, metadata !38, metadata !"name", metadata !40, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!45 = metadata !{i32 786688, metadata !38, metadata !"x", metadata !40, i32 14, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
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
!65 = metadata !{metadata !19, metadata !19, metadata !19, metadata !8}
!66 = metadata !{metadata !67, metadata !68, metadata !69, metadata !70}
!67 = metadata !{i32 786689, metadata !61, metadata !"start", metadata !63, i32 16777229, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!68 = metadata !{i32 786689, metadata !61, metadata !"end", metadata !63, i32 33554445, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!69 = metadata !{i32 786689, metadata !61, metadata !"name", metadata !63, i32 50331661, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!70 = metadata !{i32 786688, metadata !61, metadata !"x", metadata !63, i32 14, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
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
!84 = metadata !{metadata !85, metadata !86, metadata !87, metadata !88, metadata !89}
!85 = metadata !{i32 786689, metadata !74, metadata !"destaddr", metadata !76, i32 16777228, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!86 = metadata !{i32 786689, metadata !74, metadata !"srcaddr", metadata !76, i32 33554444, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!87 = metadata !{i32 786689, metadata !74, metadata !"len", metadata !76, i32 50331660, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!88 = metadata !{i32 786688, metadata !74, metadata !"dest", metadata !76, i32 13, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!89 = metadata !{i32 786688, metadata !74, metadata !"src", metadata !76, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!90 = metadata !{i32 786449, metadata !91, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !92, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!91 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!92 = metadata !{metadata !93}
!93 = metadata !{i32 786478, metadata !94, metadata !95, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !96, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !99, i32 1
!94 = metadata !{metadata !"memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!95 = metadata !{i32 786473, metadata !94}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!96 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !97, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!97 = metadata !{metadata !79, metadata !79, metadata !80, metadata !98}
!98 = metadata !{i32 786454, metadata !94, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!99 = metadata !{metadata !100, metadata !101, metadata !102, metadata !103, metadata !104}
!100 = metadata !{i32 786689, metadata !93, metadata !"dst", metadata !95, i32 16777228, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!101 = metadata !{i32 786689, metadata !93, metadata !"src", metadata !95, i32 33554444, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!102 = metadata !{i32 786689, metadata !93, metadata !"count", metadata !95, i32 50331660, metadata !98, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!103 = metadata !{i32 786688, metadata !93, metadata !"a", metadata !95, i32 13, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!104 = metadata !{i32 786688, metadata !93, metadata !"b", metadata !95, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!105 = metadata !{i32 786449, metadata !106, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !107, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!106 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!107 = metadata !{metadata !108}
!108 = metadata !{i32 786478, metadata !109, metadata !110, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !111, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !114, 
!109 = metadata !{metadata !"mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!110 = metadata !{i32 786473, metadata !109}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c]
!111 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !112, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!112 = metadata !{metadata !79, metadata !79, metadata !80, metadata !113}
!113 = metadata !{i32 786454, metadata !109, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!114 = metadata !{metadata !115, metadata !116, metadata !117, metadata !118, metadata !119}
!115 = metadata !{i32 786689, metadata !108, metadata !"destaddr", metadata !110, i32 16777227, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!116 = metadata !{i32 786689, metadata !108, metadata !"srcaddr", metadata !110, i32 33554443, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!117 = metadata !{i32 786689, metadata !108, metadata !"len", metadata !110, i32 50331659, metadata !113, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!118 = metadata !{i32 786688, metadata !108, metadata !"dest", metadata !110, i32 12, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!119 = metadata !{i32 786688, metadata !108, metadata !"src", metadata !110, i32 13, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!120 = metadata !{i32 786449, metadata !121, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !122, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!121 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!122 = metadata !{metadata !123}
!123 = metadata !{i32 786478, metadata !124, metadata !125, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !126, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !129, i32
!124 = metadata !{metadata !"memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!125 = metadata !{i32 786473, metadata !124}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c]
!126 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !127, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!127 = metadata !{metadata !79, metadata !79, metadata !19, metadata !128}
!128 = metadata !{i32 786454, metadata !124, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!129 = metadata !{metadata !130, metadata !131, metadata !132, metadata !133}
!130 = metadata !{i32 786689, metadata !123, metadata !"dst", metadata !125, i32 16777227, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!131 = metadata !{i32 786689, metadata !123, metadata !"s", metadata !125, i32 33554443, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!132 = metadata !{i32 786689, metadata !123, metadata !"count", metadata !125, i32 50331659, metadata !128, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!133 = metadata !{i32 786688, metadata !123, metadata !"a", metadata !125, i32 12, metadata !134, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!134 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !135} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!135 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!136 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!137 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!138 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!139 = metadata !{i32 7, i32 0, metadata !4, null}
!140 = metadata !{i32 8, i32 0, metadata !11, null} ; [ DW_TAG_imported_declaration ]
!141 = metadata !{i32 12, i32 0, metadata !12, null}
!142 = metadata !{i32 15, i32 0, metadata !16, null}
!143 = metadata !{i32 17, i32 0, metadata !16, null}
!144 = metadata !{i32 18, i32 0, metadata !16, null}
!145 = metadata !{i32 20, i32 0, metadata !16, null}
!146 = metadata !{i32 21, i32 0, metadata !16, null}
!147 = metadata !{i32 23, i32 0, metadata !16, null}
!148 = metadata !{i32 24, i32 0, metadata !16, null}
!149 = metadata !{i32 26, i32 0, metadata !16, null}
!150 = metadata !{i32 36, i32 0, metadata !16, null}
!151 = metadata !{i32 13, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !28, metadata !27, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!153 = metadata !{i32 14, i32 0, metadata !152, null}
!154 = metadata !{i32 15, i32 0, metadata !27, null}
!155 = metadata !{i32 15, i32 0, metadata !38, null}
!156 = metadata !{i32 16, i32 0, metadata !38, null}
!157 = metadata !{metadata !158, metadata !158, i64 0}
!158 = metadata !{metadata !"int", metadata !159, i64 0}
!159 = metadata !{metadata !"omnipotent char", metadata !160, i64 0}
!160 = metadata !{metadata !"Simple C/C++ TBAA"}
!161 = metadata !{i32 21, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !50, metadata !49, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!163 = metadata !{i32 27, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !50, metadata !162, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!165 = metadata !{i32 29, i32 0, metadata !49, null}
!166 = metadata !{i32 16, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !62, metadata !61, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!168 = metadata !{i32 17, i32 0, metadata !167, null}
!169 = metadata !{i32 19, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !62, metadata !61, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!171 = metadata !{i32 22, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !62, metadata !170, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!173 = metadata !{i32 25, i32 0, metadata !174, null}
!174 = metadata !{i32 786443, metadata !62, metadata !172, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!175 = metadata !{i32 26, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !62, metadata !174, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!177 = metadata !{i32 27, i32 0, metadata !176, null}
!178 = metadata !{i32 28, i32 0, metadata !179, null}
!179 = metadata !{i32 786443, metadata !62, metadata !174, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!180 = metadata !{i32 29, i32 0, metadata !179, null}
!181 = metadata !{i32 32, i32 0, metadata !172, null}
!182 = metadata !{i32 34, i32 0, metadata !61, null}
!183 = metadata !{i32 16, i32 0, metadata !74, null}
!184 = metadata !{i32 17, i32 0, metadata !74, null}
!185 = metadata !{metadata !185, metadata !186, metadata !187}
!186 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!187 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!188 = metadata !{metadata !159, metadata !159, i64 0}
!189 = metadata !{metadata !189, metadata !186, metadata !187}
!190 = metadata !{i32 18, i32 0, metadata !74, null}
!191 = metadata !{i32 16, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !94, metadata !93, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!193 = metadata !{i32 19, i32 0, metadata !194, null}
!194 = metadata !{i32 786443, metadata !94, metadata !93, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!195 = metadata !{i32 20, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !94, metadata !194, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!197 = metadata !{metadata !197, metadata !186, metadata !187}
!198 = metadata !{metadata !198, metadata !186, metadata !187}
!199 = metadata !{i32 22, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !94, metadata !194, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!201 = metadata !{i32 24, i32 0, metadata !200, null}
!202 = metadata !{i32 23, i32 0, metadata !200, null}
!203 = metadata !{metadata !203, metadata !186, metadata !187}
!204 = metadata !{metadata !204, metadata !186, metadata !187}
!205 = metadata !{i32 28, i32 0, metadata !93, null}
!206 = metadata !{i32 15, i32 0, metadata !108, null}
!207 = metadata !{i32 16, i32 0, metadata !108, null}
!208 = metadata !{metadata !208, metadata !186, metadata !187}
!209 = metadata !{metadata !209, metadata !186, metadata !187}
!210 = metadata !{i32 17, i32 0, metadata !108, null}
!211 = metadata !{i32 13, i32 0, metadata !123, null}
!212 = metadata !{i32 14, i32 0, metadata !123, null}
!213 = metadata !{i32 15, i32 0, metadata !123, null}
