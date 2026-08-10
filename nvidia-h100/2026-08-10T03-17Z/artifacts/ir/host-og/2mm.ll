; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/2MM/2mm.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/2MM/2mm.cu"
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
define dso_local void @_Z10init_arrayiiiiPfS_PA1024_fS1_S1_S1_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %alpha, ptr nofree noundef writeonly captures(none) initializes((0, 4)) %beta, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B, ptr nofree noundef writeonly captures(none) %C, ptr nofree noundef writeonly captures(none) %D) local_unnamed_addr #1 {
entry:
  store float 3.241200e+04, ptr %alpha, align 4, !tbaa !10
  store float 2.123000e+03, ptr %beta, align 4, !tbaa !10
  %cmp108 = icmp sgt i32 %ni, 0
  %cmp2106 = icmp sgt i32 %nk, 0
  %or.cond = and i1 %cmp108, %cmp2106
  br i1 %or.cond, label %for.cond1.preheader.preheader, label %for.cond10.preheader

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count129 = zext nneg i32 %ni to i64
  %wide.trip.count = zext nneg i32 %nk to i64
  %min.iters.check = icmp ult i32 %nk, 8
  %n.vec = and i64 %wide.trip.count, 2147483640
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc7_crit_edge
  %indvars.iv126 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next127, %for.cond1.for.inc7_crit_edge ]
  %0 = trunc nuw nsw i64 %indvars.iv126 to i32
  %conv = uitofp nneg i32 %0 to float
  %arrayidx = getelementptr inbounds nuw [4096 x i8], ptr %A, i64 %indvars.iv126
  br i1 %min.iters.check, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %1 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %2 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %3 = fmul nnan <4 x float> %broadcast.splat, %1
  %4 = fmul nnan <4 x float> %broadcast.splat, %2
  %5 = fmul nnan <4 x float> %3, splat (float f0x3A800000)
  %6 = fmul nnan <4 x float> %4, splat (float f0x3A800000)
  %7 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 16
  store <4 x float> %5, ptr %7, align 4, !tbaa !10
  store <4 x float> %6, ptr %8, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc7_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader ], [ %n.vec, %middle.block ]
  br label %for.body3

for.cond10.preheader:                             ; preds = %for.cond1.for.inc7_crit_edge, %entry
  %cmp14110 = icmp sgt i32 %nj, 0
  %or.cond122 = and i1 %cmp2106, %cmp14110
  br i1 %or.cond122, label %for.cond13.preheader.preheader, label %for.cond30.preheader

for.cond13.preheader.preheader:                   ; preds = %for.cond10.preheader
  %wide.trip.count139 = zext nneg i32 %nk to i64
  %wide.trip.count134 = zext nneg i32 %nj to i64
  %min.iters.check164 = icmp ult i32 %nj, 8
  %n.vec167 = and i64 %wide.trip.count134, 2147483640
  %cmp.n177 = icmp eq i64 %n.vec167, %wide.trip.count134
  br label %for.cond13.preheader

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %10 = trunc nuw nsw i64 %indvars.iv to i32
  %conv4 = uitofp nneg i32 %10 to float
  %mul = fmul nnan float %conv, %conv4
  %div = fmul nnan float %mul, f0x3A800000
  %arrayidx6 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  store float %div, ptr %arrayidx6, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc7_crit_edge, label %for.body3, !llvm.loop !16

for.cond1.for.inc7_crit_edge:                     ; preds = %for.body3, %middle.block
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond130.not = icmp eq i64 %indvars.iv.next127, %wide.trip.count129
  br i1 %exitcond130.not, label %for.cond10.preheader, label %for.cond1.preheader, !llvm.loop !17

for.cond13.preheader:                             ; preds = %for.cond13.preheader.preheader, %for.cond13.for.inc27_crit_edge
  %indvars.iv136 = phi i64 [ 0, %for.cond13.preheader.preheader ], [ %indvars.iv.next137, %for.cond13.for.inc27_crit_edge ]
  %11 = trunc nuw nsw i64 %indvars.iv136 to i32
  %conv16 = uitofp nneg i32 %11 to float
  %arrayidx21 = getelementptr inbounds nuw [4096 x i8], ptr %B, i64 %indvars.iv136
  br i1 %min.iters.check164, label %for.body15.preheader, label %vector.ph165

vector.ph165:                                     ; preds = %for.cond13.preheader
  %broadcast.splatinsert168 = insertelement <4 x float> poison, float %conv16, i64 0
  %broadcast.splat169 = shufflevector <4 x float> %broadcast.splatinsert168, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body170

vector.body170:                                   ; preds = %vector.body170, %vector.ph165
  %index171 = phi i64 [ 0, %vector.ph165 ], [ %index.next174, %vector.body170 ]
  %vec.ind172 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph165 ], [ %vec.ind.next175, %vector.body170 ]
  %12 = trunc <4 x i64> %vec.ind172 to <4 x i32>
  %13 = add <4 x i32> %12, splat (i32 1)
  %14 = trunc <4 x i64> %vec.ind172 to <4 x i32>
  %15 = add <4 x i32> %14, splat (i32 5)
  %16 = uitofp nneg <4 x i32> %13 to <4 x float>
  %17 = uitofp nneg <4 x i32> %15 to <4 x float>
  %18 = fmul nnan <4 x float> %broadcast.splat169, %16
  %19 = fmul nnan <4 x float> %broadcast.splat169, %17
  %20 = fmul nnan <4 x float> %18, splat (float f0x3A800000)
  %21 = fmul nnan <4 x float> %19, splat (float f0x3A800000)
  %22 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx21, i64 %index171
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 16
  store <4 x float> %20, ptr %22, align 4, !tbaa !10
  store <4 x float> %21, ptr %23, align 4, !tbaa !10
  %index.next174 = add nuw i64 %index171, 8
  %vec.ind.next175 = add nuw <4 x i64> %vec.ind172, splat (i64 8)
  %24 = icmp eq i64 %index.next174, %n.vec167
  br i1 %24, label %middle.block176, label %vector.body170, !llvm.loop !18

middle.block176:                                  ; preds = %vector.body170
  br i1 %cmp.n177, label %for.cond13.for.inc27_crit_edge, label %for.body15.preheader

for.body15.preheader:                             ; preds = %for.cond13.preheader, %middle.block176
  %indvars.iv131.ph = phi i64 [ 0, %for.cond13.preheader ], [ %n.vec167, %middle.block176 ]
  br label %for.body15

for.cond30.preheader:                             ; preds = %for.cond13.for.inc27_crit_edge, %for.cond10.preheader
  %cmp31116 = icmp sgt i32 %nl, 0
  %or.cond123 = and i1 %cmp31116, %cmp14110
  br i1 %or.cond123, label %for.cond33.preheader.preheader, label %for.cond51.preheader

for.cond33.preheader.preheader:                   ; preds = %for.cond30.preheader
  %wide.trip.count150 = zext nneg i32 %nl to i64
  %wide.trip.count145 = zext nneg i32 %nj to i64
  %min.iters.check180 = icmp ult i32 %nj, 8
  %n.vec183 = and i64 %wide.trip.count145, 2147483640
  %cmp.n193 = icmp eq i64 %n.vec183, %wide.trip.count145
  br label %for.cond33.preheader

for.body15:                                       ; preds = %for.body15.preheader, %for.body15
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %for.body15 ], [ %indvars.iv131.ph, %for.body15.preheader ]
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %25 = trunc nuw nsw i64 %indvars.iv.next132 to i32
  %conv17 = uitofp nneg i32 %25 to float
  %mul18 = fmul nnan float %conv16, %conv17
  %div19 = fmul nnan float %mul18, f0x3A800000
  %arrayidx23 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx21, i64 %indvars.iv131
  store float %div19, ptr %arrayidx23, align 4, !tbaa !10
  %exitcond135.not = icmp eq i64 %indvars.iv.next132, %wide.trip.count134
  br i1 %exitcond135.not, label %for.cond13.for.inc27_crit_edge, label %for.body15, !llvm.loop !19

for.cond13.for.inc27_crit_edge:                   ; preds = %for.body15, %middle.block176
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %exitcond140.not = icmp eq i64 %indvars.iv.next137, %wide.trip.count139
  br i1 %exitcond140.not, label %for.cond30.preheader, label %for.cond13.preheader, !llvm.loop !20

for.cond33.preheader:                             ; preds = %for.cond33.preheader.preheader, %for.cond33.for.inc48_crit_edge
  %indvars.iv147 = phi i64 [ 0, %for.cond33.preheader.preheader ], [ %indvars.iv.next148, %for.cond33.for.inc48_crit_edge ]
  %26 = trunc nuw nsw i64 %indvars.iv147 to i32
  %conv36 = uitofp nneg i32 %26 to float
  %arrayidx42 = getelementptr inbounds nuw [4096 x i8], ptr %C, i64 %indvars.iv147
  br i1 %min.iters.check180, label %for.body35.preheader, label %vector.ph181

vector.ph181:                                     ; preds = %for.cond33.preheader
  %broadcast.splatinsert184 = insertelement <4 x float> poison, float %conv36, i64 0
  %broadcast.splat185 = shufflevector <4 x float> %broadcast.splatinsert184, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body186

vector.body186:                                   ; preds = %vector.body186, %vector.ph181
  %index187 = phi i64 [ 0, %vector.ph181 ], [ %index.next190, %vector.body186 ]
  %vec.ind188 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph181 ], [ %vec.ind.next191, %vector.body186 ]
  %27 = add <4 x i32> %vec.ind188, splat (i32 3)
  %28 = add <4 x i32> %vec.ind188, splat (i32 7)
  %29 = uitofp nneg <4 x i32> %27 to <4 x float>
  %30 = uitofp nneg <4 x i32> %28 to <4 x float>
  %31 = fmul nnan <4 x float> %broadcast.splat185, %29
  %32 = fmul nnan <4 x float> %broadcast.splat185, %30
  %33 = fmul nnan <4 x float> %31, splat (float f0x3A800000)
  %34 = fmul nnan <4 x float> %32, splat (float f0x3A800000)
  %35 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx42, i64 %index187
  %36 = getelementptr inbounds nuw i8, ptr %35, i64 16
  store <4 x float> %33, ptr %35, align 4, !tbaa !10
  store <4 x float> %34, ptr %36, align 4, !tbaa !10
  %index.next190 = add nuw i64 %index187, 8
  %vec.ind.next191 = add <4 x i32> %vec.ind188, splat (i32 8)
  %37 = icmp eq i64 %index.next190, %n.vec183
  br i1 %37, label %middle.block192, label %vector.body186, !llvm.loop !21

middle.block192:                                  ; preds = %vector.body186
  br i1 %cmp.n193, label %for.cond33.for.inc48_crit_edge, label %for.body35.preheader

for.body35.preheader:                             ; preds = %for.cond33.preheader, %middle.block192
  %indvars.iv141.ph = phi i64 [ 0, %for.cond33.preheader ], [ %n.vec183, %middle.block192 ]
  br label %for.body35

for.cond51.preheader:                             ; preds = %for.cond33.for.inc48_crit_edge, %for.cond30.preheader
  %or.cond124 = and i1 %cmp108, %cmp31116
  br i1 %or.cond124, label %for.cond54.preheader.preheader, label %for.end71

