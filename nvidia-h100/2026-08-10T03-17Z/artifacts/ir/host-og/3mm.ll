; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/3MM/3mm.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/3MM/3mm.cu"
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
define dso_local void @_Z10init_arrayiiiiiPA512_fS0_S0_S0_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B, ptr nofree noundef writeonly captures(none) %C, ptr nofree noundef writeonly captures(none) %D) local_unnamed_addr #1 {
entry:
  %cmp115 = icmp sgt i32 %ni, 0
  br i1 %cmp115, label %for.cond1.preheader.lr.ph, label %for.cond11.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp2113 = icmp sgt i32 %nk, 0
  %conv5 = uitofp nneg i32 %ni to float
  br i1 %cmp2113, label %for.cond1.preheader.preheader, label %for.cond32.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count133 = zext nneg i32 %ni to i64
  %wide.trip.count = zext nneg i32 %nk to i64
  %min.iters.check = icmp ult i32 %nk, 4
  %n.vec = and i64 %wide.trip.count, 2147483644
  %broadcast.splatinsert170 = insertelement <4 x float> poison, float %conv5, i64 0
  %broadcast.splat171 = shufflevector <4 x float> %broadcast.splatinsert170, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.cond1.for.inc8_crit_edge
  %indvars.iv130 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next131, %for.cond1.for.inc8_crit_edge ]
  %0 = trunc nuw nsw i64 %indvars.iv130 to i32
  %conv = uitofp nneg i32 %0 to float
  %arrayidx = getelementptr inbounds nuw [2048 x i8], ptr %A, i64 %indvars.iv130
  br i1 %min.iters.check, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond1.preheader
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %1 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %2 = fmul nnan <4 x float> %broadcast.splat, %1
  %3 = fdiv <4 x float> %2, %broadcast.splat171
  %4 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %index
  store <4 x float> %3, ptr %4, align 4, !tbaa !10
  %index.next = add nuw i64 %index, 4
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 4)
  %5 = icmp eq i64 %index.next, %n.vec
  br i1 %5, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc8_crit_edge, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond1.preheader ], [ %n.vec, %middle.block ]
  br label %for.body3

for.cond11.preheader:                             ; preds = %for.cond1.for.inc8_crit_edge, %entry
  %cmp12119 = icmp sgt i32 %nk, 0
  br i1 %cmp12119, label %for.cond14.preheader.lr.ph, label %for.cond32.preheader

for.cond14.preheader.lr.ph:                       ; preds = %for.cond11.preheader
  %cmp15117 = icmp sgt i32 %nj, 0
  %conv20 = sitofp i32 %nj to float
  br i1 %cmp15117, label %for.cond14.preheader.preheader, label %for.cond54.preheader

for.cond14.preheader.preheader:                   ; preds = %for.cond14.preheader.lr.ph
  %wide.trip.count143 = zext nneg i32 %nk to i64
  %wide.trip.count138 = zext nneg i32 %nj to i64
  %min.iters.check173 = icmp ult i32 %nj, 4
  %n.vec176 = and i64 %wide.trip.count138, 2147483644
  %broadcast.splatinsert179 = insertelement <4 x float> poison, float %conv20, i64 0
  %broadcast.splat180 = shufflevector <4 x float> %broadcast.splatinsert179, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n187 = icmp eq i64 %n.vec176, %wide.trip.count138
  br label %for.cond14.preheader

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %6 = trunc nuw nsw i64 %indvars.iv to i32
  %conv4 = uitofp nneg i32 %6 to float
  %mul = fmul nnan float %conv, %conv4
  %div = fdiv float %mul, %conv5
  %arrayidx7 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx, i64 %indvars.iv
  store float %div, ptr %arrayidx7, align 4, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond1.for.inc8_crit_edge, label %for.body3, !llvm.loop !16

for.cond1.for.inc8_crit_edge:                     ; preds = %for.body3, %middle.block
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %exitcond134.not = icmp eq i64 %indvars.iv.next131, %wide.trip.count133
  br i1 %exitcond134.not, label %for.cond11.preheader, label %for.cond1.preheader, !llvm.loop !17

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.cond14.for.inc29_crit_edge
  %indvars.iv140 = phi i64 [ 0, %for.cond14.preheader.preheader ], [ %indvars.iv.next141, %for.cond14.for.inc29_crit_edge ]
  %7 = trunc nuw nsw i64 %indvars.iv140 to i32
  %conv17 = uitofp nneg i32 %7 to float
  %arrayidx23 = getelementptr inbounds nuw [2048 x i8], ptr %B, i64 %indvars.iv140
  br i1 %min.iters.check173, label %for.body16.preheader, label %vector.ph174

vector.ph174:                                     ; preds = %for.cond14.preheader
  %broadcast.splatinsert177 = insertelement <4 x float> poison, float %conv17, i64 0
  %broadcast.splat178 = shufflevector <4 x float> %broadcast.splatinsert177, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body181

vector.body181:                                   ; preds = %vector.body181, %vector.ph174
  %index182 = phi i64 [ 0, %vector.ph174 ], [ %index.next184, %vector.body181 ]
  %vec.ind183 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph174 ], [ %vec.ind.next185, %vector.body181 ]
  %8 = trunc <4 x i64> %vec.ind183 to <4 x i32>
  %9 = add <4 x i32> %8, splat (i32 1)
  %10 = uitofp nneg <4 x i32> %9 to <4 x float>
  %11 = fmul nnan <4 x float> %broadcast.splat178, %10
  %12 = fdiv <4 x float> %11, %broadcast.splat180
  %13 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx23, i64 %index182
  store <4 x float> %12, ptr %13, align 4, !tbaa !10
  %index.next184 = add nuw i64 %index182, 4
  %vec.ind.next185 = add nuw nsw <4 x i64> %vec.ind183, splat (i64 4)
  %14 = icmp eq i64 %index.next184, %n.vec176
  br i1 %14, label %middle.block186, label %vector.body181, !llvm.loop !18

middle.block186:                                  ; preds = %vector.body181
  br i1 %cmp.n187, label %for.cond14.for.inc29_crit_edge, label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.cond14.preheader, %middle.block186
  %indvars.iv135.ph = phi i64 [ 0, %for.cond14.preheader ], [ %n.vec176, %middle.block186 ]
  br label %for.body16

for.cond32.preheader:                             ; preds = %for.cond14.for.inc29_crit_edge, %for.cond1.preheader.lr.ph, %for.cond11.preheader
  %cmp33123 = icmp sgt i32 %nj, 0
  br i1 %cmp33123, label %for.cond35.preheader.lr.ph, label %for.cond54.preheader

for.cond35.preheader.lr.ph:                       ; preds = %for.cond32.preheader
  %cmp36121 = icmp sgt i32 %nm, 0
  %conv42 = sitofp i32 %nl to float
  br i1 %cmp36121, label %for.cond35.preheader.preheader, label %for.end75

for.cond35.preheader.preheader:                   ; preds = %for.cond35.preheader.lr.ph
  %wide.trip.count154 = zext nneg i32 %nj to i64
  %wide.trip.count149 = zext nneg i32 %nm to i64
  %min.iters.check190 = icmp ult i32 %nm, 4
  %n.vec193 = and i64 %wide.trip.count149, 2147483644
  %broadcast.splatinsert196 = insertelement <4 x float> poison, float %conv42, i64 0
  %broadcast.splat197 = shufflevector <4 x float> %broadcast.splatinsert196, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n204 = icmp eq i64 %n.vec193, %wide.trip.count149
  br label %for.cond35.preheader

for.body16:                                       ; preds = %for.body16.preheader, %for.body16
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %for.body16 ], [ %indvars.iv135.ph, %for.body16.preheader ]
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %15 = trunc nuw nsw i64 %indvars.iv.next136 to i32
  %conv18 = uitofp nneg i32 %15 to float
  %mul19 = fmul nnan float %conv17, %conv18
  %div21 = fdiv float %mul19, %conv20
  %arrayidx25 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx23, i64 %indvars.iv135
  store float %div21, ptr %arrayidx25, align 4, !tbaa !10
  %exitcond139.not = icmp eq i64 %indvars.iv.next136, %wide.trip.count138
  br i1 %exitcond139.not, label %for.cond14.for.inc29_crit_edge, label %for.body16, !llvm.loop !19

for.cond14.for.inc29_crit_edge:                   ; preds = %for.body16, %middle.block186
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond144.not = icmp eq i64 %indvars.iv.next141, %wide.trip.count143
  br i1 %exitcond144.not, label %for.cond32.preheader, label %for.cond14.preheader, !llvm.loop !20

for.cond35.preheader:                             ; preds = %for.cond35.preheader.preheader, %for.cond35.for.inc51_crit_edge
  %indvars.iv151 = phi i64 [ 0, %for.cond35.preheader.preheader ], [ %indvars.iv.next152, %for.cond35.for.inc51_crit_edge ]
  %16 = trunc nuw nsw i64 %indvars.iv151 to i32
  %conv38 = uitofp nneg i32 %16 to float
  %arrayidx45 = getelementptr inbounds nuw [2048 x i8], ptr %C, i64 %indvars.iv151
  br i1 %min.iters.check190, label %for.body37.preheader, label %vector.ph191

vector.ph191:                                     ; preds = %for.cond35.preheader
  %broadcast.splatinsert194 = insertelement <4 x float> poison, float %conv38, i64 0
  %broadcast.splat195 = shufflevector <4 x float> %broadcast.splatinsert194, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body198

vector.body198:                                   ; preds = %vector.body198, %vector.ph191
  %index199 = phi i64 [ 0, %vector.ph191 ], [ %index.next201, %vector.body198 ]
  %vec.ind200 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph191 ], [ %vec.ind.next202, %vector.body198 ]
  %17 = add <4 x i32> %vec.ind200, splat (i32 3)
  %18 = uitofp nneg <4 x i32> %17 to <4 x float>
  %19 = fmul nnan <4 x float> %broadcast.splat195, %18
  %20 = fdiv <4 x float> %19, %broadcast.splat197
  %21 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx45, i64 %index199
  store <4 x float> %20, ptr %21, align 4, !tbaa !10
  %index.next201 = add nuw i64 %index199, 4
  %vec.ind.next202 = add <4 x i32> %vec.ind200, splat (i32 4)
  %22 = icmp eq i64 %index.next201, %n.vec193
  br i1 %22, label %middle.block203, label %vector.body198, !llvm.loop !21

middle.block203:                                  ; preds = %vector.body198
  br i1 %cmp.n204, label %for.cond35.for.inc51_crit_edge, label %for.body37.preheader

for.body37.preheader:                             ; preds = %for.cond35.preheader, %middle.block203
  %indvars.iv145.ph = phi i64 [ 0, %for.cond35.preheader ], [ %n.vec193, %middle.block203 ]
  br label %for.body37

for.cond54.preheader:                             ; preds = %for.cond35.for.inc51_crit_edge, %for.cond14.preheader.lr.ph, %for.cond32.preheader
  %cmp55127 = icmp sgt i32 %nm, 0
  br i1 %cmp55127, label %for.cond57.preheader.lr.ph, label %for.end75

for.cond57.preheader.lr.ph:                       ; preds = %for.cond54.preheader
  %cmp58125 = icmp sgt i32 %nl, 0
  %conv64 = sitofp i32 %nk to float
  br i1 %cmp58125, label %for.cond57.preheader.preheader, label %for.end75

for.cond57.preheader.preheader:                   ; preds = %for.cond57.preheader.lr.ph
  %wide.trip.count165 = zext nneg i32 %nm to i64
  %wide.trip.count160 = zext nneg i32 %nl to i64
  %min.iters.check207 = icmp ult i32 %nl, 4
  %n.vec210 = and i64 %wide.trip.count160, 2147483644
  %broadcast.splatinsert213 = insertelement <4 x float> poison, float %conv64, i64 0
  %broadcast.splat214 = shufflevector <4 x float> %broadcast.splatinsert213, <4 x float> poison, <4 x i32> zeroinitializer
  %cmp.n221 = icmp eq i64 %n.vec210, %wide.trip.count160
  br label %for.cond57.preheader

for.body37:                                       ; preds = %for.body37.preheader, %for.body37
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %for.body37 ], [ %indvars.iv145.ph, %for.body37.preheader ]
  %23 = trunc i64 %indvars.iv145 to i32
  %24 = add i32 %23, 3
  %conv40 = uitofp nneg i32 %24 to float
  %mul41 = fmul nnan float %conv38, %conv40
  %div43 = fdiv float %mul41, %conv42
  %arrayidx47 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx45, i64 %indvars.iv145
  store float %div43, ptr %arrayidx47, align 4, !tbaa !10
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond150.not = icmp eq i64 %indvars.iv.next146, %wide.trip.count149
  br i1 %exitcond150.not, label %for.cond35.for.inc51_crit_edge, label %for.body37, !llvm.loop !22

for.cond35.for.inc51_crit_edge:                   ; preds = %for.body37, %middle.block203
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %exitcond155.not = icmp eq i64 %indvars.iv.next152, %wide.trip.count154
  br i1 %exitcond155.not, label %for.cond54.preheader, label %for.cond35.preheader, !llvm.loop !23

for.cond57.preheader:                             ; preds = %for.cond57.preheader.preheader, %for.cond57.for.inc73_crit_edge
  %indvars.iv162 = phi i64 [ 0, %for.cond57.preheader.preheader ], [ %indvars.iv.next163, %for.cond57.for.inc73_crit_edge ]
  %25 = trunc nuw nsw i64 %indvars.iv162 to i32
  %conv60 = uitofp nneg i32 %25 to float
  %arrayidx67 = getelementptr inbounds nuw [2048 x i8], ptr %D, i64 %indvars.iv162
  br i1 %min.iters.check207, label %for.body59.preheader, label %vector.ph208

vector.ph208:                                     ; preds = %for.cond57.preheader
  %broadcast.splatinsert211 = insertelement <4 x float> poison, float %conv60, i64 0
  %broadcast.splat212 = shufflevector <4 x float> %broadcast.splatinsert211, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body215

vector.body215:                                   ; preds = %vector.body215, %vector.ph208
  %index216 = phi i64 [ 0, %vector.ph208 ], [ %index.next218, %vector.body215 ]
  %vec.ind217 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph208 ], [ %vec.ind.next219, %vector.body215 ]
  %26 = add <4 x i32> %vec.ind217, splat (i32 2)
  %27 = uitofp nneg <4 x i32> %26 to <4 x float>
  %28 = fmul nnan <4 x float> %broadcast.splat212, %27
  %29 = fdiv <4 x float> %28, %broadcast.splat214
  %30 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx67, i64 %index216
  store <4 x float> %29, ptr %30, align 4, !tbaa !10
  %index.next218 = add nuw i64 %index216, 4
  %vec.ind.next219 = add <4 x i32> %vec.ind217, splat (i32 4)
  %31 = icmp eq i64 %index.next218, %n.vec210
  br i1 %31, label %middle.block220, label %vector.body215, !llvm.loop !24

middle.block220:                                  ; preds = %vector.body215
  br i1 %cmp.n221, label %for.cond57.for.inc73_crit_edge, label %for.body59.preheader

for.body59.preheader:                             ; preds = %for.cond57.preheader, %middle.block220
  %indvars.iv156.ph = phi i64 [ 0, %for.cond57.preheader ], [ %n.vec210, %middle.block220 ]
  br label %for.body59

