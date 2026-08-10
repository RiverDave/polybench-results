; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GEMVER/gemver.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GEMVER/gemver.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cudaDeviceProp = type { [256 x i8], %struct.CUuuid_st, [8 x i8], i32, i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [63 x i32] }
%struct.CUuuid_st = type { [16 x i8] }
%struct.dim3 = type { i32, i32, i32 }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [22 x i8] c"Number of misses: %d\0A\00", align 1
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
define dso_local void @_Z6gemveriffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr nofree noundef captures(none) %A, ptr nofree noundef readonly captures(none) %u1, ptr nofree noundef readonly captures(none) %v1, ptr nofree noundef readonly captures(none) %u2, ptr nofree noundef readonly captures(none) %v2, ptr nofree noundef captures(none) %w, ptr nofree noundef captures(none) %x, ptr nofree noundef readonly captures(none) %y, ptr nofree noundef readonly captures(none) %z) local_unnamed_addr #1 {
entry:
  %cmp129 = icmp sgt i32 %n, 0
  br i1 %cmp129, label %for.cond1.preheader.preheader, label %for.end79

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count145 = zext nneg i32 %n to i64
  %0 = mul nuw nsw i64 %wide.trip.count145, 16388
  %1 = getelementptr i8, ptr %A, i64 %0
  %scevgep = getelementptr i8, ptr %1, i64 -16384
  %2 = shl nuw nsw i64 %wide.trip.count145, 2
  %scevgep172 = getelementptr i8, ptr %u1, i64 %2
  %scevgep173 = getelementptr i8, ptr %v1, i64 %2
  %scevgep174 = getelementptr i8, ptr %u2, i64 %2
  %scevgep175 = getelementptr i8, ptr %v2, i64 %2
  %3 = insertelement <4 x ptr> poison, ptr %A, i64 0
  %4 = shufflevector <4 x ptr> %3, <4 x ptr> poison, <4 x i32> zeroinitializer
  %5 = insertelement <4 x ptr> poison, ptr %scevgep172, i64 0
  %6 = insertelement <4 x ptr> %5, ptr %scevgep173, i64 1
  %7 = insertelement <4 x ptr> %6, ptr %scevgep174, i64 2
  %8 = insertelement <4 x ptr> %7, ptr %scevgep175, i64 3
  %9 = insertelement <4 x ptr> poison, ptr %u1, i64 0
  %10 = insertelement <4 x ptr> %9, ptr %v1, i64 1
  %11 = insertelement <4 x ptr> %10, ptr %u2, i64 2
  %12 = insertelement <4 x ptr> %11, ptr %v2, i64 3
  %13 = insertelement <4 x ptr> poison, ptr %scevgep, i64 0
  %14 = shufflevector <4 x ptr> %13, <4 x ptr> poison, <4 x i32> zeroinitializer
  %15 = add nsw i64 %wide.trip.count145, -1
  %min.iters.check = icmp ult i32 %n, 8
  %16 = icmp ult <4 x ptr> %4, %8
  %17 = icmp ult <4 x ptr> %12, %14
  %18 = and <4 x i1> %16, %17
  %19 = bitcast <4 x i1> %18 to i4
  %.not = icmp eq i4 %19, 0
  %n.vec = and i64 %wide.trip.count145, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count145
  %xtraiter = and i64 %wide.trip.count145, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc18_crit_edge
  %indvars.iv142 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next143, %for.cond1.for.inc18_crit_edge ]
  %arrayidx = getelementptr inbounds nuw [16384 x i8], ptr %A, i64 %indvars.iv142
  %arrayidx7 = getelementptr inbounds nuw [4 x i8], ptr %u1, i64 %indvars.iv142
  %arrayidx11 = getelementptr inbounds nuw [4 x i8], ptr %u2, i64 %indvars.iv142
  %.not.not = xor i1 %.not, true
  %brmerge = select i1 %min.iters.check, i1 true, i1 %.not.not
  br i1 %brmerge, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader
  %20 = load float, ptr %arrayidx7, align 4, !tbaa !10, !alias.scope !12
  %broadcast.splatinsert = insertelement <4 x float> poison, float %20, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %21 = load float, ptr %arrayidx11, align 4, !tbaa !10, !alias.scope !15
  %broadcast.splatinsert192 = insertelement <4 x float> poison, float %21, i64 0
  %broadcast.splat193 = shufflevector <4 x float> %broadcast.splatinsert192, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %22 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 16
  %wide.load = load <4 x float>, ptr %22, align 4, !tbaa !10, !alias.scope !17, !noalias !19
  %wide.load187 = load <4 x float>, ptr %23, align 4, !tbaa !10, !alias.scope !17, !noalias !19
  %24 = getelementptr inbounds nuw [4 x i8], ptr %v1, i64 %index
  %25 = getelementptr inbounds nuw i8, ptr %24, i64 16
  %wide.load188 = load <4 x float>, ptr %24, align 4, !tbaa !10, !alias.scope !22
  %wide.load189 = load <4 x float>, ptr %25, align 4, !tbaa !10, !alias.scope !22
  %26 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %wide.load188, <4 x float> %wide.load)
  %27 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %wide.load189, <4 x float> %wide.load187)
  %28 = getelementptr inbounds nuw [4 x i8], ptr %v2, i64 %index
  %29 = getelementptr inbounds nuw i8, ptr %28, i64 16
  %wide.load190 = load <4 x float>, ptr %28, align 4, !tbaa !10, !alias.scope !23
  %wide.load191 = load <4 x float>, ptr %29, align 4, !tbaa !10, !alias.scope !23
  %30 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat193, <4 x float> %wide.load190, <4 x float> %26)
  %31 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat193, <4 x float> %wide.load191, <4 x float> %27)
  store <4 x float> %30, ptr %22, align 4, !tbaa !10, !alias.scope !17, !noalias !19
  store <4 x float> %31, ptr %23, align 4, !tbaa !10, !alias.scope !17, !noalias !19
  %index.next = add nuw i64 %index, 8
  %32 = icmp eq i64 %index.next, %n.vec
  br i1 %32, label %middle.block, label %vector.body, !llvm.loop !24

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc18_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %for.cond1.preheader ]
  br i1 %lcmp.mod.not, label %for.body3.prol.loopexit, label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.preheader
  %arrayidx5.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv.ph
  %33 = load float, ptr %arrayidx5.prol, align 4, !tbaa !10
  %34 = load float, ptr %arrayidx7, align 4, !tbaa !10
  %arrayidx9.prol = getelementptr inbounds nuw [4 x i8], ptr %v1, i64 %indvars.iv.ph
  %35 = load float, ptr %arrayidx9.prol, align 4, !tbaa !10
  %36 = tail call float @llvm.fmuladd.f32(float %34, float %35, float %33)
  %37 = load float, ptr %arrayidx11, align 4, !tbaa !10
  %arrayidx13.prol = getelementptr inbounds nuw [4 x i8], ptr %v2, i64 %indvars.iv.ph
  %38 = load float, ptr %arrayidx13.prol, align 4, !tbaa !10
  %39 = tail call float @llvm.fmuladd.f32(float %37, float %38, float %36)
  store float %39, ptr %arrayidx5.prol, align 4, !tbaa !10
  %indvars.iv.next.prol = or disjoint i64 %indvars.iv.ph, 1
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol, %for.body3.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body3.preheader ], [ %indvars.iv.next.prol, %for.body3.prol ]
  %40 = icmp eq i64 %15, %indvars.iv.ph
  br i1 %40, label %for.cond1.for.inc18_crit_edge, label %for.body3

for.cond24.preheader.preheader:                   ; preds = %for.cond1.for.inc18_crit_edge
  %wide.trip.count155 = zext nneg i32 %n to i64
  %xtraiter216 = and i64 %wide.trip.count145, 1
  %41 = icmp eq i64 %15, 0
  %unroll_iter = and i64 %wide.trip.count145, 2147483646
  %lcmp.mod217.not = icmp eq i64 %xtraiter216, 0
  %lcmp.mod218 = trunc i32 %n to i1
  br label %for.cond24.preheader

for.body3:                                        ; preds = %for.body3.prol.loopexit, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3 ], [ %indvars.iv.unr, %for.body3.prol.loopexit ]
  %arrayidx5 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  %42 = load float, ptr %arrayidx5, align 4, !tbaa !10
  %43 = load float, ptr %arrayidx7, align 4, !tbaa !10
  %arrayidx9 = getelementptr inbounds nuw [4 x i8], ptr %v1, i64 %indvars.iv
  %44 = load float, ptr %arrayidx9, align 4, !tbaa !10
  %45 = tail call float @llvm.fmuladd.f32(float %43, float %44, float %42)
  %46 = load float, ptr %arrayidx11, align 4, !tbaa !10
  %arrayidx13 = getelementptr inbounds nuw [4 x i8], ptr %v2, i64 %indvars.iv
  %47 = load float, ptr %arrayidx13, align 4, !tbaa !10
  %48 = tail call float @llvm.fmuladd.f32(float %46, float %47, float %45)
  store float %48, ptr %arrayidx5, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv.next
  %49 = load float, ptr %arrayidx5.1, align 4, !tbaa !10
  %50 = load float, ptr %arrayidx7, align 4, !tbaa !10
  %arrayidx9.1 = getelementptr inbounds nuw [4 x i8], ptr %v1, i64 %indvars.iv.next
  %51 = load float, ptr %arrayidx9.1, align 4, !tbaa !10
  %52 = tail call float @llvm.fmuladd.f32(float %50, float %51, float %49)
  %53 = load float, ptr %arrayidx11, align 4, !tbaa !10
  %arrayidx13.1 = getelementptr inbounds nuw [4 x i8], ptr %v2, i64 %indvars.iv.next
  %54 = load float, ptr %arrayidx13.1, align 4, !tbaa !10
  %55 = tail call float @llvm.fmuladd.f32(float %53, float %54, float %52)
  store float %55, ptr %arrayidx5.1, align 4, !tbaa !10
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count145
  br i1 %exitcond.not.1, label %for.cond1.for.inc18_crit_edge, label %for.body3, !llvm.loop !28

for.cond1.for.inc18_crit_edge:                    ; preds = %for.body3.prol.loopexit, %for.body3, %middle.block
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %exitcond146.not = icmp eq i64 %indvars.iv.next143, %wide.trip.count145
  br i1 %exitcond146.not, label %for.cond24.preheader.preheader, label %for.cond1.preheader, !llvm.loop !29

for.cond24.preheader:                             ; preds = %for.cond24.preheader.preheader, %for.cond24.for.inc41_crit_edge
  %indvars.iv152 = phi i64 [ 0, %for.cond24.preheader.preheader ], [ %indvars.iv.next153, %for.cond24.for.inc41_crit_edge ]
  %arrayidx28 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv152
  %invariant.gep = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %indvars.iv152
  %arrayidx28.promoted = load float, ptr %arrayidx28, align 4, !tbaa !10
  br i1 %41, label %for.body26.epil.preheader, label %for.body26

for.body46.preheader:                             ; preds = %for.cond24.for.inc41_crit_edge
  %wide.trip.count160 = zext nneg i32 %n to i64
  %min.iters.check201 = icmp ult i32 %n, 8
  br i1 %min.iters.check201, label %for.body46.preheader215, label %vector.memcheck194

vector.memcheck194:                               ; preds = %for.body46.preheader
  %56 = shl nuw nsw i64 %wide.trip.count145, 2
  %scevgep195 = getelementptr i8, ptr %x, i64 %56
  %scevgep196 = getelementptr i8, ptr %z, i64 %56
  %bound0197 = icmp ult ptr %x, %scevgep196
  %bound1198 = icmp ult ptr %z, %scevgep195
  %found.conflict199 = and i1 %bound0197, %bound1198
  br i1 %found.conflict199, label %for.body46.preheader215, label %vector.ph202

vector.ph202:                                     ; preds = %vector.memcheck194
  %n.vec204 = and i64 %wide.trip.count145, 2147483640
  br label %vector.body205

