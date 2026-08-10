; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/MVT/mvt.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/MVT/mvt.cu"
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable
define dso_local void @_Z10init_arrayiPA4096_fPfS1_S1_S1_(i32 noundef %n, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %x1, ptr nofree noundef writeonly captures(none) %x2, ptr nofree noundef writeonly captures(none) %y1, ptr nofree noundef writeonly captures(none) %y2) local_unnamed_addr #1 {
entry:
  %cmp45 = icmp sgt i32 %n, 0
  br i1 %cmp45, label %for.body.us.preheader, label %for.end27

for.body.us.preheader:                            ; preds = %entry
  %wide.trip.count51 = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 8
  %n.vec = and i64 %wide.trip.count51, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count51
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond15.for.inc25_crit_edge.us
  %indvars.iv48 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next49, %for.cond15.for.inc25_crit_edge.us ]
  %0 = trunc nuw nsw i64 %indvars.iv48 to i32
  %arrayidx.us = getelementptr inbounds nuw [4 x i8], ptr %x1, i64 %indvars.iv48
  %arrayidx4.us = getelementptr inbounds nuw [4 x i8], ptr %x2, i64 %indvars.iv48
  %arrayidx9.us = getelementptr inbounds nuw [4 x i8], ptr %y1, i64 %indvars.iv48
  %conv.us = uitofp nneg i32 %0 to float
  %1 = insertelement <4 x float> poison, float %conv.us, i64 0
  %2 = shufflevector <4 x float> %1, <4 x float> poison, <4 x i32> zeroinitializer
  %3 = fadd nnan <4 x float> %2, <float -0.000000e+00, float 1.000000e+00, float 3.000000e+00, float 4.000000e+00>
  %4 = fmul nnan <4 x float> %3, splat (float f0x39800000)
  %5 = extractelement <4 x float> %4, i64 0
  store float %5, ptr %arrayidx.us, align 4, !tbaa !10
  %6 = extractelement <4 x float> %4, i64 1
  store float %6, ptr %arrayidx4.us, align 4, !tbaa !10
  %7 = extractelement <4 x float> %4, i64 2
  store float %7, ptr %arrayidx9.us, align 4, !tbaa !10
  %arrayidx14.us = getelementptr inbounds nuw [4 x i8], ptr %y2, i64 %indvars.iv48
  %8 = extractelement <4 x float> %4, i64 3
  store float %8, ptr %arrayidx14.us, align 4, !tbaa !10
  %arrayidx22.us = getelementptr inbounds nuw [16384 x i8], ptr %A, i64 %indvars.iv48
  br i1 %min.iters.check, label %for.body17.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.body.us
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.us, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %9 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %10 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %11 = fmul nnan <4 x float> %broadcast.splat, %9
  %12 = fmul nnan <4 x float> %broadcast.splat, %10
  %13 = fmul nnan <4 x float> %11, splat (float f0x39800000)
  %14 = fmul nnan <4 x float> %12, splat (float f0x39800000)
  %15 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx22.us, i64 %index
  %16 = getelementptr inbounds nuw i8, ptr %15, i64 16
  store <4 x float> %13, ptr %15, align 4, !tbaa !10
  store <4 x float> %14, ptr %16, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond15.for.inc25_crit_edge.us, label %for.body17.us.preheader

for.body17.us.preheader:                          ; preds = %for.body.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.us ], [ %n.vec, %middle.block ]
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us.preheader, %for.body17.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body17.us ], [ %indvars.iv.ph, %for.body17.us.preheader ]
  %18 = trunc nuw nsw i64 %indvars.iv to i32
  %conv19.us = uitofp nneg i32 %18 to float
  %mul.us = fmul nnan float %conv.us, %conv19.us
  %div20.us = fmul nnan float %mul.us, f0x39800000
  %arrayidx24.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx22.us, i64 %indvars.iv
  store float %div20.us, ptr %arrayidx24.us, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count51
  br i1 %exitcond.not, label %for.cond15.for.inc25_crit_edge.us, label %for.body17.us, !llvm.loop !16

for.cond15.for.inc25_crit_edge.us:                ; preds = %for.body17.us, %middle.block
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond52.not = icmp eq i64 %indvars.iv.next49, %wide.trip.count51
  br i1 %exitcond52.not, label %for.end27, label %for.body.us, !llvm.loop !17

for.end27:                                        ; preds = %for.cond15.for.inc25_crit_edge.us, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z6runMvtiPA4096_fPfS1_S1_S1_(i32 noundef %n, ptr nofree noundef readonly captures(none) %a, ptr nofree noundef captures(none) %x1, ptr nofree noundef captures(none) %x2, ptr nofree noundef readonly captures(none) %y1, ptr nofree noundef readonly captures(none) %y2) local_unnamed_addr #3 {
entry:
  %cmp59 = icmp sgt i32 %n, 0
  br i1 %cmp59, label %for.cond1.preheader.preheader, label %for.end36

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count = zext nneg i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.inc12
  %indvars.iv66 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next67, %for.inc12 ]
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %x1, i64 %indvars.iv66
  %arrayidx5 = getelementptr inbounds nuw [16384 x i8], ptr %a, i64 %indvars.iv66
  %arrayidx.promoted = load float, ptr %arrayidx, align 4, !tbaa !10
  br label %for.body3

for.cond18.preheader.preheader:                   ; preds = %for.inc12
  %wide.trip.count78 = zext nneg i32 %n to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %0 = icmp eq i32 %n, 1
  %unroll_iter = and i64 %wide.trip.count, 2147483646
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod80 = trunc i32 %n to i1
  br label %for.cond18.preheader

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.1, %for.body3 ]
  %1 = phi float [ %arrayidx.promoted, %for.cond1.preheader ], [ %7, %for.body3 ]
  %arrayidx7 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx5, i64 %indvars.iv
  %2 = load float, ptr %arrayidx7, align 4, !tbaa !10
  %arrayidx9 = getelementptr inbounds nuw [4 x i8], ptr %y1, i64 %indvars.iv
  %3 = load float, ptr %arrayidx9, align 4, !tbaa !10
  %4 = tail call float @llvm.fmuladd.f32(float %2, float %3, float %1)
  store float %4, ptr %arrayidx, align 4, !tbaa !10
  %indvars.iv.next = or disjoint i64 %indvars.iv, 1
  %arrayidx7.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx5, i64 %indvars.iv.next
  %5 = load float, ptr %arrayidx7.1, align 4, !tbaa !10
  %arrayidx9.1 = getelementptr inbounds nuw [4 x i8], ptr %y1, i64 %indvars.iv.next
  %6 = load float, ptr %arrayidx9.1, align 4, !tbaa !10
  %7 = tail call float @llvm.fmuladd.f32(float %5, float %6, float %4)
  store float %7, ptr %arrayidx, align 4, !tbaa !10
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, 4096
  br i1 %exitcond.not.1, label %for.inc12, label %for.body3, !llvm.loop !18

