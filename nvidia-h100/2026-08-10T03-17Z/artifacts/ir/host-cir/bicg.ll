; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/BICG/bicg.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/BICG/bicg.cu"
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

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: write)
define dso_local void @_Z10init_arrayiiPA4096_fPfS1_(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) %2, ptr nofree noundef writeonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4) local_unnamed_addr #1 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.lr.ph.preheader, label %.preheader.thread

.lr.ph.preheader:                                 ; preds = %5
  %wide.trip.count = zext nneg i32 %1 to i64
  %min.iters.check48 = icmp ult i32 %1, 4
  br i1 %min.iters.check48, label %.lr.ph.preheader73, label %vector.ph49

vector.ph49:                                      ; preds = %.lr.ph.preheader
  %n.vec51 = and i64 %wide.trip.count, 2147483644
  br label %vector.body52

vector.body52:                                    ; preds = %vector.body52, %vector.ph49
  %index53 = phi i64 [ 0, %vector.ph49 ], [ %index.next55, %vector.body52 ]
  %vec.ind54 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph49 ], [ %vec.ind.next56, %vector.body52 ]
  %7 = uitofp nneg <4 x i32> %vec.ind54 to <4 x double>
  %8 = fmul nnan <4 x double> %7, splat (double f0x400921FB54442D18)
  %9 = fptrunc <4 x double> %8 to <4 x float>
  %10 = getelementptr [4 x i8], ptr %3, i64 %index53
  store <4 x float> %9, ptr %10, align 4
  %index.next55 = add nuw i64 %index53, 4
  %vec.ind.next56 = add <4 x i32> %vec.ind54, splat (i32 4)
  %11 = icmp eq i64 %index.next55, %n.vec51
  br i1 %11, label %middle.block57, label %vector.body52, !llvm.loop !1

middle.block57:                                   ; preds = %vector.body52
  %cmp.n58 = icmp eq i64 %n.vec51, %wide.trip.count
  br i1 %cmp.n58, label %.preheader, label %.lr.ph.preheader73

.lr.ph.preheader73:                               ; preds = %.lr.ph.preheader, %middle.block57
  %indvars.iv.ph = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec51, %middle.block57 ]
  br label %.lr.ph

.preheader:                                       ; preds = %.lr.ph, %middle.block57
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.lr.ph23.us.preheader, label %._crit_edge26

.preheader.thread:                                ; preds = %5
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.lr.ph25.split.preheader, label %._crit_edge26

.lr.ph25.split.preheader:                         ; preds = %.preheader.thread
  %wide.trip.count32 = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  br i1 %min.iters.check, label %.lr.ph25.split.preheader74, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph25.split.preheader
  %n.vec = and i64 %wide.trip.count32, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %14 = uitofp nneg <4 x i32> %vec.ind to <4 x double>
  %15 = fmul nnan <4 x double> %14, splat (double f0x400921FB54442D18)
  %16 = fptrunc <4 x double> %15 to <4 x float>
  %17 = getelementptr [4 x i8], ptr %4, i64 %index
  store <4 x float> %16, ptr %17, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %18 = icmp eq i64 %index.next, %n.vec
  br i1 %18, label %middle.block, label %vector.body, !llvm.loop !4

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count32
  br i1 %cmp.n, label %._crit_edge26, label %.lr.ph25.split.preheader74

.lr.ph25.split.preheader74:                       ; preds = %.lr.ph25.split.preheader, %middle.block
  %indvars.iv29.ph = phi i64 [ 0, %.lr.ph25.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph25.split

.lr.ph23.us.preheader:                            ; preds = %.preheader
  %wide.trip.count42 = zext nneg i32 %0 to i64
  %wide.trip.count37 = zext nneg i32 %1 to i64
  %min.iters.check61 = icmp ult i32 %1, 8
  %n.vec64 = and i64 %wide.trip.count, 2147483640
  %cmp.n71 = icmp eq i64 %n.vec64, %wide.trip.count
  br label %.lr.ph23.us

.lr.ph23.us:                                      ; preds = %.lr.ph23.us.preheader, %._crit_edge.us
  %indvars.iv39 = phi i64 [ 0, %.lr.ph23.us.preheader ], [ %indvars.iv.next40, %._crit_edge.us ]
  %19 = trunc nuw nsw i64 %indvars.iv39 to i32
  %20 = uitofp nneg i32 %19 to double
  %21 = fmul nnan double %20, f0x400921FB54442D18
  %22 = fptrunc double %21 to float
  %23 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv39
  store float %22, ptr %23, align 4
  %24 = uitofp nneg i32 %19 to float
  %25 = getelementptr [16384 x i8], ptr %2, i64 %indvars.iv39
  br i1 %min.iters.check61, label %scalar.ph60.preheader, label %vector.ph62

vector.ph62:                                      ; preds = %.lr.ph23.us
  %broadcast.splatinsert = insertelement <4 x float> poison, float %24, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body65

vector.body65:                                    ; preds = %vector.body65, %vector.ph62
  %index66 = phi i64 [ 0, %vector.ph62 ], [ %index.next68, %vector.body65 ]
  %vec.ind67 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph62 ], [ %vec.ind.next69, %vector.body65 ]
  %step.add = add <4 x i32> %vec.ind67, splat (i32 4)
  %26 = uitofp nneg <4 x i32> %vec.ind67 to <4 x float>
  %27 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %28 = fmul nnan <4 x float> %broadcast.splat, %26
  %29 = fmul nnan <4 x float> %broadcast.splat, %27
  %30 = fmul nnan <4 x float> %28, splat (float f0x39800000)
  %31 = fmul nnan <4 x float> %29, splat (float f0x39800000)
  %32 = getelementptr [4 x i8], ptr %25, i64 %index66
  %33 = getelementptr i8, ptr %32, i64 16
  store <4 x float> %30, ptr %32, align 4
  store <4 x float> %31, ptr %33, align 4
  %index.next68 = add nuw i64 %index66, 8
  %vec.ind.next69 = add <4 x i32> %vec.ind67, splat (i32 8)
  %34 = icmp eq i64 %index.next68, %n.vec64
  br i1 %34, label %middle.block70, label %vector.body65, !llvm.loop !5

middle.block70:                                   ; preds = %vector.body65
  br i1 %cmp.n71, label %._crit_edge.us, label %scalar.ph60.preheader

scalar.ph60.preheader:                            ; preds = %.lr.ph23.us, %middle.block70
  %indvars.iv34.ph = phi i64 [ 0, %.lr.ph23.us ], [ %n.vec64, %middle.block70 ]
  br label %scalar.ph60

scalar.ph60:                                      ; preds = %scalar.ph60.preheader, %scalar.ph60
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %scalar.ph60 ], [ %indvars.iv34.ph, %scalar.ph60.preheader ]
  %35 = trunc nuw nsw i64 %indvars.iv34 to i32
  %36 = uitofp nneg i32 %35 to float
  %37 = fmul nnan float %24, %36
  %38 = fmul nnan float %37, f0x39800000
  %39 = getelementptr [4 x i8], ptr %25, i64 %indvars.iv34
  store float %38, ptr %39, align 4
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %._crit_edge.us, label %scalar.ph60, !llvm.loop !6

._crit_edge.us:                                   ; preds = %scalar.ph60, %middle.block70
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond43.not = icmp eq i64 %indvars.iv.next40, %wide.trip.count42
  br i1 %exitcond43.not, label %._crit_edge26, label %.lr.ph23.us

