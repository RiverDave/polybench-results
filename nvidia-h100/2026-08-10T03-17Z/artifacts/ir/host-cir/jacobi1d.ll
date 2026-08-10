; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/JACOBI1D/jacobi1D.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/JACOBI1D/jacobi1D.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.timeval = type { i64, i64 }

@.str = private constant [74 x i8] c"Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\0A\00", align 1
@polybench_papi_counters_threadid = dso_local local_unnamed_addr global i32 0, align 4
@polybench_program_total_flops = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_t_start = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_t_end = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_c_start = dso_local local_unnamed_addr global i64 0, align 8
@polybench_c_end = dso_local local_unnamed_addr global i64 0, align 8
@.str.5 = private constant [7 x i8] c"%0.6f\0A\00", align 1
@.str.6 = private constant [35 x i8] c"Error return from gettimeofday: %d\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.7 = private constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1
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
define dso_local void @_Z10init_arrayiPfS_(i32 noundef %0, ptr nofree noundef writeonly captures(none) %1, ptr nofree noundef writeonly captures(none) %2) local_unnamed_addr #1 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = ptrtoaddr ptr %2 to i64
  %6 = ptrtoaddr ptr %1 to i64
  %wide.trip.count = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  %7 = sub i64 %6, %5
  %diff.check = icmp ugt i64 %7, -16
  %or.cond = or i1 %min.iters.check, %diff.check
  br i1 %or.cond, label %.lr.ph.preheader10, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.preheader
  %n.vec = and i64 %wide.trip.count, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %8 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %9 = fmul nnan <4 x float> %8, splat (float 4.000000e+00)
  %10 = fadd nnan <4 x float> %9, splat (float 1.000000e+01)
  %11 = fmul nnan <4 x float> %10, splat (float f0x39800000)
  %12 = getelementptr [4 x i8], ptr %1, i64 %index
  store <4 x float> %11, ptr %12, align 4
  %13 = fmul nnan <4 x float> %8, splat (float 7.000000e+00)
  %14 = fadd nnan <4 x float> %13, splat (float 1.100000e+01)
  %15 = fmul nnan <4 x float> %14, splat (float f0x39800000)
  %16 = getelementptr [4 x i8], ptr %2, i64 %index
  store <4 x float> %15, ptr %16, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph.preheader10

.lr.ph.preheader10:                               ; preds = %.lr.ph.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %middle.block ]
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader10
  %18 = trunc nuw nsw i64 %indvars.iv.ph to i32
  %19 = uitofp nneg i32 %18 to float
  %20 = getelementptr [4 x i8], ptr %1, i64 %indvars.iv.ph
  %21 = insertelement <2 x float> poison, float %19, i64 0
  %22 = shufflevector <2 x float> %21, <2 x float> poison, <2 x i32> zeroinitializer
  %23 = fmul nnan <2 x float> %22, <float 4.000000e+00, float 7.000000e+00>
  %24 = fadd nnan <2 x float> %23, <float 1.000000e+01, float 1.100000e+01>
  %25 = fmul nnan <2 x float> %24, splat (float f0x39800000)
  %26 = extractelement <2 x float> %25, i64 0
  store float %26, ptr %20, align 4
  %27 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv.ph
  %28 = extractelement <2 x float> %25, i64 1
  store float %28, ptr %27, align 4
  %indvars.iv.next.prol = or disjoint i64 %indvars.iv.ph, 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader10
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %.lr.ph.preheader10 ], [ %indvars.iv.next.prol, %.lr.ph.prol ]
  %29 = add nsw i64 %wide.trip.count, -1
  %30 = icmp eq i64 %indvars.iv.ph, %29
  br i1 %30, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.prol.loopexit, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr, %.lr.ph.prol.loopexit ]
  %31 = trunc nuw nsw i64 %indvars.iv to i32
  %32 = uitofp nneg i32 %31 to float
  %33 = getelementptr [4 x i8], ptr %1, i64 %indvars.iv
  %34 = insertelement <2 x float> poison, float %32, i64 0
  %35 = shufflevector <2 x float> %34, <2 x float> poison, <2 x i32> zeroinitializer
  %36 = fmul nnan <2 x float> %35, <float 4.000000e+00, float 7.000000e+00>
  %37 = fadd nnan <2 x float> %36, <float 1.000000e+01, float 1.100000e+01>
  %38 = fmul nnan <2 x float> %37, splat (float f0x39800000)
  %39 = extractelement <2 x float> %38, i64 0
  store float %39, ptr %33, align 4
  %40 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv
  %41 = extractelement <2 x float> %38, i64 1
  store float %41, ptr %40, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = trunc nuw nsw i64 %indvars.iv.next to i32
  %43 = uitofp nneg i32 %42 to float
  %44 = getelementptr [4 x i8], ptr %1, i64 %indvars.iv.next
  %45 = insertelement <2 x float> poison, float %43, i64 0
  %46 = shufflevector <2 x float> %45, <2 x float> poison, <2 x i32> zeroinitializer
  %47 = fmul nnan <2 x float> %46, <float 4.000000e+00, float 7.000000e+00>
  %48 = fadd nnan <2 x float> %47, <float 1.000000e+01, float 1.100000e+01>
  %49 = fmul nnan <2 x float> %48, splat (float f0x39800000)
  %50 = extractelement <2 x float> %49, i64 0
  store float %50, ptr %44, align 4
  %51 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv.next
  %52 = extractelement <2 x float> %49, i64 1
  store float %52, ptr %51, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.not.1, label %._crit_edge, label %.lr.ph, !llvm.loop !4

._crit_edge:                                      ; preds = %.lr.ph.prol.loopexit, %.lr.ph, %middle.block, %3
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z14runJacobi1DCpuiiPfS_(i32 noundef %0, i32 noundef %1, ptr nofree noundef captures(none) %2, ptr nofree noundef captures(none) %3) local_unnamed_addr #2 {
  %5 = ptrtoaddr ptr %3 to i64
  %6 = ptrtoaddr ptr %2 to i64
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %1, 2
  %or.cond = and i1 %7, %8
  br i1 %or.cond, label %.preheader23.us.us.preheader, label %._crit_edge28

.preheader23.us.us.preheader:                     ; preds = %4
  %9 = add nsw i32 %1, -1
  %wide.trip.count = zext i32 %9 to i64
  %scevgep = getelementptr i8, ptr %3, i64 4
  %10 = shl nuw nsw i64 %wide.trip.count, 2
  %scevgep40 = getelementptr i8, ptr %3, i64 %10
  %11 = getelementptr i8, ptr %2, i64 %10
  %scevgep41 = getelementptr i8, ptr %11, i64 4
  %12 = add nsw i64 %wide.trip.count, -1
  %min.iters.check43 = icmp ult i64 %12, 4
  %bound0 = icmp ult ptr %scevgep, %scevgep41
  %bound1 = icmp ult ptr %2, %scevgep40
  %found.conflict = and i1 %bound0, %bound1
  %n.vec46 = and i64 %12, -4
  %13 = or disjoint i64 %n.vec46, 1
  %cmp.n54 = icmp eq i64 %12, %n.vec46
  %14 = and i32 %1, 1
  %lcmp.mod.not = icmp eq i32 %14, 0
  %15 = add nsw i64 %wide.trip.count, -1
  %16 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i64 %16, 8
  %17 = sub i64 %5, %6
  %diff.check = icmp ugt i64 %17, -32
  %or.cond56 = or i1 %min.iters.check, %diff.check
  %n.vec = and i64 %16, -8
  %18 = or disjoint i64 %n.vec, 1
  %cmp.n = icmp eq i64 %16, %n.vec
  br label %.preheader23.us.us