for.inc12:                                        ; preds = %for.body3
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69.not = icmp eq i64 %indvars.iv.next67, %wide.trip.count
  br i1 %exitcond69.not, label %for.cond18.preheader.preheader, label %for.cond1.preheader, !llvm.loop !19

for.cond18.preheader:                             ; preds = %for.cond18.preheader.preheader, %for.cond18.for.inc34_crit_edge
  %indvars.iv75 = phi i64 [ 0, %for.cond18.preheader.preheader ], [ %indvars.iv.next76, %for.cond18.for.inc34_crit_edge ]
  %arrayidx22 = getelementptr inbounds nuw [4 x i8], ptr %x2, i64 %indvars.iv75
  %invariant.gep = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %indvars.iv75
  %arrayidx22.promoted = load float, ptr %arrayidx22, align 4, !tbaa !10
  br i1 %0, label %for.body20.epil.preheader, label %for.body20

for.body20:                                       ; preds = %for.cond18.preheader, %for.body20
  %indvars.iv70 = phi i64 [ %indvars.iv.next71.1, %for.body20 ], [ 0, %for.cond18.preheader ]
  %8 = phi float [ %14, %for.body20 ], [ %arrayidx22.promoted, %for.cond18.preheader ]
  %niter = phi i64 [ %niter.next.1, %for.body20 ], [ 0, %for.cond18.preheader ]
  %gep = getelementptr inbounds nuw [16384 x i8], ptr %invariant.gep, i64 %indvars.iv70
  %9 = load float, ptr %gep, align 4, !tbaa !10
  %arrayidx28 = getelementptr inbounds nuw [4 x i8], ptr %y2, i64 %indvars.iv70
  %10 = load float, ptr %arrayidx28, align 4, !tbaa !10
  %11 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %8)
  store float %11, ptr %arrayidx22, align 4, !tbaa !10
  %indvars.iv.next71 = or disjoint i64 %indvars.iv70, 1
  %gep.1 = getelementptr inbounds nuw [16384 x i8], ptr %invariant.gep, i64 %indvars.iv.next71
  %12 = load float, ptr %gep.1, align 4, !tbaa !10
  %arrayidx28.1 = getelementptr inbounds nuw [4 x i8], ptr %y2, i64 %indvars.iv.next71
  %13 = load float, ptr %arrayidx28.1, align 4, !tbaa !10
  %14 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %11)
  store float %14, ptr %arrayidx22, align 4, !tbaa !10
  %indvars.iv.next71.1 = add nuw nsw i64 %indvars.iv70, 2
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %for.cond18.for.inc34_crit_edge.unr-lcssa, label %for.body20, !llvm.loop !20

for.cond18.for.inc34_crit_edge.unr-lcssa:         ; preds = %for.body20
  br i1 %lcmp.mod.not, label %for.cond18.for.inc34_crit_edge, label %for.body20.epil.preheader

for.body20.epil.preheader:                        ; preds = %for.cond18.for.inc34_crit_edge.unr-lcssa, %for.cond18.preheader
  %indvars.iv70.epil.init = phi i64 [ 0, %for.cond18.preheader ], [ %indvars.iv.next71.1, %for.cond18.for.inc34_crit_edge.unr-lcssa ]
  %.epil.init = phi float [ %arrayidx22.promoted, %for.cond18.preheader ], [ %14, %for.cond18.for.inc34_crit_edge.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod80)
  %gep.epil = getelementptr inbounds nuw [16384 x i8], ptr %invariant.gep, i64 %indvars.iv70.epil.init
  %15 = load float, ptr %gep.epil, align 4, !tbaa !10
  %arrayidx28.epil = getelementptr inbounds nuw [4 x i8], ptr %y2, i64 %indvars.iv70.epil.init
  %16 = load float, ptr %arrayidx28.epil, align 4, !tbaa !10
  %17 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %.epil.init)
  store float %17, ptr %arrayidx22, align 4, !tbaa !10
  br label %for.cond18.for.inc34_crit_edge

for.cond18.for.inc34_crit_edge:                   ; preds = %for.cond18.for.inc34_crit_edge.unr-lcssa, %for.body20.epil.preheader
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond79.not = icmp eq i64 %indvars.iv.next76, %wide.trip.count78
  br i1 %exitcond79.not, label %for.end36, label %for.cond18.preheader, !llvm.loop !21

