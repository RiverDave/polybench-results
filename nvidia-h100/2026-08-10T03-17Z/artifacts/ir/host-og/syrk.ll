; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/SYRK/syrk.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/SYRK/syrk.cu"
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
define dso_local void @_Z11init_arraysiiPfS_PA1024_fS1_(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %alpha, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %beta, ptr nofree noundef writeonly captures(none) %C, ptr nofree noundef writeonly captures(none) %A) local_unnamed_addr #1 {
entry:
  store float 3.241200e+04, ptr %alpha, align 4, !tbaa !10
  store float 2.123000e+03, ptr %beta, align 4, !tbaa !10
  %cmp52 = icmp sgt i32 %ni, 0
  br i1 %cmp52, label %for.cond1.preheader.lr.ph, label %for.end31

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp250 = icmp sgt i32 %nj, 0
  %conv5 = uitofp nneg i32 %ni to float
  br i1 %cmp250, label %for.cond1.preheader.preheader, label %for.cond14.preheader.lr.ph

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count62 = zext nneg i32 %ni to i64
  %wide.trip.count = zext nneg i32 %nj to i64
  %min.iters.check = icmp ult i32 %nj, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %broadcast.splatinsert75 = insertelement <4 x float> poison, float %conv5, i64 0
  %broadcast.splat76 = shufflevector <4 x float> %broadcast.splatinsert75, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc8_crit_edge
  %indvars.iv59 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next60, %for.cond1.for.inc8_crit_edge ]
  %0 = trunc nuw nsw i64 %indvars.iv59 to i32
  %conv = uitofp nneg i32 %0 to float
  %arrayidx = getelementptr inbounds nuw [4096 x i8], ptr %A, i64 %indvars.iv59
  br i1 %min.iters.check, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %1 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %2 = fmul nnan <4 x float> %broadcast.splat, %1
  %3 = fdiv <4 x float> %2, %broadcast.splat76
  %4 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  store <4 x float> %3, ptr %4, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %5 = icmp eq i64 %index.next, %n.vec
  br i1 %5, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc8_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader ], [ %n.vec, %middle.block ]
  br label %for.body3

for.cond14.preheader.lr.ph:                       ; preds = %for.cond1.for.inc8_crit_edge, %for.cond1.preheader.lr.ph
  %conv20 = uitofp nneg i32 %ni to float
  %wide.trip.count72 = zext nneg i32 %ni to i64
  %min.iters.check78 = icmp ult i32 %ni, 4
  %n.vec81 = and i64 %wide.trip.count72, 2147483644
  %broadcast.splatinsert84 = insertelement <4 x float> poison, float %conv20, i64 0
  %broadcast.splat85 = shufflevector <4 x float> %broadcast.splatinsert84, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n92 = icmp eq i64 %n.vec81, %wide.trip.count72
  br label %for.cond14.preheader

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %6 = trunc nuw nsw i64 %indvars.iv to i32
  %conv4 = uitofp nneg i32 %6 to float
  %mul = fmul nnan float %conv, %conv4
  %div = fdiv float %mul, %conv5
  %arrayidx7 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  store float %div, ptr %arrayidx7, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc8_crit_edge, label %for.body3, !llvm.loop !16

for.cond1.for.inc8_crit_edge:                     ; preds = %for.body3, %middle.block
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond63.not = icmp eq i64 %indvars.iv.next60, %wide.trip.count62
  br i1 %exitcond63.not, label %for.cond14.preheader.lr.ph, label %for.cond1.preheader, !llvm.loop !17

for.cond14.preheader:                             ; preds = %for.cond14.preheader.lr.ph, %for.cond14.for.inc29_crit_edge
  %indvars.iv69 = phi i64 [ 0, %for.cond14.preheader.lr.ph ], [ %indvars.iv.next70, %for.cond14.for.inc29_crit_edge ]
  %7 = trunc nuw nsw i64 %indvars.iv69 to i32
  %conv17 = uitofp nneg i32 %7 to float
  %arrayidx23 = getelementptr inbounds nuw [4096 x i8], ptr %C, i64 %indvars.iv69
  br i1 %min.iters.check78, label %for.body16.preheader, label %vector.ph79

vector.ph79:                                      ; preds = %for.cond14.preheader
  %broadcast.splatinsert82 = insertelement <4 x float> poison, float %conv17, i64 0
  %broadcast.splat83 = shufflevector <4 x float> %broadcast.splatinsert82, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body86

vector.body86:                                    ; preds = %vector.body86, %vector.ph79
  %index87 = phi i64 [ 0, %vector.ph79 ], [ %index.next89, %vector.body86 ]
  %vec.ind88 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph79 ], [ %vec.ind.next90, %vector.body86 ]
  %8 = uitofp nneg <4 x i32> %vec.ind88 to <4 x float>
  %9 = fmul nnan <4 x float> %broadcast.splat83, %8
  %10 = fdiv <4 x float> %9, %broadcast.splat85
  %11 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx23, i64 %index87
  store <4 x float> %10, ptr %11, align 4, !tbaa !10
  %index.next89 = add nuw i64 %index87, 4
  %vec.ind.next90 = add <4 x i32> %vec.ind88, splat (i32 4)
  %12 = icmp eq i64 %index.next89, %n.vec81
  br i1 %12, label %middle.block91, label %vector.body86, !llvm.loop !18

middle.block91:                                   ; preds = %vector.body86
  br i1 %cmp.n92, label %for.cond14.for.inc29_crit_edge, label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.cond14.preheader, %middle.block91
  %indvars.iv64.ph = phi i64 [ 0, %for.cond14.preheader ], [ %n.vec81, %middle.block91 ]
  br label %for.body16

