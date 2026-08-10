; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu"
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

; Function Attrs: mustprogress nounwind uwtable
define dso_local void @_Z11gramschmidtiiPA2048_fS0_S0_(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef captures(none) %A, ptr nofree noundef captures(none) %R, ptr nofree noundef captures(none) %Q) local_unnamed_addr #1 {
entry:
  %cmp163 = icmp sgt i32 %nj, 0
  br i1 %cmp163, label %for.cond1.preheader.lr.ph, label %for.end85

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp2140 = icmp sgt i32 %ni, 0
  %0 = zext nneg i32 %nj to i64
  %wide.trip.count191 = zext nneg i32 %nj to i64
  %wide.trip.count = zext i32 %ni to i64
  %wide.trip.count169 = zext nneg i32 %ni to i64
  %wide.trip.count179 = zext nneg i32 %ni to i64
  %1 = shl nuw nsw i64 %wide.trip.count, 13
  %2 = shl nuw nsw i64 %wide.trip.count191, 2
  %3 = add nuw nsw i64 %1, %2
  %4 = add nsw i64 %3, -8192
  %scevgep205 = getelementptr i8, ptr %A, i64 %4
  %scevgep214 = getelementptr i8, ptr %Q, i64 %4
  %5 = mul nuw nsw i64 %wide.trip.count191, 8196
  %6 = getelementptr i8, ptr %R, i64 %5
  %scevgep215 = getelementptr i8, ptr %6, i64 -8192
  %7 = getelementptr i8, ptr %Q, i64 %1
  %8 = getelementptr i8, ptr %7, i64 -8188
  %9 = getelementptr i8, ptr %R, i64 %2
  %xtraiter = and i64 %wide.trip.count, 3
  %10 = icmp ult i32 %ni, 4
  %unroll_iter = and i64 %wide.trip.count, 2147483644
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod239 = icmp ne i64 %xtraiter, 0
  %min.iters.check224 = icmp ult i32 %ni, 4
  %bound0216 = icmp ult ptr %Q, %scevgep205
  %bound1217 = icmp ult ptr %A, %scevgep214
  %found.conflict218 = and i1 %bound0216, %bound1217
  %bound0219 = icmp ult ptr %Q, %scevgep215
  %bound1220 = icmp ult ptr %R, %scevgep214
  %found.conflict221 = and i1 %bound0219, %bound1220
  %conflict.rdx222 = or i1 %found.conflict218, %found.conflict221
  %n.vec227 = and i64 %wide.trip.count, 2147483644
  %cmp.n234 = icmp eq i64 %n.vec227, %wide.trip.count
  %xtraiter240 = and i64 %wide.trip.count, 1
  %lcmp.mod241.not = icmp eq i64 %xtraiter240, 0
  %11 = add nsw i64 %wide.trip.count, -1
  %xtraiter242 = and i64 %wide.trip.count, 1
  %12 = icmp eq i32 %ni, 1
  %unroll_iter246 = and i64 %wide.trip.count, 2147483646
  %lcmp.mod244.not = icmp eq i64 %xtraiter242, 0
  %lcmp.mod245 = trunc i32 %ni to i1
  %min.iters.check = icmp ult i32 %ni, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  %xtraiter248 = and i64 %wide.trip.count, 1
  %lcmp.mod249.not = icmp eq i64 %xtraiter248, 0
  %13 = add nsw i64 %wide.trip.count, -1
  br label %for.cond1.preheader

for.cond.loopexit:                                ; preds = %for.inc80, %for.end32
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %exitcond192.not = icmp eq i64 %indvars.iv.next189, %wide.trip.count191
  br i1 %exitcond192.not, label %for.end85, label %for.cond1.preheader, !llvm.loop !10

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.cond.loopexit
  %indvars.iv188 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next189, %for.cond.loopexit ]
  %indvars.iv181 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next182, %for.cond.loopexit ]
  %14 = shl nuw nsw i64 %indvars.iv188, 2
  %15 = getelementptr i8, ptr %A, i64 %14
  %scevgep = getelementptr i8, ptr %15, i64 4
  %scevgep206 = getelementptr i8, ptr %Q, i64 %14
  %scevgep207 = getelementptr i8, ptr %8, i64 %14
  %16 = mul nuw nsw i64 %indvars.iv188, 8196
  %17 = getelementptr i8, ptr %R, i64 %16
  %scevgep208 = getelementptr i8, ptr %17, i64 4
  %18 = shl nuw nsw i64 %indvars.iv188, 13
  %scevgep209 = getelementptr i8, ptr %9, i64 %18
  br i1 %cmp2140, label %for.body3.lr.ph, label %for.end

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %invariant.gep = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv188
  br i1 %10, label %for.body3.epil.preheader, label %for.body3

for.body3:                                        ; preds = %for.body3.lr.ph, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3 ], [ 0, %for.body3.lr.ph ]
  %nrm.0142 = phi float [ %29, %for.body3 ], [ 0.000000e+00, %for.body3.lr.ph ]
  %niter = phi i64 [ %niter.next.3, %for.body3 ], [ 0, %for.body3.lr.ph ]
  %gep = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv
  %19 = load float, ptr %gep, align 4, !tbaa !12
  %20 = tail call float @llvm.fmuladd.f32(float %19, float %19, float %nrm.0142)
  %21 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv
  %gep.1 = getelementptr inbounds nuw i8, ptr %21, i64 8192
  %22 = load float, ptr %gep.1, align 4, !tbaa !12
  %23 = tail call float @llvm.fmuladd.f32(float %22, float %22, float %20)
  %24 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv
  %gep.2 = getelementptr inbounds nuw i8, ptr %24, i64 16384
  %25 = load float, ptr %gep.2, align 4, !tbaa !12
  %26 = tail call float @llvm.fmuladd.f32(float %25, float %25, float %23)
  %27 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv
  %gep.3 = getelementptr inbounds nuw i8, ptr %27, i64 24576
  %28 = load float, ptr %gep.3, align 4, !tbaa !12
  %29 = tail call float @llvm.fmuladd.f32(float %28, float %28, float %26)
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.next.3 = add i64 %niter, 4
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %for.body17.preheader.unr-lcssa, label %for.body3, !llvm.loop !14

for.end:                                          ; preds = %for.cond1.preheader
  %sqrtf = tail call float @sqrtf(float noundef 0.000000e+00) #15
  %arrayidx12 = getelementptr inbounds nuw [8192 x i8], ptr %R, i64 %indvars.iv188
  %arrayidx14 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12, i64 %indvars.iv188
  store float 0.000000e+00, ptr %arrayidx14, align 4, !tbaa !12
  br label %for.end32

for.body17.preheader.unr-lcssa:                   ; preds = %for.body3
  br i1 %lcmp.mod.not, label %for.body17.preheader, label %for.body3.epil.preheader

for.body3.epil.preheader:                         ; preds = %for.body17.preheader.unr-lcssa, %for.body3.lr.ph
  %indvars.iv.epil.init = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next.3, %for.body17.preheader.unr-lcssa ]
  %nrm.0142.epil.init = phi float [ 0.000000e+00, %for.body3.lr.ph ], [ %29, %for.body17.preheader.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod239)
  br label %for.body3.epil

for.body3.epil:                                   ; preds = %for.body3.epil, %for.body3.epil.preheader
  %indvars.iv.epil = phi i64 [ %indvars.iv.epil.init, %for.body3.epil.preheader ], [ %indvars.iv.next.epil, %for.body3.epil ]
  %nrm.0142.epil = phi float [ %nrm.0142.epil.init, %for.body3.epil.preheader ], [ %31, %for.body3.epil ]
  %epil.iter = phi i64 [ 0, %for.body3.epil.preheader ], [ %epil.iter.next, %for.body3.epil ]
  %gep.epil = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep, i64 %indvars.iv.epil
  %30 = load float, ptr %gep.epil, align 4, !tbaa !12
  %31 = tail call float @llvm.fmuladd.f32(float %30, float %30, float %nrm.0142.epil)
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.body17.preheader, label %for.body3.epil, !llvm.loop !15

for.body17.preheader:                             ; preds = %for.body3.epil, %for.body17.preheader.unr-lcssa
  %.lcssa = phi float [ %29, %for.body17.preheader.unr-lcssa ], [ %31, %for.body3.epil ]
  %sqrtf194 = tail call float @sqrtf(float noundef %.lcssa) #15
  %arrayidx12195 = getelementptr inbounds nuw [8192 x i8], ptr %R, i64 %indvars.iv188
  %arrayidx14196 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12195, i64 %indvars.iv188
  store float %sqrtf194, ptr %arrayidx14196, align 4, !tbaa !12
  %invariant.gep143197 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv188
  %invariant.gep145198 = getelementptr inbounds nuw [4 x i8], ptr %Q, i64 %indvars.iv188
  %brmerge = select i1 %min.iters.check224, i1 true, i1 %conflict.rdx222
  br i1 %brmerge, label %for.body17.preheader237, label %vector.ph225

vector.ph225:                                     ; preds = %for.body17.preheader
  %32 = load float, ptr %arrayidx14196, align 4, !tbaa !12, !alias.scope !17
  %broadcast.splatinsert230 = insertelement <4 x float> poison, float %32, i64 0
  %broadcast.splat231 = shufflevector <4 x float> %broadcast.splatinsert230, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body228

vector.body228:                                   ; preds = %vector.body228, %vector.ph225
  %index229 = phi i64 [ 0, %vector.ph225 ], [ %index.next232, %vector.body228 ]
  %33 = or disjoint i64 %index229, 1
  %34 = or disjoint i64 %index229, 2
  %35 = or disjoint i64 %index229, 3
  %36 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep143197, i64 %index229
  %37 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep143197, i64 %33
  %38 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep143197, i64 %34
  %39 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep143197, i64 %35
  %40 = load float, ptr %36, align 4, !tbaa !12, !alias.scope !20
  %41 = load float, ptr %37, align 4, !tbaa !12, !alias.scope !20
  %42 = load float, ptr %38, align 4, !tbaa !12, !alias.scope !20
  %43 = load float, ptr %39, align 4, !tbaa !12, !alias.scope !20
  %44 = insertelement <4 x float> poison, float %40, i64 0
  %45 = insertelement <4 x float> %44, float %41, i64 1
  %46 = insertelement <4 x float> %45, float %42, i64 2
  %47 = insertelement <4 x float> %46, float %43, i64 3
  %48 = fdiv <4 x float> %47, %broadcast.splat231
  %49 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198, i64 %index229
  %50 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198, i64 %33
  %51 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198, i64 %34
  %52 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198, i64 %35
  %53 = extractelement <4 x float> %48, i64 0
  store float %53, ptr %49, align 4, !tbaa !12, !alias.scope !22, !noalias !24
  %54 = extractelement <4 x float> %48, i64 1
  store float %54, ptr %50, align 4, !tbaa !12, !alias.scope !22, !noalias !24
  %55 = extractelement <4 x float> %48, i64 2
  store float %55, ptr %51, align 4, !tbaa !12, !alias.scope !22, !noalias !24
  %56 = extractelement <4 x float> %48, i64 3
  store float %56, ptr %52, align 4, !tbaa !12, !alias.scope !22, !noalias !24
  %index.next232 = add nuw i64 %index229, 4
  %57 = icmp eq i64 %index.next232, %n.vec227
  br i1 %57, label %middle.block233, label %vector.body228, !llvm.loop !25

middle.block233:                                  ; preds = %vector.body228
  br i1 %cmp.n234, label %for.end32, label %for.body17.preheader237

for.body17.preheader237:                          ; preds = %for.body17.preheader, %middle.block233
  %indvars.iv166.ph = phi i64 [ %n.vec227, %middle.block233 ], [ 0, %for.body17.preheader ]
  br i1 %lcmp.mod241.not, label %for.body17.prol.loopexit, label %for.body17.prol

