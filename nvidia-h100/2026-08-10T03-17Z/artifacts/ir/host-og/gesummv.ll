; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GESUMMV/gesummv.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GESUMMV/gesummv.cu"
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
define dso_local void @_Z7gesummviffPA4096_fS0_PfS1_S1_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef captures(none) %tmp, ptr nofree noundef readonly captures(none) %x, ptr nofree noundef captures(none) %y) local_unnamed_addr #1 {
entry:
  %cmp64 = icmp sgt i32 %n, 0
  br i1 %cmp64, label %for.body.us.preheader, label %for.end35

for.body.us.preheader:                            ; preds = %entry
  %wide.trip.count70 = zext nneg i32 %n to i64
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond3.for.end_crit_edge.us
  %indvars.iv67 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next68, %for.cond3.for.end_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [4 x i8], ptr %tmp, i64 %indvars.iv67
  store float 0.000000e+00, ptr %arrayidx.us, align 4, !tbaa !10
  %arrayidx2.us = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %indvars.iv67
  store float 0.000000e+00, ptr %arrayidx2.us, align 4, !tbaa !10
  %arrayidx7.us = getelementptr inbounds nuw [16384 x i8], ptr %A, i64 %indvars.iv67
  %arrayidx17.us = getelementptr inbounds nuw [16384 x i8], ptr %B, i64 %indvars.iv67
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.body.us, %for.body5.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.body5.us ]
  %arrayidx9.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us, i64 %indvars.iv
  %0 = load float, ptr %arrayidx9.us, align 4, !tbaa !10
  %arrayidx11.us = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv
  %1 = load float, ptr %arrayidx11.us, align 4, !tbaa !10
  %2 = load float, ptr %arrayidx.us, align 4, !tbaa !10
  %3 = tail call float @llvm.fmuladd.f32(float %0, float %1, float %2)
  store float %3, ptr %arrayidx.us, align 4, !tbaa !10
  %arrayidx19.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us, i64 %indvars.iv
  %4 = load float, ptr %arrayidx19.us, align 4, !tbaa !10
  %5 = load float, ptr %arrayidx11.us, align 4, !tbaa !10
  %6 = load float, ptr %arrayidx2.us, align 4, !tbaa !10
  %7 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %6)
  store float %7, ptr %arrayidx2.us, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count70
  br i1 %exitcond.not, label %for.cond3.for.end_crit_edge.us, label %for.body5.us, !llvm.loop !12

for.cond3.for.end_crit_edge.us:                   ; preds = %for.body5.us
  %8 = load float, ptr %arrayidx.us, align 4, !tbaa !10
  %mul30.us = fmul float %beta, %7
  %9 = tail call float @llvm.fmuladd.f32(float %alpha, float %8, float %mul30.us)
  store float %9, ptr %arrayidx2.us, align 4, !tbaa !10
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond71.not = icmp eq i64 %indvars.iv.next68, %wide.trip.count70
  br i1 %exitcond71.not, label %for.end35, label %for.body.us, !llvm.loop !14

for.end35:                                        ; preds = %for.cond3.for.end_crit_edge.us, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable
define dso_local void @_Z4initiPfS_PA4096_fS1_S_(i32 noundef %n, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %alpha, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %beta, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B, ptr nofree noundef writeonly captures(none) %x) local_unnamed_addr #4 {
entry:
  store float 4.353200e+04, ptr %alpha, align 4, !tbaa !10
  store float 1.231300e+04, ptr %beta, align 4, !tbaa !10
  %cmp39 = icmp sgt i32 %n, 0
  br i1 %cmp39, label %for.body.lr.ph, label %for.end22

