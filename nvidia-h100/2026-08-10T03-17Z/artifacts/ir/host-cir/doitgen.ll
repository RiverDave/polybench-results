; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/DOITGEN/doitgen.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/DOITGEN/doitgen.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cudaDeviceProp = type { [256 x i8], %struct.CUuuid_st, [8 x i8], i32, i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [63 x i32] }
%struct.CUuuid_st = type { [16 x i8] }
%struct.dim3 = type { i32, i32, i32 }

@.str = private constant [22 x i8] c"Number of misses: %d\0A\00", align 1
@.str.1 = private constant [32 x i8] c"setting device %d with name %s\0A\00", align 1
@stdout = external local_unnamed_addr global ptr, align 8
@.str.2 = private constant [22 x i8] c"GPU Runtime: %0.6lfs\0A\00", align 1
@.str.3 = private constant [22 x i8] c"CPU Runtime: %0.6lfs\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef float @_Z6absValf(float noundef %0) local_unnamed_addr #0 {
common.ret:
  %1 = fcmp olt float %0, 0.000000e+00
  %2 = fneg float %0
  %common.ret.op = select i1 %1, float %2, float %0
  ret float %common.ret.op
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef float @_Z11percentDiffdd(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = fptrunc double %0 to float
  %4 = fcmp olt double %0, f0xB690000000000000
  %5 = fneg float %3
  %common.ret.op.i = select i1 %4, float %5, float %3
  %6 = fpext float %common.ret.op.i to double
  %7 = fcmp olt double %6, 1.000000e-02
  br i1 %7, label %8, label %.critedge

8:                                                ; preds = %2
  %9 = fptrunc double %1 to float
  %10 = fcmp olt double %1, f0xB690000000000000
  %11 = fneg float %9
  %common.ret.op.i7 = select i1 %10, float %11, float %9
  %12 = fpext float %common.ret.op.i7 to double
  %13 = fcmp olt double %12, 1.000000e-02
  br i1 %13, label %common.ret, label %.critedge

common.ret:                                       ; preds = %8, %.critedge
  %common.ret.op = phi float [ %27, %.critedge ], [ 0.000000e+00, %8 ]
  ret float %common.ret.op

.critedge:                                        ; preds = %2, %8
  %14 = insertelement <2 x double> poison, double %0, i64 0
  %15 = shufflevector <2 x double> %14, <2 x double> poison, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %1, i64 0
  %17 = fsub <2 x double> %15, %16
  %18 = fptrunc <2 x double> %17 to <2 x float>
  %19 = fcmp olt <2 x double> %17, splat (double f0xB690000000000000)
  %20 = fneg <2 x float> %18
  %21 = select <2 x i1> %19, <2 x float> %20, <2 x float> %18
  %22 = extractelement <2 x float> %21, i64 0
  %23 = extractelement <2 x float> %21, i64 1
  %24 = fdiv float %22, %23
  %25 = fcmp olt float %24, 0.000000e+00
  %26 = fneg float %24
  %common.ret.op.i10 = select i1 %25, float %26, float %24
  %27 = fmul float %common.ret.op.i10, 1.000000e+02
  br label %common.ret
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z10doitgenCPUPfS_S_(ptr nofree noundef captures(none) %0, ptr nofree noundef captures(none) %1, ptr nofree noundef readonly captures(none) %2) local_unnamed_addr #1 {
  %4 = ptrtoaddr ptr %0 to i64
  %5 = ptrtoaddr ptr %1 to i64
  %6 = sub i64 %4, %5
  %diff.check = icmp ugt i64 %6, -32
  br label %.preheader41

.preheader41:                                     ; preds = %3, %117
  %indvars.iv65 = phi i64 [ 0, %3 ], [ %indvars.iv.next66, %117 ]
  %7 = shl nuw nsw i64 %indvars.iv65, 14
  br label %.preheader40

.preheader40:                                     ; preds = %.preheader41, %middle.block
  %indvars.iv61 = phi i64 [ 0, %.preheader41 ], [ %indvars.iv.next62, %middle.block ]
  %8 = shl nuw nsw i64 %indvars.iv61, 7
  %9 = add nuw nsw i64 %8, %7
  %invariant.gep71 = getelementptr [4 x i8], ptr %0, i64 %9
  %invariant.gep = getelementptr [4 x i8], ptr %1, i64 %9
  br label %10

10:                                               ; preds = %.preheader40, %21
  %indvars.iv50 = phi i64 [ 0, %.preheader40 ], [ %indvars.iv.next51, %21 ]
  %gep72 = getelementptr [4 x i8], ptr %invariant.gep71, i64 %indvars.iv50
  store float 0.000000e+00, ptr %gep72, align 4
  %invariant.gep69 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv50
  br label %11

11:                                               ; preds = %11, %10
  %indvars.iv = phi i64 [ 0, %10 ], [ %indvars.iv.next.1, %11 ]
  %12 = phi float [ 0.000000e+00, %10 ], [ %20, %11 ]
  %gep = getelementptr [4 x i8], ptr %invariant.gep, i64 %indvars.iv
  %13 = load float, ptr %gep, align 4
  %.idx = shl nuw nsw i64 %indvars.iv, 9
  %gep70 = getelementptr i8, ptr %invariant.gep69, i64 %.idx
  %14 = load float, ptr %gep70, align 4
  %15 = fmul float %13, %14
  %16 = fadd float %12, %15
  store float %16, ptr %gep72, align 4
  %indvars.iv.next = or disjoint i64 %indvars.iv, 1
  %gep.1 = getelementptr [4 x i8], ptr %invariant.gep, i64 %indvars.iv.next
  %17 = load float, ptr %gep.1, align 4
  %.idx.1 = shl nuw nsw i64 %indvars.iv.next, 9
  %gep70.1 = getelementptr i8, ptr %invariant.gep69, i64 %.idx.1
  %18 = load float, ptr %gep70.1, align 4
  %19 = fmul float %17, %18
  %20 = fadd float %16, %19
  store float %20, ptr %gep72, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, 128
  br i1 %exitcond.not.1, label %21, label %11

21:                                               ; preds = %11
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53.not = icmp eq i64 %indvars.iv.next51, 128
  br i1 %exitcond53.not, label %vector.memcheck, label %10

vector.memcheck:                                  ; preds = %21
  br i1 %diff.check, label %.preheader, label %vector.body

vector.body:                                      ; preds = %vector.memcheck
  %22 = getelementptr [4 x i8], ptr %0, i64 %9
  %23 = getelementptr i8, ptr %22, i64 16
  %wide.load = load <4 x float>, ptr %22, align 4
  %wide.load73 = load <4 x float>, ptr %23, align 4
  %24 = getelementptr [4 x i8], ptr %1, i64 %9
  %25 = getelementptr i8, ptr %24, i64 16
  store <4 x float> %wide.load, ptr %24, align 4
  store <4 x float> %wide.load73, ptr %25, align 4
  %26 = or disjoint i64 %9, 8
  %27 = getelementptr [4 x i8], ptr %0, i64 %26
  %28 = getelementptr i8, ptr %27, i64 16
  %wide.load.1 = load <4 x float>, ptr %27, align 4
  %wide.load73.1 = load <4 x float>, ptr %28, align 4
  %29 = getelementptr [4 x i8], ptr %1, i64 %26
  %30 = getelementptr i8, ptr %29, i64 16
  store <4 x float> %wide.load.1, ptr %29, align 4
  store <4 x float> %wide.load73.1, ptr %30, align 4
  %31 = or disjoint i64 %9, 16
  %32 = getelementptr [4 x i8], ptr %0, i64 %31
  %33 = getelementptr i8, ptr %32, i64 16
  %wide.load.2 = load <4 x float>, ptr %32, align 4
  %wide.load73.2 = load <4 x float>, ptr %33, align 4
  %34 = getelementptr [4 x i8], ptr %1, i64 %31
  %35 = getelementptr i8, ptr %34, i64 16
  store <4 x float> %wide.load.2, ptr %34, align 4
  store <4 x float> %wide.load73.2, ptr %35, align 4
  %36 = or disjoint i64 %9, 24
  %37 = getelementptr [4 x i8], ptr %0, i64 %36
  %38 = getelementptr i8, ptr %37, i64 16
  %wide.load.3 = load <4 x float>, ptr %37, align 4
  %wide.load73.3 = load <4 x float>, ptr %38, align 4
  %39 = getelementptr [4 x i8], ptr %1, i64 %36
  %40 = getelementptr i8, ptr %39, i64 16
  store <4 x float> %wide.load.3, ptr %39, align 4
  store <4 x float> %wide.load73.3, ptr %40, align 4
  %41 = or disjoint i64 %9, 32
  %42 = getelementptr [4 x i8], ptr %0, i64 %41
  %43 = getelementptr i8, ptr %42, i64 16
  %wide.load.4 = load <4 x float>, ptr %42, align 4
  %wide.load73.4 = load <4 x float>, ptr %43, align 4
  %44 = getelementptr [4 x i8], ptr %1, i64 %41
  %45 = getelementptr i8, ptr %44, i64 16
  store <4 x float> %wide.load.4, ptr %44, align 4
  store <4 x float> %wide.load73.4, ptr %45, align 4
  %46 = or disjoint i64 %9, 40
  %47 = getelementptr [4 x i8], ptr %0, i64 %46
  %48 = getelementptr i8, ptr %47, i64 16
  %wide.load.5 = load <4 x float>, ptr %47, align 4
  %wide.load73.5 = load <4 x float>, ptr %48, align 4
  %49 = getelementptr [4 x i8], ptr %1, i64 %46
  %50 = getelementptr i8, ptr %49, i64 16
  store <4 x float> %wide.load.5, ptr %49, align 4
  store <4 x float> %wide.load73.5, ptr %50, align 4
  %51 = or disjoint i64 %9, 48
  %52 = getelementptr [4 x i8], ptr %0, i64 %51
  %53 = getelementptr i8, ptr %52, i64 16
  %wide.load.6 = load <4 x float>, ptr %52, align 4
  %wide.load73.6 = load <4 x float>, ptr %53, align 4
  %54 = getelementptr [4 x i8], ptr %1, i64 %51
  %55 = getelementptr i8, ptr %54, i64 16
  store <4 x float> %wide.load.6, ptr %54, align 4
  store <4 x float> %wide.load73.6, ptr %55, align 4
  %56 = or disjoint i64 %9, 56
  %57 = getelementptr [4 x i8], ptr %0, i64 %56
  %58 = getelementptr i8, ptr %57, i64 16
  %wide.load.7 = load <4 x float>, ptr %57, align 4
  %wide.load73.7 = load <4 x float>, ptr %58, align 4
  %59 = getelementptr [4 x i8], ptr %1, i64 %56
  %60 = getelementptr i8, ptr %59, i64 16
  store <4 x float> %wide.load.7, ptr %59, align 4
  store <4 x float> %wide.load73.7, ptr %60, align 4
  %61 = or disjoint i64 %9, 64
  %62 = getelementptr [4 x i8], ptr %0, i64 %61
  %63 = getelementptr i8, ptr %62, i64 16
  %wide.load.8 = load <4 x float>, ptr %62, align 4
  %wide.load73.8 = load <4 x float>, ptr %63, align 4
  %64 = getelementptr [4 x i8], ptr %1, i64 %61
  %65 = getelementptr i8, ptr %64, i64 16
  store <4 x float> %wide.load.8, ptr %64, align 4
  store <4 x float> %wide.load73.8, ptr %65, align 4
  %66 = or disjoint i64 %9, 72
  %67 = getelementptr [4 x i8], ptr %0, i64 %66
  %68 = getelementptr i8, ptr %67, i64 16
  %wide.load.9 = load <4 x float>, ptr %67, align 4
  %wide.load73.9 = load <4 x float>, ptr %68, align 4
  %69 = getelementptr [4 x i8], ptr %1, i64 %66
  %70 = getelementptr i8, ptr %69, i64 16
  store <4 x float> %wide.load.9, ptr %69, align 4
  store <4 x float> %wide.load73.9, ptr %70, align 4
  %71 = or disjoint i64 %9, 80
  %72 = getelementptr [4 x i8], ptr %0, i64 %71
  %73 = getelementptr i8, ptr %72, i64 16
  %wide.load.10 = load <4 x float>, ptr %72, align 4
  %wide.load73.10 = load <4 x float>, ptr %73, align 4
  %74 = getelementptr [4 x i8], ptr %1, i64 %71
  %75 = getelementptr i8, ptr %74, i64 16
  store <4 x float> %wide.load.10, ptr %74, align 4
  store <4 x float> %wide.load73.10, ptr %75, align 4
  %76 = or disjoint i64 %9, 88
  %77 = getelementptr [4 x i8], ptr %0, i64 %76
  %78 = getelementptr i8, ptr %77, i64 16
  %wide.load.11 = load <4 x float>, ptr %77, align 4
  %wide.load73.11 = load <4 x float>, ptr %78, align 4
  %79 = getelementptr [4 x i8], ptr %1, i64 %76
  %80 = getelementptr i8, ptr %79, i64 16
  store <4 x float> %wide.load.11, ptr %79, align 4
  store <4 x float> %wide.load73.11, ptr %80, align 4
  %81 = or disjoint i64 %9, 96
  %82 = getelementptr [4 x i8], ptr %0, i64 %81
  %83 = getelementptr i8, ptr %82, i64 16
  %wide.load.12 = load <4 x float>, ptr %82, align 4
  %wide.load73.12 = load <4 x float>, ptr %83, align 4
  %84 = getelementptr [4 x i8], ptr %1, i64 %81
  %85 = getelementptr i8, ptr %84, i64 16
  store <4 x float> %wide.load.12, ptr %84, align 4
  store <4 x float> %wide.load73.12, ptr %85, align 4
  %86 = or disjoint i64 %9, 104
  %87 = getelementptr [4 x i8], ptr %0, i64 %86
  %88 = getelementptr i8, ptr %87, i64 16
  %wide.load.13 = load <4 x float>, ptr %87, align 4
  %wide.load73.13 = load <4 x float>, ptr %88, align 4
  %89 = getelementptr [4 x i8], ptr %1, i64 %86
  %90 = getelementptr i8, ptr %89, i64 16
  store <4 x float> %wide.load.13, ptr %89, align 4
  store <4 x float> %wide.load73.13, ptr %90, align 4
  %91 = or disjoint i64 %9, 112
  %92 = getelementptr [4 x i8], ptr %0, i64 %91
  %93 = getelementptr i8, ptr %92, i64 16
  %wide.load.14 = load <4 x float>, ptr %92, align 4
  %wide.load73.14 = load <4 x float>, ptr %93, align 4
  %94 = getelementptr [4 x i8], ptr %1, i64 %91
  %95 = getelementptr i8, ptr %94, i64 16
  store <4 x float> %wide.load.14, ptr %94, align 4
  store <4 x float> %wide.load73.14, ptr %95, align 4
  %96 = or disjoint i64 %9, 120
  %97 = getelementptr [4 x i8], ptr %0, i64 %96
  %98 = getelementptr i8, ptr %97, i64 16
  %wide.load.15 = load <4 x float>, ptr %97, align 4
  %wide.load73.15 = load <4 x float>, ptr %98, align 4
  %99 = getelementptr [4 x i8], ptr %1, i64 %96
  %100 = getelementptr i8, ptr %99, i64 16
  store <4 x float> %wide.load.15, ptr %99, align 4
  store <4 x float> %wide.load73.15, ptr %100, align 4
  br label %middle.block

.preheader:                                       ; preds = %vector.memcheck, %.preheader
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.3, %.preheader ], [ 0, %vector.memcheck ]
  %101 = add nuw nsw i64 %indvars.iv57, %9
  %102 = getelementptr [4 x i8], ptr %0, i64 %101
  %103 = load float, ptr %102, align 4
  %104 = getelementptr [4 x i8], ptr %1, i64 %101
  store float %103, ptr %104, align 4
  %indvars.iv.next58 = or disjoint i64 %indvars.iv57, 1
  %105 = add nuw nsw i64 %indvars.iv.next58, %9
  %106 = getelementptr [4 x i8], ptr %0, i64 %105
  %107 = load float, ptr %106, align 4
  %108 = getelementptr [4 x i8], ptr %1, i64 %105
  store float %107, ptr %108, align 4
  %indvars.iv.next58.1 = or disjoint i64 %indvars.iv57, 2
  %109 = add nuw nsw i64 %indvars.iv.next58.1, %9
  %110 = getelementptr [4 x i8], ptr %0, i64 %109
  %111 = load float, ptr %110, align 4
  %112 = getelementptr [4 x i8], ptr %1, i64 %109
  store float %111, ptr %112, align 4
  %indvars.iv.next58.2 = or disjoint i64 %indvars.iv57, 3
  %113 = add nuw nsw i64 %indvars.iv.next58.2, %9
  %114 = getelementptr [4 x i8], ptr %0, i64 %113
  %115 = load float, ptr %114, align 4
  %116 = getelementptr [4 x i8], ptr %1, i64 %113
  store float %115, ptr %116, align 4
  %indvars.iv.next58.3 = add nuw nsw i64 %indvars.iv57, 4
  %exitcond60.not.3 = icmp eq i64 %indvars.iv.next58.3, 128
  br i1 %exitcond60.not.3, label %middle.block, label %.preheader, !llvm.loop !1

