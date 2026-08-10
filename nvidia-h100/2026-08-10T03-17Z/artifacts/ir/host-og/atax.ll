; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/ATAX/atax.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/ATAX/atax.cu"
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
define dso_local void @_Z10init_arrayiiPfPA4096_f(i32 noundef %nx, i32 noundef %ny, ptr nofree noundef writeonly captures(none) %x, ptr nofree noundef writeonly captures(none) %A) local_unnamed_addr #1 {
entry:
  %cmp25 = icmp sgt i32 %nx, 0
  br i1 %cmp25, label %for.body.lr.ph, label %for.end14

for.body.lr.ph:                                   ; preds = %entry
  %cmp323 = icmp sgt i32 %ny, 0
  %wide.trip.count37 = zext nneg i32 %nx to i64
  br i1 %cmp323, label %for.body.us.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph
  %min.iters.check = icmp ult i32 %nx, 4
  br i1 %min.iters.check, label %for.body.preheader54, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count37, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %0 = uitofp nneg <4 x i32> %vec.ind to <4 x double>
  %1 = fmul nnan <4 x double> %0, splat (double f0x400921FB54442D18)
  %2 = fptrunc <4 x double> %1 to <4 x float>
  %3 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %index
  store <4 x float> %2, ptr %3, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count37
  br i1 %cmp.n, label %for.end14, label %for.body.preheader54

for.body.preheader54:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %wide.trip.count32 = zext nneg i32 %ny to i64
  %min.iters.check42 = icmp ult i32 %ny, 8
  %n.vec45 = and i64 %wide.trip.count32, 2147483640
  %cmp.n52 = icmp eq i64 %n.vec45, %wide.trip.count32
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond2.for.inc12_crit_edge.us
  %indvars.iv34 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next35, %for.cond2.for.inc12_crit_edge.us ]
  %5 = trunc nuw nsw i64 %indvars.iv34 to i32
  %conv.us = uitofp nneg i32 %5 to double
  %mul.us = fmul nnan double %conv.us, f0x400921FB54442D18
  %conv1.us = fptrunc double %mul.us to float
  %arrayidx.us = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv34
  store float %conv1.us, ptr %arrayidx.us, align 4, !tbaa !10
  %conv5.us = uitofp nneg i32 %5 to float
  %arrayidx9.us = getelementptr inbounds nuw [16384 x i8], ptr %A, i64 %indvars.iv34
  br i1 %min.iters.check42, label %for.body4.us.preheader, label %vector.ph43

vector.ph43:                                      ; preds = %for.body.us
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv5.us, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46, %vector.ph43
  %index47 = phi i64 [ 0, %vector.ph43 ], [ %index.next49, %vector.body46 ]
  %vec.ind48 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph43 ], [ %vec.ind.next50, %vector.body46 ]
  %step.add = add <4 x i32> %vec.ind48, splat (i32 4)
  %6 = uitofp nneg <4 x i32> %vec.ind48 to <4 x float>
  %7 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %8 = fmul nnan <4 x float> %broadcast.splat, %6
  %9 = fmul nnan <4 x float> %broadcast.splat, %7
  %10 = fmul nnan <4 x float> %8, splat (float f0x39800000)
  %11 = fmul nnan <4 x float> %9, splat (float f0x39800000)
  %12 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx9.us, i64 %index47
  %13 = getelementptr inbounds nuw i8, ptr %12, i64 16
  store <4 x float> %10, ptr %12, align 4, !tbaa !10
  store <4 x float> %11, ptr %13, align 4, !tbaa !10
  %index.next49 = add nuw i64 %index47, 8
  %vec.ind.next50 = add <4 x i32> %vec.ind48, splat (i32 8)
  %14 = icmp eq i64 %index.next49, %n.vec45
  br i1 %14, label %middle.block51, label %vector.body46, !llvm.loop !16

middle.block51:                                   ; preds = %vector.body46
  br i1 %cmp.n52, label %for.cond2.for.inc12_crit_edge.us, label %for.body4.us.preheader

for.body4.us.preheader:                           ; preds = %for.body.us, %middle.block51
  %indvars.iv29.ph = phi i64 [ 0, %for.body.us ], [ %n.vec45, %middle.block51 ]
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.body4.us.preheader, %for.body4.us
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.body4.us ], [ %indvars.iv29.ph, %for.body4.us.preheader ]
  %15 = trunc nuw nsw i64 %indvars.iv29 to i32
  %conv6.us = uitofp nneg i32 %15 to float
  %mul7.us = fmul nnan float %conv5.us, %conv6.us
  %div.us = fmul nnan float %mul7.us, f0x39800000
  %arrayidx11.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx9.us, i64 %indvars.iv29
  store float %div.us, ptr %arrayidx11.us, align 4, !tbaa !10
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond33.not = icmp eq i64 %indvars.iv.next30, %wide.trip.count32
  br i1 %exitcond33.not, label %for.cond2.for.inc12_crit_edge.us, label %for.body4.us, !llvm.loop !17

for.cond2.for.inc12_crit_edge.us:                 ; preds = %for.body4.us, %middle.block51
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %for.end14, label %for.body.us, !llvm.loop !18

for.body:                                         ; preds = %for.body.preheader54, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader54 ]
  %16 = trunc nuw nsw i64 %indvars.iv to i32
  %conv = uitofp nneg i32 %16 to double
  %mul = fmul nnan double %conv, f0x400921FB54442D18
  %conv1 = fptrunc double %mul to float
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv
  store float %conv1, ptr %arrayidx, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count37
  br i1 %exitcond.not, label %for.end14, label %for.body, !llvm.loop !19

for.end14:                                        ; preds = %for.body, %for.cond2.for.inc12_crit_edge.us, %middle.block, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiPfS_(i32 noundef %ny, ptr nofree noundef readonly captures(none) %z, ptr nofree noundef readonly captures(none) %z_outputFromGpu) local_unnamed_addr #3 {
entry:
  %cmp12 = icmp sgt i32 %ny, 0
  br i1 %cmp12, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext nneg i32 %ny to i64
  %min.iters.check = icmp ult i32 %ny, 4
  br i1 %min.iters.check, label %for.body.preheader17, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %31, %vector.body ]
  %0 = getelementptr inbounds nuw [4 x i8], ptr %z, i64 %index
  %wide.load = load <4 x float>, ptr %0, align 4, !tbaa !10
  %1 = fpext <4 x float> %wide.load to <4 x double>
  %2 = getelementptr inbounds nuw [4 x i8], ptr %z_outputFromGpu, i64 %index
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
  %30 = fcmp ogt <4 x float> %29, splat (float 5.000000e-01)
  %narrow = select <4 x i1> %14, <4 x i1> %30, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %31 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %32 = icmp eq i64 %index.next, %n.vec
  br i1 %32, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  %33 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %31)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.end, label %for.body.preheader17

