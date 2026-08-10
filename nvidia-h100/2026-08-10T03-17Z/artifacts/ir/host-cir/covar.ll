; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/COVAR/covariance.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/COVAR/covariance.cu"
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

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z10covarianceiiPA2048_fS0_Pf(i32 noundef %0, i32 noundef %1, ptr nofree noundef captures(none) %2, ptr nofree noundef writeonly captures(none) %3, ptr nofree noundef captures(none) %4) local_unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph65, label %.preheader61.thread

.lr.ph65:                                         ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %wide.trip.count85 = zext nneg i32 %0 to i64
  br i1 %7, label %.lr.ph.us.preheader, label %.lr.ph65.split.preheader

.lr.ph65.split.preheader:                         ; preds = %.lr.ph65
  %8 = shl nuw nsw i64 %wide.trip.count85, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %4, i8 0, i64 %8, i1 false)
  br label %.preheader61.thread

.lr.ph.us.preheader:                              ; preds = %.lr.ph65
  %wide.trip.count = zext nneg i32 %1 to i64
  %xtraiter = and i64 %wide.trip.count, 3
  %9 = icmp ult i32 %1, 4
  %unroll_iter = and i64 %wide.trip.count, 2147483644
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod139 = icmp ne i64 %xtraiter, 0
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge.us
  %indvars.iv82 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next83, %._crit_edge.us ]
  %10 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv82
  store float 0.000000e+00, ptr %10, align 4
  %invariant.gep.us = getelementptr [4 x i8], ptr %2, i64 %indvars.iv82
  br i1 %9, label %.epil.preheader, label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ 0, %.lr.ph.us ]
  %11 = phi float [ %22, %.lr.ph.us.new ], [ 0.000000e+00, %.lr.ph.us ]
  %niter = phi i64 [ %niter.next.3, %.lr.ph.us.new ], [ 0, %.lr.ph.us ]
  %gep.us = getelementptr [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv
  %12 = load float, ptr %gep.us, align 4
  %13 = fadd float %12, %11
  store float %13, ptr %10, align 4
  %14 = getelementptr [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv
  %gep.us.1 = getelementptr i8, ptr %14, i64 8192
  %15 = load float, ptr %gep.us.1, align 4
  %16 = fadd float %15, %13
  store float %16, ptr %10, align 4
  %17 = getelementptr [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv
  %gep.us.2 = getelementptr i8, ptr %17, i64 16384
  %18 = load float, ptr %gep.us.2, align 4
  %19 = fadd float %18, %16
  store float %19, ptr %10, align 4
  %20 = getelementptr [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv
  %gep.us.3 = getelementptr i8, ptr %20, i64 24576
  %21 = load float, ptr %gep.us.3, align 4
  %22 = fadd float %21, %19
  store float %22, ptr %10, align 4
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.next.3 = add i64 %niter, 4
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %._crit_edge.us.unr-lcssa, label %.lr.ph.us.new

._crit_edge.us.unr-lcssa:                         ; preds = %.lr.ph.us.new
  br i1 %lcmp.mod.not, label %._crit_edge.us, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.us.unr-lcssa, %.lr.ph.us
  %indvars.iv.epil.init = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.3, %._crit_edge.us.unr-lcssa ]
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.us ], [ %22, %._crit_edge.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod139)
  br label %23

23:                                               ; preds = %23, %.epil.preheader
  %indvars.iv.epil = phi i64 [ %indvars.iv.epil.init, %.epil.preheader ], [ %indvars.iv.next.epil, %23 ]
  %24 = phi float [ %.epil.init, %.epil.preheader ], [ %26, %23 ]
  %epil.iter = phi i64 [ 0, %.epil.preheader ], [ %epil.iter.next, %23 ]
  %gep.us.epil = getelementptr [8192 x i8], ptr %invariant.gep.us, i64 %indvars.iv.epil
  %25 = load float, ptr %gep.us.epil, align 4
  %26 = fadd float %25, %24
  store float %26, ptr %10, align 4
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge.us, label %23, !llvm.loop !5

._crit_edge.us:                                   ; preds = %23, %._crit_edge.us.unr-lcssa
  %.lcssa137 = phi float [ %22, %._crit_edge.us.unr-lcssa ], [ %26, %23 ]
  %27 = fpext float %.lcssa137 to double
  %28 = fdiv double %27, f0x414885C20147AE14
  %29 = fptrunc double %28 to float
  store float %29, ptr %10, align 4
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond86.not = icmp eq i64 %indvars.iv.next83, %wide.trip.count85
  br i1 %exitcond86.not, label %.preheader60.preheader, label %.lr.ph.us

.preheader61.thread:                              ; preds = %.lr.ph65.split.preheader, %5
  %30 = icmp sgt i32 %1, 0
  br label %.preheader59

.preheader60.preheader:                           ; preds = %._crit_edge.us
  %wide.trip.count95 = zext nneg i32 %1 to i64
  %wide.trip.count90 = zext nneg i32 %0 to i64
  %31 = shl nuw nsw i64 %wide.trip.count, 13
  %32 = shl nuw nsw i64 %wide.trip.count85, 2
  %33 = getelementptr i8, ptr %2, i64 %31
  %34 = getelementptr i8, ptr %33, i64 %32
  %scevgep131 = getelementptr i8, ptr %34, i64 -8192
  %scevgep132 = getelementptr i8, ptr %4, i64 %32
  %min.iters.check = icmp ult i32 %0, 8
  %bound0 = icmp ult ptr %2, %scevgep132
  %bound1 = icmp ult ptr %4, %scevgep131
  %found.conflict = and i1 %bound0, %bound1
  %n.vec = and i64 %wide.trip.count85, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count85
  %xtraiter140 = and i64 %wide.trip.count85, 3
  %lcmp.mod141.not = icmp eq i64 %xtraiter140, 0
  br label %.preheader60

.preheader60:                                     ; preds = %.preheader60.preheader, %._crit_edge
  %indvars.iv92 = phi i64 [ 0, %.preheader60.preheader ], [ %indvars.iv.next93, %._crit_edge ]
  %35 = getelementptr [8192 x i8], ptr %2, i64 %indvars.iv92
  %brmerge = select i1 %min.iters.check, i1 true, i1 %found.conflict
  br i1 %brmerge, label %scalar.ph.preheader, label %vector.body

vector.body:                                      ; preds = %.preheader60, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader60 ]
  %36 = getelementptr [4 x i8], ptr %4, i64 %index
  %37 = getelementptr i8, ptr %36, i64 16
  %wide.load = load <4 x float>, ptr %36, align 4, !alias.scope !7
  %wide.load133 = load <4 x float>, ptr %37, align 4, !alias.scope !7
  %38 = getelementptr [4 x i8], ptr %35, i64 %index
  %39 = getelementptr i8, ptr %38, i64 16
  %wide.load134 = load <4 x float>, ptr %38, align 4, !alias.scope !10, !noalias !7
  %wide.load135 = load <4 x float>, ptr %39, align 4, !alias.scope !10, !noalias !7
  %40 = fsub <4 x float> %wide.load134, %wide.load
  %41 = fsub <4 x float> %wide.load135, %wide.load133
  store <4 x float> %40, ptr %38, align 4, !alias.scope !10, !noalias !7
  store <4 x float> %41, ptr %39, align 4, !alias.scope !10, !noalias !7
  %index.next = add nuw i64 %index, 8
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader60, %middle.block
  %indvars.iv87.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %.preheader60 ]
  br i1 %lcmp.mod141.not, label %scalar.ph.prol.loopexit, label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.preheader, %scalar.ph.prol
  %indvars.iv87.prol = phi i64 [ %indvars.iv.next88.prol, %scalar.ph.prol ], [ %indvars.iv87.ph, %scalar.ph.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %scalar.ph.prol ], [ 0, %scalar.ph.preheader ]
  %43 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv87.prol
  %44 = load float, ptr %43, align 4
  %45 = getelementptr [4 x i8], ptr %35, i64 %indvars.iv87.prol
  %46 = load float, ptr %45, align 4
  %47 = fsub float %46, %44
  store float %47, ptr %45, align 4
  %indvars.iv.next88.prol = add nuw nsw i64 %indvars.iv87.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter140
  br i1 %prol.iter.cmp.not, label %scalar.ph.prol.loopexit, label %scalar.ph.prol, !llvm.loop !13

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol, %scalar.ph.preheader
  %indvars.iv87.unr = phi i64 [ %indvars.iv87.ph, %scalar.ph.preheader ], [ %indvars.iv.next88.prol, %scalar.ph.prol ]
  %48 = sub nsw i64 %indvars.iv87.ph, %wide.trip.count85
  %49 = icmp ugt i64 %48, -4
  br i1 %49, label %._crit_edge, label %scalar.ph

