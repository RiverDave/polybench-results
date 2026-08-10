; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GEMM/gemm.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GEMM/gemm.cu"
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
define dso_local void @_Z4gemmiiiffPA512_fS0_S0_(i32 noundef %0, i32 noundef %1, i32 noundef %2, float noundef %3, float noundef %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef captures(none) %7) local_unnamed_addr #1 {
  %9 = icmp sgt i32 %0, 0
  %10 = icmp sgt i32 %1, 0
  %or.cond = and i1 %9, %10
  br i1 %or.cond, label %.preheader.lr.ph.split, label %._crit_edge.split

.preheader.lr.ph.split:                           ; preds = %8
  %11 = icmp sgt i32 %2, 0
  %wide.trip.count51 = zext nneg i32 %0 to i64
  %wide.trip.count46 = zext nneg i32 %1 to i64
  br i1 %11, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph.split
  %min.iters.check = icmp ult i32 %1, 8
  %n.vec = and i64 %wide.trip.count46, 2147483640
  %broadcast.splatinsert = insertelement <4 x float> poison, float %4, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count46
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph.split
  %wide.trip.count41 = zext nneg i32 %2 to i64
  %xtraiter = and i64 %wide.trip.count41, 1
  %12 = icmp eq i32 %2, 1
  %unroll_iter = and i64 %wide.trip.count41, 2147483646
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod59 = trunc i32 %2 to i1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge27.split.us.us
  %indvars.iv48 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next49, %._crit_edge27.split.us.us ]
  %13 = getelementptr [2048 x i8], ptr %7, i64 %indvars.iv48
  %14 = getelementptr [2048 x i8], ptr %5, i64 %indvars.iv48
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.preheader.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge.us.us ], [ 0, %.preheader.us ]
  %15 = getelementptr [4 x i8], ptr %13, i64 %indvars.iv43
  %16 = load float, ptr %15, align 4
  %17 = fmul float %4, %16
  store float %17, ptr %15, align 4
  %invariant.gep.us.us = getelementptr [4 x i8], ptr %6, i64 %indvars.iv43
  br i1 %12, label %.epil.preheader, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %18 = phi float [ %30, %.lr.ph.us.us.new ], [ %17, %.lr.ph.us.us ]
  %niter = phi i64 [ %niter.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %19 = getelementptr [4 x i8], ptr %14, i64 %indvars.iv38
  %20 = load float, ptr %19, align 4
  %21 = fmul float %3, %20
  %gep.us.us = getelementptr [2048 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv38
  %22 = load float, ptr %gep.us.us, align 4
  %23 = fmul float %21, %22
  %24 = fadd float %18, %23
  store float %24, ptr %15, align 4
  %indvars.iv.next39 = or disjoint i64 %indvars.iv38, 1
  %25 = getelementptr [4 x i8], ptr %14, i64 %indvars.iv.next39
  %26 = load float, ptr %25, align 4
  %27 = fmul float %3, %26
  %gep.us.us.1 = getelementptr [2048 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv.next39
  %28 = load float, ptr %gep.us.us.1, align 4
  %29 = fmul float %27, %28
  %30 = fadd float %24, %29
  store float %30, ptr %15, align 4
  %indvars.iv.next39.1 = add nuw nsw i64 %indvars.iv38, 2
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %._crit_edge.us.us.unr-lcssa, label %.lr.ph.us.us.new

._crit_edge.us.us.unr-lcssa:                      ; preds = %.lr.ph.us.us.new
  br i1 %lcmp.mod.not, label %._crit_edge.us.us, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.us.us.unr-lcssa, %.lr.ph.us.us
  %indvars.iv38.epil.init = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next39.1, %._crit_edge.us.us.unr-lcssa ]
  %.epil.init = phi float [ %17, %.lr.ph.us.us ], [ %30, %._crit_edge.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod59)
  %31 = getelementptr [4 x i8], ptr %14, i64 %indvars.iv38.epil.init
  %32 = load float, ptr %31, align 4
  %33 = fmul float %3, %32
  %gep.us.us.epil = getelementptr [2048 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv38.epil.init
  %34 = load float, ptr %gep.us.us.epil, align 4
  %35 = fmul float %33, %34
  %36 = fadd float %.epil.init, %35
  store float %36, ptr %15, align 4
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.unr-lcssa, %.epil.preheader
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond47.not = icmp eq i64 %indvars.iv.next44, %wide.trip.count46
  br i1 %exitcond47.not, label %._crit_edge27.split.us.us, label %.lr.ph.us.us

._crit_edge27.split.us.us:                        ; preds = %._crit_edge.us.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond52.not = icmp eq i64 %indvars.iv.next49, %wide.trip.count51
  br i1 %exitcond52.not, label %._crit_edge.split, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge27.split
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge27.split ], [ 0, %.preheader.preheader ]
  %37 = getelementptr [2048 x i8], ptr %7, i64 %indvars.iv33
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.body

vector.body:                                      ; preds = %.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader ]
  %38 = getelementptr [4 x i8], ptr %37, i64 %index
  %39 = getelementptr i8, ptr %38, i64 16
  %wide.load = load <4 x float>, ptr %38, align 4
  %wide.load57 = load <4 x float>, ptr %39, align 4
  %40 = fmul <4 x float> %broadcast.splat, %wide.load
  %41 = fmul <4 x float> %broadcast.splat, %wide.load57
  store <4 x float> %40, ptr %38, align 4
  store <4 x float> %41, ptr %39, align 4
  %index.next = add nuw i64 %index, 8
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge27.split, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %43 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv
  %44 = load float, ptr %43, align 4
  %45 = fmul float %4, %44
  store float %45, ptr %43, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count46
  br i1 %exitcond.not, label %._crit_edge27.split, label %scalar.ph, !llvm.loop !4

._crit_edge27.split:                              ; preds = %scalar.ph, %middle.block
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond37.not = icmp eq i64 %indvars.iv.next34, %wide.trip.count51
  br i1 %exitcond37.not, label %._crit_edge.split, label %.preheader

._crit_edge.split:                                ; preds = %._crit_edge27.split, %._crit_edge27.split.us.us, %8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: write)
define dso_local void @_Z4initiiiPfS_PA512_fS1_S1_(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %3, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %4, ptr nofree noundef writeonly captures(none) %5, ptr nofree noundef writeonly captures(none) %6, ptr nofree noundef writeonly captures(none) %7) local_unnamed_addr #2 {
  store float 3.241200e+04, ptr %3, align 4
  store float 2.123000e+03, ptr %4, align 4
  %9 = icmp sgt i32 %0, 0
  %10 = icmp sgt i32 %2, 0
  %or.cond = and i1 %9, %10
  br i1 %or.cond, label %.preheader41.preheader, label %.preheader40

