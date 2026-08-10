; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/JACOBI2D/jacobi2D.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/JACOBI2D/jacobi2D.cu"
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
define dso_local void @_Z10init_arrayiPA1000_fS0_(i32 noundef %0, ptr nofree noundef writeonly captures(none) %1, ptr nofree noundef writeonly captures(none) %2) local_unnamed_addr #1 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader.preheader, label %._crit_edge19.split

.preheader.preheader:                             ; preds = %3
  %5 = ptrtoaddr ptr %2 to i64
  %6 = ptrtoaddr ptr %1 to i64
  %wide.trip.count24 = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  %7 = sub i64 %6, %5
  %diff.check = icmp ugt i64 %7, -16
  %or.cond = or i1 %min.iters.check, %diff.check
  %n.vec = and i64 %wide.trip.count24, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count24
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv21 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next22, %._crit_edge ]
  %8 = trunc nuw nsw i64 %indvars.iv21 to i32
  %9 = uitofp nneg i32 %8 to float
  %10 = getelementptr [4000 x i8], ptr %1, i64 %indvars.iv21
  %11 = trunc i64 %indvars.iv21 to i32
  %12 = add i32 %11, -4
  %13 = sitofp i32 %12 to float
  %14 = getelementptr [4000 x i8], ptr %2, i64 %indvars.iv21
  br i1 %or.cond, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %9, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert26 = insertelement <4 x float> poison, float %13, i64 0
  %broadcast.splat27 = shufflevector <4 x float> %broadcast.splatinsert26, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.ind28 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next29, %vector.body ]
  %15 = add <4 x i32> %vec.ind, splat (i32 2)
  %16 = uitofp nneg <4 x i32> %15 to <4 x float>
  %17 = fmul nnan <4 x float> %broadcast.splat, %16
  %18 = fadd <4 x float> %17, splat (float 1.000000e+01)
  %19 = fdiv <4 x float> %18, splat (float 1.000000e+03)
  %20 = getelementptr [4 x i8], ptr %10, i64 %index
  store <4 x float> %19, ptr %20, align 4
  %21 = add <4 x i32> %vec.ind28, splat (i32 -1)
  %22 = sitofp <4 x i32> %21 to <4 x float>
  %23 = fmul nnan <4 x float> %broadcast.splat27, %22
  %24 = fadd <4 x float> %23, splat (float 1.100000e+01)
  %25 = fdiv <4 x float> %24, splat (float 1.000000e+03)
  %26 = getelementptr [4 x i8], ptr %14, i64 %index
  store <4 x float> %25, ptr %26, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %vec.ind.next29 = add <4 x i32> %vec.ind28, splat (i32 4)
  %27 = icmp eq i64 %index.next, %n.vec
  br i1 %27, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %28 = trunc i64 %indvars.iv to i32
  %29 = add i32 %28, 2
  %30 = uitofp nneg i32 %29 to float
  %31 = fmul nnan float %9, %30
  %32 = fadd float %31, 1.000000e+01
  %33 = fdiv float %32, 1.000000e+03
  %34 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv
  store float %33, ptr %34, align 4
  %35 = trunc i64 %indvars.iv to i32
  %36 = add i32 %35, -1
  %37 = sitofp i32 %36 to float
  %38 = fmul nnan float %13, %37
  %39 = fadd float %38, 1.100000e+01
  %40 = fdiv float %39, 1.000000e+03
  %41 = getelementptr [4 x i8], ptr %14, i64 %indvars.iv
  store float %40, ptr %41, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count24
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !4

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond25.not = icmp eq i64 %indvars.iv.next22, %wide.trip.count24
  br i1 %exitcond25.not, label %._crit_edge19.split, label %.preheader

._crit_edge19.split:                              ; preds = %._crit_edge, %3
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z14runJacobi2DCpuiiPA1000_fS0_(i32 noundef %0, i32 noundef %1, ptr nofree noundef captures(none) %2, ptr nofree noundef captures(none) %3) local_unnamed_addr #2 {
  %5 = ptrtoaddr ptr %3 to i64
  %6 = ptrtoaddr ptr %2 to i64
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %1, 2
  %or.cond = and i1 %7, %8
  br i1 %or.cond, label %.preheader45.us.us.preheader, label %._crit_edge53

.preheader45.us.us.preheader:                     ; preds = %4
  %9 = add nsw i32 %1, -1
  %wide.trip.count58 = zext i32 %9 to i64
  %scevgep = getelementptr i8, ptr %3, i64 4004
  %10 = mul nuw nsw i64 %wide.trip.count58, 4004
  %11 = getelementptr i8, ptr %3, i64 %10
  %scevgep75 = getelementptr i8, ptr %11, i64 -4000
  %scevgep76 = getelementptr i8, ptr %2, i64 4
  %scevgep77 = getelementptr i8, ptr %2, i64 %10
  %12 = add nsw i64 %wide.trip.count58, -1
  %min.iters.check79 = icmp ult i64 %12, 8
  %bound0 = icmp ult ptr %scevgep, %scevgep77
  %bound1 = icmp ult ptr %scevgep76, %scevgep75
  %found.conflict = and i1 %bound0, %bound1
  %n.vec82 = and i64 %12, -8
  %13 = or disjoint i64 %n.vec82, 1
  %cmp.n97 = icmp eq i64 %12, %n.vec82
  %14 = and i32 %1, 1
  %lcmp.mod.not = icmp eq i32 %14, 0
  %15 = add nsw i64 %wide.trip.count58, -1
  %16 = add nsw i64 %wide.trip.count58, -1
  %min.iters.check = icmp ult i64 %16, 8
  %17 = sub i64 %5, %6
  %diff.check = icmp ugt i64 %17, -32
  %or.cond99 = or i1 %min.iters.check, %diff.check
  %n.vec = and i64 %16, -8
  %18 = or disjoint i64 %n.vec, 1
  %cmp.n = icmp eq i64 %16, %n.vec
  br label %.preheader45.us.us

.preheader45.us.us:                               ; preds = %.preheader45.us.us.preheader, %._crit_edge51.us.us
  %.052.us.us = phi i32 [ %123, %._crit_edge51.us.us ], [ 0, %.preheader45.us.us.preheader ]
  br label %.preheader43.us.us

