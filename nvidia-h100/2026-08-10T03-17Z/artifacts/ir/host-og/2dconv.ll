; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/2DCONV/2DConvolution.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/2DCONV/2DConvolution.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cudaDeviceProp = type { [256 x i8], %struct.CUuuid_st, [8 x i8], i32, i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [63 x i32] }
%struct.CUuuid_st = type { [16 x i8] }
%struct.dim3 = type { i32, i32, i32 }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [74 x i8] c"Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"setting device %d with name %s\0A\00", align 1
@polybench_papi_counters_threadid = dso_local local_unnamed_addr global i32 0, align 4
@polybench_program_total_flops = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_t_start = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_t_end = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_c_start = dso_local local_unnamed_addr global i64 0, align 8
@polybench_c_end = dso_local local_unnamed_addr global i64 0, align 8
@.str.6 = private unnamed_addr constant [7 x i8] c"%0.6f\0A\00", align 1
@.str.7 = private unnamed_addr constant [35 x i8] c"Error return from gettimeofday: %d\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.8 = private unnamed_addr constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1
@str = private unnamed_addr constant [21 x i8] c"GPU Time in seconds:\00", align 1
@str.9 = private unnamed_addr constant [21 x i8] c"CPU Time in seconds:\00", align 1

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
define dso_local void @_Z6conv2DiiPA4096_fS0_(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B) local_unnamed_addr #1 {
entry:
  %cmp96 = icmp sgt i32 %ni, 2
  %cmp394 = icmp sgt i32 %nj, 2
  %or.cond = and i1 %cmp96, %cmp394
  br i1 %or.cond, label %for.cond1.preheader.preheader, label %for.end63

for.cond1.preheader.preheader:                    ; preds = %entry
  %sub = add nsw i32 %ni, -1
  %sub2 = add nsw i32 %nj, -1
  %wide.trip.count103 = zext i32 %sub to i64
  %wide.trip.count = zext i32 %sub2 to i64
  %scevgep = getelementptr i8, ptr %B, i64 16388
  %0 = shl nuw nsw i64 %wide.trip.count103, 14
  %1 = shl nuw nsw i64 %wide.trip.count, 2
  %2 = add nuw nsw i64 %0, %1
  %3 = getelementptr i8, ptr %B, i64 %2
  %scevgep105 = getelementptr i8, ptr %3, i64 -16384
  %4 = getelementptr i8, ptr %A, i64 %2
  %scevgep106 = getelementptr i8, ptr %4, i64 4
  %5 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i64 %5, 4
  %bound0 = icmp ult ptr %scevgep, %scevgep106
  %bound1 = icmp ult ptr %A, %scevgep105
  %found.conflict = and i1 %bound0, %bound1
  %n.vec = and i64 %5, -4
  %6 = or disjoint i64 %n.vec, 1
  %cmp.n = icmp eq i64 %5, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc61_crit_edge
  %indvars.iv100 = phi i64 [ 1, %for.cond1.preheader.preheader ], [ %indvars.iv.next101, %for.cond1.for.inc61_crit_edge ]
  %7 = getelementptr [16384 x i8], ptr %A, i64 %indvars.iv100
  %arrayidx = getelementptr i8, ptr %7, i64 -16384
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %7, i64 16384
  %arrayidx58 = getelementptr inbounds nuw [16384 x i8], ptr %B, i64 %indvars.iv100
  %brmerge = select i1 %min.iters.check, i1 true, i1 %found.conflict
  br i1 %brmerge, label %for.body4.preheader, label %vector.body

vector.body:                                      ; preds = %for.cond1.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.cond1.preheader ]
  %8 = or disjoint i64 %index, 1
  %9 = getelementptr inbounds [4 x i8], ptr %arrayidx, i64 %index
  %wide.load = load <4 x float>, ptr %9, align 4, !tbaa !10, !alias.scope !12
  %10 = getelementptr inbounds [4 x i8], ptr %7, i64 %index
  %wide.load107 = load <4 x float>, ptr %10, align 4, !tbaa !10, !alias.scope !12
  %11 = fmul <4 x float> %wide.load107, splat (float -3.000000e-01)
  %12 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load, <4 x float> splat (float 2.000000e-01), <4 x float> %11)
  %13 = getelementptr inbounds [4 x i8], ptr %arrayidx17, i64 %index
  %wide.load108 = load <4 x float>, ptr %13, align 4, !tbaa !10, !alias.scope !12
  %14 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load108, <4 x float> splat (float 4.000000e-01), <4 x float> %12)
  %15 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %8
  %wide.load109 = load <4 x float>, ptr %15, align 4, !tbaa !10, !alias.scope !12
  %16 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load109, <4 x float> splat (float 5.000000e-01), <4 x float> %14)
  %17 = getelementptr inbounds nuw [4 x i8], ptr %7, i64 %8
  %wide.load110 = load <4 x float>, ptr %17, align 4, !tbaa !10, !alias.scope !12
  %18 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load110, <4 x float> splat (float 6.000000e-01), <4 x float> %16)
  %19 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17, i64 %8
  %wide.load111 = load <4 x float>, ptr %19, align 4, !tbaa !10, !alias.scope !12
  %20 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load111, <4 x float> splat (float f0x3F333333), <4 x float> %18)
  %21 = or disjoint i64 %index, 2
  %22 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %21
  %wide.load112 = load <4 x float>, ptr %22, align 4, !tbaa !10, !alias.scope !12
  %23 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load112, <4 x float> splat (float -8.000000e-01), <4 x float> %20)
  %24 = getelementptr inbounds nuw [4 x i8], ptr %7, i64 %21
  %wide.load113 = load <4 x float>, ptr %24, align 4, !tbaa !10, !alias.scope !12
  %25 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load113, <4 x float> splat (float f0xBF666666), <4 x float> %23)
  %26 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17, i64 %21
  %wide.load114 = load <4 x float>, ptr %26, align 4, !tbaa !10, !alias.scope !12
  %27 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load114, <4 x float> splat (float 1.000000e-01), <4 x float> %25)
  %28 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx58, i64 %8
  store <4 x float> %27, ptr %28, align 4, !tbaa !10, !alias.scope !15, !noalias !12
  %index.next = add nuw i64 %index, 4
  %29 = icmp eq i64 %index.next, %n.vec
  br i1 %29, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc61_crit_edge, label %for.body4.preheader

for.body4.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ %6, %middle.block ], [ 1, %for.cond1.preheader ]
  br label %for.body4

