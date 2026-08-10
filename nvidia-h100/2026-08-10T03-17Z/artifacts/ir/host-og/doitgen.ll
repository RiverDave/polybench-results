; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/DOITGEN/doitgen.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/DOITGEN/doitgen.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cudaDeviceProp = type { [256 x i8], %struct.CUuuid_st, [8 x i8], i32, i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [63 x i32] }
%struct.CUuuid_st = type { [16 x i8] }
%struct.dim3 = type { i32, i32, i32 }

@.str = private unnamed_addr constant [22 x i8] c"Number of misses: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"setting device %d with name %s\0A\00", align 1
@stdout = external local_unnamed_addr global ptr, align 8
@.str.2 = private unnamed_addr constant [22 x i8] c"GPU Runtime: %0.6lfs\0A\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"CPU Runtime: %0.6lfs\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef float @_Z6absValf(float noundef %a) local_unnamed_addr #0 {
entry:
  %cmp = fcmp olt float %a, 0.000000e+00
  %mul = fneg float %a
  %retval.0 = select i1 %cmp, float %mul, float %a
  ret float %retval.0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef float @_Z11percentDiffdd(double noundef %val1, double noundef %val2) local_unnamed_addr #0 {
entry:
  %conv = fptrunc double %val1 to float
  %cmp.i = fcmp olt double %val1, f0xB690000000000000
  %mul.i = fneg float %conv
  %retval.0.i = select i1 %cmp.i, float %mul.i, float %conv
  %conv1 = fpext float %retval.0.i to double
  %cmp = fcmp olt double %conv1, 1.000000e-02
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %conv2 = fptrunc double %val2 to float
  %cmp.i14 = fcmp olt double %val2, f0xB690000000000000
  %mul.i15 = fneg float %conv2
  %retval.0.i16 = select i1 %cmp.i14, float %mul.i15, float %conv2
  %conv4 = fpext float %retval.0.i16 to double
  %cmp5 = fcmp olt double %conv4, 1.000000e-02
  br i1 %cmp5, label %return, label %if.else

if.else:                                          ; preds = %land.lhs.true, %entry
  %0 = insertelement <2 x double> poison, double %val1, i64 0
  %1 = shufflevector <2 x double> %0, <2 x double> poison, <2 x i32> zeroinitializer
  %2 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %val2, i64 0
  %3 = fsub <2 x double> %1, %2
  %4 = fptrunc <2 x double> %3 to <2 x float>
  %5 = fcmp olt <2 x double> %3, splat (double f0xB690000000000000)
  %6 = fneg <2 x float> %4
  %7 = select <2 x i1> %5, <2 x float> %6, <2 x float> %4
  %8 = extractelement <2 x float> %7, i64 0
  %9 = extractelement <2 x float> %7, i64 1
  %div = fdiv float %8, %9
  %cmp.i23 = fcmp olt float %div, 0.000000e+00
  %mul.i24 = fneg float %div
  %retval.0.i25 = select i1 %cmp.i23, float %mul.i24, float %div
  %mul = fmul float %retval.0.i25, 1.000000e+02
  br label %return

return:                                           ; preds = %land.lhs.true, %if.else
  %retval.0 = phi float [ %mul, %if.else ], [ 0.000000e+00, %land.lhs.true ]
  ret float %retval.0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z10doitgenCPUPfS_S_(ptr nofree noundef captures(none) %sum, ptr nofree noundef captures(none) %A, ptr nofree noundef readonly captures(none) %C4) local_unnamed_addr #1 {
entry:
  %sum139 = ptrtoaddr ptr %sum to i64
  %A138 = ptrtoaddr ptr %A to i64
  %0 = sub i64 %sum139, %A138
  %diff.check = icmp ugt i64 %0, -32
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.cond.cleanup3
  %indvars.iv128 = phi i64 [ 0, %entry ], [ %indvars.iv.next129, %for.cond.cleanup3 ]
  %1 = shl nuw nsw i64 %indvars.iv128, 14
  br label %for.cond5.preheader

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3
  ret void

for.cond5.preheader:                              ; preds = %for.cond1.preheader, %for.cond.cleanup44
  %indvars.iv120 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next121, %for.cond.cleanup44 ]
  %2 = shl nuw nsw i64 %indvars.iv120, 7
  %3 = add nuw nsw i64 %2, %1
  %invariant.gep136 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %3
  %invariant.gep = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %3
  br label %for.body8

for.cond.cleanup3:                                ; preds = %for.cond.cleanup44
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %exitcond133.not = icmp eq i64 %indvars.iv.next129, 128
  br i1 %exitcond133.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !10

for.body8:                                        ; preds = %for.cond5.preheader, %for.cond.cleanup13
  %indvars.iv107 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next108, %for.cond.cleanup13 ]
  %gep137 = getelementptr inbounds nuw [4 x i8], ptr %invariant.gep136, i64 %indvars.iv107
  store float 0.000000e+00, ptr %gep137, align 4, !tbaa !12
  %invariant.gep134 = getelementptr inbounds nuw [4 x i8], ptr %C4, i64 %indvars.iv107
  br label %for.body14

for.cond.cleanup13:                               ; preds = %for.body14
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond111.not = icmp eq i64 %indvars.iv.next108, 128
  br i1 %exitcond111.not, label %vector.memcheck, label %for.body8, !llvm.loop !14

vector.memcheck:                                  ; preds = %for.cond.cleanup13
  br i1 %diff.check, label %for.body45, label %vector.body

vector.body:                                      ; preds = %vector.memcheck
  %4 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %3
  %5 = getelementptr inbounds nuw i8, ptr %4, i64 16
  %wide.load = load <4 x float>, ptr %4, align 4, !tbaa !12
  %wide.load140 = load <4 x float>, ptr %5, align 4, !tbaa !12
  %6 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %3
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 16
  store <4 x float> %wide.load, ptr %6, align 4, !tbaa !12
  store <4 x float> %wide.load140, ptr %7, align 4, !tbaa !12
  %8 = or disjoint i64 %3, 8
  %9 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %8
  %10 = getelementptr inbounds nuw i8, ptr %9, i64 16
  %wide.load.1 = load <4 x float>, ptr %9, align 4, !tbaa !12
  %wide.load140.1 = load <4 x float>, ptr %10, align 4, !tbaa !12
  %11 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %8
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 16
  store <4 x float> %wide.load.1, ptr %11, align 4, !tbaa !12
  store <4 x float> %wide.load140.1, ptr %12, align 4, !tbaa !12
  %13 = or disjoint i64 %3, 16
  %14 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %13
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 16
  %wide.load.2 = load <4 x float>, ptr %14, align 4, !tbaa !12
  %wide.load140.2 = load <4 x float>, ptr %15, align 4, !tbaa !12
  %16 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %13
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 16
  store <4 x float> %wide.load.2, ptr %16, align 4, !tbaa !12
  store <4 x float> %wide.load140.2, ptr %17, align 4, !tbaa !12
  %18 = or disjoint i64 %3, 24
  %19 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %18
  %20 = getelementptr inbounds nuw i8, ptr %19, i64 16
  %wide.load.3 = load <4 x float>, ptr %19, align 4, !tbaa !12
  %wide.load140.3 = load <4 x float>, ptr %20, align 4, !tbaa !12
  %21 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %18
  %22 = getelementptr inbounds nuw i8, ptr %21, i64 16
  store <4 x float> %wide.load.3, ptr %21, align 4, !tbaa !12
  store <4 x float> %wide.load140.3, ptr %22, align 4, !tbaa !12
  %23 = or disjoint i64 %3, 32
  %24 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %23
  %25 = getelementptr inbounds nuw i8, ptr %24, i64 16
  %wide.load.4 = load <4 x float>, ptr %24, align 4, !tbaa !12
  %wide.load140.4 = load <4 x float>, ptr %25, align 4, !tbaa !12
  %26 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %23
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 16
  store <4 x float> %wide.load.4, ptr %26, align 4, !tbaa !12
  store <4 x float> %wide.load140.4, ptr %27, align 4, !tbaa !12
  %28 = or disjoint i64 %3, 40
  %29 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %28
  %30 = getelementptr inbounds nuw i8, ptr %29, i64 16
  %wide.load.5 = load <4 x float>, ptr %29, align 4, !tbaa !12
  %wide.load140.5 = load <4 x float>, ptr %30, align 4, !tbaa !12
  %31 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %28
  %32 = getelementptr inbounds nuw i8, ptr %31, i64 16
  store <4 x float> %wide.load.5, ptr %31, align 4, !tbaa !12
  store <4 x float> %wide.load140.5, ptr %32, align 4, !tbaa !12
  %33 = or disjoint i64 %3, 48
  %34 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %33
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 16
  %wide.load.6 = load <4 x float>, ptr %34, align 4, !tbaa !12
  %wide.load140.6 = load <4 x float>, ptr %35, align 4, !tbaa !12
  %36 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %33
  %37 = getelementptr inbounds nuw i8, ptr %36, i64 16
  store <4 x float> %wide.load.6, ptr %36, align 4, !tbaa !12
  store <4 x float> %wide.load140.6, ptr %37, align 4, !tbaa !12
  %38 = or disjoint i64 %3, 56
  %39 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %38
  %40 = getelementptr inbounds nuw i8, ptr %39, i64 16
  %wide.load.7 = load <4 x float>, ptr %39, align 4, !tbaa !12
  %wide.load140.7 = load <4 x float>, ptr %40, align 4, !tbaa !12
  %41 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %38
  %42 = getelementptr inbounds nuw i8, ptr %41, i64 16
  store <4 x float> %wide.load.7, ptr %41, align 4, !tbaa !12
  store <4 x float> %wide.load140.7, ptr %42, align 4, !tbaa !12
  %43 = or disjoint i64 %3, 64
  %44 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %43
  %45 = getelementptr inbounds nuw i8, ptr %44, i64 16
  %wide.load.8 = load <4 x float>, ptr %44, align 4, !tbaa !12
  %wide.load140.8 = load <4 x float>, ptr %45, align 4, !tbaa !12
  %46 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %43
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 16
  store <4 x float> %wide.load.8, ptr %46, align 4, !tbaa !12
  store <4 x float> %wide.load140.8, ptr %47, align 4, !tbaa !12
  %48 = or disjoint i64 %3, 72
  %49 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %48
  %50 = getelementptr inbounds nuw i8, ptr %49, i64 16
  %wide.load.9 = load <4 x float>, ptr %49, align 4, !tbaa !12
  %wide.load140.9 = load <4 x float>, ptr %50, align 4, !tbaa !12
  %51 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %48
  %52 = getelementptr inbounds nuw i8, ptr %51, i64 16
  store <4 x float> %wide.load.9, ptr %51, align 4, !tbaa !12
  store <4 x float> %wide.load140.9, ptr %52, align 4, !tbaa !12
  %53 = or disjoint i64 %3, 80
  %54 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %53
  %55 = getelementptr inbounds nuw i8, ptr %54, i64 16
  %wide.load.10 = load <4 x float>, ptr %54, align 4, !tbaa !12
  %wide.load140.10 = load <4 x float>, ptr %55, align 4, !tbaa !12
  %56 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %53
  %57 = getelementptr inbounds nuw i8, ptr %56, i64 16
  store <4 x float> %wide.load.10, ptr %56, align 4, !tbaa !12
  store <4 x float> %wide.load140.10, ptr %57, align 4, !tbaa !12
  %58 = or disjoint i64 %3, 88
  %59 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %58
  %60 = getelementptr inbounds nuw i8, ptr %59, i64 16
  %wide.load.11 = load <4 x float>, ptr %59, align 4, !tbaa !12
  %wide.load140.11 = load <4 x float>, ptr %60, align 4, !tbaa !12
  %61 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %58
  %62 = getelementptr inbounds nuw i8, ptr %61, i64 16
  store <4 x float> %wide.load.11, ptr %61, align 4, !tbaa !12
  store <4 x float> %wide.load140.11, ptr %62, align 4, !tbaa !12
  %63 = or disjoint i64 %3, 96
  %64 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %63
  %65 = getelementptr inbounds nuw i8, ptr %64, i64 16
  %wide.load.12 = load <4 x float>, ptr %64, align 4, !tbaa !12
  %wide.load140.12 = load <4 x float>, ptr %65, align 4, !tbaa !12
  %66 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %63
  %67 = getelementptr inbounds nuw i8, ptr %66, i64 16
  store <4 x float> %wide.load.12, ptr %66, align 4, !tbaa !12
  store <4 x float> %wide.load140.12, ptr %67, align 4, !tbaa !12
  %68 = or disjoint i64 %3, 104
  %69 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %68
  %70 = getelementptr inbounds nuw i8, ptr %69, i64 16
  %wide.load.13 = load <4 x float>, ptr %69, align 4, !tbaa !12
  %wide.load140.13 = load <4 x float>, ptr %70, align 4, !tbaa !12
  %71 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %68
  %72 = getelementptr inbounds nuw i8, ptr %71, i64 16
  store <4 x float> %wide.load.13, ptr %71, align 4, !tbaa !12
  store <4 x float> %wide.load140.13, ptr %72, align 4, !tbaa !12
  %73 = or disjoint i64 %3, 112
  %74 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %73
  %75 = getelementptr inbounds nuw i8, ptr %74, i64 16
  %wide.load.14 = load <4 x float>, ptr %74, align 4, !tbaa !12
  %wide.load140.14 = load <4 x float>, ptr %75, align 4, !tbaa !12
  %76 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %73
  %77 = getelementptr inbounds nuw i8, ptr %76, i64 16
  store <4 x float> %wide.load.14, ptr %76, align 4, !tbaa !12
  store <4 x float> %wide.load140.14, ptr %77, align 4, !tbaa !12
  %78 = or disjoint i64 %3, 120
  %79 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %78
  %80 = getelementptr inbounds nuw i8, ptr %79, i64 16
  %wide.load.15 = load <4 x float>, ptr %79, align 4, !tbaa !12
  %wide.load140.15 = load <4 x float>, ptr %80, align 4, !tbaa !12
  %81 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %78
  %82 = getelementptr inbounds nuw i8, ptr %81, i64 16
  store <4 x float> %wide.load.15, ptr %81, align 4, !tbaa !12
  store <4 x float> %wide.load140.15, ptr %82, align 4, !tbaa !12
  br label %for.cond.cleanup44

