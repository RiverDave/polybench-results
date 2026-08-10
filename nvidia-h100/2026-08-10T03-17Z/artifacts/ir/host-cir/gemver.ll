; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GEMVER/gemver.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GEMVER/gemver.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cudaDeviceProp = type { [256 x i8], %struct.CUuuid_st, [8 x i8], i32, i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [63 x i32] }
%struct.CUuuid_st = type { [16 x i8] }
%struct.dim3 = type { i32, i32, i32 }
%struct.timeval = type { i64, i64 }

@.str = private constant [22 x i8] c"Number of misses: %d\0A\00", align 1
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
define dso_local void @_Z6gemveriffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_(i32 noundef %0, float noundef %1, float noundef %2, ptr nofree noundef captures(none) %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef readonly captures(none) %7, ptr nofree noundef captures(none) %8, ptr nofree noundef captures(none) %9, ptr nofree noundef readonly captures(none) %10, ptr nofree noundef readonly captures(none) %11) local_unnamed_addr #1 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader69.preheader, label %._crit_edge81.split

.preheader69.preheader:                           ; preds = %12
  %wide.trip.count86 = zext nneg i32 %0 to i64
  %14 = mul nuw nsw i64 %wide.trip.count86, 16388
  %15 = getelementptr i8, ptr %3, i64 %14
  %scevgep = getelementptr i8, ptr %15, i64 -16384
  %16 = shl nuw nsw i64 %wide.trip.count86, 2
  %scevgep113 = getelementptr i8, ptr %4, i64 %16
  %scevgep114 = getelementptr i8, ptr %5, i64 %16
  %scevgep115 = getelementptr i8, ptr %6, i64 %16
  %scevgep116 = getelementptr i8, ptr %7, i64 %16
  %17 = insertelement <4 x ptr> poison, ptr %3, i64 0
  %18 = shufflevector <4 x ptr> %17, <4 x ptr> poison, <4 x i32> zeroinitializer
  %19 = insertelement <4 x ptr> poison, ptr %scevgep113, i64 0
  %20 = insertelement <4 x ptr> %19, ptr %scevgep114, i64 1
  %21 = insertelement <4 x ptr> %20, ptr %scevgep115, i64 2
  %22 = insertelement <4 x ptr> %21, ptr %scevgep116, i64 3
  %23 = insertelement <4 x ptr> poison, ptr %4, i64 0
  %24 = insertelement <4 x ptr> %23, ptr %5, i64 1
  %25 = insertelement <4 x ptr> %24, ptr %6, i64 2
  %26 = insertelement <4 x ptr> %25, ptr %7, i64 3
  %27 = insertelement <4 x ptr> poison, ptr %scevgep, i64 0
  %28 = shufflevector <4 x ptr> %27, <4 x ptr> poison, <4 x i32> zeroinitializer
  %29 = add nsw i64 %wide.trip.count86, -1
  %min.iters.check = icmp ult i32 %0, 8
  %30 = icmp ult <4 x ptr> %18, %22
  %31 = icmp ult <4 x ptr> %26, %28
  %32 = and <4 x i1> %30, %31
  %33 = bitcast <4 x i1> %32 to i4
  %.not = icmp eq i4 %33, 0
  %n.vec = and i64 %wide.trip.count86, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count86
  %xtraiter = and i64 %wide.trip.count86, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %.preheader69

.preheader69:                                     ; preds = %.preheader69.preheader, %._crit_edge
  %indvars.iv83 = phi i64 [ 0, %.preheader69.preheader ], [ %indvars.iv.next84, %._crit_edge ]
  %34 = getelementptr [16384 x i8], ptr %3, i64 %indvars.iv83
  %35 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv83
  %36 = getelementptr [4 x i8], ptr %6, i64 %indvars.iv83
  %.not.not = xor i1 %.not, true
  %brmerge = select i1 %min.iters.check, i1 true, i1 %.not.not
  br i1 %brmerge, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader69
  %37 = load float, ptr %35, align 4, !alias.scope !1
  %broadcast.splatinsert = insertelement <4 x float> poison, float %37, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %38 = load float, ptr %36, align 4, !alias.scope !4
  %broadcast.splatinsert133 = insertelement <4 x float> poison, float %38, i64 0
  %broadcast.splat134 = shufflevector <4 x float> %broadcast.splatinsert133, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %39 = getelementptr [4 x i8], ptr %34, i64 %index
  %40 = getelementptr i8, ptr %39, i64 16
  %wide.load = load <4 x float>, ptr %39, align 4, !alias.scope !6, !noalias !8
  %wide.load128 = load <4 x float>, ptr %40, align 4, !alias.scope !6, !noalias !8
  %41 = getelementptr [4 x i8], ptr %5, i64 %index
  %42 = getelementptr i8, ptr %41, i64 16
  %wide.load129 = load <4 x float>, ptr %41, align 4, !alias.scope !11
  %wide.load130 = load <4 x float>, ptr %42, align 4, !alias.scope !11
  %43 = fmul <4 x float> %broadcast.splat, %wide.load129
  %44 = fmul <4 x float> %broadcast.splat, %wide.load130
  %45 = fadd <4 x float> %wide.load, %43
  %46 = fadd <4 x float> %wide.load128, %44
  %47 = getelementptr [4 x i8], ptr %7, i64 %index
  %48 = getelementptr i8, ptr %47, i64 16
  %wide.load131 = load <4 x float>, ptr %47, align 4, !alias.scope !12
  %wide.load132 = load <4 x float>, ptr %48, align 4, !alias.scope !12
  %49 = fmul <4 x float> %broadcast.splat134, %wide.load131
  %50 = fmul <4 x float> %broadcast.splat134, %wide.load132
  %51 = fadd <4 x float> %45, %49
  %52 = fadd <4 x float> %46, %50
  store <4 x float> %51, ptr %39, align 4, !alias.scope !6, !noalias !8
  store <4 x float> %52, ptr %40, align 4, !alias.scope !6, !noalias !8
  %index.next = add nuw i64 %index, 8
  %53 = icmp eq i64 %index.next, %n.vec
  br i1 %53, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader69, %middle.block
  %indvars.iv.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %.preheader69 ]
  br i1 %lcmp.mod.not, label %scalar.ph.prol.loopexit, label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.preheader
  %54 = getelementptr [4 x i8], ptr %34, i64 %indvars.iv.ph
  %55 = load float, ptr %54, align 4
  %56 = load float, ptr %35, align 4
  %57 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv.ph
  %58 = load float, ptr %57, align 4
  %59 = fmul float %56, %58
  %60 = fadd float %55, %59
  %61 = load float, ptr %36, align 4
  %62 = getelementptr [4 x i8], ptr %7, i64 %indvars.iv.ph
  %63 = load float, ptr %62, align 4
  %64 = fmul float %61, %63
  %65 = fadd float %60, %64
  store float %65, ptr %54, align 4
  %indvars.iv.next.prol = or disjoint i64 %indvars.iv.ph, 1
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol, %scalar.ph.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph.preheader ], [ %indvars.iv.next.prol, %scalar.ph.prol ]
  %66 = icmp eq i64 %29, %indvars.iv.ph
  br i1 %66, label %._crit_edge, label %scalar.ph

.preheader67.preheader:                           ; preds = %._crit_edge
  %wide.trip.count96 = zext nneg i32 %0 to i64
  %xtraiter157 = and i64 %wide.trip.count86, 1
  %67 = icmp eq i64 %29, 0
  %unroll_iter = and i64 %wide.trip.count86, 2147483646
  %lcmp.mod158.not = icmp eq i64 %xtraiter157, 0
  %lcmp.mod159 = trunc i32 %0 to i1
  br label %.preheader67

scalar.ph:                                        ; preds = %scalar.ph.prol.loopexit, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %scalar.ph ], [ %indvars.iv.unr, %scalar.ph.prol.loopexit ]
  %68 = getelementptr [4 x i8], ptr %34, i64 %indvars.iv
  %69 = load float, ptr %68, align 4
  %70 = load float, ptr %35, align 4
  %71 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv
  %72 = load float, ptr %71, align 4
  %73 = fmul float %70, %72
  %74 = fadd float %69, %73
  %75 = load float, ptr %36, align 4
  %76 = getelementptr [4 x i8], ptr %7, i64 %indvars.iv
  %77 = load float, ptr %76, align 4
  %78 = fmul float %75, %77
  %79 = fadd float %74, %78
  store float %79, ptr %68, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %80 = getelementptr [4 x i8], ptr %34, i64 %indvars.iv.next
  %81 = load float, ptr %80, align 4
  %82 = load float, ptr %35, align 4
  %83 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv.next
  %84 = load float, ptr %83, align 4
  %85 = fmul float %82, %84
  %86 = fadd float %81, %85
  %87 = load float, ptr %36, align 4
  %88 = getelementptr [4 x i8], ptr %7, i64 %indvars.iv.next
  %89 = load float, ptr %88, align 4
  %90 = fmul float %87, %89
  %91 = fadd float %86, %90
  store float %91, ptr %80, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count86
  br i1 %exitcond.not.1, label %._crit_edge, label %scalar.ph, !llvm.loop !16

._crit_edge:                                      ; preds = %scalar.ph.prol.loopexit, %scalar.ph, %middle.block
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond87.not = icmp eq i64 %indvars.iv.next84, %wide.trip.count86
  br i1 %exitcond87.not, label %.preheader67.preheader, label %.preheader69

.preheader67:                                     ; preds = %.preheader67.preheader, %._crit_edge73
  %indvars.iv93 = phi i64 [ 0, %.preheader67.preheader ], [ %indvars.iv.next94, %._crit_edge73 ]
  %92 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv93
  %invariant.gep = getelementptr [4 x i8], ptr %3, i64 %indvars.iv93
  %.promoted = load float, ptr %92, align 4
  br i1 %67, label %.epil.preheader, label %.preheader67.new

.lr.ph.preheader:                                 ; preds = %._crit_edge73
  %wide.trip.count101 = zext nneg i32 %0 to i64
  %min.iters.check142 = icmp ult i32 %0, 8
  br i1 %min.iters.check142, label %.lr.ph.preheader156, label %vector.memcheck135

vector.memcheck135:                               ; preds = %.lr.ph.preheader
  %93 = shl nuw nsw i64 %wide.trip.count86, 2
  %scevgep136 = getelementptr i8, ptr %9, i64 %93
  %scevgep137 = getelementptr i8, ptr %11, i64 %93
  %bound0138 = icmp ult ptr %9, %scevgep137
  %bound1139 = icmp ult ptr %11, %scevgep136
  %found.conflict140 = and i1 %bound0138, %bound1139
  br i1 %found.conflict140, label %.lr.ph.preheader156, label %vector.ph143