.preheader41.preheader:                           ; preds = %8
  %wide.trip.count57 = zext nneg i32 %0 to i64
  %wide.trip.count = zext nneg i32 %2 to i64
  %min.iters.check = icmp ult i32 %2, 8
  %n.vec = and i64 %wide.trip.count, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %.preheader41

.preheader41:                                     ; preds = %.preheader41.preheader, %._crit_edge
  %indvars.iv54 = phi i64 [ 0, %.preheader41.preheader ], [ %indvars.iv.next55, %._crit_edge ]
  %11 = trunc nuw nsw i64 %indvars.iv54 to i32
  %12 = uitofp nneg i32 %11 to float
  %13 = getelementptr [2048 x i8], ptr %5, i64 %indvars.iv54
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader41
  %broadcast.splatinsert = insertelement <4 x float> poison, float %12, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %14 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %15 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %16 = fmul nnan <4 x float> %broadcast.splat, %14
  %17 = fmul nnan <4 x float> %broadcast.splat, %15
  %18 = fmul nnan <4 x float> %16, splat (float f0x3B000000)
  %19 = fmul nnan <4 x float> %17, splat (float f0x3B000000)
  %20 = getelementptr [4 x i8], ptr %13, i64 %index
  %21 = getelementptr i8, ptr %20, i64 16
  store <4 x float> %18, ptr %20, align 4
  store <4 x float> %19, ptr %21, align 4
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %22 = icmp eq i64 %index.next, %n.vec
  br i1 %22, label %middle.block, label %vector.body, !llvm.loop !5

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader41, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader41 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

.preheader40:                                     ; preds = %._crit_edge, %8
  %23 = icmp sgt i32 %1, 0
  %or.cond51 = and i1 %10, %23
  br i1 %or.cond51, label %.preheader39.preheader, label %.preheader38

.preheader39.preheader:                           ; preds = %.preheader40
  %wide.trip.count67 = zext nneg i32 %2 to i64
  %wide.trip.count62 = zext nneg i32 %1 to i64
  %min.iters.check84 = icmp ult i32 %1, 8
  %n.vec87 = and i64 %wide.trip.count62, 2147483640
  %cmp.n97 = icmp eq i64 %n.vec87, %wide.trip.count62
  br label %.preheader39

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %24 = trunc nuw nsw i64 %indvars.iv to i32
  %25 = uitofp nneg i32 %24 to float
  %26 = fmul nnan float %12, %25
  %27 = fmul nnan float %26, f0x3B000000
  %28 = getelementptr [4 x i8], ptr %13, i64 %indvars.iv
  store float %27, ptr %28, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !6

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond58.not = icmp eq i64 %indvars.iv.next55, %wide.trip.count57
  br i1 %exitcond58.not, label %.preheader40, label %.preheader41

.preheader39:                                     ; preds = %.preheader39.preheader, %._crit_edge45
  %indvars.iv64 = phi i64 [ 0, %.preheader39.preheader ], [ %indvars.iv.next65, %._crit_edge45 ]
  %29 = trunc nuw nsw i64 %indvars.iv64 to i32
  %30 = uitofp nneg i32 %29 to float
  %31 = getelementptr [2048 x i8], ptr %6, i64 %indvars.iv64
  br i1 %min.iters.check84, label %scalar.ph83.preheader, label %vector.ph85

vector.ph85:                                      ; preds = %.preheader39
  %broadcast.splatinsert88 = insertelement <4 x float> poison, float %30, i64 0
  %broadcast.splat89 = shufflevector <4 x float> %broadcast.splatinsert88, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body90

vector.body90:                                    ; preds = %vector.body90, %vector.ph85
  %index91 = phi i64 [ 0, %vector.ph85 ], [ %index.next94, %vector.body90 ]
  %vec.ind92 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph85 ], [ %vec.ind.next95, %vector.body90 ]
  %step.add93 = add <4 x i32> %vec.ind92, splat (i32 4)
  %32 = uitofp nneg <4 x i32> %vec.ind92 to <4 x float>
  %33 = uitofp nneg <4 x i32> %step.add93 to <4 x float>
  %34 = fmul nnan <4 x float> %broadcast.splat89, %32
  %35 = fmul nnan <4 x float> %broadcast.splat89, %33
  %36 = fmul nnan <4 x float> %34, splat (float f0x3B000000)
  %37 = fmul nnan <4 x float> %35, splat (float f0x3B000000)
  %38 = getelementptr [4 x i8], ptr %31, i64 %index91
  %39 = getelementptr i8, ptr %38, i64 16
  store <4 x float> %36, ptr %38, align 4
  store <4 x float> %37, ptr %39, align 4
  %index.next94 = add nuw i64 %index91, 8
  %vec.ind.next95 = add <4 x i32> %vec.ind92, splat (i32 8)
  %40 = icmp eq i64 %index.next94, %n.vec87
  br i1 %40, label %middle.block96, label %vector.body90, !llvm.loop !7

middle.block96:                                   ; preds = %vector.body90
  br i1 %cmp.n97, label %._crit_edge45, label %scalar.ph83.preheader

scalar.ph83.preheader:                            ; preds = %.preheader39, %middle.block96
  %indvars.iv59.ph = phi i64 [ 0, %.preheader39 ], [ %n.vec87, %middle.block96 ]
  br label %scalar.ph83

.preheader38:                                     ; preds = %._crit_edge45, %.preheader40
  %or.cond52 = and i1 %9, %23
  br i1 %or.cond52, label %.preheader.preheader, label %._crit_edge50.split

.preheader.preheader:                             ; preds = %.preheader38
  %wide.trip.count77 = zext nneg i32 %0 to i64
  %wide.trip.count72 = zext nneg i32 %1 to i64
  %min.iters.check100 = icmp ult i32 %1, 8
  %n.vec103 = and i64 %wide.trip.count72, 2147483640
  %cmp.n113 = icmp eq i64 %n.vec103, %wide.trip.count72
  br label %.preheader

scalar.ph83:                                      ; preds = %scalar.ph83.preheader, %scalar.ph83
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %scalar.ph83 ], [ %indvars.iv59.ph, %scalar.ph83.preheader ]
  %41 = trunc nuw nsw i64 %indvars.iv59 to i32
  %42 = uitofp nneg i32 %41 to float
  %43 = fmul nnan float %30, %42
  %44 = fmul nnan float %43, f0x3B000000
  %45 = getelementptr [4 x i8], ptr %31, i64 %indvars.iv59
  store float %44, ptr %45, align 4
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond63.not = icmp eq i64 %indvars.iv.next60, %wide.trip.count62
  br i1 %exitcond63.not, label %._crit_edge45, label %scalar.ph83, !llvm.loop !8