.preheader59:                                     ; preds = %._crit_edge, %.preheader61.thread
  %50 = phi i1 [ %30, %.preheader61.thread ], [ true, %._crit_edge ]
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge76

.preheader.lr.ph:                                 ; preds = %.preheader59
  %wide.trip.count121 = zext nneg i32 %0 to i64
  br i1 %50, label %.preheader.us.preheader, label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count108 = zext nneg i32 %1 to i64
  %xtraiter146 = and i64 %wide.trip.count108, 1
  %51 = icmp eq i32 %1, 1
  %unroll_iter153 = and i64 %wide.trip.count108, 2147483646
  %lcmp.mod150.not = icmp eq i64 %xtraiter146, 0
  %lcmp.mod152 = trunc i32 %1 to i1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.split.us.us
  %indvars.iv113 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next114, %.split.us.us ]
  %52 = getelementptr [8192 x i8], ptr %3, i64 %indvars.iv113
  %invariant.gep.us77 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv113
  br label %.lr.ph.us73.us

.lr.ph.us73.us:                                   ; preds = %._crit_edge70.us.us, %.preheader.us
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %._crit_edge70.us.us ], [ %indvars.iv113, %.preheader.us ]
  %53 = getelementptr [4 x i8], ptr %52, i64 %indvars.iv115
  store float 0.000000e+00, ptr %53, align 4
  br i1 %51, label %.epil.preheader145, label %.lr.ph.us73.us.new

.lr.ph.us73.us.new:                               ; preds = %.lr.ph.us73.us, %.lr.ph.us73.us.new
  %indvars.iv105 = phi i64 [ %indvars.iv.next106.1, %.lr.ph.us73.us.new ], [ 0, %.lr.ph.us73.us ]
  %54 = phi float [ %69, %.lr.ph.us73.us.new ], [ 0.000000e+00, %.lr.ph.us73.us ]
  %niter154 = phi i64 [ %niter154.next.1, %.lr.ph.us73.us.new ], [ 0, %.lr.ph.us73.us ]
  %55 = getelementptr [8192 x i8], ptr %2, i64 %indvars.iv105
  %56 = getelementptr [4 x i8], ptr %55, i64 %indvars.iv113
  %57 = load float, ptr %56, align 4
  %58 = getelementptr [4 x i8], ptr %55, i64 %indvars.iv115
  %59 = load float, ptr %58, align 4
  %60 = fmul float %57, %59
  %61 = fadd float %54, %60
  store float %61, ptr %53, align 4
  %62 = getelementptr [8192 x i8], ptr %2, i64 %indvars.iv105
  %63 = getelementptr i8, ptr %62, i64 8192
  %64 = getelementptr [4 x i8], ptr %63, i64 %indvars.iv113
  %65 = load float, ptr %64, align 4
  %66 = getelementptr [4 x i8], ptr %63, i64 %indvars.iv115
  %67 = load float, ptr %66, align 4
  %68 = fmul float %65, %67
  %69 = fadd float %61, %68
  store float %69, ptr %53, align 4
  %indvars.iv.next106.1 = add nuw nsw i64 %indvars.iv105, 2
  %niter154.next.1 = add i64 %niter154, 2
  %niter154.ncmp.1 = icmp eq i64 %niter154.next.1, %unroll_iter153
  br i1 %niter154.ncmp.1, label %._crit_edge70.us.us.unr-lcssa, label %.lr.ph.us73.us.new

._crit_edge70.us.us.unr-lcssa:                    ; preds = %.lr.ph.us73.us.new
  br i1 %lcmp.mod150.not, label %._crit_edge70.us.us, label %.epil.preheader145

.epil.preheader145:                               ; preds = %._crit_edge70.us.us.unr-lcssa, %.lr.ph.us73.us
  %indvars.iv105.epil.init = phi i64 [ 0, %.lr.ph.us73.us ], [ %indvars.iv.next106.1, %._crit_edge70.us.us.unr-lcssa ]
  %.epil.init149 = phi float [ 0.000000e+00, %.lr.ph.us73.us ], [ %69, %._crit_edge70.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod152)
  %70 = getelementptr [8192 x i8], ptr %2, i64 %indvars.iv105.epil.init
  %71 = getelementptr [4 x i8], ptr %70, i64 %indvars.iv113
  %72 = load float, ptr %71, align 4
  %73 = getelementptr [4 x i8], ptr %70, i64 %indvars.iv115
  %74 = load float, ptr %73, align 4
  %75 = fmul float %72, %74
  %76 = fadd float %.epil.init149, %75
  store float %76, ptr %53, align 4
  br label %._crit_edge70.us.us

._crit_edge70.us.us:                              ; preds = %._crit_edge70.us.us.unr-lcssa, %.epil.preheader145
  %.lcssa = phi float [ %69, %._crit_edge70.us.us.unr-lcssa ], [ %76, %.epil.preheader145 ]
  %gep.us72.us = getelementptr [8192 x i8], ptr %invariant.gep.us77, i64 %indvars.iv115
  store float %.lcssa, ptr %gep.us72.us, align 4
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond119.not = icmp eq i64 %indvars.iv.next116, %wide.trip.count121
  br i1 %exitcond119.not, label %.split.us.us, label %.lr.ph.us73.us

.split.us.us:                                     ; preds = %._crit_edge70.us.us
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond122.not = icmp eq i64 %indvars.iv.next114, %wide.trip.count121
  br i1 %exitcond122.not, label %._crit_edge76, label %.preheader.us