vector.ph143:                                     ; preds = %vector.memcheck135
  %n.vec145 = and i64 %wide.trip.count86, 2147483640
  br label %vector.body146

vector.body146:                                   ; preds = %vector.body146, %vector.ph143
  %index147 = phi i64 [ 0, %vector.ph143 ], [ %index.next152, %vector.body146 ]
  %94 = getelementptr [4 x i8], ptr %9, i64 %index147
  %95 = getelementptr i8, ptr %94, i64 16
  %wide.load148 = load <4 x float>, ptr %94, align 4, !alias.scope !17, !noalias !20
  %wide.load149 = load <4 x float>, ptr %95, align 4, !alias.scope !17, !noalias !20
  %96 = getelementptr [4 x i8], ptr %11, i64 %index147
  %97 = getelementptr i8, ptr %96, i64 16
  %wide.load150 = load <4 x float>, ptr %96, align 4, !alias.scope !20
  %wide.load151 = load <4 x float>, ptr %97, align 4, !alias.scope !20
  %98 = fadd <4 x float> %wide.load148, %wide.load150
  %99 = fadd <4 x float> %wide.load149, %wide.load151
  store <4 x float> %98, ptr %94, align 4, !alias.scope !17, !noalias !20
  store <4 x float> %99, ptr %95, align 4, !alias.scope !17, !noalias !20
  %index.next152 = add nuw i64 %index147, 8
  %100 = icmp eq i64 %index.next152, %n.vec145
  br i1 %100, label %middle.block153, label %vector.body146, !llvm.loop !22

middle.block153:                                  ; preds = %vector.body146
  %cmp.n154 = icmp eq i64 %n.vec145, %wide.trip.count86
  br i1 %cmp.n154, label %.preheader.preheader, label %.lr.ph.preheader156

.lr.ph.preheader156:                              ; preds = %vector.memcheck135, %.lr.ph.preheader, %middle.block153
  %indvars.iv98.ph = phi i64 [ 0, %vector.memcheck135 ], [ 0, %.lr.ph.preheader ], [ %n.vec145, %middle.block153 ]
  %xtraiter160 = and i64 %wide.trip.count86, 3
  %lcmp.mod161.not = icmp eq i64 %xtraiter160, 0
  br i1 %lcmp.mod161.not, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader156, %.lr.ph.prol
  %indvars.iv98.prol = phi i64 [ %indvars.iv.next99.prol, %.lr.ph.prol ], [ %indvars.iv98.ph, %.lr.ph.preheader156 ]
  %prol.iter = phi i64 [ %prol.iter.next, %.lr.ph.prol ], [ 0, %.lr.ph.preheader156 ]
  %101 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv98.prol
  %102 = load float, ptr %101, align 4
  %103 = getelementptr [4 x i8], ptr %11, i64 %indvars.iv98.prol
  %104 = load float, ptr %103, align 4
  %105 = fadd float %102, %104
  store float %105, ptr %101, align 4
  %indvars.iv.next99.prol = add nuw nsw i64 %indvars.iv98.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter160
  br i1 %prol.iter.cmp.not, label %.lr.ph.prol.loopexit, label %.lr.ph.prol, !llvm.loop !23

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader156
  %indvars.iv98.unr = phi i64 [ %indvars.iv98.ph, %.lr.ph.preheader156 ], [ %indvars.iv.next99.prol, %.lr.ph.prol ]
  %106 = sub nsw i64 %indvars.iv98.ph, %wide.trip.count86
  %107 = icmp ugt i64 %106, -4
  br i1 %107, label %.preheader.preheader, label %.lr.ph

.preheader67.new:                                 ; preds = %.preheader67, %.preheader67.new
  %indvars.iv88 = phi i64 [ %indvars.iv.next89.1, %.preheader67.new ], [ 0, %.preheader67 ]
  %108 = phi float [ %120, %.preheader67.new ], [ %.promoted, %.preheader67 ]
  %niter = phi i64 [ %niter.next.1, %.preheader67.new ], [ 0, %.preheader67 ]
  %gep = getelementptr [16384 x i8], ptr %invariant.gep, i64 %indvars.iv88
  %109 = load float, ptr %gep, align 4
  %110 = fmul float %2, %109
  %111 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv88
  %112 = load float, ptr %111, align 4
  %113 = fmul float %110, %112
  %114 = fadd float %108, %113
  store float %114, ptr %92, align 4
  %indvars.iv.next89 = or disjoint i64 %indvars.iv88, 1
  %gep.1 = getelementptr [16384 x i8], ptr %invariant.gep, i64 %indvars.iv.next89
  %115 = load float, ptr %gep.1, align 4
  %116 = fmul float %2, %115
  %117 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv.next89
  %118 = load float, ptr %117, align 4
  %119 = fmul float %116, %118
  %120 = fadd float %114, %119
  store float %120, ptr %92, align 4
  %indvars.iv.next89.1 = add nuw nsw i64 %indvars.iv88, 2
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %._crit_edge73.unr-lcssa, label %.preheader67.new

._crit_edge73.unr-lcssa:                          ; preds = %.preheader67.new
  br i1 %lcmp.mod158.not, label %._crit_edge73, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge73.unr-lcssa, %.preheader67
  %indvars.iv88.epil.init = phi i64 [ 0, %.preheader67 ], [ %indvars.iv.next89.1, %._crit_edge73.unr-lcssa ]
  %.epil.init = phi float [ %.promoted, %.preheader67 ], [ %120, %._crit_edge73.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod159)
  %gep.epil = getelementptr [16384 x i8], ptr %invariant.gep, i64 %indvars.iv88.epil.init
  %121 = load float, ptr %gep.epil, align 4
  %122 = fmul float %2, %121
  %123 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv88.epil.init
  %124 = load float, ptr %123, align 4
  %125 = fmul float %122, %124
  %126 = fadd float %.epil.init, %125
  store float %126, ptr %92, align 4
  br label %._crit_edge73

._crit_edge73:                                    ; preds = %._crit_edge73.unr-lcssa, %.epil.preheader
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond97.not = icmp eq i64 %indvars.iv.next94, %wide.trip.count96
  br i1 %exitcond97.not, label %.lr.ph.preheader, label %.preheader67

.preheader.preheader:                             ; preds = %.lr.ph.prol.loopexit, %.lr.ph, %middle.block153
  %wide.trip.count111 = zext nneg i32 %0 to i64
  %xtraiter163 = and i64 %wide.trip.count86, 1
  %127 = icmp eq i64 %29, 0
  %unroll_iter168 = and i64 %wide.trip.count86, 2147483646
  %lcmp.mod166.not = icmp eq i64 %xtraiter163, 0
  %lcmp.mod167 = trunc i32 %0 to i1
  br label %.preheader

.lr.ph:                                           ; preds = %.lr.ph.prol.loopexit, %.lr.ph
  %indvars.iv98 = phi i64 [ %indvars.iv.next99.3, %.lr.ph ], [ %indvars.iv98.unr, %.lr.ph.prol.loopexit ]
  %128 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv98
  %129 = load float, ptr %128, align 4
  %130 = getelementptr [4 x i8], ptr %11, i64 %indvars.iv98
  %131 = load float, ptr %130, align 4
  %132 = fadd float %129, %131
  store float %132, ptr %128, align 4
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %133 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv.next99
  %134 = load float, ptr %133, align 4
  %135 = getelementptr [4 x i8], ptr %11, i64 %indvars.iv.next99
  %136 = load float, ptr %135, align 4
  %137 = fadd float %134, %136
  store float %137, ptr %133, align 4
  %indvars.iv.next99.1 = add nuw nsw i64 %indvars.iv98, 2
  %138 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv.next99.1
  %139 = load float, ptr %138, align 4
  %140 = getelementptr [4 x i8], ptr %11, i64 %indvars.iv.next99.1
  %141 = load float, ptr %140, align 4
  %142 = fadd float %139, %141
  store float %142, ptr %138, align 4
  %indvars.iv.next99.2 = add nuw nsw i64 %indvars.iv98, 3
  %143 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv.next99.2
  %144 = load float, ptr %143, align 4
  %145 = getelementptr [4 x i8], ptr %11, i64 %indvars.iv.next99.2
  %146 = load float, ptr %145, align 4
  %147 = fadd float %144, %146
  store float %147, ptr %143, align 4
  %indvars.iv.next99.3 = add nuw nsw i64 %indvars.iv98, 4
  %exitcond102.not.3 = icmp eq i64 %indvars.iv.next99.3, %wide.trip.count101
  br i1 %exitcond102.not.3, label %.preheader.preheader, label %.lr.ph, !llvm.loop !25

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge78
  %indvars.iv108 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next109, %._crit_edge78 ]
  %148 = getelementptr [4 x i8], ptr %8, i64 %indvars.iv108
  %149 = getelementptr [16384 x i8], ptr %3, i64 %indvars.iv108
  %.promoted79 = load float, ptr %148, align 4
  br i1 %127, label %.epil.preheader162, label %.preheader.new

.preheader.new:                                   ; preds = %.preheader, %.preheader.new
  %indvars.iv103 = phi i64 [ %indvars.iv.next104.1, %.preheader.new ], [ 0, %.preheader ]
  %150 = phi float [ %164, %.preheader.new ], [ %.promoted79, %.preheader ]
  %niter169 = phi i64 [ %niter169.next.1, %.preheader.new ], [ 0, %.preheader ]
  %151 = getelementptr [4 x i8], ptr %149, i64 %indvars.iv103
  %152 = load float, ptr %151, align 4
  %153 = fmul float %1, %152
  %154 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv103
  %155 = load float, ptr %154, align 4
  %156 = fmul float %153, %155
  %157 = fadd float %150, %156
  store float %157, ptr %148, align 4
  %indvars.iv.next104 = or disjoint i64 %indvars.iv103, 1
  %158 = getelementptr [4 x i8], ptr %149, i64 %indvars.iv.next104
  %159 = load float, ptr %158, align 4
  %160 = fmul float %1, %159
  %161 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv.next104
  %162 = load float, ptr %161, align 4
  %163 = fmul float %160, %162
  %164 = fadd float %157, %163
  store float %164, ptr %148, align 4
  %indvars.iv.next104.1 = add nuw nsw i64 %indvars.iv103, 2
  %niter169.next.1 = add i64 %niter169, 2
  %niter169.ncmp.1 = icmp eq i64 %niter169.next.1, %unroll_iter168
  br i1 %niter169.ncmp.1, label %._crit_edge78.unr-lcssa, label %.preheader.new

