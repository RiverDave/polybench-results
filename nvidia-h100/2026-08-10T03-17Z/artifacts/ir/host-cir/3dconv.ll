; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/3DCONV/3DConvolution.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/3DCONV/3DConvolution.cu"
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
define dso_local void @_Z6conv3DiiiPA256_A256_fS1_(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4) local_unnamed_addr #1 {
  %6 = add i32 %0, -1
  %7 = icmp sgt i32 %0, 2
  br i1 %7, label %.preheader89.lr.ph, label %._crit_edge94.split

.preheader89.lr.ph:                               ; preds = %5
  %8 = icmp slt i32 %1, 3
  %9 = icmp slt i32 %2, 3
  %brmerge = or i1 %8, %9
  br i1 %brmerge, label %._crit_edge94.split, label %.preheader89.preheader

.preheader89.preheader:                           ; preds = %.preheader89.lr.ph
  %10 = add nsw i32 %2, -1
  %11 = add nsw i32 %1, -1
  %wide.trip.count106 = zext nneg i32 %6 to i64
  %wide.trip.count101 = zext i32 %11 to i64
  %wide.trip.count = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %wide.trip.count101, 10
  %13 = shl nuw nsw i64 %wide.trip.count, 2
  %14 = add nuw nsw i64 %12, %13
  %15 = getelementptr i8, ptr %4, i64 %14
  %16 = getelementptr i8, ptr %15, i64 261120
  %17 = getelementptr i8, ptr %3, i64 %14
  %18 = getelementptr i8, ptr %17, i64 524292
  %19 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i64 %19, 4
  %n.vec = and i64 %19, -4
  %20 = or disjoint i64 %n.vec, 1
  %cmp.n = icmp eq i64 %19, %n.vec
  br label %.preheader89

.preheader89:                                     ; preds = %.preheader89.preheader, %._crit_edge92
  %indvar = phi i64 [ 0, %.preheader89.preheader ], [ %indvar.next, %._crit_edge92 ]
  %indvars.iv103 = phi i64 [ 1, %.preheader89.preheader ], [ %indvars.iv.next104, %._crit_edge92 ]
  %21 = shl nuw nsw i64 %indvar, 18
  %22 = getelementptr i8, ptr %4, i64 %21
  %scevgep = getelementptr i8, ptr %22, i64 263172
  %scevgep108 = getelementptr i8, ptr %16, i64 %21
  %scevgep109 = getelementptr i8, ptr %3, i64 %21
  %scevgep110 = getelementptr i8, ptr %18, i64 %21
  %23 = getelementptr [262144 x i8], ptr %3, i64 %indvars.iv103
  %24 = getelementptr i8, ptr %23, i64 -262144
  %25 = getelementptr i8, ptr %23, i64 262144
  %26 = getelementptr [262144 x i8], ptr %4, i64 %indvars.iv103
  %bound0 = icmp ult ptr %scevgep, %scevgep110
  %bound1 = icmp ult ptr %scevgep109, %scevgep108
  %found.conflict = and i1 %bound0, %bound1
  br label %.preheader

.preheader:                                       ; preds = %.preheader89, %._crit_edge
  %indvars.iv98 = phi i64 [ 1, %.preheader89 ], [ %indvars.iv.next99, %._crit_edge ]
  %27 = add nsw i64 %indvars.iv98, -1
  %28 = getelementptr [1024 x i8], ptr %24, i64 %27
  %29 = getelementptr [1024 x i8], ptr %25, i64 %27
  %30 = getelementptr [1024 x i8], ptr %23, i64 %27
  %31 = getelementptr [1024 x i8], ptr %23, i64 %indvars.iv98
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %32 = getelementptr [1024 x i8], ptr %23, i64 %indvars.iv.next99
  %33 = getelementptr [1024 x i8], ptr %24, i64 %indvars.iv98
  %34 = getelementptr [1024 x i8], ptr %25, i64 %indvars.iv98
  %35 = getelementptr [1024 x i8], ptr %24, i64 %indvars.iv.next99
  %36 = getelementptr [1024 x i8], ptr %25, i64 %indvars.iv.next99
  %37 = getelementptr [1024 x i8], ptr %26, i64 %indvars.iv98
  %brmerge121 = select i1 %min.iters.check, i1 true, i1 %found.conflict
  br i1 %brmerge121, label %scalar.ph.preheader, label %vector.body

