; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GEMM/gemm.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GEMM/gemm.cu"
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
define dso_local void @_Z4gemmiiiffPA512_fS0_S0_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, float noundef %alpha, float noundef %beta, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef captures(none) %C) local_unnamed_addr #1 {
entry:
  %cmp45 = icmp sgt i32 %ni, 0
  %cmp243 = icmp sgt i32 %nj, 0
  %or.cond = and i1 %cmp45, %cmp243
  br i1 %or.cond, label %for.cond1.preheader.lr.ph.split, label %for.end28

for.cond1.preheader.lr.ph.split:                  ; preds = %entry
  %cmp741 = icmp sgt i32 %nk, 0
  %wide.trip.count69 = zext nneg i32 %ni to i64
  %wide.trip.count64 = zext nneg i32 %nj to i64
  br i1 %cmp741, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph.split
  %min.iters.check = icmp ult i32 %nj, 8
  %n.vec = and i64 %wide.trip.count64, 2147483640
  %broadcast.splatinsert = insertelement <4 x float> poison, float %beta, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count64
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph.split
  %wide.trip.count59 = zext nneg i32 %nk to i64
  %xtraiter = and i64 %wide.trip.count59, 1
  %0 = icmp eq i32 %nk, 1
  %unroll_iter = and i64 %wide.trip.count59, 2147483646
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod75 = trunc i32 %nk to i1
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc26_crit_edge.split.us.us
  %indvars.iv66 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next67, %for.cond1.for.inc26_crit_edge.split.us.us ]
  %arrayidx.us = getelementptr inbounds nuw [2048 x i8], ptr %C, i64 %indvars.iv66
  %arrayidx10.us = getelementptr inbounds nuw [2048 x i8], ptr %A, i64 %indvars.iv66
  br label %for.body3.us.us

for.body3.us.us:                                  ; preds = %for.cond6.for.inc23_crit_edge.us.us, %for.cond1.preheader.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.cond6.for.inc23_crit_edge.us.us ], [ 0, %for.cond1.preheader.us ]
  %arrayidx5.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %indvars.iv61
  %1 = load float, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %mul.us.us = fmul float %beta, %1
  store float %mul.us.us, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %invariant.gep.us.us = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv61
  br i1 %0, label %for.body8.us.us.epil.preheader, label %for.body8.us.us

for.body8.us.us:                                  ; preds = %for.body3.us.us, %for.body8.us.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.1, %for.body8.us.us ], [ 0, %for.body3.us.us ]
  %2 = phi float [ %8, %for.body8.us.us ], [ %mul.us.us, %for.body3.us.us ]
  %niter = phi i64 [ %niter.next.1, %for.body8.us.us ], [ 0, %for.body3.us.us ]
  %arrayidx12.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us, i64 %indvars.iv56
  %3 = load float, ptr %arrayidx12.us.us, align 4, !tbaa !10
  %mul13.us.us = fmul float %alpha, %3
  %gep.us.us = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv56
  %4 = load float, ptr %gep.us.us, align 4, !tbaa !10
  %5 = tail call float @llvm.fmuladd.f32(float %mul13.us.us, float %4, float %2)
  store float %5, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %indvars.iv.next57 = or disjoint i64 %indvars.iv56, 1
  %arrayidx12.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us, i64 %indvars.iv.next57
  %6 = load float, ptr %arrayidx12.us.us.1, align 4, !tbaa !10
  %mul13.us.us.1 = fmul float %alpha, %6
  %gep.us.us.1 = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv.next57
  %7 = load float, ptr %gep.us.us.1, align 4, !tbaa !10
  %8 = tail call float @llvm.fmuladd.f32(float %mul13.us.us.1, float %7, float %5)
  store float %8, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %indvars.iv.next57.1 = add nuw nsw i64 %indvars.iv56, 2
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %for.cond6.for.inc23_crit_edge.us.us.unr-lcssa, label %for.body8.us.us, !llvm.loop !12

for.cond6.for.inc23_crit_edge.us.us.unr-lcssa:    ; preds = %for.body8.us.us
  br i1 %lcmp.mod.not, label %for.cond6.for.inc23_crit_edge.us.us, label %for.body8.us.us.epil.preheader

for.body8.us.us.epil.preheader:                   ; preds = %for.cond6.for.inc23_crit_edge.us.us.unr-lcssa, %for.body3.us.us
  %indvars.iv56.epil.init = phi i64 [ 0, %for.body3.us.us ], [ %indvars.iv.next57.1, %for.cond6.for.inc23_crit_edge.us.us.unr-lcssa ]
  %.epil.init = phi float [ %mul.us.us, %for.body3.us.us ], [ %8, %for.cond6.for.inc23_crit_edge.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod75)
  %arrayidx12.us.us.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us, i64 %indvars.iv56.epil.init
  %9 = load float, ptr %arrayidx12.us.us.epil, align 4, !tbaa !10
  %mul13.us.us.epil = fmul float %alpha, %9
  %gep.us.us.epil = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv56.epil.init
  %10 = load float, ptr %gep.us.us.epil, align 4, !tbaa !10
  %11 = tail call float @llvm.fmuladd.f32(float %mul13.us.us.epil, float %10, float %.epil.init)
  store float %11, ptr %arrayidx5.us.us, align 4, !tbaa !10
  br label %for.cond6.for.inc23_crit_edge.us.us

for.cond6.for.inc23_crit_edge.us.us:              ; preds = %for.cond6.for.inc23_crit_edge.us.us.unr-lcssa, %for.body8.us.us.epil.preheader
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond65.not = icmp eq i64 %indvars.iv.next62, %wide.trip.count64
  br i1 %exitcond65.not, label %for.cond1.for.inc26_crit_edge.split.us.us, label %for.body3.us.us, !llvm.loop !14

for.cond1.for.inc26_crit_edge.split.us.us:        ; preds = %for.cond6.for.inc23_crit_edge.us.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond70.not = icmp eq i64 %indvars.iv.next67, %wide.trip.count69
  br i1 %exitcond70.not, label %for.end28, label %for.cond1.preheader.us, !llvm.loop !15

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc26_crit_edge.split
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.cond1.for.inc26_crit_edge.split ], [ 0, %for.cond1.preheader.preheader ]
  %arrayidx = getelementptr inbounds nuw [2048 x i8], ptr %C, i64 %indvars.iv51
  br i1 %min.iters.check, label %for.body3.preheader, label %vector.body

