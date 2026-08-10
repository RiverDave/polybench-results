; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/CORR/correlation.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/CORR/correlation.cu"
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
define dso_local void @_Z11init_arraysiiPA2048_f(i32 noundef %m, i32 noundef %n, ptr nofree noundef writeonly captures(none) %data) local_unnamed_addr #1 {
entry:
  %cmp18 = icmp sgt i32 %m, 0
  %cmp216 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp18, %cmp216
  br i1 %or.cond, label %for.cond1.preheader.preheader, label %for.end9

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count24 = zext nneg i32 %m to i64
  %wide.trip.count = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 8
  %n.vec = and i64 %wide.trip.count, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc7_crit_edge
  %indvars.iv21 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next22, %for.cond1.for.inc7_crit_edge ]
  %0 = trunc nuw nsw i64 %indvars.iv21 to i32
  %conv = uitofp nneg i32 %0 to float
  %arrayidx = getelementptr inbounds nuw [8192 x i8], ptr %data, i64 %indvars.iv21
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
  %5 = fmul nnan <4 x float> %3, splat (float f0x3A000000)
  %6 = fmul nnan <4 x float> %4, splat (float f0x3A000000)
  %7 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 16
  store <4 x float> %5, ptr %7, align 4, !tbaa !10
  store <4 x float> %6, ptr %8, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc7_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader ], [ %n.vec, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %10 = trunc nuw nsw i64 %indvars.iv to i32
  %conv4 = uitofp nneg i32 %10 to float
  %mul = fmul nnan float %conv, %conv4
  %div = fmul nnan float %mul, f0x3A000000
  %arrayidx6 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  store float %div, ptr %arrayidx6, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc7_crit_edge, label %for.body3, !llvm.loop !16

for.cond1.for.inc7_crit_edge:                     ; preds = %for.body3, %middle.block
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond25.not = icmp eq i64 %indvars.iv.next22, %wide.trip.count24
  br i1 %exitcond25.not, label %for.end9, label %for.cond1.preheader, !llvm.loop !17

for.end9:                                         ; preds = %for.cond1.for.inc7_crit_edge, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite, errnomem: write) uwtable
define dso_local void @_Z11correlationiiPA2048_fPfS1_S0_(i32 noundef %m, i32 noundef %n, ptr nofree noundef captures(none) %data, ptr nofree noundef captures(none) %mean, ptr nofree noundef captures(none) %stddev, ptr nofree noundef writeonly captures(none) %symmat) local_unnamed_addr #3 {
entry:
  %cmp225 = icmp sgt i32 %m, 0
  br i1 %cmp225, label %for.body.lr.ph, label %for.cond59.preheader.thread

for.body.lr.ph:                                   ; preds = %entry
  %cmp2223 = icmp sgt i32 %n, 0
  %wide.trip.count253 = zext nneg i32 %m to i64
  br i1 %cmp2223, label %for.body.us.preheader, label %for.body17.lr.ph.thread

for.body17.lr.ph.thread:                          ; preds = %for.body.lr.ph
  %0 = shl nuw nsw i64 %wide.trip.count253, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %mean, i8 0, i64 %0, i1 false), !tbaa !10
  %wide.trip.count258 = zext nneg i32 %m to i64
  %min.iters.check = icmp ult i32 %m, 8
  br i1 %min.iters.check, label %for.body17.preheader, label %vector.ph

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %wide.trip.count = zext nneg i32 %n to i64
  %xtraiter = and i64 %wide.trip.count, 3
  %1 = icmp ult i32 %n, 4
  %unroll_iter = and i64 %wide.trip.count, 2147483644
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod341 = icmp ne i64 %xtraiter, 0
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.end_crit_edge.us
  %indvars.iv250 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next251, %for.cond1.for.end_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %indvars.iv250
  store float 0.000000e+00, ptr %arrayidx.us, align 4, !tbaa !10
  %invariant.gep.us = getelementptr inbounds nuw [4 x i8], ptr %data, i64 %indvars.iv250
  br i1 %1, label %for.body3.us.epil.preheader, label %for.body3.us

for.body3.us:                                     ; preds = %for.body.us, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ 0, %for.body.us ]
  %2 = phi float [ %add.us.3, %for.body3.us ], [ 0.000000e+00, %for.body.us ]
  %niter = phi i64 [ %niter.next.3, %for.body3.us ], [ 0, %for.body.us ]
  %gep.us = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv
  %3 = load float, ptr %gep.us, align 4, !tbaa !10
  %add.us = fadd float %3, %2
  store float %add.us, ptr %arrayidx.us, align 4, !tbaa !10
  %4 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv
  %gep.us.1 = getelementptr inbounds nuw i8, ptr %4, i64 8192
  %5 = load float, ptr %gep.us.1, align 4, !tbaa !10
  %add.us.1 = fadd float %5, %add.us
  store float %add.us.1, ptr %arrayidx.us, align 4, !tbaa !10
  %6 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv
  %gep.us.2 = getelementptr inbounds nuw i8, ptr %6, i64 16384
  %7 = load float, ptr %gep.us.2, align 4, !tbaa !10
  %add.us.2 = fadd float %7, %add.us.1
  store float %add.us.2, ptr %arrayidx.us, align 4, !tbaa !10
  %8 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv
  %gep.us.3 = getelementptr inbounds nuw i8, ptr %8, i64 24576
  %9 = load float, ptr %gep.us.3, align 4, !tbaa !10
  %add.us.3 = fadd float %9, %add.us.2
  store float %add.us.3, ptr %arrayidx.us, align 4, !tbaa !10
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.next.3 = add i64 %niter, 4
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %for.cond1.for.end_crit_edge.us.unr-lcssa, label %for.body3.us, !llvm.loop !18

for.cond1.for.end_crit_edge.us.unr-lcssa:         ; preds = %for.body3.us
  br i1 %lcmp.mod.not, label %for.cond1.for.end_crit_edge.us, label %for.body3.us.epil.preheader

for.body3.us.epil.preheader:                      ; preds = %for.cond1.for.end_crit_edge.us.unr-lcssa, %for.body.us
  %indvars.iv.epil.init = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next.3, %for.cond1.for.end_crit_edge.us.unr-lcssa ]
  %.epil.init = phi float [ 0.000000e+00, %for.body.us ], [ %add.us.3, %for.cond1.for.end_crit_edge.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod341)
  br label %for.body3.us.epil

for.body3.us.epil:                                ; preds = %for.body3.us.epil, %for.body3.us.epil.preheader
  %indvars.iv.epil = phi i64 [ %indvars.iv.epil.init, %for.body3.us.epil.preheader ], [ %indvars.iv.next.epil, %for.body3.us.epil ]
  %10 = phi float [ %.epil.init, %for.body3.us.epil.preheader ], [ %add.us.epil, %for.body3.us.epil ]
  %epil.iter = phi i64 [ 0, %for.body3.us.epil.preheader ], [ %epil.iter.next, %for.body3.us.epil ]
  %gep.us.epil = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv.epil
  %11 = load float, ptr %gep.us.epil, align 4, !tbaa !10
  %add.us.epil = fadd float %11, %10
  store float %add.us.epil, ptr %arrayidx.us, align 4, !tbaa !10
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.cond1.for.end_crit_edge.us, label %for.body3.us.epil, !llvm.loop !19

for.cond1.for.end_crit_edge.us:                   ; preds = %for.body3.us.epil, %for.cond1.for.end_crit_edge.us.unr-lcssa
  %add.us.lcssa = phi float [ %add.us.3, %for.cond1.for.end_crit_edge.us.unr-lcssa ], [ %add.us.epil, %for.body3.us.epil ]
  %div.us = fdiv float %add.us.lcssa, f0x4A442E10
  store float %div.us, ptr %arrayidx.us, align 4, !tbaa !10
  %indvars.iv.next251 = add nuw nsw i64 %indvars.iv250, 1
  %exitcond254.not = icmp eq i64 %indvars.iv.next251, %wide.trip.count253
  br i1 %exitcond254.not, label %for.body17.us.preheader, label %for.body.us, !llvm.loop !21

vector.ph:                                        ; preds = %for.body17.lr.ph.thread
  %n.vec = and i64 %wide.trip.count258, 2147483640
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %12 = getelementptr inbounds nuw [4 x i8], ptr %stddev, i64 %index
  %13 = getelementptr inbounds nuw i8, ptr %12, i64 16
  store <4 x float> splat (float 1.000000e+00), ptr %12, align 4, !tbaa !10
  store <4 x float> splat (float 1.000000e+00), ptr %13, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %14 = icmp eq i64 %index.next, %n.vec
  br i1 %14, label %middle.block, label %vector.body, !llvm.loop !22

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count258
  br i1 %cmp.n, label %for.cond59.preheader.thread, label %for.body17.preheader

for.body17.preheader:                             ; preds = %for.body17.lr.ph.thread, %middle.block
  %indvars.iv255.ph = phi i64 [ 0, %for.body17.lr.ph.thread ], [ %n.vec, %middle.block ]
  br label %for.body17

for.body17.us.preheader:                          ; preds = %for.cond1.for.end_crit_edge.us
  %wide.trip.count268 = zext nneg i32 %m to i64
  %xtraiter342 = and i64 %wide.trip.count, 1
  %15 = icmp eq i32 %n, 1
  %unroll_iter349 = and i64 %wide.trip.count, 2147483646
  %lcmp.mod346.not = icmp eq i64 %xtraiter342, 0
  %lcmp.mod348 = trunc i32 %n to i1
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us.preheader, %for.cond20.for.end40_crit_edge.us
  %indvars.iv265 = phi i64 [ 0, %for.body17.us.preheader ], [ %indvars.iv.next266, %for.cond20.for.end40_crit_edge.us ]
  %arrayidx19.us = getelementptr inbounds nuw [4 x i8], ptr %stddev, i64 %indvars.iv265
  store float 0.000000e+00, ptr %arrayidx19.us, align 4, !tbaa !10
  %invariant.gep.us231 = getelementptr inbounds nuw [4 x i8], ptr %data, i64 %indvars.iv265
  %arrayidx28.us = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %indvars.iv265
  br i1 %15, label %for.body22.us.epil.preheader, label %for.body22.us

