; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/MVT/mvt.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/MVT/mvt.cu"
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
define dso_local void @_Z10init_arrayiPA4096_fPfS1_S1_S1_(i32 noundef %0, ptr nofree noundef writeonly captures(none) %1, ptr nofree noundef writeonly captures(none) %2, ptr nofree noundef writeonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4, ptr nofree noundef writeonly captures(none) %5) local_unnamed_addr #1 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.us.preheader, label %._crit_edge28

.lr.ph.us.preheader:                              ; preds = %6
  %wide.trip.count33 = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 8
  %n.vec = and i64 %wide.trip.count33, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count33
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge.us
  %indvars.iv30 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next31, %._crit_edge.us ]
  %8 = trunc nuw nsw i64 %indvars.iv30 to i32
  %9 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv30
  %10 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv30
  %11 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv30
  %12 = uitofp nneg i32 %8 to float
  %13 = insertelement <4 x float> poison, float %12, i64 0
  %14 = shufflevector <4 x float> %13, <4 x float> poison, <4 x i32> zeroinitializer
  %15 = fadd nnan <4 x float> %14, <float -0.000000e+00, float 1.000000e+00, float 3.000000e+00, float 4.000000e+00>
  %16 = fmul nnan <4 x float> %15, splat (float f0x39800000)
  %17 = extractelement <4 x float> %16, i64 0
  store float %17, ptr %9, align 4
  %18 = extractelement <4 x float> %16, i64 1
  store float %18, ptr %10, align 4
  %19 = extractelement <4 x float> %16, i64 2
  store float %19, ptr %11, align 4
  %20 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv30
  %21 = extractelement <4 x float> %16, i64 3
  store float %21, ptr %20, align 4
  %22 = getelementptr [16384 x i8], ptr %1, i64 %indvars.iv30
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.us
  %broadcast.splatinsert = insertelement <4 x float> poison, float %12, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %23 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %24 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %25 = fmul nnan <4 x float> %broadcast.splat, %23
  %26 = fmul nnan <4 x float> %broadcast.splat, %24
  %27 = fmul nnan <4 x float> %25, splat (float f0x39800000)
  %28 = fmul nnan <4 x float> %26, splat (float f0x39800000)
  %29 = getelementptr [4 x i8], ptr %22, i64 %index
  %30 = getelementptr i8, ptr %29, i64 16
  store <4 x float> %27, ptr %29, align 4
  store <4 x float> %28, ptr %30, align 4
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %31 = icmp eq i64 %index.next, %n.vec
  br i1 %31, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.lr.ph.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.lr.ph.us ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %32 = trunc nuw nsw i64 %indvars.iv to i32
  %33 = uitofp nneg i32 %32 to float
  %34 = fmul nnan float %12, %33
  %35 = fmul nnan float %34, f0x39800000
  %36 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv
  store float %35, ptr %36, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count33
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !4

._crit_edge.us:                                   ; preds = %scalar.ph, %middle.block
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond34.not = icmp eq i64 %indvars.iv.next31, %wide.trip.count33
  br i1 %exitcond34.not, label %._crit_edge28, label %.lr.ph.us

._crit_edge28:                                    ; preds = %._crit_edge.us, %6
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z6runMvtiPA4096_fPfS1_S1_S1_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef captures(none) %2, ptr nofree noundef captures(none) %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef readonly captures(none) %5) local_unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader32.preheader, label %._crit_edge38.split

.preheader32.preheader:                           ; preds = %6
  %wide.trip.count = zext nneg i32 %0 to i64
  br label %.preheader32

.preheader32:                                     ; preds = %.preheader32.preheader, %25
  %indvars.iv40 = phi i64 [ 0, %.preheader32.preheader ], [ %indvars.iv.next41, %25 ]
  %8 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv40
  %9 = getelementptr [16384 x i8], ptr %1, i64 %indvars.iv40
  %.promoted = load float, ptr %8, align 4
  br label %11

.preheader.preheader:                             ; preds = %25
  %wide.trip.count52 = zext nneg i32 %0 to i64
  %xtraiter = and i64 %wide.trip.count52, 1
  %10 = icmp eq i32 %0, 1
  %unroll_iter = and i64 %wide.trip.count52, 2147483646
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod54 = trunc i32 %0 to i1
  br label %.preheader

11:                                               ; preds = %11, %.preheader32
  %indvars.iv = phi i64 [ 0, %.preheader32 ], [ %indvars.iv.next.1, %11 ]
  %12 = phi float [ %.promoted, %.preheader32 ], [ %24, %11 ]
  %13 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv
  %14 = load float, ptr %13, align 4
  %15 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv
  %16 = load float, ptr %15, align 4
  %17 = fmul float %14, %16
  %18 = fadd float %12, %17
  store float %18, ptr %8, align 4
  %indvars.iv.next = or disjoint i64 %indvars.iv, 1
  %19 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv.next
  %20 = load float, ptr %19, align 4
  %21 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv.next
  %22 = load float, ptr %21, align 4
  %23 = fmul float %20, %22
  %24 = fadd float %18, %23
  store float %24, ptr %8, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, 4096
  br i1 %exitcond.not.1, label %25, label %11

25:                                               ; preds = %11
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43.not = icmp eq i64 %indvars.iv.next41, %wide.trip.count
  br i1 %exitcond43.not, label %.preheader.preheader, label %.preheader32

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv49 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next50, %._crit_edge ]
  %26 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv49
  %invariant.gep = getelementptr [4 x i8], ptr %1, i64 %indvars.iv49
  %.promoted36 = load float, ptr %26, align 4
  br i1 %10, label %.epil.preheader, label %.preheader.new

