; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/COVAR/covariance.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/COVAR/covariance.cu"
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z10covarianceiiPA2048_fS0_Pf(i32 noundef %m, i32 noundef %n, ptr nofree noundef captures(none) %data, ptr nofree noundef writeonly captures(none) %symmat, ptr nofree noundef captures(none) %mean) local_unnamed_addr #3 {
entry:
  %cmp123 = icmp sgt i32 %m, 0
  br i1 %cmp123, label %for.body.lr.ph, label %for.cond16.preheader.thread

for.body.lr.ph:                                   ; preds = %entry
  %cmp2121 = icmp sgt i32 %n, 0
  %wide.trip.count143 = zext nneg i32 %m to i64
  br i1 %cmp2121, label %for.body.us.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph
  %0 = shl nuw nsw i64 %wide.trip.count143, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %mean, i8 0, i64 %0, i1 false), !tbaa !10
  br label %for.cond16.preheader.thread

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %wide.trip.count = zext nneg i32 %n to i64
  %xtraiter = and i64 %wide.trip.count, 3
  %1 = icmp ult i32 %n, 4
  %unroll_iter = and i64 %wide.trip.count, 2147483644
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod193 = icmp ne i64 %xtraiter, 0
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.end_crit_edge.us
  %indvars.iv140 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next141, %for.cond1.for.end_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %indvars.iv140
  store float 0.000000e+00, ptr %arrayidx.us, align 4, !tbaa !10
  %invariant.gep.us = getelementptr inbounds nuw [4 x i8], ptr %data, i64 %indvars.iv140
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
  tail call void @llvm.assume(i1 %lcmp.mod193)
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
  %conv.us = fpext float %add.us.lcssa to double
  %div.us = fdiv double %conv.us, f0x414885C20147AE14
  %conv12.us = fptrunc double %div.us to float
  store float %conv12.us, ptr %arrayidx.us, align 4, !tbaa !10
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond144.not = icmp eq i64 %indvars.iv.next141, %wide.trip.count143
  br i1 %exitcond144.not, label %for.cond19.preheader.preheader, label %for.body.us, !llvm.loop !21

for.cond16.preheader.thread:                      ; preds = %for.body.preheader, %entry
  %cmp17127181 = icmp sgt i32 %n, 0
  br label %for.cond34.preheader

for.cond19.preheader.preheader:                   ; preds = %for.cond1.for.end_crit_edge.us
  %wide.trip.count153 = zext nneg i32 %n to i64
  %wide.trip.count148 = zext nneg i32 %m to i64
  %12 = shl nuw nsw i64 %wide.trip.count, 13
  %13 = shl nuw nsw i64 %wide.trip.count143, 2
  %14 = getelementptr i8, ptr %data, i64 %12
  %15 = getelementptr i8, ptr %14, i64 %13
  %scevgep186 = getelementptr i8, ptr %15, i64 -8192
  %scevgep187 = getelementptr i8, ptr %mean, i64 %13
  %min.iters.check = icmp ult i32 %m, 8
  %bound0 = icmp ult ptr %data, %scevgep187
  %bound1 = icmp ult ptr %mean, %scevgep186
  %found.conflict = and i1 %bound0, %bound1
  %n.vec = and i64 %wide.trip.count143, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count143
  %xtraiter194 = and i64 %wide.trip.count143, 3
  %lcmp.mod195.not = icmp eq i64 %xtraiter194, 0
  br label %for.cond19.preheader

for.cond19.preheader:                             ; preds = %for.cond19.preheader.preheader, %for.cond19.for.inc31_crit_edge
  %indvars.iv150 = phi i64 [ 0, %for.cond19.preheader.preheader ], [ %indvars.iv.next151, %for.cond19.for.inc31_crit_edge ]
  %arrayidx25 = getelementptr inbounds nuw [8192 x i8], ptr %data, i64 %indvars.iv150
  %brmerge = select i1 %min.iters.check, i1 true, i1 %found.conflict
  br i1 %brmerge, label %for.body21.preheader, label %vector.body

vector.body:                                      ; preds = %for.cond19.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.cond19.preheader ]
  %16 = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %index
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 16
  %wide.load = load <4 x float>, ptr %16, align 4, !tbaa !10, !alias.scope !22
  %wide.load188 = load <4 x float>, ptr %17, align 4, !tbaa !10, !alias.scope !22
  %18 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25, i64 %index
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 16
  %wide.load189 = load <4 x float>, ptr %18, align 4, !tbaa !10, !alias.scope !25, !noalias !22
  %wide.load190 = load <4 x float>, ptr %19, align 4, !tbaa !10, !alias.scope !25, !noalias !22
  %20 = fsub <4 x float> %wide.load189, %wide.load
  %21 = fsub <4 x float> %wide.load190, %wide.load188
  store <4 x float> %20, ptr %18, align 4, !tbaa !10, !alias.scope !25, !noalias !22
  store <4 x float> %21, ptr %19, align 4, !tbaa !10, !alias.scope !25, !noalias !22
  %index.next = add nuw i64 %index, 8
  %22 = icmp eq i64 %index.next, %n.vec
  br i1 %22, label %middle.block, label %vector.body, !llvm.loop !27

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond19.for.inc31_crit_edge, label %for.body21.preheader

for.body21.preheader:                             ; preds = %for.cond19.preheader, %middle.block
  %indvars.iv145.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %for.cond19.preheader ]
  br i1 %lcmp.mod195.not, label %for.body21.prol.loopexit, label %for.body21.prol

for.body21.prol:                                  ; preds = %for.body21.preheader, %for.body21.prol
  %indvars.iv145.prol = phi i64 [ %indvars.iv.next146.prol, %for.body21.prol ], [ %indvars.iv145.ph, %for.body21.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body21.prol ], [ 0, %for.body21.preheader ]
  %arrayidx23.prol = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %indvars.iv145.prol
  %23 = load float, ptr %arrayidx23.prol, align 4, !tbaa !10
  %arrayidx27.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25, i64 %indvars.iv145.prol
  %24 = load float, ptr %arrayidx27.prol, align 4, !tbaa !10
  %sub.prol = fsub float %24, %23
  store float %sub.prol, ptr %arrayidx27.prol, align 4, !tbaa !10
  %indvars.iv.next146.prol = add nuw nsw i64 %indvars.iv145.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter194
  br i1 %prol.iter.cmp.not, label %for.body21.prol.loopexit, label %for.body21.prol, !llvm.loop !28

for.body21.prol.loopexit:                         ; preds = %for.body21.prol, %for.body21.preheader
  %indvars.iv145.unr = phi i64 [ %indvars.iv145.ph, %for.body21.preheader ], [ %indvars.iv.next146.prol, %for.body21.prol ]
  %25 = sub nsw i64 %indvars.iv145.ph, %wide.trip.count143
  %26 = icmp ugt i64 %25, -4
  br i1 %26, label %for.cond19.for.inc31_crit_edge, label %for.body21

for.cond34.preheader:                             ; preds = %for.cond19.for.inc31_crit_edge, %for.cond16.preheader.thread
  %cmp17127183 = phi i1 [ %cmp17127181, %for.cond16.preheader.thread ], [ true, %for.cond19.for.inc31_crit_edge ]
  br i1 %cmp123, label %for.cond37.preheader.lr.ph, label %for.end75

for.cond37.preheader.lr.ph:                       ; preds = %for.cond34.preheader
  %wide.trip.count179 = zext nneg i32 %m to i64
  br i1 %cmp17127183, label %for.cond37.preheader.us.preheader, label %for.cond37.preheader

for.cond37.preheader.us.preheader:                ; preds = %for.cond37.preheader.lr.ph
  %wide.trip.count166 = zext nneg i32 %n to i64
  %xtraiter199 = and i64 %wide.trip.count166, 1
  %27 = icmp eq i32 %n, 1
  %unroll_iter206 = and i64 %wide.trip.count166, 2147483646
  %lcmp.mod203.not = icmp eq i64 %xtraiter199, 0
  %lcmp.mod205 = trunc i32 %n to i1
  br label %for.cond37.preheader.us

