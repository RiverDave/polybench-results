; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/SYRK/syrk.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/SYRK/syrk.cu"
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
define dso_local void @_Z11init_arraysiiPfS_PA1024_fS1_(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %2, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %3, ptr nofree noundef writeonly captures(none) %4, ptr nofree noundef writeonly captures(none) %5) local_unnamed_addr #1 {
  store float 3.241200e+04, ptr %2, align 4
  store float 2.123000e+03, ptr %3, align 4
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader30.lr.ph, label %._crit_edge36.split

.preheader30.lr.ph:                               ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = uitofp nneg i32 %0 to float
  br i1 %8, label %.preheader30.preheader, label %.preheader.lr.ph

.preheader30.preheader:                           ; preds = %.preheader30.lr.ph
  %wide.trip.count41 = zext nneg i32 %0 to i64
  %wide.trip.count = zext nneg i32 %1 to i64
  %min.iters.check = icmp ult i32 %1, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %broadcast.splatinsert55 = insertelement <4 x float> poison, float %9, i64 0
  %broadcast.splat56 = shufflevector <4 x float> %broadcast.splatinsert55, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %.preheader30

.preheader30:                                     ; preds = %.preheader30.preheader, %._crit_edge
  %indvars.iv38 = phi i64 [ 0, %.preheader30.preheader ], [ %indvars.iv.next39, %._crit_edge ]
  %10 = trunc nuw nsw i64 %indvars.iv38 to i32
  %11 = uitofp nneg i32 %10 to float
  %12 = getelementptr [4096 x i8], ptr %5, i64 %indvars.iv38
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader30
  %broadcast.splatinsert = insertelement <4 x float> poison, float %11, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %13 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %14 = fmul nnan <4 x float> %broadcast.splat, %13
  %15 = fdiv <4 x float> %14, %broadcast.splat56
  %16 = getelementptr [4 x i8], ptr %12, i64 %index
  store <4 x float> %15, ptr %16, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader30, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader30 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

.preheader.lr.ph:                                 ; preds = %._crit_edge, %.preheader30.lr.ph
  %18 = uitofp nneg i32 %0 to float
  %wide.trip.count51 = zext nneg i32 %0 to i64
  %min.iters.check58 = icmp ult i32 %0, 4
  %n.vec61 = and i64 %wide.trip.count51, 2147483644
  %broadcast.splatinsert64 = insertelement <4 x float> poison, float %18, i64 0
  %broadcast.splat65 = shufflevector <4 x float> %broadcast.splatinsert64, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n72 = icmp eq i64 %n.vec61, %wide.trip.count51
  br label %.preheader

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %19 = trunc nuw nsw i64 %indvars.iv to i32
  %20 = uitofp nneg i32 %19 to float
  %21 = fmul nnan float %11, %20
  %22 = fdiv float %21, %9
  %23 = getelementptr [4 x i8], ptr %12, i64 %indvars.iv
  store float %22, ptr %23, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !4

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond42.not = icmp eq i64 %indvars.iv.next39, %wide.trip.count41
  br i1 %exitcond42.not, label %.preheader.lr.ph, label %.preheader30

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge34
  %indvars.iv48 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next49, %._crit_edge34 ]
  %24 = trunc nuw nsw i64 %indvars.iv48 to i32
  %25 = uitofp nneg i32 %24 to float
  %26 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv48
  br i1 %min.iters.check58, label %scalar.ph57.preheader, label %vector.ph59

vector.ph59:                                      ; preds = %.preheader
  %broadcast.splatinsert62 = insertelement <4 x float> poison, float %25, i64 0
  %broadcast.splat63 = shufflevector <4 x float> %broadcast.splatinsert62, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body66

vector.body66:                                    ; preds = %vector.body66, %vector.ph59
  %index67 = phi i64 [ 0, %vector.ph59 ], [ %index.next69, %vector.body66 ]
  %vec.ind68 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph59 ], [ %vec.ind.next70, %vector.body66 ]
  %27 = uitofp nneg <4 x i32> %vec.ind68 to <4 x float>
  %28 = fmul nnan <4 x float> %broadcast.splat63, %27
  %29 = fdiv <4 x float> %28, %broadcast.splat65
  %30 = getelementptr [4 x i8], ptr %26, i64 %index67
  store <4 x float> %29, ptr %30, align 4
  %index.next69 = add nuw i64 %index67, 4
  %vec.ind.next70 = add <4 x i32> %vec.ind68, splat (i32 4)
  %31 = icmp eq i64 %index.next69, %n.vec61
  br i1 %31, label %middle.block71, label %vector.body66, !llvm.loop !5

middle.block71:                                   ; preds = %vector.body66
  br i1 %cmp.n72, label %._crit_edge34, label %scalar.ph57.preheader

scalar.ph57.preheader:                            ; preds = %.preheader, %middle.block71
  %indvars.iv43.ph = phi i64 [ 0, %.preheader ], [ %n.vec61, %middle.block71 ]
  br label %scalar.ph57

scalar.ph57:                                      ; preds = %scalar.ph57.preheader, %scalar.ph57
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %scalar.ph57 ], [ %indvars.iv43.ph, %scalar.ph57.preheader ]
  %32 = trunc nuw nsw i64 %indvars.iv43 to i32
  %33 = uitofp nneg i32 %32 to float
  %34 = fmul nnan float %25, %33
  %35 = fdiv float %34, %18
  %36 = getelementptr [4 x i8], ptr %26, i64 %indvars.iv43
  store float %35, ptr %36, align 4
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond47.not = icmp eq i64 %indvars.iv.next44, %wide.trip.count51
  br i1 %exitcond47.not, label %._crit_edge34, label %scalar.ph57, !llvm.loop !6

._crit_edge34:                                    ; preds = %scalar.ph57, %middle.block71
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond52.not = icmp eq i64 %indvars.iv.next49, %wide.trip.count51
  br i1 %exitcond52.not, label %._crit_edge36.split, label %.preheader

._crit_edge36.split:                              ; preds = %._crit_edge34, %6
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z4syrkiiffPA1024_fS0_(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef captures(none) %5) local_unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader35.preheader, label %._crit_edge43.split

