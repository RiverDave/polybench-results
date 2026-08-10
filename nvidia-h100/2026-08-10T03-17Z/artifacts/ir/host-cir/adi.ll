; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu"
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
define dso_local void @_Z3adiiiPA1024_fS0_S0_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef captures(none) %3, ptr nofree noundef captures(none) %4) local_unnamed_addr #1 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader153.lr.ph, label %._crit_edge173

.preheader153.lr.ph:                              ; preds = %5
  %7 = icmp slt i32 %1, 2
  %8 = icmp sgt i32 %1, 0
  %9 = add i32 %1, -2
  %10 = icmp slt i32 %1, 3
  %11 = icmp sgt i32 %1, 1
  %12 = getelementptr i8, ptr %4, i64 4190208
  %13 = getelementptr i8, ptr %3, i64 4190208
  %wide.trip.count185 = zext i32 %1 to i64
  %wide.trip.count190 = zext nneg i32 %1 to i64
  %wide.trip.count200 = zext nneg i32 %1 to i64
  %wide.trip.count195 = zext i32 %9 to i64
  %wide.trip.count210 = zext nneg i32 %1 to i64
  %wide.trip.count215 = zext nneg i32 %1 to i64
  %wide.trip.count225 = zext i32 %9 to i64
  %wide.trip.count220 = zext i32 %1 to i64
  %14 = shl nuw nsw i64 %wide.trip.count185, 2
  %15 = add nuw nsw i64 %14, 4190208
  %scevgep = getelementptr i8, ptr %4, i64 %15
  %scevgep238 = getelementptr i8, ptr %3, i64 %15
  %16 = mul nuw nsw i64 %wide.trip.count185, 4100
  %17 = add nsw i64 %16, -4096
  %scevgep241 = getelementptr i8, ptr %4, i64 %17
  %scevgep242 = getelementptr i8, ptr %3, i64 %17
  %scevgep243 = getelementptr i8, ptr %2, i64 4096
  %scevgep244 = getelementptr i8, ptr %2, i64 %17
  %18 = shl nuw nsw i64 %wide.trip.count195, 2
  %19 = sub nsw i64 4088, %18
  %scevgep274 = getelementptr i8, ptr %4, i64 %19
  %20 = shl nuw nsw i64 %wide.trip.count185, 12
  %21 = getelementptr i8, ptr %4, i64 %20
  %scevgep275 = getelementptr i8, ptr %21, i64 -4
  %scevgep276 = getelementptr i8, ptr %2, i64 %19
  %22 = add nsw i64 %20, -8
  %scevgep277 = getelementptr i8, ptr %2, i64 %22
  %scevgep278 = getelementptr i8, ptr %3, i64 %19
  %scevgep279 = getelementptr i8, ptr %3, i64 %22
  %scevgep303 = getelementptr i8, ptr %4, i64 4092
  %23 = shl nuw nsw i64 %wide.trip.count185, 12
  %scevgep304 = getelementptr i8, ptr %4, i64 %23
  %scevgep305 = getelementptr i8, ptr %3, i64 4092
  %scevgep306 = getelementptr i8, ptr %3, i64 %23
  %24 = shl nuw nsw i64 %wide.trip.count185, 2
  %25 = add nsw i64 %wide.trip.count220, -1
  %min.iters.check311 = icmp ult i32 %1, 4
  %bound0307 = icmp ult ptr %scevgep303, %scevgep306
  %bound1308 = icmp ult ptr %scevgep305, %scevgep304
  %found.conflict309 = and i1 %bound0307, %bound1308
  %n.vec314 = and i64 %wide.trip.count185, 2147483644
  %cmp.n319 = icmp eq i64 %n.vec314, %wide.trip.count185
  %xtraiter = and i64 %wide.trip.count220, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %min.iters.check288 = icmp ult i32 %9, 4
  %bound0280 = icmp ult ptr %scevgep274, %scevgep277
  %bound1281 = icmp ult ptr %scevgep276, %scevgep275
  %found.conflict282 = and i1 %bound0280, %bound1281
  %bound0283 = icmp ult ptr %scevgep274, %scevgep279
  %bound1284 = icmp ult ptr %scevgep278, %scevgep275
  %found.conflict285 = and i1 %bound0283, %bound1284
  %conflict.rdx286 = or i1 %found.conflict282, %found.conflict285
  %n.vec291 = and i64 %wide.trip.count195, 4294967292
  %cmp.n300 = icmp eq i64 %n.vec291, %wide.trip.count195
  %xtraiter335 = and i64 %wide.trip.count225, 1
  %lcmp.mod336.not = icmp eq i64 %xtraiter335, 0
  %26 = add nsw i64 %wide.trip.count225, -1
  %min.iters.check256 = icmp ult i32 %1, 4
  %bound0245 = icmp ult ptr %4, %scevgep242
  %bound1246 = icmp ult ptr %3, %scevgep241
  %found.conflict247 = and i1 %bound0245, %bound1246
  %bound0248 = icmp ult ptr %4, %scevgep244
  %bound1249 = icmp ult ptr %scevgep243, %scevgep241
  %found.conflict250 = and i1 %bound0248, %bound1249
  %conflict.rdx = or i1 %found.conflict247, %found.conflict250
  %bound0251 = icmp ult ptr %3, %scevgep244
  %bound1252 = icmp ult ptr %scevgep243, %scevgep242
  %found.conflict253 = and i1 %bound0251, %bound1252
  %conflict.rdx254 = or i1 %conflict.rdx, %found.conflict253
  %n.vec259 = and i64 %wide.trip.count185, 2147483644
  %cmp.n271 = icmp eq i64 %n.vec259, %wide.trip.count185
  %min.iters.check = icmp ult i32 %1, 4
  %bound0 = icmp ult ptr %12, %scevgep238
  %bound1 = icmp ult ptr %13, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  %n.vec = and i64 %wide.trip.count185, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count185
  %xtraiter337 = and i64 %wide.trip.count220, 3
  %lcmp.mod338.not = icmp eq i64 %xtraiter337, 0
  %xtraiter339 = and i64 %wide.trip.count220, 1
  %27 = icmp eq i64 %25, 0
  %unroll_iter = and i64 %wide.trip.count220, 2147483646
  %lcmp.mod340.not = icmp eq i64 %xtraiter339, 0
  %lcmp.mod341 = trunc i32 %1 to i1
  br label %.preheader153

.preheader153:                                    ; preds = %.preheader153.lr.ph, %._crit_edge171.split
  %.0172 = phi i32 [ 0, %.preheader153.lr.ph ], [ %294, %._crit_edge171.split ]
  br i1 %7, label %.preheader152, label %.lver.check

.preheader152:                                    ; preds = %._crit_edge, %.preheader153
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge171.split

.lr.ph.preheader:                                 ; preds = %.preheader152
  %brmerge = select i1 %min.iters.check311, i1 true, i1 %found.conflict309
  br i1 %brmerge, label %.lr.ph.preheader334, label %vector.body315

vector.body315:                                   ; preds = %.lr.ph.preheader, %vector.body315
  %index316 = phi i64 [ %index.next317, %vector.body315 ], [ 0, %.lr.ph.preheader ]
  %28 = or disjoint i64 %index316, 1
  %29 = or disjoint i64 %index316, 2
  %30 = or disjoint i64 %index316, 3
  %31 = getelementptr [4096 x i8], ptr %4, i64 %index316
  %32 = getelementptr [4096 x i8], ptr %4, i64 %28
  %33 = getelementptr [4096 x i8], ptr %4, i64 %29
  %34 = getelementptr [4096 x i8], ptr %4, i64 %30
  %35 = getelementptr i8, ptr %31, i64 4092
  %36 = getelementptr i8, ptr %32, i64 4092
  %37 = getelementptr i8, ptr %33, i64 4092
  %38 = getelementptr i8, ptr %34, i64 4092
  %39 = load float, ptr %35, align 4, !alias.scope !1, !noalias !4
  %40 = load float, ptr %36, align 4, !alias.scope !1, !noalias !4
  %41 = load float, ptr %37, align 4, !alias.scope !1, !noalias !4
  %42 = load float, ptr %38, align 4, !alias.scope !1, !noalias !4
  %43 = insertelement <4 x float> poison, float %39, i64 0
  %44 = insertelement <4 x float> %43, float %40, i64 1
  %45 = insertelement <4 x float> %44, float %41, i64 2
  %46 = insertelement <4 x float> %45, float %42, i64 3
  %47 = getelementptr [4096 x i8], ptr %3, i64 %index316
  %48 = getelementptr [4096 x i8], ptr %3, i64 %28
  %49 = getelementptr [4096 x i8], ptr %3, i64 %29
  %50 = getelementptr [4096 x i8], ptr %3, i64 %30
  %51 = getelementptr i8, ptr %47, i64 4092
  %52 = getelementptr i8, ptr %48, i64 4092
  %53 = getelementptr i8, ptr %49, i64 4092
  %54 = getelementptr i8, ptr %50, i64 4092
  %55 = load float, ptr %51, align 4, !alias.scope !4
  %56 = load float, ptr %52, align 4, !alias.scope !4
  %57 = load float, ptr %53, align 4, !alias.scope !4
  %58 = load float, ptr %54, align 4, !alias.scope !4
  %59 = insertelement <4 x float> poison, float %55, i64 0
  %60 = insertelement <4 x float> %59, float %56, i64 1
  %61 = insertelement <4 x float> %60, float %57, i64 2
  %62 = insertelement <4 x float> %61, float %58, i64 3
  %63 = fdiv <4 x float> %46, %62
  %64 = extractelement <4 x float> %63, i64 0
  store float %64, ptr %35, align 4, !alias.scope !1, !noalias !4
  %65 = extractelement <4 x float> %63, i64 1
  store float %65, ptr %36, align 4, !alias.scope !1, !noalias !4
  %66 = extractelement <4 x float> %63, i64 2
  store float %66, ptr %37, align 4, !alias.scope !1, !noalias !4
  %67 = extractelement <4 x float> %63, i64 3
  store float %67, ptr %38, align 4, !alias.scope !1, !noalias !4
  %index.next317 = add nuw i64 %index316, 4
  %68 = icmp eq i64 %index.next317, %n.vec314
  br i1 %68, label %middle.block318, label %vector.body315, !llvm.loop !6

middle.block318:                                  ; preds = %vector.body315
  br i1 %cmp.n319, label %.preheader151, label %.lr.ph.preheader334

.lr.ph.preheader334:                              ; preds = %.lr.ph.preheader, %middle.block318
  %indvars.iv187.ph = phi i64 [ %n.vec314, %middle.block318 ], [ 0, %.lr.ph.preheader ]
  br i1 %lcmp.mod.not, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader334
  %69 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv187.ph
  %70 = getelementptr i8, ptr %69, i64 4092
  %71 = load float, ptr %70, align 4
  %72 = getelementptr [4096 x i8], ptr %3, i64 %indvars.iv187.ph
  %73 = getelementptr i8, ptr %72, i64 4092
  %74 = load float, ptr %73, align 4
  %75 = fdiv float %71, %74
  store float %75, ptr %70, align 4
  %indvars.iv.next188.prol = or disjoint i64 %indvars.iv187.ph, 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader334
  %indvars.iv187.unr = phi i64 [ %indvars.iv187.ph, %.lr.ph.preheader334 ], [ %indvars.iv.next188.prol, %.lr.ph.prol ]
  %76 = icmp eq i64 %25, %indvars.iv187.ph
  br i1 %76, label %.preheader151, label %.lr.ph

.lver.check:                                      ; preds = %.preheader153, %._crit_edge
  %indvars.iv182 = phi i64 [ %indvars.iv.next183, %._crit_edge ], [ 0, %.preheader153 ]
  %77 = shl nuw nsw i64 %indvars.iv182, 12
  %scevgep321 = getelementptr i8, ptr %4, i64 %77
  %78 = add nuw i64 %24, %77
  %scevgep322 = getelementptr i8, ptr %4, i64 %78
  %scevgep323 = getelementptr i8, ptr %3, i64 %77
  %scevgep324 = getelementptr i8, ptr %3, i64 %78
  %79 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv182
  %80 = getelementptr [4096 x i8], ptr %2, i64 %indvars.iv182
  %81 = getelementptr [4096 x i8], ptr %3, i64 %indvars.iv182
  %.pre = load float, ptr %81, align 4
  %bound0325 = icmp ult ptr %scevgep321, %scevgep324
  %bound1326 = icmp ult ptr %scevgep323, %scevgep322
  %found.conflict327 = and i1 %bound0325, %bound1326
  br i1 %found.conflict327, label %.ph.lver.orig, label %.ph

.ph.lver.orig:                                    ; preds = %.lver.check, %.ph.lver.orig
  %82 = phi float [ %100, %.ph.lver.orig ], [ %.pre, %.lver.check ]
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.lver.check ]
  %83 = getelementptr [4 x i8], ptr %79, i64 %indvars.iv.lver.orig
  %84 = load float, ptr %83, align 4
  %85 = add nsw i64 %indvars.iv.lver.orig, -1
  %86 = getelementptr [4 x i8], ptr %79, i64 %85
  %87 = load float, ptr %86, align 4
  %88 = getelementptr [4 x i8], ptr %80, i64 %indvars.iv.lver.orig
  %89 = load float, ptr %88, align 4
  %90 = fmul float %87, %89
  %91 = getelementptr [4 x i8], ptr %81, i64 %85
  %92 = fdiv float %90, %82
  %93 = fsub float %84, %92
  store float %93, ptr %83, align 4
  %94 = getelementptr [4 x i8], ptr %81, i64 %indvars.iv.lver.orig
  %95 = load float, ptr %94, align 4
  %96 = load float, ptr %88, align 4
  %97 = fmul float %96, %96
  %98 = load float, ptr %91, align 4
  %99 = fdiv float %97, %98
  %100 = fsub float %95, %99
  store float %100, ptr %94, align 4
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.not.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %wide.trip.count185
  br i1 %exitcond.not.lver.orig, label %._crit_edge, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %101 = shl nuw nsw i64 %indvars.iv182, 12
  %scevgep330 = getelementptr i8, ptr %3, i64 %101
  %scevgep329 = getelementptr i8, ptr %4, i64 %101
  %load_initial = load float, ptr %scevgep329, align 4
  %load_initial331 = load float, ptr %scevgep330, align 4
  br label %102

