; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/2MM/2mm.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/2MM/2mm.cu"
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
define dso_local void @_Z10init_arrayiiiiPfS_PA1024_fS1_S1_S1_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %4, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %5, ptr nofree noundef writeonly captures(none) %6, ptr nofree noundef writeonly captures(none) %7, ptr nofree noundef writeonly captures(none) %8, ptr nofree noundef writeonly captures(none) %9) local_unnamed_addr #1 {
  store float 3.241200e+04, ptr %4, align 4
  store float 2.123000e+03, ptr %5, align 4
  %11 = icmp sgt i32 %0, 0
  %12 = icmp sgt i32 %2, 0
  %or.cond = and i1 %11, %12
  br i1 %or.cond, label %.preheader56.preheader, label %.preheader55

.preheader56.preheader:                           ; preds = %10
  %wide.trip.count76 = zext nneg i32 %0 to i64
  %wide.trip.count = zext nneg i32 %2 to i64
  %min.iters.check = icmp ult i32 %2, 8
  %n.vec = and i64 %wide.trip.count, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %.preheader56

.preheader56:                                     ; preds = %.preheader56.preheader, %._crit_edge
  %indvars.iv73 = phi i64 [ 0, %.preheader56.preheader ], [ %indvars.iv.next74, %._crit_edge ]
  %13 = trunc nuw nsw i64 %indvars.iv73 to i32
  %14 = uitofp nneg i32 %13 to float
  %15 = getelementptr [4096 x i8], ptr %6, i64 %indvars.iv73
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader56
  %broadcast.splatinsert = insertelement <4 x float> poison, float %14, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %16 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %17 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %18 = fmul nnan <4 x float> %broadcast.splat, %16
  %19 = fmul nnan <4 x float> %broadcast.splat, %17
  %20 = fmul nnan <4 x float> %18, splat (float f0x3A800000)
  %21 = fmul nnan <4 x float> %19, splat (float f0x3A800000)
  %22 = getelementptr [4 x i8], ptr %15, i64 %index
  %23 = getelementptr i8, ptr %22, i64 16
  store <4 x float> %20, ptr %22, align 4
  store <4 x float> %21, ptr %23, align 4
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader56, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader56 ], [ %n.vec, %middle.block ]
  br label %scalar.ph

.preheader55:                                     ; preds = %._crit_edge, %10
  %25 = icmp sgt i32 %1, 0
  %or.cond69 = and i1 %12, %25
  br i1 %or.cond69, label %.preheader54.preheader, label %.preheader53

.preheader54.preheader:                           ; preds = %.preheader55
  %wide.trip.count86 = zext nneg i32 %2 to i64
  %wide.trip.count81 = zext nneg i32 %1 to i64
  %min.iters.check115 = icmp ult i32 %1, 8
  %n.vec118 = and i64 %wide.trip.count81, 2147483640
  %cmp.n128 = icmp eq i64 %n.vec118, %wide.trip.count81
  br label %.preheader54

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %26 = trunc nuw nsw i64 %indvars.iv to i32
  %27 = uitofp nneg i32 %26 to float
  %28 = fmul nnan float %14, %27
  %29 = fmul nnan float %28, f0x3A800000
  %30 = getelementptr [4 x i8], ptr %15, i64 %indvars.iv
  store float %29, ptr %30, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !4

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond77.not = icmp eq i64 %indvars.iv.next74, %wide.trip.count76
  br i1 %exitcond77.not, label %.preheader55, label %.preheader56

.preheader54:                                     ; preds = %.preheader54.preheader, %._crit_edge60
  %indvars.iv83 = phi i64 [ 0, %.preheader54.preheader ], [ %indvars.iv.next84, %._crit_edge60 ]
  %31 = trunc nuw nsw i64 %indvars.iv83 to i32
  %32 = uitofp nneg i32 %31 to float
  %33 = getelementptr [4096 x i8], ptr %7, i64 %indvars.iv83
  br i1 %min.iters.check115, label %scalar.ph114.preheader, label %vector.ph116

vector.ph116:                                     ; preds = %.preheader54
  %broadcast.splatinsert119 = insertelement <4 x float> poison, float %32, i64 0
  %broadcast.splat120 = shufflevector <4 x float> %broadcast.splatinsert119, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body121

vector.body121:                                   ; preds = %vector.body121, %vector.ph116
  %index122 = phi i64 [ 0, %vector.ph116 ], [ %index.next125, %vector.body121 ]
  %vec.ind123 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph116 ], [ %vec.ind.next126, %vector.body121 ]
  %34 = trunc <4 x i64> %vec.ind123 to <4 x i32>
  %35 = add <4 x i32> %34, splat (i32 1)
  %36 = trunc <4 x i64> %vec.ind123 to <4 x i32>
  %37 = add <4 x i32> %36, splat (i32 5)
  %38 = uitofp nneg <4 x i32> %35 to <4 x float>
  %39 = uitofp nneg <4 x i32> %37 to <4 x float>
  %40 = fmul nnan <4 x float> %broadcast.splat120, %38
  %41 = fmul nnan <4 x float> %broadcast.splat120, %39
  %42 = fmul nnan <4 x float> %40, splat (float f0x3A800000)
  %43 = fmul nnan <4 x float> %41, splat (float f0x3A800000)
  %44 = getelementptr [4 x i8], ptr %33, i64 %index122
  %45 = getelementptr i8, ptr %44, i64 16
  store <4 x float> %42, ptr %44, align 4
  store <4 x float> %43, ptr %45, align 4
  %index.next125 = add nuw i64 %index122, 8
  %vec.ind.next126 = add nuw <4 x i64> %vec.ind123, splat (i64 8)
  %46 = icmp eq i64 %index.next125, %n.vec118
  br i1 %46, label %middle.block127, label %vector.body121, !llvm.loop !5

middle.block127:                                  ; preds = %vector.body121
  br i1 %cmp.n128, label %._crit_edge60, label %scalar.ph114.preheader

scalar.ph114.preheader:                           ; preds = %.preheader54, %middle.block127
  %indvars.iv78.ph = phi i64 [ 0, %.preheader54 ], [ %n.vec118, %middle.block127 ]
  br label %scalar.ph114

.preheader53:                                     ; preds = %._crit_edge60, %.preheader55
  %47 = icmp sgt i32 %3, 0
  %or.cond70 = and i1 %47, %25
  br i1 %or.cond70, label %.preheader52.preheader, label %.preheader51

.preheader52.preheader:                           ; preds = %.preheader53
  %wide.trip.count96 = zext nneg i32 %3 to i64
  %wide.trip.count91 = zext nneg i32 %1 to i64
  %min.iters.check131 = icmp ult i32 %1, 8
  %n.vec134 = and i64 %wide.trip.count91, 2147483640
  %cmp.n144 = icmp eq i64 %n.vec134, %wide.trip.count91
  br label %.preheader52

scalar.ph114:                                     ; preds = %scalar.ph114.preheader, %scalar.ph114
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %scalar.ph114 ], [ %indvars.iv78.ph, %scalar.ph114.preheader ]
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %48 = trunc nuw nsw i64 %indvars.iv.next79 to i32
  %49 = uitofp nneg i32 %48 to float
  %50 = fmul nnan float %32, %49
  %51 = fmul nnan float %50, f0x3A800000
  %52 = getelementptr [4 x i8], ptr %33, i64 %indvars.iv78
  store float %51, ptr %52, align 4
  %exitcond82.not = icmp eq i64 %indvars.iv.next79, %wide.trip.count81
  br i1 %exitcond82.not, label %._crit_edge60, label %scalar.ph114, !llvm.loop !6

._crit_edge60:                                    ; preds = %scalar.ph114, %middle.block127
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond87.not = icmp eq i64 %indvars.iv.next84, %wide.trip.count86
  br i1 %exitcond87.not, label %.preheader53, label %.preheader54

.preheader52:                                     ; preds = %.preheader52.preheader, %._crit_edge63
  %indvars.iv93 = phi i64 [ 0, %.preheader52.preheader ], [ %indvars.iv.next94, %._crit_edge63 ]
  %53 = trunc nuw nsw i64 %indvars.iv93 to i32
  %54 = uitofp nneg i32 %53 to float
  %55 = getelementptr [4096 x i8], ptr %8, i64 %indvars.iv93
  br i1 %min.iters.check131, label %scalar.ph130.preheader, label %vector.ph132

vector.ph132:                                     ; preds = %.preheader52
  %broadcast.splatinsert135 = insertelement <4 x float> poison, float %54, i64 0
  %broadcast.splat136 = shufflevector <4 x float> %broadcast.splatinsert135, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body137

vector.body137:                                   ; preds = %vector.body137, %vector.ph132
  %index138 = phi i64 [ 0, %vector.ph132 ], [ %index.next141, %vector.body137 ]
  %vec.ind139 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph132 ], [ %vec.ind.next142, %vector.body137 ]
  %56 = add <4 x i32> %vec.ind139, splat (i32 3)
  %57 = add <4 x i32> %vec.ind139, splat (i32 7)
  %58 = uitofp nneg <4 x i32> %56 to <4 x float>
  %59 = uitofp nneg <4 x i32> %57 to <4 x float>
  %60 = fmul nnan <4 x float> %broadcast.splat136, %58
  %61 = fmul nnan <4 x float> %broadcast.splat136, %59
  %62 = fmul nnan <4 x float> %60, splat (float f0x3A800000)
  %63 = fmul nnan <4 x float> %61, splat (float f0x3A800000)
  %64 = getelementptr [4 x i8], ptr %55, i64 %index138
  %65 = getelementptr i8, ptr %64, i64 16
  store <4 x float> %62, ptr %64, align 4
  store <4 x float> %63, ptr %65, align 4
  %index.next141 = add nuw i64 %index138, 8
  %vec.ind.next142 = add <4 x i32> %vec.ind139, splat (i32 8)
  %66 = icmp eq i64 %index.next141, %n.vec134
  br i1 %66, label %middle.block143, label %vector.body137, !llvm.loop !7