.preheader35.preheader:                           ; preds = %6
  %wide.trip.count49 = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 8
  %n.vec = and i64 %wide.trip.count49, 2147483640
  %broadcast.splatinsert = insertelement <4 x float> poison, float %3, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count49
  br label %.preheader35

.preheader35:                                     ; preds = %.preheader35.preheader, %._crit_edge
  %indvars.iv46 = phi i64 [ 0, %.preheader35.preheader ], [ %indvars.iv.next47, %._crit_edge ]
  %8 = getelementptr [4096 x i8], ptr %5, i64 %indvars.iv46
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.body

vector.body:                                      ; preds = %.preheader35, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader35 ]
  %9 = getelementptr [4 x i8], ptr %8, i64 %index
  %10 = getelementptr i8, ptr %9, i64 16
  %wide.load = load <4 x float>, ptr %9, align 4
  %wide.load68 = load <4 x float>, ptr %10, align 4
  %11 = fmul <4 x float> %broadcast.splat, %wide.load
  %12 = fmul <4 x float> %broadcast.splat, %wide.load68
  store <4 x float> %11, ptr %9, align 4
  store <4 x float> %12, ptr %10, align 4
  %index.next = add nuw i64 %index, 8
  %13 = icmp eq i64 %index.next, %n.vec
  br i1 %13, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader35, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader35 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

.preheader34:                                     ; preds = %._crit_edge
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.preheader33.preheader, label %._crit_edge43.split

.preheader33.preheader:                           ; preds = %.preheader34
  %wide.trip.count64 = zext nneg i32 %0 to i64
  %wide.trip.count54 = zext nneg i32 %1 to i64
  %xtraiter = and i64 %wide.trip.count54, 1
  %15 = icmp eq i32 %1, 1
  %unroll_iter = and i64 %wide.trip.count54, 2147483646
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod69 = trunc i32 %1 to i1
  br label %.preheader33

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %16 = getelementptr [4 x i8], ptr %8, i64 %indvars.iv
  %17 = load float, ptr %16, align 4
  %18 = fmul float %3, %17
  store float %18, ptr %16, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count49
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !8

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond50.not = icmp eq i64 %indvars.iv.next47, %wide.trip.count49
  br i1 %exitcond50.not, label %.preheader34, label %.preheader35

.preheader33:                                     ; preds = %.preheader33.preheader, %._crit_edge41
  %indvars.iv61 = phi i64 [ 0, %.preheader33.preheader ], [ %indvars.iv.next62, %._crit_edge41 ]
  %19 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv61
  %20 = getelementptr [4096 x i8], ptr %5, i64 %indvars.iv61
  br label %.preheader

.preheader:                                       ; preds = %.preheader33, %._crit_edge39
  %indvars.iv56 = phi i64 [ 0, %.preheader33 ], [ %indvars.iv.next57, %._crit_edge39 ]
  %21 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv56
  %22 = getelementptr [4 x i8], ptr %20, i64 %indvars.iv56
  %.promoted = load float, ptr %22, align 4
  br i1 %15, label %.epil.preheader, label %.preheader.new

.preheader.new:                                   ; preds = %.preheader, %.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.1, %.preheader.new ], [ 0, %.preheader ]
  %23 = phi float [ %37, %.preheader.new ], [ %.promoted, %.preheader ]
  %niter = phi i64 [ %niter.next.1, %.preheader.new ], [ 0, %.preheader ]
  %24 = getelementptr [4 x i8], ptr %19, i64 %indvars.iv51
  %25 = load float, ptr %24, align 4
  %26 = fmul float %2, %25
  %27 = getelementptr [4 x i8], ptr %21, i64 %indvars.iv51
  %28 = load float, ptr %27, align 4
  %29 = fmul float %26, %28
  %30 = fadd float %23, %29
  store float %30, ptr %22, align 4
  %indvars.iv.next52 = or disjoint i64 %indvars.iv51, 1
  %31 = getelementptr [4 x i8], ptr %19, i64 %indvars.iv.next52
  %32 = load float, ptr %31, align 4
  %33 = fmul float %2, %32
  %34 = getelementptr [4 x i8], ptr %21, i64 %indvars.iv.next52
  %35 = load float, ptr %34, align 4
  %36 = fmul float %33, %35
  %37 = fadd float %30, %36
  store float %37, ptr %22, align 4
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %._crit_edge39.unr-lcssa, label %.preheader.new

._crit_edge39.unr-lcssa:                          ; preds = %.preheader.new
  br i1 %lcmp.mod.not, label %._crit_edge39, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge39.unr-lcssa, %.preheader
  %indvars.iv51.epil.init = phi i64 [ 0, %.preheader ], [ %indvars.iv.next52.1, %._crit_edge39.unr-lcssa ]
  %.epil.init = phi float [ %.promoted, %.preheader ], [ %37, %._crit_edge39.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod69)
  %38 = getelementptr [4 x i8], ptr %19, i64 %indvars.iv51.epil.init
  %39 = load float, ptr %38, align 4
  %40 = fmul float %2, %39
  %41 = getelementptr [4 x i8], ptr %21, i64 %indvars.iv51.epil.init
  %42 = load float, ptr %41, align 4
  %43 = fmul float %40, %42
  %44 = fadd float %.epil.init, %43
  store float %44, ptr %22, align 4
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.unr-lcssa, %.epil.preheader
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond60.not = icmp eq i64 %indvars.iv.next57, %wide.trip.count64
  br i1 %exitcond60.not, label %._crit_edge41, label %.preheader

._crit_edge41:                                    ; preds = %._crit_edge39
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond65.not = icmp eq i64 %indvars.iv.next62, %wide.trip.count64
  br i1 %exitcond65.not, label %._crit_edge43.split, label %.preheader33

._crit_edge43.split:                              ; preds = %._crit_edge41, %6, %.preheader34
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiPA1024_fS0_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2) local_unnamed_addr #4 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader.us.preheader, label %._crit_edge20