102:                                              ; preds = %.ph, %102
  %store_forwarded332 = phi float [ %load_initial331, %.ph ], [ %116, %102 ]
  %store_forwarded = phi float [ %load_initial, %.ph ], [ %110, %102 ]
  %103 = phi float [ %.pre, %.ph ], [ %116, %102 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %102 ]
  %104 = getelementptr [4 x i8], ptr %79, i64 %indvars.iv
  %105 = load float, ptr %104, align 4
  %106 = getelementptr [4 x i8], ptr %80, i64 %indvars.iv
  %107 = load float, ptr %106, align 4
  %108 = fmul float %store_forwarded, %107
  %109 = fdiv float %108, %103
  %110 = fsub float %105, %109
  store float %110, ptr %104, align 4
  %111 = getelementptr [4 x i8], ptr %81, i64 %indvars.iv
  %112 = load float, ptr %111, align 4
  %113 = load float, ptr %106, align 4
  %114 = fmul float %113, %113
  %115 = fdiv float %114, %store_forwarded332
  %116 = fsub float %112, %115
  store float %116, ptr %111, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count185
  br i1 %exitcond.not, label %._crit_edge, label %102

._crit_edge:                                      ; preds = %102, %.ph.lver.orig
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %exitcond186.not = icmp eq i64 %indvars.iv.next183, %wide.trip.count185
  br i1 %exitcond186.not, label %.preheader152, label %.lver.check

.preheader151:                                    ; preds = %.lr.ph.prol.loopexit, %.lr.ph, %middle.block318
  br i1 %10, label %.preheader150, label %.preheader146

.lr.ph:                                           ; preds = %.lr.ph.prol.loopexit, %.lr.ph
  %indvars.iv187 = phi i64 [ %indvars.iv.next188.1, %.lr.ph ], [ %indvars.iv187.unr, %.lr.ph.prol.loopexit ]
  %117 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv187
  %118 = getelementptr i8, ptr %117, i64 4092
  %119 = load float, ptr %118, align 4
  %120 = getelementptr [4096 x i8], ptr %3, i64 %indvars.iv187
  %121 = getelementptr i8, ptr %120, i64 4092
  %122 = load float, ptr %121, align 4
  %123 = fdiv float %119, %122
  store float %123, ptr %118, align 4
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  %124 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv.next188
  %125 = getelementptr i8, ptr %124, i64 4092
  %126 = load float, ptr %125, align 4
  %127 = getelementptr [4096 x i8], ptr %3, i64 %indvars.iv.next188
  %128 = getelementptr i8, ptr %127, i64 4092
  %129 = load float, ptr %128, align 4
  %130 = fdiv float %126, %129
  store float %130, ptr %125, align 4
  %indvars.iv.next188.1 = add nuw nsw i64 %indvars.iv187, 2
  %exitcond191.not.1 = icmp eq i64 %indvars.iv.next188.1, %wide.trip.count190
  br i1 %exitcond191.not.1, label %.preheader151, label %.lr.ph, !llvm.loop !9

.preheader150:                                    ; preds = %._crit_edge159, %.preheader151
  br i1 %11, label %.preheader145, label %.preheader149

.preheader146:                                    ; preds = %.preheader151, %._crit_edge159
  %indvars.iv197 = phi i64 [ %indvars.iv.next198, %._crit_edge159 ], [ 0, %.preheader151 ]
  %131 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv197
  %132 = getelementptr [4096 x i8], ptr %2, i64 %indvars.iv197
  %133 = getelementptr [4096 x i8], ptr %3, i64 %indvars.iv197
  %brmerge342 = select i1 %min.iters.check288, i1 true, i1 %conflict.rdx286
  br i1 %brmerge342, label %scalar.ph287.preheader, label %vector.body292

vector.body292:                                   ; preds = %.preheader146, %vector.body292
  %index293 = phi i64 [ %index.next298, %vector.body292 ], [ 0, %.preheader146 ]
  %134 = sub nsw i64 1022, %index293
  %135 = getelementptr [4 x i8], ptr %131, i64 %134
  %136 = getelementptr i8, ptr %135, i64 -12
  %wide.load294 = load <4 x float>, ptr %136, align 4, !alias.scope !10, !noalias !13
  %137 = sub nsw i64 1021, %index293
  %138 = getelementptr [4 x i8], ptr %131, i64 %137
  %139 = getelementptr i8, ptr %138, i64 -12
  %wide.load295 = load <4 x float>, ptr %139, align 4, !alias.scope !10, !noalias !13
  %140 = getelementptr [4 x i8], ptr %132, i64 %137
  %141 = getelementptr i8, ptr %140, i64 -12
  %wide.load296 = load <4 x float>, ptr %141, align 4, !alias.scope !16
  %142 = fmul <4 x float> %wide.load295, %wide.load296
  %143 = fsub <4 x float> %wide.load294, %142
  %144 = getelementptr [4 x i8], ptr %133, i64 %137
  %145 = getelementptr i8, ptr %144, i64 -12
  %wide.load297 = load <4 x float>, ptr %145, align 4, !alias.scope !17
  %146 = fdiv <4 x float> %143, %wide.load297
  store <4 x float> %146, ptr %136, align 4, !alias.scope !10, !noalias !13
  %index.next298 = add nuw i64 %index293, 4
  %147 = icmp eq i64 %index.next298, %n.vec291
  br i1 %147, label %middle.block299, label %vector.body292, !llvm.loop !18

middle.block299:                                  ; preds = %vector.body292
  br i1 %cmp.n300, label %._crit_edge159, label %scalar.ph287.preheader

scalar.ph287.preheader:                           ; preds = %.preheader146, %middle.block299
  %indvars.iv192.ph = phi i64 [ %n.vec291, %middle.block299 ], [ 0, %.preheader146 ]
  br i1 %lcmp.mod336.not, label %scalar.ph287.prol.loopexit, label %scalar.ph287.prol

scalar.ph287.prol:                                ; preds = %scalar.ph287.preheader
  %148 = sub nsw i64 1022, %indvars.iv192.ph
  %149 = getelementptr [4 x i8], ptr %131, i64 %148
  %150 = load float, ptr %149, align 4
  %151 = sub nsw i64 1021, %indvars.iv192.ph
  %152 = getelementptr [4 x i8], ptr %131, i64 %151
  %153 = load float, ptr %152, align 4
  %154 = getelementptr [4 x i8], ptr %132, i64 %151
  %155 = load float, ptr %154, align 4
  %156 = fmul float %153, %155
  %157 = fsub float %150, %156
  %158 = getelementptr [4 x i8], ptr %133, i64 %151
  %159 = load float, ptr %158, align 4
  %160 = fdiv float %157, %159
  store float %160, ptr %149, align 4
  %indvars.iv.next193.prol = or disjoint i64 %indvars.iv192.ph, 1
  br label %scalar.ph287.prol.loopexit

scalar.ph287.prol.loopexit:                       ; preds = %scalar.ph287.prol, %scalar.ph287.preheader
  %indvars.iv192.unr = phi i64 [ %indvars.iv192.ph, %scalar.ph287.preheader ], [ %indvars.iv.next193.prol, %scalar.ph287.prol ]
  %161 = icmp eq i64 %indvars.iv192.ph, %26
  br i1 %161, label %._crit_edge159, label %scalar.ph287

scalar.ph287:                                     ; preds = %scalar.ph287.prol.loopexit, %scalar.ph287
  %indvars.iv192 = phi i64 [ %indvars.iv.next193.1, %scalar.ph287 ], [ %indvars.iv192.unr, %scalar.ph287.prol.loopexit ]
  %162 = sub nsw i64 1022, %indvars.iv192
  %163 = getelementptr [4 x i8], ptr %131, i64 %162
  %164 = load float, ptr %163, align 4
  %165 = sub nsw i64 1021, %indvars.iv192
  %166 = getelementptr [4 x i8], ptr %131, i64 %165
  %167 = load float, ptr %166, align 4
  %168 = getelementptr [4 x i8], ptr %132, i64 %165
  %169 = load float, ptr %168, align 4
  %170 = fmul float %167, %169
  %171 = fsub float %164, %170
  %172 = getelementptr [4 x i8], ptr %133, i64 %165
  %173 = load float, ptr %172, align 4
  %174 = fdiv float %171, %173
  store float %174, ptr %163, align 4
  %175 = sub nsw i64 1021, %indvars.iv192
  %176 = getelementptr [4 x i8], ptr %131, i64 %175
  %177 = load float, ptr %176, align 4
  %178 = sub nsw i64 1020, %indvars.iv192
  %179 = getelementptr [4 x i8], ptr %131, i64 %178
  %180 = load float, ptr %179, align 4
  %181 = getelementptr [4 x i8], ptr %132, i64 %178
  %182 = load float, ptr %181, align 4
  %183 = fmul float %180, %182
  %184 = fsub float %177, %183
  %185 = getelementptr [4 x i8], ptr %133, i64 %178
  %186 = load float, ptr %185, align 4
  %187 = fdiv float %184, %186
  store float %187, ptr %176, align 4
  %indvars.iv.next193.1 = add nuw nsw i64 %indvars.iv192, 2
  %exitcond196.not.1 = icmp eq i64 %indvars.iv.next193.1, %wide.trip.count195
  br i1 %exitcond196.not.1, label %._crit_edge159, label %scalar.ph287, !llvm.loop !19

._crit_edge159:                                   ; preds = %scalar.ph287.prol.loopexit, %scalar.ph287, %middle.block299
  %indvars.iv.next198 = add nuw nsw i64 %indvars.iv197, 1
  %exitcond201.not = icmp eq i64 %indvars.iv.next198, %wide.trip.count200
  br i1 %exitcond201.not, label %.preheader150, label %.preheader146

.preheader149:                                    ; preds = %._crit_edge163, %.preheader150
  %brmerge343 = select i1 %min.iters.check, i1 true, i1 %found.conflict
  br i1 %brmerge343, label %.lr.ph166.preheader, label %vector.body

vector.body:                                      ; preds = %.preheader149, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %.preheader149 ]
  %188 = getelementptr [4 x i8], ptr %12, i64 %index
  %wide.load = load <4 x float>, ptr %188, align 4, !alias.scope !20, !noalias !23
  %189 = getelementptr [4 x i8], ptr %13, i64 %index
  %wide.load239 = load <4 x float>, ptr %189, align 4, !alias.scope !23
  %190 = fdiv <4 x float> %wide.load, %wide.load239
  store <4 x float> %190, ptr %188, align 4, !alias.scope !20, !noalias !23
  %index.next = add nuw i64 %index, 4
  %191 = icmp eq i64 %index.next, %n.vec
  br i1 %191, label %middle.block, label %vector.body, !llvm.loop !25

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %.preheader148, label %.lr.ph166.preheader

.lr.ph166.preheader:                              ; preds = %.preheader149, %middle.block
  %indvars.iv212.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %.preheader149 ]
  br i1 %lcmp.mod338.not, label %.lr.ph166.prol.loopexit, label %.lr.ph166.prol

.lr.ph166.prol:                                   ; preds = %.lr.ph166.preheader, %.lr.ph166.prol
  %indvars.iv212.prol = phi i64 [ %indvars.iv.next213.prol, %.lr.ph166.prol ], [ %indvars.iv212.ph, %.lr.ph166.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %.lr.ph166.prol ], [ 0, %.lr.ph166.preheader ]
  %192 = getelementptr [4 x i8], ptr %12, i64 %indvars.iv212.prol
  %193 = load float, ptr %192, align 4
  %194 = getelementptr [4 x i8], ptr %13, i64 %indvars.iv212.prol
  %195 = load float, ptr %194, align 4
  %196 = fdiv float %193, %195
  store float %196, ptr %192, align 4
  %indvars.iv.next213.prol = add nuw nsw i64 %indvars.iv212.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter337
  br i1 %prol.iter.cmp.not, label %.lr.ph166.prol.loopexit, label %.lr.ph166.prol, !llvm.loop !26

.lr.ph166.prol.loopexit:                          ; preds = %.lr.ph166.prol, %.lr.ph166.preheader
  %indvars.iv212.unr = phi i64 [ %indvars.iv212.ph, %.lr.ph166.preheader ], [ %indvars.iv.next213.prol, %.lr.ph166.prol ]
  %197 = sub nsw i64 %indvars.iv212.ph, %wide.trip.count220
  %198 = icmp ugt i64 %197, -4
  br i1 %198, label %.preheader148, label %.lr.ph166

.preheader145:                                    ; preds = %.preheader150, %._crit_edge163
  %indvars.iv207 = phi i64 [ %indvars.iv.next208, %._crit_edge163 ], [ 1, %.preheader150 ]
  %199 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv207
  %200 = add nsw i64 %indvars.iv207, -1
  %201 = getelementptr [4096 x i8], ptr %4, i64 %200
  %202 = getelementptr [4096 x i8], ptr %2, i64 %indvars.iv207
  %203 = getelementptr [4096 x i8], ptr %3, i64 %200
  %204 = getelementptr [4096 x i8], ptr %3, i64 %indvars.iv207
  %brmerge344 = select i1 %min.iters.check256, i1 true, i1 %conflict.rdx254
  br i1 %brmerge344, label %scalar.ph255.preheader, label %vector.body260