for.body.preheader17:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %fail.014.ph = phi i32 [ 0, %for.body.preheader ], [ %33, %middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.body.preheader17, %_Z11percentDiffdd.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit ], [ %indvars.iv.ph, %for.body.preheader17 ]
  %fail.014 = phi i32 [ %fail.1, %_Z11percentDiffdd.exit ], [ %fail.014.ph, %for.body.preheader17 ]
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %z, i64 %indvars.iv
  %34 = load float, ptr %arrayidx, align 4, !tbaa !10
  %conv = fpext float %34 to double
  %arrayidx2 = getelementptr inbounds nuw [4 x i8], ptr %z_outputFromGpu, i64 %indvars.iv
  %35 = load float, ptr %arrayidx2, align 4, !tbaa !10
  %conv3 = fpext float %35 to double
  %cmp.i.i = fcmp olt double %conv, f0xB690000000000000
  %mul.i.i = fneg float %34
  %retval.0.i.i = select i1 %cmp.i.i, float %mul.i.i, float %34
  %conv1.i = fpext float %retval.0.i.i to double
  %cmp.i = fcmp olt double %conv1.i, 1.000000e-02
  br i1 %cmp.i, label %land.lhs.true.i, label %if.else.i

land.lhs.true.i:                                  ; preds = %for.body
  %cmp.i14.i = fcmp olt double %conv3, f0xB690000000000000
  %mul.i15.i = fneg float %35
  %retval.0.i16.i = select i1 %cmp.i14.i, float %mul.i15.i, float %35
  %conv4.i = fpext float %retval.0.i16.i to double
  %cmp5.i = fcmp olt double %conv4.i, 1.000000e-02
  br i1 %cmp5.i, label %_Z11percentDiffdd.exit, label %if.else.i

if.else.i:                                        ; preds = %land.lhs.true.i, %for.body
  %36 = insertelement <2 x double> poison, double %conv, i64 0
  %37 = shufflevector <2 x double> %36, <2 x double> poison, <2 x i32> zeroinitializer
  %38 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv3, i64 0
  %39 = fsub <2 x double> %37, %38
  %40 = fptrunc <2 x double> %39 to <2 x float>
  %41 = fcmp olt <2 x double> %39, splat (double f0xB690000000000000)
  %42 = fneg <2 x float> %40
  %43 = select <2 x i1> %41, <2 x float> %42, <2 x float> %40
  %44 = extractelement <2 x float> %43, i64 0
  %45 = extractelement <2 x float> %43, i64 1
  %div.i = fdiv float %44, %45
  %cmp.i23.i = fcmp olt float %div.i, 0.000000e+00
  %mul.i24.i = fneg float %div.i
  %retval.0.i25.i = select i1 %cmp.i23.i, float %mul.i24.i, float %div.i
  %mul.i = fmul float %retval.0.i25.i, 1.000000e+02
  %46 = fcmp ogt float %mul.i, 5.000000e-01
  %47 = zext i1 %46 to i32
  br label %_Z11percentDiffdd.exit

_Z11percentDiffdd.exit:                           ; preds = %land.lhs.true.i, %if.else.i
  %retval.0.i = phi i32 [ %47, %if.else.i ], [ 0, %land.lhs.true.i ]
  %fail.1 = add nuw nsw i32 %retval.0.i, %fail.014
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !21

for.end:                                          ; preds = %_Z11percentDiffdd.exit, %middle.block, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %33, %middle.block ], [ %fail.1, %_Z11percentDiffdd.exit ]
  %call7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-01, i32 noundef %fail.0.lcssa) #16
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #5 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp) #17
  %call = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp, i32 noundef 0) #16
  %call1 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp) #16
  %call2 = call i32 @cudaSetDevice(i32 noundef 0) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp) #17
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #6

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z27__device_stub__atax_kernel1iiPfS_S_(i32 noundef %nx, i32 noundef %ny, ptr noundef %A, ptr noundef %x, ptr noundef %tmp) #7 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  %tmp.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %nx, ptr %nx.addr, align 4, !tbaa !22
  store i32 %ny, ptr %ny.addr, align 4, !tbaa !22
  store ptr %A, ptr %A.addr, align 8, !tbaa !23
  store ptr %x, ptr %x.addr, align 8, !tbaa !23
  store ptr %tmp, ptr %tmp.addr, align 8, !tbaa !23
  %kernel_args1 = alloca [5 x ptr], align 16
  store ptr %nx.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %ny.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %A.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %x.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %tmp.addr, ptr %3, align 16
  %4 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %5 = load i64, ptr %shmem_size, align 8
  %6 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__atax_kernel1iiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %5, ptr noundef %6)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z27__device_stub__atax_kernel2iiPfS_S_(i32 noundef %nx, i32 noundef %ny, ptr noundef %A, ptr noundef %y, ptr noundef %tmp) #7 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %y.addr = alloca ptr, align 8
  %tmp.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %nx, ptr %nx.addr, align 4, !tbaa !22
  store i32 %ny, ptr %ny.addr, align 4, !tbaa !22
  store ptr %A, ptr %A.addr, align 8, !tbaa !23
  store ptr %y, ptr %y.addr, align 8, !tbaa !23
  store ptr %tmp, ptr %tmp.addr, align 8, !tbaa !23
  %kernel_args1 = alloca [5 x ptr], align 16
  store ptr %nx.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %ny.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %A.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %y.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %tmp.addr, ptr %3, align 16
  %4 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %5 = load i64, ptr %shmem_size, align 8
  %6 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__atax_kernel2iiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %5, ptr noundef %6)
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z8atax_cpuiiPA4096_fPfS1_S1_(i32 noundef %nx, i32 noundef %ny, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %x, ptr nofree noundef captures(none) %y, ptr nofree noundef captures(none) %tmp) local_unnamed_addr #8 {
entry:
  %cmp67 = icmp sgt i32 %ny, 0
  br i1 %cmp67, label %for.cond1.preheader, label %for.cond1.preheader.thread

for.cond1.preheader:                              ; preds = %entry
  %0 = zext nneg i32 %ny to i64
  %1 = shl nuw nsw i64 %0, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %y, i8 0, i64 %1, i1 false), !tbaa !10
  %cmp273 = icmp sgt i32 %nx, 0
  br i1 %cmp273, label %for.body3.us.us.preheader, label %for.end40

for.cond1.preheader.thread:                       ; preds = %entry
  %cmp273106 = icmp sgt i32 %nx, 0
  br i1 %cmp273106, label %for.body3.preheader, label %for.end40

for.body3.preheader:                              ; preds = %for.cond1.preheader.thread
  %2 = zext nneg i32 %nx to i64
  %3 = shl nuw nsw i64 %2, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %tmp, i8 0, i64 %3, i1 false), !tbaa !10
  br label %for.end40

