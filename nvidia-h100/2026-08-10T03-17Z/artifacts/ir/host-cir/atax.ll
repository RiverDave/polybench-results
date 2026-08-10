; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/ATAX/atax.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/ATAX/atax.cu"
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
define dso_local void @_Z10init_arrayiiPfPA4096_f(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) %2, ptr nofree noundef writeonly captures(none) %3) local_unnamed_addr #1 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph17, label %._crit_edge18

.lr.ph17:                                         ; preds = %4
  %6 = icmp sgt i32 %1, 0
  %wide.trip.count29 = zext nneg i32 %0 to i64
  br i1 %6, label %.lr.ph.us.preheader, label %.lr.ph17.split.preheader

.lr.ph17.split.preheader:                         ; preds = %.lr.ph17
  %min.iters.check = icmp ult i32 %0, 4
  br i1 %min.iters.check, label %.lr.ph17.split.preheader47, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph17.split.preheader
  %n.vec = and i64 %wide.trip.count29, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %7 = uitofp nneg <4 x i32> %vec.ind to <4 x double>
  %8 = fmul nnan <4 x double> %7, splat (double f0x400921FB54442D18)
  %9 = fptrunc <4 x double> %8 to <4 x float>
  %10 = getelementptr [4 x i8], ptr %2, i64 %index
  store <4 x float> %9, ptr %10, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %11 = icmp eq i64 %index.next, %n.vec
  br i1 %11, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count29
  br i1 %cmp.n, label %._crit_edge18, label %.lr.ph17.split.preheader47

.lr.ph17.split.preheader47:                       ; preds = %.lr.ph17.split.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.lr.ph17.split.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph17.split

.lr.ph.us.preheader:                              ; preds = %.lr.ph17
  %wide.trip.count24 = zext nneg i32 %1 to i64
  %min.iters.check35 = icmp ult i32 %1, 8
  %n.vec38 = and i64 %wide.trip.count24, 2147483640
  %cmp.n45 = icmp eq i64 %n.vec38, %wide.trip.count24
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge.us
  %indvars.iv26 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next27, %._crit_edge.us ]
  %12 = trunc nuw nsw i64 %indvars.iv26 to i32
  %13 = uitofp nneg i32 %12 to double
  %14 = fmul nnan double %13, f0x400921FB54442D18
  %15 = fptrunc double %14 to float
  %16 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv26
  store float %15, ptr %16, align 4
  %17 = uitofp nneg i32 %12 to float
  %18 = getelementptr [16384 x i8], ptr %3, i64 %indvars.iv26
  br i1 %min.iters.check35, label %scalar.ph34.preheader, label %vector.ph36

vector.ph36:                                      ; preds = %.lr.ph.us
  %broadcast.splatinsert = insertelement <4 x float> poison, float %17, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body39

vector.body39:                                    ; preds = %vector.body39, %vector.ph36
  %index40 = phi i64 [ 0, %vector.ph36 ], [ %index.next42, %vector.body39 ]
  %vec.ind41 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph36 ], [ %vec.ind.next43, %vector.body39 ]
  %step.add = add <4 x i32> %vec.ind41, splat (i32 4)
  %19 = uitofp nneg <4 x i32> %vec.ind41 to <4 x float>
  %20 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %21 = fmul nnan <4 x float> %broadcast.splat, %19
  %22 = fmul nnan <4 x float> %broadcast.splat, %20
  %23 = fmul nnan <4 x float> %21, splat (float f0x39800000)
  %24 = fmul nnan <4 x float> %22, splat (float f0x39800000)
  %25 = getelementptr [4 x i8], ptr %18, i64 %index40
  %26 = getelementptr i8, ptr %25, i64 16
  store <4 x float> %23, ptr %25, align 4
  store <4 x float> %24, ptr %26, align 4
  %index.next42 = add nuw i64 %index40, 8
  %vec.ind.next43 = add <4 x i32> %vec.ind41, splat (i32 8)
  %27 = icmp eq i64 %index.next42, %n.vec38
  br i1 %27, label %middle.block44, label %vector.body39, !llvm.loop !4

middle.block44:                                   ; preds = %vector.body39
  br i1 %cmp.n45, label %._crit_edge.us, label %scalar.ph34.preheader

scalar.ph34.preheader:                            ; preds = %.lr.ph.us, %middle.block44
  %indvars.iv21.ph = phi i64 [ 0, %.lr.ph.us ], [ %n.vec38, %middle.block44 ]
  br label %scalar.ph34

scalar.ph34:                                      ; preds = %scalar.ph34.preheader, %scalar.ph34
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %scalar.ph34 ], [ %indvars.iv21.ph, %scalar.ph34.preheader ]
  %28 = trunc nuw nsw i64 %indvars.iv21 to i32
  %29 = uitofp nneg i32 %28 to float
  %30 = fmul nnan float %17, %29
  %31 = fmul nnan float %30, f0x39800000
  %32 = getelementptr [4 x i8], ptr %18, i64 %indvars.iv21
  store float %31, ptr %32, align 4
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond25.not = icmp eq i64 %indvars.iv.next22, %wide.trip.count24
  br i1 %exitcond25.not, label %._crit_edge.us, label %scalar.ph34, !llvm.loop !5

._crit_edge.us:                                   ; preds = %scalar.ph34, %middle.block44
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond30.not = icmp eq i64 %indvars.iv.next27, %wide.trip.count29
  br i1 %exitcond30.not, label %._crit_edge18, label %.lr.ph.us

.lr.ph17.split:                                   ; preds = %.lr.ph17.split.preheader47, %.lr.ph17.split
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph17.split ], [ %indvars.iv.ph, %.lr.ph17.split.preheader47 ]
  %33 = trunc nuw nsw i64 %indvars.iv to i32
  %34 = uitofp nneg i32 %33 to double
  %35 = fmul nnan double %34, f0x400921FB54442D18
  %36 = fptrunc double %35 to float
  %37 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv
  store float %36, ptr %37, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count29
  br i1 %exitcond.not, label %._crit_edge18, label %.lr.ph17.split, !llvm.loop !6

