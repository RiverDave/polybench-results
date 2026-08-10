; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/3MM/3mm.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/3MM/3mm.cu"
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
define dso_local void @_Z10init_arrayiiiiiPA512_fS0_S0_S0_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr nofree noundef writeonly captures(none) %5, ptr nofree noundef writeonly captures(none) %6, ptr nofree noundef writeonly captures(none) %7, ptr nofree noundef writeonly captures(none) %8) local_unnamed_addr #1 {
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader59.lr.ph, label %.preheader58

.preheader59.lr.ph:                               ; preds = %9
  %11 = icmp sgt i32 %2, 0
  %12 = uitofp nneg i32 %0 to float
  br i1 %11, label %.preheader59.preheader, label %.preheader56

.preheader59.preheader:                           ; preds = %.preheader59.lr.ph
  %wide.trip.count76 = zext nneg i32 %0 to i64
  %wide.trip.count = zext nneg i32 %2 to i64
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %broadcast.splatinsert114 = insertelement <4 x float> poison, float %12, i64 0
  %broadcast.splat115 = shufflevector <4 x float> %broadcast.splatinsert114, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %.preheader59

.preheader59:                                     ; preds = %.preheader59.preheader, %._crit_edge
  %indvars.iv73 = phi i64 [ 0, %.preheader59.preheader ], [ %indvars.iv.next74, %._crit_edge ]
  %13 = trunc nuw nsw i64 %indvars.iv73 to i32
  %14 = uitofp nneg i32 %13 to float
  %15 = getelementptr [2048 x i8], ptr %5, i64 %indvars.iv73
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader59
  %broadcast.splatinsert = insertelement <4 x float> poison, float %14, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %16 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %17 = fmul nnan <4 x float> %broadcast.splat, %16
  %18 = fdiv <4 x float> %17, %broadcast.splat115
  %19 = getelementptr [4 x i8], ptr %15, i64 %index
  store <4 x float> %18, ptr %19, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %20 = icmp eq i64 %index.next, %n.vec
  br i1 %20, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader59, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader59 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

.preheader58:                                     ; preds = %._crit_edge, %9
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %.preheader57.lr.ph, label %.preheader56

.preheader57.lr.ph:                               ; preds = %.preheader58
  %22 = icmp sgt i32 %1, 0
  %23 = sitofp i32 %1 to float
  br i1 %22, label %.preheader57.preheader, label %.preheader54

.preheader57.preheader:                           ; preds = %.preheader57.lr.ph
  %wide.trip.count86 = zext nneg i32 %2 to i64
  %wide.trip.count81 = zext nneg i32 %1 to i64
  %min.iters.check117 = icmp ult i32 %1, 4
  %n.vec120 = and i64 %wide.trip.count81, 2147483644
  %broadcast.splatinsert123 = insertelement <4 x float> poison, float %23, i64 0
  %broadcast.splat124 = shufflevector <4 x float> %broadcast.splatinsert123, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n131 = icmp eq i64 %n.vec120, %wide.trip.count81
  br label %.preheader57

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %24 = trunc nuw nsw i64 %indvars.iv to i32
  %25 = uitofp nneg i32 %24 to float
  %26 = fmul nnan float %14, %25
  %27 = fdiv float %26, %12
  %28 = getelementptr [4 x i8], ptr %15, i64 %indvars.iv
  store float %27, ptr %28, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !4

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond77.not = icmp eq i64 %indvars.iv.next74, %wide.trip.count76
  br i1 %exitcond77.not, label %.preheader58, label %.preheader59

.preheader57:                                     ; preds = %.preheader57.preheader, %._crit_edge63
  %indvars.iv83 = phi i64 [ 0, %.preheader57.preheader ], [ %indvars.iv.next84, %._crit_edge63 ]
  %29 = trunc nuw nsw i64 %indvars.iv83 to i32
  %30 = uitofp nneg i32 %29 to float
  %31 = getelementptr [2048 x i8], ptr %6, i64 %indvars.iv83
  br i1 %min.iters.check117, label %scalar.ph116.preheader, label %vector.ph118

vector.ph118:                                     ; preds = %.preheader57
  %broadcast.splatinsert121 = insertelement <4 x float> poison, float %30, i64 0
  %broadcast.splat122 = shufflevector <4 x float> %broadcast.splatinsert121, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body125

vector.body125:                                   ; preds = %vector.body125, %vector.ph118
  %index126 = phi i64 [ 0, %vector.ph118 ], [ %index.next128, %vector.body125 ]
  %vec.ind127 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph118 ], [ %vec.ind.next129, %vector.body125 ]
  %32 = trunc <4 x i64> %vec.ind127 to <4 x i32>
  %33 = add <4 x i32> %32, splat (i32 1)
  %34 = uitofp nneg <4 x i32> %33 to <4 x float>
  %35 = fmul nnan <4 x float> %broadcast.splat122, %34
  %36 = fdiv <4 x float> %35, %broadcast.splat124
  %37 = getelementptr [4 x i8], ptr %31, i64 %index126
  store <4 x float> %36, ptr %37, align 4
  %index.next128 = add nuw i64 %index126, 4
  %vec.ind.next129 = add nuw nsw <4 x i64> %vec.ind127, splat (i64 4)
  %38 = icmp eq i64 %index.next128, %n.vec120
  br i1 %38, label %middle.block130, label %vector.body125, !llvm.loop !5

middle.block130:                                  ; preds = %vector.body125
  br i1 %cmp.n131, label %._crit_edge63, label %scalar.ph116.preheader

scalar.ph116.preheader:                           ; preds = %.preheader57, %middle.block130
  %indvars.iv78.ph = phi i64 [ 0, %.preheader57 ], [ %n.vec120, %middle.block130 ]
  br label %scalar.ph116

.preheader56:                                     ; preds = %._crit_edge63, %.preheader59.lr.ph, %.preheader58
  %39 = icmp sgt i32 %1, 0
  br i1 %39, label %.preheader55.lr.ph, label %.preheader54

.preheader55.lr.ph:                               ; preds = %.preheader56
  %40 = icmp sgt i32 %4, 0
  %41 = sitofp i32 %3 to float
  br i1 %40, label %.preheader55.preheader, label %._crit_edge71.split

.preheader55.preheader:                           ; preds = %.preheader55.lr.ph
  %wide.trip.count96 = zext nneg i32 %1 to i64
  %wide.trip.count91 = zext nneg i32 %4 to i64
  %min.iters.check134 = icmp ult i32 %4, 4
  %n.vec137 = and i64 %wide.trip.count91, 2147483644
  %broadcast.splatinsert140 = insertelement <4 x float> poison, float %41, i64 0
  %broadcast.splat141 = shufflevector <4 x float> %broadcast.splatinsert140, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n148 = icmp eq i64 %n.vec137, %wide.trip.count91
  br label %.preheader55

scalar.ph116:                                     ; preds = %scalar.ph116.preheader, %scalar.ph116
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %scalar.ph116 ], [ %indvars.iv78.ph, %scalar.ph116.preheader ]
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %42 = trunc nuw nsw i64 %indvars.iv.next79 to i32
  %43 = uitofp nneg i32 %42 to float
  %44 = fmul nnan float %30, %43
  %45 = fdiv float %44, %23
  %46 = getelementptr [4 x i8], ptr %31, i64 %indvars.iv78
  store float %45, ptr %46, align 4
  %exitcond82.not = icmp eq i64 %indvars.iv.next79, %wide.trip.count81
  br i1 %exitcond82.not, label %._crit_edge63, label %scalar.ph116, !llvm.loop !6

._crit_edge63:                                    ; preds = %scalar.ph116, %middle.block130
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond87.not = icmp eq i64 %indvars.iv.next84, %wide.trip.count86
  br i1 %exitcond87.not, label %.preheader56, label %.preheader57

.preheader55:                                     ; preds = %.preheader55.preheader, %._crit_edge66
  %indvars.iv93 = phi i64 [ 0, %.preheader55.preheader ], [ %indvars.iv.next94, %._crit_edge66 ]
  %47 = trunc nuw nsw i64 %indvars.iv93 to i32
  %48 = uitofp nneg i32 %47 to float
  %49 = getelementptr [2048 x i8], ptr %7, i64 %indvars.iv93
  br i1 %min.iters.check134, label %scalar.ph133.preheader, label %vector.ph135

vector.ph135:                                     ; preds = %.preheader55
  %broadcast.splatinsert138 = insertelement <4 x float> poison, float %48, i64 0
  %broadcast.splat139 = shufflevector <4 x float> %broadcast.splatinsert138, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body142

vector.body142:                                   ; preds = %vector.body142, %vector.ph135
  %index143 = phi i64 [ 0, %vector.ph135 ], [ %index.next145, %vector.body142 ]
  %vec.ind144 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph135 ], [ %vec.ind.next146, %vector.body142 ]
  %50 = add <4 x i32> %vec.ind144, splat (i32 3)
  %51 = uitofp nneg <4 x i32> %50 to <4 x float>
  %52 = fmul nnan <4 x float> %broadcast.splat139, %51
  %53 = fdiv <4 x float> %52, %broadcast.splat141
  %54 = getelementptr [4 x i8], ptr %49, i64 %index143
  store <4 x float> %53, ptr %54, align 4
  %index.next145 = add nuw i64 %index143, 4
  %vec.ind.next146 = add <4 x i32> %vec.ind144, splat (i32 4)
  %55 = icmp eq i64 %index.next145, %n.vec137
  br i1 %55, label %middle.block147, label %vector.body142, !llvm.loop !7

middle.block147:                                  ; preds = %vector.body142
  br i1 %cmp.n148, label %._crit_edge66, label %scalar.ph133.preheader

scalar.ph133.preheader:                           ; preds = %.preheader55, %middle.block147
  %indvars.iv88.ph = phi i64 [ 0, %.preheader55 ], [ %n.vec137, %middle.block147 ]
  br label %scalar.ph133

.preheader54:                                     ; preds = %._crit_edge66, %.preheader57.lr.ph, %.preheader56
  %56 = icmp sgt i32 %4, 0
  br i1 %56, label %.preheader.lr.ph, label %._crit_edge71.split

.preheader.lr.ph:                                 ; preds = %.preheader54
  %57 = icmp sgt i32 %3, 0
  %58 = sitofp i32 %2 to float
  br i1 %57, label %.preheader.preheader, label %._crit_edge71.split

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count106 = zext nneg i32 %4 to i64
  %wide.trip.count101 = zext nneg i32 %3 to i64
  %min.iters.check151 = icmp ult i32 %3, 4
  %n.vec154 = and i64 %wide.trip.count101, 2147483644
  %broadcast.splatinsert157 = insertelement <4 x float> poison, float %58, i64 0
  %broadcast.splat158 = shufflevector <4 x float> %broadcast.splatinsert157, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n165 = icmp eq i64 %n.vec154, %wide.trip.count101
  br label %.preheader

scalar.ph133:                                     ; preds = %scalar.ph133.preheader, %scalar.ph133
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %scalar.ph133 ], [ %indvars.iv88.ph, %scalar.ph133.preheader ]
  %59 = trunc i64 %indvars.iv88 to i32
  %60 = add i32 %59, 3
  %61 = uitofp nneg i32 %60 to float
  %62 = fmul nnan float %48, %61
  %63 = fdiv float %62, %41
  %64 = getelementptr [4 x i8], ptr %49, i64 %indvars.iv88
  store float %63, ptr %64, align 4
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond92.not = icmp eq i64 %indvars.iv.next89, %wide.trip.count91
  br i1 %exitcond92.not, label %._crit_edge66, label %scalar.ph133, !llvm.loop !8

._crit_edge66:                                    ; preds = %scalar.ph133, %middle.block147
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond97.not = icmp eq i64 %indvars.iv.next94, %wide.trip.count96
  br i1 %exitcond97.not, label %.preheader54, label %.preheader55

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge69
  %indvars.iv103 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next104, %._crit_edge69 ]
  %65 = trunc nuw nsw i64 %indvars.iv103 to i32
  %66 = uitofp nneg i32 %65 to float
  %67 = getelementptr [2048 x i8], ptr %8, i64 %indvars.iv103
  br i1 %min.iters.check151, label %scalar.ph150.preheader, label %vector.ph152

vector.ph152:                                     ; preds = %.preheader
  %broadcast.splatinsert155 = insertelement <4 x float> poison, float %66, i64 0
  %broadcast.splat156 = shufflevector <4 x float> %broadcast.splatinsert155, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body159