vector.body205:                                   ; preds = %vector.body205, %vector.ph202
  %index206 = phi i64 [ 0, %vector.ph202 ], [ %index.next211, %vector.body205 ]
  %57 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %index206
  %58 = getelementptr inbounds nuw i8, ptr %57, i64 16
  %wide.load207 = load <4 x float>, ptr %57, align 4, !tbaa !10, !alias.scope !30, !noalias !33
  %wide.load208 = load <4 x float>, ptr %58, align 4, !tbaa !10, !alias.scope !30, !noalias !33
  %59 = getelementptr inbounds nuw [4 x i8], ptr %z, i64 %index206
  %60 = getelementptr inbounds nuw i8, ptr %59, i64 16
  %wide.load209 = load <4 x float>, ptr %59, align 4, !tbaa !10, !alias.scope !33
  %wide.load210 = load <4 x float>, ptr %60, align 4, !tbaa !10, !alias.scope !33
  %61 = fadd <4 x float> %wide.load207, %wide.load209
  %62 = fadd <4 x float> %wide.load208, %wide.load210
  store <4 x float> %61, ptr %57, align 4, !tbaa !10, !alias.scope !30, !noalias !33
  store <4 x float> %62, ptr %58, align 4, !tbaa !10, !alias.scope !30, !noalias !33
  %index.next211 = add nuw i64 %index206, 8
  %63 = icmp eq i64 %index.next211, %n.vec204
  br i1 %63, label %middle.block212, label %vector.body205, !llvm.loop !35

middle.block212:                                  ; preds = %vector.body205
  %cmp.n213 = icmp eq i64 %n.vec204, %wide.trip.count145
  br i1 %cmp.n213, label %for.cond59.preheader.preheader, label %for.body46.preheader215

for.body46.preheader215:                          ; preds = %vector.memcheck194, %for.body46.preheader, %middle.block212
  %indvars.iv157.ph = phi i64 [ 0, %vector.memcheck194 ], [ 0, %for.body46.preheader ], [ %n.vec204, %middle.block212 ]
  %xtraiter219 = and i64 %wide.trip.count145, 3
  %lcmp.mod220.not = icmp eq i64 %xtraiter219, 0
  br i1 %lcmp.mod220.not, label %for.body46.prol.loopexit, label %for.body46.prol

for.body46.prol:                                  ; preds = %for.body46.preheader215, %for.body46.prol
  %indvars.iv157.prol = phi i64 [ %indvars.iv.next158.prol, %for.body46.prol ], [ %indvars.iv157.ph, %for.body46.preheader215 ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body46.prol ], [ 0, %for.body46.preheader215 ]
  %arrayidx48.prol = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv157.prol
  %64 = load float, ptr %arrayidx48.prol, align 4, !tbaa !10
  %arrayidx50.prol = getelementptr inbounds nuw [4 x i8], ptr %z, i64 %indvars.iv157.prol
  %65 = load float, ptr %arrayidx50.prol, align 4, !tbaa !10
  %add.prol = fadd float %64, %65
  store float %add.prol, ptr %arrayidx48.prol, align 4, !tbaa !10
  %indvars.iv.next158.prol = add nuw nsw i64 %indvars.iv157.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter219
  br i1 %prol.iter.cmp.not, label %for.body46.prol.loopexit, label %for.body46.prol, !llvm.loop !36

for.body46.prol.loopexit:                         ; preds = %for.body46.prol, %for.body46.preheader215
  %indvars.iv157.unr = phi i64 [ %indvars.iv157.ph, %for.body46.preheader215 ], [ %indvars.iv.next158.prol, %for.body46.prol ]
  %66 = sub nsw i64 %indvars.iv157.ph, %wide.trip.count145
  %67 = icmp ugt i64 %66, -4
  br i1 %67, label %for.cond59.preheader.preheader, label %for.body46

for.body26:                                       ; preds = %for.cond24.preheader, %for.body26
  %indvars.iv147 = phi i64 [ %indvars.iv.next148.1, %for.body26 ], [ 0, %for.cond24.preheader ]
  %68 = phi float [ %74, %for.body26 ], [ %arrayidx28.promoted, %for.cond24.preheader ]
  %niter = phi i64 [ %niter.next.1, %for.body26 ], [ 0, %for.cond24.preheader ]
  %gep = getelementptr inbounds nuw [16384 x i8], ptr %invariant.gep, i64 %indvars.iv147
  %69 = load float, ptr %gep, align 4, !tbaa !10
  %mul = fmul float %beta, %69
  %arrayidx34 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %indvars.iv147
  %70 = load float, ptr %arrayidx34, align 4, !tbaa !10
  %71 = tail call float @llvm.fmuladd.f32(float %mul, float %70, float %68)
  store float %71, ptr %arrayidx28, align 4, !tbaa !10
  %indvars.iv.next148 = or disjoint i64 %indvars.iv147, 1
  %gep.1 = getelementptr inbounds nuw [16384 x i8], ptr %invariant.gep, i64 %indvars.iv.next148
  %72 = load float, ptr %gep.1, align 4, !tbaa !10
  %mul.1 = fmul float %beta, %72
  %arrayidx34.1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %indvars.iv.next148
  %73 = load float, ptr %arrayidx34.1, align 4, !tbaa !10
  %74 = tail call float @llvm.fmuladd.f32(float %mul.1, float %73, float %71)
  store float %74, ptr %arrayidx28, align 4, !tbaa !10
  %indvars.iv.next148.1 = add nuw nsw i64 %indvars.iv147, 2
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %for.cond24.for.inc41_crit_edge.unr-lcssa, label %for.body26, !llvm.loop !38

for.cond24.for.inc41_crit_edge.unr-lcssa:         ; preds = %for.body26
  br i1 %lcmp.mod217.not, label %for.cond24.for.inc41_crit_edge, label %for.body26.epil.preheader

for.body26.epil.preheader:                        ; preds = %for.cond24.for.inc41_crit_edge.unr-lcssa, %for.cond24.preheader
  %indvars.iv147.epil.init = phi i64 [ 0, %for.cond24.preheader ], [ %indvars.iv.next148.1, %for.cond24.for.inc41_crit_edge.unr-lcssa ]
  %.epil.init = phi float [ %arrayidx28.promoted, %for.cond24.preheader ], [ %74, %for.cond24.for.inc41_crit_edge.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod218)
  %gep.epil = getelementptr inbounds nuw [16384 x i8], ptr %invariant.gep, i64 %indvars.iv147.epil.init
  %75 = load float, ptr %gep.epil, align 4, !tbaa !10
  %mul.epil = fmul float %beta, %75
  %arrayidx34.epil = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %indvars.iv147.epil.init
  %76 = load float, ptr %arrayidx34.epil, align 4, !tbaa !10
  %77 = tail call float @llvm.fmuladd.f32(float %mul.epil, float %76, float %.epil.init)
  store float %77, ptr %arrayidx28, align 4, !tbaa !10
  br label %for.cond24.for.inc41_crit_edge

for.cond24.for.inc41_crit_edge:                   ; preds = %for.cond24.for.inc41_crit_edge.unr-lcssa, %for.body26.epil.preheader
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %exitcond156.not = icmp eq i64 %indvars.iv.next153, %wide.trip.count155
  br i1 %exitcond156.not, label %for.body46.preheader, label %for.cond24.preheader, !llvm.loop !39

for.cond59.preheader.preheader:                   ; preds = %for.body46.prol.loopexit, %for.body46, %middle.block212
  %wide.trip.count170 = zext nneg i32 %n to i64
  %xtraiter221 = and i64 %wide.trip.count145, 1
  %78 = icmp eq i64 %15, 0
  %unroll_iter226 = and i64 %wide.trip.count145, 2147483646
  %lcmp.mod224.not = icmp eq i64 %xtraiter221, 0
  %lcmp.mod225 = trunc i32 %n to i1
  br label %for.cond59.preheader

for.body46:                                       ; preds = %for.body46.prol.loopexit, %for.body46
  %indvars.iv157 = phi i64 [ %indvars.iv.next158.3, %for.body46 ], [ %indvars.iv157.unr, %for.body46.prol.loopexit ]
  %arrayidx48 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv157
  %79 = load float, ptr %arrayidx48, align 4, !tbaa !10
  %arrayidx50 = getelementptr inbounds nuw [4 x i8], ptr %z, i64 %indvars.iv157
  %80 = load float, ptr %arrayidx50, align 4, !tbaa !10
  %add = fadd float %79, %80
  store float %add, ptr %arrayidx48, align 4, !tbaa !10
  %indvars.iv.next158 = add nuw nsw i64 %indvars.iv157, 1
  %arrayidx48.1 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv.next158
  %81 = load float, ptr %arrayidx48.1, align 4, !tbaa !10
  %arrayidx50.1 = getelementptr inbounds nuw [4 x i8], ptr %z, i64 %indvars.iv.next158
  %82 = load float, ptr %arrayidx50.1, align 4, !tbaa !10
  %add.1 = fadd float %81, %82
  store float %add.1, ptr %arrayidx48.1, align 4, !tbaa !10
  %indvars.iv.next158.1 = add nuw nsw i64 %indvars.iv157, 2
  %arrayidx48.2 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv.next158.1
  %83 = load float, ptr %arrayidx48.2, align 4, !tbaa !10
  %arrayidx50.2 = getelementptr inbounds nuw [4 x i8], ptr %z, i64 %indvars.iv.next158.1
  %84 = load float, ptr %arrayidx50.2, align 4, !tbaa !10
  %add.2 = fadd float %83, %84
  store float %add.2, ptr %arrayidx48.2, align 4, !tbaa !10
  %indvars.iv.next158.2 = add nuw nsw i64 %indvars.iv157, 3
  %arrayidx48.3 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv.next158.2
  %85 = load float, ptr %arrayidx48.3, align 4, !tbaa !10
  %arrayidx50.3 = getelementptr inbounds nuw [4 x i8], ptr %z, i64 %indvars.iv.next158.2
  %86 = load float, ptr %arrayidx50.3, align 4, !tbaa !10
  %add.3 = fadd float %85, %86
  store float %add.3, ptr %arrayidx48.3, align 4, !tbaa !10
  %indvars.iv.next158.3 = add nuw nsw i64 %indvars.iv157, 4
  %exitcond161.not.3 = icmp eq i64 %indvars.iv.next158.3, %wide.trip.count160
  br i1 %exitcond161.not.3, label %for.cond59.preheader.preheader, label %for.body46, !llvm.loop !40

for.cond59.preheader:                             ; preds = %for.cond59.preheader.preheader, %for.cond59.for.inc77_crit_edge
  %indvars.iv167 = phi i64 [ 0, %for.cond59.preheader.preheader ], [ %indvars.iv.next168, %for.cond59.for.inc77_crit_edge ]
  %arrayidx63 = getelementptr inbounds nuw [4 x i8], ptr %w, i64 %indvars.iv167
  %arrayidx65 = getelementptr inbounds nuw [16384 x i8], ptr %A, i64 %indvars.iv167
  %arrayidx63.promoted = load float, ptr %arrayidx63, align 4, !tbaa !10
  br i1 %78, label %for.body61.epil.preheader, label %for.body61

for.body61:                                       ; preds = %for.cond59.preheader, %for.body61
  %indvars.iv162 = phi i64 [ %indvars.iv.next163.1, %for.body61 ], [ 0, %for.cond59.preheader ]
  %87 = phi float [ %93, %for.body61 ], [ %arrayidx63.promoted, %for.cond59.preheader ]
  %niter227 = phi i64 [ %niter227.next.1, %for.body61 ], [ 0, %for.cond59.preheader ]
  %arrayidx67 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx65, i64 %indvars.iv162
  %88 = load float, ptr %arrayidx67, align 4, !tbaa !10
  %mul68 = fmul float %alpha, %88
  %arrayidx70 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv162
  %89 = load float, ptr %arrayidx70, align 4, !tbaa !10
  %90 = tail call float @llvm.fmuladd.f32(float %mul68, float %89, float %87)
  store float %90, ptr %arrayidx63, align 4, !tbaa !10
  %indvars.iv.next163 = or disjoint i64 %indvars.iv162, 1
  %arrayidx67.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx65, i64 %indvars.iv.next163
  %91 = load float, ptr %arrayidx67.1, align 4, !tbaa !10
  %mul68.1 = fmul float %alpha, %91
  %arrayidx70.1 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv.next163
  %92 = load float, ptr %arrayidx70.1, align 4, !tbaa !10
  %93 = tail call float @llvm.fmuladd.f32(float %mul68.1, float %92, float %90)
  store float %93, ptr %arrayidx63, align 4, !tbaa !10
  %indvars.iv.next163.1 = add nuw nsw i64 %indvars.iv162, 2
  %niter227.next.1 = add i64 %niter227, 2
  %niter227.ncmp.1 = icmp eq i64 %niter227.next.1, %unroll_iter226
  br i1 %niter227.ncmp.1, label %for.cond59.for.inc77_crit_edge.unr-lcssa, label %for.body61, !llvm.loop !41