.preheader23.us.us:                               ; preds = %.preheader23.us.us.preheader, %._crit_edge.us.us
  %.027.us.us = phi i32 [ %92, %._crit_edge.us.us ], [ 0, %.preheader23.us.us.preheader ]
  %brmerge = select i1 %min.iters.check43, i1 true, i1 %found.conflict
  br i1 %brmerge, label %scalar.ph42.preheader, label %vector.body47

vector.body47:                                    ; preds = %.preheader23.us.us, %vector.body47
  %index48 = phi i64 [ %index.next52, %vector.body47 ], [ 0, %.preheader23.us.us ]
  %19 = or disjoint i64 %index48, 1
  %20 = getelementptr [4 x i8], ptr %2, i64 %19
  %21 = getelementptr i8, ptr %20, i64 -4
  %wide.load49 = load <4 x float>, ptr %21, align 4, !alias.scope !5
  %wide.load50 = load <4 x float>, ptr %20, align 4, !alias.scope !5
  %22 = fadd <4 x float> %wide.load49, %wide.load50
  %23 = getelementptr [4 x i8], ptr %2, i64 %index48
  %24 = getelementptr i8, ptr %23, i64 8
  %wide.load51 = load <4 x float>, ptr %24, align 4, !alias.scope !5
  %25 = fadd <4 x float> %22, %wide.load51
  %26 = fpext <4 x float> %25 to <4 x double>
  %27 = fmul <4 x double> %26, splat (double 3.333300e-01)
  %28 = fptrunc <4 x double> %27 to <4 x float>
  %29 = getelementptr [4 x i8], ptr %3, i64 %19
  store <4 x float> %28, ptr %29, align 4, !alias.scope !8, !noalias !5
  %index.next52 = add nuw i64 %index48, 4
  %30 = icmp eq i64 %index.next52, %n.vec46
  br i1 %30, label %middle.block53, label %vector.body47, !llvm.loop !10

middle.block53:                                   ; preds = %vector.body47
  br i1 %cmp.n54, label %..preheader_crit_edge.us.us.preheader, label %scalar.ph42.preheader

scalar.ph42.preheader:                            ; preds = %.preheader23.us.us, %middle.block53
  %indvars.iv.ph = phi i64 [ %13, %middle.block53 ], [ 1, %.preheader23.us.us ]
  br i1 %lcmp.mod.not, label %scalar.ph42.prol.loopexit, label %scalar.ph42.prol

scalar.ph42.prol:                                 ; preds = %scalar.ph42.preheader
  %31 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv.ph
  %32 = getelementptr i8, ptr %31, i64 -4
  %33 = load float, ptr %32, align 4
  %34 = load float, ptr %31, align 4
  %35 = fadd float %33, %34
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  %36 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv.next.prol
  %37 = load float, ptr %36, align 4
  %38 = fadd float %35, %37
  %39 = fpext float %38 to double
  %40 = fmul double %39, 3.333300e-01
  %41 = fptrunc double %40 to float
  %42 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv.ph
  store float %41, ptr %42, align 4
  br label %scalar.ph42.prol.loopexit

scalar.ph42.prol.loopexit:                        ; preds = %scalar.ph42.prol, %scalar.ph42.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph42.preheader ], [ %indvars.iv.next.prol, %scalar.ph42.prol ]
  %43 = icmp eq i64 %indvars.iv.ph, %15
  br i1 %43, label %..preheader_crit_edge.us.us.preheader, label %scalar.ph42

scalar.ph42:                                      ; preds = %scalar.ph42.prol.loopexit, %scalar.ph42
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %scalar.ph42 ], [ %indvars.iv.unr, %scalar.ph42.prol.loopexit ]
  %44 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv
  %45 = getelementptr i8, ptr %44, i64 -4
  %46 = load float, ptr %45, align 4
  %47 = load float, ptr %44, align 4
  %48 = fadd float %46, %47
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv.next
  %50 = load float, ptr %49, align 4
  %51 = fadd float %48, %50
  %52 = fpext float %51 to double
  %53 = fmul double %52, 3.333300e-01
  %54 = fptrunc double %53 to float
  %55 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv
  store float %54, ptr %55, align 4
  %56 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv.next
  %57 = getelementptr i8, ptr %56, i64 -4
  %58 = load float, ptr %57, align 4
  %59 = load float, ptr %56, align 4
  %60 = fadd float %58, %59
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %61 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv.next.1
  %62 = load float, ptr %61, align 4
  %63 = fadd float %60, %62
  %64 = fpext float %63 to double
  %65 = fmul double %64, 3.333300e-01
  %66 = fptrunc double %65 to float
  %67 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv.next
  store float %66, ptr %67, align 4
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.not.1, label %..preheader_crit_edge.us.us.preheader, label %scalar.ph42, !llvm.loop !11

..preheader_crit_edge.us.us.preheader:            ; preds = %scalar.ph42.prol.loopexit, %scalar.ph42, %middle.block53
  br i1 %or.cond56, label %..preheader_crit_edge.us.us.preheader57, label %vector.body

vector.body:                                      ; preds = %..preheader_crit_edge.us.us.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %..preheader_crit_edge.us.us.preheader ]
  %68 = or disjoint i64 %index, 1
  %69 = getelementptr [4 x i8], ptr %3, i64 %68
  %70 = getelementptr i8, ptr %69, i64 16
  %wide.load = load <4 x float>, ptr %69, align 4
  %wide.load38 = load <4 x float>, ptr %70, align 4
  %71 = getelementptr [4 x i8], ptr %2, i64 %68
  %72 = getelementptr i8, ptr %71, i64 16
  store <4 x float> %wide.load, ptr %71, align 4
  store <4 x float> %wide.load38, ptr %72, align 4
  %index.next = add nuw i64 %index, 8
  %73 = icmp eq i64 %index.next, %n.vec
  br i1 %73, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us.us, label %..preheader_crit_edge.us.us.preheader57

..preheader_crit_edge.us.us.preheader57:          ; preds = %..preheader_crit_edge.us.us.preheader, %middle.block
  %indvars.iv31.ph = phi i64 [ 1, %..preheader_crit_edge.us.us.preheader ], [ %18, %middle.block ]
  %74 = sub nsw i64 %wide.trip.count, %indvars.iv31.ph
  %xtraiter58 = and i64 %74, 3
  %lcmp.mod59.not = icmp eq i64 %xtraiter58, 0
  br i1 %lcmp.mod59.not, label %..preheader_crit_edge.us.us.prol.loopexit, label %..preheader_crit_edge.us.us.prol

..preheader_crit_edge.us.us.prol:                 ; preds = %..preheader_crit_edge.us.us.preheader57, %..preheader_crit_edge.us.us.prol
  %indvars.iv31.prol = phi i64 [ %indvars.iv.next32.prol, %..preheader_crit_edge.us.us.prol ], [ %indvars.iv31.ph, %..preheader_crit_edge.us.us.preheader57 ]
  %prol.iter = phi i64 [ %prol.iter.next, %..preheader_crit_edge.us.us.prol ], [ 0, %..preheader_crit_edge.us.us.preheader57 ]
  %75 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv31.prol
  %76 = load float, ptr %75, align 4
  %77 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv31.prol
  store float %76, ptr %77, align 4
  %indvars.iv.next32.prol = add nuw nsw i64 %indvars.iv31.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter58
  br i1 %prol.iter.cmp.not, label %..preheader_crit_edge.us.us.prol.loopexit, label %..preheader_crit_edge.us.us.prol, !llvm.loop !13

..preheader_crit_edge.us.us.prol.loopexit:        ; preds = %..preheader_crit_edge.us.us.prol, %..preheader_crit_edge.us.us.preheader57
  %indvars.iv31.unr = phi i64 [ %indvars.iv31.ph, %..preheader_crit_edge.us.us.preheader57 ], [ %indvars.iv.next32.prol, %..preheader_crit_edge.us.us.prol ]
  %78 = sub nsw i64 %indvars.iv31.ph, %wide.trip.count
  %79 = icmp ugt i64 %78, -4
  br i1 %79, label %._crit_edge.us.us, label %..preheader_crit_edge.us.us