vector.body:                                      ; preds = %for.cond1.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.cond1.preheader ]
  %12 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  %13 = getelementptr inbounds nuw i8, ptr %12, i64 16
  %wide.load = load <4 x float>, ptr %12, align 4, !tbaa !10
  %wide.load73 = load <4 x float>, ptr %13, align 4, !tbaa !10
  %14 = fmul <4 x float> %broadcast.splat, %wide.load
  %15 = fmul <4 x float> %broadcast.splat, %wide.load73
  store <4 x float> %14, ptr %12, align 4, !tbaa !10
  store <4 x float> %15, ptr %13, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc26_crit_edge.split, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader ], [ %n.vec, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  %17 = load float, ptr %arrayidx5, align 4, !tbaa !10
  %mul = fmul float %beta, %17
  store float %mul, ptr %arrayidx5, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count64
  br i1 %exitcond.not, label %for.cond1.for.inc26_crit_edge.split, label %for.body3, !llvm.loop !19

for.cond1.for.inc26_crit_edge.split:              ; preds = %for.body3, %middle.block
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond55.not = icmp eq i64 %indvars.iv.next52, %wide.trip.count69
  br i1 %exitcond55.not, label %for.end28, label %for.cond1.preheader, !llvm.loop !15

for.end28:                                        ; preds = %for.cond1.for.inc26_crit_edge.split, %for.cond1.for.inc26_crit_edge.split.us.us, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable
define dso_local void @_Z4initiiiPfS_PA512_fS1_S1_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %alpha, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %beta, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B, ptr nofree noundef writeonly captures(none) %C) local_unnamed_addr #4 {
entry:
  store float 3.241200e+04, ptr %alpha, align 4, !tbaa !10
  store float 2.123000e+03, ptr %beta, align 4, !tbaa !10
  %cmp77 = icmp sgt i32 %ni, 0
  %cmp275 = icmp sgt i32 %nk, 0
  %or.cond = and i1 %cmp77, %cmp275
  br i1 %or.cond, label %for.cond1.preheader.preheader, label %for.cond10.preheader

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count93 = zext nneg i32 %ni to i64
  %wide.trip.count = zext nneg i32 %nk to i64
  %min.iters.check = icmp ult i32 %nk, 8
  %n.vec = and i64 %wide.trip.count, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc7_crit_edge
  %indvars.iv90 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next91, %for.cond1.for.inc7_crit_edge ]
  %0 = trunc nuw nsw i64 %indvars.iv90 to i32
  %conv = uitofp nneg i32 %0 to float
  %arrayidx = getelementptr inbounds nuw [2048 x i8], ptr %A, i64 %indvars.iv90
  br i1 %min.iters.check, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %1 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %2 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %3 = fmul nnan <4 x float> %broadcast.splat, %1
  %4 = fmul nnan <4 x float> %broadcast.splat, %2
  %5 = fmul nnan <4 x float> %3, splat (float f0x3B000000)
  %6 = fmul nnan <4 x float> %4, splat (float f0x3B000000)
  %7 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 16
  store <4 x float> %5, ptr %7, align 4, !tbaa !10
  store <4 x float> %6, ptr %8, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc7_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader ], [ %n.vec, %middle.block ]
  br label %for.body3

for.cond10.preheader:                             ; preds = %for.cond1.for.inc7_crit_edge, %entry
  %cmp1479 = icmp sgt i32 %nj, 0
  %or.cond87 = and i1 %cmp275, %cmp1479
  br i1 %or.cond87, label %for.cond13.preheader.preheader, label %for.cond30.preheader

for.cond13.preheader.preheader:                   ; preds = %for.cond10.preheader
  %wide.trip.count103 = zext nneg i32 %nk to i64
  %wide.trip.count98 = zext nneg i32 %nj to i64
  %min.iters.check116 = icmp ult i32 %nj, 8
  %n.vec119 = and i64 %wide.trip.count98, 2147483640
  %cmp.n129 = icmp eq i64 %n.vec119, %wide.trip.count98
  br label %for.cond13.preheader

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %10 = trunc nuw nsw i64 %indvars.iv to i32
  %conv4 = uitofp nneg i32 %10 to float
  %mul = fmul nnan float %conv, %conv4
  %div = fmul nnan float %mul, f0x3B000000
  %arrayidx6 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  store float %div, ptr %arrayidx6, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc7_crit_edge, label %for.body3, !llvm.loop !21

for.cond1.for.inc7_crit_edge:                     ; preds = %for.body3, %middle.block
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %exitcond94.not = icmp eq i64 %indvars.iv.next91, %wide.trip.count93
  br i1 %exitcond94.not, label %for.cond10.preheader, label %for.cond1.preheader, !llvm.loop !22

for.cond13.preheader:                             ; preds = %for.cond13.preheader.preheader, %for.cond13.for.inc27_crit_edge
  %indvars.iv100 = phi i64 [ 0, %for.cond13.preheader.preheader ], [ %indvars.iv.next101, %for.cond13.for.inc27_crit_edge ]
  %11 = trunc nuw nsw i64 %indvars.iv100 to i32
  %conv16 = uitofp nneg i32 %11 to float
  %arrayidx21 = getelementptr inbounds nuw [2048 x i8], ptr %B, i64 %indvars.iv100
  br i1 %min.iters.check116, label %for.body15.preheader, label %vector.ph117

vector.ph117:                                     ; preds = %for.cond13.preheader
  %broadcast.splatinsert120 = insertelement <4 x float> poison, float %conv16, i64 0
  %broadcast.splat121 = shufflevector <4 x float> %broadcast.splatinsert120, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body122

vector.body122:                                   ; preds = %vector.body122, %vector.ph117
  %index123 = phi i64 [ 0, %vector.ph117 ], [ %index.next126, %vector.body122 ]
  %vec.ind124 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph117 ], [ %vec.ind.next127, %vector.body122 ]
  %step.add125 = add <4 x i32> %vec.ind124, splat (i32 4)
  %12 = uitofp nneg <4 x i32> %vec.ind124 to <4 x float>
  %13 = uitofp nneg <4 x i32> %step.add125 to <4 x float>
  %14 = fmul nnan <4 x float> %broadcast.splat121, %12
  %15 = fmul nnan <4 x float> %broadcast.splat121, %13
  %16 = fmul nnan <4 x float> %14, splat (float f0x3B000000)
  %17 = fmul nnan <4 x float> %15, splat (float f0x3B000000)
  %18 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx21, i64 %index123
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 16
  store <4 x float> %16, ptr %18, align 4, !tbaa !10
  store <4 x float> %17, ptr %19, align 4, !tbaa !10
  %index.next126 = add nuw i64 %index123, 8
  %vec.ind.next127 = add <4 x i32> %vec.ind124, splat (i32 8)
  %20 = icmp eq i64 %index.next126, %n.vec119
  br i1 %20, label %middle.block128, label %vector.body122, !llvm.loop !23

middle.block128:                                  ; preds = %vector.body122
  br i1 %cmp.n129, label %for.cond13.for.inc27_crit_edge, label %for.body15.preheader

for.body15.preheader:                             ; preds = %for.cond13.preheader, %middle.block128
  %indvars.iv95.ph = phi i64 [ 0, %for.cond13.preheader ], [ %n.vec119, %middle.block128 ]
  br label %for.body15

for.cond30.preheader:                             ; preds = %for.cond13.for.inc27_crit_edge, %for.cond10.preheader
  %or.cond88 = and i1 %cmp77, %cmp1479
  br i1 %or.cond88, label %for.cond33.preheader.preheader, label %for.end49

