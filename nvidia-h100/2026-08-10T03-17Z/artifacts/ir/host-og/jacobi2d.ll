; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/JACOBI2D/jacobi2D.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/JACOBI2D/jacobi2D.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [74 x i8] c"Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\0A\00", align 1
@polybench_papi_counters_threadid = dso_local local_unnamed_addr global i32 0, align 4
@polybench_program_total_flops = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_t_start = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_t_end = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_c_start = dso_local local_unnamed_addr global i64 0, align 8
@polybench_c_end = dso_local local_unnamed_addr global i64 0, align 8
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.6f\0A\00", align 1
@.str.6 = private unnamed_addr constant [35 x i8] c"Error return from gettimeofday: %d\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.7 = private unnamed_addr constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1
@str = private unnamed_addr constant [21 x i8] c"GPU Time in seconds:\00", align 1
@str.8 = private unnamed_addr constant [21 x i8] c"CPU Time in seconds:\00", align 1

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

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable
define dso_local void @_Z10init_arrayiPA1000_fS0_(i32 noundef %n, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B) local_unnamed_addr #1 {
entry:
  %cmp31 = icmp sgt i32 %n, 0
  br i1 %cmp31, label %for.cond1.preheader.preheader, label %for.end17

for.cond1.preheader.preheader:                    ; preds = %entry
  %B42 = ptrtoaddr ptr %B to i64
  %A43 = ptrtoaddr ptr %A to i64
  %wide.trip.count40 = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 4
  %0 = sub i64 %A43, %B42
  %diff.check = icmp ugt i64 %0, -16
  %or.cond = or i1 %min.iters.check, %diff.check
  %n.vec = and i64 %wide.trip.count40, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count40
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc15_crit_edge
  %indvars.iv36 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next37, %for.cond1.for.inc15_crit_edge ]
  %1 = trunc nuw nsw i64 %indvars.iv36 to i32
  %conv = uitofp nneg i32 %1 to float
  %arrayidx = getelementptr inbounds nuw [4000 x i8], ptr %A, i64 %indvars.iv36
  %2 = trunc i64 %indvars.iv36 to i32
  %3 = add i32 %2, -4
  %conv7 = sitofp i32 %3 to float
  %arrayidx12 = getelementptr inbounds nuw [4000 x i8], ptr %B, i64 %indvars.iv36
  br i1 %or.cond, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert44 = insertelement <4 x float> poison, float %conv7, i64 0
  %broadcast.splat45 = shufflevector <4 x float> %broadcast.splatinsert44, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.ind46 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next47, %vector.body ]
  %4 = add <4 x i32> %vec.ind, splat (i32 2)
  %5 = uitofp nneg <4 x i32> %4 to <4 x float>
  %6 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %5, <4 x float> splat (float 1.000000e+01))
  %7 = fdiv <4 x float> %6, splat (float 1.000000e+03)
  %8 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  store <4 x float> %7, ptr %8, align 4, !tbaa !10
  %9 = add <4 x i32> %vec.ind46, splat (i32 -1)
  %10 = sitofp <4 x i32> %9 to <4 x float>
  %11 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat45, <4 x float> %10, <4 x float> splat (float 1.100000e+01))
  %12 = fdiv <4 x float> %11, splat (float 1.000000e+03)
  %13 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12, i64 %index
  store <4 x float> %12, ptr %13, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %vec.ind.next47 = add <4 x i32> %vec.ind46, splat (i32 4)
  %14 = icmp eq i64 %index.next, %n.vec
  br i1 %14, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc15_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader ], [ %n.vec, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %15 = trunc i64 %indvars.iv to i32
  %16 = add i32 %15, 2
  %conv4 = uitofp nneg i32 %16 to float
  %17 = tail call float @llvm.fmuladd.f32(float %conv, float %conv4, float 1.000000e+01)
  %div = fdiv float %17, 1.000000e+03
  %arrayidx6 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  store float %div, ptr %arrayidx6, align 4, !tbaa !10
  %18 = trunc i64 %indvars.iv to i32
  %19 = add i32 %18, -1
  %conv9 = sitofp i32 %19 to float
  %20 = tail call float @llvm.fmuladd.f32(float %conv7, float %conv9, float 1.100000e+01)
  %div10 = fdiv float %20, 1.000000e+03
  %arrayidx14 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12, i64 %indvars.iv
  store float %div10, ptr %arrayidx14, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count40
  br i1 %exitcond.not, label %for.cond1.for.inc15_crit_edge, label %for.body3, !llvm.loop !16

for.cond1.for.inc15_crit_edge:                    ; preds = %for.body3, %middle.block
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41.not = icmp eq i64 %indvars.iv.next37, %wide.trip.count40
  br i1 %exitcond41.not, label %for.end17, label %for.cond1.preheader, !llvm.loop !17

for.end17:                                        ; preds = %for.cond1.for.inc15_crit_edge, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z14runJacobi2DCpuiiPA1000_fS0_(i32 noundef %tsteps, i32 noundef %n, ptr nofree noundef captures(none) %A, ptr nofree noundef captures(none) %B) local_unnamed_addr #4 {
entry:
  %B130 = ptrtoaddr ptr %B to i64
  %A129 = ptrtoaddr ptr %A to i64
  %cmp109 = icmp sgt i32 %tsteps, 0
  %cmp2103 = icmp sgt i32 %n, 2
  %or.cond = and i1 %cmp109, %cmp2103
  br i1 %or.cond, label %for.cond1.preheader.us.us.preheader, label %for.cond.cleanup

for.cond1.preheader.us.us.preheader:              ; preds = %entry
  %sub = add nsw i32 %n, -1
  %wide.trip.count115 = zext i32 %sub to i64
  %scevgep = getelementptr i8, ptr %B, i64 4004
  %0 = mul nuw nsw i64 %wide.trip.count115, 4004
  %1 = getelementptr i8, ptr %B, i64 %0
  %scevgep133 = getelementptr i8, ptr %1, i64 -4000
  %scevgep134 = getelementptr i8, ptr %A, i64 4
  %scevgep135 = getelementptr i8, ptr %A, i64 %0
  %2 = add nsw i64 %wide.trip.count115, -1
  %min.iters.check137 = icmp ult i64 %2, 8
  %bound0 = icmp ult ptr %scevgep, %scevgep135
  %bound1 = icmp ult ptr %scevgep134, %scevgep133
  %found.conflict = and i1 %bound0, %bound1
  %n.vec140 = and i64 %2, -8
  %3 = or disjoint i64 %n.vec140, 1
  %cmp.n155 = icmp eq i64 %2, %n.vec140
  %4 = and i32 %n, 1
  %lcmp.mod.not = icmp eq i32 %4, 0
  %5 = add nsw i64 %wide.trip.count115, -1
  %6 = add nsw i64 %wide.trip.count115, -1
  %min.iters.check = icmp ult i64 %6, 8
  %7 = sub i64 %B130, %A129
  %diff.check = icmp ugt i64 %7, -32
  %or.cond157 = or i1 %min.iters.check, %diff.check
  %n.vec = and i64 %6, -8
  %8 = or disjoint i64 %n.vec, 1
  %cmp.n = icmp eq i64 %6, %n.vec
  br label %for.cond1.preheader.us.us

for.cond1.preheader.us.us:                        ; preds = %for.cond1.preheader.us.us.preheader, %for.cond43.for.cond.cleanup46_crit_edge.us.us
  %t.0110.us.us = phi i32 [ %inc69.us.us, %for.cond43.for.cond.cleanup46_crit_edge.us.us ], [ 0, %for.cond1.preheader.us.us.preheader ]
  br label %for.cond5.preheader.us.us

for.body9.us.us:                                  ; preds = %for.body9.us.us.prol.loopexit, %for.body9.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body9.us.us ], [ %indvars.iv.unr, %for.body9.us.us.prol.loopexit ]
  %arrayidx11.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us, i64 %indvars.iv
  %9 = load float, ptr %arrayidx11.us.us, align 4, !tbaa !10
  %arrayidx16.us.us = getelementptr i8, ptr %arrayidx11.us.us, i64 -4
  %10 = load float, ptr %arrayidx16.us.us, align 4, !tbaa !10
  %add.us.us = fadd float %9, %10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx21.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us, i64 %indvars.iv.next
  %11 = load float, ptr %arrayidx21.us.us, align 4, !tbaa !10
  %add22.us.us = fadd float %add.us.us, %11
  %arrayidx27.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.us.us, i64 %indvars.iv
  %12 = load float, ptr %arrayidx27.us.us, align 4, !tbaa !10
  %add28.us.us = fadd float %add22.us.us, %12
  %arrayidx33.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx31.us.us, i64 %indvars.iv
  %13 = load float, ptr %arrayidx33.us.us, align 4, !tbaa !10
  %add34.us.us = fadd float %add28.us.us, %13
  %mul.us.us = fmul float %add34.us.us, 2.000000e-01
  %arrayidx38.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx36.us.us, i64 %indvars.iv
  store float %mul.us.us, ptr %arrayidx38.us.us, align 4, !tbaa !10
  %arrayidx11.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us, i64 %indvars.iv.next
  %14 = load float, ptr %arrayidx11.us.us.1, align 4, !tbaa !10
  %arrayidx16.us.us.1 = getelementptr i8, ptr %arrayidx11.us.us.1, i64 -4
  %15 = load float, ptr %arrayidx16.us.us.1, align 4, !tbaa !10
  %add.us.us.1 = fadd float %14, %15
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx21.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us, i64 %indvars.iv.next.1
  %16 = load float, ptr %arrayidx21.us.us.1, align 4, !tbaa !10
  %add22.us.us.1 = fadd float %add.us.us.1, %16
  %arrayidx27.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.us.us, i64 %indvars.iv.next
  %17 = load float, ptr %arrayidx27.us.us.1, align 4, !tbaa !10
  %add28.us.us.1 = fadd float %add22.us.us.1, %17
  %arrayidx33.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx31.us.us, i64 %indvars.iv.next
  %18 = load float, ptr %arrayidx33.us.us.1, align 4, !tbaa !10
  %add34.us.us.1 = fadd float %add28.us.us.1, %18
  %mul.us.us.1 = fmul float %add34.us.us.1, 2.000000e-01
  %arrayidx38.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx36.us.us, i64 %indvars.iv.next
  store float %mul.us.us.1, ptr %arrayidx38.us.us.1, align 4, !tbaa !10
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count115
  br i1 %exitcond.not.1, label %for.cond5.for.cond.cleanup8_crit_edge.us.us, label %for.body9.us.us, !llvm.loop !18