vector.body260:                                   ; preds = %.preheader145, %vector.body260
  %index261 = phi i64 [ %index.next269, %vector.body260 ], [ 0, %.preheader145 ]
  %205 = getelementptr [4 x i8], ptr %199, i64 %index261
  %wide.load262 = load <4 x float>, ptr %205, align 4, !alias.scope !28, !noalias !31
  %206 = getelementptr [4 x i8], ptr %201, i64 %index261
  %wide.load263 = load <4 x float>, ptr %206, align 4, !alias.scope !28, !noalias !31
  %207 = getelementptr [4 x i8], ptr %202, i64 %index261
  %wide.load264 = load <4 x float>, ptr %207, align 4, !alias.scope !34
  %208 = fmul <4 x float> %wide.load263, %wide.load264
  %209 = getelementptr [4 x i8], ptr %203, i64 %index261
  %wide.load265 = load <4 x float>, ptr %209, align 4, !alias.scope !35, !noalias !34
  %210 = fdiv <4 x float> %208, %wide.load265
  %211 = fsub <4 x float> %wide.load262, %210
  store <4 x float> %211, ptr %205, align 4, !alias.scope !28, !noalias !31
  %212 = getelementptr [4 x i8], ptr %204, i64 %index261
  %wide.load266 = load <4 x float>, ptr %212, align 4, !alias.scope !35, !noalias !34
  %wide.load267 = load <4 x float>, ptr %207, align 4, !alias.scope !34
  %213 = fmul <4 x float> %wide.load267, %wide.load267
  %wide.load268 = load <4 x float>, ptr %209, align 4, !alias.scope !35, !noalias !34
  %214 = fdiv <4 x float> %213, %wide.load268
  %215 = fsub <4 x float> %wide.load266, %214
  store <4 x float> %215, ptr %212, align 4, !alias.scope !35, !noalias !34
  %index.next269 = add nuw i64 %index261, 4
  %216 = icmp eq i64 %index.next269, %n.vec259
  br i1 %216, label %middle.block270, label %vector.body260, !llvm.loop !36

middle.block270:                                  ; preds = %vector.body260
  br i1 %cmp.n271, label %._crit_edge163, label %scalar.ph255.preheader

scalar.ph255.preheader:                           ; preds = %.preheader145, %middle.block270
  %indvars.iv202.ph = phi i64 [ %n.vec259, %middle.block270 ], [ 0, %.preheader145 ]
  br label %scalar.ph255

scalar.ph255:                                     ; preds = %scalar.ph255.preheader, %scalar.ph255
  %indvars.iv202 = phi i64 [ %indvars.iv.next203, %scalar.ph255 ], [ %indvars.iv202.ph, %scalar.ph255.preheader ]
  %217 = getelementptr [4 x i8], ptr %199, i64 %indvars.iv202
  %218 = load float, ptr %217, align 4
  %219 = getelementptr [4 x i8], ptr %201, i64 %indvars.iv202
  %220 = load float, ptr %219, align 4
  %221 = getelementptr [4 x i8], ptr %202, i64 %indvars.iv202
  %222 = load float, ptr %221, align 4
  %223 = fmul float %220, %222
  %224 = getelementptr [4 x i8], ptr %203, i64 %indvars.iv202
  %225 = load float, ptr %224, align 4
  %226 = fdiv float %223, %225
  %227 = fsub float %218, %226
  store float %227, ptr %217, align 4
  %228 = getelementptr [4 x i8], ptr %204, i64 %indvars.iv202
  %229 = load float, ptr %228, align 4
  %230 = load float, ptr %221, align 4
  %231 = fmul float %230, %230
  %232 = load float, ptr %224, align 4
  %233 = fdiv float %231, %232
  %234 = fsub float %229, %233
  store float %234, ptr %228, align 4
  %indvars.iv.next203 = add nuw nsw i64 %indvars.iv202, 1
  %exitcond206.not = icmp eq i64 %indvars.iv.next203, %wide.trip.count210
  br i1 %exitcond206.not, label %._crit_edge163, label %scalar.ph255, !llvm.loop !37

._crit_edge163:                                   ; preds = %scalar.ph255, %middle.block270
  %indvars.iv.next208 = add nuw nsw i64 %indvars.iv207, 1
  %exitcond211.not = icmp eq i64 %indvars.iv.next208, %wide.trip.count210
  br i1 %exitcond211.not, label %.preheader149, label %.preheader145

.preheader148:                                    ; preds = %.lr.ph166.prol.loopexit, %.lr.ph166, %middle.block
  br i1 %10, label %._crit_edge171.split, label %.preheader

.lr.ph166:                                        ; preds = %.lr.ph166.prol.loopexit, %.lr.ph166
  %indvars.iv212 = phi i64 [ %indvars.iv.next213.3, %.lr.ph166 ], [ %indvars.iv212.unr, %.lr.ph166.prol.loopexit ]
  %235 = getelementptr [4 x i8], ptr %12, i64 %indvars.iv212
  %236 = load float, ptr %235, align 4
  %237 = getelementptr [4 x i8], ptr %13, i64 %indvars.iv212
  %238 = load float, ptr %237, align 4
  %239 = fdiv float %236, %238
  store float %239, ptr %235, align 4
  %indvars.iv.next213 = add nuw nsw i64 %indvars.iv212, 1
  %240 = getelementptr [4 x i8], ptr %12, i64 %indvars.iv.next213
  %241 = load float, ptr %240, align 4
  %242 = getelementptr [4 x i8], ptr %13, i64 %indvars.iv.next213
  %243 = load float, ptr %242, align 4
  %244 = fdiv float %241, %243
  store float %244, ptr %240, align 4
  %indvars.iv.next213.1 = add nuw nsw i64 %indvars.iv212, 2
  %245 = getelementptr [4 x i8], ptr %12, i64 %indvars.iv.next213.1
  %246 = load float, ptr %245, align 4
  %247 = getelementptr [4 x i8], ptr %13, i64 %indvars.iv.next213.1
  %248 = load float, ptr %247, align 4
  %249 = fdiv float %246, %248
  store float %249, ptr %245, align 4
  %indvars.iv.next213.2 = add nuw nsw i64 %indvars.iv212, 3
  %250 = getelementptr [4 x i8], ptr %12, i64 %indvars.iv.next213.2
  %251 = load float, ptr %250, align 4
  %252 = getelementptr [4 x i8], ptr %13, i64 %indvars.iv.next213.2
  %253 = load float, ptr %252, align 4
  %254 = fdiv float %251, %253
  store float %254, ptr %250, align 4
  %indvars.iv.next213.3 = add nuw nsw i64 %indvars.iv212, 4
  %exitcond216.not.3 = icmp eq i64 %indvars.iv.next213.3, %wide.trip.count215
  br i1 %exitcond216.not.3, label %.preheader148, label %.lr.ph166, !llvm.loop !38

.preheader:                                       ; preds = %.preheader148, %._crit_edge169
  %indvars.iv222 = phi i64 [ %indvars.iv.next223, %._crit_edge169 ], [ 0, %.preheader148 ]
  %255 = sub nsw i64 1022, %indvars.iv222
  %256 = getelementptr [4096 x i8], ptr %4, i64 %255
  %257 = sub nsw i64 1021, %indvars.iv222
  %258 = getelementptr [4096 x i8], ptr %4, i64 %257
  %259 = getelementptr [4096 x i8], ptr %2, i64 %257
  %260 = getelementptr [4096 x i8], ptr %3, i64 %255
  br i1 %27, label %.epil.preheader, label %.preheader.new

.preheader.new:                                   ; preds = %.preheader, %.preheader.new
  %indvars.iv217 = phi i64 [ %indvars.iv.next218.1, %.preheader.new ], [ 0, %.preheader ]
  %niter = phi i64 [ %niter.next.1, %.preheader.new ], [ 0, %.preheader ]
  %261 = getelementptr [4 x i8], ptr %256, i64 %indvars.iv217
  %262 = load float, ptr %261, align 4
  %263 = getelementptr [4 x i8], ptr %258, i64 %indvars.iv217
  %264 = load float, ptr %263, align 4
  %265 = getelementptr [4 x i8], ptr %259, i64 %indvars.iv217
  %266 = load float, ptr %265, align 4
  %267 = fmul float %264, %266
  %268 = fsub float %262, %267
  %269 = getelementptr [4 x i8], ptr %260, i64 %indvars.iv217
  %270 = load float, ptr %269, align 4
  %271 = fdiv float %268, %270
  store float %271, ptr %261, align 4
  %indvars.iv.next218 = or disjoint i64 %indvars.iv217, 1
  %272 = getelementptr [4 x i8], ptr %256, i64 %indvars.iv.next218
  %273 = load float, ptr %272, align 4
  %274 = getelementptr [4 x i8], ptr %258, i64 %indvars.iv.next218
  %275 = load float, ptr %274, align 4
  %276 = getelementptr [4 x i8], ptr %259, i64 %indvars.iv.next218
  %277 = load float, ptr %276, align 4
  %278 = fmul float %275, %277
  %279 = fsub float %273, %278
  %280 = getelementptr [4 x i8], ptr %260, i64 %indvars.iv.next218
  %281 = load float, ptr %280, align 4
  %282 = fdiv float %279, %281
  store float %282, ptr %272, align 4
  %indvars.iv.next218.1 = add nuw nsw i64 %indvars.iv217, 2
  %niter.next.1 = add nuw nsw i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %._crit_edge169.unr-lcssa, label %.preheader.new

._crit_edge169.unr-lcssa:                         ; preds = %.preheader.new
  br i1 %lcmp.mod340.not, label %._crit_edge169, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge169.unr-lcssa, %.preheader
  %indvars.iv217.epil.init = phi i64 [ 0, %.preheader ], [ %indvars.iv.next218.1, %._crit_edge169.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod341)
  %283 = getelementptr [4 x i8], ptr %256, i64 %indvars.iv217.epil.init
  %284 = load float, ptr %283, align 4
  %285 = getelementptr [4 x i8], ptr %258, i64 %indvars.iv217.epil.init
  %286 = load float, ptr %285, align 4
  %287 = getelementptr [4 x i8], ptr %259, i64 %indvars.iv217.epil.init
  %288 = load float, ptr %287, align 4
  %289 = fmul float %286, %288
  %290 = fsub float %284, %289
  %291 = getelementptr [4 x i8], ptr %260, i64 %indvars.iv217.epil.init
  %292 = load float, ptr %291, align 4
  %293 = fdiv float %290, %292
  store float %293, ptr %283, align 4
  br label %._crit_edge169

._crit_edge169:                                   ; preds = %._crit_edge169.unr-lcssa, %.epil.preheader
  %indvars.iv.next223 = add nuw nsw i64 %indvars.iv222, 1
  %exitcond226.not = icmp eq i64 %indvars.iv.next223, %wide.trip.count225
  br i1 %exitcond226.not, label %._crit_edge171.split, label %.preheader

._crit_edge171.split:                             ; preds = %._crit_edge169, %.preheader152, %.preheader148
  %294 = add nuw nsw i32 %.0172, 1
  %exitcond227.not = icmp eq i32 %294, %0
  br i1 %exitcond227.not, label %._crit_edge173, label %.preheader153

._crit_edge173:                                   ; preds = %._crit_edge171.split, %5
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: write)
define dso_local void @_Z10init_arrayiPA1024_fS0_S0_(i32 noundef %0, ptr nofree noundef writeonly captures(none) %1, ptr nofree noundef writeonly captures(none) %2, ptr nofree noundef writeonly captures(none) %3) local_unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader.preheader, label %._crit_edge24.split