for.body22.us:                                    ; preds = %for.body17.us, %for.body22.us
  %16 = phi float [ %23, %for.body22.us ], [ 0.000000e+00, %for.body17.us ]
  %indvars.iv260 = phi i64 [ %indvars.iv.next261.1, %for.body22.us ], [ 0, %for.body17.us ]
  %niter350 = phi i64 [ %niter350.next.1, %for.body22.us ], [ 0, %for.body17.us ]
  %gep.us232 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us231, i64 %indvars.iv260
  %17 = load float, ptr %gep.us232, align 4, !tbaa !10
  %18 = load float, ptr %arrayidx28.us, align 4, !tbaa !10
  %sub.us = fsub float %17, %18
  %19 = tail call float @llvm.fmuladd.f32(float %sub.us, float %sub.us, float %16)
  store float %19, ptr %arrayidx19.us, align 4, !tbaa !10
  %20 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us231, i64 %indvars.iv260
  %gep.us232.1 = getelementptr inbounds nuw i8, ptr %20, i64 8192
  %21 = load float, ptr %gep.us232.1, align 4, !tbaa !10
  %22 = load float, ptr %arrayidx28.us, align 4, !tbaa !10
  %sub.us.1 = fsub float %21, %22
  %23 = tail call float @llvm.fmuladd.f32(float %sub.us.1, float %sub.us.1, float %19)
  store float %23, ptr %arrayidx19.us, align 4, !tbaa !10
  %indvars.iv.next261.1 = add nuw nsw i64 %indvars.iv260, 2
  %niter350.next.1 = add i64 %niter350, 2
  %niter350.ncmp.1 = icmp eq i64 %niter350.next.1, %unroll_iter349
  br i1 %niter350.ncmp.1, label %for.cond20.for.end40_crit_edge.us.unr-lcssa, label %for.body22.us, !llvm.loop !23

for.cond20.for.end40_crit_edge.us.unr-lcssa:      ; preds = %for.body22.us
  br i1 %lcmp.mod346.not, label %for.cond20.for.end40_crit_edge.us, label %for.body22.us.epil.preheader

for.body22.us.epil.preheader:                     ; preds = %for.cond20.for.end40_crit_edge.us.unr-lcssa, %for.body17.us
  %.epil.init345 = phi float [ 0.000000e+00, %for.body17.us ], [ %23, %for.cond20.for.end40_crit_edge.us.unr-lcssa ]
  %indvars.iv260.epil.init = phi i64 [ 0, %for.body17.us ], [ %indvars.iv.next261.1, %for.cond20.for.end40_crit_edge.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod348)
  %gep.us232.epil = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us231, i64 %indvars.iv260.epil.init
  %24 = load float, ptr %gep.us232.epil, align 4, !tbaa !10
  %25 = load float, ptr %arrayidx28.us, align 4, !tbaa !10
  %sub.us.epil = fsub float %24, %25
  %26 = tail call float @llvm.fmuladd.f32(float %sub.us.epil, float %sub.us.epil, float %.epil.init345)
  store float %26, ptr %arrayidx19.us, align 4, !tbaa !10
  br label %for.cond20.for.end40_crit_edge.us

for.cond20.for.end40_crit_edge.us:                ; preds = %for.cond20.for.end40_crit_edge.us.unr-lcssa, %for.body22.us.epil.preheader
  %.lcssa339 = phi float [ %23, %for.cond20.for.end40_crit_edge.us.unr-lcssa ], [ %26, %for.body22.us.epil.preheader ]
  %div43.us = fdiv float %.lcssa339, f0x4A442E10
  %call.i.us = tail call noundef float @sqrtf(float noundef %div43.us) #17
  %cmp50.us = fcmp ugt float %call.i.us, 5.000000e-03
  %cond.us = select i1 %cmp50.us, float %call.i.us, float 1.000000e+00
  store float %cond.us, ptr %arrayidx19.us, align 4, !tbaa !10
  %indvars.iv.next266 = add nuw nsw i64 %indvars.iv265, 1
  %exitcond269.not = icmp eq i64 %indvars.iv.next266, %wide.trip.count268
  br i1 %exitcond269.not, label %for.cond62.preheader.preheader, label %for.body17.us, !llvm.loop !24

for.cond59.preheader.thread:                      ; preds = %for.body17, %middle.block, %entry
  %cmp60235312 = icmp sgt i32 %n, 0
  br label %for.cond86.preheader

for.cond62.preheader.preheader:                   ; preds = %for.cond20.for.end40_crit_edge.us
  %wide.trip.count278 = zext nneg i32 %n to i64
  %wide.trip.count273 = zext nneg i32 %m to i64
  %27 = shl nuw nsw i64 %wide.trip.count, 13
  %28 = shl nuw nsw i64 %wide.trip.count253, 2
  %29 = getelementptr i8, ptr %data, i64 %27
  %30 = getelementptr i8, ptr %29, i64 %28
  %scevgep319 = getelementptr i8, ptr %30, i64 -8192
  %scevgep320 = getelementptr i8, ptr %mean, i64 %28
  %scevgep321 = getelementptr i8, ptr %stddev, i64 %28
  %min.iters.check326 = icmp ult i32 %m, 4
  %bound0 = icmp ult ptr %data, %scevgep320
  %bound1 = icmp ult ptr %mean, %scevgep319
  %found.conflict = and i1 %bound0, %bound1
  %bound0322 = icmp ult ptr %data, %scevgep321
  %bound1323 = icmp ult ptr %stddev, %scevgep319
  %found.conflict324 = and i1 %bound0322, %bound1323
  %conflict.rdx = or i1 %found.conflict, %found.conflict324
  %n.vec329 = and i64 %wide.trip.count253, 2147483644
  %cmp.n336 = icmp eq i64 %n.vec329, %wide.trip.count253
  %xtraiter351 = and i64 %wide.trip.count253, 1
  %lcmp.mod352.not = icmp eq i64 %xtraiter351, 0
  %31 = add nsw i64 %wide.trip.count253, -1
  br label %for.cond62.preheader

for.body17:                                       ; preds = %for.body17.preheader, %for.body17
  %indvars.iv255 = phi i64 [ %indvars.iv.next256, %for.body17 ], [ %indvars.iv255.ph, %for.body17.preheader ]
  %arrayidx19 = getelementptr inbounds nuw [4 x i8], ptr %stddev, i64 %indvars.iv255
  store float 1.000000e+00, ptr %arrayidx19, align 4, !tbaa !10
  %indvars.iv.next256 = add nuw nsw i64 %indvars.iv255, 1
  %exitcond259.not = icmp eq i64 %indvars.iv.next256, %wide.trip.count258
  br i1 %exitcond259.not, label %for.cond59.preheader.thread, label %for.body17, !llvm.loop !25

for.cond62.preheader:                             ; preds = %for.cond62.preheader.preheader, %for.cond62.for.inc83_crit_edge
  %indvars.iv275 = phi i64 [ 0, %for.cond62.preheader.preheader ], [ %indvars.iv.next276, %for.cond62.for.inc83_crit_edge ]
  %arrayidx68 = getelementptr inbounds nuw [8192 x i8], ptr %data, i64 %indvars.iv275
  %brmerge = select i1 %min.iters.check326, i1 true, i1 %conflict.rdx
  br i1 %brmerge, label %for.body64.preheader, label %vector.body330

vector.body330:                                   ; preds = %for.cond62.preheader, %vector.body330
  %index331 = phi i64 [ %index.next334, %vector.body330 ], [ 0, %for.cond62.preheader ]
  %32 = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %index331
  %wide.load = load <4 x float>, ptr %32, align 4, !tbaa !10, !alias.scope !26
  %33 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx68, i64 %index331
  %wide.load332 = load <4 x float>, ptr %33, align 4, !tbaa !10, !alias.scope !29, !noalias !31
  %34 = fsub <4 x float> %wide.load332, %wide.load
  store <4 x float> %34, ptr %33, align 4, !tbaa !10, !alias.scope !29, !noalias !31
  %35 = getelementptr inbounds nuw [4 x i8], ptr %stddev, i64 %index331
  %wide.load333 = load <4 x float>, ptr %35, align 4, !tbaa !10, !alias.scope !33
  %36 = fmul <4 x float> %wide.load333, splat (float f0x44E01A51)
  %37 = fdiv <4 x float> %34, %36
  store <4 x float> %37, ptr %33, align 4, !tbaa !10, !alias.scope !29, !noalias !31
  %index.next334 = add nuw i64 %index331, 4
  %38 = icmp eq i64 %index.next334, %n.vec329
  br i1 %38, label %middle.block335, label %vector.body330, !llvm.loop !34

middle.block335:                                  ; preds = %vector.body330
  br i1 %cmp.n336, label %for.cond62.for.inc83_crit_edge, label %for.body64.preheader

for.body64.preheader:                             ; preds = %for.cond62.preheader, %middle.block335
  %indvars.iv270.ph = phi i64 [ %n.vec329, %middle.block335 ], [ 0, %for.cond62.preheader ]
  br i1 %lcmp.mod352.not, label %for.body64.prol.loopexit, label %for.body64.prol