.preheader.us.preheader:                          ; preds = %3
  %wide.trip.count26 = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  %n.vec = and i64 %wide.trip.count26, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count26
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv23 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next24, %._crit_edge.us ]
  %.019.us = phi i32 [ 0, %.preheader.us.preheader ], [ %.2.us.lcssa, %._crit_edge.us ]
  %5 = getelementptr [4096 x i8], ptr %1, i64 %indvars.iv23
  %6 = getelementptr [4096 x i8], ptr %2, i64 %indvars.iv23
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader.us
  %7 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.019.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %7, %vector.ph ], [ %39, %vector.body ]
  %8 = getelementptr [4 x i8], ptr %5, i64 %index
  %wide.load = load <4 x float>, ptr %8, align 4
  %9 = fpext <4 x float> %wide.load to <4 x double>
  %10 = getelementptr [4 x i8], ptr %6, i64 %index
  %wide.load28 = load <4 x float>, ptr %10, align 4
  %11 = fpext <4 x float> %wide.load28 to <4 x double>
  %12 = fcmp olt <4 x double> %9, splat (double f0xB690000000000000)
  %13 = fneg <4 x float> %wide.load
  %14 = select <4 x i1> %12, <4 x float> %13, <4 x float> %wide.load
  %15 = fpext <4 x float> %14 to <4 x double>
  %16 = fcmp uge <4 x double> %15, splat (double 1.000000e-02)
  %17 = fcmp olt <4 x double> %11, splat (double f0xB690000000000000)
  %18 = fneg <4 x float> %wide.load28
  %19 = select <4 x i1> %17, <4 x float> %18, <4 x float> %wide.load28
  %20 = fpext <4 x float> %19 to <4 x double>
  %21 = fcmp uge <4 x double> %20, splat (double 1.000000e-02)
  %22 = fsub <4 x double> %9, %11
  %23 = fptrunc <4 x double> %22 to <4 x float>
  %24 = fcmp olt <4 x double> %22, splat (double f0xB690000000000000)
  %25 = fneg <4 x float> %23
  %26 = select <4 x i1> %24, <4 x float> %25, <4 x float> %23
  %27 = fadd <4 x double> %9, splat (double f0x3E45798EE0000000)
  %28 = fptrunc <4 x double> %27 to <4 x float>
  %29 = fcmp olt <4 x double> %27, splat (double f0xB690000000000000)
  %30 = fneg <4 x float> %28
  %31 = select <4 x i1> %29, <4 x float> %30, <4 x float> %28
  %32 = fdiv <4 x float> %26, %31
  %33 = fcmp olt <4 x float> %32, zeroinitializer
  %34 = fneg <4 x float> %32
  %35 = select <4 x i1> %33, <4 x float> %34, <4 x float> %32
  %36 = fmul <4 x float> %35, splat (float 1.000000e+02)
  %37 = fpext <4 x float> %36 to <4 x double>
  %38 = fcmp ogt <4 x double> %37, splat (double 5.000000e-02)
  %.not30 = select <4 x i1> %16, <4 x i1> splat (i1 true), <4 x i1> %21
  %narrow = select <4 x i1> %.not30, <4 x i1> %38, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %39 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %40 = icmp eq i64 %index.next, %n.vec
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %41 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %39)
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  %.117.us.ph = phi i32 [ %.019.us, %.preheader.us ], [ %41, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %_Z11percentDiffdd.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %.117.us = phi i32 [ %.2.us, %_Z11percentDiffdd.exit.us ], [ %.117.us.ph, %scalar.ph.preheader ]
  %42 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv
  %43 = load float, ptr %42, align 4
  %44 = fpext float %43 to double
  %45 = getelementptr [4 x i8], ptr %6, i64 %indvars.iv
  %46 = load float, ptr %45, align 4
  %47 = fpext float %46 to double
  %48 = fcmp olt double %44, f0xB690000000000000
  %49 = fneg float %43
  %common.ret.op.i.i.us = select i1 %48, float %49, float %43
  %50 = fpext float %common.ret.op.i.i.us to double
  %51 = fcmp olt double %50, 1.000000e-02
  br i1 %51, label %52, label %.critedge.i.us

52:                                               ; preds = %scalar.ph
  %53 = fcmp olt double %47, f0xB690000000000000
  %54 = fneg float %46
  %common.ret.op.i7.i.us = select i1 %53, float %54, float %46
  %55 = fpext float %common.ret.op.i7.i.us to double
  %56 = fcmp olt double %55, 1.000000e-02
  br i1 %56, label %_Z11percentDiffdd.exit.us, label %.critedge.i.us

.critedge.i.us:                                   ; preds = %52, %scalar.ph
  %57 = insertelement <2 x double> poison, double %44, i64 0
  %58 = shufflevector <2 x double> %57, <2 x double> poison, <2 x i32> zeroinitializer
  %59 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %47, i64 0
  %60 = fsub <2 x double> %58, %59
  %61 = fptrunc <2 x double> %60 to <2 x float>
  %62 = fcmp olt <2 x double> %60, splat (double f0xB690000000000000)
  %63 = fneg <2 x float> %61
  %64 = select <2 x i1> %62, <2 x float> %63, <2 x float> %61
  %65 = extractelement <2 x float> %64, i64 0
  %66 = extractelement <2 x float> %64, i64 1
  %67 = fdiv float %65, %66
  %68 = fcmp olt float %67, 0.000000e+00
  %69 = fneg float %67
  %common.ret.op.i10.i.us = select i1 %68, float %69, float %67
  %70 = fmul float %common.ret.op.i10.i.us, 1.000000e+02
  %71 = fpext float %70 to double
  %72 = fcmp ogt double %71, 5.000000e-02
  %73 = zext i1 %72 to i32
  br label %_Z11percentDiffdd.exit.us

_Z11percentDiffdd.exit.us:                        ; preds = %.critedge.i.us, %52
  %common.ret.op.i.us = phi i32 [ %73, %.critedge.i.us ], [ 0, %52 ]
  %.2.us = add nsw i32 %common.ret.op.i.us, %.117.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count26
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !10

._crit_edge.us:                                   ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %.2.us.lcssa = phi i32 [ %41, %middle.block ], [ %.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27.not = icmp eq i64 %indvars.iv.next24, %wide.trip.count26
  br i1 %exitcond27.not, label %._crit_edge20, label %.preheader.us

._crit_edge20:                                    ; preds = %._crit_edge.us, %3
  %.0.lcssa = phi i32 [ 0, %3 ], [ %.2.us.lcssa, %._crit_edge.us ]
  %74 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %.0.lcssa) #5
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #5

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #5

define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #6 {
  %1 = alloca %struct.cudaDeviceProp, align 8
  %2 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %1, i32 noundef 0) #5
  %3 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %1) #5
  %4 = call i32 @cudaSetDevice(i32 noundef 0) #5
  ret void
}

