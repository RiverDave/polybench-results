; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu"
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
define dso_local void @_Z3adiiiPA1024_fS0_S0_(i32 noundef %tsteps, i32 noundef %n, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef captures(none) %B, ptr nofree noundef captures(none) %X) local_unnamed_addr #1 {
entry:
  %cmp392 = icmp sgt i32 %tsteps, 0
  br i1 %cmp392, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp6372 = icmp slt i32 %n, 2
  %cmp58376 = icmp sgt i32 %n, 0
  %sub81 = add i32 %n, -2
  %cmp82378 = icmp slt i32 %n, 3
  %cmp123384 = icmp sgt i32 %n, 1
  %arrayidx191 = getelementptr i8, ptr %X, i64 4190208
  %arrayidx194 = getelementptr i8, ptr %B, i64 4190208
  %wide.trip.count401 = zext i32 %n to i64
  %wide.trip.count406 = zext nneg i32 %n to i64
  %wide.trip.count418 = zext nneg i32 %n to i64
  %wide.trip.count413 = zext i32 %sub81 to i64
  %wide.trip.count429 = zext i32 %n to i64
  %wide.trip.count434 = zext nneg i32 %n to i64
  %wide.trip.count446 = zext i32 %sub81 to i64
  %0 = shl nuw nsw i64 %wide.trip.count401, 2
  %1 = add nuw nsw i64 %0, 4190208
  %scevgep = getelementptr i8, ptr %X, i64 %1
  %scevgep457 = getelementptr i8, ptr %B, i64 %1
  %2 = mul nuw nsw i64 %wide.trip.count401, 4100
  %3 = add nsw i64 %2, -4096
  %scevgep460 = getelementptr i8, ptr %X, i64 %3
  %scevgep461 = getelementptr i8, ptr %B, i64 %3
  %scevgep462 = getelementptr i8, ptr %A, i64 4096
  %scevgep463 = getelementptr i8, ptr %A, i64 %3
  %4 = shl nuw nsw i64 %wide.trip.count413, 2
  %5 = sub nsw i64 4088, %4
  %scevgep493 = getelementptr i8, ptr %X, i64 %5
  %6 = shl nuw nsw i64 %wide.trip.count401, 12
  %7 = getelementptr i8, ptr %X, i64 %6
  %scevgep494 = getelementptr i8, ptr %7, i64 -4
  %scevgep495 = getelementptr i8, ptr %A, i64 %5
  %8 = add nsw i64 %6, -8
  %scevgep496 = getelementptr i8, ptr %A, i64 %8
  %scevgep497 = getelementptr i8, ptr %B, i64 %5
  %scevgep498 = getelementptr i8, ptr %B, i64 %8
  %scevgep526 = getelementptr i8, ptr %X, i64 4092
  %9 = shl nuw nsw i64 %wide.trip.count401, 12
  %scevgep527 = getelementptr i8, ptr %X, i64 %9
  %scevgep528 = getelementptr i8, ptr %B, i64 4092
  %scevgep529 = getelementptr i8, ptr %B, i64 %9
  %10 = shl nuw nsw i64 %wide.trip.count401, 2
  %11 = add nsw i64 %wide.trip.count429, -1
  %min.iters.check534 = icmp ult i32 %n, 4
  %bound0530 = icmp ult ptr %scevgep526, %scevgep529
  %bound1531 = icmp ult ptr %scevgep528, %scevgep527
  %found.conflict532 = and i1 %bound0530, %bound1531
  %n.vec537 = and i64 %wide.trip.count401, 2147483644
  %cmp.n542 = icmp eq i64 %n.vec537, %wide.trip.count401
  %xtraiter = and i64 %wide.trip.count429, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %min.iters.check507 = icmp ult i32 %sub81, 4
  %bound0499 = icmp ult ptr %scevgep493, %scevgep496
  %bound1500 = icmp ult ptr %scevgep495, %scevgep494
  %found.conflict501 = and i1 %bound0499, %bound1500
  %bound0502 = icmp ult ptr %scevgep493, %scevgep498
  %bound1503 = icmp ult ptr %scevgep497, %scevgep494
  %found.conflict504 = and i1 %bound0502, %bound1503
  %conflict.rdx505 = or i1 %found.conflict501, %found.conflict504
  %n.vec510 = and i64 %wide.trip.count413, 4294967292
  %cmp.n523 = icmp eq i64 %n.vec510, %wide.trip.count413
  %xtraiter558 = and i64 %wide.trip.count446, 1
  %lcmp.mod559.not = icmp eq i64 %xtraiter558, 0
  %12 = add nsw i64 %wide.trip.count446, -1
  %min.iters.check475 = icmp ult i32 %n, 4
  %bound0464 = icmp ult ptr %X, %scevgep461
  %bound1465 = icmp ult ptr %B, %scevgep460
  %found.conflict466 = and i1 %bound0464, %bound1465
  %bound0467 = icmp ult ptr %X, %scevgep463
  %bound1468 = icmp ult ptr %scevgep462, %scevgep460
  %found.conflict469 = and i1 %bound0467, %bound1468
  %conflict.rdx = or i1 %found.conflict466, %found.conflict469
  %bound0470 = icmp ult ptr %B, %scevgep463
  %bound1471 = icmp ult ptr %scevgep462, %scevgep461
  %found.conflict472 = and i1 %bound0470, %bound1471
  %conflict.rdx473 = or i1 %conflict.rdx, %found.conflict472
  %n.vec478 = and i64 %wide.trip.count401, 2147483644
  %cmp.n490 = icmp eq i64 %n.vec478, %wide.trip.count401
  %min.iters.check = icmp ult i32 %n, 4
  %bound0 = icmp ult ptr %arrayidx191, %scevgep457
  %bound1 = icmp ult ptr %arrayidx194, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  %n.vec = and i64 %wide.trip.count401, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count401
  %xtraiter560 = and i64 %wide.trip.count429, 3
  %lcmp.mod561.not = icmp eq i64 %xtraiter560, 0
  %xtraiter562 = and i64 %wide.trip.count429, 1
  %13 = icmp eq i64 %11, 0
  %unroll_iter = and i64 %wide.trip.count429, 2147483646
  %lcmp.mod563.not = icmp eq i64 %xtraiter562, 0
  %lcmp.mod564 = trunc i32 %n to i1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.cond.cleanup208
  %t.0393 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc251, %for.cond.cleanup208 ]
  br i1 %cmp6372, label %for.cond57.preheader, label %for.body8.lver.check

for.cond.cleanup:                                 ; preds = %for.cond.cleanup208, %entry
  ret void

for.cond57.preheader:                             ; preds = %for.cond5.for.cond.cleanup7_crit_edge, %for.cond1.preheader
  br i1 %cmp58376, label %for.body60.preheader, label %for.cond.cleanup208

for.body60.preheader:                             ; preds = %for.cond57.preheader
  %brmerge = select i1 %min.iters.check534, i1 true, i1 %found.conflict532
  br i1 %brmerge, label %for.body60.preheader557, label %vector.body538

vector.body538:                                   ; preds = %for.body60.preheader, %vector.body538
  %index539 = phi i64 [ %index.next540, %vector.body538 ], [ 0, %for.body60.preheader ]
  %14 = or disjoint i64 %index539, 1
  %15 = or disjoint i64 %index539, 2
  %16 = or disjoint i64 %index539, 3
  %17 = getelementptr inbounds nuw [4096 x i8], ptr %X, i64 %index539
  %18 = getelementptr inbounds nuw [4096 x i8], ptr %X, i64 %14
  %19 = getelementptr inbounds nuw [4096 x i8], ptr %X, i64 %15
  %20 = getelementptr inbounds nuw [4096 x i8], ptr %X, i64 %16
  %21 = getelementptr inbounds nuw i8, ptr %17, i64 4092
  %22 = getelementptr inbounds nuw i8, ptr %18, i64 4092
  %23 = getelementptr inbounds nuw i8, ptr %19, i64 4092
  %24 = getelementptr inbounds nuw i8, ptr %20, i64 4092
  %25 = load float, ptr %21, align 4, !tbaa !10, !alias.scope !12, !noalias !15
  %26 = load float, ptr %22, align 4, !tbaa !10, !alias.scope !12, !noalias !15
  %27 = load float, ptr %23, align 4, !tbaa !10, !alias.scope !12, !noalias !15
  %28 = load float, ptr %24, align 4, !tbaa !10, !alias.scope !12, !noalias !15
  %29 = insertelement <4 x float> poison, float %25, i64 0
  %30 = insertelement <4 x float> %29, float %26, i64 1
  %31 = insertelement <4 x float> %30, float %27, i64 2
  %32 = insertelement <4 x float> %31, float %28, i64 3
  %33 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %index539
  %34 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %14
  %35 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %15
  %36 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %16
  %37 = getelementptr inbounds nuw i8, ptr %33, i64 4092
  %38 = getelementptr inbounds nuw i8, ptr %34, i64 4092
  %39 = getelementptr inbounds nuw i8, ptr %35, i64 4092
  %40 = getelementptr inbounds nuw i8, ptr %36, i64 4092
  %41 = load float, ptr %37, align 4, !tbaa !10, !alias.scope !15
  %42 = load float, ptr %38, align 4, !tbaa !10, !alias.scope !15
  %43 = load float, ptr %39, align 4, !tbaa !10, !alias.scope !15
  %44 = load float, ptr %40, align 4, !tbaa !10, !alias.scope !15
  %45 = insertelement <4 x float> poison, float %41, i64 0
  %46 = insertelement <4 x float> %45, float %42, i64 1
  %47 = insertelement <4 x float> %46, float %43, i64 2
  %48 = insertelement <4 x float> %47, float %44, i64 3
  %49 = fdiv <4 x float> %32, %48
  %50 = extractelement <4 x float> %49, i64 0
  store float %50, ptr %21, align 4, !tbaa !10, !alias.scope !12, !noalias !15
  %51 = extractelement <4 x float> %49, i64 1
  store float %51, ptr %22, align 4, !tbaa !10, !alias.scope !12, !noalias !15
  %52 = extractelement <4 x float> %49, i64 2
  store float %52, ptr %23, align 4, !tbaa !10, !alias.scope !12, !noalias !15
  %53 = extractelement <4 x float> %49, i64 3
  store float %53, ptr %24, align 4, !tbaa !10, !alias.scope !12, !noalias !15
  %index.next540 = add nuw i64 %index539, 4
  %54 = icmp eq i64 %index.next540, %n.vec537
  br i1 %54, label %middle.block541, label %vector.body538, !llvm.loop !17

middle.block541:                                  ; preds = %vector.body538
  br i1 %cmp.n542, label %for.cond75.preheader, label %for.body60.preheader557

for.body60.preheader557:                          ; preds = %for.body60.preheader, %middle.block541
  %indvars.iv403.ph = phi i64 [ %n.vec537, %middle.block541 ], [ 0, %for.body60.preheader ]
  br i1 %lcmp.mod.not, label %for.body60.prol.loopexit, label %for.body60.prol

for.body60.prol:                                  ; preds = %for.body60.preheader557
  %arrayidx62.prol = getelementptr inbounds nuw [4096 x i8], ptr %X, i64 %indvars.iv403.ph
  %arrayidx63.prol = getelementptr inbounds nuw i8, ptr %arrayidx62.prol, i64 4092
  %55 = load float, ptr %arrayidx63.prol, align 4, !tbaa !10
  %arrayidx65.prol = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %indvars.iv403.ph
  %arrayidx66.prol = getelementptr inbounds nuw i8, ptr %arrayidx65.prol, i64 4092
  %56 = load float, ptr %arrayidx66.prol, align 4, !tbaa !10
  %div67.prol = fdiv float %55, %56
  store float %div67.prol, ptr %arrayidx63.prol, align 4, !tbaa !10
  %indvars.iv.next404.prol = or disjoint i64 %indvars.iv403.ph, 1
  br label %for.body60.prol.loopexit

for.body60.prol.loopexit:                         ; preds = %for.body60.prol, %for.body60.preheader557
  %indvars.iv403.unr = phi i64 [ %indvars.iv403.ph, %for.body60.preheader557 ], [ %indvars.iv.next404.prol, %for.body60.prol ]
  %57 = icmp eq i64 %11, %indvars.iv403.ph
  br i1 %57, label %for.cond75.preheader, label %for.body60

for.body8.lver.check:                             ; preds = %for.cond1.preheader, %for.cond5.for.cond.cleanup7_crit_edge
  %indvars.iv398 = phi i64 [ %indvars.iv.next399, %for.cond5.for.cond.cleanup7_crit_edge ], [ 0, %for.cond1.preheader ]
  %58 = shl nuw nsw i64 %indvars.iv398, 12
  %scevgep544 = getelementptr nuw i8, ptr %X, i64 %58
  %59 = add nuw i64 %10, %58
  %scevgep545 = getelementptr i8, ptr %X, i64 %59
  %scevgep546 = getelementptr nuw i8, ptr %B, i64 %58
  %scevgep547 = getelementptr i8, ptr %B, i64 %59
  %arrayidx = getelementptr inbounds nuw [4096 x i8], ptr %X, i64 %indvars.iv398
  %arrayidx16 = getelementptr inbounds nuw [4096 x i8], ptr %A, i64 %indvars.iv398
  %arrayidx20 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %indvars.iv398
  %.pre = load float, ptr %arrayidx20, align 4, !tbaa !10
  %bound0548 = icmp ult ptr %scevgep544, %scevgep547
  %bound1549 = icmp ult ptr %scevgep546, %scevgep545
  %found.conflict550 = and i1 %bound0548, %bound1549
  br i1 %found.conflict550, label %for.body8.lver.orig, label %for.body8.ph