vector.body159:                                   ; preds = %vector.body159, %vector.ph152
  %index160 = phi i64 [ 0, %vector.ph152 ], [ %index.next162, %vector.body159 ]
  %vec.ind161 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph152 ], [ %vec.ind.next163, %vector.body159 ]
  %68 = add <4 x i32> %vec.ind161, splat (i32 2)
  %69 = uitofp nneg <4 x i32> %68 to <4 x float>
  %70 = fmul nnan <4 x float> %broadcast.splat156, %69
  %71 = fdiv <4 x float> %70, %broadcast.splat158
  %72 = getelementptr [4 x i8], ptr %67, i64 %index160
  store <4 x float> %71, ptr %72, align 4
  %index.next162 = add nuw i64 %index160, 4
  %vec.ind.next163 = add <4 x i32> %vec.ind161, splat (i32 4)
  %73 = icmp eq i64 %index.next162, %n.vec154
  br i1 %73, label %middle.block164, label %vector.body159, !llvm.loop !9

middle.block164:                                  ; preds = %vector.body159
  br i1 %cmp.n165, label %._crit_edge69, label %scalar.ph150.preheader

scalar.ph150.preheader:                           ; preds = %.preheader, %middle.block164
  %indvars.iv98.ph = phi i64 [ 0, %.preheader ], [ %n.vec154, %middle.block164 ]
  br label %scalar.ph150

scalar.ph150:                                     ; preds = %scalar.ph150.preheader, %scalar.ph150
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %scalar.ph150 ], [ %indvars.iv98.ph, %scalar.ph150.preheader ]
  %74 = trunc i64 %indvars.iv98 to i32
  %75 = add i32 %74, 2
  %76 = uitofp nneg i32 %75 to float
  %77 = fmul nnan float %66, %76
  %78 = fdiv float %77, %58
  %79 = getelementptr [4 x i8], ptr %67, i64 %indvars.iv98
  store float %78, ptr %79, align 4
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond102.not = icmp eq i64 %indvars.iv.next99, %wide.trip.count101
  br i1 %exitcond102.not, label %._crit_edge69, label %scalar.ph150, !llvm.loop !10

._crit_edge69:                                    ; preds = %scalar.ph150, %middle.block164
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond107.not = icmp eq i64 %indvars.iv.next104, %wide.trip.count106
  br i1 %exitcond107.not, label %._crit_edge71.split, label %.preheader

._crit_edge71.split:                              ; preds = %._crit_edge69, %.preheader55.lr.ph, %.preheader.lr.ph, %.preheader54
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiiPA512_fS0_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #3 {
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
  %7 = getelementptr [2048 x i8], ptr %2, i64 %indvars.iv23
  %8 = getelementptr [2048 x i8], ptr %3, i64 %indvars.iv23
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
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !11

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
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !12

._crit_edge.us:                                   ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %.2.us.lcssa = phi i32 [ %43, %middle.block ], [ %.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27.not = icmp eq i64 %indvars.iv.next24, %wide.trip.count26
  br i1 %exitcond27.not, label %._crit_edge19, label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge.us, %4
  %.0.lcssa = phi i32 [ 0, %4 ], [ %.2.us.lcssa, %._crit_edge.us ]
  %76 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %.0.lcssa) #4
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

define dso_local void @_Z26__device_stub__mm3_kernel1iiiiiPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) #5 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  store i32 %0, ptr %9, align 4
  store i32 %1, ptr %10, align 4
  store i32 %2, ptr %11, align 4
  store i32 %3, ptr %12, align 4
  store i32 %4, ptr %13, align 4
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
  %32 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm3_kernel1iiiiiPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %17, i64 noundef %30, ptr noundef %31)
  ret void
}

define dso_local void @_Z26__device_stub__mm3_kernel2iiiiiPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) #5 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  store i32 %0, ptr %9, align 4
  store i32 %1, ptr %10, align 4
  store i32 %2, ptr %11, align 4
  store i32 %3, ptr %12, align 4
  store i32 %4, ptr %13, align 4
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
  %32 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm3_kernel2iiiiiPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %17, i64 noundef %30, ptr noundef %31)
  ret void
}

define dso_local void @_Z26__device_stub__mm3_kernel3iiiiiPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) #5 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  store i32 %0, ptr %9, align 4
  store i32 %1, ptr %10, align 4
  store i32 %2, ptr %11, align 4
  store i32 %3, ptr %12, align 4
  store i32 %4, ptr %13, align 4
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
  %32 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm3_kernel3iiiiiPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %17, i64 noundef %30, ptr noundef %31)
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z7mm3_cpuiiiiiPA512_fS0_S0_S0_S0_S0_S0_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr nofree noundef captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef readonly captures(none) %7, ptr nofree noundef captures(none) %8, ptr nofree noundef readonly captures(none) %9, ptr nofree noundef readonly captures(none) %10, ptr nofree noundef writeonly captures(none) %11) local_unnamed_addr #6 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader73.lr.ph, label %.preheader72

.preheader73.lr.ph:                               ; preds = %12
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.preheader73.lr.ph.split, label %.preheader.lr.ph.thread

.preheader73.lr.ph.split:                         ; preds = %.preheader73.lr.ph
  %15 = icmp sgt i32 %2, 0
  br i1 %15, label %.preheader73.us.preheader, label %.preheader73.preheader

.preheader73.preheader:                           ; preds = %.preheader73.lr.ph.split
  %16 = zext nneg i32 %1 to i64
  %17 = shl nuw nsw i64 %16, 2
  %wide.trip.count = zext nneg i32 %0 to i64
  %xtraiter = and i64 %wide.trip.count, 7
  %18 = icmp ult i32 %0, 8
  br i1 %18, label %.preheader73.epil.preheader, label %.preheader73.preheader.new

.preheader73.preheader.new:                       ; preds = %.preheader73.preheader
  %unroll_iter = and i64 %wide.trip.count, 2147483640
  br label %.preheader73

.preheader73.us.preheader:                        ; preds = %.preheader73.lr.ph.split
  %wide.trip.count124 = zext nneg i32 %0 to i64
  %wide.trip.count119 = zext nneg i32 %1 to i64
  %wide.trip.count111 = zext nneg i32 %2 to i64
  %xtraiter194 = and i64 %wide.trip.count111, 1
  %19 = icmp eq i32 %2, 1
  %unroll_iter198 = and i64 %wide.trip.count111, 2147483646
  %lcmp.mod196.not = icmp eq i64 %xtraiter194, 0
  %lcmp.mod197 = trunc i32 %2 to i1
  br label %.preheader73.us

.preheader73.us:                                  ; preds = %.preheader73.us.preheader, %._crit_edge77.split.us.us
  %indvars.iv121 = phi i64 [ 0, %.preheader73.us.preheader ], [ %indvars.iv.next122, %._crit_edge77.split.us.us ]
  %20 = getelementptr [2048 x i8], ptr %5, i64 %indvars.iv121
  %21 = getelementptr [2048 x i8], ptr %6, i64 %indvars.iv121
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.preheader73.us
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %._crit_edge.us.us ], [ 0, %.preheader73.us ]
  %22 = getelementptr [4 x i8], ptr %20, i64 %indvars.iv116
  store float 0.000000e+00, ptr %22, align 4
  %invariant.gep.us.us = getelementptr [4 x i8], ptr %7, i64 %indvars.iv116
  br i1 %19, label %.epil.preheader, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %23 = phi float [ %33, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %niter199 = phi i64 [ %niter199.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %24 = getelementptr [4 x i8], ptr %21, i64 %indvars.iv
  %25 = load float, ptr %24, align 4
  %gep.us.us = getelementptr [2048 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv
  %26 = load float, ptr %gep.us.us, align 4
  %27 = fmul float %25, %26
  %28 = fadd float %23, %27
  store float %28, ptr %22, align 4
  %indvars.iv.next = or disjoint i64 %indvars.iv, 1
  %29 = getelementptr [4 x i8], ptr %21, i64 %indvars.iv.next
  %30 = load float, ptr %29, align 4
  %gep.us.us.1 = getelementptr [2048 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv.next
  %31 = load float, ptr %gep.us.us.1, align 4
  %32 = fmul float %30, %31
  %33 = fadd float %28, %32
  store float %33, ptr %22, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %niter199.next.1 = add i64 %niter199, 2
  %niter199.ncmp.1 = icmp eq i64 %niter199.next.1, %unroll_iter198
  br i1 %niter199.ncmp.1, label %._crit_edge.us.us.unr-lcssa, label %.lr.ph.us.us.new

._crit_edge.us.us.unr-lcssa:                      ; preds = %.lr.ph.us.us.new
  br i1 %lcmp.mod196.not, label %._crit_edge.us.us, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.us.us.unr-lcssa, %.lr.ph.us.us
  %indvars.iv.epil.init = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge.us.us.unr-lcssa ]
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.us.us ], [ %33, %._crit_edge.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod197)
  %34 = getelementptr [4 x i8], ptr %21, i64 %indvars.iv.epil.init
  %35 = load float, ptr %34, align 4
  %gep.us.us.epil = getelementptr [2048 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv.epil.init
  %36 = load float, ptr %gep.us.us.epil, align 4
  %37 = fmul float %35, %36
  %38 = fadd float %.epil.init, %37
  store float %38, ptr %22, align 4
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.unr-lcssa, %.epil.preheader
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond120.not = icmp eq i64 %indvars.iv.next117, %wide.trip.count119
  br i1 %exitcond120.not, label %._crit_edge77.split.us.us, label %.lr.ph.us.us

._crit_edge77.split.us.us:                        ; preds = %._crit_edge.us.us
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond125.not = icmp eq i64 %indvars.iv.next122, %wide.trip.count124
  br i1 %exitcond125.not, label %.preheader72, label %.preheader73.us

.preheader73:                                     ; preds = %.preheader73, %.preheader73.preheader.new
  %indvar = phi i64 [ 0, %.preheader73.preheader.new ], [ %indvar.next.7, %.preheader73 ]
  %niter = phi i64 [ 0, %.preheader73.preheader.new ], [ %niter.next.7, %.preheader73 ]
  %39 = shl nuw nsw i64 %indvar, 11
  %scevgep = getelementptr i8, ptr %5, i64 %39
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep, i8 0, i64 %17, i1 false)
  %indvar.next = shl i64 %indvar, 11
  %40 = getelementptr i8, ptr %5, i64 %indvar.next
  %scevgep.1 = getelementptr i8, ptr %40, i64 2048
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.1, i8 0, i64 %17, i1 false)
  %indvar.next.1 = shl i64 %indvar, 11
  %41 = getelementptr i8, ptr %5, i64 %indvar.next.1
  %scevgep.2 = getelementptr i8, ptr %41, i64 4096
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.2, i8 0, i64 %17, i1 false)
  %indvar.next.2 = shl i64 %indvar, 11
  %42 = getelementptr i8, ptr %5, i64 %indvar.next.2
  %scevgep.3 = getelementptr i8, ptr %42, i64 6144
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.3, i8 0, i64 %17, i1 false)
  %indvar.next.3 = shl i64 %indvar, 11
  %43 = getelementptr i8, ptr %5, i64 %indvar.next.3
  %scevgep.4 = getelementptr i8, ptr %43, i64 8192
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.4, i8 0, i64 %17, i1 false)
  %indvar.next.4 = shl i64 %indvar, 11
  %44 = getelementptr i8, ptr %5, i64 %indvar.next.4
  %scevgep.5 = getelementptr i8, ptr %44, i64 10240
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.5, i8 0, i64 %17, i1 false)
  %indvar.next.5 = shl i64 %indvar, 11
  %45 = getelementptr i8, ptr %5, i64 %indvar.next.5
  %scevgep.6 = getelementptr i8, ptr %45, i64 12288
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.6, i8 0, i64 %17, i1 false)
  %indvar.next.6 = shl i64 %indvar, 11
  %46 = getelementptr i8, ptr %5, i64 %indvar.next.6
  %scevgep.7 = getelementptr i8, ptr %46, i64 14336
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.7, i8 0, i64 %17, i1 false)
  %indvar.next.7 = add nuw nsw i64 %indvar, 8
  %niter.next.7 = add i64 %niter, 8
  %niter.ncmp.7 = icmp eq i64 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.preheader71.lr.ph.loopexit.unr-lcssa, label %.preheader73

.preheader72:                                     ; preds = %._crit_edge77.split.us.us, %12
  %47 = icmp sgt i32 %1, 0
  br i1 %47, label %.preheader71.lr.ph, label %.preheader70

.preheader71.lr.ph.loopexit.unr-lcssa:            ; preds = %.preheader73
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.preheader71.lr.ph, label %.preheader73.epil.preheader

.preheader73.epil.preheader:                      ; preds = %.preheader71.lr.ph.loopexit.unr-lcssa, %.preheader73.preheader
  %indvar.epil.init = phi i64 [ 0, %.preheader73.preheader ], [ %indvar.next.7, %.preheader71.lr.ph.loopexit.unr-lcssa ]
  %lcmp.mod193 = icmp ne i64 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod193)
  br label %.preheader73.epil