for.cond33.preheader.preheader:                   ; preds = %for.cond30.preheader
  %wide.trip.count113 = zext nneg i32 %ni to i64
  %wide.trip.count108 = zext nneg i32 %nj to i64
  %min.iters.check132 = icmp ult i32 %nj, 8
  %n.vec135 = and i64 %wide.trip.count108, 2147483640
  %cmp.n145 = icmp eq i64 %n.vec135, %wide.trip.count108
  br label %for.cond33.preheader

for.body15:                                       ; preds = %for.body15.preheader, %for.body15
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %for.body15 ], [ %indvars.iv95.ph, %for.body15.preheader ]
  %21 = trunc nuw nsw i64 %indvars.iv95 to i32
  %conv17 = uitofp nneg i32 %21 to float
  %mul18 = fmul nnan float %conv16, %conv17
  %div19 = fmul nnan float %mul18, f0x3B000000
  %arrayidx23 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx21, i64 %indvars.iv95
  store float %div19, ptr %arrayidx23, align 4, !tbaa !10
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond99.not = icmp eq i64 %indvars.iv.next96, %wide.trip.count98
  br i1 %exitcond99.not, label %for.cond13.for.inc27_crit_edge, label %for.body15, !llvm.loop !24

for.cond13.for.inc27_crit_edge:                   ; preds = %for.body15, %middle.block128
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond104.not = icmp eq i64 %indvars.iv.next101, %wide.trip.count103
  br i1 %exitcond104.not, label %for.cond30.preheader, label %for.cond13.preheader, !llvm.loop !25

for.cond33.preheader:                             ; preds = %for.cond33.preheader.preheader, %for.cond33.for.inc47_crit_edge
  %indvars.iv110 = phi i64 [ 0, %for.cond33.preheader.preheader ], [ %indvars.iv.next111, %for.cond33.for.inc47_crit_edge ]
  %22 = trunc nuw nsw i64 %indvars.iv110 to i32
  %conv36 = uitofp nneg i32 %22 to float
  %arrayidx41 = getelementptr inbounds nuw [2048 x i8], ptr %C, i64 %indvars.iv110
  br i1 %min.iters.check132, label %for.body35.preheader, label %vector.ph133

vector.ph133:                                     ; preds = %for.cond33.preheader
  %broadcast.splatinsert136 = insertelement <4 x float> poison, float %conv36, i64 0
  %broadcast.splat137 = shufflevector <4 x float> %broadcast.splatinsert136, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body138

vector.body138:                                   ; preds = %vector.body138, %vector.ph133
  %index139 = phi i64 [ 0, %vector.ph133 ], [ %index.next142, %vector.body138 ]
  %vec.ind140 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph133 ], [ %vec.ind.next143, %vector.body138 ]
  %step.add141 = add <4 x i32> %vec.ind140, splat (i32 4)
  %23 = uitofp nneg <4 x i32> %vec.ind140 to <4 x float>
  %24 = uitofp nneg <4 x i32> %step.add141 to <4 x float>
  %25 = fmul nnan <4 x float> %broadcast.splat137, %23
  %26 = fmul nnan <4 x float> %broadcast.splat137, %24
  %27 = fmul nnan <4 x float> %25, splat (float f0x3B000000)
  %28 = fmul nnan <4 x float> %26, splat (float f0x3B000000)
  %29 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx41, i64 %index139
  %30 = getelementptr inbounds nuw i8, ptr %29, i64 16
  store <4 x float> %27, ptr %29, align 4, !tbaa !10
  store <4 x float> %28, ptr %30, align 4, !tbaa !10
  %index.next142 = add nuw i64 %index139, 8
  %vec.ind.next143 = add <4 x i32> %vec.ind140, splat (i32 8)
  %31 = icmp eq i64 %index.next142, %n.vec135
  br i1 %31, label %middle.block144, label %vector.body138, !llvm.loop !26

middle.block144:                                  ; preds = %vector.body138
  br i1 %cmp.n145, label %for.cond33.for.inc47_crit_edge, label %for.body35.preheader

for.body35.preheader:                             ; preds = %for.cond33.preheader, %middle.block144
  %indvars.iv105.ph = phi i64 [ 0, %for.cond33.preheader ], [ %n.vec135, %middle.block144 ]
  br label %for.body35

for.body35:                                       ; preds = %for.body35.preheader, %for.body35
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.body35 ], [ %indvars.iv105.ph, %for.body35.preheader ]
  %32 = trunc nuw nsw i64 %indvars.iv105 to i32
  %conv37 = uitofp nneg i32 %32 to float
  %mul38 = fmul nnan float %conv36, %conv37
  %div39 = fmul nnan float %mul38, f0x3B000000
  %arrayidx43 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx41, i64 %indvars.iv105
  store float %div39, ptr %arrayidx43, align 4, !tbaa !10
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond109.not = icmp eq i64 %indvars.iv.next106, %wide.trip.count108
  br i1 %exitcond109.not, label %for.cond33.for.inc47_crit_edge, label %for.body35, !llvm.loop !27

for.cond33.for.inc47_crit_edge:                   ; preds = %for.body35, %middle.block144
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond114.not = icmp eq i64 %indvars.iv.next111, %wide.trip.count113
  br i1 %exitcond114.not, label %for.end49, label %for.cond33.preheader, !llvm.loop !28

for.end49:                                        ; preds = %for.cond33.for.inc47_crit_edge, %for.cond30.preheader
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiiPA512_fS0_(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef readonly captures(none) %C, ptr nofree noundef readonly captures(none) %C_outputFromGpu) local_unnamed_addr #5 {
entry:
  %cmp28 = icmp sgt i32 %ni, 0
  %cmp225 = icmp sgt i32 %nj, 0
  %or.cond = and i1 %cmp28, %cmp225
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end16

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count37 = zext nneg i32 %ni to i64
  %wide.trip.count = zext nneg i32 %nj to i64
  %min.iters.check = icmp ult i32 %nj, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc14_crit_edge.us
  %indvars.iv34 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next35, %for.cond1.for.inc14_crit_edge.us ]
  %fail.030.us = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [2048 x i8], ptr %C, i64 %indvars.iv34
  %arrayidx7.us = getelementptr inbounds nuw [2048 x i8], ptr %C_outputFromGpu, i64 %indvars.iv34
  br i1 %min.iters.check, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.us
  %0 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.030.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %0, %vector.ph ], [ %32, %vector.body ]
  %1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %index
  %wide.load = load <4 x float>, ptr %1, align 4, !tbaa !10
  %2 = fpext <4 x float> %wide.load to <4 x double>
  %3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us, i64 %index
  %wide.load39 = load <4 x float>, ptr %3, align 4, !tbaa !10
  %4 = fpext <4 x float> %wide.load39 to <4 x double>
  %5 = fcmp olt <4 x double> %2, splat (double f0xB690000000000000)
  %6 = fneg <4 x float> %wide.load
  %7 = select <4 x i1> %5, <4 x float> %6, <4 x float> %wide.load
  %8 = fpext <4 x float> %7 to <4 x double>
  %9 = fcmp uge <4 x double> %8, splat (double 1.000000e-02)
  %10 = fcmp olt <4 x double> %4, splat (double f0xB690000000000000)
  %11 = fneg <4 x float> %wide.load39
  %12 = select <4 x i1> %10, <4 x float> %11, <4 x float> %wide.load39
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
  %.not41 = select <4 x i1> %9, <4 x i1> splat (i1 true), <4 x i1> %14
  %narrow = select <4 x i1> %.not41, <4 x i1> %31, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %32 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !29