.lr.ph:                                           ; preds = %.lr.ph.preheader73, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %indvars.iv.ph, %.lr.ph.preheader73 ]
  %40 = trunc nuw nsw i64 %indvars.iv to i32
  %41 = uitofp nneg i32 %40 to double
  %42 = fmul nnan double %41, f0x400921FB54442D18
  %43 = fptrunc double %42 to float
  %44 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv
  store float %43, ptr %44, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %.preheader, label %.lr.ph, !llvm.loop !7

.lr.ph25.split:                                   ; preds = %.lr.ph25.split.preheader74, %.lr.ph25.split
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %.lr.ph25.split ], [ %indvars.iv29.ph, %.lr.ph25.split.preheader74 ]
  %45 = trunc nuw nsw i64 %indvars.iv29 to i32
  %46 = uitofp nneg i32 %45 to double
  %47 = fmul nnan double %46, f0x400921FB54442D18
  %48 = fptrunc double %47 to float
  %49 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv29
  store float %48, ptr %49, align 4
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond33.not = icmp eq i64 %indvars.iv.next30, %wide.trip.count32
  br i1 %exitcond33.not, label %._crit_edge26, label %.lr.ph25.split, !llvm.loop !8

._crit_edge26:                                    ; preds = %.lr.ph25.split, %._crit_edge.us, %middle.block, %.preheader.thread, %.preheader
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiiPfS_S_S_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef readonly captures(none) %5) local_unnamed_addr #3 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %.preheader

.lr.ph.preheader:                                 ; preds = %6
  %wide.trip.count = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  br i1 %min.iters.check, label %.lr.ph.preheader58, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.preheader
  %n.vec = and i64 %wide.trip.count, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %39, %vector.body ]
  %8 = getelementptr [4 x i8], ptr %4, i64 %index
  %wide.load = load <4 x float>, ptr %8, align 4
  %9 = fpext <4 x float> %wide.load to <4 x double>
  %10 = getelementptr [4 x i8], ptr %5, i64 %index
  %wide.load39 = load <4 x float>, ptr %10, align 4
  %11 = fpext <4 x float> %wide.load39 to <4 x double>
  %12 = fcmp olt <4 x double> %9, splat (double f0xB690000000000000)
  %13 = fneg <4 x float> %wide.load
  %14 = select <4 x i1> %12, <4 x float> %13, <4 x float> %wide.load
  %15 = fpext <4 x float> %14 to <4 x double>
  %16 = fcmp uge <4 x double> %15, splat (double 1.000000e-02)
  %17 = fcmp olt <4 x double> %11, splat (double f0xB690000000000000)
  %18 = fneg <4 x float> %wide.load39
  %19 = select <4 x i1> %17, <4 x float> %18, <4 x float> %wide.load39
  %20 = fpext <4 x float> %19 to <4 x double>
  %21 = fcmp uge <4 x double> %20, splat (double 1.000000e-02)
  %22 = select <4 x i1> %16, <4 x i1> splat (i1 true), <4 x i1> %21
  %23 = fsub <4 x double> %9, %11
  %24 = fptrunc <4 x double> %23 to <4 x float>
  %25 = fcmp olt <4 x double> %23, splat (double f0xB690000000000000)
  %26 = fneg <4 x float> %24
  %27 = select <4 x i1> %25, <4 x float> %26, <4 x float> %24
  %28 = fadd <4 x double> %9, splat (double f0x3E45798EE0000000)
  %29 = fptrunc <4 x double> %28 to <4 x float>
  %30 = fcmp olt <4 x double> %28, splat (double f0xB690000000000000)
  %31 = fneg <4 x float> %29
  %32 = select <4 x i1> %30, <4 x float> %31, <4 x float> %29
  %33 = fdiv <4 x float> %27, %32
  %34 = fcmp olt <4 x float> %33, zeroinitializer
  %35 = fneg <4 x float> %33
  %36 = select <4 x i1> %34, <4 x float> %35, <4 x float> %33
  %37 = fmul <4 x float> %36, splat (float 1.000000e+02)
  %38 = fcmp ogt <4 x float> %37, splat (float 5.000000e-01)
  %narrow = select <4 x i1> %22, <4 x i1> %38, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %39 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %40 = icmp eq i64 %index.next, %n.vec
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %41 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %39)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %.preheader, label %.lr.ph.preheader58

.lr.ph.preheader58:                               ; preds = %.lr.ph.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %middle.block ]
  %.027.ph = phi i32 [ 0, %.lr.ph.preheader ], [ %41, %middle.block ]
  br label %.lr.ph

.preheader:                                       ; preds = %_Z11percentDiffdd.exit, %middle.block, %6
  %.0.lcssa = phi i32 [ 0, %6 ], [ %41, %middle.block ], [ %.1, %_Z11percentDiffdd.exit ]
  %42 = icmp sgt i32 %1, 0
  br i1 %42, label %.lr.ph30.preheader, label %._crit_edge

.lr.ph30.preheader:                               ; preds = %.preheader
  %wide.trip.count36 = zext nneg i32 %1 to i64
  %min.iters.check41 = icmp ult i32 %1, 4
  br i1 %min.iters.check41, label %.lr.ph30.preheader57, label %vector.ph42

vector.ph42:                                      ; preds = %.lr.ph30.preheader
  %n.vec44 = and i64 %wide.trip.count36, 2147483644
  %43 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.0.lcssa, i64 0
  br label %vector.body45

vector.body45:                                    ; preds = %vector.body45, %vector.ph42
  %index46 = phi i64 [ 0, %vector.ph42 ], [ %index.next51, %vector.body45 ]
  %vec.phi47 = phi <4 x i32> [ %43, %vector.ph42 ], [ %75, %vector.body45 ]
  %44 = getelementptr [4 x i8], ptr %2, i64 %index46
  %wide.load48 = load <4 x float>, ptr %44, align 4
  %45 = fpext <4 x float> %wide.load48 to <4 x double>
  %46 = getelementptr [4 x i8], ptr %3, i64 %index46
  %wide.load49 = load <4 x float>, ptr %46, align 4
  %47 = fpext <4 x float> %wide.load49 to <4 x double>
  %48 = fcmp olt <4 x double> %45, splat (double f0xB690000000000000)
  %49 = fneg <4 x float> %wide.load48
  %50 = select <4 x i1> %48, <4 x float> %49, <4 x float> %wide.load48
  %51 = fpext <4 x float> %50 to <4 x double>
  %52 = fcmp uge <4 x double> %51, splat (double 1.000000e-02)
  %53 = fcmp olt <4 x double> %47, splat (double f0xB690000000000000)
  %54 = fneg <4 x float> %wide.load49
  %55 = select <4 x i1> %53, <4 x float> %54, <4 x float> %wide.load49
  %56 = fpext <4 x float> %55 to <4 x double>
  %57 = fcmp uge <4 x double> %56, splat (double 1.000000e-02)
  %58 = select <4 x i1> %52, <4 x i1> splat (i1 true), <4 x i1> %57
  %59 = fsub <4 x double> %45, %47
  %60 = fptrunc <4 x double> %59 to <4 x float>
  %61 = fcmp olt <4 x double> %59, splat (double f0xB690000000000000)
  %62 = fneg <4 x float> %60
  %63 = select <4 x i1> %61, <4 x float> %62, <4 x float> %60
  %64 = fadd <4 x double> %45, splat (double f0x3E45798EE0000000)
  %65 = fptrunc <4 x double> %64 to <4 x float>
  %66 = fcmp olt <4 x double> %64, splat (double f0xB690000000000000)
  %67 = fneg <4 x float> %65
  %68 = select <4 x i1> %66, <4 x float> %67, <4 x float> %65
  %69 = fdiv <4 x float> %63, %68
  %70 = fcmp olt <4 x float> %69, zeroinitializer
  %71 = fneg <4 x float> %69
  %72 = select <4 x i1> %70, <4 x float> %71, <4 x float> %69
  %73 = fmul <4 x float> %72, splat (float 1.000000e+02)
  %74 = fcmp ogt <4 x float> %73, splat (float 5.000000e-01)
  %narrow56 = select <4 x i1> %58, <4 x i1> %74, <4 x i1> zeroinitializer
  %predphi50 = zext <4 x i1> %narrow56 to <4 x i32>
  %75 = add <4 x i32> %vec.phi47, %predphi50
  %index.next51 = add nuw i64 %index46, 4
  %76 = icmp eq i64 %index.next51, %n.vec44
  br i1 %76, label %middle.block52, label %vector.body45, !llvm.loop !10

