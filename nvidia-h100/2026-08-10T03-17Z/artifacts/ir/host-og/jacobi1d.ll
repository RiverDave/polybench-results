; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/JACOBI1D/jacobi1D.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/JACOBI1D/jacobi1D.cu"
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
define dso_local void @_Z10init_arrayiPfS_(i32 noundef %n, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B) local_unnamed_addr #1 {
entry:
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %B13 = ptrtoaddr ptr %B to i64
  %A14 = ptrtoaddr ptr %A to i64
  %wide.trip.count = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 4
  %0 = sub i64 %A14, %B13
  %diff.check = icmp ugt i64 %0, -16
  %or.cond = or i1 %min.iters.check, %diff.check
  br i1 %or.cond, label %for.body.preheader15, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %1 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %2 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %1, <4 x float> splat (float 4.000000e+00), <4 x float> splat (float 1.000000e+01))
  %3 = fmul nnan <4 x float> %2, splat (float f0x39800000)
  %4 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %index
  store <4 x float> %3, ptr %4, align 4, !tbaa !10
  %5 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %1, <4 x float> splat (float 7.000000e+00), <4 x float> splat (float 1.100000e+01))
  %6 = fmul nnan <4 x float> %5, splat (float f0x39800000)
  %7 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %index
  store <4 x float> %6, ptr %7, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %8 = icmp eq i64 %index.next, %n.vec
  br i1 %8, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.end, label %for.body.preheader15

for.body.preheader15:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader15
  %9 = trunc nuw nsw i64 %indvars.iv.ph to i32
  %conv.prol = uitofp nneg i32 %9 to float
  %arrayidx.prol = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv.ph
  %10 = insertelement <2 x float> poison, float %conv.prol, i64 0
  %11 = shufflevector <2 x float> %10, <2 x float> poison, <2 x i32> zeroinitializer
  %12 = tail call nnan <2 x float> @llvm.fmuladd.v2f32(<2 x float> %11, <2 x float> <float 4.000000e+00, float 7.000000e+00>, <2 x float> <float 1.000000e+01, float 1.100000e+01>)
  %13 = fmul nnan <2 x float> %12, splat (float f0x39800000)
  %14 = extractelement <2 x float> %13, i64 0
  store float %14, ptr %arrayidx.prol, align 4, !tbaa !10
  %arrayidx4.prol = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv.ph
  %15 = extractelement <2 x float> %13, i64 1
  store float %15, ptr %arrayidx4.prol, align 4, !tbaa !10
  %indvars.iv.next.prol = or disjoint i64 %indvars.iv.ph, 1
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.prol, %for.body.preheader15
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body.preheader15 ], [ %indvars.iv.next.prol, %for.body.prol ]
  %16 = add nsw i64 %wide.trip.count, -1
  %17 = icmp eq i64 %indvars.iv.ph, %16
  br i1 %17, label %for.end, label %for.body

for.body:                                         ; preds = %for.body.prol.loopexit, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body ], [ %indvars.iv.unr, %for.body.prol.loopexit ]
  %18 = trunc nuw nsw i64 %indvars.iv to i32
  %conv = uitofp nneg i32 %18 to float
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv
  %19 = insertelement <2 x float> poison, float %conv, i64 0
  %20 = shufflevector <2 x float> %19, <2 x float> poison, <2 x i32> zeroinitializer
  %21 = tail call nnan <2 x float> @llvm.fmuladd.v2f32(<2 x float> %20, <2 x float> <float 4.000000e+00, float 7.000000e+00>, <2 x float> <float 1.000000e+01, float 1.100000e+01>)
  %22 = fmul nnan <2 x float> %21, splat (float f0x39800000)
  %23 = extractelement <2 x float> %22, i64 0
  store float %23, ptr %arrayidx, align 4, !tbaa !10
  %arrayidx4 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv
  %24 = extractelement <2 x float> %22, i64 1
  store float %24, ptr %arrayidx4, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = trunc nuw nsw i64 %indvars.iv.next to i32
  %conv.1 = uitofp nneg i32 %25 to float
  %arrayidx.1 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv.next
  %26 = insertelement <2 x float> poison, float %conv.1, i64 0
  %27 = shufflevector <2 x float> %26, <2 x float> poison, <2 x i32> zeroinitializer
  %28 = tail call nnan <2 x float> @llvm.fmuladd.v2f32(<2 x float> %27, <2 x float> <float 4.000000e+00, float 7.000000e+00>, <2 x float> <float 1.000000e+01, float 1.100000e+01>)
  %29 = fmul nnan <2 x float> %28, splat (float f0x39800000)
  %30 = extractelement <2 x float> %29, i64 0
  store float %30, ptr %arrayidx.1, align 4, !tbaa !10
  %arrayidx4.1 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv.next
  %31 = extractelement <2 x float> %29, i64 1
  store float %31, ptr %arrayidx4.1, align 4, !tbaa !10
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.not.1, label %for.end, label %for.body, !llvm.loop !16

for.end:                                          ; preds = %for.body.prol.loopexit, %for.body, %middle.block, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z14runJacobi1DCpuiiPfS_(i32 noundef %tsteps, i32 noundef %n, ptr nofree noundef captures(none) %A, ptr nofree noundef captures(none) %B) local_unnamed_addr #3 {
entry:
  %B59 = ptrtoaddr ptr %B to i64
  %A58 = ptrtoaddr ptr %A to i64
  %cmp48 = icmp sgt i32 %tsteps, 0
  %cmp244 = icmp sgt i32 %n, 2
  %or.cond = and i1 %cmp48, %cmp244
  br i1 %or.cond, label %for.cond1.preheader.us.us.preheader, label %for.cond.cleanup

for.cond1.preheader.us.us.preheader:              ; preds = %entry
  %sub = add nsw i32 %n, -1
  %wide.trip.count = zext i32 %sub to i64
  %scevgep = getelementptr i8, ptr %B, i64 4
  %0 = shl nuw nsw i64 %wide.trip.count, 2
  %scevgep62 = getelementptr i8, ptr %B, i64 %0
  %1 = getelementptr i8, ptr %A, i64 %0
  %scevgep63 = getelementptr i8, ptr %1, i64 4
  %2 = add nsw i64 %wide.trip.count, -1
  %min.iters.check65 = icmp ult i64 %2, 4
  %bound0 = icmp ult ptr %scevgep, %scevgep63
  %bound1 = icmp ult ptr %A, %scevgep62
  %found.conflict = and i1 %bound0, %bound1
  %n.vec68 = and i64 %2, -4
  %3 = or disjoint i64 %n.vec68, 1
  %cmp.n76 = icmp eq i64 %2, %n.vec68
  %4 = and i32 %n, 1
  %lcmp.mod.not = icmp eq i32 %4, 0
  %5 = add nsw i64 %wide.trip.count, -1
  %6 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i64 %6, 8
  %7 = sub i64 %B59, %A58
  %diff.check = icmp ugt i64 %7, -32
  %or.cond78 = or i1 %min.iters.check, %diff.check
  %n.vec = and i64 %6, -8
  %8 = or disjoint i64 %n.vec, 1
  %cmp.n = icmp eq i64 %6, %n.vec
  br label %for.cond1.preheader.us.us

for.cond1.preheader.us.us:                        ; preds = %for.cond1.preheader.us.us.preheader, %for.cond15.for.cond.cleanup18_crit_edge.us.us
  %t.049.us.us = phi i32 [ %inc28.us.us, %for.cond15.for.cond.cleanup18_crit_edge.us.us ], [ 0, %for.cond1.preheader.us.us.preheader ]
  %brmerge = select i1 %min.iters.check65, i1 true, i1 %found.conflict
  br i1 %brmerge, label %for.body4.us.us.preheader, label %vector.body69