for.body64.prol:                                  ; preds = %for.body64.preheader
  %arrayidx66.prol = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %indvars.iv270.ph
  %39 = load float, ptr %arrayidx66.prol, align 4, !tbaa !10
  %arrayidx70.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx68, i64 %indvars.iv270.ph
  %40 = load float, ptr %arrayidx70.prol, align 4, !tbaa !10
  %sub71.prol = fsub float %40, %39
  store float %sub71.prol, ptr %arrayidx70.prol, align 4, !tbaa !10
  %arrayidx74.prol = getelementptr inbounds nuw [4 x i8], ptr %stddev, i64 %indvars.iv270.ph
  %41 = load float, ptr %arrayidx74.prol, align 4, !tbaa !10
  %mul.prol = fmul float %41, f0x44E01A51
  %div79.prol = fdiv float %sub71.prol, %mul.prol
  store float %div79.prol, ptr %arrayidx70.prol, align 4, !tbaa !10
  %indvars.iv.next271.prol = or disjoint i64 %indvars.iv270.ph, 1
  br label %for.body64.prol.loopexit

for.body64.prol.loopexit:                         ; preds = %for.body64.prol, %for.body64.preheader
  %indvars.iv270.unr = phi i64 [ %indvars.iv270.ph, %for.body64.preheader ], [ %indvars.iv.next271.prol, %for.body64.prol ]
  %42 = icmp eq i64 %indvars.iv270.ph, %31
  br i1 %42, label %for.cond62.for.inc83_crit_edge, label %for.body64

for.cond86.preheader:                             ; preds = %for.cond62.for.inc83_crit_edge, %for.cond59.preheader.thread
  %cmp60235314 = phi i1 [ %cmp60235312, %for.cond59.preheader.thread ], [ true, %for.cond62.for.inc83_crit_edge ]
  %sub87 = add i32 %m, -1
  %cmp88242 = icmp sgt i32 %m, 1
  br i1 %cmp88242, label %for.body89.lr.ph, label %for.end134

for.body89.lr.ph:                                 ; preds = %for.cond86.preheader
  br i1 %cmp60235314, label %for.body89.us.preheader, label %for.body89.preheader

for.body89.preheader:                             ; preds = %for.body89.lr.ph
  %43 = add nsw i32 %m, -2
  %wide.trip.count288 = zext nneg i32 %sub87 to i64
  %wide.trip.count285 = zext nneg i32 %m to i64
  %44 = add nsw i64 %wide.trip.count285, -2
  br label %for.body97.preheader

for.body89.us.preheader:                          ; preds = %for.body89.lr.ph
  %wide.trip.count308 = zext nneg i32 %sub87 to i64
  %wide.trip.count303 = zext nneg i32 %m to i64
  %wide.trip.count293 = zext nneg i32 %n to i64
  %xtraiter355 = and i64 %wide.trip.count293, 1
  %45 = icmp eq i32 %n, 1
  %unroll_iter362 = and i64 %wide.trip.count293, 2147483646
  %lcmp.mod359.not = icmp eq i64 %xtraiter355, 0
  %lcmp.mod361 = trunc i32 %n to i1
  br label %for.body97.us.us.preheader

for.body97.us.us.preheader:                       ; preds = %for.cond86.loopexit.us, %for.body89.us.preheader
  %indvars.iv305 = phi i64 [ 0, %for.body89.us.preheader ], [ %indvars.iv.next306, %for.cond86.loopexit.us ]
  %indvars.iv298 = phi i64 [ 1, %for.body89.us.preheader ], [ %indvars.iv.next299, %for.cond86.loopexit.us ]
  %arrayidx91.us = getelementptr inbounds nuw [8192 x i8], ptr %symmat, i64 %indvars.iv305
  %arrayidx93.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx91.us, i64 %indvars.iv305
  store float 1.000000e+00, ptr %arrayidx93.us, align 4, !tbaa !10
  %indvars.iv.next306 = add nuw nsw i64 %indvars.iv305, 1
  %invariant.gep.us244 = getelementptr inbounds nuw [4 x i8], ptr %symmat, i64 %indvars.iv305
  br label %for.body97.us.us

for.cond86.loopexit.us:                           ; preds = %for.cond102.for.end120_crit_edge.us.us
  %indvars.iv.next299 = add nuw nsw i64 %indvars.iv298, 1
  %exitcond309.not = icmp eq i64 %indvars.iv.next306, %wide.trip.count308
  br i1 %exitcond309.not, label %for.end134, label %for.body97.us.us.preheader, !llvm.loop !35

for.body97.us.us:                                 ; preds = %for.body97.us.us.preheader, %for.cond102.for.end120_crit_edge.us.us
  %indvars.iv300 = phi i64 [ %indvars.iv298, %for.body97.us.us.preheader ], [ %indvars.iv.next301, %for.cond102.for.end120_crit_edge.us.us ]
  %arrayidx101.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx91.us, i64 %indvars.iv300
  store float 0.000000e+00, ptr %arrayidx101.us.us, align 4, !tbaa !10
  br i1 %45, label %for.body104.us.us.epil.preheader, label %for.body104.us.us

for.body104.us.us:                                ; preds = %for.body97.us.us, %for.body104.us.us
  %indvars.iv290 = phi i64 [ %indvars.iv.next291.1, %for.body104.us.us ], [ 0, %for.body97.us.us ]
  %46 = phi float [ %53, %for.body104.us.us ], [ 0.000000e+00, %for.body97.us.us ]
  %niter363 = phi i64 [ %niter363.next.1, %for.body104.us.us ], [ 0, %for.body97.us.us ]
  %arrayidx106.us.us = getelementptr inbounds nuw [8192 x i8], ptr %data, i64 %indvars.iv290
  %arrayidx108.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx106.us.us, i64 %indvars.iv305
  %47 = load float, ptr %arrayidx108.us.us, align 4, !tbaa !10
  %arrayidx112.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx106.us.us, i64 %indvars.iv300
  %48 = load float, ptr %arrayidx112.us.us, align 4, !tbaa !10
  %49 = tail call float @llvm.fmuladd.f32(float %47, float %48, float %46)
  store float %49, ptr %arrayidx101.us.us, align 4, !tbaa !10
  %50 = getelementptr inbounds nuw [8192 x i8], ptr %data, i64 %indvars.iv290
  %arrayidx106.us.us.1 = getelementptr inbounds nuw i8, ptr %50, i64 8192
  %arrayidx108.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx106.us.us.1, i64 %indvars.iv305
  %51 = load float, ptr %arrayidx108.us.us.1, align 4, !tbaa !10
  %arrayidx112.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx106.us.us.1, i64 %indvars.iv300
  %52 = load float, ptr %arrayidx112.us.us.1, align 4, !tbaa !10
  %53 = tail call float @llvm.fmuladd.f32(float %51, float %52, float %49)
  store float %53, ptr %arrayidx101.us.us, align 4, !tbaa !10
  %indvars.iv.next291.1 = add nuw nsw i64 %indvars.iv290, 2
  %niter363.next.1 = add i64 %niter363, 2
  %niter363.ncmp.1 = icmp eq i64 %niter363.next.1, %unroll_iter362
  br i1 %niter363.ncmp.1, label %for.cond102.for.end120_crit_edge.us.us.unr-lcssa, label %for.body104.us.us, !llvm.loop !36

for.cond102.for.end120_crit_edge.us.us.unr-lcssa: ; preds = %for.body104.us.us
  br i1 %lcmp.mod359.not, label %for.cond102.for.end120_crit_edge.us.us, label %for.body104.us.us.epil.preheader

for.body104.us.us.epil.preheader:                 ; preds = %for.cond102.for.end120_crit_edge.us.us.unr-lcssa, %for.body97.us.us
  %indvars.iv290.epil.init = phi i64 [ 0, %for.body97.us.us ], [ %indvars.iv.next291.1, %for.cond102.for.end120_crit_edge.us.us.unr-lcssa ]
  %.epil.init358 = phi float [ 0.000000e+00, %for.body97.us.us ], [ %53, %for.cond102.for.end120_crit_edge.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod361)
  %arrayidx106.us.us.epil = getelementptr inbounds nuw [8192 x i8], ptr %data, i64 %indvars.iv290.epil.init
  %arrayidx108.us.us.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx106.us.us.epil, i64 %indvars.iv305
  %54 = load float, ptr %arrayidx108.us.us.epil, align 4, !tbaa !10
  %arrayidx112.us.us.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx106.us.us.epil, i64 %indvars.iv300
  %55 = load float, ptr %arrayidx112.us.us.epil, align 4, !tbaa !10
  %56 = tail call float @llvm.fmuladd.f32(float %54, float %55, float %.epil.init358)
  store float %56, ptr %arrayidx101.us.us, align 4, !tbaa !10
  br label %for.cond102.for.end120_crit_edge.us.us

for.cond102.for.end120_crit_edge.us.us:           ; preds = %for.cond102.for.end120_crit_edge.us.us.unr-lcssa, %for.body104.us.us.epil.preheader
  %.lcssa = phi float [ %53, %for.cond102.for.end120_crit_edge.us.us.unr-lcssa ], [ %56, %for.body104.us.us.epil.preheader ]
  %gep.us241.us = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us244, i64 %indvars.iv300
  store float %.lcssa, ptr %gep.us241.us, align 4, !tbaa !10
  %indvars.iv.next301 = add nuw nsw i64 %indvars.iv300, 1
  %exitcond304.not = icmp eq i64 %indvars.iv.next301, %wide.trip.count303
  br i1 %exitcond304.not, label %for.cond86.loopexit.us, label %for.body97.us.us, !llvm.loop !37