for.body16:                                       ; preds = %for.body16.preheader, %for.body16
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.body16 ], [ %indvars.iv64.ph, %for.body16.preheader ]
  %13 = trunc nuw nsw i64 %indvars.iv64 to i32
  %conv18 = uitofp nneg i32 %13 to float
  %mul19 = fmul nnan float %conv17, %conv18
  %div21 = fdiv float %mul19, %conv20
  %arrayidx25 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx23, i64 %indvars.iv64
  store float %div21, ptr %arrayidx25, align 4, !tbaa !10
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond68.not = icmp eq i64 %indvars.iv.next65, %wide.trip.count72
  br i1 %exitcond68.not, label %for.cond14.for.inc29_crit_edge, label %for.body16, !llvm.loop !19

for.cond14.for.inc29_crit_edge:                   ; preds = %for.body16, %middle.block91
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond73.not = icmp eq i64 %indvars.iv.next70, %wide.trip.count72
  br i1 %exitcond73.not, label %for.end31, label %for.cond14.preheader, !llvm.loop !20

for.end31:                                        ; preds = %for.cond14.for.inc29_crit_edge, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z4syrkiiffPA1024_fS0_(i32 noundef %ni, i32 noundef %nj, float noundef %alpha, float noundef %beta, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef captures(none) %C) local_unnamed_addr #3 {
entry:
  %cmp63 = icmp sgt i32 %ni, 0
  br i1 %cmp63, label %for.cond1.preheader.preheader, label %for.end40

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count76 = zext nneg i32 %ni to i64
  %min.iters.check = icmp ult i32 %ni, 8
  %n.vec = and i64 %wide.trip.count76, 2147483640
  %broadcast.splatinsert = insertelement <4 x float> poison, float %beta, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count76
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc6_crit_edge
  %indvars.iv73 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next74, %for.cond1.for.inc6_crit_edge ]
  %arrayidx = getelementptr inbounds nuw [4096 x i8], ptr %C, i64 %indvars.iv73
  br i1 %min.iters.check, label %for.body3.preheader, label %vector.body

vector.body:                                      ; preds = %for.cond1.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.cond1.preheader ]
  %0 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  %1 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %wide.load = load <4 x float>, ptr %0, align 4, !tbaa !10
  %wide.load95 = load <4 x float>, ptr %1, align 4, !tbaa !10
  %2 = fmul <4 x float> %broadcast.splat, %wide.load
  %3 = fmul <4 x float> %broadcast.splat, %wide.load95
  store <4 x float> %2, ptr %0, align 4, !tbaa !10
  store <4 x float> %3, ptr %1, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !21

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc6_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader ], [ %n.vec, %middle.block ]
  br label %for.body3

for.cond9.preheader:                              ; preds = %for.cond1.for.inc6_crit_edge
  %cmp1665 = icmp sgt i32 %nj, 0
  br i1 %cmp1665, label %for.cond12.preheader.preheader, label %for.end40

for.cond12.preheader.preheader:                   ; preds = %for.cond9.preheader
  %wide.trip.count91 = zext nneg i32 %ni to i64
  %wide.trip.count81 = zext nneg i32 %nj to i64
  %xtraiter = and i64 %wide.trip.count81, 1
  %5 = icmp eq i32 %nj, 1
  %unroll_iter = and i64 %wide.trip.count81, 2147483646
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod96 = trunc i32 %nj to i1
  br label %for.cond12.preheader

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  %6 = load float, ptr %arrayidx5, align 4, !tbaa !10
  %mul = fmul float %beta, %6
  store float %mul, ptr %arrayidx5, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count76
  br i1 %exitcond.not, label %for.cond1.for.inc6_crit_edge, label %for.body3, !llvm.loop !22

for.cond1.for.inc6_crit_edge:                     ; preds = %for.body3, %middle.block
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond77.not = icmp eq i64 %indvars.iv.next74, %wide.trip.count76
  br i1 %exitcond77.not, label %for.cond9.preheader, label %for.cond1.preheader, !llvm.loop !23

for.cond12.preheader:                             ; preds = %for.cond12.preheader.preheader, %for.cond12.for.inc38_crit_edge
  %indvars.iv88 = phi i64 [ 0, %for.cond12.preheader.preheader ], [ %indvars.iv.next89, %for.cond12.for.inc38_crit_edge ]
  %arrayidx19 = getelementptr inbounds nuw [4096 x i8], ptr %A, i64 %indvars.iv88
  %arrayidx29 = getelementptr inbounds nuw [4096 x i8], ptr %C, i64 %indvars.iv88
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond12.preheader, %for.cond15.for.inc35_crit_edge
  %indvars.iv83 = phi i64 [ 0, %for.cond12.preheader ], [ %indvars.iv.next84, %for.cond15.for.inc35_crit_edge ]
  %arrayidx24 = getelementptr inbounds nuw [4096 x i8], ptr %A, i64 %indvars.iv83
  %arrayidx31 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx29, i64 %indvars.iv83
  %arrayidx31.promoted = load float, ptr %arrayidx31, align 4, !tbaa !10
  br i1 %5, label %for.body17.epil.preheader, label %for.body17