._crit_edge18:                                    ; preds = %.lr.ph17.split, %._crit_edge.us, %middle.block, %4
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiPfS_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2) local_unnamed_addr #3 {
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
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %36, %vector.body ]
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
  %35 = fcmp ogt <4 x float> %34, splat (float 5.000000e-01)
  %narrow = select <4 x i1> %19, <4 x i1> %35, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %36 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %37 = icmp eq i64 %index.next, %n.vec
  br i1 %37, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %38 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %36)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph.preheader13

.lr.ph.preheader13:                               ; preds = %.lr.ph.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %middle.block ]
  %.010.ph = phi i32 [ 0, %.lr.ph.preheader ], [ %38, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader13, %_Z11percentDiffdd.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit ], [ %indvars.iv.ph, %.lr.ph.preheader13 ]
  %.010 = phi i32 [ %.1, %_Z11percentDiffdd.exit ], [ %.010.ph, %.lr.ph.preheader13 ]
  %39 = getelementptr [4 x i8], ptr %1, i64 %indvars.iv
  %40 = load float, ptr %39, align 4
  %41 = fpext float %40 to double
  %42 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv
  %43 = load float, ptr %42, align 4
  %44 = fpext float %43 to double
  %45 = fcmp olt double %41, f0xB690000000000000
  %46 = fneg float %40
  %common.ret.op.i.i = select i1 %45, float %46, float %40
  %47 = fpext float %common.ret.op.i.i to double
  %48 = fcmp olt double %47, 1.000000e-02
  br i1 %48, label %49, label %.critedge.i

49:                                               ; preds = %.lr.ph
  %50 = fcmp olt double %44, f0xB690000000000000
  %51 = fneg float %43
  %common.ret.op.i7.i = select i1 %50, float %51, float %43
  %52 = fpext float %common.ret.op.i7.i to double
  %53 = fcmp olt double %52, 1.000000e-02
  br i1 %53, label %_Z11percentDiffdd.exit, label %.critedge.i

.critedge.i:                                      ; preds = %49, %.lr.ph
  %54 = insertelement <2 x double> poison, double %41, i64 0
  %55 = shufflevector <2 x double> %54, <2 x double> poison, <2 x i32> zeroinitializer
  %56 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %44, i64 0
  %57 = fsub <2 x double> %55, %56
  %58 = fptrunc <2 x double> %57 to <2 x float>
  %59 = fcmp olt <2 x double> %57, splat (double f0xB690000000000000)
  %60 = fneg <2 x float> %58
  %61 = select <2 x i1> %59, <2 x float> %60, <2 x float> %58
  %62 = extractelement <2 x float> %61, i64 0
  %63 = extractelement <2 x float> %61, i64 1
  %64 = fdiv float %62, %63
  %65 = fcmp olt float %64, 0.000000e+00
  %66 = fneg float %64
  %common.ret.op.i10.i = select i1 %65, float %66, float %64
  %67 = fmul float %common.ret.op.i10.i, 1.000000e+02
  %68 = fcmp ogt float %67, 5.000000e-01
  %69 = zext i1 %68 to i32
  br label %_Z11percentDiffdd.exit

_Z11percentDiffdd.exit:                           ; preds = %49, %.critedge.i
  %common.ret.op.i = phi i32 [ %69, %.critedge.i ], [ 0, %49 ]
  %.1 = add nuw nsw i32 %common.ret.op.i, %.010
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !llvm.loop !8

._crit_edge:                                      ; preds = %_Z11percentDiffdd.exit, %middle.block, %3
  %.0.lcssa = phi i32 [ 0, %3 ], [ %38, %middle.block ], [ %.1, %_Z11percentDiffdd.exit ]
  %70 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-01, i32 noundef %.0.lcssa) #4
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

define dso_local void @_Z27__device_stub__atax_kernel1iiPfS_S_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #5 {
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
  %23 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__atax_kernel1iiPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %11, i64 noundef %21, ptr noundef %22)
  ret void
}

define dso_local void @_Z27__device_stub__atax_kernel2iiPfS_S_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #5 {
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
  %23 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__atax_kernel2iiPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %11, i64 noundef %21, ptr noundef %22)
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z8atax_cpuiiPA4096_fPfS1_S1_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef captures(none) %4, ptr nofree noundef captures(none) %5) local_unnamed_addr #6 {
  %7 = icmp sgt i32 %1, 0
  br i1 %7, label %.preheader36, label %.preheader36.thread

.preheader36:                                     ; preds = %6
  %8 = zext nneg i32 %1 to i64
  %9 = shl nuw nsw i64 %8, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %4, i8 0, i64 %9, i1 false)
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph39.us.us.preheader, label %._crit_edge44

.preheader36.thread:                              ; preds = %6
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader.preheader, label %._crit_edge44

.preheader.preheader:                             ; preds = %.preheader36.thread
  %12 = zext nneg i32 %0 to i64
  %13 = shl nuw nsw i64 %12, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %5, i8 0, i64 %13, i1 false)
  br label %._crit_edge44

.lr.ph39.us.us.preheader:                         ; preds = %.preheader36
  %wide.trip.count62 = zext nneg i32 %0 to i64
  %wide.trip.count = zext nneg i32 %1 to i64
  %14 = shl nuw nsw i64 %wide.trip.count, 2
  %scevgep = getelementptr i8, ptr %4, i64 %14
  %15 = shl nuw nsw i64 %wide.trip.count62, 14
  %16 = getelementptr i8, ptr %2, i64 %15
  %17 = getelementptr i8, ptr %16, i64 %14
  %scevgep65 = getelementptr i8, ptr %17, i64 -16384
  %18 = shl nuw nsw i64 %wide.trip.count62, 2
  %scevgep66 = getelementptr i8, ptr %5, i64 %18
  %xtraiter = and i64 %wide.trip.count, 1
  %19 = icmp eq i32 %1, 1
  %unroll_iter = and i64 %wide.trip.count, 2147483646
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod74 = trunc i32 %1 to i1
  %min.iters.check = icmp ult i32 %1, 8
  %bound0 = icmp ult ptr %4, %scevgep65
  %bound1 = icmp ult ptr %2, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  %bound067 = icmp ult ptr %4, %scevgep66
  %bound168 = icmp ult ptr %5, %scevgep
  %found.conflict69 = and i1 %bound067, %bound168
  %conflict.rdx = or i1 %found.conflict, %found.conflict69
  %n.vec = and i64 %wide.trip.count, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  %xtraiter75 = and i64 %wide.trip.count, 1
  %lcmp.mod76.not = icmp eq i64 %xtraiter75, 0
  %20 = add nsw i64 %wide.trip.count, -1
  br label %.lr.ph39.us.us

