; ModuleID = '/home/sanghu/TracerX/tracerx/test/Feature/Output/Vararg.c.tmp1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.triple = type { i32, i32, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [37 x i8] c"types: (%d, %lld, %.2f, (%d,%d,%d))\0A\00", align 1
@main.p = private unnamed_addr constant %struct.triple { i32 9, i32 12, i32 15 }, align 4
@.str1 = private unnamed_addr constant [19 x i8] c"sum(2, 3, 4) == 11\00", align 1
@.str2 = private unnamed_addr constant [51 x i8] c"/home/sanghu/TracerX/tracerx/test/Feature/Vararg.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str3 = private unnamed_addr constant [12 x i8] c"sum(0) == 0\00", align 1
@.str4 = private unnamed_addr constant [34 x i8] c"va_array(5, 0, 5, 1, 1, 2, 1)==45\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str16 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str27 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str38 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c"klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @test1(i32 %x, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %i32 = alloca i32, align 4
  %i64 = alloca i64, align 8
  %d = alloca double, align 8
  %p = alloca %struct.triple, align 4
  store i32 %x, i32* %2, align 4
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = getelementptr inbounds %struct.__va_list_tag* %5, i32 0, i32 0
  %7 = load i32* %6
  %8 = icmp ule i32 %7, 40
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %struct.__va_list_tag* %5, i32 0, i32 3
  %11 = load i8** %10
  %12 = getelementptr i8* %11, i32 %7
  %13 = bitcast i8* %12 to i32*
  %14 = add i32 %7, 8
  store i32 %14, i32* %6
  br label %20

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %struct.__va_list_tag* %5, i32 0, i32 2
  %17 = load i8** %16
  %18 = bitcast i8* %17 to i32*
  %19 = getelementptr i8* %17, i32 8
  store i8* %19, i8** %16
  br label %20

; <label>:20                                      ; preds = %15, %9
  %21 = phi i32* [ %13, %9 ], [ %18, %15 ]
  %22 = load i32* %21
  store i32 %22, i32* %i32, align 4
  %23 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %24 = getelementptr inbounds %struct.__va_list_tag* %23, i32 0, i32 0
  %25 = load i32* %24
  %26 = icmp ule i32 %25, 40
  br i1 %26, label %27, label %33

; <label>:27                                      ; preds = %20
  %28 = getelementptr inbounds %struct.__va_list_tag* %23, i32 0, i32 3
  %29 = load i8** %28
  %30 = getelementptr i8* %29, i32 %25
  %31 = bitcast i8* %30 to i64*
  %32 = add i32 %25, 8
  store i32 %32, i32* %24
  br label %38

; <label>:33                                      ; preds = %20
  %34 = getelementptr inbounds %struct.__va_list_tag* %23, i32 0, i32 2
  %35 = load i8** %34
  %36 = bitcast i8* %35 to i64*
  %37 = getelementptr i8* %35, i32 8
  store i8* %37, i8** %34
  br label %38

; <label>:38                                      ; preds = %33, %27
  %39 = phi i64* [ %31, %27 ], [ %36, %33 ]
  %40 = load i64* %39
  store i64 %40, i64* %i64, align 8
  %41 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %42 = getelementptr inbounds %struct.__va_list_tag* %41, i32 0, i32 1
  %43 = load i32* %42
  %44 = icmp ule i32 %43, 160
  br i1 %44, label %45, label %51

; <label>:45                                      ; preds = %38
  %46 = getelementptr inbounds %struct.__va_list_tag* %41, i32 0, i32 3
  %47 = load i8** %46
  %48 = getelementptr i8* %47, i32 %43
  %49 = bitcast i8* %48 to double*
  %50 = add i32 %43, 16
  store i32 %50, i32* %42
  br label %56

; <label>:51                                      ; preds = %38
  %52 = getelementptr inbounds %struct.__va_list_tag* %41, i32 0, i32 2
  %53 = load i8** %52
  %54 = bitcast i8* %53 to double*
  %55 = getelementptr i8* %53, i32 8
  store i8* %55, i8** %52
  br label %56

; <label>:56                                      ; preds = %51, %45
  %57 = phi double* [ %49, %45 ], [ %54, %51 ]
  %58 = load double* %57
  store double %58, double* %d, align 8
  %59 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %60 = getelementptr inbounds %struct.__va_list_tag* %59, i32 0, i32 0
  %61 = load i32* %60
  %62 = icmp ule i32 %61, 32
  br i1 %62, label %63, label %69

; <label>:63                                      ; preds = %56
  %64 = getelementptr inbounds %struct.__va_list_tag* %59, i32 0, i32 3
  %65 = load i8** %64
  %66 = getelementptr i8* %65, i32 %61
  %67 = bitcast i8* %66 to %struct.triple*
  %68 = add i32 %61, 16
  store i32 %68, i32* %60
  br label %74

; <label>:69                                      ; preds = %56
  %70 = getelementptr inbounds %struct.__va_list_tag* %59, i32 0, i32 2
  %71 = load i8** %70
  %72 = bitcast i8* %71 to %struct.triple*
  %73 = getelementptr i8* %71, i32 16
  store i8* %73, i8** %70
  br label %74

; <label>:74                                      ; preds = %69, %63
  %75 = phi %struct.triple* [ %67, %63 ], [ %72, %69 ]
  %76 = bitcast %struct.triple* %p to i8*
  %77 = bitcast %struct.triple* %75 to i8*
  %78 = call i8* @memcpy(i8* %76, i8* %77, i64 12)
  %79 = load i32* %i32, align 4
  %80 = load i64* %i64, align 8
  %81 = load double* %d, align 8
  %82 = getelementptr inbounds %struct.triple* %p, i32 0, i32 0
  %83 = load i32* %82, align 4
  %84 = getelementptr inbounds %struct.triple* %p, i32 0, i32 1
  %85 = load i32* %84, align 4
  %86 = getelementptr inbounds %struct.triple* %p, i32 0, i32 2
  %87 = load i32* %86, align 4
  %88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 %79, i64 %80, double %81, i32 %83, i32 %85, i32 %87)
  %89 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %90 = bitcast %struct.__va_list_tag* %89 to i8*
  call void @llvm.va_end(i8* %90)
  %91 = load i32* %1
  ret i32 %91
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @sum(i32 %N, ...) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %res = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %ap2 = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %N, i32* %1, align 4
  store i32 0, i32* %res, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %44, %0
  %5 = load i32* %i, align 4
  %6 = load i32* %1, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %47

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %23

