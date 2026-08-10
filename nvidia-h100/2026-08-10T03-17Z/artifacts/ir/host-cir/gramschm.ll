; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu"
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

; Function Attrs: nounwind
define dso_local void @_Z11gramschmidtiiPA2048_fS0_S0_(i32 noundef %0, i32 noundef %1, ptr nofree noundef captures(none) %2, ptr nofree noundef captures(none) %3, ptr nofree noundef captures(none) %4) local_unnamed_addr #1 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader67.lr.ph, label %._crit_edge96

.preheader67.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = zext nneg i32 %1 to i64
  %wide.trip.count123 = zext nneg i32 %1 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count101 = zext nneg i32 %0 to i64
  %wide.trip.count111 = zext nneg i32 %0 to i64
  %9 = shl nuw nsw i64 %wide.trip.count, 13
  %10 = shl nuw nsw i64 %wide.trip.count123, 2
  %11 = add nuw nsw i64 %9, %10
  %12 = add nsw i64 %11, -8192
  %scevgep133 = getelementptr i8, ptr %2, i64 %12
  %scevgep142 = getelementptr i8, ptr %4, i64 %12
  %13 = mul nuw nsw i64 %wide.trip.count123, 8196
  %14 = getelementptr i8, ptr %3, i64 %13
  %scevgep143 = getelementptr i8, ptr %14, i64 -8192
  %15 = getelementptr i8, ptr %4, i64 %9
  %16 = getelementptr i8, ptr %15, i64 -8188
  %17 = getelementptr i8, ptr %3, i64 %10
  %xtraiter = and i64 %wide.trip.count, 3
  %18 = icmp ult i32 %0, 4
  %unroll_iter = and i64 %wide.trip.count, 2147483644
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %lcmp.mod167 = icmp ne i64 %xtraiter, 0
  %min.iters.check152 = icmp ult i32 %0, 4
  %bound0144 = icmp ult ptr %4, %scevgep133
  %bound1145 = icmp ult ptr %2, %scevgep142
  %found.conflict146 = and i1 %bound0144, %bound1145
  %bound0147 = icmp ult ptr %4, %scevgep143
  %bound1148 = icmp ult ptr %3, %scevgep142
  %found.conflict149 = and i1 %bound0147, %bound1148
  %conflict.rdx150 = or i1 %found.conflict146, %found.conflict149
  %n.vec155 = and i64 %wide.trip.count, 2147483644
  %cmp.n162 = icmp eq i64 %n.vec155, %wide.trip.count
  %xtraiter168 = and i64 %wide.trip.count, 1
  %lcmp.mod169.not = icmp eq i64 %xtraiter168, 0
  %19 = add nsw i64 %wide.trip.count, -1
  %xtraiter170 = and i64 %wide.trip.count, 1
  %20 = icmp eq i32 %0, 1
  %unroll_iter174 = and i64 %wide.trip.count, 2147483646
  %lcmp.mod172.not = icmp eq i64 %xtraiter170, 0
  %lcmp.mod173 = trunc i32 %0 to i1
  %min.iters.check = icmp ult i32 %0, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  %xtraiter176 = and i64 %wide.trip.count, 1
  %lcmp.mod177.not = icmp eq i64 %xtraiter176, 0
  %21 = add nsw i64 %wide.trip.count, -1
  br label %.preheader67

.loopexit:                                        ; preds = %._crit_edge91, %._crit_edge77
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond124.not = icmp eq i64 %indvars.iv.next121, %wide.trip.count123
  br i1 %exitcond124.not, label %._crit_edge96, label %.preheader67

.preheader67:                                     ; preds = %.preheader67.lr.ph, %.loopexit
  %indvars.iv120 = phi i64 [ 0, %.preheader67.lr.ph ], [ %indvars.iv.next121, %.loopexit ]
  %indvars.iv113 = phi i64 [ 1, %.preheader67.lr.ph ], [ %indvars.iv.next114, %.loopexit ]
  %22 = shl nuw nsw i64 %indvars.iv120, 2
  %23 = getelementptr i8, ptr %2, i64 %22
  %scevgep = getelementptr i8, ptr %23, i64 4
  %scevgep134 = getelementptr i8, ptr %4, i64 %22
  %scevgep135 = getelementptr i8, ptr %16, i64 %22
  %24 = mul nuw nsw i64 %indvars.iv120, 8196
  %25 = getelementptr i8, ptr %3, i64 %24
  %scevgep136 = getelementptr i8, ptr %25, i64 4
  %26 = shl nuw nsw i64 %indvars.iv120, 13
  %scevgep137 = getelementptr i8, ptr %17, i64 %26
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader67
  %invariant.gep = getelementptr [4 x i8], ptr %2, i64 %indvars.iv120
  br i1 %18, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.lr.ph ]
  %.069 = phi float [ %41, %.lr.ph.new ], [ 0.000000e+00, %.lr.ph ]
  %niter = phi i64 [ %niter.next.3, %.lr.ph.new ], [ 0, %.lr.ph ]
  %gep = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv
  %27 = load float, ptr %gep, align 4
  %28 = fmul float %27, %27
  %29 = fadd float %.069, %28
  %30 = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv
  %gep.1 = getelementptr i8, ptr %30, i64 8192
  %31 = load float, ptr %gep.1, align 4
  %32 = fmul float %31, %31
  %33 = fadd float %29, %32
  %34 = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv
  %gep.2 = getelementptr i8, ptr %34, i64 16384
  %35 = load float, ptr %gep.2, align 4
  %36 = fmul float %35, %35
  %37 = fadd float %33, %36
  %38 = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv
  %gep.3 = getelementptr i8, ptr %38, i64 24576
  %39 = load float, ptr %gep.3, align 4
  %40 = fmul float %39, %39
  %41 = fadd float %37, %40
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.next.3 = add i64 %niter, 4
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.lr.ph76.preheader.unr-lcssa, label %.lr.ph.new

._crit_edge:                                      ; preds = %.preheader67
  %sqrtf = tail call float @sqrtf(float noundef 0.000000e+00) #14
  %42 = getelementptr [8192 x i8], ptr %3, i64 %indvars.iv120
  %43 = getelementptr [4 x i8], ptr %42, i64 %indvars.iv120
  store float 0.000000e+00, ptr %43, align 4
  br label %._crit_edge77

.lr.ph76.preheader.unr-lcssa:                     ; preds = %.lr.ph.new
  br i1 %lcmp.mod.not, label %.lr.ph76.preheader, label %.epil.preheader

.epil.preheader:                                  ; preds = %.lr.ph76.preheader.unr-lcssa, %.lr.ph
  %indvars.iv.epil.init = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.3, %.lr.ph76.preheader.unr-lcssa ]
  %.069.epil.init = phi float [ 0.000000e+00, %.lr.ph ], [ %41, %.lr.ph76.preheader.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod167)
  br label %44

44:                                               ; preds = %44, %.epil.preheader
  %indvars.iv.epil = phi i64 [ %indvars.iv.epil.init, %.epil.preheader ], [ %indvars.iv.next.epil, %44 ]
  %.069.epil = phi float [ %.069.epil.init, %.epil.preheader ], [ %47, %44 ]
  %epil.iter = phi i64 [ 0, %.epil.preheader ], [ %epil.iter.next, %44 ]
  %gep.epil = getelementptr [8192 x i8], ptr %invariant.gep, i64 %indvars.iv.epil
  %45 = load float, ptr %gep.epil, align 4
  %46 = fmul float %45, %45
  %47 = fadd float %.069.epil, %46
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.lr.ph76.preheader, label %44, !llvm.loop !1

.lr.ph76.preheader:                               ; preds = %44, %.lr.ph76.preheader.unr-lcssa
  %.lcssa = phi float [ %41, %.lr.ph76.preheader.unr-lcssa ], [ %47, %44 ]
  %sqrtf127 = tail call float @sqrtf(float noundef %.lcssa) #14
  %48 = getelementptr [8192 x i8], ptr %3, i64 %indvars.iv120
  %49 = getelementptr [4 x i8], ptr %48, i64 %indvars.iv120
  store float %sqrtf127, ptr %49, align 4
  %invariant.gep70128 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv120
  %invariant.gep72129 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv120
  %brmerge = select i1 %min.iters.check152, i1 true, i1 %conflict.rdx150
  br i1 %brmerge, label %.lr.ph76.preheader165, label %vector.ph153

vector.ph153:                                     ; preds = %.lr.ph76.preheader
  %50 = load float, ptr %49, align 4, !alias.scope !3
  %broadcast.splatinsert158 = insertelement <4 x float> poison, float %50, i64 0
  %broadcast.splat159 = shufflevector <4 x float> %broadcast.splatinsert158, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body156

vector.body156:                                   ; preds = %vector.body156, %vector.ph153
  %index157 = phi i64 [ 0, %vector.ph153 ], [ %index.next160, %vector.body156 ]
  %51 = or disjoint i64 %index157, 1
  %52 = or disjoint i64 %index157, 2
  %53 = or disjoint i64 %index157, 3
  %54 = getelementptr [8192 x i8], ptr %invariant.gep70128, i64 %index157
  %55 = getelementptr [8192 x i8], ptr %invariant.gep70128, i64 %51
  %56 = getelementptr [8192 x i8], ptr %invariant.gep70128, i64 %52
  %57 = getelementptr [8192 x i8], ptr %invariant.gep70128, i64 %53
  %58 = load float, ptr %54, align 4, !alias.scope !6
  %59 = load float, ptr %55, align 4, !alias.scope !6
  %60 = load float, ptr %56, align 4, !alias.scope !6
  %61 = load float, ptr %57, align 4, !alias.scope !6
  %62 = insertelement <4 x float> poison, float %58, i64 0
  %63 = insertelement <4 x float> %62, float %59, i64 1
  %64 = insertelement <4 x float> %63, float %60, i64 2
  %65 = insertelement <4 x float> %64, float %61, i64 3
  %66 = fdiv <4 x float> %65, %broadcast.splat159
  %67 = getelementptr [8192 x i8], ptr %invariant.gep72129, i64 %index157
  %68 = getelementptr [8192 x i8], ptr %invariant.gep72129, i64 %51
  %69 = getelementptr [8192 x i8], ptr %invariant.gep72129, i64 %52
  %70 = getelementptr [8192 x i8], ptr %invariant.gep72129, i64 %53
  %71 = extractelement <4 x float> %66, i64 0
  store float %71, ptr %67, align 4, !alias.scope !8, !noalias !10
  %72 = extractelement <4 x float> %66, i64 1
  store float %72, ptr %68, align 4, !alias.scope !8, !noalias !10
  %73 = extractelement <4 x float> %66, i64 2
  store float %73, ptr %69, align 4, !alias.scope !8, !noalias !10
  %74 = extractelement <4 x float> %66, i64 3
  store float %74, ptr %70, align 4, !alias.scope !8, !noalias !10
  %index.next160 = add nuw i64 %index157, 4
  %75 = icmp eq i64 %index.next160, %n.vec155
  br i1 %75, label %middle.block161, label %vector.body156, !llvm.loop !11

