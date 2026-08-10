; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/BICG/bicg.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/BICG/bicg.cu"
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
define dso_local void @_Z10init_arrayiiPA4096_fPfS1_(i32 noundef %nx, i32 noundef %ny, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %p, ptr nofree noundef writeonly captures(none) %r) local_unnamed_addr #1 {
entry:
  %cmp39 = icmp sgt i32 %ny, 0
  br i1 %cmp39, label %for.body.preheader, label %for.cond2.preheader.thread

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext nneg i32 %ny to i64
  %min.iters.check66 = icmp ult i32 %ny, 4
  br i1 %min.iters.check66, label %for.body.preheader91, label %vector.ph67

vector.ph67:                                      ; preds = %for.body.preheader
  %n.vec69 = and i64 %wide.trip.count, 2147483644
  br label %vector.body70

vector.body70:                                    ; preds = %vector.body70, %vector.ph67
  %index71 = phi i64 [ 0, %vector.ph67 ], [ %index.next73, %vector.body70 ]
  %vec.ind72 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph67 ], [ %vec.ind.next74, %vector.body70 ]
  %0 = uitofp nneg <4 x i32> %vec.ind72 to <4 x double>
  %1 = fmul nnan <4 x double> %0, splat (double f0x400921FB54442D18)
  %2 = fptrunc <4 x double> %1 to <4 x float>
  %3 = getelementptr inbounds nuw [4 x i8], ptr %p, i64 %index71
  store <4 x float> %2, ptr %3, align 4, !tbaa !10
  %index.next73 = add nuw i64 %index71, 4
  %vec.ind.next74 = add <4 x i32> %vec.ind72, splat (i32 4)
  %4 = icmp eq i64 %index.next73, %n.vec69
  br i1 %4, label %middle.block75, label %vector.body70, !llvm.loop !12

middle.block75:                                   ; preds = %vector.body70
  %cmp.n76 = icmp eq i64 %n.vec69, %wide.trip.count
  br i1 %cmp.n76, label %for.cond2.preheader, label %for.body.preheader91

for.body.preheader91:                             ; preds = %for.body.preheader, %middle.block75
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec69, %middle.block75 ]
  br label %for.body

for.cond2.preheader:                              ; preds = %for.body, %middle.block75
  %cmp343 = icmp sgt i32 %nx, 0
  br i1 %cmp343, label %for.body4.us.preheader, label %for.end25

for.cond2.preheader.thread:                       ; preds = %entry
  %cmp34362 = icmp sgt i32 %nx, 0
  br i1 %cmp34362, label %for.body4.preheader, label %for.end25

for.body4.preheader:                              ; preds = %for.cond2.preheader.thread
  %wide.trip.count50 = zext nneg i32 %nx to i64
  %min.iters.check = icmp ult i32 %nx, 4
  br i1 %min.iters.check, label %for.body4.preheader92, label %vector.ph

vector.ph:                                        ; preds = %for.body4.preheader
  %n.vec = and i64 %wide.trip.count50, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %5 = uitofp nneg <4 x i32> %vec.ind to <4 x double>
  %6 = fmul nnan <4 x double> %5, splat (double f0x400921FB54442D18)
  %7 = fptrunc <4 x double> %6 to <4 x float>
  %8 = getelementptr inbounds nuw [4 x i8], ptr %r, i64 %index
  store <4 x float> %7, ptr %8, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count50
  br i1 %cmp.n, label %for.end25, label %for.body4.preheader92

for.body4.preheader92:                            ; preds = %for.body4.preheader, %middle.block
  %indvars.iv47.ph = phi i64 [ 0, %for.body4.preheader ], [ %n.vec, %middle.block ]
  br label %for.body4

for.body4.us.preheader:                           ; preds = %for.cond2.preheader
  %wide.trip.count60 = zext nneg i32 %nx to i64
  %wide.trip.count55 = zext nneg i32 %ny to i64
  %min.iters.check79 = icmp ult i32 %ny, 8
  %n.vec82 = and i64 %wide.trip.count, 2147483640
  %cmp.n89 = icmp eq i64 %n.vec82, %wide.trip.count
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.body4.us.preheader, %for.cond10.for.inc23_crit_edge.us
  %indvars.iv57 = phi i64 [ 0, %for.body4.us.preheader ], [ %indvars.iv.next58, %for.cond10.for.inc23_crit_edge.us ]
  %10 = trunc nuw nsw i64 %indvars.iv57 to i32
  %conv5.us = uitofp nneg i32 %10 to double
  %mul6.us = fmul nnan double %conv5.us, f0x400921FB54442D18
  %conv7.us = fptrunc double %mul6.us to float
  %arrayidx9.us = getelementptr inbounds nuw [4 x i8], ptr %r, i64 %indvars.iv57
  store float %conv7.us, ptr %arrayidx9.us, align 4, !tbaa !10
  %conv13.us = uitofp nneg i32 %10 to float
  %arrayidx17.us = getelementptr inbounds nuw [16384 x i8], ptr %A, i64 %indvars.iv57
  br i1 %min.iters.check79, label %for.body12.us.preheader, label %vector.ph80

vector.ph80:                                      ; preds = %for.body4.us
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv13.us, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body83

vector.body83:                                    ; preds = %vector.body83, %vector.ph80
  %index84 = phi i64 [ 0, %vector.ph80 ], [ %index.next86, %vector.body83 ]
  %vec.ind85 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph80 ], [ %vec.ind.next87, %vector.body83 ]
  %step.add = add <4 x i32> %vec.ind85, splat (i32 4)
  %11 = uitofp nneg <4 x i32> %vec.ind85 to <4 x float>
  %12 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %13 = fmul nnan <4 x float> %broadcast.splat, %11
  %14 = fmul nnan <4 x float> %broadcast.splat, %12
  %15 = fmul nnan <4 x float> %13, splat (float f0x39800000)
  %16 = fmul nnan <4 x float> %14, splat (float f0x39800000)
  %17 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us, i64 %index84
  %18 = getelementptr inbounds nuw i8, ptr %17, i64 16
  store <4 x float> %15, ptr %17, align 4, !tbaa !10
  store <4 x float> %16, ptr %18, align 4, !tbaa !10
  %index.next86 = add nuw i64 %index84, 8
  %vec.ind.next87 = add <4 x i32> %vec.ind85, splat (i32 8)
  %19 = icmp eq i64 %index.next86, %n.vec82
  br i1 %19, label %middle.block88, label %vector.body83, !llvm.loop !17

middle.block88:                                   ; preds = %vector.body83
  br i1 %cmp.n89, label %for.cond10.for.inc23_crit_edge.us, label %for.body12.us.preheader

for.body12.us.preheader:                          ; preds = %for.body4.us, %middle.block88
  %indvars.iv52.ph = phi i64 [ 0, %for.body4.us ], [ %n.vec82, %middle.block88 ]
  br label %for.body12.us

for.body12.us:                                    ; preds = %for.body12.us.preheader, %for.body12.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.body12.us ], [ %indvars.iv52.ph, %for.body12.us.preheader ]
  %20 = trunc nuw nsw i64 %indvars.iv52 to i32
  %conv14.us = uitofp nneg i32 %20 to float
  %mul15.us = fmul nnan float %conv13.us, %conv14.us
  %div.us = fmul nnan float %mul15.us, f0x39800000
  %arrayidx19.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us, i64 %indvars.iv52
  store float %div.us, ptr %arrayidx19.us, align 4, !tbaa !10
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond56.not = icmp eq i64 %indvars.iv.next53, %wide.trip.count55
  br i1 %exitcond56.not, label %for.cond10.for.inc23_crit_edge.us, label %for.body12.us, !llvm.loop !18