middle.block:                                     ; preds = %.preheader, %vector.body
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64.not = icmp eq i64 %indvars.iv.next62, 128
  br i1 %exitcond64.not, label %117, label %.preheader40

117:                                              ; preds = %middle.block
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68.not = icmp eq i64 %indvars.iv.next66, 128
  br i1 %exitcond68.not, label %118, label %.preheader41

118:                                              ; preds = %117
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: write)
define dso_local void @_Z10init_arrayPfS_(ptr nofree noundef writeonly captures(none) %0, ptr nofree noundef writeonly captures(none) %1) local_unnamed_addr #2 {
  br label %.preheader27

.preheader27:                                     ; preds = %2, %103
  %indvars.iv38 = phi i64 [ 0, %2 ], [ %indvars.iv.next39, %103 ]
  %3 = trunc nuw nsw i64 %indvars.iv38 to i32
  %4 = uitofp nneg i32 %3 to float
  %.idx50 = shl i64 %indvars.iv38, 16
  %invariant.gep54 = getelementptr i8, ptr %0, i64 %.idx50
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader27, %.preheader26
  %indvars.iv34 = phi i64 [ 0, %.preheader27 ], [ %indvars.iv.next35, %.preheader26 ]
  %5 = trunc nuw nsw i64 %indvars.iv34 to i32
  %6 = uitofp nneg i32 %5 to float
  %7 = fmul nnan float %4, %6
  %broadcast.splatinsert = insertelement <4 x float> poison, float %7, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %.idx = shl i64 %indvars.iv34, 9
  %gep = getelementptr i8, ptr %invariant.gep54, i64 %.idx
  %8 = fadd nnan <4 x float> %broadcast.splat, <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>
  %9 = fadd nnan <4 x float> %broadcast.splat, <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>
  %10 = fmul nnan <4 x float> %8, splat (float 7.812500e-03)
  %11 = fmul nnan <4 x float> %9, splat (float 7.812500e-03)
  %12 = getelementptr i8, ptr %gep, i64 16
  store <4 x float> %10, ptr %gep, align 4
  store <4 x float> %11, ptr %12, align 4
  %13 = fadd nnan <4 x float> %broadcast.splat, <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>
  %14 = fadd nnan <4 x float> %broadcast.splat, <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>
  %15 = fmul nnan <4 x float> %13, splat (float 7.812500e-03)
  %16 = fmul nnan <4 x float> %14, splat (float 7.812500e-03)
  %17 = getelementptr i8, ptr %gep, i64 32
  %18 = getelementptr i8, ptr %gep, i64 48
  store <4 x float> %15, ptr %17, align 4
  store <4 x float> %16, ptr %18, align 4
  %19 = fadd nnan <4 x float> %broadcast.splat, <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>
  %20 = fadd nnan <4 x float> %broadcast.splat, <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>
  %21 = fmul nnan <4 x float> %19, splat (float 7.812500e-03)
  %22 = fmul nnan <4 x float> %20, splat (float 7.812500e-03)
  %23 = getelementptr i8, ptr %gep, i64 64
  %24 = getelementptr i8, ptr %gep, i64 80
  store <4 x float> %21, ptr %23, align 4
  store <4 x float> %22, ptr %24, align 4
  %25 = fadd nnan <4 x float> %broadcast.splat, <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>
  %26 = fadd nnan <4 x float> %broadcast.splat, <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>
  %27 = fmul nnan <4 x float> %25, splat (float 7.812500e-03)
  %28 = fmul nnan <4 x float> %26, splat (float 7.812500e-03)
  %29 = getelementptr i8, ptr %gep, i64 96
  %30 = getelementptr i8, ptr %gep, i64 112
  store <4 x float> %27, ptr %29, align 4
  store <4 x float> %28, ptr %30, align 4
  %31 = fadd nnan <4 x float> %broadcast.splat, <float 3.200000e+01, float 3.300000e+01, float 3.400000e+01, float 3.500000e+01>
  %32 = fadd nnan <4 x float> %broadcast.splat, <float 3.600000e+01, float 3.700000e+01, float 3.800000e+01, float 3.900000e+01>
  %33 = fmul nnan <4 x float> %31, splat (float 7.812500e-03)
  %34 = fmul nnan <4 x float> %32, splat (float 7.812500e-03)
  %35 = getelementptr i8, ptr %gep, i64 128
  %36 = getelementptr i8, ptr %gep, i64 144
  store <4 x float> %33, ptr %35, align 4
  store <4 x float> %34, ptr %36, align 4
  %37 = fadd nnan <4 x float> %broadcast.splat, <float 4.000000e+01, float 4.100000e+01, float 4.200000e+01, float 4.300000e+01>
  %38 = fadd nnan <4 x float> %broadcast.splat, <float 4.400000e+01, float 4.500000e+01, float 4.600000e+01, float 4.700000e+01>
  %39 = fmul nnan <4 x float> %37, splat (float 7.812500e-03)
  %40 = fmul nnan <4 x float> %38, splat (float 7.812500e-03)
  %41 = getelementptr i8, ptr %gep, i64 160
  %42 = getelementptr i8, ptr %gep, i64 176
  store <4 x float> %39, ptr %41, align 4
  store <4 x float> %40, ptr %42, align 4
  %43 = fadd nnan <4 x float> %broadcast.splat, <float 4.800000e+01, float 4.900000e+01, float 5.000000e+01, float 5.100000e+01>
  %44 = fadd nnan <4 x float> %broadcast.splat, <float 5.200000e+01, float 5.300000e+01, float 5.400000e+01, float 5.500000e+01>
  %45 = fmul nnan <4 x float> %43, splat (float 7.812500e-03)
  %46 = fmul nnan <4 x float> %44, splat (float 7.812500e-03)
  %47 = getelementptr i8, ptr %gep, i64 192
  %48 = getelementptr i8, ptr %gep, i64 208
  store <4 x float> %45, ptr %47, align 4
  store <4 x float> %46, ptr %48, align 4
  %49 = fadd nnan <4 x float> %broadcast.splat, <float 5.600000e+01, float 5.700000e+01, float 5.800000e+01, float 5.900000e+01>
  %50 = fadd nnan <4 x float> %broadcast.splat, <float 6.000000e+01, float 6.100000e+01, float 6.200000e+01, float 6.300000e+01>
  %51 = fmul nnan <4 x float> %49, splat (float 7.812500e-03)
  %52 = fmul nnan <4 x float> %50, splat (float 7.812500e-03)
  %53 = getelementptr i8, ptr %gep, i64 224
  %54 = getelementptr i8, ptr %gep, i64 240
  store <4 x float> %51, ptr %53, align 4
  store <4 x float> %52, ptr %54, align 4
  %55 = fadd nnan <4 x float> %broadcast.splat, <float 6.400000e+01, float 6.500000e+01, float 6.600000e+01, float 6.700000e+01>
  %56 = fadd nnan <4 x float> %broadcast.splat, <float 6.800000e+01, float 6.900000e+01, float 7.000000e+01, float 7.100000e+01>
  %57 = fmul nnan <4 x float> %55, splat (float 7.812500e-03)
  %58 = fmul nnan <4 x float> %56, splat (float 7.812500e-03)
  %59 = getelementptr i8, ptr %gep, i64 256
  %60 = getelementptr i8, ptr %gep, i64 272
  store <4 x float> %57, ptr %59, align 4
  store <4 x float> %58, ptr %60, align 4
  %61 = fadd nnan <4 x float> %broadcast.splat, <float 7.200000e+01, float 7.300000e+01, float 7.400000e+01, float 7.500000e+01>
  %62 = fadd nnan <4 x float> %broadcast.splat, <float 7.600000e+01, float 7.700000e+01, float 7.800000e+01, float 7.900000e+01>
  %63 = fmul nnan <4 x float> %61, splat (float 7.812500e-03)
  %64 = fmul nnan <4 x float> %62, splat (float 7.812500e-03)
  %65 = getelementptr i8, ptr %gep, i64 288
  %66 = getelementptr i8, ptr %gep, i64 304
  store <4 x float> %63, ptr %65, align 4
  store <4 x float> %64, ptr %66, align 4
  %67 = fadd nnan <4 x float> %broadcast.splat, <float 8.000000e+01, float 8.100000e+01, float 8.200000e+01, float 8.300000e+01>
  %68 = fadd nnan <4 x float> %broadcast.splat, <float 8.400000e+01, float 8.500000e+01, float 8.600000e+01, float 8.700000e+01>
  %69 = fmul nnan <4 x float> %67, splat (float 7.812500e-03)
  %70 = fmul nnan <4 x float> %68, splat (float 7.812500e-03)
  %71 = getelementptr i8, ptr %gep, i64 320
  %72 = getelementptr i8, ptr %gep, i64 336
  store <4 x float> %69, ptr %71, align 4
  store <4 x float> %70, ptr %72, align 4
  %73 = fadd nnan <4 x float> %broadcast.splat, <float 8.800000e+01, float 8.900000e+01, float 9.000000e+01, float 9.100000e+01>
  %74 = fadd nnan <4 x float> %broadcast.splat, <float 9.200000e+01, float 9.300000e+01, float 9.400000e+01, float 9.500000e+01>
  %75 = fmul nnan <4 x float> %73, splat (float 7.812500e-03)
  %76 = fmul nnan <4 x float> %74, splat (float 7.812500e-03)
  %77 = getelementptr i8, ptr %gep, i64 352
  %78 = getelementptr i8, ptr %gep, i64 368
  store <4 x float> %75, ptr %77, align 4
  store <4 x float> %76, ptr %78, align 4
  %79 = fadd nnan <4 x float> %broadcast.splat, <float 9.600000e+01, float 9.700000e+01, float 9.800000e+01, float 9.900000e+01>
  %80 = fadd nnan <4 x float> %broadcast.splat, <float 1.000000e+02, float 1.010000e+02, float 1.020000e+02, float 1.030000e+02>
  %81 = fmul nnan <4 x float> %79, splat (float 7.812500e-03)
  %82 = fmul nnan <4 x float> %80, splat (float 7.812500e-03)
  %83 = getelementptr i8, ptr %gep, i64 384
  %84 = getelementptr i8, ptr %gep, i64 400
  store <4 x float> %81, ptr %83, align 4
  store <4 x float> %82, ptr %84, align 4
  %85 = fadd nnan <4 x float> %broadcast.splat, <float 1.040000e+02, float 1.050000e+02, float 1.060000e+02, float 1.070000e+02>
  %86 = fadd nnan <4 x float> %broadcast.splat, <float 1.080000e+02, float 1.090000e+02, float 1.100000e+02, float 1.110000e+02>
  %87 = fmul nnan <4 x float> %85, splat (float 7.812500e-03)
  %88 = fmul nnan <4 x float> %86, splat (float 7.812500e-03)
  %89 = getelementptr i8, ptr %gep, i64 416
  %90 = getelementptr i8, ptr %gep, i64 432
  store <4 x float> %87, ptr %89, align 4
  store <4 x float> %88, ptr %90, align 4
  %91 = fadd nnan <4 x float> %broadcast.splat, <float 1.120000e+02, float 1.130000e+02, float 1.140000e+02, float 1.150000e+02>
  %92 = fadd nnan <4 x float> %broadcast.splat, <float 1.160000e+02, float 1.170000e+02, float 1.180000e+02, float 1.190000e+02>
  %93 = fmul nnan <4 x float> %91, splat (float 7.812500e-03)
  %94 = fmul nnan <4 x float> %92, splat (float 7.812500e-03)
  %95 = getelementptr i8, ptr %gep, i64 448
  %96 = getelementptr i8, ptr %gep, i64 464
  store <4 x float> %93, ptr %95, align 4
  store <4 x float> %94, ptr %96, align 4
  %97 = fadd nnan <4 x float> %broadcast.splat, <float 1.200000e+02, float 1.210000e+02, float 1.220000e+02, float 1.230000e+02>
  %98 = fadd nnan <4 x float> %broadcast.splat, <float 1.240000e+02, float 1.250000e+02, float 1.260000e+02, float 1.270000e+02>
  %99 = fmul nnan <4 x float> %97, splat (float 7.812500e-03)
  %100 = fmul nnan <4 x float> %98, splat (float 7.812500e-03)
  %101 = getelementptr i8, ptr %gep, i64 480
  %102 = getelementptr i8, ptr %gep, i64 496
  store <4 x float> %99, ptr %101, align 4
  store <4 x float> %100, ptr %102, align 4
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37.not = icmp eq i64 %indvars.iv.next35, 128
  br i1 %exitcond37.not, label %103, label %.preheader26