middle.block52:                                   ; preds = %vector.body45
  %77 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %75)
  %cmp.n53 = icmp eq i64 %n.vec44, %wide.trip.count36
  br i1 %cmp.n53, label %._crit_edge, label %.lr.ph30.preheader57

.lr.ph30.preheader57:                             ; preds = %.lr.ph30.preheader, %middle.block52
  %indvars.iv33.ph = phi i64 [ 0, %.lr.ph30.preheader ], [ %n.vec44, %middle.block52 ]
  %.229.ph = phi i32 [ %.0.lcssa, %.lr.ph30.preheader ], [ %77, %middle.block52 ]
  br label %.lr.ph30

.lr.ph:                                           ; preds = %.lr.ph.preheader58, %_Z11percentDiffdd.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit ], [ %indvars.iv.ph, %.lr.ph.preheader58 ]
  %.027 = phi i32 [ %.1, %_Z11percentDiffdd.exit ], [ %.027.ph, %.lr.ph.preheader58 ]
  %78 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv
  %79 = load float, ptr %78, align 4
  %80 = fpext float %79 to double
  %81 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv
  %82 = load float, ptr %81, align 4
  %83 = fpext float %82 to double
  %84 = fcmp olt double %80, f0xB690000000000000
  %85 = fneg float %79
  %common.ret.op.i.i = select i1 %84, float %85, float %79
  %86 = fpext float %common.ret.op.i.i to double
  %87 = fcmp olt double %86, 1.000000e-02
  br i1 %87, label %88, label %.critedge.i

88:                                               ; preds = %.lr.ph
  %89 = fcmp olt double %83, f0xB690000000000000
  %90 = fneg float %82
  %common.ret.op.i7.i = select i1 %89, float %90, float %82
  %91 = fpext float %common.ret.op.i7.i to double
  %92 = fcmp olt double %91, 1.000000e-02
  br i1 %92, label %_Z11percentDiffdd.exit, label %.critedge.i

.critedge.i:                                      ; preds = %88, %.lr.ph
  %93 = insertelement <2 x double> poison, double %80, i64 0
  %94 = shufflevector <2 x double> %93, <2 x double> poison, <2 x i32> zeroinitializer
  %95 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %83, i64 0
  %96 = fsub <2 x double> %94, %95
  %97 = fptrunc <2 x double> %96 to <2 x float>
  %98 = fcmp olt <2 x double> %96, splat (double f0xB690000000000000)
  %99 = fneg <2 x float> %97
  %100 = select <2 x i1> %98, <2 x float> %99, <2 x float> %97
  %101 = extractelement <2 x float> %100, i64 0
  %102 = extractelement <2 x float> %100, i64 1
  %103 = fdiv float %101, %102
  %104 = fcmp olt float %103, 0.000000e+00
  %105 = fneg float %103
  %common.ret.op.i10.i = select i1 %104, float %105, float %103
  %106 = fmul float %common.ret.op.i10.i, 1.000000e+02
  %107 = fcmp ogt float %106, 5.000000e-01
  %108 = zext i1 %107 to i32
  br label %_Z11percentDiffdd.exit

_Z11percentDiffdd.exit:                           ; preds = %88, %.critedge.i
  %common.ret.op.i = phi i32 [ %108, %.critedge.i ], [ 0, %88 ]
  %.1 = add nuw nsw i32 %common.ret.op.i, %.027
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %.preheader, label %.lr.ph, !llvm.loop !11

.lr.ph30:                                         ; preds = %.lr.ph30.preheader57, %_Z11percentDiffdd.exit25
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %_Z11percentDiffdd.exit25 ], [ %indvars.iv33.ph, %.lr.ph30.preheader57 ]
  %.229 = phi i32 [ %.3, %_Z11percentDiffdd.exit25 ], [ %.229.ph, %.lr.ph30.preheader57 ]
  %109 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv33
  %110 = load float, ptr %109, align 4
  %111 = fpext float %110 to double
  %112 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv33
  %113 = load float, ptr %112, align 4
  %114 = fpext float %113 to double
  %115 = fcmp olt double %111, f0xB690000000000000
  %116 = fneg float %110
  %common.ret.op.i.i18 = select i1 %115, float %116, float %110
  %117 = fpext float %common.ret.op.i.i18 to double
  %118 = fcmp olt double %117, 1.000000e-02
  br i1 %118, label %119, label %.critedge.i19

119:                                              ; preds = %.lr.ph30
  %120 = fcmp olt double %114, f0xB690000000000000
  %121 = fneg float %113
  %common.ret.op.i7.i24 = select i1 %120, float %121, float %113
  %122 = fpext float %common.ret.op.i7.i24 to double
  %123 = fcmp olt double %122, 1.000000e-02
  br i1 %123, label %_Z11percentDiffdd.exit25, label %.critedge.i19

.critedge.i19:                                    ; preds = %119, %.lr.ph30
  %124 = insertelement <2 x double> poison, double %111, i64 0
  %125 = shufflevector <2 x double> %124, <2 x double> poison, <2 x i32> zeroinitializer
  %126 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %114, i64 0
  %127 = fsub <2 x double> %125, %126
  %128 = fptrunc <2 x double> %127 to <2 x float>
  %129 = fcmp olt <2 x double> %127, splat (double f0xB690000000000000)
  %130 = fneg <2 x float> %128
  %131 = select <2 x i1> %129, <2 x float> %130, <2 x float> %128
  %132 = extractelement <2 x float> %131, i64 0
  %133 = extractelement <2 x float> %131, i64 1
  %134 = fdiv float %132, %133
  %135 = fcmp olt float %134, 0.000000e+00
  %136 = fneg float %134
  %common.ret.op.i10.i22 = select i1 %135, float %136, float %134
  %137 = fmul float %common.ret.op.i10.i22, 1.000000e+02
  %138 = fcmp ogt float %137, 5.000000e-01
  %139 = zext i1 %138 to i32
  br label %_Z11percentDiffdd.exit25