middle.block:                                     ; preds = %vector.body
  %34 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %32)
  br i1 %cmp.n, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.cond1.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  %fail.127.us.ph = phi i32 [ %fail.030.us, %for.cond1.preheader.us ], [ %34, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %_Z11percentDiffdd.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %fail.127.us = phi i32 [ %fail.2.us, %_Z11percentDiffdd.exit.us ], [ %fail.127.us.ph, %for.body3.us.preheader ]
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
  %fail.2.us = add nsw i32 %retval.0.i.us, %fail.127.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us, !llvm.loop !30

for.cond1.for.inc14_crit_edge.us:                 ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %fail.2.us.lcssa = phi i32 [ %34, %middle.block ], [ %fail.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %for.end16, label %for.cond1.preheader.us, !llvm.loop !31

for.end16:                                        ; preds = %for.cond1.for.inc14_crit_edge.us, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %call17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %fail.0.lcssa) #15
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #6

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #7 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp) #16
  %call = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp, i32 noundef 0) #15
  %call1 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp) #15
  %call2 = call i32 @cudaSetDevice(i32 noundef 0) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp) #16
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #8

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__gemm_kerneliiiffPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, float noundef %alpha, float noundef %beta, ptr noundef %a, ptr noundef %b, ptr noundef %c) #9 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca float, align 4
  %beta.addr = alloca float, align 4
  %a.addr = alloca ptr, align 8
  %b.addr = alloca ptr, align 8
  %c.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !32
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !32
  store i32 %nk, ptr %nk.addr, align 4, !tbaa !32
  store float %alpha, ptr %alpha.addr, align 4, !tbaa !10
  store float %beta, ptr %beta.addr, align 4, !tbaa !10
  store ptr %a, ptr %a.addr, align 8, !tbaa !33
  store ptr %b, ptr %b.addr, align 8, !tbaa !33
  store ptr %c, ptr %c.addr, align 8, !tbaa !33
  %kernel_args1 = alloca [8 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %nk.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %alpha.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %beta.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %a.addr, ptr %4, align 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 48
  store ptr %b.addr, ptr %5, align 16
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 56
  store ptr %c.addr, ptr %6, align 8
  %7 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %8 = load i64, ptr %shmem_size, align 8
  %9 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__gemm_kerneliiiffPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %8, ptr noundef %9)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress uwtable
define dso_local void @_Z8gemmCudaiiiffPA512_fS0_S0_S0_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, float noundef %alpha, float noundef %beta, ptr noundef %A, ptr noundef %B, ptr noundef %C, ptr noundef %C_outputFromGpu) local_unnamed_addr #7 {
entry:
  %Tp.i.i24 = alloca %struct.timeval, align 8
  %ni.addr.i = alloca i32, align 4
  %nj.addr.i = alloca i32, align 4
  %nk.addr.i = alloca i32, align 4
  %alpha.addr.i = alloca float, align 4
  %beta.addr.i = alloca float, align 4
  %a.addr.i = alloca ptr, align 8
  %b.addr.i = alloca ptr, align 8
  %c.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [8 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %A_gpu = alloca ptr, align 8
  %B_gpu = alloca ptr, align 8
  %C_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %B_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %C_gpu) #16
  %call = call i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 1048576) #15
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %B_gpu, i64 noundef 1048576) #15
  %call2 = call i32 @cudaMalloc(ptr noundef nonnull %C_gpu, i64 noundef 1048576) #15
  %0 = load ptr, ptr %A_gpu, align 8, !tbaa !33
  %call3 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 1048576, i32 noundef 1) #15
  %1 = load ptr, ptr %B_gpu, align 8, !tbaa !33
  %call4 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %B, i64 noundef 1048576, i32 noundef 1) #15
  %2 = load ptr, ptr %C_gpu, align 8, !tbaa !33
  %call5 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %C, i64 noundef 1048576, i32 noundef 1) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #16
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #15
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %3 = load i64, ptr %Tp.i.i, align 8, !tbaa !36
  %conv.i.i = sitofp i64 %3 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %4 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !39
  %conv2.i.i = sitofp i64 %4 to double
  %5 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #16
  store double %5, ptr @polybench_t_start, align 8, !tbaa !40
  %call15 = call i32 @__cudaPushCallConfiguration(i64 274877906960, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool.not = icmp eq i32 %call15, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %6 = load ptr, ptr %A_gpu, align 8, !tbaa !33
  %7 = load ptr, ptr %B_gpu, align 8, !tbaa !33
  %8 = load ptr, ptr %C_gpu, align 8, !tbaa !33
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nk.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %alpha.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %beta.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %a.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %b.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %c.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %ni, ptr %ni.addr.i, align 4, !tbaa !32
  store i32 %nj, ptr %nj.addr.i, align 4, !tbaa !32
  store i32 %nk, ptr %nk.addr.i, align 4, !tbaa !32
  store float %alpha, ptr %alpha.addr.i, align 4, !tbaa !10
  store float %beta, ptr %beta.addr.i, align 4, !tbaa !10
  store ptr %6, ptr %a.addr.i, align 8, !tbaa !33
  store ptr %7, ptr %b.addr.i, align 8, !tbaa !33
  store ptr %8, ptr %c.addr.i, align 8, !tbaa !33
  store ptr %ni.addr.i, ptr %kernel_args1.i, align 16
  %9 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %nj.addr.i, ptr %9, align 8
  %10 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %nk.addr.i, ptr %10, align 16
  %11 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %alpha.addr.i, ptr %11, align 8
  %12 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 32
  store ptr %beta.addr.i, ptr %12, align 16
  %13 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 40
  store ptr %a.addr.i, ptr %13, align 8
  %14 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 48
  store ptr %b.addr.i, ptr %14, align 16
  %15 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 56
  store ptr %c.addr.i, ptr %15, align 8
  %16 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !42
  %17 = load i64, ptr %shmem_size.i, align 8
  %18 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__gemm_kerneliiiffPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %17, ptr noundef %18), !inline_history !42
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nk.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %alpha.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %beta.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %a.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %b.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %c.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %_Z21polybench_timer_startv.exit
  %call16 = call i32 @cudaThreadSynchronize() #15
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i24) #16
  %call.i.i25 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i24, ptr noundef null) #17
  %cmp.not.i.i26 = icmp eq i32 %call.i.i25, 0
  br i1 %cmp.not.i.i26, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i27