for.end36:                                        ; preds = %for.cond18.for.inc34_crit_edge, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #4

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiPfS_S_S_(i32 noundef %n, ptr nofree noundef readonly captures(none) %x1, ptr nofree noundef readonly captures(none) %x1_outputFromGpu, ptr nofree noundef readonly captures(none) %x2, ptr nofree noundef readonly captures(none) %x2_outputFromGpu) local_unnamed_addr #5 {
entry:
  %cmp56 = icmp sgt i32 %n, 0
  br i1 %cmp56, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 4
  br i1 %min.iters.check, label %for.body.preheader65, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %65, %vector.body ]
  %0 = getelementptr inbounds nuw [4 x i8], ptr %x1, i64 %index
  %wide.load = load <4 x float>, ptr %0, align 4, !tbaa !10
  %1 = fpext <4 x float> %wide.load to <4 x double>
  %2 = getelementptr inbounds nuw [4 x i8], ptr %x1_outputFromGpu, i64 %index
  %wide.load60 = load <4 x float>, ptr %2, align 4, !tbaa !10
  %3 = fpext <4 x float> %wide.load60 to <4 x double>
  %4 = fcmp olt <4 x double> %1, splat (double f0xB690000000000000)
  %5 = fneg <4 x float> %wide.load
  %6 = select <4 x i1> %4, <4 x float> %5, <4 x float> %wide.load
  %7 = fpext <4 x float> %6 to <4 x double>
  %8 = fcmp uge <4 x double> %7, splat (double 1.000000e-02)
  %9 = fcmp olt <4 x double> %3, splat (double f0xB690000000000000)
  %10 = fneg <4 x float> %wide.load60
  %11 = select <4 x i1> %9, <4 x float> %10, <4 x float> %wide.load60
  %12 = fpext <4 x float> %11 to <4 x double>
  %13 = fcmp uge <4 x double> %12, splat (double 1.000000e-02)
  %14 = select <4 x i1> %8, <4 x i1> splat (i1 true), <4 x i1> %13
  %15 = fsub <4 x double> %1, %3
  %16 = fptrunc <4 x double> %15 to <4 x float>
  %17 = fcmp olt <4 x double> %15, splat (double f0xB690000000000000)
  %18 = fneg <4 x float> %16
  %19 = select <4 x i1> %17, <4 x float> %18, <4 x float> %16
  %20 = fadd <4 x double> %1, splat (double f0x3E45798EE0000000)
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
  %narrow = select <4 x i1> %14, <4 x i1> %31, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %32 = add <4 x i32> %vec.phi, %predphi
  %33 = getelementptr inbounds nuw [4 x i8], ptr %x2, i64 %index
  %wide.load61 = load <4 x float>, ptr %33, align 4, !tbaa !10
  %34 = fpext <4 x float> %wide.load61 to <4 x double>
  %35 = getelementptr inbounds nuw [4 x i8], ptr %x2_outputFromGpu, i64 %index
  %wide.load62 = load <4 x float>, ptr %35, align 4, !tbaa !10
  %36 = fpext <4 x float> %wide.load62 to <4 x double>
  %37 = fcmp olt <4 x double> %34, splat (double f0xB690000000000000)
  %38 = fneg <4 x float> %wide.load61
  %39 = select <4 x i1> %37, <4 x float> %38, <4 x float> %wide.load61
  %40 = fpext <4 x float> %39 to <4 x double>
  %41 = fcmp uge <4 x double> %40, splat (double 1.000000e-02)
  %42 = fcmp olt <4 x double> %36, splat (double f0xB690000000000000)
  %43 = fneg <4 x float> %wide.load62
  %44 = select <4 x i1> %42, <4 x float> %43, <4 x float> %wide.load62
  %45 = fpext <4 x float> %44 to <4 x double>
  %46 = fcmp uge <4 x double> %45, splat (double 1.000000e-02)
  %47 = select <4 x i1> %41, <4 x i1> splat (i1 true), <4 x i1> %46
  %48 = fsub <4 x double> %34, %36
  %49 = fptrunc <4 x double> %48 to <4 x float>
  %50 = fcmp olt <4 x double> %48, splat (double f0xB690000000000000)
  %51 = fneg <4 x float> %49
  %52 = select <4 x i1> %50, <4 x float> %51, <4 x float> %49
  %53 = fadd <4 x double> %34, splat (double f0x3E45798EE0000000)
  %54 = fptrunc <4 x double> %53 to <4 x float>
  %55 = fcmp olt <4 x double> %53, splat (double f0xB690000000000000)
  %56 = fneg <4 x float> %54
  %57 = select <4 x i1> %55, <4 x float> %56, <4 x float> %54
  %58 = fdiv <4 x float> %52, %57
  %59 = fcmp olt <4 x float> %58, zeroinitializer
  %60 = fneg <4 x float> %58
  %61 = select <4 x i1> %59, <4 x float> %60, <4 x float> %58
  %62 = fmul <4 x float> %61, splat (float 1.000000e+02)
  %63 = fpext <4 x float> %62 to <4 x double>
  %64 = fcmp ogt <4 x double> %63, splat (double 5.000000e-02)
  %narrow64 = select <4 x i1> %47, <4 x i1> %64, <4 x i1> zeroinitializer
  %predphi63 = zext <4 x i1> %narrow64 to <4 x i32>
  %65 = add <4 x i32> %32, %predphi63
  %index.next = add nuw i64 %index, 4
  %66 = icmp eq i64 %index.next, %n.vec
  br i1 %66, label %middle.block, label %vector.body, !llvm.loop !22

middle.block:                                     ; preds = %vector.body
  %67 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %65)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.end, label %for.body.preheader65

for.body.preheader65:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %fail.058.ph = phi i32 [ 0, %for.body.preheader ], [ %67, %middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.body.preheader65, %_Z11percentDiffdd.exit55
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit55 ], [ %indvars.iv.ph, %for.body.preheader65 ]
  %fail.058 = phi i32 [ %fail.2, %_Z11percentDiffdd.exit55 ], [ %fail.058.ph, %for.body.preheader65 ]
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %x1, i64 %indvars.iv
  %68 = load float, ptr %arrayidx, align 4, !tbaa !10
  %conv = fpext float %68 to double
  %arrayidx2 = getelementptr inbounds nuw [4 x i8], ptr %x1_outputFromGpu, i64 %indvars.iv
  %69 = load float, ptr %arrayidx2, align 4, !tbaa !10
  %conv3 = fpext float %69 to double
  %cmp.i.i = fcmp olt double %conv, f0xB690000000000000
  %mul.i.i = fneg float %68
  %retval.0.i.i = select i1 %cmp.i.i, float %mul.i.i, float %68
  %conv1.i = fpext float %retval.0.i.i to double
  %cmp.i = fcmp olt double %conv1.i, 1.000000e-02
  br i1 %cmp.i, label %land.lhs.true.i, label %if.else.i

land.lhs.true.i:                                  ; preds = %for.body
  %cmp.i14.i = fcmp olt double %conv3, f0xB690000000000000
  %mul.i15.i = fneg float %69
  %retval.0.i16.i = select i1 %cmp.i14.i, float %mul.i15.i, float %69
  %conv4.i = fpext float %retval.0.i16.i to double
  %cmp5.i = fcmp olt double %conv4.i, 1.000000e-02
  br i1 %cmp5.i, label %_Z11percentDiffdd.exit, label %if.else.i

if.else.i:                                        ; preds = %land.lhs.true.i, %for.body
  %70 = insertelement <2 x double> poison, double %conv, i64 0
  %71 = shufflevector <2 x double> %70, <2 x double> poison, <2 x i32> zeroinitializer
  %72 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv3, i64 0
  %73 = fsub <2 x double> %71, %72
  %74 = fptrunc <2 x double> %73 to <2 x float>
  %75 = fcmp olt <2 x double> %73, splat (double f0xB690000000000000)
  %76 = fneg <2 x float> %74
  %77 = select <2 x i1> %75, <2 x float> %76, <2 x float> %74
  %78 = extractelement <2 x float> %77, i64 0
  %79 = extractelement <2 x float> %77, i64 1
  %div.i = fdiv float %78, %79
  %cmp.i23.i = fcmp olt float %div.i, 0.000000e+00
  %mul.i24.i = fneg float %div.i
  %retval.0.i25.i = select i1 %cmp.i23.i, float %mul.i24.i, float %div.i
  %mul.i = fmul float %retval.0.i25.i, 1.000000e+02
  %80 = fpext float %mul.i to double
  %81 = fcmp ogt double %80, 5.000000e-02
  %82 = zext i1 %81 to i32
  br label %_Z11percentDiffdd.exit

_Z11percentDiffdd.exit:                           ; preds = %land.lhs.true.i, %if.else.i
  %retval.0.i = phi i32 [ %82, %if.else.i ], [ 0, %land.lhs.true.i ]
  %fail.1 = add nsw i32 %retval.0.i, %fail.058
  %arrayidx7 = getelementptr inbounds nuw [4 x i8], ptr %x2, i64 %indvars.iv
  %83 = load float, ptr %arrayidx7, align 4, !tbaa !10
  %conv8 = fpext float %83 to double
  %arrayidx10 = getelementptr inbounds nuw [4 x i8], ptr %x2_outputFromGpu, i64 %indvars.iv
  %84 = load float, ptr %arrayidx10, align 4, !tbaa !10
  %conv11 = fpext float %84 to double
  %cmp.i.i27 = fcmp olt double %conv8, f0xB690000000000000
  %mul.i.i28 = fneg float %83
  %retval.0.i.i29 = select i1 %cmp.i.i27, float %mul.i.i28, float %83
  %conv1.i30 = fpext float %retval.0.i.i29 to double
  %cmp.i31 = fcmp olt double %conv1.i30, 1.000000e-02
  br i1 %cmp.i31, label %land.lhs.true.i49, label %if.else.i32