for.body14:                                       ; preds = %for.body14, %for.body8
  %indvars.iv = phi i64 [ 0, %for.body8 ], [ %indvars.iv.next.1, %for.body14 ]
  %83 = phi float [ 0.000000e+00, %for.body8 ], [ %89, %for.body14 ]
  %gep = getelementptr inbounds nuw [4 x i8], ptr %invariant.gep, i64 %indvars.iv
  %84 = load float, ptr %gep, align 4, !tbaa !12
  %.idx = shl nuw nsw i64 %indvars.iv, 9
  %gep135 = getelementptr inbounds nuw i8, ptr %invariant.gep134, i64 %.idx
  %85 = load float, ptr %gep135, align 4, !tbaa !12
  %86 = tail call float @llvm.fmuladd.f32(float %84, float %85, float %83)
  store float %86, ptr %gep137, align 4, !tbaa !12
  %indvars.iv.next = or disjoint i64 %indvars.iv, 1
  %gep.1 = getelementptr inbounds nuw [4 x i8], ptr %invariant.gep, i64 %indvars.iv.next
  %87 = load float, ptr %gep.1, align 4, !tbaa !12
  %.idx.1 = shl nuw nsw i64 %indvars.iv.next, 9
  %gep135.1 = getelementptr inbounds nuw i8, ptr %invariant.gep134, i64 %.idx.1
  %88 = load float, ptr %gep135.1, align 4, !tbaa !12
  %89 = tail call float @llvm.fmuladd.f32(float %87, float %88, float %86)
  store float %89, ptr %gep137, align 4, !tbaa !12
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, 128
  br i1 %exitcond.not.1, label %for.cond.cleanup13, label %for.body14, !llvm.loop !15

for.cond.cleanup44:                               ; preds = %for.body45, %vector.body
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond127.not = icmp eq i64 %indvars.iv.next121, 128
  br i1 %exitcond127.not, label %for.cond.cleanup3, label %for.cond5.preheader, !llvm.loop !16

for.body45:                                       ; preds = %vector.memcheck, %for.body45
  %indvars.iv115 = phi i64 [ %indvars.iv.next116.3, %for.body45 ], [ 0, %vector.memcheck ]
  %90 = add nuw nsw i64 %indvars.iv115, %3
  %arrayidx51 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %90
  %91 = load float, ptr %arrayidx51, align 4, !tbaa !12
  %arrayidx57 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %90
  store float %91, ptr %arrayidx57, align 4, !tbaa !12
  %indvars.iv.next116 = or disjoint i64 %indvars.iv115, 1
  %92 = add nuw nsw i64 %indvars.iv.next116, %3
  %arrayidx51.1 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %92
  %93 = load float, ptr %arrayidx51.1, align 4, !tbaa !12
  %arrayidx57.1 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %92
  store float %93, ptr %arrayidx57.1, align 4, !tbaa !12
  %indvars.iv.next116.1 = or disjoint i64 %indvars.iv115, 2
  %94 = add nuw nsw i64 %indvars.iv.next116.1, %3
  %arrayidx51.2 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %94
  %95 = load float, ptr %arrayidx51.2, align 4, !tbaa !12
  %arrayidx57.2 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %94
  store float %95, ptr %arrayidx57.2, align 4, !tbaa !12
  %indvars.iv.next116.2 = or disjoint i64 %indvars.iv115, 3
  %96 = add nuw nsw i64 %indvars.iv.next116.2, %3
  %arrayidx51.3 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %96
  %97 = load float, ptr %arrayidx51.3, align 4, !tbaa !12
  %arrayidx57.3 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %96
  store float %97, ptr %arrayidx57.3, align 4, !tbaa !12
  %indvars.iv.next116.3 = add nuw nsw i64 %indvars.iv115, 4
  %exitcond119.not.3 = icmp eq i64 %indvars.iv.next116.3, 128
  br i1 %exitcond119.not.3, label %for.cond.cleanup44, label %for.body45, !llvm.loop !17
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable
define dso_local void @_Z10init_arrayPfS_(ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %C4) local_unnamed_addr #4 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.cond.cleanup3
  %indvars.iv71 = phi i64 [ 0, %entry ], [ %indvars.iv.next72, %for.cond.cleanup3 ]
  %0 = trunc nuw nsw i64 %indvars.iv71 to i32
  %conv = uitofp nneg i32 %0 to float
  %arrayidx.idx = shl nuw nsw i64 %indvars.iv71, 16
  %invariant.gep88 = getelementptr inbounds nuw i8, ptr %A, i64 %arrayidx.idx
  %broadcast.splatinsert90 = insertelement <4 x float> poison, float %conv, i64 0
  %broadcast.splat91 = shufflevector <4 x float> %broadcast.splatinsert90, <4 x float> poison, <4 x i32> zeroinitializer
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond1.preheader, %for.cond5.preheader
  %indvars.iv65 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next66, %for.cond5.preheader ]
  %1 = trunc nuw nsw i64 %indvars.iv65 to i32
  %conv9 = uitofp nneg i32 %1 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv9, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %.idx = shl nuw nsw i64 %indvars.iv65, 9
  %gep = getelementptr inbounds nuw i8, ptr %invariant.gep88, i64 %.idx
  %2 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>)
  %3 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>)
  %4 = fmul nnan <4 x float> %2, splat (float 7.812500e-03)
  %5 = fmul nnan <4 x float> %3, splat (float 7.812500e-03)
  %6 = getelementptr inbounds nuw i8, ptr %gep, i64 16
  store <4 x float> %4, ptr %gep, align 4, !tbaa !12
  store <4 x float> %5, ptr %6, align 4, !tbaa !12
  %7 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>)
  %8 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>)
  %9 = fmul nnan <4 x float> %7, splat (float 7.812500e-03)
  %10 = fmul nnan <4 x float> %8, splat (float 7.812500e-03)
  %11 = getelementptr inbounds nuw i8, ptr %gep, i64 32
  %12 = getelementptr inbounds nuw i8, ptr %gep, i64 48
  store <4 x float> %9, ptr %11, align 4, !tbaa !12
  store <4 x float> %10, ptr %12, align 4, !tbaa !12
  %13 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>)
  %14 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>)
  %15 = fmul nnan <4 x float> %13, splat (float 7.812500e-03)
  %16 = fmul nnan <4 x float> %14, splat (float 7.812500e-03)
  %17 = getelementptr inbounds nuw i8, ptr %gep, i64 64
  %18 = getelementptr inbounds nuw i8, ptr %gep, i64 80
  store <4 x float> %15, ptr %17, align 4, !tbaa !12
  store <4 x float> %16, ptr %18, align 4, !tbaa !12
  %19 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>)
  %20 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>)
  %21 = fmul nnan <4 x float> %19, splat (float 7.812500e-03)
  %22 = fmul nnan <4 x float> %20, splat (float 7.812500e-03)
  %23 = getelementptr inbounds nuw i8, ptr %gep, i64 96
  %24 = getelementptr inbounds nuw i8, ptr %gep, i64 112
  store <4 x float> %21, ptr %23, align 4, !tbaa !12
  store <4 x float> %22, ptr %24, align 4, !tbaa !12
  %25 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 3.200000e+01, float 3.300000e+01, float 3.400000e+01, float 3.500000e+01>)
  %26 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 3.600000e+01, float 3.700000e+01, float 3.800000e+01, float 3.900000e+01>)
  %27 = fmul nnan <4 x float> %25, splat (float 7.812500e-03)
  %28 = fmul nnan <4 x float> %26, splat (float 7.812500e-03)
  %29 = getelementptr inbounds nuw i8, ptr %gep, i64 128
  %30 = getelementptr inbounds nuw i8, ptr %gep, i64 144
  store <4 x float> %27, ptr %29, align 4, !tbaa !12
  store <4 x float> %28, ptr %30, align 4, !tbaa !12
  %31 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 4.000000e+01, float 4.100000e+01, float 4.200000e+01, float 4.300000e+01>)
  %32 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 4.400000e+01, float 4.500000e+01, float 4.600000e+01, float 4.700000e+01>)
  %33 = fmul nnan <4 x float> %31, splat (float 7.812500e-03)
  %34 = fmul nnan <4 x float> %32, splat (float 7.812500e-03)
  %35 = getelementptr inbounds nuw i8, ptr %gep, i64 160
  %36 = getelementptr inbounds nuw i8, ptr %gep, i64 176
  store <4 x float> %33, ptr %35, align 4, !tbaa !12
  store <4 x float> %34, ptr %36, align 4, !tbaa !12
  %37 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 4.800000e+01, float 4.900000e+01, float 5.000000e+01, float 5.100000e+01>)
  %38 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 5.200000e+01, float 5.300000e+01, float 5.400000e+01, float 5.500000e+01>)
  %39 = fmul nnan <4 x float> %37, splat (float 7.812500e-03)
  %40 = fmul nnan <4 x float> %38, splat (float 7.812500e-03)
  %41 = getelementptr inbounds nuw i8, ptr %gep, i64 192
  %42 = getelementptr inbounds nuw i8, ptr %gep, i64 208
  store <4 x float> %39, ptr %41, align 4, !tbaa !12
  store <4 x float> %40, ptr %42, align 4, !tbaa !12
  %43 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 5.600000e+01, float 5.700000e+01, float 5.800000e+01, float 5.900000e+01>)
  %44 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 6.000000e+01, float 6.100000e+01, float 6.200000e+01, float 6.300000e+01>)
  %45 = fmul nnan <4 x float> %43, splat (float 7.812500e-03)
  %46 = fmul nnan <4 x float> %44, splat (float 7.812500e-03)
  %47 = getelementptr inbounds nuw i8, ptr %gep, i64 224
  %48 = getelementptr inbounds nuw i8, ptr %gep, i64 240
  store <4 x float> %45, ptr %47, align 4, !tbaa !12
  store <4 x float> %46, ptr %48, align 4, !tbaa !12
  %49 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 6.400000e+01, float 6.500000e+01, float 6.600000e+01, float 6.700000e+01>)
  %50 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 6.800000e+01, float 6.900000e+01, float 7.000000e+01, float 7.100000e+01>)
  %51 = fmul nnan <4 x float> %49, splat (float 7.812500e-03)
  %52 = fmul nnan <4 x float> %50, splat (float 7.812500e-03)
  %53 = getelementptr inbounds nuw i8, ptr %gep, i64 256
  %54 = getelementptr inbounds nuw i8, ptr %gep, i64 272
  store <4 x float> %51, ptr %53, align 4, !tbaa !12
  store <4 x float> %52, ptr %54, align 4, !tbaa !12
  %55 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 7.200000e+01, float 7.300000e+01, float 7.400000e+01, float 7.500000e+01>)
  %56 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 7.600000e+01, float 7.700000e+01, float 7.800000e+01, float 7.900000e+01>)
  %57 = fmul nnan <4 x float> %55, splat (float 7.812500e-03)
  %58 = fmul nnan <4 x float> %56, splat (float 7.812500e-03)
  %59 = getelementptr inbounds nuw i8, ptr %gep, i64 288
  %60 = getelementptr inbounds nuw i8, ptr %gep, i64 304
  store <4 x float> %57, ptr %59, align 4, !tbaa !12
  store <4 x float> %58, ptr %60, align 4, !tbaa !12
  %61 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 8.000000e+01, float 8.100000e+01, float 8.200000e+01, float 8.300000e+01>)
  %62 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 8.400000e+01, float 8.500000e+01, float 8.600000e+01, float 8.700000e+01>)
  %63 = fmul nnan <4 x float> %61, splat (float 7.812500e-03)
  %64 = fmul nnan <4 x float> %62, splat (float 7.812500e-03)
  %65 = getelementptr inbounds nuw i8, ptr %gep, i64 320
  %66 = getelementptr inbounds nuw i8, ptr %gep, i64 336
  store <4 x float> %63, ptr %65, align 4, !tbaa !12
  store <4 x float> %64, ptr %66, align 4, !tbaa !12
  %67 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 8.800000e+01, float 8.900000e+01, float 9.000000e+01, float 9.100000e+01>)
  %68 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 9.200000e+01, float 9.300000e+01, float 9.400000e+01, float 9.500000e+01>)
  %69 = fmul nnan <4 x float> %67, splat (float 7.812500e-03)
  %70 = fmul nnan <4 x float> %68, splat (float 7.812500e-03)
  %71 = getelementptr inbounds nuw i8, ptr %gep, i64 352
  %72 = getelementptr inbounds nuw i8, ptr %gep, i64 368
  store <4 x float> %69, ptr %71, align 4, !tbaa !12
  store <4 x float> %70, ptr %72, align 4, !tbaa !12
  %73 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 9.600000e+01, float 9.700000e+01, float 9.800000e+01, float 9.900000e+01>)
  %74 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 1.000000e+02, float 1.010000e+02, float 1.020000e+02, float 1.030000e+02>)
  %75 = fmul nnan <4 x float> %73, splat (float 7.812500e-03)
  %76 = fmul nnan <4 x float> %74, splat (float 7.812500e-03)
  %77 = getelementptr inbounds nuw i8, ptr %gep, i64 384
  %78 = getelementptr inbounds nuw i8, ptr %gep, i64 400
  store <4 x float> %75, ptr %77, align 4, !tbaa !12
  store <4 x float> %76, ptr %78, align 4, !tbaa !12
  %79 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 1.040000e+02, float 1.050000e+02, float 1.060000e+02, float 1.070000e+02>)
  %80 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 1.080000e+02, float 1.090000e+02, float 1.100000e+02, float 1.110000e+02>)
  %81 = fmul nnan <4 x float> %79, splat (float 7.812500e-03)
  %82 = fmul nnan <4 x float> %80, splat (float 7.812500e-03)
  %83 = getelementptr inbounds nuw i8, ptr %gep, i64 416
  %84 = getelementptr inbounds nuw i8, ptr %gep, i64 432
  store <4 x float> %81, ptr %83, align 4, !tbaa !12
  store <4 x float> %82, ptr %84, align 4, !tbaa !12
  %85 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 1.120000e+02, float 1.130000e+02, float 1.140000e+02, float 1.150000e+02>)
  %86 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 1.160000e+02, float 1.170000e+02, float 1.180000e+02, float 1.190000e+02>)
  %87 = fmul nnan <4 x float> %85, splat (float 7.812500e-03)
  %88 = fmul nnan <4 x float> %86, splat (float 7.812500e-03)
  %89 = getelementptr inbounds nuw i8, ptr %gep, i64 448
  %90 = getelementptr inbounds nuw i8, ptr %gep, i64 464
  store <4 x float> %87, ptr %89, align 4, !tbaa !12
  store <4 x float> %88, ptr %90, align 4, !tbaa !12
  %91 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 1.200000e+02, float 1.210000e+02, float 1.220000e+02, float 1.230000e+02>)
  %92 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat91, <4 x float> %broadcast.splat, <4 x float> <float 1.240000e+02, float 1.250000e+02, float 1.260000e+02, float 1.270000e+02>)
  %93 = fmul nnan <4 x float> %91, splat (float 7.812500e-03)
  %94 = fmul nnan <4 x float> %92, splat (float 7.812500e-03)
  %95 = getelementptr inbounds nuw i8, ptr %gep, i64 480
  %96 = getelementptr inbounds nuw i8, ptr %gep, i64 496
  store <4 x float> %93, ptr %95, align 4, !tbaa !12
  store <4 x float> %94, ptr %96, align 4, !tbaa !12
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond70.not = icmp eq i64 %indvars.iv.next66, 128
  br i1 %exitcond70.not, label %for.cond.cleanup3, label %for.cond5.preheader, !llvm.loop !19