for.body59:                                       ; preds = %for.body59.preheader, %for.body59
  %indvars.iv156 = phi i64 [ %indvars.iv.next157, %for.body59 ], [ %indvars.iv156.ph, %for.body59.preheader ]
  %32 = trunc i64 %indvars.iv156 to i32
  %33 = add i32 %32, 2
  %conv62 = uitofp nneg i32 %33 to float
  %mul63 = fmul nnan float %conv60, %conv62
  %div65 = fdiv float %mul63, %conv64
  %arrayidx69 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx67, i64 %indvars.iv156
  store float %div65, ptr %arrayidx69, align 4, !tbaa !10
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %exitcond161.not = icmp eq i64 %indvars.iv.next157, %wide.trip.count160
  br i1 %exitcond161.not, label %for.cond57.for.inc73_crit_edge, label %for.body59, !llvm.loop !25

for.cond57.for.inc73_crit_edge:                   ; preds = %for.body59, %middle.block220
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  %exitcond166.not = icmp eq i64 %indvars.iv.next163, %wide.trip.count165
  br i1 %exitcond166.not, label %for.end75, label %for.cond57.preheader, !llvm.loop !26

for.end75:                                        ; preds = %for.cond57.for.inc73_crit_edge, %for.cond35.preheader.lr.ph, %for.cond57.preheader.lr.ph, %for.cond54.preheader
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z14compareResultsiiPA512_fS0_(i32 noundef %ni, i32 noundef %nl, ptr nofree noundef readonly captures(none) %G, ptr nofree noundef readonly captures(none) %G_outputFromGpu) local_unnamed_addr #3 {
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
  %arrayidx.us = getelementptr inbounds nuw [2048 x i8], ptr %G, i64 %indvars.iv34
  %arrayidx7.us = getelementptr inbounds nuw [2048 x i8], ptr %G_outputFromGpu, i64 %indvars.iv34
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
define dso_local void @_Z26__device_stub__mm3_kernel1iiiiiPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr noundef %A, ptr noundef %B, ptr noundef %E) #7 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %nm.addr = alloca i32, align 4
  %A.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  %E.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !30
  store i32 %nk, ptr %nk.addr, align 4, !tbaa !30
  store i32 %nl, ptr %nl.addr, align 4, !tbaa !30
  store i32 %nm, ptr %nm.addr, align 4, !tbaa !30
  store ptr %A, ptr %A.addr, align 8, !tbaa !31
  store ptr %B, ptr %B.addr, align 8, !tbaa !31
  store ptr %E, ptr %E.addr, align 8, !tbaa !31
  %kernel_args1 = alloca [8 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %nk.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %nl.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %nm.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %A.addr, ptr %4, align 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 48
  store ptr %B.addr, ptr %5, align 16
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 56
  store ptr %E.addr, ptr %6, align 8
  %7 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %8 = load i64, ptr %shmem_size, align 8
  %9 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm3_kernel1iiiiiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %8, ptr noundef %9)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__mm3_kernel2iiiiiPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr noundef %C, ptr noundef %D, ptr noundef %F) #7 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %nm.addr = alloca i32, align 4
  %C.addr = alloca ptr, align 8
  %D.addr = alloca ptr, align 8
  %F.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !30
  store i32 %nk, ptr %nk.addr, align 4, !tbaa !30
  store i32 %nl, ptr %nl.addr, align 4, !tbaa !30
  store i32 %nm, ptr %nm.addr, align 4, !tbaa !30
  store ptr %C, ptr %C.addr, align 8, !tbaa !31
  store ptr %D, ptr %D.addr, align 8, !tbaa !31
  store ptr %F, ptr %F.addr, align 8, !tbaa !31
  %kernel_args1 = alloca [8 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %nk.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %nl.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %nm.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %C.addr, ptr %4, align 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 48
  store ptr %D.addr, ptr %5, align 16
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 56
  store ptr %F.addr, ptr %6, align 8
  %7 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %8 = load i64, ptr %shmem_size, align 8
  %9 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm3_kernel2iiiiiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %8, ptr noundef %9)
  ret void
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local void @_Z26__device_stub__mm3_kernel3iiiiiPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr noundef %E, ptr noundef %F, ptr noundef %G) #7 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %nm.addr = alloca i32, align 4
  %E.addr = alloca ptr, align 8
  %F.addr = alloca ptr, align 8
  %G.addr = alloca ptr, align 8
  %grid_dim = alloca %struct.dim3, align 8
  %block_dim = alloca %struct.dim3, align 8
  %shmem_size = alloca i64, align 8
  %stream = alloca ptr, align 8
  store i32 %ni, ptr %ni.addr, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr, align 4, !tbaa !30
  store i32 %nk, ptr %nk.addr, align 4, !tbaa !30
  store i32 %nl, ptr %nl.addr, align 4, !tbaa !30
  store i32 %nm, ptr %nm.addr, align 4, !tbaa !30
  store ptr %E, ptr %E.addr, align 8, !tbaa !31
  store ptr %F, ptr %F.addr, align 8, !tbaa !31
  store ptr %G, ptr %G.addr, align 8, !tbaa !31
  %kernel_args1 = alloca [8 x ptr], align 16
  store ptr %ni.addr, ptr %kernel_args1, align 16
  %0 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 8
  store ptr %nj.addr, ptr %0, align 8
  %1 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 16
  store ptr %nk.addr, ptr %1, align 16
  %2 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 24
  store ptr %nl.addr, ptr %2, align 8
  %3 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 32
  store ptr %nm.addr, ptr %3, align 16
  %4 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 40
  store ptr %E.addr, ptr %4, align 8
  %5 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 48
  store ptr %F.addr, ptr %5, align 16
  %6 = getelementptr inbounds nuw i8, ptr %kernel_args1, i64 56
  store ptr %G.addr, ptr %6, align 8
  %7 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim, ptr nonnull %block_dim, ptr nonnull %shmem_size, ptr nonnull %stream)
  %8 = load i64, ptr %shmem_size, align 8
  %9 = load ptr, ptr %stream, align 8
  %grid_dim.coerce.sroa.0.0.copyload = load i64, ptr %grid_dim, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %grid_dim, i64 8
  %grid_dim.coerce.sroa.2.0.copyload = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx, align 8
  %block_dim.coerce.sroa.0.0.copyload = load i64, ptr %block_dim, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx = getelementptr inbounds nuw i8, ptr %block_dim, i64 8
  %block_dim.coerce.sroa.2.0.copyload = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx, align 8
  %call = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm3_kernel3iiiiiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload, i32 %grid_dim.coerce.sroa.2.0.copyload, i64 %block_dim.coerce.sroa.0.0.copyload, i32 %block_dim.coerce.sroa.2.0.copyload, ptr noundef nonnull %kernel_args1, i64 noundef %8, ptr noundef %9)
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @_Z7mm3_cpuiiiiiPA512_fS0_S0_S0_S0_S0_S0_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr nofree noundef captures(none) %E, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef captures(none) %F, ptr nofree noundef readonly captures(none) %C, ptr nofree noundef readonly captures(none) %D, ptr nofree noundef writeonly captures(none) %G) local_unnamed_addr #8 {
entry:
  %cmp147 = icmp sgt i32 %ni, 0
  br i1 %cmp147, label %for.cond1.preheader.lr.ph, label %for.cond27.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp2145 = icmp sgt i32 %nj, 0
  br i1 %cmp2145, label %for.cond1.preheader.lr.ph.split, label %for.cond64.preheader.lr.ph.thread

for.cond1.preheader.lr.ph.split:                  ; preds = %for.cond1.preheader.lr.ph
  %cmp7143 = icmp sgt i32 %nk, 0
  br i1 %cmp7143, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

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
  %wide.trip.count190 = zext nneg i32 %ni to i64
  %wide.trip.count185 = zext nneg i32 %nj to i64
  %wide.trip.count177 = zext nneg i32 %nk to i64
  %xtraiter264 = and i64 %wide.trip.count177, 1
  %3 = icmp eq i32 %nk, 1
  %unroll_iter268 = and i64 %wide.trip.count177, 2147483646
  %lcmp.mod266.not = icmp eq i64 %xtraiter264, 0
  %lcmp.mod267 = trunc i32 %nk to i1
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc24_crit_edge.split.us.us
  %indvars.iv187 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next188, %for.cond1.for.inc24_crit_edge.split.us.us ]
  %arrayidx.us = getelementptr inbounds nuw [2048 x i8], ptr %E, i64 %indvars.iv187
  %arrayidx10.us = getelementptr inbounds nuw [2048 x i8], ptr %A, i64 %indvars.iv187
  br label %for.body3.us.us

for.body3.us.us:                                  ; preds = %for.cond6.for.inc21_crit_edge.us.us, %for.cond1.preheader.us
  %indvars.iv182 = phi i64 [ %indvars.iv.next183, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.cond1.preheader.us ]
  %arrayidx5.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us, i64 %indvars.iv182
  store float 0.000000e+00, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %invariant.gep.us.us = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %indvars.iv182
  br i1 %3, label %for.body8.us.us.epil.preheader, label %for.body8.us.us

for.body8.us.us:                                  ; preds = %for.body3.us.us, %for.body8.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body8.us.us ], [ 0, %for.body3.us.us ]
  %4 = phi float [ %10, %for.body8.us.us ], [ 0.000000e+00, %for.body3.us.us ]
  %niter269 = phi i64 [ %niter269.next.1, %for.body8.us.us ], [ 0, %for.body3.us.us ]
  %arrayidx12.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us, i64 %indvars.iv
  %5 = load float, ptr %arrayidx12.us.us, align 4, !tbaa !10
  %gep.us.us = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv
  %6 = load float, ptr %gep.us.us, align 4, !tbaa !10
  %7 = tail call float @llvm.fmuladd.f32(float %5, float %6, float %4)
  store float %7, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %indvars.iv.next = or disjoint i64 %indvars.iv, 1
  %arrayidx12.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us, i64 %indvars.iv.next
  %8 = load float, ptr %arrayidx12.us.us.1, align 4, !tbaa !10
  %gep.us.us.1 = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv.next
  %9 = load float, ptr %gep.us.us.1, align 4, !tbaa !10
  %10 = tail call float @llvm.fmuladd.f32(float %8, float %9, float %7)
  store float %10, ptr %arrayidx5.us.us, align 4, !tbaa !10
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %niter269.next.1 = add i64 %niter269, 2
  %niter269.ncmp.1 = icmp eq i64 %niter269.next.1, %unroll_iter268
  br i1 %niter269.ncmp.1, label %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa, label %for.body8.us.us, !llvm.loop !34

for.cond6.for.inc21_crit_edge.us.us.unr-lcssa:    ; preds = %for.body8.us.us
  br i1 %lcmp.mod266.not, label %for.cond6.for.inc21_crit_edge.us.us, label %for.body8.us.us.epil.preheader

for.body8.us.us.epil.preheader:                   ; preds = %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa, %for.body3.us.us
  %indvars.iv.epil.init = phi i64 [ 0, %for.body3.us.us ], [ %indvars.iv.next.1, %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa ]
  %.epil.init = phi float [ 0.000000e+00, %for.body3.us.us ], [ %10, %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod267)
  %arrayidx12.us.us.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us, i64 %indvars.iv.epil.init
  %11 = load float, ptr %arrayidx12.us.us.epil, align 4, !tbaa !10
  %gep.us.us.epil = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us, i64 %indvars.iv.epil.init
  %12 = load float, ptr %gep.us.us.epil, align 4, !tbaa !10
  %13 = tail call float @llvm.fmuladd.f32(float %11, float %12, float %.epil.init)
  store float %13, ptr %arrayidx5.us.us, align 4, !tbaa !10
  br label %for.cond6.for.inc21_crit_edge.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.cond6.for.inc21_crit_edge.us.us.unr-lcssa, %for.body8.us.us.epil.preheader
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %exitcond186.not = icmp eq i64 %indvars.iv.next183, %wide.trip.count185
  br i1 %exitcond186.not, label %for.cond1.for.inc24_crit_edge.split.us.us, label %for.body3.us.us, !llvm.loop !35

for.cond1.for.inc24_crit_edge.split.us.us:        ; preds = %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  %exitcond191.not = icmp eq i64 %indvars.iv.next188, %wide.trip.count190
  br i1 %exitcond191.not, label %for.cond27.preheader, label %for.cond1.preheader.us, !llvm.loop !36

for.cond1.preheader:                              ; preds = %for.cond1.preheader, %for.cond1.preheader.preheader.new
  %indvar = phi i64 [ 0, %for.cond1.preheader.preheader.new ], [ %indvar.next.7, %for.cond1.preheader ]
  %niter = phi i64 [ 0, %for.cond1.preheader.preheader.new ], [ %niter.next.7, %for.cond1.preheader ]
  %14 = shl nuw nsw i64 %indvar, 11
  %scevgep = getelementptr nuw i8, ptr %E, i64 %14
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next = shl i64 %indvar, 11
  %15 = getelementptr nuw i8, ptr %E, i64 %indvar.next
  %scevgep.1 = getelementptr nuw i8, ptr %15, i64 2048
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.1, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.1 = shl i64 %indvar, 11
  %16 = getelementptr nuw i8, ptr %E, i64 %indvar.next.1
  %scevgep.2 = getelementptr nuw i8, ptr %16, i64 4096
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.2, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.2 = shl i64 %indvar, 11
  %17 = getelementptr nuw i8, ptr %E, i64 %indvar.next.2
  %scevgep.3 = getelementptr nuw i8, ptr %17, i64 6144
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.3, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.3 = shl i64 %indvar, 11
  %18 = getelementptr nuw i8, ptr %E, i64 %indvar.next.3
  %scevgep.4 = getelementptr nuw i8, ptr %18, i64 8192
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.4, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.4 = shl i64 %indvar, 11
  %19 = getelementptr nuw i8, ptr %E, i64 %indvar.next.4
  %scevgep.5 = getelementptr nuw i8, ptr %19, i64 10240
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.5, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.5 = shl i64 %indvar, 11
  %20 = getelementptr nuw i8, ptr %E, i64 %indvar.next.5
  %scevgep.6 = getelementptr nuw i8, ptr %20, i64 12288
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.6, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.6 = shl i64 %indvar, 11
  %21 = getelementptr nuw i8, ptr %E, i64 %indvar.next.6
  %scevgep.7 = getelementptr nuw i8, ptr %21, i64 14336
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep.7, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.7 = add nuw nsw i64 %indvar, 8
  %niter.next.7 = add i64 %niter, 8
  %niter.ncmp.7 = icmp eq i64 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.cond30.preheader.lr.ph.loopexit.unr-lcssa, label %for.cond1.preheader, !llvm.loop !36

for.cond27.preheader:                             ; preds = %for.cond1.for.inc24_crit_edge.split.us.us, %entry
  %cmp28155 = icmp sgt i32 %nj, 0
  br i1 %cmp28155, label %for.cond30.preheader.lr.ph, label %for.cond61.preheader

for.cond30.preheader.lr.ph.loopexit.unr-lcssa:    ; preds = %for.cond1.preheader
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.cond30.preheader.lr.ph, label %for.cond1.preheader.epil.preheader

for.cond1.preheader.epil.preheader:               ; preds = %for.cond30.preheader.lr.ph.loopexit.unr-lcssa, %for.cond1.preheader.preheader
  %indvar.epil.init = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvar.next.7, %for.cond30.preheader.lr.ph.loopexit.unr-lcssa ]
  %lcmp.mod263 = icmp ne i64 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod263)
  br label %for.cond1.preheader.epil

for.cond1.preheader.epil:                         ; preds = %for.cond1.preheader.epil, %for.cond1.preheader.epil.preheader
  %indvar.epil = phi i64 [ %indvar.epil.init, %for.cond1.preheader.epil.preheader ], [ %indvar.next.epil, %for.cond1.preheader.epil ]
  %epil.iter = phi i64 [ 0, %for.cond1.preheader.epil.preheader ], [ %epil.iter.next, %for.cond1.preheader.epil ]
  %22 = shl nuw nsw i64 %indvar.epil, 11
  %scevgep.epil = getelementptr nuw i8, ptr %E, i64 %22
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep.epil, i8 0, i64 %1, i1 false), !tbaa !10
  %indvar.next.epil = add nuw nsw i64 %indvar.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.cond30.preheader.lr.ph, label %for.cond1.preheader.epil, !llvm.loop !37