vector.body:                                      ; preds = %.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader ]
  %38 = or disjoint i64 %index, 1
  %39 = getelementptr [4 x i8], ptr %28, i64 %index
  %wide.load = load <4 x float>, ptr %39, align 4, !alias.scope !1
  %40 = fmul <4 x float> %wide.load, splat (float 2.000000e+00)
  %41 = getelementptr [4 x i8], ptr %29, i64 %index
  %wide.load111 = load <4 x float>, ptr %41, align 4, !alias.scope !1
  %42 = fmul <4 x float> %wide.load111, splat (float 4.000000e+00)
  %43 = fadd <4 x float> %40, %42
  %44 = fmul <4 x float> %wide.load, splat (float 5.000000e+00)
  %45 = fadd <4 x float> %44, %43
  %46 = fmul <4 x float> %wide.load111, splat (float 7.000000e+00)
  %47 = fadd <4 x float> %46, %45
  %48 = fmul <4 x float> %wide.load, splat (float 8.000000e+00)
  %49 = fsub <4 x float> %47, %48
  %50 = fmul <4 x float> %wide.load111, splat (float 1.000000e+01)
  %51 = fadd <4 x float> %50, %49
  %52 = getelementptr [4 x i8], ptr %30, i64 %38
  %wide.load112 = load <4 x float>, ptr %52, align 4, !alias.scope !1
  %53 = fmul <4 x float> %wide.load112, splat (float 3.000000e+00)
  %54 = fsub <4 x float> %51, %53
  %55 = getelementptr [4 x i8], ptr %31, i64 %38
  %wide.load113 = load <4 x float>, ptr %55, align 4, !alias.scope !1
  %56 = fmul <4 x float> %wide.load113, splat (float 6.000000e+00)
  %57 = fadd <4 x float> %56, %54
  %58 = getelementptr [4 x i8], ptr %32, i64 %38
  %wide.load114 = load <4 x float>, ptr %58, align 4, !alias.scope !1
  %59 = fmul <4 x float> %wide.load114, splat (float 9.000000e+00)
  %60 = fsub <4 x float> %57, %59
  %61 = or disjoint i64 %index, 2
  %62 = getelementptr [4 x i8], ptr %28, i64 %61
  %wide.load115 = load <4 x float>, ptr %62, align 4, !alias.scope !1
  %63 = fmul <4 x float> %wide.load115, splat (float 2.000000e+00)
  %64 = fadd <4 x float> %63, %60
  %65 = getelementptr [4 x i8], ptr %29, i64 %61
  %wide.load116 = load <4 x float>, ptr %65, align 4, !alias.scope !1
  %66 = fmul <4 x float> %wide.load116, splat (float 4.000000e+00)
  %67 = fadd <4 x float> %66, %64
  %68 = getelementptr [4 x i8], ptr %33, i64 %61
  %wide.load117 = load <4 x float>, ptr %68, align 4, !alias.scope !1
  %69 = fmul <4 x float> %wide.load117, splat (float 5.000000e+00)
  %70 = fadd <4 x float> %69, %67
  %71 = getelementptr [4 x i8], ptr %34, i64 %61
  %wide.load118 = load <4 x float>, ptr %71, align 4, !alias.scope !1
  %72 = fmul <4 x float> %wide.load118, splat (float 7.000000e+00)
  %73 = fadd <4 x float> %72, %70
  %74 = getelementptr [4 x i8], ptr %35, i64 %61
  %wide.load119 = load <4 x float>, ptr %74, align 4, !alias.scope !1
  %75 = fmul <4 x float> %wide.load119, splat (float 8.000000e+00)
  %76 = fsub <4 x float> %73, %75
  %77 = getelementptr [4 x i8], ptr %36, i64 %61
  %wide.load120 = load <4 x float>, ptr %77, align 4, !alias.scope !1
  %78 = fmul <4 x float> %wide.load120, splat (float 1.000000e+01)
  %79 = fadd <4 x float> %78, %76
  %80 = getelementptr [4 x i8], ptr %37, i64 %38
  store <4 x float> %79, ptr %80, align 4, !alias.scope !4, !noalias !1
  %index.next = add nuw i64 %index, 4
  %81 = icmp eq i64 %index.next, %n.vec
  br i1 %81, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ %20, %middle.block ], [ 1, %.preheader ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %82 = add nsw i64 %indvars.iv, -1
  %83 = getelementptr [4 x i8], ptr %28, i64 %82
  %84 = load float, ptr %83, align 4
  %85 = fmul float %84, 2.000000e+00
  %86 = getelementptr [4 x i8], ptr %29, i64 %82
  %87 = load float, ptr %86, align 4
  %88 = fmul float %87, 4.000000e+00
  %89 = fadd float %85, %88
  %90 = fmul float %84, 5.000000e+00
  %91 = fadd float %90, %89
  %92 = fmul float %87, 7.000000e+00
  %93 = fadd float %92, %91
  %94 = fmul float %84, 8.000000e+00
  %95 = fsub float %93, %94
  %96 = fmul float %87, 1.000000e+01
  %97 = fadd float %96, %95
  %98 = getelementptr [4 x i8], ptr %30, i64 %indvars.iv
  %99 = load float, ptr %98, align 4
  %100 = fmul float %99, 3.000000e+00
  %101 = fsub float %97, %100
  %102 = getelementptr [4 x i8], ptr %31, i64 %indvars.iv
  %103 = load float, ptr %102, align 4
  %104 = fmul float %103, 6.000000e+00
  %105 = fadd float %104, %101
  %106 = getelementptr [4 x i8], ptr %32, i64 %indvars.iv
  %107 = load float, ptr %106, align 4
  %108 = fmul float %107, 9.000000e+00
  %109 = fsub float %105, %108
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %110 = getelementptr [4 x i8], ptr %28, i64 %indvars.iv.next
  %111 = load float, ptr %110, align 4
  %112 = fmul float %111, 2.000000e+00
  %113 = fadd float %112, %109
  %114 = getelementptr [4 x i8], ptr %29, i64 %indvars.iv.next
  %115 = load float, ptr %114, align 4
  %116 = fmul float %115, 4.000000e+00
  %117 = fadd float %116, %113
  %118 = getelementptr [4 x i8], ptr %33, i64 %indvars.iv.next
  %119 = load float, ptr %118, align 4
  %120 = fmul float %119, 5.000000e+00
  %121 = fadd float %120, %117
  %122 = getelementptr [4 x i8], ptr %34, i64 %indvars.iv.next
  %123 = load float, ptr %122, align 4
  %124 = fmul float %123, 7.000000e+00
  %125 = fadd float %124, %121
  %126 = getelementptr [4 x i8], ptr %35, i64 %indvars.iv.next
  %127 = load float, ptr %126, align 4
  %128 = fmul float %127, 8.000000e+00
  %129 = fsub float %125, %128
  %130 = getelementptr [4 x i8], ptr %36, i64 %indvars.iv.next
  %131 = load float, ptr %130, align 4
  %132 = fmul float %131, 1.000000e+01
  %133 = fadd float %132, %129
  %134 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv
  store float %133, ptr %134, align 4
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !9

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %exitcond102.not = icmp eq i64 %indvars.iv.next99, %wide.trip.count101
  br i1 %exitcond102.not, label %._crit_edge92, label %.preheader

._crit_edge92:                                    ; preds = %._crit_edge
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond107.not = icmp eq i64 %indvars.iv.next104, %wide.trip.count106
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond107.not, label %._crit_edge94.split, label %.preheader89

._crit_edge94.split:                              ; preds = %._crit_edge92, %.preheader89.lr.ph, %5
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: write)
define dso_local void @_Z4initiiiPA256_A256_f(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr nofree noundef writeonly captures(none) %3) local_unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader17.lr.ph, label %._crit_edge22.split