_Z11percentDiffdd.exit25:                         ; preds = %119, %.critedge.i19
  %common.ret.op.i23 = phi i32 [ %139, %.critedge.i19 ], [ 0, %119 ]
  %.3 = add nsw i32 %common.ret.op.i23, %.229
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond37.not = icmp eq i64 %indvars.iv.next34, %wide.trip.count36
  br i1 %exitcond37.not, label %._crit_edge, label %.lr.ph30, !llvm.loop !12

._crit_edge:                                      ; preds = %_Z11percentDiffdd.exit25, %middle.block52, %.preheader
  %.2.lcssa = phi i32 [ %.0.lcssa, %.preheader ], [ %77, %middle.block52 ], [ %.3, %_Z11percentDiffdd.exit25 ]
  %140 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-01, i32 noundef %.2.lcssa) #4
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #4

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #4

define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #5 {
  %1 = alloca %struct.cudaDeviceProp, align 8
  %2 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %1, i32 noundef 0) #4
  %3 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %1) #4
  %4 = call i32 @cudaSetDevice(i32 noundef 0) #4
  ret void
}

declare dso_local i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare dso_local i32 @cudaLaunchKernel(ptr, %struct.dim3, %struct.dim3, ptr, i64, ptr) local_unnamed_addr

define dso_local void @_Z27__device_stub__bicg_kernel1iiPfS_S_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #5 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %11 = alloca [5 x ptr], align 16
  store ptr %6, ptr %11, align 16
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 8
  store ptr %7, ptr %12, align 8
  %13 = getelementptr inbounds nuw i8, ptr %11, i64 16
  store ptr %8, ptr %13, align 16
  %14 = getelementptr inbounds nuw i8, ptr %11, i64 24
  store ptr %9, ptr %14, align 8
  %15 = getelementptr inbounds nuw i8, ptr %11, i64 32
  store ptr %10, ptr %15, align 16
  %16 = alloca %struct.dim3, align 8
  %17 = alloca %struct.dim3, align 8
  %18 = alloca i64, align 8
  %19 = alloca ptr, align 8
  %20 = call i32 @__cudaPopCallConfiguration(ptr nonnull %16, ptr nonnull %17, ptr nonnull %18, ptr nonnull %19)
  %21 = load i64, ptr %18, align 8
  %22 = load ptr, ptr %19, align 8
  %.fca.0.load2 = load i32, ptr %16, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %16, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %16, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %17, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %17, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %17, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %23 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__bicg_kernel1iiPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %11, i64 noundef %21, ptr noundef %22)
  ret void
}

define dso_local void @_Z27__device_stub__bicg_kernel2iiPfS_S_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #5 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %11 = alloca [5 x ptr], align 16
  store ptr %6, ptr %11, align 16
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 8
  store ptr %7, ptr %12, align 8
  %13 = getelementptr inbounds nuw i8, ptr %11, i64 16
  store ptr %8, ptr %13, align 16
  %14 = getelementptr inbounds nuw i8, ptr %11, i64 24
  store ptr %9, ptr %14, align 8
  %15 = getelementptr inbounds nuw i8, ptr %11, i64 32
  store ptr %10, ptr %15, align 16
  %16 = alloca %struct.dim3, align 8
  %17 = alloca %struct.dim3, align 8
  %18 = alloca i64, align 8
  %19 = alloca ptr, align 8
  %20 = call i32 @__cudaPopCallConfiguration(ptr nonnull %16, ptr nonnull %17, ptr nonnull %18, ptr nonnull %19)
  %21 = load i64, ptr %18, align 8
  %22 = load ptr, ptr %19, align 8
  %.fca.0.load2 = load i32, ptr %16, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %16, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %16, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %17, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %17, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %17, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %23 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__bicg_kernel2iiPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %11, i64 noundef %21, ptr noundef %22)
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z8bicg_cpuiiPA4096_fPfS1_S1_S1_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef captures(none) %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef captures(none) %6) local_unnamed_addr #6 {
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.preheader, label %.preheader.thread

.preheader:                                       ; preds = %7
  %9 = zext nneg i32 %1 to i64
  %10 = shl nuw nsw i64 %9, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %4, i8 0, i64 %10, i1 false)
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.lr.ph34.us.preheader, label %._crit_edge37

.preheader.thread:                                ; preds = %7
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.lr.ph36.split.preheader, label %._crit_edge37

.lr.ph36.split.preheader:                         ; preds = %.preheader.thread
  %13 = zext nneg i32 %0 to i64
  %14 = shl nuw nsw i64 %13, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %6, i8 0, i64 %14, i1 false)
  br label %._crit_edge37

.lr.ph34.us.preheader:                            ; preds = %.preheader
  %wide.trip.count45 = zext nneg i32 %0 to i64
  %wide.trip.count = zext nneg i32 %1 to i64
  br label %.lr.ph34.us

.lr.ph34.us:                                      ; preds = %.lr.ph34.us.preheader, %._crit_edge.us
  %indvars.iv42 = phi i64 [ 0, %.lr.ph34.us.preheader ], [ %indvars.iv.next43, %._crit_edge.us ]
  %15 = getelementptr [4 x i8], ptr %6, i64 %indvars.iv42
  store float 0.000000e+00, ptr %15, align 4
  %16 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv42
  %17 = getelementptr [16384 x i8], ptr %2, i64 %indvars.iv42
  br label %18

18:                                               ; preds = %.lr.ph34.us, %18
  %indvars.iv = phi i64 [ 0, %.lr.ph34.us ], [ %indvars.iv.next, %18 ]
  %19 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv
  %20 = load float, ptr %19, align 4
  %21 = load float, ptr %16, align 4
  %22 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv
  %23 = load float, ptr %22, align 4
  %24 = fmul float %21, %23
  %25 = fadd float %20, %24
  store float %25, ptr %19, align 4
  %26 = load float, ptr %15, align 4
  %27 = load float, ptr %22, align 4
  %28 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv
  %29 = load float, ptr %28, align 4
  %30 = fmul float %27, %29
  %31 = fadd float %26, %30
  store float %31, ptr %15, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge.us, label %18

._crit_edge.us:                                   ; preds = %18
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond46.not = icmp eq i64 %indvars.iv.next43, %wide.trip.count45
  br i1 %exitcond46.not, label %._crit_edge37, label %.lr.ph34.us

._crit_edge37:                                    ; preds = %._crit_edge.us, %.preheader.thread, %.lr.ph36.split.preheader, %.preheader
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #4

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @gettimeofday(ptr noalias noundef nonnull captures(none), ptr noalias noundef captures(none)) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #3 {
  %1 = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #14
  %.not.i = icmp eq i32 %2, 0
  br i1 %.not.i, label %_ZL7rtclockv.exit, label %3

3:                                                ; preds = %0
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %2) #4
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

declare i32 @__cudaPushCallConfiguration(%struct.dim3, %struct.dim3, i64 noundef, ptr noundef) local_unnamed_addr #4

declare i32 @cudaThreadSynchronize() local_unnamed_addr #4

; Function Attrs: nofree nounwind
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #3 {
  %1 = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #14
  %.not.i = icmp eq i32 %2, 0
  br i1 %.not.i, label %_ZL7rtclockv.exit, label %3

3:                                                ; preds = %0
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %2) #4
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
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #3 {
  %1 = load double, ptr @polybench_t_end, align 8
  %2 = load double, ptr @polybench_t_start, align 8
  %3 = fsub double %1, %2
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %3) #4
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #4