for.body4:                                        ; preds = %for.body4.preheader, %for.body4
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body4 ], [ %indvars.iv.ph, %for.body4.preheader ]
  %30 = add nsw i64 %indvars.iv, -1
  %arrayidx8 = getelementptr inbounds [4 x i8], ptr %arrayidx, i64 %30
  %31 = load float, ptr %arrayidx8, align 4, !tbaa !10
  %arrayidx13 = getelementptr inbounds [4 x i8], ptr %7, i64 %30
  %32 = load float, ptr %arrayidx13, align 4, !tbaa !10
  %mul14 = fmul float %32, -3.000000e-01
  %33 = tail call float @llvm.fmuladd.f32(float %31, float 2.000000e-01, float %mul14)
  %arrayidx20 = getelementptr inbounds [4 x i8], ptr %arrayidx17, i64 %30
  %34 = load float, ptr %arrayidx20, align 4, !tbaa !10
  %35 = tail call float @llvm.fmuladd.f32(float %34, float 4.000000e-01, float %33)
  %arrayidx26 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  %36 = load float, ptr %arrayidx26, align 4, !tbaa !10
  %37 = tail call float @llvm.fmuladd.f32(float %36, float 5.000000e-01, float %35)
  %arrayidx32 = getelementptr inbounds nuw [4 x i8], ptr %7, i64 %indvars.iv
  %38 = load float, ptr %arrayidx32, align 4, !tbaa !10
  %39 = tail call float @llvm.fmuladd.f32(float %38, float 6.000000e-01, float %37)
  %arrayidx38 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17, i64 %indvars.iv
  %40 = load float, ptr %arrayidx38, align 4, !tbaa !10
  %41 = tail call float @llvm.fmuladd.f32(float %40, float f0x3F333333, float %39)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx44 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv.next
  %42 = load float, ptr %arrayidx44, align 4, !tbaa !10
  %43 = tail call float @llvm.fmuladd.f32(float %42, float -8.000000e-01, float %41)
  %arrayidx50 = getelementptr inbounds nuw [4 x i8], ptr %7, i64 %indvars.iv.next
  %44 = load float, ptr %arrayidx50, align 4, !tbaa !10
  %45 = tail call float @llvm.fmuladd.f32(float %44, float f0xBF666666, float %43)
  %arrayidx56 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17, i64 %indvars.iv.next
  %46 = load float, ptr %arrayidx56, align 4, !tbaa !10
  %47 = tail call float @llvm.fmuladd.f32(float %46, float 1.000000e-01, float %45)
  %arrayidx60 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx58, i64 %indvars.iv
  store float %47, ptr %arrayidx60, align 4, !tbaa !10
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc61_crit_edge, label %for.body4, !llvm.loop !21

for.cond1.for.inc61_crit_edge:                    ; preds = %for.body4, %middle.block
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond104.not = icmp eq i64 %indvars.iv.next101, %wide.trip.count103
  br i1 %exitcond104.not, label %for.end63, label %for.cond1.preheader, !llvm.loop !22

for.end63:                                        ; preds = %for.cond1.for.inc61_crit_edge, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nounwind uwtable
define dso_local void @_Z4initiiPA4096_f(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef writeonly captures(none) %A) local_unnamed_addr #4 {
entry:
  %cmp15 = icmp sgt i32 %ni, 0
  %cmp213 = icmp sgt i32 %nj, 0
  %or.cond = and i1 %cmp15, %cmp213
  br i1 %or.cond, label %for.cond1.preheader.preheader, label %for.end8

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count21 = zext nneg i32 %ni to i64
  %wide.trip.count = zext nneg i32 %nj to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc6_crit_edge
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next19, %for.cond1.for.inc6_crit_edge ]
  %arrayidx = getelementptr inbounds nuw [16384 x i8], ptr %A, i64 %indvars.iv18
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %call = tail call i32 @rand() #15
  %conv = sitofp i32 %call to float
  %div = fmul nnan float %conv, f0x30000000
  %arrayidx5 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  store float %div, ptr %arrayidx5, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc6_crit_edge, label %for.body3, !llvm.loop !23

for.cond1.for.inc6_crit_edge:                     ; preds = %for.body3
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond22.not = icmp eq i64 %indvars.iv.next19, %wide.trip.count21
  br i1 %exitcond22.not, label %for.end8, label %for.cond1.preheader, !llvm.loop !24

for.end8:                                         ; preds = %for.cond1.for.inc6_crit_edge, %entry
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #5

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiiPA4096_fS0_(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef readonly captures(none) %B_outputFromGpu) local_unnamed_addr #6 {
entry:
  %cmp29 = icmp sgt i32 %ni, 2
  %cmp326 = icmp sgt i32 %nj, 2
  %or.cond = and i1 %cmp29, %cmp326
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end17

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %sub = add nsw i32 %ni, -1
  %sub2 = add nsw i32 %nj, -1
  %wide.trip.count38 = zext nneg i32 %sub to i64
  %wide.trip.count = zext i32 %sub2 to i64
  %0 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i64 %0, 4
  %n.vec = and i64 %0, -4
  %1 = or disjoint i64 %n.vec, 1
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc15_crit_edge.us
  %indvars.iv35 = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next36, %for.cond1.for.inc15_crit_edge.us ]
  %fail.031.us = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %fail.2.us.lcssa, %for.cond1.for.inc15_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [16384 x i8], ptr %B, i64 %indvars.iv35
  %arrayidx8.us = getelementptr inbounds nuw [16384 x i8], ptr %B_outputFromGpu, i64 %indvars.iv35
  br i1 %min.iters.check, label %for.body4.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.us
  %2 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.031.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %2, %vector.ph ], [ %35, %vector.body ]
  %3 = or disjoint i64 %index, 1
  %4 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %3
  %wide.load = load <4 x float>, ptr %4, align 4, !tbaa !10
  %5 = fpext <4 x float> %wide.load to <4 x double>
  %6 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx8.us, i64 %3
  %wide.load40 = load <4 x float>, ptr %6, align 4, !tbaa !10
  %7 = fpext <4 x float> %wide.load40 to <4 x double>
  %8 = fcmp olt <4 x double> %5, splat (double f0xB690000000000000)
  %9 = fneg <4 x float> %wide.load
  %10 = select <4 x i1> %8, <4 x float> %9, <4 x float> %wide.load
  %11 = fpext <4 x float> %10 to <4 x double>
  %12 = fcmp uge <4 x double> %11, splat (double 1.000000e-02)
  %13 = fcmp olt <4 x double> %7, splat (double f0xB690000000000000)
  %14 = fneg <4 x float> %wide.load40
  %15 = select <4 x i1> %13, <4 x float> %14, <4 x float> %wide.load40
  %16 = fpext <4 x float> %15 to <4 x double>
  %17 = fcmp uge <4 x double> %16, splat (double 1.000000e-02)
  %18 = fsub <4 x double> %5, %7
  %19 = fptrunc <4 x double> %18 to <4 x float>
  %20 = fcmp olt <4 x double> %18, splat (double f0xB690000000000000)
  %21 = fneg <4 x float> %19
  %22 = select <4 x i1> %20, <4 x float> %21, <4 x float> %19
  %23 = fadd <4 x double> %5, splat (double f0x3E45798EE0000000)
  %24 = fptrunc <4 x double> %23 to <4 x float>
  %25 = fcmp olt <4 x double> %23, splat (double f0xB690000000000000)
  %26 = fneg <4 x float> %24
  %27 = select <4 x i1> %25, <4 x float> %26, <4 x float> %24
  %28 = fdiv <4 x float> %22, %27
  %29 = fcmp olt <4 x float> %28, zeroinitializer
  %30 = fneg <4 x float> %28
  %31 = select <4 x i1> %29, <4 x float> %30, <4 x float> %28
  %32 = fmul <4 x float> %31, splat (float 1.000000e+02)
  %33 = fpext <4 x float> %32 to <4 x double>
  %34 = fcmp ogt <4 x double> %33, splat (double 5.000000e-02)
  %.not42 = select <4 x i1> %12, <4 x i1> splat (i1 true), <4 x i1> %17
  %narrow = select <4 x i1> %.not42, <4 x i1> %34, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %35 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %36 = icmp eq i64 %index.next, %n.vec
  br i1 %36, label %middle.block, label %vector.body, !llvm.loop !25