.preheader17.lr.ph:                               ; preds = %4
  %6 = icmp slt i32 %1, 1
  %7 = icmp slt i32 %2, 1
  %brmerge = or i1 %6, %7
  br i1 %brmerge, label %._crit_edge22.split, label %.preheader17.preheader

.preheader17.preheader:                           ; preds = %.preheader17.lr.ph
  %wide.trip.count34 = zext nneg i32 %0 to i64
  %wide.trip.count29 = zext nneg i32 %1 to i64
  %wide.trip.count = zext nneg i32 %2 to i64
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %.preheader17

.preheader17:                                     ; preds = %.preheader17.preheader, %._crit_edge20
  %indvars.iv31 = phi i64 [ 0, %.preheader17.preheader ], [ %indvars.iv.next32, %._crit_edge20 ]
  %8 = trunc nuw nsw i64 %indvars.iv31 to i32
  %9 = urem i32 %8, 12
  %10 = getelementptr [262144 x i8], ptr %3, i64 %indvars.iv31
  br label %.preheader

.preheader:                                       ; preds = %.preheader17, %._crit_edge
  %indvars.iv26 = phi i64 [ 0, %.preheader17 ], [ %indvars.iv.next27, %._crit_edge ]
  %11 = trunc nuw nsw i64 %indvars.iv26 to i32
  %12 = urem i32 %11, 7
  %13 = shl nuw nsw i32 %12, 1
  %14 = add nuw nsw i32 %13, %9
  %15 = getelementptr [1024 x i8], ptr %10, i64 %indvars.iv26
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader
  %broadcast.splatinsert = insertelement <4 x i32> poison, i32 %14, i64 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %16 = urem <4 x i32> %vec.ind, splat (i32 13)
  %17 = mul nuw nsw <4 x i32> %16, splat (i32 3)
  %18 = add nuw nsw <4 x i32> %broadcast.splat, %17
  %19 = uitofp nneg <4 x i32> %18 to <4 x float>
  %20 = getelementptr [4 x i8], ptr %15, i64 %index
  store <4 x float> %19, ptr %20, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %21 = icmp eq i64 %index.next, %n.vec
  br i1 %21, label %middle.block, label %vector.body, !llvm.loop !10

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %22 = trunc nuw nsw i64 %indvars.iv to i32
  %23 = urem i32 %22, 13
  %24 = mul nuw nsw i32 %23, 3
  %25 = add nuw nsw i32 %14, %24
  %26 = uitofp nneg i32 %25 to float
  %27 = getelementptr [4 x i8], ptr %15, i64 %indvars.iv
  store float %26, ptr %27, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !11

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond30.not = icmp eq i64 %indvars.iv.next27, %wide.trip.count29
  br i1 %exitcond30.not, label %._crit_edge20, label %.preheader

._crit_edge20:                                    ; preds = %._crit_edge
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond35.not = icmp eq i64 %indvars.iv.next32, %wide.trip.count34
  br i1 %exitcond35.not, label %._crit_edge22.split, label %.preheader17

._crit_edge22.split:                              ; preds = %._crit_edge20, %.preheader17.lr.ph, %4
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiiiPA256_A256_fS1_(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef readonly captures(none) %4) local_unnamed_addr #4 {
  %6 = add i32 %0, -1
  %7 = icmp sgt i32 %0, 2
  br i1 %7, label %.preheader21.lr.ph, label %._crit_edge

.preheader21.lr.ph:                               ; preds = %5
  %8 = icmp sgt i32 %1, 2
  %9 = icmp sgt i32 %2, 2
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader21.us.us.preheader, label %._crit_edge

.preheader21.us.us.preheader:                     ; preds = %.preheader21.lr.ph
  %10 = add nsw i32 %2, -1
  %11 = add nsw i32 %1, -1
  %wide.trip.count47 = zext nneg i32 %6 to i64
  %wide.trip.count42 = zext i32 %11 to i64
  %wide.trip.count = zext i32 %10 to i64
  %12 = add nsw i64 %wide.trip.count, -1
  %min.iters.check = icmp ult i64 %12, 4
  %n.vec = and i64 %12, -4
  %13 = or disjoint i64 %n.vec, 1
  %cmp.n = icmp eq i64 %12, %n.vec
  br label %.preheader21.us.us

.preheader21.us.us:                               ; preds = %.preheader21.us.us.preheader, %._crit_edge26.split.us.us.us
  %indvars.iv44 = phi i64 [ 1, %.preheader21.us.us.preheader ], [ %indvars.iv.next45, %._crit_edge26.split.us.us.us ]
  %.029.us.us = phi i32 [ 0, %.preheader21.us.us.preheader ], [ %.3.us.us.us.lcssa, %._crit_edge26.split.us.us.us ]
  %14 = getelementptr [262144 x i8], ptr %3, i64 %indvars.iv44
  %15 = getelementptr [262144 x i8], ptr %4, i64 %indvars.iv44
  br label %.preheader.us.us.us