.lr.ph39.us.us:                                   ; preds = %.lr.ph39.us.us.preheader, %._crit_edge.us.us
  %indvars.iv59 = phi i64 [ 0, %.lr.ph39.us.us.preheader ], [ %indvars.iv.next60, %._crit_edge.us.us ]
  %21 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv59
  store float 0.000000e+00, ptr %21, align 4
  %22 = getelementptr [16384 x i8], ptr %2, i64 %indvars.iv59
  br i1 %19, label %.epil.preheader, label %.lr.ph39.us.us.new

.lr.ph39.us.us.new:                               ; preds = %.lr.ph39.us.us, %.lr.ph39.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph39.us.us.new ], [ 0, %.lr.ph39.us.us ]
  %23 = phi float [ %35, %.lr.ph39.us.us.new ], [ 0.000000e+00, %.lr.ph39.us.us ]
  %niter = phi i64 [ %niter.next.1, %.lr.ph39.us.us.new ], [ 0, %.lr.ph39.us.us ]
  %24 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv
  %25 = load float, ptr %24, align 4
  %26 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv
  %27 = load float, ptr %26, align 4
  %28 = fmul float %25, %27
  %29 = fadd float %23, %28
  store float %29, ptr %21, align 4
  %indvars.iv.next = or disjoint i64 %indvars.iv, 1
  %30 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv.next
  %31 = load float, ptr %30, align 4
  %32 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv.next
  %33 = load float, ptr %32, align 4
  %34 = fmul float %31, %33
  %35 = fadd float %29, %34
  store float %35, ptr %21, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %..preheader_crit_edge.us.us.preheader.unr-lcssa, label %.lr.ph39.us.us.new

..preheader_crit_edge.us.us.preheader.unr-lcssa:  ; preds = %.lr.ph39.us.us.new
  br i1 %lcmp.mod.not, label %..preheader_crit_edge.us.us.preheader, label %.epil.preheader

.epil.preheader:                                  ; preds = %..preheader_crit_edge.us.us.preheader.unr-lcssa, %.lr.ph39.us.us
  %indvars.iv.epil.init = phi i64 [ 0, %.lr.ph39.us.us ], [ %indvars.iv.next.1, %..preheader_crit_edge.us.us.preheader.unr-lcssa ]
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph39.us.us ], [ %35, %..preheader_crit_edge.us.us.preheader.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod74)
  %36 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv.epil.init
  %37 = load float, ptr %36, align 4
  %38 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv.epil.init
  %39 = load float, ptr %38, align 4
  %40 = fmul float %37, %39
  %41 = fadd float %.epil.init, %40
  store float %41, ptr %21, align 4
  br label %..preheader_crit_edge.us.us.preheader

..preheader_crit_edge.us.us.preheader:            ; preds = %..preheader_crit_edge.us.us.preheader.unr-lcssa, %.epil.preheader
  %brmerge = select i1 %min.iters.check, i1 true, i1 %conflict.rdx
  br i1 %brmerge, label %..preheader_crit_edge.us.us.preheader73, label %vector.ph

vector.ph:                                        ; preds = %..preheader_crit_edge.us.us.preheader
  %42 = load float, ptr %21, align 4, !alias.scope !9
  %broadcast.splatinsert = insertelement <4 x float> poison, float %42, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %43 = getelementptr [4 x i8], ptr %4, i64 %index
  %44 = getelementptr i8, ptr %43, i64 16
  %wide.load = load <4 x float>, ptr %43, align 4, !alias.scope !12, !noalias !14
  %wide.load70 = load <4 x float>, ptr %44, align 4, !alias.scope !12, !noalias !14
  %45 = getelementptr [4 x i8], ptr %22, i64 %index
  %46 = getelementptr i8, ptr %45, i64 16
  %wide.load71 = load <4 x float>, ptr %45, align 4, !alias.scope !16
  %wide.load72 = load <4 x float>, ptr %46, align 4, !alias.scope !16
  %47 = fmul <4 x float> %wide.load71, %broadcast.splat
  %48 = fmul <4 x float> %wide.load72, %broadcast.splat
  %49 = fadd <4 x float> %wide.load, %47
  %50 = fadd <4 x float> %wide.load70, %48
  store <4 x float> %49, ptr %43, align 4, !alias.scope !12, !noalias !14
  store <4 x float> %50, ptr %44, align 4, !alias.scope !12, !noalias !14
  %index.next = add nuw i64 %index, 8
  %51 = icmp eq i64 %index.next, %n.vec
  br i1 %51, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us.us, label %..preheader_crit_edge.us.us.preheader73

..preheader_crit_edge.us.us.preheader73:          ; preds = %..preheader_crit_edge.us.us.preheader, %middle.block
  %indvars.iv54.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %..preheader_crit_edge.us.us.preheader ]
  br i1 %lcmp.mod76.not, label %..preheader_crit_edge.us.us.prol.loopexit, label %..preheader_crit_edge.us.us.prol

..preheader_crit_edge.us.us.prol:                 ; preds = %..preheader_crit_edge.us.us.preheader73
  %52 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv54.ph
  %53 = load float, ptr %52, align 4
  %54 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv54.ph
  %55 = load float, ptr %54, align 4
  %56 = load float, ptr %21, align 4
  %57 = fmul float %55, %56
  %58 = fadd float %53, %57
  store float %58, ptr %52, align 4
  %indvars.iv.next55.prol = or disjoint i64 %indvars.iv54.ph, 1
  br label %..preheader_crit_edge.us.us.prol.loopexit

..preheader_crit_edge.us.us.prol.loopexit:        ; preds = %..preheader_crit_edge.us.us.prol, %..preheader_crit_edge.us.us.preheader73
  %indvars.iv54.unr = phi i64 [ %indvars.iv54.ph, %..preheader_crit_edge.us.us.preheader73 ], [ %indvars.iv.next55.prol, %..preheader_crit_edge.us.us.prol ]
  %59 = icmp eq i64 %indvars.iv54.ph, %20
  br i1 %59, label %._crit_edge.us.us, label %..preheader_crit_edge.us.us