._crit_edge78.unr-lcssa:                          ; preds = %.preheader.new
  br i1 %lcmp.mod166.not, label %._crit_edge78, label %.epil.preheader162

.epil.preheader162:                               ; preds = %._crit_edge78.unr-lcssa, %.preheader
  %indvars.iv103.epil.init = phi i64 [ 0, %.preheader ], [ %indvars.iv.next104.1, %._crit_edge78.unr-lcssa ]
  %.epil.init165 = phi float [ %.promoted79, %.preheader ], [ %164, %._crit_edge78.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod167)
  %165 = getelementptr [4 x i8], ptr %149, i64 %indvars.iv103.epil.init
  %166 = load float, ptr %165, align 4
  %167 = fmul float %1, %166
  %168 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv103.epil.init
  %169 = load float, ptr %168, align 4
  %170 = fmul float %167, %169
  %171 = fadd float %.epil.init165, %170
  store float %171, ptr %148, align 4
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.unr-lcssa, %.epil.preheader162
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond112.not = icmp eq i64 %indvars.iv.next109, %wide.trip.count111
  br i1 %exitcond112.not, label %._crit_edge81.split, label %.preheader

._crit_edge81.split:                              ; preds = %._crit_edge78, %12
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: write)
define dso_local void @_Z4initiPfS_PA4096_fS_S_S_S_S_S_S_S_(i32 noundef %0, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %1, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %2, ptr nofree noundef writeonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4, ptr nofree noundef writeonly captures(none) %5, ptr nofree noundef writeonly captures(none) %6, ptr nofree noundef writeonly captures(none) %7, ptr nofree noundef writeonly captures(none) %8, ptr nofree noundef writeonly captures(none) %9, ptr nofree noundef writeonly captures(none) %10, ptr nofree noundef writeonly captures(none) %11) local_unnamed_addr #2 {
  store float 4.353200e+04, ptr %1, align 4
  store float 1.231300e+04, ptr %2, align 4
  br label %vector.ph

vector.ph:                                        ; preds = %12, %middle.block
  %indvars.iv36 = phi i64 [ 0, %12 ], [ %indvars.iv.next37, %middle.block ]
  %13 = trunc nuw nsw i64 %indvars.iv36 to i32
  %14 = uitofp nneg i32 %13 to float
  %15 = getelementptr [4 x i8], ptr %4, i64 %indvars.iv36
  store float %14, ptr %15, align 4
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %16 = trunc nuw nsw i64 %indvars.iv.next37 to i32
  %17 = lshr i32 %16, 12
  %18 = uitofp nneg i32 %17 to float
  %19 = fmul nnan float %18, 5.000000e-01
  %20 = getelementptr [4 x i8], ptr %6, i64 %indvars.iv36
  store float %19, ptr %20, align 4
  %21 = fmul nnan float %18, 2.500000e-01
  %22 = getelementptr [4 x i8], ptr %5, i64 %indvars.iv36
  store float %21, ptr %22, align 4
  %23 = getelementptr [4 x i8], ptr %7, i64 %indvars.iv36
  %24 = fmul nnan float %18, 1.250000e-01
  %25 = getelementptr [4 x i8], ptr %10, i64 %indvars.iv36
  %26 = insertelement <2 x float> poison, float %18, i64 0
  %27 = shufflevector <2 x float> %26, <2 x float> poison, <2 x i32> zeroinitializer
  %28 = fdiv <2 x float> %27, <float 6.000000e+00, float 9.000000e+00>
  %29 = extractelement <2 x float> %28, i64 0
  store float %29, ptr %23, align 4
  store float %24, ptr %25, align 4
  %30 = getelementptr [4 x i8], ptr %11, i64 %indvars.iv36
  %31 = extractelement <2 x float> %28, i64 1
  store float %31, ptr %30, align 4
  %32 = getelementptr [4 x i8], ptr %9, i64 %indvars.iv36
  store float 0.000000e+00, ptr %32, align 4
  %33 = getelementptr [4 x i8], ptr %8, i64 %indvars.iv36
  store float 0.000000e+00, ptr %33, align 4
  %34 = getelementptr [16384 x i8], ptr %3, i64 %indvars.iv36
  %broadcast.splatinsert = insertelement <4 x float> poison, float %14, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %35 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %36 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %37 = fmul nnan <4 x float> %broadcast.splat, %35
  %38 = fmul nnan <4 x float> %broadcast.splat, %36
  %39 = fmul nnan <4 x float> %37, splat (float f0x39800000)
  %40 = fmul nnan <4 x float> %38, splat (float f0x39800000)
  %41 = getelementptr [4 x i8], ptr %34, i64 %index
  %42 = getelementptr i8, ptr %41, i64 16
  store <4 x float> %39, ptr %41, align 4
  store <4 x float> %40, ptr %42, align 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %43 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %44 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %45 = fmul nnan <4 x float> %broadcast.splat, %43
  %46 = fmul nnan <4 x float> %broadcast.splat, %44
  %47 = fmul nnan <4 x float> %45, splat (float f0x39800000)
  %48 = fmul nnan <4 x float> %46, splat (float f0x39800000)
  %49 = getelementptr [4 x i8], ptr %34, i64 %index
  %50 = getelementptr i8, ptr %49, i64 32
  %51 = getelementptr i8, ptr %49, i64 48
  store <4 x float> %47, ptr %50, align 4
  store <4 x float> %48, ptr %51, align 4
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %52 = icmp eq i64 %index.next.1, 4096
  br i1 %52, label %middle.block, label %vector.body, !llvm.loop !26

middle.block:                                     ; preds = %vector.body
  %exitcond39.not = icmp eq i64 %indvars.iv.next37, 4096
  br i1 %exitcond39.not, label %53, label %vector.ph

53:                                               ; preds = %middle.block
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiPfS_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2) local_unnamed_addr #4 {
vector.ph:
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %35, %vector.body ]
  %3 = getelementptr [4 x i8], ptr %1, i64 %index
  %wide.load = load <4 x float>, ptr %3, align 4
  %4 = fpext <4 x float> %wide.load to <4 x double>
  %5 = getelementptr [4 x i8], ptr %2, i64 %index
  %wide.load11 = load <4 x float>, ptr %5, align 4
  %6 = fpext <4 x float> %wide.load11 to <4 x double>
  %7 = fcmp olt <4 x double> %4, splat (double f0xB690000000000000)
  %8 = fneg <4 x float> %wide.load
  %9 = select <4 x i1> %7, <4 x float> %8, <4 x float> %wide.load
  %10 = fpext <4 x float> %9 to <4 x double>
  %11 = fcmp uge <4 x double> %10, splat (double 1.000000e-02)
  %12 = fcmp olt <4 x double> %6, splat (double f0xB690000000000000)
  %13 = fneg <4 x float> %wide.load11
  %14 = select <4 x i1> %12, <4 x float> %13, <4 x float> %wide.load11
  %15 = fpext <4 x float> %14 to <4 x double>
  %16 = fcmp uge <4 x double> %15, splat (double 1.000000e-02)
  %17 = select <4 x i1> %11, <4 x i1> splat (i1 true), <4 x i1> %16
  %18 = fsub <4 x double> %4, %6
  %19 = fptrunc <4 x double> %18 to <4 x float>
  %20 = fcmp olt <4 x double> %18, splat (double f0xB690000000000000)
  %21 = fneg <4 x float> %19
  %22 = select <4 x i1> %20, <4 x float> %21, <4 x float> %19
  %23 = fadd <4 x double> %4, splat (double f0x3E45798EE0000000)
  %24 = fptrunc <4 x double> %23 to <4 x float>
  %25 = fcmp olt <4 x double> %23, splat (double f0xB690000000000000)
  %26 = fneg <4 x float> %24
  %27 = select <4 x i1> %25, <4 x float> %26, <4 x float> %24
  %28 = fdiv <4 x float> %22, %27
  %29 = fcmp olt <4 x float> %28, zeroinitializer
  %30 = fneg <4 x float> %28
  %31 = select <4 x i1> %29, <4 x float> %30, <4 x float> %28
  %32 = fmul <4 x float> %31, splat (float 1.000000e+02)
  %33 = fpext <4 x float> %32 to <4 x double>
  %34 = fcmp ogt <4 x double> %33, splat (double 5.000000e-02)
  %narrow = select <4 x i1> %17, <4 x i1> %34, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %35 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %36 = icmp eq i64 %index.next, 4096
  br i1 %36, label %middle.block, label %vector.body, !llvm.loop !27

middle.block:                                     ; preds = %vector.body
  %37 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %35)
  %38 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %37) #5
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

define dso_local void @_Z29__device_stub__gemver_kernel1iffPfS_S_S_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) #6 {
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  store i32 %0, ptr %9, align 4
  store float %1, ptr %10, align 4
  store float %2, ptr %11, align 4
  store ptr %3, ptr %12, align 8
  store ptr %4, ptr %13, align 8
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
  %32 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gemver_kernel1iffPfS_S_S_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %17, i64 noundef %30, ptr noundef %31)
  ret void
}

define dso_local void @_Z29__device_stub__gemver_kernel2iffPfS_S_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) #6 {
  %8 = alloca i32, align 4
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  store i32 %0, ptr %8, align 4
  store float %1, ptr %9, align 4
  store float %2, ptr %10, align 4
  store ptr %3, ptr %11, align 8
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
  %29 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gemver_kernel2iffPfS_S_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %15, i64 noundef %27, ptr noundef %28)
  ret void
}

define dso_local void @_Z29__device_stub__gemver_kernel3iffPfS_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #6 {
  %7 = alloca i32, align 4
  %8 = alloca float, align 4
  %9 = alloca float, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store i32 %0, ptr %7, align 4
  store float %1, ptr %8, align 4
  store float %2, ptr %9, align 4
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
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
  %26 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gemver_kernel3iffPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %13, i64 noundef %24, ptr noundef %25)
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

