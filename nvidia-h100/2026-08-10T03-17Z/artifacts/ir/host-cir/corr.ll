; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/CORR/correlation.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/CORR/correlation.cu"
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
define dso_local void @_Z11init_arraysiiPA2048_f(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) %2) local_unnamed_addr #1 {
  %4 = icmp sgt i32 %0, 0
  %5 = icmp sgt i32 %1, 0
  %or.cond = and i1 %4, %5
  br i1 %or.cond, label %.preheader.preheader, label %._crit_edge13.split

.preheader.preheader:                             ; preds = %3
  %wide.trip.count18 = zext nneg i32 %0 to i64
  %wide.trip.count = zext nneg i32 %1 to i64
  %min.iters.check = icmp ult i32 %1, 8
  %n.vec = and i64 %wide.trip.count, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv15 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next16, %._crit_edge ]
  %6 = trunc nuw nsw i64 %indvars.iv15 to i32
  %7 = uitofp nneg i32 %6 to float
  %8 = getelementptr [8192 x i8], ptr %2, i64 %indvars.iv15
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %7, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %9 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %10 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %11 = fmul nnan <4 x float> %broadcast.splat, %9
  %12 = fmul nnan <4 x float> %broadcast.splat, %10
  %13 = fmul nnan <4 x float> %11, splat (float f0x3A000000)
  %14 = fmul nnan <4 x float> %12, splat (float f0x3A000000)
  %15 = getelementptr [4 x i8], ptr %8, i64 %index
  %16 = getelementptr i8, ptr %15, i64 16
  store <4 x float> %13, ptr %15, align 4
  store <4 x float> %14, ptr %16, align 4
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %18 = trunc nuw nsw i64 %indvars.iv to i32
  %19 = uitofp nneg i32 %18 to float
  %20 = fmul nnan float %7, %19
  %21 = fmul nnan float %20, f0x3A000000
  %22 = getelementptr [4 x i8], ptr %8, i64 %indvars.iv
  store float %21, ptr %22, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !4

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond19.not = icmp eq i64 %indvars.iv.next16, %wide.trip.count18
  br i1 %exitcond19.not, label %._crit_edge13.split, label %.preheader

._crit_edge13.split:                              ; preds = %._crit_edge, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(errnomem: write)
declare float @sqrtf(float noundef) local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite, errnomem: write)
define dso_local void @_Z11correlationiiPA2048_fPfS1_S0_(i32 noundef %0, i32 noundef %1, ptr nofree noundef captures(none) %2, ptr nofree noundef captures(none) %3, ptr nofree noundef captures(none) %4, ptr nofree noundef writeonly captures(none) %5) local_unnamed_addr #3 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph108, label %.preheader103.thread

.lr.ph108:                                        ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %wide.trip.count138 = zext nneg i32 %0 to i64
  br i1 %8, label %.lr.ph.us.preheader, label %.lr.ph111.thread

.lr.ph111.thread:                                 ; preds = %.lr.ph108
  %9 = shl nuw nsw i64 %wide.trip.count138, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %3, i8 0, i64 %9, i1 false)
  %wide.trip.count143 = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 8
  br i1 %min.iters.check, label %.lr.ph111.split.preheader, label %vector.ph