for.body17:                                       ; preds = %for.cond15.preheader, %for.body17
  %indvars.iv78 = phi i64 [ %indvars.iv.next79.1, %for.body17 ], [ 0, %for.cond15.preheader ]
  %7 = phi float [ %13, %for.body17 ], [ %arrayidx31.promoted, %for.cond15.preheader ]
  %niter = phi i64 [ %niter.next.1, %for.body17 ], [ 0, %for.cond15.preheader ]
  %arrayidx21 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx19, i64 %indvars.iv78
  %8 = load float, ptr %arrayidx21, align 4, !tbaa !10
  %mul22 = fmul float %alpha, %8
  %arrayidx26 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx24, i64 %indvars.iv78
  %9 = load float, ptr %arrayidx26, align 4, !tbaa !10
  %10 = tail call float @llvm.fmuladd.f32(float %mul22, float %9, float %7)
  store float %10, ptr %arrayidx31, align 4, !tbaa !10
  %indvars.iv.next79 = or disjoint i64 %indvars.iv78, 1
  %arrayidx21.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx19, i64 %indvars.iv.next79
  %11 = load float, ptr %arrayidx21.1, align 4, !tbaa !10
  %mul22.1 = fmul float %alpha, %11
  %arrayidx26.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx24, i64 %indvars.iv.next79
  %12 = load float, ptr %arrayidx26.1, align 4, !tbaa !10
  %13 = tail call float @llvm.fmuladd.f32(float %mul22.1, float %12, float %10)
  store float %13, ptr %arrayidx31, align 4, !tbaa !10
  %indvars.iv.next79.1 = add nuw nsw i64 %indvars.iv78, 2
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %for.cond15.for.inc35_crit_edge.unr-lcssa, label %for.body17, !llvm.loop !24

for.cond15.for.inc35_crit_edge.unr-lcssa:         ; preds = %for.body17
  br i1 %lcmp.mod.not, label %for.cond15.for.inc35_crit_edge, label %for.body17.epil.preheader

for.body17.epil.preheader:                        ; preds = %for.cond15.for.inc35_crit_edge.unr-lcssa, %for.cond15.preheader
  %indvars.iv78.epil.init = phi i64 [ 0, %for.cond15.preheader ], [ %indvars.iv.next79.1, %for.cond15.for.inc35_crit_edge.unr-lcssa ]
  %.epil.init = phi float [ %arrayidx31.promoted, %for.cond15.preheader ], [ %13, %for.cond15.for.inc35_crit_edge.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod96)
  %arrayidx21.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx19, i64 %indvars.iv78.epil.init
  %14 = load float, ptr %arrayidx21.epil, align 4, !tbaa !10
  %mul22.epil = fmul float %alpha, %14
  %arrayidx26.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx24, i64 %indvars.iv78.epil.init
  %15 = load float, ptr %arrayidx26.epil, align 4, !tbaa !10
  %16 = tail call float @llvm.fmuladd.f32(float %mul22.epil, float %15, float %.epil.init)
  store float %16, ptr %arrayidx31, align 4, !tbaa !10
  br label %for.cond15.for.inc35_crit_edge

for.cond15.for.inc35_crit_edge:                   ; preds = %for.cond15.for.inc35_crit_edge.unr-lcssa, %for.body17.epil.preheader
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond87.not = icmp eq i64 %indvars.iv.next84, %wide.trip.count91
  br i1 %exitcond87.not, label %for.cond12.for.inc38_crit_edge, label %for.cond15.preheader, !llvm.loop !25

for.cond12.for.inc38_crit_edge:                   ; preds = %for.cond15.for.inc35_crit_edge
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond92.not = icmp eq i64 %indvars.iv.next89, %wide.trip.count91
  br i1 %exitcond92.not, label %for.end40, label %for.cond12.preheader, !llvm.loop !26

for.end40:                                        ; preds = %for.cond12.for.inc38_crit_edge, %entry, %for.cond9.preheader
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #4

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiPA1024_fS0_(i32 noundef %ni, ptr nofree noundef readonly captures(none) %C, ptr nofree noundef readonly captures(none) %C_outputFromGpu) local_unnamed_addr #5 {
entry:
  %cmp29 = icmp sgt i32 %ni, 0
  br i1 %cmp29, label %for.cond1.preheader.us.preheader, label %for.end16

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count37 = zext nneg i32 %ni to i64
  %min.iters.check = icmp ult i32 %ni, 4
  %n.vec = and i64 %wide.trip.count37, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count37
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc14_crit_edge.us
  %indvars.iv34 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next35, %for.cond1.for.inc14_crit_edge.us ]
  %fail.031.us = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [4096 x i8], ptr %C, i64 %indvars.iv34
  %arrayidx7.us = getelementptr inbounds nuw [4096 x i8], ptr %C_outputFromGpu, i64 %indvars.iv34
  br i1 %min.iters.check, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.us
  %0 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.031.us, i64 0
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
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !27