.preheader73.epil:                                ; preds = %.preheader73.epil, %.preheader73.epil.preheader
  %indvar.epil = phi i64 [ %indvar.epil.init, %.preheader73.epil.preheader ], [ %indvar.next.epil, %.preheader73.epil ]
  %epil.iter = phi i64 [ 0, %.preheader73.epil.preheader ], [ %epil.iter.next, %.preheader73.epil ]
  %48 = shl nuw nsw i64 %indvar.epil, 11
  %scevgep.epil = getelementptr i8, ptr %5, i64 %48
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.epil, i8 0, i64 %17, i1 false)
  %indvar.next.epil = add nuw nsw i64 %indvar.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.preheader71.lr.ph, label %.preheader73.epil, !llvm.loop !13

.preheader71.lr.ph:                               ; preds = %.preheader71.lr.ph.loopexit.unr-lcssa, %.preheader73.epil, %.preheader72
  %49 = icmp sgt i32 %3, 0
  br i1 %49, label %.preheader71.lr.ph.split, label %.preheader70

.preheader71.lr.ph.split:                         ; preds = %.preheader71.lr.ph
  %50 = icmp sgt i32 %4, 0
  br i1 %50, label %.preheader71.us.preheader, label %.preheader71.preheader

.preheader71.preheader:                           ; preds = %.preheader71.lr.ph.split
  %51 = zext nneg i32 %3 to i64
  %52 = shl nuw nsw i64 %51, 2
  %wide.trip.count133 = zext nneg i32 %1 to i64
  %xtraiter200 = and i64 %wide.trip.count133, 7
  %53 = add i32 %1, -1
  %54 = icmp ult i32 %53, 7
  br i1 %54, label %.preheader71.epil.preheader, label %.preheader71.preheader.new

.preheader71.preheader.new:                       ; preds = %.preheader71.preheader
  %unroll_iter204 = and i64 %wide.trip.count133, 2147483640
  br label %.preheader71

.preheader71.us.preheader:                        ; preds = %.preheader71.lr.ph.split
  %wide.trip.count151 = zext nneg i32 %1 to i64
  %wide.trip.count146 = zext nneg i32 %3 to i64
  %wide.trip.count138 = zext nneg i32 %4 to i64
  %xtraiter207 = and i64 %wide.trip.count138, 1
  %55 = icmp eq i32 %4, 1
  %unroll_iter213 = and i64 %wide.trip.count138, 2147483646
  %lcmp.mod211.not = icmp eq i64 %xtraiter207, 0
  %lcmp.mod212 = trunc i32 %4 to i1
  br label %.preheader71.us

.preheader71.us:                                  ; preds = %.preheader71.us.preheader, %._crit_edge84.split.us.us
  %indvars.iv148 = phi i64 [ 0, %.preheader71.us.preheader ], [ %indvars.iv.next149, %._crit_edge84.split.us.us ]
  %56 = getelementptr [2048 x i8], ptr %8, i64 %indvars.iv148
  %57 = getelementptr [2048 x i8], ptr %9, i64 %indvars.iv148
  br label %.lr.ph.us.us86

.lr.ph.us.us86:                                   ; preds = %._crit_edge.us.us90, %.preheader71.us
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %._crit_edge.us.us90 ], [ 0, %.preheader71.us ]
  %58 = getelementptr [4 x i8], ptr %56, i64 %indvars.iv143
  store float 0.000000e+00, ptr %58, align 4
  %invariant.gep.us.us87 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv143
  br i1 %55, label %.epil.preheader206, label %.lr.ph.us.us86.new

.lr.ph.us.us86.new:                               ; preds = %.lr.ph.us.us86, %.lr.ph.us.us86.new
  %indvars.iv135 = phi i64 [ %indvars.iv.next136.1, %.lr.ph.us.us86.new ], [ 0, %.lr.ph.us.us86 ]
  %59 = phi float [ %69, %.lr.ph.us.us86.new ], [ 0.000000e+00, %.lr.ph.us.us86 ]
  %niter214 = phi i64 [ %niter214.next.1, %.lr.ph.us.us86.new ], [ 0, %.lr.ph.us.us86 ]
  %60 = getelementptr [4 x i8], ptr %57, i64 %indvars.iv135
  %61 = load float, ptr %60, align 4
  %gep.us.us89 = getelementptr [2048 x i8], ptr %invariant.gep.us.us87, i64 %indvars.iv135
  %62 = load float, ptr %gep.us.us89, align 4
  %63 = fmul float %61, %62
  %64 = fadd float %59, %63
  store float %64, ptr %58, align 4
  %indvars.iv.next136 = or disjoint i64 %indvars.iv135, 1
  %65 = getelementptr [4 x i8], ptr %57, i64 %indvars.iv.next136
  %66 = load float, ptr %65, align 4
  %gep.us.us89.1 = getelementptr [2048 x i8], ptr %invariant.gep.us.us87, i64 %indvars.iv.next136
  %67 = load float, ptr %gep.us.us89.1, align 4
  %68 = fmul float %66, %67
  %69 = fadd float %64, %68
  store float %69, ptr %58, align 4
  %indvars.iv.next136.1 = add nuw nsw i64 %indvars.iv135, 2
  %niter214.next.1 = add i64 %niter214, 2
  %niter214.ncmp.1 = icmp eq i64 %niter214.next.1, %unroll_iter213
  br i1 %niter214.ncmp.1, label %._crit_edge.us.us90.unr-lcssa, label %.lr.ph.us.us86.new

._crit_edge.us.us90.unr-lcssa:                    ; preds = %.lr.ph.us.us86.new
  br i1 %lcmp.mod211.not, label %._crit_edge.us.us90, label %.epil.preheader206

.epil.preheader206:                               ; preds = %._crit_edge.us.us90.unr-lcssa, %.lr.ph.us.us86
  %indvars.iv135.epil.init = phi i64 [ 0, %.lr.ph.us.us86 ], [ %indvars.iv.next136.1, %._crit_edge.us.us90.unr-lcssa ]
  %.epil.init210 = phi float [ 0.000000e+00, %.lr.ph.us.us86 ], [ %69, %._crit_edge.us.us90.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod212)
  %70 = getelementptr [4 x i8], ptr %57, i64 %indvars.iv135.epil.init
  %71 = load float, ptr %70, align 4
  %gep.us.us89.epil = getelementptr [2048 x i8], ptr %invariant.gep.us.us87, i64 %indvars.iv135.epil.init
  %72 = load float, ptr %gep.us.us89.epil, align 4
  %73 = fmul float %71, %72
  %74 = fadd float %.epil.init210, %73
  store float %74, ptr %58, align 4
  br label %._crit_edge.us.us90

._crit_edge.us.us90:                              ; preds = %._crit_edge.us.us90.unr-lcssa, %.epil.preheader206
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %exitcond147.not = icmp eq i64 %indvars.iv.next144, %wide.trip.count146
  br i1 %exitcond147.not, label %._crit_edge84.split.us.us, label %.lr.ph.us.us86

._crit_edge84.split.us.us:                        ; preds = %._crit_edge.us.us90
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %exitcond152.not = icmp eq i64 %indvars.iv.next149, %wide.trip.count151
  br i1 %exitcond152.not, label %.preheader70, label %.preheader71.us

.preheader71:                                     ; preds = %.preheader71, %.preheader71.preheader.new
  %indvar126 = phi i64 [ 0, %.preheader71.preheader.new ], [ %indvar.next127.7, %.preheader71 ]
  %niter205 = phi i64 [ 0, %.preheader71.preheader.new ], [ %niter205.next.7, %.preheader71 ]
  %75 = shl nuw nsw i64 %indvar126, 11
  %scevgep128 = getelementptr i8, ptr %8, i64 %75
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep128, i8 0, i64 %52, i1 false)
  %indvar.next127 = shl i64 %indvar126, 11
  %76 = getelementptr i8, ptr %8, i64 %indvar.next127
  %scevgep128.1 = getelementptr i8, ptr %76, i64 2048
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep128.1, i8 0, i64 %52, i1 false)
  %indvar.next127.1 = shl i64 %indvar126, 11
  %77 = getelementptr i8, ptr %8, i64 %indvar.next127.1
  %scevgep128.2 = getelementptr i8, ptr %77, i64 4096
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep128.2, i8 0, i64 %52, i1 false)
  %indvar.next127.2 = shl i64 %indvar126, 11
  %78 = getelementptr i8, ptr %8, i64 %indvar.next127.2
  %scevgep128.3 = getelementptr i8, ptr %78, i64 6144
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep128.3, i8 0, i64 %52, i1 false)
  %indvar.next127.3 = shl i64 %indvar126, 11
  %79 = getelementptr i8, ptr %8, i64 %indvar.next127.3
  %scevgep128.4 = getelementptr i8, ptr %79, i64 8192
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep128.4, i8 0, i64 %52, i1 false)
  %indvar.next127.4 = shl i64 %indvar126, 11
  %80 = getelementptr i8, ptr %8, i64 %indvar.next127.4
  %scevgep128.5 = getelementptr i8, ptr %80, i64 10240
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep128.5, i8 0, i64 %52, i1 false)
  %indvar.next127.5 = shl i64 %indvar126, 11
  %81 = getelementptr i8, ptr %8, i64 %indvar.next127.5
  %scevgep128.6 = getelementptr i8, ptr %81, i64 12288
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep128.6, i8 0, i64 %52, i1 false)
  %indvar.next127.6 = shl i64 %indvar126, 11
  %82 = getelementptr i8, ptr %8, i64 %indvar.next127.6
  %scevgep128.7 = getelementptr i8, ptr %82, i64 14336
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep128.7, i8 0, i64 %52, i1 false)
  %indvar.next127.7 = add nuw nsw i64 %indvar126, 8
  %niter205.next.7 = add i64 %niter205, 8
  %niter205.ncmp.7 = icmp eq i64 %niter205.next.7, %unroll_iter204
  br i1 %niter205.ncmp.7, label %.preheader70.loopexit192.unr-lcssa, label %.preheader71

.preheader70.loopexit192.unr-lcssa:               ; preds = %.preheader71
  %lcmp.mod202.not = icmp eq i64 %xtraiter200, 0
  br i1 %lcmp.mod202.not, label %.preheader70, label %.preheader71.epil.preheader

.preheader71.epil.preheader:                      ; preds = %.preheader70.loopexit192.unr-lcssa, %.preheader71.preheader
  %indvar126.epil.init = phi i64 [ 0, %.preheader71.preheader ], [ %indvar.next127.7, %.preheader70.loopexit192.unr-lcssa ]
  %lcmp.mod203 = icmp ne i64 %xtraiter200, 0
  tail call void @llvm.assume(i1 %lcmp.mod203)
  br label %.preheader71.epil

.preheader71.epil:                                ; preds = %.preheader71.epil, %.preheader71.epil.preheader
  %indvar126.epil = phi i64 [ %indvar126.epil.init, %.preheader71.epil.preheader ], [ %indvar.next127.epil, %.preheader71.epil ]
  %epil.iter201 = phi i64 [ 0, %.preheader71.epil.preheader ], [ %epil.iter201.next, %.preheader71.epil ]
  %83 = shl nuw nsw i64 %indvar126.epil, 11
  %scevgep128.epil = getelementptr i8, ptr %8, i64 %83
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep128.epil, i8 0, i64 %52, i1 false)
  %indvar.next127.epil = add nuw nsw i64 %indvar126.epil, 1
  %epil.iter201.next = add i64 %epil.iter201, 1
  %epil.iter201.cmp.not = icmp eq i64 %epil.iter201.next, %xtraiter200
  br i1 %epil.iter201.cmp.not, label %.preheader70, label %.preheader71.epil, !llvm.loop !15

.preheader70:                                     ; preds = %.preheader70.loopexit192.unr-lcssa, %.preheader71.epil, %._crit_edge84.split.us.us, %.preheader71.lr.ph, %.preheader72
  %84 = phi i1 [ false, %.preheader72 ], [ true, %._crit_edge84.split.us.us ], [ true, %.preheader71.lr.ph ], [ true, %.preheader71.epil ], [ true, %.preheader70.loopexit192.unr-lcssa ]
  %85 = icmp sgt i32 %3, 0
  %or.cond = and i1 %13, %85
  br i1 %or.cond, label %.preheader.lr.ph.split, label %._crit_edge.split

.preheader.lr.ph.thread:                          ; preds = %.preheader73.lr.ph
  %86 = icmp sgt i32 %3, 0
  br i1 %86, label %.preheader.preheader, label %._crit_edge.split

.preheader.lr.ph.split:                           ; preds = %.preheader70
  br i1 %84, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph.thread, %.preheader.lr.ph.split
  %87 = zext nneg i32 %3 to i64
  %88 = shl nuw nsw i64 %87, 2
  %wide.trip.count160 = zext nneg i32 %0 to i64
  %xtraiter215 = and i64 %wide.trip.count160, 7
  %89 = add i32 %0, -1
  %90 = icmp ult i32 %89, 7
  br i1 %90, label %.preheader.epil.preheader, label %.preheader.preheader.new