scalar.ph78:                                      ; preds = %scalar.ph78.prol.loopexit, %scalar.ph78
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %scalar.ph78 ], [ %indvars.iv.unr, %scalar.ph78.prol.loopexit ]
  %19 = getelementptr [4 x i8], ptr %77, i64 %indvars.iv
  %20 = load float, ptr %19, align 4
  %21 = getelementptr i8, ptr %19, i64 -4
  %22 = load float, ptr %21, align 4
  %23 = fadd float %20, %22
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = getelementptr [4 x i8], ptr %77, i64 %indvars.iv.next
  %25 = load float, ptr %24, align 4
  %26 = fadd float %23, %25
  %27 = getelementptr [4 x i8], ptr %78, i64 %indvars.iv
  %28 = load float, ptr %27, align 4
  %29 = fadd float %26, %28
  %30 = getelementptr [4 x i8], ptr %79, i64 %indvars.iv
  %31 = load float, ptr %30, align 4
  %32 = fadd float %29, %31
  %33 = fmul float %32, 2.000000e-01
  %34 = getelementptr [4 x i8], ptr %80, i64 %indvars.iv
  store float %33, ptr %34, align 4
  %35 = getelementptr [4 x i8], ptr %77, i64 %indvars.iv.next
  %36 = load float, ptr %35, align 4
  %37 = getelementptr i8, ptr %35, i64 -4
  %38 = load float, ptr %37, align 4
  %39 = fadd float %36, %38
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %40 = getelementptr [4 x i8], ptr %77, i64 %indvars.iv.next.1
  %41 = load float, ptr %40, align 4
  %42 = fadd float %39, %41
  %43 = getelementptr [4 x i8], ptr %78, i64 %indvars.iv.next
  %44 = load float, ptr %43, align 4
  %45 = fadd float %42, %44
  %46 = getelementptr [4 x i8], ptr %79, i64 %indvars.iv.next
  %47 = load float, ptr %46, align 4
  %48 = fadd float %45, %47
  %49 = fmul float %48, 2.000000e-01
  %50 = getelementptr [4 x i8], ptr %80, i64 %indvars.iv.next
  store float %49, ptr %50, align 4
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count58
  br i1 %exitcond.not.1, label %._crit_edge.us.us, label %scalar.ph78, !llvm.loop !5

scalar.ph:                                        ; preds = %scalar.ph.prol.loopexit, %scalar.ph
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.3, %scalar.ph ], [ %indvars.iv61.unr, %scalar.ph.prol.loopexit ]
  %51 = getelementptr [4 x i8], ptr %63, i64 %indvars.iv61
  %52 = load float, ptr %51, align 4
  %53 = getelementptr [4 x i8], ptr %64, i64 %indvars.iv61
  store float %52, ptr %53, align 4
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %54 = getelementptr [4 x i8], ptr %63, i64 %indvars.iv.next62
  %55 = load float, ptr %54, align 4
  %56 = getelementptr [4 x i8], ptr %64, i64 %indvars.iv.next62
  store float %55, ptr %56, align 4
  %indvars.iv.next62.1 = add nuw nsw i64 %indvars.iv61, 2
  %57 = getelementptr [4 x i8], ptr %63, i64 %indvars.iv.next62.1
  %58 = load float, ptr %57, align 4
  %59 = getelementptr [4 x i8], ptr %64, i64 %indvars.iv.next62.1
  store float %58, ptr %59, align 4
  %indvars.iv.next62.2 = add nuw nsw i64 %indvars.iv61, 3
  %60 = getelementptr [4 x i8], ptr %63, i64 %indvars.iv.next62.2
  %61 = load float, ptr %60, align 4
  %62 = getelementptr [4 x i8], ptr %64, i64 %indvars.iv.next62.2
  store float %61, ptr %62, align 4
  %indvars.iv.next62.3 = add nuw nsw i64 %indvars.iv61, 4
  %exitcond65.not.3 = icmp eq i64 %indvars.iv.next62.3, %wide.trip.count58
  br i1 %exitcond65.not.3, label %._crit_edge49.us.us, label %scalar.ph, !llvm.loop !6

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %._crit_edge49.us.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge49.us.us ], [ 1, %._crit_edge.us.us ]
  %63 = getelementptr [4000 x i8], ptr %3, i64 %indvars.iv66
  %64 = getelementptr [4000 x i8], ptr %2, i64 %indvars.iv66
  br i1 %or.cond99, label %scalar.ph.preheader, label %vector.body

vector.body:                                      ; preds = %.preheader.us.us, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader.us.us ]
  %65 = or disjoint i64 %index, 1
  %66 = getelementptr [4 x i8], ptr %63, i64 %65
  %67 = getelementptr i8, ptr %66, i64 16
  %wide.load = load <4 x float>, ptr %66, align 4
  %wide.load73 = load <4 x float>, ptr %67, align 4
  %68 = getelementptr [4 x i8], ptr %64, i64 %65
  %69 = getelementptr i8, ptr %68, i64 16
  store <4 x float> %wide.load, ptr %68, align 4
  store <4 x float> %wide.load73, ptr %69, align 4
  %index.next = add nuw i64 %index, 8
  %70 = icmp eq i64 %index.next, %n.vec
  br i1 %70, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge49.us.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader.us.us, %middle.block
  %indvars.iv61.ph = phi i64 [ 1, %.preheader.us.us ], [ %18, %middle.block ]
  %71 = sub nsw i64 %wide.trip.count58, %indvars.iv61.ph
  %xtraiter100 = and i64 %71, 3
  %lcmp.mod101.not = icmp eq i64 %xtraiter100, 0
  br i1 %lcmp.mod101.not, label %scalar.ph.prol.loopexit, label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.preheader, %scalar.ph.prol
  %indvars.iv61.prol = phi i64 [ %indvars.iv.next62.prol, %scalar.ph.prol ], [ %indvars.iv61.ph, %scalar.ph.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %scalar.ph.prol ], [ 0, %scalar.ph.preheader ]
  %72 = getelementptr [4 x i8], ptr %63, i64 %indvars.iv61.prol
  %73 = load float, ptr %72, align 4
  %74 = getelementptr [4 x i8], ptr %64, i64 %indvars.iv61.prol
  store float %73, ptr %74, align 4
  %indvars.iv.next62.prol = add nuw nsw i64 %indvars.iv61.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter100
  br i1 %prol.iter.cmp.not, label %scalar.ph.prol.loopexit, label %scalar.ph.prol, !llvm.loop !8

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol, %scalar.ph.preheader
  %indvars.iv61.unr = phi i64 [ %indvars.iv61.ph, %scalar.ph.preheader ], [ %indvars.iv.next62.prol, %scalar.ph.prol ]
  %75 = sub nsw i64 %indvars.iv61.ph, %wide.trip.count58
  %76 = icmp ugt i64 %75, -4
  br i1 %76, label %._crit_edge49.us.us, label %scalar.ph

.preheader43.us.us:                               ; preds = %._crit_edge.us.us, %.preheader45.us.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge.us.us ], [ 1, %.preheader45.us.us ]
  %77 = getelementptr [4000 x i8], ptr %2, i64 %indvars.iv55
  %78 = getelementptr i8, ptr %77, i64 4000
  %79 = getelementptr i8, ptr %77, i64 -4000
  %80 = getelementptr [4000 x i8], ptr %3, i64 %indvars.iv55
  %brmerge = select i1 %min.iters.check79, i1 true, i1 %found.conflict
  br i1 %brmerge, label %scalar.ph78.preheader, label %vector.body83