103:                                              ; preds = %.preheader26
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41.not = icmp eq i64 %indvars.iv.next39, 128
  br i1 %exitcond41.not, label %.preheader, label %.preheader27

.preheader:                                       ; preds = %103, %.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %.preheader ], [ 0, %103 ]
  %104 = trunc nuw nsw i64 %indvars.iv46 to i32
  %105 = uitofp nneg i32 %104 to float
  %broadcast.splatinsert57 = insertelement <4 x float> poison, float %105, i64 0
  %broadcast.splat58 = shufflevector <4 x float> %broadcast.splatinsert57, <4 x float> poison, <4 x i32> zeroinitializer
  %.idx51 = shl i64 %indvars.iv46, 9
  %invariant.gep = getelementptr i8, ptr %1, i64 %.idx51
  %106 = fmul nnan <4 x float> %broadcast.splat58, <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>
  %107 = fmul nnan <4 x float> %broadcast.splat58, <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>
  %108 = fmul nnan <4 x float> %106, splat (float 7.812500e-03)
  %109 = fmul nnan <4 x float> %107, splat (float 7.812500e-03)
  %110 = getelementptr i8, ptr %invariant.gep, i64 16
  store <4 x float> %108, ptr %invariant.gep, align 4
  store <4 x float> %109, ptr %110, align 4
  %111 = fmul nnan <4 x float> %broadcast.splat58, <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>
  %112 = fmul nnan <4 x float> %broadcast.splat58, <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>
  %113 = fmul nnan <4 x float> %111, splat (float 7.812500e-03)
  %114 = fmul nnan <4 x float> %112, splat (float 7.812500e-03)
  %115 = getelementptr i8, ptr %invariant.gep, i64 32
  %116 = getelementptr i8, ptr %invariant.gep, i64 48
  store <4 x float> %113, ptr %115, align 4
  store <4 x float> %114, ptr %116, align 4
  %117 = fmul nnan <4 x float> %broadcast.splat58, <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>
  %118 = fmul nnan <4 x float> %broadcast.splat58, <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>
  %119 = fmul nnan <4 x float> %117, splat (float 7.812500e-03)
  %120 = fmul nnan <4 x float> %118, splat (float 7.812500e-03)
  %121 = getelementptr i8, ptr %invariant.gep, i64 64
  %122 = getelementptr i8, ptr %invariant.gep, i64 80
  store <4 x float> %119, ptr %121, align 4
  store <4 x float> %120, ptr %122, align 4
  %123 = fmul nnan <4 x float> %broadcast.splat58, <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>
  %124 = fmul nnan <4 x float> %broadcast.splat58, <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>
  %125 = fmul nnan <4 x float> %123, splat (float 7.812500e-03)
  %126 = fmul nnan <4 x float> %124, splat (float 7.812500e-03)
  %127 = getelementptr i8, ptr %invariant.gep, i64 96
  %128 = getelementptr i8, ptr %invariant.gep, i64 112
  store <4 x float> %125, ptr %127, align 4
  store <4 x float> %126, ptr %128, align 4
  %129 = fmul nnan <4 x float> %broadcast.splat58, <float 3.200000e+01, float 3.300000e+01, float 3.400000e+01, float 3.500000e+01>
  %130 = fmul nnan <4 x float> %broadcast.splat58, <float 3.600000e+01, float 3.700000e+01, float 3.800000e+01, float 3.900000e+01>
  %131 = fmul nnan <4 x float> %129, splat (float 7.812500e-03)
  %132 = fmul nnan <4 x float> %130, splat (float 7.812500e-03)
  %133 = getelementptr i8, ptr %invariant.gep, i64 128
  %134 = getelementptr i8, ptr %invariant.gep, i64 144
  store <4 x float> %131, ptr %133, align 4
  store <4 x float> %132, ptr %134, align 4
  %135 = fmul nnan <4 x float> %broadcast.splat58, <float 4.000000e+01, float 4.100000e+01, float 4.200000e+01, float 4.300000e+01>
  %136 = fmul nnan <4 x float> %broadcast.splat58, <float 4.400000e+01, float 4.500000e+01, float 4.600000e+01, float 4.700000e+01>
  %137 = fmul nnan <4 x float> %135, splat (float 7.812500e-03)
  %138 = fmul nnan <4 x float> %136, splat (float 7.812500e-03)
  %139 = getelementptr i8, ptr %invariant.gep, i64 160
  %140 = getelementptr i8, ptr %invariant.gep, i64 176
  store <4 x float> %137, ptr %139, align 4
  store <4 x float> %138, ptr %140, align 4
  %141 = fmul nnan <4 x float> %broadcast.splat58, <float 4.800000e+01, float 4.900000e+01, float 5.000000e+01, float 5.100000e+01>
  %142 = fmul nnan <4 x float> %broadcast.splat58, <float 5.200000e+01, float 5.300000e+01, float 5.400000e+01, float 5.500000e+01>
  %143 = fmul nnan <4 x float> %141, splat (float 7.812500e-03)
  %144 = fmul nnan <4 x float> %142, splat (float 7.812500e-03)
  %145 = getelementptr i8, ptr %invariant.gep, i64 192
  %146 = getelementptr i8, ptr %invariant.gep, i64 208
  store <4 x float> %143, ptr %145, align 4
  store <4 x float> %144, ptr %146, align 4
  %147 = fmul nnan <4 x float> %broadcast.splat58, <float 5.600000e+01, float 5.700000e+01, float 5.800000e+01, float 5.900000e+01>
  %148 = fmul nnan <4 x float> %broadcast.splat58, <float 6.000000e+01, float 6.100000e+01, float 6.200000e+01, float 6.300000e+01>
  %149 = fmul nnan <4 x float> %147, splat (float 7.812500e-03)
  %150 = fmul nnan <4 x float> %148, splat (float 7.812500e-03)
  %151 = getelementptr i8, ptr %invariant.gep, i64 224
  %152 = getelementptr i8, ptr %invariant.gep, i64 240
  store <4 x float> %149, ptr %151, align 4
  store <4 x float> %150, ptr %152, align 4
  %153 = fmul nnan <4 x float> %broadcast.splat58, <float 6.400000e+01, float 6.500000e+01, float 6.600000e+01, float 6.700000e+01>
  %154 = fmul nnan <4 x float> %broadcast.splat58, <float 6.800000e+01, float 6.900000e+01, float 7.000000e+01, float 7.100000e+01>
  %155 = fmul nnan <4 x float> %153, splat (float 7.812500e-03)
  %156 = fmul nnan <4 x float> %154, splat (float 7.812500e-03)
  %157 = getelementptr i8, ptr %invariant.gep, i64 256
  %158 = getelementptr i8, ptr %invariant.gep, i64 272
  store <4 x float> %155, ptr %157, align 4
  store <4 x float> %156, ptr %158, align 4
  %159 = fmul nnan <4 x float> %broadcast.splat58, <float 7.200000e+01, float 7.300000e+01, float 7.400000e+01, float 7.500000e+01>
  %160 = fmul nnan <4 x float> %broadcast.splat58, <float 7.600000e+01, float 7.700000e+01, float 7.800000e+01, float 7.900000e+01>
  %161 = fmul nnan <4 x float> %159, splat (float 7.812500e-03)
  %162 = fmul nnan <4 x float> %160, splat (float 7.812500e-03)
  %163 = getelementptr i8, ptr %invariant.gep, i64 288
  %164 = getelementptr i8, ptr %invariant.gep, i64 304
  store <4 x float> %161, ptr %163, align 4
  store <4 x float> %162, ptr %164, align 4
  %165 = fmul nnan <4 x float> %broadcast.splat58, <float 8.000000e+01, float 8.100000e+01, float 8.200000e+01, float 8.300000e+01>
  %166 = fmul nnan <4 x float> %broadcast.splat58, <float 8.400000e+01, float 8.500000e+01, float 8.600000e+01, float 8.700000e+01>
  %167 = fmul nnan <4 x float> %165, splat (float 7.812500e-03)
  %168 = fmul nnan <4 x float> %166, splat (float 7.812500e-03)
  %169 = getelementptr i8, ptr %invariant.gep, i64 320
  %170 = getelementptr i8, ptr %invariant.gep, i64 336
  store <4 x float> %167, ptr %169, align 4
  store <4 x float> %168, ptr %170, align 4
  %171 = fmul nnan <4 x float> %broadcast.splat58, <float 8.800000e+01, float 8.900000e+01, float 9.000000e+01, float 9.100000e+01>
  %172 = fmul nnan <4 x float> %broadcast.splat58, <float 9.200000e+01, float 9.300000e+01, float 9.400000e+01, float 9.500000e+01>
  %173 = fmul nnan <4 x float> %171, splat (float 7.812500e-03)
  %174 = fmul nnan <4 x float> %172, splat (float 7.812500e-03)
  %175 = getelementptr i8, ptr %invariant.gep, i64 352
  %176 = getelementptr i8, ptr %invariant.gep, i64 368
  store <4 x float> %173, ptr %175, align 4
  store <4 x float> %174, ptr %176, align 4
  %177 = fmul nnan <4 x float> %broadcast.splat58, <float 9.600000e+01, float 9.700000e+01, float 9.800000e+01, float 9.900000e+01>
  %178 = fmul nnan <4 x float> %broadcast.splat58, <float 1.000000e+02, float 1.010000e+02, float 1.020000e+02, float 1.030000e+02>
  %179 = fmul nnan <4 x float> %177, splat (float 7.812500e-03)
  %180 = fmul nnan <4 x float> %178, splat (float 7.812500e-03)
  %181 = getelementptr i8, ptr %invariant.gep, i64 384
  %182 = getelementptr i8, ptr %invariant.gep, i64 400
  store <4 x float> %179, ptr %181, align 4
  store <4 x float> %180, ptr %182, align 4
  %183 = fmul nnan <4 x float> %broadcast.splat58, <float 1.040000e+02, float 1.050000e+02, float 1.060000e+02, float 1.070000e+02>
  %184 = fmul nnan <4 x float> %broadcast.splat58, <float 1.080000e+02, float 1.090000e+02, float 1.100000e+02, float 1.110000e+02>
  %185 = fmul nnan <4 x float> %183, splat (float 7.812500e-03)
  %186 = fmul nnan <4 x float> %184, splat (float 7.812500e-03)
  %187 = getelementptr i8, ptr %invariant.gep, i64 416
  %188 = getelementptr i8, ptr %invariant.gep, i64 432
  store <4 x float> %185, ptr %187, align 4
  store <4 x float> %186, ptr %188, align 4
  %189 = fmul nnan <4 x float> %broadcast.splat58, <float 1.120000e+02, float 1.130000e+02, float 1.140000e+02, float 1.150000e+02>
  %190 = fmul nnan <4 x float> %broadcast.splat58, <float 1.160000e+02, float 1.170000e+02, float 1.180000e+02, float 1.190000e+02>
  %191 = fmul nnan <4 x float> %189, splat (float 7.812500e-03)
  %192 = fmul nnan <4 x float> %190, splat (float 7.812500e-03)
  %193 = getelementptr i8, ptr %invariant.gep, i64 448
  %194 = getelementptr i8, ptr %invariant.gep, i64 464
  store <4 x float> %191, ptr %193, align 4
  store <4 x float> %192, ptr %194, align 4
  %195 = fmul nnan <4 x float> %broadcast.splat58, <float 1.200000e+02, float 1.210000e+02, float 1.220000e+02, float 1.230000e+02>
  %196 = fmul nnan <4 x float> %broadcast.splat58, <float 1.240000e+02, float 1.250000e+02, float 1.260000e+02, float 1.270000e+02>
  %197 = fmul nnan <4 x float> %195, splat (float 7.812500e-03)
  %198 = fmul nnan <4 x float> %196, splat (float 7.812500e-03)
  %199 = getelementptr i8, ptr %invariant.gep, i64 480
  %200 = getelementptr i8, ptr %invariant.gep, i64 496
  store <4 x float> %197, ptr %199, align 4
  store <4 x float> %198, ptr %200, align 4
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49.not = icmp eq i64 %indvars.iv.next47, 128
  br i1 %exitcond49.not, label %201, label %.preheader