.preheader.new:                                   ; preds = %.preheader, %.preheader.new
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.1, %.preheader.new ], [ 0, %.preheader ]
  %27 = phi float [ %37, %.preheader.new ], [ %.promoted36, %.preheader ]
  %niter = phi i64 [ %niter.next.1, %.preheader.new ], [ 0, %.preheader ]
  %gep = getelementptr [16384 x i8], ptr %invariant.gep, i64 %indvars.iv44
  %28 = load float, ptr %gep, align 4
  %29 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv44
  %30 = load float, ptr %29, align 4
  %31 = fmul float %28, %30
  %32 = fadd float %27, %31
  store float %32, ptr %26, align 4
  %indvars.iv.next45 = or disjoint i64 %indvars.iv44, 1
  %gep.1 = getelementptr [16384 x i8], ptr %invariant.gep, i64 %indvars.iv.next45
  %33 = load float, ptr %gep.1, align 4
  %34 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv.next45
  %35 = load float, ptr %34, align 4
  %36 = fmul float %33, %35
  %37 = fadd float %32, %36
  store float %37, ptr %26, align 4
  %indvars.iv.next45.1 = add nuw nsw i64 %indvars.iv44, 2
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %._crit_edge.unr-lcssa, label %.preheader.new

._crit_edge.unr-lcssa:                            ; preds = %.preheader.new
  br i1 %lcmp.mod.not, label %._crit_edge, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.unr-lcssa, %.preheader
  %indvars.iv44.epil.init = phi i64 [ 0, %.preheader ], [ %indvars.iv.next45.1, %._crit_edge.unr-lcssa ]
  %.epil.init = phi float [ %.promoted36, %.preheader ], [ %37, %._crit_edge.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod54)
  %gep.epil = getelementptr [16384 x i8], ptr %invariant.gep, i64 %indvars.iv44.epil.init
  %38 = load float, ptr %gep.epil, align 4
  %39 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv44.epil.init
  %40 = load float, ptr %39, align 4
  %41 = fmul float %38, %40
  %42 = fadd float %.epil.init, %41
  store float %42, ptr %26, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.unr-lcssa, %.epil.preheader
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond53.not = icmp eq i64 %indvars.iv.next50, %wide.trip.count52
  br i1 %exitcond53.not, label %._crit_edge38.split, label %.preheader

._crit_edge38.split:                              ; preds = %._crit_edge, %6
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiPfS_S_S_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef readonly captures(none) %4) local_unnamed_addr #4 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %5
  %wide.trip.count = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  br i1 %min.iters.check, label %.lr.ph.preheader30, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.preheader
  %n.vec = and i64 %wide.trip.count, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %72, %vector.body ]
  %7 = getelementptr [4 x i8], ptr %1, i64 %index
  %wide.load = load <4 x float>, ptr %7, align 4
  %8 = fpext <4 x float> %wide.load to <4 x double>
  %9 = getelementptr [4 x i8], ptr %2, i64 %index
  %wide.load25 = load <4 x float>, ptr %9, align 4
  %10 = fpext <4 x float> %wide.load25 to <4 x double>
  %11 = fcmp olt <4 x double> %8, splat (double f0xB690000000000000)
  %12 = fneg <4 x float> %wide.load
  %13 = select <4 x i1> %11, <4 x float> %12, <4 x float> %wide.load
  %14 = fpext <4 x float> %13 to <4 x double>
  %15 = fcmp uge <4 x double> %14, splat (double 1.000000e-02)
  %16 = fcmp olt <4 x double> %10, splat (double f0xB690000000000000)
  %17 = fneg <4 x float> %wide.load25
  %18 = select <4 x i1> %16, <4 x float> %17, <4 x float> %wide.load25
  %19 = fpext <4 x float> %18 to <4 x double>
  %20 = fcmp uge <4 x double> %19, splat (double 1.000000e-02)
  %21 = select <4 x i1> %15, <4 x i1> splat (i1 true), <4 x i1> %20
  %22 = fsub <4 x double> %8, %10
  %23 = fptrunc <4 x double> %22 to <4 x float>
  %24 = fcmp olt <4 x double> %22, splat (double f0xB690000000000000)
  %25 = fneg <4 x float> %23
  %26 = select <4 x i1> %24, <4 x float> %25, <4 x float> %23
  %27 = fadd <4 x double> %8, splat (double f0x3E45798EE0000000)
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
  %narrow = select <4 x i1> %21, <4 x i1> %38, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %39 = add <4 x i32> %vec.phi, %predphi
  %40 = getelementptr [4 x i8], ptr %3, i64 %index
  %wide.load26 = load <4 x float>, ptr %40, align 4
  %41 = fpext <4 x float> %wide.load26 to <4 x double>
  %42 = getelementptr [4 x i8], ptr %4, i64 %index
  %wide.load27 = load <4 x float>, ptr %42, align 4
  %43 = fpext <4 x float> %wide.load27 to <4 x double>
  %44 = fcmp olt <4 x double> %41, splat (double f0xB690000000000000)
  %45 = fneg <4 x float> %wide.load26
  %46 = select <4 x i1> %44, <4 x float> %45, <4 x float> %wide.load26
  %47 = fpext <4 x float> %46 to <4 x double>
  %48 = fcmp uge <4 x double> %47, splat (double 1.000000e-02)
  %49 = fcmp olt <4 x double> %43, splat (double f0xB690000000000000)
  %50 = fneg <4 x float> %wide.load27
  %51 = select <4 x i1> %49, <4 x float> %50, <4 x float> %wide.load27
  %52 = fpext <4 x float> %51 to <4 x double>
  %53 = fcmp uge <4 x double> %52, splat (double 1.000000e-02)
  %54 = select <4 x i1> %48, <4 x i1> splat (i1 true), <4 x i1> %53
  %55 = fsub <4 x double> %41, %43
  %56 = fptrunc <4 x double> %55 to <4 x float>
  %57 = fcmp olt <4 x double> %55, splat (double f0xB690000000000000)
  %58 = fneg <4 x float> %56
  %59 = select <4 x i1> %57, <4 x float> %58, <4 x float> %56
  %60 = fadd <4 x double> %41, splat (double f0x3E45798EE0000000)
  %61 = fptrunc <4 x double> %60 to <4 x float>
  %62 = fcmp olt <4 x double> %60, splat (double f0xB690000000000000)
  %63 = fneg <4 x float> %61
  %64 = select <4 x i1> %62, <4 x float> %63, <4 x float> %61
  %65 = fdiv <4 x float> %59, %64
  %66 = fcmp olt <4 x float> %65, zeroinitializer
  %67 = fneg <4 x float> %65
  %68 = select <4 x i1> %66, <4 x float> %67, <4 x float> %65
  %69 = fmul <4 x float> %68, splat (float 1.000000e+02)
  %70 = fpext <4 x float> %69 to <4 x double>
  %71 = fcmp ogt <4 x double> %70, splat (double 5.000000e-02)
  %narrow29 = select <4 x i1> %54, <4 x i1> %71, <4 x i1> zeroinitializer
  %predphi28 = zext <4 x i1> %narrow29 to <4 x i32>
  %72 = add <4 x i32> %39, %predphi28
  %index.next = add nuw i64 %index, 4
  %73 = icmp eq i64 %index.next, %n.vec
  br i1 %73, label %middle.block, label %vector.body, !llvm.loop !5