for.body17.prol:                                  ; preds = %for.body17.preheader237
  %gep144.prol = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep143197, i64 %indvars.iv166.ph
  %58 = load float, ptr %gep144.prol, align 4, !tbaa !12
  %59 = load float, ptr %arrayidx14196, align 4, !tbaa !12
  %div.prol = fdiv float %58, %59
  %gep146.prol = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198, i64 %indvars.iv166.ph
  store float %div.prol, ptr %gep146.prol, align 4, !tbaa !12
  %indvars.iv.next167.prol = or disjoint i64 %indvars.iv166.ph, 1
  br label %for.body17.prol.loopexit

for.body17.prol.loopexit:                         ; preds = %for.body17.prol, %for.body17.preheader237
  %indvars.iv166.unr = phi i64 [ %indvars.iv166.ph, %for.body17.preheader237 ], [ %indvars.iv.next167.prol, %for.body17.prol ]
  %60 = icmp eq i64 %indvars.iv166.ph, %11
  br i1 %60, label %for.end32, label %for.body17

for.body17:                                       ; preds = %for.body17.prol.loopexit, %for.body17
  %indvars.iv166 = phi i64 [ %indvars.iv.next167.1, %for.body17 ], [ %indvars.iv166.unr, %for.body17.prol.loopexit ]
  %gep144 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep143197, i64 %indvars.iv166
  %61 = load float, ptr %gep144, align 4, !tbaa !12
  %62 = load float, ptr %arrayidx14196, align 4, !tbaa !12
  %div = fdiv float %61, %62
  %gep146 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198, i64 %indvars.iv166
  store float %div, ptr %gep146, align 4, !tbaa !12
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %gep144.1 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep143197, i64 %indvars.iv.next167
  %63 = load float, ptr %gep144.1, align 4, !tbaa !12
  %64 = load float, ptr %arrayidx14196, align 4, !tbaa !12
  %div.1 = fdiv float %63, %64
  %gep146.1 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198, i64 %indvars.iv.next167
  store float %div.1, ptr %gep146.1, align 4, !tbaa !12
  %indvars.iv.next167.1 = add nuw nsw i64 %indvars.iv166, 2
  %exitcond170.not.1 = icmp eq i64 %indvars.iv.next167.1, %wide.trip.count169
  br i1 %exitcond170.not.1, label %for.end32, label %for.body17, !llvm.loop !28

for.end32:                                        ; preds = %for.body17.prol.loopexit, %for.body17, %middle.block233, %for.end
  %indvars.iv.next189 = add nuw nsw i64 %indvars.iv188, 1
  %cmp34161 = icmp samesign ult i64 %indvars.iv.next189, %0
  br i1 %cmp34161, label %for.body35.preheader, label %for.cond.loopexit

for.body35.preheader:                             ; preds = %for.end32
  %65 = getelementptr inbounds nuw [8192 x i8], ptr %R, i64 %indvars.iv188
  %66 = getelementptr inbounds nuw [4 x i8], ptr %Q, i64 %indvars.iv188
  %67 = getelementptr inbounds nuw [4 x i8], ptr %Q, i64 %indvars.iv188
  %68 = getelementptr inbounds nuw [4 x i8], ptr %Q, i64 %indvars.iv188
  %bound0 = icmp ult ptr %scevgep, %scevgep207
  %bound1 = icmp ult ptr %scevgep206, %scevgep205
  %found.conflict = and i1 %bound0, %bound1
  %bound0210 = icmp ult ptr %scevgep, %scevgep209
  %bound1211 = icmp ult ptr %scevgep208, %scevgep205
  %found.conflict212 = and i1 %bound0210, %bound1211
  %conflict.rdx = or i1 %found.conflict, %found.conflict212
  %69 = getelementptr inbounds nuw [4 x i8], ptr %Q, i64 %indvars.iv188
  %70 = getelementptr inbounds nuw [4 x i8], ptr %Q, i64 %indvars.iv188
  %71 = getelementptr inbounds nuw [4 x i8], ptr %Q, i64 %indvars.iv188
  %72 = getelementptr inbounds nuw [4 x i8], ptr %Q, i64 %indvars.iv188
  br label %for.body35

for.body35:                                       ; preds = %for.body35.preheader, %for.inc80
  %indvars.iv183 = phi i64 [ %indvars.iv.next184, %for.inc80 ], [ %indvars.iv181, %for.body35.preheader ]
  %arrayidx39 = getelementptr inbounds nuw [4 x i8], ptr %65, i64 %indvars.iv183
  store float 0.000000e+00, ptr %arrayidx39, align 4, !tbaa !12
  %invariant.gep151 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv183
  br i1 %cmp2140, label %for.body42.preheader, label %for.inc80

for.body42.preheader:                             ; preds = %for.body35
  br i1 %12, label %for.body42.epil.preheader, label %for.body42

for.body42:                                       ; preds = %for.body42.preheader, %for.body42
  %indvars.iv171 = phi i64 [ %indvars.iv.next172.1, %for.body42 ], [ 0, %for.body42.preheader ]
  %73 = phi float [ %79, %for.body42 ], [ 0.000000e+00, %for.body42.preheader ]
  %niter247 = phi i64 [ %niter247.next.1, %for.body42 ], [ 0, %for.body42.preheader ]
  %gep150 = getelementptr inbounds nuw [8192 x i8], ptr %66, i64 %indvars.iv171
  %74 = load float, ptr %gep150, align 4, !tbaa !12
  %gep152 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151, i64 %indvars.iv171
  %75 = load float, ptr %gep152, align 4, !tbaa !12
  %76 = tail call float @llvm.fmuladd.f32(float %74, float %75, float %73)
  store float %76, ptr %arrayidx39, align 4, !tbaa !12
  %indvars.iv.next172 = or disjoint i64 %indvars.iv171, 1
  %gep150.1 = getelementptr inbounds nuw [8192 x i8], ptr %67, i64 %indvars.iv.next172
  %77 = load float, ptr %gep150.1, align 4, !tbaa !12
  %gep152.1 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151, i64 %indvars.iv.next172
  %78 = load float, ptr %gep152.1, align 4, !tbaa !12
  %79 = tail call float @llvm.fmuladd.f32(float %77, float %78, float %76)
  store float %79, ptr %arrayidx39, align 4, !tbaa !12
  %indvars.iv.next172.1 = add nuw nsw i64 %indvars.iv171, 2
  %niter247.next.1 = add i64 %niter247, 2
  %niter247.ncmp.1 = icmp eq i64 %niter247.next.1, %unroll_iter246
  br i1 %niter247.ncmp.1, label %for.body60.preheader.unr-lcssa, label %for.body42, !llvm.loop !29

for.body60.preheader.unr-lcssa:                   ; preds = %for.body42
  br i1 %lcmp.mod244.not, label %for.body60.preheader, label %for.body42.epil.preheader

for.body42.epil.preheader:                        ; preds = %for.body60.preheader.unr-lcssa, %for.body42.preheader
  %indvars.iv171.epil.init = phi i64 [ 0, %for.body42.preheader ], [ %indvars.iv.next172.1, %for.body60.preheader.unr-lcssa ]
  %.epil.init = phi float [ 0.000000e+00, %for.body42.preheader ], [ %79, %for.body60.preheader.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod245)
  %gep150.epil = getelementptr inbounds nuw [8192 x i8], ptr %68, i64 %indvars.iv171.epil.init
  %80 = load float, ptr %gep150.epil, align 4, !tbaa !12
  %gep152.epil = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151, i64 %indvars.iv171.epil.init
  %81 = load float, ptr %gep152.epil, align 4, !tbaa !12
  %82 = tail call float @llvm.fmuladd.f32(float %80, float %81, float %.epil.init)
  store float %82, ptr %arrayidx39, align 4, !tbaa !12
  br label %for.body60.preheader

for.body60.preheader:                             ; preds = %for.body60.preheader.unr-lcssa, %for.body42.epil.preheader
  %brmerge253 = select i1 %min.iters.check, i1 true, i1 %conflict.rdx
  br i1 %brmerge253, label %for.body60.preheader236, label %vector.ph

vector.ph:                                        ; preds = %for.body60.preheader
  %83 = load float, ptr %arrayidx39, align 4, !tbaa !12, !alias.scope !30
  %broadcast.splatinsert = insertelement <4 x float> poison, float %83, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %84 = or disjoint i64 %index, 1
  %85 = or disjoint i64 %index, 2
  %86 = or disjoint i64 %index, 3
  %87 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151, i64 %index
  %88 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151, i64 %84
  %89 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151, i64 %85
  %90 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151, i64 %86
  %91 = load float, ptr %87, align 4, !tbaa !12, !alias.scope !33, !noalias !35
  %92 = load float, ptr %88, align 4, !tbaa !12, !alias.scope !33, !noalias !35
  %93 = load float, ptr %89, align 4, !tbaa !12, !alias.scope !33, !noalias !35
  %94 = load float, ptr %90, align 4, !tbaa !12, !alias.scope !33, !noalias !35
  %95 = insertelement <4 x float> poison, float %91, i64 0
  %96 = insertelement <4 x float> %95, float %92, i64 1
  %97 = insertelement <4 x float> %96, float %93, i64 2
  %98 = insertelement <4 x float> %97, float %94, i64 3
  %99 = getelementptr inbounds nuw [8192 x i8], ptr %69, i64 %index
  %100 = getelementptr inbounds nuw [8192 x i8], ptr %69, i64 %84
  %101 = getelementptr inbounds nuw [8192 x i8], ptr %69, i64 %85
  %102 = getelementptr inbounds nuw [8192 x i8], ptr %69, i64 %86
  %103 = load float, ptr %99, align 4, !tbaa !12, !alias.scope !37
  %104 = load float, ptr %100, align 4, !tbaa !12, !alias.scope !37
  %105 = load float, ptr %101, align 4, !tbaa !12, !alias.scope !37
  %106 = load float, ptr %102, align 4, !tbaa !12, !alias.scope !37
  %107 = insertelement <4 x float> poison, float %103, i64 0
  %108 = insertelement <4 x float> %107, float %104, i64 1
  %109 = insertelement <4 x float> %108, float %105, i64 2
  %110 = insertelement <4 x float> %109, float %106, i64 3
  %111 = fneg <4 x float> %110
  %112 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %111, <4 x float> %broadcast.splat, <4 x float> %98)
  %113 = extractelement <4 x float> %112, i64 0
  store float %113, ptr %87, align 4, !tbaa !12, !alias.scope !33, !noalias !35
  %114 = extractelement <4 x float> %112, i64 1
  store float %114, ptr %88, align 4, !tbaa !12, !alias.scope !33, !noalias !35
  %115 = extractelement <4 x float> %112, i64 2
  store float %115, ptr %89, align 4, !tbaa !12, !alias.scope !33, !noalias !35
  %116 = extractelement <4 x float> %112, i64 3
  store float %116, ptr %90, align 4, !tbaa !12, !alias.scope !33, !noalias !35
  %index.next = add nuw i64 %index, 4
  %117 = icmp eq i64 %index.next, %n.vec
  br i1 %117, label %middle.block, label %vector.body, !llvm.loop !38

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc80, label %for.body60.preheader236

for.body60.preheader236:                          ; preds = %for.body60.preheader, %middle.block
  %indvars.iv176.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %for.body60.preheader ]
  br i1 %lcmp.mod249.not, label %for.body60.prol.loopexit, label %for.body60.prol

