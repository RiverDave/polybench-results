; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GESUMMV/gesummv.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GESUMMV/gesummv.cu"
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
define dso_local void @_Z7gesummviffPA4096_fS0_PfS1_S1_(i32 noundef %0, float noundef %1, float noundef %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef captures(none) %7) local_unnamed_addr #1 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph.us.preheader, label %._crit_edge41

.lr.ph.us.preheader:                              ; preds = %8
  %wide.trip.count46 = zext nneg i32 %0 to i64
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge.us
  %indvars.iv43 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next44, %._crit_edge.us ]
  %10 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv43
  store float 0.000000e+00, ptr %10, align 4
  %11 = getelementptr [4 x i8], ptr %7, i64 %indvars.iv43
  store float 0.000000e+00, ptr %11, align 4
  %12 = getelementptr [16384 x i8], ptr %3, i64 %indvars.iv43
  %13 = getelementptr [16384 x i8], ptr %4, i64 %indvars.iv43
  br label %14

14:                                               ; preds = %.lr.ph.us, %14
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next, %14 ]
  %15 = getelementptr [4 x i8], ptr %12, i64 %indvars.iv
  %16 = load float, ptr %15, align 4
  %17 = getelementptr [4 x i8], ptr %6, i64 %indvars.iv
  %18 = load float, ptr %17, align 4
  %19 = fmul float %16, %18
  %20 = load float, ptr %10, align 4
  %21 = fadd float %19, %20
  store float %21, ptr %10, align 4
  %22 = getelementptr [4 x i8], ptr %13, i64 %indvars.iv
  %23 = load float, ptr %22, align 4
  %24 = load float, ptr %17, align 4
  %25 = fmul float %23, %24
  %26 = load float, ptr %11, align 4
  %27 = fadd float %25, %26
  store float %27, ptr %11, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count46
  br i1 %exitcond.not, label %._crit_edge.us, label %14

._crit_edge.us:                                   ; preds = %14
  %28 = load float, ptr %10, align 4
  %29 = fmul float %1, %28
  %30 = fmul float %2, %27
  %31 = fadd float %29, %30
  store float %31, ptr %11, align 4
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond47.not = icmp eq i64 %indvars.iv.next44, %wide.trip.count46
  br i1 %exitcond47.not, label %._crit_edge41, label %.lr.ph.us

._crit_edge41:                                    ; preds = %._crit_edge.us, %8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: write)
define dso_local void @_Z4initiPfS_PA4096_fS1_S_(i32 noundef %0, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %1, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %2, ptr nofree noundef writeonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4, ptr nofree noundef writeonly captures(none) %5) local_unnamed_addr #2 {
  store float 4.353200e+04, ptr %1, align 4
  store float 1.231300e+04, ptr %2, align 4
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph26, label %._crit_edge27