middle.block:                                     ; preds = %vector.body
  %74 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %72)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph.preheader30

.lr.ph.preheader30:                               ; preds = %.lr.ph.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %middle.block ]
  %.023.ph = phi i32 [ 0, %.lr.ph.preheader ], [ %74, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader30, %_Z11percentDiffdd.exit21
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit21 ], [ %indvars.iv.ph, %.lr.ph.preheader30 ]
  %.023 = phi i32 [ %.2, %_Z11percentDiffdd.exit21 ], [ %.023.ph, %.lr.ph.preheader30 ]
  %75 = getelementptr [4 x i8], ptr %1, i64 %indvars.iv
  %76 = load float, ptr %75, align 4
  %77 = fpext float %76 to double
  %78 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv
  %79 = load float, ptr %78, align 4
  %80 = fpext float %79 to double
  %81 = fcmp olt double %77, f0xB690000000000000
  %82 = fneg float %76
  %common.ret.op.i.i = select i1 %81, float %82, float %76
  %83 = fpext float %common.ret.op.i.i to double
  %84 = fcmp olt double %83, 1.000000e-02
  br i1 %84, label %85, label %.critedge.i

85:                                               ; preds = %.lr.ph
  %86 = fcmp olt double %80, f0xB690000000000000
  %87 = fneg float %79
  %common.ret.op.i7.i = select i1 %86, float %87, float %79
  %88 = fpext float %common.ret.op.i7.i to double
  %89 = fcmp olt double %88, 1.000000e-02
  br i1 %89, label %_Z11percentDiffdd.exit, label %.critedge.i

.critedge.i:                                      ; preds = %85, %.lr.ph
  %90 = insertelement <2 x double> poison, double %77, i64 0
  %91 = shufflevector <2 x double> %90, <2 x double> poison, <2 x i32> zeroinitializer
  %92 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %80, i64 0
  %93 = fsub <2 x double> %91, %92
  %94 = fptrunc <2 x double> %93 to <2 x float>
  %95 = fcmp olt <2 x double> %93, splat (double f0xB690000000000000)
  %96 = fneg <2 x float> %94
  %97 = select <2 x i1> %95, <2 x float> %96, <2 x float> %94
  %98 = extractelement <2 x float> %97, i64 0
  %99 = extractelement <2 x float> %97, i64 1
  %100 = fdiv float %98, %99
  %101 = fcmp olt float %100, 0.000000e+00
  %102 = fneg float %100
  %common.ret.op.i10.i = select i1 %101, float %102, float %100
  %103 = fmul float %common.ret.op.i10.i, 1.000000e+02
  %104 = fpext float %103 to double
  %105 = fcmp ogt double %104, 5.000000e-02
  %106 = zext i1 %105 to i32
  br label %_Z11percentDiffdd.exit

_Z11percentDiffdd.exit:                           ; preds = %85, %.critedge.i
  %common.ret.op.i = phi i32 [ %106, %.critedge.i ], [ 0, %85 ]
  %.1 = add nsw i32 %common.ret.op.i, %.023
  %107 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv
  %108 = load float, ptr %107, align 4
  %109 = fpext float %108 to double
  %110 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv
  %111 = load float, ptr %110, align 4
  %112 = fpext float %111 to double
  %113 = fcmp olt double %109, f0xB690000000000000
  %114 = fneg float %108
  %common.ret.op.i.i14 = select i1 %113, float %114, float %108
  %115 = fpext float %common.ret.op.i.i14 to double
  %116 = fcmp olt double %115, 1.000000e-02
  br i1 %116, label %117, label %.critedge.i15

117:                                              ; preds = %_Z11percentDiffdd.exit
  %118 = fcmp olt double %112, f0xB690000000000000
  %119 = fneg float %111
  %common.ret.op.i7.i20 = select i1 %118, float %119, float %111
  %120 = fpext float %common.ret.op.i7.i20 to double
  %121 = fcmp olt double %120, 1.000000e-02
  br i1 %121, label %_Z11percentDiffdd.exit21, label %.critedge.i15