for.cond54.preheader.preheader:                   ; preds = %for.cond51.preheader
  %wide.trip.count161 = zext nneg i32 %ni to i64
  %wide.trip.count156 = zext nneg i32 %nl to i64
  %min.iters.check196 = icmp ult i32 %nl, 8
  %n.vec199 = and i64 %wide.trip.count156, 2147483640
  %cmp.n209 = icmp eq i64 %n.vec199, %wide.trip.count156
  br label %for.cond54.preheader

for.body35:                                       ; preds = %for.body35.preheader, %for.body35
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %for.body35 ], [ %indvars.iv141.ph, %for.body35.preheader ]
  %38 = trunc i64 %indvars.iv141 to i32
  %39 = add i32 %38, 3
  %conv38 = uitofp nneg i32 %39 to float
  %mul39 = fmul nnan float %conv36, %conv38
  %div40 = fmul nnan float %mul39, f0x3A800000
  %arrayidx44 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx42, i64 %indvars.iv141
  store float %div40, ptr %arrayidx44, align 4, !tbaa !10
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %exitcond146.not = icmp eq i64 %indvars.iv.next142, %wide.trip.count145
  br i1 %exitcond146.not, label %for.cond33.for.inc48_crit_edge, label %for.body35, !llvm.loop !22

for.cond33.for.inc48_crit_edge:                   ; preds = %for.body35, %middle.block192
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %exitcond151.not = icmp eq i64 %indvars.iv.next148, %wide.trip.count150
  br i1 %exitcond151.not, label %for.cond51.preheader, label %for.cond33.preheader, !llvm.loop !23

for.cond54.preheader:                             ; preds = %for.cond54.preheader.preheader, %for.cond54.for.inc69_crit_edge
  %indvars.iv158 = phi i64 [ 0, %for.cond54.preheader.preheader ], [ %indvars.iv.next159, %for.cond54.for.inc69_crit_edge ]
  %40 = trunc nuw nsw i64 %indvars.iv158 to i32
  %conv57 = uitofp nneg i32 %40 to float
  %arrayidx63 = getelementptr inbounds nuw [4096 x i8], ptr %D, i64 %indvars.iv158
  br i1 %min.iters.check196, label %for.body56.preheader, label %vector.ph197

vector.ph197:                                     ; preds = %for.cond54.preheader
  %broadcast.splatinsert200 = insertelement <4 x float> poison, float %conv57, i64 0
  %broadcast.splat201 = shufflevector <4 x float> %broadcast.splatinsert200, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body202

vector.body202:                                   ; preds = %vector.body202, %vector.ph197
  %index203 = phi i64 [ 0, %vector.ph197 ], [ %index.next206, %vector.body202 ]
  %vec.ind204 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph197 ], [ %vec.ind.next207, %vector.body202 ]
  %41 = add <4 x i32> %vec.ind204, splat (i32 2)
  %42 = add <4 x i32> %vec.ind204, splat (i32 6)
  %43 = uitofp nneg <4 x i32> %41 to <4 x float>
  %44 = uitofp nneg <4 x i32> %42 to <4 x float>
  %45 = fmul nnan <4 x float> %broadcast.splat201, %43
  %46 = fmul nnan <4 x float> %broadcast.splat201, %44
  %47 = fmul nnan <4 x float> %45, splat (float f0x3A800000)
  %48 = fmul nnan <4 x float> %46, splat (float f0x3A800000)
  %49 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx63, i64 %index203
  %50 = getelementptr inbounds nuw i8, ptr %49, i64 16
  store <4 x float> %47, ptr %49, align 4, !tbaa !10
  store <4 x float> %48, ptr %50, align 4, !tbaa !10
  %index.next206 = add nuw i64 %index203, 8
  %vec.ind.next207 = add <4 x i32> %vec.ind204, splat (i32 8)
  %51 = icmp eq i64 %index.next206, %n.vec199
  br i1 %51, label %middle.block208, label %vector.body202, !llvm.loop !24

middle.block208:                                  ; preds = %vector.body202
  br i1 %cmp.n209, label %for.cond54.for.inc69_crit_edge, label %for.body56.preheader

for.body56.preheader:                             ; preds = %for.cond54.preheader, %middle.block208
  %indvars.iv152.ph = phi i64 [ 0, %for.cond54.preheader ], [ %n.vec199, %middle.block208 ]
  br label %for.body56

for.body56:                                       ; preds = %for.body56.preheader, %for.body56
  %indvars.iv152 = phi i64 [ %indvars.iv.next153, %for.body56 ], [ %indvars.iv152.ph, %for.body56.preheader ]
  %52 = trunc i64 %indvars.iv152 to i32
  %53 = add i32 %52, 2
  %conv59 = uitofp nneg i32 %53 to float
  %mul60 = fmul nnan float %conv57, %conv59
  %div61 = fmul nnan float %mul60, f0x3A800000
  %arrayidx65 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx63, i64 %indvars.iv152
  store float %div61, ptr %arrayidx65, align 4, !tbaa !10
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %exitcond157.not = icmp eq i64 %indvars.iv.next153, %wide.trip.count156
  br i1 %exitcond157.not, label %for.cond54.for.inc69_crit_edge, label %for.body56, !llvm.loop !25

for.cond54.for.inc69_crit_edge:                   ; preds = %for.body56, %middle.block208
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond162.not = icmp eq i64 %indvars.iv.next159, %wide.trip.count161
  br i1 %exitcond162.not, label %for.end71, label %for.cond54.preheader, !llvm.loop !26

for.end71:                                        ; preds = %for.cond54.for.inc69_crit_edge, %for.cond51.preheader
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiiPA1024_fS0_(i32 noundef %ni, i32 noundef %nl, ptr nofree noundef readonly captures(none) %D, ptr nofree noundef readonly captures(none) %D_outputFromGpu) local_unnamed_addr #3 {
entry:
  %cmp28 = icmp sgt i32 %ni, 0
  %cmp225 = icmp sgt i32 %nl, 0
  %or.cond = and i1 %cmp28, %cmp225
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end16

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count37 = zext nneg i32 %ni to i64
  %wide.trip.count = zext nneg i32 %nl to i64
  %min.iters.check = icmp ult i32 %nl, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc14_crit_edge.us
  %indvars.iv34 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next35, %for.cond1.for.inc14_crit_edge.us ]
  %fail.030.us = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds nuw [4096 x i8], ptr %D, i64 %indvars.iv34
  %arrayidx7.us = getelementptr inbounds nuw [4096 x i8], ptr %D_outputFromGpu, i64 %indvars.iv34
  br i1 %min.iters.check, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader.us
  %0 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.030.us, i64 0
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
  %fail.127.us.ph = phi i32 [ %fail.030.us, %for.cond1.preheader.us ], [ %34, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %_Z11percentDiffdd.exit.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %fail.127.us = phi i32 [ %fail.2.us, %_Z11percentDiffdd.exit.us ], [ %fail.127.us.ph, %for.body3.us.preheader ]
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
  %fail.2.us = add nsw i32 %retval.0.i.us, %fail.127.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc14_crit_edge.us, label %for.body3.us, !llvm.loop !28

for.cond1.for.inc14_crit_edge.us:                 ; preds = %_Z11percentDiffdd.exit.us, %middle.block
  %fail.2.us.lcssa = phi i32 [ %34, %middle.block ], [ %fail.2.us, %_Z11percentDiffdd.exit.us ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38.not = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38.not, label %for.end16, label %for.cond1.preheader.us, !llvm.loop !29

for.end16:                                        ; preds = %for.cond1.for.inc14_crit_edge.us, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %fail.2.us.lcssa, %for.cond1.for.inc14_crit_edge.us ]
  %call17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %fail.0.lcssa) #16
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: mustprogress uwtable
define dso_local void @_Z13GPU_argv_initv() local_unnamed_addr #5 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp) #17
  %call = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp, i32 noundef 0) #16
  %call1 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp) #16
  %call2 = call i32 @cudaSetDevice(i32 noundef 0) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp) #17
  ret void
}

declare i32 @cudaGetDeviceProperties_v2(ptr noundef, i32 noundef) local_unnamed_addr #6

declare i32 @cudaSetDevice(i32 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__mm2_kernel1iiiiffPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, float noundef %alpha, float noundef %beta, ptr noundef %tmp, ptr noundef %A, ptr noundef %B) #7 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca float, align 4
  %beta.addr = alloca float, align 4
  %tmp.addr = alloca ptr, align 8
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !30
  store i32 %nk, ptr %nk.addr, align 4, !tbaa !30
  store i32 %nl, ptr %nl.addr, align 4, !tbaa !30
  store float %alpha, ptr %alpha.addr, align 4, !tbaa !10
  store float %beta, ptr %beta.addr, align 4, !tbaa !10
  store ptr %tmp, ptr %tmp.addr, align 8, !tbaa !31
  store ptr %A, ptr %A.addr, align 8, !tbaa !31
  store ptr %B, ptr %B.addr, align 8, !tbaa !31
  %kernel_args1 = alloca [9 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %nk.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %nl.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %alpha.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %beta.addr, ptr %4, align 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 48
  store ptr %tmp.addr, ptr %5, align 16
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 56
  store ptr %A.addr, ptr %6, align 8
  %7 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 64
  store ptr %B.addr, ptr %7, align 16
  %8 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %9 = load i64, ptr %shmem_size, align 8
  %10 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm2_kernel1iiiiffPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %9, ptr noundef %10)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__mm2_kernel2iiiiffPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, float noundef %alpha, float noundef %beta, ptr noundef %tmp, ptr noundef %C, ptr noundef %D) #7 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca float, align 4
  %beta.addr = alloca float, align 4
  %tmp.addr = alloca ptr, align 8
  %C.addr = alloca ptr, align 8
  %D.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !30
  store i32 %nk, ptr %nk.addr, align 4, !tbaa !30
  store i32 %nl, ptr %nl.addr, align 4, !tbaa !30
  store float %alpha, ptr %alpha.addr, align 4, !tbaa !10
  store float %beta, ptr %beta.addr, align 4, !tbaa !10
  store ptr %tmp, ptr %tmp.addr, align 8, !tbaa !31
  store ptr %C, ptr %C.addr, align 8, !tbaa !31
  store ptr %D, ptr %D.addr, align 8, !tbaa !31
  %kernel_args1 = alloca [9 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %nk.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %nl.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %alpha.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %beta.addr, ptr %4, align 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 48
  store ptr %tmp.addr, ptr %5, align 16
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 56
  store ptr %C.addr, ptr %6, align 8
  %7 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 64
  store ptr %D.addr, ptr %7, align 16
  %8 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %9 = load i64, ptr %shmem_size, align 8
  %10 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm2_kernel2iiiiffPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %9, ptr noundef %10)
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z7mm2_cpuiiiiffPA1024_fS0_S0_S0_S0_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, float noundef %alpha, float noundef %beta, ptr nofree noundef captures(none) %tmp, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef readonly captures(none) %C, ptr nofree noundef captures(none) %D) local_unnamed_addr #8 {
entry:
  %cmp98 = icmp sgt i32 %ni, 0
  br i1 %cmp98, label %for.cond1.preheader.lr.ph, label %for.end63

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp296 = icmp sgt i32 %nj, 0
  br i1 %cmp296, label %for.cond1.preheader.lr.ph.split, label %for.cond31.preheader.lr.ph

