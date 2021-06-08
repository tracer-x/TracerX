; ModuleID = 'klee_init_env.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@.str1 = private unnamed_addr constant [964 x i8] c"klee_init_env\0A\0Ausage: (klee_init_env) [options] [program arguments]\0A  -sym-arg <N>              - Replace by a symbolic argument with length N\0A  -sym-args <MIN> <MAX> <N> - Replace by at least MIN arguments and at most\0A                              MAX arguments, each with maximum length N\0A  -sym-files <NUM> <N>      - Make NUM symbolic files ('A', 'B', 'C', etc.),\0A                              each with size N\0A  -sym-stdin <N>            - Make stdin symbolic with size N.\0A  -sym-stdout               - Make stdout symbolic.\0A  -save-all-writes          - Allow write operations to execute as expected\0A                              even if they exceed the file size. If set to 0, all\0A                              writes exceeding the initial file size are discarded.\0A                              Note: file offset is always incremented.\0A  -max-fail <N>             - Allow up to N injected failures\0A  -fd-fail                  - Shortcut for '-max-fail 1'\0A\0A\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"--sym-arg\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"-sym-arg\00", align 1
@.str4 = private unnamed_addr constant [48 x i8] c"--sym-arg expects an integer argument <max-len>\00", align 1
@.str5 = private unnamed_addr constant [11 x i8] c"--sym-args\00", align 1
@.str6 = private unnamed_addr constant [10 x i8] c"-sym-args\00", align 1
@.str7 = private unnamed_addr constant [77 x i8] c"--sym-args expects three integer arguments <min-argvs> <max-argvs> <max-len>\00", align 1
@.str8 = private unnamed_addr constant [7 x i8] c"n_args\00", align 1
@.str9 = private unnamed_addr constant [12 x i8] c"--sym-files\00", align 1
@.str10 = private unnamed_addr constant [11 x i8] c"-sym-files\00", align 1
@.str11 = private unnamed_addr constant [72 x i8] c"--sym-files expects two integer arguments <no-sym-files> <sym-file-len>\00", align 1
@.str12 = private unnamed_addr constant [12 x i8] c"--sym-stdin\00", align 1
@.str13 = private unnamed_addr constant [11 x i8] c"-sym-stdin\00", align 1
@.str14 = private unnamed_addr constant [57 x i8] c"--sym-stdin expects one integer argument <sym-stdin-len>\00", align 1
@.str15 = private unnamed_addr constant [13 x i8] c"--sym-stdout\00", align 1
@.str16 = private unnamed_addr constant [12 x i8] c"-sym-stdout\00", align 1
@.str17 = private unnamed_addr constant [18 x i8] c"--save-all-writes\00", align 1
@.str18 = private unnamed_addr constant [17 x i8] c"-save-all-writes\00", align 1
@.str19 = private unnamed_addr constant [10 x i8] c"--fd-fail\00", align 1
@.str20 = private unnamed_addr constant [9 x i8] c"-fd-fail\00", align 1
@.str21 = private unnamed_addr constant [11 x i8] c"--max-fail\00", align 1
@.str22 = private unnamed_addr constant [10 x i8] c"-max-fail\00", align 1
@.str23 = private unnamed_addr constant [54 x i8] c"--max-fail expects an integer argument <max-failures>\00", align 1
@.str24 = private unnamed_addr constant [37 x i8] c"too many arguments for klee_init_env\00", align 1
@.str25 = private unnamed_addr constant [16 x i8] c"klee_init_env.c\00", align 1
@.str26 = private unnamed_addr constant [9 x i8] c"user.err\00", align 1

; Function Attrs: nounwind uwtable
define void @klee_init_env(i32* nocapture %argcPtr, i8*** nocapture %argvPtr) #0 {
  %new_argv = alloca [1024 x i8*], align 16
  %sym_arg_name = alloca [5 x i8], align 4
  call void @llvm.dbg.value(metadata !{i32* %argcPtr}, i64 0, metadata !16), !dbg !109
  call void @llvm.dbg.value(metadata !{i8*** %argvPtr}, i64 0, metadata !17), !dbg !109
  %1 = load i32* %argcPtr, align 4, !dbg !110, !tbaa !111
  call void @llvm.dbg.value(metadata !{i32 %1}, i64 0, metadata !18), !dbg !110
  %2 = load i8*** %argvPtr, align 8, !dbg !115, !tbaa !116
  call void @llvm.dbg.value(metadata !{i8** %2}, i64 0, metadata !19), !dbg !115
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !20), !dbg !118
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !20), !dbg !119
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !20), !dbg !120
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !20), !dbg !121
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !20), !dbg !122
  %3 = bitcast [1024 x i8*]* %new_argv to i8*, !dbg !123
  call void @llvm.lifetime.start(i64 8192, i8* %3) #2, !dbg !123
  call void @llvm.dbg.declare(metadata !{[1024 x i8*]* %new_argv}, metadata !22), !dbg !123
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !30), !dbg !124
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !31), !dbg !124
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !32), !dbg !125
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !33), !dbg !126
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !34), !dbg !127
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !35), !dbg !128
  call void @llvm.dbg.declare(metadata !{[5 x i8]* %sym_arg_name}, metadata !37), !dbg !129
  %4 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 0, !dbg !129
  %5 = bitcast [5 x i8]* %sym_arg_name to i32*, !dbg !129
  store i32 6779489, i32* %5, align 4, !dbg !129
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !41), !dbg !130
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !42), !dbg !131
  %6 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 4, !dbg !132
  store i8 0, i8* %6, align 4, !dbg !132, !tbaa !133
  %7 = icmp eq i32 %1, 2, !dbg !134
  br i1 %7, label %8, label %__streq.exit.thread.preheader, !dbg !134

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds i8** %2, i64 1, !dbg !134
  %10 = load i8** %9, align 8, !dbg !134, !tbaa !116
  tail call void @llvm.dbg.value(metadata !{i8* %10}, i64 0, metadata !136), !dbg !137
  tail call void @llvm.dbg.value(metadata !138, i64 0, metadata !139), !dbg !137
  %11 = load i8* %10, align 1, !dbg !140, !tbaa !133
  %12 = icmp eq i8 %11, 45, !dbg !140
  br i1 %12, label %.lr.ph.i, label %.lr.ph410, !dbg !140

.lr.ph.i:                                         ; preds = %8, %15
  %13 = phi i8 [ %18, %15 ], [ 45, %8 ]
  %.04.i = phi i8* [ %17, %15 ], [ getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), %8 ]
  %.013.i = phi i8* [ %16, %15 ], [ %10, %8 ]
  %14 = icmp eq i8 %13, 0, !dbg !141
  br i1 %14, label %23, label %15, !dbg !141

; <label>:15                                      ; preds = %.lr.ph.i
  %16 = getelementptr inbounds i8* %.013.i, i64 1, !dbg !144
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !136), !dbg !144
  %17 = getelementptr inbounds i8* %.04.i, i64 1, !dbg !145
  tail call void @llvm.dbg.value(metadata !{i8* %17}, i64 0, metadata !139), !dbg !145
  %18 = load i8* %16, align 1, !dbg !140, !tbaa !133
  %19 = load i8* %17, align 1, !dbg !140, !tbaa !133
  %20 = icmp eq i8 %18, %19, !dbg !140
  br i1 %20, label %.lr.ph.i, label %__streq.exit.thread.preheader, !dbg !140

__streq.exit.thread.preheader:                    ; preds = %15, %0
  %21 = icmp sgt i32 %1, 0, !dbg !146
  br i1 %21, label %.lr.ph410, label %__streq.exit.thread._crit_edge, !dbg !146

.lr.ph410:                                        ; preds = %8, %__streq.exit.thread.preheader
  %22 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 3, !dbg !147
  br label %24, !dbg !146

; <label>:23                                      ; preds = %.lr.ph.i
  call fastcc void @__emit_error(i8* getelementptr inbounds ([964 x i8]* @.str1, i64 0, i64 0)), !dbg !148
  unreachable

; <label>:24                                      ; preds = %.lr.ph410, %__streq.exit.thread.backedge
  %sym_files.0402 = phi i32 [ 0, %.lr.ph410 ], [ %sym_files.0.be, %__streq.exit.thread.backedge ]
  %sym_file_len.0394 = phi i32 [ 0, %.lr.ph410 ], [ %sym_file_len.0.be, %__streq.exit.thread.backedge ]
  %sym_stdin_len.0386 = phi i32 [ 0, %.lr.ph410 ], [ %sym_stdin_len.0.be, %__streq.exit.thread.backedge ]
  %sym_stdout_flag.0378 = phi i32 [ 0, %.lr.ph410 ], [ %sym_stdout_flag.0.be, %__streq.exit.thread.backedge ]
  %k.0369 = phi i32 [ 0, %.lr.ph410 ], [ %k.0.be, %__streq.exit.thread.backedge ]
  %sym_arg_num.0360 = phi i32 [ 0, %.lr.ph410 ], [ %sym_arg_num.0.be, %__streq.exit.thread.backedge ]
  %save_all_writes_flag.0352 = phi i32 [ 0, %.lr.ph410 ], [ %save_all_writes_flag.0.be, %__streq.exit.thread.backedge ]
  %fd_fail.0345 = phi i32 [ 0, %.lr.ph410 ], [ %fd_fail.0.be, %__streq.exit.thread.backedge ]
  %25 = phi i32 [ 0, %.lr.ph410 ], [ %.be, %__streq.exit.thread.backedge ]
  %26 = sext i32 %k.0369 to i64, !dbg !150
  %27 = getelementptr inbounds i8** %2, i64 %26, !dbg !150
  %28 = load i8** %27, align 8, !dbg !150, !tbaa !116
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !151), !dbg !152
  tail call void @llvm.dbg.value(metadata !153, i64 0, metadata !154), !dbg !152
  %29 = load i8* %28, align 1, !dbg !155, !tbaa !133
  %30 = icmp eq i8 %29, 45, !dbg !155
  br i1 %30, label %.lr.ph.i7, label %.loopexit162, !dbg !155

.lr.ph.i7:                                        ; preds = %24, %33
  %31 = phi i8 [ %36, %33 ], [ 45, %24 ]
  %.04.i5 = phi i8* [ %35, %33 ], [ getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), %24 ]
  %.013.i6 = phi i8* [ %34, %33 ], [ %28, %24 ]
  %32 = icmp eq i8 %31, 0, !dbg !156
  br i1 %32, label %__streq.exit9.thread124, label %33, !dbg !156

; <label>:33                                      ; preds = %.lr.ph.i7
  %34 = getelementptr inbounds i8* %.013.i6, i64 1, !dbg !157
  tail call void @llvm.dbg.value(metadata !{i8* %34}, i64 0, metadata !151), !dbg !157
  %35 = getelementptr inbounds i8* %.04.i5, i64 1, !dbg !158
  tail call void @llvm.dbg.value(metadata !{i8* %35}, i64 0, metadata !154), !dbg !158
  %36 = load i8* %34, align 1, !dbg !155, !tbaa !133
  %37 = load i8* %35, align 1, !dbg !155, !tbaa !133
  %38 = icmp eq i8 %36, %37, !dbg !155
  br i1 %38, label %.lr.ph.i7, label %.loopexit, !dbg !155

.loopexit:                                        ; preds = %33
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !151), !dbg !152
  tail call void @llvm.dbg.value(metadata !159, i64 0, metadata !154), !dbg !152
  br i1 %30, label %.lr.ph.i13, label %.loopexit162, !dbg !155

.lr.ph.i13:                                       ; preds = %.loopexit, %41
  %39 = phi i8 [ %44, %41 ], [ 45, %.loopexit ]
  %.04.i11 = phi i8* [ %43, %41 ], [ getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0), %.loopexit ]
  %.013.i12 = phi i8* [ %42, %41 ], [ %28, %.loopexit ]
  %40 = icmp eq i8 %39, 0, !dbg !156
  br i1 %40, label %__streq.exit9.thread124, label %41, !dbg !156

; <label>:41                                      ; preds = %.lr.ph.i13
  %42 = getelementptr inbounds i8* %.013.i12, i64 1, !dbg !157
  tail call void @llvm.dbg.value(metadata !{i8* %42}, i64 0, metadata !151), !dbg !157
  %43 = getelementptr inbounds i8* %.04.i11, i64 1, !dbg !158
  tail call void @llvm.dbg.value(metadata !{i8* %43}, i64 0, metadata !154), !dbg !158
  %44 = load i8* %42, align 1, !dbg !155, !tbaa !133
  %45 = load i8* %43, align 1, !dbg !155, !tbaa !133
  %46 = icmp eq i8 %44, %45, !dbg !155
  br i1 %46, label %.lr.ph.i13, label %.loopexit141, !dbg !155

__streq.exit9.thread124:                          ; preds = %.lr.ph.i13, %.lr.ph.i7
  call void @llvm.dbg.value(metadata !160, i64 0, metadata !44), !dbg !161
  %47 = add nsw i32 %k.0369, 1, !dbg !162
  call void @llvm.dbg.value(metadata !{i32 %47}, i64 0, metadata !42), !dbg !162
  %48 = icmp eq i32 %47, %1, !dbg !162
  br i1 %48, label %49, label %50, !dbg !162

; <label>:49                                      ; preds = %__streq.exit9.thread124
  call fastcc void @__emit_error(i8* getelementptr inbounds ([48 x i8]* @.str4, i64 0, i64 0)), !dbg !164
  unreachable

; <label>:50                                      ; preds = %__streq.exit9.thread124
  %51 = add nsw i32 %k.0369, 2, !dbg !165
  call void @llvm.dbg.value(metadata !{i32 %51}, i64 0, metadata !42), !dbg !165
  %52 = sext i32 %47 to i64, !dbg !165
  %53 = getelementptr inbounds i8** %2, i64 %52, !dbg !165
  %54 = load i8** %53, align 8, !dbg !165, !tbaa !116
  call void @llvm.dbg.value(metadata !{i8* %54}, i64 0, metadata !166) #2, !dbg !167
  call void @llvm.dbg.value(metadata !168, i64 0, metadata !169) #2, !dbg !167
  call void @llvm.dbg.value(metadata !170, i64 0, metadata !171) #2, !dbg !172
  %55 = load i8* %54, align 1, !dbg !173, !tbaa !133
  %56 = icmp eq i8 %55, 0, !dbg !173
  br i1 %56, label %57, label %.lr.ph.i19, !dbg !173

; <label>:57                                      ; preds = %50
  call fastcc void @__emit_error(i8* getelementptr inbounds ([48 x i8]* @.str4, i64 0, i64 0)) #2, !dbg !173
  unreachable

.lr.ph.i19:                                       ; preds = %50, %61
  %58 = phi i8 [ %66, %61 ], [ %55, %50 ]
  %s.pn.i16 = phi i8* [ %59, %61 ], [ %54, %50 ]
  %res.02.i17 = phi i64 [ %65, %61 ], [ 0, %50 ]
  %59 = getelementptr inbounds i8* %s.pn.i16, i64 1, !dbg !175
  %.off.i18 = add i8 %58, -48, !dbg !176
  %60 = icmp ult i8 %.off.i18, 10, !dbg !176
  br i1 %60, label %61, label %68, !dbg !176