for.cond30.preheader.lr.ph:                       ; preds = %for.cond30.preheader.lr.ph.loopexit.unr-lcssa, %for.cond1.preheader.epil, %for.cond27.preheader
  %cmp31153 = icmp sgt i32 %nl, 0
  br i1 %cmp31153, label %for.cond30.preheader.lr.ph.split, label %for.cond61.preheader

for.cond30.preheader.lr.ph.split:                 ; preds = %for.cond30.preheader.lr.ph
  %cmp38151 = icmp sgt i32 %nm, 0
  br i1 %cmp38151, label %for.cond30.preheader.us.preheader, label %for.cond30.preheader.preheader

for.cond30.preheader.preheader:                   ; preds = %for.cond30.preheader.lr.ph.split
  %23 = zext nneg i32 %nl to i64
  %24 = shl nuw nsw i64 %23, 2
  %wide.trip.count199 = zext nneg i32 %nj to i64
  %xtraiter270 = and i64 %wide.trip.count199, 7
  %25 = add i32 %nj, -1
  %26 = icmp ult i32 %25, 7
  br i1 %26, label %for.cond30.preheader.epil.preheader, label %for.cond30.preheader.preheader.new

for.cond30.preheader.preheader.new:               ; preds = %for.cond30.preheader.preheader
  %unroll_iter274 = and i64 %wide.trip.count199, 2147483640
  br label %for.cond30.preheader

for.cond30.preheader.us.preheader:                ; preds = %for.cond30.preheader.lr.ph.split
  %wide.trip.count217 = zext nneg i32 %nj to i64
  %wide.trip.count212 = zext nneg i32 %nl to i64
  %wide.trip.count204 = zext nneg i32 %nm to i64
  %xtraiter276 = and i64 %wide.trip.count204, 1
  %27 = icmp eq i32 %nm, 1
  %unroll_iter282 = and i64 %wide.trip.count204, 2147483646
  %lcmp.mod280.not = icmp eq i64 %xtraiter276, 0
  %lcmp.mod281 = trunc i32 %nm to i1
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us.preheader, %for.cond30.for.inc58_crit_edge.split.us.us
  %indvars.iv214 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next215, %for.cond30.for.inc58_crit_edge.split.us.us ]
  %arrayidx34.us = getelementptr inbounds nuw [2048 x i8], ptr %F, i64 %indvars.iv214
  %arrayidx41.us = getelementptr inbounds nuw [2048 x i8], ptr %C, i64 %indvars.iv214
  br label %for.body32.us.us

for.body32.us.us:                                 ; preds = %for.cond37.for.inc55_crit_edge.us.us, %for.cond30.preheader.us
  %indvars.iv209 = phi i64 [ %indvars.iv.next210, %for.cond37.for.inc55_crit_edge.us.us ], [ 0, %for.cond30.preheader.us ]
  %arrayidx36.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx34.us, i64 %indvars.iv209
  store float 0.000000e+00, ptr %arrayidx36.us.us, align 4, !tbaa !10
  %invariant.gep.us.us157 = getelementptr inbounds nuw [4 x i8], ptr %D, i64 %indvars.iv209
  br i1 %27, label %for.body39.us.us.epil.preheader, label %for.body39.us.us

for.body39.us.us:                                 ; preds = %for.body32.us.us, %for.body39.us.us
  %indvars.iv201 = phi i64 [ %indvars.iv.next202.1, %for.body39.us.us ], [ 0, %for.body32.us.us ]
  %28 = phi float [ %34, %for.body39.us.us ], [ 0.000000e+00, %for.body32.us.us ]
  %niter283 = phi i64 [ %niter283.next.1, %for.body39.us.us ], [ 0, %for.body32.us.us ]
  %arrayidx43.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx41.us, i64 %indvars.iv201
  %29 = load float, ptr %arrayidx43.us.us, align 4, !tbaa !10
  %gep.us.us158 = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us157, i64 %indvars.iv201
  %30 = load float, ptr %gep.us.us158, align 4, !tbaa !10
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float %28)
  store float %31, ptr %arrayidx36.us.us, align 4, !tbaa !10
  %indvars.iv.next202 = or disjoint i64 %indvars.iv201, 1
  %arrayidx43.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx41.us, i64 %indvars.iv.next202
  %32 = load float, ptr %arrayidx43.us.us.1, align 4, !tbaa !10
  %gep.us.us158.1 = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us157, i64 %indvars.iv.next202
  %33 = load float, ptr %gep.us.us158.1, align 4, !tbaa !10
  %34 = tail call float @llvm.fmuladd.f32(float %32, float %33, float %31)
  store float %34, ptr %arrayidx36.us.us, align 4, !tbaa !10
  %indvars.iv.next202.1 = add nuw nsw i64 %indvars.iv201, 2
  %niter283.next.1 = add i64 %niter283, 2
  %niter283.ncmp.1 = icmp eq i64 %niter283.next.1, %unroll_iter282
  br i1 %niter283.ncmp.1, label %for.cond37.for.inc55_crit_edge.us.us.unr-lcssa, label %for.body39.us.us, !llvm.loop !39

for.cond37.for.inc55_crit_edge.us.us.unr-lcssa:   ; preds = %for.body39.us.us
  br i1 %lcmp.mod280.not, label %for.cond37.for.inc55_crit_edge.us.us, label %for.body39.us.us.epil.preheader

for.body39.us.us.epil.preheader:                  ; preds = %for.cond37.for.inc55_crit_edge.us.us.unr-lcssa, %for.body32.us.us
  %indvars.iv201.epil.init = phi i64 [ 0, %for.body32.us.us ], [ %indvars.iv.next202.1, %for.cond37.for.inc55_crit_edge.us.us.unr-lcssa ]
  %.epil.init279 = phi float [ 0.000000e+00, %for.body32.us.us ], [ %34, %for.cond37.for.inc55_crit_edge.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod281)
  %arrayidx43.us.us.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx41.us, i64 %indvars.iv201.epil.init
  %35 = load float, ptr %arrayidx43.us.us.epil, align 4, !tbaa !10
  %gep.us.us158.epil = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us157, i64 %indvars.iv201.epil.init
  %36 = load float, ptr %gep.us.us158.epil, align 4, !tbaa !10
  %37 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %.epil.init279)
  store float %37, ptr %arrayidx36.us.us, align 4, !tbaa !10
  br label %for.cond37.for.inc55_crit_edge.us.us

for.cond37.for.inc55_crit_edge.us.us:             ; preds = %for.cond37.for.inc55_crit_edge.us.us.unr-lcssa, %for.body39.us.us.epil.preheader
  %indvars.iv.next210 = add nuw nsw i64 %indvars.iv209, 1
  %exitcond213.not = icmp eq i64 %indvars.iv.next210, %wide.trip.count212
  br i1 %exitcond213.not, label %for.cond30.for.inc58_crit_edge.split.us.us, label %for.body32.us.us, !llvm.loop !40

for.cond30.for.inc58_crit_edge.split.us.us:       ; preds = %for.cond37.for.inc55_crit_edge.us.us
  %indvars.iv.next215 = add nuw nsw i64 %indvars.iv214, 1
  %exitcond218.not = icmp eq i64 %indvars.iv.next215, %wide.trip.count217
  br i1 %exitcond218.not, label %for.cond61.preheader, label %for.cond30.preheader.us, !llvm.loop !41

for.cond30.preheader:                             ; preds = %for.cond30.preheader, %for.cond30.preheader.preheader.new
  %indvar192 = phi i64 [ 0, %for.cond30.preheader.preheader.new ], [ %indvar.next193.7, %for.cond30.preheader ]
  %niter275 = phi i64 [ 0, %for.cond30.preheader.preheader.new ], [ %niter275.next.7, %for.cond30.preheader ]
  %38 = shl nuw nsw i64 %indvar192, 11
  %scevgep194 = getelementptr nuw i8, ptr %F, i64 %38
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep194, i8 0, i64 %24, i1 false), !tbaa !10
  %indvar.next193 = shl i64 %indvar192, 11
  %39 = getelementptr nuw i8, ptr %F, i64 %indvar.next193
  %scevgep194.1 = getelementptr nuw i8, ptr %39, i64 2048
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep194.1, i8 0, i64 %24, i1 false), !tbaa !10
  %indvar.next193.1 = shl i64 %indvar192, 11
  %40 = getelementptr nuw i8, ptr %F, i64 %indvar.next193.1
  %scevgep194.2 = getelementptr nuw i8, ptr %40, i64 4096
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep194.2, i8 0, i64 %24, i1 false), !tbaa !10
  %indvar.next193.2 = shl i64 %indvar192, 11
  %41 = getelementptr nuw i8, ptr %F, i64 %indvar.next193.2
  %scevgep194.3 = getelementptr nuw i8, ptr %41, i64 6144
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep194.3, i8 0, i64 %24, i1 false), !tbaa !10
  %indvar.next193.3 = shl i64 %indvar192, 11
  %42 = getelementptr nuw i8, ptr %F, i64 %indvar.next193.3
  %scevgep194.4 = getelementptr nuw i8, ptr %42, i64 8192
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep194.4, i8 0, i64 %24, i1 false), !tbaa !10
  %indvar.next193.4 = shl i64 %indvar192, 11
  %43 = getelementptr nuw i8, ptr %F, i64 %indvar.next193.4
  %scevgep194.5 = getelementptr nuw i8, ptr %43, i64 10240
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep194.5, i8 0, i64 %24, i1 false), !tbaa !10
  %indvar.next193.5 = shl i64 %indvar192, 11
  %44 = getelementptr nuw i8, ptr %F, i64 %indvar.next193.5
  %scevgep194.6 = getelementptr nuw i8, ptr %44, i64 12288
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep194.6, i8 0, i64 %24, i1 false), !tbaa !10
  %indvar.next193.6 = shl i64 %indvar192, 11
  %45 = getelementptr nuw i8, ptr %F, i64 %indvar.next193.6
  %scevgep194.7 = getelementptr nuw i8, ptr %45, i64 14336
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep194.7, i8 0, i64 %24, i1 false), !tbaa !10
  %indvar.next193.7 = add nuw nsw i64 %indvar192, 8
  %niter275.next.7 = add i64 %niter275, 8
  %niter275.ncmp.7 = icmp eq i64 %niter275.next.7, %unroll_iter274
  br i1 %niter275.ncmp.7, label %for.cond61.preheader.loopexit262.unr-lcssa, label %for.cond30.preheader, !llvm.loop !41

for.cond61.preheader.loopexit262.unr-lcssa:       ; preds = %for.cond30.preheader
  %lcmp.mod272.not = icmp eq i64 %xtraiter270, 0
  br i1 %lcmp.mod272.not, label %for.cond61.preheader, label %for.cond30.preheader.epil.preheader

for.cond30.preheader.epil.preheader:              ; preds = %for.cond61.preheader.loopexit262.unr-lcssa, %for.cond30.preheader.preheader
  %indvar192.epil.init = phi i64 [ 0, %for.cond30.preheader.preheader ], [ %indvar.next193.7, %for.cond61.preheader.loopexit262.unr-lcssa ]
  %lcmp.mod273 = icmp ne i64 %xtraiter270, 0
  tail call void @llvm.assume(i1 %lcmp.mod273)
  br label %for.cond30.preheader.epil

for.cond30.preheader.epil:                        ; preds = %for.cond30.preheader.epil, %for.cond30.preheader.epil.preheader
  %indvar192.epil = phi i64 [ %indvar192.epil.init, %for.cond30.preheader.epil.preheader ], [ %indvar.next193.epil, %for.cond30.preheader.epil ]
  %epil.iter271 = phi i64 [ 0, %for.cond30.preheader.epil.preheader ], [ %epil.iter271.next, %for.cond30.preheader.epil ]
  %46 = shl nuw nsw i64 %indvar192.epil, 11
  %scevgep194.epil = getelementptr nuw i8, ptr %F, i64 %46
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep194.epil, i8 0, i64 %24, i1 false), !tbaa !10
  %indvar.next193.epil = add nuw nsw i64 %indvar192.epil, 1
  %epil.iter271.next = add i64 %epil.iter271, 1
  %epil.iter271.cmp.not = icmp eq i64 %epil.iter271.next, %xtraiter270
  br i1 %epil.iter271.cmp.not, label %for.cond61.preheader, label %for.cond30.preheader.epil, !llvm.loop !42

for.cond61.preheader:                             ; preds = %for.cond61.preheader.loopexit262.unr-lcssa, %for.cond30.preheader.epil, %for.cond30.for.inc58_crit_edge.split.us.us, %for.cond30.preheader.lr.ph, %for.cond27.preheader
  %cmp28155247 = phi i1 [ false, %for.cond27.preheader ], [ true, %for.cond30.for.inc58_crit_edge.split.us.us ], [ true, %for.cond30.preheader.lr.ph ], [ true, %for.cond30.preheader.epil ], [ true, %for.cond61.preheader.loopexit262.unr-lcssa ]
  %cmp65163 = icmp sgt i32 %nl, 0
  %or.cond = and i1 %cmp147, %cmp65163
  br i1 %or.cond, label %for.cond64.preheader.lr.ph.split, label %for.end94

for.cond64.preheader.lr.ph.thread:                ; preds = %for.cond1.preheader.lr.ph
  %cmp65163254 = icmp sgt i32 %nl, 0
  br i1 %cmp65163254, label %for.cond64.preheader.preheader, label %for.end94

for.cond64.preheader.lr.ph.split:                 ; preds = %for.cond61.preheader
  br i1 %cmp28155247, label %for.cond64.preheader.us.preheader, label %for.cond64.preheader.preheader

for.cond64.preheader.preheader:                   ; preds = %for.cond64.preheader.lr.ph.thread, %for.cond64.preheader.lr.ph.split
  %47 = zext nneg i32 %nl to i64
  %48 = shl nuw nsw i64 %47, 2
  %wide.trip.count226 = zext nneg i32 %ni to i64
  %xtraiter284 = and i64 %wide.trip.count226, 7
  %49 = add i32 %ni, -1
  %50 = icmp ult i32 %49, 7
  br i1 %50, label %for.cond64.preheader.epil.preheader, label %for.cond64.preheader.preheader.new

for.cond64.preheader.preheader.new:               ; preds = %for.cond64.preheader.preheader
  %unroll_iter288 = and i64 %wide.trip.count226, 2147483640
  br label %for.cond64.preheader

for.cond64.preheader.us.preheader:                ; preds = %for.cond64.preheader.lr.ph.split
  %wide.trip.count244 = zext nneg i32 %ni to i64
  %wide.trip.count239 = zext nneg i32 %nl to i64
  %wide.trip.count231 = zext nneg i32 %nj to i64
  %xtraiter290 = and i64 %wide.trip.count231, 1
  %51 = icmp eq i32 %nj, 1
  %unroll_iter296 = and i64 %wide.trip.count231, 2147483646
  %lcmp.mod294.not = icmp eq i64 %xtraiter290, 0
  %lcmp.mod295 = trunc i32 %nj to i1
  br label %for.cond64.preheader.us

for.cond64.preheader.us:                          ; preds = %for.cond64.preheader.us.preheader, %for.cond64.for.inc92_crit_edge.split.us.us
  %indvars.iv241 = phi i64 [ 0, %for.cond64.preheader.us.preheader ], [ %indvars.iv.next242, %for.cond64.for.inc92_crit_edge.split.us.us ]
  %arrayidx68.us = getelementptr inbounds nuw [2048 x i8], ptr %G, i64 %indvars.iv241
  %arrayidx75.us = getelementptr inbounds nuw [2048 x i8], ptr %E, i64 %indvars.iv241
  br label %for.body66.us.us

