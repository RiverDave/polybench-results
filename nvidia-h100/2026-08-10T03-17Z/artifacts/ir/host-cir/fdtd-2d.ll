; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/FDTD-2D/fdtd2d.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/FDTD-2D/fdtd2d.cu"
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
define dso_local void @_Z11init_arraysiiiPfPA2048_fS1_S1_(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr nofree noundef writeonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4, ptr nofree noundef writeonly captures(none) %5, ptr nofree noundef writeonly captures(none) %6) local_unnamed_addr #1 {
  %8 = ptrtoaddr ptr %6 to i64
  %9 = ptrtoaddr ptr %4 to i64
  %10 = ptrtoaddr ptr %5 to i64
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.lr.ph.preheader, label %.preheader27

.lr.ph.preheader:                                 ; preds = %7
  %wide.trip.count = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 8
  br i1 %min.iters.check, label %.lr.ph.preheader70, label %vector.ph

vector.ph:                                        ; preds = %.lr.ph.preheader
  %n.vec = and i64 %wide.trip.count, 2147483640
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %12 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %13 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %14 = getelementptr [4 x i8], ptr %3, i64 %index
  %15 = getelementptr i8, ptr %14, i64 16
  store <4 x float> %12, ptr %14, align 4
  store <4 x float> %13, ptr %15, align 4
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %.preheader27, label %.lr.ph.preheader70

.lr.ph.preheader70:                               ; preds = %.lr.ph.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.lr.ph.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph

.preheader27:                                     ; preds = %.lr.ph, %middle.block, %7
  %17 = icmp sgt i32 %1, 0
  %18 = icmp sgt i32 %2, 0
  %or.cond = and i1 %17, %18
  br i1 %or.cond, label %.preheader.preheader, label %._crit_edge32.split

.preheader.preheader:                             ; preds = %.preheader27
  %wide.trip.count42 = zext nneg i32 %1 to i64
  %wide.trip.count37 = zext nneg i32 %2 to i64
  %min.iters.check50 = icmp ult i32 %2, 4
  %19 = sub i64 %9, %10
  %diff.check = icmp ugt i64 %19, -16
  %20 = sub i64 %9, %8
  %diff.check46 = icmp ugt i64 %20, -16
  %conflict.rdx = or i1 %diff.check, %diff.check46
  %21 = sub i64 %10, %8
  %diff.check47 = icmp ugt i64 %21, -16
  %conflict.rdx48 = or i1 %conflict.rdx, %diff.check47
  %n.vec53 = and i64 %wide.trip.count37, 2147483644
  %cmp.n68 = icmp eq i64 %n.vec53, %wide.trip.count37
  br label %.preheader

.lr.ph:                                           ; preds = %.lr.ph.preheader70, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ %indvars.iv.ph, %.lr.ph.preheader70 ]
  %22 = trunc nuw nsw i64 %indvars.iv to i32
  %23 = uitofp nneg i32 %22 to float
  %24 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv
  store float %23, ptr %24, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %.preheader27, label %.lr.ph, !llvm.loop !4

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv39 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next40, %._crit_edge ]
  %25 = trunc nuw nsw i64 %indvars.iv39 to i32
  %26 = uitofp nneg i32 %25 to float
  %27 = getelementptr [8192 x i8], ptr %4, i64 %indvars.iv39
  %28 = trunc i64 %indvars.iv39 to i32
  %29 = add i32 %28, -1
  %30 = sitofp i32 %29 to float
  %31 = getelementptr [8192 x i8], ptr %5, i64 %indvars.iv39
  %32 = trunc i64 %indvars.iv39 to i32
  %33 = add i32 %32, -9
  %34 = sitofp i32 %33 to float
  %35 = getelementptr [8192 x i8], ptr %6, i64 %indvars.iv39
  %brmerge = or i1 %min.iters.check50, %conflict.rdx48
  br i1 %brmerge, label %scalar.ph49.preheader, label %vector.ph51

vector.ph51:                                      ; preds = %.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %26, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert54 = insertelement <4 x float> poison, float %30, i64 0
  %broadcast.splat55 = shufflevector <4 x float> %broadcast.splatinsert54, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert56 = insertelement <4 x float> poison, float %34, i64 0
  %broadcast.splat57 = shufflevector <4 x float> %broadcast.splatinsert56, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body58

vector.body58:                                    ; preds = %vector.body58, %vector.ph51
  %index59 = phi i64 [ 0, %vector.ph51 ], [ %index.next63, %vector.body58 ]
  %vec.ind60 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph51 ], [ %vec.ind.next64, %vector.body58 ]
  %vec.ind61 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph51 ], [ %vec.ind.next65, %vector.body58 ]
  %vec.ind62 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph51 ], [ %vec.ind.next66, %vector.body58 ]
  %36 = trunc <4 x i64> %vec.ind60 to <4 x i32>
  %37 = add <4 x i32> %36, splat (i32 1)
  %38 = uitofp nneg <4 x i32> %37 to <4 x float>
  %39 = fmul nnan <4 x float> %broadcast.splat, %38
  %40 = fadd nnan <4 x float> %39, splat (float 1.000000e+00)
  %41 = fmul nnan <4 x float> %40, splat (float f0x3A000000)
  %42 = getelementptr [4 x i8], ptr %27, i64 %index59
  store <4 x float> %41, ptr %42, align 4
  %43 = add <4 x i32> %vec.ind61, splat (i32 2)
  %44 = uitofp nneg <4 x i32> %43 to <4 x float>
  %45 = fmul nnan <4 x float> %broadcast.splat55, %44
  %46 = fadd nnan <4 x float> %45, splat (float 2.000000e+00)
  %47 = fmul nnan <4 x float> %46, splat (float f0x3A000000)
  %48 = getelementptr [4 x i8], ptr %31, i64 %index59
  store <4 x float> %47, ptr %48, align 4
  %49 = add <4 x i32> %vec.ind62, splat (i32 4)
  %50 = uitofp nneg <4 x i32> %49 to <4 x float>
  %51 = fmul nnan <4 x float> %broadcast.splat57, %50
  %52 = fadd nnan <4 x float> %51, splat (float 3.000000e+00)
  %53 = fmul nnan <4 x float> %52, splat (float f0x3A000000)
  %54 = getelementptr [4 x i8], ptr %35, i64 %index59
  store <4 x float> %53, ptr %54, align 4
  %index.next63 = add nuw i64 %index59, 4
  %vec.ind.next64 = add nuw nsw <4 x i64> %vec.ind60, splat (i64 4)
  %vec.ind.next65 = add <4 x i32> %vec.ind61, splat (i32 4)
  %vec.ind.next66 = add <4 x i32> %vec.ind62, splat (i32 4)
  %55 = icmp eq i64 %index.next63, %n.vec53
  br i1 %55, label %middle.block67, label %vector.body58, !llvm.loop !5

middle.block67:                                   ; preds = %vector.body58
  br i1 %cmp.n68, label %._crit_edge, label %scalar.ph49.preheader

scalar.ph49.preheader:                            ; preds = %.preheader, %middle.block67
  %indvars.iv34.ph = phi i64 [ %n.vec53, %middle.block67 ], [ 0, %.preheader ]
  br label %scalar.ph49

