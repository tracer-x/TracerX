; ModuleID = '/home/sanghu/TracerX/tracerx/test/Feature/Output/SilentKleeAssume.c.tmp.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str3 = private unnamed_addr constant [61 x i8] c"/home/sanghu/TracerX/tracerx/test/Feature/SilentKleeAssume.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str15 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str26 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str37 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c"klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 (i8*, ...)* bitcast (i32 (i8*)* @klee_int to i32 (i8*, ...)*)(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !128
  store i32 %2, i32* %x, align 4, !dbg !128
  %3 = call i32 (i8*, ...)* bitcast (i32 (i8*)* @klee_int to i32 (i8*, ...)*)(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !dbg !129
  store i32 %3, i32* %y, align 4, !dbg !129
  %4 = load i32* %x, align 4, !dbg !130
  %5 = icmp sgt i32 %4, 10, !dbg !130
  %6 = zext i1 %5 to i32, !dbg !130
  %7 = call i32 (i32, ...)* bitcast (i32 (...)* @klee_assume to i32 (i32, ...)*)(i32 %6), !dbg !130
  %8 = load i32* %y, align 4, !dbg !131
  %9 = icmp slt i32 %8, 42, !dbg !131
  br i1 %9, label %10, label %15, !dbg !131

; <label>:10                                      ; preds = %0
  %11 = load i32* %x, align 4, !dbg !133
  %12 = icmp slt i32 %11, 10, !dbg !133
  %13 = zext i1 %12 to i32, !dbg !133
  %14 = call i32 (i32, ...)* bitcast (i32 (...)* @klee_assume to i32 (i32, ...)*)(i32 %13), !dbg !133
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([61 x i8]* @.str3, i32 0, i32 0), i32 22, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !135
  unreachable, !dbg !135

; <label>:15                                      ; preds = %0
  ret i32 0, !dbg !136
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @klee_assume(...) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #4 {
  %1 = icmp eq i64 %z, 0, !dbg !137
  br i1 %1, label %2, label %3, !dbg !137

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str26, i64 0, i64 0)) #8, !dbg !139
  unreachable, !dbg !139

; <label>:3                                       ; preds = %0
  ret void, !dbg !140
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !141
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #9, !dbg !141
  %2 = load i32* %x, align 4, !dbg !142, !tbaa !143
  ret i32 %2, !dbg !142
}

declare void @klee_make_symbolic(i8*, i64, i8*) #6

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #4 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !147
  br i1 %1, label %3, label %2, !dbg !147

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str37, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #8, !dbg !149
  unreachable, !dbg !149