define dso_local void @_Z10gemverCudaiffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_S1_(i32 noundef %0, float noundef %1, float noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8, ptr noundef %9, ptr noundef %10, ptr noundef %11, ptr noundef %12) local_unnamed_addr #6 {
  %14 = alloca %struct.timeval, align 8
  %15 = alloca i32, align 4
  %16 = alloca float, align 4
  %17 = alloca float, align 4
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca [6 x ptr], align 16
  %22 = alloca %struct.dim3, align 8
  %23 = alloca %struct.dim3, align 8
  %24 = alloca i64, align 8
  %25 = alloca ptr, align 8
  %26 = alloca i32, align 4
  %27 = alloca float, align 4
  %28 = alloca float, align 4
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca ptr, align 8
  %33 = alloca [7 x ptr], align 16
  %34 = alloca %struct.dim3, align 8
  %35 = alloca %struct.dim3, align 8
  %36 = alloca i64, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca float, align 4
  %40 = alloca float, align 4
  %41 = alloca ptr, align 8
  %42 = alloca ptr, align 8
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = alloca ptr, align 8
  %46 = alloca [8 x ptr], align 16
  %47 = alloca %struct.dim3, align 8
  %48 = alloca %struct.dim3, align 8
  %49 = alloca i64, align 8
  %50 = alloca ptr, align 8
  %51 = alloca %struct.timeval, align 8
  %52 = alloca ptr, align 8
  %53 = alloca ptr, align 8
  %54 = alloca ptr, align 8
  %55 = alloca ptr, align 8
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca ptr, align 8
  %61 = call i32 @cudaMalloc(ptr noundef nonnull %52, i64 noundef 67108864) #5
  %62 = call i32 @cudaMalloc(ptr noundef nonnull %53, i64 noundef 16384) #5
  %63 = call i32 @cudaMalloc(ptr noundef nonnull %54, i64 noundef 16384) #5
  %64 = call i32 @cudaMalloc(ptr noundef nonnull %55, i64 noundef 16384) #5
  %65 = call i32 @cudaMalloc(ptr noundef nonnull %60, i64 noundef 16384) #5
  %66 = call i32 @cudaMalloc(ptr noundef nonnull %56, i64 noundef 16384) #5
  %67 = call i32 @cudaMalloc(ptr noundef nonnull %57, i64 noundef 16384) #5
  %68 = call i32 @cudaMalloc(ptr noundef nonnull %58, i64 noundef 16384) #5
  %69 = call i32 @cudaMalloc(ptr noundef nonnull %59, i64 noundef 16384) #5
  %70 = load ptr, ptr %52, align 8
  %71 = call i32 @cudaMemcpy(ptr noundef %70, ptr noundef %3, i64 noundef 67108864, i32 noundef 1) #5
  %72 = load ptr, ptr %53, align 8
  %73 = call i32 @cudaMemcpy(ptr noundef %72, ptr noundef %10, i64 noundef 16384, i32 noundef 1) #5
  %74 = load ptr, ptr %54, align 8
  %75 = call i32 @cudaMemcpy(ptr noundef %74, ptr noundef %11, i64 noundef 16384, i32 noundef 1) #5
  %76 = load ptr, ptr %55, align 8
  %77 = call i32 @cudaMemcpy(ptr noundef %76, ptr noundef %12, i64 noundef 16384, i32 noundef 1) #5
  %78 = load ptr, ptr %60, align 8
  %79 = call i32 @cudaMemcpy(ptr noundef %78, ptr noundef %8, i64 noundef 16384, i32 noundef 1) #5
  %80 = load ptr, ptr %56, align 8
  %81 = call i32 @cudaMemcpy(ptr noundef %80, ptr noundef %5, i64 noundef 16384, i32 noundef 1) #5
  %82 = load ptr, ptr %57, align 8
  %83 = call i32 @cudaMemcpy(ptr noundef %82, ptr noundef %7, i64 noundef 16384, i32 noundef 1) #5
  %84 = load ptr, ptr %58, align 8
  %85 = call i32 @cudaMemcpy(ptr noundef %84, ptr noundef %4, i64 noundef 16384, i32 noundef 1) #5
  %86 = load ptr, ptr %59, align 8
  %87 = call i32 @cudaMemcpy(ptr noundef %86, ptr noundef %6, i64 noundef 16384, i32 noundef 1) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %51)
  %88 = call i32 @gettimeofday(ptr noundef nonnull %51, ptr noundef null) #14
  %.not.i.i = icmp eq i32 %88, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %89

89:                                               ; preds = %13
  %90 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %88) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %13, %89
  %91 = load i64, ptr %51, align 8
  %92 = sitofp i64 %91 to double
  %93 = getelementptr inbounds nuw i8, ptr %51, i64 8
  %94 = load i64, ptr %93, align 8
  %95 = sitofp i64 %94 to double
  %96 = fmul nnan double %95, f0x3EB0C6F7A0B5ED8D
  %97 = fadd double %96, %92
  call void @llvm.lifetime.end.p0(ptr nonnull %51)
  store double %97, ptr @polybench_t_start, align 8
  %98 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 128, i32 512, i32 1 }, %struct.dim3 { i32 32, i32 8, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %98, 0
  br i1 %.not, label %99, label %116

99:                                               ; preds = %_Z21polybench_timer_startv.exit
  %100 = load ptr, ptr %52, align 8
  %101 = load ptr, ptr %56, align 8
  %102 = load ptr, ptr %57, align 8
  %103 = load ptr, ptr %58, align 8
  %104 = load ptr, ptr %59, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %38)
  call void @llvm.lifetime.start.p0(ptr nonnull %39)
  call void @llvm.lifetime.start.p0(ptr nonnull %40)
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
  store i32 %0, ptr %38, align 4
  store float %1, ptr %39, align 4
  store float %2, ptr %40, align 4
  store ptr %100, ptr %41, align 8
  store ptr %101, ptr %42, align 8
  store ptr %102, ptr %43, align 8
  store ptr %103, ptr %44, align 8
  store ptr %104, ptr %45, align 8
  store ptr %38, ptr %46, align 16
  %105 = getelementptr inbounds nuw i8, ptr %46, i64 8
  store ptr %39, ptr %105, align 8
  %106 = getelementptr inbounds nuw i8, ptr %46, i64 16
  store ptr %40, ptr %106, align 16
  %107 = getelementptr inbounds nuw i8, ptr %46, i64 24
  store ptr %41, ptr %107, align 8
  %108 = getelementptr inbounds nuw i8, ptr %46, i64 32
  store ptr %42, ptr %108, align 16
  %109 = getelementptr inbounds nuw i8, ptr %46, i64 40
  store ptr %43, ptr %109, align 8
  %110 = getelementptr inbounds nuw i8, ptr %46, i64 48
  store ptr %44, ptr %110, align 16
  %111 = getelementptr inbounds nuw i8, ptr %46, i64 56
  store ptr %45, ptr %111, align 8
  %112 = call i32 @__cudaPopCallConfiguration(ptr nonnull %47, ptr nonnull %48, ptr nonnull %49, ptr nonnull %50), !inline_history !28
  %113 = load i64, ptr %49, align 8
  %114 = load ptr, ptr %50, align 8
  %.fca.0.load2.i = load i32, ptr %47, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %47, i64 4
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %47, i64 8
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %48, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %48, i64 4
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %48, i64 8
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %115 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gemver_kernel1iffPfS_S_S_S_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %46, i64 noundef %113, ptr noundef %114), !inline_history !28
  call void @llvm.lifetime.end.p0(ptr nonnull %38)
  call void @llvm.lifetime.end.p0(ptr nonnull %39)
  call void @llvm.lifetime.end.p0(ptr nonnull %40)
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
  br label %116

116:                                              ; preds = %_Z21polybench_timer_startv.exit, %99
  %117 = call i32 @cudaThreadSynchronize() #5
  %118 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 16, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not48 = icmp eq i32 %118, 0
  br i1 %.not48, label %119, label %134

119:                                              ; preds = %116
  %120 = load ptr, ptr %52, align 8
  %121 = load ptr, ptr %53, align 8
  %122 = load ptr, ptr %54, align 8
  %123 = load ptr, ptr %55, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %26)
  call void @llvm.lifetime.start.p0(ptr nonnull %27)
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
  store i32 %0, ptr %26, align 4
  store float %1, ptr %27, align 4
  store float %2, ptr %28, align 4
  store ptr %120, ptr %29, align 8
  store ptr %121, ptr %30, align 8
  store ptr %122, ptr %31, align 8
  store ptr %123, ptr %32, align 8
  store ptr %26, ptr %33, align 16
  %124 = getelementptr inbounds nuw i8, ptr %33, i64 8
  store ptr %27, ptr %124, align 8
  %125 = getelementptr inbounds nuw i8, ptr %33, i64 16
  store ptr %28, ptr %125, align 16
  %126 = getelementptr inbounds nuw i8, ptr %33, i64 24
  store ptr %29, ptr %126, align 8
  %127 = getelementptr inbounds nuw i8, ptr %33, i64 32
  store ptr %30, ptr %127, align 16
  %128 = getelementptr inbounds nuw i8, ptr %33, i64 40
  store ptr %31, ptr %128, align 8
  %129 = getelementptr inbounds nuw i8, ptr %33, i64 48
  store ptr %32, ptr %129, align 16
  %130 = call i32 @__cudaPopCallConfiguration(ptr nonnull %34, ptr nonnull %35, ptr nonnull %36, ptr nonnull %37), !inline_history !29
  %131 = load i64, ptr %36, align 8
  %132 = load ptr, ptr %37, align 8
  %.fca.0.load2.i50 = load i32, ptr %34, align 8
  %.fca.0.insert3.i51 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i50, 0
  %.fca.1.gep4.i52 = getelementptr inbounds nuw i8, ptr %34, i64 4
  %.fca.1.load5.i53 = load i32, ptr %.fca.1.gep4.i52, align 4
  %.fca.1.insert6.i54 = insertvalue %struct.dim3 %.fca.0.insert3.i51, i32 %.fca.1.load5.i53, 1
  %.fca.2.gep7.i55 = getelementptr inbounds nuw i8, ptr %34, i64 8
  %.fca.2.load8.i56 = load i32, ptr %.fca.2.gep7.i55, align 8
  %.fca.2.insert9.i57 = insertvalue %struct.dim3 %.fca.1.insert6.i54, i32 %.fca.2.load8.i56, 2
  %.fca.0.load.i58 = load i32, ptr %35, align 8
  %.fca.0.insert.i59 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i58, 0
  %.fca.1.gep.i60 = getelementptr inbounds nuw i8, ptr %35, i64 4
  %.fca.1.load.i61 = load i32, ptr %.fca.1.gep.i60, align 4
  %.fca.1.insert.i62 = insertvalue %struct.dim3 %.fca.0.insert.i59, i32 %.fca.1.load.i61, 1
  %.fca.2.gep.i63 = getelementptr inbounds nuw i8, ptr %35, i64 8
  %.fca.2.load.i64 = load i32, ptr %.fca.2.gep.i63, align 8
  %.fca.2.insert.i65 = insertvalue %struct.dim3 %.fca.1.insert.i62, i32 %.fca.2.load.i64, 2
  %133 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gemver_kernel2iffPfS_S_S_, %struct.dim3 %.fca.2.insert9.i57, %struct.dim3 %.fca.2.insert.i65, ptr noundef nonnull %33, i64 noundef %131, ptr noundef %132), !inline_history !29
  call void @llvm.lifetime.end.p0(ptr nonnull %26)
  call void @llvm.lifetime.end.p0(ptr nonnull %27)
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
  br label %134