scalar.ph:                                        ; preds = %scalar.ph.prol.loopexit, %scalar.ph
  %indvars.iv87 = phi i64 [ %indvars.iv.next88.3, %scalar.ph ], [ %indvars.iv87.unr, %scalar.ph.prol.loopexit ]
  %77 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv87
  %78 = load float, ptr %77, align 4
  %79 = getelementptr [4 x i8], ptr %35, i64 %indvars.iv87
  %80 = load float, ptr %79, align 4
  %81 = fsub float %80, %78
  store float %81, ptr %79, align 4
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %82 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv.next88
  %83 = load float, ptr %82, align 4
  %84 = getelementptr [4 x i8], ptr %35, i64 %indvars.iv.next88
  %85 = load float, ptr %84, align 4
  %86 = fsub float %85, %83
  store float %86, ptr %84, align 4
  %indvars.iv.next88.1 = add nuw nsw i64 %indvars.iv87, 2
  %87 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv.next88.1
  %88 = load float, ptr %87, align 4
  %89 = getelementptr [4 x i8], ptr %35, i64 %indvars.iv.next88.1
  %90 = load float, ptr %89, align 4
  %91 = fsub float %90, %88
  store float %91, ptr %89, align 4
  %indvars.iv.next88.2 = add nuw nsw i64 %indvars.iv87, 3
  %92 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv.next88.2
  %93 = load float, ptr %92, align 4
  %94 = getelementptr [4 x i8], ptr %35, i64 %indvars.iv.next88.2
  %95 = load float, ptr %94, align 4
  %96 = fsub float %95, %93
  store float %96, ptr %94, align 4
  %indvars.iv.next88.3 = add nuw nsw i64 %indvars.iv87, 4
  %exitcond91.not.3 = icmp eq i64 %indvars.iv.next88.3, %wide.trip.count90
  br i1 %exitcond91.not.3, label %._crit_edge, label %scalar.ph, !llvm.loop !14

._crit_edge:                                      ; preds = %scalar.ph.prol.loopexit, %scalar.ph, %middle.block
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond96.not = icmp eq i64 %indvars.iv.next93, %wide.trip.count95
  br i1 %exitcond96.not, label %.preheader59, label %.preheader60

.preheader:                                       ; preds = %.preheader.lr.ph, %.split
  %indvar = phi i64 [ %indvar.next, %.split ], [ 0, %.preheader.lr.ph ]
  %97 = sub nsw i64 %wide.trip.count121, %indvar
  %98 = mul nuw nsw i64 %indvar, 8196
  %scevgep = getelementptr i8, ptr %3, i64 %98
  %99 = trunc i64 %indvar to i32
  %100 = xor i32 %99, -1
  %101 = add i32 %0, %100
  %102 = zext i32 %101 to i64
  %103 = shl nuw nsw i64 %102, 2
  %104 = add nuw nsw i64 %103, 4
  %invariant.gep = getelementptr [4 x i8], ptr %3, i64 %indvar
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1) %scevgep, i8 0, i64 %104, i1 false)
  %xtraiter142 = and i64 %97, 3
  %lcmp.mod143.not = icmp eq i64 %xtraiter142, 0
  br i1 %lcmp.mod143.not, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader, %.prol.preheader
  %indvars.iv97.prol = phi i64 [ %indvars.iv.next98.prol, %.prol.preheader ], [ %indvar, %.preheader ]
  %prol.iter144 = phi i64 [ %prol.iter144.next, %.prol.preheader ], [ 0, %.preheader ]
  %gep.prol = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv97.prol
  store float 0.000000e+00, ptr %gep.prol, align 4
  %indvars.iv.next98.prol = add nuw nsw i64 %indvars.iv97.prol, 1
  %prol.iter144.next = add i64 %prol.iter144, 1
  %prol.iter144.cmp.not = icmp eq i64 %prol.iter144.next, %xtraiter142
  br i1 %prol.iter144.cmp.not, label %.prol.loopexit, label %.prol.preheader, !llvm.loop !15

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader
  %indvars.iv97.unr = phi i64 [ %indvar, %.preheader ], [ %indvars.iv.next98.prol, %.prol.preheader ]
  %105 = sub nsw i64 %indvar, %wide.trip.count121
  %106 = icmp ugt i64 %105, -4
  br i1 %106, label %.split, label %.preheader.new

.preheader.new:                                   ; preds = %.prol.loopexit, %.preheader.new
  %indvars.iv97 = phi i64 [ %indvars.iv.next98.3, %.preheader.new ], [ %indvars.iv97.unr, %.prol.loopexit ]
  %gep = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv97
  store float 0.000000e+00, ptr %gep, align 4
  %107 = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv97
  %gep.1 = getelementptr i8, ptr %107, i64 8192
  store float 0.000000e+00, ptr %gep.1, align 4
  %108 = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv97
  %gep.2 = getelementptr i8, ptr %108, i64 16384
  store float 0.000000e+00, ptr %gep.2, align 4
  %109 = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv97
  %gep.3 = getelementptr i8, ptr %109, i64 24576
  store float 0.000000e+00, ptr %gep.3, align 4
  %indvars.iv.next98.3 = add nuw nsw i64 %indvars.iv97, 4
  %exitcond101.not.3 = icmp eq i64 %indvars.iv.next98.3, %wide.trip.count121
  br i1 %exitcond101.not.3, label %.split, label %.preheader.new

.split:                                           ; preds = %.preheader.new, %.prol.loopexit
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond104.not = icmp eq i64 %indvar.next, %wide.trip.count121
  br i1 %exitcond104.not, label %._crit_edge76, label %.preheader

._crit_edge76:                                    ; preds = %.split, %.split.us.us, %.preheader59
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiiPA2048_fS0_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #4 {
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
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !16

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
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !17

._crit_edge.us:                                   ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %.2.us.lcssa = phi i32 [ %43, %middle.block ], [ %.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27.not = icmp eq i64 %indvars.iv.next24, %wide.trip.count26
  br i1 %exitcond27.not, label %._crit_edge19, label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge.us, %4
  %.0.lcssa = phi i32 [ 0, %4 ], [ %.2.us.lcssa, %._crit_edge.us ]
  %76 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 1.050000e+00, i32 noundef %.0.lcssa) #5
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

define dso_local void @_Z26__device_stub__mean_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #6 {
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

define dso_local void @_Z28__device_stub__reduce_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #6 {
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
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z28__device_stub__reduce_kerneliiPfS_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
  ret void
}

define dso_local void @_Z27__device_stub__covar_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #6 {
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
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__covar_kerneliiPfS_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
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
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #15
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
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #15
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

define dso_local void @_Z14covarianceCudaiiPA2048_fS0_PfS0_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) local_unnamed_addr #6 {
  %7 = alloca %struct.timeval, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca [4 x ptr], align 16
  %13 = alloca %struct.dim3, align 8
  %14 = alloca %struct.dim3, align 8
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca [4 x ptr], align 16
  %22 = alloca %struct.dim3, align 8
  %23 = alloca %struct.dim3, align 8
  %24 = alloca i64, align 8
  %25 = alloca ptr, align 8
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca [4 x ptr], align 16
  %31 = alloca %struct.dim3, align 8
  %32 = alloca %struct.dim3, align 8
  %33 = alloca i64, align 8
  %34 = alloca ptr, align 8
  %35 = alloca %struct.timeval, align 8
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca ptr, align 8
  %39 = call i32 @cudaMalloc(ptr noundef nonnull %36, i64 noundef 16777216) #5
  %40 = call i32 @cudaMalloc(ptr noundef nonnull %38, i64 noundef 16777216) #5
  %41 = call i32 @cudaMalloc(ptr noundef nonnull %37, i64 noundef 8192) #5
  %42 = load ptr, ptr %36, align 8
  %43 = call i32 @cudaMemcpy(ptr noundef %42, ptr noundef %2, i64 noundef 16777216, i32 noundef 1) #5
  %44 = load ptr, ptr %38, align 8
  %45 = call i32 @cudaMemcpy(ptr noundef %44, ptr noundef %3, i64 noundef 16777216, i32 noundef 1) #5
  %46 = load ptr, ptr %37, align 8
  %47 = call i32 @cudaMemcpy(ptr noundef %46, ptr noundef %4, i64 noundef 8192, i32 noundef 1) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %35)
  %48 = call i32 @gettimeofday(ptr noundef nonnull %35, ptr noundef null) #15
  %.not.i.i = icmp eq i32 %48, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %49

