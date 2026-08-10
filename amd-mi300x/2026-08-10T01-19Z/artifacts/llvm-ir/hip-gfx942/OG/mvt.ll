; ModuleID = '/root/polybenchGpu/HIP/MVT/mvt.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/MVT/mvt.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_dca0bdad91774fdd = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_dca0bdad91774fdd to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11mvt_kernel1iPfS_S_(i32 noundef %n, ptr addrspace(1) nofree noundef readonly captures(none) %a.coerce, ptr addrspace(1) nofree noundef captures(none) %x1.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %y_1.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i24 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i24
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %4
  %cmp = icmp slt i32 %add, %n
  %cmp627 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp, %cmp627
  br i1 %or.cond, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %entry
  %mul7 = shl nsw i32 %add, 12
  %idxprom12 = sext i32 %add to i64
  %arrayidx13 = getelementptr inbounds [4 x i8], ptr addrspace(1) %x1.coerce, i64 %idxprom12
  %arrayidx13.promoted = load float, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %xtraiter = and i32 %n, 7
  %5 = icmp ult i32 %n, 8
  br i1 %5, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %n, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %6 = phi float [ %arrayidx13.promoted, %for.body.lr.ph.new ], [ %add14.7, %for.body ]
  %j.028 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.7, %for.body ]
  %add8 = add nsw i32 %j.028, %mul7
  %idxprom = sext i32 %add8 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %idxprom9 = zext nneg i32 %j.028 to i64
  %arrayidx10 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_1.coerce, i64 %idxprom9
  %8 = load float, ptr addrspace(1) %arrayidx10, align 4, !tbaa !18
  %mul11 = fmul contract float %7, %8
  %add14 = fadd contract float %6, %mul11
  store float %add14, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc = or disjoint i32 %j.028, 1
  %add8.1 = add nsw i32 %inc, %mul7
  %idxprom.1 = sext i32 %add8.1 to i64
  %arrayidx.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.1
  %9 = load float, ptr addrspace(1) %arrayidx.1, align 4, !tbaa !18
  %idxprom9.1 = zext nneg i32 %inc to i64
  %arrayidx10.1 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_1.coerce, i64 %idxprom9.1
  %10 = load float, ptr addrspace(1) %arrayidx10.1, align 4, !tbaa !18
  %mul11.1 = fmul contract float %9, %10
  %add14.1 = fadd contract float %add14, %mul11.1
  store float %add14.1, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %j.028, 2
  %add8.2 = add nsw i32 %inc.1, %mul7
  %idxprom.2 = sext i32 %add8.2 to i64
  %arrayidx.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.2
  %11 = load float, ptr addrspace(1) %arrayidx.2, align 4, !tbaa !18
  %idxprom9.2 = zext nneg i32 %inc.1 to i64
  %arrayidx10.2 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_1.coerce, i64 %idxprom9.2
  %12 = load float, ptr addrspace(1) %arrayidx10.2, align 4, !tbaa !18
  %mul11.2 = fmul contract float %11, %12
  %add14.2 = fadd contract float %add14.1, %mul11.2
  store float %add14.2, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %j.028, 3
  %add8.3 = add nsw i32 %inc.2, %mul7
  %idxprom.3 = sext i32 %add8.3 to i64
  %arrayidx.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.3
  %13 = load float, ptr addrspace(1) %arrayidx.3, align 4, !tbaa !18
  %idxprom9.3 = zext nneg i32 %inc.2 to i64
  %arrayidx10.3 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_1.coerce, i64 %idxprom9.3
  %14 = load float, ptr addrspace(1) %arrayidx10.3, align 4, !tbaa !18
  %mul11.3 = fmul contract float %13, %14
  %add14.3 = fadd contract float %add14.2, %mul11.3
  store float %add14.3, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %j.028, 4
  %add8.4 = add nsw i32 %inc.3, %mul7
  %idxprom.4 = sext i32 %add8.4 to i64
  %arrayidx.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.4
  %15 = load float, ptr addrspace(1) %arrayidx.4, align 4, !tbaa !18
  %idxprom9.4 = zext nneg i32 %inc.3 to i64
  %arrayidx10.4 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_1.coerce, i64 %idxprom9.4
  %16 = load float, ptr addrspace(1) %arrayidx10.4, align 4, !tbaa !18
  %mul11.4 = fmul contract float %15, %16
  %add14.4 = fadd contract float %add14.3, %mul11.4
  store float %add14.4, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %j.028, 5
  %add8.5 = add nsw i32 %inc.4, %mul7
  %idxprom.5 = sext i32 %add8.5 to i64
  %arrayidx.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.5
  %17 = load float, ptr addrspace(1) %arrayidx.5, align 4, !tbaa !18
  %idxprom9.5 = zext nneg i32 %inc.4 to i64
  %arrayidx10.5 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_1.coerce, i64 %idxprom9.5
  %18 = load float, ptr addrspace(1) %arrayidx10.5, align 4, !tbaa !18
  %mul11.5 = fmul contract float %17, %18
  %add14.5 = fadd contract float %add14.4, %mul11.5
  store float %add14.5, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %j.028, 6
  %add8.6 = add nsw i32 %inc.5, %mul7
  %idxprom.6 = sext i32 %add8.6 to i64
  %arrayidx.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.6
  %19 = load float, ptr addrspace(1) %arrayidx.6, align 4, !tbaa !18
  %idxprom9.6 = zext nneg i32 %inc.5 to i64
  %arrayidx10.6 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_1.coerce, i64 %idxprom9.6
  %20 = load float, ptr addrspace(1) %arrayidx10.6, align 4, !tbaa !18
  %mul11.6 = fmul contract float %19, %20
  %add14.6 = fadd contract float %add14.5, %mul11.6
  store float %add14.6, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %j.028, 7
  %add8.7 = add nsw i32 %inc.6, %mul7
  %idxprom.7 = sext i32 %add8.7 to i64
  %arrayidx.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.7
  %21 = load float, ptr addrspace(1) %arrayidx.7, align 4, !tbaa !18
  %idxprom9.7 = zext nneg i32 %inc.6 to i64
  %arrayidx10.7 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_1.coerce, i64 %idxprom9.7
  %22 = load float, ptr addrspace(1) %arrayidx10.7, align 4, !tbaa !18
  %mul11.7 = fmul contract float %21, %22
  %add14.7 = fadd contract float %add14.6, %mul11.7
  store float %add14.7, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %j.028, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !20

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.lr.ph
  %.epil.init = phi float [ %arrayidx13.promoted, %for.body.lr.ph ], [ %add14.7, %if.end.loopexit.unr-lcssa ]
  %j.028.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.7, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod29 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod29)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %23 = phi float [ %.epil.init, %for.body.epil.preheader ], [ %add14.epil, %for.body.epil ]
  %j.028.epil = phi i32 [ %j.028.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %add8.epil = add nsw i32 %j.028.epil, %mul7
  %idxprom.epil = sext i32 %add8.epil to i64
  %arrayidx.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.epil
  %24 = load float, ptr addrspace(1) %arrayidx.epil, align 4, !tbaa !18
  %idxprom9.epil = zext nneg i32 %j.028.epil to i64
  %arrayidx10.epil = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_1.coerce, i64 %idxprom9.epil
  %25 = load float, ptr addrspace(1) %arrayidx10.epil, align 4, !tbaa !18
  %mul11.epil = fmul contract float %24, %25
  %add14.epil = fadd contract float %23, %mul11.epil
  store float %add14.epil, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %j.028.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !22

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11mvt_kernel2iPfS_S_(i32 noundef %n, ptr addrspace(1) nofree noundef readonly captures(none) %a.coerce, ptr addrspace(1) nofree noundef captures(none) %x2.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %y_2.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i24 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i24
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %4
  %cmp = icmp slt i32 %add, %n
  %cmp627 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp, %cmp627
  br i1 %or.cond, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %entry
  %idxprom12 = sext i32 %add to i64
  %arrayidx13 = getelementptr inbounds [4 x i8], ptr addrspace(1) %x2.coerce, i64 %idxprom12
  %arrayidx13.promoted = load float, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %xtraiter = and i32 %n, 7
  %5 = icmp ult i32 %n, 8
  br i1 %5, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %n, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %6 = phi float [ %arrayidx13.promoted, %for.body.lr.ph.new ], [ %add14.7, %for.body ]
  %j.028 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.7, %for.body ]
  %mul7 = shl nuw nsw i32 %j.028, 12
  %add8 = add nsw i32 %mul7, %add
  %idxprom = sext i32 %add8 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %idxprom9 = zext nneg i32 %j.028 to i64
  %arrayidx10 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_2.coerce, i64 %idxprom9
  %8 = load float, ptr addrspace(1) %arrayidx10, align 4, !tbaa !18
  %mul11 = fmul contract float %7, %8
  %add14 = fadd contract float %6, %mul11
  store float %add14, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc = or disjoint i32 %j.028, 1
  %mul7.1 = shl nuw nsw i32 %inc, 12
  %add8.1 = add nsw i32 %mul7.1, %add
  %idxprom.1 = sext i32 %add8.1 to i64
  %arrayidx.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.1
  %9 = load float, ptr addrspace(1) %arrayidx.1, align 4, !tbaa !18
  %idxprom9.1 = zext nneg i32 %inc to i64
  %arrayidx10.1 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_2.coerce, i64 %idxprom9.1
  %10 = load float, ptr addrspace(1) %arrayidx10.1, align 4, !tbaa !18
  %mul11.1 = fmul contract float %9, %10
  %add14.1 = fadd contract float %add14, %mul11.1
  store float %add14.1, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %j.028, 2
  %mul7.2 = shl nuw nsw i32 %inc.1, 12
  %add8.2 = add nsw i32 %mul7.2, %add
  %idxprom.2 = sext i32 %add8.2 to i64
  %arrayidx.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.2
  %11 = load float, ptr addrspace(1) %arrayidx.2, align 4, !tbaa !18
  %idxprom9.2 = zext nneg i32 %inc.1 to i64
  %arrayidx10.2 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_2.coerce, i64 %idxprom9.2
  %12 = load float, ptr addrspace(1) %arrayidx10.2, align 4, !tbaa !18
  %mul11.2 = fmul contract float %11, %12
  %add14.2 = fadd contract float %add14.1, %mul11.2
  store float %add14.2, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %j.028, 3
  %mul7.3 = shl nuw nsw i32 %inc.2, 12
  %add8.3 = add nsw i32 %mul7.3, %add
  %idxprom.3 = sext i32 %add8.3 to i64
  %arrayidx.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.3
  %13 = load float, ptr addrspace(1) %arrayidx.3, align 4, !tbaa !18
  %idxprom9.3 = zext nneg i32 %inc.2 to i64
  %arrayidx10.3 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_2.coerce, i64 %idxprom9.3
  %14 = load float, ptr addrspace(1) %arrayidx10.3, align 4, !tbaa !18
  %mul11.3 = fmul contract float %13, %14
  %add14.3 = fadd contract float %add14.2, %mul11.3
  store float %add14.3, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %j.028, 4
  %mul7.4 = shl nuw nsw i32 %inc.3, 12
  %add8.4 = add nsw i32 %mul7.4, %add
  %idxprom.4 = sext i32 %add8.4 to i64
  %arrayidx.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.4
  %15 = load float, ptr addrspace(1) %arrayidx.4, align 4, !tbaa !18
  %idxprom9.4 = zext nneg i32 %inc.3 to i64
  %arrayidx10.4 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_2.coerce, i64 %idxprom9.4
  %16 = load float, ptr addrspace(1) %arrayidx10.4, align 4, !tbaa !18
  %mul11.4 = fmul contract float %15, %16
  %add14.4 = fadd contract float %add14.3, %mul11.4
  store float %add14.4, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %j.028, 5
  %mul7.5 = shl nuw nsw i32 %inc.4, 12
  %add8.5 = add nsw i32 %mul7.5, %add
  %idxprom.5 = sext i32 %add8.5 to i64
  %arrayidx.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.5
  %17 = load float, ptr addrspace(1) %arrayidx.5, align 4, !tbaa !18
  %idxprom9.5 = zext nneg i32 %inc.4 to i64
  %arrayidx10.5 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_2.coerce, i64 %idxprom9.5
  %18 = load float, ptr addrspace(1) %arrayidx10.5, align 4, !tbaa !18
  %mul11.5 = fmul contract float %17, %18
  %add14.5 = fadd contract float %add14.4, %mul11.5
  store float %add14.5, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %j.028, 6
  %mul7.6 = shl nuw nsw i32 %inc.5, 12
  %add8.6 = add nsw i32 %mul7.6, %add
  %idxprom.6 = sext i32 %add8.6 to i64
  %arrayidx.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.6
  %19 = load float, ptr addrspace(1) %arrayidx.6, align 4, !tbaa !18
  %idxprom9.6 = zext nneg i32 %inc.5 to i64
  %arrayidx10.6 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_2.coerce, i64 %idxprom9.6
  %20 = load float, ptr addrspace(1) %arrayidx10.6, align 4, !tbaa !18
  %mul11.6 = fmul contract float %19, %20
  %add14.6 = fadd contract float %add14.5, %mul11.6
  store float %add14.6, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %j.028, 7
  %mul7.7 = shl nuw nsw i32 %inc.6, 12
  %add8.7 = add nsw i32 %mul7.7, %add
  %idxprom.7 = sext i32 %add8.7 to i64
  %arrayidx.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.7
  %21 = load float, ptr addrspace(1) %arrayidx.7, align 4, !tbaa !18
  %idxprom9.7 = zext nneg i32 %inc.6 to i64
  %arrayidx10.7 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_2.coerce, i64 %idxprom9.7
  %22 = load float, ptr addrspace(1) %arrayidx10.7, align 4, !tbaa !18
  %mul11.7 = fmul contract float %21, %22
  %add14.7 = fadd contract float %add14.6, %mul11.7
  store float %add14.7, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %j.028, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !24

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.lr.ph
  %.epil.init = phi float [ %arrayidx13.promoted, %for.body.lr.ph ], [ %add14.7, %if.end.loopexit.unr-lcssa ]
  %j.028.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.7, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod29 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod29)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %23 = phi float [ %.epil.init, %for.body.epil.preheader ], [ %add14.epil, %for.body.epil ]
  %j.028.epil = phi i32 [ %j.028.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %mul7.epil = shl nuw nsw i32 %j.028.epil, 12
  %add8.epil = add nsw i32 %mul7.epil, %add
  %idxprom.epil = sext i32 %add8.epil to i64
  %arrayidx.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.epil
  %24 = load float, ptr addrspace(1) %arrayidx.epil, align 4, !tbaa !18
  %idxprom9.epil = zext nneg i32 %j.028.epil to i64
  %arrayidx10.epil = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y_2.coerce, i64 %idxprom9.epil
  %25 = load float, ptr addrspace(1) %arrayidx10.epil, align 4, !tbaa !18
  %mul11.epil = fmul contract float %24, %25
  %add14.epil = fadd contract float %23, %mul11.epil
  store float %add14.epil, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %j.028.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !25

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4, !5}
!llvm.errno.tbaa = !{!6, !11}
!opencl.ocl.version = !{!15}

!0 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 24.0.0git (https://github.com/llvm/llvm-project c45e6b9e4d95fb444eb1308416c10d95350d3c52)"}
!5 = !{!"AMD clang version 23.0.0git (https://github.com/ROCm/llvm-project.git 46fcb339fb61119b337f973c7ca9e710a319fdd0+PATCHED:440716f8b87be9d8e20ed910e10e5b6d14d57cf6)"}
!6 = !{!7, !8, i64 0}
!7 = !{!"__libc_errno", !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{i32 2, i32 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"short", !13, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !9, i64 0}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !23}