middle.block161:                                  ; preds = %vector.body156
  br i1 %cmp.n162, label %._crit_edge77, label %.lr.ph76.preheader165

.lr.ph76.preheader165:                            ; preds = %.lr.ph76.preheader, %middle.block161
  %indvars.iv98.ph = phi i64 [ %n.vec155, %middle.block161 ], [ 0, %.lr.ph76.preheader ]
  br i1 %lcmp.mod169.not, label %.lr.ph76.prol.loopexit, label %.lr.ph76.prol

.lr.ph76.prol:                                    ; preds = %.lr.ph76.preheader165
  %gep71.prol = getelementptr [8192 x i8], ptr %invariant.gep70128, i64 %indvars.iv98.ph
  %76 = load float, ptr %gep71.prol, align 4
  %77 = load float, ptr %49, align 4
  %78 = fdiv float %76, %77
  %gep73.prol = getelementptr [8192 x i8], ptr %invariant.gep72129, i64 %indvars.iv98.ph
  store float %78, ptr %gep73.prol, align 4
  %indvars.iv.next99.prol = or disjoint i64 %indvars.iv98.ph, 1
  br label %.lr.ph76.prol.loopexit

.lr.ph76.prol.loopexit:                           ; preds = %.lr.ph76.prol, %.lr.ph76.preheader165
  %indvars.iv98.unr = phi i64 [ %indvars.iv98.ph, %.lr.ph76.preheader165 ], [ %indvars.iv.next99.prol, %.lr.ph76.prol ]
  %79 = icmp eq i64 %indvars.iv98.ph, %19
  br i1 %79, label %._crit_edge77, label %.lr.ph76

.lr.ph76:                                         ; preds = %.lr.ph76.prol.loopexit, %.lr.ph76
  %indvars.iv98 = phi i64 [ %indvars.iv.next99.1, %.lr.ph76 ], [ %indvars.iv98.unr, %.lr.ph76.prol.loopexit ]
  %gep71 = getelementptr [8192 x i8], ptr %invariant.gep70128, i64 %indvars.iv98
  %80 = load float, ptr %gep71, align 4
  %81 = load float, ptr %49, align 4
  %82 = fdiv float %80, %81
  %gep73 = getelementptr [8192 x i8], ptr %invariant.gep72129, i64 %indvars.iv98
  store float %82, ptr %gep73, align 4
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %gep71.1 = getelementptr [8192 x i8], ptr %invariant.gep70128, i64 %indvars.iv.next99
  %83 = load float, ptr %gep71.1, align 4
  %84 = load float, ptr %49, align 4
  %85 = fdiv float %83, %84
  %gep73.1 = getelementptr [8192 x i8], ptr %invariant.gep72129, i64 %indvars.iv.next99
  store float %85, ptr %gep73.1, align 4
  %indvars.iv.next99.1 = add nuw nsw i64 %indvars.iv98, 2
  %exitcond102.not.1 = icmp eq i64 %indvars.iv.next99.1, %wide.trip.count101
  br i1 %exitcond102.not.1, label %._crit_edge77, label %.lr.ph76, !llvm.loop !14

._crit_edge77:                                    ; preds = %.lr.ph76.prol.loopexit, %.lr.ph76, %middle.block161, %._crit_edge
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %86 = icmp samesign ult i64 %indvars.iv.next121, %8
  br i1 %86, label %.lr.ph94.preheader, label %.loopexit

.lr.ph94.preheader:                               ; preds = %._crit_edge77
  %87 = getelementptr [8192 x i8], ptr %3, i64 %indvars.iv120
  %88 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv120
  %89 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv120
  %90 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv120
  %bound0 = icmp ult ptr %scevgep, %scevgep135
  %bound1 = icmp ult ptr %scevgep134, %scevgep133
  %found.conflict = and i1 %bound0, %bound1
  %bound0138 = icmp ult ptr %scevgep, %scevgep137
  %bound1139 = icmp ult ptr %scevgep136, %scevgep133
  %found.conflict140 = and i1 %bound0138, %bound1139
  %conflict.rdx = or i1 %found.conflict, %found.conflict140
  %91 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv120
  %92 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv120
  %93 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv120
  %94 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv120
  br label %.lr.ph94

.lr.ph94:                                         ; preds = %.lr.ph94.preheader, %._crit_edge91
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %._crit_edge91 ], [ %indvars.iv113, %.lr.ph94.preheader ]
  %95 = getelementptr [4 x i8], ptr %87, i64 %indvars.iv115
  store float 0.000000e+00, ptr %95, align 4
  %invariant.gep80 = getelementptr [4 x i8], ptr %2, i64 %indvars.iv115
  br i1 %7, label %.lr.ph84.preheader, label %._crit_edge91

.lr.ph84.preheader:                               ; preds = %.lr.ph94
  br i1 %20, label %.lr.ph84.epil.preheader, label %.lr.ph84

.lr.ph84:                                         ; preds = %.lr.ph84.preheader, %.lr.ph84
  %indvars.iv103 = phi i64 [ %indvars.iv.next104.1, %.lr.ph84 ], [ 0, %.lr.ph84.preheader ]
  %96 = phi float [ %104, %.lr.ph84 ], [ 0.000000e+00, %.lr.ph84.preheader ]
  %niter175 = phi i64 [ %niter175.next.1, %.lr.ph84 ], [ 0, %.lr.ph84.preheader ]
  %gep79 = getelementptr [8192 x i8], ptr %88, i64 %indvars.iv103
  %97 = load float, ptr %gep79, align 4
  %gep81 = getelementptr [8192 x i8], ptr %invariant.gep80, i64 %indvars.iv103
  %98 = load float, ptr %gep81, align 4
  %99 = fmul float %97, %98
  %100 = fadd float %96, %99
  store float %100, ptr %95, align 4
  %indvars.iv.next104 = or disjoint i64 %indvars.iv103, 1
  %gep79.1 = getelementptr [8192 x i8], ptr %89, i64 %indvars.iv.next104
  %101 = load float, ptr %gep79.1, align 4
  %gep81.1 = getelementptr [8192 x i8], ptr %invariant.gep80, i64 %indvars.iv.next104
  %102 = load float, ptr %gep81.1, align 4
  %103 = fmul float %101, %102
  %104 = fadd float %100, %103
  store float %104, ptr %95, align 4
  %indvars.iv.next104.1 = add nuw nsw i64 %indvars.iv103, 2
  %niter175.next.1 = add i64 %niter175, 2
  %niter175.ncmp.1 = icmp eq i64 %niter175.next.1, %unroll_iter174
  br i1 %niter175.ncmp.1, label %.lr.ph90.preheader.unr-lcssa, label %.lr.ph84

.lr.ph90.preheader.unr-lcssa:                     ; preds = %.lr.ph84
  br i1 %lcmp.mod172.not, label %.lr.ph90.preheader, label %.lr.ph84.epil.preheader

.lr.ph84.epil.preheader:                          ; preds = %.lr.ph90.preheader.unr-lcssa, %.lr.ph84.preheader
  %indvars.iv103.epil.init = phi i64 [ 0, %.lr.ph84.preheader ], [ %indvars.iv.next104.1, %.lr.ph90.preheader.unr-lcssa ]
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph84.preheader ], [ %104, %.lr.ph90.preheader.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod173)
  %gep79.epil = getelementptr [8192 x i8], ptr %90, i64 %indvars.iv103.epil.init
  %105 = load float, ptr %gep79.epil, align 4
  %gep81.epil = getelementptr [8192 x i8], ptr %invariant.gep80, i64 %indvars.iv103.epil.init
  %106 = load float, ptr %gep81.epil, align 4
  %107 = fmul float %105, %106
  %108 = fadd float %.epil.init, %107
  store float %108, ptr %95, align 4
  br label %.lr.ph90.preheader

.lr.ph90.preheader:                               ; preds = %.lr.ph90.preheader.unr-lcssa, %.lr.ph84.epil.preheader
  %brmerge181 = select i1 %min.iters.check, i1 true, i1 %conflict.rdx
  br i1 %brmerge181, label %.lr.ph90.preheader164, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph90.preheader
  %109 = load float, ptr %95, align 4, !alias.scope !15
  %broadcast.splatinsert = insertelement <4 x float> poison, float %109, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %110 = or disjoint i64 %index, 1
  %111 = or disjoint i64 %index, 2
  %112 = or disjoint i64 %index, 3
  %113 = getelementptr [8192 x i8], ptr %invariant.gep80, i64 %index
  %114 = getelementptr [8192 x i8], ptr %invariant.gep80, i64 %110
  %115 = getelementptr [8192 x i8], ptr %invariant.gep80, i64 %111
  %116 = getelementptr [8192 x i8], ptr %invariant.gep80, i64 %112
  %117 = load float, ptr %113, align 4, !alias.scope !18, !noalias !20
  %118 = load float, ptr %114, align 4, !alias.scope !18, !noalias !20
  %119 = load float, ptr %115, align 4, !alias.scope !18, !noalias !20
  %120 = load float, ptr %116, align 4, !alias.scope !18, !noalias !20
  %121 = insertelement <4 x float> poison, float %117, i64 0
  %122 = insertelement <4 x float> %121, float %118, i64 1
  %123 = insertelement <4 x float> %122, float %119, i64 2
  %124 = insertelement <4 x float> %123, float %120, i64 3
  %125 = getelementptr [8192 x i8], ptr %91, i64 %index
  %126 = getelementptr [8192 x i8], ptr %91, i64 %110
  %127 = getelementptr [8192 x i8], ptr %91, i64 %111
  %128 = getelementptr [8192 x i8], ptr %91, i64 %112
  %129 = load float, ptr %125, align 4, !alias.scope !22
  %130 = load float, ptr %126, align 4, !alias.scope !22
  %131 = load float, ptr %127, align 4, !alias.scope !22
  %132 = load float, ptr %128, align 4, !alias.scope !22
  %133 = insertelement <4 x float> poison, float %129, i64 0
  %134 = insertelement <4 x float> %133, float %130, i64 1
  %135 = insertelement <4 x float> %134, float %131, i64 2
  %136 = insertelement <4 x float> %135, float %132, i64 3
  %137 = fmul <4 x float> %136, %broadcast.splat
  %138 = fsub <4 x float> %124, %137
  %139 = extractelement <4 x float> %138, i64 0
  store float %139, ptr %113, align 4, !alias.scope !18, !noalias !20
  %140 = extractelement <4 x float> %138, i64 1
  store float %140, ptr %114, align 4, !alias.scope !18, !noalias !20
  %141 = extractelement <4 x float> %138, i64 2
  store float %141, ptr %115, align 4, !alias.scope !18, !noalias !20
  %142 = extractelement <4 x float> %138, i64 3
  store float %142, ptr %116, align 4, !alias.scope !18, !noalias !20
  %index.next = add nuw i64 %index, 4
  %143 = icmp eq i64 %index.next, %n.vec
  br i1 %143, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge91, label %.lr.ph90.preheader164