..preheader_crit_edge.us.us:                      ; preds = %..preheader_crit_edge.us.us.prol.loopexit, %..preheader_crit_edge.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %..preheader_crit_edge.us.us ], [ %indvars.iv54.unr, %..preheader_crit_edge.us.us.prol.loopexit ]
  %60 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv54
  %61 = load float, ptr %60, align 4
  %62 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv54
  %63 = load float, ptr %62, align 4
  %64 = load float, ptr %21, align 4
  %65 = fmul float %63, %64
  %66 = fadd float %61, %65
  store float %66, ptr %60, align 4
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %67 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv.next55
  %68 = load float, ptr %67, align 4
  %69 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv.next55
  %70 = load float, ptr %69, align 4
  %71 = load float, ptr %21, align 4
  %72 = fmul float %70, %71
  %73 = fadd float %68, %72
  store float %73, ptr %67, align 4
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond58.not.1 = icmp eq i64 %indvars.iv.next55.1, %wide.trip.count
  br i1 %exitcond58.not.1, label %._crit_edge.us.us, label %..preheader_crit_edge.us.us, !llvm.loop !18

._crit_edge.us.us:                                ; preds = %..preheader_crit_edge.us.us.prol.loopexit, %..preheader_crit_edge.us.us, %middle.block
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond63.not = icmp eq i64 %indvars.iv.next60, %wide.trip.count62
  br i1 %exitcond63.not, label %._crit_edge44, label %.lr.ph39.us.us

._crit_edge44:                                    ; preds = %._crit_edge.us.us, %.preheader36.thread, %.preheader.preheader, %.preheader36
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
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #15
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
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #15
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

define dso_local void @_Z7ataxGpuiiPA4096_fPfS1_S1_S1_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) local_unnamed_addr #5 {
  %8 = alloca %struct.timeval, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca [5 x ptr], align 16
  %15 = alloca %struct.dim3, align 8
  %16 = alloca %struct.dim3, align 8
  %17 = alloca i64, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca [5 x ptr], align 16
  %25 = alloca %struct.dim3, align 8
  %26 = alloca %struct.dim3, align 8
  %27 = alloca i64, align 8
  %28 = alloca ptr, align 8
  %29 = alloca %struct.timeval, align 8
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = call i32 @cudaMalloc(ptr noundef nonnull %30, i64 noundef 67108864) #4
  %35 = call i32 @cudaMalloc(ptr noundef nonnull %31, i64 noundef 16384) #4
  %36 = call i32 @cudaMalloc(ptr noundef nonnull %32, i64 noundef 16384) #4
  %37 = call i32 @cudaMalloc(ptr noundef nonnull %33, i64 noundef 16384) #4
  %38 = load ptr, ptr %30, align 8
  %39 = call i32 @cudaMemcpy(ptr noundef %38, ptr noundef %2, i64 noundef 67108864, i32 noundef 1) #4
  %40 = load ptr, ptr %31, align 8
  %41 = call i32 @cudaMemcpy(ptr noundef %40, ptr noundef %3, i64 noundef 16384, i32 noundef 1) #4
  %42 = load ptr, ptr %32, align 8
  %43 = call i32 @cudaMemcpy(ptr noundef %42, ptr noundef %4, i64 noundef 16384, i32 noundef 1) #4
  %44 = load ptr, ptr %33, align 8
  %45 = call i32 @cudaMemcpy(ptr noundef %44, ptr noundef %5, i64 noundef 16384, i32 noundef 1) #4
  call void @llvm.lifetime.start.p0(ptr nonnull %29)
  %46 = call i32 @gettimeofday(ptr noundef nonnull %29, ptr noundef null) #15
  %.not.i.i = icmp eq i32 %46, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %47

47:                                               ; preds = %7
  %48 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %46) #4
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %7, %47
  %49 = load i64, ptr %29, align 8
  %50 = sitofp i64 %49 to double
  %51 = getelementptr inbounds nuw i8, ptr %29, i64 8
  %52 = load i64, ptr %51, align 8
  %53 = sitofp i64 %52 to double
  %54 = fmul nnan double %53, f0x3EB0C6F7A0B5ED8D
  %55 = fadd double %54, %50
  call void @llvm.lifetime.end.p0(ptr nonnull %29)
  store double %55, ptr @polybench_t_start, align 8
  %56 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 128, i32 1, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #4
  %.not = icmp eq i32 %56, 0
  br i1 %.not, label %57, label %69

57:                                               ; preds = %_Z21polybench_timer_startv.exit
  %58 = load ptr, ptr %30, align 8
  %59 = load ptr, ptr %31, align 8
  %60 = load ptr, ptr %33, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %19)
  call void @llvm.lifetime.start.p0(ptr nonnull %20)
  call void @llvm.lifetime.start.p0(ptr nonnull %21)
  call void @llvm.lifetime.start.p0(ptr nonnull %22)
  call void @llvm.lifetime.start.p0(ptr nonnull %23)
  call void @llvm.lifetime.start.p0(ptr nonnull %24)
  call void @llvm.lifetime.start.p0(ptr nonnull %25)
  call void @llvm.lifetime.start.p0(ptr nonnull %26)
  call void @llvm.lifetime.start.p0(ptr nonnull %27)
  call void @llvm.lifetime.start.p0(ptr nonnull %28)
  store i32 %0, ptr %19, align 4
  store i32 %1, ptr %20, align 4
  store ptr %58, ptr %21, align 8
  store ptr %59, ptr %22, align 8
  store ptr %60, ptr %23, align 8
  store ptr %19, ptr %24, align 16
  %61 = getelementptr inbounds nuw i8, ptr %24, i64 8
  store ptr %20, ptr %61, align 8
  %62 = getelementptr inbounds nuw i8, ptr %24, i64 16
  store ptr %21, ptr %62, align 16
  %63 = getelementptr inbounds nuw i8, ptr %24, i64 24
  store ptr %22, ptr %63, align 8
  %64 = getelementptr inbounds nuw i8, ptr %24, i64 32
  store ptr %23, ptr %64, align 16
  %65 = call i32 @__cudaPopCallConfiguration(ptr nonnull %25, ptr nonnull %26, ptr nonnull %27, ptr nonnull %28), !inline_history !19
  %66 = load i64, ptr %27, align 8
  %67 = load ptr, ptr %28, align 8
  %.fca.0.load2.i = load i32, ptr %25, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %25, i64 4
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %25, i64 8
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %26, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %26, i64 4
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %26, i64 8
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %68 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__atax_kernel1iiPfS_S_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %24, i64 noundef %66, ptr noundef %67), !inline_history !19
  call void @llvm.lifetime.end.p0(ptr nonnull %19)
  call void @llvm.lifetime.end.p0(ptr nonnull %20)
  call void @llvm.lifetime.end.p0(ptr nonnull %21)
  call void @llvm.lifetime.end.p0(ptr nonnull %22)
  call void @llvm.lifetime.end.p0(ptr nonnull %23)
  call void @llvm.lifetime.end.p0(ptr nonnull %24)
  call void @llvm.lifetime.end.p0(ptr nonnull %25)
  call void @llvm.lifetime.end.p0(ptr nonnull %26)
  call void @llvm.lifetime.end.p0(ptr nonnull %27)
  call void @llvm.lifetime.end.p0(ptr nonnull %28)
  br label %69