; <label>:61                                      ; preds = %.lr.ph.i19
  %62 = sext i8 %58 to i64, !dbg !180
  %63 = mul nsw i64 %res.02.i17, 10, !dbg !181
  %64 = add i64 %62, -48, !dbg !181
  %65 = add i64 %64, %63, !dbg !181
  call void @llvm.dbg.value(metadata !{i64 %65}, i64 0, metadata !171) #2, !dbg !181
  call void @llvm.dbg.value(metadata !{i8* %59}, i64 0, metadata !166) #2, !dbg !175
  %66 = load i8* %59, align 1, !dbg !175, !tbaa !133
  call void @llvm.dbg.value(metadata !{i8 %58}, i64 0, metadata !183) #2, !dbg !175
  %67 = icmp eq i8 %66, 0, !dbg !175
  br i1 %67, label %__str_to_int.exit20, label %.lr.ph.i19, !dbg !175

; <label>:68                                      ; preds = %.lr.ph.i19
  call fastcc void @__emit_error(i8* getelementptr inbounds ([48 x i8]* @.str4, i64 0, i64 0)) #2, !dbg !184
  unreachable

__str_to_int.exit20:                              ; preds = %61
  %69 = trunc i64 %65 to i32, !dbg !165
  call void @llvm.dbg.value(metadata !{i32 %69}, i64 0, metadata !26), !dbg !165
  call void @llvm.dbg.value(metadata !{i32 %75}, i64 0, metadata !41), !dbg !147
  %70 = add i32 %sym_arg_num.0360, 48, !dbg !147
  %71 = trunc i32 %70 to i8, !dbg !147
  store i8 %71, i8* %22, align 1, !dbg !147, !tbaa !133
  %72 = call fastcc i8* @__get_sym_str(i32 %69, i8* %4), !dbg !186
  call void @llvm.dbg.value(metadata !187, i64 0, metadata !188) #2, !dbg !190
  %73 = icmp eq i32 %25, 1024, !dbg !191
  br i1 %73, label %74, label %__add_arg.exit21, !dbg !191

; <label>:74                                      ; preds = %__str_to_int.exit20
  call fastcc void @__emit_error(i8* getelementptr inbounds ([37 x i8]* @.str24, i64 0, i64 0)) #2, !dbg !193
  unreachable

__add_arg.exit21:                                 ; preds = %__str_to_int.exit20
  %75 = add i32 %sym_arg_num.0360, 1, !dbg !147
  %76 = sext i32 %25 to i64, !dbg !195
  %77 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %76, !dbg !195
  store i8* %72, i8** %77, align 8, !dbg !195, !tbaa !116
  %78 = add nsw i32 %25, 1, !dbg !197
  call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !20), !dbg !197
  call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !20), !dbg !119
  call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !20), !dbg !120
  call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !20), !dbg !121
  call void @llvm.dbg.value(metadata !{i32 %78}, i64 0, metadata !20), !dbg !122
  br label %__streq.exit.thread.backedge, !dbg !198

.loopexit141:                                     ; preds = %41
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !199), !dbg !201
  tail call void @llvm.dbg.value(metadata !202, i64 0, metadata !203), !dbg !201
  br i1 %30, label %.lr.ph.i24, label %.loopexit162, !dbg !204

.lr.ph.i24:                                       ; preds = %.loopexit141, %81
  %79 = phi i8 [ %84, %81 ], [ 45, %.loopexit141 ]
  %.04.i22 = phi i8* [ %83, %81 ], [ getelementptr inbounds ([11 x i8]* @.str5, i64 0, i64 0), %.loopexit141 ]
  %.013.i23 = phi i8* [ %82, %81 ], [ %28, %.loopexit141 ]
  %80 = icmp eq i8 %79, 0, !dbg !205
  br i1 %80, label %__streq.exit26.thread126, label %81, !dbg !205

; <label>:81                                      ; preds = %.lr.ph.i24
  %82 = getelementptr inbounds i8* %.013.i23, i64 1, !dbg !206
  tail call void @llvm.dbg.value(metadata !{i8* %82}, i64 0, metadata !199), !dbg !206
  %83 = getelementptr inbounds i8* %.04.i22, i64 1, !dbg !207
  tail call void @llvm.dbg.value(metadata !{i8* %83}, i64 0, metadata !203), !dbg !207
  %84 = load i8* %82, align 1, !dbg !204, !tbaa !133
  %85 = load i8* %83, align 1, !dbg !204, !tbaa !133
  %86 = icmp eq i8 %84, %85, !dbg !204
  br i1 %86, label %.lr.ph.i24, label %.loopexit142, !dbg !204

.loopexit142:                                     ; preds = %81
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !199), !dbg !201
  tail call void @llvm.dbg.value(metadata !208, i64 0, metadata !203), !dbg !201
  br i1 %30, label %.lr.ph.i29, label %.loopexit162, !dbg !204

.lr.ph.i29:                                       ; preds = %.loopexit142, %89
  %87 = phi i8 [ %92, %89 ], [ 45, %.loopexit142 ]
  %.04.i27 = phi i8* [ %91, %89 ], [ getelementptr inbounds ([10 x i8]* @.str6, i64 0, i64 0), %.loopexit142 ]
  %.013.i28 = phi i8* [ %90, %89 ], [ %28, %.loopexit142 ]
  %88 = icmp eq i8 %87, 0, !dbg !205
  br i1 %88, label %__streq.exit26.thread126, label %89, !dbg !205

; <label>:89                                      ; preds = %.lr.ph.i29
  %90 = getelementptr inbounds i8* %.013.i28, i64 1, !dbg !206
  tail call void @llvm.dbg.value(metadata !{i8* %90}, i64 0, metadata !199), !dbg !206
  %91 = getelementptr inbounds i8* %.04.i27, i64 1, !dbg !207
  tail call void @llvm.dbg.value(metadata !{i8* %91}, i64 0, metadata !203), !dbg !207
  %92 = load i8* %90, align 1, !dbg !204, !tbaa !133
  %93 = load i8* %91, align 1, !dbg !204, !tbaa !133
  %94 = icmp eq i8 %92, %93, !dbg !204
  br i1 %94, label %.lr.ph.i29, label %.loopexit144, !dbg !204

__streq.exit26.thread126:                         ; preds = %.lr.ph.i29, %.lr.ph.i24
  call void @llvm.dbg.value(metadata !209, i64 0, metadata !50), !dbg !210
  %95 = add nsw i32 %k.0369, 3, !dbg !211
  %96 = icmp slt i32 %95, %1, !dbg !211
  br i1 %96, label %98, label %97, !dbg !211

; <label>:97                                      ; preds = %__streq.exit26.thread126
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)), !dbg !213
  unreachable

; <label>:98                                      ; preds = %__streq.exit26.thread126
  %99 = add nsw i32 %k.0369, 1, !dbg !214
  call void @llvm.dbg.value(metadata !{i32 %99}, i64 0, metadata !42), !dbg !214
  %100 = add nsw i32 %k.0369, 2, !dbg !215
  call void @llvm.dbg.value(metadata !{i32 %100}, i64 0, metadata !42), !dbg !215
  %101 = sext i32 %99 to i64, !dbg !215
  %102 = getelementptr inbounds i8** %2, i64 %101, !dbg !215
  %103 = load i8** %102, align 8, !dbg !215, !tbaa !116
  call void @llvm.dbg.value(metadata !{i8* %103}, i64 0, metadata !216) #2, !dbg !217
  call void @llvm.dbg.value(metadata !218, i64 0, metadata !219) #2, !dbg !217
  call void @llvm.dbg.value(metadata !170, i64 0, metadata !220) #2, !dbg !221
  %104 = load i8* %103, align 1, !dbg !222, !tbaa !133
  %105 = icmp eq i8 %104, 0, !dbg !222
  br i1 %105, label %106, label %.lr.ph.i35, !dbg !222

; <label>:106                                     ; preds = %98
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !222
  unreachable

.lr.ph.i35:                                       ; preds = %98, %110
  %107 = phi i8 [ %115, %110 ], [ %104, %98 ]
  %s.pn.i32 = phi i8* [ %108, %110 ], [ %103, %98 ]
  %res.02.i33 = phi i64 [ %114, %110 ], [ 0, %98 ]
  %108 = getelementptr inbounds i8* %s.pn.i32, i64 1, !dbg !223
  %.off.i34 = add i8 %107, -48, !dbg !224
  %109 = icmp ult i8 %.off.i34, 10, !dbg !224
  br i1 %109, label %110, label %117, !dbg !224

; <label>:110                                     ; preds = %.lr.ph.i35
  %111 = sext i8 %107 to i64, !dbg !225
  %112 = mul nsw i64 %res.02.i33, 10, !dbg !226
  %113 = add i64 %111, -48, !dbg !226
  %114 = add i64 %113, %112, !dbg !226
  call void @llvm.dbg.value(metadata !{i64 %114}, i64 0, metadata !220) #2, !dbg !226
  call void @llvm.dbg.value(metadata !{i8* %108}, i64 0, metadata !216) #2, !dbg !223
  %115 = load i8* %108, align 1, !dbg !223, !tbaa !133
  call void @llvm.dbg.value(metadata !{i8 %107}, i64 0, metadata !227) #2, !dbg !223
  %116 = icmp eq i8 %115, 0, !dbg !223
  br i1 %116, label %__str_to_int.exit36, label %.lr.ph.i35, !dbg !223

; <label>:117                                     ; preds = %.lr.ph.i35
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !228
  unreachable

__str_to_int.exit36:                              ; preds = %110
  %118 = trunc i64 %114 to i32, !dbg !215
  call void @llvm.dbg.value(metadata !{i32 %118}, i64 0, metadata !28), !dbg !215
  call void @llvm.dbg.value(metadata !{i32 %95}, i64 0, metadata !42), !dbg !229
  %119 = sext i32 %100 to i64, !dbg !229
  %120 = getelementptr inbounds i8** %2, i64 %119, !dbg !229
  %121 = load i8** %120, align 8, !dbg !229, !tbaa !116
  call void @llvm.dbg.value(metadata !{i8* %121}, i64 0, metadata !230) #2, !dbg !231
  call void @llvm.dbg.value(metadata !218, i64 0, metadata !232) #2, !dbg !231
  call void @llvm.dbg.value(metadata !170, i64 0, metadata !233) #2, !dbg !234
  %122 = load i8* %121, align 1, !dbg !235, !tbaa !133
  %123 = icmp eq i8 %122, 0, !dbg !235
  br i1 %123, label %124, label %.lr.ph.i40, !dbg !235

; <label>:124                                     ; preds = %__str_to_int.exit36
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !235
  unreachable

.lr.ph.i40:                                       ; preds = %__str_to_int.exit36, %128
  %125 = phi i8 [ %133, %128 ], [ %122, %__str_to_int.exit36 ]
  %s.pn.i37 = phi i8* [ %126, %128 ], [ %121, %__str_to_int.exit36 ]
  %res.02.i38 = phi i64 [ %132, %128 ], [ 0, %__str_to_int.exit36 ]
  %126 = getelementptr inbounds i8* %s.pn.i37, i64 1, !dbg !236
  %.off.i39 = add i8 %125, -48, !dbg !237
  %127 = icmp ult i8 %.off.i39, 10, !dbg !237
  br i1 %127, label %128, label %135, !dbg !237

; <label>:128                                     ; preds = %.lr.ph.i40
  %129 = sext i8 %125 to i64, !dbg !238
  %130 = mul nsw i64 %res.02.i38, 10, !dbg !239
  %131 = add i64 %129, -48, !dbg !239
  %132 = add i64 %131, %130, !dbg !239
  call void @llvm.dbg.value(metadata !{i64 %132}, i64 0, metadata !233) #2, !dbg !239
  call void @llvm.dbg.value(metadata !{i8* %126}, i64 0, metadata !230) #2, !dbg !236
  %133 = load i8* %126, align 1, !dbg !236, !tbaa !133
  call void @llvm.dbg.value(metadata !{i8 %125}, i64 0, metadata !240) #2, !dbg !236
  %134 = icmp eq i8 %133, 0, !dbg !236
  br i1 %134, label %__str_to_int.exit41, label %.lr.ph.i40, !dbg !236

; <label>:135                                     ; preds = %.lr.ph.i40
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !241
  unreachable

__str_to_int.exit41:                              ; preds = %128
  %136 = trunc i64 %132 to i32, !dbg !229
  call void @llvm.dbg.value(metadata !{i32 %136}, i64 0, metadata !29), !dbg !229
  %137 = add nsw i32 %k.0369, 4, !dbg !242
  call void @llvm.dbg.value(metadata !{i32 %137}, i64 0, metadata !42), !dbg !242
  %138 = sext i32 %95 to i64, !dbg !242
  %139 = getelementptr inbounds i8** %2, i64 %138, !dbg !242
  %140 = load i8** %139, align 8, !dbg !242, !tbaa !116
  call void @llvm.dbg.value(metadata !{i8* %140}, i64 0, metadata !243) #2, !dbg !244
  call void @llvm.dbg.value(metadata !218, i64 0, metadata !245) #2, !dbg !244
  call void @llvm.dbg.value(metadata !170, i64 0, metadata !246) #2, !dbg !247
  %141 = load i8* %140, align 1, !dbg !248, !tbaa !133
  %142 = icmp eq i8 %141, 0, !dbg !248
  br i1 %142, label %143, label %.lr.ph.i45, !dbg !248

; <label>:143                                     ; preds = %__str_to_int.exit41
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !248
  unreachable

.lr.ph.i45:                                       ; preds = %__str_to_int.exit41, %147
  %144 = phi i8 [ %152, %147 ], [ %141, %__str_to_int.exit41 ]
  %s.pn.i42 = phi i8* [ %145, %147 ], [ %140, %__str_to_int.exit41 ]
  %res.02.i43 = phi i64 [ %151, %147 ], [ 0, %__str_to_int.exit41 ]
  %145 = getelementptr inbounds i8* %s.pn.i42, i64 1, !dbg !249
  %.off.i44 = add i8 %144, -48, !dbg !250
  %146 = icmp ult i8 %.off.i44, 10, !dbg !250
  br i1 %146, label %147, label %154, !dbg !250

; <label>:147                                     ; preds = %.lr.ph.i45
  %148 = sext i8 %144 to i64, !dbg !251
  %149 = mul nsw i64 %res.02.i43, 10, !dbg !252
  %150 = add i64 %148, -48, !dbg !252
  %151 = add i64 %150, %149, !dbg !252
  call void @llvm.dbg.value(metadata !{i64 %151}, i64 0, metadata !246) #2, !dbg !252
  call void @llvm.dbg.value(metadata !{i8* %145}, i64 0, metadata !243) #2, !dbg !249
  %152 = load i8* %145, align 1, !dbg !249, !tbaa !133
  call void @llvm.dbg.value(metadata !{i8 %144}, i64 0, metadata !253) #2, !dbg !249
  %153 = icmp eq i8 %152, 0, !dbg !249
  br i1 %153, label %__str_to_int.exit46, label %.lr.ph.i45, !dbg !249

; <label>:154                                     ; preds = %.lr.ph.i45
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !254
  unreachable

__str_to_int.exit46:                              ; preds = %147
  %155 = trunc i64 %151 to i32, !dbg !242
  call void @llvm.dbg.value(metadata !{i32 %155}, i64 0, metadata !26), !dbg !242
  %156 = add i32 %136, 1, !dbg !255
  %157 = call i32 @klee_range(i32 %118, i32 %156, i8* getelementptr inbounds ([7 x i8]* @.str8, i64 0, i64 0)) #2, !dbg !255
  call void @llvm.dbg.value(metadata !{i32 %157}, i64 0, metadata !21), !dbg !255
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !43), !dbg !256
  %158 = icmp sgt i32 %157, 0, !dbg !256
  br i1 %158, label %.lr.ph, label %__streq.exit.thread.backedge, !dbg !256