middle.block:                                     ; preds = %vector.body
  %37 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %35)
  br i1 %cmp.n, label %for.cond1.for.inc15_crit_edge.us, label %for.body4.us.preheader

for.body4.us.preheader:                           ; preds = %for.cond1.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 1, %for.cond1.preheader.us ], [ %1, %middle.block ]
  %fail.128.us.ph = phi i32 [ %fail.031.us, %for.cond1.preheader.us ], [ %37, %middle.block ]
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.body4.us.preheader, %_Z11percentDiffdd.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us ], [ %indvars.iv.ph, %for.body4.us.preheader ]
  %fail.128.us = phi i32 [ %fail.2.us, %_Z11percentDiffdd.exit.us ], [ %fail.128.us.ph, %for.body4.us.preheader ]
  %arrayidx6.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %indvars.iv
  %38 = load float, ptr %arrayidx6.us, align 4, !tbaa !10
  %conv.us = fpext float %38 to double
  %arrayidx10.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx8.us, i64 %indvars.iv
  %39 = load float, ptr %arrayidx10.us, align 4, !tbaa !10
  %conv11.us = fpext float %39 to double
  %cmp.i.i.us = fcmp olt double %conv.us, f0xB690000000000000
  %mul.i.i.us = fneg float %38
  %retval.0.i.i.us = select i1 %cmp.i.i.us, float %mul.i.i.us, float %38
  %conv1.i.us = fpext float %retval.0.i.i.us to double
  %cmp.i.us = fcmp olt double %conv1.i.us, 1.000000e-02
  br i1 %cmp.i.us, label %land.lhs.true.i.us, label %if.else.i.us

land.lhs.true.i.us:                               ; preds = %for.body4.us
  %cmp.i14.i.us = fcmp olt double %conv11.us, f0xB690000000000000
  %mul.i15.i.us = fneg float %39
  %retval.0.i16.i.us = select i1 %cmp.i14.i.us, float %mul.i15.i.us, float %39
  %conv4.i.us = fpext float %retval.0.i16.i.us to double
  %cmp5.i.us = fcmp olt double %conv4.i.us, 1.000000e-02
  br i1 %cmp5.i.us, label %_Z11percentDiffdd.exit.us, label %if.else.i.us

if.else.i.us:                                     ; preds = %land.lhs.true.i.us, %for.body4.us
  %40 = insertelement <2 x double> poison, double %conv.us, i64 0
  %41 = shufflevector <2 x double> %40, <2 x double> poison, <2 x i32> zeroinitializer
  %42 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv11.us, i64 0
  %43 = fsub <2 x double> %41, %42
  %44 = fptrunc <2 x double> %43 to <2 x float>
  %45 = fcmp olt <2 x double> %43, splat (double f0xB690000000000000)
  %46 = fneg <2 x float> %44
  %47 = select <2 x i1> %45, <2 x float> %46, <2 x float> %44
  %48 = extractelement <2 x float> %47, i64 0
  %49 = extractelement <2 x float> %47, i64 1
  %div.i.us = fdiv float %48, %49
  %cmp.i23.i.us = fcmp olt float %div.i.us, 0.000000e+00
  %mul.i24.i.us = fneg float %div.i.us
  %retval.0.i25.i.us = select i1 %cmp.i23.i.us, float %mul.i24.i.us, float %div.i.us
  %mul.i.us = fmul float %retval.0.i25.i.us, 1.000000e+02
  %50 = fpext float %mul.i.us to double
  %51 = fcmp ogt double %50, 5.000000e-02
  %52 = zext i1 %51 to i32
  br label %_Z11percentDiffdd.exit.us

_Z11percentDiffdd.exit.us:                        ; preds = %if.else.i.us, %land.lhs.true.i.us
  %retval.0.i.us = phi i32 [ %52, %if.else.i.us ], [ 0, %land.lhs.true.i.us ]
  %fail.2.us = add nsw i32 %retval.0.i.us, %fail.128.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc15_crit_edge.us, label %for.body4.us, !llvm.loop !26