.critedge.i15:                                    ; preds = %117, %_Z11percentDiffdd.exit
  %122 = insertelement <2 x double> poison, double %109, i64 0
  %123 = shufflevector <2 x double> %122, <2 x double> poison, <2 x i32> zeroinitializer
  %124 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %112, i64 0
  %125 = fsub <2 x double> %123, %124
  %126 = fptrunc <2 x double> %125 to <2 x float>
  %127 = fcmp olt <2 x double> %125, splat (double f0xB690000000000000)
  %128 = fneg <2 x float> %126
  %129 = select <2 x i1> %127, <2 x float> %128, <2 x float> %126
  %130 = extractelement <2 x float> %129, i64 0
  %131 = extractelement <2 x float> %129, i64 1
  %132 = fdiv float %130, %131
  %133 = fcmp olt float %132, 0.000000e+00
  %134 = fneg float %132
  %common.ret.op.i10.i18 = select i1 %133, float %134, float %132
  %135 = fmul float %common.ret.op.i10.i18, 1.000000e+02
  %136 = fpext float %135 to double
  %137 = fcmp ogt double %136, 5.000000e-02
  %138 = zext i1 %137 to i32
  br label %_Z11percentDiffdd.exit21

_Z11percentDiffdd.exit21:                         ; preds = %117, %.critedge.i15
  %common.ret.op.i19 = phi i32 [ %138, %.critedge.i15 ], [ 0, %117 ]
  %.2 = add nsw i32 %.1, %common.ret.op.i19
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !llvm.loop !6

._crit_edge:                                      ; preds = %_Z11percentDiffdd.exit21, %middle.block, %5
  %.0.lcssa = phi i32 [ 0, %5 ], [ %74, %middle.block ], [ %.2, %_Z11percentDiffdd.exit21 ]
  %139 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %.0.lcssa) #5
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

define dso_local void @_Z26__device_stub__mvt_kernel1iPfS_S_(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #6 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
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
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mvt_kernel1iPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
  ret void
}

define dso_local void @_Z26__device_stub__mvt_kernel2iPfS_S_(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #6 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
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
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mvt_kernel2iPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
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

define dso_local void @_Z7mvtCudaiPA4096_fPfS1_S1_S1_S1_S1_(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) local_unnamed_addr #6 {
  %9 = alloca %struct.timeval, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca [4 x ptr], align 16
  %15 = alloca %struct.dim3, align 8
  %16 = alloca %struct.dim3, align 8
  %17 = alloca i64, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca [4 x ptr], align 16
  %24 = alloca %struct.dim3, align 8
  %25 = alloca %struct.dim3, align 8
  %26 = alloca i64, align 8
  %27 = alloca ptr, align 8
  %28 = alloca %struct.timeval, align 8
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = call i32 @cudaMalloc(ptr noundef nonnull %29, i64 noundef 67108864) #5
  %35 = call i32 @cudaMalloc(ptr noundef nonnull %30, i64 noundef 16384) #5
  %36 = call i32 @cudaMalloc(ptr noundef nonnull %31, i64 noundef 16384) #5
  %37 = call i32 @cudaMalloc(ptr noundef nonnull %32, i64 noundef 16384) #5
  %38 = call i32 @cudaMalloc(ptr noundef nonnull %33, i64 noundef 16384) #5
  %39 = load ptr, ptr %29, align 8
  %40 = call i32 @cudaMemcpy(ptr noundef %39, ptr noundef %1, i64 noundef 67108864, i32 noundef 1) #5
  %41 = load ptr, ptr %30, align 8
  %42 = call i32 @cudaMemcpy(ptr noundef %41, ptr noundef %2, i64 noundef 16384, i32 noundef 1) #5
  %43 = load ptr, ptr %31, align 8
  %44 = call i32 @cudaMemcpy(ptr noundef %43, ptr noundef %3, i64 noundef 16384, i32 noundef 1) #5
  %45 = load ptr, ptr %32, align 8
  %46 = call i32 @cudaMemcpy(ptr noundef %45, ptr noundef %4, i64 noundef 16384, i32 noundef 1) #5
  %47 = load ptr, ptr %33, align 8
  %48 = call i32 @cudaMemcpy(ptr noundef %47, ptr noundef %5, i64 noundef 16384, i32 noundef 1) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %28)
  %49 = call i32 @gettimeofday(ptr noundef nonnull %28, ptr noundef null) #14
  %.not.i.i = icmp eq i32 %49, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %50

50:                                               ; preds = %8
  %51 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %49) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %8, %50
  %52 = load i64, ptr %28, align 8
  %53 = sitofp i64 %52 to double
  %54 = getelementptr inbounds nuw i8, ptr %28, i64 8
  %55 = load i64, ptr %54, align 8
  %56 = sitofp i64 %55 to double
  %57 = fmul nnan double %56, f0x3EB0C6F7A0B5ED8D
  %58 = fadd double %57, %53
  call void @llvm.lifetime.end.p0(ptr nonnull %28)
  store double %58, ptr @polybench_t_start, align 8
  %59 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 128, i32 1, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %59, 0
  br i1 %.not, label %60, label %71