134:                                              ; preds = %116, %119
  %135 = call i32 @cudaThreadSynchronize() #5
  %136 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 16, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not49 = icmp eq i32 %136, 0
  br i1 %.not49, label %137, label %150

137:                                              ; preds = %134
  %138 = load ptr, ptr %52, align 8
  %139 = load ptr, ptr %53, align 8
  %140 = load ptr, ptr %60, align 8
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
  store i32 %0, ptr %15, align 4
  store float %1, ptr %16, align 4
  store float %2, ptr %17, align 4
  store ptr %138, ptr %18, align 8
  store ptr %139, ptr %19, align 8
  store ptr %140, ptr %20, align 8
  store ptr %15, ptr %21, align 16
  %141 = getelementptr inbounds nuw i8, ptr %21, i64 8
  store ptr %16, ptr %141, align 8
  %142 = getelementptr inbounds nuw i8, ptr %21, i64 16
  store ptr %17, ptr %142, align 16
  %143 = getelementptr inbounds nuw i8, ptr %21, i64 24
  store ptr %18, ptr %143, align 8
  %144 = getelementptr inbounds nuw i8, ptr %21, i64 32
  store ptr %19, ptr %144, align 16
  %145 = getelementptr inbounds nuw i8, ptr %21, i64 40
  store ptr %20, ptr %145, align 8
  %146 = call i32 @__cudaPopCallConfiguration(ptr nonnull %22, ptr nonnull %23, ptr nonnull %24, ptr nonnull %25), !inline_history !30
  %147 = load i64, ptr %24, align 8
  %148 = load ptr, ptr %25, align 8
  %.fca.0.load2.i66 = load i32, ptr %22, align 8
  %.fca.0.insert3.i67 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i66, 0
  %.fca.1.gep4.i68 = getelementptr inbounds nuw i8, ptr %22, i64 4
  %.fca.1.load5.i69 = load i32, ptr %.fca.1.gep4.i68, align 4
  %.fca.1.insert6.i70 = insertvalue %struct.dim3 %.fca.0.insert3.i67, i32 %.fca.1.load5.i69, 1
  %.fca.2.gep7.i71 = getelementptr inbounds nuw i8, ptr %22, i64 8
  %.fca.2.load8.i72 = load i32, ptr %.fca.2.gep7.i71, align 8
  %.fca.2.insert9.i73 = insertvalue %struct.dim3 %.fca.1.insert6.i70, i32 %.fca.2.load8.i72, 2
  %.fca.0.load.i74 = load i32, ptr %23, align 8
  %.fca.0.insert.i75 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i74, 0
  %.fca.1.gep.i76 = getelementptr inbounds nuw i8, ptr %23, i64 4
  %.fca.1.load.i77 = load i32, ptr %.fca.1.gep.i76, align 4
  %.fca.1.insert.i78 = insertvalue %struct.dim3 %.fca.0.insert.i75, i32 %.fca.1.load.i77, 1
  %.fca.2.gep.i79 = getelementptr inbounds nuw i8, ptr %23, i64 8
  %.fca.2.load.i80 = load i32, ptr %.fca.2.gep.i79, align 8
  %.fca.2.insert.i81 = insertvalue %struct.dim3 %.fca.1.insert.i78, i32 %.fca.2.load.i80, 2
  %149 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z29__device_stub__gemver_kernel3iffPfS_S_, %struct.dim3 %.fca.2.insert9.i73, %struct.dim3 %.fca.2.insert.i81, ptr noundef nonnull %21, i64 noundef %147, ptr noundef %148), !inline_history !30
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
  br label %150

150:                                              ; preds = %134, %137
  %151 = call i32 @cudaThreadSynchronize() #5
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  %152 = call i32 @gettimeofday(ptr noundef nonnull %14, ptr noundef null) #14
  %.not.i.i82 = icmp eq i32 %152, 0
  br i1 %.not.i.i82, label %_Z20polybench_timer_stopv.exit, label %153

153:                                              ; preds = %150
  %154 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %152) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %150, %153
  %155 = load i64, ptr %14, align 8
  %156 = sitofp i64 %155 to double
  %157 = getelementptr inbounds nuw i8, ptr %14, i64 8
  %158 = load i64, ptr %157, align 8
  %159 = sitofp i64 %158 to double
  %160 = fmul nnan double %159, f0x3EB0C6F7A0B5ED8D
  %161 = fadd double %160, %156
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  store double %161, ptr @polybench_t_end, align 8
  %162 = load double, ptr @polybench_t_start, align 8
  %163 = fsub double %161, %162
  %164 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %163) #5
  %165 = load ptr, ptr %60, align 8
  %166 = call i32 @cudaMemcpy(ptr noundef %9, ptr noundef %165, i64 noundef 16384, i32 noundef 2) #5
  %167 = load ptr, ptr %52, align 8
  %168 = call i32 @cudaFree(ptr noundef %167) #5
  %169 = load ptr, ptr %53, align 8
  %170 = call i32 @cudaFree(ptr noundef %169) #5
  %171 = load ptr, ptr %54, align 8
  %172 = call i32 @cudaFree(ptr noundef %171) #5
  %173 = load ptr, ptr %55, align 8
  %174 = call i32 @cudaFree(ptr noundef %173) #5
  %175 = load ptr, ptr %60, align 8
  %176 = call i32 @cudaFree(ptr noundef %175) #5
  %177 = load ptr, ptr %56, align 8
  %178 = call i32 @cudaFree(ptr noundef %177) #5
  %179 = load ptr, ptr %57, align 8
  %180 = call i32 @cudaFree(ptr noundef %179) #5
  %181 = load ptr, ptr %58, align 8
  %182 = call i32 @cudaFree(ptr noundef %181) #5
  %183 = load ptr, ptr %59, align 8
  %184 = call i32 @cudaFree(ptr noundef %183) #5
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
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %15)
  store ptr null, ptr %15, align 8
  %16 = call i32 @posix_memalign(ptr noundef nonnull %15, i64 noundef 32, i64 noundef 67108864) #14
  %17 = load ptr, ptr %15, align 8
  %.not.i.i = icmp eq ptr %17, null
  %18 = icmp ne i32 %16, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %18
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %19 = load ptr, ptr @stderr, align 8
  %20 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %19) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %15)
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  store ptr null, ptr %14, align 8
  %21 = call i32 @posix_memalign(ptr noundef nonnull %14, i64 noundef 32, i64 noundef 16384) #14
  %22 = load ptr, ptr %14, align 8
  %.not.i.i44 = icmp eq ptr %22, null
  %23 = icmp ne i32 %21, 0
  %or.cond.i.i45 = select i1 %.not.i.i44, i1 true, i1 %23
  br i1 %or.cond.i.i45, label %.critedge.i.i46, label %_Z20polybench_alloc_datayi.exit47

.critedge.i.i46:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %24 = load ptr, ptr @stderr, align 8
  %25 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %24) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit47:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  call void @llvm.lifetime.start.p0(ptr nonnull %13)
  store ptr null, ptr %13, align 8
  %26 = call i32 @posix_memalign(ptr noundef nonnull %13, i64 noundef 32, i64 noundef 16384) #14
  %27 = load ptr, ptr %13, align 8
  %.not.i.i48 = icmp eq ptr %27, null
  %28 = icmp ne i32 %26, 0
  %or.cond.i.i49 = select i1 %.not.i.i48, i1 true, i1 %28
  br i1 %or.cond.i.i49, label %.critedge.i.i50, label %_Z20polybench_alloc_datayi.exit51

.critedge.i.i50:                                  ; preds = %_Z20polybench_alloc_datayi.exit47
  %29 = load ptr, ptr @stderr, align 8
  %30 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %29) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit51:                ; preds = %_Z20polybench_alloc_datayi.exit47
  call void @llvm.lifetime.end.p0(ptr nonnull %13)
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  store ptr null, ptr %12, align 8
  %31 = call i32 @posix_memalign(ptr noundef nonnull %12, i64 noundef 32, i64 noundef 16384) #14
  %32 = load ptr, ptr %12, align 8
  %.not.i.i52 = icmp eq ptr %32, null
  %33 = icmp ne i32 %31, 0
  %or.cond.i.i53 = select i1 %.not.i.i52, i1 true, i1 %33
  br i1 %or.cond.i.i53, label %.critedge.i.i54, label %_Z20polybench_alloc_datayi.exit55

.critedge.i.i54:                                  ; preds = %_Z20polybench_alloc_datayi.exit51
  %34 = load ptr, ptr @stderr, align 8
  %35 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %34) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit55:                ; preds = %_Z20polybench_alloc_datayi.exit51
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  call void @llvm.lifetime.start.p0(ptr nonnull %11)
  store ptr null, ptr %11, align 8
  %36 = call i32 @posix_memalign(ptr noundef nonnull %11, i64 noundef 32, i64 noundef 16384) #14
  %37 = load ptr, ptr %11, align 8
  %.not.i.i56 = icmp eq ptr %37, null
  %38 = icmp ne i32 %36, 0
  %or.cond.i.i57 = select i1 %.not.i.i56, i1 true, i1 %38
  br i1 %or.cond.i.i57, label %.critedge.i.i58, label %_Z20polybench_alloc_datayi.exit59

.critedge.i.i58:                                  ; preds = %_Z20polybench_alloc_datayi.exit55
  %39 = load ptr, ptr @stderr, align 8
  %40 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %39) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit59:                ; preds = %_Z20polybench_alloc_datayi.exit55
  call void @llvm.lifetime.end.p0(ptr nonnull %11)
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  store ptr null, ptr %10, align 8
  %41 = call i32 @posix_memalign(ptr noundef nonnull %10, i64 noundef 32, i64 noundef 16384) #14
  %42 = load ptr, ptr %10, align 8
  %.not.i.i60 = icmp eq ptr %42, null
  %43 = icmp ne i32 %41, 0
  %or.cond.i.i61 = select i1 %.not.i.i60, i1 true, i1 %43
  br i1 %or.cond.i.i61, label %.critedge.i.i62, label %_Z20polybench_alloc_datayi.exit63