.lr.ph26:                                         ; preds = %6
  %8 = ptrtoaddr ptr %4 to i64
  %9 = ptrtoaddr ptr %3 to i64
  %10 = uitofp nneg i32 %0 to float
  %wide.trip.count32 = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  %11 = sub i64 %9, %8
  %diff.check = icmp ugt i64 %11, -16
  %or.cond = or i1 %min.iters.check, %diff.check
  %n.vec = and i64 %wide.trip.count32, 2147483644
  %broadcast.splatinsert34 = insertelement <4 x float> poison, float %10, i64 0
  %broadcast.splat35 = shufflevector <4 x float> %broadcast.splatinsert34, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count32
  %xtraiter = and i64 %wide.trip.count32, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %12 = add nsw i64 %wide.trip.count32, -1
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %._crit_edge.us, %.lr.ph26
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge.us ], [ 0, %.lr.ph26 ]
  %13 = trunc nuw nsw i64 %indvars.iv29 to i32
  %14 = uitofp nneg i32 %13 to float
  %15 = fmul nnan float %14, f0x39800000
  %16 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv29
  store float %15, ptr %16, align 4
  %17 = getelementptr [16384 x i8], ptr %3, i64 %indvars.iv29
  %18 = getelementptr [16384 x i8], ptr %4, i64 %indvars.iv29
  br i1 %or.cond, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.us
  %broadcast.splatinsert = insertelement <4 x float> poison, float %14, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %19 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %20 = fmul nnan <4 x float> %broadcast.splat, %19
  %21 = fmul nnan <4 x float> %20, splat (float f0x39800000)
  %22 = getelementptr [4 x i8], ptr %17, i64 %index
  store <4 x float> %21, ptr %22, align 4
  %23 = fdiv <4 x float> %20, %broadcast.splat35
  %24 = getelementptr [4 x i8], ptr %18, i64 %index
  store <4 x float> %23, ptr %24, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %25 = icmp eq i64 %index.next, %n.vec
  br i1 %25, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.lr.ph.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.lr.ph.us ], [ %n.vec, %middle.block ]
  br i1 %lcmp.mod.not, label %scalar.ph.prol.loopexit, label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.preheader
  %26 = trunc nuw nsw i64 %indvars.iv.ph to i32
  %27 = uitofp nneg i32 %26 to float
  %28 = fmul nnan float %14, %27
  %29 = fmul nnan float %28, f0x39800000
  %30 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv.ph
  store float %29, ptr %30, align 4
  %31 = fdiv float %28, %10
  %32 = getelementptr [4 x i8], ptr %18, i64 %indvars.iv.ph
  store float %31, ptr %32, align 4
  %indvars.iv.next.prol = or disjoint i64 %indvars.iv.ph, 1
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol, %scalar.ph.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph.preheader ], [ %indvars.iv.next.prol, %scalar.ph.prol ]
  %33 = icmp eq i64 %indvars.iv.ph, %12
  br i1 %33, label %._crit_edge.us, label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.prol.loopexit, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %scalar.ph ], [ %indvars.iv.unr, %scalar.ph.prol.loopexit ]
  %34 = trunc nuw nsw i64 %indvars.iv to i32
  %35 = uitofp nneg i32 %34 to float
  %36 = fmul nnan float %14, %35
  %37 = fmul nnan float %36, f0x39800000
  %38 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv
  store float %37, ptr %38, align 4
  %39 = fdiv float %36, %10
  %40 = getelementptr [4 x i8], ptr %18, i64 %indvars.iv
  store float %39, ptr %40, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = trunc nuw nsw i64 %indvars.iv.next to i32
  %42 = uitofp nneg i32 %41 to float
  %43 = fmul nnan float %14, %42
  %44 = fmul nnan float %43, f0x39800000
  %45 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv.next
  store float %44, ptr %45, align 4
  %46 = fdiv float %43, %10
  %47 = getelementptr [4 x i8], ptr %18, i64 %indvars.iv.next
  store float %46, ptr %47, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count32
  br i1 %exitcond.not.1, label %._crit_edge.us, label %scalar.ph, !llvm.loop !4

._crit_edge.us:                                   ; preds = %scalar.ph.prol.loopexit, %scalar.ph, %middle.block
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond33.not = icmp eq i64 %indvars.iv.next30, %wide.trip.count32
  br i1 %exitcond33.not, label %._crit_edge27, label %.lr.ph.us

._crit_edge27:                                    ; preds = %._crit_edge.us, %6
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiPfS_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2) local_unnamed_addr #4 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %wide.trip.count = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  br i1 %min.iters.check, label %.lr.ph.preheader13, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.preheader
  %n.vec = and i64 %wide.trip.count, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %37, %vector.body ]
  %5 = getelementptr [4 x i8], ptr %1, i64 %index
  %wide.load = load <4 x float>, ptr %5, align 4
  %6 = fpext <4 x float> %wide.load to <4 x double>
  %7 = getelementptr [4 x i8], ptr %2, i64 %index
  %wide.load12 = load <4 x float>, ptr %7, align 4
  %8 = fpext <4 x float> %wide.load12 to <4 x double>
  %9 = fcmp olt <4 x double> %6, splat (double f0xB690000000000000)
  %10 = fneg <4 x float> %wide.load
  %11 = select <4 x i1> %9, <4 x float> %10, <4 x float> %wide.load
  %12 = fpext <4 x float> %11 to <4 x double>
  %13 = fcmp uge <4 x double> %12, splat (double 1.000000e-02)
  %14 = fcmp olt <4 x double> %8, splat (double f0xB690000000000000)
  %15 = fneg <4 x float> %wide.load12
  %16 = select <4 x i1> %14, <4 x float> %15, <4 x float> %wide.load12
  %17 = fpext <4 x float> %16 to <4 x double>
  %18 = fcmp uge <4 x double> %17, splat (double 1.000000e-02)
  %19 = select <4 x i1> %13, <4 x i1> splat (i1 true), <4 x i1> %18
  %20 = fsub <4 x double> %6, %8
  %21 = fptrunc <4 x double> %20 to <4 x float>
  %22 = fcmp olt <4 x double> %20, splat (double f0xB690000000000000)
  %23 = fneg <4 x float> %21
  %24 = select <4 x i1> %22, <4 x float> %23, <4 x float> %21
  %25 = fadd <4 x double> %6, splat (double f0x3E45798EE0000000)
  %26 = fptrunc <4 x double> %25 to <4 x float>
  %27 = fcmp olt <4 x double> %25, splat (double f0xB690000000000000)
  %28 = fneg <4 x float> %26
  %29 = select <4 x i1> %27, <4 x float> %28, <4 x float> %26
  %30 = fdiv <4 x float> %24, %29
  %31 = fcmp olt <4 x float> %30, zeroinitializer
  %32 = fneg <4 x float> %30
  %33 = select <4 x i1> %31, <4 x float> %32, <4 x float> %30
  %34 = fmul <4 x float> %33, splat (float 1.000000e+02)
  %35 = fpext <4 x float> %34 to <4 x double>
  %36 = fcmp ogt <4 x double> %35, splat (double 5.000000e-02)
  %narrow = select <4 x i1> %19, <4 x i1> %36, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %37 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %38 = icmp eq i64 %index.next, %n.vec
  br i1 %38, label %middle.block, label %vector.body, !llvm.loop !5