scalar.ph49:                                      ; preds = %scalar.ph49.preheader, %scalar.ph49
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %scalar.ph49 ], [ %indvars.iv34.ph, %scalar.ph49.preheader ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %56 = trunc nuw nsw i64 %indvars.iv.next35 to i32
  %57 = uitofp nneg i32 %56 to float
  %58 = fmul nnan float %26, %57
  %59 = fadd nnan float %58, 1.000000e+00
  %60 = fmul nnan float %59, f0x3A000000
  %61 = getelementptr [4 x i8], ptr %27, i64 %indvars.iv34
  store float %60, ptr %61, align 4
  %62 = trunc i64 %indvars.iv34 to i32
  %63 = add i32 %62, 2
  %64 = uitofp nneg i32 %63 to float
  %65 = fmul nnan float %30, %64
  %66 = fadd nnan float %65, 2.000000e+00
  %67 = fmul nnan float %66, f0x3A000000
  %68 = getelementptr [4 x i8], ptr %31, i64 %indvars.iv34
  store float %67, ptr %68, align 4
  %69 = trunc i64 %indvars.iv34 to i32
  %70 = add i32 %69, 4
  %71 = uitofp nneg i32 %70 to float
  %72 = fmul nnan float %34, %71
  %73 = fadd nnan float %72, 3.000000e+00
  %74 = fmul nnan float %73, f0x3A000000
  %75 = getelementptr [4 x i8], ptr %35, i64 %indvars.iv34
  store float %74, ptr %75, align 4
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %._crit_edge, label %scalar.ph49, !llvm.loop !6

._crit_edge:                                      ; preds = %scalar.ph49, %middle.block67
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond43.not = icmp eq i64 %indvars.iv.next40, %wide.trip.count42
  br i1 %exitcond43.not, label %._crit_edge32.split, label %.preheader

._crit_edge32.split:                              ; preds = %._crit_edge, %.preheader27
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define dso_local void @_Z7runFdtdiiiPfPA2048_fS1_S1_(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef captures(none) %4, ptr nofree noundef captures(none) %5, ptr nofree noundef captures(none) %6) local_unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader80.lr.ph, label %._crit_edge95

.preheader80.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %2, 0
  %10 = icmp slt i32 %1, 2
  %11 = icmp slt i32 %2, 1
  %12 = icmp slt i32 %1, 1
  %13 = icmp slt i32 %2, 2
  %14 = add i32 %1, -1
  %15 = add i32 %2, -1
  %wide.trip.count137 = zext nneg i32 %0 to i64
  %wide.trip.count = zext i32 %2 to i64
  %brmerge = or i1 %10, %11
  %wide.trip.count112 = zext i32 %1 to i64
  %wide.trip.count107 = zext nneg i32 %2 to i64
  %brmerge99 = or i1 %12, %13
  %wide.trip.count122 = zext nneg i32 %1 to i64
  %wide.trip.count117 = zext i32 %2 to i64
  %brmerge102 = or i1 %10, %13
  %wide.trip.count132 = zext i32 %14 to i64
  %wide.trip.count127 = zext i32 %15 to i64
  %16 = shl nuw nsw i64 %wide.trip.count132, 13
  %17 = shl nuw nsw i64 %wide.trip.count127, 2
  %18 = add nuw nsw i64 %16, %17
  %19 = getelementptr i8, ptr %6, i64 %18
  %scevgep = getelementptr i8, ptr %19, i64 -8192
  %20 = getelementptr i8, ptr %4, i64 %18
  %scevgep145 = getelementptr i8, ptr %20, i64 -8188
  %scevgep146 = getelementptr i8, ptr %5, i64 %18
  %scevgep155 = getelementptr i8, ptr %4, i64 4
  %21 = shl nuw nsw i64 %wide.trip.count112, 13
  %22 = shl nuw nsw i64 %wide.trip.count, 2
  %23 = add nuw nsw i64 %21, %22
  %24 = add nsw i64 %23, -8192
  %scevgep156 = getelementptr i8, ptr %4, i64 %24
  %scevgep157 = getelementptr i8, ptr %6, i64 %24
  %scevgep176 = getelementptr i8, ptr %5, i64 8192
  %25 = shl nuw nsw i64 %wide.trip.count112, 13
  %26 = shl nuw nsw i64 %wide.trip.count, 2
  %27 = add nuw nsw i64 %25, %26
  %28 = add nsw i64 %27, -8192
  %scevgep177 = getelementptr i8, ptr %5, i64 %28
  %scevgep178 = getelementptr i8, ptr %6, i64 %28
  %min.iters.check197 = icmp ult i32 %2, 8
  %n.vec200 = and i64 %wide.trip.count, 2147483640
  %cmp.n205 = icmp eq i64 %n.vec200, %wide.trip.count
  %min.iters.check183 = icmp ult i32 %2, 4
  %bound0179 = icmp ult ptr %scevgep176, %scevgep178
  %bound1180 = icmp ult ptr %6, %scevgep177
  %found.conflict181 = and i1 %bound0179, %bound1180
  %n.vec186 = and i64 %wide.trip.count, 2147483644
  %cmp.n194 = icmp eq i64 %n.vec186, %wide.trip.count
  %xtraiter = and i64 %wide.trip.count117, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %29 = add nsw i64 %wide.trip.count117, -1
  %30 = add nsw i64 %wide.trip.count, -1
  %min.iters.check162 = icmp ult i32 %2, 5
  %bound0158 = icmp ult ptr %scevgep155, %scevgep157
  %bound1159 = icmp ult ptr %6, %scevgep156
  %found.conflict160 = and i1 %bound0158, %bound1159
  %n.vec165 = and i64 %30, -4
  %31 = or disjoint i64 %n.vec165, 1
  %cmp.n173 = icmp eq i64 %30, %n.vec165
  %32 = and i64 %wide.trip.count117, 1
  %lcmp.mod208.not.not = icmp eq i64 %32, 0
  %33 = add nsw i64 %wide.trip.count117, -1
  %min.iters.check = icmp ult i32 %2, 5
  %bound0 = icmp ult ptr %6, %scevgep145
  %bound1 = icmp ult ptr %4, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  %bound0147 = icmp ult ptr %6, %scevgep146
  %bound1148 = icmp ult ptr %5, %scevgep
  %found.conflict149 = and i1 %bound0147, %bound1148
  %conflict.rdx = or i1 %found.conflict, %found.conflict149
  %n.vec = and i64 %wide.trip.count127, 4294967292
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count127
  br label %.preheader80

.preheader80:                                     ; preds = %.preheader80.lr.ph, %._crit_edge93.split
  %indvars.iv134 = phi i64 [ 0, %.preheader80.lr.ph ], [ %indvars.iv.next135, %._crit_edge93.split ]
  br i1 %9, label %.lr.ph, label %._crit_edge93.split

.lr.ph:                                           ; preds = %.preheader80
  %34 = getelementptr [4 x i8], ptr %3, i64 %indvars.iv134
  %.pre = load float, ptr %34, align 4
  br i1 %min.iters.check197, label %scalar.ph196.preheader, label %vector.ph198

vector.ph198:                                     ; preds = %.lr.ph
  %broadcast.splatinsert = insertelement <4 x float> poison, float %.pre, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body201

vector.body201:                                   ; preds = %vector.body201, %vector.ph198
  %index202 = phi i64 [ 0, %vector.ph198 ], [ %index.next203, %vector.body201 ]
  %35 = getelementptr [4 x i8], ptr %5, i64 %index202
  %36 = getelementptr i8, ptr %35, i64 16
  store <4 x float> %broadcast.splat, ptr %35, align 4
  store <4 x float> %broadcast.splat, ptr %36, align 4
  %index.next203 = add nuw i64 %index202, 8
  %37 = icmp eq i64 %index.next203, %n.vec200
  br i1 %37, label %middle.block204, label %vector.body201, !llvm.loop !7

middle.block204:                                  ; preds = %vector.body201
  br i1 %cmp.n205, label %.preheader79, label %scalar.ph196.preheader

scalar.ph196.preheader:                           ; preds = %.lr.ph, %middle.block204
  %indvars.iv.ph = phi i64 [ 0, %.lr.ph ], [ %n.vec200, %middle.block204 ]
  br label %scalar.ph196

.preheader79:                                     ; preds = %scalar.ph196, %middle.block204
  br i1 %brmerge, label %.preheader78, label %.preheader76

scalar.ph196:                                     ; preds = %scalar.ph196.preheader, %scalar.ph196
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph196 ], [ %indvars.iv.ph, %scalar.ph196.preheader ]
  %38 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv
  store float %.pre, ptr %38, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %.preheader79, label %scalar.ph196, !llvm.loop !8

.preheader78:                                     ; preds = %._crit_edge, %.preheader79
  br i1 %brmerge99, label %.preheader77, label %.preheader75

.preheader76:                                     ; preds = %.preheader79, %._crit_edge
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %._crit_edge ], [ 1, %.preheader79 ]
  %39 = getelementptr [8192 x i8], ptr %5, i64 %indvars.iv109
  %40 = getelementptr [8192 x i8], ptr %6, i64 %indvars.iv109
  %41 = getelementptr i8, ptr %40, i64 -8192
  %brmerge209 = select i1 %min.iters.check183, i1 true, i1 %found.conflict181
  br i1 %brmerge209, label %scalar.ph182.preheader, label %vector.body187

vector.body187:                                   ; preds = %.preheader76, %vector.body187
  %index188 = phi i64 [ %index.next192, %vector.body187 ], [ 0, %.preheader76 ]
  %42 = getelementptr [4 x i8], ptr %39, i64 %index188
  %wide.load189 = load <4 x float>, ptr %42, align 4, !alias.scope !9, !noalias !12
  %43 = fpext <4 x float> %wide.load189 to <4 x double>
  %44 = getelementptr [4 x i8], ptr %40, i64 %index188
  %wide.load190 = load <4 x float>, ptr %44, align 4, !alias.scope !12
  %45 = getelementptr [4 x i8], ptr %41, i64 %index188
  %wide.load191 = load <4 x float>, ptr %45, align 4, !alias.scope !12
  %46 = fsub <4 x float> %wide.load190, %wide.load191
  %47 = fpext <4 x float> %46 to <4 x double>
  %48 = fmul <4 x double> %47, splat (double 5.000000e-01)
  %49 = fsub <4 x double> %43, %48
  %50 = fptrunc <4 x double> %49 to <4 x float>
  store <4 x float> %50, ptr %42, align 4, !alias.scope !9, !noalias !12
  %index.next192 = add nuw i64 %index188, 4
  %51 = icmp eq i64 %index.next192, %n.vec186
  br i1 %51, label %middle.block193, label %vector.body187, !llvm.loop !14