.lr.ph.us.preheader:                              ; preds = %.lr.ph108
  %wide.trip.count = zext nneg i32 %1 to i64
  %xtraiter = and i64 %wide.trip.count, 3
  %10 = icmp ult i32 %1, 4
  %unroll_iter = and i64 %wide.trip.count, 2147483644
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod230 = icmp ne i64 %xtraiter, 0
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge.us
  %indvars.iv135 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next136, %._crit_edge.us ]
  %11 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv135
  store float 0.000000e+00, ptr %11, align 4
  %invariant.gep.us = getelementptr [4 x i8], ptr %2, i64 %indvars.iv135
  br i1 %10, label %.epil.preheader, label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ 0, %.lr.ph.us ]
  %12 = phi float [ %23, %.lr.ph.us.new ], [ 0.000000e+00, %.lr.ph.us ]
  %niter = phi i64 [ %niter.next.3, %.lr.ph.us.new ], [ 0, %.lr.ph.us ]
  %gep.us = getelementptr [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv
  %13 = load float, ptr %gep.us, align 4
  %14 = fadd float %13, %12
  store float %14, ptr %11, align 4
  %15 = getelementptr [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv
  %gep.us.1 = getelementptr i8, ptr %15, i64 8192
  %16 = load float, ptr %gep.us.1, align 4
  %17 = fadd float %16, %14
  store float %17, ptr %11, align 4
  %18 = getelementptr [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv
  %gep.us.2 = getelementptr i8, ptr %18, i64 16384
  %19 = load float, ptr %gep.us.2, align 4
  %20 = fadd float %19, %17
  store float %20, ptr %11, align 4
  %21 = getelementptr [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv
  %gep.us.3 = getelementptr i8, ptr %21, i64 24576
  %22 = load float, ptr %gep.us.3, align 4
  %23 = fadd float %22, %20
  store float %23, ptr %11, align 4
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.next.3 = add i64 %niter, 4
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %._crit_edge.us.unr-lcssa, label %.lr.ph.us.new

._crit_edge.us.unr-lcssa:                         ; preds = %.lr.ph.us.new
  br i1 %lcmp.mod.not, label %._crit_edge.us, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.us.unr-lcssa, %.lr.ph.us
  %indvars.iv.epil.init = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.3, %._crit_edge.us.unr-lcssa ]
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.us ], [ %23, %._crit_edge.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod230)
  br label %24

24:                                               ; preds = %24, %.epil.preheader
  %indvars.iv.epil = phi i64 [ %indvars.iv.epil.init, %.epil.preheader ], [ %indvars.iv.next.epil, %24 ]
  %25 = phi float [ %.epil.init, %.epil.preheader ], [ %27, %24 ]
  %epil.iter = phi i64 [ 0, %.epil.preheader ], [ %epil.iter.next, %24 ]
  %gep.us.epil = getelementptr [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv.epil
  %26 = load float, ptr %gep.us.epil, align 4
  %27 = fadd float %26, %25
  store float %27, ptr %11, align 4
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge.us, label %24, !llvm.loop !5

._crit_edge.us:                                   ; preds = %24, %._crit_edge.us.unr-lcssa
  %.lcssa228 = phi float [ %23, %._crit_edge.us.unr-lcssa ], [ %27, %24 ]
  %28 = fdiv float %.lcssa228, f0x4A442E10
  store float %28, ptr %11, align 4
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond139.not = icmp eq i64 %indvars.iv.next136, %wide.trip.count138
  br i1 %exitcond139.not, label %.lr.ph.us114.preheader, label %.lr.ph.us

vector.ph:                                        ; preds = %.lr.ph111.thread
  %n.vec = and i64 %wide.trip.count143, 2147483640
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %29 = getelementptr [4 x i8], ptr %4, i64 %index
  %30 = getelementptr i8, ptr %29, i64 16
  store <4 x float> splat (float 1.000000e+00), ptr %29, align 4
  store <4 x float> splat (float 1.000000e+00), ptr %30, align 4
  %index.next = add nuw i64 %index, 8
  %31 = icmp eq i64 %index.next, %n.vec
  br i1 %31, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count143
  br i1 %cmp.n, label %.preheader103.thread, label %.lr.ph111.split.preheader

.lr.ph111.split.preheader:                        ; preds = %.lr.ph111.thread, %middle.block
  %indvars.iv140.ph = phi i64 [ 0, %.lr.ph111.thread ], [ %n.vec, %middle.block ]
  br label %.lr.ph111.split

.lr.ph.us114.preheader:                           ; preds = %._crit_edge.us
  %wide.trip.count153 = zext nneg i32 %0 to i64
  %xtraiter232 = and i64 %wide.trip.count, 1
  %32 = icmp eq i32 %1, 1
  %unroll_iter239 = and i64 %wide.trip.count, 2147483646
  %lcmp.mod236.not = icmp eq i64 %xtraiter232, 0
  %lcmp.mod238 = trunc i32 %1 to i1
  br label %.lr.ph.us114

.lr.ph.us114:                                     ; preds = %.lr.ph.us114.preheader, %._crit_edge.us115
  %indvars.iv150 = phi i64 [ 0, %.lr.ph.us114.preheader ], [ %indvars.iv.next151, %._crit_edge.us115 ]
  %33 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv150
  store float 0.000000e+00, ptr %33, align 4
  %invariant.gep.us112 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv150
  %34 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv150
  br i1 %32, label %.epil.preheader231, label %.lr.ph.us114.new

.lr.ph.us114.new:                                 ; preds = %.lr.ph.us114, %.lr.ph.us114.new
  %35 = phi float [ %46, %.lr.ph.us114.new ], [ 0.000000e+00, %.lr.ph.us114 ]
  %indvars.iv145 = phi i64 [ %indvars.iv.next146.1, %.lr.ph.us114.new ], [ 0, %.lr.ph.us114 ]
  %niter240 = phi i64 [ %niter240.next.1, %.lr.ph.us114.new ], [ 0, %.lr.ph.us114 ]
  %gep.us113 = getelementptr [8192 x i8], ptr %invariant.gep.us112, i64 %indvars.iv145
  %36 = load float, ptr %gep.us113, align 4
  %37 = load float, ptr %34, align 4
  %38 = fsub float %36, %37
  %39 = fmul float %38, %38
  %40 = fadd float %35, %39
  store float %40, ptr %33, align 4
  %41 = getelementptr [8192 x i8], ptr %invariant.gep.us112, i64 %indvars.iv145
  %gep.us113.1 = getelementptr i8, ptr %41, i64 8192
  %42 = load float, ptr %gep.us113.1, align 4
  %43 = load float, ptr %34, align 4
  %44 = fsub float %42, %43
  %45 = fmul float %44, %44
  %46 = fadd float %40, %45
  store float %46, ptr %33, align 4
  %indvars.iv.next146.1 = add nuw nsw i64 %indvars.iv145, 2
  %niter240.next.1 = add i64 %niter240, 2
  %niter240.ncmp.1 = icmp eq i64 %niter240.next.1, %unroll_iter239
  br i1 %niter240.ncmp.1, label %._crit_edge.us115.unr-lcssa, label %.lr.ph.us114.new

._crit_edge.us115.unr-lcssa:                      ; preds = %.lr.ph.us114.new
  br i1 %lcmp.mod236.not, label %._crit_edge.us115, label %.epil.preheader231

.epil.preheader231:                               ; preds = %._crit_edge.us115.unr-lcssa, %.lr.ph.us114
  %.epil.init235 = phi float [ 0.000000e+00, %.lr.ph.us114 ], [ %46, %._crit_edge.us115.unr-lcssa ]
  %indvars.iv145.epil.init = phi i64 [ 0, %.lr.ph.us114 ], [ %indvars.iv.next146.1, %._crit_edge.us115.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod238)
  %gep.us113.epil = getelementptr [8192 x i8], ptr %invariant.gep.us112, i64 %indvars.iv145.epil.init
  %47 = load float, ptr %gep.us113.epil, align 4
  %48 = load float, ptr %34, align 4
  %49 = fsub float %47, %48
  %50 = fmul float %49, %49
  %51 = fadd float %.epil.init235, %50
  store float %51, ptr %33, align 4
  br label %._crit_edge.us115

._crit_edge.us115:                                ; preds = %._crit_edge.us115.unr-lcssa, %.epil.preheader231
  %.lcssa227 = phi float [ %46, %._crit_edge.us115.unr-lcssa ], [ %51, %.epil.preheader231 ]
  %52 = fdiv float %.lcssa227, f0x4A442E10
  %53 = tail call noundef float @sqrtf(float noundef %52) #16
  %54 = fcmp ugt float %53, 5.000000e-03
  %55 = select i1 %54, float %53, float 1.000000e+00
  store float %55, ptr %33, align 4
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond154.not = icmp eq i64 %indvars.iv.next151, %wide.trip.count153
  br i1 %exitcond154.not, label %.preheader102.preheader, label %.lr.ph.us114

.preheader103.thread:                             ; preds = %.lr.ph111.split, %middle.block, %6
  %56 = icmp sgt i32 %1, 0
  br label %.preheader

.preheader102.preheader:                          ; preds = %._crit_edge.us115
  %wide.trip.count163 = zext nneg i32 %1 to i64
  %wide.trip.count158 = zext nneg i32 %0 to i64
  %57 = shl nuw nsw i64 %wide.trip.count, 13
  %58 = shl nuw nsw i64 %wide.trip.count138, 2
  %59 = getelementptr i8, ptr %2, i64 %57
  %60 = getelementptr i8, ptr %59, i64 %58
  %scevgep207 = getelementptr i8, ptr %60, i64 -8192
  %scevgep208 = getelementptr i8, ptr %3, i64 %58
  %scevgep209 = getelementptr i8, ptr %4, i64 %58
  %min.iters.check214 = icmp ult i32 %0, 4
  %bound0 = icmp ult ptr %2, %scevgep208
  %bound1 = icmp ult ptr %3, %scevgep207
  %found.conflict = and i1 %bound0, %bound1
  %bound0210 = icmp ult ptr %2, %scevgep209
  %bound1211 = icmp ult ptr %4, %scevgep207
  %found.conflict212 = and i1 %bound0210, %bound1211
  %conflict.rdx = or i1 %found.conflict, %found.conflict212
  %n.vec217 = and i64 %wide.trip.count138, 2147483644
  %cmp.n224 = icmp eq i64 %n.vec217, %wide.trip.count138
  %xtraiter241 = and i64 %wide.trip.count138, 1
  %lcmp.mod242.not = icmp eq i64 %xtraiter241, 0
  %61 = add nsw i64 %wide.trip.count138, -1
  br label %.preheader102

.lr.ph111.split:                                  ; preds = %.lr.ph111.split.preheader, %.lr.ph111.split
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %.lr.ph111.split ], [ %indvars.iv140.ph, %.lr.ph111.split.preheader ]
  %62 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv140
  store float 1.000000e+00, ptr %62, align 4
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond144.not = icmp eq i64 %indvars.iv.next141, %wide.trip.count143
  br i1 %exitcond144.not, label %.preheader103.thread, label %.lr.ph111.split, !llvm.loop !8

.preheader102:                                    ; preds = %.preheader102.preheader, %._crit_edge
  %indvars.iv160 = phi i64 [ 0, %.preheader102.preheader ], [ %indvars.iv.next161, %._crit_edge ]
  %63 = getelementptr [8192 x i8], ptr %2, i64 %indvars.iv160
  %brmerge = select i1 %min.iters.check214, i1 true, i1 %conflict.rdx
  br i1 %brmerge, label %scalar.ph213.preheader, label %vector.body218

vector.body218:                                   ; preds = %.preheader102, %vector.body218
  %index219 = phi i64 [ %index.next222, %vector.body218 ], [ 0, %.preheader102 ]
  %64 = getelementptr [4 x i8], ptr %3, i64 %index219
  %wide.load = load <4 x float>, ptr %64, align 4, !alias.scope !9
  %65 = getelementptr [4 x i8], ptr %63, i64 %index219
  %wide.load220 = load <4 x float>, ptr %65, align 4, !alias.scope !12, !noalias !14
  %66 = fsub <4 x float> %wide.load220, %wide.load
  store <4 x float> %66, ptr %65, align 4, !alias.scope !12, !noalias !14
  %67 = getelementptr [4 x i8], ptr %4, i64 %index219
  %wide.load221 = load <4 x float>, ptr %67, align 4, !alias.scope !16
  %68 = fmul <4 x float> %wide.load221, splat (float f0x44E01A51)
  %69 = fdiv <4 x float> %66, %68
  store <4 x float> %69, ptr %65, align 4, !alias.scope !12, !noalias !14
  %index.next222 = add nuw i64 %index219, 4
  %70 = icmp eq i64 %index.next222, %n.vec217
  br i1 %70, label %middle.block223, label %vector.body218, !llvm.loop !17

middle.block223:                                  ; preds = %vector.body218
  br i1 %cmp.n224, label %._crit_edge, label %scalar.ph213.preheader

scalar.ph213.preheader:                           ; preds = %.preheader102, %middle.block223
  %indvars.iv155.ph = phi i64 [ %n.vec217, %middle.block223 ], [ 0, %.preheader102 ]
  br i1 %lcmp.mod242.not, label %scalar.ph213.prol.loopexit, label %scalar.ph213.prol

scalar.ph213.prol:                                ; preds = %scalar.ph213.preheader
  %71 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv155.ph
  %72 = load float, ptr %71, align 4
  %73 = getelementptr [4 x i8], ptr %63, i64 %indvars.iv155.ph
  %74 = load float, ptr %73, align 4
  %75 = fsub float %74, %72
  store float %75, ptr %73, align 4
  %76 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv155.ph
  %77 = load float, ptr %76, align 4
  %78 = fmul float %77, f0x44E01A51
  %79 = fdiv float %75, %78
  store float %79, ptr %73, align 4
  %indvars.iv.next156.prol = or disjoint i64 %indvars.iv155.ph, 1
  br label %scalar.ph213.prol.loopexit

scalar.ph213.prol.loopexit:                       ; preds = %scalar.ph213.prol, %scalar.ph213.preheader
  %indvars.iv155.unr = phi i64 [ %indvars.iv155.ph, %scalar.ph213.preheader ], [ %indvars.iv.next156.prol, %scalar.ph213.prol ]
  %80 = icmp eq i64 %indvars.iv155.ph, %61
  br i1 %80, label %._crit_edge, label %scalar.ph213

.preheader:                                       ; preds = %._crit_edge, %.preheader103.thread
  %81 = phi i1 [ %56, %.preheader103.thread ], [ true, %._crit_edge ]
  %82 = add i32 %0, -1
  %83 = icmp sgt i32 %0, 1
  br i1 %83, label %.lr.ph, label %._crit_edge128

.lr.ph:                                           ; preds = %.preheader
  br i1 %81, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  %84 = add nsw i32 %0, -2
  %wide.trip.count173 = zext nneg i32 %82 to i64
  %wide.trip.count170 = zext nneg i32 %0 to i64
  %85 = add nsw i64 %wide.trip.count170, -2
  br label %.lr.ph123.preheader

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  %wide.trip.count193 = zext nneg i32 %82 to i64
  %wide.trip.count188 = zext nneg i32 %0 to i64
  %wide.trip.count178 = zext nneg i32 %1 to i64
  %xtraiter246 = and i64 %wide.trip.count178, 1
  %86 = icmp eq i32 %1, 1
  %unroll_iter253 = and i64 %wide.trip.count178, 2147483646
  %lcmp.mod250.not = icmp eq i64 %xtraiter246, 0
  %lcmp.mod252 = trunc i32 %1 to i1
  br label %.lr.ph.us125.us.preheader

.lr.ph.us125.us.preheader:                        ; preds = %.loopexit.us, %.lr.ph.split.us.preheader
  %indvars.iv190 = phi i64 [ 0, %.lr.ph.split.us.preheader ], [ %indvars.iv.next191, %.loopexit.us ]
  %indvars.iv183 = phi i64 [ 1, %.lr.ph.split.us.preheader ], [ %indvars.iv.next184, %.loopexit.us ]
  %87 = getelementptr [8192 x i8], ptr %5, i64 %indvars.iv190
  %88 = getelementptr [4 x i8], ptr %87, i64 %indvars.iv190
  store float 1.000000e+00, ptr %88, align 4
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv190, 1
  %invariant.gep.us129 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv190
  br label %.lr.ph.us125.us

.loopexit.us:                                     ; preds = %._crit_edge120.us.us
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %exitcond194.not = icmp eq i64 %indvars.iv.next191, %wide.trip.count193
  br i1 %exitcond194.not, label %._crit_edge128, label %.lr.ph.us125.us.preheader

.lr.ph.us125.us:                                  ; preds = %.lr.ph.us125.us.preheader, %._crit_edge120.us.us
  %indvars.iv185 = phi i64 [ %indvars.iv183, %.lr.ph.us125.us.preheader ], [ %indvars.iv.next186, %._crit_edge120.us.us ]
  %89 = getelementptr [4 x i8], ptr %87, i64 %indvars.iv185
  store float 0.000000e+00, ptr %89, align 4
  br i1 %86, label %.epil.preheader245, label %.lr.ph.us125.us.new

.lr.ph.us125.us.new:                              ; preds = %.lr.ph.us125.us, %.lr.ph.us125.us.new
  %indvars.iv175 = phi i64 [ %indvars.iv.next176.1, %.lr.ph.us125.us.new ], [ 0, %.lr.ph.us125.us ]
  %90 = phi float [ %105, %.lr.ph.us125.us.new ], [ 0.000000e+00, %.lr.ph.us125.us ]
  %niter254 = phi i64 [ %niter254.next.1, %.lr.ph.us125.us.new ], [ 0, %.lr.ph.us125.us ]
  %91 = getelementptr [8192 x i8], ptr %2, i64 %indvars.iv175
  %92 = getelementptr [4 x i8], ptr %91, i64 %indvars.iv190
  %93 = load float, ptr %92, align 4
  %94 = getelementptr [4 x i8], ptr %91, i64 %indvars.iv185
  %95 = load float, ptr %94, align 4
  %96 = fmul float %93, %95
  %97 = fadd float %90, %96
  store float %97, ptr %89, align 4
  %98 = getelementptr [8192 x i8], ptr %2, i64 %indvars.iv175
  %99 = getelementptr i8, ptr %98, i64 8192
  %100 = getelementptr [4 x i8], ptr %99, i64 %indvars.iv190
  %101 = load float, ptr %100, align 4
  %102 = getelementptr [4 x i8], ptr %99, i64 %indvars.iv185
  %103 = load float, ptr %102, align 4
  %104 = fmul float %101, %103
  %105 = fadd float %97, %104
  store float %105, ptr %89, align 4
  %indvars.iv.next176.1 = add nuw nsw i64 %indvars.iv175, 2
  %niter254.next.1 = add i64 %niter254, 2
  %niter254.ncmp.1 = icmp eq i64 %niter254.next.1, %unroll_iter253
  br i1 %niter254.ncmp.1, label %._crit_edge120.us.us.unr-lcssa, label %.lr.ph.us125.us.new

._crit_edge120.us.us.unr-lcssa:                   ; preds = %.lr.ph.us125.us.new
  br i1 %lcmp.mod250.not, label %._crit_edge120.us.us, label %.epil.preheader245

.epil.preheader245:                               ; preds = %._crit_edge120.us.us.unr-lcssa, %.lr.ph.us125.us
  %indvars.iv175.epil.init = phi i64 [ 0, %.lr.ph.us125.us ], [ %indvars.iv.next176.1, %._crit_edge120.us.us.unr-lcssa ]
  %.epil.init249 = phi float [ 0.000000e+00, %.lr.ph.us125.us ], [ %105, %._crit_edge120.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod252)
  %106 = getelementptr [8192 x i8], ptr %2, i64 %indvars.iv175.epil.init
  %107 = getelementptr [4 x i8], ptr %106, i64 %indvars.iv190
  %108 = load float, ptr %107, align 4
  %109 = getelementptr [4 x i8], ptr %106, i64 %indvars.iv185
  %110 = load float, ptr %109, align 4
  %111 = fmul float %108, %110
  %112 = fadd float %.epil.init249, %111
  store float %112, ptr %89, align 4
  br label %._crit_edge120.us.us

._crit_edge120.us.us:                             ; preds = %._crit_edge120.us.us.unr-lcssa, %.epil.preheader245
  %.lcssa = phi float [ %105, %._crit_edge120.us.us.unr-lcssa ], [ %112, %.epil.preheader245 ]
  %gep.us124.us = getelementptr [8192 x i8], ptr %invariant.gep.us129, i64 %indvars.iv185
  store float %.lcssa, ptr %gep.us124.us, align 4
  %indvars.iv.next186 = add nuw nsw i64 %indvars.iv185, 1
  %exitcond189.not = icmp eq i64 %indvars.iv.next186, %wide.trip.count188
  br i1 %exitcond189.not, label %.loopexit.us, label %.lr.ph.us125.us

scalar.ph213:                                     ; preds = %scalar.ph213.prol.loopexit, %scalar.ph213
  %indvars.iv155 = phi i64 [ %indvars.iv.next156.1, %scalar.ph213 ], [ %indvars.iv155.unr, %scalar.ph213.prol.loopexit ]
  %113 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv155
  %114 = load float, ptr %113, align 4
  %115 = getelementptr [4 x i8], ptr %63, i64 %indvars.iv155
  %116 = load float, ptr %115, align 4
  %117 = fsub float %116, %114
  store float %117, ptr %115, align 4
  %118 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv155
  %119 = load float, ptr %118, align 4
  %120 = fmul float %119, f0x44E01A51
  %121 = fdiv float %117, %120
  store float %121, ptr %115, align 4
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %122 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv.next156
  %123 = load float, ptr %122, align 4
  %124 = getelementptr [4 x i8], ptr %63, i64 %indvars.iv.next156
  %125 = load float, ptr %124, align 4
  %126 = fsub float %125, %123
  store float %126, ptr %124, align 4
  %127 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv.next156
  %128 = load float, ptr %127, align 4
  %129 = fmul float %128, f0x44E01A51
  %130 = fdiv float %126, %129
  store float %130, ptr %124, align 4
  %indvars.iv.next156.1 = add nuw nsw i64 %indvars.iv155, 2
  %exitcond159.not.1 = icmp eq i64 %indvars.iv.next156.1, %wide.trip.count158
  br i1 %exitcond159.not.1, label %._crit_edge, label %scalar.ph213, !llvm.loop !18

._crit_edge:                                      ; preds = %scalar.ph213.prol.loopexit, %scalar.ph213, %middle.block223
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %exitcond164.not = icmp eq i64 %indvars.iv.next161, %wide.trip.count163
  br i1 %exitcond164.not, label %.preheader, label %.preheader102

.loopexit:                                        ; preds = %.lr.ph123, %.lr.ph123.prol.loopexit
  %indvars.iv.next166 = add nuw nsw i64 %indvars.iv165, 1
  %exitcond174.not = icmp eq i64 %indvar.next, %wide.trip.count173
  br i1 %exitcond174.not, label %._crit_edge128, label %.lr.ph123.preheader

.lr.ph123.preheader:                              ; preds = %.loopexit, %.lr.ph.split.preheader
  %indvars.iv165 = phi i64 [ 1, %.lr.ph.split.preheader ], [ %indvars.iv.next166, %.loopexit ]
  %indvar = phi i64 [ 0, %.lr.ph.split.preheader ], [ %indvar.next, %.loopexit ]
  %131 = xor i64 %indvar, -1
  %132 = add nsw i64 %131, %wide.trip.count170
  %133 = sub i64 %85, %indvar
  %134 = getelementptr [8192 x i8], ptr %5, i64 %indvar
  %135 = getelementptr [4 x i8], ptr %134, i64 %indvar
  store float 1.000000e+00, ptr %135, align 4
  %indvar.next = add nuw nsw i64 %indvar, 1
  %invariant.gep = getelementptr [4 x i8], ptr %5, i64 %indvar
  %136 = trunc i64 %indvar to i32
  %137 = sub i32 %84, %136
  %138 = zext i32 %137 to i64
  %139 = shl nuw nsw i64 %138, 2
  %140 = add nuw nsw i64 %139, 4
  %141 = mul nuw nsw i64 %indvar, 8196
  %142 = getelementptr i8, ptr %5, i64 %141
  %scevgep = getelementptr i8, ptr %142, i64 4
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1) %scevgep, i8 0, i64 %140, i1 false)
  %xtraiter243 = and i64 %132, 3
  %lcmp.mod244.not = icmp eq i64 %xtraiter243, 0
  br i1 %lcmp.mod244.not, label %.lr.ph123.prol.loopexit, label %.lr.ph123.prol