middle.block:                                     ; preds = %vector.body
  %39 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %37)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph.preheader13

.lr.ph.preheader13:                               ; preds = %.lr.ph.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %middle.block ]
  %.010.ph = phi i32 [ 0, %.lr.ph.preheader ], [ %39, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader13, %_Z11percentDiffdd.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit ], [ %indvars.iv.ph, %.lr.ph.preheader13 ]
  %.010 = phi i32 [ %.1, %_Z11percentDiffdd.exit ], [ %.010.ph, %.lr.ph.preheader13 ]
  %40 = getelementptr [4 x i8], ptr %1, i64 %indvars.iv
  %41 = load float, ptr %40, align 4
  %42 = fpext float %41 to double
  %43 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv
  %44 = load float, ptr %43, align 4
  %45 = fpext float %44 to double
  %46 = fcmp olt double %42, f0xB690000000000000
  %47 = fneg float %41
  %common.ret.op.i.i = select i1 %46, float %47, float %41
  %48 = fpext float %common.ret.op.i.i to double
  %49 = fcmp olt double %48, 1.000000e-02
  br i1 %49, label %50, label %.critedge.i

50:                                               ; preds = %.lr.ph
  %51 = fcmp olt double %45, f0xB690000000000000
  %52 = fneg float %44
  %common.ret.op.i7.i = select i1 %51, float %52, float %44
  %53 = fpext float %common.ret.op.i7.i to double
  %54 = fcmp olt double %53, 1.000000e-02
  br i1 %54, label %_Z11percentDiffdd.exit, label %.critedge.i

.critedge.i:                                      ; preds = %50, %.lr.ph
  %55 = insertelement <2 x double> poison, double %42, i64 0
  %56 = shufflevector <2 x double> %55, <2 x double> poison, <2 x i32> zeroinitializer
  %57 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %45, i64 0
  %58 = fsub <2 x double> %56, %57
  %59 = fptrunc <2 x double> %58 to <2 x float>
  %60 = fcmp olt <2 x double> %58, splat (double f0xB690000000000000)
  %61 = fneg <2 x float> %59
  %62 = select <2 x i1> %60, <2 x float> %61, <2 x float> %59
  %63 = extractelement <2 x float> %62, i64 0
  %64 = extractelement <2 x float> %62, i64 1
  %65 = fdiv float %63, %64
  %66 = fcmp olt float %65, 0.000000e+00
  %67 = fneg float %65
  %common.ret.op.i10.i = select i1 %66, float %67, float %65
  %68 = fmul float %common.ret.op.i10.i, 1.000000e+02
  %69 = fpext float %68 to double
  %70 = fcmp ogt double %69, 5.000000e-02
  %71 = zext i1 %70 to i32
  br label %_Z11percentDiffdd.exit

_Z11percentDiffdd.exit:                           ; preds = %50, %.critedge.i
  %common.ret.op.i = phi i32 [ %71, %.critedge.i ], [ 0, %50 ]
  %.1 = add nuw nsw i32 %common.ret.op.i, %.010
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !llvm.loop !6

._crit_edge:                                      ; preds = %_Z11percentDiffdd.exit, %middle.block, %3
  %.0.lcssa = phi i32 [ 0, %3 ], [ %39, %middle.block ], [ %.1, %_Z11percentDiffdd.exit ]
  %72 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %.0.lcssa) #5
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

define dso_local void @_Z29__device_stub__gesummv_kerneliffPfS_S_S_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) #6 {
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  store i32 %0, ptr %9, align 4
  store float %1, ptr %10, align 4
  store float %2, ptr %11, align 4
  store ptr %3, ptr %12, align 8
  store ptr %4, ptr %13, align 8
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
  %32 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gesummv_kerneliffPfS_S_S_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %17, i64 noundef %30, ptr noundef %31)
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
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #13
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
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #13
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