for.body3.us.us.preheader:                        ; preds = %for.cond1.preheader
  %wide.trip.count104 = zext nneg i32 %nx to i64
  %wide.trip.count = zext nneg i32 %ny to i64
  %4 = shl nuw nsw i64 %wide.trip.count, 2
  %scevgep = getelementptr i8, ptr %y, i64 %4
  %5 = shl nuw nsw i64 %wide.trip.count104, 14
  %6 = getelementptr i8, ptr %A, i64 %5
  %7 = getelementptr i8, ptr %6, i64 %4
  %scevgep107 = getelementptr i8, ptr %7, i64 -16384
  %8 = shl nuw nsw i64 %wide.trip.count104, 2
  %scevgep108 = getelementptr i8, ptr %tmp, i64 %8
  %xtraiter = and i64 %wide.trip.count, 1
  %9 = icmp eq i32 %ny, 1
  %unroll_iter = and i64 %wide.trip.count, 2147483646
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod116 = trunc i32 %ny to i1
  %min.iters.check = icmp ult i32 %ny, 8
  %bound0 = icmp ult ptr %y, %scevgep107
  %bound1 = icmp ult ptr %A, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  %bound0109 = icmp ult ptr %y, %scevgep108
  %bound1110 = icmp ult ptr %tmp, %scevgep
  %found.conflict111 = and i1 %bound0109, %bound1110
  %conflict.rdx = or i1 %found.conflict, %found.conflict111
  %n.vec = and i64 %wide.trip.count, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  %xtraiter117 = and i64 %wide.trip.count, 1
  %lcmp.mod118.not = icmp eq i64 %xtraiter117, 0
  %10 = add nsw i64 %wide.trip.count, -1
  br label %for.body3.us.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond22.for.inc38_crit_edge.us.us
  %indvars.iv101 = phi i64 [ 0, %for.body3.us.us.preheader ], [ %indvars.iv.next102, %for.cond22.for.inc38_crit_edge.us.us ]
  %arrayidx5.us.us = getelementptr inbounds nuw [4 x i8], ptr %tmp, i64 %indvars.iv101
  store float 0.000000e+00, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %arrayidx12.us.us = getelementptr inbounds nuw [16384 x i8], ptr %A, i64 %indvars.iv101
  br i1 %9, label %for.body8.us.us.epil.preheader, label %for.body8.us.us

for.body8.us.us:                                  ; preds = %for.body3.us.us, %for.body8.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body8.us.us ], [ 0, %for.body3.us.us ]
  %11 = phi float [ %17, %for.body8.us.us ], [ 0.000000e+00, %for.body3.us.us ]
  %niter = phi i64 [ %niter.next.1, %for.body8.us.us ], [ 0, %for.body3.us.us ]
  %arrayidx14.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us, i64 %indvars.iv
  %12 = load float, ptr %arrayidx14.us.us, align 4, !tbaa !10
  %arrayidx16.us.us = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv
  %13 = load float, ptr %arrayidx16.us.us, align 4, !tbaa !10
  %14 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %11)
  store float %14, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %indvars.iv.next = or disjoint i64 %indvars.iv, 1
  %arrayidx14.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us, i64 %indvars.iv.next
  %15 = load float, ptr %arrayidx14.us.us.1, align 4, !tbaa !10
  %arrayidx16.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv.next
  %16 = load float, ptr %arrayidx16.us.us.1, align 4, !tbaa !10
  %17 = tail call float @llvm.fmuladd.f32(float %15, float %16, float %14)
  store float %17, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %for.body24.us.us.preheader.unr-lcssa, label %for.body8.us.us, !llvm.loop !26

for.body24.us.us.preheader.unr-lcssa:             ; preds = %for.body8.us.us
  br i1 %lcmp.mod.not, label %for.body24.us.us.preheader, label %for.body8.us.us.epil.preheader

for.body8.us.us.epil.preheader:                   ; preds = %for.body24.us.us.preheader.unr-lcssa, %for.body3.us.us
  %indvars.iv.epil.init = phi i64 [ 0, %for.body3.us.us ], [ %indvars.iv.next.1, %for.body24.us.us.preheader.unr-lcssa ]
  %.epil.init = phi float [ 0.000000e+00, %for.body3.us.us ], [ %17, %for.body24.us.us.preheader.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod116)
  %arrayidx14.us.us.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us, i64 %indvars.iv.epil.init
  %18 = load float, ptr %arrayidx14.us.us.epil, align 4, !tbaa !10
  %arrayidx16.us.us.epil = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv.epil.init
  %19 = load float, ptr %arrayidx16.us.us.epil, align 4, !tbaa !10
  %20 = tail call float @llvm.fmuladd.f32(float %18, float %19, float %.epil.init)
  store float %20, ptr %arrayidx5.us.us, align 4, !tbaa !10
  br label %for.body24.us.us.preheader

for.body24.us.us.preheader:                       ; preds = %for.body24.us.us.preheader.unr-lcssa, %for.body8.us.us.epil.preheader
  %brmerge = select i1 %min.iters.check, i1 true, i1 %conflict.rdx
  br i1 %brmerge, label %for.body24.us.us.preheader115, label %vector.ph

vector.ph:                                        ; preds = %for.body24.us.us.preheader
  %21 = load float, ptr %arrayidx5.us.us, align 4, !tbaa !10, !alias.scope !27
  %broadcast.splatinsert = insertelement <4 x float> poison, float %21, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %22 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %index
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 16
  %wide.load = load <4 x float>, ptr %22, align 4, !tbaa !10, !alias.scope !30, !noalias !32
  %wide.load112 = load <4 x float>, ptr %23, align 4, !tbaa !10, !alias.scope !30, !noalias !32
  %24 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us, i64 %index
  %25 = getelementptr inbounds nuw i8, ptr %24, i64 16
  %wide.load113 = load <4 x float>, ptr %24, align 4, !tbaa !10, !alias.scope !34
  %wide.load114 = load <4 x float>, ptr %25, align 4, !tbaa !10, !alias.scope !34
  %26 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load113, <4 x float> %broadcast.splat, <4 x float> %wide.load)
  %27 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load114, <4 x float> %broadcast.splat, <4 x float> %wide.load112)
  store <4 x float> %26, ptr %22, align 4, !tbaa !10, !alias.scope !30, !noalias !32
  store <4 x float> %27, ptr %23, align 4, !tbaa !10, !alias.scope !30, !noalias !32
  %index.next = add nuw i64 %index, 8
  %28 = icmp eq i64 %index.next, %n.vec
  br i1 %28, label %middle.block, label %vector.body, !llvm.loop !35

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond22.for.inc38_crit_edge.us.us, label %for.body24.us.us.preheader115

for.body24.us.us.preheader115:                    ; preds = %for.body24.us.us.preheader, %middle.block
  %indvars.iv96.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %for.body24.us.us.preheader ]
  br i1 %lcmp.mod118.not, label %for.body24.us.us.prol.loopexit, label %for.body24.us.us.prol

for.body24.us.us.prol:                            ; preds = %for.body24.us.us.preheader115
  %arrayidx26.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %indvars.iv96.ph
  %29 = load float, ptr %arrayidx26.us.us.prol, align 4, !tbaa !10
  %arrayidx30.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us, i64 %indvars.iv96.ph
  %30 = load float, ptr %arrayidx30.us.us.prol, align 4, !tbaa !10
  %31 = load float, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %32 = tail call float @llvm.fmuladd.f32(float %30, float %31, float %29)
  store float %32, ptr %arrayidx26.us.us.prol, align 4, !tbaa !10
  %indvars.iv.next97.prol = or disjoint i64 %indvars.iv96.ph, 1
  br label %for.body24.us.us.prol.loopexit