for.body.lr.ph:                                   ; preds = %entry
  %B47 = ptrtoaddr ptr %B to i64
  %A48 = ptrtoaddr ptr %A to i64
  %conv14 = uitofp nneg i32 %n to float
  %wide.trip.count45 = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 4
  %0 = sub i64 %A48, %B47
  %diff.check = icmp ugt i64 %0, -16
  %or.cond = or i1 %min.iters.check, %diff.check
  %n.vec = and i64 %wide.trip.count45, 2147483644
  %broadcast.splatinsert49 = insertelement <4 x float> poison, float %conv14, i64 0
  %broadcast.splat50 = shufflevector <4 x float> %broadcast.splatinsert49, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count45
  %xtraiter = and i64 %wide.trip.count45, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %1 = add nsw i64 %wide.trip.count45, -1
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.inc20_crit_edge.us, %for.body.lr.ph
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.cond1.for.inc20_crit_edge.us ], [ 0, %for.body.lr.ph ]
  %2 = trunc nuw nsw i64 %indvars.iv42 to i32
  %conv.us = uitofp nneg i32 %2 to float
  %div.us = fmul nnan float %conv.us, f0x39800000
  %arrayidx.us = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv42
  store float %div.us, ptr %arrayidx.us, align 4, !tbaa !10
  %arrayidx8.us = getelementptr inbounds nuw [16384 x i8], ptr %A, i64 %indvars.iv42
  %arrayidx17.us = getelementptr inbounds nuw [16384 x i8], ptr %B, i64 %indvars.iv42
  br i1 %or.cond, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.body.us
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.us, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %3 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %4 = fmul nnan <4 x float> %broadcast.splat, %3
  %5 = fmul nnan <4 x float> %4, splat (float f0x39800000)
  %6 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx8.us, i64 %index
  store <4 x float> %5, ptr %6, align 4, !tbaa !10
  %7 = fdiv <4 x float> %4, %broadcast.splat50
  %8 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us, i64 %index
  store <4 x float> %7, ptr %8, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.us ], [ %n.vec, %middle.block ]
  br i1 %lcmp.mod.not, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.preheader
  %10 = trunc nuw nsw i64 %indvars.iv.ph to i32
  %conv5.us.prol = uitofp nneg i32 %10 to float
  %mul.us.prol = fmul nnan float %conv.us, %conv5.us.prol
  %div6.us.prol = fmul nnan float %mul.us.prol, f0x39800000
  %arrayidx10.us.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx8.us, i64 %indvars.iv.ph
  store float %div6.us.prol, ptr %arrayidx10.us.prol, align 4, !tbaa !10
  %div15.us.prol = fdiv float %mul.us.prol, %conv14
  %arrayidx19.us.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us, i64 %indvars.iv.ph
  store float %div15.us.prol, ptr %arrayidx19.us.prol, align 4, !tbaa !10
  %indvars.iv.next.prol = or disjoint i64 %indvars.iv.ph, 1
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.body3.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body3.us.preheader ], [ %indvars.iv.next.prol, %for.body3.us.prol ]
  %11 = icmp eq i64 %indvars.iv.ph, %1
  br i1 %11, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.prol.loopexit, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us ], [ %indvars.iv.unr, %for.body3.us.prol.loopexit ]
  %12 = trunc nuw nsw i64 %indvars.iv to i32
  %conv5.us = uitofp nneg i32 %12 to float
  %mul.us = fmul nnan float %conv.us, %conv5.us
  %div6.us = fmul nnan float %mul.us, f0x39800000
  %arrayidx10.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx8.us, i64 %indvars.iv
  store float %div6.us, ptr %arrayidx10.us, align 4, !tbaa !10
  %div15.us = fdiv float %mul.us, %conv14
  %arrayidx19.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us, i64 %indvars.iv
  store float %div15.us, ptr %arrayidx19.us, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = trunc nuw nsw i64 %indvars.iv.next to i32
  %conv5.us.1 = uitofp nneg i32 %13 to float
  %mul.us.1 = fmul nnan float %conv.us, %conv5.us.1
  %div6.us.1 = fmul nnan float %mul.us.1, f0x39800000
  %arrayidx10.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx8.us, i64 %indvars.iv.next
  store float %div6.us.1, ptr %arrayidx10.us.1, align 4, !tbaa !10
  %div15.us.1 = fdiv float %mul.us.1, %conv14
  %arrayidx19.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us, i64 %indvars.iv.next
  store float %div15.us.1, ptr %arrayidx19.us.1, align 4, !tbaa !10
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count45
  br i1 %exitcond.not.1, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us, !llvm.loop !18

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.body3.us.prol.loopexit, %for.body3.us, %middle.block
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond46.not = icmp eq i64 %indvars.iv.next43, %wide.trip.count45
  br i1 %exitcond46.not, label %for.end22, label %for.body.us, !llvm.loop !19

for.end22:                                        ; preds = %for.cond1.for.inc20_crit_edge.us, %entry
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiPfS_(i32 noundef %n, ptr nofree noundef readonly captures(none) %y, ptr nofree noundef readonly captures(none) %y_outputFromGpu) local_unnamed_addr #5 {
entry:
  %cmp12 = icmp sgt i32 %n, 0
  br i1 %cmp12, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 4
  br i1 %min.iters.check, label %for.body.preheader17, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %32, %vector.body ]
  %0 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %index
  %wide.load = load <4 x float>, ptr %0, align 4, !tbaa !10
  %1 = fpext <4 x float> %wide.load to <4 x double>
  %2 = getelementptr inbounds nuw [4 x i8], ptr %y_outputFromGpu, i64 %index
  %wide.load16 = load <4 x float>, ptr %2, align 4, !tbaa !10
  %3 = fpext <4 x float> %wide.load16 to <4 x double>
  %4 = fcmp olt <4 x double> %1, splat (double f0xB690000000000000)
  %5 = fneg <4 x float> %wide.load
  %6 = select <4 x i1> %4, <4 x float> %5, <4 x float> %wide.load
  %7 = fpext <4 x float> %6 to <4 x double>
  %8 = fcmp uge <4 x double> %7, splat (double 1.000000e-02)
  %9 = fcmp olt <4 x double> %3, splat (double f0xB690000000000000)
  %10 = fneg <4 x float> %wide.load16
  %11 = select <4 x i1> %9, <4 x float> %10, <4 x float> %wide.load16
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
  %index.next = add nuw i64 %index, 4
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  %34 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %32)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.end, label %for.body.preheader17