for.cond1.preheader.lr.ph.split:                  ; preds = %for.cond1.preheader.lr.ph
  %cmp794 = icmp sgt i32 %nk, 0
  br i1 %cmp794, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph.split
  %0 = zext nneg i32 %nj to i64
  %1 = shl nuw nsw i64 %0, 2
  %wide.trip.count = zext nneg i32 %ni to i64
  %xtraiter = and i64 %wide.trip.count, 7
  %2 = icmp ult i32 %ni, 8
  br i1 %2, label %for.cond1.preheader.epil.preheader, label %for.cond1.preheader.preheader.new

for.cond1.preheader.preheader.new:                ; preds = %for.cond1.preheader.preheader
  %unroll_iter = and i64 %wide.trip.count, 2147483640
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph.split
  %wide.trip.count130 = zext nneg i32 %ni to i64
  %wide.trip.count125 = zext nneg i32 %nj to i64
  %wide.trip.count117 = zext nneg i32 %nk to i64
  %xtraiter163 = and i64 %wide.trip.count117, 1
  %3 = icmp eq i32 %nk, 1
  %unroll_iter167 = and i64 %wide.trip.count117, 2147483646
  %lcmp.mod165.not = icmp eq i64 %xtraiter163, 0
  %lcmp.mod166 = trunc i32 %nk to i1
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc25_crit_edge.split.us.us
  %indvars.iv127 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next128, %for.cond1.for.inc25_crit_edge.split.us.us ]
  %arrayidx.us = getelementptr inbounds nuw [4096 x i8], ptr %tmp, i64 %indvars.iv127
  %arrayidx10.us = getelementptr inbounds nuw [4096 x i8], ptr %A, i64 %indvars.iv127
  br label %for.body3.us.us

for.body3.us.us:                                  ; preds = %for.cond6.for.inc22_crit_edge.us.us, %for.cond1.preheader.us
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %for.cond6.for.inc22_crit_edge.us.us ], [ 0, %for.cond1.preheader.us ]
  %arrayidx5.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %indvars.iv122
  store float 0.000000e+00, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %invariant.gep.us.us = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv122
  br i1 %3, label %for.body8.us.us.epil.preheader, label %for.body8.us.us

for.body8.us.us:                                  ; preds = %for.body3.us.us, %for.body8.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body8.us.us ], [ 0, %for.body3.us.us ]
  %4 = phi float [ %10, %for.body8.us.us ], [ 0.000000e+00, %for.body3.us.us ]
  %niter168 = phi i64 [ %niter168.next.1, %for.body8.us.us ], [ 0, %for.body3.us.us ]
  %arrayidx12.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us, i64 %indvars.iv
  %5 = load float, ptr %arrayidx12.us.us, align 4, !tbaa !10
  %mul.us.us = fmul float %alpha, %5
  %gep.us.us = getelementptr inbounds nuw [4096 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv
  %6 = load float, ptr %gep.us.us, align 4, !tbaa !10
  %7 = tail call float @llvm.fmuladd.f32(float %mul.us.us, float %6, float %4)
  store float %7, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %indvars.iv.next = or disjoint i64 %indvars.iv, 1
  %arrayidx12.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us, i64 %indvars.iv.next
  %8 = load float, ptr %arrayidx12.us.us.1, align 4, !tbaa !10
  %mul.us.us.1 = fmul float %alpha, %8
  %gep.us.us.1 = getelementptr inbounds nuw [4096 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv.next
  %9 = load float, ptr %gep.us.us.1, align 4, !tbaa !10
  %10 = tail call float @llvm.fmuladd.f32(float %mul.us.us.1, float %9, float %7)
  store float %10, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %niter168.next.1 = add i64 %niter168, 2
  %niter168.ncmp.1 = icmp eq i64 %niter168.next.1, %unroll_iter167
  br i1 %niter168.ncmp.1, label %for.cond6.for.inc22_crit_edge.us.us.unr-lcssa, label %for.body8.us.us, !llvm.loop !34

for.cond6.for.inc22_crit_edge.us.us.unr-lcssa:    ; preds = %for.body8.us.us
  br i1 %lcmp.mod165.not, label %for.cond6.for.inc22_crit_edge.us.us, label %for.body8.us.us.epil.preheader

for.body8.us.us.epil.preheader:                   ; preds = %for.cond6.for.inc22_crit_edge.us.us.unr-lcssa, %for.body3.us.us
  %indvars.iv.epil.init = phi i64 [ 0, %for.body3.us.us ], [ %indvars.iv.next.1, %for.cond6.for.inc22_crit_edge.us.us.unr-lcssa ]
  %.epil.init = phi float [ 0.000000e+00, %for.body3.us.us ], [ %10, %for.cond6.for.inc22_crit_edge.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod166)
  %arrayidx12.us.us.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us, i64 %indvars.iv.epil.init
  %11 = load float, ptr %arrayidx12.us.us.epil, align 4, !tbaa !10
  %mul.us.us.epil = fmul float %alpha, %11
  %gep.us.us.epil = getelementptr inbounds nuw [4096 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv.epil.init
  %12 = load float, ptr %gep.us.us.epil, align 4, !tbaa !10
  %13 = tail call float @llvm.fmuladd.f32(float %mul.us.us.epil, float %12, float %.epil.init)
  store float %13, ptr %arrayidx5.us.us, align 4, !tbaa !10
  br label %for.cond6.for.inc22_crit_edge.us.us

for.cond6.for.inc22_crit_edge.us.us:              ; preds = %for.cond6.for.inc22_crit_edge.us.us.unr-lcssa, %for.body8.us.us.epil.preheader
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond126.not = icmp eq i64 %indvars.iv.next123, %wide.trip.count125
  br i1 %exitcond126.not, label %for.cond1.for.inc25_crit_edge.split.us.us, label %for.body3.us.us, !llvm.loop !35

for.cond1.for.inc25_crit_edge.split.us.us:        ; preds = %for.cond6.for.inc22_crit_edge.us.us
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond131.not = icmp eq i64 %indvars.iv.next128, %wide.trip.count130
  br i1 %exitcond131.not, label %for.cond28.preheader, label %for.cond1.preheader.us, !llvm.loop !36

for.cond1.preheader:                              ; preds = %for.cond1.preheader, %for.cond1.preheader.preheader.new
  %indvar = phi i64 [ 0, %for.cond1.preheader.preheader.new ], [ %indvar.next.7, %for.cond1.preheader ]
  %niter = phi i64 [ 0, %for.cond1.preheader.preheader.new ], [ %niter.next.7, %for.cond1.preheader ]
  %14 = shl nuw nsw i64 %indvar, 12
  %scevgep = getelementptr nuw i8, ptr %tmp, i64 %14
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next = shl i64 %indvar, 12
  %15 = getelementptr nuw i8, ptr %tmp, i64 %indvar.next
  %scevgep.1 = getelementptr nuw i8, ptr %15, i64 4096
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.1, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.1 = shl i64 %indvar, 12
  %16 = getelementptr nuw i8, ptr %tmp, i64 %indvar.next.1
  %scevgep.2 = getelementptr nuw i8, ptr %16, i64 8192
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.2, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.2 = shl i64 %indvar, 12
  %17 = getelementptr nuw i8, ptr %tmp, i64 %indvar.next.2
  %scevgep.3 = getelementptr nuw i8, ptr %17, i64 12288
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.3, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.3 = shl i64 %indvar, 12
  %18 = getelementptr nuw i8, ptr %tmp, i64 %indvar.next.3
  %scevgep.4 = getelementptr nuw i8, ptr %18, i64 16384
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.4, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.4 = shl i64 %indvar, 12
  %19 = getelementptr nuw i8, ptr %tmp, i64 %indvar.next.4
  %scevgep.5 = getelementptr nuw i8, ptr %19, i64 20480
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.5, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.5 = shl i64 %indvar, 12
  %20 = getelementptr nuw i8, ptr %tmp, i64 %indvar.next.5
  %scevgep.6 = getelementptr nuw i8, ptr %20, i64 24576
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.6, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.6 = shl i64 %indvar, 12
  %21 = getelementptr nuw i8, ptr %tmp, i64 %indvar.next.6
  %scevgep.7 = getelementptr nuw i8, ptr %21, i64 28672
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.7, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.7 = add nuw nsw i64 %indvar, 8
  %niter.next.7 = add i64 %niter, 8
  %niter.ncmp.7 = icmp eq i64 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.cond31.preheader.lr.ph.loopexit.unr-lcssa, label %for.cond1.preheader, !llvm.loop !36

for.cond28.preheader:                             ; preds = %for.cond1.for.inc25_crit_edge.split.us.us
  %cmp32104 = icmp sgt i32 %nl, 0
  br i1 %cmp32104, label %for.cond31.preheader.lr.ph.split, label %for.end63

for.cond31.preheader.lr.ph.loopexit.unr-lcssa:    ; preds = %for.cond1.preheader
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.cond31.preheader.lr.ph, label %for.cond1.preheader.epil.preheader

for.cond1.preheader.epil.preheader:               ; preds = %for.cond31.preheader.lr.ph.loopexit.unr-lcssa, %for.cond1.preheader.preheader
  %indvar.epil.init = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvar.next.7, %for.cond31.preheader.lr.ph.loopexit.unr-lcssa ]
  %lcmp.mod162 = icmp ne i64 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod162)
  br label %for.cond1.preheader.epil

for.cond1.preheader.epil:                         ; preds = %for.cond1.preheader.epil, %for.cond1.preheader.epil.preheader
  %indvar.epil = phi i64 [ %indvar.epil.init, %for.cond1.preheader.epil.preheader ], [ %indvar.next.epil, %for.cond1.preheader.epil ]
  %epil.iter = phi i64 [ 0, %for.cond1.preheader.epil.preheader ], [ %epil.iter.next, %for.cond1.preheader.epil ]
  %22 = shl nuw nsw i64 %indvar.epil, 12
  %scevgep.epil = getelementptr nuw i8, ptr %tmp, i64 %22
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.epil, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.epil = add nuw nsw i64 %indvar.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.cond31.preheader.lr.ph, label %for.cond1.preheader.epil, !llvm.loop !37

for.cond31.preheader.lr.ph:                       ; preds = %for.cond31.preheader.lr.ph.loopexit.unr-lcssa, %for.cond1.preheader.epil, %for.cond1.preheader.lr.ph
  %cmp32104.old = icmp sgt i32 %nl, 0
  br i1 %cmp32104.old, label %for.cond31.preheader.lr.ph.split, label %for.end63

for.cond31.preheader.lr.ph.split:                 ; preds = %for.cond28.preheader, %for.cond31.preheader.lr.ph
  %cmp40102 = icmp sgt i32 %nj, 0
  %wide.trip.count155 = zext nneg i32 %ni to i64
  %wide.trip.count150 = zext i32 %nl to i64
  br i1 %cmp40102, label %for.cond31.preheader.us.preheader, label %for.cond31.preheader.preheader

for.cond31.preheader.preheader:                   ; preds = %for.cond31.preheader.lr.ph.split
  %min.iters.check = icmp ult i32 %nl, 8
  %n.vec = and i64 %wide.trip.count150, 4294967288
  %broadcast.splatinsert = insertelement <4 x float> poison, float %beta, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count150
  br label %for.cond31.preheader

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph.split
  %wide.trip.count145 = zext nneg i32 %nj to i64
  %xtraiter169 = and i64 %wide.trip.count145, 1
  %23 = icmp eq i32 %nj, 1
  %unroll_iter175 = and i64 %wide.trip.count145, 2147483646
  %lcmp.mod173.not = icmp eq i64 %xtraiter169, 0
  %lcmp.mod174 = trunc i32 %nj to i1
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc61_crit_edge.split.us.us
  %indvars.iv152 = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next153, %for.cond31.for.inc61_crit_edge.split.us.us ]
  %arrayidx35.us = getelementptr inbounds nuw [4096 x i8], ptr %D, i64 %indvars.iv152
  %arrayidx43.us = getelementptr inbounds nuw [4096 x i8], ptr %tmp, i64 %indvars.iv152
  br label %for.body33.us.us