for.body24.us.us.prol.loopexit:                   ; preds = %for.body24.us.us.prol, %for.body24.us.us.preheader115
  %indvars.iv96.unr = phi i64 [ %indvars.iv96.ph, %for.body24.us.us.preheader115 ], [ %indvars.iv.next97.prol, %for.body24.us.us.prol ]
  %33 = icmp eq i64 %indvars.iv96.ph, %10
  br i1 %33, label %for.cond22.for.inc38_crit_edge.us.us, label %for.body24.us.us

for.body24.us.us:                                 ; preds = %for.body24.us.us.prol.loopexit, %for.body24.us.us
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.1, %for.body24.us.us ], [ %indvars.iv96.unr, %for.body24.us.us.prol.loopexit ]
  %arrayidx26.us.us = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %indvars.iv96
  %34 = load float, ptr %arrayidx26.us.us, align 4, !tbaa !10
  %arrayidx30.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us, i64 %indvars.iv96
  %35 = load float, ptr %arrayidx30.us.us, align 4, !tbaa !10
  %36 = load float, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %37 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %34)
  store float %37, ptr %arrayidx26.us.us, align 4, !tbaa !10
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %arrayidx26.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %indvars.iv.next97
  %38 = load float, ptr %arrayidx26.us.us.1, align 4, !tbaa !10
  %arrayidx30.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us, i64 %indvars.iv.next97
  %39 = load float, ptr %arrayidx30.us.us.1, align 4, !tbaa !10
  %40 = load float, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %41 = tail call float @llvm.fmuladd.f32(float %39, float %40, float %38)
  store float %41, ptr %arrayidx26.us.us.1, align 4, !tbaa !10
  %indvars.iv.next97.1 = add nuw nsw i64 %indvars.iv96, 2
  %exitcond100.not.1 = icmp eq i64 %indvars.iv.next97.1, %wide.trip.count
  br i1 %exitcond100.not.1, label %for.cond22.for.inc38_crit_edge.us.us, label %for.body24.us.us, !llvm.loop !36

for.cond22.for.inc38_crit_edge.us.us:             ; preds = %for.body24.us.us.prol.loopexit, %for.body24.us.us, %middle.block
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond105.not = icmp eq i64 %indvars.iv.next102, %wide.trip.count104
  br i1 %exitcond105.not, label %for.end40, label %for.body3.us.us, !llvm.loop !37

for.end40:                                        ; preds = %for.cond22.for.inc38_crit_edge.us.us, %for.cond1.preheader.thread, %for.body3.preheader, %for.cond1.preheader
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #9

; Function Attrs: mustprogress uwtable
define dso_local void @_Z7ataxGpuiiPA4096_fPfS1_S1_S1_(i32 noundef %nx, i32 noundef %ny, ptr noundef %A, ptr noundef %x, ptr noundef %y, ptr noundef %tmp, ptr noundef %y_outputFromGpu) local_unnamed_addr #5 {
entry:
  %Tp.i.i56 = alloca %struct.timeval, align 8
  %nx.addr.i40 = alloca i32, align 4
  %ny.addr.i41 = alloca i32, align 4
  %A.addr.i42 = alloca ptr, align 8
  %y.addr.i = alloca ptr, align 8
  %tmp.addr.i43 = alloca ptr, align 8
  %grid_dim.i44 = alloca %struct.dim3, align 8
  %block_dim.i45 = alloca %struct.dim3, align 8
  %shmem_size.i46 = alloca i64, align 8
  %stream.i47 = alloca ptr, align 8
  %kernel_args1.i48 = alloca [5 x ptr], align 16
  %nx.addr.i = alloca i32, align 4
  %ny.addr.i = alloca i32, align 4
  %A.addr.i = alloca ptr, align 8
  %x.addr.i = alloca ptr, align 8
  %tmp.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [5 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %A_gpu = alloca ptr, align 8
  %x_gpu = alloca ptr, align 8
  %y_gpu = alloca ptr, align 8
  %tmp_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %x_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %y_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %tmp_gpu) #17
  %call = call i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 67108864) #16
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %x_gpu, i64 noundef 16384) #16
  %call2 = call i32 @cudaMalloc(ptr noundef nonnull %y_gpu, i64 noundef 16384) #16
  %call3 = call i32 @cudaMalloc(ptr noundef nonnull %tmp_gpu, i64 noundef 16384) #16
  %0 = load ptr, ptr %A_gpu, align 8, !tbaa !23
  %call4 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 67108864, i32 noundef 1) #16
  %1 = load ptr, ptr %x_gpu, align 8, !tbaa !23
  %call5 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %x, i64 noundef 16384, i32 noundef 1) #16
  %2 = load ptr, ptr %y_gpu, align 8, !tbaa !23
  %call6 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %y, i64 noundef 16384, i32 noundef 1) #16
  %3 = load ptr, ptr %tmp_gpu, align 8, !tbaa !23
  %call7 = call i32 @cudaMemcpy(ptr noundef %3, ptr noundef %tmp, i64 noundef 16384, i32 noundef 1) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #17
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #18
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #16
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %4 = load i64, ptr %Tp.i.i, align 8, !tbaa !38
  %conv.i.i = sitofp i64 %4 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %5 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !41
  %conv2.i.i = sitofp i64 %5 to double
  %6 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #17
  store double %6, ptr @polybench_t_start, align 8, !tbaa !42
  %call19 = call i32 @__cudaPushCallConfiguration(i64 4294967424, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool.not = icmp eq i32 %call19, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %7 = load ptr, ptr %A_gpu, align 8, !tbaa !23
  %8 = load ptr, ptr %x_gpu, align 8, !tbaa !23
  %9 = load ptr, ptr %tmp_gpu, align 8, !tbaa !23
  call void @llvm.lifetime.start.p0(ptr nonnull %nx.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %ny.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %x.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %tmp.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %nx, ptr %nx.addr.i, align 4, !tbaa !22
  store i32 %ny, ptr %ny.addr.i, align 4, !tbaa !22
  store ptr %7, ptr %A.addr.i, align 8, !tbaa !23
  store ptr %8, ptr %x.addr.i, align 8, !tbaa !23
  store ptr %9, ptr %tmp.addr.i, align 8, !tbaa !23
  store ptr %nx.addr.i, ptr %kernel_args1.i, align 16
  %10 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %ny.addr.i, ptr %10, align 8
  %11 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %A.addr.i, ptr %11, align 16
  %12 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %x.addr.i, ptr %12, align 8
  %13 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 32
  store ptr %tmp.addr.i, ptr %13, align 16
  %14 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !44
  %15 = load i64, ptr %shmem_size.i, align 8
  %16 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__atax_kernel1iiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %15, ptr noundef %16), !inline_history !44
  call void @llvm.lifetime.end.p0(ptr nonnull %nx.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %ny.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %x.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %tmp.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %_Z21polybench_timer_startv.exit
  %call20 = call i32 @cudaThreadSynchronize() #16
  %call23 = call i32 @__cudaPushCallConfiguration(i64 4294967424, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool24.not = icmp eq i32 %call23, 0
  br i1 %tobool24.not, label %kcall.configok25, label %kcall.end26

kcall.configok25:                                 ; preds = %kcall.end
  %17 = load ptr, ptr %A_gpu, align 8, !tbaa !23
  %18 = load ptr, ptr %y_gpu, align 8, !tbaa !23
  %19 = load ptr, ptr %tmp_gpu, align 8, !tbaa !23
  call void @llvm.lifetime.start.p0(ptr nonnull %nx.addr.i40)
  call void @llvm.lifetime.start.p0(ptr nonnull %ny.addr.i41)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i42)
  call void @llvm.lifetime.start.p0(ptr nonnull %y.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %tmp.addr.i43)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i44)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i45)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i46)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i47)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i48)
  store i32 %nx, ptr %nx.addr.i40, align 4, !tbaa !22
  store i32 %ny, ptr %ny.addr.i41, align 4, !tbaa !22
  store ptr %17, ptr %A.addr.i42, align 8, !tbaa !23
  store ptr %18, ptr %y.addr.i, align 8, !tbaa !23
  store ptr %19, ptr %tmp.addr.i43, align 8, !tbaa !23
  store ptr %nx.addr.i40, ptr %kernel_args1.i48, align 16
  %20 = getelementptr inbounds nuw i8, ptr %kernel_args1.i48, i64 8
  store ptr %ny.addr.i41, ptr %20, align 8
  %21 = getelementptr inbounds nuw i8, ptr %kernel_args1.i48, i64 16
  store ptr %A.addr.i42, ptr %21, align 16
  %22 = getelementptr inbounds nuw i8, ptr %kernel_args1.i48, i64 24
  store ptr %y.addr.i, ptr %22, align 8
  %23 = getelementptr inbounds nuw i8, ptr %kernel_args1.i48, i64 32
  store ptr %tmp.addr.i43, ptr %23, align 16
  %24 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i44, ptr nonnull %block_dim.i45, ptr nonnull %shmem_size.i46, ptr nonnull %stream.i47), !inline_history !45
  %25 = load i64, ptr %shmem_size.i46, align 8
  %26 = load ptr, ptr %stream.i47, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i49 = load i64, ptr %grid_dim.i44, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i50 = getelementptr inbounds nuw i8, ptr %grid_dim.i44, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i51 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i50, align 8
  %block_dim.coerce.sroa.0.0.copyload.i52 = load i64, ptr %block_dim.i45, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i53 = getelementptr inbounds nuw i8, ptr %block_dim.i45, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i54 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i53, align 8
  %call.i55 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__atax_kernel2iiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i49, i32 %grid_dim.coerce.sroa.2.0.copyload.i51, i64 %block_dim.coerce.sroa.0.0.copyload.i52, i32 %block_dim.coerce.sroa.2.0.copyload.i54, ptr noundef nonnull %kernel_args1.i48, i64 noundef %25, ptr noundef %26), !inline_history !45
  call void @llvm.lifetime.end.p0(ptr nonnull %nx.addr.i40)
  call void @llvm.lifetime.end.p0(ptr nonnull %ny.addr.i41)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i42)
  call void @llvm.lifetime.end.p0(ptr nonnull %y.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %tmp.addr.i43)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i44)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i45)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i46)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i47)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i48)
  br label %kcall.end26