for.body64:                                       ; preds = %for.body64.prol.loopexit, %for.body64
  %indvars.iv270 = phi i64 [ %indvars.iv.next271.1, %for.body64 ], [ %indvars.iv270.unr, %for.body64.prol.loopexit ]
  %arrayidx66 = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %indvars.iv270
  %57 = load float, ptr %arrayidx66, align 4, !tbaa !10
  %arrayidx70 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx68, i64 %indvars.iv270
  %58 = load float, ptr %arrayidx70, align 4, !tbaa !10
  %sub71 = fsub float %58, %57
  store float %sub71, ptr %arrayidx70, align 4, !tbaa !10
  %arrayidx74 = getelementptr inbounds nuw [4 x i8], ptr %stddev, i64 %indvars.iv270
  %59 = load float, ptr %arrayidx74, align 4, !tbaa !10
  %mul = fmul float %59, f0x44E01A51
  %div79 = fdiv float %sub71, %mul
  store float %div79, ptr %arrayidx70, align 4, !tbaa !10
  %indvars.iv.next271 = add nuw nsw i64 %indvars.iv270, 1
  %arrayidx66.1 = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %indvars.iv.next271
  %60 = load float, ptr %arrayidx66.1, align 4, !tbaa !10
  %arrayidx70.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx68, i64 %indvars.iv.next271
  %61 = load float, ptr %arrayidx70.1, align 4, !tbaa !10
  %sub71.1 = fsub float %61, %60
  store float %sub71.1, ptr %arrayidx70.1, align 4, !tbaa !10
  %arrayidx74.1 = getelementptr inbounds nuw [4 x i8], ptr %stddev, i64 %indvars.iv.next271
  %62 = load float, ptr %arrayidx74.1, align 4, !tbaa !10
  %mul.1 = fmul float %62, f0x44E01A51
  %div79.1 = fdiv float %sub71.1, %mul.1
  store float %div79.1, ptr %arrayidx70.1, align 4, !tbaa !10
  %indvars.iv.next271.1 = add nuw nsw i64 %indvars.iv270, 2
  %exitcond274.not.1 = icmp eq i64 %indvars.iv.next271.1, %wide.trip.count273
  br i1 %exitcond274.not.1, label %for.cond62.for.inc83_crit_edge, label %for.body64, !llvm.loop !38

for.cond62.for.inc83_crit_edge:                   ; preds = %for.body64.prol.loopexit, %for.body64, %middle.block335
  %indvars.iv.next276 = add nuw nsw i64 %indvars.iv275, 1
  %exitcond279.not = icmp eq i64 %indvars.iv.next276, %wide.trip.count278
  br i1 %exitcond279.not, label %for.cond86.preheader, label %for.cond62.preheader, !llvm.loop !39

for.cond86.loopexit:                              ; preds = %for.body97, %for.body97.prol.loopexit
  %indvars.iv.next281 = add nuw nsw i64 %indvars.iv280, 1
  %exitcond289.not = icmp eq i64 %indvar.next, %wide.trip.count288
  br i1 %exitcond289.not, label %for.end134, label %for.body97.preheader, !llvm.loop !35

for.body97.preheader:                             ; preds = %for.cond86.loopexit, %for.body89.preheader
  %indvars.iv280 = phi i64 [ 1, %for.body89.preheader ], [ %indvars.iv.next281, %for.cond86.loopexit ]
  %indvar = phi i64 [ 0, %for.body89.preheader ], [ %indvar.next, %for.cond86.loopexit ]
  %63 = xor i64 %indvar, -1
  %64 = add nsw i64 %63, %wide.trip.count285
  %65 = sub i64 %44, %indvar
  %arrayidx91 = getelementptr inbounds nuw [8192 x i8], ptr %symmat, i64 %indvar
  %arrayidx93 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx91, i64 %indvar
  store float 1.000000e+00, ptr %arrayidx93, align 4, !tbaa !10
  %indvar.next = add nuw nsw i64 %indvar, 1
  %invariant.gep = getelementptr inbounds nuw [4 x i8], ptr %symmat, i64 %indvar
  %66 = trunc i64 %indvar to i32
  %67 = sub i32 %43, %66
  %68 = zext i32 %67 to i64
  %69 = shl nuw nsw i64 %68, 2
  %70 = add nuw nsw i64 %69, 4
  %71 = mul nuw nsw i64 %indvar, 8196
  %72 = getelementptr i8, ptr %symmat, i64 %71
  %scevgep = getelementptr i8, ptr %72, i64 4
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1) %scevgep, i8 0, i64 %70, i1 false), !tbaa !10
  %xtraiter353 = and i64 %64, 3
  %lcmp.mod354.not = icmp eq i64 %xtraiter353, 0
  br i1 %lcmp.mod354.not, label %for.body97.prol.loopexit, label %for.body97.prol

for.body97.prol:                                  ; preds = %for.body97.preheader, %for.body97.prol
  %indvars.iv282.prol = phi i64 [ %indvars.iv.next283.prol, %for.body97.prol ], [ %indvars.iv280, %for.body97.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body97.prol ], [ 0, %for.body97.preheader ]
  %gep.prol = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv282.prol
  store float 0.000000e+00, ptr %gep.prol, align 4, !tbaa !10
  %indvars.iv.next283.prol = add nuw nsw i64 %indvars.iv282.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter353
  br i1 %prol.iter.cmp.not, label %for.body97.prol.loopexit, label %for.body97.prol, !llvm.loop !40

for.body97.prol.loopexit:                         ; preds = %for.body97.prol, %for.body97.preheader
  %indvars.iv282.unr = phi i64 [ %indvars.iv280, %for.body97.preheader ], [ %indvars.iv.next283.prol, %for.body97.prol ]
  %73 = icmp ult i64 %65, 3
  br i1 %73, label %for.cond86.loopexit, label %for.body97

for.body97:                                       ; preds = %for.body97.prol.loopexit, %for.body97
  %indvars.iv282 = phi i64 [ %indvars.iv.next283.3, %for.body97 ], [ %indvars.iv282.unr, %for.body97.prol.loopexit ]
  %gep = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv282
  store float 0.000000e+00, ptr %gep, align 4, !tbaa !10
  %74 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv282
  %gep.1 = getelementptr inbounds nuw i8, ptr %74, i64 8192
  store float 0.000000e+00, ptr %gep.1, align 4, !tbaa !10
  %75 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv282
  %gep.2 = getelementptr inbounds nuw i8, ptr %75, i64 16384
  store float 0.000000e+00, ptr %gep.2, align 4, !tbaa !10
  %76 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv282
  %gep.3 = getelementptr inbounds nuw i8, ptr %76, i64 24576
  store float 0.000000e+00, ptr %gep.3, align 4, !tbaa !10
  %indvars.iv.next283.3 = add nuw nsw i64 %indvars.iv282, 4
  %exitcond286.not.3 = icmp eq i64 %indvars.iv.next283.3, %wide.trip.count285
  br i1 %exitcond286.not.3, label %for.cond86.loopexit, label %for.body97, !llvm.loop !37

for.end134:                                       ; preds = %for.cond86.loopexit, %for.cond86.loopexit.us, %for.cond86.preheader
  %arrayidx136 = getelementptr inbounds nuw i8, ptr %symmat, i64 16777212
  store float 1.000000e+00, ptr %arrayidx136, align 4, !tbaa !10
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #4

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiiPA2048_fS0_(i32 noundef %m, i32 noundef %n, ptr nofree noundef readonly captures(none) %symmat, ptr nofree noundef readonly captures(none) %symmat_outputFromGpu) local_unnamed_addr #5 {
entry:
  %cmp28 = icmp sgt i32 %m, 0
  %cmp225 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp28, %cmp225
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end16

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count37 = zext nneg i32 %m to i64
  %wide.trip.count = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc14_crit_edge.us
  %indvars.iv34 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next35, %for.cond1.for.inc14_crit_edge.us ]
  %fail.030.us = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [8192 x i8], ptr %symmat, i64 %indvars.iv34
  %arrayidx7.us = getelementptr inbounds nuw [8192 x i8], ptr %symmat_outputFromGpu, i64 %indvars.iv34
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
  %31 = fcmp ogt <4 x double> %30, splat (double 1.050000e+00)
  %.not41 = select <4 x i1> %9, <4 x i1> splat (i1 true), <4 x i1> %14
  %narrow = select <4 x i1> %.not41, <4 x i1> %31, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %32 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !41

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
  %48 = fcmp ogt double %47, 1.050000e+00
  %49 = zext i1 %48 to i32
  br label %_Z11percentDiffdd.exit.us

_Z11percentDiffdd.exit.us:                        ; preds = %if.else.i.us, %land.lhs.true.i.us
  %retval.0.i.us = phi i32 [ %49, %if.else.i.us ], [ 0, %land.lhs.true.i.us ]
  %fail.2.us = add nsw i32 %retval.0.i.us, %fail.127.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us, !llvm.loop !42