middle.block143:                                  ; preds = %vector.body137
  br i1 %cmp.n144, label %._crit_edge63, label %scalar.ph130.preheader

scalar.ph130.preheader:                           ; preds = %.preheader52, %middle.block143
  %indvars.iv88.ph = phi i64 [ 0, %.preheader52 ], [ %n.vec134, %middle.block143 ]
  br label %scalar.ph130

.preheader51:                                     ; preds = %._crit_edge63, %.preheader53
  %or.cond71 = and i1 %11, %47
  br i1 %or.cond71, label %.preheader.preheader, label %._crit_edge68.split

.preheader.preheader:                             ; preds = %.preheader51
  %wide.trip.count106 = zext nneg i32 %0 to i64
  %wide.trip.count101 = zext nneg i32 %3 to i64
  %min.iters.check147 = icmp ult i32 %3, 8
  %n.vec150 = and i64 %wide.trip.count101, 2147483640
  %cmp.n160 = icmp eq i64 %n.vec150, %wide.trip.count101
  br label %.preheader

scalar.ph130:                                     ; preds = %scalar.ph130.preheader, %scalar.ph130
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %scalar.ph130 ], [ %indvars.iv88.ph, %scalar.ph130.preheader ]
  %67 = trunc i64 %indvars.iv88 to i32
  %68 = add i32 %67, 3
  %69 = uitofp nneg i32 %68 to float
  %70 = fmul nnan float %54, %69
  %71 = fmul nnan float %70, f0x3A800000
  %72 = getelementptr [4 x i8], ptr %55, i64 %indvars.iv88
  store float %71, ptr %72, align 4
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond92.not = icmp eq i64 %indvars.iv.next89, %wide.trip.count91
  br i1 %exitcond92.not, label %._crit_edge63, label %scalar.ph130, !llvm.loop !8

._crit_edge63:                                    ; preds = %scalar.ph130, %middle.block143
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond97.not = icmp eq i64 %indvars.iv.next94, %wide.trip.count96
  br i1 %exitcond97.not, label %.preheader51, label %.preheader52

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge66
  %indvars.iv103 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next104, %._crit_edge66 ]
  %73 = trunc nuw nsw i64 %indvars.iv103 to i32
  %74 = uitofp nneg i32 %73 to float
  %75 = getelementptr [4096 x i8], ptr %9, i64 %indvars.iv103
  br i1 %min.iters.check147, label %scalar.ph146.preheader, label %vector.ph148

vector.ph148:                                     ; preds = %.preheader
  %broadcast.splatinsert151 = insertelement <4 x float> poison, float %74, i64 0
  %broadcast.splat152 = shufflevector <4 x float> %broadcast.splatinsert151, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body153

vector.body153:                                   ; preds = %vector.body153, %vector.ph148
  %index154 = phi i64 [ 0, %vector.ph148 ], [ %index.next157, %vector.body153 ]
  %vec.ind155 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph148 ], [ %vec.ind.next158, %vector.body153 ]
  %76 = add <4 x i32> %vec.ind155, splat (i32 2)
  %77 = add <4 x i32> %vec.ind155, splat (i32 6)
  %78 = uitofp nneg <4 x i32> %76 to <4 x float>
  %79 = uitofp nneg <4 x i32> %77 to <4 x float>
  %80 = fmul nnan <4 x float> %broadcast.splat152, %78
  %81 = fmul nnan <4 x float> %broadcast.splat152, %79
  %82 = fmul nnan <4 x float> %80, splat (float f0x3A800000)
  %83 = fmul nnan <4 x float> %81, splat (float f0x3A800000)
  %84 = getelementptr [4 x i8], ptr %75, i64 %index154
  %85 = getelementptr i8, ptr %84, i64 16
  store <4 x float> %82, ptr %84, align 4
  store <4 x float> %83, ptr %85, align 4
  %index.next157 = add nuw i64 %index154, 8
  %vec.ind.next158 = add <4 x i32> %vec.ind155, splat (i32 8)
  %86 = icmp eq i64 %index.next157, %n.vec150
  br i1 %86, label %middle.block159, label %vector.body153, !llvm.loop !9

middle.block159:                                  ; preds = %vector.body153
  br i1 %cmp.n160, label %._crit_edge66, label %scalar.ph146.preheader

scalar.ph146.preheader:                           ; preds = %.preheader, %middle.block159
  %indvars.iv98.ph = phi i64 [ 0, %.preheader ], [ %n.vec150, %middle.block159 ]
  br label %scalar.ph146

scalar.ph146:                                     ; preds = %scalar.ph146.preheader, %scalar.ph146
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %scalar.ph146 ], [ %indvars.iv98.ph, %scalar.ph146.preheader ]
  %87 = trunc i64 %indvars.iv98 to i32
  %88 = add i32 %87, 2
  %89 = uitofp nneg i32 %88 to float
  %90 = fmul nnan float %74, %89
  %91 = fmul nnan float %90, f0x3A800000
  %92 = getelementptr [4 x i8], ptr %75, i64 %indvars.iv98
  store float %91, ptr %92, align 4
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond102.not = icmp eq i64 %indvars.iv.next99, %wide.trip.count101
  br i1 %exitcond102.not, label %._crit_edge66, label %scalar.ph146, !llvm.loop !10

._crit_edge66:                                    ; preds = %scalar.ph146, %middle.block159
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond107.not = icmp eq i64 %indvars.iv.next104, %wide.trip.count106
  br i1 %exitcond107.not, label %._crit_edge68.split, label %.preheader

._crit_edge68.split:                              ; preds = %._crit_edge66, %.preheader51
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiiPA1024_fS0_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #3 {
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
  %7 = getelementptr [4096 x i8], ptr %2, i64 %indvars.iv23
  %8 = getelementptr [4096 x i8], ptr %3, i64 %indvars.iv23
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

define dso_local void @_Z26__device_stub__mm2_kernel1iiiiffPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, float noundef %4, float noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8) #5 {
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  store i32 %0, ptr %10, align 4
  store i32 %1, ptr %11, align 4
  store i32 %2, ptr %12, align 4
  store i32 %3, ptr %13, align 4
  store float %4, ptr %14, align 4
  store float %5, ptr %15, align 4
  store ptr %6, ptr %16, align 8
  store ptr %7, ptr %17, align 8
  store ptr %8, ptr %18, align 8
  %19 = alloca [9 x ptr], align 16
  store ptr %10, ptr %19, align 16
  %20 = getelementptr inbounds nuw i8, ptr %19, i64 8
  store ptr %11, ptr %20, align 8
  %21 = getelementptr inbounds nuw i8, ptr %19, i64 16
  store ptr %12, ptr %21, align 16
  %22 = getelementptr inbounds nuw i8, ptr %19, i64 24
  store ptr %13, ptr %22, align 8
  %23 = getelementptr inbounds nuw i8, ptr %19, i64 32
  store ptr %14, ptr %23, align 16
  %24 = getelementptr inbounds nuw i8, ptr %19, i64 40
  store ptr %15, ptr %24, align 8
  %25 = getelementptr inbounds nuw i8, ptr %19, i64 48
  store ptr %16, ptr %25, align 16
  %26 = getelementptr inbounds nuw i8, ptr %19, i64 56
  store ptr %17, ptr %26, align 8
  %27 = getelementptr inbounds nuw i8, ptr %19, i64 64
  store ptr %18, ptr %27, align 16
  %28 = alloca %struct.dim3, align 8
  %29 = alloca %struct.dim3, align 8
  %30 = alloca i64, align 8
  %31 = alloca ptr, align 8
  %32 = call i32 @__cudaPopCallConfiguration(ptr nonnull %28, ptr nonnull %29, ptr nonnull %30, ptr nonnull %31)
  %33 = load i64, ptr %30, align 8
  %34 = load ptr, ptr %31, align 8
  %.fca.0.load2 = load i32, ptr %28, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %28, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %28, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %29, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %29, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %29, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %35 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm2_kernel1iiiiffPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %19, i64 noundef %33, ptr noundef %34)
  ret void
}

define dso_local void @_Z26__device_stub__mm2_kernel2iiiiffPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, float noundef %4, float noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8) #5 {
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  store i32 %0, ptr %10, align 4
  store i32 %1, ptr %11, align 4
  store i32 %2, ptr %12, align 4
  store i32 %3, ptr %13, align 4
  store float %4, ptr %14, align 4
  store float %5, ptr %15, align 4
  store ptr %6, ptr %16, align 8
  store ptr %7, ptr %17, align 8
  store ptr %8, ptr %18, align 8
  %19 = alloca [9 x ptr], align 16
  store ptr %10, ptr %19, align 16
  %20 = getelementptr inbounds nuw i8, ptr %19, i64 8
  store ptr %11, ptr %20, align 8
  %21 = getelementptr inbounds nuw i8, ptr %19, i64 16
  store ptr %12, ptr %21, align 16
  %22 = getelementptr inbounds nuw i8, ptr %19, i64 24
  store ptr %13, ptr %22, align 8
  %23 = getelementptr inbounds nuw i8, ptr %19, i64 32
  store ptr %14, ptr %23, align 16
  %24 = getelementptr inbounds nuw i8, ptr %19, i64 40
  store ptr %15, ptr %24, align 8
  %25 = getelementptr inbounds nuw i8, ptr %19, i64 48
  store ptr %16, ptr %25, align 16
  %26 = getelementptr inbounds nuw i8, ptr %19, i64 56
  store ptr %17, ptr %26, align 8
  %27 = getelementptr inbounds nuw i8, ptr %19, i64 64
  store ptr %18, ptr %27, align 16
  %28 = alloca %struct.dim3, align 8
  %29 = alloca %struct.dim3, align 8
  %30 = alloca i64, align 8
  %31 = alloca ptr, align 8
  %32 = call i32 @__cudaPopCallConfiguration(ptr nonnull %28, ptr nonnull %29, ptr nonnull %30, ptr nonnull %31)
  %33 = load i64, ptr %30, align 8
  %34 = load ptr, ptr %31, align 8
  %.fca.0.load2 = load i32, ptr %28, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %28, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %28, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %29, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %29, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %29, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %35 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm2_kernel2iiiiffPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %19, i64 noundef %33, ptr noundef %34)
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z7mm2_cpuiiiiffPA1024_fS0_S0_S0_S0_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, float noundef %4, float noundef %5, ptr nofree noundef captures(none) %6, ptr nofree noundef readonly captures(none) %7, ptr nofree noundef readonly captures(none) %8, ptr nofree noundef readonly captures(none) %9, ptr nofree noundef captures(none) %10) local_unnamed_addr #6 {
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.preheader49.lr.ph, label %._crit_edge.split