declare dso_local i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare dso_local i32 @cudaLaunchKernel(ptr, %struct.dim3, %struct.dim3, ptr, i64, ptr) local_unnamed_addr

define dso_local void @_Z26__device_stub__syrk_kerneliiffPfS_(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr noundef %4, ptr noundef %5) #6 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store float %2, ptr %9, align 4
  store float %3, ptr %10, align 4
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  %13 = alloca [6 x ptr], align 16
  store ptr %7, ptr %13, align 16
  %14 = getelementptr inbounds nuw i8, ptr %13, i64 8
  store ptr %8, ptr %14, align 8
  %15 = getelementptr inbounds nuw i8, ptr %13, i64 16
  store ptr %9, ptr %15, align 16
  %16 = getelementptr inbounds nuw i8, ptr %13, i64 24
  store ptr %10, ptr %16, align 8
  %17 = getelementptr inbounds nuw i8, ptr %13, i64 32
  store ptr %11, ptr %17, align 16
  %18 = getelementptr inbounds nuw i8, ptr %13, i64 40
  store ptr %12, ptr %18, align 8
  %19 = alloca %struct.dim3, align 8
  %20 = alloca %struct.dim3, align 8
  %21 = alloca i64, align 8
  %22 = alloca ptr, align 8
  %23 = call i32 @__cudaPopCallConfiguration(ptr nonnull %19, ptr nonnull %20, ptr nonnull %21, ptr nonnull %22)
  %24 = load i64, ptr %21, align 8
  %25 = load ptr, ptr %22, align 8
  %.fca.0.load2 = load i32, ptr %19, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %19, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %19, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %20, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %20, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %20, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %26 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__syrk_kerneliiffPfS_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %13, i64 noundef %24, ptr noundef %25)
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #5

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i32 @gettimeofday(ptr noalias noundef nonnull captures(none), ptr noalias noundef captures(none)) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #4 {
  %1 = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #14
  %.not.i = icmp eq i32 %2, 0
  br i1 %.not.i, label %_ZL7rtclockv.exit, label %3

3:                                                ; preds = %0
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %2) #5
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

declare i32 @__cudaPushCallConfiguration(%struct.dim3, %struct.dim3, i64 noundef, ptr noundef) local_unnamed_addr #5

declare i32 @cudaThreadSynchronize() local_unnamed_addr #5

; Function Attrs: nofree nounwind
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #4 {
  %1 = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #14
  %.not.i = icmp eq i32 %2, 0
  br i1 %.not.i, label %_ZL7rtclockv.exit, label %3

3:                                                ; preds = %0
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %2) #5
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
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #4 {
  %1 = load double, ptr @polybench_t_end, align 8
  %2 = load double, ptr @polybench_t_start, align 8
  %3 = fsub double %1, %2
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %3) #5
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #5

define dso_local void @_Z8syrkCudaiiffPA1024_fS0_S0_(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) local_unnamed_addr #6 {
  %8 = alloca %struct.timeval, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca [6 x ptr], align 16
  %16 = alloca %struct.dim3, align 8
  %17 = alloca %struct.dim3, align 8
  %18 = alloca i64, align 8
  %19 = alloca ptr, align 8
  %20 = alloca %struct.timeval, align 8
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = call i32 @cudaMalloc(ptr noundef nonnull %21, i64 noundef 4194304) #5
  %24 = call i32 @cudaMalloc(ptr noundef nonnull %22, i64 noundef 4194304) #5
  %25 = load ptr, ptr %21, align 8
  %26 = call i32 @cudaMemcpy(ptr noundef %25, ptr noundef %4, i64 noundef 4194304, i32 noundef 1) #5
  %27 = load ptr, ptr %22, align 8
  %28 = call i32 @cudaMemcpy(ptr noundef %27, ptr noundef %5, i64 noundef 4194304, i32 noundef 1) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %20)
  %29 = call i32 @gettimeofday(ptr noundef nonnull %20, ptr noundef null) #14
  %.not.i.i = icmp eq i32 %29, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %30

30:                                               ; preds = %7
  %31 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %29) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %7, %30
  %32 = load i64, ptr %20, align 8
  %33 = sitofp i64 %32 to double
  %34 = getelementptr inbounds nuw i8, ptr %20, i64 8
  %35 = load i64, ptr %34, align 8
  %36 = sitofp i64 %35 to double
  %37 = fmul nnan double %36, f0x3EB0C6F7A0B5ED8D
  %38 = fadd double %37, %33
  call void @llvm.lifetime.end.p0(ptr nonnull %20)
  store double %38, ptr @polybench_t_start, align 8
  %39 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 32, i32 128, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %39, 0
  br i1 %.not, label %40, label %52