vector.body69:                                    ; preds = %for.cond1.preheader.us.us, %vector.body69
  %index70 = phi i64 [ %index.next74, %vector.body69 ], [ 0, %for.cond1.preheader.us.us ]
  %9 = or disjoint i64 %index70, 1
  %10 = getelementptr [4 x i8], ptr %A, i64 %9
  %11 = getelementptr i8, ptr %10, i64 -4
  %wide.load71 = load <4 x float>, ptr %11, align 4, !tbaa !10, !alias.scope !17
  %wide.load72 = load <4 x float>, ptr %10, align 4, !tbaa !10, !alias.scope !17
  %12 = fadd <4 x float> %wide.load71, %wide.load72
  %13 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %index70
  %14 = getelementptr inbounds nuw i8, ptr %13, i64 8
  %wide.load73 = load <4 x float>, ptr %14, align 4, !tbaa !10, !alias.scope !17
  %15 = fadd <4 x float> %12, %wide.load73
  %16 = fpext <4 x float> %15 to <4 x double>
  %17 = fmul <4 x double> %16, splat (double 3.333300e-01)
  %18 = fptrunc <4 x double> %17 to <4 x float>
  %19 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %9
  store <4 x float> %18, ptr %19, align 4, !tbaa !10, !alias.scope !20, !noalias !17
  %index.next74 = add nuw i64 %index70, 4
  %20 = icmp eq i64 %index.next74, %n.vec68
  br i1 %20, label %middle.block75, label %vector.body69, !llvm.loop !22

middle.block75:                                   ; preds = %vector.body69
  br i1 %cmp.n76, label %for.body19.us.us.preheader, label %for.body4.us.us.preheader

for.body4.us.us.preheader:                        ; preds = %for.cond1.preheader.us.us, %middle.block75
  %indvars.iv.ph = phi i64 [ %3, %middle.block75 ], [ 1, %for.cond1.preheader.us.us ]
  br i1 %lcmp.mod.not, label %for.body4.us.us.prol.loopexit, label %for.body4.us.us.prol

for.body4.us.us.prol:                             ; preds = %for.body4.us.us.preheader
  %21 = getelementptr [4 x i8], ptr %A, i64 %indvars.iv.ph
  %arrayidx.us.us.prol = getelementptr i8, ptr %21, i64 -4
  %22 = load float, ptr %arrayidx.us.us.prol, align 4, !tbaa !10
  %23 = load float, ptr %21, align 4, !tbaa !10
  %add.us.us.prol = fadd float %22, %23
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  %arrayidx10.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv.next.prol
  %24 = load float, ptr %arrayidx10.us.us.prol, align 4, !tbaa !10
  %add11.us.us.prol = fadd float %add.us.us.prol, %24
  %conv.us.us.prol = fpext float %add11.us.us.prol to double
  %mul.us.us.prol = fmul double %conv.us.us.prol, 3.333300e-01
  %conv12.us.us.prol = fptrunc double %mul.us.us.prol to float
  %arrayidx14.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv.ph
  store float %conv12.us.us.prol, ptr %arrayidx14.us.us.prol, align 4, !tbaa !10
  br label %for.body4.us.us.prol.loopexit

for.body4.us.us.prol.loopexit:                    ; preds = %for.body4.us.us.prol, %for.body4.us.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body4.us.us.preheader ], [ %indvars.iv.next.prol, %for.body4.us.us.prol ]
  %25 = icmp eq i64 %indvars.iv.ph, %5
  br i1 %25, label %for.body19.us.us.preheader, label %for.body4.us.us

for.body4.us.us:                                  ; preds = %for.body4.us.us.prol.loopexit, %for.body4.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body4.us.us ], [ %indvars.iv.unr, %for.body4.us.us.prol.loopexit ]
  %26 = getelementptr [4 x i8], ptr %A, i64 %indvars.iv
  %arrayidx.us.us = getelementptr i8, ptr %26, i64 -4
  %27 = load float, ptr %arrayidx.us.us, align 4, !tbaa !10
  %28 = load float, ptr %26, align 4, !tbaa !10
  %add.us.us = fadd float %27, %28
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx10.us.us = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv.next
  %29 = load float, ptr %arrayidx10.us.us, align 4, !tbaa !10
  %add11.us.us = fadd float %add.us.us, %29
  %conv.us.us = fpext float %add11.us.us to double
  %mul.us.us = fmul double %conv.us.us, 3.333300e-01
  %conv12.us.us = fptrunc double %mul.us.us to float
  %arrayidx14.us.us = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv
  store float %conv12.us.us, ptr %arrayidx14.us.us, align 4, !tbaa !10
  %30 = getelementptr [4 x i8], ptr %A, i64 %indvars.iv.next
  %arrayidx.us.us.1 = getelementptr i8, ptr %30, i64 -4
  %31 = load float, ptr %arrayidx.us.us.1, align 4, !tbaa !10
  %32 = load float, ptr %30, align 4, !tbaa !10
  %add.us.us.1 = fadd float %31, %32
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx10.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv.next.1
  %33 = load float, ptr %arrayidx10.us.us.1, align 4, !tbaa !10
  %add11.us.us.1 = fadd float %add.us.us.1, %33
  %conv.us.us.1 = fpext float %add11.us.us.1 to double
  %mul.us.us.1 = fmul double %conv.us.us.1, 3.333300e-01
  %conv12.us.us.1 = fptrunc double %mul.us.us.1 to float
  %arrayidx14.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv.next
  store float %conv12.us.us.1, ptr %arrayidx14.us.us.1, align 4, !tbaa !10
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.not.1, label %for.body19.us.us.preheader, label %for.body4.us.us, !llvm.loop !23

for.body19.us.us.preheader:                       ; preds = %for.body4.us.us.prol.loopexit, %for.body4.us.us, %middle.block75
  br i1 %or.cond78, label %for.body19.us.us.preheader79, label %vector.body

vector.body:                                      ; preds = %for.body19.us.us.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.body19.us.us.preheader ]
  %34 = or disjoint i64 %index, 1
  %35 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %34
  %36 = getelementptr inbounds nuw i8, ptr %35, i64 16
  %wide.load = load <4 x float>, ptr %35, align 4, !tbaa !10
  %wide.load60 = load <4 x float>, ptr %36, align 4, !tbaa !10
  %37 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %34
  %38 = getelementptr inbounds nuw i8, ptr %37, i64 16
  store <4 x float> %wide.load, ptr %37, align 4, !tbaa !10
  store <4 x float> %wide.load60, ptr %38, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %39 = icmp eq i64 %index.next, %n.vec
  br i1 %39, label %middle.block, label %vector.body, !llvm.loop !24

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond15.for.cond.cleanup18_crit_edge.us.us, label %for.body19.us.us.preheader79

for.body19.us.us.preheader79:                     ; preds = %for.body19.us.us.preheader, %middle.block
  %indvars.iv52.ph = phi i64 [ 1, %for.body19.us.us.preheader ], [ %8, %middle.block ]
  %40 = sub nsw i64 %wide.trip.count, %indvars.iv52.ph
  %xtraiter80 = and i64 %40, 3
  %lcmp.mod81.not = icmp eq i64 %xtraiter80, 0
  br i1 %lcmp.mod81.not, label %for.body19.us.us.prol.loopexit, label %for.body19.us.us.prol

for.body19.us.us.prol:                            ; preds = %for.body19.us.us.preheader79, %for.body19.us.us.prol
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %for.body19.us.us.prol ], [ %indvars.iv52.ph, %for.body19.us.us.preheader79 ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body19.us.us.prol ], [ 0, %for.body19.us.us.preheader79 ]
  %arrayidx21.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv52.prol
  %41 = load float, ptr %arrayidx21.us.us.prol, align 4, !tbaa !10
  %arrayidx23.us.us.prol = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv52.prol
  store float %41, ptr %arrayidx23.us.us.prol, align 4, !tbaa !10
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter80
  br i1 %prol.iter.cmp.not, label %for.body19.us.us.prol.loopexit, label %for.body19.us.us.prol, !llvm.loop !25

for.body19.us.us.prol.loopexit:                   ; preds = %for.body19.us.us.prol, %for.body19.us.us.preheader79
  %indvars.iv52.unr = phi i64 [ %indvars.iv52.ph, %for.body19.us.us.preheader79 ], [ %indvars.iv.next53.prol, %for.body19.us.us.prol ]
  %42 = sub nsw i64 %indvars.iv52.ph, %wide.trip.count
  %43 = icmp ugt i64 %42, -4
  br i1 %43, label %for.cond15.for.cond.cleanup18_crit_edge.us.us, label %for.body19.us.us