for.cond59.for.inc77_crit_edge.unr-lcssa:         ; preds = %for.body61
  br i1 %lcmp.mod224.not, label %for.cond59.for.inc77_crit_edge, label %for.body61.epil.preheader

for.body61.epil.preheader:                        ; preds = %for.cond59.for.inc77_crit_edge.unr-lcssa, %for.cond59.preheader
  %indvars.iv162.epil.init = phi i64 [ 0, %for.cond59.preheader ], [ %indvars.iv.next163.1, %for.cond59.for.inc77_crit_edge.unr-lcssa ]
  %.epil.init223 = phi float [ %arrayidx63.promoted, %for.cond59.preheader ], [ %93, %for.cond59.for.inc77_crit_edge.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod225)
  %arrayidx67.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx65, i64 %indvars.iv162.epil.init
  %94 = load float, ptr %arrayidx67.epil, align 4, !tbaa !10
  %mul68.epil = fmul float %alpha, %94
  %arrayidx70.epil = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv162.epil.init
  %95 = load float, ptr %arrayidx70.epil, align 4, !tbaa !10
  %96 = tail call float @llvm.fmuladd.f32(float %mul68.epil, float %95, float %.epil.init223)
  store float %96, ptr %arrayidx63, align 4, !tbaa !10
  br label %for.cond59.for.inc77_crit_edge

for.cond59.for.inc77_crit_edge:                   ; preds = %for.cond59.for.inc77_crit_edge.unr-lcssa, %for.body61.epil.preheader
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %exitcond171.not = icmp eq i64 %indvars.iv.next168, %wide.trip.count170
  br i1 %exitcond171.not, label %for.end79, label %for.cond59.preheader, !llvm.loop !42

for.end79:                                        ; preds = %for.cond59.for.inc77_crit_edge, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable
define dso_local void @_Z4initiPfS_PA4096_fS_S_S_S_S_S_S_S_(i32 noundef %n, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %alpha, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %beta, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %u1, ptr nofree noundef writeonly captures(none) %v1, ptr nofree noundef writeonly captures(none) %u2, ptr nofree noundef writeonly captures(none) %v2, ptr nofree noundef writeonly captures(none) %w, ptr nofree noundef writeonly captures(none) %x, ptr nofree noundef writeonly captures(none) %y, ptr nofree noundef writeonly captures(none) %z) local_unnamed_addr #4 {
entry:
  store float 4.353200e+04, ptr %alpha, align 4, !tbaa !10
  store float 1.231300e+04, ptr %beta, align 4, !tbaa !10
  br label %for.body

for.body:                                         ; preds = %entry, %middle.block
  %indvars.iv75 = phi i64 [ 0, %entry ], [ %indvars.iv.next76, %middle.block ]
  %0 = trunc nuw nsw i64 %indvars.iv75 to i32
  %conv = uitofp nneg i32 %0 to float
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %u1, i64 %indvars.iv75
  store float %conv, ptr %arrayidx, align 4, !tbaa !10
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %1 = trunc nuw nsw i64 %indvars.iv.next76 to i32
  %div71 = lshr i32 %1, 12
  %2 = uitofp nneg i32 %div71 to float
  %conv3 = fmul nnan float %2, 5.000000e-01
  %arrayidx5 = getelementptr inbounds nuw [4 x i8], ptr %u2, i64 %indvars.iv75
  store float %conv3, ptr %arrayidx5, align 4, !tbaa !10
  %conv10 = fmul nnan float %2, 2.500000e-01
  %arrayidx12 = getelementptr inbounds nuw [4 x i8], ptr %v1, i64 %indvars.iv75
  store float %conv10, ptr %arrayidx12, align 4, !tbaa !10
  %arrayidx19 = getelementptr inbounds nuw [4 x i8], ptr %v2, i64 %indvars.iv75
  %conv24 = fmul nnan float %2, 1.250000e-01
  %arrayidx26 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %indvars.iv75
  %3 = insertelement <2 x float> poison, float %2, i64 0
  %4 = shufflevector <2 x float> %3, <2 x float> poison, <2 x i32> zeroinitializer
  %5 = fdiv <2 x float> %4, <float 6.000000e+00, float 9.000000e+00>
  %6 = extractelement <2 x float> %5, i64 0
  store float %6, ptr %arrayidx19, align 4, !tbaa !10
  store float %conv24, ptr %arrayidx26, align 4, !tbaa !10
  %arrayidx33 = getelementptr inbounds nuw [4 x i8], ptr %z, i64 %indvars.iv75
  %7 = extractelement <2 x float> %5, i64 1
  store float %7, ptr %arrayidx33, align 4, !tbaa !10
  %arrayidx35 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %indvars.iv75
  store float 0.000000e+00, ptr %arrayidx35, align 4, !tbaa !10
  %arrayidx37 = getelementptr inbounds nuw [4 x i8], ptr %w, i64 %indvars.iv75
  store float 0.000000e+00, ptr %arrayidx37, align 4, !tbaa !10
  %arrayidx45 = getelementptr inbounds nuw [16384 x i8], ptr %A, i64 %indvars.iv75
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body
  %index = phi i64 [ 0, %for.body ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.body ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %8 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %9 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %10 = fmul nnan <4 x float> %broadcast.splat, %8
  %11 = fmul nnan <4 x float> %broadcast.splat, %9
  %12 = fmul nnan <4 x float> %10, splat (float f0x39800000)
  %13 = fmul nnan <4 x float> %11, splat (float f0x39800000)
  %14 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx45, i64 %index
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 16
  store <4 x float> %12, ptr %14, align 4, !tbaa !10
  store <4 x float> %13, ptr %15, align 4, !tbaa !10
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %16 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %17 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %18 = fmul nnan <4 x float> %broadcast.splat, %16
  %19 = fmul nnan <4 x float> %broadcast.splat, %17
  %20 = fmul nnan <4 x float> %18, splat (float f0x39800000)
  %21 = fmul nnan <4 x float> %19, splat (float f0x39800000)
  %22 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx45, i64 %index
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %22, i64 48
  store <4 x float> %20, ptr %23, align 4, !tbaa !10
  store <4 x float> %21, ptr %24, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %25 = icmp eq i64 %index.next.1, 4096
  br i1 %25, label %middle.block, label %vector.body, !llvm.loop !43

middle.block:                                     ; preds = %vector.body
  %exitcond78.not = icmp eq i64 %indvars.iv.next76, 4096
  br i1 %exitcond78.not, label %for.end50, label %for.body, !llvm.loop !44

for.end50:                                        ; preds = %middle.block
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiPfS_(i32 noundef %n, ptr nofree noundef readonly captures(none) %w1, ptr nofree noundef readonly captures(none) %w2) local_unnamed_addr #5 {
entry:
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %entry ], [ %32, %vector.body ]
  %0 = getelementptr inbounds nuw [4 x i8], ptr %w1, i64 %index
  %wide.load = load <4 x float>, ptr %0, align 4, !tbaa !10
  %1 = fpext <4 x float> %wide.load to <4 x double>
  %2 = getelementptr inbounds nuw [4 x i8], ptr %w2, i64 %index
  %wide.load15 = load <4 x float>, ptr %2, align 4, !tbaa !10
  %3 = fpext <4 x float> %wide.load15 to <4 x double>
  %4 = fcmp olt <4 x double> %1, splat (double f0xB690000000000000)
  %5 = fneg <4 x float> %wide.load
  %6 = select <4 x i1> %4, <4 x float> %5, <4 x float> %wide.load
  %7 = fpext <4 x float> %6 to <4 x double>
  %8 = fcmp uge <4 x double> %7, splat (double 1.000000e-02)
  %9 = fcmp olt <4 x double> %3, splat (double f0xB690000000000000)
  %10 = fneg <4 x float> %wide.load15
  %11 = select <4 x i1> %9, <4 x float> %10, <4 x float> %wide.load15
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
  %33 = icmp eq i64 %index.next, 4096
  br i1 %33, label %for.end, label %vector.body, !llvm.loop !45

