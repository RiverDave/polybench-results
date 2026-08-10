; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/SYR2K/syr2k.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/SYR2K/syr2k.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cudaDeviceProp = type { [256 x i8], %struct.CUuuid_st, [8 x i8], i32, i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [63 x i32] }
%struct.CUuuid_st = type { [16 x i8] }
%struct.dim3 = type { i32, i32, i32 }
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [74 x i8] c"Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"setting device %d with name %s\0A\00", align 1
@polybench_papi_counters_threadid = dso_local local_unnamed_addr global i32 0, align 4
@polybench_program_total_flops = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_t_start = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_t_end = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@polybench_c_start = dso_local local_unnamed_addr global i64 0, align 8
@polybench_c_end = dso_local local_unnamed_addr global i64 0, align 8
@.str.6 = private unnamed_addr constant [7 x i8] c"%0.6f\0A\00", align 1
@.str.7 = private unnamed_addr constant [35 x i8] c"Error return from gettimeofday: %d\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.8 = private unnamed_addr constant [51 x i8] c"[PolyBench] posix_memalign: cannot allocate memory\00", align 1
@str = private unnamed_addr constant [21 x i8] c"GPU Time in seconds:\00", align 1
@str.9 = private unnamed_addr constant [21 x i8] c"CPU Time in seconds:\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef float @_Z6absValf(float noundef %a) local_unnamed_addr #0 {
entry:
  %cmp = fcmp olt float %a, 0.000000e+00
  %mul = fneg float %a
  %retval.0 = select i1 %cmp, float %mul, float %a
  ret float %retval.0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef float @_Z11percentDiffdd(double noundef %val1, double noundef %val2) local_unnamed_addr #0 {
entry:
  %conv = fptrunc double %val1 to float
  %cmp.i = fcmp olt double %val1, f0xB690000000000000
  %mul.i = fneg float %conv
  %retval.0.i = select i1 %cmp.i, float %mul.i, float %conv
  %conv1 = fpext float %retval.0.i to double
  %cmp = fcmp olt double %conv1, 1.000000e-02
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %conv2 = fptrunc double %val2 to float
  %cmp.i14 = fcmp olt double %val2, f0xB690000000000000
  %mul.i15 = fneg float %conv2
  %retval.0.i16 = select i1 %cmp.i14, float %mul.i15, float %conv2
  %conv4 = fpext float %retval.0.i16 to double
  %cmp5 = fcmp olt double %conv4, 1.000000e-02
  br i1 %cmp5, label %return, label %if.else

if.else:                                          ; preds = %land.lhs.true, %entry
  %0 = insertelement <2 x double> poison, double %val1, i64 0
  %1 = shufflevector <2 x double> %0, <2 x double> poison, <2 x i32> zeroinitializer
  %2 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %val2, i64 0
  %3 = fsub <2 x double> %1, %2
  %4 = fptrunc <2 x double> %3 to <2 x float>
  %5 = fcmp olt <2 x double> %3, splat (double f0xB690000000000000)
  %6 = fneg <2 x float> %4
  %7 = select <2 x i1> %5, <2 x float> %6, <2 x float> %4
  %8 = extractelement <2 x float> %7, i64 0
  %9 = extractelement <2 x float> %7, i64 1
  %div = fdiv float %8, %9
  %cmp.i23 = fcmp olt float %div, 0.000000e+00
  %mul.i24 = fneg float %div
  %retval.0.i25 = select i1 %cmp.i23, float %mul.i24, float %div
  %mul = fmul float %retval.0.i25, 1.000000e+02
  br label %return

return:                                           ; preds = %land.lhs.true, %if.else
  %retval.0 = phi float [ %mul, %if.else ], [ 0.000000e+00, %land.lhs.true ]
  ret float %retval.0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable
define dso_local void @_Z11init_arraysiiPfS_PA1024_fS1_S1_(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %alpha, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %beta, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B, ptr nofree noundef writeonly captures(none) %C) local_unnamed_addr #1 {
entry:
  %A90 = ptrtoaddr ptr %A to i64
  %B89 = ptrtoaddr ptr %B to i64
  store float 3.241200e+04, ptr %alpha, align 4, !tbaa !10
  store float 2.123000e+03, ptr %beta, align 4, !tbaa !10
  %cmp66 = icmp sgt i32 %ni, 0
  br i1 %cmp66, label %for.cond1.preheader.lr.ph, label %for.end40

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp264 = icmp sgt i32 %nj, 0
  %conv5 = uitofp nneg i32 %ni to float
  br i1 %cmp264, label %for.cond1.preheader.preheader, label %for.cond23.preheader.lr.ph

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count76 = zext nneg i32 %ni to i64
  %wide.trip.count = zext nneg i32 %nj to i64
  %min.iters.check = icmp ult i32 %nj, 4
  %0 = sub i64 %A90, %B89
  %diff.check = icmp ugt i64 %0, -16
  %or.cond = or i1 %min.iters.check, %diff.check
  %n.vec = and i64 %wide.trip.count, 2147483644
  %broadcast.splatinsert91 = insertelement <4 x float> poison, float %conv5, i64 0
  %broadcast.splat92 = shufflevector <4 x float> %broadcast.splatinsert91, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %1 = add nsw i64 %wide.trip.count, -1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc17_crit_edge
  %indvars.iv73 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next74, %for.cond1.for.inc17_crit_edge ]
  %2 = trunc nuw nsw i64 %indvars.iv73 to i32
  %conv = uitofp nneg i32 %2 to float
  %arrayidx = getelementptr inbounds nuw [4096 x i8], ptr %A, i64 %indvars.iv73
  %arrayidx14 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %indvars.iv73
  br i1 %or.cond, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %3 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %4 = fmul nnan <4 x float> %broadcast.splat, %3
  %5 = fdiv <4 x float> %4, %broadcast.splat92
  %6 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  store <4 x float> %5, ptr %6, align 4, !tbaa !10
  %7 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14, i64 %index
  store <4 x float> %5, ptr %7, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %8 = icmp eq i64 %index.next, %n.vec
  br i1 %8, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc17_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader ], [ %n.vec, %middle.block ]
  br i1 %lcmp.mod.not, label %for.body3.prol.loopexit, label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.preheader
  %9 = trunc nuw nsw i64 %indvars.iv.ph to i32
  %conv4.prol = uitofp nneg i32 %9 to float
  %mul.prol = fmul nnan float %conv, %conv4.prol
  %div.prol = fdiv float %mul.prol, %conv5
  %arrayidx7.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv.ph
  store float %div.prol, ptr %arrayidx7.prol, align 4, !tbaa !10
  %arrayidx16.prol = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14, i64 %indvars.iv.ph
  store float %div.prol, ptr %arrayidx16.prol, align 4, !tbaa !10
  %indvars.iv.next.prol = or disjoint i64 %indvars.iv.ph, 1
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol, %for.body3.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body3.preheader ], [ %indvars.iv.next.prol, %for.body3.prol ]
  %10 = icmp eq i64 %indvars.iv.ph, %1
  br i1 %10, label %for.cond1.for.inc17_crit_edge, label %for.body3

for.cond23.preheader.lr.ph:                       ; preds = %for.cond1.for.inc17_crit_edge, %for.cond1.preheader.lr.ph
  %conv29 = uitofp nneg i32 %ni to float
  %wide.trip.count86 = zext nneg i32 %ni to i64
  %min.iters.check94 = icmp ult i32 %ni, 4
  %n.vec97 = and i64 %wide.trip.count86, 2147483644
  %broadcast.splatinsert100 = insertelement <4 x float> poison, float %conv29, i64 0
  %broadcast.splat101 = shufflevector <4 x float> %broadcast.splatinsert100, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n108 = icmp eq i64 %n.vec97, %wide.trip.count86
  br label %for.cond23.preheader