for.body8.lver.orig:                              ; preds = %for.body8.lver.check, %for.body8.lver.orig
  %60 = phi float [ %sub48.lver.orig, %for.body8.lver.orig ], [ %.pre, %for.body8.lver.check ]
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %for.body8.lver.orig ], [ 1, %for.body8.lver.check ]
  %arrayidx10.lver.orig = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv.lver.orig
  %61 = load float, ptr %arrayidx10.lver.orig, align 4, !tbaa !10
  %62 = add nsw i64 %indvars.iv.lver.orig, -1
  %arrayidx14.lver.orig = getelementptr inbounds [4 x i8], ptr %arrayidx, i64 %62
  %63 = load float, ptr %arrayidx14.lver.orig, align 4, !tbaa !10
  %arrayidx18.lver.orig = getelementptr inbounds nuw [4 x i8], ptr %arrayidx16, i64 %indvars.iv.lver.orig
  %64 = load float, ptr %arrayidx18.lver.orig, align 4, !tbaa !10
  %mul.lver.orig = fmul float %63, %64
  %arrayidx23.lver.orig = getelementptr inbounds [4 x i8], ptr %arrayidx20, i64 %62
  %div.lver.orig = fdiv float %mul.lver.orig, %60
  %sub24.lver.orig = fsub float %61, %div.lver.orig
  store float %sub24.lver.orig, ptr %arrayidx10.lver.orig, align 4, !tbaa !10
  %arrayidx32.lver.orig = getelementptr inbounds nuw [4 x i8], ptr %arrayidx20, i64 %indvars.iv.lver.orig
  %65 = load float, ptr %arrayidx32.lver.orig, align 4, !tbaa !10
  %66 = load float, ptr %arrayidx18.lver.orig, align 4, !tbaa !10
  %mul41.lver.orig = fmul float %66, %66
  %67 = load float, ptr %arrayidx23.lver.orig, align 4, !tbaa !10
  %div47.lver.orig = fdiv float %mul41.lver.orig, %67
  %sub48.lver.orig = fsub float %65, %div47.lver.orig
  store float %sub48.lver.orig, ptr %arrayidx32.lver.orig, align 4, !tbaa !10
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.not.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %wide.trip.count401
  br i1 %exitcond.not.lver.orig, label %for.cond5.for.cond.cleanup7_crit_edge, label %for.body8.lver.orig, !llvm.loop !21

for.body8.ph:                                     ; preds = %for.body8.lver.check
  %68 = shl nuw nsw i64 %indvars.iv398, 12
  %scevgep553 = getelementptr nuw i8, ptr %B, i64 %68
  %scevgep552 = getelementptr nuw i8, ptr %X, i64 %68
  %load_initial = load float, ptr %scevgep552, align 4
  %load_initial554 = load float, ptr %scevgep553, align 4
  br label %for.body8

for.cond5.for.cond.cleanup7_crit_edge:            ; preds = %for.body8, %for.body8.lver.orig
  %indvars.iv.next399 = add nuw nsw i64 %indvars.iv398, 1
  %exitcond402.not = icmp eq i64 %indvars.iv.next399, %wide.trip.count401
  br i1 %exitcond402.not, label %for.cond57.preheader, label %for.body8.lver.check, !llvm.loop !22

for.body8:                                        ; preds = %for.body8.ph, %for.body8
  %store_forwarded555 = phi float [ %load_initial554, %for.body8.ph ], [ %sub48, %for.body8 ]
  %store_forwarded = phi float [ %load_initial, %for.body8.ph ], [ %sub24, %for.body8 ]
  %69 = phi float [ %.pre, %for.body8.ph ], [ %sub48, %for.body8 ]
  %indvars.iv = phi i64 [ 1, %for.body8.ph ], [ %indvars.iv.next, %for.body8 ]
  %arrayidx10 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  %70 = load float, ptr %arrayidx10, align 4, !tbaa !10
  %arrayidx18 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx16, i64 %indvars.iv
  %71 = load float, ptr %arrayidx18, align 4, !tbaa !10
  %mul = fmul float %store_forwarded, %71
  %div = fdiv float %mul, %69
  %sub24 = fsub float %70, %div
  store float %sub24, ptr %arrayidx10, align 4, !tbaa !10
  %arrayidx32 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx20, i64 %indvars.iv
  %72 = load float, ptr %arrayidx32, align 4, !tbaa !10
  %73 = load float, ptr %arrayidx18, align 4, !tbaa !10
  %mul41 = fmul float %73, %73
  %div47 = fdiv float %mul41, %store_forwarded555
  %sub48 = fsub float %72, %div47
  store float %sub48, ptr %arrayidx32, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count401
  br i1 %exitcond.not, label %for.cond5.for.cond.cleanup7_crit_edge, label %for.body8, !llvm.loop !21

for.cond75.preheader:                             ; preds = %for.body60.prol.loopexit, %for.body60, %middle.block541
  br i1 %cmp82378, label %for.cond122.preheader, label %for.cond80.preheader

for.body60:                                       ; preds = %for.body60.prol.loopexit, %for.body60
  %indvars.iv403 = phi i64 [ %indvars.iv.next404.1, %for.body60 ], [ %indvars.iv403.unr, %for.body60.prol.loopexit ]
  %arrayidx62 = getelementptr inbounds nuw [4096 x i8], ptr %X, i64 %indvars.iv403
  %arrayidx63 = getelementptr inbounds nuw i8, ptr %arrayidx62, i64 4092
  %74 = load float, ptr %arrayidx63, align 4, !tbaa !10
  %arrayidx65 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %indvars.iv403
  %arrayidx66 = getelementptr inbounds nuw i8, ptr %arrayidx65, i64 4092
  %75 = load float, ptr %arrayidx66, align 4, !tbaa !10
  %div67 = fdiv float %74, %75
  store float %div67, ptr %arrayidx63, align 4, !tbaa !10
  %indvars.iv.next404 = add nuw nsw i64 %indvars.iv403, 1
  %arrayidx62.1 = getelementptr inbounds nuw [4096 x i8], ptr %X, i64 %indvars.iv.next404
  %arrayidx63.1 = getelementptr inbounds nuw i8, ptr %arrayidx62.1, i64 4092
  %76 = load float, ptr %arrayidx63.1, align 4, !tbaa !10
  %arrayidx65.1 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %indvars.iv.next404
  %arrayidx66.1 = getelementptr inbounds nuw i8, ptr %arrayidx65.1, i64 4092
  %77 = load float, ptr %arrayidx66.1, align 4, !tbaa !10
  %div67.1 = fdiv float %76, %77
  store float %div67.1, ptr %arrayidx63.1, align 4, !tbaa !10
  %indvars.iv.next404.1 = add nuw nsw i64 %indvars.iv403, 2
  %exitcond407.not.1 = icmp eq i64 %indvars.iv.next404.1, %wide.trip.count406
  br i1 %exitcond407.not.1, label %for.cond75.preheader, label %for.body60, !llvm.loop !23

for.cond122.preheader:                            ; preds = %for.cond80.for.cond.cleanup83_crit_edge, %for.cond75.preheader
  br i1 %cmp123384, label %for.cond127.preheader, label %for.cond187.preheader

for.cond80.preheader:                             ; preds = %for.cond75.preheader, %for.cond80.for.cond.cleanup83_crit_edge
  %indvars.iv415 = phi i64 [ %indvars.iv.next416, %for.cond80.for.cond.cleanup83_crit_edge ], [ 0, %for.cond75.preheader ]
  %arrayidx86 = getelementptr inbounds nuw [4096 x i8], ptr %X, i64 %indvars.iv415
  %arrayidx97 = getelementptr inbounds nuw [4096 x i8], ptr %A, i64 %indvars.iv415
  %arrayidx104 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %indvars.iv415
  %brmerge565 = select i1 %min.iters.check507, i1 true, i1 %conflict.rdx505
  br i1 %brmerge565, label %for.body84.preheader, label %vector.body511

vector.body511:                                   ; preds = %for.cond80.preheader, %vector.body511
  %index512 = phi i64 [ %index.next521, %vector.body511 ], [ 0, %for.cond80.preheader ]
  %78 = sub nsw i64 1022, %index512
  %79 = getelementptr inbounds [4 x i8], ptr %arrayidx86, i64 %78
  %80 = getelementptr inbounds i8, ptr %79, i64 -12
  %wide.load513 = load <4 x float>, ptr %80, align 4, !tbaa !10, !alias.scope !24, !noalias !27
  %81 = sub nsw i64 1021, %index512
  %82 = getelementptr inbounds [4 x i8], ptr %arrayidx86, i64 %81
  %83 = getelementptr inbounds i8, ptr %82, i64 -12
  %wide.load514 = load <4 x float>, ptr %83, align 4, !tbaa !10, !alias.scope !24, !noalias !27
  %84 = getelementptr inbounds [4 x i8], ptr %arrayidx97, i64 %81
  %85 = getelementptr inbounds i8, ptr %84, i64 -12
  %wide.load515 = load <4 x float>, ptr %85, align 4, !tbaa !10, !alias.scope !30
  %86 = fneg <4 x float> %wide.load514
  %87 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %86, <4 x float> %wide.load515, <4 x float> %wide.load513)
  %88 = getelementptr inbounds [4 x i8], ptr %arrayidx104, i64 %81
  %89 = getelementptr inbounds i8, ptr %88, i64 -12
  %wide.load518 = load <4 x float>, ptr %89, align 4, !tbaa !10, !alias.scope !31
  %90 = fdiv <4 x float> %87, %wide.load518
  store <4 x float> %90, ptr %80, align 4, !tbaa !10, !alias.scope !24, !noalias !27
  %index.next521 = add nuw i64 %index512, 4
  %91 = icmp eq i64 %index.next521, %n.vec510
  br i1 %91, label %middle.block522, label %vector.body511, !llvm.loop !32

middle.block522:                                  ; preds = %vector.body511
  br i1 %cmp.n523, label %for.cond80.for.cond.cleanup83_crit_edge, label %for.body84.preheader

for.body84.preheader:                             ; preds = %for.cond80.preheader, %middle.block522
  %indvars.iv408.ph = phi i64 [ %n.vec510, %middle.block522 ], [ 0, %for.cond80.preheader ]
  br i1 %lcmp.mod559.not, label %for.body84.prol.loopexit, label %for.body84.prol

for.body84.prol:                                  ; preds = %for.body84.preheader
  %92 = sub nsw i64 1022, %indvars.iv408.ph
  %arrayidx89.prol = getelementptr inbounds [4 x i8], ptr %arrayidx86, i64 %92
  %93 = load float, ptr %arrayidx89.prol, align 4, !tbaa !10
  %94 = sub nsw i64 1021, %indvars.iv408.ph
  %arrayidx95.prol = getelementptr inbounds [4 x i8], ptr %arrayidx86, i64 %94
  %95 = load float, ptr %arrayidx95.prol, align 4, !tbaa !10
  %arrayidx101.prol = getelementptr inbounds [4 x i8], ptr %arrayidx97, i64 %94
  %96 = load float, ptr %arrayidx101.prol, align 4, !tbaa !10
  %neg.prol = fneg float %95
  %97 = tail call float @llvm.fmuladd.f32(float %neg.prol, float %96, float %93)
  %arrayidx107.prol = getelementptr inbounds [4 x i8], ptr %arrayidx104, i64 %94
  %98 = load float, ptr %arrayidx107.prol, align 4, !tbaa !10
  %div108.prol = fdiv float %97, %98
  store float %div108.prol, ptr %arrayidx89.prol, align 4, !tbaa !10
  %indvars.iv.next409.prol = or disjoint i64 %indvars.iv408.ph, 1
  br label %for.body84.prol.loopexit

for.body84.prol.loopexit:                         ; preds = %for.body84.prol, %for.body84.preheader
  %indvars.iv408.unr = phi i64 [ %indvars.iv408.ph, %for.body84.preheader ], [ %indvars.iv.next409.prol, %for.body84.prol ]
  %99 = icmp eq i64 %indvars.iv408.ph, %12
  br i1 %99, label %for.cond80.for.cond.cleanup83_crit_edge, label %for.body84

for.cond80.for.cond.cleanup83_crit_edge:          ; preds = %for.body84.prol.loopexit, %for.body84, %middle.block522
  %indvars.iv.next416 = add nuw nsw i64 %indvars.iv415, 1
  %exitcond419.not = icmp eq i64 %indvars.iv.next416, %wide.trip.count418
  br i1 %exitcond419.not, label %for.cond122.preheader, label %for.cond80.preheader, !llvm.loop !33

for.body84:                                       ; preds = %for.body84.prol.loopexit, %for.body84
  %indvars.iv408 = phi i64 [ %indvars.iv.next409.1, %for.body84 ], [ %indvars.iv408.unr, %for.body84.prol.loopexit ]
  %100 = sub nsw i64 1022, %indvars.iv408
  %arrayidx89 = getelementptr inbounds [4 x i8], ptr %arrayidx86, i64 %100
  %101 = load float, ptr %arrayidx89, align 4, !tbaa !10
  %102 = sub nsw i64 1021, %indvars.iv408
  %arrayidx95 = getelementptr inbounds [4 x i8], ptr %arrayidx86, i64 %102
  %103 = load float, ptr %arrayidx95, align 4, !tbaa !10
  %arrayidx101 = getelementptr inbounds [4 x i8], ptr %arrayidx97, i64 %102
  %104 = load float, ptr %arrayidx101, align 4, !tbaa !10
  %neg = fneg float %103
  %105 = tail call float @llvm.fmuladd.f32(float %neg, float %104, float %101)
  %arrayidx107 = getelementptr inbounds [4 x i8], ptr %arrayidx104, i64 %102
  %106 = load float, ptr %arrayidx107, align 4, !tbaa !10
  %div108 = fdiv float %105, %106
  store float %div108, ptr %arrayidx89, align 4, !tbaa !10
  %107 = sub nsw i64 1021, %indvars.iv408
  %arrayidx89.1 = getelementptr inbounds [4 x i8], ptr %arrayidx86, i64 %107
  %108 = sub nsw i64 1020, %indvars.iv408
  %arrayidx95.1 = getelementptr inbounds [4 x i8], ptr %arrayidx86, i64 %108
  %109 = load float, ptr %arrayidx95.1, align 4, !tbaa !10
  %arrayidx101.1 = getelementptr inbounds [4 x i8], ptr %arrayidx97, i64 %108
  %110 = load float, ptr %arrayidx101.1, align 4, !tbaa !10
  %neg.1 = fneg float %109
  %111 = tail call float @llvm.fmuladd.f32(float %neg.1, float %110, float %103)
  %arrayidx107.1 = getelementptr inbounds [4 x i8], ptr %arrayidx104, i64 %108
  %112 = load float, ptr %arrayidx107.1, align 4, !tbaa !10
  %div108.1 = fdiv float %111, %112
  store float %div108.1, ptr %arrayidx89.1, align 4, !tbaa !10
  %indvars.iv.next409.1 = add nuw nsw i64 %indvars.iv408, 2
  %exitcond414.not.1 = icmp eq i64 %indvars.iv.next409.1, %wide.trip.count413
  br i1 %exitcond414.not.1, label %for.cond80.for.cond.cleanup83_crit_edge, label %for.body84, !llvm.loop !34