for.body53.us.us:                                 ; preds = %for.body53.us.us.prol.loopexit, %for.body53.us.us
  %indvars.iv118 = phi i64 [ %indvars.iv.next119.3, %for.body53.us.us ], [ %indvars.iv118.unr, %for.body53.us.us.prol.loopexit ]
  %arrayidx57.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us, i64 %indvars.iv118
  %19 = load float, ptr %arrayidx57.us.us, align 4, !tbaa !10
  %arrayidx61.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us, i64 %indvars.iv118
  store float %19, ptr %arrayidx61.us.us, align 4, !tbaa !10
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %arrayidx57.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us, i64 %indvars.iv.next119
  %20 = load float, ptr %arrayidx57.us.us.1, align 4, !tbaa !10
  %arrayidx61.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us, i64 %indvars.iv.next119
  store float %20, ptr %arrayidx61.us.us.1, align 4, !tbaa !10
  %indvars.iv.next119.1 = add nuw nsw i64 %indvars.iv118, 2
  %arrayidx57.us.us.2 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us, i64 %indvars.iv.next119.1
  %21 = load float, ptr %arrayidx57.us.us.2, align 4, !tbaa !10
  %arrayidx61.us.us.2 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us, i64 %indvars.iv.next119.1
  store float %21, ptr %arrayidx61.us.us.2, align 4, !tbaa !10
  %indvars.iv.next119.2 = add nuw nsw i64 %indvars.iv118, 3
  %arrayidx57.us.us.3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us, i64 %indvars.iv.next119.2
  %22 = load float, ptr %arrayidx57.us.us.3, align 4, !tbaa !10
  %arrayidx61.us.us.3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us, i64 %indvars.iv.next119.2
  store float %22, ptr %arrayidx61.us.us.3, align 4, !tbaa !10
  %indvars.iv.next119.3 = add nuw nsw i64 %indvars.iv118, 4
  %exitcond122.not.3 = icmp eq i64 %indvars.iv.next119.3, %wide.trip.count115
  br i1 %exitcond122.not.3, label %for.cond49.for.cond.cleanup52_crit_edge.us.us, label %for.body53.us.us, !llvm.loop !19

for.cond49.preheader.us.us:                       ; preds = %for.cond5.for.cond.cleanup8_crit_edge.us.us, %for.cond49.for.cond.cleanup52_crit_edge.us.us
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.cond49.for.cond.cleanup52_crit_edge.us.us ], [ 1, %for.cond5.for.cond.cleanup8_crit_edge.us.us ]
  %arrayidx55.us.us = getelementptr inbounds nuw [4000 x i8], ptr %B, i64 %indvars.iv123
  %arrayidx59.us.us = getelementptr inbounds nuw [4000 x i8], ptr %A, i64 %indvars.iv123
  br i1 %or.cond157, label %for.body53.us.us.preheader, label %vector.body

vector.body:                                      ; preds = %for.cond49.preheader.us.us, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.cond49.preheader.us.us ]
  %23 = or disjoint i64 %index, 1
  %24 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us, i64 %23
  %25 = getelementptr inbounds nuw i8, ptr %24, i64 16
  %wide.load = load <4 x float>, ptr %24, align 4, !tbaa !10
  %wide.load131 = load <4 x float>, ptr %25, align 4, !tbaa !10
  %26 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us, i64 %23
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 16
  store <4 x float> %wide.load, ptr %26, align 4, !tbaa !10
  store <4 x float> %wide.load131, ptr %27, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %28 = icmp eq i64 %index.next, %n.vec
  br i1 %28, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond49.for.cond.cleanup52_crit_edge.us.us, label %for.body53.us.us.preheader

for.body53.us.us.preheader:                       ; preds = %for.cond49.preheader.us.us, %middle.block
  %indvars.iv118.ph = phi i64 [ 1, %for.cond49.preheader.us.us ], [ %8, %middle.block ]
  %29 = sub nsw i64 %wide.trip.count115, %indvars.iv118.ph
  %xtraiter158 = and i64 %29, 3
  %lcmp.mod159.not = icmp eq i64 %xtraiter158, 0
  br i1 %lcmp.mod159.not, label %for.body53.us.us.prol.loopexit, label %for.body53.us.us.prol

for.body53.us.us.prol:                            ; preds = %for.body53.us.us.preheader, %for.body53.us.us.prol
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %for.body53.us.us.prol ], [ %indvars.iv118.ph, %for.body53.us.us.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body53.us.us.prol ], [ 0, %for.body53.us.us.preheader ]
  %arrayidx57.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us, i64 %indvars.iv118.prol
  %30 = load float, ptr %arrayidx57.us.us.prol, align 4, !tbaa !10
  %arrayidx61.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us, i64 %indvars.iv118.prol
  store float %30, ptr %arrayidx61.us.us.prol, align 4, !tbaa !10
  %indvars.iv.next119.prol = add nuw nsw i64 %indvars.iv118.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter158
  br i1 %prol.iter.cmp.not, label %for.body53.us.us.prol.loopexit, label %for.body53.us.us.prol, !llvm.loop !21

for.body53.us.us.prol.loopexit:                   ; preds = %for.body53.us.us.prol, %for.body53.us.us.preheader
  %indvars.iv118.unr = phi i64 [ %indvars.iv118.ph, %for.body53.us.us.preheader ], [ %indvars.iv.next119.prol, %for.body53.us.us.prol ]
  %31 = sub nsw i64 %indvars.iv118.ph, %wide.trip.count115
  %32 = icmp ugt i64 %31, -4
  br i1 %32, label %for.cond49.for.cond.cleanup52_crit_edge.us.us, label %for.body53.us.us

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.cond.cleanup8_crit_edge.us.us, %for.cond1.preheader.us.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %for.cond5.for.cond.cleanup8_crit_edge.us.us ], [ 1, %for.cond1.preheader.us.us ]
  %arrayidx.us.us = getelementptr inbounds nuw [4000 x i8], ptr %A, i64 %indvars.iv112
  %arrayidx25.us.us = getelementptr inbounds nuw i8, ptr %arrayidx.us.us, i64 4000
  %arrayidx31.us.us = getelementptr i8, ptr %arrayidx.us.us, i64 -4000
  %arrayidx36.us.us = getelementptr inbounds nuw [4000 x i8], ptr %B, i64 %indvars.iv112
  %brmerge = select i1 %min.iters.check137, i1 true, i1 %found.conflict
  br i1 %brmerge, label %for.body9.us.us.preheader, label %vector.body141

vector.body141:                                   ; preds = %for.cond5.preheader.us.us, %vector.body141
  %index142 = phi i64 [ %index.next153, %vector.body141 ], [ 0, %for.cond5.preheader.us.us ]
  %33 = or disjoint i64 %index142, 1
  %34 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us, i64 %33
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 16
  %wide.load143 = load <4 x float>, ptr %34, align 4, !tbaa !10, !alias.scope !23
  %wide.load144 = load <4 x float>, ptr %35, align 4, !tbaa !10, !alias.scope !23
  %36 = getelementptr i8, ptr %34, i64 -4
  %37 = getelementptr i8, ptr %34, i64 12
  %wide.load145 = load <4 x float>, ptr %36, align 4, !tbaa !10, !alias.scope !23
  %wide.load146 = load <4 x float>, ptr %37, align 4, !tbaa !10, !alias.scope !23
  %38 = fadd <4 x float> %wide.load143, %wide.load145
  %39 = fadd <4 x float> %wide.load144, %wide.load146
  %40 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us, i64 %index142
  %41 = getelementptr inbounds nuw i8, ptr %40, i64 8
  %42 = getelementptr inbounds nuw i8, ptr %40, i64 24
  %wide.load147 = load <4 x float>, ptr %41, align 4, !tbaa !10, !alias.scope !23
  %wide.load148 = load <4 x float>, ptr %42, align 4, !tbaa !10, !alias.scope !23
  %43 = fadd <4 x float> %38, %wide.load147
  %44 = fadd <4 x float> %39, %wide.load148
  %45 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.us.us, i64 %33
  %46 = getelementptr inbounds nuw i8, ptr %45, i64 16
  %wide.load149 = load <4 x float>, ptr %45, align 4, !tbaa !10, !alias.scope !23
  %wide.load150 = load <4 x float>, ptr %46, align 4, !tbaa !10, !alias.scope !23
  %47 = fadd <4 x float> %43, %wide.load149
  %48 = fadd <4 x float> %44, %wide.load150
  %49 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx31.us.us, i64 %33
  %50 = getelementptr inbounds nuw i8, ptr %49, i64 16
  %wide.load151 = load <4 x float>, ptr %49, align 4, !tbaa !10, !alias.scope !23
  %wide.load152 = load <4 x float>, ptr %50, align 4, !tbaa !10, !alias.scope !23
  %51 = fadd <4 x float> %47, %wide.load151
  %52 = fadd <4 x float> %48, %wide.load152
  %53 = fmul <4 x float> %51, splat (float 2.000000e-01)
  %54 = fmul <4 x float> %52, splat (float 2.000000e-01)
  %55 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx36.us.us, i64 %33
  %56 = getelementptr inbounds nuw i8, ptr %55, i64 16
  store <4 x float> %53, ptr %55, align 4, !tbaa !10, !alias.scope !26, !noalias !23
  store <4 x float> %54, ptr %56, align 4, !tbaa !10, !alias.scope !26, !noalias !23
  %index.next153 = add nuw i64 %index142, 8
  %57 = icmp eq i64 %index.next153, %n.vec140
  br i1 %57, label %middle.block154, label %vector.body141, !llvm.loop !28