for.body.preheader17:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %fail.014.ph = phi i32 [ 0, %for.body.preheader ], [ %34, %middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.body.preheader17, %_Z11percentDiffdd.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit ], [ %indvars.iv.ph, %for.body.preheader17 ]
  %fail.014 = phi i32 [ %fail.1, %_Z11percentDiffdd.exit ], [ %fail.014.ph, %for.body.preheader17 ]
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %indvars.iv
  %35 = load float, ptr %arrayidx, align 4, !tbaa !10
  %conv = fpext float %35 to double
  %arrayidx2 = getelementptr inbounds nuw [4 x i8], ptr %y_outputFromGpu, i64 %indvars.iv
  %36 = load float, ptr %arrayidx2, align 4, !tbaa !10
  %conv3 = fpext float %36 to double
  %cmp.i.i = fcmp olt double %conv, f0xB690000000000000
  %mul.i.i = fneg float %35
  %retval.0.i.i = select i1 %cmp.i.i, float %mul.i.i, float %35
  %conv1.i = fpext float %retval.0.i.i to double
  %cmp.i = fcmp olt double %conv1.i, 1.000000e-02
  br i1 %cmp.i, label %land.lhs.true.i, label %if.else.i

land.lhs.true.i:                                  ; preds = %for.body
  %cmp.i14.i = fcmp olt double %conv3, f0xB690000000000000
  %mul.i15.i = fneg float %36
  %retval.0.i16.i = select i1 %cmp.i14.i, float %mul.i15.i, float %36
  %conv4.i = fpext float %retval.0.i16.i to double
  %cmp5.i = fcmp olt double %conv4.i, 1.000000e-02
  br i1 %cmp5.i, label %_Z11percentDiffdd.exit, label %if.else.i

if.else.i:                                        ; preds = %land.lhs.true.i, %for.body
  %37 = insertelement <2 x double> poison, double %conv, i64 0
  %38 = shufflevector <2 x double> %37, <2 x double> poison, <2 x i32> zeroinitializer
  %39 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv3, i64 0
  %40 = fsub <2 x double> %38, %39
  %41 = fptrunc <2 x double> %40 to <2 x float>
  %42 = fcmp olt <2 x double> %40, splat (double f0xB690000000000000)
  %43 = fneg <2 x float> %41
  %44 = select <2 x i1> %42, <2 x float> %43, <2 x float> %41
  %45 = extractelement <2 x float> %44, i64 0
  %46 = extractelement <2 x float> %44, i64 1
  %div.i = fdiv float %45, %46
  %cmp.i23.i = fcmp olt float %div.i, 0.000000e+00
  %mul.i24.i = fneg float %div.i
  %retval.0.i25.i = select i1 %cmp.i23.i, float %mul.i24.i, float %div.i
  %mul.i = fmul float %retval.0.i25.i, 1.000000e+02
  %47 = fpext float %mul.i to double
  %48 = fcmp ogt double %47, 5.000000e-02
  %49 = zext i1 %48 to i32
  br label %_Z11percentDiffdd.exit

_Z11percentDiffdd.exit:                           ; preds = %land.lhs.true.i, %if.else.i
  %retval.0.i = phi i32 [ %49, %if.else.i ], [ 0, %land.lhs.true.i ]
  %fail.1 = add nuw nsw i32 %retval.0.i, %fail.014
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !21

for.end:                                          ; preds = %_Z11percentDiffdd.exit, %middle.block, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %34, %middle.block ], [ %fail.1, %_Z11percentDiffdd.exit ]
  %call7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %fail.0.lcssa) #14
  ret void
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
define dso_local void @_Z29__device_stub__gesummv_kerneliffPfS_S_S_S_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr noundef %A, ptr noundef %B, ptr noundef %tmp, ptr noundef %x, ptr noundef %y) #9 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca float, align 4
  %beta.addr = alloca float, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %tmp.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  %y.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !22
  store float %alpha, ptr %alpha.addr, align 4, !tbaa !10
  store float %beta, ptr %beta.addr, align 4, !tbaa !10
  store ptr %A, ptr %A.addr, align 8, !tbaa !23
  store ptr %B, ptr %B.addr, align 8, !tbaa !23
  store ptr %tmp, ptr %tmp.addr, align 8, !tbaa !23
  store ptr %x, ptr %x.addr, align 8, !tbaa !23
  store ptr %y, ptr %y.addr, align 8, !tbaa !23
  %kernel_args1 = alloca [8 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %alpha.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %beta.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %A.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %B.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %tmp.addr, ptr %4, align 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 48
  store ptr %x.addr, ptr %5, align 16
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 56
  store ptr %y.addr, ptr %6, align 8
  %7 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %8 = load i64, ptr %shmem_size, align 8
  %9 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gesummv_kerneliffPfS_S_S_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %8, ptr noundef %9)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress uwtable