if.then.i.i27:                                    ; preds = %kcall.end
  %call1.i.i28 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i25) #15
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end, %if.then.i.i27
  %19 = load i64, ptr %Tp.i.i24, align 8, !tbaa !36
  %conv.i.i29 = sitofp i64 %19 to double
  %tv_usec.i.i30 = getelementptr inbounds nuw i8, ptr %Tp.i.i24, i64 8
  %20 = load i64, ptr %tv_usec.i.i30, align 8, !tbaa !39
  %conv2.i.i31 = sitofp i64 %20 to double
  %21 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i31, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i29)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i24) #16
  store double %21, ptr @polybench_t_end, align 8, !tbaa !40
  %22 = load double, ptr @polybench_t_start, align 8, !tbaa !40
  %sub.i = fsub double %21, %22
  %call.i32 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #15
  %23 = load ptr, ptr %C_gpu, align 8, !tbaa !33
  %call18 = call i32 @cudaMemcpy(ptr noundef %C_outputFromGpu, ptr noundef %23, i64 noundef 1048576, i32 noundef 2) #15
  %24 = load ptr, ptr %A_gpu, align 8, !tbaa !33
  %call19 = call i32 @cudaFree(ptr noundef %24) #15
  %25 = load ptr, ptr %B_gpu, align 8, !tbaa !33
  %call20 = call i32 @cudaFree(ptr noundef %25) #15
  %26 = load ptr, ptr %C_gpu, align 8, !tbaa !33
  %call21 = call i32 @cudaFree(ptr noundef %26) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %C_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %B_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %A_gpu) #16
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #8

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #5 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #16
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #17
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #15
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !36
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !39
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #16
  store double %2, ptr @polybench_t_start, align 8, !tbaa !40
  ret void
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #8

declare i32 @cudaThreadSynchronize() local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #5 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #16
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #17
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #15
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !36
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !39
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #16
  store double %2, ptr @polybench_t_end, align 8, !tbaa !40
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !40
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !40
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #15
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #9 {
entry:
  %Tp.i.i59 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i50 = alloca ptr, align 8
  %newA.i.i43 = alloca ptr, align 8
  %newA.i.i36 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #16
  store ptr null, ptr %newA.i.i, align 8, !tbaa !43
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 1048576) #17
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !43
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !44
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i36) #16
  store ptr null, ptr %newA.i.i36, align 8, !tbaa !43
  %call.i.i37 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i36, i64 noundef 32, i64 noundef 1048576) #17
  %3 = load ptr, ptr %newA.i.i36, align 8, !tbaa !43
  %tobool.i.i38 = icmp eq ptr %3, null
  %tobool1.i.i39 = icmp ne i32 %call.i.i37, 0
  %or.cond.i.i40 = select i1 %tobool.i.i38, i1 true, i1 %tobool1.i.i39
  br i1 %or.cond.i.i40, label %if.then.i.i41, label %_Z20polybench_alloc_datayi.exit42

if.then.i.i41:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !44
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit42:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i36) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i43) #16
  store ptr null, ptr %newA.i.i43, align 8, !tbaa !43
  %call.i.i44 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i43, i64 noundef 32, i64 noundef 1048576) #17
  %6 = load ptr, ptr %newA.i.i43, align 8, !tbaa !43
  %tobool.i.i45 = icmp eq ptr %6, null
  %tobool1.i.i46 = icmp ne i32 %call.i.i44, 0
  %or.cond.i.i47 = select i1 %tobool.i.i45, i1 true, i1 %tobool1.i.i46
  br i1 %or.cond.i.i47, label %if.then.i.i48, label %_Z20polybench_alloc_datayi.exit49

if.then.i.i48:                                    ; preds = %_Z20polybench_alloc_datayi.exit42
  %7 = load ptr, ptr @stderr, align 8, !tbaa !44
  %8 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %7) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit49:                ; preds = %_Z20polybench_alloc_datayi.exit42
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i43) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i50) #16
  store ptr null, ptr %newA.i.i50, align 8, !tbaa !43
  %call.i.i51 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i50, i64 noundef 32, i64 noundef 1048576) #17
  %9 = load ptr, ptr %newA.i.i50, align 8, !tbaa !43
  %tobool.i.i52 = icmp eq ptr %9, null
  %tobool1.i.i53 = icmp ne i32 %call.i.i51, 0
  %or.cond.i.i54 = select i1 %tobool.i.i52, i1 true, i1 %tobool1.i.i53
  br i1 %or.cond.i.i54, label %if.then.i.i55, label %_Z20polybench_alloc_datayi.exit56

if.then.i.i55:                                    ; preds = %_Z20polybench_alloc_datayi.exit49
  %10 = load ptr, ptr @stderr, align 8, !tbaa !44
  %11 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %10) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit56:                ; preds = %_Z20polybench_alloc_datayi.exit49
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i50) #16
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc7_crit_edge.i, %_Z20polybench_alloc_datayi.exit56
  %indvars.iv90.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit56 ], [ %indvars.iv.next91.i, %for.cond1.for.inc7_crit_edge.i ]
  %arrayidx.i = getelementptr inbounds nuw [2048 x i8], ptr %0, i64 %indvars.iv90.i
  %12 = trunc nuw nsw i64 %indvars.iv90.i to i32
  %conv.i = uitofp nneg i32 %12 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond1.preheader.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %13 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %14 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %15 = fmul nnan <4 x float> %broadcast.splat, %13
  %16 = fmul nnan <4 x float> %broadcast.splat, %14
  %17 = fmul nnan <4 x float> %15, splat (float f0x3B000000)
  %18 = fmul nnan <4 x float> %16, splat (float f0x3B000000)
  %19 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %20 = getelementptr inbounds nuw i8, ptr %19, i64 16
  store <4 x float> %17, ptr %19, align 4, !tbaa !10
  store <4 x float> %18, ptr %20, align 4, !tbaa !10
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %21 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %22 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %23 = fmul nnan <4 x float> %broadcast.splat, %21
  %24 = fmul nnan <4 x float> %broadcast.splat, %22
  %25 = fmul nnan <4 x float> %23, splat (float f0x3B000000)
  %26 = fmul nnan <4 x float> %24, splat (float f0x3B000000)
  %27 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %28 = getelementptr inbounds nuw i8, ptr %27, i64 32
  %29 = getelementptr inbounds nuw i8, ptr %27, i64 48
  store <4 x float> %25, ptr %28, align 4, !tbaa !10
  store <4 x float> %26, ptr %29, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %30 = icmp eq i64 %index.next.1, 512
  br i1 %30, label %for.cond1.for.inc7_crit_edge.i, label %vector.body, !llvm.loop !46

for.cond1.for.inc7_crit_edge.i:                   ; preds = %vector.body
  %indvars.iv.next91.i = add nuw nsw i64 %indvars.iv90.i, 1
  %exitcond94.not.i = icmp eq i64 %indvars.iv.next91.i, 512
  br i1 %exitcond94.not.i, label %for.cond13.preheader.i, label %for.cond1.preheader.i, !llvm.loop !22