middle.block:                                     ; preds = %vector.body
  %34 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %32)
  br i1 %cmp.n, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.cond1.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  %fail.128.us.ph = phi i32 [ %fail.031.us, %for.cond1.preheader.us ], [ %34, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %_Z11percentDiffdd.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %fail.128.us = phi i32 [ %fail.2.us, %_Z11percentDiffdd.exit.us ], [ %fail.128.us.ph, %for.body3.us.preheader ]
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
  %fail.2.us = add nsw i32 %retval.0.i.us, %fail.128.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count37
  br i1 %exitcond.not, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us, !llvm.loop !28

for.cond1.for.inc14_crit_edge.us:                 ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %fail.2.us.lcssa = phi i32 [ %34, %middle.block ], [ %fail.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %for.end16, label %for.cond1.preheader.us, !llvm.loop !29

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
define dso_local void @_Z26__device_stub__syrk_kerneliiffPfS_(i32 noundef %ni, i32 noundef %nj, float noundef %alpha, float noundef %beta, ptr noundef %a, ptr noundef %c) #9 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %alpha.addr = alloca float, align 4
  %beta.addr = alloca float, align 4
  %a.addr = alloca ptr, align 8
  %c.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !30
  store float %alpha, ptr %alpha.addr, align 4, !tbaa !10
  store float %beta, ptr %beta.addr, align 4, !tbaa !10
  store ptr %a, ptr %a.addr, align 8, !tbaa !31
  store ptr %c, ptr %c.addr, align 8, !tbaa !31
  %kernel_args1 = alloca [6 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %alpha.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %beta.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %a.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %c.addr, ptr %4, align 8
  %5 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %6 = load i64, ptr %shmem_size, align 8
  %7 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__syrk_kerneliiffPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %6, ptr noundef %7)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress uwtable
define dso_local void @_Z8syrkCudaiiffPA1024_fS0_S0_(i32 noundef %ni, i32 noundef %nj, float noundef %alpha, float noundef %beta, ptr noundef %A, ptr noundef %C, ptr noundef %C_outputFromGpu) local_unnamed_addr #7 {
entry:
  %Tp.i.i18 = alloca %struct.timeval, align 8
  %ni.addr.i = alloca i32, align 4
  %nj.addr.i = alloca i32, align 4
  %alpha.addr.i = alloca float, align 4
  %beta.addr.i = alloca float, align 4
  %a.addr.i = alloca ptr, align 8
  %c.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [6 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %A_gpu = alloca ptr, align 8
  %C_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %C_gpu) #16
  %call = call i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 4194304) #15
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %C_gpu, i64 noundef 4194304) #15
  %0 = load ptr, ptr %A_gpu, align 8, !tbaa !31
  %call2 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 4194304, i32 noundef 1) #15
  %1 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  %call3 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %C, i64 noundef 4194304, i32 noundef 1) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #16
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #15
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %2 = load i64, ptr %Tp.i.i, align 8, !tbaa !34
  %conv.i.i = sitofp i64 %2 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %3 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !37
  %conv2.i.i = sitofp i64 %3 to double
  %4 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #16
  store double %4, ptr @polybench_t_start, align 8, !tbaa !38
  %call10 = call i32 @__cudaPushCallConfiguration(i64 549755813920, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool.not = icmp eq i32 %call10, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %5 = load ptr, ptr %A_gpu, align 8, !tbaa !31
  %6 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %alpha.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %beta.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %a.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %c.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %ni, ptr %ni.addr.i, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr.i, align 4, !tbaa !30
  store float %alpha, ptr %alpha.addr.i, align 4, !tbaa !10
  store float %beta, ptr %beta.addr.i, align 4, !tbaa !10
  store ptr %5, ptr %a.addr.i, align 8, !tbaa !31
  store ptr %6, ptr %c.addr.i, align 8, !tbaa !31
  store ptr %ni.addr.i, ptr %kernel_args1.i, align 16
  %7 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %nj.addr.i, ptr %7, align 8
  %8 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %alpha.addr.i, ptr %8, align 16
  %9 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %beta.addr.i, ptr %9, align 8
  %10 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 32
  store ptr %a.addr.i, ptr %10, align 16
  %11 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 40
  store ptr %c.addr.i, ptr %11, align 8
  %12 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !40
  %13 = load i64, ptr %shmem_size.i, align 8
  %14 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__syrk_kerneliiffPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %13, ptr noundef %14), !inline_history !40
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %alpha.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %beta.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %a.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %c.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %_Z21polybench_timer_startv.exit
  %call11 = call i32 @cudaThreadSynchronize() #15
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i18) #16
  %call.i.i19 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i18, ptr noundef null) #17
  %cmp.not.i.i20 = icmp eq i32 %call.i.i19, 0
  br i1 %cmp.not.i.i20, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i21

if.then.i.i21:                                    ; preds = %kcall.end
  %call1.i.i22 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i19) #15
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end, %if.then.i.i21
  %15 = load i64, ptr %Tp.i.i18, align 8, !tbaa !34
  %conv.i.i23 = sitofp i64 %15 to double
  %tv_usec.i.i24 = getelementptr inbounds nuw i8, ptr %Tp.i.i18, i64 8
  %16 = load i64, ptr %tv_usec.i.i24, align 8, !tbaa !37
  %conv2.i.i25 = sitofp i64 %16 to double
  %17 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i25, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i23)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i18) #16
  store double %17, ptr @polybench_t_end, align 8, !tbaa !38
  %18 = load double, ptr @polybench_t_start, align 8, !tbaa !38
  %sub.i = fsub double %17, %18
  %call.i26 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #15
  %19 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  %call13 = call i32 @cudaMemcpy(ptr noundef %C_outputFromGpu, ptr noundef %19, i64 noundef 4194304, i32 noundef 2) #15
  %20 = load ptr, ptr %A_gpu, align 8, !tbaa !31
  %call14 = call i32 @cudaFree(ptr noundef %20) #15
  %21 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  %call15 = call i32 @cudaFree(ptr noundef %21) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %C_gpu) #16
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !34
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !37
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #16
  store double %2, ptr @polybench_t_start, align 8, !tbaa !38
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !34
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !37
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #16
  store double %2, ptr @polybench_t_end, align 8, !tbaa !38
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !38
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !38
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #15
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #9 {
entry:
  %Tp.i.i49 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i33 = alloca ptr, align 8
  %newA.i.i26 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #16
  store ptr null, ptr %newA.i.i, align 8, !tbaa !41
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 4194304) #17
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !41
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !42
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i26) #16
  store ptr null, ptr %newA.i.i26, align 8, !tbaa !41
  %call.i.i27 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i26, i64 noundef 32, i64 noundef 4194304) #17
  %3 = load ptr, ptr %newA.i.i26, align 8, !tbaa !41
  %tobool.i.i28 = icmp eq ptr %3, null
  %tobool1.i.i29 = icmp ne i32 %call.i.i27, 0
  %or.cond.i.i30 = select i1 %tobool.i.i28, i1 true, i1 %tobool1.i.i29
  br i1 %or.cond.i.i30, label %if.then.i.i31, label %_Z20polybench_alloc_datayi.exit32