.preheader.preheader:                             ; preds = %4
  %6 = ptrtoaddr ptr %1 to i64
  %7 = ptrtoaddr ptr %3 to i64
  %8 = ptrtoaddr ptr %2 to i64
  %wide.trip.count29 = zext nneg i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 4
  %9 = sub i64 %7, %6
  %diff.check = icmp ugt i64 %9, -16
  %10 = sub i64 %7, %8
  %diff.check31 = icmp ugt i64 %10, -16
  %conflict.rdx = or i1 %diff.check, %diff.check31
  %11 = sub i64 %6, %8
  %diff.check32 = icmp ugt i64 %11, -16
  %conflict.rdx33 = or i1 %conflict.rdx, %diff.check32
  %n.vec = and i64 %wide.trip.count29, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count29
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv26 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next27, %._crit_edge ]
  %12 = trunc nuw nsw i64 %indvars.iv26 to i32
  %13 = uitofp nneg i32 %12 to float
  %14 = getelementptr [4096 x i8], ptr %3, i64 %indvars.iv26
  %15 = trunc i64 %indvars.iv26 to i32
  %16 = add i32 %15, -1
  %17 = sitofp i32 %16 to float
  %18 = getelementptr [4096 x i8], ptr %1, i64 %indvars.iv26
  %19 = trunc i64 %indvars.iv26 to i32
  %20 = add i32 %19, 3
  %21 = uitofp nneg i32 %20 to float
  %22 = getelementptr [4096 x i8], ptr %2, i64 %indvars.iv26
  %brmerge = or i1 %min.iters.check, %conflict.rdx33
  br i1 %brmerge, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %13, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert34 = insertelement <4 x float> poison, float %17, i64 0
  %broadcast.splat35 = shufflevector <4 x float> %broadcast.splatinsert34, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert36 = insertelement <4 x float> poison, float %21, i64 0
  %broadcast.splat37 = shufflevector <4 x float> %broadcast.splatinsert36, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.ind38 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next40, %vector.body ]
  %vec.ind39 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next41, %vector.body ]
  %23 = trunc <4 x i64> %vec.ind to <4 x i32>
  %24 = add <4 x i32> %23, splat (i32 1)
  %25 = uitofp nneg <4 x i32> %24 to <4 x float>
  %26 = fmul nnan <4 x float> %broadcast.splat, %25
  %27 = fadd nnan <4 x float> %26, splat (float 1.000000e+00)
  %28 = fmul nnan <4 x float> %27, splat (float f0x3A800000)
  %29 = getelementptr [4 x i8], ptr %14, i64 %index
  store <4 x float> %28, ptr %29, align 4
  %30 = add <4 x i32> %vec.ind38, splat (i32 4)
  %31 = uitofp nneg <4 x i32> %30 to <4 x float>
  %32 = fmul nnan <4 x float> %broadcast.splat35, %31
  %33 = fadd nnan <4 x float> %32, splat (float 2.000000e+00)
  %34 = fmul nnan <4 x float> %33, splat (float f0x3A800000)
  %35 = getelementptr [4 x i8], ptr %18, i64 %index
  store <4 x float> %34, ptr %35, align 4
  %36 = add <4 x i32> %vec.ind39, splat (i32 7)
  %37 = uitofp nneg <4 x i32> %36 to <4 x float>
  %38 = fmul nnan <4 x float> %broadcast.splat37, %37
  %39 = fadd nnan <4 x float> %38, splat (float 3.000000e+00)
  %40 = fmul nnan <4 x float> %39, splat (float f0x3A800000)
  %41 = getelementptr [4 x i8], ptr %22, i64 %index
  store <4 x float> %40, ptr %41, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add nuw nsw <4 x i64> %vec.ind, splat (i64 4)
  %vec.ind.next40 = add <4 x i32> %vec.ind38, splat (i32 4)
  %vec.ind.next41 = add <4 x i32> %vec.ind39, splat (i32 4)
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !39

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %.preheader ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = trunc nuw nsw i64 %indvars.iv.next to i32
  %44 = uitofp nneg i32 %43 to float
  %45 = fmul nnan float %13, %44
  %46 = fadd nnan float %45, 1.000000e+00
  %47 = fmul nnan float %46, f0x3A800000
  %48 = getelementptr [4 x i8], ptr %14, i64 %indvars.iv
  store float %47, ptr %48, align 4
  %49 = trunc i64 %indvars.iv to i32
  %50 = add i32 %49, 4
  %51 = uitofp nneg i32 %50 to float
  %52 = fmul nnan float %17, %51
  %53 = fadd nnan float %52, 2.000000e+00
  %54 = fmul nnan float %53, f0x3A800000
  %55 = getelementptr [4 x i8], ptr %18, i64 %indvars.iv
  store float %54, ptr %55, align 4
  %56 = trunc i64 %indvars.iv to i32
  %57 = add i32 %56, 7
  %58 = uitofp nneg i32 %57 to float
  %59 = fmul nnan float %21, %58
  %60 = fadd nnan float %59, 3.000000e+00
  %61 = fmul nnan float %60, f0x3A800000
  %62 = getelementptr [4 x i8], ptr %22, i64 %indvars.iv
  store float %61, ptr %62, align 4
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count29
  br i1 %exitcond.not, label %._crit_edge, label %scalar.ph, !llvm.loop !40

._crit_edge:                                      ; preds = %scalar.ph, %middle.block
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond30.not = icmp eq i64 %indvars.iv.next27, %wide.trip.count29
  br i1 %exitcond30.not, label %._crit_edge24.split, label %.preheader

._crit_edge24.split:                              ; preds = %._crit_edge, %4
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
define dso_local void @_Z14compareResultsiPA1024_fS0_S0_S0_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef readonly captures(none) %4) local_unnamed_addr #4 {
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
  %7 = getelementptr [4096 x i8], ptr %1, i64 %indvars.iv57
  %8 = getelementptr [4096 x i8], ptr %2, i64 %indvars.iv57
  br i1 %min.iters.check, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %.preheader41.us
  %9 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.045.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %9, %vector.ph ], [ %40, %vector.body ]
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
  %39 = fcmp ogt <4 x float> %38, splat (float 2.500000e+00)
  %.not91 = select <4 x i1> %18, <4 x i1> splat (i1 true), <4 x i1> %23
  %narrow = select <4 x i1> %.not91, <4 x i1> %39, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %40 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %41 = icmp eq i64 %index.next, %n.vec
  br i1 %41, label %middle.block, label %vector.body, !llvm.loop !41

middle.block:                                     ; preds = %vector.body
  %42 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %40)
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %.preheader41.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %.preheader41.us ], [ %n.vec, %middle.block ]
  %.143.us.ph = phi i32 [ %.045.us, %.preheader41.us ], [ %42, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %_Z11percentDiffdd.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %.143.us = phi i32 [ %.2.us, %_Z11percentDiffdd.exit.us ], [ %.143.us.ph, %scalar.ph.preheader ]
  %43 = getelementptr [4 x i8], ptr %7, i64 %indvars.iv
  %44 = load float, ptr %43, align 4
  %45 = fpext float %44 to double
  %46 = getelementptr [4 x i8], ptr %8, i64 %indvars.iv
  %47 = load float, ptr %46, align 4
  %48 = fpext float %47 to double
  %49 = fcmp olt double %45, f0xB690000000000000
  %50 = fneg float %44
  %common.ret.op.i.i.us = select i1 %49, float %50, float %44
  %51 = fpext float %common.ret.op.i.i.us to double
  %52 = fcmp olt double %51, 1.000000e-02
  br i1 %52, label %53, label %.critedge.i.us

53:                                               ; preds = %scalar.ph
  %54 = fcmp olt double %48, f0xB690000000000000
  %55 = fneg float %47
  %common.ret.op.i7.i.us = select i1 %54, float %55, float %47
  %56 = fpext float %common.ret.op.i7.i.us to double
  %57 = fcmp olt double %56, 1.000000e-02
  br i1 %57, label %_Z11percentDiffdd.exit.us, label %.critedge.i.us

.critedge.i.us:                                   ; preds = %53, %scalar.ph
  %58 = insertelement <2 x double> poison, double %45, i64 0
  %59 = shufflevector <2 x double> %58, <2 x double> poison, <2 x i32> zeroinitializer
  %60 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %48, i64 0
  %61 = fsub <2 x double> %59, %60
  %62 = fptrunc <2 x double> %61 to <2 x float>
  %63 = fcmp olt <2 x double> %61, splat (double f0xB690000000000000)
  %64 = fneg <2 x float> %62
  %65 = select <2 x i1> %63, <2 x float> %64, <2 x float> %62
  %66 = extractelement <2 x float> %65, i64 0
  %67 = extractelement <2 x float> %65, i64 1
  %68 = fdiv float %66, %67
  %69 = fcmp olt float %68, 0.000000e+00
  %70 = fneg float %68
  %common.ret.op.i10.i.us = select i1 %69, float %70, float %68
  %71 = fmul float %common.ret.op.i10.i.us, 1.000000e+02
  %72 = fcmp ogt float %71, 2.500000e+00
  %73 = zext i1 %72 to i32
  br label %_Z11percentDiffdd.exit.us

_Z11percentDiffdd.exit.us:                        ; preds = %.critedge.i.us, %53
  %common.ret.op.i.us = phi i32 [ %73, %.critedge.i.us ], [ 0, %53 ]
  %.2.us = add nsw i32 %common.ret.op.i.us, %.143.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count60
  br i1 %exitcond.not, label %._crit_edge.us, label %scalar.ph, !llvm.loop !42

._crit_edge.us:                                   ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %.2.us.lcssa = phi i32 [ %42, %middle.block ], [ %.2.us, %_Z11percentDiffdd.exit.us ]
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
  %74 = getelementptr [4096 x i8], ptr %3, i64 %indvars.iv67
  %75 = getelementptr [4096 x i8], ptr %4, i64 %indvars.iv67
  br i1 %min.iters.check75, label %scalar.ph74.preheader, label %vector.ph76

vector.ph76:                                      ; preds = %.preheader.us
  %76 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %.350.us, i64 0
  br label %vector.body79

vector.body79:                                    ; preds = %vector.body79, %vector.ph76
  %index80 = phi i64 [ 0, %vector.ph76 ], [ %index.next85, %vector.body79 ]
  %vec.phi81 = phi <4 x i32> [ %76, %vector.ph76 ], [ %107, %vector.body79 ]
  %77 = getelementptr [4 x i8], ptr %74, i64 %index80
  %wide.load82 = load <4 x float>, ptr %77, align 4
  %78 = fpext <4 x float> %wide.load82 to <4 x double>
  %79 = getelementptr [4 x i8], ptr %75, i64 %index80
  %wide.load83 = load <4 x float>, ptr %79, align 4
  %80 = fpext <4 x float> %wide.load83 to <4 x double>
  %81 = fcmp olt <4 x double> %78, splat (double f0xB690000000000000)
  %82 = fneg <4 x float> %wide.load82
  %83 = select <4 x i1> %81, <4 x float> %82, <4 x float> %wide.load82
  %84 = fpext <4 x float> %83 to <4 x double>
  %85 = fcmp uge <4 x double> %84, splat (double 1.000000e-02)
  %86 = fcmp olt <4 x double> %80, splat (double f0xB690000000000000)
  %87 = fneg <4 x float> %wide.load83
  %88 = select <4 x i1> %86, <4 x float> %87, <4 x float> %wide.load83
  %89 = fpext <4 x float> %88 to <4 x double>
  %90 = fcmp uge <4 x double> %89, splat (double 1.000000e-02)
  %91 = fsub <4 x double> %78, %80
  %92 = fptrunc <4 x double> %91 to <4 x float>
  %93 = fcmp olt <4 x double> %91, splat (double f0xB690000000000000)
  %94 = fneg <4 x float> %92
  %95 = select <4 x i1> %93, <4 x float> %94, <4 x float> %92
  %96 = fadd <4 x double> %78, splat (double f0x3E45798EE0000000)
  %97 = fptrunc <4 x double> %96 to <4 x float>
  %98 = fcmp olt <4 x double> %96, splat (double f0xB690000000000000)
  %99 = fneg <4 x float> %97
  %100 = select <4 x i1> %98, <4 x float> %99, <4 x float> %97
  %101 = fdiv <4 x float> %95, %100
  %102 = fcmp olt <4 x float> %101, zeroinitializer
  %103 = fneg <4 x float> %101
  %104 = select <4 x i1> %102, <4 x float> %103, <4 x float> %101
  %105 = fmul <4 x float> %104, splat (float 1.000000e+02)
  %106 = fcmp ogt <4 x float> %105, splat (float 2.500000e+00)
  %.not94 = select <4 x i1> %85, <4 x i1> splat (i1 true), <4 x i1> %90
  %narrow92 = select <4 x i1> %.not94, <4 x i1> %106, <4 x i1> zeroinitializer
  %predphi84 = zext <4 x i1> %narrow92 to <4 x i32>
  %107 = add <4 x i32> %vec.phi81, %predphi84
  %index.next85 = add nuw i64 %index80, 4
  %108 = icmp eq i64 %index.next85, %n.vec78
  br i1 %108, label %middle.block86, label %vector.body79, !llvm.loop !43

middle.block86:                                   ; preds = %vector.body79
  %109 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %107)
  br i1 %cmp.n87, label %._crit_edge.us53, label %scalar.ph74.preheader

scalar.ph74.preheader:                            ; preds = %.preheader.us, %middle.block86
  %indvars.iv62.ph = phi i64 [ 0, %.preheader.us ], [ %n.vec78, %middle.block86 ]
  %.448.us.ph = phi i32 [ %.350.us, %.preheader.us ], [ %109, %middle.block86 ]
  br label %scalar.ph74

scalar.ph74:                                      ; preds = %scalar.ph74.preheader, %_Z11percentDiffdd.exit39.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %_Z11percentDiffdd.exit39.us ], [ %indvars.iv62.ph, %scalar.ph74.preheader ]
  %.448.us = phi i32 [ %.5.us, %_Z11percentDiffdd.exit39.us ], [ %.448.us.ph, %scalar.ph74.preheader ]
  %110 = getelementptr [4 x i8], ptr %74, i64 %indvars.iv62
  %111 = load float, ptr %110, align 4
  %112 = fpext float %111 to double
  %113 = getelementptr [4 x i8], ptr %75, i64 %indvars.iv62
  %114 = load float, ptr %113, align 4
  %115 = fpext float %114 to double
  %116 = fcmp olt double %112, f0xB690000000000000
  %117 = fneg float %111
  %common.ret.op.i.i32.us = select i1 %116, float %117, float %111
  %118 = fpext float %common.ret.op.i.i32.us to double
  %119 = fcmp olt double %118, 1.000000e-02
  br i1 %119, label %120, label %.critedge.i33.us

120:                                              ; preds = %scalar.ph74
  %121 = fcmp olt double %115, f0xB690000000000000
  %122 = fneg float %114
  %common.ret.op.i7.i38.us = select i1 %121, float %122, float %114
  %123 = fpext float %common.ret.op.i7.i38.us to double
  %124 = fcmp olt double %123, 1.000000e-02
  br i1 %124, label %_Z11percentDiffdd.exit39.us, label %.critedge.i33.us

.critedge.i33.us:                                 ; preds = %120, %scalar.ph74
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
  %common.ret.op.i10.i36.us = select i1 %136, float %137, float %135
  %138 = fmul float %common.ret.op.i10.i36.us, 1.000000e+02
  %139 = fcmp ogt float %138, 2.500000e+00
  %140 = zext i1 %139 to i32
  br label %_Z11percentDiffdd.exit39.us

_Z11percentDiffdd.exit39.us:                      ; preds = %.critedge.i33.us, %120
  %common.ret.op.i37.us = phi i32 [ %140, %.critedge.i33.us ], [ 0, %120 ]
  %.5.us = add nsw i32 %common.ret.op.i37.us, %.448.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond66.not = icmp eq i64 %indvars.iv.next63, %wide.trip.count70
  br i1 %exitcond66.not, label %._crit_edge.us53, label %scalar.ph74, !llvm.loop !44

