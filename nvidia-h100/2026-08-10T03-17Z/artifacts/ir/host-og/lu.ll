; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/LU/lu.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/LU/lu.cu"
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
define dso_local void @_Z2luiPA2048_f(i32 noundef %n, ptr nofree noundef captures(none) %A) local_unnamed_addr #1 {
entry:
  %cmp87 = icmp sgt i32 %n, 0
  br i1 %cmp87, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %0 = zext nneg i32 %n to i64
  %wide.trip.count105 = zext nneg i32 %n to i64
  %1 = mul nuw nsw i64 %wide.trip.count105, 8196
  %2 = getelementptr i8, ptr %A, i64 %1
  %scevgep107 = getelementptr i8, ptr %2, i64 -8192
  %3 = shl nuw nsw i64 %wide.trip.count105, 13
  %4 = shl nuw nsw i64 %wide.trip.count105, 2
  %5 = add nsw i64 %wide.trip.count105, -1
  %6 = getelementptr i8, ptr %A, i64 %3
  %7 = getelementptr i8, ptr %6, i64 -8188
  %8 = getelementptr i8, ptr %A, i64 %4
  %9 = add nsw i64 %wide.trip.count105, -1
  br label %for.body

for.cond.loopexit:                                ; preds = %for.cond22.for.cond.cleanup24_crit_edge, %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond106.not = icmp eq i64 %indvars.iv.next103, %wide.trip.count105
  br i1 %exitcond106.not, label %for.cond.cleanup, label %for.body, !llvm.loop !10

for.cond.cleanup:                                 ; preds = %for.cond.loopexit, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.cond.loopexit
  %indvars.iv102 = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next103, %for.cond.loopexit ]
  %indvars.iv = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next, %for.cond.loopexit ]
  %10 = sub i64 %5, %indvars.iv102
  %11 = sub i64 %5, %indvars.iv102
  %12 = mul nuw nsw i64 %indvars.iv102, 8196
  %13 = getelementptr i8, ptr %A, i64 %12
  %scevgep = getelementptr i8, ptr %13, i64 8196
  %14 = getelementptr i8, ptr %A, i64 %12
  %scevgep108 = getelementptr i8, ptr %14, i64 8192
  %15 = shl nuw nsw i64 %indvars.iv102, 2
  %scevgep109 = getelementptr i8, ptr %7, i64 %15
  %16 = getelementptr i8, ptr %A, i64 %12
  %scevgep110 = getelementptr i8, ptr %16, i64 4
  %17 = shl nuw nsw i64 %indvars.iv102, 13
  %scevgep111 = getelementptr i8, ptr %8, i64 %17
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %cmp281 = icmp samesign ult i64 %indvars.iv.next103, %0
  br i1 %cmp281, label %for.body4.lr.ph, label %for.cond.loopexit

for.body4.lr.ph:                                  ; preds = %for.body
  %arrayidx = getelementptr inbounds nuw [8192 x i8], ptr %A, i64 %indvars.iv102
  %arrayidx10 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv102
  %min.iters.check119 = icmp ult i64 %10, 4
  br i1 %min.iters.check119, label %for.body4.preheader, label %vector.ph120

vector.ph120:                                     ; preds = %for.body4.lr.ph
  %n.vec122 = and i64 %10, -4
  %18 = add i64 %indvars.iv, %n.vec122
  %19 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  br label %vector.body123

vector.body123:                                   ; preds = %vector.body123, %vector.ph120
  %index124 = phi i64 [ 0, %vector.ph120 ], [ %index.next128, %vector.body123 ]
  %20 = getelementptr inbounds nuw [4 x i8], ptr %19, i64 %index124
  %wide.load125 = load <4 x float>, ptr %20, align 4, !tbaa !12
  %21 = load float, ptr %arrayidx10, align 4, !tbaa !12
  %broadcast.splatinsert126 = insertelement <4 x float> poison, float %21, i64 0
  %broadcast.splat127 = shufflevector <4 x float> %broadcast.splatinsert126, <4 x float> poison, <4 x i32> zeroinitializer
  %22 = fdiv <4 x float> %wide.load125, %broadcast.splat127
  store <4 x float> %22, ptr %20, align 4, !tbaa !12
  %index.next128 = add nuw i64 %index124, 4
  %23 = icmp eq i64 %index.next128, %n.vec122
  br i1 %23, label %middle.block129, label %vector.body123, !llvm.loop !14

middle.block129:                                  ; preds = %vector.body123
  %cmp.n130 = icmp eq i64 %10, %n.vec122
  br i1 %cmp.n130, label %for.cond22.preheader.lr.ph, label %for.body4.preheader

for.body4.preheader:                              ; preds = %for.body4.lr.ph, %middle.block129
  %indvars.iv89.ph = phi i64 [ %indvars.iv, %for.body4.lr.ph ], [ %18, %middle.block129 ]
  br label %for.body4

for.cond22.preheader.lr.ph:                       ; preds = %for.body4, %middle.block129
  %arrayidx35 = getelementptr inbounds nuw [8192 x i8], ptr %A, i64 %indvars.iv102
  %min.iters.check = icmp ult i64 %11, 8
  %bound0 = icmp ult ptr %scevgep, %scevgep109
  %bound1 = icmp ult ptr %scevgep108, %scevgep107
  %found.conflict = and i1 %bound0, %bound1
  %bound0112 = icmp ult ptr %scevgep, %scevgep111
  %bound1113 = icmp ult ptr %scevgep110, %scevgep107
  %found.conflict114 = and i1 %bound0112, %bound1113
  %conflict.rdx = or i1 %found.conflict, %found.conflict114
  %n.vec = and i64 %11, -8
  %24 = add i64 %indvars.iv, %n.vec
  %cmp.n = icmp eq i64 %11, %n.vec
  br label %for.cond22.preheader

for.body4:                                        ; preds = %for.body4.preheader, %for.body4
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %for.body4 ], [ %indvars.iv89.ph, %for.body4.preheader ]
  %arrayidx6 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv89
  %25 = load float, ptr %arrayidx6, align 4, !tbaa !12
  %26 = load float, ptr %arrayidx10, align 4, !tbaa !12
  %div = fdiv float %25, %26
  store float %div, ptr %arrayidx6, align 4, !tbaa !12
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next90, %wide.trip.count105
  br i1 %exitcond.not, label %for.cond22.preheader.lr.ph, label %for.body4, !llvm.loop !17