.preheader.preheader.new:                         ; preds = %.preheader.preheader
  %unroll_iter219 = and i64 %wide.trip.count160, 2147483640
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph.split
  %wide.trip.count178 = zext nneg i32 %0 to i64
  %wide.trip.count173 = zext nneg i32 %3 to i64
  %wide.trip.count165 = zext nneg i32 %1 to i64
  %xtraiter222 = and i64 %wide.trip.count165, 1
  %91 = icmp eq i32 %1, 1
  %unroll_iter228 = and i64 %wide.trip.count165, 2147483646
  %lcmp.mod226.not = icmp eq i64 %xtraiter222, 0
  %lcmp.mod227 = trunc i32 %1 to i1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge96.split.us.us
  %indvars.iv175 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next176, %._crit_edge96.split.us.us ]
  %92 = getelementptr [2048 x i8], ptr %11, i64 %indvars.iv175
  %93 = getelementptr [2048 x i8], ptr %5, i64 %indvars.iv175
  br label %.lr.ph.us.us98

.lr.ph.us.us98:                                   ; preds = %._crit_edge.us.us102, %.preheader.us
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %._crit_edge.us.us102 ], [ 0, %.preheader.us ]
  %94 = getelementptr [4 x i8], ptr %92, i64 %indvars.iv170
  store float 0.000000e+00, ptr %94, align 4
  %invariant.gep.us.us99 = getelementptr [4 x i8], ptr %8, i64 %indvars.iv170
  br i1 %91, label %.epil.preheader221, label %.lr.ph.us.us98.new

.lr.ph.us.us98.new:                               ; preds = %.lr.ph.us.us98, %.lr.ph.us.us98.new
  %indvars.iv162 = phi i64 [ %indvars.iv.next163.1, %.lr.ph.us.us98.new ], [ 0, %.lr.ph.us.us98 ]
  %95 = phi float [ %105, %.lr.ph.us.us98.new ], [ 0.000000e+00, %.lr.ph.us.us98 ]
  %niter229 = phi i64 [ %niter229.next.1, %.lr.ph.us.us98.new ], [ 0, %.lr.ph.us.us98 ]
  %96 = getelementptr [4 x i8], ptr %93, i64 %indvars.iv162
  %97 = load float, ptr %96, align 4
  %gep.us.us101 = getelementptr [2048 x i8], ptr %invariant.gep.us.us99, i64 %indvars.iv162
  %98 = load float, ptr %gep.us.us101, align 4
  %99 = fmul float %97, %98
  %100 = fadd float %95, %99
  store float %100, ptr %94, align 4
  %indvars.iv.next163 = or disjoint i64 %indvars.iv162, 1
  %101 = getelementptr [4 x i8], ptr %93, i64 %indvars.iv.next163
  %102 = load float, ptr %101, align 4
  %gep.us.us101.1 = getelementptr [2048 x i8], ptr %invariant.gep.us.us99, i64 %indvars.iv.next163
  %103 = load float, ptr %gep.us.us101.1, align 4
  %104 = fmul float %102, %103
  %105 = fadd float %100, %104
  store float %105, ptr %94, align 4
  %indvars.iv.next163.1 = add nuw nsw i64 %indvars.iv162, 2
  %niter229.next.1 = add i64 %niter229, 2
  %niter229.ncmp.1 = icmp eq i64 %niter229.next.1, %unroll_iter228
  br i1 %niter229.ncmp.1, label %._crit_edge.us.us102.unr-lcssa, label %.lr.ph.us.us98.new

._crit_edge.us.us102.unr-lcssa:                   ; preds = %.lr.ph.us.us98.new
  br i1 %lcmp.mod226.not, label %._crit_edge.us.us102, label %.epil.preheader221

.epil.preheader221:                               ; preds = %._crit_edge.us.us102.unr-lcssa, %.lr.ph.us.us98
  %indvars.iv162.epil.init = phi i64 [ 0, %.lr.ph.us.us98 ], [ %indvars.iv.next163.1, %._crit_edge.us.us102.unr-lcssa ]
  %.epil.init225 = phi float [ 0.000000e+00, %.lr.ph.us.us98 ], [ %105, %._crit_edge.us.us102.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod227)
  %106 = getelementptr [4 x i8], ptr %93, i64 %indvars.iv162.epil.init
  %107 = load float, ptr %106, align 4
  %gep.us.us101.epil = getelementptr [2048 x i8], ptr %invariant.gep.us.us99, i64 %indvars.iv162.epil.init
  %108 = load float, ptr %gep.us.us101.epil, align 4
  %109 = fmul float %107, %108
  %110 = fadd float %.epil.init225, %109
  store float %110, ptr %94, align 4
  br label %._crit_edge.us.us102

._crit_edge.us.us102:                             ; preds = %._crit_edge.us.us102.unr-lcssa, %.epil.preheader221
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %exitcond174.not = icmp eq i64 %indvars.iv.next171, %wide.trip.count173
  br i1 %exitcond174.not, label %._crit_edge96.split.us.us, label %.lr.ph.us.us98

._crit_edge96.split.us.us:                        ; preds = %._crit_edge.us.us102
  %indvars.iv.next176 = add nuw nsw i64 %indvars.iv175, 1
  %exitcond179.not = icmp eq i64 %indvars.iv.next176, %wide.trip.count178
  br i1 %exitcond179.not, label %._crit_edge.split, label %.preheader.us

.preheader:                                       ; preds = %.preheader, %.preheader.preheader.new
  %indvar153 = phi i64 [ 0, %.preheader.preheader.new ], [ %indvar.next154.7, %.preheader ]
  %niter220 = phi i64 [ 0, %.preheader.preheader.new ], [ %niter220.next.7, %.preheader ]
  %111 = shl nuw nsw i64 %indvar153, 11
  %scevgep155 = getelementptr i8, ptr %11, i64 %111
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep155, i8 0, i64 %88, i1 false)
  %indvar.next154 = shl i64 %indvar153, 11
  %112 = getelementptr i8, ptr %11, i64 %indvar.next154
  %scevgep155.1 = getelementptr i8, ptr %112, i64 2048
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep155.1, i8 0, i64 %88, i1 false)
  %indvar.next154.1 = shl i64 %indvar153, 11
  %113 = getelementptr i8, ptr %11, i64 %indvar.next154.1
  %scevgep155.2 = getelementptr i8, ptr %113, i64 4096
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep155.2, i8 0, i64 %88, i1 false)
  %indvar.next154.2 = shl i64 %indvar153, 11
  %114 = getelementptr i8, ptr %11, i64 %indvar.next154.2
  %scevgep155.3 = getelementptr i8, ptr %114, i64 6144
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep155.3, i8 0, i64 %88, i1 false)
  %indvar.next154.3 = shl i64 %indvar153, 11
  %115 = getelementptr i8, ptr %11, i64 %indvar.next154.3
  %scevgep155.4 = getelementptr i8, ptr %115, i64 8192
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep155.4, i8 0, i64 %88, i1 false)
  %indvar.next154.4 = shl i64 %indvar153, 11
  %116 = getelementptr i8, ptr %11, i64 %indvar.next154.4
  %scevgep155.5 = getelementptr i8, ptr %116, i64 10240
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep155.5, i8 0, i64 %88, i1 false)
  %indvar.next154.5 = shl i64 %indvar153, 11
  %117 = getelementptr i8, ptr %11, i64 %indvar.next154.5
  %scevgep155.6 = getelementptr i8, ptr %117, i64 12288
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep155.6, i8 0, i64 %88, i1 false)
  %indvar.next154.6 = shl i64 %indvar153, 11
  %118 = getelementptr i8, ptr %11, i64 %indvar.next154.6
  %scevgep155.7 = getelementptr i8, ptr %118, i64 14336
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep155.7, i8 0, i64 %88, i1 false)
  %indvar.next154.7 = add nuw nsw i64 %indvar153, 8
  %niter220.next.7 = add i64 %niter220, 8
  %niter220.ncmp.7 = icmp eq i64 %niter220.next.7, %unroll_iter219
  br i1 %niter220.ncmp.7, label %._crit_edge.split.loopexit191.unr-lcssa, label %.preheader

._crit_edge.split.loopexit191.unr-lcssa:          ; preds = %.preheader
  %lcmp.mod217.not = icmp eq i64 %xtraiter215, 0
  br i1 %lcmp.mod217.not, label %._crit_edge.split, label %.preheader.epil.preheader

.preheader.epil.preheader:                        ; preds = %._crit_edge.split.loopexit191.unr-lcssa, %.preheader.preheader
  %indvar153.epil.init = phi i64 [ 0, %.preheader.preheader ], [ %indvar.next154.7, %._crit_edge.split.loopexit191.unr-lcssa ]
  %lcmp.mod218 = icmp ne i64 %xtraiter215, 0
  tail call void @llvm.assume(i1 %lcmp.mod218)
  br label %.preheader.epil

.preheader.epil:                                  ; preds = %.preheader.epil, %.preheader.epil.preheader
  %indvar153.epil = phi i64 [ %indvar153.epil.init, %.preheader.epil.preheader ], [ %indvar.next154.epil, %.preheader.epil ]
  %epil.iter216 = phi i64 [ 0, %.preheader.epil.preheader ], [ %epil.iter216.next, %.preheader.epil ]
  %119 = shl nuw nsw i64 %indvar153.epil, 11
  %scevgep155.epil = getelementptr i8, ptr %11, i64 %119
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep155.epil, i8 0, i64 %88, i1 false)
  %indvar.next154.epil = add nuw nsw i64 %indvar153.epil, 1
  %epil.iter216.next = add i64 %epil.iter216, 1
  %epil.iter216.cmp.not = icmp eq i64 %epil.iter216.next, %xtraiter215
  br i1 %epil.iter216.cmp.not, label %._crit_edge.split, label %.preheader.epil, !llvm.loop !16

._crit_edge.split:                                ; preds = %._crit_edge.split.loopexit191.unr-lcssa, %.preheader.epil, %._crit_edge96.split.us.us, %.preheader.lr.ph.thread, %.preheader70
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

define dso_local void @_Z7mm3CudaiiiiiPA512_fS0_S0_S0_S0_S0_S0_S0_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8, ptr noundef %9, ptr noundef %10, ptr noundef %11, ptr noundef %12) local_unnamed_addr #5 {
  %14 = alloca %struct.timeval, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca [8 x ptr], align 16
  %24 = alloca %struct.dim3, align 8
  %25 = alloca %struct.dim3, align 8
  %26 = alloca i64, align 8
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca ptr, align 8
  %34 = alloca ptr, align 8
  %35 = alloca ptr, align 8
  %36 = alloca [8 x ptr], align 16
  %37 = alloca %struct.dim3, align 8
  %38 = alloca %struct.dim3, align 8
  %39 = alloca i64, align 8
  %40 = alloca ptr, align 8
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = alloca [8 x ptr], align 16
  %50 = alloca %struct.dim3, align 8
  %51 = alloca %struct.dim3, align 8
  %52 = alloca i64, align 8
  %53 = alloca ptr, align 8
  %54 = alloca %struct.timeval, align 8
  %55 = alloca ptr, align 8
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca ptr, align 8
  %61 = alloca ptr, align 8
  %62 = call i32 @cudaMalloc(ptr noundef nonnull %55, i64 noundef 1048576) #4
  %63 = call i32 @cudaMalloc(ptr noundef nonnull %56, i64 noundef 1048576) #4
  %64 = call i32 @cudaMalloc(ptr noundef nonnull %57, i64 noundef 1048576) #4
  %65 = call i32 @cudaMalloc(ptr noundef nonnull %58, i64 noundef 1048576) #4
  %66 = call i32 @cudaMalloc(ptr noundef nonnull %59, i64 noundef 1048576) #4
  %67 = call i32 @cudaMalloc(ptr noundef nonnull %60, i64 noundef 1048576) #4
  %68 = call i32 @cudaMalloc(ptr noundef nonnull %61, i64 noundef 1048576) #4
  %69 = load ptr, ptr %55, align 8
  %70 = call i32 @cudaMemcpy(ptr noundef %69, ptr noundef %6, i64 noundef 1048576, i32 noundef 1) #4
  %71 = load ptr, ptr %56, align 8
  %72 = call i32 @cudaMemcpy(ptr noundef %71, ptr noundef %7, i64 noundef 1048576, i32 noundef 1) #4
  %73 = load ptr, ptr %57, align 8
  %74 = call i32 @cudaMemcpy(ptr noundef %73, ptr noundef %9, i64 noundef 1048576, i32 noundef 1) #4
  %75 = load ptr, ptr %58, align 8
  %76 = call i32 @cudaMemcpy(ptr noundef %75, ptr noundef %10, i64 noundef 1048576, i32 noundef 1) #4
  %77 = load ptr, ptr %59, align 8
  %78 = call i32 @cudaMemcpy(ptr noundef %77, ptr noundef %5, i64 noundef 1048576, i32 noundef 1) #4
  %79 = load ptr, ptr %60, align 8
  %80 = call i32 @cudaMemcpy(ptr noundef %79, ptr noundef %8, i64 noundef 1048576, i32 noundef 1) #4
  %81 = load ptr, ptr %61, align 8
  %82 = call i32 @cudaMemcpy(ptr noundef %81, ptr noundef %11, i64 noundef 1048576, i32 noundef 1) #4
  call void @llvm.lifetime.start.p0(ptr nonnull %54)
  %83 = call i32 @gettimeofday(ptr noundef nonnull %54, ptr noundef null) #15
  %.not.i.i = icmp eq i32 %83, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %84