for.body33.us.us:                                 ; preds = %for.cond39.for.inc58_crit_edge.us.us, %for.cond31.preheader.us
  %indvars.iv147 = phi i64 [ %indvars.iv.next148, %for.cond39.for.inc58_crit_edge.us.us ], [ 0, %for.cond31.preheader.us ]
  %arrayidx37.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx35.us, i64 %indvars.iv147
  %24 = load float, ptr %arrayidx37.us.us, align 4, !tbaa !10
  %mul38.us.us = fmul float %beta, %24
  store float %mul38.us.us, ptr %arrayidx37.us.us, align 4, !tbaa !10
  %invariant.gep.us.us108 = getelementptr inbounds nuw [4 x i8], ptr %C, i64 %indvars.iv147
  br i1 %23, label %for.body41.us.us.epil.preheader, label %for.body41.us.us

for.body41.us.us:                                 ; preds = %for.body33.us.us, %for.body41.us.us
  %indvars.iv142 = phi i64 [ %indvars.iv.next143.1, %for.body41.us.us ], [ 0, %for.body33.us.us ]
  %25 = phi float [ %31, %for.body41.us.us ], [ %mul38.us.us, %for.body33.us.us ]
  %niter176 = phi i64 [ %niter176.next.1, %for.body41.us.us ], [ 0, %for.body33.us.us ]
  %arrayidx45.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx43.us, i64 %indvars.iv142
  %26 = load float, ptr %arrayidx45.us.us, align 4, !tbaa !10
  %gep.us.us109 = getelementptr inbounds nuw [4096 x i8], ptr %invariant.gep.us.us108, i64 %indvars.iv142
  %27 = load float, ptr %gep.us.us109, align 4, !tbaa !10
  %28 = tail call float @llvm.fmuladd.f32(float %26, float %27, float %25)
  store float %28, ptr %arrayidx37.us.us, align 4, !tbaa !10
  %indvars.iv.next143 = or disjoint i64 %indvars.iv142, 1
  %arrayidx45.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx43.us, i64 %indvars.iv.next143
  %29 = load float, ptr %arrayidx45.us.us.1, align 4, !tbaa !10
  %gep.us.us109.1 = getelementptr inbounds nuw [4096 x i8], ptr %invariant.gep.us.us108, i64 %indvars.iv.next143
  %30 = load float, ptr %gep.us.us109.1, align 4, !tbaa !10
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %28)
  store float %31, ptr %arrayidx37.us.us, align 4, !tbaa !10
  %indvars.iv.next143.1 = add nuw nsw i64 %indvars.iv142, 2
  %niter176.next.1 = add i64 %niter176, 2
  %niter176.ncmp.1 = icmp eq i64 %niter176.next.1, %unroll_iter175
  br i1 %niter176.ncmp.1, label %for.cond39.for.inc58_crit_edge.us.us.unr-lcssa, label %for.body41.us.us, !llvm.loop !39

for.cond39.for.inc58_crit_edge.us.us.unr-lcssa:   ; preds = %for.body41.us.us
  br i1 %lcmp.mod173.not, label %for.cond39.for.inc58_crit_edge.us.us, label %for.body41.us.us.epil.preheader

for.body41.us.us.epil.preheader:                  ; preds = %for.cond39.for.inc58_crit_edge.us.us.unr-lcssa, %for.body33.us.us
  %indvars.iv142.epil.init = phi i64 [ 0, %for.body33.us.us ], [ %indvars.iv.next143.1, %for.cond39.for.inc58_crit_edge.us.us.unr-lcssa ]
  %.epil.init172 = phi float [ %mul38.us.us, %for.body33.us.us ], [ %31, %for.cond39.for.inc58_crit_edge.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod174)
  %arrayidx45.us.us.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx43.us, i64 %indvars.iv142.epil.init
  %32 = load float, ptr %arrayidx45.us.us.epil, align 4, !tbaa !10
  %gep.us.us109.epil = getelementptr inbounds nuw [4096 x i8], ptr %invariant.gep.us.us108, i64 %indvars.iv142.epil.init
  %33 = load float, ptr %gep.us.us109.epil, align 4, !tbaa !10
  %34 = tail call float @llvm.fmuladd.f32(float %32, float %33, float %.epil.init172)
  store float %34, ptr %arrayidx37.us.us, align 4, !tbaa !10
  br label %for.cond39.for.inc58_crit_edge.us.us

for.cond39.for.inc58_crit_edge.us.us:             ; preds = %for.cond39.for.inc58_crit_edge.us.us.unr-lcssa, %for.body41.us.us.epil.preheader
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %exitcond151.not = icmp eq i64 %indvars.iv.next148, %wide.trip.count150
  br i1 %exitcond151.not, label %for.cond31.for.inc61_crit_edge.split.us.us, label %for.body33.us.us, !llvm.loop !40

for.cond31.for.inc61_crit_edge.split.us.us:       ; preds = %for.cond39.for.inc58_crit_edge.us.us
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %exitcond156.not = icmp eq i64 %indvars.iv.next153, %wide.trip.count155
  br i1 %exitcond156.not, label %for.end63, label %for.cond31.preheader.us, !llvm.loop !41

for.cond31.preheader:                             ; preds = %for.cond31.preheader.preheader, %for.cond31.for.inc61_crit_edge.split
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %for.cond31.for.inc61_crit_edge.split ], [ 0, %for.cond31.preheader.preheader ]
  %arrayidx35 = getelementptr inbounds nuw [4096 x i8], ptr %D, i64 %indvars.iv137
  br i1 %min.iters.check, label %for.body33.preheader, label %vector.body

vector.body:                                      ; preds = %for.cond31.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %for.cond31.preheader ]
  %35 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx35, i64 %index
  %36 = getelementptr inbounds nuw i8, ptr %35, i64 16
  %wide.load = load <4 x float>, ptr %35, align 4, !tbaa !10
  %wide.load160 = load <4 x float>, ptr %36, align 4, !tbaa !10
  %37 = fmul <4 x float> %broadcast.splat, %wide.load
  %38 = fmul <4 x float> %broadcast.splat, %wide.load160
  store <4 x float> %37, ptr %35, align 4, !tbaa !10
  store <4 x float> %38, ptr %36, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 8
  %39 = icmp eq i64 %index.next, %n.vec
  br i1 %39, label %middle.block, label %vector.body, !llvm.loop !42

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond31.for.inc61_crit_edge.split, label %for.body33.preheader

for.body33.preheader:                             ; preds = %for.cond31.preheader, %middle.block
  %indvars.iv132.ph = phi i64 [ 0, %for.cond31.preheader ], [ %n.vec, %middle.block ]
  br label %for.body33

for.body33:                                       ; preds = %for.body33.preheader, %for.body33
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %for.body33 ], [ %indvars.iv132.ph, %for.body33.preheader ]
  %arrayidx37 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx35, i64 %indvars.iv132
  %40 = load float, ptr %arrayidx37, align 4, !tbaa !10
  %mul38 = fmul float %beta, %40
  store float %mul38, ptr %arrayidx37, align 4, !tbaa !10
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond136.not = icmp eq i64 %indvars.iv.next133, %wide.trip.count150
  br i1 %exitcond136.not, label %for.cond31.for.inc61_crit_edge.split, label %for.body33, !llvm.loop !43

for.cond31.for.inc61_crit_edge.split:             ; preds = %for.body33, %middle.block
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond141.not = icmp eq i64 %indvars.iv.next138, %wide.trip.count155
  br i1 %exitcond141.not, label %for.end63, label %for.cond31.preheader, !llvm.loop !41

for.end63:                                        ; preds = %for.cond31.for.inc61_crit_edge.split, %for.cond31.for.inc61_crit_edge.split.us.us, %entry, %for.cond31.preheader.lr.ph, %for.cond28.preheader
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #9