for.cond187.preheader:                            ; preds = %for.cond127.for.cond.cleanup129_crit_edge, %for.cond122.preheader
  %brmerge566 = select i1 %min.iters.check, i1 true, i1 %found.conflict
  br i1 %brmerge566, label %for.body190.preheader, label %vector.body

vector.body:                                      ; preds = %for.cond187.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.cond187.preheader ]
  %113 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx191, i64 %index
  %wide.load = load <4 x float>, ptr %113, align 4, !tbaa !10, !alias.scope !35, !noalias !38
  %114 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx194, i64 %index
  %wide.load458 = load <4 x float>, ptr %114, align 4, !tbaa !10, !alias.scope !38
  %115 = fdiv <4 x float> %wide.load, %wide.load458
  store <4 x float> %115, ptr %113, align 4, !tbaa !10, !alias.scope !35, !noalias !38
  %index.next = add nuw i64 %index, 4
  %116 = icmp eq i64 %index.next, %n.vec
  br i1 %116, label %middle.block, label %vector.body, !llvm.loop !40

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond205.preheader, label %for.body190.preheader

for.body190.preheader:                            ; preds = %for.cond187.preheader, %middle.block
  %indvars.iv431.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %for.cond187.preheader ]
  br i1 %lcmp.mod561.not, label %for.body190.prol.loopexit, label %for.body190.prol

for.body190.prol:                                 ; preds = %for.body190.preheader, %for.body190.prol
  %indvars.iv431.prol = phi i64 [ %indvars.iv.next432.prol, %for.body190.prol ], [ %indvars.iv431.ph, %for.body190.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body190.prol ], [ 0, %for.body190.preheader ]
  %arrayidx193.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx191, i64 %indvars.iv431.prol
  %117 = load float, ptr %arrayidx193.prol, align 4, !tbaa !10
  %arrayidx196.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx194, i64 %indvars.iv431.prol
  %118 = load float, ptr %arrayidx196.prol, align 4, !tbaa !10
  %div197.prol = fdiv float %117, %118
  store float %div197.prol, ptr %arrayidx193.prol, align 4, !tbaa !10
  %indvars.iv.next432.prol = add nuw nsw i64 %indvars.iv431.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter560
  br i1 %prol.iter.cmp.not, label %for.body190.prol.loopexit, label %for.body190.prol, !llvm.loop !41

for.body190.prol.loopexit:                        ; preds = %for.body190.prol, %for.body190.preheader
  %indvars.iv431.unr = phi i64 [ %indvars.iv431.ph, %for.body190.preheader ], [ %indvars.iv.next432.prol, %for.body190.prol ]
  %119 = sub nsw i64 %indvars.iv431.ph, %wide.trip.count429
  %120 = icmp ugt i64 %119, -4
  br i1 %120, label %for.cond205.preheader, label %for.body190

for.cond127.preheader:                            ; preds = %for.cond122.preheader, %for.cond127.for.cond.cleanup129_crit_edge
  %indvars.iv425 = phi i64 [ %indvars.iv.next426, %for.cond127.for.cond.cleanup129_crit_edge ], [ 1, %for.cond122.preheader ]
  %arrayidx132 = getelementptr inbounds nuw [4096 x i8], ptr %X, i64 %indvars.iv425
  %121 = add nsw i64 %indvars.iv425, -1
  %arrayidx137 = getelementptr inbounds [4096 x i8], ptr %X, i64 %121
  %arrayidx141 = getelementptr inbounds nuw [4096 x i8], ptr %A, i64 %indvars.iv425
  %arrayidx147 = getelementptr inbounds [4096 x i8], ptr %B, i64 %121
  %arrayidx157 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %indvars.iv425
  %brmerge567 = select i1 %min.iters.check475, i1 true, i1 %conflict.rdx473
  br i1 %brmerge567, label %for.body130.preheader, label %vector.body479

vector.body479:                                   ; preds = %for.cond127.preheader, %vector.body479
  %index480 = phi i64 [ %index.next488, %vector.body479 ], [ 0, %for.cond127.preheader ]
  %122 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx132, i64 %index480
  %wide.load481 = load <4 x float>, ptr %122, align 4, !tbaa !10, !alias.scope !43, !noalias !46
  %123 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx137, i64 %index480
  %wide.load482 = load <4 x float>, ptr %123, align 4, !tbaa !10, !alias.scope !43, !noalias !46
  %124 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx141, i64 %index480
  %wide.load483 = load <4 x float>, ptr %124, align 4, !tbaa !10, !alias.scope !49
  %125 = fmul <4 x float> %wide.load482, %wide.load483
  %126 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx147, i64 %index480
  %wide.load484 = load <4 x float>, ptr %126, align 4, !tbaa !10, !alias.scope !50, !noalias !49
  %127 = fdiv <4 x float> %125, %wide.load484
  %128 = fsub <4 x float> %wide.load481, %127
  store <4 x float> %128, ptr %122, align 4, !tbaa !10, !alias.scope !43, !noalias !46
  %129 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx157, i64 %index480
  %wide.load485 = load <4 x float>, ptr %129, align 4, !tbaa !10, !alias.scope !50, !noalias !49
  %wide.load486 = load <4 x float>, ptr %124, align 4, !tbaa !10, !alias.scope !49
  %130 = fmul <4 x float> %wide.load486, %wide.load486
  %wide.load487 = load <4 x float>, ptr %126, align 4, !tbaa !10, !alias.scope !50, !noalias !49
  %131 = fdiv <4 x float> %130, %wide.load487
  %132 = fsub <4 x float> %wide.load485, %131
  store <4 x float> %132, ptr %129, align 4, !tbaa !10, !alias.scope !50, !noalias !49
  %index.next488 = add nuw i64 %index480, 4
  %133 = icmp eq i64 %index.next488, %n.vec478
  br i1 %133, label %middle.block489, label %vector.body479, !llvm.loop !51

middle.block489:                                  ; preds = %vector.body479
  br i1 %cmp.n490, label %for.cond127.for.cond.cleanup129_crit_edge, label %for.body130.preheader

for.body130.preheader:                            ; preds = %for.cond127.preheader, %middle.block489
  %indvars.iv420.ph = phi i64 [ %n.vec478, %middle.block489 ], [ 0, %for.cond127.preheader ]
  br label %for.body130

for.cond127.for.cond.cleanup129_crit_edge:        ; preds = %for.body130, %middle.block489
  %indvars.iv.next426 = add nuw nsw i64 %indvars.iv425, 1
  %exitcond430.not = icmp eq i64 %indvars.iv.next426, %wide.trip.count429
  br i1 %exitcond430.not, label %for.cond187.preheader, label %for.cond127.preheader, !llvm.loop !52

for.body130:                                      ; preds = %for.body130.preheader, %for.body130
  %indvars.iv420 = phi i64 [ %indvars.iv.next421, %for.body130 ], [ %indvars.iv420.ph, %for.body130.preheader ]
  %arrayidx134 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx132, i64 %indvars.iv420
  %134 = load float, ptr %arrayidx134, align 4, !tbaa !10
  %arrayidx139 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx137, i64 %indvars.iv420
  %135 = load float, ptr %arrayidx139, align 4, !tbaa !10
  %arrayidx143 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx141, i64 %indvars.iv420
  %136 = load float, ptr %arrayidx143, align 4, !tbaa !10
  %mul144 = fmul float %135, %136
  %arrayidx149 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx147, i64 %indvars.iv420
  %137 = load float, ptr %arrayidx149, align 4, !tbaa !10
  %div150 = fdiv float %mul144, %137
  %sub151 = fsub float %134, %div150
  store float %sub151, ptr %arrayidx134, align 4, !tbaa !10
  %arrayidx159 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx157, i64 %indvars.iv420
  %138 = load float, ptr %arrayidx159, align 4, !tbaa !10
  %139 = load float, ptr %arrayidx143, align 4, !tbaa !10
  %mul168 = fmul float %139, %139
  %140 = load float, ptr %arrayidx149, align 4, !tbaa !10
  %div174 = fdiv float %mul168, %140
  %sub175 = fsub float %138, %div174
  store float %sub175, ptr %arrayidx159, align 4, !tbaa !10
  %indvars.iv.next421 = add nuw nsw i64 %indvars.iv420, 1
  %exitcond424.not = icmp eq i64 %indvars.iv.next421, %wide.trip.count429
  br i1 %exitcond424.not, label %for.cond127.for.cond.cleanup129_crit_edge, label %for.body130, !llvm.loop !53

for.cond205.preheader:                            ; preds = %for.body190.prol.loopexit, %for.body190, %middle.block
  br i1 %cmp82378, label %for.cond.cleanup208, label %for.cond211.preheader

for.body190:                                      ; preds = %for.body190.prol.loopexit, %for.body190
  %indvars.iv431 = phi i64 [ %indvars.iv.next432.3, %for.body190 ], [ %indvars.iv431.unr, %for.body190.prol.loopexit ]
  %arrayidx193 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx191, i64 %indvars.iv431
  %141 = load float, ptr %arrayidx193, align 4, !tbaa !10
  %arrayidx196 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx194, i64 %indvars.iv431
  %142 = load float, ptr %arrayidx196, align 4, !tbaa !10
  %div197 = fdiv float %141, %142
  store float %div197, ptr %arrayidx193, align 4, !tbaa !10
  %indvars.iv.next432 = add nuw nsw i64 %indvars.iv431, 1
  %arrayidx193.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx191, i64 %indvars.iv.next432
  %143 = load float, ptr %arrayidx193.1, align 4, !tbaa !10
  %arrayidx196.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx194, i64 %indvars.iv.next432
  %144 = load float, ptr %arrayidx196.1, align 4, !tbaa !10
  %div197.1 = fdiv float %143, %144
  store float %div197.1, ptr %arrayidx193.1, align 4, !tbaa !10
  %indvars.iv.next432.1 = add nuw nsw i64 %indvars.iv431, 2
  %arrayidx193.2 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx191, i64 %indvars.iv.next432.1
  %145 = load float, ptr %arrayidx193.2, align 4, !tbaa !10
  %arrayidx196.2 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx194, i64 %indvars.iv.next432.1
  %146 = load float, ptr %arrayidx196.2, align 4, !tbaa !10
  %div197.2 = fdiv float %145, %146
  store float %div197.2, ptr %arrayidx193.2, align 4, !tbaa !10
  %indvars.iv.next432.2 = add nuw nsw i64 %indvars.iv431, 3
  %arrayidx193.3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx191, i64 %indvars.iv.next432.2
  %147 = load float, ptr %arrayidx193.3, align 4, !tbaa !10
  %arrayidx196.3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx194, i64 %indvars.iv.next432.2
  %148 = load float, ptr %arrayidx196.3, align 4, !tbaa !10
  %div197.3 = fdiv float %147, %148
  store float %div197.3, ptr %arrayidx193.3, align 4, !tbaa !10
  %indvars.iv.next432.3 = add nuw nsw i64 %indvars.iv431, 4
  %exitcond435.not.3 = icmp eq i64 %indvars.iv.next432.3, %wide.trip.count434
  br i1 %exitcond435.not.3, label %for.cond205.preheader, label %for.body190, !llvm.loop !54

for.cond211.preheader:                            ; preds = %for.cond205.preheader, %for.cond211.for.cond.cleanup213_crit_edge
  %indvars.iv441 = phi i64 [ %indvars.iv.next442, %for.cond211.for.cond.cleanup213_crit_edge ], [ 0, %for.cond205.preheader ]
  %149 = sub nsw i64 1022, %indvars.iv441
  %arrayidx217 = getelementptr inbounds [4096 x i8], ptr %X, i64 %149
  %150 = sub nsw i64 1021, %indvars.iv441
  %arrayidx223 = getelementptr inbounds [4096 x i8], ptr %X, i64 %150
  %arrayidx228 = getelementptr inbounds [4096 x i8], ptr %A, i64 %150
  %arrayidx235 = getelementptr inbounds [4096 x i8], ptr %B, i64 %149
  br i1 %13, label %for.body214.epil.preheader, label %for.body214

for.cond.cleanup208:                              ; preds = %for.cond211.for.cond.cleanup213_crit_edge, %for.cond57.preheader, %for.cond205.preheader
  %inc251 = add nuw nsw i32 %t.0393, 1
  %exitcond448.not = icmp eq i32 %inc251, %tsteps
  br i1 %exitcond448.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !55

for.cond211.for.cond.cleanup213_crit_edge.unr-lcssa: ; preds = %for.body214
  br i1 %lcmp.mod563.not, label %for.cond211.for.cond.cleanup213_crit_edge, label %for.body214.epil.preheader

for.body214.epil.preheader:                       ; preds = %for.cond211.for.cond.cleanup213_crit_edge.unr-lcssa, %for.cond211.preheader
  %indvars.iv436.epil.init = phi i64 [ 0, %for.cond211.preheader ], [ %indvars.iv.next437.1, %for.cond211.for.cond.cleanup213_crit_edge.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod564)
  %arrayidx219.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx217, i64 %indvars.iv436.epil.init
  %151 = load float, ptr %arrayidx219.epil, align 4, !tbaa !10
  %arrayidx225.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx223, i64 %indvars.iv436.epil.init
  %152 = load float, ptr %arrayidx225.epil, align 4, !tbaa !10
  %arrayidx230.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx228, i64 %indvars.iv436.epil.init
  %153 = load float, ptr %arrayidx230.epil, align 4, !tbaa !10
  %neg232.epil = fneg float %152
  %154 = tail call float @llvm.fmuladd.f32(float %neg232.epil, float %153, float %151)
  %arrayidx237.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx235, i64 %indvars.iv436.epil.init
  %155 = load float, ptr %arrayidx237.epil, align 4, !tbaa !10
  %div238.epil = fdiv float %154, %155
  store float %div238.epil, ptr %arrayidx219.epil, align 4, !tbaa !10
  br label %for.cond211.for.cond.cleanup213_crit_edge