for.cond37.preheader.us:                          ; preds = %for.cond37.preheader.us.preheader, %for.inc73.split.us.us
  %indvars.iv171 = phi i64 [ 0, %for.cond37.preheader.us.preheader ], [ %indvars.iv.next172, %for.inc73.split.us.us ]
  %arrayidx41.us = getelementptr inbounds nuw [8192 x i8], ptr %symmat, i64 %indvars.iv171
  %invariant.gep.us135 = getelementptr inbounds nuw [4 x i8], ptr %symmat, i64 %indvars.iv171
  br label %for.body39.us.us

for.body39.us.us:                                 ; preds = %for.cond44.for.end61_crit_edge.us.us, %for.cond37.preheader.us
  %indvars.iv173 = phi i64 [ %indvars.iv.next174, %for.cond44.for.end61_crit_edge.us.us ], [ %indvars.iv171, %for.cond37.preheader.us ]
  %arrayidx43.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx41.us, i64 %indvars.iv173
  store float 0.000000e+00, ptr %arrayidx43.us.us, align 4, !tbaa !10
  br i1 %27, label %for.body46.us.us.epil.preheader, label %for.body46.us.us

for.body46.us.us:                                 ; preds = %for.body39.us.us, %for.body46.us.us
  %indvars.iv163 = phi i64 [ %indvars.iv.next164.1, %for.body46.us.us ], [ 0, %for.body39.us.us ]
  %28 = phi float [ %35, %for.body46.us.us ], [ 0.000000e+00, %for.body39.us.us ]
  %niter207 = phi i64 [ %niter207.next.1, %for.body46.us.us ], [ 0, %for.body39.us.us ]
  %arrayidx48.us.us = getelementptr inbounds nuw [8192 x i8], ptr %data, i64 %indvars.iv163
  %arrayidx50.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx48.us.us, i64 %indvars.iv171
  %29 = load float, ptr %arrayidx50.us.us, align 4, !tbaa !10
  %arrayidx54.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx48.us.us, i64 %indvars.iv173
  %30 = load float, ptr %arrayidx54.us.us, align 4, !tbaa !10
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %28)
  store float %31, ptr %arrayidx43.us.us, align 4, !tbaa !10
  %32 = getelementptr inbounds nuw [8192 x i8], ptr %data, i64 %indvars.iv163
  %arrayidx48.us.us.1 = getelementptr inbounds nuw i8, ptr %32, i64 8192
  %arrayidx50.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx48.us.us.1, i64 %indvars.iv171
  %33 = load float, ptr %arrayidx50.us.us.1, align 4, !tbaa !10
  %arrayidx54.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx48.us.us.1, i64 %indvars.iv173
  %34 = load float, ptr %arrayidx54.us.us.1, align 4, !tbaa !10
  %35 = tail call float @llvm.fmuladd.f32(float %33, float %34, float %31)
  store float %35, ptr %arrayidx43.us.us, align 4, !tbaa !10
  %indvars.iv.next164.1 = add nuw nsw i64 %indvars.iv163, 2
  %niter207.next.1 = add i64 %niter207, 2
  %niter207.ncmp.1 = icmp eq i64 %niter207.next.1, %unroll_iter206
  br i1 %niter207.ncmp.1, label %for.cond44.for.end61_crit_edge.us.us.unr-lcssa, label %for.body46.us.us, !llvm.loop !29

for.cond44.for.end61_crit_edge.us.us.unr-lcssa:   ; preds = %for.body46.us.us
  br i1 %lcmp.mod203.not, label %for.cond44.for.end61_crit_edge.us.us, label %for.body46.us.us.epil.preheader

for.body46.us.us.epil.preheader:                  ; preds = %for.cond44.for.end61_crit_edge.us.us.unr-lcssa, %for.body39.us.us
  %indvars.iv163.epil.init = phi i64 [ 0, %for.body39.us.us ], [ %indvars.iv.next164.1, %for.cond44.for.end61_crit_edge.us.us.unr-lcssa ]
  %.epil.init202 = phi float [ 0.000000e+00, %for.body39.us.us ], [ %35, %for.cond44.for.end61_crit_edge.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod205)
  %arrayidx48.us.us.epil = getelementptr inbounds nuw [8192 x i8], ptr %data, i64 %indvars.iv163.epil.init
  %arrayidx50.us.us.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx48.us.us.epil, i64 %indvars.iv171
  %36 = load float, ptr %arrayidx50.us.us.epil, align 4, !tbaa !10
  %arrayidx54.us.us.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx48.us.us.epil, i64 %indvars.iv173
  %37 = load float, ptr %arrayidx54.us.us.epil, align 4, !tbaa !10
  %38 = tail call float @llvm.fmuladd.f32(float %36, float %37, float %.epil.init202)
  store float %38, ptr %arrayidx43.us.us, align 4, !tbaa !10
  br label %for.cond44.for.end61_crit_edge.us.us

for.cond44.for.end61_crit_edge.us.us:             ; preds = %for.cond44.for.end61_crit_edge.us.us.unr-lcssa, %for.body46.us.us.epil.preheader
  %.lcssa = phi float [ %35, %for.cond44.for.end61_crit_edge.us.us.unr-lcssa ], [ %38, %for.body46.us.us.epil.preheader ]
  %gep.us132.us = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us135, i64 %indvars.iv173
  store float %.lcssa, ptr %gep.us132.us, align 4, !tbaa !10
  %indvars.iv.next174 = add nuw nsw i64 %indvars.iv173, 1
  %exitcond177.not = icmp eq i64 %indvars.iv.next174, %wide.trip.count179
  br i1 %exitcond177.not, label %for.inc73.split.us.us, label %for.body39.us.us, !llvm.loop !30

for.inc73.split.us.us:                            ; preds = %for.cond44.for.end61_crit_edge.us.us
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond180.not = icmp eq i64 %indvars.iv.next172, %wide.trip.count179
  br i1 %exitcond180.not, label %for.end75, label %for.cond37.preheader.us, !llvm.loop !31

for.body21:                                       ; preds = %for.body21.prol.loopexit, %for.body21
  %indvars.iv145 = phi i64 [ %indvars.iv.next146.3, %for.body21 ], [ %indvars.iv145.unr, %for.body21.prol.loopexit ]
  %arrayidx23 = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %indvars.iv145
  %39 = load float, ptr %arrayidx23, align 4, !tbaa !10
  %arrayidx27 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25, i64 %indvars.iv145
  %40 = load float, ptr %arrayidx27, align 4, !tbaa !10
  %sub = fsub float %40, %39
  store float %sub, ptr %arrayidx27, align 4, !tbaa !10
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %arrayidx23.1 = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %indvars.iv.next146
  %41 = load float, ptr %arrayidx23.1, align 4, !tbaa !10
  %arrayidx27.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25, i64 %indvars.iv.next146
  %42 = load float, ptr %arrayidx27.1, align 4, !tbaa !10
  %sub.1 = fsub float %42, %41
  store float %sub.1, ptr %arrayidx27.1, align 4, !tbaa !10
  %indvars.iv.next146.1 = add nuw nsw i64 %indvars.iv145, 2
  %arrayidx23.2 = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %indvars.iv.next146.1
  %43 = load float, ptr %arrayidx23.2, align 4, !tbaa !10
  %arrayidx27.2 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25, i64 %indvars.iv.next146.1
  %44 = load float, ptr %arrayidx27.2, align 4, !tbaa !10
  %sub.2 = fsub float %44, %43
  store float %sub.2, ptr %arrayidx27.2, align 4, !tbaa !10
  %indvars.iv.next146.2 = add nuw nsw i64 %indvars.iv145, 3
  %arrayidx23.3 = getelementptr inbounds nuw [4 x i8], ptr %mean, i64 %indvars.iv.next146.2
  %45 = load float, ptr %arrayidx23.3, align 4, !tbaa !10
  %arrayidx27.3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25, i64 %indvars.iv.next146.2
  %46 = load float, ptr %arrayidx27.3, align 4, !tbaa !10
  %sub.3 = fsub float %46, %45
  store float %sub.3, ptr %arrayidx27.3, align 4, !tbaa !10
  %indvars.iv.next146.3 = add nuw nsw i64 %indvars.iv145, 4
  %exitcond149.not.3 = icmp eq i64 %indvars.iv.next146.3, %wide.trip.count148
  br i1 %exitcond149.not.3, label %for.cond19.for.inc31_crit_edge, label %for.body21, !llvm.loop !32