kcall.end26:                                      ; preds = %kcall.configok25, %kcall.end
  %call27 = call i32 @cudaThreadSynchronize() #16
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i56) #17
  %call.i.i57 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i56, ptr noundef null) #18
  %cmp.not.i.i58 = icmp eq i32 %call.i.i57, 0
  br i1 %cmp.not.i.i58, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i59

if.then.i.i59:                                    ; preds = %kcall.end26
  %call1.i.i60 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i57) #16
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end26, %if.then.i.i59
  %27 = load i64, ptr %Tp.i.i56, align 8, !tbaa !38
  %conv.i.i61 = sitofp i64 %27 to double
  %tv_usec.i.i62 = getelementptr inbounds nuw i8, ptr %Tp.i.i56, i64 8
  %28 = load i64, ptr %tv_usec.i.i62, align 8, !tbaa !41
  %conv2.i.i63 = sitofp i64 %28 to double
  %29 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i63, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i61)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i56) #17
  store double %29, ptr @polybench_t_end, align 8, !tbaa !42
  %30 = load double, ptr @polybench_t_start, align 8, !tbaa !42
  %sub.i = fsub double %29, %30
  %call.i64 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #16
  %31 = load ptr, ptr %y_gpu, align 8, !tbaa !23
  %call29 = call i32 @cudaMemcpy(ptr noundef %y_outputFromGpu, ptr noundef %31, i64 noundef 16384, i32 noundef 2) #16
  %32 = load ptr, ptr %A_gpu, align 8, !tbaa !23
  %call30 = call i32 @cudaFree(ptr noundef %32) #16
  %33 = load ptr, ptr %x_gpu, align 8, !tbaa !23
  %call31 = call i32 @cudaFree(ptr noundef %33) #16
  %34 = load ptr, ptr %y_gpu, align 8, !tbaa !23
  %call32 = call i32 @cudaFree(ptr noundef %34) #16
  %35 = load ptr, ptr %tmp_gpu, align 8, !tbaa !23
  %call33 = call i32 @cudaFree(ptr noundef %35) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %tmp_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %y_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %x_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %A_gpu) #17
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #6

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #3 {
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !38
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !41
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #17
  store double %2, ptr @polybench_t_start, align 8, !tbaa !42
  ret void
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #6

declare i32 @cudaThreadSynchronize() local_unnamed_addr #6

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #3 {
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !38
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !41
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #17
  store double %2, ptr @polybench_t_end, align 8, !tbaa !42
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #3 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !42
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !42
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #16
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #6

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #7 {
entry:
  %Tp.i.i66 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i57 = alloca ptr, align 8
  %newA.i.i50 = alloca ptr, align 8
  %newA.i.i43 = alloca ptr, align 8
  %newA.i.i36 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #17
  store ptr null, ptr %newA.i.i, align 8, !tbaa !46
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 67108864) #18
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !46
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !47
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i36) #17
  store ptr null, ptr %newA.i.i36, align 8, !tbaa !46
  %call.i.i37 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i36, i64 noundef 32, i64 noundef 16384) #18
  %3 = load ptr, ptr %newA.i.i36, align 8, !tbaa !46
  %tobool.i.i38 = icmp eq ptr %3, null
  %tobool1.i.i39 = icmp ne i32 %call.i.i37, 0
  %or.cond.i.i40 = select i1 %tobool.i.i38, i1 true, i1 %tobool1.i.i39
  br i1 %or.cond.i.i40, label %if.then.i.i41, label %_Z20polybench_alloc_datayi.exit42

if.then.i.i41:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !47
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit42:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i36) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i43) #17
  store ptr null, ptr %newA.i.i43, align 8, !tbaa !46
  %call.i.i44 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i43, i64 noundef 32, i64 noundef 16384) #18
  %6 = load ptr, ptr %newA.i.i43, align 8, !tbaa !46
  %tobool.i.i45 = icmp eq ptr %6, null
  %tobool1.i.i46 = icmp ne i32 %call.i.i44, 0
  %or.cond.i.i47 = select i1 %tobool.i.i45, i1 true, i1 %tobool1.i.i46
  br i1 %or.cond.i.i47, label %if.then.i.i48, label %_Z20polybench_alloc_datayi.exit49