define dso_local void @_Z11gesummvCudaiffPA4096_fS0_PfS1_S1_S1_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr noundef %A, ptr noundef %B, ptr noundef %tmp, ptr noundef %x, ptr noundef %y, ptr noundef %y_outputFromGpu) local_unnamed_addr #7 {
entry:
  %Tp.i.i20 = alloca %struct.timeval, align 8
  %n.addr.i = alloca i32, align 4
  %alpha.addr.i = alloca float, align 4
  %beta.addr.i = alloca float, align 4
  %A.addr.i = alloca ptr, align 8
  %B.addr.i = alloca ptr, align 8
  %tmp.addr.i = alloca ptr, align 8
  %x.addr.i = alloca ptr, align 8
  %y.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [8 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %A_gpu = alloca ptr, align 8
  %B_gpu = alloca ptr, align 8
  %x_gpu = alloca ptr, align 8
  %y_gpu = alloca ptr, align 8
  %tmp_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %B_gpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %x_gpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %y_gpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %tmp_gpu) #15
  %call = call i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 67108864) #14
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %B_gpu, i64 noundef 67108864) #14
  %call2 = call i32 @cudaMalloc(ptr noundef nonnull %x_gpu, i64 noundef 16384) #14
  %call3 = call i32 @cudaMalloc(ptr noundef nonnull %y_gpu, i64 noundef 16384) #14
  %call4 = call i32 @cudaMalloc(ptr noundef nonnull %tmp_gpu, i64 noundef 16384) #14
  %0 = load ptr, ptr %A_gpu, align 8, !tbaa !23
  %call5 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 67108864, i32 noundef 1) #14
  %1 = load ptr, ptr %B_gpu, align 8, !tbaa !23
  %call6 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %B, i64 noundef 67108864, i32 noundef 1) #14
  %2 = load ptr, ptr %x_gpu, align 8, !tbaa !23
  %call7 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %x, i64 noundef 16384, i32 noundef 1) #14
  %3 = load ptr, ptr %y_gpu, align 8, !tbaa !23
  %call8 = call i32 @cudaMemcpy(ptr noundef %3, ptr noundef %y, i64 noundef 16384, i32 noundef 1) #14
  %4 = load ptr, ptr %tmp_gpu, align 8, !tbaa !23
  %call9 = call i32 @cudaMemcpy(ptr noundef %4, ptr noundef %tmp, i64 noundef 16384, i32 noundef 1) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %5 = load i64, ptr %Tp.i.i, align 8, !tbaa !26
  %conv.i.i = sitofp i64 %5 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %6 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !29
  %conv2.i.i = sitofp i64 %6 to double
  %7 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %7, ptr @polybench_t_start, align 8, !tbaa !30
  %call14 = call i32 @__cudaPushCallConfiguration(i64 4294967312, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool.not = icmp eq i32 %call14, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %8 = load ptr, ptr %A_gpu, align 8, !tbaa !23
  %9 = load ptr, ptr %B_gpu, align 8, !tbaa !23
  %10 = load ptr, ptr %tmp_gpu, align 8, !tbaa !23
  %11 = load ptr, ptr %x_gpu, align 8, !tbaa !23
  %12 = load ptr, ptr %y_gpu, align 8, !tbaa !23
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %alpha.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %beta.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %tmp.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %x.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %y.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %n, ptr %n.addr.i, align 4, !tbaa !22
  store float %alpha, ptr %alpha.addr.i, align 4, !tbaa !10
  store float %beta, ptr %beta.addr.i, align 4, !tbaa !10
  store ptr %8, ptr %A.addr.i, align 8, !tbaa !23
  store ptr %9, ptr %B.addr.i, align 8, !tbaa !23
  store ptr %10, ptr %tmp.addr.i, align 8, !tbaa !23
  store ptr %11, ptr %x.addr.i, align 8, !tbaa !23
  store ptr %12, ptr %y.addr.i, align 8, !tbaa !23
  store ptr %n.addr.i, ptr %kernel_args1.i, align 16
  %13 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %alpha.addr.i, ptr %13, align 8
  %14 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %beta.addr.i, ptr %14, align 16
  %15 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %A.addr.i, ptr %15, align 8
  %16 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 32
  store ptr %B.addr.i, ptr %16, align 16
  %17 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 40
  store ptr %tmp.addr.i, ptr %17, align 8
  %18 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 48
  store ptr %x.addr.i, ptr %18, align 16
  %19 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 56
  store ptr %y.addr.i, ptr %19, align 8
  %20 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !32
  %21 = load i64, ptr %shmem_size.i, align 8
  %22 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gesummv_kerneliffPfS_S_S_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %21, ptr noundef %22), !inline_history !32
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %alpha.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %beta.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %tmp.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %x.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %y.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %_Z21polybench_timer_startv.exit
  %call15 = call i32 @cudaThreadSynchronize() #14
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i20) #15
  %call.i.i21 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i20, ptr noundef null) #16
  %cmp.not.i.i22 = icmp eq i32 %call.i.i21, 0
  br i1 %cmp.not.i.i22, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i23

if.then.i.i23:                                    ; preds = %kcall.end
  %call1.i.i24 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i21) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end, %if.then.i.i23
  %23 = load i64, ptr %Tp.i.i20, align 8, !tbaa !26
  %conv.i.i25 = sitofp i64 %23 to double
  %tv_usec.i.i26 = getelementptr inbounds nuw i8, ptr %Tp.i.i20, i64 8
  %24 = load i64, ptr %tv_usec.i.i26, align 8, !tbaa !29
  %conv2.i.i27 = sitofp i64 %24 to double
  %25 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i27, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i25)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i20) #15
  store double %25, ptr @polybench_t_end, align 8, !tbaa !30
  %26 = load double, ptr @polybench_t_start, align 8, !tbaa !30
  %sub.i = fsub double %25, %26
  %call.i28 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #14
  %27 = load ptr, ptr %y_gpu, align 8, !tbaa !23
  %call17 = call i32 @cudaMemcpy(ptr noundef %y_outputFromGpu, ptr noundef %27, i64 noundef 16384, i32 noundef 2) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %tmp_gpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %y_gpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %x_gpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %B_gpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %A_gpu) #15
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #8

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #5 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #15
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #16
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #14
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !26
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !29
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_start, align 8, !tbaa !30
  ret void
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #8