for.cond19.for.inc31_crit_edge:                   ; preds = %for.body21.prol.loopexit, %for.body21, %middle.block
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond154.not = icmp eq i64 %indvars.iv.next151, %wide.trip.count153
  br i1 %exitcond154.not, label %for.cond34.preheader, label %for.cond19.preheader, !llvm.loop !33

for.cond37.preheader:                             ; preds = %for.cond37.preheader.lr.ph, %for.inc73.split
  %indvar = phi i64 [ %indvar.next, %for.inc73.split ], [ 0, %for.cond37.preheader.lr.ph ]
  %47 = sub nsw i64 %wide.trip.count179, %indvar
  %48 = mul nuw nsw i64 %indvar, 8196
  %scevgep = getelementptr i8, ptr %symmat, i64 %48
  %49 = trunc i64 %indvar to i32
  %50 = xor i32 %49, -1
  %51 = add i32 %m, %50
  %52 = zext i32 %51 to i64
  %53 = shl nuw nsw i64 %52, 2
  %54 = add nuw nsw i64 %53, 4
  %invariant.gep = getelementptr inbounds nuw [4 x i8], ptr %symmat, i64 %indvar
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1) %scevgep, i8 0, i64 %54, i1 false), !tbaa !10
  %xtraiter196 = and i64 %47, 3
  %lcmp.mod197.not = icmp eq i64 %xtraiter196, 0
  br i1 %lcmp.mod197.not, label %for.body39.prol.loopexit, label %for.body39.prol

for.body39.prol:                                  ; preds = %for.cond37.preheader, %for.body39.prol
  %indvars.iv155.prol = phi i64 [ %indvars.iv.next156.prol, %for.body39.prol ], [ %indvar, %for.cond37.preheader ]
  %prol.iter198 = phi i64 [ %prol.iter198.next, %for.body39.prol ], [ 0, %for.cond37.preheader ]
  %gep.prol = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv155.prol
  store float 0.000000e+00, ptr %gep.prol, align 4, !tbaa !10
  %indvars.iv.next156.prol = add nuw nsw i64 %indvars.iv155.prol, 1
  %prol.iter198.next = add i64 %prol.iter198, 1
  %prol.iter198.cmp.not = icmp eq i64 %prol.iter198.next, %xtraiter196
  br i1 %prol.iter198.cmp.not, label %for.body39.prol.loopexit, label %for.body39.prol, !llvm.loop !34

for.body39.prol.loopexit:                         ; preds = %for.body39.prol, %for.cond37.preheader
  %indvars.iv155.unr = phi i64 [ %indvar, %for.cond37.preheader ], [ %indvars.iv.next156.prol, %for.body39.prol ]
  %55 = sub nsw i64 %indvar, %wide.trip.count179
  %56 = icmp ugt i64 %55, -4
  br i1 %56, label %for.inc73.split, label %for.body39

for.body39:                                       ; preds = %for.body39.prol.loopexit, %for.body39
  %indvars.iv155 = phi i64 [ %indvars.iv.next156.3, %for.body39 ], [ %indvars.iv155.unr, %for.body39.prol.loopexit ]
  %gep = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv155
  store float 0.000000e+00, ptr %gep, align 4, !tbaa !10
  %57 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv155
  %gep.1 = getelementptr inbounds nuw i8, ptr %57, i64 8192
  store float 0.000000e+00, ptr %gep.1, align 4, !tbaa !10
  %58 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv155
  %gep.2 = getelementptr inbounds nuw i8, ptr %58, i64 16384
  store float 0.000000e+00, ptr %gep.2, align 4, !tbaa !10
  %59 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv155
  %gep.3 = getelementptr inbounds nuw i8, ptr %59, i64 24576
  store float 0.000000e+00, ptr %gep.3, align 4, !tbaa !10
  %indvars.iv.next156.3 = add nuw nsw i64 %indvars.iv155, 4
  %exitcond159.not.3 = icmp eq i64 %indvars.iv.next156.3, %wide.trip.count179
  br i1 %exitcond159.not.3, label %for.inc73.split, label %for.body39, !llvm.loop !30

for.inc73.split:                                  ; preds = %for.body39, %for.body39.prol.loopexit
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond162.not = icmp eq i64 %indvar.next, %wide.trip.count179
  br i1 %exitcond162.not, label %for.end75, label %for.cond37.preheader, !llvm.loop !31

for.end75:                                        ; preds = %for.inc73.split, %for.inc73.split.us.us, %for.cond34.preheader
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
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !35

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
  br i1 %exitcond.not, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us, !llvm.loop !36

