; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/LU/lu.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/LU/lu.cu"
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
define dso_local void @_Z2luiPA2048_f(i32 noundef %0, ptr nofree noundef captures(none) %1) local_unnamed_addr #1 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.lr.ph46.preheader, label %._crit_edge47

.lr.ph46.preheader:                               ; preds = %2
  %4 = zext nneg i32 %0 to i64
  %wide.trip.count64 = zext nneg i32 %0 to i64
  %5 = mul nuw nsw i64 %wide.trip.count64, 8196
  %6 = getelementptr i8, ptr %1, i64 %5
  %scevgep66 = getelementptr i8, ptr %6, i64 -8192
  %7 = shl nuw nsw i64 %wide.trip.count64, 13
  %8 = shl nuw nsw i64 %wide.trip.count64, 2
  %9 = add nsw i64 %wide.trip.count64, -1
  %10 = getelementptr i8, ptr %1, i64 %7
  %11 = getelementptr i8, ptr %10, i64 -8188
  %12 = getelementptr i8, ptr %1, i64 %8
  %13 = add nsw i64 %wide.trip.count64, -1
  br label %.lr.ph46

.loopexit:                                        ; preds = %._crit_edge, %.lr.ph46
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond65.not = icmp eq i64 %indvars.iv.next62, %wide.trip.count64
  br i1 %exitcond65.not, label %._crit_edge47, label %.lr.ph46

.lr.ph46:                                         ; preds = %.lr.ph46.preheader, %.loopexit
  %indvars.iv61 = phi i64 [ 0, %.lr.ph46.preheader ], [ %indvars.iv.next62, %.loopexit ]
  %indvars.iv = phi i64 [ 1, %.lr.ph46.preheader ], [ %indvars.iv.next, %.loopexit ]
  %14 = sub i64 %9, %indvars.iv61
  %15 = sub i64 %9, %indvars.iv61
  %16 = mul nuw nsw i64 %indvars.iv61, 8196
  %17 = getelementptr i8, ptr %1, i64 %16
  %scevgep = getelementptr i8, ptr %17, i64 8196
  %18 = getelementptr i8, ptr %1, i64 %16
  %scevgep67 = getelementptr i8, ptr %18, i64 8192
  %19 = shl nuw nsw i64 %indvars.iv61, 2
  %scevgep68 = getelementptr i8, ptr %11, i64 %19
  %20 = getelementptr i8, ptr %1, i64 %16
  %scevgep69 = getelementptr i8, ptr %20, i64 4
  %21 = shl nuw nsw i64 %indvars.iv61, 13
  %scevgep70 = getelementptr i8, ptr %12, i64 %21
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %22 = icmp samesign ult i64 %indvars.iv.next62, %4
  br i1 %22, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %.lr.ph46
  %23 = getelementptr [8192 x i8], ptr %1, i64 %indvars.iv61
  %24 = getelementptr [4 x i8], ptr %23, i64 %indvars.iv61
  %min.iters.check78 = icmp ult i64 %14, 4
  br i1 %min.iters.check78, label %scalar.ph77.preheader, label %vector.ph79

vector.ph79:                                      ; preds = %.lr.ph
  %n.vec81 = and i64 %14, -4
  %25 = add i64 %indvars.iv, %n.vec81
  %26 = getelementptr [4 x i8], ptr %23, i64 %indvars.iv
  br label %vector.body82

vector.body82:                                    ; preds = %vector.body82, %vector.ph79
  %index83 = phi i64 [ 0, %vector.ph79 ], [ %index.next87, %vector.body82 ]
  %27 = getelementptr [4 x i8], ptr %26, i64 %index83
  %wide.load84 = load <4 x float>, ptr %27, align 4
  %28 = load float, ptr %24, align 4
  %broadcast.splatinsert85 = insertelement <4 x float> poison, float %28, i64 0
  %broadcast.splat86 = shufflevector <4 x float> %broadcast.splatinsert85, <4 x float> poison, <4 x i32> zeroinitializer
  %29 = fdiv <4 x float> %wide.load84, %broadcast.splat86
  store <4 x float> %29, ptr %27, align 4
  %index.next87 = add nuw i64 %index83, 4
  %30 = icmp eq i64 %index.next87, %n.vec81
  br i1 %30, label %middle.block88, label %vector.body82, !llvm.loop !1

middle.block88:                                   ; preds = %vector.body82
  %cmp.n89 = icmp eq i64 %14, %n.vec81
  br i1 %cmp.n89, label %.preheader.lr.ph, label %scalar.ph77.preheader

scalar.ph77.preheader:                            ; preds = %.lr.ph, %middle.block88
  %indvars.iv48.ph = phi i64 [ %indvars.iv, %.lr.ph ], [ %25, %middle.block88 ]
  br label %scalar.ph77

.preheader.lr.ph:                                 ; preds = %scalar.ph77, %middle.block88
  %31 = getelementptr [8192 x i8], ptr %1, i64 %indvars.iv61
  %min.iters.check = icmp ult i64 %15, 8
  %bound0 = icmp ult ptr %scevgep, %scevgep68
  %bound1 = icmp ult ptr %scevgep67, %scevgep66
  %found.conflict = and i1 %bound0, %bound1
  %bound071 = icmp ult ptr %scevgep, %scevgep70
  %bound172 = icmp ult ptr %scevgep69, %scevgep66
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx = or i1 %found.conflict, %found.conflict73
  %n.vec = and i64 %15, -8
  %32 = add i64 %indvars.iv, %n.vec
  %cmp.n = icmp eq i64 %15, %n.vec
  br label %.preheader