.lr.ph90.preheader164:                            ; preds = %.lr.ph90.preheader, %middle.block
  %indvars.iv108.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %.lr.ph90.preheader ]
  br i1 %lcmp.mod177.not, label %.lr.ph90.prol.loopexit, label %.lr.ph90.prol

.lr.ph90.prol:                                    ; preds = %.lr.ph90.preheader164
  %gep86.prol = getelementptr [8192 x i8], ptr %invariant.gep80, i64 %indvars.iv108.ph
  %144 = load float, ptr %gep86.prol, align 4
  %gep88.prol = getelementptr [8192 x i8], ptr %92, i64 %indvars.iv108.ph
  %145 = load float, ptr %gep88.prol, align 4
  %146 = load float, ptr %95, align 4
  %147 = fmul float %145, %146
  %148 = fsub float %144, %147
  store float %148, ptr %gep86.prol, align 4
  %indvars.iv.next109.prol = or disjoint i64 %indvars.iv108.ph, 1
  br label %.lr.ph90.prol.loopexit

.lr.ph90.prol.loopexit:                           ; preds = %.lr.ph90.prol, %.lr.ph90.preheader164
  %indvars.iv108.unr = phi i64 [ %indvars.iv108.ph, %.lr.ph90.preheader164 ], [ %indvars.iv.next109.prol, %.lr.ph90.prol ]
  %149 = icmp eq i64 %indvars.iv108.ph, %21
  br i1 %149, label %._crit_edge91, label %.lr.ph90

.lr.ph90:                                         ; preds = %.lr.ph90.prol.loopexit, %.lr.ph90
  %indvars.iv108 = phi i64 [ %indvars.iv.next109.1, %.lr.ph90 ], [ %indvars.iv108.unr, %.lr.ph90.prol.loopexit ]
  %gep86 = getelementptr [8192 x i8], ptr %invariant.gep80, i64 %indvars.iv108
  %150 = load float, ptr %gep86, align 4
  %gep88 = getelementptr [8192 x i8], ptr %93, i64 %indvars.iv108
  %151 = load float, ptr %gep88, align 4
  %152 = load float, ptr %95, align 4
  %153 = fmul float %151, %152
  %154 = fsub float %150, %153
  store float %154, ptr %gep86, align 4
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %gep86.1 = getelementptr [8192 x i8], ptr %invariant.gep80, i64 %indvars.iv.next109
  %155 = load float, ptr %gep86.1, align 4
  %gep88.1 = getelementptr [8192 x i8], ptr %94, i64 %indvars.iv.next109
  %156 = load float, ptr %gep88.1, align 4
  %157 = load float, ptr %95, align 4
  %158 = fmul float %156, %157
  %159 = fsub float %155, %158
  store float %159, ptr %gep86.1, align 4
  %indvars.iv.next109.1 = add nuw nsw i64 %indvars.iv108, 2
  %exitcond112.not.1 = icmp eq i64 %indvars.iv.next109.1, %wide.trip.count111
  br i1 %exitcond112.not.1, label %._crit_edge91, label %.lr.ph90, !llvm.loop !24

._crit_edge91:                                    ; preds = %.lr.ph90.prol.loopexit, %.lr.ph90, %middle.block, %.lr.ph94
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond119.not = icmp eq i64 %indvars.iv.next116, %wide.trip.count123
  br i1 %exitcond119.not, label %.loopexit, label %.lr.ph94

._crit_edge96:                                    ; preds = %.loopexit, %5
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: write)
define dso_local void @_Z10init_arrayiiPA2048_fS0_S0_(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) %2, ptr nofree noundef writeonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4) local_unnamed_addr #2 {
  %6 = ptrtoaddr ptr %2 to i64
  %7 = ptrtoaddr ptr %4 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader35.lr.ph, label %.preheader34

.preheader35.lr.ph:                               ; preds = %5
  %9 = icmp sgt i32 %1, 0
  %10 = uitofp nneg i32 %0 to float
  %11 = sitofp i32 %1 to float
  br i1 %9, label %.preheader35.preheader, label %._crit_edge41.split

.preheader35.preheader:                           ; preds = %.preheader35.lr.ph
  %wide.trip.count46 = zext nneg i32 %0 to i64
  %wide.trip.count = zext nneg i32 %1 to i64
  %min.iters.check = icmp ult i32 %1, 4
  %12 = sub i64 %6, %7
  %diff.check = icmp ugt i64 %12, -16
  %or.cond = or i1 %min.iters.check, %diff.check
  %n.vec = and i64 %wide.trip.count, 2147483644
  %broadcast.splatinsert59 = insertelement <4 x float> poison, float %10, i64 0
  %broadcast.splat60 = shufflevector <4 x float> %broadcast.splatinsert59, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert61 = insertelement <4 x float> poison, float %11, i64 0
  %broadcast.splat62 = shufflevector <4 x float> %broadcast.splatinsert61, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  %13 = insertelement <2 x float> poison, float %10, i64 0
  %14 = insertelement <2 x float> %13, float %11, i64 1
  br label %.preheader35

.preheader35:                                     ; preds = %.preheader35.preheader, %._crit_edge
  %indvars.iv43 = phi i64 [ 0, %.preheader35.preheader ], [ %indvars.iv.next44, %._crit_edge ]
  %15 = trunc nuw nsw i64 %indvars.iv43 to i32
  %16 = uitofp nneg i32 %15 to float
  %17 = getelementptr [8192 x i8], ptr %2, i64 %indvars.iv43
  %18 = getelementptr [8192 x i8], ptr %4, i64 %indvars.iv43
  br i1 %or.cond, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader35
  %broadcast.splatinsert = insertelement <4 x float> poison, float %16, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.ind63 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next64, %vector.body ]
  %19 = uitofp nneg <4 x i32> %vec.ind63 to <4 x float>
  %20 = fmul nnan <4 x float> %broadcast.splat, %19
  %21 = fdiv <4 x float> %20, %broadcast.splat60
  %22 = getelementptr [4 x i8], ptr %17, i64 %index
  store <4 x float> %21, ptr %22, align 4
  %23 = trunc <4 x i64> %vec.ind to <4 x i32>
  %24 = add <4 x i32> %23, splat (i32 1)
  %25 = uitofp nneg <4 x i32> %24 to <4 x float>
  %26 = fmul nnan <4 x float> %broadcast.splat, %25
  %27 = fdiv <4 x float> %26, %broadcast.splat62
  %28 = getelementptr [4 x i8], ptr %18, i64 %index
  store <4 x float> %27, ptr %28, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add nuw nsw <4 x i64> %vec.ind, splat (i64 4)
  %vec.ind.next64 = add <4 x i32> %vec.ind63, splat (i32 4)
  %29 = icmp eq i64 %index.next, %n.vec
  br i1 %29, label %middle.block, label %vector.body, !llvm.loop !25

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader35, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader35 ], [ %n.vec, %middle.block ]
  %30 = insertelement <2 x float> poison, float %16, i64 0
  %31 = shufflevector <2 x float> %30, <2 x float> poison, <2 x i32> zeroinitializer
  br label %scalar.ph

.preheader34:                                     ; preds = %._crit_edge, %5
  %32 = icmp sgt i32 %1, 0
  br i1 %32, label %.preheader.lr.ph, label %._crit_edge41.split

.preheader.lr.ph:                                 ; preds = %.preheader34
  %33 = uitofp nneg i32 %1 to float
  %wide.trip.count56 = zext nneg i32 %1 to i64
  %min.iters.check66 = icmp ult i32 %1, 4
  %n.vec69 = and i64 %wide.trip.count56, 2147483644
  %broadcast.splatinsert72 = insertelement <4 x float> poison, float %33, i64 0
  %broadcast.splat73 = shufflevector <4 x float> %broadcast.splatinsert72, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n80 = icmp eq i64 %n.vec69, %wide.trip.count56
  br label %.preheader

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %34 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %35 = trunc nuw nsw i64 %indvars.iv.next to i32
  %36 = trunc nuw nsw i64 %indvars.iv to i32
  %37 = uitofp nneg i32 %35 to float
  %38 = uitofp nneg i32 %36 to float
  %39 = insertelement <2 x float> poison, float %38, i64 0
  %40 = insertelement <2 x float> %39, float %37, i64 1
  %41 = fmul nnan <2 x float> %31, %40
  %42 = fdiv <2 x float> %41, %14
  %43 = extractelement <2 x float> %42, i64 0
  store float %43, ptr %34, align 4
  %44 = getelementptr [4 x i8], ptr %18, i64 %indvars.iv
  %45 = extractelement <2 x float> %42, i64 1
  store float %45, ptr %44, align 4
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !26

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond47.not = icmp eq i64 %indvars.iv.next44, %wide.trip.count46
  br i1 %exitcond47.not, label %.preheader34, label %.preheader35

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge39
  %indvars.iv53 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next54, %._crit_edge39 ]
  %46 = trunc nuw nsw i64 %indvars.iv53 to i32
  %47 = uitofp nneg i32 %46 to float
  %48 = getelementptr [8192 x i8], ptr %3, i64 %indvars.iv53
  br i1 %min.iters.check66, label %scalar.ph65.preheader, label %vector.ph67

vector.ph67:                                      ; preds = %.preheader
  %broadcast.splatinsert70 = insertelement <4 x float> poison, float %47, i64 0
  %broadcast.splat71 = shufflevector <4 x float> %broadcast.splatinsert70, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body74

vector.body74:                                    ; preds = %vector.body74, %vector.ph67
  %index75 = phi i64 [ 0, %vector.ph67 ], [ %index.next77, %vector.body74 ]
  %vec.ind76 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph67 ], [ %vec.ind.next78, %vector.body74 ]
  %49 = add <4 x i32> %vec.ind76, splat (i32 2)
  %50 = uitofp nneg <4 x i32> %49 to <4 x float>
  %51 = fmul nnan <4 x float> %broadcast.splat71, %50
  %52 = fdiv <4 x float> %51, %broadcast.splat73
  %53 = getelementptr [4 x i8], ptr %48, i64 %index75
  store <4 x float> %52, ptr %53, align 4
  %index.next77 = add nuw i64 %index75, 4
  %vec.ind.next78 = add <4 x i32> %vec.ind76, splat (i32 4)
  %54 = icmp eq i64 %index.next77, %n.vec69
  br i1 %54, label %middle.block79, label %vector.body74, !llvm.loop !27