for.end:                                          ; preds = %vector.body
  %34 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %32)
  %call7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %34) #15
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
define dso_local void @_Z29__device_stub__gemver_kernel1iffPfS_S_S_S_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr noundef %a, ptr noundef %v1, ptr noundef %v2, ptr noundef %u1, ptr noundef %u2) #9 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca float, align 4
  %beta.addr = alloca float, align 4
  %a.addr = alloca ptr, align 8
  %v1.addr = alloca ptr, align 8
  %v2.addr = alloca ptr, align 8
  %u1.addr = alloca ptr, align 8
  %u2.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !46
  store float %alpha, ptr %alpha.addr, align 4, !tbaa !10
  store float %beta, ptr %beta.addr, align 4, !tbaa !10
  store ptr %a, ptr %a.addr, align 8, !tbaa !47
  store ptr %v1, ptr %v1.addr, align 8, !tbaa !47
  store ptr %v2, ptr %v2.addr, align 8, !tbaa !47
  store ptr %u1, ptr %u1.addr, align 8, !tbaa !47
  store ptr %u2, ptr %u2.addr, align 8, !tbaa !47
  %kernel_args1 = alloca [8 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %alpha.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %beta.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %a.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %v1.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %v2.addr, ptr %4, align 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 48
  store ptr %u1.addr, ptr %5, align 16
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 56
  store ptr %u2.addr, ptr %6, align 8
  %7 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %8 = load i64, ptr %shmem_size, align 8
  %9 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gemver_kernel1iffPfS_S_S_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %8, ptr noundef %9)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z29__device_stub__gemver_kernel2iffPfS_S_S_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr noundef %a, ptr noundef %x, ptr noundef %y, ptr noundef %z) #9 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca float, align 4
  %beta.addr = alloca float, align 4
  %a.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  %y.addr = alloca ptr, align 8
  %z.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !46
  store float %alpha, ptr %alpha.addr, align 4, !tbaa !10
  store float %beta, ptr %beta.addr, align 4, !tbaa !10
  store ptr %a, ptr %a.addr, align 8, !tbaa !47
  store ptr %x, ptr %x.addr, align 8, !tbaa !47
  store ptr %y, ptr %y.addr, align 8, !tbaa !47
  store ptr %z, ptr %z.addr, align 8, !tbaa !47
  %kernel_args1 = alloca [7 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %alpha.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %beta.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %a.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %x.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %y.addr, ptr %4, align 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 48
  store ptr %z.addr, ptr %5, align 16
  %6 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %7 = load i64, ptr %shmem_size, align 8
  %8 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gemver_kernel2iffPfS_S_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %7, ptr noundef %8)
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z29__device_stub__gemver_kernel3iffPfS_S_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr noundef %a, ptr noundef %x, ptr noundef %w) #9 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca float, align 4
  %beta.addr = alloca float, align 4
  %a.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  %w.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !46
  store float %alpha, ptr %alpha.addr, align 4, !tbaa !10
  store float %beta, ptr %beta.addr, align 4, !tbaa !10
  store ptr %a, ptr %a.addr, align 8, !tbaa !47
  store ptr %x, ptr %x.addr, align 8, !tbaa !47
  store ptr %w, ptr %w.addr, align 8, !tbaa !47
  %kernel_args1 = alloca [6 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %alpha.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %beta.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %a.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %x.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %w.addr, ptr %4, align 8
  %5 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %6 = load i64, ptr %shmem_size, align 8
  %7 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gemver_kernel3iffPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %6, ptr noundef %7)
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z10gemverCudaiffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_S1_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr noundef %A, ptr noundef %u1, ptr noundef %v1, ptr noundef %u2, ptr noundef %v2, ptr noundef %w, ptr noundef %w_outputFromGpu, ptr noundef %x, ptr noundef %y, ptr noundef %z) local_unnamed_addr #7 {
entry:
  %Tp.i.i105 = alloca %struct.timeval, align 8
  %n.addr.i88 = alloca i32, align 4
  %alpha.addr.i89 = alloca float, align 4
  %beta.addr.i90 = alloca float, align 4
  %a.addr.i91 = alloca ptr, align 8
  %x.addr.i92 = alloca ptr, align 8
  %w.addr.i = alloca ptr, align 8
  %grid_dim.i93 = alloca %struct.dim3, align 8
  %block_dim.i94 = alloca %struct.dim3, align 8
  %shmem_size.i95 = alloca i64, align 8
  %stream.i96 = alloca ptr, align 8
  %kernel_args1.i97 = alloca [6 x ptr], align 16
  %n.addr.i72 = alloca i32, align 4
  %alpha.addr.i73 = alloca float, align 4
  %beta.addr.i74 = alloca float, align 4
  %a.addr.i75 = alloca ptr, align 8
  %x.addr.i = alloca ptr, align 8
  %y.addr.i = alloca ptr, align 8
  %z.addr.i = alloca ptr, align 8
  %grid_dim.i76 = alloca %struct.dim3, align 8
  %block_dim.i77 = alloca %struct.dim3, align 8
  %shmem_size.i78 = alloca i64, align 8
  %stream.i79 = alloca ptr, align 8
  %kernel_args1.i80 = alloca [7 x ptr], align 16
  %n.addr.i = alloca i32, align 4
  %alpha.addr.i = alloca float, align 4
  %beta.addr.i = alloca float, align 4
  %a.addr.i = alloca ptr, align 8
  %v1.addr.i = alloca ptr, align 8
  %v2.addr.i = alloca ptr, align 8
  %u1.addr.i = alloca ptr, align 8
  %u2.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [8 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %A_gpu = alloca ptr, align 8
  %x_gpu = alloca ptr, align 8
  %y_gpu = alloca ptr, align 8
  %z_gpu = alloca ptr, align 8
  %v1_gpu = alloca ptr, align 8
  %v2_gpu = alloca ptr, align 8
  %u1_gpu = alloca ptr, align 8
  %u2_gpu = alloca ptr, align 8
  %w_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %x_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %y_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %z_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %v1_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %v2_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %u1_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %u2_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %w_gpu) #16
  %call = call i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 67108864) #15
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %x_gpu, i64 noundef 16384) #15
  %call2 = call i32 @cudaMalloc(ptr noundef nonnull %y_gpu, i64 noundef 16384) #15
  %call3 = call i32 @cudaMalloc(ptr noundef nonnull %z_gpu, i64 noundef 16384) #15
  %call4 = call i32 @cudaMalloc(ptr noundef nonnull %w_gpu, i64 noundef 16384) #15
  %call5 = call i32 @cudaMalloc(ptr noundef nonnull %v1_gpu, i64 noundef 16384) #15
  %call6 = call i32 @cudaMalloc(ptr noundef nonnull %v2_gpu, i64 noundef 16384) #15
  %call7 = call i32 @cudaMalloc(ptr noundef nonnull %u1_gpu, i64 noundef 16384) #15
  %call8 = call i32 @cudaMalloc(ptr noundef nonnull %u2_gpu, i64 noundef 16384) #15
  %0 = load ptr, ptr %A_gpu, align 8, !tbaa !47
  %call9 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 67108864, i32 noundef 1) #15
  %1 = load ptr, ptr %x_gpu, align 8, !tbaa !47
  %call10 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %x, i64 noundef 16384, i32 noundef 1) #15
  %2 = load ptr, ptr %y_gpu, align 8, !tbaa !47
  %call11 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %y, i64 noundef 16384, i32 noundef 1) #15
  %3 = load ptr, ptr %z_gpu, align 8, !tbaa !47
  %call12 = call i32 @cudaMemcpy(ptr noundef %3, ptr noundef %z, i64 noundef 16384, i32 noundef 1) #15
  %4 = load ptr, ptr %w_gpu, align 8, !tbaa !47
  %call13 = call i32 @cudaMemcpy(ptr noundef %4, ptr noundef %w, i64 noundef 16384, i32 noundef 1) #15
  %5 = load ptr, ptr %v1_gpu, align 8, !tbaa !47
  %call14 = call i32 @cudaMemcpy(ptr noundef %5, ptr noundef %v1, i64 noundef 16384, i32 noundef 1) #15
  %6 = load ptr, ptr %v2_gpu, align 8, !tbaa !47
  %call15 = call i32 @cudaMemcpy(ptr noundef %6, ptr noundef %v2, i64 noundef 16384, i32 noundef 1) #15
  %7 = load ptr, ptr %u1_gpu, align 8, !tbaa !47
  %call16 = call i32 @cudaMemcpy(ptr noundef %7, ptr noundef %u1, i64 noundef 16384, i32 noundef 1) #15
  %8 = load ptr, ptr %u2_gpu, align 8, !tbaa !47
  %call17 = call i32 @cudaMemcpy(ptr noundef %8, ptr noundef %u2, i64 noundef 16384, i32 noundef 1) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #16
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #15
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %9 = load i64, ptr %Tp.i.i, align 8, !tbaa !50
  %conv.i.i = sitofp i64 %9 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %10 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !53
  %conv2.i.i = sitofp i64 %10 to double
  %11 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #16
  store double %11, ptr @polybench_t_start, align 8, !tbaa !54
  %call29 = call i32 @__cudaPushCallConfiguration(i64 2199023255680, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool.not = icmp eq i32 %call29, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %12 = load ptr, ptr %A_gpu, align 8, !tbaa !47
  %13 = load ptr, ptr %v1_gpu, align 8, !tbaa !47
  %14 = load ptr, ptr %v2_gpu, align 8, !tbaa !47
  %15 = load ptr, ptr %u1_gpu, align 8, !tbaa !47
  %16 = load ptr, ptr %u2_gpu, align 8, !tbaa !47
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %alpha.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %beta.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %a.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %v1.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %v2.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %u1.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %u2.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %n, ptr %n.addr.i, align 4, !tbaa !46
  store float %alpha, ptr %alpha.addr.i, align 4, !tbaa !10
  store float %beta, ptr %beta.addr.i, align 4, !tbaa !10
  store ptr %12, ptr %a.addr.i, align 8, !tbaa !47
  store ptr %13, ptr %v1.addr.i, align 8, !tbaa !47
  store ptr %14, ptr %v2.addr.i, align 8, !tbaa !47
  store ptr %15, ptr %u1.addr.i, align 8, !tbaa !47
  store ptr %16, ptr %u2.addr.i, align 8, !tbaa !47
  store ptr %n.addr.i, ptr %kernel_args1.i, align 16
  %17 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %alpha.addr.i, ptr %17, align 8
  %18 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %beta.addr.i, ptr %18, align 16
  %19 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %a.addr.i, ptr %19, align 8
  %20 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 32
  store ptr %v1.addr.i, ptr %20, align 16
  %21 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 40
  store ptr %v2.addr.i, ptr %21, align 8
  %22 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 48
  store ptr %u1.addr.i, ptr %22, align 16
  %23 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 56
  store ptr %u2.addr.i, ptr %23, align 8
  %24 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !56
  %25 = load i64, ptr %shmem_size.i, align 8
  %26 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gemver_kernel1iffPfS_S_S_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %25, ptr noundef %26), !inline_history !56
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %alpha.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %beta.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %a.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %v1.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %v2.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %u1.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %u2.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %_Z21polybench_timer_startv.exit
  %call30 = call i32 @cudaThreadSynchronize() #15
  %call33 = call i32 @__cudaPushCallConfiguration(i64 4294967312, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool34.not = icmp eq i32 %call33, 0
  br i1 %tobool34.not, label %kcall.configok35, label %kcall.end36

kcall.configok35:                                 ; preds = %kcall.end
  %27 = load ptr, ptr %A_gpu, align 8, !tbaa !47
  %28 = load ptr, ptr %x_gpu, align 8, !tbaa !47
  %29 = load ptr, ptr %y_gpu, align 8, !tbaa !47
  %30 = load ptr, ptr %z_gpu, align 8, !tbaa !47
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i72)
  call void @llvm.lifetime.start.p0(ptr nonnull %alpha.addr.i73)
  call void @llvm.lifetime.start.p0(ptr nonnull %beta.addr.i74)
  call void @llvm.lifetime.start.p0(ptr nonnull %a.addr.i75)
  call void @llvm.lifetime.start.p0(ptr nonnull %x.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %y.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %z.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i76)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i77)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i78)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i79)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i80)
  store i32 %n, ptr %n.addr.i72, align 4, !tbaa !46
  store float %alpha, ptr %alpha.addr.i73, align 4, !tbaa !10
  store float %beta, ptr %beta.addr.i74, align 4, !tbaa !10
  store ptr %27, ptr %a.addr.i75, align 8, !tbaa !47
  store ptr %28, ptr %x.addr.i, align 8, !tbaa !47
  store ptr %29, ptr %y.addr.i, align 8, !tbaa !47
  store ptr %30, ptr %z.addr.i, align 8, !tbaa !47
  store ptr %n.addr.i72, ptr %kernel_args1.i80, align 16
  %31 = getelementptr inbounds nuw i8, ptr %kernel_args1.i80, i64 8
  store ptr %alpha.addr.i73, ptr %31, align 8
  %32 = getelementptr inbounds nuw i8, ptr %kernel_args1.i80, i64 16
  store ptr %beta.addr.i74, ptr %32, align 16
  %33 = getelementptr inbounds nuw i8, ptr %kernel_args1.i80, i64 24
  store ptr %a.addr.i75, ptr %33, align 8
  %34 = getelementptr inbounds nuw i8, ptr %kernel_args1.i80, i64 32
  store ptr %x.addr.i, ptr %34, align 16
  %35 = getelementptr inbounds nuw i8, ptr %kernel_args1.i80, i64 40
  store ptr %y.addr.i, ptr %35, align 8
  %36 = getelementptr inbounds nuw i8, ptr %kernel_args1.i80, i64 48
  store ptr %z.addr.i, ptr %36, align 16
  %37 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i76, ptr nonnull %block_dim.i77, ptr nonnull %shmem_size.i78, ptr nonnull %stream.i79), !inline_history !57
  %38 = load i64, ptr %shmem_size.i78, align 8
  %39 = load ptr, ptr %stream.i79, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i81 = load i64, ptr %grid_dim.i76, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i82 = getelementptr inbounds nuw i8, ptr %grid_dim.i76, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i83 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i82, align 8
  %block_dim.coerce.sroa.0.0.copyload.i84 = load i64, ptr %block_dim.i77, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i85 = getelementptr inbounds nuw i8, ptr %block_dim.i77, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i86 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i85, align 8
  %call.i87 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gemver_kernel2iffPfS_S_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i81, i32 %grid_dim.coerce.sroa.2.0.copyload.i83, i64 %block_dim.coerce.sroa.0.0.copyload.i84, i32 %block_dim.coerce.sroa.2.0.copyload.i86, ptr noundef nonnull %kernel_args1.i80, i64 noundef %38, ptr noundef %39), !inline_history !57
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i72)
  call void @llvm.lifetime.end.p0(ptr nonnull %alpha.addr.i73)
  call void @llvm.lifetime.end.p0(ptr nonnull %beta.addr.i74)
  call void @llvm.lifetime.end.p0(ptr nonnull %a.addr.i75)
  call void @llvm.lifetime.end.p0(ptr nonnull %x.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %y.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %z.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i76)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i77)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i78)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i79)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i80)
  br label %kcall.end36