for.body3:                                        ; preds = %for.body3.prol.loopexit, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3 ], [ %indvars.iv.unr, %for.body3.prol.loopexit ]
  %11 = trunc nuw nsw i64 %indvars.iv to i32
  %conv4 = uitofp nneg i32 %11 to float
  %mul = fmul nnan float %conv, %conv4
  %div = fdiv float %mul, %conv5
  %arrayidx7 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  store float %div, ptr %arrayidx7, align 4, !tbaa !10
  %arrayidx16 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14, i64 %indvars.iv
  store float %div, ptr %arrayidx16, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = trunc nuw nsw i64 %indvars.iv.next to i32
  %conv4.1 = uitofp nneg i32 %12 to float
  %mul.1 = fmul nnan float %conv, %conv4.1
  %div.1 = fdiv float %mul.1, %conv5
  %arrayidx7.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv.next
  store float %div.1, ptr %arrayidx7.1, align 4, !tbaa !10
  %arrayidx16.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14, i64 %indvars.iv.next
  store float %div.1, ptr %arrayidx16.1, align 4, !tbaa !10
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.not.1, label %for.cond1.for.inc17_crit_edge, label %for.body3, !llvm.loop !16

for.cond1.for.inc17_crit_edge:                    ; preds = %for.body3.prol.loopexit, %for.body3, %middle.block
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond77.not = icmp eq i64 %indvars.iv.next74, %wide.trip.count76
  br i1 %exitcond77.not, label %for.cond23.preheader.lr.ph, label %for.cond1.preheader, !llvm.loop !17

for.cond23.preheader:                             ; preds = %for.cond23.preheader.lr.ph, %for.cond23.for.inc38_crit_edge
  %indvars.iv83 = phi i64 [ 0, %for.cond23.preheader.lr.ph ], [ %indvars.iv.next84, %for.cond23.for.inc38_crit_edge ]
  %13 = trunc nuw nsw i64 %indvars.iv83 to i32
  %conv26 = uitofp nneg i32 %13 to float
  %arrayidx32 = getelementptr inbounds nuw [4096 x i8], ptr %C, i64 %indvars.iv83
  br i1 %min.iters.check94, label %for.body25.preheader, label %vector.ph95

vector.ph95:                                      ; preds = %for.cond23.preheader
  %broadcast.splatinsert98 = insertelement <4 x float> poison, float %conv26, i64 0
  %broadcast.splat99 = shufflevector <4 x float> %broadcast.splatinsert98, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body102

vector.body102:                                   ; preds = %vector.body102, %vector.ph95
  %index103 = phi i64 [ 0, %vector.ph95 ], [ %index.next105, %vector.body102 ]
  %vec.ind104 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph95 ], [ %vec.ind.next106, %vector.body102 ]
  %14 = uitofp nneg <4 x i32> %vec.ind104 to <4 x float>
  %15 = fmul nnan <4 x float> %broadcast.splat99, %14
  %16 = fdiv <4 x float> %15, %broadcast.splat101
  %17 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx32, i64 %index103
  store <4 x float> %16, ptr %17, align 4, !tbaa !10
  %index.next105 = add nuw i64 %index103, 4
  %vec.ind.next106 = add <4 x i32> %vec.ind104, splat (i32 4)
  %18 = icmp eq i64 %index.next105, %n.vec97
  br i1 %18, label %middle.block107, label %vector.body102, !llvm.loop !18

middle.block107:                                  ; preds = %vector.body102
  br i1 %cmp.n108, label %for.cond23.for.inc38_crit_edge, label %for.body25.preheader

for.body25.preheader:                             ; preds = %for.cond23.preheader, %middle.block107
  %indvars.iv78.ph = phi i64 [ 0, %for.cond23.preheader ], [ %n.vec97, %middle.block107 ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25.preheader, %for.body25
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %for.body25 ], [ %indvars.iv78.ph, %for.body25.preheader ]
  %19 = trunc nuw nsw i64 %indvars.iv78 to i32
  %conv27 = uitofp nneg i32 %19 to float
  %mul28 = fmul nnan float %conv26, %conv27
  %div30 = fdiv float %mul28, %conv29
  %arrayidx34 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx32, i64 %indvars.iv78
  store float %div30, ptr %arrayidx34, align 4, !tbaa !10
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond82.not = icmp eq i64 %indvars.iv.next79, %wide.trip.count86
  br i1 %exitcond82.not, label %for.cond23.for.inc38_crit_edge, label %for.body25, !llvm.loop !19

for.cond23.for.inc38_crit_edge:                   ; preds = %for.body25, %middle.block107
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond87.not = icmp eq i64 %indvars.iv.next84, %wide.trip.count86
  br i1 %exitcond87.not, label %for.end40, label %for.cond23.preheader, !llvm.loop !20

for.end40:                                        ; preds = %for.cond23.for.inc38_crit_edge, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z8syr2kCpuiiffPA1024_fS0_S0_(i32 noundef %ni, i32 noundef %nj, float noundef %alpha, float noundef %beta, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef captures(none) %C) local_unnamed_addr #3 {
entry:
  %cmp86 = icmp sgt i32 %ni, 0
  br i1 %cmp86, label %for.cond1.preheader.preheader, label %for.end54

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count99 = zext nneg i32 %ni to i64
  %min.iters.check = icmp ult i32 %ni, 8
  %n.vec = and i64 %wide.trip.count99, 2147483640
  %broadcast.splatinsert = insertelement <4 x float> poison, float %beta, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count99
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc6_crit_edge
  %indvars.iv96 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next97, %for.cond1.for.inc6_crit_edge ]
  %arrayidx = getelementptr inbounds nuw [4096 x i8], ptr %C, i64 %indvars.iv96
  br i1 %min.iters.check, label %for.body3.preheader, label %vector.body

vector.body:                                      ; preds = %for.cond1.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.cond1.preheader ]
  %0 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  %1 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %wide.load = load <4 x float>, ptr %0, align 4, !tbaa !10
  %wide.load118 = load <4 x float>, ptr %1, align 4, !tbaa !10
  %2 = fmul <4 x float> %broadcast.splat, %wide.load
  %3 = fmul <4 x float> %broadcast.splat, %wide.load118
  store <4 x float> %2, ptr %0, align 4, !tbaa !10
  store <4 x float> %3, ptr %1, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %4 = icmp eq i64 %index.next, %n.vec
  br i1 %4, label %middle.block, label %vector.body, !llvm.loop !21

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc6_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader ], [ %n.vec, %middle.block ]
  br label %for.body3

for.cond9.preheader:                              ; preds = %for.cond1.for.inc6_crit_edge
  %cmp1688 = icmp sgt i32 %nj, 0
  br i1 %cmp1688, label %for.cond12.preheader.preheader, label %for.end54

for.cond12.preheader.preheader:                   ; preds = %for.cond9.preheader
  %wide.trip.count114 = zext nneg i32 %ni to i64
  %wide.trip.count104 = zext nneg i32 %nj to i64
  br label %for.cond12.preheader

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  %5 = load float, ptr %arrayidx5, align 4, !tbaa !10
  %mul = fmul float %beta, %5
  store float %mul, ptr %arrayidx5, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count99
  br i1 %exitcond.not, label %for.cond1.for.inc6_crit_edge, label %for.body3, !llvm.loop !22