69:                                               ; preds = %_Z21polybench_timer_startv.exit, %57
  %70 = call i32 @cudaThreadSynchronize() #4
  %71 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 128, i32 1, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #4
  %.not26 = icmp eq i32 %71, 0
  br i1 %.not26, label %72, label %84

72:                                               ; preds = %69
  %73 = load ptr, ptr %30, align 8
  %74 = load ptr, ptr %32, align 8
  %75 = load ptr, ptr %33, align 8
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
  store i32 %0, ptr %9, align 4
  store i32 %1, ptr %10, align 4
  store ptr %73, ptr %11, align 8
  store ptr %74, ptr %12, align 8
  store ptr %75, ptr %13, align 8
  store ptr %9, ptr %14, align 16
  %76 = getelementptr inbounds nuw i8, ptr %14, i64 8
  store ptr %10, ptr %76, align 8
  %77 = getelementptr inbounds nuw i8, ptr %14, i64 16
  store ptr %11, ptr %77, align 16
  %78 = getelementptr inbounds nuw i8, ptr %14, i64 24
  store ptr %12, ptr %78, align 8
  %79 = getelementptr inbounds nuw i8, ptr %14, i64 32
  store ptr %13, ptr %79, align 16
  %80 = call i32 @__cudaPopCallConfiguration(ptr nonnull %15, ptr nonnull %16, ptr nonnull %17, ptr nonnull %18), !inline_history !20
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
  %83 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__atax_kernel2iiPfS_S_, %struct.dim3 %.fca.2.insert9.i34, %struct.dim3 %.fca.2.insert.i42, ptr noundef nonnull %14, i64 noundef %81, ptr noundef %82), !inline_history !20
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
  br label %84

84:                                               ; preds = %69, %72
  %85 = call i32 @cudaThreadSynchronize() #4
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  %86 = call i32 @gettimeofday(ptr noundef nonnull %8, ptr noundef null) #15
  %.not.i.i43 = icmp eq i32 %86, 0
  br i1 %.not.i.i43, label %_Z20polybench_timer_stopv.exit, label %87

87:                                               ; preds = %84
  %88 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %86) #4
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %84, %87
  %89 = load i64, ptr %8, align 8
  %90 = sitofp i64 %89 to double
  %91 = getelementptr inbounds nuw i8, ptr %8, i64 8
  %92 = load i64, ptr %91, align 8
  %93 = sitofp i64 %92 to double
  %94 = fmul nnan double %93, f0x3EB0C6F7A0B5ED8D
  %95 = fadd double %94, %90
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  store double %95, ptr @polybench_t_end, align 8
  %96 = load double, ptr @polybench_t_start, align 8
  %97 = fsub double %95, %96
  %98 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %97) #4
  %99 = load ptr, ptr %32, align 8
  %100 = call i32 @cudaMemcpy(ptr noundef %6, ptr noundef %99, i64 noundef 16384, i32 noundef 2) #4
  %101 = load ptr, ptr %30, align 8
  %102 = call i32 @cudaFree(ptr noundef %101) #4
  %103 = load ptr, ptr %31, align 8
  %104 = call i32 @cudaFree(ptr noundef %103) #4
  %105 = load ptr, ptr %32, align 8
  %106 = call i32 @cudaFree(ptr noundef %105) #4
  %107 = load ptr, ptr %33, align 8
  %108 = call i32 @cudaFree(ptr noundef %107) #4
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

define dso_local noundef i32 @main(i32 noundef %0, ptr nofree noundef readnone captures(none) %1) local_unnamed_addr #5 {
  %3 = alloca %struct.timeval, align 8
  %4 = alloca %struct.timeval, align 8
  %5 = alloca %struct.cudaDeviceProp, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  store ptr null, ptr %10, align 8
  %11 = call i32 @posix_memalign(ptr noundef nonnull %10, i64 noundef 32, i64 noundef 67108864) #15
  %12 = load ptr, ptr %10, align 8
  %.not.i.i = icmp eq ptr %12, null
  %13 = icmp ne i32 %11, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %13
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %14 = load ptr, ptr @stderr, align 8
  %15 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %14) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  store ptr null, ptr %9, align 8
  %16 = call i32 @posix_memalign(ptr noundef nonnull %9, i64 noundef 32, i64 noundef 16384) #15
  %17 = load ptr, ptr %9, align 8
  %.not.i.i25 = icmp eq ptr %17, null
  %18 = icmp ne i32 %16, 0
  %or.cond.i.i26 = select i1 %.not.i.i25, i1 true, i1 %18
  br i1 %or.cond.i.i26, label %.critedge.i.i27, label %_Z20polybench_alloc_datayi.exit28

.critedge.i.i27:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %19 = load ptr, ptr @stderr, align 8
  %20 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %19) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit28:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %21 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 16384) #15
  %22 = load ptr, ptr %8, align 8
  %.not.i.i29 = icmp eq ptr %22, null
  %23 = icmp ne i32 %21, 0
  %or.cond.i.i30 = select i1 %.not.i.i29, i1 true, i1 %23
  br i1 %or.cond.i.i30, label %.critedge.i.i31, label %_Z20polybench_alloc_datayi.exit32