.lr.ph123.prol:                                   ; preds = %.lr.ph123.preheader, %.lr.ph123.prol
  %indvars.iv167.prol = phi i64 [ %indvars.iv.next168.prol, %.lr.ph123.prol ], [ %indvars.iv165, %.lr.ph123.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %.lr.ph123.prol ], [ 0, %.lr.ph123.preheader ]
  %gep.prol = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv167.prol
  store float 0.000000e+00, ptr %gep.prol, align 4
  %indvars.iv.next168.prol = add nuw nsw i64 %indvars.iv167.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter243
  br i1 %prol.iter.cmp.not, label %.lr.ph123.prol.loopexit, label %.lr.ph123.prol, !llvm.loop !19

.lr.ph123.prol.loopexit:                          ; preds = %.lr.ph123.prol, %.lr.ph123.preheader
  %indvars.iv167.unr = phi i64 [ %indvars.iv165, %.lr.ph123.preheader ], [ %indvars.iv.next168.prol, %.lr.ph123.prol ]
  %143 = icmp ult i64 %133, 3
  br i1 %143, label %.loopexit, label %.lr.ph123

.lr.ph123:                                        ; preds = %.lr.ph123.prol.loopexit, %.lr.ph123
  %indvars.iv167 = phi i64 [ %indvars.iv.next168.3, %.lr.ph123 ], [ %indvars.iv167.unr, %.lr.ph123.prol.loopexit ]
  %gep = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv167
  store float 0.000000e+00, ptr %gep, align 4
  %144 = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv167
  %gep.1 = getelementptr i8, ptr %144, i64 8192
  store float 0.000000e+00, ptr %gep.1, align 4
  %145 = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv167
  %gep.2 = getelementptr i8, ptr %145, i64 16384
  store float 0.000000e+00, ptr %gep.2, align 4
  %146 = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv167
  %gep.3 = getelementptr i8, ptr %146, i64 24576
  store float 0.000000e+00, ptr %gep.3, align 4
  %indvars.iv.next168.3 = add nuw nsw i64 %indvars.iv167, 4
  %exitcond171.not.3 = icmp eq i64 %indvars.iv.next168.3, %wide.trip.count170
  br i1 %exitcond171.not.3, label %.loopexit, label %.lr.ph123