._crit_edge45:                                    ; preds = %scalar.ph83, %middle.block96
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond68.not = icmp eq i64 %indvars.iv.next65, %wide.trip.count67
  br i1 %exitcond68.not, label %.preheader38, label %.preheader39

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge48
  %indvars.iv74 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next75, %._crit_edge48 ]
  %46 = trunc nuw nsw i64 %indvars.iv74 to i32
  %47 = uitofp nneg i32 %46 to float
  %48 = getelementptr [2048 x i8], ptr %7, i64 %indvars.iv74
  br i1 %min.iters.check100, label %scalar.ph99.preheader, label %vector.ph101

vector.ph101:                                     ; preds = %.preheader
  %broadcast.splatinsert104 = insertelement <4 x float> poison, float %47, i64 0
  %broadcast.splat105 = shufflevector <4 x float> %broadcast.splatinsert104, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body106

vector.body106:                                   ; preds = %vector.body106, %vector.ph101
  %index107 = phi i64 [ 0, %vector.ph101 ], [ %index.next110, %vector.body106 ]
  %vec.ind108 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph101 ], [ %vec.ind.next111, %vector.body106 ]
  %step.add109 = add <4 x i32> %vec.ind108, splat (i32 4)
  %49 = uitofp nneg <4 x i32> %vec.ind108 to <4 x float>
  %50 = uitofp nneg <4 x i32> %step.add109 to <4 x float>
  %51 = fmul nnan <4 x float> %broadcast.splat105, %49
  %52 = fmul nnan <4 x float> %broadcast.splat105, %50
  %53 = fmul nnan <4 x float> %51, splat (float f0x3B000000)
  %54 = fmul nnan <4 x float> %52, splat (float f0x3B000000)
  %55 = getelementptr [4 x i8], ptr %48, i64 %index107
  %56 = getelementptr i8, ptr %55, i64 16
  store <4 x float> %53, ptr %55, align 4
  store <4 x float> %54, ptr %56, align 4
  %index.next110 = add nuw i64 %index107, 8
  %vec.ind.next111 = add <4 x i32> %vec.ind108, splat (i32 8)
  %57 = icmp eq i64 %index.next110, %n.vec103
  br i1 %57, label %middle.block112, label %vector.body106, !llvm.loop !9

middle.block112:                                  ; preds = %vector.body106
  br i1 %cmp.n113, label %._crit_edge48, label %scalar.ph99.preheader

scalar.ph99.preheader:                            ; preds = %.preheader, %middle.block112
  %indvars.iv69.ph = phi i64 [ 0, %.preheader ], [ %n.vec103, %middle.block112 ]
  br label %scalar.ph99

scalar.ph99:                                      ; preds = %scalar.ph99.preheader, %scalar.ph99
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %scalar.ph99 ], [ %indvars.iv69.ph, %scalar.ph99.preheader ]
  %58 = trunc nuw nsw i64 %indvars.iv69 to i32
  %59 = uitofp nneg i32 %58 to float
  %60 = fmul nnan float %47, %59
  %61 = fmul nnan float %60, f0x3B000000
  %62 = getelementptr [4 x i8], ptr %48, i64 %indvars.iv69
  store float %61, ptr %62, align 4
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond73.not = icmp eq i64 %indvars.iv.next70, %wide.trip.count72
  br i1 %exitcond73.not, label %._crit_edge48, label %scalar.ph99, !llvm.loop !10

._crit_edge48:                                    ; preds = %scalar.ph99, %middle.block112
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond78.not = icmp eq i64 %indvars.iv.next75, %wide.trip.count77
  br i1 %exitcond78.not, label %._crit_edge50.split, label %.preheader

._crit_edge50.split:                              ; preds = %._crit_edge48, %.preheader38
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiiPA512_fS0_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #4 {
  %5 = icmp sgt i32 %0, 0
  %6 = icmp sgt i32 %1, 0
  %or.cond = and i1 %5, %6
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge19