for.cond211.for.cond.cleanup213_crit_edge:        ; preds = %for.cond211.for.cond.cleanup213_crit_edge.unr-lcssa, %for.body214.epil.preheader
  %indvars.iv.next442 = add nuw nsw i64 %indvars.iv441, 1
  %exitcond447.not = icmp eq i64 %indvars.iv.next442, %wide.trip.count446
  br i1 %exitcond447.not, label %for.cond.cleanup208, label %for.cond211.preheader, !llvm.loop !56

for.body214:                                      ; preds = %for.cond211.preheader, %for.body214
  %indvars.iv436 = phi i64 [ %indvars.iv.next437.1, %for.body214 ], [ 0, %for.cond211.preheader ]
  %niter = phi i64 [ %niter.next.1, %for.body214 ], [ 0, %for.cond211.preheader ]
  %arrayidx219 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx217, i64 %indvars.iv436
  %156 = load float, ptr %arrayidx219, align 4, !tbaa !10
  %arrayidx225 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx223, i64 %indvars.iv436
  %157 = load float, ptr %arrayidx225, align 4, !tbaa !10
  %arrayidx230 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx228, i64 %indvars.iv436
  %158 = load float, ptr %arrayidx230, align 4, !tbaa !10
  %neg232 = fneg float %157
  %159 = tail call float @llvm.fmuladd.f32(float %neg232, float %158, float %156)
  %arrayidx237 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx235, i64 %indvars.iv436
  %160 = load float, ptr %arrayidx237, align 4, !tbaa !10
  %div238 = fdiv float %159, %160
  store float %div238, ptr %arrayidx219, align 4, !tbaa !10
  %indvars.iv.next437 = or disjoint i64 %indvars.iv436, 1
  %arrayidx219.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx217, i64 %indvars.iv.next437
  %161 = load float, ptr %arrayidx219.1, align 4, !tbaa !10
  %arrayidx225.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx223, i64 %indvars.iv.next437
  %162 = load float, ptr %arrayidx225.1, align 4, !tbaa !10
  %arrayidx230.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx228, i64 %indvars.iv.next437
  %163 = load float, ptr %arrayidx230.1, align 4, !tbaa !10
  %neg232.1 = fneg float %162
  %164 = tail call float @llvm.fmuladd.f32(float %neg232.1, float %163, float %161)
  %arrayidx237.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx235, i64 %indvars.iv.next437
  %165 = load float, ptr %arrayidx237.1, align 4, !tbaa !10
  %div238.1 = fdiv float %164, %165
  store float %div238.1, ptr %arrayidx219.1, align 4, !tbaa !10
  %indvars.iv.next437.1 = add nuw nsw i64 %indvars.iv436, 2
  %niter.next.1 = add nuw nsw i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %for.cond211.for.cond.cleanup213_crit_edge.unr-lcssa, label %for.body214, !llvm.loop !57
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable
define dso_local void @_Z10init_arrayiPA1024_fS0_S0_(i32 noundef %n, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B, ptr nofree noundef writeonly captures(none) %X) local_unnamed_addr #4 {
entry:
  %cmp44 = icmp sgt i32 %n, 0
  br i1 %cmp44, label %for.cond1.preheader.preheader, label %for.end26

for.cond1.preheader.preheader:                    ; preds = %entry
  %A56 = ptrtoaddr ptr %A to i64
  %X57 = ptrtoaddr ptr %X to i64
  %B58 = ptrtoaddr ptr %B to i64
  %wide.trip.count54 = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 4
  %0 = sub i64 %X57, %A56
  %diff.check = icmp ugt i64 %0, -16
  %1 = sub i64 %X57, %B58
  %diff.check59 = icmp ugt i64 %1, -16
  %conflict.rdx = or i1 %diff.check, %diff.check59
  %2 = sub i64 %A56, %B58
  %diff.check60 = icmp ugt i64 %2, -16
  %conflict.rdx61 = or i1 %conflict.rdx, %diff.check60
  %n.vec = and i64 %wide.trip.count54, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count54
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc24_crit_edge
  %indvars.iv49 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next50, %for.cond1.for.inc24_crit_edge ]
  %3 = trunc nuw nsw i64 %indvars.iv49 to i32
  %conv = uitofp nneg i32 %3 to float
  %arrayidx = getelementptr inbounds nuw [4096 x i8], ptr %X, i64 %indvars.iv49
  %4 = trunc i64 %indvars.iv49 to i32
  %arrayidx12 = getelementptr inbounds nuw [4096 x i8], ptr %A, i64 %indvars.iv49
  %5 = trunc i64 %indvars.iv49 to i32
  %6 = add i32 %5, 3
  %7 = add i32 %4, -1
  %conv7 = sitofp i32 %7 to float
  %conv16 = uitofp nneg i32 %6 to float
  %arrayidx21 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %indvars.iv49
  %brmerge = or i1 %min.iters.check, %conflict.rdx61
  br i1 %brmerge, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert62 = insertelement <4 x float> poison, float %conv7, i64 0
  %broadcast.splat63 = shufflevector <4 x float> %broadcast.splatinsert62, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert64 = insertelement <4 x float> poison, float %conv16, i64 0
  %broadcast.splat65 = shufflevector <4 x float> %broadcast.splatinsert64, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.ind66 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next68, %vector.body ]
  %vec.ind67 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next69, %vector.body ]
  %8 = trunc <4 x i64> %vec.ind to <4 x i32>
  %9 = add <4 x i32> %8, splat (i32 1)
  %10 = uitofp nneg <4 x i32> %9 to <4 x float>
  %11 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %10, <4 x float> splat (float 1.000000e+00))
  %12 = fmul nnan <4 x float> %11, splat (float f0x3A800000)
  %13 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  store <4 x float> %12, ptr %13, align 4, !tbaa !10
  %14 = add <4 x i32> %vec.ind66, splat (i32 4)
  %15 = uitofp nneg <4 x i32> %14 to <4 x float>
  %16 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat63, <4 x float> %15, <4 x float> splat (float 2.000000e+00))
  %17 = fmul nnan <4 x float> %16, splat (float f0x3A800000)
  %18 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12, i64 %index
  store <4 x float> %17, ptr %18, align 4, !tbaa !10
  %19 = add <4 x i32> %vec.ind67, splat (i32 7)
  %20 = uitofp nneg <4 x i32> %19 to <4 x float>
  %21 = tail call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat65, <4 x float> %20, <4 x float> splat (float 3.000000e+00))
  %22 = fmul nnan <4 x float> %21, splat (float f0x3A800000)
  %23 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx21, i64 %index
  store <4 x float> %22, ptr %23, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add nuw nsw <4 x i64> %vec.ind, splat (i64 4)
  %vec.ind.next68 = add <4 x i32> %vec.ind66, splat (i32 4)
  %vec.ind.next69 = add <4 x i32> %vec.ind67, splat (i32 4)
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !58

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc24_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %for.cond1.preheader ]
  %25 = insertelement <2 x float> poison, float %conv7, i64 0
  %26 = insertelement <2 x float> %25, float %conv16, i64 1
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = trunc nuw nsw i64 %indvars.iv.next to i32
  %conv4 = uitofp nneg i32 %27 to float
  %28 = tail call nnan float @llvm.fmuladd.f32(float %conv, float %conv4, float 1.000000e+00)
  %div = fmul nnan float %28, f0x3A800000
  %arrayidx6 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  store float %div, ptr %arrayidx6, align 4, !tbaa !10
  %29 = trunc i64 %indvars.iv to i32
  %arrayidx14 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12, i64 %indvars.iv
  %30 = trunc i64 %indvars.iv to i32
  %31 = add i32 %30, 7
  %32 = add i32 %29, 4
  %conv18 = uitofp nneg i32 %31 to float
  %conv9 = uitofp nneg i32 %32 to float
  %33 = insertelement <2 x float> poison, float %conv9, i64 0
  %34 = insertelement <2 x float> %33, float %conv18, i64 1
  %35 = tail call nnan <2 x float> @llvm.fmuladd.v2f32(<2 x float> %26, <2 x float> %34, <2 x float> <float 2.000000e+00, float 3.000000e+00>)
  %36 = fmul nnan <2 x float> %35, splat (float f0x3A800000)
  %37 = extractelement <2 x float> %36, i64 0
  store float %37, ptr %arrayidx14, align 4, !tbaa !10
  %arrayidx23 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx21, i64 %indvars.iv
  %38 = extractelement <2 x float> %36, i64 1
  store float %38, ptr %arrayidx23, align 4, !tbaa !10
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count54
  br i1 %exitcond.not, label %for.cond1.for.inc24_crit_edge, label %for.body3, !llvm.loop !59

for.cond1.for.inc24_crit_edge:                    ; preds = %for.body3, %middle.block
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond55.not = icmp eq i64 %indvars.iv.next50, %wide.trip.count54
  br i1 %exitcond55.not, label %for.end26, label %for.cond1.preheader, !llvm.loop !60

for.end26:                                        ; preds = %for.cond1.for.inc24_crit_edge, %entry
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiPA1024_fS0_S0_S0_(i32 noundef %n, ptr nofree noundef readonly captures(none) %B_cpu, ptr nofree noundef readonly captures(none) %B_fromGpu, ptr nofree noundef readonly captures(none) %X_cpu, ptr nofree noundef readonly captures(none) %X_fromGpu) local_unnamed_addr #5 {
entry:
  %cmp97 = icmp sgt i32 %n, 0
  br i1 %cmp97, label %for.cond1.preheader.us.preheader, label %for.end44

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count114 = zext nneg i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 4
  %n.vec = and i64 %wide.trip.count114, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count114
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc14_crit_edge.us
  %indvars.iv111 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next112, %for.cond1.for.inc14_crit_edge.us ]
  %fail.099.us = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [4096 x i8], ptr %B_cpu, i64 %indvars.iv111
  %arrayidx7.us = getelementptr inbounds nuw [4096 x i8], ptr %B_fromGpu, i64 %indvars.iv111
  br i1 %min.iters.check, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.us
  %0 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.099.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %0, %vector.ph ], [ %31, %vector.body ]
  %1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %index
  %wide.load = load <4 x float>, ptr %1, align 4, !tbaa !10
  %2 = fpext <4 x float> %wide.load to <4 x double>
  %3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us, i64 %index
  %wide.load127 = load <4 x float>, ptr %3, align 4, !tbaa !10
  %4 = fpext <4 x float> %wide.load127 to <4 x double>
  %5 = fcmp olt <4 x double> %2, splat (double f0xB690000000000000)
  %6 = fneg <4 x float> %wide.load
  %7 = select <4 x i1> %5, <4 x float> %6, <4 x float> %wide.load
  %8 = fpext <4 x float> %7 to <4 x double>
  %9 = fcmp uge <4 x double> %8, splat (double 1.000000e-02)
  %10 = fcmp olt <4 x double> %4, splat (double f0xB690000000000000)
  %11 = fneg <4 x float> %wide.load127
  %12 = select <4 x i1> %10, <4 x float> %11, <4 x float> %wide.load127
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
  %30 = fcmp ogt <4 x float> %29, splat (float 2.500000e+00)
  %.not145 = select <4 x i1> %9, <4 x i1> splat (i1 true), <4 x i1> %14
  %narrow = select <4 x i1> %.not145, <4 x i1> %30, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %31 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %32 = icmp eq i64 %index.next, %n.vec
  br i1 %32, label %middle.block, label %vector.body, !llvm.loop !61