._crit_edge128:                                   ; preds = %.loopexit, %.loopexit.us, %.preheader
  %147 = getelementptr i8, ptr %5, i64 16777212
  store float 1.000000e+00, ptr %147, align 4
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiiPA2048_fS0_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #5 {
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
  %7 = getelementptr [8192 x i8], ptr %2, i64 %indvars.iv23
  %8 = getelementptr [8192 x i8], ptr %3, i64 %indvars.iv23
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
  %40 = fcmp ogt <4 x double> %39, splat (double 1.050000e+00)
  %.not31 = select <4 x i1> %18, <4 x i1> splat (i1 true), <4 x i1> %23
  %narrow = select <4 x i1> %.not31, <4 x i1> %40, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %41 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !20

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
  %74 = fcmp ogt double %73, 1.050000e+00
  %75 = zext i1 %74 to i32
  br label %_Z11percentDiffdd.exit.us

_Z11percentDiffdd.exit.us:                        ; preds = %.critedge.i.us, %54
  %common.ret.op.i.us = phi i32 [ %75, %.critedge.i.us ], [ 0, %54 ]
  %.2.us = add nsw i32 %common.ret.op.i.us, %.116.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !21

._crit_edge.us:                                   ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %.2.us.lcssa = phi i32 [ %43, %middle.block ], [ %.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27.not = icmp eq i64 %indvars.iv.next24, %wide.trip.count26
  br i1 %exitcond27.not, label %._crit_edge19, label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge.us, %4
  %.0.lcssa = phi i32 [ 0, %4 ], [ %.2.us.lcssa, %._crit_edge.us ]
  %76 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 1.050000e+00, i32 noundef %.0.lcssa) #6
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #6

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #6

define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #7 {
  %1 = alloca %struct.cudaDeviceProp, align 8
  %2 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %1, i32 noundef 0) #6
  %3 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %1) #6
  %4 = call i32 @cudaSetDevice(i32 noundef 0) #6
  ret void
}

declare dso_local i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare dso_local i32 @cudaLaunchKernel(ptr, %struct.dim3, %struct.dim3, ptr, i64, ptr) local_unnamed_addr

define dso_local void @_Z26__device_stub__mean_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #7 {
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
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mean_kerneliiPfS_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
  ret void
}

define dso_local void @_Z25__device_stub__std_kerneliiPfS_S_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #7 {
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
  %23 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z25__device_stub__std_kerneliiPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %11, i64 noundef %21, ptr noundef %22)
  ret void
}

define dso_local void @_Z28__device_stub__reduce_kerneliiPfS_S_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #7 {
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
  %23 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z28__device_stub__reduce_kerneliiPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %11, i64 noundef %21, ptr noundef %22)
  ret void
}

define dso_local void @_Z26__device_stub__corr_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #7 {
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
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__corr_kerneliiPfS_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #6

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare noundef i32 @gettimeofday(ptr noalias noundef nonnull captures(none), ptr noalias noundef captures(none)) local_unnamed_addr #4

; Function Attrs: nofree nounwind
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #5 {
  %1 = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #16
  %.not.i = icmp eq i32 %2, 0
  br i1 %.not.i, label %_ZL7rtclockv.exit, label %3

3:                                                ; preds = %0
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %2) #6
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

declare i32 @__cudaPushCallConfiguration(%struct.dim3, %struct.dim3, i64 noundef, ptr noundef) local_unnamed_addr #6

declare i32 @cudaThreadSynchronize() local_unnamed_addr #6

; Function Attrs: nofree nounwind
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #5 {
  %1 = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #16
  %.not.i = icmp eq i32 %2, 0
  br i1 %.not.i, label %_ZL7rtclockv.exit, label %3

3:                                                ; preds = %0
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %2) #6
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
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %3) #6
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #6