.preheader.us.us.us:                              ; preds = %._crit_edge.us.us.us, %.preheader21.us.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge.us.us.us ], [ 1, %.preheader21.us.us ]
  %.125.us.us.us = phi i32 [ %.3.us.us.us.lcssa, %._crit_edge.us.us.us ], [ %.029.us.us, %.preheader21.us.us ]
  %16 = getelementptr [1024 x i8], ptr %14, i64 %indvars.iv39
  %17 = getelementptr [1024 x i8], ptr %15, i64 %indvars.iv39
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader.us.us.us
  %18 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.125.us.us.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %18, %vector.ph ], [ %50, %vector.body ]
  %19 = or disjoint i64 %index, 1
  %20 = getelementptr [4 x i8], ptr %16, i64 %19
  %wide.load = load <4 x float>, ptr %20, align 4
  %21 = fpext <4 x float> %wide.load to <4 x double>
  %22 = getelementptr [4 x i8], ptr %17, i64 %19
  %wide.load49 = load <4 x float>, ptr %22, align 4
  %23 = fpext <4 x float> %wide.load49 to <4 x double>
  %24 = fcmp olt <4 x double> %21, splat (double f0xB690000000000000)
  %25 = fneg <4 x float> %wide.load
  %26 = select <4 x i1> %24, <4 x float> %25, <4 x float> %wide.load
  %27 = fpext <4 x float> %26 to <4 x double>
  %28 = fcmp uge <4 x double> %27, splat (double 1.000000e-02)
  %29 = fcmp olt <4 x double> %23, splat (double f0xB690000000000000)
  %30 = fneg <4 x float> %wide.load49
  %31 = select <4 x i1> %29, <4 x float> %30, <4 x float> %wide.load49
  %32 = fpext <4 x float> %31 to <4 x double>
  %33 = fcmp uge <4 x double> %32, splat (double 1.000000e-02)
  %34 = fsub <4 x double> %21, %23
  %35 = fptrunc <4 x double> %34 to <4 x float>
  %36 = fcmp olt <4 x double> %34, splat (double f0xB690000000000000)
  %37 = fneg <4 x float> %35
  %38 = select <4 x i1> %36, <4 x float> %37, <4 x float> %35
  %39 = fadd <4 x double> %21, splat (double f0x3E45798EE0000000)
  %40 = fptrunc <4 x double> %39 to <4 x float>
  %41 = fcmp olt <4 x double> %39, splat (double f0xB690000000000000)
  %42 = fneg <4 x float> %40
  %43 = select <4 x i1> %41, <4 x float> %42, <4 x float> %40
  %44 = fdiv <4 x float> %38, %43
  %45 = fcmp olt <4 x float> %44, zeroinitializer
  %46 = fneg <4 x float> %44
  %47 = select <4 x i1> %45, <4 x float> %46, <4 x float> %44
  %48 = fmul <4 x float> %47, splat (float 1.000000e+02)
  %49 = fcmp ogt <4 x float> %48, splat (float 5.000000e-01)
  %.not51 = select <4 x i1> %28, <4 x i1> splat (i1 true), <4 x i1> %33
  %narrow = select <4 x i1> %.not51, <4 x i1> %49, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %50 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %51 = icmp eq i64 %index.next, %n.vec
  br i1 %51, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  %52 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %50)
  br i1 %cmp.n, label %._crit_edge.us.us.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader.us.us.us, %middle.block
  %indvars.iv.ph = phi i64 [ 1, %.preheader.us.us.us ], [ %13, %middle.block ]
  %.223.us.us.us.ph = phi i32 [ %.125.us.us.us, %.preheader.us.us.us ], [ %52, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %_Z11percentDiffdd.exit.us.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us.us.us ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %.223.us.us.us = phi i32 [ %.3.us.us.us, %_Z11percentDiffdd.exit.us.us.us ], [ %.223.us.us.us.ph, %scalar.ph.preheader ]
  %53 = getelementptr [4 x i8], ptr %16, i64 %indvars.iv
  %54 = load float, ptr %53, align 4
  %55 = fpext float %54 to double
  %56 = getelementptr [4 x i8], ptr %17, i64 %indvars.iv
  %57 = load float, ptr %56, align 4
  %58 = fpext float %57 to double
  %59 = fcmp olt double %55, f0xB690000000000000
  %60 = fneg float %54
  %common.ret.op.i.i.us.us.us = select i1 %59, float %60, float %54
  %61 = fpext float %common.ret.op.i.i.us.us.us to double
  %62 = fcmp olt double %61, 1.000000e-02
  br i1 %62, label %63, label %.critedge.i.us.us.us

63:                                               ; preds = %scalar.ph
  %64 = fcmp olt double %58, f0xB690000000000000
  %65 = fneg float %57
  %common.ret.op.i7.i.us.us.us = select i1 %64, float %65, float %57
  %66 = fpext float %common.ret.op.i7.i.us.us.us to double
  %67 = fcmp olt double %66, 1.000000e-02
  br i1 %67, label %_Z11percentDiffdd.exit.us.us.us, label %.critedge.i.us.us.us

.critedge.i.us.us.us:                             ; preds = %63, %scalar.ph
  %68 = insertelement <2 x double> poison, double %55, i64 0
  %69 = shufflevector <2 x double> %68, <2 x double> poison, <2 x i32> zeroinitializer
  %70 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %58, i64 0
  %71 = fsub <2 x double> %69, %70
  %72 = fptrunc <2 x double> %71 to <2 x float>
  %73 = fcmp olt <2 x double> %71, splat (double f0xB690000000000000)
  %74 = fneg <2 x float> %72
  %75 = select <2 x i1> %73, <2 x float> %74, <2 x float> %72
  %76 = extractelement <2 x float> %75, i64 0
  %77 = extractelement <2 x float> %75, i64 1
  %78 = fdiv float %76, %77
  %79 = fcmp olt float %78, 0.000000e+00
  %80 = fneg float %78
  %common.ret.op.i10.i.us.us.us = select i1 %79, float %80, float %78
  %81 = fmul float %common.ret.op.i10.i.us.us.us, 1.000000e+02
  %82 = fcmp ogt float %81, 5.000000e-01
  %83 = zext i1 %82 to i32
  br label %_Z11percentDiffdd.exit.us.us.us

_Z11percentDiffdd.exit.us.us.us:                  ; preds = %.critedge.i.us.us.us, %63
  %common.ret.op.i.us.us.us = phi i32 [ %83, %.critedge.i.us.us.us ], [ 0, %63 ]
  %.3.us.us.us = add nsw i32 %common.ret.op.i.us.us.us, %.223.us.us.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge.us.us.us, label %scalar.ph, !llvm.loop !13

._crit_edge.us.us.us:                             ; preds = %_Z11percentDiffdd.exit.us.us.us, %middle.block
  %.3.us.us.us.lcssa = phi i32 [ %52, %middle.block ], [ %.3.us.us.us, %_Z11percentDiffdd.exit.us.us.us ]
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond43.not = icmp eq i64 %indvars.iv.next40, %wide.trip.count42
  br i1 %exitcond43.not, label %._crit_edge26.split.us.us.us, label %.preheader.us.us.us

._crit_edge26.split.us.us.us:                     ; preds = %._crit_edge.us.us.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond48.not = icmp eq i64 %indvars.iv.next45, %wide.trip.count47
  br i1 %exitcond48.not, label %._crit_edge, label %.preheader21.us.us

._crit_edge:                                      ; preds = %._crit_edge26.split.us.us.us, %.preheader21.lr.ph, %5
  %.0.lcssa = phi i32 [ 0, %5 ], [ 0, %.preheader21.lr.ph ], [ %.3.us.us.us.lcssa, %._crit_edge26.split.us.us.us ]
  %84 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-01, i32 noundef %.0.lcssa) #5
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

