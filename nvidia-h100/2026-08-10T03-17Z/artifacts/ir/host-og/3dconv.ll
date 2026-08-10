; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/3DCONV/3DConvolution.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/3DCONV/3DConvolution.cu"
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
define dso_local void @_Z6conv3DiiiPA256_A256_fS1_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B) local_unnamed_addr #1 {
entry:
  %sub = add i32 %ni, -1
  %cmp229 = icmp sgt i32 %ni, 2
  br i1 %cmp229, label %for.cond1.preheader.lr.ph, label %for.end153

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp3227 = icmp slt i32 %nj, 3
  %cmp7225 = icmp slt i32 %nk, 3
  %brmerge = or i1 %cmp3227, %cmp7225
  br i1 %brmerge, label %for.end153, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %sub6 = add nsw i32 %nk, -1
  %sub2 = add nsw i32 %nj, -1
  %wide.trip.count243 = zext nneg i32 %sub to i64
  %wide.trip.count238 = zext i32 %sub2 to i64
  %wide.trip.count = zext i32 %sub6 to i64
  %0 = shl nuw nsw i64 %wide.trip.count238, 10
  %1 = shl nuw nsw i64 %wide.trip.count, 2
  %2 = add nuw nsw i64 %0, %1
  %3 = getelementptr i8, ptr %B, i64 %2
  %4 = getelementptr i8, ptr %3, i64 261120
  %5 = getelementptr i8, ptr %A, i64 %2
  %6 = getelementptr i8, ptr %5, i64 524292
  %7 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i64 %7, 4
  %n.vec = and i64 %7, -4
  %8 = or disjoint i64 %n.vec, 1
  %cmp.n = icmp eq i64 %7, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc151_crit_edge
  %indvar = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvar.next, %for.cond1.for.inc151_crit_edge ]
  %indvars.iv240 = phi i64 [ 1, %for.cond1.preheader.preheader ], [ %indvars.iv.next241, %for.cond1.for.inc151_crit_edge ]
  %9 = shl nuw nsw i64 %indvar, 18
  %10 = getelementptr i8, ptr %B, i64 %9
  %scevgep = getelementptr i8, ptr %10, i64 263172
  %scevgep245 = getelementptr i8, ptr %4, i64 %9
  %scevgep246 = getelementptr i8, ptr %A, i64 %9
  %scevgep247 = getelementptr i8, ptr %6, i64 %9
  %11 = getelementptr [262144 x i8], ptr %A, i64 %indvars.iv240
  %arrayidx = getelementptr i8, ptr %11, i64 -262144
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %11, i64 262144
  %arrayidx143 = getelementptr inbounds nuw [262144 x i8], ptr %B, i64 %indvars.iv240
  %bound0 = icmp ult ptr %scevgep, %scevgep247
  %bound1 = icmp ult ptr %scevgep246, %scevgep245
  %found.conflict = and i1 %bound0, %bound1
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond1.preheader, %for.cond5.for.inc148_crit_edge
  %indvars.iv234 = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next235, %for.cond5.for.inc148_crit_edge ]
  %12 = add nsw i64 %indvars.iv234, -1
  %arrayidx12 = getelementptr inbounds [1024 x i8], ptr %arrayidx, i64 %12
  %arrayidx20 = getelementptr inbounds [1024 x i8], ptr %arrayidx17, i64 %12
  %arrayidx66 = getelementptr inbounds [1024 x i8], ptr %11, i64 %12
  %arrayidx75 = getelementptr inbounds nuw [1024 x i8], ptr %11, i64 %indvars.iv234
  %indvars.iv.next235 = add nuw nsw i64 %indvars.iv234, 1
  %arrayidx84 = getelementptr inbounds nuw [1024 x i8], ptr %11, i64 %indvars.iv.next235
  %arrayidx111 = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx, i64 %indvars.iv234
  %arrayidx120 = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx17, i64 %indvars.iv234
  %arrayidx129 = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx, i64 %indvars.iv.next235
  %arrayidx138 = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx17, i64 %indvars.iv.next235
  %arrayidx145 = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx143, i64 %indvars.iv234
  %brmerge258 = select i1 %min.iters.check, i1 true, i1 %found.conflict
  br i1 %brmerge258, label %for.body8.preheader, label %vector.body

vector.body:                                      ; preds = %for.cond5.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.cond5.preheader ]
  %13 = or disjoint i64 %index, 1
  %14 = getelementptr inbounds [4 x i8], ptr %arrayidx12, i64 %index
  %wide.load = load <4 x float>, ptr %14, align 4, !tbaa !10, !alias.scope !12
  %15 = getelementptr inbounds [4 x i8], ptr %arrayidx20, i64 %index
  %wide.load248 = load <4 x float>, ptr %15, align 4, !tbaa !10, !alias.scope !12
  %16 = fmul <4 x float> %wide.load248, splat (float 4.000000e+00)
  %17 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load, <4 x float> splat (float 2.000000e+00), <4 x float> %16)
  %18 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load, <4 x float> splat (float 5.000000e+00), <4 x float> %17)
  %19 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load248, <4 x float> splat (float 7.000000e+00), <4 x float> %18)
  %20 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load, <4 x float> splat (float -8.000000e+00), <4 x float> %19)
  %21 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load248, <4 x float> splat (float 1.000000e+01), <4 x float> %20)
  %22 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx66, i64 %13
  %wide.load249 = load <4 x float>, ptr %22, align 4, !tbaa !10, !alias.scope !12
  %23 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load249, <4 x float> splat (float -3.000000e+00), <4 x float> %21)
  %24 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx75, i64 %13
  %wide.load250 = load <4 x float>, ptr %24, align 4, !tbaa !10, !alias.scope !12
  %25 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load250, <4 x float> splat (float 6.000000e+00), <4 x float> %23)
  %26 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx84, i64 %13
  %wide.load251 = load <4 x float>, ptr %26, align 4, !tbaa !10, !alias.scope !12
  %27 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load251, <4 x float> splat (float -9.000000e+00), <4 x float> %25)
  %28 = or disjoint i64 %index, 2
  %29 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12, i64 %28
  %wide.load252 = load <4 x float>, ptr %29, align 4, !tbaa !10, !alias.scope !12
  %30 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load252, <4 x float> splat (float 2.000000e+00), <4 x float> %27)
  %31 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx20, i64 %28
  %wide.load253 = load <4 x float>, ptr %31, align 4, !tbaa !10, !alias.scope !12
  %32 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load253, <4 x float> splat (float 4.000000e+00), <4 x float> %30)
  %33 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx111, i64 %28
  %wide.load254 = load <4 x float>, ptr %33, align 4, !tbaa !10, !alias.scope !12
  %34 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load254, <4 x float> splat (float 5.000000e+00), <4 x float> %32)
  %35 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx120, i64 %28
  %wide.load255 = load <4 x float>, ptr %35, align 4, !tbaa !10, !alias.scope !12
  %36 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load255, <4 x float> splat (float 7.000000e+00), <4 x float> %34)
  %37 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx129, i64 %28
  %wide.load256 = load <4 x float>, ptr %37, align 4, !tbaa !10, !alias.scope !12
  %38 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load256, <4 x float> splat (float -8.000000e+00), <4 x float> %36)
  %39 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx138, i64 %28
  %wide.load257 = load <4 x float>, ptr %39, align 4, !tbaa !10, !alias.scope !12
  %40 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load257, <4 x float> splat (float 1.000000e+01), <4 x float> %38)
  %41 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx145, i64 %13
  store <4 x float> %40, ptr %41, align 4, !tbaa !10, !alias.scope !15, !noalias !12
  %index.next = add nuw i64 %index, 4
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond5.for.inc148_crit_edge, label %for.body8.preheader