vector.body83:                                    ; preds = %.preheader43.us.us, %vector.body83
  %index84 = phi i64 [ %index.next95, %vector.body83 ], [ 0, %.preheader43.us.us ]
  %81 = or disjoint i64 %index84, 1
  %82 = getelementptr [4 x i8], ptr %77, i64 %81
  %83 = getelementptr i8, ptr %82, i64 16
  %wide.load85 = load <4 x float>, ptr %82, align 4, !alias.scope !10
  %wide.load86 = load <4 x float>, ptr %83, align 4, !alias.scope !10
  %84 = getelementptr i8, ptr %82, i64 -4
  %85 = getelementptr i8, ptr %82, i64 12
  %wide.load87 = load <4 x float>, ptr %84, align 4, !alias.scope !10
  %wide.load88 = load <4 x float>, ptr %85, align 4, !alias.scope !10
  %86 = fadd <4 x float> %wide.load85, %wide.load87
  %87 = fadd <4 x float> %wide.load86, %wide.load88
  %88 = getelementptr [4 x i8], ptr %77, i64 %index84
  %89 = getelementptr i8, ptr %88, i64 8
  %90 = getelementptr i8, ptr %88, i64 24
  %wide.load89 = load <4 x float>, ptr %89, align 4, !alias.scope !10
  %wide.load90 = load <4 x float>, ptr %90, align 4, !alias.scope !10
  %91 = fadd <4 x float> %86, %wide.load89
  %92 = fadd <4 x float> %87, %wide.load90
  %93 = getelementptr [4 x i8], ptr %78, i64 %81
  %94 = getelementptr i8, ptr %93, i64 16
  %wide.load91 = load <4 x float>, ptr %93, align 4, !alias.scope !10
  %wide.load92 = load <4 x float>, ptr %94, align 4, !alias.scope !10
  %95 = fadd <4 x float> %91, %wide.load91
  %96 = fadd <4 x float> %92, %wide.load92
  %97 = getelementptr [4 x i8], ptr %79, i64 %81
  %98 = getelementptr i8, ptr %97, i64 16
  %wide.load93 = load <4 x float>, ptr %97, align 4, !alias.scope !10
  %wide.load94 = load <4 x float>, ptr %98, align 4, !alias.scope !10
  %99 = fadd <4 x float> %95, %wide.load93
  %100 = fadd <4 x float> %96, %wide.load94
  %101 = fmul <4 x float> %99, splat (float 2.000000e-01)
  %102 = fmul <4 x float> %100, splat (float 2.000000e-01)
  %103 = getelementptr [4 x i8], ptr %80, i64 %81
  %104 = getelementptr i8, ptr %103, i64 16
  store <4 x float> %101, ptr %103, align 4, !alias.scope !13, !noalias !10
  store <4 x float> %102, ptr %104, align 4, !alias.scope !13, !noalias !10
  %index.next95 = add nuw i64 %index84, 8
  %105 = icmp eq i64 %index.next95, %n.vec82
  br i1 %105, label %middle.block96, label %vector.body83, !llvm.loop !15

middle.block96:                                   ; preds = %vector.body83
  br i1 %cmp.n97, label %._crit_edge.us.us, label %scalar.ph78.preheader

scalar.ph78.preheader:                            ; preds = %.preheader43.us.us, %middle.block96
  %indvars.iv.ph = phi i64 [ %13, %middle.block96 ], [ 1, %.preheader43.us.us ]
  br i1 %lcmp.mod.not, label %scalar.ph78.prol.loopexit, label %scalar.ph78.prol

scalar.ph78.prol:                                 ; preds = %scalar.ph78.preheader
  %106 = getelementptr [4 x i8], ptr %77, i64 %indvars.iv.ph
  %107 = load float, ptr %106, align 4
  %108 = getelementptr i8, ptr %106, i64 -4
  %109 = load float, ptr %108, align 4
  %110 = fadd float %107, %109
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  %111 = getelementptr [4 x i8], ptr %77, i64 %indvars.iv.next.prol
  %112 = load float, ptr %111, align 4
  %113 = fadd float %110, %112
  %114 = getelementptr [4 x i8], ptr %78, i64 %indvars.iv.ph
  %115 = load float, ptr %114, align 4
  %116 = fadd float %113, %115
  %117 = getelementptr [4 x i8], ptr %79, i64 %indvars.iv.ph
  %118 = load float, ptr %117, align 4
  %119 = fadd float %116, %118
  %120 = fmul float %119, 2.000000e-01
  %121 = getelementptr [4 x i8], ptr %80, i64 %indvars.iv.ph
  store float %120, ptr %121, align 4
  br label %scalar.ph78.prol.loopexit

scalar.ph78.prol.loopexit:                        ; preds = %scalar.ph78.prol, %scalar.ph78.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph78.preheader ], [ %indvars.iv.next.prol, %scalar.ph78.prol ]
  %122 = icmp eq i64 %indvars.iv.ph, %15
  br i1 %122, label %._crit_edge.us.us, label %scalar.ph78

._crit_edge.us.us:                                ; preds = %scalar.ph78.prol.loopexit, %scalar.ph78, %middle.block96
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond59.not = icmp eq i64 %indvars.iv.next56, %wide.trip.count58
  br i1 %exitcond59.not, label %.preheader.us.us, label %.preheader43.us.us

._crit_edge49.us.us:                              ; preds = %scalar.ph.prol.loopexit, %scalar.ph, %middle.block
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond70.not = icmp eq i64 %indvars.iv.next67, %wide.trip.count58
  br i1 %exitcond70.not, label %._crit_edge51.us.us, label %.preheader.us.us

._crit_edge51.us.us:                              ; preds = %._crit_edge49.us.us
  %123 = add nuw nsw i32 %.052.us.us, 1
  %exitcond71.not = icmp eq i32 %123, %0
  br i1 %exitcond71.not, label %._crit_edge53, label %.preheader45.us.us

._crit_edge53:                                    ; preds = %._crit_edge51.us.us, %4
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
define dso_local void @_Z14compareResultsiPA1000_fS0_S0_S0_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef readonly captures(none) %4) local_unnamed_addr #5 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader41.us.preheader, label %._crit_edge51

.preheader41.us.preheader:                        ; preds = %5
  %wide.trip.count60 = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  %n.vec = and i64 %wide.trip.count60, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count60
  br label %.preheader41.us

