; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/2DCONV/2DConvolution.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/2DCONV/2DConvolution.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cudaDeviceProp = type { [256 x i8], %struct.CUuuid_st, [8 x i8], i32, i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [63 x i32] }
%struct.CUuuid_st = type { [16 x i8] }
%struct.dim3 = type { i32, i32, i32 }
%struct.timeval = type { i64, i64 }

@.str = private constant [74 x i8] c"Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\0A\00", align 1
@.str.1 = private constant [32 x i8] c"setting device %d with name %s\0A\00", align 1
@polybench_papi_counters_threadid = dso_local local_unnamed_addr global i32 0, align 4
@polybench_program_total_flops = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_t_start = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_t_end = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_c_start = dso_local local_unnamed_addr global i64 0, align 8
@polybench_c_end = dso_local local_unnamed_addr global i64 0, align 8
@.str.6 = private constant [7 x i8] c"%0.6f\0A\00", align 1
@.str.7 = private constant [35 x i8] c"Error return from gettimeofday: %d\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.8 = private constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1
@str = private unnamed_addr constant [21 x i8] c"GPU Time in seconds:\00", align 1
@str.1 = private unnamed_addr constant [21 x i8] c"CPU Time in seconds:\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef float @_Z6absValf(float noundef %0) local_unnamed_addr #0 {
common.ret:
  %1 = fcmp olt float %0, 0.000000e+00
  %2 = fneg float %0
  %common.ret.op = select i1 %1, float %2, float %0
  ret float %common.ret.op
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local noundef float @_Z11percentDiffdd(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  %3 = fptrunc double %0 to float
  %4 = fcmp olt double %0, f0xB690000000000000
  %5 = fneg float %3
  %common.ret.op.i = select i1 %4, float %5, float %3
  %6 = fpext float %common.ret.op.i to double
  %7 = fcmp olt double %6, 1.000000e-02
  br i1 %7, label %8, label %.critedge

8:                                                ; preds = %2
  %9 = fptrunc double %1 to float
  %10 = fcmp olt double %1, f0xB690000000000000
  %11 = fneg float %9
  %common.ret.op.i7 = select i1 %10, float %11, float %9
  %12 = fpext float %common.ret.op.i7 to double
  %13 = fcmp olt double %12, 1.000000e-02
  br i1 %13, label %common.ret, label %.critedge

common.ret:                                       ; preds = %8, %.critedge
  %common.ret.op = phi float [ %27, %.critedge ], [ 0.000000e+00, %8 ]
  ret float %common.ret.op

.critedge:                                        ; preds = %2, %8
  %14 = insertelement <2 x double> poison, double %0, i64 0
  %15 = shufflevector <2 x double> %14, <2 x double> poison, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %1, i64 0
  %17 = fsub <2 x double> %15, %16
  %18 = fptrunc <2 x double> %17 to <2 x float>
  %19 = fcmp olt <2 x double> %17, splat (double f0xB690000000000000)
  %20 = fneg <2 x float> %18
  %21 = select <2 x i1> %19, <2 x float> %20, <2 x float> %18
  %22 = extractelement <2 x float> %21, i64 0
  %23 = extractelement <2 x float> %21, i64 1
  %24 = fdiv float %22, %23
  %25 = fcmp olt float %24, 0.000000e+00
  %26 = fneg float %24
  %common.ret.op.i10 = select i1 %25, float %26, float %24
  %27 = fmul float %common.ret.op.i10, 1.000000e+02
  br label %common.ret
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z6conv2DiiPA4096_fS0_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef writeonly captures(none) %3) local_unnamed_addr #1 {
  %5 = icmp sgt i32 %0, 2
  %6 = icmp sgt i32 %1, 2
  %or.cond = and i1 %5, %6
  br i1 %or.cond, label %.preheader.preheader, label %._crit_edge47.split

.preheader.preheader:                             ; preds = %4
  %7 = add nsw i32 %0, -1
  %8 = add nsw i32 %1, -1
  %wide.trip.count52 = zext i32 %7 to i64
  %wide.trip.count = zext i32 %8 to i64
  %scevgep = getelementptr i8, ptr %3, i64 16388
  %9 = shl nuw nsw i64 %wide.trip.count52, 14
  %10 = shl nuw nsw i64 %wide.trip.count, 2
  %11 = add nuw nsw i64 %9, %10
  %12 = getelementptr i8, ptr %3, i64 %11
  %scevgep54 = getelementptr i8, ptr %12, i64 -16384
  %13 = getelementptr i8, ptr %2, i64 %11
  %scevgep55 = getelementptr i8, ptr %13, i64 4
  %14 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i64 %14, 4
  %bound0 = icmp ult ptr %scevgep, %scevgep55
  %bound1 = icmp ult ptr %2, %scevgep54
  %found.conflict = and i1 %bound0, %bound1
  %n.vec = and i64 %14, -4
  %15 = or disjoint i64 %n.vec, 1
  %cmp.n = icmp eq i64 %14, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv49 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next50, %._crit_edge ]
  %16 = getelementptr [16384 x i8], ptr %2, i64 %indvars.iv49
  %17 = getelementptr i8, ptr %16, i64 -16384
  %18 = getelementptr i8, ptr %16, i64 16384
  %19 = getelementptr [16384 x i8], ptr %3, i64 %indvars.iv49
  %brmerge = select i1 %min.iters.check, i1 true, i1 %found.conflict
  br i1 %brmerge, label %scalar.ph.preheader, label %vector.body

