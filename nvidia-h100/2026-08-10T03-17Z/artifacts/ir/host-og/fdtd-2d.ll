; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/FDTD-2D/fdtd2d.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/FDTD-2D/fdtd2d.cu"
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
define dso_local void @_Z11init_arraysiiiPfPA2048_fS1_S1_(i32 noundef %tmax, i32 noundef %nx, i32 noundef %ny, ptr nofree noundef writeonly captures(none) %_fict_, ptr nofree noundef writeonly captures(none) %ex, ptr nofree noundef writeonly captures(none) %ey, ptr nofree noundef writeonly captures(none) %hz) local_unnamed_addr #1 {
entry:
  %hz77 = ptrtoaddr ptr %hz to i64
  %ex76 = ptrtoaddr ptr %ex to i64
  %ey75 = ptrtoaddr ptr %ey to i64
  %cmp54 = icmp sgt i32 %tmax, 0
  br i1 %cmp54, label %for.body.preheader, label %for.cond1.preheader

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext nneg i32 %tmax to i64
  %min.iters.check = icmp ult i32 %tmax, 8
  br i1 %min.iters.check, label %for.body.preheader102, label %vector.ph

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %wide.trip.count, 2147483640
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %0 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %1 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %2 = getelementptr inbounds nuw [4 x i8], ptr %_fict_, i64 %index
  %3 = getelementptr inbounds nuw i8, ptr %2, i64 16
  store <4 x float> %0, ptr %2, align 4, !tbaa !10
  store <4 x float> %1, ptr %3, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond1.preheader, label %for.body.preheader102

for.body.preheader102:                            ; preds = %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond1.preheader:                              ; preds = %for.body, %middle.block, %entry
  %cmp258 = icmp sgt i32 %nx, 0
  %cmp556 = icmp sgt i32 %ny, 0
  %or.cond = and i1 %cmp258, %cmp556
  br i1 %or.cond, label %for.cond4.preheader.preheader, label %for.end35

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %wide.trip.count73 = zext nneg i32 %nx to i64
  %wide.trip.count66 = zext nneg i32 %ny to i64
  %min.iters.check82 = icmp ult i32 %ny, 4
  %5 = sub i64 %ex76, %ey75
  %diff.check = icmp ugt i64 %5, -16
  %6 = sub i64 %ex76, %hz77
  %diff.check78 = icmp ugt i64 %6, -16
  %conflict.rdx = or i1 %diff.check, %diff.check78
  %7 = sub i64 %ey75, %hz77
  %diff.check79 = icmp ugt i64 %7, -16
  %conflict.rdx80 = or i1 %conflict.rdx, %diff.check79
  %n.vec85 = and i64 %wide.trip.count66, 2147483644
  %cmp.n100 = icmp eq i64 %n.vec85, %wide.trip.count66
  br label %for.cond4.preheader

for.body:                                         ; preds = %for.body.preheader102, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader102 ]
  %8 = trunc nuw nsw i64 %indvars.iv to i32
  %conv = uitofp nneg i32 %8 to float
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %_fict_, i64 %indvars.iv
  store float %conv, ptr %arrayidx, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.preheader, label %for.body, !llvm.loop !16

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.cond4.for.inc33_crit_edge
  %indvars.iv68 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next69, %for.cond4.for.inc33_crit_edge ]
  %9 = trunc nuw nsw i64 %indvars.iv68 to i32
  %conv7 = uitofp nneg i32 %9 to float
  %arrayidx10 = getelementptr inbounds nuw [8192 x i8], ptr %ex, i64 %indvars.iv68
  %10 = trunc i64 %indvars.iv68 to i32
  %arrayidx18 = getelementptr inbounds nuw [8192 x i8], ptr %ey, i64 %indvars.iv68
  %11 = trunc i64 %indvars.iv68 to i32
  %12 = insertelement <2 x i32> poison, i32 %10, i64 0
  %13 = insertelement <2 x i32> %12, i32 %11, i64 1
  %14 = add <2 x i32> %13, <i32 -1, i32 -9>
  %15 = sitofp <2 x i32> %14 to <2 x float>
  %arrayidx27 = getelementptr inbounds nuw [8192 x i8], ptr %hz, i64 %indvars.iv68
  %brmerge = or i1 %min.iters.check82, %conflict.rdx80
  br i1 %brmerge, label %for.body6.preheader, label %vector.ph83

vector.ph83:                                      ; preds = %for.cond4.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv7, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splat87 = shufflevector <2 x float> %15, <2 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splat89 = shufflevector <2 x float> %15, <2 x float> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  br label %vector.body90

vector.body90:                                    ; preds = %vector.body90, %vector.ph83
  %index91 = phi i64 [ 0, %vector.ph83 ], [ %index.next95, %vector.body90 ]
  %vec.ind92 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph83 ], [ %vec.ind.next96, %vector.body90 ]
  %vec.ind93 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph83 ], [ %vec.ind.next97, %vector.body90 ]
  %vec.ind94 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph83 ], [ %vec.ind.next98, %vector.body90 ]
  %16 = trunc <4 x i64> %vec.ind92 to <4 x i32>
  %17 = add <4 x i32> %16, splat (i32 1)
  %18 = uitofp nneg <4 x i32> %17 to <4 x float>
  %19 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %18, <4 x float> splat (float 1.000000e+00))
  %20 = fmul nnan <4 x float> %19, splat (float f0x3A000000)
  %21 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10, i64 %index91
  store <4 x float> %20, ptr %21, align 4, !tbaa !10
  %22 = add <4 x i32> %vec.ind93, splat (i32 2)
  %23 = uitofp nneg <4 x i32> %22 to <4 x float>
  %24 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat87, <4 x float> %23, <4 x float> splat (float 2.000000e+00))
  %25 = fmul nnan <4 x float> %24, splat (float f0x3A000000)
  %26 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx18, i64 %index91
  store <4 x float> %25, ptr %26, align 4, !tbaa !10
  %27 = add <4 x i32> %vec.ind94, splat (i32 4)
  %28 = uitofp nneg <4 x i32> %27 to <4 x float>
  %29 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat89, <4 x float> %28, <4 x float> splat (float 3.000000e+00))
  %30 = fmul nnan <4 x float> %29, splat (float f0x3A000000)
  %31 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27, i64 %index91
  store <4 x float> %30, ptr %31, align 4, !tbaa !10
  %index.next95 = add nuw i64 %index91, 4
  %vec.ind.next96 = add nuw nsw <4 x i64> %vec.ind92, splat (i64 4)
  %vec.ind.next97 = add <4 x i32> %vec.ind93, splat (i32 4)
  %vec.ind.next98 = add <4 x i32> %vec.ind94, splat (i32 4)
  %32 = icmp eq i64 %index.next95, %n.vec85
  br i1 %32, label %middle.block99, label %vector.body90, !llvm.loop !17

middle.block99:                                   ; preds = %vector.body90
  br i1 %cmp.n100, label %for.cond4.for.inc33_crit_edge, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.cond4.preheader, %middle.block99
  %indvars.iv61.ph = phi i64 [ %n.vec85, %middle.block99 ], [ 0, %for.cond4.preheader ]
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.body6 ], [ %indvars.iv61.ph, %for.body6.preheader ]
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %33 = trunc nuw nsw i64 %indvars.iv.next62 to i32
  %conv8 = uitofp nneg i32 %33 to float
  %34 = tail call nnan float @llvm.fmuladd.f32(float %conv7, float %conv8, float 1.000000e+00)
  %div = fmul nnan float %34, f0x3A000000
  %arrayidx12 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10, i64 %indvars.iv61
  store float %div, ptr %arrayidx12, align 4, !tbaa !10
  %35 = trunc i64 %indvars.iv61 to i32
  %arrayidx20 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx18, i64 %indvars.iv61
  %36 = trunc i64 %indvars.iv61 to i32
  %37 = add i32 %36, 4
  %38 = add i32 %35, 2
  %conv24 = uitofp nneg i32 %37 to float
  %conv15 = uitofp nneg i32 %38 to float
  %39 = insertelement <2 x float> poison, float %conv15, i64 0
  %40 = insertelement <2 x float> %39, float %conv24, i64 1
  %41 = tail call nnan <2 x float> @llvm.fmuladd.v2f32(<2 x float> %15, <2 x float> %40, <2 x float> <float 2.000000e+00, float 3.000000e+00>)
  %42 = fmul nnan <2 x float> %41, splat (float f0x3A000000)
  %43 = extractelement <2 x float> %42, i64 0
  store float %43, ptr %arrayidx20, align 4, !tbaa !10
  %arrayidx29 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27, i64 %indvars.iv61
  %44 = extractelement <2 x float> %42, i64 1
  store float %44, ptr %arrayidx29, align 4, !tbaa !10
  %exitcond67.not = icmp eq i64 %indvars.iv.next62, %wide.trip.count66
  br i1 %exitcond67.not, label %for.cond4.for.inc33_crit_edge, label %for.body6, !llvm.loop !18

for.cond4.for.inc33_crit_edge:                    ; preds = %for.body6, %middle.block99
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond74.not = icmp eq i64 %indvars.iv.next69, %wide.trip.count73
  br i1 %exitcond74.not, label %for.end35, label %for.cond4.preheader, !llvm.loop !19