for.body66.us.us:                                 ; preds = %for.cond71.for.inc89_crit_edge.us.us, %for.cond64.preheader.us
  %indvars.iv236 = phi i64 [ %indvars.iv.next237, %for.cond71.for.inc89_crit_edge.us.us ], [ 0, %for.cond64.preheader.us ]
  %arrayidx70.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx68.us, i64 %indvars.iv236
  store float 0.000000e+00, ptr %arrayidx70.us.us, align 4, !tbaa !10
  %invariant.gep.us.us167 = getelementptr inbounds nuw [4 x i8], ptr %F, i64 %indvars.iv236
  br i1 %51, label %for.body73.us.us.epil.preheader, label %for.body73.us.us

for.body73.us.us:                                 ; preds = %for.body66.us.us, %for.body73.us.us
  %indvars.iv228 = phi i64 [ %indvars.iv.next229.1, %for.body73.us.us ], [ 0, %for.body66.us.us ]
  %52 = phi float [ %58, %for.body73.us.us ], [ 0.000000e+00, %for.body66.us.us ]
  %niter297 = phi i64 [ %niter297.next.1, %for.body73.us.us ], [ 0, %for.body66.us.us ]
  %arrayidx77.us.us = getelementptr inbounds nuw [4 x i8], ptr %arrayidx75.us, i64 %indvars.iv228
  %53 = load float, ptr %arrayidx77.us.us, align 4, !tbaa !10
  %gep.us.us168 = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us167, i64 %indvars.iv228
  %54 = load float, ptr %gep.us.us168, align 4, !tbaa !10
  %55 = tail call float @llvm.fmuladd.f32(float %53, float %54, float %52)
  store float %55, ptr %arrayidx70.us.us, align 4, !tbaa !10
  %indvars.iv.next229 = or disjoint i64 %indvars.iv228, 1
  %arrayidx77.us.us.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx75.us, i64 %indvars.iv.next229
  %56 = load float, ptr %arrayidx77.us.us.1, align 4, !tbaa !10
  %gep.us.us168.1 = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us167, i64 %indvars.iv.next229
  %57 = load float, ptr %gep.us.us168.1, align 4, !tbaa !10
  %58 = tail call float @llvm.fmuladd.f32(float %56, float %57, float %55)
  store float %58, ptr %arrayidx70.us.us, align 4, !tbaa !10
  %indvars.iv.next229.1 = add nuw nsw i64 %indvars.iv228, 2
  %niter297.next.1 = add i64 %niter297, 2
  %niter297.ncmp.1 = icmp eq i64 %niter297.next.1, %unroll_iter296
  br i1 %niter297.ncmp.1, label %for.cond71.for.inc89_crit_edge.us.us.unr-lcssa, label %for.body73.us.us, !llvm.loop !43

for.cond71.for.inc89_crit_edge.us.us.unr-lcssa:   ; preds = %for.body73.us.us
  br i1 %lcmp.mod294.not, label %for.cond71.for.inc89_crit_edge.us.us, label %for.body73.us.us.epil.preheader

for.body73.us.us.epil.preheader:                  ; preds = %for.cond71.for.inc89_crit_edge.us.us.unr-lcssa, %for.body66.us.us
  %indvars.iv228.epil.init = phi i64 [ 0, %for.body66.us.us ], [ %indvars.iv.next229.1, %for.cond71.for.inc89_crit_edge.us.us.unr-lcssa ]
  %.epil.init293 = phi float [ 0.000000e+00, %for.body66.us.us ], [ %58, %for.cond71.for.inc89_crit_edge.us.us.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod295)
  %arrayidx77.us.us.epil = getelementptr inbounds nuw [4 x i8], ptr %arrayidx75.us, i64 %indvars.iv228.epil.init
  %59 = load float, ptr %arrayidx77.us.us.epil, align 4, !tbaa !10
  %gep.us.us168.epil = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us167, i64 %indvars.iv228.epil.init
  %60 = load float, ptr %gep.us.us168.epil, align 4, !tbaa !10
  %61 = tail call float @llvm.fmuladd.f32(float %59, float %60, float %.epil.init293)
  store float %61, ptr %arrayidx70.us.us, align 4, !tbaa !10
  br label %for.cond71.for.inc89_crit_edge.us.us

for.cond71.for.inc89_crit_edge.us.us:             ; preds = %for.cond71.for.inc89_crit_edge.us.us.unr-lcssa, %for.body73.us.us.epil.preheader
  %indvars.iv.next237 = add nuw nsw i64 %indvars.iv236, 1
  %exitcond240.not = icmp eq i64 %indvars.iv.next237, %wide.trip.count239
  br i1 %exitcond240.not, label %for.cond64.for.inc92_crit_edge.split.us.us, label %for.body66.us.us, !llvm.loop !44

for.cond64.for.inc92_crit_edge.split.us.us:       ; preds = %for.cond71.for.inc89_crit_edge.us.us
  %indvars.iv.next242 = add nuw nsw i64 %indvars.iv241, 1
  %exitcond245.not = icmp eq i64 %indvars.iv.next242, %wide.trip.count244
  br i1 %exitcond245.not, label %for.end94, label %for.cond64.preheader.us, !llvm.loop !45

for.cond64.preheader:                             ; preds = %for.cond64.preheader, %for.cond64.preheader.preheader.new
  %indvar219 = phi i64 [ 0, %for.cond64.preheader.preheader.new ], [ %indvar.next220.7, %for.cond64.preheader ]
  %niter289 = phi i64 [ 0, %for.cond64.preheader.preheader.new ], [ %niter289.next.7, %for.cond64.preheader ]
  %62 = shl nuw nsw i64 %indvar219, 11
  %scevgep221 = getelementptr nuw i8, ptr %G, i64 %62
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep221, i8 0, i64 %48, i1 false), !tbaa !10
  %indvar.next220 = shl i64 %indvar219, 11
  %63 = getelementptr nuw i8, ptr %G, i64 %indvar.next220
  %scevgep221.1 = getelementptr nuw i8, ptr %63, i64 2048
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep221.1, i8 0, i64 %48, i1 false), !tbaa !10
  %indvar.next220.1 = shl i64 %indvar219, 11
  %64 = getelementptr nuw i8, ptr %G, i64 %indvar.next220.1
  %scevgep221.2 = getelementptr nuw i8, ptr %64, i64 4096
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep221.2, i8 0, i64 %48, i1 false), !tbaa !10
  %indvar.next220.2 = shl i64 %indvar219, 11
  %65 = getelementptr nuw i8, ptr %G, i64 %indvar.next220.2
  %scevgep221.3 = getelementptr nuw i8, ptr %65, i64 6144
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep221.3, i8 0, i64 %48, i1 false), !tbaa !10
  %indvar.next220.3 = shl i64 %indvar219, 11
  %66 = getelementptr nuw i8, ptr %G, i64 %indvar.next220.3
  %scevgep221.4 = getelementptr nuw i8, ptr %66, i64 8192
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep221.4, i8 0, i64 %48, i1 false), !tbaa !10
  %indvar.next220.4 = shl i64 %indvar219, 11
  %67 = getelementptr nuw i8, ptr %G, i64 %indvar.next220.4
  %scevgep221.5 = getelementptr nuw i8, ptr %67, i64 10240
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep221.5, i8 0, i64 %48, i1 false), !tbaa !10
  %indvar.next220.5 = shl i64 %indvar219, 11
  %68 = getelementptr nuw i8, ptr %G, i64 %indvar.next220.5
  %scevgep221.6 = getelementptr nuw i8, ptr %68, i64 12288
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep221.6, i8 0, i64 %48, i1 false), !tbaa !10
  %indvar.next220.6 = shl i64 %indvar219, 11
  %69 = getelementptr nuw i8, ptr %G, i64 %indvar.next220.6
  %scevgep221.7 = getelementptr nuw i8, ptr %69, i64 14336
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %scevgep221.7, i8 0, i64 %48, i1 false), !tbaa !10
  %indvar.next220.7 = add nuw nsw i64 %indvar219, 8
  %niter289.next.7 = add i64 %niter289, 8
  %niter289.ncmp.7 = icmp eq i64 %niter289.next.7, %unroll_iter288
  br i1 %niter289.ncmp.7, label %for.end94.loopexit261.unr-lcssa, label %for.cond64.preheader, !llvm.loop !45

for.end94.loopexit261.unr-lcssa:                  ; preds = %for.cond64.preheader
  %lcmp.mod286.not = icmp eq i64 %xtraiter284, 0
  br i1 %lcmp.mod286.not, label %for.end94, label %for.cond64.preheader.epil.preheader

for.cond64.preheader.epil.preheader:              ; preds = %for.end94.loopexit261.unr-lcssa, %for.cond64.preheader.preheader
  %indvar219.epil.init = phi i64 [ 0, %for.cond64.preheader.preheader ], [ %indvar.next220.7, %for.end94.loopexit261.unr-lcssa ]
  %lcmp.mod287 = icmp ne i64 %xtraiter284, 0
  tail call void @llvm.assume(i1 %lcmp.mod287)
  br label %for.cond64.preheader.epil

for.cond64.preheader.epil:                        ; preds = %for.cond64.preheader.epil, %for.cond64.preheader.epil.preheader
  %indvar219.epil = phi i64 [ %indvar219.epil.init, %for.cond64.preheader.epil.preheader ], [ %indvar.next220.epil, %for.cond64.preheader.epil ]
  %epil.iter285 = phi i64 [ 0, %for.cond64.preheader.epil.preheader ], [ %epil.iter285.next, %for.cond64.preheader.epil ]
  %70 = shl nuw nsw i64 %indvar219.epil, 11
  %scevgep221.epil = getelementptr nuw i8, ptr %G, i64 %70
  tail call void @llvm.memset.p0.i64(ptr align 4 %scevgep221.epil, i8 0, i64 %48, i1 false), !tbaa !10
  %indvar.next220.epil = add nuw nsw i64 %indvar219.epil, 1
  %epil.iter285.next = add i64 %epil.iter285, 1
  %epil.iter285.cmp.not = icmp eq i64 %epil.iter285.next, %xtraiter284
  br i1 %epil.iter285.cmp.not, label %for.end94, label %for.cond64.preheader.epil, !llvm.loop !46

for.end94:                                        ; preds = %for.end94.loopexit261.unr-lcssa, %for.cond64.preheader.epil, %for.cond64.for.inc92_crit_edge.split.us.us, %for.cond64.preheader.lr.ph.thread, %for.cond61.preheader
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #9

