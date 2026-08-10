; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/SYR2K/syr2k.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/SYR2K/syr2k.cu"
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
define dso_local void @_Z11init_arraysiiPfS_PA1024_fS1_S1_(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %2, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %3, ptr nofree noundef writeonly captures(none) %4, ptr nofree noundef writeonly captures(none) %5, ptr nofree noundef writeonly captures(none) %6) local_unnamed_addr #1 {
  %8 = ptrtoaddr ptr %4 to i64
  %9 = ptrtoaddr ptr %5 to i64
  store float 3.241200e+04, ptr %2, align 4
  store float 2.123000e+03, ptr %3, align 4
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader36.lr.ph, label %._crit_edge42.split

.preheader36.lr.ph:                               ; preds = %7
  %11 = icmp sgt i32 %1, 0
  %12 = uitofp nneg i32 %0 to float
  br i1 %11, label %.preheader36.preheader, label %.preheader.lr.ph

.preheader36.preheader:                           ; preds = %.preheader36.lr.ph
  %wide.trip.count47 = zext nneg i32 %0 to i64
  %wide.trip.count = zext nneg i32 %1 to i64
  %min.iters.check = icmp ult i32 %1, 4
  %13 = sub i64 %8, %9
  %diff.check = icmp ugt i64 %13, -16
  %or.cond = or i1 %min.iters.check, %diff.check
  %n.vec = and i64 %wide.trip.count, 2147483644
  %broadcast.splatinsert61 = insertelement <4 x float> poison, float %12, i64 0
  %broadcast.splat62 = shufflevector <4 x float> %broadcast.splatinsert61, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %14 = add nsw i64 %wide.trip.count, -1
  br label %.preheader36

.preheader36:                                     ; preds = %.preheader36.preheader, %._crit_edge
  %indvars.iv44 = phi i64 [ 0, %.preheader36.preheader ], [ %indvars.iv.next45, %._crit_edge ]
  %15 = trunc nuw nsw i64 %indvars.iv44 to i32
  %16 = uitofp nneg i32 %15 to float
  %17 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv44
  %18 = getelementptr [4096 x i8], ptr %5, i64 %indvars.iv44
  br i1 %or.cond, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader36
  %broadcast.splatinsert = insertelement <4 x float> poison, float %16, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %19 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %20 = fmul nnan <4 x float> %broadcast.splat, %19
  %21 = fdiv <4 x float> %20, %broadcast.splat62
  %22 = getelementptr [4 x i8], ptr %17, i64 %index
  store <4 x float> %21, ptr %22, align 4
  %23 = getelementptr [4 x i8], ptr %18, i64 %index
  store <4 x float> %21, ptr %23, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader36, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader36 ], [ %n.vec, %middle.block ]
  br i1 %lcmp.mod.not, label %scalar.ph.prol.loopexit, label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.preheader
  %25 = trunc nuw nsw i64 %indvars.iv.ph to i32
  %26 = uitofp nneg i32 %25 to float
  %27 = fmul nnan float %16, %26
  %28 = fdiv float %27, %12
  %29 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv.ph
  store float %28, ptr %29, align 4
  %30 = getelementptr [4 x i8], ptr %18, i64 %indvars.iv.ph
  store float %28, ptr %30, align 4
  %indvars.iv.next.prol = or disjoint i64 %indvars.iv.ph, 1
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol, %scalar.ph.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph.preheader ], [ %indvars.iv.next.prol, %scalar.ph.prol ]
  %31 = icmp eq i64 %indvars.iv.ph, %14
  br i1 %31, label %._crit_edge, label %scalar.ph

.preheader.lr.ph:                                 ; preds = %._crit_edge, %.preheader36.lr.ph
  %32 = uitofp nneg i32 %0 to float
  %wide.trip.count57 = zext nneg i32 %0 to i64
  %min.iters.check64 = icmp ult i32 %0, 4
  %n.vec67 = and i64 %wide.trip.count57, 2147483644
  %broadcast.splatinsert70 = insertelement <4 x float> poison, float %32, i64 0
  %broadcast.splat71 = shufflevector <4 x float> %broadcast.splatinsert70, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n78 = icmp eq i64 %n.vec67, %wide.trip.count57
  br label %.preheader

scalar.ph:                                        ; preds = %scalar.ph.prol.loopexit, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %scalar.ph ], [ %indvars.iv.unr, %scalar.ph.prol.loopexit ]
  %33 = trunc nuw nsw i64 %indvars.iv to i32
  %34 = uitofp nneg i32 %33 to float
  %35 = fmul nnan float %16, %34
  %36 = fdiv float %35, %12
  %37 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv
  store float %36, ptr %37, align 4
  %38 = getelementptr [4 x i8], ptr %18, i64 %indvars.iv
  store float %36, ptr %38, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = trunc nuw nsw i64 %indvars.iv.next to i32
  %40 = uitofp nneg i32 %39 to float
  %41 = fmul nnan float %16, %40
  %42 = fdiv float %41, %12
  %43 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv.next
  store float %42, ptr %43, align 4
  %44 = getelementptr [4 x i8], ptr %18, i64 %indvars.iv.next
  store float %42, ptr %44, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.not.1, label %._crit_edge, label %scalar.ph, !llvm.loop !4