._crit_edge.us53:                                 ; preds = %_Z11percentDiffdd.exit39.us, %middle.block86
  %.5.us.lcssa = phi i32 [ %109, %middle.block86 ], [ %.5.us, %_Z11percentDiffdd.exit39.us ]
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond71.not = icmp eq i64 %indvars.iv.next68, %wide.trip.count70
  br i1 %exitcond71.not, label %._crit_edge51, label %.preheader.us

._crit_edge51:                                    ; preds = %._crit_edge.us53, %5
  %.3.lcssa = phi i32 [ 0, %5 ], [ %.5.us.lcssa, %._crit_edge.us53 ]
  %141 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 2.500000e+00, i32 noundef %.3.lcssa) #5
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

define dso_local void @_Z26__device_stub__adi_kernel1iPfS_S_(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #6 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = alloca [4 x ptr], align 16
  store ptr %5, ptr %9, align 16
  %10 = getelementptr inbounds nuw i8, ptr %9, i64 8
  store ptr %6, ptr %10, align 8
  %11 = getelementptr inbounds nuw i8, ptr %9, i64 16
  store ptr %7, ptr %11, align 16
  %12 = getelementptr inbounds nuw i8, ptr %9, i64 24
  store ptr %8, ptr %12, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca %struct.dim3, align 8
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  %17 = call i32 @__cudaPopCallConfiguration(ptr nonnull %13, ptr nonnull %14, ptr nonnull %15, ptr nonnull %16)
  %18 = load i64, ptr %15, align 8
  %19 = load ptr, ptr %16, align 8
  %.fca.0.load2 = load i32, ptr %13, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %13, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %13, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %14, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %14, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %14, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel1iPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
  ret void
}

define dso_local void @_Z26__device_stub__adi_kernel2iPfS_S_(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #6 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = alloca [4 x ptr], align 16
  store ptr %5, ptr %9, align 16
  %10 = getelementptr inbounds nuw i8, ptr %9, i64 8
  store ptr %6, ptr %10, align 8
  %11 = getelementptr inbounds nuw i8, ptr %9, i64 16
  store ptr %7, ptr %11, align 16
  %12 = getelementptr inbounds nuw i8, ptr %9, i64 24
  store ptr %8, ptr %12, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca %struct.dim3, align 8
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  %17 = call i32 @__cudaPopCallConfiguration(ptr nonnull %13, ptr nonnull %14, ptr nonnull %15, ptr nonnull %16)
  %18 = load i64, ptr %15, align 8
  %19 = load ptr, ptr %16, align 8
  %.fca.0.load2 = load i32, ptr %13, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %13, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %13, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %14, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %14, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %14, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel2iPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
  ret void
}

define dso_local void @_Z26__device_stub__adi_kernel3iPfS_S_(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #6 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = alloca [4 x ptr], align 16
  store ptr %5, ptr %9, align 16
  %10 = getelementptr inbounds nuw i8, ptr %9, i64 8
  store ptr %6, ptr %10, align 8
  %11 = getelementptr inbounds nuw i8, ptr %9, i64 16
  store ptr %7, ptr %11, align 16
  %12 = getelementptr inbounds nuw i8, ptr %9, i64 24
  store ptr %8, ptr %12, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca %struct.dim3, align 8
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  %17 = call i32 @__cudaPopCallConfiguration(ptr nonnull %13, ptr nonnull %14, ptr nonnull %15, ptr nonnull %16)
  %18 = load i64, ptr %15, align 8
  %19 = load ptr, ptr %16, align 8
  %.fca.0.load2 = load i32, ptr %13, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %13, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %13, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %14, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %14, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %14, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel3iPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
  ret void
}

define dso_local void @_Z26__device_stub__adi_kernel4iPfS_S_i(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4) #6 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store i32 %4, ptr %10, align 4
  %11 = alloca [5 x ptr], align 16
  store ptr %6, ptr %11, align 16
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 8
  store ptr %7, ptr %12, align 8
  %13 = getelementptr inbounds nuw i8, ptr %11, i64 16
  store ptr %8, ptr %13, align 16
  %14 = getelementptr inbounds nuw i8, ptr %11, i64 24
  store ptr %9, ptr %14, align 8
  %15 = getelementptr inbounds nuw i8, ptr %11, i64 32
  store ptr %10, ptr %15, align 16
  %16 = alloca %struct.dim3, align 8
  %17 = alloca %struct.dim3, align 8
  %18 = alloca i64, align 8
  %19 = alloca ptr, align 8
  %20 = call i32 @__cudaPopCallConfiguration(ptr nonnull %16, ptr nonnull %17, ptr nonnull %18, ptr nonnull %19)
  %21 = load i64, ptr %18, align 8
  %22 = load ptr, ptr %19, align 8
  %.fca.0.load2 = load i32, ptr %16, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %16, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %16, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %17, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %17, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %17, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %23 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel4iPfS_S_i, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %11, i64 noundef %21, ptr noundef %22)
  ret void
}

define dso_local void @_Z26__device_stub__adi_kernel5iPfS_S_(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #6 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = alloca [4 x ptr], align 16
  store ptr %5, ptr %9, align 16
  %10 = getelementptr inbounds nuw i8, ptr %9, i64 8
  store ptr %6, ptr %10, align 8
  %11 = getelementptr inbounds nuw i8, ptr %9, i64 16
  store ptr %7, ptr %11, align 16
  %12 = getelementptr inbounds nuw i8, ptr %9, i64 24
  store ptr %8, ptr %12, align 8
  %13 = alloca %struct.dim3, align 8
  %14 = alloca %struct.dim3, align 8
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  %17 = call i32 @__cudaPopCallConfiguration(ptr nonnull %13, ptr nonnull %14, ptr nonnull %15, ptr nonnull %16)
  %18 = load i64, ptr %15, align 8
  %19 = load ptr, ptr %16, align 8
  %.fca.0.load2 = load i32, ptr %13, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %13, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %13, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %14, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %14, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %14, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %20 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel5iPfS_S_, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %9, i64 noundef %18, ptr noundef %19)
  ret void
}

define dso_local void @_Z26__device_stub__adi_kernel6iPfS_S_i(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4) #6 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store i32 %4, ptr %10, align 4
  %11 = alloca [5 x ptr], align 16
  store ptr %6, ptr %11, align 16
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 8
  store ptr %7, ptr %12, align 8
  %13 = getelementptr inbounds nuw i8, ptr %11, i64 16
  store ptr %8, ptr %13, align 16
  %14 = getelementptr inbounds nuw i8, ptr %11, i64 24
  store ptr %9, ptr %14, align 8
  %15 = getelementptr inbounds nuw i8, ptr %11, i64 32
  store ptr %10, ptr %15, align 16
  %16 = alloca %struct.dim3, align 8
  %17 = alloca %struct.dim3, align 8
  %18 = alloca i64, align 8
  %19 = alloca ptr, align 8
  %20 = call i32 @__cudaPopCallConfiguration(ptr nonnull %16, ptr nonnull %17, ptr nonnull %18, ptr nonnull %19)
  %21 = load i64, ptr %18, align 8
  %22 = load ptr, ptr %19, align 8
  %.fca.0.load2 = load i32, ptr %16, align 8
  %.fca.0.insert3 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2, 0
  %.fca.1.gep4 = getelementptr inbounds nuw i8, ptr %16, i64 4
  %.fca.1.load5 = load i32, ptr %.fca.1.gep4, align 4
  %.fca.1.insert6 = insertvalue %struct.dim3 %.fca.0.insert3, i32 %.fca.1.load5, 1
  %.fca.2.gep7 = getelementptr inbounds nuw i8, ptr %16, i64 8
  %.fca.2.load8 = load i32, ptr %.fca.2.gep7, align 8
  %.fca.2.insert9 = insertvalue %struct.dim3 %.fca.1.insert6, i32 %.fca.2.load8, 2
  %.fca.0.load = load i32, ptr %17, align 8
  %.fca.0.insert = insertvalue %struct.dim3 poison, i32 %.fca.0.load, 0
  %.fca.1.gep = getelementptr inbounds nuw i8, ptr %17, i64 4
  %.fca.1.load = load i32, ptr %.fca.1.gep, align 4
  %.fca.1.insert = insertvalue %struct.dim3 %.fca.0.insert, i32 %.fca.1.load, 1
  %.fca.2.gep = getelementptr inbounds nuw i8, ptr %17, i64 8
  %.fca.2.load = load i32, ptr %.fca.2.gep, align 8
  %.fca.2.insert = insertvalue %struct.dim3 %.fca.1.insert, i32 %.fca.2.load, 2
  %23 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel6iPfS_S_i, %struct.dim3 %.fca.2.insert9, %struct.dim3 %.fca.2.insert, ptr noundef nonnull %11, i64 noundef %21, ptr noundef %22)
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

define dso_local void @_Z7adiCudaiiPA1024_fS0_S0_S0_S0_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) local_unnamed_addr #6 {
  %8 = alloca %struct.timeval, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca [5 x ptr], align 16
  %15 = alloca %struct.dim3, align 8
  %16 = alloca %struct.dim3, align 8
  %17 = alloca i64, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca [4 x ptr], align 16
  %24 = alloca %struct.dim3, align 8
  %25 = alloca %struct.dim3, align 8
  %26 = alloca i64, align 8
  %27 = alloca ptr, align 8
  %28 = alloca i32, align 4
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca i32, align 4
  %33 = alloca [5 x ptr], align 16
  %34 = alloca %struct.dim3, align 8
  %35 = alloca %struct.dim3, align 8
  %36 = alloca i64, align 8
  %37 = alloca ptr, align 8
  %38 = alloca i32, align 4
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca ptr, align 8
  %42 = alloca [4 x ptr], align 16
  %43 = alloca %struct.dim3, align 8
  %44 = alloca %struct.dim3, align 8
  %45 = alloca i64, align 8
  %46 = alloca ptr, align 8
  %47 = alloca i32, align 4
  %48 = alloca ptr, align 8
  %49 = alloca ptr, align 8
  %50 = alloca ptr, align 8
  %51 = alloca [4 x ptr], align 16
  %52 = alloca %struct.dim3, align 8
  %53 = alloca %struct.dim3, align 8
  %54 = alloca i64, align 8
  %55 = alloca ptr, align 8
  %56 = alloca i32, align 4
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca [4 x ptr], align 16
  %61 = alloca %struct.dim3, align 8
  %62 = alloca %struct.dim3, align 8
  %63 = alloca i64, align 8
  %64 = alloca ptr, align 8
  %65 = alloca %struct.timeval, align 8
  %66 = alloca ptr, align 8
  %67 = alloca ptr, align 8
  %68 = alloca ptr, align 8
  %69 = call noundef i32 @cudaMalloc(ptr noundef nonnull %66, i64 noundef 4194304) #5
  %70 = call noundef i32 @cudaMalloc(ptr noundef nonnull %67, i64 noundef 4194304) #5
  %71 = call noundef i32 @cudaMalloc(ptr noundef nonnull %68, i64 noundef 4194304) #5
  %72 = load ptr, ptr %66, align 8
  %73 = call i32 @cudaMemcpy(ptr noundef %72, ptr noundef %2, i64 noundef 4194304, i32 noundef 1) #5
  %74 = load ptr, ptr %67, align 8
  %75 = call i32 @cudaMemcpy(ptr noundef %74, ptr noundef %3, i64 noundef 4194304, i32 noundef 1) #5
  %76 = load ptr, ptr %68, align 8
  %77 = call i32 @cudaMemcpy(ptr noundef %76, ptr noundef %4, i64 noundef 4194304, i32 noundef 1) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %65)
  %78 = call i32 @gettimeofday(ptr noundef nonnull %65, ptr noundef null) #14
  %.not.i.i = icmp eq i32 %78, 0
  br i1 %.not.i.i, label %_Z21polybench_timer_startv.exit, label %79

79:                                               ; preds = %7
  %80 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %78) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %7, %79
  %81 = load i64, ptr %65, align 8
  %82 = sitofp i64 %81 to double
  %83 = getelementptr inbounds nuw i8, ptr %65, i64 8
  %84 = load i64, ptr %83, align 8
  %85 = sitofp i64 %84 to double
  %86 = fmul nnan double %85, f0x3EB0C6F7A0B5ED8D
  %87 = fadd double %86, %82
  call void @llvm.lifetime.end.p0(ptr nonnull %65)
  store double %87, ptr @polybench_t_start, align 8
  %88 = icmp sgt i32 %0, 0
  br i1 %88, label %.lr.ph216, label %._crit_edge217