define dso_local void @_Z11gesummvCudaiffPA4096_fS0_PfS1_S1_S1_(i32 noundef %0, float noundef %1, float noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8) local_unnamed_addr #6 {
  %10 = alloca %struct.timeval, align 8
  %11 = alloca i32, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
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
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = call i32 @cudaMalloc(ptr noundef nonnull %25, i64 noundef 67108864) #5
  %31 = call i32 @cudaMalloc(ptr noundef nonnull %26, i64 noundef 67108864) #5
  %32 = call i32 @cudaMalloc(ptr noundef nonnull %27, i64 noundef 16384) #5
  %33 = call i32 @cudaMalloc(ptr noundef nonnull %28, i64 noundef 16384) #5
  %34 = call i32 @cudaMalloc(ptr noundef nonnull %29, i64 noundef 16384) #5
  %35 = load ptr, ptr %25, align 8
  %36 = call i32 @cudaMemcpy(ptr noundef %35, ptr noundef %3, i64 noundef 67108864, i32 noundef 1) #5
  %37 = load ptr, ptr %26, align 8
  %38 = call i32 @cudaMemcpy(ptr noundef %37, ptr noundef %4, i64 noundef 67108864, i32 noundef 1) #5
  %39 = load ptr, ptr %27, align 8
  %40 = call i32 @cudaMemcpy(ptr noundef %39, ptr noundef %6, i64 noundef 16384, i32 noundef 1) #5
  %41 = load ptr, ptr %28, align 8
  %42 = call i32 @cudaMemcpy(ptr noundef %41, ptr noundef %7, i64 noundef 16384, i32 noundef 1) #5
  %43 = load ptr, ptr %29, align 8
  %44 = call i32 @cudaMemcpy(ptr noundef %43, ptr noundef %5, i64 noundef 16384, i32 noundef 1) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %24)
  %45 = call i32 @gettimeofday(ptr noundef nonnull %24, ptr noundef null) #13
  %.not.i.i = icmp eq i32 %45, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %46

46:                                               ; preds = %9
  %47 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %45) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %9, %46
  %48 = load i64, ptr %24, align 8
  %49 = sitofp i64 %48 to double
  %50 = getelementptr inbounds nuw i8, ptr %24, i64 8
  %51 = load i64, ptr %50, align 8
  %52 = sitofp i64 %51 to double
  %53 = fmul nnan double %52, f0x3EB0C6F7A0B5ED8D
  %54 = fadd double %53, %49
  call void @llvm.lifetime.end.p0(ptr nonnull %24)
  store double %54, ptr @polybench_t_start, align 8
  %55 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 16, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %55, 0
  br i1 %.not, label %56, label %73

56:                                               ; preds = %_Z21polybench_timer_startv.exit
  %57 = load ptr, ptr %25, align 8
  %58 = load ptr, ptr %26, align 8
  %59 = load ptr, ptr %29, align 8
  %60 = load ptr, ptr %27, align 8
  %61 = load ptr, ptr %28, align 8
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
  store float %1, ptr %12, align 4
  store float %2, ptr %13, align 4
  store ptr %57, ptr %14, align 8
  store ptr %58, ptr %15, align 8
  store ptr %59, ptr %16, align 8
  store ptr %60, ptr %17, align 8
  store ptr %61, ptr %18, align 8
  store ptr %11, ptr %19, align 16
  %62 = getelementptr inbounds nuw i8, ptr %19, i64 8
  store ptr %12, ptr %62, align 8
  %63 = getelementptr inbounds nuw i8, ptr %19, i64 16
  store ptr %13, ptr %63, align 16
  %64 = getelementptr inbounds nuw i8, ptr %19, i64 24
  store ptr %14, ptr %64, align 8
  %65 = getelementptr inbounds nuw i8, ptr %19, i64 32
  store ptr %15, ptr %65, align 16
  %66 = getelementptr inbounds nuw i8, ptr %19, i64 40
  store ptr %16, ptr %66, align 8
  %67 = getelementptr inbounds nuw i8, ptr %19, i64 48
  store ptr %17, ptr %67, align 16
  %68 = getelementptr inbounds nuw i8, ptr %19, i64 56
  store ptr %18, ptr %68, align 8
  %69 = call i32 @__cudaPopCallConfiguration(ptr nonnull %20, ptr nonnull %21, ptr nonnull %22, ptr nonnull %23), !inline_history !7
  %70 = load i64, ptr %22, align 8
  %71 = load ptr, ptr %23, align 8
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
  %72 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gesummv_kerneliffPfS_S_S_S_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %19, i64 noundef %70, ptr noundef %71), !inline_history !7
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
  br label %73