for.cond13.preheader.i:                           ; preds = %for.cond1.for.inc7_crit_edge.i, %for.cond13.for.inc27_crit_edge.i
  %indvars.iv100.i = phi i64 [ %indvars.iv.next101.i, %for.cond13.for.inc27_crit_edge.i ], [ 0, %for.cond1.for.inc7_crit_edge.i ]
  %arrayidx21.i = getelementptr inbounds nuw [2048 x i8], ptr %3, i64 %indvars.iv100.i
  %31 = trunc nuw nsw i64 %indvars.iv100.i to i32
  %conv16.i = uitofp nneg i32 %31 to float
  %broadcast.splatinsert79 = insertelement <4 x float> poison, float %conv16.i, i64 0
  %broadcast.splat80 = shufflevector <4 x float> %broadcast.splatinsert79, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body81

vector.body81:                                    ; preds = %vector.body81, %for.cond13.preheader.i
  %index82 = phi i64 [ 0, %for.cond13.preheader.i ], [ %index.next85.1, %vector.body81 ]
  %vec.ind83 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond13.preheader.i ], [ %vec.ind.next86.1, %vector.body81 ]
  %step.add84 = add <4 x i32> %vec.ind83, splat (i32 4)
  %32 = uitofp nneg <4 x i32> %vec.ind83 to <4 x float>
  %33 = uitofp nneg <4 x i32> %step.add84 to <4 x float>
  %34 = fmul nnan <4 x float> %broadcast.splat80, %32
  %35 = fmul nnan <4 x float> %broadcast.splat80, %33
  %36 = fmul nnan <4 x float> %34, splat (float f0x3B000000)
  %37 = fmul nnan <4 x float> %35, splat (float f0x3B000000)
  %38 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx21.i, i64 %index82
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 16
  store <4 x float> %36, ptr %38, align 4, !tbaa !10
  store <4 x float> %37, ptr %39, align 4, !tbaa !10
  %vec.ind.next86 = add <4 x i32> %vec.ind83, splat (i32 8)
  %step.add84.1 = add <4 x i32> %vec.ind83, splat (i32 12)
  %40 = uitofp nneg <4 x i32> %vec.ind.next86 to <4 x float>
  %41 = uitofp nneg <4 x i32> %step.add84.1 to <4 x float>
  %42 = fmul nnan <4 x float> %broadcast.splat80, %40
  %43 = fmul nnan <4 x float> %broadcast.splat80, %41
  %44 = fmul nnan <4 x float> %42, splat (float f0x3B000000)
  %45 = fmul nnan <4 x float> %43, splat (float f0x3B000000)
  %46 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx21.i, i64 %index82
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 32
  %48 = getelementptr inbounds nuw i8, ptr %46, i64 48
  store <4 x float> %44, ptr %47, align 4, !tbaa !10
  store <4 x float> %45, ptr %48, align 4, !tbaa !10
  %index.next85.1 = add nuw nsw i64 %index82, 16
  %vec.ind.next86.1 = add <4 x i32> %vec.ind83, splat (i32 16)
  %49 = icmp eq i64 %index.next85.1, 512
  br i1 %49, label %for.cond13.for.inc27_crit_edge.i, label %vector.body81, !llvm.loop !47

for.cond13.for.inc27_crit_edge.i:                 ; preds = %vector.body81
  %indvars.iv.next101.i = add nuw nsw i64 %indvars.iv100.i, 1
  %exitcond104.not.i = icmp eq i64 %indvars.iv.next101.i, 512
  br i1 %exitcond104.not.i, label %for.cond33.preheader.i, label %for.cond13.preheader.i, !llvm.loop !25

for.cond33.preheader.i:                           ; preds = %for.cond13.for.inc27_crit_edge.i, %for.cond33.for.inc47_crit_edge.i
  %indvars.iv110.i = phi i64 [ %indvars.iv.next111.i, %for.cond33.for.inc47_crit_edge.i ], [ 0, %for.cond13.for.inc27_crit_edge.i ]
  %arrayidx41.i = getelementptr inbounds nuw [2048 x i8], ptr %6, i64 %indvars.iv110.i
  %50 = trunc nuw nsw i64 %indvars.iv110.i to i32
  %conv36.i = uitofp nneg i32 %50 to float
  %broadcast.splatinsert89 = insertelement <4 x float> poison, float %conv36.i, i64 0
  %broadcast.splat90 = shufflevector <4 x float> %broadcast.splatinsert89, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body91

vector.body91:                                    ; preds = %vector.body91, %for.cond33.preheader.i
  %index92 = phi i64 [ 0, %for.cond33.preheader.i ], [ %index.next95.1, %vector.body91 ]
  %vec.ind93 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond33.preheader.i ], [ %vec.ind.next96.1, %vector.body91 ]
  %step.add94 = add <4 x i32> %vec.ind93, splat (i32 4)
  %51 = uitofp nneg <4 x i32> %vec.ind93 to <4 x float>
  %52 = uitofp nneg <4 x i32> %step.add94 to <4 x float>
  %53 = fmul nnan <4 x float> %broadcast.splat90, %51
  %54 = fmul nnan <4 x float> %broadcast.splat90, %52
  %55 = fmul nnan <4 x float> %53, splat (float f0x3B000000)
  %56 = fmul nnan <4 x float> %54, splat (float f0x3B000000)
  %57 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx41.i, i64 %index92
  %58 = getelementptr inbounds nuw i8, ptr %57, i64 16
  store <4 x float> %55, ptr %57, align 4, !tbaa !10
  store <4 x float> %56, ptr %58, align 4, !tbaa !10
  %vec.ind.next96 = add <4 x i32> %vec.ind93, splat (i32 8)
  %step.add94.1 = add <4 x i32> %vec.ind93, splat (i32 12)
  %59 = uitofp nneg <4 x i32> %vec.ind.next96 to <4 x float>
  %60 = uitofp nneg <4 x i32> %step.add94.1 to <4 x float>
  %61 = fmul nnan <4 x float> %broadcast.splat90, %59
  %62 = fmul nnan <4 x float> %broadcast.splat90, %60
  %63 = fmul nnan <4 x float> %61, splat (float f0x3B000000)
  %64 = fmul nnan <4 x float> %62, splat (float f0x3B000000)
  %65 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx41.i, i64 %index92
  %66 = getelementptr inbounds nuw i8, ptr %65, i64 32
  %67 = getelementptr inbounds nuw i8, ptr %65, i64 48
  store <4 x float> %63, ptr %66, align 4, !tbaa !10
  store <4 x float> %64, ptr %67, align 4, !tbaa !10
  %index.next95.1 = add nuw nsw i64 %index92, 16
  %vec.ind.next96.1 = add <4 x i32> %vec.ind93, splat (i32 16)
  %68 = icmp eq i64 %index.next95.1, 512
  br i1 %68, label %for.cond33.for.inc47_crit_edge.i, label %vector.body91, !llvm.loop !48