; Function Attrs: mustprogress uwtable
define dso_local void @_Z7mm2CudaiiiiffPA1024_fS0_S0_S0_S0_S0_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, float noundef %alpha, float noundef %beta, ptr noundef %tmp, ptr noundef %A, ptr noundef %B, ptr noundef %C, ptr noundef %D, ptr noundef %D_outputFromGpu) local_unnamed_addr #5 {
entry:
  %Tp.i.i76 = alloca %struct.timeval, align 8
  %ni.addr.i57 = alloca i32, align 4
  %nj.addr.i58 = alloca i32, align 4
  %nk.addr.i59 = alloca i32, align 4
  %nl.addr.i60 = alloca i32, align 4
  %alpha.addr.i61 = alloca float, align 4
  %beta.addr.i62 = alloca float, align 4
  %tmp.addr.i63 = alloca ptr, align 8
  %C.addr.i = alloca ptr, align 8
  %D.addr.i = alloca ptr, align 8
  %grid_dim.i64 = alloca %struct.dim3, align 8
  %block_dim.i65 = alloca %struct.dim3, align 8
  %shmem_size.i66 = alloca i64, align 8
  %stream.i67 = alloca ptr, align 8
  %kernel_args1.i68 = alloca [9 x ptr], align 16
  %ni.addr.i = alloca i32, align 4
  %nj.addr.i = alloca i32, align 4
  %nk.addr.i = alloca i32, align 4
  %nl.addr.i = alloca i32, align 4
  %alpha.addr.i = alloca float, align 4
  %beta.addr.i = alloca float, align 4
  %tmp.addr.i = alloca ptr, align 8
  %A.addr.i = alloca ptr, align 8
  %B.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [9 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %tmp_gpu = alloca ptr, align 8
  %A_gpu = alloca ptr, align 8
  %B_gpu = alloca ptr, align 8
  %C_gpu = alloca ptr, align 8
  %D_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %tmp_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %B_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %C_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %D_gpu) #17
  %call = call i32 @cudaMalloc(ptr noundef nonnull %tmp_gpu, i64 noundef 4194304) #16
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 4194304) #16
  %call2 = call i32 @cudaMalloc(ptr noundef nonnull %B_gpu, i64 noundef 4194304) #16
  %call3 = call i32 @cudaMalloc(ptr noundef nonnull %C_gpu, i64 noundef 4194304) #16
  %call4 = call i32 @cudaMalloc(ptr noundef nonnull %D_gpu, i64 noundef 4194304) #16
  %0 = load ptr, ptr %tmp_gpu, align 8, !tbaa !31
  %call5 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %tmp, i64 noundef 4194304, i32 noundef 1) #16
  %1 = load ptr, ptr %A_gpu, align 8, !tbaa !31
  %call6 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %A, i64 noundef 4194304, i32 noundef 1) #16
  %2 = load ptr, ptr %B_gpu, align 8, !tbaa !31
  %call7 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %B, i64 noundef 4194304, i32 noundef 1) #16
  %3 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  %call8 = call i32 @cudaMemcpy(ptr noundef %3, ptr noundef %C, i64 noundef 4194304, i32 noundef 1) #16
  %4 = load ptr, ptr %D_gpu, align 8, !tbaa !31
  %call9 = call i32 @cudaMemcpy(ptr noundef %4, ptr noundef %D, i64 noundef 4194304, i32 noundef 1) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #17
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #18
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #16
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %5 = load i64, ptr %Tp.i.i, align 8, !tbaa !44
  %conv.i.i = sitofp i64 %5 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %6 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !47
  %conv2.i.i = sitofp i64 %6 to double
  %7 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #17
  store double %7, ptr @polybench_t_start, align 8, !tbaa !48
  %call31 = call i32 @__cudaPushCallConfiguration(i64 549755813920, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool.not = icmp eq i32 %call31, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %8 = load ptr, ptr %tmp_gpu, align 8, !tbaa !31
  %9 = load ptr, ptr %A_gpu, align 8, !tbaa !31
  %10 = load ptr, ptr %B_gpu, align 8, !tbaa !31
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nk.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nl.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %alpha.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %beta.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %tmp.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %ni, ptr %ni.addr.i, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr.i, align 4, !tbaa !30
  store i32 %nk, ptr %nk.addr.i, align 4, !tbaa !30
  store i32 %nl, ptr %nl.addr.i, align 4, !tbaa !30
  store float %alpha, ptr %alpha.addr.i, align 4, !tbaa !10
  store float %beta, ptr %beta.addr.i, align 4, !tbaa !10
  store ptr %8, ptr %tmp.addr.i, align 8, !tbaa !31
  store ptr %9, ptr %A.addr.i, align 8, !tbaa !31
  store ptr %10, ptr %B.addr.i, align 8, !tbaa !31
  store ptr %ni.addr.i, ptr %kernel_args1.i, align 16
  %11 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %nj.addr.i, ptr %11, align 8
  %12 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %nk.addr.i, ptr %12, align 16
  %13 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %nl.addr.i, ptr %13, align 8
  %14 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 32
  store ptr %alpha.addr.i, ptr %14, align 16
  %15 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 40
  store ptr %beta.addr.i, ptr %15, align 8
  %16 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 48
  store ptr %tmp.addr.i, ptr %16, align 16
  %17 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 56
  store ptr %A.addr.i, ptr %17, align 8
  %18 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 64
  store ptr %B.addr.i, ptr %18, align 16
  %19 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !50
  %20 = load i64, ptr %shmem_size.i, align 8
  %21 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm2_kernel1iiiiffPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %20, ptr noundef %21), !inline_history !50
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nk.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nl.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %alpha.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %beta.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %tmp.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %_Z21polybench_timer_startv.exit
  %call32 = call i32 @cudaThreadSynchronize() #16
  %call35 = call i32 @__cudaPushCallConfiguration(i64 549755813920, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool36.not = icmp eq i32 %call35, 0
  br i1 %tobool36.not, label %kcall.configok37, label %kcall.end38

kcall.configok37:                                 ; preds = %kcall.end
  %22 = load ptr, ptr %tmp_gpu, align 8, !tbaa !31
  %23 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  %24 = load ptr, ptr %D_gpu, align 8, !tbaa !31
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i57)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i58)
  call void @llvm.lifetime.start.p0(ptr nonnull %nk.addr.i59)
  call void @llvm.lifetime.start.p0(ptr nonnull %nl.addr.i60)
  call void @llvm.lifetime.start.p0(ptr nonnull %alpha.addr.i61)
  call void @llvm.lifetime.start.p0(ptr nonnull %beta.addr.i62)
  call void @llvm.lifetime.start.p0(ptr nonnull %tmp.addr.i63)
  call void @llvm.lifetime.start.p0(ptr nonnull %C.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %D.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i64)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i65)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i66)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i67)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i68)
  store i32 %ni, ptr %ni.addr.i57, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr.i58, align 4, !tbaa !30
  store i32 %nk, ptr %nk.addr.i59, align 4, !tbaa !30
  store i32 %nl, ptr %nl.addr.i60, align 4, !tbaa !30
  store float %alpha, ptr %alpha.addr.i61, align 4, !tbaa !10
  store float %beta, ptr %beta.addr.i62, align 4, !tbaa !10
  store ptr %22, ptr %tmp.addr.i63, align 8, !tbaa !31
  store ptr %23, ptr %C.addr.i, align 8, !tbaa !31
  store ptr %24, ptr %D.addr.i, align 8, !tbaa !31
  store ptr %ni.addr.i57, ptr %kernel_args1.i68, align 16
  %25 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 8
  store ptr %nj.addr.i58, ptr %25, align 8
  %26 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 16
  store ptr %nk.addr.i59, ptr %26, align 16
  %27 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 24
  store ptr %nl.addr.i60, ptr %27, align 8
  %28 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 32
  store ptr %alpha.addr.i61, ptr %28, align 16
  %29 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 40
  store ptr %beta.addr.i62, ptr %29, align 8
  %30 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 48
  store ptr %tmp.addr.i63, ptr %30, align 16
  %31 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 56
  store ptr %C.addr.i, ptr %31, align 8
  %32 = getelementptr inbounds nuw i8, ptr %kernel_args1.i68, i64 64
  store ptr %D.addr.i, ptr %32, align 16
  %33 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i64, ptr nonnull %block_dim.i65, ptr nonnull %shmem_size.i66, ptr nonnull %stream.i67), !inline_history !51
  %34 = load i64, ptr %shmem_size.i66, align 8
  %35 = load ptr, ptr %stream.i67, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i69 = load i64, ptr %grid_dim.i64, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i70 = getelementptr inbounds nuw i8, ptr %grid_dim.i64, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i71 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i70, align 8
  %block_dim.coerce.sroa.0.0.copyload.i72 = load i64, ptr %block_dim.i65, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i73 = getelementptr inbounds nuw i8, ptr %block_dim.i65, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i74 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i73, align 8
  %call.i75 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm2_kernel2iiiiffPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i69, i32 %grid_dim.coerce.sroa.2.0.copyload.i71, i64 %block_dim.coerce.sroa.0.0.copyload.i72, i32 %block_dim.coerce.sroa.2.0.copyload.i74, ptr noundef nonnull %kernel_args1.i68, i64 noundef %34, ptr noundef %35), !inline_history !51
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i57)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i58)
  call void @llvm.lifetime.end.p0(ptr nonnull %nk.addr.i59)
  call void @llvm.lifetime.end.p0(ptr nonnull %nl.addr.i60)
  call void @llvm.lifetime.end.p0(ptr nonnull %alpha.addr.i61)
  call void @llvm.lifetime.end.p0(ptr nonnull %beta.addr.i62)
  call void @llvm.lifetime.end.p0(ptr nonnull %tmp.addr.i63)
  call void @llvm.lifetime.end.p0(ptr nonnull %C.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %D.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i64)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i65)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i66)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i67)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i68)
  br label %kcall.end38

kcall.end38:                                      ; preds = %kcall.configok37, %kcall.end
  %call39 = call i32 @cudaThreadSynchronize() #16
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i76) #17
  %call.i.i77 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i76, ptr noundef null) #18
  %cmp.not.i.i78 = icmp eq i32 %call.i.i77, 0
  br i1 %cmp.not.i.i78, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i79

if.then.i.i79:                                    ; preds = %kcall.end38
  %call1.i.i80 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i77) #16
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end38, %if.then.i.i79
  %36 = load i64, ptr %Tp.i.i76, align 8, !tbaa !44
  %conv.i.i81 = sitofp i64 %36 to double
  %tv_usec.i.i82 = getelementptr inbounds nuw i8, ptr %Tp.i.i76, i64 8
  %37 = load i64, ptr %tv_usec.i.i82, align 8, !tbaa !47
  %conv2.i.i83 = sitofp i64 %37 to double
  %38 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i83, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i81)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i76) #17
  store double %38, ptr @polybench_t_end, align 8, !tbaa !48
  %39 = load double, ptr @polybench_t_start, align 8, !tbaa !48
  %sub.i = fsub double %38, %39
  %call.i84 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #16
  %40 = load ptr, ptr %D_gpu, align 8, !tbaa !31
  %call41 = call i32 @cudaMemcpy(ptr noundef %D_outputFromGpu, ptr noundef %40, i64 noundef 4194304, i32 noundef 2) #16
  %41 = load ptr, ptr %tmp_gpu, align 8, !tbaa !31
  %call42 = call i32 @cudaFree(ptr noundef %41) #16
  %42 = load ptr, ptr %A_gpu, align 8, !tbaa !31
  %call43 = call i32 @cudaFree(ptr noundef %42) #16
  %43 = load ptr, ptr %B_gpu, align 8, !tbaa !31
  %call44 = call i32 @cudaFree(ptr noundef %43) #16
  %44 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  %call45 = call i32 @cudaFree(ptr noundef %44) #16
  %45 = load ptr, ptr %D_gpu, align 8, !tbaa !31
  %call46 = call i32 @cudaFree(ptr noundef %45) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %D_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %C_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %B_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %A_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %tmp_gpu) #17
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) local_unnamed_addr #6

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_startv() local_unnamed_addr #3 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #17
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #18
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #16
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !44
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !47
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #17
  store double %2, ptr @polybench_t_start, align 8, !tbaa !48
  ret void
}

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) local_unnamed_addr #6

declare i32 @cudaThreadSynchronize() local_unnamed_addr #6

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z20polybench_timer_stopv() local_unnamed_addr #3 {
entry:
  %Tp.i = alloca %struct.timeval, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i) #17
  %call.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i, ptr noundef null) #18
  %cmp.not.i = icmp eq i32 %call.i, 0
  br i1 %cmp.not.i, label %_ZL7rtclockv.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call1.i = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i) #16
  br label %_ZL7rtclockv.exit

_ZL7rtclockv.exit:                                ; preds = %entry, %if.then.i
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !44
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !47
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #17
  store double %2, ptr @polybench_t_end, align 8, !tbaa !48
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #3 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !48
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !48
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #16
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #6

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #7 {
entry:
  %Tp.i.i95 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i78 = alloca ptr, align 8
  %newA.i.i71 = alloca ptr, align 8
  %newA.i.i64 = alloca ptr, align 8
  %newA.i.i57 = alloca ptr, align 8
  %newA.i.i50 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #17
  store ptr null, ptr %newA.i.i, align 8, !tbaa !52
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 4194304) #18
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !52
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !53
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i50) #17
  store ptr null, ptr %newA.i.i50, align 8, !tbaa !52
  %call.i.i51 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i50, i64 noundef 32, i64 noundef 4194304) #18
  %3 = load ptr, ptr %newA.i.i50, align 8, !tbaa !52
  %tobool.i.i52 = icmp eq ptr %3, null
  %tobool1.i.i53 = icmp ne i32 %call.i.i51, 0
  %or.cond.i.i54 = select i1 %tobool.i.i52, i1 true, i1 %tobool1.i.i53
  br i1 %or.cond.i.i54, label %if.then.i.i55, label %_Z20polybench_alloc_datayi.exit56