.preheader49.lr.ph:                               ; preds = %11
  %13 = icmp sgt i32 %1, 0
  br i1 %13, label %.preheader49.lr.ph.split, label %.preheader.lr.ph

.preheader49.lr.ph.split:                         ; preds = %.preheader49.lr.ph
  %14 = icmp sgt i32 %2, 0
  br i1 %14, label %.preheader49.us.preheader, label %.preheader49.preheader

.preheader49.preheader:                           ; preds = %.preheader49.lr.ph.split
  %15 = zext nneg i32 %1 to i64
  %16 = shl nuw nsw i64 %15, 2
  %wide.trip.count = zext nneg i32 %0 to i64
  %xtraiter = and i64 %wide.trip.count, 7
  %17 = icmp ult i32 %0, 8
  br i1 %17, label %.preheader49.epil.preheader, label %.preheader49.preheader.new

.preheader49.preheader.new:                       ; preds = %.preheader49.preheader
  %unroll_iter = and i64 %wide.trip.count, 2147483640
  br label %.preheader49

.preheader49.us.preheader:                        ; preds = %.preheader49.lr.ph.split
  %wide.trip.count87 = zext nneg i32 %0 to i64
  %wide.trip.count82 = zext nneg i32 %1 to i64
  %wide.trip.count74 = zext nneg i32 %2 to i64
  %xtraiter124 = and i64 %wide.trip.count74, 1
  %18 = icmp eq i32 %2, 1
  %unroll_iter128 = and i64 %wide.trip.count74, 2147483646
  %lcmp.mod126.not = icmp eq i64 %xtraiter124, 0
  %lcmp.mod127 = trunc i32 %2 to i1
  br label %.preheader49.us

.preheader49.us:                                  ; preds = %.preheader49.us.preheader, %._crit_edge53.split.us.us
  %indvars.iv84 = phi i64 [ 0, %.preheader49.us.preheader ], [ %indvars.iv.next85, %._crit_edge53.split.us.us ]
  %19 = getelementptr [4096 x i8], ptr %6, i64 %indvars.iv84
  %20 = getelementptr [4096 x i8], ptr %7, i64 %indvars.iv84
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.preheader49.us
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %._crit_edge.us.us ], [ 0, %.preheader49.us ]
  %21 = getelementptr [4 x i8], ptr %19, i64 %indvars.iv79
  store float 0.000000e+00, ptr %21, align 4
  %invariant.gep.us.us = getelementptr [4 x i8], ptr %8, i64 %indvars.iv79
  br i1 %18, label %.epil.preheader, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %22 = phi float [ %34, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %niter129 = phi i64 [ %niter129.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %23 = getelementptr [4 x i8], ptr %20, i64 %indvars.iv
  %24 = load float, ptr %23, align 4
  %25 = fmul float %4, %24
  %gep.us.us = getelementptr [4096 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv
  %26 = load float, ptr %gep.us.us, align 4
  %27 = fmul float %25, %26
  %28 = fadd float %22, %27
  store float %28, ptr %21, align 4
  %indvars.iv.next = or disjoint i64 %indvars.iv, 1
  %29 = getelementptr [4 x i8], ptr %20, i64 %indvars.iv.next
  %30 = load float, ptr %29, align 4
  %31 = fmul float %4, %30
  %gep.us.us.1 = getelementptr [4096 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv.next
  %32 = load float, ptr %gep.us.us.1, align 4
  %33 = fmul float %31, %32
  %34 = fadd float %28, %33
  store float %34, ptr %21, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %niter129.next.1 = add i64 %niter129, 2
  %niter129.ncmp.1 = icmp eq i64 %niter129.next.1, %unroll_iter128
  br i1 %niter129.ncmp.1, label %._crit_edge.us.us.unr-lcssa, label %.lr.ph.us.us.new

._crit_edge.us.us.unr-lcssa:                      ; preds = %.lr.ph.us.us.new
  br i1 %lcmp.mod126.not, label %._crit_edge.us.us, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.us.us.unr-lcssa, %.lr.ph.us.us
  %indvars.iv.epil.init = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge.us.us.unr-lcssa ]
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.us.us ], [ %34, %._crit_edge.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod127)
  %35 = getelementptr [4 x i8], ptr %20, i64 %indvars.iv.epil.init
  %36 = load float, ptr %35, align 4
  %37 = fmul float %4, %36
  %gep.us.us.epil = getelementptr [4096 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv.epil.init
  %38 = load float, ptr %gep.us.us.epil, align 4
  %39 = fmul float %37, %38
  %40 = fadd float %.epil.init, %39
  store float %40, ptr %21, align 4
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.unr-lcssa, %.epil.preheader
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond83.not = icmp eq i64 %indvars.iv.next80, %wide.trip.count82
  br i1 %exitcond83.not, label %._crit_edge53.split.us.us, label %.lr.ph.us.us

._crit_edge53.split.us.us:                        ; preds = %._crit_edge.us.us
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond88.not = icmp eq i64 %indvars.iv.next85, %wide.trip.count87
  br i1 %exitcond88.not, label %.preheader48, label %.preheader49.us

.preheader49:                                     ; preds = %.preheader49, %.preheader49.preheader.new
  %indvar = phi i64 [ 0, %.preheader49.preheader.new ], [ %indvar.next.7, %.preheader49 ]
  %niter = phi i64 [ 0, %.preheader49.preheader.new ], [ %niter.next.7, %.preheader49 ]
  %41 = shl nuw nsw i64 %indvar, 12
  %scevgep = getelementptr i8, ptr %6, i64 %41
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep, i8 0, i64 %16, i1 false)
  %indvar.next = shl i64 %indvar, 12
  %42 = getelementptr i8, ptr %6, i64 %indvar.next
  %scevgep.1 = getelementptr i8, ptr %42, i64 4096
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.1, i8 0, i64 %16, i1 false)
  %indvar.next.1 = shl i64 %indvar, 12
  %43 = getelementptr i8, ptr %6, i64 %indvar.next.1
  %scevgep.2 = getelementptr i8, ptr %43, i64 8192
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.2, i8 0, i64 %16, i1 false)
  %indvar.next.2 = shl i64 %indvar, 12
  %44 = getelementptr i8, ptr %6, i64 %indvar.next.2
  %scevgep.3 = getelementptr i8, ptr %44, i64 12288
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.3, i8 0, i64 %16, i1 false)
  %indvar.next.3 = shl i64 %indvar, 12
  %45 = getelementptr i8, ptr %6, i64 %indvar.next.3
  %scevgep.4 = getelementptr i8, ptr %45, i64 16384
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.4, i8 0, i64 %16, i1 false)
  %indvar.next.4 = shl i64 %indvar, 12
  %46 = getelementptr i8, ptr %6, i64 %indvar.next.4
  %scevgep.5 = getelementptr i8, ptr %46, i64 20480
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.5, i8 0, i64 %16, i1 false)
  %indvar.next.5 = shl i64 %indvar, 12
  %47 = getelementptr i8, ptr %6, i64 %indvar.next.5
  %scevgep.6 = getelementptr i8, ptr %47, i64 24576
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.6, i8 0, i64 %16, i1 false)
  %indvar.next.6 = shl i64 %indvar, 12
  %48 = getelementptr i8, ptr %6, i64 %indvar.next.6
  %scevgep.7 = getelementptr i8, ptr %48, i64 28672
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.7, i8 0, i64 %16, i1 false)
  %indvar.next.7 = add nuw nsw i64 %indvar, 8
  %niter.next.7 = add i64 %niter, 8
  %niter.ncmp.7 = icmp eq i64 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.preheader.lr.ph.loopexit.unr-lcssa, label %.preheader49

.preheader48:                                     ; preds = %._crit_edge53.split.us.us
  %49 = icmp sgt i32 %3, 0
  br i1 %49, label %.preheader.lr.ph.split, label %._crit_edge.split

.preheader.lr.ph.loopexit.unr-lcssa:              ; preds = %.preheader49
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.preheader.lr.ph, label %.preheader49.epil.preheader

.preheader49.epil.preheader:                      ; preds = %.preheader.lr.ph.loopexit.unr-lcssa, %.preheader49.preheader
  %indvar.epil.init = phi i64 [ 0, %.preheader49.preheader ], [ %indvar.next.7, %.preheader.lr.ph.loopexit.unr-lcssa ]
  %lcmp.mod123 = icmp ne i64 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod123)
  br label %.preheader49.epil

.preheader49.epil:                                ; preds = %.preheader49.epil, %.preheader49.epil.preheader
  %indvar.epil = phi i64 [ %indvar.epil.init, %.preheader49.epil.preheader ], [ %indvar.next.epil, %.preheader49.epil ]
  %epil.iter = phi i64 [ 0, %.preheader49.epil.preheader ], [ %epil.iter.next, %.preheader49.epil ]
  %50 = shl nuw nsw i64 %indvar.epil, 12
  %scevgep.epil = getelementptr i8, ptr %6, i64 %50
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.epil, i8 0, i64 %16, i1 false)
  %indvar.next.epil = add nuw nsw i64 %indvar.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.preheader.lr.ph, label %.preheader49.epil, !llvm.loop !13

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit.unr-lcssa, %.preheader49.epil, %.preheader49.lr.ph
  %.old = icmp sgt i32 %3, 0
  br i1 %.old, label %.preheader.lr.ph.split, label %._crit_edge.split