for.cond33.for.inc47_crit_edge.i:                 ; preds = %vector.body91
  %indvars.iv.next111.i = add nuw nsw i64 %indvars.iv110.i, 1
  %exitcond114.not.i = icmp eq i64 %indvars.iv.next111.i, 512
  br i1 %exitcond114.not.i, label %_Z4initiiiPfS_PA512_fS1_S1_.exit, label %for.cond33.preheader.i, !llvm.loop !28

_Z4initiiiPfS_PA512_fS1_S1_.exit:                 ; preds = %for.cond33.for.inc47_crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #16
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #15
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #15
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #16
  call void @_Z8gemmCudaiiiffPA512_fS0_S0_S0_(i32 noundef 512, i32 noundef 512, i32 noundef 512, float noundef 3.241200e+04, float noundef 2.123000e+03, ptr noundef nonnull %0, ptr noundef nonnull %3, ptr noundef nonnull %6, ptr noundef nonnull %9) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #16
  %call.i.i57 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i57, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i58

if.then.i.i58:                                    ; preds = %_Z4initiiiPfS_PA512_fS1_S1_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i57) #15
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z4initiiiPfS_PA512_fS1_S1_.exit, %if.then.i.i58
  %69 = load i64, ptr %Tp.i.i, align 8, !tbaa !36
  %conv.i.i = sitofp i64 %69 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %70 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !39
  %conv2.i.i = sitofp i64 %70 to double
  %71 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #16
  store double %71, ptr @polybench_t_start, align 8, !tbaa !40
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc26_crit_edge.split.us.us.i, %_Z21polybench_timer_startv.exit
  %indvars.iv66.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next67.i, %for.cond1.for.inc26_crit_edge.split.us.us.i ]
  %arrayidx.us.i = getelementptr inbounds nuw [2048 x i8], ptr %6, i64 %indvars.iv66.i
  %arrayidx10.us.i = getelementptr inbounds nuw [2048 x i8], ptr %0, i64 %indvars.iv66.i
  br label %for.body3.us.us.i

for.body3.us.us.i:                                ; preds = %for.cond6.for.inc23_crit_edge.us.us.i, %for.cond1.preheader.us.i
  %indvars.iv61.i = phi i64 [ %indvars.iv.next62.i, %for.cond6.for.inc23_crit_edge.us.us.i ], [ 0, %for.cond1.preheader.us.i ]
  %arrayidx5.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i, i64 %indvars.iv61.i
  %72 = load float, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %mul.us.us.i = fmul float %72, 2.123000e+03
  store float %mul.us.us.i, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %invariant.gep.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %3, i64 %indvars.iv61.i
  br label %for.body8.us.us.i

for.body8.us.us.i:                                ; preds = %for.body8.us.us.i, %for.body3.us.us.i
  %indvars.iv56.i = phi i64 [ 0, %for.body3.us.us.i ], [ %indvars.iv.next57.i.1, %for.body8.us.us.i ]
  %73 = phi float [ %mul.us.us.i, %for.body3.us.us.i ], [ %79, %for.body8.us.us.i ]
  %arrayidx12.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us.i, i64 %indvars.iv56.i
  %74 = load float, ptr %arrayidx12.us.us.i, align 4, !tbaa !10
  %mul13.us.us.i = fmul float %74, 3.241200e+04
  %gep.us.us.i = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us.i, i64 %indvars.iv56.i
  %75 = load float, ptr %gep.us.us.i, align 4, !tbaa !10
  %76 = call float @llvm.fmuladd.f32(float %mul13.us.us.i, float %75, float %73)
  store float %76, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %indvars.iv.next57.i = or disjoint i64 %indvars.iv56.i, 1
  %arrayidx12.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us.i, i64 %indvars.iv.next57.i
  %77 = load float, ptr %arrayidx12.us.us.i.1, align 4, !tbaa !10
  %mul13.us.us.i.1 = fmul float %77, 3.241200e+04
  %gep.us.us.i.1 = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us.i, i64 %indvars.iv.next57.i
  %78 = load float, ptr %gep.us.us.i.1, align 4, !tbaa !10
  %79 = call float @llvm.fmuladd.f32(float %mul13.us.us.i.1, float %78, float %76)
  store float %79, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %indvars.iv.next57.i.1 = add nuw nsw i64 %indvars.iv56.i, 2
  %exitcond60.not.i.1 = icmp eq i64 %indvars.iv.next57.i.1, 512
  br i1 %exitcond60.not.i.1, label %for.cond6.for.inc23_crit_edge.us.us.i, label %for.body8.us.us.i, !llvm.loop !12

for.cond6.for.inc23_crit_edge.us.us.i:            ; preds = %for.body8.us.us.i
  %indvars.iv.next62.i = add nuw nsw i64 %indvars.iv61.i, 1
  %exitcond65.not.i = icmp eq i64 %indvars.iv.next62.i, 512
  br i1 %exitcond65.not.i, label %for.cond1.for.inc26_crit_edge.split.us.us.i, label %for.body3.us.us.i, !llvm.loop !14

for.cond1.for.inc26_crit_edge.split.us.us.i:      ; preds = %for.cond6.for.inc23_crit_edge.us.us.i
  %indvars.iv.next67.i = add nuw nsw i64 %indvars.iv66.i, 1
  %exitcond70.not.i = icmp eq i64 %indvars.iv.next67.i, 512
  br i1 %exitcond70.not.i, label %_Z4gemmiiiffPA512_fS0_S0_.exit, label %for.cond1.preheader.us.i, !llvm.loop !15

_Z4gemmiiiffPA512_fS0_S0_.exit:                   ; preds = %for.cond1.for.inc26_crit_edge.split.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i59) #16
  %call.i.i60 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i59, ptr noundef null) #17
  %cmp.not.i.i61 = icmp eq i32 %call.i.i60, 0
  br i1 %cmp.not.i.i61, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i62

if.then.i.i62:                                    ; preds = %_Z4gemmiiiffPA512_fS0_S0_.exit
  %call1.i.i63 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i60) #15
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z4gemmiiiffPA512_fS0_S0_.exit, %if.then.i.i62
  %80 = load i64, ptr %Tp.i.i59, align 8, !tbaa !36
  %conv.i.i64 = sitofp i64 %80 to double
  %tv_usec.i.i65 = getelementptr inbounds nuw i8, ptr %Tp.i.i59, i64 8
  %81 = load i64, ptr %tv_usec.i.i65, align 8, !tbaa !39
  %conv2.i.i66 = sitofp i64 %81 to double
  %82 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i66, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i64)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i59) #16
  store double %82, ptr @polybench_t_end, align 8, !tbaa !40
  %83 = load double, ptr @polybench_t_start, align 8, !tbaa !40
  %sub.i = fsub double %82, %83
  %call.i67 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #15
  br label %for.cond1.preheader.us.i68