declare i32 @cudaThreadSynchronize() local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #5 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #15
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #16
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #14
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !26
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !29
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_end, align 8, !tbaa !30
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !30
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !30
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #14
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #9 {
entry:
  %Tp.i.i85 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i69 = alloca ptr, align 8
  %newA.i.i62 = alloca ptr, align 8
  %newA.i.i55 = alloca ptr, align 8
  %newA.i.i48 = alloca ptr, align 8
  %newA.i.i41 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #15
  store ptr null, ptr %newA.i.i, align 8, !tbaa !33
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 67108864) #16
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !33
  %1 = ptrtoaddr ptr %0 to i64
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %2 = load ptr, ptr @stderr, align 8, !tbaa !34
  %3 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %2) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i41) #15
  store ptr null, ptr %newA.i.i41, align 8, !tbaa !33
  %call.i.i42 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i41, i64 noundef 32, i64 noundef 67108864) #16
  %4 = load ptr, ptr %newA.i.i41, align 8, !tbaa !33
  %5 = ptrtoaddr ptr %4 to i64
  %tobool.i.i43 = icmp eq ptr %4, null
  %tobool1.i.i44 = icmp ne i32 %call.i.i42, 0
  %or.cond.i.i45 = select i1 %tobool.i.i43, i1 true, i1 %tobool1.i.i44
  br i1 %or.cond.i.i45, label %if.then.i.i46, label %_Z20polybench_alloc_datayi.exit47

if.then.i.i46:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %6 = load ptr, ptr @stderr, align 8, !tbaa !34
  %7 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %6) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit47:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i41) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i48) #15
  store ptr null, ptr %newA.i.i48, align 8, !tbaa !33
  %call.i.i49 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i48, i64 noundef 32, i64 noundef 16384) #16
  %8 = load ptr, ptr %newA.i.i48, align 8, !tbaa !33
  %tobool.i.i50 = icmp eq ptr %8, null
  %tobool1.i.i51 = icmp ne i32 %call.i.i49, 0
  %or.cond.i.i52 = select i1 %tobool.i.i50, i1 true, i1 %tobool1.i.i51
  br i1 %or.cond.i.i52, label %if.then.i.i53, label %_Z20polybench_alloc_datayi.exit54

if.then.i.i53:                                    ; preds = %_Z20polybench_alloc_datayi.exit47
  %9 = load ptr, ptr @stderr, align 8, !tbaa !34
  %10 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %9) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit54:                ; preds = %_Z20polybench_alloc_datayi.exit47
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i48) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i55) #15
  store ptr null, ptr %newA.i.i55, align 8, !tbaa !33
  %call.i.i56 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i55, i64 noundef 32, i64 noundef 16384) #16
  %11 = load ptr, ptr %newA.i.i55, align 8, !tbaa !33
  %tobool.i.i57 = icmp eq ptr %11, null
  %tobool1.i.i58 = icmp ne i32 %call.i.i56, 0
  %or.cond.i.i59 = select i1 %tobool.i.i57, i1 true, i1 %tobool1.i.i58
  br i1 %or.cond.i.i59, label %if.then.i.i60, label %_Z20polybench_alloc_datayi.exit61

if.then.i.i60:                                    ; preds = %_Z20polybench_alloc_datayi.exit54
  %12 = load ptr, ptr @stderr, align 8, !tbaa !34
  %13 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %12) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit61:                ; preds = %_Z20polybench_alloc_datayi.exit54
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i55) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i62) #15
  store ptr null, ptr %newA.i.i62, align 8, !tbaa !33
  %call.i.i63 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i62, i64 noundef 32, i64 noundef 16384) #16
  %14 = load ptr, ptr %newA.i.i62, align 8, !tbaa !33
  %tobool.i.i64 = icmp eq ptr %14, null
  %tobool1.i.i65 = icmp ne i32 %call.i.i63, 0
  %or.cond.i.i66 = select i1 %tobool.i.i64, i1 true, i1 %tobool1.i.i65
  br i1 %or.cond.i.i66, label %if.then.i.i67, label %_Z20polybench_alloc_datayi.exit68

if.then.i.i67:                                    ; preds = %_Z20polybench_alloc_datayi.exit61
  %15 = load ptr, ptr @stderr, align 8, !tbaa !34
  %16 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %15) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit68:                ; preds = %_Z20polybench_alloc_datayi.exit61
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i62) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i69) #15
  store ptr null, ptr %newA.i.i69, align 8, !tbaa !33
  %call.i.i70 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i69, i64 noundef 32, i64 noundef 16384) #16
  %17 = load ptr, ptr %newA.i.i69, align 8, !tbaa !33
  %tobool.i.i71 = icmp eq ptr %17, null
  %tobool1.i.i72 = icmp ne i32 %call.i.i70, 0
  %or.cond.i.i73 = select i1 %tobool.i.i71, i1 true, i1 %tobool1.i.i72
  br i1 %or.cond.i.i73, label %if.then.i.i74, label %_Z20polybench_alloc_datayi.exit75