middle.block79:                                   ; preds = %vector.body74
  br i1 %cmp.n80, label %._crit_edge39, label %scalar.ph65.preheader

scalar.ph65.preheader:                            ; preds = %.preheader, %middle.block79
  %indvars.iv48.ph = phi i64 [ 0, %.preheader ], [ %n.vec69, %middle.block79 ]
  br label %scalar.ph65

scalar.ph65:                                      ; preds = %scalar.ph65.preheader, %scalar.ph65
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %scalar.ph65 ], [ %indvars.iv48.ph, %scalar.ph65.preheader ]
  %55 = trunc i64 %indvars.iv48 to i32
  %56 = add i32 %55, 2
  %57 = uitofp nneg i32 %56 to float
  %58 = fmul nnan float %47, %57
  %59 = fdiv float %58, %33
  %60 = getelementptr [4 x i8], ptr %48, i64 %indvars.iv48
  store float %59, ptr %60, align 4
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond52.not = icmp eq i64 %indvars.iv.next49, %wide.trip.count56
  br i1 %exitcond52.not, label %._crit_edge39, label %scalar.ph65, !llvm.loop !28

._crit_edge39:                                    ; preds = %scalar.ph65, %middle.block79
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond57.not = icmp eq i64 %indvars.iv.next54, %wide.trip.count56
  br i1 %exitcond57.not, label %._crit_edge41.split, label %.preheader

._crit_edge41.split:                              ; preds = %._crit_edge39, %.preheader35.lr.ph, %.preheader34
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
  %40 = fcmp ogt <4 x double> %39, splat (double 5.000000e-02)
  %.not31 = select <4 x i1> %18, <4 x i1> splat (i1 true), <4 x i1> %23
  %narrow = select <4 x i1> %.not31, <4 x i1> %40, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %41 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !29

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
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !30

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

define dso_local void @_Z34__device_stub__gramschmidt_kernel1iiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #6 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store i32 %5, ptr %12, align 4
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
  %26 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z34__device_stub__gramschmidt_kernel1iiPfS_S_i, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %13, i64 noundef %24, ptr noundef %25)
  ret void
}

define dso_local void @_Z34__device_stub__gramschmidt_kernel2iiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #6 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store i32 %5, ptr %12, align 4
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
  %26 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z34__device_stub__gramschmidt_kernel2iiPfS_S_i, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %13, i64 noundef %24, ptr noundef %25)
  ret void
}

define dso_local void @_Z34__device_stub__gramschmidt_kernel3iiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #6 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store i32 %5, ptr %12, align 4
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
  %26 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z34__device_stub__gramschmidt_kernel3iiPfS_S_i, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %13, i64 noundef %24, ptr noundef %25)
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

define dso_local void @_Z15gramschmidtCudaiiPA2048_fS0_S0_S0_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr nofree readnone captures(none) %3, ptr nofree readnone captures(none) %4, ptr noundef %5) local_unnamed_addr #6 {
  %7 = alloca %struct.timeval, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca [6 x ptr], align 16
  %15 = alloca %struct.dim3, align 8
  %16 = alloca %struct.dim3, align 8
  %17 = alloca i64, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  %25 = alloca [6 x ptr], align 16
  %26 = alloca %struct.dim3, align 8
  %27 = alloca %struct.dim3, align 8
  %28 = alloca i64, align 8
  %29 = alloca ptr, align 8
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca ptr, align 8
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  %35 = alloca i32, align 4
  %36 = alloca [6 x ptr], align 16
  %37 = alloca %struct.dim3, align 8
  %38 = alloca %struct.dim3, align 8
  %39 = alloca i64, align 8
  %40 = alloca ptr, align 8
  %41 = alloca %struct.timeval, align 8
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = call i32 @cudaMalloc(ptr noundef nonnull %42, i64 noundef 16777216) #5
  %46 = call i32 @cudaMalloc(ptr noundef nonnull %43, i64 noundef 16777216) #5
  %47 = call i32 @cudaMalloc(ptr noundef nonnull %44, i64 noundef 16777216) #5
  %48 = load ptr, ptr %42, align 8
  %49 = call i32 @cudaMemcpy(ptr noundef %48, ptr noundef %2, i64 noundef 16777216, i32 noundef 1) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %41)
  %50 = call i32 @gettimeofday(ptr noundef nonnull %41, ptr noundef null) #14
  %.not.i.i = icmp eq i32 %50, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %51

51:                                               ; preds = %6
  %52 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %50) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %6, %51
  %53 = load i64, ptr %41, align 8
  %54 = sitofp i64 %53 to double
  %55 = getelementptr inbounds nuw i8, ptr %41, i64 8
  %56 = load i64, ptr %55, align 8
  %57 = sitofp i64 %56 to double
  %58 = fmul nnan double %57, f0x3EB0C6F7A0B5ED8D
  %59 = fadd double %58, %54
  call void @llvm.lifetime.end.p0(ptr nonnull %41)
  store double %59, ptr @polybench_t_start, align 8
  %60 = icmp sgt i32 %1, 0
  br i1 %60, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %_Z21polybench_timer_startv.exit
  %61 = getelementptr inbounds nuw i8, ptr %36, i64 8
  %62 = getelementptr inbounds nuw i8, ptr %36, i64 16
  %63 = getelementptr inbounds nuw i8, ptr %36, i64 24
  %64 = getelementptr inbounds nuw i8, ptr %36, i64 32
  %65 = getelementptr inbounds nuw i8, ptr %36, i64 40
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %37, i64 4
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %37, i64 8
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %38, i64 4
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %38, i64 8
  %66 = getelementptr inbounds nuw i8, ptr %25, i64 8
  %67 = getelementptr inbounds nuw i8, ptr %25, i64 16
  %68 = getelementptr inbounds nuw i8, ptr %25, i64 24
  %69 = getelementptr inbounds nuw i8, ptr %25, i64 32
  %70 = getelementptr inbounds nuw i8, ptr %25, i64 40
  %.fca.1.gep4.i48 = getelementptr inbounds nuw i8, ptr %26, i64 4
  %.fca.2.gep7.i51 = getelementptr inbounds nuw i8, ptr %26, i64 8
  %.fca.1.gep.i56 = getelementptr inbounds nuw i8, ptr %27, i64 4
  %.fca.2.gep.i59 = getelementptr inbounds nuw i8, ptr %27, i64 8
  %71 = getelementptr inbounds nuw i8, ptr %14, i64 8
  %72 = getelementptr inbounds nuw i8, ptr %14, i64 16
  %73 = getelementptr inbounds nuw i8, ptr %14, i64 24
  %74 = getelementptr inbounds nuw i8, ptr %14, i64 32
  %75 = getelementptr inbounds nuw i8, ptr %14, i64 40
  %.fca.1.gep4.i64 = getelementptr inbounds nuw i8, ptr %15, i64 4
  %.fca.2.gep7.i67 = getelementptr inbounds nuw i8, ptr %15, i64 8
  %.fca.1.gep.i72 = getelementptr inbounds nuw i8, ptr %16, i64 4
  %.fca.2.gep.i75 = getelementptr inbounds nuw i8, ptr %16, i64 8
  br label %76

76:                                               ; preds = %.lr.ph, %108
  %.093 = phi i32 [ 0, %.lr.ph ], [ %110, %108 ]
  %77 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 1, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %77, 0
  br i1 %.not, label %78, label %86

78:                                               ; preds = %76
  %79 = load ptr, ptr %42, align 8
  %80 = load ptr, ptr %43, align 8
  %81 = load ptr, ptr %44, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %30)
  call void @llvm.lifetime.start.p0(ptr nonnull %31)
  call void @llvm.lifetime.start.p0(ptr nonnull %32)
  call void @llvm.lifetime.start.p0(ptr nonnull %33)
  call void @llvm.lifetime.start.p0(ptr nonnull %34)
  call void @llvm.lifetime.start.p0(ptr nonnull %35)
  call void @llvm.lifetime.start.p0(ptr nonnull %36)
  call void @llvm.lifetime.start.p0(ptr nonnull %37)
  call void @llvm.lifetime.start.p0(ptr nonnull %38)
  call void @llvm.lifetime.start.p0(ptr nonnull %39)
  call void @llvm.lifetime.start.p0(ptr nonnull %40)
  store i32 %0, ptr %30, align 4
  store i32 %1, ptr %31, align 4
  store ptr %79, ptr %32, align 8
  store ptr %80, ptr %33, align 8
  store ptr %81, ptr %34, align 8
  store i32 %.093, ptr %35, align 4
  store ptr %30, ptr %36, align 16
  store ptr %31, ptr %61, align 8
  store ptr %32, ptr %62, align 16
  store ptr %33, ptr %63, align 8
  store ptr %34, ptr %64, align 16
  store ptr %35, ptr %65, align 8
  %82 = call i32 @__cudaPopCallConfiguration(ptr nonnull %37, ptr nonnull %38, ptr nonnull %39, ptr nonnull %40), !inline_history !31
  %83 = load i64, ptr %39, align 8
  %84 = load ptr, ptr %40, align 8
  %.fca.0.load2.i = load i32, ptr %37, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %38, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %85 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z34__device_stub__gramschmidt_kernel1iiPfS_S_i, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %36, i64 noundef %83, ptr noundef %84), !inline_history !31
  call void @llvm.lifetime.end.p0(ptr nonnull %30)
  call void @llvm.lifetime.end.p0(ptr nonnull %31)
  call void @llvm.lifetime.end.p0(ptr nonnull %32)
  call void @llvm.lifetime.end.p0(ptr nonnull %33)
  call void @llvm.lifetime.end.p0(ptr nonnull %34)
  call void @llvm.lifetime.end.p0(ptr nonnull %35)
  call void @llvm.lifetime.end.p0(ptr nonnull %36)
  call void @llvm.lifetime.end.p0(ptr nonnull %37)
  call void @llvm.lifetime.end.p0(ptr nonnull %38)
  call void @llvm.lifetime.end.p0(ptr nonnull %39)
  call void @llvm.lifetime.end.p0(ptr nonnull %40)
  br label %86

86:                                               ; preds = %76, %78
  %87 = call i32 @cudaThreadSynchronize() #5
  %88 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 8, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not44 = icmp eq i32 %88, 0
  br i1 %.not44, label %89, label %97