49:                                               ; preds = %6
  %50 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %48) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %6, %49
  %51 = load i64, ptr %35, align 8
  %52 = sitofp i64 %51 to double
  %53 = getelementptr inbounds nuw i8, ptr %35, i64 8
  %54 = load i64, ptr %53, align 8
  %55 = sitofp i64 %54 to double
  %56 = fmul nnan double %55, f0x3EB0C6F7A0B5ED8D
  %57 = fadd double %56, %52
  call void @llvm.lifetime.end.p0(ptr nonnull %35)
  store double %57, ptr @polybench_t_start, align 8
  %58 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 8, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %58, 0
  br i1 %.not, label %59, label %69

59:                                               ; preds = %_Z21polybench_timer_startv.exit
  %60 = load ptr, ptr %37, align 8
  %61 = load ptr, ptr %36, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %26)
  call void @llvm.lifetime.start.p0(ptr nonnull %27)
  call void @llvm.lifetime.start.p0(ptr nonnull %28)
  call void @llvm.lifetime.start.p0(ptr nonnull %29)
  call void @llvm.lifetime.start.p0(ptr nonnull %30)
  call void @llvm.lifetime.start.p0(ptr nonnull %31)
  call void @llvm.lifetime.start.p0(ptr nonnull %32)
  call void @llvm.lifetime.start.p0(ptr nonnull %33)
  call void @llvm.lifetime.start.p0(ptr nonnull %34)
  store i32 %0, ptr %26, align 4
  store i32 %1, ptr %27, align 4
  store ptr %60, ptr %28, align 8
  store ptr %61, ptr %29, align 8
  store ptr %26, ptr %30, align 16
  %62 = getelementptr inbounds nuw i8, ptr %30, i64 8
  store ptr %27, ptr %62, align 8
  %63 = getelementptr inbounds nuw i8, ptr %30, i64 16
  store ptr %28, ptr %63, align 16
  %64 = getelementptr inbounds nuw i8, ptr %30, i64 24
  store ptr %29, ptr %64, align 8
  %65 = call i32 @__cudaPopCallConfiguration(ptr nonnull %31, ptr nonnull %32, ptr nonnull %33, ptr nonnull %34), !inline_history !18
  %66 = load i64, ptr %33, align 8
  %67 = load ptr, ptr %34, align 8
  %.fca.0.load2.i = load i32, ptr %31, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %31, i64 4
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %31, i64 8
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %32, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %32, i64 4
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %32, i64 8
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %68 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mean_kerneliiPfS_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %30, i64 noundef %66, ptr noundef %67), !inline_history !18
  call void @llvm.lifetime.end.p0(ptr nonnull %26)
  call void @llvm.lifetime.end.p0(ptr nonnull %27)
  call void @llvm.lifetime.end.p0(ptr nonnull %28)
  call void @llvm.lifetime.end.p0(ptr nonnull %29)
  call void @llvm.lifetime.end.p0(ptr nonnull %30)
  call void @llvm.lifetime.end.p0(ptr nonnull %31)
  call void @llvm.lifetime.end.p0(ptr nonnull %32)
  call void @llvm.lifetime.end.p0(ptr nonnull %33)
  call void @llvm.lifetime.end.p0(ptr nonnull %34)
  br label %69

69:                                               ; preds = %_Z21polybench_timer_startv.exit, %59
  %70 = call i32 @cudaThreadSynchronize() #5
  %71 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 64, i32 64, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not39 = icmp eq i32 %71, 0
  br i1 %.not39, label %72, label %82

72:                                               ; preds = %69
  %73 = load ptr, ptr %37, align 8
  %74 = load ptr, ptr %36, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %17)
  call void @llvm.lifetime.start.p0(ptr nonnull %18)
  call void @llvm.lifetime.start.p0(ptr nonnull %19)
  call void @llvm.lifetime.start.p0(ptr nonnull %20)
  call void @llvm.lifetime.start.p0(ptr nonnull %21)
  call void @llvm.lifetime.start.p0(ptr nonnull %22)
  call void @llvm.lifetime.start.p0(ptr nonnull %23)
  call void @llvm.lifetime.start.p0(ptr nonnull %24)
  call void @llvm.lifetime.start.p0(ptr nonnull %25)
  store i32 %0, ptr %17, align 4
  store i32 %1, ptr %18, align 4
  store ptr %73, ptr %19, align 8
  store ptr %74, ptr %20, align 8
  store ptr %17, ptr %21, align 16
  %75 = getelementptr inbounds nuw i8, ptr %21, i64 8
  store ptr %18, ptr %75, align 8
  %76 = getelementptr inbounds nuw i8, ptr %21, i64 16
  store ptr %19, ptr %76, align 16
  %77 = getelementptr inbounds nuw i8, ptr %21, i64 24
  store ptr %20, ptr %77, align 8
  %78 = call i32 @__cudaPopCallConfiguration(ptr nonnull %22, ptr nonnull %23, ptr nonnull %24, ptr nonnull %25), !inline_history !19
  %79 = load i64, ptr %24, align 8
  %80 = load ptr, ptr %25, align 8
  %.fca.0.load2.i41 = load i32, ptr %22, align 8
  %.fca.0.insert3.i42 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i41, 0
  %.fca.1.gep4.i43 = getelementptr inbounds nuw i8, ptr %22, i64 4
  %.fca.1.load5.i44 = load i32, ptr %.fca.1.gep4.i43, align 4
  %.fca.1.insert6.i45 = insertvalue %struct.dim3 %.fca.0.insert3.i42, i32 %.fca.1.load5.i44, 1
  %.fca.2.gep7.i46 = getelementptr inbounds nuw i8, ptr %22, i64 8
  %.fca.2.load8.i47 = load i32, ptr %.fca.2.gep7.i46, align 8
  %.fca.2.insert9.i48 = insertvalue %struct.dim3 %.fca.1.insert6.i45, i32 %.fca.2.load8.i47, 2
  %.fca.0.load.i49 = load i32, ptr %23, align 8
  %.fca.0.insert.i50 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i49, 0
  %.fca.1.gep.i51 = getelementptr inbounds nuw i8, ptr %23, i64 4
  %.fca.1.load.i52 = load i32, ptr %.fca.1.gep.i51, align 4
  %.fca.1.insert.i53 = insertvalue %struct.dim3 %.fca.0.insert.i50, i32 %.fca.1.load.i52, 1
  %.fca.2.gep.i54 = getelementptr inbounds nuw i8, ptr %23, i64 8
  %.fca.2.load.i55 = load i32, ptr %.fca.2.gep.i54, align 8
  %.fca.2.insert.i56 = insertvalue %struct.dim3 %.fca.1.insert.i53, i32 %.fca.2.load.i55, 2
  %81 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z28__device_stub__reduce_kerneliiPfS_, %struct.dim3 %.fca.2.insert9.i48, %struct.dim3 %.fca.2.insert.i56, ptr noundef nonnull %21, i64 noundef %79, ptr noundef %80), !inline_history !19
  call void @llvm.lifetime.end.p0(ptr nonnull %17)
  call void @llvm.lifetime.end.p0(ptr nonnull %18)
  call void @llvm.lifetime.end.p0(ptr nonnull %19)
  call void @llvm.lifetime.end.p0(ptr nonnull %20)
  call void @llvm.lifetime.end.p0(ptr nonnull %21)
  call void @llvm.lifetime.end.p0(ptr nonnull %22)
  call void @llvm.lifetime.end.p0(ptr nonnull %23)
  call void @llvm.lifetime.end.p0(ptr nonnull %24)
  call void @llvm.lifetime.end.p0(ptr nonnull %25)
  br label %82