.preheader.lr.ph.split:                           ; preds = %.preheader48, %.preheader.lr.ph
  %51 = icmp sgt i32 %1, 0
  %wide.trip.count112 = zext nneg i32 %0 to i64
  %wide.trip.count107 = zext i32 %3 to i64
  br i1 %51, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph.split
  %min.iters.check = icmp ult i32 %3, 8
  %n.vec = and i64 %wide.trip.count107, 4294967288
  %broadcast.splatinsert = insertelement <4 x float> poison, float %5, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count107
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph.split
  %wide.trip.count102 = zext nneg i32 %1 to i64
  %xtraiter131 = and i64 %wide.trip.count102, 1
  %52 = icmp eq i32 %1, 1
  %unroll_iter137 = and i64 %wide.trip.count102, 2147483646
  %lcmp.mod135.not = icmp eq i64 %xtraiter131, 0
  %lcmp.mod136 = trunc i32 %1 to i1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge60.split.us.us
  %indvars.iv109 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next110, %._crit_edge60.split.us.us ]
  %53 = getelementptr [4096 x i8], ptr %10, i64 %indvars.iv109
  %54 = getelementptr [4096 x i8], ptr %6, i64 %indvars.iv109
  br label %.lr.ph.us.us62

.lr.ph.us.us62:                                   ; preds = %._crit_edge.us.us66, %.preheader.us
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge.us.us66 ], [ 0, %.preheader.us ]
  %55 = getelementptr [4 x i8], ptr %53, i64 %indvars.iv104
  %56 = load float, ptr %55, align 4
  %57 = fmul float %5, %56
  store float %57, ptr %55, align 4
  %invariant.gep.us.us63 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv104
  br i1 %52, label %.epil.preheader130, label %.lr.ph.us.us62.new

.lr.ph.us.us62.new:                               ; preds = %.lr.ph.us.us62, %.lr.ph.us.us62.new
  %indvars.iv99 = phi i64 [ %indvars.iv.next100.1, %.lr.ph.us.us62.new ], [ 0, %.lr.ph.us.us62 ]
  %58 = phi float [ %68, %.lr.ph.us.us62.new ], [ %57, %.lr.ph.us.us62 ]
  %niter138 = phi i64 [ %niter138.next.1, %.lr.ph.us.us62.new ], [ 0, %.lr.ph.us.us62 ]
  %59 = getelementptr [4 x i8], ptr %54, i64 %indvars.iv99
  %60 = load float, ptr %59, align 4
  %gep.us.us65 = getelementptr [4096 x i8], ptr %invariant.gep.us.us63, i64 %indvars.iv99
  %61 = load float, ptr %gep.us.us65, align 4
  %62 = fmul float %60, %61
  %63 = fadd float %58, %62
  store float %63, ptr %55, align 4
  %indvars.iv.next100 = or disjoint i64 %indvars.iv99, 1
  %64 = getelementptr [4 x i8], ptr %54, i64 %indvars.iv.next100
  %65 = load float, ptr %64, align 4
  %gep.us.us65.1 = getelementptr [4096 x i8], ptr %invariant.gep.us.us63, i64 %indvars.iv.next100
  %66 = load float, ptr %gep.us.us65.1, align 4
  %67 = fmul float %65, %66
  %68 = fadd float %63, %67
  store float %68, ptr %55, align 4
  %indvars.iv.next100.1 = add nuw nsw i64 %indvars.iv99, 2
  %niter138.next.1 = add i64 %niter138, 2
  %niter138.ncmp.1 = icmp eq i64 %niter138.next.1, %unroll_iter137
  br i1 %niter138.ncmp.1, label %._crit_edge.us.us66.unr-lcssa, label %.lr.ph.us.us62.new

._crit_edge.us.us66.unr-lcssa:                    ; preds = %.lr.ph.us.us62.new
  br i1 %lcmp.mod135.not, label %._crit_edge.us.us66, label %.epil.preheader130

.epil.preheader130:                               ; preds = %._crit_edge.us.us66.unr-lcssa, %.lr.ph.us.us62
  %indvars.iv99.epil.init = phi i64 [ 0, %.lr.ph.us.us62 ], [ %indvars.iv.next100.1, %._crit_edge.us.us66.unr-lcssa ]
  %.epil.init134 = phi float [ %57, %.lr.ph.us.us62 ], [ %68, %._crit_edge.us.us66.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod136)
  %69 = getelementptr [4 x i8], ptr %54, i64 %indvars.iv99.epil.init
  %70 = load float, ptr %69, align 4
  %gep.us.us65.epil = getelementptr [4096 x i8], ptr %invariant.gep.us.us63, i64 %indvars.iv99.epil.init
  %71 = load float, ptr %gep.us.us65.epil, align 4
  %72 = fmul float %70, %71
  %73 = fadd float %.epil.init134, %72
  store float %73, ptr %55, align 4
  br label %._crit_edge.us.us66

._crit_edge.us.us66:                              ; preds = %._crit_edge.us.us66.unr-lcssa, %.epil.preheader130
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond108.not = icmp eq i64 %indvars.iv.next105, %wide.trip.count107
  br i1 %exitcond108.not, label %._crit_edge60.split.us.us, label %.lr.ph.us.us62

._crit_edge60.split.us.us:                        ; preds = %._crit_edge.us.us66
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond113.not = icmp eq i64 %indvars.iv.next110, %wide.trip.count112
  br i1 %exitcond113.not, label %._crit_edge.split, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge60.split
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %._crit_edge60.split ], [ 0, %.preheader.preheader ]
  %74 = getelementptr [4096 x i8], ptr %10, i64 %indvars.iv94
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.body

vector.body:                                      ; preds = %.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader ]
  %75 = getelementptr [4 x i8], ptr %74, i64 %index
  %76 = getelementptr i8, ptr %75, i64 16
  %wide.load = load <4 x float>, ptr %75, align 4
  %wide.load121 = load <4 x float>, ptr %76, align 4
  %77 = fmul <4 x float> %broadcast.splat, %wide.load
  %78 = fmul <4 x float> %broadcast.splat, %wide.load121
  store <4 x float> %77, ptr %75, align 4
  store <4 x float> %78, ptr %76, align 4
  %index.next = add nuw i64 %index, 8
  %79 = icmp eq i64 %index.next, %n.vec
  br i1 %79, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge60.split, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader, %middle.block
  %indvars.iv89.ph = phi i64 [ 0, %.preheader ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %scalar.ph ], [ %indvars.iv89.ph, %scalar.ph.preheader ]
  %80 = getelementptr [4 x i8], ptr %74, i64 %indvars.iv89
  %81 = load float, ptr %80, align 4
  %82 = fmul float %5, %81
  store float %82, ptr %80, align 4
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond93.not = icmp eq i64 %indvars.iv.next90, %wide.trip.count107
  br i1 %exitcond93.not, label %._crit_edge60.split, label %scalar.ph, !llvm.loop !16

._crit_edge60.split:                              ; preds = %scalar.ph, %middle.block
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond98.not = icmp eq i64 %indvars.iv.next95, %wide.trip.count112
  br i1 %exitcond98.not, label %._crit_edge.split, label %.preheader

._crit_edge.split:                                ; preds = %._crit_edge60.split, %._crit_edge60.split.us.us, %11, %.preheader.lr.ph, %.preheader48
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

define dso_local void @_Z7mm2CudaiiiiffPA1024_fS0_S0_S0_S0_S0_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, float noundef %4, float noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8, ptr noundef %9, ptr noundef %10, ptr noundef %11) local_unnamed_addr #5 {
  %13 = alloca %struct.timeval, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca [9 x ptr], align 16
  %24 = alloca %struct.dim3, align 8
  %25 = alloca %struct.dim3, align 8
  %26 = alloca i64, align 8
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca float, align 4
  %33 = alloca float, align 4
  %34 = alloca ptr, align 8
  %35 = alloca ptr, align 8
  %36 = alloca ptr, align 8
  %37 = alloca [9 x ptr], align 16
  %38 = alloca %struct.dim3, align 8
  %39 = alloca %struct.dim3, align 8
  %40 = alloca i64, align 8
  %41 = alloca ptr, align 8
  %42 = alloca %struct.timeval, align 8
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = alloca ptr, align 8
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = call i32 @cudaMalloc(ptr noundef nonnull %43, i64 noundef 4194304) #4
  %49 = call i32 @cudaMalloc(ptr noundef nonnull %44, i64 noundef 4194304) #4
  %50 = call i32 @cudaMalloc(ptr noundef nonnull %45, i64 noundef 4194304) #4
  %51 = call i32 @cudaMalloc(ptr noundef nonnull %46, i64 noundef 4194304) #4
  %52 = call i32 @cudaMalloc(ptr noundef nonnull %47, i64 noundef 4194304) #4
  %53 = load ptr, ptr %43, align 8
  %54 = call i32 @cudaMemcpy(ptr noundef %53, ptr noundef %6, i64 noundef 4194304, i32 noundef 1) #4
  %55 = load ptr, ptr %44, align 8
  %56 = call i32 @cudaMemcpy(ptr noundef %55, ptr noundef %7, i64 noundef 4194304, i32 noundef 1) #4
  %57 = load ptr, ptr %45, align 8
  %58 = call i32 @cudaMemcpy(ptr noundef %57, ptr noundef %8, i64 noundef 4194304, i32 noundef 1) #4
  %59 = load ptr, ptr %46, align 8
  %60 = call i32 @cudaMemcpy(ptr noundef %59, ptr noundef %9, i64 noundef 4194304, i32 noundef 1) #4
  %61 = load ptr, ptr %47, align 8
  %62 = call i32 @cudaMemcpy(ptr noundef %61, ptr noundef %10, i64 noundef 4194304, i32 noundef 1) #4
  call void @llvm.lifetime.start.p0(ptr nonnull %42)
  %63 = call i32 @gettimeofday(ptr noundef nonnull %42, ptr noundef null) #15
  %.not.i.i = icmp eq i32 %63, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %64