40:                                               ; preds = %_Z21polybench_timer_startv.exit
  %41 = load ptr, ptr %21, align 8
  %42 = load ptr, ptr %22, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  call void @llvm.lifetime.start.p0(ptr nonnull %15)
  call void @llvm.lifetime.start.p0(ptr nonnull %16)
  call void @llvm.lifetime.start.p0(ptr nonnull %17)
  call void @llvm.lifetime.start.p0(ptr nonnull %18)
  call void @llvm.lifetime.start.p0(ptr nonnull %19)
  store i32 %0, ptr %9, align 4
  store i32 %1, ptr %10, align 4
  store float %2, ptr %11, align 4
  store float %3, ptr %12, align 4
  store ptr %41, ptr %13, align 8
  store ptr %42, ptr %14, align 8
  store ptr %9, ptr %15, align 16
  %43 = getelementptr inbounds nuw i8, ptr %15, i64 8
  store ptr %10, ptr %43, align 8
  %44 = getelementptr inbounds nuw i8, ptr %15, i64 16
  store ptr %11, ptr %44, align 16
  %45 = getelementptr inbounds nuw i8, ptr %15, i64 24
  store ptr %12, ptr %45, align 8
  %46 = getelementptr inbounds nuw i8, ptr %15, i64 32
  store ptr %13, ptr %46, align 16
  %47 = getelementptr inbounds nuw i8, ptr %15, i64 40
  store ptr %14, ptr %47, align 8
  %48 = call i32 @__cudaPopCallConfiguration(ptr nonnull %16, ptr nonnull %17, ptr nonnull %18, ptr nonnull %19), !inline_history !11
  %49 = load i64, ptr %18, align 8
  %50 = load ptr, ptr %19, align 8
  %.fca.0.load2.i = load i32, ptr %16, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %16, i64 4
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %16, i64 8
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %17, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %17, i64 4
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %17, i64 8
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %51 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__syrk_kerneliiffPfS_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %15, i64 noundef %49, ptr noundef %50), !inline_history !11
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  call void @llvm.lifetime.end.p0(ptr nonnull %13)
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  call void @llvm.lifetime.end.p0(ptr nonnull %15)
  call void @llvm.lifetime.end.p0(ptr nonnull %16)
  call void @llvm.lifetime.end.p0(ptr nonnull %17)
  call void @llvm.lifetime.end.p0(ptr nonnull %18)
  call void @llvm.lifetime.end.p0(ptr nonnull %19)
  br label %52

52:                                               ; preds = %_Z21polybench_timer_startv.exit, %40
  %53 = call i32 @cudaThreadSynchronize() #5
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  %54 = call i32 @gettimeofday(ptr noundef nonnull %8, ptr noundef null) #14
  %.not.i.i12 = icmp eq i32 %54, 0
  br i1 %.not.i.i12, label %_Z20polybench_timer_stopv.exit, label %55

55:                                               ; preds = %52
  %56 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %54) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %52, %55
  %57 = load i64, ptr %8, align 8
  %58 = sitofp i64 %57 to double
  %59 = getelementptr inbounds nuw i8, ptr %8, i64 8
  %60 = load i64, ptr %59, align 8
  %61 = sitofp i64 %60 to double
  %62 = fmul nnan double %61, f0x3EB0C6F7A0B5ED8D
  %63 = fadd double %62, %58
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  store double %63, ptr @polybench_t_end, align 8
  %64 = load double, ptr @polybench_t_start, align 8
  %65 = fsub double %63, %64
  %66 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %65) #5
  %67 = load ptr, ptr %22, align 8
  %68 = call i32 @cudaMemcpy(ptr noundef %6, ptr noundef %67, i64 noundef 4194304, i32 noundef 2) #5
  %69 = load ptr, ptr %21, align 8
  %70 = call i32 @cudaFree(ptr noundef %69) #5
  %71 = load ptr, ptr %22, align 8
  %72 = call i32 @cudaFree(ptr noundef %71) #5
  ret void
}

; Function Attrs: nofree
declare i32 @posix_memalign(ptr noundef nonnull, i64 noundef, i64 noundef) local_unnamed_addr #7

; Function Attrs: nofree noreturn
declare void @exit(i32 noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %0, i32 noundef %1) local_unnamed_addr #4 {
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

define dso_local noundef i32 @main() local_unnamed_addr #6 {
  %1 = alloca %struct.timeval, align 8
  %2 = alloca %struct.timeval, align 8
  %3 = alloca %struct.cudaDeviceProp, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %7 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 4194304) #14
  %8 = load ptr, ptr %6, align 8
  %.not.i.i = icmp eq ptr %8, null
  %9 = icmp ne i32 %7, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %9
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %0
  %10 = load ptr, ptr @stderr, align 8
  %11 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %10) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %0
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  store ptr null, ptr %5, align 8
  %12 = call i32 @posix_memalign(ptr noundef nonnull %5, i64 noundef 32, i64 noundef 4194304) #14
  %13 = load ptr, ptr %5, align 8
  %.not.i.i19 = icmp eq ptr %13, null
  %14 = icmp ne i32 %12, 0
  %or.cond.i.i20 = select i1 %.not.i.i19, i1 true, i1 %14
  br i1 %or.cond.i.i20, label %.critedge.i.i21, label %_Z20polybench_alloc_datayi.exit22

.critedge.i.i21:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %15 = load ptr, ptr @stderr, align 8
  %16 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %15) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit22:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store ptr null, ptr %4, align 8
  %17 = call i32 @posix_memalign(ptr noundef nonnull %4, i64 noundef 32, i64 noundef 4194304) #14
  %18 = load ptr, ptr %4, align 8
  %.not.i.i23 = icmp eq ptr %18, null
  %19 = icmp ne i32 %17, 0
  %or.cond.i.i24 = select i1 %.not.i.i23, i1 true, i1 %19
  br i1 %or.cond.i.i24, label %.critedge.i.i25, label %_Z20polybench_alloc_datayi.exit26

.critedge.i.i25:                                  ; preds = %_Z20polybench_alloc_datayi.exit22
  %20 = load ptr, ptr @stderr, align 8
  %21 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %20) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit26:                ; preds = %_Z20polybench_alloc_datayi.exit22
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  br label %.preheader30.i