82:                                               ; preds = %69, %72
  %83 = call i32 @cudaThreadSynchronize() #5
  %84 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 8, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not40 = icmp eq i32 %84, 0
  br i1 %.not40, label %85, label %95

85:                                               ; preds = %82
  %86 = load ptr, ptr %38, align 8
  %87 = load ptr, ptr %36, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  call void @llvm.lifetime.start.p0(ptr nonnull %15)
  call void @llvm.lifetime.start.p0(ptr nonnull %16)
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store ptr %86, ptr %10, align 8
  store ptr %87, ptr %11, align 8
  store ptr %8, ptr %12, align 16
  %88 = getelementptr inbounds nuw i8, ptr %12, i64 8
  store ptr %9, ptr %88, align 8
  %89 = getelementptr inbounds nuw i8, ptr %12, i64 16
  store ptr %10, ptr %89, align 16
  %90 = getelementptr inbounds nuw i8, ptr %12, i64 24
  store ptr %11, ptr %90, align 8
  %91 = call i32 @__cudaPopCallConfiguration(ptr nonnull %13, ptr nonnull %14, ptr nonnull %15, ptr nonnull %16), !inline_history !20
  %92 = load i64, ptr %15, align 8
  %93 = load ptr, ptr %16, align 8
  %.fca.0.load2.i57 = load i32, ptr %13, align 8
  %.fca.0.insert3.i58 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i57, 0
  %.fca.1.gep4.i59 = getelementptr inbounds nuw i8, ptr %13, i64 4
  %.fca.1.load5.i60 = load i32, ptr %.fca.1.gep4.i59, align 4
  %.fca.1.insert6.i61 = insertvalue %struct.dim3 %.fca.0.insert3.i58, i32 %.fca.1.load5.i60, 1
  %.fca.2.gep7.i62 = getelementptr inbounds nuw i8, ptr %13, i64 8
  %.fca.2.load8.i63 = load i32, ptr %.fca.2.gep7.i62, align 8
  %.fca.2.insert9.i64 = insertvalue %struct.dim3 %.fca.1.insert6.i61, i32 %.fca.2.load8.i63, 2
  %.fca.0.load.i65 = load i32, ptr %14, align 8
  %.fca.0.insert.i66 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i65, 0
  %.fca.1.gep.i67 = getelementptr inbounds nuw i8, ptr %14, i64 4
  %.fca.1.load.i68 = load i32, ptr %.fca.1.gep.i67, align 4
  %.fca.1.insert.i69 = insertvalue %struct.dim3 %.fca.0.insert.i66, i32 %.fca.1.load.i68, 1
  %.fca.2.gep.i70 = getelementptr inbounds nuw i8, ptr %14, i64 8
  %.fca.2.load.i71 = load i32, ptr %.fca.2.gep.i70, align 8
  %.fca.2.insert.i72 = insertvalue %struct.dim3 %.fca.1.insert.i69, i32 %.fca.2.load.i71, 2
  %94 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__covar_kerneliiPfS_, %struct.dim3 %.fca.2.insert9.i64, %struct.dim3 %.fca.2.insert.i72, ptr noundef nonnull %12, i64 noundef %92, ptr noundef %93), !inline_history !20
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  call void @llvm.lifetime.end.p0(ptr nonnull %13)
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  call void @llvm.lifetime.end.p0(ptr nonnull %15)
  call void @llvm.lifetime.end.p0(ptr nonnull %16)
  br label %95

95:                                               ; preds = %82, %85
  %96 = call i32 @cudaThreadSynchronize() #5
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  %97 = call i32 @gettimeofday(ptr noundef nonnull %7, ptr noundef null) #15
  %.not.i.i73 = icmp eq i32 %97, 0
  br i1 %.not.i.i73, label %_Z20polybench_timer_stopv.exit, label %98

98:                                               ; preds = %95
  %99 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %97) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %95, %98
  %100 = load i64, ptr %7, align 8
  %101 = sitofp i64 %100 to double
  %102 = getelementptr inbounds nuw i8, ptr %7, i64 8
  %103 = load i64, ptr %102, align 8
  %104 = sitofp i64 %103 to double
  %105 = fmul nnan double %104, f0x3EB0C6F7A0B5ED8D
  %106 = fadd double %105, %101
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  store double %106, ptr @polybench_t_end, align 8
  %107 = load double, ptr @polybench_t_start, align 8
  %108 = fsub double %106, %107
  %109 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %108) #5
  %110 = load ptr, ptr %38, align 8
  %111 = call i32 @cudaMemcpy(ptr noundef %5, ptr noundef %110, i64 noundef 16777216, i32 noundef 2) #5
  %112 = load ptr, ptr %36, align 8
  %113 = call i32 @cudaFree(ptr noundef %112) #5
  %114 = load ptr, ptr %38, align 8
  %115 = call i32 @cudaFree(ptr noundef %114) #5
  %116 = load ptr, ptr %37, align 8
  %117 = call i32 @cudaFree(ptr noundef %116) #5
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
  %6 = call i32 @posix_memalign(ptr noundef nonnull %3, i64 noundef 32, i64 noundef %5) #15
  %7 = load ptr, ptr %3, align 8
  %.not.i = icmp eq ptr %7, null
  %8 = icmp ne i32 %6, 0
  %or.cond.i = select i1 %.not.i, i1 true, i1 %8
  br i1 %or.cond.i, label %.critedge.i, label %_ZL7xmallocm.exit

.critedge.i:                                      ; preds = %2
  %9 = load ptr, ptr @stderr, align 8
  %10 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %9) #16
  call void @exit(i32 noundef 1) #17
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
  %7 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %8 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 16777216) #15
  %9 = load ptr, ptr %7, align 8
  %.not.i.i = icmp eq ptr %9, null
  %10 = icmp ne i32 %8, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %10
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %0
  %11 = load ptr, ptr @stderr, align 8
  %12 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %11) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %0
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %13 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 16777216) #15
  %14 = load ptr, ptr %6, align 8
  %.not.i.i22 = icmp eq ptr %14, null
  %15 = icmp ne i32 %13, 0
  %or.cond.i.i23 = select i1 %.not.i.i22, i1 true, i1 %15
  br i1 %or.cond.i.i23, label %.critedge.i.i24, label %_Z20polybench_alloc_datayi.exit25

.critedge.i.i24:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %16 = load ptr, ptr @stderr, align 8
  %17 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %16) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit25:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  store ptr null, ptr %5, align 8
  %18 = call i32 @posix_memalign(ptr noundef nonnull %5, i64 noundef 32, i64 noundef 8192) #15
  %19 = load ptr, ptr %5, align 8
  %.not.i.i26 = icmp eq ptr %19, null
  %20 = icmp ne i32 %18, 0
  %or.cond.i.i27 = select i1 %.not.i.i26, i1 true, i1 %20
  br i1 %or.cond.i.i27, label %.critedge.i.i28, label %_Z20polybench_alloc_datayi.exit29

.critedge.i.i28:                                  ; preds = %_Z20polybench_alloc_datayi.exit25
  %21 = load ptr, ptr @stderr, align 8
  %22 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %21) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit29:                ; preds = %_Z20polybench_alloc_datayi.exit25
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store ptr null, ptr %4, align 8
  %23 = call i32 @posix_memalign(ptr noundef nonnull %4, i64 noundef 32, i64 noundef 16777216) #15
  %24 = load ptr, ptr %4, align 8
  %.not.i.i30 = icmp eq ptr %24, null
  %25 = icmp ne i32 %23, 0
  %or.cond.i.i31 = select i1 %.not.i.i30, i1 true, i1 %25
  br i1 %or.cond.i.i31, label %.critedge.i.i32, label %_Z20polybench_alloc_datayi.exit33