84:                                               ; preds = %13
  %85 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %83) #4
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %13, %84
  %86 = load i64, ptr %54, align 8
  %87 = sitofp i64 %86 to double
  %88 = getelementptr inbounds nuw i8, ptr %54, i64 8
  %89 = load i64, ptr %88, align 8
  %90 = sitofp i64 %89 to double
  %91 = fmul nnan double %90, f0x3EB0C6F7A0B5ED8D
  %92 = fadd double %91, %87
  call void @llvm.lifetime.end.p0(ptr nonnull %54)
  store double %92, ptr @polybench_t_start, align 8
  %93 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 16, i32 64, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #4
  %.not = icmp eq i32 %93, 0
  br i1 %.not, label %94, label %109

94:                                               ; preds = %_Z21polybench_timer_startv.exit
  %95 = load ptr, ptr %55, align 8
  %96 = load ptr, ptr %56, align 8
  %97 = load ptr, ptr %59, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %41)
  call void @llvm.lifetime.start.p0(ptr nonnull %42)
  call void @llvm.lifetime.start.p0(ptr nonnull %43)
  call void @llvm.lifetime.start.p0(ptr nonnull %44)
  call void @llvm.lifetime.start.p0(ptr nonnull %45)
  call void @llvm.lifetime.start.p0(ptr nonnull %46)
  call void @llvm.lifetime.start.p0(ptr nonnull %47)
  call void @llvm.lifetime.start.p0(ptr nonnull %48)
  call void @llvm.lifetime.start.p0(ptr nonnull %49)
  call void @llvm.lifetime.start.p0(ptr nonnull %50)
  call void @llvm.lifetime.start.p0(ptr nonnull %51)
  call void @llvm.lifetime.start.p0(ptr nonnull %52)
  call void @llvm.lifetime.start.p0(ptr nonnull %53)
  store i32 %0, ptr %41, align 4
  store i32 %1, ptr %42, align 4
  store i32 %2, ptr %43, align 4
  store i32 %3, ptr %44, align 4
  store i32 %4, ptr %45, align 4
  store ptr %95, ptr %46, align 8
  store ptr %96, ptr %47, align 8
  store ptr %97, ptr %48, align 8
  store ptr %41, ptr %49, align 16
  %98 = getelementptr inbounds nuw i8, ptr %49, i64 8
  store ptr %42, ptr %98, align 8
  %99 = getelementptr inbounds nuw i8, ptr %49, i64 16
  store ptr %43, ptr %99, align 16
  %100 = getelementptr inbounds nuw i8, ptr %49, i64 24
  store ptr %44, ptr %100, align 8
  %101 = getelementptr inbounds nuw i8, ptr %49, i64 32
  store ptr %45, ptr %101, align 16
  %102 = getelementptr inbounds nuw i8, ptr %49, i64 40
  store ptr %46, ptr %102, align 8
  %103 = getelementptr inbounds nuw i8, ptr %49, i64 48
  store ptr %47, ptr %103, align 16
  %104 = getelementptr inbounds nuw i8, ptr %49, i64 56
  store ptr %48, ptr %104, align 8
  %105 = call i32 @__cudaPopCallConfiguration(ptr nonnull %50, ptr nonnull %51, ptr nonnull %52, ptr nonnull %53), !inline_history !17
  %106 = load i64, ptr %52, align 8
  %107 = load ptr, ptr %53, align 8
  %.fca.0.load2.i = load i32, ptr %50, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %50, i64 4
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %50, i64 8
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %51, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %51, i64 4
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %51, i64 8
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %108 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm3_kernel1iiiiiPfS_S_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %49, i64 noundef %106, ptr noundef %107), !inline_history !17
  call void @llvm.lifetime.end.p0(ptr nonnull %41)
  call void @llvm.lifetime.end.p0(ptr nonnull %42)
  call void @llvm.lifetime.end.p0(ptr nonnull %43)
  call void @llvm.lifetime.end.p0(ptr nonnull %44)
  call void @llvm.lifetime.end.p0(ptr nonnull %45)
  call void @llvm.lifetime.end.p0(ptr nonnull %46)
  call void @llvm.lifetime.end.p0(ptr nonnull %47)
  call void @llvm.lifetime.end.p0(ptr nonnull %48)
  call void @llvm.lifetime.end.p0(ptr nonnull %49)
  call void @llvm.lifetime.end.p0(ptr nonnull %50)
  call void @llvm.lifetime.end.p0(ptr nonnull %51)
  call void @llvm.lifetime.end.p0(ptr nonnull %52)
  call void @llvm.lifetime.end.p0(ptr nonnull %53)
  br label %109

109:                                              ; preds = %_Z21polybench_timer_startv.exit, %94
  %110 = call i32 @cudaThreadSynchronize() #4
  %111 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 16, i32 64, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #4
  %.not52 = icmp eq i32 %111, 0
  br i1 %.not52, label %112, label %127

112:                                              ; preds = %109
  %113 = load ptr, ptr %57, align 8
  %114 = load ptr, ptr %58, align 8
  %115 = load ptr, ptr %60, align 8
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
  call void @llvm.lifetime.start.p0(ptr nonnull %38)
  call void @llvm.lifetime.start.p0(ptr nonnull %39)
  call void @llvm.lifetime.start.p0(ptr nonnull %40)
  store i32 %0, ptr %28, align 4
  store i32 %1, ptr %29, align 4
  store i32 %2, ptr %30, align 4
  store i32 %3, ptr %31, align 4
  store i32 %4, ptr %32, align 4
  store ptr %113, ptr %33, align 8
  store ptr %114, ptr %34, align 8
  store ptr %115, ptr %35, align 8
  store ptr %28, ptr %36, align 16
  %116 = getelementptr inbounds nuw i8, ptr %36, i64 8
  store ptr %29, ptr %116, align 8
  %117 = getelementptr inbounds nuw i8, ptr %36, i64 16
  store ptr %30, ptr %117, align 16
  %118 = getelementptr inbounds nuw i8, ptr %36, i64 24
  store ptr %31, ptr %118, align 8
  %119 = getelementptr inbounds nuw i8, ptr %36, i64 32
  store ptr %32, ptr %119, align 16
  %120 = getelementptr inbounds nuw i8, ptr %36, i64 40
  store ptr %33, ptr %120, align 8
  %121 = getelementptr inbounds nuw i8, ptr %36, i64 48
  store ptr %34, ptr %121, align 16
  %122 = getelementptr inbounds nuw i8, ptr %36, i64 56
  store ptr %35, ptr %122, align 8
  %123 = call i32 @__cudaPopCallConfiguration(ptr nonnull %37, ptr nonnull %38, ptr nonnull %39, ptr nonnull %40), !inline_history !18
  %124 = load i64, ptr %39, align 8
  %125 = load ptr, ptr %40, align 8
  %.fca.0.load2.i54 = load i32, ptr %37, align 8
  %.fca.0.insert3.i55 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i54, 0
  %.fca.1.gep4.i56 = getelementptr inbounds nuw i8, ptr %37, i64 4
  %.fca.1.load5.i57 = load i32, ptr %.fca.1.gep4.i56, align 4
  %.fca.1.insert6.i58 = insertvalue %struct.dim3 %.fca.0.insert3.i55, i32 %.fca.1.load5.i57, 1
  %.fca.2.gep7.i59 = getelementptr inbounds nuw i8, ptr %37, i64 8
  %.fca.2.load8.i60 = load i32, ptr %.fca.2.gep7.i59, align 8
  %.fca.2.insert9.i61 = insertvalue %struct.dim3 %.fca.1.insert6.i58, i32 %.fca.2.load8.i60, 2
  %.fca.0.load.i62 = load i32, ptr %38, align 8
  %.fca.0.insert.i63 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i62, 0
  %.fca.1.gep.i64 = getelementptr inbounds nuw i8, ptr %38, i64 4
  %.fca.1.load.i65 = load i32, ptr %.fca.1.gep.i64, align 4
  %.fca.1.insert.i66 = insertvalue %struct.dim3 %.fca.0.insert.i63, i32 %.fca.1.load.i65, 1
  %.fca.2.gep.i67 = getelementptr inbounds nuw i8, ptr %38, i64 8
  %.fca.2.load.i68 = load i32, ptr %.fca.2.gep.i67, align 8
  %.fca.2.insert.i69 = insertvalue %struct.dim3 %.fca.1.insert.i66, i32 %.fca.2.load.i68, 2
  %126 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm3_kernel2iiiiiPfS_S_, %struct.dim3 %.fca.2.insert9.i61, %struct.dim3 %.fca.2.insert.i69, ptr noundef nonnull %36, i64 noundef %124, ptr noundef %125), !inline_history !18
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
  call void @llvm.lifetime.end.p0(ptr nonnull %38)
  call void @llvm.lifetime.end.p0(ptr nonnull %39)
  call void @llvm.lifetime.end.p0(ptr nonnull %40)
  br label %127

127:                                              ; preds = %109, %112
  %128 = call i32 @cudaThreadSynchronize() #4
  %129 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 16, i32 64, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #4
  %.not53 = icmp eq i32 %129, 0
  br i1 %.not53, label %130, label %145

130:                                              ; preds = %127
  %131 = load ptr, ptr %59, align 8
  %132 = load ptr, ptr %60, align 8
  %133 = load ptr, ptr %61, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %15)
  call void @llvm.lifetime.start.p0(ptr nonnull %16)
  call void @llvm.lifetime.start.p0(ptr nonnull %17)
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
  store i32 %0, ptr %15, align 4
  store i32 %1, ptr %16, align 4
  store i32 %2, ptr %17, align 4
  store i32 %3, ptr %18, align 4
  store i32 %4, ptr %19, align 4
  store ptr %131, ptr %20, align 8
  store ptr %132, ptr %21, align 8
  store ptr %133, ptr %22, align 8
  store ptr %15, ptr %23, align 16
  %134 = getelementptr inbounds nuw i8, ptr %23, i64 8
  store ptr %16, ptr %134, align 8
  %135 = getelementptr inbounds nuw i8, ptr %23, i64 16
  store ptr %17, ptr %135, align 16
  %136 = getelementptr inbounds nuw i8, ptr %23, i64 24
  store ptr %18, ptr %136, align 8
  %137 = getelementptr inbounds nuw i8, ptr %23, i64 32
  store ptr %19, ptr %137, align 16
  %138 = getelementptr inbounds nuw i8, ptr %23, i64 40
  store ptr %20, ptr %138, align 8
  %139 = getelementptr inbounds nuw i8, ptr %23, i64 48
  store ptr %21, ptr %139, align 16
  %140 = getelementptr inbounds nuw i8, ptr %23, i64 56
  store ptr %22, ptr %140, align 8
  %141 = call i32 @__cudaPopCallConfiguration(ptr nonnull %24, ptr nonnull %25, ptr nonnull %26, ptr nonnull %27), !inline_history !19
  %142 = load i64, ptr %26, align 8
  %143 = load ptr, ptr %27, align 8
  %.fca.0.load2.i70 = load i32, ptr %24, align 8
  %.fca.0.insert3.i71 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i70, 0
  %.fca.1.gep4.i72 = getelementptr inbounds nuw i8, ptr %24, i64 4
  %.fca.1.load5.i73 = load i32, ptr %.fca.1.gep4.i72, align 4
  %.fca.1.insert6.i74 = insertvalue %struct.dim3 %.fca.0.insert3.i71, i32 %.fca.1.load5.i73, 1
  %.fca.2.gep7.i75 = getelementptr inbounds nuw i8, ptr %24, i64 8
  %.fca.2.load8.i76 = load i32, ptr %.fca.2.gep7.i75, align 8
  %.fca.2.insert9.i77 = insertvalue %struct.dim3 %.fca.1.insert6.i74, i32 %.fca.2.load8.i76, 2
  %.fca.0.load.i78 = load i32, ptr %25, align 8
  %.fca.0.insert.i79 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i78, 0
  %.fca.1.gep.i80 = getelementptr inbounds nuw i8, ptr %25, i64 4
  %.fca.1.load.i81 = load i32, ptr %.fca.1.gep.i80, align 4
  %.fca.1.insert.i82 = insertvalue %struct.dim3 %.fca.0.insert.i79, i32 %.fca.1.load.i81, 1
  %.fca.2.gep.i83 = getelementptr inbounds nuw i8, ptr %25, i64 8
  %.fca.2.load.i84 = load i32, ptr %.fca.2.gep.i83, align 8
  %.fca.2.insert.i85 = insertvalue %struct.dim3 %.fca.1.insert.i82, i32 %.fca.2.load.i84, 2
  %144 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm3_kernel3iiiiiPfS_S_, %struct.dim3 %.fca.2.insert9.i77, %struct.dim3 %.fca.2.insert.i85, ptr noundef nonnull %23, i64 noundef %142, ptr noundef %143), !inline_history !19
  call void @llvm.lifetime.end.p0(ptr nonnull %15)
  call void @llvm.lifetime.end.p0(ptr nonnull %16)
  call void @llvm.lifetime.end.p0(ptr nonnull %17)
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
  br label %145