; <label>:11                                      ; preds = %8
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap2, i32 0, i32 0
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %14 = bitcast %struct.__va_list_tag* %12 to i8*
  %15 = bitcast %struct.__va_list_tag* %13 to i8*
  %vacopy.cast.dst = bitcast i8* %14 to i64*
  %vacopy.cast.src = bitcast i8* %15 to i64*
  %16 = load i64* %vacopy.cast.src
  store i64 %16, i64* %vacopy.cast.dst
  %17 = getelementptr i64* %vacopy.cast.dst, i64 1
  %18 = getelementptr i64* %vacopy.cast.src, i64 1
  %19 = load i64* %18
  store i64 %19, i64* %17
  %20 = getelementptr i64* %17, i64 1
  %21 = getelementptr i64* %18, i64 1
  %22 = load i64* %21
  store i64 %22, i64* %20
  br label %23

; <label>:23                                      ; preds = %11, %8
  %24 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %25 = getelementptr inbounds %struct.__va_list_tag* %24, i32 0, i32 0
  %26 = load i32* %25
  %27 = icmp ule i32 %26, 40
  br i1 %27, label %28, label %34

; <label>:28                                      ; preds = %23
  %29 = getelementptr inbounds %struct.__va_list_tag* %24, i32 0, i32 3
  %30 = load i8** %29
  %31 = getelementptr i8* %30, i32 %26
  %32 = bitcast i8* %31 to i32*
  %33 = add i32 %26, 8
  store i32 %33, i32* %25
  br label %39

; <label>:34                                      ; preds = %23
  %35 = getelementptr inbounds %struct.__va_list_tag* %24, i32 0, i32 2
  %36 = load i8** %35
  %37 = bitcast i8* %36 to i32*
  %38 = getelementptr i8* %36, i32 8
  store i8* %38, i8** %35
  br label %39

; <label>:39                                      ; preds = %34, %28
  %40 = phi i32* [ %32, %28 ], [ %37, %34 ]
  %41 = load i32* %40
  %42 = load i32* %res, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, i32* %res, align 4
  br label %44

; <label>:44                                      ; preds = %39
  %45 = load i32* %i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %4