89:                                               ; preds = %86
  %90 = load ptr, ptr %42, align 8
  %91 = load ptr, ptr %43, align 8
  %92 = load ptr, ptr %44, align 8
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
  call void @llvm.lifetime.start.p0(ptr nonnull %29)
  store i32 %0, ptr %19, align 4
  store i32 %1, ptr %20, align 4
  store ptr %90, ptr %21, align 8
  store ptr %91, ptr %22, align 8
  store ptr %92, ptr %23, align 8
  store i32 %.093, ptr %24, align 4
  store ptr %19, ptr %25, align 16
  store ptr %20, ptr %66, align 8
  store ptr %21, ptr %67, align 16
  store ptr %22, ptr %68, align 8
  store ptr %23, ptr %69, align 16
  store ptr %24, ptr %70, align 8
  %93 = call i32 @__cudaPopCallConfiguration(ptr nonnull %26, ptr nonnull %27, ptr nonnull %28, ptr nonnull %29), !inline_history !32
  %94 = load i64, ptr %28, align 8
  %95 = load ptr, ptr %29, align 8
  %.fca.0.load2.i46 = load i32, ptr %26, align 8
  %.fca.0.insert3.i47 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i46, 0
  %.fca.1.load5.i49 = load i32, ptr %.fca.1.gep4.i48, align 4
  %.fca.1.insert6.i50 = insertvalue %struct.dim3 %.fca.0.insert3.i47, i32 %.fca.1.load5.i49, 1
  %.fca.2.load8.i52 = load i32, ptr %.fca.2.gep7.i51, align 8
  %.fca.2.insert9.i53 = insertvalue %struct.dim3 %.fca.1.insert6.i50, i32 %.fca.2.load8.i52, 2
  %.fca.0.load.i54 = load i32, ptr %27, align 8
  %.fca.0.insert.i55 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i54, 0
  %.fca.1.load.i57 = load i32, ptr %.fca.1.gep.i56, align 4
  %.fca.1.insert.i58 = insertvalue %struct.dim3 %.fca.0.insert.i55, i32 %.fca.1.load.i57, 1
  %.fca.2.load.i60 = load i32, ptr %.fca.2.gep.i59, align 8
  %.fca.2.insert.i61 = insertvalue %struct.dim3 %.fca.1.insert.i58, i32 %.fca.2.load.i60, 2
  %96 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z34__device_stub__gramschmidt_kernel2iiPfS_S_i, %struct.dim3 %.fca.2.insert9.i53, %struct.dim3 %.fca.2.insert.i61, ptr noundef nonnull %25, i64 noundef %94, ptr noundef %95), !inline_history !32
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
  call void @llvm.lifetime.end.p0(ptr nonnull %29)
  br label %97

97:                                               ; preds = %86, %89
  %98 = call i32 @cudaThreadSynchronize() #5
  %99 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 8, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not45 = icmp eq i32 %99, 0
  br i1 %.not45, label %100, label %108

100:                                              ; preds = %97
  %101 = load ptr, ptr %42, align 8
  %102 = load ptr, ptr %43, align 8
  %103 = load ptr, ptr %44, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
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
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store ptr %101, ptr %10, align 8
  store ptr %102, ptr %11, align 8
  store ptr %103, ptr %12, align 8
  store i32 %.093, ptr %13, align 4
  store ptr %8, ptr %14, align 16
  store ptr %9, ptr %71, align 8
  store ptr %10, ptr %72, align 16
  store ptr %11, ptr %73, align 8
  store ptr %12, ptr %74, align 16
  store ptr %13, ptr %75, align 8
  %104 = call i32 @__cudaPopCallConfiguration(ptr nonnull %15, ptr nonnull %16, ptr nonnull %17, ptr nonnull %18), !inline_history !33
  %105 = load i64, ptr %17, align 8
  %106 = load ptr, ptr %18, align 8
  %.fca.0.load2.i62 = load i32, ptr %15, align 8
  %.fca.0.insert3.i63 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i62, 0
  %.fca.1.load5.i65 = load i32, ptr %.fca.1.gep4.i64, align 4
  %.fca.1.insert6.i66 = insertvalue %struct.dim3 %.fca.0.insert3.i63, i32 %.fca.1.load5.i65, 1
  %.fca.2.load8.i68 = load i32, ptr %.fca.2.gep7.i67, align 8
  %.fca.2.insert9.i69 = insertvalue %struct.dim3 %.fca.1.insert6.i66, i32 %.fca.2.load8.i68, 2
  %.fca.0.load.i70 = load i32, ptr %16, align 8
  %.fca.0.insert.i71 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i70, 0
  %.fca.1.load.i73 = load i32, ptr %.fca.1.gep.i72, align 4
  %.fca.1.insert.i74 = insertvalue %struct.dim3 %.fca.0.insert.i71, i32 %.fca.1.load.i73, 1
  %.fca.2.load.i76 = load i32, ptr %.fca.2.gep.i75, align 8
  %.fca.2.insert.i77 = insertvalue %struct.dim3 %.fca.1.insert.i74, i32 %.fca.2.load.i76, 2
  %107 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z34__device_stub__gramschmidt_kernel3iiPfS_S_i, %struct.dim3 %.fca.2.insert9.i69, %struct.dim3 %.fca.2.insert.i77, ptr noundef nonnull %14, i64 noundef %105, ptr noundef %106), !inline_history !33
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
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
  br label %108

108:                                              ; preds = %97, %100
  %109 = call i32 @cudaThreadSynchronize() #5
  %110 = add nuw nsw i32 %.093, 1
  %exitcond.not = icmp eq i32 %110, %1
  br i1 %exitcond.not, label %._crit_edge, label %76

._crit_edge:                                      ; preds = %108, %_Z21polybench_timer_startv.exit
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  %111 = call i32 @gettimeofday(ptr noundef nonnull %7, ptr noundef null) #14
  %.not.i.i78 = icmp eq i32 %111, 0
  br i1 %.not.i.i78, label %_Z20polybench_timer_stopv.exit, label %112

112:                                              ; preds = %._crit_edge
  %113 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %111) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %._crit_edge, %112
  %114 = load i64, ptr %7, align 8
  %115 = sitofp i64 %114 to double
  %116 = getelementptr inbounds nuw i8, ptr %7, i64 8
  %117 = load i64, ptr %116, align 8
  %118 = sitofp i64 %117 to double
  %119 = fmul nnan double %118, f0x3EB0C6F7A0B5ED8D
  %120 = fadd double %119, %115
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  store double %120, ptr @polybench_t_end, align 8
  %121 = load double, ptr @polybench_t_start, align 8
  %122 = fsub double %120, %121
  %123 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %122) #5
  %124 = load ptr, ptr %42, align 8
  %125 = call i32 @cudaMemcpy(ptr noundef %5, ptr noundef %124, i64 noundef 16777216, i32 noundef 2) #5
  %126 = load ptr, ptr %42, align 8
  %127 = call i32 @cudaFree(ptr noundef %126) #5
  %128 = load ptr, ptr %43, align 8
  %129 = call i32 @cudaFree(ptr noundef %128) #5
  %130 = load ptr, ptr %44, align 8
  %131 = call i32 @cudaFree(ptr noundef %130) #5
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
  %10 = call i32 @posix_memalign(ptr noundef nonnull %9, i64 noundef 32, i64 noundef 16777216) #14
  %11 = load ptr, ptr %9, align 8
  %12 = ptrtoaddr ptr %11 to i64
  %.not.i.i = icmp eq ptr %11, null
  %13 = icmp ne i32 %10, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %13
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %14 = load ptr, ptr @stderr, align 8
  %15 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %14) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %16 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 16777216) #14
  %17 = load ptr, ptr %8, align 8
  %.not.i.i24 = icmp eq ptr %17, null
  %18 = icmp ne i32 %16, 0
  %or.cond.i.i25 = select i1 %.not.i.i24, i1 true, i1 %18
  br i1 %or.cond.i.i25, label %.critedge.i.i26, label %_Z20polybench_alloc_datayi.exit27

.critedge.i.i26:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %19 = load ptr, ptr @stderr, align 8
  %20 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %19) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit27:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %21 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 16777216) #14
  %22 = load ptr, ptr %7, align 8
  %.not.i.i28 = icmp eq ptr %22, null
  %23 = icmp ne i32 %21, 0
  %or.cond.i.i29 = select i1 %.not.i.i28, i1 true, i1 %23
  br i1 %or.cond.i.i29, label %.critedge.i.i30, label %_Z20polybench_alloc_datayi.exit31

.critedge.i.i30:                                  ; preds = %_Z20polybench_alloc_datayi.exit27
  %24 = load ptr, ptr @stderr, align 8
  %25 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %24) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit31:                ; preds = %_Z20polybench_alloc_datayi.exit27
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %26 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 16777216) #14
  %27 = load ptr, ptr %6, align 8
  %.not.i.i32 = icmp eq ptr %27, null
  %28 = icmp ne i32 %26, 0
  %or.cond.i.i33 = select i1 %.not.i.i32, i1 true, i1 %28
  br i1 %or.cond.i.i33, label %.critedge.i.i34, label %_Z20polybench_alloc_datayi.exit35

.critedge.i.i34:                                  ; preds = %_Z20polybench_alloc_datayi.exit31
  %29 = load ptr, ptr @stderr, align 8
  %30 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %29) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit35:                ; preds = %_Z20polybench_alloc_datayi.exit31
  %31 = ptrtoaddr ptr %27 to i64
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  %32 = sub i64 %12, %31
  %diff.check = icmp ugt i64 %32, -16
  br label %.preheader35.i

.preheader35.i:                                   ; preds = %._crit_edge.i, %_Z20polybench_alloc_datayi.exit35
  %indvars.iv43.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit35 ], [ %indvars.iv.next44.i, %._crit_edge.i ]
  %33 = trunc nuw nsw i64 %indvars.iv43.i to i32
  %34 = uitofp nneg i32 %33 to float
  %35 = getelementptr [8192 x i8], ptr %11, i64 %indvars.iv43.i
  %36 = getelementptr [8192 x i8], ptr %27, i64 %indvars.iv43.i
  br i1 %diff.check, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %.preheader35.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %34, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.ind49 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next50, %vector.body ]
  %37 = uitofp nneg <4 x i32> %vec.ind49 to <4 x float>
  %38 = fmul nnan <4 x float> %broadcast.splat, %37
  %39 = fmul nnan <4 x float> %38, splat (float f0x3A000000)
  %40 = getelementptr [4 x i8], ptr %35, i64 %index
  store <4 x float> %39, ptr %40, align 4
  %41 = trunc <4 x i64> %vec.ind to <4 x i32>
  %42 = add <4 x i32> %41, splat (i32 1)
  %43 = uitofp nneg <4 x i32> %42 to <4 x float>
  %44 = fmul nnan <4 x float> %broadcast.splat, %43
  %45 = fmul nnan <4 x float> %44, splat (float f0x3A000000)
  %46 = getelementptr [4 x i8], ptr %36, i64 %index
  store <4 x float> %45, ptr %46, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add nuw nsw <4 x i64> %vec.ind, splat (i64 4)
  %vec.ind.next50 = add <4 x i32> %vec.ind49, splat (i32 4)
  %47 = icmp eq i64 %index.next, 2048
  br i1 %47, label %._crit_edge.i, label %vector.body, !llvm.loop !34