.lr.ph:                                           ; preds = %__str_to_int.exit46
  %159 = sext i32 %25 to i64
  br label %160, !dbg !256

; <label>:160                                     ; preds = %.lr.ph, %__add_arg.exit47
  %indvars.iv = phi i64 [ %159, %.lr.ph ], [ %indvars.iv.next, %__add_arg.exit47 ]
  %i.0173 = phi i32 [ 0, %.lr.ph ], [ %171, %__add_arg.exit47 ]
  %sym_arg_num.1172 = phi i32 [ %sym_arg_num.0360, %.lr.ph ], [ %168, %__add_arg.exit47 ]
  %161 = phi i32 [ %25, %.lr.ph ], [ %170, %__add_arg.exit47 ]
  call void @llvm.dbg.value(metadata !{i32 %168}, i64 0, metadata !41), !dbg !258
  %162 = add i32 %sym_arg_num.1172, 48, !dbg !258
  %163 = trunc i32 %162 to i8, !dbg !258
  store i8 %163, i8* %22, align 1, !dbg !258, !tbaa !133
  %164 = call fastcc i8* @__get_sym_str(i32 %155, i8* %4), !dbg !260
  call void @llvm.dbg.value(metadata !187, i64 0, metadata !261) #2, !dbg !263
  %165 = trunc i64 %indvars.iv to i32, !dbg !264
  %166 = icmp eq i32 %165, 1024, !dbg !264
  br i1 %166, label %167, label %__add_arg.exit47, !dbg !264

; <label>:167                                     ; preds = %160
  call fastcc void @__emit_error(i8* getelementptr inbounds ([37 x i8]* @.str24, i64 0, i64 0)) #2, !dbg !265
  unreachable

__add_arg.exit47:                                 ; preds = %160
  %168 = add i32 %sym_arg_num.1172, 1, !dbg !258
  %169 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %indvars.iv, !dbg !266
  store i8* %164, i8** %169, align 8, !dbg !266, !tbaa !116
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !256
  %170 = add nsw i32 %161, 1, !dbg !267
  call void @llvm.dbg.value(metadata !{i32 %170}, i64 0, metadata !20), !dbg !267
  call void @llvm.dbg.value(metadata !{i32 %170}, i64 0, metadata !20), !dbg !119
  call void @llvm.dbg.value(metadata !{i32 %170}, i64 0, metadata !20), !dbg !120
  call void @llvm.dbg.value(metadata !{i32 %170}, i64 0, metadata !20), !dbg !121
  call void @llvm.dbg.value(metadata !{i32 %170}, i64 0, metadata !20), !dbg !122
  %171 = add nsw i32 %i.0173, 1, !dbg !256
  call void @llvm.dbg.value(metadata !{i32 %171}, i64 0, metadata !43), !dbg !256
  %172 = icmp slt i32 %171, %157, !dbg !256
  br i1 %172, label %160, label %__streq.exit.thread.backedge, !dbg !256

.loopexit144:                                     ; preds = %89
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !268), !dbg !270
  tail call void @llvm.dbg.value(metadata !271, i64 0, metadata !272), !dbg !270
  br i1 %30, label %.lr.ph.i50, label %.loopexit162, !dbg !273

.lr.ph.i50:                                       ; preds = %.loopexit144, %175
  %173 = phi i8 [ %178, %175 ], [ 45, %.loopexit144 ]
  %.04.i48 = phi i8* [ %177, %175 ], [ getelementptr inbounds ([12 x i8]* @.str9, i64 0, i64 0), %.loopexit144 ]
  %.013.i49 = phi i8* [ %176, %175 ], [ %28, %.loopexit144 ]
  %174 = icmp eq i8 %173, 0, !dbg !274
  br i1 %174, label %__streq.exit52.thread128, label %175, !dbg !274

; <label>:175                                     ; preds = %.lr.ph.i50
  %176 = getelementptr inbounds i8* %.013.i49, i64 1, !dbg !275
  tail call void @llvm.dbg.value(metadata !{i8* %176}, i64 0, metadata !268), !dbg !275
  %177 = getelementptr inbounds i8* %.04.i48, i64 1, !dbg !276
  tail call void @llvm.dbg.value(metadata !{i8* %177}, i64 0, metadata !272), !dbg !276
  %178 = load i8* %176, align 1, !dbg !273, !tbaa !133
  %179 = load i8* %177, align 1, !dbg !273, !tbaa !133
  %180 = icmp eq i8 %178, %179, !dbg !273
  br i1 %180, label %.lr.ph.i50, label %.loopexit145, !dbg !273

.loopexit145:                                     ; preds = %175
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !268), !dbg !270
  tail call void @llvm.dbg.value(metadata !277, i64 0, metadata !272), !dbg !270
  br i1 %30, label %.lr.ph.i55, label %.loopexit162, !dbg !273

.lr.ph.i55:                                       ; preds = %.loopexit145, %183
  %181 = phi i8 [ %186, %183 ], [ 45, %.loopexit145 ]
  %.04.i53 = phi i8* [ %185, %183 ], [ getelementptr inbounds ([11 x i8]* @.str10, i64 0, i64 0), %.loopexit145 ]
  %.013.i54 = phi i8* [ %184, %183 ], [ %28, %.loopexit145 ]
  %182 = icmp eq i8 %181, 0, !dbg !274
  br i1 %182, label %__streq.exit52.thread128, label %183, !dbg !274

; <label>:183                                     ; preds = %.lr.ph.i55
  %184 = getelementptr inbounds i8* %.013.i54, i64 1, !dbg !275
  tail call void @llvm.dbg.value(metadata !{i8* %184}, i64 0, metadata !268), !dbg !275
  %185 = getelementptr inbounds i8* %.04.i53, i64 1, !dbg !276
  tail call void @llvm.dbg.value(metadata !{i8* %185}, i64 0, metadata !272), !dbg !276
  %186 = load i8* %184, align 1, !dbg !273, !tbaa !133
  %187 = load i8* %185, align 1, !dbg !273, !tbaa !133
  %188 = icmp eq i8 %186, %187, !dbg !273
  br i1 %188, label %.lr.ph.i55, label %.loopexit147, !dbg !273

__streq.exit52.thread128:                         ; preds = %.lr.ph.i55, %.lr.ph.i50
  call void @llvm.dbg.value(metadata !278, i64 0, metadata !53), !dbg !279
  %189 = add nsw i32 %k.0369, 2, !dbg !280
  %190 = icmp slt i32 %189, %1, !dbg !280
  br i1 %190, label %192, label %191, !dbg !280

; <label>:191                                     ; preds = %__streq.exit52.thread128
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)), !dbg !282
  unreachable

; <label>:192                                     ; preds = %__streq.exit52.thread128
  %193 = add nsw i32 %k.0369, 1, !dbg !283
  call void @llvm.dbg.value(metadata !{i32 %193}, i64 0, metadata !42), !dbg !283
  call void @llvm.dbg.value(metadata !{i32 %189}, i64 0, metadata !42), !dbg !284
  %194 = sext i32 %193 to i64, !dbg !284
  %195 = getelementptr inbounds i8** %2, i64 %194, !dbg !284
  %196 = load i8** %195, align 8, !dbg !284, !tbaa !116
  call void @llvm.dbg.value(metadata !{i8* %196}, i64 0, metadata !285) #2, !dbg !286
  call void @llvm.dbg.value(metadata !287, i64 0, metadata !288) #2, !dbg !286
  call void @llvm.dbg.value(metadata !170, i64 0, metadata !289) #2, !dbg !290
  %197 = load i8* %196, align 1, !dbg !291, !tbaa !133
  %198 = icmp eq i8 %197, 0, !dbg !291
  br i1 %198, label %199, label %.lr.ph.i61, !dbg !291

; <label>:199                                     ; preds = %192
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)) #2, !dbg !291
  unreachable

.lr.ph.i61:                                       ; preds = %192, %203
  %200 = phi i8 [ %208, %203 ], [ %197, %192 ]
  %s.pn.i58 = phi i8* [ %201, %203 ], [ %196, %192 ]
  %res.02.i59 = phi i64 [ %207, %203 ], [ 0, %192 ]
  %201 = getelementptr inbounds i8* %s.pn.i58, i64 1, !dbg !292
  %.off.i60 = add i8 %200, -48, !dbg !293
  %202 = icmp ult i8 %.off.i60, 10, !dbg !293
  br i1 %202, label %203, label %210, !dbg !293

; <label>:203                                     ; preds = %.lr.ph.i61
  %204 = sext i8 %200 to i64, !dbg !294
  %205 = mul nsw i64 %res.02.i59, 10, !dbg !295
  %206 = add i64 %204, -48, !dbg !295
  %207 = add i64 %206, %205, !dbg !295
  call void @llvm.dbg.value(metadata !{i64 %207}, i64 0, metadata !289) #2, !dbg !295
  call void @llvm.dbg.value(metadata !{i8* %201}, i64 0, metadata !285) #2, !dbg !292
  %208 = load i8* %201, align 1, !dbg !292, !tbaa !133
  call void @llvm.dbg.value(metadata !{i8 %200}, i64 0, metadata !296) #2, !dbg !292
  %209 = icmp eq i8 %208, 0, !dbg !292
  br i1 %209, label %__str_to_int.exit62, label %.lr.ph.i61, !dbg !292

; <label>:210                                     ; preds = %.lr.ph.i61
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)) #2, !dbg !297
  unreachable

__str_to_int.exit62:                              ; preds = %203
  %211 = trunc i64 %207 to i32, !dbg !284
  call void @llvm.dbg.value(metadata !{i32 %211}, i64 0, metadata !30), !dbg !284
  %212 = add nsw i32 %k.0369, 3, !dbg !298
  call void @llvm.dbg.value(metadata !{i32 %212}, i64 0, metadata !42), !dbg !298
  %213 = sext i32 %189 to i64, !dbg !298
  %214 = getelementptr inbounds i8** %2, i64 %213, !dbg !298
  %215 = load i8** %214, align 8, !dbg !298, !tbaa !116
  call void @llvm.dbg.value(metadata !{i8* %215}, i64 0, metadata !299) #2, !dbg !300
  call void @llvm.dbg.value(metadata !287, i64 0, metadata !301) #2, !dbg !300
  call void @llvm.dbg.value(metadata !170, i64 0, metadata !302) #2, !dbg !303
  %216 = load i8* %215, align 1, !dbg !304, !tbaa !133
  %217 = icmp eq i8 %216, 0, !dbg !304
  br i1 %217, label %218, label %.lr.ph.i66, !dbg !304

; <label>:218                                     ; preds = %__str_to_int.exit62
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)) #2, !dbg !304
  unreachable

.lr.ph.i66:                                       ; preds = %__str_to_int.exit62, %222
  %219 = phi i8 [ %227, %222 ], [ %216, %__str_to_int.exit62 ]
  %s.pn.i63 = phi i8* [ %220, %222 ], [ %215, %__str_to_int.exit62 ]
  %res.02.i64 = phi i64 [ %226, %222 ], [ 0, %__str_to_int.exit62 ]
  %220 = getelementptr inbounds i8* %s.pn.i63, i64 1, !dbg !305
  %.off.i65 = add i8 %219, -48, !dbg !306
  %221 = icmp ult i8 %.off.i65, 10, !dbg !306
  br i1 %221, label %222, label %229, !dbg !306

; <label>:222                                     ; preds = %.lr.ph.i66
  %223 = sext i8 %219 to i64, !dbg !307
  %224 = mul nsw i64 %res.02.i64, 10, !dbg !308
  %225 = add i64 %223, -48, !dbg !308
  %226 = add i64 %225, %224, !dbg !308
  call void @llvm.dbg.value(metadata !{i64 %226}, i64 0, metadata !302) #2, !dbg !308
  call void @llvm.dbg.value(metadata !{i8* %220}, i64 0, metadata !299) #2, !dbg !305
  %227 = load i8* %220, align 1, !dbg !305, !tbaa !133
  call void @llvm.dbg.value(metadata !{i8 %219}, i64 0, metadata !309) #2, !dbg !305
  %228 = icmp eq i8 %227, 0, !dbg !305
  br i1 %228, label %__str_to_int.exit67, label %.lr.ph.i66, !dbg !305

; <label>:229                                     ; preds = %.lr.ph.i66
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)) #2, !dbg !310
  unreachable

__str_to_int.exit67:                              ; preds = %222
  %230 = trunc i64 %226 to i32, !dbg !298
  call void @llvm.dbg.value(metadata !{i32 %230}, i64 0, metadata !31), !dbg !298
  br label %__streq.exit.thread.backedge, !dbg !311

.loopexit147:                                     ; preds = %183
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !312), !dbg !314
  tail call void @llvm.dbg.value(metadata !315, i64 0, metadata !316), !dbg !314
  br i1 %30, label %.lr.ph.i70, label %.loopexit162, !dbg !317

.lr.ph.i70:                                       ; preds = %.loopexit147, %233
  %231 = phi i8 [ %236, %233 ], [ 45, %.loopexit147 ]
  %.04.i68 = phi i8* [ %235, %233 ], [ getelementptr inbounds ([12 x i8]* @.str12, i64 0, i64 0), %.loopexit147 ]
  %.013.i69 = phi i8* [ %234, %233 ], [ %28, %.loopexit147 ]
  %232 = icmp eq i8 %231, 0, !dbg !318
  br i1 %232, label %__streq.exit72.thread130, label %233, !dbg !318

; <label>:233                                     ; preds = %.lr.ph.i70
  %234 = getelementptr inbounds i8* %.013.i69, i64 1, !dbg !319
  tail call void @llvm.dbg.value(metadata !{i8* %234}, i64 0, metadata !312), !dbg !319
  %235 = getelementptr inbounds i8* %.04.i68, i64 1, !dbg !320
  tail call void @llvm.dbg.value(metadata !{i8* %235}, i64 0, metadata !316), !dbg !320
  %236 = load i8* %234, align 1, !dbg !317, !tbaa !133
  %237 = load i8* %235, align 1, !dbg !317, !tbaa !133
  %238 = icmp eq i8 %236, %237, !dbg !317
  br i1 %238, label %.lr.ph.i70, label %.loopexit148, !dbg !317

.loopexit148:                                     ; preds = %233
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !321), !dbg !323
  tail call void @llvm.dbg.value(metadata !324, i64 0, metadata !325), !dbg !323
  br i1 %30, label %.lr.ph.i75, label %.loopexit162, !dbg !326

.lr.ph.i75:                                       ; preds = %.loopexit148, %241
  %239 = phi i8 [ %244, %241 ], [ 45, %.loopexit148 ]
  %.04.i73 = phi i8* [ %243, %241 ], [ getelementptr inbounds ([11 x i8]* @.str13, i64 0, i64 0), %.loopexit148 ]
  %.013.i74 = phi i8* [ %242, %241 ], [ %28, %.loopexit148 ]
  %240 = icmp eq i8 %239, 0, !dbg !327
  br i1 %240, label %__streq.exit72.thread130, label %241, !dbg !327

; <label>:241                                     ; preds = %.lr.ph.i75
  %242 = getelementptr inbounds i8* %.013.i74, i64 1, !dbg !328
  tail call void @llvm.dbg.value(metadata !{i8* %242}, i64 0, metadata !321), !dbg !328
  %243 = getelementptr inbounds i8* %.04.i73, i64 1, !dbg !329
  tail call void @llvm.dbg.value(metadata !{i8* %243}, i64 0, metadata !325), !dbg !329
  %244 = load i8* %242, align 1, !dbg !326, !tbaa !133
  %245 = load i8* %243, align 1, !dbg !326, !tbaa !133
  %246 = icmp eq i8 %244, %245, !dbg !326
  br i1 %246, label %.lr.ph.i75, label %.loopexit150, !dbg !326