for.cond22.preheader:                             ; preds = %for.cond22.preheader.lr.ph, %for.cond22.for.cond.cleanup24_crit_edge
  %indvars.iv97 = phi i64 [ %indvars.iv, %for.cond22.preheader.lr.ph ], [ %indvars.iv.next98, %for.cond22.for.cond.cleanup24_crit_edge ]
  %arrayidx27 = getelementptr inbounds nuw [8192 x i8], ptr %A, i64 %indvars.iv97
  %arrayidx33 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27, i64 %indvars.iv102
  %brmerge = select i1 %min.iters.check, i1 true, i1 %conflict.rdx
  br i1 %brmerge, label %for.body25.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond22.preheader
  %27 = load float, ptr %arrayidx33, align 4, !tbaa !12, !alias.scope !18
  %.scalar = fneg float %27
  %28 = insertelement <4 x float> poison, float %.scalar, i64 0
  %29 = shufflevector <4 x float> %28, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %30 = add nuw i64 %indvars.iv, %index
  %31 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27, i64 %30
  %32 = getelementptr inbounds nuw i8, ptr %31, i64 16
  %wide.load = load <4 x float>, ptr %31, align 4, !tbaa !12, !alias.scope !21, !noalias !23
  %wide.load115 = load <4 x float>, ptr %32, align 4, !tbaa !12, !alias.scope !21, !noalias !23
  %33 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx35, i64 %30
  %34 = getelementptr inbounds nuw i8, ptr %33, i64 16
  %wide.load116 = load <4 x float>, ptr %33, align 4, !tbaa !12, !alias.scope !25
  %wide.load117 = load <4 x float>, ptr %34, align 4, !tbaa !12, !alias.scope !25
  %35 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %29, <4 x float> %wide.load116, <4 x float> %wide.load)
  %36 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %29, <4 x float> %wide.load117, <4 x float> %wide.load115)
  store <4 x float> %35, ptr %31, align 4, !tbaa !12, !alias.scope !21, !noalias !23
  store <4 x float> %36, ptr %32, align 4, !tbaa !12, !alias.scope !21, !noalias !23
  %index.next = add nuw i64 %index, 8
  %37 = icmp eq i64 %index.next, %n.vec
  br i1 %37, label %middle.block, label %vector.body, !llvm.loop !26

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond22.for.cond.cleanup24_crit_edge, label %for.body25.preheader

for.body25.preheader:                             ; preds = %for.cond22.preheader, %middle.block
  %indvars.iv92.ph = phi i64 [ %24, %middle.block ], [ %indvars.iv, %for.cond22.preheader ]
  %38 = sub i64 %wide.trip.count105, %indvars.iv92.ph
  %xtraiter = and i64 %38, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body25.prol.loopexit, label %for.body25.prol

for.body25.prol:                                  ; preds = %for.body25.preheader
  %arrayidx29.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27, i64 %indvars.iv92.ph
  %39 = load float, ptr %arrayidx29.prol, align 4, !tbaa !12
  %40 = load float, ptr %arrayidx33, align 4, !tbaa !12
  %arrayidx37.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx35, i64 %indvars.iv92.ph
  %41 = load float, ptr %arrayidx37.prol, align 4, !tbaa !12
  %neg.prol = fneg float %40
  %42 = tail call float @llvm.fmuladd.f32(float %neg.prol, float %41, float %39)
  store float %42, ptr %arrayidx29.prol, align 4, !tbaa !12
  %indvars.iv.next93.prol = add nuw nsw i64 %indvars.iv92.ph, 1
  br label %for.body25.prol.loopexit

for.body25.prol.loopexit:                         ; preds = %for.body25.prol, %for.body25.preheader
  %indvars.iv92.unr = phi i64 [ %indvars.iv92.ph, %for.body25.preheader ], [ %indvars.iv.next93.prol, %for.body25.prol ]
  %43 = icmp eq i64 %indvars.iv92.ph, %9
  br i1 %43, label %for.cond22.for.cond.cleanup24_crit_edge, label %for.body25

for.cond22.for.cond.cleanup24_crit_edge:          ; preds = %for.body25.prol.loopexit, %for.body25, %middle.block
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond101.not = icmp eq i64 %indvars.iv.next98, %wide.trip.count105
  br i1 %exitcond101.not, label %for.cond.loopexit, label %for.cond22.preheader, !llvm.loop !27