define dso_local void @_Z35__device_stub__convolution3D_kerneliiiPfS_i(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #6 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
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
  %26 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z35__device_stub__convolution3D_kerneliiiPfS_i, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %13, i64 noundef %24, ptr noundef %25)
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

define dso_local void @_Z17convolution3DCudaiiiPA256_A256_fS1_S1_(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) local_unnamed_addr #6 {
  %7 = alloca %struct.timeval, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca [6 x ptr], align 16
  %15 = alloca %struct.dim3, align 8
  %16 = alloca %struct.dim3, align 8
  %17 = alloca i64, align 8
  %18 = alloca ptr, align 8
  %19 = alloca %struct.timeval, align 8
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = call i32 @cudaMalloc(ptr noundef nonnull %20, i64 noundef 67108864) #5
  %23 = call i32 @cudaMalloc(ptr noundef nonnull %21, i64 noundef 67108864) #5
  %24 = load ptr, ptr %20, align 8
  %25 = call i32 @cudaMemcpy(ptr noundef %24, ptr noundef %3, i64 noundef 67108864, i32 noundef 1) #5
  %26 = load ptr, ptr %21, align 8
  %27 = call i32 @cudaMemcpy(ptr noundef %26, ptr noundef %4, i64 noundef 67108864, i32 noundef 1) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %19)
  %28 = call i32 @gettimeofday(ptr noundef nonnull %19, ptr noundef null) #13
  %.not.i.i = icmp eq i32 %28, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %29

29:                                               ; preds = %6
  %30 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %28) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %6, %29
  %31 = load i64, ptr %19, align 8
  %32 = sitofp i64 %31 to double
  %33 = getelementptr inbounds nuw i8, ptr %19, i64 8
  %34 = load i64, ptr %33, align 8
  %35 = sitofp i64 %34 to double
  %36 = fmul nnan double %35, f0x3EB0C6F7A0B5ED8D
  %37 = fadd double %36, %32
  call void @llvm.lifetime.end.p0(ptr nonnull %19)
  store double %37, ptr @polybench_t_start, align 8
  %38 = icmp sgt i32 %0, 2
  br i1 %38, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %_Z21polybench_timer_startv.exit
  %39 = getelementptr inbounds nuw i8, ptr %14, i64 8
  %40 = getelementptr inbounds nuw i8, ptr %14, i64 16
  %41 = getelementptr inbounds nuw i8, ptr %14, i64 24
  %42 = getelementptr inbounds nuw i8, ptr %14, i64 32
  %43 = getelementptr inbounds nuw i8, ptr %14, i64 40
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %15, i64 4
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %15, i64 8
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %16, i64 4
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %16, i64 8
  %44 = add nsw i32 %0, -2
  br label %45

45:                                               ; preds = %.lr.ph, %54
  %.019 = phi i32 [ 1, %.lr.ph ], [ %55, %54 ]
  %46 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 8, i32 32, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %46, 0
  br i1 %.not, label %47, label %54

47:                                               ; preds = %45
  %48 = load ptr, ptr %20, align 8
  %49 = load ptr, ptr %21, align 8
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
  store i32 %2, ptr %10, align 4
  store ptr %48, ptr %11, align 8
  store ptr %49, ptr %12, align 8
  store i32 %.019, ptr %13, align 4
  store ptr %8, ptr %14, align 16
  store ptr %9, ptr %39, align 8
  store ptr %10, ptr %40, align 16
  store ptr %11, ptr %41, align 8
  store ptr %12, ptr %42, align 16
  store ptr %13, ptr %43, align 8
  %50 = call i32 @__cudaPopCallConfiguration(ptr nonnull %15, ptr nonnull %16, ptr nonnull %17, ptr nonnull %18), !inline_history !14
  %51 = load i64, ptr %17, align 8
  %52 = load ptr, ptr %18, align 8
  %.fca.0.load2.i = load i32, ptr %15, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %16, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %53 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z35__device_stub__convolution3D_kerneliiiPfS_i, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %14, i64 noundef %51, ptr noundef %52), !inline_history !14
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
  br label %54

54:                                               ; preds = %45, %47
  %55 = add nuw nsw i32 %.019, 1
  %exitcond.not = icmp eq i32 %.019, %44
  br i1 %exitcond.not, label %._crit_edge, label %45

._crit_edge:                                      ; preds = %54, %_Z21polybench_timer_startv.exit
  %56 = call i32 @cudaThreadSynchronize() #5
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  %57 = call i32 @gettimeofday(ptr noundef nonnull %7, ptr noundef null) #13
  %.not.i.i15 = icmp eq i32 %57, 0
  br i1 %.not.i.i15, label %_Z20polybench_timer_stopv.exit, label %58