scalar.ph:                                        ; preds = %.preheader35.i, %scalar.ph
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i.1, %scalar.ph ], [ 0, %.preheader35.i ]
  %48 = trunc nuw nsw i64 %indvars.iv.i to i32
  %49 = uitofp nneg i32 %48 to float
  %50 = fmul nnan float %34, %49
  %51 = fmul nnan float %50, f0x3A000000
  %52 = getelementptr [4 x i8], ptr %35, i64 %indvars.iv.i
  store float %51, ptr %52, align 4
  %indvars.iv.next.i = or disjoint i64 %indvars.iv.i, 1
  %53 = trunc nuw nsw i64 %indvars.iv.next.i to i32
  %54 = uitofp nneg i32 %53 to float
  %55 = fmul nnan float %34, %54
  %56 = fmul nnan float %55, f0x3A000000
  %57 = getelementptr [4 x i8], ptr %36, i64 %indvars.iv.i
  store float %56, ptr %57, align 4
  %58 = trunc nuw nsw i64 %indvars.iv.next.i to i32
  %59 = uitofp nneg i32 %58 to float
  %60 = fmul nnan float %34, %59
  %61 = fmul nnan float %60, f0x3A000000
  %62 = getelementptr [4 x i8], ptr %35, i64 %indvars.iv.next.i
  store float %61, ptr %62, align 4
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %63 = trunc nuw nsw i64 %indvars.iv.next.i.1 to i32
  %64 = uitofp nneg i32 %63 to float
  %65 = fmul nnan float %34, %64
  %66 = fmul nnan float %65, f0x3A000000
  %67 = getelementptr [4 x i8], ptr %36, i64 %indvars.iv.next.i
  store float %66, ptr %67, align 4
  %exitcond.not.i.1 = icmp eq i64 %indvars.iv.next.i.1, 2048
  br i1 %exitcond.not.i.1, label %._crit_edge.i, label %scalar.ph, !llvm.loop !35

._crit_edge.i:                                    ; preds = %vector.body, %scalar.ph
  %indvars.iv.next44.i = add nuw nsw i64 %indvars.iv43.i, 1
  %exitcond47.not.i = icmp eq i64 %indvars.iv.next44.i, 2048
  br i1 %exitcond47.not.i, label %.preheader.i, label %.preheader35.i

.preheader.i:                                     ; preds = %._crit_edge.i, %._crit_edge39.i
  %indvars.iv53.i = phi i64 [ %indvars.iv.next54.i, %._crit_edge39.i ], [ 0, %._crit_edge.i ]
  %68 = getelementptr [8192 x i8], ptr %22, i64 %indvars.iv53.i
  %69 = trunc nuw nsw i64 %indvars.iv53.i to i32
  %70 = uitofp nneg i32 %69 to float
  %broadcast.splatinsert53 = insertelement <4 x float> poison, float %70, i64 0
  %broadcast.splat54 = shufflevector <4 x float> %broadcast.splatinsert53, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body55

vector.body55:                                    ; preds = %vector.body55, %.preheader.i
  %index56 = phi i64 [ 0, %.preheader.i ], [ %index.next58.1, %vector.body55 ]
  %vec.ind57 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader.i ], [ %vec.ind.next59.1, %vector.body55 ]
  %71 = add <4 x i32> %vec.ind57, splat (i32 2)
  %72 = add <4 x i32> %vec.ind57, splat (i32 6)
  %73 = uitofp nneg <4 x i32> %71 to <4 x float>
  %74 = uitofp nneg <4 x i32> %72 to <4 x float>
  %75 = fmul nnan <4 x float> %broadcast.splat54, %73
  %76 = fmul nnan <4 x float> %broadcast.splat54, %74
  %77 = fmul nnan <4 x float> %75, splat (float f0x3A000000)
  %78 = fmul nnan <4 x float> %76, splat (float f0x3A000000)
  %79 = getelementptr [4 x i8], ptr %68, i64 %index56
  %80 = getelementptr i8, ptr %79, i64 16
  store <4 x float> %77, ptr %79, align 4
  store <4 x float> %78, ptr %80, align 4
  %81 = add <4 x i32> %vec.ind57, splat (i32 10)
  %82 = add <4 x i32> %vec.ind57, splat (i32 14)
  %83 = uitofp nneg <4 x i32> %81 to <4 x float>
  %84 = uitofp nneg <4 x i32> %82 to <4 x float>
  %85 = fmul nnan <4 x float> %broadcast.splat54, %83
  %86 = fmul nnan <4 x float> %broadcast.splat54, %84
  %87 = fmul nnan <4 x float> %85, splat (float f0x3A000000)
  %88 = fmul nnan <4 x float> %86, splat (float f0x3A000000)
  %89 = getelementptr [4 x i8], ptr %68, i64 %index56
  %90 = getelementptr i8, ptr %89, i64 32
  %91 = getelementptr i8, ptr %89, i64 48
  store <4 x float> %87, ptr %90, align 4
  store <4 x float> %88, ptr %91, align 4
  %index.next58.1 = add nuw nsw i64 %index56, 16
  %vec.ind.next59.1 = add <4 x i32> %vec.ind57, splat (i32 16)
  %92 = icmp eq i64 %index.next58.1, 2048
  br i1 %92, label %._crit_edge39.i, label %vector.body55, !llvm.loop !36

._crit_edge39.i:                                  ; preds = %vector.body55
  %indvars.iv.next54.i = add nuw nsw i64 %indvars.iv53.i, 1
  %exitcond57.not.i = icmp eq i64 %indvars.iv.next54.i, 2048
  br i1 %exitcond57.not.i, label %_Z10init_arrayiiPA2048_fS0_S0_.exit, label %.preheader.i

_Z10init_arrayiiPA2048_fS0_S0_.exit:              ; preds = %._crit_edge39.i
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  %93 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %5, i32 noundef 0) #5
  %94 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %5) #5
  %95 = call i32 @cudaSetDevice(i32 noundef 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @_Z15gramschmidtCudaiiPA2048_fS0_S0_S0_(i32 noundef 2048, i32 noundef 2048, ptr noundef %11, ptr nonnull poison, ptr poison, ptr noundef %17) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %96 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #14
  %.not.i.i36 = icmp eq i32 %96, 0
  br i1 %.not.i.i36, label %_Z21polybench_timer_startv.exit, label %97

97:                                               ; preds = %_Z10init_arrayiiPA2048_fS0_S0_.exit
  %98 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %96) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiiPA2048_fS0_S0_.exit, %97
  %99 = load i64, ptr %4, align 8
  %100 = sitofp i64 %99 to double
  %101 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %102 = load i64, ptr %101, align 8
  %103 = sitofp i64 %102 to double
  %104 = fmul nnan double %103, f0x3EB0C6F7A0B5ED8D
  %105 = fadd double %104, %100
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %105, ptr @polybench_t_start, align 8
  %scevgep62 = getelementptr i8, ptr %11, i64 16777216
  %scevgep79 = getelementptr i8, ptr %27, i64 16777216
  %106 = insertelement <2 x ptr> poison, ptr %11, i64 0
  %107 = insertelement <2 x ptr> %106, ptr %22, i64 1
  %108 = getelementptr i8, <2 x ptr> %107, i64 16777216
  %109 = insertelement <2 x ptr> poison, ptr %27, i64 0
  %110 = shufflevector <2 x ptr> %109, <2 x ptr> poison, <2 x i32> zeroinitializer
  %111 = insertelement <2 x ptr> poison, ptr %scevgep79, i64 0
  %112 = shufflevector <2 x ptr> %111, <2 x ptr> poison, <2 x i32> zeroinitializer
  %113 = icmp ult <2 x ptr> %110, %108
  %114 = icmp ult <2 x ptr> %107, %112
  %115 = and <2 x i1> %113, %114
  %116 = bitcast <2 x i1> %115 to i2
  %conflict.rdx87.not = icmp eq i2 %116, 0
  br label %.preheader67.i

.loopexit.i:                                      ; preds = %._crit_edge91.i, %._crit_edge77.i
  %indvars.iv.next114.i = add nuw nsw i64 %indvars.iv113.i, 1
  %exitcond124.not.i = icmp eq i64 %indvars.iv.next121.i, 2048
  br i1 %exitcond124.not.i, label %_Z11gramschmidtiiPA2048_fS0_S0_.exit, label %.preheader67.i

.preheader67.i:                                   ; preds = %.loopexit.i, %_Z21polybench_timer_startv.exit
  %indvars.iv120.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next121.i, %.loopexit.i ]
  %indvars.iv113.i = phi i64 [ 1, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next114.i, %.loopexit.i ]
  %117 = shl nuw nsw i64 %indvars.iv120.i, 2
  %118 = getelementptr i8, ptr %11, i64 %117
  %scevgep = getelementptr i8, ptr %118, i64 4
  %scevgep63 = getelementptr i8, ptr %27, i64 %117
  %119 = getelementptr i8, ptr %27, i64 %117
  %scevgep64 = getelementptr i8, ptr %119, i64 16769028
  %120 = mul nuw nsw i64 %indvars.iv120.i, 8196
  %121 = getelementptr i8, ptr %22, i64 %120
  %scevgep65 = getelementptr i8, ptr %121, i64 4
  %122 = shl nuw nsw i64 %indvars.iv120.i, 13
  %123 = getelementptr i8, ptr %22, i64 %122
  %scevgep66 = getelementptr i8, ptr %123, i64 8192
  %invariant.gep.i = getelementptr [4 x i8], ptr %11, i64 %indvars.iv120.i
  br label %124