middle.block:                                     ; preds = %vector.body
  %33 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %31)
  br i1 %cmp.n, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.cond1.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  %fail.196.us.ph = phi i32 [ %fail.099.us, %for.cond1.preheader.us ], [ %33, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %_Z11percentDiffdd.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %fail.196.us = phi i32 [ %fail.2.us, %_Z11percentDiffdd.exit.us ], [ %fail.196.us.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %indvars.iv
  %34 = load float, ptr %arrayidx5.us, align 4, !tbaa !10
  %conv.us = fpext float %34 to double
  %arrayidx9.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us, i64 %indvars.iv
  %35 = load float, ptr %arrayidx9.us, align 4, !tbaa !10
  %conv10.us = fpext float %35 to double
  %cmp.i.i.us = fcmp olt double %conv.us, f0xB690000000000000
  %mul.i.i.us = fneg float %34
  %retval.0.i.i.us = select i1 %cmp.i.i.us, float %mul.i.i.us, float %34
  %conv1.i.us = fpext float %retval.0.i.i.us to double
  %cmp.i.us = fcmp olt double %conv1.i.us, 1.000000e-02
  br i1 %cmp.i.us, label %land.lhs.true.i.us, label %if.else.i.us

land.lhs.true.i.us:                               ; preds = %for.body3.us
  %cmp.i14.i.us = fcmp olt double %conv10.us, f0xB690000000000000
  %mul.i15.i.us = fneg float %35
  %retval.0.i16.i.us = select i1 %cmp.i14.i.us, float %mul.i15.i.us, float %35
  %conv4.i.us = fpext float %retval.0.i16.i.us to double
  %cmp5.i.us = fcmp olt double %conv4.i.us, 1.000000e-02
  br i1 %cmp5.i.us, label %_Z11percentDiffdd.exit.us, label %if.else.i.us

if.else.i.us:                                     ; preds = %land.lhs.true.i.us, %for.body3.us
  %36 = insertelement <2 x double> poison, double %conv.us, i64 0
  %37 = shufflevector <2 x double> %36, <2 x double> poison, <2 x i32> zeroinitializer
  %38 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv10.us, i64 0
  %39 = fsub <2 x double> %37, %38
  %40 = fptrunc <2 x double> %39 to <2 x float>
  %41 = fcmp olt <2 x double> %39, splat (double f0xB690000000000000)
  %42 = fneg <2 x float> %40
  %43 = select <2 x i1> %41, <2 x float> %42, <2 x float> %40
  %44 = extractelement <2 x float> %43, i64 0
  %45 = extractelement <2 x float> %43, i64 1
  %div.i.us = fdiv float %44, %45
  %cmp.i23.i.us = fcmp olt float %div.i.us, 0.000000e+00
  %mul.i24.i.us = fneg float %div.i.us
  %retval.0.i25.i.us = select i1 %cmp.i23.i.us, float %mul.i24.i.us, float %div.i.us
  %mul.i.us = fmul float %retval.0.i25.i.us, 1.000000e+02
  %46 = fcmp ogt float %mul.i.us, 2.500000e+00
  %47 = zext i1 %46 to i32
  br label %_Z11percentDiffdd.exit.us

_Z11percentDiffdd.exit.us:                        ; preds = %if.else.i.us, %land.lhs.true.i.us
  %retval.0.i.us = phi i32 [ %47, %if.else.i.us ], [ 0, %land.lhs.true.i.us ]
  %fail.2.us = add nsw i32 %retval.0.i.us, %fail.196.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count114
  br i1 %exitcond.not, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us, !llvm.loop !62

for.cond1.for.inc14_crit_edge.us:                 ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %fail.2.us.lcssa = phi i32 [ %33, %middle.block ], [ %fail.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond115.not = icmp eq i64 %indvars.iv.next112, %wide.trip.count114
  br i1 %exitcond115.not, label %for.cond20.preheader.us.preheader, label %for.cond1.preheader.us, !llvm.loop !63

for.cond20.preheader.us.preheader:                ; preds = %for.cond1.for.inc14_crit_edge.us
  %wide.trip.count124 = zext nneg i32 %n to i64
  %min.iters.check129 = icmp ult i32 %n, 4
  %n.vec132 = and i64 %wide.trip.count114, 2147483644
  %cmp.n141 = icmp eq i64 %n.vec132, %wide.trip.count114
  br label %for.cond20.preheader.us

for.cond20.preheader.us:                          ; preds = %for.cond20.preheader.us.preheader, %for.cond20.for.inc42_crit_edge.us
  %indvars.iv121 = phi i64 [ 0, %for.cond20.preheader.us.preheader ], [ %indvars.iv.next122, %for.cond20.for.inc42_crit_edge.us ]
  %fail.3106.us = phi i32 [ %fail.2.us.lcssa, %for.cond20.preheader.us.preheader ], [ %fail.5.us.lcssa, %for.cond20.for.inc42_crit_edge.us ]
  %arrayidx24.us = getelementptr inbounds nuw [4096 x i8], ptr %X_cpu, i64 %indvars.iv121
  %arrayidx29.us = getelementptr inbounds nuw [4096 x i8], ptr %X_fromGpu, i64 %indvars.iv121
  br i1 %min.iters.check129, label %for.body22.us.preheader, label %vector.ph130

vector.ph130:                                     ; preds = %for.cond20.preheader.us
  %48 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.3106.us, i64 0
  br label %vector.body133

vector.body133:                                   ; preds = %vector.body133, %vector.ph130
  %index134 = phi i64 [ 0, %vector.ph130 ], [ %index.next139, %vector.body133 ]
  %vec.phi135 = phi <4 x i32> [ %48, %vector.ph130 ], [ %79, %vector.body133 ]
  %49 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx24.us, i64 %index134
  %wide.load136 = load <4 x float>, ptr %49, align 4, !tbaa !10
  %50 = fpext <4 x float> %wide.load136 to <4 x double>
  %51 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx29.us, i64 %index134
  %wide.load137 = load <4 x float>, ptr %51, align 4, !tbaa !10
  %52 = fpext <4 x float> %wide.load137 to <4 x double>
  %53 = fcmp olt <4 x double> %50, splat (double f0xB690000000000000)
  %54 = fneg <4 x float> %wide.load136
  %55 = select <4 x i1> %53, <4 x float> %54, <4 x float> %wide.load136
  %56 = fpext <4 x float> %55 to <4 x double>
  %57 = fcmp uge <4 x double> %56, splat (double 1.000000e-02)
  %58 = fcmp olt <4 x double> %52, splat (double f0xB690000000000000)
  %59 = fneg <4 x float> %wide.load137
  %60 = select <4 x i1> %58, <4 x float> %59, <4 x float> %wide.load137
  %61 = fpext <4 x float> %60 to <4 x double>
  %62 = fcmp uge <4 x double> %61, splat (double 1.000000e-02)
  %63 = fsub <4 x double> %50, %52
  %64 = fptrunc <4 x double> %63 to <4 x float>
  %65 = fcmp olt <4 x double> %63, splat (double f0xB690000000000000)
  %66 = fneg <4 x float> %64
  %67 = select <4 x i1> %65, <4 x float> %66, <4 x float> %64
  %68 = fadd <4 x double> %50, splat (double f0x3E45798EE0000000)
  %69 = fptrunc <4 x double> %68 to <4 x float>
  %70 = fcmp olt <4 x double> %68, splat (double f0xB690000000000000)
  %71 = fneg <4 x float> %69
  %72 = select <4 x i1> %70, <4 x float> %71, <4 x float> %69
  %73 = fdiv <4 x float> %67, %72
  %74 = fcmp olt <4 x float> %73, zeroinitializer
  %75 = fneg <4 x float> %73
  %76 = select <4 x i1> %74, <4 x float> %75, <4 x float> %73
  %77 = fmul <4 x float> %76, splat (float 1.000000e+02)
  %78 = fcmp ogt <4 x float> %77, splat (float 2.500000e+00)
  %.not148 = select <4 x i1> %57, <4 x i1> splat (i1 true), <4 x i1> %62
  %narrow146 = select <4 x i1> %.not148, <4 x i1> %78, <4 x i1> zeroinitializer
  %predphi138 = zext <4 x i1> %narrow146 to <4 x i32>
  %79 = add <4 x i32> %vec.phi135, %predphi138
  %index.next139 = add nuw i64 %index134, 4
  %80 = icmp eq i64 %index.next139, %n.vec132
  br i1 %80, label %middle.block140, label %vector.body133, !llvm.loop !64

middle.block140:                                  ; preds = %vector.body133
  %81 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %79)
  br i1 %cmp.n141, label %for.cond20.for.inc42_crit_edge.us, label %for.body22.us.preheader

for.body22.us.preheader:                          ; preds = %for.cond20.preheader.us, %middle.block140
  %indvars.iv116.ph = phi i64 [ 0, %for.cond20.preheader.us ], [ %n.vec132, %middle.block140 ]
  %fail.4103.us.ph = phi i32 [ %fail.3106.us, %for.cond20.preheader.us ], [ %81, %middle.block140 ]
  br label %for.body22.us

for.body22.us:                                    ; preds = %for.body22.us.preheader, %_Z11percentDiffdd.exit93.us
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %_Z11percentDiffdd.exit93.us ], [ %indvars.iv116.ph, %for.body22.us.preheader ]
  %fail.4103.us = phi i32 [ %fail.5.us, %_Z11percentDiffdd.exit93.us ], [ %fail.4103.us.ph, %for.body22.us.preheader ]
  %arrayidx26.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx24.us, i64 %indvars.iv116
  %82 = load float, ptr %arrayidx26.us, align 4, !tbaa !10
  %conv27.us = fpext float %82 to double
  %arrayidx31.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx29.us, i64 %indvars.iv116
  %83 = load float, ptr %arrayidx31.us, align 4, !tbaa !10
  %conv32.us = fpext float %83 to double
  %cmp.i.i65.us = fcmp olt double %conv27.us, f0xB690000000000000
  %mul.i.i66.us = fneg float %82
  %retval.0.i.i67.us = select i1 %cmp.i.i65.us, float %mul.i.i66.us, float %82
  %conv1.i68.us = fpext float %retval.0.i.i67.us to double
  %cmp.i69.us = fcmp olt double %conv1.i68.us, 1.000000e-02
  br i1 %cmp.i69.us, label %land.lhs.true.i87.us, label %if.else.i70.us

land.lhs.true.i87.us:                             ; preds = %for.body22.us
  %cmp.i14.i88.us = fcmp olt double %conv32.us, f0xB690000000000000
  %mul.i15.i89.us = fneg float %83
  %retval.0.i16.i90.us = select i1 %cmp.i14.i88.us, float %mul.i15.i89.us, float %83
  %conv4.i91.us = fpext float %retval.0.i16.i90.us to double
  %cmp5.i92.us = fcmp olt double %conv4.i91.us, 1.000000e-02
  br i1 %cmp5.i92.us, label %_Z11percentDiffdd.exit93.us, label %if.else.i70.us

if.else.i70.us:                                   ; preds = %land.lhs.true.i87.us, %for.body22.us
  %84 = insertelement <2 x double> poison, double %conv27.us, i64 0
  %85 = shufflevector <2 x double> %84, <2 x double> poison, <2 x i32> zeroinitializer
  %86 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv32.us, i64 0
  %87 = fsub <2 x double> %85, %86
  %88 = fptrunc <2 x double> %87 to <2 x float>
  %89 = fcmp olt <2 x double> %87, splat (double f0xB690000000000000)
  %90 = fneg <2 x float> %88
  %91 = select <2 x i1> %89, <2 x float> %90, <2 x float> %88
  %92 = extractelement <2 x float> %91, i64 0
  %93 = extractelement <2 x float> %91, i64 1
  %div.i81.us = fdiv float %92, %93
  %cmp.i23.i82.us = fcmp olt float %div.i81.us, 0.000000e+00
  %mul.i24.i83.us = fneg float %div.i81.us
  %retval.0.i25.i84.us = select i1 %cmp.i23.i82.us, float %mul.i24.i83.us, float %div.i81.us
  %mul.i85.us = fmul float %retval.0.i25.i84.us, 1.000000e+02
  %94 = fcmp ogt float %mul.i85.us, 2.500000e+00
  %95 = zext i1 %94 to i32
  br label %_Z11percentDiffdd.exit93.us

_Z11percentDiffdd.exit93.us:                      ; preds = %if.else.i70.us, %land.lhs.true.i87.us
  %retval.0.i86.us = phi i32 [ %95, %if.else.i70.us ], [ 0, %land.lhs.true.i87.us ]
  %fail.5.us = add nsw i32 %retval.0.i86.us, %fail.4103.us
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond120.not = icmp eq i64 %indvars.iv.next117, %wide.trip.count124
  br i1 %exitcond120.not, label %for.cond20.for.inc42_crit_edge.us, label %for.body22.us, !llvm.loop !65

for.cond20.for.inc42_crit_edge.us:                ; preds = %_Z11percentDiffdd.exit93.us, %middle.block140
  %fail.5.us.lcssa = phi i32 [ %81, %middle.block140 ], [ %fail.5.us, %_Z11percentDiffdd.exit93.us ]
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond125.not = icmp eq i64 %indvars.iv.next122, %wide.trip.count124
  br i1 %exitcond125.not, label %for.end44, label %for.cond20.preheader.us, !llvm.loop !66

for.end44:                                        ; preds = %for.cond20.for.inc42_crit_edge.us, %entry
  %fail.3.lcssa = phi i32 [ 0, %entry ], [ %fail.5.us.lcssa, %for.cond20.for.inc42_crit_edge.us ]
  %call45 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 2.500000e+00, i32 noundef %fail.3.lcssa) #15
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
define dso_local void @_Z26__device_stub__adi_kernel1iPfS_S_(i32 noundef %n, ptr noundef %A, ptr noundef %B, ptr noundef %X) #9 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %X.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !67
  store ptr %A, ptr %A.addr, align 8, !tbaa !68
  store ptr %B, ptr %B.addr, align 8, !tbaa !68
  store ptr %X, ptr %X.addr, align 8, !tbaa !68
  %kernel_args1 = alloca [4 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %A.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %B.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %X.addr, ptr %2, align 8
  %3 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %4 = load i64, ptr %shmem_size, align 8
  %5 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel1iPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__adi_kernel2iPfS_S_(i32 noundef %n, ptr noundef %A, ptr noundef %B, ptr noundef %X) #9 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %X.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !67
  store ptr %A, ptr %A.addr, align 8, !tbaa !68
  store ptr %B, ptr %B.addr, align 8, !tbaa !68
  store ptr %X, ptr %X.addr, align 8, !tbaa !68
  %kernel_args1 = alloca [4 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %A.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %B.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %X.addr, ptr %2, align 8
  %3 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %4 = load i64, ptr %shmem_size, align 8
  %5 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel2iPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__adi_kernel3iPfS_S_(i32 noundef %n, ptr noundef %A, ptr noundef %B, ptr noundef %X) #9 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %X.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !67
  store ptr %A, ptr %A.addr, align 8, !tbaa !68
  store ptr %B, ptr %B.addr, align 8, !tbaa !68
  store ptr %X, ptr %X.addr, align 8, !tbaa !68
  %kernel_args1 = alloca [4 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %A.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %B.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %X.addr, ptr %2, align 8
  %3 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %4 = load i64, ptr %shmem_size, align 8
  %5 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel3iPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__adi_kernel4iPfS_S_i(i32 noundef %n, ptr noundef %A, ptr noundef %B, ptr noundef %X, i32 noundef %i1) #9 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %X.addr = alloca ptr, align 8
  %i1.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !67
  store ptr %A, ptr %A.addr, align 8, !tbaa !68
  store ptr %B, ptr %B.addr, align 8, !tbaa !68
  store ptr %X, ptr %X.addr, align 8, !tbaa !68
  store i32 %i1, ptr %i1.addr, align 4, !tbaa !67
  %kernel_args1 = alloca [5 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %A.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %B.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %X.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %i1.addr, ptr %3, align 16
  %4 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %5 = load i64, ptr %shmem_size, align 8
  %6 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel4iPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %5, ptr noundef %6)
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__adi_kernel5iPfS_S_(i32 noundef %n, ptr noundef %A, ptr noundef %B, ptr noundef %X) #9 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %X.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !67
  store ptr %A, ptr %A.addr, align 8, !tbaa !68
  store ptr %B, ptr %B.addr, align 8, !tbaa !68
  store ptr %X, ptr %X.addr, align 8, !tbaa !68
  %kernel_args1 = alloca [4 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %A.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %B.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %X.addr, ptr %2, align 8
  %3 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %4 = load i64, ptr %shmem_size, align 8
  %5 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel5iPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %4, ptr noundef %5)
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__adi_kernel6iPfS_S_i(i32 noundef %n, ptr noundef %A, ptr noundef %B, ptr noundef %X, i32 noundef %i1) #9 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %X.addr = alloca ptr, align 8
  %i1.addr = alloca i32, align 4
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %n, ptr %n.addr, align 4, !tbaa !67
  store ptr %A, ptr %A.addr, align 8, !tbaa !68
  store ptr %B, ptr %B.addr, align 8, !tbaa !68
  store ptr %X, ptr %X.addr, align 8, !tbaa !68
  store i32 %i1, ptr %i1.addr, align 4, !tbaa !67
  %kernel_args1 = alloca [5 x ptr], align 16
  store ptr %n.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %A.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %B.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %X.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %i1.addr, ptr %3, align 16
  %4 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %5 = load i64, ptr %shmem_size, align 8
  %6 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel6iPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %5, ptr noundef %6)
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z7adiCudaiiPA1024_fS0_S0_S0_S0_(i32 noundef %tsteps, i32 noundef %n, ptr noundef %A, ptr noundef %B, ptr noundef %X, ptr noundef %B_outputFromGpu, ptr noundef %X_outputFromGpu) local_unnamed_addr #7 {
entry:
  %n.addr.i159 = alloca i32, align 4
  %A.addr.i160 = alloca ptr, align 8
  %B.addr.i161 = alloca ptr, align 8
  %X.addr.i162 = alloca ptr, align 8
  %i1.addr.i163 = alloca i32, align 4
  %grid_dim.i164 = alloca %struct.dim3, align 8
  %block_dim.i165 = alloca %struct.dim3, align 8
  %shmem_size.i166 = alloca i64, align 8
  %stream.i167 = alloca ptr, align 8
  %kernel_args1.i168 = alloca [5 x ptr], align 16
  %n.addr.i143 = alloca i32, align 4
  %A.addr.i144 = alloca ptr, align 8
  %B.addr.i145 = alloca ptr, align 8
  %X.addr.i146 = alloca ptr, align 8
  %grid_dim.i147 = alloca %struct.dim3, align 8
  %block_dim.i148 = alloca %struct.dim3, align 8
  %shmem_size.i149 = alloca i64, align 8
  %stream.i150 = alloca ptr, align 8
  %kernel_args1.i151 = alloca [4 x ptr], align 16
  %n.addr.i127 = alloca i32, align 4
  %A.addr.i128 = alloca ptr, align 8
  %B.addr.i129 = alloca ptr, align 8
  %X.addr.i130 = alloca ptr, align 8
  %i1.addr.i = alloca i32, align 4
  %grid_dim.i131 = alloca %struct.dim3, align 8
  %block_dim.i132 = alloca %struct.dim3, align 8
  %shmem_size.i133 = alloca i64, align 8
  %stream.i134 = alloca ptr, align 8
  %kernel_args1.i135 = alloca [5 x ptr], align 16
  %n.addr.i111 = alloca i32, align 4
  %A.addr.i112 = alloca ptr, align 8
  %B.addr.i113 = alloca ptr, align 8
  %X.addr.i114 = alloca ptr, align 8
  %grid_dim.i115 = alloca %struct.dim3, align 8
  %block_dim.i116 = alloca %struct.dim3, align 8
  %shmem_size.i117 = alloca i64, align 8
  %stream.i118 = alloca ptr, align 8
  %kernel_args1.i119 = alloca [4 x ptr], align 16
  %n.addr.i95 = alloca i32, align 4
  %A.addr.i96 = alloca ptr, align 8
  %B.addr.i97 = alloca ptr, align 8
  %X.addr.i98 = alloca ptr, align 8
  %grid_dim.i99 = alloca %struct.dim3, align 8
  %block_dim.i100 = alloca %struct.dim3, align 8
  %shmem_size.i101 = alloca i64, align 8
  %stream.i102 = alloca ptr, align 8
  %kernel_args1.i103 = alloca [4 x ptr], align 16
  %n.addr.i = alloca i32, align 4
  %A.addr.i = alloca ptr, align 8
  %B.addr.i = alloca ptr, align 8
  %X.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [4 x ptr], align 16
  %Tp.i.i85 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %A_gpu = alloca ptr, align 8
  %B_gpu = alloca ptr, align 8
  %X_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %B_gpu) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %X_gpu) #16
  %call.i = call noundef i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 4194304) #15
  %call.i81 = call noundef i32 @cudaMalloc(ptr noundef nonnull %B_gpu, i64 noundef 4194304) #15
  %call.i82 = call noundef i32 @cudaMalloc(ptr noundef nonnull %X_gpu, i64 noundef 4194304) #15
  %0 = load ptr, ptr %A_gpu, align 8, !tbaa !68
  %call3 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 4194304, i32 noundef 1) #15
  %1 = load ptr, ptr %B_gpu, align 8, !tbaa !68
  %call4 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %B, i64 noundef 4194304, i32 noundef 1) #15
  %2 = load ptr, ptr %X_gpu, align 8, !tbaa !68
  %call5 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %X, i64 noundef 4194304, i32 noundef 1) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #16
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #15
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %3 = load i64, ptr %Tp.i.i, align 8, !tbaa !71
  %conv.i.i = sitofp i64 %3 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %4 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !74
  %conv2.i.i = sitofp i64 %4 to double
  %5 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #16
  store double %5, ptr @polybench_t_start, align 8, !tbaa !75
  %cmp204 = icmp sgt i32 %tsteps, 0
  br i1 %cmp204, label %for.body.lr.ph, label %for.cond.cleanup