._crit_edge:                                      ; preds = %scalar.ph.prol.loopexit, %scalar.ph, %middle.block
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond48.not = icmp eq i64 %indvars.iv.next45, %wide.trip.count47
  br i1 %exitcond48.not, label %.preheader.lr.ph, label %.preheader36

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge40
  %indvars.iv54 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next55, %._crit_edge40 ]
  %45 = trunc nuw nsw i64 %indvars.iv54 to i32
  %46 = uitofp nneg i32 %45 to float
  %47 = getelementptr [4096 x i8], ptr %6, i64 %indvars.iv54
  br i1 %min.iters.check64, label %scalar.ph63.preheader, label %vector.ph65

vector.ph65:                                      ; preds = %.preheader
  %broadcast.splatinsert68 = insertelement <4 x float> poison, float %46, i64 0
  %broadcast.splat69 = shufflevector <4 x float> %broadcast.splatinsert68, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body72

vector.body72:                                    ; preds = %vector.body72, %vector.ph65
  %index73 = phi i64 [ 0, %vector.ph65 ], [ %index.next75, %vector.body72 ]
  %vec.ind74 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph65 ], [ %vec.ind.next76, %vector.body72 ]
  %48 = uitofp nneg <4 x i32> %vec.ind74 to <4 x float>
  %49 = fmul nnan <4 x float> %broadcast.splat69, %48
  %50 = fdiv <4 x float> %49, %broadcast.splat71
  %51 = getelementptr [4 x i8], ptr %47, i64 %index73
  store <4 x float> %50, ptr %51, align 4
  %index.next75 = add nuw i64 %index73, 4
  %vec.ind.next76 = add <4 x i32> %vec.ind74, splat (i32 4)
  %52 = icmp eq i64 %index.next75, %n.vec67
  br i1 %52, label %middle.block77, label %vector.body72, !llvm.loop !5

middle.block77:                                   ; preds = %vector.body72
  br i1 %cmp.n78, label %._crit_edge40, label %scalar.ph63.preheader

scalar.ph63.preheader:                            ; preds = %.preheader, %middle.block77
  %indvars.iv49.ph = phi i64 [ 0, %.preheader ], [ %n.vec67, %middle.block77 ]
  br label %scalar.ph63

scalar.ph63:                                      ; preds = %scalar.ph63.preheader, %scalar.ph63
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %scalar.ph63 ], [ %indvars.iv49.ph, %scalar.ph63.preheader ]
  %53 = trunc nuw nsw i64 %indvars.iv49 to i32
  %54 = uitofp nneg i32 %53 to float
  %55 = fmul nnan float %46, %54
  %56 = fdiv float %55, %32
  %57 = getelementptr [4 x i8], ptr %47, i64 %indvars.iv49
  store float %56, ptr %57, align 4
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond53.not = icmp eq i64 %indvars.iv.next50, %wide.trip.count57
  br i1 %exitcond53.not, label %._crit_edge40, label %scalar.ph63, !llvm.loop !6

._crit_edge40:                                    ; preds = %scalar.ph63, %middle.block77
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond58.not = icmp eq i64 %indvars.iv.next55, %wide.trip.count57
  br i1 %exitcond58.not, label %._crit_edge42.split, label %.preheader

._crit_edge42.split:                              ; preds = %._crit_edge40, %7
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z8syr2kCpuiiffPA1024_fS0_S0_(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef captures(none) %6) local_unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader45.preheader, label %._crit_edge53.split

.preheader45.preheader:                           ; preds = %7
  %wide.trip.count59 = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 8
  %n.vec = and i64 %wide.trip.count59, 2147483640
  %broadcast.splatinsert = insertelement <4 x float> poison, float %3, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count59
  br label %.preheader45

.preheader45:                                     ; preds = %.preheader45.preheader, %._crit_edge
  %indvars.iv56 = phi i64 [ 0, %.preheader45.preheader ], [ %indvars.iv.next57, %._crit_edge ]
  %9 = getelementptr [4096 x i8], ptr %6, i64 %indvars.iv56
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.body

vector.body:                                      ; preds = %.preheader45, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader45 ]
  %10 = getelementptr [4 x i8], ptr %9, i64 %index
  %11 = getelementptr i8, ptr %10, i64 16
  %wide.load = load <4 x float>, ptr %10, align 4
  %wide.load78 = load <4 x float>, ptr %11, align 4
  %12 = fmul <4 x float> %broadcast.splat, %wide.load
  %13 = fmul <4 x float> %broadcast.splat, %wide.load78
  store <4 x float> %12, ptr %10, align 4
  store <4 x float> %13, ptr %11, align 4
  %index.next = add nuw i64 %index, 8
  %14 = icmp eq i64 %index.next, %n.vec
  br i1 %14, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader45, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader45 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

.preheader44:                                     ; preds = %._crit_edge
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %.preheader43.preheader, label %._crit_edge53.split