scalar.ph77:                                      ; preds = %scalar.ph77.preheader, %scalar.ph77
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %scalar.ph77 ], [ %indvars.iv48.ph, %scalar.ph77.preheader ]
  %33 = getelementptr [4 x i8], ptr %23, i64 %indvars.iv48
  %34 = load float, ptr %33, align 4
  %35 = load float, ptr %24, align 4
  %36 = fdiv float %34, %35
  store float %36, ptr %33, align 4
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next49, %wide.trip.count64
  br i1 %exitcond.not, label %.preheader.lr.ph, label %scalar.ph77, !llvm.loop !4

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %indvars.iv56 = phi i64 [ %indvars.iv, %.preheader.lr.ph ], [ %indvars.iv.next57, %._crit_edge ]
  %37 = getelementptr [8192 x i8], ptr %1, i64 %indvars.iv56
  %38 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv61
  %brmerge = select i1 %min.iters.check, i1 true, i1 %conflict.rdx
  br i1 %brmerge, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader
  %39 = load float, ptr %38, align 4, !alias.scope !5
  %broadcast.splatinsert = insertelement <4 x float> poison, float %39, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %40 = add nuw i64 %indvars.iv, %index
  %41 = getelementptr [4 x i8], ptr %37, i64 %40
  %42 = getelementptr i8, ptr %41, i64 16
  %wide.load = load <4 x float>, ptr %41, align 4, !alias.scope !8, !noalias !10
  %wide.load74 = load <4 x float>, ptr %42, align 4, !alias.scope !8, !noalias !10
  %43 = getelementptr [4 x i8], ptr %31, i64 %40
  %44 = getelementptr i8, ptr %43, i64 16
  %wide.load75 = load <4 x float>, ptr %43, align 4, !alias.scope !12
  %wide.load76 = load <4 x float>, ptr %44, align 4, !alias.scope !12
  %45 = fmul <4 x float> %broadcast.splat, %wide.load75
  %46 = fmul <4 x float> %broadcast.splat, %wide.load76
  %47 = fsub <4 x float> %wide.load, %45
  %48 = fsub <4 x float> %wide.load74, %46
  store <4 x float> %47, ptr %41, align 4, !alias.scope !8, !noalias !10
  store <4 x float> %48, ptr %42, align 4, !alias.scope !8, !noalias !10
  %index.next = add nuw i64 %index, 8
  %49 = icmp eq i64 %index.next, %n.vec
  br i1 %49, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader, %middle.block
  %indvars.iv51.ph = phi i64 [ %32, %middle.block ], [ %indvars.iv, %.preheader ]
  %50 = sub i64 %wide.trip.count64, %indvars.iv51.ph
  %xtraiter = and i64 %50, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %scalar.ph.prol.loopexit, label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.preheader
  %51 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv51.ph
  %52 = load float, ptr %51, align 4
  %53 = load float, ptr %38, align 4
  %54 = getelementptr [4 x i8], ptr %31, i64 %indvars.iv51.ph
  %55 = load float, ptr %54, align 4
  %56 = fmul float %53, %55
  %57 = fsub float %52, %56
  store float %57, ptr %51, align 4
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.ph, 1
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol, %scalar.ph.preheader
  %indvars.iv51.unr = phi i64 [ %indvars.iv51.ph, %scalar.ph.preheader ], [ %indvars.iv.next52.prol, %scalar.ph.prol ]
  %58 = icmp eq i64 %indvars.iv51.ph, %13
  br i1 %58, label %._crit_edge, label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.prol.loopexit, %scalar.ph
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.1, %scalar.ph ], [ %indvars.iv51.unr, %scalar.ph.prol.loopexit ]
  %59 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv51
  %60 = load float, ptr %59, align 4
  %61 = load float, ptr %38, align 4
  %62 = getelementptr [4 x i8], ptr %31, i64 %indvars.iv51
  %63 = load float, ptr %62, align 4
  %64 = fmul float %61, %63
  %65 = fsub float %60, %64
  store float %65, ptr %59, align 4
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %66 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv.next52
  %67 = load float, ptr %66, align 4
  %68 = load float, ptr %38, align 4
  %69 = getelementptr [4 x i8], ptr %31, i64 %indvars.iv.next52
  %70 = load float, ptr %69, align 4
  %71 = fmul float %68, %70
  %72 = fsub float %67, %71
  store float %72, ptr %66, align 4
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %exitcond55.not.1 = icmp eq i64 %indvars.iv.next52.1, %wide.trip.count64
  br i1 %exitcond55.not.1, label %._crit_edge, label %scalar.ph, !llvm.loop !14

._crit_edge:                                      ; preds = %scalar.ph.prol.loopexit, %scalar.ph, %middle.block
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond60.not = icmp eq i64 %indvars.iv.next57, %wide.trip.count64
  br i1 %exitcond60.not, label %.loopexit, label %.preheader

._crit_edge47:                                    ; preds = %.loopexit, %2
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: write)
define dso_local void @_Z10init_arrayiPA2048_f(i32 noundef %0, ptr nofree noundef writeonly captures(none) %1) local_unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.preheader, label %._crit_edge14.split