for.cond10.for.inc23_crit_edge.us:                ; preds = %for.body12.us, %middle.block88
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond61.not = icmp eq i64 %indvars.iv.next58, %wide.trip.count60
  br i1 %exitcond61.not, label %for.end25, label %for.body4.us, !llvm.loop !19

for.body:                                         ; preds = %for.body.preheader91, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader91 ]
  %21 = trunc nuw nsw i64 %indvars.iv to i32
  %conv = uitofp nneg i32 %21 to double
  %mul = fmul nnan double %conv, f0x400921FB54442D18
  %conv1 = fptrunc double %mul to float
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %p, i64 %indvars.iv
  store float %conv1, ptr %arrayidx, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond2.preheader, label %for.body, !llvm.loop !20

for.body4:                                        ; preds = %for.body4.preheader92, %for.body4
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.body4 ], [ %indvars.iv47.ph, %for.body4.preheader92 ]
  %22 = trunc nuw nsw i64 %indvars.iv47 to i32
  %conv5 = uitofp nneg i32 %22 to double
  %mul6 = fmul nnan double %conv5, f0x400921FB54442D18
  %conv7 = fptrunc double %mul6 to float
  %arrayidx9 = getelementptr inbounds nuw [4 x i8], ptr %r, i64 %indvars.iv47
  store float %conv7, ptr %arrayidx9, align 4, !tbaa !10
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond51.not = icmp eq i64 %indvars.iv.next48, %wide.trip.count50
  br i1 %exitcond51.not, label %for.end25, label %for.body4, !llvm.loop !21

for.end25:                                        ; preds = %for.body4, %for.cond10.for.inc23_crit_edge.us, %middle.block, %for.cond2.preheader.thread, %for.cond2.preheader
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiiPfS_S_S_(i32 noundef %nx, i32 noundef %ny, ptr nofree noundef readonly captures(none) %s, ptr nofree noundef readonly captures(none) %s_outputFromGpu, ptr nofree noundef readonly captures(none) %q, ptr nofree noundef readonly captures(none) %q_outputFromGpu) local_unnamed_addr #3 {
entry:
  %cmp64 = icmp sgt i32 %nx, 0
  br i1 %cmp64, label %for.body.preheader, label %for.cond7.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext nneg i32 %nx to i64
  %min.iters.check = icmp ult i32 %nx, 4
  br i1 %min.iters.check, label %for.body.preheader96, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %31, %vector.body ]
  %0 = getelementptr inbounds nuw [4 x i8], ptr %q, i64 %index
  %wide.load = load <4 x float>, ptr %0, align 4, !tbaa !10
  %1 = fpext <4 x float> %wide.load to <4 x double>
  %2 = getelementptr inbounds nuw [4 x i8], ptr %q_outputFromGpu, i64 %index
  %wide.load77 = load <4 x float>, ptr %2, align 4, !tbaa !10
  %3 = fpext <4 x float> %wide.load77 to <4 x double>
  %4 = fcmp olt <4 x double> %1, splat (double f0xB690000000000000)
  %5 = fneg <4 x float> %wide.load
  %6 = select <4 x i1> %4, <4 x float> %5, <4 x float> %wide.load
  %7 = fpext <4 x float> %6 to <4 x double>
  %8 = fcmp uge <4 x double> %7, splat (double 1.000000e-02)
  %9 = fcmp olt <4 x double> %3, splat (double f0xB690000000000000)
  %10 = fneg <4 x float> %wide.load77
  %11 = select <4 x i1> %9, <4 x float> %10, <4 x float> %wide.load77
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
  %30 = fcmp ogt <4 x float> %29, splat (float 5.000000e-01)
  %narrow = select <4 x i1> %14, <4 x i1> %30, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %31 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %32 = icmp eq i64 %index.next, %n.vec
  br i1 %32, label %middle.block, label %vector.body, !llvm.loop !22

middle.block:                                     ; preds = %vector.body
  %33 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %31)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond7.preheader, label %for.body.preheader96

for.body.preheader96:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %fail.066.ph = phi i32 [ 0, %for.body.preheader ], [ %33, %middle.block ]
  br label %for.body

for.cond7.preheader:                              ; preds = %_Z11percentDiffdd.exit, %middle.block, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %33, %middle.block ], [ %fail.1, %_Z11percentDiffdd.exit ]
  %cmp867 = icmp sgt i32 %ny, 0
  br i1 %cmp867, label %for.body9.preheader, label %for.end24

for.body9.preheader:                              ; preds = %for.cond7.preheader
  %wide.trip.count75 = zext nneg i32 %ny to i64
  %min.iters.check79 = icmp ult i32 %ny, 4
  br i1 %min.iters.check79, label %for.body9.preheader95, label %vector.ph80

vector.ph80:                                      ; preds = %for.body9.preheader
  %n.vec82 = and i64 %wide.trip.count75, 2147483644
  %34 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.0.lcssa, i64 0
  br label %vector.body83

vector.body83:                                    ; preds = %vector.body83, %vector.ph80
  %index84 = phi i64 [ 0, %vector.ph80 ], [ %index.next89, %vector.body83 ]
  %vec.phi85 = phi <4 x i32> [ %34, %vector.ph80 ], [ %66, %vector.body83 ]
  %35 = getelementptr inbounds nuw [4 x i8], ptr %s, i64 %index84
  %wide.load86 = load <4 x float>, ptr %35, align 4, !tbaa !10
  %36 = fpext <4 x float> %wide.load86 to <4 x double>
  %37 = getelementptr inbounds nuw [4 x i8], ptr %s_outputFromGpu, i64 %index84
  %wide.load87 = load <4 x float>, ptr %37, align 4, !tbaa !10
  %38 = fpext <4 x float> %wide.load87 to <4 x double>
  %39 = fcmp olt <4 x double> %36, splat (double f0xB690000000000000)
  %40 = fneg <4 x float> %wide.load86
  %41 = select <4 x i1> %39, <4 x float> %40, <4 x float> %wide.load86
  %42 = fpext <4 x float> %41 to <4 x double>
  %43 = fcmp uge <4 x double> %42, splat (double 1.000000e-02)
  %44 = fcmp olt <4 x double> %38, splat (double f0xB690000000000000)
  %45 = fneg <4 x float> %wide.load87
  %46 = select <4 x i1> %44, <4 x float> %45, <4 x float> %wide.load87
  %47 = fpext <4 x float> %46 to <4 x double>
  %48 = fcmp uge <4 x double> %47, splat (double 1.000000e-02)
  %49 = select <4 x i1> %43, <4 x i1> splat (i1 true), <4 x i1> %48
  %50 = fsub <4 x double> %36, %38
  %51 = fptrunc <4 x double> %50 to <4 x float>
  %52 = fcmp olt <4 x double> %50, splat (double f0xB690000000000000)
  %53 = fneg <4 x float> %51
  %54 = select <4 x i1> %52, <4 x float> %53, <4 x float> %51
  %55 = fadd <4 x double> %36, splat (double f0x3E45798EE0000000)
  %56 = fptrunc <4 x double> %55 to <4 x float>
  %57 = fcmp olt <4 x double> %55, splat (double f0xB690000000000000)
  %58 = fneg <4 x float> %56
  %59 = select <4 x i1> %57, <4 x float> %58, <4 x float> %56
  %60 = fdiv <4 x float> %54, %59
  %61 = fcmp olt <4 x float> %60, zeroinitializer
  %62 = fneg <4 x float> %60
  %63 = select <4 x i1> %61, <4 x float> %62, <4 x float> %60
  %64 = fmul <4 x float> %63, splat (float 1.000000e+02)
  %65 = fcmp ogt <4 x float> %64, splat (float 5.000000e-01)
  %narrow94 = select <4 x i1> %49, <4 x i1> %65, <4 x i1> zeroinitializer
  %predphi88 = zext <4 x i1> %narrow94 to <4 x i32>
  %66 = add <4 x i32> %vec.phi85, %predphi88
  %index.next89 = add nuw i64 %index84, 4
  %67 = icmp eq i64 %index.next89, %n.vec82
  br i1 %67, label %middle.block90, label %vector.body83, !llvm.loop !23