..preheader_crit_edge.us.us:                      ; preds = %..preheader_crit_edge.us.us.prol.loopexit, %..preheader_crit_edge.us.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.3, %..preheader_crit_edge.us.us ], [ %indvars.iv31.unr, %..preheader_crit_edge.us.us.prol.loopexit ]
  %80 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv31
  %81 = load float, ptr %80, align 4
  %82 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv31
  store float %81, ptr %82, align 4
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %83 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv.next32
  %84 = load float, ptr %83, align 4
  %85 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv.next32
  store float %84, ptr %85, align 4
  %indvars.iv.next32.1 = add nuw nsw i64 %indvars.iv31, 2
  %86 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv.next32.1
  %87 = load float, ptr %86, align 4
  %88 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv.next32.1
  store float %87, ptr %88, align 4
  %indvars.iv.next32.2 = add nuw nsw i64 %indvars.iv31, 3
  %89 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv.next32.2
  %90 = load float, ptr %89, align 4
  %91 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv.next32.2
  store float %90, ptr %91, align 4
  %indvars.iv.next32.3 = add nuw nsw i64 %indvars.iv31, 4
  %exitcond35.not.3 = icmp eq i64 %indvars.iv.next32.3, %wide.trip.count
  br i1 %exitcond35.not.3, label %._crit_edge.us.us, label %..preheader_crit_edge.us.us, !llvm.loop !15

._crit_edge.us.us:                                ; preds = %..preheader_crit_edge.us.us.prol.loopexit, %..preheader_crit_edge.us.us, %middle.block
  %92 = add nuw nsw i32 %.027.us.us, 1
  %exitcond36.not = icmp eq i32 %92, %0
  br i1 %exitcond36.not, label %._crit_edge28, label %.preheader23.us.us

._crit_edge28:                                    ; preds = %._crit_edge.us.us, %4
  ret void
}

declare dso_local i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare dso_local i32 @cudaLaunchKernel(ptr, %struct.dim3, %struct.dim3, ptr, i64, ptr) local_unnamed_addr

define dso_local void @_Z36__device_stub__runJacobiCUDA_kernel1iPfS_(i32 noundef %0, ptr noundef %1, ptr noundef %2) #3 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = alloca [3 x ptr], align 16
  store ptr %4, ptr %7, align 16
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 8
  store ptr %5, ptr %8, align 8
  %9 = getelementptr inbounds nuw i8, ptr %7, i64 16
  store ptr %6, ptr %9, align 16
  %10 = alloca %struct.dim3, align 8
  %11 = alloca %struct.dim3, align 8
  %12 = alloca i64, align 8
  %13 = alloca ptr, align 8
  %14 = call i32 @__cudaPopCallConfiguration(ptr nonnull %10, ptr nonnull %11, ptr nonnull %12, ptr nonnull %13)
  %15 = load i64, ptr %12, align 8
  %16 = load ptr, ptr %13, align 8
  %.fca.0.load2 = load i32, ptr %10, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %10, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %10, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %11, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %11, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %11, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %17 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z36__device_stub__runJacobiCUDA_kernel1iPfS_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %7, i64 noundef %15, ptr noundef %16)
  ret void
}

define dso_local void @_Z36__device_stub__runJacobiCUDA_kernel2iPfS_(i32 noundef %0, ptr noundef %1, ptr noundef %2) #3 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = alloca [3 x ptr], align 16
  store ptr %4, ptr %7, align 16
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 8
  store ptr %5, ptr %8, align 8
  %9 = getelementptr inbounds nuw i8, ptr %7, i64 16
  store ptr %6, ptr %9, align 16
  %10 = alloca %struct.dim3, align 8
  %11 = alloca %struct.dim3, align 8
  %12 = alloca i64, align 8
  %13 = alloca ptr, align 8
  %14 = call i32 @__cudaPopCallConfiguration(ptr nonnull %10, ptr nonnull %11, ptr nonnull %12, ptr nonnull %13)
  %15 = load i64, ptr %12, align 8
  %16 = load ptr, ptr %13, align 8
  %.fca.0.load2 = load i32, ptr %10, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %10, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %10, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %11, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %11, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %11, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %17 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z36__device_stub__runJacobiCUDA_kernel2iPfS_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %7, i64 noundef %15, ptr noundef %16)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiPfS_S_S_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef readonly captures(none) %4) local_unnamed_addr #5 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %5
  %wide.trip.count = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  br i1 %min.iters.check, label %.lr.ph.preheader60, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.preheader
  %n.vec = and i64 %wide.trip.count, 2147483644
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %39, %vector.body ]
  %7 = getelementptr [4 x i8], ptr %1, i64 %index
  %wide.load = load <4 x float>, ptr %7, align 4
  %8 = fpext <4 x float> %wide.load to <4 x double>
  %9 = getelementptr [4 x i8], ptr %2, i64 %index
  %wide.load41 = load <4 x float>, ptr %9, align 4
  %10 = fpext <4 x float> %wide.load41 to <4 x double>
  %11 = fcmp olt <4 x double> %8, splat (double f0xB690000000000000)
  %12 = fneg <4 x float> %wide.load
  %13 = select <4 x i1> %11, <4 x float> %12, <4 x float> %wide.load
  %14 = fpext <4 x float> %13 to <4 x double>
  %15 = fcmp uge <4 x double> %14, splat (double 1.000000e-02)
  %16 = fcmp olt <4 x double> %10, splat (double f0xB690000000000000)
  %17 = fneg <4 x float> %wide.load41
  %18 = select <4 x i1> %16, <4 x float> %17, <4 x float> %wide.load41
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
  %index.next = add nuw i64 %index, 4
  %40 = icmp eq i64 %index.next, %n.vec
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  %41 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %39)
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %.lr.ph31.preheader, label %.lr.ph.preheader60

.lr.ph.preheader60:                               ; preds = %.lr.ph.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %middle.block ]
  %.028.ph = phi i32 [ 0, %.lr.ph.preheader ], [ %41, %middle.block ]
  br label %.lr.ph

.lr.ph31.preheader:                               ; preds = %_Z11percentDiffdd.exit, %middle.block
  %.1.lcssa = phi i32 [ %41, %middle.block ], [ %.1, %_Z11percentDiffdd.exit ]
  %wide.trip.count37 = zext nneg i32 %0 to i64
  %min.iters.check43 = icmp ult i32 %0, 4
  br i1 %min.iters.check43, label %.lr.ph31.preheader59, label %vector.ph44

vector.ph44:                                      ; preds = %.lr.ph31.preheader
  %n.vec46 = and i64 %wide.trip.count, 2147483644
  %42 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.1.lcssa, i64 0
  br label %vector.body47