.critedge.i.i32:                                  ; preds = %_Z20polybench_alloc_datayi.exit29
  %26 = load ptr, ptr @stderr, align 8
  %27 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %26) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit33:                ; preds = %_Z20polybench_alloc_datayi.exit29
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  br label %.preheader.i

.preheader.i:                                     ; preds = %._crit_edge.i, %_Z20polybench_alloc_datayi.exit33
  %indvars.iv15.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit33 ], [ %indvars.iv.next16.i, %._crit_edge.i ]
  %28 = getelementptr [8192 x i8], ptr %9, i64 %indvars.iv15.i
  %29 = trunc nuw nsw i64 %indvars.iv15.i to i32
  %30 = uitofp nneg i32 %29 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %30, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.i
  %index = phi i64 [ 0, %.preheader.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %31 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %32 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %33 = fmul nnan <4 x float> %broadcast.splat, %31
  %34 = fmul nnan <4 x float> %broadcast.splat, %32
  %35 = fmul nnan <4 x float> %33, splat (float f0x3A000000)
  %36 = fmul nnan <4 x float> %34, splat (float f0x3A000000)
  %37 = getelementptr [4 x i8], ptr %28, i64 %index
  %38 = getelementptr i8, ptr %37, i64 16
  store <4 x float> %35, ptr %37, align 4
  store <4 x float> %36, ptr %38, align 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %39 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %40 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %41 = fmul nnan <4 x float> %broadcast.splat, %39
  %42 = fmul nnan <4 x float> %broadcast.splat, %40
  %43 = fmul nnan <4 x float> %41, splat (float f0x3A000000)
  %44 = fmul nnan <4 x float> %42, splat (float f0x3A000000)
  %45 = getelementptr [4 x i8], ptr %28, i64 %index
  %46 = getelementptr i8, ptr %45, i64 32
  %47 = getelementptr i8, ptr %45, i64 48
  store <4 x float> %43, ptr %46, align 4
  store <4 x float> %44, ptr %47, align 4
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %48 = icmp eq i64 %index.next.1, 2048
  br i1 %48, label %._crit_edge.i, label %vector.body, !llvm.loop !21

._crit_edge.i:                                    ; preds = %vector.body
  %indvars.iv.next16.i = add nuw nsw i64 %indvars.iv15.i, 1
  %exitcond19.not.i = icmp eq i64 %indvars.iv.next16.i, 2048
  br i1 %exitcond19.not.i, label %_Z11init_arraysiiPA2048_f.exit, label %.preheader.i

_Z11init_arraysiiPA2048_f.exit:                   ; preds = %._crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %49 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %3, i32 noundef 0) #5
  %50 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %3) #5
  %51 = call i32 @cudaSetDevice(i32 noundef 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  call void @_Z14covarianceCudaiiPA2048_fS0_PfS0_(i32 noundef 2048, i32 noundef 2048, ptr noundef nonnull %9, ptr noundef %14, ptr noundef %19, ptr noundef %24) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %52 = call i32 @gettimeofday(ptr noundef nonnull %2, ptr noundef null) #15
  %.not.i.i34 = icmp eq i32 %52, 0
  br i1 %.not.i.i34, label %_Z21polybench_timer_startv.exit, label %53

53:                                               ; preds = %_Z11init_arraysiiPA2048_f.exit
  %54 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %52) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z11init_arraysiiPA2048_f.exit, %53
  %55 = load i64, ptr %2, align 8
  %56 = sitofp i64 %55 to double
  %57 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %58 = load i64, ptr %57, align 8
  %59 = sitofp i64 %58 to double
  %60 = fmul nnan double %59, f0x3EB0C6F7A0B5ED8D
  %61 = fadd double %60, %56
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  store double %61, ptr @polybench_t_start, align 8
  br label %.lr.ph.us.i

.lr.ph.us.i:                                      ; preds = %._crit_edge.us.i, %_Z21polybench_timer_startv.exit
  %indvars.iv82.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next83.i, %._crit_edge.us.i ]
  %62 = getelementptr [4 x i8], ptr %19, i64 %indvars.iv82.i
  store float 0.000000e+00, ptr %62, align 4
  %invariant.gep.us.i = getelementptr [4 x i8], ptr %9, i64 %indvars.iv82.i
  br label %63

63:                                               ; preds = %63, %.lr.ph.us.i
  %indvars.iv.i35 = phi i64 [ 0, %.lr.ph.us.i ], [ %indvars.iv.next.i36.3, %63 ]
  %64 = phi float [ 0.000000e+00, %.lr.ph.us.i ], [ %75, %63 ]
  %gep.us.i = getelementptr [8192 x i8], ptr %invariant.gep.us.i, i64 %indvars.iv.i35
  %65 = load float, ptr %gep.us.i, align 4
  %66 = fadd float %64, %65
  store float %66, ptr %62, align 4
  %67 = getelementptr [8192 x i8], ptr %invariant.gep.us.i, i64 %indvars.iv.i35
  %gep.us.i.1 = getelementptr i8, ptr %67, i64 8192
  %68 = load float, ptr %gep.us.i.1, align 4
  %69 = fadd float %66, %68
  store float %69, ptr %62, align 4
  %70 = getelementptr [8192 x i8], ptr %invariant.gep.us.i, i64 %indvars.iv.i35
  %gep.us.i.2 = getelementptr i8, ptr %70, i64 16384
  %71 = load float, ptr %gep.us.i.2, align 4
  %72 = fadd float %69, %71
  store float %72, ptr %62, align 4
  %73 = getelementptr [8192 x i8], ptr %invariant.gep.us.i, i64 %indvars.iv.i35
  %gep.us.i.3 = getelementptr i8, ptr %73, i64 24576
  %74 = load float, ptr %gep.us.i.3, align 4
  %75 = fadd float %72, %74
  store float %75, ptr %62, align 4
  %indvars.iv.next.i36.3 = add nuw nsw i64 %indvars.iv.i35, 4
  %exitcond.not.i37.3 = icmp eq i64 %indvars.iv.next.i36.3, 2048
  br i1 %exitcond.not.i37.3, label %._crit_edge.us.i, label %63

._crit_edge.us.i:                                 ; preds = %63
  %76 = fpext float %75 to double
  %77 = fdiv double %76, f0x414885C20147AE14
  %78 = fptrunc double %77 to float
  store float %78, ptr %62, align 4
  %indvars.iv.next83.i = add nuw nsw i64 %indvars.iv82.i, 1
  %exitcond86.not.i = icmp eq i64 %indvars.iv.next83.i, 2048
  br i1 %exitcond86.not.i, label %.preheader60.i.preheader, label %.lr.ph.us.i

.preheader60.i.preheader:                         ; preds = %._crit_edge.us.i
  %scevgep = getelementptr i8, ptr %9, i64 16777216
  %scevgep55 = getelementptr i8, ptr %19, i64 8192
  %bound0 = icmp ult ptr %9, %scevgep55
  %bound1 = icmp ult ptr %19, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  br label %.preheader60.i

.preheader60.i:                                   ; preds = %.preheader60.i.preheader, %._crit_edge.i38
  %indvars.iv92.i = phi i64 [ %indvars.iv.next93.i, %._crit_edge.i38 ], [ 0, %.preheader60.i.preheader ]
  %79 = getelementptr [8192 x i8], ptr %9, i64 %indvars.iv92.i
  br i1 %found.conflict, label %scalar.ph, label %vector.body57