if.then.i.i31:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !42
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit32:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i26) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i33) #16
  store ptr null, ptr %newA.i.i33, align 8, !tbaa !41
  %call.i.i34 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i33, i64 noundef 32, i64 noundef 4194304) #17
  %6 = load ptr, ptr %newA.i.i33, align 8, !tbaa !41
  %tobool.i.i35 = icmp eq ptr %6, null
  %tobool1.i.i36 = icmp ne i32 %call.i.i34, 0
  %or.cond.i.i37 = select i1 %tobool.i.i35, i1 true, i1 %tobool1.i.i36
  br i1 %or.cond.i.i37, label %if.then.i.i38, label %_Z20polybench_alloc_datayi.exit39

if.then.i.i38:                                    ; preds = %_Z20polybench_alloc_datayi.exit32
  %7 = load ptr, ptr @stderr, align 8, !tbaa !42
  %8 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %7) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit39:                ; preds = %_Z20polybench_alloc_datayi.exit32
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i33) #16
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc8_crit_edge.i, %_Z20polybench_alloc_datayi.exit39
  %indvars.iv59.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit39 ], [ %indvars.iv.next60.i, %for.cond1.for.inc8_crit_edge.i ]
  %arrayidx.i = getelementptr inbounds nuw [4096 x i8], ptr %0, i64 %indvars.iv59.i
  %9 = trunc nuw nsw i64 %indvars.iv59.i to i32
  %conv.i = uitofp nneg i32 %9 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond1.preheader.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %10 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %11 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %12 = fmul nnan <4 x float> %broadcast.splat, %10
  %13 = fmul nnan <4 x float> %broadcast.splat, %11
  %14 = fmul nnan <4 x float> %12, splat (float f0x3A800000)
  %15 = fmul nnan <4 x float> %13, splat (float f0x3A800000)
  %16 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 16
  store <4 x float> %14, ptr %16, align 4, !tbaa !10
  store <4 x float> %15, ptr %17, align 4, !tbaa !10
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %18 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %19 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %20 = fmul nnan <4 x float> %broadcast.splat, %18
  %21 = fmul nnan <4 x float> %broadcast.splat, %19
  %22 = fmul nnan <4 x float> %20, splat (float f0x3A800000)
  %23 = fmul nnan <4 x float> %21, splat (float f0x3A800000)
  %24 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %25 = getelementptr inbounds nuw i8, ptr %24, i64 32
  %26 = getelementptr inbounds nuw i8, ptr %24, i64 48
  store <4 x float> %22, ptr %25, align 4, !tbaa !10
  store <4 x float> %23, ptr %26, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %27 = icmp eq i64 %index.next.1, 1024
  br i1 %27, label %for.cond1.for.inc8_crit_edge.i, label %vector.body, !llvm.loop !44

for.cond1.for.inc8_crit_edge.i:                   ; preds = %vector.body
  %indvars.iv.next60.i = add nuw nsw i64 %indvars.iv59.i, 1
  %exitcond63.not.i = icmp eq i64 %indvars.iv.next60.i, 1024
  br i1 %exitcond63.not.i, label %for.cond14.preheader.i, label %for.cond1.preheader.i, !llvm.loop !17

for.cond14.preheader.i:                           ; preds = %for.cond1.for.inc8_crit_edge.i, %for.cond14.for.inc29_crit_edge.i
  %indvars.iv69.i = phi i64 [ %indvars.iv.next70.i, %for.cond14.for.inc29_crit_edge.i ], [ 0, %for.cond1.for.inc8_crit_edge.i ]
  %arrayidx23.i = getelementptr inbounds nuw [4096 x i8], ptr %3, i64 %indvars.iv69.i
  %28 = trunc nuw nsw i64 %indvars.iv69.i to i32
  %conv17.i = uitofp nneg i32 %28 to float
  %broadcast.splatinsert66 = insertelement <4 x float> poison, float %conv17.i, i64 0
  %broadcast.splat67 = shufflevector <4 x float> %broadcast.splatinsert66, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body68