73:                                               ; preds = %_Z21polybench_timer_startv.exit, %56
  %74 = call i32 @cudaThreadSynchronize() #5
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  %75 = call i32 @gettimeofday(ptr noundef nonnull %10, ptr noundef null) #13
  %.not.i.i14 = icmp eq i32 %75, 0
  br i1 %.not.i.i14, label %_Z20polybench_timer_stopv.exit, label %76

76:                                               ; preds = %73
  %77 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %75) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %73, %76
  %78 = load i64, ptr %10, align 8
  %79 = sitofp i64 %78 to double
  %80 = getelementptr inbounds nuw i8, ptr %10, i64 8
  %81 = load i64, ptr %80, align 8
  %82 = sitofp i64 %81 to double
  %83 = fmul nnan double %82, f0x3EB0C6F7A0B5ED8D
  %84 = fadd double %83, %79
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  store double %84, ptr @polybench_t_end, align 8
  %85 = load double, ptr @polybench_t_start, align 8
  %86 = fsub double %84, %85
  %87 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %86) #5
  %88 = load ptr, ptr %28, align 8
  %89 = call i32 @cudaMemcpy(ptr noundef %8, ptr noundef %88, i64 noundef 16384, i32 noundef 2) #5
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
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  store ptr null, ptr %11, align 8
  %12 = call i32 @posix_memalign(ptr noundef nonnull %11, i64 noundef 32, i64 noundef 67108864) #13
  %13 = load ptr, ptr %11, align 8
  %14 = ptrtoaddr ptr %13 to i64
  %.not.i.i = icmp eq ptr %13, null
  %15 = icmp ne i32 %12, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %15
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %16 = load ptr, ptr @stderr, align 8
  %17 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %16) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  store ptr null, ptr %10, align 8
  %18 = call i32 @posix_memalign(ptr noundef nonnull %10, i64 noundef 32, i64 noundef 67108864) #13
  %19 = load ptr, ptr %10, align 8
  %20 = ptrtoaddr ptr %19 to i64
  %.not.i.i26 = icmp eq ptr %19, null
  %21 = icmp ne i32 %18, 0
  %or.cond.i.i27 = select i1 %.not.i.i26, i1 true, i1 %21
  br i1 %or.cond.i.i27, label %.critedge.i.i28, label %_Z20polybench_alloc_datayi.exit29

.critedge.i.i28:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %22 = load ptr, ptr @stderr, align 8
  %23 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %22) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit29:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  store ptr null, ptr %9, align 8
  %24 = call i32 @posix_memalign(ptr noundef nonnull %9, i64 noundef 32, i64 noundef 16384) #13
  %25 = load ptr, ptr %9, align 8
  %.not.i.i30 = icmp eq ptr %25, null
  %26 = icmp ne i32 %24, 0
  %or.cond.i.i31 = select i1 %.not.i.i30, i1 true, i1 %26
  br i1 %or.cond.i.i31, label %.critedge.i.i32, label %_Z20polybench_alloc_datayi.exit33

.critedge.i.i32:                                  ; preds = %_Z20polybench_alloc_datayi.exit29
  %27 = load ptr, ptr @stderr, align 8
  %28 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %27) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit33:                ; preds = %_Z20polybench_alloc_datayi.exit29
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %29 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 16384) #13
  %30 = load ptr, ptr %8, align 8
  %.not.i.i34 = icmp eq ptr %30, null
  %31 = icmp ne i32 %29, 0
  %or.cond.i.i35 = select i1 %.not.i.i34, i1 true, i1 %31
  br i1 %or.cond.i.i35, label %.critedge.i.i36, label %_Z20polybench_alloc_datayi.exit37

.critedge.i.i36:                                  ; preds = %_Z20polybench_alloc_datayi.exit33
  %32 = load ptr, ptr @stderr, align 8
  %33 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %32) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit37:                ; preds = %_Z20polybench_alloc_datayi.exit33
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %34 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 16384) #13
  %35 = load ptr, ptr %7, align 8
  %.not.i.i38 = icmp eq ptr %35, null
  %36 = icmp ne i32 %34, 0
  %or.cond.i.i39 = select i1 %.not.i.i38, i1 true, i1 %36
  br i1 %or.cond.i.i39, label %.critedge.i.i40, label %_Z20polybench_alloc_datayi.exit41