define dso_local void @_Z8bicgCudaiiPA4096_fPfS1_S1_S1_S1_S1_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8) local_unnamed_addr #5 {
  %10 = alloca %struct.timeval, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca [5 x ptr], align 16
  %17 = alloca %struct.dim3, align 8
  %18 = alloca %struct.dim3, align 8
  %19 = alloca i64, align 8
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca [5 x ptr], align 16
  %27 = alloca %struct.dim3, align 8
  %28 = alloca %struct.dim3, align 8
  %29 = alloca i64, align 8
  %30 = alloca ptr, align 8
  %31 = alloca %struct.timeval, align 8
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  %35 = alloca ptr, align 8
  %36 = alloca ptr, align 8
  %37 = call i32 @cudaMalloc(ptr noundef nonnull %32, i64 noundef 67108864) #4
  %38 = call i32 @cudaMalloc(ptr noundef nonnull %35, i64 noundef 16384) #4
  %39 = call i32 @cudaMalloc(ptr noundef nonnull %36, i64 noundef 16384) #4
  %40 = call i32 @cudaMalloc(ptr noundef nonnull %34, i64 noundef 16384) #4
  %41 = call i32 @cudaMalloc(ptr noundef nonnull %33, i64 noundef 16384) #4
  %42 = load ptr, ptr %32, align 8
  %43 = call i32 @cudaMemcpy(ptr noundef %42, ptr noundef %2, i64 noundef 67108864, i32 noundef 1) #4
  %44 = load ptr, ptr %35, align 8
  %45 = call i32 @cudaMemcpy(ptr noundef %44, ptr noundef %3, i64 noundef 16384, i32 noundef 1) #4
  %46 = load ptr, ptr %36, align 8
  %47 = call i32 @cudaMemcpy(ptr noundef %46, ptr noundef %4, i64 noundef 16384, i32 noundef 1) #4
  %48 = load ptr, ptr %34, align 8
  %49 = call i32 @cudaMemcpy(ptr noundef %48, ptr noundef %5, i64 noundef 16384, i32 noundef 1) #4
  %50 = load ptr, ptr %33, align 8
  %51 = call i32 @cudaMemcpy(ptr noundef %50, ptr noundef %6, i64 noundef 16384, i32 noundef 1) #4
  call void @llvm.lifetime.start.p0(ptr nonnull %31)
  %52 = call i32 @gettimeofday(ptr noundef nonnull %31, ptr noundef null) #14
  %.not.i.i = icmp eq i32 %52, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %53

53:                                               ; preds = %9
  %54 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %52) #4
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %9, %53
  %55 = load i64, ptr %31, align 8
  %56 = sitofp i64 %55 to double
  %57 = getelementptr inbounds nuw i8, ptr %31, i64 8
  %58 = load i64, ptr %57, align 8
  %59 = sitofp i64 %58 to double
  %60 = fmul nnan double %59, f0x3EB0C6F7A0B5ED8D
  %61 = fadd double %60, %56
  call void @llvm.lifetime.end.p0(ptr nonnull %31)
  store double %61, ptr @polybench_t_start, align 8
  %62 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 16, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #4
  %.not = icmp eq i32 %62, 0
  br i1 %.not, label %63, label %75

63:                                               ; preds = %_Z21polybench_timer_startv.exit
  %64 = load ptr, ptr %32, align 8
  %65 = load ptr, ptr %35, align 8
  %66 = load ptr, ptr %36, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %21)
  call void @llvm.lifetime.start.p0(ptr nonnull %22)
  call void @llvm.lifetime.start.p0(ptr nonnull %23)
  call void @llvm.lifetime.start.p0(ptr nonnull %24)
  call void @llvm.lifetime.start.p0(ptr nonnull %25)
  call void @llvm.lifetime.start.p0(ptr nonnull %26)
  call void @llvm.lifetime.start.p0(ptr nonnull %27)
  call void @llvm.lifetime.start.p0(ptr nonnull %28)
  call void @llvm.lifetime.start.p0(ptr nonnull %29)
  call void @llvm.lifetime.start.p0(ptr nonnull %30)
  store i32 %0, ptr %21, align 4
  store i32 %1, ptr %22, align 4
  store ptr %64, ptr %23, align 8
  store ptr %65, ptr %24, align 8
  store ptr %66, ptr %25, align 8
  store ptr %21, ptr %26, align 16
  %67 = getelementptr inbounds nuw i8, ptr %26, i64 8
  store ptr %22, ptr %67, align 8
  %68 = getelementptr inbounds nuw i8, ptr %26, i64 16
  store ptr %23, ptr %68, align 16
  %69 = getelementptr inbounds nuw i8, ptr %26, i64 24
  store ptr %24, ptr %69, align 8
  %70 = getelementptr inbounds nuw i8, ptr %26, i64 32
  store ptr %25, ptr %70, align 16
  %71 = call i32 @__cudaPopCallConfiguration(ptr nonnull %27, ptr nonnull %28, ptr nonnull %29, ptr nonnull %30), !inline_history !13
  %72 = load i64, ptr %29, align 8
  %73 = load ptr, ptr %30, align 8
  %.fca.0.load2.i = load i32, ptr %27, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %27, i64 4
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %27, i64 8
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %28, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %28, i64 4
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %28, i64 8
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %74 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__bicg_kernel1iiPfS_S_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %26, i64 noundef %72, ptr noundef %73), !inline_history !13
  call void @llvm.lifetime.end.p0(ptr nonnull %21)
  call void @llvm.lifetime.end.p0(ptr nonnull %22)
  call void @llvm.lifetime.end.p0(ptr nonnull %23)
  call void @llvm.lifetime.end.p0(ptr nonnull %24)
  call void @llvm.lifetime.end.p0(ptr nonnull %25)
  call void @llvm.lifetime.end.p0(ptr nonnull %26)
  call void @llvm.lifetime.end.p0(ptr nonnull %27)
  call void @llvm.lifetime.end.p0(ptr nonnull %28)
  call void @llvm.lifetime.end.p0(ptr nonnull %29)
  call void @llvm.lifetime.end.p0(ptr nonnull %30)
  br label %75

75:                                               ; preds = %_Z21polybench_timer_startv.exit, %63
  %76 = call i32 @cudaThreadSynchronize() #4
  %77 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 16, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #4
  %.not28 = icmp eq i32 %77, 0
  br i1 %.not28, label %78, label %90