middle.block193:                                  ; preds = %vector.body187
  br i1 %cmp.n194, label %._crit_edge, label %scalar.ph182.preheader

scalar.ph182.preheader:                           ; preds = %.preheader76, %middle.block193
  %indvars.iv104.ph = phi i64 [ %n.vec186, %middle.block193 ], [ 0, %.preheader76 ]
  br i1 %lcmp.mod.not, label %scalar.ph182.prol.loopexit, label %scalar.ph182.prol

scalar.ph182.prol:                                ; preds = %scalar.ph182.preheader
  %52 = getelementptr [4 x i8], ptr %39, i64 %indvars.iv104.ph
  %53 = load float, ptr %52, align 4
  %54 = fpext float %53 to double
  %55 = getelementptr [4 x i8], ptr %40, i64 %indvars.iv104.ph
  %56 = load float, ptr %55, align 4
  %57 = getelementptr [4 x i8], ptr %41, i64 %indvars.iv104.ph
  %58 = load float, ptr %57, align 4
  %59 = fsub float %56, %58
  %60 = fpext float %59 to double
  %61 = fmul double %60, 5.000000e-01
  %62 = fsub double %54, %61
  %63 = fptrunc double %62 to float
  store float %63, ptr %52, align 4
  %indvars.iv.next105.prol = or disjoint i64 %indvars.iv104.ph, 1
  br label %scalar.ph182.prol.loopexit

scalar.ph182.prol.loopexit:                       ; preds = %scalar.ph182.prol, %scalar.ph182.preheader
  %indvars.iv104.unr = phi i64 [ %indvars.iv104.ph, %scalar.ph182.preheader ], [ %indvars.iv.next105.prol, %scalar.ph182.prol ]
  %64 = icmp eq i64 %indvars.iv104.ph, %29
  br i1 %64, label %._crit_edge, label %scalar.ph182

scalar.ph182:                                     ; preds = %scalar.ph182.prol.loopexit, %scalar.ph182
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.1, %scalar.ph182 ], [ %indvars.iv104.unr, %scalar.ph182.prol.loopexit ]
  %65 = getelementptr [4 x i8], ptr %39, i64 %indvars.iv104
  %66 = load float, ptr %65, align 4
  %67 = fpext float %66 to double
  %68 = getelementptr [4 x i8], ptr %40, i64 %indvars.iv104
  %69 = load float, ptr %68, align 4
  %70 = getelementptr [4 x i8], ptr %41, i64 %indvars.iv104
  %71 = load float, ptr %70, align 4
  %72 = fsub float %69, %71
  %73 = fpext float %72 to double
  %74 = fmul double %73, 5.000000e-01
  %75 = fsub double %67, %74
  %76 = fptrunc double %75 to float
  store float %76, ptr %65, align 4
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %77 = getelementptr [4 x i8], ptr %39, i64 %indvars.iv.next105
  %78 = load float, ptr %77, align 4
  %79 = fpext float %78 to double
  %80 = getelementptr [4 x i8], ptr %40, i64 %indvars.iv.next105
  %81 = load float, ptr %80, align 4
  %82 = getelementptr [4 x i8], ptr %41, i64 %indvars.iv.next105
  %83 = load float, ptr %82, align 4
  %84 = fsub float %81, %83
  %85 = fpext float %84 to double
  %86 = fmul double %85, 5.000000e-01
  %87 = fsub double %79, %86
  %88 = fptrunc double %87 to float
  store float %88, ptr %77, align 4
  %indvars.iv.next105.1 = add nuw nsw i64 %indvars.iv104, 2
  %exitcond108.not.1 = icmp eq i64 %indvars.iv.next105.1, %wide.trip.count107
  br i1 %exitcond108.not.1, label %._crit_edge, label %scalar.ph182, !llvm.loop !15

._crit_edge:                                      ; preds = %scalar.ph182.prol.loopexit, %scalar.ph182, %middle.block193
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond113.not = icmp eq i64 %indvars.iv.next110, %wide.trip.count112
  br i1 %exitcond113.not, label %.preheader78, label %.preheader76

.preheader77:                                     ; preds = %._crit_edge87, %.preheader78
  br i1 %brmerge102, label %._crit_edge93.split, label %.preheader

.preheader75:                                     ; preds = %.preheader78, %._crit_edge87
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %._crit_edge87 ], [ 0, %.preheader78 ]
  %89 = getelementptr [8192 x i8], ptr %4, i64 %indvars.iv119
  %90 = getelementptr [8192 x i8], ptr %6, i64 %indvars.iv119
  %brmerge210 = select i1 %min.iters.check162, i1 true, i1 %found.conflict160
  br i1 %brmerge210, label %scalar.ph161.preheader, label %vector.body166

vector.body166:                                   ; preds = %.preheader75, %vector.body166
  %index167 = phi i64 [ %index.next171, %vector.body166 ], [ 0, %.preheader75 ]
  %91 = or disjoint i64 %index167, 1
  %92 = getelementptr [4 x i8], ptr %89, i64 %91
  %wide.load168 = load <4 x float>, ptr %92, align 4, !alias.scope !16, !noalias !19
  %93 = fpext <4 x float> %wide.load168 to <4 x double>
  %94 = getelementptr [4 x i8], ptr %90, i64 %91
  %wide.load169 = load <4 x float>, ptr %94, align 4, !alias.scope !19
  %95 = getelementptr i8, ptr %94, i64 -4
  %wide.load170 = load <4 x float>, ptr %95, align 4, !alias.scope !19
  %96 = fsub <4 x float> %wide.load169, %wide.load170
  %97 = fpext <4 x float> %96 to <4 x double>
  %98 = fmul <4 x double> %97, splat (double 5.000000e-01)
  %99 = fsub <4 x double> %93, %98
  %100 = fptrunc <4 x double> %99 to <4 x float>
  store <4 x float> %100, ptr %92, align 4, !alias.scope !16, !noalias !19
  %index.next171 = add nuw i64 %index167, 4
  %101 = icmp eq i64 %index.next171, %n.vec165
  br i1 %101, label %middle.block172, label %vector.body166, !llvm.loop !21

middle.block172:                                  ; preds = %vector.body166
  br i1 %cmp.n173, label %._crit_edge87, label %scalar.ph161.preheader

scalar.ph161.preheader:                           ; preds = %.preheader75, %middle.block172
  %indvars.iv114.ph = phi i64 [ %31, %middle.block172 ], [ 1, %.preheader75 ]
  br i1 %lcmp.mod208.not.not, label %scalar.ph161.prol, label %scalar.ph161.prol.loopexit

scalar.ph161.prol:                                ; preds = %scalar.ph161.preheader
  %102 = getelementptr [4 x i8], ptr %89, i64 %indvars.iv114.ph
  %103 = load float, ptr %102, align 4
  %104 = fpext float %103 to double
  %105 = getelementptr [4 x i8], ptr %90, i64 %indvars.iv114.ph
  %106 = load float, ptr %105, align 4
  %107 = getelementptr i8, ptr %105, i64 -4
  %108 = load float, ptr %107, align 4
  %109 = fsub float %106, %108
  %110 = fpext float %109 to double
  %111 = fmul double %110, 5.000000e-01
  %112 = fsub double %104, %111
  %113 = fptrunc double %112 to float
  store float %113, ptr %102, align 4
  %indvars.iv.next115.prol = add nuw nsw i64 %indvars.iv114.ph, 1
  br label %scalar.ph161.prol.loopexit

scalar.ph161.prol.loopexit:                       ; preds = %scalar.ph161.prol, %scalar.ph161.preheader
  %indvars.iv114.unr = phi i64 [ %indvars.iv114.ph, %scalar.ph161.preheader ], [ %indvars.iv.next115.prol, %scalar.ph161.prol ]
  %114 = icmp eq i64 %indvars.iv114.ph, %33
  br i1 %114, label %._crit_edge87, label %scalar.ph161