145:                                              ; preds = %127, %130
  %146 = call i32 @cudaThreadSynchronize() #4
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  %147 = call i32 @gettimeofday(ptr noundef nonnull %14, ptr noundef null) #15
  %.not.i.i86 = icmp eq i32 %147, 0
  br i1 %.not.i.i86, label %_Z20polybench_timer_stopv.exit, label %148

148:                                              ; preds = %145
  %149 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %147) #4
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %145, %148
  %150 = load i64, ptr %14, align 8
  %151 = sitofp i64 %150 to double
  %152 = getelementptr inbounds nuw i8, ptr %14, i64 8
  %153 = load i64, ptr %152, align 8
  %154 = sitofp i64 %153 to double
  %155 = fmul nnan double %154, f0x3EB0C6F7A0B5ED8D
  %156 = fadd double %155, %151
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  store double %156, ptr @polybench_t_end, align 8
  %157 = load double, ptr @polybench_t_start, align 8
  %158 = fsub double %156, %157
  %159 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %158) #4
  %160 = load ptr, ptr %61, align 8
  %161 = call i32 @cudaMemcpy(ptr noundef %12, ptr noundef %160, i64 noundef 1048576, i32 noundef 2) #4
  %162 = load ptr, ptr %55, align 8
  %163 = call i32 @cudaFree(ptr noundef %162) #4
  %164 = load ptr, ptr %56, align 8
  %165 = call i32 @cudaFree(ptr noundef %164) #4
  %166 = load ptr, ptr %57, align 8
  %167 = call i32 @cudaFree(ptr noundef %166) #4
  %168 = load ptr, ptr %58, align 8
  %169 = call i32 @cudaFree(ptr noundef %168) #4
  %170 = load ptr, ptr %59, align 8
  %171 = call i32 @cudaFree(ptr noundef %170) #4
  %172 = load ptr, ptr %60, align 8
  %173 = call i32 @cudaFree(ptr noundef %172) #4
  %174 = load ptr, ptr %61, align 8
  %175 = call i32 @cudaFree(ptr noundef %174) #4
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
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
  store ptr null, ptr %13, align 8
  %14 = call i32 @posix_memalign(ptr noundef nonnull %13, i64 noundef 32, i64 noundef 1048576) #15
  %15 = load ptr, ptr %13, align 8
  %.not.i.i = icmp eq ptr %15, null
  %16 = icmp ne i32 %14, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %16
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %17 = load ptr, ptr @stderr, align 8
  %18 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %17) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %13)
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  store ptr null, ptr %12, align 8
  %19 = call i32 @posix_memalign(ptr noundef nonnull %12, i64 noundef 32, i64 noundef 1048576) #15
  %20 = load ptr, ptr %12, align 8
  %.not.i.i46 = icmp eq ptr %20, null
  %21 = icmp ne i32 %19, 0
  %or.cond.i.i47 = select i1 %.not.i.i46, i1 true, i1 %21
  br i1 %or.cond.i.i47, label %.critedge.i.i48, label %_Z20polybench_alloc_datayi.exit49

.critedge.i.i48:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %22 = load ptr, ptr @stderr, align 8
  %23 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %22) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit49:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  store ptr null, ptr %11, align 8
  %24 = call i32 @posix_memalign(ptr noundef nonnull %11, i64 noundef 32, i64 noundef 1048576) #15
  %25 = load ptr, ptr %11, align 8
  %.not.i.i50 = icmp eq ptr %25, null
  %26 = icmp ne i32 %24, 0
  %or.cond.i.i51 = select i1 %.not.i.i50, i1 true, i1 %26
  br i1 %or.cond.i.i51, label %.critedge.i.i52, label %_Z20polybench_alloc_datayi.exit53

.critedge.i.i52:                                  ; preds = %_Z20polybench_alloc_datayi.exit49
  %27 = load ptr, ptr @stderr, align 8
  %28 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %27) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit53:                ; preds = %_Z20polybench_alloc_datayi.exit49
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  store ptr null, ptr %10, align 8
  %29 = call i32 @posix_memalign(ptr noundef nonnull %10, i64 noundef 32, i64 noundef 1048576) #15
  %30 = load ptr, ptr %10, align 8
  %.not.i.i54 = icmp eq ptr %30, null
  %31 = icmp ne i32 %29, 0
  %or.cond.i.i55 = select i1 %.not.i.i54, i1 true, i1 %31
  br i1 %or.cond.i.i55, label %.critedge.i.i56, label %_Z20polybench_alloc_datayi.exit57

.critedge.i.i56:                                  ; preds = %_Z20polybench_alloc_datayi.exit53
  %32 = load ptr, ptr @stderr, align 8
  %33 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %32) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit57:                ; preds = %_Z20polybench_alloc_datayi.exit53
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  store ptr null, ptr %9, align 8
  %34 = call i32 @posix_memalign(ptr noundef nonnull %9, i64 noundef 32, i64 noundef 1048576) #15
  %35 = load ptr, ptr %9, align 8
  %.not.i.i58 = icmp eq ptr %35, null
  %36 = icmp ne i32 %34, 0
  %or.cond.i.i59 = select i1 %.not.i.i58, i1 true, i1 %36
  br i1 %or.cond.i.i59, label %.critedge.i.i60, label %_Z20polybench_alloc_datayi.exit61

.critedge.i.i60:                                  ; preds = %_Z20polybench_alloc_datayi.exit57
  %37 = load ptr, ptr @stderr, align 8
  %38 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %37) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit61:                ; preds = %_Z20polybench_alloc_datayi.exit57
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %39 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 1048576) #15
  %40 = load ptr, ptr %8, align 8
  %.not.i.i62 = icmp eq ptr %40, null
  %41 = icmp ne i32 %39, 0
  %or.cond.i.i63 = select i1 %.not.i.i62, i1 true, i1 %41
  br i1 %or.cond.i.i63, label %.critedge.i.i64, label %_Z20polybench_alloc_datayi.exit65

.critedge.i.i64:                                  ; preds = %_Z20polybench_alloc_datayi.exit61
  %42 = load ptr, ptr @stderr, align 8
  %43 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %42) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit65:                ; preds = %_Z20polybench_alloc_datayi.exit61
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %44 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 1048576) #15
  %45 = load ptr, ptr %7, align 8
  %.not.i.i66 = icmp eq ptr %45, null
  %46 = icmp ne i32 %44, 0
  %or.cond.i.i67 = select i1 %.not.i.i66, i1 true, i1 %46
  br i1 %or.cond.i.i67, label %.critedge.i.i68, label %_Z20polybench_alloc_datayi.exit69

.critedge.i.i68:                                  ; preds = %_Z20polybench_alloc_datayi.exit65
  %47 = load ptr, ptr @stderr, align 8
  %48 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %47) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit69:                ; preds = %_Z20polybench_alloc_datayi.exit65
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %49 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 1048576) #15
  %50 = load ptr, ptr %6, align 8
  %.not.i.i70 = icmp eq ptr %50, null
  %51 = icmp ne i32 %49, 0
  %or.cond.i.i71 = select i1 %.not.i.i70, i1 true, i1 %51
  br i1 %or.cond.i.i71, label %.critedge.i.i72, label %_Z20polybench_alloc_datayi.exit73

.critedge.i.i72:                                  ; preds = %_Z20polybench_alloc_datayi.exit69
  %52 = load ptr, ptr @stderr, align 8
  %53 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %52) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit73:                ; preds = %_Z20polybench_alloc_datayi.exit69
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  br label %.preheader59.i

.preheader59.i:                                   ; preds = %._crit_edge.i, %_Z20polybench_alloc_datayi.exit73
  %indvars.iv73.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit73 ], [ %indvars.iv.next74.i, %._crit_edge.i ]
  %54 = getelementptr [2048 x i8], ptr %20, i64 %indvars.iv73.i
  %55 = trunc nuw nsw i64 %indvars.iv73.i to i32
  %56 = uitofp nneg i32 %55 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %56, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader59.i
  %index = phi i64 [ 0, %.preheader59.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader59.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %57 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %58 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %59 = fmul nnan <4 x float> %broadcast.splat, %57
  %60 = fmul nnan <4 x float> %broadcast.splat, %58
  %61 = fmul nnan <4 x float> %59, splat (float f0x3B000000)
  %62 = fmul nnan <4 x float> %60, splat (float f0x3B000000)
  %63 = getelementptr [4 x i8], ptr %54, i64 %index
  %64 = getelementptr i8, ptr %63, i64 16
  store <4 x float> %61, ptr %63, align 4
  store <4 x float> %62, ptr %64, align 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %65 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %66 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %67 = fmul nnan <4 x float> %broadcast.splat, %65
  %68 = fmul nnan <4 x float> %broadcast.splat, %66
  %69 = fmul nnan <4 x float> %67, splat (float f0x3B000000)
  %70 = fmul nnan <4 x float> %68, splat (float f0x3B000000)
  %71 = getelementptr [4 x i8], ptr %54, i64 %index
  %72 = getelementptr i8, ptr %71, i64 32
  %73 = getelementptr i8, ptr %71, i64 48
  store <4 x float> %69, ptr %72, align 4
  store <4 x float> %70, ptr %73, align 4
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %74 = icmp eq i64 %index.next.1, 512
  br i1 %74, label %._crit_edge.i, label %vector.body, !llvm.loop !20

._crit_edge.i:                                    ; preds = %vector.body
  %indvars.iv.next74.i = add nuw nsw i64 %indvars.iv73.i, 1
  %exitcond77.not.i = icmp eq i64 %indvars.iv.next74.i, 512
  br i1 %exitcond77.not.i, label %.preheader57.i, label %.preheader59.i

.preheader57.i:                                   ; preds = %._crit_edge.i, %._crit_edge63.i
  %indvars.iv83.i = phi i64 [ %indvars.iv.next84.i, %._crit_edge63.i ], [ 0, %._crit_edge.i ]
  %75 = getelementptr [2048 x i8], ptr %25, i64 %indvars.iv83.i
  %76 = trunc nuw nsw i64 %indvars.iv83.i to i32
  %77 = uitofp nneg i32 %76 to float
  %broadcast.splatinsert93 = insertelement <4 x float> poison, float %77, i64 0
  %broadcast.splat94 = shufflevector <4 x float> %broadcast.splatinsert93, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body95

vector.body95:                                    ; preds = %vector.body95, %.preheader57.i
  %index96 = phi i64 [ 0, %.preheader57.i ], [ %index.next99, %vector.body95 ]
  %vec.ind97 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader57.i ], [ %vec.ind.next100, %vector.body95 ]
  %78 = trunc <4 x i64> %vec.ind97 to <4 x i32>
  %79 = add <4 x i32> %78, splat (i32 1)
  %80 = trunc <4 x i64> %vec.ind97 to <4 x i32>
  %81 = add <4 x i32> %80, splat (i32 5)
  %82 = uitofp nneg <4 x i32> %79 to <4 x float>
  %83 = uitofp nneg <4 x i32> %81 to <4 x float>
  %84 = fmul nnan <4 x float> %broadcast.splat94, %82
  %85 = fmul nnan <4 x float> %broadcast.splat94, %83
  %86 = fmul nnan <4 x float> %84, splat (float f0x3B000000)
  %87 = fmul nnan <4 x float> %85, splat (float f0x3B000000)
  %88 = getelementptr [4 x i8], ptr %75, i64 %index96
  %89 = getelementptr i8, ptr %88, i64 16
  store <4 x float> %86, ptr %88, align 4
  store <4 x float> %87, ptr %89, align 4
  %index.next99 = add nuw i64 %index96, 8
  %vec.ind.next100 = add nuw <4 x i64> %vec.ind97, splat (i64 8)
  %90 = icmp eq i64 %index.next99, 512
  br i1 %90, label %._crit_edge63.i, label %vector.body95, !llvm.loop !21