middle.block154:                                  ; preds = %vector.body141
  br i1 %cmp.n155, label %for.cond5.for.cond.cleanup8_crit_edge.us.us, label %for.body9.us.us.preheader

for.body9.us.us.preheader:                        ; preds = %for.cond5.preheader.us.us, %middle.block154
  %indvars.iv.ph = phi i64 [ %3, %middle.block154 ], [ 1, %for.cond5.preheader.us.us ]
  br i1 %lcmp.mod.not, label %for.body9.us.us.prol.loopexit, label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body9.us.us.preheader
  %arrayidx11.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us, i64 %indvars.iv.ph
  %58 = load float, ptr %arrayidx11.us.us.prol, align 4, !tbaa !10
  %arrayidx16.us.us.prol = getelementptr i8, ptr %arrayidx11.us.us.prol, i64 -4
  %59 = load float, ptr %arrayidx16.us.us.prol, align 4, !tbaa !10
  %add.us.us.prol = fadd float %58, %59
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  %arrayidx21.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us, i64 %indvars.iv.next.prol
  %60 = load float, ptr %arrayidx21.us.us.prol, align 4, !tbaa !10
  %add22.us.us.prol = fadd float %add.us.us.prol, %60
  %arrayidx27.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.us.us, i64 %indvars.iv.ph
  %61 = load float, ptr %arrayidx27.us.us.prol, align 4, !tbaa !10
  %add28.us.us.prol = fadd float %add22.us.us.prol, %61
  %arrayidx33.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx31.us.us, i64 %indvars.iv.ph
  %62 = load float, ptr %arrayidx33.us.us.prol, align 4, !tbaa !10
  %add34.us.us.prol = fadd float %add28.us.us.prol, %62
  %mul.us.us.prol = fmul float %add34.us.us.prol, 2.000000e-01
  %arrayidx38.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx36.us.us, i64 %indvars.iv.ph
  store float %mul.us.us.prol, ptr %arrayidx38.us.us.prol, align 4, !tbaa !10
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body9.us.us.prol, %for.body9.us.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body9.us.us.preheader ], [ %indvars.iv.next.prol, %for.body9.us.us.prol ]
  %63 = icmp eq i64 %indvars.iv.ph, %5
  br i1 %63, label %for.cond5.for.cond.cleanup8_crit_edge.us.us, label %for.body9.us.us

for.cond5.for.cond.cleanup8_crit_edge.us.us:      ; preds = %for.body9.us.us.prol.loopexit, %for.body9.us.us, %middle.block154
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond116.not = icmp eq i64 %indvars.iv.next113, %wide.trip.count115
  br i1 %exitcond116.not, label %for.cond49.preheader.us.us, label %for.cond5.preheader.us.us, !llvm.loop !29

for.cond49.for.cond.cleanup52_crit_edge.us.us:    ; preds = %for.body53.us.us.prol.loopexit, %for.body53.us.us, %middle.block
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond127.not = icmp eq i64 %indvars.iv.next124, %wide.trip.count115
  br i1 %exitcond127.not, label %for.cond43.for.cond.cleanup46_crit_edge.us.us, label %for.cond49.preheader.us.us, !llvm.loop !30

for.cond43.for.cond.cleanup46_crit_edge.us.us:    ; preds = %for.cond49.for.cond.cleanup52_crit_edge.us.us
  %inc69.us.us = add nuw nsw i32 %t.0110.us.us, 1
  %exitcond128.not = icmp eq i32 %inc69.us.us, %tsteps
  br i1 %exitcond128.not, label %for.cond.cleanup, label %for.cond1.preheader.us.us, !llvm.loop !31

for.cond.cleanup:                                 ; preds = %for.cond43.for.cond.cleanup46_crit_edge.us.us, %entry
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z36__device_stub__runJacobiCUDA_kernel1iPfS_(i32 noundef %n, ptr noundef %A, ptr noundef %B) #5 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !32
  store ptr %A, ptr %A.addr, align 8, !tbaa !33
  store ptr %B, ptr %B.addr, align 8, !tbaa !33
  %kernel_args1 = alloca [3 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %A.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %B.addr, ptr %1, align 16
  %2 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %3 = load i64, ptr %shmem_size, align 8
  %4 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z36__device_stub__runJacobiCUDA_kernel1iPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %3, ptr noundef %4)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z36__device_stub__runJacobiCUDA_kernel2iPfS_(i32 noundef %n, ptr noundef %A, ptr noundef %B) #5 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !32
  store ptr %A, ptr %A.addr, align 8, !tbaa !33
  store ptr %B, ptr %B.addr, align 8, !tbaa !33
  %kernel_args1 = alloca [3 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %A.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %B.addr, ptr %1, align 16
  %2 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %3 = load i64, ptr %shmem_size, align 8
  %4 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z36__device_stub__runJacobiCUDA_kernel2iPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %3, ptr noundef %4)
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiPA1000_fS0_S0_S0_(i32 noundef %n, ptr nofree noundef readonly captures(none) %a, ptr nofree noundef readonly captures(none) %a_outputFromGpu, ptr nofree noundef readonly captures(none) %b, ptr nofree noundef readonly captures(none) %b_outputFromGpu) local_unnamed_addr #6 {
entry:
  %cmp97 = icmp sgt i32 %n, 0
  br i1 %cmp97, label %for.cond1.preheader.us.preheader, label %for.end44

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count114 = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 4
  %n.vec = and i64 %wide.trip.count114, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count114
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc14_crit_edge.us
  %indvars.iv111 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next112, %for.cond1.for.inc14_crit_edge.us ]
  %fail.099.us = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [4000 x i8], ptr %a, i64 %indvars.iv111
  %arrayidx7.us = getelementptr inbounds nuw [4000 x i8], ptr %a_outputFromGpu, i64 %indvars.iv111
  br i1 %min.iters.check, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.us
  %0 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.099.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %0, %vector.ph ], [ %32, %vector.body ]
  %1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %index
  %wide.load = load <4 x float>, ptr %1, align 4, !tbaa !10
  %2 = fpext <4 x float> %wide.load to <4 x double>
  %3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us, i64 %index
  %wide.load127 = load <4 x float>, ptr %3, align 4, !tbaa !10
  %4 = fpext <4 x float> %wide.load127 to <4 x double>
  %5 = fcmp olt <4 x double> %2, splat (double f0xB690000000000000)
  %6 = fneg <4 x float> %wide.load
  %7 = select <4 x i1> %5, <4 x float> %6, <4 x float> %wide.load
  %8 = fpext <4 x float> %7 to <4 x double>
  %9 = fcmp uge <4 x double> %8, splat (double 1.000000e-02)
  %10 = fcmp olt <4 x double> %4, splat (double f0xB690000000000000)
  %11 = fneg <4 x float> %wide.load127
  %12 = select <4 x i1> %10, <4 x float> %11, <4 x float> %wide.load127
  %13 = fpext <4 x float> %12 to <4 x double>
  %14 = fcmp uge <4 x double> %13, splat (double 1.000000e-02)
  %15 = fsub <4 x double> %2, %4
  %16 = fptrunc <4 x double> %15 to <4 x float>
  %17 = fcmp olt <4 x double> %15, splat (double f0xB690000000000000)
  %18 = fneg <4 x float> %16
  %19 = select <4 x i1> %17, <4 x float> %18, <4 x float> %16
  %20 = fadd <4 x double> %2, splat (double f0x3E45798EE0000000)
  %21 = fptrunc <4 x double> %20 to <4 x float>
  %22 = fcmp olt <4 x double> %20, splat (double f0xB690000000000000)
  %23 = fneg <4 x float> %21
  %24 = select <4 x i1> %22, <4 x float> %23, <4 x float> %21
  %25 = fdiv <4 x float> %19, %24
  %26 = fcmp olt <4 x float> %25, zeroinitializer
  %27 = fneg <4 x float> %25
  %28 = select <4 x i1> %26, <4 x float> %27, <4 x float> %25
  %29 = fmul <4 x float> %28, splat (float 1.000000e+02)
  %30 = fpext <4 x float> %29 to <4 x double>
  %31 = fcmp ogt <4 x double> %30, splat (double 5.000000e-02)
  %.not145 = select <4 x i1> %9, <4 x i1> splat (i1 true), <4 x i1> %14
  %narrow = select <4 x i1> %.not145, <4 x i1> %31, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %32 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !36