.preheader30.i:                                   ; preds = %._crit_edge.i, %_Z20polybench_alloc_datayi.exit26
  %indvars.iv38.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit26 ], [ %indvars.iv.next39.i, %._crit_edge.i ]
  %22 = getelementptr [4096 x i8], ptr %8, i64 %indvars.iv38.i
  %23 = trunc nuw nsw i64 %indvars.iv38.i to i32
  %24 = uitofp nneg i32 %23 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %24, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader30.i
  %index = phi i64 [ 0, %.preheader30.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader30.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %25 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %26 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %27 = fmul nnan <4 x float> %broadcast.splat, %25
  %28 = fmul nnan <4 x float> %broadcast.splat, %26
  %29 = fmul nnan <4 x float> %27, splat (float f0x3A800000)
  %30 = fmul nnan <4 x float> %28, splat (float f0x3A800000)
  %31 = getelementptr [4 x i8], ptr %22, i64 %index
  %32 = getelementptr i8, ptr %31, i64 16
  store <4 x float> %29, ptr %31, align 4
  store <4 x float> %30, ptr %32, align 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %33 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %34 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %35 = fmul nnan <4 x float> %broadcast.splat, %33
  %36 = fmul nnan <4 x float> %broadcast.splat, %34
  %37 = fmul nnan <4 x float> %35, splat (float f0x3A800000)
  %38 = fmul nnan <4 x float> %36, splat (float f0x3A800000)
  %39 = getelementptr [4 x i8], ptr %22, i64 %index
  %40 = getelementptr i8, ptr %39, i64 32
  %41 = getelementptr i8, ptr %39, i64 48
  store <4 x float> %37, ptr %40, align 4
  store <4 x float> %38, ptr %41, align 4
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %42 = icmp eq i64 %index.next.1, 1024
  br i1 %42, label %._crit_edge.i, label %vector.body, !llvm.loop !12

._crit_edge.i:                                    ; preds = %vector.body
  %indvars.iv.next39.i = add nuw nsw i64 %indvars.iv38.i, 1
  %exitcond42.not.i = icmp eq i64 %indvars.iv.next39.i, 1024
  br i1 %exitcond42.not.i, label %.preheader.i, label %.preheader30.i

.preheader.i:                                     ; preds = %._crit_edge.i, %._crit_edge34.i
  %indvars.iv48.i = phi i64 [ %indvars.iv.next49.i, %._crit_edge34.i ], [ 0, %._crit_edge.i ]
  %43 = getelementptr [4096 x i8], ptr %13, i64 %indvars.iv48.i
  %44 = trunc nuw nsw i64 %indvars.iv48.i to i32
  %45 = uitofp nneg i32 %44 to float
  %broadcast.splatinsert45 = insertelement <4 x float> poison, float %45, i64 0
  %broadcast.splat46 = shufflevector <4 x float> %broadcast.splatinsert45, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body47

vector.body47:                                    ; preds = %vector.body47, %.preheader.i
  %index48 = phi i64 [ 0, %.preheader.i ], [ %index.next51.1, %vector.body47 ]
  %vec.ind49 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader.i ], [ %vec.ind.next52.1, %vector.body47 ]
  %step.add50 = add <4 x i32> %vec.ind49, splat (i32 4)
  %46 = uitofp nneg <4 x i32> %vec.ind49 to <4 x float>
  %47 = uitofp nneg <4 x i32> %step.add50 to <4 x float>
  %48 = fmul nnan <4 x float> %broadcast.splat46, %46
  %49 = fmul nnan <4 x float> %broadcast.splat46, %47
  %50 = fmul nnan <4 x float> %48, splat (float f0x3A800000)
  %51 = fmul nnan <4 x float> %49, splat (float f0x3A800000)
  %52 = getelementptr [4 x i8], ptr %43, i64 %index48
  %53 = getelementptr i8, ptr %52, i64 16
  store <4 x float> %50, ptr %52, align 4
  store <4 x float> %51, ptr %53, align 4
  %vec.ind.next52 = add <4 x i32> %vec.ind49, splat (i32 8)
  %step.add50.1 = add <4 x i32> %vec.ind49, splat (i32 12)
  %54 = uitofp nneg <4 x i32> %vec.ind.next52 to <4 x float>
  %55 = uitofp nneg <4 x i32> %step.add50.1 to <4 x float>
  %56 = fmul nnan <4 x float> %broadcast.splat46, %54
  %57 = fmul nnan <4 x float> %broadcast.splat46, %55
  %58 = fmul nnan <4 x float> %56, splat (float f0x3A800000)
  %59 = fmul nnan <4 x float> %57, splat (float f0x3A800000)
  %60 = getelementptr [4 x i8], ptr %43, i64 %index48
  %61 = getelementptr i8, ptr %60, i64 32
  %62 = getelementptr i8, ptr %60, i64 48
  store <4 x float> %58, ptr %61, align 4
  store <4 x float> %59, ptr %62, align 4
  %index.next51.1 = add nuw nsw i64 %index48, 16
  %vec.ind.next52.1 = add <4 x i32> %vec.ind49, splat (i32 16)
  %63 = icmp eq i64 %index.next51.1, 1024
  br i1 %63, label %._crit_edge34.i, label %vector.body47, !llvm.loop !13

._crit_edge34.i:                                  ; preds = %vector.body47
  %indvars.iv.next49.i = add nuw nsw i64 %indvars.iv48.i, 1
  %exitcond52.not.i = icmp eq i64 %indvars.iv.next49.i, 1024
  br i1 %exitcond52.not.i, label %_Z11init_arraysiiPfS_PA1024_fS1_.exit, label %.preheader.i

_Z11init_arraysiiPfS_PA1024_fS1_.exit:            ; preds = %._crit_edge34.i
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %64 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %3, i32 noundef 0) #5
  %65 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %3) #5
  %66 = call i32 @cudaSetDevice(i32 noundef 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  call void @_Z8syrkCudaiiffPA1024_fS0_S0_(i32 noundef 1024, i32 noundef 1024, float noundef 3.241200e+04, float noundef 2.123000e+03, ptr noundef %8, ptr noundef nonnull %13, ptr noundef %18) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %67 = call i32 @gettimeofday(ptr noundef nonnull %2, ptr noundef null) #14
  %.not.i.i27 = icmp eq i32 %67, 0
  br i1 %.not.i.i27, label %_Z21polybench_timer_startv.exit, label %68

68:                                               ; preds = %_Z11init_arraysiiPfS_PA1024_fS1_.exit
  %69 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %67) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z11init_arraysiiPfS_PA1024_fS1_.exit, %68
  %70 = load i64, ptr %2, align 8
  %71 = sitofp i64 %70 to double
  %72 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %73 = load i64, ptr %72, align 8
  %74 = sitofp i64 %73 to double
  %75 = fmul nnan double %74, f0x3EB0C6F7A0B5ED8D
  %76 = fadd double %75, %71
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  store double %76, ptr @polybench_t_start, align 8
  br label %.preheader35.i