vector.body68:                                    ; preds = %vector.body68, %for.cond14.preheader.i
  %index69 = phi i64 [ 0, %for.cond14.preheader.i ], [ %index.next72.1, %vector.body68 ]
  %vec.ind70 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond14.preheader.i ], [ %vec.ind.next73.1, %vector.body68 ]
  %step.add71 = add <4 x i32> %vec.ind70, splat (i32 4)
  %29 = uitofp nneg <4 x i32> %vec.ind70 to <4 x float>
  %30 = uitofp nneg <4 x i32> %step.add71 to <4 x float>
  %31 = fmul nnan <4 x float> %broadcast.splat67, %29
  %32 = fmul nnan <4 x float> %broadcast.splat67, %30
  %33 = fmul nnan <4 x float> %31, splat (float f0x3A800000)
  %34 = fmul nnan <4 x float> %32, splat (float f0x3A800000)
  %35 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx23.i, i64 %index69
  %36 = getelementptr inbounds nuw i8, ptr %35, i64 16
  store <4 x float> %33, ptr %35, align 4, !tbaa !10
  store <4 x float> %34, ptr %36, align 4, !tbaa !10
  %vec.ind.next73 = add <4 x i32> %vec.ind70, splat (i32 8)
  %step.add71.1 = add <4 x i32> %vec.ind70, splat (i32 12)
  %37 = uitofp nneg <4 x i32> %vec.ind.next73 to <4 x float>
  %38 = uitofp nneg <4 x i32> %step.add71.1 to <4 x float>
  %39 = fmul nnan <4 x float> %broadcast.splat67, %37
  %40 = fmul nnan <4 x float> %broadcast.splat67, %38
  %41 = fmul nnan <4 x float> %39, splat (float f0x3A800000)
  %42 = fmul nnan <4 x float> %40, splat (float f0x3A800000)
  %43 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx23.i, i64 %index69
  %44 = getelementptr inbounds nuw i8, ptr %43, i64 32
  %45 = getelementptr inbounds nuw i8, ptr %43, i64 48
  store <4 x float> %41, ptr %44, align 4, !tbaa !10
  store <4 x float> %42, ptr %45, align 4, !tbaa !10
  %index.next72.1 = add nuw nsw i64 %index69, 16
  %vec.ind.next73.1 = add <4 x i32> %vec.ind70, splat (i32 16)
  %46 = icmp eq i64 %index.next72.1, 1024
  br i1 %46, label %for.cond14.for.inc29_crit_edge.i, label %vector.body68, !llvm.loop !45

for.cond14.for.inc29_crit_edge.i:                 ; preds = %vector.body68
  %indvars.iv.next70.i = add nuw nsw i64 %indvars.iv69.i, 1
  %exitcond73.not.i = icmp eq i64 %indvars.iv.next70.i, 1024
  br i1 %exitcond73.not.i, label %_Z11init_arraysiiPfS_PA1024_fS1_.exit, label %for.cond14.preheader.i, !llvm.loop !20

_Z11init_arraysiiPfS_PA1024_fS1_.exit:            ; preds = %for.cond14.for.inc29_crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #16
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #15
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #15
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #16
  call void @_Z8syrkCudaiiffPA1024_fS0_S0_(i32 noundef 1024, i32 noundef 1024, float noundef 3.241200e+04, float noundef 2.123000e+03, ptr noundef nonnull %0, ptr noundef nonnull %3, ptr noundef nonnull %6) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #16
  %call.i.i40 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i40, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i41

if.then.i.i41:                                    ; preds = %_Z11init_arraysiiPfS_PA1024_fS1_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i40) #15
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z11init_arraysiiPfS_PA1024_fS1_.exit, %if.then.i.i41
  %47 = load i64, ptr %Tp.i.i, align 8, !tbaa !34
  %conv.i.i = sitofp i64 %47 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %48 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !37
  %conv2.i.i = sitofp i64 %48 to double
  %49 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #16
  store double %49, ptr @polybench_t_start, align 8, !tbaa !38
  br label %for.cond1.preheader.i42

for.cond1.preheader.i42:                          ; preds = %for.cond1.for.inc6_crit_edge.i, %_Z21polybench_timer_startv.exit
  %indvars.iv73.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next74.i, %for.cond1.for.inc6_crit_edge.i ]
  %arrayidx.i43 = getelementptr inbounds nuw [4096 x i8], ptr %3, i64 %indvars.iv73.i
  br label %vector.body76

vector.body76:                                    ; preds = %vector.body76, %for.cond1.preheader.i42
  %index77 = phi i64 [ 0, %for.cond1.preheader.i42 ], [ %index.next79.1, %vector.body76 ]
  %50 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i43, i64 %index77
  %51 = getelementptr inbounds nuw i8, ptr %50, i64 16
  %wide.load = load <4 x float>, ptr %50, align 4, !tbaa !10
  %wide.load78 = load <4 x float>, ptr %51, align 4, !tbaa !10
  %52 = fmul <4 x float> %wide.load, splat (float 2.123000e+03)
  %53 = fmul <4 x float> %wide.load78, splat (float 2.123000e+03)
  store <4 x float> %52, ptr %50, align 4, !tbaa !10
  store <4 x float> %53, ptr %51, align 4, !tbaa !10
  %54 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i43, i64 %index77
  %55 = getelementptr inbounds nuw i8, ptr %54, i64 32
  %56 = getelementptr inbounds nuw i8, ptr %54, i64 48
  %wide.load.1 = load <4 x float>, ptr %55, align 4, !tbaa !10
  %wide.load78.1 = load <4 x float>, ptr %56, align 4, !tbaa !10
  %57 = fmul <4 x float> %wide.load.1, splat (float 2.123000e+03)
  %58 = fmul <4 x float> %wide.load78.1, splat (float 2.123000e+03)
  store <4 x float> %57, ptr %55, align 4, !tbaa !10
  store <4 x float> %58, ptr %56, align 4, !tbaa !10
  %index.next79.1 = add nuw nsw i64 %index77, 16
  %59 = icmp eq i64 %index.next79.1, 1024
  br i1 %59, label %for.cond1.for.inc6_crit_edge.i, label %vector.body76, !llvm.loop !46

for.cond1.for.inc6_crit_edge.i:                   ; preds = %vector.body76
  %indvars.iv.next74.i = add nuw nsw i64 %indvars.iv73.i, 1
  %exitcond77.not.i = icmp eq i64 %indvars.iv.next74.i, 1024
  br i1 %exitcond77.not.i, label %for.cond12.preheader.i, label %for.cond1.preheader.i42, !llvm.loop !23