; <label>:47                                      ; preds = %4
  store i32 0, i32* %i, align 4
  br label %48

; <label>:48                                      ; preds = %74, %47
  %49 = load i32* %i, align 4
  %50 = load i32* %1, align 4
  %51 = sub nsw i32 %50, 1
  %52 = icmp slt i32 %49, %51
  br i1 %52, label %53, label %77

; <label>:53                                      ; preds = %48
  %54 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap2, i32 0, i32 0
  %55 = getelementptr inbounds %struct.__va_list_tag* %54, i32 0, i32 0
  %56 = load i32* %55
  %57 = icmp ule i32 %56, 40
  br i1 %57, label %58, label %64

; <label>:58                                      ; preds = %53
  %59 = getelementptr inbounds %struct.__va_list_tag* %54, i32 0, i32 3
  %60 = load i8** %59
  %61 = getelementptr i8* %60, i32 %56
  %62 = bitcast i8* %61 to i32*
  %63 = add i32 %56, 8
  store i32 %63, i32* %55
  br label %69

; <label>:64                                      ; preds = %53
  %65 = getelementptr inbounds %struct.__va_list_tag* %54, i32 0, i32 2
  %66 = load i8** %65
  %67 = bitcast i8* %66 to i32*
  %68 = getelementptr i8* %66, i32 8
  store i8* %68, i8** %65
  br label %69

; <label>:69                                      ; preds = %64, %58
  %70 = phi i32* [ %62, %58 ], [ %67, %64 ]
  %71 = load i32* %70
  %72 = load i32* %res, align 4
  %73 = add nsw i32 %72, %71
  store i32 %73, i32* %res, align 4
  br label %74

; <label>:74                                      ; preds = %69
  %75 = load i32* %i, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %i, align 4
  br label %48

; <label>:77                                      ; preds = %48
  %78 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %79 = bitcast %struct.__va_list_tag* %78 to i8*
  call void @llvm.va_end(i8* %79)
  %80 = load i32* %res, align 4
  ret i32 %80
}