for.cond.cleanup3:                                ; preds = %for.cond5.preheader
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond75.not = icmp eq i64 %indvars.iv.next72, 128
  br i1 %exitcond75.not, label %for.cond25.preheader, label %for.cond1.preheader, !llvm.loop !20

for.cond25.preheader:                             ; preds = %for.cond.cleanup3, %for.cond25.preheader
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %for.cond25.preheader ], [ 0, %for.cond.cleanup3 ]
  %97 = trunc nuw nsw i64 %indvars.iv81 to i32
  %conv29 = uitofp nneg i32 %97 to float
  %broadcast.splatinsert93 = insertelement <4 x float> poison, float %conv29, i64 0
  %broadcast.splat94 = shufflevector <4 x float> %broadcast.splatinsert93, <4 x float> poison, <4 x i32> zeroinitializer
  %arrayidx36.idx = shl nuw nsw i64 %indvars.iv81, 9
  %invariant.gep = getelementptr inbounds nuw i8, ptr %C4, i64 %arrayidx36.idx
  %98 = fmul nnan <4 x float> %broadcast.splat94, <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>
  %99 = fmul nnan <4 x float> %broadcast.splat94, <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>
  %100 = fmul nnan <4 x float> %98, splat (float 7.812500e-03)
  %101 = fmul nnan <4 x float> %99, splat (float 7.812500e-03)
  %102 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 16
  store <4 x float> %100, ptr %invariant.gep, align 4, !tbaa !12
  store <4 x float> %101, ptr %102, align 4, !tbaa !12
  %103 = fmul nnan <4 x float> %broadcast.splat94, <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>
  %104 = fmul nnan <4 x float> %broadcast.splat94, <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>
  %105 = fmul nnan <4 x float> %103, splat (float 7.812500e-03)
  %106 = fmul nnan <4 x float> %104, splat (float 7.812500e-03)
  %107 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 32
  %108 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 48
  store <4 x float> %105, ptr %107, align 4, !tbaa !12
  store <4 x float> %106, ptr %108, align 4, !tbaa !12
  %109 = fmul nnan <4 x float> %broadcast.splat94, <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>
  %110 = fmul nnan <4 x float> %broadcast.splat94, <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>
  %111 = fmul nnan <4 x float> %109, splat (float 7.812500e-03)
  %112 = fmul nnan <4 x float> %110, splat (float 7.812500e-03)
  %113 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 64
  %114 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 80
  store <4 x float> %111, ptr %113, align 4, !tbaa !12
  store <4 x float> %112, ptr %114, align 4, !tbaa !12
  %115 = fmul nnan <4 x float> %broadcast.splat94, <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>
  %116 = fmul nnan <4 x float> %broadcast.splat94, <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>
  %117 = fmul nnan <4 x float> %115, splat (float 7.812500e-03)
  %118 = fmul nnan <4 x float> %116, splat (float 7.812500e-03)
  %119 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 96
  %120 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 112
  store <4 x float> %117, ptr %119, align 4, !tbaa !12
  store <4 x float> %118, ptr %120, align 4, !tbaa !12
  %121 = fmul nnan <4 x float> %broadcast.splat94, <float 3.200000e+01, float 3.300000e+01, float 3.400000e+01, float 3.500000e+01>
  %122 = fmul nnan <4 x float> %broadcast.splat94, <float 3.600000e+01, float 3.700000e+01, float 3.800000e+01, float 3.900000e+01>
  %123 = fmul nnan <4 x float> %121, splat (float 7.812500e-03)
  %124 = fmul nnan <4 x float> %122, splat (float 7.812500e-03)
  %125 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 128
  %126 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 144
  store <4 x float> %123, ptr %125, align 4, !tbaa !12
  store <4 x float> %124, ptr %126, align 4, !tbaa !12
  %127 = fmul nnan <4 x float> %broadcast.splat94, <float 4.000000e+01, float 4.100000e+01, float 4.200000e+01, float 4.300000e+01>
  %128 = fmul nnan <4 x float> %broadcast.splat94, <float 4.400000e+01, float 4.500000e+01, float 4.600000e+01, float 4.700000e+01>
  %129 = fmul nnan <4 x float> %127, splat (float 7.812500e-03)
  %130 = fmul nnan <4 x float> %128, splat (float 7.812500e-03)
  %131 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 160
  %132 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 176
  store <4 x float> %129, ptr %131, align 4, !tbaa !12
  store <4 x float> %130, ptr %132, align 4, !tbaa !12
  %133 = fmul nnan <4 x float> %broadcast.splat94, <float 4.800000e+01, float 4.900000e+01, float 5.000000e+01, float 5.100000e+01>
  %134 = fmul nnan <4 x float> %broadcast.splat94, <float 5.200000e+01, float 5.300000e+01, float 5.400000e+01, float 5.500000e+01>
  %135 = fmul nnan <4 x float> %133, splat (float 7.812500e-03)
  %136 = fmul nnan <4 x float> %134, splat (float 7.812500e-03)
  %137 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 192
  %138 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 208
  store <4 x float> %135, ptr %137, align 4, !tbaa !12
  store <4 x float> %136, ptr %138, align 4, !tbaa !12
  %139 = fmul nnan <4 x float> %broadcast.splat94, <float 5.600000e+01, float 5.700000e+01, float 5.800000e+01, float 5.900000e+01>
  %140 = fmul nnan <4 x float> %broadcast.splat94, <float 6.000000e+01, float 6.100000e+01, float 6.200000e+01, float 6.300000e+01>
  %141 = fmul nnan <4 x float> %139, splat (float 7.812500e-03)
  %142 = fmul nnan <4 x float> %140, splat (float 7.812500e-03)
  %143 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 224
  %144 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 240
  store <4 x float> %141, ptr %143, align 4, !tbaa !12
  store <4 x float> %142, ptr %144, align 4, !tbaa !12
  %145 = fmul nnan <4 x float> %broadcast.splat94, <float 6.400000e+01, float 6.500000e+01, float 6.600000e+01, float 6.700000e+01>
  %146 = fmul nnan <4 x float> %broadcast.splat94, <float 6.800000e+01, float 6.900000e+01, float 7.000000e+01, float 7.100000e+01>
  %147 = fmul nnan <4 x float> %145, splat (float 7.812500e-03)
  %148 = fmul nnan <4 x float> %146, splat (float 7.812500e-03)
  %149 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 256
  %150 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 272
  store <4 x float> %147, ptr %149, align 4, !tbaa !12
  store <4 x float> %148, ptr %150, align 4, !tbaa !12
  %151 = fmul nnan <4 x float> %broadcast.splat94, <float 7.200000e+01, float 7.300000e+01, float 7.400000e+01, float 7.500000e+01>
  %152 = fmul nnan <4 x float> %broadcast.splat94, <float 7.600000e+01, float 7.700000e+01, float 7.800000e+01, float 7.900000e+01>
  %153 = fmul nnan <4 x float> %151, splat (float 7.812500e-03)
  %154 = fmul nnan <4 x float> %152, splat (float 7.812500e-03)
  %155 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 288
  %156 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 304
  store <4 x float> %153, ptr %155, align 4, !tbaa !12
  store <4 x float> %154, ptr %156, align 4, !tbaa !12
  %157 = fmul nnan <4 x float> %broadcast.splat94, <float 8.000000e+01, float 8.100000e+01, float 8.200000e+01, float 8.300000e+01>
  %158 = fmul nnan <4 x float> %broadcast.splat94, <float 8.400000e+01, float 8.500000e+01, float 8.600000e+01, float 8.700000e+01>
  %159 = fmul nnan <4 x float> %157, splat (float 7.812500e-03)
  %160 = fmul nnan <4 x float> %158, splat (float 7.812500e-03)
  %161 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 320
  %162 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 336
  store <4 x float> %159, ptr %161, align 4, !tbaa !12
  store <4 x float> %160, ptr %162, align 4, !tbaa !12
  %163 = fmul nnan <4 x float> %broadcast.splat94, <float 8.800000e+01, float 8.900000e+01, float 9.000000e+01, float 9.100000e+01>
  %164 = fmul nnan <4 x float> %broadcast.splat94, <float 9.200000e+01, float 9.300000e+01, float 9.400000e+01, float 9.500000e+01>
  %165 = fmul nnan <4 x float> %163, splat (float 7.812500e-03)
  %166 = fmul nnan <4 x float> %164, splat (float 7.812500e-03)
  %167 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 352
  %168 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 368
  store <4 x float> %165, ptr %167, align 4, !tbaa !12
  store <4 x float> %166, ptr %168, align 4, !tbaa !12
  %169 = fmul nnan <4 x float> %broadcast.splat94, <float 9.600000e+01, float 9.700000e+01, float 9.800000e+01, float 9.900000e+01>
  %170 = fmul nnan <4 x float> %broadcast.splat94, <float 1.000000e+02, float 1.010000e+02, float 1.020000e+02, float 1.030000e+02>
  %171 = fmul nnan <4 x float> %169, splat (float 7.812500e-03)
  %172 = fmul nnan <4 x float> %170, splat (float 7.812500e-03)
  %173 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 384
  %174 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 400
  store <4 x float> %171, ptr %173, align 4, !tbaa !12
  store <4 x float> %172, ptr %174, align 4, !tbaa !12
  %175 = fmul nnan <4 x float> %broadcast.splat94, <float 1.040000e+02, float 1.050000e+02, float 1.060000e+02, float 1.070000e+02>
  %176 = fmul nnan <4 x float> %broadcast.splat94, <float 1.080000e+02, float 1.090000e+02, float 1.100000e+02, float 1.110000e+02>
  %177 = fmul nnan <4 x float> %175, splat (float 7.812500e-03)
  %178 = fmul nnan <4 x float> %176, splat (float 7.812500e-03)
  %179 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 416
  %180 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 432
  store <4 x float> %177, ptr %179, align 4, !tbaa !12
  store <4 x float> %178, ptr %180, align 4, !tbaa !12
  %181 = fmul nnan <4 x float> %broadcast.splat94, <float 1.120000e+02, float 1.130000e+02, float 1.140000e+02, float 1.150000e+02>
  %182 = fmul nnan <4 x float> %broadcast.splat94, <float 1.160000e+02, float 1.170000e+02, float 1.180000e+02, float 1.190000e+02>
  %183 = fmul nnan <4 x float> %181, splat (float 7.812500e-03)
  %184 = fmul nnan <4 x float> %182, splat (float 7.812500e-03)
  %185 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 448
  %186 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 464
  store <4 x float> %183, ptr %185, align 4, !tbaa !12
  store <4 x float> %184, ptr %186, align 4, !tbaa !12
  %187 = fmul nnan <4 x float> %broadcast.splat94, <float 1.200000e+02, float 1.210000e+02, float 1.220000e+02, float 1.230000e+02>
  %188 = fmul nnan <4 x float> %broadcast.splat94, <float 1.240000e+02, float 1.250000e+02, float 1.260000e+02, float 1.270000e+02>
  %189 = fmul nnan <4 x float> %187, splat (float 7.812500e-03)
  %190 = fmul nnan <4 x float> %188, splat (float 7.812500e-03)
  %191 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 480
  %192 = getelementptr inbounds nuw i8, ptr %invariant.gep, i64 496
  store <4 x float> %189, ptr %191, align 4, !tbaa !12
  store <4 x float> %190, ptr %192, align 4, !tbaa !12
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond85.not = icmp eq i64 %indvars.iv.next82, 128
  br i1 %exitcond85.not, label %for.cond.cleanup22, label %for.cond25.preheader, !llvm.loop !21