if.then.i.i74:                                    ; preds = %_Z20polybench_alloc_datayi.exit68
  %18 = load ptr, ptr @stderr, align 8, !tbaa !34
  %19 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %18) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit75:                ; preds = %_Z20polybench_alloc_datayi.exit68
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i69) #15
  %20 = sub i64 %1, %5
  %diff.check = icmp ugt i64 %20, -32
  br label %for.body.us.i

for.body.us.i:                                    ; preds = %for.cond1.for.inc20_crit_edge.us.i, %_Z20polybench_alloc_datayi.exit75
  %indvars.iv42.i = phi i64 [ %indvars.iv.next43.i, %for.cond1.for.inc20_crit_edge.us.i ], [ 0, %_Z20polybench_alloc_datayi.exit75 ]
  %21 = trunc nuw nsw i64 %indvars.iv42.i to i32
  %conv.us.i = uitofp nneg i32 %21 to float
  %div.us.i = fmul nnan float %conv.us.i, f0x39800000
  %arrayidx.us.i = getelementptr inbounds nuw [4 x i8], ptr %11, i64 %indvars.iv42.i
  store float %div.us.i, ptr %arrayidx.us.i, align 4, !tbaa !10
  %arrayidx8.us.i = getelementptr inbounds nuw [16384 x i8], ptr %0, i64 %indvars.iv42.i
  %arrayidx17.us.i = getelementptr inbounds nuw [16384 x i8], ptr %4, i64 %indvars.iv42.i
  br i1 %diff.check, label %for.body3.us.i, label %vector.ph

vector.ph:                                        ; preds = %for.body.us.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.us.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %22 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %23 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %24 = fmul nnan <4 x float> %broadcast.splat, %22
  %25 = fmul nnan <4 x float> %broadcast.splat, %23
  %26 = fmul nnan <4 x float> %24, splat (float f0x39800000)
  %27 = fmul nnan <4 x float> %25, splat (float f0x39800000)
  %28 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx8.us.i, i64 %index
  %29 = getelementptr inbounds nuw i8, ptr %28, i64 16
  store <4 x float> %26, ptr %28, align 4, !tbaa !10
  store <4 x float> %27, ptr %29, align 4, !tbaa !10
  %30 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us.i, i64 %index
  %31 = getelementptr inbounds nuw i8, ptr %30, i64 16
  store <4 x float> %26, ptr %30, align 4, !tbaa !10
  store <4 x float> %27, ptr %31, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %32 = icmp eq i64 %index.next, 4096
  br i1 %32, label %for.cond1.for.inc20_crit_edge.us.i, label %vector.body, !llvm.loop !36

for.body3.us.i:                                   ; preds = %for.body.us.i, %for.body3.us.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i.1, %for.body3.us.i ], [ 0, %for.body.us.i ]
  %33 = trunc nuw nsw i64 %indvars.iv.i to i32
  %conv5.us.i = uitofp nneg i32 %33 to float
  %mul.us.i = fmul nnan float %conv.us.i, %conv5.us.i
  %div6.us.i = fmul nnan float %mul.us.i, f0x39800000
  %arrayidx10.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx8.us.i, i64 %indvars.iv.i
  store float %div6.us.i, ptr %arrayidx10.us.i, align 4, !tbaa !10
  %arrayidx19.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us.i, i64 %indvars.iv.i
  store float %div6.us.i, ptr %arrayidx19.us.i, align 4, !tbaa !10
  %indvars.iv.next.i = or disjoint i64 %indvars.iv.i, 1
  %34 = trunc nuw nsw i64 %indvars.iv.next.i to i32
  %conv5.us.i.1 = uitofp nneg i32 %34 to float
  %mul.us.i.1 = fmul nnan float %conv.us.i, %conv5.us.i.1
  %div6.us.i.1 = fmul nnan float %mul.us.i.1, f0x39800000
  %arrayidx10.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx8.us.i, i64 %indvars.iv.next.i
  store float %div6.us.i.1, ptr %arrayidx10.us.i.1, align 4, !tbaa !10
  %arrayidx19.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us.i, i64 %indvars.iv.next.i
  store float %div6.us.i.1, ptr %arrayidx19.us.i.1, align 4, !tbaa !10
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %exitcond.not.i.1 = icmp eq i64 %indvars.iv.next.i.1, 4096
  br i1 %exitcond.not.i.1, label %for.cond1.for.inc20_crit_edge.us.i, label %for.body3.us.i, !llvm.loop !37

for.cond1.for.inc20_crit_edge.us.i:               ; preds = %vector.body, %for.body3.us.i
  %indvars.iv.next43.i = add nuw nsw i64 %indvars.iv42.i, 1
  %exitcond46.not.i = icmp eq i64 %indvars.iv.next43.i, 4096
  br i1 %exitcond46.not.i, label %_Z4initiPfS_PA4096_fS1_S_.exit, label %for.body.us.i, !llvm.loop !19

_Z4initiPfS_PA4096_fS1_S_.exit:                   ; preds = %for.cond1.for.inc20_crit_edge.us.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #15
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #14
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #14
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #15
  call void @_Z11gesummvCudaiffPA4096_fS0_PfS1_S1_S1_(i32 noundef 4096, float noundef 4.353200e+04, float noundef 1.231300e+04, ptr noundef nonnull %0, ptr noundef nonnull %4, ptr noundef nonnull %8, ptr noundef nonnull %11, ptr noundef nonnull %14, ptr noundef nonnull %17) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i76 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i76, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i77