.critedge.i.i31:                                  ; preds = %_Z20polybench_alloc_datayi.exit28
  %24 = load ptr, ptr @stderr, align 8
  %25 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %24) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit32:                ; preds = %_Z20polybench_alloc_datayi.exit28
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %26 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 16384) #15
  %27 = load ptr, ptr %7, align 8
  %.not.i.i33 = icmp eq ptr %27, null
  %28 = icmp ne i32 %26, 0
  %or.cond.i.i34 = select i1 %.not.i.i33, i1 true, i1 %28
  br i1 %or.cond.i.i34, label %.critedge.i.i35, label %_Z20polybench_alloc_datayi.exit36

.critedge.i.i35:                                  ; preds = %_Z20polybench_alloc_datayi.exit32
  %29 = load ptr, ptr @stderr, align 8
  %30 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %29) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit36:                ; preds = %_Z20polybench_alloc_datayi.exit32
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %31 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 16384) #15
  %32 = load ptr, ptr %6, align 8
  %.not.i.i37 = icmp eq ptr %32, null
  %33 = icmp ne i32 %31, 0
  %or.cond.i.i38 = select i1 %.not.i.i37, i1 true, i1 %33
  br i1 %or.cond.i.i38, label %.critedge.i.i39, label %_Z20polybench_alloc_datayi.exit40

.critedge.i.i39:                                  ; preds = %_Z20polybench_alloc_datayi.exit36
  %34 = load ptr, ptr @stderr, align 8
  %35 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %34) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit40:                ; preds = %_Z20polybench_alloc_datayi.exit36
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  br label %.lr.ph.us.i

.lr.ph.us.i:                                      ; preds = %._crit_edge.us.i, %_Z20polybench_alloc_datayi.exit40
  %indvars.iv26.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit40 ], [ %indvars.iv.next27.i, %._crit_edge.us.i ]
  %36 = trunc nuw nsw i64 %indvars.iv26.i to i32
  %37 = uitofp nneg i32 %36 to double
  %38 = fmul nnan double %37, f0x400921FB54442D18
  %39 = fptrunc double %38 to float
  %40 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv26.i
  store float %39, ptr %40, align 4
  %41 = getelementptr [16384 x i8], ptr %12, i64 %indvars.iv26.i
  %42 = uitofp nneg i32 %36 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %42, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.lr.ph.us.i
  %index = phi i64 [ 0, %.lr.ph.us.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.lr.ph.us.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %43 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %44 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %45 = fmul nnan <4 x float> %broadcast.splat, %43
  %46 = fmul nnan <4 x float> %broadcast.splat, %44
  %47 = fmul nnan <4 x float> %45, splat (float f0x39800000)
  %48 = fmul nnan <4 x float> %46, splat (float f0x39800000)
  %49 = getelementptr [4 x i8], ptr %41, i64 %index
  %50 = getelementptr i8, ptr %49, i64 16
  store <4 x float> %47, ptr %49, align 4
  store <4 x float> %48, ptr %50, align 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %51 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %52 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %53 = fmul nnan <4 x float> %broadcast.splat, %51
  %54 = fmul nnan <4 x float> %broadcast.splat, %52
  %55 = fmul nnan <4 x float> %53, splat (float f0x39800000)
  %56 = fmul nnan <4 x float> %54, splat (float f0x39800000)
  %57 = getelementptr [4 x i8], ptr %41, i64 %index
  %58 = getelementptr i8, ptr %57, i64 32
  %59 = getelementptr i8, ptr %57, i64 48
  store <4 x float> %55, ptr %58, align 4
  store <4 x float> %56, ptr %59, align 4
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %60 = icmp eq i64 %index.next.1, 4096
  br i1 %60, label %._crit_edge.us.i, label %vector.body, !llvm.loop !21

._crit_edge.us.i:                                 ; preds = %vector.body
  %indvars.iv.next27.i = add nuw nsw i64 %indvars.iv26.i, 1
  %exitcond30.not.i = icmp eq i64 %indvars.iv.next27.i, 4096
  br i1 %exitcond30.not.i, label %_Z10init_arrayiiPfPA4096_f.exit, label %.lr.ph.us.i

_Z10init_arrayiiPfPA4096_f.exit:                  ; preds = %._crit_edge.us.i
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  %61 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %5, i32 noundef 0) #4
  %62 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %5) #4
  %63 = call i32 @cudaSetDevice(i32 noundef 0) #4
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @_Z7ataxGpuiiPA4096_fPfS1_S1_S1_(i32 noundef 4096, i32 noundef 4096, ptr noundef nonnull %12, ptr noundef nonnull %17, ptr noundef %22, ptr noundef %32, ptr noundef %27) #4
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %64 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #15
  %.not.i.i41 = icmp eq i32 %64, 0
  br i1 %.not.i.i41, label %_Z21polybench_timer_startv.exit, label %65

65:                                               ; preds = %_Z10init_arrayiiPfPA4096_f.exit
  %66 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %64) #4
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiiPfPA4096_f.exit, %65
  %67 = load i64, ptr %4, align 8
  %68 = sitofp i64 %67 to double
  %69 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %70 = load i64, ptr %69, align 8
  %71 = sitofp i64 %70 to double
  %72 = fmul nnan double %71, f0x3EB0C6F7A0B5ED8D
  %73 = fadd double %72, %68
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %73, ptr @polybench_t_start, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(16384) %22, i8 0, i64 16384, i1 false)
  %scevgep = getelementptr i8, ptr %22, i64 16384
  %74 = insertelement <2 x ptr> poison, ptr %12, i64 0
  %75 = insertelement <2 x ptr> %74, ptr %32, i64 1
  %76 = getelementptr i8, <2 x ptr> %75, <2 x i64> <i64 67108864, i64 16384>
  %77 = insertelement <2 x ptr> poison, ptr %22, i64 0
  %78 = shufflevector <2 x ptr> %77, <2 x ptr> poison, <2 x i32> zeroinitializer
  %79 = insertelement <2 x ptr> poison, ptr %scevgep, i64 0
  %80 = shufflevector <2 x ptr> %79, <2 x ptr> poison, <2 x i32> zeroinitializer
  %81 = icmp ult <2 x ptr> %78, %76
  %82 = icmp ult <2 x ptr> %75, %80
  %83 = and <2 x i1> %81, %82
  %84 = bitcast <2 x i1> %83 to i2
  %conflict.rdx.not = icmp eq i2 %84, 0
  br label %.lr.ph39.us.us.i