.preheader.us.preheader:                          ; preds = %4
  %wide.trip.count26 = zext nneg i32 %0 to i64
  %wide.trip.count = zext nneg i32 %1 to i64
  %min.iters.check = icmp ult i32 %1, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv23 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next24, %._crit_edge.us ]
  %.018.us = phi i32 [ 0, %.preheader.us.preheader ], [ %.2.us.lcssa, %._crit_edge.us ]
  %7 = getelementptr [2048 x i8], ptr %2, i64 %indvars.iv23
  %8 = getelementptr [2048 x i8], ptr %3, i64 %indvars.iv23
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader.us
  %9 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.018.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %9, %vector.ph ], [ %41, %vector.body ]
  %10 = getelementptr [4 x i8], ptr %7, i64 %index
  %wide.load = load <4 x float>, ptr %10, align 4
  %11 = fpext <4 x float> %wide.load to <4 x double>
  %12 = getelementptr [4 x i8], ptr %8, i64 %index
  %wide.load29 = load <4 x float>, ptr %12, align 4
  %13 = fpext <4 x float> %wide.load29 to <4 x double>
  %14 = fcmp olt <4 x double> %11, splat (double f0xB690000000000000)
  %15 = fneg <4 x float> %wide.load
  %16 = select <4 x i1> %14, <4 x float> %15, <4 x float> %wide.load
  %17 = fpext <4 x float> %16 to <4 x double>
  %18 = fcmp uge <4 x double> %17, splat (double 1.000000e-02)
  %19 = fcmp olt <4 x double> %13, splat (double f0xB690000000000000)
  %20 = fneg <4 x float> %wide.load29
  %21 = select <4 x i1> %19, <4 x float> %20, <4 x float> %wide.load29
  %22 = fpext <4 x float> %21 to <4 x double>
  %23 = fcmp uge <4 x double> %22, splat (double 1.000000e-02)
  %24 = fsub <4 x double> %11, %13
  %25 = fptrunc <4 x double> %24 to <4 x float>
  %26 = fcmp olt <4 x double> %24, splat (double f0xB690000000000000)
  %27 = fneg <4 x float> %25
  %28 = select <4 x i1> %26, <4 x float> %27, <4 x float> %25
  %29 = fadd <4 x double> %11, splat (double f0x3E45798EE0000000)
  %30 = fptrunc <4 x double> %29 to <4 x float>
  %31 = fcmp olt <4 x double> %29, splat (double f0xB690000000000000)
  %32 = fneg <4 x float> %30
  %33 = select <4 x i1> %31, <4 x float> %32, <4 x float> %30
  %34 = fdiv <4 x float> %28, %33
  %35 = fcmp olt <4 x float> %34, zeroinitializer
  %36 = fneg <4 x float> %34
  %37 = select <4 x i1> %35, <4 x float> %36, <4 x float> %34
  %38 = fmul <4 x float> %37, splat (float 1.000000e+02)
  %39 = fpext <4 x float> %38 to <4 x double>
  %40 = fcmp ogt <4 x double> %39, splat (double 5.000000e-02)
  %.not31 = select <4 x i1> %18, <4 x i1> splat (i1 true), <4 x i1> %23
  %narrow = select <4 x i1> %.not31, <4 x i1> %40, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %41 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  %43 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %41)
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  %.116.us.ph = phi i32 [ %.018.us, %.preheader.us ], [ %43, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %_Z11percentDiffdd.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %.116.us = phi i32 [ %.2.us, %_Z11percentDiffdd.exit.us ], [ %.116.us.ph, %scalar.ph.preheader ]
  %44 = getelementptr [4 x i8], ptr %7, i64 %indvars.iv
  %45 = load float, ptr %44, align 4
  %46 = fpext float %45 to double
  %47 = getelementptr [4 x i8], ptr %8, i64 %indvars.iv
  %48 = load float, ptr %47, align 4
  %49 = fpext float %48 to double
  %50 = fcmp olt double %46, f0xB690000000000000
  %51 = fneg float %45
  %common.ret.op.i.i.us = select i1 %50, float %51, float %45
  %52 = fpext float %common.ret.op.i.i.us to double
  %53 = fcmp olt double %52, 1.000000e-02
  br i1 %53, label %54, label %.critedge.i.us

54:                                               ; preds = %scalar.ph
  %55 = fcmp olt double %49, f0xB690000000000000
  %56 = fneg float %48
  %common.ret.op.i7.i.us = select i1 %55, float %56, float %48
  %57 = fpext float %common.ret.op.i7.i.us to double
  %58 = fcmp olt double %57, 1.000000e-02
  br i1 %58, label %_Z11percentDiffdd.exit.us, label %.critedge.i.us

.critedge.i.us:                                   ; preds = %54, %scalar.ph
  %59 = insertelement <2 x double> poison, double %46, i64 0
  %60 = shufflevector <2 x double> %59, <2 x double> poison, <2 x i32> zeroinitializer
  %61 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %49, i64 0
  %62 = fsub <2 x double> %60, %61
  %63 = fptrunc <2 x double> %62 to <2 x float>
  %64 = fcmp olt <2 x double> %62, splat (double f0xB690000000000000)
  %65 = fneg <2 x float> %63
  %66 = select <2 x i1> %64, <2 x float> %65, <2 x float> %63
  %67 = extractelement <2 x float> %66, i64 0
  %68 = extractelement <2 x float> %66, i64 1
  %69 = fdiv float %67, %68
  %70 = fcmp olt float %69, 0.000000e+00
  %71 = fneg float %69
  %common.ret.op.i10.i.us = select i1 %70, float %71, float %69
  %72 = fmul float %common.ret.op.i10.i.us, 1.000000e+02
  %73 = fpext float %72 to double
  %74 = fcmp ogt double %73, 5.000000e-02
  %75 = zext i1 %74 to i32
  br label %_Z11percentDiffdd.exit.us

_Z11percentDiffdd.exit.us:                        ; preds = %.critedge.i.us, %54
  %common.ret.op.i.us = phi i32 [ %75, %.critedge.i.us ], [ 0, %54 ]
  %.2.us = add nsw i32 %common.ret.op.i.us, %.116.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !12

._crit_edge.us:                                   ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %.2.us.lcssa = phi i32 [ %43, %middle.block ], [ %.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27.not = icmp eq i64 %indvars.iv.next24, %wide.trip.count26
  br i1 %exitcond27.not, label %._crit_edge19, label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge.us, %4
  %.0.lcssa = phi i32 [ 0, %4 ], [ %.2.us.lcssa, %._crit_edge.us ]
  %76 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %.0.lcssa) #5
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

define dso_local void @_Z26__device_stub__gemm_kerneliiiffPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, float noundef %3, float noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) #6 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  store i32 %0, ptr %9, align 4
  store i32 %1, ptr %10, align 4
  store i32 %2, ptr %11, align 4
  store float %3, ptr %12, align 4
  store float %4, ptr %13, align 4
  store ptr %5, ptr %14, align 8
  store ptr %6, ptr %15, align 8
  store ptr %7, ptr %16, align 8
  %17 = alloca [8 x ptr], align 16
  store ptr %9, ptr %17, align 16
  %18 = getelementptr inbounds nuw i8, ptr %17, i64 8
  store ptr %10, ptr %18, align 8
  %19 = getelementptr inbounds nuw i8, ptr %17, i64 16
  store ptr %11, ptr %19, align 16
  %20 = getelementptr inbounds nuw i8, ptr %17, i64 24
  store ptr %12, ptr %20, align 8
  %21 = getelementptr inbounds nuw i8, ptr %17, i64 32
  store ptr %13, ptr %21, align 16
  %22 = getelementptr inbounds nuw i8, ptr %17, i64 40
  store ptr %14, ptr %22, align 8
  %23 = getelementptr inbounds nuw i8, ptr %17, i64 48
  store ptr %15, ptr %23, align 16
  %24 = getelementptr inbounds nuw i8, ptr %17, i64 56
  store ptr %16, ptr %24, align 8
  %25 = alloca %struct.dim3, align 8
  %26 = alloca %struct.dim3, align 8
  %27 = alloca i64, align 8
  %28 = alloca ptr, align 8
  %29 = call i32 @__cudaPopCallConfiguration(ptr nonnull %25, ptr nonnull %26, ptr nonnull %27, ptr nonnull %28)
  %30 = load i64, ptr %27, align 8
  %31 = load ptr, ptr %28, align 8
  %.fca.0.load2 = load i32, ptr %25, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %25, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %25, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %26, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %26, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %26, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %32 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__gemm_kerneliiiffPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %17, i64 noundef %30, ptr noundef %31)
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

define dso_local void @_Z8gemmCudaiiiffPA512_fS0_S0_S0_(i32 noundef %0, i32 noundef %1, i32 noundef %2, float noundef %3, float noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8) local_unnamed_addr #6 {
  %10 = alloca %struct.timeval, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca [8 x ptr], align 16
  %20 = alloca %struct.dim3, align 8
  %21 = alloca %struct.dim3, align 8
  %22 = alloca i64, align 8
  %23 = alloca ptr, align 8
  %24 = alloca %struct.timeval, align 8
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = call i32 @cudaMalloc(ptr noundef nonnull %25, i64 noundef 1048576) #5
  %29 = call i32 @cudaMalloc(ptr noundef nonnull %26, i64 noundef 1048576) #5
  %30 = call i32 @cudaMalloc(ptr noundef nonnull %27, i64 noundef 1048576) #5
  %31 = load ptr, ptr %25, align 8
  %32 = call i32 @cudaMemcpy(ptr noundef %31, ptr noundef %5, i64 noundef 1048576, i32 noundef 1) #5
  %33 = load ptr, ptr %26, align 8
  %34 = call i32 @cudaMemcpy(ptr noundef %33, ptr noundef %6, i64 noundef 1048576, i32 noundef 1) #5
  %35 = load ptr, ptr %27, align 8
  %36 = call i32 @cudaMemcpy(ptr noundef %35, ptr noundef %7, i64 noundef 1048576, i32 noundef 1) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %24)
  %37 = call i32 @gettimeofday(ptr noundef nonnull %24, ptr noundef null) #14
  %.not.i.i = icmp eq i32 %37, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %38