if.then.i.i55:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !53
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit56:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i50) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i57) #17
  store ptr null, ptr %newA.i.i57, align 8, !tbaa !52
  %call.i.i58 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i57, i64 noundef 32, i64 noundef 4194304) #18
  %6 = load ptr, ptr %newA.i.i57, align 8, !tbaa !52
  %tobool.i.i59 = icmp eq ptr %6, null
  %tobool1.i.i60 = icmp ne i32 %call.i.i58, 0
  %or.cond.i.i61 = select i1 %tobool.i.i59, i1 true, i1 %tobool1.i.i60
  br i1 %or.cond.i.i61, label %if.then.i.i62, label %_Z20polybench_alloc_datayi.exit63

if.then.i.i62:                                    ; preds = %_Z20polybench_alloc_datayi.exit56
  %7 = load ptr, ptr @stderr, align 8, !tbaa !53
  %8 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %7) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit63:                ; preds = %_Z20polybench_alloc_datayi.exit56
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i57) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i64) #17
  store ptr null, ptr %newA.i.i64, align 8, !tbaa !52
  %call.i.i65 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i64, i64 noundef 32, i64 noundef 4194304) #18
  %9 = load ptr, ptr %newA.i.i64, align 8, !tbaa !52
  %tobool.i.i66 = icmp eq ptr %9, null
  %tobool1.i.i67 = icmp ne i32 %call.i.i65, 0
  %or.cond.i.i68 = select i1 %tobool.i.i66, i1 true, i1 %tobool1.i.i67
  br i1 %or.cond.i.i68, label %if.then.i.i69, label %_Z20polybench_alloc_datayi.exit70

if.then.i.i69:                                    ; preds = %_Z20polybench_alloc_datayi.exit63
  %10 = load ptr, ptr @stderr, align 8, !tbaa !53
  %11 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %10) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit70:                ; preds = %_Z20polybench_alloc_datayi.exit63
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i64) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i71) #17
  store ptr null, ptr %newA.i.i71, align 8, !tbaa !52
  %call.i.i72 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i71, i64 noundef 32, i64 noundef 4194304) #18
  %12 = load ptr, ptr %newA.i.i71, align 8, !tbaa !52
  %tobool.i.i73 = icmp eq ptr %12, null
  %tobool1.i.i74 = icmp ne i32 %call.i.i72, 0
  %or.cond.i.i75 = select i1 %tobool.i.i73, i1 true, i1 %tobool1.i.i74
  br i1 %or.cond.i.i75, label %if.then.i.i76, label %_Z20polybench_alloc_datayi.exit77

if.then.i.i76:                                    ; preds = %_Z20polybench_alloc_datayi.exit70
  %13 = load ptr, ptr @stderr, align 8, !tbaa !53
  %14 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %13) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit77:                ; preds = %_Z20polybench_alloc_datayi.exit70
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i71) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i78) #17
  store ptr null, ptr %newA.i.i78, align 8, !tbaa !52
  %call.i.i79 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i78, i64 noundef 32, i64 noundef 4194304) #18
  %15 = load ptr, ptr %newA.i.i78, align 8, !tbaa !52
  %tobool.i.i80 = icmp eq ptr %15, null
  %tobool1.i.i81 = icmp ne i32 %call.i.i79, 0
  %or.cond.i.i82 = select i1 %tobool.i.i80, i1 true, i1 %tobool1.i.i81
  br i1 %or.cond.i.i82, label %if.then.i.i83, label %_Z20polybench_alloc_datayi.exit84

if.then.i.i83:                                    ; preds = %_Z20polybench_alloc_datayi.exit77
  %16 = load ptr, ptr @stderr, align 8, !tbaa !53
  %17 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %16) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit84:                ; preds = %_Z20polybench_alloc_datayi.exit77
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i78) #17
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc7_crit_edge.i, %_Z20polybench_alloc_datayi.exit84
  %indvars.iv126.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit84 ], [ %indvars.iv.next127.i, %for.cond1.for.inc7_crit_edge.i ]
  %arrayidx.i = getelementptr inbounds nuw [4096 x i8], ptr %3, i64 %indvars.iv126.i
  %18 = trunc nuw nsw i64 %indvars.iv126.i to i32
  %conv.i = uitofp nneg i32 %18 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond1.preheader.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %19 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %20 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %21 = fmul nnan <4 x float> %broadcast.splat, %19
  %22 = fmul nnan <4 x float> %broadcast.splat, %20
  %23 = fmul nnan <4 x float> %21, splat (float f0x3A800000)
  %24 = fmul nnan <4 x float> %22, splat (float f0x3A800000)
  %25 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %26 = getelementptr inbounds nuw i8, ptr %25, i64 16
  store <4 x float> %23, ptr %25, align 4, !tbaa !10
  store <4 x float> %24, ptr %26, align 4, !tbaa !10
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %27 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %28 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %29 = fmul nnan <4 x float> %broadcast.splat, %27
  %30 = fmul nnan <4 x float> %broadcast.splat, %28
  %31 = fmul nnan <4 x float> %29, splat (float f0x3A800000)
  %32 = fmul nnan <4 x float> %30, splat (float f0x3A800000)
  %33 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %34 = getelementptr inbounds nuw i8, ptr %33, i64 32
  %35 = getelementptr inbounds nuw i8, ptr %33, i64 48
  store <4 x float> %31, ptr %34, align 4, !tbaa !10
  store <4 x float> %32, ptr %35, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %36 = icmp eq i64 %index.next.1, 1024
  br i1 %36, label %for.cond1.for.inc7_crit_edge.i, label %vector.body, !llvm.loop !55

for.cond1.for.inc7_crit_edge.i:                   ; preds = %vector.body
  %indvars.iv.next127.i = add nuw nsw i64 %indvars.iv126.i, 1
  %exitcond130.not.i = icmp eq i64 %indvars.iv.next127.i, 1024
  br i1 %exitcond130.not.i, label %for.cond13.preheader.i, label %for.cond1.preheader.i, !llvm.loop !17

for.cond13.preheader.i:                           ; preds = %for.cond1.for.inc7_crit_edge.i, %for.cond13.for.inc27_crit_edge.i
  %indvars.iv136.i = phi i64 [ %indvars.iv.next137.i, %for.cond13.for.inc27_crit_edge.i ], [ 0, %for.cond1.for.inc7_crit_edge.i ]
  %arrayidx21.i = getelementptr inbounds nuw [4096 x i8], ptr %6, i64 %indvars.iv136.i
  %37 = trunc nuw nsw i64 %indvars.iv136.i to i32
  %conv16.i = uitofp nneg i32 %37 to float
  %broadcast.splatinsert117 = insertelement <4 x float> poison, float %conv16.i, i64 0
  %broadcast.splat118 = shufflevector <4 x float> %broadcast.splatinsert117, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body119

vector.body119:                                   ; preds = %vector.body119, %for.cond13.preheader.i
  %index120 = phi i64 [ 0, %for.cond13.preheader.i ], [ %index.next123, %vector.body119 ]
  %vec.ind121 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond13.preheader.i ], [ %vec.ind.next124, %vector.body119 ]
  %38 = trunc <4 x i64> %vec.ind121 to <4 x i32>
  %39 = add <4 x i32> %38, splat (i32 1)
  %40 = trunc <4 x i64> %vec.ind121 to <4 x i32>
  %41 = add <4 x i32> %40, splat (i32 5)
  %42 = uitofp nneg <4 x i32> %39 to <4 x float>
  %43 = uitofp nneg <4 x i32> %41 to <4 x float>
  %44 = fmul nnan <4 x float> %broadcast.splat118, %42
  %45 = fmul nnan <4 x float> %broadcast.splat118, %43
  %46 = fmul nnan <4 x float> %44, splat (float f0x3A800000)
  %47 = fmul nnan <4 x float> %45, splat (float f0x3A800000)
  %48 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx21.i, i64 %index120
  %49 = getelementptr inbounds nuw i8, ptr %48, i64 16
  store <4 x float> %46, ptr %48, align 4, !tbaa !10
  store <4 x float> %47, ptr %49, align 4, !tbaa !10
  %index.next123 = add nuw i64 %index120, 8
  %vec.ind.next124 = add nuw <4 x i64> %vec.ind121, splat (i64 8)
  %50 = icmp eq i64 %index.next123, 1024
  br i1 %50, label %for.cond13.for.inc27_crit_edge.i, label %vector.body119, !llvm.loop !56

for.cond13.for.inc27_crit_edge.i:                 ; preds = %vector.body119
  %indvars.iv.next137.i = add nuw nsw i64 %indvars.iv136.i, 1
  %exitcond140.not.i = icmp eq i64 %indvars.iv.next137.i, 1024
  br i1 %exitcond140.not.i, label %for.cond33.preheader.i, label %for.cond13.preheader.i, !llvm.loop !20

for.cond33.preheader.i:                           ; preds = %for.cond13.for.inc27_crit_edge.i, %for.cond33.for.inc48_crit_edge.i
  %indvars.iv147.i = phi i64 [ %indvars.iv.next148.i, %for.cond33.for.inc48_crit_edge.i ], [ 0, %for.cond13.for.inc27_crit_edge.i ]
  %arrayidx42.i = getelementptr inbounds nuw [4096 x i8], ptr %9, i64 %indvars.iv147.i
  %51 = trunc nuw nsw i64 %indvars.iv147.i to i32
  %conv36.i = uitofp nneg i32 %51 to float
  %broadcast.splatinsert127 = insertelement <4 x float> poison, float %conv36.i, i64 0
  %broadcast.splat128 = shufflevector <4 x float> %broadcast.splatinsert127, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body129

vector.body129:                                   ; preds = %vector.body129, %for.cond33.preheader.i
  %index130 = phi i64 [ 0, %for.cond33.preheader.i ], [ %index.next133.1, %vector.body129 ]
  %vec.ind131 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond33.preheader.i ], [ %vec.ind.next134.1, %vector.body129 ]
  %52 = add <4 x i32> %vec.ind131, splat (i32 3)
  %53 = add <4 x i32> %vec.ind131, splat (i32 7)
  %54 = uitofp nneg <4 x i32> %52 to <4 x float>
  %55 = uitofp nneg <4 x i32> %53 to <4 x float>
  %56 = fmul nnan <4 x float> %broadcast.splat128, %54
  %57 = fmul nnan <4 x float> %broadcast.splat128, %55
  %58 = fmul nnan <4 x float> %56, splat (float f0x3A800000)
  %59 = fmul nnan <4 x float> %57, splat (float f0x3A800000)
  %60 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx42.i, i64 %index130
  %61 = getelementptr inbounds nuw i8, ptr %60, i64 16
  store <4 x float> %58, ptr %60, align 4, !tbaa !10
  store <4 x float> %59, ptr %61, align 4, !tbaa !10
  %62 = add <4 x i32> %vec.ind131, splat (i32 11)
  %63 = add <4 x i32> %vec.ind131, splat (i32 15)
  %64 = uitofp nneg <4 x i32> %62 to <4 x float>
  %65 = uitofp nneg <4 x i32> %63 to <4 x float>
  %66 = fmul nnan <4 x float> %broadcast.splat128, %64
  %67 = fmul nnan <4 x float> %broadcast.splat128, %65
  %68 = fmul nnan <4 x float> %66, splat (float f0x3A800000)
  %69 = fmul nnan <4 x float> %67, splat (float f0x3A800000)
  %70 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx42.i, i64 %index130
  %71 = getelementptr inbounds nuw i8, ptr %70, i64 32
  %72 = getelementptr inbounds nuw i8, ptr %70, i64 48
  store <4 x float> %68, ptr %71, align 4, !tbaa !10
  store <4 x float> %69, ptr %72, align 4, !tbaa !10
  %index.next133.1 = add nuw nsw i64 %index130, 16
  %vec.ind.next134.1 = add <4 x i32> %vec.ind131, splat (i32 16)
  %73 = icmp eq i64 %index.next133.1, 1024
  br i1 %73, label %for.cond33.for.inc48_crit_edge.i, label %vector.body129, !llvm.loop !57