58:                                               ; preds = %._crit_edge
  %59 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %57) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %._crit_edge, %58
  %60 = load i64, ptr %7, align 8
  %61 = sitofp i64 %60 to double
  %62 = getelementptr inbounds nuw i8, ptr %7, i64 8
  %63 = load i64, ptr %62, align 8
  %64 = sitofp i64 %63 to double
  %65 = fmul nnan double %64, f0x3EB0C6F7A0B5ED8D
  %66 = fadd double %65, %61
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  store double %66, ptr @polybench_t_end, align 8
  %67 = load double, ptr @polybench_t_start, align 8
  %68 = fsub double %66, %67
  %69 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %68) #5
  %70 = load ptr, ptr %21, align 8
  %71 = call i32 @cudaMemcpy(ptr noundef %5, ptr noundef %70, i64 noundef 67108864, i32 noundef 2) #5
  %72 = load ptr, ptr %20, align 8
  %73 = call i32 @cudaFree(ptr noundef %72) #5
  %74 = load ptr, ptr %21, align 8
  %75 = call i32 @cudaFree(ptr noundef %74) #5
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
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %9 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 67108864) #13
  %10 = load ptr, ptr %8, align 8
  %.not.i.i = icmp eq ptr %10, null
  %11 = icmp ne i32 %9, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %11
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %12 = load ptr, ptr @stderr, align 8
  %13 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %12) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %14 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 67108864) #13
  %15 = load ptr, ptr %7, align 8
  %.not.i.i23 = icmp eq ptr %15, null
  %16 = icmp ne i32 %14, 0
  %or.cond.i.i24 = select i1 %.not.i.i23, i1 true, i1 %16
  br i1 %or.cond.i.i24, label %.critedge.i.i25, label %_Z20polybench_alloc_datayi.exit26

.critedge.i.i25:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %17 = load ptr, ptr @stderr, align 8
  %18 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %17) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit26:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %19 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 67108864) #13
  %20 = load ptr, ptr %6, align 8
  %.not.i.i27 = icmp eq ptr %20, null
  %21 = icmp ne i32 %19, 0
  %or.cond.i.i28 = select i1 %.not.i.i27, i1 true, i1 %21
  br i1 %or.cond.i.i28, label %.critedge.i.i29, label %_Z20polybench_alloc_datayi.exit30

.critedge.i.i29:                                  ; preds = %_Z20polybench_alloc_datayi.exit26
  %22 = load ptr, ptr @stderr, align 8
  %23 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %22) #14
  call void @exit(i32 noundef 1) #15
  unreachable

_Z20polybench_alloc_datayi.exit30:                ; preds = %_Z20polybench_alloc_datayi.exit26
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  br label %.preheader17.i

.preheader17.i:                                   ; preds = %._crit_edge20.i, %_Z20polybench_alloc_datayi.exit30
  %indvars.iv31.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit30 ], [ %indvars.iv.next32.i, %._crit_edge20.i ]
  %24 = trunc nuw nsw i64 %indvars.iv31.i to i32
  %25 = urem i32 %24, 12
  %26 = getelementptr [262144 x i8], ptr %10, i64 %indvars.iv31.i
  br label %.preheader.i

.preheader.i:                                     ; preds = %._crit_edge.i, %.preheader17.i
  %indvars.iv26.i = phi i64 [ 0, %.preheader17.i ], [ %indvars.iv.next27.i, %._crit_edge.i ]
  %27 = getelementptr [1024 x i8], ptr %26, i64 %indvars.iv26.i
  %28 = trunc nuw nsw i64 %indvars.iv26.i to i32
  %29 = urem i32 %28, 7
  %30 = shl nuw nsw i32 %29, 1
  %31 = add nuw nsw i32 %30, %25
  %broadcast.splatinsert = insertelement <4 x i32> poison, i32 %31, i64 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.i
  %index = phi i64 [ 0, %.preheader.i ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %.preheader.i ], [ %vec.ind.next, %vector.body ]
  %32 = urem <4 x i32> %vec.ind, splat (i32 13)
  %33 = mul nuw nsw <4 x i32> %32, splat (i32 3)
  %34 = add nuw nsw <4 x i32> %broadcast.splat, %33
  %35 = uitofp nneg <4 x i32> %34 to <4 x float>
  %36 = getelementptr [4 x i8], ptr %27, i64 %index
  store <4 x float> %35, ptr %36, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %37 = icmp eq i64 %index.next, 256
  br i1 %37, label %._crit_edge.i, label %vector.body, !llvm.loop !15

._crit_edge.i:                                    ; preds = %vector.body
  %indvars.iv.next27.i = add nuw nsw i64 %indvars.iv26.i, 1
  %exitcond30.not.i = icmp eq i64 %indvars.iv.next27.i, 256
  br i1 %exitcond30.not.i, label %._crit_edge20.i, label %.preheader.i

._crit_edge20.i:                                  ; preds = %._crit_edge.i
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1
  %exitcond35.not.i = icmp eq i64 %indvars.iv.next32.i, 256
  br i1 %exitcond35.not.i, label %_Z4initiiiPA256_A256_f.exit, label %.preheader17.i

_Z4initiiiPA256_A256_f.exit:                      ; preds = %._crit_edge20.i
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  %38 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %5, i32 noundef 0) #5
  %39 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %5) #5
  %40 = call i32 @cudaSetDevice(i32 noundef 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @_Z17convolution3DCudaiiiPA256_A256_fS1_S1_(i32 noundef 256, i32 noundef 256, i32 noundef 256, ptr noundef nonnull %10, ptr noundef %15, ptr noundef %20) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %41 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #13
  %.not.i.i31 = icmp eq i32 %41, 0
  br i1 %.not.i.i31, label %_Z21polybench_timer_startv.exit, label %42

42:                                               ; preds = %_Z4initiiiPA256_A256_f.exit
  %43 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %41) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z4initiiiPA256_A256_f.exit, %42
  %44 = load i64, ptr %4, align 8
  %45 = sitofp i64 %44 to double
  %46 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %47 = load i64, ptr %46, align 8
  %48 = sitofp i64 %47 to double
  %49 = fmul nnan double %48, f0x3EB0C6F7A0B5ED8D
  %50 = fadd double %49, %45
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %50, ptr @polybench_t_start, align 8
  call void @_Z6conv3DiiiPA256_A256_fS1_(i32 noundef 256, i32 noundef 256, i32 noundef 256, ptr noundef nonnull %10, ptr noundef %15) #5
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %51 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #13
  %.not.i.i32 = icmp eq i32 %51, 0
  br i1 %.not.i.i32, label %_Z20polybench_timer_stopv.exit, label %52