; <label>:3                                       ; preds = %0
  ret void, !dbg !151
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !152
  br i1 %1, label %3, label %2, !dbg !152

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #8, !dbg !154
  unreachable, !dbg !154

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !155
  %5 = icmp eq i32 %4, %end, !dbg !155
  br i1 %5, label %21, label %6, !dbg !155

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !157
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #9, !dbg !157
  %8 = icmp eq i32 %start, 0, !dbg !159
  %9 = load i32* %x, align 4, !dbg !161, !tbaa !143
  br i1 %8, label %10, label %13, !dbg !159

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !161
  %12 = zext i1 %11 to i64, !dbg !161
  call void bitcast (i32 (...)* @klee_assume to void (i64)*)(i64 %12) #9, !dbg !161
  br label %19, !dbg !163

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !164
  %15 = zext i1 %14 to i64, !dbg !164
  call void bitcast (i32 (...)* @klee_assume to void (i64)*)(i64 %15) #9, !dbg !164
  %16 = load i32* %x, align 4, !dbg !166, !tbaa !143
  %17 = icmp slt i32 %16, %end, !dbg !166
  %18 = zext i1 %17 to i64, !dbg !166
  call void bitcast (i32 (...)* @klee_assume to void (i64)*)(i64 %18) #9, !dbg !166
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !167, !tbaa !143
  br label %21, !dbg !167

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !168
}

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !169
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !169

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !170
  %wide.load = load <16 x i8>* %3, align 1, !dbg !170
  %next.gep.sum279 = or i64 %index, 16, !dbg !170
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !170
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !170
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !170
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !170
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !170
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum279, !dbg !170
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !170
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !170
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !171

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
  %10 = add i64 %.01, -1, !dbg !169
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !170
  %12 = load i8* %src.03, align 1, !dbg !170, !tbaa !174
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !170
  store i8 %12, i8* %dest.02, align 1, !dbg !170, !tbaa !174
  %14 = icmp eq i64 %10, 0, !dbg !169
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !169, !llvm.loop !175

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !176
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #4 {
  %1 = icmp eq i8* %src, %dst, !dbg !177
  br i1 %1, label %.loopexit, label %2, !dbg !177

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !179
  br i1 %3, label %.preheader, label %18, !dbg !179

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !181
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !181

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
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !181
  %wide.load = load <16 x i8>* %6, align 1, !dbg !181
  %next.gep.sum586 = or i64 %index, 16, !dbg !181
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !181
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !181
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !181
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !181
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !181
  %10 = getelementptr i8* %dst, i64 %next.gep.sum586, !dbg !181
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !181
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !181
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !183

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
  %13 = add i64 %.02, -1, !dbg !181
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !181
  %15 = load i8* %b.04, align 1, !dbg !181, !tbaa !174
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !181
  store i8 %15, i8* %a.03, align 1, !dbg !181, !tbaa !174
  %17 = icmp eq i64 %13, 0, !dbg !181
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !181, !llvm.loop !184

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !185
  %20 = icmp eq i64 %count, 0, !dbg !187
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !187

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !188
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !185
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
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !187
  %23 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !187
  %24 = bitcast i8* %23 to <16 x i8>*, !dbg !187
  %wide.load434 = load <16 x i8>* %24, align 1, !dbg !187
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !187
  %.sum505 = add i64 %.sum440, -31, !dbg !187
  %25 = getelementptr i8* %src, i64 %.sum505, !dbg !187
  %26 = bitcast i8* %25 to <16 x i8>*, !dbg !187
  %wide.load435 = load <16 x i8>* %26, align 1, !dbg !187
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !187
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !187
  %27 = getelementptr i8* %dst, i64 %next.gep236.sum, !dbg !187
  %28 = bitcast i8* %27 to <16 x i8>*, !dbg !187
  store <16 x i8> %reverse437, <16 x i8>* %28, align 1, !dbg !187
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !187
  %29 = getelementptr i8* %dst, i64 %.sum505, !dbg !187
  %30 = bitcast i8* %29 to <16 x i8>*, !dbg !187
  store <16 x i8> %reverse438, <16 x i8>* %30, align 1, !dbg !187
  %index.next234 = add i64 %index212, 32
  %31 = icmp eq i64 %index.next234, %n.vec215
  br i1 %31, label %middle.block210, label %vector.body209, !llvm.loop !189

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
  %32 = add i64 %.16, -1, !dbg !187
  %33 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !187
  %34 = load i8* %b.18, align 1, !dbg !187, !tbaa !174
  %35 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !187
  store i8 %34, i8* %a.17, align 1, !dbg !187, !tbaa !174
  %36 = icmp eq i64 %32, 0, !dbg !187
  br i1 %36, label %.loopexit, label %scalar.ph211, !dbg !187, !llvm.loop !190

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !191
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !192
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !192

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !193
  %wide.load = load <16 x i8>* %3, align 1, !dbg !193
  %next.gep.sum280 = or i64 %index, 16, !dbg !193
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !193
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !193
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !193
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !193
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !193
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum280, !dbg !193
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !193
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !193
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !194

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
  %10 = add i64 %.01, -1, !dbg !192
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !193
  %12 = load i8* %src.03, align 1, !dbg !193, !tbaa !174
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !193
  store i8 %12, i8* %dest.02, align 1, !dbg !193, !tbaa !174
  %14 = icmp eq i64 %10, 0, !dbg !192
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !192, !llvm.loop !195

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !192

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !196
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #4 {
  %1 = icmp eq i64 %count, 0, !dbg !197
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !197

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !198
  br label %3, !dbg !197

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !197
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !198
  store volatile i8 %2, i8* %a.02, align 1, !dbg !198, !tbaa !174
  %6 = icmp eq i64 %4, 0, !dbg !197
  br i1 %6, label %._crit_edge, label %3, !dbg !197

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !199
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

