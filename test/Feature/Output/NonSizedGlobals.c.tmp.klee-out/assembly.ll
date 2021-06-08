; ModuleID = '/home/sanghu/TracerX/tracerx/test/Feature/Output/NonSizedGlobals.c.tmp1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.X = type opaque

@Y = external global %struct.X
@ptr = global i8* bitcast (%struct.X* @Y to i8*), align 8
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
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  ret i32 0, !dbg !130
}

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #1 {
  %1 = icmp eq i64 %z, 0, !dbg !131
  br i1 %1, label %2, label %3, !dbg !131

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0)) #5, !dbg !133
  unreachable, !dbg !133

; <label>:3                                       ; preds = %0
  ret void, !dbg !134
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #1 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !135
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #6, !dbg !135
  %2 = load i32* %x, align 4, !dbg !136, !tbaa !137
  ret i32 %2, !dbg !136
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #3

declare void @klee_make_symbolic(i8*, i64, i8*) #4

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #1 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !141
  br i1 %1, label %3, label %2, !dbg !141

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str3, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #5, !dbg !143
  unreachable, !dbg !143

; <label>:3                                       ; preds = %0
  ret void, !dbg !145
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #1 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !146
  br i1 %1, label %3, label %2, !dbg !146

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #5, !dbg !148
  unreachable, !dbg !148

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !149
  %5 = icmp eq i32 %4, %end, !dbg !149
  br i1 %5, label %21, label %6, !dbg !149

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !151
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #6, !dbg !151
  %8 = icmp eq i32 %start, 0, !dbg !153
  %9 = load i32* %x, align 4, !dbg !155, !tbaa !137
  br i1 %8, label %10, label %13, !dbg !153

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !155
  %12 = zext i1 %11 to i64, !dbg !155
  call void @klee_assume(i64 %12) #6, !dbg !155
  br label %19, !dbg !157

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !158
  %15 = zext i1 %14 to i64, !dbg !158
  call void @klee_assume(i64 %15) #6, !dbg !158
  %16 = load i32* %x, align 4, !dbg !160, !tbaa !137
  %17 = icmp slt i32 %16, %end, !dbg !160
  %18 = zext i1 %17 to i64, !dbg !160
  call void @klee_assume(i64 %18) #6, !dbg !160
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !161, !tbaa !137
  br label %21, !dbg !161

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !162
}