for.cond1.for.inc14_crit_edge.us:                 ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %fail.2.us.lcssa = phi i32 [ %34, %middle.block ], [ %fail.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %for.end16, label %for.cond1.preheader.us, !llvm.loop !37

for.end16:                                        ; preds = %for.cond1.for.inc14_crit_edge.us, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %call17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 1.050000e+00, i32 noundef %fail.0.lcssa) #16
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #6

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #7 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp) #17
  %call = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp, i32 noundef 0) #16
  %call1 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp) #16
  %call2 = call i32 @cudaSetDevice(i32 noundef 0) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp) #17
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
  store i32 %m, ptr %m.addr, align 4, !tbaa !38
  store i32 %n, ptr %n.addr, align 4, !tbaa !38
  store ptr %mean, ptr %mean.addr, align 8, !tbaa !39
  store ptr %data, ptr %data.addr, align 8, !tbaa !39
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
define dso_local void @_Z28__device_stub__reduce_kerneliiPfS_(i32 noundef %m, i32 noundef %n, ptr noundef %mean, ptr noundef %data) #9 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %mean.addr = alloca ptr, align 8
  %data.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %m, ptr %m.addr, align 4, !tbaa !38
  store i32 %n, ptr %n.addr, align 4, !tbaa !38
  store ptr %mean, ptr %mean.addr, align 8, !tbaa !39
  store ptr %data, ptr %data.addr, align 8, !tbaa !39
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
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z28__device_stub__reduce_kerneliiPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z27__device_stub__covar_kerneliiPfS_(i32 noundef %m, i32 noundef %n, ptr noundef %symmat, ptr noundef %data) #9 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %symmat.addr = alloca ptr, align 8
  %data.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %m, ptr %m.addr, align 4, !tbaa !38
  store i32 %n, ptr %n.addr, align 4, !tbaa !38
  store ptr %symmat, ptr %symmat.addr, align 8, !tbaa !39
  store ptr %data, ptr %data.addr, align 8, !tbaa !39
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
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__covar_kerneliiPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z14covarianceCudaiiPA2048_fS0_PfS0_(i32 noundef %m, i32 noundef %n, ptr noundef %data, ptr noundef %symmat, ptr noundef %mean, ptr noundef %symmat_outputFromGpu) local_unnamed_addr #7 {
entry:
  %Tp.i.i87 = alloca %struct.timeval, align 8
  %m.addr.i72 = alloca i32, align 4
  %n.addr.i73 = alloca i32, align 4
  %symmat.addr.i = alloca ptr, align 8
  %data.addr.i74 = alloca ptr, align 8
  %grid_dim.i75 = alloca %struct.dim3, align 8
  %block_dim.i76 = alloca %struct.dim3, align 8
  %shmem_size.i77 = alloca i64, align 8
  %stream.i78 = alloca ptr, align 8
  %kernel_args1.i79 = alloca [4 x ptr], align 16
  %m.addr.i56 = alloca i32, align 4
  %n.addr.i57 = alloca i32, align 4
  %mean.addr.i58 = alloca ptr, align 8
  %data.addr.i59 = alloca ptr, align 8
  %grid_dim.i60 = alloca %struct.dim3, align 8
  %block_dim.i61 = alloca %struct.dim3, align 8
  %shmem_size.i62 = alloca i64, align 8
  %stream.i63 = alloca ptr, align 8
  %kernel_args1.i64 = alloca [4 x ptr], align 16
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
  %mean_gpu = alloca ptr, align 8
  %symmat_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %data_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %mean_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %symmat_gpu) #17
  %call = call i32 @cudaMalloc(ptr noundef nonnull %data_gpu, i64 noundef 16777216) #16
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %symmat_gpu, i64 noundef 16777216) #16
  %call2 = call i32 @cudaMalloc(ptr noundef nonnull %mean_gpu, i64 noundef 8192) #16
  %0 = load ptr, ptr %data_gpu, align 8, !tbaa !39
  %call3 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %data, i64 noundef 16777216, i32 noundef 1) #16
  %1 = load ptr, ptr %symmat_gpu, align 8, !tbaa !39
  %call4 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %symmat, i64 noundef 16777216, i32 noundef 1) #16
  %2 = load ptr, ptr %mean_gpu, align 8, !tbaa !39
  %call5 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %mean, i64 noundef 8192, i32 noundef 1) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #17
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #18
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #16
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %3 = load i64, ptr %Tp.i.i, align 8, !tbaa !42
  %conv.i.i = sitofp i64 %3 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %4 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !45
  %conv2.i.i = sitofp i64 %4 to double
  %5 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #17
  store double %5, ptr @polybench_t_start, align 8, !tbaa !46
  %call21 = call i32 @__cudaPushCallConfiguration(i64 4294967304, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool.not = icmp eq i32 %call21, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %6 = load ptr, ptr %mean_gpu, align 8, !tbaa !39
  %7 = load ptr, ptr %data_gpu, align 8, !tbaa !39
  call void @llvm.lifetime.start.p0(ptr nonnull %m.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %mean.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %data.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %m, ptr %m.addr.i, align 4, !tbaa !38
  store i32 %n, ptr %n.addr.i, align 4, !tbaa !38
  store ptr %6, ptr %mean.addr.i, align 8, !tbaa !39
  store ptr %7, ptr %data.addr.i, align 8, !tbaa !39
  store ptr %m.addr.i, ptr %kernel_args1.i, align 16
  %8 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %n.addr.i, ptr %8, align 8
  %9 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %mean.addr.i, ptr %9, align 16
  %10 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %data.addr.i, ptr %10, align 8
  %11 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !48
  %12 = load i64, ptr %shmem_size.i, align 8
  %13 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mean_kerneliiPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %12, ptr noundef %13), !inline_history !48
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
  %call22 = call i32 @cudaThreadSynchronize() #16
  %call25 = call i32 @__cudaPushCallConfiguration(i64 274877907008, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool26.not = icmp eq i32 %call25, 0
  br i1 %tobool26.not, label %kcall.configok27, label %kcall.end28

kcall.configok27:                                 ; preds = %kcall.end
  %14 = load ptr, ptr %mean_gpu, align 8, !tbaa !39
  %15 = load ptr, ptr %data_gpu, align 8, !tbaa !39
  call void @llvm.lifetime.start.p0(ptr nonnull %m.addr.i56)
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i57)
  call void @llvm.lifetime.start.p0(ptr nonnull %mean.addr.i58)
  call void @llvm.lifetime.start.p0(ptr nonnull %data.addr.i59)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i60)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i61)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i62)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i63)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i64)
  store i32 %m, ptr %m.addr.i56, align 4, !tbaa !38
  store i32 %n, ptr %n.addr.i57, align 4, !tbaa !38
  store ptr %14, ptr %mean.addr.i58, align 8, !tbaa !39
  store ptr %15, ptr %data.addr.i59, align 8, !tbaa !39
  store ptr %m.addr.i56, ptr %kernel_args1.i64, align 16
  %16 = getelementptr inbounds nuw i8, ptr %kernel_args1.i64, i64 8
  store ptr %n.addr.i57, ptr %16, align 8
  %17 = getelementptr inbounds nuw i8, ptr %kernel_args1.i64, i64 16
  store ptr %mean.addr.i58, ptr %17, align 16
  %18 = getelementptr inbounds nuw i8, ptr %kernel_args1.i64, i64 24
  store ptr %data.addr.i59, ptr %18, align 8
  %19 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i60, ptr nonnull %block_dim.i61, ptr nonnull %shmem_size.i62, ptr nonnull %stream.i63), !inline_history !49
  %20 = load i64, ptr %shmem_size.i62, align 8
  %21 = load ptr, ptr %stream.i63, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i65 = load i64, ptr %grid_dim.i60, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i66 = getelementptr inbounds nuw i8, ptr %grid_dim.i60, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i67 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i66, align 8
  %block_dim.coerce.sroa.0.0.copyload.i68 = load i64, ptr %block_dim.i61, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i69 = getelementptr inbounds nuw i8, ptr %block_dim.i61, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i70 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i69, align 8
  %call.i71 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z28__device_stub__reduce_kerneliiPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload.i65, i32 %grid_dim.coerce.sroa.2.0.copyload.i67, i64 %block_dim.coerce.sroa.0.0.copyload.i68, i32 %block_dim.coerce.sroa.2.0.copyload.i70, ptr noundef nonnull %kernel_args1.i64, i64 noundef %20, ptr noundef %21), !inline_history !49
  call void @llvm.lifetime.end.p0(ptr nonnull %m.addr.i56)
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i57)
  call void @llvm.lifetime.end.p0(ptr nonnull %mean.addr.i58)
  call void @llvm.lifetime.end.p0(ptr nonnull %data.addr.i59)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i60)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i61)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i62)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i63)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i64)
  br label %kcall.end28

kcall.end28:                                      ; preds = %kcall.configok27, %kcall.end
  %call29 = call i32 @cudaThreadSynchronize() #16
  %call32 = call i32 @__cudaPushCallConfiguration(i64 4294967304, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool33.not = icmp eq i32 %call32, 0
  br i1 %tobool33.not, label %kcall.configok34, label %kcall.end35

kcall.configok34:                                 ; preds = %kcall.end28
  %22 = load ptr, ptr %symmat_gpu, align 8, !tbaa !39
  %23 = load ptr, ptr %data_gpu, align 8, !tbaa !39
  call void @llvm.lifetime.start.p0(ptr nonnull %m.addr.i72)
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i73)
  call void @llvm.lifetime.start.p0(ptr nonnull %symmat.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %data.addr.i74)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i75)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i76)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i77)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i78)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i79)
  store i32 %m, ptr %m.addr.i72, align 4, !tbaa !38
  store i32 %n, ptr %n.addr.i73, align 4, !tbaa !38
  store ptr %22, ptr %symmat.addr.i, align 8, !tbaa !39
  store ptr %23, ptr %data.addr.i74, align 8, !tbaa !39
  store ptr %m.addr.i72, ptr %kernel_args1.i79, align 16
  %24 = getelementptr inbounds nuw i8, ptr %kernel_args1.i79, i64 8
  store ptr %n.addr.i73, ptr %24, align 8
  %25 = getelementptr inbounds nuw i8, ptr %kernel_args1.i79, i64 16
  store ptr %symmat.addr.i, ptr %25, align 16
  %26 = getelementptr inbounds nuw i8, ptr %kernel_args1.i79, i64 24
  store ptr %data.addr.i74, ptr %26, align 8
  %27 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i75, ptr nonnull %block_dim.i76, ptr nonnull %shmem_size.i77, ptr nonnull %stream.i78), !inline_history !50
  %28 = load i64, ptr %shmem_size.i77, align 8
  %29 = load ptr, ptr %stream.i78, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i80 = load i64, ptr %grid_dim.i75, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i81 = getelementptr inbounds nuw i8, ptr %grid_dim.i75, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i82 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i81, align 8
  %block_dim.coerce.sroa.0.0.copyload.i83 = load i64, ptr %block_dim.i76, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i84 = getelementptr inbounds nuw i8, ptr %block_dim.i76, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i85 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i84, align 8
  %call.i86 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__covar_kerneliiPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload.i80, i32 %grid_dim.coerce.sroa.2.0.copyload.i82, i64 %block_dim.coerce.sroa.0.0.copyload.i83, i32 %block_dim.coerce.sroa.2.0.copyload.i85, ptr noundef nonnull %kernel_args1.i79, i64 noundef %28, ptr noundef %29), !inline_history !50
  call void @llvm.lifetime.end.p0(ptr nonnull %m.addr.i72)
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i73)
  call void @llvm.lifetime.end.p0(ptr nonnull %symmat.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %data.addr.i74)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i75)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i76)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i77)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i78)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i79)
  br label %kcall.end35