for.cond.cleanup22:                               ; preds = %for.cond25.preheader
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsPfS_(ptr nofree noundef readonly captures(none) %sum, ptr nofree noundef readonly captures(none) %sum_outputFromGpu) local_unnamed_addr #5 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.cond.cleanup3
  %indvars.iv52 = phi i64 [ 0, %entry ], [ %indvars.iv.next53, %for.cond.cleanup3 ]
  %fail.042 = phi i32 [ 0, %entry ], [ %39, %for.cond.cleanup3 ]
  %0 = shl nuw nsw i64 %indvars.iv52, 14
  br label %for.cond5.preheader

for.cond.cleanup:                                 ; preds = %for.cond.cleanup3
  %call27 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %39) #14
  ret void

for.cond5.preheader:                              ; preds = %for.cond1.preheader, %for.cond.cleanup7
  %indvars.iv46 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next47, %for.cond.cleanup7 ]
  %fail.140 = phi i32 [ %fail.042, %for.cond1.preheader ], [ %39, %for.cond.cleanup7 ]
  %1 = shl nuw nsw i64 %indvars.iv46, 7
  %2 = add nuw nsw i64 %1, %0
  %3 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.140, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond5.preheader
  %index = phi i64 [ 0, %for.cond5.preheader ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %3, %for.cond5.preheader ], [ %37, %vector.body ]
  %4 = add nuw nsw i64 %index, %2
  %5 = getelementptr inbounds nuw [4 x i8], ptr %sum, i64 %4
  %wide.load = load <4 x float>, ptr %5, align 4, !tbaa !12
  %6 = fpext <4 x float> %wide.load to <4 x double>
  %7 = getelementptr inbounds nuw [4 x i8], ptr %sum_outputFromGpu, i64 %4
  %wide.load57 = load <4 x float>, ptr %7, align 4, !tbaa !12
  %8 = fpext <4 x float> %wide.load57 to <4 x double>
  %9 = fcmp olt <4 x double> %6, splat (double f0xB690000000000000)
  %10 = fneg <4 x float> %wide.load
  %11 = select <4 x i1> %9, <4 x float> %10, <4 x float> %wide.load
  %12 = fpext <4 x float> %11 to <4 x double>
  %13 = fcmp uge <4 x double> %12, splat (double 1.000000e-02)
  %14 = fcmp olt <4 x double> %8, splat (double f0xB690000000000000)
  %15 = fneg <4 x float> %wide.load57
  %16 = select <4 x i1> %14, <4 x float> %15, <4 x float> %wide.load57
  %17 = fpext <4 x float> %16 to <4 x double>
  %18 = fcmp uge <4 x double> %17, splat (double 1.000000e-02)
  %19 = select <4 x i1> %13, <4 x i1> splat (i1 true), <4 x i1> %18
  %20 = fsub <4 x double> %6, %8
  %21 = fptrunc <4 x double> %20 to <4 x float>
  %22 = fcmp olt <4 x double> %20, splat (double f0xB690000000000000)
  %23 = fneg <4 x float> %21
  %24 = select <4 x i1> %22, <4 x float> %23, <4 x float> %21
  %25 = fadd <4 x double> %6, splat (double f0x3E45798EE0000000)
  %26 = fptrunc <4 x double> %25 to <4 x float>
  %27 = fcmp olt <4 x double> %25, splat (double f0xB690000000000000)
  %28 = fneg <4 x float> %26
  %29 = select <4 x i1> %27, <4 x float> %28, <4 x float> %26
  %30 = fdiv <4 x float> %24, %29
  %31 = fcmp olt <4 x float> %30, zeroinitializer
  %32 = fneg <4 x float> %30
  %33 = select <4 x i1> %31, <4 x float> %32, <4 x float> %30
  %34 = fmul <4 x float> %33, splat (float 1.000000e+02)
  %35 = fpext <4 x float> %34 to <4 x double>
  %36 = fcmp ogt <4 x double> %35, splat (double 5.000000e-02)
  %narrow = select <4 x i1> %19, <4 x i1> %36, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %37 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %38 = icmp eq i64 %index.next, 128
  br i1 %38, label %for.cond.cleanup7, label %vector.body, !llvm.loop !22

for.cond.cleanup3:                                ; preds = %for.cond.cleanup7
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond56.not = icmp eq i64 %indvars.iv.next53, 128
  br i1 %exitcond56.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !24

for.cond.cleanup7:                                ; preds = %vector.body
  %39 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %37)
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond51.not = icmp eq i64 %indvars.iv.next47, 128
  br i1 %exitcond51.not, label %for.cond.cleanup3, label %for.cond5.preheader, !llvm.loop !25
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #6

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #7 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp) #15
  %call = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp, i32 noundef 0) #14
  %call1 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp) #14
  %call2 = call i32 @cudaSetDevice(i32 noundef 0) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp) #15
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #8

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z30__device_stub__doitgen_kernel1PfS_S_i(ptr noundef %sum, ptr noundef %A, ptr noundef %C4, i32 noundef %r) #9 {
entry:
  %sum.addr = alloca ptr, align 8
  %A.addr = alloca ptr, align 8
  %C4.addr = alloca ptr, align 8
  %r.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store ptr %sum, ptr %sum.addr, align 8, !tbaa !26
  store ptr %A, ptr %A.addr, align 8, !tbaa !26
  store ptr %C4, ptr %C4.addr, align 8, !tbaa !26
  store i32 %r, ptr %r.addr, align 4, !tbaa !29
  %kernel_args1 = alloca [4 x ptr], align 16
  store ptr %sum.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %A.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %C4.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %r.addr, ptr %2, align 8
  %3 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %4 = load i64, ptr %shmem_size, align 8
  %5 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z30__device_stub__doitgen_kernel1PfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z30__device_stub__doitgen_kernel2PfS_S_i(ptr noundef %sum, ptr noundef %A, ptr noundef %C4, i32 noundef %r) #9 {
entry:
  %sum.addr = alloca ptr, align 8
  %A.addr = alloca ptr, align 8
  %C4.addr = alloca ptr, align 8
  %r.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store ptr %sum, ptr %sum.addr, align 8, !tbaa !26
  store ptr %A, ptr %A.addr, align 8, !tbaa !26
  store ptr %C4, ptr %C4.addr, align 8, !tbaa !26
  store i32 %r, ptr %r.addr, align 4, !tbaa !29
  %kernel_args1 = alloca [4 x ptr], align 16
  store ptr %sum.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %A.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %C4.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %r.addr, ptr %2, align 8
  %3 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %4 = load i64, ptr %shmem_size, align 8
  %5 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z30__device_stub__doitgen_kernel2PfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z11doitgenCudaPfS_S_S_(ptr noundef %A, ptr noundef %C4, ptr noundef %sum, ptr noundef %sum_outputFromGpu) local_unnamed_addr #7 {