for.cond1.for.inc6_crit_edge:                     ; preds = %for.body3, %middle.block
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %exitcond100.not = icmp eq i64 %indvars.iv.next97, %wide.trip.count99
  br i1 %exitcond100.not, label %for.cond9.preheader, label %for.cond1.preheader, !llvm.loop !23

for.cond12.preheader:                             ; preds = %for.cond12.preheader.preheader, %for.cond12.for.inc52_crit_edge
  %indvars.iv111 = phi i64 [ 0, %for.cond12.preheader.preheader ], [ %indvars.iv.next112, %for.cond12.for.inc52_crit_edge ]
  %arrayidx19 = getelementptr inbounds nuw [4096 x i8], ptr %A, i64 %indvars.iv111
  %arrayidx29 = getelementptr inbounds nuw [4096 x i8], ptr %C, i64 %indvars.iv111
  %arrayidx33 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %indvars.iv111
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond12.preheader, %for.cond15.for.inc49_crit_edge
  %indvars.iv106 = phi i64 [ 0, %for.cond12.preheader ], [ %indvars.iv.next107, %for.cond15.for.inc49_crit_edge ]
  %arrayidx24 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %indvars.iv106
  %arrayidx31 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx29, i64 %indvars.iv106
  %arrayidx38 = getelementptr inbounds nuw [4096 x i8], ptr %A, i64 %indvars.iv106
  %arrayidx31.promoted = load float, ptr %arrayidx31, align 4, !tbaa !10
  br label %for.body17

for.body17:                                       ; preds = %for.cond15.preheader, %for.body17
  %indvars.iv101 = phi i64 [ 0, %for.cond15.preheader ], [ %indvars.iv.next102, %for.body17 ]
  %6 = phi float [ %arrayidx31.promoted, %for.cond15.preheader ], [ %12, %for.body17 ]
  %arrayidx21 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx19, i64 %indvars.iv101
  %7 = load float, ptr %arrayidx21, align 4, !tbaa !10
  %mul22 = fmul float %alpha, %7
  %arrayidx26 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx24, i64 %indvars.iv101
  %8 = load float, ptr %arrayidx26, align 4, !tbaa !10
  %9 = tail call float @llvm.fmuladd.f32(float %mul22, float %8, float %6)
  store float %9, ptr %arrayidx31, align 4, !tbaa !10
  %arrayidx35 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx33, i64 %indvars.iv101
  %10 = load float, ptr %arrayidx35, align 4, !tbaa !10
  %mul36 = fmul float %alpha, %10
  %arrayidx40 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx38, i64 %indvars.iv101
  %11 = load float, ptr %arrayidx40, align 4, !tbaa !10
  %12 = tail call float @llvm.fmuladd.f32(float %mul36, float %11, float %9)
  store float %12, ptr %arrayidx31, align 4, !tbaa !10
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond105.not = icmp eq i64 %indvars.iv.next102, %wide.trip.count104
  br i1 %exitcond105.not, label %for.cond15.for.inc49_crit_edge, label %for.body17, !llvm.loop !24

for.cond15.for.inc49_crit_edge:                   ; preds = %for.body17
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond110.not = icmp eq i64 %indvars.iv.next107, %wide.trip.count114
  br i1 %exitcond110.not, label %for.cond12.for.inc52_crit_edge, label %for.cond15.preheader, !llvm.loop !25

for.cond12.for.inc52_crit_edge:                   ; preds = %for.cond15.for.inc49_crit_edge
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond115.not = icmp eq i64 %indvars.iv.next112, %wide.trip.count114
  br i1 %exitcond115.not, label %for.end54, label %for.cond12.preheader, !llvm.loop !26

for.end54:                                        ; preds = %for.cond12.for.inc52_crit_edge, %entry, %for.cond9.preheader
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #4

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiPA1024_fS0_(i32 noundef %ni, ptr nofree noundef readonly captures(none) %C, ptr nofree noundef readonly captures(none) %C_outputFromGpu) local_unnamed_addr #5 {
entry:
  %cmp29 = icmp sgt i32 %ni, 0
  br i1 %cmp29, label %for.cond1.preheader.us.preheader, label %for.end16

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count37 = zext nneg i32 %ni to i64
  %min.iters.check = icmp ult i32 %ni, 4
  %n.vec = and i64 %wide.trip.count37, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count37
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc14_crit_edge.us
  %indvars.iv34 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next35, %for.cond1.for.inc14_crit_edge.us ]
  %fail.031.us = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [4096 x i8], ptr %C, i64 %indvars.iv34
  %arrayidx7.us = getelementptr inbounds nuw [4096 x i8], ptr %C_outputFromGpu, i64 %indvars.iv34
  br i1 %min.iters.check, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.us
  %0 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.031.us, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %0, %vector.ph ], [ %32, %vector.body ]
  %1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %index
  %wide.load = load <4 x float>, ptr %1, align 4, !tbaa !10
  %2 = fpext <4 x float> %wide.load to <4 x double>
  %3 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us, i64 %index
  %wide.load39 = load <4 x float>, ptr %3, align 4, !tbaa !10
  %4 = fpext <4 x float> %wide.load39 to <4 x double>
  %5 = fcmp olt <4 x double> %2, splat (double f0xB690000000000000)
  %6 = fneg <4 x float> %wide.load
  %7 = select <4 x i1> %5, <4 x float> %6, <4 x float> %wide.load
  %8 = fpext <4 x float> %7 to <4 x double>
  %9 = fcmp uge <4 x double> %8, splat (double 1.000000e-02)
  %10 = fcmp olt <4 x double> %4, splat (double f0xB690000000000000)
  %11 = fneg <4 x float> %wide.load39
  %12 = select <4 x i1> %10, <4 x float> %11, <4 x float> %wide.load39
  %13 = fpext <4 x float> %12 to <4 x double>
  %14 = fcmp uge <4 x double> %13, splat (double 1.000000e-02)
  %15 = fsub <4 x double> %2, %4
  %16 = fptrunc <4 x double> %15 to <4 x float>
  %17 = fcmp olt <4 x double> %15, splat (double f0xB690000000000000)
  %18 = fneg <4 x float> %16
  %19 = select <4 x i1> %17, <4 x float> %18, <4 x float> %16
  %20 = fadd <4 x double> %2, splat (double f0x3E45798EE0000000)
  %21 = fptrunc <4 x double> %20 to <4 x float>
  %22 = fcmp olt <4 x double> %20, splat (double f0xB690000000000000)
  %23 = fneg <4 x float> %21
  %24 = select <4 x i1> %22, <4 x float> %23, <4 x float> %21
  %25 = fdiv <4 x float> %19, %24
  %26 = fcmp olt <4 x float> %25, zeroinitializer
  %27 = fneg <4 x float> %25
  %28 = select <4 x i1> %26, <4 x float> %27, <4 x float> %25
  %29 = fmul <4 x float> %28, splat (float 1.000000e+02)
  %30 = fpext <4 x float> %29 to <4 x double>
  %31 = fcmp ogt <4 x double> %30, splat (double 5.000000e-02)
  %.not41 = select <4 x i1> %9, <4 x i1> splat (i1 true), <4 x i1> %14
  %narrow = select <4 x i1> %.not41, <4 x i1> %31, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %32 = add <4 x i32> %vec.phi, %predphi
  %index.next = add nuw i64 %index, 4
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !27