__streq.exit72.thread130:                         ; preds = %.lr.ph.i75, %.lr.ph.i70
  call void @llvm.dbg.value(metadata !330, i64 0, metadata !56), !dbg !331
  %247 = add nsw i32 %k.0369, 1, !dbg !332
  call void @llvm.dbg.value(metadata !{i32 %247}, i64 0, metadata !42), !dbg !332
  %248 = icmp eq i32 %247, %1, !dbg !332
  br i1 %248, label %249, label %250, !dbg !332

; <label>:249                                     ; preds = %__streq.exit72.thread130
  call fastcc void @__emit_error(i8* getelementptr inbounds ([57 x i8]* @.str14, i64 0, i64 0)), !dbg !334
  unreachable

; <label>:250                                     ; preds = %__streq.exit72.thread130
  %251 = add nsw i32 %k.0369, 2, !dbg !335
  call void @llvm.dbg.value(metadata !{i32 %251}, i64 0, metadata !42), !dbg !335
  %252 = sext i32 %247 to i64, !dbg !335
  %253 = getelementptr inbounds i8** %2, i64 %252, !dbg !335
  %254 = load i8** %253, align 8, !dbg !335, !tbaa !116
  call void @llvm.dbg.value(metadata !{i8* %254}, i64 0, metadata !336) #2, !dbg !337
  call void @llvm.dbg.value(metadata !338, i64 0, metadata !339) #2, !dbg !337
  call void @llvm.dbg.value(metadata !170, i64 0, metadata !340) #2, !dbg !341
  %255 = load i8* %254, align 1, !dbg !342, !tbaa !133
  %256 = icmp eq i8 %255, 0, !dbg !342
  br i1 %256, label %257, label %.lr.ph.i81, !dbg !342

; <label>:257                                     ; preds = %250
  call fastcc void @__emit_error(i8* getelementptr inbounds ([57 x i8]* @.str14, i64 0, i64 0)) #2, !dbg !342
  unreachable

.lr.ph.i81:                                       ; preds = %250, %261
  %258 = phi i8 [ %266, %261 ], [ %255, %250 ]
  %s.pn.i78 = phi i8* [ %259, %261 ], [ %254, %250 ]
  %res.02.i79 = phi i64 [ %265, %261 ], [ 0, %250 ]
  %259 = getelementptr inbounds i8* %s.pn.i78, i64 1, !dbg !343
  %.off.i80 = add i8 %258, -48, !dbg !344
  %260 = icmp ult i8 %.off.i80, 10, !dbg !344
  br i1 %260, label %261, label %268, !dbg !344

; <label>:261                                     ; preds = %.lr.ph.i81
  %262 = sext i8 %258 to i64, !dbg !345
  %263 = mul nsw i64 %res.02.i79, 10, !dbg !346
  %264 = add i64 %262, -48, !dbg !346
  %265 = add i64 %264, %263, !dbg !346
  call void @llvm.dbg.value(metadata !{i64 %265}, i64 0, metadata !340) #2, !dbg !346
  call void @llvm.dbg.value(metadata !{i8* %259}, i64 0, metadata !336) #2, !dbg !343
  %266 = load i8* %259, align 1, !dbg !343, !tbaa !133
  call void @llvm.dbg.value(metadata !{i8 %258}, i64 0, metadata !347) #2, !dbg !343
  %267 = icmp eq i8 %266, 0, !dbg !343
  br i1 %267, label %__str_to_int.exit82, label %.lr.ph.i81, !dbg !343

; <label>:268                                     ; preds = %.lr.ph.i81
  call fastcc void @__emit_error(i8* getelementptr inbounds ([57 x i8]* @.str14, i64 0, i64 0)) #2, !dbg !348
  unreachable

__str_to_int.exit82:                              ; preds = %261
  %269 = trunc i64 %265 to i32, !dbg !335
  call void @llvm.dbg.value(metadata !{i32 %269}, i64 0, metadata !32), !dbg !335
  br label %__streq.exit.thread.backedge, !dbg !349

__streq.exit.thread.backedge:                     ; preds = %__add_arg.exit47, %__str_to_int.exit46, %__str_to_int.exit82, %__streq.exit97.thread134, %__str_to_int.exit, %__add_arg.exit, %__streq.exit117.thread136, %__streq.exit87.thread132, %__str_to_int.exit67, %__add_arg.exit21
  %.be = phi i32 [ %78, %__add_arg.exit21 ], [ %25, %__str_to_int.exit67 ], [ %25, %__str_to_int.exit82 ], [ %25, %__streq.exit87.thread132 ], [ %25, %__streq.exit97.thread134 ], [ %25, %__streq.exit117.thread136 ], [ %25, %__str_to_int.exit ], [ %366, %__add_arg.exit ], [ %25, %__str_to_int.exit46 ], [ %170, %__add_arg.exit47 ]
  %fd_fail.0.be = phi i32 [ %fd_fail.0345, %__add_arg.exit21 ], [ %fd_fail.0345, %__str_to_int.exit67 ], [ %fd_fail.0345, %__str_to_int.exit82 ], [ %fd_fail.0345, %__streq.exit87.thread132 ], [ %fd_fail.0345, %__streq.exit97.thread134 ], [ 1, %__streq.exit117.thread136 ], [ %360, %__str_to_int.exit ], [ %fd_fail.0345, %__add_arg.exit ], [ %fd_fail.0345, %__str_to_int.exit46 ], [ %fd_fail.0345, %__add_arg.exit47 ]
  %save_all_writes_flag.0.be = phi i32 [ %save_all_writes_flag.0352, %__add_arg.exit21 ], [ %save_all_writes_flag.0352, %__str_to_int.exit67 ], [ %save_all_writes_flag.0352, %__str_to_int.exit82 ], [ %save_all_writes_flag.0352, %__streq.exit87.thread132 ], [ 1, %__streq.exit97.thread134 ], [ %save_all_writes_flag.0352, %__streq.exit117.thread136 ], [ %save_all_writes_flag.0352, %__str_to_int.exit ], [ %save_all_writes_flag.0352, %__add_arg.exit ], [ %save_all_writes_flag.0352, %__str_to_int.exit46 ], [ %save_all_writes_flag.0352, %__add_arg.exit47 ]
  %sym_arg_num.0.be = phi i32 [ %75, %__add_arg.exit21 ], [ %sym_arg_num.0360, %__str_to_int.exit67 ], [ %sym_arg_num.0360, %__str_to_int.exit82 ], [ %sym_arg_num.0360, %__streq.exit87.thread132 ], [ %sym_arg_num.0360, %__streq.exit97.thread134 ], [ %sym_arg_num.0360, %__streq.exit117.thread136 ], [ %sym_arg_num.0360, %__str_to_int.exit ], [ %sym_arg_num.0360, %__add_arg.exit ], [ %sym_arg_num.0360, %__str_to_int.exit46 ], [ %168, %__add_arg.exit47 ]
  %k.0.be = phi i32 [ %51, %__add_arg.exit21 ], [ %212, %__str_to_int.exit67 ], [ %251, %__str_to_int.exit82 ], [ %287, %__streq.exit87.thread132 ], [ %304, %__streq.exit97.thread134 ], [ %321, %__streq.exit117.thread136 ], [ %342, %__str_to_int.exit ], [ %363, %__add_arg.exit ], [ %137, %__str_to_int.exit46 ], [ %137, %__add_arg.exit47 ]
  %sym_stdout_flag.0.be = phi i32 [ %sym_stdout_flag.0378, %__add_arg.exit21 ], [ %sym_stdout_flag.0378, %__str_to_int.exit67 ], [ %sym_stdout_flag.0378, %__str_to_int.exit82 ], [ 1, %__streq.exit87.thread132 ], [ %sym_stdout_flag.0378, %__streq.exit97.thread134 ], [ %sym_stdout_flag.0378, %__streq.exit117.thread136 ], [ %sym_stdout_flag.0378, %__str_to_int.exit ], [ %sym_stdout_flag.0378, %__add_arg.exit ], [ %sym_stdout_flag.0378, %__str_to_int.exit46 ], [ %sym_stdout_flag.0378, %__add_arg.exit47 ]
  %sym_stdin_len.0.be = phi i32 [ %sym_stdin_len.0386, %__add_arg.exit21 ], [ %sym_stdin_len.0386, %__str_to_int.exit67 ], [ %269, %__str_to_int.exit82 ], [ %sym_stdin_len.0386, %__streq.exit87.thread132 ], [ %sym_stdin_len.0386, %__streq.exit97.thread134 ], [ %sym_stdin_len.0386, %__streq.exit117.thread136 ], [ %sym_stdin_len.0386, %__str_to_int.exit ], [ %sym_stdin_len.0386, %__add_arg.exit ], [ %sym_stdin_len.0386, %__str_to_int.exit46 ], [ %sym_stdin_len.0386, %__add_arg.exit47 ]
  %sym_file_len.0.be = phi i32 [ %sym_file_len.0394, %__add_arg.exit21 ], [ %230, %__str_to_int.exit67 ], [ %sym_file_len.0394, %__str_to_int.exit82 ], [ %sym_file_len.0394, %__streq.exit87.thread132 ], [ %sym_file_len.0394, %__streq.exit97.thread134 ], [ %sym_file_len.0394, %__streq.exit117.thread136 ], [ %sym_file_len.0394, %__str_to_int.exit ], [ %sym_file_len.0394, %__add_arg.exit ], [ %sym_file_len.0394, %__str_to_int.exit46 ], [ %sym_file_len.0394, %__add_arg.exit47 ]
  %sym_files.0.be = phi i32 [ %sym_files.0402, %__add_arg.exit21 ], [ %211, %__str_to_int.exit67 ], [ %sym_files.0402, %__str_to_int.exit82 ], [ %sym_files.0402, %__streq.exit87.thread132 ], [ %sym_files.0402, %__streq.exit97.thread134 ], [ %sym_files.0402, %__streq.exit117.thread136 ], [ %sym_files.0402, %__str_to_int.exit ], [ %sym_files.0402, %__add_arg.exit ], [ %sym_files.0402, %__str_to_int.exit46 ], [ %sym_files.0402, %__add_arg.exit47 ]
  %270 = icmp slt i32 %k.0.be, %1, !dbg !146
  br i1 %270, label %24, label %__streq.exit.thread._crit_edge, !dbg !146

.loopexit150:                                     ; preds = %241
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !350), !dbg !352
  tail call void @llvm.dbg.value(metadata !353, i64 0, metadata !354), !dbg !352
  br i1 %30, label %.lr.ph.i85, label %.loopexit162, !dbg !355

.lr.ph.i85:                                       ; preds = %.loopexit150, %273
  %271 = phi i8 [ %276, %273 ], [ 45, %.loopexit150 ]
  %.04.i83 = phi i8* [ %275, %273 ], [ getelementptr inbounds ([13 x i8]* @.str15, i64 0, i64 0), %.loopexit150 ]
  %.013.i84 = phi i8* [ %274, %273 ], [ %28, %.loopexit150 ]
  %272 = icmp eq i8 %271, 0, !dbg !356
  br i1 %272, label %__streq.exit87.thread132, label %273, !dbg !356

; <label>:273                                     ; preds = %.lr.ph.i85
  %274 = getelementptr inbounds i8* %.013.i84, i64 1, !dbg !357
  tail call void @llvm.dbg.value(metadata !{i8* %274}, i64 0, metadata !350), !dbg !357
  %275 = getelementptr inbounds i8* %.04.i83, i64 1, !dbg !358
  tail call void @llvm.dbg.value(metadata !{i8* %275}, i64 0, metadata !354), !dbg !358
  %276 = load i8* %274, align 1, !dbg !355, !tbaa !133
  %277 = load i8* %275, align 1, !dbg !355, !tbaa !133
  %278 = icmp eq i8 %276, %277, !dbg !355
  br i1 %278, label %.lr.ph.i85, label %.loopexit151, !dbg !355

.loopexit151:                                     ; preds = %273
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !359), !dbg !361
  tail call void @llvm.dbg.value(metadata !362, i64 0, metadata !363), !dbg !361
  br i1 %30, label %.lr.ph.i90, label %.loopexit162, !dbg !364

.lr.ph.i90:                                       ; preds = %.loopexit151, %281
  %279 = phi i8 [ %284, %281 ], [ 45, %.loopexit151 ]
  %.04.i88 = phi i8* [ %283, %281 ], [ getelementptr inbounds ([12 x i8]* @.str16, i64 0, i64 0), %.loopexit151 ]
  %.013.i89 = phi i8* [ %282, %281 ], [ %28, %.loopexit151 ]
  %280 = icmp eq i8 %279, 0, !dbg !365
  br i1 %280, label %__streq.exit87.thread132, label %281, !dbg !365

; <label>:281                                     ; preds = %.lr.ph.i90
  %282 = getelementptr inbounds i8* %.013.i89, i64 1, !dbg !366
  tail call void @llvm.dbg.value(metadata !{i8* %282}, i64 0, metadata !359), !dbg !366
  %283 = getelementptr inbounds i8* %.04.i88, i64 1, !dbg !367
  tail call void @llvm.dbg.value(metadata !{i8* %283}, i64 0, metadata !363), !dbg !367
  %284 = load i8* %282, align 1, !dbg !364, !tbaa !133
  %285 = load i8* %283, align 1, !dbg !364, !tbaa !133
  %286 = icmp eq i8 %284, %285, !dbg !364
  br i1 %286, label %.lr.ph.i90, label %.loopexit153, !dbg !364

__streq.exit87.thread132:                         ; preds = %.lr.ph.i90, %.lr.ph.i85
  call void @llvm.dbg.value(metadata !368, i64 0, metadata !33), !dbg !369
  %287 = add nsw i32 %k.0369, 1, !dbg !371
  call void @llvm.dbg.value(metadata !{i32 %287}, i64 0, metadata !42), !dbg !371
  br label %__streq.exit.thread.backedge, !dbg !372

.loopexit153:                                     ; preds = %281
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !373), !dbg !375
  tail call void @llvm.dbg.value(metadata !376, i64 0, metadata !377), !dbg !375
  br i1 %30, label %.lr.ph.i95, label %.loopexit162, !dbg !378

.lr.ph.i95:                                       ; preds = %.loopexit153, %290
  %288 = phi i8 [ %293, %290 ], [ 45, %.loopexit153 ]
  %.04.i93 = phi i8* [ %292, %290 ], [ getelementptr inbounds ([18 x i8]* @.str17, i64 0, i64 0), %.loopexit153 ]
  %.013.i94 = phi i8* [ %291, %290 ], [ %28, %.loopexit153 ]
  %289 = icmp eq i8 %288, 0, !dbg !379
  br i1 %289, label %__streq.exit97.thread134, label %290, !dbg !379

; <label>:290                                     ; preds = %.lr.ph.i95
  %291 = getelementptr inbounds i8* %.013.i94, i64 1, !dbg !380
  tail call void @llvm.dbg.value(metadata !{i8* %291}, i64 0, metadata !373), !dbg !380
  %292 = getelementptr inbounds i8* %.04.i93, i64 1, !dbg !381
  tail call void @llvm.dbg.value(metadata !{i8* %292}, i64 0, metadata !377), !dbg !381
  %293 = load i8* %291, align 1, !dbg !378, !tbaa !133
  %294 = load i8* %292, align 1, !dbg !378, !tbaa !133
  %295 = icmp eq i8 %293, %294, !dbg !378
  br i1 %295, label %.lr.ph.i95, label %.loopexit154, !dbg !378