.preheader41.us:                                  ; preds = %.preheader41.us.preheader, %._crit_edge.us
  %indvars.iv57 = phi i64 [ 0, %.preheader41.us.preheader ], [ %indvars.iv.next58, %._crit_edge.us ]
  %.045.us = phi i32 [ 0, %.preheader41.us.preheader ], [ %.2.us.lcssa, %._crit_edge.us ]
  %7 = getelementptr [4000 x i8], ptr %1, i64 %indvars.iv57
  %8 = getelementptr [4000 x i8], ptr %2, i64 %indvars.iv57
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader41.us
  %9 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.045.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %9, %vector.ph ], [ %41, %vector.body ]
  %10 = getelementptr [4 x i8], ptr %7, i64 %index
  %wide.load = load <4 x float>, ptr %10, align 4
  %11 = fpext <4 x float> %wide.load to <4 x double>
  %12 = getelementptr [4 x i8], ptr %8, i64 %index
  %wide.load73 = load <4 x float>, ptr %12, align 4
  %13 = fpext <4 x float> %wide.load73 to <4 x double>
  %14 = fcmp olt <4 x double> %11, splat (double f0xB690000000000000)
  %15 = fneg <4 x float> %wide.load
  %16 = select <4 x i1> %14, <4 x float> %15, <4 x float> %wide.load
  %17 = fpext <4 x float> %16 to <4 x double>
  %18 = fcmp uge <4 x double> %17, splat (double 1.000000e-02)
  %19 = fcmp olt <4 x double> %13, splat (double f0xB690000000000000)
  %20 = fneg <4 x float> %wide.load73
  %21 = select <4 x i1> %19, <4 x float> %20, <4 x float> %wide.load73
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
  %.not91 = select <4 x i1> %18, <4 x i1> splat (i1 true), <4 x i1> %23
  %narrow = select <4 x i1> %.not91, <4 x i1> %40, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %41 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  %43 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %41)
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader41.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader41.us ], [ %n.vec, %middle.block ]
  %.143.us.ph = phi i32 [ %.045.us, %.preheader41.us ], [ %43, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %_Z11percentDiffdd.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %.143.us = phi i32 [ %.2.us, %_Z11percentDiffdd.exit.us ], [ %.143.us.ph, %scalar.ph.preheader ]
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
  %.2.us = add nsw i32 %common.ret.op.i.us, %.143.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count60
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !17

._crit_edge.us:                                   ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %.2.us.lcssa = phi i32 [ %43, %middle.block ], [ %.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond61.not = icmp eq i64 %indvars.iv.next58, %wide.trip.count60
  br i1 %exitcond61.not, label %.preheader.us.preheader, label %.preheader41.us

.preheader.us.preheader:                          ; preds = %._crit_edge.us
  %wide.trip.count70 = zext nneg i32 %0 to i64
  %min.iters.check75 = icmp ult i32 %0, 4
  %n.vec78 = and i64 %wide.trip.count60, 2147483644
  %cmp.n87 = icmp eq i64 %n.vec78, %wide.trip.count60
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us53
  %indvars.iv67 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next68, %._crit_edge.us53 ]
  %.350.us = phi i32 [ %.2.us.lcssa, %.preheader.us.preheader ], [ %.5.us.lcssa, %._crit_edge.us53 ]
  %76 = getelementptr [4000 x i8], ptr %3, i64 %indvars.iv67
  %77 = getelementptr [4000 x i8], ptr %4, i64 %indvars.iv67
  br i1 %min.iters.check75, label %scalar.ph74.preheader, label %vector.ph76

vector.ph76:                                      ; preds = %.preheader.us
  %78 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.350.us, i64 0
  br label %vector.body79

vector.body79:                                    ; preds = %vector.body79, %vector.ph76
  %index80 = phi i64 [ 0, %vector.ph76 ], [ %index.next85, %vector.body79 ]
  %vec.phi81 = phi <4 x i32> [ %78, %vector.ph76 ], [ %110, %vector.body79 ]
  %79 = getelementptr [4 x i8], ptr %76, i64 %index80
  %wide.load82 = load <4 x float>, ptr %79, align 4
  %80 = fpext <4 x float> %wide.load82 to <4 x double>
  %81 = getelementptr [4 x i8], ptr %77, i64 %index80
  %wide.load83 = load <4 x float>, ptr %81, align 4
  %82 = fpext <4 x float> %wide.load83 to <4 x double>
  %83 = fcmp olt <4 x double> %80, splat (double f0xB690000000000000)
  %84 = fneg <4 x float> %wide.load82
  %85 = select <4 x i1> %83, <4 x float> %84, <4 x float> %wide.load82
  %86 = fpext <4 x float> %85 to <4 x double>
  %87 = fcmp uge <4 x double> %86, splat (double 1.000000e-02)
  %88 = fcmp olt <4 x double> %82, splat (double f0xB690000000000000)
  %89 = fneg <4 x float> %wide.load83
  %90 = select <4 x i1> %88, <4 x float> %89, <4 x float> %wide.load83
  %91 = fpext <4 x float> %90 to <4 x double>
  %92 = fcmp uge <4 x double> %91, splat (double 1.000000e-02)
  %93 = fsub <4 x double> %80, %82
  %94 = fptrunc <4 x double> %93 to <4 x float>
  %95 = fcmp olt <4 x double> %93, splat (double f0xB690000000000000)
  %96 = fneg <4 x float> %94
  %97 = select <4 x i1> %95, <4 x float> %96, <4 x float> %94
  %98 = fadd <4 x double> %80, splat (double f0x3E45798EE0000000)
  %99 = fptrunc <4 x double> %98 to <4 x float>
  %100 = fcmp olt <4 x double> %98, splat (double f0xB690000000000000)
  %101 = fneg <4 x float> %99
  %102 = select <4 x i1> %100, <4 x float> %101, <4 x float> %99
  %103 = fdiv <4 x float> %97, %102
  %104 = fcmp olt <4 x float> %103, zeroinitializer
  %105 = fneg <4 x float> %103
  %106 = select <4 x i1> %104, <4 x float> %105, <4 x float> %103
  %107 = fmul <4 x float> %106, splat (float 1.000000e+02)
  %108 = fpext <4 x float> %107 to <4 x double>
  %109 = fcmp ogt <4 x double> %108, splat (double 5.000000e-02)
  %.not94 = select <4 x i1> %87, <4 x i1> splat (i1 true), <4 x i1> %92
  %narrow92 = select <4 x i1> %.not94, <4 x i1> %109, <4 x i1> zeroinitializer
  %predphi84 = zext <4 x i1> %narrow92 to <4 x i32>
  %110 = add <4 x i32> %vec.phi81, %predphi84
  %index.next85 = add nuw i64 %index80, 4
  %111 = icmp eq i64 %index.next85, %n.vec78
  br i1 %111, label %middle.block86, label %vector.body79, !llvm.loop !18

middle.block86:                                   ; preds = %vector.body79
  %112 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %110)
  br i1 %cmp.n87, label %._crit_edge.us53, label %scalar.ph74.preheader