52:                                               ; preds = %_Z21polybench_timer_startv.exit
  %53 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %51) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z21polybench_timer_startv.exit, %52
  %54 = load i64, ptr %3, align 8
  %55 = sitofp i64 %54 to double
  %56 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %57 = load i64, ptr %56, align 8
  %58 = sitofp i64 %57 to double
  %59 = fmul nnan double %58, f0x3EB0C6F7A0B5ED8D
  %60 = fadd double %59, %55
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %60, ptr @polybench_t_end, align 8
  %61 = load double, ptr @polybench_t_start, align 8
  %62 = fsub double %60, %61
  %63 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %62) #5
  br label %.preheader21.us.us.i

.preheader21.us.us.i:                             ; preds = %._crit_edge26.split.us.us.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv44.i = phi i64 [ 1, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next45.i, %._crit_edge26.split.us.us.us.i ]
  %.029.us.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %.3.us.us.us.i.1, %._crit_edge26.split.us.us.us.i ]
  %64 = getelementptr [262144 x i8], ptr %15, i64 %indvars.iv44.i
  %65 = getelementptr [262144 x i8], ptr %20, i64 %indvars.iv44.i
  br label %.preheader.us.us.us.i

.preheader.us.us.us.i:                            ; preds = %_Z11percentDiffdd.exit.us.us.us.i.1, %.preheader21.us.us.i
  %indvars.iv39.i = phi i64 [ %indvars.iv.next40.i, %_Z11percentDiffdd.exit.us.us.us.i.1 ], [ 1, %.preheader21.us.us.i ]
  %.125.us.us.us.i = phi i32 [ %.3.us.us.us.i.1, %_Z11percentDiffdd.exit.us.us.us.i.1 ], [ %.029.us.us.i, %.preheader21.us.us.i ]
  %66 = getelementptr [1024 x i8], ptr %64, i64 %indvars.iv39.i
  %67 = getelementptr [1024 x i8], ptr %65, i64 %indvars.iv39.i
  %68 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.125.us.us.us.i, i64 0
  br label %vector.body42

vector.body42:                                    ; preds = %vector.body42, %.preheader.us.us.us.i
  %index43 = phi i64 [ 0, %.preheader.us.us.us.i ], [ %index.next45, %vector.body42 ]
  %vec.phi = phi <4 x i32> [ %68, %.preheader.us.us.us.i ], [ %100, %vector.body42 ]
  %69 = or disjoint i64 %index43, 1
  %70 = getelementptr [4 x i8], ptr %66, i64 %69
  %wide.load = load <4 x float>, ptr %70, align 4
  %71 = fpext <4 x float> %wide.load to <4 x double>
  %72 = getelementptr [4 x i8], ptr %67, i64 %69
  %wide.load44 = load <4 x float>, ptr %72, align 4
  %73 = fpext <4 x float> %wide.load44 to <4 x double>
  %74 = fcmp olt <4 x double> %71, splat (double f0xB690000000000000)
  %75 = fneg <4 x float> %wide.load
  %76 = select <4 x i1> %74, <4 x float> %75, <4 x float> %wide.load
  %77 = fpext <4 x float> %76 to <4 x double>
  %78 = fcmp uge <4 x double> %77, splat (double 1.000000e-02)
  %79 = fcmp olt <4 x double> %73, splat (double f0xB690000000000000)
  %80 = fneg <4 x float> %wide.load44
  %81 = select <4 x i1> %79, <4 x float> %80, <4 x float> %wide.load44
  %82 = fpext <4 x float> %81 to <4 x double>
  %83 = fcmp uge <4 x double> %82, splat (double 1.000000e-02)
  %84 = fsub <4 x double> %71, %73
  %85 = fptrunc <4 x double> %84 to <4 x float>
  %86 = fcmp olt <4 x double> %84, splat (double f0xB690000000000000)
  %87 = fneg <4 x float> %85
  %88 = select <4 x i1> %86, <4 x float> %87, <4 x float> %85
  %89 = fadd <4 x double> %71, splat (double f0x3E45798EE0000000)
  %90 = fptrunc <4 x double> %89 to <4 x float>
  %91 = fcmp olt <4 x double> %89, splat (double f0xB690000000000000)
  %92 = fneg <4 x float> %90
  %93 = select <4 x i1> %91, <4 x float> %92, <4 x float> %90
  %94 = fdiv <4 x float> %88, %93
  %95 = fcmp olt <4 x float> %94, zeroinitializer
  %96 = fneg <4 x float> %94
  %97 = select <4 x i1> %95, <4 x float> %96, <4 x float> %94
  %98 = fmul <4 x float> %97, splat (float 1.000000e+02)
  %99 = fcmp ogt <4 x float> %98, splat (float 5.000000e-01)
  %.not48 = select <4 x i1> %78, <4 x i1> splat (i1 true), <4 x i1> %83
  %narrow = select <4 x i1> %.not48, <4 x i1> %99, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %100 = add <4 x i32> %vec.phi, %predphi
  %index.next45 = add nuw i64 %index43, 4
  %101 = icmp eq i64 %index.next45, 252
  br i1 %101, label %scalar.ph, label %vector.body42, !llvm.loop !16

scalar.ph:                                        ; preds = %vector.body42
  %102 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %100)
  %103 = getelementptr i8, ptr %66, i64 1012
  %104 = load float, ptr %103, align 4
  %105 = fpext float %104 to double
  %106 = getelementptr i8, ptr %67, i64 1012
  %107 = load float, ptr %106, align 4
  %108 = fpext float %107 to double
  %109 = fcmp olt double %105, f0xB690000000000000
  %110 = fneg float %104
  %common.ret.op.i.i.us.us.us.i = select i1 %109, float %110, float %104
  %111 = fpext float %common.ret.op.i.i.us.us.us.i to double
  %112 = fcmp olt double %111, 1.000000e-02
  br i1 %112, label %113, label %.critedge.i.us.us.us.i

113:                                              ; preds = %scalar.ph
  %114 = fcmp olt double %108, f0xB690000000000000
  %115 = fneg float %107
  %common.ret.op.i7.i.us.us.us.i = select i1 %114, float %115, float %107
  %116 = fpext float %common.ret.op.i7.i.us.us.us.i to double
  %117 = fcmp olt double %116, 1.000000e-02
  br i1 %117, label %_Z11percentDiffdd.exit.us.us.us.i, label %.critedge.i.us.us.us.i