middle.block:                                     ; preds = %vector.body
  %34 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %32)
  br i1 %cmp.n, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.cond1.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  %fail.128.us.ph = phi i32 [ %fail.031.us, %for.cond1.preheader.us ], [ %34, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %_Z11percentDiffdd.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %fail.128.us = phi i32 [ %fail.2.us, %_Z11percentDiffdd.exit.us ], [ %fail.128.us.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %indvars.iv
  %35 = load float, ptr %arrayidx5.us, align 4, !tbaa !10
  %conv.us = fpext float %35 to double
  %arrayidx9.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us, i64 %indvars.iv
  %36 = load float, ptr %arrayidx9.us, align 4, !tbaa !10
  %conv10.us = fpext float %36 to double
  %cmp.i.i.us = fcmp olt double %conv.us, f0xB690000000000000
  %mul.i.i.us = fneg float %35
  %retval.0.i.i.us = select i1 %cmp.i.i.us, float %mul.i.i.us, float %35
  %conv1.i.us = fpext float %retval.0.i.i.us to double
  %cmp.i.us = fcmp olt double %conv1.i.us, 1.000000e-02
  br i1 %cmp.i.us, label %land.lhs.true.i.us, label %if.else.i.us

land.lhs.true.i.us:                               ; preds = %for.body3.us
  %cmp.i14.i.us = fcmp olt double %conv10.us, f0xB690000000000000
  %mul.i15.i.us = fneg float %36
  %retval.0.i16.i.us = select i1 %cmp.i14.i.us, float %mul.i15.i.us, float %36
  %conv4.i.us = fpext float %retval.0.i16.i.us to double
  %cmp5.i.us = fcmp olt double %conv4.i.us, 1.000000e-02
  br i1 %cmp5.i.us, label %_Z11percentDiffdd.exit.us, label %if.else.i.us

if.else.i.us:                                     ; preds = %land.lhs.true.i.us, %for.body3.us
  %37 = insertelement <2 x double> poison, double %conv.us, i64 0
  %38 = shufflevector <2 x double> %37, <2 x double> poison, <2 x i32> zeroinitializer
  %39 = insertelement <2 x double> <double poison, double f0xBE45798EE0000000>, double %conv10.us, i64 0
  %40 = fsub <2 x double> %38, %39
  %41 = fptrunc <2 x double> %40 to <2 x float>
  %42 = fcmp olt <2 x double> %40, splat (double f0xB690000000000000)
  %43 = fneg <2 x float> %41
  %44 = select <2 x i1> %42, <2 x float> %43, <2 x float> %41
  %45 = extractelement <2 x float> %44, i64 0
  %46 = extractelement <2 x float> %44, i64 1
  %div.i.us = fdiv float %45, %46
  %cmp.i23.i.us = fcmp olt float %div.i.us, 0.000000e+00
  %mul.i24.i.us = fneg float %div.i.us
  %retval.0.i25.i.us = select i1 %cmp.i23.i.us, float %mul.i24.i.us, float %div.i.us
  %mul.i.us = fmul float %retval.0.i25.i.us, 1.000000e+02
  %47 = fpext float %mul.i.us to double
  %48 = fcmp ogt double %47, 5.000000e-02
  %49 = zext i1 %48 to i32
  br label %_Z11percentDiffdd.exit.us

_Z11percentDiffdd.exit.us:                        ; preds = %if.else.i.us, %land.lhs.true.i.us
  %retval.0.i.us = phi i32 [ %49, %if.else.i.us ], [ 0, %land.lhs.true.i.us ]
  %fail.2.us = add nsw i32 %retval.0.i.us, %fail.128.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count37
  br i1 %exitcond.not, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us, !llvm.loop !28

for.cond1.for.inc14_crit_edge.us:                 ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %fail.2.us.lcssa = phi i32 [ %34, %middle.block ], [ %fail.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %for.end16, label %for.cond1.preheader.us, !llvm.loop !29

for.end16:                                        ; preds = %for.cond1.for.inc14_crit_edge.us, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %call17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %fail.0.lcssa) #14
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #6

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #7 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp) #15
  %call = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp, i32 noundef 0) #14
  %call1 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp) #14
  %call2 = call i32 @cudaSetDevice(i32 noundef 0) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp) #15
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #8

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z27__device_stub__syr2k_kerneliiffPfS_S_(i32 noundef %ni, i32 noundef %nj, float noundef %alpha, float noundef %beta, ptr noundef %a, ptr noundef %b, ptr noundef %c) #9 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %alpha.addr = alloca float, align 4
  %beta.addr = alloca float, align 4
  %a.addr = alloca ptr, align 8
  %b.addr = alloca ptr, align 8
  %c.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !30
  store float %alpha, ptr %alpha.addr, align 4, !tbaa !10
  store float %beta, ptr %beta.addr, align 4, !tbaa !10
  store ptr %a, ptr %a.addr, align 8, !tbaa !31
  store ptr %b, ptr %b.addr, align 8, !tbaa !31
  store ptr %c, ptr %c.addr, align 8, !tbaa !31
  %kernel_args1 = alloca [7 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %alpha.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %beta.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %a.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %b.addr, ptr %4, align 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 48
  store ptr %c.addr, ptr %5, align 16
  %6 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %7 = load i64, ptr %shmem_size, align 8
  %8 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__syr2k_kerneliiffPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %7, ptr noundef %8)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress uwtable
define dso_local void @_Z9syr2kCudaiiffPA1024_fS0_S0_S0_(i32 noundef %ni, i32 noundef %nj, float noundef %alpha, float noundef %beta, ptr noundef %A, ptr noundef %B, ptr noundef %C, ptr noundef %C_outputFromGpu) local_unnamed_addr #7 {
entry:
  %Tp.i.i21 = alloca %struct.timeval, align 8
  %ni.addr.i = alloca i32, align 4
  %nj.addr.i = alloca i32, align 4
  %alpha.addr.i = alloca float, align 4
  %beta.addr.i = alloca float, align 4
  %a.addr.i = alloca ptr, align 8
  %b.addr.i = alloca ptr, align 8
  %c.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [7 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %A_gpu = alloca ptr, align 8
  %B_gpu = alloca ptr, align 8
  %C_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %B_gpu) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %C_gpu) #15
  %call = call i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 4194304) #14
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %B_gpu, i64 noundef 4194304) #14
  %call2 = call i32 @cudaMalloc(ptr noundef nonnull %C_gpu, i64 noundef 4194304) #14
  %0 = load ptr, ptr %A_gpu, align 8, !tbaa !31
  %call3 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 4194304, i32 noundef 1) #14
  %1 = load ptr, ptr %B_gpu, align 8, !tbaa !31
  %call4 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %B, i64 noundef 4194304, i32 noundef 1) #14
  %2 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  %call5 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %C, i64 noundef 4194304, i32 noundef 1) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %3 = load i64, ptr %Tp.i.i, align 8, !tbaa !34
  %conv.i.i = sitofp i64 %3 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %4 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !37
  %conv2.i.i = sitofp i64 %4 to double
  %5 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %5, ptr @polybench_t_start, align 8, !tbaa !38
  %call12 = call i32 @__cudaPushCallConfiguration(i64 549755813920, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #14
  %tobool.not = icmp eq i32 %call12, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %6 = load ptr, ptr %A_gpu, align 8, !tbaa !31
  %7 = load ptr, ptr %B_gpu, align 8, !tbaa !31
  %8 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %alpha.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %beta.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %a.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %b.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %c.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %ni, ptr %ni.addr.i, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr.i, align 4, !tbaa !30
  store float %alpha, ptr %alpha.addr.i, align 4, !tbaa !10
  store float %beta, ptr %beta.addr.i, align 4, !tbaa !10
  store ptr %6, ptr %a.addr.i, align 8, !tbaa !31
  store ptr %7, ptr %b.addr.i, align 8, !tbaa !31
  store ptr %8, ptr %c.addr.i, align 8, !tbaa !31
  store ptr %ni.addr.i, ptr %kernel_args1.i, align 16
  %9 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %nj.addr.i, ptr %9, align 8
  %10 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %alpha.addr.i, ptr %10, align 16
  %11 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %beta.addr.i, ptr %11, align 8
  %12 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 32
  store ptr %a.addr.i, ptr %12, align 16
  %13 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 40
  store ptr %b.addr.i, ptr %13, align 8
  %14 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 48
  store ptr %c.addr.i, ptr %14, align 16
  %15 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !40
  %16 = load i64, ptr %shmem_size.i, align 8
  %17 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z27__device_stub__syr2k_kerneliiffPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %16, ptr noundef %17), !inline_history !40
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %alpha.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %beta.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %a.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %b.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %c.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %_Z21polybench_timer_startv.exit
  %call13 = call i32 @cudaThreadSynchronize() #14
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i21) #15
  %call.i.i22 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i21, ptr noundef null) #16
  %cmp.not.i.i23 = icmp eq i32 %call.i.i22, 0
  br i1 %cmp.not.i.i23, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i24