.critedge.i.i40:                                  ; preds = %_Z20polybench_alloc_datayi.exit37
  %37 = load ptr, ptr @stderr, align 8
  %38 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %37) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit41:                ; preds = %_Z20polybench_alloc_datayi.exit37
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %39 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 16384) #13
  %40 = load ptr, ptr %6, align 8
  %.not.i.i42 = icmp eq ptr %40, null
  %41 = icmp ne i32 %39, 0
  %or.cond.i.i43 = select i1 %.not.i.i42, i1 true, i1 %41
  br i1 %or.cond.i.i43, label %.critedge.i.i44, label %_Z20polybench_alloc_datayi.exit45

.critedge.i.i44:                                  ; preds = %_Z20polybench_alloc_datayi.exit41
  %42 = load ptr, ptr @stderr, align 8
  %43 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %42) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit45:                ; preds = %_Z20polybench_alloc_datayi.exit41
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  %44 = sub i64 %14, %20
  %diff.check = icmp ugt i64 %44, -32
  br label %.lr.ph.us.i

.lr.ph.us.i:                                      ; preds = %._crit_edge.us.i, %_Z20polybench_alloc_datayi.exit45
  %indvars.iv29.i = phi i64 [ %indvars.iv.next30.i, %._crit_edge.us.i ], [ 0, %_Z20polybench_alloc_datayi.exit45 ]
  %45 = trunc nuw nsw i64 %indvars.iv29.i to i32
  %46 = uitofp nneg i32 %45 to float
  %47 = fmul nnan float %46, f0x39800000
  %48 = getelementptr [4 x i8], ptr %30, i64 %indvars.iv29.i
  store float %47, ptr %48, align 4
  %49 = getelementptr [16384 x i8], ptr %13, i64 %indvars.iv29.i
  %50 = getelementptr [16384 x i8], ptr %19, i64 %indvars.iv29.i
  br i1 %diff.check, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.us.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %46, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %51 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %52 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %53 = fmul nnan <4 x float> %broadcast.splat, %51
  %54 = fmul nnan <4 x float> %broadcast.splat, %52
  %55 = fmul nnan <4 x float> %53, splat (float f0x39800000)
  %56 = fmul nnan <4 x float> %54, splat (float f0x39800000)
  %57 = getelementptr [4 x i8], ptr %49, i64 %index
  %58 = getelementptr i8, ptr %57, i64 16
  store <4 x float> %55, ptr %57, align 4
  store <4 x float> %56, ptr %58, align 4
  %59 = getelementptr [4 x i8], ptr %50, i64 %index
  %60 = getelementptr i8, ptr %59, i64 16
  store <4 x float> %55, ptr %59, align 4
  store <4 x float> %56, ptr %60, align 4
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %61 = icmp eq i64 %index.next, 4096
  br i1 %61, label %._crit_edge.us.i, label %vector.body, !llvm.loop !8

scalar.ph:                                        ; preds = %.lr.ph.us.i, %scalar.ph
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i.1, %scalar.ph ], [ 0, %.lr.ph.us.i ]
  %62 = trunc nuw nsw i64 %indvars.iv.i to i32
  %63 = uitofp nneg i32 %62 to float
  %64 = fmul nnan float %46, %63
  %65 = fmul nnan float %64, f0x39800000
  %66 = getelementptr [4 x i8], ptr %49, i64 %indvars.iv.i
  store float %65, ptr %66, align 4
  %67 = getelementptr [4 x i8], ptr %50, i64 %indvars.iv.i
  store float %65, ptr %67, align 4
  %indvars.iv.next.i = or disjoint i64 %indvars.iv.i, 1
  %68 = trunc nuw nsw i64 %indvars.iv.next.i to i32
  %69 = uitofp nneg i32 %68 to float
  %70 = fmul nnan float %46, %69
  %71 = fmul nnan float %70, f0x39800000
  %72 = getelementptr [4 x i8], ptr %49, i64 %indvars.iv.next.i
  store float %71, ptr %72, align 4
  %73 = getelementptr [4 x i8], ptr %50, i64 %indvars.iv.next.i
  store float %71, ptr %73, align 4
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %exitcond.not.i.1 = icmp eq i64 %indvars.iv.next.i.1, 4096
  br i1 %exitcond.not.i.1, label %._crit_edge.us.i, label %scalar.ph, !llvm.loop !9

._crit_edge.us.i:                                 ; preds = %vector.body, %scalar.ph
  %indvars.iv.next30.i = add nuw nsw i64 %indvars.iv29.i, 1
  %exitcond33.not.i = icmp eq i64 %indvars.iv.next30.i, 4096
  br i1 %exitcond33.not.i, label %_Z4initiPfS_PA4096_fS1_S_.exit, label %.lr.ph.us.i