.preheader43.preheader:                           ; preds = %.preheader44
  %wide.trip.count74 = zext nneg i32 %0 to i64
  %wide.trip.count64 = zext nneg i32 %1 to i64
  br label %.preheader43

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %16 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv
  %17 = load float, ptr %16, align 4
  %18 = fmul float %3, %17
  store float %18, ptr %16, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count59
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !8

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond60.not = icmp eq i64 %indvars.iv.next57, %wide.trip.count59
  br i1 %exitcond60.not, label %.preheader44, label %.preheader45

.preheader43:                                     ; preds = %.preheader43.preheader, %._crit_edge51
  %indvars.iv71 = phi i64 [ 0, %.preheader43.preheader ], [ %indvars.iv.next72, %._crit_edge51 ]
  %19 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv71
  %20 = getelementptr [4096 x i8], ptr %6, i64 %indvars.iv71
  %21 = getelementptr [4096 x i8], ptr %5, i64 %indvars.iv71
  br label %.preheader

.preheader:                                       ; preds = %.preheader43, %._crit_edge49
  %indvars.iv66 = phi i64 [ 0, %.preheader43 ], [ %indvars.iv.next67, %._crit_edge49 ]
  %22 = getelementptr [4096 x i8], ptr %5, i64 %indvars.iv66
  %23 = getelementptr [4 x i8], ptr %20, i64 %indvars.iv66
  %24 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv66
  %.promoted = load float, ptr %23, align 4
  br label %25

25:                                               ; preds = %.preheader, %25
  %indvars.iv61 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next62, %25 ]
  %26 = phi float [ %.promoted, %.preheader ], [ %40, %25 ]
  %27 = getelementptr [4 x i8], ptr %19, i64 %indvars.iv61
  %28 = load float, ptr %27, align 4
  %29 = fmul float %2, %28
  %30 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv61
  %31 = load float, ptr %30, align 4
  %32 = fmul float %29, %31
  %33 = fadd float %26, %32
  store float %33, ptr %23, align 4
  %34 = getelementptr [4 x i8], ptr %21, i64 %indvars.iv61
  %35 = load float, ptr %34, align 4
  %36 = fmul float %2, %35
  %37 = getelementptr [4 x i8], ptr %24, i64 %indvars.iv61
  %38 = load float, ptr %37, align 4
  %39 = fmul float %36, %38
  %40 = fadd float %33, %39
  store float %40, ptr %23, align 4
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond65.not = icmp eq i64 %indvars.iv.next62, %wide.trip.count64
  br i1 %exitcond65.not, label %._crit_edge49, label %25

._crit_edge49:                                    ; preds = %25
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond70.not = icmp eq i64 %indvars.iv.next67, %wide.trip.count74
  br i1 %exitcond70.not, label %._crit_edge51, label %.preheader

._crit_edge51:                                    ; preds = %._crit_edge49
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond75.not = icmp eq i64 %indvars.iv.next72, %wide.trip.count74
  br i1 %exitcond75.not, label %._crit_edge53.split, label %.preheader43

._crit_edge53.split:                              ; preds = %._crit_edge51, %7, %.preheader44
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiPA1024_fS0_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2) local_unnamed_addr #4 {
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
  %5 = getelementptr [4096 x i8], ptr %1, i64 %indvars.iv23
  %6 = getelementptr [4096 x i8], ptr %2, i64 %indvars.iv23
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
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !9

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
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !10

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

define dso_local void @_Z27__device_stub__syr2k_kerneliiffPfS_S_(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) #6 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store float %2, ptr %10, align 4
  store float %3, ptr %11, align 4
  store ptr %4, ptr %12, align 8
  store ptr %5, ptr %13, align 8
  store ptr %6, ptr %14, align 8
  %15 = alloca [7 x ptr], align 16
  store ptr %8, ptr %15, align 16
  %16 = getelementptr inbounds nuw i8, ptr %15, i64 8
  store ptr %9, ptr %16, align 8
  %17 = getelementptr inbounds nuw i8, ptr %15, i64 16
  store ptr %10, ptr %17, align 16
  %18 = getelementptr inbounds nuw i8, ptr %15, i64 24
  store ptr %11, ptr %18, align 8
  %19 = getelementptr inbounds nuw i8, ptr %15, i64 32
  store ptr %12, ptr %19, align 16
  %20 = getelementptr inbounds nuw i8, ptr %15, i64 40
  store ptr %13, ptr %20, align 8
  %21 = getelementptr inbounds nuw i8, ptr %15, i64 48
  store ptr %14, ptr %21, align 16
  %22 = alloca %struct.dim3, align 8
  %23 = alloca %struct.dim3, align 8
  %24 = alloca i64, align 8
  %25 = alloca ptr, align 8
  %26 = call i32 @__cudaPopCallConfiguration(ptr nonnull %22, ptr nonnull %23, ptr nonnull %24, ptr nonnull %25)
  %27 = load i64, ptr %24, align 8
  %28 = load ptr, ptr %25, align 8
  %.fca.0.load2 = load i32, ptr %22, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %22, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %22, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %23, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %23, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %23, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %29 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__syr2k_kerneliiffPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %15, i64 noundef %27, ptr noundef %28)
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