for.body8.preheader:                              ; preds = %for.cond5.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ %8, %middle.block ], [ 1, %for.cond5.preheader ]
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader, %for.body8
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body8 ], [ %indvars.iv.ph, %for.body8.preheader ]
  %43 = add nsw i64 %indvars.iv, -1
  %arrayidx15 = getelementptr inbounds [4 x i8], ptr %arrayidx12, i64 %43
  %44 = load float, ptr %arrayidx15, align 4, !tbaa !10
  %arrayidx23 = getelementptr inbounds [4 x i8], ptr %arrayidx20, i64 %43
  %45 = load float, ptr %arrayidx23, align 4, !tbaa !10
  %mul24 = fmul float %45, 4.000000e+00
  %46 = tail call float @llvm.fmuladd.f32(float %44, float 2.000000e+00, float %mul24)
  %47 = tail call float @llvm.fmuladd.f32(float %44, float 5.000000e+00, float %46)
  %48 = tail call float @llvm.fmuladd.f32(float %45, float 7.000000e+00, float %47)
  %49 = tail call float @llvm.fmuladd.f32(float %44, float -8.000000e+00, float %48)
  %50 = tail call float @llvm.fmuladd.f32(float %45, float 1.000000e+01, float %49)
  %arrayidx69 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx66, i64 %indvars.iv
  %51 = load float, ptr %arrayidx69, align 4, !tbaa !10
  %52 = tail call float @llvm.fmuladd.f32(float %51, float -3.000000e+00, float %50)
  %arrayidx78 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx75, i64 %indvars.iv
  %53 = load float, ptr %arrayidx78, align 4, !tbaa !10
  %54 = tail call float @llvm.fmuladd.f32(float %53, float 6.000000e+00, float %52)
  %arrayidx87 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx84, i64 %indvars.iv
  %55 = load float, ptr %arrayidx87, align 4, !tbaa !10
  %56 = tail call float @llvm.fmuladd.f32(float %55, float -9.000000e+00, float %54)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx96 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12, i64 %indvars.iv.next
  %57 = load float, ptr %arrayidx96, align 4, !tbaa !10
  %58 = tail call float @llvm.fmuladd.f32(float %57, float 2.000000e+00, float %56)
  %arrayidx105 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx20, i64 %indvars.iv.next
  %59 = load float, ptr %arrayidx105, align 4, !tbaa !10
  %60 = tail call float @llvm.fmuladd.f32(float %59, float 4.000000e+00, float %58)
  %arrayidx114 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx111, i64 %indvars.iv.next
  %61 = load float, ptr %arrayidx114, align 4, !tbaa !10
  %62 = tail call float @llvm.fmuladd.f32(float %61, float 5.000000e+00, float %60)
  %arrayidx123 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx120, i64 %indvars.iv.next
  %63 = load float, ptr %arrayidx123, align 4, !tbaa !10
  %64 = tail call float @llvm.fmuladd.f32(float %63, float 7.000000e+00, float %62)
  %arrayidx132 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx129, i64 %indvars.iv.next
  %65 = load float, ptr %arrayidx132, align 4, !tbaa !10
  %66 = tail call float @llvm.fmuladd.f32(float %65, float -8.000000e+00, float %64)
  %arrayidx141 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx138, i64 %indvars.iv.next
  %67 = load float, ptr %arrayidx141, align 4, !tbaa !10
  %68 = tail call float @llvm.fmuladd.f32(float %67, float 1.000000e+01, float %66)
  %arrayidx147 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx145, i64 %indvars.iv
  store float %68, ptr %arrayidx147, align 4, !tbaa !10
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond5.for.inc148_crit_edge, label %for.body8, !llvm.loop !21

for.cond5.for.inc148_crit_edge:                   ; preds = %for.body8, %middle.block
  %exitcond239.not = icmp eq i64 %indvars.iv.next235, %wide.trip.count238
  br i1 %exitcond239.not, label %for.cond1.for.inc151_crit_edge, label %for.cond5.preheader, !llvm.loop !22

for.cond1.for.inc151_crit_edge:                   ; preds = %for.cond5.for.inc148_crit_edge
  %indvars.iv.next241 = add nuw nsw i64 %indvars.iv240, 1
  %exitcond244.not = icmp eq i64 %indvars.iv.next241, %wide.trip.count243
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond244.not, label %for.end153, label %for.cond1.preheader, !llvm.loop !23

for.end153:                                       ; preds = %for.cond1.for.inc151_crit_edge, %for.cond1.preheader.lr.ph, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable
define dso_local void @_Z4initiiiPA256_A256_f(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, ptr nofree noundef writeonly captures(none) %A) local_unnamed_addr #4 {
entry:
  %cmp34 = icmp sgt i32 %ni, 0
  br i1 %cmp34, label %for.cond1.preheader.lr.ph, label %for.end20

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp232 = icmp slt i32 %nj, 1
  %cmp530 = icmp slt i32 %nk, 1
  %brmerge = or i1 %cmp232, %cmp530
  br i1 %brmerge, label %for.end20, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count46 = zext nneg i32 %ni to i64
  %wide.trip.count41 = zext nneg i32 %nj to i64
  %wide.trip.count = zext nneg i32 %nk to i64
  %min.iters.check = icmp ult i32 %nk, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc18_crit_edge
  %indvars.iv43 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next44, %for.cond1.for.inc18_crit_edge ]
  %0 = trunc nuw nsw i64 %indvars.iv43 to i32
  %rem = urem i32 %0, 12
  %arrayidx = getelementptr inbounds nuw [262144 x i8], ptr %A, i64 %indvars.iv43
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.cond4.for.inc15_crit_edge
  %indvars.iv38 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next39, %for.cond4.for.inc15_crit_edge ]
  %1 = trunc nuw nsw i64 %indvars.iv38 to i32
  %rem7 = urem i32 %1, 7
  %mul = shl nuw nsw i32 %rem7, 1
  %add = add nuw nsw i32 %mul, %rem
  %arrayidx12 = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx, i64 %indvars.iv38
  br i1 %min.iters.check, label %for.body6.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond4.preheader
  %broadcast.splatinsert = insertelement <4 x i32> poison, i32 %add, i64 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %2 = urem <4 x i32> %vec.ind, splat (i32 13)
  %3 = mul nuw nsw <4 x i32> %2, splat (i32 3)
  %4 = add nuw nsw <4 x i32> %broadcast.splat, %3
  %5 = uitofp nneg <4 x i32> %4 to <4 x float>
  %6 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12, i64 %index
  store <4 x float> %5, ptr %6, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %7 = icmp eq i64 %index.next, %n.vec
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !24

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond4.for.inc15_crit_edge, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.cond4.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond4.preheader ], [ %n.vec, %middle.block ]
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body6 ], [ %indvars.iv.ph, %for.body6.preheader ]
  %8 = trunc nuw nsw i64 %indvars.iv to i32
  %rem8 = urem i32 %8, 13
  %mul9 = mul nuw nsw i32 %rem8, 3
  %add10 = add nuw nsw i32 %add, %mul9
  %conv = uitofp nneg i32 %add10 to float
  %arrayidx14 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12, i64 %indvars.iv
  store float %conv, ptr %arrayidx14, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond4.for.inc15_crit_edge, label %for.body6, !llvm.loop !25

for.cond4.for.inc15_crit_edge:                    ; preds = %for.body6, %middle.block
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond42.not = icmp eq i64 %indvars.iv.next39, %wide.trip.count41
  br i1 %exitcond42.not, label %for.cond1.for.inc18_crit_edge, label %for.cond4.preheader, !llvm.loop !26

for.cond1.for.inc18_crit_edge:                    ; preds = %for.cond4.for.inc15_crit_edge
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond47.not = icmp eq i64 %indvars.iv.next44, %wide.trip.count46
  br i1 %exitcond47.not, label %for.end20, label %for.cond1.preheader, !llvm.loop !27

for.end20:                                        ; preds = %for.cond1.for.inc18_crit_edge, %for.cond1.preheader.lr.ph, %entry
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiiiPA256_A256_fS1_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef readonly captures(none) %B_outputFromGpu) local_unnamed_addr #5 {
entry:
  %sub = add i32 %ni, -1
  %cmp47 = icmp sgt i32 %ni, 2
  br i1 %cmp47, label %for.cond1.preheader.lr.ph, label %for.end28

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp343 = icmp sgt i32 %nj, 2
  %cmp740 = icmp sgt i32 %nk, 2
  %or.cond = and i1 %cmp343, %cmp740
  br i1 %or.cond, label %for.cond1.preheader.us.us.preheader, label %for.end28

for.cond1.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.lr.ph
  %sub6 = add nsw i32 %nk, -1
  %sub2 = add nsw i32 %nj, -1
  %wide.trip.count69 = zext nneg i32 %sub to i64
  %wide.trip.count64 = zext i32 %sub2 to i64
  %wide.trip.count = zext i32 %sub6 to i64
  %0 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i64 %0, 4
  %n.vec = and i64 %0, -4
  %1 = or disjoint i64 %n.vec, 1
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.cond1.preheader.us.us

for.cond1.preheader.us.us:                        ; preds = %for.cond1.preheader.us.us.preheader, %for.cond1.for.inc26_crit_edge.split.us.us.us
  %indvars.iv66 = phi i64 [ 1, %for.cond1.preheader.us.us.preheader ], [ %indvars.iv.next67, %for.cond1.for.inc26_crit_edge.split.us.us.us ]
  %fail.049.us.us = phi i32 [ 0, %for.cond1.preheader.us.us.preheader ], [ %fail.3.us.us.us.lcssa, %for.cond1.for.inc26_crit_edge.split.us.us.us ]
  %arrayidx.us.us = getelementptr inbounds nuw [262144 x i8], ptr %B, i64 %indvars.iv66
  %arrayidx14.us.us = getelementptr inbounds nuw [262144 x i8], ptr %B_outputFromGpu, i64 %indvars.iv66
  br label %for.cond5.preheader.us.us.us