declare void @klee_assume(i64) #4

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #1 {
  %1 = icmp eq i64 %len, 0, !dbg !163
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !163

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !164
  %wide.load = load <16 x i8>* %3, align 1, !dbg !164
  %next.gep.sum279 = or i64 %index, 16, !dbg !164
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !164
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !164
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !164
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !164
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !164
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum279, !dbg !164
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !164
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !164
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !165

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
  %10 = add i64 %.01, -1, !dbg !163
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !164
  %12 = load i8* %src.03, align 1, !dbg !164, !tbaa !168
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !164
  store i8 %12, i8* %dest.02, align 1, !dbg !164, !tbaa !168
  %14 = icmp eq i64 %10, 0, !dbg !163
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !163, !llvm.loop !169

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !170
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #1 {
  %1 = icmp eq i8* %src, %dst, !dbg !171
  br i1 %1, label %.loopexit, label %2, !dbg !171

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !173
  br i1 %3, label %.preheader, label %18, !dbg !173

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !175
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !175

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
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !175
  %wide.load = load <16 x i8>* %6, align 1, !dbg !175
  %next.gep.sum586 = or i64 %index, 16, !dbg !175
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !175
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !175
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !175
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !175
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !175
  %10 = getelementptr i8* %dst, i64 %next.gep.sum586, !dbg !175
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !175
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !175
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !177

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
  %13 = add i64 %.02, -1, !dbg !175
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !175
  %15 = load i8* %b.04, align 1, !dbg !175, !tbaa !168
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !175
  store i8 %15, i8* %a.03, align 1, !dbg !175, !tbaa !168
  %17 = icmp eq i64 %13, 0, !dbg !175
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !175, !llvm.loop !178

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !179
  %20 = icmp eq i64 %count, 0, !dbg !181
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !181

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !182
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !179
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
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !181
  %23 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !181
  %24 = bitcast i8* %23 to <16 x i8>*, !dbg !181
  %wide.load434 = load <16 x i8>* %24, align 1, !dbg !181
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !181
  %.sum505 = add i64 %.sum440, -31, !dbg !181
  %25 = getelementptr i8* %src, i64 %.sum505, !dbg !181
  %26 = bitcast i8* %25 to <16 x i8>*, !dbg !181
  %wide.load435 = load <16 x i8>* %26, align 1, !dbg !181
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !181
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !181
  %27 = getelementptr i8* %dst, i64 %next.gep236.sum, !dbg !181
  %28 = bitcast i8* %27 to <16 x i8>*, !dbg !181
  store <16 x i8> %reverse437, <16 x i8>* %28, align 1, !dbg !181
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !181
  %29 = getelementptr i8* %dst, i64 %.sum505, !dbg !181
  %30 = bitcast i8* %29 to <16 x i8>*, !dbg !181
  store <16 x i8> %reverse438, <16 x i8>* %30, align 1, !dbg !181
  %index.next234 = add i64 %index212, 32
  %31 = icmp eq i64 %index.next234, %n.vec215
  br i1 %31, label %middle.block210, label %vector.body209, !llvm.loop !183

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
  %32 = add i64 %.16, -1, !dbg !181
  %33 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !181
  %34 = load i8* %b.18, align 1, !dbg !181, !tbaa !168
  %35 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !181
  store i8 %34, i8* %a.17, align 1, !dbg !181, !tbaa !168
  %36 = icmp eq i64 %32, 0, !dbg !181
  br i1 %36, label %.loopexit, label %scalar.ph211, !dbg !181, !llvm.loop !184

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !185
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #1 {
  %1 = icmp eq i64 %len, 0, !dbg !186
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !186

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !187
  %wide.load = load <16 x i8>* %3, align 1, !dbg !187
  %next.gep.sum280 = or i64 %index, 16, !dbg !187
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !187
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !187
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !187
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !187
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !187
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum280, !dbg !187
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !187
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !187
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !188

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
  %10 = add i64 %.01, -1, !dbg !186
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !187
  %12 = load i8* %src.03, align 1, !dbg !187, !tbaa !168
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !187
  store i8 %12, i8* %dest.02, align 1, !dbg !187, !tbaa !168
  %14 = icmp eq i64 %10, 0, !dbg !186
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !186, !llvm.loop !189

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !186

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !190
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #1 {
  %1 = icmp eq i64 %count, 0, !dbg !191
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !191

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !192
  br label %3, !dbg !191

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !191
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !192
  store volatile i8 %2, i8* %a.02, align 1, !dbg !192, !tbaa !168
  %6 = icmp eq i64 %4, 0, !dbg !191
  br i1 %6, label %._crit_edge, label %3, !dbg !191

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !193
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin noreturn nounwind }
attributes #6 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0, !12, !23, !37, !49, !62, !81, !96, !111}
!llvm.module.flags = !{!127, !128}
!llvm.ident = !{!129, !129, !129, !129, !129, !129, !129, !129, !129}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !9, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/test/Feature/NonSizedGlobals.c", metadata !"/home/sanghu/TracerX/tracerx/test/Feature"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 9, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 9} ; [ DW_TAG_subprogram ] [li
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/NonSizedGlobals.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{metadata !10}
!10 = metadata !{i32 786484, i32 0, null, metadata !"ptr", metadata !"ptr", metadata !"", metadata !5, i32 7, metadata !11, i32 0, i32 1, i8** @ptr, null} ; [ DW_TAG_variable ] [ptr] [line 7] [def]
!11 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
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
!26 = metadata !{i32 786478, metadata !27, metadata !28, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !34, i32 13} ; [ 
!27 = metadata !{metadata !"klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!28 = metadata !{i32 786473, metadata !27}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{metadata !8, metadata !31}
!31 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!32 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!33 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!34 = metadata !{metadata !35, metadata !36}
!35 = metadata !{i32 786689, metadata !26, metadata !"name", metadata !28, i32 16777229, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!36 = metadata !{i32 786688, metadata !26, metadata !"x", metadata !28, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!37 = metadata !{i32 786449, metadata !38, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !39, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!38 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786478, metadata !41, metadata !42, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!41 = metadata !{metadata !"klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!42 = metadata !{i32 786473, metadata !41}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!43 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = metadata !{null, metadata !45, metadata !45}
!45 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!46 = metadata !{metadata !47, metadata !48}
!47 = metadata !{i32 786689, metadata !40, metadata !"bitWidth", metadata !42, i32 16777236, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!48 = metadata !{i32 786689, metadata !40, metadata !"shift", metadata !42, i32 33554452, metadata !45, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!49 = metadata !{i32 786449, metadata !50, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !51, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!50 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!51 = metadata !{metadata !52}
!52 = metadata !{i32 786478, metadata !53, metadata !54, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !55, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!53 = metadata !{metadata !"klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!54 = metadata !{i32 786473, metadata !53}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!55 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !56, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = metadata !{metadata !8, metadata !8, metadata !8, metadata !31}
!57 = metadata !{metadata !58, metadata !59, metadata !60, metadata !61}
!58 = metadata !{i32 786689, metadata !52, metadata !"start", metadata !54, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!59 = metadata !{i32 786689, metadata !52, metadata !"end", metadata !54, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!60 = metadata !{i32 786689, metadata !52, metadata !"name", metadata !54, i32 50331661, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!61 = metadata !{i32 786688, metadata !52, metadata !"x", metadata !54, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!62 = metadata !{i32 786449, metadata !63, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !64, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!63 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!64 = metadata !{metadata !65}
!65 = metadata !{i32 786478, metadata !66, metadata !67, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !68, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !74, i32 12} 
!66 = metadata !{metadata !"memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!67 = metadata !{i32 786473, metadata !66}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c]
!68 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !69, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!69 = metadata !{metadata !11, metadata !11, metadata !70, metadata !72}
!70 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !71} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!71 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = metadata !{i32 786454, metadata !66, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!73 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!74 = metadata !{metadata !75, metadata !76, metadata !77, metadata !78, metadata !80}
!75 = metadata !{i32 786689, metadata !65, metadata !"destaddr", metadata !67, i32 16777228, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!76 = metadata !{i32 786689, metadata !65, metadata !"srcaddr", metadata !67, i32 33554444, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!77 = metadata !{i32 786689, metadata !65, metadata !"len", metadata !67, i32 50331660, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!78 = metadata !{i32 786688, metadata !65, metadata !"dest", metadata !67, i32 13, metadata !79, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!79 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!80 = metadata !{i32 786688, metadata !65, metadata !"src", metadata !67, i32 14, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!81 = metadata !{i32 786449, metadata !82, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !83, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!82 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!83 = metadata !{metadata !84}
!84 = metadata !{i32 786478, metadata !85, metadata !86, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !87, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !90, i32 1
!85 = metadata !{metadata !"memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!86 = metadata !{i32 786473, metadata !85}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!87 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !88, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!88 = metadata !{metadata !11, metadata !11, metadata !70, metadata !89}
!89 = metadata !{i32 786454, metadata !85, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!90 = metadata !{metadata !91, metadata !92, metadata !93, metadata !94, metadata !95}
!91 = metadata !{i32 786689, metadata !84, metadata !"dst", metadata !86, i32 16777228, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!92 = metadata !{i32 786689, metadata !84, metadata !"src", metadata !86, i32 33554444, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!93 = metadata !{i32 786689, metadata !84, metadata !"count", metadata !86, i32 50331660, metadata !89, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!94 = metadata !{i32 786688, metadata !84, metadata !"a", metadata !86, i32 13, metadata !79, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!95 = metadata !{i32 786688, metadata !84, metadata !"b", metadata !86, i32 14, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!96 = metadata !{i32 786449, metadata !97, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !98, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!97 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!98 = metadata !{metadata !99}
!99 = metadata !{i32 786478, metadata !100, metadata !101, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !102, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !105, i
!100 = metadata !{metadata !"mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!101 = metadata !{i32 786473, metadata !100}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c]
!102 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !103, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!103 = metadata !{metadata !11, metadata !11, metadata !70, metadata !104}
!104 = metadata !{i32 786454, metadata !100, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!105 = metadata !{metadata !106, metadata !107, metadata !108, metadata !109, metadata !110}
!106 = metadata !{i32 786689, metadata !99, metadata !"destaddr", metadata !101, i32 16777227, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!107 = metadata !{i32 786689, metadata !99, metadata !"srcaddr", metadata !101, i32 33554443, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!108 = metadata !{i32 786689, metadata !99, metadata !"len", metadata !101, i32 50331659, metadata !104, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!109 = metadata !{i32 786688, metadata !99, metadata !"dest", metadata !101, i32 12, metadata !79, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!110 = metadata !{i32 786688, metadata !99, metadata !"src", metadata !101, i32 13, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!111 = metadata !{i32 786449, metadata !112, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !113, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!112 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!113 = metadata !{metadata !114}
!114 = metadata !{i32 786478, metadata !115, metadata !116, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !117, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !120, i32
!115 = metadata !{metadata !"memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!116 = metadata !{i32 786473, metadata !115}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c]
!117 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !118, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!118 = metadata !{metadata !11, metadata !11, metadata !8, metadata !119}
!119 = metadata !{i32 786454, metadata !115, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!120 = metadata !{metadata !121, metadata !122, metadata !123, metadata !124}
!121 = metadata !{i32 786689, metadata !114, metadata !"dst", metadata !116, i32 16777227, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!122 = metadata !{i32 786689, metadata !114, metadata !"s", metadata !116, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!123 = metadata !{i32 786689, metadata !114, metadata !"count", metadata !116, i32 50331659, metadata !119, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!124 = metadata !{i32 786688, metadata !114, metadata !"a", metadata !116, i32 12, metadata !125, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!125 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !126} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!126 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!127 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!128 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!129 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!130 = metadata !{i32 9, i32 0, metadata !4, null}
!131 = metadata !{i32 13, i32 0, metadata !132, null}
!132 = metadata !{i32 786443, metadata !16, metadata !15, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!133 = metadata !{i32 14, i32 0, metadata !132, null}
!134 = metadata !{i32 15, i32 0, metadata !15, null}
!135 = metadata !{i32 15, i32 0, metadata !26, null}
!136 = metadata !{i32 16, i32 0, metadata !26, null}
!137 = metadata !{metadata !138, metadata !138, i64 0}
!138 = metadata !{metadata !"int", metadata !139, i64 0}
!139 = metadata !{metadata !"omnipotent char", metadata !140, i64 0}
!140 = metadata !{metadata !"Simple C/C++ TBAA"}
!141 = metadata !{i32 21, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !41, metadata !40, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!143 = metadata !{i32 27, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !41, metadata !142, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!145 = metadata !{i32 29, i32 0, metadata !40, null}
!146 = metadata !{i32 16, i32 0, metadata !147, null}
!147 = metadata !{i32 786443, metadata !53, metadata !52, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!148 = metadata !{i32 17, i32 0, metadata !147, null}
!149 = metadata !{i32 19, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !53, metadata !52, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!151 = metadata !{i32 22, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !53, metadata !150, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!153 = metadata !{i32 25, i32 0, metadata !154, null}
!154 = metadata !{i32 786443, metadata !53, metadata !152, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!155 = metadata !{i32 26, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !53, metadata !154, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!157 = metadata !{i32 27, i32 0, metadata !156, null}
!158 = metadata !{i32 28, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !53, metadata !154, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!160 = metadata !{i32 29, i32 0, metadata !159, null}
!161 = metadata !{i32 32, i32 0, metadata !152, null}
!162 = metadata !{i32 34, i32 0, metadata !52, null}
!163 = metadata !{i32 16, i32 0, metadata !65, null}
!164 = metadata !{i32 17, i32 0, metadata !65, null}
!165 = metadata !{metadata !165, metadata !166, metadata !167}
!166 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!167 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!168 = metadata !{metadata !139, metadata !139, i64 0}
!169 = metadata !{metadata !169, metadata !166, metadata !167}
!170 = metadata !{i32 18, i32 0, metadata !65, null}
!171 = metadata !{i32 16, i32 0, metadata !172, null}
!172 = metadata !{i32 786443, metadata !85, metadata !84, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!173 = metadata !{i32 19, i32 0, metadata !174, null}
!174 = metadata !{i32 786443, metadata !85, metadata !84, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!175 = metadata !{i32 20, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !85, metadata !174, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!177 = metadata !{metadata !177, metadata !166, metadata !167}
!178 = metadata !{metadata !178, metadata !166, metadata !167}
!179 = metadata !{i32 22, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !85, metadata !174, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!181 = metadata !{i32 24, i32 0, metadata !180, null}
!182 = metadata !{i32 23, i32 0, metadata !180, null}
!183 = metadata !{metadata !183, metadata !166, metadata !167}
!184 = metadata !{metadata !184, metadata !166, metadata !167}
!185 = metadata !{i32 28, i32 0, metadata !84, null}
!186 = metadata !{i32 15, i32 0, metadata !99, null}
!187 = metadata !{i32 16, i32 0, metadata !99, null}
!188 = metadata !{metadata !188, metadata !166, metadata !167}
!189 = metadata !{metadata !189, metadata !166, metadata !167}
!190 = metadata !{i32 17, i32 0, metadata !99, null}
!191 = metadata !{i32 13, i32 0, metadata !114, null}
!192 = metadata !{i32 14, i32 0, metadata !114, null}
!193 = metadata !{i32 15, i32 0, metadata !114, null}