; Function Attrs: nounwind
declare void @llvm.va_copy(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define i32 @va_array(i32 %N, ...) #0 {
  %1 = alloca i32, align 4
  %aps = alloca [2 x [1 x %struct.__va_list_tag]], align 16
  %i = alloca i32, align 4
  %sum1 = alloca i32, align 4
  %sum2 = alloca i32, align 4
  %cmd = alloca i32, align 4
  store i32 %N, i32* %1, align 4
  store i32 0, i32* %sum1, align 4
  store i32 0, i32* %sum2, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i32* %i, align 4
  %4 = icmp ult i32 %3, 2
  br i1 %4, label %5, label %14

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 %7
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %8, i32 0, i32 0
  %10 = bitcast %struct.__va_list_tag* %9 to i8*
  call void @llvm.va_start(i8* %10)
  br label %11

; <label>:11                                      ; preds = %5
  %12 = load i32* %i, align 4
  %13 = add i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %2

; <label>:14                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %15

; <label>:15                                      ; preds = %108, %14
  %16 = load i32* %i, align 4
  %17 = load i32* %1, align 4
  %18 = icmp ult i32 %16, %17
  br i1 %18, label %19, label %111

; <label>:19                                      ; preds = %15
  %20 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 0
  %21 = getelementptr inbounds [1 x %struct.__va_list_tag]* %20, i32 0, i32 0
  %22 = getelementptr inbounds %struct.__va_list_tag* %21, i32 0, i32 0
  %23 = load i32* %22
  %24 = icmp ule i32 %23, 40
  br i1 %24, label %25, label %31

; <label>:25                                      ; preds = %19
  %26 = getelementptr inbounds %struct.__va_list_tag* %21, i32 0, i32 3
  %27 = load i8** %26
  %28 = getelementptr i8* %27, i32 %23
  %29 = bitcast i8* %28 to i32*
  %30 = add i32 %23, 8
  store i32 %30, i32* %22
  br label %36

; <label>:31                                      ; preds = %19
  %32 = getelementptr inbounds %struct.__va_list_tag* %21, i32 0, i32 2
  %33 = load i8** %32
  %34 = bitcast i8* %33 to i32*
  %35 = getelementptr i8* %33, i32 8
  store i8* %35, i8** %32
  br label %36

; <label>:36                                      ; preds = %31, %25
  %37 = phi i32* [ %29, %25 ], [ %34, %31 ]
  %38 = load i32* %37
  store i32 %38, i32* %cmd, align 4
  %39 = load i32* %cmd, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %63

; <label>:41                                      ; preds = %36
  %42 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 0
  %43 = getelementptr inbounds [1 x %struct.__va_list_tag]* %42, i32 0, i32 0
  %44 = getelementptr inbounds %struct.__va_list_tag* %43, i32 0, i32 0
  %45 = load i32* %44
  %46 = icmp ule i32 %45, 40
  br i1 %46, label %47, label %53

; <label>:47                                      ; preds = %41
  %48 = getelementptr inbounds %struct.__va_list_tag* %43, i32 0, i32 3
  %49 = load i8** %48
  %50 = getelementptr i8* %49, i32 %45
  %51 = bitcast i8* %50 to i32*
  %52 = add i32 %45, 8
  store i32 %52, i32* %44
  br label %58

; <label>:53                                      ; preds = %41
  %54 = getelementptr inbounds %struct.__va_list_tag* %43, i32 0, i32 2
  %55 = load i8** %54
  %56 = bitcast i8* %55 to i32*
  %57 = getelementptr i8* %55, i32 8
  store i8* %57, i8** %54
  br label %58

; <label>:58                                      ; preds = %53, %47
  %59 = phi i32* [ %51, %47 ], [ %56, %53 ]
  %60 = load i32* %59
  %61 = load i32* %sum1, align 4
  %62 = add i32 %61, %60
  store i32 %62, i32* %sum1, align 4
  br label %107

; <label>:63                                      ; preds = %36
  %64 = load i32* %cmd, align 4
  %65 = icmp eq i32 %64, 1
  br i1 %65, label %66, label %88

; <label>:66                                      ; preds = %63
  %67 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 1
  %68 = getelementptr inbounds [1 x %struct.__va_list_tag]* %67, i32 0, i32 0
  %69 = getelementptr inbounds %struct.__va_list_tag* %68, i32 0, i32 0
  %70 = load i32* %69
  %71 = icmp ule i32 %70, 40
  br i1 %71, label %72, label %78

; <label>:72                                      ; preds = %66
  %73 = getelementptr inbounds %struct.__va_list_tag* %68, i32 0, i32 3
  %74 = load i8** %73
  %75 = getelementptr i8* %74, i32 %70
  %76 = bitcast i8* %75 to i32*
  %77 = add i32 %70, 8
  store i32 %77, i32* %69
  br label %83

; <label>:78                                      ; preds = %66
  %79 = getelementptr inbounds %struct.__va_list_tag* %68, i32 0, i32 2
  %80 = load i8** %79
  %81 = bitcast i8* %80 to i32*
  %82 = getelementptr i8* %80, i32 8
  store i8* %82, i8** %79
  br label %83

; <label>:83                                      ; preds = %78, %72
  %84 = phi i32* [ %76, %72 ], [ %81, %78 ]
  %85 = load i32* %84
  %86 = load i32* %sum2, align 4
  %87 = add i32 %86, %85
  store i32 %87, i32* %sum2, align 4
  br label %106

; <label>:88                                      ; preds = %63
  %89 = load i32* %cmd, align 4
  %90 = icmp eq i32 %89, 2
  br i1 %90, label %91, label %105

; <label>:91                                      ; preds = %88
  %92 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 1
  %93 = getelementptr inbounds [1 x %struct.__va_list_tag]* %92, i32 0, i32 0
  %94 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 0
  %95 = getelementptr inbounds [1 x %struct.__va_list_tag]* %94, i32 0, i32 0
  %96 = bitcast %struct.__va_list_tag* %93 to i8*
  %97 = bitcast %struct.__va_list_tag* %95 to i8*
  %vacopy.cast.dst = bitcast i8* %96 to i64*
  %vacopy.cast.src = bitcast i8* %97 to i64*
  %98 = load i64* %vacopy.cast.src
  store i64 %98, i64* %vacopy.cast.dst
  %99 = getelementptr i64* %vacopy.cast.dst, i64 1
  %100 = getelementptr i64* %vacopy.cast.src, i64 1
  %101 = load i64* %100
  store i64 %101, i64* %99
  %102 = getelementptr i64* %99, i64 1
  %103 = getelementptr i64* %100, i64 1
  %104 = load i64* %103
  store i64 %104, i64* %102
  br label %105

; <label>:105                                     ; preds = %91, %88
  br label %106

; <label>:106                                     ; preds = %105, %83
  br label %107

; <label>:107                                     ; preds = %106, %58
  br label %108

; <label>:108                                     ; preds = %107
  %109 = load i32* %i, align 4
  %110 = add i32 %109, 1
  store i32 %110, i32* %i, align 4
  br label %15

; <label>:111                                     ; preds = %15
  store i32 0, i32* %i, align 4
  br label %112

; <label>:112                                     ; preds = %121, %111
  %113 = load i32* %i, align 4
  %114 = icmp ult i32 %113, 2
  br i1 %114, label %115, label %124

; <label>:115                                     ; preds = %112
  %116 = load i32* %i, align 4
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 %117
  %119 = getelementptr inbounds [1 x %struct.__va_list_tag]* %118, i32 0, i32 0
  %120 = bitcast %struct.__va_list_tag* %119 to i8*
  call void @llvm.va_end(i8* %120)
  br label %121

; <label>:121                                     ; preds = %115
  %122 = load i32* %i, align 4
  %123 = add i32 %122, 1
  store i32 %123, i32* %i, align 4
  br label %112

; <label>:124                                     ; preds = %112
  %125 = load i32* %sum1, align 4
  %126 = mul i32 3, %125
  %127 = load i32* %sum2, align 4
  %128 = mul i32 5, %127
  %129 = add i32 %126, %128
  ret i32 %129
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca %struct.triple, align 4
  %2 = alloca { i64, i32 }
  %3 = alloca { i64, i32 }
  store i32 0, i32* %1
  %4 = bitcast %struct.triple* %p to i8*
  %5 = call i8* @memcpy(i8* %4, i8* bitcast (%struct.triple* @main.p to i8*), i64 12)
  %6 = bitcast { i64, i32 }* %2 to i8*
  %7 = bitcast %struct.triple* %p to i8*
  %8 = call i8* @memcpy(i8* %6, i8* %7, i64 12)
  %9 = getelementptr { i64, i32 }* %2, i32 0, i32 0
  %10 = load i64* %9, align 1
  %11 = getelementptr { i64, i32 }* %2, i32 0, i32 1
  %12 = load i32* %11, align 1
  %13 = call i32 (i32, ...)* @test1(i32 -1, i32 52, i64 37, double 2.000000e+00, i64 %10, i32 %12)
  %14 = call i32 (i32, ...)* @sum(i32 2, i32 3, i32 4)
  %15 = icmp eq i32 %14, 11
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %0
  br label %19

; <label>:17                                      ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([51 x i8]* @.str2, i32 0, i32 0), i32 75, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %19

; <label>:19                                      ; preds = %18, %16
  %20 = call i32 (i32, ...)* @sum(i32 0)
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %19
  br label %25

; <label>:23                                      ; preds = %19
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([51 x i8]* @.str2, i32 0, i32 0), i32 76, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %25

; <label>:25                                      ; preds = %24, %22
  %26 = call i32 (i32, ...)* @va_array(i32 5, i32 0, i32 5, i32 1, i32 1, i32 2, i32 1)
  %27 = icmp eq i32 %26, 45
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  br label %31

; <label>:29                                      ; preds = %25
  call void @__assert_fail(i8* getelementptr inbounds ([34 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([51 x i8]* @.str2, i32 0, i32 0), i32 77, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %31

; <label>:31                                      ; preds = %30, %28
  %32 = bitcast { i64, i32 }* %3 to i8*
  %33 = bitcast %struct.triple* %p to i8*
  %34 = call i8* @memcpy(i8* %32, i8* %33, i64 12)
  %35 = getelementptr { i64, i32 }* %3, i32 0, i32 0
  %36 = load i64* %35, align 1
  %37 = getelementptr { i64, i32 }* %3, i32 0, i32 1
  %38 = load i32* %37, align 1
  %39 = call i32 (i32, ...)* @test1(i32 -1, i32 52, double 2.000000e+00, i64 %36, i32 %38)
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #4 {
  %1 = icmp eq i64 %z, 0, !dbg !121
  br i1 %1, label %2, label %3, !dbg !121

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str16, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str27, i64 0, i64 0)) #9, !dbg !123
  unreachable, !dbg !123

; <label>:3                                       ; preds = %0
  ret void, !dbg !124
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #6

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !125
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #10, !dbg !125
  %2 = load i32* %x, align 4, !dbg !126, !tbaa !127
  ret i32 %2, !dbg !126
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #6

declare void @klee_make_symbolic(i8*, i64, i8*) #7

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #4 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !131
  br i1 %1, label %3, label %2, !dbg !131

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str38, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #9, !dbg !133
  unreachable, !dbg !133

; <label>:3                                       ; preds = %0
  ret void, !dbg !135
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !136
  br i1 %1, label %3, label %2, !dbg !136

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #9, !dbg !138
  unreachable, !dbg !138

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !139
  %5 = icmp eq i32 %4, %end, !dbg !139
  br i1 %5, label %21, label %6, !dbg !139

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !141
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #10, !dbg !141
  %8 = icmp eq i32 %start, 0, !dbg !143
  %9 = load i32* %x, align 4, !dbg !145, !tbaa !127
  br i1 %8, label %10, label %13, !dbg !143

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !145
  %12 = zext i1 %11 to i64, !dbg !145
  call void @klee_assume(i64 %12) #10, !dbg !145
  br label %19, !dbg !147

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !148
  %15 = zext i1 %14 to i64, !dbg !148
  call void @klee_assume(i64 %15) #10, !dbg !148
  %16 = load i32* %x, align 4, !dbg !150, !tbaa !127
  %17 = icmp slt i32 %16, %end, !dbg !150
  %18 = zext i1 %17 to i64, !dbg !150
  call void @klee_assume(i64 %18) #10, !dbg !150
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !151, !tbaa !127
  br label %21, !dbg !151

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !152
}

declare void @klee_assume(i64) #7

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
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
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #4 {
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
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
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
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #4 {
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

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-floa
attributes #4 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }
attributes #9 = { nobuiltin noreturn nounwind }
attributes #10 = { nobuiltin nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.dbg.cu = !{!1, !13, !28, !40, !53, !73, !88, !103}
!llvm.module.flags = !{!119, !120}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!1 = metadata !{i32 786449, metadata !2, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !4, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home/sa
!2 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!3 = metadata !{i32 0}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, metadata !6, metadata !7, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !8, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null, nu
!6 = metadata !{metadata !"klee_div_zero_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!7 = metadata !{i32 786473, metadata !6}          ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!8 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !9, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!9 = metadata !{null, metadata !10}
!10 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786689, metadata !5, metadata !"z", metadata !7, i32 16777228, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!13 = metadata !{i32 786449, metadata !14, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !15, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!14 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786478, metadata !17, metadata !18, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !25, i32 13} ; [ 
!17 = metadata !{metadata !"klee_int.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!18 = metadata !{i32 786473, metadata !17}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_int.c]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{metadata !21, metadata !22}
!21 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!24 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!25 = metadata !{metadata !26, metadata !27}
!26 = metadata !{i32 786689, metadata !16, metadata !"name", metadata !18, i32 16777229, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!27 = metadata !{i32 786688, metadata !16, metadata !"x", metadata !18, i32 14, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!28 = metadata !{i32 786449, metadata !29, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !30, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!29 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 786478, metadata !32, metadata !33, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !34, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!32 = metadata !{metadata !"klee_overshift_check.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!33 = metadata !{i32 786473, metadata !32}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!34 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = metadata !{null, metadata !36, metadata !36}
!36 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!37 = metadata !{metadata !38, metadata !39}
!38 = metadata !{i32 786689, metadata !31, metadata !"bitWidth", metadata !33, i32 16777236, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!39 = metadata !{i32 786689, metadata !31, metadata !"shift", metadata !33, i32 33554452, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!40 = metadata !{i32 786449, metadata !41, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !42, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!41 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!42 = metadata !{metadata !43}
!43 = metadata !{i32 786478, metadata !44, metadata !45, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!44 = metadata !{metadata !"klee_range.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!45 = metadata !{i32 786473, metadata !44}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!46 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{metadata !21, metadata !21, metadata !21, metadata !22}
!48 = metadata !{metadata !49, metadata !50, metadata !51, metadata !52}
!49 = metadata !{i32 786689, metadata !43, metadata !"start", metadata !45, i32 16777229, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!50 = metadata !{i32 786689, metadata !43, metadata !"end", metadata !45, i32 33554445, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!51 = metadata !{i32 786689, metadata !43, metadata !"name", metadata !45, i32 50331661, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!52 = metadata !{i32 786688, metadata !43, metadata !"x", metadata !45, i32 14, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!53 = metadata !{i32 786449, metadata !54, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !55, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!54 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!55 = metadata !{metadata !56}
!56 = metadata !{i32 786478, metadata !57, metadata !58, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !59, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !66, i32 12} 
!57 = metadata !{metadata !"memcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!58 = metadata !{i32 786473, metadata !57}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memcpy.c]
!59 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !60, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!60 = metadata !{metadata !61, metadata !61, metadata !62, metadata !64}
!61 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!62 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !63} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!63 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{i32 786454, metadata !57, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!65 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!66 = metadata !{metadata !67, metadata !68, metadata !69, metadata !70, metadata !72}
!67 = metadata !{i32 786689, metadata !56, metadata !"destaddr", metadata !58, i32 16777228, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!68 = metadata !{i32 786689, metadata !56, metadata !"srcaddr", metadata !58, i32 33554444, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!69 = metadata !{i32 786689, metadata !56, metadata !"len", metadata !58, i32 50331660, metadata !64, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!70 = metadata !{i32 786688, metadata !56, metadata !"dest", metadata !58, i32 13, metadata !71, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!71 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!72 = metadata !{i32 786688, metadata !56, metadata !"src", metadata !58, i32 14, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!73 = metadata !{i32 786449, metadata !74, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !75, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!74 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!75 = metadata !{metadata !76}
!76 = metadata !{i32 786478, metadata !77, metadata !78, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !79, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !82, i32 1
!77 = metadata !{metadata !"memmove.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!78 = metadata !{i32 786473, metadata !77}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!79 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = metadata !{metadata !61, metadata !61, metadata !62, metadata !81}
!81 = metadata !{i32 786454, metadata !77, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!82 = metadata !{metadata !83, metadata !84, metadata !85, metadata !86, metadata !87}
!83 = metadata !{i32 786689, metadata !76, metadata !"dst", metadata !78, i32 16777228, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!84 = metadata !{i32 786689, metadata !76, metadata !"src", metadata !78, i32 33554444, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!85 = metadata !{i32 786689, metadata !76, metadata !"count", metadata !78, i32 50331660, metadata !81, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!86 = metadata !{i32 786688, metadata !76, metadata !"a", metadata !78, i32 13, metadata !71, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!87 = metadata !{i32 786688, metadata !76, metadata !"b", metadata !78, i32 14, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!88 = metadata !{i32 786449, metadata !89, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !90, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/home
!89 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!90 = metadata !{metadata !91}
!91 = metadata !{i32 786478, metadata !92, metadata !93, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !94, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !97, i32 1
!92 = metadata !{metadata !"mempcpy.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!93 = metadata !{i32 786473, metadata !92}        ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/mempcpy.c]
!94 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !95, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!95 = metadata !{metadata !61, metadata !61, metadata !62, metadata !96}
!96 = metadata !{i32 786454, metadata !92, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!97 = metadata !{metadata !98, metadata !99, metadata !100, metadata !101, metadata !102}
!98 = metadata !{i32 786689, metadata !91, metadata !"destaddr", metadata !93, i32 16777227, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!99 = metadata !{i32 786689, metadata !91, metadata !"srcaddr", metadata !93, i32 33554443, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!100 = metadata !{i32 786689, metadata !91, metadata !"len", metadata !93, i32 50331659, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!101 = metadata !{i32 786688, metadata !91, metadata !"dest", metadata !93, i32 12, metadata !71, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!102 = metadata !{i32 786688, metadata !91, metadata !"src", metadata !93, i32 13, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!103 = metadata !{i32 786449, metadata !104, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !3, metadata !3, metadata !105, metadata !3, metadata !3, metadata !""} ; [ DW_TAG_compile_unit ] [/h
!104 = metadata !{metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!105 = metadata !{metadata !106}
!106 = metadata !{i32 786478, metadata !107, metadata !108, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !109, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !112, i32
!107 = metadata !{metadata !"memset.c", metadata !"/home/sanghu/TracerX/tracerx/runtime/Intrinsic"}
!108 = metadata !{i32 786473, metadata !107}      ; [ DW_TAG_file_type ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memset.c]
!109 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !110, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!110 = metadata !{metadata !61, metadata !61, metadata !21, metadata !111}
!111 = metadata !{i32 786454, metadata !107, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!112 = metadata !{metadata !113, metadata !114, metadata !115, metadata !116}
!113 = metadata !{i32 786689, metadata !106, metadata !"dst", metadata !108, i32 16777227, metadata !61, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!114 = metadata !{i32 786689, metadata !106, metadata !"s", metadata !108, i32 33554443, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!115 = metadata !{i32 786689, metadata !106, metadata !"count", metadata !108, i32 50331659, metadata !111, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!116 = metadata !{i32 786688, metadata !106, metadata !"a", metadata !108, i32 12, metadata !117, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!117 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !118} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!118 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !24} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!119 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!120 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!121 = metadata !{i32 13, i32 0, metadata !122, null}
!122 = metadata !{i32 786443, metadata !6, metadata !5, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_div_zero_check.c]
!123 = metadata !{i32 14, i32 0, metadata !122, null}
!124 = metadata !{i32 15, i32 0, metadata !5, null}
!125 = metadata !{i32 15, i32 0, metadata !16, null}
!126 = metadata !{i32 16, i32 0, metadata !16, null}
!127 = metadata !{metadata !128, metadata !128, i64 0}
!128 = metadata !{metadata !"int", metadata !129, i64 0}
!129 = metadata !{metadata !"omnipotent char", metadata !130, i64 0}
!130 = metadata !{metadata !"Simple C/C++ TBAA"}
!131 = metadata !{i32 21, i32 0, metadata !132, null}
!132 = metadata !{i32 786443, metadata !32, metadata !31, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!133 = metadata !{i32 27, i32 0, metadata !134, null}
!134 = metadata !{i32 786443, metadata !32, metadata !132, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_overshift_check.c]
!135 = metadata !{i32 29, i32 0, metadata !31, null}
!136 = metadata !{i32 16, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !44, metadata !43, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!138 = metadata !{i32 17, i32 0, metadata !137, null}
!139 = metadata !{i32 19, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !44, metadata !43, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!141 = metadata !{i32 22, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !44, metadata !140, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!143 = metadata !{i32 25, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !44, metadata !142, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!145 = metadata !{i32 26, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !44, metadata !144, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!147 = metadata !{i32 27, i32 0, metadata !146, null}
!148 = metadata !{i32 28, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !44, metadata !144, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/klee_range.c]
!150 = metadata !{i32 29, i32 0, metadata !149, null}
!151 = metadata !{i32 32, i32 0, metadata !142, null}
!152 = metadata !{i32 34, i32 0, metadata !43, null}
!153 = metadata !{i32 16, i32 0, metadata !56, null}
!154 = metadata !{i32 17, i32 0, metadata !56, null}
!155 = metadata !{metadata !155, metadata !156, metadata !157}
!156 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!157 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!158 = metadata !{metadata !129, metadata !129, i64 0}
!159 = metadata !{metadata !159, metadata !156, metadata !157}
!160 = metadata !{i32 18, i32 0, metadata !56, null}
!161 = metadata !{i32 16, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !77, metadata !76, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!163 = metadata !{i32 19, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !77, metadata !76, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!165 = metadata !{i32 20, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !77, metadata !164, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!167 = metadata !{metadata !167, metadata !156, metadata !157}
!168 = metadata !{metadata !168, metadata !156, metadata !157}
!169 = metadata !{i32 22, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !77, metadata !164, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/sanghu/TracerX/tracerx/runtime/Intrinsic/memmove.c]
!171 = metadata !{i32 24, i32 0, metadata !170, null}
!172 = metadata !{i32 23, i32 0, metadata !170, null}
!173 = metadata !{metadata !173, metadata !156, metadata !157}
!174 = metadata !{metadata !174, metadata !156, metadata !157}
!175 = metadata !{i32 28, i32 0, metadata !76, null}
!176 = metadata !{i32 15, i32 0, metadata !91, null}
!177 = metadata !{i32 16, i32 0, metadata !91, null}
!178 = metadata !{metadata !178, metadata !156, metadata !157}
!179 = metadata !{metadata !179, metadata !156, metadata !157}
!180 = metadata !{i32 17, i32 0, metadata !91, null}
!181 = metadata !{i32 13, i32 0, metadata !106, null}
!182 = metadata !{i32 14, i32 0, metadata !106, null}
!183 = metadata !{i32 15, i32 0, metadata !106, null}