78:                                               ; preds = %75
  %79 = load ptr, ptr %32, align 8
  %80 = load ptr, ptr %34, align 8
  %81 = load ptr, ptr %33, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  call void @llvm.lifetime.start.p0(ptr nonnull %15)
  call void @llvm.lifetime.start.p0(ptr nonnull %16)
  call void @llvm.lifetime.start.p0(ptr nonnull %17)
  call void @llvm.lifetime.start.p0(ptr nonnull %18)
  call void @llvm.lifetime.start.p0(ptr nonnull %19)
  call void @llvm.lifetime.start.p0(ptr nonnull %20)
  store i32 %0, ptr %11, align 4
  store i32 %1, ptr %12, align 4
  store ptr %79, ptr %13, align 8
  store ptr %80, ptr %14, align 8
  store ptr %81, ptr %15, align 8
  store ptr %11, ptr %16, align 16
  %82 = getelementptr inbounds nuw i8, ptr %16, i64 8
  store ptr %12, ptr %82, align 8
  %83 = getelementptr inbounds nuw i8, ptr %16, i64 16
  store ptr %13, ptr %83, align 16
  %84 = getelementptr inbounds nuw i8, ptr %16, i64 24
  store ptr %14, ptr %84, align 8
  %85 = getelementptr inbounds nuw i8, ptr %16, i64 32
  store ptr %15, ptr %85, align 16
  %86 = call i32 @__cudaPopCallConfiguration(ptr nonnull %17, ptr nonnull %18, ptr nonnull %19, ptr nonnull %20), !inline_history !14
  %87 = load i64, ptr %19, align 8
  %88 = load ptr, ptr %20, align 8
  %.fca.0.load2.i29 = load i32, ptr %17, align 8
  %.fca.0.insert3.i30 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i29, 0
  %.fca.1.gep4.i31 = getelementptr inbounds nuw i8, ptr %17, i64 4
  %.fca.1.load5.i32 = load i32, ptr %.fca.1.gep4.i31, align 4
  %.fca.1.insert6.i33 = insertvalue %struct.dim3 %.fca.0.insert3.i30, i32 %.fca.1.load5.i32, 1
  %.fca.2.gep7.i34 = getelementptr inbounds nuw i8, ptr %17, i64 8
  %.fca.2.load8.i35 = load i32, ptr %.fca.2.gep7.i34, align 8
  %.fca.2.insert9.i36 = insertvalue %struct.dim3 %.fca.1.insert6.i33, i32 %.fca.2.load8.i35, 2
  %.fca.0.load.i37 = load i32, ptr %18, align 8
  %.fca.0.insert.i38 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i37, 0
  %.fca.1.gep.i39 = getelementptr inbounds nuw i8, ptr %18, i64 4
  %.fca.1.load.i40 = load i32, ptr %.fca.1.gep.i39, align 4
  %.fca.1.insert.i41 = insertvalue %struct.dim3 %.fca.0.insert.i38, i32 %.fca.1.load.i40, 1
  %.fca.2.gep.i42 = getelementptr inbounds nuw i8, ptr %18, i64 8
  %.fca.2.load.i43 = load i32, ptr %.fca.2.gep.i42, align 8
  %.fca.2.insert.i44 = insertvalue %struct.dim3 %.fca.1.insert.i41, i32 %.fca.2.load.i43, 2
  %89 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__bicg_kernel2iiPfS_S_, %struct.dim3 %.fca.2.insert9.i36, %struct.dim3 %.fca.2.insert.i44, ptr noundef nonnull %16, i64 noundef %87, ptr noundef %88), !inline_history !14
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  call void @llvm.lifetime.end.p0(ptr nonnull %13)
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  call void @llvm.lifetime.end.p0(ptr nonnull %15)
  call void @llvm.lifetime.end.p0(ptr nonnull %16)
  call void @llvm.lifetime.end.p0(ptr nonnull %17)
  call void @llvm.lifetime.end.p0(ptr nonnull %18)
  call void @llvm.lifetime.end.p0(ptr nonnull %19)
  call void @llvm.lifetime.end.p0(ptr nonnull %20)
  br label %90

90:                                               ; preds = %75, %78
  %91 = call i32 @cudaThreadSynchronize() #4
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  %92 = call i32 @gettimeofday(ptr noundef nonnull %10, ptr noundef null) #14
  %.not.i.i45 = icmp eq i32 %92, 0
  br i1 %.not.i.i45, label %_Z20polybench_timer_stopv.exit, label %93

93:                                               ; preds = %90
  %94 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %92) #4
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %90, %93
  %95 = load i64, ptr %10, align 8
  %96 = sitofp i64 %95 to double
  %97 = getelementptr inbounds nuw i8, ptr %10, i64 8
  %98 = load i64, ptr %97, align 8
  %99 = sitofp i64 %98 to double
  %100 = fmul nnan double %99, f0x3EB0C6F7A0B5ED8D
  %101 = fadd double %100, %96
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  store double %101, ptr @polybench_t_end, align 8
  %102 = load double, ptr @polybench_t_start, align 8
  %103 = fsub double %101, %102
  %104 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %103) #4
  %105 = load ptr, ptr %36, align 8
  %106 = call i32 @cudaMemcpy(ptr noundef %7, ptr noundef %105, i64 noundef 16384, i32 noundef 2) #4
  %107 = load ptr, ptr %33, align 8
  %108 = call i32 @cudaMemcpy(ptr noundef %8, ptr noundef %107, i64 noundef 16384, i32 noundef 2) #4
  %109 = load ptr, ptr %32, align 8
  %110 = call i32 @cudaFree(ptr noundef %109) #4
  %111 = load ptr, ptr %35, align 8
  %112 = call i32 @cudaFree(ptr noundef %111) #4
  %113 = load ptr, ptr %36, align 8
  %114 = call i32 @cudaFree(ptr noundef %113) #4
  %115 = load ptr, ptr %34, align 8
  %116 = call i32 @cudaFree(ptr noundef %115) #4
  %117 = load ptr, ptr %33, align 8
  %118 = call i32 @cudaFree(ptr noundef %117) #4
  ret void
}

; Function Attrs: nofree
declare i32 @posix_memalign(ptr noundef nonnull, i64 noundef, i64 noundef) local_unnamed_addr #7

; Function Attrs: nofree noreturn
declare void @exit(i32 noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %0, i32 noundef %1) local_unnamed_addr #3 {
  %3 = alloca ptr, align 8
  %4 = sext i32 %1 to i64
  %5 = mul i64 %0, %4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store ptr null, ptr %3, align 8
  %6 = call i32 @posix_memalign(ptr noundef nonnull %3, i64 noundef 32, i64 noundef %5) #14
  %7 = load ptr, ptr %3, align 8
  %.not.i = icmp eq ptr %7, null
  %8 = icmp ne i32 %6, 0
  %or.cond.i = select i1 %.not.i, i1 true, i1 %8
  br i1 %or.cond.i, label %.critedge.i, label %_ZL7xmallocm.exit

.critedge.i:                                      ; preds = %2
  %9 = load ptr, ptr @stderr, align 8
  %10 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %9) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_ZL7xmallocm.exit:                                ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  ret ptr %7
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #9

define dso_local noundef i32 @main(i32 noundef %0, ptr nofree noundef readnone captures(none) %1) local_unnamed_addr #5 {
  %3 = alloca %struct.timeval, align 8
  %4 = alloca %struct.timeval, align 8
  %5 = alloca %struct.cudaDeviceProp, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  store ptr null, ptr %12, align 8
  %13 = call i32 @posix_memalign(ptr noundef nonnull %12, i64 noundef 32, i64 noundef 67108864) #14
  %14 = load ptr, ptr %12, align 8
  %.not.i.i = icmp eq ptr %14, null
  %15 = icmp ne i32 %13, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %15
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %16 = load ptr, ptr @stderr, align 8
  %17 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %16) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  store ptr null, ptr %11, align 8
  %18 = call i32 @posix_memalign(ptr noundef nonnull %11, i64 noundef 32, i64 noundef 16384) #14
  %19 = load ptr, ptr %11, align 8
  %.not.i.i34 = icmp eq ptr %19, null
  %20 = icmp ne i32 %18, 0
  %or.cond.i.i35 = select i1 %.not.i.i34, i1 true, i1 %20
  br i1 %or.cond.i.i35, label %.critedge.i.i36, label %_Z20polybench_alloc_datayi.exit37