define dso_local void @_Z9syr2kCudaiiffPA1024_fS0_S0_S0_(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) local_unnamed_addr #6 {
  %9 = alloca %struct.timeval, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca [7 x ptr], align 16
  %18 = alloca %struct.dim3, align 8
  %19 = alloca %struct.dim3, align 8
  %20 = alloca i64, align 8
  %21 = alloca ptr, align 8
  %22 = alloca %struct.timeval, align 8
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = call i32 @cudaMalloc(ptr noundef nonnull %23, i64 noundef 4194304) #5
  %27 = call i32 @cudaMalloc(ptr noundef nonnull %24, i64 noundef 4194304) #5
  %28 = call i32 @cudaMalloc(ptr noundef nonnull %25, i64 noundef 4194304) #5
  %29 = load ptr, ptr %23, align 8
  %30 = call i32 @cudaMemcpy(ptr noundef %29, ptr noundef %4, i64 noundef 4194304, i32 noundef 1) #5
  %31 = load ptr, ptr %24, align 8
  %32 = call i32 @cudaMemcpy(ptr noundef %31, ptr noundef %5, i64 noundef 4194304, i32 noundef 1) #5
  %33 = load ptr, ptr %25, align 8
  %34 = call i32 @cudaMemcpy(ptr noundef %33, ptr noundef %6, i64 noundef 4194304, i32 noundef 1) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %22)
  %35 = call i32 @gettimeofday(ptr noundef nonnull %22, ptr noundef null) #13
  %.not.i.i = icmp eq i32 %35, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %36

36:                                               ; preds = %8
  %37 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %35) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %8, %36
  %38 = load i64, ptr %22, align 8
  %39 = sitofp i64 %38 to double
  %40 = getelementptr inbounds nuw i8, ptr %22, i64 8
  %41 = load i64, ptr %40, align 8
  %42 = sitofp i64 %41 to double
  %43 = fmul nnan double %42, f0x3EB0C6F7A0B5ED8D
  %44 = fadd double %43, %39
  call void @llvm.lifetime.end.p0(ptr nonnull %22)
  store double %44, ptr @polybench_t_start, align 8
  %45 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 32, i32 128, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %45, 0
  br i1 %.not, label %46, label %60

46:                                               ; preds = %_Z21polybench_timer_startv.exit
  %47 = load ptr, ptr %23, align 8
  %48 = load ptr, ptr %24, align 8
  %49 = load ptr, ptr %25, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
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
  store i32 %0, ptr %10, align 4
  store i32 %1, ptr %11, align 4
  store float %2, ptr %12, align 4
  store float %3, ptr %13, align 4
  store ptr %47, ptr %14, align 8
  store ptr %48, ptr %15, align 8
  store ptr %49, ptr %16, align 8
  store ptr %10, ptr %17, align 16
  %50 = getelementptr inbounds nuw i8, ptr %17, i64 8
  store ptr %11, ptr %50, align 8
  %51 = getelementptr inbounds nuw i8, ptr %17, i64 16
  store ptr %12, ptr %51, align 16
  %52 = getelementptr inbounds nuw i8, ptr %17, i64 24
  store ptr %13, ptr %52, align 8
  %53 = getelementptr inbounds nuw i8, ptr %17, i64 32
  store ptr %14, ptr %53, align 16
  %54 = getelementptr inbounds nuw i8, ptr %17, i64 40
  store ptr %15, ptr %54, align 8
  %55 = getelementptr inbounds nuw i8, ptr %17, i64 48
  store ptr %16, ptr %55, align 16
  %56 = call i32 @__cudaPopCallConfiguration(ptr nonnull %18, ptr nonnull %19, ptr nonnull %20, ptr nonnull %21), !inline_history !11
  %57 = load i64, ptr %20, align 8
  %58 = load ptr, ptr %21, align 8
  %.fca.0.load2.i = load i32, ptr %18, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %18, i64 4
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %18, i64 8
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %19, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %19, i64 4
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %19, i64 8
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %59 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__syr2k_kerneliiffPfS_S_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %17, i64 noundef %57, ptr noundef %58), !inline_history !11
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
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
  br label %60

60:                                               ; preds = %_Z21polybench_timer_startv.exit, %46
  %61 = call i32 @cudaThreadSynchronize() #5
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  %62 = call i32 @gettimeofday(ptr noundef nonnull %9, ptr noundef null) #13
  %.not.i.i13 = icmp eq i32 %62, 0
  br i1 %.not.i.i13, label %_Z20polybench_timer_stopv.exit, label %63