for.body19.us.us:                                 ; preds = %for.body19.us.us.prol.loopexit, %for.body19.us.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.3, %for.body19.us.us ], [ %indvars.iv52.unr, %for.body19.us.us.prol.loopexit ]
  %arrayidx21.us.us = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv52
  %44 = load float, ptr %arrayidx21.us.us, align 4, !tbaa !10
  %arrayidx23.us.us = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv52
  store float %44, ptr %arrayidx23.us.us, align 4, !tbaa !10
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %arrayidx21.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv.next53
  %45 = load float, ptr %arrayidx21.us.us.1, align 4, !tbaa !10
  %arrayidx23.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv.next53
  store float %45, ptr %arrayidx23.us.us.1, align 4, !tbaa !10
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %arrayidx21.us.us.2 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv.next53.1
  %46 = load float, ptr %arrayidx21.us.us.2, align 4, !tbaa !10
  %arrayidx23.us.us.2 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv.next53.1
  store float %46, ptr %arrayidx23.us.us.2, align 4, !tbaa !10
  %indvars.iv.next53.2 = add nuw nsw i64 %indvars.iv52, 3
  %arrayidx21.us.us.3 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv.next53.2
  %47 = load float, ptr %arrayidx21.us.us.3, align 4, !tbaa !10
  %arrayidx23.us.us.3 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv.next53.2
  store float %47, ptr %arrayidx23.us.us.3, align 4, !tbaa !10
  %indvars.iv.next53.3 = add nuw nsw i64 %indvars.iv52, 4
  %exitcond56.not.3 = icmp eq i64 %indvars.iv.next53.3, %wide.trip.count
  br i1 %exitcond56.not.3, label %for.cond15.for.cond.cleanup18_crit_edge.us.us, label %for.body19.us.us, !llvm.loop !27

for.cond15.for.cond.cleanup18_crit_edge.us.us:    ; preds = %for.body19.us.us.prol.loopexit, %for.body19.us.us, %middle.block
  %inc28.us.us = add nuw nsw i32 %t.049.us.us, 1
  %exitcond57.not = icmp eq i32 %inc28.us.us, %tsteps
  br i1 %exitcond57.not, label %for.cond.cleanup, label %for.cond1.preheader.us.us, !llvm.loop !28

for.cond.cleanup:                                 ; preds = %for.cond15.for.cond.cleanup18_crit_edge.us.us, %entry
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z36__device_stub__runJacobiCUDA_kernel1iPfS_(i32 noundef %n, ptr noundef %A, ptr noundef %B) #4 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !29
  store ptr %A, ptr %A.addr, align 8, !tbaa !30
  store ptr %B, ptr %B.addr, align 8, !tbaa !30
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
define dso_local void @_Z36__device_stub__runJacobiCUDA_kernel2iPfS_(i32 noundef %n, ptr noundef %A, ptr noundef %B) #4 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !29
  store ptr %A, ptr %A.addr, align 8, !tbaa !30
  store ptr %B, ptr %B.addr, align 8, !tbaa !30
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
define dso_local void @_Z14compareResultsiPfS_S_S_(i32 noundef %n, ptr nofree noundef readonly captures(none) %a, ptr nofree noundef readonly captures(none) %a_outputFromGpu, ptr nofree noundef readonly captures(none) %b, ptr nofree noundef readonly captures(none) %b_outputFromGpu) local_unnamed_addr #5 {
entry:
  %cmp65 = icmp sgt i32 %n, 0
  br i1 %cmp65, label %for.body.preheader, label %for.end24

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 4
  br i1 %min.iters.check, label %for.body.preheader98, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %32, %vector.body ]
  %0 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %index
  %wide.load = load <4 x float>, ptr %0, align 4, !tbaa !10
  %1 = fpext <4 x float> %wide.load to <4 x double>
  %2 = getelementptr inbounds nuw [4 x i8], ptr %a_outputFromGpu, i64 %index
  %wide.load79 = load <4 x float>, ptr %2, align 4, !tbaa !10
  %3 = fpext <4 x float> %wide.load79 to <4 x double>
  %4 = fcmp olt <4 x double> %1, splat (double f0xB690000000000000)
  %5 = fneg <4 x float> %wide.load
  %6 = select <4 x i1> %4, <4 x float> %5, <4 x float> %wide.load
  %7 = fpext <4 x float> %6 to <4 x double>
  %8 = fcmp uge <4 x double> %7, splat (double 1.000000e-02)
  %9 = fcmp olt <4 x double> %3, splat (double f0xB690000000000000)
  %10 = fneg <4 x float> %wide.load79
  %11 = select <4 x i1> %9, <4 x float> %10, <4 x float> %wide.load79
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
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !33

middle.block:                                     ; preds = %vector.body
  %34 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %32)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.body9.preheader, label %for.body.preheader98

for.body.preheader98:                             ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %fail.067.ph = phi i32 [ 0, %for.body.preheader ], [ %34, %middle.block ]
  br label %for.body

for.body9.preheader:                              ; preds = %_Z11percentDiffdd.exit, %middle.block
  %fail.1.lcssa = phi i32 [ %34, %middle.block ], [ %fail.1, %_Z11percentDiffdd.exit ]
  %wide.trip.count76 = zext nneg i32 %n to i64
  %min.iters.check81 = icmp ult i32 %n, 4
  br i1 %min.iters.check81, label %for.body9.preheader97, label %vector.ph82

vector.ph82:                                      ; preds = %for.body9.preheader
  %n.vec84 = and i64 %wide.trip.count, 2147483644
  %35 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.1.lcssa, i64 0
  br label %vector.body85

vector.body85:                                    ; preds = %vector.body85, %vector.ph82
  %index86 = phi i64 [ 0, %vector.ph82 ], [ %index.next91, %vector.body85 ]
  %vec.phi87 = phi <4 x i32> [ %35, %vector.ph82 ], [ %68, %vector.body85 ]
  %36 = getelementptr inbounds nuw [4 x i8], ptr %b, i64 %index86
  %wide.load88 = load <4 x float>, ptr %36, align 4, !tbaa !10
  %37 = fpext <4 x float> %wide.load88 to <4 x double>
  %38 = getelementptr inbounds nuw [4 x i8], ptr %b_outputFromGpu, i64 %index86
  %wide.load89 = load <4 x float>, ptr %38, align 4, !tbaa !10
  %39 = fpext <4 x float> %wide.load89 to <4 x double>
  %40 = fcmp olt <4 x double> %37, splat (double f0xB690000000000000)
  %41 = fneg <4 x float> %wide.load88
  %42 = select <4 x i1> %40, <4 x float> %41, <4 x float> %wide.load88
  %43 = fpext <4 x float> %42 to <4 x double>
  %44 = fcmp uge <4 x double> %43, splat (double 1.000000e-02)
  %45 = fcmp olt <4 x double> %39, splat (double f0xB690000000000000)
  %46 = fneg <4 x float> %wide.load89
  %47 = select <4 x i1> %45, <4 x float> %46, <4 x float> %wide.load89
  %48 = fpext <4 x float> %47 to <4 x double>
  %49 = fcmp uge <4 x double> %48, splat (double 1.000000e-02)
  %50 = select <4 x i1> %44, <4 x i1> splat (i1 true), <4 x i1> %49
  %51 = fsub <4 x double> %37, %39
  %52 = fptrunc <4 x double> %51 to <4 x float>
  %53 = fcmp olt <4 x double> %51, splat (double f0xB690000000000000)
  %54 = fneg <4 x float> %52
  %55 = select <4 x i1> %53, <4 x float> %54, <4 x float> %52
  %56 = fadd <4 x double> %37, splat (double f0x3E45798EE0000000)
  %57 = fptrunc <4 x double> %56 to <4 x float>
  %58 = fcmp olt <4 x double> %56, splat (double f0xB690000000000000)
  %59 = fneg <4 x float> %57
  %60 = select <4 x i1> %58, <4 x float> %59, <4 x float> %57
  %61 = fdiv <4 x float> %55, %60
  %62 = fcmp olt <4 x float> %61, zeroinitializer
  %63 = fneg <4 x float> %61
  %64 = select <4 x i1> %62, <4 x float> %63, <4 x float> %61
  %65 = fmul <4 x float> %64, splat (float 1.000000e+02)
  %66 = fpext <4 x float> %65 to <4 x double>
  %67 = fcmp ogt <4 x double> %66, splat (double 5.000000e-02)
  %narrow96 = select <4 x i1> %50, <4 x i1> %67, <4 x i1> zeroinitializer
  %predphi90 = zext <4 x i1> %narrow96 to <4 x i32>
  %68 = add <4 x i32> %vec.phi87, %predphi90
  %index.next91 = add nuw i64 %index86, 4
  %69 = icmp eq i64 %index.next91, %n.vec84
  br i1 %69, label %middle.block92, label %vector.body85, !llvm.loop !34