.preheader35.i:                                   ; preds = %._crit_edge.i31, %_Z21polybench_timer_startv.exit
  %indvars.iv46.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next47.i, %._crit_edge.i31 ]
  %77 = getelementptr [4096 x i8], ptr %13, i64 %indvars.iv46.i
  br label %vector.body55

vector.body55:                                    ; preds = %vector.body55, %.preheader35.i
  %index56 = phi i64 [ 0, %.preheader35.i ], [ %index.next58.1, %vector.body55 ]
  %78 = getelementptr [4 x i8], ptr %77, i64 %index56
  %79 = getelementptr i8, ptr %78, i64 16
  %wide.load = load <4 x float>, ptr %78, align 4
  %wide.load57 = load <4 x float>, ptr %79, align 4
  %80 = fmul <4 x float> %wide.load, splat (float 2.123000e+03)
  %81 = fmul <4 x float> %wide.load57, splat (float 2.123000e+03)
  store <4 x float> %80, ptr %78, align 4
  store <4 x float> %81, ptr %79, align 4
  %82 = getelementptr [4 x i8], ptr %77, i64 %index56
  %83 = getelementptr i8, ptr %82, i64 32
  %84 = getelementptr i8, ptr %82, i64 48
  %wide.load.1 = load <4 x float>, ptr %83, align 4
  %wide.load57.1 = load <4 x float>, ptr %84, align 4
  %85 = fmul <4 x float> %wide.load.1, splat (float 2.123000e+03)
  %86 = fmul <4 x float> %wide.load57.1, splat (float 2.123000e+03)
  store <4 x float> %85, ptr %83, align 4
  store <4 x float> %86, ptr %84, align 4
  %index.next58.1 = add nuw nsw i64 %index56, 16
  %87 = icmp eq i64 %index.next58.1, 1024
  br i1 %87, label %._crit_edge.i31, label %vector.body55, !llvm.loop !14

._crit_edge.i31:                                  ; preds = %vector.body55
  %indvars.iv.next47.i = add nuw nsw i64 %indvars.iv46.i, 1
  %exitcond50.not.i = icmp eq i64 %indvars.iv.next47.i, 1024
  br i1 %exitcond50.not.i, label %.preheader33.i, label %.preheader35.i

.preheader33.i:                                   ; preds = %._crit_edge.i31, %._crit_edge41.i
  %indvars.iv61.i = phi i64 [ %indvars.iv.next62.i, %._crit_edge41.i ], [ 0, %._crit_edge.i31 ]
  %88 = getelementptr [4096 x i8], ptr %8, i64 %indvars.iv61.i
  %89 = getelementptr [4096 x i8], ptr %13, i64 %indvars.iv61.i
  br label %.preheader.i32

.preheader.i32:                                   ; preds = %._crit_edge39.i, %.preheader33.i
  %indvars.iv56.i = phi i64 [ 0, %.preheader33.i ], [ %indvars.iv.next57.i, %._crit_edge39.i ]
  %90 = getelementptr [4096 x i8], ptr %8, i64 %indvars.iv56.i
  %91 = getelementptr [4 x i8], ptr %89, i64 %indvars.iv56.i
  %.promoted.i = load float, ptr %91, align 4
  br label %92

92:                                               ; preds = %92, %.preheader.i32
  %indvars.iv51.i = phi i64 [ 0, %.preheader.i32 ], [ %indvars.iv.next52.i.1, %92 ]
  %93 = phi float [ %.promoted.i, %.preheader.i32 ], [ %107, %92 ]
  %94 = getelementptr [4 x i8], ptr %88, i64 %indvars.iv51.i
  %95 = load float, ptr %94, align 4
  %96 = fmul float %95, 3.241200e+04
  %97 = getelementptr [4 x i8], ptr %90, i64 %indvars.iv51.i
  %98 = load float, ptr %97, align 4
  %99 = fmul float %96, %98
  %100 = fadd float %93, %99
  store float %100, ptr %91, align 4
  %indvars.iv.next52.i = or disjoint i64 %indvars.iv51.i, 1
  %101 = getelementptr [4 x i8], ptr %88, i64 %indvars.iv.next52.i
  %102 = load float, ptr %101, align 4
  %103 = fmul float %102, 3.241200e+04
  %104 = getelementptr [4 x i8], ptr %90, i64 %indvars.iv.next52.i
  %105 = load float, ptr %104, align 4
  %106 = fmul float %103, %105
  %107 = fadd float %100, %106
  store float %107, ptr %91, align 4
  %indvars.iv.next52.i.1 = add nuw nsw i64 %indvars.iv51.i, 2
  %exitcond55.not.i.1 = icmp eq i64 %indvars.iv.next52.i.1, 1024
  br i1 %exitcond55.not.i.1, label %._crit_edge39.i, label %92

._crit_edge39.i:                                  ; preds = %92
  %indvars.iv.next57.i = add nuw nsw i64 %indvars.iv56.i, 1
  %exitcond60.not.i = icmp eq i64 %indvars.iv.next57.i, 1024
  br i1 %exitcond60.not.i, label %._crit_edge41.i, label %.preheader.i32

._crit_edge41.i:                                  ; preds = %._crit_edge39.i
  %indvars.iv.next62.i = add nuw nsw i64 %indvars.iv61.i, 1
  %exitcond65.not.i = icmp eq i64 %indvars.iv.next62.i, 1024
  br i1 %exitcond65.not.i, label %_Z4syrkiiffPA1024_fS0_.exit, label %.preheader33.i

_Z4syrkiiffPA1024_fS0_.exit:                      ; preds = %._crit_edge41.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %108 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #14
  %.not.i.i33 = icmp eq i32 %108, 0
  br i1 %.not.i.i33, label %_Z20polybench_timer_stopv.exit, label %109