for.cond33.for.inc48_crit_edge.i:                 ; preds = %vector.body129
  %indvars.iv.next148.i = add nuw nsw i64 %indvars.iv147.i, 1
  %exitcond151.not.i = icmp eq i64 %indvars.iv.next148.i, 1024
  br i1 %exitcond151.not.i, label %for.cond54.preheader.i, label %for.cond33.preheader.i, !llvm.loop !23

for.cond54.preheader.i:                           ; preds = %for.cond33.for.inc48_crit_edge.i, %for.cond54.for.inc69_crit_edge.i
  %indvars.iv158.i = phi i64 [ %indvars.iv.next159.i, %for.cond54.for.inc69_crit_edge.i ], [ 0, %for.cond33.for.inc48_crit_edge.i ]
  %arrayidx63.i = getelementptr inbounds nuw [4096 x i8], ptr %12, i64 %indvars.iv158.i
  %74 = trunc nuw nsw i64 %indvars.iv158.i to i32
  %conv57.i = uitofp nneg i32 %74 to float
  %broadcast.splatinsert137 = insertelement <4 x float> poison, float %conv57.i, i64 0
  %broadcast.splat138 = shufflevector <4 x float> %broadcast.splatinsert137, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body139

vector.body139:                                   ; preds = %vector.body139, %for.cond54.preheader.i
  %index140 = phi i64 [ 0, %for.cond54.preheader.i ], [ %index.next143.1, %vector.body139 ]
  %vec.ind141 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond54.preheader.i ], [ %vec.ind.next144.1, %vector.body139 ]
  %75 = add <4 x i32> %vec.ind141, splat (i32 2)
  %76 = add <4 x i32> %vec.ind141, splat (i32 6)
  %77 = uitofp nneg <4 x i32> %75 to <4 x float>
  %78 = uitofp nneg <4 x i32> %76 to <4 x float>
  %79 = fmul nnan <4 x float> %broadcast.splat138, %77
  %80 = fmul nnan <4 x float> %broadcast.splat138, %78
  %81 = fmul nnan <4 x float> %79, splat (float f0x3A800000)
  %82 = fmul nnan <4 x float> %80, splat (float f0x3A800000)
  %83 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx63.i, i64 %index140
  %84 = getelementptr inbounds nuw i8, ptr %83, i64 16
  store <4 x float> %81, ptr %83, align 4, !tbaa !10
  store <4 x float> %82, ptr %84, align 4, !tbaa !10
  %85 = add <4 x i32> %vec.ind141, splat (i32 10)
  %86 = add <4 x i32> %vec.ind141, splat (i32 14)
  %87 = uitofp nneg <4 x i32> %85 to <4 x float>
  %88 = uitofp nneg <4 x i32> %86 to <4 x float>
  %89 = fmul nnan <4 x float> %broadcast.splat138, %87
  %90 = fmul nnan <4 x float> %broadcast.splat138, %88
  %91 = fmul nnan <4 x float> %89, splat (float f0x3A800000)
  %92 = fmul nnan <4 x float> %90, splat (float f0x3A800000)
  %93 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx63.i, i64 %index140
  %94 = getelementptr inbounds nuw i8, ptr %93, i64 32
  %95 = getelementptr inbounds nuw i8, ptr %93, i64 48
  store <4 x float> %91, ptr %94, align 4, !tbaa !10
  store <4 x float> %92, ptr %95, align 4, !tbaa !10
  %index.next143.1 = add nuw nsw i64 %index140, 16
  %vec.ind.next144.1 = add <4 x i32> %vec.ind141, splat (i32 16)
  %96 = icmp eq i64 %index.next143.1, 1024
  br i1 %96, label %for.cond54.for.inc69_crit_edge.i, label %vector.body139, !llvm.loop !58

for.cond54.for.inc69_crit_edge.i:                 ; preds = %vector.body139
  %indvars.iv.next159.i = add nuw nsw i64 %indvars.iv158.i, 1
  %exitcond162.not.i = icmp eq i64 %indvars.iv.next159.i, 1024
  br i1 %exitcond162.not.i, label %_Z10init_arrayiiiiPfS_PA1024_fS1_S1_S1_.exit, label %for.cond54.preheader.i, !llvm.loop !26

_Z10init_arrayiiiiPfS_PA1024_fS1_S1_S1_.exit:     ; preds = %for.cond54.for.inc69_crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #17
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #16
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #16
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #17
  call void @_Z7mm2CudaiiiiffPA1024_fS0_S0_S0_S0_S0_(i32 noundef 1024, i32 noundef 1024, i32 noundef 1024, i32 noundef 1024, float noundef 3.241200e+04, float noundef 2.123000e+03, ptr noundef nonnull %0, ptr noundef nonnull %3, ptr noundef nonnull %6, ptr noundef nonnull %9, ptr noundef nonnull %12, ptr noundef nonnull %15) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #17
  %call.i.i85 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #18
  %cmp.not.i.i = icmp eq i32 %call.i.i85, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i86

if.then.i.i86:                                    ; preds = %_Z10init_arrayiiiiPfS_PA1024_fS1_S1_S1_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i85) #16
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiiiiPfS_PA1024_fS1_S1_S1_.exit, %if.then.i.i86
  %97 = load i64, ptr %Tp.i.i, align 8, !tbaa !44
  %conv.i.i = sitofp i64 %97 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %98 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !47
  %conv2.i.i = sitofp i64 %98 to double
  %99 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #17
  store double %99, ptr @polybench_t_start, align 8, !tbaa !48
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc25_crit_edge.split.us.us.i, %_Z21polybench_timer_startv.exit
  %indvars.iv127.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next128.i, %for.cond1.for.inc25_crit_edge.split.us.us.i ]
  %arrayidx.us.i = getelementptr inbounds nuw [4096 x i8], ptr %0, i64 %indvars.iv127.i
  %arrayidx10.us.i = getelementptr inbounds nuw [4096 x i8], ptr %3, i64 %indvars.iv127.i
  br label %for.body3.us.us.i

for.body3.us.us.i:                                ; preds = %for.cond6.for.inc22_crit_edge.us.us.i, %for.cond1.preheader.us.i
  %indvars.iv122.i = phi i64 [ %indvars.iv.next123.i, %for.cond6.for.inc22_crit_edge.us.us.i ], [ 0, %for.cond1.preheader.us.i ]
  %arrayidx5.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i, i64 %indvars.iv122.i
  store float 0.000000e+00, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %invariant.gep.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %6, i64 %indvars.iv122.i
  br label %for.body8.us.us.i

for.body8.us.us.i:                                ; preds = %for.body8.us.us.i, %for.body3.us.us.i
  %indvars.iv.i87 = phi i64 [ 0, %for.body3.us.us.i ], [ %indvars.iv.next.i88.1, %for.body8.us.us.i ]
  %100 = phi float [ 0.000000e+00, %for.body3.us.us.i ], [ %106, %for.body8.us.us.i ]
  %arrayidx12.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us.i, i64 %indvars.iv.i87
  %101 = load float, ptr %arrayidx12.us.us.i, align 4, !tbaa !10
  %mul.us.us.i = fmul float %101, 3.241200e+04
  %gep.us.us.i = getelementptr inbounds nuw [4096 x i8], ptr %invariant.gep.us.us.i, i64 %indvars.iv.i87
  %102 = load float, ptr %gep.us.us.i, align 4, !tbaa !10
  %103 = call float @llvm.fmuladd.f32(float %mul.us.us.i, float %102, float %100)
  store float %103, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %indvars.iv.next.i88 = or disjoint i64 %indvars.iv.i87, 1
  %arrayidx12.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us.i, i64 %indvars.iv.next.i88
  %104 = load float, ptr %arrayidx12.us.us.i.1, align 4, !tbaa !10
  %mul.us.us.i.1 = fmul float %104, 3.241200e+04
  %gep.us.us.i.1 = getelementptr inbounds nuw [4096 x i8], ptr %invariant.gep.us.us.i, i64 %indvars.iv.next.i88
  %105 = load float, ptr %gep.us.us.i.1, align 4, !tbaa !10
  %106 = call float @llvm.fmuladd.f32(float %mul.us.us.i.1, float %105, float %103)
  store float %106, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %indvars.iv.next.i88.1 = add nuw nsw i64 %indvars.iv.i87, 2
  %exitcond118.not.i.1 = icmp eq i64 %indvars.iv.next.i88.1, 1024
  br i1 %exitcond118.not.i.1, label %for.cond6.for.inc22_crit_edge.us.us.i, label %for.body8.us.us.i, !llvm.loop !34

for.cond6.for.inc22_crit_edge.us.us.i:            ; preds = %for.body8.us.us.i
  %indvars.iv.next123.i = add nuw nsw i64 %indvars.iv122.i, 1
  %exitcond126.not.i = icmp eq i64 %indvars.iv.next123.i, 1024
  br i1 %exitcond126.not.i, label %for.cond1.for.inc25_crit_edge.split.us.us.i, label %for.body3.us.us.i, !llvm.loop !35

for.cond1.for.inc25_crit_edge.split.us.us.i:      ; preds = %for.cond6.for.inc22_crit_edge.us.us.i
  %indvars.iv.next128.i = add nuw nsw i64 %indvars.iv127.i, 1
  %exitcond131.not.i = icmp eq i64 %indvars.iv.next128.i, 1024
  br i1 %exitcond131.not.i, label %for.cond31.preheader.us.i, label %for.cond1.preheader.us.i, !llvm.loop !36

for.cond31.preheader.us.i:                        ; preds = %for.cond1.for.inc25_crit_edge.split.us.us.i, %for.cond31.for.inc61_crit_edge.split.us.us.i
  %indvars.iv152.i89 = phi i64 [ %indvars.iv.next153.i94, %for.cond31.for.inc61_crit_edge.split.us.us.i ], [ 0, %for.cond1.for.inc25_crit_edge.split.us.us.i ]
  %arrayidx35.us.i = getelementptr inbounds nuw [4096 x i8], ptr %12, i64 %indvars.iv152.i89
  %arrayidx43.us.i = getelementptr inbounds nuw [4096 x i8], ptr %0, i64 %indvars.iv152.i89
  br label %for.body33.us.us.i