64:                                               ; preds = %12
  %65 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %63) #4
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %12, %64
  %66 = load i64, ptr %42, align 8
  %67 = sitofp i64 %66 to double
  %68 = getelementptr inbounds nuw i8, ptr %42, i64 8
  %69 = load i64, ptr %68, align 8
  %70 = sitofp i64 %69 to double
  %71 = fmul nnan double %70, f0x3EB0C6F7A0B5ED8D
  %72 = fadd double %71, %67
  call void @llvm.lifetime.end.p0(ptr nonnull %42)
  store double %72, ptr @polybench_t_start, align 8
  %73 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 32, i32 128, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #4
  %.not = icmp eq i32 %73, 0
  br i1 %.not, label %74, label %90

74:                                               ; preds = %_Z21polybench_timer_startv.exit
  %75 = load ptr, ptr %43, align 8
  %76 = load ptr, ptr %44, align 8
  %77 = load ptr, ptr %45, align 8
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
  call void @llvm.lifetime.start.p0(ptr nonnull %41)
  store i32 %0, ptr %28, align 4
  store i32 %1, ptr %29, align 4
  store i32 %2, ptr %30, align 4
  store i32 %3, ptr %31, align 4
  store float %4, ptr %32, align 4
  store float %5, ptr %33, align 4
  store ptr %75, ptr %34, align 8
  store ptr %76, ptr %35, align 8
  store ptr %77, ptr %36, align 8
  store ptr %28, ptr %37, align 16
  %78 = getelementptr inbounds nuw i8, ptr %37, i64 8
  store ptr %29, ptr %78, align 8
  %79 = getelementptr inbounds nuw i8, ptr %37, i64 16
  store ptr %30, ptr %79, align 16
  %80 = getelementptr inbounds nuw i8, ptr %37, i64 24
  store ptr %31, ptr %80, align 8
  %81 = getelementptr inbounds nuw i8, ptr %37, i64 32
  store ptr %32, ptr %81, align 16
  %82 = getelementptr inbounds nuw i8, ptr %37, i64 40
  store ptr %33, ptr %82, align 8
  %83 = getelementptr inbounds nuw i8, ptr %37, i64 48
  store ptr %34, ptr %83, align 16
  %84 = getelementptr inbounds nuw i8, ptr %37, i64 56
  store ptr %35, ptr %84, align 8
  %85 = getelementptr inbounds nuw i8, ptr %37, i64 64
  store ptr %36, ptr %85, align 16
  %86 = call i32 @__cudaPopCallConfiguration(ptr nonnull %38, ptr nonnull %39, ptr nonnull %40, ptr nonnull %41), !inline_history !17
  %87 = load i64, ptr %40, align 8
  %88 = load ptr, ptr %41, align 8
  %.fca.0.load2.i = load i32, ptr %38, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %38, i64 4
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %38, i64 8
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %39, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %39, i64 4
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %39, i64 8
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %89 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm2_kernel1iiiiffPfS_S_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %37, i64 noundef %87, ptr noundef %88), !inline_history !17
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
  call void @llvm.lifetime.end.p0(ptr nonnull %41)
  br label %90

90:                                               ; preds = %_Z21polybench_timer_startv.exit, %74
  %91 = call i32 @cudaThreadSynchronize() #4
  %92 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 32, i32 128, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #4
  %.not35 = icmp eq i32 %92, 0
  br i1 %.not35, label %93, label %109

93:                                               ; preds = %90
  %94 = load ptr, ptr %43, align 8
  %95 = load ptr, ptr %46, align 8
  %96 = load ptr, ptr %47, align 8
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
  call void @llvm.lifetime.start.p0(ptr nonnull %24)
  call void @llvm.lifetime.start.p0(ptr nonnull %25)
  call void @llvm.lifetime.start.p0(ptr nonnull %26)
  call void @llvm.lifetime.start.p0(ptr nonnull %27)
  store i32 %0, ptr %14, align 4
  store i32 %1, ptr %15, align 4
  store i32 %2, ptr %16, align 4
  store i32 %3, ptr %17, align 4
  store float %4, ptr %18, align 4
  store float %5, ptr %19, align 4
  store ptr %94, ptr %20, align 8
  store ptr %95, ptr %21, align 8
  store ptr %96, ptr %22, align 8
  store ptr %14, ptr %23, align 16
  %97 = getelementptr inbounds nuw i8, ptr %23, i64 8
  store ptr %15, ptr %97, align 8
  %98 = getelementptr inbounds nuw i8, ptr %23, i64 16
  store ptr %16, ptr %98, align 16
  %99 = getelementptr inbounds nuw i8, ptr %23, i64 24
  store ptr %17, ptr %99, align 8
  %100 = getelementptr inbounds nuw i8, ptr %23, i64 32
  store ptr %18, ptr %100, align 16
  %101 = getelementptr inbounds nuw i8, ptr %23, i64 40
  store ptr %19, ptr %101, align 8
  %102 = getelementptr inbounds nuw i8, ptr %23, i64 48
  store ptr %20, ptr %102, align 16
  %103 = getelementptr inbounds nuw i8, ptr %23, i64 56
  store ptr %21, ptr %103, align 8
  %104 = getelementptr inbounds nuw i8, ptr %23, i64 64
  store ptr %22, ptr %104, align 16
  %105 = call i32 @__cudaPopCallConfiguration(ptr nonnull %24, ptr nonnull %25, ptr nonnull %26, ptr nonnull %27), !inline_history !18
  %106 = load i64, ptr %26, align 8
  %107 = load ptr, ptr %27, align 8
  %.fca.0.load2.i36 = load i32, ptr %24, align 8
  %.fca.0.insert3.i37 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i36, 0
  %.fca.1.gep4.i38 = getelementptr inbounds nuw i8, ptr %24, i64 4
  %.fca.1.load5.i39 = load i32, ptr %.fca.1.gep4.i38, align 4
  %.fca.1.insert6.i40 = insertvalue %struct.dim3 %.fca.0.insert3.i37, i32 %.fca.1.load5.i39, 1
  %.fca.2.gep7.i41 = getelementptr inbounds nuw i8, ptr %24, i64 8
  %.fca.2.load8.i42 = load i32, ptr %.fca.2.gep7.i41, align 8
  %.fca.2.insert9.i43 = insertvalue %struct.dim3 %.fca.1.insert6.i40, i32 %.fca.2.load8.i42, 2
  %.fca.0.load.i44 = load i32, ptr %25, align 8
  %.fca.0.insert.i45 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i44, 0
  %.fca.1.gep.i46 = getelementptr inbounds nuw i8, ptr %25, i64 4
  %.fca.1.load.i47 = load i32, ptr %.fca.1.gep.i46, align 4
  %.fca.1.insert.i48 = insertvalue %struct.dim3 %.fca.0.insert.i45, i32 %.fca.1.load.i47, 1
  %.fca.2.gep.i49 = getelementptr inbounds nuw i8, ptr %25, i64 8
  %.fca.2.load.i50 = load i32, ptr %.fca.2.gep.i49, align 8
  %.fca.2.insert.i51 = insertvalue %struct.dim3 %.fca.1.insert.i48, i32 %.fca.2.load.i50, 2
  %108 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm2_kernel2iiiiffPfS_S_, %struct.dim3 %.fca.2.insert9.i43, %struct.dim3 %.fca.2.insert.i51, ptr noundef nonnull %23, i64 noundef %106, ptr noundef %107), !inline_history !18
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
  call void @llvm.lifetime.end.p0(ptr nonnull %24)
  call void @llvm.lifetime.end.p0(ptr nonnull %25)
  call void @llvm.lifetime.end.p0(ptr nonnull %26)
  call void @llvm.lifetime.end.p0(ptr nonnull %27)
  br label %109

109:                                              ; preds = %90, %93
  %110 = call i32 @cudaThreadSynchronize() #4
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
  %111 = call i32 @gettimeofday(ptr noundef nonnull %13, ptr noundef null) #15
  %.not.i.i52 = icmp eq i32 %111, 0
  br i1 %.not.i.i52, label %_Z20polybench_timer_stopv.exit, label %112

112:                                              ; preds = %109
  %113 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %111) #4
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %109, %112
  %114 = load i64, ptr %13, align 8
  %115 = sitofp i64 %114 to double
  %116 = getelementptr inbounds nuw i8, ptr %13, i64 8
  %117 = load i64, ptr %116, align 8
  %118 = sitofp i64 %117 to double
  %119 = fmul nnan double %118, f0x3EB0C6F7A0B5ED8D
  %120 = fadd double %119, %115
  call void @llvm.lifetime.end.p0(ptr nonnull %13)
  store double %120, ptr @polybench_t_end, align 8
  %121 = load double, ptr @polybench_t_start, align 8
  %122 = fsub double %120, %121
  %123 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %122) #4
  %124 = load ptr, ptr %47, align 8
  %125 = call i32 @cudaMemcpy(ptr noundef %11, ptr noundef %124, i64 noundef 4194304, i32 noundef 2) #4
  %126 = load ptr, ptr %43, align 8
  %127 = call i32 @cudaFree(ptr noundef %126) #4
  %128 = load ptr, ptr %44, align 8
  %129 = call i32 @cudaFree(ptr noundef %128) #4
  %130 = load ptr, ptr %45, align 8
  %131 = call i32 @cudaFree(ptr noundef %130) #4
  %132 = load ptr, ptr %46, align 8
  %133 = call i32 @cudaFree(ptr noundef %132) #4
  %134 = load ptr, ptr %47, align 8
  %135 = call i32 @cudaFree(ptr noundef %134) #4
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
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  store ptr null, ptr %11, align 8
  %12 = call i32 @posix_memalign(ptr noundef nonnull %11, i64 noundef 32, i64 noundef 4194304) #15
  %13 = load ptr, ptr %11, align 8
  %.not.i.i = icmp eq ptr %13, null
  %14 = icmp ne i32 %12, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %14
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %15 = load ptr, ptr @stderr, align 8
  %16 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %15) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  store ptr null, ptr %10, align 8
  %17 = call i32 @posix_memalign(ptr noundef nonnull %10, i64 noundef 32, i64 noundef 4194304) #15
  %18 = load ptr, ptr %10, align 8
  %.not.i.i37 = icmp eq ptr %18, null
  %19 = icmp ne i32 %17, 0
  %or.cond.i.i38 = select i1 %.not.i.i37, i1 true, i1 %19
  br i1 %or.cond.i.i38, label %.critedge.i.i39, label %_Z20polybench_alloc_datayi.exit40