vector.body:                                      ; preds = %.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader ]
  %20 = or disjoint i64 %index, 1
  %21 = getelementptr [4 x i8], ptr %17, i64 %index
  %wide.load = load <4 x float>, ptr %21, align 4, !alias.scope !1
  %22 = fmul <4 x float> %wide.load, splat (float 2.000000e-01)
  %23 = getelementptr [4 x i8], ptr %16, i64 %index
  %wide.load56 = load <4 x float>, ptr %23, align 4, !alias.scope !1
  %24 = fmul <4 x float> %wide.load56, splat (float 3.000000e-01)
  %25 = fsub <4 x float> %22, %24
  %26 = getelementptr [4 x i8], ptr %18, i64 %index
  %wide.load57 = load <4 x float>, ptr %26, align 4, !alias.scope !1
  %27 = fmul <4 x float> %wide.load57, splat (float 4.000000e-01)
  %28 = fadd <4 x float> %25, %27
  %29 = getelementptr [4 x i8], ptr %17, i64 %20
  %wide.load58 = load <4 x float>, ptr %29, align 4, !alias.scope !1
  %30 = fmul <4 x float> %wide.load58, splat (float 5.000000e-01)
  %31 = fadd <4 x float> %28, %30
  %32 = getelementptr [4 x i8], ptr %16, i64 %20
  %wide.load59 = load <4 x float>, ptr %32, align 4, !alias.scope !1
  %33 = fmul <4 x float> %wide.load59, splat (float 6.000000e-01)
  %34 = fadd <4 x float> %31, %33
  %35 = getelementptr [4 x i8], ptr %18, i64 %20
  %wide.load60 = load <4 x float>, ptr %35, align 4, !alias.scope !1
  %36 = fmul <4 x float> %wide.load60, splat (float f0x3F333333)
  %37 = fadd <4 x float> %34, %36
  %38 = or disjoint i64 %index, 2
  %39 = getelementptr [4 x i8], ptr %17, i64 %38
  %wide.load61 = load <4 x float>, ptr %39, align 4, !alias.scope !1
  %40 = fmul <4 x float> %wide.load61, splat (float 8.000000e-01)
  %41 = fsub <4 x float> %37, %40
  %42 = getelementptr [4 x i8], ptr %16, i64 %38
  %wide.load62 = load <4 x float>, ptr %42, align 4, !alias.scope !1
  %43 = fmul <4 x float> %wide.load62, splat (float f0x3F666666)
  %44 = fsub <4 x float> %41, %43
  %45 = getelementptr [4 x i8], ptr %18, i64 %38
  %wide.load63 = load <4 x float>, ptr %45, align 4, !alias.scope !1
  %46 = fmul <4 x float> %wide.load63, splat (float 1.000000e-01)
  %47 = fadd <4 x float> %44, %46
  %48 = getelementptr [4 x i8], ptr %19, i64 %20
  store <4 x float> %47, ptr %48, align 4, !alias.scope !4, !noalias !1
  %index.next = add nuw i64 %index, 4
  %49 = icmp eq i64 %index.next, %n.vec
  br i1 %49, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ %15, %middle.block ], [ 1, %.preheader ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %50 = add nsw i64 %indvars.iv, -1
  %51 = getelementptr [4 x i8], ptr %17, i64 %50
  %52 = load float, ptr %51, align 4
  %53 = fmul float %52, 2.000000e-01
  %54 = getelementptr [4 x i8], ptr %16, i64 %50
  %55 = load float, ptr %54, align 4
  %56 = fmul float %55, 3.000000e-01
  %57 = fsub float %53, %56
  %58 = getelementptr [4 x i8], ptr %18, i64 %50
  %59 = load float, ptr %58, align 4
  %60 = fmul float %59, 4.000000e-01
  %61 = fadd float %57, %60
  %62 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv
  %63 = load float, ptr %62, align 4
  %64 = fmul float %63, 5.000000e-01
  %65 = fadd float %61, %64
  %66 = getelementptr [4 x i8], ptr %16, i64 %indvars.iv
  %67 = load float, ptr %66, align 4
  %68 = fmul float %67, 6.000000e-01
  %69 = fadd float %65, %68
  %70 = getelementptr [4 x i8], ptr %18, i64 %indvars.iv
  %71 = load float, ptr %70, align 4
  %72 = fmul float %71, f0x3F333333
  %73 = fadd float %69, %72
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %74 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv.next
  %75 = load float, ptr %74, align 4
  %76 = fmul float %75, 8.000000e-01
  %77 = fsub float %73, %76
  %78 = getelementptr [4 x i8], ptr %16, i64 %indvars.iv.next
  %79 = load float, ptr %78, align 4
  %80 = fmul float %79, f0x3F666666
  %81 = fsub float %77, %80
  %82 = getelementptr [4 x i8], ptr %18, i64 %indvars.iv.next
  %83 = load float, ptr %82, align 4
  %84 = fmul float %83, 1.000000e-01
  %85 = fadd float %81, %84
  %86 = getelementptr [4 x i8], ptr %19, i64 %indvars.iv
  store float %85, ptr %86, align 4
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !9

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond53.not = icmp eq i64 %indvars.iv.next50, %wide.trip.count52
  br i1 %exitcond53.not, label %._crit_edge47.split, label %.preheader

._crit_edge47.split:                              ; preds = %._crit_edge, %4
  ret void
}

declare i32 @rand() local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @_Z4initiiPA4096_f(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) %2) local_unnamed_addr #3 {
  %4 = icmp sgt i32 %0, 0
  %5 = icmp sgt i32 %1, 0
  %or.cond = and i1 %4, %5
  br i1 %or.cond, label %.preheader.preheader, label %._crit_edge11.split

.preheader.preheader:                             ; preds = %3
  %wide.trip.count16 = zext nneg i32 %0 to i64
  %wide.trip.count = zext nneg i32 %1 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv13 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next14, %._crit_edge ]
  %6 = getelementptr [16384 x i8], ptr %2, i64 %indvars.iv13
  br label %7

7:                                                ; preds = %.preheader, %7
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %7 ]
  %8 = tail call i32 @rand() #13
  %9 = sitofp i32 %8 to float
  %10 = fmul nnan float %9, f0x30000000
  %11 = getelementptr [4 x i8], ptr %6, i64 %indvars.iv
  store float %10, ptr %11, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %7

._crit_edge:                                      ; preds = %7
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17.not = icmp eq i64 %indvars.iv.next14, %wide.trip.count16
  br i1 %exitcond17.not, label %._crit_edge11.split, label %.preheader

._crit_edge11.split:                              ; preds = %._crit_edge, %3
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiiPA4096_fS0_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #5 {
  %5 = icmp sgt i32 %0, 2
  %6 = icmp sgt i32 %1, 2
  %or.cond = and i1 %5, %6
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge19