for.cond1.for.inc15_crit_edge.us:                 ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %fail.2.us.lcssa = phi i32 [ %37, %middle.block ], [ %fail.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond39.not = icmp eq i64 %indvars.iv.next36, %wide.trip.count38
  br i1 %exitcond39.not, label %for.end17, label %for.cond1.preheader.us, !llvm.loop !27

for.end17:                                        ; preds = %for.cond1.for.inc15_crit_edge.us, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %fail.2.us.lcssa, %for.cond1.for.inc15_crit_edge.us ]
  %call18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %fail.0.lcssa) #16
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #7

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #8 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp) #17
  %call = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp, i32 noundef 0) #16
  %call1 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp) #16
  %call2 = call i32 @cudaSetDevice(i32 noundef 0) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp) #17
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #9

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #9

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z35__device_stub__convolution2D_kerneliiPfS_(i32 noundef %ni, i32 noundef %nj, ptr noundef %A, ptr noundef %B) #10 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !28
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !28
  store ptr %A, ptr %A.addr, align 8, !tbaa !29
  store ptr %B, ptr %B.addr, align 8, !tbaa !29
  %kernel_args1 = alloca [4 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %A.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %B.addr, ptr %2, align 8
  %3 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %4 = load i64, ptr %shmem_size, align 8
  %5 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z35__device_stub__convolution2D_kerneliiPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress uwtable
define dso_local void @_Z17convolution2DCudaiiPA4096_fS0_S0_(i32 noundef %ni, i32 noundef %nj, ptr noundef %A, ptr nofree readnone captures(none) %B, ptr noundef %B_outputFromGpu) local_unnamed_addr #8 {
entry:
  %Tp.i.i20 = alloca %struct.timeval, align 8
  %ni.addr.i = alloca i32, align 4
  %nj.addr.i = alloca i32, align 4
  %A.addr.i = alloca ptr, align 8
  %B.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [4 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %A_gpu = alloca ptr, align 8
  %B_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %B_gpu) #17
  %call = call i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 67108864) #16
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %B_gpu, i64 noundef 67108864) #16
  %0 = load ptr, ptr %A_gpu, align 8, !tbaa !29
  %call2 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 67108864, i32 noundef 1) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #17
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #15
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #16
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %1 = load i64, ptr %Tp.i.i, align 8, !tbaa !32
  %conv.i.i = sitofp i64 %1 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %2 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !35
  %conv2.i.i = sitofp i64 %2 to double
  %3 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #17
  store double %3, ptr @polybench_t_start, align 8, !tbaa !36
  %call12 = call i32 @__cudaPushCallConfiguration(i64 2199023255680, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool.not = icmp eq i32 %call12, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %4 = load ptr, ptr %A_gpu, align 8, !tbaa !29
  %5 = load ptr, ptr %B_gpu, align 8, !tbaa !29
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %ni, ptr %ni.addr.i, align 4, !tbaa !28
  store i32 %nj, ptr %nj.addr.i, align 4, !tbaa !28
  store ptr %4, ptr %A.addr.i, align 8, !tbaa !29
  store ptr %5, ptr %B.addr.i, align 8, !tbaa !29
  store ptr %ni.addr.i, ptr %kernel_args1.i, align 16
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %nj.addr.i, ptr %6, align 8
  %7 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %A.addr.i, ptr %7, align 16
  %8 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %B.addr.i, ptr %8, align 8
  %9 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !38
  %10 = load i64, ptr %shmem_size.i, align 8
  %11 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z35__device_stub__convolution2D_kerneliiPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %10, ptr noundef %11), !inline_history !38
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %_Z21polybench_timer_startv.exit
  %call13 = call i32 @cudaThreadSynchronize() #16
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i20) #17
  %call.i.i21 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i20, ptr noundef null) #15
  %cmp.not.i.i22 = icmp eq i32 %call.i.i21, 0
  br i1 %cmp.not.i.i22, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i23

if.then.i.i23:                                    ; preds = %kcall.end
  %call1.i.i24 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i21) #16
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end, %if.then.i.i23
  %12 = load i64, ptr %Tp.i.i20, align 8, !tbaa !32
  %conv.i.i25 = sitofp i64 %12 to double
  %tv_usec.i.i26 = getelementptr inbounds nuw i8, ptr %Tp.i.i20, i64 8
  %13 = load i64, ptr %tv_usec.i.i26, align 8, !tbaa !35
  %conv2.i.i27 = sitofp i64 %13 to double
  %14 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i27, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i25)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i20) #17
  store double %14, ptr @polybench_t_end, align 8, !tbaa !36
  %15 = load double, ptr @polybench_t_start, align 8, !tbaa !36
  %sub.i = fsub double %14, %15
  %call.i28 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #16
  %16 = load ptr, ptr %B_gpu, align 8, !tbaa !29
  %call15 = call i32 @cudaMemcpy(ptr noundef %B_outputFromGpu, ptr noundef %16, i64 noundef 67108864, i32 noundef 2) #16
  %17 = load ptr, ptr %A_gpu, align 8, !tbaa !29
  %call16 = call i32 @cudaFree(ptr noundef %17) #16
  %18 = load ptr, ptr %B_gpu, align 8, !tbaa !29
  %call17 = call i32 @cudaFree(ptr noundef %18) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %B_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %A_gpu) #17
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #9

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #9

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #6 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #17
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #15
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #16
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !32
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !35
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #17
  store double %2, ptr @polybench_t_start, align 8, !tbaa !36
  ret void
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #9

declare i32 @cudaThreadSynchronize() local_unnamed_addr #9

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #6 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #17
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #15
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #16
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !32
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !35
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #17
  store double %2, ptr @polybench_t_end, align 8, !tbaa !36
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #6 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !36
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !36
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #16
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #9

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #10 {
entry:
  %Tp.i.i47 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i32 = alloca ptr, align 8
  %newA.i.i25 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #17
  store ptr null, ptr %newA.i.i, align 8, !tbaa !39
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 67108864) #15
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !39
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !40
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i25) #17
  store ptr null, ptr %newA.i.i25, align 8, !tbaa !39
  %call.i.i26 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i25, i64 noundef 32, i64 noundef 67108864) #15
  %3 = load ptr, ptr %newA.i.i25, align 8, !tbaa !39
  %tobool.i.i27 = icmp eq ptr %3, null
  %tobool1.i.i28 = icmp ne i32 %call.i.i26, 0
  %or.cond.i.i29 = select i1 %tobool.i.i27, i1 true, i1 %tobool1.i.i28
  br i1 %or.cond.i.i29, label %if.then.i.i30, label %_Z20polybench_alloc_datayi.exit31

if.then.i.i30:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !40
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit31:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i25) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i32) #17
  store ptr null, ptr %newA.i.i32, align 8, !tbaa !39
  %call.i.i33 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i32, i64 noundef 32, i64 noundef 67108864) #15
  %6 = load ptr, ptr %newA.i.i32, align 8, !tbaa !39
  %tobool.i.i34 = icmp eq ptr %6, null
  %tobool1.i.i35 = icmp ne i32 %call.i.i33, 0
  %or.cond.i.i36 = select i1 %tobool.i.i34, i1 true, i1 %tobool1.i.i35
  br i1 %or.cond.i.i36, label %if.then.i.i37, label %_Z20polybench_alloc_datayi.exit38