63:                                               ; preds = %60
  %64 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %62) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %60, %63
  %65 = load i64, ptr %9, align 8
  %66 = sitofp i64 %65 to double
  %67 = getelementptr inbounds nuw i8, ptr %9, i64 8
  %68 = load i64, ptr %67, align 8
  %69 = sitofp i64 %68 to double
  %70 = fmul nnan double %69, f0x3EB0C6F7A0B5ED8D
  %71 = fadd double %70, %66
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  store double %71, ptr @polybench_t_end, align 8
  %72 = load double, ptr @polybench_t_start, align 8
  %73 = fsub double %71, %72
  %74 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %73) #5
  %75 = load ptr, ptr %25, align 8
  %76 = call i32 @cudaMemcpy(ptr noundef %7, ptr noundef %75, i64 noundef 4194304, i32 noundef 2) #5
  %77 = load ptr, ptr %23, align 8
  %78 = call i32 @cudaFree(ptr noundef %77) #5
  %79 = load ptr, ptr %24, align 8
  %80 = call i32 @cudaFree(ptr noundef %79) #5
  %81 = load ptr, ptr %25, align 8
  %82 = call i32 @cudaFree(ptr noundef %81) #5
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
  %8 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 4194304) #13
  %9 = load ptr, ptr %7, align 8
  %10 = ptrtoaddr ptr %9 to i64
  %.not.i.i = icmp eq ptr %9, null
  %11 = icmp ne i32 %8, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %11
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %0
  %12 = load ptr, ptr @stderr, align 8
  %13 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %12) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %0
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %14 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 4194304) #13
  %15 = load ptr, ptr %6, align 8
  %16 = ptrtoaddr ptr %15 to i64
  %.not.i.i23 = icmp eq ptr %15, null
  %17 = icmp ne i32 %14, 0
  %or.cond.i.i24 = select i1 %.not.i.i23, i1 true, i1 %17
  br i1 %or.cond.i.i24, label %.critedge.i.i25, label %_Z20polybench_alloc_datayi.exit26

.critedge.i.i25:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %18 = load ptr, ptr @stderr, align 8
  %19 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %18) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit26:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  store ptr null, ptr %5, align 8
  %20 = call i32 @posix_memalign(ptr noundef nonnull %5, i64 noundef 32, i64 noundef 4194304) #13
  %21 = load ptr, ptr %5, align 8
  %.not.i.i27 = icmp eq ptr %21, null
  %22 = icmp ne i32 %20, 0
  %or.cond.i.i28 = select i1 %.not.i.i27, i1 true, i1 %22
  br i1 %or.cond.i.i28, label %.critedge.i.i29, label %_Z20polybench_alloc_datayi.exit30

.critedge.i.i29:                                  ; preds = %_Z20polybench_alloc_datayi.exit26
  %23 = load ptr, ptr @stderr, align 8
  %24 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %23) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit30:                ; preds = %_Z20polybench_alloc_datayi.exit26
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store ptr null, ptr %4, align 8
  %25 = call i32 @posix_memalign(ptr noundef nonnull %4, i64 noundef 32, i64 noundef 4194304) #13
  %26 = load ptr, ptr %4, align 8
  %.not.i.i31 = icmp eq ptr %26, null
  %27 = icmp ne i32 %25, 0
  %or.cond.i.i32 = select i1 %.not.i.i31, i1 true, i1 %27
  br i1 %or.cond.i.i32, label %.critedge.i.i33, label %_Z20polybench_alloc_datayi.exit34

.critedge.i.i33:                                  ; preds = %_Z20polybench_alloc_datayi.exit30
  %28 = load ptr, ptr @stderr, align 8
  %29 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %28) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit34:                ; preds = %_Z20polybench_alloc_datayi.exit30
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  %30 = sub i64 %10, %16
  %diff.check = icmp ugt i64 %30, -32
  br label %.preheader36.i

.preheader36.i:                                   ; preds = %._crit_edge.i, %_Z20polybench_alloc_datayi.exit34
  %indvars.iv44.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit34 ], [ %indvars.iv.next45.i, %._crit_edge.i ]
  %31 = trunc nuw nsw i64 %indvars.iv44.i to i32
  %32 = uitofp nneg i32 %31 to float
  %33 = getelementptr [4096 x i8], ptr %9, i64 %indvars.iv44.i
  %34 = getelementptr [4096 x i8], ptr %15, i64 %indvars.iv44.i
  br i1 %diff.check, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %.preheader36.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %32, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %35 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %36 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %37 = fmul nnan <4 x float> %broadcast.splat, %35
  %38 = fmul nnan <4 x float> %broadcast.splat, %36
  %39 = fmul nnan <4 x float> %37, splat (float f0x3A800000)
  %40 = fmul nnan <4 x float> %38, splat (float f0x3A800000)
  %41 = getelementptr [4 x i8], ptr %33, i64 %index
  %42 = getelementptr i8, ptr %41, i64 16
  store <4 x float> %39, ptr %41, align 4
  store <4 x float> %40, ptr %42, align 4
  %43 = getelementptr [4 x i8], ptr %34, i64 %index
  %44 = getelementptr i8, ptr %43, i64 16
  store <4 x float> %39, ptr %43, align 4
  store <4 x float> %40, ptr %44, align 4
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %45 = icmp eq i64 %index.next, 1024
  br i1 %45, label %._crit_edge.i, label %vector.body, !llvm.loop !12