for.cond1.for.inc14_crit_edge.us:                 ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %fail.2.us.lcssa = phi i32 [ %34, %middle.block ], [ %fail.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %for.end16, label %for.cond1.preheader.us, !llvm.loop !43

for.end16:                                        ; preds = %for.cond1.for.inc14_crit_edge.us, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %call17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 1.050000e+00, i32 noundef %fail.0.lcssa) #18
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #6

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #7 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp) #19
  %call = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp, i32 noundef 0) #18
  %call1 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp) #18
  %call2 = call i32 @cudaSetDevice(i32 noundef 0) #18
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp) #19
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #8

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__mean_kerneliiPfS_(i32 noundef %m, i32 noundef %n, ptr noundef %mean, ptr noundef %data) #9 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %mean.addr = alloca ptr, align 8
  %data.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %m, ptr %m.addr, align 4, !tbaa !44
  store i32 %n, ptr %n.addr, align 4, !tbaa !44
  store ptr %mean, ptr %mean.addr, align 8, !tbaa !45
  store ptr %data, ptr %data.addr, align 8, !tbaa !45
  %kernel_args1 = alloca [4 x ptr], align 16
  store ptr %m.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %n.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %mean.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %data.addr, ptr %2, align 8
  %3 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %4 = load i64, ptr %shmem_size, align 8
  %5 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mean_kerneliiPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z25__device_stub__std_kerneliiPfS_S_(i32 noundef %m, i32 noundef %n, ptr noundef %mean, ptr noundef %std, ptr noundef %data) #9 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %mean.addr = alloca ptr, align 8
  %std.addr = alloca ptr, align 8
  %data.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %m, ptr %m.addr, align 4, !tbaa !44
  store i32 %n, ptr %n.addr, align 4, !tbaa !44
  store ptr %mean, ptr %mean.addr, align 8, !tbaa !45
  store ptr %std, ptr %std.addr, align 8, !tbaa !45
  store ptr %data, ptr %data.addr, align 8, !tbaa !45
  %kernel_args1 = alloca [5 x ptr], align 16
  store ptr %m.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %n.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %mean.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %std.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %data.addr, ptr %3, align 16
  %4 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %5 = load i64, ptr %shmem_size, align 8
  %6 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z25__device_stub__std_kerneliiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %5, ptr noundef %6)
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z28__device_stub__reduce_kerneliiPfS_S_(i32 noundef %m, i32 noundef %n, ptr noundef %mean, ptr noundef %std, ptr noundef %data) #9 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %mean.addr = alloca ptr, align 8
  %std.addr = alloca ptr, align 8
  %data.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %m, ptr %m.addr, align 4, !tbaa !44
  store i32 %n, ptr %n.addr, align 4, !tbaa !44
  store ptr %mean, ptr %mean.addr, align 8, !tbaa !45
  store ptr %std, ptr %std.addr, align 8, !tbaa !45
  store ptr %data, ptr %data.addr, align 8, !tbaa !45
  %kernel_args1 = alloca [5 x ptr], align 16
  store ptr %m.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %n.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %mean.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %std.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %data.addr, ptr %3, align 16
  %4 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %5 = load i64, ptr %shmem_size, align 8
  %6 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z28__device_stub__reduce_kerneliiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %5, ptr noundef %6)
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__corr_kerneliiPfS_(i32 noundef %m, i32 noundef %n, ptr noundef %symmat, ptr noundef %data) #9 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %symmat.addr = alloca ptr, align 8
  %data.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %m, ptr %m.addr, align 4, !tbaa !44
  store i32 %n, ptr %n.addr, align 4, !tbaa !44
  store ptr %symmat, ptr %symmat.addr, align 8, !tbaa !45
  store ptr %data, ptr %data.addr, align 8, !tbaa !45
  %kernel_args1 = alloca [4 x ptr], align 16
  store ptr %m.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %n.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %symmat.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %data.addr, ptr %2, align 8
  %3 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %4 = load i64, ptr %shmem_size, align 8
  %5 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__corr_kerneliiPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z15correlationCudaiiPA2048_fPfS1_S0_S0_(i32 noundef %m, i32 noundef %n, ptr noundef %data, ptr noundef %mean, ptr noundef %stddev, ptr noundef %symmat, ptr noundef %symmat_outputFromGpu) local_unnamed_addr #7 {
entry:
  %Tp.i.i125 = alloca %struct.timeval, align 8
  %m.addr.i110 = alloca i32, align 4
  %n.addr.i111 = alloca i32, align 4
  %symmat.addr.i = alloca ptr, align 8
  %data.addr.i112 = alloca ptr, align 8
  %grid_dim.i113 = alloca %struct.dim3, align 8
  %block_dim.i114 = alloca %struct.dim3, align 8
  %shmem_size.i115 = alloca i64, align 8
  %stream.i116 = alloca ptr, align 8
  %kernel_args1.i117 = alloca [4 x ptr], align 16
  %m.addr.i93 = alloca i32, align 4
  %n.addr.i94 = alloca i32, align 4
  %mean.addr.i95 = alloca ptr, align 8
  %std.addr.i96 = alloca ptr, align 8
  %data.addr.i97 = alloca ptr, align 8
  %grid_dim.i98 = alloca %struct.dim3, align 8
  %block_dim.i99 = alloca %struct.dim3, align 8
  %shmem_size.i100 = alloca i64, align 8
  %stream.i101 = alloca ptr, align 8
  %kernel_args1.i102 = alloca [5 x ptr], align 16
  %m.addr.i77 = alloca i32, align 4
  %n.addr.i78 = alloca i32, align 4
  %mean.addr.i79 = alloca ptr, align 8
  %std.addr.i = alloca ptr, align 8
  %data.addr.i80 = alloca ptr, align 8
  %grid_dim.i81 = alloca %struct.dim3, align 8
  %block_dim.i82 = alloca %struct.dim3, align 8
  %shmem_size.i83 = alloca i64, align 8
  %stream.i84 = alloca ptr, align 8
  %kernel_args1.i85 = alloca [5 x ptr], align 16
  %m.addr.i = alloca i32, align 4
  %n.addr.i = alloca i32, align 4
  %mean.addr.i = alloca ptr, align 8
  %data.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [4 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %data_gpu = alloca ptr, align 8
  %stddev_gpu = alloca ptr, align 8
  %mean_gpu = alloca ptr, align 8
  %symmat_gpu = alloca ptr, align 8
  %valueAtSymmatIndexMTimesMPlus1PlusMPoint = alloca float, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %data_gpu) #19
  call void @llvm.lifetime.start.p0(ptr nonnull %stddev_gpu) #19
  call void @llvm.lifetime.start.p0(ptr nonnull %mean_gpu) #19
  call void @llvm.lifetime.start.p0(ptr nonnull %symmat_gpu) #19
  %call = call i32 @cudaMalloc(ptr noundef nonnull %data_gpu, i64 noundef 16777216) #18
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %symmat_gpu, i64 noundef 16777216) #18
  %call2 = call i32 @cudaMalloc(ptr noundef nonnull %stddev_gpu, i64 noundef 8192) #18
  %call3 = call i32 @cudaMalloc(ptr noundef nonnull %mean_gpu, i64 noundef 8192) #18
  %0 = load ptr, ptr %data_gpu, align 8, !tbaa !45
  %call4 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %data, i64 noundef 16777216, i32 noundef 1) #18
  %1 = load ptr, ptr %symmat_gpu, align 8, !tbaa !45
  %call5 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %symmat, i64 noundef 16777216, i32 noundef 1) #18
  %2 = load ptr, ptr %stddev_gpu, align 8, !tbaa !45
  %call6 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %stddev, i64 noundef 8192, i32 noundef 1) #18
  %3 = load ptr, ptr %mean_gpu, align 8, !tbaa !45
  %call7 = call i32 @cudaMemcpy(ptr noundef %3, ptr noundef %mean, i64 noundef 8192, i32 noundef 1) #18
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #19
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #18
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %4 = load i64, ptr %Tp.i.i, align 8, !tbaa !48
  %conv.i.i = sitofp i64 %4 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %5 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !51
  %conv2.i.i = sitofp i64 %5 to double
  %6 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #19
  store double %6, ptr @polybench_t_start, align 8, !tbaa !52
  %call27 = call i32 @__cudaPushCallConfiguration(i64 4294967304, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #18
  %tobool.not = icmp eq i32 %call27, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %7 = load ptr, ptr %mean_gpu, align 8, !tbaa !45
  %8 = load ptr, ptr %data_gpu, align 8, !tbaa !45
  call void @llvm.lifetime.start.p0(ptr nonnull %m.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %mean.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %data.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %m, ptr %m.addr.i, align 4, !tbaa !44
  store i32 %n, ptr %n.addr.i, align 4, !tbaa !44
  store ptr %7, ptr %mean.addr.i, align 8, !tbaa !45
  store ptr %8, ptr %data.addr.i, align 8, !tbaa !45
  store ptr %m.addr.i, ptr %kernel_args1.i, align 16
  %9 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %n.addr.i, ptr %9, align 8
  %10 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %mean.addr.i, ptr %10, align 16
  %11 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %data.addr.i, ptr %11, align 8
  %12 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !54
  %13 = load i64, ptr %shmem_size.i, align 8
  %14 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mean_kerneliiPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %13, ptr noundef %14), !inline_history !54
  call void @llvm.lifetime.end.p0(ptr nonnull %m.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %mean.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %data.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %_Z21polybench_timer_startv.exit
  %call28 = call i32 @cudaThreadSynchronize() #18
  %call31 = call i32 @__cudaPushCallConfiguration(i64 4294967304, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #18
  %tobool32.not = icmp eq i32 %call31, 0
  br i1 %tobool32.not, label %kcall.configok33, label %kcall.end34

kcall.configok33:                                 ; preds = %kcall.end
  %15 = load ptr, ptr %mean_gpu, align 8, !tbaa !45
  %16 = load ptr, ptr %stddev_gpu, align 8, !tbaa !45
  %17 = load ptr, ptr %data_gpu, align 8, !tbaa !45
  call void @llvm.lifetime.start.p0(ptr nonnull %m.addr.i77)
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i78)
  call void @llvm.lifetime.start.p0(ptr nonnull %mean.addr.i79)
  call void @llvm.lifetime.start.p0(ptr nonnull %std.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %data.addr.i80)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i81)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i82)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i83)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i84)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i85)
  store i32 %m, ptr %m.addr.i77, align 4, !tbaa !44
  store i32 %n, ptr %n.addr.i78, align 4, !tbaa !44
  store ptr %15, ptr %mean.addr.i79, align 8, !tbaa !45
  store ptr %16, ptr %std.addr.i, align 8, !tbaa !45
  store ptr %17, ptr %data.addr.i80, align 8, !tbaa !45
  store ptr %m.addr.i77, ptr %kernel_args1.i85, align 16
  %18 = getelementptr inbounds nuw i8, ptr %kernel_args1.i85, i64 8
  store ptr %n.addr.i78, ptr %18, align 8
  %19 = getelementptr inbounds nuw i8, ptr %kernel_args1.i85, i64 16
  store ptr %mean.addr.i79, ptr %19, align 16
  %20 = getelementptr inbounds nuw i8, ptr %kernel_args1.i85, i64 24
  store ptr %std.addr.i, ptr %20, align 8
  %21 = getelementptr inbounds nuw i8, ptr %kernel_args1.i85, i64 32
  store ptr %data.addr.i80, ptr %21, align 16
  %22 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i81, ptr nonnull %block_dim.i82, ptr nonnull %shmem_size.i83, ptr nonnull %stream.i84), !inline_history !55
  %23 = load i64, ptr %shmem_size.i83, align 8
  %24 = load ptr, ptr %stream.i84, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i86 = load i64, ptr %grid_dim.i81, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i87 = getelementptr inbounds nuw i8, ptr %grid_dim.i81, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i88 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i87, align 8
  %block_dim.coerce.sroa.0.0.copyload.i89 = load i64, ptr %block_dim.i82, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i90 = getelementptr inbounds nuw i8, ptr %block_dim.i82, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i91 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i90, align 8
  %call.i92 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z25__device_stub__std_kerneliiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i86, i32 %grid_dim.coerce.sroa.2.0.copyload.i88, i64 %block_dim.coerce.sroa.0.0.copyload.i89, i32 %block_dim.coerce.sroa.2.0.copyload.i91, ptr noundef nonnull %kernel_args1.i85, i64 noundef %23, ptr noundef %24), !inline_history !55
  call void @llvm.lifetime.end.p0(ptr nonnull %m.addr.i77)
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i78)
  call void @llvm.lifetime.end.p0(ptr nonnull %mean.addr.i79)
  call void @llvm.lifetime.end.p0(ptr nonnull %std.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %data.addr.i80)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i81)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i82)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i83)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i84)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i85)
  br label %kcall.end34