.critedge.i.i62:                                  ; preds = %_Z20polybench_alloc_datayi.exit59
  %44 = load ptr, ptr @stderr, align 8
  %45 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %44) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit63:                ; preds = %_Z20polybench_alloc_datayi.exit59
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  store ptr null, ptr %9, align 8
  %46 = call i32 @posix_memalign(ptr noundef nonnull %9, i64 noundef 32, i64 noundef 16384) #14
  %47 = load ptr, ptr %9, align 8
  %.not.i.i64 = icmp eq ptr %47, null
  %48 = icmp ne i32 %46, 0
  %or.cond.i.i65 = select i1 %.not.i.i64, i1 true, i1 %48
  br i1 %or.cond.i.i65, label %.critedge.i.i66, label %_Z20polybench_alloc_datayi.exit67

.critedge.i.i66:                                  ; preds = %_Z20polybench_alloc_datayi.exit63
  %49 = load ptr, ptr @stderr, align 8
  %50 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %49) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit67:                ; preds = %_Z20polybench_alloc_datayi.exit63
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %51 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 16384) #14
  %52 = load ptr, ptr %8, align 8
  %.not.i.i68 = icmp eq ptr %52, null
  %53 = icmp ne i32 %51, 0
  %or.cond.i.i69 = select i1 %.not.i.i68, i1 true, i1 %53
  br i1 %or.cond.i.i69, label %.critedge.i.i70, label %_Z20polybench_alloc_datayi.exit71

.critedge.i.i70:                                  ; preds = %_Z20polybench_alloc_datayi.exit67
  %54 = load ptr, ptr @stderr, align 8
  %55 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %54) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit71:                ; preds = %_Z20polybench_alloc_datayi.exit67
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %56 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 16384) #14
  %57 = load ptr, ptr %7, align 8
  %.not.i.i72 = icmp eq ptr %57, null
  %58 = icmp ne i32 %56, 0
  %or.cond.i.i73 = select i1 %.not.i.i72, i1 true, i1 %58
  br i1 %or.cond.i.i73, label %.critedge.i.i74, label %_Z20polybench_alloc_datayi.exit75

.critedge.i.i74:                                  ; preds = %_Z20polybench_alloc_datayi.exit71
  %59 = load ptr, ptr @stderr, align 8
  %60 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %59) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit75:                ; preds = %_Z20polybench_alloc_datayi.exit71
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %61 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 16384) #14
  %62 = load ptr, ptr %6, align 8
  %.not.i.i76 = icmp eq ptr %62, null
  %63 = icmp ne i32 %61, 0
  %or.cond.i.i77 = select i1 %.not.i.i76, i1 true, i1 %63
  br i1 %or.cond.i.i77, label %.critedge.i.i78, label %_Z20polybench_alloc_datayi.exit79

.critedge.i.i78:                                  ; preds = %_Z20polybench_alloc_datayi.exit75
  %64 = load ptr, ptr @stderr, align 8
  %65 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %64) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit79:                ; preds = %_Z20polybench_alloc_datayi.exit75
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  br label %vector.ph

vector.ph:                                        ; preds = %middle.block, %_Z20polybench_alloc_datayi.exit79
  %indvars.iv36.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit79 ], [ %indvars.iv.next37.i, %middle.block ]
  %66 = trunc nuw nsw i64 %indvars.iv36.i to i32
  %67 = uitofp nneg i32 %66 to float
  %68 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv36.i
  store float %67, ptr %68, align 4
  %indvars.iv.next37.i = add nuw nsw i64 %indvars.iv36.i, 1
  %69 = trunc nuw nsw i64 %indvars.iv.next37.i to i32
  %70 = lshr i32 %69, 12
  %71 = uitofp nneg i32 %70 to float
  %72 = fmul nnan float %71, 5.000000e-01
  %73 = getelementptr [4 x i8], ptr %32, i64 %indvars.iv36.i
  store float %72, ptr %73, align 4
  %74 = fmul nnan float %71, 2.500000e-01
  %75 = getelementptr [4 x i8], ptr %27, i64 %indvars.iv36.i
  store float %74, ptr %75, align 4
  %76 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv36.i
  %77 = fmul nnan float %71, 1.250000e-01
  %78 = getelementptr [4 x i8], ptr %57, i64 %indvars.iv36.i
  %79 = insertelement <2 x float> poison, float %71, i64 0
  %80 = shufflevector <2 x float> %79, <2 x float> poison, <2 x i32> zeroinitializer
  %81 = fdiv <2 x float> %80, <float 6.000000e+00, float 9.000000e+00>
  %82 = extractelement <2 x float> %81, i64 0
  store float %82, ptr %76, align 4
  store float %77, ptr %78, align 4
  %83 = getelementptr [4 x i8], ptr %62, i64 %indvars.iv36.i
  %84 = extractelement <2 x float> %81, i64 1
  store float %84, ptr %83, align 4
  %85 = getelementptr [4 x i8], ptr %52, i64 %indvars.iv36.i
  store float 0.000000e+00, ptr %85, align 4
  %86 = getelementptr [4 x i8], ptr %42, i64 %indvars.iv36.i
  store float 0.000000e+00, ptr %86, align 4
  %87 = getelementptr [16384 x i8], ptr %17, i64 %indvars.iv36.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %67, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %88 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %89 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %90 = fmul nnan <4 x float> %broadcast.splat, %88
  %91 = fmul nnan <4 x float> %broadcast.splat, %89
  %92 = fmul nnan <4 x float> %90, splat (float f0x39800000)
  %93 = fmul nnan <4 x float> %91, splat (float f0x39800000)
  %94 = getelementptr [4 x i8], ptr %87, i64 %index
  %95 = getelementptr i8, ptr %94, i64 16
  store <4 x float> %92, ptr %94, align 4
  store <4 x float> %93, ptr %95, align 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %96 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %97 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %98 = fmul nnan <4 x float> %broadcast.splat, %96
  %99 = fmul nnan <4 x float> %broadcast.splat, %97
  %100 = fmul nnan <4 x float> %98, splat (float f0x39800000)
  %101 = fmul nnan <4 x float> %99, splat (float f0x39800000)
  %102 = getelementptr [4 x i8], ptr %87, i64 %index
  %103 = getelementptr i8, ptr %102, i64 32
  %104 = getelementptr i8, ptr %102, i64 48
  store <4 x float> %100, ptr %103, align 4
  store <4 x float> %101, ptr %104, align 4
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %105 = icmp eq i64 %index.next.1, 4096
  br i1 %105, label %middle.block, label %vector.body, !llvm.loop !31

middle.block:                                     ; preds = %vector.body
  %exitcond39.not.i = icmp eq i64 %indvars.iv.next37.i, 4096
  br i1 %exitcond39.not.i, label %_Z4initiPfS_PA4096_fS_S_S_S_S_S_S_S_.exit, label %vector.ph

_Z4initiPfS_PA4096_fS_S_S_S_S_S_S_S_.exit:        ; preds = %middle.block
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  %106 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %5, i32 noundef 0) #5
  %107 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %5) #5
  %108 = call i32 @cudaSetDevice(i32 noundef 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  call void @_Z10gemverCudaiffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_S1_(i32 noundef 4096, float noundef 4.353200e+04, float noundef 1.231300e+04, ptr noundef nonnull %17, ptr noundef nonnull %22, ptr noundef nonnull %27, ptr noundef nonnull %32, ptr noundef nonnull %37, ptr noundef nonnull %42, ptr noundef %47, ptr noundef nonnull %52, ptr noundef nonnull %57, ptr noundef nonnull %62) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %109 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #14
  %.not.i.i80 = icmp eq i32 %109, 0
  br i1 %.not.i.i80, label %_Z21polybench_timer_startv.exit, label %110

110:                                              ; preds = %_Z4initiPfS_PA4096_fS_S_S_S_S_S_S_S_.exit
  %111 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %109) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z4initiPfS_PA4096_fS_S_S_S_S_S_S_S_.exit, %110
  %112 = load i64, ptr %4, align 8
  %113 = sitofp i64 %112 to double
  %114 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %115 = load i64, ptr %114, align 8
  %116 = sitofp i64 %115 to double
  %117 = fmul nnan double %116, f0x3EB0C6F7A0B5ED8D
  %118 = fadd double %117, %113
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %118, ptr @polybench_t_start, align 8
  %scevgep = getelementptr i8, ptr %17, i64 67108864
  %119 = insertelement <4 x ptr> poison, ptr %22, i64 0
  %120 = insertelement <4 x ptr> %119, ptr %27, i64 1
  %121 = insertelement <4 x ptr> %120, ptr %32, i64 2
  %122 = insertelement <4 x ptr> %121, ptr %37, i64 3
  %123 = getelementptr i8, <4 x ptr> %122, i64 16384
  %124 = insertelement <4 x ptr> poison, ptr %17, i64 0
  %125 = shufflevector <4 x ptr> %124, <4 x ptr> poison, <4 x i32> zeroinitializer
  %126 = insertelement <4 x ptr> poison, ptr %scevgep, i64 0
  %127 = shufflevector <4 x ptr> %126, <4 x ptr> poison, <4 x i32> zeroinitializer
  %128 = icmp ult <4 x ptr> %125, %123
  %129 = icmp ult <4 x ptr> %122, %127
  %130 = and <4 x i1> %128, %129
  %131 = bitcast <4 x i1> %130 to i4
  %.not = icmp eq i4 %131, 0
  br label %.preheader69.i

.preheader69.i:                                   ; preds = %._crit_edge.i, %_Z21polybench_timer_startv.exit
  %indvars.iv83.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next84.i, %._crit_edge.i ]
  %132 = getelementptr [16384 x i8], ptr %17, i64 %indvars.iv83.i
  %133 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv83.i
  %134 = getelementptr [4 x i8], ptr %32, i64 %indvars.iv83.i
  br i1 %.not, label %vector.ph118, label %scalar.ph

vector.ph118:                                     ; preds = %.preheader69.i
  %135 = load float, ptr %133, align 4, !alias.scope !32
  %broadcast.splatinsert124 = insertelement <4 x float> poison, float %135, i64 0
  %broadcast.splat125 = shufflevector <4 x float> %broadcast.splatinsert124, <4 x float> poison, <4 x i32> zeroinitializer
  %136 = load float, ptr %134, align 4, !alias.scope !35
  %broadcast.splatinsert128 = insertelement <4 x float> poison, float %136, i64 0
  %broadcast.splat129 = shufflevector <4 x float> %broadcast.splatinsert128, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body119