124:                                              ; preds = %124, %.preheader67.i
  %indvars.iv.i37 = phi i64 [ 0, %.preheader67.i ], [ %indvars.iv.next.i38.3, %124 ]
  %.069.i = phi float [ 0.000000e+00, %.preheader67.i ], [ %139, %124 ]
  %gep.i = getelementptr [8192 x i8], ptr %invariant.gep.i, i64 %indvars.iv.i37
  %125 = load float, ptr %gep.i, align 4
  %126 = fmul float %125, %125
  %127 = fadd float %.069.i, %126
  %128 = getelementptr [8192 x i8], ptr %invariant.gep.i, i64 %indvars.iv.i37
  %gep.i.1 = getelementptr i8, ptr %128, i64 8192
  %129 = load float, ptr %gep.i.1, align 4
  %130 = fmul float %129, %129
  %131 = fadd float %127, %130
  %132 = getelementptr [8192 x i8], ptr %invariant.gep.i, i64 %indvars.iv.i37
  %gep.i.2 = getelementptr i8, ptr %132, i64 16384
  %133 = load float, ptr %gep.i.2, align 4
  %134 = fmul float %133, %133
  %135 = fadd float %131, %134
  %136 = getelementptr [8192 x i8], ptr %invariant.gep.i, i64 %indvars.iv.i37
  %gep.i.3 = getelementptr i8, ptr %136, i64 24576
  %137 = load float, ptr %gep.i.3, align 4
  %138 = fmul float %137, %137
  %139 = fadd float %135, %138
  %indvars.iv.next.i38.3 = add nuw nsw i64 %indvars.iv.i37, 4
  %exitcond.not.i39.3 = icmp eq i64 %indvars.iv.next.i38.3, 2048
  br i1 %exitcond.not.i39.3, label %.lr.ph76.preheader.i, label %124

.lr.ph76.preheader.i:                             ; preds = %124
  %sqrtf127.i = call float @sqrtf(float noundef %139) #14
  %140 = getelementptr [8192 x i8], ptr %22, i64 %indvars.iv120.i
  %141 = getelementptr [4 x i8], ptr %140, i64 %indvars.iv120.i
  store float %sqrtf127.i, ptr %141, align 4
  %invariant.gep72129.i = getelementptr [4 x i8], ptr %27, i64 %indvars.iv120.i
  br i1 %conflict.rdx87.not, label %vector.ph89, label %.lr.ph76.i

vector.ph89:                                      ; preds = %.lr.ph76.preheader.i
  %142 = load float, ptr %141, align 4, !alias.scope !37
  %broadcast.splatinsert92 = insertelement <4 x float> poison, float %142, i64 0
  %broadcast.splat93 = shufflevector <4 x float> %broadcast.splatinsert92, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body90

vector.body90:                                    ; preds = %vector.body90, %vector.ph89
  %index91 = phi i64 [ 0, %vector.ph89 ], [ %index.next94, %vector.body90 ]
  %143 = or disjoint i64 %index91, 1
  %144 = or disjoint i64 %index91, 2
  %145 = or disjoint i64 %index91, 3
  %146 = getelementptr [8192 x i8], ptr %invariant.gep.i, i64 %index91
  %147 = getelementptr [8192 x i8], ptr %invariant.gep.i, i64 %143
  %148 = getelementptr [8192 x i8], ptr %invariant.gep.i, i64 %144
  %149 = getelementptr [8192 x i8], ptr %invariant.gep.i, i64 %145
  %150 = load float, ptr %146, align 4, !alias.scope !40
  %151 = load float, ptr %147, align 4, !alias.scope !40
  %152 = load float, ptr %148, align 4, !alias.scope !40
  %153 = load float, ptr %149, align 4, !alias.scope !40
  %154 = insertelement <4 x float> poison, float %150, i64 0
  %155 = insertelement <4 x float> %154, float %151, i64 1
  %156 = insertelement <4 x float> %155, float %152, i64 2
  %157 = insertelement <4 x float> %156, float %153, i64 3
  %158 = fdiv <4 x float> %157, %broadcast.splat93
  %159 = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %index91
  %160 = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %143
  %161 = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %144
  %162 = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %145
  %163 = extractelement <4 x float> %158, i64 0
  store float %163, ptr %159, align 4, !alias.scope !42, !noalias !44
  %164 = extractelement <4 x float> %158, i64 1
  store float %164, ptr %160, align 4, !alias.scope !42, !noalias !44
  %165 = extractelement <4 x float> %158, i64 2
  store float %165, ptr %161, align 4, !alias.scope !42, !noalias !44
  %166 = extractelement <4 x float> %158, i64 3
  store float %166, ptr %162, align 4, !alias.scope !42, !noalias !44
  %index.next94 = add nuw i64 %index91, 4
  %167 = icmp eq i64 %index.next94, 2048
  br i1 %167, label %._crit_edge77.i, label %vector.body90, !llvm.loop !45

.lr.ph76.i:                                       ; preds = %.lr.ph76.preheader.i, %.lr.ph76.i
  %indvars.iv98.i = phi i64 [ %indvars.iv.next99.i.1, %.lr.ph76.i ], [ 0, %.lr.ph76.preheader.i ]
  %gep71.i = getelementptr [8192 x i8], ptr %invariant.gep.i, i64 %indvars.iv98.i
  %168 = load float, ptr %gep71.i, align 4
  %169 = load float, ptr %141, align 4
  %170 = fdiv float %168, %169
  %gep73.i = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %indvars.iv98.i
  store float %170, ptr %gep73.i, align 4
  %indvars.iv.next99.i = or disjoint i64 %indvars.iv98.i, 1
  %gep71.i.1 = getelementptr [8192 x i8], ptr %invariant.gep.i, i64 %indvars.iv.next99.i
  %171 = load float, ptr %gep71.i.1, align 4
  %172 = load float, ptr %141, align 4
  %173 = fdiv float %171, %172
  %gep73.i.1 = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %indvars.iv.next99.i
  store float %173, ptr %gep73.i.1, align 4
  %indvars.iv.next99.i.1 = add nuw nsw i64 %indvars.iv98.i, 2
  %exitcond102.not.i.1 = icmp eq i64 %indvars.iv.next99.i.1, 2048
  br i1 %exitcond102.not.i.1, label %._crit_edge77.i, label %.lr.ph76.i, !llvm.loop !46

._crit_edge77.i:                                  ; preds = %vector.body90, %.lr.ph76.i
  %indvars.iv.next121.i = add nuw nsw i64 %indvars.iv120.i, 1
  %174 = icmp samesign ult i64 %indvars.iv120.i, 2047
  br i1 %174, label %.lr.ph94.i.preheader, label %.loopexit.i

.lr.ph94.i.preheader:                             ; preds = %._crit_edge77.i
  %bound0 = icmp ult ptr %scevgep, %scevgep64
  %bound1 = icmp ult ptr %scevgep63, %scevgep62
  %found.conflict = and i1 %bound0, %bound1
  %bound067 = icmp ult ptr %scevgep, %scevgep66
  %bound168 = icmp ult ptr %scevgep65, %scevgep62
  %found.conflict69 = and i1 %bound067, %bound168
  %conflict.rdx = or i1 %found.conflict, %found.conflict69
  br label %.lr.ph94.i

.lr.ph94.i:                                       ; preds = %.lr.ph94.i.preheader, %._crit_edge91.i
  %indvars.iv115.i = phi i64 [ %indvars.iv.next116.i, %._crit_edge91.i ], [ %indvars.iv113.i, %.lr.ph94.i.preheader ]
  %175 = getelementptr [4 x i8], ptr %140, i64 %indvars.iv115.i
  store float 0.000000e+00, ptr %175, align 4
  %invariant.gep80.i = getelementptr [4 x i8], ptr %11, i64 %indvars.iv115.i
  br label %.lr.ph84.i

.lr.ph84.i:                                       ; preds = %.lr.ph84.i, %.lr.ph94.i
  %indvars.iv103.i = phi i64 [ 0, %.lr.ph94.i ], [ %indvars.iv.next104.i.1, %.lr.ph84.i ]
  %176 = phi float [ 0.000000e+00, %.lr.ph94.i ], [ %184, %.lr.ph84.i ]
  %gep79.i = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %indvars.iv103.i
  %177 = load float, ptr %gep79.i, align 4
  %gep81.i = getelementptr [8192 x i8], ptr %invariant.gep80.i, i64 %indvars.iv103.i
  %178 = load float, ptr %gep81.i, align 4
  %179 = fmul float %177, %178
  %180 = fadd float %176, %179
  store float %180, ptr %175, align 4
  %indvars.iv.next104.i = or disjoint i64 %indvars.iv103.i, 1
  %gep79.i.1 = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %indvars.iv.next104.i
  %181 = load float, ptr %gep79.i.1, align 4
  %gep81.i.1 = getelementptr [8192 x i8], ptr %invariant.gep80.i, i64 %indvars.iv.next104.i
  %182 = load float, ptr %gep81.i.1, align 4
  %183 = fmul float %181, %182
  %184 = fadd float %180, %183
  store float %184, ptr %175, align 4
  %indvars.iv.next104.i.1 = add nuw nsw i64 %indvars.iv103.i, 2
  %exitcond107.not.i.1 = icmp eq i64 %indvars.iv.next104.i.1, 2048
  br i1 %exitcond107.not.i.1, label %vector.memcheck61, label %.lr.ph84.i

vector.memcheck61:                                ; preds = %.lr.ph84.i
  br i1 %conflict.rdx, label %.lr.ph90.i, label %vector.ph71

vector.ph71:                                      ; preds = %vector.memcheck61
  %185 = load float, ptr %175, align 4, !alias.scope !47
  %broadcast.splatinsert74 = insertelement <4 x float> poison, float %185, i64 0
  %broadcast.splat75 = shufflevector <4 x float> %broadcast.splatinsert74, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body72