middle.block:                                     ; preds = %vector.body
  %34 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %32)
  br i1 %cmp.n, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.cond1.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  %fail.196.us.ph = phi i32 [ %fail.099.us, %for.cond1.preheader.us ], [ %34, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %_Z11percentDiffdd.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %fail.196.us = phi i32 [ %fail.2.us, %_Z11percentDiffdd.exit.us ], [ %fail.196.us.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %indvars.iv
  %35 = load float, ptr %arrayidx5.us, align 4, !tbaa !10
  %conv.us = fpext float %35 to double
  %arrayidx9.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us, i64 %indvars.iv
  %36 = load float, ptr %arrayidx9.us, align 4, !tbaa !10
  %conv10.us = fpext float %36 to double
  %cmp.i.i.us = fcmp olt double %conv.us, f0xB690000000000000
  %mul.i.i.us = fneg float %35
  %retval.0.i.i.us = select i1 %cmp.i.i.us, float %mul.i.i.us, float %35
  %conv1.i.us = fpext float %retval.0.i.i.us to double
  %cmp.i.us = fcmp olt double %conv1.i.us, 1.000000e-02
  br i1 %cmp.i.us, label %land.lhs.true.i.us, label %if.else.i.us

land.lhs.true.i.us:                               ; preds = %for.body3.us
  %cmp.i14.i.us = fcmp olt double %conv10.us, f0xB690000000000000
  %mul.i15.i.us = fneg float %36
  %retval.0.i16.i.us = select i1 %cmp.i14.i.us, float %mul.i15.i.us, float %36
  %conv4.i.us = fpext float %retval.0.i16.i.us to double
  %cmp5.i.us = fcmp olt double %conv4.i.us, 1.000000e-02
  br i1 %cmp5.i.us, label %_Z11percentDiffdd.exit.us, label %if.else.i.us

if.else.i.us:                                     ; preds = %land.lhs.true.i.us, %for.body3.us
  %37 = insertelement <2 x double> poison, double %conv.us, i64 0
  %38 = shufflevector <2 x double> %37, <2 x double> poison, <2 x i32> zeroinitializer
  %39 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv10.us, i64 0
  %40 = fsub <2 x double> %38, %39
  %41 = fptrunc <2 x double> %40 to <2 x float>
  %42 = fcmp olt <2 x double> %40, splat (double f0xB690000000000000)
  %43 = fneg <2 x float> %41
  %44 = select <2 x i1> %42, <2 x float> %43, <2 x float> %41
  %45 = extractelement <2 x float> %44, i64 0
  %46 = extractelement <2 x float> %44, i64 1
  %div.i.us = fdiv float %45, %46
  %cmp.i23.i.us = fcmp olt float %div.i.us, 0.000000e+00
  %mul.i24.i.us = fneg float %div.i.us
  %retval.0.i25.i.us = select i1 %cmp.i23.i.us, float %mul.i24.i.us, float %div.i.us
  %mul.i.us = fmul float %retval.0.i25.i.us, 1.000000e+02
  %47 = fpext float %mul.i.us to double
  %48 = fcmp ogt double %47, 5.000000e-02
  %49 = zext i1 %48 to i32
  br label %_Z11percentDiffdd.exit.us

_Z11percentDiffdd.exit.us:                        ; preds = %if.else.i.us, %land.lhs.true.i.us
  %retval.0.i.us = phi i32 [ %49, %if.else.i.us ], [ 0, %land.lhs.true.i.us ]
  %fail.2.us = add nsw i32 %retval.0.i.us, %fail.196.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count114
  br i1 %exitcond.not, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us, !llvm.loop !37

for.cond1.for.inc14_crit_edge.us:                 ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %fail.2.us.lcssa = phi i32 [ %34, %middle.block ], [ %fail.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond115.not = icmp eq i64 %indvars.iv.next112, %wide.trip.count114
  br i1 %exitcond115.not, label %for.cond20.preheader.us.preheader, label %for.cond1.preheader.us, !llvm.loop !38

for.cond20.preheader.us.preheader:                ; preds = %for.cond1.for.inc14_crit_edge.us
  %wide.trip.count124 = zext nneg i32 %n to i64
  %min.iters.check129 = icmp ult i32 %n, 4
  %n.vec132 = and i64 %wide.trip.count114, 2147483644
  %cmp.n141 = icmp eq i64 %n.vec132, %wide.trip.count114
  br label %for.cond20.preheader.us

for.cond20.preheader.us:                          ; preds = %for.cond20.preheader.us.preheader, %for.cond20.for.inc42_crit_edge.us
  %indvars.iv121 = phi i64 [ 0, %for.cond20.preheader.us.preheader ], [ %indvars.iv.next122, %for.cond20.for.inc42_crit_edge.us ]
  %fail.3106.us = phi i32 [ %fail.2.us.lcssa, %for.cond20.preheader.us.preheader ], [ %fail.5.us.lcssa, %for.cond20.for.inc42_crit_edge.us ]
  %arrayidx24.us = getelementptr inbounds nuw [4000 x i8], ptr %b, i64 %indvars.iv121
  %arrayidx29.us = getelementptr inbounds nuw [4000 x i8], ptr %b_outputFromGpu, i64 %indvars.iv121
  br i1 %min.iters.check129, label %for.body22.us.preheader, label %vector.ph130

vector.ph130:                                     ; preds = %for.cond20.preheader.us
  %50 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.3106.us, i64 0
  br label %vector.body133

vector.body133:                                   ; preds = %vector.body133, %vector.ph130
  %index134 = phi i64 [ 0, %vector.ph130 ], [ %index.next139, %vector.body133 ]
  %vec.phi135 = phi <4 x i32> [ %50, %vector.ph130 ], [ %82, %vector.body133 ]
  %51 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx24.us, i64 %index134
  %wide.load136 = load <4 x float>, ptr %51, align 4, !tbaa !10
  %52 = fpext <4 x float> %wide.load136 to <4 x double>
  %53 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx29.us, i64 %index134
  %wide.load137 = load <4 x float>, ptr %53, align 4, !tbaa !10
  %54 = fpext <4 x float> %wide.load137 to <4 x double>
  %55 = fcmp olt <4 x double> %52, splat (double f0xB690000000000000)
  %56 = fneg <4 x float> %wide.load136
  %57 = select <4 x i1> %55, <4 x float> %56, <4 x float> %wide.load136
  %58 = fpext <4 x float> %57 to <4 x double>
  %59 = fcmp uge <4 x double> %58, splat (double 1.000000e-02)
  %60 = fcmp olt <4 x double> %54, splat (double f0xB690000000000000)
  %61 = fneg <4 x float> %wide.load137
  %62 = select <4 x i1> %60, <4 x float> %61, <4 x float> %wide.load137
  %63 = fpext <4 x float> %62 to <4 x double>
  %64 = fcmp uge <4 x double> %63, splat (double 1.000000e-02)
  %65 = fsub <4 x double> %52, %54
  %66 = fptrunc <4 x double> %65 to <4 x float>
  %67 = fcmp olt <4 x double> %65, splat (double f0xB690000000000000)
  %68 = fneg <4 x float> %66
  %69 = select <4 x i1> %67, <4 x float> %68, <4 x float> %66
  %70 = fadd <4 x double> %52, splat (double f0x3E45798EE0000000)
  %71 = fptrunc <4 x double> %70 to <4 x float>
  %72 = fcmp olt <4 x double> %70, splat (double f0xB690000000000000)
  %73 = fneg <4 x float> %71
  %74 = select <4 x i1> %72, <4 x float> %73, <4 x float> %71
  %75 = fdiv <4 x float> %69, %74
  %76 = fcmp olt <4 x float> %75, zeroinitializer
  %77 = fneg <4 x float> %75
  %78 = select <4 x i1> %76, <4 x float> %77, <4 x float> %75
  %79 = fmul <4 x float> %78, splat (float 1.000000e+02)
  %80 = fpext <4 x float> %79 to <4 x double>
  %81 = fcmp ogt <4 x double> %80, splat (double 5.000000e-02)
  %.not148 = select <4 x i1> %59, <4 x i1> splat (i1 true), <4 x i1> %64
  %narrow146 = select <4 x i1> %.not148, <4 x i1> %81, <4 x i1> zeroinitializer
  %predphi138 = zext <4 x i1> %narrow146 to <4 x i32>
  %82 = add <4 x i32> %vec.phi135, %predphi138
  %index.next139 = add nuw i64 %index134, 4
  %83 = icmp eq i64 %index.next139, %n.vec132
  br i1 %83, label %middle.block140, label %vector.body133, !llvm.loop !39

middle.block140:                                  ; preds = %vector.body133
  %84 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %82)
  br i1 %cmp.n141, label %for.cond20.for.inc42_crit_edge.us, label %for.body22.us.preheader

for.body22.us.preheader:                          ; preds = %for.cond20.preheader.us, %middle.block140
  %indvars.iv116.ph = phi i64 [ 0, %for.cond20.preheader.us ], [ %n.vec132, %middle.block140 ]
  %fail.4103.us.ph = phi i32 [ %fail.3106.us, %for.cond20.preheader.us ], [ %84, %middle.block140 ]
  br label %for.body22.us

for.body22.us:                                    ; preds = %for.body22.us.preheader, %_Z11percentDiffdd.exit93.us
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %_Z11percentDiffdd.exit93.us ], [ %indvars.iv116.ph, %for.body22.us.preheader ]
  %fail.4103.us = phi i32 [ %fail.5.us, %_Z11percentDiffdd.exit93.us ], [ %fail.4103.us.ph, %for.body22.us.preheader ]
  %arrayidx26.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx24.us, i64 %indvars.iv116
  %85 = load float, ptr %arrayidx26.us, align 4, !tbaa !10
  %conv27.us = fpext float %85 to double
  %arrayidx31.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx29.us, i64 %indvars.iv116
  %86 = load float, ptr %arrayidx31.us, align 4, !tbaa !10
  %conv32.us = fpext float %86 to double
  %cmp.i.i65.us = fcmp olt double %conv27.us, f0xB690000000000000
  %mul.i.i66.us = fneg float %85
  %retval.0.i.i67.us = select i1 %cmp.i.i65.us, float %mul.i.i66.us, float %85
  %conv1.i68.us = fpext float %retval.0.i.i67.us to double
  %cmp.i69.us = fcmp olt double %conv1.i68.us, 1.000000e-02
  br i1 %cmp.i69.us, label %land.lhs.true.i87.us, label %if.else.i70.us

land.lhs.true.i87.us:                             ; preds = %for.body22.us
  %cmp.i14.i88.us = fcmp olt double %conv32.us, f0xB690000000000000
  %mul.i15.i89.us = fneg float %86
  %retval.0.i16.i90.us = select i1 %cmp.i14.i88.us, float %mul.i15.i89.us, float %86
  %conv4.i91.us = fpext float %retval.0.i16.i90.us to double
  %cmp5.i92.us = fcmp olt double %conv4.i91.us, 1.000000e-02
  br i1 %cmp5.i92.us, label %_Z11percentDiffdd.exit93.us, label %if.else.i70.us

if.else.i70.us:                                   ; preds = %land.lhs.true.i87.us, %for.body22.us
  %87 = insertelement <2 x double> poison, double %conv27.us, i64 0
  %88 = shufflevector <2 x double> %87, <2 x double> poison, <2 x i32> zeroinitializer
  %89 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv32.us, i64 0
  %90 = fsub <2 x double> %88, %89
  %91 = fptrunc <2 x double> %90 to <2 x float>
  %92 = fcmp olt <2 x double> %90, splat (double f0xB690000000000000)
  %93 = fneg <2 x float> %91
  %94 = select <2 x i1> %92, <2 x float> %93, <2 x float> %91
  %95 = extractelement <2 x float> %94, i64 0
  %96 = extractelement <2 x float> %94, i64 1
  %div.i81.us = fdiv float %95, %96
  %cmp.i23.i82.us = fcmp olt float %div.i81.us, 0.000000e+00
  %mul.i24.i83.us = fneg float %div.i81.us
  %retval.0.i25.i84.us = select i1 %cmp.i23.i82.us, float %mul.i24.i83.us, float %div.i81.us
  %mul.i85.us = fmul float %retval.0.i25.i84.us, 1.000000e+02
  %97 = fpext float %mul.i85.us to double
  %98 = fcmp ogt double %97, 5.000000e-02
  %99 = zext i1 %98 to i32
  br label %_Z11percentDiffdd.exit93.us

_Z11percentDiffdd.exit93.us:                      ; preds = %if.else.i70.us, %land.lhs.true.i87.us
  %retval.0.i86.us = phi i32 [ %99, %if.else.i70.us ], [ 0, %land.lhs.true.i87.us ]
  %fail.5.us = add nsw i32 %retval.0.i86.us, %fail.4103.us
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond120.not = icmp eq i64 %indvars.iv.next117, %wide.trip.count124
  br i1 %exitcond120.not, label %for.cond20.for.inc42_crit_edge.us, label %for.body22.us, !llvm.loop !40

for.cond20.for.inc42_crit_edge.us:                ; preds = %_Z11percentDiffdd.exit93.us, %middle.block140
  %fail.5.us.lcssa = phi i32 [ %84, %middle.block140 ], [ %fail.5.us, %_Z11percentDiffdd.exit93.us ]
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond125.not = icmp eq i64 %indvars.iv.next122, %wide.trip.count124
  br i1 %exitcond125.not, label %for.end44, label %for.cond20.preheader.us, !llvm.loop !41

for.end44:                                        ; preds = %for.cond20.for.inc42_crit_edge.us, %entry
  %fail.3.lcssa = phi i32 [ 0, %entry ], [ %fail.5.us.lcssa, %for.cond20.for.inc42_crit_edge.us ]
  %call45 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %fail.3.lcssa) #14
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #7