for.body25:                                       ; preds = %for.body25.prol.loopexit, %for.body25
  %indvars.iv92 = phi i64 [ %indvars.iv.next93.1, %for.body25 ], [ %indvars.iv92.unr, %for.body25.prol.loopexit ]
  %arrayidx29 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27, i64 %indvars.iv92
  %44 = load float, ptr %arrayidx29, align 4, !tbaa !12
  %45 = load float, ptr %arrayidx33, align 4, !tbaa !12
  %arrayidx37 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx35, i64 %indvars.iv92
  %46 = load float, ptr %arrayidx37, align 4, !tbaa !12
  %neg = fneg float %45
  %47 = tail call float @llvm.fmuladd.f32(float %neg, float %46, float %44)
  store float %47, ptr %arrayidx29, align 4, !tbaa !12
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %arrayidx29.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27, i64 %indvars.iv.next93
  %48 = load float, ptr %arrayidx29.1, align 4, !tbaa !12
  %49 = load float, ptr %arrayidx33, align 4, !tbaa !12
  %arrayidx37.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx35, i64 %indvars.iv.next93
  %50 = load float, ptr %arrayidx37.1, align 4, !tbaa !12
  %neg.1 = fneg float %49
  %51 = tail call float @llvm.fmuladd.f32(float %neg.1, float %50, float %48)
  store float %51, ptr %arrayidx29.1, align 4, !tbaa !12
  %indvars.iv.next93.1 = add nuw nsw i64 %indvars.iv92, 2
  %exitcond96.not.1 = icmp eq i64 %indvars.iv.next93.1, %wide.trip.count105
  br i1 %exitcond96.not.1, label %for.cond22.for.cond.cleanup24_crit_edge, label %for.body25, !llvm.loop !28
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable
define dso_local void @_Z10init_arrayiPA2048_f(i32 noundef %n, ptr nofree noundef writeonly captures(none) %A) local_unnamed_addr #4 {
entry:
  %cmp19 = icmp sgt i32 %n, 0
  br i1 %cmp19, label %for.cond1.preheader.preheader, label %for.end9

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count25 = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 8
  %n.vec = and i64 %wide.trip.count25, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count25
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc7_crit_edge
  %indvars.iv22 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next23, %for.cond1.for.inc7_crit_edge ]
  %0 = trunc nuw nsw i64 %indvars.iv22 to i32
  %conv = uitofp nneg i32 %0 to float
  %arrayidx = getelementptr inbounds nuw [8192 x i8], ptr %A, i64 %indvars.iv22
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
  %3 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %1, <4 x float> splat (float 1.000000e+00))
  %4 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %2, <4 x float> splat (float 1.000000e+00))
  %5 = fmul nnan <4 x float> %3, splat (float f0x3A000000)
  %6 = fmul nnan <4 x float> %4, splat (float f0x3A000000)
  %7 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 16
  store <4 x float> %5, ptr %7, align 4, !tbaa !12
  store <4 x float> %6, ptr %8, align 4, !tbaa !12
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !29

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc7_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader ], [ %n.vec, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %10 = trunc nuw nsw i64 %indvars.iv to i32
  %conv4 = uitofp nneg i32 %10 to float
  %11 = tail call nnan float @llvm.fmuladd.f32(float %conv, float %conv4, float 1.000000e+00)
  %div = fmul nnan float %11, f0x3A000000
  %arrayidx6 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  store float %div, ptr %arrayidx6, align 4, !tbaa !12
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count25
  br i1 %exitcond.not, label %for.cond1.for.inc7_crit_edge, label %for.body3, !llvm.loop !30

for.cond1.for.inc7_crit_edge:                     ; preds = %for.body3, %middle.block
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond26.not = icmp eq i64 %indvars.iv.next23, %wide.trip.count25
  br i1 %exitcond26.not, label %for.end9, label %for.cond1.preheader, !llvm.loop !31

for.end9:                                         ; preds = %for.cond1.for.inc7_crit_edge, %entry
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiPA2048_fS0_(i32 noundef %n, ptr nofree noundef readonly captures(none) %A_cpu, ptr nofree noundef readonly captures(none) %A_outputFromGpu) local_unnamed_addr #5 {
entry:
  %cmp29 = icmp sgt i32 %n, 0
  br i1 %cmp29, label %for.cond1.preheader.us.preheader, label %for.end16

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count37 = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 4
  %n.vec = and i64 %wide.trip.count37, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count37
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc14_crit_edge.us
  %indvars.iv34 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next35, %for.cond1.for.inc14_crit_edge.us ]
  %fail.031.us = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [8192 x i8], ptr %A_cpu, i64 %indvars.iv34
  %arrayidx7.us = getelementptr inbounds nuw [8192 x i8], ptr %A_outputFromGpu, i64 %indvars.iv34
  br i1 %min.iters.check, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.us
  %0 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.031.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %0, %vector.ph ], [ %32, %vector.body ]
  %1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %index
  %wide.load = load <4 x float>, ptr %1, align 4, !tbaa !12
  %2 = fpext <4 x float> %wide.load to <4 x double>
  %3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us, i64 %index
  %wide.load39 = load <4 x float>, ptr %3, align 4, !tbaa !12
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
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !32

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
  %35 = load float, ptr %arrayidx5.us, align 4, !tbaa !12
  %conv.us = fpext float %35 to double
  %arrayidx9.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us, i64 %indvars.iv
  %36 = load float, ptr %arrayidx9.us, align 4, !tbaa !12
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
  br i1 %exitcond.not, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us, !llvm.loop !33

for.cond1.for.inc14_crit_edge.us:                 ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %fail.2.us.lcssa = phi i32 [ %34, %middle.block ], [ %fail.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %for.end16, label %for.cond1.preheader.us, !llvm.loop !34

for.end16:                                        ; preds = %for.cond1.for.inc14_crit_edge.us, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %call17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %fail.0.lcssa) #14
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
define dso_local void @_Z25__device_stub__lu_kernel1iPfi(i32 noundef %n, ptr noundef %A, i32 noundef %k) #9 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %k.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !35
  store ptr %A, ptr %A.addr, align 8, !tbaa !36
  store i32 %k, ptr %k.addr, align 4, !tbaa !35
  %kernel_args1 = alloca [3 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %A.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %k.addr, ptr %1, align 16
  %2 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %3 = load i64, ptr %shmem_size, align 8
  %4 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z25__device_stub__lu_kernel1iPfi, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %3, ptr noundef %4)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z25__device_stub__lu_kernel2iPfi(i32 noundef %n, ptr noundef %A, i32 noundef %k) #9 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %k.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !35
  store ptr %A, ptr %A.addr, align 8, !tbaa !36
  store i32 %k, ptr %k.addr, align 4, !tbaa !35
  %kernel_args1 = alloca [3 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %A.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %k.addr, ptr %1, align 16
  %2 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %3 = load i64, ptr %shmem_size, align 8
  %4 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z25__device_stub__lu_kernel2iPfi, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %3, ptr noundef %4)
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z6luCudaiPA2048_fS0_(i32 noundef %n, ptr noundef %A, ptr noundef %A_outputFromGpu) local_unnamed_addr #7 {
entry:
  %n.addr.i59 = alloca i32, align 4
  %A.addr.i60 = alloca ptr, align 8
  %k.addr.i61 = alloca i32, align 4
  %grid_dim.i62 = alloca %struct.dim3, align 8
  %block_dim.i63 = alloca %struct.dim3, align 8
  %shmem_size.i64 = alloca i64, align 8
  %stream.i65 = alloca ptr, align 8
  %kernel_args1.i66 = alloca [3 x ptr], align 16
  %n.addr.i = alloca i32, align 4
  %A.addr.i = alloca ptr, align 8
  %k.addr.i = alloca i32, align 4
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [3 x ptr], align 16
  %Tp.i.i49 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %AGpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %AGpu) #15
  %call.i = call noundef i32 @cudaMalloc(ptr noundef nonnull %AGpu, i64 noundef 16777216) #14
  %0 = load ptr, ptr %AGpu, align 8, !tbaa !36
  %call1 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 16777216, i32 noundef 1) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %1 = load i64, ptr %Tp.i.i, align 8, !tbaa !39
  %conv.i.i = sitofp i64 %1 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %2 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !42
  %conv2.i.i = sitofp i64 %2 to double
  %3 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %3, ptr @polybench_t_start, align 8, !tbaa !43
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1.i66, i64 8
  %7 = getelementptr inbounds nuw i8, ptr %kernel_args1.i66, i64 16
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i68 = getelementptr inbounds nuw i8, ptr %grid_dim.i62, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i71 = getelementptr inbounds nuw i8, ptr %block_dim.i63, i64 8
  br label %for.body