vector.body47:                                    ; preds = %vector.body47, %vector.ph44
  %index48 = phi i64 [ 0, %vector.ph44 ], [ %index.next53, %vector.body47 ]
  %vec.phi49 = phi <4 x i32> [ %42, %vector.ph44 ], [ %75, %vector.body47 ]
  %43 = getelementptr [4 x i8], ptr %3, i64 %index48
  %wide.load50 = load <4 x float>, ptr %43, align 4
  %44 = fpext <4 x float> %wide.load50 to <4 x double>
  %45 = getelementptr [4 x i8], ptr %4, i64 %index48
  %wide.load51 = load <4 x float>, ptr %45, align 4
  %46 = fpext <4 x float> %wide.load51 to <4 x double>
  %47 = fcmp olt <4 x double> %44, splat (double f0xB690000000000000)
  %48 = fneg <4 x float> %wide.load50
  %49 = select <4 x i1> %47, <4 x float> %48, <4 x float> %wide.load50
  %50 = fpext <4 x float> %49 to <4 x double>
  %51 = fcmp uge <4 x double> %50, splat (double 1.000000e-02)
  %52 = fcmp olt <4 x double> %46, splat (double f0xB690000000000000)
  %53 = fneg <4 x float> %wide.load51
  %54 = select <4 x i1> %52, <4 x float> %53, <4 x float> %wide.load51
  %55 = fpext <4 x float> %54 to <4 x double>
  %56 = fcmp uge <4 x double> %55, splat (double 1.000000e-02)
  %57 = select <4 x i1> %51, <4 x i1> splat (i1 true), <4 x i1> %56
  %58 = fsub <4 x double> %44, %46
  %59 = fptrunc <4 x double> %58 to <4 x float>
  %60 = fcmp olt <4 x double> %58, splat (double f0xB690000000000000)
  %61 = fneg <4 x float> %59
  %62 = select <4 x i1> %60, <4 x float> %61, <4 x float> %59
  %63 = fadd <4 x double> %44, splat (double f0x3E45798EE0000000)
  %64 = fptrunc <4 x double> %63 to <4 x float>
  %65 = fcmp olt <4 x double> %63, splat (double f0xB690000000000000)
  %66 = fneg <4 x float> %64
  %67 = select <4 x i1> %65, <4 x float> %66, <4 x float> %64
  %68 = fdiv <4 x float> %62, %67
  %69 = fcmp olt <4 x float> %68, zeroinitializer
  %70 = fneg <4 x float> %68
  %71 = select <4 x i1> %69, <4 x float> %70, <4 x float> %68
  %72 = fmul <4 x float> %71, splat (float 1.000000e+02)
  %73 = fpext <4 x float> %72 to <4 x double>
  %74 = fcmp ogt <4 x double> %73, splat (double 5.000000e-02)
  %narrow58 = select <4 x i1> %57, <4 x i1> %74, <4 x i1> zeroinitializer
  %predphi52 = zext <4 x i1> %narrow58 to <4 x i32>
  %75 = add <4 x i32> %vec.phi49, %predphi52
  %index.next53 = add nuw i64 %index48, 4
  %76 = icmp eq i64 %index.next53, %n.vec46
  br i1 %76, label %middle.block54, label %vector.body47, !llvm.loop !17

middle.block54:                                   ; preds = %vector.body47
  %77 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %75)
  %cmp.n55 = icmp eq i64 %n.vec46, %wide.trip.count
  br i1 %cmp.n55, label %._crit_edge, label %.lr.ph31.preheader59

.lr.ph31.preheader59:                             ; preds = %.lr.ph31.preheader, %middle.block54
  %indvars.iv34.ph = phi i64 [ 0, %.lr.ph31.preheader ], [ %n.vec46, %middle.block54 ]
  %.230.ph = phi i32 [ %.1.lcssa, %.lr.ph31.preheader ], [ %77, %middle.block54 ]
  br label %.lr.ph31

.lr.ph:                                           ; preds = %.lr.ph.preheader60, %_Z11percentDiffdd.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit ], [ %indvars.iv.ph, %.lr.ph.preheader60 ]
  %.028 = phi i32 [ %.1, %_Z11percentDiffdd.exit ], [ %.028.ph, %.lr.ph.preheader60 ]
  %78 = getelementptr [4 x i8], ptr %1, i64 %indvars.iv
  %79 = load float, ptr %78, align 4
  %80 = fpext float %79 to double
  %81 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv
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
  %107 = fpext float %106 to double
  %108 = fcmp ogt double %107, 5.000000e-02
  %109 = zext i1 %108 to i32
  br label %_Z11percentDiffdd.exit

_Z11percentDiffdd.exit:                           ; preds = %88, %.critedge.i
  %common.ret.op.i = phi i32 [ %109, %.critedge.i ], [ 0, %88 ]
  %.1 = add nuw nsw i32 %common.ret.op.i, %.028
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %.lr.ph31.preheader, label %.lr.ph, !llvm.loop !18

.lr.ph31:                                         ; preds = %.lr.ph31.preheader59, %_Z11percentDiffdd.exit26
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %_Z11percentDiffdd.exit26 ], [ %indvars.iv34.ph, %.lr.ph31.preheader59 ]
  %.230 = phi i32 [ %.3, %_Z11percentDiffdd.exit26 ], [ %.230.ph, %.lr.ph31.preheader59 ]
  %110 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv34
  %111 = load float, ptr %110, align 4
  %112 = fpext float %111 to double
  %113 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv34
  %114 = load float, ptr %113, align 4
  %115 = fpext float %114 to double
  %116 = fcmp olt double %112, f0xB690000000000000
  %117 = fneg float %111
  %common.ret.op.i.i19 = select i1 %116, float %117, float %111
  %118 = fpext float %common.ret.op.i.i19 to double
  %119 = fcmp olt double %118, 1.000000e-02
  br i1 %119, label %120, label %.critedge.i20

120:                                              ; preds = %.lr.ph31
  %121 = fcmp olt double %115, f0xB690000000000000
  %122 = fneg float %114
  %common.ret.op.i7.i25 = select i1 %121, float %122, float %114
  %123 = fpext float %common.ret.op.i7.i25 to double
  %124 = fcmp olt double %123, 1.000000e-02
  br i1 %124, label %_Z11percentDiffdd.exit26, label %.critedge.i20

.critedge.i20:                                    ; preds = %120, %.lr.ph31
  %125 = insertelement <2 x double> poison, double %112, i64 0
  %126 = shufflevector <2 x double> %125, <2 x double> poison, <2 x i32> zeroinitializer
  %127 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %115, i64 0
  %128 = fsub <2 x double> %126, %127
  %129 = fptrunc <2 x double> %128 to <2 x float>
  %130 = fcmp olt <2 x double> %128, splat (double f0xB690000000000000)
  %131 = fneg <2 x float> %129
  %132 = select <2 x i1> %130, <2 x float> %131, <2 x float> %129
  %133 = extractelement <2 x float> %132, i64 0
  %134 = extractelement <2 x float> %132, i64 1
  %135 = fdiv float %133, %134
  %136 = fcmp olt float %135, 0.000000e+00
  %137 = fneg float %135
  %common.ret.op.i10.i23 = select i1 %136, float %137, float %135
  %138 = fmul float %common.ret.op.i10.i23, 1.000000e+02
  %139 = fpext float %138 to double
  %140 = fcmp ogt double %139, 5.000000e-02
  %141 = zext i1 %140 to i32
  br label %_Z11percentDiffdd.exit26

_Z11percentDiffdd.exit26:                         ; preds = %120, %.critedge.i20
  %common.ret.op.i24 = phi i32 [ %141, %.critedge.i20 ], [ 0, %120 ]
  %.3 = add nuw nsw i32 %common.ret.op.i24, %.230
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %._crit_edge, label %.lr.ph31, !llvm.loop !19

._crit_edge:                                      ; preds = %_Z11percentDiffdd.exit26, %middle.block54, %5
  %.2.lcssa = phi i32 [ 0, %5 ], [ %77, %middle.block54 ], [ %.3, %_Z11percentDiffdd.exit26 ]
  %142 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %.2.lcssa) #6
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
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #13
  %.not.i = icmp eq i32 %2, 0
  br i1 %.not.i, label %_ZL7rtclockv.exit, label %3

3:                                                ; preds = %0
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %2) #6
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
  %2 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #13
  %.not.i = icmp eq i32 %2, 0
  br i1 %.not.i, label %_ZL7rtclockv.exit, label %3

3:                                                ; preds = %0
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %2) #6
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
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, double noundef %3) #6
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #6