201:                                              ; preds = %.preheader
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsPfS_(ptr nofree noundef readonly captures(none) %0, ptr nofree noundef readonly captures(none) %1) local_unnamed_addr #4 {
  br label %.preheader18

.preheader18:                                     ; preds = %2, %43
  %indvars.iv30 = phi i64 [ 0, %2 ], [ %indvars.iv.next31, %43 ]
  %.024 = phi i32 [ 0, %2 ], [ %42, %43 ]
  %3 = shl nuw nsw i64 %indvars.iv30, 14
  br label %.preheader

.preheader:                                       ; preds = %.preheader18, %middle.block
  %indvars.iv26 = phi i64 [ 0, %.preheader18 ], [ %indvars.iv.next27, %middle.block ]
  %.122 = phi i32 [ %.024, %.preheader18 ], [ %42, %middle.block ]
  %4 = shl nuw nsw i64 %indvars.iv26, 7
  %5 = add nuw nsw i64 %4, %3
  %6 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.122, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader
  %index = phi i64 [ 0, %.preheader ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %6, %.preheader ], [ %40, %vector.body ]
  %7 = add nuw nsw i64 %index, %5
  %8 = getelementptr [4 x i8], ptr %0, i64 %7
  %wide.load = load <4 x float>, ptr %8, align 4
  %9 = fpext <4 x float> %wide.load to <4 x double>
  %10 = getelementptr [4 x i8], ptr %1, i64 %7
  %wide.load34 = load <4 x float>, ptr %10, align 4
  %11 = fpext <4 x float> %wide.load34 to <4 x double>
  %12 = fcmp olt <4 x double> %9, splat (double f0xB690000000000000)
  %13 = fneg <4 x float> %wide.load
  %14 = select <4 x i1> %12, <4 x float> %13, <4 x float> %wide.load
  %15 = fpext <4 x float> %14 to <4 x double>
  %16 = fcmp uge <4 x double> %15, splat (double 1.000000e-02)
  %17 = fcmp olt <4 x double> %11, splat (double f0xB690000000000000)
  %18 = fneg <4 x float> %wide.load34
  %19 = select <4 x i1> %17, <4 x float> %18, <4 x float> %wide.load34
  %20 = fpext <4 x float> %19 to <4 x double>
  %21 = fcmp uge <4 x double> %20, splat (double 1.000000e-02)
  %22 = select <4 x i1> %16, <4 x i1> splat (i1 true), <4 x i1> %21
  %23 = fsub <4 x double> %9, %11
  %24 = fptrunc <4 x double> %23 to <4 x float>
  %25 = fcmp olt <4 x double> %23, splat (double f0xB690000000000000)
  %26 = fneg <4 x float> %24
  %27 = select <4 x i1> %25, <4 x float> %26, <4 x float> %24
  %28 = fadd <4 x double> %9, splat (double f0x3E45798EE0000000)
  %29 = fptrunc <4 x double> %28 to <4 x float>
  %30 = fcmp olt <4 x double> %28, splat (double f0xB690000000000000)
  %31 = fneg <4 x float> %29
  %32 = select <4 x i1> %30, <4 x float> %31, <4 x float> %29
  %33 = fdiv <4 x float> %27, %32
  %34 = fcmp olt <4 x float> %33, zeroinitializer
  %35 = fneg <4 x float> %33
  %36 = select <4 x i1> %34, <4 x float> %35, <4 x float> %33
  %37 = fmul <4 x float> %36, splat (float 1.000000e+02)
  %38 = fpext <4 x float> %37 to <4 x double>
  %39 = fcmp ogt <4 x double> %38, splat (double 5.000000e-02)
  %narrow = select <4 x i1> %22, <4 x i1> %39, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %40 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %41 = icmp eq i64 %index.next, 128
  br i1 %41, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %42 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %40)
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond29.not = icmp eq i64 %indvars.iv.next27, 128
  br i1 %exitcond29.not, label %43, label %.preheader

43:                                               ; preds = %middle.block
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33.not = icmp eq i64 %indvars.iv.next31, 128
  br i1 %exitcond33.not, label %44, label %.preheader18

44:                                               ; preds = %43
  %45 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %42) #5
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #5

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #5

define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #6 {
  %1 = alloca %struct.cudaDeviceProp, align 8
  %2 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %1, i32 noundef 0) #5
  %3 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %1) #5
  %4 = call i32 @cudaSetDevice(i32 noundef 0) #5
  ret void
}

declare dso_local i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare dso_local i32 @cudaLaunchKernel(ptr, %struct.dim3, %struct.dim3, ptr, i64, ptr) local_unnamed_addr

define dso_local void @_Z30__device_stub__doitgen_kernel1PfS_S_i(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #6 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  %9 = alloca [4 x ptr], align 16
  store ptr %5, ptr %9, align 16
  %10 = getelementptr inbounds nuw i8, ptr %9, i64 8
  store ptr %6, ptr %10, align 8
  %11 = getelementptr inbounds nuw i8, ptr %9, i64 16
  store ptr %7, ptr %11, align 16
  %12 = getelementptr inbounds nuw i8, ptr %9, i64 24
  store ptr %8, ptr %12, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca %struct.dim3, align 8
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  %17 = call i32 @__cudaPopCallConfiguration(ptr nonnull %13, ptr nonnull %14, ptr nonnull %15, ptr nonnull %16)
  %18 = load i64, ptr %15, align 8
  %19 = load ptr, ptr %16, align 8
  %.fca.0.load2 = load i32, ptr %13, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %13, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %13, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %14, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %14, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %14, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z30__device_stub__doitgen_kernel1PfS_S_i, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
  ret void
}