60:                                               ; preds = %_Z21polybench_timer_startv.exit
  %61 = load ptr, ptr %29, align 8
  %62 = load ptr, ptr %30, align 8
  %63 = load ptr, ptr %32, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %19)
  call void @llvm.lifetime.start.p0(ptr nonnull %20)
  call void @llvm.lifetime.start.p0(ptr nonnull %21)
  call void @llvm.lifetime.start.p0(ptr nonnull %22)
  call void @llvm.lifetime.start.p0(ptr nonnull %23)
  call void @llvm.lifetime.start.p0(ptr nonnull %24)
  call void @llvm.lifetime.start.p0(ptr nonnull %25)
  call void @llvm.lifetime.start.p0(ptr nonnull %26)
  call void @llvm.lifetime.start.p0(ptr nonnull %27)
  store i32 %0, ptr %19, align 4
  store ptr %61, ptr %20, align 8
  store ptr %62, ptr %21, align 8
  store ptr %63, ptr %22, align 8
  store ptr %19, ptr %23, align 16
  %64 = getelementptr inbounds nuw i8, ptr %23, i64 8
  store ptr %20, ptr %64, align 8
  %65 = getelementptr inbounds nuw i8, ptr %23, i64 16
  store ptr %21, ptr %65, align 16
  %66 = getelementptr inbounds nuw i8, ptr %23, i64 24
  store ptr %22, ptr %66, align 8
  %67 = call i32 @__cudaPopCallConfiguration(ptr nonnull %24, ptr nonnull %25, ptr nonnull %26, ptr nonnull %27), !inline_history !7
  %68 = load i64, ptr %26, align 8
  %69 = load ptr, ptr %27, align 8
  %.fca.0.load2.i = load i32, ptr %24, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %24, i64 4
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %24, i64 8
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %25, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %25, i64 4
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %25, i64 8
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %70 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mvt_kernel1iPfS_S_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %23, i64 noundef %68, ptr noundef %69), !inline_history !7
  call void @llvm.lifetime.end.p0(ptr nonnull %19)
  call void @llvm.lifetime.end.p0(ptr nonnull %20)
  call void @llvm.lifetime.end.p0(ptr nonnull %21)
  call void @llvm.lifetime.end.p0(ptr nonnull %22)
  call void @llvm.lifetime.end.p0(ptr nonnull %23)
  call void @llvm.lifetime.end.p0(ptr nonnull %24)
  call void @llvm.lifetime.end.p0(ptr nonnull %25)
  call void @llvm.lifetime.end.p0(ptr nonnull %26)
  call void @llvm.lifetime.end.p0(ptr nonnull %27)
  br label %71

71:                                               ; preds = %_Z21polybench_timer_startv.exit, %60
  %72 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 128, i32 1, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not26 = icmp eq i32 %72, 0
  br i1 %.not26, label %73, label %84

73:                                               ; preds = %71
  %74 = load ptr, ptr %29, align 8
  %75 = load ptr, ptr %31, align 8
  %76 = load ptr, ptr %33, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  call void @llvm.lifetime.start.p0(ptr nonnull %15)
  call void @llvm.lifetime.start.p0(ptr nonnull %16)
  call void @llvm.lifetime.start.p0(ptr nonnull %17)
  call void @llvm.lifetime.start.p0(ptr nonnull %18)
  store i32 %0, ptr %10, align 4
  store ptr %74, ptr %11, align 8
  store ptr %75, ptr %12, align 8
  store ptr %76, ptr %13, align 8
  store ptr %10, ptr %14, align 16
  %77 = getelementptr inbounds nuw i8, ptr %14, i64 8
  store ptr %11, ptr %77, align 8
  %78 = getelementptr inbounds nuw i8, ptr %14, i64 16
  store ptr %12, ptr %78, align 16
  %79 = getelementptr inbounds nuw i8, ptr %14, i64 24
  store ptr %13, ptr %79, align 8
  %80 = call i32 @__cudaPopCallConfiguration(ptr nonnull %15, ptr nonnull %16, ptr nonnull %17, ptr nonnull %18), !inline_history !8
  %81 = load i64, ptr %17, align 8
  %82 = load ptr, ptr %18, align 8
  %.fca.0.load2.i27 = load i32, ptr %15, align 8
  %.fca.0.insert3.i28 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i27, 0
  %.fca.1.gep4.i29 = getelementptr inbounds nuw i8, ptr %15, i64 4
  %.fca.1.load5.i30 = load i32, ptr %.fca.1.gep4.i29, align 4
  %.fca.1.insert6.i31 = insertvalue %struct.dim3 %.fca.0.insert3.i28, i32 %.fca.1.load5.i30, 1
  %.fca.2.gep7.i32 = getelementptr inbounds nuw i8, ptr %15, i64 8
  %.fca.2.load8.i33 = load i32, ptr %.fca.2.gep7.i32, align 8
  %.fca.2.insert9.i34 = insertvalue %struct.dim3 %.fca.1.insert6.i31, i32 %.fca.2.load8.i33, 2
  %.fca.0.load.i35 = load i32, ptr %16, align 8
  %.fca.0.insert.i36 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i35, 0
  %.fca.1.gep.i37 = getelementptr inbounds nuw i8, ptr %16, i64 4
  %.fca.1.load.i38 = load i32, ptr %.fca.1.gep.i37, align 4
  %.fca.1.insert.i39 = insertvalue %struct.dim3 %.fca.0.insert.i36, i32 %.fca.1.load.i38, 1
  %.fca.2.gep.i40 = getelementptr inbounds nuw i8, ptr %16, i64 8
  %.fca.2.load.i41 = load i32, ptr %.fca.2.gep.i40, align 8
  %.fca.2.insert.i42 = insertvalue %struct.dim3 %.fca.1.insert.i39, i32 %.fca.2.load.i41, 2
  %83 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mvt_kernel2iPfS_S_, %struct.dim3 %.fca.2.insert9.i34, %struct.dim3 %.fca.2.insert.i42, ptr noundef nonnull %14, i64 noundef %81, ptr noundef %82), !inline_history !8
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  call void @llvm.lifetime.end.p0(ptr nonnull %13)
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  call void @llvm.lifetime.end.p0(ptr nonnull %15)
  call void @llvm.lifetime.end.p0(ptr nonnull %16)
  call void @llvm.lifetime.end.p0(ptr nonnull %17)
  call void @llvm.lifetime.end.p0(ptr nonnull %18)
  br label %84

84:                                               ; preds = %71, %73
  %85 = call i32 @cudaThreadSynchronize() #5
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  %86 = call i32 @gettimeofday(ptr noundef nonnull %9, ptr noundef null) #14
  %.not.i.i43 = icmp eq i32 %86, 0
  br i1 %.not.i.i43, label %_Z20polybench_timer_stopv.exit, label %87