define dso_local void @_Z15correlationCudaiiPA2048_fPfS1_S0_S0_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) local_unnamed_addr #7 {
  %8 = alloca %struct.timeval, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca [4 x ptr], align 16
  %14 = alloca %struct.dim3, align 8
  %15 = alloca %struct.dim3, align 8
  %16 = alloca i64, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca [5 x ptr], align 16
  %24 = alloca %struct.dim3, align 8
  %25 = alloca %struct.dim3, align 8
  %26 = alloca i64, align 8
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca [5 x ptr], align 16
  %34 = alloca %struct.dim3, align 8
  %35 = alloca %struct.dim3, align 8
  %36 = alloca i64, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca ptr, align 8
  %41 = alloca ptr, align 8
  %42 = alloca [4 x ptr], align 16
  %43 = alloca %struct.dim3, align 8
  %44 = alloca %struct.dim3, align 8
  %45 = alloca i64, align 8
  %46 = alloca ptr, align 8
  %47 = alloca %struct.timeval, align 8
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca ptr, align 8
  %52 = alloca float, align 4
  %53 = call i32 @cudaMalloc(ptr noundef nonnull %48, i64 noundef 16777216) #6
  %54 = call i32 @cudaMalloc(ptr noundef nonnull %51, i64 noundef 16777216) #6
  %55 = call i32 @cudaMalloc(ptr noundef nonnull %49, i64 noundef 8192) #6
  %56 = call i32 @cudaMalloc(ptr noundef nonnull %50, i64 noundef 8192) #6
  %57 = load ptr, ptr %48, align 8
  %58 = call i32 @cudaMemcpy(ptr noundef %57, ptr noundef %2, i64 noundef 16777216, i32 noundef 1) #6
  %59 = load ptr, ptr %51, align 8
  %60 = call i32 @cudaMemcpy(ptr noundef %59, ptr noundef %5, i64 noundef 16777216, i32 noundef 1) #6
  %61 = load ptr, ptr %49, align 8
  %62 = call i32 @cudaMemcpy(ptr noundef %61, ptr noundef %4, i64 noundef 8192, i32 noundef 1) #6
  %63 = load ptr, ptr %50, align 8
  %64 = call i32 @cudaMemcpy(ptr noundef %63, ptr noundef %3, i64 noundef 8192, i32 noundef 1) #6
  call void @llvm.lifetime.start.p0(ptr nonnull %47)
  %65 = call i32 @gettimeofday(ptr noundef nonnull %47, ptr noundef null) #16
  %.not.i.i = icmp eq i32 %65, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %66

66:                                               ; preds = %7
  %67 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %65) #6
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %7, %66
  %68 = load i64, ptr %47, align 8
  %69 = sitofp i64 %68 to double
  %70 = getelementptr inbounds nuw i8, ptr %47, i64 8
  %71 = load i64, ptr %70, align 8
  %72 = sitofp i64 %71 to double
  %73 = fmul nnan double %72, f0x3EB0C6F7A0B5ED8D
  %74 = fadd double %73, %69
  call void @llvm.lifetime.end.p0(ptr nonnull %47)
  store double %74, ptr @polybench_t_start, align 8
  %75 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 8, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #6
  %.not = icmp eq i32 %75, 0
  br i1 %.not, label %76, label %86

76:                                               ; preds = %_Z21polybench_timer_startv.exit
  %77 = load ptr, ptr %50, align 8
  %78 = load ptr, ptr %48, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %38)
  call void @llvm.lifetime.start.p0(ptr nonnull %39)
  call void @llvm.lifetime.start.p0(ptr nonnull %40)
  call void @llvm.lifetime.start.p0(ptr nonnull %41)
  call void @llvm.lifetime.start.p0(ptr nonnull %42)
  call void @llvm.lifetime.start.p0(ptr nonnull %43)
  call void @llvm.lifetime.start.p0(ptr nonnull %44)
  call void @llvm.lifetime.start.p0(ptr nonnull %45)
  call void @llvm.lifetime.start.p0(ptr nonnull %46)
  store i32 %0, ptr %38, align 4
  store i32 %1, ptr %39, align 4
  store ptr %77, ptr %40, align 8
  store ptr %78, ptr %41, align 8
  store ptr %38, ptr %42, align 16
  %79 = getelementptr inbounds nuw i8, ptr %42, i64 8
  store ptr %39, ptr %79, align 8
  %80 = getelementptr inbounds nuw i8, ptr %42, i64 16
  store ptr %40, ptr %80, align 16
  %81 = getelementptr inbounds nuw i8, ptr %42, i64 24
  store ptr %41, ptr %81, align 8
  %82 = call i32 @__cudaPopCallConfiguration(ptr nonnull %43, ptr nonnull %44, ptr nonnull %45, ptr nonnull %46), !inline_history !22
  %83 = load i64, ptr %45, align 8
  %84 = load ptr, ptr %46, align 8
  %.fca.0.load2.i = load i32, ptr %43, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %43, i64 4
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %43, i64 8
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %44, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %44, i64 4
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %44, i64 8
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %85 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mean_kerneliiPfS_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %42, i64 noundef %83, ptr noundef %84), !inline_history !22
  call void @llvm.lifetime.end.p0(ptr nonnull %38)
  call void @llvm.lifetime.end.p0(ptr nonnull %39)
  call void @llvm.lifetime.end.p0(ptr nonnull %40)
  call void @llvm.lifetime.end.p0(ptr nonnull %41)
  call void @llvm.lifetime.end.p0(ptr nonnull %42)
  call void @llvm.lifetime.end.p0(ptr nonnull %43)
  call void @llvm.lifetime.end.p0(ptr nonnull %44)
  call void @llvm.lifetime.end.p0(ptr nonnull %45)
  call void @llvm.lifetime.end.p0(ptr nonnull %46)
  br label %86

86:                                               ; preds = %_Z21polybench_timer_startv.exit, %76
  %87 = call i32 @cudaThreadSynchronize() #6
  %88 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 8, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #6
  %.not54 = icmp eq i32 %88, 0
  br i1 %.not54, label %89, label %101

89:                                               ; preds = %86
  %90 = load ptr, ptr %50, align 8
  %91 = load ptr, ptr %49, align 8
  %92 = load ptr, ptr %48, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %28)
  call void @llvm.lifetime.start.p0(ptr nonnull %29)
  call void @llvm.lifetime.start.p0(ptr nonnull %30)
  call void @llvm.lifetime.start.p0(ptr nonnull %31)
  call void @llvm.lifetime.start.p0(ptr nonnull %32)
  call void @llvm.lifetime.start.p0(ptr nonnull %33)
  call void @llvm.lifetime.start.p0(ptr nonnull %34)
  call void @llvm.lifetime.start.p0(ptr nonnull %35)
  call void @llvm.lifetime.start.p0(ptr nonnull %36)
  call void @llvm.lifetime.start.p0(ptr nonnull %37)
  store i32 %0, ptr %28, align 4
  store i32 %1, ptr %29, align 4
  store ptr %90, ptr %30, align 8
  store ptr %91, ptr %31, align 8
  store ptr %92, ptr %32, align 8
  store ptr %28, ptr %33, align 16
  %93 = getelementptr inbounds nuw i8, ptr %33, i64 8
  store ptr %29, ptr %93, align 8
  %94 = getelementptr inbounds nuw i8, ptr %33, i64 16
  store ptr %30, ptr %94, align 16
  %95 = getelementptr inbounds nuw i8, ptr %33, i64 24
  store ptr %31, ptr %95, align 8
  %96 = getelementptr inbounds nuw i8, ptr %33, i64 32
  store ptr %32, ptr %96, align 16
  %97 = call i32 @__cudaPopCallConfiguration(ptr nonnull %34, ptr nonnull %35, ptr nonnull %36, ptr nonnull %37), !inline_history !23
  %98 = load i64, ptr %36, align 8
  %99 = load ptr, ptr %37, align 8
  %.fca.0.load2.i57 = load i32, ptr %34, align 8
  %.fca.0.insert3.i58 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i57, 0
  %.fca.1.gep4.i59 = getelementptr inbounds nuw i8, ptr %34, i64 4
  %.fca.1.load5.i60 = load i32, ptr %.fca.1.gep4.i59, align 4
  %.fca.1.insert6.i61 = insertvalue %struct.dim3 %.fca.0.insert3.i58, i32 %.fca.1.load5.i60, 1
  %.fca.2.gep7.i62 = getelementptr inbounds nuw i8, ptr %34, i64 8
  %.fca.2.load8.i63 = load i32, ptr %.fca.2.gep7.i62, align 8
  %.fca.2.insert9.i64 = insertvalue %struct.dim3 %.fca.1.insert6.i61, i32 %.fca.2.load8.i63, 2
  %.fca.0.load.i65 = load i32, ptr %35, align 8
  %.fca.0.insert.i66 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i65, 0
  %.fca.1.gep.i67 = getelementptr inbounds nuw i8, ptr %35, i64 4
  %.fca.1.load.i68 = load i32, ptr %.fca.1.gep.i67, align 4
  %.fca.1.insert.i69 = insertvalue %struct.dim3 %.fca.0.insert.i66, i32 %.fca.1.load.i68, 1
  %.fca.2.gep.i70 = getelementptr inbounds nuw i8, ptr %35, i64 8
  %.fca.2.load.i71 = load i32, ptr %.fca.2.gep.i70, align 8
  %.fca.2.insert.i72 = insertvalue %struct.dim3 %.fca.1.insert.i69, i32 %.fca.2.load.i71, 2
  %100 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z25__device_stub__std_kerneliiPfS_S_, %struct.dim3 %.fca.2.insert9.i64, %struct.dim3 %.fca.2.insert.i72, ptr noundef nonnull %33, i64 noundef %98, ptr noundef %99), !inline_history !23
  call void @llvm.lifetime.end.p0(ptr nonnull %28)
  call void @llvm.lifetime.end.p0(ptr nonnull %29)
  call void @llvm.lifetime.end.p0(ptr nonnull %30)
  call void @llvm.lifetime.end.p0(ptr nonnull %31)
  call void @llvm.lifetime.end.p0(ptr nonnull %32)
  call void @llvm.lifetime.end.p0(ptr nonnull %33)
  call void @llvm.lifetime.end.p0(ptr nonnull %34)
  call void @llvm.lifetime.end.p0(ptr nonnull %35)
  call void @llvm.lifetime.end.p0(ptr nonnull %36)
  call void @llvm.lifetime.end.p0(ptr nonnull %37)
  br label %101