define dso_local void @_Z30__device_stub__doitgen_kernel2PfS_S_i(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #6 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  %9 = alloca [4 x ptr], align 16
  store ptr %5, ptr %9, align 16
  %10 = getelementptr inbounds nuw i8, ptr %9, i64 8
  store ptr %6, ptr %10, align 8
  %11 = getelementptr inbounds nuw i8, ptr %9, i64 16
  store ptr %7, ptr %11, align 16
  %12 = getelementptr inbounds nuw i8, ptr %9, i64 24
  store ptr %8, ptr %12, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca %struct.dim3, align 8
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  %17 = call i32 @__cudaPopCallConfiguration(ptr nonnull %13, ptr nonnull %14, ptr nonnull %15, ptr nonnull %16)
  %18 = load i64, ptr %15, align 8
  %19 = load ptr, ptr %16, align 8
  %.fca.0.load2 = load i32, ptr %13, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %13, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %13, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %14, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %14, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %14, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z30__device_stub__doitgen_kernel2PfS_S_i, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #5

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #5

declare noundef double @_Z7rtclockv() local_unnamed_addr #5

declare i32 @__cudaPushCallConfiguration(%struct.dim3, %struct.dim3, i64 noundef, ptr noundef) local_unnamed_addr #5

declare i32 @cudaThreadSynchronize() local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr noundef captures(none), ptr noundef readonly captures(none), ...) local_unnamed_addr #3

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #5

define dso_local void @_Z11doitgenCudaPfS_S_S_(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #6 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca [4 x ptr], align 16
  %10 = alloca %struct.dim3, align 8
  %11 = alloca %struct.dim3, align 8
  %12 = alloca i64, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca [4 x ptr], align 16
  %19 = alloca %struct.dim3, align 8
  %20 = alloca %struct.dim3, align 8
  %21 = alloca i64, align 8
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = call noundef i32 @cudaMalloc(ptr noundef nonnull %23, i64 noundef 8388608) #5
  %27 = call noundef i32 @cudaMalloc(ptr noundef nonnull %24, i64 noundef 65536) #5
  %28 = call noundef i32 @cudaMalloc(ptr noundef nonnull %25, i64 noundef 8388608) #5
  %29 = load ptr, ptr %23, align 8
  %30 = call i32 @cudaMemcpy(ptr noundef %29, ptr noundef %0, i64 noundef 8388608, i32 noundef 1) #5
  %31 = load ptr, ptr %24, align 8
  %32 = call i32 @cudaMemcpy(ptr noundef %31, ptr noundef %1, i64 noundef 65536, i32 noundef 1) #5
  %33 = load ptr, ptr %25, align 8
  %34 = call i32 @cudaMemcpy(ptr noundef %33, ptr noundef %2, i64 noundef 8388608, i32 noundef 1) #5
  %35 = call noundef double @_Z7rtclockv() #5
  %36 = getelementptr inbounds nuw i8, ptr %18, i64 8
  %37 = getelementptr inbounds nuw i8, ptr %18, i64 16
  %38 = getelementptr inbounds nuw i8, ptr %18, i64 24
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %19, i64 4
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %19, i64 8
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %20, i64 4
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %20, i64 8
  %39 = getelementptr inbounds nuw i8, ptr %9, i64 8
  %40 = getelementptr inbounds nuw i8, ptr %9, i64 16
  %41 = getelementptr inbounds nuw i8, ptr %9, i64 24
  %.fca.1.gep4.i30 = getelementptr inbounds nuw i8, ptr %10, i64 4
  %.fca.2.gep7.i33 = getelementptr inbounds nuw i8, ptr %10, i64 8
  %.fca.1.gep.i38 = getelementptr inbounds nuw i8, ptr %11, i64 4
  %.fca.2.gep.i41 = getelementptr inbounds nuw i8, ptr %11, i64 8
  br label %42

42:                                               ; preds = %4, %63
  %.053 = phi i32 [ 0, %4 ], [ %65, %63 ]
  %43 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 4, i32 16, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %43, 0
  br i1 %.not, label %44, label %52

44:                                               ; preds = %42
  %45 = load ptr, ptr %25, align 8
  %46 = load ptr, ptr %23, align 8
  %47 = load ptr, ptr %24, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  call void @llvm.lifetime.start.p0(ptr nonnull %15)
  call void @llvm.lifetime.start.p0(ptr nonnull %16)
  call void @llvm.lifetime.start.p0(ptr nonnull %17)
  call void @llvm.lifetime.start.p0(ptr nonnull %18)
  call void @llvm.lifetime.start.p0(ptr nonnull %19)
  call void @llvm.lifetime.start.p0(ptr nonnull %20)
  call void @llvm.lifetime.start.p0(ptr nonnull %21)
  call void @llvm.lifetime.start.p0(ptr nonnull %22)
  store ptr %45, ptr %14, align 8
  store ptr %46, ptr %15, align 8
  store ptr %47, ptr %16, align 8
  store i32 %.053, ptr %17, align 4
  store ptr %14, ptr %18, align 16
  store ptr %15, ptr %36, align 8
  store ptr %16, ptr %37, align 16
  store ptr %17, ptr %38, align 8
  %48 = call i32 @__cudaPopCallConfiguration(ptr nonnull %19, ptr nonnull %20, ptr nonnull %21, ptr nonnull %22), !inline_history !5
  %49 = load i64, ptr %21, align 8
  %50 = load ptr, ptr %22, align 8
  %.fca.0.load2.i = load i32, ptr %19, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %20, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %51 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z30__device_stub__doitgen_kernel1PfS_S_i, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %18, i64 noundef %49, ptr noundef %50), !inline_history !5
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  call void @llvm.lifetime.end.p0(ptr nonnull %15)
  call void @llvm.lifetime.end.p0(ptr nonnull %16)
  call void @llvm.lifetime.end.p0(ptr nonnull %17)
  call void @llvm.lifetime.end.p0(ptr nonnull %18)
  call void @llvm.lifetime.end.p0(ptr nonnull %19)
  call void @llvm.lifetime.end.p0(ptr nonnull %20)
  call void @llvm.lifetime.end.p0(ptr nonnull %21)
  call void @llvm.lifetime.end.p0(ptr nonnull %22)
  br label %52

52:                                               ; preds = %42, %44
  %53 = call i32 @cudaThreadSynchronize() #5
  %54 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 4, i32 16, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not27 = icmp eq i32 %54, 0
  br i1 %.not27, label %55, label %63

55:                                               ; preds = %52
  %56 = load ptr, ptr %25, align 8
  %57 = load ptr, ptr %23, align 8
  %58 = load ptr, ptr %24, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
  store ptr %56, ptr %5, align 8
  store ptr %57, ptr %6, align 8
  store ptr %58, ptr %7, align 8
  store i32 %.053, ptr %8, align 4
  store ptr %5, ptr %9, align 16
  store ptr %6, ptr %39, align 8
  store ptr %7, ptr %40, align 16
  store ptr %8, ptr %41, align 8
  %59 = call i32 @__cudaPopCallConfiguration(ptr nonnull %10, ptr nonnull %11, ptr nonnull %12, ptr nonnull %13), !inline_history !6
  %60 = load i64, ptr %12, align 8
  %61 = load ptr, ptr %13, align 8
  %.fca.0.load2.i28 = load i32, ptr %10, align 8
  %.fca.0.insert3.i29 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i28, 0
  %.fca.1.load5.i31 = load i32, ptr %.fca.1.gep4.i30, align 4
  %.fca.1.insert6.i32 = insertvalue %struct.dim3 %.fca.0.insert3.i29, i32 %.fca.1.load5.i31, 1
  %.fca.2.load8.i34 = load i32, ptr %.fca.2.gep7.i33, align 8
  %.fca.2.insert9.i35 = insertvalue %struct.dim3 %.fca.1.insert6.i32, i32 %.fca.2.load8.i34, 2
  %.fca.0.load.i36 = load i32, ptr %11, align 8
  %.fca.0.insert.i37 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i36, 0
  %.fca.1.load.i39 = load i32, ptr %.fca.1.gep.i38, align 4
  %.fca.1.insert.i40 = insertvalue %struct.dim3 %.fca.0.insert.i37, i32 %.fca.1.load.i39, 1
  %.fca.2.load.i42 = load i32, ptr %.fca.2.gep.i41, align 8
  %.fca.2.insert.i43 = insertvalue %struct.dim3 %.fca.1.insert.i40, i32 %.fca.2.load.i42, 2
  %62 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z30__device_stub__doitgen_kernel2PfS_S_i, %struct.dim3 %.fca.2.insert9.i35, %struct.dim3 %.fca.2.insert.i43, ptr noundef nonnull %9, i64 noundef %60, ptr noundef %61), !inline_history !6
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  call void @llvm.lifetime.end.p0(ptr nonnull %13)
  br label %63

63:                                               ; preds = %52, %55
  %64 = call i32 @cudaThreadSynchronize() #5
  %65 = add nuw nsw i32 %.053, 1
  %exitcond.not = icmp eq i32 %65, 128
  br i1 %exitcond.not, label %66, label %42

66:                                               ; preds = %63
  %67 = call noundef double @_Z7rtclockv() #5
  %68 = load ptr, ptr @stdout, align 8
  %69 = fsub double %67, %35
  %70 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %68, ptr noundef nonnull @.str.2, double noundef %69) #11
  %71 = load ptr, ptr %25, align 8
  %72 = call i32 @cudaMemcpy(ptr noundef %3, ptr noundef %71, i64 noundef 8388608, i32 noundef 2) #5
  %73 = load ptr, ptr %23, align 8
  %74 = call i32 @cudaFree(ptr noundef %73) #5
  %75 = load ptr, ptr %24, align 8
  %76 = call i32 @cudaFree(ptr noundef %75) #5
  %77 = load ptr, ptr %25, align 8
  %78 = call i32 @cudaFree(ptr noundef %77) #5
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite, errnomem: write)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #8

define dso_local noundef i32 @main(i32 noundef %0, ptr nofree noundef readnone captures(none) %1) local_unnamed_addr #6 {
  %3 = tail call dereferenceable_or_null(8388608) ptr @malloc(i64 noundef 8388608) #12
  %4 = tail call dereferenceable_or_null(65536) ptr @malloc(i64 noundef 65536) #12
  %5 = tail call dereferenceable_or_null(8388608) ptr @malloc(i64 noundef 8388608) #12
  %6 = tail call dereferenceable_or_null(8388608) ptr @malloc(i64 noundef 8388608) #12
  br label %.preheader27.i

.preheader27.i:                                   ; preds = %107, %2
  %indvars.iv38.i = phi i64 [ 0, %2 ], [ %indvars.iv.next39.i, %107 ]
  %7 = trunc nuw nsw i64 %indvars.iv38.i to i32
  %8 = uitofp nneg i32 %7 to float
  %.idx50.i = shl nuw nsw i64 %indvars.iv38.i, 16
  %invariant.gep54.i = getelementptr i8, ptr %3, i64 %.idx50.i
  br label %.preheader26.i