.lr.ph216:                                        ; preds = %_Z21polybench_timer_startv.exit
  %89 = getelementptr inbounds nuw i8, ptr %60, i64 8
  %90 = getelementptr inbounds nuw i8, ptr %60, i64 16
  %91 = getelementptr inbounds nuw i8, ptr %60, i64 24
  %.fca.1.gep4.i = getelementptr inbounds nuw i8, ptr %61, i64 4
  %.fca.2.gep7.i = getelementptr inbounds nuw i8, ptr %61, i64 8
  %.fca.1.gep.i = getelementptr inbounds nuw i8, ptr %62, i64 4
  %.fca.2.gep.i = getelementptr inbounds nuw i8, ptr %62, i64 8
  %92 = getelementptr inbounds nuw i8, ptr %51, i64 8
  %93 = getelementptr inbounds nuw i8, ptr %51, i64 16
  %94 = getelementptr inbounds nuw i8, ptr %51, i64 24
  %.fca.1.gep4.i97 = getelementptr inbounds nuw i8, ptr %52, i64 4
  %.fca.2.gep7.i100 = getelementptr inbounds nuw i8, ptr %52, i64 8
  %.fca.1.gep.i105 = getelementptr inbounds nuw i8, ptr %53, i64 4
  %.fca.2.gep.i108 = getelementptr inbounds nuw i8, ptr %53, i64 8
  %95 = getelementptr inbounds nuw i8, ptr %42, i64 8
  %96 = getelementptr inbounds nuw i8, ptr %42, i64 16
  %97 = getelementptr inbounds nuw i8, ptr %42, i64 24
  %.fca.1.gep4.i113 = getelementptr inbounds nuw i8, ptr %43, i64 4
  %.fca.2.gep7.i116 = getelementptr inbounds nuw i8, ptr %43, i64 8
  %.fca.1.gep.i121 = getelementptr inbounds nuw i8, ptr %44, i64 4
  %.fca.2.gep.i124 = getelementptr inbounds nuw i8, ptr %44, i64 8
  %98 = icmp sgt i32 %1, 1
  %99 = getelementptr inbounds nuw i8, ptr %33, i64 8
  %100 = getelementptr inbounds nuw i8, ptr %33, i64 16
  %101 = getelementptr inbounds nuw i8, ptr %33, i64 24
  %102 = getelementptr inbounds nuw i8, ptr %33, i64 32
  %.fca.1.gep4.i129 = getelementptr inbounds nuw i8, ptr %34, i64 4
  %.fca.2.gep7.i132 = getelementptr inbounds nuw i8, ptr %34, i64 8
  %.fca.1.gep.i137 = getelementptr inbounds nuw i8, ptr %35, i64 4
  %.fca.2.gep.i140 = getelementptr inbounds nuw i8, ptr %35, i64 8
  %103 = getelementptr inbounds nuw i8, ptr %23, i64 8
  %104 = getelementptr inbounds nuw i8, ptr %23, i64 16
  %105 = getelementptr inbounds nuw i8, ptr %23, i64 24
  %.fca.1.gep4.i145 = getelementptr inbounds nuw i8, ptr %24, i64 4
  %.fca.2.gep7.i148 = getelementptr inbounds nuw i8, ptr %24, i64 8
  %.fca.1.gep.i153 = getelementptr inbounds nuw i8, ptr %25, i64 4
  %.fca.2.gep.i156 = getelementptr inbounds nuw i8, ptr %25, i64 8
  %106 = icmp sgt i32 %1, 2
  %107 = getelementptr inbounds nuw i8, ptr %14, i64 8
  %108 = getelementptr inbounds nuw i8, ptr %14, i64 16
  %109 = getelementptr inbounds nuw i8, ptr %14, i64 24
  %110 = getelementptr inbounds nuw i8, ptr %14, i64 32
  %.fca.1.gep4.i161 = getelementptr inbounds nuw i8, ptr %15, i64 4
  %.fca.2.gep7.i164 = getelementptr inbounds nuw i8, ptr %15, i64 8
  %.fca.1.gep.i169 = getelementptr inbounds nuw i8, ptr %16, i64 4
  %.fca.2.gep.i172 = getelementptr inbounds nuw i8, ptr %16, i64 8
  %111 = add nsw i32 %1, -3
  br label %112

112:                                              ; preds = %.lr.ph216, %._crit_edge214
  %.0215 = phi i32 [ 0, %.lr.ph216 ], [ %181, %._crit_edge214 ]
  %113 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 4, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not = icmp eq i32 %113, 0
  br i1 %.not, label %114, label %122

114:                                              ; preds = %112
  %115 = load ptr, ptr %66, align 8
  %116 = load ptr, ptr %67, align 8
  %117 = load ptr, ptr %68, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %56)
  call void @llvm.lifetime.start.p0(ptr nonnull %57)
  call void @llvm.lifetime.start.p0(ptr nonnull %58)
  call void @llvm.lifetime.start.p0(ptr nonnull %59)
  call void @llvm.lifetime.start.p0(ptr nonnull %60)
  call void @llvm.lifetime.start.p0(ptr nonnull %61)
  call void @llvm.lifetime.start.p0(ptr nonnull %62)
  call void @llvm.lifetime.start.p0(ptr nonnull %63)
  call void @llvm.lifetime.start.p0(ptr nonnull %64)
  store i32 %1, ptr %56, align 4
  store ptr %115, ptr %57, align 8
  store ptr %116, ptr %58, align 8
  store ptr %117, ptr %59, align 8
  store ptr %56, ptr %60, align 16
  store ptr %57, ptr %89, align 8
  store ptr %58, ptr %90, align 16
  store ptr %59, ptr %91, align 8
  %118 = call i32 @__cudaPopCallConfiguration(ptr nonnull %61, ptr nonnull %62, ptr nonnull %63, ptr nonnull %64), !inline_history !45
  %119 = load i64, ptr %63, align 8
  %120 = load ptr, ptr %64, align 8
  %.fca.0.load2.i = load i32, ptr %61, align 8
  %.fca.0.insert3.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i, 0
  %.fca.1.load5.i = load i32, ptr %.fca.1.gep4.i, align 4
  %.fca.1.insert6.i = insertvalue %struct.dim3 %.fca.0.insert3.i, i32 %.fca.1.load5.i, 1
  %.fca.2.load8.i = load i32, ptr %.fca.2.gep7.i, align 8
  %.fca.2.insert9.i = insertvalue %struct.dim3 %.fca.1.insert6.i, i32 %.fca.2.load8.i, 2
  %.fca.0.load.i = load i32, ptr %62, align 8
  %.fca.0.insert.i = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i, 0
  %.fca.1.load.i = load i32, ptr %.fca.1.gep.i, align 4
  %.fca.1.insert.i = insertvalue %struct.dim3 %.fca.0.insert.i, i32 %.fca.1.load.i, 1
  %.fca.2.load.i = load i32, ptr %.fca.2.gep.i, align 8
  %.fca.2.insert.i = insertvalue %struct.dim3 %.fca.1.insert.i, i32 %.fca.2.load.i, 2
  %121 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel1iPfS_S_, %struct.dim3 %.fca.2.insert9.i, %struct.dim3 %.fca.2.insert.i, ptr noundef nonnull %60, i64 noundef %119, ptr noundef %120), !inline_history !45
  call void @llvm.lifetime.end.p0(ptr nonnull %56)
  call void @llvm.lifetime.end.p0(ptr nonnull %57)
  call void @llvm.lifetime.end.p0(ptr nonnull %58)
  call void @llvm.lifetime.end.p0(ptr nonnull %59)
  call void @llvm.lifetime.end.p0(ptr nonnull %60)
  call void @llvm.lifetime.end.p0(ptr nonnull %61)
  call void @llvm.lifetime.end.p0(ptr nonnull %62)
  call void @llvm.lifetime.end.p0(ptr nonnull %63)
  call void @llvm.lifetime.end.p0(ptr nonnull %64)
  br label %122

122:                                              ; preds = %112, %114
  %123 = call i32 @cudaThreadSynchronize() #5
  %124 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 4, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not90 = icmp eq i32 %124, 0
  br i1 %.not90, label %125, label %133

125:                                              ; preds = %122
  %126 = load ptr, ptr %66, align 8
  %127 = load ptr, ptr %67, align 8
  %128 = load ptr, ptr %68, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %47)
  call void @llvm.lifetime.start.p0(ptr nonnull %48)
  call void @llvm.lifetime.start.p0(ptr nonnull %49)
  call void @llvm.lifetime.start.p0(ptr nonnull %50)
  call void @llvm.lifetime.start.p0(ptr nonnull %51)
  call void @llvm.lifetime.start.p0(ptr nonnull %52)
  call void @llvm.lifetime.start.p0(ptr nonnull %53)
  call void @llvm.lifetime.start.p0(ptr nonnull %54)
  call void @llvm.lifetime.start.p0(ptr nonnull %55)
  store i32 %1, ptr %47, align 4
  store ptr %126, ptr %48, align 8
  store ptr %127, ptr %49, align 8
  store ptr %128, ptr %50, align 8
  store ptr %47, ptr %51, align 16
  store ptr %48, ptr %92, align 8
  store ptr %49, ptr %93, align 16
  store ptr %50, ptr %94, align 8
  %129 = call i32 @__cudaPopCallConfiguration(ptr nonnull %52, ptr nonnull %53, ptr nonnull %54, ptr nonnull %55), !inline_history !46
  %130 = load i64, ptr %54, align 8
  %131 = load ptr, ptr %55, align 8
  %.fca.0.load2.i95 = load i32, ptr %52, align 8
  %.fca.0.insert3.i96 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i95, 0
  %.fca.1.load5.i98 = load i32, ptr %.fca.1.gep4.i97, align 4
  %.fca.1.insert6.i99 = insertvalue %struct.dim3 %.fca.0.insert3.i96, i32 %.fca.1.load5.i98, 1
  %.fca.2.load8.i101 = load i32, ptr %.fca.2.gep7.i100, align 8
  %.fca.2.insert9.i102 = insertvalue %struct.dim3 %.fca.1.insert6.i99, i32 %.fca.2.load8.i101, 2
  %.fca.0.load.i103 = load i32, ptr %53, align 8
  %.fca.0.insert.i104 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i103, 0
  %.fca.1.load.i106 = load i32, ptr %.fca.1.gep.i105, align 4
  %.fca.1.insert.i107 = insertvalue %struct.dim3 %.fca.0.insert.i104, i32 %.fca.1.load.i106, 1
  %.fca.2.load.i109 = load i32, ptr %.fca.2.gep.i108, align 8
  %.fca.2.insert.i110 = insertvalue %struct.dim3 %.fca.1.insert.i107, i32 %.fca.2.load.i109, 2
  %132 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel2iPfS_S_, %struct.dim3 %.fca.2.insert9.i102, %struct.dim3 %.fca.2.insert.i110, ptr noundef nonnull %51, i64 noundef %130, ptr noundef %131), !inline_history !46
  call void @llvm.lifetime.end.p0(ptr nonnull %47)
  call void @llvm.lifetime.end.p0(ptr nonnull %48)
  call void @llvm.lifetime.end.p0(ptr nonnull %49)
  call void @llvm.lifetime.end.p0(ptr nonnull %50)
  call void @llvm.lifetime.end.p0(ptr nonnull %51)
  call void @llvm.lifetime.end.p0(ptr nonnull %52)
  call void @llvm.lifetime.end.p0(ptr nonnull %53)
  call void @llvm.lifetime.end.p0(ptr nonnull %54)
  call void @llvm.lifetime.end.p0(ptr nonnull %55)
  br label %133

133:                                              ; preds = %122, %125
  %134 = call i32 @cudaThreadSynchronize() #5
  %135 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 4, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not91 = icmp eq i32 %135, 0
  br i1 %.not91, label %136, label %144

136:                                              ; preds = %133
  %137 = load ptr, ptr %66, align 8
  %138 = load ptr, ptr %67, align 8
  %139 = load ptr, ptr %68, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %38)
  call void @llvm.lifetime.start.p0(ptr nonnull %39)
  call void @llvm.lifetime.start.p0(ptr nonnull %40)
  call void @llvm.lifetime.start.p0(ptr nonnull %41)
  call void @llvm.lifetime.start.p0(ptr nonnull %42)
  call void @llvm.lifetime.start.p0(ptr nonnull %43)
  call void @llvm.lifetime.start.p0(ptr nonnull %44)
  call void @llvm.lifetime.start.p0(ptr nonnull %45)
  call void @llvm.lifetime.start.p0(ptr nonnull %46)
  store i32 %1, ptr %38, align 4
  store ptr %137, ptr %39, align 8
  store ptr %138, ptr %40, align 8
  store ptr %139, ptr %41, align 8
  store ptr %38, ptr %42, align 16
  store ptr %39, ptr %95, align 8
  store ptr %40, ptr %96, align 16
  store ptr %41, ptr %97, align 8
  %140 = call i32 @__cudaPopCallConfiguration(ptr nonnull %43, ptr nonnull %44, ptr nonnull %45, ptr nonnull %46), !inline_history !47
  %141 = load i64, ptr %45, align 8
  %142 = load ptr, ptr %46, align 8
  %.fca.0.load2.i111 = load i32, ptr %43, align 8
  %.fca.0.insert3.i112 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i111, 0
  %.fca.1.load5.i114 = load i32, ptr %.fca.1.gep4.i113, align 4
  %.fca.1.insert6.i115 = insertvalue %struct.dim3 %.fca.0.insert3.i112, i32 %.fca.1.load5.i114, 1
  %.fca.2.load8.i117 = load i32, ptr %.fca.2.gep7.i116, align 8
  %.fca.2.insert9.i118 = insertvalue %struct.dim3 %.fca.1.insert6.i115, i32 %.fca.2.load8.i117, 2
  %.fca.0.load.i119 = load i32, ptr %44, align 8
  %.fca.0.insert.i120 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i119, 0
  %.fca.1.load.i122 = load i32, ptr %.fca.1.gep.i121, align 4
  %.fca.1.insert.i123 = insertvalue %struct.dim3 %.fca.0.insert.i120, i32 %.fca.1.load.i122, 1
  %.fca.2.load.i125 = load i32, ptr %.fca.2.gep.i124, align 8
  %.fca.2.insert.i126 = insertvalue %struct.dim3 %.fca.1.insert.i123, i32 %.fca.2.load.i125, 2
  %143 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel3iPfS_S_, %struct.dim3 %.fca.2.insert9.i118, %struct.dim3 %.fca.2.insert.i126, ptr noundef nonnull %42, i64 noundef %141, ptr noundef %142), !inline_history !47
  call void @llvm.lifetime.end.p0(ptr nonnull %38)
  call void @llvm.lifetime.end.p0(ptr nonnull %39)
  call void @llvm.lifetime.end.p0(ptr nonnull %40)
  call void @llvm.lifetime.end.p0(ptr nonnull %41)
  call void @llvm.lifetime.end.p0(ptr nonnull %42)
  call void @llvm.lifetime.end.p0(ptr nonnull %43)
  call void @llvm.lifetime.end.p0(ptr nonnull %44)
  call void @llvm.lifetime.end.p0(ptr nonnull %45)
  call void @llvm.lifetime.end.p0(ptr nonnull %46)
  br label %144