.critedge.i.i36:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %21 = load ptr, ptr @stderr, align 8
  %22 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %21) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit37:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  store ptr null, ptr %10, align 8
  %23 = call i32 @posix_memalign(ptr noundef nonnull %10, i64 noundef 32, i64 noundef 16384) #14
  %24 = load ptr, ptr %10, align 8
  %.not.i.i38 = icmp eq ptr %24, null
  %25 = icmp ne i32 %23, 0
  %or.cond.i.i39 = select i1 %.not.i.i38, i1 true, i1 %25
  br i1 %or.cond.i.i39, label %.critedge.i.i40, label %_Z20polybench_alloc_datayi.exit41

.critedge.i.i40:                                  ; preds = %_Z20polybench_alloc_datayi.exit37
  %26 = load ptr, ptr @stderr, align 8
  %27 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %26) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit41:                ; preds = %_Z20polybench_alloc_datayi.exit37
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  store ptr null, ptr %9, align 8
  %28 = call i32 @posix_memalign(ptr noundef nonnull %9, i64 noundef 32, i64 noundef 16384) #14
  %29 = load ptr, ptr %9, align 8
  %.not.i.i42 = icmp eq ptr %29, null
  %30 = icmp ne i32 %28, 0
  %or.cond.i.i43 = select i1 %.not.i.i42, i1 true, i1 %30
  br i1 %or.cond.i.i43, label %.critedge.i.i44, label %_Z20polybench_alloc_datayi.exit45

.critedge.i.i44:                                  ; preds = %_Z20polybench_alloc_datayi.exit41
  %31 = load ptr, ptr @stderr, align 8
  %32 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %31) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit45:                ; preds = %_Z20polybench_alloc_datayi.exit41
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %33 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 16384) #14
  %34 = load ptr, ptr %8, align 8
  %.not.i.i46 = icmp eq ptr %34, null
  %35 = icmp ne i32 %33, 0
  %or.cond.i.i47 = select i1 %.not.i.i46, i1 true, i1 %35
  br i1 %or.cond.i.i47, label %.critedge.i.i48, label %_Z20polybench_alloc_datayi.exit49

.critedge.i.i48:                                  ; preds = %_Z20polybench_alloc_datayi.exit45
  %36 = load ptr, ptr @stderr, align 8
  %37 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %36) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit49:                ; preds = %_Z20polybench_alloc_datayi.exit45
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %38 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 16384) #14
  %39 = load ptr, ptr %7, align 8
  %.not.i.i50 = icmp eq ptr %39, null
  %40 = icmp ne i32 %38, 0
  %or.cond.i.i51 = select i1 %.not.i.i50, i1 true, i1 %40
  br i1 %or.cond.i.i51, label %.critedge.i.i52, label %_Z20polybench_alloc_datayi.exit53

.critedge.i.i52:                                  ; preds = %_Z20polybench_alloc_datayi.exit49
  %41 = load ptr, ptr @stderr, align 8
  %42 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %41) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit53:                ; preds = %_Z20polybench_alloc_datayi.exit49
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %43 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 16384) #14
  %44 = load ptr, ptr %6, align 8
  %.not.i.i54 = icmp eq ptr %44, null
  %45 = icmp ne i32 %43, 0
  %or.cond.i.i55 = select i1 %.not.i.i54, i1 true, i1 %45
  br i1 %or.cond.i.i55, label %.critedge.i.i56, label %_Z20polybench_alloc_datayi.exit57

.critedge.i.i56:                                  ; preds = %_Z20polybench_alloc_datayi.exit53
  %46 = load ptr, ptr @stderr, align 8
  %47 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %46) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit57:                ; preds = %_Z20polybench_alloc_datayi.exit53
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %_Z20polybench_alloc_datayi.exit57
  %index = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit57 ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %_Z20polybench_alloc_datayi.exit57 ], [ %vec.ind.next.1, %vector.body ]
  %48 = uitofp nneg <4 x i32> %vec.ind to <4 x double>
  %49 = fmul nnan <4 x double> %48, splat (double f0x400921FB54442D18)
  %50 = fptrunc <4 x double> %49 to <4 x float>
  %51 = getelementptr [4 x i8], ptr %29, i64 %index
  store <4 x float> %50, ptr %51, align 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %52 = uitofp nneg <4 x i32> %vec.ind.next to <4 x double>
  %53 = fmul nnan <4 x double> %52, splat (double f0x400921FB54442D18)
  %54 = fptrunc <4 x double> %53 to <4 x float>
  %55 = getelementptr [4 x i8], ptr %29, i64 %index
  %56 = getelementptr i8, ptr %55, i64 16
  store <4 x float> %54, ptr %56, align 4
  %index.next.1 = add nuw nsw i64 %index, 8
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 8)
  %57 = icmp eq i64 %index.next.1, 4096
  br i1 %57, label %.lr.ph23.us.i, label %vector.body, !llvm.loop !15

.lr.ph23.us.i:                                    ; preds = %vector.body, %._crit_edge.us.i
  %indvars.iv39.i = phi i64 [ %indvars.iv.next40.i, %._crit_edge.us.i ], [ 0, %vector.body ]
  %58 = trunc nuw nsw i64 %indvars.iv39.i to i32
  %59 = uitofp nneg i32 %58 to double
  %60 = fmul nnan double %59, f0x400921FB54442D18
  %61 = fptrunc double %60 to float
  %62 = getelementptr [4 x i8], ptr %34, i64 %indvars.iv39.i
  store float %61, ptr %62, align 4
  %63 = getelementptr [16384 x i8], ptr %14, i64 %indvars.iv39.i
  %64 = uitofp nneg i32 %58 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %64, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body74

vector.body74:                                    ; preds = %vector.body74, %.lr.ph23.us.i
  %index75 = phi i64 [ 0, %.lr.ph23.us.i ], [ %index.next77.1, %vector.body74 ]
  %vec.ind76 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.lr.ph23.us.i ], [ %vec.ind.next78.1, %vector.body74 ]
  %step.add = add <4 x i32> %vec.ind76, splat (i32 4)
  %65 = uitofp nneg <4 x i32> %vec.ind76 to <4 x float>
  %66 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %67 = fmul nnan <4 x float> %broadcast.splat, %65
  %68 = fmul nnan <4 x float> %broadcast.splat, %66
  %69 = fmul nnan <4 x float> %67, splat (float f0x39800000)
  %70 = fmul nnan <4 x float> %68, splat (float f0x39800000)
  %71 = getelementptr [4 x i8], ptr %63, i64 %index75
  %72 = getelementptr i8, ptr %71, i64 16
  store <4 x float> %69, ptr %71, align 4
  store <4 x float> %70, ptr %72, align 4
  %vec.ind.next78 = add <4 x i32> %vec.ind76, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind76, splat (i32 12)
  %73 = uitofp nneg <4 x i32> %vec.ind.next78 to <4 x float>
  %74 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %75 = fmul nnan <4 x float> %broadcast.splat, %73
  %76 = fmul nnan <4 x float> %broadcast.splat, %74
  %77 = fmul nnan <4 x float> %75, splat (float f0x39800000)
  %78 = fmul nnan <4 x float> %76, splat (float f0x39800000)
  %79 = getelementptr [4 x i8], ptr %63, i64 %index75
  %80 = getelementptr i8, ptr %79, i64 32
  %81 = getelementptr i8, ptr %79, i64 48
  store <4 x float> %77, ptr %80, align 4
  store <4 x float> %78, ptr %81, align 4
  %index.next77.1 = add nuw nsw i64 %index75, 16
  %vec.ind.next78.1 = add <4 x i32> %vec.ind76, splat (i32 16)
  %82 = icmp eq i64 %index.next77.1, 4096
  br i1 %82, label %._crit_edge.us.i, label %vector.body74, !llvm.loop !16