middle.block92:                                   ; preds = %vector.body85
  %70 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %68)
  %cmp.n93 = icmp eq i64 %n.vec84, %wide.trip.count
  br i1 %cmp.n93, label %for.end24, label %for.body9.preheader97

for.body9.preheader97:                            ; preds = %for.body9.preheader, %middle.block92
  %indvars.iv73.ph = phi i64 [ 0, %for.body9.preheader ], [ %n.vec84, %middle.block92 ]
  %fail.270.ph = phi i32 [ %fail.1.lcssa, %for.body9.preheader ], [ %70, %middle.block92 ]
  br label %for.body9

for.body:                                         ; preds = %for.body.preheader98, %_Z11percentDiffdd.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit ], [ %indvars.iv.ph, %for.body.preheader98 ]
  %fail.067 = phi i32 [ %fail.1, %_Z11percentDiffdd.exit ], [ %fail.067.ph, %for.body.preheader98 ]
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %indvars.iv
  %71 = load float, ptr %arrayidx, align 4, !tbaa !10
  %conv = fpext float %71 to double
  %arrayidx2 = getelementptr inbounds nuw [4 x i8], ptr %a_outputFromGpu, i64 %indvars.iv
  %72 = load float, ptr %arrayidx2, align 4, !tbaa !10
  %conv3 = fpext float %72 to double
  %cmp.i.i = fcmp olt double %conv, f0xB690000000000000
  %mul.i.i = fneg float %71
  %retval.0.i.i = select i1 %cmp.i.i, float %mul.i.i, float %71
  %conv1.i = fpext float %retval.0.i.i to double
  %cmp.i = fcmp olt double %conv1.i, 1.000000e-02
  br i1 %cmp.i, label %land.lhs.true.i, label %if.else.i

land.lhs.true.i:                                  ; preds = %for.body
  %cmp.i14.i = fcmp olt double %conv3, f0xB690000000000000
  %mul.i15.i = fneg float %72
  %retval.0.i16.i = select i1 %cmp.i14.i, float %mul.i15.i, float %72
  %conv4.i = fpext float %retval.0.i16.i to double
  %cmp5.i = fcmp olt double %conv4.i, 1.000000e-02
  br i1 %cmp5.i, label %_Z11percentDiffdd.exit, label %if.else.i

if.else.i:                                        ; preds = %land.lhs.true.i, %for.body
  %73 = insertelement <2 x double> poison, double %conv, i64 0
  %74 = shufflevector <2 x double> %73, <2 x double> poison, <2 x i32> zeroinitializer
  %75 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv3, i64 0
  %76 = fsub <2 x double> %74, %75
  %77 = fptrunc <2 x double> %76 to <2 x float>
  %78 = fcmp olt <2 x double> %76, splat (double f0xB690000000000000)
  %79 = fneg <2 x float> %77
  %80 = select <2 x i1> %78, <2 x float> %79, <2 x float> %77
  %81 = extractelement <2 x float> %80, i64 0
  %82 = extractelement <2 x float> %80, i64 1
  %div.i = fdiv float %81, %82
  %cmp.i23.i = fcmp olt float %div.i, 0.000000e+00
  %mul.i24.i = fneg float %div.i
  %retval.0.i25.i = select i1 %cmp.i23.i, float %mul.i24.i, float %div.i
  %mul.i = fmul float %retval.0.i25.i, 1.000000e+02
  %83 = fpext float %mul.i to double
  %84 = fcmp ogt double %83, 5.000000e-02
  %85 = zext i1 %84 to i32
  br label %_Z11percentDiffdd.exit

_Z11percentDiffdd.exit:                           ; preds = %land.lhs.true.i, %if.else.i
  %retval.0.i = phi i32 [ %85, %if.else.i ], [ 0, %land.lhs.true.i ]
  %fail.1 = add nuw nsw i32 %retval.0.i, %fail.067
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.body9.preheader, label %for.body, !llvm.loop !35

for.body9:                                        ; preds = %for.body9.preheader97, %_Z11percentDiffdd.exit64
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %_Z11percentDiffdd.exit64 ], [ %indvars.iv73.ph, %for.body9.preheader97 ]
  %fail.270 = phi i32 [ %fail.3, %_Z11percentDiffdd.exit64 ], [ %fail.270.ph, %for.body9.preheader97 ]
  %arrayidx11 = getelementptr inbounds nuw [4 x i8], ptr %b, i64 %indvars.iv73
  %86 = load float, ptr %arrayidx11, align 4, !tbaa !10
  %conv12 = fpext float %86 to double
  %arrayidx14 = getelementptr inbounds nuw [4 x i8], ptr %b_outputFromGpu, i64 %indvars.iv73
  %87 = load float, ptr %arrayidx14, align 4, !tbaa !10
  %conv15 = fpext float %87 to double
  %cmp.i.i36 = fcmp olt double %conv12, f0xB690000000000000
  %mul.i.i37 = fneg float %86
  %retval.0.i.i38 = select i1 %cmp.i.i36, float %mul.i.i37, float %86
  %conv1.i39 = fpext float %retval.0.i.i38 to double
  %cmp.i40 = fcmp olt double %conv1.i39, 1.000000e-02
  br i1 %cmp.i40, label %land.lhs.true.i58, label %if.else.i41

land.lhs.true.i58:                                ; preds = %for.body9
  %cmp.i14.i59 = fcmp olt double %conv15, f0xB690000000000000
  %mul.i15.i60 = fneg float %87
  %retval.0.i16.i61 = select i1 %cmp.i14.i59, float %mul.i15.i60, float %87
  %conv4.i62 = fpext float %retval.0.i16.i61 to double
  %cmp5.i63 = fcmp olt double %conv4.i62, 1.000000e-02
  br i1 %cmp5.i63, label %_Z11percentDiffdd.exit64, label %if.else.i41

if.else.i41:                                      ; preds = %land.lhs.true.i58, %for.body9
  %88 = insertelement <2 x double> poison, double %conv12, i64 0
  %89 = shufflevector <2 x double> %88, <2 x double> poison, <2 x i32> zeroinitializer
  %90 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv15, i64 0
  %91 = fsub <2 x double> %89, %90
  %92 = fptrunc <2 x double> %91 to <2 x float>
  %93 = fcmp olt <2 x double> %91, splat (double f0xB690000000000000)
  %94 = fneg <2 x float> %92
  %95 = select <2 x i1> %93, <2 x float> %94, <2 x float> %92
  %96 = extractelement <2 x float> %95, i64 0
  %97 = extractelement <2 x float> %95, i64 1
  %div.i52 = fdiv float %96, %97
  %cmp.i23.i53 = fcmp olt float %div.i52, 0.000000e+00
  %mul.i24.i54 = fneg float %div.i52
  %retval.0.i25.i55 = select i1 %cmp.i23.i53, float %mul.i24.i54, float %div.i52
  %mul.i56 = fmul float %retval.0.i25.i55, 1.000000e+02
  %98 = fpext float %mul.i56 to double
  %99 = fcmp ogt double %98, 5.000000e-02
  %100 = zext i1 %99 to i32
  br label %_Z11percentDiffdd.exit64

_Z11percentDiffdd.exit64:                         ; preds = %land.lhs.true.i58, %if.else.i41
  %retval.0.i57 = phi i32 [ %100, %if.else.i41 ], [ 0, %land.lhs.true.i58 ]
  %fail.3 = add nuw nsw i32 %retval.0.i57, %fail.270
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond77.not = icmp eq i64 %indvars.iv.next74, %wide.trip.count76
  br i1 %exitcond77.not, label %for.end24, label %for.body9, !llvm.loop !36

for.end24:                                        ; preds = %_Z11percentDiffdd.exit64, %middle.block92, %entry
  %fail.2.lcssa = phi i32 [ 0, %entry ], [ %70, %middle.block92 ], [ %fail.3, %_Z11percentDiffdd.exit64 ]
  %call25 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %fail.2.lcssa) #14
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #6