land.lhs.true.i49:                                ; preds = %_Z11percentDiffdd.exit
  %cmp.i14.i50 = fcmp olt double %conv11, f0xB690000000000000
  %mul.i15.i51 = fneg float %84
  %retval.0.i16.i52 = select i1 %cmp.i14.i50, float %mul.i15.i51, float %84
  %conv4.i53 = fpext float %retval.0.i16.i52 to double
  %cmp5.i54 = fcmp olt double %conv4.i53, 1.000000e-02
  br i1 %cmp5.i54, label %_Z11percentDiffdd.exit55, label %if.else.i32

if.else.i32:                                      ; preds = %land.lhs.true.i49, %_Z11percentDiffdd.exit
  %85 = insertelement <2 x double> poison, double %conv8, i64 0
  %86 = shufflevector <2 x double> %85, <2 x double> poison, <2 x i32> zeroinitializer
  %87 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv11, i64 0
  %88 = fsub <2 x double> %86, %87
  %89 = fptrunc <2 x double> %88 to <2 x float>
  %90 = fcmp olt <2 x double> %88, splat (double f0xB690000000000000)
  %91 = fneg <2 x float> %89
  %92 = select <2 x i1> %90, <2 x float> %91, <2 x float> %89
  %93 = extractelement <2 x float> %92, i64 0
  %94 = extractelement <2 x float> %92, i64 1
  %div.i43 = fdiv float %93, %94
  %cmp.i23.i44 = fcmp olt float %div.i43, 0.000000e+00
  %mul.i24.i45 = fneg float %div.i43
  %retval.0.i25.i46 = select i1 %cmp.i23.i44, float %mul.i24.i45, float %div.i43
  %mul.i47 = fmul float %retval.0.i25.i46, 1.000000e+02
  %95 = fpext float %mul.i47 to double
  %96 = fcmp ogt double %95, 5.000000e-02
  %97 = zext i1 %96 to i32
  br label %_Z11percentDiffdd.exit55

_Z11percentDiffdd.exit55:                         ; preds = %land.lhs.true.i49, %if.else.i32
  %retval.0.i48 = phi i32 [ %97, %if.else.i32 ], [ 0, %land.lhs.true.i49 ]
  %fail.2 = add nsw i32 %fail.1, %retval.0.i48
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !23