; Function Attrs: mustprogress uwtable
define dso_local void @_Z7mm3CudaiiiiiPA512_fS0_S0_S0_S0_S0_S0_S0_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr noundef %E, ptr noundef %A, ptr noundef %B, ptr noundef %F, ptr noundef %C, ptr noundef %D, ptr noundef %G, ptr noundef %G_outputFromGpu) local_unnamed_addr #5 {
entry:
  %Tp.i.i109 = alloca %struct.timeval, align 8
  %ni.addr.i90 = alloca i32, align 4
  %nj.addr.i91 = alloca i32, align 4
  %nk.addr.i92 = alloca i32, align 4
  %nl.addr.i93 = alloca i32, align 4
  %nm.addr.i94 = alloca i32, align 4
  %E.addr.i95 = alloca ptr, align 8
  %F.addr.i96 = alloca ptr, align 8
  %G.addr.i = alloca ptr, align 8
  %grid_dim.i97 = alloca %struct.dim3, align 8
  %block_dim.i98 = alloca %struct.dim3, align 8
  %shmem_size.i99 = alloca i64, align 8
  %stream.i100 = alloca ptr, align 8
  %kernel_args1.i101 = alloca [8 x ptr], align 16
  %ni.addr.i73 = alloca i32, align 4
  %nj.addr.i74 = alloca i32, align 4
  %nk.addr.i75 = alloca i32, align 4
  %nl.addr.i76 = alloca i32, align 4
  %nm.addr.i77 = alloca i32, align 4
  %C.addr.i = alloca ptr, align 8
  %D.addr.i = alloca ptr, align 8
  %F.addr.i = alloca ptr, align 8
  %grid_dim.i78 = alloca %struct.dim3, align 8
  %block_dim.i79 = alloca %struct.dim3, align 8
  %shmem_size.i80 = alloca i64, align 8
  %stream.i81 = alloca ptr, align 8
  %kernel_args1.i82 = alloca [8 x ptr], align 16
  %ni.addr.i = alloca i32, align 4
  %nj.addr.i = alloca i32, align 4
  %nk.addr.i = alloca i32, align 4
  %nl.addr.i = alloca i32, align 4
  %nm.addr.i = alloca i32, align 4
  %A.addr.i = alloca ptr, align 8
  %B.addr.i = alloca ptr, align 8
  %E.addr.i = alloca ptr, align 8
  %grid_dim.i = alloca %struct.dim3, align 8
  %block_dim.i = alloca %struct.dim3, align 8
  %shmem_size.i = alloca i64, align 8
  %stream.i = alloca ptr, align 8
  %kernel_args1.i = alloca [8 x ptr], align 16
  %Tp.i.i = alloca %struct.timeval, align 8
  %A_gpu = alloca ptr, align 8
  %B_gpu = alloca ptr, align 8
  %C_gpu = alloca ptr, align 8
  %D_gpu = alloca ptr, align 8
  %E_gpu = alloca ptr, align 8
  %F_gpu = alloca ptr, align 8
  %G_gpu = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %A_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %B_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %C_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %D_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %E_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %F_gpu) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %G_gpu) #17
  %call = call i32 @cudaMalloc(ptr noundef nonnull %A_gpu, i64 noundef 1048576) #16
  %call1 = call i32 @cudaMalloc(ptr noundef nonnull %B_gpu, i64 noundef 1048576) #16
  %call2 = call i32 @cudaMalloc(ptr noundef nonnull %C_gpu, i64 noundef 1048576) #16
  %call3 = call i32 @cudaMalloc(ptr noundef nonnull %D_gpu, i64 noundef 1048576) #16
  %call4 = call i32 @cudaMalloc(ptr noundef nonnull %E_gpu, i64 noundef 1048576) #16
  %call5 = call i32 @cudaMalloc(ptr noundef nonnull %F_gpu, i64 noundef 1048576) #16
  %call6 = call i32 @cudaMalloc(ptr noundef nonnull %G_gpu, i64 noundef 1048576) #16
  %0 = load ptr, ptr %A_gpu, align 8, !tbaa !31
  %call7 = call i32 @cudaMemcpy(ptr noundef %0, ptr noundef %A, i64 noundef 1048576, i32 noundef 1) #16
  %1 = load ptr, ptr %B_gpu, align 8, !tbaa !31
  %call8 = call i32 @cudaMemcpy(ptr noundef %1, ptr noundef %B, i64 noundef 1048576, i32 noundef 1) #16
  %2 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  %call9 = call i32 @cudaMemcpy(ptr noundef %2, ptr noundef %C, i64 noundef 1048576, i32 noundef 1) #16
  %3 = load ptr, ptr %D_gpu, align 8, !tbaa !31
  %call10 = call i32 @cudaMemcpy(ptr noundef %3, ptr noundef %D, i64 noundef 1048576, i32 noundef 1) #16
  %4 = load ptr, ptr %E_gpu, align 8, !tbaa !31
  %call11 = call i32 @cudaMemcpy(ptr noundef %4, ptr noundef %E, i64 noundef 1048576, i32 noundef 1) #16
  %5 = load ptr, ptr %F_gpu, align 8, !tbaa !31
  %call12 = call i32 @cudaMemcpy(ptr noundef %5, ptr noundef %F, i64 noundef 1048576, i32 noundef 1) #16
  %6 = load ptr, ptr %G_gpu, align 8, !tbaa !31
  %call13 = call i32 @cudaMemcpy(ptr noundef %6, ptr noundef %G, i64 noundef 1048576, i32 noundef 1) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #17
  %call.i.i = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #18
  %cmp.not.i.i = icmp eq i32 %call.i.i, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i) #16
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %entry, %if.then.i.i
  %7 = load i64, ptr %Tp.i.i, align 8, !tbaa !47
  %conv.i.i = sitofp i64 %7 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %8 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !50
  %conv2.i.i = sitofp i64 %8 to double
  %9 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #17
  store double %9, ptr @polybench_t_start, align 8, !tbaa !51
  %call32 = call i32 @__cudaPushCallConfiguration(i64 274877906960, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool.not = icmp eq i32 %call32, 0
  br i1 %tobool.not, label %kcall.configok, label %kcall.end

kcall.configok:                                   ; preds = %_Z21polybench_timer_startv.exit
  %10 = load ptr, ptr %A_gpu, align 8, !tbaa !31
  %11 = load ptr, ptr %B_gpu, align 8, !tbaa !31
  %12 = load ptr, ptr %E_gpu, align 8, !tbaa !31
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nk.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nl.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %nm.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %E.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i)
  store i32 %ni, ptr %ni.addr.i, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr.i, align 4, !tbaa !30
  store i32 %nk, ptr %nk.addr.i, align 4, !tbaa !30
  store i32 %nl, ptr %nl.addr.i, align 4, !tbaa !30
  store i32 %nm, ptr %nm.addr.i, align 4, !tbaa !30
  store ptr %10, ptr %A.addr.i, align 8, !tbaa !31
  store ptr %11, ptr %B.addr.i, align 8, !tbaa !31
  store ptr %12, ptr %E.addr.i, align 8, !tbaa !31
  store ptr %ni.addr.i, ptr %kernel_args1.i, align 16
  %13 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 8
  store ptr %nj.addr.i, ptr %13, align 8
  %14 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 16
  store ptr %nk.addr.i, ptr %14, align 16
  %15 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 24
  store ptr %nl.addr.i, ptr %15, align 8
  %16 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 32
  store ptr %nm.addr.i, ptr %16, align 16
  %17 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 40
  store ptr %A.addr.i, ptr %17, align 8
  %18 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 48
  store ptr %B.addr.i, ptr %18, align 16
  %19 = getelementptr inbounds nuw i8, ptr %kernel_args1.i, i64 56
  store ptr %E.addr.i, ptr %19, align 8
  %20 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i, ptr nonnull %block_dim.i, ptr nonnull %shmem_size.i, ptr nonnull %stream.i), !inline_history !53
  %21 = load i64, ptr %shmem_size.i, align 8
  %22 = load ptr, ptr %stream.i, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %grid_dim.i, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %grid_dim.i, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i, align 8
  %block_dim.coerce.sroa.0.0.copyload.i = load i64, ptr %block_dim.i, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i = getelementptr inbounds nuw i8, ptr %block_dim.i, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i, align 8
  %call.i = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm3_kernel1iiiiiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i, i32 %grid_dim.coerce.sroa.2.0.copyload.i, i64 %block_dim.coerce.sroa.0.0.copyload.i, i32 %block_dim.coerce.sroa.2.0.copyload.i, ptr noundef nonnull %kernel_args1.i, i64 noundef %21, ptr noundef %22), !inline_history !53
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nk.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nl.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %nm.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %A.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %B.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %E.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %_Z21polybench_timer_startv.exit
  %call33 = call i32 @cudaThreadSynchronize() #16
  %call36 = call i32 @__cudaPushCallConfiguration(i64 274877906960, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool37.not = icmp eq i32 %call36, 0
  br i1 %tobool37.not, label %kcall.configok38, label %kcall.end39

kcall.configok38:                                 ; preds = %kcall.end
  %23 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  %24 = load ptr, ptr %D_gpu, align 8, !tbaa !31
  %25 = load ptr, ptr %F_gpu, align 8, !tbaa !31
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i73)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i74)
  call void @llvm.lifetime.start.p0(ptr nonnull %nk.addr.i75)
  call void @llvm.lifetime.start.p0(ptr nonnull %nl.addr.i76)
  call void @llvm.lifetime.start.p0(ptr nonnull %nm.addr.i77)
  call void @llvm.lifetime.start.p0(ptr nonnull %C.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %D.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %F.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i78)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i79)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i80)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i81)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i82)
  store i32 %ni, ptr %ni.addr.i73, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr.i74, align 4, !tbaa !30
  store i32 %nk, ptr %nk.addr.i75, align 4, !tbaa !30
  store i32 %nl, ptr %nl.addr.i76, align 4, !tbaa !30
  store i32 %nm, ptr %nm.addr.i77, align 4, !tbaa !30
  store ptr %23, ptr %C.addr.i, align 8, !tbaa !31
  store ptr %24, ptr %D.addr.i, align 8, !tbaa !31
  store ptr %25, ptr %F.addr.i, align 8, !tbaa !31
  store ptr %ni.addr.i73, ptr %kernel_args1.i82, align 16
  %26 = getelementptr inbounds nuw i8, ptr %kernel_args1.i82, i64 8
  store ptr %nj.addr.i74, ptr %26, align 8
  %27 = getelementptr inbounds nuw i8, ptr %kernel_args1.i82, i64 16
  store ptr %nk.addr.i75, ptr %27, align 16
  %28 = getelementptr inbounds nuw i8, ptr %kernel_args1.i82, i64 24
  store ptr %nl.addr.i76, ptr %28, align 8
  %29 = getelementptr inbounds nuw i8, ptr %kernel_args1.i82, i64 32
  store ptr %nm.addr.i77, ptr %29, align 16
  %30 = getelementptr inbounds nuw i8, ptr %kernel_args1.i82, i64 40
  store ptr %C.addr.i, ptr %30, align 8
  %31 = getelementptr inbounds nuw i8, ptr %kernel_args1.i82, i64 48
  store ptr %D.addr.i, ptr %31, align 16
  %32 = getelementptr inbounds nuw i8, ptr %kernel_args1.i82, i64 56
  store ptr %F.addr.i, ptr %32, align 8
  %33 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i78, ptr nonnull %block_dim.i79, ptr nonnull %shmem_size.i80, ptr nonnull %stream.i81), !inline_history !54
  %34 = load i64, ptr %shmem_size.i80, align 8
  %35 = load ptr, ptr %stream.i81, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i83 = load i64, ptr %grid_dim.i78, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i84 = getelementptr inbounds nuw i8, ptr %grid_dim.i78, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i85 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i84, align 8
  %block_dim.coerce.sroa.0.0.copyload.i86 = load i64, ptr %block_dim.i79, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i87 = getelementptr inbounds nuw i8, ptr %block_dim.i79, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i88 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i87, align 8
  %call.i89 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm3_kernel2iiiiiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i83, i32 %grid_dim.coerce.sroa.2.0.copyload.i85, i64 %block_dim.coerce.sroa.0.0.copyload.i86, i32 %block_dim.coerce.sroa.2.0.copyload.i88, ptr noundef nonnull %kernel_args1.i82, i64 noundef %34, ptr noundef %35), !inline_history !54
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i73)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i74)
  call void @llvm.lifetime.end.p0(ptr nonnull %nk.addr.i75)
  call void @llvm.lifetime.end.p0(ptr nonnull %nl.addr.i76)
  call void @llvm.lifetime.end.p0(ptr nonnull %nm.addr.i77)
  call void @llvm.lifetime.end.p0(ptr nonnull %C.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %D.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %F.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i78)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i79)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i80)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i81)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i82)
  br label %kcall.end39

kcall.end39:                                      ; preds = %kcall.configok38, %kcall.end
  %call40 = call i32 @cudaThreadSynchronize() #16
  %call43 = call i32 @__cudaPushCallConfiguration(i64 274877906960, i32 1, i64 34359738400, i32 1, i64 noundef 0, ptr noundef null) #16
  %tobool44.not = icmp eq i32 %call43, 0
  br i1 %tobool44.not, label %kcall.configok45, label %kcall.end46

kcall.configok45:                                 ; preds = %kcall.end39
  %36 = load ptr, ptr %E_gpu, align 8, !tbaa !31
  %37 = load ptr, ptr %F_gpu, align 8, !tbaa !31
  %38 = load ptr, ptr %G_gpu, align 8, !tbaa !31
  call void @llvm.lifetime.start.p0(ptr nonnull %ni.addr.i90)
  call void @llvm.lifetime.start.p0(ptr nonnull %nj.addr.i91)
  call void @llvm.lifetime.start.p0(ptr nonnull %nk.addr.i92)
  call void @llvm.lifetime.start.p0(ptr nonnull %nl.addr.i93)
  call void @llvm.lifetime.start.p0(ptr nonnull %nm.addr.i94)
  call void @llvm.lifetime.start.p0(ptr nonnull %E.addr.i95)
  call void @llvm.lifetime.start.p0(ptr nonnull %F.addr.i96)
  call void @llvm.lifetime.start.p0(ptr nonnull %G.addr.i)
  call void @llvm.lifetime.start.p0(ptr nonnull %grid_dim.i97)
  call void @llvm.lifetime.start.p0(ptr nonnull %block_dim.i98)
  call void @llvm.lifetime.start.p0(ptr nonnull %shmem_size.i99)
  call void @llvm.lifetime.start.p0(ptr nonnull %stream.i100)
  call void @llvm.lifetime.start.p0(ptr nonnull %kernel_args1.i101)
  store i32 %ni, ptr %ni.addr.i90, align 4, !tbaa !30
  store i32 %nj, ptr %nj.addr.i91, align 4, !tbaa !30
  store i32 %nk, ptr %nk.addr.i92, align 4, !tbaa !30
  store i32 %nl, ptr %nl.addr.i93, align 4, !tbaa !30
  store i32 %nm, ptr %nm.addr.i94, align 4, !tbaa !30
  store ptr %36, ptr %E.addr.i95, align 8, !tbaa !31
  store ptr %37, ptr %F.addr.i96, align 8, !tbaa !31
  store ptr %38, ptr %G.addr.i, align 8, !tbaa !31
  store ptr %ni.addr.i90, ptr %kernel_args1.i101, align 16
  %39 = getelementptr inbounds nuw i8, ptr %kernel_args1.i101, i64 8
  store ptr %nj.addr.i91, ptr %39, align 8
  %40 = getelementptr inbounds nuw i8, ptr %kernel_args1.i101, i64 16
  store ptr %nk.addr.i92, ptr %40, align 16
  %41 = getelementptr inbounds nuw i8, ptr %kernel_args1.i101, i64 24
  store ptr %nl.addr.i93, ptr %41, align 8
  %42 = getelementptr inbounds nuw i8, ptr %kernel_args1.i101, i64 32
  store ptr %nm.addr.i94, ptr %42, align 16
  %43 = getelementptr inbounds nuw i8, ptr %kernel_args1.i101, i64 40
  store ptr %E.addr.i95, ptr %43, align 8
  %44 = getelementptr inbounds nuw i8, ptr %kernel_args1.i101, i64 48
  store ptr %F.addr.i96, ptr %44, align 16
  %45 = getelementptr inbounds nuw i8, ptr %kernel_args1.i101, i64 56
  store ptr %G.addr.i, ptr %45, align 8
  %46 = call i32 @__cudaPopCallConfiguration(ptr nonnull %grid_dim.i97, ptr nonnull %block_dim.i98, ptr nonnull %shmem_size.i99, ptr nonnull %stream.i100), !inline_history !55
  %47 = load i64, ptr %shmem_size.i99, align 8
  %48 = load ptr, ptr %stream.i100, align 8
  %grid_dim.coerce.sroa.0.0.copyload.i102 = load i64, ptr %grid_dim.i97, align 8
  %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i103 = getelementptr inbounds nuw i8, ptr %grid_dim.i97, i64 8
  %grid_dim.coerce.sroa.2.0.copyload.i104 = load i32, ptr %grid_dim.coerce.sroa.2.0.grid_dim.sroa_idx.i103, align 8
  %block_dim.coerce.sroa.0.0.copyload.i105 = load i64, ptr %block_dim.i98, align 8
  %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i106 = getelementptr inbounds nuw i8, ptr %block_dim.i98, i64 8
  %block_dim.coerce.sroa.2.0.copyload.i107 = load i32, ptr %block_dim.coerce.sroa.2.0.block_dim.sroa_idx.i106, align 8
  %call.i108 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z26__device_stub__mm3_kernel3iiiiiPfS_S_, i64 %grid_dim.coerce.sroa.0.0.copyload.i102, i32 %grid_dim.coerce.sroa.2.0.copyload.i104, i64 %block_dim.coerce.sroa.0.0.copyload.i105, i32 %block_dim.coerce.sroa.2.0.copyload.i107, ptr noundef nonnull %kernel_args1.i101, i64 noundef %47, ptr noundef %48), !inline_history !55
  call void @llvm.lifetime.end.p0(ptr nonnull %ni.addr.i90)
  call void @llvm.lifetime.end.p0(ptr nonnull %nj.addr.i91)
  call void @llvm.lifetime.end.p0(ptr nonnull %nk.addr.i92)
  call void @llvm.lifetime.end.p0(ptr nonnull %nl.addr.i93)
  call void @llvm.lifetime.end.p0(ptr nonnull %nm.addr.i94)
  call void @llvm.lifetime.end.p0(ptr nonnull %E.addr.i95)
  call void @llvm.lifetime.end.p0(ptr nonnull %F.addr.i96)
  call void @llvm.lifetime.end.p0(ptr nonnull %G.addr.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %grid_dim.i97)
  call void @llvm.lifetime.end.p0(ptr nonnull %block_dim.i98)
  call void @llvm.lifetime.end.p0(ptr nonnull %shmem_size.i99)
  call void @llvm.lifetime.end.p0(ptr nonnull %stream.i100)
  call void @llvm.lifetime.end.p0(ptr nonnull %kernel_args1.i101)
  br label %kcall.end46

kcall.end46:                                      ; preds = %kcall.configok45, %kcall.end39
  %call47 = call i32 @cudaThreadSynchronize() #16
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i109) #17
  %call.i.i110 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i109, ptr noundef null) #18
  %cmp.not.i.i111 = icmp eq i32 %call.i.i110, 0
  br i1 %cmp.not.i.i111, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i112

