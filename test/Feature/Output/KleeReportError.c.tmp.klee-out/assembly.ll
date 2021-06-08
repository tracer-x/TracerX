; ModuleID = '/home/sanghu/TracerX/tracerx/test/Feature/Output/KleeReportError.c.tmp2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [3 x i8] c"x\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"!x\0A\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"My error\0A\00", align 1
@.str3 = private unnamed_addr constant [60 x i8] c"/home/sanghu/TracerX/tracerx/test/Feature/KleeReportError.c\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"My error\00", align 1
@.str5 = private unnamed_addr constant [7 x i8] c"my.err\00", align 1
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
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32* null, i32** %p, align 8, !dbg !129
  %4 = call i32 (i32*, i64, ...)* bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, ...)*)(i32* %x, i64 4), !dbg !130
  %5 = call i32 (i32*, i64, ...)* bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, ...)*)(i32* %y, i64 4), !dbg !131
  %6 = load i32* %x, align 4, !dbg !132
  %7 = icmp ne i32 %6, 0, !dbg !132
  br i1 %7, label %8, label %11, !dbg !132

; <label>:8                                       ; preds = %0
  %9 = load %struct._IO_FILE** @stderr, align 8, !dbg !134
  %10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0)), !dbg !134
  br label %14, !dbg !134

; <label>:11                                      ; preds = %0
  %12 = load %struct._IO_FILE** @stderr, align 8, !dbg !135
  %13 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0)), !dbg !135
  br label %14

; <label>:14                                      ; preds = %11, %8
  %15 = load i32* %y, align 4, !dbg !136
  %16 = icmp ne i32 %15, 0, !dbg !136
  br i1 %16, label %17, label %21, !dbg !136