for.end:                                          ; preds = %_Z11percentDiffdd.exit55, %middle.block, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %67, %middle.block ], [ %fail.2, %_Z11percentDiffdd.exit55 ]
  %call19 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %fail.0.lcssa) #15
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
define dso_local void @_Z26__device_stub__mvt_kernel1iPfS_S_(i32 noundef %n, ptr noundef %a, ptr noundef %x1, ptr noundef %y_1) #9 {
entry:
  %n.addr = alloca i32, align 4
  %a.addr = alloca ptr, align 8
  %x1.addr = alloca ptr, align 8
  %y_1.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !24
  store ptr %a, ptr %a.addr, align 8, !tbaa !25
  store ptr %x1, ptr %x1.addr, align 8, !tbaa !25
  store ptr %y_1, ptr %y_1.addr, align 8, !tbaa !25
  %kernel_args1 = alloca [4 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %a.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %x1.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %y_1.addr, ptr %2, align 8
  %3 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %4 = load i64, ptr %shmem_size, align 8
  %5 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mvt_kernel1iPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__mvt_kernel2iPfS_S_(i32 noundef %n, ptr noundef %a, ptr noundef %x2, ptr noundef %y_2) #9 {
entry:
  %n.addr = alloca i32, align 4
  %a.addr = alloca ptr, align 8
  %x2.addr = alloca ptr, align 8
  %y_2.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !24
  store ptr %a, ptr %a.addr, align 8, !tbaa !25
  store ptr %x2, ptr %x2.addr, align 8, !tbaa !25
  store ptr %y_2, ptr %y_2.addr, align 8, !tbaa !25
  %kernel_args1 = alloca [4 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %a.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %x2.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %y_2.addr, ptr %2, align 8
  %3 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %4 = load i64, ptr %shmem_size, align 8
  %5 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mvt_kernel2iPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z7mvtCudaiPA4096_fPfS1_S1_S1_S1_S1_(i32 noundef %n, ptr noundef %a, ptr noundef %x1, ptr noundef %x2, ptr noundef %y_1, ptr noundef %y_2, ptr noundef %x1_outputFromGpu, ptr noundef %x2_outputFromGpu) local_unnamed_addr #7 {
entry:
  %Tp.i.i46 = alloca %struct.timeval, align 8
  %n.addr.i32 = alloca i32, align 4
  %a.addr.i33 = alloca ptr, align 8
  %x2.addr.i = alloca ptr, align 8
  %y_2.addr.i = alloca ptr, align 8
  %grid_dim.i34 = alloca %struct.dim3, align 8
  %block_dim.i35 = alloca %struct.dim3, align 8
  %shmem_size.i36 = alloca i64, align 8
  %stream.i37 = alloca ptr, align 8
  %kernel_args1.i38 = alloca [4 x ptr], align 16
  %n.addr.i = alloca i32, align 4
  %a.addr.i = alloca ptr, align 8
  %x1.addr.i = alloca ptr, align 8
  %y_1.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [4 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %a_gpu = alloca ptr, align 8
  %x1_gpu = alloca ptr, align 8
  %x2_gpu = alloca ptr, align 8
  %y_1_gpu = alloca ptr, align 8
  %y_2_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %a_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %x1_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %x2_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %y_1_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %y_2_gpu) #16
  %call = call i32 @cudaMalloc(ptr noundef nonnull %a_gpu, i64 noundef 67108864) #15
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %x1_gpu, i64 noundef 16384) #15
  %call2 = call i32 @cudaMalloc(ptr noundef nonnull %x2_gpu, i64 noundef 16384) #15
  %call3 = call i32 @cudaMalloc(ptr noundef nonnull %y_1_gpu, i64 noundef 16384) #15
  %call4 = call i32 @cudaMalloc(ptr noundef nonnull %y_2_gpu, i64 noundef 16384) #15
  %0 = load ptr, ptr %a_gpu, align 8, !tbaa !25
  %call5 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %a, i64 noundef 67108864, i32 noundef 1) #15
  %1 = load ptr, ptr %x1_gpu, align 8, !tbaa !25
  %call6 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %x1, i64 noundef 16384, i32 noundef 1) #15
  %2 = load ptr, ptr %x2_gpu, align 8, !tbaa !25
  %call7 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %x2, i64 noundef 16384, i32 noundef 1) #15
  %3 = load ptr, ptr %y_1_gpu, align 8, !tbaa !25
  %call8 = call i32 @cudaMemcpy(ptr noundef %3, ptr noundef %y_1, i64 noundef 16384, i32 noundef 1) #15
  %4 = load ptr, ptr %y_2_gpu, align 8, !tbaa !25
  %call9 = call i32 @cudaMemcpy(ptr noundef %4, ptr noundef %y_2, i64 noundef 16384, i32 noundef 1) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #16
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #15
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %5 = load i64, ptr %Tp.i.i, align 8, !tbaa !28
  %conv.i.i = sitofp i64 %5 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %6 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !31
  %conv2.i.i = sitofp i64 %6 to double
  %7 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #16
  store double %7, ptr @polybench_t_start, align 8, !tbaa !32
  %call13 = call i32 @__cudaPushCallConfiguration(i64 4294967424, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool.not = icmp eq i32 %call13, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %8 = load ptr, ptr %a_gpu, align 8, !tbaa !25
  %9 = load ptr, ptr %x1_gpu, align 8, !tbaa !25
  %10 = load ptr, ptr %y_1_gpu, align 8, !tbaa !25
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %a.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %x1.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %y_1.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %n, ptr %n.addr.i, align 4, !tbaa !24
  store ptr %8, ptr %a.addr.i, align 8, !tbaa !25
  store ptr %9, ptr %x1.addr.i, align 8, !tbaa !25
  store ptr %10, ptr %y_1.addr.i, align 8, !tbaa !25
  store ptr %n.addr.i, ptr %kernel_args1.i, align 16
  %11 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %a.addr.i, ptr %11, align 8
  %12 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %x1.addr.i, ptr %12, align 16
  %13 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %y_1.addr.i, ptr %13, align 8
  %14 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !34
  %15 = load i64, ptr %shmem_size.i, align 8
  %16 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mvt_kernel1iPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %15, ptr noundef %16), !inline_history !34
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %a.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %x1.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %y_1.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %_Z21polybench_timer_startv.exit
  %call16 = call i32 @__cudaPushCallConfiguration(i64 4294967424, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool17.not = icmp eq i32 %call16, 0
  br i1 %tobool17.not, label %kcall.configok18, label %kcall.end19

kcall.configok18:                                 ; preds = %kcall.end
  %17 = load ptr, ptr %a_gpu, align 8, !tbaa !25
  %18 = load ptr, ptr %x2_gpu, align 8, !tbaa !25
  %19 = load ptr, ptr %y_2_gpu, align 8, !tbaa !25
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i32)
  call void @llvm.lifetime.start.p0(ptr nonnull %a.addr.i33)
  call void @llvm.lifetime.start.p0(ptr nonnull %x2.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %y_2.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i34)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i35)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i36)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i37)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i38)
  store i32 %n, ptr %n.addr.i32, align 4, !tbaa !24
  store ptr %17, ptr %a.addr.i33, align 8, !tbaa !25
  store ptr %18, ptr %x2.addr.i, align 8, !tbaa !25
  store ptr %19, ptr %y_2.addr.i, align 8, !tbaa !25
  store ptr %n.addr.i32, ptr %kernel_args1.i38, align 16
  %20 = getelementptr inbounds nuw i8, ptr %kernel_args1.i38, i64 8
  store ptr %a.addr.i33, ptr %20, align 8
  %21 = getelementptr inbounds nuw i8, ptr %kernel_args1.i38, i64 16
  store ptr %x2.addr.i, ptr %21, align 16
  %22 = getelementptr inbounds nuw i8, ptr %kernel_args1.i38, i64 24
  store ptr %y_2.addr.i, ptr %22, align 8
  %23 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i34, ptr nonnull %block_dim.i35, ptr nonnull %shmem_size.i36, ptr nonnull %stream.i37), !inline_history !35
  %24 = load i64, ptr %shmem_size.i36, align 8
  %25 = load ptr, ptr %stream.i37, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i39 = load i64, ptr %grid_dim.i34, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i40 = getelementptr inbounds nuw i8, ptr %grid_dim.i34, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i41 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i40, align 8
  %block_dim.coerce.sroa.0.0.copyload.i42 = load i64, ptr %block_dim.i35, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i43 = getelementptr inbounds nuw i8, ptr %block_dim.i35, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i44 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i43, align 8
  %call.i45 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mvt_kernel2iPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i39, i32 %grid_dim.coerce.sroa.2.0.copyload.i41, i64 %block_dim.coerce.sroa.0.0.copyload.i42, i32 %block_dim.coerce.sroa.2.0.copyload.i44, ptr noundef nonnull %kernel_args1.i38, i64 noundef %24, ptr noundef %25), !inline_history !35
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i32)
  call void @llvm.lifetime.end.p0(ptr nonnull %a.addr.i33)
  call void @llvm.lifetime.end.p0(ptr nonnull %x2.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %y_2.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i34)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i35)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i36)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i37)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i38)
  br label %kcall.end19

kcall.end19:                                      ; preds = %kcall.configok18, %kcall.end
  %call20 = call i32 @cudaThreadSynchronize() #15
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i46) #16
  %call.i.i47 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i46, ptr noundef null) #17
  %cmp.not.i.i48 = icmp eq i32 %call.i.i47, 0
  br i1 %cmp.not.i.i48, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i49