for.cond5.preheader.us.us.us:                     ; preds = %for.cond5.for.inc23_crit_edge.us.us.us, %for.cond1.preheader.us.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.cond5.for.inc23_crit_edge.us.us.us ], [ 1, %for.cond1.preheader.us.us ]
  %fail.145.us.us.us = phi i32 [ %fail.3.us.us.us.lcssa, %for.cond5.for.inc23_crit_edge.us.us.us ], [ %fail.049.us.us, %for.cond1.preheader.us.us ]
  %arrayidx10.us.us.us = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx.us.us, i64 %indvars.iv61
  %arrayidx16.us.us.us = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx14.us.us, i64 %indvars.iv61
  br i1 %min.iters.check, label %for.body8.us.us.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond5.preheader.us.us.us
  %2 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.145.us.us.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %2, %vector.ph ], [ %34, %vector.body ]
  %3 = or disjoint i64 %index, 1
  %4 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us.us.us, i64 %3
  %wide.load = load <4 x float>, ptr %4, align 4, !tbaa !10
  %5 = fpext <4 x float> %wide.load to <4 x double>
  %6 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx16.us.us.us, i64 %3
  %wide.load71 = load <4 x float>, ptr %6, align 4, !tbaa !10
  %7 = fpext <4 x float> %wide.load71 to <4 x double>
  %8 = fcmp olt <4 x double> %5, splat (double f0xB690000000000000)
  %9 = fneg <4 x float> %wide.load
  %10 = select <4 x i1> %8, <4 x float> %9, <4 x float> %wide.load
  %11 = fpext <4 x float> %10 to <4 x double>
  %12 = fcmp uge <4 x double> %11, splat (double 1.000000e-02)
  %13 = fcmp olt <4 x double> %7, splat (double f0xB690000000000000)
  %14 = fneg <4 x float> %wide.load71
  %15 = select <4 x i1> %13, <4 x float> %14, <4 x float> %wide.load71
  %16 = fpext <4 x float> %15 to <4 x double>
  %17 = fcmp uge <4 x double> %16, splat (double 1.000000e-02)
  %18 = fsub <4 x double> %5, %7
  %19 = fptrunc <4 x double> %18 to <4 x float>
  %20 = fcmp olt <4 x double> %18, splat (double f0xB690000000000000)
  %21 = fneg <4 x float> %19
  %22 = select <4 x i1> %20, <4 x float> %21, <4 x float> %19
  %23 = fadd <4 x double> %5, splat (double f0x3E45798EE0000000)
  %24 = fptrunc <4 x double> %23 to <4 x float>
  %25 = fcmp olt <4 x double> %23, splat (double f0xB690000000000000)
  %26 = fneg <4 x float> %24
  %27 = select <4 x i1> %25, <4 x float> %26, <4 x float> %24
  %28 = fdiv <4 x float> %22, %27
  %29 = fcmp olt <4 x float> %28, zeroinitializer
  %30 = fneg <4 x float> %28
  %31 = select <4 x i1> %29, <4 x float> %30, <4 x float> %28
  %32 = fmul <4 x float> %31, splat (float 1.000000e+02)
  %33 = fcmp ogt <4 x float> %32, splat (float 5.000000e-01)
  %.not73 = select <4 x i1> %12, <4 x i1> splat (i1 true), <4 x i1> %17
  %narrow = select <4 x i1> %.not73, <4 x i1> %33, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %34 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %35 = icmp eq i64 %index.next, %n.vec
  br i1 %35, label %middle.block, label %vector.body, !llvm.loop !28

middle.block:                                     ; preds = %vector.body
  %36 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %34)
  br i1 %cmp.n, label %for.cond5.for.inc23_crit_edge.us.us.us, label %for.body8.us.us.us.preheader

for.body8.us.us.us.preheader:                     ; preds = %for.cond5.preheader.us.us.us, %middle.block
  %indvars.iv.ph = phi i64 [ 1, %for.cond5.preheader.us.us.us ], [ %1, %middle.block ]
  %fail.242.us.us.us.ph = phi i32 [ %fail.145.us.us.us, %for.cond5.preheader.us.us.us ], [ %36, %middle.block ]
  br label %for.body8.us.us.us

for.body8.us.us.us:                               ; preds = %for.body8.us.us.us.preheader, %_Z11percentDiffdd.exit.us.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us.us.us ], [ %indvars.iv.ph, %for.body8.us.us.us.preheader ]
  %fail.242.us.us.us = phi i32 [ %fail.3.us.us.us, %_Z11percentDiffdd.exit.us.us.us ], [ %fail.242.us.us.us.ph, %for.body8.us.us.us.preheader ]
  %arrayidx12.us.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us.us.us, i64 %indvars.iv
  %37 = load float, ptr %arrayidx12.us.us.us, align 4, !tbaa !10
  %conv.us.us.us = fpext float %37 to double
  %arrayidx18.us.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx16.us.us.us, i64 %indvars.iv
  %38 = load float, ptr %arrayidx18.us.us.us, align 4, !tbaa !10
  %conv19.us.us.us = fpext float %38 to double
  %cmp.i.i.us.us.us = fcmp olt double %conv.us.us.us, f0xB690000000000000
  %mul.i.i.us.us.us = fneg float %37
  %retval.0.i.i.us.us.us = select i1 %cmp.i.i.us.us.us, float %mul.i.i.us.us.us, float %37
  %conv1.i.us.us.us = fpext float %retval.0.i.i.us.us.us to double
  %cmp.i.us.us.us = fcmp olt double %conv1.i.us.us.us, 1.000000e-02
  br i1 %cmp.i.us.us.us, label %land.lhs.true.i.us.us.us, label %if.else.i.us.us.us

land.lhs.true.i.us.us.us:                         ; preds = %for.body8.us.us.us
  %cmp.i14.i.us.us.us = fcmp olt double %conv19.us.us.us, f0xB690000000000000
  %mul.i15.i.us.us.us = fneg float %38
  %retval.0.i16.i.us.us.us = select i1 %cmp.i14.i.us.us.us, float %mul.i15.i.us.us.us, float %38
  %conv4.i.us.us.us = fpext float %retval.0.i16.i.us.us.us to double
  %cmp5.i.us.us.us = fcmp olt double %conv4.i.us.us.us, 1.000000e-02
  br i1 %cmp5.i.us.us.us, label %_Z11percentDiffdd.exit.us.us.us, label %if.else.i.us.us.us

if.else.i.us.us.us:                               ; preds = %land.lhs.true.i.us.us.us, %for.body8.us.us.us
  %39 = insertelement <2 x double> poison, double %conv.us.us.us, i64 0
  %40 = shufflevector <2 x double> %39, <2 x double> poison, <2 x i32> zeroinitializer
  %41 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv19.us.us.us, i64 0
  %42 = fsub <2 x double> %40, %41
  %43 = fptrunc <2 x double> %42 to <2 x float>
  %44 = fcmp olt <2 x double> %42, splat (double f0xB690000000000000)
  %45 = fneg <2 x float> %43
  %46 = select <2 x i1> %44, <2 x float> %45, <2 x float> %43
  %47 = extractelement <2 x float> %46, i64 0
  %48 = extractelement <2 x float> %46, i64 1
  %div.i.us.us.us = fdiv float %47, %48
  %cmp.i23.i.us.us.us = fcmp olt float %div.i.us.us.us, 0.000000e+00
  %mul.i24.i.us.us.us = fneg float %div.i.us.us.us
  %retval.0.i25.i.us.us.us = select i1 %cmp.i23.i.us.us.us, float %mul.i24.i.us.us.us, float %div.i.us.us.us
  %mul.i.us.us.us = fmul float %retval.0.i25.i.us.us.us, 1.000000e+02
  %49 = fcmp ogt float %mul.i.us.us.us, 5.000000e-01
  %50 = zext i1 %49 to i32
  br label %_Z11percentDiffdd.exit.us.us.us

_Z11percentDiffdd.exit.us.us.us:                  ; preds = %if.else.i.us.us.us, %land.lhs.true.i.us.us.us
  %retval.0.i.us.us.us = phi i32 [ %50, %if.else.i.us.us.us ], [ 0, %land.lhs.true.i.us.us.us ]
  %fail.3.us.us.us = add nsw i32 %retval.0.i.us.us.us, %fail.242.us.us.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond5.for.inc23_crit_edge.us.us.us, label %for.body8.us.us.us, !llvm.loop !29