for.cond.cleanup:                                 ; preds = %kcall.end31
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i49) #15
  %call.i.i50 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i49, ptr noundef null) #16
  %cmp.not.i.i51 = icmp eq i32 %call.i.i50, 0
  br i1 %cmp.not.i.i51, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i52

if.then.i.i52:                                    ; preds = %for.cond.cleanup
  %call1.i.i53 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i50) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %for.cond.cleanup, %if.then.i.i52
  %8 = load i64, ptr %Tp.i.i49, align 8, !tbaa !39
  %conv.i.i54 = sitofp i64 %8 to double
  %tv_usec.i.i55 = getelementptr inbounds nuw i8, ptr %Tp.i.i49, i64 8
  %9 = load i64, ptr %tv_usec.i.i55, align 8, !tbaa !42
  %conv2.i.i56 = sitofp i64 %9 to double
  %10 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i56, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i54)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i49) #15
  store double %10, ptr @polybench_t_end, align 8, !tbaa !43
  %11 = load double, ptr @polybench_t_start, align 8, !tbaa !43
  %sub.i = fsub double %10, %11
  %call.i57 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #14
  %12 = load ptr, ptr %AGpu, align 8, !tbaa !36
  %call34 = call i32 @cudaMemcpy(ptr noundef %A_outputFromGpu, ptr noundef %12, i64 noundef 16777216, i32 noundef 2) #14
  %13 = load ptr, ptr %AGpu, align 8, !tbaa !36
  %call35 = call i32 @cudaFree(ptr noundef %13) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %AGpu) #15
  ret void

for.body:                                         ; preds = %_Z21polybench_timer_startv.exit, %kcall.end31
  %k.086 = phi i32 [ 0, %_Z21polybench_timer_startv.exit ], [ %add, %kcall.end31 ]
  %add = add nuw nsw i32 %k.086, 1
  %sub = sub nuw nsw i32 2047, %k.086
  %conv = uitofp nneg i32 %sub to float
  %div = fmul nnan float %conv, 3.906250e-03
  %14 = call float @llvm.ceil.f32(float %div)
  %conv4 = fptoui float %14 to i32
  %grid1.sroa.0.0.insert.ext = zext i32 %conv4 to i64
  %grid1.sroa.0.0.insert.insert = or disjoint i64 %grid1.sroa.0.0.insert.ext, 4294967296
  %call7 = call i32 @__cudaPushCallConfiguration(i64 %grid1.sroa.0.0.insert.insert, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool.not = icmp eq i32 %call7, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %for.body
  %15 = load ptr, ptr %AGpu, align 8, !tbaa !36
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %k.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %n, ptr %n.addr.i, align 4, !tbaa !35
  store ptr %15, ptr %A.addr.i, align 8, !tbaa !36
  store i32 %k.086, ptr %k.addr.i, align 4, !tbaa !35
  store ptr %n.addr.i, ptr %kernel_args1.i, align 16
  store ptr %A.addr.i, ptr %4, align 8
  store ptr %k.addr.i, ptr %5, align 16
  %16 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !45
  %17 = load i64, ptr %shmem_size.i, align 8
  %18 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i58 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z25__device_stub__lu_kernel1iPfi, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %17, ptr noundef %18), !inline_history !45
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %k.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %for.body
  %call8 = call i32 @cudaThreadSynchronize() #14
  %div14 = fmul nnan float %conv, 3.125000e-02
  %19 = call float @llvm.ceil.f32(float %div14)
  %conv16 = fptoui float %19 to i32
  %grid2.sroa.0.0.insert.ext = zext i32 %conv16 to i64
  %div22 = fmul nnan float %conv, 1.250000e-01
  %20 = call float @llvm.ceil.f32(float %div22)
  %conv24 = fptoui float %20 to i32
  %grid2.sroa.0.4.insert.ext = zext i32 %conv24 to i64
  %grid2.sroa.0.4.insert.shift = shl nuw i64 %grid2.sroa.0.4.insert.ext, 32
  %grid2.sroa.0.4.insert.insert = or disjoint i64 %grid2.sroa.0.4.insert.shift, %grid2.sroa.0.0.insert.ext
  %call28 = call i32 @__cudaPushCallConfiguration(i64 %grid2.sroa.0.4.insert.insert, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool29.not = icmp eq i32 %call28, 0
  br i1 %tobool29.not, label %kcall.configok30, label %kcall.end31

kcall.configok30:                                 ; preds = %kcall.end
  %21 = load ptr, ptr %AGpu, align 8, !tbaa !36
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i59)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i60)
  call void @llvm.lifetime.start.p0(ptr nonnull %k.addr.i61)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i62)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i63)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i64)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i65)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i66)
  store i32 %n, ptr %n.addr.i59, align 4, !tbaa !35
  store ptr %21, ptr %A.addr.i60, align 8, !tbaa !36
  store i32 %k.086, ptr %k.addr.i61, align 4, !tbaa !35
  store ptr %n.addr.i59, ptr %kernel_args1.i66, align 16
  store ptr %A.addr.i60, ptr %6, align 8
  store ptr %k.addr.i61, ptr %7, align 16
  %22 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i62, ptr nonnull %block_dim.i63, ptr nonnull %shmem_size.i64, ptr nonnull %stream.i65), !inline_history !46
  %23 = load i64, ptr %shmem_size.i64, align 8
  %24 = load ptr, ptr %stream.i65, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i67 = load i64, ptr %grid_dim.i62, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i69 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i68, align 8
  %block_dim.coerce.sroa.0.0.copyload.i70 = load i64, ptr %block_dim.i63, align 8
  %block_dim.coerce.sroa.2.0.copyload.i72 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i71, align 8
  %call.i73 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z25__device_stub__lu_kernel2iPfi, i64 %grid_dim.coerce.sroa.0.0.copyload.i67, i32 %grid_dim.coerce.sroa.2.0.copyload.i69, i64 %block_dim.coerce.sroa.0.0.copyload.i70, i32 %block_dim.coerce.sroa.2.0.copyload.i72, ptr noundef nonnull %kernel_args1.i66, i64 noundef %23, ptr noundef %24), !inline_history !46
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i59)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i60)
  call void @llvm.lifetime.end.p0(ptr nonnull %k.addr.i61)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i62)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i63)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i64)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i65)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i66)
  br label %kcall.end31