; Function Attrs: mustprogress uwtable
define dso_local void @_Z15runJacobi1DCUDAiiPfS_S_S_(i32 noundef %tsteps, i32 noundef %n, ptr noundef %A, ptr noundef %B, ptr noundef %A_outputFromGpu, ptr noundef %B_outputFromGpu) local_unnamed_addr #7 {
entry:
  %n.addr.i36 = alloca i32, align 4
  %A.addr.i37 = alloca ptr, align 8
  %B.addr.i38 = alloca ptr, align 8
  %grid_dim.i39 = alloca %struct.dim3, align 8
  %block_dim.i40 = alloca %struct.dim3, align 8
  %shmem_size.i41 = alloca i64, align 8
  %stream.i42 = alloca ptr, align 8
  %kernel_args1.i43 = alloca [3 x ptr], align 16
  %n.addr.i = alloca i32, align 4
  %A.addr.i = alloca ptr, align 8
  %B.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [3 x ptr], align 16
  %Tp.i.i26 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %Agpu = alloca ptr, align 8
  %Bgpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Agpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Bgpu) #15
  %call.i = call noundef i32 @cudaMalloc(ptr noundef nonnull %Agpu, i64 noundef 16384) #14
  %call.i23 = call noundef i32 @cudaMalloc(ptr noundef nonnull %Bgpu, i64 noundef 16384) #14
  %0 = load ptr, ptr %Agpu, align 8, !tbaa !30
  %call2 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 16384, i32 noundef 1) #14
  %1 = load ptr, ptr %Bgpu, align 8, !tbaa !30
  %call3 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %B, i64 noundef 16384, i32 noundef 1) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %call.i.i) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %2 = load i64, ptr %Tp.i.i, align 8, !tbaa !37
  %conv.i.i = sitofp i64 %2 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %3 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !40
  %conv2.i.i = sitofp i64 %3 to double
  %4 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %4, ptr @polybench_t_start, align 8, !tbaa !41
  %cmp56 = icmp sgt i32 %tsteps, 0
  br i1 %cmp56, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %_Z21polybench_timer_startv.exit
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %7 = getelementptr inbounds nuw i8, ptr %kernel_args1.i43, i64 8
  %8 = getelementptr inbounds nuw i8, ptr %kernel_args1.i43, i64 16
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i45 = getelementptr inbounds nuw i8, ptr %grid_dim.i39, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i48 = getelementptr inbounds nuw i8, ptr %block_dim.i40, i64 8
  br label %for.body

for.cond.cleanup:                                 ; preds = %kcall.end14, %_Z21polybench_timer_startv.exit
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i26) #15
  %call.i.i27 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i26, ptr noundef null) #16
  %cmp.not.i.i28 = icmp eq i32 %call.i.i27, 0
  br i1 %cmp.not.i.i28, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i29

if.then.i.i29:                                    ; preds = %for.cond.cleanup
  %call1.i.i30 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %call.i.i27) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %for.cond.cleanup, %if.then.i.i29
  %9 = load i64, ptr %Tp.i.i26, align 8, !tbaa !37
  %conv.i.i31 = sitofp i64 %9 to double
  %tv_usec.i.i32 = getelementptr inbounds nuw i8, ptr %Tp.i.i26, i64 8
  %10 = load i64, ptr %tv_usec.i.i32, align 8, !tbaa !40
  %conv2.i.i33 = sitofp i64 %10 to double
  %11 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i33, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i31)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i26) #15
  store double %11, ptr @polybench_t_end, align 8, !tbaa !41
  %12 = load double, ptr @polybench_t_start, align 8, !tbaa !41
  %sub.i = fsub double %11, %12
  %call.i34 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, double noundef %sub.i) #14
  %13 = load ptr, ptr %Agpu, align 8, !tbaa !30
  %call17 = call i32 @cudaMemcpy(ptr noundef %A_outputFromGpu, ptr noundef %13, i64 noundef 16384, i32 noundef 2) #14
  %14 = load ptr, ptr %Bgpu, align 8, !tbaa !30
  %call18 = call i32 @cudaMemcpy(ptr noundef %B_outputFromGpu, ptr noundef %14, i64 noundef 16384, i32 noundef 2) #14
  %15 = load ptr, ptr %Agpu, align 8, !tbaa !30
  %call19 = call i32 @cudaFree(ptr noundef %15) #14
  %16 = load ptr, ptr %Bgpu, align 8, !tbaa !30
  %call20 = call i32 @cudaFree(ptr noundef %16) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %Bgpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %Agpu) #15
  ret void

for.body:                                         ; preds = %for.body.lr.ph, %kcall.end14
  %t.057 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %kcall.end14 ]
  %call7 = call i32 @__cudaPushCallConfiguration(i64 4294967312, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool.not = icmp eq i32 %call7, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %for.body
  %17 = load ptr, ptr %Agpu, align 8, !tbaa !30
  %18 = load ptr, ptr %Bgpu, align 8, !tbaa !30
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %n, ptr %n.addr.i, align 4, !tbaa !29
  store ptr %17, ptr %A.addr.i, align 8, !tbaa !30
  store ptr %18, ptr %B.addr.i, align 8, !tbaa !30
  store ptr %n.addr.i, ptr %kernel_args1.i, align 16
  store ptr %A.addr.i, ptr %5, align 8
  store ptr %B.addr.i, ptr %6, align 16
  %19 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !43
  %20 = load i64, ptr %shmem_size.i, align 8
  %21 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i35 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z36__device_stub__runJacobiCUDA_kernel1iPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %20, ptr noundef %21), !inline_history !43
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
  %call8 = call i32 @cudaThreadSynchronize() #14
  %call11 = call i32 @__cudaPushCallConfiguration(i64 4294967312, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool12.not = icmp eq i32 %call11, 0
  br i1 %tobool12.not, label %kcall.configok13, label %kcall.end14

kcall.configok13:                                 ; preds = %kcall.end
  %22 = load ptr, ptr %Agpu, align 8, !tbaa !30
  %23 = load ptr, ptr %Bgpu, align 8, !tbaa !30
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i36)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i37)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i38)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i39)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i40)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i41)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i42)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i43)
  store i32 %n, ptr %n.addr.i36, align 4, !tbaa !29
  store ptr %22, ptr %A.addr.i37, align 8, !tbaa !30
  store ptr %23, ptr %B.addr.i38, align 8, !tbaa !30
  store ptr %n.addr.i36, ptr %kernel_args1.i43, align 16
  store ptr %A.addr.i37, ptr %7, align 8
  store ptr %B.addr.i38, ptr %8, align 16
  %24 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i39, ptr nonnull %block_dim.i40, ptr nonnull %shmem_size.i41, ptr nonnull %stream.i42), !inline_history !44
  %25 = load i64, ptr %shmem_size.i41, align 8
  %26 = load ptr, ptr %stream.i42, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i44 = load i64, ptr %grid_dim.i39, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i46 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i45, align 8
  %block_dim.coerce.sroa.0.0.copyload.i47 = load i64, ptr %block_dim.i40, align 8
  %block_dim.coerce.sroa.2.0.copyload.i49 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i48, align 8
  %call.i50 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z36__device_stub__runJacobiCUDA_kernel2iPfS_, i64 %grid_dim.coerce.sroa.0.0.copyload.i44, i32 %grid_dim.coerce.sroa.2.0.copyload.i46, i64 %block_dim.coerce.sroa.0.0.copyload.i47, i32 %block_dim.coerce.sroa.2.0.copyload.i49, ptr noundef nonnull %kernel_args1.i43, i64 noundef %25, ptr noundef %26), !inline_history !44
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i36)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i37)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i38)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i39)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i40)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i41)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i42)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i43)
  br label %kcall.end14