.critedge.i.i39:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %20 = load ptr, ptr @stderr, align 8
  %21 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %20) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit40:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  store ptr null, ptr %9, align 8
  %22 = call i32 @posix_memalign(ptr noundef nonnull %9, i64 noundef 32, i64 noundef 4194304) #15
  %23 = load ptr, ptr %9, align 8
  %.not.i.i41 = icmp eq ptr %23, null
  %24 = icmp ne i32 %22, 0
  %or.cond.i.i42 = select i1 %.not.i.i41, i1 true, i1 %24
  br i1 %or.cond.i.i42, label %.critedge.i.i43, label %_Z20polybench_alloc_datayi.exit44

.critedge.i.i43:                                  ; preds = %_Z20polybench_alloc_datayi.exit40
  %25 = load ptr, ptr @stderr, align 8
  %26 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %25) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit44:                ; preds = %_Z20polybench_alloc_datayi.exit40
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %27 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 4194304) #15
  %28 = load ptr, ptr %8, align 8
  %.not.i.i45 = icmp eq ptr %28, null
  %29 = icmp ne i32 %27, 0
  %or.cond.i.i46 = select i1 %.not.i.i45, i1 true, i1 %29
  br i1 %or.cond.i.i46, label %.critedge.i.i47, label %_Z20polybench_alloc_datayi.exit48

.critedge.i.i47:                                  ; preds = %_Z20polybench_alloc_datayi.exit44
  %30 = load ptr, ptr @stderr, align 8
  %31 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %30) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit48:                ; preds = %_Z20polybench_alloc_datayi.exit44
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %32 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 4194304) #15
  %33 = load ptr, ptr %7, align 8
  %.not.i.i49 = icmp eq ptr %33, null
  %34 = icmp ne i32 %32, 0
  %or.cond.i.i50 = select i1 %.not.i.i49, i1 true, i1 %34
  br i1 %or.cond.i.i50, label %.critedge.i.i51, label %_Z20polybench_alloc_datayi.exit52

.critedge.i.i51:                                  ; preds = %_Z20polybench_alloc_datayi.exit48
  %35 = load ptr, ptr @stderr, align 8
  %36 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %35) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit52:                ; preds = %_Z20polybench_alloc_datayi.exit48
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %37 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 4194304) #15
  %38 = load ptr, ptr %6, align 8
  %.not.i.i53 = icmp eq ptr %38, null
  %39 = icmp ne i32 %37, 0
  %or.cond.i.i54 = select i1 %.not.i.i53, i1 true, i1 %39
  br i1 %or.cond.i.i54, label %.critedge.i.i55, label %_Z20polybench_alloc_datayi.exit56

.critedge.i.i55:                                  ; preds = %_Z20polybench_alloc_datayi.exit52
  %40 = load ptr, ptr @stderr, align 8
  %41 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %40) #16
  call void @exit(i32 noundef 1) #17
  unreachable

_Z20polybench_alloc_datayi.exit56:                ; preds = %_Z20polybench_alloc_datayi.exit52
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  br label %.preheader56.i

.preheader56.i:                                   ; preds = %._crit_edge.i, %_Z20polybench_alloc_datayi.exit56
  %indvars.iv73.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit56 ], [ %indvars.iv.next74.i, %._crit_edge.i ]
  %42 = getelementptr [4096 x i8], ptr %18, i64 %indvars.iv73.i
  %43 = trunc nuw nsw i64 %indvars.iv73.i to i32
  %44 = uitofp nneg i32 %43 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %44, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader56.i
  %index = phi i64 [ 0, %.preheader56.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader56.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %45 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %46 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %47 = fmul nnan <4 x float> %broadcast.splat, %45
  %48 = fmul nnan <4 x float> %broadcast.splat, %46
  %49 = fmul nnan <4 x float> %47, splat (float f0x3A800000)
  %50 = fmul nnan <4 x float> %48, splat (float f0x3A800000)
  %51 = getelementptr [4 x i8], ptr %42, i64 %index
  %52 = getelementptr i8, ptr %51, i64 16
  store <4 x float> %49, ptr %51, align 4
  store <4 x float> %50, ptr %52, align 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %53 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %54 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %55 = fmul nnan <4 x float> %broadcast.splat, %53
  %56 = fmul nnan <4 x float> %broadcast.splat, %54
  %57 = fmul nnan <4 x float> %55, splat (float f0x3A800000)
  %58 = fmul nnan <4 x float> %56, splat (float f0x3A800000)
  %59 = getelementptr [4 x i8], ptr %42, i64 %index
  %60 = getelementptr i8, ptr %59, i64 32
  %61 = getelementptr i8, ptr %59, i64 48
  store <4 x float> %57, ptr %60, align 4
  store <4 x float> %58, ptr %61, align 4
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %62 = icmp eq i64 %index.next.1, 1024
  br i1 %62, label %._crit_edge.i, label %vector.body, !llvm.loop !19

._crit_edge.i:                                    ; preds = %vector.body
  %indvars.iv.next74.i = add nuw nsw i64 %indvars.iv73.i, 1
  %exitcond77.not.i = icmp eq i64 %indvars.iv.next74.i, 1024
  br i1 %exitcond77.not.i, label %.preheader54.i, label %.preheader56.i

.preheader54.i:                                   ; preds = %._crit_edge.i, %._crit_edge60.i
  %indvars.iv83.i = phi i64 [ %indvars.iv.next84.i, %._crit_edge60.i ], [ 0, %._crit_edge.i ]
  %63 = getelementptr [4096 x i8], ptr %23, i64 %indvars.iv83.i
  %64 = trunc nuw nsw i64 %indvars.iv83.i to i32
  %65 = uitofp nneg i32 %64 to float
  %broadcast.splatinsert76 = insertelement <4 x float> poison, float %65, i64 0
  %broadcast.splat77 = shufflevector <4 x float> %broadcast.splatinsert76, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body78

vector.body78:                                    ; preds = %vector.body78, %.preheader54.i
  %index79 = phi i64 [ 0, %.preheader54.i ], [ %index.next82, %vector.body78 ]
  %vec.ind80 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader54.i ], [ %vec.ind.next83, %vector.body78 ]
  %66 = trunc <4 x i64> %vec.ind80 to <4 x i32>
  %67 = add <4 x i32> %66, splat (i32 1)
  %68 = trunc <4 x i64> %vec.ind80 to <4 x i32>
  %69 = add <4 x i32> %68, splat (i32 5)
  %70 = uitofp nneg <4 x i32> %67 to <4 x float>
  %71 = uitofp nneg <4 x i32> %69 to <4 x float>
  %72 = fmul nnan <4 x float> %broadcast.splat77, %70
  %73 = fmul nnan <4 x float> %broadcast.splat77, %71
  %74 = fmul nnan <4 x float> %72, splat (float f0x3A800000)
  %75 = fmul nnan <4 x float> %73, splat (float f0x3A800000)
  %76 = getelementptr [4 x i8], ptr %63, i64 %index79
  %77 = getelementptr i8, ptr %76, i64 16
  store <4 x float> %74, ptr %76, align 4
  store <4 x float> %75, ptr %77, align 4
  %index.next82 = add nuw i64 %index79, 8
  %vec.ind.next83 = add nuw <4 x i64> %vec.ind80, splat (i64 8)
  %78 = icmp eq i64 %index.next82, 1024
  br i1 %78, label %._crit_edge60.i, label %vector.body78, !llvm.loop !20

._crit_edge60.i:                                  ; preds = %vector.body78
  %indvars.iv.next84.i = add nuw nsw i64 %indvars.iv83.i, 1
  %exitcond87.not.i = icmp eq i64 %indvars.iv.next84.i, 1024
  br i1 %exitcond87.not.i, label %.preheader52.i, label %.preheader54.i

.preheader52.i:                                   ; preds = %._crit_edge60.i, %._crit_edge63.i
  %indvars.iv93.i = phi i64 [ %indvars.iv.next94.i, %._crit_edge63.i ], [ 0, %._crit_edge60.i ]
  %79 = getelementptr [4096 x i8], ptr %28, i64 %indvars.iv93.i
  %80 = trunc nuw nsw i64 %indvars.iv93.i to i32
  %81 = uitofp nneg i32 %80 to float
  %broadcast.splatinsert86 = insertelement <4 x float> poison, float %81, i64 0
  %broadcast.splat87 = shufflevector <4 x float> %broadcast.splatinsert86, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body88