kcall.end36:                                      ; preds = %kcall.configok35, %kcall.end
  %call37 = call i32 @cudaThreadSynchronize() #15
  %call40 = call i32 @__cudaPushCallConfiguration(i64 4294967312, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool41.not = icmp eq i32 %call40, 0
  br i1 %tobool41.not, label %kcall.configok42, label %kcall.end43

kcall.configok42:                                 ; preds = %kcall.end36
  %40 = load ptr, ptr %A_gpu, align 8, !tbaa !47
  %41 = load ptr, ptr %x_gpu, align 8, !tbaa !47
  %42 = load ptr, ptr %w_gpu, align 8, !tbaa !47
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i88)
  call void @llvm.lifetime.start.p0(ptr nonnull %alpha.addr.i89)
  call void @llvm.lifetime.start.p0(ptr nonnull %beta.addr.i90)
  call void @llvm.lifetime.start.p0(ptr nonnull %a.addr.i91)
  call void @llvm.lifetime.start.p0(ptr nonnull %x.addr.i92)
  call void @llvm.lifetime.start.p0(ptr nonnull %w.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i93)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i94)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i95)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i96)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i97)
  store i32 %n, ptr %n.addr.i88, align 4, !tbaa !46
  store float %alpha, ptr %alpha.addr.i89, align 4, !tbaa !10
  store float %beta, ptr %beta.addr.i90, align 4, !tbaa !10
  store ptr %40, ptr %a.addr.i91, align 8, !tbaa !47
  store ptr %41, ptr %x.addr.i92, align 8, !tbaa !47
  store ptr %42, ptr %w.addr.i, align 8, !tbaa !47
  store ptr %n.addr.i88, ptr %kernel_args1.i97, align 16
  %43 = getelementptr inbounds nuw i8, ptr %kernel_args1.i97, i64 8
  store ptr %alpha.addr.i89, ptr %43, align 8
  %44 = getelementptr inbounds nuw i8, ptr %kernel_args1.i97, i64 16
  store ptr %beta.addr.i90, ptr %44, align 16
  %45 = getelementptr inbounds nuw i8, ptr %kernel_args1.i97, i64 24
  store ptr %a.addr.i91, ptr %45, align 8
  %46 = getelementptr inbounds nuw i8, ptr %kernel_args1.i97, i64 32
  store ptr %x.addr.i92, ptr %46, align 16
  %47 = getelementptr inbounds nuw i8, ptr %kernel_args1.i97, i64 40
  store ptr %w.addr.i, ptr %47, align 8
  %48 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i93, ptr nonnull %block_dim.i94, ptr nonnull %shmem_size.i95, ptr nonnull %stream.i96), !inline_history !58
  %49 = load i64, ptr %shmem_size.i95, align 8
  %50 = load ptr, ptr %stream.i96, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i98 = load i64, ptr %grid_dim.i93, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i99 = getelementptr inbounds nuw i8, ptr %grid_dim.i93, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i100 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i99, align 8
  %block_dim.coerce.sroa.0.0.copyload.i101 = load i64, ptr %block_dim.i94, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i102 = getelementptr inbounds nuw i8, ptr %block_dim.i94, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i103 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i102, align 8
  %call.i104 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gemver_kernel3iffPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i98, i32 %grid_dim.coerce.sroa.2.0.copyload.i100, i64 %block_dim.coerce.sroa.0.0.copyload.i101, i32 %block_dim.coerce.sroa.2.0.copyload.i103, ptr noundef nonnull %kernel_args1.i97, i64 noundef %49, ptr noundef %50), !inline_history !58
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i88)
  call void @llvm.lifetime.end.p0(ptr nonnull %alpha.addr.i89)
  call void @llvm.lifetime.end.p0(ptr nonnull %beta.addr.i90)
  call void @llvm.lifetime.end.p0(ptr nonnull %a.addr.i91)
  call void @llvm.lifetime.end.p0(ptr nonnull %x.addr.i92)
  call void @llvm.lifetime.end.p0(ptr nonnull %w.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i93)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i94)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i95)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i96)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i97)
  br label %kcall.end43

kcall.end43:                                      ; preds = %kcall.configok42, %kcall.end36
  %call44 = call i32 @cudaThreadSynchronize() #15
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i105) #16
  %call.i.i106 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i105, ptr noundef null) #17
  %cmp.not.i.i107 = icmp eq i32 %call.i.i106, 0
  br i1 %cmp.not.i.i107, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i108

if.then.i.i108:                                   ; preds = %kcall.end43
  %call1.i.i109 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i106) #15
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end43, %if.then.i.i108
  %51 = load i64, ptr %Tp.i.i105, align 8, !tbaa !50
  %conv.i.i110 = sitofp i64 %51 to double
  %tv_usec.i.i111 = getelementptr inbounds nuw i8, ptr %Tp.i.i105, i64 8
  %52 = load i64, ptr %tv_usec.i.i111, align 8, !tbaa !53
  %conv2.i.i112 = sitofp i64 %52 to double
  %53 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i112, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i110)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i105) #16
  store double %53, ptr @polybench_t_end, align 8, !tbaa !54
  %54 = load double, ptr @polybench_t_start, align 8, !tbaa !54
  %sub.i = fsub double %53, %54
  %call.i113 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #15
  %55 = load ptr, ptr %w_gpu, align 8, !tbaa !47
  %call46 = call i32 @cudaMemcpy(ptr noundef %w_outputFromGpu, ptr noundef %55, i64 noundef 16384, i32 noundef 2) #15
  %56 = load ptr, ptr %A_gpu, align 8, !tbaa !47
  %call47 = call i32 @cudaFree(ptr noundef %56) #15
  %57 = load ptr, ptr %x_gpu, align 8, !tbaa !47
  %call48 = call i32 @cudaFree(ptr noundef %57) #15
  %58 = load ptr, ptr %y_gpu, align 8, !tbaa !47
  %call49 = call i32 @cudaFree(ptr noundef %58) #15
  %59 = load ptr, ptr %z_gpu, align 8, !tbaa !47
  %call50 = call i32 @cudaFree(ptr noundef %59) #15
  %60 = load ptr, ptr %w_gpu, align 8, !tbaa !47
  %call51 = call i32 @cudaFree(ptr noundef %60) #15
  %61 = load ptr, ptr %v1_gpu, align 8, !tbaa !47
  %call52 = call i32 @cudaFree(ptr noundef %61) #15
  %62 = load ptr, ptr %v2_gpu, align 8, !tbaa !47
  %call53 = call i32 @cudaFree(ptr noundef %62) #15
  %63 = load ptr, ptr %u1_gpu, align 8, !tbaa !47
  %call54 = call i32 @cudaFree(ptr noundef %63) #15
  %64 = load ptr, ptr %u2_gpu, align 8, !tbaa !47
  %call55 = call i32 @cudaFree(ptr noundef %64) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %w_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %u2_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %u1_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %v2_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %v1_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %z_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %y_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %x_gpu) #16
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !50
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !53
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #16
  store double %2, ptr @polybench_t_start, align 8, !tbaa !54
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !50
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !53
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #16
  store double %2, ptr @polybench_t_end, align 8, !tbaa !54
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !54
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !54
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #15
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #9 {
entry:
  %Tp.i.i144 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i129 = alloca ptr, align 8
  %newA.i.i122 = alloca ptr, align 8
  %newA.i.i115 = alloca ptr, align 8
  %newA.i.i108 = alloca ptr, align 8
  %newA.i.i101 = alloca ptr, align 8
  %newA.i.i94 = alloca ptr, align 8
  %newA.i.i87 = alloca ptr, align 8
  %newA.i.i80 = alloca ptr, align 8
  %newA.i.i73 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #16
  store ptr null, ptr %newA.i.i, align 8, !tbaa !59
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 67108864) #17
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !59
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !60
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i73) #16
  store ptr null, ptr %newA.i.i73, align 8, !tbaa !59
  %call.i.i74 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i73, i64 noundef 32, i64 noundef 16384) #17
  %3 = load ptr, ptr %newA.i.i73, align 8, !tbaa !59
  %tobool.i.i75 = icmp eq ptr %3, null
  %tobool1.i.i76 = icmp ne i32 %call.i.i74, 0
  %or.cond.i.i77 = select i1 %tobool.i.i75, i1 true, i1 %tobool1.i.i76
  br i1 %or.cond.i.i77, label %if.then.i.i78, label %_Z20polybench_alloc_datayi.exit79

if.then.i.i78:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !60
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit79:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i73) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i80) #16
  store ptr null, ptr %newA.i.i80, align 8, !tbaa !59
  %call.i.i81 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i80, i64 noundef 32, i64 noundef 16384) #17
  %6 = load ptr, ptr %newA.i.i80, align 8, !tbaa !59
  %tobool.i.i82 = icmp eq ptr %6, null
  %tobool1.i.i83 = icmp ne i32 %call.i.i81, 0
  %or.cond.i.i84 = select i1 %tobool.i.i82, i1 true, i1 %tobool1.i.i83
  br i1 %or.cond.i.i84, label %if.then.i.i85, label %_Z20polybench_alloc_datayi.exit86

if.then.i.i85:                                    ; preds = %_Z20polybench_alloc_datayi.exit79
  %7 = load ptr, ptr @stderr, align 8, !tbaa !60
  %8 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %7) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit86:                ; preds = %_Z20polybench_alloc_datayi.exit79
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i80) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i87) #16
  store ptr null, ptr %newA.i.i87, align 8, !tbaa !59
  %call.i.i88 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i87, i64 noundef 32, i64 noundef 16384) #17
  %9 = load ptr, ptr %newA.i.i87, align 8, !tbaa !59
  %tobool.i.i89 = icmp eq ptr %9, null
  %tobool1.i.i90 = icmp ne i32 %call.i.i88, 0
  %or.cond.i.i91 = select i1 %tobool.i.i89, i1 true, i1 %tobool1.i.i90
  br i1 %or.cond.i.i91, label %if.then.i.i92, label %_Z20polybench_alloc_datayi.exit93

if.then.i.i92:                                    ; preds = %_Z20polybench_alloc_datayi.exit86
  %10 = load ptr, ptr @stderr, align 8, !tbaa !60
  %11 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %10) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit93:                ; preds = %_Z20polybench_alloc_datayi.exit86
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i87) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i94) #16
  store ptr null, ptr %newA.i.i94, align 8, !tbaa !59
  %call.i.i95 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i94, i64 noundef 32, i64 noundef 16384) #17
  %12 = load ptr, ptr %newA.i.i94, align 8, !tbaa !59
  %tobool.i.i96 = icmp eq ptr %12, null
  %tobool1.i.i97 = icmp ne i32 %call.i.i95, 0
  %or.cond.i.i98 = select i1 %tobool.i.i96, i1 true, i1 %tobool1.i.i97
  br i1 %or.cond.i.i98, label %if.then.i.i99, label %_Z20polybench_alloc_datayi.exit100

if.then.i.i99:                                    ; preds = %_Z20polybench_alloc_datayi.exit93
  %13 = load ptr, ptr @stderr, align 8, !tbaa !60
  %14 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %13) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit100:               ; preds = %_Z20polybench_alloc_datayi.exit93
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i94) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i101) #16
  store ptr null, ptr %newA.i.i101, align 8, !tbaa !59
  %call.i.i102 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i101, i64 noundef 32, i64 noundef 16384) #17
  %15 = load ptr, ptr %newA.i.i101, align 8, !tbaa !59
  %tobool.i.i103 = icmp eq ptr %15, null
  %tobool1.i.i104 = icmp ne i32 %call.i.i102, 0
  %or.cond.i.i105 = select i1 %tobool.i.i103, i1 true, i1 %tobool1.i.i104
  br i1 %or.cond.i.i105, label %if.then.i.i106, label %_Z20polybench_alloc_datayi.exit107

if.then.i.i106:                                   ; preds = %_Z20polybench_alloc_datayi.exit100
  %16 = load ptr, ptr @stderr, align 8, !tbaa !60
  %17 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %16) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit107:               ; preds = %_Z20polybench_alloc_datayi.exit100
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i101) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i108) #16
  store ptr null, ptr %newA.i.i108, align 8, !tbaa !59
  %call.i.i109 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i108, i64 noundef 32, i64 noundef 16384) #17
  %18 = load ptr, ptr %newA.i.i108, align 8, !tbaa !59
  %tobool.i.i110 = icmp eq ptr %18, null
  %tobool1.i.i111 = icmp ne i32 %call.i.i109, 0
  %or.cond.i.i112 = select i1 %tobool.i.i110, i1 true, i1 %tobool1.i.i111
  br i1 %or.cond.i.i112, label %if.then.i.i113, label %_Z20polybench_alloc_datayi.exit114