for.body60.prol:                                  ; preds = %for.body60.preheader236
  %gep156.prol = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151, i64 %indvars.iv176.ph
  %118 = load float, ptr %gep156.prol, align 4, !tbaa !12
  %gep158.prol = getelementptr inbounds nuw [8192 x i8], ptr %70, i64 %indvars.iv176.ph
  %119 = load float, ptr %gep158.prol, align 4, !tbaa !12
  %120 = load float, ptr %arrayidx39, align 4, !tbaa !12
  %neg.prol = fneg float %119
  %121 = tail call float @llvm.fmuladd.f32(float %neg.prol, float %120, float %118)
  store float %121, ptr %gep156.prol, align 4, !tbaa !12
  %indvars.iv.next177.prol = or disjoint i64 %indvars.iv176.ph, 1
  br label %for.body60.prol.loopexit

for.body60.prol.loopexit:                         ; preds = %for.body60.prol, %for.body60.preheader236
  %indvars.iv176.unr = phi i64 [ %indvars.iv176.ph, %for.body60.preheader236 ], [ %indvars.iv.next177.prol, %for.body60.prol ]
  %122 = icmp eq i64 %indvars.iv176.ph, %13
  br i1 %122, label %for.inc80, label %for.body60

for.body60:                                       ; preds = %for.body60.prol.loopexit, %for.body60
  %indvars.iv176 = phi i64 [ %indvars.iv.next177.1, %for.body60 ], [ %indvars.iv176.unr, %for.body60.prol.loopexit ]
  %gep156 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151, i64 %indvars.iv176
  %123 = load float, ptr %gep156, align 4, !tbaa !12
  %gep158 = getelementptr inbounds nuw [8192 x i8], ptr %71, i64 %indvars.iv176
  %124 = load float, ptr %gep158, align 4, !tbaa !12
  %125 = load float, ptr %arrayidx39, align 4, !tbaa !12
  %neg = fneg float %124
  %126 = tail call float @llvm.fmuladd.f32(float %neg, float %125, float %123)
  store float %126, ptr %gep156, align 4, !tbaa !12
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %gep156.1 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151, i64 %indvars.iv.next177
  %127 = load float, ptr %gep156.1, align 4, !tbaa !12
  %gep158.1 = getelementptr inbounds nuw [8192 x i8], ptr %72, i64 %indvars.iv.next177
  %128 = load float, ptr %gep158.1, align 4, !tbaa !12
  %129 = load float, ptr %arrayidx39, align 4, !tbaa !12
  %neg.1 = fneg float %128
  %130 = tail call float @llvm.fmuladd.f32(float %neg.1, float %129, float %127)
  store float %130, ptr %gep156.1, align 4, !tbaa !12
  %indvars.iv.next177.1 = add nuw nsw i64 %indvars.iv176, 2
  %exitcond180.not.1 = icmp eq i64 %indvars.iv.next177.1, %wide.trip.count179
  br i1 %exitcond180.not.1, label %for.inc80, label %for.body60, !llvm.loop !39

for.inc80:                                        ; preds = %for.body60.prol.loopexit, %for.body60, %middle.block, %for.body35
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %exitcond187.not = icmp eq i64 %indvars.iv.next184, %wide.trip.count191
  br i1 %exitcond187.not, label %for.cond.loopexit, label %for.body35, !llvm.loop !40

for.end85:                                        ; preds = %for.cond.loopexit, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable
define dso_local void @_Z10init_arrayiiPA2048_fS0_S0_(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %R, ptr nofree noundef writeonly captures(none) %Q) local_unnamed_addr #4 {
entry:
  %A92 = ptrtoaddr ptr %A to i64
  %Q91 = ptrtoaddr ptr %Q to i64
  %cmp67 = icmp sgt i32 %ni, 0
  br i1 %cmp67, label %for.cond1.preheader.lr.ph, label %for.cond20.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp265 = icmp sgt i32 %nj, 0
  %conv5 = uitofp nneg i32 %ni to float
  %conv11 = sitofp i32 %nj to float
  br i1 %cmp265, label %for.cond1.preheader.preheader, label %for.end41

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count77 = zext nneg i32 %ni to i64
  %wide.trip.count = zext nneg i32 %nj to i64
  %min.iters.check = icmp ult i32 %nj, 4
  %0 = sub i64 %A92, %Q91
  %diff.check = icmp ugt i64 %0, -16
  %or.cond = or i1 %min.iters.check, %diff.check
  %n.vec = and i64 %wide.trip.count, 2147483644
  %broadcast.splatinsert93 = insertelement <4 x float> poison, float %conv5, i64 0
  %broadcast.splat94 = shufflevector <4 x float> %broadcast.splatinsert93, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert95 = insertelement <4 x float> poison, float %conv11, i64 0
  %broadcast.splat96 = shufflevector <4 x float> %broadcast.splatinsert95, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  %1 = insertelement <2 x float> poison, float %conv5, i64 0
  %2 = insertelement <2 x float> %1, float %conv11, i64 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc17_crit_edge
  %indvars.iv74 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next75, %for.cond1.for.inc17_crit_edge ]
  %3 = trunc nuw nsw i64 %indvars.iv74 to i32
  %conv = uitofp nneg i32 %3 to float
  %arrayidx = getelementptr inbounds nuw [8192 x i8], ptr %A, i64 %indvars.iv74
  %arrayidx14 = getelementptr inbounds nuw [8192 x i8], ptr %Q, i64 %indvars.iv74
  br i1 %or.cond, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.ind97 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next98, %vector.body ]
  %4 = uitofp nneg <4 x i32> %vec.ind97 to <4 x float>
  %5 = fmul nnan <4 x float> %broadcast.splat, %4
  %6 = fdiv <4 x float> %5, %broadcast.splat94
  %7 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  store <4 x float> %6, ptr %7, align 4, !tbaa !12
  %8 = trunc <4 x i64> %vec.ind to <4 x i32>
  %9 = add <4 x i32> %8, splat (i32 1)
  %10 = uitofp nneg <4 x i32> %9 to <4 x float>
  %11 = fmul nnan <4 x float> %broadcast.splat, %10
  %12 = fdiv <4 x float> %11, %broadcast.splat96
  %13 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14, i64 %index
  store <4 x float> %12, ptr %13, align 4, !tbaa !12
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add nuw nsw <4 x i64> %vec.ind, splat (i64 4)
  %vec.ind.next98 = add <4 x i32> %vec.ind97, splat (i32 4)
  %14 = icmp eq i64 %index.next, %n.vec
  br i1 %14, label %middle.block, label %vector.body, !llvm.loop !41

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc17_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader ], [ %n.vec, %middle.block ]
  %15 = insertelement <2 x float> poison, float %conv, i64 0
  %16 = shufflevector <2 x float> %15, <2 x float> poison, <2 x i32> zeroinitializer
  br label %for.body3

for.cond20.preheader:                             ; preds = %for.cond1.for.inc17_crit_edge, %entry
  %cmp2171 = icmp sgt i32 %nj, 0
  br i1 %cmp2171, label %for.cond23.preheader.lr.ph, label %for.end41

for.cond23.preheader.lr.ph:                       ; preds = %for.cond20.preheader
  %conv30 = uitofp nneg i32 %nj to float
  %wide.trip.count88 = zext nneg i32 %nj to i64
  %min.iters.check100 = icmp ult i32 %nj, 4
  %n.vec103 = and i64 %wide.trip.count88, 2147483644
  %broadcast.splatinsert106 = insertelement <4 x float> poison, float %conv30, i64 0
  %broadcast.splat107 = shufflevector <4 x float> %broadcast.splatinsert106, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n114 = icmp eq i64 %n.vec103, %wide.trip.count88
  br label %for.cond23.preheader

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %arrayidx7 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = trunc nuw nsw i64 %indvars.iv.next to i32
  %18 = trunc nuw nsw i64 %indvars.iv to i32
  %conv9 = uitofp nneg i32 %17 to float
  %conv4 = uitofp nneg i32 %18 to float
  %19 = insertelement <2 x float> poison, float %conv4, i64 0
  %20 = insertelement <2 x float> %19, float %conv9, i64 1
  %21 = fmul nnan <2 x float> %16, %20
  %22 = fdiv <2 x float> %21, %2
  %23 = extractelement <2 x float> %22, i64 0
  store float %23, ptr %arrayidx7, align 4, !tbaa !12
  %arrayidx16 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14, i64 %indvars.iv
  %24 = extractelement <2 x float> %22, i64 1
  store float %24, ptr %arrayidx16, align 4, !tbaa !12
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc17_crit_edge, label %for.body3, !llvm.loop !42

for.cond1.for.inc17_crit_edge:                    ; preds = %for.body3, %middle.block
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond78.not = icmp eq i64 %indvars.iv.next75, %wide.trip.count77
  br i1 %exitcond78.not, label %for.cond20.preheader, label %for.cond1.preheader, !llvm.loop !43

for.cond23.preheader:                             ; preds = %for.cond23.preheader.lr.ph, %for.cond23.for.inc39_crit_edge
  %indvars.iv85 = phi i64 [ 0, %for.cond23.preheader.lr.ph ], [ %indvars.iv.next86, %for.cond23.for.inc39_crit_edge ]
  %25 = trunc nuw nsw i64 %indvars.iv85 to i32
  %conv26 = uitofp nneg i32 %25 to float
  %arrayidx33 = getelementptr inbounds nuw [8192 x i8], ptr %R, i64 %indvars.iv85
  br i1 %min.iters.check100, label %for.body25.preheader, label %vector.ph101

vector.ph101:                                     ; preds = %for.cond23.preheader
  %broadcast.splatinsert104 = insertelement <4 x float> poison, float %conv26, i64 0
  %broadcast.splat105 = shufflevector <4 x float> %broadcast.splatinsert104, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body108

vector.body108:                                   ; preds = %vector.body108, %vector.ph101
  %index109 = phi i64 [ 0, %vector.ph101 ], [ %index.next111, %vector.body108 ]
  %vec.ind110 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph101 ], [ %vec.ind.next112, %vector.body108 ]
  %26 = add <4 x i32> %vec.ind110, splat (i32 2)
  %27 = uitofp nneg <4 x i32> %26 to <4 x float>
  %28 = fmul nnan <4 x float> %broadcast.splat105, %27
  %29 = fdiv <4 x float> %28, %broadcast.splat107
  %30 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx33, i64 %index109
  store <4 x float> %29, ptr %30, align 4, !tbaa !12
  %index.next111 = add nuw i64 %index109, 4
  %vec.ind.next112 = add <4 x i32> %vec.ind110, splat (i32 4)
  %31 = icmp eq i64 %index.next111, %n.vec103
  br i1 %31, label %middle.block113, label %vector.body108, !llvm.loop !44

middle.block113:                                  ; preds = %vector.body108
  br i1 %cmp.n114, label %for.cond23.for.inc39_crit_edge, label %for.body25.preheader

for.body25.preheader:                             ; preds = %for.cond23.preheader, %middle.block113
  %indvars.iv79.ph = phi i64 [ 0, %for.cond23.preheader ], [ %n.vec103, %middle.block113 ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25.preheader, %for.body25
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %for.body25 ], [ %indvars.iv79.ph, %for.body25.preheader ]
  %32 = trunc i64 %indvars.iv79 to i32
  %33 = add i32 %32, 2
  %conv28 = uitofp nneg i32 %33 to float
  %mul29 = fmul nnan float %conv26, %conv28
  %div31 = fdiv float %mul29, %conv30
  %arrayidx35 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx33, i64 %indvars.iv79
  store float %div31, ptr %arrayidx35, align 4, !tbaa !12
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond84.not = icmp eq i64 %indvars.iv.next80, %wide.trip.count88
  br i1 %exitcond84.not, label %for.cond23.for.inc39_crit_edge, label %for.body25, !llvm.loop !45

for.cond23.for.inc39_crit_edge:                   ; preds = %for.body25, %middle.block113
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond89.not = icmp eq i64 %indvars.iv.next86, %wide.trip.count88
  br i1 %exitcond89.not, label %for.end41, label %for.cond23.preheader, !llvm.loop !46