if.then.i.i49:                                    ; preds = %kcall.end19
  %call1.i.i50 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i47) #15
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end19, %if.then.i.i49
  %26 = load i64, ptr %Tp.i.i46, align 8, !tbaa !28
  %conv.i.i51 = sitofp i64 %26 to double
  %tv_usec.i.i52 = getelementptr inbounds nuw i8, ptr %Tp.i.i46, i64 8
  %27 = load i64, ptr %tv_usec.i.i52, align 8, !tbaa !31
  %conv2.i.i53 = sitofp i64 %27 to double
  %28 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i53, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i51)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i46) #16
  store double %28, ptr @polybench_t_end, align 8, !tbaa !32
  %29 = load double, ptr @polybench_t_start, align 8, !tbaa !32
  %sub.i = fsub double %28, %29
  %call.i54 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #15
  %30 = load ptr, ptr %x1_gpu, align 8, !tbaa !25
  %call22 = call i32 @cudaMemcpy(ptr noundef %x1_outputFromGpu, ptr noundef %30, i64 noundef 16384, i32 noundef 2) #15
  %31 = load ptr, ptr %x2_gpu, align 8, !tbaa !25
  %call23 = call i32 @cudaMemcpy(ptr noundef %x2_outputFromGpu, ptr noundef %31, i64 noundef 16384, i32 noundef 2) #15
  %32 = load ptr, ptr %a_gpu, align 8, !tbaa !25
  %call24 = call i32 @cudaFree(ptr noundef %32) #15
  %33 = load ptr, ptr %x1_gpu, align 8, !tbaa !25
  %call25 = call i32 @cudaFree(ptr noundef %33) #15
  %34 = load ptr, ptr %x2_gpu, align 8, !tbaa !25
  %call26 = call i32 @cudaFree(ptr noundef %34) #15
  %35 = load ptr, ptr %y_1_gpu, align 8, !tbaa !25
  %call27 = call i32 @cudaFree(ptr noundef %35) #15
  %36 = load ptr, ptr %y_2_gpu, align 8, !tbaa !25
  %call28 = call i32 @cudaFree(ptr noundef %36) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %y_2_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %y_1_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %x2_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %x1_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %a_gpu) #16
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !28
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !31
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #16
  store double %2, ptr @polybench_t_start, align 8, !tbaa !32
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !28
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !31
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #16
  store double %2, ptr @polybench_t_end, align 8, !tbaa !32
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !32
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !32
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #15
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #9 {
entry:
  %Tp.i.i99 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i87 = alloca ptr, align 8
  %newA.i.i80 = alloca ptr, align 8
  %newA.i.i73 = alloca ptr, align 8
  %newA.i.i66 = alloca ptr, align 8
  %newA.i.i59 = alloca ptr, align 8
  %newA.i.i52 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #16
  store ptr null, ptr %newA.i.i, align 8, !tbaa !36
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 67108864) #17
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !36
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !37
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i52) #16
  store ptr null, ptr %newA.i.i52, align 8, !tbaa !36
  %call.i.i53 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i52, i64 noundef 32, i64 noundef 16384) #17
  %3 = load ptr, ptr %newA.i.i52, align 8, !tbaa !36
  %tobool.i.i54 = icmp eq ptr %3, null
  %tobool1.i.i55 = icmp ne i32 %call.i.i53, 0
  %or.cond.i.i56 = select i1 %tobool.i.i54, i1 true, i1 %tobool1.i.i55
  br i1 %or.cond.i.i56, label %if.then.i.i57, label %_Z20polybench_alloc_datayi.exit58

if.then.i.i57:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !37
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit58:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i52) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i59) #16
  store ptr null, ptr %newA.i.i59, align 8, !tbaa !36
  %call.i.i60 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i59, i64 noundef 32, i64 noundef 16384) #17
  %6 = load ptr, ptr %newA.i.i59, align 8, !tbaa !36
  %tobool.i.i61 = icmp eq ptr %6, null
  %tobool1.i.i62 = icmp ne i32 %call.i.i60, 0
  %or.cond.i.i63 = select i1 %tobool.i.i61, i1 true, i1 %tobool1.i.i62
  br i1 %or.cond.i.i63, label %if.then.i.i64, label %_Z20polybench_alloc_datayi.exit65

if.then.i.i64:                                    ; preds = %_Z20polybench_alloc_datayi.exit58
  %7 = load ptr, ptr @stderr, align 8, !tbaa !37
  %8 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %7) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit65:                ; preds = %_Z20polybench_alloc_datayi.exit58
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i59) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i66) #16
  store ptr null, ptr %newA.i.i66, align 8, !tbaa !36
  %call.i.i67 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i66, i64 noundef 32, i64 noundef 16384) #17
  %9 = load ptr, ptr %newA.i.i66, align 8, !tbaa !36
  %tobool.i.i68 = icmp eq ptr %9, null
  %tobool1.i.i69 = icmp ne i32 %call.i.i67, 0
  %or.cond.i.i70 = select i1 %tobool.i.i68, i1 true, i1 %tobool1.i.i69
  br i1 %or.cond.i.i70, label %if.then.i.i71, label %_Z20polybench_alloc_datayi.exit72

if.then.i.i71:                                    ; preds = %_Z20polybench_alloc_datayi.exit65
  %10 = load ptr, ptr @stderr, align 8, !tbaa !37
  %11 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %10) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit72:                ; preds = %_Z20polybench_alloc_datayi.exit65
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i66) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i73) #16
  store ptr null, ptr %newA.i.i73, align 8, !tbaa !36
  %call.i.i74 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i73, i64 noundef 32, i64 noundef 16384) #17
  %12 = load ptr, ptr %newA.i.i73, align 8, !tbaa !36
  %tobool.i.i75 = icmp eq ptr %12, null
  %tobool1.i.i76 = icmp ne i32 %call.i.i74, 0
  %or.cond.i.i77 = select i1 %tobool.i.i75, i1 true, i1 %tobool1.i.i76
  br i1 %or.cond.i.i77, label %if.then.i.i78, label %_Z20polybench_alloc_datayi.exit79

if.then.i.i78:                                    ; preds = %_Z20polybench_alloc_datayi.exit72
  %13 = load ptr, ptr @stderr, align 8, !tbaa !37
  %14 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %13) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit79:                ; preds = %_Z20polybench_alloc_datayi.exit72
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i73) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i80) #16
  store ptr null, ptr %newA.i.i80, align 8, !tbaa !36
  %call.i.i81 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i80, i64 noundef 32, i64 noundef 16384) #17
  %15 = load ptr, ptr %newA.i.i80, align 8, !tbaa !36
  %tobool.i.i82 = icmp eq ptr %15, null
  %tobool1.i.i83 = icmp ne i32 %call.i.i81, 0
  %or.cond.i.i84 = select i1 %tobool.i.i82, i1 true, i1 %tobool1.i.i83
  br i1 %or.cond.i.i84, label %if.then.i.i85, label %_Z20polybench_alloc_datayi.exit86

if.then.i.i85:                                    ; preds = %_Z20polybench_alloc_datayi.exit79
  %16 = load ptr, ptr @stderr, align 8, !tbaa !37
  %17 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %16) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit86:                ; preds = %_Z20polybench_alloc_datayi.exit79
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i80) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i87) #16
  store ptr null, ptr %newA.i.i87, align 8, !tbaa !36
  %call.i.i88 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i87, i64 noundef 32, i64 noundef 16384) #17
  %18 = load ptr, ptr %newA.i.i87, align 8, !tbaa !36
  %tobool.i.i89 = icmp eq ptr %18, null
  %tobool1.i.i90 = icmp ne i32 %call.i.i88, 0
  %or.cond.i.i91 = select i1 %tobool.i.i89, i1 true, i1 %tobool1.i.i90
  br i1 %or.cond.i.i91, label %if.then.i.i92, label %_Z20polybench_alloc_datayi.exit93

if.then.i.i92:                                    ; preds = %_Z20polybench_alloc_datayi.exit86
  %19 = load ptr, ptr @stderr, align 8, !tbaa !37
  %20 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %19) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit93:                ; preds = %_Z20polybench_alloc_datayi.exit86
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i87) #16
  br label %for.body.us.i