middle.block90:                                   ; preds = %vector.body83
  %68 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %66)
  %cmp.n91 = icmp eq i64 %n.vec82, %wide.trip.count75
  br i1 %cmp.n91, label %for.end24, label %for.body9.preheader95

for.body9.preheader95:                            ; preds = %for.body9.preheader, %middle.block90
  %indvars.iv72.ph = phi i64 [ 0, %for.body9.preheader ], [ %n.vec82, %middle.block90 ]
  %fail.269.ph = phi i32 [ %fail.0.lcssa, %for.body9.preheader ], [ %68, %middle.block90 ]
  br label %for.body9

for.body:                                         ; preds = %for.body.preheader96, %_Z11percentDiffdd.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit ], [ %indvars.iv.ph, %for.body.preheader96 ]
  %fail.066 = phi i32 [ %fail.1, %_Z11percentDiffdd.exit ], [ %fail.066.ph, %for.body.preheader96 ]
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %q, i64 %indvars.iv
  %69 = load float, ptr %arrayidx, align 4, !tbaa !10
  %conv = fpext float %69 to double
  %arrayidx2 = getelementptr inbounds nuw [4 x i8], ptr %q_outputFromGpu, i64 %indvars.iv
  %70 = load float, ptr %arrayidx2, align 4, !tbaa !10
  %conv3 = fpext float %70 to double
  %cmp.i.i = fcmp olt double %conv, f0xB690000000000000
  %mul.i.i = fneg float %69
  %retval.0.i.i = select i1 %cmp.i.i, float %mul.i.i, float %69
  %conv1.i = fpext float %retval.0.i.i to double
  %cmp.i = fcmp olt double %conv1.i, 1.000000e-02
  br i1 %cmp.i, label %land.lhs.true.i, label %if.else.i

land.lhs.true.i:                                  ; preds = %for.body
  %cmp.i14.i = fcmp olt double %conv3, f0xB690000000000000
  %mul.i15.i = fneg float %70
  %retval.0.i16.i = select i1 %cmp.i14.i, float %mul.i15.i, float %70
  %conv4.i = fpext float %retval.0.i16.i to double
  %cmp5.i = fcmp olt double %conv4.i, 1.000000e-02
  br i1 %cmp5.i, label %_Z11percentDiffdd.exit, label %if.else.i

if.else.i:                                        ; preds = %land.lhs.true.i, %for.body
  %71 = insertelement <2 x double> poison, double %conv, i64 0
  %72 = shufflevector <2 x double> %71, <2 x double> poison, <2 x i32> zeroinitializer
  %73 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv3, i64 0
  %74 = fsub <2 x double> %72, %73
  %75 = fptrunc <2 x double> %74 to <2 x float>
  %76 = fcmp olt <2 x double> %74, splat (double f0xB690000000000000)
  %77 = fneg <2 x float> %75
  %78 = select <2 x i1> %76, <2 x float> %77, <2 x float> %75
  %79 = extractelement <2 x float> %78, i64 0
  %80 = extractelement <2 x float> %78, i64 1
  %div.i = fdiv float %79, %80
  %cmp.i23.i = fcmp olt float %div.i, 0.000000e+00
  %mul.i24.i = fneg float %div.i
  %retval.0.i25.i = select i1 %cmp.i23.i, float %mul.i24.i, float %div.i
  %mul.i = fmul float %retval.0.i25.i, 1.000000e+02
  %81 = fcmp ogt float %mul.i, 5.000000e-01
  %82 = zext i1 %81 to i32
  br label %_Z11percentDiffdd.exit

_Z11percentDiffdd.exit:                           ; preds = %land.lhs.true.i, %if.else.i
  %retval.0.i = phi i32 [ %82, %if.else.i ], [ 0, %land.lhs.true.i ]
  %fail.1 = add nuw nsw i32 %retval.0.i, %fail.066
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond7.preheader, label %for.body, !llvm.loop !24

for.body9:                                        ; preds = %for.body9.preheader95, %_Z11percentDiffdd.exit63
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %_Z11percentDiffdd.exit63 ], [ %indvars.iv72.ph, %for.body9.preheader95 ]
  %fail.269 = phi i32 [ %fail.3, %_Z11percentDiffdd.exit63 ], [ %fail.269.ph, %for.body9.preheader95 ]
  %arrayidx11 = getelementptr inbounds nuw [4 x i8], ptr %s, i64 %indvars.iv72
  %83 = load float, ptr %arrayidx11, align 4, !tbaa !10
  %conv12 = fpext float %83 to double
  %arrayidx14 = getelementptr inbounds nuw [4 x i8], ptr %s_outputFromGpu, i64 %indvars.iv72
  %84 = load float, ptr %arrayidx14, align 4, !tbaa !10
  %conv15 = fpext float %84 to double
  %cmp.i.i35 = fcmp olt double %conv12, f0xB690000000000000
  %mul.i.i36 = fneg float %83
  %retval.0.i.i37 = select i1 %cmp.i.i35, float %mul.i.i36, float %83
  %conv1.i38 = fpext float %retval.0.i.i37 to double
  %cmp.i39 = fcmp olt double %conv1.i38, 1.000000e-02
  br i1 %cmp.i39, label %land.lhs.true.i57, label %if.else.i40

land.lhs.true.i57:                                ; preds = %for.body9
  %cmp.i14.i58 = fcmp olt double %conv15, f0xB690000000000000
  %mul.i15.i59 = fneg float %84
  %retval.0.i16.i60 = select i1 %cmp.i14.i58, float %mul.i15.i59, float %84
  %conv4.i61 = fpext float %retval.0.i16.i60 to double
  %cmp5.i62 = fcmp olt double %conv4.i61, 1.000000e-02
  br i1 %cmp5.i62, label %_Z11percentDiffdd.exit63, label %if.else.i40