if.then.i.i48:                                    ; preds = %_Z20polybench_alloc_datayi.exit42
  %7 = load ptr, ptr @stderr, align 8, !tbaa !47
  %8 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %7) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit49:                ; preds = %_Z20polybench_alloc_datayi.exit42
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i43) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i50) #17
  store ptr null, ptr %newA.i.i50, align 8, !tbaa !46
  %call.i.i51 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i50, i64 noundef 32, i64 noundef 16384) #18
  %9 = load ptr, ptr %newA.i.i50, align 8, !tbaa !46
  %tobool.i.i52 = icmp eq ptr %9, null
  %tobool1.i.i53 = icmp ne i32 %call.i.i51, 0
  %or.cond.i.i54 = select i1 %tobool.i.i52, i1 true, i1 %tobool1.i.i53
  br i1 %or.cond.i.i54, label %if.then.i.i55, label %_Z20polybench_alloc_datayi.exit56

if.then.i.i55:                                    ; preds = %_Z20polybench_alloc_datayi.exit49
  %10 = load ptr, ptr @stderr, align 8, !tbaa !47
  %11 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %10) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit56:                ; preds = %_Z20polybench_alloc_datayi.exit49
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i50) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i57) #17
  store ptr null, ptr %newA.i.i57, align 8, !tbaa !46
  %call.i.i58 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i57, i64 noundef 32, i64 noundef 16384) #18
  %12 = load ptr, ptr %newA.i.i57, align 8, !tbaa !46
  %tobool.i.i59 = icmp eq ptr %12, null
  %tobool1.i.i60 = icmp ne i32 %call.i.i58, 0
  %or.cond.i.i61 = select i1 %tobool.i.i59, i1 true, i1 %tobool1.i.i60
  br i1 %or.cond.i.i61, label %if.then.i.i62, label %_Z20polybench_alloc_datayi.exit63

if.then.i.i62:                                    ; preds = %_Z20polybench_alloc_datayi.exit56
  %13 = load ptr, ptr @stderr, align 8, !tbaa !47
  %14 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %13) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit63:                ; preds = %_Z20polybench_alloc_datayi.exit56
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i57) #17
  br label %for.body.us.i

for.body.us.i:                                    ; preds = %for.cond2.for.inc12_crit_edge.us.i, %_Z20polybench_alloc_datayi.exit63
  %indvars.iv34.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit63 ], [ %indvars.iv.next35.i, %for.cond2.for.inc12_crit_edge.us.i ]
  %15 = trunc nuw nsw i64 %indvars.iv34.i to i32
  %conv.us.i = uitofp nneg i32 %15 to double
  %mul.us.i = fmul nnan double %conv.us.i, f0x400921FB54442D18
  %conv1.us.i = fptrunc double %mul.us.i to float
  %arrayidx.us.i = getelementptr inbounds nuw [4 x i8], ptr %3, i64 %indvars.iv34.i
  store float %conv1.us.i, ptr %arrayidx.us.i, align 4, !tbaa !10
  %arrayidx9.us.i = getelementptr inbounds nuw [16384 x i8], ptr %0, i64 %indvars.iv34.i
  %conv5.us.i = uitofp nneg i32 %15 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv5.us.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body.us.i
  %index = phi i64 [ 0, %for.body.us.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.body.us.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %16 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %17 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %18 = fmul nnan <4 x float> %broadcast.splat, %16
  %19 = fmul nnan <4 x float> %broadcast.splat, %17
  %20 = fmul nnan <4 x float> %18, splat (float f0x39800000)
  %21 = fmul nnan <4 x float> %19, splat (float f0x39800000)
  %22 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx9.us.i, i64 %index
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 16
  store <4 x float> %20, ptr %22, align 4, !tbaa !10
  store <4 x float> %21, ptr %23, align 4, !tbaa !10
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %24 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %25 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %26 = fmul nnan <4 x float> %broadcast.splat, %24
  %27 = fmul nnan <4 x float> %broadcast.splat, %25
  %28 = fmul nnan <4 x float> %26, splat (float f0x39800000)
  %29 = fmul nnan <4 x float> %27, splat (float f0x39800000)
  %30 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx9.us.i, i64 %index
  %31 = getelementptr inbounds nuw i8, ptr %30, i64 32
  %32 = getelementptr inbounds nuw i8, ptr %30, i64 48
  store <4 x float> %28, ptr %31, align 4, !tbaa !10
  store <4 x float> %29, ptr %32, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %33 = icmp eq i64 %index.next.1, 4096
  br i1 %33, label %for.cond2.for.inc12_crit_edge.us.i, label %vector.body, !llvm.loop !49

for.cond2.for.inc12_crit_edge.us.i:               ; preds = %vector.body
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond38.not.i = icmp eq i64 %indvars.iv.next35.i, 4096
  br i1 %exitcond38.not.i, label %_Z10init_arrayiiPfPA4096_f.exit, label %for.body.us.i, !llvm.loop !18

_Z10init_arrayiiPfPA4096_f.exit:                  ; preds = %for.cond2.for.inc12_crit_edge.us.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #17
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #16
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #16
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #17
  call void @_Z7ataxGpuiiPA4096_fPfS1_S1_S1_(i32 noundef 4096, i32 noundef 4096, ptr noundef nonnull %0, ptr noundef nonnull %3, ptr noundef nonnull %6, ptr noundef nonnull %12, ptr noundef nonnull %9) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #17
  %call.i.i64 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #18
  %cmp.not.i.i = icmp eq i32 %call.i.i64, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i65

if.then.i.i65:                                    ; preds = %_Z10init_arrayiiPfPA4096_f.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i64) #16
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiiPfPA4096_f.exit, %if.then.i.i65
  %34 = load i64, ptr %Tp.i.i, align 8, !tbaa !38
  %conv.i.i = sitofp i64 %34 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %35 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !41
  %conv2.i.i = sitofp i64 %35 to double
  %36 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #17
  store double %36, ptr @polybench_t_start, align 8, !tbaa !42
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(16384) %6, i8 0, i64 16384, i1 false), !tbaa !10
  %scevgep = getelementptr i8, ptr %6, i64 16384
  %37 = insertelement <2 x ptr> poison, ptr %0, i64 0
  %38 = insertelement <2 x ptr> %37, ptr %12, i64 1
  %39 = getelementptr i8, <2 x ptr> %38, <2 x i64> <i64 67108864, i64 16384>
  %40 = insertelement <2 x ptr> poison, ptr %6, i64 0
  %41 = shufflevector <2 x ptr> %40, <2 x ptr> poison, <2 x i32> zeroinitializer
  %42 = insertelement <2 x ptr> poison, ptr %scevgep, i64 0
  %43 = shufflevector <2 x ptr> %42, <2 x ptr> poison, <2 x i32> zeroinitializer
  %44 = icmp ult <2 x ptr> %41, %39
  %45 = icmp ult <2 x ptr> %38, %43
  %46 = and <2 x i1> %44, %45
  %47 = bitcast <2 x i1> %46 to i2
  %conflict.rdx.not = icmp eq i2 %47, 0
  br label %for.body3.us.us.i