.preheader.preheader:                             ; preds = %2
  %wide.trip.count19 = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 8
  %n.vec = and i64 %wide.trip.count19, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count19
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv16 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next17, %._crit_edge ]
  %4 = trunc nuw nsw i64 %indvars.iv16 to i32
  %5 = uitofp nneg i32 %4 to float
  %6 = getelementptr [8192 x i8], ptr %1, i64 %indvars.iv16
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %5, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %7 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %8 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %9 = fmul nnan <4 x float> %broadcast.splat, %7
  %10 = fmul nnan <4 x float> %broadcast.splat, %8
  %11 = fadd nnan <4 x float> %9, splat (float 1.000000e+00)
  %12 = fadd nnan <4 x float> %10, splat (float 1.000000e+00)
  %13 = fmul nnan <4 x float> %11, splat (float f0x3A000000)
  %14 = fmul nnan <4 x float> %12, splat (float f0x3A000000)
  %15 = getelementptr [4 x i8], ptr %6, i64 %index
  %16 = getelementptr i8, ptr %15, i64 16
  store <4 x float> %13, ptr %15, align 4
  store <4 x float> %14, ptr %16, align 4
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %18 = trunc nuw nsw i64 %indvars.iv to i32
  %19 = uitofp nneg i32 %18 to float
  %20 = fmul nnan float %5, %19
  %21 = fadd nnan float %20, 1.000000e+00
  %22 = fmul nnan float %21, f0x3A000000
  %23 = getelementptr [4 x i8], ptr %6, i64 %indvars.iv
  store float %22, ptr %23, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count19
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !16

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond20.not = icmp eq i64 %indvars.iv.next17, %wide.trip.count19
  br i1 %exitcond20.not, label %._crit_edge14.split, label %.preheader

._crit_edge14.split:                              ; preds = %._crit_edge, %2
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiPA2048_fS0_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2) local_unnamed_addr #4 {
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
  %5 = getelementptr [8192 x i8], ptr %1, i64 %indvars.iv23
  %6 = getelementptr [8192 x i8], ptr %2, i64 %indvars.iv23
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
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !17

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
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !18

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

define dso_local void @_Z25__device_stub__lu_kernel1iPfi(i32 noundef %0, ptr noundef %1, i32 noundef %2) #6 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
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
  %17 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z25__device_stub__lu_kernel1iPfi, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %7, i64 noundef %15, ptr noundef %16)
  ret void
}

define dso_local void @_Z25__device_stub__lu_kernel2iPfi(i32 noundef %0, ptr noundef %1, i32 noundef %2) #6 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
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
  %17 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z25__device_stub__lu_kernel2iPfi, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %7, i64 noundef %15, ptr noundef %16)
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

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #5

define dso_local void @_Z6luCudaiPA2048_fS0_(i32 noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #6 {
  %4 = alloca %struct.timeval, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca [3 x ptr], align 16
  %9 = alloca %struct.dim3, align 8
  %10 = alloca %struct.dim3, align 8
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca [3 x ptr], align 16
  %17 = alloca %struct.dim3, align 8
  %18 = alloca %struct.dim3, align 8
  %19 = alloca i64, align 8
  %20 = alloca ptr, align 8
  %21 = alloca %struct.timeval, align 8
  %22 = alloca ptr, align 8
  %23 = call noundef i32 @cudaMalloc(ptr noundef nonnull %22, i64 noundef 16777216) #5
  %24 = load ptr, ptr %22, align 8
  %25 = call i32 @cudaMemcpy(ptr noundef %24, ptr noundef %1, i64 noundef 16777216, i32 noundef 1) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %21)
  %26 = call i32 @gettimeofday(ptr noundef nonnull %21, ptr noundef null) #13
  %.not.i.i = icmp eq i32 %26, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %27

27:                                               ; preds = %3
  %28 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %26) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %3, %27
  %29 = load i64, ptr %21, align 8
  %30 = sitofp i64 %29 to double
  %31 = getelementptr inbounds nuw i8, ptr %21, i64 8
  %32 = load i64, ptr %31, align 8
  %33 = sitofp i64 %32 to double
  %34 = fmul nnan double %33, f0x3EB0C6F7A0B5ED8D
  %35 = fadd double %34, %30
  call void @llvm.lifetime.end.p0(ptr nonnull %21)
  store double %35, ptr @polybench_t_start, align 8
  %36 = getelementptr inbounds nuw i8, ptr %16, i64 8
  %37 = getelementptr inbounds nuw i8, ptr %16, i64 16
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %17, i64 4
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %17, i64 8
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %18, i64 4
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %18, i64 8
  %38 = getelementptr inbounds nuw i8, ptr %8, i64 8
  %39 = getelementptr inbounds nuw i8, ptr %8, i64 16
  %.fca.1.gep4.i31 = getelementptr inbounds nuw i8, ptr %9, i64 4
  %.fca.2.gep7.i34 = getelementptr inbounds nuw i8, ptr %9, i64 8
  %.fca.1.gep.i39 = getelementptr inbounds nuw i8, ptr %10, i64 4
  %.fca.2.gep.i42 = getelementptr inbounds nuw i8, ptr %10, i64 8
  br label %40