.preheader26.i:                                   ; preds = %.preheader26.i, %.preheader27.i
  %indvars.iv34.i = phi i64 [ 0, %.preheader27.i ], [ %indvars.iv.next35.i, %.preheader26.i ]
  %9 = trunc nuw nsw i64 %indvars.iv34.i to i32
  %10 = uitofp nneg i32 %9 to float
  %11 = fmul nnan float %8, %10
  %broadcast.splatinsert = insertelement <4 x float> poison, float %11, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %.idx.i = shl nuw nsw i64 %indvars.iv34.i, 9
  %gep.i = getelementptr i8, ptr %invariant.gep54.i, i64 %.idx.i
  %12 = fadd nnan <4 x float> %broadcast.splat, <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>
  %13 = fadd nnan <4 x float> %broadcast.splat, <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>
  %14 = fmul nnan <4 x float> %12, splat (float 7.812500e-03)
  %15 = fmul nnan <4 x float> %13, splat (float 7.812500e-03)
  %16 = getelementptr i8, ptr %gep.i, i64 16
  store <4 x float> %14, ptr %gep.i, align 4
  store <4 x float> %15, ptr %16, align 4
  %17 = fadd nnan <4 x float> %broadcast.splat, <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>
  %18 = fadd nnan <4 x float> %broadcast.splat, <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>
  %19 = fmul nnan <4 x float> %17, splat (float 7.812500e-03)
  %20 = fmul nnan <4 x float> %18, splat (float 7.812500e-03)
  %21 = getelementptr i8, ptr %gep.i, i64 32
  %22 = getelementptr i8, ptr %gep.i, i64 48
  store <4 x float> %19, ptr %21, align 4
  store <4 x float> %20, ptr %22, align 4
  %23 = fadd nnan <4 x float> %broadcast.splat, <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>
  %24 = fadd nnan <4 x float> %broadcast.splat, <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>
  %25 = fmul nnan <4 x float> %23, splat (float 7.812500e-03)
  %26 = fmul nnan <4 x float> %24, splat (float 7.812500e-03)
  %27 = getelementptr i8, ptr %gep.i, i64 64
  %28 = getelementptr i8, ptr %gep.i, i64 80
  store <4 x float> %25, ptr %27, align 4
  store <4 x float> %26, ptr %28, align 4
  %29 = fadd nnan <4 x float> %broadcast.splat, <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>
  %30 = fadd nnan <4 x float> %broadcast.splat, <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>
  %31 = fmul nnan <4 x float> %29, splat (float 7.812500e-03)
  %32 = fmul nnan <4 x float> %30, splat (float 7.812500e-03)
  %33 = getelementptr i8, ptr %gep.i, i64 96
  %34 = getelementptr i8, ptr %gep.i, i64 112
  store <4 x float> %31, ptr %33, align 4
  store <4 x float> %32, ptr %34, align 4
  %35 = fadd nnan <4 x float> %broadcast.splat, <float 3.200000e+01, float 3.300000e+01, float 3.400000e+01, float 3.500000e+01>
  %36 = fadd nnan <4 x float> %broadcast.splat, <float 3.600000e+01, float 3.700000e+01, float 3.800000e+01, float 3.900000e+01>
  %37 = fmul nnan <4 x float> %35, splat (float 7.812500e-03)
  %38 = fmul nnan <4 x float> %36, splat (float 7.812500e-03)
  %39 = getelementptr i8, ptr %gep.i, i64 128
  %40 = getelementptr i8, ptr %gep.i, i64 144
  store <4 x float> %37, ptr %39, align 4
  store <4 x float> %38, ptr %40, align 4
  %41 = fadd nnan <4 x float> %broadcast.splat, <float 4.000000e+01, float 4.100000e+01, float 4.200000e+01, float 4.300000e+01>
  %42 = fadd nnan <4 x float> %broadcast.splat, <float 4.400000e+01, float 4.500000e+01, float 4.600000e+01, float 4.700000e+01>
  %43 = fmul nnan <4 x float> %41, splat (float 7.812500e-03)
  %44 = fmul nnan <4 x float> %42, splat (float 7.812500e-03)
  %45 = getelementptr i8, ptr %gep.i, i64 160
  %46 = getelementptr i8, ptr %gep.i, i64 176
  store <4 x float> %43, ptr %45, align 4
  store <4 x float> %44, ptr %46, align 4
  %47 = fadd nnan <4 x float> %broadcast.splat, <float 4.800000e+01, float 4.900000e+01, float 5.000000e+01, float 5.100000e+01>
  %48 = fadd nnan <4 x float> %broadcast.splat, <float 5.200000e+01, float 5.300000e+01, float 5.400000e+01, float 5.500000e+01>
  %49 = fmul nnan <4 x float> %47, splat (float 7.812500e-03)
  %50 = fmul nnan <4 x float> %48, splat (float 7.812500e-03)
  %51 = getelementptr i8, ptr %gep.i, i64 192
  %52 = getelementptr i8, ptr %gep.i, i64 208
  store <4 x float> %49, ptr %51, align 4
  store <4 x float> %50, ptr %52, align 4
  %53 = fadd nnan <4 x float> %broadcast.splat, <float 5.600000e+01, float 5.700000e+01, float 5.800000e+01, float 5.900000e+01>
  %54 = fadd nnan <4 x float> %broadcast.splat, <float 6.000000e+01, float 6.100000e+01, float 6.200000e+01, float 6.300000e+01>
  %55 = fmul nnan <4 x float> %53, splat (float 7.812500e-03)
  %56 = fmul nnan <4 x float> %54, splat (float 7.812500e-03)
  %57 = getelementptr i8, ptr %gep.i, i64 224
  %58 = getelementptr i8, ptr %gep.i, i64 240
  store <4 x float> %55, ptr %57, align 4
  store <4 x float> %56, ptr %58, align 4
  %59 = fadd nnan <4 x float> %broadcast.splat, <float 6.400000e+01, float 6.500000e+01, float 6.600000e+01, float 6.700000e+01>
  %60 = fadd nnan <4 x float> %broadcast.splat, <float 6.800000e+01, float 6.900000e+01, float 7.000000e+01, float 7.100000e+01>
  %61 = fmul nnan <4 x float> %59, splat (float 7.812500e-03)
  %62 = fmul nnan <4 x float> %60, splat (float 7.812500e-03)
  %63 = getelementptr i8, ptr %gep.i, i64 256
  %64 = getelementptr i8, ptr %gep.i, i64 272
  store <4 x float> %61, ptr %63, align 4
  store <4 x float> %62, ptr %64, align 4
  %65 = fadd nnan <4 x float> %broadcast.splat, <float 7.200000e+01, float 7.300000e+01, float 7.400000e+01, float 7.500000e+01>
  %66 = fadd nnan <4 x float> %broadcast.splat, <float 7.600000e+01, float 7.700000e+01, float 7.800000e+01, float 7.900000e+01>
  %67 = fmul nnan <4 x float> %65, splat (float 7.812500e-03)
  %68 = fmul nnan <4 x float> %66, splat (float 7.812500e-03)
  %69 = getelementptr i8, ptr %gep.i, i64 288
  %70 = getelementptr i8, ptr %gep.i, i64 304
  store <4 x float> %67, ptr %69, align 4
  store <4 x float> %68, ptr %70, align 4
  %71 = fadd nnan <4 x float> %broadcast.splat, <float 8.000000e+01, float 8.100000e+01, float 8.200000e+01, float 8.300000e+01>
  %72 = fadd nnan <4 x float> %broadcast.splat, <float 8.400000e+01, float 8.500000e+01, float 8.600000e+01, float 8.700000e+01>
  %73 = fmul nnan <4 x float> %71, splat (float 7.812500e-03)
  %74 = fmul nnan <4 x float> %72, splat (float 7.812500e-03)
  %75 = getelementptr i8, ptr %gep.i, i64 320
  %76 = getelementptr i8, ptr %gep.i, i64 336
  store <4 x float> %73, ptr %75, align 4
  store <4 x float> %74, ptr %76, align 4
  %77 = fadd nnan <4 x float> %broadcast.splat, <float 8.800000e+01, float 8.900000e+01, float 9.000000e+01, float 9.100000e+01>
  %78 = fadd nnan <4 x float> %broadcast.splat, <float 9.200000e+01, float 9.300000e+01, float 9.400000e+01, float 9.500000e+01>
  %79 = fmul nnan <4 x float> %77, splat (float 7.812500e-03)
  %80 = fmul nnan <4 x float> %78, splat (float 7.812500e-03)
  %81 = getelementptr i8, ptr %gep.i, i64 352
  %82 = getelementptr i8, ptr %gep.i, i64 368
  store <4 x float> %79, ptr %81, align 4
  store <4 x float> %80, ptr %82, align 4
  %83 = fadd nnan <4 x float> %broadcast.splat, <float 9.600000e+01, float 9.700000e+01, float 9.800000e+01, float 9.900000e+01>
  %84 = fadd nnan <4 x float> %broadcast.splat, <float 1.000000e+02, float 1.010000e+02, float 1.020000e+02, float 1.030000e+02>
  %85 = fmul nnan <4 x float> %83, splat (float 7.812500e-03)
  %86 = fmul nnan <4 x float> %84, splat (float 7.812500e-03)
  %87 = getelementptr i8, ptr %gep.i, i64 384
  %88 = getelementptr i8, ptr %gep.i, i64 400
  store <4 x float> %85, ptr %87, align 4
  store <4 x float> %86, ptr %88, align 4
  %89 = fadd nnan <4 x float> %broadcast.splat, <float 1.040000e+02, float 1.050000e+02, float 1.060000e+02, float 1.070000e+02>
  %90 = fadd nnan <4 x float> %broadcast.splat, <float 1.080000e+02, float 1.090000e+02, float 1.100000e+02, float 1.110000e+02>
  %91 = fmul nnan <4 x float> %89, splat (float 7.812500e-03)
  %92 = fmul nnan <4 x float> %90, splat (float 7.812500e-03)
  %93 = getelementptr i8, ptr %gep.i, i64 416
  %94 = getelementptr i8, ptr %gep.i, i64 432
  store <4 x float> %91, ptr %93, align 4
  store <4 x float> %92, ptr %94, align 4
  %95 = fadd nnan <4 x float> %broadcast.splat, <float 1.120000e+02, float 1.130000e+02, float 1.140000e+02, float 1.150000e+02>
  %96 = fadd nnan <4 x float> %broadcast.splat, <float 1.160000e+02, float 1.170000e+02, float 1.180000e+02, float 1.190000e+02>
  %97 = fmul nnan <4 x float> %95, splat (float 7.812500e-03)
  %98 = fmul nnan <4 x float> %96, splat (float 7.812500e-03)
  %99 = getelementptr i8, ptr %gep.i, i64 448
  %100 = getelementptr i8, ptr %gep.i, i64 464
  store <4 x float> %97, ptr %99, align 4
  store <4 x float> %98, ptr %100, align 4
  %101 = fadd nnan <4 x float> %broadcast.splat, <float 1.200000e+02, float 1.210000e+02, float 1.220000e+02, float 1.230000e+02>
  %102 = fadd nnan <4 x float> %broadcast.splat, <float 1.240000e+02, float 1.250000e+02, float 1.260000e+02, float 1.270000e+02>
  %103 = fmul nnan <4 x float> %101, splat (float 7.812500e-03)
  %104 = fmul nnan <4 x float> %102, splat (float 7.812500e-03)
  %105 = getelementptr i8, ptr %gep.i, i64 480
  %106 = getelementptr i8, ptr %gep.i, i64 496
  store <4 x float> %103, ptr %105, align 4
  store <4 x float> %104, ptr %106, align 4
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond37.not.i = icmp eq i64 %indvars.iv.next35.i, 128
  br i1 %exitcond37.not.i, label %107, label %.preheader26.i

107:                                              ; preds = %.preheader26.i
  %indvars.iv.next39.i = add nuw nsw i64 %indvars.iv38.i, 1
  %exitcond41.not.i = icmp eq i64 %indvars.iv.next39.i, 128
  br i1 %exitcond41.not.i, label %.preheader.i, label %.preheader27.i