if.then.i.i37:                                    ; preds = %_Z20polybench_alloc_datayi.exit31
  %7 = load ptr, ptr @stderr, align 8, !tbaa !40
  %8 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %7) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit38:                ; preds = %_Z20polybench_alloc_datayi.exit31
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i32) #17
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc6_crit_edge.i, %_Z20polybench_alloc_datayi.exit38
  %indvars.iv18.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit38 ], [ %indvars.iv.next19.i, %for.cond1.for.inc6_crit_edge.i ]
  %arrayidx.i = getelementptr inbounds nuw [16384 x i8], ptr %0, i64 %indvars.iv18.i
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i, %for.body3.i ]
  %call.i = call i32 @rand() #15
  %conv.i = sitofp i32 %call.i to float
  %div.i = fmul nnan float %conv.i, f0x30000000
  %arrayidx5.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %indvars.iv.i
  store float %div.i, ptr %arrayidx5.i, align 4, !tbaa !10
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 4096
  br i1 %exitcond.not.i, label %for.cond1.for.inc6_crit_edge.i, label %for.body3.i, !llvm.loop !23

for.cond1.for.inc6_crit_edge.i:                   ; preds = %for.body3.i
  %indvars.iv.next19.i = add nuw nsw i64 %indvars.iv18.i, 1
  %exitcond22.not.i = icmp eq i64 %indvars.iv.next19.i, 4096
  br i1 %exitcond22.not.i, label %_Z4initiiPA4096_f.exit, label %for.cond1.preheader.i, !llvm.loop !24

_Z4initiiPA4096_f.exit:                           ; preds = %for.cond1.for.inc6_crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #17
  %call.i39 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #16
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #16
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #17
  call void @_Z17convolution2DCudaiiPA4096_fS0_S0_(i32 noundef 4096, i32 noundef 4096, ptr noundef nonnull %0, ptr nonnull poison, ptr noundef nonnull %6) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #17
  %call.i.i40 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #15
  %cmp.not.i.i = icmp eq i32 %call.i.i40, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i41

if.then.i.i41:                                    ; preds = %_Z4initiiPA4096_f.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i40) #16
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z4initiiPA4096_f.exit, %if.then.i.i41
  %9 = load i64, ptr %Tp.i.i, align 8, !tbaa !32
  %conv.i.i = sitofp i64 %9 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %10 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !35
  %conv2.i.i = sitofp i64 %10 to double
  %11 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #17
  store double %11, ptr @polybench_t_start, align 8, !tbaa !36
  %scevgep = getelementptr i8, ptr %3, i64 16388
  %scevgep61 = getelementptr i8, ptr %3, i64 67092476
  %scevgep62 = getelementptr i8, ptr %0, i64 67108864
  %bound0 = icmp ult ptr %scevgep, %scevgep62
  %bound1 = icmp ult ptr %0, %scevgep61
  %found.conflict = and i1 %bound0, %bound1
  br label %for.cond1.preheader.i42

for.cond1.preheader.i42:                          ; preds = %for.cond1.for.inc61_crit_edge.i, %_Z21polybench_timer_startv.exit
  %indvars.iv100.i = phi i64 [ 1, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next101.i, %for.cond1.for.inc61_crit_edge.i ]
  %12 = getelementptr [16384 x i8], ptr %0, i64 %indvars.iv100.i
  %arrayidx.i43 = getelementptr i8, ptr %12, i64 -16384
  %arrayidx17.i = getelementptr inbounds nuw i8, ptr %12, i64 16384
  %arrayidx58.i = getelementptr inbounds nuw [16384 x i8], ptr %3, i64 %indvars.iv100.i
  br i1 %found.conflict, label %for.body4.i.preheader, label %vector.body

vector.body:                                      ; preds = %for.cond1.preheader.i42, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.cond1.preheader.i42 ]
  %13 = or disjoint i64 %index, 1
  %14 = getelementptr inbounds [4 x i8], ptr %arrayidx.i43, i64 %index
  %wide.load = load <4 x float>, ptr %14, align 4, !tbaa !10, !alias.scope !42
  %15 = getelementptr inbounds [4 x i8], ptr %12, i64 %index
  %wide.load63 = load <4 x float>, ptr %15, align 4, !tbaa !10, !alias.scope !42
  %16 = fmul <4 x float> %wide.load63, splat (float -3.000000e-01)
  %17 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load, <4 x float> splat (float 2.000000e-01), <4 x float> %16)
  %18 = getelementptr inbounds [4 x i8], ptr %arrayidx17.i, i64 %index
  %wide.load64 = load <4 x float>, ptr %18, align 4, !tbaa !10, !alias.scope !42
  %19 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load64, <4 x float> splat (float 4.000000e-01), <4 x float> %17)
  %20 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i43, i64 %13
  %wide.load65 = load <4 x float>, ptr %20, align 4, !tbaa !10, !alias.scope !42
  %21 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load65, <4 x float> splat (float 5.000000e-01), <4 x float> %19)
  %22 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %13
  %wide.load66 = load <4 x float>, ptr %22, align 4, !tbaa !10, !alias.scope !42
  %23 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load66, <4 x float> splat (float 6.000000e-01), <4 x float> %21)
  %24 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.i, i64 %13
  %wide.load67 = load <4 x float>, ptr %24, align 4, !tbaa !10, !alias.scope !42
  %25 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load67, <4 x float> splat (float f0x3F333333), <4 x float> %23)
  %26 = or disjoint i64 %index, 2
  %27 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i43, i64 %26
  %wide.load68 = load <4 x float>, ptr %27, align 4, !tbaa !10, !alias.scope !42
  %28 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load68, <4 x float> splat (float -8.000000e-01), <4 x float> %25)
  %29 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %26
  %wide.load69 = load <4 x float>, ptr %29, align 4, !tbaa !10, !alias.scope !42
  %30 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load69, <4 x float> splat (float f0xBF666666), <4 x float> %28)
  %31 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.i, i64 %26
  %wide.load70 = load <4 x float>, ptr %31, align 4, !tbaa !10, !alias.scope !42
  %32 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load70, <4 x float> splat (float 1.000000e-01), <4 x float> %30)
  %33 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx58.i, i64 %13
  store <4 x float> %32, ptr %33, align 4, !tbaa !10, !alias.scope !45, !noalias !42
  %index.next = add nuw i64 %index, 4
  %34 = icmp eq i64 %index.next, 4092
  br i1 %34, label %for.body4.i.preheader, label %vector.body, !llvm.loop !47