.lr.ph39.us.us.i:                                 ; preds = %._crit_edge.us.us.i, %_Z21polybench_timer_startv.exit
  %indvars.iv59.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next60.i, %._crit_edge.us.us.i ]
  %85 = getelementptr [4 x i8], ptr %32, i64 %indvars.iv59.i
  store float 0.000000e+00, ptr %85, align 4
  %86 = getelementptr [16384 x i8], ptr %12, i64 %indvars.iv59.i
  br label %87

87:                                               ; preds = %87, %.lr.ph39.us.us.i
  %indvars.iv.i = phi i64 [ 0, %.lr.ph39.us.us.i ], [ %indvars.iv.next.i.1, %87 ]
  %88 = phi float [ 0.000000e+00, %.lr.ph39.us.us.i ], [ %100, %87 ]
  %89 = getelementptr [4 x i8], ptr %86, i64 %indvars.iv.i
  %90 = load float, ptr %89, align 4
  %91 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv.i
  %92 = load float, ptr %91, align 4
  %93 = fmul float %90, %92
  %94 = fadd float %88, %93
  store float %94, ptr %85, align 4
  %indvars.iv.next.i = or disjoint i64 %indvars.iv.i, 1
  %95 = getelementptr [4 x i8], ptr %86, i64 %indvars.iv.next.i
  %96 = load float, ptr %95, align 4
  %97 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv.next.i
  %98 = load float, ptr %97, align 4
  %99 = fmul float %96, %98
  %100 = fadd float %94, %99
  store float %100, ptr %85, align 4
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %exitcond.not.i.1 = icmp eq i64 %indvars.iv.next.i.1, 4096
  br i1 %exitcond.not.i.1, label %vector.memcheck, label %87

vector.memcheck:                                  ; preds = %87
  br i1 %conflict.rdx.not, label %vector.ph58, label %..preheader_crit_edge.us.us.i

vector.ph58:                                      ; preds = %vector.memcheck
  %101 = load float, ptr %85, align 4, !alias.scope !22
  %broadcast.splatinsert64 = insertelement <4 x float> poison, float %101, i64 0
  %broadcast.splat65 = shufflevector <4 x float> %broadcast.splatinsert64, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body59

vector.body59:                                    ; preds = %vector.body59, %vector.ph58
  %index60 = phi i64 [ 0, %vector.ph58 ], [ %index.next66.1, %vector.body59 ]
  %102 = getelementptr [4 x i8], ptr %22, i64 %index60
  %103 = getelementptr i8, ptr %102, i64 16
  %wide.load = load <4 x float>, ptr %102, align 4, !alias.scope !25, !noalias !27
  %wide.load61 = load <4 x float>, ptr %103, align 4, !alias.scope !25, !noalias !27
  %104 = getelementptr [4 x i8], ptr %86, i64 %index60
  %105 = getelementptr i8, ptr %104, i64 16
  %wide.load62 = load <4 x float>, ptr %104, align 4, !alias.scope !29
  %wide.load63 = load <4 x float>, ptr %105, align 4, !alias.scope !29
  %106 = fmul <4 x float> %wide.load62, %broadcast.splat65
  %107 = fmul <4 x float> %wide.load63, %broadcast.splat65
  %108 = fadd <4 x float> %wide.load, %106
  %109 = fadd <4 x float> %wide.load61, %107
  store <4 x float> %108, ptr %102, align 4, !alias.scope !25, !noalias !27
  store <4 x float> %109, ptr %103, align 4, !alias.scope !25, !noalias !27
  %index.next66 = or disjoint i64 %index60, 8
  %110 = getelementptr [4 x i8], ptr %22, i64 %index.next66
  %111 = getelementptr i8, ptr %110, i64 16
  %wide.load.1 = load <4 x float>, ptr %110, align 4, !alias.scope !25, !noalias !27
  %wide.load61.1 = load <4 x float>, ptr %111, align 4, !alias.scope !25, !noalias !27
  %112 = getelementptr [4 x i8], ptr %86, i64 %index.next66
  %113 = getelementptr i8, ptr %112, i64 16
  %wide.load62.1 = load <4 x float>, ptr %112, align 4, !alias.scope !29
  %wide.load63.1 = load <4 x float>, ptr %113, align 4, !alias.scope !29
  %114 = fmul <4 x float> %wide.load62.1, %broadcast.splat65
  %115 = fmul <4 x float> %wide.load63.1, %broadcast.splat65
  %116 = fadd <4 x float> %wide.load.1, %114
  %117 = fadd <4 x float> %wide.load61.1, %115
  store <4 x float> %116, ptr %110, align 4, !alias.scope !25, !noalias !27
  store <4 x float> %117, ptr %111, align 4, !alias.scope !25, !noalias !27
  %index.next66.1 = add nuw nsw i64 %index60, 16
  %118 = icmp eq i64 %index.next66.1, 4096
  br i1 %118, label %._crit_edge.us.us.i, label %vector.body59, !llvm.loop !30

..preheader_crit_edge.us.us.i:                    ; preds = %vector.memcheck, %..preheader_crit_edge.us.us.i
  %indvars.iv54.i = phi i64 [ %indvars.iv.next55.i.1, %..preheader_crit_edge.us.us.i ], [ 0, %vector.memcheck ]
  %119 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv54.i
  %120 = load float, ptr %119, align 4
  %121 = getelementptr [4 x i8], ptr %86, i64 %indvars.iv54.i
  %122 = load float, ptr %121, align 4
  %123 = load float, ptr %85, align 4
  %124 = fmul float %122, %123
  %125 = fadd float %120, %124
  store float %125, ptr %119, align 4
  %indvars.iv.next55.i = or disjoint i64 %indvars.iv54.i, 1
  %126 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv.next55.i
  %127 = load float, ptr %126, align 4
  %128 = getelementptr [4 x i8], ptr %86, i64 %indvars.iv.next55.i
  %129 = load float, ptr %128, align 4
  %130 = load float, ptr %85, align 4
  %131 = fmul float %129, %130
  %132 = fadd float %127, %131
  store float %132, ptr %126, align 4
  %indvars.iv.next55.i.1 = add nuw nsw i64 %indvars.iv54.i, 2
  %exitcond58.not.i.1 = icmp eq i64 %indvars.iv.next55.i.1, 4096
  br i1 %exitcond58.not.i.1, label %._crit_edge.us.us.i, label %..preheader_crit_edge.us.us.i, !llvm.loop !31