for.cond5.for.inc23_crit_edge.us.us.us:           ; preds = %_Z11percentDiffdd.exit.us.us.us, %middle.block
  %fail.3.us.us.us.lcssa = phi i32 [ %36, %middle.block ], [ %fail.3.us.us.us, %_Z11percentDiffdd.exit.us.us.us ]
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond65.not = icmp eq i64 %indvars.iv.next62, %wide.trip.count64
  br i1 %exitcond65.not, label %for.cond1.for.inc26_crit_edge.split.us.us.us, label %for.cond5.preheader.us.us.us, !llvm.loop !30

for.cond1.for.inc26_crit_edge.split.us.us.us:     ; preds = %for.cond5.for.inc23_crit_edge.us.us.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond70.not = icmp eq i64 %indvars.iv.next67, %wide.trip.count69
  br i1 %exitcond70.not, label %for.end28, label %for.cond1.preheader.us.us, !llvm.loop !31

for.end28:                                        ; preds = %for.cond1.for.inc26_crit_edge.split.us.us.us, %for.cond1.preheader.lr.ph, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ 0, %for.cond1.preheader.lr.ph ], [ %fail.3.us.us.us.lcssa, %for.cond1.for.inc26_crit_edge.split.us.us.us ]
  %call29 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-01, i32 noundef %fail.0.lcssa) #14
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
define dso_local void @_Z35__device_stub__convolution3D_kerneliiiPfS_i(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, ptr noundef %A, ptr noundef %B, i32 noundef %i) #9 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %i.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !32
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !32
  store i32 %nk, ptr %nk.addr, align 4, !tbaa !32
  store ptr %A, ptr %A.addr, align 8, !tbaa !33
  store ptr %B, ptr %B.addr, align 8, !tbaa !33
  store i32 %i, ptr %i.addr, align 4, !tbaa !32
  %kernel_args1 = alloca [6 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %nk.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %A.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %B.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %i.addr, ptr %4, align 8
  %5 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %6 = load i64, ptr %shmem_size, align 8
  %7 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z35__device_stub__convolution3D_kerneliiiPfS_i, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %6, ptr noundef %7)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress uwtable
define dso_local void @_Z17convolution3DCudaiiiPA256_A256_fS1_S1_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, ptr noundef %A, ptr noundef %B, ptr noundef %B_outputFromGpu) local_unnamed_addr #7 {
entry:
  %Tp.i.i24 = alloca %struct.timeval, align 8
  %ni.addr.i = alloca i32, align 4
  %nj.addr.i = alloca i32, align 4
  %nk.addr.i = alloca i32, align 4
  %A.addr.i = alloca ptr, align 8
  %B.addr.i = alloca ptr, align 8
  %i.addr.i = alloca i32, align 4
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [6 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %A_gpu = alloca ptr, align 8
  %B_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %B_gpu) #15
  %call = call i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 67108864) #14
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %B_gpu, i64 noundef 67108864) #14
  %0 = load ptr, ptr %A_gpu, align 8, !tbaa !33
  %call2 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 67108864, i32 noundef 1) #14
  %1 = load ptr, ptr %B_gpu, align 8, !tbaa !33
  %call3 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %B, i64 noundef 67108864, i32 noundef 1) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %2 = load i64, ptr %Tp.i.i, align 8, !tbaa !36
  %conv.i.i = sitofp i64 %2 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %3 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !39
  %conv2.i.i = sitofp i64 %3 to double
  %4 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %4, ptr @polybench_t_start, align 8, !tbaa !40
  %cmp34 = icmp sgt i32 %ni, 2
  br i1 %cmp34, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %_Z21polybench_timer_startv.exit
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  %7 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  %8 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 32
  %9 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 40
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %10 = add nsw i32 %ni, -2
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %i.035 = phi i32 [ 1, %for.body.lr.ph ], [ %inc, %for.inc ]
  %call13 = call i32 @__cudaPushCallConfiguration(i64 137438953480, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool.not = icmp eq i32 %call13, 0
  br i1 %tobool.not, label %kcall.configok, label %for.inc

kcall.configok:                                   ; preds = %for.body
  %11 = load ptr, ptr %A_gpu, align 8, !tbaa !33
  %12 = load ptr, ptr %B_gpu, align 8, !tbaa !33
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nk.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %i.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %ni, ptr %ni.addr.i, align 4, !tbaa !32
  store i32 %nj, ptr %nj.addr.i, align 4, !tbaa !32
  store i32 %nk, ptr %nk.addr.i, align 4, !tbaa !32
  store ptr %11, ptr %A.addr.i, align 8, !tbaa !33
  store ptr %12, ptr %B.addr.i, align 8, !tbaa !33
  store i32 %i.035, ptr %i.addr.i, align 4, !tbaa !32
  store ptr %ni.addr.i, ptr %kernel_args1.i, align 16
  store ptr %nj.addr.i, ptr %5, align 8
  store ptr %nk.addr.i, ptr %6, align 16
  store ptr %A.addr.i, ptr %7, align 8
  store ptr %B.addr.i, ptr %8, align 16
  store ptr %i.addr.i, ptr %9, align 8
  %13 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !42
  %14 = load i64, ptr %shmem_size.i, align 8
  %15 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z35__device_stub__convolution3D_kerneliiiPfS_i, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %14, ptr noundef %15), !inline_history !42
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nk.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %i.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %for.inc

for.inc:                                          ; preds = %for.body, %kcall.configok
  %inc = add nuw nsw i32 %i.035, 1
  %exitcond.not = icmp eq i32 %i.035, %10
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !43

for.end:                                          ; preds = %for.inc, %_Z21polybench_timer_startv.exit
  %call14 = call i32 @cudaThreadSynchronize() #14
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i24) #15
  %call.i.i25 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i24, ptr noundef null) #16
  %cmp.not.i.i26 = icmp eq i32 %call.i.i25, 0
  br i1 %cmp.not.i.i26, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i27

if.then.i.i27:                                    ; preds = %for.end
  %call1.i.i28 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i25) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %for.end, %if.then.i.i27
  %16 = load i64, ptr %Tp.i.i24, align 8, !tbaa !36
  %conv.i.i29 = sitofp i64 %16 to double
  %tv_usec.i.i30 = getelementptr inbounds nuw i8, ptr %Tp.i.i24, i64 8
  %17 = load i64, ptr %tv_usec.i.i30, align 8, !tbaa !39
  %conv2.i.i31 = sitofp i64 %17 to double
  %18 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i31, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i29)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i24) #15
  store double %18, ptr @polybench_t_end, align 8, !tbaa !40
  %19 = load double, ptr @polybench_t_start, align 8, !tbaa !40
  %sub.i = fsub double %18, %19
  %call.i32 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #14
  %20 = load ptr, ptr %B_gpu, align 8, !tbaa !33
  %call16 = call i32 @cudaMemcpy(ptr noundef %B_outputFromGpu, ptr noundef %20, i64 noundef 67108864, i32 noundef 2) #14
  %21 = load ptr, ptr %A_gpu, align 8, !tbaa !33
  %call17 = call i32 @cudaFree(ptr noundef %21) #14
  %22 = load ptr, ptr %B_gpu, align 8, !tbaa !33
  %call18 = call i32 @cudaFree(ptr noundef %22) #14
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !36
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !39
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_start, align 8, !tbaa !40
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !36
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !39
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_end, align 8, !tbaa !40
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !40
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !40
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #14
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #9 {
entry:
  %Tp.i.i50 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i35 = alloca ptr, align 8
  %newA.i.i28 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #15
  store ptr null, ptr %newA.i.i, align 8, !tbaa !44
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 67108864) #16
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !44
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !45
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i28) #15
  store ptr null, ptr %newA.i.i28, align 8, !tbaa !44
  %call.i.i29 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i28, i64 noundef 32, i64 noundef 67108864) #16
  %3 = load ptr, ptr %newA.i.i28, align 8, !tbaa !44
  %tobool.i.i30 = icmp eq ptr %3, null
  %tobool1.i.i31 = icmp ne i32 %call.i.i29, 0
  %or.cond.i.i32 = select i1 %tobool.i.i30, i1 true, i1 %tobool1.i.i31
  br i1 %or.cond.i.i32, label %if.then.i.i33, label %_Z20polybench_alloc_datayi.exit34