_Z4initiPfS_PA4096_fS1_S_.exit:                   ; preds = %._crit_edge.us.i
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  %74 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %5, i32 noundef 0) #5
  %75 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %5) #5
  %76 = call i32 @cudaSetDevice(i32 noundef 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @_Z11gesummvCudaiffPA4096_fS0_PfS1_S1_S1_(i32 noundef 4096, float noundef 4.353200e+04, float noundef 1.231300e+04, ptr noundef nonnull %13, ptr noundef nonnull %19, ptr noundef %25, ptr noundef nonnull %30, ptr noundef %35, ptr noundef %40) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %77 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #13
  %.not.i.i46 = icmp eq i32 %77, 0
  br i1 %.not.i.i46, label %_Z21polybench_timer_startv.exit, label %78

78:                                               ; preds = %_Z4initiPfS_PA4096_fS1_S_.exit
  %79 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %77) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z4initiPfS_PA4096_fS1_S_.exit, %78
  %80 = load i64, ptr %4, align 8
  %81 = sitofp i64 %80 to double
  %82 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %83 = load i64, ptr %82, align 8
  %84 = sitofp i64 %83 to double
  %85 = fmul nnan double %84, f0x3EB0C6F7A0B5ED8D
  %86 = fadd double %85, %81
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %86, ptr @polybench_t_start, align 8
  br label %.lr.ph.us.i47

.lr.ph.us.i47:                                    ; preds = %._crit_edge.us.i51, %_Z21polybench_timer_startv.exit
  %indvars.iv43.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next44.i, %._crit_edge.us.i51 ]
  %87 = getelementptr [4 x i8], ptr %25, i64 %indvars.iv43.i
  store float 0.000000e+00, ptr %87, align 4
  %88 = getelementptr [4 x i8], ptr %35, i64 %indvars.iv43.i
  store float 0.000000e+00, ptr %88, align 4
  %89 = getelementptr [16384 x i8], ptr %13, i64 %indvars.iv43.i
  %90 = getelementptr [16384 x i8], ptr %19, i64 %indvars.iv43.i
  br label %91

91:                                               ; preds = %91, %.lr.ph.us.i47
  %indvars.iv.i48 = phi i64 [ 0, %.lr.ph.us.i47 ], [ %indvars.iv.next.i49, %91 ]
  %92 = getelementptr [4 x i8], ptr %89, i64 %indvars.iv.i48
  %93 = load float, ptr %92, align 4
  %94 = getelementptr [4 x i8], ptr %30, i64 %indvars.iv.i48
  %95 = load float, ptr %94, align 4
  %96 = fmul float %93, %95
  %97 = load float, ptr %87, align 4
  %98 = fadd float %96, %97
  store float %98, ptr %87, align 4
  %99 = getelementptr [4 x i8], ptr %90, i64 %indvars.iv.i48
  %100 = load float, ptr %99, align 4
  %101 = load float, ptr %94, align 4
  %102 = fmul float %100, %101
  %103 = load float, ptr %88, align 4
  %104 = fadd float %102, %103
  store float %104, ptr %88, align 4
  %indvars.iv.next.i49 = add nuw nsw i64 %indvars.iv.i48, 1
  %exitcond.not.i50 = icmp eq i64 %indvars.iv.next.i49, 4096
  br i1 %exitcond.not.i50, label %._crit_edge.us.i51, label %91

._crit_edge.us.i51:                               ; preds = %91
  %105 = load float, ptr %87, align 4
  %106 = fmul float %105, 4.353200e+04
  %107 = fmul float %104, 1.231300e+04
  %108 = fadd float %107, %106
  store float %108, ptr %88, align 4
  %indvars.iv.next44.i = add nuw nsw i64 %indvars.iv43.i, 1
  %exitcond47.not.i = icmp eq i64 %indvars.iv.next44.i, 4096
  br i1 %exitcond47.not.i, label %_Z7gesummviffPA4096_fS0_PfS1_S1_.exit, label %.lr.ph.us.i47

_Z7gesummviffPA4096_fS0_PfS1_S1_.exit:            ; preds = %._crit_edge.us.i51
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %109 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #13
  %.not.i.i52 = icmp eq i32 %109, 0
  br i1 %.not.i.i52, label %_Z20polybench_timer_stopv.exit, label %110