scalar.ph161:                                     ; preds = %scalar.ph161.prol.loopexit, %scalar.ph161
  %indvars.iv114 = phi i64 [ %indvars.iv.next115.1, %scalar.ph161 ], [ %indvars.iv114.unr, %scalar.ph161.prol.loopexit ]
  %115 = getelementptr [4 x i8], ptr %89, i64 %indvars.iv114
  %116 = load float, ptr %115, align 4
  %117 = fpext float %116 to double
  %118 = getelementptr [4 x i8], ptr %90, i64 %indvars.iv114
  %119 = load float, ptr %118, align 4
  %120 = getelementptr i8, ptr %118, i64 -4
  %121 = load float, ptr %120, align 4
  %122 = fsub float %119, %121
  %123 = fpext float %122 to double
  %124 = fmul double %123, 5.000000e-01
  %125 = fsub double %117, %124
  %126 = fptrunc double %125 to float
  store float %126, ptr %115, align 4
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %127 = getelementptr [4 x i8], ptr %89, i64 %indvars.iv.next115
  %128 = load float, ptr %127, align 4
  %129 = fpext float %128 to double
  %130 = getelementptr [4 x i8], ptr %90, i64 %indvars.iv.next115
  %131 = load float, ptr %130, align 4
  %132 = getelementptr i8, ptr %130, i64 -4
  %133 = load float, ptr %132, align 4
  %134 = fsub float %131, %133
  %135 = fpext float %134 to double
  %136 = fmul double %135, 5.000000e-01
  %137 = fsub double %129, %136
  %138 = fptrunc double %137 to float
  store float %138, ptr %127, align 4
  %indvars.iv.next115.1 = add nuw nsw i64 %indvars.iv114, 2
  %exitcond118.not.1 = icmp eq i64 %indvars.iv.next115.1, %wide.trip.count117
  br i1 %exitcond118.not.1, label %._crit_edge87, label %scalar.ph161, !llvm.loop !22

._crit_edge87:                                    ; preds = %scalar.ph161.prol.loopexit, %scalar.ph161, %middle.block172
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond123.not = icmp eq i64 %indvars.iv.next120, %wide.trip.count122
  br i1 %exitcond123.not, label %.preheader77, label %.preheader75

.preheader:                                       ; preds = %.preheader77, %._crit_edge91
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge91 ], [ 0, %.preheader77 ]
  %139 = getelementptr [8192 x i8], ptr %6, i64 %indvars.iv129
  %140 = getelementptr [8192 x i8], ptr %4, i64 %indvars.iv129
  %141 = getelementptr [8192 x i8], ptr %5, i64 %indvars.iv129
  %142 = getelementptr i8, ptr %141, i64 8192
  %brmerge211 = select i1 %min.iters.check, i1 true, i1 %conflict.rdx
  br i1 %brmerge211, label %scalar.ph.preheader, label %vector.body

vector.body:                                      ; preds = %.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader ]
  %143 = getelementptr [4 x i8], ptr %139, i64 %index
  %wide.load = load <4 x float>, ptr %143, align 4, !alias.scope !23, !noalias !26
  %144 = fpext <4 x float> %wide.load to <4 x double>
  %145 = getelementptr [4 x i8], ptr %140, i64 %index
  %146 = getelementptr i8, ptr %145, i64 4
  %wide.load150 = load <4 x float>, ptr %146, align 4, !alias.scope !29
  %147 = getelementptr [4 x i8], ptr %140, i64 %index
  %wide.load151 = load <4 x float>, ptr %147, align 4, !alias.scope !29
  %148 = fsub <4 x float> %wide.load150, %wide.load151
  %149 = getelementptr [4 x i8], ptr %142, i64 %index
  %wide.load152 = load <4 x float>, ptr %149, align 4, !alias.scope !30
  %150 = fadd <4 x float> %148, %wide.load152
  %151 = getelementptr [4 x i8], ptr %141, i64 %index
  %wide.load153 = load <4 x float>, ptr %151, align 4, !alias.scope !30
  %152 = fsub <4 x float> %150, %wide.load153
  %153 = fpext <4 x float> %152 to <4 x double>
  %154 = fmul <4 x double> %153, splat (double f0x3FE6666666666666)
  %155 = fsub <4 x double> %144, %154
  %156 = fptrunc <4 x double> %155 to <4 x float>
  store <4 x float> %156, ptr %143, align 4, !alias.scope !23, !noalias !26
  %index.next = add nuw i64 %index, 4
  %157 = icmp eq i64 %index.next, %n.vec
  br i1 %157, label %middle.block, label %vector.body, !llvm.loop !31

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge91, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader, %middle.block
  %indvars.iv124.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %.preheader ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %scalar.ph ], [ %indvars.iv124.ph, %scalar.ph.preheader ]
  %158 = getelementptr [4 x i8], ptr %139, i64 %indvars.iv124
  %159 = load float, ptr %158, align 4
  %160 = fpext float %159 to double
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %161 = getelementptr [4 x i8], ptr %140, i64 %indvars.iv.next125
  %162 = load float, ptr %161, align 4
  %163 = getelementptr [4 x i8], ptr %140, i64 %indvars.iv124
  %164 = load float, ptr %163, align 4
  %165 = fsub float %162, %164
  %166 = getelementptr [4 x i8], ptr %142, i64 %indvars.iv124
  %167 = load float, ptr %166, align 4
  %168 = fadd float %165, %167
  %169 = getelementptr [4 x i8], ptr %141, i64 %indvars.iv124
  %170 = load float, ptr %169, align 4
  %171 = fsub float %168, %170
  %172 = fpext float %171 to double
  %173 = fmul double %172, f0x3FE6666666666666
  %174 = fsub double %160, %173
  %175 = fptrunc double %174 to float
  store float %175, ptr %158, align 4
  %exitcond128.not = icmp eq i64 %indvars.iv.next125, %wide.trip.count127
  br i1 %exitcond128.not, label %._crit_edge91, label %scalar.ph, !llvm.loop !32

._crit_edge91:                                    ; preds = %scalar.ph, %middle.block
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond133.not = icmp eq i64 %indvars.iv.next130, %wide.trip.count132
  br i1 %exitcond133.not, label %._crit_edge93.split, label %.preheader

._crit_edge93.split:                              ; preds = %._crit_edge91, %.preheader80, %.preheader77
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond138.not = icmp eq i64 %indvars.iv.next135, %wide.trip.count137
  br i1 %exitcond138.not, label %._crit_edge95, label %.preheader80

._crit_edge95:                                    ; preds = %._crit_edge93.split, %7
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
  %40 = fcmp ogt <4 x double> %39, splat (double 1.005000e+01)
  %.not31 = select <4 x i1> %18, <4 x i1> splat (i1 true), <4 x i1> %23
  %narrow = select <4 x i1> %.not31, <4 x i1> %40, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %41 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !33

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
  %74 = fcmp ogt double %73, 1.005000e+01
  %75 = zext i1 %74 to i32
  br label %_Z11percentDiffdd.exit.us

_Z11percentDiffdd.exit.us:                        ; preds = %.critedge.i.us, %54
  %common.ret.op.i.us = phi i32 [ %75, %.critedge.i.us ], [ 0, %54 ]
  %.2.us = add nsw i32 %common.ret.op.i.us, %.116.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !34

._crit_edge.us:                                   ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %.2.us.lcssa = phi i32 [ %43, %middle.block ], [ %.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27.not = icmp eq i64 %indvars.iv.next24, %wide.trip.count26
  br i1 %exitcond27.not, label %._crit_edge19, label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge.us, %4
  %.0.lcssa = phi i32 [ 0, %4 ], [ %.2.us.lcssa, %._crit_edge.us ]
  %76 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 1.005000e+01, i32 noundef %.0.lcssa) #5
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

define dso_local void @_Z32__device_stub__fdtd_step1_kerneliiPfS_S_S_i(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, i32 noundef %6) #6 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store ptr %5, ptr %13, align 8
  store i32 %6, ptr %14, align 4
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
  %29 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z32__device_stub__fdtd_step1_kerneliiPfS_S_S_i, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %15, i64 noundef %27, ptr noundef %28)
  ret void
}

define dso_local void @_Z32__device_stub__fdtd_step2_kerneliiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #6 {
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
  %26 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z32__device_stub__fdtd_step2_kerneliiPfS_S_i, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %13, i64 noundef %24, ptr noundef %25)
  ret void
}

define dso_local void @_Z32__device_stub__fdtd_step3_kerneliiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #6 {
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
  %26 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z32__device_stub__fdtd_step3_kerneliiPfS_S_i, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %13, i64 noundef %24, ptr noundef %25)
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