if.then.i.i113:                                   ; preds = %_Z20polybench_alloc_datayi.exit107
  %19 = load ptr, ptr @stderr, align 8, !tbaa !60
  %20 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %19) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit114:               ; preds = %_Z20polybench_alloc_datayi.exit107
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i108) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i115) #16
  store ptr null, ptr %newA.i.i115, align 8, !tbaa !59
  %call.i.i116 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i115, i64 noundef 32, i64 noundef 16384) #17
  %21 = load ptr, ptr %newA.i.i115, align 8, !tbaa !59
  %tobool.i.i117 = icmp eq ptr %21, null
  %tobool1.i.i118 = icmp ne i32 %call.i.i116, 0
  %or.cond.i.i119 = select i1 %tobool.i.i117, i1 true, i1 %tobool1.i.i118
  br i1 %or.cond.i.i119, label %if.then.i.i120, label %_Z20polybench_alloc_datayi.exit121

if.then.i.i120:                                   ; preds = %_Z20polybench_alloc_datayi.exit114
  %22 = load ptr, ptr @stderr, align 8, !tbaa !60
  %23 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %22) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit121:               ; preds = %_Z20polybench_alloc_datayi.exit114
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i115) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i122) #16
  store ptr null, ptr %newA.i.i122, align 8, !tbaa !59
  %call.i.i123 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i122, i64 noundef 32, i64 noundef 16384) #17
  %24 = load ptr, ptr %newA.i.i122, align 8, !tbaa !59
  %tobool.i.i124 = icmp eq ptr %24, null
  %tobool1.i.i125 = icmp ne i32 %call.i.i123, 0
  %or.cond.i.i126 = select i1 %tobool.i.i124, i1 true, i1 %tobool1.i.i125
  br i1 %or.cond.i.i126, label %if.then.i.i127, label %_Z20polybench_alloc_datayi.exit128

if.then.i.i127:                                   ; preds = %_Z20polybench_alloc_datayi.exit121
  %25 = load ptr, ptr @stderr, align 8, !tbaa !60
  %26 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %25) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit128:               ; preds = %_Z20polybench_alloc_datayi.exit121
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i122) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i129) #16
  store ptr null, ptr %newA.i.i129, align 8, !tbaa !59
  %call.i.i130 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i129, i64 noundef 32, i64 noundef 16384) #17
  %27 = load ptr, ptr %newA.i.i129, align 8, !tbaa !59
  %tobool.i.i131 = icmp eq ptr %27, null
  %tobool1.i.i132 = icmp ne i32 %call.i.i130, 0
  %or.cond.i.i133 = select i1 %tobool.i.i131, i1 true, i1 %tobool1.i.i132
  br i1 %or.cond.i.i133, label %if.then.i.i134, label %_Z20polybench_alloc_datayi.exit135

if.then.i.i134:                                   ; preds = %_Z20polybench_alloc_datayi.exit128
  %28 = load ptr, ptr @stderr, align 8, !tbaa !60
  %29 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %28) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit135:               ; preds = %_Z20polybench_alloc_datayi.exit128
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i129) #16
  br label %for.body.i

for.body.i:                                       ; preds = %middle.block, %_Z20polybench_alloc_datayi.exit135
  %indvars.iv75.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit135 ], [ %indvars.iv.next76.i, %middle.block ]
  %30 = trunc nuw nsw i64 %indvars.iv75.i to i32
  %conv.i = uitofp nneg i32 %30 to float
  %arrayidx.i = getelementptr inbounds nuw [4 x i8], ptr %3, i64 %indvars.iv75.i
  store float %conv.i, ptr %arrayidx.i, align 4, !tbaa !10
  %indvars.iv.next76.i = add nuw nsw i64 %indvars.iv75.i, 1
  %31 = trunc nuw nsw i64 %indvars.iv.next76.i to i32
  %div71.i = lshr i32 %31, 12
  %32 = uitofp nneg i32 %div71.i to float
  %conv3.i = fmul nnan float %32, 5.000000e-01
  %arrayidx5.i = getelementptr inbounds nuw [4 x i8], ptr %9, i64 %indvars.iv75.i
  store float %conv3.i, ptr %arrayidx5.i, align 4, !tbaa !10
  %conv10.i = fmul nnan float %32, 2.500000e-01
  %arrayidx12.i = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv75.i
  store float %conv10.i, ptr %arrayidx12.i, align 4, !tbaa !10
  %arrayidx19.i = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %indvars.iv75.i
  %conv24.i = fmul nnan float %32, 1.250000e-01
  %arrayidx26.i = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %indvars.iv75.i
  %33 = insertelement <2 x float> poison, float %32, i64 0
  %34 = shufflevector <2 x float> %33, <2 x float> poison, <2 x i32> zeroinitializer
  %35 = fdiv <2 x float> %34, <float 6.000000e+00, float 9.000000e+00>
  %36 = extractelement <2 x float> %35, i64 0
  store float %36, ptr %arrayidx19.i, align 4, !tbaa !10
  store float %conv24.i, ptr %arrayidx26.i, align 4, !tbaa !10
  %arrayidx33.i = getelementptr inbounds nuw [4 x i8], ptr %27, i64 %indvars.iv75.i
  %37 = extractelement <2 x float> %35, i64 1
  store float %37, ptr %arrayidx33.i, align 4, !tbaa !10
  %arrayidx35.i = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %indvars.iv75.i
  store float 0.000000e+00, ptr %arrayidx35.i, align 4, !tbaa !10
  %arrayidx37.i = getelementptr inbounds nuw [4 x i8], ptr %15, i64 %indvars.iv75.i
  store float 0.000000e+00, ptr %arrayidx37.i, align 4, !tbaa !10
  %arrayidx45.i = getelementptr inbounds nuw [16384 x i8], ptr %0, i64 %indvars.iv75.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body.i
  %index = phi i64 [ 0, %for.body.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.body.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %38 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %39 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %40 = fmul nnan <4 x float> %broadcast.splat, %38
  %41 = fmul nnan <4 x float> %broadcast.splat, %39
  %42 = fmul nnan <4 x float> %40, splat (float f0x39800000)
  %43 = fmul nnan <4 x float> %41, splat (float f0x39800000)
  %44 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx45.i, i64 %index
  %45 = getelementptr inbounds nuw i8, ptr %44, i64 16
  store <4 x float> %42, ptr %44, align 4, !tbaa !10
  store <4 x float> %43, ptr %45, align 4, !tbaa !10
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %46 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %47 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %48 = fmul nnan <4 x float> %broadcast.splat, %46
  %49 = fmul nnan <4 x float> %broadcast.splat, %47
  %50 = fmul nnan <4 x float> %48, splat (float f0x39800000)
  %51 = fmul nnan <4 x float> %49, splat (float f0x39800000)
  %52 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx45.i, i64 %index
  %53 = getelementptr inbounds nuw i8, ptr %52, i64 32
  %54 = getelementptr inbounds nuw i8, ptr %52, i64 48
  store <4 x float> %50, ptr %53, align 4, !tbaa !10
  store <4 x float> %51, ptr %54, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %55 = icmp eq i64 %index.next.1, 4096
  br i1 %55, label %middle.block, label %vector.body, !llvm.loop !62

middle.block:                                     ; preds = %vector.body
  %exitcond78.not.i = icmp eq i64 %indvars.iv.next76.i, 4096
  br i1 %exitcond78.not.i, label %_Z4initiPfS_PA4096_fS_S_S_S_S_S_S_S_.exit, label %for.body.i, !llvm.loop !44

_Z4initiPfS_PA4096_fS_S_S_S_S_S_S_S_.exit:        ; preds = %middle.block
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #16
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #15
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #15
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #16
  call void @_Z10gemverCudaiffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_S1_(i32 noundef 4096, float noundef 4.353200e+04, float noundef 1.231300e+04, ptr noundef nonnull %0, ptr noundef nonnull %3, ptr noundef nonnull %6, ptr noundef nonnull %9, ptr noundef nonnull %12, ptr noundef nonnull %15, ptr noundef nonnull %18, ptr noundef nonnull %21, ptr noundef nonnull %24, ptr noundef nonnull %27) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #16
  %call.i.i136 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i136, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i137

if.then.i.i137:                                   ; preds = %_Z4initiPfS_PA4096_fS_S_S_S_S_S_S_S_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i136) #15
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z4initiPfS_PA4096_fS_S_S_S_S_S_S_S_.exit, %if.then.i.i137
  %56 = load i64, ptr %Tp.i.i, align 8, !tbaa !50
  %conv.i.i = sitofp i64 %56 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %57 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !53
  %conv2.i.i = sitofp i64 %57 to double
  %58 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #16
  store double %58, ptr @polybench_t_start, align 8, !tbaa !54
  %scevgep = getelementptr i8, ptr %0, i64 67108864
  %59 = insertelement <4 x ptr> poison, ptr %3, i64 0
  %60 = insertelement <4 x ptr> %59, ptr %6, i64 1
  %61 = insertelement <4 x ptr> %60, ptr %9, i64 2
  %62 = insertelement <4 x ptr> %61, ptr %12, i64 3
  %63 = getelementptr i8, <4 x ptr> %62, i64 16384
  %64 = insertelement <4 x ptr> poison, ptr %0, i64 0
  %65 = shufflevector <4 x ptr> %64, <4 x ptr> poison, <4 x i32> zeroinitializer
  %66 = insertelement <4 x ptr> poison, ptr %scevgep, i64 0
  %67 = shufflevector <4 x ptr> %66, <4 x ptr> poison, <4 x i32> zeroinitializer
  %68 = icmp ult <4 x ptr> %65, %63
  %69 = icmp ult <4 x ptr> %62, %67
  %70 = and <4 x i1> %68, %69
  %71 = bitcast <4 x i1> %70 to i4
  %.not = icmp eq i4 %71, 0
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc18_crit_edge.i, %_Z21polybench_timer_startv.exit
  %indvars.iv142.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next143.i, %for.cond1.for.inc18_crit_edge.i ]
  %arrayidx.i138 = getelementptr inbounds nuw [16384 x i8], ptr %0, i64 %indvars.iv142.i
  %arrayidx7.i = getelementptr inbounds nuw [4 x i8], ptr %3, i64 %indvars.iv142.i
  %arrayidx11.i = getelementptr inbounds nuw [4 x i8], ptr %9, i64 %indvars.iv142.i
  br i1 %.not, label %vector.ph186, label %for.body3.i

vector.ph186:                                     ; preds = %for.cond1.preheader.i
  %72 = load float, ptr %arrayidx7.i, align 4, !tbaa !10, !alias.scope !63
  %broadcast.splatinsert192 = insertelement <4 x float> poison, float %72, i64 0
  %broadcast.splat193 = shufflevector <4 x float> %broadcast.splatinsert192, <4 x float> poison, <4 x i32> zeroinitializer
  %73 = load float, ptr %arrayidx11.i, align 4, !tbaa !10, !alias.scope !66
  %broadcast.splatinsert196 = insertelement <4 x float> poison, float %73, i64 0
  %broadcast.splat197 = shufflevector <4 x float> %broadcast.splatinsert196, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body187

vector.body187:                                   ; preds = %vector.body187, %vector.ph186
  %index188 = phi i64 [ 0, %vector.ph186 ], [ %index.next198, %vector.body187 ]
  %74 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i138, i64 %index188
  %75 = getelementptr inbounds nuw i8, ptr %74, i64 16
  %wide.load = load <4 x float>, ptr %74, align 4, !tbaa !10, !alias.scope !68, !noalias !70
  %wide.load189 = load <4 x float>, ptr %75, align 4, !tbaa !10, !alias.scope !68, !noalias !70
  %76 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %index188
  %77 = getelementptr inbounds nuw i8, ptr %76, i64 16
  %wide.load190 = load <4 x float>, ptr %76, align 4, !tbaa !10, !alias.scope !73
  %wide.load191 = load <4 x float>, ptr %77, align 4, !tbaa !10, !alias.scope !73
  %78 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat193, <4 x float> %wide.load190, <4 x float> %wide.load)
  %79 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat193, <4 x float> %wide.load191, <4 x float> %wide.load189)
  %80 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %index188
  %81 = getelementptr inbounds nuw i8, ptr %80, i64 16
  %wide.load194 = load <4 x float>, ptr %80, align 4, !tbaa !10, !alias.scope !74
  %wide.load195 = load <4 x float>, ptr %81, align 4, !tbaa !10, !alias.scope !74
  %82 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat197, <4 x float> %wide.load194, <4 x float> %78)
  %83 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat197, <4 x float> %wide.load195, <4 x float> %79)
  store <4 x float> %82, ptr %74, align 4, !tbaa !10, !alias.scope !68, !noalias !70
  store <4 x float> %83, ptr %75, align 4, !tbaa !10, !alias.scope !68, !noalias !70
  %index.next198 = add nuw i64 %index188, 8
  %84 = icmp eq i64 %index.next198, 4096
  br i1 %84, label %for.cond1.for.inc18_crit_edge.i, label %vector.body187, !llvm.loop !75