._crit_edge.us.us.i:                              ; preds = %vector.body59, %..preheader_crit_edge.us.us.i
  %indvars.iv.next60.i = add nuw nsw i64 %indvars.iv59.i, 1
  %exitcond63.not.i = icmp eq i64 %indvars.iv.next60.i, 4096
  br i1 %exitcond63.not.i, label %_Z8atax_cpuiiPA4096_fPfS1_S1_.exit, label %.lr.ph39.us.us.i

_Z8atax_cpuiiPA4096_fPfS1_S1_.exit:               ; preds = %._crit_edge.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %133 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #15
  %.not.i.i42 = icmp eq i32 %133, 0
  br i1 %.not.i.i42, label %_Z20polybench_timer_stopv.exit, label %134

134:                                              ; preds = %_Z8atax_cpuiiPA4096_fPfS1_S1_.exit
  %135 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %133) #4
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z8atax_cpuiiPA4096_fPfS1_S1_.exit, %134
  %136 = load i64, ptr %3, align 8
  %137 = sitofp i64 %136 to double
  %138 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %139 = load i64, ptr %138, align 8
  %140 = sitofp i64 %139 to double
  %141 = fmul nnan double %140, f0x3EB0C6F7A0B5ED8D
  %142 = fadd double %141, %137
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %142, ptr @polybench_t_end, align 8
  %143 = load double, ptr @polybench_t_start, align 8
  %144 = fsub double %142, %143
  %145 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %144) #4
  br label %vector.body70

vector.body70:                                    ; preds = %vector.body70, %_Z20polybench_timer_stopv.exit
  %index71 = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %index.next74, %vector.body70 ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %_Z20polybench_timer_stopv.exit ], [ %176, %vector.body70 ]
  %146 = getelementptr [4 x i8], ptr %22, i64 %index71
  %wide.load72 = load <4 x float>, ptr %146, align 4
  %147 = fpext <4 x float> %wide.load72 to <4 x double>
  %148 = getelementptr [4 x i8], ptr %27, i64 %index71
  %wide.load73 = load <4 x float>, ptr %148, align 4
  %149 = fpext <4 x float> %wide.load73 to <4 x double>
  %150 = fcmp olt <4 x double> %147, splat (double f0xB690000000000000)
  %151 = fneg <4 x float> %wide.load72
  %152 = select <4 x i1> %150, <4 x float> %151, <4 x float> %wide.load72
  %153 = fpext <4 x float> %152 to <4 x double>
  %154 = fcmp uge <4 x double> %153, splat (double 1.000000e-02)
  %155 = fcmp olt <4 x double> %149, splat (double f0xB690000000000000)
  %156 = fneg <4 x float> %wide.load73
  %157 = select <4 x i1> %155, <4 x float> %156, <4 x float> %wide.load73
  %158 = fpext <4 x float> %157 to <4 x double>
  %159 = fcmp uge <4 x double> %158, splat (double 1.000000e-02)
  %160 = fsub <4 x double> %147, %149
  %161 = fptrunc <4 x double> %160 to <4 x float>
  %162 = fcmp olt <4 x double> %160, splat (double f0xB690000000000000)
  %163 = fneg <4 x float> %161
  %164 = select <4 x i1> %162, <4 x float> %163, <4 x float> %161
  %165 = fadd <4 x double> %147, splat (double f0x3E45798EE0000000)
  %166 = fptrunc <4 x double> %165 to <4 x float>
  %167 = fcmp olt <4 x double> %165, splat (double f0xB690000000000000)
  %168 = fneg <4 x float> %166
  %169 = select <4 x i1> %167, <4 x float> %168, <4 x float> %166
  %170 = fdiv <4 x float> %164, %169
  %171 = fcmp olt <4 x float> %170, zeroinitializer
  %172 = fneg <4 x float> %170
  %173 = select <4 x i1> %171, <4 x float> %172, <4 x float> %170
  %174 = fmul <4 x float> %173, splat (float 1.000000e+02)
  %175 = fcmp ogt <4 x float> %174, splat (float 5.000000e-01)
  %.not77 = select <4 x i1> %154, <4 x i1> splat (i1 true), <4 x i1> %159
  %narrow = select <4 x i1> %.not77, <4 x i1> %175, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %176 = add <4 x i32> %vec.phi, %predphi
  %index.next74 = add nuw i64 %index71, 4
  %177 = icmp eq i64 %index.next74, 4096
  br i1 %177, label %_Z14compareResultsiPfS_.exit, label %vector.body70, !llvm.loop !32

_Z14compareResultsiPfS_.exit:                     ; preds = %vector.body70
  %178 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %176)
  %179 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-01, i32 noundef %178) #4
  call void @free(ptr noundef %12) #15
  call void @free(ptr noundef %17) #15
  call void @free(ptr noundef nonnull %22) #15
  call void @free(ptr noundef nonnull %27) #15
  call void @free(ptr noundef %32) #15
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

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #14

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
attributes #14 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #15 = { nounwind "uniform-work-group-size" }
attributes #16 = { cold }
attributes #17 = { cold noreturn nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.isvectorized", i32 1}
!3 = !{!"llvm.loop.unroll.runtime.disable"}
!4 = distinct !{!4, !2, !3}
!5 = distinct !{!5, !3, !2}
!6 = distinct !{!6, !3, !2}
!7 = distinct !{!7, !2, !3}
!8 = distinct !{!8, !3, !2}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15, !10}
!15 = distinct !{!15, !11}
!16 = !{!15}
!17 = distinct !{!17, !2, !3}
!18 = distinct !{!18, !2}
!19 = !{ptr @_Z27__device_stub__atax_kernel1iiPfS_S_}
!20 = !{ptr @_Z27__device_stub__atax_kernel2iiPfS_S_}
!21 = distinct !{!21, !2, !3}
!22 = !{!23}
!23 = distinct !{!23, !24}
!24 = distinct !{!24, !"LVerDomain"}
!25 = !{!26}
!26 = distinct !{!26, !24}
!27 = !{!28, !23}
!28 = distinct !{!28, !24}
!29 = !{!28}
!30 = distinct !{!30, !2, !3}
!31 = distinct !{!31, !2}
!32 = distinct !{!32, !2, !3}