define dso_local void @_Z8fdtdCudaiiiPfPA2048_fS1_S1_S1_(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) local_unnamed_addr #6 {
  %9 = alloca %struct.timeval, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca [6 x ptr], align 16
  %17 = alloca %struct.dim3, align 8
  %18 = alloca %struct.dim3, align 8
  %19 = alloca i64, align 8
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca i32, align 4
  %27 = alloca [6 x ptr], align 16
  %28 = alloca %struct.dim3, align 8
  %29 = alloca %struct.dim3, align 8
  %30 = alloca i64, align 8
  %31 = alloca ptr, align 8
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca ptr, align 8
  %35 = alloca ptr, align 8
  %36 = alloca ptr, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca [7 x ptr], align 16
  %40 = alloca %struct.dim3, align 8
  %41 = alloca %struct.dim3, align 8
  %42 = alloca i64, align 8
  %43 = alloca ptr, align 8
  %44 = alloca %struct.timeval, align 8
  %45 = alloca ptr, align 8
  %46 = alloca ptr, align 8
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = call i32 @cudaMalloc(ptr noundef nonnull %45, i64 noundef 2000) #5
  %50 = call i32 @cudaMalloc(ptr noundef nonnull %46, i64 noundef 16777216) #5
  %51 = call i32 @cudaMalloc(ptr noundef nonnull %47, i64 noundef 16777216) #5
  %52 = call i32 @cudaMalloc(ptr noundef nonnull %48, i64 noundef 16777216) #5
  %53 = load ptr, ptr %45, align 8
  %54 = call i32 @cudaMemcpy(ptr noundef %53, ptr noundef %3, i64 noundef 2000, i32 noundef 1) #5
  %55 = load ptr, ptr %46, align 8
  %56 = call i32 @cudaMemcpy(ptr noundef %55, ptr noundef %4, i64 noundef 16777216, i32 noundef 1) #5
  %57 = load ptr, ptr %47, align 8
  %58 = call i32 @cudaMemcpy(ptr noundef %57, ptr noundef %5, i64 noundef 16777216, i32 noundef 1) #5
  %59 = load ptr, ptr %48, align 8
  %60 = call i32 @cudaMemcpy(ptr noundef %59, ptr noundef %6, i64 noundef 16777216, i32 noundef 1) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %44)
  %61 = call i32 @gettimeofday(ptr noundef nonnull %44, ptr noundef null) #13
  %.not.i.i = icmp eq i32 %61, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %62

62:                                               ; preds = %8
  %63 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %61) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %8, %62
  %64 = load i64, ptr %44, align 8
  %65 = sitofp i64 %64 to double
  %66 = getelementptr inbounds nuw i8, ptr %44, i64 8
  %67 = load i64, ptr %66, align 8
  %68 = sitofp i64 %67 to double
  %69 = fmul nnan double %68, f0x3EB0C6F7A0B5ED8D
  %70 = fadd double %69, %65
  call void @llvm.lifetime.end.p0(ptr nonnull %44)
  store double %70, ptr @polybench_t_start, align 8
  %71 = icmp sgt i32 %0, 0
  br i1 %71, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %_Z21polybench_timer_startv.exit
  %72 = getelementptr inbounds nuw i8, ptr %39, i64 8
  %73 = getelementptr inbounds nuw i8, ptr %39, i64 16
  %74 = getelementptr inbounds nuw i8, ptr %39, i64 24
  %75 = getelementptr inbounds nuw i8, ptr %39, i64 32
  %76 = getelementptr inbounds nuw i8, ptr %39, i64 40
  %77 = getelementptr inbounds nuw i8, ptr %39, i64 48
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %40, i64 4
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %40, i64 8
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %41, i64 4
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %41, i64 8
  %78 = getelementptr inbounds nuw i8, ptr %27, i64 8
  %79 = getelementptr inbounds nuw i8, ptr %27, i64 16
  %80 = getelementptr inbounds nuw i8, ptr %27, i64 24
  %81 = getelementptr inbounds nuw i8, ptr %27, i64 32
  %82 = getelementptr inbounds nuw i8, ptr %27, i64 40
  %.fca.1.gep4.i50 = getelementptr inbounds nuw i8, ptr %28, i64 4
  %.fca.2.gep7.i53 = getelementptr inbounds nuw i8, ptr %28, i64 8
  %.fca.1.gep.i58 = getelementptr inbounds nuw i8, ptr %29, i64 4
  %.fca.2.gep.i61 = getelementptr inbounds nuw i8, ptr %29, i64 8
  %83 = getelementptr inbounds nuw i8, ptr %16, i64 8
  %84 = getelementptr inbounds nuw i8, ptr %16, i64 16
  %85 = getelementptr inbounds nuw i8, ptr %16, i64 24
  %86 = getelementptr inbounds nuw i8, ptr %16, i64 32
  %87 = getelementptr inbounds nuw i8, ptr %16, i64 40
  %.fca.1.gep4.i66 = getelementptr inbounds nuw i8, ptr %17, i64 4
  %.fca.2.gep7.i69 = getelementptr inbounds nuw i8, ptr %17, i64 8
  %.fca.1.gep.i74 = getelementptr inbounds nuw i8, ptr %18, i64 4
  %.fca.2.gep.i77 = getelementptr inbounds nuw i8, ptr %18, i64 8
  br label %88

88:                                               ; preds = %.lr.ph, %121
  %.096 = phi i32 [ 0, %.lr.ph ], [ %123, %121 ]
  %89 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 64, i32 256, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %89, 0
  br i1 %.not, label %90, label %99

90:                                               ; preds = %88
  %91 = load ptr, ptr %45, align 8
  %92 = load ptr, ptr %46, align 8
  %93 = load ptr, ptr %47, align 8
  %94 = load ptr, ptr %48, align 8
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
  call void @llvm.lifetime.start.p0(ptr nonnull %42)
  call void @llvm.lifetime.start.p0(ptr nonnull %43)
  store i32 %1, ptr %32, align 4
  store i32 %2, ptr %33, align 4
  store ptr %91, ptr %34, align 8
  store ptr %92, ptr %35, align 8
  store ptr %93, ptr %36, align 8
  store ptr %94, ptr %37, align 8
  store i32 %.096, ptr %38, align 4
  store ptr %32, ptr %39, align 16
  store ptr %33, ptr %72, align 8
  store ptr %34, ptr %73, align 16
  store ptr %35, ptr %74, align 8
  store ptr %36, ptr %75, align 16
  store ptr %37, ptr %76, align 8
  store ptr %38, ptr %77, align 16
  %95 = call i32 @__cudaPopCallConfiguration(ptr nonnull %40, ptr nonnull %41, ptr nonnull %42, ptr nonnull %43), !inline_history !35
  %96 = load i64, ptr %42, align 8
  %97 = load ptr, ptr %43, align 8
  %.fca.0.load2.i = load i32, ptr %40, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %41, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %98 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z32__device_stub__fdtd_step1_kerneliiPfS_S_S_i, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %39, i64 noundef %96, ptr noundef %97), !inline_history !35
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
  call void @llvm.lifetime.end.p0(ptr nonnull %42)
  call void @llvm.lifetime.end.p0(ptr nonnull %43)
  br label %99

99:                                               ; preds = %88, %90
  %100 = call i32 @cudaThreadSynchronize() #5
  %101 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 64, i32 256, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not46 = icmp eq i32 %101, 0
  br i1 %.not46, label %102, label %110