vector.body57:                                    ; preds = %.preheader60.i, %vector.body57
  %index58 = phi i64 [ %index.next62.1, %vector.body57 ], [ 0, %.preheader60.i ]
  %80 = getelementptr [4 x i8], ptr %19, i64 %index58
  %81 = getelementptr i8, ptr %80, i64 16
  %wide.load = load <4 x float>, ptr %80, align 4, !alias.scope !22
  %wide.load59 = load <4 x float>, ptr %81, align 4, !alias.scope !22
  %82 = getelementptr [4 x i8], ptr %79, i64 %index58
  %83 = getelementptr i8, ptr %82, i64 16
  %wide.load60 = load <4 x float>, ptr %82, align 4, !alias.scope !25, !noalias !22
  %wide.load61 = load <4 x float>, ptr %83, align 4, !alias.scope !25, !noalias !22
  %84 = fsub <4 x float> %wide.load60, %wide.load
  %85 = fsub <4 x float> %wide.load61, %wide.load59
  store <4 x float> %84, ptr %82, align 4, !alias.scope !25, !noalias !22
  store <4 x float> %85, ptr %83, align 4, !alias.scope !25, !noalias !22
  %index.next62 = or disjoint i64 %index58, 8
  %86 = getelementptr [4 x i8], ptr %19, i64 %index.next62
  %87 = getelementptr i8, ptr %86, i64 16
  %wide.load.1 = load <4 x float>, ptr %86, align 4, !alias.scope !22
  %wide.load59.1 = load <4 x float>, ptr %87, align 4, !alias.scope !22
  %88 = getelementptr [4 x i8], ptr %79, i64 %index.next62
  %89 = getelementptr i8, ptr %88, i64 16
  %wide.load60.1 = load <4 x float>, ptr %88, align 4, !alias.scope !25, !noalias !22
  %wide.load61.1 = load <4 x float>, ptr %89, align 4, !alias.scope !25, !noalias !22
  %90 = fsub <4 x float> %wide.load60.1, %wide.load.1
  %91 = fsub <4 x float> %wide.load61.1, %wide.load59.1
  store <4 x float> %90, ptr %88, align 4, !alias.scope !25, !noalias !22
  store <4 x float> %91, ptr %89, align 4, !alias.scope !25, !noalias !22
  %index.next62.1 = add nuw nsw i64 %index58, 16
  %92 = icmp eq i64 %index.next62.1, 2048
  br i1 %92, label %._crit_edge.i38, label %vector.body57, !llvm.loop !27

.preheader.us.i:                                  ; preds = %._crit_edge.i38, %.split.us.us.i
  %indvars.iv113.i = phi i64 [ %indvars.iv.next114.i, %.split.us.us.i ], [ 0, %._crit_edge.i38 ]
  %93 = getelementptr [8192 x i8], ptr %14, i64 %indvars.iv113.i
  %invariant.gep.us77.i = getelementptr [4 x i8], ptr %14, i64 %indvars.iv113.i
  br label %.lr.ph.us73.us.i

.lr.ph.us73.us.i:                                 ; preds = %._crit_edge70.us.us.i, %.preheader.us.i
  %indvars.iv115.i = phi i64 [ %indvars.iv.next116.i, %._crit_edge70.us.us.i ], [ %indvars.iv113.i, %.preheader.us.i ]
  %94 = getelementptr [4 x i8], ptr %93, i64 %indvars.iv115.i
  store float 0.000000e+00, ptr %94, align 4
  br label %95

95:                                               ; preds = %95, %.lr.ph.us73.us.i
  %indvars.iv105.i = phi i64 [ 0, %.lr.ph.us73.us.i ], [ %indvars.iv.next106.i.1, %95 ]
  %96 = phi float [ 0.000000e+00, %.lr.ph.us73.us.i ], [ %111, %95 ]
  %97 = getelementptr [8192 x i8], ptr %9, i64 %indvars.iv105.i
  %98 = getelementptr [4 x i8], ptr %97, i64 %indvars.iv113.i
  %99 = load float, ptr %98, align 4
  %100 = getelementptr [4 x i8], ptr %97, i64 %indvars.iv115.i
  %101 = load float, ptr %100, align 4
  %102 = fmul float %99, %101
  %103 = fadd float %96, %102
  store float %103, ptr %94, align 4
  %104 = getelementptr [8192 x i8], ptr %9, i64 %indvars.iv105.i
  %105 = getelementptr i8, ptr %104, i64 8192
  %106 = getelementptr [4 x i8], ptr %105, i64 %indvars.iv113.i
  %107 = load float, ptr %106, align 4
  %108 = getelementptr [4 x i8], ptr %105, i64 %indvars.iv115.i
  %109 = load float, ptr %108, align 4
  %110 = fmul float %107, %109
  %111 = fadd float %103, %110
  store float %111, ptr %94, align 4
  %indvars.iv.next106.i.1 = add nuw nsw i64 %indvars.iv105.i, 2
  %exitcond109.not.i.1 = icmp eq i64 %indvars.iv.next106.i.1, 2048
  br i1 %exitcond109.not.i.1, label %._crit_edge70.us.us.i, label %95

._crit_edge70.us.us.i:                            ; preds = %95
  %gep.us72.us.i = getelementptr [8192 x i8], ptr %invariant.gep.us77.i, i64 %indvars.iv115.i
  store float %111, ptr %gep.us72.us.i, align 4
  %indvars.iv.next116.i = add nuw nsw i64 %indvars.iv115.i, 1
  %exitcond119.not.i = icmp eq i64 %indvars.iv.next116.i, 2048
  br i1 %exitcond119.not.i, label %.split.us.us.i, label %.lr.ph.us73.us.i

.split.us.us.i:                                   ; preds = %._crit_edge70.us.us.i
  %indvars.iv.next114.i = add nuw nsw i64 %indvars.iv113.i, 1
  %exitcond122.not.i = icmp eq i64 %indvars.iv.next114.i, 2048
  br i1 %exitcond122.not.i, label %_Z10covarianceiiPA2048_fS0_Pf.exit, label %.preheader.us.i

scalar.ph:                                        ; preds = %.preheader60.i, %scalar.ph
  %indvars.iv87.i = phi i64 [ %indvars.iv.next88.i.3, %scalar.ph ], [ 0, %.preheader60.i ]
  %112 = getelementptr [4 x i8], ptr %19, i64 %indvars.iv87.i
  %113 = load float, ptr %112, align 4
  %114 = getelementptr [4 x i8], ptr %79, i64 %indvars.iv87.i
  %115 = load float, ptr %114, align 4
  %116 = fsub float %115, %113
  store float %116, ptr %114, align 4
  %indvars.iv.next88.i = or disjoint i64 %indvars.iv87.i, 1
  %117 = getelementptr [4 x i8], ptr %19, i64 %indvars.iv.next88.i
  %118 = load float, ptr %117, align 4
  %119 = getelementptr [4 x i8], ptr %79, i64 %indvars.iv.next88.i
  %120 = load float, ptr %119, align 4
  %121 = fsub float %120, %118
  store float %121, ptr %119, align 4
  %indvars.iv.next88.i.1 = or disjoint i64 %indvars.iv87.i, 2
  %122 = getelementptr [4 x i8], ptr %19, i64 %indvars.iv.next88.i.1
  %123 = load float, ptr %122, align 4
  %124 = getelementptr [4 x i8], ptr %79, i64 %indvars.iv.next88.i.1
  %125 = load float, ptr %124, align 4
  %126 = fsub float %125, %123
  store float %126, ptr %124, align 4
  %indvars.iv.next88.i.2 = or disjoint i64 %indvars.iv87.i, 3
  %127 = getelementptr [4 x i8], ptr %19, i64 %indvars.iv.next88.i.2
  %128 = load float, ptr %127, align 4
  %129 = getelementptr [4 x i8], ptr %79, i64 %indvars.iv.next88.i.2
  %130 = load float, ptr %129, align 4
  %131 = fsub float %130, %128
  store float %131, ptr %129, align 4
  %indvars.iv.next88.i.3 = add nuw nsw i64 %indvars.iv87.i, 4
  %exitcond91.not.i.3 = icmp eq i64 %indvars.iv.next88.i.3, 2048
  br i1 %exitcond91.not.i.3, label %._crit_edge.i38, label %scalar.ph, !llvm.loop !28