if.then.i.i24:                                    ; preds = %kcall.end
  %call1.i.i25 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i22) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end, %if.then.i.i24
  %18 = load i64, ptr %Tp.i.i21, align 8, !tbaa !34
  %conv.i.i26 = sitofp i64 %18 to double
  %tv_usec.i.i27 = getelementptr inbounds nuw i8, ptr %Tp.i.i21, i64 8
  %19 = load i64, ptr %tv_usec.i.i27, align 8, !tbaa !37
  %conv2.i.i28 = sitofp i64 %19 to double
  %20 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i28, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i26)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i21) #15
  store double %20, ptr @polybench_t_end, align 8, !tbaa !38
  %21 = load double, ptr @polybench_t_start, align 8, !tbaa !38
  %sub.i = fsub double %20, %21
  %call.i29 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #14
  %22 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  %call15 = call i32 @cudaMemcpy(ptr noundef %C_outputFromGpu, ptr noundef %22, i64 noundef 4194304, i32 noundef 2) #14
  %23 = load ptr, ptr %A_gpu, align 8, !tbaa !31
  %call16 = call i32 @cudaFree(ptr noundef %23) #14
  %24 = load ptr, ptr %B_gpu, align 8, !tbaa !31
  %call17 = call i32 @cudaFree(ptr noundef %24) #14
  %25 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  %call18 = call i32 @cudaFree(ptr noundef %25) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %C_gpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %B_gpu) #15
  call void @llvm.lifetime.end.p0(ptr nonnull %A_gpu) #15
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #8

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #5 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #15
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #16
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #14
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !34
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !37
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_start, align 8, !tbaa !38
  ret void
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #8

declare i32 @cudaThreadSynchronize() local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #5 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #15
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #16
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #14
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !34
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !37
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #15
  store double %2, ptr @polybench_t_end, align 8, !tbaa !38
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #5 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !38
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !38
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #14
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #9 {
entry:
  %Tp.i.i63 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i47 = alloca ptr, align 8
  %newA.i.i40 = alloca ptr, align 8
  %newA.i.i33 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #15
  store ptr null, ptr %newA.i.i, align 8, !tbaa !41
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 4194304) #16
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !41
  %1 = ptrtoaddr ptr %0 to i64
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %2 = load ptr, ptr @stderr, align 8, !tbaa !42
  %3 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %2) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i33) #15
  store ptr null, ptr %newA.i.i33, align 8, !tbaa !41
  %call.i.i34 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i33, i64 noundef 32, i64 noundef 4194304) #16
  %4 = load ptr, ptr %newA.i.i33, align 8, !tbaa !41
  %5 = ptrtoaddr ptr %4 to i64
  %tobool.i.i35 = icmp eq ptr %4, null
  %tobool1.i.i36 = icmp ne i32 %call.i.i34, 0
  %or.cond.i.i37 = select i1 %tobool.i.i35, i1 true, i1 %tobool1.i.i36
  br i1 %or.cond.i.i37, label %if.then.i.i38, label %_Z20polybench_alloc_datayi.exit39

if.then.i.i38:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %6 = load ptr, ptr @stderr, align 8, !tbaa !42
  %7 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %6) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit39:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i33) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i40) #15
  store ptr null, ptr %newA.i.i40, align 8, !tbaa !41
  %call.i.i41 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i40, i64 noundef 32, i64 noundef 4194304) #16
  %8 = load ptr, ptr %newA.i.i40, align 8, !tbaa !41
  %tobool.i.i42 = icmp eq ptr %8, null
  %tobool1.i.i43 = icmp ne i32 %call.i.i41, 0
  %or.cond.i.i44 = select i1 %tobool.i.i42, i1 true, i1 %tobool1.i.i43
  br i1 %or.cond.i.i44, label %if.then.i.i45, label %_Z20polybench_alloc_datayi.exit46

if.then.i.i45:                                    ; preds = %_Z20polybench_alloc_datayi.exit39
  %9 = load ptr, ptr @stderr, align 8, !tbaa !42
  %10 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %9) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit46:                ; preds = %_Z20polybench_alloc_datayi.exit39
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i40) #15
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i47) #15
  store ptr null, ptr %newA.i.i47, align 8, !tbaa !41
  %call.i.i48 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i47, i64 noundef 32, i64 noundef 4194304) #16
  %11 = load ptr, ptr %newA.i.i47, align 8, !tbaa !41
  %tobool.i.i49 = icmp eq ptr %11, null
  %tobool1.i.i50 = icmp ne i32 %call.i.i48, 0
  %or.cond.i.i51 = select i1 %tobool.i.i49, i1 true, i1 %tobool1.i.i50
  br i1 %or.cond.i.i51, label %if.then.i.i52, label %_Z20polybench_alloc_datayi.exit53

if.then.i.i52:                                    ; preds = %_Z20polybench_alloc_datayi.exit46
  %12 = load ptr, ptr @stderr, align 8, !tbaa !42
  %13 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %12) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_Z20polybench_alloc_datayi.exit53:                ; preds = %_Z20polybench_alloc_datayi.exit46
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i47) #15
  %14 = sub i64 %1, %5
  %diff.check = icmp ugt i64 %14, -32
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc17_crit_edge.i, %_Z20polybench_alloc_datayi.exit53
  %indvars.iv73.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit53 ], [ %indvars.iv.next74.i, %for.cond1.for.inc17_crit_edge.i ]
  %15 = trunc nuw nsw i64 %indvars.iv73.i to i32
  %conv.i = uitofp nneg i32 %15 to float
  %arrayidx.i = getelementptr inbounds nuw [4096 x i8], ptr %0, i64 %indvars.iv73.i
  %arrayidx14.i = getelementptr inbounds nuw [4096 x i8], ptr %4, i64 %indvars.iv73.i
  br i1 %diff.check, label %for.body3.i, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.i
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.i, i64 0
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
  %22 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 16
  store <4 x float> %20, ptr %22, align 4, !tbaa !10
  store <4 x float> %21, ptr %23, align 4, !tbaa !10
  %24 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14.i, i64 %index
  %25 = getelementptr inbounds nuw i8, ptr %24, i64 16
  store <4 x float> %20, ptr %24, align 4, !tbaa !10
  store <4 x float> %21, ptr %25, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %26 = icmp eq i64 %index.next, 1024
  br i1 %26, label %for.cond1.for.inc17_crit_edge.i, label %vector.body, !llvm.loop !44