102:                                              ; preds = %99
  %103 = load ptr, ptr %46, align 8
  %104 = load ptr, ptr %47, align 8
  %105 = load ptr, ptr %48, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %21)
  call void @llvm.lifetime.start.p0(ptr nonnull %22)
  call void @llvm.lifetime.start.p0(ptr nonnull %23)
  call void @llvm.lifetime.start.p0(ptr nonnull %24)
  call void @llvm.lifetime.start.p0(ptr nonnull %25)
  call void @llvm.lifetime.start.p0(ptr nonnull %26)
  call void @llvm.lifetime.start.p0(ptr nonnull %27)
  call void @llvm.lifetime.start.p0(ptr nonnull %28)
  call void @llvm.lifetime.start.p0(ptr nonnull %29)
  call void @llvm.lifetime.start.p0(ptr nonnull %30)
  call void @llvm.lifetime.start.p0(ptr nonnull %31)
  store i32 %1, ptr %21, align 4
  store i32 %2, ptr %22, align 4
  store ptr %103, ptr %23, align 8
  store ptr %104, ptr %24, align 8
  store ptr %105, ptr %25, align 8
  store i32 %.096, ptr %26, align 4
  store ptr %21, ptr %27, align 16
  store ptr %22, ptr %78, align 8
  store ptr %23, ptr %79, align 16
  store ptr %24, ptr %80, align 8
  store ptr %25, ptr %81, align 16
  store ptr %26, ptr %82, align 8
  %106 = call i32 @__cudaPopCallConfiguration(ptr nonnull %28, ptr nonnull %29, ptr nonnull %30, ptr nonnull %31), !inline_history !36
  %107 = load i64, ptr %30, align 8
  %108 = load ptr, ptr %31, align 8
  %.fca.0.load2.i48 = load i32, ptr %28, align 8
  %.fca.0.insert3.i49 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i48, 0
  %.fca.1.load5.i51 = load i32, ptr %.fca.1.gep4.i50, align 4
  %.fca.1.insert6.i52 = insertvalue %struct.dim3 %.fca.0.insert3.i49, i32 %.fca.1.load5.i51, 1
  %.fca.2.load8.i54 = load i32, ptr %.fca.2.gep7.i53, align 8
  %.fca.2.insert9.i55 = insertvalue %struct.dim3 %.fca.1.insert6.i52, i32 %.fca.2.load8.i54, 2
  %.fca.0.load.i56 = load i32, ptr %29, align 8
  %.fca.0.insert.i57 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i56, 0
  %.fca.1.load.i59 = load i32, ptr %.fca.1.gep.i58, align 4
  %.fca.1.insert.i60 = insertvalue %struct.dim3 %.fca.0.insert.i57, i32 %.fca.1.load.i59, 1
  %.fca.2.load.i62 = load i32, ptr %.fca.2.gep.i61, align 8
  %.fca.2.insert.i63 = insertvalue %struct.dim3 %.fca.1.insert.i60, i32 %.fca.2.load.i62, 2
  %109 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z32__device_stub__fdtd_step2_kerneliiPfS_S_i, %struct.dim3 %.fca.2.insert9.i55, %struct.dim3 %.fca.2.insert.i63, ptr noundef nonnull %27, i64 noundef %107, ptr noundef %108), !inline_history !36
  call void @llvm.lifetime.end.p0(ptr nonnull %21)
  call void @llvm.lifetime.end.p0(ptr nonnull %22)
  call void @llvm.lifetime.end.p0(ptr nonnull %23)
  call void @llvm.lifetime.end.p0(ptr nonnull %24)
  call void @llvm.lifetime.end.p0(ptr nonnull %25)
  call void @llvm.lifetime.end.p0(ptr nonnull %26)
  call void @llvm.lifetime.end.p0(ptr nonnull %27)
  call void @llvm.lifetime.end.p0(ptr nonnull %28)
  call void @llvm.lifetime.end.p0(ptr nonnull %29)
  call void @llvm.lifetime.end.p0(ptr nonnull %30)
  call void @llvm.lifetime.end.p0(ptr nonnull %31)
  br label %110

110:                                              ; preds = %99, %102
  %111 = call i32 @cudaThreadSynchronize() #5
  %112 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 64, i32 256, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not47 = icmp eq i32 %112, 0
  br i1 %.not47, label %113, label %121

113:                                              ; preds = %110
  %114 = load ptr, ptr %46, align 8
  %115 = load ptr, ptr %47, align 8
  %116 = load ptr, ptr %48, align 8
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
  store i32 %1, ptr %10, align 4
  store i32 %2, ptr %11, align 4
  store ptr %114, ptr %12, align 8
  store ptr %115, ptr %13, align 8
  store ptr %116, ptr %14, align 8
  store i32 %.096, ptr %15, align 4
  store ptr %10, ptr %16, align 16
  store ptr %11, ptr %83, align 8
  store ptr %12, ptr %84, align 16
  store ptr %13, ptr %85, align 8
  store ptr %14, ptr %86, align 16
  store ptr %15, ptr %87, align 8
  %117 = call i32 @__cudaPopCallConfiguration(ptr nonnull %17, ptr nonnull %18, ptr nonnull %19, ptr nonnull %20), !inline_history !37
  %118 = load i64, ptr %19, align 8
  %119 = load ptr, ptr %20, align 8
  %.fca.0.load2.i64 = load i32, ptr %17, align 8
  %.fca.0.insert3.i65 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i64, 0
  %.fca.1.load5.i67 = load i32, ptr %.fca.1.gep4.i66, align 4
  %.fca.1.insert6.i68 = insertvalue %struct.dim3 %.fca.0.insert3.i65, i32 %.fca.1.load5.i67, 1
  %.fca.2.load8.i70 = load i32, ptr %.fca.2.gep7.i69, align 8
  %.fca.2.insert9.i71 = insertvalue %struct.dim3 %.fca.1.insert6.i68, i32 %.fca.2.load8.i70, 2
  %.fca.0.load.i72 = load i32, ptr %18, align 8
  %.fca.0.insert.i73 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i72, 0
  %.fca.1.load.i75 = load i32, ptr %.fca.1.gep.i74, align 4
  %.fca.1.insert.i76 = insertvalue %struct.dim3 %.fca.0.insert.i73, i32 %.fca.1.load.i75, 1
  %.fca.2.load.i78 = load i32, ptr %.fca.2.gep.i77, align 8
  %.fca.2.insert.i79 = insertvalue %struct.dim3 %.fca.1.insert.i76, i32 %.fca.2.load.i78, 2
  %120 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z32__device_stub__fdtd_step3_kerneliiPfS_S_i, %struct.dim3 %.fca.2.insert9.i71, %struct.dim3 %.fca.2.insert.i79, ptr noundef nonnull %16, i64 noundef %118, ptr noundef %119), !inline_history !37
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
  br label %121

121:                                              ; preds = %110, %113
  %122 = call i32 @cudaThreadSynchronize() #5
  %123 = add nuw nsw i32 %.096, 1
  %exitcond.not = icmp eq i32 %123, %0
  br i1 %exitcond.not, label %._crit_edge, label %88

._crit_edge:                                      ; preds = %121, %_Z21polybench_timer_startv.exit
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  %124 = call i32 @gettimeofday(ptr noundef nonnull %9, ptr noundef null) #13
  %.not.i.i80 = icmp eq i32 %124, 0
  br i1 %.not.i.i80, label %_Z20polybench_timer_stopv.exit, label %125

125:                                              ; preds = %._crit_edge
  %126 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %124) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %._crit_edge, %125
  %127 = load i64, ptr %9, align 8
  %128 = sitofp i64 %127 to double
  %129 = getelementptr inbounds nuw i8, ptr %9, i64 8
  %130 = load i64, ptr %129, align 8
  %131 = sitofp i64 %130 to double
  %132 = fmul nnan double %131, f0x3EB0C6F7A0B5ED8D
  %133 = fadd double %132, %128
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  store double %133, ptr @polybench_t_end, align 8
  %134 = load double, ptr @polybench_t_start, align 8
  %135 = fsub double %133, %134
  %136 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %135) #5
  %137 = load ptr, ptr %48, align 8
  %138 = call i32 @cudaMemcpy(ptr noundef %7, ptr noundef %137, i64 noundef 16777216, i32 noundef 2) #5
  %139 = load ptr, ptr %45, align 8
  %140 = call i32 @cudaFree(ptr noundef %139) #5
  %141 = load ptr, ptr %46, align 8
  %142 = call i32 @cudaFree(ptr noundef %141) #5
  %143 = load ptr, ptr %47, align 8
  %144 = call i32 @cudaFree(ptr noundef %143) #5
  %145 = load ptr, ptr %48, align 8
  %146 = call i32 @cudaFree(ptr noundef %145) #5
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
  %8 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %9 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 2000) #13
  %10 = load ptr, ptr %8, align 8
  %.not.i.i = icmp eq ptr %10, null
  %11 = icmp ne i32 %9, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %11
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %0
  %12 = load ptr, ptr @stderr, align 8
  %13 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %12) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %0
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %14 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 16777216) #13
  %15 = load ptr, ptr %7, align 8
  %16 = ptrtoaddr ptr %15 to i64
  %.not.i.i31 = icmp eq ptr %15, null
  %17 = icmp ne i32 %14, 0
  %or.cond.i.i32 = select i1 %.not.i.i31, i1 true, i1 %17
  br i1 %or.cond.i.i32, label %.critedge.i.i33, label %_Z20polybench_alloc_datayi.exit34

.critedge.i.i33:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %18 = load ptr, ptr @stderr, align 8
  %19 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %18) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit34:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %20 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 16777216) #13
  %21 = load ptr, ptr %6, align 8
  %22 = ptrtoaddr ptr %21 to i64
  %.not.i.i35 = icmp eq ptr %21, null
  %23 = icmp ne i32 %20, 0
  %or.cond.i.i36 = select i1 %.not.i.i35, i1 true, i1 %23
  br i1 %or.cond.i.i36, label %.critedge.i.i37, label %_Z20polybench_alloc_datayi.exit38