if.then.i.i112:                                   ; preds = %kcall.end46
  %call1.i.i113 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i110) #16
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %kcall.end46, %if.then.i.i112
  %49 = load i64, ptr %Tp.i.i109, align 8, !tbaa !47
  %conv.i.i114 = sitofp i64 %49 to double
  %tv_usec.i.i115 = getelementptr inbounds nuw i8, ptr %Tp.i.i109, i64 8
  %50 = load i64, ptr %tv_usec.i.i115, align 8, !tbaa !50
  %conv2.i.i116 = sitofp i64 %50 to double
  %51 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i116, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i114)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i109) #17
  store double %51, ptr @polybench_t_end, align 8, !tbaa !51
  %52 = load double, ptr @polybench_t_start, align 8, !tbaa !51
  %sub.i = fsub double %51, %52
  %call.i117 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #16
  %53 = load ptr, ptr %G_gpu, align 8, !tbaa !31
  %call49 = call i32 @cudaMemcpy(ptr noundef %G_outputFromGpu, ptr noundef %53, i64 noundef 1048576, i32 noundef 2) #16
  %54 = load ptr, ptr %A_gpu, align 8, !tbaa !31
  %call50 = call i32 @cudaFree(ptr noundef %54) #16
  %55 = load ptr, ptr %B_gpu, align 8, !tbaa !31
  %call51 = call i32 @cudaFree(ptr noundef %55) #16
  %56 = load ptr, ptr %C_gpu, align 8, !tbaa !31
  %call52 = call i32 @cudaFree(ptr noundef %56) #16
  %57 = load ptr, ptr %D_gpu, align 8, !tbaa !31
  %call53 = call i32 @cudaFree(ptr noundef %57) #16
  %58 = load ptr, ptr %E_gpu, align 8, !tbaa !31
  %call54 = call i32 @cudaFree(ptr noundef %58) #16
  %59 = load ptr, ptr %F_gpu, align 8, !tbaa !31
  %call55 = call i32 @cudaFree(ptr noundef %59) #16
  %60 = load ptr, ptr %G_gpu, align 8, !tbaa !31
  %call56 = call i32 @cudaFree(ptr noundef %60) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %G_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %F_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %E_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %D_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %C_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %B_gpu) #17
  call void @llvm.lifetime.end.p0(ptr nonnull %A_gpu) #17
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !47
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !50
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #17
  store double %2, ptr @polybench_t_start, align 8, !tbaa !51
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
  %0 = load i64, ptr %Tp.i, align 8, !tbaa !47
  %conv.i = sitofp i64 %0 to double
  %tv_usec.i = getelementptr inbounds nuw i8, ptr %Tp.i, i64 8
  %1 = load i64, ptr %tv_usec.i, align 8, !tbaa !50
  %conv2.i = sitofp i64 %1 to double
  %2 = tail call noundef double @llvm.fmuladd.f64(double %conv2.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i) #17
  store double %2, ptr @polybench_t_end, align 8, !tbaa !51
  ret void
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z21polybench_timer_printv() local_unnamed_addr #3 {
entry:
  %0 = load double, ptr @polybench_t_end, align 8, !tbaa !51
  %1 = load double, ptr @polybench_t_start, align 8, !tbaa !51
  %sub = fsub double %0, %1
  %call = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub) #16
  ret void
}

declare i32 @cudaFree(ptr noundef) local_unnamed_addr #6

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr nofree noundef readnone captures(none) %argv) local_unnamed_addr #7 {
entry:
  %Tp.i.i115 = alloca %struct.timeval, align 8
  %Tp.i.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %newA.i.i104 = alloca ptr, align 8
  %newA.i.i97 = alloca ptr, align 8
  %newA.i.i90 = alloca ptr, align 8
  %newA.i.i83 = alloca ptr, align 8
  %newA.i.i76 = alloca ptr, align 8
  %newA.i.i69 = alloca ptr, align 8
  %newA.i.i62 = alloca ptr, align 8
  %newA.i.i = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i) #17
  store ptr null, ptr %newA.i.i, align 8, !tbaa !56
  %call.i.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i, i64 noundef 32, i64 noundef 1048576) #18
  %0 = load ptr, ptr %newA.i.i, align 8, !tbaa !56
  %tobool.i.i = icmp eq ptr %0, null
  %tobool1.i.i = icmp ne i32 %call.i.i, 0
  %or.cond.i.i = select i1 %tobool.i.i, i1 true, i1 %tobool1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %_Z20polybench_alloc_datayi.exit

if.then.i.i:                                      ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !57
  %2 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %1) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit:                  ; preds = %entry
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i62) #17
  store ptr null, ptr %newA.i.i62, align 8, !tbaa !56
  %call.i.i63 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i62, i64 noundef 32, i64 noundef 1048576) #18
  %3 = load ptr, ptr %newA.i.i62, align 8, !tbaa !56
  %tobool.i.i64 = icmp eq ptr %3, null
  %tobool1.i.i65 = icmp ne i32 %call.i.i63, 0
  %or.cond.i.i66 = select i1 %tobool.i.i64, i1 true, i1 %tobool1.i.i65
  br i1 %or.cond.i.i66, label %if.then.i.i67, label %_Z20polybench_alloc_datayi.exit68

if.then.i.i67:                                    ; preds = %_Z20polybench_alloc_datayi.exit
  %4 = load ptr, ptr @stderr, align 8, !tbaa !57
  %5 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %4) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit68:                ; preds = %_Z20polybench_alloc_datayi.exit
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i62) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i69) #17
  store ptr null, ptr %newA.i.i69, align 8, !tbaa !56
  %call.i.i70 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i69, i64 noundef 32, i64 noundef 1048576) #18
  %6 = load ptr, ptr %newA.i.i69, align 8, !tbaa !56
  %tobool.i.i71 = icmp eq ptr %6, null
  %tobool1.i.i72 = icmp ne i32 %call.i.i70, 0
  %or.cond.i.i73 = select i1 %tobool.i.i71, i1 true, i1 %tobool1.i.i72
  br i1 %or.cond.i.i73, label %if.then.i.i74, label %_Z20polybench_alloc_datayi.exit75

if.then.i.i74:                                    ; preds = %_Z20polybench_alloc_datayi.exit68
  %7 = load ptr, ptr @stderr, align 8, !tbaa !57
  %8 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %7) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit75:                ; preds = %_Z20polybench_alloc_datayi.exit68
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i69) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i76) #17
  store ptr null, ptr %newA.i.i76, align 8, !tbaa !56
  %call.i.i77 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i76, i64 noundef 32, i64 noundef 1048576) #18
  %9 = load ptr, ptr %newA.i.i76, align 8, !tbaa !56
  %tobool.i.i78 = icmp eq ptr %9, null
  %tobool1.i.i79 = icmp ne i32 %call.i.i77, 0
  %or.cond.i.i80 = select i1 %tobool.i.i78, i1 true, i1 %tobool1.i.i79
  br i1 %or.cond.i.i80, label %if.then.i.i81, label %_Z20polybench_alloc_datayi.exit82

if.then.i.i81:                                    ; preds = %_Z20polybench_alloc_datayi.exit75
  %10 = load ptr, ptr @stderr, align 8, !tbaa !57
  %11 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %10) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit82:                ; preds = %_Z20polybench_alloc_datayi.exit75
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i76) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i83) #17
  store ptr null, ptr %newA.i.i83, align 8, !tbaa !56
  %call.i.i84 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i83, i64 noundef 32, i64 noundef 1048576) #18
  %12 = load ptr, ptr %newA.i.i83, align 8, !tbaa !56
  %tobool.i.i85 = icmp eq ptr %12, null
  %tobool1.i.i86 = icmp ne i32 %call.i.i84, 0
  %or.cond.i.i87 = select i1 %tobool.i.i85, i1 true, i1 %tobool1.i.i86
  br i1 %or.cond.i.i87, label %if.then.i.i88, label %_Z20polybench_alloc_datayi.exit89

if.then.i.i88:                                    ; preds = %_Z20polybench_alloc_datayi.exit82
  %13 = load ptr, ptr @stderr, align 8, !tbaa !57
  %14 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %13) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit89:                ; preds = %_Z20polybench_alloc_datayi.exit82
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i83) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i90) #17
  store ptr null, ptr %newA.i.i90, align 8, !tbaa !56
  %call.i.i91 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i90, i64 noundef 32, i64 noundef 1048576) #18
  %15 = load ptr, ptr %newA.i.i90, align 8, !tbaa !56
  %tobool.i.i92 = icmp eq ptr %15, null
  %tobool1.i.i93 = icmp ne i32 %call.i.i91, 0
  %or.cond.i.i94 = select i1 %tobool.i.i92, i1 true, i1 %tobool1.i.i93
  br i1 %or.cond.i.i94, label %if.then.i.i95, label %_Z20polybench_alloc_datayi.exit96

if.then.i.i95:                                    ; preds = %_Z20polybench_alloc_datayi.exit89
  %16 = load ptr, ptr @stderr, align 8, !tbaa !57
  %17 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %16) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit96:                ; preds = %_Z20polybench_alloc_datayi.exit89
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i90) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i97) #17
  store ptr null, ptr %newA.i.i97, align 8, !tbaa !56
  %call.i.i98 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i97, i64 noundef 32, i64 noundef 1048576) #18
  %18 = load ptr, ptr %newA.i.i97, align 8, !tbaa !56
  %tobool.i.i99 = icmp eq ptr %18, null
  %tobool1.i.i100 = icmp ne i32 %call.i.i98, 0
  %or.cond.i.i101 = select i1 %tobool.i.i99, i1 true, i1 %tobool1.i.i100
  br i1 %or.cond.i.i101, label %if.then.i.i102, label %_Z20polybench_alloc_datayi.exit103

if.then.i.i102:                                   ; preds = %_Z20polybench_alloc_datayi.exit96
  %19 = load ptr, ptr @stderr, align 8, !tbaa !57
  %20 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %19) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit103:               ; preds = %_Z20polybench_alloc_datayi.exit96
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i97) #17
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i.i104) #17
  store ptr null, ptr %newA.i.i104, align 8, !tbaa !56
  %call.i.i105 = call i32 @posix_memalign(ptr noundef nonnull %newA.i.i104, i64 noundef 32, i64 noundef 1048576) #18
  %21 = load ptr, ptr %newA.i.i104, align 8, !tbaa !56
  %tobool.i.i106 = icmp eq ptr %21, null
  %tobool1.i.i107 = icmp ne i32 %call.i.i105, 0
  %or.cond.i.i108 = select i1 %tobool.i.i106, i1 true, i1 %tobool1.i.i107
  br i1 %or.cond.i.i108, label %if.then.i.i109, label %_Z20polybench_alloc_datayi.exit110

if.then.i.i109:                                   ; preds = %_Z20polybench_alloc_datayi.exit103
  %22 = load ptr, ptr @stderr, align 8, !tbaa !57
  %23 = call i64 @fwrite(ptr nonnull @.str.8, i64 50, i64 1, ptr %22) #19
  call void @exit(i32 noundef 1) #20
  unreachable

_Z20polybench_alloc_datayi.exit110:               ; preds = %_Z20polybench_alloc_datayi.exit103
  call void @llvm.lifetime.end.p0(ptr nonnull %newA.i.i104) #17
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.for.inc8_crit_edge.i, %_Z20polybench_alloc_datayi.exit110
  %indvars.iv130.i = phi i64 [ 0, %_Z20polybench_alloc_datayi.exit110 ], [ %indvars.iv.next131.i, %for.cond1.for.inc8_crit_edge.i ]
  %arrayidx.i = getelementptr inbounds nuw [2048 x i8], ptr %3, i64 %indvars.iv130.i
  %24 = trunc nuw nsw i64 %indvars.iv130.i to i32
  %conv.i = uitofp nneg i32 %24 to float
  %broadcast.splatinsert = insertelement <4 x float> poison, float %conv.i, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.i
  %index = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond1.preheader.i ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <4 x i32> %vec.ind, splat (i32 4)
  %25 = uitofp nneg <4 x i32> %vec.ind to <4 x float>
  %26 = uitofp nneg <4 x i32> %step.add to <4 x float>
  %27 = fmul nnan <4 x float> %broadcast.splat, %25
  %28 = fmul nnan <4 x float> %broadcast.splat, %26
  %29 = fmul nnan <4 x float> %27, splat (float f0x3B000000)
  %30 = fmul nnan <4 x float> %28, splat (float f0x3B000000)
  %31 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %32 = getelementptr inbounds nuw i8, ptr %31, i64 16
  store <4 x float> %29, ptr %31, align 4, !tbaa !10
  store <4 x float> %30, ptr %32, align 4, !tbaa !10
  %vec.ind.next = add <4 x i32> %vec.ind, splat (i32 8)
  %step.add.1 = add <4 x i32> %vec.ind, splat (i32 12)
  %33 = uitofp nneg <4 x i32> %vec.ind.next to <4 x float>
  %34 = uitofp nneg <4 x i32> %step.add.1 to <4 x float>
  %35 = fmul nnan <4 x float> %broadcast.splat, %33
  %36 = fmul nnan <4 x float> %broadcast.splat, %34
  %37 = fmul nnan <4 x float> %35, splat (float f0x3B000000)
  %38 = fmul nnan <4 x float> %36, splat (float f0x3B000000)
  %39 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.i, i64 %index
  %40 = getelementptr inbounds nuw i8, ptr %39, i64 32
  %41 = getelementptr inbounds nuw i8, ptr %39, i64 48
  store <4 x float> %37, ptr %40, align 4, !tbaa !10
  store <4 x float> %38, ptr %41, align 4, !tbaa !10
  %index.next.1 = add nuw nsw i64 %index, 16
  %vec.ind.next.1 = add <4 x i32> %vec.ind, splat (i32 16)
  %42 = icmp eq i64 %index.next.1, 512
  br i1 %42, label %for.cond1.for.inc8_crit_edge.i, label %vector.body, !llvm.loop !59

for.cond1.for.inc8_crit_edge.i:                   ; preds = %vector.body
  %indvars.iv.next131.i = add nuw nsw i64 %indvars.iv130.i, 1
  %exitcond134.not.i = icmp eq i64 %indvars.iv.next131.i, 512
  br i1 %exitcond134.not.i, label %for.cond14.preheader.i, label %for.cond1.preheader.i, !llvm.loop !17

for.cond14.preheader.i:                           ; preds = %for.cond1.for.inc8_crit_edge.i, %for.cond14.for.inc29_crit_edge.i
  %indvars.iv140.i = phi i64 [ %indvars.iv.next141.i, %for.cond14.for.inc29_crit_edge.i ], [ 0, %for.cond1.for.inc8_crit_edge.i ]
  %arrayidx23.i = getelementptr inbounds nuw [2048 x i8], ptr %6, i64 %indvars.iv140.i
  %43 = trunc nuw nsw i64 %indvars.iv140.i to i32
  %conv17.i = uitofp nneg i32 %43 to float
  %broadcast.splatinsert137 = insertelement <4 x float> poison, float %conv17.i, i64 0
  %broadcast.splat138 = shufflevector <4 x float> %broadcast.splatinsert137, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body139

vector.body139:                                   ; preds = %vector.body139, %for.cond14.preheader.i
  %index140 = phi i64 [ 0, %for.cond14.preheader.i ], [ %index.next143, %vector.body139 ]
  %vec.ind141 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond14.preheader.i ], [ %vec.ind.next144, %vector.body139 ]
  %44 = trunc <4 x i64> %vec.ind141 to <4 x i32>
  %45 = add <4 x i32> %44, splat (i32 1)
  %46 = trunc <4 x i64> %vec.ind141 to <4 x i32>
  %47 = add <4 x i32> %46, splat (i32 5)
  %48 = uitofp nneg <4 x i32> %45 to <4 x float>
  %49 = uitofp nneg <4 x i32> %47 to <4 x float>
  %50 = fmul nnan <4 x float> %broadcast.splat138, %48
  %51 = fmul nnan <4 x float> %broadcast.splat138, %49
  %52 = fmul nnan <4 x float> %50, splat (float f0x3B000000)
  %53 = fmul nnan <4 x float> %51, splat (float f0x3B000000)
  %54 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx23.i, i64 %index140
  %55 = getelementptr inbounds nuw i8, ptr %54, i64 16
  store <4 x float> %52, ptr %54, align 4, !tbaa !10
  store <4 x float> %53, ptr %55, align 4, !tbaa !10
  %index.next143 = add nuw i64 %index140, 8
  %vec.ind.next144 = add nuw <4 x i64> %vec.ind141, splat (i64 8)
  %56 = icmp eq i64 %index.next143, 512
  br i1 %56, label %for.cond14.for.inc29_crit_edge.i, label %vector.body139, !llvm.loop !60

for.cond14.for.inc29_crit_edge.i:                 ; preds = %vector.body139
  %indvars.iv.next141.i = add nuw nsw i64 %indvars.iv140.i, 1
  %exitcond144.not.i = icmp eq i64 %indvars.iv.next141.i, 512
  br i1 %exitcond144.not.i, label %for.cond35.preheader.i, label %for.cond14.preheader.i, !llvm.loop !20