38:                                               ; preds = %9
  %39 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %37) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %9, %38
  %40 = load i64, ptr %24, align 8
  %41 = sitofp i64 %40 to double
  %42 = getelementptr inbounds nuw i8, ptr %24, i64 8
  %43 = load i64, ptr %42, align 8
  %44 = sitofp i64 %43 to double
  %45 = fmul nnan double %44, f0x3EB0C6F7A0B5ED8D
  %46 = fadd double %45, %41
  call void @llvm.lifetime.end.p0(ptr nonnull %24)
  store double %46, ptr @polybench_t_start, align 8
  %47 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 16, i32 64, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %47, 0
  br i1 %.not, label %48, label %63

48:                                               ; preds = %_Z21polybench_timer_startv.exit
  %49 = load ptr, ptr %25, align 8
  %50 = load ptr, ptr %26, align 8
  %51 = load ptr, ptr %27, align 8
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
  call void @llvm.lifetime.start.p0(ptr nonnull %21)
  call void @llvm.lifetime.start.p0(ptr nonnull %22)
  call void @llvm.lifetime.start.p0(ptr nonnull %23)
  store i32 %0, ptr %11, align 4
  store i32 %1, ptr %12, align 4
  store i32 %2, ptr %13, align 4
  store float %3, ptr %14, align 4
  store float %4, ptr %15, align 4
  store ptr %49, ptr %16, align 8
  store ptr %50, ptr %17, align 8
  store ptr %51, ptr %18, align 8
  store ptr %11, ptr %19, align 16
  %52 = getelementptr inbounds nuw i8, ptr %19, i64 8
  store ptr %12, ptr %52, align 8
  %53 = getelementptr inbounds nuw i8, ptr %19, i64 16
  store ptr %13, ptr %53, align 16
  %54 = getelementptr inbounds nuw i8, ptr %19, i64 24
  store ptr %14, ptr %54, align 8
  %55 = getelementptr inbounds nuw i8, ptr %19, i64 32
  store ptr %15, ptr %55, align 16
  %56 = getelementptr inbounds nuw i8, ptr %19, i64 40
  store ptr %16, ptr %56, align 8
  %57 = getelementptr inbounds nuw i8, ptr %19, i64 48
  store ptr %17, ptr %57, align 16
  %58 = getelementptr inbounds nuw i8, ptr %19, i64 56
  store ptr %18, ptr %58, align 8
  %59 = call i32 @__cudaPopCallConfiguration(ptr nonnull %20, ptr nonnull %21, ptr nonnull %22, ptr nonnull %23), !inline_history !13
  %60 = load i64, ptr %22, align 8
  %61 = load ptr, ptr %23, align 8
  %.fca.0.load2.i = load i32, ptr %20, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %20, i64 4
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %20, i64 8
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %21, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %21, i64 4
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %21, i64 8
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %62 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__gemm_kerneliiiffPfS_S_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %19, i64 noundef %60, ptr noundef %61), !inline_history !13
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
  call void @llvm.lifetime.end.p0(ptr nonnull %21)
  call void @llvm.lifetime.end.p0(ptr nonnull %22)
  call void @llvm.lifetime.end.p0(ptr nonnull %23)
  br label %63

63:                                               ; preds = %_Z21polybench_timer_startv.exit, %48
  %64 = call i32 @cudaThreadSynchronize() #5
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  %65 = call i32 @gettimeofday(ptr noundef nonnull %10, ptr noundef null) #14
  %.not.i.i14 = icmp eq i32 %65, 0
  br i1 %.not.i.i14, label %_Z20polybench_timer_stopv.exit, label %66

66:                                               ; preds = %63
  %67 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %65) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %63, %66
  %68 = load i64, ptr %10, align 8
  %69 = sitofp i64 %68 to double
  %70 = getelementptr inbounds nuw i8, ptr %10, i64 8
  %71 = load i64, ptr %70, align 8
  %72 = sitofp i64 %71 to double
  %73 = fmul nnan double %72, f0x3EB0C6F7A0B5ED8D
  %74 = fadd double %73, %69
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  store double %74, ptr @polybench_t_end, align 8
  %75 = load double, ptr @polybench_t_start, align 8
  %76 = fsub double %74, %75
  %77 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %76) #5
  %78 = load ptr, ptr %27, align 8
  %79 = call i32 @cudaMemcpy(ptr noundef %8, ptr noundef %78, i64 noundef 1048576, i32 noundef 2) #5
  %80 = load ptr, ptr %25, align 8
  %81 = call i32 @cudaFree(ptr noundef %80) #5
  %82 = load ptr, ptr %26, align 8
  %83 = call i32 @cudaFree(ptr noundef %82) #5
  %84 = load ptr, ptr %27, align 8
  %85 = call i32 @cudaFree(ptr noundef %84) #5
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

define dso_local noundef i32 @main(i32 noundef %0, ptr nofree noundef readnone captures(none) %1) local_unnamed_addr #6 {
  %3 = alloca %struct.timeval, align 8
  %4 = alloca %struct.timeval, align 8
  %5 = alloca %struct.cudaDeviceProp, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  store ptr null, ptr %9, align 8
  %10 = call i32 @posix_memalign(ptr noundef nonnull %9, i64 noundef 32, i64 noundef 1048576) #14
  %11 = load ptr, ptr %9, align 8
  %.not.i.i = icmp eq ptr %11, null
  %12 = icmp ne i32 %10, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %12
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %13 = load ptr, ptr @stderr, align 8
  %14 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %13) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %15 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 1048576) #14
  %16 = load ptr, ptr %8, align 8
  %.not.i.i27 = icmp eq ptr %16, null
  %17 = icmp ne i32 %15, 0
  %or.cond.i.i28 = select i1 %.not.i.i27, i1 true, i1 %17
  br i1 %or.cond.i.i28, label %.critedge.i.i29, label %_Z20polybench_alloc_datayi.exit30

.critedge.i.i29:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %18 = load ptr, ptr @stderr, align 8
  %19 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %18) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit30:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %20 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 1048576) #14
  %21 = load ptr, ptr %7, align 8
  %.not.i.i31 = icmp eq ptr %21, null
  %22 = icmp ne i32 %20, 0
  %or.cond.i.i32 = select i1 %.not.i.i31, i1 true, i1 %22
  br i1 %or.cond.i.i32, label %.critedge.i.i33, label %_Z20polybench_alloc_datayi.exit34