._crit_edge63.i:                                  ; preds = %vector.body95
  %indvars.iv.next84.i = add nuw nsw i64 %indvars.iv83.i, 1
  %exitcond87.not.i = icmp eq i64 %indvars.iv.next84.i, 512
  br i1 %exitcond87.not.i, label %.preheader55.i, label %.preheader57.i

.preheader55.i:                                   ; preds = %._crit_edge63.i, %._crit_edge66.i
  %indvars.iv93.i = phi i64 [ %indvars.iv.next94.i, %._crit_edge66.i ], [ 0, %._crit_edge63.i ]
  %91 = getelementptr [2048 x i8], ptr %35, i64 %indvars.iv93.i
  %92 = trunc nuw nsw i64 %indvars.iv93.i to i32
  %93 = uitofp nneg i32 %92 to float
  %broadcast.splatinsert103 = insertelement <4 x float> poison, float %93, i64 0
  %broadcast.splat104 = shufflevector <4 x float> %broadcast.splatinsert103, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body105

vector.body105:                                   ; preds = %vector.body105, %.preheader55.i
  %index106 = phi i64 [ 0, %.preheader55.i ], [ %index.next109.1, %vector.body105 ]
  %vec.ind107 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader55.i ], [ %vec.ind.next110.1, %vector.body105 ]
  %94 = add <4 x i32> %vec.ind107, splat (i32 3)
  %95 = add <4 x i32> %vec.ind107, splat (i32 7)
  %96 = uitofp nneg <4 x i32> %94 to <4 x float>
  %97 = uitofp nneg <4 x i32> %95 to <4 x float>
  %98 = fmul nnan <4 x float> %broadcast.splat104, %96
  %99 = fmul nnan <4 x float> %broadcast.splat104, %97
  %100 = fmul nnan <4 x float> %98, splat (float f0x3B000000)
  %101 = fmul nnan <4 x float> %99, splat (float f0x3B000000)
  %102 = getelementptr [4 x i8], ptr %91, i64 %index106
  %103 = getelementptr i8, ptr %102, i64 16
  store <4 x float> %100, ptr %102, align 4
  store <4 x float> %101, ptr %103, align 4
  %104 = add <4 x i32> %vec.ind107, splat (i32 11)
  %105 = add <4 x i32> %vec.ind107, splat (i32 15)
  %106 = uitofp nneg <4 x i32> %104 to <4 x float>
  %107 = uitofp nneg <4 x i32> %105 to <4 x float>
  %108 = fmul nnan <4 x float> %broadcast.splat104, %106
  %109 = fmul nnan <4 x float> %broadcast.splat104, %107
  %110 = fmul nnan <4 x float> %108, splat (float f0x3B000000)
  %111 = fmul nnan <4 x float> %109, splat (float f0x3B000000)
  %112 = getelementptr [4 x i8], ptr %91, i64 %index106
  %113 = getelementptr i8, ptr %112, i64 32
  %114 = getelementptr i8, ptr %112, i64 48
  store <4 x float> %110, ptr %113, align 4
  store <4 x float> %111, ptr %114, align 4
  %index.next109.1 = add nuw nsw i64 %index106, 16
  %vec.ind.next110.1 = add <4 x i32> %vec.ind107, splat (i32 16)
  %115 = icmp eq i64 %index.next109.1, 512
  br i1 %115, label %._crit_edge66.i, label %vector.body105, !llvm.loop !22

._crit_edge66.i:                                  ; preds = %vector.body105
  %indvars.iv.next94.i = add nuw nsw i64 %indvars.iv93.i, 1
  %exitcond97.not.i = icmp eq i64 %indvars.iv.next94.i, 512
  br i1 %exitcond97.not.i, label %.preheader.i, label %.preheader55.i

.preheader.i:                                     ; preds = %._crit_edge66.i, %._crit_edge69.i
  %indvars.iv103.i = phi i64 [ %indvars.iv.next104.i, %._crit_edge69.i ], [ 0, %._crit_edge66.i ]
  %116 = getelementptr [2048 x i8], ptr %40, i64 %indvars.iv103.i
  %117 = trunc nuw nsw i64 %indvars.iv103.i to i32
  %118 = uitofp nneg i32 %117 to float
  %broadcast.splatinsert113 = insertelement <4 x float> poison, float %118, i64 0
  %broadcast.splat114 = shufflevector <4 x float> %broadcast.splatinsert113, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body115

vector.body115:                                   ; preds = %vector.body115, %.preheader.i
  %index116 = phi i64 [ 0, %.preheader.i ], [ %index.next119.1, %vector.body115 ]
  %vec.ind117 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader.i ], [ %vec.ind.next120.1, %vector.body115 ]
  %119 = add <4 x i32> %vec.ind117, splat (i32 2)
  %120 = add <4 x i32> %vec.ind117, splat (i32 6)
  %121 = uitofp nneg <4 x i32> %119 to <4 x float>
  %122 = uitofp nneg <4 x i32> %120 to <4 x float>
  %123 = fmul nnan <4 x float> %broadcast.splat114, %121
  %124 = fmul nnan <4 x float> %broadcast.splat114, %122
  %125 = fmul nnan <4 x float> %123, splat (float f0x3B000000)
  %126 = fmul nnan <4 x float> %124, splat (float f0x3B000000)
  %127 = getelementptr [4 x i8], ptr %116, i64 %index116
  %128 = getelementptr i8, ptr %127, i64 16
  store <4 x float> %125, ptr %127, align 4
  store <4 x float> %126, ptr %128, align 4
  %129 = add <4 x i32> %vec.ind117, splat (i32 10)
  %130 = add <4 x i32> %vec.ind117, splat (i32 14)
  %131 = uitofp nneg <4 x i32> %129 to <4 x float>
  %132 = uitofp nneg <4 x i32> %130 to <4 x float>
  %133 = fmul nnan <4 x float> %broadcast.splat114, %131
  %134 = fmul nnan <4 x float> %broadcast.splat114, %132
  %135 = fmul nnan <4 x float> %133, splat (float f0x3B000000)
  %136 = fmul nnan <4 x float> %134, splat (float f0x3B000000)
  %137 = getelementptr [4 x i8], ptr %116, i64 %index116
  %138 = getelementptr i8, ptr %137, i64 32
  %139 = getelementptr i8, ptr %137, i64 48
  store <4 x float> %135, ptr %138, align 4
  store <4 x float> %136, ptr %139, align 4
  %index.next119.1 = add nuw nsw i64 %index116, 16
  %vec.ind.next120.1 = add <4 x i32> %vec.ind117, splat (i32 16)
  %140 = icmp eq i64 %index.next119.1, 512
  br i1 %140, label %._crit_edge69.i, label %vector.body115, !llvm.loop !23

._crit_edge69.i:                                  ; preds = %vector.body115
  %indvars.iv.next104.i = add nuw nsw i64 %indvars.iv103.i, 1
  %exitcond107.not.i = icmp eq i64 %indvars.iv.next104.i, 512
  br i1 %exitcond107.not.i, label %_Z10init_arrayiiiiiPA512_fS0_S0_S0_.exit, label %.preheader.i

_Z10init_arrayiiiiiPA512_fS0_S0_S0_.exit:         ; preds = %._crit_edge69.i
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  %141 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %5, i32 noundef 0) #4
  %142 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %5) #4
  %143 = call i32 @cudaSetDevice(i32 noundef 0) #4
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @_Z7mm3CudaiiiiiPA512_fS0_S0_S0_S0_S0_S0_S0_(i32 noundef 512, i32 noundef 512, i32 noundef 512, i32 noundef 512, i32 noundef 512, ptr noundef %20, ptr noundef %25, ptr noundef %35, ptr noundef nonnull %40, ptr noundef %15, ptr noundef %30, ptr noundef %45, ptr noundef %50) #4
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %144 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #15
  %.not.i.i74 = icmp eq i32 %144, 0
  br i1 %.not.i.i74, label %_Z21polybench_timer_startv.exit, label %145

145:                                              ; preds = %_Z10init_arrayiiiiiPA512_fS0_S0_S0_.exit
  %146 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %144) #4
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiiiiiPA512_fS0_S0_S0_.exit, %145
  %147 = load i64, ptr %4, align 8
  %148 = sitofp i64 %147 to double
  %149 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %150 = load i64, ptr %149, align 8
  %151 = sitofp i64 %150 to double
  %152 = fmul nnan double %151, f0x3EB0C6F7A0B5ED8D
  %153 = fadd double %152, %148
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %153, ptr @polybench_t_start, align 8
  br label %.preheader73.us.i

.preheader73.us.i:                                ; preds = %._crit_edge77.split.us.us.i, %_Z21polybench_timer_startv.exit
  %indvars.iv121.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next122.i, %._crit_edge77.split.us.us.i ]
  %154 = getelementptr [2048 x i8], ptr %20, i64 %indvars.iv121.i
  %155 = getelementptr [2048 x i8], ptr %25, i64 %indvars.iv121.i
  br label %.lr.ph.us.us.i

.lr.ph.us.us.i:                                   ; preds = %._crit_edge.us.us.i, %.preheader73.us.i
  %indvars.iv116.i = phi i64 [ %indvars.iv.next117.i, %._crit_edge.us.us.i ], [ 0, %.preheader73.us.i ]
  %156 = getelementptr [4 x i8], ptr %154, i64 %indvars.iv116.i
  store float 0.000000e+00, ptr %156, align 4
  %invariant.gep.us.us.i = getelementptr [4 x i8], ptr %35, i64 %indvars.iv116.i
  br label %157

157:                                              ; preds = %157, %.lr.ph.us.us.i
  %indvars.iv.i75 = phi i64 [ 0, %.lr.ph.us.us.i ], [ %indvars.iv.next.i76.1, %157 ]
  %158 = phi float [ 0.000000e+00, %.lr.ph.us.us.i ], [ %168, %157 ]
  %159 = getelementptr [4 x i8], ptr %155, i64 %indvars.iv.i75
  %160 = load float, ptr %159, align 4
  %gep.us.us.i = getelementptr [2048 x i8], ptr %invariant.gep.us.us.i, i64 %indvars.iv.i75
  %161 = load float, ptr %gep.us.us.i, align 4
  %162 = fmul float %160, %161
  %163 = fadd float %158, %162
  store float %163, ptr %156, align 4
  %indvars.iv.next.i76 = or disjoint i64 %indvars.iv.i75, 1
  %164 = getelementptr [4 x i8], ptr %155, i64 %indvars.iv.next.i76
  %165 = load float, ptr %164, align 4
  %gep.us.us.i.1 = getelementptr [2048 x i8], ptr %invariant.gep.us.us.i, i64 %indvars.iv.next.i76
  %166 = load float, ptr %gep.us.us.i.1, align 4
  %167 = fmul float %165, %166
  %168 = fadd float %163, %167
  store float %168, ptr %156, align 4
  %indvars.iv.next.i76.1 = add nuw nsw i64 %indvars.iv.i75, 2
  %exitcond112.not.i.1 = icmp eq i64 %indvars.iv.next.i76.1, 512
  br i1 %exitcond112.not.i.1, label %._crit_edge.us.us.i, label %157

._crit_edge.us.us.i:                              ; preds = %157
  %indvars.iv.next117.i = add nuw nsw i64 %indvars.iv116.i, 1
  %exitcond120.not.i = icmp eq i64 %indvars.iv.next117.i, 512
  br i1 %exitcond120.not.i, label %._crit_edge77.split.us.us.i, label %.lr.ph.us.us.i

._crit_edge77.split.us.us.i:                      ; preds = %._crit_edge.us.us.i
  %indvars.iv.next122.i = add nuw nsw i64 %indvars.iv121.i, 1
  %exitcond125.not.i = icmp eq i64 %indvars.iv.next122.i, 512
  br i1 %exitcond125.not.i, label %.preheader71.us.i, label %.preheader73.us.i

.preheader71.us.i:                                ; preds = %._crit_edge77.split.us.us.i, %._crit_edge84.split.us.us.i
  %indvars.iv148.i = phi i64 [ %indvars.iv.next149.i, %._crit_edge84.split.us.us.i ], [ 0, %._crit_edge77.split.us.us.i ]
  %169 = getelementptr [2048 x i8], ptr %40, i64 %indvars.iv148.i
  %170 = getelementptr [2048 x i8], ptr %15, i64 %indvars.iv148.i
  br label %.lr.ph.us.us86.i