for.end35:                                        ; preds = %for.cond4.for.inc33_crit_edge, %for.cond1.preheader
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z7runFdtdiiiPfPA2048_fS1_S1_(i32 noundef %tmax, i32 noundef %nx, i32 noundef %ny, ptr nofree noundef readonly captures(none) %_fict_, ptr nofree noundef captures(none) %ex, ptr nofree noundef captures(none) %ey, ptr nofree noundef captures(none) %hz) local_unnamed_addr #4 {
entry:
  %cmp193 = icmp sgt i32 %tmax, 0
  br i1 %cmp193, label %for.cond1.preheader.lr.ph, label %for.end118

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp2179 = icmp sgt i32 %ny, 0
  %cmp8183 = icmp slt i32 %nx, 2
  %cmp11181 = icmp slt i32 %ny, 1
  %cmp39187 = icmp slt i32 %nx, 1
  %cmp42185 = icmp slt i32 %ny, 2
  %sub72 = add i32 %nx, -1
  %sub76 = add i32 %ny, -1
  %wide.trip.count231 = zext nneg i32 %tmax to i64
  %wide.trip.count = zext i32 %ny to i64
  %brmerge = or i1 %cmp8183, %cmp11181
  %wide.trip.count206 = zext i32 %nx to i64
  %wide.trip.count201 = zext nneg i32 %ny to i64
  %brmerge195 = or i1 %cmp39187, %cmp42185
  %wide.trip.count216 = zext nneg i32 %nx to i64
  %wide.trip.count211 = zext i32 %ny to i64
  %brmerge196 = or i1 %cmp8183, %cmp42185
  %wide.trip.count226 = zext i32 %sub72 to i64
  %wide.trip.count221 = zext i32 %sub76 to i64
  %0 = shl nuw nsw i64 %wide.trip.count226, 13
  %1 = shl nuw nsw i64 %wide.trip.count221, 2
  %2 = add nuw nsw i64 %0, %1
  %3 = getelementptr i8, ptr %hz, i64 %2
  %scevgep = getelementptr i8, ptr %3, i64 -8192
  %4 = getelementptr i8, ptr %ex, i64 %2
  %scevgep236 = getelementptr i8, ptr %4, i64 -8188
  %scevgep237 = getelementptr i8, ptr %ey, i64 %2
  %scevgep246 = getelementptr i8, ptr %ex, i64 4
  %5 = shl nuw nsw i64 %wide.trip.count206, 13
  %6 = shl nuw nsw i64 %wide.trip.count, 2
  %7 = add nuw nsw i64 %5, %6
  %8 = add nsw i64 %7, -8192
  %scevgep247 = getelementptr i8, ptr %ex, i64 %8
  %scevgep248 = getelementptr i8, ptr %hz, i64 %8
  %scevgep267 = getelementptr i8, ptr %ey, i64 8192
  %9 = shl nuw nsw i64 %wide.trip.count206, 13
  %10 = shl nuw nsw i64 %wide.trip.count, 2
  %11 = add nuw nsw i64 %9, %10
  %12 = add nsw i64 %11, -8192
  %scevgep268 = getelementptr i8, ptr %ey, i64 %12
  %scevgep269 = getelementptr i8, ptr %hz, i64 %12
  %min.iters.check288 = icmp ult i32 %ny, 8
  %n.vec291 = and i64 %wide.trip.count, 2147483640
  %cmp.n296 = icmp eq i64 %n.vec291, %wide.trip.count
  %min.iters.check274 = icmp ult i32 %ny, 4
  %bound0270 = icmp ult ptr %scevgep267, %scevgep269
  %bound1271 = icmp ult ptr %hz, %scevgep268
  %found.conflict272 = and i1 %bound0270, %bound1271
  %n.vec277 = and i64 %wide.trip.count, 2147483644
  %cmp.n285 = icmp eq i64 %n.vec277, %wide.trip.count
  %xtraiter = and i64 %wide.trip.count211, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %13 = add nsw i64 %wide.trip.count211, -1
  %14 = add nsw i64 %wide.trip.count, -1
  %min.iters.check253 = icmp ult i32 %ny, 5
  %bound0249 = icmp ult ptr %scevgep246, %scevgep248
  %bound1250 = icmp ult ptr %hz, %scevgep247
  %found.conflict251 = and i1 %bound0249, %bound1250
  %n.vec256 = and i64 %14, -4
  %15 = or disjoint i64 %n.vec256, 1
  %cmp.n264 = icmp eq i64 %14, %n.vec256
  %16 = and i64 %wide.trip.count211, 1
  %lcmp.mod299.not.not = icmp eq i64 %16, 0
  %17 = add nsw i64 %wide.trip.count211, -1
  %min.iters.check = icmp ult i32 %ny, 5
  %bound0 = icmp ult ptr %hz, %scevgep236
  %bound1 = icmp ult ptr %ex, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  %bound0238 = icmp ult ptr %hz, %scevgep237
  %bound1239 = icmp ult ptr %ey, %scevgep
  %found.conflict240 = and i1 %bound0238, %bound1239
  %conflict.rdx = or i1 %found.conflict, %found.conflict240
  %n.vec = and i64 %wide.trip.count221, 4294967292
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count221
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc116
  %indvars.iv228 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next229, %for.inc116 ]
  br i1 %cmp2179, label %for.body3.lr.ph, label %for.inc116

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %_fict_, i64 %indvars.iv228
  %.pre = load float, ptr %arrayidx, align 4, !tbaa !10
  br i1 %min.iters.check288, label %for.body3.preheader, label %vector.ph289

vector.ph289:                                     ; preds = %for.body3.lr.ph
  %broadcast.splatinsert = insertelement <4 x float> poison, float %.pre, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body292

vector.body292:                                   ; preds = %vector.body292, %vector.ph289
  %index293 = phi i64 [ 0, %vector.ph289 ], [ %index.next294, %vector.body292 ]
  %18 = getelementptr inbounds nuw [4 x i8], ptr %ey, i64 %index293
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 16
  store <4 x float> %broadcast.splat, ptr %18, align 4, !tbaa !10
  store <4 x float> %broadcast.splat, ptr %19, align 4, !tbaa !10
  %index.next294 = add nuw i64 %index293, 8
  %20 = icmp eq i64 %index.next294, %n.vec291
  br i1 %20, label %middle.block295, label %vector.body292, !llvm.loop !20

middle.block295:                                  ; preds = %vector.body292
  br i1 %cmp.n296, label %for.cond7.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.lr.ph, %middle.block295
  %indvars.iv.ph = phi i64 [ 0, %for.body3.lr.ph ], [ %n.vec291, %middle.block295 ]
  br label %for.body3

for.cond7.preheader:                              ; preds = %for.body3, %middle.block295
  br i1 %brmerge, label %for.cond38.preheader, label %for.cond10.preheader

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %arrayidx6 = getelementptr inbounds nuw [4 x i8], ptr %ey, i64 %indvars.iv
  store float %.pre, ptr %arrayidx6, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond7.preheader, label %for.body3, !llvm.loop !21

for.cond38.preheader:                             ; preds = %for.cond10.for.inc35_crit_edge, %for.cond7.preheader
  br i1 %brmerge195, label %for.cond71.preheader, label %for.cond41.preheader

for.cond10.preheader:                             ; preds = %for.cond7.preheader, %for.cond10.for.inc35_crit_edge
  %indvars.iv203 = phi i64 [ %indvars.iv.next204, %for.cond10.for.inc35_crit_edge ], [ 1, %for.cond7.preheader ]
  %arrayidx14 = getelementptr inbounds nuw [8192 x i8], ptr %ey, i64 %indvars.iv203
  %arrayidx18 = getelementptr inbounds nuw [8192 x i8], ptr %hz, i64 %indvars.iv203
  %arrayidx22 = getelementptr i8, ptr %arrayidx18, i64 -8192
  %brmerge300 = select i1 %min.iters.check274, i1 true, i1 %found.conflict272
  br i1 %brmerge300, label %for.body12.preheader, label %vector.body278

vector.body278:                                   ; preds = %for.cond10.preheader, %vector.body278
  %index279 = phi i64 [ %index.next283, %vector.body278 ], [ 0, %for.cond10.preheader ]
  %21 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14, i64 %index279
  %wide.load280 = load <4 x float>, ptr %21, align 4, !tbaa !10, !alias.scope !22, !noalias !25
  %22 = fpext <4 x float> %wide.load280 to <4 x double>
  %23 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx18, i64 %index279
  %wide.load281 = load <4 x float>, ptr %23, align 4, !tbaa !10, !alias.scope !25
  %24 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx22, i64 %index279
  %wide.load282 = load <4 x float>, ptr %24, align 4, !tbaa !10, !alias.scope !25
  %25 = fsub <4 x float> %wide.load281, %wide.load282
  %26 = fpext <4 x float> %25 to <4 x double>
  %27 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %26, <4 x double> splat (double -5.000000e-01), <4 x double> %22)
  %28 = fptrunc <4 x double> %27 to <4 x float>
  store <4 x float> %28, ptr %21, align 4, !tbaa !10, !alias.scope !22, !noalias !25
  %index.next283 = add nuw i64 %index279, 4
  %29 = icmp eq i64 %index.next283, %n.vec277
  br i1 %29, label %middle.block284, label %vector.body278, !llvm.loop !27

middle.block284:                                  ; preds = %vector.body278
  br i1 %cmp.n285, label %for.cond10.for.inc35_crit_edge, label %for.body12.preheader

for.body12.preheader:                             ; preds = %for.cond10.preheader, %middle.block284
  %indvars.iv198.ph = phi i64 [ %n.vec277, %middle.block284 ], [ 0, %for.cond10.preheader ]
  br i1 %lcmp.mod.not, label %for.body12.prol.loopexit, label %for.body12.prol

for.body12.prol:                                  ; preds = %for.body12.preheader
  %arrayidx16.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14, i64 %indvars.iv198.ph
  %30 = load float, ptr %arrayidx16.prol, align 4, !tbaa !10
  %conv.prol = fpext float %30 to double
  %arrayidx20.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx18, i64 %indvars.iv198.ph
  %31 = load float, ptr %arrayidx20.prol, align 4, !tbaa !10
  %arrayidx24.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx22, i64 %indvars.iv198.ph
  %32 = load float, ptr %arrayidx24.prol, align 4, !tbaa !10
  %sub25.prol = fsub float %31, %32
  %conv26.prol = fpext float %sub25.prol to double
  %33 = tail call double @llvm.fmuladd.f64(double %conv26.prol, double -5.000000e-01, double %conv.prol)
  %conv27.prol = fptrunc double %33 to float
  store float %conv27.prol, ptr %arrayidx16.prol, align 4, !tbaa !10
  %indvars.iv.next199.prol = or disjoint i64 %indvars.iv198.ph, 1
  br label %for.body12.prol.loopexit