if.else.i40:                                      ; preds = %land.lhs.true.i57, %for.body9
  %85 = insertelement <2 x double> poison, double %conv12, i64 0
  %86 = shufflevector <2 x double> %85, <2 x double> poison, <2 x i32> zeroinitializer
  %87 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv15, i64 0
  %88 = fsub <2 x double> %86, %87
  %89 = fptrunc <2 x double> %88 to <2 x float>
  %90 = fcmp olt <2 x double> %88, splat (double f0xB690000000000000)
  %91 = fneg <2 x float> %89
  %92 = select <2 x i1> %90, <2 x float> %91, <2 x float> %89
  %93 = extractelement <2 x float> %92, i64 0
  %94 = extractelement <2 x float> %92, i64 1
  %div.i51 = fdiv float %93, %94
  %cmp.i23.i52 = fcmp olt float %div.i51, 0.000000e+00
  %mul.i24.i53 = fneg float %div.i51
  %retval.0.i25.i54 = select i1 %cmp.i23.i52, float %mul.i24.i53, float %div.i51
  %mul.i55 = fmul float %retval.0.i25.i54, 1.000000e+02
  %95 = fcmp ogt float %mul.i55, 5.000000e-01
  %96 = zext i1 %95 to i32
  br label %_Z11percentDiffdd.exit63

_Z11percentDiffdd.exit63:                         ; preds = %land.lhs.true.i57, %if.else.i40
  %retval.0.i56 = phi i32 [ %96, %if.else.i40 ], [ 0, %land.lhs.true.i57 ]
  %fail.3 = add nsw i32 %retval.0.i56, %fail.269
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond76.not = icmp eq i64 %indvars.iv.next73, %wide.trip.count75
  br i1 %exitcond76.not, label %for.end24, label %for.body9, !llvm.loop !25

for.end24:                                        ; preds = %_Z11percentDiffdd.exit63, %middle.block90, %for.cond7.preheader
  %fail.2.lcssa = phi i32 [ %fail.0.lcssa, %for.cond7.preheader ], [ %68, %middle.block90 ], [ %fail.3, %_Z11percentDiffdd.exit63 ]
  %call25 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-01, i32 noundef %fail.2.lcssa) #15
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #5 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp) #16
  %call = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp, i32 noundef 0) #15
  %call1 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp) #15
  %call2 = call i32 @cudaSetDevice(i32 noundef 0) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp) #16
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #6

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z27__device_stub__bicg_kernel1iiPfS_S_(i32 noundef %nx, i32 noundef %ny, ptr noundef %A, ptr noundef %r, ptr noundef %s) #7 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %r.addr = alloca ptr, align 8
  %s.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %nx, ptr %nx.addr, align 4, !tbaa !26
  store i32 %ny, ptr %ny.addr, align 4, !tbaa !26
  store ptr %A, ptr %A.addr, align 8, !tbaa !27
  store ptr %r, ptr %r.addr, align 8, !tbaa !27
  store ptr %s, ptr %s.addr, align 8, !tbaa !27
  %kernel_args1 = alloca [5 x ptr], align 16
  store ptr %nx.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %ny.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %A.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %r.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %s.addr, ptr %3, align 16
  %4 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %5 = load i64, ptr %shmem_size, align 8
  %6 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__bicg_kernel1iiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %5, ptr noundef %6)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z27__device_stub__bicg_kernel2iiPfS_S_(i32 noundef %nx, i32 noundef %ny, ptr noundef %A, ptr noundef %p, ptr noundef %q) #7 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %p.addr = alloca ptr, align 8
  %q.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %nx, ptr %nx.addr, align 4, !tbaa !26
  store i32 %ny, ptr %ny.addr, align 4, !tbaa !26
  store ptr %A, ptr %A.addr, align 8, !tbaa !27
  store ptr %p, ptr %p.addr, align 8, !tbaa !27
  store ptr %q, ptr %q.addr, align 8, !tbaa !27
  %kernel_args1 = alloca [5 x ptr], align 16
  store ptr %nx.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %ny.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %A.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %p.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %q.addr, ptr %3, align 16
  %4 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %5 = load i64, ptr %shmem_size, align 8
  %6 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__bicg_kernel2iiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %5, ptr noundef %6)
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z8bicg_cpuiiPA4096_fPfS1_S1_S1_(i32 noundef %nx, i32 noundef %ny, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %r, ptr nofree noundef captures(none) %s, ptr nofree noundef readonly captures(none) %p, ptr nofree noundef captures(none) %q) local_unnamed_addr #8 {
entry:
  %cmp57 = icmp sgt i32 %ny, 0
  br i1 %cmp57, label %for.cond1.preheader, label %for.cond1.preheader.thread

for.cond1.preheader:                              ; preds = %entry
  %0 = zext nneg i32 %ny to i64
  %1 = shl nuw nsw i64 %0, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %s, i8 0, i64 %1, i1 false), !tbaa !10
  %cmp261 = icmp sgt i32 %nx, 0
  br i1 %cmp261, label %for.body3.us.preheader, label %for.end34

for.cond1.preheader.thread:                       ; preds = %entry
  %cmp26172 = icmp sgt i32 %nx, 0
  br i1 %cmp26172, label %for.body3.preheader, label %for.end34

for.body3.preheader:                              ; preds = %for.cond1.preheader.thread
  %2 = zext nneg i32 %nx to i64
  %3 = shl nuw nsw i64 %2, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %q, i8 0, i64 %3, i1 false), !tbaa !10
  br label %for.end34

for.body3.us.preheader:                           ; preds = %for.cond1.preheader
  %wide.trip.count70 = zext nneg i32 %nx to i64
  %wide.trip.count = zext nneg i32 %ny to i64
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond6.for.inc32_crit_edge.us
  %indvars.iv67 = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next68, %for.cond6.for.inc32_crit_edge.us ]
  %arrayidx5.us = getelementptr inbounds nuw [4 x i8], ptr %q, i64 %indvars.iv67
  store float 0.000000e+00, ptr %arrayidx5.us, align 4, !tbaa !10
  %arrayidx12.us = getelementptr inbounds nuw [4 x i8], ptr %r, i64 %indvars.iv67
  %arrayidx14.us = getelementptr inbounds nuw [16384 x i8], ptr %A, i64 %indvars.iv67
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body3.us, %for.body8.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.body8.us ]
  %arrayidx10.us = getelementptr inbounds nuw [4 x i8], ptr %s, i64 %indvars.iv
  %4 = load float, ptr %arrayidx10.us, align 4, !tbaa !10
  %5 = load float, ptr %arrayidx12.us, align 4, !tbaa !10
  %arrayidx16.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14.us, i64 %indvars.iv
  %6 = load float, ptr %arrayidx16.us, align 4, !tbaa !10
  %7 = tail call float @llvm.fmuladd.f32(float %5, float %6, float %4)
  store float %7, ptr %arrayidx10.us, align 4, !tbaa !10
  %8 = load float, ptr %arrayidx5.us, align 4, !tbaa !10
  %9 = load float, ptr %arrayidx16.us, align 4, !tbaa !10
  %arrayidx26.us = getelementptr inbounds nuw [4 x i8], ptr %p, i64 %indvars.iv
  %10 = load float, ptr %arrayidx26.us, align 4, !tbaa !10
  %11 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %8)
  store float %11, ptr %arrayidx5.us, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond6.for.inc32_crit_edge.us, label %for.body8.us, !llvm.loop !30

for.cond6.for.inc32_crit_edge.us:                 ; preds = %for.body8.us
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond71.not = icmp eq i64 %indvars.iv.next68, %wide.trip.count70
  br i1 %exitcond71.not, label %for.end34, label %for.body3.us, !llvm.loop !31

for.end34:                                        ; preds = %for.cond6.for.inc32_crit_edge.us, %for.cond1.preheader.thread, %for.body3.preheader, %for.cond1.preheader
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #9