110:                                              ; preds = %_Z7gesummviffPA4096_fS0_PfS1_S1_.exit
  %111 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %109) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z7gesummviffPA4096_fS0_PfS1_S1_.exit, %110
  %112 = load i64, ptr %3, align 8
  %113 = sitofp i64 %112 to double
  %114 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %115 = load i64, ptr %114, align 8
  %116 = sitofp i64 %115 to double
  %117 = fmul nnan double %116, f0x3EB0C6F7A0B5ED8D
  %118 = fadd double %117, %113
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %118, ptr @polybench_t_end, align 8
  %119 = load double, ptr @polybench_t_start, align 8
  %120 = fsub double %118, %119
  %121 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %120) #5
  br label %vector.body69

vector.body69:                                    ; preds = %vector.body69, %_Z20polybench_timer_stopv.exit
  %index70 = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %index.next72, %vector.body69 ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %_Z20polybench_timer_stopv.exit ], [ %153, %vector.body69 ]
  %122 = getelementptr [4 x i8], ptr %35, i64 %index70
  %wide.load = load <4 x float>, ptr %122, align 4
  %123 = fpext <4 x float> %wide.load to <4 x double>
  %124 = getelementptr [4 x i8], ptr %40, i64 %index70
  %wide.load71 = load <4 x float>, ptr %124, align 4
  %125 = fpext <4 x float> %wide.load71 to <4 x double>
  %126 = fcmp olt <4 x double> %123, splat (double f0xB690000000000000)
  %127 = fneg <4 x float> %wide.load
  %128 = select <4 x i1> %126, <4 x float> %127, <4 x float> %wide.load
  %129 = fpext <4 x float> %128 to <4 x double>
  %130 = fcmp uge <4 x double> %129, splat (double 1.000000e-02)
  %131 = fcmp olt <4 x double> %125, splat (double f0xB690000000000000)
  %132 = fneg <4 x float> %wide.load71
  %133 = select <4 x i1> %131, <4 x float> %132, <4 x float> %wide.load71
  %134 = fpext <4 x float> %133 to <4 x double>
  %135 = fcmp uge <4 x double> %134, splat (double 1.000000e-02)
  %136 = fsub <4 x double> %123, %125
  %137 = fptrunc <4 x double> %136 to <4 x float>
  %138 = fcmp olt <4 x double> %136, splat (double f0xB690000000000000)
  %139 = fneg <4 x float> %137
  %140 = select <4 x i1> %138, <4 x float> %139, <4 x float> %137
  %141 = fadd <4 x double> %123, splat (double f0x3E45798EE0000000)
  %142 = fptrunc <4 x double> %141 to <4 x float>
  %143 = fcmp olt <4 x double> %141, splat (double f0xB690000000000000)
  %144 = fneg <4 x float> %142
  %145 = select <4 x i1> %143, <4 x float> %144, <4 x float> %142
  %146 = fdiv <4 x float> %140, %145
  %147 = fcmp olt <4 x float> %146, zeroinitializer
  %148 = fneg <4 x float> %146
  %149 = select <4 x i1> %147, <4 x float> %148, <4 x float> %146
  %150 = fmul <4 x float> %149, splat (float 1.000000e+02)
  %151 = fpext <4 x float> %150 to <4 x double>
  %152 = fcmp ogt <4 x double> %151, splat (double 5.000000e-02)
  %.not75 = select <4 x i1> %130, <4 x i1> splat (i1 true), <4 x i1> %135
  %narrow = select <4 x i1> %.not75, <4 x i1> %152, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %153 = add <4 x i32> %vec.phi, %predphi
  %index.next72 = add nuw i64 %index70, 4
  %154 = icmp eq i64 %index.next72, 4096
  br i1 %154, label %_Z14compareResultsiPfS_.exit, label %vector.body69, !llvm.loop !10

_Z14compareResultsiPfS_.exit:                     ; preds = %vector.body69
  %155 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %153)
  %156 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %155) #5
  call void @free(ptr noundef %13) #13
  call void @free(ptr noundef %19) #13
  call void @free(ptr noundef %25) #13
  call void @free(ptr noundef %30) #13
  call void @free(ptr noundef nonnull %35) #13
  call void @free(ptr noundef nonnull %40) #13
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
attributes #12 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #13 = { nounwind "uniform-work-group-size" }
attributes #14 = { cold }
attributes #15 = { cold noreturn nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.isvectorized", i32 1}
!3 = !{!"llvm.loop.unroll.runtime.disable"}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2, !3}
!6 = distinct !{!6, !3, !2}
!7 = !{ptr @_Z29__device_stub__gesummv_kerneliffPfS_S_S_S_}
!8 = distinct !{!8, !2, !3}
!9 = distinct !{!9, !2}
!10 = distinct !{!10, !2, !3}