; <label>:17                                      ; preds = %14
  %18 = load %struct._IO_FILE** @stderr, align 8, !dbg !138
  %19 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0)), !dbg !138
  %20 = call i32 (i8*, i32, i8*, i8*, ...)* bitcast (i32 (...)* @klee_report_error to i32 (i8*, i32, i8*, i8*, ...)*)(i8* getelementptr inbounds ([60 x i8]* @.str3, i32 0, i32 0), i32 23, i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i8* g
  br label %21, !dbg !141

; <label>:21                                      ; preds = %17, %14
  ret i32 0, !dbg !142
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare i32 @klee_make_symbolic(...) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn
declare i32 @klee_report_error(...) #3

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #4 {
  %1 = icmp eq i64 %z, 0, !dbg !143
  br i1 %1, label %2, label %3, !dbg !143

; <label>:2                                       ; preds = %0
  tail call void bitcast (i32 (...)* @klee_report_error to void (i8*, i32, i8*, i8*)*)(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([8 x i
  unreachable, !dbg !145

; <label>:3                                       ; preds = %0
  ret void, !dbg !146
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !147
  call void bitcast (i32 (...)* @klee_make_symbolic to void (i8*, i64, i8*)*)(i8* %1, i64 4, i8* %name) #7, !dbg !147
  %2 = load i32* %x, align 4, !dbg !148, !tbaa !149
  ret i32 %2, !dbg !148
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #4 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !153
  br i1 %1, label %3, label %2, !dbg !153

; <label>:2                                       ; preds = %0
  tail call void bitcast (i32 (...)* @klee_report_error to void (i8*, i32, i8*, i8*)*)(i8* getelementptr inbounds ([8 x i8]* @.str39, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i
  unreachable, !dbg !155

; <label>:3                                       ; preds = %0
  ret void, !dbg !157
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !158
  br i1 %1, label %3, label %2, !dbg !158

; <label>:2                                       ; preds = %0
  call void bitcast (i32 (...)* @klee_report_error to void (i8*, i32, i8*, i8*)*)(i8* getelementptr inbounds ([13 x i8]* @.str610, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str1711, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8
  unreachable, !dbg !160

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !161
  %5 = icmp eq i32 %4, %end, !dbg !161
  br i1 %5, label %21, label %6, !dbg !161

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !163
  call void bitcast (i32 (...)* @klee_make_symbolic to void (i8*, i64, i8*)*)(i8* %7, i64 4, i8* %name) #7, !dbg !163
  %8 = icmp eq i32 %start, 0, !dbg !165
  %9 = load i32* %x, align 4, !dbg !167, !tbaa !149
  br i1 %8, label %10, label %13, !dbg !165

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !167
  %12 = zext i1 %11 to i64, !dbg !167
  call void @klee_assume(i64 %12) #7, !dbg !167
  br label %19, !dbg !169

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !170
  %15 = zext i1 %14 to i64, !dbg !170
  call void @klee_assume(i64 %15) #7, !dbg !170
  %16 = load i32* %x, align 4, !dbg !172, !tbaa !149
  %17 = icmp slt i32 %16, %end, !dbg !172
  %18 = zext i1 %17 to i64, !dbg !172
  call void @klee_assume(i64 %18) #7, !dbg !172
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !173, !tbaa !149
  br label %21, !dbg !173

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !174
}

declare void @klee_assume(i64) #5

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !175
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !175

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !176
  %wide.load = load <16 x i8>* %3, align 1, !dbg !176
  %next.gep.sum279 = or i64 %index, 16, !dbg !176
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !176
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !176
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !176
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !176
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !176
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum279, !dbg !176
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !176
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !176
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !177

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
  %10 = add i64 %.01, -1, !dbg !175
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !176
  %12 = load i8* %src.03, align 1, !dbg !176, !tbaa !180
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !176
  store i8 %12, i8* %dest.02, align 1, !dbg !176, !tbaa !180
  %14 = icmp eq i64 %10, 0, !dbg !175
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !175, !llvm.loop !181

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !182
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #4 {
  %1 = icmp eq i8* %src, %dst, !dbg !183
  br i1 %1, label %.loopexit, label %2, !dbg !183

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !185
  br i1 %3, label %.preheader, label %18, !dbg !185

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !187
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !187

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
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !187
  %wide.load = load <16 x i8>* %6, align 1, !dbg !187
  %next.gep.sum586 = or i64 %index, 16, !dbg !187
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !187
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !187
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !187
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !187
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !187
  %10 = getelementptr i8* %dst, i64 %next.gep.sum586, !dbg !187
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !187
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !187
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !189

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
  %13 = add i64 %.02, -1, !dbg !187
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !187
  %15 = load i8* %b.04, align 1, !dbg !187, !tbaa !180
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !187
  store i8 %15, i8* %a.03, align 1, !dbg !187, !tbaa !180
  %17 = icmp eq i64 %13, 0, !dbg !187
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !187, !llvm.loop !190

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !191
  %20 = icmp eq i64 %count, 0, !dbg !193
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !193

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !194
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !191
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
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !193
  %23 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !193
  %24 = bitcast i8* %23 to <16 x i8>*, !dbg !193
  %wide.load434 = load <16 x i8>* %24, align 1, !dbg !193
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !193
  %.sum505 = add i64 %.sum440, -31, !dbg !193
  %25 = getelementptr i8* %src, i64 %.sum505, !dbg !193
  %26 = bitcast i8* %25 to <16 x i8>*, !dbg !193
  %wide.load435 = load <16 x i8>* %26, align 1, !dbg !193
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !193
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !193
  %27 = getelementptr i8* %dst, i64 %next.gep236.sum, !dbg !193
  %28 = bitcast i8* %27 to <16 x i8>*, !dbg !193
  store <16 x i8> %reverse437, <16 x i8>* %28, align 1, !dbg !193
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !193
  %29 = getelementptr i8* %dst, i64 %.sum505, !dbg !193
  %30 = bitcast i8* %29 to <16 x i8>*, !dbg !193
  store <16 x i8> %reverse438, <16 x i8>* %30, align 1, !dbg !193
  %index.next234 = add i64 %index212, 32
  %31 = icmp eq i64 %index.next234, %n.vec215
  br i1 %31, label %middle.block210, label %vector.body209, !llvm.loop !195

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
  %32 = add i64 %.16, -1, !dbg !193
  %33 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !193
  %34 = load i8* %b.18, align 1, !dbg !193, !tbaa !180
  %35 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !193
  store i8 %34, i8* %a.17, align 1, !dbg !193, !tbaa !180
  %36 = icmp eq i64 %32, 0, !dbg !193
  br i1 %36, label %.loopexit, label %scalar.ph211, !dbg !193, !llvm.loop !196

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !197
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !198
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !198

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !199
  %wide.load = load <16 x i8>* %3, align 1, !dbg !199
  %next.gep.sum280 = or i64 %index, 16, !dbg !199
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !199
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !199
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !199
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !199
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !199
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum280, !dbg !199
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !199
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !199
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !200

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
  %10 = add i64 %.01, -1, !dbg !198
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !199
  %12 = load i8* %src.03, align 1, !dbg !199, !tbaa !180
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !199
  store i8 %12, i8* %dest.02, align 1, !dbg !199, !tbaa !180
  %14 = icmp eq i64 %10, 0, !dbg !198
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !198, !llvm.loop !201

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !198

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !202
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #4 {
  %1 = icmp eq i64 %count, 0, !dbg !203
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !203

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !204
  br label %3, !dbg !203

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !203
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !204
  store volatile i8 %2, i8* %a.02, align 1, !dbg !204, !tbaa !180
  %6 = icmp eq i64 %4, 0, !dbg !203
  br i1 %6, label %._crit_edge, label %3, !dbg !203

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !205
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false
attributes #4 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin noreturn nounwind }
attributes #7 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0, !12, !23, !36, !48, !61, !80, !95, !110}
!llvm.module.flags = !{!126, !127}
!llvm.ident = !{!128, !128, !128, !128, !128, !128, !128, !128, !128}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/test/Feature/KleeReportError.c", metadata !"/home/sanghu/TracerX/tracerx/test/Feature"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 8, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 8} ; [ DW_TAG_subpr
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/KleeReportError.c]
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
!129 = metadata !{i32 9, i32 0, metadata !4, null}
!130 = metadata !{i32 11, i32 0, metadata !4, null}
!131 = metadata !{i32 12, i32 0, metadata !4, null}
!132 = metadata !{i32 14, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !4, i32 14, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/KleeReportError.c]
!134 = metadata !{i32 15, i32 0, metadata !133, null}
!135 = metadata !{i32 16, i32 0, metadata !133, null}
!136 = metadata !{i32 18, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !4, i32 18, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/KleeReportError.c]
!138 = metadata !{i32 19, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !137, i32 18, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/test/Feature//home/sanghu/TracerX/tracerx/test/Feature/KleeReportError.c]
!140 = metadata !{i32 23, i32 0, metadata !139, null}
!141 = metadata !{i32 24, i32 0, metadata !139, null}
!142 = metadata !{i32 26, i32 0, metadata !4, null}
!143 = metadata !{i32 13, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !16, metadata !15, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!145 = metadata !{i32 14, i32 0, metadata !144, null}
!146 = metadata !{i32 15, i32 0, metadata !15, null}
!147 = metadata !{i32 15, i32 0, metadata !26, null}
!148 = metadata !{i32 16, i32 0, metadata !26, null}
!149 = metadata !{metadata !150, metadata !150, i64 0}
!150 = metadata !{metadata !"int", metadata !151, i64 0}
!151 = metadata !{metadata !"omnipotent char", metadata !152, i64 0}
!152 = metadata !{metadata !"Simple C/C++ TBAA"}
!153 = metadata !{i32 21, i32 0, metadata !154, null}
!154 = metadata !{i32 786443, metadata !40, metadata !39, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!155 = metadata !{i32 27, i32 0, metadata !156, null}
!156 = metadata !{i32 786443, metadata !40, metadata !154, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!157 = metadata !{i32 29, i32 0, metadata !39, null}
!158 = metadata !{i32 16, i32 0, metadata !159, null}
!159 = metadata !{i32 786443, metadata !52, metadata !51, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!160 = metadata !{i32 17, i32 0, metadata !159, null}
!161 = metadata !{i32 19, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !52, metadata !51, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!163 = metadata !{i32 22, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !52, metadata !162, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!165 = metadata !{i32 25, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !52, metadata !164, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!167 = metadata !{i32 26, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !52, metadata !166, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!169 = metadata !{i32 27, i32 0, metadata !168, null}
!170 = metadata !{i32 28, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !52, metadata !166, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!172 = metadata !{i32 29, i32 0, metadata !171, null}
!173 = metadata !{i32 32, i32 0, metadata !164, null}
!174 = metadata !{i32 34, i32 0, metadata !51, null}
!175 = metadata !{i32 16, i32 0, metadata !64, null}
!176 = metadata !{i32 17, i32 0, metadata !64, null}
!177 = metadata !{metadata !177, metadata !178, metadata !179}
!178 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!179 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!180 = metadata !{metadata !151, metadata !151, i64 0}
!181 = metadata !{metadata !181, metadata !178, metadata !179}
!182 = metadata !{i32 18, i32 0, metadata !64, null}
!183 = metadata !{i32 16, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !84, metadata !83, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!185 = metadata !{i32 19, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !84, metadata !83, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!187 = metadata !{i32 20, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !84, metadata !186, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!189 = metadata !{metadata !189, metadata !178, metadata !179}
!190 = metadata !{metadata !190, metadata !178, metadata !179}
!191 = metadata !{i32 22, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !84, metadata !186, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!193 = metadata !{i32 24, i32 0, metadata !192, null}
!194 = metadata !{i32 23, i32 0, metadata !192, null}
!195 = metadata !{metadata !195, metadata !178, metadata !179}
!196 = metadata !{metadata !196, metadata !178, metadata !179}
!197 = metadata !{i32 28, i32 0, metadata !83, null}
!198 = metadata !{i32 15, i32 0, metadata !98, null}
!199 = metadata !{i32 16, i32 0, metadata !98, null}
!200 = metadata !{metadata !200, metadata !178, metadata !179}
!201 = metadata !{metadata !201, metadata !178, metadata !179}
!202 = metadata !{i32 17, i32 0, metadata !98, null}
!203 = metadata !{i32 13, i32 0, metadata !113, null}
!204 = metadata !{i32 14, i32 0, metadata !113, null}
!205 = metadata !{i32 15, i32 0, metadata !113, null}