.loopexit154:                                     ; preds = %290
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !373), !dbg !375
  tail call void @llvm.dbg.value(metadata !382, i64 0, metadata !377), !dbg !375
  br i1 %30, label %.lr.ph.i120, label %.loopexit162, !dbg !378

.lr.ph.i120:                                      ; preds = %.loopexit154, %298
  %296 = phi i8 [ %301, %298 ], [ 45, %.loopexit154 ]
  %.04.i118 = phi i8* [ %300, %298 ], [ getelementptr inbounds ([17 x i8]* @.str18, i64 0, i64 0), %.loopexit154 ]
  %.013.i119 = phi i8* [ %299, %298 ], [ %28, %.loopexit154 ]
  %297 = icmp eq i8 %296, 0, !dbg !379
  br i1 %297, label %__streq.exit97.thread134, label %298, !dbg !379

; <label>:298                                     ; preds = %.lr.ph.i120
  %299 = getelementptr inbounds i8* %.013.i119, i64 1, !dbg !380
  tail call void @llvm.dbg.value(metadata !{i8* %299}, i64 0, metadata !373), !dbg !380
  %300 = getelementptr inbounds i8* %.04.i118, i64 1, !dbg !381
  tail call void @llvm.dbg.value(metadata !{i8* %300}, i64 0, metadata !377), !dbg !381
  %301 = load i8* %299, align 1, !dbg !378, !tbaa !133
  %302 = load i8* %300, align 1, !dbg !378, !tbaa !133
  %303 = icmp eq i8 %301, %302, !dbg !378
  br i1 %303, label %.lr.ph.i120, label %.loopexit156, !dbg !378

__streq.exit97.thread134:                         ; preds = %.lr.ph.i120, %.lr.ph.i95
  call void @llvm.dbg.value(metadata !368, i64 0, metadata !34), !dbg !383
  %304 = add nsw i32 %k.0369, 1, !dbg !385
  call void @llvm.dbg.value(metadata !{i32 %304}, i64 0, metadata !42), !dbg !385
  br label %__streq.exit.thread.backedge, !dbg !386

.loopexit156:                                     ; preds = %298
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !387), !dbg !389
  tail call void @llvm.dbg.value(metadata !390, i64 0, metadata !391), !dbg !389
  br i1 %30, label %.lr.ph.i115, label %.loopexit162, !dbg !392

.lr.ph.i115:                                      ; preds = %.loopexit156, %307
  %305 = phi i8 [ %310, %307 ], [ 45, %.loopexit156 ]
  %.04.i113 = phi i8* [ %309, %307 ], [ getelementptr inbounds ([10 x i8]* @.str19, i64 0, i64 0), %.loopexit156 ]
  %.013.i114 = phi i8* [ %308, %307 ], [ %28, %.loopexit156 ]
  %306 = icmp eq i8 %305, 0, !dbg !393
  br i1 %306, label %__streq.exit117.thread136, label %307, !dbg !393

; <label>:307                                     ; preds = %.lr.ph.i115
  %308 = getelementptr inbounds i8* %.013.i114, i64 1, !dbg !394
  tail call void @llvm.dbg.value(metadata !{i8* %308}, i64 0, metadata !387), !dbg !394
  %309 = getelementptr inbounds i8* %.04.i113, i64 1, !dbg !395
  tail call void @llvm.dbg.value(metadata !{i8* %309}, i64 0, metadata !391), !dbg !395
  %310 = load i8* %308, align 1, !dbg !392, !tbaa !133
  %311 = load i8* %309, align 1, !dbg !392, !tbaa !133
  %312 = icmp eq i8 %310, %311, !dbg !392
  br i1 %312, label %.lr.ph.i115, label %.loopexit157, !dbg !392

.loopexit157:                                     ; preds = %307
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !387), !dbg !389
  tail call void @llvm.dbg.value(metadata !396, i64 0, metadata !391), !dbg !389
  br i1 %30, label %.lr.ph.i110, label %.loopexit162, !dbg !392

.lr.ph.i110:                                      ; preds = %.loopexit157, %315
  %313 = phi i8 [ %318, %315 ], [ 45, %.loopexit157 ]
  %.04.i108 = phi i8* [ %317, %315 ], [ getelementptr inbounds ([9 x i8]* @.str20, i64 0, i64 0), %.loopexit157 ]
  %.013.i109 = phi i8* [ %316, %315 ], [ %28, %.loopexit157 ]
  %314 = icmp eq i8 %313, 0, !dbg !393
  br i1 %314, label %__streq.exit117.thread136, label %315, !dbg !393

; <label>:315                                     ; preds = %.lr.ph.i110
  %316 = getelementptr inbounds i8* %.013.i109, i64 1, !dbg !394
  tail call void @llvm.dbg.value(metadata !{i8* %316}, i64 0, metadata !387), !dbg !394
  %317 = getelementptr inbounds i8* %.04.i108, i64 1, !dbg !395
  tail call void @llvm.dbg.value(metadata !{i8* %317}, i64 0, metadata !391), !dbg !395
  %318 = load i8* %316, align 1, !dbg !392, !tbaa !133
  %319 = load i8* %317, align 1, !dbg !392, !tbaa !133
  %320 = icmp eq i8 %318, %319, !dbg !392
  br i1 %320, label %.lr.ph.i110, label %.loopexit159, !dbg !392

__streq.exit117.thread136:                        ; preds = %.lr.ph.i110, %.lr.ph.i115
  call void @llvm.dbg.value(metadata !368, i64 0, metadata !35), !dbg !397
  %321 = add nsw i32 %k.0369, 1, !dbg !399
  call void @llvm.dbg.value(metadata !{i32 %321}, i64 0, metadata !42), !dbg !399
  br label %__streq.exit.thread.backedge, !dbg !400

.loopexit159:                                     ; preds = %315
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !401), !dbg !403
  tail call void @llvm.dbg.value(metadata !404, i64 0, metadata !405), !dbg !403
  br i1 %30, label %.lr.ph.i105, label %.loopexit162, !dbg !406

.lr.ph.i105:                                      ; preds = %.loopexit159, %324
  %322 = phi i8 [ %327, %324 ], [ 45, %.loopexit159 ]
  %.04.i103 = phi i8* [ %326, %324 ], [ getelementptr inbounds ([11 x i8]* @.str21, i64 0, i64 0), %.loopexit159 ]
  %.013.i104 = phi i8* [ %325, %324 ], [ %28, %.loopexit159 ]
  %323 = icmp eq i8 %322, 0, !dbg !407
  br i1 %323, label %__streq.exit107.thread138, label %324, !dbg !407

; <label>:324                                     ; preds = %.lr.ph.i105
  %325 = getelementptr inbounds i8* %.013.i104, i64 1, !dbg !408
  tail call void @llvm.dbg.value(metadata !{i8* %325}, i64 0, metadata !401), !dbg !408
  %326 = getelementptr inbounds i8* %.04.i103, i64 1, !dbg !409
  tail call void @llvm.dbg.value(metadata !{i8* %326}, i64 0, metadata !405), !dbg !409
  %327 = load i8* %325, align 1, !dbg !406, !tbaa !133
  %328 = load i8* %326, align 1, !dbg !406, !tbaa !133
  %329 = icmp eq i8 %327, %328, !dbg !406
  br i1 %329, label %.lr.ph.i105, label %.loopexit160, !dbg !406

.loopexit160:                                     ; preds = %324
  tail call void @llvm.dbg.value(metadata !{i8* %28}, i64 0, metadata !401), !dbg !403
  tail call void @llvm.dbg.value(metadata !410, i64 0, metadata !405), !dbg !403
  br i1 %30, label %.lr.ph.i100, label %.loopexit162, !dbg !406

.lr.ph.i100:                                      ; preds = %.loopexit160, %332
  %330 = phi i8 [ %335, %332 ], [ 45, %.loopexit160 ]
  %.04.i98 = phi i8* [ %334, %332 ], [ getelementptr inbounds ([10 x i8]* @.str22, i64 0, i64 0), %.loopexit160 ]
  %.013.i99 = phi i8* [ %333, %332 ], [ %28, %.loopexit160 ]
  %331 = icmp eq i8 %330, 0, !dbg !407
  br i1 %331, label %__streq.exit107.thread138, label %332, !dbg !407

; <label>:332                                     ; preds = %.lr.ph.i100
  %333 = getelementptr inbounds i8* %.013.i99, i64 1, !dbg !408
  tail call void @llvm.dbg.value(metadata !{i8* %333}, i64 0, metadata !401), !dbg !408
  %334 = getelementptr inbounds i8* %.04.i98, i64 1, !dbg !409
  tail call void @llvm.dbg.value(metadata !{i8* %334}, i64 0, metadata !405), !dbg !409
  %335 = load i8* %333, align 1, !dbg !406, !tbaa !133
  %336 = load i8* %334, align 1, !dbg !406, !tbaa !133
  %337 = icmp eq i8 %335, %336, !dbg !406
  br i1 %337, label %.lr.ph.i100, label %.loopexit162, !dbg !406

__streq.exit107.thread138:                        ; preds = %.lr.ph.i100, %.lr.ph.i105
  call void @llvm.dbg.value(metadata !411, i64 0, metadata !59), !dbg !412
  %338 = add nsw i32 %k.0369, 1, !dbg !413
  call void @llvm.dbg.value(metadata !{i32 %338}, i64 0, metadata !42), !dbg !413
  %339 = icmp eq i32 %338, %1, !dbg !413
  br i1 %339, label %340, label %341, !dbg !413

; <label>:340                                     ; preds = %__streq.exit107.thread138
  call fastcc void @__emit_error(i8* getelementptr inbounds ([54 x i8]* @.str23, i64 0, i64 0)), !dbg !415
  unreachable

; <label>:341                                     ; preds = %__streq.exit107.thread138
  %342 = add nsw i32 %k.0369, 2, !dbg !416
  call void @llvm.dbg.value(metadata !{i32 %342}, i64 0, metadata !42), !dbg !416
  %343 = sext i32 %338 to i64, !dbg !416
  %344 = getelementptr inbounds i8** %2, i64 %343, !dbg !416
  %345 = load i8** %344, align 8, !dbg !416, !tbaa !116
  call void @llvm.dbg.value(metadata !{i8* %345}, i64 0, metadata !417) #2, !dbg !418
  call void @llvm.dbg.value(metadata !419, i64 0, metadata !420) #2, !dbg !418
  call void @llvm.dbg.value(metadata !170, i64 0, metadata !421) #2, !dbg !422
  %346 = load i8* %345, align 1, !dbg !423, !tbaa !133
  %347 = icmp eq i8 %346, 0, !dbg !423
  br i1 %347, label %348, label %.lr.ph.i10, !dbg !423

; <label>:348                                     ; preds = %341
  call fastcc void @__emit_error(i8* getelementptr inbounds ([54 x i8]* @.str23, i64 0, i64 0)) #2, !dbg !423
  unreachable

.lr.ph.i10:                                       ; preds = %341, %352
  %349 = phi i8 [ %357, %352 ], [ %346, %341 ]
  %s.pn.i = phi i8* [ %350, %352 ], [ %345, %341 ]
  %res.02.i = phi i64 [ %356, %352 ], [ 0, %341 ]
  %350 = getelementptr inbounds i8* %s.pn.i, i64 1, !dbg !424
  %.off.i = add i8 %349, -48, !dbg !425
  %351 = icmp ult i8 %.off.i, 10, !dbg !425
  br i1 %351, label %352, label %359, !dbg !425

; <label>:352                                     ; preds = %.lr.ph.i10
  %353 = sext i8 %349 to i64, !dbg !426
  %354 = mul nsw i64 %res.02.i, 10, !dbg !427
  %355 = add i64 %353, -48, !dbg !427
  %356 = add i64 %355, %354, !dbg !427
  call void @llvm.dbg.value(metadata !{i64 %356}, i64 0, metadata !421) #2, !dbg !427
  call void @llvm.dbg.value(metadata !{i8* %350}, i64 0, metadata !417) #2, !dbg !424
  %357 = load i8* %350, align 1, !dbg !424, !tbaa !133
  call void @llvm.dbg.value(metadata !{i8 %349}, i64 0, metadata !428) #2, !dbg !424
  %358 = icmp eq i8 %357, 0, !dbg !424
  br i1 %358, label %__str_to_int.exit, label %.lr.ph.i10, !dbg !424

; <label>:359                                     ; preds = %.lr.ph.i10
  call fastcc void @__emit_error(i8* getelementptr inbounds ([54 x i8]* @.str23, i64 0, i64 0)) #2, !dbg !429
  unreachable

__str_to_int.exit:                                ; preds = %352
  %360 = trunc i64 %356 to i32, !dbg !416
  call void @llvm.dbg.value(metadata !{i32 %360}, i64 0, metadata !35), !dbg !416
  br label %__streq.exit.thread.backedge, !dbg !430

.loopexit162:                                     ; preds = %332, %.loopexit148, %.loopexit147, %.loopexit145, %.loopexit144, %.loopexit142, %.loopexit141, %.loopexit, %24, %.loopexit153, %.loopexit154, %.loopexit150, %.loopexit151, %.loopexit157, %.loopexit156, %.loopexit159, %.loopexit160
  call void @llvm.dbg.value(metadata !{i32 %363}, i64 0, metadata !42), !dbg !431
  call void @llvm.dbg.value(metadata !187, i64 0, metadata !433) #2, !dbg !434
  %361 = icmp eq i32 %25, 1024, !dbg !435
  br i1 %361, label %362, label %__add_arg.exit, !dbg !435

; <label>:362                                     ; preds = %.loopexit162
  call fastcc void @__emit_error(i8* getelementptr inbounds ([37 x i8]* @.str24, i64 0, i64 0)) #2, !dbg !436
  unreachable

__add_arg.exit:                                   ; preds = %.loopexit162
  %363 = add nsw i32 %k.0369, 1, !dbg !431
  %364 = sext i32 %25 to i64, !dbg !437
  %365 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %364, !dbg !437
  store i8* %28, i8** %365, align 8, !dbg !437, !tbaa !116
  %366 = add nsw i32 %25, 1, !dbg !438
  call void @llvm.dbg.value(metadata !{i32 %366}, i64 0, metadata !20), !dbg !438
  call void @llvm.dbg.value(metadata !{i32 %366}, i64 0, metadata !20), !dbg !119
  call void @llvm.dbg.value(metadata !{i32 %366}, i64 0, metadata !20), !dbg !120
  call void @llvm.dbg.value(metadata !{i32 %366}, i64 0, metadata !20), !dbg !121
  call void @llvm.dbg.value(metadata !{i32 %366}, i64 0, metadata !20), !dbg !122
  br label %__streq.exit.thread.backedge