for.body3.us.us.i:                                ; preds = %for.cond22.for.inc38_crit_edge.us.us.i, %_Z21polybench_timer_startv.exit
  %indvars.iv101.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next102.i, %for.cond22.for.inc38_crit_edge.us.us.i ]
  %arrayidx5.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %indvars.iv101.i
  store float 0.000000e+00, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %arrayidx12.us.us.i = getelementptr inbounds nuw [16384 x i8], ptr %0, i64 %indvars.iv101.i
  br label %for.body8.us.us.i

for.body8.us.us.i:                                ; preds = %for.body8.us.us.i, %for.body3.us.us.i
  %indvars.iv.i = phi i64 [ 0, %for.body3.us.us.i ], [ %indvars.iv.next.i.1, %for.body8.us.us.i ]
  %48 = phi float [ 0.000000e+00, %for.body3.us.us.i ], [ %54, %for.body8.us.us.i ]
  %arrayidx14.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us.i, i64 %indvars.iv.i
  %49 = load float, ptr %arrayidx14.us.us.i, align 4, !tbaa !10
  %arrayidx16.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %3, i64 %indvars.iv.i
  %50 = load float, ptr %arrayidx16.us.us.i, align 4, !tbaa !10
  %51 = call float @llvm.fmuladd.f32(float %49, float %50, float %48)
  store float %51, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %indvars.iv.next.i = or disjoint i64 %indvars.iv.i, 1
  %arrayidx14.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us.i, i64 %indvars.iv.next.i
  %52 = load float, ptr %arrayidx14.us.us.i.1, align 4, !tbaa !10
  %arrayidx16.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %3, i64 %indvars.iv.next.i
  %53 = load float, ptr %arrayidx16.us.us.i.1, align 4, !tbaa !10
  %54 = call float @llvm.fmuladd.f32(float %52, float %53, float %51)
  store float %54, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %exitcond.not.i.1 = icmp eq i64 %indvars.iv.next.i.1, 4096
  br i1 %exitcond.not.i.1, label %vector.memcheck, label %for.body8.us.us.i, !llvm.loop !26

vector.memcheck:                                  ; preds = %for.body8.us.us.i
  br i1 %conflict.rdx.not, label %vector.ph87, label %for.body24.us.us.i

vector.ph87:                                      ; preds = %vector.memcheck
  %55 = load float, ptr %arrayidx5.us.us.i, align 4, !tbaa !10, !alias.scope !50
  %broadcast.splatinsert93 = insertelement <4 x float> poison, float %55, i64 0
  %broadcast.splat94 = shufflevector <4 x float> %broadcast.splatinsert93, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body88

vector.body88:                                    ; preds = %vector.body88, %vector.ph87
  %index89 = phi i64 [ 0, %vector.ph87 ], [ %index.next95.1, %vector.body88 ]
  %56 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %index89
  %57 = getelementptr inbounds nuw i8, ptr %56, i64 16
  %wide.load = load <4 x float>, ptr %56, align 4, !tbaa !10, !alias.scope !53, !noalias !55
  %wide.load90 = load <4 x float>, ptr %57, align 4, !tbaa !10, !alias.scope !53, !noalias !55
  %58 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us.i, i64 %index89
  %59 = getelementptr inbounds nuw i8, ptr %58, i64 16
  %wide.load91 = load <4 x float>, ptr %58, align 4, !tbaa !10, !alias.scope !57
  %wide.load92 = load <4 x float>, ptr %59, align 4, !tbaa !10, !alias.scope !57
  %60 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load91, <4 x float> %broadcast.splat94, <4 x float> %wide.load)
  %61 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load92, <4 x float> %broadcast.splat94, <4 x float> %wide.load90)
  store <4 x float> %60, ptr %56, align 4, !tbaa !10, !alias.scope !53, !noalias !55
  store <4 x float> %61, ptr %57, align 4, !tbaa !10, !alias.scope !53, !noalias !55
  %index.next95 = or disjoint i64 %index89, 8
  %62 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %index.next95
  %63 = getelementptr inbounds nuw i8, ptr %62, i64 16
  %wide.load.1 = load <4 x float>, ptr %62, align 4, !tbaa !10, !alias.scope !53, !noalias !55
  %wide.load90.1 = load <4 x float>, ptr %63, align 4, !tbaa !10, !alias.scope !53, !noalias !55
  %64 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us.i, i64 %index.next95
  %65 = getelementptr inbounds nuw i8, ptr %64, i64 16
  %wide.load91.1 = load <4 x float>, ptr %64, align 4, !tbaa !10, !alias.scope !57
  %wide.load92.1 = load <4 x float>, ptr %65, align 4, !tbaa !10, !alias.scope !57
  %66 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load91.1, <4 x float> %broadcast.splat94, <4 x float> %wide.load.1)
  %67 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load92.1, <4 x float> %broadcast.splat94, <4 x float> %wide.load90.1)
  store <4 x float> %66, ptr %62, align 4, !tbaa !10, !alias.scope !53, !noalias !55
  store <4 x float> %67, ptr %63, align 4, !tbaa !10, !alias.scope !53, !noalias !55
  %index.next95.1 = add nuw nsw i64 %index89, 16
  %68 = icmp eq i64 %index.next95.1, 4096
  br i1 %68, label %for.cond22.for.inc38_crit_edge.us.us.i, label %vector.body88, !llvm.loop !58

for.body24.us.us.i:                               ; preds = %vector.memcheck, %for.body24.us.us.i
  %indvars.iv96.i = phi i64 [ %indvars.iv.next97.i.1, %for.body24.us.us.i ], [ 0, %vector.memcheck ]
  %arrayidx26.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv96.i
  %69 = load float, ptr %arrayidx26.us.us.i, align 4, !tbaa !10
  %arrayidx30.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us.i, i64 %indvars.iv96.i
  %70 = load float, ptr %arrayidx30.us.us.i, align 4, !tbaa !10
  %71 = load float, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %72 = call float @llvm.fmuladd.f32(float %70, float %71, float %69)
  store float %72, ptr %arrayidx26.us.us.i, align 4, !tbaa !10
  %indvars.iv.next97.i = or disjoint i64 %indvars.iv96.i, 1
  %arrayidx26.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv.next97.i
  %73 = load float, ptr %arrayidx26.us.us.i.1, align 4, !tbaa !10
  %arrayidx30.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.us.us.i, i64 %indvars.iv.next97.i
  %74 = load float, ptr %arrayidx30.us.us.i.1, align 4, !tbaa !10
  %75 = load float, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %76 = call float @llvm.fmuladd.f32(float %74, float %75, float %73)
  store float %76, ptr %arrayidx26.us.us.i.1, align 4, !tbaa !10
  %indvars.iv.next97.i.1 = add nuw nsw i64 %indvars.iv96.i, 2
  %exitcond100.not.i.1 = icmp eq i64 %indvars.iv.next97.i.1, 4096
  br i1 %exitcond100.not.i.1, label %for.cond22.for.inc38_crit_edge.us.us.i, label %for.body24.us.us.i, !llvm.loop !59

for.cond22.for.inc38_crit_edge.us.us.i:           ; preds = %vector.body88, %for.body24.us.us.i
  %indvars.iv.next102.i = add nuw nsw i64 %indvars.iv101.i, 1
  %exitcond105.not.i = icmp eq i64 %indvars.iv.next102.i, 4096
  br i1 %exitcond105.not.i, label %_Z8atax_cpuiiPA4096_fPfS1_S1_.exit, label %for.body3.us.us.i, !llvm.loop !37