entry:
  %sum.addr.i37 = alloca ptr, align 8
  %A.addr.i38 = alloca ptr, align 8
  %C4.addr.i39 = alloca ptr, align 8
  %r.addr.i40 = alloca i32, align 4
  %grid_dim.i41 = alloca %struct.dim3, align 8
  %block_dim.i42 = alloca %struct.dim3, align 8
  %shmem_size.i43 = alloca i64, align 8
  %stream.i44 = alloca ptr, align 8
  %kernel_args1.i45 = alloca [4 x ptr], align 16
  %sum.addr.i = alloca ptr, align 8
  %A.addr.i = alloca ptr, align 8
  %C4.addr.i = alloca ptr, align 8
  %r.addr.i = alloca i32, align 4
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [4 x ptr], align 16
  %AGpu = alloca ptr, align 8
  %C4Gpu = alloca ptr, align 8
  %sumGpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %AGpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %C4Gpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %sumGpu) #15
  %call.i = call noundef i32 @cudaMalloc(ptr noundef nonnull %AGpu, i64 noundef 8388608) #14
  %call.i32 = call noundef i32 @cudaMalloc(ptr noundef nonnull %C4Gpu, i64 noundef 65536) #14
  %call.i33 = call noundef i32 @cudaMalloc(ptr noundef nonnull %sumGpu, i64 noundef 8388608) #14
  %0 = load ptr, ptr %AGpu, align 8, !tbaa !26
  %call3 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 8388608, i32 noundef 1) #14
  %1 = load ptr, ptr %C4Gpu, align 8, !tbaa !26
  %call4 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %C4, i64 noundef 65536, i32 noundef 1) #14
  %2 = load ptr, ptr %sumGpu, align 8, !tbaa !26
  %call5 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %sum, i64 noundef 8388608, i32 noundef 1) #14
  %call12 = call noundef double @_Z7rtclockv() #14
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1.i45, i64 8
  %7 = getelementptr inbounds nuw i8, ptr %kernel_args1.i45, i64 16
  %8 = getelementptr inbounds nuw i8, ptr %kernel_args1.i45, i64 24
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i47 = getelementptr inbounds nuw i8, ptr %grid_dim.i41, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i50 = getelementptr inbounds nuw i8, ptr %block_dim.i42, i64 8
  br label %for.body

for.cond.cleanup:                                 ; preds = %kcall.end21
  %call23 = call noundef double @_Z7rtclockv() #14
  %9 = load ptr, ptr @stdout, align 8, !tbaa !30
  %sub = fsub double %call23, %call12
  %call24 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef nonnull @.str.2, double noundef %sub) #16
  %10 = load ptr, ptr %sumGpu, align 8, !tbaa !26
  %call25 = call i32 @cudaMemcpy(ptr noundef %sum_outputFromGpu, ptr noundef %10, i64 noundef 8388608, i32 noundef 2) #14
  %11 = load ptr, ptr %AGpu, align 8, !tbaa !26
  %call26 = call i32 @cudaFree(ptr noundef %11) #14
  %12 = load ptr, ptr %C4Gpu, align 8, !tbaa !26
  %call27 = call i32 @cudaFree(ptr noundef %12) #14
  %13 = load ptr, ptr %sumGpu, align 8, !tbaa !26
  %call28 = call i32 @cudaFree(ptr noundef %13) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %sumGpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %C4Gpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %AGpu) #15
  ret void

for.body:                                         ; preds = %entry, %kcall.end21
  %r.058 = phi i32 [ 0, %entry ], [ %inc, %kcall.end21 ]
  %call14 = call i32 @__cudaPushCallConfiguration(i64 68719476740, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool.not = icmp eq i32 %call14, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %for.body
  %14 = load ptr, ptr %sumGpu, align 8, !tbaa !26
  %15 = load ptr, ptr %AGpu, align 8, !tbaa !26
  %16 = load ptr, ptr %C4Gpu, align 8, !tbaa !26
  call void @llvm.lifetime.start.p0(ptr nonnull %sum.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %C4.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %r.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store ptr %14, ptr %sum.addr.i, align 8, !tbaa !26
  store ptr %15, ptr %A.addr.i, align 8, !tbaa !26
  store ptr %16, ptr %C4.addr.i, align 8, !tbaa !26
  store i32 %r.058, ptr %r.addr.i, align 4, !tbaa !29
  store ptr %sum.addr.i, ptr %kernel_args1.i, align 16
  store ptr %A.addr.i, ptr %3, align 8
  store ptr %C4.addr.i, ptr %4, align 16
  store ptr %r.addr.i, ptr %5, align 8
  %17 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !32
  %18 = load i64, ptr %shmem_size.i, align 8
  %19 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i36 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z30__device_stub__doitgen_kernel1PfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %18, ptr noundef %19), !inline_history !32
  call void @llvm.lifetime.end.p0(ptr nonnull %sum.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %C4.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %r.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %for.body
  %call15 = call i32 @cudaThreadSynchronize() #14
  %call18 = call i32 @__cudaPushCallConfiguration(i64 68719476740, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool19.not = icmp eq i32 %call18, 0
  br i1 %tobool19.not, label %kcall.configok20, label %kcall.end21

kcall.configok20:                                 ; preds = %kcall.end
  %20 = load ptr, ptr %sumGpu, align 8, !tbaa !26
  %21 = load ptr, ptr %AGpu, align 8, !tbaa !26
  %22 = load ptr, ptr %C4Gpu, align 8, !tbaa !26
  call void @llvm.lifetime.start.p0(ptr nonnull %sum.addr.i37)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i38)
  call void @llvm.lifetime.start.p0(ptr nonnull %C4.addr.i39)
  call void @llvm.lifetime.start.p0(ptr nonnull %r.addr.i40)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i41)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i42)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i43)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i44)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i45)
  store ptr %20, ptr %sum.addr.i37, align 8, !tbaa !26
  store ptr %21, ptr %A.addr.i38, align 8, !tbaa !26
  store ptr %22, ptr %C4.addr.i39, align 8, !tbaa !26
  store i32 %r.058, ptr %r.addr.i40, align 4, !tbaa !29
  store ptr %sum.addr.i37, ptr %kernel_args1.i45, align 16
  store ptr %A.addr.i38, ptr %6, align 8
  store ptr %C4.addr.i39, ptr %7, align 16
  store ptr %r.addr.i40, ptr %8, align 8
  %23 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i41, ptr nonnull %block_dim.i42, ptr nonnull %shmem_size.i43, ptr nonnull %stream.i44), !inline_history !33
  %24 = load i64, ptr %shmem_size.i43, align 8
  %25 = load ptr, ptr %stream.i44, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i46 = load i64, ptr %grid_dim.i41, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i48 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i47, align 8
  %block_dim.coerce.sroa.0.0.copyload.i49 = load i64, ptr %block_dim.i42, align 8
  %block_dim.coerce.sroa.2.0.copyload.i51 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i50, align 8
  %call.i52 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z30__device_stub__doitgen_kernel2PfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload.i46, i32 %grid_dim.coerce.sroa.2.0.copyload.i48, i64 %block_dim.coerce.sroa.0.0.copyload.i49, i32 %block_dim.coerce.sroa.2.0.copyload.i51, ptr noundef nonnull %kernel_args1.i45, i64 noundef %24, ptr noundef %25), !inline_history !33
  call void @llvm.lifetime.end.p0(ptr nonnull %sum.addr.i37)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i38)
  call void @llvm.lifetime.end.p0(ptr nonnull %C4.addr.i39)
  call void @llvm.lifetime.end.p0(ptr nonnull %r.addr.i40)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i41)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i42)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i43)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i44)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i45)
  br label %kcall.end21

kcall.end21:                                      ; preds = %kcall.configok20, %kcall.end
  %call22 = call i32 @cudaThreadSynchronize() #14
  %inc = add nuw nsw i32 %r.058, 1
  %exitcond.not = icmp eq i32 %inc, 128
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !34
}

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #8

declare noundef double @_Z7rtclockv() local_unnamed_addr #8

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #8

declare i32 @cudaThreadSynchronize() local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr noundef captures(none), ptr noundef readonly captures(none), ...) local_unnamed_addr #6

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #9 {
entry:
  %call = tail call noalias dereferenceable_or_null(8388608) ptr @malloc(i64 noundef 8388608) #17
  %call1 = tail call noalias dereferenceable_or_null(65536) ptr @malloc(i64 noundef 65536) #17
  %call2 = tail call noalias dereferenceable_or_null(8388608) ptr @malloc(i64 noundef 8388608) #17
  %call3 = tail call noalias dereferenceable_or_null(8388608) ptr @malloc(i64 noundef 8388608) #17
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond.cleanup3.i, %entry
  %indvars.iv71.i = phi i64 [ 0, %entry ], [ %indvars.iv.next72.i, %for.cond.cleanup3.i ]
  %0 = trunc nuw nsw i64 %indvars.iv71.i to i32
  %conv.i = uitofp nneg i32 %0 to float
  %arrayidx.idx.i = shl nuw nsw i64 %indvars.iv71.i, 16
  %invariant.gep88.i = getelementptr inbounds nuw i8, ptr %call, i64 %arrayidx.idx.i
  %broadcast.splatinsert39 = insertelement <4 x float> poison, float %conv.i, i64 0
  %broadcast.splat40 = shufflevector <4 x float> %broadcast.splatinsert39, <4 x float> poison, <4 x i32> zeroinitializer
  br label %for.cond5.preheader.i