scalar.ph74.preheader:                            ; preds = %.preheader.us, %middle.block86
  %indvars.iv62.ph = phi i64 [ 0, %.preheader.us ], [ %n.vec78, %middle.block86 ]
  %.448.us.ph = phi i32 [ %.350.us, %.preheader.us ], [ %112, %middle.block86 ]
  br label %scalar.ph74

scalar.ph74:                                      ; preds = %scalar.ph74.preheader, %_Z11percentDiffdd.exit39.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %_Z11percentDiffdd.exit39.us ], [ %indvars.iv62.ph, %scalar.ph74.preheader ]
  %.448.us = phi i32 [ %.5.us, %_Z11percentDiffdd.exit39.us ], [ %.448.us.ph, %scalar.ph74.preheader ]
  %113 = getelementptr [4 x i8], ptr %76, i64 %indvars.iv62
  %114 = load float, ptr %113, align 4
  %115 = fpext float %114 to double
  %116 = getelementptr [4 x i8], ptr %77, i64 %indvars.iv62
  %117 = load float, ptr %116, align 4
  %118 = fpext float %117 to double
  %119 = fcmp olt double %115, f0xB690000000000000
  %120 = fneg float %114
  %common.ret.op.i.i32.us = select i1 %119, float %120, float %114
  %121 = fpext float %common.ret.op.i.i32.us to double
  %122 = fcmp olt double %121, 1.000000e-02
  br i1 %122, label %123, label %.critedge.i33.us

123:                                              ; preds = %scalar.ph74
  %124 = fcmp olt double %118, f0xB690000000000000
  %125 = fneg float %117
  %common.ret.op.i7.i38.us = select i1 %124, float %125, float %117
  %126 = fpext float %common.ret.op.i7.i38.us to double
  %127 = fcmp olt double %126, 1.000000e-02
  br i1 %127, label %_Z11percentDiffdd.exit39.us, label %.critedge.i33.us

.critedge.i33.us:                                 ; preds = %123, %scalar.ph74
  %128 = insertelement <2 x double> poison, double %115, i64 0
  %129 = shufflevector <2 x double> %128, <2 x double> poison, <2 x i32> zeroinitializer
  %130 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %118, i64 0
  %131 = fsub <2 x double> %129, %130
  %132 = fptrunc <2 x double> %131 to <2 x float>
  %133 = fcmp olt <2 x double> %131, splat (double f0xB690000000000000)
  %134 = fneg <2 x float> %132
  %135 = select <2 x i1> %133, <2 x float> %134, <2 x float> %132
  %136 = extractelement <2 x float> %135, i64 0
  %137 = extractelement <2 x float> %135, i64 1
  %138 = fdiv float %136, %137
  %139 = fcmp olt float %138, 0.000000e+00
  %140 = fneg float %138
  %common.ret.op.i10.i36.us = select i1 %139, float %140, float %138
  %141 = fmul float %common.ret.op.i10.i36.us, 1.000000e+02
  %142 = fpext float %141 to double
  %143 = fcmp ogt double %142, 5.000000e-02
  %144 = zext i1 %143 to i32
  br label %_Z11percentDiffdd.exit39.us

_Z11percentDiffdd.exit39.us:                      ; preds = %.critedge.i33.us, %123
  %common.ret.op.i37.us = phi i32 [ %144, %.critedge.i33.us ], [ 0, %123 ]
  %.5.us = add nsw i32 %common.ret.op.i37.us, %.448.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond66.not = icmp eq i64 %indvars.iv.next63, %wide.trip.count70
  br i1 %exitcond66.not, label %._crit_edge.us53, label %scalar.ph74, !llvm.loop !19

._crit_edge.us53:                                 ; preds = %_Z11percentDiffdd.exit39.us, %middle.block86
  %.5.us.lcssa = phi i32 [ %112, %middle.block86 ], [ %.5.us, %_Z11percentDiffdd.exit39.us ]
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond71.not = icmp eq i64 %indvars.iv.next68, %wide.trip.count70
  br i1 %exitcond71.not, label %._crit_edge51, label %.preheader.us

._crit_edge51:                                    ; preds = %._crit_edge.us53, %5
  %.3.lcssa = phi i32 [ 0, %5 ], [ %.5.us.lcssa, %._crit_edge.us53 ]
  %145 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %.3.lcssa) #6
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

define dso_local void @_Z15runJacobi2DCUDAiiPA1000_fS0_S0_S0_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) local_unnamed_addr #3 {
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
  %27 = call noundef i32 @cudaMalloc(ptr noundef nonnull %25, i64 noundef 4000000) #6
  %28 = call noundef i32 @cudaMalloc(ptr noundef nonnull %26, i64 noundef 4000000) #6
  %29 = load ptr, ptr %25, align 8
  %30 = call i32 @cudaMemcpy(ptr noundef %29, ptr noundef %2, i64 noundef 4000000, i32 noundef 1) #6
  %31 = load ptr, ptr %26, align 8
  %32 = call i32 @cudaMemcpy(ptr noundef %31, ptr noundef %3, i64 noundef 4000000, i32 noundef 1) #6
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
  %.053 = phi i32 [ 0, %.lr.ph ], [ %69, %67 ]
  %49 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 32, i32 125, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #6
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
  %59 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 32, i32 125, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #6
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
  %69 = add nuw nsw i32 %.053, 1
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
  %84 = call i32 @cudaMemcpy(ptr noundef %4, ptr noundef %83, i64 noundef 4000000, i32 noundef 2) #6
  %85 = load ptr, ptr %26, align 8
  %86 = call i32 @cudaMemcpy(ptr noundef %5, ptr noundef %85, i64 noundef 4000000, i32 noundef 2) #6
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
  %9 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 4000000) #13
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
  %15 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 4000000) #13
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
  %21 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 4000000) #13
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
  %26 = call i32 @posix_memalign(ptr noundef nonnull %5, i64 noundef 32, i64 noundef 4000000) #13
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
  br label %.preheader.i

.preheader.i:                                     ; preds = %._crit_edge.i, %_Z20polybench_alloc_datayi.exit33
  %indvars.iv21.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit33 ], [ %indvars.iv.next22.i, %._crit_edge.i ]
  %32 = trunc i64 %indvars.iv21.i to i32
  %33 = uitofp nneg i32 %32 to float
  %34 = getelementptr [4000 x i8], ptr %10, i64 %indvars.iv21.i
  %35 = add i32 %32, -4
  %36 = sitofp i32 %35 to float
  %37 = getelementptr [4000 x i8], ptr %16, i64 %indvars.iv21.i
  br i1 %diff.check, label %scalar.ph.preheader, label %vector.ph