for.cond35.preheader.i:                           ; preds = %for.cond14.for.inc29_crit_edge.i, %for.cond35.for.inc51_crit_edge.i
  %indvars.iv151.i = phi i64 [ %indvars.iv.next152.i, %for.cond35.for.inc51_crit_edge.i ], [ 0, %for.cond14.for.inc29_crit_edge.i ]
  %arrayidx45.i = getelementptr inbounds nuw [2048 x i8], ptr %12, i64 %indvars.iv151.i
  %57 = trunc nuw nsw i64 %indvars.iv151.i to i32
  %conv38.i = uitofp nneg i32 %57 to float
  %broadcast.splatinsert147 = insertelement <4 x float> poison, float %conv38.i, i64 0
  %broadcast.splat148 = shufflevector <4 x float> %broadcast.splatinsert147, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body149

vector.body149:                                   ; preds = %vector.body149, %for.cond35.preheader.i
  %index150 = phi i64 [ 0, %for.cond35.preheader.i ], [ %index.next153.1, %vector.body149 ]
  %vec.ind151 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond35.preheader.i ], [ %vec.ind.next154.1, %vector.body149 ]
  %58 = add <4 x i32> %vec.ind151, splat (i32 3)
  %59 = add <4 x i32> %vec.ind151, splat (i32 7)
  %60 = uitofp nneg <4 x i32> %58 to <4 x float>
  %61 = uitofp nneg <4 x i32> %59 to <4 x float>
  %62 = fmul nnan <4 x float> %broadcast.splat148, %60
  %63 = fmul nnan <4 x float> %broadcast.splat148, %61
  %64 = fmul nnan <4 x float> %62, splat (float f0x3B000000)
  %65 = fmul nnan <4 x float> %63, splat (float f0x3B000000)
  %66 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx45.i, i64 %index150
  %67 = getelementptr inbounds nuw i8, ptr %66, i64 16
  store <4 x float> %64, ptr %66, align 4, !tbaa !10
  store <4 x float> %65, ptr %67, align 4, !tbaa !10
  %68 = add <4 x i32> %vec.ind151, splat (i32 11)
  %69 = add <4 x i32> %vec.ind151, splat (i32 15)
  %70 = uitofp nneg <4 x i32> %68 to <4 x float>
  %71 = uitofp nneg <4 x i32> %69 to <4 x float>
  %72 = fmul nnan <4 x float> %broadcast.splat148, %70
  %73 = fmul nnan <4 x float> %broadcast.splat148, %71
  %74 = fmul nnan <4 x float> %72, splat (float f0x3B000000)
  %75 = fmul nnan <4 x float> %73, splat (float f0x3B000000)
  %76 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx45.i, i64 %index150
  %77 = getelementptr inbounds nuw i8, ptr %76, i64 32
  %78 = getelementptr inbounds nuw i8, ptr %76, i64 48
  store <4 x float> %74, ptr %77, align 4, !tbaa !10
  store <4 x float> %75, ptr %78, align 4, !tbaa !10
  %index.next153.1 = add nuw nsw i64 %index150, 16
  %vec.ind.next154.1 = add <4 x i32> %vec.ind151, splat (i32 16)
  %79 = icmp eq i64 %index.next153.1, 512
  br i1 %79, label %for.cond35.for.inc51_crit_edge.i, label %vector.body149, !llvm.loop !61

for.cond35.for.inc51_crit_edge.i:                 ; preds = %vector.body149
  %indvars.iv.next152.i = add nuw nsw i64 %indvars.iv151.i, 1
  %exitcond155.not.i = icmp eq i64 %indvars.iv.next152.i, 512
  br i1 %exitcond155.not.i, label %for.cond57.preheader.i, label %for.cond35.preheader.i, !llvm.loop !23

for.cond57.preheader.i:                           ; preds = %for.cond35.for.inc51_crit_edge.i, %for.cond57.for.inc73_crit_edge.i
  %indvars.iv162.i = phi i64 [ %indvars.iv.next163.i, %for.cond57.for.inc73_crit_edge.i ], [ 0, %for.cond35.for.inc51_crit_edge.i ]
  %arrayidx67.i = getelementptr inbounds nuw [2048 x i8], ptr %15, i64 %indvars.iv162.i
  %80 = trunc nuw nsw i64 %indvars.iv162.i to i32
  %conv60.i = uitofp nneg i32 %80 to float
  %broadcast.splatinsert157 = insertelement <4 x float> poison, float %conv60.i, i64 0
  %broadcast.splat158 = shufflevector <4 x float> %broadcast.splatinsert157, <4 x float> poison, <4 x i32> zeroinitializer
  br label %vector.body159

vector.body159:                                   ; preds = %vector.body159, %for.cond57.preheader.i
  %index160 = phi i64 [ 0, %for.cond57.preheader.i ], [ %index.next163.1, %vector.body159 ]
  %vec.ind161 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond57.preheader.i ], [ %vec.ind.next164.1, %vector.body159 ]
  %81 = add <4 x i32> %vec.ind161, splat (i32 2)
  %82 = add <4 x i32> %vec.ind161, splat (i32 6)
  %83 = uitofp nneg <4 x i32> %81 to <4 x float>
  %84 = uitofp nneg <4 x i32> %82 to <4 x float>
  %85 = fmul nnan <4 x float> %broadcast.splat158, %83
  %86 = fmul nnan <4 x float> %broadcast.splat158, %84
  %87 = fmul nnan <4 x float> %85, splat (float f0x3B000000)
  %88 = fmul nnan <4 x float> %86, splat (float f0x3B000000)
  %89 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx67.i, i64 %index160
  %90 = getelementptr inbounds nuw i8, ptr %89, i64 16
  store <4 x float> %87, ptr %89, align 4, !tbaa !10
  store <4 x float> %88, ptr %90, align 4, !tbaa !10
  %91 = add <4 x i32> %vec.ind161, splat (i32 10)
  %92 = add <4 x i32> %vec.ind161, splat (i32 14)
  %93 = uitofp nneg <4 x i32> %91 to <4 x float>
  %94 = uitofp nneg <4 x i32> %92 to <4 x float>
  %95 = fmul nnan <4 x float> %broadcast.splat158, %93
  %96 = fmul nnan <4 x float> %broadcast.splat158, %94
  %97 = fmul nnan <4 x float> %95, splat (float f0x3B000000)
  %98 = fmul nnan <4 x float> %96, splat (float f0x3B000000)
  %99 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx67.i, i64 %index160
  %100 = getelementptr inbounds nuw i8, ptr %99, i64 32
  %101 = getelementptr inbounds nuw i8, ptr %99, i64 48
  store <4 x float> %97, ptr %100, align 4, !tbaa !10
  store <4 x float> %98, ptr %101, align 4, !tbaa !10
  %index.next163.1 = add nuw nsw i64 %index160, 16
  %vec.ind.next164.1 = add <4 x i32> %vec.ind161, splat (i32 16)
  %102 = icmp eq i64 %index.next163.1, 512
  br i1 %102, label %for.cond57.for.inc73_crit_edge.i, label %vector.body159, !llvm.loop !62

for.cond57.for.inc73_crit_edge.i:                 ; preds = %vector.body159
  %indvars.iv.next163.i = add nuw nsw i64 %indvars.iv162.i, 1
  %exitcond166.not.i = icmp eq i64 %indvars.iv.next163.i, 512
  br i1 %exitcond166.not.i, label %_Z10init_arrayiiiiiPA512_fS0_S0_S0_.exit, label %for.cond57.preheader.i, !llvm.loop !26

_Z10init_arrayiiiiiPA512_fS0_S0_S0_.exit:         ; preds = %for.cond57.for.inc73_crit_edge.i
  call void @llvm.lifetime.start.p0(ptr nonnull %deviceProp.i) #17
  %call.i = call i32 @cudaGetDeviceProperties_v2(ptr noundef nonnull %deviceProp.i, i32 noundef 0) #16
  %call1.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0, ptr noundef nonnull %deviceProp.i) #16
  %call2.i = call i32 @cudaSetDevice(i32 noundef 0) #16
  call void @llvm.lifetime.end.p0(ptr nonnull %deviceProp.i) #17
  call void @_Z7mm3CudaiiiiiPA512_fS0_S0_S0_S0_S0_S0_S0_(i32 noundef 512, i32 noundef 512, i32 noundef 512, i32 noundef 512, i32 noundef 512, ptr noundef nonnull %3, ptr noundef nonnull %6, ptr noundef nonnull %12, ptr noundef nonnull %15, ptr noundef nonnull %0, ptr noundef nonnull %9, ptr noundef nonnull %18, ptr noundef nonnull %21) #16
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i) #17
  %call.i.i111 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i, ptr noundef null) #18
  %cmp.not.i.i = icmp eq i32 %call.i.i111, 0
  br i1 %cmp.not.i.i, label %_Z21polybench_timer_startv.exit, label %if.then.i.i112

if.then.i.i112:                                   ; preds = %_Z10init_arrayiiiiiPA512_fS0_S0_S0_.exit
  %call1.i.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i111) #16
  br label %_Z21polybench_timer_startv.exit

_Z21polybench_timer_startv.exit:                  ; preds = %_Z10init_arrayiiiiiPA512_fS0_S0_S0_.exit, %if.then.i.i112
  %103 = load i64, ptr %Tp.i.i, align 8, !tbaa !47
  %conv.i.i = sitofp i64 %103 to double
  %tv_usec.i.i = getelementptr inbounds nuw i8, ptr %Tp.i.i, i64 8
  %104 = load i64, ptr %tv_usec.i.i, align 8, !tbaa !50
  %conv2.i.i = sitofp i64 %104 to double
  %105 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i) #17
  store double %105, ptr @polybench_t_start, align 8, !tbaa !51
  br label %for.cond1.preheader.us.i

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc24_crit_edge.split.us.us.i, %_Z21polybench_timer_startv.exit
  %indvars.iv187.i = phi i64 [ 0, %_Z21polybench_timer_startv.exit ], [ %indvars.iv.next188.i, %for.cond1.for.inc24_crit_edge.split.us.us.i ]
  %arrayidx.us.i = getelementptr inbounds nuw [2048 x i8], ptr %3, i64 %indvars.iv187.i
  %arrayidx10.us.i = getelementptr inbounds nuw [2048 x i8], ptr %6, i64 %indvars.iv187.i
  br label %for.body3.us.us.i

for.body3.us.us.i:                                ; preds = %for.cond6.for.inc21_crit_edge.us.us.i, %for.cond1.preheader.us.i
  %indvars.iv182.i = phi i64 [ %indvars.iv.next183.i, %for.cond6.for.inc21_crit_edge.us.us.i ], [ 0, %for.cond1.preheader.us.i ]
  %arrayidx5.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i, i64 %indvars.iv182.i
  store float 0.000000e+00, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %invariant.gep.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %12, i64 %indvars.iv182.i
  br label %for.body8.us.us.i

for.body8.us.us.i:                                ; preds = %for.body8.us.us.i, %for.body3.us.us.i
  %indvars.iv.i113 = phi i64 [ 0, %for.body3.us.us.i ], [ %indvars.iv.next.i114.1, %for.body8.us.us.i ]
  %106 = phi float [ 0.000000e+00, %for.body3.us.us.i ], [ %112, %for.body8.us.us.i ]
  %arrayidx12.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us.i, i64 %indvars.iv.i113
  %107 = load float, ptr %arrayidx12.us.us.i, align 4, !tbaa !10
  %gep.us.us.i = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us.i, i64 %indvars.iv.i113
  %108 = load float, ptr %gep.us.us.i, align 4, !tbaa !10
  %109 = call float @llvm.fmuladd.f32(float %107, float %108, float %106)
  store float %109, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %indvars.iv.next.i114 = or disjoint i64 %indvars.iv.i113, 1
  %arrayidx12.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx10.us.i, i64 %indvars.iv.next.i114
  %110 = load float, ptr %arrayidx12.us.us.i.1, align 4, !tbaa !10
  %gep.us.us.i.1 = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us.i, i64 %indvars.iv.next.i114
  %111 = load float, ptr %gep.us.us.i.1, align 4, !tbaa !10
  %112 = call float @llvm.fmuladd.f32(float %110, float %111, float %109)
  store float %112, ptr %arrayidx5.us.us.i, align 4, !tbaa !10
  %indvars.iv.next.i114.1 = add nuw nsw i64 %indvars.iv.i113, 2
  %exitcond178.not.i.1 = icmp eq i64 %indvars.iv.next.i114.1, 512
  br i1 %exitcond178.not.i.1, label %for.cond6.for.inc21_crit_edge.us.us.i, label %for.body8.us.us.i, !llvm.loop !34

for.cond6.for.inc21_crit_edge.us.us.i:            ; preds = %for.body8.us.us.i
  %indvars.iv.next183.i = add nuw nsw i64 %indvars.iv182.i, 1
  %exitcond186.not.i = icmp eq i64 %indvars.iv.next183.i, 512
  br i1 %exitcond186.not.i, label %for.cond1.for.inc24_crit_edge.split.us.us.i, label %for.body3.us.us.i, !llvm.loop !35

for.cond1.for.inc24_crit_edge.split.us.us.i:      ; preds = %for.cond6.for.inc21_crit_edge.us.us.i
  %indvars.iv.next188.i = add nuw nsw i64 %indvars.iv187.i, 1
  %exitcond191.not.i = icmp eq i64 %indvars.iv.next188.i, 512
  br i1 %exitcond191.not.i, label %for.cond30.preheader.us.i, label %for.cond1.preheader.us.i, !llvm.loop !36

for.cond30.preheader.us.i:                        ; preds = %for.cond1.for.inc24_crit_edge.split.us.us.i, %for.cond30.for.inc58_crit_edge.split.us.us.i
  %indvars.iv214.i = phi i64 [ %indvars.iv.next215.i, %for.cond30.for.inc58_crit_edge.split.us.us.i ], [ 0, %for.cond1.for.inc24_crit_edge.split.us.us.i ]
  %arrayidx34.us.i = getelementptr inbounds nuw [2048 x i8], ptr %15, i64 %indvars.iv214.i
  %arrayidx41.us.i = getelementptr inbounds nuw [2048 x i8], ptr %0, i64 %indvars.iv214.i
  br label %for.body32.us.us.i

for.body32.us.us.i:                               ; preds = %for.cond37.for.inc55_crit_edge.us.us.i, %for.cond30.preheader.us.i
  %indvars.iv209.i = phi i64 [ %indvars.iv.next210.i, %for.cond37.for.inc55_crit_edge.us.us.i ], [ 0, %for.cond30.preheader.us.i ]
  %arrayidx36.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx34.us.i, i64 %indvars.iv209.i
  store float 0.000000e+00, ptr %arrayidx36.us.us.i, align 4, !tbaa !10
  %invariant.gep.us.us157.i = getelementptr inbounds nuw [4 x i8], ptr %9, i64 %indvars.iv209.i
  br label %for.body39.us.us.i