.preheader.us.preheader:                          ; preds = %4
  %7 = add nsw i32 %0, -1
  %8 = add nsw i32 %1, -1
  %wide.trip.count26 = zext nneg i32 %7 to i64
  %wide.trip.count = zext i32 %8 to i64
  %9 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i64 %9, 4
  %n.vec = and i64 %9, -4
  %10 = or disjoint i64 %n.vec, 1
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv23 = phi i64 [ 1, %.preheader.us.preheader ], [ %indvars.iv.next24, %._crit_edge.us ]
  %.018.us = phi i32 [ 0, %.preheader.us.preheader ], [ %.2.us.lcssa, %._crit_edge.us ]
  %11 = getelementptr [16384 x i8], ptr %2, i64 %indvars.iv23
  %12 = getelementptr [16384 x i8], ptr %3, i64 %indvars.iv23
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader.us
  %13 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.018.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %13, %vector.ph ], [ %46, %vector.body ]
  %14 = or disjoint i64 %index, 1
  %15 = getelementptr [4 x i8], ptr %11, i64 %14
  %wide.load = load <4 x float>, ptr %15, align 4
  %16 = fpext <4 x float> %wide.load to <4 x double>
  %17 = getelementptr [4 x i8], ptr %12, i64 %14
  %wide.load28 = load <4 x float>, ptr %17, align 4
  %18 = fpext <4 x float> %wide.load28 to <4 x double>
  %19 = fcmp olt <4 x double> %16, splat (double f0xB690000000000000)
  %20 = fneg <4 x float> %wide.load
  %21 = select <4 x i1> %19, <4 x float> %20, <4 x float> %wide.load
  %22 = fpext <4 x float> %21 to <4 x double>
  %23 = fcmp uge <4 x double> %22, splat (double 1.000000e-02)
  %24 = fcmp olt <4 x double> %18, splat (double f0xB690000000000000)
  %25 = fneg <4 x float> %wide.load28
  %26 = select <4 x i1> %24, <4 x float> %25, <4 x float> %wide.load28
  %27 = fpext <4 x float> %26 to <4 x double>
  %28 = fcmp uge <4 x double> %27, splat (double 1.000000e-02)
  %29 = fsub <4 x double> %16, %18
  %30 = fptrunc <4 x double> %29 to <4 x float>
  %31 = fcmp olt <4 x double> %29, splat (double f0xB690000000000000)
  %32 = fneg <4 x float> %30
  %33 = select <4 x i1> %31, <4 x float> %32, <4 x float> %30
  %34 = fadd <4 x double> %16, splat (double f0x3E45798EE0000000)
  %35 = fptrunc <4 x double> %34 to <4 x float>
  %36 = fcmp olt <4 x double> %34, splat (double f0xB690000000000000)
  %37 = fneg <4 x float> %35
  %38 = select <4 x i1> %36, <4 x float> %37, <4 x float> %35
  %39 = fdiv <4 x float> %33, %38
  %40 = fcmp olt <4 x float> %39, zeroinitializer
  %41 = fneg <4 x float> %39
  %42 = select <4 x i1> %40, <4 x float> %41, <4 x float> %39
  %43 = fmul <4 x float> %42, splat (float 1.000000e+02)
  %44 = fpext <4 x float> %43 to <4 x double>
  %45 = fcmp ogt <4 x double> %44, splat (double 5.000000e-02)
  %.not30 = select <4 x i1> %23, <4 x i1> splat (i1 true), <4 x i1> %28
  %narrow = select <4 x i1> %.not30, <4 x i1> %45, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %46 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %47 = icmp eq i64 %index.next, %n.vec
  br i1 %47, label %middle.block, label %vector.body, !llvm.loop !10

middle.block:                                     ; preds = %vector.body
  %48 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %46)
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 1, %.preheader.us ], [ %10, %middle.block ]
  %.116.us.ph = phi i32 [ %.018.us, %.preheader.us ], [ %48, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %_Z11percentDiffdd.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %.116.us = phi i32 [ %.2.us, %_Z11percentDiffdd.exit.us ], [ %.116.us.ph, %scalar.ph.preheader ]
  %49 = getelementptr [4 x i8], ptr %11, i64 %indvars.iv
  %50 = load float, ptr %49, align 4
  %51 = fpext float %50 to double
  %52 = getelementptr [4 x i8], ptr %12, i64 %indvars.iv
  %53 = load float, ptr %52, align 4
  %54 = fpext float %53 to double
  %55 = fcmp olt double %51, f0xB690000000000000
  %56 = fneg float %50
  %common.ret.op.i.i.us = select i1 %55, float %56, float %50
  %57 = fpext float %common.ret.op.i.i.us to double
  %58 = fcmp olt double %57, 1.000000e-02
  br i1 %58, label %59, label %.critedge.i.us

59:                                               ; preds = %scalar.ph
  %60 = fcmp olt double %54, f0xB690000000000000
  %61 = fneg float %53
  %common.ret.op.i7.i.us = select i1 %60, float %61, float %53
  %62 = fpext float %common.ret.op.i7.i.us to double
  %63 = fcmp olt double %62, 1.000000e-02
  br i1 %63, label %_Z11percentDiffdd.exit.us, label %.critedge.i.us

.critedge.i.us:                                   ; preds = %59, %scalar.ph
  %64 = insertelement <2 x double> poison, double %51, i64 0
  %65 = shufflevector <2 x double> %64, <2 x double> poison, <2 x i32> zeroinitializer
  %66 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %54, i64 0
  %67 = fsub <2 x double> %65, %66
  %68 = fptrunc <2 x double> %67 to <2 x float>
  %69 = fcmp olt <2 x double> %67, splat (double f0xB690000000000000)
  %70 = fneg <2 x float> %68
  %71 = select <2 x i1> %69, <2 x float> %70, <2 x float> %68
  %72 = extractelement <2 x float> %71, i64 0
  %73 = extractelement <2 x float> %71, i64 1
  %74 = fdiv float %72, %73
  %75 = fcmp olt float %74, 0.000000e+00
  %76 = fneg float %74
  %common.ret.op.i10.i.us = select i1 %75, float %76, float %74
  %77 = fmul float %common.ret.op.i10.i.us, 1.000000e+02
  %78 = fpext float %77 to double
  %79 = fcmp ogt double %78, 5.000000e-02
  %80 = zext i1 %79 to i32
  br label %_Z11percentDiffdd.exit.us

_Z11percentDiffdd.exit.us:                        ; preds = %.critedge.i.us, %59
  %common.ret.op.i.us = phi i32 [ %80, %.critedge.i.us ], [ 0, %59 ]
  %.2.us = add nsw i32 %common.ret.op.i.us, %.116.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !11

._crit_edge.us:                                   ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %.2.us.lcssa = phi i32 [ %48, %middle.block ], [ %.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27.not = icmp eq i64 %indvars.iv.next24, %wide.trip.count26
  br i1 %exitcond27.not, label %._crit_edge19, label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge.us, %4
  %.0.lcssa = phi i32 [ 0, %4 ], [ %.2.us.lcssa, %._crit_edge.us ]
  %81 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %.0.lcssa) #2
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #2

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #2

define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #6 {
  %1 = alloca %struct.cudaDeviceProp, align 8
  %2 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %1, i32 noundef 0) #2
  %3 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %1) #2
  %4 = call i32 @cudaSetDevice(i32 noundef 0) #2
  ret void
}