; Function Attrs: mustprogress uwtable
define dso_local void @_Z8bicgCudaiiPA4096_fPfS1_S1_S1_S1_S1_(i32 noundef %nx, i32 noundef %ny, ptr noundef %A, ptr noundef %r, ptr noundef %s, ptr noundef %p, ptr noundef %q, ptr noundef %s_outputFromGpu, ptr noundef %q_outputFromGpu) local_unnamed_addr #5 {
entry:
  %Tp.i.i58 = alloca %struct.timeval, align 8
  %nx.addr.i43 = alloca i32, align 4
  %ny.addr.i44 = alloca i32, align 4
  %A.addr.i45 = alloca ptr, align 8
  %p.addr.i = alloca ptr, align 8
  %q.addr.i = alloca ptr, align 8
  %grid_dim.i46 = alloca %struct.dim3, align 8
  %block_dim.i47 = alloca %struct.dim3, align 8
  %shmem_size.i48 = alloca i64, align 8
  %stream.i49 = alloca ptr, align 8
  %kernel_args1.i50 = alloca [5 x ptr], align 16
  %nx.addr.i = alloca i32, align 4
  %ny.addr.i = alloca i32, align 4
  %A.addr.i = alloca ptr, align 8
  %r.addr.i = alloca ptr, align 8
  %s.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [5 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %A_gpu = alloca ptr, align 8
  %q_gpu = alloca ptr, align 8
  %p_gpu = alloca ptr, align 8
  %r_gpu = alloca ptr, align 8
  %s_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %q_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %p_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %r_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %s_gpu) #16
  %call = call i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 67108864) #15
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %r_gpu, i64 noundef 16384) #15
  %call2 = call i32 @cudaMalloc(ptr noundef nonnull %s_gpu, i64 noundef 16384) #15
  %call3 = call i32 @cudaMalloc(ptr noundef nonnull %p_gpu, i64 noundef 16384) #15
  %call4 = call i32 @cudaMalloc(ptr noundef nonnull %q_gpu, i64 noundef 16384) #15
  %0 = load ptr, ptr %A_gpu, align 8, !tbaa !27
  %call5 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 67108864, i32 noundef 1) #15
  %1 = load ptr, ptr %r_gpu, align 8, !tbaa !27
  %call6 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %r, i64 noundef 16384, i32 noundef 1) #15
  %2 = load ptr, ptr %s_gpu, align 8, !tbaa !27
  %call7 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %s, i64 noundef 16384, i32 noundef 1) #15
  %3 = load ptr, ptr %p_gpu, align 8, !tbaa !27
  %call8 = call i32 @cudaMemcpy(ptr noundef %3, ptr noundef %p, i64 noundef 16384, i32 noundef 1) #15
  %4 = load ptr, ptr %q_gpu, align 8, !tbaa !27
  %call9 = call i32 @cudaMemcpy(ptr noundef %4, ptr noundef %q, i64 noundef 16384, i32 noundef 1) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #16
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #15
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %5 = load i64, ptr %Tp.i.i, align 8, !tbaa !32
  %conv.i.i = sitofp i64 %5 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %6 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !35
  %conv2.i.i = sitofp i64 %6 to double
  %7 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #16
  store double %7, ptr @polybench_t_start, align 8, !tbaa !36
  %call20 = call i32 @__cudaPushCallConfiguration(i64 4294967312, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool.not = icmp eq i32 %call20, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %8 = load ptr, ptr %A_gpu, align 8, !tbaa !27
  %9 = load ptr, ptr %r_gpu, align 8, !tbaa !27
  %10 = load ptr, ptr %s_gpu, align 8, !tbaa !27
  call void @llvm.lifetime.start.p0(ptr nonnull %nx.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %ny.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %r.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %s.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %nx, ptr %nx.addr.i, align 4, !tbaa !26
  store i32 %ny, ptr %ny.addr.i, align 4, !tbaa !26
  store ptr %8, ptr %A.addr.i, align 8, !tbaa !27
  store ptr %9, ptr %r.addr.i, align 8, !tbaa !27
  store ptr %10, ptr %s.addr.i, align 8, !tbaa !27
  store ptr %nx.addr.i, ptr %kernel_args1.i, align 16
  %11 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %ny.addr.i, ptr %11, align 8
  %12 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %A.addr.i, ptr %12, align 16
  %13 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %r.addr.i, ptr %13, align 8
  %14 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 32
  store ptr %s.addr.i, ptr %14, align 16
  %15 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !38
  %16 = load i64, ptr %shmem_size.i, align 8
  %17 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__bicg_kernel1iiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %16, ptr noundef %17), !inline_history !38
  call void @llvm.lifetime.end.p0(ptr nonnull %nx.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %ny.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %r.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %s.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %_Z21polybench_timer_startv.exit
  %call21 = call i32 @cudaThreadSynchronize() #15
  %call24 = call i32 @__cudaPushCallConfiguration(i64 4294967312, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool25.not = icmp eq i32 %call24, 0
  br i1 %tobool25.not, label %kcall.configok26, label %kcall.end27

kcall.configok26:                                 ; preds = %kcall.end
  %18 = load ptr, ptr %A_gpu, align 8, !tbaa !27
  %19 = load ptr, ptr %p_gpu, align 8, !tbaa !27
  %20 = load ptr, ptr %q_gpu, align 8, !tbaa !27
  call void @llvm.lifetime.start.p0(ptr nonnull %nx.addr.i43)
  call void @llvm.lifetime.start.p0(ptr nonnull %ny.addr.i44)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i45)
  call void @llvm.lifetime.start.p0(ptr nonnull %p.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %q.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i46)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i47)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i48)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i49)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i50)
  store i32 %nx, ptr %nx.addr.i43, align 4, !tbaa !26
  store i32 %ny, ptr %ny.addr.i44, align 4, !tbaa !26
  store ptr %18, ptr %A.addr.i45, align 8, !tbaa !27
  store ptr %19, ptr %p.addr.i, align 8, !tbaa !27
  store ptr %20, ptr %q.addr.i, align 8, !tbaa !27
  store ptr %nx.addr.i43, ptr %kernel_args1.i50, align 16
  %21 = getelementptr inbounds nuw i8, ptr %kernel_args1.i50, i64 8
  store ptr %ny.addr.i44, ptr %21, align 8
  %22 = getelementptr inbounds nuw i8, ptr %kernel_args1.i50, i64 16
  store ptr %A.addr.i45, ptr %22, align 16
  %23 = getelementptr inbounds nuw i8, ptr %kernel_args1.i50, i64 24
  store ptr %p.addr.i, ptr %23, align 8
  %24 = getelementptr inbounds nuw i8, ptr %kernel_args1.i50, i64 32
  store ptr %q.addr.i, ptr %24, align 16
  %25 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i46, ptr nonnull %block_dim.i47, ptr nonnull %shmem_size.i48, ptr nonnull %stream.i49), !inline_history !39
  %26 = load i64, ptr %shmem_size.i48, align 8
  %27 = load ptr, ptr %stream.i49, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i51 = load i64, ptr %grid_dim.i46, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i52 = getelementptr inbounds nuw i8, ptr %grid_dim.i46, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i53 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i52, align 8
  %block_dim.coerce.sroa.0.0.copyload.i54 = load i64, ptr %block_dim.i47, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i55 = getelementptr inbounds nuw i8, ptr %block_dim.i47, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i56 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i55, align 8
  %call.i57 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__bicg_kernel2iiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i51, i32 %grid_dim.coerce.sroa.2.0.copyload.i53, i64 %block_dim.coerce.sroa.0.0.copyload.i54, i32 %block_dim.coerce.sroa.2.0.copyload.i56, ptr noundef nonnull %kernel_args1.i50, i64 noundef %26, ptr noundef %27), !inline_history !39
  call void @llvm.lifetime.end.p0(ptr nonnull %nx.addr.i43)
  call void @llvm.lifetime.end.p0(ptr nonnull %ny.addr.i44)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i45)
  call void @llvm.lifetime.end.p0(ptr nonnull %p.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %q.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i46)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i47)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i48)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i49)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i50)
  br label %kcall.end27