for.end41:                                        ; preds = %for.cond23.for.inc39_crit_edge, %for.cond1.preheader.lr.ph, %for.cond20.preheader
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiiPA2048_fS0_(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %A_outputFromGpu) local_unnamed_addr #5 {
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
  %arrayidx.us = getelementptr inbounds nuw [8192 x i8], ptr %A, i64 %indvars.iv34
  %arrayidx7.us = getelementptr inbounds nuw [8192 x i8], ptr %A_outputFromGpu, i64 %indvars.iv34
  br i1 %min.iters.check, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.us
  %0 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.030.us, i64 0
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
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !47

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
  %fail.2.us = add nsw i32 %retval.0.i.us, %fail.127.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us, !llvm.loop !48

for.cond1.for.inc14_crit_edge.us:                 ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %fail.2.us.lcssa = phi i32 [ %34, %middle.block ], [ %fail.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %for.end16, label %for.cond1.preheader.us, !llvm.loop !49

for.end16:                                        ; preds = %for.cond1.for.inc14_crit_edge.us, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %call17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %fail.0.lcssa) #16
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
define dso_local void @_Z34__device_stub__gramschmidt_kernel1iiPfS_S_i(i32 noundef %ni, i32 noundef %nj, ptr noundef %a, ptr noundef %r, ptr noundef %q, i32 noundef %k) #9 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %a.addr = alloca ptr, align 8
  %r.addr = alloca ptr, align 8
  %q.addr = alloca ptr, align 8
  %k.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !50
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !50
  store ptr %a, ptr %a.addr, align 8, !tbaa !51
  store ptr %r, ptr %r.addr, align 8, !tbaa !51
  store ptr %q, ptr %q.addr, align 8, !tbaa !51
  store i32 %k, ptr %k.addr, align 4, !tbaa !50
  %kernel_args1 = alloca [6 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %a.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %r.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %q.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %k.addr, ptr %4, align 8
  %5 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %6 = load i64, ptr %shmem_size, align 8
  %7 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z34__device_stub__gramschmidt_kernel1iiPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %6, ptr noundef %7)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z34__device_stub__gramschmidt_kernel2iiPfS_S_i(i32 noundef %ni, i32 noundef %nj, ptr noundef %a, ptr noundef %r, ptr noundef %q, i32 noundef %k) #9 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %a.addr = alloca ptr, align 8
  %r.addr = alloca ptr, align 8
  %q.addr = alloca ptr, align 8
  %k.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !50
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !50
  store ptr %a, ptr %a.addr, align 8, !tbaa !51
  store ptr %r, ptr %r.addr, align 8, !tbaa !51
  store ptr %q, ptr %q.addr, align 8, !tbaa !51
  store i32 %k, ptr %k.addr, align 4, !tbaa !50
  %kernel_args1 = alloca [6 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %a.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %r.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %q.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %k.addr, ptr %4, align 8
  %5 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %6 = load i64, ptr %shmem_size, align 8
  %7 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z34__device_stub__gramschmidt_kernel2iiPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %6, ptr noundef %7)
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z34__device_stub__gramschmidt_kernel3iiPfS_S_i(i32 noundef %ni, i32 noundef %nj, ptr noundef %a, ptr noundef %r, ptr noundef %q, i32 noundef %k) #9 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %a.addr = alloca ptr, align 8
  %r.addr = alloca ptr, align 8
  %q.addr = alloca ptr, align 8
  %k.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !50
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !50
  store ptr %a, ptr %a.addr, align 8, !tbaa !51
  store ptr %r, ptr %r.addr, align 8, !tbaa !51
  store ptr %q, ptr %q.addr, align 8, !tbaa !51
  store i32 %k, ptr %k.addr, align 4, !tbaa !50
  %kernel_args1 = alloca [6 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %a.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %r.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %q.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %k.addr, ptr %4, align 8
  %5 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %6 = load i64, ptr %shmem_size, align 8
  %7 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z34__device_stub__gramschmidt_kernel3iiPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %6, ptr noundef %7)
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z15gramschmidtCudaiiPA2048_fS0_S0_S0_(i32 noundef %ni, i32 noundef %nj, ptr noundef %A, ptr nofree readnone captures(none) %R, ptr nofree readnone captures(none) %Q, ptr noundef %A_outputFromGpu) local_unnamed_addr #7 {
entry:
  %Tp.i.i80 = alloca %struct.timeval, align 8
  %ni.addr.i62 = alloca i32, align 4
  %nj.addr.i63 = alloca i32, align 4
  %a.addr.i64 = alloca ptr, align 8
  %r.addr.i65 = alloca ptr, align 8
  %q.addr.i66 = alloca ptr, align 8
  %k.addr.i67 = alloca i32, align 4
  %grid_dim.i68 = alloca %struct.dim3, align 8
  %block_dim.i69 = alloca %struct.dim3, align 8
  %shmem_size.i70 = alloca i64, align 8
  %stream.i71 = alloca ptr, align 8
  %kernel_args1.i72 = alloca [6 x ptr], align 16
  %ni.addr.i44 = alloca i32, align 4
  %nj.addr.i45 = alloca i32, align 4
  %a.addr.i46 = alloca ptr, align 8
  %r.addr.i47 = alloca ptr, align 8
  %q.addr.i48 = alloca ptr, align 8
  %k.addr.i49 = alloca i32, align 4
  %grid_dim.i50 = alloca %struct.dim3, align 8
  %block_dim.i51 = alloca %struct.dim3, align 8
  %shmem_size.i52 = alloca i64, align 8
  %stream.i53 = alloca ptr, align 8
  %kernel_args1.i54 = alloca [6 x ptr], align 16
  %ni.addr.i = alloca i32, align 4
  %nj.addr.i = alloca i32, align 4
  %a.addr.i = alloca ptr, align 8
  %r.addr.i = alloca ptr, align 8
  %q.addr.i = alloca ptr, align 8
  %k.addr.i = alloca i32, align 4
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [6 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %A_gpu = alloca ptr, align 8
  %R_gpu = alloca ptr, align 8
  %Q_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %R_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %Q_gpu) #17
  %call = call i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 16777216) #16
  %call4 = call i32 @cudaMalloc(ptr noundef nonnull %R_gpu, i64 noundef 16777216) #16
  %call5 = call i32 @cudaMalloc(ptr noundef nonnull %Q_gpu, i64 noundef 16777216) #16
  %0 = load ptr, ptr %A_gpu, align 8, !tbaa !51
  %call6 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 16777216, i32 noundef 1) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #17
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #15
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #16
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %1 = load i64, ptr %Tp.i.i, align 8, !tbaa !54
  %conv.i.i = sitofp i64 %1 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %2 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !57
  %conv2.i.i = sitofp i64 %2 to double
  %3 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #17
  store double %3, ptr @polybench_t_start, align 8, !tbaa !58
  %cmp93 = icmp sgt i32 %nj, 0
  br i1 %cmp93, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %_Z21polybench_timer_startv.exit
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  %7 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 32
  %8 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 40
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %9 = getelementptr inbounds nuw i8, ptr %kernel_args1.i54, i64 8
  %10 = getelementptr inbounds nuw i8, ptr %kernel_args1.i54, i64 16
  %11 = getelementptr inbounds nuw i8, ptr %kernel_args1.i54, i64 24
  %12 = getelementptr inbounds nuw i8, ptr %kernel_args1.i54, i64 32
  %13 = getelementptr inbounds nuw i8, ptr %kernel_args1.i54, i64 40
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i56 = getelementptr inbounds nuw i8, ptr %grid_dim.i50, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i59 = getelementptr inbounds nuw i8, ptr %block_dim.i51, i64 8
  %14 = getelementptr inbounds nuw i8, ptr %kernel_args1.i72, i64 8
  %15 = getelementptr inbounds nuw i8, ptr %kernel_args1.i72, i64 16
  %16 = getelementptr inbounds nuw i8, ptr %kernel_args1.i72, i64 24
  %17 = getelementptr inbounds nuw i8, ptr %kernel_args1.i72, i64 32
  %18 = getelementptr inbounds nuw i8, ptr %kernel_args1.i72, i64 40
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i74 = getelementptr inbounds nuw i8, ptr %grid_dim.i68, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i77 = getelementptr inbounds nuw i8, ptr %block_dim.i69, i64 8
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %kcall.end22
  %k.094 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %kcall.end22 ]
  %call8 = call i32 @__cudaPushCallConfiguration(i64 4294967297, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool.not = icmp eq i32 %call8, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %for.body
  %19 = load ptr, ptr %A_gpu, align 8, !tbaa !51
  %20 = load ptr, ptr %R_gpu, align 8, !tbaa !51
  %21 = load ptr, ptr %Q_gpu, align 8, !tbaa !51
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %a.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %r.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %q.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %k.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %ni, ptr %ni.addr.i, align 4, !tbaa !50
  store i32 %nj, ptr %nj.addr.i, align 4, !tbaa !50
  store ptr %19, ptr %a.addr.i, align 8, !tbaa !51
  store ptr %20, ptr %r.addr.i, align 8, !tbaa !51
  store ptr %21, ptr %q.addr.i, align 8, !tbaa !51
  store i32 %k.094, ptr %k.addr.i, align 4, !tbaa !50
  store ptr %ni.addr.i, ptr %kernel_args1.i, align 16
  store ptr %nj.addr.i, ptr %4, align 8
  store ptr %a.addr.i, ptr %5, align 16
  store ptr %r.addr.i, ptr %6, align 8
  store ptr %q.addr.i, ptr %7, align 16
  store ptr %k.addr.i, ptr %8, align 8
  %22 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !60
  %23 = load i64, ptr %shmem_size.i, align 8
  %24 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z34__device_stub__gramschmidt_kernel1iiPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %23, ptr noundef %24), !inline_history !60
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %a.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %r.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %q.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %k.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %for.body
  %call9 = call i32 @cudaThreadSynchronize() #16
  %call12 = call i32 @__cudaPushCallConfiguration(i64 4294967304, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool13.not = icmp eq i32 %call12, 0
  br i1 %tobool13.not, label %kcall.configok14, label %kcall.end15

kcall.configok14:                                 ; preds = %kcall.end
  %25 = load ptr, ptr %A_gpu, align 8, !tbaa !51
  %26 = load ptr, ptr %R_gpu, align 8, !tbaa !51
  %27 = load ptr, ptr %Q_gpu, align 8, !tbaa !51
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i44)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i45)
  call void @llvm.lifetime.start.p0(ptr nonnull %a.addr.i46)
  call void @llvm.lifetime.start.p0(ptr nonnull %r.addr.i47)
  call void @llvm.lifetime.start.p0(ptr nonnull %q.addr.i48)
  call void @llvm.lifetime.start.p0(ptr nonnull %k.addr.i49)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i50)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i51)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i52)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i53)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i54)
  store i32 %ni, ptr %ni.addr.i44, align 4, !tbaa !50
  store i32 %nj, ptr %nj.addr.i45, align 4, !tbaa !50
  store ptr %25, ptr %a.addr.i46, align 8, !tbaa !51
  store ptr %26, ptr %r.addr.i47, align 8, !tbaa !51
  store ptr %27, ptr %q.addr.i48, align 8, !tbaa !51
  store i32 %k.094, ptr %k.addr.i49, align 4, !tbaa !50
  store ptr %ni.addr.i44, ptr %kernel_args1.i54, align 16
  store ptr %nj.addr.i45, ptr %9, align 8
  store ptr %a.addr.i46, ptr %10, align 16
  store ptr %r.addr.i47, ptr %11, align 8
  store ptr %q.addr.i48, ptr %12, align 16
  store ptr %k.addr.i49, ptr %13, align 8
  %28 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i50, ptr nonnull %block_dim.i51, ptr nonnull %shmem_size.i52, ptr nonnull %stream.i53), !inline_history !61
  %29 = load i64, ptr %shmem_size.i52, align 8
  %30 = load ptr, ptr %stream.i53, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i55 = load i64, ptr %grid_dim.i50, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i57 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i56, align 8
  %block_dim.coerce.sroa.0.0.copyload.i58 = load i64, ptr %block_dim.i51, align 8
  %block_dim.coerce.sroa.2.0.copyload.i60 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i59, align 8
  %call.i61 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z34__device_stub__gramschmidt_kernel2iiPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload.i55, i32 %grid_dim.coerce.sroa.2.0.copyload.i57, i64 %block_dim.coerce.sroa.0.0.copyload.i58, i32 %block_dim.coerce.sroa.2.0.copyload.i60, ptr noundef nonnull %kernel_args1.i54, i64 noundef %29, ptr noundef %30), !inline_history !61
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i44)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i45)
  call void @llvm.lifetime.end.p0(ptr nonnull %a.addr.i46)
  call void @llvm.lifetime.end.p0(ptr nonnull %r.addr.i47)
  call void @llvm.lifetime.end.p0(ptr nonnull %q.addr.i48)
  call void @llvm.lifetime.end.p0(ptr nonnull %k.addr.i49)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i50)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i51)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i52)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i53)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i54)
  br label %kcall.end15