for.cond5.preheader.i:                            ; preds = %for.cond5.preheader.i, %for.cond1.preheader.i
  %indvars.iv65.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next66.i, %for.cond5.preheader.i ]
  %1 = trunc nuw nsw i64 %indvars.iv65.i to i32
  %conv9.i = uitofp nneg i32 %1 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv9.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %.idx.i = shl nuw nsw i64 %indvars.iv65.i, 9
  %gep.i = getelementptr inbounds nuw i8, ptr %invariant.gep88.i, i64 %.idx.i
  %2 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>)
  %3 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>)
  %4 = fmul nnan <4 x float> %2, splat (float 7.812500e-03)
  %5 = fmul nnan <4 x float> %3, splat (float 7.812500e-03)
  %6 = getelementptr inbounds nuw i8, ptr %gep.i, i64 16
  store <4 x float> %4, ptr %gep.i, align 4, !tbaa !12
  store <4 x float> %5, ptr %6, align 4, !tbaa !12
  %7 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>)
  %8 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>)
  %9 = fmul nnan <4 x float> %7, splat (float 7.812500e-03)
  %10 = fmul nnan <4 x float> %8, splat (float 7.812500e-03)
  %11 = getelementptr inbounds nuw i8, ptr %gep.i, i64 32
  %12 = getelementptr inbounds nuw i8, ptr %gep.i, i64 48
  store <4 x float> %9, ptr %11, align 4, !tbaa !12
  store <4 x float> %10, ptr %12, align 4, !tbaa !12
  %13 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>)
  %14 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>)
  %15 = fmul nnan <4 x float> %13, splat (float 7.812500e-03)
  %16 = fmul nnan <4 x float> %14, splat (float 7.812500e-03)
  %17 = getelementptr inbounds nuw i8, ptr %gep.i, i64 64
  %18 = getelementptr inbounds nuw i8, ptr %gep.i, i64 80
  store <4 x float> %15, ptr %17, align 4, !tbaa !12
  store <4 x float> %16, ptr %18, align 4, !tbaa !12
  %19 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>)
  %20 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>)
  %21 = fmul nnan <4 x float> %19, splat (float 7.812500e-03)
  %22 = fmul nnan <4 x float> %20, splat (float 7.812500e-03)
  %23 = getelementptr inbounds nuw i8, ptr %gep.i, i64 96
  %24 = getelementptr inbounds nuw i8, ptr %gep.i, i64 112
  store <4 x float> %21, ptr %23, align 4, !tbaa !12
  store <4 x float> %22, ptr %24, align 4, !tbaa !12
  %25 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 3.200000e+01, float 3.300000e+01, float 3.400000e+01, float 3.500000e+01>)
  %26 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 3.600000e+01, float 3.700000e+01, float 3.800000e+01, float 3.900000e+01>)
  %27 = fmul nnan <4 x float> %25, splat (float 7.812500e-03)
  %28 = fmul nnan <4 x float> %26, splat (float 7.812500e-03)
  %29 = getelementptr inbounds nuw i8, ptr %gep.i, i64 128
  %30 = getelementptr inbounds nuw i8, ptr %gep.i, i64 144
  store <4 x float> %27, ptr %29, align 4, !tbaa !12
  store <4 x float> %28, ptr %30, align 4, !tbaa !12
  %31 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 4.000000e+01, float 4.100000e+01, float 4.200000e+01, float 4.300000e+01>)
  %32 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 4.400000e+01, float 4.500000e+01, float 4.600000e+01, float 4.700000e+01>)
  %33 = fmul nnan <4 x float> %31, splat (float 7.812500e-03)
  %34 = fmul nnan <4 x float> %32, splat (float 7.812500e-03)
  %35 = getelementptr inbounds nuw i8, ptr %gep.i, i64 160
  %36 = getelementptr inbounds nuw i8, ptr %gep.i, i64 176
  store <4 x float> %33, ptr %35, align 4, !tbaa !12
  store <4 x float> %34, ptr %36, align 4, !tbaa !12
  %37 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 4.800000e+01, float 4.900000e+01, float 5.000000e+01, float 5.100000e+01>)
  %38 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 5.200000e+01, float 5.300000e+01, float 5.400000e+01, float 5.500000e+01>)
  %39 = fmul nnan <4 x float> %37, splat (float 7.812500e-03)
  %40 = fmul nnan <4 x float> %38, splat (float 7.812500e-03)
  %41 = getelementptr inbounds nuw i8, ptr %gep.i, i64 192
  %42 = getelementptr inbounds nuw i8, ptr %gep.i, i64 208
  store <4 x float> %39, ptr %41, align 4, !tbaa !12
  store <4 x float> %40, ptr %42, align 4, !tbaa !12
  %43 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 5.600000e+01, float 5.700000e+01, float 5.800000e+01, float 5.900000e+01>)
  %44 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 6.000000e+01, float 6.100000e+01, float 6.200000e+01, float 6.300000e+01>)
  %45 = fmul nnan <4 x float> %43, splat (float 7.812500e-03)
  %46 = fmul nnan <4 x float> %44, splat (float 7.812500e-03)
  %47 = getelementptr inbounds nuw i8, ptr %gep.i, i64 224
  %48 = getelementptr inbounds nuw i8, ptr %gep.i, i64 240
  store <4 x float> %45, ptr %47, align 4, !tbaa !12
  store <4 x float> %46, ptr %48, align 4, !tbaa !12
  %49 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 6.400000e+01, float 6.500000e+01, float 6.600000e+01, float 6.700000e+01>)
  %50 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 6.800000e+01, float 6.900000e+01, float 7.000000e+01, float 7.100000e+01>)
  %51 = fmul nnan <4 x float> %49, splat (float 7.812500e-03)
  %52 = fmul nnan <4 x float> %50, splat (float 7.812500e-03)
  %53 = getelementptr inbounds nuw i8, ptr %gep.i, i64 256
  %54 = getelementptr inbounds nuw i8, ptr %gep.i, i64 272
  store <4 x float> %51, ptr %53, align 4, !tbaa !12
  store <4 x float> %52, ptr %54, align 4, !tbaa !12
  %55 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 7.200000e+01, float 7.300000e+01, float 7.400000e+01, float 7.500000e+01>)
  %56 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 7.600000e+01, float 7.700000e+01, float 7.800000e+01, float 7.900000e+01>)
  %57 = fmul nnan <4 x float> %55, splat (float 7.812500e-03)
  %58 = fmul nnan <4 x float> %56, splat (float 7.812500e-03)
  %59 = getelementptr inbounds nuw i8, ptr %gep.i, i64 288
  %60 = getelementptr inbounds nuw i8, ptr %gep.i, i64 304
  store <4 x float> %57, ptr %59, align 4, !tbaa !12
  store <4 x float> %58, ptr %60, align 4, !tbaa !12
  %61 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 8.000000e+01, float 8.100000e+01, float 8.200000e+01, float 8.300000e+01>)
  %62 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 8.400000e+01, float 8.500000e+01, float 8.600000e+01, float 8.700000e+01>)
  %63 = fmul nnan <4 x float> %61, splat (float 7.812500e-03)
  %64 = fmul nnan <4 x float> %62, splat (float 7.812500e-03)
  %65 = getelementptr inbounds nuw i8, ptr %gep.i, i64 320
  %66 = getelementptr inbounds nuw i8, ptr %gep.i, i64 336
  store <4 x float> %63, ptr %65, align 4, !tbaa !12
  store <4 x float> %64, ptr %66, align 4, !tbaa !12
  %67 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 8.800000e+01, float 8.900000e+01, float 9.000000e+01, float 9.100000e+01>)
  %68 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 9.200000e+01, float 9.300000e+01, float 9.400000e+01, float 9.500000e+01>)
  %69 = fmul nnan <4 x float> %67, splat (float 7.812500e-03)
  %70 = fmul nnan <4 x float> %68, splat (float 7.812500e-03)
  %71 = getelementptr inbounds nuw i8, ptr %gep.i, i64 352
  %72 = getelementptr inbounds nuw i8, ptr %gep.i, i64 368
  store <4 x float> %69, ptr %71, align 4, !tbaa !12
  store <4 x float> %70, ptr %72, align 4, !tbaa !12
  %73 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 9.600000e+01, float 9.700000e+01, float 9.800000e+01, float 9.900000e+01>)
  %74 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 1.000000e+02, float 1.010000e+02, float 1.020000e+02, float 1.030000e+02>)
  %75 = fmul nnan <4 x float> %73, splat (float 7.812500e-03)
  %76 = fmul nnan <4 x float> %74, splat (float 7.812500e-03)
  %77 = getelementptr inbounds nuw i8, ptr %gep.i, i64 384
  %78 = getelementptr inbounds nuw i8, ptr %gep.i, i64 400
  store <4 x float> %75, ptr %77, align 4, !tbaa !12
  store <4 x float> %76, ptr %78, align 4, !tbaa !12
  %79 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 1.040000e+02, float 1.050000e+02, float 1.060000e+02, float 1.070000e+02>)
  %80 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 1.080000e+02, float 1.090000e+02, float 1.100000e+02, float 1.110000e+02>)
  %81 = fmul nnan <4 x float> %79, splat (float 7.812500e-03)
  %82 = fmul nnan <4 x float> %80, splat (float 7.812500e-03)
  %83 = getelementptr inbounds nuw i8, ptr %gep.i, i64 416
  %84 = getelementptr inbounds nuw i8, ptr %gep.i, i64 432
  store <4 x float> %81, ptr %83, align 4, !tbaa !12
  store <4 x float> %82, ptr %84, align 4, !tbaa !12
  %85 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 1.120000e+02, float 1.130000e+02, float 1.140000e+02, float 1.150000e+02>)
  %86 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 1.160000e+02, float 1.170000e+02, float 1.180000e+02, float 1.190000e+02>)
  %87 = fmul nnan <4 x float> %85, splat (float 7.812500e-03)
  %88 = fmul nnan <4 x float> %86, splat (float 7.812500e-03)
  %89 = getelementptr inbounds nuw i8, ptr %gep.i, i64 448
  %90 = getelementptr inbounds nuw i8, ptr %gep.i, i64 464
  store <4 x float> %87, ptr %89, align 4, !tbaa !12
  store <4 x float> %88, ptr %90, align 4, !tbaa !12
  %91 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 1.200000e+02, float 1.210000e+02, float 1.220000e+02, float 1.230000e+02>)
  %92 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat40, <4 x float> %broadcast.splat, <4 x float> <float 1.240000e+02, float 1.250000e+02, float 1.260000e+02, float 1.270000e+02>)
  %93 = fmul nnan <4 x float> %91, splat (float 7.812500e-03)
  %94 = fmul nnan <4 x float> %92, splat (float 7.812500e-03)
  %95 = getelementptr inbounds nuw i8, ptr %gep.i, i64 480
  %96 = getelementptr inbounds nuw i8, ptr %gep.i, i64 496
  store <4 x float> %93, ptr %95, align 4, !tbaa !12
  store <4 x float> %94, ptr %96, align 4, !tbaa !12
  %indvars.iv.next66.i = add nuw nsw i64 %indvars.iv65.i, 1
  %exitcond70.not.i = icmp eq i64 %indvars.iv.next66.i, 128
  br i1 %exitcond70.not.i, label %for.cond.cleanup3.i, label %for.cond5.preheader.i, !llvm.loop !19

for.cond.cleanup3.i:                              ; preds = %for.cond5.preheader.i
  %indvars.iv.next72.i = add nuw nsw i64 %indvars.iv71.i, 1
  %exitcond75.not.i = icmp eq i64 %indvars.iv.next72.i, 128
  br i1 %exitcond75.not.i, label %for.cond25.preheader.i, label %for.cond1.preheader.i, !llvm.loop !20