for.body.us.i:                                    ; preds = %for.cond15.for.inc25_crit_edge.us.i, %_Z20polybench_alloc_datayi.exit93
  %indvars.iv48.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit93 ], [ %indvars.iv.next49.i, %for.cond15.for.inc25_crit_edge.us.i ]
  %21 = trunc nuw nsw i64 %indvars.iv48.i to i32
  %arrayidx.us.i = getelementptr inbounds nuw [4 x i8], ptr %3, i64 %indvars.iv48.i
  %arrayidx4.us.i = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv48.i
  %arrayidx9.us.i = getelementptr inbounds nuw [4 x i8], ptr %15, i64 %indvars.iv48.i
  %conv.us.i = uitofp nneg i32 %21 to float
  %22 = insertelement <4 x float> poison, float %conv.us.i, i64 0
  %23 = shufflevector <4 x float> %22, <4 x float> poison, <4 x i32> zeroinitializer
  %24 = fadd nnan <4 x float> %23, <float -0.000000e+00, float 1.000000e+00, float 3.000000e+00, float 4.000000e+00>
  %25 = fmul nnan <4 x float> %24, splat (float f0x39800000)
  %26 = extractelement <4 x float> %25, i64 0
  store float %26, ptr %arrayidx.us.i, align 4, !tbaa !10
  %27 = extractelement <4 x float> %25, i64 1
  store float %27, ptr %arrayidx4.us.i, align 4, !tbaa !10
  %28 = extractelement <4 x float> %25, i64 2
  store float %28, ptr %arrayidx9.us.i, align 4, !tbaa !10
  %arrayidx14.us.i = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %indvars.iv48.i
  %29 = extractelement <4 x float> %25, i64 3
  store float %29, ptr %arrayidx14.us.i, align 4, !tbaa !10
  %arrayidx22.us.i = getelementptr inbounds nuw [16384 x i8], ptr %0, i64 %indvars.iv48.i
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body.us.i
  %index = phi i64 [ 0, %for.body.us.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.body.us.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %30 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %31 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %32 = fmul nnan <4 x float> %23, %30
  %33 = fmul nnan <4 x float> %23, %31
  %34 = fmul nnan <4 x float> %32, splat (float f0x39800000)
  %35 = fmul nnan <4 x float> %33, splat (float f0x39800000)
  %36 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx22.us.i, i64 %index
  %37 = getelementptr inbounds nuw i8, ptr %36, i64 16
  store <4 x float> %34, ptr %36, align 4, !tbaa !10
  store <4 x float> %35, ptr %37, align 4, !tbaa !10
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %38 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %39 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %40 = fmul nnan <4 x float> %23, %38
  %41 = fmul nnan <4 x float> %23, %39
  %42 = fmul nnan <4 x float> %40, splat (float f0x39800000)
  %43 = fmul nnan <4 x float> %41, splat (float f0x39800000)
  %44 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx22.us.i, i64 %index
  %45 = getelementptr inbounds nuw i8, ptr %44, i64 32
  %46 = getelementptr inbounds nuw i8, ptr %44, i64 48
  store <4 x float> %42, ptr %45, align 4, !tbaa !10
  store <4 x float> %43, ptr %46, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %47 = icmp eq i64 %index.next.1, 4096
  br i1 %47, label %for.cond15.for.inc25_crit_edge.us.i, label %vector.body, !llvm.loop !39

for.cond15.for.inc25_crit_edge.us.i:              ; preds = %vector.body
  %indvars.iv.next49.i = add nuw nsw i64 %indvars.iv48.i, 1
  %exitcond52.not.i = icmp eq i64 %indvars.iv.next49.i, 4096
  br i1 %exitcond52.not.i, label %_Z10init_arrayiPA4096_fPfS1_S1_S1_.exit, label %for.body.us.i, !llvm.loop !17

_Z10init_arrayiPA4096_fPfS1_S1_S1_.exit:          ; preds = %for.cond15.for.inc25_crit_edge.us.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #16
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #15
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #15
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #16
  call void @_Z7mvtCudaiPA4096_fPfS1_S1_S1_S1_S1_(i32 noundef 4096, ptr noundef nonnull %0, ptr noundef nonnull %3, ptr noundef nonnull %6, ptr noundef nonnull %15, ptr noundef nonnull %18, ptr noundef nonnull %9, ptr noundef nonnull %12) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #16
  %call.i.i94 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i94, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i95

if.then.i.i95:                                    ; preds = %_Z10init_arrayiPA4096_fPfS1_S1_S1_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i94) #15
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiPA4096_fPfS1_S1_S1_.exit, %if.then.i.i95
  %48 = load i64, ptr %Tp.i.i, align 8, !tbaa !28
  %conv.i.i = sitofp i64 %48 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %49 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !31
  %conv2.i.i = sitofp i64 %49 to double
  %50 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #16
  store double %50, ptr @polybench_t_start, align 8, !tbaa !32
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.inc12.i, %_Z21polybench_timer_startv.exit
  %indvars.iv66.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next67.i, %for.inc12.i ]
  %arrayidx.i = getelementptr inbounds nuw [4 x i8], ptr %3, i64 %indvars.iv66.i
  %arrayidx5.i = getelementptr inbounds nuw [16384 x i8], ptr %0, i64 %indvars.iv66.i
  %arrayidx.promoted.i = load float, ptr %arrayidx.i, align 4, !tbaa !10
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %indvars.iv.i96 = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i97.1, %for.body3.i ]
  %51 = phi float [ %arrayidx.promoted.i, %for.cond1.preheader.i ], [ %57, %for.body3.i ]
  %arrayidx7.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx5.i, i64 %indvars.iv.i96
  %52 = load float, ptr %arrayidx7.i, align 4, !tbaa !10
  %arrayidx9.i = getelementptr inbounds nuw [4 x i8], ptr %15, i64 %indvars.iv.i96
  %53 = load float, ptr %arrayidx9.i, align 4, !tbaa !10
  %54 = call float @llvm.fmuladd.f32(float %52, float %53, float %51)
  store float %54, ptr %arrayidx.i, align 4, !tbaa !10
  %indvars.iv.next.i97 = or disjoint i64 %indvars.iv.i96, 1
  %arrayidx7.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx5.i, i64 %indvars.iv.next.i97
  %55 = load float, ptr %arrayidx7.i.1, align 4, !tbaa !10
  %arrayidx9.i.1 = getelementptr inbounds nuw [4 x i8], ptr %15, i64 %indvars.iv.next.i97
  %56 = load float, ptr %arrayidx9.i.1, align 4, !tbaa !10
  %57 = call float @llvm.fmuladd.f32(float %55, float %56, float %54)
  store float %57, ptr %arrayidx.i, align 4, !tbaa !10
  %indvars.iv.next.i97.1 = add nuw nsw i64 %indvars.iv.i96, 2
  %exitcond.not.i98.1 = icmp eq i64 %indvars.iv.next.i97.1, 4096
  br i1 %exitcond.not.i98.1, label %for.inc12.i, label %for.body3.i, !llvm.loop !18