40:                                               ; preds = %_Z21polybench_timer_startv.exit, %69
  %.055 = phi i32 [ 0, %_Z21polybench_timer_startv.exit ], [ %41, %69 ]
  %41 = add nuw nsw i32 %.055, 1
  %42 = sub nuw nsw i32 2047, %.055
  %43 = uitofp nneg i32 %42 to float
  %44 = fmul nnan float %43, 3.906250e-03
  %45 = call float @llvm.ceil.f32(float %44)
  %46 = fptoui float %45 to i32
  %.fca.0.insert15 = insertvalue %struct.dim3 poison, i32 %46, 0
  %.fca.1.insert16 = insertvalue %struct.dim3 %.fca.0.insert15, i32 1, 1
  %.fca.2.insert17 = insertvalue %struct.dim3 %.fca.1.insert16, i32 1, 2
  %47 = call i32 @__cudaPushCallConfiguration(%struct.dim3 %.fca.2.insert17, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %47, 0
  br i1 %.not, label %48, label %54

48:                                               ; preds = %40
  %49 = load ptr, ptr %22, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  call void @llvm.lifetime.start.p0(ptr nonnull %15)
  call void @llvm.lifetime.start.p0(ptr nonnull %16)
  call void @llvm.lifetime.start.p0(ptr nonnull %17)
  call void @llvm.lifetime.start.p0(ptr nonnull %18)
  call void @llvm.lifetime.start.p0(ptr nonnull %19)
  call void @llvm.lifetime.start.p0(ptr nonnull %20)
  store i32 %0, ptr %13, align 4
  store ptr %49, ptr %14, align 8
  store i32 %.055, ptr %15, align 4
  store ptr %13, ptr %16, align 16
  store ptr %14, ptr %36, align 8
  store ptr %15, ptr %37, align 16
  %50 = call i32 @__cudaPopCallConfiguration(ptr nonnull %17, ptr nonnull %18, ptr nonnull %19, ptr nonnull %20), !inline_history !19
  %51 = load i64, ptr %19, align 8
  %52 = load ptr, ptr %20, align 8
  %.fca.0.load2.i = load i32, ptr %17, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %18, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %53 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z25__device_stub__lu_kernel1iPfi, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %16, i64 noundef %51, ptr noundef %52), !inline_history !19
  call void @llvm.lifetime.end.p0(ptr nonnull %13)
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  call void @llvm.lifetime.end.p0(ptr nonnull %15)
  call void @llvm.lifetime.end.p0(ptr nonnull %16)
  call void @llvm.lifetime.end.p0(ptr nonnull %17)
  call void @llvm.lifetime.end.p0(ptr nonnull %18)
  call void @llvm.lifetime.end.p0(ptr nonnull %19)
  call void @llvm.lifetime.end.p0(ptr nonnull %20)
  br label %54

54:                                               ; preds = %40, %48
  %55 = call i32 @cudaThreadSynchronize() #5
  %56 = fmul nnan float %43, 3.125000e-02
  %57 = call float @llvm.ceil.f32(float %56)
  %58 = fptoui float %57 to i32
  %59 = fmul nnan float %43, 1.250000e-01
  %60 = call float @llvm.ceil.f32(float %59)
  %61 = fptoui float %60 to i32
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %58, 0
  %.fca.1.insert4 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %61, 1
  %.fca.2.insert5 = insertvalue %struct.dim3 %.fca.1.insert4, i32 1, 2
  %62 = call i32 @__cudaPushCallConfiguration(%struct.dim3 %.fca.2.insert5, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not28 = icmp eq i32 %62, 0
  br i1 %.not28, label %63, label %69

63:                                               ; preds = %54
  %64 = load ptr, ptr %22, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  store i32 %0, ptr %5, align 4
  store ptr %64, ptr %6, align 8
  store i32 %.055, ptr %7, align 4
  store ptr %5, ptr %8, align 16
  store ptr %6, ptr %38, align 8
  store ptr %7, ptr %39, align 16
  %65 = call i32 @__cudaPopCallConfiguration(ptr nonnull %9, ptr nonnull %10, ptr nonnull %11, ptr nonnull %12), !inline_history !20
  %66 = load i64, ptr %11, align 8
  %67 = load ptr, ptr %12, align 8
  %.fca.0.load2.i29 = load i32, ptr %9, align 8
  %.fca.0.insert3.i30 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i29, 0
  %.fca.1.load5.i32 = load i32, ptr %.fca.1.gep4.i31, align 4
  %.fca.1.insert6.i33 = insertvalue %struct.dim3 %.fca.0.insert3.i30, i32 %.fca.1.load5.i32, 1
  %.fca.2.load8.i35 = load i32, ptr %.fca.2.gep7.i34, align 8
  %.fca.2.insert9.i36 = insertvalue %struct.dim3 %.fca.1.insert6.i33, i32 %.fca.2.load8.i35, 2
  %.fca.0.load.i37 = load i32, ptr %10, align 8
  %.fca.0.insert.i38 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i37, 0
  %.fca.1.load.i40 = load i32, ptr %.fca.1.gep.i39, align 4
  %.fca.1.insert.i41 = insertvalue %struct.dim3 %.fca.0.insert.i38, i32 %.fca.1.load.i40, 1
  %.fca.2.load.i43 = load i32, ptr %.fca.2.gep.i42, align 8
  %.fca.2.insert.i44 = insertvalue %struct.dim3 %.fca.1.insert.i41, i32 %.fca.2.load.i43, 2
  %68 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z25__device_stub__lu_kernel2iPfi, %struct.dim3 %.fca.2.insert9.i36, %struct.dim3 %.fca.2.insert.i44, ptr noundef nonnull %8, i64 noundef %66, ptr noundef %67), !inline_history !20
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  br label %69

69:                                               ; preds = %54, %63
  %70 = call i32 @cudaThreadSynchronize() #5
  %exitcond.not = icmp eq i32 %41, 2048
  br i1 %exitcond.not, label %71, label %40

71:                                               ; preds = %69
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %72 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #13
  %.not.i.i45 = icmp eq i32 %72, 0
  br i1 %.not.i.i45, label %_Z20polybench_timer_stopv.exit, label %73