.lr.ph.us.us86.i:                                 ; preds = %._crit_edge.us.us90.i, %.preheader71.us.i
  %indvars.iv143.i = phi i64 [ %indvars.iv.next144.i, %._crit_edge.us.us90.i ], [ 0, %.preheader71.us.i ]
  %171 = getelementptr [4 x i8], ptr %169, i64 %indvars.iv143.i
  store float 0.000000e+00, ptr %171, align 4
  %invariant.gep.us.us87.i = getelementptr [4 x i8], ptr %30, i64 %indvars.iv143.i
  br label %172

172:                                              ; preds = %172, %.lr.ph.us.us86.i
  %indvars.iv135.i = phi i64 [ 0, %.lr.ph.us.us86.i ], [ %indvars.iv.next136.i.1, %172 ]
  %173 = phi float [ 0.000000e+00, %.lr.ph.us.us86.i ], [ %183, %172 ]
  %174 = getelementptr [4 x i8], ptr %170, i64 %indvars.iv135.i
  %175 = load float, ptr %174, align 4
  %gep.us.us89.i = getelementptr [2048 x i8], ptr %invariant.gep.us.us87.i, i64 %indvars.iv135.i
  %176 = load float, ptr %gep.us.us89.i, align 4
  %177 = fmul float %175, %176
  %178 = fadd float %173, %177
  store float %178, ptr %171, align 4
  %indvars.iv.next136.i = or disjoint i64 %indvars.iv135.i, 1
  %179 = getelementptr [4 x i8], ptr %170, i64 %indvars.iv.next136.i
  %180 = load float, ptr %179, align 4
  %gep.us.us89.i.1 = getelementptr [2048 x i8], ptr %invariant.gep.us.us87.i, i64 %indvars.iv.next136.i
  %181 = load float, ptr %gep.us.us89.i.1, align 4
  %182 = fmul float %180, %181
  %183 = fadd float %178, %182
  store float %183, ptr %171, align 4
  %indvars.iv.next136.i.1 = add nuw nsw i64 %indvars.iv135.i, 2
  %exitcond139.not.i.1 = icmp eq i64 %indvars.iv.next136.i.1, 512
  br i1 %exitcond139.not.i.1, label %._crit_edge.us.us90.i, label %172

._crit_edge.us.us90.i:                            ; preds = %172
  %indvars.iv.next144.i = add nuw nsw i64 %indvars.iv143.i, 1
  %exitcond147.not.i = icmp eq i64 %indvars.iv.next144.i, 512
  br i1 %exitcond147.not.i, label %._crit_edge84.split.us.us.i, label %.lr.ph.us.us86.i

._crit_edge84.split.us.us.i:                      ; preds = %._crit_edge.us.us90.i
  %indvars.iv.next149.i = add nuw nsw i64 %indvars.iv148.i, 1
  %exitcond152.not.i = icmp eq i64 %indvars.iv.next149.i, 512
  br i1 %exitcond152.not.i, label %.preheader.us.i, label %.preheader71.us.i

.preheader.us.i:                                  ; preds = %._crit_edge84.split.us.us.i, %._crit_edge96.split.us.us.i
  %indvars.iv175.i = phi i64 [ %indvars.iv.next176.i, %._crit_edge96.split.us.us.i ], [ 0, %._crit_edge84.split.us.us.i ]
  %184 = getelementptr [2048 x i8], ptr %45, i64 %indvars.iv175.i
  %185 = getelementptr [2048 x i8], ptr %20, i64 %indvars.iv175.i
  br label %.lr.ph.us.us98.i

.lr.ph.us.us98.i:                                 ; preds = %._crit_edge.us.us102.i, %.preheader.us.i
  %indvars.iv170.i = phi i64 [ %indvars.iv.next171.i, %._crit_edge.us.us102.i ], [ 0, %.preheader.us.i ]
  %186 = getelementptr [4 x i8], ptr %184, i64 %indvars.iv170.i
  store float 0.000000e+00, ptr %186, align 4
  %invariant.gep.us.us99.i = getelementptr [4 x i8], ptr %40, i64 %indvars.iv170.i
  br label %187

187:                                              ; preds = %187, %.lr.ph.us.us98.i
  %indvars.iv162.i = phi i64 [ 0, %.lr.ph.us.us98.i ], [ %indvars.iv.next163.i.1, %187 ]
  %188 = phi float [ 0.000000e+00, %.lr.ph.us.us98.i ], [ %198, %187 ]
  %189 = getelementptr [4 x i8], ptr %185, i64 %indvars.iv162.i
  %190 = load float, ptr %189, align 4
  %gep.us.us101.i = getelementptr [2048 x i8], ptr %invariant.gep.us.us99.i, i64 %indvars.iv162.i
  %191 = load float, ptr %gep.us.us101.i, align 4
  %192 = fmul float %190, %191
  %193 = fadd float %188, %192
  store float %193, ptr %186, align 4
  %indvars.iv.next163.i = or disjoint i64 %indvars.iv162.i, 1
  %194 = getelementptr [4 x i8], ptr %185, i64 %indvars.iv.next163.i
  %195 = load float, ptr %194, align 4
  %gep.us.us101.i.1 = getelementptr [2048 x i8], ptr %invariant.gep.us.us99.i, i64 %indvars.iv.next163.i
  %196 = load float, ptr %gep.us.us101.i.1, align 4
  %197 = fmul float %195, %196
  %198 = fadd float %193, %197
  store float %198, ptr %186, align 4
  %indvars.iv.next163.i.1 = add nuw nsw i64 %indvars.iv162.i, 2
  %exitcond166.not.i.1 = icmp eq i64 %indvars.iv.next163.i.1, 512
  br i1 %exitcond166.not.i.1, label %._crit_edge.us.us102.i, label %187

._crit_edge.us.us102.i:                           ; preds = %187
  %indvars.iv.next171.i = add nuw nsw i64 %indvars.iv170.i, 1
  %exitcond174.not.i = icmp eq i64 %indvars.iv.next171.i, 512
  br i1 %exitcond174.not.i, label %._crit_edge96.split.us.us.i, label %.lr.ph.us.us98.i

._crit_edge96.split.us.us.i:                      ; preds = %._crit_edge.us.us102.i
  %indvars.iv.next176.i = add nuw nsw i64 %indvars.iv175.i, 1
  %exitcond179.not.i = icmp eq i64 %indvars.iv.next176.i, 512
  br i1 %exitcond179.not.i, label %_Z7mm3_cpuiiiiiPA512_fS0_S0_S0_S0_S0_S0_.exit, label %.preheader.us.i

_Z7mm3_cpuiiiiiPA512_fS0_S0_S0_S0_S0_S0_.exit:    ; preds = %._crit_edge96.split.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %199 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #15
  %.not.i.i78 = icmp eq i32 %199, 0
  br i1 %.not.i.i78, label %_Z20polybench_timer_stopv.exit, label %200

200:                                              ; preds = %_Z7mm3_cpuiiiiiPA512_fS0_S0_S0_S0_S0_S0_.exit
  %201 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %199) #4
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z7mm3_cpuiiiiiPA512_fS0_S0_S0_S0_S0_S0_.exit, %200
  %202 = load i64, ptr %3, align 8
  %203 = sitofp i64 %202 to double
  %204 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %205 = load i64, ptr %204, align 8
  %206 = sitofp i64 %205 to double
  %207 = fmul nnan double %206, f0x3EB0C6F7A0B5ED8D
  %208 = fadd double %207, %203
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %208, ptr @polybench_t_end, align 8
  %209 = load double, ptr @polybench_t_start, align 8
  %210 = fsub double %208, %209
  %211 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %210) #4
  br label %.preheader.us.i79

.preheader.us.i79:                                ; preds = %._crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv23.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next24.i, %._crit_edge.us.i ]
  %.018.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %248, %._crit_edge.us.i ]
  %212 = getelementptr [2048 x i8], ptr %45, i64 %indvars.iv23.i
  %213 = getelementptr [2048 x i8], ptr %50, i64 %indvars.iv23.i
  %214 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.018.us.i, i64 0
  br label %vector.body123

vector.body123:                                   ; preds = %vector.body123, %.preheader.us.i79
  %index124 = phi i64 [ 0, %.preheader.us.i79 ], [ %index.next126, %vector.body123 ]
  %vec.phi = phi <4 x i32> [ %214, %.preheader.us.i79 ], [ %246, %vector.body123 ]
  %215 = getelementptr [4 x i8], ptr %212, i64 %index124
  %wide.load = load <4 x float>, ptr %215, align 4
  %216 = fpext <4 x float> %wide.load to <4 x double>
  %217 = getelementptr [4 x i8], ptr %213, i64 %index124
  %wide.load125 = load <4 x float>, ptr %217, align 4
  %218 = fpext <4 x float> %wide.load125 to <4 x double>
  %219 = fcmp olt <4 x double> %216, splat (double f0xB690000000000000)
  %220 = fneg <4 x float> %wide.load
  %221 = select <4 x i1> %219, <4 x float> %220, <4 x float> %wide.load
  %222 = fpext <4 x float> %221 to <4 x double>
  %223 = fcmp uge <4 x double> %222, splat (double 1.000000e-02)
  %224 = fcmp olt <4 x double> %218, splat (double f0xB690000000000000)
  %225 = fneg <4 x float> %wide.load125
  %226 = select <4 x i1> %224, <4 x float> %225, <4 x float> %wide.load125
  %227 = fpext <4 x float> %226 to <4 x double>
  %228 = fcmp uge <4 x double> %227, splat (double 1.000000e-02)
  %229 = fsub <4 x double> %216, %218
  %230 = fptrunc <4 x double> %229 to <4 x float>
  %231 = fcmp olt <4 x double> %229, splat (double f0xB690000000000000)
  %232 = fneg <4 x float> %230
  %233 = select <4 x i1> %231, <4 x float> %232, <4 x float> %230
  %234 = fadd <4 x double> %216, splat (double f0x3E45798EE0000000)
  %235 = fptrunc <4 x double> %234 to <4 x float>
  %236 = fcmp olt <4 x double> %234, splat (double f0xB690000000000000)
  %237 = fneg <4 x float> %235
  %238 = select <4 x i1> %236, <4 x float> %237, <4 x float> %235
  %239 = fdiv <4 x float> %233, %238
  %240 = fcmp olt <4 x float> %239, zeroinitializer
  %241 = fneg <4 x float> %239
  %242 = select <4 x i1> %240, <4 x float> %241, <4 x float> %239
  %243 = fmul <4 x float> %242, splat (float 1.000000e+02)
  %244 = fpext <4 x float> %243 to <4 x double>
  %245 = fcmp ogt <4 x double> %244, splat (double 5.000000e-02)
  %.not129 = select <4 x i1> %223, <4 x i1> splat (i1 true), <4 x i1> %228
  %narrow = select <4 x i1> %.not129, <4 x i1> %245, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %246 = add <4 x i32> %vec.phi, %predphi
  %index.next126 = add nuw i64 %index124, 4
  %247 = icmp eq i64 %index.next126, 512
  br i1 %247, label %._crit_edge.us.i, label %vector.body123, !llvm.loop !24

._crit_edge.us.i:                                 ; preds = %vector.body123
  %248 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %246)
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1
  %exitcond27.not.i = icmp eq i64 %indvars.iv.next24.i, 512
  br i1 %exitcond27.not.i, label %_Z14compareResultsiiPA512_fS0_.exit, label %.preheader.us.i79

_Z14compareResultsiiPA512_fS0_.exit:              ; preds = %._crit_edge.us.i
  %249 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %248) #4
  call void @free(ptr noundef %20) #15
  call void @free(ptr noundef %25) #15
  call void @free(ptr noundef %35) #15
  call void @free(ptr noundef %40) #15
  call void @free(ptr noundef %15) #15
  call void @free(ptr noundef %30) #15
  call void @free(ptr noundef nonnull %45) #15
  call void @free(ptr noundef nonnull %50) #15
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
!4 = distinct !{!4, !3, !2}
!5 = distinct !{!5, !2, !3}
!6 = distinct !{!6, !3, !2}
!7 = distinct !{!7, !2, !3}
!8 = distinct !{!8, !3, !2}
!9 = distinct !{!9, !2, !3}
!10 = distinct !{!10, !3, !2}
!11 = distinct !{!11, !2, !3}
!12 = distinct !{!12, !3, !2}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = !{ptr @_Z26__device_stub__mm3_kernel1iiiiiPfS_S_}
!18 = !{ptr @_Z26__device_stub__mm3_kernel2iiiiiPfS_S_}
!19 = !{ptr @_Z26__device_stub__mm3_kernel3iiiiiPfS_S_}
!20 = distinct !{!20, !2, !3}
!21 = distinct !{!21, !2, !3}
!22 = distinct !{!22, !2, !3}
!23 = distinct !{!23, !2, !3}
!24 = distinct !{!24, !2, !3}