!llvm.dbg.cu = !{!0, !9, !20, !34, !46, !59, !79, !94, !109}
!llvm.module.flags = !{!125, !126}
!llvm.ident = !{!127, !127, !127, !127, !127, !127, !127, !127, !127}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/test/Feature/SilentKleeAssume.c", metadata !"/home/sanghu/TracerX/tracerx/test/Feature"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 12, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 12} ; [ DW_TAG_subprogram ] [
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/SilentKleeAssume.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786449, metadata !10, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !11, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/
!10 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786478, metadata !13, metadata !14, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !15, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!13 = metadata !{metadata !"klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!14 = metadata !{i32 786473, metadata !13}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!15 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !16, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!16 = metadata !{null, metadata !17}
!17 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!18 = metadata !{metadata !19}
!19 = metadata !{i32 786689, metadata !12, metadata !"z", metadata !14, i32 16777228, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!20 = metadata !{i32 786449, metadata !21, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !22, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!21 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!22 = metadata !{metadata !23}
!23 = metadata !{i32 786478, metadata !24, metadata !25, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !31, i32 13} ; [ 
!24 = metadata !{metadata !"klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!25 = metadata !{i32 786473, metadata !24}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !8, metadata !28}
!28 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!29 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!30 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!31 = metadata !{metadata !32, metadata !33}
!32 = metadata !{i32 786689, metadata !23, metadata !"name", metadata !25, i32 16777229, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!33 = metadata !{i32 786688, metadata !23, metadata !"x", metadata !25, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!34 = metadata !{i32 786449, metadata !35, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !36, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!35 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786478, metadata !38, metadata !39, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !40, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!38 = metadata !{metadata !"klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!39 = metadata !{i32 786473, metadata !38}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!40 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = metadata !{null, metadata !42, metadata !42}
!42 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!43 = metadata !{metadata !44, metadata !45}
!44 = metadata !{i32 786689, metadata !37, metadata !"bitWidth", metadata !39, i32 16777236, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!45 = metadata !{i32 786689, metadata !37, metadata !"shift", metadata !39, i32 33554452, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!46 = metadata !{i32 786449, metadata !47, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !48, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!47 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786478, metadata !50, metadata !51, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !52, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!50 = metadata !{metadata !"klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!51 = metadata !{i32 786473, metadata !50}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!52 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = metadata !{metadata !8, metadata !8, metadata !8, metadata !28}
!54 = metadata !{metadata !55, metadata !56, metadata !57, metadata !58}
!55 = metadata !{i32 786689, metadata !49, metadata !"start", metadata !51, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!56 = metadata !{i32 786689, metadata !49, metadata !"end", metadata !51, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!57 = metadata !{i32 786689, metadata !49, metadata !"name", metadata !51, i32 50331661, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!58 = metadata !{i32 786688, metadata !49, metadata !"x", metadata !51, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!59 = metadata !{i32 786449, metadata !60, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !61, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!60 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!61 = metadata !{metadata !62}
!62 = metadata !{i32 786478, metadata !63, metadata !64, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !72, i32 12} 
!63 = metadata !{metadata !"memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!64 = metadata !{i32 786473, metadata !63}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c]
!65 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{metadata !67, metadata !67, metadata !68, metadata !70}
!67 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!68 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !69} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!69 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{i32 786454, metadata !63, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!71 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!72 = metadata !{metadata !73, metadata !74, metadata !75, metadata !76, metadata !78}
!73 = metadata !{i32 786689, metadata !62, metadata !"destaddr", metadata !64, i32 16777228, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!74 = metadata !{i32 786689, metadata !62, metadata !"srcaddr", metadata !64, i32 33554444, metadata !68, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!75 = metadata !{i32 786689, metadata !62, metadata !"len", metadata !64, i32 50331660, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!76 = metadata !{i32 786688, metadata !62, metadata !"dest", metadata !64, i32 13, metadata !77, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!77 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!78 = metadata !{i32 786688, metadata !62, metadata !"src", metadata !64, i32 14, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!79 = metadata !{i32 786449, metadata !80, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !81, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!80 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!81 = metadata !{metadata !82}
!82 = metadata !{i32 786478, metadata !83, metadata !84, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !85, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !88, i32 1
!83 = metadata !{metadata !"memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!84 = metadata !{i32 786473, metadata !83}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!85 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !86, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!86 = metadata !{metadata !67, metadata !67, metadata !68, metadata !87}
!87 = metadata !{i32 786454, metadata !83, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!88 = metadata !{metadata !89, metadata !90, metadata !91, metadata !92, metadata !93}
!89 = metadata !{i32 786689, metadata !82, metadata !"dst", metadata !84, i32 16777228, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!90 = metadata !{i32 786689, metadata !82, metadata !"src", metadata !84, i32 33554444, metadata !68, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!91 = metadata !{i32 786689, metadata !82, metadata !"count", metadata !84, i32 50331660, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!92 = metadata !{i32 786688, metadata !82, metadata !"a", metadata !84, i32 13, metadata !77, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!93 = metadata !{i32 786688, metadata !82, metadata !"b", metadata !84, i32 14, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!94 = metadata !{i32 786449, metadata !95, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !96, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!95 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!96 = metadata !{metadata !97}
!97 = metadata !{i32 786478, metadata !98, metadata !99, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !100, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !103, i32
!98 = metadata !{metadata !"mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!99 = metadata !{i32 786473, metadata !98}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c]
!100 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !101, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = metadata !{metadata !67, metadata !67, metadata !68, metadata !102}
!102 = metadata !{i32 786454, metadata !98, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!103 = metadata !{metadata !104, metadata !105, metadata !106, metadata !107, metadata !108}
!104 = metadata !{i32 786689, metadata !97, metadata !"destaddr", metadata !99, i32 16777227, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!105 = metadata !{i32 786689, metadata !97, metadata !"srcaddr", metadata !99, i32 33554443, metadata !68, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!106 = metadata !{i32 786689, metadata !97, metadata !"len", metadata !99, i32 50331659, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!107 = metadata !{i32 786688, metadata !97, metadata !"dest", metadata !99, i32 12, metadata !77, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!108 = metadata !{i32 786688, metadata !97, metadata !"src", metadata !99, i32 13, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!109 = metadata !{i32 786449, metadata !110, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !111, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!110 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!111 = metadata !{metadata !112}
!112 = metadata !{i32 786478, metadata !113, metadata !114, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !115, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !118, i32
!113 = metadata !{metadata !"memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!114 = metadata !{i32 786473, metadata !113}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c]
!115 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !116, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!116 = metadata !{metadata !67, metadata !67, metadata !8, metadata !117}
!117 = metadata !{i32 786454, metadata !113, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!118 = metadata !{metadata !119, metadata !120, metadata !121, metadata !122}
!119 = metadata !{i32 786689, metadata !112, metadata !"dst", metadata !114, i32 16777227, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!120 = metadata !{i32 786689, metadata !112, metadata !"s", metadata !114, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!121 = metadata !{i32 786689, metadata !112, metadata !"count", metadata !114, i32 50331659, metadata !117, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!122 = metadata !{i32 786688, metadata !112, metadata !"a", metadata !114, i32 12, metadata !123, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!123 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !124} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!124 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!125 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!126 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!127 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!128 = metadata !{i32 13, i32 0, metadata !4, null}
!129 = metadata !{i32 14, i32 0, metadata !4, null}
!130 = metadata !{i32 15, i32 0, metadata !4, null}
!131 = metadata !{i32 16, i32 0, metadata !132, null}
!132 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/SilentKleeAssume.c]
!133 = metadata !{i32 18, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !1, metadata !132, i32 16, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/SilentKleeAssume.c]
!135 = metadata !{i32 22, i32 0, metadata !134, null}
!136 = metadata !{i32 24, i32 0, metadata !4, null}
!137 = metadata !{i32 13, i32 0, metadata !138, null}
!138 = metadata !{i32 786443, metadata !13, metadata !12, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!139 = metadata !{i32 14, i32 0, metadata !138, null}
!140 = metadata !{i32 15, i32 0, metadata !12, null}
!141 = metadata !{i32 15, i32 0, metadata !23, null}
!142 = metadata !{i32 16, i32 0, metadata !23, null}
!143 = metadata !{metadata !144, metadata !144, i64 0}
!144 = metadata !{metadata !"int", metadata !145, i64 0}
!145 = metadata !{metadata !"omnipotent char", metadata !146, i64 0}
!146 = metadata !{metadata !"Simple C/C++ TBAA"}
!147 = metadata !{i32 21, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !38, metadata !37, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!149 = metadata !{i32 27, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !38, metadata !148, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!151 = metadata !{i32 29, i32 0, metadata !37, null}
!152 = metadata !{i32 16, i32 0, metadata !153, null}
!153 = metadata !{i32 786443, metadata !50, metadata !49, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!154 = metadata !{i32 17, i32 0, metadata !153, null}
!155 = metadata !{i32 19, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !50, metadata !49, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!157 = metadata !{i32 22, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !50, metadata !156, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!159 = metadata !{i32 25, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !50, metadata !158, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!161 = metadata !{i32 26, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !50, metadata !160, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!163 = metadata !{i32 27, i32 0, metadata !162, null}
!164 = metadata !{i32 28, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !50, metadata !160, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!166 = metadata !{i32 29, i32 0, metadata !165, null}
!167 = metadata !{i32 32, i32 0, metadata !158, null}
!168 = metadata !{i32 34, i32 0, metadata !49, null}
!169 = metadata !{i32 16, i32 0, metadata !62, null}
!170 = metadata !{i32 17, i32 0, metadata !62, null}
!171 = metadata !{metadata !171, metadata !172, metadata !173}
!172 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!173 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!174 = metadata !{metadata !145, metadata !145, i64 0}
!175 = metadata !{metadata !175, metadata !172, metadata !173}
!176 = metadata !{i32 18, i32 0, metadata !62, null}
!177 = metadata !{i32 16, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !83, metadata !82, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!179 = metadata !{i32 19, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !83, metadata !82, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!181 = metadata !{i32 20, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !83, metadata !180, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!183 = metadata !{metadata !183, metadata !172, metadata !173}
!184 = metadata !{metadata !184, metadata !172, metadata !173}
!185 = metadata !{i32 22, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !83, metadata !180, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!187 = metadata !{i32 24, i32 0, metadata !186, null}
!188 = metadata !{i32 23, i32 0, metadata !186, null}
!189 = metadata !{metadata !189, metadata !172, metadata !173}
!190 = metadata !{metadata !190, metadata !172, metadata !173}
!191 = metadata !{i32 28, i32 0, metadata !82, null}
!192 = metadata !{i32 15, i32 0, metadata !97, null}
!193 = metadata !{i32 16, i32 0, metadata !97, null}
!194 = metadata !{metadata !194, metadata !172, metadata !173}
!195 = metadata !{metadata !195, metadata !172, metadata !173}
!196 = metadata !{i32 17, i32 0, metadata !97, null}
!197 = metadata !{i32 13, i32 0, metadata !112, null}
!198 = metadata !{i32 14, i32 0, metadata !112, null}
!199 = metadata !{i32 15, i32 0, metadata !112, null}