scalar.ph.preheader:                              ; preds = %.preheader.i
  %38 = insertelement <2 x float> poison, float %33, i64 0
  %39 = insertelement <2 x float> %38, float %36, i64 1
  br label %scalar.ph

vector.ph:                                        ; preds = %.preheader.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %33, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert46 = insertelement <4 x float> poison, float %36, i64 0
  %broadcast.splat47 = shufflevector <4 x float> %broadcast.splatinsert46, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %40 = add <4 x i32> %vec.ind, splat (i32 2)
  %41 = uitofp nneg <4 x i32> %40 to <4 x float>
  %42 = fmul nnan <4 x float> %broadcast.splat, %41
  %43 = fadd <4 x float> %42, splat (float 1.000000e+01)
  %44 = fdiv <4 x float> %43, splat (float 1.000000e+03)
  %45 = getelementptr [4 x i8], ptr %34, i64 %index
  store <4 x float> %44, ptr %45, align 4
  %46 = add <4 x i32> %vec.ind, splat (i32 -1)
  %47 = sitofp <4 x i32> %46 to <4 x float>
  %48 = fmul nnan <4 x float> %broadcast.splat47, %47
  %49 = fadd <4 x float> %48, splat (float 1.100000e+01)
  %50 = fdiv <4 x float> %49, splat (float 1.000000e+03)
  %51 = getelementptr [4 x i8], ptr %37, i64 %index
  store <4 x float> %50, ptr %51, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %52 = icmp eq i64 %index.next, 1000
  br i1 %52, label %._crit_edge.i, label %vector.body, !llvm.loop !22

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %53 = trunc i64 %indvars.iv.i to i32
  %54 = getelementptr [4 x i8], ptr %34, i64 %indvars.iv.i
  %55 = add i32 %53, -1
  %56 = add i32 %53, 2
  %57 = sitofp i32 %55 to float
  %58 = uitofp nneg i32 %56 to float
  %59 = insertelement <2 x float> poison, float %58, i64 0
  %60 = insertelement <2 x float> %59, float %57, i64 1
  %61 = fmul nnan <2 x float> %39, %60
  %62 = fadd <2 x float> %61, <float 1.000000e+01, float 1.100000e+01>
  %63 = fdiv <2 x float> %62, splat (float 1.000000e+03)
  %64 = extractelement <2 x float> %63, i64 0
  store float %64, ptr %54, align 4
  %65 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv.i
  %66 = extractelement <2 x float> %63, i64 1
  store float %66, ptr %65, align 4
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.not.i, label %._crit_edge.i, label %scalar.ph, !llvm.loop !23

._crit_edge.i:                                    ; preds = %vector.body, %scalar.ph
  %indvars.iv.next22.i = add nuw nsw i64 %indvars.iv21.i, 1
  %exitcond25.not.i = icmp eq i64 %indvars.iv.next22.i, 1000
  br i1 %exitcond25.not.i, label %_Z10init_arrayiPA1000_fS0_.exit, label %.preheader.i

_Z10init_arrayiPA1000_fS0_.exit:                  ; preds = %._crit_edge.i
  call void @_Z15runJacobi2DCUDAiiPA1000_fS0_S0_S0_(i32 noundef 20, i32 noundef 1000, ptr noundef nonnull %10, ptr noundef nonnull %16, ptr noundef %22, ptr noundef %27) #6
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %67 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #13
  %.not.i.i34 = icmp eq i32 %67, 0
  br i1 %.not.i.i34, label %_Z21polybench_timer_startv.exit, label %68

68:                                               ; preds = %_Z10init_arrayiPA1000_fS0_.exit
  %69 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %67) #6
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiPA1000_fS0_.exit, %68
  %70 = load i64, ptr %4, align 8
  %71 = sitofp i64 %70 to double
  %72 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %73 = load i64, ptr %72, align 8
  %74 = sitofp i64 %73 to double
  %75 = fmul nnan double %74, f0x3EB0C6F7A0B5ED8D
  %76 = fadd double %75, %71
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %76, ptr @polybench_t_start, align 8
  %scevgep = getelementptr i8, ptr %16, i64 4004
  %scevgep58 = getelementptr i8, ptr %16, i64 3995996
  %scevgep59 = getelementptr i8, ptr %10, i64 4
  %scevgep60 = getelementptr i8, ptr %10, i64 3999996
  %bound0 = icmp ult ptr %scevgep, %scevgep60
  %bound1 = icmp ult ptr %scevgep59, %scevgep58
  %found.conflict = and i1 %bound0, %bound1
  %77 = sub i64 %17, %11
  %diff.check49 = icmp ugt i64 %77, -32
  br label %.preheader45.us.us.i

.preheader45.us.us.i:                             ; preds = %._crit_edge51.us.us.i, %_Z21polybench_timer_startv.exit
  %.052.us.us.i = phi i32 [ %167, %._crit_edge51.us.us.i ], [ 0, %_Z21polybench_timer_startv.exit ]
  br label %.preheader43.us.us.i

scalar.ph61:                                      ; preds = %scalar.ph61, %scalar.ph61.preheader.new
  %indvars.iv.i35 = phi i64 [ %indvars.iv.i35.ph, %scalar.ph61.preheader.new ], [ %indvars.iv.next.i36.1, %scalar.ph61 ]
  %78 = getelementptr [4 x i8], ptr %138, i64 %indvars.iv.i35
  %79 = load float, ptr %78, align 4
  %80 = getelementptr i8, ptr %78, i64 -4
  %81 = load float, ptr %80, align 4
  %82 = fadd float %79, %81
  %indvars.iv.next.i36 = add nuw nsw i64 %indvars.iv.i35, 1
  %83 = getelementptr [4 x i8], ptr %138, i64 %indvars.iv.next.i36
  %84 = load float, ptr %83, align 4
  %85 = fadd float %82, %84
  %86 = getelementptr [4 x i8], ptr %139, i64 %indvars.iv.i35
  %87 = load float, ptr %86, align 4
  %88 = fadd float %85, %87
  %89 = getelementptr [4 x i8], ptr %140, i64 %indvars.iv.i35
  %90 = load float, ptr %89, align 4
  %91 = fadd float %88, %90
  %92 = fmul float %91, 2.000000e-01
  %93 = getelementptr [4 x i8], ptr %141, i64 %indvars.iv.i35
  store float %92, ptr %93, align 4
  %94 = getelementptr [4 x i8], ptr %138, i64 %indvars.iv.next.i36
  %95 = load float, ptr %94, align 4
  %96 = getelementptr i8, ptr %94, i64 -4
  %97 = load float, ptr %96, align 4
  %98 = fadd float %95, %97
  %indvars.iv.next.i36.1 = add nuw nsw i64 %indvars.iv.i35, 2
  %99 = getelementptr [4 x i8], ptr %138, i64 %indvars.iv.next.i36.1
  %100 = load float, ptr %99, align 4
  %101 = fadd float %98, %100
  %102 = getelementptr [4 x i8], ptr %139, i64 %indvars.iv.next.i36
  %103 = load float, ptr %102, align 4
  %104 = fadd float %101, %103
  %105 = getelementptr [4 x i8], ptr %140, i64 %indvars.iv.next.i36
  %106 = load float, ptr %105, align 4
  %107 = fadd float %104, %106
  %108 = fmul float %107, 2.000000e-01
  %109 = getelementptr [4 x i8], ptr %141, i64 %indvars.iv.next.i36
  store float %108, ptr %109, align 4
  %exitcond.not.i37.1 = icmp eq i64 %indvars.iv.next.i36.1, 999
  br i1 %exitcond.not.i37.1, label %._crit_edge.us.us.i, label %scalar.ph61, !llvm.loop !24