for.body3.i:                                      ; preds = %for.cond1.preheader.i, %for.body3.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i.1, %for.body3.i ], [ 0, %for.cond1.preheader.i ]
  %27 = trunc nuw nsw i64 %indvars.iv.i to i32
  %conv4.i = uitofp nneg i32 %27 to float
  %mul.i = fmul nnan float %conv.i, %conv4.i
  %div.i = fmul nnan float %mul.i, f0x3A800000
  %arrayidx7.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %indvars.iv.i
  store float %div.i, ptr %arrayidx7.i, align 4, !tbaa !10
  %arrayidx16.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14.i, i64 %indvars.iv.i
  store float %div.i, ptr %arrayidx16.i, align 4, !tbaa !10
  %indvars.iv.next.i = or disjoint i64 %indvars.iv.i, 1
  %28 = trunc nuw nsw i64 %indvars.iv.next.i to i32
  %conv4.i.1 = uitofp nneg i32 %28 to float
  %mul.i.1 = fmul nnan float %conv.i, %conv4.i.1
  %div.i.1 = fmul nnan float %mul.i.1, f0x3A800000
  %arrayidx7.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %indvars.iv.next.i
  store float %div.i.1, ptr %arrayidx7.i.1, align 4, !tbaa !10
  %arrayidx16.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx14.i, i64 %indvars.iv.next.i
  store float %div.i.1, ptr %arrayidx16.i.1, align 4, !tbaa !10
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %exitcond.not.i.1 = icmp eq i64 %indvars.iv.next.i.1, 1024
  br i1 %exitcond.not.i.1, label %for.cond1.for.inc17_crit_edge.i, label %for.body3.i, !llvm.loop !45

for.cond1.for.inc17_crit_edge.i:                  ; preds = %vector.body, %for.body3.i
  %indvars.iv.next74.i = add nuw nsw i64 %indvars.iv73.i, 1
  %exitcond77.not.i = icmp eq i64 %indvars.iv.next74.i, 1024
  br i1 %exitcond77.not.i, label %for.cond23.preheader.i, label %for.cond1.preheader.i, !llvm.loop !17

for.cond23.preheader.i:                           ; preds = %for.cond1.for.inc17_crit_edge.i, %for.cond23.for.inc38_crit_edge.i
  %indvars.iv83.i = phi i64 [ %indvars.iv.next84.i, %for.cond23.for.inc38_crit_edge.i ], [ 0, %for.cond1.for.inc17_crit_edge.i ]
  %arrayidx32.i = getelementptr inbounds nuw [4096 x i8], ptr %8, i64 %indvars.iv83.i
  %29 = trunc nuw nsw i64 %indvars.iv83.i to i32
  %conv26.i = uitofp nneg i32 %29 to float
  %broadcast.splatinsert82 = insertelement <4 x float> poison, float %conv26.i, i64 0
  %broadcast.splat83 = shufflevector <4 x float> %broadcast.splatinsert82, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body84

vector.body84:                                    ; preds = %vector.body84, %for.cond23.preheader.i
  %index85 = phi i64 [ 0, %for.cond23.preheader.i ], [ %index.next88.1, %vector.body84 ]
  %vec.ind86 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond23.preheader.i ], [ %vec.ind.next89.1, %vector.body84 ]
  %step.add87 = add <4 x i32> %vec.ind86, splat (i32 4)
  %30 = uitofp nneg <4 x i32> %vec.ind86 to <4 x float>
  %31 = uitofp nneg <4 x i32> %step.add87 to <4 x float>
  %32 = fmul nnan <4 x float> %broadcast.splat83, %30
  %33 = fmul nnan <4 x float> %broadcast.splat83, %31
  %34 = fmul nnan <4 x float> %32, splat (float f0x3A800000)
  %35 = fmul nnan <4 x float> %33, splat (float f0x3A800000)
  %36 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx32.i, i64 %index85
  %37 = getelementptr inbounds nuw i8, ptr %36, i64 16
  store <4 x float> %34, ptr %36, align 4, !tbaa !10
  store <4 x float> %35, ptr %37, align 4, !tbaa !10
  %vec.ind.next89 = add <4 x i32> %vec.ind86, splat (i32 8)
  %step.add87.1 = add <4 x i32> %vec.ind86, splat (i32 12)
  %38 = uitofp nneg <4 x i32> %vec.ind.next89 to <4 x float>
  %39 = uitofp nneg <4 x i32> %step.add87.1 to <4 x float>
  %40 = fmul nnan <4 x float> %broadcast.splat83, %38
  %41 = fmul nnan <4 x float> %broadcast.splat83, %39
  %42 = fmul nnan <4 x float> %40, splat (float f0x3A800000)
  %43 = fmul nnan <4 x float> %41, splat (float f0x3A800000)
  %44 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx32.i, i64 %index85
  %45 = getelementptr inbounds nuw i8, ptr %44, i64 32
  %46 = getelementptr inbounds nuw i8, ptr %44, i64 48
  store <4 x float> %42, ptr %45, align 4, !tbaa !10
  store <4 x float> %43, ptr %46, align 4, !tbaa !10
  %index.next88.1 = add nuw nsw i64 %index85, 16
  %vec.ind.next89.1 = add <4 x i32> %vec.ind86, splat (i32 16)
  %47 = icmp eq i64 %index.next88.1, 1024
  br i1 %47, label %for.cond23.for.inc38_crit_edge.i, label %vector.body84, !llvm.loop !46

for.cond23.for.inc38_crit_edge.i:                 ; preds = %vector.body84
  %indvars.iv.next84.i = add nuw nsw i64 %indvars.iv83.i, 1
  %exitcond87.not.i = icmp eq i64 %indvars.iv.next84.i, 1024
  br i1 %exitcond87.not.i, label %_Z11init_arraysiiPfS_PA1024_fS1_S1_.exit, label %for.cond23.preheader.i, !llvm.loop !20

_Z11init_arraysiiPfS_PA1024_fS1_S1_.exit:         ; preds = %for.cond23.for.inc38_crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #15
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #14
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #14
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #14
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #15
  call void @_Z9syr2kCudaiiffPA1024_fS0_S0_S0_(i32 noundef 1024, i32 noundef 1024, float noundef 3.241200e+04, float noundef 2.123000e+03, ptr noundef nonnull %0, ptr noundef nonnull %4, ptr noundef nonnull %8, ptr noundef nonnull %11) #14
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #15
  %call.i.i54 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #16
  %cmp.not.i.i = icmp eq i32 %call.i.i54, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i55

if.then.i.i55:                                    ; preds = %_Z11init_arraysiiPfS_PA1024_fS1_S1_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i54) #14
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z11init_arraysiiPfS_PA1024_fS1_S1_.exit, %if.then.i.i55
  %48 = load i64, ptr %Tp.i.i, align 8, !tbaa !34
  %conv.i.i = sitofp i64 %48 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %49 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !37
  %conv2.i.i = sitofp i64 %49 to double
  %50 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #15
  store double %50, ptr @polybench_t_start, align 8, !tbaa !38
  br label %for.cond1.preheader.i56

for.cond1.preheader.i56:                          ; preds = %for.cond1.for.inc6_crit_edge.i, %_Z21polybench_timer_startv.exit
  %indvars.iv96.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next97.i, %for.cond1.for.inc6_crit_edge.i ]
  %arrayidx.i57 = getelementptr inbounds nuw [4096 x i8], ptr %8, i64 %indvars.iv96.i
  br label %vector.body93