kcall.end35:                                      ; preds = %kcall.configok34, %kcall.end28
  %call36 = call i32 @cudaThreadSynchronize() #16
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i87) #17
  %call.i.i88 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i87, ptr noundef null) #18
  %cmp.not.i.i89 = icmp eq i32 %call.i.i88, 0
  br i1 %cmp.not.i.i89, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i90

if.then.i.i90:                                    ; preds = %kcall.end35
  %call1.i.i91 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i88) #16
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end35, %if.then.i.i90
  %30 = load i64, ptr %Tp.i.i87, align 8, !tbaa !42
  %conv.i.i92 = sitofp i64 %30 to double
  %tv_usec.i.i93 = getelementptr inbounds nuw i8, ptr %Tp.i.i87, i64 8
  %31 = load i64, ptr %tv_usec.i.i93, align 8, !tbaa !45
  %conv2.i.i94 = sitofp i64 %31 to double
  %32 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i94, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i92)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i87) #17
  store double %32, ptr @polybench_t_end, align 8, !tbaa !46
  %33 = load double, ptr @polybench_t_start, align 8, !tbaa !46
  %sub.i = fsub double %32, %33
  %call.i95 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #16
  %34 = load ptr, ptr %symmat_gpu, align 8, !tbaa !39
  %call38 = call i32 @cudaMemcpy(ptr noundef %symmat_outputFromGpu, ptr noundef %34, i64 noundef 16777216, i32 noundef 2) #16
  %35 = load ptr, ptr %data_gpu, align 8, !tbaa !39
  %call39 = call i32 @cudaFree(ptr noundef %35) #16
  %36 = load ptr, ptr %symmat_gpu, align 8, !tbaa !39
  %call40 = call i32 @cudaFree(ptr noundef %36) #16
  %37 = load ptr, ptr %mean_gpu, align 8, !tbaa !39
  %call41 = call i32 @cudaFree(ptr noundef %37) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %symmat_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %mean_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %data_gpu) #17
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #8

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #5 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #17
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #18
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #16
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !42
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !45
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #17
  store double %2, ptr @polybench_t_start, align 8, !tbaa !46
  ret void
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #8

declare i32 @cudaThreadSynchronize() local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #5 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #17
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #18
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #16
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !42
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !45
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #17
  store double %2, ptr @polybench_t_end, align 8, !tbaa !46
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !46
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !46
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #16
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #9 {
entry:
  %Tp.i.i56 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i44 = alloca ptr, align 8
  %newA.i.i37 = alloca ptr, align 8
  %newA.i.i30 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #17
  store ptr null, ptr %newA.i.i, align 8, !tbaa !51
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 16777216) #18
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !51
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !52
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i30) #17
  store ptr null, ptr %newA.i.i30, align 8, !tbaa !51
  %call.i.i31 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i30, i64 noundef 32, i64 noundef 16777216) #18
  %3 = load ptr, ptr %newA.i.i30, align 8, !tbaa !51
  %tobool.i.i32 = icmp eq ptr %3, null
  %tobool1.i.i33 = icmp ne i32 %call.i.i31, 0
  %or.cond.i.i34 = select i1 %tobool.i.i32, i1 true, i1 %tobool1.i.i33
  br i1 %or.cond.i.i34, label %if.then.i.i35, label %_Z20polybench_alloc_datayi.exit36

if.then.i.i35:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !52
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit36:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i30) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i37) #17
  store ptr null, ptr %newA.i.i37, align 8, !tbaa !51
  %call.i.i38 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i37, i64 noundef 32, i64 noundef 8192) #18
  %6 = load ptr, ptr %newA.i.i37, align 8, !tbaa !51
  %tobool.i.i39 = icmp eq ptr %6, null
  %tobool1.i.i40 = icmp ne i32 %call.i.i38, 0
  %or.cond.i.i41 = select i1 %tobool.i.i39, i1 true, i1 %tobool1.i.i40
  br i1 %or.cond.i.i41, label %if.then.i.i42, label %_Z20polybench_alloc_datayi.exit43

if.then.i.i42:                                    ; preds = %_Z20polybench_alloc_datayi.exit36
  %7 = load ptr, ptr @stderr, align 8, !tbaa !52
  %8 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %7) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit43:                ; preds = %_Z20polybench_alloc_datayi.exit36
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i37) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i44) #17
  store ptr null, ptr %newA.i.i44, align 8, !tbaa !51
  %call.i.i45 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i44, i64 noundef 32, i64 noundef 16777216) #18
  %9 = load ptr, ptr %newA.i.i44, align 8, !tbaa !51
  %tobool.i.i46 = icmp eq ptr %9, null
  %tobool1.i.i47 = icmp ne i32 %call.i.i45, 0
  %or.cond.i.i48 = select i1 %tobool.i.i46, i1 true, i1 %tobool1.i.i47
  br i1 %or.cond.i.i48, label %if.then.i.i49, label %_Z20polybench_alloc_datayi.exit50

if.then.i.i49:                                    ; preds = %_Z20polybench_alloc_datayi.exit43
  %10 = load ptr, ptr @stderr, align 8, !tbaa !52
  %11 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %10) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit50:                ; preds = %_Z20polybench_alloc_datayi.exit43
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i44) #17
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc7_crit_edge.i, %_Z20polybench_alloc_datayi.exit50
  %indvars.iv21.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit50 ], [ %indvars.iv.next22.i, %for.cond1.for.inc7_crit_edge.i ]
  %arrayidx.i = getelementptr inbounds nuw [8192 x i8], ptr %0, i64 %indvars.iv21.i
  %12 = trunc nuw nsw i64 %indvars.iv21.i to i32
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
  %17 = fmul nnan <4 x float> %15, splat (float f0x3A000000)
  %18 = fmul nnan <4 x float> %16, splat (float f0x3A000000)
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
  %25 = fmul nnan <4 x float> %23, splat (float f0x3A000000)
  %26 = fmul nnan <4 x float> %24, splat (float f0x3A000000)
  %27 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %28 = getelementptr inbounds nuw i8, ptr %27, i64 32
  %29 = getelementptr inbounds nuw i8, ptr %27, i64 48
  store <4 x float> %25, ptr %28, align 4, !tbaa !10
  store <4 x float> %26, ptr %29, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %30 = icmp eq i64 %index.next.1, 2048
  br i1 %30, label %for.cond1.for.inc7_crit_edge.i, label %vector.body, !llvm.loop !54

for.cond1.for.inc7_crit_edge.i:                   ; preds = %vector.body
  %indvars.iv.next22.i = add nuw nsw i64 %indvars.iv21.i, 1
  %exitcond25.not.i = icmp eq i64 %indvars.iv.next22.i, 2048
  br i1 %exitcond25.not.i, label %_Z11init_arraysiiPA2048_f.exit, label %for.cond1.preheader.i, !llvm.loop !17