kcall.end27:                                      ; preds = %kcall.configok26, %kcall.end
  %call28 = call i32 @cudaThreadSynchronize() #15
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i58) #16
  %call.i.i59 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i58, ptr noundef null) #17
  %cmp.not.i.i60 = icmp eq i32 %call.i.i59, 0
  br i1 %cmp.not.i.i60, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i61

if.then.i.i61:                                    ; preds = %kcall.end27
  %call1.i.i62 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i59) #15
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end27, %if.then.i.i61
  %28 = load i64, ptr %Tp.i.i58, align 8, !tbaa !32
  %conv.i.i63 = sitofp i64 %28 to double
  %tv_usec.i.i64 = getelementptr inbounds nuw i8, ptr %Tp.i.i58, i64 8
  %29 = load i64, ptr %tv_usec.i.i64, align 8, !tbaa !35
  %conv2.i.i65 = sitofp i64 %29 to double
  %30 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i65, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i63)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i58) #16
  store double %30, ptr @polybench_t_end, align 8, !tbaa !36
  %31 = load double, ptr @polybench_t_start, align 8, !tbaa !36
  %sub.i = fsub double %30, %31
  %call.i66 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #15
  %32 = load ptr, ptr %s_gpu, align 8, !tbaa !27
  %call30 = call i32 @cudaMemcpy(ptr noundef %s_outputFromGpu, ptr noundef %32, i64 noundef 16384, i32 noundef 2) #15
  %33 = load ptr, ptr %q_gpu, align 8, !tbaa !27
  %call31 = call i32 @cudaMemcpy(ptr noundef %q_outputFromGpu, ptr noundef %33, i64 noundef 16384, i32 noundef 2) #15
  %34 = load ptr, ptr %A_gpu, align 8, !tbaa !27
  %call32 = call i32 @cudaFree(ptr noundef %34) #15
  %35 = load ptr, ptr %r_gpu, align 8, !tbaa !27
  %call33 = call i32 @cudaFree(ptr noundef %35) #15
  %36 = load ptr, ptr %s_gpu, align 8, !tbaa !27
  %call34 = call i32 @cudaFree(ptr noundef %36) #15
  %37 = load ptr, ptr %p_gpu, align 8, !tbaa !27
  %call35 = call i32 @cudaFree(ptr noundef %37) #15
  %38 = load ptr, ptr %q_gpu, align 8, !tbaa !27
  %call36 = call i32 @cudaFree(ptr noundef %38) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %s_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %r_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %p_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %q_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %A_gpu) #16
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #6

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #3 {
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !32
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !35
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #16
  store double %2, ptr @polybench_t_start, align 8, !tbaa !36
  ret void
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #6

declare i32 @cudaThreadSynchronize() local_unnamed_addr #6

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #3 {
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !32
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !35
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #16
  store double %2, ptr @polybench_t_end, align 8, !tbaa !36
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #3 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !36
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !36
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #15
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #6

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #7 {
entry:
  %Tp.i.i98 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i86 = alloca ptr, align 8
  %newA.i.i79 = alloca ptr, align 8
  %newA.i.i72 = alloca ptr, align 8
  %newA.i.i65 = alloca ptr, align 8
  %newA.i.i58 = alloca ptr, align 8
  %newA.i.i51 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #16
  store ptr null, ptr %newA.i.i, align 8, !tbaa !40
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 67108864) #17
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !40
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !41
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i51) #16
  store ptr null, ptr %newA.i.i51, align 8, !tbaa !40
  %call.i.i52 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i51, i64 noundef 32, i64 noundef 16384) #17
  %3 = load ptr, ptr %newA.i.i51, align 8, !tbaa !40
  %tobool.i.i53 = icmp eq ptr %3, null
  %tobool1.i.i54 = icmp ne i32 %call.i.i52, 0
  %or.cond.i.i55 = select i1 %tobool.i.i53, i1 true, i1 %tobool1.i.i54
  br i1 %or.cond.i.i55, label %if.then.i.i56, label %_Z20polybench_alloc_datayi.exit57

if.then.i.i56:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !41
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit57:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i51) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i58) #16
  store ptr null, ptr %newA.i.i58, align 8, !tbaa !40
  %call.i.i59 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i58, i64 noundef 32, i64 noundef 16384) #17
  %6 = load ptr, ptr %newA.i.i58, align 8, !tbaa !40
  %tobool.i.i60 = icmp eq ptr %6, null
  %tobool1.i.i61 = icmp ne i32 %call.i.i59, 0
  %or.cond.i.i62 = select i1 %tobool.i.i60, i1 true, i1 %tobool1.i.i61
  br i1 %or.cond.i.i62, label %if.then.i.i63, label %_Z20polybench_alloc_datayi.exit64

if.then.i.i63:                                    ; preds = %_Z20polybench_alloc_datayi.exit57
  %7 = load ptr, ptr @stderr, align 8, !tbaa !41
  %8 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %7) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit64:                ; preds = %_Z20polybench_alloc_datayi.exit57
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i58) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i65) #16
  store ptr null, ptr %newA.i.i65, align 8, !tbaa !40
  %call.i.i66 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i65, i64 noundef 32, i64 noundef 16384) #17
  %9 = load ptr, ptr %newA.i.i65, align 8, !tbaa !40
  %tobool.i.i67 = icmp eq ptr %9, null
  %tobool1.i.i68 = icmp ne i32 %call.i.i66, 0
  %or.cond.i.i69 = select i1 %tobool.i.i67, i1 true, i1 %tobool1.i.i68
  br i1 %or.cond.i.i69, label %if.then.i.i70, label %_Z20polybench_alloc_datayi.exit71

if.then.i.i70:                                    ; preds = %_Z20polybench_alloc_datayi.exit64
  %10 = load ptr, ptr @stderr, align 8, !tbaa !41
  %11 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %10) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit71:                ; preds = %_Z20polybench_alloc_datayi.exit64
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i65) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i72) #16
  store ptr null, ptr %newA.i.i72, align 8, !tbaa !40
  %call.i.i73 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i72, i64 noundef 32, i64 noundef 16384) #17
  %12 = load ptr, ptr %newA.i.i72, align 8, !tbaa !40
  %tobool.i.i74 = icmp eq ptr %12, null
  %tobool1.i.i75 = icmp ne i32 %call.i.i73, 0
  %or.cond.i.i76 = select i1 %tobool.i.i74, i1 true, i1 %tobool1.i.i75
  br i1 %or.cond.i.i76, label %if.then.i.i77, label %_Z20polybench_alloc_datayi.exit78