if.then.i.i33:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !45
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit34:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i28) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i35) #15
  store ptr null, ptr %newA.i.i35, align 8, !tbaa !44
  %call.i.i36 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i35, i64 noundef 32, i64 noundef 67108864) #16
  %6 = load ptr, ptr %newA.i.i35, align 8, !tbaa !44
  %tobool.i.i37 = icmp eq ptr %6, null
  %tobool1.i.i38 = icmp ne i32 %call.i.i36, 0
  %or.cond.i.i39 = select i1 %tobool.i.i37, i1 true, i1 %tobool1.i.i38
  br i1 %or.cond.i.i39, label %if.then.i.i40, label %_Z20polybench_alloc_datayi.exit41

if.then.i.i40:                                    ; preds = %_Z20polybench_alloc_datayi.exit34
  %7 = load ptr, ptr @stderr, align 8, !tbaa !45
  %8 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %7) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit41:                ; preds = %_Z20polybench_alloc_datayi.exit34
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i35) #15
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc18_crit_edge.i, %_Z20polybench_alloc_datayi.exit41
  %indvars.iv43.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit41 ], [ %indvars.iv.next44.i, %for.cond1.for.inc18_crit_edge.i ]
  %9 = trunc nuw nsw i64 %indvars.iv43.i to i32
  %rem.i = urem i32 %9, 12
  %arrayidx.i = getelementptr inbounds nuw [262144 x i8], ptr %0, i64 %indvars.iv43.i
  br label %for.cond4.preheader.i

for.cond4.preheader.i:                            ; preds = %for.cond4.for.inc15_crit_edge.i, %for.cond1.preheader.i
  %indvars.iv38.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next39.i, %for.cond4.for.inc15_crit_edge.i ]
  %arrayidx12.i = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx.i, i64 %indvars.iv38.i
  %10 = trunc nuw nsw i64 %indvars.iv38.i to i32
  %rem7.i = urem i32 %10, 7
  %mul.i = shl nuw nsw i32 %rem7.i, 1
  %add.i = add nuw nsw i32 %mul.i, %rem.i
  %broadcast.splatinsert = insertelement <4 x i32> poison, i32 %add.i, i64 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond4.preheader.i
  %index = phi i64 [ 0, %for.cond4.preheader.i ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond4.preheader.i ], [ %vec.ind.next, %vector.body ]
  %11 = urem <4 x i32> %vec.ind, splat (i32 13)
  %12 = mul nuw nsw <4 x i32> %11, splat (i32 3)
  %13 = add nuw nsw <4 x i32> %broadcast.splat, %12
  %14 = uitofp nneg <4 x i32> %13 to <4 x float>
  %15 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.i, i64 %index
  store <4 x float> %14, ptr %15, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %16 = icmp eq i64 %index.next, 256
  br i1 %16, label %for.cond4.for.inc15_crit_edge.i, label %vector.body, !llvm.loop !47

for.cond4.for.inc15_crit_edge.i:                  ; preds = %vector.body
  %indvars.iv.next39.i = add nuw nsw i64 %indvars.iv38.i, 1
  %exitcond42.not.i = icmp eq i64 %indvars.iv.next39.i, 256
  br i1 %exitcond42.not.i, label %for.cond1.for.inc18_crit_edge.i, label %for.cond4.preheader.i, !llvm.loop !26

for.cond1.for.inc18_crit_edge.i:                  ; preds = %for.cond4.for.inc15_crit_edge.i
  %indvars.iv.next44.i = add nuw nsw i64 %indvars.iv43.i, 1
  %exitcond47.not.i = icmp eq i64 %indvars.iv.next44.i, 256
  br i1 %exitcond47.not.i, label %_Z4initiiiPA256_A256_f.exit, label %for.cond1.preheader.i, !llvm.loop !27

_Z4initiiiPA256_A256_f.exit:                      ; preds = %for.cond1.for.inc18_crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #15
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #14
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #14
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #15
  call void @_Z17convolution3DCudaiiiPA256_A256_fS1_S1_(i32 noundef 256, i32 noundef 256, i32 noundef 256, ptr noundef nonnull %0, ptr noundef nonnull %3, ptr noundef nonnull %6) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i42 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i42, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i43

if.then.i.i43:                                    ; preds = %_Z4initiiiPA256_A256_f.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i42) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z4initiiiPA256_A256_f.exit, %if.then.i.i43
  %17 = load i64, ptr %Tp.i.i, align 8, !tbaa !36
  %conv.i.i = sitofp i64 %17 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %18 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !39
  %conv2.i.i = sitofp i64 %18 to double
  %19 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %19, ptr @polybench_t_start, align 8, !tbaa !40
  br label %for.cond1.preheader.i44

for.cond1.preheader.i44:                          ; preds = %for.cond1.for.inc151_crit_edge.i, %_Z21polybench_timer_startv.exit
  %indvar = phi i64 [ %indvar.next, %for.cond1.for.inc151_crit_edge.i ], [ 0, %_Z21polybench_timer_startv.exit ]
  %indvars.iv240.i = phi i64 [ %indvars.iv.next241.i, %for.cond1.for.inc151_crit_edge.i ], [ 1, %_Z21polybench_timer_startv.exit ]
  %20 = shl nuw nsw i64 %indvar, 18
  %21 = getelementptr i8, ptr %3, i64 %20
  %scevgep = getelementptr i8, ptr %21, i64 263172
  %22 = getelementptr i8, ptr %3, i64 %20
  %scevgep64 = getelementptr i8, ptr %22, i64 523260
  %scevgep65 = getelementptr i8, ptr %0, i64 %20
  %23 = getelementptr i8, ptr %0, i64 %20
  %scevgep66 = getelementptr i8, ptr %23, i64 786432
  %24 = getelementptr [262144 x i8], ptr %0, i64 %indvars.iv240.i
  %arrayidx.i45 = getelementptr i8, ptr %24, i64 -262144
  %arrayidx17.i = getelementptr inbounds nuw i8, ptr %24, i64 262144
  %arrayidx143.i = getelementptr inbounds nuw [262144 x i8], ptr %3, i64 %indvars.iv240.i
  %bound0 = icmp ult ptr %scevgep, %scevgep66
  %bound1 = icmp ult ptr %scevgep65, %scevgep64
  %found.conflict = and i1 %bound0, %bound1
  br label %for.cond5.preheader.i

for.cond5.preheader.i:                            ; preds = %for.cond5.for.inc148_crit_edge.i, %for.cond1.preheader.i44
  %indvars.iv234.i = phi i64 [ 1, %for.cond1.preheader.i44 ], [ %indvars.iv.next235.i, %for.cond5.for.inc148_crit_edge.i ]
  %25 = add nsw i64 %indvars.iv234.i, -1
  %arrayidx12.i46 = getelementptr inbounds [1024 x i8], ptr %arrayidx.i45, i64 %25
  %arrayidx20.i = getelementptr inbounds [1024 x i8], ptr %arrayidx17.i, i64 %25
  %arrayidx66.i = getelementptr inbounds [1024 x i8], ptr %24, i64 %25
  %arrayidx75.i = getelementptr inbounds nuw [1024 x i8], ptr %24, i64 %indvars.iv234.i
  %indvars.iv.next235.i = add nuw nsw i64 %indvars.iv234.i, 1
  %arrayidx84.i = getelementptr inbounds nuw [1024 x i8], ptr %24, i64 %indvars.iv.next235.i
  %arrayidx111.i = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx.i45, i64 %indvars.iv234.i
  %arrayidx120.i = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx17.i, i64 %indvars.iv234.i
  %arrayidx129.i = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx.i45, i64 %indvars.iv.next235.i
  %arrayidx138.i = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx17.i, i64 %indvars.iv.next235.i
  %arrayidx145.i = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx143.i, i64 %indvars.iv234.i
  br i1 %found.conflict, label %for.body8.i.preheader, label %vector.body68