_Z11init_arraysiiPA2048_f.exit:                   ; preds = %for.cond1.for.inc7_crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #17
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #16
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #16
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #17
  call void @_Z14covarianceCudaiiPA2048_fS0_PfS0_(i32 noundef 2048, i32 noundef 2048, ptr noundef nonnull %0, ptr noundef nonnull %3, ptr noundef nonnull %6, ptr noundef nonnull %9) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #17
  %call.i.i51 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #18
  %cmp.not.i.i = icmp eq i32 %call.i.i51, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i52

if.then.i.i52:                                    ; preds = %_Z11init_arraysiiPA2048_f.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i51) #16
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z11init_arraysiiPA2048_f.exit, %if.then.i.i52
  %31 = load i64, ptr %Tp.i.i, align 8, !tbaa !42
  %conv.i.i = sitofp i64 %31 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %32 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !45
  %conv2.i.i = sitofp i64 %32 to double
  %33 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #17
  store double %33, ptr @polybench_t_start, align 8, !tbaa !46
  br label %for.body.us.i

for.body.us.i:                                    ; preds = %for.cond1.for.end_crit_edge.us.i, %_Z21polybench_timer_startv.exit
  %indvars.iv140.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next141.i, %for.cond1.for.end_crit_edge.us.i ]
  %arrayidx.us.i = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv140.i
  store float 0.000000e+00, ptr %arrayidx.us.i, align 4, !tbaa !10
  %invariant.gep.us.i = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv140.i
  br label %for.body3.us.i

for.body3.us.i:                                   ; preds = %for.body3.us.i, %for.body.us.i
  %indvars.iv.i53 = phi i64 [ 0, %for.body.us.i ], [ %indvars.iv.next.i54.3, %for.body3.us.i ]
  %34 = phi float [ 0.000000e+00, %for.body.us.i ], [ %add.us.i.3, %for.body3.us.i ]
  %gep.us.i = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us.i, i64 %indvars.iv.i53
  %35 = load float, ptr %gep.us.i, align 4, !tbaa !10
  %add.us.i = fadd float %34, %35
  store float %add.us.i, ptr %arrayidx.us.i, align 4, !tbaa !10
  %36 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us.i, i64 %indvars.iv.i53
  %gep.us.i.1 = getelementptr inbounds nuw i8, ptr %36, i64 8192
  %37 = load float, ptr %gep.us.i.1, align 4, !tbaa !10
  %add.us.i.1 = fadd float %add.us.i, %37
  store float %add.us.i.1, ptr %arrayidx.us.i, align 4, !tbaa !10
  %38 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us.i, i64 %indvars.iv.i53
  %gep.us.i.2 = getelementptr inbounds nuw i8, ptr %38, i64 16384
  %39 = load float, ptr %gep.us.i.2, align 4, !tbaa !10
  %add.us.i.2 = fadd float %add.us.i.1, %39
  store float %add.us.i.2, ptr %arrayidx.us.i, align 4, !tbaa !10
  %40 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us.i, i64 %indvars.iv.i53
  %gep.us.i.3 = getelementptr inbounds nuw i8, ptr %40, i64 24576
  %41 = load float, ptr %gep.us.i.3, align 4, !tbaa !10
  %add.us.i.3 = fadd float %add.us.i.2, %41
  store float %add.us.i.3, ptr %arrayidx.us.i, align 4, !tbaa !10
  %indvars.iv.next.i54.3 = add nuw nsw i64 %indvars.iv.i53, 4
  %exitcond.not.i55.3 = icmp eq i64 %indvars.iv.next.i54.3, 2048
  br i1 %exitcond.not.i55.3, label %for.cond1.for.end_crit_edge.us.i, label %for.body3.us.i, !llvm.loop !18

for.cond1.for.end_crit_edge.us.i:                 ; preds = %for.body3.us.i
  %conv.us.i = fpext float %add.us.i.3 to double
  %div.us.i = fdiv double %conv.us.i, f0x414885C20147AE14
  %conv12.us.i = fptrunc double %div.us.i to float
  store float %conv12.us.i, ptr %arrayidx.us.i, align 4, !tbaa !10
  %indvars.iv.next141.i = add nuw nsw i64 %indvars.iv140.i, 1
  %exitcond144.not.i = icmp eq i64 %indvars.iv.next141.i, 2048
  br i1 %exitcond144.not.i, label %for.cond19.preheader.i.preheader, label %for.body.us.i, !llvm.loop !21

for.cond19.preheader.i.preheader:                 ; preds = %for.cond1.for.end_crit_edge.us.i
  %scevgep = getelementptr i8, ptr %0, i64 16777216
  %scevgep75 = getelementptr i8, ptr %6, i64 8192
  %bound0 = icmp ult ptr %0, %scevgep75
  %bound1 = icmp ult ptr %6, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  br label %for.cond19.preheader.i

for.cond19.preheader.i:                           ; preds = %for.cond19.preheader.i.preheader, %for.cond19.for.inc31_crit_edge.i
  %indvars.iv150.i = phi i64 [ %indvars.iv.next151.i, %for.cond19.for.inc31_crit_edge.i ], [ 0, %for.cond19.preheader.i.preheader ]
  %arrayidx25.i = getelementptr inbounds nuw [8192 x i8], ptr %0, i64 %indvars.iv150.i
  br i1 %found.conflict, label %for.body21.i, label %vector.body77

vector.body77:                                    ; preds = %for.cond19.preheader.i, %vector.body77
  %index78 = phi i64 [ %index.next82.1, %vector.body77 ], [ 0, %for.cond19.preheader.i ]
  %42 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %index78
  %43 = getelementptr inbounds nuw i8, ptr %42, i64 16
  %wide.load = load <4 x float>, ptr %42, align 4, !tbaa !10, !alias.scope !55
  %wide.load79 = load <4 x float>, ptr %43, align 4, !tbaa !10, !alias.scope !55
  %44 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.i, i64 %index78
  %45 = getelementptr inbounds nuw i8, ptr %44, i64 16
  %wide.load80 = load <4 x float>, ptr %44, align 4, !tbaa !10, !alias.scope !58, !noalias !55
  %wide.load81 = load <4 x float>, ptr %45, align 4, !tbaa !10, !alias.scope !58, !noalias !55
  %46 = fsub <4 x float> %wide.load80, %wide.load
  %47 = fsub <4 x float> %wide.load81, %wide.load79
  store <4 x float> %46, ptr %44, align 4, !tbaa !10, !alias.scope !58, !noalias !55
  store <4 x float> %47, ptr %45, align 4, !tbaa !10, !alias.scope !58, !noalias !55
  %index.next82 = or disjoint i64 %index78, 8
  %48 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %index.next82
  %49 = getelementptr inbounds nuw i8, ptr %48, i64 16
  %wide.load.1 = load <4 x float>, ptr %48, align 4, !tbaa !10, !alias.scope !55
  %wide.load79.1 = load <4 x float>, ptr %49, align 4, !tbaa !10, !alias.scope !55
  %50 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.i, i64 %index.next82
  %51 = getelementptr inbounds nuw i8, ptr %50, i64 16
  %wide.load80.1 = load <4 x float>, ptr %50, align 4, !tbaa !10, !alias.scope !58, !noalias !55
  %wide.load81.1 = load <4 x float>, ptr %51, align 4, !tbaa !10, !alias.scope !58, !noalias !55
  %52 = fsub <4 x float> %wide.load80.1, %wide.load.1
  %53 = fsub <4 x float> %wide.load81.1, %wide.load79.1
  store <4 x float> %52, ptr %50, align 4, !tbaa !10, !alias.scope !58, !noalias !55
  store <4 x float> %53, ptr %51, align 4, !tbaa !10, !alias.scope !58, !noalias !55
  %index.next82.1 = add nuw nsw i64 %index78, 16
  %54 = icmp eq i64 %index.next82.1, 2048
  br i1 %54, label %for.cond19.for.inc31_crit_edge.i, label %vector.body77, !llvm.loop !60