.critedge.i.i33:                                  ; preds = %_Z20polybench_alloc_datayi.exit30
  %23 = load ptr, ptr @stderr, align 8
  %24 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %23) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit34:                ; preds = %_Z20polybench_alloc_datayi.exit30
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %25 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 1048576) #14
  %26 = load ptr, ptr %6, align 8
  %.not.i.i35 = icmp eq ptr %26, null
  %27 = icmp ne i32 %25, 0
  %or.cond.i.i36 = select i1 %.not.i.i35, i1 true, i1 %27
  br i1 %or.cond.i.i36, label %.critedge.i.i37, label %_Z20polybench_alloc_datayi.exit38

.critedge.i.i37:                                  ; preds = %_Z20polybench_alloc_datayi.exit34
  %28 = load ptr, ptr @stderr, align 8
  %29 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %28) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit38:                ; preds = %_Z20polybench_alloc_datayi.exit34
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  br label %.preheader41.i

.preheader41.i:                                   ; preds = %._crit_edge.i, %_Z20polybench_alloc_datayi.exit38
  %indvars.iv54.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit38 ], [ %indvars.iv.next55.i, %._crit_edge.i ]
  %30 = getelementptr [2048 x i8], ptr %11, i64 %indvars.iv54.i
  %31 = trunc nuw nsw i64 %indvars.iv54.i to i32
  %32 = uitofp nneg i32 %31 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %32, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader41.i
  %index = phi i64 [ 0, %.preheader41.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader41.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %33 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %34 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %35 = fmul nnan <4 x float> %broadcast.splat, %33
  %36 = fmul nnan <4 x float> %broadcast.splat, %34
  %37 = fmul nnan <4 x float> %35, splat (float f0x3B000000)
  %38 = fmul nnan <4 x float> %36, splat (float f0x3B000000)
  %39 = getelementptr [4 x i8], ptr %30, i64 %index
  %40 = getelementptr i8, ptr %39, i64 16
  store <4 x float> %37, ptr %39, align 4
  store <4 x float> %38, ptr %40, align 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %41 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %42 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %43 = fmul nnan <4 x float> %broadcast.splat, %41
  %44 = fmul nnan <4 x float> %broadcast.splat, %42
  %45 = fmul nnan <4 x float> %43, splat (float f0x3B000000)
  %46 = fmul nnan <4 x float> %44, splat (float f0x3B000000)
  %47 = getelementptr [4 x i8], ptr %30, i64 %index
  %48 = getelementptr i8, ptr %47, i64 32
  %49 = getelementptr i8, ptr %47, i64 48
  store <4 x float> %45, ptr %48, align 4
  store <4 x float> %46, ptr %49, align 4
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %50 = icmp eq i64 %index.next.1, 512
  br i1 %50, label %._crit_edge.i, label %vector.body, !llvm.loop !14

._crit_edge.i:                                    ; preds = %vector.body
  %indvars.iv.next55.i = add nuw nsw i64 %indvars.iv54.i, 1
  %exitcond58.not.i = icmp eq i64 %indvars.iv.next55.i, 512
  br i1 %exitcond58.not.i, label %.preheader39.i, label %.preheader41.i

.preheader39.i:                                   ; preds = %._crit_edge.i, %._crit_edge45.i
  %indvars.iv64.i = phi i64 [ %indvars.iv.next65.i, %._crit_edge45.i ], [ 0, %._crit_edge.i ]
  %51 = getelementptr [2048 x i8], ptr %16, i64 %indvars.iv64.i
  %52 = trunc nuw nsw i64 %indvars.iv64.i to i32
  %53 = uitofp nneg i32 %52 to float
  %broadcast.splatinsert54 = insertelement <4 x float> poison, float %53, i64 0
  %broadcast.splat55 = shufflevector <4 x float> %broadcast.splatinsert54, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body56

vector.body56:                                    ; preds = %vector.body56, %.preheader39.i
  %index57 = phi i64 [ 0, %.preheader39.i ], [ %index.next60.1, %vector.body56 ]
  %vec.ind58 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader39.i ], [ %vec.ind.next61.1, %vector.body56 ]
  %step.add59 = add <4 x i32> %vec.ind58, splat (i32 4)
  %54 = uitofp nneg <4 x i32> %vec.ind58 to <4 x float>
  %55 = uitofp nneg <4 x i32> %step.add59 to <4 x float>
  %56 = fmul nnan <4 x float> %broadcast.splat55, %54
  %57 = fmul nnan <4 x float> %broadcast.splat55, %55
  %58 = fmul nnan <4 x float> %56, splat (float f0x3B000000)
  %59 = fmul nnan <4 x float> %57, splat (float f0x3B000000)
  %60 = getelementptr [4 x i8], ptr %51, i64 %index57
  %61 = getelementptr i8, ptr %60, i64 16
  store <4 x float> %58, ptr %60, align 4
  store <4 x float> %59, ptr %61, align 4
  %vec.ind.next61 = add <4 x i32> %vec.ind58, splat (i32 8)
  %step.add59.1 = add <4 x i32> %vec.ind58, splat (i32 12)
  %62 = uitofp nneg <4 x i32> %vec.ind.next61 to <4 x float>
  %63 = uitofp nneg <4 x i32> %step.add59.1 to <4 x float>
  %64 = fmul nnan <4 x float> %broadcast.splat55, %62
  %65 = fmul nnan <4 x float> %broadcast.splat55, %63
  %66 = fmul nnan <4 x float> %64, splat (float f0x3B000000)
  %67 = fmul nnan <4 x float> %65, splat (float f0x3B000000)
  %68 = getelementptr [4 x i8], ptr %51, i64 %index57
  %69 = getelementptr i8, ptr %68, i64 32
  %70 = getelementptr i8, ptr %68, i64 48
  store <4 x float> %66, ptr %69, align 4
  store <4 x float> %67, ptr %70, align 4
  %index.next60.1 = add nuw nsw i64 %index57, 16
  %vec.ind.next61.1 = add <4 x i32> %vec.ind58, splat (i32 16)
  %71 = icmp eq i64 %index.next60.1, 512
  br i1 %71, label %._crit_edge45.i, label %vector.body56, !llvm.loop !15

._crit_edge45.i:                                  ; preds = %vector.body56
  %indvars.iv.next65.i = add nuw nsw i64 %indvars.iv64.i, 1
  %exitcond68.not.i = icmp eq i64 %indvars.iv.next65.i, 512
  br i1 %exitcond68.not.i, label %.preheader.i, label %.preheader39.i