for.body12.prol.loopexit:                         ; preds = %for.body12.prol, %for.body12.preheader
  %indvars.iv198.unr = phi i64 [ %indvars.iv198.ph, %for.body12.preheader ], [ %indvars.iv.next199.prol, %for.body12.prol ]
  %34 = icmp eq i64 %indvars.iv198.ph, %13
  br i1 %34, label %for.cond10.for.inc35_crit_edge, label %for.body12

for.body12:                                       ; preds = %for.body12.prol.loopexit, %for.body12
  %indvars.iv198 = phi i64 [ %indvars.iv.next199.1, %for.body12 ], [ %indvars.iv198.unr, %for.body12.prol.loopexit ]
  %arrayidx16 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14, i64 %indvars.iv198
  %35 = load float, ptr %arrayidx16, align 4, !tbaa !10
  %conv = fpext float %35 to double
  %arrayidx20 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx18, i64 %indvars.iv198
  %36 = load float, ptr %arrayidx20, align 4, !tbaa !10
  %arrayidx24 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx22, i64 %indvars.iv198
  %37 = load float, ptr %arrayidx24, align 4, !tbaa !10
  %sub25 = fsub float %36, %37
  %conv26 = fpext float %sub25 to double
  %38 = tail call double @llvm.fmuladd.f64(double %conv26, double -5.000000e-01, double %conv)
  %conv27 = fptrunc double %38 to float
  store float %conv27, ptr %arrayidx16, align 4, !tbaa !10
  %indvars.iv.next199 = add nuw nsw i64 %indvars.iv198, 1
  %arrayidx16.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14, i64 %indvars.iv.next199
  %39 = load float, ptr %arrayidx16.1, align 4, !tbaa !10
  %conv.1 = fpext float %39 to double
  %arrayidx20.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx18, i64 %indvars.iv.next199
  %40 = load float, ptr %arrayidx20.1, align 4, !tbaa !10
  %arrayidx24.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx22, i64 %indvars.iv.next199
  %41 = load float, ptr %arrayidx24.1, align 4, !tbaa !10
  %sub25.1 = fsub float %40, %41
  %conv26.1 = fpext float %sub25.1 to double
  %42 = tail call double @llvm.fmuladd.f64(double %conv26.1, double -5.000000e-01, double %conv.1)
  %conv27.1 = fptrunc double %42 to float
  store float %conv27.1, ptr %arrayidx16.1, align 4, !tbaa !10
  %indvars.iv.next199.1 = add nuw nsw i64 %indvars.iv198, 2
  %exitcond202.not.1 = icmp eq i64 %indvars.iv.next199.1, %wide.trip.count201
  br i1 %exitcond202.not.1, label %for.cond10.for.inc35_crit_edge, label %for.body12, !llvm.loop !28

for.cond10.for.inc35_crit_edge:                   ; preds = %for.body12.prol.loopexit, %for.body12, %middle.block284
  %indvars.iv.next204 = add nuw nsw i64 %indvars.iv203, 1
  %exitcond207.not = icmp eq i64 %indvars.iv.next204, %wide.trip.count206
  br i1 %exitcond207.not, label %for.cond38.preheader, label %for.cond10.preheader, !llvm.loop !29

for.cond71.preheader:                             ; preds = %for.cond41.for.inc68_crit_edge, %for.cond38.preheader
  br i1 %brmerge196, label %for.inc116, label %for.cond75.preheader

for.cond41.preheader:                             ; preds = %for.cond38.preheader, %for.cond41.for.inc68_crit_edge
  %indvars.iv213 = phi i64 [ %indvars.iv.next214, %for.cond41.for.inc68_crit_edge ], [ 0, %for.cond38.preheader ]
  %arrayidx45 = getelementptr inbounds nuw [8192 x i8], ptr %ex, i64 %indvars.iv213
  %arrayidx50 = getelementptr inbounds nuw [8192 x i8], ptr %hz, i64 %indvars.iv213
  %brmerge301 = select i1 %min.iters.check253, i1 true, i1 %found.conflict251
  br i1 %brmerge301, label %for.body43.preheader, label %vector.body257

vector.body257:                                   ; preds = %for.cond41.preheader, %vector.body257
  %index258 = phi i64 [ %index.next262, %vector.body257 ], [ 0, %for.cond41.preheader ]
  %43 = or disjoint i64 %index258, 1
  %44 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx45, i64 %43
  %wide.load259 = load <4 x float>, ptr %44, align 4, !tbaa !10, !alias.scope !30, !noalias !33
  %45 = fpext <4 x float> %wide.load259 to <4 x double>
  %46 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx50, i64 %43
  %wide.load260 = load <4 x float>, ptr %46, align 4, !tbaa !10, !alias.scope !33
  %47 = getelementptr i8, ptr %46, i64 -4
  %wide.load261 = load <4 x float>, ptr %47, align 4, !tbaa !10, !alias.scope !33
  %48 = fsub <4 x float> %wide.load260, %wide.load261
  %49 = fpext <4 x float> %48 to <4 x double>
  %50 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %49, <4 x double> splat (double -5.000000e-01), <4 x double> %45)
  %51 = fptrunc <4 x double> %50 to <4 x float>
  store <4 x float> %51, ptr %44, align 4, !tbaa !10, !alias.scope !30, !noalias !33
  %index.next262 = add nuw i64 %index258, 4
  %52 = icmp eq i64 %index.next262, %n.vec256
  br i1 %52, label %middle.block263, label %vector.body257, !llvm.loop !35

middle.block263:                                  ; preds = %vector.body257
  br i1 %cmp.n264, label %for.cond41.for.inc68_crit_edge, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.cond41.preheader, %middle.block263
  %indvars.iv208.ph = phi i64 [ %15, %middle.block263 ], [ 1, %for.cond41.preheader ]
  br i1 %lcmp.mod299.not.not, label %for.body43.prol, label %for.body43.prol.loopexit

for.body43.prol:                                  ; preds = %for.body43.preheader
  %arrayidx47.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx45, i64 %indvars.iv208.ph
  %53 = load float, ptr %arrayidx47.prol, align 4, !tbaa !10
  %conv48.prol = fpext float %53 to double
  %arrayidx52.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx50, i64 %indvars.iv208.ph
  %54 = load float, ptr %arrayidx52.prol, align 4, !tbaa !10
  %arrayidx57.prol = getelementptr i8, ptr %arrayidx52.prol, i64 -4
  %55 = load float, ptr %arrayidx57.prol, align 4, !tbaa !10
  %sub58.prol = fsub float %54, %55
  %conv59.prol = fpext float %sub58.prol to double
  %56 = tail call double @llvm.fmuladd.f64(double %conv59.prol, double -5.000000e-01, double %conv48.prol)
  %conv60.prol = fptrunc double %56 to float
  store float %conv60.prol, ptr %arrayidx47.prol, align 4, !tbaa !10
  %indvars.iv.next209.prol = add nuw nsw i64 %indvars.iv208.ph, 1
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol, %for.body43.preheader
  %indvars.iv208.unr = phi i64 [ %indvars.iv208.ph, %for.body43.preheader ], [ %indvars.iv.next209.prol, %for.body43.prol ]
  %57 = icmp eq i64 %indvars.iv208.ph, %17
  br i1 %57, label %for.cond41.for.inc68_crit_edge, label %for.body43

for.body43:                                       ; preds = %for.body43.prol.loopexit, %for.body43
  %indvars.iv208 = phi i64 [ %indvars.iv.next209.1, %for.body43 ], [ %indvars.iv208.unr, %for.body43.prol.loopexit ]
  %arrayidx47 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx45, i64 %indvars.iv208
  %58 = load float, ptr %arrayidx47, align 4, !tbaa !10
  %conv48 = fpext float %58 to double
  %arrayidx52 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx50, i64 %indvars.iv208
  %59 = load float, ptr %arrayidx52, align 4, !tbaa !10
  %arrayidx57 = getelementptr i8, ptr %arrayidx52, i64 -4
  %60 = load float, ptr %arrayidx57, align 4, !tbaa !10
  %sub58 = fsub float %59, %60
  %conv59 = fpext float %sub58 to double
  %61 = tail call double @llvm.fmuladd.f64(double %conv59, double -5.000000e-01, double %conv48)
  %conv60 = fptrunc double %61 to float
  store float %conv60, ptr %arrayidx47, align 4, !tbaa !10
  %indvars.iv.next209 = add nuw nsw i64 %indvars.iv208, 1
  %arrayidx47.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx45, i64 %indvars.iv.next209
  %62 = load float, ptr %arrayidx47.1, align 4, !tbaa !10
  %conv48.1 = fpext float %62 to double
  %arrayidx52.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx50, i64 %indvars.iv.next209
  %63 = load float, ptr %arrayidx52.1, align 4, !tbaa !10
  %arrayidx57.1 = getelementptr i8, ptr %arrayidx52.1, i64 -4
  %64 = load float, ptr %arrayidx57.1, align 4, !tbaa !10
  %sub58.1 = fsub float %63, %64
  %conv59.1 = fpext float %sub58.1 to double
  %65 = tail call double @llvm.fmuladd.f64(double %conv59.1, double -5.000000e-01, double %conv48.1)
  %conv60.1 = fptrunc double %65 to float
  store float %conv60.1, ptr %arrayidx47.1, align 4, !tbaa !10
  %indvars.iv.next209.1 = add nuw nsw i64 %indvars.iv208, 2
  %exitcond212.not.1 = icmp eq i64 %indvars.iv.next209.1, %wide.trip.count211
  br i1 %exitcond212.not.1, label %for.cond41.for.inc68_crit_edge, label %for.body43, !llvm.loop !36