vector.body119:                                   ; preds = %vector.body119, %vector.ph118
  %index120 = phi i64 [ 0, %vector.ph118 ], [ %index.next130, %vector.body119 ]
  %137 = getelementptr [4 x i8], ptr %132, i64 %index120
  %138 = getelementptr i8, ptr %137, i64 16
  %wide.load = load <4 x float>, ptr %137, align 4, !alias.scope !37, !noalias !39
  %wide.load121 = load <4 x float>, ptr %138, align 4, !alias.scope !37, !noalias !39
  %139 = getelementptr [4 x i8], ptr %27, i64 %index120
  %140 = getelementptr i8, ptr %139, i64 16
  %wide.load122 = load <4 x float>, ptr %139, align 4, !alias.scope !42
  %wide.load123 = load <4 x float>, ptr %140, align 4, !alias.scope !42
  %141 = fmul <4 x float> %broadcast.splat125, %wide.load122
  %142 = fmul <4 x float> %broadcast.splat125, %wide.load123
  %143 = fadd <4 x float> %wide.load, %141
  %144 = fadd <4 x float> %wide.load121, %142
  %145 = getelementptr [4 x i8], ptr %37, i64 %index120
  %146 = getelementptr i8, ptr %145, i64 16
  %wide.load126 = load <4 x float>, ptr %145, align 4, !alias.scope !43
  %wide.load127 = load <4 x float>, ptr %146, align 4, !alias.scope !43
  %147 = fmul <4 x float> %broadcast.splat129, %wide.load126
  %148 = fmul <4 x float> %broadcast.splat129, %wide.load127
  %149 = fadd <4 x float> %143, %147
  %150 = fadd <4 x float> %144, %148
  store <4 x float> %149, ptr %137, align 4, !alias.scope !37, !noalias !39
  store <4 x float> %150, ptr %138, align 4, !alias.scope !37, !noalias !39
  %index.next130 = add nuw i64 %index120, 8
  %151 = icmp eq i64 %index.next130, 4096
  br i1 %151, label %._crit_edge.i, label %vector.body119, !llvm.loop !44

scalar.ph:                                        ; preds = %.preheader69.i, %scalar.ph
  %indvars.iv.i81 = phi i64 [ %indvars.iv.next.i82.1, %scalar.ph ], [ 0, %.preheader69.i ]
  %152 = getelementptr [4 x i8], ptr %132, i64 %indvars.iv.i81
  %153 = load float, ptr %152, align 4
  %154 = load float, ptr %133, align 4
  %155 = getelementptr [4 x i8], ptr %27, i64 %indvars.iv.i81
  %156 = load float, ptr %155, align 4
  %157 = fmul float %154, %156
  %158 = fadd float %153, %157
  %159 = load float, ptr %134, align 4
  %160 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv.i81
  %161 = load float, ptr %160, align 4
  %162 = fmul float %159, %161
  %163 = fadd float %158, %162
  store float %163, ptr %152, align 4
  %indvars.iv.next.i82 = or disjoint i64 %indvars.iv.i81, 1
  %164 = getelementptr [4 x i8], ptr %132, i64 %indvars.iv.next.i82
  %165 = load float, ptr %164, align 4
  %166 = load float, ptr %133, align 4
  %167 = getelementptr [4 x i8], ptr %27, i64 %indvars.iv.next.i82
  %168 = load float, ptr %167, align 4
  %169 = fmul float %166, %168
  %170 = fadd float %165, %169
  %171 = load float, ptr %134, align 4
  %172 = getelementptr [4 x i8], ptr %37, i64 %indvars.iv.next.i82
  %173 = load float, ptr %172, align 4
  %174 = fmul float %171, %173
  %175 = fadd float %170, %174
  store float %175, ptr %164, align 4
  %indvars.iv.next.i82.1 = add nuw nsw i64 %indvars.iv.i81, 2
  %exitcond.not.i83.1 = icmp eq i64 %indvars.iv.next.i82.1, 4096
  br i1 %exitcond.not.i83.1, label %._crit_edge.i, label %scalar.ph, !llvm.loop !45

._crit_edge.i:                                    ; preds = %vector.body119, %scalar.ph
  %indvars.iv.next84.i = add nuw nsw i64 %indvars.iv83.i, 1
  %exitcond87.not.i = icmp eq i64 %indvars.iv.next84.i, 4096
  br i1 %exitcond87.not.i, label %.preheader67.i, label %.preheader69.i

.preheader67.i:                                   ; preds = %._crit_edge.i, %._crit_edge73.i
  %indvars.iv93.i = phi i64 [ %indvars.iv.next94.i, %._crit_edge73.i ], [ 0, %._crit_edge.i ]
  %176 = getelementptr [4 x i8], ptr %52, i64 %indvars.iv93.i
  %invariant.gep.i = getelementptr [4 x i8], ptr %17, i64 %indvars.iv93.i
  %.promoted.i = load float, ptr %176, align 4
  br label %177

177:                                              ; preds = %177, %.preheader67.i
  %indvars.iv88.i = phi i64 [ 0, %.preheader67.i ], [ %indvars.iv.next89.i.1, %177 ]
  %178 = phi float [ %.promoted.i, %.preheader67.i ], [ %190, %177 ]
  %gep.i = getelementptr [16384 x i8], ptr %invariant.gep.i, i64 %indvars.iv88.i
  %179 = load float, ptr %gep.i, align 4
  %180 = fmul float %179, 1.231300e+04
  %181 = getelementptr [4 x i8], ptr %57, i64 %indvars.iv88.i
  %182 = load float, ptr %181, align 4
  %183 = fmul float %180, %182
  %184 = fadd float %178, %183
  store float %184, ptr %176, align 4
  %indvars.iv.next89.i = or disjoint i64 %indvars.iv88.i, 1
  %gep.i.1 = getelementptr [16384 x i8], ptr %invariant.gep.i, i64 %indvars.iv.next89.i
  %185 = load float, ptr %gep.i.1, align 4
  %186 = fmul float %185, 1.231300e+04
  %187 = getelementptr [4 x i8], ptr %57, i64 %indvars.iv.next89.i
  %188 = load float, ptr %187, align 4
  %189 = fmul float %186, %188
  %190 = fadd float %184, %189
  store float %190, ptr %176, align 4
  %indvars.iv.next89.i.1 = add nuw nsw i64 %indvars.iv88.i, 2
  %exitcond92.not.i.1 = icmp eq i64 %indvars.iv.next89.i.1, 4096
  br i1 %exitcond92.not.i.1, label %._crit_edge73.i, label %177

._crit_edge73.i:                                  ; preds = %177
  %indvars.iv.next94.i = add nuw nsw i64 %indvars.iv93.i, 1
  %exitcond97.not.i = icmp eq i64 %indvars.iv.next94.i, 4096
  br i1 %exitcond97.not.i, label %vector.memcheck132, label %.preheader67.i

vector.memcheck132:                               ; preds = %._crit_edge73.i
  %scevgep133 = getelementptr i8, ptr %52, i64 16384
  %scevgep134 = getelementptr i8, ptr %62, i64 16384
  %bound0135 = icmp ult ptr %52, %scevgep134
  %bound1136 = icmp ult ptr %62, %scevgep133
  %found.conflict137 = and i1 %bound0135, %bound1136
  br i1 %found.conflict137, label %.lr.ph.i, label %vector.body140

vector.body140:                                   ; preds = %vector.memcheck132, %vector.body140
  %index141 = phi i64 [ %index.next146.1, %vector.body140 ], [ 0, %vector.memcheck132 ]
  %191 = getelementptr [4 x i8], ptr %52, i64 %index141
  %192 = getelementptr i8, ptr %191, i64 16
  %wide.load142 = load <4 x float>, ptr %191, align 4, !alias.scope !46, !noalias !49
  %wide.load143 = load <4 x float>, ptr %192, align 4, !alias.scope !46, !noalias !49
  %193 = getelementptr [4 x i8], ptr %62, i64 %index141
  %194 = getelementptr i8, ptr %193, i64 16
  %wide.load144 = load <4 x float>, ptr %193, align 4, !alias.scope !49
  %wide.load145 = load <4 x float>, ptr %194, align 4, !alias.scope !49
  %195 = fadd <4 x float> %wide.load142, %wide.load144
  %196 = fadd <4 x float> %wide.load143, %wide.load145
  store <4 x float> %195, ptr %191, align 4, !alias.scope !46, !noalias !49
  store <4 x float> %196, ptr %192, align 4, !alias.scope !46, !noalias !49
  %index.next146 = or disjoint i64 %index141, 8
  %197 = getelementptr [4 x i8], ptr %52, i64 %index.next146
  %198 = getelementptr i8, ptr %197, i64 16
  %wide.load142.1 = load <4 x float>, ptr %197, align 4, !alias.scope !46, !noalias !49
  %wide.load143.1 = load <4 x float>, ptr %198, align 4, !alias.scope !46, !noalias !49
  %199 = getelementptr [4 x i8], ptr %62, i64 %index.next146
  %200 = getelementptr i8, ptr %199, i64 16
  %wide.load144.1 = load <4 x float>, ptr %199, align 4, !alias.scope !49
  %wide.load145.1 = load <4 x float>, ptr %200, align 4, !alias.scope !49
  %201 = fadd <4 x float> %wide.load142.1, %wide.load144.1
  %202 = fadd <4 x float> %wide.load143.1, %wide.load145.1
  store <4 x float> %201, ptr %197, align 4, !alias.scope !46, !noalias !49
  store <4 x float> %202, ptr %198, align 4, !alias.scope !46, !noalias !49
  %index.next146.1 = add nuw nsw i64 %index141, 16
  %203 = icmp eq i64 %index.next146.1, 4096
  br i1 %203, label %.preheader.i.preheader, label %vector.body140, !llvm.loop !51