for.body4.i.preheader:                            ; preds = %vector.body, %for.cond1.preheader.i42
  %indvars.iv.i44.ph = phi i64 [ 1, %for.cond1.preheader.i42 ], [ 4093, %vector.body ]
  br label %for.body4.i

for.body4.i:                                      ; preds = %for.body4.i.preheader, %for.body4.i
  %indvars.iv.i44 = phi i64 [ %indvars.iv.next.i45, %for.body4.i ], [ %indvars.iv.i44.ph, %for.body4.i.preheader ]
  %35 = add nsw i64 %indvars.iv.i44, -1
  %arrayidx8.i = getelementptr inbounds [4 x i8], ptr %arrayidx.i43, i64 %35
  %36 = load float, ptr %arrayidx8.i, align 4, !tbaa !10
  %arrayidx13.i = getelementptr inbounds [4 x i8], ptr %12, i64 %35
  %37 = load float, ptr %arrayidx13.i, align 4, !tbaa !10
  %mul14.i = fmul float %37, -3.000000e-01
  %38 = call float @llvm.fmuladd.f32(float %36, float 2.000000e-01, float %mul14.i)
  %arrayidx20.i = getelementptr inbounds [4 x i8], ptr %arrayidx17.i, i64 %35
  %39 = load float, ptr %arrayidx20.i, align 4, !tbaa !10
  %40 = call float @llvm.fmuladd.f32(float %39, float 4.000000e-01, float %38)
  %arrayidx26.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i43, i64 %indvars.iv.i44
  %41 = load float, ptr %arrayidx26.i, align 4, !tbaa !10
  %42 = call float @llvm.fmuladd.f32(float %41, float 5.000000e-01, float %40)
  %arrayidx32.i = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %indvars.iv.i44
  %43 = load float, ptr %arrayidx32.i, align 4, !tbaa !10
  %44 = call float @llvm.fmuladd.f32(float %43, float 6.000000e-01, float %42)
  %arrayidx38.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.i, i64 %indvars.iv.i44
  %45 = load float, ptr %arrayidx38.i, align 4, !tbaa !10
  %46 = call float @llvm.fmuladd.f32(float %45, float f0x3F333333, float %44)
  %indvars.iv.next.i45 = add nuw nsw i64 %indvars.iv.i44, 1
  %arrayidx44.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i43, i64 %indvars.iv.next.i45
  %47 = load float, ptr %arrayidx44.i, align 4, !tbaa !10
  %48 = call float @llvm.fmuladd.f32(float %47, float -8.000000e-01, float %46)
  %arrayidx50.i = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %indvars.iv.next.i45
  %49 = load float, ptr %arrayidx50.i, align 4, !tbaa !10
  %50 = call float @llvm.fmuladd.f32(float %49, float f0xBF666666, float %48)
  %arrayidx56.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.i, i64 %indvars.iv.next.i45
  %51 = load float, ptr %arrayidx56.i, align 4, !tbaa !10
  %52 = call float @llvm.fmuladd.f32(float %51, float 1.000000e-01, float %50)
  %arrayidx60.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx58.i, i64 %indvars.iv.i44
  store float %52, ptr %arrayidx60.i, align 4, !tbaa !10
  %exitcond.not.i46 = icmp eq i64 %indvars.iv.next.i45, 4095
  br i1 %exitcond.not.i46, label %for.cond1.for.inc61_crit_edge.i, label %for.body4.i, !llvm.loop !48

for.cond1.for.inc61_crit_edge.i:                  ; preds = %for.body4.i
  %indvars.iv.next101.i = add nuw nsw i64 %indvars.iv100.i, 1
  %exitcond104.not.i = icmp eq i64 %indvars.iv.next101.i, 4095
  br i1 %exitcond104.not.i, label %_Z6conv2DiiPA4096_fS0_.exit, label %for.cond1.preheader.i42, !llvm.loop !22

_Z6conv2DiiPA4096_fS0_.exit:                      ; preds = %for.cond1.for.inc61_crit_edge.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i47) #17
  %call.i.i48 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i47, ptr noundef null) #15
  %cmp.not.i.i49 = icmp eq i32 %call.i.i48, 0
  br i1 %cmp.not.i.i49, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i50

if.then.i.i50:                                    ; preds = %_Z6conv2DiiPA4096_fS0_.exit
  %call1.i.i51 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i48) #16
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z6conv2DiiPA4096_fS0_.exit, %if.then.i.i50
  %53 = load i64, ptr %Tp.i.i47, align 8, !tbaa !32
  %conv.i.i52 = sitofp i64 %53 to double
  %tv_usec.i.i53 = getelementptr inbounds nuw i8, ptr %Tp.i.i47, i64 8
  %54 = load i64, ptr %tv_usec.i.i53, align 8, !tbaa !35
  %conv2.i.i54 = sitofp i64 %54 to double
  %55 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i54, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i52)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i47) #17
  store double %55, ptr @polybench_t_end, align 8, !tbaa !36
  %56 = load double, ptr @polybench_t_start, align 8, !tbaa !36
  %sub.i = fsub double %55, %56
  %call.i55 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #16
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %_Z11percentDiffdd.exit.us.i.1, %_Z20polybench_timer_stopv.exit
  %indvars.iv35.i = phi i64 [ 1, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next36.i, %_Z11percentDiffdd.exit.us.i.1 ]
  %fail.031.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %fail.2.us.i.1, %_Z11percentDiffdd.exit.us.i.1 ]
  %arrayidx.us.i = getelementptr inbounds nuw [16384 x i8], ptr %3, i64 %indvars.iv35.i
  %arrayidx8.us.i = getelementptr inbounds nuw [16384 x i8], ptr %6, i64 %indvars.iv35.i
  %57 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.031.us.i, i64 0
  br label %vector.body73