define dso_local void @_Z15runJacobi1DCUDAiiPfS_S_S_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) local_unnamed_addr #3 {
  %7 = alloca %struct.timeval, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca [3 x ptr], align 16
  %12 = alloca %struct.dim3, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca i64, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca [3 x ptr], align 16
  %20 = alloca %struct.dim3, align 8
  %21 = alloca %struct.dim3, align 8
  %22 = alloca i64, align 8
  %23 = alloca ptr, align 8
  %24 = alloca %struct.timeval, align 8
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = call noundef i32 @cudaMalloc(ptr noundef nonnull %25, i64 noundef 16384) #6
  %28 = call noundef i32 @cudaMalloc(ptr noundef nonnull %26, i64 noundef 16384) #6
  %29 = load ptr, ptr %25, align 8
  %30 = call i32 @cudaMemcpy(ptr noundef %29, ptr noundef %2, i64 noundef 16384, i32 noundef 1) #6
  %31 = load ptr, ptr %26, align 8
  %32 = call i32 @cudaMemcpy(ptr noundef %31, ptr noundef %3, i64 noundef 16384, i32 noundef 1) #6
  call void @llvm.lifetime.start.p0(ptr nonnull %24)
  %33 = call i32 @gettimeofday(ptr noundef nonnull %24, ptr noundef null) #13
  %.not.i.i = icmp eq i32 %33, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %34

34:                                               ; preds = %6
  %35 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %33) #6
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %6, %34
  %36 = load i64, ptr %24, align 8
  %37 = sitofp i64 %36 to double
  %38 = getelementptr inbounds nuw i8, ptr %24, i64 8
  %39 = load i64, ptr %38, align 8
  %40 = sitofp i64 %39 to double
  %41 = fmul nnan double %40, f0x3EB0C6F7A0B5ED8D
  %42 = fadd double %41, %37
  call void @llvm.lifetime.end.p0(ptr nonnull %24)
  store double %42, ptr @polybench_t_start, align 8
  %43 = icmp sgt i32 %0, 0
  br i1 %43, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %_Z21polybench_timer_startv.exit
  %44 = getelementptr inbounds nuw i8, ptr %19, i64 8
  %45 = getelementptr inbounds nuw i8, ptr %19, i64 16
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %20, i64 4
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %20, i64 8
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %21, i64 4
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %21, i64 8
  %46 = getelementptr inbounds nuw i8, ptr %11, i64 8
  %47 = getelementptr inbounds nuw i8, ptr %11, i64 16
  %.fca.1.gep4.i29 = getelementptr inbounds nuw i8, ptr %12, i64 4
  %.fca.2.gep7.i32 = getelementptr inbounds nuw i8, ptr %12, i64 8
  %.fca.1.gep.i37 = getelementptr inbounds nuw i8, ptr %13, i64 4
  %.fca.2.gep.i40 = getelementptr inbounds nuw i8, ptr %13, i64 8
  br label %48

48:                                               ; preds = %.lr.ph, %67
  %.052 = phi i32 [ 0, %.lr.ph ], [ %69, %67 ]
  %49 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 16, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #6
  %.not = icmp eq i32 %49, 0
  br i1 %.not, label %50, label %57

50:                                               ; preds = %48
  %51 = load ptr, ptr %25, align 8
  %52 = load ptr, ptr %26, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %16)
  call void @llvm.lifetime.start.p0(ptr nonnull %17)
  call void @llvm.lifetime.start.p0(ptr nonnull %18)
  call void @llvm.lifetime.start.p0(ptr nonnull %19)
  call void @llvm.lifetime.start.p0(ptr nonnull %20)
  call void @llvm.lifetime.start.p0(ptr nonnull %21)
  call void @llvm.lifetime.start.p0(ptr nonnull %22)
  call void @llvm.lifetime.start.p0(ptr nonnull %23)
  store i32 %1, ptr %16, align 4
  store ptr %51, ptr %17, align 8
  store ptr %52, ptr %18, align 8
  store ptr %16, ptr %19, align 16
  store ptr %17, ptr %44, align 8
  store ptr %18, ptr %45, align 16
  %53 = call i32 @__cudaPopCallConfiguration(ptr nonnull %20, ptr nonnull %21, ptr nonnull %22, ptr nonnull %23), !inline_history !20
  %54 = load i64, ptr %22, align 8
  %55 = load ptr, ptr %23, align 8
  %.fca.0.load2.i = load i32, ptr %20, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %21, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %56 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z36__device_stub__runJacobiCUDA_kernel1iPfS_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %19, i64 noundef %54, ptr noundef %55), !inline_history !20
  call void @llvm.lifetime.end.p0(ptr nonnull %16)
  call void @llvm.lifetime.end.p0(ptr nonnull %17)
  call void @llvm.lifetime.end.p0(ptr nonnull %18)
  call void @llvm.lifetime.end.p0(ptr nonnull %19)
  call void @llvm.lifetime.end.p0(ptr nonnull %20)
  call void @llvm.lifetime.end.p0(ptr nonnull %21)
  call void @llvm.lifetime.end.p0(ptr nonnull %22)
  call void @llvm.lifetime.end.p0(ptr nonnull %23)
  br label %57

57:                                               ; preds = %48, %50
  %58 = call i32 @cudaThreadSynchronize() #6
  %59 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 16, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #6
  %.not26 = icmp eq i32 %59, 0
  br i1 %.not26, label %60, label %67

60:                                               ; preds = %57
  %61 = load ptr, ptr %25, align 8
  %62 = load ptr, ptr %26, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  call void @llvm.lifetime.start.p0(ptr nonnull %15)
  store i32 %1, ptr %8, align 4
  store ptr %61, ptr %9, align 8
  store ptr %62, ptr %10, align 8
  store ptr %8, ptr %11, align 16
  store ptr %9, ptr %46, align 8
  store ptr %10, ptr %47, align 16
  %63 = call i32 @__cudaPopCallConfiguration(ptr nonnull %12, ptr nonnull %13, ptr nonnull %14, ptr nonnull %15), !inline_history !21
  %64 = load i64, ptr %14, align 8
  %65 = load ptr, ptr %15, align 8
  %.fca.0.load2.i27 = load i32, ptr %12, align 8
  %.fca.0.insert3.i28 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i27, 0
  %.fca.1.load5.i30 = load i32, ptr %.fca.1.gep4.i29, align 4
  %.fca.1.insert6.i31 = insertvalue %struct.dim3 %.fca.0.insert3.i28, i32 %.fca.1.load5.i30, 1
  %.fca.2.load8.i33 = load i32, ptr %.fca.2.gep7.i32, align 8
  %.fca.2.insert9.i34 = insertvalue %struct.dim3 %.fca.1.insert6.i31, i32 %.fca.2.load8.i33, 2
  %.fca.0.load.i35 = load i32, ptr %13, align 8
  %.fca.0.insert.i36 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i35, 0
  %.fca.1.load.i38 = load i32, ptr %.fca.1.gep.i37, align 4
  %.fca.1.insert.i39 = insertvalue %struct.dim3 %.fca.0.insert.i36, i32 %.fca.1.load.i38, 1
  %.fca.2.load.i41 = load i32, ptr %.fca.2.gep.i40, align 8
  %.fca.2.insert.i42 = insertvalue %struct.dim3 %.fca.1.insert.i39, i32 %.fca.2.load.i41, 2
  %66 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z36__device_stub__runJacobiCUDA_kernel2iPfS_, %struct.dim3 %.fca.2.insert9.i34, %struct.dim3 %.fca.2.insert.i42, ptr noundef nonnull %11, i64 noundef %64, ptr noundef %65), !inline_history !21
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  call void @llvm.lifetime.end.p0(ptr nonnull %13)
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  call void @llvm.lifetime.end.p0(ptr nonnull %15)
  br label %67

67:                                               ; preds = %57, %60
  %68 = call i32 @cudaThreadSynchronize() #6
  %69 = add nuw nsw i32 %.052, 1
  %exitcond.not = icmp eq i32 %69, %0
  br i1 %exitcond.not, label %._crit_edge, label %48

