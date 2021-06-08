; ModuleID = '/home/sanghu/TracerX/tracerx/test/Intrinsics/Output/objectsize.ll.tmp.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
define i32 @main() #0 {
entry:
  %a = alloca i8*, align 8
  %0 = load i8** %a, align 8
  %cmp = icmp ne i64 0, 0
  br i1 %cmp, label %abort.block, label %continue.block

continue.block:                                   ; preds = %entry
  %1 = load i8** %a, align 8
  %cmp1 = icmp ne i64 -1, -1
  br i1 %cmp1, label %abort.block, label %exit.block

exit.block:                                       ; preds = %continue.block
  ret i32 0

abort.block:                                      ; preds = %continue.block, %entry
  call void @abort()
  unreachable
}

; Function Attrs: nounwind readnone
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #3 {
  %1 = icmp eq i64 %z, 0, !dbg !121
  br i1 %1, label %2, label %3, !dbg !121

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0)) #6, !dbg !123
  unreachable, !dbg !123

; <label>:3                                       ; preds = %0
  ret void, !dbg !124
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !125
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #7, !dbg !125
  %2 = load i32* %x, align 4, !dbg !126, !tbaa !127
  ret i32 %2, !dbg !126
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare void @klee_make_symbolic(i8*, i64, i8*) #5

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #3 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !131
  br i1 %1, label %3, label %2, !dbg !131

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str3, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #6, !dbg !133
  unreachable, !dbg !133

; <label>:3                                       ; preds = %0
  ret void, !dbg !135
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #3 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !136
  br i1 %1, label %3, label %2, !dbg !136

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #6, !dbg !138
  unreachable, !dbg !138

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !139
  %5 = icmp eq i32 %4, %end, !dbg !139
  br i1 %5, label %21, label %6, !dbg !139

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !141
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #7, !dbg !141
  %8 = icmp eq i32 %start, 0, !dbg !143
  %9 = load i32* %x, align 4, !dbg !145, !tbaa !127
  br i1 %8, label %10, label %13, !dbg !143

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !145
  %12 = zext i1 %11 to i64, !dbg !145
  call void @klee_assume(i64 %12) #7, !dbg !145
  br label %19, !dbg !147

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !148
  %15 = zext i1 %14 to i64, !dbg !148
  call void @klee_assume(i64 %15) #7, !dbg !148
  %16 = load i32* %x, align 4, !dbg !150, !tbaa !127
  %17 = icmp slt i32 %16, %end, !dbg !150
  %18 = zext i1 %17 to i64, !dbg !150
  call void @klee_assume(i64 %18) #7, !dbg !150
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !151, !tbaa !127
  br label %21, !dbg !151

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !152
}