_Z8atax_cpuiiPA4096_fPfS1_S1_.exit:               ; preds = %for.cond22.for.inc38_crit_edge.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i66) #17
  %call.i.i67 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i66, ptr noundef null) #18
  %cmp.not.i.i68 = icmp eq i32 %call.i.i67, 0
  br i1 %cmp.not.i.i68, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i69

if.then.i.i69:                                    ; preds = %_Z8atax_cpuiiPA4096_fPfS1_S1_.exit
  %call1.i.i70 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i67) #16
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z8atax_cpuiiPA4096_fPfS1_S1_.exit, %if.then.i.i69
  %77 = load i64, ptr %Tp.i.i66, align 8, !tbaa !38
  %conv.i.i71 = sitofp i64 %77 to double
  %tv_usec.i.i72 = getelementptr inbounds nuw i8, ptr %Tp.i.i66, i64 8
  %78 = load i64, ptr %tv_usec.i.i72, align 8, !tbaa !41
  %conv2.i.i73 = sitofp i64 %78 to double
  %79 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i73, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i71)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i66) #17
  store double %79, ptr @polybench_t_end, align 8, !tbaa !42
  %80 = load double, ptr @polybench_t_start, align 8, !tbaa !42
  %sub.i = fsub double %79, %80
  %call.i74 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #16
  br label %vector.body99

vector.body99:                                    ; preds = %vector.body99, %_Z20polybench_timer_stopv.exit
  %index100 = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %index.next103, %vector.body99 ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %_Z20polybench_timer_stopv.exit ], [ %111, %vector.body99 ]
  %81 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %index100
  %wide.load101 = load <4 x float>, ptr %81, align 4, !tbaa !10
  %82 = fpext <4 x float> %wide.load101 to <4 x double>
  %83 = getelementptr inbounds nuw [4 x i8], ptr %9, i64 %index100
  %wide.load102 = load <4 x float>, ptr %83, align 4, !tbaa !10
  %84 = fpext <4 x float> %wide.load102 to <4 x double>
  %85 = fcmp olt <4 x double> %82, splat (double f0xB690000000000000)
  %86 = fneg <4 x float> %wide.load101
  %87 = select <4 x i1> %85, <4 x float> %86, <4 x float> %wide.load101
  %88 = fpext <4 x float> %87 to <4 x double>
  %89 = fcmp uge <4 x double> %88, splat (double 1.000000e-02)
  %90 = fcmp olt <4 x double> %84, splat (double f0xB690000000000000)
  %91 = fneg <4 x float> %wide.load102
  %92 = select <4 x i1> %90, <4 x float> %91, <4 x float> %wide.load102
  %93 = fpext <4 x float> %92 to <4 x double>
  %94 = fcmp uge <4 x double> %93, splat (double 1.000000e-02)
  %95 = fsub <4 x double> %82, %84
  %96 = fptrunc <4 x double> %95 to <4 x float>
  %97 = fcmp olt <4 x double> %95, splat (double f0xB690000000000000)
  %98 = fneg <4 x float> %96
  %99 = select <4 x i1> %97, <4 x float> %98, <4 x float> %96
  %100 = fadd <4 x double> %82, splat (double f0x3E45798EE0000000)
  %101 = fptrunc <4 x double> %100 to <4 x float>
  %102 = fcmp olt <4 x double> %100, splat (double f0xB690000000000000)
  %103 = fneg <4 x float> %101
  %104 = select <4 x i1> %102, <4 x float> %103, <4 x float> %101
  %105 = fdiv <4 x float> %99, %104
  %106 = fcmp olt <4 x float> %105, zeroinitializer
  %107 = fneg <4 x float> %105
  %108 = select <4 x i1> %106, <4 x float> %107, <4 x float> %105
  %109 = fmul <4 x float> %108, splat (float 1.000000e+02)
  %110 = fcmp ogt <4 x float> %109, splat (float 5.000000e-01)
  %.not106 = select <4 x i1> %89, <4 x i1> splat (i1 true), <4 x i1> %94
  %narrow = select <4 x i1> %.not106, <4 x i1> %110, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %111 = add <4 x i32> %vec.phi, %predphi
  %index.next103 = add nuw i64 %index100, 4
  %112 = icmp eq i64 %index.next103, 4096
  br i1 %112, label %_Z14compareResultsiPfS_.exit, label %vector.body99, !llvm.loop !60

_Z14compareResultsiPfS_.exit:                     ; preds = %vector.body99
  %113 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %111)
  %call7.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-01, i32 noundef %113) #16
  call void @free(ptr noundef %0) #18
  call void @free(ptr noundef %3) #18
  call void @free(ptr noundef nonnull %6) #18
  call void @free(ptr noundef nonnull %9) #18
  call void @free(ptr noundef %12) #18
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #3 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #17
  store ptr null, ptr %newA.i, align 8, !tbaa !46
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #18
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !46
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !47
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

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #14

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #15

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
attributes #15 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
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
!16 = distinct !{!16, !13, !14, !15}
!17 = distinct !{!17, !13, !15, !14}
!18 = distinct !{!18, !13}
!19 = distinct !{!19, !13, !15, !14}
!20 = distinct !{!20, !13, !14, !15}
!21 = distinct !{!21, !13, !15, !14}
!22 = !{!7, !7, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"p1 float", !25, i64 0}
!25 = !{!"any pointer", !8, i64 0}
!26 = distinct !{!26, !13}
!27 = !{!28}
!28 = distinct !{!28, !29}
!29 = distinct !{!29, !"LVerDomain"}
!30 = !{!31}
!31 = distinct !{!31, !29}
!32 = !{!33, !28}
!33 = distinct !{!33, !29}
!34 = !{!33}
!35 = distinct !{!35, !13, !14, !15}
!36 = distinct !{!36, !13, !14}
!37 = distinct !{!37, !13}
!38 = !{!39, !40, i64 0}
!39 = !{!"_ZTS7timeval", !40, i64 0, !40, i64 8}
!40 = !{!"long", !8, i64 0}
!41 = !{!39, !40, i64 8}
!42 = !{!43, !43, i64 0}
!43 = !{!"double", !8, i64 0}
!44 = !{ptr @_Z27__device_stub__atax_kernel1iiPfS_S_}
!45 = !{ptr @_Z27__device_stub__atax_kernel2iiPfS_S_}
!46 = !{!25, !25, i64 0}
!47 = !{!48, !48, i64 0}
!48 = !{!"p1 _ZTS8_IO_FILE", !25, i64 0}
!49 = distinct !{!49, !13, !14, !15}
!50 = !{!51}
!51 = distinct !{!51, !52}
!52 = distinct !{!52, !"LVerDomain"}
!53 = !{!54}
!54 = distinct !{!54, !52}
!55 = !{!56, !51}
!56 = distinct !{!56, !52}
!57 = !{!56}
!58 = distinct !{!58, !13, !14, !15}
!59 = distinct !{!59, !13, !14}
!60 = distinct !{!60, !13, !14, !15}