kcall.end31:                                      ; preds = %kcall.configok30, %kcall.end
  %call32 = call i32 @cudaThreadSynchronize() #14
  %exitcond.not = icmp eq i32 %add, 2048
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !47
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
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #14
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !39
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !42
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_start, align 8, !tbaa !43
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !39
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !42
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_end, align 8, !tbaa !43
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !43
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !43
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #14
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #9 {
entry:
  %Tp.i.i32 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i17 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #15
  store ptr null, ptr %newA.i.i, align 8, !tbaa !48
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 16777216) #16
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !48
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !49
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i17) #15
  store ptr null, ptr %newA.i.i17, align 8, !tbaa !48
  %call.i.i18 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i17, i64 noundef 32, i64 noundef 16777216) #16
  %3 = load ptr, ptr %newA.i.i17, align 8, !tbaa !48
  %tobool.i.i19 = icmp eq ptr %3, null
  %tobool1.i.i20 = icmp ne i32 %call.i.i18, 0
  %or.cond.i.i21 = select i1 %tobool.i.i19, i1 true, i1 %tobool1.i.i20
  br i1 %or.cond.i.i21, label %if.then.i.i22, label %_Z20polybench_alloc_datayi.exit23

if.then.i.i22:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !49
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit23:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i17) #15
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc7_crit_edge.i, %_Z20polybench_alloc_datayi.exit23
  %indvars.iv22.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit23 ], [ %indvars.iv.next23.i, %for.cond1.for.inc7_crit_edge.i ]
  %arrayidx.i = getelementptr inbounds nuw [8192 x i8], ptr %0, i64 %indvars.iv22.i
  %6 = trunc nuw nsw i64 %indvars.iv22.i to i32
  %conv.i = uitofp nneg i32 %6 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond1.preheader.i ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %7 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %8 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %9 = call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %7, <4 x float> splat (float 1.000000e+00))
  %10 = call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %8, <4 x float> splat (float 1.000000e+00))
  %11 = fmul nnan <4 x float> %9, splat (float f0x3A000000)
  %12 = fmul nnan <4 x float> %10, splat (float f0x3A000000)
  %13 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %14 = getelementptr inbounds nuw i8, ptr %13, i64 16
  store <4 x float> %11, ptr %13, align 4, !tbaa !12
  store <4 x float> %12, ptr %14, align 4, !tbaa !12
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %15 = icmp eq i64 %index.next, 2048
  br i1 %15, label %for.cond1.for.inc7_crit_edge.i, label %vector.body, !llvm.loop !51

for.cond1.for.inc7_crit_edge.i:                   ; preds = %vector.body
  %indvars.iv.next23.i = add nuw nsw i64 %indvars.iv22.i, 1
  %exitcond26.not.i = icmp eq i64 %indvars.iv.next23.i, 2048
  br i1 %exitcond26.not.i, label %_Z10init_arrayiPA2048_f.exit, label %for.cond1.preheader.i, !llvm.loop !31

_Z10init_arrayiPA2048_f.exit:                     ; preds = %for.cond1.for.inc7_crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #15
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #14
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #14
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #15
  call void @_Z6luCudaiPA2048_fS0_(i32 noundef 2048, ptr noundef nonnull %0, ptr noundef nonnull %3) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i24 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i24, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i25

if.then.i.i25:                                    ; preds = %_Z10init_arrayiPA2048_f.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i24) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiPA2048_f.exit, %if.then.i.i25
  %16 = load i64, ptr %Tp.i.i, align 8, !tbaa !39
  %conv.i.i = sitofp i64 %16 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %17 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !42
  %conv2.i.i = sitofp i64 %17 to double
  %18 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %18, ptr @polybench_t_start, align 8, !tbaa !43
  %scevgep45 = getelementptr i8, ptr %0, i64 16777216
  br label %for.body.i

for.cond.loopexit.i:                              ; preds = %for.cond22.for.cond.cleanup24_crit_edge.i, %for.body.i
  %indvars.iv.next.i27 = add nuw nsw i64 %indvars.iv.i26, 1
  %exitcond106.not.i = icmp eq i64 %indvars.iv.next103.i, 2048
  br i1 %exitcond106.not.i, label %_Z2luiPA2048_f.exit, label %for.body.i, !llvm.loop !10

for.body.i:                                       ; preds = %for.cond.loopexit.i, %_Z21polybench_timer_startv.exit
  %indvars.iv102.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next103.i, %for.cond.loopexit.i ]
  %indvars.iv.i26 = phi i64 [ 1, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next.i27, %for.cond.loopexit.i ]
  %19 = sub nsw i64 2047, %indvars.iv102.i
  %20 = sub nsw i64 2047, %indvars.iv102.i
  %21 = mul nuw nsw i64 %indvars.iv102.i, 8196
  %22 = getelementptr i8, ptr %0, i64 %21
  %scevgep = getelementptr i8, ptr %22, i64 8196
  %23 = getelementptr i8, ptr %0, i64 %21
  %scevgep46 = getelementptr i8, ptr %23, i64 8192
  %24 = shl nuw nsw i64 %indvars.iv102.i, 2
  %25 = getelementptr i8, ptr %0, i64 %24
  %scevgep47 = getelementptr i8, ptr %25, i64 16769028
  %26 = getelementptr i8, ptr %0, i64 %21
  %scevgep48 = getelementptr i8, ptr %26, i64 4
  %27 = shl nuw nsw i64 %indvars.iv102.i, 13
  %28 = getelementptr i8, ptr %0, i64 %27
  %scevgep49 = getelementptr i8, ptr %28, i64 8192
  %indvars.iv.next103.i = add nuw nsw i64 %indvars.iv102.i, 1
  %cmp281.i = icmp samesign ult i64 %indvars.iv102.i, 2047
  br i1 %cmp281.i, label %for.body4.lr.ph.i, label %for.cond.loopexit.i