87:                                               ; preds = %84
  %88 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %86) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %84, %87
  %89 = load i64, ptr %9, align 8
  %90 = sitofp i64 %89 to double
  %91 = getelementptr inbounds nuw i8, ptr %9, i64 8
  %92 = load i64, ptr %91, align 8
  %93 = sitofp i64 %92 to double
  %94 = fmul nnan double %93, f0x3EB0C6F7A0B5ED8D
  %95 = fadd double %94, %90
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  store double %95, ptr @polybench_t_end, align 8
  %96 = load double, ptr @polybench_t_start, align 8
  %97 = fsub double %95, %96
  %98 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %97) #5
  %99 = load ptr, ptr %30, align 8
  %100 = call i32 @cudaMemcpy(ptr noundef %6, ptr noundef %99, i64 noundef 16384, i32 noundef 2) #5
  %101 = load ptr, ptr %31, align 8
  %102 = call i32 @cudaMemcpy(ptr noundef %7, ptr noundef %101, i64 noundef 16384, i32 noundef 2) #5
  %103 = load ptr, ptr %29, align 8
  %104 = call i32 @cudaFree(ptr noundef %103) #5
  %105 = load ptr, ptr %30, align 8
  %106 = call i32 @cudaFree(ptr noundef %105) #5
  %107 = load ptr, ptr %31, align 8
  %108 = call i32 @cudaFree(ptr noundef %107) #5
  %109 = load ptr, ptr %32, align 8
  %110 = call i32 @cudaFree(ptr noundef %109) #5
  %111 = load ptr, ptr %33, align 8
  %112 = call i32 @cudaFree(ptr noundef %111) #5
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
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  store ptr null, ptr %10, align 8
  %11 = call i32 @posix_memalign(ptr noundef nonnull %10, i64 noundef 32, i64 noundef 67108864) #14
  %12 = load ptr, ptr %10, align 8
  %.not.i.i = icmp eq ptr %12, null
  %13 = icmp ne i32 %11, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %13
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %0
  %14 = load ptr, ptr @stderr, align 8
  %15 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %14) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %0
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  store ptr null, ptr %9, align 8
  %16 = call i32 @posix_memalign(ptr noundef nonnull %9, i64 noundef 32, i64 noundef 16384) #14
  %17 = load ptr, ptr %9, align 8
  %.not.i.i32 = icmp eq ptr %17, null
  %18 = icmp ne i32 %16, 0
  %or.cond.i.i33 = select i1 %.not.i.i32, i1 true, i1 %18
  br i1 %or.cond.i.i33, label %.critedge.i.i34, label %_Z20polybench_alloc_datayi.exit35

.critedge.i.i34:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %19 = load ptr, ptr @stderr, align 8
  %20 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %19) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit35:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %21 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 16384) #14
  %22 = load ptr, ptr %8, align 8
  %.not.i.i36 = icmp eq ptr %22, null
  %23 = icmp ne i32 %21, 0
  %or.cond.i.i37 = select i1 %.not.i.i36, i1 true, i1 %23
  br i1 %or.cond.i.i37, label %.critedge.i.i38, label %_Z20polybench_alloc_datayi.exit39

.critedge.i.i38:                                  ; preds = %_Z20polybench_alloc_datayi.exit35
  %24 = load ptr, ptr @stderr, align 8
  %25 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %24) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit39:                ; preds = %_Z20polybench_alloc_datayi.exit35
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %26 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 16384) #14
  %27 = load ptr, ptr %7, align 8
  %.not.i.i40 = icmp eq ptr %27, null
  %28 = icmp ne i32 %26, 0
  %or.cond.i.i41 = select i1 %.not.i.i40, i1 true, i1 %28
  br i1 %or.cond.i.i41, label %.critedge.i.i42, label %_Z20polybench_alloc_datayi.exit43

.critedge.i.i42:                                  ; preds = %_Z20polybench_alloc_datayi.exit39
  %29 = load ptr, ptr @stderr, align 8
  %30 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %29) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit43:                ; preds = %_Z20polybench_alloc_datayi.exit39
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %31 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 16384) #14
  %32 = load ptr, ptr %6, align 8
  %.not.i.i44 = icmp eq ptr %32, null
  %33 = icmp ne i32 %31, 0
  %or.cond.i.i45 = select i1 %.not.i.i44, i1 true, i1 %33
  br i1 %or.cond.i.i45, label %.critedge.i.i46, label %_Z20polybench_alloc_datayi.exit47

.critedge.i.i46:                                  ; preds = %_Z20polybench_alloc_datayi.exit43
  %34 = load ptr, ptr @stderr, align 8
  %35 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %34) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit47:                ; preds = %_Z20polybench_alloc_datayi.exit43
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  store ptr null, ptr %5, align 8
  %36 = call i32 @posix_memalign(ptr noundef nonnull %5, i64 noundef 32, i64 noundef 16384) #14
  %37 = load ptr, ptr %5, align 8
  %.not.i.i48 = icmp eq ptr %37, null
  %38 = icmp ne i32 %36, 0
  %or.cond.i.i49 = select i1 %.not.i.i48, i1 true, i1 %38
  br i1 %or.cond.i.i49, label %.critedge.i.i50, label %_Z20polybench_alloc_datayi.exit51