73:                                               ; preds = %71
  %74 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %72) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %71, %73
  %75 = load i64, ptr %4, align 8
  %76 = sitofp i64 %75 to double
  %77 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %78 = load i64, ptr %77, align 8
  %79 = sitofp i64 %78 to double
  %80 = fmul nnan double %79, f0x3EB0C6F7A0B5ED8D
  %81 = fadd double %80, %76
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %81, ptr @polybench_t_end, align 8
  %82 = load double, ptr @polybench_t_start, align 8
  %83 = fsub double %81, %82
  %84 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %83) #5
  %85 = load ptr, ptr %22, align 8
  %86 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %85, i64 noundef 16777216, i32 noundef 2) #5
  %87 = load ptr, ptr %22, align 8
  %88 = call i32 @cudaFree(ptr noundef %87) #5
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
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %8 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 16777216) #13
  %9 = load ptr, ptr %7, align 8
  %.not.i.i = icmp eq ptr %9, null
  %10 = icmp ne i32 %8, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %10
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %11 = load ptr, ptr @stderr, align 8
  %12 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %11) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %13 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 16777216) #13
  %14 = load ptr, ptr %6, align 8
  %.not.i.i12 = icmp eq ptr %14, null
  %15 = icmp ne i32 %13, 0
  %or.cond.i.i13 = select i1 %.not.i.i12, i1 true, i1 %15
  br i1 %or.cond.i.i13, label %.critedge.i.i14, label %_Z20polybench_alloc_datayi.exit15

.critedge.i.i14:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %16 = load ptr, ptr @stderr, align 8
  %17 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %16) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit15:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  br label %.preheader.i

.preheader.i:                                     ; preds = %._crit_edge.i, %_Z20polybench_alloc_datayi.exit15
  %indvars.iv16.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit15 ], [ %indvars.iv.next17.i, %._crit_edge.i ]
  %18 = getelementptr [8192 x i8], ptr %9, i64 %indvars.iv16.i
  %19 = trunc nuw nsw i64 %indvars.iv16.i to i32
  %20 = uitofp nneg i32 %19 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %20, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.i
  %index = phi i64 [ 0, %.preheader.i ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader.i ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %21 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %22 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %23 = fmul nnan <4 x float> %broadcast.splat, %21
  %24 = fmul nnan <4 x float> %broadcast.splat, %22
  %25 = fadd nnan <4 x float> %23, splat (float 1.000000e+00)
  %26 = fadd nnan <4 x float> %24, splat (float 1.000000e+00)
  %27 = fmul nnan <4 x float> %25, splat (float f0x3A000000)
  %28 = fmul nnan <4 x float> %26, splat (float f0x3A000000)
  %29 = getelementptr [4 x i8], ptr %18, i64 %index
  %30 = getelementptr i8, ptr %29, i64 16
  store <4 x float> %27, ptr %29, align 4
  store <4 x float> %28, ptr %30, align 4
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %31 = icmp eq i64 %index.next, 2048
  br i1 %31, label %._crit_edge.i, label %vector.body, !llvm.loop !21

._crit_edge.i:                                    ; preds = %vector.body
  %indvars.iv.next17.i = add nuw nsw i64 %indvars.iv16.i, 1
  %exitcond20.not.i = icmp eq i64 %indvars.iv.next17.i, 2048
  br i1 %exitcond20.not.i, label %_Z10init_arrayiPA2048_f.exit, label %.preheader.i

_Z10init_arrayiPA2048_f.exit:                     ; preds = %._crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  %32 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %5, i32 noundef 0) #5
  %33 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %5) #5
  %34 = call i32 @cudaSetDevice(i32 noundef 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @_Z6luCudaiPA2048_fS0_(i32 noundef 2048, ptr noundef nonnull %9, ptr noundef %14) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %35 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #13
  %.not.i.i16 = icmp eq i32 %35, 0
  br i1 %.not.i.i16, label %_Z21polybench_timer_startv.exit, label %36

36:                                               ; preds = %_Z10init_arrayiPA2048_f.exit
  %37 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %35) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiPA2048_f.exit, %36
  %38 = load i64, ptr %4, align 8
  %39 = sitofp i64 %38 to double
  %40 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %41 = load i64, ptr %40, align 8
  %42 = sitofp i64 %41 to double
  %43 = fmul nnan double %42, f0x3EB0C6F7A0B5ED8D
  %44 = fadd double %43, %39
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %44, ptr @polybench_t_start, align 8
  %scevgep29 = getelementptr i8, ptr %9, i64 16777216
  br label %.lr.ph46.i

.loopexit.i:                                      ; preds = %._crit_edge.i21, %.lr.ph46.i
  %indvars.iv.next.i18 = add nuw nsw i64 %indvars.iv.i17, 1
  %exitcond65.not.i = icmp eq i64 %indvars.iv.next62.i, 2048
  br i1 %exitcond65.not.i, label %_Z2luiPA2048_f.exit, label %.lr.ph46.i

.lr.ph46.i:                                       ; preds = %.loopexit.i, %_Z21polybench_timer_startv.exit
  %indvars.iv61.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next62.i, %.loopexit.i ]
  %indvars.iv.i17 = phi i64 [ 1, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next.i18, %.loopexit.i ]
  %45 = sub nsw i64 2047, %indvars.iv61.i
  %46 = sub nsw i64 2047, %indvars.iv61.i
  %47 = mul nuw nsw i64 %indvars.iv61.i, 8196
  %48 = getelementptr i8, ptr %9, i64 %47
  %scevgep = getelementptr i8, ptr %48, i64 8196
  %49 = getelementptr i8, ptr %9, i64 %47
  %scevgep30 = getelementptr i8, ptr %49, i64 8192
  %50 = shl nuw nsw i64 %indvars.iv61.i, 2
  %51 = getelementptr i8, ptr %9, i64 %50
  %scevgep31 = getelementptr i8, ptr %51, i64 16769028
  %52 = getelementptr i8, ptr %9, i64 %47
  %scevgep32 = getelementptr i8, ptr %52, i64 4
  %53 = shl nuw nsw i64 %indvars.iv61.i, 13
  %54 = getelementptr i8, ptr %9, i64 %53
  %scevgep33 = getelementptr i8, ptr %54, i64 8192
  %indvars.iv.next62.i = add nuw nsw i64 %indvars.iv61.i, 1
  %55 = icmp samesign ult i64 %indvars.iv61.i, 2047
  br i1 %55, label %.lr.ph.i, label %.loopexit.i