.preheader.i:                                     ; preds = %._crit_edge45.i, %._crit_edge48.i
  %indvars.iv74.i = phi i64 [ %indvars.iv.next75.i, %._crit_edge48.i ], [ 0, %._crit_edge45.i ]
  %72 = getelementptr [2048 x i8], ptr %21, i64 %indvars.iv74.i
  %73 = trunc nuw nsw i64 %indvars.iv74.i to i32
  %74 = uitofp nneg i32 %73 to float
  %broadcast.splatinsert64 = insertelement <4 x float> poison, float %74, i64 0
  %broadcast.splat65 = shufflevector <4 x float> %broadcast.splatinsert64, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body66

vector.body66:                                    ; preds = %vector.body66, %.preheader.i
  %index67 = phi i64 [ 0, %.preheader.i ], [ %index.next70.1, %vector.body66 ]
  %vec.ind68 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader.i ], [ %vec.ind.next71.1, %vector.body66 ]
  %step.add69 = add <4 x i32> %vec.ind68, splat (i32 4)
  %75 = uitofp nneg <4 x i32> %vec.ind68 to <4 x float>
  %76 = uitofp nneg <4 x i32> %step.add69 to <4 x float>
  %77 = fmul nnan <4 x float> %broadcast.splat65, %75
  %78 = fmul nnan <4 x float> %broadcast.splat65, %76
  %79 = fmul nnan <4 x float> %77, splat (float f0x3B000000)
  %80 = fmul nnan <4 x float> %78, splat (float f0x3B000000)
  %81 = getelementptr [4 x i8], ptr %72, i64 %index67
  %82 = getelementptr i8, ptr %81, i64 16
  store <4 x float> %79, ptr %81, align 4
  store <4 x float> %80, ptr %82, align 4
  %vec.ind.next71 = add <4 x i32> %vec.ind68, splat (i32 8)
  %step.add69.1 = add <4 x i32> %vec.ind68, splat (i32 12)
  %83 = uitofp nneg <4 x i32> %vec.ind.next71 to <4 x float>
  %84 = uitofp nneg <4 x i32> %step.add69.1 to <4 x float>
  %85 = fmul nnan <4 x float> %broadcast.splat65, %83
  %86 = fmul nnan <4 x float> %broadcast.splat65, %84
  %87 = fmul nnan <4 x float> %85, splat (float f0x3B000000)
  %88 = fmul nnan <4 x float> %86, splat (float f0x3B000000)
  %89 = getelementptr [4 x i8], ptr %72, i64 %index67
  %90 = getelementptr i8, ptr %89, i64 32
  %91 = getelementptr i8, ptr %89, i64 48
  store <4 x float> %87, ptr %90, align 4
  store <4 x float> %88, ptr %91, align 4
  %index.next70.1 = add nuw nsw i64 %index67, 16
  %vec.ind.next71.1 = add <4 x i32> %vec.ind68, splat (i32 16)
  %92 = icmp eq i64 %index.next70.1, 512
  br i1 %92, label %._crit_edge48.i, label %vector.body66, !llvm.loop !16

._crit_edge48.i:                                  ; preds = %vector.body66
  %indvars.iv.next75.i = add nuw nsw i64 %indvars.iv74.i, 1
  %exitcond78.not.i = icmp eq i64 %indvars.iv.next75.i, 512
  br i1 %exitcond78.not.i, label %_Z4initiiiPfS_PA512_fS1_S1_.exit, label %.preheader.i

_Z4initiiiPfS_PA512_fS1_S1_.exit:                 ; preds = %._crit_edge48.i
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  %93 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %5, i32 noundef 0) #5
  %94 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %5) #5
  %95 = call i32 @cudaSetDevice(i32 noundef 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @_Z8gemmCudaiiiffPA512_fS0_S0_S0_(i32 noundef 512, i32 noundef 512, i32 noundef 512, float noundef 3.241200e+04, float noundef 2.123000e+03, ptr noundef %11, ptr noundef %16, ptr noundef nonnull %21, ptr noundef %26) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %96 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #14
  %.not.i.i39 = icmp eq i32 %96, 0
  br i1 %.not.i.i39, label %_Z21polybench_timer_startv.exit, label %97

97:                                               ; preds = %_Z4initiiiPfS_PA512_fS1_S1_.exit
  %98 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %96) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z4initiiiPfS_PA512_fS1_S1_.exit, %97
  %99 = load i64, ptr %4, align 8
  %100 = sitofp i64 %99 to double
  %101 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %102 = load i64, ptr %101, align 8
  %103 = sitofp i64 %102 to double
  %104 = fmul nnan double %103, f0x3EB0C6F7A0B5ED8D
  %105 = fadd double %104, %100
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %105, ptr @polybench_t_start, align 8
  br label %.preheader.us.i

.preheader.us.i:                                  ; preds = %._crit_edge27.split.us.us.i, %_Z21polybench_timer_startv.exit
  %indvars.iv48.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next49.i, %._crit_edge27.split.us.us.i ]
  %106 = getelementptr [2048 x i8], ptr %21, i64 %indvars.iv48.i
  %107 = getelementptr [2048 x i8], ptr %11, i64 %indvars.iv48.i
  br label %.lr.ph.us.us.i

.lr.ph.us.us.i:                                   ; preds = %._crit_edge.us.us.i, %.preheader.us.i
  %indvars.iv43.i = phi i64 [ %indvars.iv.next44.i, %._crit_edge.us.us.i ], [ 0, %.preheader.us.i ]
  %108 = getelementptr [4 x i8], ptr %106, i64 %indvars.iv43.i
  %109 = load float, ptr %108, align 4
  %110 = fmul float %109, 2.123000e+03
  store float %110, ptr %108, align 4
  %invariant.gep.us.us.i = getelementptr [4 x i8], ptr %16, i64 %indvars.iv43.i
  br label %111

111:                                              ; preds = %111, %.lr.ph.us.us.i
  %indvars.iv38.i = phi i64 [ 0, %.lr.ph.us.us.i ], [ %indvars.iv.next39.i.1, %111 ]
  %112 = phi float [ %110, %.lr.ph.us.us.i ], [ %124, %111 ]
  %113 = getelementptr [4 x i8], ptr %107, i64 %indvars.iv38.i
  %114 = load float, ptr %113, align 4
  %115 = fmul float %114, 3.241200e+04
  %gep.us.us.i = getelementptr [2048 x i8], ptr %invariant.gep.us.us.i, i64 %indvars.iv38.i
  %116 = load float, ptr %gep.us.us.i, align 4
  %117 = fmul float %115, %116
  %118 = fadd float %112, %117
  store float %118, ptr %108, align 4
  %indvars.iv.next39.i = or disjoint i64 %indvars.iv38.i, 1
  %119 = getelementptr [4 x i8], ptr %107, i64 %indvars.iv.next39.i
  %120 = load float, ptr %119, align 4
  %121 = fmul float %120, 3.241200e+04
  %gep.us.us.i.1 = getelementptr [2048 x i8], ptr %invariant.gep.us.us.i, i64 %indvars.iv.next39.i
  %122 = load float, ptr %gep.us.us.i.1, align 4
  %123 = fmul float %121, %122
  %124 = fadd float %118, %123
  store float %124, ptr %108, align 4
  %indvars.iv.next39.i.1 = add nuw nsw i64 %indvars.iv38.i, 2
  %exitcond42.not.i.1 = icmp eq i64 %indvars.iv.next39.i.1, 512
  br i1 %exitcond42.not.i.1, label %._crit_edge.us.us.i, label %111