for.body.lr.ph:                                   ; preds = %_Z21polybench_timer_startv.exit
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  %7 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  %8 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %9 = getelementptr inbounds nuw i8, ptr %kernel_args1.i103, i64 8
  %10 = getelementptr inbounds nuw i8, ptr %kernel_args1.i103, i64 16
  %11 = getelementptr inbounds nuw i8, ptr %kernel_args1.i103, i64 24
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i105 = getelementptr inbounds nuw i8, ptr %grid_dim.i99, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i108 = getelementptr inbounds nuw i8, ptr %block_dim.i100, i64 8
  %12 = getelementptr inbounds nuw i8, ptr %kernel_args1.i119, i64 8
  %13 = getelementptr inbounds nuw i8, ptr %kernel_args1.i119, i64 16
  %14 = getelementptr inbounds nuw i8, ptr %kernel_args1.i119, i64 24
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i121 = getelementptr inbounds nuw i8, ptr %grid_dim.i115, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i124 = getelementptr inbounds nuw i8, ptr %block_dim.i116, i64 8
  %cmp28200 = icmp sgt i32 %n, 1
  %15 = getelementptr inbounds nuw i8, ptr %kernel_args1.i135, i64 8
  %16 = getelementptr inbounds nuw i8, ptr %kernel_args1.i135, i64 16
  %17 = getelementptr inbounds nuw i8, ptr %kernel_args1.i135, i64 24
  %18 = getelementptr inbounds nuw i8, ptr %kernel_args1.i135, i64 32
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i137 = getelementptr inbounds nuw i8, ptr %grid_dim.i131, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i140 = getelementptr inbounds nuw i8, ptr %block_dim.i132, i64 8
  %19 = getelementptr inbounds nuw i8, ptr %kernel_args1.i151, i64 8
  %20 = getelementptr inbounds nuw i8, ptr %kernel_args1.i151, i64 16
  %21 = getelementptr inbounds nuw i8, ptr %kernel_args1.i151, i64 24
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i153 = getelementptr inbounds nuw i8, ptr %grid_dim.i147, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i156 = getelementptr inbounds nuw i8, ptr %block_dim.i148, i64 8
  %cmp47202 = icmp sgt i32 %n, 2
  %22 = getelementptr inbounds nuw i8, ptr %kernel_args1.i168, i64 8
  %23 = getelementptr inbounds nuw i8, ptr %kernel_args1.i168, i64 16
  %24 = getelementptr inbounds nuw i8, ptr %kernel_args1.i168, i64 24
  %25 = getelementptr inbounds nuw i8, ptr %kernel_args1.i168, i64 32
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i170 = getelementptr inbounds nuw i8, ptr %grid_dim.i164, i64 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i173 = getelementptr inbounds nuw i8, ptr %block_dim.i165, i64 8
  %26 = add nsw i32 %n, -3
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.cond.cleanup48, %_Z21polybench_timer_startv.exit
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i85) #16
  %call.i.i86 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i85, ptr noundef null) #17
  %cmp.not.i.i87 = icmp eq i32 %call.i.i86, 0
  br i1 %cmp.not.i.i87, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i88

if.then.i.i88:                                    ; preds = %for.cond.cleanup
  %call1.i.i89 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i86) #15
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %for.cond.cleanup, %if.then.i.i88
  %27 = load i64, ptr %Tp.i.i85, align 8, !tbaa !71
  %conv.i.i90 = sitofp i64 %27 to double
  %tv_usec.i.i91 = getelementptr inbounds nuw i8, ptr %Tp.i.i85, i64 8
  %28 = load i64, ptr %tv_usec.i.i91, align 8, !tbaa !74
  %conv2.i.i92 = sitofp i64 %28 to double
  %29 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i92, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i90)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i85) #16
  store double %29, ptr @polybench_t_end, align 8, !tbaa !75
  %30 = load double, ptr @polybench_t_start, align 8, !tbaa !75
  %sub.i = fsub double %29, %30
  %call.i93 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #15
  %31 = load ptr, ptr %B_gpu, align 8, !tbaa !68
  %call64 = call i32 @cudaMemcpy(ptr noundef %B_outputFromGpu, ptr noundef %31, i64 noundef 4194304, i32 noundef 2) #15
  %32 = load ptr, ptr %X_gpu, align 8, !tbaa !68
  %call65 = call i32 @cudaMemcpy(ptr noundef %X_outputFromGpu, ptr noundef %32, i64 noundef 4194304, i32 noundef 2) #15
  %33 = load ptr, ptr %A_gpu, align 8, !tbaa !68
  %call66 = call i32 @cudaFree(ptr noundef %33) #15
  %34 = load ptr, ptr %B_gpu, align 8, !tbaa !68
  %call67 = call i32 @cudaFree(ptr noundef %34) #15
  %35 = load ptr, ptr %X_gpu, align 8, !tbaa !68
  %call68 = call i32 @cudaFree(ptr noundef %35) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %X_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %B_gpu) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %A_gpu) #16
  ret void

for.body:                                         ; preds = %for.body.lr.ph, %for.cond.cleanup48
  %t.0205 = phi i32 [ 0, %for.body.lr.ph ], [ %inc61, %for.cond.cleanup48 ]
  %call11 = call i32 @__cudaPushCallConfiguration(i64 4294967300, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool.not = icmp eq i32 %call11, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %for.body
  %36 = load ptr, ptr %A_gpu, align 8, !tbaa !68
  %37 = load ptr, ptr %B_gpu, align 8, !tbaa !68
  %38 = load ptr, ptr %X_gpu, align 8, !tbaa !68
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %X.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %n, ptr %n.addr.i, align 4, !tbaa !67
  store ptr %36, ptr %A.addr.i, align 8, !tbaa !68
  store ptr %37, ptr %B.addr.i, align 8, !tbaa !68
  store ptr %38, ptr %X.addr.i, align 8, !tbaa !68
  store ptr %n.addr.i, ptr %kernel_args1.i, align 16
  store ptr %A.addr.i, ptr %6, align 8
  store ptr %B.addr.i, ptr %7, align 16
  store ptr %X.addr.i, ptr %8, align 8
  %39 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !77
  %40 = load i64, ptr %shmem_size.i, align 8
  %41 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i94 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel1iPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %40, ptr noundef %41), !inline_history !77
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %X.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %for.body
  %call12 = call i32 @cudaThreadSynchronize() #15
  %call15 = call i32 @__cudaPushCallConfiguration(i64 4294967300, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool16.not = icmp eq i32 %call15, 0
  br i1 %tobool16.not, label %kcall.configok17, label %kcall.end18

kcall.configok17:                                 ; preds = %kcall.end
  %42 = load ptr, ptr %A_gpu, align 8, !tbaa !68
  %43 = load ptr, ptr %B_gpu, align 8, !tbaa !68
  %44 = load ptr, ptr %X_gpu, align 8, !tbaa !68
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i95)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i96)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i97)
  call void @llvm.lifetime.start.p0(ptr nonnull %X.addr.i98)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i99)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i100)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i101)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i102)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i103)
  store i32 %n, ptr %n.addr.i95, align 4, !tbaa !67
  store ptr %42, ptr %A.addr.i96, align 8, !tbaa !68
  store ptr %43, ptr %B.addr.i97, align 8, !tbaa !68
  store ptr %44, ptr %X.addr.i98, align 8, !tbaa !68
  store ptr %n.addr.i95, ptr %kernel_args1.i103, align 16
  store ptr %A.addr.i96, ptr %9, align 8
  store ptr %B.addr.i97, ptr %10, align 16
  store ptr %X.addr.i98, ptr %11, align 8
  %45 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i99, ptr nonnull %block_dim.i100, ptr nonnull %shmem_size.i101, ptr nonnull %stream.i102), !inline_history !78
  %46 = load i64, ptr %shmem_size.i101, align 8
  %47 = load ptr, ptr %stream.i102, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i104 = load i64, ptr %grid_dim.i99, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i106 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i105, align 8
  %block_dim.coerce.sroa.0.0.copyload.i107 = load i64, ptr %block_dim.i100, align 8
  %block_dim.coerce.sroa.2.0.copyload.i109 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i108, align 8
  %call.i110 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel2iPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i104, i32 %grid_dim.coerce.sroa.2.0.copyload.i106, i64 %block_dim.coerce.sroa.0.0.copyload.i107, i32 %block_dim.coerce.sroa.2.0.copyload.i109, ptr noundef nonnull %kernel_args1.i103, i64 noundef %46, ptr noundef %47), !inline_history !78
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i95)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i96)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i97)
  call void @llvm.lifetime.end.p0(ptr nonnull %X.addr.i98)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i99)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i100)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i101)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i102)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i103)
  br label %kcall.end18