if.then.i.i77:                                    ; preds = %_Z4initiPfS_PA4096_fS1_S_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i76) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z4initiPfS_PA4096_fS1_S_.exit, %if.then.i.i77
  %35 = load i64, ptr %Tp.i.i, align 8, !tbaa !26
  %conv.i.i = sitofp i64 %35 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %36 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !29
  %conv2.i.i = sitofp i64 %36 to double
  %37 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %37, ptr @polybench_t_start, align 8, !tbaa !30
  br label %for.body.us.i78

for.body.us.i78:                                  ; preds = %for.cond3.for.end_crit_edge.us.i, %_Z21polybench_timer_startv.exit
  %indvars.iv67.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next68.i, %for.cond3.for.end_crit_edge.us.i ]
  %arrayidx.us.i79 = getelementptr inbounds nuw [4 x i8], ptr %8, i64 %indvars.iv67.i
  store float 0.000000e+00, ptr %arrayidx.us.i79, align 4, !tbaa !10
  %arrayidx2.us.i = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %indvars.iv67.i
  store float 0.000000e+00, ptr %arrayidx2.us.i, align 4, !tbaa !10
  %arrayidx7.us.i = getelementptr inbounds nuw [16384 x i8], ptr %0, i64 %indvars.iv67.i
  %arrayidx17.us.i80 = getelementptr inbounds nuw [16384 x i8], ptr %4, i64 %indvars.iv67.i
  br label %for.body5.us.i

for.body5.us.i:                                   ; preds = %for.body5.us.i, %for.body.us.i78
  %indvars.iv.i81 = phi i64 [ 0, %for.body.us.i78 ], [ %indvars.iv.next.i83, %for.body5.us.i ]
  %arrayidx9.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us.i, i64 %indvars.iv.i81
  %38 = load float, ptr %arrayidx9.us.i, align 4, !tbaa !10
  %arrayidx11.us.i = getelementptr inbounds nuw [4 x i8], ptr %11, i64 %indvars.iv.i81
  %39 = load float, ptr %arrayidx11.us.i, align 4, !tbaa !10
  %40 = load float, ptr %arrayidx.us.i79, align 4, !tbaa !10
  %41 = call float @llvm.fmuladd.f32(float %38, float %39, float %40)
  store float %41, ptr %arrayidx.us.i79, align 4, !tbaa !10
  %arrayidx19.us.i82 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx17.us.i80, i64 %indvars.iv.i81
  %42 = load float, ptr %arrayidx19.us.i82, align 4, !tbaa !10
  %43 = load float, ptr %arrayidx11.us.i, align 4, !tbaa !10
  %44 = load float, ptr %arrayidx2.us.i, align 4, !tbaa !10
  %45 = call float @llvm.fmuladd.f32(float %42, float %43, float %44)
  store float %45, ptr %arrayidx2.us.i, align 4, !tbaa !10
  %indvars.iv.next.i83 = add nuw nsw i64 %indvars.iv.i81, 1
  %exitcond.not.i84 = icmp eq i64 %indvars.iv.next.i83, 4096
  br i1 %exitcond.not.i84, label %for.cond3.for.end_crit_edge.us.i, label %for.body5.us.i, !llvm.loop !12

for.cond3.for.end_crit_edge.us.i:                 ; preds = %for.body5.us.i
  %46 = load float, ptr %arrayidx.us.i79, align 4, !tbaa !10
  %mul30.us.i = fmul float %45, 1.231300e+04
  %47 = call float @llvm.fmuladd.f32(float %46, float 4.353200e+04, float %mul30.us.i)
  store float %47, ptr %arrayidx2.us.i, align 4, !tbaa !10
  %indvars.iv.next68.i = add nuw nsw i64 %indvars.iv67.i, 1
  %exitcond71.not.i = icmp eq i64 %indvars.iv.next68.i, 4096
  br i1 %exitcond71.not.i, label %_Z7gesummviffPA4096_fS0_PfS1_S1_.exit, label %for.body.us.i78, !llvm.loop !14

_Z7gesummviffPA4096_fS0_PfS1_S1_.exit:            ; preds = %for.cond3.for.end_crit_edge.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i85) #15
  %call.i.i86 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i85, ptr noundef null) #16
  %cmp.not.i.i87 = icmp eq i32 %call.i.i86, 0
  br i1 %cmp.not.i.i87, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i88

if.then.i.i88:                                    ; preds = %_Z7gesummviffPA4096_fS0_PfS1_S1_.exit
  %call1.i.i89 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i86) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z7gesummviffPA4096_fS0_PfS1_S1_.exit, %if.then.i.i88
  %48 = load i64, ptr %Tp.i.i85, align 8, !tbaa !26
  %conv.i.i90 = sitofp i64 %48 to double
  %tv_usec.i.i91 = getelementptr inbounds nuw i8, ptr %Tp.i.i85, i64 8
  %49 = load i64, ptr %tv_usec.i.i91, align 8, !tbaa !29
  %conv2.i.i92 = sitofp i64 %49 to double
  %50 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i92, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i90)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i85) #15
  store double %50, ptr @polybench_t_end, align 8, !tbaa !30
  %51 = load double, ptr @polybench_t_start, align 8, !tbaa !30
  %sub.i = fsub double %50, %51
  %call.i93 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #14
  br label %vector.body106