kcall.end15:                                      ; preds = %kcall.configok14, %kcall.end
  %call16 = call i32 @cudaThreadSynchronize() #16
  %call19 = call i32 @__cudaPushCallConfiguration(i64 4294967304, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool20.not = icmp eq i32 %call19, 0
  br i1 %tobool20.not, label %kcall.configok21, label %kcall.end22

kcall.configok21:                                 ; preds = %kcall.end15
  %31 = load ptr, ptr %A_gpu, align 8, !tbaa !51
  %32 = load ptr, ptr %R_gpu, align 8, !tbaa !51
  %33 = load ptr, ptr %Q_gpu, align 8, !tbaa !51
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i62)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i63)
  call void @llvm.lifetime.start.p0(ptr nonnull %a.addr.i64)
  call void @llvm.lifetime.start.p0(ptr nonnull %r.addr.i65)
  call void @llvm.lifetime.start.p0(ptr nonnull %q.addr.i66)
  call void @llvm.lifetime.start.p0(ptr nonnull %k.addr.i67)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i68)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i69)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i70)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i71)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i72)
  store i32 %ni, ptr %ni.addr.i62, align 4, !tbaa !50
  store i32 %nj, ptr %nj.addr.i63, align 4, !tbaa !50
  store ptr %31, ptr %a.addr.i64, align 8, !tbaa !51
  store ptr %32, ptr %r.addr.i65, align 8, !tbaa !51
  store ptr %33, ptr %q.addr.i66, align 8, !tbaa !51
  store i32 %k.094, ptr %k.addr.i67, align 4, !tbaa !50
  store ptr %ni.addr.i62, ptr %kernel_args1.i72, align 16
  store ptr %nj.addr.i63, ptr %14, align 8
  store ptr %a.addr.i64, ptr %15, align 16
  store ptr %r.addr.i65, ptr %16, align 8
  store ptr %q.addr.i66, ptr %17, align 16
  store ptr %k.addr.i67, ptr %18, align 8
  %34 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i68, ptr nonnull %block_dim.i69, ptr nonnull %shmem_size.i70, ptr nonnull %stream.i71), !inline_history !62
  %35 = load i64, ptr %shmem_size.i70, align 8
  %36 = load ptr, ptr %stream.i71, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i73 = load i64, ptr %grid_dim.i68, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i75 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i74, align 8
  %block_dim.coerce.sroa.0.0.copyload.i76 = load i64, ptr %block_dim.i69, align 8
  %block_dim.coerce.sroa.2.0.copyload.i78 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i77, align 8
  %call.i79 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z34__device_stub__gramschmidt_kernel3iiPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload.i73, i32 %grid_dim.coerce.sroa.2.0.copyload.i75, i64 %block_dim.coerce.sroa.0.0.copyload.i76, i32 %block_dim.coerce.sroa.2.0.copyload.i78, ptr noundef nonnull %kernel_args1.i72, i64 noundef %35, ptr noundef %36), !inline_history !62
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i62)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i63)
  call void @llvm.lifetime.end.p0(ptr nonnull %a.addr.i64)
  call void @llvm.lifetime.end.p0(ptr nonnull %r.addr.i65)
  call void @llvm.lifetime.end.p0(ptr nonnull %q.addr.i66)
  call void @llvm.lifetime.end.p0(ptr nonnull %k.addr.i67)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i68)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i69)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i70)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i71)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i72)
  br label %kcall.end22

kcall.end22:                                      ; preds = %kcall.configok21, %kcall.end15
  %call23 = call i32 @cudaThreadSynchronize() #16
  %inc = add nuw nsw i32 %k.094, 1
  %exitcond.not = icmp eq i32 %inc, %nj
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !63

for.end:                                          ; preds = %kcall.end22, %_Z21polybench_timer_startv.exit
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i80) #17
  %call.i.i81 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i80, ptr noundef null) #15
  %cmp.not.i.i82 = icmp eq i32 %call.i.i81, 0
  br i1 %cmp.not.i.i82, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i83

if.then.i.i83:                                    ; preds = %for.end
  %call1.i.i84 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i81) #16
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %for.end, %if.then.i.i83
  %37 = load i64, ptr %Tp.i.i80, align 8, !tbaa !54
  %conv.i.i85 = sitofp i64 %37 to double
  %tv_usec.i.i86 = getelementptr inbounds nuw i8, ptr %Tp.i.i80, i64 8
  %38 = load i64, ptr %tv_usec.i.i86, align 8, !tbaa !57
  %conv2.i.i87 = sitofp i64 %38 to double
  %39 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i87, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i85)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i80) #17
  store double %39, ptr @polybench_t_end, align 8, !tbaa !58
  %40 = load double, ptr @polybench_t_start, align 8, !tbaa !58
  %sub.i = fsub double %39, %40
  %call.i88 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #16
  %41 = load ptr, ptr %A_gpu, align 8, !tbaa !51
  %call25 = call i32 @cudaMemcpy(ptr noundef %A_outputFromGpu, ptr noundef %41, i64 noundef 16777216, i32 noundef 2) #16
  %42 = load ptr, ptr %A_gpu, align 8, !tbaa !51
  %call26 = call i32 @cudaFree(ptr noundef %42) #16
  %43 = load ptr, ptr %R_gpu, align 8, !tbaa !51
  %call27 = call i32 @cudaFree(ptr noundef %43) #16
  %44 = load ptr, ptr %Q_gpu, align 8, !tbaa !51
  %call28 = call i32 @cudaFree(ptr noundef %44) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %Q_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %R_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %A_gpu) #17
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #8

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #5 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #17
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #15
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #16
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !54
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !57
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #17
  store double %2, ptr @polybench_t_start, align 8, !tbaa !58
  ret void
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #8

declare i32 @cudaThreadSynchronize() local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #5 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #17
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #15
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #16
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !54
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !57
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #17
  store double %2, ptr @polybench_t_end, align 8, !tbaa !58
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !58
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !58
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #16
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #9 {
entry:
  %Tp.i.i63 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i48 = alloca ptr, align 8
  %newA.i.i41 = alloca ptr, align 8
  %newA.i.i34 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #17
  store ptr null, ptr %newA.i.i, align 8, !tbaa !64
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 16777216) #15
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !64
  %1 = ptrtoaddr ptr %0 to i64
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %2 = load ptr, ptr @stderr, align 8, !tbaa !65
  %3 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %2) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i34) #17
  store ptr null, ptr %newA.i.i34, align 8, !tbaa !64
  %call.i.i35 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i34, i64 noundef 32, i64 noundef 16777216) #15
  %4 = load ptr, ptr %newA.i.i34, align 8, !tbaa !64
  %tobool.i.i36 = icmp eq ptr %4, null
  %tobool1.i.i37 = icmp ne i32 %call.i.i35, 0
  %or.cond.i.i38 = select i1 %tobool.i.i36, i1 true, i1 %tobool1.i.i37
  br i1 %or.cond.i.i38, label %if.then.i.i39, label %_Z20polybench_alloc_datayi.exit40

if.then.i.i39:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %5 = load ptr, ptr @stderr, align 8, !tbaa !65
  %6 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %5) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit40:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i34) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i41) #17
  store ptr null, ptr %newA.i.i41, align 8, !tbaa !64
  %call.i.i42 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i41, i64 noundef 32, i64 noundef 16777216) #15
  %7 = load ptr, ptr %newA.i.i41, align 8, !tbaa !64
  %tobool.i.i43 = icmp eq ptr %7, null
  %tobool1.i.i44 = icmp ne i32 %call.i.i42, 0
  %or.cond.i.i45 = select i1 %tobool.i.i43, i1 true, i1 %tobool1.i.i44
  br i1 %or.cond.i.i45, label %if.then.i.i46, label %_Z20polybench_alloc_datayi.exit47

if.then.i.i46:                                    ; preds = %_Z20polybench_alloc_datayi.exit40
  %8 = load ptr, ptr @stderr, align 8, !tbaa !65
  %9 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %8) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit47:                ; preds = %_Z20polybench_alloc_datayi.exit40
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i41) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i48) #17
  store ptr null, ptr %newA.i.i48, align 8, !tbaa !64
  %call.i.i49 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i48, i64 noundef 32, i64 noundef 16777216) #15
  %10 = load ptr, ptr %newA.i.i48, align 8, !tbaa !64
  %tobool.i.i50 = icmp eq ptr %10, null
  %tobool1.i.i51 = icmp ne i32 %call.i.i49, 0
  %or.cond.i.i52 = select i1 %tobool.i.i50, i1 true, i1 %tobool1.i.i51
  br i1 %or.cond.i.i52, label %if.then.i.i53, label %_Z20polybench_alloc_datayi.exit54

if.then.i.i53:                                    ; preds = %_Z20polybench_alloc_datayi.exit47
  %11 = load ptr, ptr @stderr, align 8, !tbaa !65
  %12 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %11) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit54:                ; preds = %_Z20polybench_alloc_datayi.exit47
  %13 = ptrtoaddr ptr %10 to i64
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i48) #17
  %14 = sub i64 %1, %13
  %diff.check = icmp ugt i64 %14, -16
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc17_crit_edge.i, %_Z20polybench_alloc_datayi.exit54
  %indvars.iv74.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit54 ], [ %indvars.iv.next75.i, %for.cond1.for.inc17_crit_edge.i ]
  %15 = trunc nuw nsw i64 %indvars.iv74.i to i32
  %conv.i = uitofp nneg i32 %15 to float
  %arrayidx.i = getelementptr inbounds nuw [8192 x i8], ptr %0, i64 %indvars.iv74.i
  %arrayidx14.i = getelementptr inbounds nuw [8192 x i8], ptr %10, i64 %indvars.iv74.i
  br i1 %diff.check, label %for.body3.i, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.ind78 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next79, %vector.body ]
  %16 = uitofp nneg <4 x i32> %vec.ind78 to <4 x float>
  %17 = fmul nnan <4 x float> %broadcast.splat, %16
  %18 = fmul nnan <4 x float> %17, splat (float f0x3A000000)
  %19 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  store <4 x float> %18, ptr %19, align 4, !tbaa !12
  %20 = trunc <4 x i64> %vec.ind to <4 x i32>
  %21 = add <4 x i32> %20, splat (i32 1)
  %22 = uitofp nneg <4 x i32> %21 to <4 x float>
  %23 = fmul nnan <4 x float> %broadcast.splat, %22
  %24 = fmul nnan <4 x float> %23, splat (float f0x3A000000)
  %25 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14.i, i64 %index
  store <4 x float> %24, ptr %25, align 4, !tbaa !12
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add nuw nsw <4 x i64> %vec.ind, splat (i64 4)
  %vec.ind.next79 = add <4 x i32> %vec.ind78, splat (i32 4)
  %26 = icmp eq i64 %index.next, 2048
  br i1 %26, label %for.cond1.for.inc17_crit_edge.i, label %vector.body, !llvm.loop !67