.lr.ph.i:                                         ; preds = %vector.memcheck132, %.lr.ph.i
  %indvars.iv98.i = phi i64 [ %indvars.iv.next99.i.3, %.lr.ph.i ], [ 0, %vector.memcheck132 ]
  %204 = getelementptr [4 x i8], ptr %52, i64 %indvars.iv98.i
  %205 = load float, ptr %204, align 4
  %206 = getelementptr [4 x i8], ptr %62, i64 %indvars.iv98.i
  %207 = load float, ptr %206, align 4
  %208 = fadd float %205, %207
  store float %208, ptr %204, align 4
  %indvars.iv.next99.i = or disjoint i64 %indvars.iv98.i, 1
  %209 = getelementptr [4 x i8], ptr %52, i64 %indvars.iv.next99.i
  %210 = load float, ptr %209, align 4
  %211 = getelementptr [4 x i8], ptr %62, i64 %indvars.iv.next99.i
  %212 = load float, ptr %211, align 4
  %213 = fadd float %210, %212
  store float %213, ptr %209, align 4
  %indvars.iv.next99.i.1 = or disjoint i64 %indvars.iv98.i, 2
  %214 = getelementptr [4 x i8], ptr %52, i64 %indvars.iv.next99.i.1
  %215 = load float, ptr %214, align 4
  %216 = getelementptr [4 x i8], ptr %62, i64 %indvars.iv.next99.i.1
  %217 = load float, ptr %216, align 4
  %218 = fadd float %215, %217
  store float %218, ptr %214, align 4
  %indvars.iv.next99.i.2 = or disjoint i64 %indvars.iv98.i, 3
  %219 = getelementptr [4 x i8], ptr %52, i64 %indvars.iv.next99.i.2
  %220 = load float, ptr %219, align 4
  %221 = getelementptr [4 x i8], ptr %62, i64 %indvars.iv.next99.i.2
  %222 = load float, ptr %221, align 4
  %223 = fadd float %220, %222
  store float %223, ptr %219, align 4
  %indvars.iv.next99.i.3 = add nuw nsw i64 %indvars.iv98.i, 4
  %exitcond102.not.i.3 = icmp eq i64 %indvars.iv.next99.i.3, 4096
  br i1 %exitcond102.not.i.3, label %.preheader.i.preheader, label %.lr.ph.i, !llvm.loop !52

.preheader.i.preheader:                           ; preds = %vector.body140, %.lr.ph.i
  br label %.preheader.i

.preheader.i:                                     ; preds = %.preheader.i.preheader, %._crit_edge78.i
  %indvars.iv108.i = phi i64 [ %indvars.iv.next109.i, %._crit_edge78.i ], [ 0, %.preheader.i.preheader ]
  %224 = getelementptr [4 x i8], ptr %42, i64 %indvars.iv108.i
  %225 = getelementptr [16384 x i8], ptr %17, i64 %indvars.iv108.i
  %.promoted79.i = load float, ptr %224, align 4
  br label %226

226:                                              ; preds = %226, %.preheader.i
  %indvars.iv103.i = phi i64 [ 0, %.preheader.i ], [ %indvars.iv.next104.i.1, %226 ]
  %227 = phi float [ %.promoted79.i, %.preheader.i ], [ %241, %226 ]
  %228 = getelementptr [4 x i8], ptr %225, i64 %indvars.iv103.i
  %229 = load float, ptr %228, align 4
  %230 = fmul float %229, 4.353200e+04
  %231 = getelementptr [4 x i8], ptr %52, i64 %indvars.iv103.i
  %232 = load float, ptr %231, align 4
  %233 = fmul float %230, %232
  %234 = fadd float %227, %233
  store float %234, ptr %224, align 4
  %indvars.iv.next104.i = or disjoint i64 %indvars.iv103.i, 1
  %235 = getelementptr [4 x i8], ptr %225, i64 %indvars.iv.next104.i
  %236 = load float, ptr %235, align 4
  %237 = fmul float %236, 4.353200e+04
  %238 = getelementptr [4 x i8], ptr %52, i64 %indvars.iv.next104.i
  %239 = load float, ptr %238, align 4
  %240 = fmul float %237, %239
  %241 = fadd float %234, %240
  store float %241, ptr %224, align 4
  %indvars.iv.next104.i.1 = add nuw nsw i64 %indvars.iv103.i, 2
  %exitcond107.not.i.1 = icmp eq i64 %indvars.iv.next104.i.1, 4096
  br i1 %exitcond107.not.i.1, label %._crit_edge78.i, label %226

._crit_edge78.i:                                  ; preds = %226
  %indvars.iv.next109.i = add nuw nsw i64 %indvars.iv108.i, 1
  %exitcond112.not.i = icmp eq i64 %indvars.iv.next109.i, 4096
  br i1 %exitcond112.not.i, label %_Z6gemveriffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_.exit, label %.preheader.i

_Z6gemveriffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_.exit: ; preds = %._crit_edge78.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %242 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #14
  %.not.i.i84 = icmp eq i32 %242, 0
  br i1 %.not.i.i84, label %_Z20polybench_timer_stopv.exit, label %243

243:                                              ; preds = %_Z6gemveriffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_.exit
  %244 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %242) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z6gemveriffPA4096_fPfS1_S1_S1_S1_S1_S1_S1_.exit, %243
  %245 = load i64, ptr %3, align 8
  %246 = sitofp i64 %245 to double
  %247 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %248 = load i64, ptr %247, align 8
  %249 = sitofp i64 %248 to double
  %250 = fmul nnan double %249, f0x3EB0C6F7A0B5ED8D
  %251 = fadd double %250, %246
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %251, ptr @polybench_t_end, align 8
  %252 = load double, ptr @polybench_t_start, align 8
  %253 = fsub double %251, %252
  %254 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %253) #5
  br label %vector.body150

vector.body150:                                   ; preds = %vector.body150, %_Z20polybench_timer_stopv.exit
  %index151 = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %index.next154, %vector.body150 ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %_Z20polybench_timer_stopv.exit ], [ %286, %vector.body150 ]
  %255 = getelementptr [4 x i8], ptr %42, i64 %index151
  %wide.load152 = load <4 x float>, ptr %255, align 4
  %256 = fpext <4 x float> %wide.load152 to <4 x double>
  %257 = getelementptr [4 x i8], ptr %47, i64 %index151
  %wide.load153 = load <4 x float>, ptr %257, align 4
  %258 = fpext <4 x float> %wide.load153 to <4 x double>
  %259 = fcmp olt <4 x double> %256, splat (double f0xB690000000000000)
  %260 = fneg <4 x float> %wide.load152
  %261 = select <4 x i1> %259, <4 x float> %260, <4 x float> %wide.load152
  %262 = fpext <4 x float> %261 to <4 x double>
  %263 = fcmp uge <4 x double> %262, splat (double 1.000000e-02)
  %264 = fcmp olt <4 x double> %258, splat (double f0xB690000000000000)
  %265 = fneg <4 x float> %wide.load153
  %266 = select <4 x i1> %264, <4 x float> %265, <4 x float> %wide.load153
  %267 = fpext <4 x float> %266 to <4 x double>
  %268 = fcmp uge <4 x double> %267, splat (double 1.000000e-02)
  %269 = fsub <4 x double> %256, %258
  %270 = fptrunc <4 x double> %269 to <4 x float>
  %271 = fcmp olt <4 x double> %269, splat (double f0xB690000000000000)
  %272 = fneg <4 x float> %270
  %273 = select <4 x i1> %271, <4 x float> %272, <4 x float> %270
  %274 = fadd <4 x double> %256, splat (double f0x3E45798EE0000000)
  %275 = fptrunc <4 x double> %274 to <4 x float>
  %276 = fcmp olt <4 x double> %274, splat (double f0xB690000000000000)
  %277 = fneg <4 x float> %275
  %278 = select <4 x i1> %276, <4 x float> %277, <4 x float> %275
  %279 = fdiv <4 x float> %273, %278
  %280 = fcmp olt <4 x float> %279, zeroinitializer
  %281 = fneg <4 x float> %279
  %282 = select <4 x i1> %280, <4 x float> %281, <4 x float> %279
  %283 = fmul <4 x float> %282, splat (float 1.000000e+02)
  %284 = fpext <4 x float> %283 to <4 x double>
  %285 = fcmp ogt <4 x double> %284, splat (double 5.000000e-02)
  %.not157 = select <4 x i1> %263, <4 x i1> splat (i1 true), <4 x i1> %268
  %narrow = select <4 x i1> %.not157, <4 x i1> %285, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %286 = add <4 x i32> %vec.phi, %predphi
  %index.next154 = add nuw i64 %index151, 4
  %287 = icmp eq i64 %index.next154, 4096
  br i1 %287, label %_Z14compareResultsiPfS_.exit, label %vector.body150, !llvm.loop !53

_Z14compareResultsiPfS_.exit:                     ; preds = %vector.body150
  %288 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %286)
  %289 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %288) #5
  call void @free(ptr noundef %17) #14
  call void @free(ptr noundef nonnull %42) #14
  call void @free(ptr noundef nonnull %47) #14
  call void @free(ptr noundef %52) #14
  call void @free(ptr noundef %57) #14
  call void @free(ptr noundef %62) #14
  call void @free(ptr noundef %22) #14
  call void @free(ptr noundef %32) #14
  call void @free(ptr noundef %27) #14
  call void @free(ptr noundef %37) #14
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

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #12

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #13

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
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #13 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #14 = { nounwind "uniform-work-group-size" }
attributes #15 = { cold }
attributes #16 = { cold noreturn nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !9, !5, !10}
!9 = distinct !{!9, !3}
!10 = distinct !{!10, !3}
!11 = !{!9}
!12 = !{!10}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.isvectorized", i32 1}
!15 = !{!"llvm.loop.unroll.runtime.disable"}
!16 = distinct !{!16, !14}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !14, !15}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !14}
!26 = distinct !{!26, !14, !15}
!27 = distinct !{!27, !14, !15}
!28 = !{ptr @_Z29__device_stub__gemver_kernel1iffPfS_S_S_S_}
!29 = !{ptr @_Z29__device_stub__gemver_kernel2iffPfS_S_S_}
!30 = !{ptr @_Z29__device_stub__gemver_kernel3iffPfS_S_}
!31 = distinct !{!31, !14, !15}
!32 = !{!33}
!33 = distinct !{!33, !34}
!34 = distinct !{!34, !"LVerDomain"}
!35 = !{!36}
!36 = distinct !{!36, !34}
!37 = !{!38}
!38 = distinct !{!38, !34}
!39 = !{!33, !40, !36, !41}
!40 = distinct !{!40, !34}
!41 = distinct !{!41, !34}
!42 = !{!40}
!43 = !{!41}
!44 = distinct !{!44, !14, !15}
!45 = distinct !{!45, !14}
!46 = !{!47}
!47 = distinct !{!47, !48}
!48 = distinct !{!48, !"LVerDomain"}
!49 = !{!50}
!50 = distinct !{!50, !48}
!51 = distinct !{!51, !14, !15}
!52 = distinct !{!52, !14}
!53 = distinct !{!53, !14, !15}