vector.body73:                                    ; preds = %vector.body73, %for.cond1.preheader.us.i
  %index74 = phi i64 [ 0, %for.cond1.preheader.us.i ], [ %index.next77, %vector.body73 ]
  %vec.phi = phi <4 x i32> [ %57, %for.cond1.preheader.us.i ], [ %90, %vector.body73 ]
  %58 = or disjoint i64 %index74, 1
  %59 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i, i64 %58
  %wide.load75 = load <4 x float>, ptr %59, align 4, !tbaa !10
  %60 = fpext <4 x float> %wide.load75 to <4 x double>
  %61 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx8.us.i, i64 %58
  %wide.load76 = load <4 x float>, ptr %61, align 4, !tbaa !10
  %62 = fpext <4 x float> %wide.load76 to <4 x double>
  %63 = fcmp olt <4 x double> %60, splat (double f0xB690000000000000)
  %64 = fneg <4 x float> %wide.load75
  %65 = select <4 x i1> %63, <4 x float> %64, <4 x float> %wide.load75
  %66 = fpext <4 x float> %65 to <4 x double>
  %67 = fcmp uge <4 x double> %66, splat (double 1.000000e-02)
  %68 = fcmp olt <4 x double> %62, splat (double f0xB690000000000000)
  %69 = fneg <4 x float> %wide.load76
  %70 = select <4 x i1> %68, <4 x float> %69, <4 x float> %wide.load76
  %71 = fpext <4 x float> %70 to <4 x double>
  %72 = fcmp uge <4 x double> %71, splat (double 1.000000e-02)
  %73 = fsub <4 x double> %60, %62
  %74 = fptrunc <4 x double> %73 to <4 x float>
  %75 = fcmp olt <4 x double> %73, splat (double f0xB690000000000000)
  %76 = fneg <4 x float> %74
  %77 = select <4 x i1> %75, <4 x float> %76, <4 x float> %74
  %78 = fadd <4 x double> %60, splat (double f0x3E45798EE0000000)
  %79 = fptrunc <4 x double> %78 to <4 x float>
  %80 = fcmp olt <4 x double> %78, splat (double f0xB690000000000000)
  %81 = fneg <4 x float> %79
  %82 = select <4 x i1> %80, <4 x float> %81, <4 x float> %79
  %83 = fdiv <4 x float> %77, %82
  %84 = fcmp olt <4 x float> %83, zeroinitializer
  %85 = fneg <4 x float> %83
  %86 = select <4 x i1> %84, <4 x float> %85, <4 x float> %83
  %87 = fmul <4 x float> %86, splat (float 1.000000e+02)
  %88 = fpext <4 x float> %87 to <4 x double>
  %89 = fcmp ogt <4 x double> %88, splat (double 5.000000e-02)
  %.not80 = select <4 x i1> %67, <4 x i1> splat (i1 true), <4 x i1> %72
  %narrow = select <4 x i1> %.not80, <4 x i1> %89, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %90 = add <4 x i32> %vec.phi, %predphi
  %index.next77 = add nuw i64 %index74, 4
  %91 = icmp eq i64 %index.next77, 4092
  br i1 %91, label %scalar.ph71, label %vector.body73, !llvm.loop !49

scalar.ph71:                                      ; preds = %vector.body73
  %92 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %90)
  %arrayidx6.us.i = getelementptr inbounds nuw i8, ptr %arrayidx.us.i, i64 16372
  %93 = load float, ptr %arrayidx6.us.i, align 4, !tbaa !10
  %conv.us.i = fpext float %93 to double
  %arrayidx10.us.i = getelementptr inbounds nuw i8, ptr %arrayidx8.us.i, i64 16372
  %94 = load float, ptr %arrayidx10.us.i, align 4, !tbaa !10
  %conv11.us.i = fpext float %94 to double
  %cmp.i.i.us.i = fcmp olt double %conv.us.i, f0xB690000000000000
  %mul.i.i.us.i = fneg float %93
  %retval.0.i.i.us.i = select i1 %cmp.i.i.us.i, float %mul.i.i.us.i, float %93
  %conv1.i.us.i = fpext float %retval.0.i.i.us.i to double
  %cmp.i.us.i = fcmp olt double %conv1.i.us.i, 1.000000e-02
  br i1 %cmp.i.us.i, label %land.lhs.true.i.us.i, label %if.else.i.us.i

land.lhs.true.i.us.i:                             ; preds = %scalar.ph71
  %cmp.i14.i.us.i = fcmp olt double %conv11.us.i, f0xB690000000000000
  %mul.i15.i.us.i = fneg float %94
  %retval.0.i16.i.us.i = select i1 %cmp.i14.i.us.i, float %mul.i15.i.us.i, float %94
  %conv4.i.us.i = fpext float %retval.0.i16.i.us.i to double
  %cmp5.i.us.i = fcmp olt double %conv4.i.us.i, 1.000000e-02
  br i1 %cmp5.i.us.i, label %_Z11percentDiffdd.exit.us.i, label %if.else.i.us.i

if.else.i.us.i:                                   ; preds = %land.lhs.true.i.us.i, %scalar.ph71
  %95 = insertelement <2 x double> poison, double %conv.us.i, i64 0
  %96 = shufflevector <2 x double> %95, <2 x double> poison, <2 x i32> zeroinitializer
  %97 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv11.us.i, i64 0
  %98 = fsub <2 x double> %96, %97
  %99 = fptrunc <2 x double> %98 to <2 x float>
  %100 = fcmp olt <2 x double> %98, splat (double f0xB690000000000000)
  %101 = fneg <2 x float> %99
  %102 = select <2 x i1> %100, <2 x float> %101, <2 x float> %99
  %103 = extractelement <2 x float> %102, i64 0
  %104 = extractelement <2 x float> %102, i64 1
  %div.i.us.i = fdiv float %103, %104
  %cmp.i23.i.us.i = fcmp olt float %div.i.us.i, 0.000000e+00
  %mul.i24.i.us.i = fneg float %div.i.us.i
  %retval.0.i25.i.us.i = select i1 %cmp.i23.i.us.i, float %mul.i24.i.us.i, float %div.i.us.i
  %mul.i.us.i = fmul float %retval.0.i25.i.us.i, 1.000000e+02
  %105 = fpext float %mul.i.us.i to double
  %106 = fcmp ogt double %105, 5.000000e-02
  %107 = zext i1 %106 to i32
  br label %_Z11percentDiffdd.exit.us.i

_Z11percentDiffdd.exit.us.i:                      ; preds = %if.else.i.us.i, %land.lhs.true.i.us.i
  %retval.0.i.us.i = phi i32 [ %107, %if.else.i.us.i ], [ 0, %land.lhs.true.i.us.i ]
  %fail.2.us.i = add nsw i32 %retval.0.i.us.i, %92
  %arrayidx6.us.i.1 = getelementptr inbounds nuw i8, ptr %arrayidx.us.i, i64 16376
  %108 = load float, ptr %arrayidx6.us.i.1, align 4, !tbaa !10
  %conv.us.i.1 = fpext float %108 to double
  %arrayidx10.us.i.1 = getelementptr inbounds nuw i8, ptr %arrayidx8.us.i, i64 16376
  %109 = load float, ptr %arrayidx10.us.i.1, align 4, !tbaa !10
  %conv11.us.i.1 = fpext float %109 to double
  %cmp.i.i.us.i.1 = fcmp olt double %conv.us.i.1, f0xB690000000000000
  %mul.i.i.us.i.1 = fneg float %108
  %retval.0.i.i.us.i.1 = select i1 %cmp.i.i.us.i.1, float %mul.i.i.us.i.1, float %108
  %conv1.i.us.i.1 = fpext float %retval.0.i.i.us.i.1 to double
  %cmp.i.us.i.1 = fcmp olt double %conv1.i.us.i.1, 1.000000e-02
  br i1 %cmp.i.us.i.1, label %land.lhs.true.i.us.i.1, label %if.else.i.us.i.1