for.cond41.for.inc68_crit_edge:                   ; preds = %for.body43.prol.loopexit, %for.body43, %middle.block263
  %indvars.iv.next214 = add nuw nsw i64 %indvars.iv213, 1
  %exitcond217.not = icmp eq i64 %indvars.iv.next214, %wide.trip.count216
  br i1 %exitcond217.not, label %for.cond71.preheader, label %for.cond41.preheader, !llvm.loop !37

for.cond75.preheader:                             ; preds = %for.cond71.preheader, %for.cond75.for.inc113_crit_edge
  %indvars.iv223 = phi i64 [ %indvars.iv.next224, %for.cond75.for.inc113_crit_edge ], [ 0, %for.cond71.preheader ]
  %arrayidx80 = getelementptr inbounds nuw [8192 x i8], ptr %hz, i64 %indvars.iv223
  %arrayidx85 = getelementptr inbounds nuw [8192 x i8], ptr %ex, i64 %indvars.iv223
  %66 = getelementptr inbounds nuw [8192 x i8], ptr %ey, i64 %indvars.iv223
  %arrayidx95 = getelementptr inbounds nuw i8, ptr %66, i64 8192
  %brmerge302 = select i1 %min.iters.check, i1 true, i1 %conflict.rdx
  br i1 %brmerge302, label %for.body78.preheader, label %vector.body

vector.body:                                      ; preds = %for.cond75.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.cond75.preheader ]
  %67 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx80, i64 %index
  %wide.load = load <4 x float>, ptr %67, align 4, !tbaa !10, !alias.scope !38, !noalias !41
  %68 = fpext <4 x float> %wide.load to <4 x double>
  %69 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx85, i64 %index
  %70 = getelementptr inbounds nuw i8, ptr %69, i64 4
  %wide.load241 = load <4 x float>, ptr %70, align 4, !tbaa !10, !alias.scope !44
  %71 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx85, i64 %index
  %wide.load242 = load <4 x float>, ptr %71, align 4, !tbaa !10, !alias.scope !44
  %72 = fsub <4 x float> %wide.load241, %wide.load242
  %73 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx95, i64 %index
  %wide.load243 = load <4 x float>, ptr %73, align 4, !tbaa !10, !alias.scope !45
  %74 = fadd <4 x float> %72, %wide.load243
  %75 = getelementptr inbounds nuw [4 x i8], ptr %66, i64 %index
  %wide.load244 = load <4 x float>, ptr %75, align 4, !tbaa !10, !alias.scope !45
  %76 = fsub <4 x float> %74, %wide.load244
  %77 = fpext <4 x float> %76 to <4 x double>
  %78 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %77, <4 x double> splat (double f0xBFE6666666666666), <4 x double> %68)
  %79 = fptrunc <4 x double> %78 to <4 x float>
  store <4 x float> %79, ptr %67, align 4, !tbaa !10, !alias.scope !38, !noalias !41
  %index.next = add nuw i64 %index, 4
  %80 = icmp eq i64 %index.next, %n.vec
  br i1 %80, label %middle.block, label %vector.body, !llvm.loop !46

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond75.for.inc113_crit_edge, label %for.body78.preheader

for.body78.preheader:                             ; preds = %for.cond75.preheader, %middle.block
  %indvars.iv218.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %for.cond75.preheader ]
  br label %for.body78

for.body78:                                       ; preds = %for.body78.preheader, %for.body78
  %indvars.iv218 = phi i64 [ %indvars.iv.next219, %for.body78 ], [ %indvars.iv218.ph, %for.body78.preheader ]
  %arrayidx82 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx80, i64 %indvars.iv218
  %81 = load float, ptr %arrayidx82, align 4, !tbaa !10
  %conv83 = fpext float %81 to double
  %indvars.iv.next219 = add nuw nsw i64 %indvars.iv218, 1
  %arrayidx87 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx85, i64 %indvars.iv.next219
  %82 = load float, ptr %arrayidx87, align 4, !tbaa !10
  %arrayidx91 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx85, i64 %indvars.iv218
  %83 = load float, ptr %arrayidx91, align 4, !tbaa !10
  %sub92 = fsub float %82, %83
  %arrayidx97 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx95, i64 %indvars.iv218
  %84 = load float, ptr %arrayidx97, align 4, !tbaa !10
  %add98 = fadd float %sub92, %84
  %arrayidx102 = getelementptr inbounds nuw [4 x i8], ptr %66, i64 %indvars.iv218
  %85 = load float, ptr %arrayidx102, align 4, !tbaa !10
  %sub103 = fsub float %add98, %85
  %conv104 = fpext float %sub103 to double
  %86 = tail call double @llvm.fmuladd.f64(double %conv104, double f0xBFE6666666666666, double %conv83)
  %conv105 = fptrunc double %86 to float
  store float %conv105, ptr %arrayidx82, align 4, !tbaa !10
  %exitcond222.not = icmp eq i64 %indvars.iv.next219, %wide.trip.count221
  br i1 %exitcond222.not, label %for.cond75.for.inc113_crit_edge, label %for.body78, !llvm.loop !47

for.cond75.for.inc113_crit_edge:                  ; preds = %for.body78, %middle.block
  %indvars.iv.next224 = add nuw nsw i64 %indvars.iv223, 1
  %exitcond227.not = icmp eq i64 %indvars.iv.next224, %wide.trip.count226
  br i1 %exitcond227.not, label %for.inc116, label %for.cond75.preheader, !llvm.loop !48

for.inc116:                                       ; preds = %for.cond75.for.inc113_crit_edge, %for.cond1.preheader, %for.cond71.preheader
  %indvars.iv.next229 = add nuw nsw i64 %indvars.iv228, 1
  %exitcond232.not = icmp eq i64 %indvars.iv.next229, %wide.trip.count231
  br i1 %exitcond232.not, label %for.end118, label %for.cond1.preheader, !llvm.loop !49

for.end118:                                       ; preds = %for.inc116, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #3

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiiPA2048_fS0_(i32 noundef %nx, i32 noundef %ny, ptr nofree noundef readonly captures(none) %hz1, ptr nofree noundef readonly captures(none) %hz2) local_unnamed_addr #5 {
entry:
  %cmp28 = icmp sgt i32 %nx, 0
  %cmp225 = icmp sgt i32 %ny, 0
  %or.cond = and i1 %cmp28, %cmp225
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end16

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count37 = zext nneg i32 %nx to i64
  %wide.trip.count = zext nneg i32 %ny to i64
  %min.iters.check = icmp ult i32 %ny, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc14_crit_edge.us
  %indvars.iv34 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next35, %for.cond1.for.inc14_crit_edge.us ]
  %fail.030.us = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [8192 x i8], ptr %hz1, i64 %indvars.iv34
  %arrayidx7.us = getelementptr inbounds nuw [8192 x i8], ptr %hz2, i64 %indvars.iv34
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
  %31 = fcmp ogt <4 x double> %30, splat (double 1.005000e+01)
  %.not41 = select <4 x i1> %9, <4 x i1> splat (i1 true), <4 x i1> %14
  %narrow = select <4 x i1> %.not41, <4 x i1> %31, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %32 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !50

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
  %48 = fcmp ogt double %47, 1.005000e+01
  %49 = zext i1 %48 to i32
  br label %_Z11percentDiffdd.exit.us

_Z11percentDiffdd.exit.us:                        ; preds = %if.else.i.us, %land.lhs.true.i.us
  %retval.0.i.us = phi i32 [ %49, %if.else.i.us ], [ 0, %land.lhs.true.i.us ]
  %fail.2.us = add nsw i32 %retval.0.i.us, %fail.127.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us, !llvm.loop !51