vector.body68:                                    ; preds = %for.cond5.preheader.i, %vector.body68
  %index69 = phi i64 [ %index.next80, %vector.body68 ], [ 0, %for.cond5.preheader.i ]
  %26 = or disjoint i64 %index69, 1
  %27 = getelementptr inbounds [4 x i8], ptr %arrayidx12.i46, i64 %index69
  %wide.load = load <4 x float>, ptr %27, align 4, !tbaa !10, !alias.scope !48
  %28 = getelementptr inbounds [4 x i8], ptr %arrayidx20.i, i64 %index69
  %wide.load70 = load <4 x float>, ptr %28, align 4, !tbaa !10, !alias.scope !48
  %29 = fmul <4 x float> %wide.load70, splat (float 4.000000e+00)
  %30 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load, <4 x float> splat (float 2.000000e+00), <4 x float> %29)
  %31 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load, <4 x float> splat (float 5.000000e+00), <4 x float> %30)
  %32 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load70, <4 x float> splat (float 7.000000e+00), <4 x float> %31)
  %33 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load, <4 x float> splat (float -8.000000e+00), <4 x float> %32)
  %34 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load70, <4 x float> splat (float 1.000000e+01), <4 x float> %33)
  %35 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx66.i, i64 %26
  %wide.load71 = load <4 x float>, ptr %35, align 4, !tbaa !10, !alias.scope !48
  %36 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load71, <4 x float> splat (float -3.000000e+00), <4 x float> %34)
  %37 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx75.i, i64 %26
  %wide.load72 = load <4 x float>, ptr %37, align 4, !tbaa !10, !alias.scope !48
  %38 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load72, <4 x float> splat (float 6.000000e+00), <4 x float> %36)
  %39 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx84.i, i64 %26
  %wide.load73 = load <4 x float>, ptr %39, align 4, !tbaa !10, !alias.scope !48
  %40 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load73, <4 x float> splat (float -9.000000e+00), <4 x float> %38)
  %41 = or disjoint i64 %index69, 2
  %42 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.i46, i64 %41
  %wide.load74 = load <4 x float>, ptr %42, align 4, !tbaa !10, !alias.scope !48
  %43 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load74, <4 x float> splat (float 2.000000e+00), <4 x float> %40)
  %44 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx20.i, i64 %41
  %wide.load75 = load <4 x float>, ptr %44, align 4, !tbaa !10, !alias.scope !48
  %45 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load75, <4 x float> splat (float 4.000000e+00), <4 x float> %43)
  %46 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx111.i, i64 %41
  %wide.load76 = load <4 x float>, ptr %46, align 4, !tbaa !10, !alias.scope !48
  %47 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load76, <4 x float> splat (float 5.000000e+00), <4 x float> %45)
  %48 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx120.i, i64 %41
  %wide.load77 = load <4 x float>, ptr %48, align 4, !tbaa !10, !alias.scope !48
  %49 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load77, <4 x float> splat (float 7.000000e+00), <4 x float> %47)
  %50 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx129.i, i64 %41
  %wide.load78 = load <4 x float>, ptr %50, align 4, !tbaa !10, !alias.scope !48
  %51 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load78, <4 x float> splat (float -8.000000e+00), <4 x float> %49)
  %52 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx138.i, i64 %41
  %wide.load79 = load <4 x float>, ptr %52, align 4, !tbaa !10, !alias.scope !48
  %53 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %wide.load79, <4 x float> splat (float 1.000000e+01), <4 x float> %51)
  %54 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx145.i, i64 %26
  store <4 x float> %53, ptr %54, align 4, !tbaa !10, !alias.scope !51, !noalias !48
  %index.next80 = add nuw i64 %index69, 4
  %55 = icmp eq i64 %index.next80, 252
  br i1 %55, label %for.body8.i.preheader, label %vector.body68, !llvm.loop !53

for.body8.i.preheader:                            ; preds = %vector.body68, %for.cond5.preheader.i
  %indvars.iv.i47.ph = phi i64 [ 1, %for.cond5.preheader.i ], [ 253, %vector.body68 ]
  br label %for.body8.i

for.body8.i:                                      ; preds = %for.body8.i.preheader, %for.body8.i
  %indvars.iv.i47 = phi i64 [ %indvars.iv.next.i48, %for.body8.i ], [ %indvars.iv.i47.ph, %for.body8.i.preheader ]
  %56 = add nsw i64 %indvars.iv.i47, -1
  %arrayidx15.i = getelementptr inbounds [4 x i8], ptr %arrayidx12.i46, i64 %56
  %57 = load float, ptr %arrayidx15.i, align 4, !tbaa !10
  %arrayidx23.i = getelementptr inbounds [4 x i8], ptr %arrayidx20.i, i64 %56
  %58 = load float, ptr %arrayidx23.i, align 4, !tbaa !10
  %mul24.i = fmul float %58, 4.000000e+00
  %59 = call float @llvm.fmuladd.f32(float %57, float 2.000000e+00, float %mul24.i)
  %60 = call float @llvm.fmuladd.f32(float %57, float 5.000000e+00, float %59)
  %61 = call float @llvm.fmuladd.f32(float %58, float 7.000000e+00, float %60)
  %62 = call float @llvm.fmuladd.f32(float %57, float -8.000000e+00, float %61)
  %63 = call float @llvm.fmuladd.f32(float %58, float 1.000000e+01, float %62)
  %arrayidx69.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx66.i, i64 %indvars.iv.i47
  %64 = load float, ptr %arrayidx69.i, align 4, !tbaa !10
  %65 = call float @llvm.fmuladd.f32(float %64, float -3.000000e+00, float %63)
  %arrayidx78.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx75.i, i64 %indvars.iv.i47
  %66 = load float, ptr %arrayidx78.i, align 4, !tbaa !10
  %67 = call float @llvm.fmuladd.f32(float %66, float 6.000000e+00, float %65)
  %arrayidx87.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx84.i, i64 %indvars.iv.i47
  %68 = load float, ptr %arrayidx87.i, align 4, !tbaa !10
  %69 = call float @llvm.fmuladd.f32(float %68, float -9.000000e+00, float %67)
  %indvars.iv.next.i48 = add nuw nsw i64 %indvars.iv.i47, 1
  %arrayidx96.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.i46, i64 %indvars.iv.next.i48
  %70 = load float, ptr %arrayidx96.i, align 4, !tbaa !10
  %71 = call float @llvm.fmuladd.f32(float %70, float 2.000000e+00, float %69)
  %arrayidx105.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx20.i, i64 %indvars.iv.next.i48
  %72 = load float, ptr %arrayidx105.i, align 4, !tbaa !10
  %73 = call float @llvm.fmuladd.f32(float %72, float 4.000000e+00, float %71)
  %arrayidx114.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx111.i, i64 %indvars.iv.next.i48
  %74 = load float, ptr %arrayidx114.i, align 4, !tbaa !10
  %75 = call float @llvm.fmuladd.f32(float %74, float 5.000000e+00, float %73)
  %arrayidx123.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx120.i, i64 %indvars.iv.next.i48
  %76 = load float, ptr %arrayidx123.i, align 4, !tbaa !10
  %77 = call float @llvm.fmuladd.f32(float %76, float 7.000000e+00, float %75)
  %arrayidx132.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx129.i, i64 %indvars.iv.next.i48
  %78 = load float, ptr %arrayidx132.i, align 4, !tbaa !10
  %79 = call float @llvm.fmuladd.f32(float %78, float -8.000000e+00, float %77)
  %arrayidx141.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx138.i, i64 %indvars.iv.next.i48
  %80 = load float, ptr %arrayidx141.i, align 4, !tbaa !10
  %81 = call float @llvm.fmuladd.f32(float %80, float 1.000000e+01, float %79)
  %arrayidx147.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx145.i, i64 %indvars.iv.i47
  store float %81, ptr %arrayidx147.i, align 4, !tbaa !10
  %exitcond.not.i49 = icmp eq i64 %indvars.iv.next.i48, 255
  br i1 %exitcond.not.i49, label %for.cond5.for.inc148_crit_edge.i, label %for.body8.i, !llvm.loop !54

for.cond5.for.inc148_crit_edge.i:                 ; preds = %for.body8.i
  %exitcond239.not.i = icmp eq i64 %indvars.iv.next235.i, 255
  br i1 %exitcond239.not.i, label %for.cond1.for.inc151_crit_edge.i, label %for.cond5.preheader.i, !llvm.loop !22

for.cond1.for.inc151_crit_edge.i:                 ; preds = %for.cond5.for.inc148_crit_edge.i
  %indvars.iv.next241.i = add nuw nsw i64 %indvars.iv240.i, 1
  %exitcond244.not.i = icmp eq i64 %indvars.iv.next241.i, 255
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond244.not.i, label %_Z6conv3DiiiPA256_A256_fS1_.exit, label %for.cond1.preheader.i44, !llvm.loop !23

_Z6conv3DiiiPA256_A256_fS1_.exit:                 ; preds = %for.cond1.for.inc151_crit_edge.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i50) #15
  %call.i.i51 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i50, ptr noundef null) #16
  %cmp.not.i.i52 = icmp eq i32 %call.i.i51, 0
  br i1 %cmp.not.i.i52, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i53