for.cond37.preheader.us.i:                        ; preds = %for.cond19.for.inc31_crit_edge.i, %for.inc73.split.us.us.i
  %indvars.iv171.i = phi i64 [ %indvars.iv.next172.i, %for.inc73.split.us.us.i ], [ 0, %for.cond19.for.inc31_crit_edge.i ]
  %arrayidx41.us.i = getelementptr inbounds nuw [8192 x i8], ptr %3, i64 %indvars.iv171.i
  %invariant.gep.us135.i = getelementptr inbounds nuw [4 x i8], ptr %3, i64 %indvars.iv171.i
  br label %for.body39.us.us.i

for.body39.us.us.i:                               ; preds = %for.cond44.for.end61_crit_edge.us.us.i, %for.cond37.preheader.us.i
  %indvars.iv173.i = phi i64 [ %indvars.iv.next174.i, %for.cond44.for.end61_crit_edge.us.us.i ], [ %indvars.iv171.i, %for.cond37.preheader.us.i ]
  %arrayidx43.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx41.us.i, i64 %indvars.iv173.i
  store float 0.000000e+00, ptr %arrayidx43.us.us.i, align 4, !tbaa !10
  br label %for.body46.us.us.i

for.body46.us.us.i:                               ; preds = %for.body46.us.us.i, %for.body39.us.us.i
  %indvars.iv163.i = phi i64 [ 0, %for.body39.us.us.i ], [ %indvars.iv.next164.i.1, %for.body46.us.us.i ]
  %55 = phi float [ 0.000000e+00, %for.body39.us.us.i ], [ %62, %for.body46.us.us.i ]
  %arrayidx48.us.us.i = getelementptr inbounds nuw [8192 x i8], ptr %0, i64 %indvars.iv163.i
  %arrayidx50.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx48.us.us.i, i64 %indvars.iv171.i
  %56 = load float, ptr %arrayidx50.us.us.i, align 4, !tbaa !10
  %arrayidx54.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx48.us.us.i, i64 %indvars.iv173.i
  %57 = load float, ptr %arrayidx54.us.us.i, align 4, !tbaa !10
  %58 = call float @llvm.fmuladd.f32(float %56, float %57, float %55)
  store float %58, ptr %arrayidx43.us.us.i, align 4, !tbaa !10
  %59 = getelementptr inbounds nuw [8192 x i8], ptr %0, i64 %indvars.iv163.i
  %arrayidx48.us.us.i.1 = getelementptr inbounds nuw i8, ptr %59, i64 8192
  %arrayidx50.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx48.us.us.i.1, i64 %indvars.iv171.i
  %60 = load float, ptr %arrayidx50.us.us.i.1, align 4, !tbaa !10
  %arrayidx54.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx48.us.us.i.1, i64 %indvars.iv173.i
  %61 = load float, ptr %arrayidx54.us.us.i.1, align 4, !tbaa !10
  %62 = call float @llvm.fmuladd.f32(float %60, float %61, float %58)
  store float %62, ptr %arrayidx43.us.us.i, align 4, !tbaa !10
  %indvars.iv.next164.i.1 = add nuw nsw i64 %indvars.iv163.i, 2
  %exitcond167.not.i.1 = icmp eq i64 %indvars.iv.next164.i.1, 2048
  br i1 %exitcond167.not.i.1, label %for.cond44.for.end61_crit_edge.us.us.i, label %for.body46.us.us.i, !llvm.loop !29

for.cond44.for.end61_crit_edge.us.us.i:           ; preds = %for.body46.us.us.i
  %gep.us132.us.i = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.us135.i, i64 %indvars.iv173.i
  store float %62, ptr %gep.us132.us.i, align 4, !tbaa !10
  %indvars.iv.next174.i = add nuw nsw i64 %indvars.iv173.i, 1
  %exitcond177.not.i = icmp eq i64 %indvars.iv.next174.i, 2048
  br i1 %exitcond177.not.i, label %for.inc73.split.us.us.i, label %for.body39.us.us.i, !llvm.loop !30

for.inc73.split.us.us.i:                          ; preds = %for.cond44.for.end61_crit_edge.us.us.i
  %indvars.iv.next172.i = add nuw nsw i64 %indvars.iv171.i, 1
  %exitcond180.not.i = icmp eq i64 %indvars.iv.next172.i, 2048
  br i1 %exitcond180.not.i, label %_Z10covarianceiiPA2048_fS0_Pf.exit, label %for.cond37.preheader.us.i, !llvm.loop !31

for.body21.i:                                     ; preds = %for.cond19.preheader.i, %for.body21.i
  %indvars.iv145.i = phi i64 [ %indvars.iv.next146.i.3, %for.body21.i ], [ 0, %for.cond19.preheader.i ]
  %arrayidx23.i = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv145.i
  %63 = load float, ptr %arrayidx23.i, align 4, !tbaa !10
  %arrayidx27.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.i, i64 %indvars.iv145.i
  %64 = load float, ptr %arrayidx27.i, align 4, !tbaa !10
  %sub.i = fsub float %64, %63
  store float %sub.i, ptr %arrayidx27.i, align 4, !tbaa !10
  %indvars.iv.next146.i = or disjoint i64 %indvars.iv145.i, 1
  %arrayidx23.i.1 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv.next146.i
  %65 = load float, ptr %arrayidx23.i.1, align 4, !tbaa !10
  %arrayidx27.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.i, i64 %indvars.iv.next146.i
  %66 = load float, ptr %arrayidx27.i.1, align 4, !tbaa !10
  %sub.i.1 = fsub float %66, %65
  store float %sub.i.1, ptr %arrayidx27.i.1, align 4, !tbaa !10
  %indvars.iv.next146.i.1 = or disjoint i64 %indvars.iv145.i, 2
  %arrayidx23.i.2 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv.next146.i.1
  %67 = load float, ptr %arrayidx23.i.2, align 4, !tbaa !10
  %arrayidx27.i.2 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.i, i64 %indvars.iv.next146.i.1
  %68 = load float, ptr %arrayidx27.i.2, align 4, !tbaa !10
  %sub.i.2 = fsub float %68, %67
  store float %sub.i.2, ptr %arrayidx27.i.2, align 4, !tbaa !10
  %indvars.iv.next146.i.2 = or disjoint i64 %indvars.iv145.i, 3
  %arrayidx23.i.3 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv.next146.i.2
  %69 = load float, ptr %arrayidx23.i.3, align 4, !tbaa !10
  %arrayidx27.i.3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx25.i, i64 %indvars.iv.next146.i.2
  %70 = load float, ptr %arrayidx27.i.3, align 4, !tbaa !10
  %sub.i.3 = fsub float %70, %69
  store float %sub.i.3, ptr %arrayidx27.i.3, align 4, !tbaa !10
  %indvars.iv.next146.i.3 = add nuw nsw i64 %indvars.iv145.i, 4
  %exitcond149.not.i.3 = icmp eq i64 %indvars.iv.next146.i.3, 2048
  br i1 %exitcond149.not.i.3, label %for.cond19.for.inc31_crit_edge.i, label %for.body21.i, !llvm.loop !61

for.cond19.for.inc31_crit_edge.i:                 ; preds = %vector.body77, %for.body21.i
  %indvars.iv.next151.i = add nuw nsw i64 %indvars.iv150.i, 1
  %exitcond154.not.i = icmp eq i64 %indvars.iv.next151.i, 2048
  br i1 %exitcond154.not.i, label %for.cond37.preheader.us.i, label %for.cond19.preheader.i, !llvm.loop !33

_Z10covarianceiiPA2048_fS0_Pf.exit:               ; preds = %for.inc73.split.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i56) #17
  %call.i.i57 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i56, ptr noundef null) #18
  %cmp.not.i.i58 = icmp eq i32 %call.i.i57, 0
  br i1 %cmp.not.i.i58, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i59