for.cond1.for.inc14_crit_edge.us:                 ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %fail.2.us.lcssa = phi i32 [ %34, %middle.block ], [ %fail.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %for.end16, label %for.cond1.preheader.us, !llvm.loop !52

for.end16:                                        ; preds = %for.cond1.for.inc14_crit_edge.us, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %call17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 1.005000e+01, i32 noundef %fail.0.lcssa) #14
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
define dso_local void @_Z32__device_stub__fdtd_step1_kerneliiPfS_S_S_i(i32 noundef %nx, i32 noundef %ny, ptr noundef %_fict_, ptr noundef %ex, ptr noundef %ey, ptr noundef %hz, i32 noundef %t) #9 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %_fict_.addr = alloca ptr, align 8
  %ex.addr = alloca ptr, align 8
  %ey.addr = alloca ptr, align 8
  %hz.addr = alloca ptr, align 8
  %t.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %nx, ptr %nx.addr, align 4, !tbaa !53
  store i32 %ny, ptr %ny.addr, align 4, !tbaa !53
  store ptr %_fict_, ptr %_fict_.addr, align 8, !tbaa !54
  store ptr %ex, ptr %ex.addr, align 8, !tbaa !54
  store ptr %ey, ptr %ey.addr, align 8, !tbaa !54
  store ptr %hz, ptr %hz.addr, align 8, !tbaa !54
  store i32 %t, ptr %t.addr, align 4, !tbaa !53
  %kernel_args1 = alloca [7 x ptr], align 16
  store ptr %nx.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %ny.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %_fict_.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %ex.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %ey.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %hz.addr, ptr %4, align 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 48
  store ptr %t.addr, ptr %5, align 16
  %6 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %7 = load i64, ptr %shmem_size, align 8
  %8 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z32__device_stub__fdtd_step1_kerneliiPfS_S_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %7, ptr noundef %8)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z32__device_stub__fdtd_step2_kerneliiPfS_S_i(i32 noundef %nx, i32 noundef %ny, ptr noundef %ex, ptr noundef %ey, ptr noundef %hz, i32 noundef %t) #9 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca ptr, align 8
  %ey.addr = alloca ptr, align 8
  %hz.addr = alloca ptr, align 8
  %t.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %nx, ptr %nx.addr, align 4, !tbaa !53
  store i32 %ny, ptr %ny.addr, align 4, !tbaa !53
  store ptr %ex, ptr %ex.addr, align 8, !tbaa !54
  store ptr %ey, ptr %ey.addr, align 8, !tbaa !54
  store ptr %hz, ptr %hz.addr, align 8, !tbaa !54
  store i32 %t, ptr %t.addr, align 4, !tbaa !53
  %kernel_args1 = alloca [6 x ptr], align 16
  store ptr %nx.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %ny.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %ex.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %ey.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %hz.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %t.addr, ptr %4, align 8
  %5 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %6 = load i64, ptr %shmem_size, align 8
  %7 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z32__device_stub__fdtd_step2_kerneliiPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %6, ptr noundef %7)
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z32__device_stub__fdtd_step3_kerneliiPfS_S_i(i32 noundef %nx, i32 noundef %ny, ptr noundef %ex, ptr noundef %ey, ptr noundef %hz, i32 noundef %t) #9 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %ex.addr = alloca ptr, align 8
  %ey.addr = alloca ptr, align 8
  %hz.addr = alloca ptr, align 8
  %t.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %nx, ptr %nx.addr, align 4, !tbaa !53
  store i32 %ny, ptr %ny.addr, align 4, !tbaa !53
  store ptr %ex, ptr %ex.addr, align 8, !tbaa !54
  store ptr %ey, ptr %ey.addr, align 8, !tbaa !54
  store ptr %hz, ptr %hz.addr, align 8, !tbaa !54
  store i32 %t, ptr %t.addr, align 4, !tbaa !53
  %kernel_args1 = alloca [6 x ptr], align 16
  store ptr %nx.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %ny.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %ex.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %ey.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %hz.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %t.addr, ptr %4, align 8
  %5 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %6 = load i64, ptr %shmem_size, align 8
  %7 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z32__device_stub__fdtd_step3_kerneliiPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %6, ptr noundef %7)
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z8fdtdCudaiiiPfPA2048_fS1_S1_S1_(i32 noundef %tmax, i32 noundef %nx, i32 noundef %ny, ptr noundef %_fict_, ptr noundef %ex, ptr noundef %ey, ptr noundef %hz, ptr noundef %hz_outputFromGpu) local_unnamed_addr #7 {
entry:
  %nx.addr.i76 = alloca i32, align 4
  %ny.addr.i77 = alloca i32, align 4
  %ex.addr.i78 = alloca ptr, align 8
  %ey.addr.i79 = alloca ptr, align 8
  %hz.addr.i80 = alloca ptr, align 8
  %t.addr.i81 = alloca i32, align 4
  %grid_dim.i82 = alloca %struct.dim3, align 8
  %block_dim.i83 = alloca %struct.dim3, align 8
  %shmem_size.i84 = alloca i64, align 8
  %stream.i85 = alloca ptr, align 8
  %kernel_args1.i86 = alloca [6 x ptr], align 16
  %nx.addr.i58 = alloca i32, align 4
  %ny.addr.i59 = alloca i32, align 4
  %ex.addr.i60 = alloca ptr, align 8
  %ey.addr.i61 = alloca ptr, align 8
  %hz.addr.i62 = alloca ptr, align 8
  %t.addr.i63 = alloca i32, align 4
  %grid_dim.i64 = alloca %struct.dim3, align 8
  %block_dim.i65 = alloca %struct.dim3, align 8
  %shmem_size.i66 = alloca i64, align 8
  %stream.i67 = alloca ptr, align 8
  %kernel_args1.i68 = alloca [6 x ptr], align 16
  %nx.addr.i = alloca i32, align 4
  %ny.addr.i = alloca i32, align 4
  %_fict_.addr.i = alloca ptr, align 8
  %ex.addr.i = alloca ptr, align 8
  %ey.addr.i = alloca ptr, align 8
  %hz.addr.i = alloca ptr, align 8
  %t.addr.i = alloca i32, align 4
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [7 x ptr], align 16
  %Tp.i.i49 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %_fict_gpu = alloca ptr, align 8
  %ex_gpu = alloca ptr, align 8
  %ey_gpu = alloca ptr, align 8
  %hz_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %_fict_gpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %ex_gpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %ey_gpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %hz_gpu) #15
  %call = call i32 @cudaMalloc(ptr noundef nonnull %_fict_gpu, i64 noundef 2000) #14
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %ex_gpu, i64 noundef 16777216) #14
  %call2 = call i32 @cudaMalloc(ptr noundef nonnull %ey_gpu, i64 noundef 16777216) #14
  %call3 = call i32 @cudaMalloc(ptr noundef nonnull %hz_gpu, i64 noundef 16777216) #14
  %0 = load ptr, ptr %_fict_gpu, align 8, !tbaa !54
  %call4 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %_fict_, i64 noundef 2000, i32 noundef 1) #14
  %1 = load ptr, ptr %ex_gpu, align 8, !tbaa !54
  %call5 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %ex, i64 noundef 16777216, i32 noundef 1) #14
  %2 = load ptr, ptr %ey_gpu, align 8, !tbaa !54
  %call6 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %ey, i64 noundef 16777216, i32 noundef 1) #14
  %3 = load ptr, ptr %hz_gpu, align 8, !tbaa !54
  %call7 = call i32 @cudaMemcpy(ptr noundef %3, ptr noundef %hz, i64 noundef 16777216, i32 noundef 1) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %4 = load i64, ptr %Tp.i.i, align 8, !tbaa !57
  %conv.i.i = sitofp i64 %4 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %5 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !60
  %conv2.i.i = sitofp i64 %5 to double
  %6 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %6, ptr @polybench_t_start, align 8, !tbaa !61
  %cmp103 = icmp sgt i32 %tmax, 0
  br i1 %cmp103, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %_Z21polybench_timer_startv.exit
  %7 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  %8 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  %9 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  %10 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 32
  %11 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 40
  %12 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 48
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %13 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 8
  %14 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 16
  %15 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 24
  %16 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 32
  %17 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 40
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i70 = getelementptr inbounds nuw i8, ptr %grid_dim.i64, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i73 = getelementptr inbounds nuw i8, ptr %block_dim.i65, i64 8
  %18 = getelementptr inbounds nuw i8, ptr %kernel_args1.i86, i64 8
  %19 = getelementptr inbounds nuw i8, ptr %kernel_args1.i86, i64 16
  %20 = getelementptr inbounds nuw i8, ptr %kernel_args1.i86, i64 24
  %21 = getelementptr inbounds nuw i8, ptr %kernel_args1.i86, i64 32
  %22 = getelementptr inbounds nuw i8, ptr %kernel_args1.i86, i64 40
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i88 = getelementptr inbounds nuw i8, ptr %grid_dim.i82, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i91 = getelementptr inbounds nuw i8, ptr %block_dim.i83, i64 8
  br label %for.body

for.cond.cleanup:                                 ; preds = %kcall.end31, %_Z21polybench_timer_startv.exit
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i49) #15
  %call.i.i50 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i49, ptr noundef null) #16
  %cmp.not.i.i51 = icmp eq i32 %call.i.i50, 0
  br i1 %cmp.not.i.i51, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i52

if.then.i.i52:                                    ; preds = %for.cond.cleanup
  %call1.i.i53 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i50) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %for.cond.cleanup, %if.then.i.i52
  %23 = load i64, ptr %Tp.i.i49, align 8, !tbaa !57
  %conv.i.i54 = sitofp i64 %23 to double
  %tv_usec.i.i55 = getelementptr inbounds nuw i8, ptr %Tp.i.i49, i64 8
  %24 = load i64, ptr %tv_usec.i.i55, align 8, !tbaa !60
  %conv2.i.i56 = sitofp i64 %24 to double
  %25 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i56, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i54)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i49) #15
  store double %25, ptr @polybench_t_end, align 8, !tbaa !61
  %26 = load double, ptr @polybench_t_start, align 8, !tbaa !61
  %sub.i = fsub double %25, %26
  %call.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #14
  %27 = load ptr, ptr %hz_gpu, align 8, !tbaa !54
  %call34 = call i32 @cudaMemcpy(ptr noundef %hz_outputFromGpu, ptr noundef %27, i64 noundef 16777216, i32 noundef 2) #14
  %28 = load ptr, ptr %_fict_gpu, align 8, !tbaa !54
  %call35 = call i32 @cudaFree(ptr noundef %28) #14
  %29 = load ptr, ptr %ex_gpu, align 8, !tbaa !54
  %call36 = call i32 @cudaFree(ptr noundef %29) #14
  %30 = load ptr, ptr %ey_gpu, align 8, !tbaa !54
  %call37 = call i32 @cudaFree(ptr noundef %30) #14
  %31 = load ptr, ptr %hz_gpu, align 8, !tbaa !54
  %call38 = call i32 @cudaFree(ptr noundef %31) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %hz_gpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %ey_gpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %ex_gpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %_fict_gpu) #15
  ret void