101:                                              ; preds = %86, %89
  %102 = call i32 @cudaThreadSynchronize() #6
  %103 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 64, i32 256, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #6
  %.not55 = icmp eq i32 %103, 0
  br i1 %.not55, label %104, label %116

104:                                              ; preds = %101
  %105 = load ptr, ptr %50, align 8
  %106 = load ptr, ptr %49, align 8
  %107 = load ptr, ptr %48, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %18)
  call void @llvm.lifetime.start.p0(ptr nonnull %19)
  call void @llvm.lifetime.start.p0(ptr nonnull %20)
  call void @llvm.lifetime.start.p0(ptr nonnull %21)
  call void @llvm.lifetime.start.p0(ptr nonnull %22)
  call void @llvm.lifetime.start.p0(ptr nonnull %23)
  call void @llvm.lifetime.start.p0(ptr nonnull %24)
  call void @llvm.lifetime.start.p0(ptr nonnull %25)
  call void @llvm.lifetime.start.p0(ptr nonnull %26)
  call void @llvm.lifetime.start.p0(ptr nonnull %27)
  store i32 %0, ptr %18, align 4
  store i32 %1, ptr %19, align 4
  store ptr %105, ptr %20, align 8
  store ptr %106, ptr %21, align 8
  store ptr %107, ptr %22, align 8
  store ptr %18, ptr %23, align 16
  %108 = getelementptr inbounds nuw i8, ptr %23, i64 8
  store ptr %19, ptr %108, align 8
  %109 = getelementptr inbounds nuw i8, ptr %23, i64 16
  store ptr %20, ptr %109, align 16
  %110 = getelementptr inbounds nuw i8, ptr %23, i64 24
  store ptr %21, ptr %110, align 8
  %111 = getelementptr inbounds nuw i8, ptr %23, i64 32
  store ptr %22, ptr %111, align 16
  %112 = call i32 @__cudaPopCallConfiguration(ptr nonnull %24, ptr nonnull %25, ptr nonnull %26, ptr nonnull %27), !inline_history !24
  %113 = load i64, ptr %26, align 8
  %114 = load ptr, ptr %27, align 8
  %.fca.0.load2.i73 = load i32, ptr %24, align 8
  %.fca.0.insert3.i74 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i73, 0
  %.fca.1.gep4.i75 = getelementptr inbounds nuw i8, ptr %24, i64 4
  %.fca.1.load5.i76 = load i32, ptr %.fca.1.gep4.i75, align 4
  %.fca.1.insert6.i77 = insertvalue %struct.dim3 %.fca.0.insert3.i74, i32 %.fca.1.load5.i76, 1
  %.fca.2.gep7.i78 = getelementptr inbounds nuw i8, ptr %24, i64 8
  %.fca.2.load8.i79 = load i32, ptr %.fca.2.gep7.i78, align 8
  %.fca.2.insert9.i80 = insertvalue %struct.dim3 %.fca.1.insert6.i77, i32 %.fca.2.load8.i79, 2
  %.fca.0.load.i81 = load i32, ptr %25, align 8
  %.fca.0.insert.i82 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i81, 0
  %.fca.1.gep.i83 = getelementptr inbounds nuw i8, ptr %25, i64 4
  %.fca.1.load.i84 = load i32, ptr %.fca.1.gep.i83, align 4
  %.fca.1.insert.i85 = insertvalue %struct.dim3 %.fca.0.insert.i82, i32 %.fca.1.load.i84, 1
  %.fca.2.gep.i86 = getelementptr inbounds nuw i8, ptr %25, i64 8
  %.fca.2.load.i87 = load i32, ptr %.fca.2.gep.i86, align 8
  %.fca.2.insert.i88 = insertvalue %struct.dim3 %.fca.1.insert.i85, i32 %.fca.2.load.i87, 2
  %115 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z28__device_stub__reduce_kerneliiPfS_S_, %struct.dim3 %.fca.2.insert9.i80, %struct.dim3 %.fca.2.insert.i88, ptr noundef nonnull %23, i64 noundef %113, ptr noundef %114), !inline_history !24
  call void @llvm.lifetime.end.p0(ptr nonnull %18)
  call void @llvm.lifetime.end.p0(ptr nonnull %19)
  call void @llvm.lifetime.end.p0(ptr nonnull %20)
  call void @llvm.lifetime.end.p0(ptr nonnull %21)
  call void @llvm.lifetime.end.p0(ptr nonnull %22)
  call void @llvm.lifetime.end.p0(ptr nonnull %23)
  call void @llvm.lifetime.end.p0(ptr nonnull %24)
  call void @llvm.lifetime.end.p0(ptr nonnull %25)
  call void @llvm.lifetime.end.p0(ptr nonnull %26)
  call void @llvm.lifetime.end.p0(ptr nonnull %27)
  br label %116

116:                                              ; preds = %101, %104
  %117 = call i32 @cudaThreadSynchronize() #6
  %118 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 8, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #6
  %.not56 = icmp eq i32 %118, 0
  br i1 %.not56, label %119, label %129

119:                                              ; preds = %116
  %120 = load ptr, ptr %51, align 8
  %121 = load ptr, ptr %48, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  call void @llvm.lifetime.start.p0(ptr nonnull %15)
  call void @llvm.lifetime.start.p0(ptr nonnull %16)
  call void @llvm.lifetime.start.p0(ptr nonnull %17)
  store i32 %0, ptr %9, align 4
  store i32 %1, ptr %10, align 4
  store ptr %120, ptr %11, align 8
  store ptr %121, ptr %12, align 8
  store ptr %9, ptr %13, align 16
  %122 = getelementptr inbounds nuw i8, ptr %13, i64 8
  store ptr %10, ptr %122, align 8
  %123 = getelementptr inbounds nuw i8, ptr %13, i64 16
  store ptr %11, ptr %123, align 16
  %124 = getelementptr inbounds nuw i8, ptr %13, i64 24
  store ptr %12, ptr %124, align 8
  %125 = call i32 @__cudaPopCallConfiguration(ptr nonnull %14, ptr nonnull %15, ptr nonnull %16, ptr nonnull %17), !inline_history !25
  %126 = load i64, ptr %16, align 8
  %127 = load ptr, ptr %17, align 8
  %.fca.0.load2.i89 = load i32, ptr %14, align 8
  %.fca.0.insert3.i90 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i89, 0
  %.fca.1.gep4.i91 = getelementptr inbounds nuw i8, ptr %14, i64 4
  %.fca.1.load5.i92 = load i32, ptr %.fca.1.gep4.i91, align 4
  %.fca.1.insert6.i93 = insertvalue %struct.dim3 %.fca.0.insert3.i90, i32 %.fca.1.load5.i92, 1
  %.fca.2.gep7.i94 = getelementptr inbounds nuw i8, ptr %14, i64 8
  %.fca.2.load8.i95 = load i32, ptr %.fca.2.gep7.i94, align 8
  %.fca.2.insert9.i96 = insertvalue %struct.dim3 %.fca.1.insert6.i93, i32 %.fca.2.load8.i95, 2
  %.fca.0.load.i97 = load i32, ptr %15, align 8
  %.fca.0.insert.i98 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i97, 0
  %.fca.1.gep.i99 = getelementptr inbounds nuw i8, ptr %15, i64 4
  %.fca.1.load.i100 = load i32, ptr %.fca.1.gep.i99, align 4
  %.fca.1.insert.i101 = insertvalue %struct.dim3 %.fca.0.insert.i98, i32 %.fca.1.load.i100, 1
  %.fca.2.gep.i102 = getelementptr inbounds nuw i8, ptr %15, i64 8
  %.fca.2.load.i103 = load i32, ptr %.fca.2.gep.i102, align 8
  %.fca.2.insert.i104 = insertvalue %struct.dim3 %.fca.1.insert.i101, i32 %.fca.2.load.i103, 2
  %128 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__corr_kerneliiPfS_, %struct.dim3 %.fca.2.insert9.i96, %struct.dim3 %.fca.2.insert.i104, ptr noundef nonnull %13, i64 noundef %126, ptr noundef %127), !inline_history !25
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  call void @llvm.lifetime.end.p0(ptr nonnull %13)
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  call void @llvm.lifetime.end.p0(ptr nonnull %15)
  call void @llvm.lifetime.end.p0(ptr nonnull %16)
  call void @llvm.lifetime.end.p0(ptr nonnull %17)
  br label %129