kcall.end34:                                      ; preds = %kcall.configok33, %kcall.end
  %call35 = call i32 @cudaThreadSynchronize() #18
  %call38 = call i32 @__cudaPushCallConfiguration(i64 1099511627840, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #18
  %tobool39.not = icmp eq i32 %call38, 0
  br i1 %tobool39.not, label %kcall.configok40, label %kcall.end41

kcall.configok40:                                 ; preds = %kcall.end34
  %25 = load ptr, ptr %mean_gpu, align 8, !tbaa !45
  %26 = load ptr, ptr %stddev_gpu, align 8, !tbaa !45
  %27 = load ptr, ptr %data_gpu, align 8, !tbaa !45
  call void @llvm.lifetime.start.p0(ptr nonnull %m.addr.i93)
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i94)
  call void @llvm.lifetime.start.p0(ptr nonnull %mean.addr.i95)
  call void @llvm.lifetime.start.p0(ptr nonnull %std.addr.i96)
  call void @llvm.lifetime.start.p0(ptr nonnull %data.addr.i97)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i98)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i99)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i100)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i101)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i102)
  store i32 %m, ptr %m.addr.i93, align 4, !tbaa !44
  store i32 %n, ptr %n.addr.i94, align 4, !tbaa !44
  store ptr %25, ptr %mean.addr.i95, align 8, !tbaa !45
  store ptr %26, ptr %std.addr.i96, align 8, !tbaa !45
  store ptr %27, ptr %data.addr.i97, align 8, !tbaa !45
  store ptr %m.addr.i93, ptr %kernel_args1.i102, align 16
  %28 = getelementptr inbounds nuw i8, ptr %kernel_args1.i102, i64 8
  store ptr %n.addr.i94, ptr %28, align 8
  %29 = getelementptr inbounds nuw i8, ptr %kernel_args1.i102, i64 16
  store ptr %mean.addr.i95, ptr %29, align 16
  %30 = getelementptr inbounds nuw i8, ptr %kernel_args1.i102, i64 24
  store ptr %std.addr.i96, ptr %30, align 8
  %31 = getelementptr inbounds nuw i8, ptr %kernel_args1.i102, i64 32
  store ptr %data.addr.i97, ptr %31, align 16
  %32 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i98, ptr nonnull %block_dim.i99, ptr nonnull %shmem_size.i100, ptr nonnull %stream.i101), !inline_history !56
  %33 = load i64, ptr %shmem_size.i100, align 8
  %34 = load ptr, ptr %stream.i101, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i103 = load i64, ptr %grid_dim.i98, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i104 = getelementptr inbounds nuw i8, ptr %grid_dim.i98, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i105 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i104, align 8
  %block_dim.coerce.sroa.0.0.copyload.i106 = load i64, ptr %block_dim.i99, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i107 = getelementptr inbounds nuw i8, ptr %block_dim.i99, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i108 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i107, align 8
  %call.i109 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z28__device_stub__reduce_kerneliiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i103, i32 %grid_dim.coerce.sroa.2.0.copyload.i105, i64 %block_dim.coerce.sroa.0.0.copyload.i106, i32 %block_dim.coerce.sroa.2.0.copyload.i108, ptr noundef nonnull %kernel_args1.i102, i64 noundef %33, ptr noundef %34), !inline_history !56
  call void @llvm.lifetime.end.p0(ptr nonnull %m.addr.i93)
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i94)
  call void @llvm.lifetime.end.p0(ptr nonnull %mean.addr.i95)
  call void @llvm.lifetime.end.p0(ptr nonnull %std.addr.i96)
  call void @llvm.lifetime.end.p0(ptr nonnull %data.addr.i97)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i98)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i99)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i100)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i101)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i102)
  br label %kcall.end41

kcall.end41:                                      ; preds = %kcall.configok40, %kcall.end34
  %call42 = call i32 @cudaThreadSynchronize() #18
  %call45 = call i32 @__cudaPushCallConfiguration(i64 4294967304, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #18
  %tobool46.not = icmp eq i32 %call45, 0
  br i1 %tobool46.not, label %kcall.configok47, label %kcall.end48

kcall.configok47:                                 ; preds = %kcall.end41
  %35 = load ptr, ptr %symmat_gpu, align 8, !tbaa !45
  %36 = load ptr, ptr %data_gpu, align 8, !tbaa !45
  call void @llvm.lifetime.start.p0(ptr nonnull %m.addr.i110)
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i111)
  call void @llvm.lifetime.start.p0(ptr nonnull %symmat.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %data.addr.i112)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i113)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i114)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i115)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i116)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i117)
  store i32 %m, ptr %m.addr.i110, align 4, !tbaa !44
  store i32 %n, ptr %n.addr.i111, align 4, !tbaa !44
  store ptr %35, ptr %symmat.addr.i, align 8, !tbaa !45
  store ptr %36, ptr %data.addr.i112, align 8, !tbaa !45
  store ptr %m.addr.i110, ptr %kernel_args1.i117, align 16
  %37 = getelementptr inbounds nuw i8, ptr %kernel_args1.i117, i64 8
  store ptr %n.addr.i111, ptr %37, align 8
  %38 = getelementptr inbounds nuw i8, ptr %kernel_args1.i117, i64 16
  store ptr %symmat.addr.i, ptr %38, align 16
  %39 = getelementptr inbounds nuw i8, ptr %kernel_args1.i117, i64 24
  store ptr %data.addr.i112, ptr %39, align 8
  %40 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i113, ptr nonnull %block_dim.i114, ptr nonnull %shmem_size.i115, ptr nonnull %stream.i116), !inline_history !57
  %41 = load i64, ptr %shmem_size.i115, align 8
  %42 = load ptr, ptr %stream.i116, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i118 = load i64, ptr %grid_dim.i113, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i119 = getelementptr inbounds nuw i8, ptr %grid_dim.i113, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i120 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i119, align 8
  %block_dim.coerce.sroa.0.0.copyload.i121 = load i64, ptr %block_dim.i114, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i122 = getelementptr inbounds nuw i8, ptr %block_dim.i114, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i123 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i122, align 8
  %call.i124 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__corr_kerneliiPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload.i118, i32 %grid_dim.coerce.sroa.2.0.copyload.i120, i64 %block_dim.coerce.sroa.0.0.copyload.i121, i32 %block_dim.coerce.sroa.2.0.copyload.i123, ptr noundef nonnull %kernel_args1.i117, i64 noundef %41, ptr noundef %42), !inline_history !57
  call void @llvm.lifetime.end.p0(ptr nonnull %m.addr.i110)
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i111)
  call void @llvm.lifetime.end.p0(ptr nonnull %symmat.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %data.addr.i112)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i113)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i114)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i115)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i116)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i117)
  br label %kcall.end48

kcall.end48:                                      ; preds = %kcall.configok47, %kcall.end41
  %call49 = call i32 @cudaThreadSynchronize() #18
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i125) #19
  %call.i.i126 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i125, ptr noundef null) #17
  %cmp.not.i.i127 = icmp eq i32 %call.i.i126, 0
  br i1 %cmp.not.i.i127, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i128