vector.body88:                                    ; preds = %vector.body88, %.preheader52.i
  %index89 = phi i64 [ 0, %.preheader52.i ], [ %index.next92.1, %vector.body88 ]
  %vec.ind90 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader52.i ], [ %vec.ind.next93.1, %vector.body88 ]
  %82 = add <4 x i32> %vec.ind90, splat (i32 3)
  %83 = add <4 x i32> %vec.ind90, splat (i32 7)
  %84 = uitofp nneg <4 x i32> %82 to <4 x float>
  %85 = uitofp nneg <4 x i32> %83 to <4 x float>
  %86 = fmul nnan <4 x float> %broadcast.splat87, %84
  %87 = fmul nnan <4 x float> %broadcast.splat87, %85
  %88 = fmul nnan <4 x float> %86, splat (float f0x3A800000)
  %89 = fmul nnan <4 x float> %87, splat (float f0x3A800000)
  %90 = getelementptr [4 x i8], ptr %79, i64 %index89
  %91 = getelementptr i8, ptr %90, i64 16
  store <4 x float> %88, ptr %90, align 4
  store <4 x float> %89, ptr %91, align 4
  %92 = add <4 x i32> %vec.ind90, splat (i32 11)
  %93 = add <4 x i32> %vec.ind90, splat (i32 15)
  %94 = uitofp nneg <4 x i32> %92 to <4 x float>
  %95 = uitofp nneg <4 x i32> %93 to <4 x float>
  %96 = fmul nnan <4 x float> %broadcast.splat87, %94
  %97 = fmul nnan <4 x float> %broadcast.splat87, %95
  %98 = fmul nnan <4 x float> %96, splat (float f0x3A800000)
  %99 = fmul nnan <4 x float> %97, splat (float f0x3A800000)
  %100 = getelementptr [4 x i8], ptr %79, i64 %index89
  %101 = getelementptr i8, ptr %100, i64 32
  %102 = getelementptr i8, ptr %100, i64 48
  store <4 x float> %98, ptr %101, align 4
  store <4 x float> %99, ptr %102, align 4
  %index.next92.1 = add nuw nsw i64 %index89, 16
  %vec.ind.next93.1 = add <4 x i32> %vec.ind90, splat (i32 16)
  %103 = icmp eq i64 %index.next92.1, 1024
  br i1 %103, label %._crit_edge63.i, label %vector.body88, !llvm.loop !21

._crit_edge63.i:                                  ; preds = %vector.body88
  %indvars.iv.next94.i = add nuw nsw i64 %indvars.iv93.i, 1
  %exitcond97.not.i = icmp eq i64 %indvars.iv.next94.i, 1024
  br i1 %exitcond97.not.i, label %.preheader.i, label %.preheader52.i

.preheader.i:                                     ; preds = %._crit_edge63.i, %._crit_edge66.i
  %indvars.iv103.i = phi i64 [ %indvars.iv.next104.i, %._crit_edge66.i ], [ 0, %._crit_edge63.i ]
  %104 = getelementptr [4096 x i8], ptr %33, i64 %indvars.iv103.i
  %105 = trunc nuw nsw i64 %indvars.iv103.i to i32
  %106 = uitofp nneg i32 %105 to float
  %broadcast.splatinsert96 = insertelement <4 x float> poison, float %106, i64 0
  %broadcast.splat97 = shufflevector <4 x float> %broadcast.splatinsert96, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body98

vector.body98:                                    ; preds = %vector.body98, %.preheader.i
  %index99 = phi i64 [ 0, %.preheader.i ], [ %index.next102.1, %vector.body98 ]
  %vec.ind100 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader.i ], [ %vec.ind.next103.1, %vector.body98 ]
  %107 = add <4 x i32> %vec.ind100, splat (i32 2)
  %108 = add <4 x i32> %vec.ind100, splat (i32 6)
  %109 = uitofp nneg <4 x i32> %107 to <4 x float>
  %110 = uitofp nneg <4 x i32> %108 to <4 x float>
  %111 = fmul nnan <4 x float> %broadcast.splat97, %109
  %112 = fmul nnan <4 x float> %broadcast.splat97, %110
  %113 = fmul nnan <4 x float> %111, splat (float f0x3A800000)
  %114 = fmul nnan <4 x float> %112, splat (float f0x3A800000)
  %115 = getelementptr [4 x i8], ptr %104, i64 %index99
  %116 = getelementptr i8, ptr %115, i64 16
  store <4 x float> %113, ptr %115, align 4
  store <4 x float> %114, ptr %116, align 4
  %117 = add <4 x i32> %vec.ind100, splat (i32 10)
  %118 = add <4 x i32> %vec.ind100, splat (i32 14)
  %119 = uitofp nneg <4 x i32> %117 to <4 x float>
  %120 = uitofp nneg <4 x i32> %118 to <4 x float>
  %121 = fmul nnan <4 x float> %broadcast.splat97, %119
  %122 = fmul nnan <4 x float> %broadcast.splat97, %120
  %123 = fmul nnan <4 x float> %121, splat (float f0x3A800000)
  %124 = fmul nnan <4 x float> %122, splat (float f0x3A800000)
  %125 = getelementptr [4 x i8], ptr %104, i64 %index99
  %126 = getelementptr i8, ptr %125, i64 32
  %127 = getelementptr i8, ptr %125, i64 48
  store <4 x float> %123, ptr %126, align 4
  store <4 x float> %124, ptr %127, align 4
  %index.next102.1 = add nuw nsw i64 %index99, 16
  %vec.ind.next103.1 = add <4 x i32> %vec.ind100, splat (i32 16)
  %128 = icmp eq i64 %index.next102.1, 1024
  br i1 %128, label %._crit_edge66.i, label %vector.body98, !llvm.loop !22

._crit_edge66.i:                                  ; preds = %vector.body98
  %indvars.iv.next104.i = add nuw nsw i64 %indvars.iv103.i, 1
  %exitcond107.not.i = icmp eq i64 %indvars.iv.next104.i, 1024
  br i1 %exitcond107.not.i, label %_Z10init_arrayiiiiPfS_PA1024_fS1_S1_S1_.exit, label %.preheader.i

_Z10init_arrayiiiiPfS_PA1024_fS1_S1_S1_.exit:     ; preds = %._crit_edge66.i
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  %129 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %5, i32 noundef 0) #4
  %130 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %5) #4
  %131 = call i32 @cudaSetDevice(i32 noundef 0) #4
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @_Z7mm2CudaiiiiffPA1024_fS0_S0_S0_S0_S0_(i32 noundef 1024, i32 noundef 1024, i32 noundef 1024, i32 noundef 1024, float noundef 3.241200e+04, float noundef 2.123000e+03, ptr noundef %13, ptr noundef %18, ptr noundef %23, ptr noundef %28, ptr noundef nonnull %33, ptr noundef %38) #4
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %132 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #15
  %.not.i.i57 = icmp eq i32 %132, 0
  br i1 %.not.i.i57, label %_Z21polybench_timer_startv.exit, label %133

133:                                              ; preds = %_Z10init_arrayiiiiPfS_PA1024_fS1_S1_S1_.exit
  %134 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %132) #4
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiiiiPfS_PA1024_fS1_S1_S1_.exit, %133
  %135 = load i64, ptr %4, align 8
  %136 = sitofp i64 %135 to double
  %137 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %138 = load i64, ptr %137, align 8
  %139 = sitofp i64 %138 to double
  %140 = fmul nnan double %139, f0x3EB0C6F7A0B5ED8D
  %141 = fadd double %140, %136
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %141, ptr @polybench_t_start, align 8
  br label %.preheader49.us.i

.preheader49.us.i:                                ; preds = %._crit_edge53.split.us.us.i, %_Z21polybench_timer_startv.exit
  %indvars.iv84.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next85.i, %._crit_edge53.split.us.us.i ]
  %142 = getelementptr [4096 x i8], ptr %13, i64 %indvars.iv84.i
  %143 = getelementptr [4096 x i8], ptr %18, i64 %indvars.iv84.i
  br label %.lr.ph.us.us.i

.lr.ph.us.us.i:                                   ; preds = %._crit_edge.us.us.i, %.preheader49.us.i
  %indvars.iv79.i = phi i64 [ %indvars.iv.next80.i, %._crit_edge.us.us.i ], [ 0, %.preheader49.us.i ]
  %144 = getelementptr [4 x i8], ptr %142, i64 %indvars.iv79.i
  store float 0.000000e+00, ptr %144, align 4
  %invariant.gep.us.us.i = getelementptr [4 x i8], ptr %23, i64 %indvars.iv79.i
  br label %145

145:                                              ; preds = %145, %.lr.ph.us.us.i
  %indvars.iv.i58 = phi i64 [ 0, %.lr.ph.us.us.i ], [ %indvars.iv.next.i59.1, %145 ]
  %146 = phi float [ 0.000000e+00, %.lr.ph.us.us.i ], [ %158, %145 ]
  %147 = getelementptr [4 x i8], ptr %143, i64 %indvars.iv.i58
  %148 = load float, ptr %147, align 4
  %149 = fmul float %148, 3.241200e+04
  %gep.us.us.i = getelementptr [4096 x i8], ptr %invariant.gep.us.us.i, i64 %indvars.iv.i58
  %150 = load float, ptr %gep.us.us.i, align 4
  %151 = fmul float %149, %150
  %152 = fadd float %146, %151
  store float %152, ptr %144, align 4
  %indvars.iv.next.i59 = or disjoint i64 %indvars.iv.i58, 1
  %153 = getelementptr [4 x i8], ptr %143, i64 %indvars.iv.next.i59
  %154 = load float, ptr %153, align 4
  %155 = fmul float %154, 3.241200e+04
  %gep.us.us.i.1 = getelementptr [4096 x i8], ptr %invariant.gep.us.us.i, i64 %indvars.iv.next.i59
  %156 = load float, ptr %gep.us.us.i.1, align 4
  %157 = fmul float %155, %156
  %158 = fadd float %152, %157
  store float %158, ptr %144, align 4
  %indvars.iv.next.i59.1 = add nuw nsw i64 %indvars.iv.i58, 2
  %exitcond75.not.i.1 = icmp eq i64 %indvars.iv.next.i59.1, 1024
  br i1 %exitcond75.not.i.1, label %._crit_edge.us.us.i, label %145

._crit_edge.us.us.i:                              ; preds = %145
  %indvars.iv.next80.i = add nuw nsw i64 %indvars.iv79.i, 1
  %exitcond83.not.i = icmp eq i64 %indvars.iv.next80.i, 1024
  br i1 %exitcond83.not.i, label %._crit_edge53.split.us.us.i, label %.lr.ph.us.us.i