for.inc12.i:                                      ; preds = %for.body3.i
  %indvars.iv.next67.i = add nuw nsw i64 %indvars.iv66.i, 1
  %exitcond69.not.i = icmp eq i64 %indvars.iv.next67.i, 4096
  br i1 %exitcond69.not.i, label %for.cond18.preheader.i, label %for.cond1.preheader.i, !llvm.loop !19

for.cond18.preheader.i:                           ; preds = %for.inc12.i, %for.cond18.for.inc34_crit_edge.i
  %indvars.iv75.i = phi i64 [ %indvars.iv.next76.i, %for.cond18.for.inc34_crit_edge.i ], [ 0, %for.inc12.i ]
  %arrayidx22.i = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv75.i
  %invariant.gep.i = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv75.i
  %arrayidx22.promoted.i = load float, ptr %arrayidx22.i, align 4, !tbaa !10
  br label %for.body20.i

for.body20.i:                                     ; preds = %for.body20.i, %for.cond18.preheader.i
  %indvars.iv70.i = phi i64 [ 0, %for.cond18.preheader.i ], [ %indvars.iv.next71.i.1, %for.body20.i ]
  %58 = phi float [ %arrayidx22.promoted.i, %for.cond18.preheader.i ], [ %64, %for.body20.i ]
  %gep.i = getelementptr inbounds nuw [16384 x i8], ptr %invariant.gep.i, i64 %indvars.iv70.i
  %59 = load float, ptr %gep.i, align 4, !tbaa !10
  %arrayidx28.i = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %indvars.iv70.i
  %60 = load float, ptr %arrayidx28.i, align 4, !tbaa !10
  %61 = call float @llvm.fmuladd.f32(float %59, float %60, float %58)
  store float %61, ptr %arrayidx22.i, align 4, !tbaa !10
  %indvars.iv.next71.i = or disjoint i64 %indvars.iv70.i, 1
  %gep.i.1 = getelementptr inbounds nuw [16384 x i8], ptr %invariant.gep.i, i64 %indvars.iv.next71.i
  %62 = load float, ptr %gep.i.1, align 4, !tbaa !10
  %arrayidx28.i.1 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %indvars.iv.next71.i
  %63 = load float, ptr %arrayidx28.i.1, align 4, !tbaa !10
  %64 = call float @llvm.fmuladd.f32(float %62, float %63, float %61)
  store float %64, ptr %arrayidx22.i, align 4, !tbaa !10
  %indvars.iv.next71.i.1 = add nuw nsw i64 %indvars.iv70.i, 2
  %exitcond74.not.i.1 = icmp eq i64 %indvars.iv.next71.i.1, 4096
  br i1 %exitcond74.not.i.1, label %for.cond18.for.inc34_crit_edge.i, label %for.body20.i, !llvm.loop !20

for.cond18.for.inc34_crit_edge.i:                 ; preds = %for.body20.i
  %indvars.iv.next76.i = add nuw nsw i64 %indvars.iv75.i, 1
  %exitcond79.not.i = icmp eq i64 %indvars.iv.next76.i, 4096
  br i1 %exitcond79.not.i, label %_Z6runMvtiPA4096_fPfS1_S1_S1_.exit, label %for.cond18.preheader.i, !llvm.loop !21

_Z6runMvtiPA4096_fPfS1_S1_S1_.exit:               ; preds = %for.cond18.for.inc34_crit_edge.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i99) #16
  %call.i.i100 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i99, ptr noundef null) #17
  %cmp.not.i.i101 = icmp eq i32 %call.i.i100, 0
  br i1 %cmp.not.i.i101, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i102

if.then.i.i102:                                   ; preds = %_Z6runMvtiPA4096_fPfS1_S1_S1_.exit
  %call1.i.i103 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i100) #15
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z6runMvtiPA4096_fPfS1_S1_S1_.exit, %if.then.i.i102
  %65 = load i64, ptr %Tp.i.i99, align 8, !tbaa !28
  %conv.i.i104 = sitofp i64 %65 to double
  %tv_usec.i.i105 = getelementptr inbounds nuw i8, ptr %Tp.i.i99, i64 8
  %66 = load i64, ptr %tv_usec.i.i105, align 8, !tbaa !31
  %conv2.i.i106 = sitofp i64 %66 to double
  %67 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i106, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i104)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i99) #16
  store double %67, ptr @polybench_t_end, align 8, !tbaa !32
  %68 = load double, ptr @polybench_t_start, align 8, !tbaa !32
  %sub.i = fsub double %67, %68
  %call.i107 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #15
  call void @_Z14compareResultsiPfS_S_S_(i32 noundef 4096, ptr noundef nonnull %3, ptr noundef nonnull %9, ptr noundef nonnull %6, ptr noundef nonnull %12) #15
  call void @free(ptr noundef nonnull %0) #17
  call void @free(ptr noundef %3) #17
  call void @free(ptr noundef nonnull %6) #17
  call void @free(ptr noundef %9) #17
  call void @free(ptr noundef %12) #17
  call void @free(ptr noundef %15) #17
  call void @free(ptr noundef nonnull %18) #17
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #16
  store ptr null, ptr %newA.i, align 8, !tbaa !36
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #17
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !36
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !37
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
declare double @llvm.fmuladd.f64(double, double, double) #4

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
attributes #1 = { mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #4 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
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
!12 = distinct !{!12, !13, !14, !15}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.isvectorized", i32 1}
!15 = !{!"llvm.loop.unroll.runtime.disable"}
!16 = distinct !{!16, !13, !15, !14}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !13}
!19 = distinct !{!19, !13}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !13}
!22 = distinct !{!22, !13, !14, !15}
!23 = distinct !{!23, !13, !15, !14}
!24 = !{!7, !7, i64 0}
!25 = !{!26, !26, i64 0}
!26 = !{!"p1 float", !27, i64 0}
!27 = !{!"any pointer", !8, i64 0}
!28 = !{!29, !30, i64 0}
!29 = !{!"_ZTS7timeval", !30, i64 0, !30, i64 8}
!30 = !{!"long", !8, i64 0}
!31 = !{!29, !30, i64 8}
!32 = !{!33, !33, i64 0}
!33 = !{!"double", !8, i64 0}
!34 = !{ptr @_Z26__device_stub__mvt_kernel1iPfS_S_}
!35 = !{ptr @_Z26__device_stub__mvt_kernel2iPfS_S_}
!36 = !{!27, !27, i64 0}
!37 = !{!38, !38, i64 0}
!38 = !{!"p1 _ZTS8_IO_FILE", !27, i64 0}
!39 = distinct !{!39, !13, !14, !15}