for.body4.lr.ph.i:                                ; preds = %for.body.i
  %arrayidx.i28 = getelementptr inbounds nuw [8192 x i8], ptr %0, i64 %indvars.iv102.i
  %arrayidx10.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i28, i64 %indvars.iv102.i
  %min.iters.check64 = icmp ult i64 %19, 4
  br i1 %min.iters.check64, label %for.body4.i.preheader, label %vector.ph65

vector.ph65:                                      ; preds = %for.body4.lr.ph.i
  %n.vec67 = and i64 %19, 2044
  %29 = add nuw i64 %indvars.iv.i26, %n.vec67
  %30 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i28, i64 %indvars.iv.i26
  br label %vector.body68

vector.body68:                                    ; preds = %vector.body68, %vector.ph65
  %index69 = phi i64 [ 0, %vector.ph65 ], [ %index.next73, %vector.body68 ]
  %31 = getelementptr inbounds nuw [4 x i8], ptr %30, i64 %index69
  %wide.load70 = load <4 x float>, ptr %31, align 4, !tbaa !12
  %32 = load float, ptr %arrayidx10.i, align 4, !tbaa !12
  %broadcast.splatinsert71 = insertelement <4 x float> poison, float %32, i64 0
  %broadcast.splat72 = shufflevector <4 x float> %broadcast.splatinsert71, <4 x float> poison, <4 x i32> zeroinitializer
  %33 = fdiv <4 x float> %wide.load70, %broadcast.splat72
  store <4 x float> %33, ptr %31, align 4, !tbaa !12
  %index.next73 = add nuw i64 %index69, 4
  %34 = icmp eq i64 %index.next73, %n.vec67
  br i1 %34, label %middle.block74, label %vector.body68, !llvm.loop !52

middle.block74:                                   ; preds = %vector.body68
  %cmp.n75 = icmp eq i64 %19, %n.vec67
  br i1 %cmp.n75, label %for.cond22.preheader.i.preheader, label %for.body4.i.preheader

for.body4.i.preheader:                            ; preds = %for.body4.lr.ph.i, %middle.block74
  %indvars.iv89.i.ph = phi i64 [ %indvars.iv.i26, %for.body4.lr.ph.i ], [ %29, %middle.block74 ]
  br label %for.body4.i

for.body4.i:                                      ; preds = %for.body4.i.preheader, %for.body4.i
  %indvars.iv89.i = phi i64 [ %indvars.iv.next90.i, %for.body4.i ], [ %indvars.iv89.i.ph, %for.body4.i.preheader ]
  %arrayidx6.i29 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i28, i64 %indvars.iv89.i
  %35 = load float, ptr %arrayidx6.i29, align 4, !tbaa !12
  %36 = load float, ptr %arrayidx10.i, align 4, !tbaa !12
  %div.i30 = fdiv float %35, %36
  store float %div.i30, ptr %arrayidx6.i29, align 4, !tbaa !12
  %indvars.iv.next90.i = add nuw nsw i64 %indvars.iv89.i, 1
  %exitcond.not.i31 = icmp eq i64 %indvars.iv.next90.i, 2048
  br i1 %exitcond.not.i31, label %for.cond22.preheader.i.preheader, label %for.body4.i, !llvm.loop !53

for.cond22.preheader.i.preheader:                 ; preds = %for.body4.i, %middle.block74
  %min.iters.check = icmp ult i64 %20, 8
  %bound0 = icmp ult ptr %scevgep, %scevgep47
  %bound1 = icmp ult ptr %scevgep46, %scevgep45
  %found.conflict = and i1 %bound0, %bound1
  %bound050 = icmp ult ptr %scevgep, %scevgep49
  %bound151 = icmp ult ptr %scevgep48, %scevgep45
  %found.conflict52 = and i1 %bound050, %bound151
  %conflict.rdx = or i1 %found.conflict, %found.conflict52
  %n.vec = and i64 %20, 2040
  %37 = add nuw i64 %indvars.iv.i26, %n.vec
  %cmp.n = icmp eq i64 %20, %n.vec
  br label %for.cond22.preheader.i

for.cond22.preheader.i:                           ; preds = %for.cond22.preheader.i.preheader, %for.cond22.for.cond.cleanup24_crit_edge.i
  %indvars.iv97.i = phi i64 [ %indvars.iv.next98.i, %for.cond22.for.cond.cleanup24_crit_edge.i ], [ %indvars.iv.i26, %for.cond22.preheader.i.preheader ]
  %arrayidx27.i = getelementptr inbounds nuw [8192 x i8], ptr %0, i64 %indvars.iv97.i
  %arrayidx33.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27.i, i64 %indvars.iv102.i
  %brmerge = select i1 %min.iters.check, i1 true, i1 %conflict.rdx
  br i1 %brmerge, label %for.body25.i.preheader, label %vector.ph53

vector.ph53:                                      ; preds = %for.cond22.preheader.i
  %38 = load float, ptr %arrayidx33.i, align 4, !tbaa !12, !alias.scope !54
  %.scalar = fneg float %38
  %39 = insertelement <4 x float> poison, float %.scalar, i64 0
  %40 = shufflevector <4 x float> %39, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body56

vector.body56:                                    ; preds = %vector.body56, %vector.ph53
  %index57 = phi i64 [ 0, %vector.ph53 ], [ %index.next61, %vector.body56 ]
  %41 = add nuw i64 %indvars.iv.i26, %index57
  %42 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27.i, i64 %41
  %43 = getelementptr inbounds nuw i8, ptr %42, i64 16
  %wide.load = load <4 x float>, ptr %42, align 4, !tbaa !12, !alias.scope !57, !noalias !59
  %wide.load58 = load <4 x float>, ptr %43, align 4, !tbaa !12, !alias.scope !57, !noalias !59
  %44 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i28, i64 %41
  %45 = getelementptr inbounds nuw i8, ptr %44, i64 16
  %wide.load59 = load <4 x float>, ptr %44, align 4, !tbaa !12, !alias.scope !61
  %wide.load60 = load <4 x float>, ptr %45, align 4, !tbaa !12, !alias.scope !61
  %46 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %40, <4 x float> %wide.load59, <4 x float> %wide.load)
  %47 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %40, <4 x float> %wide.load60, <4 x float> %wide.load58)
  store <4 x float> %46, ptr %42, align 4, !tbaa !12, !alias.scope !57, !noalias !59
  store <4 x float> %47, ptr %43, align 4, !tbaa !12, !alias.scope !57, !noalias !59
  %index.next61 = add nuw i64 %index57, 8
  %48 = icmp eq i64 %index.next61, %n.vec
  br i1 %48, label %middle.block62, label %vector.body56, !llvm.loop !62