scalar.ph50:                                      ; preds = %scalar.ph50.prol, %scalar.ph50
  %indvars.iv61.i = phi i64 [ %indvars.iv.next62.i.3, %scalar.ph50 ], [ %indvars.iv.next62.i.prol, %scalar.ph50.prol ]
  %110 = getelementptr [4 x i8], ptr %122, i64 %indvars.iv61.i
  %111 = load float, ptr %110, align 4
  %112 = getelementptr [4 x i8], ptr %123, i64 %indvars.iv61.i
  store float %111, ptr %112, align 4
  %indvars.iv.next62.i = add nuw nsw i64 %indvars.iv61.i, 1
  %113 = getelementptr [4 x i8], ptr %122, i64 %indvars.iv.next62.i
  %114 = load float, ptr %113, align 4
  %115 = getelementptr [4 x i8], ptr %123, i64 %indvars.iv.next62.i
  store float %114, ptr %115, align 4
  %indvars.iv.next62.i.1 = add nuw nsw i64 %indvars.iv61.i, 2
  %116 = getelementptr [4 x i8], ptr %122, i64 %indvars.iv.next62.i.1
  %117 = load float, ptr %116, align 4
  %118 = getelementptr [4 x i8], ptr %123, i64 %indvars.iv.next62.i.1
  store float %117, ptr %118, align 4
  %indvars.iv.next62.i.2 = add nuw nsw i64 %indvars.iv61.i, 3
  %119 = getelementptr [4 x i8], ptr %122, i64 %indvars.iv.next62.i.2
  %120 = load float, ptr %119, align 4
  %121 = getelementptr [4 x i8], ptr %123, i64 %indvars.iv.next62.i.2
  store float %120, ptr %121, align 4
  %indvars.iv.next62.i.3 = add nuw nsw i64 %indvars.iv61.i, 4
  %exitcond65.not.i.3 = icmp eq i64 %indvars.iv.next62.i.3, 999
  br i1 %exitcond65.not.i.3, label %._crit_edge49.us.us.i, label %scalar.ph50, !llvm.loop !25

.preheader.us.us.i:                               ; preds = %._crit_edge.us.us.i, %._crit_edge49.us.us.i
  %indvars.iv66.i = phi i64 [ %indvars.iv.next67.i, %._crit_edge49.us.us.i ], [ 1, %._crit_edge.us.us.i ]
  %122 = getelementptr [4000 x i8], ptr %16, i64 %indvars.iv66.i
  %123 = getelementptr [4000 x i8], ptr %10, i64 %indvars.iv66.i
  br i1 %diff.check49, label %scalar.ph50.prol.preheader, label %vector.body52

scalar.ph50.prol.preheader:                       ; preds = %.preheader.us.us.i, %vector.body52
  %indvars.iv61.i.ph = phi i64 [ 1, %.preheader.us.us.i ], [ 993, %vector.body52 ]
  br label %scalar.ph50.prol

scalar.ph50.prol:                                 ; preds = %scalar.ph50.prol, %scalar.ph50.prol.preheader
  %indvars.iv61.i.prol = phi i64 [ %indvars.iv.next62.i.prol, %scalar.ph50.prol ], [ %indvars.iv61.i.ph, %scalar.ph50.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %scalar.ph50.prol ], [ 0, %scalar.ph50.prol.preheader ]
  %124 = getelementptr [4 x i8], ptr %122, i64 %indvars.iv61.i.prol
  %125 = load float, ptr %124, align 4
  %126 = getelementptr [4 x i8], ptr %123, i64 %indvars.iv61.i.prol
  store float %125, ptr %126, align 4
  %indvars.iv.next62.i.prol = add nuw nsw i64 %indvars.iv61.i.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, 2
  br i1 %prol.iter.cmp.not, label %scalar.ph50, label %scalar.ph50.prol, !llvm.loop !26

vector.body52:                                    ; preds = %.preheader.us.us.i, %vector.body52
  %index53 = phi i64 [ %index.next55.1, %vector.body52 ], [ 0, %.preheader.us.us.i ]
  %127 = or disjoint i64 %index53, 1
  %128 = getelementptr [4 x i8], ptr %122, i64 %127
  %129 = getelementptr i8, ptr %128, i64 16
  %wide.load = load <4 x float>, ptr %128, align 4
  %wide.load54 = load <4 x float>, ptr %129, align 4
  %130 = getelementptr [4 x i8], ptr %123, i64 %127
  %131 = getelementptr i8, ptr %130, i64 16
  store <4 x float> %wide.load, ptr %130, align 4
  store <4 x float> %wide.load54, ptr %131, align 4
  %132 = or disjoint i64 %index53, 9
  %133 = getelementptr [4 x i8], ptr %122, i64 %132
  %134 = getelementptr i8, ptr %133, i64 16
  %wide.load.1 = load <4 x float>, ptr %133, align 4
  %wide.load54.1 = load <4 x float>, ptr %134, align 4
  %135 = getelementptr [4 x i8], ptr %123, i64 %132
  %136 = getelementptr i8, ptr %135, i64 16
  store <4 x float> %wide.load.1, ptr %135, align 4
  store <4 x float> %wide.load54.1, ptr %136, align 4
  %index.next55.1 = add nuw nsw i64 %index53, 16
  %137 = icmp eq i64 %index.next55.1, 992
  br i1 %137, label %scalar.ph50.prol.preheader, label %vector.body52, !llvm.loop !27

.preheader43.us.us.i:                             ; preds = %._crit_edge.us.us.i, %.preheader45.us.us.i
  %indvars.iv55.i = phi i64 [ %indvars.iv.next56.i, %._crit_edge.us.us.i ], [ 1, %.preheader45.us.us.i ]
  %138 = getelementptr [4000 x i8], ptr %10, i64 %indvars.iv55.i
  %139 = getelementptr i8, ptr %138, i64 4000
  %140 = getelementptr i8, ptr %138, i64 -4000
  %141 = getelementptr [4000 x i8], ptr %16, i64 %indvars.iv55.i
  br i1 %found.conflict, label %scalar.ph61.preheader.new, label %vector.body63