declare dso_local i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare dso_local i32 @cudaLaunchKernel(ptr, %struct.dim3, %struct.dim3, ptr, i64, ptr) local_unnamed_addr

define dso_local void @_Z35__device_stub__convolution2D_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #6 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = alloca [4 x ptr], align 16
  store ptr %5, ptr %9, align 16
  %10 = getelementptr inbounds nuw i8, ptr %9, i64 8
  store ptr %6, ptr %10, align 8
  %11 = getelementptr inbounds nuw i8, ptr %9, i64 16
  store ptr %7, ptr %11, align 16
  %12 = getelementptr inbounds nuw i8, ptr %9, i64 24
  store ptr %8, ptr %12, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca %struct.dim3, align 8
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  %17 = call i32 @__cudaPopCallConfiguration(ptr nonnull %13, ptr nonnull %14, ptr nonnull %15, ptr nonnull %16)
  %18 = load i64, ptr %15, align 8
  %19 = load ptr, ptr %16, align 8
  %.fca.0.load2 = load i32, ptr %13, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %13, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %13, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %14, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %14, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %14, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z35__device_stub__convolution2D_kerneliiPfS_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #2

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @gettimeofday(ptr noalias noundef nonnull captures(none), ptr noalias noundef captures(none)) local_unnamed_addr #4

; Function Attrs: nofree nounwind
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #5 {
  %1 = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #13
  %.not.i = icmp eq i32 %2, 0
  br i1 %.not.i, label %_ZL7rtclockv.exit, label %3

3:                                                ; preds = %0
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %2) #2
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %0, %3
  %5 = load i64, ptr %1, align 8
  %6 = sitofp i64 %5 to double
  %7 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %8 = load i64, ptr %7, align 8
  %9 = sitofp i64 %8 to double
  %10 = fmul nnan double %9, f0x3EB0C6F7A0B5ED8D
  %11 = fadd double %10, %6
  call void @llvm.lifetime.end.p0(ptr nonnull %1)
  store double %11, ptr @polybench_t_start, align 8
  ret void
}

declare i32 @__cudaPushCallConfiguration(%struct.dim3, %struct.dim3, i64 noundef, ptr noundef) local_unnamed_addr #2

declare i32 @cudaThreadSynchronize() local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #5 {
  %1 = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #13
  %.not.i = icmp eq i32 %2, 0
  br i1 %.not.i, label %_ZL7rtclockv.exit, label %3

3:                                                ; preds = %0
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %2) #2
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %0, %3
  %5 = load i64, ptr %1, align 8
  %6 = sitofp i64 %5 to double
  %7 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %8 = load i64, ptr %7, align 8
  %9 = sitofp i64 %8 to double
  %10 = fmul nnan double %9, f0x3EB0C6F7A0B5ED8D
  %11 = fadd double %10, %6
  call void @llvm.lifetime.end.p0(ptr nonnull %1)
  store double %11, ptr @polybench_t_end, align 8
  ret void
}

; Function Attrs: nofree nounwind
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
  %1 = load double, ptr @polybench_t_end, align 8
  %2 = load double, ptr @polybench_t_start, align 8
  %3 = fsub double %1, %2
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %3) #2
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #2

define dso_local void @_Z17convolution2DCudaiiPA4096_fS0_S0_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr nofree readnone captures(none) %3, ptr noundef %4) local_unnamed_addr #6 {
  %6 = alloca %struct.timeval, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca [4 x ptr], align 16
  %12 = alloca %struct.dim3, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca i64, align 8
  %15 = alloca ptr, align 8
  %16 = alloca %struct.timeval, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = call i32 @cudaMalloc(ptr noundef nonnull %17, i64 noundef 67108864) #2
  %20 = call i32 @cudaMalloc(ptr noundef nonnull %18, i64 noundef 67108864) #2
  %21 = load ptr, ptr %17, align 8
  %22 = call i32 @cudaMemcpy(ptr noundef %21, ptr noundef %2, i64 noundef 67108864, i32 noundef 1) #2
  call void @llvm.lifetime.start.p0(ptr nonnull %16)
  %23 = call i32 @gettimeofday(ptr noundef nonnull %16, ptr noundef null) #13
  %.not.i.i = icmp eq i32 %23, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %24

24:                                               ; preds = %5
  %25 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %23) #2
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %5, %24
  %26 = load i64, ptr %16, align 8
  %27 = sitofp i64 %26 to double
  %28 = getelementptr inbounds nuw i8, ptr %16, i64 8
  %29 = load i64, ptr %28, align 8
  %30 = sitofp i64 %29 to double
  %31 = fmul nnan double %30, f0x3EB0C6F7A0B5ED8D
  %32 = fadd double %31, %27
  call void @llvm.lifetime.end.p0(ptr nonnull %16)
  store double %32, ptr @polybench_t_start, align 8
  %33 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 128, i32 512, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #2
  %.not = icmp eq i32 %33, 0
  br i1 %.not, label %34, label %44

34:                                               ; preds = %_Z21polybench_timer_startv.exit
  %35 = load ptr, ptr %17, align 8
  %36 = load ptr, ptr %18, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  call void @llvm.lifetime.start.p0(ptr nonnull %15)
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %35, ptr %9, align 8
  store ptr %36, ptr %10, align 8
  store ptr %7, ptr %11, align 16
  %37 = getelementptr inbounds nuw i8, ptr %11, i64 8
  store ptr %8, ptr %37, align 8
  %38 = getelementptr inbounds nuw i8, ptr %11, i64 16
  store ptr %9, ptr %38, align 16
  %39 = getelementptr inbounds nuw i8, ptr %11, i64 24
  store ptr %10, ptr %39, align 8
  %40 = call i32 @__cudaPopCallConfiguration(ptr nonnull %12, ptr nonnull %13, ptr nonnull %14, ptr nonnull %15), !inline_history !12
  %41 = load i64, ptr %14, align 8
  %42 = load ptr, ptr %15, align 8
  %.fca.0.load2.i = load i32, ptr %12, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %12, i64 4
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %12, i64 8
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %13, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %13, i64 4
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %13, i64 8
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %43 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z35__device_stub__convolution2D_kerneliiPfS_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %11, i64 noundef %41, ptr noundef %42), !inline_history !12
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  call void @llvm.lifetime.end.p0(ptr nonnull %13)
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  call void @llvm.lifetime.end.p0(ptr nonnull %15)
  br label %44