kcall.end14:                                      ; preds = %kcall.configok13, %kcall.end
  %call15 = call i32 @cudaThreadSynchronize() #14
  %inc = add nuw nsw i32 %t.057, 1
  %exitcond.not = icmp eq i32 %inc, %tsteps
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !45
}

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
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %call.i) #14
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !37
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !40
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_start, align 8, !tbaa !41
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
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %call.i) #14
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !37
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !40
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_end, align 8, !tbaa !41
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !41
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !41
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, double noundef %sub) #14
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #4 {
entry:
  %Tp.i.i58 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %newA.i.i46 = alloca ptr, align 8
  %newA.i.i39 = alloca ptr, align 8
  %newA.i.i32 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #15
  store ptr null, ptr %newA.i.i, align 8, !tbaa !46
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 16384) #16
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !46
  %1 = ptrtoaddr ptr %0 to i64
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %2 = load ptr, ptr @stderr, align 8, !tbaa !47
  %3 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %2) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i32) #15
  store ptr null, ptr %newA.i.i32, align 8, !tbaa !46
  %call.i.i33 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i32, i64 noundef 32, i64 noundef 16384) #16
  %4 = load ptr, ptr %newA.i.i32, align 8, !tbaa !46
  %5 = ptrtoaddr ptr %4 to i64
  %tobool.i.i34 = icmp eq ptr %4, null
  %tobool1.i.i35 = icmp ne i32 %call.i.i33, 0
  %or.cond.i.i36 = select i1 %tobool.i.i34, i1 true, i1 %tobool1.i.i35
  br i1 %or.cond.i.i36, label %if.then.i.i37, label %_Z20polybench_alloc_datayi.exit38

if.then.i.i37:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %6 = load ptr, ptr @stderr, align 8, !tbaa !47
  %7 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %6) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit38:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i32) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i39) #15
  store ptr null, ptr %newA.i.i39, align 8, !tbaa !46
  %call.i.i40 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i39, i64 noundef 32, i64 noundef 16384) #16
  %8 = load ptr, ptr %newA.i.i39, align 8, !tbaa !46
  %tobool.i.i41 = icmp eq ptr %8, null
  %tobool1.i.i42 = icmp ne i32 %call.i.i40, 0
  %or.cond.i.i43 = select i1 %tobool.i.i41, i1 true, i1 %tobool1.i.i42
  br i1 %or.cond.i.i43, label %if.then.i.i44, label %_Z20polybench_alloc_datayi.exit45

if.then.i.i44:                                    ; preds = %_Z20polybench_alloc_datayi.exit38
  %9 = load ptr, ptr @stderr, align 8, !tbaa !47
  %10 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %9) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit45:                ; preds = %_Z20polybench_alloc_datayi.exit38
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i39) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i46) #15
  store ptr null, ptr %newA.i.i46, align 8, !tbaa !46
  %call.i.i47 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i46, i64 noundef 32, i64 noundef 16384) #16
  %11 = load ptr, ptr %newA.i.i46, align 8, !tbaa !46
  %tobool.i.i48 = icmp eq ptr %11, null
  %tobool1.i.i49 = icmp ne i32 %call.i.i47, 0
  %or.cond.i.i50 = select i1 %tobool.i.i48, i1 true, i1 %tobool1.i.i49
  br i1 %or.cond.i.i50, label %if.then.i.i51, label %_Z20polybench_alloc_datayi.exit52

if.then.i.i51:                                    ; preds = %_Z20polybench_alloc_datayi.exit45
  %12 = load ptr, ptr @stderr, align 8, !tbaa !47
  %13 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %12) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit52:                ; preds = %_Z20polybench_alloc_datayi.exit45
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i46) #15
  %14 = sub i64 %1, %5
  %diff.check = icmp ugt i64 %14, -16
  br i1 %diff.check, label %for.body.i, label %vector.body

vector.body:                                      ; preds = %_Z20polybench_alloc_datayi.exit52, %vector.body
  %index = phi i64 [ %index.next.1, %vector.body ], [ 0, %_Z20polybench_alloc_datayi.exit52 ]
  %vec.ind = phi <4 x i32> [ %vec.ind.next.1, %vector.body ], [ <i32 0, i32 1, i32 2, i32 3>, %_Z20polybench_alloc_datayi.exit52 ]
  %15 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %16 = call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %15, <4 x float> splat (float 4.000000e+00), <4 x float> splat (float 1.000000e+01))
  %17 = fmul nnan <4 x float> %16, splat (float f0x39800000)
  %18 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %index
  store <4 x float> %17, ptr %18, align 4, !tbaa !10
  %19 = call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %15, <4 x float> splat (float 7.000000e+00), <4 x float> splat (float 1.100000e+01))
  %20 = fmul nnan <4 x float> %19, splat (float f0x39800000)
  %21 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %index
  store <4 x float> %20, ptr %21, align 4, !tbaa !10
  %index.next = or disjoint i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %22 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %23 = call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %22, <4 x float> splat (float 4.000000e+00), <4 x float> splat (float 1.000000e+01))
  %24 = fmul nnan <4 x float> %23, splat (float f0x39800000)
  %25 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %index.next
  store <4 x float> %24, ptr %25, align 4, !tbaa !10
  %26 = call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %22, <4 x float> splat (float 7.000000e+00), <4 x float> splat (float 1.100000e+01))
  %27 = fmul nnan <4 x float> %26, splat (float f0x39800000)
  %28 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %index.next
  store <4 x float> %27, ptr %28, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 8
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 8)
  %29 = icmp eq i64 %index.next.1, 4096
  br i1 %29, label %_Z10init_arrayiPfS_.exit, label %vector.body, !llvm.loop !49

for.body.i:                                       ; preds = %_Z20polybench_alloc_datayi.exit52, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i.1, %for.body.i ], [ 0, %_Z20polybench_alloc_datayi.exit52 ]
  %30 = trunc nuw nsw i64 %indvars.iv.i to i32
  %conv.i = uitofp nneg i32 %30 to float
  %arrayidx.i = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv.i
  %31 = insertelement <2 x float> poison, float %conv.i, i64 0
  %32 = shufflevector <2 x float> %31, <2 x float> poison, <2 x i32> zeroinitializer
  %33 = call nnan <2 x float> @llvm.fmuladd.v2f32(<2 x float> %32, <2 x float> <float 4.000000e+00, float 7.000000e+00>, <2 x float> <float 1.000000e+01, float 1.100000e+01>)
  %34 = fmul nnan <2 x float> %33, splat (float f0x39800000)
  %35 = extractelement <2 x float> %34, i64 0
  store float %35, ptr %arrayidx.i, align 4, !tbaa !10
  %arrayidx4.i = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %indvars.iv.i
  %36 = extractelement <2 x float> %34, i64 1
  store float %36, ptr %arrayidx4.i, align 4, !tbaa !10
  %indvars.iv.next.i = or disjoint i64 %indvars.iv.i, 1
  %37 = trunc nuw nsw i64 %indvars.iv.next.i to i32
  %conv.i.1 = uitofp nneg i32 %37 to float
  %arrayidx.i.1 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv.next.i
  %38 = insertelement <2 x float> poison, float %conv.i.1, i64 0
  %39 = shufflevector <2 x float> %38, <2 x float> poison, <2 x i32> zeroinitializer
  %40 = call nnan <2 x float> @llvm.fmuladd.v2f32(<2 x float> %39, <2 x float> <float 4.000000e+00, float 7.000000e+00>, <2 x float> <float 1.000000e+01, float 1.100000e+01>)
  %41 = fmul nnan <2 x float> %40, splat (float f0x39800000)
  %42 = extractelement <2 x float> %41, i64 0
  store float %42, ptr %arrayidx.i.1, align 4, !tbaa !10
  %arrayidx4.i.1 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %indvars.iv.next.i
  %43 = extractelement <2 x float> %41, i64 1
  store float %43, ptr %arrayidx4.i.1, align 4, !tbaa !10
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %exitcond.not.i.1 = icmp eq i64 %indvars.iv.next.i.1, 4096
  br i1 %exitcond.not.i.1, label %_Z10init_arrayiPfS_.exit, label %for.body.i, !llvm.loop !50

_Z10init_arrayiPfS_.exit:                         ; preds = %vector.body, %for.body.i
  call void @_Z15runJacobi1DCUDAiiPfS_S_S_(i32 noundef 10000, i32 noundef 4096, ptr noundef nonnull %0, ptr noundef nonnull %4, ptr noundef nonnull %8, ptr noundef nonnull %11) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i53 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i53, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i54

if.then.i.i54:                                    ; preds = %_Z10init_arrayiPfS_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %call.i.i53) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiPfS_.exit, %if.then.i.i54
  %44 = load i64, ptr %Tp.i.i, align 8, !tbaa !37
  %conv.i.i = sitofp i64 %44 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %45 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !40
  %conv2.i.i = sitofp i64 %45 to double
  %46 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %46, ptr @polybench_t_start, align 8, !tbaa !41
  %scevgep = getelementptr i8, ptr %4, i64 4
  %scevgep80 = getelementptr i8, ptr %4, i64 16380
  %scevgep81 = getelementptr i8, ptr %0, i64 16384
  %bound0 = icmp ult ptr %scevgep, %scevgep81
  %bound1 = icmp ult ptr %0, %scevgep80
  %found.conflict = and i1 %bound0, %bound1
  %47 = sub i64 %5, %1
  %diff.check71 = icmp ugt i64 %47, -32
  br label %vector.memcheck79