for.body3.i:                                      ; preds = %for.cond1.preheader.i, %for.body3.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i.1, %for.body3.i ], [ 0, %for.cond1.preheader.i ]
  %27 = trunc nuw nsw i64 %indvars.iv.i to i32
  %conv4.i = uitofp nneg i32 %27 to float
  %mul.i = fmul nnan float %conv.i, %conv4.i
  %div.i = fmul nnan float %mul.i, f0x3A000000
  %arrayidx7.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %indvars.iv.i
  store float %div.i, ptr %arrayidx7.i, align 4, !tbaa !12
  %indvars.iv.next.i = or disjoint i64 %indvars.iv.i, 1
  %28 = trunc nuw nsw i64 %indvars.iv.next.i to i32
  %conv9.i = uitofp nneg i32 %28 to float
  %mul10.i = fmul nnan float %conv.i, %conv9.i
  %div12.i = fmul nnan float %mul10.i, f0x3A000000
  %arrayidx16.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14.i, i64 %indvars.iv.i
  store float %div12.i, ptr %arrayidx16.i, align 4, !tbaa !12
  %29 = trunc nuw nsw i64 %indvars.iv.next.i to i32
  %conv4.i.1 = uitofp nneg i32 %29 to float
  %mul.i.1 = fmul nnan float %conv.i, %conv4.i.1
  %div.i.1 = fmul nnan float %mul.i.1, f0x3A000000
  %arrayidx7.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %indvars.iv.next.i
  store float %div.i.1, ptr %arrayidx7.i.1, align 4, !tbaa !12
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %30 = trunc nuw nsw i64 %indvars.iv.next.i.1 to i32
  %conv9.i.1 = uitofp nneg i32 %30 to float
  %mul10.i.1 = fmul nnan float %conv.i, %conv9.i.1
  %div12.i.1 = fmul nnan float %mul10.i.1, f0x3A000000
  %arrayidx16.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14.i, i64 %indvars.iv.next.i
  store float %div12.i.1, ptr %arrayidx16.i.1, align 4, !tbaa !12
  %exitcond.not.i.1 = icmp eq i64 %indvars.iv.next.i.1, 2048
  br i1 %exitcond.not.i.1, label %for.cond1.for.inc17_crit_edge.i, label %for.body3.i, !llvm.loop !68

for.cond1.for.inc17_crit_edge.i:                  ; preds = %vector.body, %for.body3.i
  %indvars.iv.next75.i = add nuw nsw i64 %indvars.iv74.i, 1
  %exitcond78.not.i = icmp eq i64 %indvars.iv.next75.i, 2048
  br i1 %exitcond78.not.i, label %for.cond23.preheader.i, label %for.cond1.preheader.i, !llvm.loop !43

for.cond23.preheader.i:                           ; preds = %for.cond1.for.inc17_crit_edge.i, %for.cond23.for.inc39_crit_edge.i
  %indvars.iv85.i = phi i64 [ %indvars.iv.next86.i, %for.cond23.for.inc39_crit_edge.i ], [ 0, %for.cond1.for.inc17_crit_edge.i ]
  %arrayidx33.i = getelementptr inbounds nuw [8192 x i8], ptr %7, i64 %indvars.iv85.i
  %31 = trunc nuw nsw i64 %indvars.iv85.i to i32
  %conv26.i = uitofp nneg i32 %31 to float
  %broadcast.splatinsert82 = insertelement <4 x float> poison, float %conv26.i, i64 0
  %broadcast.splat83 = shufflevector <4 x float> %broadcast.splatinsert82, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body84

vector.body84:                                    ; preds = %vector.body84, %for.cond23.preheader.i
  %index85 = phi i64 [ 0, %for.cond23.preheader.i ], [ %index.next87.1, %vector.body84 ]
  %vec.ind86 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond23.preheader.i ], [ %vec.ind.next88.1, %vector.body84 ]
  %32 = add <4 x i32> %vec.ind86, splat (i32 2)
  %33 = add <4 x i32> %vec.ind86, splat (i32 6)
  %34 = uitofp nneg <4 x i32> %32 to <4 x float>
  %35 = uitofp nneg <4 x i32> %33 to <4 x float>
  %36 = fmul nnan <4 x float> %broadcast.splat83, %34
  %37 = fmul nnan <4 x float> %broadcast.splat83, %35
  %38 = fmul nnan <4 x float> %36, splat (float f0x3A000000)
  %39 = fmul nnan <4 x float> %37, splat (float f0x3A000000)
  %40 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx33.i, i64 %index85
  %41 = getelementptr inbounds nuw i8, ptr %40, i64 16
  store <4 x float> %38, ptr %40, align 4, !tbaa !12
  store <4 x float> %39, ptr %41, align 4, !tbaa !12
  %42 = add <4 x i32> %vec.ind86, splat (i32 10)
  %43 = add <4 x i32> %vec.ind86, splat (i32 14)
  %44 = uitofp nneg <4 x i32> %42 to <4 x float>
  %45 = uitofp nneg <4 x i32> %43 to <4 x float>
  %46 = fmul nnan <4 x float> %broadcast.splat83, %44
  %47 = fmul nnan <4 x float> %broadcast.splat83, %45
  %48 = fmul nnan <4 x float> %46, splat (float f0x3A000000)
  %49 = fmul nnan <4 x float> %47, splat (float f0x3A000000)
  %50 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx33.i, i64 %index85
  %51 = getelementptr inbounds nuw i8, ptr %50, i64 32
  %52 = getelementptr inbounds nuw i8, ptr %50, i64 48
  store <4 x float> %48, ptr %51, align 4, !tbaa !12
  store <4 x float> %49, ptr %52, align 4, !tbaa !12
  %index.next87.1 = add nuw nsw i64 %index85, 16
  %vec.ind.next88.1 = add <4 x i32> %vec.ind86, splat (i32 16)
  %53 = icmp eq i64 %index.next87.1, 2048
  br i1 %53, label %for.cond23.for.inc39_crit_edge.i, label %vector.body84, !llvm.loop !69

for.cond23.for.inc39_crit_edge.i:                 ; preds = %vector.body84
  %indvars.iv.next86.i = add nuw nsw i64 %indvars.iv85.i, 1
  %exitcond89.not.i = icmp eq i64 %indvars.iv.next86.i, 2048
  br i1 %exitcond89.not.i, label %_Z10init_arrayiiPA2048_fS0_S0_.exit, label %for.cond23.preheader.i, !llvm.loop !46

_Z10init_arrayiiPA2048_fS0_S0_.exit:              ; preds = %for.cond23.for.inc39_crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #17
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #16
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #16
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #17
  call void @_Z15gramschmidtCudaiiPA2048_fS0_S0_S0_(i32 noundef 2048, i32 noundef 2048, ptr noundef nonnull %0, ptr nonnull poison, ptr nonnull poison, ptr noundef nonnull %4) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #17
  %call.i.i55 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #15
  %cmp.not.i.i = icmp eq i32 %call.i.i55, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i56

if.then.i.i56:                                    ; preds = %_Z10init_arrayiiPA2048_fS0_S0_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i55) #16
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiiPA2048_fS0_S0_.exit, %if.then.i.i56
  %54 = load i64, ptr %Tp.i.i, align 8, !tbaa !54
  %conv.i.i = sitofp i64 %54 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %55 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !57
  %conv2.i.i = sitofp i64 %55 to double
  %56 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #17
  store double %56, ptr @polybench_t_start, align 8, !tbaa !58
  %scevgep91 = getelementptr i8, ptr %0, i64 16777216
  %scevgep108 = getelementptr i8, ptr %10, i64 16777216
  %57 = insertelement <2 x ptr> poison, ptr %0, i64 0
  %58 = insertelement <2 x ptr> %57, ptr %7, i64 1
  %59 = getelementptr i8, <2 x ptr> %58, i64 16777216
  %60 = insertelement <2 x ptr> poison, ptr %10, i64 0
  %61 = shufflevector <2 x ptr> %60, <2 x ptr> poison, <2 x i32> zeroinitializer
  %62 = insertelement <2 x ptr> poison, ptr %scevgep108, i64 0
  %63 = shufflevector <2 x ptr> %62, <2 x ptr> poison, <2 x i32> zeroinitializer
  %64 = icmp ult <2 x ptr> %61, %59
  %65 = icmp ult <2 x ptr> %58, %63
  %66 = and <2 x i1> %64, %65
  %67 = bitcast <2 x i1> %66 to i2
  %conflict.rdx116.not = icmp eq i2 %67, 0
  br label %for.cond1.preheader.i57

for.cond.loopexit.i:                              ; preds = %for.inc80.i, %for.end32.i
  %indvars.iv.next182.i = add nuw nsw i64 %indvars.iv181.i, 1
  %exitcond192.not.i = icmp eq i64 %indvars.iv.next189.i, 2048
  br i1 %exitcond192.not.i, label %_Z11gramschmidtiiPA2048_fS0_S0_.exit, label %for.cond1.preheader.i57, !llvm.loop !10

for.cond1.preheader.i57:                          ; preds = %for.cond.loopexit.i, %_Z21polybench_timer_startv.exit
  %indvars.iv188.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next189.i, %for.cond.loopexit.i ]
  %indvars.iv181.i = phi i64 [ 1, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next182.i, %for.cond.loopexit.i ]
  %68 = shl nuw nsw i64 %indvars.iv188.i, 2
  %69 = getelementptr i8, ptr %0, i64 %68
  %scevgep = getelementptr i8, ptr %69, i64 4
  %scevgep92 = getelementptr i8, ptr %10, i64 %68
  %70 = getelementptr i8, ptr %10, i64 %68
  %scevgep93 = getelementptr i8, ptr %70, i64 16769028
  %71 = mul nuw nsw i64 %indvars.iv188.i, 8196
  %72 = getelementptr i8, ptr %7, i64 %71
  %scevgep94 = getelementptr i8, ptr %72, i64 4
  %73 = shl nuw nsw i64 %indvars.iv188.i, 13
  %74 = getelementptr i8, ptr %7, i64 %73
  %scevgep95 = getelementptr i8, ptr %74, i64 8192
  %invariant.gep.i = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv188.i
  br label %for.body3.i58

for.body3.i58:                                    ; preds = %for.body3.i58, %for.cond1.preheader.i57
  %indvars.iv.i59 = phi i64 [ 0, %for.cond1.preheader.i57 ], [ %indvars.iv.next.i60.3, %for.body3.i58 ]
  %nrm.0142.i = phi float [ 0.000000e+00, %for.cond1.preheader.i57 ], [ %85, %for.body3.i58 ]
  %gep.i = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.i, i64 %indvars.iv.i59
  %75 = load float, ptr %gep.i, align 4, !tbaa !12
  %76 = call float @llvm.fmuladd.f32(float %75, float %75, float %nrm.0142.i)
  %77 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.i, i64 %indvars.iv.i59
  %gep.i.1 = getelementptr inbounds nuw i8, ptr %77, i64 8192
  %78 = load float, ptr %gep.i.1, align 4, !tbaa !12
  %79 = call float @llvm.fmuladd.f32(float %78, float %78, float %76)
  %80 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.i, i64 %indvars.iv.i59
  %gep.i.2 = getelementptr inbounds nuw i8, ptr %80, i64 16384
  %81 = load float, ptr %gep.i.2, align 4, !tbaa !12
  %82 = call float @llvm.fmuladd.f32(float %81, float %81, float %79)
  %83 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.i, i64 %indvars.iv.i59
  %gep.i.3 = getelementptr inbounds nuw i8, ptr %83, i64 24576
  %84 = load float, ptr %gep.i.3, align 4, !tbaa !12
  %85 = call float @llvm.fmuladd.f32(float %84, float %84, float %82)
  %indvars.iv.next.i60.3 = add nuw nsw i64 %indvars.iv.i59, 4
  %exitcond.not.i61.3 = icmp eq i64 %indvars.iv.next.i60.3, 2048
  br i1 %exitcond.not.i61.3, label %for.body17.preheader.i, label %for.body3.i58, !llvm.loop !14