for.body33.us.us.i:                               ; preds = %for.cond39.for.inc58_crit_edge.us.us.i, %for.cond31.preheader.us.i
  %indvars.iv147.i90 = phi i64 [ %indvars.iv.next148.i92, %for.cond39.for.inc58_crit_edge.us.us.i ], [ 0, %for.cond31.preheader.us.i ]
  %arrayidx37.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx35.us.i, i64 %indvars.iv147.i90
  %107 = load float, ptr %arrayidx37.us.us.i, align 4, !tbaa !10
  %mul38.us.us.i = fmul float %107, 2.123000e+03
  store float %mul38.us.us.i, ptr %arrayidx37.us.us.i, align 4, !tbaa !10
  %invariant.gep.us.us108.i = getelementptr inbounds nuw [4 x i8], ptr %9, i64 %indvars.iv147.i90
  br label %for.body41.us.us.i

for.body41.us.us.i:                               ; preds = %for.body41.us.us.i, %for.body33.us.us.i
  %indvars.iv142.i = phi i64 [ 0, %for.body33.us.us.i ], [ %indvars.iv.next143.i.1, %for.body41.us.us.i ]
  %108 = phi float [ %mul38.us.us.i, %for.body33.us.us.i ], [ %114, %for.body41.us.us.i ]
  %arrayidx45.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx43.us.i, i64 %indvars.iv142.i
  %109 = load float, ptr %arrayidx45.us.us.i, align 4, !tbaa !10
  %gep.us.us109.i = getelementptr inbounds nuw [4096 x i8], ptr %invariant.gep.us.us108.i, i64 %indvars.iv142.i
  %110 = load float, ptr %gep.us.us109.i, align 4, !tbaa !10
  %111 = call float @llvm.fmuladd.f32(float %109, float %110, float %108)
  store float %111, ptr %arrayidx37.us.us.i, align 4, !tbaa !10
  %indvars.iv.next143.i = or disjoint i64 %indvars.iv142.i, 1
  %arrayidx45.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx43.us.i, i64 %indvars.iv.next143.i
  %112 = load float, ptr %arrayidx45.us.us.i.1, align 4, !tbaa !10
  %gep.us.us109.i.1 = getelementptr inbounds nuw [4096 x i8], ptr %invariant.gep.us.us108.i, i64 %indvars.iv.next143.i
  %113 = load float, ptr %gep.us.us109.i.1, align 4, !tbaa !10
  %114 = call float @llvm.fmuladd.f32(float %112, float %113, float %111)
  store float %114, ptr %arrayidx37.us.us.i, align 4, !tbaa !10
  %indvars.iv.next143.i.1 = add nuw nsw i64 %indvars.iv142.i, 2
  %exitcond146.not.i91.1 = icmp eq i64 %indvars.iv.next143.i.1, 1024
  br i1 %exitcond146.not.i91.1, label %for.cond39.for.inc58_crit_edge.us.us.i, label %for.body41.us.us.i, !llvm.loop !39

for.cond39.for.inc58_crit_edge.us.us.i:           ; preds = %for.body41.us.us.i
  %indvars.iv.next148.i92 = add nuw nsw i64 %indvars.iv147.i90, 1
  %exitcond151.not.i93 = icmp eq i64 %indvars.iv.next148.i92, 1024
  br i1 %exitcond151.not.i93, label %for.cond31.for.inc61_crit_edge.split.us.us.i, label %for.body33.us.us.i, !llvm.loop !40

for.cond31.for.inc61_crit_edge.split.us.us.i:     ; preds = %for.cond39.for.inc58_crit_edge.us.us.i
  %indvars.iv.next153.i94 = add nuw nsw i64 %indvars.iv152.i89, 1
  %exitcond156.not.i = icmp eq i64 %indvars.iv.next153.i94, 1024
  br i1 %exitcond156.not.i, label %_Z7mm2_cpuiiiiffPA1024_fS0_S0_S0_S0_.exit, label %for.cond31.preheader.us.i, !llvm.loop !41

_Z7mm2_cpuiiiiffPA1024_fS0_S0_S0_S0_.exit:        ; preds = %for.cond31.for.inc61_crit_edge.split.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i95) #17
  %call.i.i96 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i95, ptr noundef null) #18
  %cmp.not.i.i97 = icmp eq i32 %call.i.i96, 0
  br i1 %cmp.not.i.i97, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i98

if.then.i.i98:                                    ; preds = %_Z7mm2_cpuiiiiffPA1024_fS0_S0_S0_S0_.exit
  %call1.i.i99 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i96) #16
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z7mm2_cpuiiiiffPA1024_fS0_S0_S0_S0_.exit, %if.then.i.i98
  %115 = load i64, ptr %Tp.i.i95, align 8, !tbaa !44
  %conv.i.i100 = sitofp i64 %115 to double
  %tv_usec.i.i101 = getelementptr inbounds nuw i8, ptr %Tp.i.i95, i64 8
  %116 = load i64, ptr %tv_usec.i.i101, align 8, !tbaa !47
  %conv2.i.i102 = sitofp i64 %116 to double
  %117 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i102, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i100)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i95) #17
  store double %117, ptr @polybench_t_end, align 8, !tbaa !48
  %118 = load double, ptr @polybench_t_start, align 8, !tbaa !48
  %sub.i = fsub double %117, %118
  %call.i103 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #16
  br label %for.cond1.preheader.us.i104

for.cond1.preheader.us.i104:                      ; preds = %for.cond1.for.inc14_crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv34.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next35.i, %for.cond1.for.inc14_crit_edge.us.i ]
  %fail.030.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %153, %for.cond1.for.inc14_crit_edge.us.i ]
  %arrayidx.us.i105 = getelementptr inbounds nuw [4096 x i8], ptr %12, i64 %indvars.iv34.i
  %arrayidx7.us.i = getelementptr inbounds nuw [4096 x i8], ptr %15, i64 %indvars.iv34.i
  %119 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.030.us.i, i64 0
  br label %vector.body147

vector.body147:                                   ; preds = %vector.body147, %for.cond1.preheader.us.i104
  %index148 = phi i64 [ 0, %for.cond1.preheader.us.i104 ], [ %index.next150, %vector.body147 ]
  %vec.phi = phi <4 x i32> [ %119, %for.cond1.preheader.us.i104 ], [ %151, %vector.body147 ]
  %120 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i105, i64 %index148
  %wide.load = load <4 x float>, ptr %120, align 4, !tbaa !10
  %121 = fpext <4 x float> %wide.load to <4 x double>
  %122 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us.i, i64 %index148
  %wide.load149 = load <4 x float>, ptr %122, align 4, !tbaa !10
  %123 = fpext <4 x float> %wide.load149 to <4 x double>
  %124 = fcmp olt <4 x double> %121, splat (double f0xB690000000000000)
  %125 = fneg <4 x float> %wide.load
  %126 = select <4 x i1> %124, <4 x float> %125, <4 x float> %wide.load
  %127 = fpext <4 x float> %126 to <4 x double>
  %128 = fcmp uge <4 x double> %127, splat (double 1.000000e-02)
  %129 = fcmp olt <4 x double> %123, splat (double f0xB690000000000000)
  %130 = fneg <4 x float> %wide.load149
  %131 = select <4 x i1> %129, <4 x float> %130, <4 x float> %wide.load149
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
  %.not153 = select <4 x i1> %128, <4 x i1> splat (i1 true), <4 x i1> %133
  %narrow = select <4 x i1> %.not153, <4 x i1> %150, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %151 = add <4 x i32> %vec.phi, %predphi
  %index.next150 = add nuw i64 %index148, 4
  %152 = icmp eq i64 %index.next150, 1024
  br i1 %152, label %for.cond1.for.inc14_crit_edge.us.i, label %vector.body147, !llvm.loop !59

for.cond1.for.inc14_crit_edge.us.i:               ; preds = %vector.body147
  %153 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %151)
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond38.not.i = icmp eq i64 %indvars.iv.next35.i, 1024
  br i1 %exitcond38.not.i, label %_Z14compareResultsiiPA1024_fS0_.exit, label %for.cond1.preheader.us.i104, !llvm.loop !29

_Z14compareResultsiiPA1024_fS0_.exit:             ; preds = %for.cond1.for.inc14_crit_edge.us.i
  %call17.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %153) #16
  call void @free(ptr noundef %0) #18
  call void @free(ptr noundef %3) #18
  call void @free(ptr noundef %6) #18
  call void @free(ptr noundef %9) #18
  call void @free(ptr noundef nonnull %12) #18
  call void @free(ptr noundef nonnull %15) #18
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #3 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #17
  store ptr null, ptr %newA.i, align 8, !tbaa !52
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #18
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !52
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !53
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_ZL7xmallocm.exit:                                ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i) #17
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
declare noundef i32 @gettimeofday(ptr noundef captures(none), ptr noundef captures(none)) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #9

; Function Attrs: nofree nounwind
declare i32 @posix_memalign(ptr noundef, i64 noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: nofree noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr noundef readonly captures(none), i64 noundef, i64 noundef, ptr noundef captures(none)) local_unnamed_addr #12

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #13

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #14

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #15

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #4 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #5 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #6 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #7 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #8 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #9 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #11 = { nofree noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "uniform-work-group-size" }
attributes #12 = { nofree nounwind }
attributes #13 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #14 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #15 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #16 = { "uniform-work-group-size" }
attributes #17 = { nounwind }
attributes #18 = { nounwind "uniform-work-group-size" }
attributes #19 = { cold }
attributes #20 = { cold noreturn nounwind "uniform-work-group-size" }

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
!16 = distinct !{!16, !13, !15, !14}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !13, !14, !15}
!19 = distinct !{!19, !13, !15, !14}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !13, !14, !15}
!22 = distinct !{!22, !13, !15, !14}
!23 = distinct !{!23, !13}
!24 = distinct !{!24, !13, !14, !15}
!25 = distinct !{!25, !13, !15, !14}
!26 = distinct !{!26, !13}
!27 = distinct !{!27, !13, !14, !15}
!28 = distinct !{!28, !13, !15, !14}
!29 = distinct !{!29, !13}
!30 = !{!7, !7, i64 0}
!31 = !{!32, !32, i64 0}
!32 = !{!"p1 float", !33, i64 0}
!33 = !{!"any pointer", !8, i64 0}
!34 = distinct !{!34, !13}
!35 = distinct !{!35, !13}
!36 = distinct !{!36, !13}
!37 = distinct !{!37, !38}
!38 = !{!"llvm.loop.unroll.disable"}
!39 = distinct !{!39, !13}
!40 = distinct !{!40, !13}
!41 = distinct !{!41, !13}
!42 = distinct !{!42, !13, !14, !15}
!43 = distinct !{!43, !13, !15, !14}
!44 = !{!45, !46, i64 0}
!45 = !{!"_ZTS7timeval", !46, i64 0, !46, i64 8}
!46 = !{!"long", !8, i64 0}
!47 = !{!45, !46, i64 8}
!48 = !{!49, !49, i64 0}
!49 = !{!"double", !8, i64 0}
!50 = !{ptr @_Z26__device_stub__mm2_kernel1iiiiffPfS_S_}
!51 = !{ptr @_Z26__device_stub__mm2_kernel2iiiiffPfS_S_}
!52 = !{!33, !33, i64 0}
!53 = !{!54, !54, i64 0}
!54 = !{!"p1 _ZTS8_IO_FILE", !33, i64 0}
!55 = distinct !{!55, !13, !14, !15}
!56 = distinct !{!56, !13, !14, !15}
!57 = distinct !{!57, !13, !14, !15}
!58 = distinct !{!58, !13, !14, !15}
!59 = distinct !{!59, !13, !14, !15}