if.then.i.i77:                                    ; preds = %_Z20polybench_alloc_datayi.exit71
  %13 = load ptr, ptr @stderr, align 8, !tbaa !41
  %14 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %13) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit78:                ; preds = %_Z20polybench_alloc_datayi.exit71
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i72) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i79) #16
  store ptr null, ptr %newA.i.i79, align 8, !tbaa !40
  %call.i.i80 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i79, i64 noundef 32, i64 noundef 16384) #17
  %15 = load ptr, ptr %newA.i.i79, align 8, !tbaa !40
  %tobool.i.i81 = icmp eq ptr %15, null
  %tobool1.i.i82 = icmp ne i32 %call.i.i80, 0
  %or.cond.i.i83 = select i1 %tobool.i.i81, i1 true, i1 %tobool1.i.i82
  br i1 %or.cond.i.i83, label %if.then.i.i84, label %_Z20polybench_alloc_datayi.exit85

if.then.i.i84:                                    ; preds = %_Z20polybench_alloc_datayi.exit78
  %16 = load ptr, ptr @stderr, align 8, !tbaa !41
  %17 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %16) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit85:                ; preds = %_Z20polybench_alloc_datayi.exit78
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i79) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i86) #16
  store ptr null, ptr %newA.i.i86, align 8, !tbaa !40
  %call.i.i87 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i86, i64 noundef 32, i64 noundef 16384) #17
  %18 = load ptr, ptr %newA.i.i86, align 8, !tbaa !40
  %tobool.i.i88 = icmp eq ptr %18, null
  %tobool1.i.i89 = icmp ne i32 %call.i.i87, 0
  %or.cond.i.i90 = select i1 %tobool.i.i88, i1 true, i1 %tobool1.i.i89
  br i1 %or.cond.i.i90, label %if.then.i.i91, label %_Z20polybench_alloc_datayi.exit92

if.then.i.i91:                                    ; preds = %_Z20polybench_alloc_datayi.exit85
  %19 = load ptr, ptr @stderr, align 8, !tbaa !41
  %20 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %19) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit92:                ; preds = %_Z20polybench_alloc_datayi.exit85
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i86) #16
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %_Z20polybench_alloc_datayi.exit92
  %index = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit92 ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %_Z20polybench_alloc_datayi.exit92 ], [ %vec.ind.next.1, %vector.body ]
  %21 = uitofp nneg <4 x i32> %vec.ind to <4 x double>
  %22 = fmul nnan <4 x double> %21, splat (double f0x400921FB54442D18)
  %23 = fptrunc <4 x double> %22 to <4 x float>
  %24 = getelementptr inbounds nuw [4 x i8], ptr %9, i64 %index
  store <4 x float> %23, ptr %24, align 4, !tbaa !10
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %25 = uitofp nneg <4 x i32> %vec.ind.next to <4 x double>
  %26 = fmul nnan <4 x double> %25, splat (double f0x400921FB54442D18)
  %27 = fptrunc <4 x double> %26 to <4 x float>
  %28 = getelementptr inbounds nuw [4 x i8], ptr %9, i64 %index
  %29 = getelementptr inbounds nuw i8, ptr %28, i64 16
  store <4 x float> %27, ptr %29, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 8
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 8)
  %30 = icmp eq i64 %index.next.1, 4096
  br i1 %30, label %for.body4.us.i, label %vector.body, !llvm.loop !43

for.body4.us.i:                                   ; preds = %vector.body, %for.cond10.for.inc23_crit_edge.us.i
  %indvars.iv57.i = phi i64 [ %indvars.iv.next58.i, %for.cond10.for.inc23_crit_edge.us.i ], [ 0, %vector.body ]
  %31 = trunc nuw nsw i64 %indvars.iv57.i to i32
  %conv5.us.i = uitofp nneg i32 %31 to double
  %mul6.us.i = fmul nnan double %conv5.us.i, f0x400921FB54442D18
  %conv7.us.i = fptrunc double %mul6.us.i to float
  %arrayidx9.us.i = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %indvars.iv57.i
  store float %conv7.us.i, ptr %arrayidx9.us.i, align 4, !tbaa !10
  %arrayidx17.us.i = getelementptr inbounds nuw [16384 x i8], ptr %0, i64 %indvars.iv57.i
  %conv13.us.i = uitofp nneg i32 %31 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv13.us.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body114

vector.body114:                                   ; preds = %vector.body114, %for.body4.us.i
  %index115 = phi i64 [ 0, %for.body4.us.i ], [ %index.next117.1, %vector.body114 ]
  %vec.ind116 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.body4.us.i ], [ %vec.ind.next118.1, %vector.body114 ]
  %step.add = add <4 x i32> %vec.ind116, splat (i32 4)
  %32 = uitofp nneg <4 x i32> %vec.ind116 to <4 x float>
  %33 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %34 = fmul nnan <4 x float> %broadcast.splat, %32
  %35 = fmul nnan <4 x float> %broadcast.splat, %33
  %36 = fmul nnan <4 x float> %34, splat (float f0x39800000)
  %37 = fmul nnan <4 x float> %35, splat (float f0x39800000)
  %38 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us.i, i64 %index115
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 16
  store <4 x float> %36, ptr %38, align 4, !tbaa !10
  store <4 x float> %37, ptr %39, align 4, !tbaa !10
  %vec.ind.next118 = add <4 x i32> %vec.ind116, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind116, splat (i32 12)
  %40 = uitofp nneg <4 x i32> %vec.ind.next118 to <4 x float>
  %41 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %42 = fmul nnan <4 x float> %broadcast.splat, %40
  %43 = fmul nnan <4 x float> %broadcast.splat, %41
  %44 = fmul nnan <4 x float> %42, splat (float f0x39800000)
  %45 = fmul nnan <4 x float> %43, splat (float f0x39800000)
  %46 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us.i, i64 %index115
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 32
  %48 = getelementptr inbounds nuw i8, ptr %46, i64 48
  store <4 x float> %44, ptr %47, align 4, !tbaa !10
  store <4 x float> %45, ptr %48, align 4, !tbaa !10
  %index.next117.1 = add nuw nsw i64 %index115, 16
  %vec.ind.next118.1 = add <4 x i32> %vec.ind116, splat (i32 16)
  %49 = icmp eq i64 %index.next117.1, 4096
  br i1 %49, label %for.cond10.for.inc23_crit_edge.us.i, label %vector.body114, !llvm.loop !44

for.cond10.for.inc23_crit_edge.us.i:              ; preds = %vector.body114
  %indvars.iv.next58.i = add nuw nsw i64 %indvars.iv57.i, 1
  %exitcond61.not.i = icmp eq i64 %indvars.iv.next58.i, 4096
  br i1 %exitcond61.not.i, label %_Z10init_arrayiiPA4096_fPfS1_.exit, label %for.body4.us.i, !llvm.loop !19

_Z10init_arrayiiPA4096_fPfS1_.exit:               ; preds = %for.cond10.for.inc23_crit_edge.us.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #16
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #15
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #15
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #16
  call void @_Z8bicgCudaiiPA4096_fPfS1_S1_S1_S1_S1_(i32 noundef 4096, i32 noundef 4096, ptr noundef nonnull %0, ptr noundef nonnull %12, ptr noundef nonnull %3, ptr noundef nonnull %9, ptr noundef nonnull %6, ptr noundef nonnull %15, ptr noundef nonnull %18) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #16
  %call.i.i93 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i93, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i94