vector.memcheck79:                                ; preds = %_Z21polybench_timer_startv.exit, %for.cond15.for.cond.cleanup18_crit_edge.us.us.i
  %t.049.us.us.i = phi i32 [ %inc28.us.us.i, %for.cond15.for.cond.cleanup18_crit_edge.us.us.i ], [ 0, %_Z21polybench_timer_startv.exit ]
  br i1 %found.conflict, label %for.body4.us.us.i.preheader.new, label %vector.body84

vector.body84:                                    ; preds = %vector.memcheck79, %vector.body84.1
  %index85 = phi i64 [ %index.next89.1, %vector.body84.1 ], [ 0, %vector.memcheck79 ]
  %48 = or disjoint i64 %index85, 1
  %49 = getelementptr [4 x i8], ptr %0, i64 %48
  %50 = getelementptr i8, ptr %49, i64 -4
  %wide.load86 = load <4 x float>, ptr %50, align 4, !tbaa !10, !alias.scope !51
  %wide.load87 = load <4 x float>, ptr %49, align 4, !tbaa !10, !alias.scope !51
  %51 = fadd <4 x float> %wide.load86, %wide.load87
  %52 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %index85
  %53 = getelementptr inbounds nuw i8, ptr %52, i64 8
  %wide.load88 = load <4 x float>, ptr %53, align 4, !tbaa !10, !alias.scope !51
  %54 = fadd <4 x float> %51, %wide.load88
  %55 = fpext <4 x float> %54 to <4 x double>
  %56 = fmul <4 x double> %55, splat (double 3.333300e-01)
  %57 = fptrunc <4 x double> %56 to <4 x float>
  %58 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %48
  store <4 x float> %57, ptr %58, align 4, !tbaa !10, !alias.scope !54, !noalias !51
  %59 = icmp eq i64 %index85, 4088
  br i1 %59, label %for.body4.us.us.i.preheader.new, label %vector.body84.1

vector.body84.1:                                  ; preds = %vector.body84
  %60 = or disjoint i64 %index85, 5
  %61 = getelementptr [4 x i8], ptr %0, i64 %60
  %62 = getelementptr i8, ptr %61, i64 -4
  %wide.load86.1 = load <4 x float>, ptr %62, align 4, !tbaa !10, !alias.scope !51
  %wide.load87.1 = load <4 x float>, ptr %61, align 4, !tbaa !10, !alias.scope !51
  %63 = fadd <4 x float> %wide.load86.1, %wide.load87.1
  %64 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %index85
  %65 = getelementptr inbounds nuw i8, ptr %64, i64 24
  %wide.load88.1 = load <4 x float>, ptr %65, align 4, !tbaa !10, !alias.scope !51
  %66 = fadd <4 x float> %63, %wide.load88.1
  %67 = fpext <4 x float> %66 to <4 x double>
  %68 = fmul <4 x double> %67, splat (double 3.333300e-01)
  %69 = fptrunc <4 x double> %68 to <4 x float>
  %70 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %60
  store <4 x float> %69, ptr %70, align 4, !tbaa !10, !alias.scope !54, !noalias !51
  %index.next89.1 = add nuw nsw i64 %index85, 8
  br label %vector.body84

for.body4.us.us.i.preheader.new:                  ; preds = %vector.body84, %vector.memcheck79
  %indvars.iv.i55.ph = phi i64 [ 1, %vector.memcheck79 ], [ 4093, %vector.body84 ]
  br label %for.body4.us.us.i

for.body4.us.us.i:                                ; preds = %for.body4.us.us.i, %for.body4.us.us.i.preheader.new
  %indvars.iv.i55 = phi i64 [ %indvars.iv.i55.ph, %for.body4.us.us.i.preheader.new ], [ %indvars.iv.next.i56.1, %for.body4.us.us.i ]
  %71 = getelementptr [4 x i8], ptr %0, i64 %indvars.iv.i55
  %arrayidx.us.us.i = getelementptr i8, ptr %71, i64 -4
  %72 = load float, ptr %arrayidx.us.us.i, align 4, !tbaa !10
  %73 = load float, ptr %71, align 4, !tbaa !10
  %add.us.us.i = fadd float %72, %73
  %indvars.iv.next.i56 = add nuw nsw i64 %indvars.iv.i55, 1
  %arrayidx10.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv.next.i56
  %74 = load float, ptr %arrayidx10.us.us.i, align 4, !tbaa !10
  %add11.us.us.i = fadd float %add.us.us.i, %74
  %conv.us.us.i = fpext float %add11.us.us.i to double
  %mul.us.us.i = fmul double %conv.us.us.i, 3.333300e-01
  %conv12.us.us.i = fptrunc double %mul.us.us.i to float
  %arrayidx14.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %indvars.iv.i55
  store float %conv12.us.us.i, ptr %arrayidx14.us.us.i, align 4, !tbaa !10
  %75 = getelementptr [4 x i8], ptr %0, i64 %indvars.iv.next.i56
  %arrayidx.us.us.i.1 = getelementptr i8, ptr %75, i64 -4
  %76 = load float, ptr %arrayidx.us.us.i.1, align 4, !tbaa !10
  %77 = load float, ptr %75, align 4, !tbaa !10
  %add.us.us.i.1 = fadd float %76, %77
  %indvars.iv.next.i56.1 = add nuw nsw i64 %indvars.iv.i55, 2
  %arrayidx10.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv.next.i56.1
  %78 = load float, ptr %arrayidx10.us.us.i.1, align 4, !tbaa !10
  %add11.us.us.i.1 = fadd float %add.us.us.i.1, %78
  %conv.us.us.i.1 = fpext float %add11.us.us.i.1 to double
  %mul.us.us.i.1 = fmul double %conv.us.us.i.1, 3.333300e-01
  %conv12.us.us.i.1 = fptrunc double %mul.us.us.i.1 to float
  %arrayidx14.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %indvars.iv.next.i56
  store float %conv12.us.us.i.1, ptr %arrayidx14.us.us.i.1, align 4, !tbaa !10
  %exitcond.not.i57.1 = icmp eq i64 %indvars.iv.next.i56.1, 4095
  br i1 %exitcond.not.i57.1, label %vector.memcheck70, label %for.body4.us.us.i, !llvm.loop !56

vector.memcheck70:                                ; preds = %for.body4.us.us.i
  br i1 %diff.check71, label %for.body19.us.us.i.prol.preheader, label %vector.body74

vector.body74:                                    ; preds = %vector.memcheck70, %vector.body74.1
  %index75 = phi i64 [ %index.next77.1, %vector.body74.1 ], [ 0, %vector.memcheck70 ]
  %79 = or disjoint i64 %index75, 1
  %80 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %79
  %81 = getelementptr inbounds nuw i8, ptr %80, i64 16
  %wide.load = load <4 x float>, ptr %80, align 4, !tbaa !10
  %wide.load76 = load <4 x float>, ptr %81, align 4, !tbaa !10
  %82 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %79
  %83 = getelementptr inbounds nuw i8, ptr %82, i64 16
  store <4 x float> %wide.load, ptr %82, align 4, !tbaa !10
  store <4 x float> %wide.load76, ptr %83, align 4, !tbaa !10
  %84 = icmp eq i64 %index75, 4080
  br i1 %84, label %for.body19.us.us.i.prol.preheader, label %vector.body74.1

vector.body74.1:                                  ; preds = %vector.body74
  %85 = or disjoint i64 %index75, 9
  %86 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %85
  %87 = getelementptr inbounds nuw i8, ptr %86, i64 16
  %wide.load.1 = load <4 x float>, ptr %86, align 4, !tbaa !10
  %wide.load76.1 = load <4 x float>, ptr %87, align 4, !tbaa !10
  %88 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %85
  %89 = getelementptr inbounds nuw i8, ptr %88, i64 16
  store <4 x float> %wide.load.1, ptr %88, align 4, !tbaa !10
  store <4 x float> %wide.load76.1, ptr %89, align 4, !tbaa !10
  %index.next77.1 = add nuw nsw i64 %index75, 16
  br label %vector.body74