for.body17.preheader.i:                           ; preds = %for.body3.i58
  %sqrtf194.i = call float @sqrtf(float noundef %85) #15
  %arrayidx12195.i = getelementptr inbounds nuw [8192 x i8], ptr %7, i64 %indvars.iv188.i
  %arrayidx14196.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12195.i, i64 %indvars.iv188.i
  store float %sqrtf194.i, ptr %arrayidx14196.i, align 4, !tbaa !12
  %invariant.gep145198.i = getelementptr inbounds nuw [4 x i8], ptr %10, i64 %indvars.iv188.i
  br i1 %conflict.rdx116.not, label %vector.ph118, label %for.body17.i

vector.ph118:                                     ; preds = %for.body17.preheader.i
  %86 = load float, ptr %arrayidx14196.i, align 4, !tbaa !12, !alias.scope !70
  %broadcast.splatinsert121 = insertelement <4 x float> poison, float %86, i64 0
  %broadcast.splat122 = shufflevector <4 x float> %broadcast.splatinsert121, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body119

vector.body119:                                   ; preds = %vector.body119, %vector.ph118
  %index120 = phi i64 [ 0, %vector.ph118 ], [ %index.next123, %vector.body119 ]
  %87 = or disjoint i64 %index120, 1
  %88 = or disjoint i64 %index120, 2
  %89 = or disjoint i64 %index120, 3
  %90 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.i, i64 %index120
  %91 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.i, i64 %87
  %92 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.i, i64 %88
  %93 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.i, i64 %89
  %94 = load float, ptr %90, align 4, !tbaa !12, !alias.scope !73
  %95 = load float, ptr %91, align 4, !tbaa !12, !alias.scope !73
  %96 = load float, ptr %92, align 4, !tbaa !12, !alias.scope !73
  %97 = load float, ptr %93, align 4, !tbaa !12, !alias.scope !73
  %98 = insertelement <4 x float> poison, float %94, i64 0
  %99 = insertelement <4 x float> %98, float %95, i64 1
  %100 = insertelement <4 x float> %99, float %96, i64 2
  %101 = insertelement <4 x float> %100, float %97, i64 3
  %102 = fdiv <4 x float> %101, %broadcast.splat122
  %103 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %index120
  %104 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %87
  %105 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %88
  %106 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %89
  %107 = extractelement <4 x float> %102, i64 0
  store float %107, ptr %103, align 4, !tbaa !12, !alias.scope !75, !noalias !77
  %108 = extractelement <4 x float> %102, i64 1
  store float %108, ptr %104, align 4, !tbaa !12, !alias.scope !75, !noalias !77
  %109 = extractelement <4 x float> %102, i64 2
  store float %109, ptr %105, align 4, !tbaa !12, !alias.scope !75, !noalias !77
  %110 = extractelement <4 x float> %102, i64 3
  store float %110, ptr %106, align 4, !tbaa !12, !alias.scope !75, !noalias !77
  %index.next123 = add nuw i64 %index120, 4
  %111 = icmp eq i64 %index.next123, 2048
  br i1 %111, label %for.end32.i, label %vector.body119, !llvm.loop !78

for.body17.i:                                     ; preds = %for.body17.preheader.i, %for.body17.i
  %indvars.iv166.i = phi i64 [ %indvars.iv.next167.i.1, %for.body17.i ], [ 0, %for.body17.preheader.i ]
  %gep144.i = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.i, i64 %indvars.iv166.i
  %112 = load float, ptr %gep144.i, align 4, !tbaa !12
  %113 = load float, ptr %arrayidx14196.i, align 4, !tbaa !12
  %div.i62 = fdiv float %112, %113
  %gep146.i = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %indvars.iv166.i
  store float %div.i62, ptr %gep146.i, align 4, !tbaa !12
  %indvars.iv.next167.i = or disjoint i64 %indvars.iv166.i, 1
  %gep144.i.1 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep.i, i64 %indvars.iv.next167.i
  %114 = load float, ptr %gep144.i.1, align 4, !tbaa !12
  %115 = load float, ptr %arrayidx14196.i, align 4, !tbaa !12
  %div.i62.1 = fdiv float %114, %115
  %gep146.i.1 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %indvars.iv.next167.i
  store float %div.i62.1, ptr %gep146.i.1, align 4, !tbaa !12
  %indvars.iv.next167.i.1 = add nuw nsw i64 %indvars.iv166.i, 2
  %exitcond170.not.i.1 = icmp eq i64 %indvars.iv.next167.i.1, 2048
  br i1 %exitcond170.not.i.1, label %for.end32.i, label %for.body17.i, !llvm.loop !79

for.end32.i:                                      ; preds = %vector.body119, %for.body17.i
  %indvars.iv.next189.i = add nuw nsw i64 %indvars.iv188.i, 1
  %cmp34161.i = icmp samesign ult i64 %indvars.iv188.i, 2047
  br i1 %cmp34161.i, label %for.body35.i.preheader, label %for.cond.loopexit.i

for.body35.i.preheader:                           ; preds = %for.end32.i
  %bound0 = icmp ult ptr %scevgep, %scevgep93
  %bound1 = icmp ult ptr %scevgep92, %scevgep91
  %found.conflict = and i1 %bound0, %bound1
  %bound096 = icmp ult ptr %scevgep, %scevgep95
  %bound197 = icmp ult ptr %scevgep94, %scevgep91
  %found.conflict98 = and i1 %bound096, %bound197
  %conflict.rdx = or i1 %found.conflict, %found.conflict98
  br label %for.body35.i

for.body35.i:                                     ; preds = %for.body35.i.preheader, %for.inc80.i
  %indvars.iv183.i = phi i64 [ %indvars.iv.next184.i, %for.inc80.i ], [ %indvars.iv181.i, %for.body35.i.preheader ]
  %arrayidx39.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12195.i, i64 %indvars.iv183.i
  store float 0.000000e+00, ptr %arrayidx39.i, align 4, !tbaa !12
  %invariant.gep151.i = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv183.i
  br label %for.body42.i

for.body42.i:                                     ; preds = %for.body42.i, %for.body35.i
  %indvars.iv171.i = phi i64 [ 0, %for.body35.i ], [ %indvars.iv.next172.i.1, %for.body42.i ]
  %116 = phi float [ 0.000000e+00, %for.body35.i ], [ %122, %for.body42.i ]
  %gep150.i = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %indvars.iv171.i
  %117 = load float, ptr %gep150.i, align 4, !tbaa !12
  %gep152.i = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151.i, i64 %indvars.iv171.i
  %118 = load float, ptr %gep152.i, align 4, !tbaa !12
  %119 = call float @llvm.fmuladd.f32(float %117, float %118, float %116)
  store float %119, ptr %arrayidx39.i, align 4, !tbaa !12
  %indvars.iv.next172.i = or disjoint i64 %indvars.iv171.i, 1
  %gep150.i.1 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %indvars.iv.next172.i
  %120 = load float, ptr %gep150.i.1, align 4, !tbaa !12
  %gep152.i.1 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151.i, i64 %indvars.iv.next172.i
  %121 = load float, ptr %gep152.i.1, align 4, !tbaa !12
  %122 = call float @llvm.fmuladd.f32(float %120, float %121, float %119)
  store float %122, ptr %arrayidx39.i, align 4, !tbaa !12
  %indvars.iv.next172.i.1 = add nuw nsw i64 %indvars.iv171.i, 2
  %exitcond175.not.i.1 = icmp eq i64 %indvars.iv.next172.i.1, 2048
  br i1 %exitcond175.not.i.1, label %vector.memcheck90, label %for.body42.i, !llvm.loop !29

vector.memcheck90:                                ; preds = %for.body42.i
  br i1 %conflict.rdx, label %for.body60.i, label %vector.ph100

vector.ph100:                                     ; preds = %vector.memcheck90
  %123 = load float, ptr %arrayidx39.i, align 4, !tbaa !12, !alias.scope !80
  %broadcast.splatinsert103 = insertelement <4 x float> poison, float %123, i64 0
  %broadcast.splat104 = shufflevector <4 x float> %broadcast.splatinsert103, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body101

vector.body101:                                   ; preds = %vector.body101, %vector.ph100
  %index102 = phi i64 [ 0, %vector.ph100 ], [ %index.next105, %vector.body101 ]
  %124 = or disjoint i64 %index102, 1
  %125 = or disjoint i64 %index102, 2
  %126 = or disjoint i64 %index102, 3
  %127 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151.i, i64 %index102
  %128 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151.i, i64 %124
  %129 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151.i, i64 %125
  %130 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151.i, i64 %126
  %131 = load float, ptr %127, align 4, !tbaa !12, !alias.scope !83, !noalias !85
  %132 = load float, ptr %128, align 4, !tbaa !12, !alias.scope !83, !noalias !85
  %133 = load float, ptr %129, align 4, !tbaa !12, !alias.scope !83, !noalias !85
  %134 = load float, ptr %130, align 4, !tbaa !12, !alias.scope !83, !noalias !85
  %135 = insertelement <4 x float> poison, float %131, i64 0
  %136 = insertelement <4 x float> %135, float %132, i64 1
  %137 = insertelement <4 x float> %136, float %133, i64 2
  %138 = insertelement <4 x float> %137, float %134, i64 3
  %139 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %index102
  %140 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %124
  %141 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %125
  %142 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %126
  %143 = load float, ptr %139, align 4, !tbaa !12, !alias.scope !87
  %144 = load float, ptr %140, align 4, !tbaa !12, !alias.scope !87
  %145 = load float, ptr %141, align 4, !tbaa !12, !alias.scope !87
  %146 = load float, ptr %142, align 4, !tbaa !12, !alias.scope !87
  %147 = insertelement <4 x float> poison, float %143, i64 0
  %148 = insertelement <4 x float> %147, float %144, i64 1
  %149 = insertelement <4 x float> %148, float %145, i64 2
  %150 = insertelement <4 x float> %149, float %146, i64 3
  %151 = fneg <4 x float> %150
  %152 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %151, <4 x float> %broadcast.splat104, <4 x float> %138)
  %153 = extractelement <4 x float> %152, i64 0
  store float %153, ptr %127, align 4, !tbaa !12, !alias.scope !83, !noalias !85
  %154 = extractelement <4 x float> %152, i64 1
  store float %154, ptr %128, align 4, !tbaa !12, !alias.scope !83, !noalias !85
  %155 = extractelement <4 x float> %152, i64 2
  store float %155, ptr %129, align 4, !tbaa !12, !alias.scope !83, !noalias !85
  %156 = extractelement <4 x float> %152, i64 3
  store float %156, ptr %130, align 4, !tbaa !12, !alias.scope !83, !noalias !85
  %index.next105 = add nuw i64 %index102, 4
  %157 = icmp eq i64 %index.next105, 2048
  br i1 %157, label %for.inc80.i, label %vector.body101, !llvm.loop !88