scalar.ph:                                        ; preds = %.preheader36.i, %scalar.ph
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i.1, %scalar.ph ], [ 0, %.preheader36.i ]
  %46 = trunc nuw nsw i64 %indvars.iv.i to i32
  %47 = uitofp nneg i32 %46 to float
  %48 = fmul nnan float %32, %47
  %49 = fmul nnan float %48, f0x3A800000
  %50 = getelementptr [4 x i8], ptr %33, i64 %indvars.iv.i
  store float %49, ptr %50, align 4
  %51 = getelementptr [4 x i8], ptr %34, i64 %indvars.iv.i
  store float %49, ptr %51, align 4
  %indvars.iv.next.i = or disjoint i64 %indvars.iv.i, 1
  %52 = trunc nuw nsw i64 %indvars.iv.next.i to i32
  %53 = uitofp nneg i32 %52 to float
  %54 = fmul nnan float %32, %53
  %55 = fmul nnan float %54, f0x3A800000
  %56 = getelementptr [4 x i8], ptr %33, i64 %indvars.iv.next.i
  store float %55, ptr %56, align 4
  %57 = getelementptr [4 x i8], ptr %34, i64 %indvars.iv.next.i
  store float %55, ptr %57, align 4
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %exitcond.not.i.1 = icmp eq i64 %indvars.iv.next.i.1, 1024
  br i1 %exitcond.not.i.1, label %._crit_edge.i, label %scalar.ph, !llvm.loop !13

._crit_edge.i:                                    ; preds = %vector.body, %scalar.ph
  %indvars.iv.next45.i = add nuw nsw i64 %indvars.iv44.i, 1
  %exitcond48.not.i = icmp eq i64 %indvars.iv.next45.i, 1024
  br i1 %exitcond48.not.i, label %.preheader.i, label %.preheader36.i

.preheader.i:                                     ; preds = %._crit_edge.i, %._crit_edge40.i
  %indvars.iv54.i = phi i64 [ %indvars.iv.next55.i, %._crit_edge40.i ], [ 0, %._crit_edge.i ]
  %58 = getelementptr [4096 x i8], ptr %21, i64 %indvars.iv54.i
  %59 = trunc nuw nsw i64 %indvars.iv54.i to i32
  %60 = uitofp nneg i32 %59 to float
  %broadcast.splatinsert55 = insertelement <4 x float> poison, float %60, i64 0
  %broadcast.splat56 = shufflevector <4 x float> %broadcast.splatinsert55, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body57

vector.body57:                                    ; preds = %vector.body57, %.preheader.i
  %index58 = phi i64 [ 0, %.preheader.i ], [ %index.next61.1, %vector.body57 ]
  %vec.ind59 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader.i ], [ %vec.ind.next62.1, %vector.body57 ]
  %step.add60 = add <4 x i32> %vec.ind59, splat (i32 4)
  %61 = uitofp nneg <4 x i32> %vec.ind59 to <4 x float>
  %62 = uitofp nneg <4 x i32> %step.add60 to <4 x float>
  %63 = fmul nnan <4 x float> %broadcast.splat56, %61
  %64 = fmul nnan <4 x float> %broadcast.splat56, %62
  %65 = fmul nnan <4 x float> %63, splat (float f0x3A800000)
  %66 = fmul nnan <4 x float> %64, splat (float f0x3A800000)
  %67 = getelementptr [4 x i8], ptr %58, i64 %index58
  %68 = getelementptr i8, ptr %67, i64 16
  store <4 x float> %65, ptr %67, align 4
  store <4 x float> %66, ptr %68, align 4
  %vec.ind.next62 = add <4 x i32> %vec.ind59, splat (i32 8)
  %step.add60.1 = add <4 x i32> %vec.ind59, splat (i32 12)
  %69 = uitofp nneg <4 x i32> %vec.ind.next62 to <4 x float>
  %70 = uitofp nneg <4 x i32> %step.add60.1 to <4 x float>
  %71 = fmul nnan <4 x float> %broadcast.splat56, %69
  %72 = fmul nnan <4 x float> %broadcast.splat56, %70
  %73 = fmul nnan <4 x float> %71, splat (float f0x3A800000)
  %74 = fmul nnan <4 x float> %72, splat (float f0x3A800000)
  %75 = getelementptr [4 x i8], ptr %58, i64 %index58
  %76 = getelementptr i8, ptr %75, i64 32
  %77 = getelementptr i8, ptr %75, i64 48
  store <4 x float> %73, ptr %76, align 4
  store <4 x float> %74, ptr %77, align 4
  %index.next61.1 = add nuw nsw i64 %index58, 16
  %vec.ind.next62.1 = add <4 x i32> %vec.ind59, splat (i32 16)
  %78 = icmp eq i64 %index.next61.1, 1024
  br i1 %78, label %._crit_edge40.i, label %vector.body57, !llvm.loop !14

._crit_edge40.i:                                  ; preds = %vector.body57
  %indvars.iv.next55.i = add nuw nsw i64 %indvars.iv54.i, 1
  %exitcond58.not.i = icmp eq i64 %indvars.iv.next55.i, 1024
  br i1 %exitcond58.not.i, label %_Z11init_arraysiiPfS_PA1024_fS1_S1_.exit, label %.preheader.i