44:                                               ; preds = %_Z21polybench_timer_startv.exit, %34
  %45 = call i32 @cudaThreadSynchronize() #2
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  %46 = call i32 @gettimeofday(ptr noundef nonnull %6, ptr noundef null) #13
  %.not.i.i9 = icmp eq i32 %46, 0
  br i1 %.not.i.i9, label %_Z20polybench_timer_stopv.exit, label %47

47:                                               ; preds = %44
  %48 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %46) #2
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %44, %47
  %49 = load i64, ptr %6, align 8
  %50 = sitofp i64 %49 to double
  %51 = getelementptr inbounds nuw i8, ptr %6, i64 8
  %52 = load i64, ptr %51, align 8
  %53 = sitofp i64 %52 to double
  %54 = fmul nnan double %53, f0x3EB0C6F7A0B5ED8D
  %55 = fadd double %54, %50
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  store double %55, ptr @polybench_t_end, align 8
  %56 = load double, ptr @polybench_t_start, align 8
  %57 = fsub double %55, %56
  %58 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %57) #2
  %59 = load ptr, ptr %18, align 8
  %60 = call i32 @cudaMemcpy(ptr noundef %4, ptr noundef %59, i64 noundef 67108864, i32 noundef 2) #2
  %61 = load ptr, ptr %17, align 8
  %62 = call i32 @cudaFree(ptr noundef %61) #2
  %63 = load ptr, ptr %18, align 8
  %64 = call i32 @cudaFree(ptr noundef %63) #2
  ret void
}

; Function Attrs: nofree
declare i32 @posix_memalign(ptr noundef nonnull, i64 noundef, i64 noundef) local_unnamed_addr #7

; Function Attrs: nofree noreturn
declare void @exit(i32 noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %0, i32 noundef %1) local_unnamed_addr #5 {
  %3 = alloca ptr, align 8
  %4 = sext i32 %1 to i64
  %5 = mul i64 %0, %4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store ptr null, ptr %3, align 8
  %6 = call i32 @posix_memalign(ptr noundef nonnull %3, i64 noundef 32, i64 noundef %5) #13
  %7 = load ptr, ptr %3, align 8
  %.not.i = icmp eq ptr %7, null
  %8 = icmp ne i32 %6, 0
  %or.cond.i = select i1 %.not.i, i1 true, i1 %8
  br i1 %or.cond.i, label %.critedge.i, label %_ZL7xmallocm.exit

.critedge.i:                                      ; preds = %2
  %9 = load ptr, ptr @stderr, align 8
  %10 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %9) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_ZL7xmallocm.exit:                                ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  ret ptr %7
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #9

define dso_local noundef i32 @main(i32 noundef %0, ptr nofree noundef readnone captures(none) %1) local_unnamed_addr #6 {
  %3 = alloca %struct.timeval, align 8
  %4 = alloca %struct.timeval, align 8
  %5 = alloca %struct.cudaDeviceProp, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %9 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 67108864) #13
  %10 = load ptr, ptr %8, align 8
  %.not.i.i = icmp eq ptr %10, null
  %11 = icmp ne i32 %9, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %11
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %12 = load ptr, ptr @stderr, align 8
  %13 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %12) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %14 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 67108864) #13
  %15 = load ptr, ptr %7, align 8
  %.not.i.i19 = icmp eq ptr %15, null
  %16 = icmp ne i32 %14, 0
  %or.cond.i.i20 = select i1 %.not.i.i19, i1 true, i1 %16
  br i1 %or.cond.i.i20, label %.critedge.i.i21, label %_Z20polybench_alloc_datayi.exit22

.critedge.i.i21:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %17 = load ptr, ptr @stderr, align 8
  %18 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %17) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit22:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %19 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 67108864) #13
  %20 = load ptr, ptr %6, align 8
  %.not.i.i23 = icmp eq ptr %20, null
  %21 = icmp ne i32 %19, 0
  %or.cond.i.i24 = select i1 %.not.i.i23, i1 true, i1 %21
  br i1 %or.cond.i.i24, label %.critedge.i.i25, label %_Z20polybench_alloc_datayi.exit26

.critedge.i.i25:                                  ; preds = %_Z20polybench_alloc_datayi.exit22
  %22 = load ptr, ptr @stderr, align 8
  %23 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %22) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit26:                ; preds = %_Z20polybench_alloc_datayi.exit22
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  br label %.preheader.i

.preheader.i:                                     ; preds = %._crit_edge.i, %_Z20polybench_alloc_datayi.exit26
  %indvars.iv13.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit26 ], [ %indvars.iv.next14.i, %._crit_edge.i ]
  %24 = getelementptr [16384 x i8], ptr %10, i64 %indvars.iv13.i
  br label %25

25:                                               ; preds = %25, %.preheader.i
  %indvars.iv.i = phi i64 [ 0, %.preheader.i ], [ %indvars.iv.next.i, %25 ]
  %26 = call i32 @rand() #13
  %27 = sitofp i32 %26 to float
  %28 = fmul nnan float %27, f0x30000000
  %29 = getelementptr [4 x i8], ptr %24, i64 %indvars.iv.i
  store float %28, ptr %29, align 4
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 4096
  br i1 %exitcond.not.i, label %._crit_edge.i, label %25

._crit_edge.i:                                    ; preds = %25
  %indvars.iv.next14.i = add nuw nsw i64 %indvars.iv13.i, 1
  %exitcond17.not.i = icmp eq i64 %indvars.iv.next14.i, 4096
  br i1 %exitcond17.not.i, label %_Z4initiiPA4096_f.exit, label %.preheader.i

_Z4initiiPA4096_f.exit:                           ; preds = %._crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  %30 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %5, i32 noundef 0) #2
  %31 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %5) #2
  %32 = call i32 @cudaSetDevice(i32 noundef 0) #2
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @_Z17convolution2DCudaiiPA4096_fS0_S0_(i32 noundef 4096, i32 noundef 4096, ptr noundef nonnull %10, ptr poison, ptr noundef %20) #2
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %33 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #13
  %.not.i.i27 = icmp eq i32 %33, 0
  br i1 %.not.i.i27, label %_Z21polybench_timer_startv.exit, label %34