if.then.i.i94:                                    ; preds = %_Z10init_arrayiiPA4096_fPfS1_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i93) #15
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiiPA4096_fPfS1_.exit, %if.then.i.i94
  %50 = load i64, ptr %Tp.i.i, align 8, !tbaa !32
  %conv.i.i = sitofp i64 %50 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %51 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !35
  %conv2.i.i = sitofp i64 %51 to double
  %52 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #16
  store double %52, ptr @polybench_t_start, align 8, !tbaa !36
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(16384) %3, i8 0, i64 16384, i1 false), !tbaa !10
  br label %for.body3.us.i

for.body3.us.i:                                   ; preds = %for.cond6.for.inc32_crit_edge.us.i, %_Z21polybench_timer_startv.exit
  %indvars.iv67.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next68.i, %for.cond6.for.inc32_crit_edge.us.i ]
  %arrayidx5.us.i = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv67.i
  store float 0.000000e+00, ptr %arrayidx5.us.i, align 4, !tbaa !10
  %arrayidx12.us.i = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %indvars.iv67.i
  %arrayidx14.us.i = getelementptr inbounds nuw [16384 x i8], ptr %0, i64 %indvars.iv67.i
  br label %for.body8.us.i

for.body8.us.i:                                   ; preds = %for.body8.us.i, %for.body3.us.i
  %indvars.iv.i95 = phi i64 [ 0, %for.body3.us.i ], [ %indvars.iv.next.i96, %for.body8.us.i ]
  %arrayidx10.us.i = getelementptr inbounds nuw [4 x i8], ptr %3, i64 %indvars.iv.i95
  %53 = load float, ptr %arrayidx10.us.i, align 4, !tbaa !10
  %54 = load float, ptr %arrayidx12.us.i, align 4, !tbaa !10
  %arrayidx16.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14.us.i, i64 %indvars.iv.i95
  %55 = load float, ptr %arrayidx16.us.i, align 4, !tbaa !10
  %56 = call float @llvm.fmuladd.f32(float %54, float %55, float %53)
  store float %56, ptr %arrayidx10.us.i, align 4, !tbaa !10
  %57 = load float, ptr %arrayidx5.us.i, align 4, !tbaa !10
  %58 = load float, ptr %arrayidx16.us.i, align 4, !tbaa !10
  %arrayidx26.us.i = getelementptr inbounds nuw [4 x i8], ptr %9, i64 %indvars.iv.i95
  %59 = load float, ptr %arrayidx26.us.i, align 4, !tbaa !10
  %60 = call float @llvm.fmuladd.f32(float %58, float %59, float %57)
  store float %60, ptr %arrayidx5.us.i, align 4, !tbaa !10
  %indvars.iv.next.i96 = add nuw nsw i64 %indvars.iv.i95, 1
  %exitcond.not.i97 = icmp eq i64 %indvars.iv.next.i96, 4096
  br i1 %exitcond.not.i97, label %for.cond6.for.inc32_crit_edge.us.i, label %for.body8.us.i, !llvm.loop !30

for.cond6.for.inc32_crit_edge.us.i:               ; preds = %for.body8.us.i
  %indvars.iv.next68.i = add nuw nsw i64 %indvars.iv67.i, 1
  %exitcond71.not.i = icmp eq i64 %indvars.iv.next68.i, 4096
  br i1 %exitcond71.not.i, label %_Z8bicg_cpuiiPA4096_fPfS1_S1_S1_.exit, label %for.body3.us.i, !llvm.loop !31

_Z8bicg_cpuiiPA4096_fPfS1_S1_S1_.exit:            ; preds = %for.cond6.for.inc32_crit_edge.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i98) #16
  %call.i.i99 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i98, ptr noundef null) #17
  %cmp.not.i.i100 = icmp eq i32 %call.i.i99, 0
  br i1 %cmp.not.i.i100, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i101

if.then.i.i101:                                   ; preds = %_Z8bicg_cpuiiPA4096_fPfS1_S1_S1_.exit
  %call1.i.i102 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i99) #15
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z8bicg_cpuiiPA4096_fPfS1_S1_S1_.exit, %if.then.i.i101
  %61 = load i64, ptr %Tp.i.i98, align 8, !tbaa !32
  %conv.i.i103 = sitofp i64 %61 to double
  %tv_usec.i.i104 = getelementptr inbounds nuw i8, ptr %Tp.i.i98, i64 8
  %62 = load i64, ptr %tv_usec.i.i104, align 8, !tbaa !35
  %conv2.i.i105 = sitofp i64 %62 to double
  %63 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i105, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i103)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i98) #16
  store double %63, ptr @polybench_t_end, align 8, !tbaa !36
  %64 = load double, ptr @polybench_t_start, align 8, !tbaa !36
  %sub.i = fsub double %63, %64
  %call.i106 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #15
  call void @_Z14compareResultsiiPfS_S_S_(i32 noundef 4096, i32 noundef 4096, ptr noundef nonnull %3, ptr noundef nonnull %15, ptr noundef nonnull %6, ptr noundef nonnull %18) #15
  call void @free(ptr noundef nonnull %0) #17
  call void @free(ptr noundef nonnull %12) #17
  call void @free(ptr noundef nonnull %3) #17
  call void @free(ptr noundef nonnull %9) #17
  call void @free(ptr noundef nonnull %6) #17
  call void @free(ptr noundef %15) #17
  call void @free(ptr noundef %18) #17
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #3 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #16
  store ptr null, ptr %newA.i, align 8, !tbaa !40
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #17
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !40
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !41
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
declare noundef i32 @gettimeofday(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #9

; Function Attrs: nofree nounwind
declare i32 @posix_memalign(ptr noundef, i64 noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: nofree noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #12

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #14

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #4 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #5 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #6 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #7 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #8 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #9 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #11 = { nofree noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #12 = { nofree nounwind }
attributes #13 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
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
!16 = distinct !{!16, !13, !14, !15}
!17 = distinct !{!17, !13, !14, !15}
!18 = distinct !{!18, !13, !15, !14}
!19 = distinct !{!19, !13}
!20 = distinct !{!20, !13, !15, !14}
!21 = distinct !{!21, !13, !15, !14}
!22 = distinct !{!22, !13, !14, !15}
!23 = distinct !{!23, !13, !14, !15}
!24 = distinct !{!24, !13, !15, !14}
!25 = distinct !{!25, !13, !15, !14}
!26 = !{!7, !7, i64 0}
!27 = !{!28, !28, i64 0}
!28 = !{!"p1 float", !29, i64 0}
!29 = !{!"any pointer", !8, i64 0}
!30 = distinct !{!30, !13}
!31 = distinct !{!31, !13}
!32 = !{!33, !34, i64 0}
!33 = !{!"_ZTS7timeval", !34, i64 0, !34, i64 8}
!34 = !{!"long", !8, i64 0}
!35 = !{!33, !34, i64 8}
!36 = !{!37, !37, i64 0}
!37 = !{!"double", !8, i64 0}
!38 = !{ptr @_Z27__device_stub__bicg_kernel1iiPfS_S_}
!39 = !{ptr @_Z27__device_stub__bicg_kernel2iiPfS_S_}
!40 = !{!29, !29, i64 0}
!41 = !{!42, !42, i64 0}
!42 = !{!"p1 _ZTS8_IO_FILE", !29, i64 0}
!43 = distinct !{!43, !13, !14, !15}
!44 = distinct !{!44, !13, !14, !15}