__streq.exit.thread._crit_edge:                   ; preds = %__streq.exit.thread.backedge, %__streq.exit.thread.preheader
  %sym_files.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %sym_files.0.be, %__streq.exit.thread.backedge ]
  %sym_file_len.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %sym_file_len.0.be, %__streq.exit.thread.backedge ]
  %sym_stdin_len.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %sym_stdin_len.0.be, %__streq.exit.thread.backedge ]
  %sym_stdout_flag.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %sym_stdout_flag.0.be, %__streq.exit.thread.backedge ]
  %save_all_writes_flag.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %save_all_writes_flag.0.be, %__streq.exit.thread.backedge ]
  %fd_fail.0.lcssa = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %fd_fail.0.be, %__streq.exit.thread.backedge ]
  %.lcssa176 = phi i32 [ 0, %__streq.exit.thread.preheader ], [ %.be, %__streq.exit.thread.backedge ]
  %367 = add nsw i32 %.lcssa176, 1, !dbg !119
  %368 = sext i32 %367 to i64, !dbg !119
  %369 = shl nsw i64 %368, 3, !dbg !119
  %370 = call noalias i8* @malloc(i64 %369) #2, !dbg !119
  %371 = bitcast i8* %370 to i8**, !dbg !119
  call void @llvm.dbg.value(metadata !{i8** %371}, i64 0, metadata !36), !dbg !119
  call void @klee_mark_global(i8* %370) #2, !dbg !439
  %372 = sext i32 %.lcssa176 to i64, !dbg !120
  %373 = shl nsw i64 %372, 3, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %370, i8* %3, i64 %373, i32 8, i1 false), !dbg !120
  %374 = getelementptr inbounds i8** %371, i64 %372, !dbg !121
  store i8* null, i8** %374, align 8, !dbg !121, !tbaa !116
  store i32 %.lcssa176, i32* %argcPtr, align 4, !dbg !122, !tbaa !111
  store i8** %371, i8*** %argvPtr, align 8, !dbg !440, !tbaa !116
  call void @klee_init_fds(i32 %sym_files.0.lcssa, i32 %sym_file_len.0.lcssa, i32 %sym_stdin_len.0.lcssa, i32 %sym_stdout_flag.0.lcssa, i32 %save_all_writes_flag.0.lcssa, i32 %fd_fail.0.lcssa) #2, !dbg !441
  call void @llvm.lifetime.end(i64 8192, i8* %3) #2, !dbg !442
  ret void, !dbg !442
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn nounwind uwtable
define internal fastcc void @__emit_error(i8* %msg) #3 {
  tail call void @llvm.dbg.value(metadata !{i8* %msg}, i64 0, metadata !99), !dbg !443
  tail call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str25, i64 0, i64 0), i32 24, i8* %msg, i8* getelementptr inbounds ([9 x i8]* @.str26, i64 0, i64 0)) #7, !dbg !444
  unreachable, !dbg !444
}

; Function Attrs: nounwind uwtable
define internal fastcc i8* @__get_sym_str(i32 %numChars, i8* %name) #0 {
  tail call void @llvm.dbg.value(metadata !{i32 %numChars}, i64 0, metadata !69), !dbg !445
  tail call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !70), !dbg !445
  %1 = add nsw i32 %numChars, 1, !dbg !446
  %2 = sext i32 %1 to i64, !dbg !446
  %3 = tail call noalias i8* @malloc(i64 %2) #2, !dbg !446
  tail call void @llvm.dbg.value(metadata !{i8* %3}, i64 0, metadata !72), !dbg !446
  tail call void @klee_mark_global(i8* %3) #2, !dbg !447
  tail call void @klee_make_symbolic(i8* %3, i64 %2, i8* %name) #2, !dbg !448
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !71), !dbg !449
  %4 = icmp sgt i32 %numChars, 0, !dbg !449
  br i1 %4, label %.lr.ph, label %._crit_edge, !dbg !449

.lr.ph:                                           ; preds = %0, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %0 ]
  %5 = getelementptr inbounds i8* %3, i64 %indvars.iv, !dbg !451
  %6 = load i8* %5, align 1, !dbg !451, !tbaa !133
  tail call void @llvm.dbg.value(metadata !{i8 %6}, i64 0, metadata !452), !dbg !453
  %7 = icmp sgt i8 %6, 31, !dbg !454
  %8 = icmp ne i8 %6, 127, !dbg !454
  %..i = and i1 %7, %8, !dbg !454
  %9 = zext i1 %..i to i64, !dbg !451
  tail call void @klee_posix_prefer_cex(i8* %3, i64 %9) #2, !dbg !451
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !449
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !449
  %exitcond = icmp eq i32 %lftr.wideiv, %numChars, !dbg !449
  br i1 %exitcond, label %._crit_edge, label %.lr.ph, !dbg !449

._crit_edge:                                      ; preds = %.lr.ph, %0
  %10 = sext i32 %numChars to i64, !dbg !455
  %11 = getelementptr inbounds i8* %3, i64 %10, !dbg !455
  store i8 0, i8* %11, align 1, !dbg !455, !tbaa !133
  ret i8* %3, !dbg !456
}

declare i32 @klee_range(i32, i32, i8*) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #5

declare void @klee_mark_global(i8*) #4