109:                                              ; preds = %_Z4syrkiiffPA1024_fS0_.exit
  %110 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %108) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z4syrkiiffPA1024_fS0_.exit, %109
  %111 = load i64, ptr %1, align 8
  %112 = sitofp i64 %111 to double
  %113 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %114 = load i64, ptr %113, align 8
  %115 = sitofp i64 %114 to double
  %116 = fmul nnan double %115, f0x3EB0C6F7A0B5ED8D
  %117 = fadd double %116, %112
  call void @llvm.lifetime.end.p0(ptr nonnull %1)
  store double %117, ptr @polybench_t_end, align 8
  %118 = load double, ptr @polybench_t_start, align 8
  %119 = fsub double %117, %118
  %120 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %119) #5
  br label %.preheader.us.i

.preheader.us.i:                                  ; preds = %._crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv23.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next24.i, %._crit_edge.us.i ]
  %.019.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %157, %._crit_edge.us.i ]
  %121 = getelementptr [4096 x i8], ptr %13, i64 %indvars.iv23.i
  %122 = getelementptr [4096 x i8], ptr %18, i64 %indvars.iv23.i
  %123 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.019.us.i, i64 0
  br label %vector.body61

vector.body61:                                    ; preds = %vector.body61, %.preheader.us.i
  %index62 = phi i64 [ 0, %.preheader.us.i ], [ %index.next65, %vector.body61 ]
  %vec.phi = phi <4 x i32> [ %123, %.preheader.us.i ], [ %155, %vector.body61 ]
  %124 = getelementptr [4 x i8], ptr %121, i64 %index62
  %wide.load63 = load <4 x float>, ptr %124, align 4
  %125 = fpext <4 x float> %wide.load63 to <4 x double>
  %126 = getelementptr [4 x i8], ptr %122, i64 %index62
  %wide.load64 = load <4 x float>, ptr %126, align 4
  %127 = fpext <4 x float> %wide.load64 to <4 x double>
  %128 = fcmp olt <4 x double> %125, splat (double f0xB690000000000000)
  %129 = fneg <4 x float> %wide.load63
  %130 = select <4 x i1> %128, <4 x float> %129, <4 x float> %wide.load63
  %131 = fpext <4 x float> %130 to <4 x double>
  %132 = fcmp uge <4 x double> %131, splat (double 1.000000e-02)
  %133 = fcmp olt <4 x double> %127, splat (double f0xB690000000000000)
  %134 = fneg <4 x float> %wide.load64
  %135 = select <4 x i1> %133, <4 x float> %134, <4 x float> %wide.load64
  %136 = fpext <4 x float> %135 to <4 x double>
  %137 = fcmp uge <4 x double> %136, splat (double 1.000000e-02)
  %138 = fsub <4 x double> %125, %127
  %139 = fptrunc <4 x double> %138 to <4 x float>
  %140 = fcmp olt <4 x double> %138, splat (double f0xB690000000000000)
  %141 = fneg <4 x float> %139
  %142 = select <4 x i1> %140, <4 x float> %141, <4 x float> %139
  %143 = fadd <4 x double> %125, splat (double f0x3E45798EE0000000)
  %144 = fptrunc <4 x double> %143 to <4 x float>
  %145 = fcmp olt <4 x double> %143, splat (double f0xB690000000000000)
  %146 = fneg <4 x float> %144
  %147 = select <4 x i1> %145, <4 x float> %146, <4 x float> %144
  %148 = fdiv <4 x float> %142, %147
  %149 = fcmp olt <4 x float> %148, zeroinitializer
  %150 = fneg <4 x float> %148
  %151 = select <4 x i1> %149, <4 x float> %150, <4 x float> %148
  %152 = fmul <4 x float> %151, splat (float 1.000000e+02)
  %153 = fpext <4 x float> %152 to <4 x double>
  %154 = fcmp ogt <4 x double> %153, splat (double 5.000000e-02)
  %.not68 = select <4 x i1> %132, <4 x i1> splat (i1 true), <4 x i1> %137
  %narrow = select <4 x i1> %.not68, <4 x i1> %154, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %155 = add <4 x i32> %vec.phi, %predphi
  %index.next65 = add nuw i64 %index62, 4
  %156 = icmp eq i64 %index.next65, 1024
  br i1 %156, label %._crit_edge.us.i, label %vector.body61, !llvm.loop !15

._crit_edge.us.i:                                 ; preds = %vector.body61
  %157 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %155)
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1
  %exitcond27.not.i = icmp eq i64 %indvars.iv.next24.i, 1024
  br i1 %exitcond27.not.i, label %_Z14compareResultsiPA1024_fS0_.exit, label %.preheader.us.i

_Z14compareResultsiPA1024_fS0_.exit:              ; preds = %._crit_edge.us.i
  %158 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %157) #5
  call void @free(ptr noundef %8) #14
  call void @free(ptr noundef nonnull %13) #14
  call void @free(ptr noundef nonnull %18) #14
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

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #12

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #13

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: write) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #3 = { nofree nounwind "uniform-work-group-size" }
attributes #4 = { nofree nounwind "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #5 = { "uniform-work-group-size" }
attributes #6 = { "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #7 = { nofree "uniform-work-group-size" }
attributes #8 = { nofree noreturn "uniform-work-group-size" }
attributes #9 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "uniform-work-group-size" }
attributes #10 = { nofree nounwind }
attributes #11 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #13 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #14 = { nounwind "uniform-work-group-size" }
attributes #15 = { cold }
attributes #16 = { cold noreturn nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.isvectorized", i32 1}
!3 = !{!"llvm.loop.unroll.runtime.disable"}
!4 = distinct !{!4, !3, !2}
!5 = distinct !{!5, !2, !3}
!6 = distinct !{!6, !3, !2}
!7 = distinct !{!7, !2, !3}
!8 = distinct !{!8, !3, !2}
!9 = distinct !{!9, !2, !3}
!10 = distinct !{!10, !3, !2}
!11 = !{ptr @_Z26__device_stub__syrk_kerneliiffPfS_}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !2, !3}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