if.then.i.i128:                                   ; preds = %kcall.end48
  %call1.i.i129 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i126) #18
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end48, %if.then.i.i128
  %43 = load i64, ptr %Tp.i.i125, align 8, !tbaa !48
  %conv.i.i130 = sitofp i64 %43 to double
  %tv_usec.i.i131 = getelementptr inbounds nuw i8, ptr %Tp.i.i125, i64 8
  %44 = load i64, ptr %tv_usec.i.i131, align 8, !tbaa !51
  %conv2.i.i132 = sitofp i64 %44 to double
  %45 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i132, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i130)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i125) #19
  store double %45, ptr @polybench_t_end, align 8, !tbaa !52
  %46 = load double, ptr @polybench_t_start, align 8, !tbaa !52
  %sub.i = fsub double %45, %46
  %call.i133 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #18
  call void @llvm.lifetime.start.p0(ptr nonnull %valueAtSymmatIndexMTimesMPlus1PlusMPoint) #19
  store float 1.000000e+00, ptr %valueAtSymmatIndexMTimesMPlus1PlusMPoint, align 4, !tbaa !10
  %47 = load ptr, ptr %symmat_gpu, align 8, !tbaa !45
  %arrayidx = getelementptr inbounds nuw i8, ptr %47, i64 16777212
  %call51 = call i32 @cudaMemcpy(ptr noundef nonnull %arrayidx, ptr noundef nonnull %valueAtSymmatIndexMTimesMPlus1PlusMPoint, i64 noundef 4, i32 noundef 1) #18
  %48 = load ptr, ptr %symmat_gpu, align 8, !tbaa !45
  %call52 = call i32 @cudaMemcpy(ptr noundef %symmat_outputFromGpu, ptr noundef %48, i64 noundef 16777216, i32 noundef 2) #18
  %49 = load ptr, ptr %data_gpu, align 8, !tbaa !45
  %call53 = call i32 @cudaFree(ptr noundef %49) #18
  %50 = load ptr, ptr %symmat_gpu, align 8, !tbaa !45
  %call54 = call i32 @cudaFree(ptr noundef %50) #18
  %51 = load ptr, ptr %stddev_gpu, align 8, !tbaa !45
  %call55 = call i32 @cudaFree(ptr noundef %51) #18
  %52 = load ptr, ptr %mean_gpu, align 8, !tbaa !45
  %call56 = call i32 @cudaFree(ptr noundef %52) #18
  call void @llvm.lifetime.end.p0(ptr nonnull %valueAtSymmatIndexMTimesMPlus1PlusMPoint) #19
  call void @llvm.lifetime.end.p0(ptr nonnull %symmat_gpu) #19
  call void @llvm.lifetime.end.p0(ptr nonnull %mean_gpu) #19
  call void @llvm.lifetime.end.p0(ptr nonnull %stddev_gpu) #19
  call void @llvm.lifetime.end.p0(ptr nonnull %data_gpu) #19
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #8

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #5 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #19
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #17
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #18
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !48
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !51
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #19
  store double %2, ptr @polybench_t_start, align 8, !tbaa !52
  ret void
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #8

declare i32 @cudaThreadSynchronize() local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #5 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #19
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #17
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #18
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !48
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !51
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #19
  store double %2, ptr @polybench_t_end, align 8, !tbaa !52
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !52
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !52
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #18
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #9 {
entry:
  %Tp.i.i65 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i56 = alloca ptr, align 8
  %newA.i.i49 = alloca ptr, align 8
  %newA.i.i42 = alloca ptr, align 8
  %newA.i.i35 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #19
  store ptr null, ptr %newA.i.i, align 8, !tbaa !58
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 16777216) #17
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !58
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !59
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #20
  call void @exit(i32 noundef 1) #21
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #19
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i35) #19
  store ptr null, ptr %newA.i.i35, align 8, !tbaa !58
  %call.i.i36 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i35, i64 noundef 32, i64 noundef 8192) #17
  %3 = load ptr, ptr %newA.i.i35, align 8, !tbaa !58
  %tobool.i.i37 = icmp eq ptr %3, null
  %tobool1.i.i38 = icmp ne i32 %call.i.i36, 0
  %or.cond.i.i39 = select i1 %tobool.i.i37, i1 true, i1 %tobool1.i.i38
  br i1 %or.cond.i.i39, label %if.then.i.i40, label %_Z20polybench_alloc_datayi.exit41

if.then.i.i40:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !59
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #20
  call void @exit(i32 noundef 1) #21
  unreachable

_Z20polybench_alloc_datayi.exit41:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i35) #19
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i42) #19
  store ptr null, ptr %newA.i.i42, align 8, !tbaa !58
  %call.i.i43 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i42, i64 noundef 32, i64 noundef 8192) #17
  %6 = load ptr, ptr %newA.i.i42, align 8, !tbaa !58
  %tobool.i.i44 = icmp eq ptr %6, null
  %tobool1.i.i45 = icmp ne i32 %call.i.i43, 0
  %or.cond.i.i46 = select i1 %tobool.i.i44, i1 true, i1 %tobool1.i.i45
  br i1 %or.cond.i.i46, label %if.then.i.i47, label %_Z20polybench_alloc_datayi.exit48

if.then.i.i47:                                    ; preds = %_Z20polybench_alloc_datayi.exit41
  %7 = load ptr, ptr @stderr, align 8, !tbaa !59
  %8 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %7) #20
  call void @exit(i32 noundef 1) #21
  unreachable

_Z20polybench_alloc_datayi.exit48:                ; preds = %_Z20polybench_alloc_datayi.exit41
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i42) #19
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i49) #19
  store ptr null, ptr %newA.i.i49, align 8, !tbaa !58
  %call.i.i50 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i49, i64 noundef 32, i64 noundef 16777216) #17
  %9 = load ptr, ptr %newA.i.i49, align 8, !tbaa !58
  %tobool.i.i51 = icmp eq ptr %9, null
  %tobool1.i.i52 = icmp ne i32 %call.i.i50, 0
  %or.cond.i.i53 = select i1 %tobool.i.i51, i1 true, i1 %tobool1.i.i52
  br i1 %or.cond.i.i53, label %if.then.i.i54, label %_Z20polybench_alloc_datayi.exit55

if.then.i.i54:                                    ; preds = %_Z20polybench_alloc_datayi.exit48
  %10 = load ptr, ptr @stderr, align 8, !tbaa !59
  %11 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %10) #20
  call void @exit(i32 noundef 1) #21
  unreachable

_Z20polybench_alloc_datayi.exit55:                ; preds = %_Z20polybench_alloc_datayi.exit48
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i49) #19
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i56) #19
  store ptr null, ptr %newA.i.i56, align 8, !tbaa !58
  %call.i.i57 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i56, i64 noundef 32, i64 noundef 16777216) #17
  %12 = load ptr, ptr %newA.i.i56, align 8, !tbaa !58
  %tobool.i.i58 = icmp eq ptr %12, null
  %tobool1.i.i59 = icmp ne i32 %call.i.i57, 0
  %or.cond.i.i60 = select i1 %tobool.i.i58, i1 true, i1 %tobool1.i.i59
  br i1 %or.cond.i.i60, label %if.then.i.i61, label %_Z20polybench_alloc_datayi.exit62

if.then.i.i61:                                    ; preds = %_Z20polybench_alloc_datayi.exit55
  %13 = load ptr, ptr @stderr, align 8, !tbaa !59
  %14 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %13) #20
  call void @exit(i32 noundef 1) #21
  unreachable

_Z20polybench_alloc_datayi.exit62:                ; preds = %_Z20polybench_alloc_datayi.exit55
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i56) #19
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc7_crit_edge.i, %_Z20polybench_alloc_datayi.exit62
  %indvars.iv21.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit62 ], [ %indvars.iv.next22.i, %for.cond1.for.inc7_crit_edge.i ]
  %arrayidx.i = getelementptr inbounds nuw [8192 x i8], ptr %0, i64 %indvars.iv21.i
  %15 = trunc nuw nsw i64 %indvars.iv21.i to i32
  %conv.i = uitofp nneg i32 %15 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond1.preheader.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %16 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %17 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %18 = fmul nnan <4 x float> %broadcast.splat, %16
  %19 = fmul nnan <4 x float> %broadcast.splat, %17
  %20 = fmul nnan <4 x float> %18, splat (float f0x3A000000)
  %21 = fmul nnan <4 x float> %19, splat (float f0x3A000000)
  %22 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 16
  store <4 x float> %20, ptr %22, align 4, !tbaa !10
  store <4 x float> %21, ptr %23, align 4, !tbaa !10
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %24 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %25 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %26 = fmul nnan <4 x float> %broadcast.splat, %24
  %27 = fmul nnan <4 x float> %broadcast.splat, %25
  %28 = fmul nnan <4 x float> %26, splat (float f0x3A000000)
  %29 = fmul nnan <4 x float> %27, splat (float f0x3A000000)
  %30 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %31 = getelementptr inbounds nuw i8, ptr %30, i64 32
  %32 = getelementptr inbounds nuw i8, ptr %30, i64 48
  store <4 x float> %28, ptr %31, align 4, !tbaa !10
  store <4 x float> %29, ptr %32, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %33 = icmp eq i64 %index.next.1, 2048
  br i1 %33, label %for.cond1.for.inc7_crit_edge.i, label %vector.body, !llvm.loop !61

for.cond1.for.inc7_crit_edge.i:                   ; preds = %vector.body
  %indvars.iv.next22.i = add nuw nsw i64 %indvars.iv21.i, 1
  %exitcond25.not.i = icmp eq i64 %indvars.iv.next22.i, 2048
  br i1 %exitcond25.not.i, label %_Z11init_arraysiiPA2048_f.exit, label %for.cond1.preheader.i, !llvm.loop !17

_Z11init_arraysiiPA2048_f.exit:                   ; preds = %for.cond1.for.inc7_crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #19
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #18
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #18
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #18
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #19
  call void @_Z15correlationCudaiiPA2048_fPfS1_S0_S0_(i32 noundef 2048, i32 noundef 2048, ptr noundef nonnull %0, ptr noundef nonnull %3, ptr noundef nonnull %6, ptr noundef nonnull %9, ptr noundef nonnull %12) #18
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #19
  %call.i.i63 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i63, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i64