declare void @klee_init_fds(i32, i32, i32, i32, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

declare void @klee_make_symbolic(i8*, i64, i8*) #4

declare void @klee_posix_prefer_cex(i8*, i64) #4

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #6

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!106, !107}
!llvm.ident = !{!108}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sanghu/TracerX/tracerx/runtime/POSIX//home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !65, metadata !73, metadata !78, metadata !86, metadata !95, metadata !100}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"klee_init_env", metadata !"klee_init_env", metadata !"", i32 85, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i8***)* @klee_init_env, null, null, metadata !15, i32 85} ; [ DW_TAG_subprogram ] [line 85] [def] [klee_init_env]
!5 = metadata !{metadata !"klee_init_env.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/POSIX"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9, metadata !11}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!10 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!12 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!14 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!15 = metadata !{metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !26, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !41, metadata !42, metadata !43, metadata !44, metadata !50, metadata !53, metadata !56, metadata !59}
!16 = metadata !{i32 786689, metadata !4, metadata !"argcPtr", metadata !6, i32 16777301, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argcPtr] [line 85]
!17 = metadata !{i32 786689, metadata !4, metadata !"argvPtr", metadata !6, i32 33554517, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argvPtr] [line 85]
!18 = metadata !{i32 786688, metadata !4, metadata !"argc", metadata !6, i32 86, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [argc] [line 86]
!19 = metadata !{i32 786688, metadata !4, metadata !"argv", metadata !6, i32 87, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [argv] [line 87]
!20 = metadata !{i32 786688, metadata !4, metadata !"new_argc", metadata !6, i32 89, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_argc] [line 89]
!21 = metadata !{i32 786688, metadata !4, metadata !"n_args", metadata !6, i32 89, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n_args] [line 89]
!22 = metadata !{i32 786688, metadata !4, metadata !"new_argv", metadata !6, i32 90, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_argv] [line 90]
!23 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 65536, i64 64, i32 0, i32 0, metadata !13, metadata !24, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from ]
!24 = metadata !{metadata !25}
!25 = metadata !{i32 786465, i64 0, i64 1024}     ; [ DW_TAG_subrange_type ] [0, 1023]
!26 = metadata !{i32 786688, metadata !4, metadata !"max_len", metadata !6, i32 91, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_len] [line 91]
!27 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!28 = metadata !{i32 786688, metadata !4, metadata !"min_argvs", metadata !6, i32 91, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [min_argvs] [line 91]
!29 = metadata !{i32 786688, metadata !4, metadata !"max_argvs", metadata !6, i32 91, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_argvs] [line 91]
!30 = metadata !{i32 786688, metadata !4, metadata !"sym_files", metadata !6, i32 92, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_files] [line 92]
!31 = metadata !{i32 786688, metadata !4, metadata !"sym_file_len", metadata !6, i32 92, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_file_len] [line 92]
!32 = metadata !{i32 786688, metadata !4, metadata !"sym_stdin_len", metadata !6, i32 93, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_stdin_len] [line 93]
!33 = metadata !{i32 786688, metadata !4, metadata !"sym_stdout_flag", metadata !6, i32 94, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_stdout_flag] [line 94]
!34 = metadata !{i32 786688, metadata !4, metadata !"save_all_writes_flag", metadata !6, i32 95, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [save_all_writes_flag] [line 95]
!35 = metadata !{i32 786688, metadata !4, metadata !"fd_fail", metadata !6, i32 96, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd_fail] [line 96]
!36 = metadata !{i32 786688, metadata !4, metadata !"final_argv", metadata !6, i32 97, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [final_argv] [line 97]
!37 = metadata !{i32 786688, metadata !4, metadata !"sym_arg_name", metadata !6, i32 98, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_arg_name] [line 98]
!38 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 40, i64 8, i32 0, i32 0, metadata !14, metadata !39, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 40, align 8, offset 0] [from char]
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786465, i64 0, i64 5}        ; [ DW_TAG_subrange_type ] [0, 4]
!41 = metadata !{i32 786688, metadata !4, metadata !"sym_arg_num", metadata !6, i32 99, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_arg_num] [line 99]
!42 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !6, i32 100, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 100]
!43 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !6, i32 100, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 100]
!44 = metadata !{i32 786688, metadata !45, metadata !"msg", metadata !6, i32 125, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 125]
!45 = metadata !{i32 786443, metadata !5, metadata !46, i32 124, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!46 = metadata !{i32 786443, metadata !5, metadata !47, i32 124, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!47 = metadata !{i32 786443, metadata !5, metadata !4, i32 123, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!48 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !49} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!49 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!50 = metadata !{i32 786688, metadata !51, metadata !"msg", metadata !6, i32 136, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 136]
!51 = metadata !{i32 786443, metadata !5, metadata !52, i32 135, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!52 = metadata !{i32 786443, metadata !5, metadata !46, i32 135, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!53 = metadata !{i32 786688, metadata !54, metadata !"msg", metadata !6, i32 156, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 156]
!54 = metadata !{i32 786443, metadata !5, metadata !55, i32 155, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!55 = metadata !{i32 786443, metadata !5, metadata !52, i32 155, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!56 = metadata !{i32 786688, metadata !57, metadata !"msg", metadata !6, i32 167, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 167]
!57 = metadata !{i32 786443, metadata !5, metadata !58, i32 166, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!58 = metadata !{i32 786443, metadata !5, metadata !55, i32 165, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!59 = metadata !{i32 786688, metadata !60, metadata !"msg", metadata !6, i32 188, metadata !48, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 188]
!60 = metadata !{i32 786443, metadata !5, metadata !61, i32 187, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!61 = metadata !{i32 786443, metadata !5, metadata !62, i32 187, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!62 = metadata !{i32 786443, metadata !5, metadata !63, i32 183, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!63 = metadata !{i32 786443, metadata !5, metadata !64, i32 179, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!64 = metadata !{i32 786443, metadata !5, metadata !58, i32 174, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!65 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__get_sym_str", metadata !"__get_sym_str", metadata !"", i32 63, metadata !66, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i32, i8*)* @__get_sym_str, null, null, metadata !68, i32 63} ; [ DW_TAG_subprogram ] [line 63] [local] [def] [__get_sym_str]
!66 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !67, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!67 = metadata !{metadata !13, metadata !10, metadata !13}
!68 = metadata !{metadata !69, metadata !70, metadata !71, metadata !72}
!69 = metadata !{i32 786689, metadata !65, metadata !"numChars", metadata !6, i32 16777279, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [numChars] [line 63]
!70 = metadata !{i32 786689, metadata !65, metadata !"name", metadata !6, i32 33554495, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 63]
!71 = metadata !{i32 786688, metadata !65, metadata !"i", metadata !6, i32 64, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 64]
!72 = metadata !{i32 786688, metadata !65, metadata !"s", metadata !6, i32 65, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 65]
!73 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__isprint", metadata !"__isprint", metadata !"", i32 48, metadata !74, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !76, i32 48} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [__isprint]
!74 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !75, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = metadata !{metadata !10, metadata !49}
!76 = metadata !{metadata !77}
!77 = metadata !{i32 786689, metadata !73, metadata !"c", metadata !6, i32 16777264, metadata !49, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 48]
!78 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__add_arg", metadata !"__add_arg", metadata !"", i32 76, metadata !79, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !81, i32 76} ; [ DW_TAG_subprogram ] [line 76] [local] [def] [__add_arg]
!79 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = metadata !{null, metadata !9, metadata !12, metadata !13, metadata !10}
!81 = metadata !{metadata !82, metadata !83, metadata !84, metadata !85}
!82 = metadata !{i32 786689, metadata !78, metadata !"argc", metadata !6, i32 16777292, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 76]
!83 = metadata !{i32 786689, metadata !78, metadata !"argv", metadata !6, i32 33554508, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 76]
!84 = metadata !{i32 786689, metadata !78, metadata !"arg", metadata !6, i32 50331724, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg] [line 76]
!85 = metadata !{i32 786689, metadata !78, metadata !"argcMax", metadata !6, i32 67108940, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!86 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__str_to_int", metadata !"__str_to_int", metadata !"", i32 30, metadata !87, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !90, i32 30} ; [ DW_TAG_subprogram ] [line 30] [local] [def] [__str_to_int]
!87 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !88, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!88 = metadata !{metadata !89, metadata !13, metadata !48}
!89 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!90 = metadata !{metadata !91, metadata !92, metadata !93, metadata !94}
!91 = metadata !{i32 786689, metadata !86, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 30]
!92 = metadata !{i32 786689, metadata !86, metadata !"error_msg", metadata !6, i32 33554462, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!93 = metadata !{i32 786688, metadata !86, metadata !"res", metadata !6, i32 31, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 31]
!94 = metadata !{i32 786688, metadata !86, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 32]
!95 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__emit_error", metadata !"__emit_error", metadata !"", i32 23, metadata !96, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*)* @__emit_error, null, null, metadata !98, i32 23} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [__emit_error]
!96 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !97, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!97 = metadata !{null, metadata !48}
!98 = metadata !{metadata !99}
!99 = metadata !{i32 786689, metadata !95, metadata !"msg", metadata !6, i32 16777239, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [msg] [line 23]
!100 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__streq", metadata !"__streq", metadata !"", i32 53, metadata !101, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !103, i32 53} ; [ DW_TAG_subprogram ] [line 53] [local] [def] [__streq]
!101 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !102, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!102 = metadata !{metadata !10, metadata !48, metadata !48}
!103 = metadata !{metadata !104, metadata !105}
!104 = metadata !{i32 786689, metadata !100, metadata !"a", metadata !6, i32 16777269, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 53]
!105 = metadata !{i32 786689, metadata !100, metadata !"b", metadata !6, i32 33554485, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 53]
!106 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!107 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!108 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!109 = metadata !{i32 85, i32 0, metadata !4, null}
!110 = metadata !{i32 86, i32 0, metadata !4, null}
!111 = metadata !{metadata !112, metadata !112, i64 0}
!112 = metadata !{metadata !"int", metadata !113, i64 0}
!113 = metadata !{metadata !"omnipotent char", metadata !114, i64 0}
!114 = metadata !{metadata !"Simple C/C++ TBAA"}
!115 = metadata !{i32 87, i32 0, metadata !4, null}
!116 = metadata !{metadata !117, metadata !117, i64 0}
!117 = metadata !{metadata !"any pointer", metadata !113, i64 0}
!118 = metadata !{i32 89, i32 0, metadata !4, null}
!119 = metadata !{i32 200, i32 0, metadata !4, null}
!120 = metadata !{i32 202, i32 0, metadata !4, null}
!121 = metadata !{i32 203, i32 0, metadata !4, null}
!122 = metadata !{i32 205, i32 0, metadata !4, null}
!123 = metadata !{i32 90, i32 0, metadata !4, null}
!124 = metadata !{i32 92, i32 0, metadata !4, null}
!125 = metadata !{i32 93, i32 0, metadata !4, null}
!126 = metadata !{i32 94, i32 0, metadata !4, null}
!127 = metadata !{i32 95, i32 0, metadata !4, null}
!128 = metadata !{i32 96, i32 0, metadata !4, null}
!129 = metadata !{i32 98, i32 0, metadata !4, null}
!130 = metadata !{i32 99, i32 0, metadata !4, null}
!131 = metadata !{i32 100, i32 0, metadata !4, null}
!132 = metadata !{i32 102, i32 0, metadata !4, null}
!133 = metadata !{metadata !113, metadata !113, i64 0}
!134 = metadata !{i32 105, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !5, metadata !4, i32 105, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!136 = metadata !{i32 786689, metadata !100, metadata !"a", metadata !6, i32 16777269, metadata !48, i32 0, metadata !134} ; [ DW_TAG_arg_variable ] [a] [line 53]
!137 = metadata !{i32 53, i32 0, metadata !100, metadata !134}
!138 = metadata !{i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0)}
!139 = metadata !{i32 786689, metadata !100, metadata !"b", metadata !6, i32 33554485, metadata !48, i32 0, metadata !134} ; [ DW_TAG_arg_variable ] [b] [line 53]
!140 = metadata !{i32 54, i32 0, metadata !100, metadata !134}
!141 = metadata !{i32 55, i32 0, metadata !142, metadata !134}
!142 = metadata !{i32 786443, metadata !5, metadata !143, i32 55, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!143 = metadata !{i32 786443, metadata !5, metadata !100, i32 54, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!144 = metadata !{i32 57, i32 0, metadata !143, metadata !134}
!145 = metadata !{i32 58, i32 0, metadata !143, metadata !134} ; [ DW_TAG_imported_module ]
!146 = metadata !{i32 123, i32 0, metadata !4, null}
!147 = metadata !{i32 130, i32 0, metadata !45, null}
!148 = metadata !{i32 106, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !5, metadata !135, i32 105, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!150 = metadata !{i32 124, i32 0, metadata !46, null}
!151 = metadata !{i32 786689, metadata !100, metadata !"a", metadata !6, i32 16777269, metadata !48, i32 0, metadata !150} ; [ DW_TAG_arg_variable ] [a] [line 53]
!152 = metadata !{i32 53, i32 0, metadata !100, metadata !150}
!153 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)}
!154 = metadata !{i32 786689, metadata !100, metadata !"b", metadata !6, i32 33554485, metadata !48, i32 0, metadata !150} ; [ DW_TAG_arg_variable ] [b] [line 53]
!155 = metadata !{i32 54, i32 0, metadata !100, metadata !150}
!156 = metadata !{i32 55, i32 0, metadata !142, metadata !150}
!157 = metadata !{i32 57, i32 0, metadata !143, metadata !150}
!158 = metadata !{i32 58, i32 0, metadata !143, metadata !150} ; [ DW_TAG_imported_module ]
!159 = metadata !{i8* getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0)}
!160 = metadata !{null}
!161 = metadata !{i32 125, i32 0, metadata !45, null}
!162 = metadata !{i32 126, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !5, metadata !45, i32 126, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!164 = metadata !{i32 127, i32 0, metadata !163, null}
!165 = metadata !{i32 129, i32 0, metadata !45, null}
!166 = metadata !{i32 786689, metadata !86, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !165} ; [ DW_TAG_arg_variable ] [s] [line 30]
!167 = metadata !{i32 30, i32 0, metadata !86, metadata !165}
!168 = metadata !{i8* getelementptr inbounds ([48 x i8]* @.str4, i64 0, i64 0)}
!169 = metadata !{i32 786689, metadata !86, metadata !"error_msg", metadata !6, i32 33554462, metadata !48, i32 0, metadata !165} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!170 = metadata !{i64 0}
!171 = metadata !{i32 786688, metadata !86, metadata !"res", metadata !6, i32 31, metadata !89, i32 0, metadata !165} ; [ DW_TAG_auto_variable ] [res] [line 31]
!172 = metadata !{i32 31, i32 0, metadata !86, metadata !165}
!173 = metadata !{i32 34, i32 0, metadata !174, metadata !165}
!174 = metadata !{i32 786443, metadata !5, metadata !86, i32 34, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!175 = metadata !{i32 36, i32 0, metadata !86, metadata !165}
!176 = metadata !{i32 39, i32 0, metadata !177, metadata !165}
!177 = metadata !{i32 786443, metadata !5, metadata !178, i32 39, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!178 = metadata !{i32 786443, metadata !5, metadata !179, i32 37, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!179 = metadata !{i32 786443, metadata !5, metadata !86, i32 36, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!180 = metadata !{i32 37, i32 0, metadata !178, metadata !165}
!181 = metadata !{i32 40, i32 0, metadata !182, metadata !165}
!182 = metadata !{i32 786443, metadata !5, metadata !177, i32 39, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!183 = metadata !{i32 786688, metadata !86, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !165} ; [ DW_TAG_auto_variable ] [c] [line 32]
!184 = metadata !{i32 42, i32 0, metadata !185, metadata !165}
!185 = metadata !{i32 786443, metadata !5, metadata !177, i32 41, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!186 = metadata !{i32 132, i32 0, metadata !45, null}
!187 = metadata !{i32 1024}
!188 = metadata !{i32 786689, metadata !78, metadata !"argcMax", metadata !6, i32 67108940, metadata !10, i32 0, metadata !189} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!189 = metadata !{i32 131, i32 0, metadata !45, null}
!190 = metadata !{i32 76, i32 0, metadata !78, metadata !189}
!191 = metadata !{i32 77, i32 0, metadata !192, metadata !189}
!192 = metadata !{i32 786443, metadata !5, metadata !78, i32 77, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!193 = metadata !{i32 78, i32 0, metadata !194, metadata !189}
!194 = metadata !{i32 786443, metadata !5, metadata !192, i32 77, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!195 = metadata !{i32 80, i32 0, metadata !196, metadata !189}
!196 = metadata !{i32 786443, metadata !5, metadata !192, i32 79, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!197 = metadata !{i32 81, i32 0, metadata !196, metadata !189}
!198 = metadata !{i32 134, i32 0, metadata !45, null}
!199 = metadata !{i32 786689, metadata !100, metadata !"a", metadata !6, i32 16777269, metadata !48, i32 0, metadata !200} ; [ DW_TAG_arg_variable ] [a] [line 53]
!200 = metadata !{i32 135, i32 0, metadata !52, null}
!201 = metadata !{i32 53, i32 0, metadata !100, metadata !200}
!202 = metadata !{i8* getelementptr inbounds ([11 x i8]* @.str5, i64 0, i64 0)}
!203 = metadata !{i32 786689, metadata !100, metadata !"b", metadata !6, i32 33554485, metadata !48, i32 0, metadata !200} ; [ DW_TAG_arg_variable ] [b] [line 53]
!204 = metadata !{i32 54, i32 0, metadata !100, metadata !200}
!205 = metadata !{i32 55, i32 0, metadata !142, metadata !200}
!206 = metadata !{i32 57, i32 0, metadata !143, metadata !200}
!207 = metadata !{i32 58, i32 0, metadata !143, metadata !200} ; [ DW_TAG_imported_module ]
!208 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str6, i64 0, i64 0)}
!209 = metadata !{null}
!210 = metadata !{i32 136, i32 0, metadata !51, null}
!211 = metadata !{i32 139, i32 0, metadata !212, null}
!212 = metadata !{i32 786443, metadata !5, metadata !51, i32 139, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!213 = metadata !{i32 140, i32 0, metadata !212, null}
!214 = metadata !{i32 142, i32 0, metadata !51, null}
!215 = metadata !{i32 143, i32 0, metadata !51, null}
!216 = metadata !{i32 786689, metadata !86, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !215} ; [ DW_TAG_arg_variable ] [s] [line 30]
!217 = metadata !{i32 30, i32 0, metadata !86, metadata !215}
!218 = metadata !{i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)}
!219 = metadata !{i32 786689, metadata !86, metadata !"error_msg", metadata !6, i32 33554462, metadata !48, i32 0, metadata !215} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!220 = metadata !{i32 786688, metadata !86, metadata !"res", metadata !6, i32 31, metadata !89, i32 0, metadata !215} ; [ DW_TAG_auto_variable ] [res] [line 31]
!221 = metadata !{i32 31, i32 0, metadata !86, metadata !215}
!222 = metadata !{i32 34, i32 0, metadata !174, metadata !215}
!223 = metadata !{i32 36, i32 0, metadata !86, metadata !215}
!224 = metadata !{i32 39, i32 0, metadata !177, metadata !215}
!225 = metadata !{i32 37, i32 0, metadata !178, metadata !215}
!226 = metadata !{i32 40, i32 0, metadata !182, metadata !215}
!227 = metadata !{i32 786688, metadata !86, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !215} ; [ DW_TAG_auto_variable ] [c] [line 32]
!228 = metadata !{i32 42, i32 0, metadata !185, metadata !215}
!229 = metadata !{i32 144, i32 0, metadata !51, null}
!230 = metadata !{i32 786689, metadata !86, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !229} ; [ DW_TAG_arg_variable ] [s] [line 30]
!231 = metadata !{i32 30, i32 0, metadata !86, metadata !229}
!232 = metadata !{i32 786689, metadata !86, metadata !"error_msg", metadata !6, i32 33554462, metadata !48, i32 0, metadata !229} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!233 = metadata !{i32 786688, metadata !86, metadata !"res", metadata !6, i32 31, metadata !89, i32 0, metadata !229} ; [ DW_TAG_auto_variable ] [res] [line 31]
!234 = metadata !{i32 31, i32 0, metadata !86, metadata !229}
!235 = metadata !{i32 34, i32 0, metadata !174, metadata !229}
!236 = metadata !{i32 36, i32 0, metadata !86, metadata !229}
!237 = metadata !{i32 39, i32 0, metadata !177, metadata !229}
!238 = metadata !{i32 37, i32 0, metadata !178, metadata !229}
!239 = metadata !{i32 40, i32 0, metadata !182, metadata !229}
!240 = metadata !{i32 786688, metadata !86, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !229} ; [ DW_TAG_auto_variable ] [c] [line 32]
!241 = metadata !{i32 42, i32 0, metadata !185, metadata !229}
!242 = metadata !{i32 145, i32 0, metadata !51, null}
!243 = metadata !{i32 786689, metadata !86, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !242} ; [ DW_TAG_arg_variable ] [s] [line 30]
!244 = metadata !{i32 30, i32 0, metadata !86, metadata !242}
!245 = metadata !{i32 786689, metadata !86, metadata !"error_msg", metadata !6, i32 33554462, metadata !48, i32 0, metadata !242} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!246 = metadata !{i32 786688, metadata !86, metadata !"res", metadata !6, i32 31, metadata !89, i32 0, metadata !242} ; [ DW_TAG_auto_variable ] [res] [line 31]
!247 = metadata !{i32 31, i32 0, metadata !86, metadata !242}
!248 = metadata !{i32 34, i32 0, metadata !174, metadata !242}
!249 = metadata !{i32 36, i32 0, metadata !86, metadata !242}
!250 = metadata !{i32 39, i32 0, metadata !177, metadata !242}
!251 = metadata !{i32 37, i32 0, metadata !178, metadata !242}
!252 = metadata !{i32 40, i32 0, metadata !182, metadata !242}
!253 = metadata !{i32 786688, metadata !86, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !242} ; [ DW_TAG_auto_variable ] [c] [line 32]
!254 = metadata !{i32 42, i32 0, metadata !185, metadata !242}
!255 = metadata !{i32 147, i32 0, metadata !51, null}
!256 = metadata !{i32 148, i32 0, metadata !257, null}
!257 = metadata !{i32 786443, metadata !5, metadata !51, i32 148, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!258 = metadata !{i32 149, i32 0, metadata !259, null}
!259 = metadata !{i32 786443, metadata !5, metadata !257, i32 148, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!260 = metadata !{i32 151, i32 0, metadata !259, null}
!261 = metadata !{i32 786689, metadata !78, metadata !"argcMax", metadata !6, i32 67108940, metadata !10, i32 0, metadata !262} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!262 = metadata !{i32 150, i32 0, metadata !259, null}
!263 = metadata !{i32 76, i32 0, metadata !78, metadata !262}
!264 = metadata !{i32 77, i32 0, metadata !192, metadata !262}
!265 = metadata !{i32 78, i32 0, metadata !194, metadata !262}
!266 = metadata !{i32 80, i32 0, metadata !196, metadata !262}
!267 = metadata !{i32 81, i32 0, metadata !196, metadata !262}
!268 = metadata !{i32 786689, metadata !100, metadata !"a", metadata !6, i32 16777269, metadata !48, i32 0, metadata !269} ; [ DW_TAG_arg_variable ] [a] [line 53]
!269 = metadata !{i32 155, i32 0, metadata !55, null}
!270 = metadata !{i32 53, i32 0, metadata !100, metadata !269}
!271 = metadata !{i8* getelementptr inbounds ([12 x i8]* @.str9, i64 0, i64 0)}
!272 = metadata !{i32 786689, metadata !100, metadata !"b", metadata !6, i32 33554485, metadata !48, i32 0, metadata !269} ; [ DW_TAG_arg_variable ] [b] [line 53]
!273 = metadata !{i32 54, i32 0, metadata !100, metadata !269}
!274 = metadata !{i32 55, i32 0, metadata !142, metadata !269}
!275 = metadata !{i32 57, i32 0, metadata !143, metadata !269}
!276 = metadata !{i32 58, i32 0, metadata !143, metadata !269} ; [ DW_TAG_imported_module ]
!277 = metadata !{i8* getelementptr inbounds ([11 x i8]* @.str10, i64 0, i64 0)}
!278 = metadata !{null}
!279 = metadata !{i32 156, i32 0, metadata !54, null}
!280 = metadata !{i32 158, i32 0, metadata !281, null}
!281 = metadata !{i32 786443, metadata !5, metadata !54, i32 158, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!282 = metadata !{i32 159, i32 0, metadata !281, null}
!283 = metadata !{i32 161, i32 0, metadata !54, null}
!284 = metadata !{i32 162, i32 0, metadata !54, null}
!285 = metadata !{i32 786689, metadata !86, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !284} ; [ DW_TAG_arg_variable ] [s] [line 30]
!286 = metadata !{i32 30, i32 0, metadata !86, metadata !284}
!287 = metadata !{i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)}
!288 = metadata !{i32 786689, metadata !86, metadata !"error_msg", metadata !6, i32 33554462, metadata !48, i32 0, metadata !284} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!289 = metadata !{i32 786688, metadata !86, metadata !"res", metadata !6, i32 31, metadata !89, i32 0, metadata !284} ; [ DW_TAG_auto_variable ] [res] [line 31]
!290 = metadata !{i32 31, i32 0, metadata !86, metadata !284}
!291 = metadata !{i32 34, i32 0, metadata !174, metadata !284}
!292 = metadata !{i32 36, i32 0, metadata !86, metadata !284}
!293 = metadata !{i32 39, i32 0, metadata !177, metadata !284}
!294 = metadata !{i32 37, i32 0, metadata !178, metadata !284}
!295 = metadata !{i32 40, i32 0, metadata !182, metadata !284}
!296 = metadata !{i32 786688, metadata !86, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !284} ; [ DW_TAG_auto_variable ] [c] [line 32]
!297 = metadata !{i32 42, i32 0, metadata !185, metadata !284}
!298 = metadata !{i32 163, i32 0, metadata !54, null}
!299 = metadata !{i32 786689, metadata !86, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !298} ; [ DW_TAG_arg_variable ] [s] [line 30]
!300 = metadata !{i32 30, i32 0, metadata !86, metadata !298}
!301 = metadata !{i32 786689, metadata !86, metadata !"error_msg", metadata !6, i32 33554462, metadata !48, i32 0, metadata !298} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!302 = metadata !{i32 786688, metadata !86, metadata !"res", metadata !6, i32 31, metadata !89, i32 0, metadata !298} ; [ DW_TAG_auto_variable ] [res] [line 31]
!303 = metadata !{i32 31, i32 0, metadata !86, metadata !298}
!304 = metadata !{i32 34, i32 0, metadata !174, metadata !298}
!305 = metadata !{i32 36, i32 0, metadata !86, metadata !298}
!306 = metadata !{i32 39, i32 0, metadata !177, metadata !298}
!307 = metadata !{i32 37, i32 0, metadata !178, metadata !298}
!308 = metadata !{i32 40, i32 0, metadata !182, metadata !298}
!309 = metadata !{i32 786688, metadata !86, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !298} ; [ DW_TAG_auto_variable ] [c] [line 32]
!310 = metadata !{i32 42, i32 0, metadata !185, metadata !298}
!311 = metadata !{i32 165, i32 0, metadata !54, null}
!312 = metadata !{i32 786689, metadata !100, metadata !"a", metadata !6, i32 16777269, metadata !48, i32 0, metadata !313} ; [ DW_TAG_arg_variable ] [a] [line 53]
!313 = metadata !{i32 165, i32 0, metadata !58, null}
!314 = metadata !{i32 53, i32 0, metadata !100, metadata !313}
!315 = metadata !{i8* getelementptr inbounds ([12 x i8]* @.str12, i64 0, i64 0)}
!316 = metadata !{i32 786689, metadata !100, metadata !"b", metadata !6, i32 33554485, metadata !48, i32 0, metadata !313} ; [ DW_TAG_arg_variable ] [b] [line 53]
!317 = metadata !{i32 54, i32 0, metadata !100, metadata !313}
!318 = metadata !{i32 55, i32 0, metadata !142, metadata !313}
!319 = metadata !{i32 57, i32 0, metadata !143, metadata !313}
!320 = metadata !{i32 58, i32 0, metadata !143, metadata !313} ; [ DW_TAG_imported_module ]
!321 = metadata !{i32 786689, metadata !100, metadata !"a", metadata !6, i32 16777269, metadata !48, i32 0, metadata !322} ; [ DW_TAG_arg_variable ] [a] [line 53]
!322 = metadata !{i32 166, i32 0, metadata !58, null}
!323 = metadata !{i32 53, i32 0, metadata !100, metadata !322}
!324 = metadata !{i8* getelementptr inbounds ([11 x i8]* @.str13, i64 0, i64 0)}
!325 = metadata !{i32 786689, metadata !100, metadata !"b", metadata !6, i32 33554485, metadata !48, i32 0, metadata !322} ; [ DW_TAG_arg_variable ] [b] [line 53]
!326 = metadata !{i32 54, i32 0, metadata !100, metadata !322}
!327 = metadata !{i32 55, i32 0, metadata !142, metadata !322}
!328 = metadata !{i32 57, i32 0, metadata !143, metadata !322}
!329 = metadata !{i32 58, i32 0, metadata !143, metadata !322} ; [ DW_TAG_imported_module ]
!330 = metadata !{null}
!331 = metadata !{i32 167, i32 0, metadata !57, null}
!332 = metadata !{i32 170, i32 0, metadata !333, null}
!333 = metadata !{i32 786443, metadata !5, metadata !57, i32 170, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!334 = metadata !{i32 171, i32 0, metadata !333, null}
!335 = metadata !{i32 173, i32 0, metadata !57, null}
!336 = metadata !{i32 786689, metadata !86, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !335} ; [ DW_TAG_arg_variable ] [s] [line 30]
!337 = metadata !{i32 30, i32 0, metadata !86, metadata !335}
!338 = metadata !{i8* getelementptr inbounds ([57 x i8]* @.str14, i64 0, i64 0)}
!339 = metadata !{i32 786689, metadata !86, metadata !"error_msg", metadata !6, i32 33554462, metadata !48, i32 0, metadata !335} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!340 = metadata !{i32 786688, metadata !86, metadata !"res", metadata !6, i32 31, metadata !89, i32 0, metadata !335} ; [ DW_TAG_auto_variable ] [res] [line 31]
!341 = metadata !{i32 31, i32 0, metadata !86, metadata !335}
!342 = metadata !{i32 34, i32 0, metadata !174, metadata !335}
!343 = metadata !{i32 36, i32 0, metadata !86, metadata !335}
!344 = metadata !{i32 39, i32 0, metadata !177, metadata !335}
!345 = metadata !{i32 37, i32 0, metadata !178, metadata !335}
!346 = metadata !{i32 40, i32 0, metadata !182, metadata !335}
!347 = metadata !{i32 786688, metadata !86, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !335} ; [ DW_TAG_auto_variable ] [c] [line 32]
!348 = metadata !{i32 42, i32 0, metadata !185, metadata !335}
!349 = metadata !{i32 174, i32 0, metadata !57, null}
!350 = metadata !{i32 786689, metadata !100, metadata !"a", metadata !6, i32 16777269, metadata !48, i32 0, metadata !351} ; [ DW_TAG_arg_variable ] [a] [line 53]
!351 = metadata !{i32 174, i32 0, metadata !64, null}
!352 = metadata !{i32 53, i32 0, metadata !100, metadata !351}
!353 = metadata !{i8* getelementptr inbounds ([13 x i8]* @.str15, i64 0, i64 0)}
!354 = metadata !{i32 786689, metadata !100, metadata !"b", metadata !6, i32 33554485, metadata !48, i32 0, metadata !351} ; [ DW_TAG_arg_variable ] [b] [line 53]
!355 = metadata !{i32 54, i32 0, metadata !100, metadata !351}
!356 = metadata !{i32 55, i32 0, metadata !142, metadata !351}
!357 = metadata !{i32 57, i32 0, metadata !143, metadata !351}
!358 = metadata !{i32 58, i32 0, metadata !143, metadata !351} ; [ DW_TAG_imported_module ]
!359 = metadata !{i32 786689, metadata !100, metadata !"a", metadata !6, i32 16777269, metadata !48, i32 0, metadata !360} ; [ DW_TAG_arg_variable ] [a] [line 53]
!360 = metadata !{i32 175, i32 0, metadata !64, null}
!361 = metadata !{i32 53, i32 0, metadata !100, metadata !360}
!362 = metadata !{i8* getelementptr inbounds ([12 x i8]* @.str16, i64 0, i64 0)}
!363 = metadata !{i32 786689, metadata !100, metadata !"b", metadata !6, i32 33554485, metadata !48, i32 0, metadata !360} ; [ DW_TAG_arg_variable ] [b] [line 53]
!364 = metadata !{i32 54, i32 0, metadata !100, metadata !360}
!365 = metadata !{i32 55, i32 0, metadata !142, metadata !360}
!366 = metadata !{i32 57, i32 0, metadata !143, metadata !360}
!367 = metadata !{i32 58, i32 0, metadata !143, metadata !360} ; [ DW_TAG_imported_module ]
!368 = metadata !{i32 1}
!369 = metadata !{i32 176, i32 0, metadata !370, null}
!370 = metadata !{i32 786443, metadata !5, metadata !64, i32 175, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!371 = metadata !{i32 177, i32 0, metadata !370, null}
!372 = metadata !{i32 178, i32 0, metadata !370, null}
!373 = metadata !{i32 786689, metadata !100, metadata !"a", metadata !6, i32 16777269, metadata !48, i32 0, metadata !374} ; [ DW_TAG_arg_variable ] [a] [line 53]
!374 = metadata !{i32 179, i32 0, metadata !63, null}
!375 = metadata !{i32 53, i32 0, metadata !100, metadata !374}
!376 = metadata !{i8* getelementptr inbounds ([18 x i8]* @.str17, i64 0, i64 0)}
!377 = metadata !{i32 786689, metadata !100, metadata !"b", metadata !6, i32 33554485, metadata !48, i32 0, metadata !374} ; [ DW_TAG_arg_variable ] [b] [line 53]
!378 = metadata !{i32 54, i32 0, metadata !100, metadata !374}
!379 = metadata !{i32 55, i32 0, metadata !142, metadata !374}
!380 = metadata !{i32 57, i32 0, metadata !143, metadata !374}
!381 = metadata !{i32 58, i32 0, metadata !143, metadata !374} ; [ DW_TAG_imported_module ]
!382 = metadata !{i8* getelementptr inbounds ([17 x i8]* @.str18, i64 0, i64 0)}
!383 = metadata !{i32 180, i32 0, metadata !384, null}
!384 = metadata !{i32 786443, metadata !5, metadata !63, i32 179, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!385 = metadata !{i32 181, i32 0, metadata !384, null}
!386 = metadata !{i32 182, i32 0, metadata !384, null}
!387 = metadata !{i32 786689, metadata !100, metadata !"a", metadata !6, i32 16777269, metadata !48, i32 0, metadata !388} ; [ DW_TAG_arg_variable ] [a] [line 53]
!388 = metadata !{i32 183, i32 0, metadata !62, null}
!389 = metadata !{i32 53, i32 0, metadata !100, metadata !388}
!390 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str19, i64 0, i64 0)}
!391 = metadata !{i32 786689, metadata !100, metadata !"b", metadata !6, i32 33554485, metadata !48, i32 0, metadata !388} ; [ DW_TAG_arg_variable ] [b] [line 53]
!392 = metadata !{i32 54, i32 0, metadata !100, metadata !388}
!393 = metadata !{i32 55, i32 0, metadata !142, metadata !388}
!394 = metadata !{i32 57, i32 0, metadata !143, metadata !388}
!395 = metadata !{i32 58, i32 0, metadata !143, metadata !388} ; [ DW_TAG_imported_module ]
!396 = metadata !{i8* getelementptr inbounds ([9 x i8]* @.str20, i64 0, i64 0)}
!397 = metadata !{i32 184, i32 0, metadata !398, null}
!398 = metadata !{i32 786443, metadata !5, metadata !62, i32 183, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!399 = metadata !{i32 185, i32 0, metadata !398, null}
!400 = metadata !{i32 186, i32 0, metadata !398, null}
!401 = metadata !{i32 786689, metadata !100, metadata !"a", metadata !6, i32 16777269, metadata !48, i32 0, metadata !402} ; [ DW_TAG_arg_variable ] [a] [line 53]
!402 = metadata !{i32 187, i32 0, metadata !61, null}
!403 = metadata !{i32 53, i32 0, metadata !100, metadata !402}
!404 = metadata !{i8* getelementptr inbounds ([11 x i8]* @.str21, i64 0, i64 0)}
!405 = metadata !{i32 786689, metadata !100, metadata !"b", metadata !6, i32 33554485, metadata !48, i32 0, metadata !402} ; [ DW_TAG_arg_variable ] [b] [line 53]
!406 = metadata !{i32 54, i32 0, metadata !100, metadata !402}
!407 = metadata !{i32 55, i32 0, metadata !142, metadata !402}
!408 = metadata !{i32 57, i32 0, metadata !143, metadata !402}
!409 = metadata !{i32 58, i32 0, metadata !143, metadata !402} ; [ DW_TAG_imported_module ]
!410 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str22, i64 0, i64 0)}
!411 = metadata !{null}
!412 = metadata !{i32 188, i32 0, metadata !60, null}
!413 = metadata !{i32 189, i32 0, metadata !414, null}
!414 = metadata !{i32 786443, metadata !5, metadata !60, i32 189, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!415 = metadata !{i32 190, i32 0, metadata !414, null}
!416 = metadata !{i32 192, i32 0, metadata !60, null}
!417 = metadata !{i32 786689, metadata !86, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !416} ; [ DW_TAG_arg_variable ] [s] [line 30]
!418 = metadata !{i32 30, i32 0, metadata !86, metadata !416}
!419 = metadata !{i8* getelementptr inbounds ([54 x i8]* @.str23, i64 0, i64 0)}
!420 = metadata !{i32 786689, metadata !86, metadata !"error_msg", metadata !6, i32 33554462, metadata !48, i32 0, metadata !416} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!421 = metadata !{i32 786688, metadata !86, metadata !"res", metadata !6, i32 31, metadata !89, i32 0, metadata !416} ; [ DW_TAG_auto_variable ] [res] [line 31]
!422 = metadata !{i32 31, i32 0, metadata !86, metadata !416}
!423 = metadata !{i32 34, i32 0, metadata !174, metadata !416}
!424 = metadata !{i32 36, i32 0, metadata !86, metadata !416}
!425 = metadata !{i32 39, i32 0, metadata !177, metadata !416}
!426 = metadata !{i32 37, i32 0, metadata !178, metadata !416}
!427 = metadata !{i32 40, i32 0, metadata !182, metadata !416}
!428 = metadata !{i32 786688, metadata !86, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !416} ; [ DW_TAG_auto_variable ] [c] [line 32]
!429 = metadata !{i32 42, i32 0, metadata !185, metadata !416}
!430 = metadata !{i32 193, i32 0, metadata !60, null}
!431 = metadata !{i32 196, i32 0, metadata !432, null}
!432 = metadata !{i32 786443, metadata !5, metadata !61, i32 194, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!433 = metadata !{i32 786689, metadata !78, metadata !"argcMax", metadata !6, i32 67108940, metadata !10, i32 0, metadata !431} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!434 = metadata !{i32 76, i32 0, metadata !78, metadata !431}
!435 = metadata !{i32 77, i32 0, metadata !192, metadata !431}
!436 = metadata !{i32 78, i32 0, metadata !194, metadata !431}
!437 = metadata !{i32 80, i32 0, metadata !196, metadata !431}
!438 = metadata !{i32 81, i32 0, metadata !196, metadata !431}
!439 = metadata !{i32 201, i32 0, metadata !4, null}
!440 = metadata !{i32 206, i32 0, metadata !4, null}
!441 = metadata !{i32 208, i32 0, metadata !4, null}
!442 = metadata !{i32 210, i32 0, metadata !4, null}
!443 = metadata !{i32 23, i32 0, metadata !95, null}
!444 = metadata !{i32 24, i32 0, metadata !95, null}
!445 = metadata !{i32 63, i32 0, metadata !65, null}
!446 = metadata !{i32 65, i32 0, metadata !65, null}
!447 = metadata !{i32 66, i32 0, metadata !65, null}
!448 = metadata !{i32 67, i32 0, metadata !65, null}
!449 = metadata !{i32 69, i32 0, metadata !450, null}
!450 = metadata !{i32 786443, metadata !5, metadata !65, i32 69, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/POSIX/klee_init_env.c]
!451 = metadata !{i32 70, i32 0, metadata !450, null}
!452 = metadata !{i32 786689, metadata !73, metadata !"c", metadata !6, i32 16777264, metadata !49, i32 0, metadata !451} ; [ DW_TAG_arg_variable ] [c] [line 48]
!453 = metadata !{i32 48, i32 0, metadata !73, metadata !451}
!454 = metadata !{i32 50, i32 0, metadata !73, metadata !451}
!455 = metadata !{i32 72, i32 0, metadata !65, null}
!456 = metadata !{i32 73, i32 0, metadata !65, null}