144:                                              ; preds = %133, %136
  %145 = call i32 @cudaThreadSynchronize() #5
  br i1 %98, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %144, %155
  %.087210 = phi i32 [ %157, %155 ], [ 1, %144 ]
  %146 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 4, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not94 = icmp eq i32 %146, 0
  br i1 %.not94, label %147, label %155

147:                                              ; preds = %.lr.ph
  %148 = load ptr, ptr %66, align 8
  %149 = load ptr, ptr %67, align 8
  %150 = load ptr, ptr %68, align 8
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
  store i32 %1, ptr %28, align 4
  store ptr %148, ptr %29, align 8
  store ptr %149, ptr %30, align 8
  store ptr %150, ptr %31, align 8
  store i32 %.087210, ptr %32, align 4
  store ptr %28, ptr %33, align 16
  store ptr %29, ptr %99, align 8
  store ptr %30, ptr %100, align 16
  store ptr %31, ptr %101, align 8
  store ptr %32, ptr %102, align 16
  %151 = call i32 @__cudaPopCallConfiguration(ptr nonnull %34, ptr nonnull %35, ptr nonnull %36, ptr nonnull %37), !inline_history !48
  %152 = load i64, ptr %36, align 8
  %153 = load ptr, ptr %37, align 8
  %.fca.0.load2.i127 = load i32, ptr %34, align 8
  %.fca.0.insert3.i128 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i127, 0
  %.fca.1.load5.i130 = load i32, ptr %.fca.1.gep4.i129, align 4
  %.fca.1.insert6.i131 = insertvalue %struct.dim3 %.fca.0.insert3.i128, i32 %.fca.1.load5.i130, 1
  %.fca.2.load8.i133 = load i32, ptr %.fca.2.gep7.i132, align 8
  %.fca.2.insert9.i134 = insertvalue %struct.dim3 %.fca.1.insert6.i131, i32 %.fca.2.load8.i133, 2
  %.fca.0.load.i135 = load i32, ptr %35, align 8
  %.fca.0.insert.i136 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i135, 0
  %.fca.1.load.i138 = load i32, ptr %.fca.1.gep.i137, align 4
  %.fca.1.insert.i139 = insertvalue %struct.dim3 %.fca.0.insert.i136, i32 %.fca.1.load.i138, 1
  %.fca.2.load.i141 = load i32, ptr %.fca.2.gep.i140, align 8
  %.fca.2.insert.i142 = insertvalue %struct.dim3 %.fca.1.insert.i139, i32 %.fca.2.load.i141, 2
  %154 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel4iPfS_S_i, %struct.dim3 %.fca.2.insert9.i134, %struct.dim3 %.fca.2.insert.i142, ptr noundef nonnull %33, i64 noundef %152, ptr noundef %153), !inline_history !48
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
  br label %155

155:                                              ; preds = %.lr.ph, %147
  %156 = call i32 @cudaThreadSynchronize() #5
  %157 = add nuw nsw i32 %.087210, 1
  %exitcond.not = icmp eq i32 %157, %1
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %155, %144
  %158 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 4, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not92 = icmp eq i32 %158, 0
  br i1 %.not92, label %159, label %167

159:                                              ; preds = %._crit_edge
  %160 = load ptr, ptr %66, align 8
  %161 = load ptr, ptr %67, align 8
  %162 = load ptr, ptr %68, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %19)
  call void @llvm.lifetime.start.p0(ptr nonnull %20)
  call void @llvm.lifetime.start.p0(ptr nonnull %21)
  call void @llvm.lifetime.start.p0(ptr nonnull %22)
  call void @llvm.lifetime.start.p0(ptr nonnull %23)
  call void @llvm.lifetime.start.p0(ptr nonnull %24)
  call void @llvm.lifetime.start.p0(ptr nonnull %25)
  call void @llvm.lifetime.start.p0(ptr nonnull %26)
  call void @llvm.lifetime.start.p0(ptr nonnull %27)
  store i32 %1, ptr %19, align 4
  store ptr %160, ptr %20, align 8
  store ptr %161, ptr %21, align 8
  store ptr %162, ptr %22, align 8
  store ptr %19, ptr %23, align 16
  store ptr %20, ptr %103, align 8
  store ptr %21, ptr %104, align 16
  store ptr %22, ptr %105, align 8
  %163 = call i32 @__cudaPopCallConfiguration(ptr nonnull %24, ptr nonnull %25, ptr nonnull %26, ptr nonnull %27), !inline_history !49
  %164 = load i64, ptr %26, align 8
  %165 = load ptr, ptr %27, align 8
  %.fca.0.load2.i143 = load i32, ptr %24, align 8
  %.fca.0.insert3.i144 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i143, 0
  %.fca.1.load5.i146 = load i32, ptr %.fca.1.gep4.i145, align 4
  %.fca.1.insert6.i147 = insertvalue %struct.dim3 %.fca.0.insert3.i144, i32 %.fca.1.load5.i146, 1
  %.fca.2.load8.i149 = load i32, ptr %.fca.2.gep7.i148, align 8
  %.fca.2.insert9.i150 = insertvalue %struct.dim3 %.fca.1.insert6.i147, i32 %.fca.2.load8.i149, 2
  %.fca.0.load.i151 = load i32, ptr %25, align 8
  %.fca.0.insert.i152 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i151, 0
  %.fca.1.load.i154 = load i32, ptr %.fca.1.gep.i153, align 4
  %.fca.1.insert.i155 = insertvalue %struct.dim3 %.fca.0.insert.i152, i32 %.fca.1.load.i154, 1
  %.fca.2.load.i157 = load i32, ptr %.fca.2.gep.i156, align 8
  %.fca.2.insert.i158 = insertvalue %struct.dim3 %.fca.1.insert.i155, i32 %.fca.2.load.i157, 2
  %166 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel5iPfS_S_, %struct.dim3 %.fca.2.insert9.i150, %struct.dim3 %.fca.2.insert.i158, ptr noundef nonnull %23, i64 noundef %164, ptr noundef %165), !inline_history !49
  call void @llvm.lifetime.end.p0(ptr nonnull %19)
  call void @llvm.lifetime.end.p0(ptr nonnull %20)
  call void @llvm.lifetime.end.p0(ptr nonnull %21)
  call void @llvm.lifetime.end.p0(ptr nonnull %22)
  call void @llvm.lifetime.end.p0(ptr nonnull %23)
  call void @llvm.lifetime.end.p0(ptr nonnull %24)
  call void @llvm.lifetime.end.p0(ptr nonnull %25)
  call void @llvm.lifetime.end.p0(ptr nonnull %26)
  call void @llvm.lifetime.end.p0(ptr nonnull %27)
  br label %167

167:                                              ; preds = %._crit_edge, %159
  %168 = call i32 @cudaThreadSynchronize() #5
  br i1 %106, label %.lr.ph213, label %._crit_edge214

.lr.ph213:                                        ; preds = %167, %178
  %.088211 = phi i32 [ %180, %178 ], [ 0, %167 ]
  %169 = call i32 @__cudaPushCallConfiguration(%struct.dim3 { i32 4, i32 1, i32 1 }, %struct.dim3 { i32 256, i32 1, i32 1 }, i64 noundef 0, ptr noundef null) #5
  %.not93 = icmp eq i32 %169, 0
  br i1 %.not93, label %170, label %178

170:                                              ; preds = %.lr.ph213
  %171 = load ptr, ptr %66, align 8
  %172 = load ptr, ptr %67, align 8
  %173 = load ptr, ptr %68, align 8
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
  store i32 %1, ptr %9, align 4
  store ptr %171, ptr %10, align 8
  store ptr %172, ptr %11, align 8
  store ptr %173, ptr %12, align 8
  store i32 %.088211, ptr %13, align 4
  store ptr %9, ptr %14, align 16
  store ptr %10, ptr %107, align 8
  store ptr %11, ptr %108, align 16
  store ptr %12, ptr %109, align 8
  store ptr %13, ptr %110, align 16
  %174 = call i32 @__cudaPopCallConfiguration(ptr nonnull %15, ptr nonnull %16, ptr nonnull %17, ptr nonnull %18), !inline_history !50
  %175 = load i64, ptr %17, align 8
  %176 = load ptr, ptr %18, align 8
  %.fca.0.load2.i159 = load i32, ptr %15, align 8
  %.fca.0.insert3.i160 = insertvalue %struct.dim3 poison, i32 %.fca.0.load2.i159, 0
  %.fca.1.load5.i162 = load i32, ptr %.fca.1.gep4.i161, align 4
  %.fca.1.insert6.i163 = insertvalue %struct.dim3 %.fca.0.insert3.i160, i32 %.fca.1.load5.i162, 1
  %.fca.2.load8.i165 = load i32, ptr %.fca.2.gep7.i164, align 8
  %.fca.2.insert9.i166 = insertvalue %struct.dim3 %.fca.1.insert6.i163, i32 %.fca.2.load8.i165, 2
  %.fca.0.load.i167 = load i32, ptr %16, align 8
  %.fca.0.insert.i168 = insertvalue %struct.dim3 poison, i32 %.fca.0.load.i167, 0
  %.fca.1.load.i170 = load i32, ptr %.fca.1.gep.i169, align 4
  %.fca.1.insert.i171 = insertvalue %struct.dim3 %.fca.0.insert.i168, i32 %.fca.1.load.i170, 1
  %.fca.2.load.i173 = load i32, ptr %.fca.2.gep.i172, align 8
  %.fca.2.insert.i174 = insertvalue %struct.dim3 %.fca.1.insert.i171, i32 %.fca.2.load.i173, 2
  %177 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__adi_kernel6iPfS_S_i, %struct.dim3 %.fca.2.insert9.i166, %struct.dim3 %.fca.2.insert.i174, ptr noundef nonnull %14, i64 noundef %175, ptr noundef %176), !inline_history !50
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
  br label %178

178:                                              ; preds = %.lr.ph213, %170
  %179 = call i32 @cudaThreadSynchronize() #5
  %180 = add nuw nsw i32 %.088211, 1
  %exitcond218.not = icmp eq i32 %.088211, %111
  br i1 %exitcond218.not, label %._crit_edge214, label %.lr.ph213

._crit_edge214:                                   ; preds = %178, %167
  %181 = add nuw nsw i32 %.0215, 1
  %exitcond219.not = icmp eq i32 %181, %0
  br i1 %exitcond219.not, label %._crit_edge217, label %112

._crit_edge217:                                   ; preds = %._crit_edge214, %_Z21polybench_timer_startv.exit
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  %182 = call i32 @gettimeofday(ptr noundef nonnull %8, ptr noundef null) #14
  %.not.i.i175 = icmp eq i32 %182, 0
  br i1 %.not.i.i175, label %_Z20polybench_timer_stopv.exit, label %183

183:                                              ; preds = %._crit_edge217
  %184 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %182) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %._crit_edge217, %183
  %185 = load i64, ptr %8, align 8
  %186 = sitofp i64 %185 to double
  %187 = getelementptr inbounds nuw i8, ptr %8, i64 8
  %188 = load i64, ptr %187, align 8
  %189 = sitofp i64 %188 to double
  %190 = fmul nnan double %189, f0x3EB0C6F7A0B5ED8D
  %191 = fadd double %190, %186
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  store double %191, ptr @polybench_t_end, align 8
  %192 = load double, ptr @polybench_t_start, align 8
  %193 = fsub double %191, %192
  %194 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %193) #5
  %195 = load ptr, ptr %67, align 8
  %196 = call i32 @cudaMemcpy(ptr noundef %5, ptr noundef %195, i64 noundef 4194304, i32 noundef 2) #5
  %197 = load ptr, ptr %68, align 8
  %198 = call i32 @cudaMemcpy(ptr noundef %6, ptr noundef %197, i64 noundef 4194304, i32 noundef 2) #5
  %199 = load ptr, ptr %66, align 8
  %200 = call i32 @cudaFree(ptr noundef %199) #5
  %201 = load ptr, ptr %67, align 8
  %202 = call i32 @cudaFree(ptr noundef %201) #5
  %203 = load ptr, ptr %68, align 8
  %204 = call i32 @cudaFree(ptr noundef %203) #5
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
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %struct.cudaDeviceProp, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %10)
  %11 = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %10, i32 noundef 0) #5
  %12 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %10) #5
  %13 = call i32 @cudaSetDevice(i32 noundef 0) #5
  call void @llvm.lifetime.end.p0(ptr nonnull %10)
  call void @llvm.lifetime.start.p0(ptr nonnull %9)
  store ptr null, ptr %9, align 8
  %14 = call i32 @posix_memalign(ptr noundef nonnull %9, i64 noundef 32, i64 noundef 4194304) #14
  %15 = load ptr, ptr %9, align 8
  %16 = ptrtoaddr ptr %15 to i64
  %.not.i.i = icmp eq ptr %15, null
  %17 = icmp ne i32 %14, 0
  %or.cond.i.i = select i1 %.not.i.i, i1 true, i1 %17
  br i1 %or.cond.i.i, label %.critedge.i.i, label %_Z20polybench_alloc_datayi.exit