for.body3.i:                                      ; preds = %for.cond1.preheader.i, %for.body3.i
  %indvars.iv.i139 = phi i64 [ %indvars.iv.next.i141.1, %for.body3.i ], [ 0, %for.cond1.preheader.i ]
  %arrayidx5.i140 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i138, i64 %indvars.iv.i139
  %85 = load float, ptr %arrayidx5.i140, align 4, !tbaa !10
  %86 = load float, ptr %arrayidx7.i, align 4, !tbaa !10
  %arrayidx9.i = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv.i139
  %87 = load float, ptr %arrayidx9.i, align 4, !tbaa !10
  %88 = call float @llvm.fmuladd.f32(float %86, float %87, float %85)
  %89 = load float, ptr %arrayidx11.i, align 4, !tbaa !10
  %arrayidx13.i = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %indvars.iv.i139
  %90 = load float, ptr %arrayidx13.i, align 4, !tbaa !10
  %91 = call float @llvm.fmuladd.f32(float %89, float %90, float %88)
  store float %91, ptr %arrayidx5.i140, align 4, !tbaa !10
  %indvars.iv.next.i141 = or disjoint i64 %indvars.iv.i139, 1
  %arrayidx5.i140.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i138, i64 %indvars.iv.next.i141
  %92 = load float, ptr %arrayidx5.i140.1, align 4, !tbaa !10
  %93 = load float, ptr %arrayidx7.i, align 4, !tbaa !10
  %arrayidx9.i.1 = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv.next.i141
  %94 = load float, ptr %arrayidx9.i.1, align 4, !tbaa !10
  %95 = call float @llvm.fmuladd.f32(float %93, float %94, float %92)
  %96 = load float, ptr %arrayidx11.i, align 4, !tbaa !10
  %arrayidx13.i.1 = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %indvars.iv.next.i141
  %97 = load float, ptr %arrayidx13.i.1, align 4, !tbaa !10
  %98 = call float @llvm.fmuladd.f32(float %96, float %97, float %95)
  store float %98, ptr %arrayidx5.i140.1, align 4, !tbaa !10
  %indvars.iv.next.i141.1 = add nuw nsw i64 %indvars.iv.i139, 2
  %exitcond.not.i142.1 = icmp eq i64 %indvars.iv.next.i141.1, 4096
  br i1 %exitcond.not.i142.1, label %for.cond1.for.inc18_crit_edge.i, label %for.body3.i, !llvm.loop !76

for.cond1.for.inc18_crit_edge.i:                  ; preds = %vector.body187, %for.body3.i
  %indvars.iv.next143.i = add nuw nsw i64 %indvars.iv142.i, 1
  %exitcond146.not.i = icmp eq i64 %indvars.iv.next143.i, 4096
  br i1 %exitcond146.not.i, label %for.cond24.preheader.i, label %for.cond1.preheader.i, !llvm.loop !29

for.cond24.preheader.i:                           ; preds = %for.cond1.for.inc18_crit_edge.i, %for.cond24.for.inc41_crit_edge.i
  %indvars.iv152.i = phi i64 [ %indvars.iv.next153.i, %for.cond24.for.inc41_crit_edge.i ], [ 0, %for.cond1.for.inc18_crit_edge.i ]
  %arrayidx28.i = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %indvars.iv152.i
  %invariant.gep.i = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %indvars.iv152.i
  %arrayidx28.promoted.i = load float, ptr %arrayidx28.i, align 4, !tbaa !10
  br label %for.body26.i

for.body26.i:                                     ; preds = %for.body26.i, %for.cond24.preheader.i
  %indvars.iv147.i = phi i64 [ 0, %for.cond24.preheader.i ], [ %indvars.iv.next148.i.1, %for.body26.i ]
  %99 = phi float [ %arrayidx28.promoted.i, %for.cond24.preheader.i ], [ %105, %for.body26.i ]
  %gep.i = getelementptr inbounds nuw [16384 x i8], ptr %invariant.gep.i, i64 %indvars.iv147.i
  %100 = load float, ptr %gep.i, align 4, !tbaa !10
  %mul.i143 = fmul float %100, 1.231300e+04
  %arrayidx34.i = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %indvars.iv147.i
  %101 = load float, ptr %arrayidx34.i, align 4, !tbaa !10
  %102 = call float @llvm.fmuladd.f32(float %mul.i143, float %101, float %99)
  store float %102, ptr %arrayidx28.i, align 4, !tbaa !10
  %indvars.iv.next148.i = or disjoint i64 %indvars.iv147.i, 1
  %gep.i.1 = getelementptr inbounds nuw [16384 x i8], ptr %invariant.gep.i, i64 %indvars.iv.next148.i
  %103 = load float, ptr %gep.i.1, align 4, !tbaa !10
  %mul.i143.1 = fmul float %103, 1.231300e+04
  %arrayidx34.i.1 = getelementptr inbounds nuw [4 x i8], ptr %24, i64 %indvars.iv.next148.i
  %104 = load float, ptr %arrayidx34.i.1, align 4, !tbaa !10
  %105 = call float @llvm.fmuladd.f32(float %mul.i143.1, float %104, float %102)
  store float %105, ptr %arrayidx28.i, align 4, !tbaa !10
  %indvars.iv.next148.i.1 = add nuw nsw i64 %indvars.iv147.i, 2
  %exitcond151.not.i.1 = icmp eq i64 %indvars.iv.next148.i.1, 4096
  br i1 %exitcond151.not.i.1, label %for.cond24.for.inc41_crit_edge.i, label %for.body26.i, !llvm.loop !38

for.cond24.for.inc41_crit_edge.i:                 ; preds = %for.body26.i
  %indvars.iv.next153.i = add nuw nsw i64 %indvars.iv152.i, 1
  %exitcond156.not.i = icmp eq i64 %indvars.iv.next153.i, 4096
  br i1 %exitcond156.not.i, label %vector.memcheck200, label %for.cond24.preheader.i, !llvm.loop !39

vector.memcheck200:                               ; preds = %for.cond24.for.inc41_crit_edge.i
  %scevgep201 = getelementptr i8, ptr %21, i64 16384
  %scevgep202 = getelementptr i8, ptr %27, i64 16384
  %bound0203 = icmp ult ptr %21, %scevgep202
  %bound1204 = icmp ult ptr %27, %scevgep201
  %found.conflict205 = and i1 %bound0203, %bound1204
  br i1 %found.conflict205, label %for.body46.i, label %vector.body208

vector.body208:                                   ; preds = %vector.memcheck200, %vector.body208
  %index209 = phi i64 [ %index.next214.1, %vector.body208 ], [ 0, %vector.memcheck200 ]
  %106 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %index209
  %107 = getelementptr inbounds nuw i8, ptr %106, i64 16
  %wide.load210 = load <4 x float>, ptr %106, align 4, !tbaa !10, !alias.scope !77, !noalias !80
  %wide.load211 = load <4 x float>, ptr %107, align 4, !tbaa !10, !alias.scope !77, !noalias !80
  %108 = getelementptr inbounds nuw [4 x i8], ptr %27, i64 %index209
  %109 = getelementptr inbounds nuw i8, ptr %108, i64 16
  %wide.load212 = load <4 x float>, ptr %108, align 4, !tbaa !10, !alias.scope !80
  %wide.load213 = load <4 x float>, ptr %109, align 4, !tbaa !10, !alias.scope !80
  %110 = fadd <4 x float> %wide.load210, %wide.load212
  %111 = fadd <4 x float> %wide.load211, %wide.load213
  store <4 x float> %110, ptr %106, align 4, !tbaa !10, !alias.scope !77, !noalias !80
  store <4 x float> %111, ptr %107, align 4, !tbaa !10, !alias.scope !77, !noalias !80
  %index.next214 = or disjoint i64 %index209, 8
  %112 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %index.next214
  %113 = getelementptr inbounds nuw i8, ptr %112, i64 16
  %wide.load210.1 = load <4 x float>, ptr %112, align 4, !tbaa !10, !alias.scope !77, !noalias !80
  %wide.load211.1 = load <4 x float>, ptr %113, align 4, !tbaa !10, !alias.scope !77, !noalias !80
  %114 = getelementptr inbounds nuw [4 x i8], ptr %27, i64 %index.next214
  %115 = getelementptr inbounds nuw i8, ptr %114, i64 16
  %wide.load212.1 = load <4 x float>, ptr %114, align 4, !tbaa !10, !alias.scope !80
  %wide.load213.1 = load <4 x float>, ptr %115, align 4, !tbaa !10, !alias.scope !80
  %116 = fadd <4 x float> %wide.load210.1, %wide.load212.1
  %117 = fadd <4 x float> %wide.load211.1, %wide.load213.1
  store <4 x float> %116, ptr %112, align 4, !tbaa !10, !alias.scope !77, !noalias !80
  store <4 x float> %117, ptr %113, align 4, !tbaa !10, !alias.scope !77, !noalias !80
  %index.next214.1 = add nuw nsw i64 %index209, 16
  %118 = icmp eq i64 %index.next214.1, 4096
  br i1 %118, label %for.cond59.preheader.i.preheader, label %vector.body208, !llvm.loop !82

for.body46.i:                                     ; preds = %vector.memcheck200, %for.body46.i
  %indvars.iv157.i = phi i64 [ %indvars.iv.next158.i.3, %for.body46.i ], [ 0, %vector.memcheck200 ]
  %arrayidx48.i = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %indvars.iv157.i
  %119 = load float, ptr %arrayidx48.i, align 4, !tbaa !10
  %arrayidx50.i = getelementptr inbounds nuw [4 x i8], ptr %27, i64 %indvars.iv157.i
  %120 = load float, ptr %arrayidx50.i, align 4, !tbaa !10
  %add.i = fadd float %119, %120
  store float %add.i, ptr %arrayidx48.i, align 4, !tbaa !10
  %indvars.iv.next158.i = or disjoint i64 %indvars.iv157.i, 1
  %arrayidx48.i.1 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %indvars.iv.next158.i
  %121 = load float, ptr %arrayidx48.i.1, align 4, !tbaa !10
  %arrayidx50.i.1 = getelementptr inbounds nuw [4 x i8], ptr %27, i64 %indvars.iv.next158.i
  %122 = load float, ptr %arrayidx50.i.1, align 4, !tbaa !10
  %add.i.1 = fadd float %121, %122
  store float %add.i.1, ptr %arrayidx48.i.1, align 4, !tbaa !10
  %indvars.iv.next158.i.1 = or disjoint i64 %indvars.iv157.i, 2
  %arrayidx48.i.2 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %indvars.iv.next158.i.1
  %123 = load float, ptr %arrayidx48.i.2, align 4, !tbaa !10
  %arrayidx50.i.2 = getelementptr inbounds nuw [4 x i8], ptr %27, i64 %indvars.iv.next158.i.1
  %124 = load float, ptr %arrayidx50.i.2, align 4, !tbaa !10
  %add.i.2 = fadd float %123, %124
  store float %add.i.2, ptr %arrayidx48.i.2, align 4, !tbaa !10
  %indvars.iv.next158.i.2 = or disjoint i64 %indvars.iv157.i, 3
  %arrayidx48.i.3 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %indvars.iv.next158.i.2
  %125 = load float, ptr %arrayidx48.i.3, align 4, !tbaa !10
  %arrayidx50.i.3 = getelementptr inbounds nuw [4 x i8], ptr %27, i64 %indvars.iv.next158.i.2
  %126 = load float, ptr %arrayidx50.i.3, align 4, !tbaa !10
  %add.i.3 = fadd float %125, %126
  store float %add.i.3, ptr %arrayidx48.i.3, align 4, !tbaa !10
  %indvars.iv.next158.i.3 = add nuw nsw i64 %indvars.iv157.i, 4
  %exitcond161.not.i.3 = icmp eq i64 %indvars.iv.next158.i.3, 4096
  br i1 %exitcond161.not.i.3, label %for.cond59.preheader.i.preheader, label %for.body46.i, !llvm.loop !83