declare void @klee_assume(i64) #5

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0, !dbg !153
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !153

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !154
  %wide.load = load <16 x i8>* %3, align 1, !dbg !154
  %next.gep.sum279 = or i64 %index, 16, !dbg !154
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !154
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !154
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !154
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !154
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !154
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum279, !dbg !154
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !154
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !154
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !155

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
  %10 = add i64 %.01, -1, !dbg !153
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !154
  %12 = load i8* %src.03, align 1, !dbg !154, !tbaa !158
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !154
  store i8 %12, i8* %dest.02, align 1, !dbg !154, !tbaa !158
  %14 = icmp eq i64 %10, 0, !dbg !153
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !153, !llvm.loop !159

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !160
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #3 {
  %1 = icmp eq i8* %src, %dst, !dbg !161
  br i1 %1, label %.loopexit, label %2, !dbg !161

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !163
  br i1 %3, label %.preheader, label %18, !dbg !163

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !165
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !165

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
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !165
  %wide.load = load <16 x i8>* %6, align 1, !dbg !165
  %next.gep.sum586 = or i64 %index, 16, !dbg !165
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !165
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !165
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !165
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !165
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !165
  %10 = getelementptr i8* %dst, i64 %next.gep.sum586, !dbg !165
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !165
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !165
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !167

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
  %13 = add i64 %.02, -1, !dbg !165
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !165
  %15 = load i8* %b.04, align 1, !dbg !165, !tbaa !158
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !165
  store i8 %15, i8* %a.03, align 1, !dbg !165, !tbaa !158
  %17 = icmp eq i64 %13, 0, !dbg !165
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !165, !llvm.loop !168

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !169
  %20 = icmp eq i64 %count, 0, !dbg !171
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !171

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !172
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !169
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
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !171
  %23 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !171
  %24 = bitcast i8* %23 to <16 x i8>*, !dbg !171
  %wide.load434 = load <16 x i8>* %24, align 1, !dbg !171
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !171
  %.sum505 = add i64 %.sum440, -31, !dbg !171
  %25 = getelementptr i8* %src, i64 %.sum505, !dbg !171
  %26 = bitcast i8* %25 to <16 x i8>*, !dbg !171
  %wide.load435 = load <16 x i8>* %26, align 1, !dbg !171
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !171
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !171
  %27 = getelementptr i8* %dst, i64 %next.gep236.sum, !dbg !171
  %28 = bitcast i8* %27 to <16 x i8>*, !dbg !171
  store <16 x i8> %reverse437, <16 x i8>* %28, align 1, !dbg !171
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !171
  %29 = getelementptr i8* %dst, i64 %.sum505, !dbg !171
  %30 = bitcast i8* %29 to <16 x i8>*, !dbg !171
  store <16 x i8> %reverse438, <16 x i8>* %30, align 1, !dbg !171
  %index.next234 = add i64 %index212, 32
  %31 = icmp eq i64 %index.next234, %n.vec215
  br i1 %31, label %middle.block210, label %vector.body209, !llvm.loop !173

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
  %32 = add i64 %.16, -1, !dbg !171
  %33 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !171
  %34 = load i8* %b.18, align 1, !dbg !171, !tbaa !158
  %35 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !171
  store i8 %34, i8* %a.17, align 1, !dbg !171, !tbaa !158
  %36 = icmp eq i64 %32, 0, !dbg !171
  br i1 %36, label %.loopexit, label %scalar.ph211, !dbg !171, !llvm.loop !174

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !175
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #3 {
  %1 = icmp eq i64 %len, 0, !dbg !176
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !176

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !177
  %wide.load = load <16 x i8>* %3, align 1, !dbg !177
  %next.gep.sum280 = or i64 %index, 16, !dbg !177
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !177
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !177
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !177
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !177
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !177
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum280, !dbg !177
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !177
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !177
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !178

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
  %10 = add i64 %.01, -1, !dbg !176
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !177
  %12 = load i8* %src.03, align 1, !dbg !177, !tbaa !158
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !177
  store i8 %12, i8* %dest.02, align 1, !dbg !177, !tbaa !158
  %14 = icmp eq i64 %10, 0, !dbg !176
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !176, !llvm.loop !179

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !176

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !180
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #3 {
  %1 = icmp eq i64 %count, 0, !dbg !181
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !181

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !182
  br label %3, !dbg !181

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !181
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !182
  store volatile i8 %2, i8* %a.02, align 1, !dbg !182, !tbaa !158
  %6 = icmp eq i64 %4, 0, !dbg !181
  br i1 %6, label %._crit_edge, label %3, !dbg !181

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !183
}

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind readnone }
attributes #2 = { noreturn nounwind }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin noreturn nounwind }
attributes #7 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0, !12, !27, !39, !52, !72, !87, !102}
!llvm.ident = !{!118, !118, !118, !118, !118, !118, !118, !118}
!llvm.module.flags = !{!119, !120}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sa
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null, nu
!5 = metadata !{metadata !"klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!10 = metadata !{metadata !11}
!11 = metadata !{i32 786689, metadata !4, metadata !"z", metadata !6, i32 16777228, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!12 = metadata !{i32 786449, metadata !13, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !14, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!13 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786478, metadata !16, metadata !17, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !24, i32 13} ; [ 
!16 = metadata !{metadata !"klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!17 = metadata !{i32 786473, metadata !16}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c]
!18 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = metadata !{metadata !20, metadata !21}
!20 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!21 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!22 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!23 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!24 = metadata !{metadata !25, metadata !26}
!25 = metadata !{i32 786689, metadata !15, metadata !"name", metadata !17, i32 16777229, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!26 = metadata !{i32 786688, metadata !15, metadata !"x", metadata !17, i32 14, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!27 = metadata !{i32 786449, metadata !28, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !29, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!28 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 786478, metadata !31, metadata !32, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !33, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!31 = metadata !{metadata !"klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!32 = metadata !{i32 786473, metadata !31}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!33 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = metadata !{null, metadata !35, metadata !35}
!35 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!36 = metadata !{metadata !37, metadata !38}
!37 = metadata !{i32 786689, metadata !30, metadata !"bitWidth", metadata !32, i32 16777236, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!38 = metadata !{i32 786689, metadata !30, metadata !"shift", metadata !32, i32 33554452, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!39 = metadata !{i32 786449, metadata !40, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !41, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!40 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 786478, metadata !43, metadata !44, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !45, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!43 = metadata !{metadata !"klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!44 = metadata !{i32 786473, metadata !43}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!45 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !46, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = metadata !{metadata !20, metadata !20, metadata !20, metadata !21}
!47 = metadata !{metadata !48, metadata !49, metadata !50, metadata !51}
!48 = metadata !{i32 786689, metadata !42, metadata !"start", metadata !44, i32 16777229, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!49 = metadata !{i32 786689, metadata !42, metadata !"end", metadata !44, i32 33554445, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!50 = metadata !{i32 786689, metadata !42, metadata !"name", metadata !44, i32 50331661, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!51 = metadata !{i32 786688, metadata !42, metadata !"x", metadata !44, i32 14, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!52 = metadata !{i32 786449, metadata !53, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !54, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!53 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!54 = metadata !{metadata !55}
!55 = metadata !{i32 786478, metadata !56, metadata !57, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !58, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !65, i32 12} 
!56 = metadata !{metadata !"memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!57 = metadata !{i32 786473, metadata !56}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c]
!58 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = metadata !{metadata !60, metadata !60, metadata !61, metadata !63}
!60 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!61 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !62} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!62 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = metadata !{i32 786454, metadata !56, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!64 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!65 = metadata !{metadata !66, metadata !67, metadata !68, metadata !69, metadata !71}
!66 = metadata !{i32 786689, metadata !55, metadata !"destaddr", metadata !57, i32 16777228, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!67 = metadata !{i32 786689, metadata !55, metadata !"srcaddr", metadata !57, i32 33554444, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!68 = metadata !{i32 786689, metadata !55, metadata !"len", metadata !57, i32 50331660, metadata !63, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!69 = metadata !{i32 786688, metadata !55, metadata !"dest", metadata !57, i32 13, metadata !70, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!70 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!71 = metadata !{i32 786688, metadata !55, metadata !"src", metadata !57, i32 14, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!72 = metadata !{i32 786449, metadata !73, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !74, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!73 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!74 = metadata !{metadata !75}
!75 = metadata !{i32 786478, metadata !76, metadata !77, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !78, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !81, i32 1
!76 = metadata !{metadata !"memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!77 = metadata !{i32 786473, metadata !76}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!78 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !79, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!79 = metadata !{metadata !60, metadata !60, metadata !61, metadata !80}
!80 = metadata !{i32 786454, metadata !76, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!81 = metadata !{metadata !82, metadata !83, metadata !84, metadata !85, metadata !86}
!82 = metadata !{i32 786689, metadata !75, metadata !"dst", metadata !77, i32 16777228, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!83 = metadata !{i32 786689, metadata !75, metadata !"src", metadata !77, i32 33554444, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!84 = metadata !{i32 786689, metadata !75, metadata !"count", metadata !77, i32 50331660, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!85 = metadata !{i32 786688, metadata !75, metadata !"a", metadata !77, i32 13, metadata !70, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!86 = metadata !{i32 786688, metadata !75, metadata !"b", metadata !77, i32 14, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!87 = metadata !{i32 786449, metadata !88, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !89, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!88 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!89 = metadata !{metadata !90}
!90 = metadata !{i32 786478, metadata !91, metadata !92, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !93, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !96, i32 1
!91 = metadata !{metadata !"mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!92 = metadata !{i32 786473, metadata !91}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c]
!93 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !94, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = metadata !{metadata !60, metadata !60, metadata !61, metadata !95}
!95 = metadata !{i32 786454, metadata !91, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!96 = metadata !{metadata !97, metadata !98, metadata !99, metadata !100, metadata !101}
!97 = metadata !{i32 786689, metadata !90, metadata !"destaddr", metadata !92, i32 16777227, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!98 = metadata !{i32 786689, metadata !90, metadata !"srcaddr", metadata !92, i32 33554443, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!99 = metadata !{i32 786689, metadata !90, metadata !"len", metadata !92, i32 50331659, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!100 = metadata !{i32 786688, metadata !90, metadata !"dest", metadata !92, i32 12, metadata !70, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!101 = metadata !{i32 786688, metadata !90, metadata !"src", metadata !92, i32 13, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!102 = metadata !{i32 786449, metadata !103, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !104, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!103 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!104 = metadata !{metadata !105}
!105 = metadata !{i32 786478, metadata !106, metadata !107, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !108, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !111, i32
!106 = metadata !{metadata !"memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!107 = metadata !{i32 786473, metadata !106}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c]
!108 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !109, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!109 = metadata !{metadata !60, metadata !60, metadata !20, metadata !110}
!110 = metadata !{i32 786454, metadata !106, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!111 = metadata !{metadata !112, metadata !113, metadata !114, metadata !115}
!112 = metadata !{i32 786689, metadata !105, metadata !"dst", metadata !107, i32 16777227, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!113 = metadata !{i32 786689, metadata !105, metadata !"s", metadata !107, i32 33554443, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!114 = metadata !{i32 786689, metadata !105, metadata !"count", metadata !107, i32 50331659, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!115 = metadata !{i32 786688, metadata !105, metadata !"a", metadata !107, i32 12, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!116 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !117} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!117 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!118 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!119 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!120 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!121 = metadata !{i32 13, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !5, metadata !4, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!123 = metadata !{i32 14, i32 0, metadata !122, null}
!124 = metadata !{i32 15, i32 0, metadata !4, null}
!125 = metadata !{i32 15, i32 0, metadata !15, null}
!126 = metadata !{i32 16, i32 0, metadata !15, null}
!127 = metadata !{metadata !128, metadata !128, i64 0}
!128 = metadata !{metadata !"int", metadata !129, i64 0}
!129 = metadata !{metadata !"omnipotent char", metadata !130, i64 0}
!130 = metadata !{metadata !"Simple C/C++ TBAA"}
!131 = metadata !{i32 21, i32 0, metadata !132, null}
!132 = metadata !{i32 786443, metadata !31, metadata !30, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!133 = metadata !{i32 27, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !31, metadata !132, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!135 = metadata !{i32 29, i32 0, metadata !30, null}
!136 = metadata !{i32 16, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !43, metadata !42, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!138 = metadata !{i32 17, i32 0, metadata !137, null}
!139 = metadata !{i32 19, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !43, metadata !42, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!141 = metadata !{i32 22, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !43, metadata !140, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!143 = metadata !{i32 25, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !43, metadata !142, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!145 = metadata !{i32 26, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !43, metadata !144, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!147 = metadata !{i32 27, i32 0, metadata !146, null}
!148 = metadata !{i32 28, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !43, metadata !144, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!150 = metadata !{i32 29, i32 0, metadata !149, null}
!151 = metadata !{i32 32, i32 0, metadata !142, null}
!152 = metadata !{i32 34, i32 0, metadata !42, null}
!153 = metadata !{i32 16, i32 0, metadata !55, null}
!154 = metadata !{i32 17, i32 0, metadata !55, null}
!155 = metadata !{metadata !155, metadata !156, metadata !157}
!156 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!157 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!158 = metadata !{metadata !129, metadata !129, i64 0}
!159 = metadata !{metadata !159, metadata !156, metadata !157}
!160 = metadata !{i32 18, i32 0, metadata !55, null}
!161 = metadata !{i32 16, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !76, metadata !75, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!163 = metadata !{i32 19, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !76, metadata !75, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!165 = metadata !{i32 20, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !76, metadata !164, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!167 = metadata !{metadata !167, metadata !156, metadata !157}
!168 = metadata !{metadata !168, metadata !156, metadata !157}
!169 = metadata !{i32 22, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !76, metadata !164, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!171 = metadata !{i32 24, i32 0, metadata !170, null}
!172 = metadata !{i32 23, i32 0, metadata !170, null}
!173 = metadata !{metadata !173, metadata !156, metadata !157}
!174 = metadata !{metadata !174, metadata !156, metadata !157}
!175 = metadata !{i32 28, i32 0, metadata !75, null}
!176 = metadata !{i32 15, i32 0, metadata !90, null}
!177 = metadata !{i32 16, i32 0, metadata !90, null}
!178 = metadata !{metadata !178, metadata !156, metadata !157}
!179 = metadata !{metadata !179, metadata !156, metadata !157}
!180 = metadata !{i32 17, i32 0, metadata !90, null}
!181 = metadata !{i32 13, i32 0, metadata !105, null}
!182 = metadata !{i32 14, i32 0, metadata !105, null}
!183 = metadata !{i32 15, i32 0, metadata !105, null}