.critedge.i.i50:                                  ; preds = %_Z20polybench_alloc_datayi.exit47
  %39 = load ptr, ptr @stderr, align 8
  %40 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %39) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit51:                ; preds = %_Z20polybench_alloc_datayi.exit47
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store ptr null, ptr %4, align 8
  %41 = call i32 @posix_memalign(ptr noundef nonnull %4, i64 noundef 32, i64 noundef 16384) #14
  %42 = load ptr, ptr %4, align 8
  %.not.i.i52 = icmp eq ptr %42, null
  %43 = icmp ne i32 %41, 0
  %or.cond.i.i53 = select i1 %.not.i.i52, i1 true, i1 %43
  br i1 %or.cond.i.i53, label %.critedge.i.i54, label %_Z20polybench_alloc_datayi.exit55

.critedge.i.i54:                                  ; preds = %_Z20polybench_alloc_datayi.exit51
  %44 = load ptr, ptr @stderr, align 8
  %45 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %44) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit55:                ; preds = %_Z20polybench_alloc_datayi.exit51
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  br label %.lr.ph.us.i

.lr.ph.us.i:                                      ; preds = %._crit_edge.us.i, %_Z20polybench_alloc_datayi.exit55
  %indvars.iv30.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit55 ], [ %indvars.iv.next31.i, %._crit_edge.us.i ]
  %46 = trunc nuw nsw i64 %indvars.iv30.i to i32
  %47 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv30.i
  %48 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv30.i
  %49 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv30.i
  %50 = uitofp nneg i32 %46 to float
  %51 = insertelement <4 x float> poison, float %50, i64 0
  %52 = shufflevector <4 x float> %51, <4 x float> poison, <4 x i32> zeroinitializer
  %53 = fadd nnan <4 x float> %52, <float -0.000000e+00, float 1.000000e+00, float 3.000000e+00, float 4.000000e+00>
  %54 = fmul nnan <4 x float> %53, splat (float f0x39800000)
  %55 = extractelement <4 x float> %54, i64 0
  store float %55, ptr %47, align 4
  %56 = extractelement <4 x float> %54, i64 1
  store float %56, ptr %48, align 4
  %57 = extractelement <4 x float> %54, i64 2
  store float %57, ptr %49, align 4
  %58 = getelementptr [4 x i8], ptr %42, i64 %indvars.iv30.i
  %59 = extractelement <4 x float> %54, i64 3
  store float %59, ptr %58, align 4
  %60 = getelementptr [16384 x i8], ptr %12, i64 %indvars.iv30.i
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.lr.ph.us.i
  %index = phi i64 [ 0, %.lr.ph.us.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.lr.ph.us.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %61 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %62 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %63 = fmul nnan <4 x float> %52, %61
  %64 = fmul nnan <4 x float> %52, %62
  %65 = fmul nnan <4 x float> %63, splat (float f0x39800000)
  %66 = fmul nnan <4 x float> %64, splat (float f0x39800000)
  %67 = getelementptr [4 x i8], ptr %60, i64 %index
  %68 = getelementptr i8, ptr %67, i64 16
  store <4 x float> %65, ptr %67, align 4
  store <4 x float> %66, ptr %68, align 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %69 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %70 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %71 = fmul nnan <4 x float> %52, %69
  %72 = fmul nnan <4 x float> %52, %70
  %73 = fmul nnan <4 x float> %71, splat (float f0x39800000)
  %74 = fmul nnan <4 x float> %72, splat (float f0x39800000)
  %75 = getelementptr [4 x i8], ptr %60, i64 %index
  %76 = getelementptr i8, ptr %75, i64 32
  %77 = getelementptr i8, ptr %75, i64 48
  store <4 x float> %73, ptr %76, align 4
  store <4 x float> %74, ptr %77, align 4
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %78 = icmp eq i64 %index.next.1, 4096
  br i1 %78, label %._crit_edge.us.i, label %vector.body, !llvm.loop !9

._crit_edge.us.i:                                 ; preds = %vector.body
  %indvars.iv.next31.i = add nuw nsw i64 %indvars.iv30.i, 1
  %exitcond34.not.i = icmp eq i64 %indvars.iv.next31.i, 4096
  br i1 %exitcond34.not.i, label %_Z10init_arrayiPA4096_fPfS1_S1_S1_.exit, label %.lr.ph.us.i

_Z10init_arrayiPA4096_fPfS1_S1_S1_.exit:          ; preds = %._crit_edge.us.i
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %79 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %3, i32 noundef 0) #5
  %80 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %3) #5
  %81 = call i32 @cudaSetDevice(i32 noundef 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  call void @_Z7mvtCudaiPA4096_fPfS1_S1_S1_S1_S1_(i32 noundef 4096, ptr noundef nonnull %12, ptr noundef nonnull %17, ptr noundef nonnull %22, ptr noundef nonnull %37, ptr noundef nonnull %42, ptr noundef %27, ptr noundef %32) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %82 = call i32 @gettimeofday(ptr noundef nonnull %2, ptr noundef null) #14
  %.not.i.i56 = icmp eq i32 %82, 0
  br i1 %.not.i.i56, label %_Z21polybench_timer_startv.exit, label %83

83:                                               ; preds = %_Z10init_arrayiPA4096_fPfS1_S1_S1_.exit
  %84 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %82) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiPA4096_fPfS1_S1_S1_.exit, %83
  %85 = load i64, ptr %2, align 8
  %86 = sitofp i64 %85 to double
  %87 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %88 = load i64, ptr %87, align 8
  %89 = sitofp i64 %88 to double
  %90 = fmul nnan double %89, f0x3EB0C6F7A0B5ED8D
  %91 = fadd double %90, %86
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  store double %91, ptr @polybench_t_start, align 8
  br label %.preheader32.i

.preheader32.i:                                   ; preds = %108, %_Z21polybench_timer_startv.exit
  %indvars.iv40.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next41.i, %108 ]
  %92 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv40.i
  %93 = getelementptr [16384 x i8], ptr %12, i64 %indvars.iv40.i
  %.promoted.i = load float, ptr %92, align 4
  br label %94