middle.block62:                                   ; preds = %vector.body56
  br i1 %cmp.n, label %for.cond22.for.cond.cleanup24_crit_edge.i, label %for.body25.i.preheader

for.body25.i.preheader:                           ; preds = %for.cond22.preheader.i, %middle.block62
  %indvars.iv92.i.ph = phi i64 [ %37, %middle.block62 ], [ %indvars.iv.i26, %for.cond22.preheader.i ]
  %xtraiter = and i64 %indvars.iv92.i.ph, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body25.i.prol.loopexit, label %for.body25.i.prol

for.body25.i.prol:                                ; preds = %for.body25.i.preheader
  %arrayidx29.i.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27.i, i64 %indvars.iv92.i.ph
  %49 = load float, ptr %arrayidx29.i.prol, align 4, !tbaa !12
  %50 = load float, ptr %arrayidx33.i, align 4, !tbaa !12
  %arrayidx37.i.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i28, i64 %indvars.iv92.i.ph
  %51 = load float, ptr %arrayidx37.i.prol, align 4, !tbaa !12
  %neg.i.prol = fneg float %50
  %52 = call float @llvm.fmuladd.f32(float %neg.i.prol, float %51, float %49)
  store float %52, ptr %arrayidx29.i.prol, align 4, !tbaa !12
  %indvars.iv.next93.i.prol = add nuw nsw i64 %indvars.iv92.i.ph, 1
  br label %for.body25.i.prol.loopexit

for.body25.i.prol.loopexit:                       ; preds = %for.body25.i.prol, %for.body25.i.preheader
  %indvars.iv92.i.unr = phi i64 [ %indvars.iv92.i.ph, %for.body25.i.preheader ], [ %indvars.iv.next93.i.prol, %for.body25.i.prol ]
  %53 = icmp eq i64 %indvars.iv92.i.ph, 2047
  br i1 %53, label %for.cond22.for.cond.cleanup24_crit_edge.i, label %for.body25.i

for.cond22.for.cond.cleanup24_crit_edge.i:        ; preds = %for.body25.i.prol.loopexit, %for.body25.i, %middle.block62
  %indvars.iv.next98.i = add nuw nsw i64 %indvars.iv97.i, 1
  %exitcond101.not.i = icmp eq i64 %indvars.iv.next98.i, 2048
  br i1 %exitcond101.not.i, label %for.cond.loopexit.i, label %for.cond22.preheader.i, !llvm.loop !27

for.body25.i:                                     ; preds = %for.body25.i.prol.loopexit, %for.body25.i
  %indvars.iv92.i = phi i64 [ %indvars.iv.next93.i.1, %for.body25.i ], [ %indvars.iv92.i.unr, %for.body25.i.prol.loopexit ]
  %arrayidx29.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27.i, i64 %indvars.iv92.i
  %54 = load float, ptr %arrayidx29.i, align 4, !tbaa !12
  %55 = load float, ptr %arrayidx33.i, align 4, !tbaa !12
  %arrayidx37.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i28, i64 %indvars.iv92.i
  %56 = load float, ptr %arrayidx37.i, align 4, !tbaa !12
  %neg.i = fneg float %55
  %57 = call float @llvm.fmuladd.f32(float %neg.i, float %56, float %54)
  store float %57, ptr %arrayidx29.i, align 4, !tbaa !12
  %indvars.iv.next93.i = add nuw nsw i64 %indvars.iv92.i, 1
  %arrayidx29.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27.i, i64 %indvars.iv.next93.i
  %58 = load float, ptr %arrayidx29.i.1, align 4, !tbaa !12
  %59 = load float, ptr %arrayidx33.i, align 4, !tbaa !12
  %arrayidx37.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i28, i64 %indvars.iv.next93.i
  %60 = load float, ptr %arrayidx37.i.1, align 4, !tbaa !12
  %neg.i.1 = fneg float %59
  %61 = call float @llvm.fmuladd.f32(float %neg.i.1, float %60, float %58)
  store float %61, ptr %arrayidx29.i.1, align 4, !tbaa !12
  %indvars.iv.next93.i.1 = add nuw nsw i64 %indvars.iv92.i, 2
  %exitcond96.not.i.1 = icmp eq i64 %indvars.iv.next93.i.1, 2048
  br i1 %exitcond96.not.i.1, label %for.cond22.for.cond.cleanup24_crit_edge.i, label %for.body25.i, !llvm.loop !63

_Z2luiPA2048_f.exit:                              ; preds = %for.cond.loopexit.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i32) #15
  %call.i.i33 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i32, ptr noundef null) #16
  %cmp.not.i.i34 = icmp eq i32 %call.i.i33, 0
  br i1 %cmp.not.i.i34, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i35

if.then.i.i35:                                    ; preds = %_Z2luiPA2048_f.exit
  %call1.i.i36 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i33) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z2luiPA2048_f.exit, %if.then.i.i35
  %62 = load i64, ptr %Tp.i.i32, align 8, !tbaa !39
  %conv.i.i37 = sitofp i64 %62 to double
  %tv_usec.i.i38 = getelementptr inbounds nuw i8, ptr %Tp.i.i32, i64 8
  %63 = load i64, ptr %tv_usec.i.i38, align 8, !tbaa !42
  %conv2.i.i39 = sitofp i64 %63 to double
  %64 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i39, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i37)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i32) #15
  store double %64, ptr @polybench_t_end, align 8, !tbaa !43
  %65 = load double, ptr @polybench_t_start, align 8, !tbaa !43
  %sub.i = fsub double %64, %65
  %call.i40 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #14
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc14_crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv34.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next35.i, %for.cond1.for.inc14_crit_edge.us.i ]
  %fail.031.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %100, %for.cond1.for.inc14_crit_edge.us.i ]
  %arrayidx.us.i = getelementptr inbounds nuw [8192 x i8], ptr %0, i64 %indvars.iv34.i
  %arrayidx7.us.i = getelementptr inbounds nuw [8192 x i8], ptr %3, i64 %indvars.iv34.i
  %66 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.031.us.i, i64 0
  br label %vector.body79