for.body:                                         ; preds = %for.body.lr.ph, %kcall.end31
  %t.0104 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %kcall.end31 ]
  %call17 = call i32 @__cudaPushCallConfiguration(i64 1099511627840, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool.not = icmp eq i32 %call17, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %for.body
  %32 = load ptr, ptr %_fict_gpu, align 8, !tbaa !54
  %33 = load ptr, ptr %ex_gpu, align 8, !tbaa !54
  %34 = load ptr, ptr %ey_gpu, align 8, !tbaa !54
  %35 = load ptr, ptr %hz_gpu, align 8, !tbaa !54
  call void @llvm.lifetime.start.p0(ptr nonnull %nx.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %ny.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %_fict_.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %ex.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %ey.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %hz.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %t.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %nx, ptr %nx.addr.i, align 4, !tbaa !53
  store i32 %ny, ptr %ny.addr.i, align 4, !tbaa !53
  store ptr %32, ptr %_fict_.addr.i, align 8, !tbaa !54
  store ptr %33, ptr %ex.addr.i, align 8, !tbaa !54
  store ptr %34, ptr %ey.addr.i, align 8, !tbaa !54
  store ptr %35, ptr %hz.addr.i, align 8, !tbaa !54
  store i32 %t.0104, ptr %t.addr.i, align 4, !tbaa !53
  store ptr %nx.addr.i, ptr %kernel_args1.i, align 16
  store ptr %ny.addr.i, ptr %7, align 8
  store ptr %_fict_.addr.i, ptr %8, align 16
  store ptr %ex.addr.i, ptr %9, align 8
  store ptr %ey.addr.i, ptr %10, align 16
  store ptr %hz.addr.i, ptr %11, align 8
  store ptr %t.addr.i, ptr %12, align 16
  %36 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !63
  %37 = load i64, ptr %shmem_size.i, align 8
  %38 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i57 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z32__device_stub__fdtd_step1_kerneliiPfS_S_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %37, ptr noundef %38), !inline_history !63
  call void @llvm.lifetime.end.p0(ptr nonnull %nx.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %ny.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %_fict_.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %ex.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %ey.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %hz.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %t.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %for.body
  %call18 = call i32 @cudaThreadSynchronize() #14
  %call21 = call i32 @__cudaPushCallConfiguration(i64 1099511627840, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool22.not = icmp eq i32 %call21, 0
  br i1 %tobool22.not, label %kcall.configok23, label %kcall.end24

kcall.configok23:                                 ; preds = %kcall.end
  %39 = load ptr, ptr %ex_gpu, align 8, !tbaa !54
  %40 = load ptr, ptr %ey_gpu, align 8, !tbaa !54
  %41 = load ptr, ptr %hz_gpu, align 8, !tbaa !54
  call void @llvm.lifetime.start.p0(ptr nonnull %nx.addr.i58)
  call void @llvm.lifetime.start.p0(ptr nonnull %ny.addr.i59)
  call void @llvm.lifetime.start.p0(ptr nonnull %ex.addr.i60)
  call void @llvm.lifetime.start.p0(ptr nonnull %ey.addr.i61)
  call void @llvm.lifetime.start.p0(ptr nonnull %hz.addr.i62)
  call void @llvm.lifetime.start.p0(ptr nonnull %t.addr.i63)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i64)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i65)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i66)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i67)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i68)
  store i32 %nx, ptr %nx.addr.i58, align 4, !tbaa !53
  store i32 %ny, ptr %ny.addr.i59, align 4, !tbaa !53
  store ptr %39, ptr %ex.addr.i60, align 8, !tbaa !54
  store ptr %40, ptr %ey.addr.i61, align 8, !tbaa !54
  store ptr %41, ptr %hz.addr.i62, align 8, !tbaa !54
  store i32 %t.0104, ptr %t.addr.i63, align 4, !tbaa !53
  store ptr %nx.addr.i58, ptr %kernel_args1.i68, align 16
  store ptr %ny.addr.i59, ptr %13, align 8
  store ptr %ex.addr.i60, ptr %14, align 16
  store ptr %ey.addr.i61, ptr %15, align 8
  store ptr %hz.addr.i62, ptr %16, align 16
  store ptr %t.addr.i63, ptr %17, align 8
  %42 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i64, ptr nonnull %block_dim.i65, ptr nonnull %shmem_size.i66, ptr nonnull %stream.i67), !inline_history !64
  %43 = load i64, ptr %shmem_size.i66, align 8
  %44 = load ptr, ptr %stream.i67, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i69 = load i64, ptr %grid_dim.i64, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i71 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i70, align 8
  %block_dim.coerce.sroa.0.0.copyload.i72 = load i64, ptr %block_dim.i65, align 8
  %block_dim.coerce.sroa.2.0.copyload.i74 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i73, align 8
  %call.i75 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z32__device_stub__fdtd_step2_kerneliiPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload.i69, i32 %grid_dim.coerce.sroa.2.0.copyload.i71, i64 %block_dim.coerce.sroa.0.0.copyload.i72, i32 %block_dim.coerce.sroa.2.0.copyload.i74, ptr noundef nonnull %kernel_args1.i68, i64 noundef %43, ptr noundef %44), !inline_history !64
  call void @llvm.lifetime.end.p0(ptr nonnull %nx.addr.i58)
  call void @llvm.lifetime.end.p0(ptr nonnull %ny.addr.i59)
  call void @llvm.lifetime.end.p0(ptr nonnull %ex.addr.i60)
  call void @llvm.lifetime.end.p0(ptr nonnull %ey.addr.i61)
  call void @llvm.lifetime.end.p0(ptr nonnull %hz.addr.i62)
  call void @llvm.lifetime.end.p0(ptr nonnull %t.addr.i63)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i64)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i65)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i66)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i67)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i68)
  br label %kcall.end24

kcall.end24:                                      ; preds = %kcall.configok23, %kcall.end
  %call25 = call i32 @cudaThreadSynchronize() #14
  %call28 = call i32 @__cudaPushCallConfiguration(i64 1099511627840, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool29.not = icmp eq i32 %call28, 0
  br i1 %tobool29.not, label %kcall.configok30, label %kcall.end31

kcall.configok30:                                 ; preds = %kcall.end24
  %45 = load ptr, ptr %ex_gpu, align 8, !tbaa !54
  %46 = load ptr, ptr %ey_gpu, align 8, !tbaa !54
  %47 = load ptr, ptr %hz_gpu, align 8, !tbaa !54
  call void @llvm.lifetime.start.p0(ptr nonnull %nx.addr.i76)
  call void @llvm.lifetime.start.p0(ptr nonnull %ny.addr.i77)
  call void @llvm.lifetime.start.p0(ptr nonnull %ex.addr.i78)
  call void @llvm.lifetime.start.p0(ptr nonnull %ey.addr.i79)
  call void @llvm.lifetime.start.p0(ptr nonnull %hz.addr.i80)
  call void @llvm.lifetime.start.p0(ptr nonnull %t.addr.i81)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i82)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i83)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i84)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i85)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i86)
  store i32 %nx, ptr %nx.addr.i76, align 4, !tbaa !53
  store i32 %ny, ptr %ny.addr.i77, align 4, !tbaa !53
  store ptr %45, ptr %ex.addr.i78, align 8, !tbaa !54
  store ptr %46, ptr %ey.addr.i79, align 8, !tbaa !54
  store ptr %47, ptr %hz.addr.i80, align 8, !tbaa !54
  store i32 %t.0104, ptr %t.addr.i81, align 4, !tbaa !53
  store ptr %nx.addr.i76, ptr %kernel_args1.i86, align 16
  store ptr %ny.addr.i77, ptr %18, align 8
  store ptr %ex.addr.i78, ptr %19, align 16
  store ptr %ey.addr.i79, ptr %20, align 8
  store ptr %hz.addr.i80, ptr %21, align 16
  store ptr %t.addr.i81, ptr %22, align 8
  %48 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i82, ptr nonnull %block_dim.i83, ptr nonnull %shmem_size.i84, ptr nonnull %stream.i85), !inline_history !65
  %49 = load i64, ptr %shmem_size.i84, align 8
  %50 = load ptr, ptr %stream.i85, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i87 = load i64, ptr %grid_dim.i82, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i89 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i88, align 8
  %block_dim.coerce.sroa.0.0.copyload.i90 = load i64, ptr %block_dim.i83, align 8
  %block_dim.coerce.sroa.2.0.copyload.i92 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i91, align 8
  %call.i93 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z32__device_stub__fdtd_step3_kerneliiPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload.i87, i32 %grid_dim.coerce.sroa.2.0.copyload.i89, i64 %block_dim.coerce.sroa.0.0.copyload.i90, i32 %block_dim.coerce.sroa.2.0.copyload.i92, ptr noundef nonnull %kernel_args1.i86, i64 noundef %49, ptr noundef %50), !inline_history !65
  call void @llvm.lifetime.end.p0(ptr nonnull %nx.addr.i76)
  call void @llvm.lifetime.end.p0(ptr nonnull %ny.addr.i77)
  call void @llvm.lifetime.end.p0(ptr nonnull %ex.addr.i78)
  call void @llvm.lifetime.end.p0(ptr nonnull %ey.addr.i79)
  call void @llvm.lifetime.end.p0(ptr nonnull %hz.addr.i80)
  call void @llvm.lifetime.end.p0(ptr nonnull %t.addr.i81)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i82)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i83)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i84)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i85)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i86)
  br label %kcall.end31

kcall.end31:                                      ; preds = %kcall.configok30, %kcall.end24
  %call32 = call i32 @cudaThreadSynchronize() #14
  %inc = add nuw nsw i32 %t.0104, 1
  %exitcond.not = icmp eq i32 %inc, %tmax
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !66
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !57
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !60
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_start, align 8, !tbaa !61
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !57
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !60
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_end, align 8, !tbaa !61
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !61
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !61
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #14
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #9 {
entry:
  %Tp.i.i73 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i64 = alloca ptr, align 8
  %newA.i.i57 = alloca ptr, align 8
  %newA.i.i50 = alloca ptr, align 8
  %newA.i.i43 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #15
  store ptr null, ptr %newA.i.i, align 8, !tbaa !67
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 2000) #16
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !67
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !68
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i43) #15
  store ptr null, ptr %newA.i.i43, align 8, !tbaa !67
  %call.i.i44 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i43, i64 noundef 32, i64 noundef 16777216) #16
  %3 = load ptr, ptr %newA.i.i43, align 8, !tbaa !67
  %4 = ptrtoaddr ptr %3 to i64
  %tobool.i.i45 = icmp eq ptr %3, null
  %tobool1.i.i46 = icmp ne i32 %call.i.i44, 0
  %or.cond.i.i47 = select i1 %tobool.i.i45, i1 true, i1 %tobool1.i.i46
  br i1 %or.cond.i.i47, label %if.then.i.i48, label %_Z20polybench_alloc_datayi.exit49