34:                                               ; preds = %_Z4initiiPA4096_f.exit
  %35 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %33) #2
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z4initiiPA4096_f.exit, %34
  %36 = load i64, ptr %4, align 8
  %37 = sitofp i64 %36 to double
  %38 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %39 = load i64, ptr %38, align 8
  %40 = sitofp i64 %39 to double
  %41 = fmul nnan double %40, f0x3EB0C6F7A0B5ED8D
  %42 = fadd double %41, %37
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %42, ptr @polybench_t_start, align 8
  %scevgep = getelementptr i8, ptr %15, i64 16388
  %scevgep41 = getelementptr i8, ptr %15, i64 67092476
  %scevgep42 = getelementptr i8, ptr %10, i64 67108864
  %bound0 = icmp ult ptr %scevgep, %scevgep42
  %bound1 = icmp ult ptr %10, %scevgep41
  %found.conflict = and i1 %bound0, %bound1
  br label %.preheader.i28

.preheader.i28:                                   ; preds = %._crit_edge.i32, %_Z21polybench_timer_startv.exit
  %indvars.iv49.i = phi i64 [ 1, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next50.i, %._crit_edge.i32 ]
  %43 = getelementptr [16384 x i8], ptr %10, i64 %indvars.iv49.i
  %44 = getelementptr i8, ptr %43, i64 -16384
  %45 = getelementptr i8, ptr %43, i64 16384
  %46 = getelementptr [16384 x i8], ptr %15, i64 %indvars.iv49.i
  br i1 %found.conflict, label %scalar.ph.preheader, label %vector.body

vector.body:                                      ; preds = %.preheader.i28, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader.i28 ]
  %47 = or disjoint i64 %index, 1
  %48 = getelementptr [4 x i8], ptr %44, i64 %index
  %wide.load = load <4 x float>, ptr %48, align 4, !alias.scope !13
  %49 = fmul <4 x float> %wide.load, splat (float 2.000000e-01)
  %50 = getelementptr [4 x i8], ptr %43, i64 %index
  %wide.load43 = load <4 x float>, ptr %50, align 4, !alias.scope !13
  %51 = fmul <4 x float> %wide.load43, splat (float 3.000000e-01)
  %52 = fsub <4 x float> %49, %51
  %53 = getelementptr [4 x i8], ptr %45, i64 %index
  %wide.load44 = load <4 x float>, ptr %53, align 4, !alias.scope !13
  %54 = fmul <4 x float> %wide.load44, splat (float 4.000000e-01)
  %55 = fadd <4 x float> %52, %54
  %56 = getelementptr [4 x i8], ptr %44, i64 %47
  %wide.load45 = load <4 x float>, ptr %56, align 4, !alias.scope !13
  %57 = fmul <4 x float> %wide.load45, splat (float 5.000000e-01)
  %58 = fadd <4 x float> %55, %57
  %59 = getelementptr [4 x i8], ptr %43, i64 %47
  %wide.load46 = load <4 x float>, ptr %59, align 4, !alias.scope !13
  %60 = fmul <4 x float> %wide.load46, splat (float 6.000000e-01)
  %61 = fadd <4 x float> %58, %60
  %62 = getelementptr [4 x i8], ptr %45, i64 %47
  %wide.load47 = load <4 x float>, ptr %62, align 4, !alias.scope !13
  %63 = fmul <4 x float> %wide.load47, splat (float f0x3F333333)
  %64 = fadd <4 x float> %61, %63
  %65 = or disjoint i64 %index, 2
  %66 = getelementptr [4 x i8], ptr %44, i64 %65
  %wide.load48 = load <4 x float>, ptr %66, align 4, !alias.scope !13
  %67 = fmul <4 x float> %wide.load48, splat (float 8.000000e-01)
  %68 = fsub <4 x float> %64, %67
  %69 = getelementptr [4 x i8], ptr %43, i64 %65
  %wide.load49 = load <4 x float>, ptr %69, align 4, !alias.scope !13
  %70 = fmul <4 x float> %wide.load49, splat (float f0x3F666666)
  %71 = fsub <4 x float> %68, %70
  %72 = getelementptr [4 x i8], ptr %45, i64 %65
  %wide.load50 = load <4 x float>, ptr %72, align 4, !alias.scope !13
  %73 = fmul <4 x float> %wide.load50, splat (float 1.000000e-01)
  %74 = fadd <4 x float> %71, %73
  %75 = getelementptr [4 x i8], ptr %46, i64 %47
  store <4 x float> %74, ptr %75, align 4, !alias.scope !16, !noalias !13
  %index.next = add nuw i64 %index, 4
  %76 = icmp eq i64 %index.next, 4092
  br i1 %76, label %scalar.ph.preheader, label %vector.body, !llvm.loop !18