if.then.i.i53:                                    ; preds = %_Z6conv3DiiiPA256_A256_fS1_.exit
  %call1.i.i54 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i51) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z6conv3DiiiPA256_A256_fS1_.exit, %if.then.i.i53
  %82 = load i64, ptr %Tp.i.i50, align 8, !tbaa !36
  %conv.i.i55 = sitofp i64 %82 to double
  %tv_usec.i.i56 = getelementptr inbounds nuw i8, ptr %Tp.i.i50, i64 8
  %83 = load i64, ptr %tv_usec.i.i56, align 8, !tbaa !39
  %conv2.i.i57 = sitofp i64 %83 to double
  %84 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i57, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i55)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i50) #15
  store double %84, ptr @polybench_t_end, align 8, !tbaa !40
  %85 = load double, ptr @polybench_t_start, align 8, !tbaa !40
  %sub.i = fsub double %84, %85
  %call.i58 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #14
  br label %for.cond1.preheader.us.us.i

for.cond1.preheader.us.us.i:                      ; preds = %for.cond1.for.inc26_crit_edge.split.us.us.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv66.i = phi i64 [ 1, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next67.i, %for.cond1.for.inc26_crit_edge.split.us.us.us.i ]
  %fail.049.us.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %fail.3.us.us.us.i.1, %for.cond1.for.inc26_crit_edge.split.us.us.us.i ]
  %arrayidx.us.us.i = getelementptr inbounds nuw [262144 x i8], ptr %3, i64 %indvars.iv66.i
  %arrayidx14.us.us.i = getelementptr inbounds nuw [262144 x i8], ptr %6, i64 %indvars.iv66.i
  br label %for.cond5.preheader.us.us.us.i

for.cond5.preheader.us.us.us.i:                   ; preds = %_Z11percentDiffdd.exit.us.us.us.i.1, %for.cond1.preheader.us.us.i
  %indvars.iv61.i = phi i64 [ %indvars.iv.next62.i, %_Z11percentDiffdd.exit.us.us.us.i.1 ], [ 1, %for.cond1.preheader.us.us.i ]
  %fail.145.us.us.us.i = phi i32 [ %fail.3.us.us.us.i.1, %_Z11percentDiffdd.exit.us.us.us.i.1 ], [ %fail.049.us.us.i, %for.cond1.preheader.us.us.i ]
  %arrayidx10.us.us.us.i = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx.us.us.i, i64 %indvars.iv61.i
  %arrayidx16.us.us.us.i = getelementptr inbounds nuw [1024 x i8], ptr %arrayidx14.us.us.i, i64 %indvars.iv61.i
  %86 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.145.us.us.us.i, i64 0
  br label %vector.body84

vector.body84:                                    ; preds = %vector.body84, %for.cond5.preheader.us.us.us.i
  %index85 = phi i64 [ 0, %for.cond5.preheader.us.us.us.i ], [ %index.next88, %vector.body84 ]
  %vec.phi = phi <4 x i32> [ %86, %for.cond5.preheader.us.us.us.i ], [ %118, %vector.body84 ]
  %87 = or disjoint i64 %index85, 1
  %88 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us.us.us.i, i64 %87
  %wide.load86 = load <4 x float>, ptr %88, align 4, !tbaa !10
  %89 = fpext <4 x float> %wide.load86 to <4 x double>
  %90 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx16.us.us.us.i, i64 %87
  %wide.load87 = load <4 x float>, ptr %90, align 4, !tbaa !10
  %91 = fpext <4 x float> %wide.load87 to <4 x double>
  %92 = fcmp olt <4 x double> %89, splat (double f0xB690000000000000)
  %93 = fneg <4 x float> %wide.load86
  %94 = select <4 x i1> %92, <4 x float> %93, <4 x float> %wide.load86
  %95 = fpext <4 x float> %94 to <4 x double>
  %96 = fcmp uge <4 x double> %95, splat (double 1.000000e-02)
  %97 = fcmp olt <4 x double> %91, splat (double f0xB690000000000000)
  %98 = fneg <4 x float> %wide.load87
  %99 = select <4 x i1> %97, <4 x float> %98, <4 x float> %wide.load87
  %100 = fpext <4 x float> %99 to <4 x double>
  %101 = fcmp uge <4 x double> %100, splat (double 1.000000e-02)
  %102 = fsub <4 x double> %89, %91
  %103 = fptrunc <4 x double> %102 to <4 x float>
  %104 = fcmp olt <4 x double> %102, splat (double f0xB690000000000000)
  %105 = fneg <4 x float> %103
  %106 = select <4 x i1> %104, <4 x float> %105, <4 x float> %103
  %107 = fadd <4 x double> %89, splat (double f0x3E45798EE0000000)
  %108 = fptrunc <4 x double> %107 to <4 x float>
  %109 = fcmp olt <4 x double> %107, splat (double f0xB690000000000000)
  %110 = fneg <4 x float> %108
  %111 = select <4 x i1> %109, <4 x float> %110, <4 x float> %108
  %112 = fdiv <4 x float> %106, %111
  %113 = fcmp olt <4 x float> %112, zeroinitializer
  %114 = fneg <4 x float> %112
  %115 = select <4 x i1> %113, <4 x float> %114, <4 x float> %112
  %116 = fmul <4 x float> %115, splat (float 1.000000e+02)
  %117 = fcmp ogt <4 x float> %116, splat (float 5.000000e-01)
  %.not91 = select <4 x i1> %96, <4 x i1> splat (i1 true), <4 x i1> %101
  %narrow = select <4 x i1> %.not91, <4 x i1> %117, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %118 = add <4 x i32> %vec.phi, %predphi
  %index.next88 = add nuw i64 %index85, 4
  %119 = icmp eq i64 %index.next88, 252
  br i1 %119, label %scalar.ph82, label %vector.body84, !llvm.loop !55

scalar.ph82:                                      ; preds = %vector.body84
  %120 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %118)
  %arrayidx12.us.us.us.i = getelementptr inbounds nuw i8, ptr %arrayidx10.us.us.us.i, i64 1012
  %121 = load float, ptr %arrayidx12.us.us.us.i, align 4, !tbaa !10
  %conv.us.us.us.i = fpext float %121 to double
  %arrayidx18.us.us.us.i = getelementptr inbounds nuw i8, ptr %arrayidx16.us.us.us.i, i64 1012
  %122 = load float, ptr %arrayidx18.us.us.us.i, align 4, !tbaa !10
  %conv19.us.us.us.i = fpext float %122 to double
  %cmp.i.i.us.us.us.i = fcmp olt double %conv.us.us.us.i, f0xB690000000000000
  %mul.i.i.us.us.us.i = fneg float %121
  %retval.0.i.i.us.us.us.i = select i1 %cmp.i.i.us.us.us.i, float %mul.i.i.us.us.us.i, float %121
  %conv1.i.us.us.us.i = fpext float %retval.0.i.i.us.us.us.i to double
  %cmp.i.us.us.us.i = fcmp olt double %conv1.i.us.us.us.i, 1.000000e-02
  br i1 %cmp.i.us.us.us.i, label %land.lhs.true.i.us.us.us.i, label %if.else.i.us.us.us.i

land.lhs.true.i.us.us.us.i:                       ; preds = %scalar.ph82
  %cmp.i14.i.us.us.us.i = fcmp olt double %conv19.us.us.us.i, f0xB690000000000000
  %mul.i15.i.us.us.us.i = fneg float %122
  %retval.0.i16.i.us.us.us.i = select i1 %cmp.i14.i.us.us.us.i, float %mul.i15.i.us.us.us.i, float %122
  %conv4.i.us.us.us.i = fpext float %retval.0.i16.i.us.us.us.i to double
  %cmp5.i.us.us.us.i = fcmp olt double %conv4.i.us.us.us.i, 1.000000e-02
  br i1 %cmp5.i.us.us.us.i, label %_Z11percentDiffdd.exit.us.us.us.i, label %if.else.i.us.us.us.i

if.else.i.us.us.us.i:                             ; preds = %land.lhs.true.i.us.us.us.i, %scalar.ph82
  %123 = insertelement <2 x double> poison, double %conv.us.us.us.i, i64 0
  %124 = shufflevector <2 x double> %123, <2 x double> poison, <2 x i32> zeroinitializer
  %125 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv19.us.us.us.i, i64 0
  %126 = fsub <2 x double> %124, %125
  %127 = fptrunc <2 x double> %126 to <2 x float>
  %128 = fcmp olt <2 x double> %126, splat (double f0xB690000000000000)
  %129 = fneg <2 x float> %127
  %130 = select <2 x i1> %128, <2 x float> %129, <2 x float> %127
  %131 = extractelement <2 x float> %130, i64 0
  %132 = extractelement <2 x float> %130, i64 1
  %div.i.us.us.us.i = fdiv float %131, %132
  %cmp.i23.i.us.us.us.i = fcmp olt float %div.i.us.us.us.i, 0.000000e+00
  %mul.i24.i.us.us.us.i = fneg float %div.i.us.us.us.i
  %retval.0.i25.i.us.us.us.i = select i1 %cmp.i23.i.us.us.us.i, float %mul.i24.i.us.us.us.i, float %div.i.us.us.us.i
  %mul.i.us.us.us.i = fmul float %retval.0.i25.i.us.us.us.i, 1.000000e+02
  %133 = fcmp ogt float %mul.i.us.us.us.i, 5.000000e-01
  %134 = zext i1 %133 to i32
  br label %_Z11percentDiffdd.exit.us.us.us.i