kcall.end18:                                      ; preds = %kcall.configok17, %kcall.end
  %call19 = call i32 @cudaThreadSynchronize() #15
  %call22 = call i32 @__cudaPushCallConfiguration(i64 4294967300, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool23.not = icmp eq i32 %call22, 0
  br i1 %tobool23.not, label %kcall.configok24, label %kcall.end25

kcall.configok24:                                 ; preds = %kcall.end18
  %48 = load ptr, ptr %A_gpu, align 8, !tbaa !68
  %49 = load ptr, ptr %B_gpu, align 8, !tbaa !68
  %50 = load ptr, ptr %X_gpu, align 8, !tbaa !68
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i111)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i112)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i113)
  call void @llvm.lifetime.start.p0(ptr nonnull %X.addr.i114)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i115)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i116)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i117)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i118)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i119)
  store i32 %n, ptr %n.addr.i111, align 4, !tbaa !67
  store ptr %48, ptr %A.addr.i112, align 8, !tbaa !68
  store ptr %49, ptr %B.addr.i113, align 8, !tbaa !68
  store ptr %50, ptr %X.addr.i114, align 8, !tbaa !68
  store ptr %n.addr.i111, ptr %kernel_args1.i119, align 16
  store ptr %A.addr.i112, ptr %12, align 8
  store ptr %B.addr.i113, ptr %13, align 16
  store ptr %X.addr.i114, ptr %14, align 8
  %51 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i115, ptr nonnull %block_dim.i116, ptr nonnull %shmem_size.i117, ptr nonnull %stream.i118), !inline_history !79
  %52 = load i64, ptr %shmem_size.i117, align 8
  %53 = load ptr, ptr %stream.i118, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i120 = load i64, ptr %grid_dim.i115, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i122 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i121, align 8
  %block_dim.coerce.sroa.0.0.copyload.i123 = load i64, ptr %block_dim.i116, align 8
  %block_dim.coerce.sroa.2.0.copyload.i125 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i124, align 8
  %call.i126 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel3iPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i120, i32 %grid_dim.coerce.sroa.2.0.copyload.i122, i64 %block_dim.coerce.sroa.0.0.copyload.i123, i32 %block_dim.coerce.sroa.2.0.copyload.i125, ptr noundef nonnull %kernel_args1.i119, i64 noundef %52, ptr noundef %53), !inline_history !79
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i111)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i112)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i113)
  call void @llvm.lifetime.end.p0(ptr nonnull %X.addr.i114)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i115)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i116)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i117)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i118)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i119)
  br label %kcall.end25

kcall.end25:                                      ; preds = %kcall.configok24, %kcall.end18
  %call26 = call i32 @cudaThreadSynchronize() #15
  br i1 %cmp28200, label %for.body30, label %for.cond.cleanup29

for.cond.cleanup29:                               ; preds = %kcall.end36, %kcall.end25
  %call40 = call i32 @__cudaPushCallConfiguration(i64 4294967300, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool41.not = icmp eq i32 %call40, 0
  br i1 %tobool41.not, label %kcall.configok42, label %kcall.end43

for.body30:                                       ; preds = %kcall.end25, %kcall.end36
  %i1.0201 = phi i32 [ %inc, %kcall.end36 ], [ 1, %kcall.end25 ]
  %call33 = call i32 @__cudaPushCallConfiguration(i64 4294967300, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool34.not = icmp eq i32 %call33, 0
  br i1 %tobool34.not, label %kcall.configok35, label %kcall.end36

kcall.configok35:                                 ; preds = %for.body30
  %54 = load ptr, ptr %A_gpu, align 8, !tbaa !68
  %55 = load ptr, ptr %B_gpu, align 8, !tbaa !68
  %56 = load ptr, ptr %X_gpu, align 8, !tbaa !68
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i127)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i128)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i129)
  call void @llvm.lifetime.start.p0(ptr nonnull %X.addr.i130)
  call void @llvm.lifetime.start.p0(ptr nonnull %i1.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i131)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i132)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i133)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i134)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i135)
  store i32 %n, ptr %n.addr.i127, align 4, !tbaa !67
  store ptr %54, ptr %A.addr.i128, align 8, !tbaa !68
  store ptr %55, ptr %B.addr.i129, align 8, !tbaa !68
  store ptr %56, ptr %X.addr.i130, align 8, !tbaa !68
  store i32 %i1.0201, ptr %i1.addr.i, align 4, !tbaa !67
  store ptr %n.addr.i127, ptr %kernel_args1.i135, align 16
  store ptr %A.addr.i128, ptr %15, align 8
  store ptr %B.addr.i129, ptr %16, align 16
  store ptr %X.addr.i130, ptr %17, align 8
  store ptr %i1.addr.i, ptr %18, align 16
  %57 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i131, ptr nonnull %block_dim.i132, ptr nonnull %shmem_size.i133, ptr nonnull %stream.i134), !inline_history !80
  %58 = load i64, ptr %shmem_size.i133, align 8
  %59 = load ptr, ptr %stream.i134, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i136 = load i64, ptr %grid_dim.i131, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i138 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i137, align 8
  %block_dim.coerce.sroa.0.0.copyload.i139 = load i64, ptr %block_dim.i132, align 8
  %block_dim.coerce.sroa.2.0.copyload.i141 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i140, align 8
  %call.i142 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel4iPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload.i136, i32 %grid_dim.coerce.sroa.2.0.copyload.i138, i64 %block_dim.coerce.sroa.0.0.copyload.i139, i32 %block_dim.coerce.sroa.2.0.copyload.i141, ptr noundef nonnull %kernel_args1.i135, i64 noundef %58, ptr noundef %59), !inline_history !80
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i127)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i128)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i129)
  call void @llvm.lifetime.end.p0(ptr nonnull %X.addr.i130)
  call void @llvm.lifetime.end.p0(ptr nonnull %i1.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i131)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i132)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i133)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i134)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i135)
  br label %kcall.end36

kcall.end36:                                      ; preds = %kcall.configok35, %for.body30
  %call37 = call i32 @cudaThreadSynchronize() #15
  %inc = add nuw nsw i32 %i1.0201, 1
  %exitcond.not = icmp eq i32 %inc, %n
  br i1 %exitcond.not, label %for.cond.cleanup29, label %for.body30, !llvm.loop !81

kcall.configok42:                                 ; preds = %for.cond.cleanup29
  %60 = load ptr, ptr %A_gpu, align 8, !tbaa !68
  %61 = load ptr, ptr %B_gpu, align 8, !tbaa !68
  %62 = load ptr, ptr %X_gpu, align 8, !tbaa !68
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i143)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i144)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i145)
  call void @llvm.lifetime.start.p0(ptr nonnull %X.addr.i146)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i147)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i148)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i149)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i150)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i151)
  store i32 %n, ptr %n.addr.i143, align 4, !tbaa !67
  store ptr %60, ptr %A.addr.i144, align 8, !tbaa !68
  store ptr %61, ptr %B.addr.i145, align 8, !tbaa !68
  store ptr %62, ptr %X.addr.i146, align 8, !tbaa !68
  store ptr %n.addr.i143, ptr %kernel_args1.i151, align 16
  store ptr %A.addr.i144, ptr %19, align 8
  store ptr %B.addr.i145, ptr %20, align 16
  store ptr %X.addr.i146, ptr %21, align 8
  %63 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i147, ptr nonnull %block_dim.i148, ptr nonnull %shmem_size.i149, ptr nonnull %stream.i150), !inline_history !82
  %64 = load i64, ptr %shmem_size.i149, align 8
  %65 = load ptr, ptr %stream.i150, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i152 = load i64, ptr %grid_dim.i147, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i154 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i153, align 8
  %block_dim.coerce.sroa.0.0.copyload.i155 = load i64, ptr %block_dim.i148, align 8
  %block_dim.coerce.sroa.2.0.copyload.i157 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i156, align 8
  %call.i158 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel5iPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i152, i32 %grid_dim.coerce.sroa.2.0.copyload.i154, i64 %block_dim.coerce.sroa.0.0.copyload.i155, i32 %block_dim.coerce.sroa.2.0.copyload.i157, ptr noundef nonnull %kernel_args1.i151, i64 noundef %64, ptr noundef %65), !inline_history !82
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i143)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i144)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i145)
  call void @llvm.lifetime.end.p0(ptr nonnull %X.addr.i146)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i147)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i148)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i149)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i150)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i151)
  br label %kcall.end43

kcall.end43:                                      ; preds = %kcall.configok42, %for.cond.cleanup29
  %call44 = call i32 @cudaThreadSynchronize() #15
  br i1 %cmp47202, label %for.body49, label %for.cond.cleanup48

for.cond.cleanup48:                               ; preds = %kcall.end55, %kcall.end43
  %inc61 = add nuw nsw i32 %t.0205, 1
  %exitcond207.not = icmp eq i32 %inc61, %tsteps
  br i1 %exitcond207.not, label %for.cond.cleanup, label %for.body, !llvm.loop !83

for.body49:                                       ; preds = %kcall.end43, %kcall.end55
  %i145.0203 = phi i32 [ %inc58, %kcall.end55 ], [ 0, %kcall.end43 ]
  %call52 = call i32 @__cudaPushCallConfiguration(i64 4294967300, i32 1, i64 4294967552, i32 1, i64 noundef 0, ptr noundef null) #15
  %tobool53.not = icmp eq i32 %call52, 0
  br i1 %tobool53.not, label %kcall.configok54, label %kcall.end55

kcall.configok54:                                 ; preds = %for.body49
  %66 = load ptr, ptr %A_gpu, align 8, !tbaa !68
  %67 = load ptr, ptr %B_gpu, align 8, !tbaa !68
  %68 = load ptr, ptr %X_gpu, align 8, !tbaa !68
  call void @llvm.lifetime.start.p0(ptr nonnull %n.addr.i159)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i160)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i161)
  call void @llvm.lifetime.start.p0(ptr nonnull %X.addr.i162)
  call void @llvm.lifetime.start.p0(ptr nonnull %i1.addr.i163)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i164)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i165)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i166)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i167)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i168)
  store i32 %n, ptr %n.addr.i159, align 4, !tbaa !67
  store ptr %66, ptr %A.addr.i160, align 8, !tbaa !68
  store ptr %67, ptr %B.addr.i161, align 8, !tbaa !68
  store ptr %68, ptr %X.addr.i162, align 8, !tbaa !68
  store i32 %i145.0203, ptr %i1.addr.i163, align 4, !tbaa !67
  store ptr %n.addr.i159, ptr %kernel_args1.i168, align 16
  store ptr %A.addr.i160, ptr %22, align 8
  store ptr %B.addr.i161, ptr %23, align 16
  store ptr %X.addr.i162, ptr %24, align 8
  store ptr %i1.addr.i163, ptr %25, align 16
  %69 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i164, ptr nonnull %block_dim.i165, ptr nonnull %shmem_size.i166, ptr nonnull %stream.i167), !inline_history !84
  %70 = load i64, ptr %shmem_size.i166, align 8
  %71 = load ptr, ptr %stream.i167, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i169 = load i64, ptr %grid_dim.i164, align 8
  %grid_dim.coerce.sroa.2.0.copyload.i171 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i170, align 8
  %block_dim.coerce.sroa.0.0.copyload.i172 = load i64, ptr %block_dim.i165, align 8
  %block_dim.coerce.sroa.2.0.copyload.i174 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i173, align 8
  %call.i175 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel6iPfS_S_i, i64 %grid_dim.coerce.sroa.0.0.copyload.i169, i32 %grid_dim.coerce.sroa.2.0.copyload.i171, i64 %block_dim.coerce.sroa.0.0.copyload.i172, i32 %block_dim.coerce.sroa.2.0.copyload.i174, ptr noundef nonnull %kernel_args1.i168, i64 noundef %70, ptr noundef %71), !inline_history !84
  call void @llvm.lifetime.end.p0(ptr nonnull %n.addr.i159)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i160)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i161)
  call void @llvm.lifetime.end.p0(ptr nonnull %X.addr.i162)
  call void @llvm.lifetime.end.p0(ptr nonnull %i1.addr.i163)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i164)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i165)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i166)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i167)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i168)
  br label %kcall.end55

kcall.end55:                                      ; preds = %kcall.configok54, %for.body49
  %call56 = call i32 @cudaThreadSynchronize() #15
  %inc58 = add nuw nsw i32 %i145.0203, 1
  %exitcond206.not = icmp eq i32 %i145.0203, %26
  br i1 %exitcond206.not, label %for.cond.cleanup48, label %for.body49, !llvm.loop !85
}

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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !71
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !74
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #16
  store double %2, ptr @polybench_t_start, align 8, !tbaa !75
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !71
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !74
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #16
  store double %2, ptr @polybench_t_end, align 8, !tbaa !75
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !75
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !75
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #15
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #9 {
entry:
  %Tp.i.i69 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %newA.i.i60 = alloca ptr, align 8
  %newA.i.i53 = alloca ptr, align 8
  %newA.i.i46 = alloca ptr, align 8
  %newA.i.i39 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #16
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #15
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #15
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #16
  store ptr null, ptr %newA.i.i, align 8, !tbaa !86
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 4194304) #17
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !86
  %1 = ptrtoaddr ptr %0 to i64
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %2 = load ptr, ptr @stderr, align 8, !tbaa !87
  %3 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %2) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i39) #16
  store ptr null, ptr %newA.i.i39, align 8, !tbaa !86
  %call.i.i40 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i39, i64 noundef 32, i64 noundef 4194304) #17
  %4 = load ptr, ptr %newA.i.i39, align 8, !tbaa !86
  %5 = ptrtoaddr ptr %4 to i64
  %tobool.i.i41 = icmp eq ptr %4, null
  %tobool1.i.i42 = icmp ne i32 %call.i.i40, 0
  %or.cond.i.i43 = select i1 %tobool.i.i41, i1 true, i1 %tobool1.i.i42
  br i1 %or.cond.i.i43, label %if.then.i.i44, label %_Z20polybench_alloc_datayi.exit45

if.then.i.i44:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %6 = load ptr, ptr @stderr, align 8, !tbaa !87
  %7 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %6) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit45:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i39) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i46) #16
  store ptr null, ptr %newA.i.i46, align 8, !tbaa !86
  %call.i.i47 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i46, i64 noundef 32, i64 noundef 4194304) #17
  %8 = load ptr, ptr %newA.i.i46, align 8, !tbaa !86
  %tobool.i.i48 = icmp eq ptr %8, null
  %tobool1.i.i49 = icmp ne i32 %call.i.i47, 0
  %or.cond.i.i50 = select i1 %tobool.i.i48, i1 true, i1 %tobool1.i.i49
  br i1 %or.cond.i.i50, label %if.then.i.i51, label %_Z20polybench_alloc_datayi.exit52