if.then.i.i64:                                    ; preds = %_Z11init_arraysiiPA2048_f.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i63) #18
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z11init_arraysiiPA2048_f.exit, %if.then.i.i64
  %34 = load i64, ptr %Tp.i.i, align 8, !tbaa !48
  %conv.i.i = sitofp i64 %34 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %35 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !51
  %conv2.i.i = sitofp i64 %35 to double
  %36 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #19
  store double %36, ptr @polybench_t_start, align 8, !tbaa !52
  call void @_Z11correlationiiPA2048_fPfS1_S0_(i32 noundef 2048, i32 noundef 2048, ptr noundef nonnull %0, ptr noundef nonnull %3, ptr noundef nonnull %6, ptr noundef nonnull %9) #18
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i65) #19
  %call.i.i66 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i65, ptr noundef null) #17
  %cmp.not.i.i67 = icmp eq i32 %call.i.i66, 0
  br i1 %cmp.not.i.i67, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i68

if.then.i.i68:                                    ; preds = %_Z21polybench_timer_startv.exit
  %call1.i.i69 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i66) #18
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z21polybench_timer_startv.exit, %if.then.i.i68
  %37 = load i64, ptr %Tp.i.i65, align 8, !tbaa !48
  %conv.i.i70 = sitofp i64 %37 to double
  %tv_usec.i.i71 = getelementptr inbounds nuw i8, ptr %Tp.i.i65, i64 8
  %38 = load i64, ptr %tv_usec.i.i71, align 8, !tbaa !51
  %conv2.i.i72 = sitofp i64 %38 to double
  %39 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i72, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i70)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i65) #19
  store double %39, ptr @polybench_t_end, align 8, !tbaa !52
  %40 = load double, ptr @polybench_t_start, align 8, !tbaa !52
  %sub.i = fsub double %39, %40
  %call.i73 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #18
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc14_crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv34.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next35.i, %for.cond1.for.inc14_crit_edge.us.i ]
  %fail.030.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %75, %for.cond1.for.inc14_crit_edge.us.i ]
  %arrayidx.us.i = getelementptr inbounds nuw [8192 x i8], ptr %9, i64 %indvars.iv34.i
  %arrayidx7.us.i = getelementptr inbounds nuw [8192 x i8], ptr %12, i64 %indvars.iv34.i
  %41 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.030.us.i, i64 0
  br label %vector.body82

vector.body82:                                    ; preds = %vector.body82, %for.cond1.preheader.us.i
  %index83 = phi i64 [ 0, %for.cond1.preheader.us.i ], [ %index.next85, %vector.body82 ]
  %vec.phi = phi <4 x i32> [ %41, %for.cond1.preheader.us.i ], [ %73, %vector.body82 ]
  %42 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i, i64 %index83
  %wide.load = load <4 x float>, ptr %42, align 4, !tbaa !10
  %43 = fpext <4 x float> %wide.load to <4 x double>
  %44 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us.i, i64 %index83
  %wide.load84 = load <4 x float>, ptr %44, align 4, !tbaa !10
  %45 = fpext <4 x float> %wide.load84 to <4 x double>
  %46 = fcmp olt <4 x double> %43, splat (double f0xB690000000000000)
  %47 = fneg <4 x float> %wide.load
  %48 = select <4 x i1> %46, <4 x float> %47, <4 x float> %wide.load
  %49 = fpext <4 x float> %48 to <4 x double>
  %50 = fcmp uge <4 x double> %49, splat (double 1.000000e-02)
  %51 = fcmp olt <4 x double> %45, splat (double f0xB690000000000000)
  %52 = fneg <4 x float> %wide.load84
  %53 = select <4 x i1> %51, <4 x float> %52, <4 x float> %wide.load84
  %54 = fpext <4 x float> %53 to <4 x double>
  %55 = fcmp uge <4 x double> %54, splat (double 1.000000e-02)
  %56 = fsub <4 x double> %43, %45
  %57 = fptrunc <4 x double> %56 to <4 x float>
  %58 = fcmp olt <4 x double> %56, splat (double f0xB690000000000000)
  %59 = fneg <4 x float> %57
  %60 = select <4 x i1> %58, <4 x float> %59, <4 x float> %57
  %61 = fadd <4 x double> %43, splat (double f0x3E45798EE0000000)
  %62 = fptrunc <4 x double> %61 to <4 x float>
  %63 = fcmp olt <4 x double> %61, splat (double f0xB690000000000000)
  %64 = fneg <4 x float> %62
  %65 = select <4 x i1> %63, <4 x float> %64, <4 x float> %62
  %66 = fdiv <4 x float> %60, %65
  %67 = fcmp olt <4 x float> %66, zeroinitializer
  %68 = fneg <4 x float> %66
  %69 = select <4 x i1> %67, <4 x float> %68, <4 x float> %66
  %70 = fmul <4 x float> %69, splat (float 1.000000e+02)
  %71 = fpext <4 x float> %70 to <4 x double>
  %72 = fcmp ogt <4 x double> %71, splat (double 1.050000e+00)
  %.not88 = select <4 x i1> %50, <4 x i1> splat (i1 true), <4 x i1> %55
  %narrow = select <4 x i1> %.not88, <4 x i1> %72, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %73 = add <4 x i32> %vec.phi, %predphi
  %index.next85 = add nuw i64 %index83, 4
  %74 = icmp eq i64 %index.next85, 2048
  br i1 %74, label %for.cond1.for.inc14_crit_edge.us.i, label %vector.body82, !llvm.loop !62

for.cond1.for.inc14_crit_edge.us.i:               ; preds = %vector.body82
  %75 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %73)
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond38.not.i = icmp eq i64 %indvars.iv.next35.i, 2048
  br i1 %exitcond38.not.i, label %_Z14compareResultsiiPA2048_fS0_.exit, label %for.cond1.preheader.us.i, !llvm.loop !43

_Z14compareResultsiiPA2048_fS0_.exit:             ; preds = %for.cond1.for.inc14_crit_edge.us.i
  %call17.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 1.050000e+00, i32 noundef %75) #18
  call void @free(ptr noundef %0) #17
  call void @free(ptr noundef %3) #17
  call void @free(ptr noundef %6) #17
  call void @free(ptr noundef nonnull %9) #17
  call void @free(ptr noundef nonnull %12) #17
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #19
  store ptr null, ptr %newA.i, align 8, !tbaa !58
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #17
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !58
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !59
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #20
  call void @exit(i32 noundef 1) #21
  unreachable

_ZL7xmallocm.exit:                                ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i) #19
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(errnomem: write)
declare float @sqrtf(float noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare noundef i32 @gettimeofday(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #6

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #4

; Function Attrs: nofree nounwind
declare i32 @posix_memalign(ptr noundef, i64 noundef, i64 noundef) local_unnamed_addr #6

; Function Attrs: nofree noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #13

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #13

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #14

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #15

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #16

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite, errnomem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #4 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { mustprogress nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #6 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #7 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #8 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #9 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #10 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #11 = { mustprogress nocallback nofree nosync nounwind willreturn memory(errnomem: write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #12 = { nofree noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #13 = { nofree nounwind }
attributes #14 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #15 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #16 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #17 = { nounwind "uniform-work-group-size" }
attributes #18 = { "uniform-work-group-size" }
attributes #19 = { nounwind }
attributes #20 = { cold }
attributes #21 = { cold noreturn nounwind "uniform-work-group-size" }

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
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !13}
!22 = distinct !{!22, !13, !14, !15}
!23 = distinct !{!23, !13}
!24 = distinct !{!24, !13}
!25 = distinct !{!25, !13, !15, !14}
!26 = !{!27}
!27 = distinct !{!27, !28}
!28 = distinct !{!28, !"LVerDomain"}
!29 = !{!30}
!30 = distinct !{!30, !28}
!31 = !{!27, !32}
!32 = distinct !{!32, !28}
!33 = !{!32}
!34 = distinct !{!34, !13, !14, !15}
!35 = distinct !{!35, !13}
!36 = distinct !{!36, !13}
!37 = distinct !{!37, !13}
!38 = distinct !{!38, !13, !14}
!39 = distinct !{!39, !13}
!40 = distinct !{!40, !20}
!41 = distinct !{!41, !13, !14, !15}
!42 = distinct !{!42, !13, !15, !14}
!43 = distinct !{!43, !13}
!44 = !{!7, !7, i64 0}
!45 = !{!46, !46, i64 0}
!46 = !{!"p1 float", !47, i64 0}
!47 = !{!"any pointer", !8, i64 0}
!48 = !{!49, !50, i64 0}
!49 = !{!"_ZTS7timeval", !50, i64 0, !50, i64 8}
!50 = !{!"long", !8, i64 0}
!51 = !{!49, !50, i64 8}
!52 = !{!53, !53, i64 0}
!53 = !{!"double", !8, i64 0}
!54 = !{ptr @_Z26__device_stub__mean_kerneliiPfS_}
!55 = !{ptr @_Z25__device_stub__std_kerneliiPfS_S_}
!56 = !{ptr @_Z28__device_stub__reduce_kerneliiPfS_S_}
!57 = !{ptr @_Z26__device_stub__corr_kerneliiPfS_}
!58 = !{!47, !47, i64 0}
!59 = !{!60, !60, i64 0}
!60 = !{!"p1 _ZTS8_IO_FILE", !47, i64 0}
!61 = distinct !{!61, !13, !14, !15}
!62 = distinct !{!62, !13, !14, !15}