_Z11init_arraysiiPfS_PA1024_fS1_S1_.exit:         ; preds = %._crit_edge40.i
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %79 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %3, i32 noundef 0) #5
  %80 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %3) #5
  %81 = call i32 @cudaSetDevice(i32 noundef 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  call void @_Z9syr2kCudaiiffPA1024_fS0_S0_S0_(i32 noundef 1024, i32 noundef 1024, float noundef 3.241200e+04, float noundef 2.123000e+03, ptr noundef %9, ptr noundef %15, ptr noundef nonnull %21, ptr noundef %26) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %82 = call i32 @gettimeofday(ptr noundef nonnull %2, ptr noundef null) #13
  %.not.i.i35 = icmp eq i32 %82, 0
  br i1 %.not.i.i35, label %_Z21polybench_timer_startv.exit, label %83

83:                                               ; preds = %_Z11init_arraysiiPfS_PA1024_fS1_S1_.exit
  %84 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %82) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z11init_arraysiiPfS_PA1024_fS1_S1_.exit, %83
  %85 = load i64, ptr %2, align 8
  %86 = sitofp i64 %85 to double
  %87 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %88 = load i64, ptr %87, align 8
  %89 = sitofp i64 %88 to double
  %90 = fmul nnan double %89, f0x3EB0C6F7A0B5ED8D
  %91 = fadd double %90, %86
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  store double %91, ptr @polybench_t_start, align 8
  br label %.preheader45.i

.preheader45.i:                                   ; preds = %._crit_edge.i39, %_Z21polybench_timer_startv.exit
  %indvars.iv56.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next57.i, %._crit_edge.i39 ]
  %92 = getelementptr [4096 x i8], ptr %21, i64 %indvars.iv56.i
  br label %vector.body66

vector.body66:                                    ; preds = %vector.body66, %.preheader45.i
  %index67 = phi i64 [ 0, %.preheader45.i ], [ %index.next69.1, %vector.body66 ]
  %93 = getelementptr [4 x i8], ptr %92, i64 %index67
  %94 = getelementptr i8, ptr %93, i64 16
  %wide.load = load <4 x float>, ptr %93, align 4
  %wide.load68 = load <4 x float>, ptr %94, align 4
  %95 = fmul <4 x float> %wide.load, splat (float 2.123000e+03)
  %96 = fmul <4 x float> %wide.load68, splat (float 2.123000e+03)
  store <4 x float> %95, ptr %93, align 4
  store <4 x float> %96, ptr %94, align 4
  %97 = getelementptr [4 x i8], ptr %92, i64 %index67
  %98 = getelementptr i8, ptr %97, i64 32
  %99 = getelementptr i8, ptr %97, i64 48
  %wide.load.1 = load <4 x float>, ptr %98, align 4
  %wide.load68.1 = load <4 x float>, ptr %99, align 4
  %100 = fmul <4 x float> %wide.load.1, splat (float 2.123000e+03)
  %101 = fmul <4 x float> %wide.load68.1, splat (float 2.123000e+03)
  store <4 x float> %100, ptr %98, align 4
  store <4 x float> %101, ptr %99, align 4
  %index.next69.1 = add nuw nsw i64 %index67, 16
  %102 = icmp eq i64 %index.next69.1, 1024
  br i1 %102, label %._crit_edge.i39, label %vector.body66, !llvm.loop !15

._crit_edge.i39:                                  ; preds = %vector.body66
  %indvars.iv.next57.i = add nuw nsw i64 %indvars.iv56.i, 1
  %exitcond60.not.i = icmp eq i64 %indvars.iv.next57.i, 1024
  br i1 %exitcond60.not.i, label %.preheader43.i, label %.preheader45.i

.preheader43.i:                                   ; preds = %._crit_edge.i39, %._crit_edge51.i
  %indvars.iv71.i = phi i64 [ %indvars.iv.next72.i, %._crit_edge51.i ], [ 0, %._crit_edge.i39 ]
  %103 = getelementptr [4096 x i8], ptr %9, i64 %indvars.iv71.i
  %104 = getelementptr [4096 x i8], ptr %21, i64 %indvars.iv71.i
  %105 = getelementptr [4096 x i8], ptr %15, i64 %indvars.iv71.i
  br label %.preheader.i40

.preheader.i40:                                   ; preds = %._crit_edge49.i, %.preheader43.i
  %indvars.iv66.i = phi i64 [ 0, %.preheader43.i ], [ %indvars.iv.next67.i, %._crit_edge49.i ]
  %106 = getelementptr [4096 x i8], ptr %15, i64 %indvars.iv66.i
  %107 = getelementptr [4 x i8], ptr %104, i64 %indvars.iv66.i
  %108 = getelementptr [4096 x i8], ptr %9, i64 %indvars.iv66.i
  %.promoted.i = load float, ptr %107, align 4
  br label %109

109:                                              ; preds = %109, %.preheader.i40
  %indvars.iv61.i = phi i64 [ 0, %.preheader.i40 ], [ %indvars.iv.next62.i, %109 ]
  %110 = phi float [ %.promoted.i, %.preheader.i40 ], [ %124, %109 ]
  %111 = getelementptr [4 x i8], ptr %103, i64 %indvars.iv61.i
  %112 = load float, ptr %111, align 4
  %113 = fmul float %112, 3.241200e+04
  %114 = getelementptr [4 x i8], ptr %106, i64 %indvars.iv61.i
  %115 = load float, ptr %114, align 4
  %116 = fmul float %113, %115
  %117 = fadd float %110, %116
  store float %117, ptr %107, align 4
  %118 = getelementptr [4 x i8], ptr %105, i64 %indvars.iv61.i
  %119 = load float, ptr %118, align 4
  %120 = fmul float %119, 3.241200e+04
  %121 = getelementptr [4 x i8], ptr %108, i64 %indvars.iv61.i
  %122 = load float, ptr %121, align 4
  %123 = fmul float %120, %122
  %124 = fadd float %117, %123
  store float %124, ptr %107, align 4
  %indvars.iv.next62.i = add nuw nsw i64 %indvars.iv61.i, 1
  %exitcond65.not.i = icmp eq i64 %indvars.iv.next62.i, 1024
  br i1 %exitcond65.not.i, label %._crit_edge49.i, label %109