._crit_edge:                                      ; preds = %67, %_Z21polybench_timer_startv.exit
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  %70 = call i32 @gettimeofday(ptr noundef nonnull %7, ptr noundef null) #13
  %.not.i.i43 = icmp eq i32 %70, 0
  br i1 %.not.i.i43, label %_Z20polybench_timer_stopv.exit, label %71

71:                                               ; preds = %._crit_edge
  %72 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %70) #6
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %._crit_edge, %71
  %73 = load i64, ptr %7, align 8
  %74 = sitofp i64 %73 to double
  %75 = getelementptr inbounds nuw i8, ptr %7, i64 8
  %76 = load i64, ptr %75, align 8
  %77 = sitofp i64 %76 to double
  %78 = fmul nnan double %77, f0x3EB0C6F7A0B5ED8D
  %79 = fadd double %78, %74
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  store double %79, ptr @polybench_t_end, align 8
  %80 = load double, ptr @polybench_t_start, align 8
  %81 = fsub double %79, %80
  %82 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, double noundef %81) #6
  %83 = load ptr, ptr %25, align 8
  %84 = call i32 @cudaMemcpy(ptr noundef %4, ptr noundef %83, i64 noundef 16384, i32 noundef 2) #6
  %85 = load ptr, ptr %26, align 8
  %86 = call i32 @cudaMemcpy(ptr noundef %5, ptr noundef %85, i64 noundef 16384, i32 noundef 2) #6
  %87 = load ptr, ptr %25, align 8
  %88 = call i32 @cudaFree(ptr noundef %87) #6
  %89 = load ptr, ptr %26, align 8
  %90 = call i32 @cudaFree(ptr noundef %89) #6
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
  %10 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %9) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_ZL7xmallocm.exit:                                ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  ret ptr %7
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #9

define dso_local noundef i32 @main(i32 noundef %0, ptr nofree noundef readnone captures(none) %1) local_unnamed_addr #3 {
  %3 = alloca %struct.timeval, align 8
  %4 = alloca %struct.timeval, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %9 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 16384) #13
  %10 = load ptr, ptr %8, align 8
  %11 = ptrtoaddr ptr %10 to i64
  %.not.i.i = icmp eq ptr %10, null
  %12 = icmp ne i32 %9, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %12
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %13 = load ptr, ptr @stderr, align 8
  %14 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %13) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %15 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 16384) #13
  %16 = load ptr, ptr %7, align 8
  %17 = ptrtoaddr ptr %16 to i64
  %.not.i.i22 = icmp eq ptr %16, null
  %18 = icmp ne i32 %15, 0
  %or.cond.i.i23 = select i1 %.not.i.i22, i1 true, i1 %18
  br i1 %or.cond.i.i23, label %.critedge.i.i24, label %_Z20polybench_alloc_datayi.exit25

.critedge.i.i24:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %19 = load ptr, ptr @stderr, align 8
  %20 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %19) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit25:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %21 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 16384) #13
  %22 = load ptr, ptr %6, align 8
  %.not.i.i26 = icmp eq ptr %22, null
  %23 = icmp ne i32 %21, 0
  %or.cond.i.i27 = select i1 %.not.i.i26, i1 true, i1 %23
  br i1 %or.cond.i.i27, label %.critedge.i.i28, label %_Z20polybench_alloc_datayi.exit29

.critedge.i.i28:                                  ; preds = %_Z20polybench_alloc_datayi.exit25
  %24 = load ptr, ptr @stderr, align 8
  %25 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %24) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit29:                ; preds = %_Z20polybench_alloc_datayi.exit25
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  store ptr null, ptr %5, align 8
  %26 = call i32 @posix_memalign(ptr noundef nonnull %5, i64 noundef 32, i64 noundef 16384) #13
  %27 = load ptr, ptr %5, align 8
  %.not.i.i30 = icmp eq ptr %27, null
  %28 = icmp ne i32 %26, 0
  %or.cond.i.i31 = select i1 %.not.i.i30, i1 true, i1 %28
  br i1 %or.cond.i.i31, label %.critedge.i.i32, label %_Z20polybench_alloc_datayi.exit33

.critedge.i.i32:                                  ; preds = %_Z20polybench_alloc_datayi.exit29
  %29 = load ptr, ptr @stderr, align 8
  %30 = call i64 @fwrite(ptr nonnull @.str.7, i64 50, i64 1, ptr %29) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit33:                ; preds = %_Z20polybench_alloc_datayi.exit29
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  %31 = sub i64 %11, %17
  %diff.check = icmp ugt i64 %31, -16
  br i1 %diff.check, label %.lr.ph.i, label %vector.body

vector.body:                                      ; preds = %_Z20polybench_alloc_datayi.exit33, %vector.body
  %index = phi i64 [ %index.next.1, %vector.body ], [ 0, %_Z20polybench_alloc_datayi.exit33 ]
  %vec.ind = phi <4 x i32> [ %vec.ind.next.1, %vector.body ], [ <i32 0, i32 1, i32 2, i32 3>, %_Z20polybench_alloc_datayi.exit33 ]
  %32 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %33 = fmul nnan <4 x float> %32, splat (float 4.000000e+00)
  %34 = fadd nnan <4 x float> %33, splat (float 1.000000e+01)
  %35 = fmul nnan <4 x float> %34, splat (float f0x39800000)
  %36 = getelementptr [4 x i8], ptr %10, i64 %index
  store <4 x float> %35, ptr %36, align 4
  %37 = fmul nnan <4 x float> %32, splat (float 7.000000e+00)
  %38 = fadd nnan <4 x float> %37, splat (float 1.100000e+01)
  %39 = fmul nnan <4 x float> %38, splat (float f0x39800000)
  %40 = getelementptr [4 x i8], ptr %16, i64 %index
  store <4 x float> %39, ptr %40, align 4
  %index.next = or disjoint i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %41 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %42 = fmul nnan <4 x float> %41, splat (float 4.000000e+00)
  %43 = fadd nnan <4 x float> %42, splat (float 1.000000e+01)
  %44 = fmul nnan <4 x float> %43, splat (float f0x39800000)
  %45 = getelementptr [4 x i8], ptr %10, i64 %index.next
  store <4 x float> %44, ptr %45, align 4
  %46 = fmul nnan <4 x float> %41, splat (float 7.000000e+00)
  %47 = fadd nnan <4 x float> %46, splat (float 1.100000e+01)
  %48 = fmul nnan <4 x float> %47, splat (float f0x39800000)
  %49 = getelementptr [4 x i8], ptr %16, i64 %index.next
  store <4 x float> %48, ptr %49, align 4
  %index.next.1 = add nuw nsw i64 %index, 8
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 8)
  %50 = icmp eq i64 %index.next.1, 4096
  br i1 %50, label %_Z10init_arrayiPfS_.exit, label %vector.body, !llvm.loop !22