for.cond12.preheader.i:                           ; preds = %for.cond1.for.inc6_crit_edge.i, %for.cond12.for.inc38_crit_edge.i
  %indvars.iv88.i = phi i64 [ %indvars.iv.next89.i, %for.cond12.for.inc38_crit_edge.i ], [ 0, %for.cond1.for.inc6_crit_edge.i ]
  %arrayidx19.i = getelementptr inbounds nuw [4096 x i8], ptr %0, i64 %indvars.iv88.i
  %arrayidx29.i = getelementptr inbounds nuw [4096 x i8], ptr %3, i64 %indvars.iv88.i
  br label %for.cond15.preheader.i

for.cond15.preheader.i:                           ; preds = %for.cond15.for.inc35_crit_edge.i, %for.cond12.preheader.i
  %indvars.iv83.i = phi i64 [ 0, %for.cond12.preheader.i ], [ %indvars.iv.next84.i, %for.cond15.for.inc35_crit_edge.i ]
  %arrayidx24.i = getelementptr inbounds nuw [4096 x i8], ptr %0, i64 %indvars.iv83.i
  %arrayidx31.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx29.i, i64 %indvars.iv83.i
  %arrayidx31.promoted.i = load float, ptr %arrayidx31.i, align 4, !tbaa !10
  br label %for.body17.i

for.body17.i:                                     ; preds = %for.body17.i, %for.cond15.preheader.i
  %indvars.iv78.i = phi i64 [ 0, %for.cond15.preheader.i ], [ %indvars.iv.next79.i.1, %for.body17.i ]
  %60 = phi float [ %arrayidx31.promoted.i, %for.cond15.preheader.i ], [ %66, %for.body17.i ]
  %arrayidx21.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx19.i, i64 %indvars.iv78.i
  %61 = load float, ptr %arrayidx21.i, align 4, !tbaa !10
  %mul22.i = fmul float %61, 3.241200e+04
  %arrayidx26.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx24.i, i64 %indvars.iv78.i
  %62 = load float, ptr %arrayidx26.i, align 4, !tbaa !10
  %63 = call float @llvm.fmuladd.f32(float %mul22.i, float %62, float %60)
  store float %63, ptr %arrayidx31.i, align 4, !tbaa !10
  %indvars.iv.next79.i = or disjoint i64 %indvars.iv78.i, 1
  %arrayidx21.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx19.i, i64 %indvars.iv.next79.i
  %64 = load float, ptr %arrayidx21.i.1, align 4, !tbaa !10
  %mul22.i.1 = fmul float %64, 3.241200e+04
  %arrayidx26.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx24.i, i64 %indvars.iv.next79.i
  %65 = load float, ptr %arrayidx26.i.1, align 4, !tbaa !10
  %66 = call float @llvm.fmuladd.f32(float %mul22.i.1, float %65, float %63)
  store float %66, ptr %arrayidx31.i, align 4, !tbaa !10
  %indvars.iv.next79.i.1 = add nuw nsw i64 %indvars.iv78.i, 2
  %exitcond82.not.i.1 = icmp eq i64 %indvars.iv.next79.i.1, 1024
  br i1 %exitcond82.not.i.1, label %for.cond15.for.inc35_crit_edge.i, label %for.body17.i, !llvm.loop !24

for.cond15.for.inc35_crit_edge.i:                 ; preds = %for.body17.i
  %indvars.iv.next84.i = add nuw nsw i64 %indvars.iv83.i, 1
  %exitcond87.not.i = icmp eq i64 %indvars.iv.next84.i, 1024
  br i1 %exitcond87.not.i, label %for.cond12.for.inc38_crit_edge.i, label %for.cond15.preheader.i, !llvm.loop !25

for.cond12.for.inc38_crit_edge.i:                 ; preds = %for.cond15.for.inc35_crit_edge.i
  %indvars.iv.next89.i = add nuw nsw i64 %indvars.iv88.i, 1
  %exitcond92.not.i = icmp eq i64 %indvars.iv.next89.i, 1024
  br i1 %exitcond92.not.i, label %_Z4syrkiiffPA1024_fS0_.exit, label %for.cond12.preheader.i, !llvm.loop !26

_Z4syrkiiffPA1024_fS0_.exit:                      ; preds = %for.cond12.for.inc38_crit_edge.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i49) #16
  %call.i.i50 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i49, ptr noundef null) #17
  %cmp.not.i.i51 = icmp eq i32 %call.i.i50, 0
  br i1 %cmp.not.i.i51, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i52

if.then.i.i52:                                    ; preds = %_Z4syrkiiffPA1024_fS0_.exit
  %call1.i.i53 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i50) #15
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z4syrkiiffPA1024_fS0_.exit, %if.then.i.i52
  %67 = load i64, ptr %Tp.i.i49, align 8, !tbaa !34
  %conv.i.i54 = sitofp i64 %67 to double
  %tv_usec.i.i55 = getelementptr inbounds nuw i8, ptr %Tp.i.i49, i64 8
  %68 = load i64, ptr %tv_usec.i.i55, align 8, !tbaa !37
  %conv2.i.i56 = sitofp i64 %68 to double
  %69 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i56, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i54)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i49) #16
  store double %69, ptr @polybench_t_end, align 8, !tbaa !38
  %70 = load double, ptr @polybench_t_start, align 8, !tbaa !38
  %sub.i = fsub double %69, %70
  %call.i57 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #15
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc14_crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv34.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next35.i, %for.cond1.for.inc14_crit_edge.us.i ]
  %fail.031.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %105, %for.cond1.for.inc14_crit_edge.us.i ]
  %arrayidx.us.i = getelementptr inbounds nuw [4096 x i8], ptr %3, i64 %indvars.iv34.i
  %arrayidx7.us.i = getelementptr inbounds nuw [4096 x i8], ptr %6, i64 %indvars.iv34.i
  %71 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.031.us.i, i64 0
  br label %vector.body82