; Function Attrs: mustprogress uwtable
define dso_local void @_Z15runJacobi2DCUDAiiPA1000_fS0_S0_S0_(i32 noundef %tsteps, i32 noundef %n, ptr noundef %A, ptr noundef %B, ptr noundef %A_outputFromGpu, ptr noundef %B_outputFromGpu) local_unnamed_addr #8 {
entry:
  %n.addr.i40 = alloca i32, align 4
  %A.addr.i41 = alloca ptr, align 8
  %B.addr.i42 = alloca ptr, align 8
  %grid_dim.i43 = alloca %struct.dim3, align 8
  %block_dim.i44 = alloca %struct.dim3, align 8
  %shmem_size.i45 = alloca i64, align 8
  %stream.i46 = alloca ptr, align 8
  %kernel_args1.i47 = alloca [3 x ptr], align 16
  %n.addr.i = alloca i32, align 4
  %A.addr.i = alloca ptr, align 8
  %B.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [3 x ptr], align 16
  %Tp.i.i30 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %Agpu = alloca ptr, align 8
  %Bgpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Agpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Bgpu) #15
  %call.i = call noundef i32 @cudaMalloc(ptr noundef nonnull %Agpu, i64 noundef 4000000) #14
  %call.i27 = call noundef i32 @cudaMalloc(ptr noundef nonnull %Bgpu, i64 noundef 4000000) #14
  %0 = load ptr, ptr %Agpu, align 8, !tbaa !33
  %call2 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 4000000, i32 noundef 1) #14
  %1 = load ptr, ptr %Bgpu, align 8, !tbaa !33
  %call3 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %B, i64 noundef 4000000, i32 noundef 1) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %call.i.i) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %2 = load i64, ptr %Tp.i.i, align 8, !tbaa !42
  %conv.i.i = sitofp i64 %2 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %3 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !45
  %conv2.i.i = sitofp i64 %3 to double
  %4 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %4, ptr @polybench_t_start, align 8, !tbaa !46
  %cmp60 = icmp sgt i32 %tsteps, 0
  br i1 %cmp60, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %_Z21polybench_timer_startv.exit
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %7 = getelementptr inbounds nuw i8, ptr %kernel_args1.i47, i64 8
  %8 = getelementptr inbounds nuw i8, ptr %kernel_args1.i47, i64 16
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i49 = getelementptr inbounds nuw i8, ptr %grid_dim.i43, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i52 = getelementptr inbounds nuw i8, ptr %block_dim.i44, i64 8
  br label %for.body

for.cond.cleanup:                                 ; preds = %kcall.end18, %_Z21polybench_timer_startv.exit
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i30) #15
  %call.i.i31 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i30, ptr noundef null) #16
  %cmp.not.i.i32 = icmp eq i32 %call.i.i31, 0
  br i1 %cmp.not.i.i32, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i33

if.then.i.i33:                                    ; preds = %for.cond.cleanup
  %call1.i.i34 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %call.i.i31) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %for.cond.cleanup, %if.then.i.i33
  %9 = load i64, ptr %Tp.i.i30, align 8, !tbaa !42
  %conv.i.i35 = sitofp i64 %9 to double
  %tv_usec.i.i36 = getelementptr inbounds nuw i8, ptr %Tp.i.i30, i64 8
  %10 = load i64, ptr %tv_usec.i.i36, align 8, !tbaa !45
  %conv2.i.i37 = sitofp i64 %10 to double
  %11 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i37, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i35)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i30) #15
  store double %11, ptr @polybench_t_end, align 8, !tbaa !46
  %12 = load double, ptr @polybench_t_start, align 8, !tbaa !46
  %sub.i = fsub double %11, %12
  %call.i38 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, double noundef %sub.i) #14
  %13 = load ptr, ptr %Agpu, align 8, !tbaa !33
  %call21 = call i32 @cudaMemcpy(ptr noundef %A_outputFromGpu, ptr noundef %13, i64 noundef 4000000, i32 noundef 2) #14
  %14 = load ptr, ptr %Bgpu, align 8, !tbaa !33
  %call22 = call i32 @cudaMemcpy(ptr noundef %B_outputFromGpu, ptr noundef %14, i64 noundef 4000000, i32 noundef 2) #14
  %15 = load ptr, ptr %Agpu, align 8, !tbaa !33
  %call23 = call i32 @cudaFree(ptr noundef %15) #14
  %16 = load ptr, ptr %Bgpu, align 8, !tbaa !33
  %call24 = call i32 @cudaFree(ptr noundef %16) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %Bgpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %Agpu) #15
  ret void

for.body:                                         ; preds = %for.body.lr.ph, %kcall.end18
  %t.061 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %kcall.end18 ]
  %call11 = call i32 @__cudaPushCallConfiguration(i64 536870912032, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool.not = icmp eq i32 %call11, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %for.body
  %17 = load ptr, ptr %Agpu, align 8, !tbaa !33
  %18 = load ptr, ptr %Bgpu, align 8, !tbaa !33
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %n, ptr %n.addr.i, align 4, !tbaa !32
  store ptr %17, ptr %A.addr.i, align 8, !tbaa !33
  store ptr %18, ptr %B.addr.i, align 8, !tbaa !33
  store ptr %n.addr.i, ptr %kernel_args1.i, align 16
  store ptr %A.addr.i, ptr %5, align 8
  store ptr %B.addr.i, ptr %6, align 16
  %19 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !48
  %20 = load i64, ptr %shmem_size.i, align 8
  %21 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i39 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z36__device_stub__runJacobiCUDA_kernel1iPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %20, ptr noundef %21), !inline_history !48
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %for.body
  %call12 = call i32 @cudaThreadSynchronize() #14
  %call15 = call i32 @__cudaPushCallConfiguration(i64 536870912032, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool16.not = icmp eq i32 %call15, 0
  br i1 %tobool16.not, label %kcall.configok17, label %kcall.end18

kcall.configok17:                                 ; preds = %kcall.end
  %22 = load ptr, ptr %Agpu, align 8, !tbaa !33
  %23 = load ptr, ptr %Bgpu, align 8, !tbaa !33
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i40)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i41)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i42)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i43)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i44)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i45)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i46)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i47)
  store i32 %n, ptr %n.addr.i40, align 4, !tbaa !32
  store ptr %22, ptr %A.addr.i41, align 8, !tbaa !33
  store ptr %23, ptr %B.addr.i42, align 8, !tbaa !33
  store ptr %n.addr.i40, ptr %kernel_args1.i47, align 16
  store ptr %A.addr.i41, ptr %7, align 8
  store ptr %B.addr.i42, ptr %8, align 16
  %24 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i43, ptr nonnull %block_dim.i44, ptr nonnull %shmem_size.i45, ptr nonnull %stream.i46), !inline_history !49
  %25 = load i64, ptr %shmem_size.i45, align 8
  %26 = load ptr, ptr %stream.i46, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i48 = load i64, ptr %grid_dim.i43, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i50 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i49, align 8
  %block_dim.coerce.sroa.0.0.copyload.i51 = load i64, ptr %block_dim.i44, align 8
  %block_dim.coerce.sroa.2.0.copyload.i53 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i52, align 8
  %call.i54 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z36__device_stub__runJacobiCUDA_kernel2iPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload.i48, i32 %grid_dim.coerce.sroa.2.0.copyload.i50, i64 %block_dim.coerce.sroa.0.0.copyload.i51, i32 %block_dim.coerce.sroa.2.0.copyload.i53, ptr noundef nonnull %kernel_args1.i47, i64 noundef %25, ptr noundef %26), !inline_history !49
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i40)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i41)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i42)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i43)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i44)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i45)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i46)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i47)
  br label %kcall.end18

kcall.end18:                                      ; preds = %kcall.configok17, %kcall.end
  %call19 = call i32 @cudaThreadSynchronize() #14
  %inc = add nuw nsw i32 %t.061, 1
  %exitcond.not = icmp eq i32 %inc, %tsteps
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !50
}

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #9

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #6 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #15
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #16
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %call.i) #14
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !42
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !45
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_start, align 8, !tbaa !46
  ret void
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #9