.lr.ph.i:                                         ; preds = %_Z20polybench_alloc_datayi.exit33, %.lr.ph.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i.1, %.lr.ph.i ], [ 0, %_Z20polybench_alloc_datayi.exit33 ]
  %51 = trunc nuw nsw i64 %indvars.iv.i to i32
  %52 = uitofp nneg i32 %51 to float
  %53 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv.i
  %54 = insertelement <2 x float> poison, float %52, i64 0
  %55 = shufflevector <2 x float> %54, <2 x float> poison, <2 x i32> zeroinitializer
  %56 = fmul nnan <2 x float> %55, <float 4.000000e+00, float 7.000000e+00>
  %57 = fadd nnan <2 x float> %56, <float 1.000000e+01, float 1.100000e+01>
  %58 = fmul nnan <2 x float> %57, splat (float f0x39800000)
  %59 = extractelement <2 x float> %58, i64 0
  store float %59, ptr %53, align 4
  %60 = getelementptr [4 x i8], ptr %16, i64 %indvars.iv.i
  %61 = extractelement <2 x float> %58, i64 1
  store float %61, ptr %60, align 4
  %indvars.iv.next.i = or disjoint i64 %indvars.iv.i, 1
  %62 = trunc nuw nsw i64 %indvars.iv.next.i to i32
  %63 = uitofp nneg i32 %62 to float
  %64 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv.next.i
  %65 = insertelement <2 x float> poison, float %63, i64 0
  %66 = shufflevector <2 x float> %65, <2 x float> poison, <2 x i32> zeroinitializer
  %67 = fmul nnan <2 x float> %66, <float 4.000000e+00, float 7.000000e+00>
  %68 = fadd nnan <2 x float> %67, <float 1.000000e+01, float 1.100000e+01>
  %69 = fmul nnan <2 x float> %68, splat (float f0x39800000)
  %70 = extractelement <2 x float> %69, i64 0
  store float %70, ptr %64, align 4
  %71 = getelementptr [4 x i8], ptr %16, i64 %indvars.iv.next.i
  %72 = extractelement <2 x float> %69, i64 1
  store float %72, ptr %71, align 4
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %exitcond.not.i.1 = icmp eq i64 %indvars.iv.next.i.1, 4096
  br i1 %exitcond.not.i.1, label %_Z10init_arrayiPfS_.exit, label %.lr.ph.i, !llvm.loop !23

_Z10init_arrayiPfS_.exit:                         ; preds = %vector.body, %.lr.ph.i
  call void @_Z15runJacobi1DCUDAiiPfS_S_S_(i32 noundef 10000, i32 noundef 4096, ptr noundef nonnull %10, ptr noundef nonnull %16, ptr noundef nonnull %22, ptr noundef nonnull %27) #6
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %73 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #13
  %.not.i.i34 = icmp eq i32 %73, 0
  br i1 %.not.i.i34, label %_Z21polybench_timer_startv.exit, label %74

74:                                               ; preds = %_Z10init_arrayiPfS_.exit
  %75 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %73) #6
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiPfS_.exit, %74
  %76 = load i64, ptr %4, align 8
  %77 = sitofp i64 %76 to double
  %78 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %79 = load i64, ptr %78, align 8
  %80 = sitofp i64 %79 to double
  %81 = fmul nnan double %80, f0x3EB0C6F7A0B5ED8D
  %82 = fadd double %81, %77
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %82, ptr @polybench_t_start, align 8
  %scevgep = getelementptr i8, ptr %16, i64 4
  %scevgep56 = getelementptr i8, ptr %16, i64 16380
  %scevgep57 = getelementptr i8, ptr %10, i64 16384
  %bound0 = icmp ult ptr %scevgep, %scevgep57
  %bound1 = icmp ult ptr %10, %scevgep56
  %found.conflict = and i1 %bound0, %bound1
  %83 = sub i64 %17, %11
  %diff.check47 = icmp ugt i64 %83, -32
  br label %vector.memcheck55

vector.memcheck55:                                ; preds = %_Z21polybench_timer_startv.exit, %._crit_edge.us.us.i
  %.027.us.us.i = phi i32 [ %157, %._crit_edge.us.us.i ], [ 0, %_Z21polybench_timer_startv.exit ]
  br i1 %found.conflict, label %scalar.ph58.preheader.new, label %vector.body60

vector.body60:                                    ; preds = %vector.memcheck55, %vector.body60.1
  %index61 = phi i64 [ %index.next65.1, %vector.body60.1 ], [ 0, %vector.memcheck55 ]
  %84 = or disjoint i64 %index61, 1
  %85 = getelementptr [4 x i8], ptr %10, i64 %84
  %86 = getelementptr i8, ptr %85, i64 -4
  %wide.load62 = load <4 x float>, ptr %86, align 4, !alias.scope !24
  %wide.load63 = load <4 x float>, ptr %85, align 4, !alias.scope !24
  %87 = fadd <4 x float> %wide.load62, %wide.load63
  %88 = getelementptr [4 x i8], ptr %10, i64 %index61
  %89 = getelementptr i8, ptr %88, i64 8
  %wide.load64 = load <4 x float>, ptr %89, align 4, !alias.scope !24
  %90 = fadd <4 x float> %87, %wide.load64
  %91 = fpext <4 x float> %90 to <4 x double>
  %92 = fmul <4 x double> %91, splat (double 3.333300e-01)
  %93 = fptrunc <4 x double> %92 to <4 x float>
  %94 = getelementptr [4 x i8], ptr %16, i64 %84
  store <4 x float> %93, ptr %94, align 4, !alias.scope !27, !noalias !24
  %95 = icmp eq i64 %index61, 4088
  br i1 %95, label %scalar.ph58.preheader.new, label %vector.body60.1

vector.body60.1:                                  ; preds = %vector.body60
  %96 = or disjoint i64 %index61, 5
  %97 = getelementptr [4 x i8], ptr %10, i64 %96
  %98 = getelementptr i8, ptr %97, i64 -4
  %wide.load62.1 = load <4 x float>, ptr %98, align 4, !alias.scope !24
  %wide.load63.1 = load <4 x float>, ptr %97, align 4, !alias.scope !24
  %99 = fadd <4 x float> %wide.load62.1, %wide.load63.1
  %100 = getelementptr [4 x i8], ptr %10, i64 %index61
  %101 = getelementptr i8, ptr %100, i64 24
  %wide.load64.1 = load <4 x float>, ptr %101, align 4, !alias.scope !24
  %102 = fadd <4 x float> %99, %wide.load64.1
  %103 = fpext <4 x float> %102 to <4 x double>
  %104 = fmul <4 x double> %103, splat (double 3.333300e-01)
  %105 = fptrunc <4 x double> %104 to <4 x float>
  %106 = getelementptr [4 x i8], ptr %16, i64 %96
  store <4 x float> %105, ptr %106, align 4, !alias.scope !27, !noalias !24
  %index.next65.1 = add nuw nsw i64 %index61, 8
  br label %vector.body60

scalar.ph58.preheader.new:                        ; preds = %vector.body60, %vector.memcheck55
  %indvars.iv.i35.ph = phi i64 [ 1, %vector.memcheck55 ], [ 4093, %vector.body60 ]
  br label %scalar.ph58

scalar.ph58:                                      ; preds = %scalar.ph58, %scalar.ph58.preheader.new
  %indvars.iv.i35 = phi i64 [ %indvars.iv.i35.ph, %scalar.ph58.preheader.new ], [ %indvars.iv.next.i36.1, %scalar.ph58 ]
  %107 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv.i35
  %108 = getelementptr i8, ptr %107, i64 -4
  %109 = load float, ptr %108, align 4
  %110 = load float, ptr %107, align 4
  %111 = fadd float %109, %110
  %indvars.iv.next.i36 = add nuw nsw i64 %indvars.iv.i35, 1
  %112 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv.next.i36
  %113 = load float, ptr %112, align 4
  %114 = fadd float %111, %113
  %115 = fpext float %114 to double
  %116 = fmul double %115, 3.333300e-01
  %117 = fptrunc double %116 to float
  %118 = getelementptr [4 x i8], ptr %16, i64 %indvars.iv.i35
  store float %117, ptr %118, align 4
  %119 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv.next.i36
  %120 = getelementptr i8, ptr %119, i64 -4
  %121 = load float, ptr %120, align 4
  %122 = load float, ptr %119, align 4
  %123 = fadd float %121, %122
  %indvars.iv.next.i36.1 = add nuw nsw i64 %indvars.iv.i35, 2
  %124 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv.next.i36.1
  %125 = load float, ptr %124, align 4
  %126 = fadd float %123, %125
  %127 = fpext float %126 to double
  %128 = fmul double %127, 3.333300e-01
  %129 = fptrunc double %128 to float
  %130 = getelementptr [4 x i8], ptr %16, i64 %indvars.iv.next.i36
  store float %129, ptr %130, align 4
  %exitcond.not.i37.1 = icmp eq i64 %indvars.iv.next.i36.1, 4095
  br i1 %exitcond.not.i37.1, label %vector.memcheck46, label %scalar.ph58, !llvm.loop !29