.lr.ph.i:                                         ; preds = %.lr.ph46.i
  %56 = getelementptr [8192 x i8], ptr %9, i64 %indvars.iv61.i
  %57 = getelementptr [4 x i8], ptr %56, i64 %indvars.iv61.i
  %min.iters.check48 = icmp ult i64 %45, 4
  br i1 %min.iters.check48, label %scalar.ph47.preheader, label %vector.ph49

vector.ph49:                                      ; preds = %.lr.ph.i
  %n.vec51 = and i64 %45, 2044
  %58 = add nuw i64 %indvars.iv.i17, %n.vec51
  %59 = getelementptr [4 x i8], ptr %56, i64 %indvars.iv.i17
  br label %vector.body52

vector.body52:                                    ; preds = %vector.body52, %vector.ph49
  %index53 = phi i64 [ 0, %vector.ph49 ], [ %index.next57, %vector.body52 ]
  %60 = getelementptr [4 x i8], ptr %59, i64 %index53
  %wide.load54 = load <4 x float>, ptr %60, align 4
  %61 = load float, ptr %57, align 4
  %broadcast.splatinsert55 = insertelement <4 x float> poison, float %61, i64 0
  %broadcast.splat56 = shufflevector <4 x float> %broadcast.splatinsert55, <4 x float> poison, <4 x i32> zeroinitializer
  %62 = fdiv <4 x float> %wide.load54, %broadcast.splat56
  store <4 x float> %62, ptr %60, align 4
  %index.next57 = add nuw i64 %index53, 4
  %63 = icmp eq i64 %index.next57, %n.vec51
  br i1 %63, label %middle.block58, label %vector.body52, !llvm.loop !22

middle.block58:                                   ; preds = %vector.body52
  %cmp.n59 = icmp eq i64 %45, %n.vec51
  br i1 %cmp.n59, label %.preheader.i20.preheader, label %scalar.ph47.preheader

scalar.ph47.preheader:                            ; preds = %.lr.ph.i, %middle.block58
  %indvars.iv48.i.ph = phi i64 [ %indvars.iv.i17, %.lr.ph.i ], [ %58, %middle.block58 ]
  br label %scalar.ph47

scalar.ph47:                                      ; preds = %scalar.ph47.preheader, %scalar.ph47
  %indvars.iv48.i = phi i64 [ %indvars.iv.next49.i, %scalar.ph47 ], [ %indvars.iv48.i.ph, %scalar.ph47.preheader ]
  %64 = getelementptr [4 x i8], ptr %56, i64 %indvars.iv48.i
  %65 = load float, ptr %64, align 4
  %66 = load float, ptr %57, align 4
  %67 = fdiv float %65, %66
  store float %67, ptr %64, align 4
  %indvars.iv.next49.i = add nuw nsw i64 %indvars.iv48.i, 1
  %exitcond.not.i19 = icmp eq i64 %indvars.iv.next49.i, 2048
  br i1 %exitcond.not.i19, label %.preheader.i20.preheader, label %scalar.ph47, !llvm.loop !23

.preheader.i20.preheader:                         ; preds = %scalar.ph47, %middle.block58
  %min.iters.check = icmp ult i64 %46, 8
  %bound0 = icmp ult ptr %scevgep, %scevgep31
  %bound1 = icmp ult ptr %scevgep30, %scevgep29
  %found.conflict = and i1 %bound0, %bound1
  %bound034 = icmp ult ptr %scevgep, %scevgep33
  %bound135 = icmp ult ptr %scevgep32, %scevgep29
  %found.conflict36 = and i1 %bound034, %bound135
  %conflict.rdx = or i1 %found.conflict, %found.conflict36
  %n.vec = and i64 %46, 2040
  %68 = add nuw i64 %indvars.iv.i17, %n.vec
  %cmp.n = icmp eq i64 %46, %n.vec
  br label %.preheader.i20

.preheader.i20:                                   ; preds = %.preheader.i20.preheader, %._crit_edge.i21
  %indvars.iv56.i = phi i64 [ %indvars.iv.next57.i, %._crit_edge.i21 ], [ %indvars.iv.i17, %.preheader.i20.preheader ]
  %69 = getelementptr [8192 x i8], ptr %9, i64 %indvars.iv56.i
  %70 = getelementptr [4 x i8], ptr %69, i64 %indvars.iv61.i
  %brmerge = select i1 %min.iters.check, i1 true, i1 %conflict.rdx
  br i1 %brmerge, label %scalar.ph.preheader, label %vector.ph37

vector.ph37:                                      ; preds = %.preheader.i20
  %71 = load float, ptr %70, align 4, !alias.scope !24
  %broadcast.splatinsert43 = insertelement <4 x float> poison, float %71, i64 0
  %broadcast.splat44 = shufflevector <4 x float> %broadcast.splatinsert43, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body38