declare i32 @cudaThreadSynchronize() local_unnamed_addr #9

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #6 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #15
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #16
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %call.i) #14
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !42
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !45
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_end, align 8, !tbaa !46
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #6 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !46
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !46
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, double noundef %sub) #14
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #9

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #5 {
entry:
  %Tp.i.i58 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %newA.i.i46 = alloca ptr, align 8
  %newA.i.i39 = alloca ptr, align 8
  %newA.i.i32 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #15
  store ptr null, ptr %newA.i.i, align 8, !tbaa !51
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 4000000) #16
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !51
  %1 = ptrtoaddr ptr %0 to i64
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %2 = load ptr, ptr @stderr, align 8, !tbaa !52
  %3 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %2) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i32) #15
  store ptr null, ptr %newA.i.i32, align 8, !tbaa !51
  %call.i.i33 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i32, i64 noundef 32, i64 noundef 4000000) #16
  %4 = load ptr, ptr %newA.i.i32, align 8, !tbaa !51
  %5 = ptrtoaddr ptr %4 to i64
  %tobool.i.i34 = icmp eq ptr %4, null
  %tobool1.i.i35 = icmp ne i32 %call.i.i33, 0
  %or.cond.i.i36 = select i1 %tobool.i.i34, i1 true, i1 %tobool1.i.i35
  br i1 %or.cond.i.i36, label %if.then.i.i37, label %_Z20polybench_alloc_datayi.exit38

if.then.i.i37:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %6 = load ptr, ptr @stderr, align 8, !tbaa !52
  %7 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %6) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit38:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i32) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i39) #15
  store ptr null, ptr %newA.i.i39, align 8, !tbaa !51
  %call.i.i40 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i39, i64 noundef 32, i64 noundef 4000000) #16
  %8 = load ptr, ptr %newA.i.i39, align 8, !tbaa !51
  %tobool.i.i41 = icmp eq ptr %8, null
  %tobool1.i.i42 = icmp ne i32 %call.i.i40, 0
  %or.cond.i.i43 = select i1 %tobool.i.i41, i1 true, i1 %tobool1.i.i42
  br i1 %or.cond.i.i43, label %if.then.i.i44, label %_Z20polybench_alloc_datayi.exit45

if.then.i.i44:                                    ; preds = %_Z20polybench_alloc_datayi.exit38
  %9 = load ptr, ptr @stderr, align 8, !tbaa !52
  %10 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %9) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit45:                ; preds = %_Z20polybench_alloc_datayi.exit38
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i39) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i46) #15
  store ptr null, ptr %newA.i.i46, align 8, !tbaa !51
  %call.i.i47 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i46, i64 noundef 32, i64 noundef 4000000) #16
  %11 = load ptr, ptr %newA.i.i46, align 8, !tbaa !51
  %tobool.i.i48 = icmp eq ptr %11, null
  %tobool1.i.i49 = icmp ne i32 %call.i.i47, 0
  %or.cond.i.i50 = select i1 %tobool.i.i48, i1 true, i1 %tobool1.i.i49
  br i1 %or.cond.i.i50, label %if.then.i.i51, label %_Z20polybench_alloc_datayi.exit52

if.then.i.i51:                                    ; preds = %_Z20polybench_alloc_datayi.exit45
  %12 = load ptr, ptr @stderr, align 8, !tbaa !52
  %13 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %12) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit52:                ; preds = %_Z20polybench_alloc_datayi.exit45
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i46) #15
  %14 = sub i64 %1, %5
  %diff.check = icmp ugt i64 %14, -16
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc15_crit_edge.i, %_Z20polybench_alloc_datayi.exit52
  %indvars.iv36.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit52 ], [ %indvars.iv.next37.i, %for.cond1.for.inc15_crit_edge.i ]
  %15 = trunc i64 %indvars.iv36.i to i32
  %conv.i = uitofp nneg i32 %15 to float
  %arrayidx.i = getelementptr inbounds nuw [4000 x i8], ptr %0, i64 %indvars.iv36.i
  %16 = add i32 %15, -4
  %conv7.i = sitofp i32 %16 to float
  %arrayidx12.i = getelementptr inbounds nuw [4000 x i8], ptr %4, i64 %indvars.iv36.i
  br i1 %diff.check, label %for.body3.i.preheader, label %vector.ph

for.body3.i.preheader:                            ; preds = %for.cond1.preheader.i
  %17 = insertelement <2 x float> poison, float %conv.i, i64 0
  %18 = insertelement <2 x float> %17, float %conv7.i, i64 1
  br label %for.body3.i

vector.ph:                                        ; preds = %for.cond1.preheader.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert70 = insertelement <4 x float> poison, float %conv7.i, i64 0
  %broadcast.splat71 = shufflevector <4 x float> %broadcast.splatinsert70, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %19 = add <4 x i32> %vec.ind, splat (i32 2)
  %20 = uitofp nneg <4 x i32> %19 to <4 x float>
  %21 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %20, <4 x float> splat (float 1.000000e+01))
  %22 = fdiv <4 x float> %21, splat (float 1.000000e+03)
  %23 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  store <4 x float> %22, ptr %23, align 4, !tbaa !10
  %24 = add <4 x i32> %vec.ind, splat (i32 -1)
  %25 = sitofp <4 x i32> %24 to <4 x float>
  %26 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat71, <4 x float> %25, <4 x float> splat (float 1.100000e+01))
  %27 = fdiv <4 x float> %26, splat (float 1.000000e+03)
  %28 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.i, i64 %index
  store <4 x float> %27, ptr %28, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %29 = icmp eq i64 %index.next, 1000
  br i1 %29, label %for.cond1.for.inc15_crit_edge.i, label %vector.body, !llvm.loop !54

for.body3.i:                                      ; preds = %for.body3.i.preheader, %for.body3.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body3.i ], [ 0, %for.body3.i.preheader ]
  %30 = trunc i64 %indvars.iv.i to i32
  %arrayidx6.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %indvars.iv.i
  %31 = add i32 %30, -1
  %32 = add i32 %30, 2
  %conv9.i = sitofp i32 %31 to float
  %conv4.i = uitofp nneg i32 %32 to float
  %33 = insertelement <2 x float> poison, float %conv4.i, i64 0
  %34 = insertelement <2 x float> %33, float %conv9.i, i64 1
  %35 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %18, <2 x float> %34, <2 x float> <float 1.000000e+01, float 1.100000e+01>)
  %36 = fdiv <2 x float> %35, splat (float 1.000000e+03)
  %37 = extractelement <2 x float> %36, i64 0
  store float %37, ptr %arrayidx6.i, align 4, !tbaa !10
  %arrayidx14.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.i, i64 %indvars.iv.i
  %38 = extractelement <2 x float> %36, i64 1
  store float %38, ptr %arrayidx14.i, align 4, !tbaa !10
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.not.i, label %for.cond1.for.inc15_crit_edge.i, label %for.body3.i, !llvm.loop !55

for.cond1.for.inc15_crit_edge.i:                  ; preds = %vector.body, %for.body3.i
  %indvars.iv.next37.i = add nuw nsw i64 %indvars.iv36.i, 1
  %exitcond41.not.i = icmp eq i64 %indvars.iv.next37.i, 1000
  br i1 %exitcond41.not.i, label %_Z10init_arrayiPA1000_fS0_.exit, label %for.cond1.preheader.i, !llvm.loop !17

_Z10init_arrayiPA1000_fS0_.exit:                  ; preds = %for.cond1.for.inc15_crit_edge.i
  call void @_Z15runJacobi2DCUDAiiPA1000_fS0_S0_S0_(i32 noundef 20, i32 noundef 1000, ptr noundef nonnull %0, ptr noundef nonnull %4, ptr noundef nonnull %8, ptr noundef nonnull %11) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i53 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i53, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i54

if.then.i.i54:                                    ; preds = %_Z10init_arrayiPA1000_fS0_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %call.i.i53) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiPA1000_fS0_.exit, %if.then.i.i54
  %39 = load i64, ptr %Tp.i.i, align 8, !tbaa !42
  %conv.i.i = sitofp i64 %39 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %40 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !45
  %conv2.i.i = sitofp i64 %40 to double
  %41 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %41, ptr @polybench_t_start, align 8, !tbaa !46
  %scevgep = getelementptr i8, ptr %4, i64 4004
  %scevgep82 = getelementptr i8, ptr %4, i64 3995996
  %scevgep83 = getelementptr i8, ptr %0, i64 4
  %scevgep84 = getelementptr i8, ptr %0, i64 3999996
  %bound0 = icmp ult ptr %scevgep, %scevgep84
  %bound1 = icmp ult ptr %scevgep83, %scevgep82
  %found.conflict = and i1 %bound0, %bound1
  %42 = sub i64 %5, %1
  %diff.check73 = icmp ugt i64 %42, -32
  br label %for.cond1.preheader.us.us.i

for.cond1.preheader.us.us.i:                      ; preds = %for.cond43.for.cond.cleanup46_crit_edge.us.us.i, %_Z21polybench_timer_startv.exit
  %t.0110.us.us.i = phi i32 [ %inc69.us.us.i, %for.cond43.for.cond.cleanup46_crit_edge.us.us.i ], [ 0, %_Z21polybench_timer_startv.exit ]
  br label %for.cond5.preheader.us.us.i