._crit_edge.us.us.i:                              ; preds = %111
  %indvars.iv.next44.i = add nuw nsw i64 %indvars.iv43.i, 1
  %exitcond47.not.i = icmp eq i64 %indvars.iv.next44.i, 512
  br i1 %exitcond47.not.i, label %._crit_edge27.split.us.us.i, label %.lr.ph.us.us.i

._crit_edge27.split.us.us.i:                      ; preds = %._crit_edge.us.us.i
  %indvars.iv.next49.i = add nuw nsw i64 %indvars.iv48.i, 1
  %exitcond52.not.i = icmp eq i64 %indvars.iv.next49.i, 512
  br i1 %exitcond52.not.i, label %_Z4gemmiiiffPA512_fS0_S0_.exit, label %.preheader.us.i

_Z4gemmiiiffPA512_fS0_S0_.exit:                   ; preds = %._crit_edge27.split.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %125 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #14
  %.not.i.i40 = icmp eq i32 %125, 0
  br i1 %.not.i.i40, label %_Z20polybench_timer_stopv.exit, label %126

126:                                              ; preds = %_Z4gemmiiiffPA512_fS0_S0_.exit
  %127 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %125) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z4gemmiiiffPA512_fS0_S0_.exit, %126
  %128 = load i64, ptr %3, align 8
  %129 = sitofp i64 %128 to double
  %130 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %131 = load i64, ptr %130, align 8
  %132 = sitofp i64 %131 to double
  %133 = fmul nnan double %132, f0x3EB0C6F7A0B5ED8D
  %134 = fadd double %133, %129
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %134, ptr @polybench_t_end, align 8
  %135 = load double, ptr @polybench_t_start, align 8
  %136 = fsub double %134, %135
  %137 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %136) #5
  br label %.preheader.us.i41

.preheader.us.i41:                                ; preds = %._crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv23.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next24.i, %._crit_edge.us.i ]
  %.018.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %174, %._crit_edge.us.i ]
  %138 = getelementptr [2048 x i8], ptr %21, i64 %indvars.iv23.i
  %139 = getelementptr [2048 x i8], ptr %26, i64 %indvars.iv23.i
  %140 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.018.us.i, i64 0
  br label %vector.body74

vector.body74:                                    ; preds = %vector.body74, %.preheader.us.i41
  %index75 = phi i64 [ 0, %.preheader.us.i41 ], [ %index.next77, %vector.body74 ]
  %vec.phi = phi <4 x i32> [ %140, %.preheader.us.i41 ], [ %172, %vector.body74 ]
  %141 = getelementptr [4 x i8], ptr %138, i64 %index75
  %wide.load = load <4 x float>, ptr %141, align 4
  %142 = fpext <4 x float> %wide.load to <4 x double>
  %143 = getelementptr [4 x i8], ptr %139, i64 %index75
  %wide.load76 = load <4 x float>, ptr %143, align 4
  %144 = fpext <4 x float> %wide.load76 to <4 x double>
  %145 = fcmp olt <4 x double> %142, splat (double f0xB690000000000000)
  %146 = fneg <4 x float> %wide.load
  %147 = select <4 x i1> %145, <4 x float> %146, <4 x float> %wide.load
  %148 = fpext <4 x float> %147 to <4 x double>
  %149 = fcmp uge <4 x double> %148, splat (double 1.000000e-02)
  %150 = fcmp olt <4 x double> %144, splat (double f0xB690000000000000)
  %151 = fneg <4 x float> %wide.load76
  %152 = select <4 x i1> %150, <4 x float> %151, <4 x float> %wide.load76
  %153 = fpext <4 x float> %152 to <4 x double>
  %154 = fcmp uge <4 x double> %153, splat (double 1.000000e-02)
  %155 = fsub <4 x double> %142, %144
  %156 = fptrunc <4 x double> %155 to <4 x float>
  %157 = fcmp olt <4 x double> %155, splat (double f0xB690000000000000)
  %158 = fneg <4 x float> %156
  %159 = select <4 x i1> %157, <4 x float> %158, <4 x float> %156
  %160 = fadd <4 x double> %142, splat (double f0x3E45798EE0000000)
  %161 = fptrunc <4 x double> %160 to <4 x float>
  %162 = fcmp olt <4 x double> %160, splat (double f0xB690000000000000)
  %163 = fneg <4 x float> %161
  %164 = select <4 x i1> %162, <4 x float> %163, <4 x float> %161
  %165 = fdiv <4 x float> %159, %164
  %166 = fcmp olt <4 x float> %165, zeroinitializer
  %167 = fneg <4 x float> %165
  %168 = select <4 x i1> %166, <4 x float> %167, <4 x float> %165
  %169 = fmul <4 x float> %168, splat (float 1.000000e+02)
  %170 = fpext <4 x float> %169 to <4 x double>
  %171 = fcmp ogt <4 x double> %170, splat (double 5.000000e-02)
  %.not80 = select <4 x i1> %149, <4 x i1> splat (i1 true), <4 x i1> %154
  %narrow = select <4 x i1> %.not80, <4 x i1> %171, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %172 = add <4 x i32> %vec.phi, %predphi
  %index.next77 = add nuw i64 %index75, 4
  %173 = icmp eq i64 %index.next77, 512
  br i1 %173, label %._crit_edge.us.i, label %vector.body74, !llvm.loop !17

._crit_edge.us.i:                                 ; preds = %vector.body74
  %174 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %172)
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1
  %exitcond27.not.i = icmp eq i64 %indvars.iv.next24.i, 512
  br i1 %exitcond27.not.i, label %_Z14compareResultsiiPA512_fS0_.exit, label %.preheader.us.i41

_Z14compareResultsiiPA512_fS0_.exit:              ; preds = %._crit_edge.us.i
  %175 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %174) #5
  call void @free(ptr noundef %11) #14
  call void @free(ptr noundef %16) #14
  call void @free(ptr noundef nonnull %21) #14
  call void @free(ptr noundef nonnull %26) #14
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
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { nofree norecurse nosync nounwind memory(argmem: write) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
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
!11 = distinct !{!11, !2, !3}
!12 = distinct !{!12, !3, !2}
!13 = !{ptr @_Z26__device_stub__gemm_kerneliiiffPfS_S_}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
!16 = distinct !{!16, !2, !3}
!17 = distinct !{!17, !2, !3}