._crit_edge53.split.us.us.i:                      ; preds = %._crit_edge.us.us.i
  %indvars.iv.next85.i = add nuw nsw i64 %indvars.iv84.i, 1
  %exitcond88.not.i = icmp eq i64 %indvars.iv.next85.i, 1024
  br i1 %exitcond88.not.i, label %.preheader.us.i, label %.preheader49.us.i

.preheader.us.i:                                  ; preds = %._crit_edge53.split.us.us.i, %._crit_edge60.split.us.us.i
  %indvars.iv109.i = phi i64 [ %indvars.iv.next110.i, %._crit_edge60.split.us.us.i ], [ 0, %._crit_edge53.split.us.us.i ]
  %159 = getelementptr [4096 x i8], ptr %33, i64 %indvars.iv109.i
  %160 = getelementptr [4096 x i8], ptr %13, i64 %indvars.iv109.i
  br label %.lr.ph.us.us62.i

.lr.ph.us.us62.i:                                 ; preds = %._crit_edge.us.us66.i, %.preheader.us.i
  %indvars.iv104.i = phi i64 [ %indvars.iv.next105.i, %._crit_edge.us.us66.i ], [ 0, %.preheader.us.i ]
  %161 = getelementptr [4 x i8], ptr %159, i64 %indvars.iv104.i
  %162 = load float, ptr %161, align 4
  %163 = fmul float %162, 2.123000e+03
  store float %163, ptr %161, align 4
  %invariant.gep.us.us63.i = getelementptr [4 x i8], ptr %28, i64 %indvars.iv104.i
  br label %164

164:                                              ; preds = %164, %.lr.ph.us.us62.i
  %indvars.iv99.i = phi i64 [ 0, %.lr.ph.us.us62.i ], [ %indvars.iv.next100.i.1, %164 ]
  %165 = phi float [ %163, %.lr.ph.us.us62.i ], [ %175, %164 ]
  %166 = getelementptr [4 x i8], ptr %160, i64 %indvars.iv99.i
  %167 = load float, ptr %166, align 4
  %gep.us.us65.i = getelementptr [4096 x i8], ptr %invariant.gep.us.us63.i, i64 %indvars.iv99.i
  %168 = load float, ptr %gep.us.us65.i, align 4
  %169 = fmul float %167, %168
  %170 = fadd float %165, %169
  store float %170, ptr %161, align 4
  %indvars.iv.next100.i = or disjoint i64 %indvars.iv99.i, 1
  %171 = getelementptr [4 x i8], ptr %160, i64 %indvars.iv.next100.i
  %172 = load float, ptr %171, align 4
  %gep.us.us65.i.1 = getelementptr [4096 x i8], ptr %invariant.gep.us.us63.i, i64 %indvars.iv.next100.i
  %173 = load float, ptr %gep.us.us65.i.1, align 4
  %174 = fmul float %172, %173
  %175 = fadd float %170, %174
  store float %175, ptr %161, align 4
  %indvars.iv.next100.i.1 = add nuw nsw i64 %indvars.iv99.i, 2
  %exitcond103.not.i.1 = icmp eq i64 %indvars.iv.next100.i.1, 1024
  br i1 %exitcond103.not.i.1, label %._crit_edge.us.us66.i, label %164

._crit_edge.us.us66.i:                            ; preds = %164
  %indvars.iv.next105.i = add nuw nsw i64 %indvars.iv104.i, 1
  %exitcond108.not.i = icmp eq i64 %indvars.iv.next105.i, 1024
  br i1 %exitcond108.not.i, label %._crit_edge60.split.us.us.i, label %.lr.ph.us.us62.i

._crit_edge60.split.us.us.i:                      ; preds = %._crit_edge.us.us66.i
  %indvars.iv.next110.i = add nuw nsw i64 %indvars.iv109.i, 1
  %exitcond113.not.i = icmp eq i64 %indvars.iv.next110.i, 1024
  br i1 %exitcond113.not.i, label %_Z7mm2_cpuiiiiffPA1024_fS0_S0_S0_S0_.exit, label %.preheader.us.i

_Z7mm2_cpuiiiiffPA1024_fS0_S0_S0_S0_.exit:        ; preds = %._crit_edge60.split.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %176 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #15
  %.not.i.i60 = icmp eq i32 %176, 0
  br i1 %.not.i.i60, label %_Z20polybench_timer_stopv.exit, label %177

177:                                              ; preds = %_Z7mm2_cpuiiiiffPA1024_fS0_S0_S0_S0_.exit
  %178 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %176) #4
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z7mm2_cpuiiiiffPA1024_fS0_S0_S0_S0_.exit, %177
  %179 = load i64, ptr %3, align 8
  %180 = sitofp i64 %179 to double
  %181 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %182 = load i64, ptr %181, align 8
  %183 = sitofp i64 %182 to double
  %184 = fmul nnan double %183, f0x3EB0C6F7A0B5ED8D
  %185 = fadd double %184, %180
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %185, ptr @polybench_t_end, align 8
  %186 = load double, ptr @polybench_t_start, align 8
  %187 = fsub double %185, %186
  %188 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %187) #4
  br label %.preheader.us.i61

.preheader.us.i61:                                ; preds = %._crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv23.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next24.i, %._crit_edge.us.i ]
  %.018.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %225, %._crit_edge.us.i ]
  %189 = getelementptr [4096 x i8], ptr %33, i64 %indvars.iv23.i
  %190 = getelementptr [4096 x i8], ptr %38, i64 %indvars.iv23.i
  %191 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.018.us.i, i64 0
  br label %vector.body106

vector.body106:                                   ; preds = %vector.body106, %.preheader.us.i61
  %index107 = phi i64 [ 0, %.preheader.us.i61 ], [ %index.next109, %vector.body106 ]
  %vec.phi = phi <4 x i32> [ %191, %.preheader.us.i61 ], [ %223, %vector.body106 ]
  %192 = getelementptr [4 x i8], ptr %189, i64 %index107
  %wide.load = load <4 x float>, ptr %192, align 4
  %193 = fpext <4 x float> %wide.load to <4 x double>
  %194 = getelementptr [4 x i8], ptr %190, i64 %index107
  %wide.load108 = load <4 x float>, ptr %194, align 4
  %195 = fpext <4 x float> %wide.load108 to <4 x double>
  %196 = fcmp olt <4 x double> %193, splat (double f0xB690000000000000)
  %197 = fneg <4 x float> %wide.load
  %198 = select <4 x i1> %196, <4 x float> %197, <4 x float> %wide.load
  %199 = fpext <4 x float> %198 to <4 x double>
  %200 = fcmp uge <4 x double> %199, splat (double 1.000000e-02)
  %201 = fcmp olt <4 x double> %195, splat (double f0xB690000000000000)
  %202 = fneg <4 x float> %wide.load108
  %203 = select <4 x i1> %201, <4 x float> %202, <4 x float> %wide.load108
  %204 = fpext <4 x float> %203 to <4 x double>
  %205 = fcmp uge <4 x double> %204, splat (double 1.000000e-02)
  %206 = fsub <4 x double> %193, %195
  %207 = fptrunc <4 x double> %206 to <4 x float>
  %208 = fcmp olt <4 x double> %206, splat (double f0xB690000000000000)
  %209 = fneg <4 x float> %207
  %210 = select <4 x i1> %208, <4 x float> %209, <4 x float> %207
  %211 = fadd <4 x double> %193, splat (double f0x3E45798EE0000000)
  %212 = fptrunc <4 x double> %211 to <4 x float>
  %213 = fcmp olt <4 x double> %211, splat (double f0xB690000000000000)
  %214 = fneg <4 x float> %212
  %215 = select <4 x i1> %213, <4 x float> %214, <4 x float> %212
  %216 = fdiv <4 x float> %210, %215
  %217 = fcmp olt <4 x float> %216, zeroinitializer
  %218 = fneg <4 x float> %216
  %219 = select <4 x i1> %217, <4 x float> %218, <4 x float> %216
  %220 = fmul <4 x float> %219, splat (float 1.000000e+02)
  %221 = fpext <4 x float> %220 to <4 x double>
  %222 = fcmp ogt <4 x double> %221, splat (double 5.000000e-02)
  %.not112 = select <4 x i1> %200, <4 x i1> splat (i1 true), <4 x i1> %205
  %narrow = select <4 x i1> %.not112, <4 x i1> %222, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %223 = add <4 x i32> %vec.phi, %predphi
  %index.next109 = add nuw i64 %index107, 4
  %224 = icmp eq i64 %index.next109, 1024
  br i1 %224, label %._crit_edge.us.i, label %vector.body106, !llvm.loop !23

._crit_edge.us.i:                                 ; preds = %vector.body106
  %225 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %223)
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1
  %exitcond27.not.i = icmp eq i64 %indvars.iv.next24.i, 1024
  br i1 %exitcond27.not.i, label %_Z14compareResultsiiPA1024_fS0_.exit, label %.preheader.us.i61

_Z14compareResultsiiPA1024_fS0_.exit:             ; preds = %._crit_edge.us.i
  %226 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %225) #4
  call void @free(ptr noundef %13) #15
  call void @free(ptr noundef %18) #15
  call void @free(ptr noundef %23) #15
  call void @free(ptr noundef %28) #15
  call void @free(ptr noundef nonnull %33) #15
  call void @free(ptr noundef nonnull %38) #15
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
!15 = distinct !{!15, !2, !3}
!16 = distinct !{!16, !3, !2}
!17 = !{ptr @_Z26__device_stub__mm2_kernel1iiiiffPfS_S_}
!18 = !{ptr @_Z26__device_stub__mm2_kernel2iiiiffPfS_S_}
!19 = distinct !{!19, !2, !3}
!20 = distinct !{!20, !2, !3}
!21 = distinct !{!21, !2, !3}
!22 = distinct !{!22, !2, !3}
!23 = distinct !{!23, !2, !3}