129:                                              ; preds = %116, %119
  %130 = call i32 @cudaThreadSynchronize() #6
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  %131 = call i32 @gettimeofday(ptr noundef nonnull %8, ptr noundef null) #16
  %.not.i.i105 = icmp eq i32 %131, 0
  br i1 %.not.i.i105, label %_Z20polybench_timer_stopv.exit, label %132

132:                                              ; preds = %129
  %133 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %131) #6
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %129, %132
  %134 = load i64, ptr %8, align 8
  %135 = sitofp i64 %134 to double
  %136 = getelementptr inbounds nuw i8, ptr %8, i64 8
  %137 = load i64, ptr %136, align 8
  %138 = sitofp i64 %137 to double
  %139 = fmul nnan double %138, f0x3EB0C6F7A0B5ED8D
  %140 = fadd double %139, %135
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  store double %140, ptr @polybench_t_end, align 8
  %141 = load double, ptr @polybench_t_start, align 8
  %142 = fsub double %140, %141
  %143 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %142) #6
  store float 1.000000e+00, ptr %52, align 4
  %144 = load ptr, ptr %51, align 8
  %145 = getelementptr i8, ptr %144, i64 16777212
  %146 = call i32 @cudaMemcpy(ptr noundef %145, ptr noundef nonnull %52, i64 noundef 4, i32 noundef 1) #6
  %147 = load ptr, ptr %51, align 8
  %148 = call i32 @cudaMemcpy(ptr noundef %6, ptr noundef %147, i64 noundef 16777216, i32 noundef 2) #6
  %149 = load ptr, ptr %48, align 8
  %150 = call i32 @cudaFree(ptr noundef %149) #6
  %151 = load ptr, ptr %51, align 8
  %152 = call i32 @cudaFree(ptr noundef %151) #6
  %153 = load ptr, ptr %49, align 8
  %154 = call i32 @cudaFree(ptr noundef %153) #6
  %155 = load ptr, ptr %50, align 8
  %156 = call i32 @cudaFree(ptr noundef %155) #6
  ret void
}

; Function Attrs: nofree
declare i32 @posix_memalign(ptr noundef nonnull, i64 noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: nofree noreturn
declare void @exit(i32 noundef) local_unnamed_addr #9

; Function Attrs: nofree nounwind
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %0, i32 noundef %1) local_unnamed_addr #5 {
  %3 = alloca ptr, align 8
  %4 = sext i32 %1 to i64
  %5 = mul i64 %0, %4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  store ptr null, ptr %3, align 8
  %6 = call i32 @posix_memalign(ptr noundef nonnull %3, i64 noundef 32, i64 noundef %5) #16
  %7 = load ptr, ptr %3, align 8
  %.not.i = icmp eq ptr %7, null
  %8 = icmp ne i32 %6, 0
  %or.cond.i = select i1 %.not.i, i1 true, i1 %8
  br i1 %or.cond.i, label %.critedge.i, label %_ZL7xmallocm.exit

.critedge.i:                                      ; preds = %2
  %9 = load ptr, ptr @stderr, align 8
  %10 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %9) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_ZL7xmallocm.exit:                                ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  ret ptr %7
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #10

define dso_local noundef i32 @main() local_unnamed_addr #7 {
  %1 = alloca %struct.timeval, align 8
  %2 = alloca %struct.timeval, align 8
  %3 = alloca %struct.cudaDeviceProp, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %9 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 16777216) #16
  %10 = load ptr, ptr %8, align 8
  %.not.i.i = icmp eq ptr %10, null
  %11 = icmp ne i32 %9, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %11
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %0
  %12 = load ptr, ptr @stderr, align 8
  %13 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %12) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %0
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %14 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 8192) #16
  %15 = load ptr, ptr %7, align 8
  %.not.i.i25 = icmp eq ptr %15, null
  %16 = icmp ne i32 %14, 0
  %or.cond.i.i26 = select i1 %.not.i.i25, i1 true, i1 %16
  br i1 %or.cond.i.i26, label %.critedge.i.i27, label %_Z20polybench_alloc_datayi.exit28

.critedge.i.i27:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %17 = load ptr, ptr @stderr, align 8
  %18 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %17) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit28:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %19 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 8192) #16
  %20 = load ptr, ptr %6, align 8
  %.not.i.i29 = icmp eq ptr %20, null
  %21 = icmp ne i32 %19, 0
  %or.cond.i.i30 = select i1 %.not.i.i29, i1 true, i1 %21
  br i1 %or.cond.i.i30, label %.critedge.i.i31, label %_Z20polybench_alloc_datayi.exit32

.critedge.i.i31:                                  ; preds = %_Z20polybench_alloc_datayi.exit28
  %22 = load ptr, ptr @stderr, align 8
  %23 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %22) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit32:                ; preds = %_Z20polybench_alloc_datayi.exit28
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  store ptr null, ptr %5, align 8
  %24 = call i32 @posix_memalign(ptr noundef nonnull %5, i64 noundef 32, i64 noundef 16777216) #16
  %25 = load ptr, ptr %5, align 8
  %.not.i.i33 = icmp eq ptr %25, null
  %26 = icmp ne i32 %24, 0
  %or.cond.i.i34 = select i1 %.not.i.i33, i1 true, i1 %26
  br i1 %or.cond.i.i34, label %.critedge.i.i35, label %_Z20polybench_alloc_datayi.exit36

.critedge.i.i35:                                  ; preds = %_Z20polybench_alloc_datayi.exit32
  %27 = load ptr, ptr @stderr, align 8
  %28 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %27) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit36:                ; preds = %_Z20polybench_alloc_datayi.exit32
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store ptr null, ptr %4, align 8
  %29 = call i32 @posix_memalign(ptr noundef nonnull %4, i64 noundef 32, i64 noundef 16777216) #16
  %30 = load ptr, ptr %4, align 8
  %.not.i.i37 = icmp eq ptr %30, null
  %31 = icmp ne i32 %29, 0
  %or.cond.i.i38 = select i1 %.not.i.i37, i1 true, i1 %31
  br i1 %or.cond.i.i38, label %.critedge.i.i39, label %_Z20polybench_alloc_datayi.exit40

.critedge.i.i39:                                  ; preds = %_Z20polybench_alloc_datayi.exit36
  %32 = load ptr, ptr @stderr, align 8
  %33 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %32) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit40:                ; preds = %_Z20polybench_alloc_datayi.exit36
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  br label %.preheader.i

.preheader.i:                                     ; preds = %._crit_edge.i, %_Z20polybench_alloc_datayi.exit40
  %indvars.iv15.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit40 ], [ %indvars.iv.next16.i, %._crit_edge.i ]
  %34 = getelementptr [8192 x i8], ptr %10, i64 %indvars.iv15.i
  %35 = trunc nuw nsw i64 %indvars.iv15.i to i32
  %36 = uitofp nneg i32 %35 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %36, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.i
  %index = phi i64 [ 0, %.preheader.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %37 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %38 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %39 = fmul nnan <4 x float> %broadcast.splat, %37
  %40 = fmul nnan <4 x float> %broadcast.splat, %38
  %41 = fmul nnan <4 x float> %39, splat (float f0x3A000000)
  %42 = fmul nnan <4 x float> %40, splat (float f0x3A000000)
  %43 = getelementptr [4 x i8], ptr %34, i64 %index
  %44 = getelementptr i8, ptr %43, i64 16
  store <4 x float> %41, ptr %43, align 4
  store <4 x float> %42, ptr %44, align 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %45 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %46 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %47 = fmul nnan <4 x float> %broadcast.splat, %45
  %48 = fmul nnan <4 x float> %broadcast.splat, %46
  %49 = fmul nnan <4 x float> %47, splat (float f0x3A000000)
  %50 = fmul nnan <4 x float> %48, splat (float f0x3A000000)
  %51 = getelementptr [4 x i8], ptr %34, i64 %index
  %52 = getelementptr i8, ptr %51, i64 32
  %53 = getelementptr i8, ptr %51, i64 48
  store <4 x float> %49, ptr %52, align 4
  store <4 x float> %50, ptr %53, align 4
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %54 = icmp eq i64 %index.next.1, 2048
  br i1 %54, label %._crit_edge.i, label %vector.body, !llvm.loop !26

._crit_edge.i:                                    ; preds = %vector.body
  %indvars.iv.next16.i = add nuw nsw i64 %indvars.iv15.i, 1
  %exitcond19.not.i = icmp eq i64 %indvars.iv.next16.i, 2048
  br i1 %exitcond19.not.i, label %_Z11init_arraysiiPA2048_f.exit, label %.preheader.i

_Z11init_arraysiiPA2048_f.exit:                   ; preds = %._crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %55 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %3, i32 noundef 0) #6
  %56 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %3) #6
  %57 = call i32 @cudaSetDevice(i32 noundef 0) #6
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  call void @_Z15correlationCudaiiPA2048_fPfS1_S0_S0_(i32 noundef 2048, i32 noundef 2048, ptr noundef nonnull %10, ptr noundef %15, ptr noundef %20, ptr noundef %25, ptr noundef %30) #6
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %58 = call i32 @gettimeofday(ptr noundef nonnull %2, ptr noundef null) #16
  %.not.i.i41 = icmp eq i32 %58, 0
  br i1 %.not.i.i41, label %_Z21polybench_timer_startv.exit, label %59