for.body39.us.us.i:                               ; preds = %for.body39.us.us.i, %for.body32.us.us.i
  %indvars.iv201.i = phi i64 [ 0, %for.body32.us.us.i ], [ %indvars.iv.next202.i.1, %for.body39.us.us.i ]
  %113 = phi float [ 0.000000e+00, %for.body32.us.us.i ], [ %119, %for.body39.us.us.i ]
  %arrayidx43.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx41.us.i, i64 %indvars.iv201.i
  %114 = load float, ptr %arrayidx43.us.us.i, align 4, !tbaa !10
  %gep.us.us158.i = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us157.i, i64 %indvars.iv201.i
  %115 = load float, ptr %gep.us.us158.i, align 4, !tbaa !10
  %116 = call float @llvm.fmuladd.f32(float %114, float %115, float %113)
  store float %116, ptr %arrayidx36.us.us.i, align 4, !tbaa !10
  %indvars.iv.next202.i = or disjoint i64 %indvars.iv201.i, 1
  %arrayidx43.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx41.us.i, i64 %indvars.iv.next202.i
  %117 = load float, ptr %arrayidx43.us.us.i.1, align 4, !tbaa !10
  %gep.us.us158.i.1 = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us157.i, i64 %indvars.iv.next202.i
  %118 = load float, ptr %gep.us.us158.i.1, align 4, !tbaa !10
  %119 = call float @llvm.fmuladd.f32(float %117, float %118, float %116)
  store float %119, ptr %arrayidx36.us.us.i, align 4, !tbaa !10
  %indvars.iv.next202.i.1 = add nuw nsw i64 %indvars.iv201.i, 2
  %exitcond205.not.i.1 = icmp eq i64 %indvars.iv.next202.i.1, 512
  br i1 %exitcond205.not.i.1, label %for.cond37.for.inc55_crit_edge.us.us.i, label %for.body39.us.us.i, !llvm.loop !39

for.cond37.for.inc55_crit_edge.us.us.i:           ; preds = %for.body39.us.us.i
  %indvars.iv.next210.i = add nuw nsw i64 %indvars.iv209.i, 1
  %exitcond213.not.i = icmp eq i64 %indvars.iv.next210.i, 512
  br i1 %exitcond213.not.i, label %for.cond30.for.inc58_crit_edge.split.us.us.i, label %for.body32.us.us.i, !llvm.loop !40

for.cond30.for.inc58_crit_edge.split.us.us.i:     ; preds = %for.cond37.for.inc55_crit_edge.us.us.i
  %indvars.iv.next215.i = add nuw nsw i64 %indvars.iv214.i, 1
  %exitcond218.not.i = icmp eq i64 %indvars.iv.next215.i, 512
  br i1 %exitcond218.not.i, label %for.cond64.preheader.us.i, label %for.cond30.preheader.us.i, !llvm.loop !41

for.cond64.preheader.us.i:                        ; preds = %for.cond30.for.inc58_crit_edge.split.us.us.i, %for.cond64.for.inc92_crit_edge.split.us.us.i
  %indvars.iv241.i = phi i64 [ %indvars.iv.next242.i, %for.cond64.for.inc92_crit_edge.split.us.us.i ], [ 0, %for.cond30.for.inc58_crit_edge.split.us.us.i ]
  %arrayidx68.us.i = getelementptr inbounds nuw [2048 x i8], ptr %18, i64 %indvars.iv241.i
  %arrayidx75.us.i = getelementptr inbounds nuw [2048 x i8], ptr %3, i64 %indvars.iv241.i
  br label %for.body66.us.us.i

for.body66.us.us.i:                               ; preds = %for.cond71.for.inc89_crit_edge.us.us.i, %for.cond64.preheader.us.i
  %indvars.iv236.i = phi i64 [ %indvars.iv.next237.i, %for.cond71.for.inc89_crit_edge.us.us.i ], [ 0, %for.cond64.preheader.us.i ]
  %arrayidx70.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx68.us.i, i64 %indvars.iv236.i
  store float 0.000000e+00, ptr %arrayidx70.us.us.i, align 4, !tbaa !10
  %invariant.gep.us.us167.i = getelementptr inbounds nuw [4 x i8], ptr %15, i64 %indvars.iv236.i
  br label %for.body73.us.us.i

for.body73.us.us.i:                               ; preds = %for.body73.us.us.i, %for.body66.us.us.i
  %indvars.iv228.i = phi i64 [ 0, %for.body66.us.us.i ], [ %indvars.iv.next229.i.1, %for.body73.us.us.i ]
  %120 = phi float [ 0.000000e+00, %for.body66.us.us.i ], [ %126, %for.body73.us.us.i ]
  %arrayidx77.us.us.i = getelementptr inbounds nuw [4 x i8], ptr %arrayidx75.us.i, i64 %indvars.iv228.i
  %121 = load float, ptr %arrayidx77.us.us.i, align 4, !tbaa !10
  %gep.us.us168.i = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us167.i, i64 %indvars.iv228.i
  %122 = load float, ptr %gep.us.us168.i, align 4, !tbaa !10
  %123 = call float @llvm.fmuladd.f32(float %121, float %122, float %120)
  store float %123, ptr %arrayidx70.us.us.i, align 4, !tbaa !10
  %indvars.iv.next229.i = or disjoint i64 %indvars.iv228.i, 1
  %arrayidx77.us.us.i.1 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx75.us.i, i64 %indvars.iv.next229.i
  %124 = load float, ptr %arrayidx77.us.us.i.1, align 4, !tbaa !10
  %gep.us.us168.i.1 = getelementptr inbounds nuw [2048 x i8], ptr %invariant.gep.us.us167.i, i64 %indvars.iv.next229.i
  %125 = load float, ptr %gep.us.us168.i.1, align 4, !tbaa !10
  %126 = call float @llvm.fmuladd.f32(float %124, float %125, float %123)
  store float %126, ptr %arrayidx70.us.us.i, align 4, !tbaa !10
  %indvars.iv.next229.i.1 = add nuw nsw i64 %indvars.iv228.i, 2
  %exitcond232.not.i.1 = icmp eq i64 %indvars.iv.next229.i.1, 512
  br i1 %exitcond232.not.i.1, label %for.cond71.for.inc89_crit_edge.us.us.i, label %for.body73.us.us.i, !llvm.loop !43

for.cond71.for.inc89_crit_edge.us.us.i:           ; preds = %for.body73.us.us.i
  %indvars.iv.next237.i = add nuw nsw i64 %indvars.iv236.i, 1
  %exitcond240.not.i = icmp eq i64 %indvars.iv.next237.i, 512
  br i1 %exitcond240.not.i, label %for.cond64.for.inc92_crit_edge.split.us.us.i, label %for.body66.us.us.i, !llvm.loop !44

for.cond64.for.inc92_crit_edge.split.us.us.i:     ; preds = %for.cond71.for.inc89_crit_edge.us.us.i
  %indvars.iv.next242.i = add nuw nsw i64 %indvars.iv241.i, 1
  %exitcond245.not.i = icmp eq i64 %indvars.iv.next242.i, 512
  br i1 %exitcond245.not.i, label %_Z7mm3_cpuiiiiiPA512_fS0_S0_S0_S0_S0_S0_.exit, label %for.cond64.preheader.us.i, !llvm.loop !45

_Z7mm3_cpuiiiiiPA512_fS0_S0_S0_S0_S0_S0_.exit:    ; preds = %for.cond64.for.inc92_crit_edge.split.us.us.i
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str.9)
  call void @llvm.lifetime.start.p0(ptr nonnull %Tp.i.i115) #17
  %call.i.i116 = call i32 @gettimeofday(ptr noundef nonnull %Tp.i.i115, ptr noundef null) #18
  %cmp.not.i.i117 = icmp eq i32 %call.i.i116, 0
  br i1 %cmp.not.i.i117, label %_Z20polybench_timer_stopv.exit, label %if.then.i.i118

if.then.i.i118:                                   ; preds = %_Z7mm3_cpuiiiiiPA512_fS0_S0_S0_S0_S0_S0_.exit
  %call1.i.i119 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %call.i.i116) #16
  br label %_Z20polybench_timer_stopv.exit

_Z20polybench_timer_stopv.exit:                   ; preds = %_Z7mm3_cpuiiiiiPA512_fS0_S0_S0_S0_S0_S0_.exit, %if.then.i.i118
  %127 = load i64, ptr %Tp.i.i115, align 8, !tbaa !47
  %conv.i.i120 = sitofp i64 %127 to double
  %tv_usec.i.i121 = getelementptr inbounds nuw i8, ptr %Tp.i.i115, i64 8
  %128 = load i64, ptr %tv_usec.i.i121, align 8, !tbaa !50
  %conv2.i.i122 = sitofp i64 %128 to double
  %129 = call noundef double @llvm.fmuladd.f64(double %conv2.i.i122, double f0x3EB0C6F7A0B5ED8D, double %conv.i.i120)
  call void @llvm.lifetime.end.p0(ptr nonnull %Tp.i.i115) #17
  store double %129, ptr @polybench_t_end, align 8, !tbaa !51
  %130 = load double, ptr @polybench_t_start, align 8, !tbaa !51
  %sub.i = fsub double %129, %130
  %call.i123 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, double noundef %sub.i) #16
  br label %for.cond1.preheader.us.i124

for.cond1.preheader.us.i124:                      ; preds = %for.cond1.for.inc14_crit_edge.us.i, %_Z20polybench_timer_stopv.exit
  %indvars.iv34.i = phi i64 [ 0, %_Z20polybench_timer_stopv.exit ], [ %indvars.iv.next35.i, %for.cond1.for.inc14_crit_edge.us.i ]
  %fail.030.us.i = phi i32 [ 0, %_Z20polybench_timer_stopv.exit ], [ %165, %for.cond1.for.inc14_crit_edge.us.i ]
  %arrayidx.us.i125 = getelementptr inbounds nuw [2048 x i8], ptr %18, i64 %indvars.iv34.i
  %arrayidx7.us.i = getelementptr inbounds nuw [2048 x i8], ptr %21, i64 %indvars.iv34.i
  %131 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %fail.030.us.i, i64 0
  br label %vector.body167

vector.body167:                                   ; preds = %vector.body167, %for.cond1.preheader.us.i124
  %index168 = phi i64 [ 0, %for.cond1.preheader.us.i124 ], [ %index.next170, %vector.body167 ]
  %vec.phi = phi <4 x i32> [ %131, %for.cond1.preheader.us.i124 ], [ %163, %vector.body167 ]
  %132 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx.us.i125, i64 %index168
  %wide.load = load <4 x float>, ptr %132, align 4, !tbaa !10
  %133 = fpext <4 x float> %wide.load to <4 x double>
  %134 = getelementptr inbounds nuw [4 x i8], ptr %arrayidx7.us.i, i64 %index168
  %wide.load169 = load <4 x float>, ptr %134, align 4, !tbaa !10
  %135 = fpext <4 x float> %wide.load169 to <4 x double>
  %136 = fcmp olt <4 x double> %133, splat (double f0xB690000000000000)
  %137 = fneg <4 x float> %wide.load
  %138 = select <4 x i1> %136, <4 x float> %137, <4 x float> %wide.load
  %139 = fpext <4 x float> %138 to <4 x double>
  %140 = fcmp uge <4 x double> %139, splat (double 1.000000e-02)
  %141 = fcmp olt <4 x double> %135, splat (double f0xB690000000000000)
  %142 = fneg <4 x float> %wide.load169
  %143 = select <4 x i1> %141, <4 x float> %142, <4 x float> %wide.load169
  %144 = fpext <4 x float> %143 to <4 x double>
  %145 = fcmp uge <4 x double> %144, splat (double 1.000000e-02)
  %146 = fsub <4 x double> %133, %135
  %147 = fptrunc <4 x double> %146 to <4 x float>
  %148 = fcmp olt <4 x double> %146, splat (double f0xB690000000000000)
  %149 = fneg <4 x float> %147
  %150 = select <4 x i1> %148, <4 x float> %149, <4 x float> %147
  %151 = fadd <4 x double> %133, splat (double f0x3E45798EE0000000)
  %152 = fptrunc <4 x double> %151 to <4 x float>
  %153 = fcmp olt <4 x double> %151, splat (double f0xB690000000000000)
  %154 = fneg <4 x float> %152
  %155 = select <4 x i1> %153, <4 x float> %154, <4 x float> %152
  %156 = fdiv <4 x float> %150, %155
  %157 = fcmp olt <4 x float> %156, zeroinitializer
  %158 = fneg <4 x float> %156
  %159 = select <4 x i1> %157, <4 x float> %158, <4 x float> %156
  %160 = fmul <4 x float> %159, splat (float 1.000000e+02)
  %161 = fpext <4 x float> %160 to <4 x double>
  %162 = fcmp ogt <4 x double> %161, splat (double 5.000000e-02)
  %.not173 = select <4 x i1> %140, <4 x i1> splat (i1 true), <4 x i1> %145
  %narrow = select <4 x i1> %.not173, <4 x i1> %162, <4 x i1> zeroinitializer
  %predphi = zext <4 x i1> %narrow to <4 x i32>
  %163 = add <4 x i32> %vec.phi, %predphi
  %index.next170 = add nuw i64 %index168, 4
  %164 = icmp eq i64 %index.next170, 512
  br i1 %164, label %for.cond1.for.inc14_crit_edge.us.i, label %vector.body167, !llvm.loop !63

for.cond1.for.inc14_crit_edge.us.i:               ; preds = %vector.body167
  %165 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %163)
  %indvars.iv.next35.i = add nuw nsw i64 %indvars.iv34.i, 1
  %exitcond38.not.i = icmp eq i64 %indvars.iv.next35.i, 512
  br i1 %exitcond38.not.i, label %_Z14compareResultsiiPA512_fS0_.exit, label %for.cond1.preheader.us.i124, !llvm.loop !29

_Z14compareResultsiiPA512_fS0_.exit:              ; preds = %for.cond1.for.inc14_crit_edge.us.i
  %call17.i = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef 5.000000e-02, i32 noundef %165) #16
  call void @free(ptr noundef %3) #18
  call void @free(ptr noundef %6) #18
  call void @free(ptr noundef %12) #18
  call void @free(ptr noundef %15) #18
  call void @free(ptr noundef %0) #18
  call void @free(ptr noundef %9) #18
  call void @free(ptr noundef nonnull %18) #18
  call void @free(ptr noundef nonnull %21) #18
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local noundef nonnull ptr @_Z20polybench_alloc_datayi(i64 noundef %n, i32 noundef %elt_size) local_unnamed_addr #3 {
entry:
  %newA.i = alloca ptr, align 8
  %conv = sext i32 %elt_size to i64
  %mul = mul i64 %n, %conv
  call void @llvm.lifetime.start.p0(ptr nonnull %newA.i) #17
  store ptr null, ptr %newA.i, align 8, !tbaa !56
  %call.i = call i32 @posix_memalign(ptr noundef nonnull %newA.i, i64 noundef 32, i64 noundef %mul) #18
  %0 = load ptr, ptr %newA.i, align 8, !tbaa !56
  %tobool.i = icmp eq ptr %0, null
  %tobool1.i = icmp ne i32 %call.i, 0
  %or.cond.i = select i1 %tobool.i, i1 true, i1 %tobool1.i
  br i1 %or.cond.i, label %if.then.i, label %_ZL7xmallocm.exit

if.then.i:                                        ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !57
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
!42 = distinct !{!42, !38}
!43 = distinct !{!43, !13}
!44 = distinct !{!44, !13}
!45 = distinct !{!45, !13}
!46 = distinct !{!46, !38}
!47 = !{!48, !49, i64 0}
!48 = !{!"_ZTS7timeval", !49, i64 0, !49, i64 8}
!49 = !{!"long", !8, i64 0}
!50 = !{!48, !49, i64 8}
!51 = !{!52, !52, i64 0}
!52 = !{!"double", !8, i64 0}
!53 = !{ptr @_Z26__device_stub__mm3_kernel1iiiiiPfS_S_}
!54 = !{ptr @_Z26__device_stub__mm3_kernel2iiiiiPfS_S_}
!55 = !{ptr @_Z26__device_stub__mm3_kernel3iiiiiPfS_S_}
!56 = !{!33, !33, i64 0}
!57 = !{!58, !58, i64 0}
!58 = !{!"p1 _ZTS8_IO_FILE", !33, i64 0}
!59 = distinct !{!59, !13, !14, !15}
!60 = distinct !{!60, !13, !14, !15}
!61 = distinct !{!61, !13, !14, !15}
!62 = distinct !{!62, !13, !14, !15}
!63 = distinct !{!63, !13, !14, !15}