for.body9.us.us.i:                                ; preds = %for.body9.us.us.i, %for.body9.us.us.i.preheader.new
  %indvars.iv.i55 = phi i64 [ %indvars.iv.i55.ph, %for.body9.us.us.i.preheader.new ], [ %indvars.iv.next.i56.1, %for.body9.us.us.i ]
  %arrayidx11.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us.i, i64 %indvars.iv.i55
  %43 = load float, ptr %arrayidx11.us.us.i, align 4, !tbaa !10
  %arrayidx16.us.us.i = getelementptr i8, ptr %arrayidx11.us.us.i, i64 -4
  %44 = load float, ptr %arrayidx16.us.us.i, align 4, !tbaa !10
  %add.us.us.i = fadd float %43, %44
  %indvars.iv.next.i56 = add nuw nsw i64 %indvars.iv.i55, 1
  %arrayidx21.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us.i, i64 %indvars.iv.next.i56
  %45 = load float, ptr %arrayidx21.us.us.i, align 4, !tbaa !10
  %add22.us.us.i = fadd float %add.us.us.i, %45
  %arrayidx27.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.us.us.i, i64 %indvars.iv.i55
  %46 = load float, ptr %arrayidx27.us.us.i, align 4, !tbaa !10
  %add28.us.us.i = fadd float %add22.us.us.i, %46
  %arrayidx33.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx31.us.us.i, i64 %indvars.iv.i55
  %47 = load float, ptr %arrayidx33.us.us.i, align 4, !tbaa !10
  %add34.us.us.i = fadd float %add28.us.us.i, %47
  %mul.us.us.i = fmul float %add34.us.us.i, 2.000000e-01
  %arrayidx38.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx36.us.us.i, i64 %indvars.iv.i55
  store float %mul.us.us.i, ptr %arrayidx38.us.us.i, align 4, !tbaa !10
  %arrayidx11.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us.i, i64 %indvars.iv.next.i56
  %48 = load float, ptr %arrayidx11.us.us.i.1, align 4, !tbaa !10
  %arrayidx16.us.us.i.1 = getelementptr i8, ptr %arrayidx11.us.us.i.1, i64 -4
  %49 = load float, ptr %arrayidx16.us.us.i.1, align 4, !tbaa !10
  %add.us.us.i.1 = fadd float %48, %49
  %indvars.iv.next.i56.1 = add nuw nsw i64 %indvars.iv.i55, 2
  %arrayidx21.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us.i, i64 %indvars.iv.next.i56.1
  %50 = load float, ptr %arrayidx21.us.us.i.1, align 4, !tbaa !10
  %add22.us.us.i.1 = fadd float %add.us.us.i.1, %50
  %arrayidx27.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.us.us.i, i64 %indvars.iv.next.i56
  %51 = load float, ptr %arrayidx27.us.us.i.1, align 4, !tbaa !10
  %add28.us.us.i.1 = fadd float %add22.us.us.i.1, %51
  %arrayidx33.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx31.us.us.i, i64 %indvars.iv.next.i56
  %52 = load float, ptr %arrayidx33.us.us.i.1, align 4, !tbaa !10
  %add34.us.us.i.1 = fadd float %add28.us.us.i.1, %52
  %mul.us.us.i.1 = fmul float %add34.us.us.i.1, 2.000000e-01
  %arrayidx38.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx36.us.us.i, i64 %indvars.iv.next.i56
  store float %mul.us.us.i.1, ptr %arrayidx38.us.us.i.1, align 4, !tbaa !10
  %exitcond.not.i57.1 = icmp eq i64 %indvars.iv.next.i56.1, 999
  br i1 %exitcond.not.i57.1, label %for.cond5.for.cond.cleanup8_crit_edge.us.us.i, label %for.body9.us.us.i, !llvm.loop !56

for.body53.us.us.i:                               ; preds = %for.body53.us.us.i.prol, %for.body53.us.us.i
  %indvars.iv118.i = phi i64 [ %indvars.iv.next119.i.3, %for.body53.us.us.i ], [ %indvars.iv.next119.i.prol, %for.body53.us.us.i.prol ]
  %arrayidx57.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us.i, i64 %indvars.iv118.i
  %53 = load float, ptr %arrayidx57.us.us.i, align 4, !tbaa !10
  %arrayidx61.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us.i, i64 %indvars.iv118.i
  store float %53, ptr %arrayidx61.us.us.i, align 4, !tbaa !10
  %indvars.iv.next119.i = add nuw nsw i64 %indvars.iv118.i, 1
  %arrayidx57.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us.i, i64 %indvars.iv.next119.i
  %54 = load float, ptr %arrayidx57.us.us.i.1, align 4, !tbaa !10
  %arrayidx61.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us.i, i64 %indvars.iv.next119.i
  store float %54, ptr %arrayidx61.us.us.i.1, align 4, !tbaa !10
  %indvars.iv.next119.i.1 = add nuw nsw i64 %indvars.iv118.i, 2
  %arrayidx57.us.us.i.2 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us.i, i64 %indvars.iv.next119.i.1
  %55 = load float, ptr %arrayidx57.us.us.i.2, align 4, !tbaa !10
  %arrayidx61.us.us.i.2 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us.i, i64 %indvars.iv.next119.i.1
  store float %55, ptr %arrayidx61.us.us.i.2, align 4, !tbaa !10
  %indvars.iv.next119.i.2 = add nuw nsw i64 %indvars.iv118.i, 3
  %arrayidx57.us.us.i.3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us.i, i64 %indvars.iv.next119.i.2
  %56 = load float, ptr %arrayidx57.us.us.i.3, align 4, !tbaa !10
  %arrayidx61.us.us.i.3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us.i, i64 %indvars.iv.next119.i.2
  store float %56, ptr %arrayidx61.us.us.i.3, align 4, !tbaa !10
  %indvars.iv.next119.i.3 = add nuw nsw i64 %indvars.iv118.i, 4
  %exitcond122.not.i.3 = icmp eq i64 %indvars.iv.next119.i.3, 999
  br i1 %exitcond122.not.i.3, label %for.cond49.for.cond.cleanup52_crit_edge.us.us.i, label %for.body53.us.us.i, !llvm.loop !57

for.cond49.preheader.us.us.i:                     ; preds = %for.cond5.for.cond.cleanup8_crit_edge.us.us.i, %for.cond49.for.cond.cleanup52_crit_edge.us.us.i
  %indvars.iv123.i = phi i64 [ %indvars.iv.next124.i, %for.cond49.for.cond.cleanup52_crit_edge.us.us.i ], [ 1, %for.cond5.for.cond.cleanup8_crit_edge.us.us.i ]
  %arrayidx55.us.us.i = getelementptr inbounds nuw [4000 x i8], ptr %4, i64 %indvars.iv123.i
  %arrayidx59.us.us.i = getelementptr inbounds nuw [4000 x i8], ptr %0, i64 %indvars.iv123.i
  br i1 %diff.check73, label %for.body53.us.us.i.prol.preheader, label %vector.body76

for.body53.us.us.i.prol.preheader:                ; preds = %for.cond49.preheader.us.us.i, %vector.body76
  %indvars.iv118.i.ph = phi i64 [ 1, %for.cond49.preheader.us.us.i ], [ 993, %vector.body76 ]
  br label %for.body53.us.us.i.prol

for.body53.us.us.i.prol:                          ; preds = %for.body53.us.us.i.prol, %for.body53.us.us.i.prol.preheader
  %indvars.iv118.i.prol = phi i64 [ %indvars.iv.next119.i.prol, %for.body53.us.us.i.prol ], [ %indvars.iv118.i.ph, %for.body53.us.us.i.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body53.us.us.i.prol ], [ 0, %for.body53.us.us.i.prol.preheader ]
  %arrayidx57.us.us.i.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us.i, i64 %indvars.iv118.i.prol
  %57 = load float, ptr %arrayidx57.us.us.i.prol, align 4, !tbaa !10
  %arrayidx61.us.us.i.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us.i, i64 %indvars.iv118.i.prol
  store float %57, ptr %arrayidx61.us.us.i.prol, align 4, !tbaa !10
  %indvars.iv.next119.i.prol = add nuw nsw i64 %indvars.iv118.i.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, 2
  br i1 %prol.iter.cmp.not, label %for.body53.us.us.i, label %for.body53.us.us.i.prol, !llvm.loop !58

vector.body76:                                    ; preds = %for.cond49.preheader.us.us.i, %vector.body76
  %index77 = phi i64 [ %index.next79.1, %vector.body76 ], [ 0, %for.cond49.preheader.us.us.i ]
  %58 = or disjoint i64 %index77, 1
  %59 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us.i, i64 %58
  %60 = getelementptr inbounds nuw i8, ptr %59, i64 16
  %wide.load = load <4 x float>, ptr %59, align 4, !tbaa !10
  %wide.load78 = load <4 x float>, ptr %60, align 4, !tbaa !10
  %61 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us.i, i64 %58
  %62 = getelementptr inbounds nuw i8, ptr %61, i64 16
  store <4 x float> %wide.load, ptr %61, align 4, !tbaa !10
  store <4 x float> %wide.load78, ptr %62, align 4, !tbaa !10
  %63 = or disjoint i64 %index77, 9
  %64 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx55.us.us.i, i64 %63
  %65 = getelementptr inbounds nuw i8, ptr %64, i64 16
  %wide.load.1 = load <4 x float>, ptr %64, align 4, !tbaa !10
  %wide.load78.1 = load <4 x float>, ptr %65, align 4, !tbaa !10
  %66 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx59.us.us.i, i64 %63
  %67 = getelementptr inbounds nuw i8, ptr %66, i64 16
  store <4 x float> %wide.load.1, ptr %66, align 4, !tbaa !10
  store <4 x float> %wide.load78.1, ptr %67, align 4, !tbaa !10
  %index.next79.1 = add nuw nsw i64 %index77, 16
  %68 = icmp eq i64 %index.next79.1, 992
  br i1 %68, label %for.body53.us.us.i.prol.preheader, label %vector.body76, !llvm.loop !59

for.cond5.preheader.us.us.i:                      ; preds = %for.cond5.for.cond.cleanup8_crit_edge.us.us.i, %for.cond1.preheader.us.us.i
  %indvars.iv112.i = phi i64 [ %indvars.iv.next113.i, %for.cond5.for.cond.cleanup8_crit_edge.us.us.i ], [ 1, %for.cond1.preheader.us.us.i ]
  %arrayidx.us.us.i = getelementptr inbounds nuw [4000 x i8], ptr %0, i64 %indvars.iv112.i
  %arrayidx25.us.us.i = getelementptr inbounds nuw i8, ptr %arrayidx.us.us.i, i64 4000
  %arrayidx31.us.us.i = getelementptr i8, ptr %arrayidx.us.us.i, i64 -4000
  %arrayidx36.us.us.i = getelementptr inbounds nuw [4000 x i8], ptr %4, i64 %indvars.iv112.i
  br i1 %found.conflict, label %for.body9.us.us.i.preheader.new, label %vector.body87