for.body60.i:                                     ; preds = %vector.memcheck90, %for.body60.i
  %indvars.iv176.i = phi i64 [ %indvars.iv.next177.i.1, %for.body60.i ], [ 0, %vector.memcheck90 ]
  %gep156.i = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151.i, i64 %indvars.iv176.i
  %158 = load float, ptr %gep156.i, align 4, !tbaa !12
  %gep158.i = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %indvars.iv176.i
  %159 = load float, ptr %gep158.i, align 4, !tbaa !12
  %160 = load float, ptr %arrayidx39.i, align 4, !tbaa !12
  %neg.i = fneg float %159
  %161 = call float @llvm.fmuladd.f32(float %neg.i, float %160, float %158)
  store float %161, ptr %gep156.i, align 4, !tbaa !12
  %indvars.iv.next177.i = or disjoint i64 %indvars.iv176.i, 1
  %gep156.i.1 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep151.i, i64 %indvars.iv.next177.i
  %162 = load float, ptr %gep156.i.1, align 4, !tbaa !12
  %gep158.i.1 = getelementptr inbounds nuw [8192 x i8], ptr %invariant.gep145198.i, i64 %indvars.iv.next177.i
  %163 = load float, ptr %gep158.i.1, align 4, !tbaa !12
  %164 = load float, ptr %arrayidx39.i, align 4, !tbaa !12
  %neg.i.1 = fneg float %163
  %165 = call float @llvm.fmuladd.f32(float %neg.i.1, float %164, float %162)
  store float %165, ptr %gep156.i.1, align 4, !tbaa !12
  %indvars.iv.next177.i.1 = add nuw nsw i64 %indvars.iv176.i, 2
  %exitcond180.not.i.1 = icmp eq i64 %indvars.iv.next177.i.1, 2048
  br i1 %exitcond180.not.i.1, label %for.inc80.i, label %for.body60.i, !llvm.loop !89

for.inc80.i:                                      ; preds = %vector.body101, %for.body60.i
  %indvars.iv.next184.i = add nuw nsw i64 %indvars.iv183.i, 1
  %exitcond187.not.i = icmp eq i64 %indvars.iv.next184.i, 2048
  br i1 %exitcond187.not.i, label %for.cond.loopexit.i, label %for.body35.i, !llvm.loop !40

_Z11gramschmidtiiPA2048_fS0_S0_.exit:             ; preds = %for.cond.loopexit.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i63) #17
  %call.i.i64 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i63, ptr noundef null) #15
  %cmp.not.i.i65 = icmp eq i32 %call.i.i64, 0
  br i1 %cmp.not.i.i65, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i66

if.then.i.i66:                                    ; preds = %_Z11gramschmidtiiPA2048_fS0_S0_.exit
  %call1.i.i67 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i64) #16
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z11gramschmidtiiPA2048_fS0_S0_.exit, %if.then.i.i66
  %166 = load i64, ptr %Tp.i.i63, align 8, !tbaa !54
  %conv.i.i68 = sitofp i64 %166 to double
  %tv_usec.i.i69 = getelementptr inbounds nuw i8, ptr %Tp.i.i63, i64 8
  %167 = load i64, ptr %tv_usec.i.i69, align 8, !tbaa !57
  %conv2.i.i70 = sitofp i64 %167 to double
  %168 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i70, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i68)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i63) #17
  store double %168, ptr @polybench_t_end, align 8, !tbaa !58
  %169 = load double, ptr @polybench_t_start, align 8, !tbaa !58
  %sub.i = fsub double %168, %169
  %call.i71 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #16
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc14_crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv34.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next35.i, %for.cond1.for.inc14_crit_edge.us.i ]
  %fail.030.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %204, %for.cond1.for.inc14_crit_edge.us.i ]
  %arrayidx.us.i = getelementptr inbounds nuw [8192 x i8], ptr %0, i64 %indvars.iv34.i
  %arrayidx7.us.i = getelementptr inbounds nuw [8192 x i8], ptr %4, i64 %indvars.iv34.i
  %170 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.030.us.i, i64 0
  br label %vector.body127

vector.body127:                                   ; preds = %vector.body127, %for.cond1.preheader.us.i
  %index128 = phi i64 [ 0, %for.cond1.preheader.us.i ], [ %index.next130, %vector.body127 ]
  %vec.phi = phi <4 x i32> [ %170, %for.cond1.preheader.us.i ], [ %202, %vector.body127 ]
  %171 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i, i64 %index128
  %wide.load = load <4 x float>, ptr %171, align 4, !tbaa !12
  %172 = fpext <4 x float> %wide.load to <4 x double>
  %173 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us.i, i64 %index128
  %wide.load129 = load <4 x float>, ptr %173, align 4, !tbaa !12
  %174 = fpext <4 x float> %wide.load129 to <4 x double>
  %175 = fcmp olt <4 x double> %172, splat (double f0xB690000000000000)
  %176 = fneg <4 x float> %wide.load
  %177 = select <4 x i1> %175, <4 x float> %176, <4 x float> %wide.load
  %178 = fpext <4 x float> %177 to <4 x double>
  %179 = fcmp uge <4 x double> %178, splat (double 1.000000e-02)
  %180 = fcmp olt <4 x double> %174, splat (double f0xB690000000000000)
  %181 = fneg <4 x float> %wide.load129
  %182 = select <4 x i1> %180, <4 x float> %181, <4 x float> %wide.load129
  %183 = fpext <4 x float> %182 to <4 x double>
  %184 = fcmp uge <4 x double> %183, splat (double 1.000000e-02)
  %185 = fsub <4 x double> %172, %174
  %186 = fptrunc <4 x double> %185 to <4 x float>
  %187 = fcmp olt <4 x double> %185, splat (double f0xB690000000000000)
  %188 = fneg <4 x float> %186
  %189 = select <4 x i1> %187, <4 x float> %188, <4 x float> %186
  %190 = fadd <4 x double> %172, splat (double f0x3E45798EE0000000)
  %191 = fptrunc <4 x double> %190 to <4 x float>
  %192 = fcmp olt <4 x double> %190, splat (double f0xB690000000000000)
  %193 = fneg <4 x float> %191
  %194 = select <4 x i1> %192, <4 x float> %193, <4 x float> %191
  %195 = fdiv <4 x float> %189, %194
  %196 = fcmp olt <4 x float> %195, zeroinitializer
  %197 = fneg <4 x float> %195
  %198 = select <4 x i1> %196, <4 x float> %197, <4 x float> %195
  %199 = fmul <4 x float> %198, splat (float 1.000000e+02)
  %200 = fpext <4 x float> %199 to <4 x double>
  %201 = fcmp ogt <4 x double> %200, splat (double 5.000000e-02)
  %.not133 = select <4 x i1> %179, <4 x i1> splat (i1 true), <4 x i1> %184
  %narrow = select <4 x i1> %.not133, <4 x i1> %201, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %202 = add <4 x i32> %vec.phi, %predphi
  %index.next130 = add nuw i64 %index128, 4
  %203 = icmp eq i64 %index.next130, 2048
  br i1 %203, label %for.cond1.for.inc14_crit_edge.us.i, label %vector.body127, !llvm.loop !90

for.cond1.for.inc14_crit_edge.us.i:               ; preds = %vector.body127
  %204 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %202)
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond38.not.i = icmp eq i64 %indvars.iv.next35.i, 2048
  br i1 %exitcond38.not.i, label %_Z14compareResultsiiPA2048_fS0_.exit, label %for.cond1.preheader.us.i, !llvm.loop !49

_Z14compareResultsiiPA2048_fS0_.exit:             ; preds = %for.cond1.for.inc14_crit_edge.us.i
  %call17.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %204) #16
  call void @free(ptr noundef nonnull %0) #15
  call void @free(ptr noundef nonnull %4) #15
  call void @free(ptr noundef %7) #15
  call void @free(ptr noundef %10) #15
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #17
  store ptr null, ptr %newA.i, align 8, !tbaa !64
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #15
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !64
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !65
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #18
  call void @exit(i32 noundef 1) #19
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
declare double @llvm.fmuladd.f64(double, double, double) #3

; Function Attrs: nofree nounwind
declare i32 @posix_memalign(ptr noundef, i64 noundef, i64 noundef) local_unnamed_addr #6

; Function Attrs: nofree noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #11

declare float @sqrtf(float) local_unnamed_addr

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #12

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #13

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #14

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #13

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { mustprogress nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
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
attributes #14 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #15 = { nounwind "uniform-work-group-size" }
attributes #16 = { "uniform-work-group-size" }
attributes #17 = { nounwind }
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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !8, i64 0}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = !{!23}
!23 = distinct !{!23, !19}
!24 = !{!21, !18}
!25 = distinct !{!25, !11, !26, !27}
!26 = !{!"llvm.loop.isvectorized", i32 1}
!27 = !{!"llvm.loop.unroll.runtime.disable"}
!28 = distinct !{!28, !11, !26}
!29 = distinct !{!29, !11}
!30 = !{!31}
!31 = distinct !{!31, !32}
!32 = distinct !{!32, !"LVerDomain"}
!33 = !{!34}
!34 = distinct !{!34, !32}
!35 = !{!36, !31}
!36 = distinct !{!36, !32}
!37 = !{!36}
!38 = distinct !{!38, !11, !26, !27}
!39 = distinct !{!39, !11, !26}
!40 = distinct !{!40, !11}
!41 = distinct !{!41, !11, !26, !27}
!42 = distinct !{!42, !11, !26}
!43 = distinct !{!43, !11}
!44 = distinct !{!44, !11, !26, !27}
!45 = distinct !{!45, !11, !27, !26}
!46 = distinct !{!46, !11}
!47 = distinct !{!47, !11, !26, !27}
!48 = distinct !{!48, !11, !27, !26}
!49 = distinct !{!49, !11}
!50 = !{!7, !7, i64 0}
!51 = !{!52, !52, i64 0}
!52 = !{!"p1 float", !53, i64 0}
!53 = !{!"any pointer", !8, i64 0}
!54 = !{!55, !56, i64 0}
!55 = !{!"_ZTS7timeval", !56, i64 0, !56, i64 8}
!56 = !{!"long", !8, i64 0}
!57 = !{!55, !56, i64 8}
!58 = !{!59, !59, i64 0}
!59 = !{!"double", !8, i64 0}
!60 = !{ptr @_Z34__device_stub__gramschmidt_kernel1iiPfS_S_i}
!61 = !{ptr @_Z34__device_stub__gramschmidt_kernel2iiPfS_S_i}
!62 = !{ptr @_Z34__device_stub__gramschmidt_kernel3iiPfS_S_i}
!63 = distinct !{!63, !11}
!64 = !{!53, !53, i64 0}
!65 = !{!66, !66, i64 0}
!66 = !{!"p1 _ZTS8_IO_FILE", !53, i64 0}
!67 = distinct !{!67, !11, !26, !27}
!68 = distinct !{!68, !11, !26}
!69 = distinct !{!69, !11, !26, !27}
!70 = !{!71}
!71 = distinct !{!71, !72}
!72 = distinct !{!72, !"LVerDomain"}
!73 = !{!74}
!74 = distinct !{!74, !72}
!75 = !{!76}
!76 = distinct !{!76, !72}
!77 = !{!74, !71}
!78 = distinct !{!78, !11, !26, !27}
!79 = distinct !{!79, !11, !26}
!80 = !{!81}
!81 = distinct !{!81, !82}
!82 = distinct !{!82, !"LVerDomain"}
!83 = !{!84}
!84 = distinct !{!84, !82}
!85 = !{!86, !81}
!86 = distinct !{!86, !82}
!87 = !{!86}
!88 = distinct !{!88, !11, !26, !27}
!89 = distinct !{!89, !11, !26}
!90 = distinct !{!90, !11, !26, !27}