for.cond25.preheader.i:                           ; preds = %for.cond.cleanup3.i, %for.cond25.preheader.i
  %indvars.iv81.i = phi i64 [ %indvars.iv.next82.i, %for.cond25.preheader.i ], [ 0, %for.cond.cleanup3.i ]
  %97 = trunc nuw nsw i64 %indvars.iv81.i to i32
  %conv29.i = uitofp nneg i32 %97 to float
  %broadcast.splatinsert42 = insertelement <4 x float> poison, float %conv29.i, i64 0
  %broadcast.splat43 = shufflevector <4 x float> %broadcast.splatinsert42, <4 x float> poison, <4 x i32> zeroinitializer
  %arrayidx36.idx.i = shl nuw nsw i64 %indvars.iv81.i, 9
  %invariant.gep.i = getelementptr inbounds nuw i8, ptr %call1, i64 %arrayidx36.idx.i
  %98 = fmul nnan <4 x float> %broadcast.splat43, <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>
  %99 = fmul nnan <4 x float> %broadcast.splat43, <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>
  %100 = fmul nnan <4 x float> %98, splat (float 7.812500e-03)
  %101 = fmul nnan <4 x float> %99, splat (float 7.812500e-03)
  %102 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 16
  store <4 x float> %100, ptr %invariant.gep.i, align 4, !tbaa !12
  store <4 x float> %101, ptr %102, align 4, !tbaa !12
  %103 = fmul nnan <4 x float> %broadcast.splat43, <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>
  %104 = fmul nnan <4 x float> %broadcast.splat43, <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>
  %105 = fmul nnan <4 x float> %103, splat (float 7.812500e-03)
  %106 = fmul nnan <4 x float> %104, splat (float 7.812500e-03)
  %107 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 32
  %108 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 48
  store <4 x float> %105, ptr %107, align 4, !tbaa !12
  store <4 x float> %106, ptr %108, align 4, !tbaa !12
  %109 = fmul nnan <4 x float> %broadcast.splat43, <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>
  %110 = fmul nnan <4 x float> %broadcast.splat43, <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>
  %111 = fmul nnan <4 x float> %109, splat (float 7.812500e-03)
  %112 = fmul nnan <4 x float> %110, splat (float 7.812500e-03)
  %113 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 64
  %114 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 80
  store <4 x float> %111, ptr %113, align 4, !tbaa !12
  store <4 x float> %112, ptr %114, align 4, !tbaa !12
  %115 = fmul nnan <4 x float> %broadcast.splat43, <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>
  %116 = fmul nnan <4 x float> %broadcast.splat43, <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>
  %117 = fmul nnan <4 x float> %115, splat (float 7.812500e-03)
  %118 = fmul nnan <4 x float> %116, splat (float 7.812500e-03)
  %119 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 96
  %120 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 112
  store <4 x float> %117, ptr %119, align 4, !tbaa !12
  store <4 x float> %118, ptr %120, align 4, !tbaa !12
  %121 = fmul nnan <4 x float> %broadcast.splat43, <float 3.200000e+01, float 3.300000e+01, float 3.400000e+01, float 3.500000e+01>
  %122 = fmul nnan <4 x float> %broadcast.splat43, <float 3.600000e+01, float 3.700000e+01, float 3.800000e+01, float 3.900000e+01>
  %123 = fmul nnan <4 x float> %121, splat (float 7.812500e-03)
  %124 = fmul nnan <4 x float> %122, splat (float 7.812500e-03)
  %125 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 128
  %126 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 144
  store <4 x float> %123, ptr %125, align 4, !tbaa !12
  store <4 x float> %124, ptr %126, align 4, !tbaa !12
  %127 = fmul nnan <4 x float> %broadcast.splat43, <float 4.000000e+01, float 4.100000e+01, float 4.200000e+01, float 4.300000e+01>
  %128 = fmul nnan <4 x float> %broadcast.splat43, <float 4.400000e+01, float 4.500000e+01, float 4.600000e+01, float 4.700000e+01>
  %129 = fmul nnan <4 x float> %127, splat (float 7.812500e-03)
  %130 = fmul nnan <4 x float> %128, splat (float 7.812500e-03)
  %131 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 160
  %132 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 176
  store <4 x float> %129, ptr %131, align 4, !tbaa !12
  store <4 x float> %130, ptr %132, align 4, !tbaa !12
  %133 = fmul nnan <4 x float> %broadcast.splat43, <float 4.800000e+01, float 4.900000e+01, float 5.000000e+01, float 5.100000e+01>
  %134 = fmul nnan <4 x float> %broadcast.splat43, <float 5.200000e+01, float 5.300000e+01, float 5.400000e+01, float 5.500000e+01>
  %135 = fmul nnan <4 x float> %133, splat (float 7.812500e-03)
  %136 = fmul nnan <4 x float> %134, splat (float 7.812500e-03)
  %137 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 192
  %138 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 208
  store <4 x float> %135, ptr %137, align 4, !tbaa !12
  store <4 x float> %136, ptr %138, align 4, !tbaa !12
  %139 = fmul nnan <4 x float> %broadcast.splat43, <float 5.600000e+01, float 5.700000e+01, float 5.800000e+01, float 5.900000e+01>
  %140 = fmul nnan <4 x float> %broadcast.splat43, <float 6.000000e+01, float 6.100000e+01, float 6.200000e+01, float 6.300000e+01>
  %141 = fmul nnan <4 x float> %139, splat (float 7.812500e-03)
  %142 = fmul nnan <4 x float> %140, splat (float 7.812500e-03)
  %143 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 224
  %144 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 240
  store <4 x float> %141, ptr %143, align 4, !tbaa !12
  store <4 x float> %142, ptr %144, align 4, !tbaa !12
  %145 = fmul nnan <4 x float> %broadcast.splat43, <float 6.400000e+01, float 6.500000e+01, float 6.600000e+01, float 6.700000e+01>
  %146 = fmul nnan <4 x float> %broadcast.splat43, <float 6.800000e+01, float 6.900000e+01, float 7.000000e+01, float 7.100000e+01>
  %147 = fmul nnan <4 x float> %145, splat (float 7.812500e-03)
  %148 = fmul nnan <4 x float> %146, splat (float 7.812500e-03)
  %149 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 256
  %150 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 272
  store <4 x float> %147, ptr %149, align 4, !tbaa !12
  store <4 x float> %148, ptr %150, align 4, !tbaa !12
  %151 = fmul nnan <4 x float> %broadcast.splat43, <float 7.200000e+01, float 7.300000e+01, float 7.400000e+01, float 7.500000e+01>
  %152 = fmul nnan <4 x float> %broadcast.splat43, <float 7.600000e+01, float 7.700000e+01, float 7.800000e+01, float 7.900000e+01>
  %153 = fmul nnan <4 x float> %151, splat (float 7.812500e-03)
  %154 = fmul nnan <4 x float> %152, splat (float 7.812500e-03)
  %155 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 288
  %156 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 304
  store <4 x float> %153, ptr %155, align 4, !tbaa !12
  store <4 x float> %154, ptr %156, align 4, !tbaa !12
  %157 = fmul nnan <4 x float> %broadcast.splat43, <float 8.000000e+01, float 8.100000e+01, float 8.200000e+01, float 8.300000e+01>
  %158 = fmul nnan <4 x float> %broadcast.splat43, <float 8.400000e+01, float 8.500000e+01, float 8.600000e+01, float 8.700000e+01>
  %159 = fmul nnan <4 x float> %157, splat (float 7.812500e-03)
  %160 = fmul nnan <4 x float> %158, splat (float 7.812500e-03)
  %161 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 320
  %162 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 336
  store <4 x float> %159, ptr %161, align 4, !tbaa !12
  store <4 x float> %160, ptr %162, align 4, !tbaa !12
  %163 = fmul nnan <4 x float> %broadcast.splat43, <float 8.800000e+01, float 8.900000e+01, float 9.000000e+01, float 9.100000e+01>
  %164 = fmul nnan <4 x float> %broadcast.splat43, <float 9.200000e+01, float 9.300000e+01, float 9.400000e+01, float 9.500000e+01>
  %165 = fmul nnan <4 x float> %163, splat (float 7.812500e-03)
  %166 = fmul nnan <4 x float> %164, splat (float 7.812500e-03)
  %167 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 352
  %168 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 368
  store <4 x float> %165, ptr %167, align 4, !tbaa !12
  store <4 x float> %166, ptr %168, align 4, !tbaa !12
  %169 = fmul nnan <4 x float> %broadcast.splat43, <float 9.600000e+01, float 9.700000e+01, float 9.800000e+01, float 9.900000e+01>
  %170 = fmul nnan <4 x float> %broadcast.splat43, <float 1.000000e+02, float 1.010000e+02, float 1.020000e+02, float 1.030000e+02>
  %171 = fmul nnan <4 x float> %169, splat (float 7.812500e-03)
  %172 = fmul nnan <4 x float> %170, splat (float 7.812500e-03)
  %173 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 384
  %174 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 400
  store <4 x float> %171, ptr %173, align 4, !tbaa !12
  store <4 x float> %172, ptr %174, align 4, !tbaa !12
  %175 = fmul nnan <4 x float> %broadcast.splat43, <float 1.040000e+02, float 1.050000e+02, float 1.060000e+02, float 1.070000e+02>
  %176 = fmul nnan <4 x float> %broadcast.splat43, <float 1.080000e+02, float 1.090000e+02, float 1.100000e+02, float 1.110000e+02>
  %177 = fmul nnan <4 x float> %175, splat (float 7.812500e-03)
  %178 = fmul nnan <4 x float> %176, splat (float 7.812500e-03)
  %179 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 416
  %180 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 432
  store <4 x float> %177, ptr %179, align 4, !tbaa !12
  store <4 x float> %178, ptr %180, align 4, !tbaa !12
  %181 = fmul nnan <4 x float> %broadcast.splat43, <float 1.120000e+02, float 1.130000e+02, float 1.140000e+02, float 1.150000e+02>
  %182 = fmul nnan <4 x float> %broadcast.splat43, <float 1.160000e+02, float 1.170000e+02, float 1.180000e+02, float 1.190000e+02>
  %183 = fmul nnan <4 x float> %181, splat (float 7.812500e-03)
  %184 = fmul nnan <4 x float> %182, splat (float 7.812500e-03)
  %185 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 448
  %186 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 464
  store <4 x float> %183, ptr %185, align 4, !tbaa !12
  store <4 x float> %184, ptr %186, align 4, !tbaa !12
  %187 = fmul nnan <4 x float> %broadcast.splat43, <float 1.200000e+02, float 1.210000e+02, float 1.220000e+02, float 1.230000e+02>
  %188 = fmul nnan <4 x float> %broadcast.splat43, <float 1.240000e+02, float 1.250000e+02, float 1.260000e+02, float 1.270000e+02>
  %189 = fmul nnan <4 x float> %187, splat (float 7.812500e-03)
  %190 = fmul nnan <4 x float> %188, splat (float 7.812500e-03)
  %191 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 480
  %192 = getelementptr inbounds nuw i8, ptr %invariant.gep.i, i64 496
  store <4 x float> %189, ptr %191, align 4, !tbaa !12
  store <4 x float> %190, ptr %192, align 4, !tbaa !12
  %indvars.iv.next82.i = add nuw nsw i64 %indvars.iv81.i, 1
  %exitcond85.not.i = icmp eq i64 %indvars.iv.next82.i, 128
  br i1 %exitcond85.not.i, label %_Z10init_arrayPfS_.exit, label %for.cond25.preheader.i, !llvm.loop !21

_Z10init_arrayPfS_.exit:                          ; preds = %for.cond25.preheader.i
  tail call void @_Z11doitgenCudaPfS_S_S_(ptr noundef %call, ptr noundef nonnull %call1, ptr noundef %call2, ptr noundef %call3) #14
  %call4 = tail call noundef double @_Z7rtclockv() #14
  br label %for.cond1.preheader.i18

for.cond1.preheader.i18:                          ; preds = %for.cond.cleanup3.i27, %_Z10init_arrayPfS_.exit
  %indvars.iv128.i = phi i64 [ 0, %_Z10init_arrayPfS_.exit ], [ %indvars.iv.next129.i, %for.cond.cleanup3.i27 ]
  %193 = shl nuw nsw i64 %indvars.iv128.i, 16
  %194 = shl nuw nsw i64 %indvars.iv128.i, 14
  br label %for.cond5.preheader.i19

for.cond5.preheader.i19:                          ; preds = %for.body45.i.preheader, %for.cond1.preheader.i18
  %indvars.iv120.i = phi i64 [ 0, %for.cond1.preheader.i18 ], [ %indvars.iv.next121.i, %for.body45.i.preheader ]
  %195 = shl nuw nsw i64 %indvars.iv120.i, 9
  %196 = add nuw nsw i64 %193, %195
  %scevgep = getelementptr nuw i8, ptr %call, i64 %196
  %scevgep37 = getelementptr nuw i8, ptr %call2, i64 %196
  %197 = shl nuw nsw i64 %indvars.iv120.i, 7
  %198 = add nuw nsw i64 %197, %194
  %invariant.gep136.i = getelementptr inbounds nuw [4 x i8], ptr %call2, i64 %198
  %invariant.gep.i20 = getelementptr inbounds nuw [4 x i8], ptr %call, i64 %198
  br label %for.body8.i21

for.cond.cleanup3.i27:                            ; preds = %for.body45.i.preheader
  %indvars.iv.next129.i = add nuw nsw i64 %indvars.iv128.i, 1
  %exitcond133.not.i = icmp eq i64 %indvars.iv.next129.i, 128
  br i1 %exitcond133.not.i, label %_Z10doitgenCPUPfS_S_.exit, label %for.cond1.preheader.i18, !llvm.loop !10

for.body8.i21:                                    ; preds = %for.cond.cleanup13.i, %for.cond5.preheader.i19
  %indvars.iv107.i = phi i64 [ 0, %for.cond5.preheader.i19 ], [ %indvars.iv.next108.i, %for.cond.cleanup13.i ]
  %gep137.i = getelementptr inbounds nuw [4 x i8], ptr %invariant.gep136.i, i64 %indvars.iv107.i
  %invariant.gep134.i = getelementptr inbounds nuw [4 x i8], ptr %call1, i64 %indvars.iv107.i
  br label %for.body14.i