if.then.i.i51:                                    ; preds = %_Z20polybench_alloc_datayi.exit45
  %9 = load ptr, ptr @stderr, align 8, !tbaa !87
  %10 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %9) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit52:                ; preds = %_Z20polybench_alloc_datayi.exit45
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i46) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i53) #16
  store ptr null, ptr %newA.i.i53, align 8, !tbaa !86
  %call.i.i54 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i53, i64 noundef 32, i64 noundef 4194304) #17
  %11 = load ptr, ptr %newA.i.i53, align 8, !tbaa !86
  %12 = ptrtoaddr ptr %11 to i64
  %tobool.i.i55 = icmp eq ptr %11, null
  %tobool1.i.i56 = icmp ne i32 %call.i.i54, 0
  %or.cond.i.i57 = select i1 %tobool.i.i55, i1 true, i1 %tobool1.i.i56
  br i1 %or.cond.i.i57, label %if.then.i.i58, label %_Z20polybench_alloc_datayi.exit59

if.then.i.i58:                                    ; preds = %_Z20polybench_alloc_datayi.exit52
  %13 = load ptr, ptr @stderr, align 8, !tbaa !87
  %14 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %13) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit59:                ; preds = %_Z20polybench_alloc_datayi.exit52
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i53) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i60) #16
  store ptr null, ptr %newA.i.i60, align 8, !tbaa !86
  %call.i.i61 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i60, i64 noundef 32, i64 noundef 4194304) #17
  %15 = load ptr, ptr %newA.i.i60, align 8, !tbaa !86
  %tobool.i.i62 = icmp eq ptr %15, null
  %tobool1.i.i63 = icmp ne i32 %call.i.i61, 0
  %or.cond.i.i64 = select i1 %tobool.i.i62, i1 true, i1 %tobool1.i.i63
  br i1 %or.cond.i.i64, label %if.then.i.i65, label %_Z20polybench_alloc_datayi.exit66

if.then.i.i65:                                    ; preds = %_Z20polybench_alloc_datayi.exit59
  %16 = load ptr, ptr @stderr, align 8, !tbaa !87
  %17 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %16) #18
  call void @exit(i32 noundef 1) #19
  unreachable

_Z20polybench_alloc_datayi.exit66:                ; preds = %_Z20polybench_alloc_datayi.exit59
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i60) #16
  %18 = sub i64 %12, %1
  %diff.check = icmp ugt i64 %18, -16
  %19 = sub i64 %12, %5
  %diff.check82 = icmp ugt i64 %19, -16
  %conflict.rdx = or i1 %diff.check, %diff.check82
  %20 = sub i64 %1, %5
  %diff.check83 = icmp ugt i64 %20, -16
  %conflict.rdx84 = or i1 %conflict.rdx, %diff.check83
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc24_crit_edge.i, %_Z20polybench_alloc_datayi.exit66
  %indvars.iv49.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit66 ], [ %indvars.iv.next50.i, %for.cond1.for.inc24_crit_edge.i ]
  %21 = trunc i64 %indvars.iv49.i to i32
  %conv.i = uitofp nneg i32 %21 to float
  %arrayidx.i = getelementptr inbounds nuw [4096 x i8], ptr %11, i64 %indvars.iv49.i
  %arrayidx12.i = getelementptr inbounds nuw [4096 x i8], ptr %0, i64 %indvars.iv49.i
  %22 = add i32 %21, 3
  %23 = add i32 %21, -1
  %conv7.i = sitofp i32 %23 to float
  %conv16.i = uitofp nneg i32 %22 to float
  %arrayidx21.i = getelementptr inbounds nuw [4096 x i8], ptr %4, i64 %indvars.iv49.i
  br i1 %conflict.rdx84, label %for.body3.i.preheader, label %vector.ph

for.body3.i.preheader:                            ; preds = %for.cond1.preheader.i
  %24 = insertelement <2 x float> poison, float %conv7.i, i64 0
  %25 = insertelement <2 x float> %24, float %conv16.i, i64 1
  br label %for.body3.i

vector.ph:                                        ; preds = %for.cond1.preheader.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert85 = insertelement <4 x float> poison, float %conv7.i, i64 0
  %broadcast.splat86 = shufflevector <4 x float> %broadcast.splatinsert85, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert87 = insertelement <4 x float> poison, float %conv16.i, i64 0
  %broadcast.splat88 = shufflevector <4 x float> %broadcast.splatinsert87, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.ind89 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next90, %vector.body ]
  %26 = trunc <4 x i64> %vec.ind to <4 x i32>
  %27 = add <4 x i32> %26, splat (i32 1)
  %28 = uitofp nneg <4 x i32> %27 to <4 x float>
  %29 = call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat, <4 x float> %28, <4 x float> splat (float 1.000000e+00))
  %30 = fmul nnan <4 x float> %29, splat (float f0x3A800000)
  %31 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  store <4 x float> %30, ptr %31, align 4, !tbaa !10
  %32 = add <4 x i32> %vec.ind89, splat (i32 4)
  %33 = uitofp nneg <4 x i32> %32 to <4 x float>
  %34 = call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat86, <4 x float> %33, <4 x float> splat (float 2.000000e+00))
  %35 = fmul nnan <4 x float> %34, splat (float f0x3A800000)
  %36 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.i, i64 %index
  store <4 x float> %35, ptr %36, align 4, !tbaa !10
  %37 = add <4 x i32> %vec.ind89, splat (i32 7)
  %38 = uitofp nneg <4 x i32> %37 to <4 x float>
  %39 = call nnan <4 x float> @llvm.fmuladd.v4f32(<4 x float> %broadcast.splat88, <4 x float> %38, <4 x float> splat (float 3.000000e+00))
  %40 = fmul nnan <4 x float> %39, splat (float f0x3A800000)
  %41 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx21.i, i64 %index
  store <4 x float> %40, ptr %41, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add nuw nsw <4 x i64> %vec.ind, splat (i64 4)
  %vec.ind.next90 = add <4 x i32> %vec.ind89, splat (i32 4)
  %42 = icmp eq i64 %index.next, 1024
  br i1 %42, label %for.cond1.for.inc24_crit_edge.i, label %vector.body, !llvm.loop !89

for.body3.i:                                      ; preds = %for.body3.i.preheader, %for.body3.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body3.i ], [ 0, %for.body3.i.preheader ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %43 = trunc nuw nsw i64 %indvars.iv.next.i to i32
  %conv4.i = uitofp nneg i32 %43 to float
  %44 = call nnan float @llvm.fmuladd.f32(float %conv.i, float %conv4.i, float 1.000000e+00)
  %div.i = fmul nnan float %44, f0x3A800000
  %arrayidx6.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %indvars.iv.i
  store float %div.i, ptr %arrayidx6.i, align 4, !tbaa !10
  %45 = trunc i64 %indvars.iv.i to i32
  %arrayidx14.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx12.i, i64 %indvars.iv.i
  %46 = add i32 %45, 7
  %47 = add i32 %45, 4
  %conv18.i = uitofp nneg i32 %46 to float
  %conv9.i = uitofp nneg i32 %47 to float
  %48 = insertelement <2 x float> poison, float %conv9.i, i64 0
  %49 = insertelement <2 x float> %48, float %conv18.i, i64 1
  %50 = call nnan <2 x float> @llvm.fmuladd.v2f32(<2 x float> %25, <2 x float> %49, <2 x float> <float 2.000000e+00, float 3.000000e+00>)
  %51 = fmul nnan <2 x float> %50, splat (float f0x3A800000)
  %52 = extractelement <2 x float> %51, i64 0
  store float %52, ptr %arrayidx14.i, align 4, !tbaa !10
  %arrayidx23.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx21.i, i64 %indvars.iv.i
  %53 = extractelement <2 x float> %51, i64 1
  store float %53, ptr %arrayidx23.i, align 4, !tbaa !10
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 1024
  br i1 %exitcond.not.i, label %for.cond1.for.inc24_crit_edge.i, label %for.body3.i, !llvm.loop !90

for.cond1.for.inc24_crit_edge.i:                  ; preds = %vector.body, %for.body3.i
  %indvars.iv.next50.i = add nuw nsw i64 %indvars.iv49.i, 1
  %exitcond55.not.i = icmp eq i64 %indvars.iv.next50.i, 1024
  br i1 %exitcond55.not.i, label %_Z10init_arrayiPA1024_fS0_S0_.exit, label %for.cond1.preheader.i, !llvm.loop !60

_Z10init_arrayiPA1024_fS0_S0_.exit:               ; preds = %for.cond1.for.inc24_crit_edge.i
  call void @_Z7adiCudaiiPA1024_fS0_S0_S0_S0_(i32 noundef 1, i32 noundef 1024, ptr noundef nonnull %0, ptr noundef nonnull %4, ptr noundef nonnull %11, ptr noundef nonnull %8, ptr noundef nonnull %15) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #16
  %call.i.i67 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #17
  %cmp.not.i.i = icmp eq i32 %call.i.i67, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i68

if.then.i.i68:                                    ; preds = %_Z10init_arrayiPA1024_fS0_S0_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i67) #15
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiPA1024_fS0_S0_.exit, %if.then.i.i68
  %54 = load i64, ptr %Tp.i.i, align 8, !tbaa !71
  %conv.i.i = sitofp i64 %54 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %55 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !74
  %conv2.i.i = sitofp i64 %55 to double
  %56 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #16
  store double %56, ptr @polybench_t_start, align 8, !tbaa !75
  call void @_Z3adiiiPA1024_fS0_S0_(i32 noundef 1, i32 noundef 1024, ptr noundef nonnull %0, ptr noundef nonnull %4, ptr noundef nonnull %11) #15
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i69) #16
  %call.i.i70 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i69, ptr noundef null) #17
  %cmp.not.i.i71 = icmp eq i32 %call.i.i70, 0
  br i1 %cmp.not.i.i71, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i72

if.then.i.i72:                                    ; preds = %_Z21polybench_timer_startv.exit
  %call1.i.i73 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i70) #15
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z21polybench_timer_startv.exit, %if.then.i.i72
  %57 = load i64, ptr %Tp.i.i69, align 8, !tbaa !71
  %conv.i.i74 = sitofp i64 %57 to double
  %tv_usec.i.i75 = getelementptr inbounds nuw i8, ptr %Tp.i.i69, i64 8
  %58 = load i64, ptr %tv_usec.i.i75, align 8, !tbaa !74
  %conv2.i.i76 = sitofp i64 %58 to double
  %59 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i76, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i74)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i69) #16
  store double %59, ptr @polybench_t_end, align 8, !tbaa !75
  %60 = load double, ptr @polybench_t_start, align 8, !tbaa !75
  %sub.i = fsub double %59, %60
  %call.i77 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #15
  call void @_Z14compareResultsiPA1024_fS0_S0_S0_(i32 noundef 1024, ptr noundef nonnull %4, ptr noundef nonnull %8, ptr noundef nonnull %11, ptr noundef nonnull %15) #15
  call void @free(ptr noundef nonnull %0) #17
  call void @free(ptr noundef nonnull %4) #17
  call void @free(ptr noundef nonnull %8) #17
  call void @free(ptr noundef nonnull %11) #17
  call void @free(ptr noundef nonnull %15) #17
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #16
  store ptr null, ptr %newA.i, align 8, !tbaa !86
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #17
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !86
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !87
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

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #12

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #13

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #14

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #13

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
!17 = distinct !{!17, !18, !19, !20}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = !{!"llvm.loop.unroll.runtime.disable"}
!21 = distinct !{!21, !18}
!22 = distinct !{!22, !18}
!23 = distinct !{!23, !18, !19}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28, !29}
!28 = distinct !{!28, !26}
!29 = distinct !{!29, !26}
!30 = !{!28}
!31 = !{!29}
!32 = distinct !{!32, !18, !19, !20}
!33 = distinct !{!33, !18}
!34 = distinct !{!34, !18, !19}
!35 = !{!36}
!36 = distinct !{!36, !37}
!37 = distinct !{!37, !"LVerDomain"}
!38 = !{!39}
!39 = distinct !{!39, !37}
!40 = distinct !{!40, !18, !19, !20}
!41 = distinct !{!41, !42}
!42 = !{!"llvm.loop.unroll.disable"}
!43 = !{!44}
!44 = distinct !{!44, !45}
!45 = distinct !{!45, !"LVerDomain"}
!46 = !{!47, !48}
!47 = distinct !{!47, !45}
!48 = distinct !{!48, !45}
!49 = !{!48}
!50 = !{!47}
!51 = distinct !{!51, !18, !19, !20}
!52 = distinct !{!52, !18}
!53 = distinct !{!53, !18, !19}
!54 = distinct !{!54, !18, !19}
!55 = distinct !{!55, !18}
!56 = distinct !{!56, !18}
!57 = distinct !{!57, !18}
!58 = distinct !{!58, !18, !19, !20}
!59 = distinct !{!59, !18, !19}
!60 = distinct !{!60, !18}
!61 = distinct !{!61, !18, !19, !20}
!62 = distinct !{!62, !18, !20, !19}
!63 = distinct !{!63, !18}
!64 = distinct !{!64, !18, !19, !20}
!65 = distinct !{!65, !18, !20, !19}
!66 = distinct !{!66, !18}
!67 = !{!7, !7, i64 0}
!68 = !{!69, !69, i64 0}
!69 = !{!"p1 float", !70, i64 0}
!70 = !{!"any pointer", !8, i64 0}
!71 = !{!72, !73, i64 0}
!72 = !{!"_ZTS7timeval", !73, i64 0, !73, i64 8}
!73 = !{!"long", !8, i64 0}
!74 = !{!72, !73, i64 8}
!75 = !{!76, !76, i64 0}
!76 = !{!"double", !8, i64 0}
!77 = !{ptr @_Z26__device_stub__adi_kernel1iPfS_S_}
!78 = !{ptr @_Z26__device_stub__adi_kernel2iPfS_S_}
!79 = !{ptr @_Z26__device_stub__adi_kernel3iPfS_S_}
!80 = !{ptr @_Z26__device_stub__adi_kernel4iPfS_S_i}
!81 = distinct !{!81, !18}
!82 = !{ptr @_Z26__device_stub__adi_kernel5iPfS_S_}
!83 = distinct !{!83, !18}
!84 = !{ptr @_Z26__device_stub__adi_kernel6iPfS_S_i}
!85 = distinct !{!85, !18}
!86 = !{!70, !70, i64 0}
!87 = !{!88, !88, i64 0}
!88 = !{!"p1 _ZTS8_IO_FILE", !70, i64 0}
!89 = distinct !{!89, !18, !19, !20}
!90 = distinct !{!90, !18, !19}