.critedge.i.i:                                    ; preds = %2
  %18 = load ptr, ptr @stderr, align 8
  %19 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %18) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %2
  call void @llvm.lifetime.end.p0(ptr nonnull %9)
  call void @llvm.lifetime.start.p0(ptr nonnull %8)
  store ptr null, ptr %8, align 8
  %20 = call i32 @posix_memalign(ptr noundef nonnull %8, i64 noundef 32, i64 noundef 4194304) #14
  %21 = load ptr, ptr %8, align 8
  %22 = ptrtoaddr ptr %21 to i64
  %.not.i.i26 = icmp eq ptr %21, null
  %23 = icmp ne i32 %20, 0
  %or.cond.i.i27 = select i1 %.not.i.i26, i1 true, i1 %23
  br i1 %or.cond.i.i27, label %.critedge.i.i28, label %_Z20polybench_alloc_datayi.exit29

.critedge.i.i28:                                  ; preds = %_Z20polybench_alloc_datayi.exit
  %24 = load ptr, ptr @stderr, align 8
  %25 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %24) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit29:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %8)
  call void @llvm.lifetime.start.p0(ptr nonnull %7)
  store ptr null, ptr %7, align 8
  %26 = call i32 @posix_memalign(ptr noundef nonnull %7, i64 noundef 32, i64 noundef 4194304) #14
  %27 = load ptr, ptr %7, align 8
  %.not.i.i30 = icmp eq ptr %27, null
  %28 = icmp ne i32 %26, 0
  %or.cond.i.i31 = select i1 %.not.i.i30, i1 true, i1 %28
  br i1 %or.cond.i.i31, label %.critedge.i.i32, label %_Z20polybench_alloc_datayi.exit33

.critedge.i.i32:                                  ; preds = %_Z20polybench_alloc_datayi.exit29
  %29 = load ptr, ptr @stderr, align 8
  %30 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %29) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit33:                ; preds = %_Z20polybench_alloc_datayi.exit29
  call void @llvm.lifetime.end.p0(ptr nonnull %7)
  call void @llvm.lifetime.start.p0(ptr nonnull %6)
  store ptr null, ptr %6, align 8
  %31 = call i32 @posix_memalign(ptr noundef nonnull %6, i64 noundef 32, i64 noundef 4194304) #14
  %32 = load ptr, ptr %6, align 8
  %33 = ptrtoaddr ptr %32 to i64
  %.not.i.i34 = icmp eq ptr %32, null
  %34 = icmp ne i32 %31, 0
  %or.cond.i.i35 = select i1 %.not.i.i34, i1 true, i1 %34
  br i1 %or.cond.i.i35, label %.critedge.i.i36, label %_Z20polybench_alloc_datayi.exit37

.critedge.i.i36:                                  ; preds = %_Z20polybench_alloc_datayi.exit33
  %35 = load ptr, ptr @stderr, align 8
  %36 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %35) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit37:                ; preds = %_Z20polybench_alloc_datayi.exit33
  call void @llvm.lifetime.end.p0(ptr nonnull %6)
  call void @llvm.lifetime.start.p0(ptr nonnull %5)
  store ptr null, ptr %5, align 8
  %37 = call i32 @posix_memalign(ptr noundef nonnull %5, i64 noundef 32, i64 noundef 4194304) #14
  %38 = load ptr, ptr %5, align 8
  %.not.i.i38 = icmp eq ptr %38, null
  %39 = icmp ne i32 %37, 0
  %or.cond.i.i39 = select i1 %.not.i.i38, i1 true, i1 %39
  br i1 %or.cond.i.i39, label %.critedge.i.i40, label %_Z20polybench_alloc_datayi.exit41

.critedge.i.i40:                                  ; preds = %_Z20polybench_alloc_datayi.exit37
  %40 = load ptr, ptr @stderr, align 8
  %41 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %40) #15
  call void @exit(i32 noundef 1) #16
  unreachable

_Z20polybench_alloc_datayi.exit41:                ; preds = %_Z20polybench_alloc_datayi.exit37
  call void @llvm.lifetime.end.p0(ptr nonnull %5)
  %42 = sub i64 %33, %16
  %diff.check = icmp ugt i64 %42, -16
  %43 = sub i64 %33, %22
  %diff.check50 = icmp ugt i64 %43, -16
  %conflict.rdx = or i1 %diff.check, %diff.check50
  %44 = sub i64 %16, %22
  %diff.check51 = icmp ugt i64 %44, -16
  %conflict.rdx52 = or i1 %conflict.rdx, %diff.check51
  br label %.preheader.i

.preheader.i:                                     ; preds = %._crit_edge.i, %_Z20polybench_alloc_datayi.exit41
  %indvars.iv26.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit41 ], [ %indvars.iv.next27.i, %._crit_edge.i ]
  %45 = trunc i64 %indvars.iv26.i to i32
  %46 = uitofp nneg i32 %45 to float
  %47 = getelementptr [4096 x i8], ptr %32, i64 %indvars.iv26.i
  %48 = add i32 %45, -1
  %49 = sitofp i32 %48 to float
  %50 = getelementptr [4096 x i8], ptr %15, i64 %indvars.iv26.i
  %51 = add i32 %45, 3
  %52 = uitofp nneg i32 %51 to float
  %53 = getelementptr [4096 x i8], ptr %21, i64 %indvars.iv26.i
  br i1 %conflict.rdx52, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %.preheader.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %46, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert53 = insertelement <4 x float> poison, float %49, i64 0
  %broadcast.splat54 = shufflevector <4 x float> %broadcast.splatinsert53, <4 x float> poison, <4 x i32> zeroinitializer
  %broadcast.splatinsert55 = insertelement <4 x float> poison, float %52, i64 0
  %broadcast.splat56 = shufflevector <4 x float> %broadcast.splatinsert55, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %vec.ind57 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next58, %vector.body ]
  %54 = trunc <4 x i64> %vec.ind to <4 x i32>
  %55 = add <4 x i32> %54, splat (i32 1)
  %56 = uitofp nneg <4 x i32> %55 to <4 x float>
  %57 = fmul nnan <4 x float> %broadcast.splat, %56
  %58 = fadd nnan <4 x float> %57, splat (float 1.000000e+00)
  %59 = fmul nnan <4 x float> %58, splat (float f0x3A800000)
  %60 = getelementptr [4 x i8], ptr %47, i64 %index
  store <4 x float> %59, ptr %60, align 4
  %61 = add <4 x i32> %vec.ind57, splat (i32 4)
  %62 = uitofp nneg <4 x i32> %61 to <4 x float>
  %63 = fmul nnan <4 x float> %broadcast.splat54, %62
  %64 = fadd nnan <4 x float> %63, splat (float 2.000000e+00)
  %65 = fmul nnan <4 x float> %64, splat (float f0x3A800000)
  %66 = getelementptr [4 x i8], ptr %50, i64 %index
  store <4 x float> %65, ptr %66, align 4
  %67 = add <4 x i32> %vec.ind57, splat (i32 7)
  %68 = uitofp nneg <4 x i32> %67 to <4 x float>
  %69 = fmul nnan <4 x float> %broadcast.splat56, %68
  %70 = fadd nnan <4 x float> %69, splat (float 3.000000e+00)
  %71 = fmul nnan <4 x float> %70, splat (float f0x3A800000)
  %72 = getelementptr [4 x i8], ptr %53, i64 %index
  store <4 x float> %71, ptr %72, align 4
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add nuw nsw <4 x i64> %vec.ind, splat (i64 4)
  %vec.ind.next58 = add <4 x i32> %vec.ind57, splat (i32 4)
  %73 = icmp eq i64 %index.next, 1024
  br i1 %73, label %._crit_edge.i, label %vector.body, !llvm.loop !51

scalar.ph:                                        ; preds = %.preheader.i, %scalar.ph
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %scalar.ph ], [ 0, %.preheader.i ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %74 = trunc nuw nsw i64 %indvars.iv.next.i to i32
  %75 = uitofp nneg i32 %74 to float
  %76 = fmul nnan float %46, %75
  %77 = fadd nnan float %76, 1.000000e+00
  %78 = fmul nnan float %77, f0x3A800000
  %79 = getelementptr [4 x i8], ptr %47, i64 %indvars.iv.i
  store float %78, ptr %79, align 4
  %80 = trunc i64 %indvars.iv.i to i32
  %81 = add i32 %80, 4
  %82 = uitofp nneg i32 %81 to float
  %83 = fmul nnan float %49, %82
  %84 = fadd nnan float %83, 2.000000e+00
  %85 = fmul nnan float %84, f0x3A800000
  %86 = getelementptr [4 x i8], ptr %50, i64 %indvars.iv.i
  store float %85, ptr %86, align 4
  %87 = add i32 %80, 7
  %88 = uitofp nneg i32 %87 to float
  %89 = fmul nnan float %52, %88
  %90 = fadd nnan float %89, 3.000000e+00
  %91 = fmul nnan float %90, f0x3A800000
  %92 = getelementptr [4 x i8], ptr %53, i64 %indvars.iv.i
  store float %91, ptr %92, align 4
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 1024
  br i1 %exitcond.not.i, label %._crit_edge.i, label %scalar.ph, !llvm.loop !52

._crit_edge.i:                                    ; preds = %vector.body, %scalar.ph
  %indvars.iv.next27.i = add nuw nsw i64 %indvars.iv26.i, 1
  %exitcond30.not.i = icmp eq i64 %indvars.iv.next27.i, 1024
  br i1 %exitcond30.not.i, label %_Z10init_arrayiPA1024_fS0_S0_.exit, label %.preheader.i

_Z10init_arrayiPA1024_fS0_S0_.exit:               ; preds = %._crit_edge.i
  call void @_Z7adiCudaiiPA1024_fS0_S0_S0_S0_(i32 noundef 1, i32 noundef 1024, ptr noundef nonnull %15, ptr noundef nonnull %21, ptr noundef nonnull %32, ptr noundef %27, ptr noundef %38) #5
  call void @llvm.lifetime.start.p0(ptr nonnull %4)
  %93 = call i32 @gettimeofday(ptr noundef nonnull %4, ptr noundef null) #14
  %.not.i.i42 = icmp eq i32 %93, 0
  br i1 %.not.i.i42, label %_Z21polybench_timer_startv.exit, label %94

94:                                               ; preds = %_Z10init_arrayiPA1024_fS0_S0_.exit
  %95 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %93) #5
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiPA1024_fS0_S0_.exit, %94
  %96 = load i64, ptr %4, align 8
  %97 = sitofp i64 %96 to double
  %98 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %99 = load i64, ptr %98, align 8
  %100 = sitofp i64 %99 to double
  %101 = fmul nnan double %100, f0x3EB0C6F7A0B5ED8D
  %102 = fadd double %101, %97
  call void @llvm.lifetime.end.p0(ptr nonnull %4)
  store double %102, ptr @polybench_t_start, align 8
  call void @_Z3adiiiPA1024_fS0_S0_(i32 noundef 1, i32 noundef 1024, ptr noundef nonnull %15, ptr noundef nonnull %21, ptr noundef nonnull %32) #5
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  %103 = call i32 @gettimeofday(ptr noundef nonnull %3, ptr noundef null) #14
  %.not.i.i43 = icmp eq i32 %103, 0
  br i1 %.not.i.i43, label %_Z20polybench_timer_stopv.exit, label %104

104:                                              ; preds = %_Z21polybench_timer_startv.exit
  %105 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %103) #5
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z21polybench_timer_startv.exit, %104
  %106 = load i64, ptr %3, align 8
  %107 = sitofp i64 %106 to double
  %108 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %109 = load i64, ptr %108, align 8
  %110 = sitofp i64 %109 to double
  %111 = fmul nnan double %110, f0x3EB0C6F7A0B5ED8D
  %112 = fadd double %111, %107
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  store double %112, ptr @polybench_t_end, align 8
  %113 = load double, ptr @polybench_t_start, align 8
  %114 = fsub double %112, %113
  %115 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %114) #5
  call void @_Z14compareResultsiPA1024_fS0_S0_S0_(i32 noundef 1024, ptr noundef nonnull %21, ptr noundef %27, ptr noundef nonnull %32, ptr noundef %38) #5
  call void @free(ptr noundef nonnull %15) #14
  call void @free(ptr noundef nonnull %21) #14
  call void @free(ptr noundef %27) #14
  call void @free(ptr noundef nonnull %32) #14
  call void @free(ptr noundef %38) #14
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
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.isvectorized", i32 1}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !7}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14, !15}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = !{!14}
!17 = !{!15}
!18 = distinct !{!18, !7, !8}
!19 = distinct !{!19, !7}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.unroll.disable"}
!28 = !{!29}
!29 = distinct !{!29, !30}
!30 = distinct !{!30, !"LVerDomain"}
!31 = !{!32, !33}
!32 = distinct !{!32, !30}
!33 = distinct !{!33, !30}
!34 = !{!33}
!35 = !{!32}
!36 = distinct !{!36, !7, !8}
!37 = distinct !{!37, !7}
!38 = distinct !{!38, !7}
!39 = distinct !{!39, !7, !8}
!40 = distinct !{!40, !7}
!41 = distinct !{!41, !7, !8}
!42 = distinct !{!42, !8, !7}
!43 = distinct !{!43, !7, !8}
!44 = distinct !{!44, !8, !7}
!45 = !{ptr @_Z26__device_stub__adi_kernel1iPfS_S_}
!46 = !{ptr @_Z26__device_stub__adi_kernel2iPfS_S_}
!47 = !{ptr @_Z26__device_stub__adi_kernel3iPfS_S_}
!48 = !{ptr @_Z26__device_stub__adi_kernel4iPfS_S_i}
!49 = !{ptr @_Z26__device_stub__adi_kernel5iPfS_S_}
!50 = !{ptr @_Z26__device_stub__adi_kernel6iPfS_S_i}
!51 = distinct !{!51, !7, !8}
!52 = distinct !{!52, !7}