._crit_edge.i38:                                  ; preds = %vector.body57, %scalar.ph
  %indvars.iv.next93.i = add nuw nsw i64 %indvars.iv92.i, 1
  %exitcond96.not.i = icmp eq i64 %indvars.iv.next93.i, 2048
  br i1 %exitcond96.not.i, label %.preheader.us.i, label %.preheader60.i

_Z10covarianceiiPA2048_fS0_Pf.exit:               ; preds = %.split.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %132 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #15
  %.not.i.i40 = icmp eq i32 %132, 0
  br i1 %.not.i.i40, label %_Z20polybench_timer_stopv.exit, label %133

133:                                              ; preds = %_Z10covarianceiiPA2048_fS0_Pf.exit
  %134 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %132) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z10covarianceiiPA2048_fS0_Pf.exit, %133
  %135 = load i64, ptr %1, align 8
  %136 = sitofp i64 %135 to double
  %137 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %138 = load i64, ptr %137, align 8
  %139 = sitofp i64 %138 to double
  %140 = fmul nnan double %139, f0x3EB0C6F7A0B5ED8D
  %141 = fadd double %140, %136
  call void @llvm.lifetime.end.p0(ptr nonnull %1)
  store double %141, ptr @polybench_t_end, align 8
  %142 = load double, ptr @polybench_t_start, align 8
  %143 = fsub double %141, %142
  %144 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %143) #5
  br label %.preheader.us.i41

.preheader.us.i41:                                ; preds = %._crit_edge.us.i45, %_Z20polybench_timer_stopv.exit
  %indvars.iv23.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next24.i, %._crit_edge.us.i45 ]
  %.018.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %181, %._crit_edge.us.i45 ]
  %145 = getelementptr [8192 x i8], ptr %14, i64 %indvars.iv23.i
  %146 = getelementptr [8192 x i8], ptr %24, i64 %indvars.iv23.i
  %147 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.018.us.i, i64 0
  br label %vector.body66

vector.body66:                                    ; preds = %vector.body66, %.preheader.us.i41
  %index67 = phi i64 [ 0, %.preheader.us.i41 ], [ %index.next70, %vector.body66 ]
  %vec.phi = phi <4 x i32> [ %147, %.preheader.us.i41 ], [ %179, %vector.body66 ]
  %148 = getelementptr [4 x i8], ptr %145, i64 %index67
  %wide.load68 = load <4 x float>, ptr %148, align 4
  %149 = fpext <4 x float> %wide.load68 to <4 x double>
  %150 = getelementptr [4 x i8], ptr %146, i64 %index67
  %wide.load69 = load <4 x float>, ptr %150, align 4
  %151 = fpext <4 x float> %wide.load69 to <4 x double>
  %152 = fcmp olt <4 x double> %149, splat (double f0xB690000000000000)
  %153 = fneg <4 x float> %wide.load68
  %154 = select <4 x i1> %152, <4 x float> %153, <4 x float> %wide.load68
  %155 = fpext <4 x float> %154 to <4 x double>
  %156 = fcmp uge <4 x double> %155, splat (double 1.000000e-02)
  %157 = fcmp olt <4 x double> %151, splat (double f0xB690000000000000)
  %158 = fneg <4 x float> %wide.load69
  %159 = select <4 x i1> %157, <4 x float> %158, <4 x float> %wide.load69
  %160 = fpext <4 x float> %159 to <4 x double>
  %161 = fcmp uge <4 x double> %160, splat (double 1.000000e-02)
  %162 = fsub <4 x double> %149, %151
  %163 = fptrunc <4 x double> %162 to <4 x float>
  %164 = fcmp olt <4 x double> %162, splat (double f0xB690000000000000)
  %165 = fneg <4 x float> %163
  %166 = select <4 x i1> %164, <4 x float> %165, <4 x float> %163
  %167 = fadd <4 x double> %149, splat (double f0x3E45798EE0000000)
  %168 = fptrunc <4 x double> %167 to <4 x float>
  %169 = fcmp olt <4 x double> %167, splat (double f0xB690000000000000)
  %170 = fneg <4 x float> %168
  %171 = select <4 x i1> %169, <4 x float> %170, <4 x float> %168
  %172 = fdiv <4 x float> %166, %171
  %173 = fcmp olt <4 x float> %172, zeroinitializer
  %174 = fneg <4 x float> %172
  %175 = select <4 x i1> %173, <4 x float> %174, <4 x float> %172
  %176 = fmul <4 x float> %175, splat (float 1.000000e+02)
  %177 = fpext <4 x float> %176 to <4 x double>
  %178 = fcmp ogt <4 x double> %177, splat (double 1.050000e+00)
  %.not73 = select <4 x i1> %156, <4 x i1> splat (i1 true), <4 x i1> %161
  %narrow = select <4 x i1> %.not73, <4 x i1> %178, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %179 = add <4 x i32> %vec.phi, %predphi
  %index.next70 = add nuw i64 %index67, 4
  %180 = icmp eq i64 %index.next70, 2048
  br i1 %180, label %._crit_edge.us.i45, label %vector.body66, !llvm.loop !29

._crit_edge.us.i45:                               ; preds = %vector.body66
  %181 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %179)
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1
  %exitcond27.not.i = icmp eq i64 %indvars.iv.next24.i, 2048
  br i1 %exitcond27.not.i, label %_Z14compareResultsiiPA2048_fS0_.exit, label %.preheader.us.i41

_Z14compareResultsiiPA2048_fS0_.exit:             ; preds = %._crit_edge.us.i45
  %182 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 1.050000e+00, i32 noundef %181) #5
  call void @free(ptr noundef %9) #15
  call void @free(ptr noundef nonnull %14) #15
  call void @free(ptr noundef %19) #15
  call void @free(ptr noundef nonnull %24) #15
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

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #14

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
attributes #11 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #13 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #14 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #15 = { nounwind "uniform-work-group-size" }
attributes #16 = { cold }
attributes #17 = { cold noreturn nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.isvectorized", i32 1}
!3 = !{!"llvm.loop.unroll.runtime.disable"}
!4 = distinct !{!4, !3, !2}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !2}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !2, !3}
!17 = distinct !{!17, !3, !2}
!18 = !{ptr @_Z26__device_stub__mean_kerneliiPfS_}
!19 = !{ptr @_Z28__device_stub__reduce_kerneliiPfS_}
!20 = !{ptr @_Z27__device_stub__covar_kerneliiPfS_}
!21 = distinct !{!21, !2, !3}
!22 = !{!23}
!23 = distinct !{!23, !24}
!24 = distinct !{!24, !"LVerDomain"}
!25 = !{!26}
!26 = distinct !{!26, !24}
!27 = distinct !{!27, !2, !3}
!28 = distinct !{!28, !2}
!29 = distinct !{!29, !2, !3}