vector.memcheck46:                                ; preds = %scalar.ph58
  br i1 %diff.check47, label %..preheader_crit_edge.us.us.i.prol.preheader, label %vector.body50

vector.body50:                                    ; preds = %vector.memcheck46, %vector.body50.1
  %index51 = phi i64 [ %index.next53.1, %vector.body50.1 ], [ 0, %vector.memcheck46 ]
  %131 = or disjoint i64 %index51, 1
  %132 = getelementptr [4 x i8], ptr %16, i64 %131
  %133 = getelementptr i8, ptr %132, i64 16
  %wide.load = load <4 x float>, ptr %132, align 4
  %wide.load52 = load <4 x float>, ptr %133, align 4
  %134 = getelementptr [4 x i8], ptr %10, i64 %131
  %135 = getelementptr i8, ptr %134, i64 16
  store <4 x float> %wide.load, ptr %134, align 4
  store <4 x float> %wide.load52, ptr %135, align 4
  %136 = icmp eq i64 %index51, 4080
  br i1 %136, label %..preheader_crit_edge.us.us.i.prol.preheader, label %vector.body50.1

vector.body50.1:                                  ; preds = %vector.body50
  %137 = or disjoint i64 %index51, 9
  %138 = getelementptr [4 x i8], ptr %16, i64 %137
  %139 = getelementptr i8, ptr %138, i64 16
  %wide.load.1 = load <4 x float>, ptr %138, align 4
  %wide.load52.1 = load <4 x float>, ptr %139, align 4
  %140 = getelementptr [4 x i8], ptr %10, i64 %137
  %141 = getelementptr i8, ptr %140, i64 16
  store <4 x float> %wide.load.1, ptr %140, align 4
  store <4 x float> %wide.load52.1, ptr %141, align 4
  %index.next53.1 = add nuw nsw i64 %index51, 16
  br label %vector.body50

..preheader_crit_edge.us.us.i.prol.preheader:     ; preds = %vector.memcheck46, %vector.body50
  %indvars.iv31.i.ph = phi i64 [ 1, %vector.memcheck46 ], [ 4089, %vector.body50 ]
  br label %..preheader_crit_edge.us.us.i.prol

..preheader_crit_edge.us.us.i.prol:               ; preds = %..preheader_crit_edge.us.us.i.prol, %..preheader_crit_edge.us.us.i.prol.preheader
  %indvars.iv31.i.prol = phi i64 [ %indvars.iv.next32.i.prol, %..preheader_crit_edge.us.us.i.prol ], [ %indvars.iv31.i.ph, %..preheader_crit_edge.us.us.i.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %..preheader_crit_edge.us.us.i.prol ], [ 0, %..preheader_crit_edge.us.us.i.prol.preheader ]
  %142 = getelementptr [4 x i8], ptr %16, i64 %indvars.iv31.i.prol
  %143 = load float, ptr %142, align 4
  %144 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv31.i.prol
  store float %143, ptr %144, align 4
  %indvars.iv.next32.i.prol = add nuw nsw i64 %indvars.iv31.i.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, 2
  br i1 %prol.iter.cmp.not, label %..preheader_crit_edge.us.us.i, label %..preheader_crit_edge.us.us.i.prol, !llvm.loop !30

..preheader_crit_edge.us.us.i:                    ; preds = %..preheader_crit_edge.us.us.i.prol, %..preheader_crit_edge.us.us.i
  %indvars.iv31.i = phi i64 [ %indvars.iv.next32.i.3, %..preheader_crit_edge.us.us.i ], [ %indvars.iv.next32.i.prol, %..preheader_crit_edge.us.us.i.prol ]
  %145 = getelementptr [4 x i8], ptr %16, i64 %indvars.iv31.i
  %146 = load float, ptr %145, align 4
  %147 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv31.i
  store float %146, ptr %147, align 4
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1
  %148 = getelementptr [4 x i8], ptr %16, i64 %indvars.iv.next32.i
  %149 = load float, ptr %148, align 4
  %150 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv.next32.i
  store float %149, ptr %150, align 4
  %indvars.iv.next32.i.1 = add nuw nsw i64 %indvars.iv31.i, 2
  %151 = getelementptr [4 x i8], ptr %16, i64 %indvars.iv.next32.i.1
  %152 = load float, ptr %151, align 4
  %153 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv.next32.i.1
  store float %152, ptr %153, align 4
  %indvars.iv.next32.i.2 = add nuw nsw i64 %indvars.iv31.i, 3
  %154 = getelementptr [4 x i8], ptr %16, i64 %indvars.iv.next32.i.2
  %155 = load float, ptr %154, align 4
  %156 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv.next32.i.2
  store float %155, ptr %156, align 4
  %indvars.iv.next32.i.3 = add nuw nsw i64 %indvars.iv31.i, 4
  %exitcond35.not.i.3 = icmp eq i64 %indvars.iv.next32.i.3, 4095
  br i1 %exitcond35.not.i.3, label %._crit_edge.us.us.i, label %..preheader_crit_edge.us.us.i, !llvm.loop !31

._crit_edge.us.us.i:                              ; preds = %..preheader_crit_edge.us.us.i
  %157 = add nuw nsw i32 %.027.us.us.i, 1
  %exitcond36.not.i = icmp eq i32 %157, 10000
  br i1 %exitcond36.not.i, label %_Z14runJacobi1DCpuiiPfS_.exit, label %vector.memcheck55

_Z14runJacobi1DCpuiiPfS_.exit:                    ; preds = %._crit_edge.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %158 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #13
  %.not.i.i38 = icmp eq i32 %158, 0
  br i1 %.not.i.i38, label %_Z20polybench_timer_stopv.exit, label %159

159:                                              ; preds = %_Z14runJacobi1DCpuiiPfS_.exit
  %160 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %158) #6
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z14runJacobi1DCpuiiPfS_.exit, %159
  %161 = load i64, ptr %3, align 8
  %162 = sitofp i64 %161 to double
  %163 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %164 = load i64, ptr %163, align 8
  %165 = sitofp i64 %164 to double
  %166 = fmul nnan double %165, f0x3EB0C6F7A0B5ED8D
  %167 = fadd double %166, %162
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %167, ptr @polybench_t_end, align 8
  %168 = load double, ptr @polybench_t_start, align 8
  %169 = fsub double %167, %168
  %170 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, double noundef %169) #6
  call void @_Z14compareResultsiPfS_S_S_(i32 noundef 4096, ptr noundef nonnull %10, ptr noundef nonnull %22, ptr noundef nonnull %16, ptr noundef nonnull %27) #6
  call void @free(ptr noundef nonnull %10) #13
  call void @free(ptr noundef %22) #13
  call void @free(ptr noundef nonnull %16) #13
  call void @free(ptr noundef %27) #13
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
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: write) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #3 = { "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #4 = { nofree nounwind "uniform-work-group-size" }
attributes #5 = { nofree nounwind "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #6 = { "uniform-work-group-size" }
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
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !2, !3}
!11 = distinct !{!11, !2}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !2}
!16 = distinct !{!16, !2, !3}
!17 = distinct !{!17, !2, !3}
!18 = distinct !{!18, !3, !2}
!19 = distinct !{!19, !3, !2}
!20 = !{ptr @_Z36__device_stub__runJacobiCUDA_kernel1iPfS_}
!21 = !{ptr @_Z36__device_stub__runJacobiCUDA_kernel2iPfS_}
!22 = distinct !{!22, !2, !3}
!23 = distinct !{!23, !2}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28}
!28 = distinct !{!28, !26}
!29 = distinct !{!29, !2}
!30 = distinct !{!30, !14}
!31 = distinct !{!31, !2}