.critedge.i.us.us.us.i:                           ; preds = %113, %scalar.ph
  %118 = insertelement <2 x double> poison, double %105, i64 0
  %119 = shufflevector <2 x double> %118, <2 x double> poison, <2 x i32> zeroinitializer
  %120 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %108, i64 0
  %121 = fsub <2 x double> %119, %120
  %122 = fptrunc <2 x double> %121 to <2 x float>
  %123 = fcmp olt <2 x double> %121, splat (double f0xB690000000000000)
  %124 = fneg <2 x float> %122
  %125 = select <2 x i1> %123, <2 x float> %124, <2 x float> %122
  %126 = extractelement <2 x float> %125, i64 0
  %127 = extractelement <2 x float> %125, i64 1
  %128 = fdiv float %126, %127
  %129 = fcmp olt float %128, 0.000000e+00
  %130 = fneg float %128
  %common.ret.op.i10.i.us.us.us.i = select i1 %129, float %130, float %128
  %131 = fmul float %common.ret.op.i10.i.us.us.us.i, 1.000000e+02
  %132 = fcmp ogt float %131, 5.000000e-01
  %133 = zext i1 %132 to i32
  br label %_Z11percentDiffdd.exit.us.us.us.i

_Z11percentDiffdd.exit.us.us.us.i:                ; preds = %.critedge.i.us.us.us.i, %113
  %common.ret.op.i.us.us.us.i = phi i32 [ %133, %.critedge.i.us.us.us.i ], [ 0, %113 ]
  %.3.us.us.us.i = add nsw i32 %common.ret.op.i.us.us.us.i, %102
  %134 = getelementptr i8, ptr %66, i64 1016
  %135 = load float, ptr %134, align 4
  %136 = fpext float %135 to double
  %137 = getelementptr i8, ptr %67, i64 1016
  %138 = load float, ptr %137, align 4
  %139 = fpext float %138 to double
  %140 = fcmp olt double %136, f0xB690000000000000
  %141 = fneg float %135
  %common.ret.op.i.i.us.us.us.i.1 = select i1 %140, float %141, float %135
  %142 = fpext float %common.ret.op.i.i.us.us.us.i.1 to double
  %143 = fcmp olt double %142, 1.000000e-02
  br i1 %143, label %144, label %.critedge.i.us.us.us.i.1

144:                                              ; preds = %_Z11percentDiffdd.exit.us.us.us.i
  %145 = fcmp olt double %139, f0xB690000000000000
  %146 = fneg float %138
  %common.ret.op.i7.i.us.us.us.i.1 = select i1 %145, float %146, float %138
  %147 = fpext float %common.ret.op.i7.i.us.us.us.i.1 to double
  %148 = fcmp olt double %147, 1.000000e-02
  br i1 %148, label %_Z11percentDiffdd.exit.us.us.us.i.1, label %.critedge.i.us.us.us.i.1

.critedge.i.us.us.us.i.1:                         ; preds = %144, %_Z11percentDiffdd.exit.us.us.us.i
  %149 = insertelement <2 x double> poison, double %136, i64 0
  %150 = shufflevector <2 x double> %149, <2 x double> poison, <2 x i32> zeroinitializer
  %151 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %139, i64 0
  %152 = fsub <2 x double> %150, %151
  %153 = fptrunc <2 x double> %152 to <2 x float>
  %154 = fcmp olt <2 x double> %152, splat (double f0xB690000000000000)
  %155 = fneg <2 x float> %153
  %156 = select <2 x i1> %154, <2 x float> %155, <2 x float> %153
  %157 = extractelement <2 x float> %156, i64 0
  %158 = extractelement <2 x float> %156, i64 1
  %159 = fdiv float %157, %158
  %160 = fcmp olt float %159, 0.000000e+00
  %161 = fneg float %159
  %common.ret.op.i10.i.us.us.us.i.1 = select i1 %160, float %161, float %159
  %162 = fmul float %common.ret.op.i10.i.us.us.us.i.1, 1.000000e+02
  %163 = fcmp ogt float %162, 5.000000e-01
  %164 = zext i1 %163 to i32
  br label %_Z11percentDiffdd.exit.us.us.us.i.1

_Z11percentDiffdd.exit.us.us.us.i.1:              ; preds = %.critedge.i.us.us.us.i.1, %144
  %common.ret.op.i.us.us.us.i.1 = phi i32 [ %164, %.critedge.i.us.us.us.i.1 ], [ 0, %144 ]
  %.3.us.us.us.i.1 = add nsw i32 %common.ret.op.i.us.us.us.i.1, %.3.us.us.us.i
  %indvars.iv.next40.i = add nuw nsw i64 %indvars.iv39.i, 1
  %exitcond43.not.i = icmp eq i64 %indvars.iv.next40.i, 255
  br i1 %exitcond43.not.i, label %._crit_edge26.split.us.us.us.i, label %.preheader.us.us.us.i

._crit_edge26.split.us.us.us.i:                   ; preds = %_Z11percentDiffdd.exit.us.us.us.i.1
  %indvars.iv.next45.i = add nuw nsw i64 %indvars.iv44.i, 1
  %exitcond48.not.i = icmp eq i64 %indvars.iv.next45.i, 255
  br i1 %exitcond48.not.i, label %_Z14compareResultsiiiPA256_A256_fS1_.exit, label %.preheader21.us.us.i

_Z14compareResultsiiiPA256_A256_fS1_.exit:        ; preds = %._crit_edge26.split.us.us.us.i
  %165 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-01, i32 noundef %.3.us.us.us.i.1) #5
  call void @free(ptr noundef %10) #13
  call void @free(ptr noundef nonnull %15) #13
  call void @free(ptr noundef nonnull %20) #13
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.isvectorized", i32 1}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7, !8}
!11 = distinct !{!11, !8, !7}
!12 = distinct !{!12, !7, !8}
!13 = distinct !{!13, !8, !7}
!14 = !{ptr @_Z35__device_stub__convolution3D_kerneliiiPfS_i}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