._crit_edge49.i:                                  ; preds = %109
  %indvars.iv.next67.i = add nuw nsw i64 %indvars.iv66.i, 1
  %exitcond70.not.i = icmp eq i64 %indvars.iv.next67.i, 1024
  br i1 %exitcond70.not.i, label %._crit_edge51.i, label %.preheader.i40

._crit_edge51.i:                                  ; preds = %._crit_edge49.i
  %indvars.iv.next72.i = add nuw nsw i64 %indvars.iv71.i, 1
  %exitcond75.not.i = icmp eq i64 %indvars.iv.next72.i, 1024
  br i1 %exitcond75.not.i, label %_Z8syr2kCpuiiffPA1024_fS0_S0_.exit, label %.preheader43.i

_Z8syr2kCpuiiffPA1024_fS0_S0_.exit:               ; preds = %._crit_edge51.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %125 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #13
  %.not.i.i41 = icmp eq i32 %125, 0
  br i1 %.not.i.i41, label %_Z20polybench_timer_stopv.exit, label %126

126:                                              ; preds = %_Z8syr2kCpuiiffPA1024_fS0_S0_.exit
  %127 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %125) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z8syr2kCpuiiffPA1024_fS0_S0_.exit, %126
  %128 = load i64, ptr %1, align 8
  %129 = sitofp i64 %128 to double
  %130 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %131 = load i64, ptr %130, align 8
  %132 = sitofp i64 %131 to double
  %133 = fmul nnan double %132, f0x3EB0C6F7A0B5ED8D
  %134 = fadd double %133, %129
  call void @llvm.lifetime.end.p0(ptr nonnull %1)
  store double %134, ptr @polybench_t_end, align 8
  %135 = load double, ptr @polybench_t_start, align 8
  %136 = fsub double %134, %135
  %137 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %136) #5
  br label %.preheader.us.i

.preheader.us.i:                                  ; preds = %._crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv23.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next24.i, %._crit_edge.us.i ]
  %.019.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %174, %._crit_edge.us.i ]
  %138 = getelementptr [4096 x i8], ptr %21, i64 %indvars.iv23.i
  %139 = getelementptr [4096 x i8], ptr %26, i64 %indvars.iv23.i
  %140 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.019.us.i, i64 0
  br label %vector.body73

vector.body73:                                    ; preds = %vector.body73, %.preheader.us.i
  %index74 = phi i64 [ 0, %.preheader.us.i ], [ %index.next77, %vector.body73 ]
  %vec.phi = phi <4 x i32> [ %140, %.preheader.us.i ], [ %172, %vector.body73 ]
  %141 = getelementptr [4 x i8], ptr %138, i64 %index74
  %wide.load75 = load <4 x float>, ptr %141, align 4
  %142 = fpext <4 x float> %wide.load75 to <4 x double>
  %143 = getelementptr [4 x i8], ptr %139, i64 %index74
  %wide.load76 = load <4 x float>, ptr %143, align 4
  %144 = fpext <4 x float> %wide.load76 to <4 x double>
  %145 = fcmp olt <4 x double> %142, splat (double f0xB690000000000000)
  %146 = fneg <4 x float> %wide.load75
  %147 = select <4 x i1> %145, <4 x float> %146, <4 x float> %wide.load75
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
  %index.next77 = add nuw i64 %index74, 4
  %173 = icmp eq i64 %index.next77, 1024
  br i1 %173, label %._crit_edge.us.i, label %vector.body73, !llvm.loop !16

._crit_edge.us.i:                                 ; preds = %vector.body73
  %174 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %172)
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1
  %exitcond27.not.i = icmp eq i64 %indvars.iv.next24.i, 1024
  br i1 %exitcond27.not.i, label %_Z14compareResultsiPA1024_fS0_.exit, label %.preheader.us.i

_Z14compareResultsiPA1024_fS0_.exit:              ; preds = %._crit_edge.us.i
  %175 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %174) #5
  call void @free(ptr noundef %9) #13
  call void @free(ptr noundef %15) #13
  call void @free(ptr noundef nonnull %21) #13
  call void @free(ptr noundef nonnull %26) #13
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
!7 = distinct !{!7, !2, !3}
!8 = distinct !{!8, !3, !2}
!9 = distinct !{!9, !2, !3}
!10 = distinct !{!10, !3, !2}
!11 = !{ptr @_Z27__device_stub__syr2k_kerneliiffPfS_S_}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !2}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
!16 = distinct !{!16, !2, !3}