for.cond1.preheader.us.i68:                       ; preds = %for.cond1.for.inc14_crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv34.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next35.i, %for.cond1.for.inc14_crit_edge.us.i ]
  %fail.030.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %118, %for.cond1.for.inc14_crit_edge.us.i ]
  %arrayidx.us.i69 = getelementptr inbounds nuw [2048 x i8], ptr %6, i64 %indvars.iv34.i
  %arrayidx7.us.i = getelementptr inbounds nuw [2048 x i8], ptr %9, i64 %indvars.iv34.i
  %84 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.030.us.i, i64 0
  br label %vector.body99

vector.body99:                                    ; preds = %vector.body99, %for.cond1.preheader.us.i68
  %index100 = phi i64 [ 0, %for.cond1.preheader.us.i68 ], [ %index.next102, %vector.body99 ]
  %vec.phi = phi <4 x i32> [ %84, %for.cond1.preheader.us.i68 ], [ %116, %vector.body99 ]
  %85 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i69, i64 %index100
  %wide.load = load <4 x float>, ptr %85, align 4, !tbaa !10
  %86 = fpext <4 x float> %wide.load to <4 x double>
  %87 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us.i, i64 %index100
  %wide.load101 = load <4 x float>, ptr %87, align 4, !tbaa !10
  %88 = fpext <4 x float> %wide.load101 to <4 x double>
  %89 = fcmp olt <4 x double> %86, splat (double f0xB690000000000000)
  %90 = fneg <4 x float> %wide.load
  %91 = select <4 x i1> %89, <4 x float> %90, <4 x float> %wide.load
  %92 = fpext <4 x float> %91 to <4 x double>
  %93 = fcmp uge <4 x double> %92, splat (double 1.000000e-02)
  %94 = fcmp olt <4 x double> %88, splat (double f0xB690000000000000)
  %95 = fneg <4 x float> %wide.load101
  %96 = select <4 x i1> %94, <4 x float> %95, <4 x float> %wide.load101
  %97 = fpext <4 x float> %96 to <4 x double>
  %98 = fcmp uge <4 x double> %97, splat (double 1.000000e-02)
  %99 = fsub <4 x double> %86, %88
  %100 = fptrunc <4 x double> %99 to <4 x float>
  %101 = fcmp olt <4 x double> %99, splat (double f0xB690000000000000)
  %102 = fneg <4 x float> %100
  %103 = select <4 x i1> %101, <4 x float> %102, <4 x float> %100
  %104 = fadd <4 x double> %86, splat (double f0x3E45798EE0000000)
  %105 = fptrunc <4 x double> %104 to <4 x float>
  %106 = fcmp olt <4 x double> %104, splat (double f0xB690000000000000)
  %107 = fneg <4 x float> %105
  %108 = select <4 x i1> %106, <4 x float> %107, <4 x float> %105
  %109 = fdiv <4 x float> %103, %108
  %110 = fcmp olt <4 x float> %109, zeroinitializer
  %111 = fneg <4 x float> %109
  %112 = select <4 x i1> %110, <4 x float> %111, <4 x float> %109
  %113 = fmul <4 x float> %112, splat (float 1.000000e+02)
  %114 = fpext <4 x float> %113 to <4 x double>
  %115 = fcmp ogt <4 x double> %114, splat (double 5.000000e-02)
  %.not105 = select <4 x i1> %93, <4 x i1> splat (i1 true), <4 x i1> %98
  %narrow = select <4 x i1> %.not105, <4 x i1> %115, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %116 = add <4 x i32> %vec.phi, %predphi
  %index.next102 = add nuw i64 %index100, 4
  %117 = icmp eq i64 %index.next102, 512
  br i1 %117, label %for.cond1.for.inc14_crit_edge.us.i, label %vector.body99, !llvm.loop !49

for.cond1.for.inc14_crit_edge.us.i:               ; preds = %vector.body99
  %118 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %116)
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond38.not.i = icmp eq i64 %indvars.iv.next35.i, 512
  br i1 %exitcond38.not.i, label %_Z14compareResultsiiPA512_fS0_.exit, label %for.cond1.preheader.us.i68, !llvm.loop !31

_Z14compareResultsiiPA512_fS0_.exit:              ; preds = %for.cond1.for.inc14_crit_edge.us.i
  %call17.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %118) #15
  call void @free(ptr noundef %0) #17
  call void @free(ptr noundef %3) #17
  call void @free(ptr noundef nonnull %6) #17
  call void @free(ptr noundef nonnull %9) #17
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #16
  store ptr null, ptr %newA.i, align 8, !tbaa !43
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #17
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !43
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !44
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_ZL7xmallocm.exit:                                ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i) #16
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
declare noundef i32 @gettimeofday(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #6

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #3

; Function Attrs: nofree nounwind
declare i32 @posix_memalign(ptr noundef, i64 noundef, i64 noundef) local_unnamed_addr #6

; Function Attrs: nofree noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #12

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #14

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
attributes #10 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #11 = { nofree noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #12 = { nofree nounwind }
attributes #13 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #14 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #15 = { "uniform-work-group-size" }
attributes #16 = { nounwind }
attributes #17 = { nounwind "uniform-work-group-size" }
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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !13, !17, !18}
!17 = !{!"llvm.loop.isvectorized", i32 1}
!18 = !{!"llvm.loop.unroll.runtime.disable"}
!19 = distinct !{!19, !13, !18, !17}
!20 = distinct !{!20, !13, !17, !18}
!21 = distinct !{!21, !13, !18, !17}
!22 = distinct !{!22, !13}
!23 = distinct !{!23, !13, !17, !18}
!24 = distinct !{!24, !13, !18, !17}
!25 = distinct !{!25, !13}
!26 = distinct !{!26, !13, !17, !18}
!27 = distinct !{!27, !13, !18, !17}
!28 = distinct !{!28, !13}
!29 = distinct !{!29, !13, !17, !18}
!30 = distinct !{!30, !13, !18, !17}
!31 = distinct !{!31, !13}
!32 = !{!7, !7, i64 0}
!33 = !{!34, !34, i64 0}
!34 = !{!"p1 float", !35, i64 0}
!35 = !{!"any pointer", !8, i64 0}
!36 = !{!37, !38, i64 0}
!37 = !{!"_ZTS7timeval", !38, i64 0, !38, i64 8}
!38 = !{!"long", !8, i64 0}
!39 = !{!37, !38, i64 8}
!40 = !{!41, !41, i64 0}
!41 = !{!"double", !8, i64 0}
!42 = !{ptr @_Z26__device_stub__gemm_kerneliiiffPfS_S_}
!43 = !{!35, !35, i64 0}
!44 = !{!45, !45, i64 0}
!45 = !{!"p1 _ZTS8_IO_FILE", !35, i64 0}
!46 = distinct !{!46, !13, !17, !18}
!47 = distinct !{!47, !13, !17, !18}
!48 = distinct !{!48, !13, !17, !18}
!49 = distinct !{!49, !13, !17, !18}