for.cond59.preheader.i.preheader:                 ; preds = %vector.body208, %for.body46.i
  br label %for.cond59.preheader.i

for.cond59.preheader.i:                           ; preds = %for.cond59.preheader.i.preheader, %for.cond59.for.inc77_crit_edge.i
  %indvars.iv167.i = phi i64 [ %indvars.iv.next168.i, %for.cond59.for.inc77_crit_edge.i ], [ 0, %for.cond59.preheader.i.preheader ]
  %arrayidx63.i = getelementptr inbounds nuw [4 x i8], ptr %15, i64 %indvars.iv167.i
  %arrayidx65.i = getelementptr inbounds nuw [16384 x i8], ptr %0, i64 %indvars.iv167.i
  %arrayidx63.promoted.i = load float, ptr %arrayidx63.i, align 4, !tbaa !10
  br label %for.body61.i

for.body61.i:                                     ; preds = %for.body61.i, %for.cond59.preheader.i
  %indvars.iv162.i = phi i64 [ 0, %for.cond59.preheader.i ], [ %indvars.iv.next163.i.1, %for.body61.i ]
  %127 = phi float [ %arrayidx63.promoted.i, %for.cond59.preheader.i ], [ %133, %for.body61.i ]
  %arrayidx67.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx65.i, i64 %indvars.iv162.i
  %128 = load float, ptr %arrayidx67.i, align 4, !tbaa !10
  %mul68.i = fmul float %128, 4.353200e+04
  %arrayidx70.i = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %indvars.iv162.i
  %129 = load float, ptr %arrayidx70.i, align 4, !tbaa !10
  %130 = call float @llvm.fmuladd.f32(float %mul68.i, float %129, float %127)
  store float %130, ptr %arrayidx63.i, align 4, !tbaa !10
  %indvars.iv.next163.i = or disjoint i64 %indvars.iv162.i, 1
  %arrayidx67.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx65.i, i64 %indvars.iv.next163.i
  %131 = load float, ptr %arrayidx67.i.1, align 4, !tbaa !10
  %mul68.i.1 = fmul float %131, 4.353200e+04
  %arrayidx70.i.1 = getelementptr inbounds nuw [4 x i8], ptr %21, i64 %indvars.iv.next163.i
  %132 = load float, ptr %arrayidx70.i.1, align 4, !tbaa !10
  %133 = call float @llvm.fmuladd.f32(float %mul68.i.1, float %132, float %130)
  store float %133, ptr %arrayidx63.i, align 4, !tbaa !10
  %indvars.iv.next163.i.1 = add nuw nsw i64 %indvars.iv162.i, 2
  %exitcond166.not.i.1 = icmp eq i64 %indvars.iv.next163.i.1, 4096
  br i1 %exitcond166.not.i.1, label %for.cond59.for.inc77_crit_edge.i, label %for.body61.i, !llvm.loop !41

for.cond59.for.inc77_crit_edge.i:                 ; preds = %for.body61.i
  %indvars.iv.next168.i = add nuw nsw i64 %indvars.iv167.i, 1
  %exitcond171.not.i = icmp eq i64 %indvars.iv.next168.i, 4096
  br i1 %exitcond171.not.i, label %_Z6gemveriffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_.exit, label %for.cond59.preheader.i, !llvm.loop !42

_Z6gemveriffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_.exit: ; preds = %for.cond59.for.inc77_crit_edge.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i144) #16
  %call.i.i145 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i144, ptr noundef null) #17
  %cmp.not.i.i146 = icmp eq i32 %call.i.i145, 0
  br i1 %cmp.not.i.i146, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i147

if.then.i.i147:                                   ; preds = %_Z6gemveriffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_.exit
  %call1.i.i148 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i145) #15
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z6gemveriffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_.exit, %if.then.i.i147
  %134 = load i64, ptr %Tp.i.i144, align 8, !tbaa !50
  %conv.i.i149 = sitofp i64 %134 to double
  %tv_usec.i.i150 = getelementptr inbounds nuw i8, ptr %Tp.i.i144, i64 8
  %135 = load i64, ptr %tv_usec.i.i150, align 8, !tbaa !53
  %conv2.i.i151 = sitofp i64 %135 to double
  %136 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i151, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i149)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i144) #16
  store double %136, ptr @polybench_t_end, align 8, !tbaa !54
  %137 = load double, ptr @polybench_t_start, align 8, !tbaa !54
  %sub.i = fsub double %136, %137
  %call.i152 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #15
  br label %vector.body218

vector.body218:                                   ; preds = %vector.body218, %_Z20polybench_timer_stopv.exit
  %index219 = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %index.next222, %vector.body218 ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %_Z20polybench_timer_stopv.exit ], [ %169, %vector.body218 ]
  %138 = getelementptr inbounds nuw [4 x i8], ptr %15, i64 %index219
  %wide.load220 = load <4 x float>, ptr %138, align 4, !tbaa !10
  %139 = fpext <4 x float> %wide.load220 to <4 x double>
  %140 = getelementptr inbounds nuw [4 x i8], ptr %18, i64 %index219
  %wide.load221 = load <4 x float>, ptr %140, align 4, !tbaa !10
  %141 = fpext <4 x float> %wide.load221 to <4 x double>
  %142 = fcmp olt <4 x double> %139, splat (double f0xB690000000000000)
  %143 = fneg <4 x float> %wide.load220
  %144 = select <4 x i1> %142, <4 x float> %143, <4 x float> %wide.load220
  %145 = fpext <4 x float> %144 to <4 x double>
  %146 = fcmp uge <4 x double> %145, splat (double 1.000000e-02)
  %147 = fcmp olt <4 x double> %141, splat (double f0xB690000000000000)
  %148 = fneg <4 x float> %wide.load221
  %149 = select <4 x i1> %147, <4 x float> %148, <4 x float> %wide.load221
  %150 = fpext <4 x float> %149 to <4 x double>
  %151 = fcmp uge <4 x double> %150, splat (double 1.000000e-02)
  %152 = fsub <4 x double> %139, %141
  %153 = fptrunc <4 x double> %152 to <4 x float>
  %154 = fcmp olt <4 x double> %152, splat (double f0xB690000000000000)
  %155 = fneg <4 x float> %153
  %156 = select <4 x i1> %154, <4 x float> %155, <4 x float> %153
  %157 = fadd <4 x double> %139, splat (double f0x3E45798EE0000000)
  %158 = fptrunc <4 x double> %157 to <4 x float>
  %159 = fcmp olt <4 x double> %157, splat (double f0xB690000000000000)
  %160 = fneg <4 x float> %158
  %161 = select <4 x i1> %159, <4 x float> %160, <4 x float> %158
  %162 = fdiv <4 x float> %156, %161
  %163 = fcmp olt <4 x float> %162, zeroinitializer
  %164 = fneg <4 x float> %162
  %165 = select <4 x i1> %163, <4 x float> %164, <4 x float> %162
  %166 = fmul <4 x float> %165, splat (float 1.000000e+02)
  %167 = fpext <4 x float> %166 to <4 x double>
  %168 = fcmp ogt <4 x double> %167, splat (double 5.000000e-02)
  %.not225 = select <4 x i1> %146, <4 x i1> splat (i1 true), <4 x i1> %151
  %narrow = select <4 x i1> %.not225, <4 x i1> %168, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %169 = add <4 x i32> %vec.phi, %predphi
  %index.next222 = add nuw i64 %index219, 4
  %170 = icmp eq i64 %index.next222, 4096
  br i1 %170, label %_Z14compareResultsiPfS_.exit, label %vector.body218, !llvm.loop !84

_Z14compareResultsiPfS_.exit:                     ; preds = %vector.body218
  %171 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %169)
  %call7.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %171) #15
  call void @free(ptr noundef %0) #17
  call void @free(ptr noundef nonnull %15) #17
  call void @free(ptr noundef nonnull %18) #17
  call void @free(ptr noundef %21) #17
  call void @free(ptr noundef %24) #17
  call void @free(ptr noundef %27) #17
  call void @free(ptr noundef %3) #17
  call void @free(ptr noundef %9) #17
  call void @free(ptr noundef %6) #17
  call void @free(ptr noundef %12) #17
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #16
  store ptr null, ptr %newA.i, align 8, !tbaa !59
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #17
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !59
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !60
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
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #13

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #14

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
attributes #14 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
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
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = !{!18}
!18 = distinct !{!18, !14}
!19 = !{!13, !20, !16, !21}
!20 = distinct !{!20, !14}
!21 = distinct !{!21, !14}
!22 = !{!20}
!23 = !{!21}
!24 = distinct !{!24, !25, !26, !27}
!25 = !{!"llvm.loop.mustprogress"}
!26 = !{!"llvm.loop.isvectorized", i32 1}
!27 = !{!"llvm.loop.unroll.runtime.disable"}
!28 = distinct !{!28, !25, !26}
!29 = distinct !{!29, !25}
!30 = !{!31}
!31 = distinct !{!31, !32}
!32 = distinct !{!32, !"LVerDomain"}
!33 = !{!34}
!34 = distinct !{!34, !32}
!35 = distinct !{!35, !25, !26, !27}
!36 = distinct !{!36, !37}
!37 = !{!"llvm.loop.unroll.disable"}
!38 = distinct !{!38, !25}
!39 = distinct !{!39, !25}
!40 = distinct !{!40, !25, !26}
!41 = distinct !{!41, !25}
!42 = distinct !{!42, !25}
!43 = distinct !{!43, !25, !26, !27}
!44 = distinct !{!44, !25}
!45 = distinct !{!45, !25, !26, !27}
!46 = !{!7, !7, i64 0}
!47 = !{!48, !48, i64 0}
!48 = !{!"p1 float", !49, i64 0}
!49 = !{!"any pointer", !8, i64 0}
!50 = !{!51, !52, i64 0}
!51 = !{!"_ZTS7timeval", !52, i64 0, !52, i64 8}
!52 = !{!"long", !8, i64 0}
!53 = !{!51, !52, i64 8}
!54 = !{!55, !55, i64 0}
!55 = !{!"double", !8, i64 0}
!56 = !{ptr @_Z29__device_stub__gemver_kernel1iffPfS_S_S_S_}
!57 = !{ptr @_Z29__device_stub__gemver_kernel2iffPfS_S_S_}
!58 = !{ptr @_Z29__device_stub__gemver_kernel3iffPfS_S_}
!59 = !{!49, !49, i64 0}
!60 = !{!61, !61, i64 0}
!61 = !{!"p1 _ZTS8_IO_FILE", !49, i64 0}
!62 = distinct !{!62, !25, !26, !27}
!63 = !{!64}
!64 = distinct !{!64, !65}
!65 = distinct !{!65, !"LVerDomain"}
!66 = !{!67}
!67 = distinct !{!67, !65}
!68 = !{!69}
!69 = distinct !{!69, !65}
!70 = !{!64, !71, !67, !72}
!71 = distinct !{!71, !65}
!72 = distinct !{!72, !65}
!73 = !{!71}
!74 = !{!72}
!75 = distinct !{!75, !25, !26, !27}
!76 = distinct !{!76, !25, !26}
!77 = !{!78}
!78 = distinct !{!78, !79}
!79 = distinct !{!79, !"LVerDomain"}
!80 = !{!81}
!81 = distinct !{!81, !79}
!82 = distinct !{!82, !25, !26, !27}
!83 = distinct !{!83, !25, !26}
!84 = distinct !{!84, !25, !26, !27}