vector.body72:                                    ; preds = %vector.body72, %vector.ph71
  %index73 = phi i64 [ 0, %vector.ph71 ], [ %index.next76, %vector.body72 ]
  %186 = or disjoint i64 %index73, 1
  %187 = or disjoint i64 %index73, 2
  %188 = or disjoint i64 %index73, 3
  %189 = getelementptr [8192 x i8], ptr %invariant.gep80.i, i64 %index73
  %190 = getelementptr [8192 x i8], ptr %invariant.gep80.i, i64 %186
  %191 = getelementptr [8192 x i8], ptr %invariant.gep80.i, i64 %187
  %192 = getelementptr [8192 x i8], ptr %invariant.gep80.i, i64 %188
  %193 = load float, ptr %189, align 4, !alias.scope !50, !noalias !52
  %194 = load float, ptr %190, align 4, !alias.scope !50, !noalias !52
  %195 = load float, ptr %191, align 4, !alias.scope !50, !noalias !52
  %196 = load float, ptr %192, align 4, !alias.scope !50, !noalias !52
  %197 = insertelement <4 x float> poison, float %193, i64 0
  %198 = insertelement <4 x float> %197, float %194, i64 1
  %199 = insertelement <4 x float> %198, float %195, i64 2
  %200 = insertelement <4 x float> %199, float %196, i64 3
  %201 = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %index73
  %202 = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %186
  %203 = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %187
  %204 = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %188
  %205 = load float, ptr %201, align 4, !alias.scope !54
  %206 = load float, ptr %202, align 4, !alias.scope !54
  %207 = load float, ptr %203, align 4, !alias.scope !54
  %208 = load float, ptr %204, align 4, !alias.scope !54
  %209 = insertelement <4 x float> poison, float %205, i64 0
  %210 = insertelement <4 x float> %209, float %206, i64 1
  %211 = insertelement <4 x float> %210, float %207, i64 2
  %212 = insertelement <4 x float> %211, float %208, i64 3
  %213 = fmul <4 x float> %212, %broadcast.splat75
  %214 = fsub <4 x float> %200, %213
  %215 = extractelement <4 x float> %214, i64 0
  store float %215, ptr %189, align 4, !alias.scope !50, !noalias !52
  %216 = extractelement <4 x float> %214, i64 1
  store float %216, ptr %190, align 4, !alias.scope !50, !noalias !52
  %217 = extractelement <4 x float> %214, i64 2
  store float %217, ptr %191, align 4, !alias.scope !50, !noalias !52
  %218 = extractelement <4 x float> %214, i64 3
  store float %218, ptr %192, align 4, !alias.scope !50, !noalias !52
  %index.next76 = add nuw i64 %index73, 4
  %219 = icmp eq i64 %index.next76, 2048
  br i1 %219, label %._crit_edge91.i, label %vector.body72, !llvm.loop !55

.lr.ph90.i:                                       ; preds = %vector.memcheck61, %.lr.ph90.i
  %indvars.iv108.i = phi i64 [ %indvars.iv.next109.i.1, %.lr.ph90.i ], [ 0, %vector.memcheck61 ]
  %gep86.i = getelementptr [8192 x i8], ptr %invariant.gep80.i, i64 %indvars.iv108.i
  %220 = load float, ptr %gep86.i, align 4
  %gep88.i = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %indvars.iv108.i
  %221 = load float, ptr %gep88.i, align 4
  %222 = load float, ptr %175, align 4
  %223 = fmul float %221, %222
  %224 = fsub float %220, %223
  store float %224, ptr %gep86.i, align 4
  %indvars.iv.next109.i = or disjoint i64 %indvars.iv108.i, 1
  %gep86.i.1 = getelementptr [8192 x i8], ptr %invariant.gep80.i, i64 %indvars.iv.next109.i
  %225 = load float, ptr %gep86.i.1, align 4
  %gep88.i.1 = getelementptr [8192 x i8], ptr %invariant.gep72129.i, i64 %indvars.iv.next109.i
  %226 = load float, ptr %gep88.i.1, align 4
  %227 = load float, ptr %175, align 4
  %228 = fmul float %226, %227
  %229 = fsub float %225, %228
  store float %229, ptr %gep86.i.1, align 4
  %indvars.iv.next109.i.1 = add nuw nsw i64 %indvars.iv108.i, 2
  %exitcond112.not.i.1 = icmp eq i64 %indvars.iv.next109.i.1, 2048
  br i1 %exitcond112.not.i.1, label %._crit_edge91.i, label %.lr.ph90.i, !llvm.loop !56

._crit_edge91.i:                                  ; preds = %vector.body72, %.lr.ph90.i
  %indvars.iv.next116.i = add nuw nsw i64 %indvars.iv115.i, 1
  %exitcond119.not.i = icmp eq i64 %indvars.iv.next116.i, 2048
  br i1 %exitcond119.not.i, label %.loopexit.i, label %.lr.ph94.i

_Z11gramschmidtiiPA2048_fS0_S0_.exit:             ; preds = %.loopexit.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %230 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #14
  %.not.i.i40 = icmp eq i32 %230, 0
  br i1 %.not.i.i40, label %_Z20polybench_timer_stopv.exit, label %231

231:                                              ; preds = %_Z11gramschmidtiiPA2048_fS0_S0_.exit
  %232 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %230) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z11gramschmidtiiPA2048_fS0_S0_.exit, %231
  %233 = load i64, ptr %3, align 8
  %234 = sitofp i64 %233 to double
  %235 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %236 = load i64, ptr %235, align 8
  %237 = sitofp i64 %236 to double
  %238 = fmul nnan double %237, f0x3EB0C6F7A0B5ED8D
  %239 = fadd double %238, %234
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %239, ptr @polybench_t_end, align 8
  %240 = load double, ptr @polybench_t_start, align 8
  %241 = fsub double %239, %240
  %242 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %241) #5
  br label %.preheader.us.i

.preheader.us.i:                                  ; preds = %._crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv23.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next24.i, %._crit_edge.us.i ]
  %.018.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %279, %._crit_edge.us.i ]
  %243 = getelementptr [8192 x i8], ptr %11, i64 %indvars.iv23.i
  %244 = getelementptr [8192 x i8], ptr %17, i64 %indvars.iv23.i
  %245 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.018.us.i, i64 0
  br label %vector.body98

vector.body98:                                    ; preds = %vector.body98, %.preheader.us.i
  %index99 = phi i64 [ 0, %.preheader.us.i ], [ %index.next101, %vector.body98 ]
  %vec.phi = phi <4 x i32> [ %245, %.preheader.us.i ], [ %277, %vector.body98 ]
  %246 = getelementptr [4 x i8], ptr %243, i64 %index99
  %wide.load = load <4 x float>, ptr %246, align 4
  %247 = fpext <4 x float> %wide.load to <4 x double>
  %248 = getelementptr [4 x i8], ptr %244, i64 %index99
  %wide.load100 = load <4 x float>, ptr %248, align 4
  %249 = fpext <4 x float> %wide.load100 to <4 x double>
  %250 = fcmp olt <4 x double> %247, splat (double f0xB690000000000000)
  %251 = fneg <4 x float> %wide.load
  %252 = select <4 x i1> %250, <4 x float> %251, <4 x float> %wide.load
  %253 = fpext <4 x float> %252 to <4 x double>
  %254 = fcmp uge <4 x double> %253, splat (double 1.000000e-02)
  %255 = fcmp olt <4 x double> %249, splat (double f0xB690000000000000)
  %256 = fneg <4 x float> %wide.load100
  %257 = select <4 x i1> %255, <4 x float> %256, <4 x float> %wide.load100
  %258 = fpext <4 x float> %257 to <4 x double>
  %259 = fcmp uge <4 x double> %258, splat (double 1.000000e-02)
  %260 = fsub <4 x double> %247, %249
  %261 = fptrunc <4 x double> %260 to <4 x float>
  %262 = fcmp olt <4 x double> %260, splat (double f0xB690000000000000)
  %263 = fneg <4 x float> %261
  %264 = select <4 x i1> %262, <4 x float> %263, <4 x float> %261
  %265 = fadd <4 x double> %247, splat (double f0x3E45798EE0000000)
  %266 = fptrunc <4 x double> %265 to <4 x float>
  %267 = fcmp olt <4 x double> %265, splat (double f0xB690000000000000)
  %268 = fneg <4 x float> %266
  %269 = select <4 x i1> %267, <4 x float> %268, <4 x float> %266
  %270 = fdiv <4 x float> %264, %269
  %271 = fcmp olt <4 x float> %270, zeroinitializer
  %272 = fneg <4 x float> %270
  %273 = select <4 x i1> %271, <4 x float> %272, <4 x float> %270
  %274 = fmul <4 x float> %273, splat (float 1.000000e+02)
  %275 = fpext <4 x float> %274 to <4 x double>
  %276 = fcmp ogt <4 x double> %275, splat (double 5.000000e-02)
  %.not104 = select <4 x i1> %254, <4 x i1> splat (i1 true), <4 x i1> %259
  %narrow = select <4 x i1> %.not104, <4 x i1> %276, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %277 = add <4 x i32> %vec.phi, %predphi
  %index.next101 = add nuw i64 %index99, 4
  %278 = icmp eq i64 %index.next101, 2048
  br i1 %278, label %._crit_edge.us.i, label %vector.body98, !llvm.loop !57

._crit_edge.us.i:                                 ; preds = %vector.body98
  %279 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %277)
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1
  %exitcond27.not.i = icmp eq i64 %indvars.iv.next24.i, 2048
  br i1 %exitcond27.not.i, label %_Z14compareResultsiiPA2048_fS0_.exit, label %.preheader.us.i

_Z14compareResultsiiPA2048_fS0_.exit:             ; preds = %._crit_edge.us.i
  %280 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %279) #5
  call void @free(ptr noundef nonnull %11) #14
  call void @free(ptr noundef nonnull %17) #14
  call void @free(ptr noundef %22) #14
  call void @free(ptr noundef %27) #14
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

declare float @sqrtf(float) local_unnamed_addr

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
attributes #1 = { nounwind "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = !{!"llvm.loop.unroll.runtime.disable"}
!14 = distinct !{!14, !12}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = !{!21, !16}
!21 = distinct !{!21, !17}
!22 = !{!21}
!23 = distinct !{!23, !12, !13}
!24 = distinct !{!24, !12}
!25 = distinct !{!25, !12, !13}
!26 = distinct !{!26, !12}
!27 = distinct !{!27, !12, !13}
!28 = distinct !{!28, !13, !12}
!29 = distinct !{!29, !12, !13}
!30 = distinct !{!30, !13, !12}
!31 = !{ptr @_Z34__device_stub__gramschmidt_kernel1iiPfS_S_i}
!32 = !{ptr @_Z34__device_stub__gramschmidt_kernel2iiPfS_S_i}
!33 = !{ptr @_Z34__device_stub__gramschmidt_kernel3iiPfS_S_i}
!34 = distinct !{!34, !12, !13}
!35 = distinct !{!35, !12}
!36 = distinct !{!36, !12, !13}
!37 = !{!38}
!38 = distinct !{!38, !39}
!39 = distinct !{!39, !"LVerDomain"}
!40 = !{!41}
!41 = distinct !{!41, !39}
!42 = !{!43}
!43 = distinct !{!43, !39}
!44 = !{!41, !38}
!45 = distinct !{!45, !12, !13}
!46 = distinct !{!46, !12}
!47 = !{!48}
!48 = distinct !{!48, !49}
!49 = distinct !{!49, !"LVerDomain"}
!50 = !{!51}
!51 = distinct !{!51, !49}
!52 = !{!53, !48}
!53 = distinct !{!53, !49}
!54 = !{!53}
!55 = distinct !{!55, !12, !13}
!56 = distinct !{!56, !12}
!57 = distinct !{!57, !12, !13}