.critedge.i.i37:                                  ; preds = %_Z20polybench_alloc_datayi.exit34
  %24 = load ptr, ptr @stderr, align 8
  %25 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %24) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit38:                ; preds = %_Z20polybench_alloc_datayi.exit34
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  store ptr null, ptr %5, align 8
  %26 = call i32 @posix_memalign(ptr noundef nonnull %5, i64 noundef 32, i64 noundef 16777216) #13
  %27 = load ptr, ptr %5, align 8
  %28 = ptrtoaddr ptr %27 to i64
  %.not.i.i39 = icmp eq ptr %27, null
  %29 = icmp ne i32 %26, 0
  %or.cond.i.i40 = select i1 %.not.i.i39, i1 true, i1 %29
  br i1 %or.cond.i.i40, label %.critedge.i.i41, label %_Z20polybench_alloc_datayi.exit42

.critedge.i.i41:                                  ; preds = %_Z20polybench_alloc_datayi.exit38
  %30 = load ptr, ptr @stderr, align 8
  %31 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %30) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit42:                ; preds = %_Z20polybench_alloc_datayi.exit38
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  store ptr null, ptr %4, align 8
  %32 = call i32 @posix_memalign(ptr noundef nonnull %4, i64 noundef 32, i64 noundef 16777216) #13
  %33 = load ptr, ptr %4, align 8
  %.not.i.i43 = icmp eq ptr %33, null
  %34 = icmp ne i32 %32, 0
  %or.cond.i.i44 = select i1 %.not.i.i43, i1 true, i1 %34
  br i1 %or.cond.i.i44, label %.critedge.i.i45, label %_Z20polybench_alloc_datayi.exit46

.critedge.i.i45:                                  ; preds = %_Z20polybench_alloc_datayi.exit42
  %35 = load ptr, ptr @stderr, align 8
  %36 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %35) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit46:                ; preds = %_Z20polybench_alloc_datayi.exit42
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %_Z20polybench_alloc_datayi.exit46
  %index = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit46 ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %_Z20polybench_alloc_datayi.exit46 ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %37 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %38 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %39 = getelementptr [4 x i8], ptr %10, i64 %index
  %40 = getelementptr i8, ptr %39, i64 16
  store <4 x float> %37, ptr %39, align 4
  store <4 x float> %38, ptr %40, align 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %41 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %42 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %43 = getelementptr [4 x i8], ptr %10, i64 %index
  %44 = getelementptr i8, ptr %43, i64 32
  %45 = getelementptr i8, ptr %43, i64 48
  store <4 x float> %41, ptr %44, align 4
  store <4 x float> %42, ptr %45, align 4
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %46 = icmp eq i64 %index.next.1, 496
  br i1 %46, label %.lr.ph.i, label %vector.body, !llvm.loop !38

.lr.ph.i:                                         ; preds = %vector.body
  %47 = getelementptr i8, ptr %10, i64 1984
  store float 4.960000e+02, ptr %47, align 4
  %48 = getelementptr i8, ptr %10, i64 1988
  store float 4.970000e+02, ptr %48, align 4
  %49 = getelementptr i8, ptr %10, i64 1992
  store float 4.980000e+02, ptr %49, align 4
  %50 = getelementptr i8, ptr %10, i64 1996
  store float 4.990000e+02, ptr %50, align 4
  %51 = sub i64 %16, %22
  %diff.check = icmp ugt i64 %51, -16
  %52 = sub i64 %16, %28
  %diff.check58 = icmp ugt i64 %52, -16
  %conflict.rdx = or i1 %diff.check, %diff.check58
  %53 = sub i64 %22, %28
  %diff.check59 = icmp ugt i64 %53, -16
  %conflict.rdx60 = or i1 %conflict.rdx, %diff.check59
  br label %.preheader.i

.preheader.i:                                     ; preds = %.lr.ph.i, %._crit_edge.i
  %indvars.iv39.i = phi i64 [ %indvars.iv.next40.i, %._crit_edge.i ], [ 0, %.lr.ph.i ]
  %54 = trunc i64 %indvars.iv39.i to i32
  %55 = uitofp nneg i32 %54 to float
  %56 = getelementptr [8192 x i8], ptr %15, i64 %indvars.iv39.i
  %57 = add i32 %54, -1
  %58 = sitofp i32 %57 to float
  %59 = getelementptr [8192 x i8], ptr %21, i64 %indvars.iv39.i
  %60 = add i32 %54, -9
  %61 = sitofp i32 %60 to float
  %62 = getelementptr [8192 x i8], ptr %27, i64 %indvars.iv39.i
  br i1 %conflict.rdx60, label %scalar.ph61, label %vector.ph62

vector.ph62:                                      ; preds = %.preheader.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %55, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert63 = insertelement <4 x float> poison, float %58, i64 0
  %broadcast.splat64 = shufflevector <4 x float> %broadcast.splatinsert63, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert65 = insertelement <4 x float> poison, float %61, i64 0
  %broadcast.splat66 = shufflevector <4 x float> %broadcast.splatinsert65, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body67

vector.body67:                                    ; preds = %vector.body67, %vector.ph62
  %index68 = phi i64 [ 0, %vector.ph62 ], [ %index.next71, %vector.body67 ]
  %vec.ind69 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph62 ], [ %vec.ind.next72, %vector.body67 ]
  %vec.ind70 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph62 ], [ %vec.ind.next73, %vector.body67 ]
  %63 = trunc <4 x i64> %vec.ind69 to <4 x i32>
  %64 = add <4 x i32> %63, splat (i32 1)
  %65 = uitofp nneg <4 x i32> %64 to <4 x float>
  %66 = fmul nnan <4 x float> %broadcast.splat, %65
  %67 = fadd nnan <4 x float> %66, splat (float 1.000000e+00)
  %68 = fmul nnan <4 x float> %67, splat (float f0x3A000000)
  %69 = getelementptr [4 x i8], ptr %56, i64 %index68
  store <4 x float> %68, ptr %69, align 4
  %70 = add <4 x i32> %vec.ind70, splat (i32 2)
  %71 = uitofp nneg <4 x i32> %70 to <4 x float>
  %72 = fmul nnan <4 x float> %broadcast.splat64, %71
  %73 = fadd nnan <4 x float> %72, splat (float 2.000000e+00)
  %74 = fmul nnan <4 x float> %73, splat (float f0x3A000000)
  %75 = getelementptr [4 x i8], ptr %59, i64 %index68
  store <4 x float> %74, ptr %75, align 4
  %76 = add <4 x i32> %vec.ind70, splat (i32 4)
  %77 = uitofp nneg <4 x i32> %76 to <4 x float>
  %78 = fmul nnan <4 x float> %broadcast.splat66, %77
  %79 = fadd nnan <4 x float> %78, splat (float 3.000000e+00)
  %80 = fmul nnan <4 x float> %79, splat (float f0x3A000000)
  %81 = getelementptr [4 x i8], ptr %62, i64 %index68
  store <4 x float> %80, ptr %81, align 4
  %index.next71 = add nuw i64 %index68, 4
  %vec.ind.next72 = add nuw nsw <4 x i64> %vec.ind69, splat (i64 4)
  %vec.ind.next73 = add <4 x i32> %vec.ind70, splat (i32 4)
  %82 = icmp eq i64 %index.next71, 2048
  br i1 %82, label %._crit_edge.i, label %vector.body67, !llvm.loop !39

scalar.ph61:                                      ; preds = %.preheader.i, %scalar.ph61
  %indvars.iv34.i = phi i64 [ %indvars.iv.next35.i, %scalar.ph61 ], [ 0, %.preheader.i ]
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %83 = trunc nuw nsw i64 %indvars.iv.next35.i to i32
  %84 = uitofp nneg i32 %83 to float
  %85 = fmul nnan float %55, %84
  %86 = fadd nnan float %85, 1.000000e+00
  %87 = fmul nnan float %86, f0x3A000000
  %88 = getelementptr [4 x i8], ptr %56, i64 %indvars.iv34.i
  store float %87, ptr %88, align 4
  %89 = trunc i64 %indvars.iv34.i to i32
  %90 = add i32 %89, 2
  %91 = uitofp nneg i32 %90 to float
  %92 = fmul nnan float %58, %91
  %93 = fadd nnan float %92, 2.000000e+00
  %94 = fmul nnan float %93, f0x3A000000
  %95 = getelementptr [4 x i8], ptr %59, i64 %indvars.iv34.i
  store float %94, ptr %95, align 4
  %96 = add i32 %89, 4
  %97 = uitofp nneg i32 %96 to float
  %98 = fmul nnan float %61, %97
  %99 = fadd nnan float %98, 3.000000e+00
  %100 = fmul nnan float %99, f0x3A000000
  %101 = getelementptr [4 x i8], ptr %62, i64 %indvars.iv34.i
  store float %100, ptr %101, align 4
  %exitcond38.not.i = icmp eq i64 %indvars.iv.next35.i, 2048
  br i1 %exitcond38.not.i, label %._crit_edge.i, label %scalar.ph61, !llvm.loop !40