.preheader.i:                                     ; preds = %107, %.preheader.i
  %indvars.iv46.i = phi i64 [ %indvars.iv.next47.i, %.preheader.i ], [ 0, %107 ]
  %108 = trunc nuw nsw i64 %indvars.iv46.i to i32
  %109 = uitofp nneg i32 %108 to float
  %broadcast.splatinsert31 = insertelement <4 x float> poison, float %109, i64 0
  %broadcast.splat32 = shufflevector <4 x float> %broadcast.splatinsert31, <4 x float> poison, <4 x i32> zeroinitializer
  %.idx51.i = shl nuw nsw i64 %indvars.iv46.i, 9
  %invariant.gep.i = getelementptr i8, ptr %4, i64 %.idx51.i
  %110 = fmul nnan <4 x float> %broadcast.splat32, <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>
  %111 = fmul nnan <4 x float> %broadcast.splat32, <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>
  %112 = fmul nnan <4 x float> %110, splat (float 7.812500e-03)
  %113 = fmul nnan <4 x float> %111, splat (float 7.812500e-03)
  %114 = getelementptr i8, ptr %invariant.gep.i, i64 16
  store <4 x float> %112, ptr %invariant.gep.i, align 4
  store <4 x float> %113, ptr %114, align 4
  %115 = fmul nnan <4 x float> %broadcast.splat32, <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>
  %116 = fmul nnan <4 x float> %broadcast.splat32, <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>
  %117 = fmul nnan <4 x float> %115, splat (float 7.812500e-03)
  %118 = fmul nnan <4 x float> %116, splat (float 7.812500e-03)
  %119 = getelementptr i8, ptr %invariant.gep.i, i64 32
  %120 = getelementptr i8, ptr %invariant.gep.i, i64 48
  store <4 x float> %117, ptr %119, align 4
  store <4 x float> %118, ptr %120, align 4
  %121 = fmul nnan <4 x float> %broadcast.splat32, <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>
  %122 = fmul nnan <4 x float> %broadcast.splat32, <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>
  %123 = fmul nnan <4 x float> %121, splat (float 7.812500e-03)
  %124 = fmul nnan <4 x float> %122, splat (float 7.812500e-03)
  %125 = getelementptr i8, ptr %invariant.gep.i, i64 64
  %126 = getelementptr i8, ptr %invariant.gep.i, i64 80
  store <4 x float> %123, ptr %125, align 4
  store <4 x float> %124, ptr %126, align 4
  %127 = fmul nnan <4 x float> %broadcast.splat32, <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>
  %128 = fmul nnan <4 x float> %broadcast.splat32, <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>
  %129 = fmul nnan <4 x float> %127, splat (float 7.812500e-03)
  %130 = fmul nnan <4 x float> %128, splat (float 7.812500e-03)
  %131 = getelementptr i8, ptr %invariant.gep.i, i64 96
  %132 = getelementptr i8, ptr %invariant.gep.i, i64 112
  store <4 x float> %129, ptr %131, align 4
  store <4 x float> %130, ptr %132, align 4
  %133 = fmul nnan <4 x float> %broadcast.splat32, <float 3.200000e+01, float 3.300000e+01, float 3.400000e+01, float 3.500000e+01>
  %134 = fmul nnan <4 x float> %broadcast.splat32, <float 3.600000e+01, float 3.700000e+01, float 3.800000e+01, float 3.900000e+01>
  %135 = fmul nnan <4 x float> %133, splat (float 7.812500e-03)
  %136 = fmul nnan <4 x float> %134, splat (float 7.812500e-03)
  %137 = getelementptr i8, ptr %invariant.gep.i, i64 128
  %138 = getelementptr i8, ptr %invariant.gep.i, i64 144
  store <4 x float> %135, ptr %137, align 4
  store <4 x float> %136, ptr %138, align 4
  %139 = fmul nnan <4 x float> %broadcast.splat32, <float 4.000000e+01, float 4.100000e+01, float 4.200000e+01, float 4.300000e+01>
  %140 = fmul nnan <4 x float> %broadcast.splat32, <float 4.400000e+01, float 4.500000e+01, float 4.600000e+01, float 4.700000e+01>
  %141 = fmul nnan <4 x float> %139, splat (float 7.812500e-03)
  %142 = fmul nnan <4 x float> %140, splat (float 7.812500e-03)
  %143 = getelementptr i8, ptr %invariant.gep.i, i64 160
  %144 = getelementptr i8, ptr %invariant.gep.i, i64 176
  store <4 x float> %141, ptr %143, align 4
  store <4 x float> %142, ptr %144, align 4
  %145 = fmul nnan <4 x float> %broadcast.splat32, <float 4.800000e+01, float 4.900000e+01, float 5.000000e+01, float 5.100000e+01>
  %146 = fmul nnan <4 x float> %broadcast.splat32, <float 5.200000e+01, float 5.300000e+01, float 5.400000e+01, float 5.500000e+01>
  %147 = fmul nnan <4 x float> %145, splat (float 7.812500e-03)
  %148 = fmul nnan <4 x float> %146, splat (float 7.812500e-03)
  %149 = getelementptr i8, ptr %invariant.gep.i, i64 192
  %150 = getelementptr i8, ptr %invariant.gep.i, i64 208
  store <4 x float> %147, ptr %149, align 4
  store <4 x float> %148, ptr %150, align 4
  %151 = fmul nnan <4 x float> %broadcast.splat32, <float 5.600000e+01, float 5.700000e+01, float 5.800000e+01, float 5.900000e+01>
  %152 = fmul nnan <4 x float> %broadcast.splat32, <float 6.000000e+01, float 6.100000e+01, float 6.200000e+01, float 6.300000e+01>
  %153 = fmul nnan <4 x float> %151, splat (float 7.812500e-03)
  %154 = fmul nnan <4 x float> %152, splat (float 7.812500e-03)
  %155 = getelementptr i8, ptr %invariant.gep.i, i64 224
  %156 = getelementptr i8, ptr %invariant.gep.i, i64 240
  store <4 x float> %153, ptr %155, align 4
  store <4 x float> %154, ptr %156, align 4
  %157 = fmul nnan <4 x float> %broadcast.splat32, <float 6.400000e+01, float 6.500000e+01, float 6.600000e+01, float 6.700000e+01>
  %158 = fmul nnan <4 x float> %broadcast.splat32, <float 6.800000e+01, float 6.900000e+01, float 7.000000e+01, float 7.100000e+01>
  %159 = fmul nnan <4 x float> %157, splat (float 7.812500e-03)
  %160 = fmul nnan <4 x float> %158, splat (float 7.812500e-03)
  %161 = getelementptr i8, ptr %invariant.gep.i, i64 256
  %162 = getelementptr i8, ptr %invariant.gep.i, i64 272
  store <4 x float> %159, ptr %161, align 4
  store <4 x float> %160, ptr %162, align 4
  %163 = fmul nnan <4 x float> %broadcast.splat32, <float 7.200000e+01, float 7.300000e+01, float 7.400000e+01, float 7.500000e+01>
  %164 = fmul nnan <4 x float> %broadcast.splat32, <float 7.600000e+01, float 7.700000e+01, float 7.800000e+01, float 7.900000e+01>
  %165 = fmul nnan <4 x float> %163, splat (float 7.812500e-03)
  %166 = fmul nnan <4 x float> %164, splat (float 7.812500e-03)
  %167 = getelementptr i8, ptr %invariant.gep.i, i64 288
  %168 = getelementptr i8, ptr %invariant.gep.i, i64 304
  store <4 x float> %165, ptr %167, align 4
  store <4 x float> %166, ptr %168, align 4
  %169 = fmul nnan <4 x float> %broadcast.splat32, <float 8.000000e+01, float 8.100000e+01, float 8.200000e+01, float 8.300000e+01>
  %170 = fmul nnan <4 x float> %broadcast.splat32, <float 8.400000e+01, float 8.500000e+01, float 8.600000e+01, float 8.700000e+01>
  %171 = fmul nnan <4 x float> %169, splat (float 7.812500e-03)
  %172 = fmul nnan <4 x float> %170, splat (float 7.812500e-03)
  %173 = getelementptr i8, ptr %invariant.gep.i, i64 320
  %174 = getelementptr i8, ptr %invariant.gep.i, i64 336
  store <4 x float> %171, ptr %173, align 4
  store <4 x float> %172, ptr %174, align 4
  %175 = fmul nnan <4 x float> %broadcast.splat32, <float 8.800000e+01, float 8.900000e+01, float 9.000000e+01, float 9.100000e+01>
  %176 = fmul nnan <4 x float> %broadcast.splat32, <float 9.200000e+01, float 9.300000e+01, float 9.400000e+01, float 9.500000e+01>
  %177 = fmul nnan <4 x float> %175, splat (float 7.812500e-03)
  %178 = fmul nnan <4 x float> %176, splat (float 7.812500e-03)
  %179 = getelementptr i8, ptr %invariant.gep.i, i64 352
  %180 = getelementptr i8, ptr %invariant.gep.i, i64 368
  store <4 x float> %177, ptr %179, align 4
  store <4 x float> %178, ptr %180, align 4
  %181 = fmul nnan <4 x float> %broadcast.splat32, <float 9.600000e+01, float 9.700000e+01, float 9.800000e+01, float 9.900000e+01>
  %182 = fmul nnan <4 x float> %broadcast.splat32, <float 1.000000e+02, float 1.010000e+02, float 1.020000e+02, float 1.030000e+02>
  %183 = fmul nnan <4 x float> %181, splat (float 7.812500e-03)
  %184 = fmul nnan <4 x float> %182, splat (float 7.812500e-03)
  %185 = getelementptr i8, ptr %invariant.gep.i, i64 384
  %186 = getelementptr i8, ptr %invariant.gep.i, i64 400
  store <4 x float> %183, ptr %185, align 4
  store <4 x float> %184, ptr %186, align 4
  %187 = fmul nnan <4 x float> %broadcast.splat32, <float 1.040000e+02, float 1.050000e+02, float 1.060000e+02, float 1.070000e+02>
  %188 = fmul nnan <4 x float> %broadcast.splat32, <float 1.080000e+02, float 1.090000e+02, float 1.100000e+02, float 1.110000e+02>
  %189 = fmul nnan <4 x float> %187, splat (float 7.812500e-03)
  %190 = fmul nnan <4 x float> %188, splat (float 7.812500e-03)
  %191 = getelementptr i8, ptr %invariant.gep.i, i64 416
  %192 = getelementptr i8, ptr %invariant.gep.i, i64 432
  store <4 x float> %189, ptr %191, align 4
  store <4 x float> %190, ptr %192, align 4
  %193 = fmul nnan <4 x float> %broadcast.splat32, <float 1.120000e+02, float 1.130000e+02, float 1.140000e+02, float 1.150000e+02>
  %194 = fmul nnan <4 x float> %broadcast.splat32, <float 1.160000e+02, float 1.170000e+02, float 1.180000e+02, float 1.190000e+02>
  %195 = fmul nnan <4 x float> %193, splat (float 7.812500e-03)
  %196 = fmul nnan <4 x float> %194, splat (float 7.812500e-03)
  %197 = getelementptr i8, ptr %invariant.gep.i, i64 448
  %198 = getelementptr i8, ptr %invariant.gep.i, i64 464
  store <4 x float> %195, ptr %197, align 4
  store <4 x float> %196, ptr %198, align 4
  %199 = fmul nnan <4 x float> %broadcast.splat32, <float 1.200000e+02, float 1.210000e+02, float 1.220000e+02, float 1.230000e+02>
  %200 = fmul nnan <4 x float> %broadcast.splat32, <float 1.240000e+02, float 1.250000e+02, float 1.260000e+02, float 1.270000e+02>
  %201 = fmul nnan <4 x float> %199, splat (float 7.812500e-03)
  %202 = fmul nnan <4 x float> %200, splat (float 7.812500e-03)
  %203 = getelementptr i8, ptr %invariant.gep.i, i64 480
  %204 = getelementptr i8, ptr %invariant.gep.i, i64 496
  store <4 x float> %201, ptr %203, align 4
  store <4 x float> %202, ptr %204, align 4
  %indvars.iv.next47.i = add nuw nsw i64 %indvars.iv46.i, 1
  %exitcond49.not.i = icmp eq i64 %indvars.iv.next47.i, 128
  br i1 %exitcond49.not.i, label %_Z10init_arrayPfS_.exit, label %.preheader.i

_Z10init_arrayPfS_.exit:                          ; preds = %.preheader.i
  tail call void @_Z11doitgenCudaPfS_S_S_(ptr noundef %3, ptr noundef nonnull %4, ptr noundef %5, ptr noundef %6) #5
  %205 = tail call noundef double @_Z7rtclockv() #5
  br label %.preheader41.i