_Z11percentDiffdd.exit.us.us.us.i:                ; preds = %if.else.i.us.us.us.i, %land.lhs.true.i.us.us.us.i
  %retval.0.i.us.us.us.i = phi i32 [ %134, %if.else.i.us.us.us.i ], [ 0, %land.lhs.true.i.us.us.us.i ]
  %fail.3.us.us.us.i = add nsw i32 %retval.0.i.us.us.us.i, %120
  %arrayidx12.us.us.us.i.1 = getelementptr inbounds nuw i8, ptr %arrayidx10.us.us.us.i, i64 1016
  %135 = load float, ptr %arrayidx12.us.us.us.i.1, align 4, !tbaa !10
  %conv.us.us.us.i.1 = fpext float %135 to double
  %arrayidx18.us.us.us.i.1 = getelementptr inbounds nuw i8, ptr %arrayidx16.us.us.us.i, i64 1016
  %136 = load float, ptr %arrayidx18.us.us.us.i.1, align 4, !tbaa !10
  %conv19.us.us.us.i.1 = fpext float %136 to double
  %cmp.i.i.us.us.us.i.1 = fcmp olt double %conv.us.us.us.i.1, f0xB690000000000000
  %mul.i.i.us.us.us.i.1 = fneg float %135
  %retval.0.i.i.us.us.us.i.1 = select i1 %cmp.i.i.us.us.us.i.1, float %mul.i.i.us.us.us.i.1, float %135
  %conv1.i.us.us.us.i.1 = fpext float %retval.0.i.i.us.us.us.i.1 to double
  %cmp.i.us.us.us.i.1 = fcmp olt double %conv1.i.us.us.us.i.1, 1.000000e-02
  br i1 %cmp.i.us.us.us.i.1, label %land.lhs.true.i.us.us.us.i.1, label %if.else.i.us.us.us.i.1

land.lhs.true.i.us.us.us.i.1:                     ; preds = %_Z11percentDiffdd.exit.us.us.us.i
  %cmp.i14.i.us.us.us.i.1 = fcmp olt double %conv19.us.us.us.i.1, f0xB690000000000000
  %mul.i15.i.us.us.us.i.1 = fneg float %136
  %retval.0.i16.i.us.us.us.i.1 = select i1 %cmp.i14.i.us.us.us.i.1, float %mul.i15.i.us.us.us.i.1, float %136
  %conv4.i.us.us.us.i.1 = fpext float %retval.0.i16.i.us.us.us.i.1 to double
  %cmp5.i.us.us.us.i.1 = fcmp olt double %conv4.i.us.us.us.i.1, 1.000000e-02
  br i1 %cmp5.i.us.us.us.i.1, label %_Z11percentDiffdd.exit.us.us.us.i.1, label %if.else.i.us.us.us.i.1

if.else.i.us.us.us.i.1:                           ; preds = %land.lhs.true.i.us.us.us.i.1, %_Z11percentDiffdd.exit.us.us.us.i
  %137 = insertelement <2 x double> poison, double %conv.us.us.us.i.1, i64 0
  %138 = shufflevector <2 x double> %137, <2 x double> poison, <2 x i32> zeroinitializer
  %139 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv19.us.us.us.i.1, i64 0
  %140 = fsub <2 x double> %138, %139
  %141 = fptrunc <2 x double> %140 to <2 x float>
  %142 = fcmp olt <2 x double> %140, splat (double f0xB690000000000000)
  %143 = fneg <2 x float> %141
  %144 = select <2 x i1> %142, <2 x float> %143, <2 x float> %141
  %145 = extractelement <2 x float> %144, i64 0
  %146 = extractelement <2 x float> %144, i64 1
  %div.i.us.us.us.i.1 = fdiv float %145, %146
  %cmp.i23.i.us.us.us.i.1 = fcmp olt float %div.i.us.us.us.i.1, 0.000000e+00
  %mul.i24.i.us.us.us.i.1 = fneg float %div.i.us.us.us.i.1
  %retval.0.i25.i.us.us.us.i.1 = select i1 %cmp.i23.i.us.us.us.i.1, float %mul.i24.i.us.us.us.i.1, float %div.i.us.us.us.i.1
  %mul.i.us.us.us.i.1 = fmul float %retval.0.i25.i.us.us.us.i.1, 1.000000e+02
  %147 = fcmp ogt float %mul.i.us.us.us.i.1, 5.000000e-01
  %148 = zext i1 %147 to i32
  br label %_Z11percentDiffdd.exit.us.us.us.i.1

_Z11percentDiffdd.exit.us.us.us.i.1:              ; preds = %if.else.i.us.us.us.i.1, %land.lhs.true.i.us.us.us.i.1
  %retval.0.i.us.us.us.i.1 = phi i32 [ %148, %if.else.i.us.us.us.i.1 ], [ 0, %land.lhs.true.i.us.us.us.i.1 ]
  %fail.3.us.us.us.i.1 = add nsw i32 %retval.0.i.us.us.us.i.1, %fail.3.us.us.us.i
  %indvars.iv.next62.i = add nuw nsw i64 %indvars.iv61.i, 1
  %exitcond65.not.i = icmp eq i64 %indvars.iv.next62.i, 255
  br i1 %exitcond65.not.i, label %for.cond1.for.inc26_crit_edge.split.us.us.us.i, label %for.cond5.preheader.us.us.us.i, !llvm.loop !30

for.cond1.for.inc26_crit_edge.split.us.us.us.i:   ; preds = %_Z11percentDiffdd.exit.us.us.us.i.1
  %indvars.iv.next67.i = add nuw nsw i64 %indvars.iv66.i, 1
  %exitcond70.not.i = icmp eq i64 %indvars.iv.next67.i, 255
  br i1 %exitcond70.not.i, label %_Z14compareResultsiiiPA256_A256_fS1_.exit, label %for.cond1.preheader.us.us.i, !llvm.loop !31

_Z14compareResultsiiiPA256_A256_fS1_.exit:        ; preds = %for.cond1.for.inc26_crit_edge.split.us.us.us.i
  %call29.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-01, i32 noundef %fail.3.us.us.us.i.1) #14
  call void @free(ptr noundef %0) #16
  call void @free(ptr noundef nonnull %3) #16
  call void @free(ptr noundef nonnull %6) #16
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #15
  store ptr null, ptr %newA.i, align 8, !tbaa !44
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #16
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !44
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !45
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
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !18, !19, !20}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = !{!"llvm.loop.unroll.runtime.disable"}
!21 = distinct !{!21, !18, !19}
!22 = distinct !{!22, !18}
!23 = distinct !{!23, !18}
!24 = distinct !{!24, !18, !19, !20}
!25 = distinct !{!25, !18, !20, !19}
!26 = distinct !{!26, !18}
!27 = distinct !{!27, !18}
!28 = distinct !{!28, !18, !19, !20}
!29 = distinct !{!29, !18, !20, !19}
!30 = distinct !{!30, !18}
!31 = distinct !{!31, !18}
!32 = !{!7, !7, i64 0}
!33 = !{!34, !34, i64 0}
!34 = !{!"p1 float", !35, i64 0}
!35 = !{!"any pointer", !8, i64 0}
!36 = !{!37, !38, i64 0}
!37 = !{!"_ZTS7timeval", !38, i64 0, !38, i64 8}
!38 = !{!"long", !8, i64 0}
!39 = !{!37, !38, i64 8}
!40 = !{!41, !41, i64 0}
!41 = !{!"double", !8, i64 0}
!42 = !{ptr @_Z35__device_stub__convolution3D_kerneliiiPfS_i}
!43 = distinct !{!43, !18}
!44 = !{!35, !35, i64 0}
!45 = !{!46, !46, i64 0}
!46 = !{!"p1 _ZTS8_IO_FILE", !35, i64 0}
!47 = distinct !{!47, !18, !19, !20}
!48 = !{!49}
!49 = distinct !{!49, !50}
!50 = distinct !{!50, !"LVerDomain"}
!51 = !{!52}
!52 = distinct !{!52, !50}
!53 = distinct !{!53, !18, !19, !20}
!54 = distinct !{!54, !18, !19}
!55 = distinct !{!55, !18, !19, !20}