for.cond.cleanup13.i:                             ; preds = %for.body14.i
  store float %211, ptr %gep137.i, align 4, !tbaa !12
  %indvars.iv.next108.i = add nuw nsw i64 %indvars.iv107.i, 1
  %exitcond111.not.i = icmp eq i64 %indvars.iv.next108.i, 128
  br i1 %exitcond111.not.i, label %for.body45.i.preheader, label %for.body8.i21, !llvm.loop !14

for.body45.i.preheader:                           ; preds = %for.cond.cleanup13.i
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(512) %scevgep, ptr noundef nonnull align 4 dereferenceable(512) %scevgep37, i64 512, i1 false), !tbaa !12
  %indvars.iv.next121.i = add nuw nsw i64 %indvars.iv120.i, 1
  %exitcond127.not.i = icmp eq i64 %indvars.iv.next121.i, 128
  br i1 %exitcond127.not.i, label %for.cond.cleanup3.i27, label %for.cond5.preheader.i19, !llvm.loop !16

for.body14.i:                                     ; preds = %for.body14.i, %for.body8.i21
  %indvars.iv.i22 = phi i64 [ 0, %for.body8.i21 ], [ %indvars.iv.next.i25.3, %for.body14.i ]
  %199 = phi float [ 0.000000e+00, %for.body8.i21 ], [ %211, %for.body14.i ]
  %gep.i23 = getelementptr inbounds nuw [4 x i8], ptr %invariant.gep.i20, i64 %indvars.iv.i22
  %200 = load float, ptr %gep.i23, align 4, !tbaa !12
  %.idx.i24 = shl nuw nsw i64 %indvars.iv.i22, 9
  %gep135.i = getelementptr inbounds nuw i8, ptr %invariant.gep134.i, i64 %.idx.i24
  %201 = load float, ptr %gep135.i, align 4, !tbaa !12
  %202 = tail call float @llvm.fmuladd.f32(float %200, float %201, float %199)
  %indvars.iv.next.i25 = or disjoint i64 %indvars.iv.i22, 1
  %gep.i23.1 = getelementptr inbounds nuw [4 x i8], ptr %invariant.gep.i20, i64 %indvars.iv.next.i25
  %203 = load float, ptr %gep.i23.1, align 4, !tbaa !12
  %.idx.i24.1 = shl nuw nsw i64 %indvars.iv.next.i25, 9
  %gep135.i.1 = getelementptr inbounds nuw i8, ptr %invariant.gep134.i, i64 %.idx.i24.1
  %204 = load float, ptr %gep135.i.1, align 4, !tbaa !12
  %205 = tail call float @llvm.fmuladd.f32(float %203, float %204, float %202)
  %indvars.iv.next.i25.1 = or disjoint i64 %indvars.iv.i22, 2
  %gep.i23.2 = getelementptr inbounds nuw [4 x i8], ptr %invariant.gep.i20, i64 %indvars.iv.next.i25.1
  %206 = load float, ptr %gep.i23.2, align 4, !tbaa !12
  %.idx.i24.2 = shl nuw nsw i64 %indvars.iv.next.i25.1, 9
  %gep135.i.2 = getelementptr inbounds nuw i8, ptr %invariant.gep134.i, i64 %.idx.i24.2
  %207 = load float, ptr %gep135.i.2, align 4, !tbaa !12
  %208 = tail call float @llvm.fmuladd.f32(float %206, float %207, float %205)
  %indvars.iv.next.i25.2 = or disjoint i64 %indvars.iv.i22, 3
  %gep.i23.3 = getelementptr inbounds nuw [4 x i8], ptr %invariant.gep.i20, i64 %indvars.iv.next.i25.2
  %209 = load float, ptr %gep.i23.3, align 4, !tbaa !12
  %.idx.i24.3 = shl nuw nsw i64 %indvars.iv.next.i25.2, 9
  %gep135.i.3 = getelementptr inbounds nuw i8, ptr %invariant.gep134.i, i64 %.idx.i24.3
  %210 = load float, ptr %gep135.i.3, align 4, !tbaa !12
  %211 = tail call float @llvm.fmuladd.f32(float %209, float %210, float %208)
  %indvars.iv.next.i25.3 = add nuw nsw i64 %indvars.iv.i22, 4
  %exitcond.not.i26.3 = icmp eq i64 %indvars.iv.next.i25.3, 128
  br i1 %exitcond.not.i26.3, label %for.cond.cleanup13.i, label %for.body14.i, !llvm.loop !15

_Z10doitgenCPUPfS_S_.exit:                        ; preds = %for.cond.cleanup3.i27
  %call5 = tail call noundef double @_Z7rtclockv() #14
  %212 = load ptr, ptr @stdout, align 8, !tbaa !30
  %sub = fsub double %call5, %call4
  %call6 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %212, ptr noundef nonnull @.str.3, double noundef %sub) #16
  br label %for.cond1.preheader.i28

for.cond1.preheader.i28:                          ; preds = %for.cond.cleanup3.i36, %_Z10doitgenCPUPfS_S_.exit
  %indvars.iv52.i = phi i64 [ 0, %_Z10doitgenCPUPfS_S_.exit ], [ %indvars.iv.next53.i, %for.cond.cleanup3.i36 ]
  %fail.042.i = phi i32 [ 0, %_Z10doitgenCPUPfS_S_.exit ], [ %251, %for.cond.cleanup3.i36 ]
  %213 = shl nuw nsw i64 %indvars.iv52.i, 14
  br label %for.cond5.preheader.i29

for.cond5.preheader.i29:                          ; preds = %for.cond.cleanup7.i35, %for.cond1.preheader.i28
  %indvars.iv46.i = phi i64 [ 0, %for.cond1.preheader.i28 ], [ %indvars.iv.next47.i, %for.cond.cleanup7.i35 ]
  %fail.140.i = phi i32 [ %fail.042.i, %for.cond1.preheader.i28 ], [ %251, %for.cond.cleanup7.i35 ]
  %214 = shl nuw nsw i64 %indvars.iv46.i, 7
  %215 = add nuw nsw i64 %214, %213
  %216 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.140.i, i64 0
  br label %vector.body52

vector.body52:                                    ; preds = %vector.body52, %for.cond5.preheader.i29
  %index53 = phi i64 [ 0, %for.cond5.preheader.i29 ], [ %index.next55, %vector.body52 ]
  %vec.phi = phi <4 x i32> [ %216, %for.cond5.preheader.i29 ], [ %249, %vector.body52 ]
  %217 = add nuw nsw i64 %215, %index53
  %218 = getelementptr inbounds nuw [4 x i8], ptr %call2, i64 %217
  %wide.load = load <4 x float>, ptr %218, align 4, !tbaa !12
  %219 = fpext <4 x float> %wide.load to <4 x double>
  %220 = getelementptr inbounds nuw [4 x i8], ptr %call3, i64 %217
  %wide.load54 = load <4 x float>, ptr %220, align 4, !tbaa !12
  %221 = fpext <4 x float> %wide.load54 to <4 x double>
  %222 = fcmp olt <4 x double> %219, splat (double f0xB690000000000000)
  %223 = fneg <4 x float> %wide.load
  %224 = select <4 x i1> %222, <4 x float> %223, <4 x float> %wide.load
  %225 = fpext <4 x float> %224 to <4 x double>
  %226 = fcmp uge <4 x double> %225, splat (double 1.000000e-02)
  %227 = fcmp olt <4 x double> %221, splat (double f0xB690000000000000)
  %228 = fneg <4 x float> %wide.load54
  %229 = select <4 x i1> %227, <4 x float> %228, <4 x float> %wide.load54
  %230 = fpext <4 x float> %229 to <4 x double>
  %231 = fcmp uge <4 x double> %230, splat (double 1.000000e-02)
  %232 = fsub <4 x double> %219, %221
  %233 = fptrunc <4 x double> %232 to <4 x float>
  %234 = fcmp olt <4 x double> %232, splat (double f0xB690000000000000)
  %235 = fneg <4 x float> %233
  %236 = select <4 x i1> %234, <4 x float> %235, <4 x float> %233
  %237 = fadd <4 x double> %219, splat (double f0x3E45798EE0000000)
  %238 = fptrunc <4 x double> %237 to <4 x float>
  %239 = fcmp olt <4 x double> %237, splat (double f0xB690000000000000)
  %240 = fneg <4 x float> %238
  %241 = select <4 x i1> %239, <4 x float> %240, <4 x float> %238
  %242 = fdiv <4 x float> %236, %241
  %243 = fcmp olt <4 x float> %242, zeroinitializer
  %244 = fneg <4 x float> %242
  %245 = select <4 x i1> %243, <4 x float> %244, <4 x float> %242
  %246 = fmul <4 x float> %245, splat (float 1.000000e+02)
  %247 = fpext <4 x float> %246 to <4 x double>
  %248 = fcmp ogt <4 x double> %247, splat (double 5.000000e-02)
  %.not58 = select <4 x i1> %226, <4 x i1> splat (i1 true), <4 x i1> %231
  %narrow = select <4 x i1> %.not58, <4 x i1> %248, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %249 = add <4 x i32> %vec.phi, %predphi
  %index.next55 = add nuw i64 %index53, 4
  %250 = icmp eq i64 %index.next55, 128
  br i1 %250, label %for.cond.cleanup7.i35, label %vector.body52, !llvm.loop !35

for.cond.cleanup3.i36:                            ; preds = %for.cond.cleanup7.i35
  %indvars.iv.next53.i = add nuw nsw i64 %indvars.iv52.i, 1
  %exitcond56.not.i = icmp eq i64 %indvars.iv.next53.i, 128
  br i1 %exitcond56.not.i, label %_Z14compareResultsPfS_.exit, label %for.cond1.preheader.i28, !llvm.loop !24

for.cond.cleanup7.i35:                            ; preds = %vector.body52
  %251 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %249)
  %indvars.iv.next47.i = add nuw nsw i64 %indvars.iv46.i, 1
  %exitcond51.not.i = icmp eq i64 %indvars.iv.next47.i, 128
  br i1 %exitcond51.not.i, label %for.cond.cleanup3.i36, label %for.cond5.preheader.i29, !llvm.loop !25

_Z14compareResultsPfS_.exit:                      ; preds = %for.cond.cleanup3.i36
  %call27.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %251) #14
  tail call void @free(ptr noundef %call) #16
  tail call void @free(ptr noundef %call1) #16
  tail call void @free(ptr noundef nonnull %call2) #16
  tail call void @free(ptr noundef nonnull %call3) #16
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite, errnomem: write)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #10

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #11

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #12

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #13

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #5 = { mustprogress nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #6 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #7 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #8 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #9 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #10 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite, errnomem: write) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #11 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #13 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #14 = { "uniform-work-group-size" }
attributes #15 = { nounwind }
attributes #16 = { nounwind "uniform-work-group-size" }
attributes #17 = { nounwind allocsize(0) "uniform-work-group-size" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}
!llvm.errno.tbaa = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 8]}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 24.0.0git (https://github.com/llvm/llvm-project c45e6b9e4d95fb444eb1308416c10d95350d3c52)"}
!5 = !{!6, !7, i64 0}
!6 = !{!"__libc_errno", !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !8, i64 0}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !11, !18}
!18 = !{!"llvm.loop.isvectorized", i32 1}
!19 = distinct !{!19, !11}
!20 = distinct !{!20, !11}
!21 = distinct !{!21, !11}
!22 = distinct !{!22, !11, !18, !23}
!23 = !{!"llvm.loop.unroll.runtime.disable"}
!24 = distinct !{!24, !11}
!25 = distinct !{!25, !11}
!26 = !{!27, !27, i64 0}
!27 = !{!"p1 float", !28, i64 0}
!28 = !{!"any pointer", !8, i64 0}
!29 = !{!7, !7, i64 0}
!30 = !{!31, !31, i64 0}
!31 = !{!"p1 _ZTS8_IO_FILE", !28, i64 0}
!32 = !{ptr @_Z30__device_stub__doitgen_kernel1PfS_S_i}
!33 = !{ptr @_Z30__device_stub__doitgen_kernel2PfS_S_i}
!34 = distinct !{!34, !11}
!35 = distinct !{!35, !11, !18, !23}