vector.body82:                                    ; preds = %vector.body82, %for.cond1.preheader.us.i
  %index83 = phi i64 [ 0, %for.cond1.preheader.us.i ], [ %index.next86, %vector.body82 ]
  %vec.phi = phi <4 x i32> [ %71, %for.cond1.preheader.us.i ], [ %103, %vector.body82 ]
  %72 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i, i64 %index83
  %wide.load84 = load <4 x float>, ptr %72, align 4, !tbaa !10
  %73 = fpext <4 x float> %wide.load84 to <4 x double>
  %74 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us.i, i64 %index83
  %wide.load85 = load <4 x float>, ptr %74, align 4, !tbaa !10
  %75 = fpext <4 x float> %wide.load85 to <4 x double>
  %76 = fcmp olt <4 x double> %73, splat (double f0xB690000000000000)
  %77 = fneg <4 x float> %wide.load84
  %78 = select <4 x i1> %76, <4 x float> %77, <4 x float> %wide.load84
  %79 = fpext <4 x float> %78 to <4 x double>
  %80 = fcmp uge <4 x double> %79, splat (double 1.000000e-02)
  %81 = fcmp olt <4 x double> %75, splat (double f0xB690000000000000)
  %82 = fneg <4 x float> %wide.load85
  %83 = select <4 x i1> %81, <4 x float> %82, <4 x float> %wide.load85
  %84 = fpext <4 x float> %83 to <4 x double>
  %85 = fcmp uge <4 x double> %84, splat (double 1.000000e-02)
  %86 = fsub <4 x double> %73, %75
  %87 = fptrunc <4 x double> %86 to <4 x float>
  %88 = fcmp olt <4 x double> %86, splat (double f0xB690000000000000)
  %89 = fneg <4 x float> %87
  %90 = select <4 x i1> %88, <4 x float> %89, <4 x float> %87
  %91 = fadd <4 x double> %73, splat (double f0x3E45798EE0000000)
  %92 = fptrunc <4 x double> %91 to <4 x float>
  %93 = fcmp olt <4 x double> %91, splat (double f0xB690000000000000)
  %94 = fneg <4 x float> %92
  %95 = select <4 x i1> %93, <4 x float> %94, <4 x float> %92
  %96 = fdiv <4 x float> %90, %95
  %97 = fcmp olt <4 x float> %96, zeroinitializer
  %98 = fneg <4 x float> %96
  %99 = select <4 x i1> %97, <4 x float> %98, <4 x float> %96
  %100 = fmul <4 x float> %99, splat (float 1.000000e+02)
  %101 = fpext <4 x float> %100 to <4 x double>
  %102 = fcmp ogt <4 x double> %101, splat (double 5.000000e-02)
  %.not89 = select <4 x i1> %80, <4 x i1> splat (i1 true), <4 x i1> %85
  %narrow = select <4 x i1> %.not89, <4 x i1> %102, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %103 = add <4 x i32> %vec.phi, %predphi
  %index.next86 = add nuw i64 %index83, 4
  %104 = icmp eq i64 %index.next86, 1024
  br i1 %104, label %for.cond1.for.inc14_crit_edge.us.i, label %vector.body82, !llvm.loop !47

for.cond1.for.inc14_crit_edge.us.i:               ; preds = %vector.body82
  %105 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %103)
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond38.not.i = icmp eq i64 %indvars.iv.next35.i, 1024
  br i1 %exitcond38.not.i, label %_Z14compareResultsiPA1024_fS0_.exit, label %for.cond1.preheader.us.i, !llvm.loop !29

_Z14compareResultsiPA1024_fS0_.exit:              ; preds = %for.cond1.for.inc14_crit_edge.us.i
  %call17.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %105) #15
  call void @free(ptr noundef %0) #17
  call void @free(ptr noundef nonnull %3) #17
  call void @free(ptr noundef nonnull %6) #17
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #16
  store ptr null, ptr %newA.i, align 8, !tbaa !41
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #17
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !41
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !42
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
!18 = distinct !{!18, !13, !14, !15}
!19 = distinct !{!19, !13, !15, !14}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !13, !14, !15}
!22 = distinct !{!22, !13, !15, !14}
!23 = distinct !{!23, !13}
!24 = distinct !{!24, !13}
!25 = distinct !{!25, !13}
!26 = distinct !{!26, !13}
!27 = distinct !{!27, !13, !14, !15}
!28 = distinct !{!28, !13, !15, !14}
!29 = distinct !{!29, !13}
!30 = !{!7, !7, i64 0}
!31 = !{!32, !32, i64 0}
!32 = !{!"p1 float", !33, i64 0}
!33 = !{!"any pointer", !8, i64 0}
!34 = !{!35, !36, i64 0}
!35 = !{!"_ZTS7timeval", !36, i64 0, !36, i64 8}
!36 = !{!"long", !8, i64 0}
!37 = !{!35, !36, i64 8}
!38 = !{!39, !39, i64 0}
!39 = !{!"double", !8, i64 0}
!40 = !{ptr @_Z26__device_stub__syrk_kerneliiffPfS_}
!41 = !{!33, !33, i64 0}
!42 = !{!43, !43, i64 0}
!43 = !{!"p1 _ZTS8_IO_FILE", !33, i64 0}
!44 = distinct !{!44, !13, !14, !15}
!45 = distinct !{!45, !13, !14, !15}
!46 = distinct !{!46, !13, !14, !15}
!47 = distinct !{!47, !13, !14, !15}