scalar.ph61.preheader.new:                        ; preds = %vector.body63, %.preheader43.us.us.i
  %indvars.iv.i35.ph = phi i64 [ 1, %.preheader43.us.us.i ], [ 993, %vector.body63 ]
  br label %scalar.ph61

vector.body63:                                    ; preds = %.preheader43.us.us.i, %vector.body63
  %index64 = phi i64 [ %index.next75, %vector.body63 ], [ 0, %.preheader43.us.us.i ]
  %142 = or disjoint i64 %index64, 1
  %143 = getelementptr [4 x i8], ptr %138, i64 %142
  %144 = getelementptr i8, ptr %143, i64 16
  %wide.load65 = load <4 x float>, ptr %143, align 4, !alias.scope !28
  %wide.load66 = load <4 x float>, ptr %144, align 4, !alias.scope !28
  %145 = getelementptr i8, ptr %143, i64 -4
  %146 = getelementptr i8, ptr %143, i64 12
  %wide.load67 = load <4 x float>, ptr %145, align 4, !alias.scope !28
  %wide.load68 = load <4 x float>, ptr %146, align 4, !alias.scope !28
  %147 = fadd <4 x float> %wide.load65, %wide.load67
  %148 = fadd <4 x float> %wide.load66, %wide.load68
  %149 = getelementptr [4 x i8], ptr %138, i64 %index64
  %150 = getelementptr i8, ptr %149, i64 8
  %151 = getelementptr i8, ptr %149, i64 24
  %wide.load69 = load <4 x float>, ptr %150, align 4, !alias.scope !28
  %wide.load70 = load <4 x float>, ptr %151, align 4, !alias.scope !28
  %152 = fadd <4 x float> %147, %wide.load69
  %153 = fadd <4 x float> %148, %wide.load70
  %154 = getelementptr [4 x i8], ptr %139, i64 %142
  %155 = getelementptr i8, ptr %154, i64 16
  %wide.load71 = load <4 x float>, ptr %154, align 4, !alias.scope !28
  %wide.load72 = load <4 x float>, ptr %155, align 4, !alias.scope !28
  %156 = fadd <4 x float> %152, %wide.load71
  %157 = fadd <4 x float> %153, %wide.load72
  %158 = getelementptr [4 x i8], ptr %140, i64 %142
  %159 = getelementptr i8, ptr %158, i64 16
  %wide.load73 = load <4 x float>, ptr %158, align 4, !alias.scope !28
  %wide.load74 = load <4 x float>, ptr %159, align 4, !alias.scope !28
  %160 = fadd <4 x float> %156, %wide.load73
  %161 = fadd <4 x float> %157, %wide.load74
  %162 = fmul <4 x float> %160, splat (float 2.000000e-01)
  %163 = fmul <4 x float> %161, splat (float 2.000000e-01)
  %164 = getelementptr [4 x i8], ptr %141, i64 %142
  %165 = getelementptr i8, ptr %164, i64 16
  store <4 x float> %162, ptr %164, align 4, !alias.scope !31, !noalias !28
  store <4 x float> %163, ptr %165, align 4, !alias.scope !31, !noalias !28
  %index.next75 = add nuw i64 %index64, 8
  %166 = icmp eq i64 %index.next75, 992
  br i1 %166, label %scalar.ph61.preheader.new, label %vector.body63, !llvm.loop !33

._crit_edge.us.us.i:                              ; preds = %scalar.ph61
  %indvars.iv.next56.i = add nuw nsw i64 %indvars.iv55.i, 1
  %exitcond59.not.i = icmp eq i64 %indvars.iv.next56.i, 999
  br i1 %exitcond59.not.i, label %.preheader.us.us.i, label %.preheader43.us.us.i

._crit_edge49.us.us.i:                            ; preds = %scalar.ph50
  %indvars.iv.next67.i = add nuw nsw i64 %indvars.iv66.i, 1
  %exitcond70.not.i = icmp eq i64 %indvars.iv.next67.i, 999
  br i1 %exitcond70.not.i, label %._crit_edge51.us.us.i, label %.preheader.us.us.i

._crit_edge51.us.us.i:                            ; preds = %._crit_edge49.us.us.i
  %167 = add nuw nsw i32 %.052.us.us.i, 1
  %exitcond71.not.i = icmp eq i32 %167, 20
  br i1 %exitcond71.not.i, label %_Z14runJacobi2DCpuiiPA1000_fS0_.exit, label %.preheader45.us.us.i

_Z14runJacobi2DCpuiiPA1000_fS0_.exit:             ; preds = %._crit_edge51.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %168 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #13
  %.not.i.i38 = icmp eq i32 %168, 0
  br i1 %.not.i.i38, label %_Z20polybench_timer_stopv.exit, label %169

169:                                              ; preds = %_Z14runJacobi2DCpuiiPA1000_fS0_.exit
  %170 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef %168) #6
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z14runJacobi2DCpuiiPA1000_fS0_.exit, %169
  %171 = load i64, ptr %3, align 8
  %172 = sitofp i64 %171 to double
  %173 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %174 = load i64, ptr %173, align 8
  %175 = sitofp i64 %174 to double
  %176 = fmul nnan double %175, f0x3EB0C6F7A0B5ED8D
  %177 = fadd double %176, %172
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %177, ptr @polybench_t_end, align 8
  %178 = load double, ptr @polybench_t_start, align 8
  %179 = fsub double %177, %178
  %180 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, double noundef %179) #6
  call void @_Z14compareResultsiPA1000_fS0_S0_S0_(i32 noundef 1000, ptr noundef nonnull %10, ptr noundef %22, ptr noundef nonnull %16, ptr noundef %27) #6
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
!5 = distinct !{!5, !2}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !2, !3}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !2, !3}
!16 = distinct !{!16, !2, !3}
!17 = distinct !{!17, !3, !2}
!18 = distinct !{!18, !2, !3}
!19 = distinct !{!19, !3, !2}
!20 = !{ptr @_Z36__device_stub__runJacobiCUDA_kernel1iPfS_}
!21 = !{ptr @_Z36__device_stub__runJacobiCUDA_kernel2iPfS_}
!22 = distinct !{!22, !2, !3}
!23 = distinct !{!23, !2}
!24 = distinct !{!24, !2}
!25 = distinct !{!25, !2}
!26 = distinct !{!26, !9}
!27 = distinct !{!27, !2, !3}
!28 = !{!29}
!29 = distinct !{!29, !30}
!30 = distinct !{!30, !"LVerDomain"}
!31 = !{!32}
!32 = distinct !{!32, !30}
!33 = distinct !{!33, !2, !3}