land.lhs.true.i.us.i.1:                           ; preds = %_Z11percentDiffdd.exit.us.i
  %cmp.i14.i.us.i.1 = fcmp olt double %conv11.us.i.1, f0xB690000000000000
  %mul.i15.i.us.i.1 = fneg float %109
  %retval.0.i16.i.us.i.1 = select i1 %cmp.i14.i.us.i.1, float %mul.i15.i.us.i.1, float %109
  %conv4.i.us.i.1 = fpext float %retval.0.i16.i.us.i.1 to double
  %cmp5.i.us.i.1 = fcmp olt double %conv4.i.us.i.1, 1.000000e-02
  br i1 %cmp5.i.us.i.1, label %_Z11percentDiffdd.exit.us.i.1, label %if.else.i.us.i.1

if.else.i.us.i.1:                                 ; preds = %land.lhs.true.i.us.i.1, %_Z11percentDiffdd.exit.us.i
  %110 = insertelement <2 x double> poison, double %conv.us.i.1, i64 0
  %111 = shufflevector <2 x double> %110, <2 x double> poison, <2 x i32> zeroinitializer
  %112 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv11.us.i.1, i64 0
  %113 = fsub <2 x double> %111, %112
  %114 = fptrunc <2 x double> %113 to <2 x float>
  %115 = fcmp olt <2 x double> %113, splat (double f0xB690000000000000)
  %116 = fneg <2 x float> %114
  %117 = select <2 x i1> %115, <2 x float> %116, <2 x float> %114
  %118 = extractelement <2 x float> %117, i64 0
  %119 = extractelement <2 x float> %117, i64 1
  %div.i.us.i.1 = fdiv float %118, %119
  %cmp.i23.i.us.i.1 = fcmp olt float %div.i.us.i.1, 0.000000e+00
  %mul.i24.i.us.i.1 = fneg float %div.i.us.i.1
  %retval.0.i25.i.us.i.1 = select i1 %cmp.i23.i.us.i.1, float %mul.i24.i.us.i.1, float %div.i.us.i.1
  %mul.i.us.i.1 = fmul float %retval.0.i25.i.us.i.1, 1.000000e+02
  %120 = fpext float %mul.i.us.i.1 to double
  %121 = fcmp ogt double %120, 5.000000e-02
  %122 = zext i1 %121 to i32
  br label %_Z11percentDiffdd.exit.us.i.1

_Z11percentDiffdd.exit.us.i.1:                    ; preds = %if.else.i.us.i.1, %land.lhs.true.i.us.i.1
  %retval.0.i.us.i.1 = phi i32 [ %122, %if.else.i.us.i.1 ], [ 0, %land.lhs.true.i.us.i.1 ]
  %fail.2.us.i.1 = add nsw i32 %retval.0.i.us.i.1, %fail.2.us.i
  %indvars.iv.next36.i = add nuw nsw i64 %indvars.iv35.i, 1
  %exitcond39.not.i = icmp eq i64 %indvars.iv.next36.i, 4095
  br i1 %exitcond39.not.i, label %_Z14compareResultsiiPA4096_fS0_.exit, label %for.cond1.preheader.us.i, !llvm.loop !27

_Z14compareResultsiiPA4096_fS0_.exit:             ; preds = %_Z11percentDiffdd.exit.us.i.1
  %call18.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %fail.2.us.i.1) #16
  call void @free(ptr noundef %0) #15
  call void @free(ptr noundef nonnull %3) #15
  call void @free(ptr noundef nonnull %6) #15
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #6 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #17
  store ptr null, ptr %newA.i, align 8, !tbaa !39
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #15
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !39
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !40
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_ZL7xmallocm.exit:                                ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i) #17
  ret ptr %0
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #11

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local void @_Z21polybench_flush_cachev() local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local void @_Z29polybench_prepare_instrumentsv() local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @gettimeofday(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #7

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #3

; Function Attrs: nofree nounwind
declare i32 @posix_memalign(ptr noundef, i64 noundef, i64 noundef) local_unnamed_addr #7

; Function Attrs: nofree noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #13

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #14

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #14

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { mustprogress nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #5 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #6 = { mustprogress nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #7 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #8 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #9 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #10 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #11 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #12 = { nofree noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #13 = { nofree nounwind }
attributes #14 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #15 = { nounwind "uniform-work-group-size" }
attributes #16 = { "uniform-work-group-size" }
attributes #17 = { nounwind }
attributes #18 = { cold }
attributes #19 = { cold noreturn nounwind "uniform-work-group-size" }

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
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !18, !19, !20}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = !{!"llvm.loop.unroll.runtime.disable"}
!21 = distinct !{!21, !18, !19}
!22 = distinct !{!22, !18}
!23 = distinct !{!23, !18}
!24 = distinct !{!24, !18}
!25 = distinct !{!25, !18, !19, !20}
!26 = distinct !{!26, !18, !20, !19}
!27 = distinct !{!27, !18}
!28 = !{!7, !7, i64 0}
!29 = !{!30, !30, i64 0}
!30 = !{!"p1 float", !31, i64 0}
!31 = !{!"any pointer", !8, i64 0}
!32 = !{!33, !34, i64 0}
!33 = !{!"_ZTS7timeval", !34, i64 0, !34, i64 8}
!34 = !{!"long", !8, i64 0}
!35 = !{!33, !34, i64 8}
!36 = !{!37, !37, i64 0}
!37 = !{!"double", !8, i64 0}
!38 = !{ptr @_Z35__device_stub__convolution2D_kerneliiPfS_}
!39 = !{!31, !31, i64 0}
!40 = !{!41, !41, i64 0}
!41 = !{!"p1 _ZTS8_IO_FILE", !31, i64 0}
!42 = !{!43}
!43 = distinct !{!43, !44}
!44 = distinct !{!44, !"LVerDomain"}
!45 = !{!46}
!46 = distinct !{!46, !44}
!47 = distinct !{!47, !18, !19, !20}
!48 = distinct !{!48, !18, !19}
!49 = distinct !{!49, !18, !19, !20}