for.body9.us.us.i.preheader.new:                  ; preds = %vector.body87, %for.cond5.preheader.us.us.i
  %indvars.iv.i55.ph = phi i64 [ 1, %for.cond5.preheader.us.us.i ], [ 993, %vector.body87 ]
  br label %for.body9.us.us.i

vector.body87:                                    ; preds = %for.cond5.preheader.us.us.i, %vector.body87
  %index88 = phi i64 [ %index.next99, %vector.body87 ], [ 0, %for.cond5.preheader.us.us.i ]
  %69 = or disjoint i64 %index88, 1
  %70 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us.i, i64 %69
  %71 = getelementptr inbounds nuw i8, ptr %70, i64 16
  %wide.load89 = load <4 x float>, ptr %70, align 4, !tbaa !10, !alias.scope !60
  %wide.load90 = load <4 x float>, ptr %71, align 4, !tbaa !10, !alias.scope !60
  %72 = getelementptr i8, ptr %70, i64 -4
  %73 = getelementptr i8, ptr %70, i64 12
  %wide.load91 = load <4 x float>, ptr %72, align 4, !tbaa !10, !alias.scope !60
  %wide.load92 = load <4 x float>, ptr %73, align 4, !tbaa !10, !alias.scope !60
  %74 = fadd <4 x float> %wide.load89, %wide.load91
  %75 = fadd <4 x float> %wide.load90, %wide.load92
  %76 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.us.i, i64 %index88
  %77 = getelementptr inbounds nuw i8, ptr %76, i64 8
  %78 = getelementptr inbounds nuw i8, ptr %76, i64 24
  %wide.load93 = load <4 x float>, ptr %77, align 4, !tbaa !10, !alias.scope !60
  %wide.load94 = load <4 x float>, ptr %78, align 4, !tbaa !10, !alias.scope !60
  %79 = fadd <4 x float> %74, %wide.load93
  %80 = fadd <4 x float> %75, %wide.load94
  %81 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.us.us.i, i64 %69
  %82 = getelementptr inbounds nuw i8, ptr %81, i64 16
  %wide.load95 = load <4 x float>, ptr %81, align 4, !tbaa !10, !alias.scope !60
  %wide.load96 = load <4 x float>, ptr %82, align 4, !tbaa !10, !alias.scope !60
  %83 = fadd <4 x float> %79, %wide.load95
  %84 = fadd <4 x float> %80, %wide.load96
  %85 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx31.us.us.i, i64 %69
  %86 = getelementptr inbounds nuw i8, ptr %85, i64 16
  %wide.load97 = load <4 x float>, ptr %85, align 4, !tbaa !10, !alias.scope !60
  %wide.load98 = load <4 x float>, ptr %86, align 4, !tbaa !10, !alias.scope !60
  %87 = fadd <4 x float> %83, %wide.load97
  %88 = fadd <4 x float> %84, %wide.load98
  %89 = fmul <4 x float> %87, splat (float 2.000000e-01)
  %90 = fmul <4 x float> %88, splat (float 2.000000e-01)
  %91 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx36.us.us.i, i64 %69
  %92 = getelementptr inbounds nuw i8, ptr %91, i64 16
  store <4 x float> %89, ptr %91, align 4, !tbaa !10, !alias.scope !63, !noalias !60
  store <4 x float> %90, ptr %92, align 4, !tbaa !10, !alias.scope !63, !noalias !60
  %index.next99 = add nuw i64 %index88, 8
  %93 = icmp eq i64 %index.next99, 992
  br i1 %93, label %for.body9.us.us.i.preheader.new, label %vector.body87, !llvm.loop !65

for.cond5.for.cond.cleanup8_crit_edge.us.us.i:    ; preds = %for.body9.us.us.i
  %indvars.iv.next113.i = add nuw nsw i64 %indvars.iv112.i, 1
  %exitcond116.not.i = icmp eq i64 %indvars.iv.next113.i, 999
  br i1 %exitcond116.not.i, label %for.cond49.preheader.us.us.i, label %for.cond5.preheader.us.us.i, !llvm.loop !29

for.cond49.for.cond.cleanup52_crit_edge.us.us.i:  ; preds = %for.body53.us.us.i
  %indvars.iv.next124.i = add nuw nsw i64 %indvars.iv123.i, 1
  %exitcond127.not.i = icmp eq i64 %indvars.iv.next124.i, 999
  br i1 %exitcond127.not.i, label %for.cond43.for.cond.cleanup46_crit_edge.us.us.i, label %for.cond49.preheader.us.us.i, !llvm.loop !30

for.cond43.for.cond.cleanup46_crit_edge.us.us.i:  ; preds = %for.cond49.for.cond.cleanup52_crit_edge.us.us.i
  %inc69.us.us.i = add nuw nsw i32 %t.0110.us.us.i, 1
  %exitcond128.not.i = icmp eq i32 %inc69.us.us.i, 20
  br i1 %exitcond128.not.i, label %_Z14runJacobi2DCpuiiPA1000_fS0_.exit, label %for.cond1.preheader.us.us.i, !llvm.loop !31

_Z14runJacobi2DCpuiiPA1000_fS0_.exit:             ; preds = %for.cond43.for.cond.cleanup46_crit_edge.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.8)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i58) #15
  %call.i.i59 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i58, ptr noundef null) #16
  %cmp.not.i.i60 = icmp eq i32 %call.i.i59, 0
  br i1 %cmp.not.i.i60, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i61

if.then.i.i61:                                    ; preds = %_Z14runJacobi2DCpuiiPA1000_fS0_.exit
  %call1.i.i62 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %call.i.i59) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z14runJacobi2DCpuiiPA1000_fS0_.exit, %if.then.i.i61
  %94 = load i64, ptr %Tp.i.i58, align 8, !tbaa !42
  %conv.i.i63 = sitofp i64 %94 to double
  %tv_usec.i.i64 = getelementptr inbounds nuw i8, ptr %Tp.i.i58, i64 8
  %95 = load i64, ptr %tv_usec.i.i64, align 8, !tbaa !45
  %conv2.i.i65 = sitofp i64 %95 to double
  %96 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i65, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i63)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i58) #15
  store double %96, ptr @polybench_t_end, align 8, !tbaa !46
  %97 = load double, ptr @polybench_t_start, align 8, !tbaa !46
  %sub.i = fsub double %96, %97
  %call.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, double noundef %sub.i) #14
  call void @_Z14compareResultsiPA1000_fS0_S0_S0_(i32 noundef 1000, ptr noundef nonnull %0, ptr noundef nonnull %8, ptr noundef nonnull %4, ptr noundef nonnull %11) #14
  call void @free(ptr noundef nonnull %0) #16
  call void @free(ptr noundef %8) #16
  call void @free(ptr noundef nonnull %4) #16
  call void @free(ptr noundef %11) #16
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #6 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #15
  store ptr null, ptr %newA.i, align 8, !tbaa !51
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #16
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !51
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !52
  %2 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %1) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_ZL7xmallocm.exit:                                ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i) #15
  ret ptr %0
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #10

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
declare void @exit(i32 noundef) local_unnamed_addr #11

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #12

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #13

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #5 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #6 = { mustprogress nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #7 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #8 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #9 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #10 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #11 = { nofree noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #12 = { nofree nounwind }
attributes #13 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #14 = { "uniform-work-group-size" }
attributes #15 = { nounwind }
attributes #16 = { nounwind "uniform-work-group-size" }
attributes #17 = { cold }
attributes #18 = { cold noreturn nounwind "uniform-work-group-size" }

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
!12 = distinct !{!12, !13, !14, !15}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.isvectorized", i32 1}
!15 = !{!"llvm.loop.unroll.runtime.disable"}
!16 = distinct !{!16, !13, !14}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !13, !14}
!19 = distinct !{!19, !13, !14}
!20 = distinct !{!20, !13, !14, !15}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.unroll.disable"}
!23 = !{!24}
!24 = distinct !{!24, !25}
!25 = distinct !{!25, !"LVerDomain"}
!26 = !{!27}
!27 = distinct !{!27, !25}
!28 = distinct !{!28, !13, !14, !15}
!29 = distinct !{!29, !13}
!30 = distinct !{!30, !13}
!31 = distinct !{!31, !13}
!32 = !{!7, !7, i64 0}
!33 = !{!34, !34, i64 0}
!34 = !{!"p1 float", !35, i64 0}
!35 = !{!"any pointer", !8, i64 0}
!36 = distinct !{!36, !13, !14, !15}
!37 = distinct !{!37, !13, !15, !14}
!38 = distinct !{!38, !13}
!39 = distinct !{!39, !13, !14, !15}
!40 = distinct !{!40, !13, !15, !14}
!41 = distinct !{!41, !13}
!42 = !{!43, !44, i64 0}
!43 = !{!"_ZTS7timeval", !44, i64 0, !44, i64 8}
!44 = !{!"long", !8, i64 0}
!45 = !{!43, !44, i64 8}
!46 = !{!47, !47, i64 0}
!47 = !{!"double", !8, i64 0}
!48 = !{ptr @_Z36__device_stub__runJacobiCUDA_kernel1iPfS_}
!49 = !{ptr @_Z36__device_stub__runJacobiCUDA_kernel2iPfS_}
!50 = distinct !{!50, !13}
!51 = !{!35, !35, i64 0}
!52 = !{!53, !53, i64 0}
!53 = !{!"p1 _ZTS8_IO_FILE", !35, i64 0}
!54 = distinct !{!54, !13, !14, !15}
!55 = distinct !{!55, !13, !14}
!56 = distinct !{!56, !13, !14}
!57 = distinct !{!57, !13, !14}
!58 = distinct !{!58, !22}
!59 = distinct !{!59, !13, !14, !15}
!60 = !{!61}
!61 = distinct !{!61, !62}
!62 = distinct !{!62, !"LVerDomain"}
!63 = !{!64}
!64 = distinct !{!64, !62}
!65 = distinct !{!65, !13, !14, !15}