vector.body93:                                    ; preds = %vector.body93, %for.cond1.preheader.i56
  %index94 = phi i64 [ 0, %for.cond1.preheader.i56 ], [ %index.next96.1, %vector.body93 ]
  %51 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i57, i64 %index94
  %52 = getelementptr inbounds nuw i8, ptr %51, i64 16
  %wide.load = load <4 x float>, ptr %51, align 4, !tbaa !10
  %wide.load95 = load <4 x float>, ptr %52, align 4, !tbaa !10
  %53 = fmul <4 x float> %wide.load, splat (float 2.123000e+03)
  %54 = fmul <4 x float> %wide.load95, splat (float 2.123000e+03)
  store <4 x float> %53, ptr %51, align 4, !tbaa !10
  store <4 x float> %54, ptr %52, align 4, !tbaa !10
  %55 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i57, i64 %index94
  %56 = getelementptr inbounds nuw i8, ptr %55, i64 32
  %57 = getelementptr inbounds nuw i8, ptr %55, i64 48
  %wide.load.1 = load <4 x float>, ptr %56, align 4, !tbaa !10
  %wide.load95.1 = load <4 x float>, ptr %57, align 4, !tbaa !10
  %58 = fmul <4 x float> %wide.load.1, splat (float 2.123000e+03)
  %59 = fmul <4 x float> %wide.load95.1, splat (float 2.123000e+03)
  store <4 x float> %58, ptr %56, align 4, !tbaa !10
  store <4 x float> %59, ptr %57, align 4, !tbaa !10
  %index.next96.1 = add nuw nsw i64 %index94, 16
  %60 = icmp eq i64 %index.next96.1, 1024
  br i1 %60, label %for.cond1.for.inc6_crit_edge.i, label %vector.body93, !llvm.loop !47

for.cond1.for.inc6_crit_edge.i:                   ; preds = %vector.body93
  %indvars.iv.next97.i = add nuw nsw i64 %indvars.iv96.i, 1
  %exitcond100.not.i = icmp eq i64 %indvars.iv.next97.i, 1024
  br i1 %exitcond100.not.i, label %for.cond12.preheader.i, label %for.cond1.preheader.i56, !llvm.loop !23

for.cond12.preheader.i:                           ; preds = %for.cond1.for.inc6_crit_edge.i, %for.cond12.for.inc52_crit_edge.i
  %indvars.iv111.i = phi i64 [ %indvars.iv.next112.i, %for.cond12.for.inc52_crit_edge.i ], [ 0, %for.cond1.for.inc6_crit_edge.i ]
  %arrayidx19.i = getelementptr inbounds nuw [4096 x i8], ptr %0, i64 %indvars.iv111.i
  %arrayidx29.i = getelementptr inbounds nuw [4096 x i8], ptr %8, i64 %indvars.iv111.i
  %arrayidx33.i = getelementptr inbounds nuw [4096 x i8], ptr %4, i64 %indvars.iv111.i
  br label %for.cond15.preheader.i

for.cond15.preheader.i:                           ; preds = %for.cond15.for.inc49_crit_edge.i, %for.cond12.preheader.i
  %indvars.iv106.i = phi i64 [ 0, %for.cond12.preheader.i ], [ %indvars.iv.next107.i, %for.cond15.for.inc49_crit_edge.i ]
  %arrayidx24.i = getelementptr inbounds nuw [4096 x i8], ptr %4, i64 %indvars.iv106.i
  %arrayidx31.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx29.i, i64 %indvars.iv106.i
  %arrayidx38.i = getelementptr inbounds nuw [4096 x i8], ptr %0, i64 %indvars.iv106.i
  %arrayidx31.promoted.i = load float, ptr %arrayidx31.i, align 4, !tbaa !10
  br label %for.body17.i

for.body17.i:                                     ; preds = %for.body17.i, %for.cond15.preheader.i
  %indvars.iv101.i = phi i64 [ 0, %for.cond15.preheader.i ], [ %indvars.iv.next102.i, %for.body17.i ]
  %61 = phi float [ %arrayidx31.promoted.i, %for.cond15.preheader.i ], [ %67, %for.body17.i ]
  %arrayidx21.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx19.i, i64 %indvars.iv101.i
  %62 = load float, ptr %arrayidx21.i, align 4, !tbaa !10
  %mul22.i = fmul float %62, 3.241200e+04
  %arrayidx26.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx24.i, i64 %indvars.iv101.i
  %63 = load float, ptr %arrayidx26.i, align 4, !tbaa !10
  %64 = call float @llvm.fmuladd.f32(float %mul22.i, float %63, float %61)
  store float %64, ptr %arrayidx31.i, align 4, !tbaa !10
  %arrayidx35.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx33.i, i64 %indvars.iv101.i
  %65 = load float, ptr %arrayidx35.i, align 4, !tbaa !10
  %mul36.i = fmul float %65, 3.241200e+04
  %arrayidx40.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx38.i, i64 %indvars.iv101.i
  %66 = load float, ptr %arrayidx40.i, align 4, !tbaa !10
  %67 = call float @llvm.fmuladd.f32(float %mul36.i, float %66, float %64)
  store float %67, ptr %arrayidx31.i, align 4, !tbaa !10
  %indvars.iv.next102.i = add nuw nsw i64 %indvars.iv101.i, 1
  %exitcond105.not.i = icmp eq i64 %indvars.iv.next102.i, 1024
  br i1 %exitcond105.not.i, label %for.cond15.for.inc49_crit_edge.i, label %for.body17.i, !llvm.loop !24

for.cond15.for.inc49_crit_edge.i:                 ; preds = %for.body17.i
  %indvars.iv.next107.i = add nuw nsw i64 %indvars.iv106.i, 1
  %exitcond110.not.i = icmp eq i64 %indvars.iv.next107.i, 1024
  br i1 %exitcond110.not.i, label %for.cond12.for.inc52_crit_edge.i, label %for.cond15.preheader.i, !llvm.loop !25

for.cond12.for.inc52_crit_edge.i:                 ; preds = %for.cond15.for.inc49_crit_edge.i
  %indvars.iv.next112.i = add nuw nsw i64 %indvars.iv111.i, 1
  %exitcond115.not.i = icmp eq i64 %indvars.iv.next112.i, 1024
  br i1 %exitcond115.not.i, label %_Z8syr2kCpuiiffPA1024_fS0_S0_.exit, label %for.cond12.preheader.i, !llvm.loop !26

_Z8syr2kCpuiiffPA1024_fS0_S0_.exit:               ; preds = %for.cond12.for.inc52_crit_edge.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i63) #15
  %call.i.i64 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i63, ptr noundef null) #16
  %cmp.not.i.i65 = icmp eq i32 %call.i.i64, 0
  br i1 %cmp.not.i.i65, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i66

if.then.i.i66:                                    ; preds = %_Z8syr2kCpuiiffPA1024_fS0_S0_.exit
  %call1.i.i67 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i64) #14
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z8syr2kCpuiiffPA1024_fS0_S0_.exit, %if.then.i.i66
  %68 = load i64, ptr %Tp.i.i63, align 8, !tbaa !34
  %conv.i.i68 = sitofp i64 %68 to double
  %tv_usec.i.i69 = getelementptr inbounds nuw i8, ptr %Tp.i.i63, i64 8
  %69 = load i64, ptr %tv_usec.i.i69, align 8, !tbaa !37
  %conv2.i.i70 = sitofp i64 %69 to double
  %70 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i70, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i68)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i63) #15
  store double %70, ptr @polybench_t_end, align 8, !tbaa !38
  %71 = load double, ptr @polybench_t_start, align 8, !tbaa !38
  %sub.i = fsub double %70, %71
  %call.i71 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #14
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc14_crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv34.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next35.i, %for.cond1.for.inc14_crit_edge.us.i ]
  %fail.031.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %106, %for.cond1.for.inc14_crit_edge.us.i ]
  %arrayidx.us.i = getelementptr inbounds nuw [4096 x i8], ptr %8, i64 %indvars.iv34.i
  %arrayidx7.us.i = getelementptr inbounds nuw [4096 x i8], ptr %11, i64 %indvars.iv34.i
  %72 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.031.us.i, i64 0
  br label %vector.body100