vector.body38:                                    ; preds = %vector.body38, %vector.ph37
  %index39 = phi i64 [ 0, %vector.ph37 ], [ %index.next45, %vector.body38 ]
  %72 = add nuw i64 %indvars.iv.i17, %index39
  %73 = getelementptr [4 x i8], ptr %69, i64 %72
  %74 = getelementptr i8, ptr %73, i64 16
  %wide.load = load <4 x float>, ptr %73, align 4, !alias.scope !27, !noalias !29
  %wide.load40 = load <4 x float>, ptr %74, align 4, !alias.scope !27, !noalias !29
  %75 = getelementptr [4 x i8], ptr %56, i64 %72
  %76 = getelementptr i8, ptr %75, i64 16
  %wide.load41 = load <4 x float>, ptr %75, align 4, !alias.scope !31
  %wide.load42 = load <4 x float>, ptr %76, align 4, !alias.scope !31
  %77 = fmul <4 x float> %broadcast.splat44, %wide.load41
  %78 = fmul <4 x float> %broadcast.splat44, %wide.load42
  %79 = fsub <4 x float> %wide.load, %77
  %80 = fsub <4 x float> %wide.load40, %78
  store <4 x float> %79, ptr %73, align 4, !alias.scope !27, !noalias !29
  store <4 x float> %80, ptr %74, align 4, !alias.scope !27, !noalias !29
  %index.next45 = add nuw i64 %index39, 8
  %81 = icmp eq i64 %index.next45, %n.vec
  br i1 %81, label %middle.block46, label %vector.body38, !llvm.loop !32

middle.block46:                                   ; preds = %vector.body38
  br i1 %cmp.n, label %._crit_edge.i21, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader.i20, %middle.block46
  %indvars.iv51.i.ph = phi i64 [ %68, %middle.block46 ], [ %indvars.iv.i17, %.preheader.i20 ]
  %xtraiter = and i64 %indvars.iv51.i.ph, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %scalar.ph.prol.loopexit, label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.preheader
  %82 = getelementptr [4 x i8], ptr %69, i64 %indvars.iv51.i.ph
  %83 = load float, ptr %82, align 4
  %84 = load float, ptr %70, align 4
  %85 = getelementptr [4 x i8], ptr %56, i64 %indvars.iv51.i.ph
  %86 = load float, ptr %85, align 4
  %87 = fmul float %84, %86
  %88 = fsub float %83, %87
  store float %88, ptr %82, align 4
  %indvars.iv.next52.i.prol = add nuw nsw i64 %indvars.iv51.i.ph, 1
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol, %scalar.ph.preheader
  %indvars.iv51.i.unr = phi i64 [ %indvars.iv51.i.ph, %scalar.ph.preheader ], [ %indvars.iv.next52.i.prol, %scalar.ph.prol ]
  %89 = icmp eq i64 %indvars.iv51.i.ph, 2047
  br i1 %89, label %._crit_edge.i21, label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.prol.loopexit, %scalar.ph
  %indvars.iv51.i = phi i64 [ %indvars.iv.next52.i.1, %scalar.ph ], [ %indvars.iv51.i.unr, %scalar.ph.prol.loopexit ]
  %90 = getelementptr [4 x i8], ptr %69, i64 %indvars.iv51.i
  %91 = load float, ptr %90, align 4
  %92 = load float, ptr %70, align 4
  %93 = getelementptr [4 x i8], ptr %56, i64 %indvars.iv51.i
  %94 = load float, ptr %93, align 4
  %95 = fmul float %92, %94
  %96 = fsub float %91, %95
  store float %96, ptr %90, align 4
  %indvars.iv.next52.i = add nuw nsw i64 %indvars.iv51.i, 1
  %97 = getelementptr [4 x i8], ptr %69, i64 %indvars.iv.next52.i
  %98 = load float, ptr %97, align 4
  %99 = load float, ptr %70, align 4
  %100 = getelementptr [4 x i8], ptr %56, i64 %indvars.iv.next52.i
  %101 = load float, ptr %100, align 4
  %102 = fmul float %99, %101
  %103 = fsub float %98, %102
  store float %103, ptr %97, align 4
  %indvars.iv.next52.i.1 = add nuw nsw i64 %indvars.iv51.i, 2
  %exitcond55.not.i.1 = icmp eq i64 %indvars.iv.next52.i.1, 2048
  br i1 %exitcond55.not.i.1, label %._crit_edge.i21, label %scalar.ph, !llvm.loop !33

._crit_edge.i21:                                  ; preds = %scalar.ph.prol.loopexit, %scalar.ph, %middle.block46
  %indvars.iv.next57.i = add nuw nsw i64 %indvars.iv56.i, 1
  %exitcond60.not.i = icmp eq i64 %indvars.iv.next57.i, 2048
  br i1 %exitcond60.not.i, label %.loopexit.i, label %.preheader.i20

_Z2luiPA2048_f.exit:                              ; preds = %.loopexit.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %104 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #13
  %.not.i.i22 = icmp eq i32 %104, 0
  br i1 %.not.i.i22, label %_Z20polybench_timer_stopv.exit, label %105

105:                                              ; preds = %_Z2luiPA2048_f.exit
  %106 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %104) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z2luiPA2048_f.exit, %105
  %107 = load i64, ptr %3, align 8
  %108 = sitofp i64 %107 to double
  %109 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %110 = load i64, ptr %109, align 8
  %111 = sitofp i64 %110 to double
  %112 = fmul nnan double %111, f0x3EB0C6F7A0B5ED8D
  %113 = fadd double %112, %108
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %113, ptr @polybench_t_end, align 8
  %114 = load double, ptr @polybench_t_start, align 8
  %115 = fsub double %113, %114
  %116 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %115) #5
  br label %.preheader.us.i