if.then.i.i59:                                    ; preds = %_Z10covarianceiiPA2048_fS0_Pf.exit
  %call1.i.i60 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i57) #16
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z10covarianceiiPA2048_fS0_Pf.exit, %if.then.i.i59
  %71 = load i64, ptr %Tp.i.i56, align 8, !tbaa !42
  %conv.i.i61 = sitofp i64 %71 to double
  %tv_usec.i.i62 = getelementptr inbounds nuw i8, ptr %Tp.i.i56, i64 8
  %72 = load i64, ptr %tv_usec.i.i62, align 8, !tbaa !45
  %conv2.i.i63 = sitofp i64 %72 to double
  %73 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i63, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i61)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i56) #17
  store double %73, ptr @polybench_t_end, align 8, !tbaa !46
  %74 = load double, ptr @polybench_t_start, align 8, !tbaa !46
  %sub.i64 = fsub double %73, %74
  %call.i65 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i64) #16
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc14_crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv34.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next35.i, %for.cond1.for.inc14_crit_edge.us.i ]
  %fail.030.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %109, %for.cond1.for.inc14_crit_edge.us.i ]
  %arrayidx.us.i66 = getelementptr inbounds nuw [8192 x i8], ptr %3, i64 %indvars.iv34.i
  %arrayidx7.us.i = getelementptr inbounds nuw [8192 x i8], ptr %9, i64 %indvars.iv34.i
  %75 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.030.us.i, i64 0
  br label %vector.body86

vector.body86:                                    ; preds = %vector.body86, %for.cond1.preheader.us.i
  %index87 = phi i64 [ 0, %for.cond1.preheader.us.i ], [ %index.next90, %vector.body86 ]
  %vec.phi = phi <4 x i32> [ %75, %for.cond1.preheader.us.i ], [ %107, %vector.body86 ]
  %76 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i66, i64 %index87
  %wide.load88 = load <4 x float>, ptr %76, align 4, !tbaa !10
  %77 = fpext <4 x float> %wide.load88 to <4 x double>
  %78 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us.i, i64 %index87
  %wide.load89 = load <4 x float>, ptr %78, align 4, !tbaa !10
  %79 = fpext <4 x float> %wide.load89 to <4 x double>
  %80 = fcmp olt <4 x double> %77, splat (double f0xB690000000000000)
  %81 = fneg <4 x float> %wide.load88
  %82 = select <4 x i1> %80, <4 x float> %81, <4 x float> %wide.load88
  %83 = fpext <4 x float> %82 to <4 x double>
  %84 = fcmp uge <4 x double> %83, splat (double 1.000000e-02)
  %85 = fcmp olt <4 x double> %79, splat (double f0xB690000000000000)
  %86 = fneg <4 x float> %wide.load89
  %87 = select <4 x i1> %85, <4 x float> %86, <4 x float> %wide.load89
  %88 = fpext <4 x float> %87 to <4 x double>
  %89 = fcmp uge <4 x double> %88, splat (double 1.000000e-02)
  %90 = fsub <4 x double> %77, %79
  %91 = fptrunc <4 x double> %90 to <4 x float>
  %92 = fcmp olt <4 x double> %90, splat (double f0xB690000000000000)
  %93 = fneg <4 x float> %91
  %94 = select <4 x i1> %92, <4 x float> %93, <4 x float> %91
  %95 = fadd <4 x double> %77, splat (double f0x3E45798EE0000000)
  %96 = fptrunc <4 x double> %95 to <4 x float>
  %97 = fcmp olt <4 x double> %95, splat (double f0xB690000000000000)
  %98 = fneg <4 x float> %96
  %99 = select <4 x i1> %97, <4 x float> %98, <4 x float> %96
  %100 = fdiv <4 x float> %94, %99
  %101 = fcmp olt <4 x float> %100, zeroinitializer
  %102 = fneg <4 x float> %100
  %103 = select <4 x i1> %101, <4 x float> %102, <4 x float> %100
  %104 = fmul <4 x float> %103, splat (float 1.000000e+02)
  %105 = fpext <4 x float> %104 to <4 x double>
  %106 = fcmp ogt <4 x double> %105, splat (double 1.050000e+00)
  %.not93 = select <4 x i1> %84, <4 x i1> splat (i1 true), <4 x i1> %89
  %narrow = select <4 x i1> %.not93, <4 x i1> %106, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %107 = add <4 x i32> %vec.phi, %predphi
  %index.next90 = add nuw i64 %index87, 4
  %108 = icmp eq i64 %index.next90, 2048
  br i1 %108, label %for.cond1.for.inc14_crit_edge.us.i, label %vector.body86, !llvm.loop !62

for.cond1.for.inc14_crit_edge.us.i:               ; preds = %vector.body86
  %109 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %107)
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond38.not.i = icmp eq i64 %indvars.iv.next35.i, 2048
  br i1 %exitcond38.not.i, label %_Z14compareResultsiiPA2048_fS0_.exit, label %for.cond1.preheader.us.i, !llvm.loop !37

_Z14compareResultsiiPA2048_fS0_.exit:             ; preds = %for.cond1.for.inc14_crit_edge.us.i
  %call17.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 1.050000e+00, i32 noundef %109) #16
  call void @free(ptr noundef %0) #18
  call void @free(ptr noundef nonnull %3) #18
  call void @free(ptr noundef %6) #18
  call void @free(ptr noundef nonnull %9) #18
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #17
  store ptr null, ptr %newA.i, align 8, !tbaa !51
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #18
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !51
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !52
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_ZL7xmallocm.exit:                                ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i) #17
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

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #13

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #14

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #15

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
attributes #13 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #14 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #15 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #16 = { "uniform-work-group-size" }
attributes #17 = { nounwind }
attributes #18 = { nounwind "uniform-work-group-size" }
attributes #19 = { cold }
attributes #20 = { cold noreturn nounwind "uniform-work-group-size" }

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
!22 = !{!23}
!23 = distinct !{!23, !24}
!24 = distinct !{!24, !"LVerDomain"}
!25 = !{!26}
!26 = distinct !{!26, !24}
!27 = distinct !{!27, !13, !14, !15}
!28 = distinct !{!28, !20}
!29 = distinct !{!29, !13}
!30 = distinct !{!30, !13}
!31 = distinct !{!31, !13}
!32 = distinct !{!32, !13, !14}
!33 = distinct !{!33, !13}
!34 = distinct !{!34, !20}
!35 = distinct !{!35, !13, !14, !15}
!36 = distinct !{!36, !13, !15, !14}
!37 = distinct !{!37, !13}
!38 = !{!7, !7, i64 0}
!39 = !{!40, !40, i64 0}
!40 = !{!"p1 float", !41, i64 0}
!41 = !{!"any pointer", !8, i64 0}
!42 = !{!43, !44, i64 0}
!43 = !{!"_ZTS7timeval", !44, i64 0, !44, i64 8}
!44 = !{!"long", !8, i64 0}
!45 = !{!43, !44, i64 8}
!46 = !{!47, !47, i64 0}
!47 = !{!"double", !8, i64 0}
!48 = !{ptr @_Z26__device_stub__mean_kerneliiPfS_}
!49 = !{ptr @_Z28__device_stub__reduce_kerneliiPfS_}
!50 = !{ptr @_Z27__device_stub__covar_kerneliiPfS_}
!51 = !{!41, !41, i64 0}
!52 = !{!53, !53, i64 0}
!53 = !{!"p1 _ZTS8_IO_FILE", !41, i64 0}
!54 = distinct !{!54, !13, !14, !15}
!55 = !{!56}
!56 = distinct !{!56, !57}
!57 = distinct !{!57, !"LVerDomain"}
!58 = !{!59}
!59 = distinct !{!59, !57}
!60 = distinct !{!60, !13, !14, !15}
!61 = distinct !{!61, !13, !14}
!62 = distinct !{!62, !13, !14, !15}