if.then.i.i48:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %5 = load ptr, ptr @stderr, align 8, !tbaa !68
  %6 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %5) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit49:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i43) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i50) #15
  store ptr null, ptr %newA.i.i50, align 8, !tbaa !67
  %call.i.i51 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i50, i64 noundef 32, i64 noundef 16777216) #16
  %7 = load ptr, ptr %newA.i.i50, align 8, !tbaa !67
  %8 = ptrtoaddr ptr %7 to i64
  %tobool.i.i52 = icmp eq ptr %7, null
  %tobool1.i.i53 = icmp ne i32 %call.i.i51, 0
  %or.cond.i.i54 = select i1 %tobool.i.i52, i1 true, i1 %tobool1.i.i53
  br i1 %or.cond.i.i54, label %if.then.i.i55, label %_Z20polybench_alloc_datayi.exit56

if.then.i.i55:                                    ; preds = %_Z20polybench_alloc_datayi.exit49
  %9 = load ptr, ptr @stderr, align 8, !tbaa !68
  %10 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %9) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit56:                ; preds = %_Z20polybench_alloc_datayi.exit49
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i50) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i57) #15
  store ptr null, ptr %newA.i.i57, align 8, !tbaa !67
  %call.i.i58 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i57, i64 noundef 32, i64 noundef 16777216) #16
  %11 = load ptr, ptr %newA.i.i57, align 8, !tbaa !67
  %12 = ptrtoaddr ptr %11 to i64
  %tobool.i.i59 = icmp eq ptr %11, null
  %tobool1.i.i60 = icmp ne i32 %call.i.i58, 0
  %or.cond.i.i61 = select i1 %tobool.i.i59, i1 true, i1 %tobool1.i.i60
  br i1 %or.cond.i.i61, label %if.then.i.i62, label %_Z20polybench_alloc_datayi.exit63

if.then.i.i62:                                    ; preds = %_Z20polybench_alloc_datayi.exit56
  %13 = load ptr, ptr @stderr, align 8, !tbaa !68
  %14 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %13) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit63:                ; preds = %_Z20polybench_alloc_datayi.exit56
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i57) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i64) #15
  store ptr null, ptr %newA.i.i64, align 8, !tbaa !67
  %call.i.i65 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i64, i64 noundef 32, i64 noundef 16777216) #16
  %15 = load ptr, ptr %newA.i.i64, align 8, !tbaa !67
  %tobool.i.i66 = icmp eq ptr %15, null
  %tobool1.i.i67 = icmp ne i32 %call.i.i65, 0
  %or.cond.i.i68 = select i1 %tobool.i.i66, i1 true, i1 %tobool1.i.i67
  br i1 %or.cond.i.i68, label %if.then.i.i69, label %_Z20polybench_alloc_datayi.exit70

if.then.i.i69:                                    ; preds = %_Z20polybench_alloc_datayi.exit63
  %16 = load ptr, ptr @stderr, align 8, !tbaa !68
  %17 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %16) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit70:                ; preds = %_Z20polybench_alloc_datayi.exit63
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i64) #15
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %_Z20polybench_alloc_datayi.exit70
  %index = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit70 ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %_Z20polybench_alloc_datayi.exit70 ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %18 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %19 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %20 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %index
  %21 = getelementptr inbounds nuw i8, ptr %20, i64 16
  store <4 x float> %18, ptr %20, align 4, !tbaa !10
  store <4 x float> %19, ptr %21, align 4, !tbaa !10
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %22 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %23 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %24 = getelementptr inbounds nuw [4 x i8], ptr %0, i64 %index
  %25 = getelementptr inbounds nuw i8, ptr %24, i64 32
  %26 = getelementptr inbounds nuw i8, ptr %24, i64 48
  store <4 x float> %22, ptr %25, align 4, !tbaa !10
  store <4 x float> %23, ptr %26, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %27 = icmp eq i64 %index.next.1, 496
  br i1 %27, label %for.body.i, label %vector.body, !llvm.loop !70

for.body.i:                                       ; preds = %vector.body
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %0, i64 1984
  store float 4.960000e+02, ptr %arrayidx.i, align 4, !tbaa !10
  %arrayidx.i.1 = getelementptr inbounds nuw i8, ptr %0, i64 1988
  store float 4.970000e+02, ptr %arrayidx.i.1, align 4, !tbaa !10
  %arrayidx.i.2 = getelementptr inbounds nuw i8, ptr %0, i64 1992
  store float 4.980000e+02, ptr %arrayidx.i.2, align 4, !tbaa !10
  %arrayidx.i.3 = getelementptr inbounds nuw i8, ptr %0, i64 1996
  store float 4.990000e+02, ptr %arrayidx.i.3, align 4, !tbaa !10
  %28 = sub i64 %4, %8
  %diff.check = icmp ugt i64 %28, -16
  %29 = sub i64 %4, %12
  %diff.check89 = icmp ugt i64 %29, -16
  %conflict.rdx = or i1 %diff.check, %diff.check89
  %30 = sub i64 %8, %12
  %diff.check90 = icmp ugt i64 %30, -16
  %conflict.rdx91 = or i1 %conflict.rdx, %diff.check90
  br label %for.cond4.preheader.i

for.cond4.preheader.i:                            ; preds = %for.body.i, %for.cond4.for.inc33_crit_edge.i
  %indvars.iv68.i = phi i64 [ %indvars.iv.next69.i, %for.cond4.for.inc33_crit_edge.i ], [ 0, %for.body.i ]
  %31 = trunc i64 %indvars.iv68.i to i32
  %conv7.i = uitofp nneg i32 %31 to float
  %arrayidx10.i = getelementptr inbounds nuw [8192 x i8], ptr %3, i64 %indvars.iv68.i
  %arrayidx18.i = getelementptr inbounds nuw [8192 x i8], ptr %7, i64 %indvars.iv68.i
  %32 = insertelement <2 x i32> poison, i32 %31, i64 0
  %33 = shufflevector <2 x i32> %32, <2 x i32> poison, <2 x i32> zeroinitializer
  %34 = add <2 x i32> %33, <i32 -1, i32 -9>
  %35 = sitofp <2 x i32> %34 to <2 x float>
  %arrayidx27.i = getelementptr inbounds nuw [8192 x i8], ptr %11, i64 %indvars.iv68.i
  br i1 %conflict.rdx91, label %for.body6.i, label %vector.ph93

vector.ph93:                                      ; preds = %for.cond4.preheader.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv7.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splat95 = shufflevector <2 x float> %35, <2 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splat97 = shufflevector <2 x float> %35, <2 x float> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  br label %vector.body98

vector.body98:                                    ; preds = %vector.body98, %vector.ph93
  %index99 = phi i64 [ 0, %vector.ph93 ], [ %index.next102, %vector.body98 ]
  %vec.ind100 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph93 ], [ %vec.ind.next103, %vector.body98 ]
  %vec.ind101 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph93 ], [ %vec.ind.next104, %vector.body98 ]
  %36 = trunc <4 x i64> %vec.ind100 to <4 x i32>
  %37 = add <4 x i32> %36, splat (i32 1)
  %38 = uitofp nneg <4 x i32> %37 to <4 x float>
  %39 = call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %38, <4 x float> splat (float 1.000000e+00))
  %40 = fmul nnan <4 x float> %39, splat (float f0x3A000000)
  %41 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.i, i64 %index99
  store <4 x float> %40, ptr %41, align 4, !tbaa !10
  %42 = add <4 x i32> %vec.ind101, splat (i32 2)
  %43 = uitofp nneg <4 x i32> %42 to <4 x float>
  %44 = call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat95, <4 x float> %43, <4 x float> splat (float 2.000000e+00))
  %45 = fmul nnan <4 x float> %44, splat (float f0x3A000000)
  %46 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx18.i, i64 %index99
  store <4 x float> %45, ptr %46, align 4, !tbaa !10
  %47 = add <4 x i32> %vec.ind101, splat (i32 4)
  %48 = uitofp nneg <4 x i32> %47 to <4 x float>
  %49 = call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat97, <4 x float> %48, <4 x float> splat (float 3.000000e+00))
  %50 = fmul nnan <4 x float> %49, splat (float f0x3A000000)
  %51 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27.i, i64 %index99
  store <4 x float> %50, ptr %51, align 4, !tbaa !10
  %index.next102 = add nuw i64 %index99, 4
  %vec.ind.next103 = add nuw nsw <4 x i64> %vec.ind100, splat (i64 4)
  %vec.ind.next104 = add <4 x i32> %vec.ind101, splat (i32 4)
  %52 = icmp eq i64 %index.next102, 2048
  br i1 %52, label %for.cond4.for.inc33_crit_edge.i, label %vector.body98, !llvm.loop !71

for.body6.i:                                      ; preds = %for.cond4.preheader.i, %for.body6.i
  %indvars.iv61.i = phi i64 [ %indvars.iv.next62.i, %for.body6.i ], [ 0, %for.cond4.preheader.i ]
  %indvars.iv.next62.i = add nuw nsw i64 %indvars.iv61.i, 1
  %53 = trunc nuw nsw i64 %indvars.iv.next62.i to i32
  %conv8.i = uitofp nneg i32 %53 to float
  %54 = call nnan float @llvm.fmuladd.f32(float %conv7.i, float %conv8.i, float 1.000000e+00)
  %div.i = fmul nnan float %54, f0x3A000000
  %arrayidx12.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.i, i64 %indvars.iv61.i
  store float %div.i, ptr %arrayidx12.i, align 4, !tbaa !10
  %55 = trunc i64 %indvars.iv61.i to i32
  %arrayidx20.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx18.i, i64 %indvars.iv61.i
  %56 = add i32 %55, 4
  %57 = add i32 %55, 2
  %conv24.i = uitofp nneg i32 %56 to float
  %conv15.i = uitofp nneg i32 %57 to float
  %58 = insertelement <2 x float> poison, float %conv15.i, i64 0
  %59 = insertelement <2 x float> %58, float %conv24.i, i64 1
  %60 = call nnan <2 x float> @llvm.fmuladd.v2f32(<2 x float> %35, <2 x float> %59, <2 x float> <float 2.000000e+00, float 3.000000e+00>)
  %61 = fmul nnan <2 x float> %60, splat (float f0x3A000000)
  %62 = extractelement <2 x float> %61, i64 0
  store float %62, ptr %arrayidx20.i, align 4, !tbaa !10
  %arrayidx29.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx27.i, i64 %indvars.iv61.i
  %63 = extractelement <2 x float> %61, i64 1
  store float %63, ptr %arrayidx29.i, align 4, !tbaa !10
  %exitcond67.not.i = icmp eq i64 %indvars.iv.next62.i, 2048
  br i1 %exitcond67.not.i, label %for.cond4.for.inc33_crit_edge.i, label %for.body6.i, !llvm.loop !72