for.body19.us.us.i.prol.preheader:                ; preds = %vector.memcheck70, %vector.body74
  %indvars.iv52.i.ph = phi i64 [ 1, %vector.memcheck70 ], [ 4089, %vector.body74 ]
  br label %for.body19.us.us.i.prol

for.body19.us.us.i.prol:                          ; preds = %for.body19.us.us.i.prol, %for.body19.us.us.i.prol.preheader
  %indvars.iv52.i.prol = phi i64 [ %indvars.iv.next53.i.prol, %for.body19.us.us.i.prol ], [ %indvars.iv52.i.ph, %for.body19.us.us.i.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body19.us.us.i.prol ], [ 0, %for.body19.us.us.i.prol.preheader ]
  %arrayidx21.us.us.i.prol = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %indvars.iv52.i.prol
  %90 = load float, ptr %arrayidx21.us.us.i.prol, align 4, !tbaa !10
  %arrayidx23.us.us.i.prol = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv52.i.prol
  store float %90, ptr %arrayidx23.us.us.i.prol, align 4, !tbaa !10
  %indvars.iv.next53.i.prol = add nuw nsw i64 %indvars.iv52.i.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, 2
  br i1 %prol.iter.cmp.not, label %for.body19.us.us.i, label %for.body19.us.us.i.prol, !llvm.loop !57

for.body19.us.us.i:                               ; preds = %for.body19.us.us.i.prol, %for.body19.us.us.i
  %indvars.iv52.i = phi i64 [ %indvars.iv.next53.i.3, %for.body19.us.us.i ], [ %indvars.iv.next53.i.prol, %for.body19.us.us.i.prol ]
  %arrayidx21.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %indvars.iv52.i
  %91 = load float, ptr %arrayidx21.us.us.i, align 4, !tbaa !10
  %arrayidx23.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv52.i
  store float %91, ptr %arrayidx23.us.us.i, align 4, !tbaa !10
  %indvars.iv.next53.i = add nuw nsw i64 %indvars.iv52.i, 1
  %arrayidx21.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %indvars.iv.next53.i
  %92 = load float, ptr %arrayidx21.us.us.i.1, align 4, !tbaa !10
  %arrayidx23.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv.next53.i
  store float %92, ptr %arrayidx23.us.us.i.1, align 4, !tbaa !10
  %indvars.iv.next53.i.1 = add nuw nsw i64 %indvars.iv52.i, 2
  %arrayidx21.us.us.i.2 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %indvars.iv.next53.i.1
  %93 = load float, ptr %arrayidx21.us.us.i.2, align 4, !tbaa !10
  %arrayidx23.us.us.i.2 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv.next53.i.1
  store float %93, ptr %arrayidx23.us.us.i.2, align 4, !tbaa !10
  %indvars.iv.next53.i.2 = add nuw nsw i64 %indvars.iv52.i, 3
  %arrayidx21.us.us.i.3 = getelementptr inbounds nuw [4 x i8], ptr %4, i64 %indvars.iv.next53.i.2
  %94 = load float, ptr %arrayidx21.us.us.i.3, align 4, !tbaa !10
  %arrayidx23.us.us.i.3 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv.next53.i.2
  store float %94, ptr %arrayidx23.us.us.i.3, align 4, !tbaa !10
  %indvars.iv.next53.i.3 = add nuw nsw i64 %indvars.iv52.i, 4
  %exitcond56.not.i.3 = icmp eq i64 %indvars.iv.next53.i.3, 4095
  br i1 %exitcond56.not.i.3, label %for.cond15.for.cond.cleanup18_crit_edge.us.us.i, label %for.body19.us.us.i, !llvm.loop !58

for.cond15.for.cond.cleanup18_crit_edge.us.us.i:  ; preds = %for.body19.us.us.i
  %inc28.us.us.i = add nuw nsw i32 %t.049.us.us.i, 1
  %exitcond57.not.i = icmp eq i32 %inc28.us.us.i, 10000
  br i1 %exitcond57.not.i, label %_Z14runJacobi1DCpuiiPfS_.exit, label %vector.memcheck79, !llvm.loop !28

_Z14runJacobi1DCpuiiPfS_.exit:                    ; preds = %for.cond15.for.cond.cleanup18_crit_edge.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.8)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i58) #15
  %call.i.i59 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i58, ptr noundef null) #16
  %cmp.not.i.i60 = icmp eq i32 %call.i.i59, 0
  br i1 %cmp.not.i.i60, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i61

if.then.i.i61:                                    ; preds = %_Z14runJacobi1DCpuiiPfS_.exit
  %call1.i.i62 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %call.i.i59) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z14runJacobi1DCpuiiPfS_.exit, %if.then.i.i61
  %95 = load i64, ptr %Tp.i.i58, align 8, !tbaa !37
  %conv.i.i63 = sitofp i64 %95 to double
  %tv_usec.i.i64 = getelementptr inbounds nuw i8, ptr %Tp.i.i58, i64 8
  %96 = load i64, ptr %tv_usec.i.i64, align 8, !tbaa !40
  %conv2.i.i65 = sitofp i64 %96 to double
  %97 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i65, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i63)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i58) #15
  store double %97, ptr @polybench_t_end, align 8, !tbaa !41
  %98 = load double, ptr @polybench_t_start, align 8, !tbaa !41
  %sub.i = fsub double %97, %98
  %call.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, double noundef %sub.i) #14
  call void @_Z14compareResultsiPfS_S_S_(i32 noundef 4096, ptr noundef nonnull %0, ptr noundef nonnull %8, ptr noundef nonnull %4, ptr noundef nonnull %11) #14
  call void @free(ptr noundef nonnull %0) #16
  call void @free(ptr noundef %8) #16
  call void @free(ptr noundef nonnull %4) #16
  call void @free(ptr noundef %11) #16
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #15
  store ptr null, ptr %newA.i, align 8, !tbaa !46
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #16
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !46
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !47
  %2 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %1) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_ZL7xmallocm.exit:                                ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i) #15
  ret ptr %0
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #9

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
declare double @llvm.fmuladd.f64(double, double, double) #10

; Function Attrs: nofree nounwind
declare i32 @posix_memalign(ptr noundef, i64 noundef, i64 noundef) local_unnamed_addr #6

; Function Attrs: nofree noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #11

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #12

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #13

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #4 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #5 = { mustprogress nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #6 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #7 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #8 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #9 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #10 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
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
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !13, !14, !15}
!23 = distinct !{!23, !13, !14}
!24 = distinct !{!24, !13, !14, !15}
!25 = distinct !{!25, !26}
!26 = !{!"llvm.loop.unroll.disable"}
!27 = distinct !{!27, !13, !14}
!28 = distinct !{!28, !13}
!29 = !{!7, !7, i64 0}
!30 = !{!31, !31, i64 0}
!31 = !{!"p1 float", !32, i64 0}
!32 = !{!"any pointer", !8, i64 0}
!33 = distinct !{!33, !13, !14, !15}
!34 = distinct !{!34, !13, !14, !15}
!35 = distinct !{!35, !13, !15, !14}
!36 = distinct !{!36, !13, !15, !14}
!37 = !{!38, !39, i64 0}
!38 = !{!"_ZTS7timeval", !39, i64 0, !39, i64 8}
!39 = !{!"long", !8, i64 0}
!40 = !{!38, !39, i64 8}
!41 = !{!42, !42, i64 0}
!42 = !{!"double", !8, i64 0}
!43 = !{ptr @_Z36__device_stub__runJacobiCUDA_kernel1iPfS_}
!44 = !{ptr @_Z36__device_stub__runJacobiCUDA_kernel2iPfS_}
!45 = distinct !{!45, !13}
!46 = !{!32, !32, i64 0}
!47 = !{!48, !48, i64 0}
!48 = !{!"p1 _ZTS8_IO_FILE", !32, i64 0}
!49 = distinct !{!49, !13, !14, !15}
!50 = distinct !{!50, !13, !14}
!51 = !{!52}
!52 = distinct !{!52, !53}
!53 = distinct !{!53, !"LVerDomain"}
!54 = !{!55}
!55 = distinct !{!55, !53}
!56 = distinct !{!56, !13, !14}
!57 = distinct !{!57, !26}
!58 = distinct !{!58, !13, !14}