vector.body100:                                   ; preds = %vector.body100, %for.cond1.preheader.us.i
  %index101 = phi i64 [ 0, %for.cond1.preheader.us.i ], [ %index.next104, %vector.body100 ]
  %vec.phi = phi <4 x i32> [ %72, %for.cond1.preheader.us.i ], [ %104, %vector.body100 ]
  %73 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i, i64 %index101
  %wide.load102 = load <4 x float>, ptr %73, align 4, !tbaa !10
  %74 = fpext <4 x float> %wide.load102 to <4 x double>
  %75 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us.i, i64 %index101
  %wide.load103 = load <4 x float>, ptr %75, align 4, !tbaa !10
  %76 = fpext <4 x float> %wide.load103 to <4 x double>
  %77 = fcmp olt <4 x double> %74, splat (double f0xB690000000000000)
  %78 = fneg <4 x float> %wide.load102
  %79 = select <4 x i1> %77, <4 x float> %78, <4 x float> %wide.load102
  %80 = fpext <4 x float> %79 to <4 x double>
  %81 = fcmp uge <4 x double> %80, splat (double 1.000000e-02)
  %82 = fcmp olt <4 x double> %76, splat (double f0xB690000000000000)
  %83 = fneg <4 x float> %wide.load103
  %84 = select <4 x i1> %82, <4 x float> %83, <4 x float> %wide.load103
  %85 = fpext <4 x float> %84 to <4 x double>
  %86 = fcmp uge <4 x double> %85, splat (double 1.000000e-02)
  %87 = fsub <4 x double> %74, %76
  %88 = fptrunc <4 x double> %87 to <4 x float>
  %89 = fcmp olt <4 x double> %87, splat (double f0xB690000000000000)
  %90 = fneg <4 x float> %88
  %91 = select <4 x i1> %89, <4 x float> %90, <4 x float> %88
  %92 = fadd <4 x double> %74, splat (double f0x3E45798EE0000000)
  %93 = fptrunc <4 x double> %92 to <4 x float>
  %94 = fcmp olt <4 x double> %92, splat (double f0xB690000000000000)
  %95 = fneg <4 x float> %93
  %96 = select <4 x i1> %94, <4 x float> %95, <4 x float> %93
  %97 = fdiv <4 x float> %91, %96
  %98 = fcmp olt <4 x float> %97, zeroinitializer
  %99 = fneg <4 x float> %97
  %100 = select <4 x i1> %98, <4 x float> %99, <4 x float> %97
  %101 = fmul <4 x float> %100, splat (float 1.000000e+02)
  %102 = fpext <4 x float> %101 to <4 x double>
  %103 = fcmp ogt <4 x double> %102, splat (double 5.000000e-02)
  %.not107 = select <4 x i1> %81, <4 x i1> splat (i1 true), <4 x i1> %86
  %narrow = select <4 x i1> %.not107, <4 x i1> %103, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %104 = add <4 x i32> %vec.phi, %predphi
  %index.next104 = add nuw i64 %index101, 4
  %105 = icmp eq i64 %index.next104, 1024
  br i1 %105, label %for.cond1.for.inc14_crit_edge.us.i, label %vector.body100, !llvm.loop !48

for.cond1.for.inc14_crit_edge.us.i:               ; preds = %vector.body100
  %106 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %104)
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond38.not.i = icmp eq i64 %indvars.iv.next35.i, 1024
  br i1 %exitcond38.not.i, label %_Z14compareResultsiPA1024_fS0_.exit, label %for.cond1.preheader.us.i, !llvm.loop !29

_Z14compareResultsiPA1024_fS0_.exit:              ; preds = %for.cond1.for.inc14_crit_edge.us.i
  %call17.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %106) #14
  call void @free(ptr noundef %0) #16
  call void @free(ptr noundef %4) #16
  call void @free(ptr noundef nonnull %8) #16
  call void @free(ptr noundef nonnull %11) #16
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #5 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #15
  store ptr null, ptr %newA.i, align 8, !tbaa !41
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #16
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !41
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !42
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #17
  call void @exit(i32 noundef 1) #18
  unreachable

_ZL7xmallocm.exit:                                ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i) #15
  ret ptr %0
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr noundef captures(none)) local_unnamed_addr #10

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local void @_Z21polybench_flush_cachev() local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local void @_Z29polybench_prepare_instrumentsv() local_unnamed_addr #0 {
entry:
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @gettimeofday(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #6

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #4

; Function Attrs: nofree nounwind
declare i32 @posix_memalign(ptr noundef, i64 noundef, i64 noundef) local_unnamed_addr #6

; Function Attrs: nofree noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #12

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #13

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #4 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { mustprogress nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #6 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #7 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #8 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #9 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #10 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #11 = { nofree noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #12 = { nofree nounwind }
attributes #13 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #14 = { "uniform-work-group-size" }
attributes #15 = { nounwind }
attributes #16 = { nounwind "uniform-work-group-size" }
attributes #17 = { cold }
attributes #18 = { cold noreturn nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}
!llvm.errno.tbaa = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 8]}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 24.0.0git (https://github.com/llvm/llvm-project c45e6b9e4d95fb444eb1308416c10d95350d3c52)"}
!5 = !{!6, !7, i64 0}
!6 = !{!"__libc_errno", !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13, !14, !15}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.isvectorized", i32 1}
!15 = !{!"llvm.loop.unroll.runtime.disable"}
!16 = distinct !{!16, !13, !14}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !13, !14, !15}
!19 = distinct !{!19, !13, !15, !14}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !13, !14, !15}
!22 = distinct !{!22, !13, !15, !14}
!23 = distinct !{!23, !13}
!24 = distinct !{!24, !13}
!25 = distinct !{!25, !13}
!26 = distinct !{!26, !13}
!27 = distinct !{!27, !13, !14, !15}
!28 = distinct !{!28, !13, !15, !14}
!29 = distinct !{!29, !13}
!30 = !{!7, !7, i64 0}
!31 = !{!32, !32, i64 0}
!32 = !{!"p1 float", !33, i64 0}
!33 = !{!"any pointer", !8, i64 0}
!34 = !{!35, !36, i64 0}
!35 = !{!"_ZTS7timeval", !36, i64 0, !36, i64 8}
!36 = !{!"long", !8, i64 0}
!37 = !{!35, !36, i64 8}
!38 = !{!39, !39, i64 0}
!39 = !{!"double", !8, i64 0}
!40 = !{ptr @_Z27__device_stub__syr2k_kerneliiffPfS_S_}
!41 = !{!33, !33, i64 0}
!42 = !{!43, !43, i64 0}
!43 = !{!"p1 _ZTS8_IO_FILE", !33, i64 0}
!44 = distinct !{!44, !13, !14, !15}
!45 = distinct !{!45, !13, !14}
!46 = distinct !{!46, !13, !14, !15}
!47 = distinct !{!47, !13, !14, !15}
!48 = distinct !{!48, !13, !14, !15}