scalar.ph.preheader:                              ; preds = %vector.body, %.preheader.i28
  %indvars.iv.i29.ph = phi i64 [ 1, %.preheader.i28 ], [ 4093, %vector.body ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv.i29 = phi i64 [ %indvars.iv.next.i30, %scalar.ph ], [ %indvars.iv.i29.ph, %scalar.ph.preheader ]
  %77 = add nsw i64 %indvars.iv.i29, -1
  %78 = getelementptr [4 x i8], ptr %44, i64 %77
  %79 = load float, ptr %78, align 4
  %80 = fmul float %79, 2.000000e-01
  %81 = getelementptr [4 x i8], ptr %43, i64 %77
  %82 = load float, ptr %81, align 4
  %83 = fmul float %82, 3.000000e-01
  %84 = fsub float %80, %83
  %85 = getelementptr [4 x i8], ptr %45, i64 %77
  %86 = load float, ptr %85, align 4
  %87 = fmul float %86, 4.000000e-01
  %88 = fadd float %84, %87
  %89 = getelementptr [4 x i8], ptr %44, i64 %indvars.iv.i29
  %90 = load float, ptr %89, align 4
  %91 = fmul float %90, 5.000000e-01
  %92 = fadd float %88, %91
  %93 = getelementptr [4 x i8], ptr %43, i64 %indvars.iv.i29
  %94 = load float, ptr %93, align 4
  %95 = fmul float %94, 6.000000e-01
  %96 = fadd float %92, %95
  %97 = getelementptr [4 x i8], ptr %45, i64 %indvars.iv.i29
  %98 = load float, ptr %97, align 4
  %99 = fmul float %98, f0x3F333333
  %100 = fadd float %96, %99
  %indvars.iv.next.i30 = add nuw nsw i64 %indvars.iv.i29, 1
  %101 = getelementptr [4 x i8], ptr %44, i64 %indvars.iv.next.i30
  %102 = load float, ptr %101, align 4
  %103 = fmul float %102, 8.000000e-01
  %104 = fsub float %100, %103
  %105 = getelementptr [4 x i8], ptr %43, i64 %indvars.iv.next.i30
  %106 = load float, ptr %105, align 4
  %107 = fmul float %106, f0x3F666666
  %108 = fsub float %104, %107
  %109 = getelementptr [4 x i8], ptr %45, i64 %indvars.iv.next.i30
  %110 = load float, ptr %109, align 4
  %111 = fmul float %110, 1.000000e-01
  %112 = fadd float %108, %111
  %113 = getelementptr [4 x i8], ptr %46, i64 %indvars.iv.i29
  store float %112, ptr %113, align 4
  %exitcond.not.i31 = icmp eq i64 %indvars.iv.next.i30, 4095
  br i1 %exitcond.not.i31, label %._crit_edge.i32, label %scalar.ph, !llvm.loop !19

._crit_edge.i32:                                  ; preds = %scalar.ph
  %indvars.iv.next50.i = add nuw nsw i64 %indvars.iv49.i, 1
  %exitcond53.not.i = icmp eq i64 %indvars.iv.next50.i, 4095
  br i1 %exitcond53.not.i, label %_Z6conv2DiiPA4096_fS0_.exit, label %.preheader.i28

_Z6conv2DiiPA4096_fS0_.exit:                      ; preds = %._crit_edge.i32
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %114 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #13
  %.not.i.i33 = icmp eq i32 %114, 0
  br i1 %.not.i.i33, label %_Z20polybench_timer_stopv.exit, label %115

115:                                              ; preds = %_Z6conv2DiiPA4096_fS0_.exit
  %116 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %114) #2
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z6conv2DiiPA4096_fS0_.exit, %115
  %117 = load i64, ptr %3, align 8
  %118 = sitofp i64 %117 to double
  %119 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %120 = load i64, ptr %119, align 8
  %121 = sitofp i64 %120 to double
  %122 = fmul nnan double %121, f0x3EB0C6F7A0B5ED8D
  %123 = fadd double %122, %118
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %123, ptr @polybench_t_end, align 8
  %124 = load double, ptr @polybench_t_start, align 8
  %125 = fsub double %123, %124
  %126 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %125) #2
  br label %.preheader.us.i

.preheader.us.i:                                  ; preds = %_Z11percentDiffdd.exit.us.i.1, %_Z20polybench_timer_stopv.exit
  %indvars.iv23.i = phi i64 [ 1, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next24.i, %_Z11percentDiffdd.exit.us.i.1 ]
  %.018.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %.2.us.i.1, %_Z11percentDiffdd.exit.us.i.1 ]
  %127 = getelementptr [16384 x i8], ptr %15, i64 %indvars.iv23.i
  %128 = getelementptr [16384 x i8], ptr %20, i64 %indvars.iv23.i
  %129 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.018.us.i, i64 0
  br label %vector.body53

vector.body53:                                    ; preds = %vector.body53, %.preheader.us.i
  %index54 = phi i64 [ 0, %.preheader.us.i ], [ %index.next57, %vector.body53 ]
  %vec.phi = phi <4 x i32> [ %129, %.preheader.us.i ], [ %162, %vector.body53 ]
  %130 = or disjoint i64 %index54, 1
  %131 = getelementptr [4 x i8], ptr %127, i64 %130
  %wide.load55 = load <4 x float>, ptr %131, align 4
  %132 = fpext <4 x float> %wide.load55 to <4 x double>
  %133 = getelementptr [4 x i8], ptr %128, i64 %130
  %wide.load56 = load <4 x float>, ptr %133, align 4
  %134 = fpext <4 x float> %wide.load56 to <4 x double>
  %135 = fcmp olt <4 x double> %132, splat (double f0xB690000000000000)
  %136 = fneg <4 x float> %wide.load55
  %137 = select <4 x i1> %135, <4 x float> %136, <4 x float> %wide.load55
  %138 = fpext <4 x float> %137 to <4 x double>
  %139 = fcmp uge <4 x double> %138, splat (double 1.000000e-02)
  %140 = fcmp olt <4 x double> %134, splat (double f0xB690000000000000)
  %141 = fneg <4 x float> %wide.load56
  %142 = select <4 x i1> %140, <4 x float> %141, <4 x float> %wide.load56
  %143 = fpext <4 x float> %142 to <4 x double>
  %144 = fcmp uge <4 x double> %143, splat (double 1.000000e-02)
  %145 = fsub <4 x double> %132, %134
  %146 = fptrunc <4 x double> %145 to <4 x float>
  %147 = fcmp olt <4 x double> %145, splat (double f0xB690000000000000)
  %148 = fneg <4 x float> %146
  %149 = select <4 x i1> %147, <4 x float> %148, <4 x float> %146
  %150 = fadd <4 x double> %132, splat (double f0x3E45798EE0000000)
  %151 = fptrunc <4 x double> %150 to <4 x float>
  %152 = fcmp olt <4 x double> %150, splat (double f0xB690000000000000)
  %153 = fneg <4 x float> %151
  %154 = select <4 x i1> %152, <4 x float> %153, <4 x float> %151
  %155 = fdiv <4 x float> %149, %154
  %156 = fcmp olt <4 x float> %155, zeroinitializer
  %157 = fneg <4 x float> %155
  %158 = select <4 x i1> %156, <4 x float> %157, <4 x float> %155
  %159 = fmul <4 x float> %158, splat (float 1.000000e+02)
  %160 = fpext <4 x float> %159 to <4 x double>
  %161 = fcmp ogt <4 x double> %160, splat (double 5.000000e-02)
  %.not60 = select <4 x i1> %139, <4 x i1> splat (i1 true), <4 x i1> %144
  %narrow = select <4 x i1> %.not60, <4 x i1> %161, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %162 = add <4 x i32> %vec.phi, %predphi
  %index.next57 = add nuw i64 %index54, 4
  %163 = icmp eq i64 %index.next57, 4092
  br i1 %163, label %scalar.ph51, label %vector.body53, !llvm.loop !20

scalar.ph51:                                      ; preds = %vector.body53
  %164 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %162)
  %165 = getelementptr i8, ptr %127, i64 16372
  %166 = load float, ptr %165, align 4
  %167 = fpext float %166 to double
  %168 = getelementptr i8, ptr %128, i64 16372
  %169 = load float, ptr %168, align 4
  %170 = fpext float %169 to double
  %171 = fcmp olt double %167, f0xB690000000000000
  %172 = fneg float %166
  %common.ret.op.i.i.us.i = select i1 %171, float %172, float %166
  %173 = fpext float %common.ret.op.i.i.us.i to double
  %174 = fcmp olt double %173, 1.000000e-02
  br i1 %174, label %175, label %.critedge.i.us.i