vector.body79:                                    ; preds = %vector.body79, %for.cond1.preheader.us.i
  %index80 = phi i64 [ 0, %for.cond1.preheader.us.i ], [ %index.next83, %vector.body79 ]
  %vec.phi = phi <4 x i32> [ %66, %for.cond1.preheader.us.i ], [ %98, %vector.body79 ]
  %67 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i, i64 %index80
  %wide.load81 = load <4 x float>, ptr %67, align 4, !tbaa !12
  %68 = fpext <4 x float> %wide.load81 to <4 x double>
  %69 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us.i, i64 %index80
  %wide.load82 = load <4 x float>, ptr %69, align 4, !tbaa !12
  %70 = fpext <4 x float> %wide.load82 to <4 x double>
  %71 = fcmp olt <4 x double> %68, splat (double f0xB690000000000000)
  %72 = fneg <4 x float> %wide.load81
  %73 = select <4 x i1> %71, <4 x float> %72, <4 x float> %wide.load81
  %74 = fpext <4 x float> %73 to <4 x double>
  %75 = fcmp uge <4 x double> %74, splat (double 1.000000e-02)
  %76 = fcmp olt <4 x double> %70, splat (double f0xB690000000000000)
  %77 = fneg <4 x float> %wide.load82
  %78 = select <4 x i1> %76, <4 x float> %77, <4 x float> %wide.load82
  %79 = fpext <4 x float> %78 to <4 x double>
  %80 = fcmp uge <4 x double> %79, splat (double 1.000000e-02)
  %81 = fsub <4 x double> %68, %70
  %82 = fptrunc <4 x double> %81 to <4 x float>
  %83 = fcmp olt <4 x double> %81, splat (double f0xB690000000000000)
  %84 = fneg <4 x float> %82
  %85 = select <4 x i1> %83, <4 x float> %84, <4 x float> %82
  %86 = fadd <4 x double> %68, splat (double f0x3E45798EE0000000)
  %87 = fptrunc <4 x double> %86 to <4 x float>
  %88 = fcmp olt <4 x double> %86, splat (double f0xB690000000000000)
  %89 = fneg <4 x float> %87
  %90 = select <4 x i1> %88, <4 x float> %89, <4 x float> %87
  %91 = fdiv <4 x float> %85, %90
  %92 = fcmp olt <4 x float> %91, zeroinitializer
  %93 = fneg <4 x float> %91
  %94 = select <4 x i1> %92, <4 x float> %93, <4 x float> %91
  %95 = fmul <4 x float> %94, splat (float 1.000000e+02)
  %96 = fpext <4 x float> %95 to <4 x double>
  %97 = fcmp ogt <4 x double> %96, splat (double 5.000000e-02)
  %.not86 = select <4 x i1> %75, <4 x i1> splat (i1 true), <4 x i1> %80
  %narrow = select <4 x i1> %.not86, <4 x i1> %97, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %98 = add <4 x i32> %vec.phi, %predphi
  %index.next83 = add nuw i64 %index80, 4
  %99 = icmp eq i64 %index.next83, 2048
  br i1 %99, label %for.cond1.for.inc14_crit_edge.us.i, label %vector.body79, !llvm.loop !64

for.cond1.for.inc14_crit_edge.us.i:               ; preds = %vector.body79
  %100 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %98)
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond38.not.i = icmp eq i64 %indvars.iv.next35.i, 2048
  br i1 %exitcond38.not.i, label %_Z14compareResultsiPA2048_fS0_.exit, label %for.cond1.preheader.us.i, !llvm.loop !34

_Z14compareResultsiPA2048_fS0_.exit:              ; preds = %for.cond1.for.inc14_crit_edge.us.i
  %call17.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %100) #14
  call void @free(ptr noundef nonnull %0) #16
  call void @free(ptr noundef nonnull %3) #16
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #15
  store ptr null, ptr %newA.i, align 8, !tbaa !48
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #16
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !48
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !49
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

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #12

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.ceil.f32(float) #13

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #12

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #13

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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !8, i64 0}
!14 = distinct !{!14, !11, !15, !16}
!15 = !{!"llvm.loop.isvectorized", i32 1}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
!17 = distinct !{!17, !11, !16, !15}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = !{!19, !24}
!24 = distinct !{!24, !20}
!25 = !{!24}
!26 = distinct !{!26, !11, !15, !16}
!27 = distinct !{!27, !11}
!28 = distinct !{!28, !11, !15}
!29 = distinct !{!29, !11, !15, !16}
!30 = distinct !{!30, !11, !16, !15}
!31 = distinct !{!31, !11}
!32 = distinct !{!32, !11, !15, !16}
!33 = distinct !{!33, !11, !16, !15}
!34 = distinct !{!34, !11}
!35 = !{!7, !7, i64 0}
!36 = !{!37, !37, i64 0}
!37 = !{!"p1 float", !38, i64 0}
!38 = !{!"any pointer", !8, i64 0}
!39 = !{!40, !41, i64 0}
!40 = !{!"_ZTS7timeval", !41, i64 0, !41, i64 8}
!41 = !{!"long", !8, i64 0}
!42 = !{!40, !41, i64 8}
!43 = !{!44, !44, i64 0}
!44 = !{!"double", !8, i64 0}
!45 = !{ptr @_Z25__device_stub__lu_kernel1iPfi}
!46 = !{ptr @_Z25__device_stub__lu_kernel2iPfi}
!47 = distinct !{!47, !11}
!48 = !{!38, !38, i64 0}
!49 = !{!50, !50, i64 0}
!50 = !{!"p1 _ZTS8_IO_FILE", !38, i64 0}
!51 = distinct !{!51, !11, !15, !16}
!52 = distinct !{!52, !11, !15, !16}
!53 = distinct !{!53, !11, !16, !15}
!54 = !{!55}
!55 = distinct !{!55, !56}
!56 = distinct !{!56, !"LVerDomain"}
!57 = !{!58}
!58 = distinct !{!58, !56}
!59 = !{!55, !60}
!60 = distinct !{!60, !56}
!61 = !{!60}
!62 = distinct !{!62, !11, !15, !16}
!63 = distinct !{!63, !11, !15}
!64 = distinct !{!64, !11, !15, !16}