._crit_edge.us.i:                                 ; preds = %vector.body74
  %indvars.iv.next40.i = add nuw nsw i64 %indvars.iv39.i, 1
  %exitcond43.not.i = icmp eq i64 %indvars.iv.next40.i, 4096
  br i1 %exitcond43.not.i, label %_Z10init_arrayiiPA4096_fPfS1_.exit, label %.lr.ph23.us.i

_Z10init_arrayiiPA4096_fPfS1_.exit:               ; preds = %._crit_edge.us.i
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  %83 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %5, i32 noundef 0) #4
  %84 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %5) #4
  %85 = call i32 @cudaSetDevice(i32 noundef 0) #4
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @_Z8bicgCudaiiPA4096_fPfS1_S1_S1_S1_S1_(i32 noundef 4096, i32 noundef 4096, ptr noundef nonnull %14, ptr noundef nonnull %34, ptr noundef %19, ptr noundef %29, ptr noundef %24, ptr noundef %39, ptr noundef %44) #4
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %86 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #14
  %.not.i.i58 = icmp eq i32 %86, 0
  br i1 %.not.i.i58, label %_Z21polybench_timer_startv.exit, label %87

87:                                               ; preds = %_Z10init_arrayiiPA4096_fPfS1_.exit
  %88 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %86) #4
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiiPA4096_fPfS1_.exit, %87
  %89 = load i64, ptr %4, align 8
  %90 = sitofp i64 %89 to double
  %91 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %92 = load i64, ptr %91, align 8
  %93 = sitofp i64 %92 to double
  %94 = fmul nnan double %93, f0x3EB0C6F7A0B5ED8D
  %95 = fadd double %94, %90
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %95, ptr @polybench_t_start, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(16384) %19, i8 0, i64 16384, i1 false)
  br label %.lr.ph34.us.i

.lr.ph34.us.i:                                    ; preds = %._crit_edge.us.i63, %_Z21polybench_timer_startv.exit
  %indvars.iv42.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next43.i, %._crit_edge.us.i63 ]
  %96 = getelementptr [4 x i8], ptr %24, i64 %indvars.iv42.i
  store float 0.000000e+00, ptr %96, align 4
  %97 = getelementptr [4 x i8], ptr %34, i64 %indvars.iv42.i
  %98 = getelementptr [16384 x i8], ptr %14, i64 %indvars.iv42.i
  br label %99

99:                                               ; preds = %99, %.lr.ph34.us.i
  %indvars.iv.i60 = phi i64 [ 0, %.lr.ph34.us.i ], [ %indvars.iv.next.i61, %99 ]
  %100 = getelementptr [4 x i8], ptr %19, i64 %indvars.iv.i60
  %101 = load float, ptr %100, align 4
  %102 = load float, ptr %97, align 4
  %103 = getelementptr [4 x i8], ptr %98, i64 %indvars.iv.i60
  %104 = load float, ptr %103, align 4
  %105 = fmul float %102, %104
  %106 = fadd float %101, %105
  store float %106, ptr %100, align 4
  %107 = load float, ptr %96, align 4
  %108 = load float, ptr %103, align 4
  %109 = getelementptr [4 x i8], ptr %29, i64 %indvars.iv.i60
  %110 = load float, ptr %109, align 4
  %111 = fmul float %108, %110
  %112 = fadd float %107, %111
  store float %112, ptr %96, align 4
  %indvars.iv.next.i61 = add nuw nsw i64 %indvars.iv.i60, 1
  %exitcond.not.i62 = icmp eq i64 %indvars.iv.next.i61, 4096
  br i1 %exitcond.not.i62, label %._crit_edge.us.i63, label %99

._crit_edge.us.i63:                               ; preds = %99
  %indvars.iv.next43.i = add nuw nsw i64 %indvars.iv42.i, 1
  %exitcond46.not.i = icmp eq i64 %indvars.iv.next43.i, 4096
  br i1 %exitcond46.not.i, label %_Z8bicg_cpuiiPA4096_fPfS1_S1_S1_.exit, label %.lr.ph34.us.i

_Z8bicg_cpuiiPA4096_fPfS1_S1_S1_.exit:            ; preds = %._crit_edge.us.i63
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %113 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #14
  %.not.i.i64 = icmp eq i32 %113, 0
  br i1 %.not.i.i64, label %_Z20polybench_timer_stopv.exit, label %114

114:                                              ; preds = %_Z8bicg_cpuiiPA4096_fPfS1_S1_S1_.exit
  %115 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %113) #4
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z8bicg_cpuiiPA4096_fPfS1_S1_S1_.exit, %114
  %116 = load i64, ptr %3, align 8
  %117 = sitofp i64 %116 to double
  %118 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %119 = load i64, ptr %118, align 8
  %120 = sitofp i64 %119 to double
  %121 = fmul nnan double %120, f0x3EB0C6F7A0B5ED8D
  %122 = fadd double %121, %117
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %122, ptr @polybench_t_end, align 8
  %123 = load double, ptr @polybench_t_start, align 8
  %124 = fsub double %122, %123
  %125 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %124) #4
  call void @_Z14compareResultsiiPfS_S_S_(i32 noundef 4096, i32 noundef 4096, ptr noundef nonnull %19, ptr noundef %39, ptr noundef nonnull %24, ptr noundef %44) #4
  call void @free(ptr noundef nonnull %14) #14
  call void @free(ptr noundef nonnull %34) #14
  call void @free(ptr noundef nonnull %19) #14
  call void @free(ptr noundef nonnull %29) #14
  call void @free(ptr noundef nonnull %24) #14
  call void @free(ptr noundef %39) #14
  call void @free(ptr noundef %44) #14
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

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #11

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #12

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #12

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #13

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: write) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { nofree nounwind "uniform-work-group-size" }
attributes #3 = { nofree nounwind "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #4 = { "uniform-work-group-size" }
attributes #5 = { "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #6 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #7 = { nofree "uniform-work-group-size" }
attributes #8 = { nofree noreturn "uniform-work-group-size" }
attributes #9 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "uniform-work-group-size" }
attributes #10 = { nofree nounwind }
attributes #11 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #13 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #14 = { nounwind "uniform-work-group-size" }
attributes #15 = { cold }
attributes #16 = { cold noreturn nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.isvectorized", i32 1}
!3 = !{!"llvm.loop.unroll.runtime.disable"}
!4 = distinct !{!4, !2, !3}
!5 = distinct !{!5, !2, !3}
!6 = distinct !{!6, !3, !2}
!7 = distinct !{!7, !3, !2}
!8 = distinct !{!8, !3, !2}
!9 = distinct !{!9, !2, !3}
!10 = distinct !{!10, !2, !3}
!11 = distinct !{!11, !3, !2}
!12 = distinct !{!12, !3, !2}
!13 = !{ptr @_Z27__device_stub__bicg_kernel1iiPfS_S_}
!14 = !{ptr @_Z27__device_stub__bicg_kernel2iiPfS_S_}
!15 = distinct !{!15, !2, !3}
!16 = distinct !{!16, !2, !3}