175:                                              ; preds = %scalar.ph51
  %176 = fcmp olt double %170, f0xB690000000000000
  %177 = fneg float %169
  %common.ret.op.i7.i.us.i = select i1 %176, float %177, float %169
  %178 = fpext float %common.ret.op.i7.i.us.i to double
  %179 = fcmp olt double %178, 1.000000e-02
  br i1 %179, label %_Z11percentDiffdd.exit.us.i, label %.critedge.i.us.i

.critedge.i.us.i:                                 ; preds = %175, %scalar.ph51
  %180 = insertelement <2 x double> poison, double %167, i64 0
  %181 = shufflevector <2 x double> %180, <2 x double> poison, <2 x i32> zeroinitializer
  %182 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %170, i64 0
  %183 = fsub <2 x double> %181, %182
  %184 = fptrunc <2 x double> %183 to <2 x float>
  %185 = fcmp olt <2 x double> %183, splat (double f0xB690000000000000)
  %186 = fneg <2 x float> %184
  %187 = select <2 x i1> %185, <2 x float> %186, <2 x float> %184
  %188 = extractelement <2 x float> %187, i64 0
  %189 = extractelement <2 x float> %187, i64 1
  %190 = fdiv float %188, %189
  %191 = fcmp olt float %190, 0.000000e+00
  %192 = fneg float %190
  %common.ret.op.i10.i.us.i = select i1 %191, float %192, float %190
  %193 = fmul float %common.ret.op.i10.i.us.i, 1.000000e+02
  %194 = fpext float %193 to double
  %195 = fcmp ogt double %194, 5.000000e-02
  %196 = zext i1 %195 to i32
  br label %_Z11percentDiffdd.exit.us.i

_Z11percentDiffdd.exit.us.i:                      ; preds = %.critedge.i.us.i, %175
  %common.ret.op.i.us.i = phi i32 [ %196, %.critedge.i.us.i ], [ 0, %175 ]
  %.2.us.i = add nsw i32 %common.ret.op.i.us.i, %164
  %197 = getelementptr i8, ptr %127, i64 16376
  %198 = load float, ptr %197, align 4
  %199 = fpext float %198 to double
  %200 = getelementptr i8, ptr %128, i64 16376
  %201 = load float, ptr %200, align 4
  %202 = fpext float %201 to double
  %203 = fcmp olt double %199, f0xB690000000000000
  %204 = fneg float %198
  %common.ret.op.i.i.us.i.1 = select i1 %203, float %204, float %198
  %205 = fpext float %common.ret.op.i.i.us.i.1 to double
  %206 = fcmp olt double %205, 1.000000e-02
  br i1 %206, label %207, label %.critedge.i.us.i.1

207:                                              ; preds = %_Z11percentDiffdd.exit.us.i
  %208 = fcmp olt double %202, f0xB690000000000000
  %209 = fneg float %201
  %common.ret.op.i7.i.us.i.1 = select i1 %208, float %209, float %201
  %210 = fpext float %common.ret.op.i7.i.us.i.1 to double
  %211 = fcmp olt double %210, 1.000000e-02
  br i1 %211, label %_Z11percentDiffdd.exit.us.i.1, label %.critedge.i.us.i.1

.critedge.i.us.i.1:                               ; preds = %207, %_Z11percentDiffdd.exit.us.i
  %212 = insertelement <2 x double> poison, double %199, i64 0
  %213 = shufflevector <2 x double> %212, <2 x double> poison, <2 x i32> zeroinitializer
  %214 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %202, i64 0
  %215 = fsub <2 x double> %213, %214
  %216 = fptrunc <2 x double> %215 to <2 x float>
  %217 = fcmp olt <2 x double> %215, splat (double f0xB690000000000000)
  %218 = fneg <2 x float> %216
  %219 = select <2 x i1> %217, <2 x float> %218, <2 x float> %216
  %220 = extractelement <2 x float> %219, i64 0
  %221 = extractelement <2 x float> %219, i64 1
  %222 = fdiv float %220, %221
  %223 = fcmp olt float %222, 0.000000e+00
  %224 = fneg float %222
  %common.ret.op.i10.i.us.i.1 = select i1 %223, float %224, float %222
  %225 = fmul float %common.ret.op.i10.i.us.i.1, 1.000000e+02
  %226 = fpext float %225 to double
  %227 = fcmp ogt double %226, 5.000000e-02
  %228 = zext i1 %227 to i32
  br label %_Z11percentDiffdd.exit.us.i.1

_Z11percentDiffdd.exit.us.i.1:                    ; preds = %.critedge.i.us.i.1, %207
  %common.ret.op.i.us.i.1 = phi i32 [ %228, %.critedge.i.us.i.1 ], [ 0, %207 ]
  %.2.us.i.1 = add nsw i32 %common.ret.op.i.us.i.1, %.2.us.i
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1
  %exitcond27.not.i = icmp eq i64 %indvars.iv.next24.i, 4095
  br i1 %exitcond27.not.i, label %_Z14compareResultsiiPA4096_fS0_.exit, label %.preheader.us.i

_Z14compareResultsiiPA4096_fS0_.exit:             ; preds = %_Z11percentDiffdd.exit.us.i.1
  %229 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %.2.us.i.1) #2
  call void @free(ptr noundef %10) #13
  call void @free(ptr noundef nonnull %15) #13
  call void @free(ptr noundef nonnull %20) #13
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @_Z21polybench_flush_cachev() local_unnamed_addr #0 {
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local void @_Z29polybench_prepare_instrumentsv() local_unnamed_addr #0 {
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #10

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #10

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #11

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #11

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #12

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { "uniform-work-group-size" }
attributes #3 = { nounwind "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #4 = { nofree nounwind "uniform-work-group-size" }
attributes #5 = { nofree nounwind "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #6 = { "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #7 = { nofree "uniform-work-group-size" }
attributes #8 = { nofree noreturn "uniform-work-group-size" }
attributes #9 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "uniform-work-group-size" }
attributes #10 = { nofree nounwind }
attributes #11 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #12 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #13 = { nounwind "uniform-work-group-size" }
attributes #14 = { cold }
attributes #15 = { cold noreturn nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.isvectorized", i32 1}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7, !8}
!11 = distinct !{!11, !8, !7}
!12 = !{ptr @_Z35__device_stub__convolution2D_kerneliiPfS_}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !7, !8}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7, !8}