._crit_edge.i:                                    ; preds = %vector.body67, %scalar.ph61
  %indvars.iv.next40.i = add nuw nsw i64 %indvars.iv39.i, 1
  %exitcond43.not.i = icmp eq i64 %indvars.iv.next40.i, 2048
  br i1 %exitcond43.not.i, label %_Z11init_arraysiiiPfPA2048_fS1_S1_.exit, label %.preheader.i

_Z11init_arraysiiiPfPA2048_fS1_S1_.exit:          ; preds = %._crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %102 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %3, i32 noundef 0) #5
  %103 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %3) #5
  %104 = call i32 @cudaSetDevice(i32 noundef 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  call void @_Z8fdtdCudaiiiPfPA2048_fS1_S1_S1_(i32 noundef 500, i32 noundef 2048, i32 noundef 2048, ptr noundef %10, ptr noundef nonnull %15, ptr noundef nonnull %21, ptr noundef nonnull %27, ptr noundef %33) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %2)
  %105 = call i32 @gettimeofday(ptr noundef nonnull %2, ptr noundef null) #13
  %.not.i.i47 = icmp eq i32 %105, 0
  br i1 %.not.i.i47, label %_Z21polybench_timer_startv.exit, label %106

106:                                              ; preds = %_Z11init_arraysiiiPfPA2048_fS1_S1_.exit
  %107 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %105) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z11init_arraysiiiPfPA2048_fS1_S1_.exit, %106
  %108 = load i64, ptr %2, align 8
  %109 = sitofp i64 %108 to double
  %110 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %111 = load i64, ptr %110, align 8
  %112 = sitofp i64 %111 to double
  %113 = fmul nnan double %112, f0x3EB0C6F7A0B5ED8D
  %114 = fadd double %113, %109
  call void @llvm.lifetime.end.p0(ptr nonnull %2)
  store double %114, ptr @polybench_t_start, align 8
  call void @_Z7runFdtdiiiPfPA2048_fS1_S1_(i32 noundef 500, i32 noundef 2048, i32 noundef 2048, ptr noundef %10, ptr noundef nonnull %15, ptr noundef nonnull %21, ptr noundef nonnull %27) #5
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %1)
  %115 = call i32 @gettimeofday(ptr noundef nonnull %1, ptr noundef null) #13
  %.not.i.i48 = icmp eq i32 %115, 0
  br i1 %.not.i.i48, label %_Z20polybench_timer_stopv.exit, label %116

116:                                              ; preds = %_Z21polybench_timer_startv.exit
  %117 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %115) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z21polybench_timer_startv.exit, %116
  %118 = load i64, ptr %1, align 8
  %119 = sitofp i64 %118 to double
  %120 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %121 = load i64, ptr %120, align 8
  %122 = sitofp i64 %121 to double
  %123 = fmul nnan double %122, f0x3EB0C6F7A0B5ED8D
  %124 = fadd double %123, %119
  call void @llvm.lifetime.end.p0(ptr nonnull %1)
  store double %124, ptr @polybench_t_end, align 8
  %125 = load double, ptr @polybench_t_start, align 8
  %126 = fsub double %124, %125
  %127 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %126) #5
  br label %.preheader.us.i

.preheader.us.i:                                  ; preds = %._crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv23.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next24.i, %._crit_edge.us.i ]
  %.018.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %164, %._crit_edge.us.i ]
  %128 = getelementptr [8192 x i8], ptr %27, i64 %indvars.iv23.i
  %129 = getelementptr [8192 x i8], ptr %33, i64 %indvars.iv23.i
  %130 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.018.us.i, i64 0
  br label %vector.body77

vector.body77:                                    ; preds = %vector.body77, %.preheader.us.i
  %index78 = phi i64 [ 0, %.preheader.us.i ], [ %index.next80, %vector.body77 ]
  %vec.phi = phi <4 x i32> [ %130, %.preheader.us.i ], [ %162, %vector.body77 ]
  %131 = getelementptr [4 x i8], ptr %128, i64 %index78
  %wide.load = load <4 x float>, ptr %131, align 4
  %132 = fpext <4 x float> %wide.load to <4 x double>
  %133 = getelementptr [4 x i8], ptr %129, i64 %index78
  %wide.load79 = load <4 x float>, ptr %133, align 4
  %134 = fpext <4 x float> %wide.load79 to <4 x double>
  %135 = fcmp olt <4 x double> %132, splat (double f0xB690000000000000)
  %136 = fneg <4 x float> %wide.load
  %137 = select <4 x i1> %135, <4 x float> %136, <4 x float> %wide.load
  %138 = fpext <4 x float> %137 to <4 x double>
  %139 = fcmp uge <4 x double> %138, splat (double 1.000000e-02)
  %140 = fcmp olt <4 x double> %134, splat (double f0xB690000000000000)
  %141 = fneg <4 x float> %wide.load79
  %142 = select <4 x i1> %140, <4 x float> %141, <4 x float> %wide.load79
  %143 = fpext <4 x float> %142 to <4 x double>
  %144 = fcmp uge <4 x double> %143, splat (double 1.000000e-02)
  %145 = fsub <4 x double> %132, %134
  %146 = fptrunc <4 x double> %145 to <4 x float>
  %147 = fcmp olt <4 x double> %145, splat (double f0xB690000000000000)
  %148 = fneg <4 x float> %146
  %149 = select <4 x i1> %147, <4 x float> %148, <4 x float> %146
  %150 = fadd <4 x double> %132, splat (double f0x3E45798EE0000000)
  %151 = fptrunc <4 x double> %150 to <4 x float>
  %152 = fcmp olt <4 x double> %150, splat (double f0xB690000000000000)
  %153 = fneg <4 x float> %151
  %154 = select <4 x i1> %152, <4 x float> %153, <4 x float> %151
  %155 = fdiv <4 x float> %149, %154
  %156 = fcmp olt <4 x float> %155, zeroinitializer
  %157 = fneg <4 x float> %155
  %158 = select <4 x i1> %156, <4 x float> %157, <4 x float> %155
  %159 = fmul <4 x float> %158, splat (float 1.000000e+02)
  %160 = fpext <4 x float> %159 to <4 x double>
  %161 = fcmp ogt <4 x double> %160, splat (double 1.005000e+01)
  %.not83 = select <4 x i1> %139, <4 x i1> splat (i1 true), <4 x i1> %144
  %narrow = select <4 x i1> %.not83, <4 x i1> %161, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %162 = add <4 x i32> %vec.phi, %predphi
  %index.next80 = add nuw i64 %index78, 4
  %163 = icmp eq i64 %index.next80, 2048
  br i1 %163, label %._crit_edge.us.i, label %vector.body77, !llvm.loop !41

._crit_edge.us.i:                                 ; preds = %vector.body77
  %164 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %162)
  %indvars.iv.next24.i = add nuw nsw i64 %indvars.iv23.i, 1
  %exitcond27.not.i = icmp eq i64 %indvars.iv.next24.i, 2048
  br i1 %exitcond27.not.i, label %_Z14compareResultsiiPA2048_fS0_.exit, label %.preheader.us.i

_Z14compareResultsiiPA2048_fS0_.exit:             ; preds = %._crit_edge.us.i
  %165 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 1.005000e+01, i32 noundef %164) #5
  call void @free(ptr noundef %10) #13
  call void @free(ptr noundef %15) #13
  call void @free(ptr noundef %21) #13
  call void @free(ptr noundef nonnull %27) #13
  call void @free(ptr noundef nonnull %33) #13
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
!4 = distinct !{!4, !3, !2}
!5 = distinct !{!5, !2, !3}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !2, !3}
!8 = distinct !{!8, !3, !2}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !2, !3}
!22 = distinct !{!22, !2}
!23 = !{!24}
!24 = distinct !{!24, !25}
!25 = distinct !{!25, !"LVerDomain"}
!26 = !{!27, !28}
!27 = distinct !{!27, !25}
!28 = distinct !{!28, !25}
!29 = !{!27}
!30 = !{!28}
!31 = distinct !{!31, !2, !3}
!32 = distinct !{!32, !2}
!33 = distinct !{!33, !2, !3}
!34 = distinct !{!34, !3, !2}
!35 = !{ptr @_Z32__device_stub__fdtd_step1_kerneliiPfS_S_S_i}
!36 = !{ptr @_Z32__device_stub__fdtd_step2_kerneliiPfS_S_i}
!37 = !{ptr @_Z32__device_stub__fdtd_step3_kerneliiPfS_S_i}
!38 = distinct !{!38, !2, !3}
!39 = distinct !{!39, !2, !3}
!40 = distinct !{!40, !2}
!41 = distinct !{!41, !2, !3}