.preheader.us.i:                                  ; preds = %._crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv23.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next24.i, %._crit_edge.us.i ]
  %.019.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %153, %._crit_edge.us.i ]
  %117 = getelementptr [8192 x i8], ptr %9, i64 %indvars.iv23.i
  %118 = getelementptr [8192 x i8], ptr %14, i64 %indvars.iv23.i
  %119 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.019.us.i, i64 0
  br label %vector.body63

vector.body63:                                    ; preds = %vector.body63, %.preheader.us.i
  %index64 = phi i64 [ 0, %.preheader.us.i ], [ %index.next67, %vector.body63 ]
  %vec.phi = phi <4 x i32> [ %119, %.preheader.us.i ], [ %151, %vector.body63 ]
  %120 = getelementptr [4 x i8], ptr %117, i64 %index64
  %wide.load65 = load <4 x float>, ptr %120, align 4
  %121 = fpext <4 x float> %wide.load65 to <4 x double>
  %122 = getelementptr [4 x i8], ptr %118, i64 %index64
  %wide.load66 = load <4 x float>, ptr %122, align 4
  %123 = fpext <4 x float> %wide.load66 to <4 x double>
  %124 = fcmp olt <4 x double> %121, splat (double f0xB690000000000000)
  %125 = fneg <4 x float> %wide.load65
  %126 = select <4 x i1> %124, <4 x float> %125, <4 x float> %wide.load65
  %127 = fpext <4 x float> %126 to <4 x double>
  %128 = fcmp uge <4 x double> %127, splat (double 1.000000e-02)
  %129 = fcmp olt <4 x double> %123, splat (double f0xB690000000000000)
  %130 = fneg <4 x float> %wide.load66
  %131 = select <4 x i1> %129, <4 x float> %130, <4 x float> %wide.load66
  %132 = fpext <4 x float> %131 to <4 x double>
  %133 = fcmp uge <4 x double> %132, splat (double 1.000000e-02)
  %134 = fsub <4 x double> %121, %123
  %135 = fptrunc <4 x double> %134 to <4 x float>
  %136 = fcmp olt <4 x double> %134, splat (double f0xB690000000000000)
  %137 = fneg <4 x float> %135
  %138 = select <4 x i1> %136, <4 x float> %137, <4 x float> %135
  %139 = fadd <4 x double> %121, splat (double f0x3E45798EE0000000)
  %140 = fptrunc <4 x double> %139 to <4 x float>
  %141 = fcmp olt <4 x double> %139, splat (double f0xB690000000000000)
  %142 = fneg <4 x float> %140
  %143 = select <4 x i1> %141, <4 x float> %142, <4 x float> %140
  %144 = fdiv <4 x float> %138, %143
  %145 = fcmp olt <4 x float> %144, zeroinitializer
  %146 = fneg <4 x float> %144
  %147 = select <4 x i1> %145, <4 x float> %146, <4 x float> %144
  %148 = fmul <4 x float> %147, splat (float 1.000000e+02)
  %149 = fpext <4 x float> %148 to <4 x double>
  %150 = fcmp ogt <4 x double> %149, splat (double 5.000000e-02)
  %.not70 = select <4 x i1> %128, <4 x i1> splat (i1 true), <4 x i1> %133
  %narrow = select <4 x i1> %.not70, <4 x i1> %150, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %151 = add <4 x i32> %vec.phi, %predphi
  %index.next67 = add nuw i64 %index64, 4
  %152 = icmp eq i64 %index.next67, 2048
  br i1 %152, label %._crit_edge.us.i, label %vector.body63, !llvm.loop !34

._crit_edge.us.i:                                 ; preds = %vector.body63
  %153 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %151)
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1
  %exitcond27.not.i = icmp eq i64 %indvars.iv.next24.i, 2048
  br i1 %exitcond27.not.i, label %_Z14compareResultsiPA2048_fS0_.exit, label %.preheader.us.i

_Z14compareResultsiPA2048_fS0_.exit:              ; preds = %._crit_edge.us.i
  %154 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %153) #5
  call void @free(ptr noundef nonnull %9) #13
  call void @free(ptr noundef nonnull %14) #13
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

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.ceil.f32(float) #11

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #10

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #12

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #12

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #11

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
attributes #11 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #13 = { nounwind "uniform-work-group-size" }
attributes #14 = { cold }
attributes #15 = { cold noreturn nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.isvectorized", i32 1}
!3 = !{!"llvm.loop.unroll.runtime.disable"}
!4 = distinct !{!4, !3, !2}
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = !{!6, !11}
!11 = distinct !{!11, !7}
!12 = !{!11}
!13 = distinct !{!13, !2, !3}
!14 = distinct !{!14, !2}
!15 = distinct !{!15, !2, !3}
!16 = distinct !{!16, !3, !2}
!17 = distinct !{!17, !2, !3}
!18 = distinct !{!18, !3, !2}
!19 = !{ptr @_Z25__device_stub__lu_kernel1iPfi}
!20 = !{ptr @_Z25__device_stub__lu_kernel2iPfi}
!21 = distinct !{!21, !2, !3}
!22 = distinct !{!22, !2, !3}
!23 = distinct !{!23, !3, !2}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28}
!28 = distinct !{!28, !26}
!29 = !{!25, !30}
!30 = distinct !{!30, !26}
!31 = !{!30}
!32 = distinct !{!32, !2, !3}
!33 = distinct !{!33, !2}
!34 = distinct !{!34, !2, !3}