for.cond4.for.inc33_crit_edge.i:                  ; preds = %vector.body98, %for.body6.i
  %indvars.iv.next69.i = add nuw nsw i64 %indvars.iv68.i, 1
  %exitcond74.not.i = icmp eq i64 %indvars.iv.next69.i, 2048
  br i1 %exitcond74.not.i, label %_Z11init_arraysiiiPfPA2048_fS1_S1_.exit, label %for.cond4.preheader.i, !llvm.loop !19

_Z11init_arraysiiiPfPA2048_fS1_S1_.exit:          ; preds = %for.cond4.for.inc33_crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #15
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #14
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #14
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #15
  call void @_Z8fdtdCudaiiiPfPA2048_fS1_S1_S1_(i32 noundef 500, i32 noundef 2048, i32 noundef 2048, ptr noundef nonnull %0, ptr noundef nonnull %3, ptr noundef nonnull %7, ptr noundef nonnull %11, ptr noundef nonnull %15) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i71 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i71, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i72

if.then.i.i72:                                    ; preds = %_Z11init_arraysiiiPfPA2048_fS1_S1_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i71) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z11init_arraysiiiPfPA2048_fS1_S1_.exit, %if.then.i.i72
  %64 = load i64, ptr %Tp.i.i, align 8, !tbaa !57
  %conv.i.i = sitofp i64 %64 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %65 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !60
  %conv2.i.i = sitofp i64 %65 to double
  %66 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %66, ptr @polybench_t_start, align 8, !tbaa !61
  call void @_Z7runFdtdiiiPfPA2048_fS1_S1_(i32 noundef 500, i32 noundef 2048, i32 noundef 2048, ptr noundef nonnull %0, ptr noundef nonnull %3, ptr noundef nonnull %7, ptr noundef nonnull %11) #14
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i73) #15
  %call.i.i74 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i73, ptr noundef null) #16
  %cmp.not.i.i75 = icmp eq i32 %call.i.i74, 0
  br i1 %cmp.not.i.i75, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i76

if.then.i.i76:                                    ; preds = %_Z21polybench_timer_startv.exit
  %call1.i.i77 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i74) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z21polybench_timer_startv.exit, %if.then.i.i76
  %67 = load i64, ptr %Tp.i.i73, align 8, !tbaa !57
  %conv.i.i78 = sitofp i64 %67 to double
  %tv_usec.i.i79 = getelementptr inbounds nuw i8, ptr %Tp.i.i73, i64 8
  %68 = load i64, ptr %tv_usec.i.i79, align 8, !tbaa !60
  %conv2.i.i80 = sitofp i64 %68 to double
  %69 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i80, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i78)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i73) #15
  store double %69, ptr @polybench_t_end, align 8, !tbaa !61
  %70 = load double, ptr @polybench_t_start, align 8, !tbaa !61
  %sub.i = fsub double %69, %70
  %call.i81 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #14
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc14_crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv34.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next35.i, %for.cond1.for.inc14_crit_edge.us.i ]
  %fail.030.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %105, %for.cond1.for.inc14_crit_edge.us.i ]
  %arrayidx.us.i = getelementptr inbounds nuw [8192 x i8], ptr %11, i64 %indvars.iv34.i
  %arrayidx7.us.i = getelementptr inbounds nuw [8192 x i8], ptr %15, i64 %indvars.iv34.i
  %71 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.030.us.i, i64 0
  br label %vector.body108

vector.body108:                                   ; preds = %vector.body108, %for.cond1.preheader.us.i
  %index109 = phi i64 [ 0, %for.cond1.preheader.us.i ], [ %index.next111, %vector.body108 ]
  %vec.phi = phi <4 x i32> [ %71, %for.cond1.preheader.us.i ], [ %103, %vector.body108 ]
  %72 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i, i64 %index109
  %wide.load = load <4 x float>, ptr %72, align 4, !tbaa !10
  %73 = fpext <4 x float> %wide.load to <4 x double>
  %74 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us.i, i64 %index109
  %wide.load110 = load <4 x float>, ptr %74, align 4, !tbaa !10
  %75 = fpext <4 x float> %wide.load110 to <4 x double>
  %76 = fcmp olt <4 x double> %73, splat (double f0xB690000000000000)
  %77 = fneg <4 x float> %wide.load
  %78 = select <4 x i1> %76, <4 x float> %77, <4 x float> %wide.load
  %79 = fpext <4 x float> %78 to <4 x double>
  %80 = fcmp uge <4 x double> %79, splat (double 1.000000e-02)
  %81 = fcmp olt <4 x double> %75, splat (double f0xB690000000000000)
  %82 = fneg <4 x float> %wide.load110
  %83 = select <4 x i1> %81, <4 x float> %82, <4 x float> %wide.load110
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
  %102 = fcmp ogt <4 x double> %101, splat (double 1.005000e+01)
  %.not114 = select <4 x i1> %80, <4 x i1> splat (i1 true), <4 x i1> %85
  %narrow = select <4 x i1> %.not114, <4 x i1> %102, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %103 = add <4 x i32> %vec.phi, %predphi
  %index.next111 = add nuw i64 %index109, 4
  %104 = icmp eq i64 %index.next111, 2048
  br i1 %104, label %for.cond1.for.inc14_crit_edge.us.i, label %vector.body108, !llvm.loop !73

for.cond1.for.inc14_crit_edge.us.i:               ; preds = %vector.body108
  %105 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %103)
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond38.not.i = icmp eq i64 %indvars.iv.next35.i, 2048
  br i1 %exitcond38.not.i, label %_Z14compareResultsiiPA2048_fS0_.exit, label %for.cond1.preheader.us.i, !llvm.loop !52

_Z14compareResultsiiPA2048_fS0_.exit:             ; preds = %for.cond1.for.inc14_crit_edge.us.i
  %call17.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 1.005000e+01, i32 noundef %105) #14
  call void @free(ptr noundef %0) #16
  call void @free(ptr noundef %3) #16
  call void @free(ptr noundef %7) #16
  call void @free(ptr noundef nonnull %11) #16
  call void @free(ptr noundef nonnull %15) #16
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #15
  store ptr null, ptr %newA.i, align 8, !tbaa !67
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #16
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !67
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !68
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
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @llvm.fmuladd.v4f64(<4 x double>, <4 x double>, <4 x double>) #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #13

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
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
!12 = distinct !{!12, !13, !14, !15}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.isvectorized", i32 1}
!15 = !{!"llvm.loop.unroll.runtime.disable"}
!16 = distinct !{!16, !13, !15, !14}
!17 = distinct !{!17, !13, !14, !15}
!18 = distinct !{!18, !13, !14}
!19 = distinct !{!19, !13}
!20 = distinct !{!20, !13, !14, !15}
!21 = distinct !{!21, !13, !15, !14}
!22 = !{!23}
!23 = distinct !{!23, !24}
!24 = distinct !{!24, !"LVerDomain"}
!25 = !{!26}
!26 = distinct !{!26, !24}
!27 = distinct !{!27, !13, !14, !15}
!28 = distinct !{!28, !13, !14}
!29 = distinct !{!29, !13}
!30 = !{!31}
!31 = distinct !{!31, !32}
!32 = distinct !{!32, !"LVerDomain"}
!33 = !{!34}
!34 = distinct !{!34, !32}
!35 = distinct !{!35, !13, !14, !15}
!36 = distinct !{!36, !13, !14}
!37 = distinct !{!37, !13}
!38 = !{!39}
!39 = distinct !{!39, !40}
!40 = distinct !{!40, !"LVerDomain"}
!41 = !{!42, !43}
!42 = distinct !{!42, !40}
!43 = distinct !{!43, !40}
!44 = !{!42}
!45 = !{!43}
!46 = distinct !{!46, !13, !14, !15}
!47 = distinct !{!47, !13, !14}
!48 = distinct !{!48, !13}
!49 = distinct !{!49, !13}
!50 = distinct !{!50, !13, !14, !15}
!51 = distinct !{!51, !13, !15, !14}
!52 = distinct !{!52, !13}
!53 = !{!7, !7, i64 0}
!54 = !{!55, !55, i64 0}
!55 = !{!"p1 float", !56, i64 0}
!56 = !{!"any pointer", !8, i64 0}
!57 = !{!58, !59, i64 0}
!58 = !{!"_ZTS7timeval", !59, i64 0, !59, i64 8}
!59 = !{!"long", !8, i64 0}
!60 = !{!58, !59, i64 8}
!61 = !{!62, !62, i64 0}
!62 = !{!"double", !8, i64 0}
!63 = !{ptr @_Z32__device_stub__fdtd_step1_kerneliiPfS_S_S_i}
!64 = !{ptr @_Z32__device_stub__fdtd_step2_kerneliiPfS_S_i}
!65 = !{ptr @_Z32__device_stub__fdtd_step3_kerneliiPfS_S_i}
!66 = distinct !{!66, !13}
!67 = !{!56, !56, i64 0}
!68 = !{!69, !69, i64 0}
!69 = !{!"p1 _ZTS8_IO_FILE", !56, i64 0}
!70 = distinct !{!70, !13, !14, !15}
!71 = distinct !{!71, !13, !14, !15}
!72 = distinct !{!72, !13, !14}
!73 = distinct !{!73, !13, !14, !15}