.preheader41.i:                                   ; preds = %232, %_Z10init_arrayPfS_.exit
  %indvars.iv65.i = phi i64 [ 0, %_Z10init_arrayPfS_.exit ], [ %indvars.iv.next66.i, %232 ]
  %206 = shl nuw nsw i64 %indvars.iv65.i, 16
  %207 = shl nuw nsw i64 %indvars.iv65.i, 14
  br label %.preheader40.i

.preheader40.i:                                   ; preds = %.preheader.i23.preheader, %.preheader41.i
  %indvars.iv61.i = phi i64 [ 0, %.preheader41.i ], [ %indvars.iv.next62.i, %.preheader.i23.preheader ]
  %208 = shl nuw nsw i64 %indvars.iv61.i, 9
  %209 = add nuw nsw i64 %206, %208
  %scevgep = getelementptr i8, ptr %3, i64 %209
  %scevgep28 = getelementptr i8, ptr %5, i64 %209
  %210 = shl nuw nsw i64 %indvars.iv61.i, 7
  %211 = add nuw nsw i64 %210, %207
  %invariant.gep71.i = getelementptr [4 x i8], ptr %5, i64 %211
  %invariant.gep.i17 = getelementptr [4 x i8], ptr %3, i64 %211
  br label %212

212:                                              ; preds = %231, %.preheader40.i
  %indvars.iv50.i = phi i64 [ 0, %.preheader40.i ], [ %indvars.iv.next51.i, %231 ]
  %gep72.i = getelementptr [4 x i8], ptr %invariant.gep71.i, i64 %indvars.iv50.i
  %invariant.gep69.i = getelementptr [4 x i8], ptr %4, i64 %indvars.iv50.i
  br label %213

213:                                              ; preds = %213, %212
  %indvars.iv.i18 = phi i64 [ 0, %212 ], [ %indvars.iv.next.i21.3, %213 ]
  %214 = phi float [ 0.000000e+00, %212 ], [ %230, %213 ]
  %gep.i19 = getelementptr [4 x i8], ptr %invariant.gep.i17, i64 %indvars.iv.i18
  %215 = load float, ptr %gep.i19, align 4
  %.idx.i20 = shl nuw nsw i64 %indvars.iv.i18, 9
  %gep70.i = getelementptr i8, ptr %invariant.gep69.i, i64 %.idx.i20
  %216 = load float, ptr %gep70.i, align 4
  %217 = fmul float %215, %216
  %218 = fadd float %214, %217
  %indvars.iv.next.i21 = or disjoint i64 %indvars.iv.i18, 1
  %gep.i19.1 = getelementptr [4 x i8], ptr %invariant.gep.i17, i64 %indvars.iv.next.i21
  %219 = load float, ptr %gep.i19.1, align 4
  %.idx.i20.1 = shl nuw nsw i64 %indvars.iv.next.i21, 9
  %gep70.i.1 = getelementptr i8, ptr %invariant.gep69.i, i64 %.idx.i20.1
  %220 = load float, ptr %gep70.i.1, align 4
  %221 = fmul float %219, %220
  %222 = fadd float %218, %221
  %indvars.iv.next.i21.1 = or disjoint i64 %indvars.iv.i18, 2
  %gep.i19.2 = getelementptr [4 x i8], ptr %invariant.gep.i17, i64 %indvars.iv.next.i21.1
  %223 = load float, ptr %gep.i19.2, align 4
  %.idx.i20.2 = shl nuw nsw i64 %indvars.iv.next.i21.1, 9
  %gep70.i.2 = getelementptr i8, ptr %invariant.gep69.i, i64 %.idx.i20.2
  %224 = load float, ptr %gep70.i.2, align 4
  %225 = fmul float %223, %224
  %226 = fadd float %222, %225
  %indvars.iv.next.i21.2 = or disjoint i64 %indvars.iv.i18, 3
  %gep.i19.3 = getelementptr [4 x i8], ptr %invariant.gep.i17, i64 %indvars.iv.next.i21.2
  %227 = load float, ptr %gep.i19.3, align 4
  %.idx.i20.3 = shl nuw nsw i64 %indvars.iv.next.i21.2, 9
  %gep70.i.3 = getelementptr i8, ptr %invariant.gep69.i, i64 %.idx.i20.3
  %228 = load float, ptr %gep70.i.3, align 4
  %229 = fmul float %227, %228
  %230 = fadd float %226, %229
  %indvars.iv.next.i21.3 = add nuw nsw i64 %indvars.iv.i18, 4
  %exitcond.not.i22.3 = icmp eq i64 %indvars.iv.next.i21.3, 128
  br i1 %exitcond.not.i22.3, label %231, label %213

231:                                              ; preds = %213
  store float %230, ptr %gep72.i, align 4
  %indvars.iv.next51.i = add nuw nsw i64 %indvars.iv50.i, 1
  %exitcond53.not.i = icmp eq i64 %indvars.iv.next51.i, 128
  br i1 %exitcond53.not.i, label %.preheader.i23.preheader, label %212

.preheader.i23.preheader:                         ; preds = %231
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(512) %scevgep, ptr noundef nonnull align 4 dereferenceable(512) %scevgep28, i64 512, i1 false)
  %indvars.iv.next62.i = add nuw nsw i64 %indvars.iv61.i, 1
  %exitcond64.not.i = icmp eq i64 %indvars.iv.next62.i, 128
  br i1 %exitcond64.not.i, label %232, label %.preheader40.i

232:                                              ; preds = %.preheader.i23.preheader
  %indvars.iv.next66.i = add nuw nsw i64 %indvars.iv65.i, 1
  %exitcond68.not.i = icmp eq i64 %indvars.iv.next66.i, 128
  br i1 %exitcond68.not.i, label %_Z10doitgenCPUPfS_S_.exit, label %.preheader41.i

_Z10doitgenCPUPfS_S_.exit:                        ; preds = %232
  %233 = tail call noundef double @_Z7rtclockv() #5
  %234 = load ptr, ptr @stdout, align 8
  %235 = fsub double %233, %205
  %236 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %234, ptr noundef nonnull @.str.3, double noundef %235) #11
  br label %.preheader18.i

.preheader18.i:                                   ; preds = %276, %_Z10doitgenCPUPfS_S_.exit
  %indvars.iv30.i = phi i64 [ 0, %_Z10doitgenCPUPfS_S_.exit ], [ %indvars.iv.next31.i, %276 ]
  %.024.i = phi i32 [ 0, %_Z10doitgenCPUPfS_S_.exit ], [ %275, %276 ]
  %237 = shl nuw nsw i64 %indvars.iv30.i, 14
  br label %.preheader.i24

.preheader.i24:                                   ; preds = %middle.block45, %.preheader18.i
  %indvars.iv26.i = phi i64 [ 0, %.preheader18.i ], [ %indvars.iv.next27.i, %middle.block45 ]
  %.122.i = phi i32 [ %.024.i, %.preheader18.i ], [ %275, %middle.block45 ]
  %238 = shl nuw nsw i64 %indvars.iv26.i, 7
  %239 = add nuw nsw i64 %238, %237
  %240 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.122.i, i64 0
  br label %vector.body41

vector.body41:                                    ; preds = %vector.body41, %.preheader.i24
  %index42 = phi i64 [ 0, %.preheader.i24 ], [ %index.next44, %vector.body41 ]
  %vec.phi = phi <4 x i32> [ %240, %.preheader.i24 ], [ %273, %vector.body41 ]
  %241 = add nuw nsw i64 %239, %index42
  %242 = getelementptr [4 x i8], ptr %5, i64 %241
  %wide.load = load <4 x float>, ptr %242, align 4
  %243 = fpext <4 x float> %wide.load to <4 x double>
  %244 = getelementptr [4 x i8], ptr %6, i64 %241
  %wide.load43 = load <4 x float>, ptr %244, align 4
  %245 = fpext <4 x float> %wide.load43 to <4 x double>
  %246 = fcmp olt <4 x double> %243, splat (double f0xB690000000000000)
  %247 = fneg <4 x float> %wide.load
  %248 = select <4 x i1> %246, <4 x float> %247, <4 x float> %wide.load
  %249 = fpext <4 x float> %248 to <4 x double>
  %250 = fcmp uge <4 x double> %249, splat (double 1.000000e-02)
  %251 = fcmp olt <4 x double> %245, splat (double f0xB690000000000000)
  %252 = fneg <4 x float> %wide.load43
  %253 = select <4 x i1> %251, <4 x float> %252, <4 x float> %wide.load43
  %254 = fpext <4 x float> %253 to <4 x double>
  %255 = fcmp uge <4 x double> %254, splat (double 1.000000e-02)
  %256 = fsub <4 x double> %243, %245
  %257 = fptrunc <4 x double> %256 to <4 x float>
  %258 = fcmp olt <4 x double> %256, splat (double f0xB690000000000000)
  %259 = fneg <4 x float> %257
  %260 = select <4 x i1> %258, <4 x float> %259, <4 x float> %257
  %261 = fadd <4 x double> %243, splat (double f0x3E45798EE0000000)
  %262 = fptrunc <4 x double> %261 to <4 x float>
  %263 = fcmp olt <4 x double> %261, splat (double f0xB690000000000000)
  %264 = fneg <4 x float> %262
  %265 = select <4 x i1> %263, <4 x float> %264, <4 x float> %262
  %266 = fdiv <4 x float> %260, %265
  %267 = fcmp olt <4 x float> %266, zeroinitializer
  %268 = fneg <4 x float> %266
  %269 = select <4 x i1> %267, <4 x float> %268, <4 x float> %266
  %270 = fmul <4 x float> %269, splat (float 1.000000e+02)
  %271 = fpext <4 x float> %270 to <4 x double>
  %272 = fcmp ogt <4 x double> %271, splat (double 5.000000e-02)
  %.not47 = select <4 x i1> %250, <4 x i1> splat (i1 true), <4 x i1> %255
  %narrow = select <4 x i1> %.not47, <4 x i1> %272, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %273 = add <4 x i32> %vec.phi, %predphi
  %index.next44 = add nuw i64 %index42, 4
  %274 = icmp eq i64 %index.next44, 128
  br i1 %274, label %middle.block45, label %vector.body41, !llvm.loop !7

middle.block45:                                   ; preds = %vector.body41
  %275 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %273)
  %indvars.iv.next27.i = add nuw nsw i64 %indvars.iv26.i, 1
  %exitcond29.not.i = icmp eq i64 %indvars.iv.next27.i, 128
  br i1 %exitcond29.not.i, label %276, label %.preheader.i24

276:                                              ; preds = %middle.block45
  %indvars.iv.next31.i = add nuw nsw i64 %indvars.iv30.i, 1
  %exitcond33.not.i = icmp eq i64 %indvars.iv.next31.i, 128
  br i1 %exitcond33.not.i, label %_Z14compareResultsPfS_.exit, label %.preheader18.i

_Z14compareResultsPfS_.exit:                      ; preds = %276
  %277 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %275) #5
  tail call void @free(ptr noundef %3) #11
  tail call void @free(ptr noundef %4) #11
  tail call void @free(ptr noundef nonnull %5) #11
  tail call void @free(ptr noundef nonnull %6) #11
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #9

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #9

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #9

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #10

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { nofree norecurse nosync nounwind memory(argmem: write) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #3 = { nofree nounwind "uniform-work-group-size" }
attributes #4 = { nofree nounwind "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #5 = { "uniform-work-group-size" }
attributes #6 = { "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #7 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite, errnomem: write) "alloc-family"="malloc" "uniform-work-group-size" }
attributes #8 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "uniform-work-group-size" }
attributes #9 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #11 = { nounwind "uniform-work-group-size" }
attributes #12 = { nounwind allocsize(0) "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.isvectorized", i32 1}
!3 = distinct !{!3, !2, !4}
!4 = !{!"llvm.loop.unroll.runtime.disable"}
!5 = !{ptr @_Z30__device_stub__doitgen_kernel1PfS_S_i}
!6 = !{ptr @_Z30__device_stub__doitgen_kernel2PfS_S_i}
!7 = distinct !{!7, !2, !4}