59:                                               ; preds = %_Z11init_arraysiiPA2048_f.exit
  %60 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %58) #6
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z11init_arraysiiPA2048_f.exit, %59
  %61 = load i64, ptr %2, align 8
  %62 = sitofp i64 %61 to double
  %63 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %64 = load i64, ptr %63, align 8
  %65 = sitofp i64 %64 to double
  %66 = fmul nnan double %65, f0x3EB0C6F7A0B5ED8D
  %67 = fadd double %66, %62
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  store double %67, ptr @polybench_t_start, align 8
  call void @_Z11correlationiiPA2048_fPfS1_S0_(i32 noundef 2048, i32 noundef 2048, ptr noundef nonnull %10, ptr noundef %15, ptr noundef %20, ptr noundef %25) #6
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %68 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #16
  %.not.i.i42 = icmp eq i32 %68, 0
  br i1 %.not.i.i42, label %_Z20polybench_timer_stopv.exit, label %69

69:                                               ; preds = %_Z21polybench_timer_startv.exit
  %70 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %68) #6
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z21polybench_timer_startv.exit, %69
  %71 = load i64, ptr %1, align 8
  %72 = sitofp i64 %71 to double
  %73 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %74 = load i64, ptr %73, align 8
  %75 = sitofp i64 %74 to double
  %76 = fmul nnan double %75, f0x3EB0C6F7A0B5ED8D
  %77 = fadd double %76, %72
  call void @llvm.lifetime.end.p0(ptr nonnull %1)
  store double %77, ptr @polybench_t_end, align 8
  %78 = load double, ptr @polybench_t_start, align 8
  %79 = fsub double %77, %78
  %80 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %79) #6
  br label %.preheader.us.i

.preheader.us.i:                                  ; preds = %._crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv23.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next24.i, %._crit_edge.us.i ]
  %.018.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %117, %._crit_edge.us.i ]
  %81 = getelementptr [8192 x i8], ptr %25, i64 %indvars.iv23.i
  %82 = getelementptr [8192 x i8], ptr %30, i64 %indvars.iv23.i
  %83 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.018.us.i, i64 0
  br label %vector.body53

vector.body53:                                    ; preds = %vector.body53, %.preheader.us.i
  %index54 = phi i64 [ 0, %.preheader.us.i ], [ %index.next56, %vector.body53 ]
  %vec.phi = phi <4 x i32> [ %83, %.preheader.us.i ], [ %115, %vector.body53 ]
  %84 = getelementptr [4 x i8], ptr %81, i64 %index54
  %wide.load = load <4 x float>, ptr %84, align 4
  %85 = fpext <4 x float> %wide.load to <4 x double>
  %86 = getelementptr [4 x i8], ptr %82, i64 %index54
  %wide.load55 = load <4 x float>, ptr %86, align 4
  %87 = fpext <4 x float> %wide.load55 to <4 x double>
  %88 = fcmp olt <4 x double> %85, splat (double f0xB690000000000000)
  %89 = fneg <4 x float> %wide.load
  %90 = select <4 x i1> %88, <4 x float> %89, <4 x float> %wide.load
  %91 = fpext <4 x float> %90 to <4 x double>
  %92 = fcmp uge <4 x double> %91, splat (double 1.000000e-02)
  %93 = fcmp olt <4 x double> %87, splat (double f0xB690000000000000)
  %94 = fneg <4 x float> %wide.load55
  %95 = select <4 x i1> %93, <4 x float> %94, <4 x float> %wide.load55
  %96 = fpext <4 x float> %95 to <4 x double>
  %97 = fcmp uge <4 x double> %96, splat (double 1.000000e-02)
  %98 = fsub <4 x double> %85, %87
  %99 = fptrunc <4 x double> %98 to <4 x float>
  %100 = fcmp olt <4 x double> %98, splat (double f0xB690000000000000)
  %101 = fneg <4 x float> %99
  %102 = select <4 x i1> %100, <4 x float> %101, <4 x float> %99
  %103 = fadd <4 x double> %85, splat (double f0x3E45798EE0000000)
  %104 = fptrunc <4 x double> %103 to <4 x float>
  %105 = fcmp olt <4 x double> %103, splat (double f0xB690000000000000)
  %106 = fneg <4 x float> %104
  %107 = select <4 x i1> %105, <4 x float> %106, <4 x float> %104
  %108 = fdiv <4 x float> %102, %107
  %109 = fcmp olt <4 x float> %108, zeroinitializer
  %110 = fneg <4 x float> %108
  %111 = select <4 x i1> %109, <4 x float> %110, <4 x float> %108
  %112 = fmul <4 x float> %111, splat (float 1.000000e+02)
  %113 = fpext <4 x float> %112 to <4 x double>
  %114 = fcmp ogt <4 x double> %113, splat (double 1.050000e+00)
  %.not59 = select <4 x i1> %92, <4 x i1> splat (i1 true), <4 x i1> %97
  %narrow = select <4 x i1> %.not59, <4 x i1> %114, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %115 = add <4 x i32> %vec.phi, %predphi
  %index.next56 = add nuw i64 %index54, 4
  %116 = icmp eq i64 %index.next56, 2048
  br i1 %116, label %._crit_edge.us.i, label %vector.body53, !llvm.loop !27

._crit_edge.us.i:                                 ; preds = %vector.body53
  %117 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %115)
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1
  %exitcond27.not.i = icmp eq i64 %indvars.iv.next24.i, 2048
  br i1 %exitcond27.not.i, label %_Z14compareResultsiiPA2048_fS0_.exit, label %.preheader.us.i

_Z14compareResultsiiPA2048_fS0_.exit:             ; preds = %._crit_edge.us.i
  %118 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 1.050000e+00, i32 noundef %117) #6
  call void @free(ptr noundef %10) #16
  call void @free(ptr noundef %15) #16
  call void @free(ptr noundef %20) #16
  call void @free(ptr noundef nonnull %25) #16
  call void @free(ptr noundef nonnull %30) #16
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
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #11

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #12

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #13

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #13

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #14

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #15

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: write) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(errnomem: write) "uniform-work-group-size" }
attributes #3 = { nofree norecurse nosync nounwind memory(argmem: readwrite, errnomem: write) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #4 = { nofree nounwind "uniform-work-group-size" }
attributes #5 = { nofree nounwind "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #6 = { "uniform-work-group-size" }
attributes #7 = { "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #8 = { nofree "uniform-work-group-size" }
attributes #9 = { nofree noreturn "uniform-work-group-size" }
attributes #10 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "uniform-work-group-size" }
attributes #11 = { nofree nounwind }
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #13 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #14 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #15 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #16 = { nounwind "uniform-work-group-size" }
attributes #17 = { cold }
attributes #18 = { cold noreturn nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.isvectorized", i32 1}
!3 = !{!"llvm.loop.unroll.runtime.disable"}
!4 = distinct !{!4, !3, !2}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !2, !3}
!8 = distinct !{!8, !3, !2}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!10, !15}
!15 = distinct !{!15, !11}
!16 = !{!15}
!17 = distinct !{!17, !2, !3}
!18 = distinct !{!18, !2}
!19 = distinct !{!19, !6}
!20 = distinct !{!20, !2, !3}
!21 = distinct !{!21, !3, !2}
!22 = !{ptr @_Z26__device_stub__mean_kerneliiPfS_}
!23 = !{ptr @_Z25__device_stub__std_kerneliiPfS_S_}
!24 = !{ptr @_Z28__device_stub__reduce_kerneliiPfS_S_}
!25 = !{ptr @_Z26__device_stub__corr_kerneliiPfS_}
!26 = distinct !{!26, !2, !3}
!27 = distinct !{!27, !2, !3}