vector.body106:                                   ; preds = %vector.body106, %_Z20polybench_timer_stopv.exit
  %index107 = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %index.next109, %vector.body106 ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %_Z20polybench_timer_stopv.exit ], [ %83, %vector.body106 ]
  %52 = getelementptr inbounds nuw [4 x i8], ptr %14, i64 %index107
  %wide.load = load <4 x float>, ptr %52, align 4, !tbaa !10
  %53 = fpext <4 x float> %wide.load to <4 x double>
  %54 = getelementptr inbounds nuw [4 x i8], ptr %17, i64 %index107
  %wide.load108 = load <4 x float>, ptr %54, align 4, !tbaa !10
  %55 = fpext <4 x float> %wide.load108 to <4 x double>
  %56 = fcmp olt <4 x double> %53, splat (double f0xB690000000000000)
  %57 = fneg <4 x float> %wide.load
  %58 = select <4 x i1> %56, <4 x float> %57, <4 x float> %wide.load
  %59 = fpext <4 x float> %58 to <4 x double>
  %60 = fcmp uge <4 x double> %59, splat (double 1.000000e-02)
  %61 = fcmp olt <4 x double> %55, splat (double f0xB690000000000000)
  %62 = fneg <4 x float> %wide.load108
  %63 = select <4 x i1> %61, <4 x float> %62, <4 x float> %wide.load108
  %64 = fpext <4 x float> %63 to <4 x double>
  %65 = fcmp uge <4 x double> %64, splat (double 1.000000e-02)
  %66 = fsub <4 x double> %53, %55
  %67 = fptrunc <4 x double> %66 to <4 x float>
  %68 = fcmp olt <4 x double> %66, splat (double f0xB690000000000000)
  %69 = fneg <4 x float> %67
  %70 = select <4 x i1> %68, <4 x float> %69, <4 x float> %67
  %71 = fadd <4 x double> %53, splat (double f0x3E45798EE0000000)
  %72 = fptrunc <4 x double> %71 to <4 x float>
  %73 = fcmp olt <4 x double> %71, splat (double f0xB690000000000000)
  %74 = fneg <4 x float> %72
  %75 = select <4 x i1> %73, <4 x float> %74, <4 x float> %72
  %76 = fdiv <4 x float> %70, %75
  %77 = fcmp olt <4 x float> %76, zeroinitializer
  %78 = fneg <4 x float> %76
  %79 = select <4 x i1> %77, <4 x float> %78, <4 x float> %76
  %80 = fmul <4 x float> %79, splat (float 1.000000e+02)
  %81 = fpext <4 x float> %80 to <4 x double>
  %82 = fcmp ogt <4 x double> %81, splat (double 5.000000e-02)
  %.not112 = select <4 x i1> %60, <4 x i1> splat (i1 true), <4 x i1> %65
  %narrow = select <4 x i1> %.not112, <4 x i1> %82, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %83 = add <4 x i32> %vec.phi, %predphi
  %index.next109 = add nuw i64 %index107, 4
  %84 = icmp eq i64 %index.next109, 4096
  br i1 %84, label %_Z14compareResultsiPfS_.exit, label %vector.body106, !llvm.loop !38

_Z14compareResultsiPfS_.exit:                     ; preds = %vector.body106
  %85 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %83)
  %call7.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %85) #14
  call void @free(ptr noundef %0) #16
  call void @free(ptr noundef %4) #16
  call void @free(ptr noundef %8) #16
  call void @free(ptr noundef %11) #16
  call void @free(ptr noundef nonnull %14) #16
  call void @free(ptr noundef nonnull %17) #16
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #15
  store ptr null, ptr %newA.i, align 8, !tbaa !33
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #16
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !33
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !34
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #17
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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !13, !16, !17}
!16 = !{!"llvm.loop.isvectorized", i32 1}
!17 = !{!"llvm.loop.unroll.runtime.disable"}
!18 = distinct !{!18, !13, !16}
!19 = distinct !{!19, !13}
!20 = distinct !{!20, !13, !16, !17}
!21 = distinct !{!21, !13, !17, !16}
!22 = !{!7, !7, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"p1 float", !25, i64 0}
!25 = !{!"any pointer", !8, i64 0}
!26 = !{!27, !28, i64 0}
!27 = !{!"_ZTS7timeval", !28, i64 0, !28, i64 8}
!28 = !{!"long", !8, i64 0}
!29 = !{!27, !28, i64 8}
!30 = !{!31, !31, i64 0}
!31 = !{!"double", !8, i64 0}
!32 = !{ptr @_Z29__device_stub__gesummv_kerneliffPfS_S_S_S_}
!33 = !{!25, !25, i64 0}
!34 = !{!35, !35, i64 0}
!35 = !{!"p1 _ZTS8_IO_FILE", !25, i64 0}
!36 = distinct !{!36, !13, !16, !17}
!37 = distinct !{!37, !13, !16}
!38 = distinct !{!38, !13, !16, !17}