94:                                               ; preds = %94, %.preheader32.i
  %indvars.iv.i57 = phi i64 [ 0, %.preheader32.i ], [ %indvars.iv.next.i58.1, %94 ]
  %95 = phi float [ %.promoted.i, %.preheader32.i ], [ %107, %94 ]
  %96 = getelementptr [4 x i8], ptr %93, i64 %indvars.iv.i57
  %97 = load float, ptr %96, align 4
  %98 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv.i57
  %99 = load float, ptr %98, align 4
  %100 = fmul float %97, %99
  %101 = fadd float %95, %100
  store float %101, ptr %92, align 4
  %indvars.iv.next.i58 = or disjoint i64 %indvars.iv.i57, 1
  %102 = getelementptr [4 x i8], ptr %93, i64 %indvars.iv.next.i58
  %103 = load float, ptr %102, align 4
  %104 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv.next.i58
  %105 = load float, ptr %104, align 4
  %106 = fmul float %103, %105
  %107 = fadd float %101, %106
  store float %107, ptr %92, align 4
  %indvars.iv.next.i58.1 = add nuw nsw i64 %indvars.iv.i57, 2
  %exitcond.not.i59.1 = icmp eq i64 %indvars.iv.next.i58.1, 4096
  br i1 %exitcond.not.i59.1, label %108, label %94

108:                                              ; preds = %94
  %indvars.iv.next41.i = add nuw nsw i64 %indvars.iv40.i, 1
  %exitcond43.not.i = icmp eq i64 %indvars.iv.next41.i, 4096
  br i1 %exitcond43.not.i, label %.preheader.i, label %.preheader32.i

.preheader.i:                                     ; preds = %108, %._crit_edge.i
  %indvars.iv49.i = phi i64 [ %indvars.iv.next50.i, %._crit_edge.i ], [ 0, %108 ]
  %109 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv49.i
  %invariant.gep.i = getelementptr [4 x i8], ptr %12, i64 %indvars.iv49.i
  %.promoted36.i = load float, ptr %109, align 4
  br label %110

110:                                              ; preds = %110, %.preheader.i
  %indvars.iv44.i = phi i64 [ 0, %.preheader.i ], [ %indvars.iv.next45.i.1, %110 ]
  %111 = phi float [ %.promoted36.i, %.preheader.i ], [ %121, %110 ]
  %gep.i = getelementptr [16384 x i8], ptr %invariant.gep.i, i64 %indvars.iv44.i
  %112 = load float, ptr %gep.i, align 4
  %113 = getelementptr [4 x i8], ptr %42, i64 %indvars.iv44.i
  %114 = load float, ptr %113, align 4
  %115 = fmul float %112, %114
  %116 = fadd float %111, %115
  store float %116, ptr %109, align 4
  %indvars.iv.next45.i = or disjoint i64 %indvars.iv44.i, 1
  %gep.i.1 = getelementptr [16384 x i8], ptr %invariant.gep.i, i64 %indvars.iv.next45.i
  %117 = load float, ptr %gep.i.1, align 4
  %118 = getelementptr [4 x i8], ptr %42, i64 %indvars.iv.next45.i
  %119 = load float, ptr %118, align 4
  %120 = fmul float %117, %119
  %121 = fadd float %116, %120
  store float %121, ptr %109, align 4
  %indvars.iv.next45.i.1 = add nuw nsw i64 %indvars.iv44.i, 2
  %exitcond48.not.i.1 = icmp eq i64 %indvars.iv.next45.i.1, 4096
  br i1 %exitcond48.not.i.1, label %._crit_edge.i, label %110

._crit_edge.i:                                    ; preds = %110
  %indvars.iv.next50.i = add nuw nsw i64 %indvars.iv49.i, 1
  %exitcond53.not.i = icmp eq i64 %indvars.iv.next50.i, 4096
  br i1 %exitcond53.not.i, label %_Z6runMvtiPA4096_fPfS1_S1_S1_.exit, label %.preheader.i

_Z6runMvtiPA4096_fPfS1_S1_S1_.exit:               ; preds = %._crit_edge.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %122 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #14
  %.not.i.i60 = icmp eq i32 %122, 0
  br i1 %.not.i.i60, label %_Z20polybench_timer_stopv.exit, label %123

123:                                              ; preds = %_Z6runMvtiPA4096_fPfS1_S1_S1_.exit
  %124 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %122) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z6runMvtiPA4096_fPfS1_S1_S1_.exit, %123
  %125 = load i64, ptr %1, align 8
  %126 = sitofp i64 %125 to double
  %127 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %128 = load i64, ptr %127, align 8
  %129 = sitofp i64 %128 to double
  %130 = fmul nnan double %129, f0x3EB0C6F7A0B5ED8D
  %131 = fadd double %130, %126
  call void @llvm.lifetime.end.p0(ptr nonnull %1)
  store double %131, ptr @polybench_t_end, align 8
  %132 = load double, ptr @polybench_t_start, align 8
  %133 = fsub double %131, %132
  %134 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %133) #5
  call void @_Z14compareResultsiPfS_S_S_(i32 noundef 4096, ptr noundef nonnull %17, ptr noundef %27, ptr noundef nonnull %22, ptr noundef %32) #5
  call void @free(ptr noundef nonnull %12) #14
  call void @free(ptr noundef %17) #14
  call void @free(ptr noundef nonnull %22) #14
  call void @free(ptr noundef %27) #14
  call void @free(ptr noundef %32) #14
  call void @free(ptr noundef %37) #14
  call void @free(ptr noundef nonnull %42) #14
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
!7 = !{ptr @_Z26__device_stub__mvt_kernel1iPfS_S_}
!8 = !{ptr @_Z26__device_stub__mvt_kernel2iPfS_S_}
!9 = distinct !{!9, !2, !3}
