; ModuleID = '/root/polybenchGpu/HIP/GEMVER/gemver.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/GEMVER/gemver.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_8e8c72ca3056e012 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_8e8c72ca3056e012 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z14gemver_kernel1iffPfS_S_S_S_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr addrspace(1) nofree noundef captures(none) %a.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %v1.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %v2.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %u1.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %u2.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i41 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i41
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i50 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i47 = zext i16 %.in.i50 to i32
  %mul10 = mul i32 %4, %conv.i47
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add12 = add i32 %mul10, %6
  %cmp = icmp slt i32 %add12, %n
  %cmp13 = icmp slt i32 %add, %n
  %or.cond = and i1 %cmp13, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %idxprom = sext i32 %add12 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %u1.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %idxprom14 = sext i32 %add to i64
  %arrayidx15 = getelementptr inbounds [4 x i8], ptr addrspace(1) %v1.coerce, i64 %idxprom14
  %8 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %mul16 = fmul contract float %7, %8
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr addrspace(1) %u2.coerce, i64 %idxprom
  %9 = load float, ptr addrspace(1) %arrayidx18, align 4, !tbaa !18
  %arrayidx20 = getelementptr inbounds [4 x i8], ptr addrspace(1) %v2.coerce, i64 %idxprom14
  %10 = load float, ptr addrspace(1) %arrayidx20, align 4, !tbaa !18
  %mul21 = fmul contract float %9, %10
  %add22 = fadd contract float %mul16, %mul21
  %mul23 = shl nsw i32 %add12, 12
  %add24 = add nsw i32 %mul23, %add
  %idxprom25 = sext i32 %add24 to i64
  %arrayidx26 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom25
  %11 = load float, ptr addrspace(1) %arrayidx26, align 4, !tbaa !18
  %add27 = fadd contract float %11, %add22
  store float %add27, ptr addrspace(1) %arrayidx26, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z14gemver_kernel2iffPfS_S_S_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr addrspace(1) nofree noundef readonly captures(none) %a.coerce, ptr addrspace(1) nofree noundef captures(none) %x.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %y.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %z.coerce) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i34 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i34
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %cmp = icmp slt i32 %add, %n
  br i1 %cmp, label %for.cond.preheader, label %if.end

for.cond.preheader:                               ; preds = %entry
  %cmp737 = icmp sgt i32 %n, 0
  %idxprom14 = sext i32 %add to i64
  %arrayidx15 = getelementptr inbounds [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom14
  %arrayidx15.promoted = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  br i1 %cmp737, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %for.cond.preheader
  %xtraiter = and i32 %n, 7
  %4 = icmp ult i32 %n, 8
  br i1 %4, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %n, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %5 = phi float [ %arrayidx15.promoted, %for.body.preheader.new ], [ %add16.7, %for.body ]
  %j.038 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %mul8 = shl nuw nsw i32 %j.038, 12
  %add9 = add nsw i32 %mul8, %add
  %idxprom = sext i32 %add9 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom
  %6 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul10 = fmul contract float %beta, %6
  %idxprom11 = zext nneg i32 %j.038 to i64
  %arrayidx12 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y.coerce, i64 %idxprom11
  %7 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %mul13 = fmul contract float %mul10, %7
  %add16 = fadd contract float %5, %mul13
  store float %add16, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc = or disjoint i32 %j.038, 1
  %mul8.1 = shl nuw nsw i32 %inc, 12
  %add9.1 = add nsw i32 %mul8.1, %add
  %idxprom.1 = sext i32 %add9.1 to i64
  %arrayidx.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.1
  %8 = load float, ptr addrspace(1) %arrayidx.1, align 4, !tbaa !18
  %mul10.1 = fmul contract float %beta, %8
  %idxprom11.1 = zext nneg i32 %inc to i64
  %arrayidx12.1 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y.coerce, i64 %idxprom11.1
  %9 = load float, ptr addrspace(1) %arrayidx12.1, align 4, !tbaa !18
  %mul13.1 = fmul contract float %mul10.1, %9
  %add16.1 = fadd contract float %add16, %mul13.1
  store float %add16.1, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %j.038, 2
  %mul8.2 = shl nuw nsw i32 %inc.1, 12
  %add9.2 = add nsw i32 %mul8.2, %add
  %idxprom.2 = sext i32 %add9.2 to i64
  %arrayidx.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.2
  %10 = load float, ptr addrspace(1) %arrayidx.2, align 4, !tbaa !18
  %mul10.2 = fmul contract float %beta, %10
  %idxprom11.2 = zext nneg i32 %inc.1 to i64
  %arrayidx12.2 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y.coerce, i64 %idxprom11.2
  %11 = load float, ptr addrspace(1) %arrayidx12.2, align 4, !tbaa !18
  %mul13.2 = fmul contract float %mul10.2, %11
  %add16.2 = fadd contract float %add16.1, %mul13.2
  store float %add16.2, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %j.038, 3
  %mul8.3 = shl nuw nsw i32 %inc.2, 12
  %add9.3 = add nsw i32 %mul8.3, %add
  %idxprom.3 = sext i32 %add9.3 to i64
  %arrayidx.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.3
  %12 = load float, ptr addrspace(1) %arrayidx.3, align 4, !tbaa !18
  %mul10.3 = fmul contract float %beta, %12
  %idxprom11.3 = zext nneg i32 %inc.2 to i64
  %arrayidx12.3 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y.coerce, i64 %idxprom11.3
  %13 = load float, ptr addrspace(1) %arrayidx12.3, align 4, !tbaa !18
  %mul13.3 = fmul contract float %mul10.3, %13
  %add16.3 = fadd contract float %add16.2, %mul13.3
  store float %add16.3, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %j.038, 4
  %mul8.4 = shl nuw nsw i32 %inc.3, 12
  %add9.4 = add nsw i32 %mul8.4, %add
  %idxprom.4 = sext i32 %add9.4 to i64
  %arrayidx.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.4
  %14 = load float, ptr addrspace(1) %arrayidx.4, align 4, !tbaa !18
  %mul10.4 = fmul contract float %beta, %14
  %idxprom11.4 = zext nneg i32 %inc.3 to i64
  %arrayidx12.4 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y.coerce, i64 %idxprom11.4
  %15 = load float, ptr addrspace(1) %arrayidx12.4, align 4, !tbaa !18
  %mul13.4 = fmul contract float %mul10.4, %15
  %add16.4 = fadd contract float %add16.3, %mul13.4
  store float %add16.4, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %j.038, 5
  %mul8.5 = shl nuw nsw i32 %inc.4, 12
  %add9.5 = add nsw i32 %mul8.5, %add
  %idxprom.5 = sext i32 %add9.5 to i64
  %arrayidx.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.5
  %16 = load float, ptr addrspace(1) %arrayidx.5, align 4, !tbaa !18
  %mul10.5 = fmul contract float %beta, %16
  %idxprom11.5 = zext nneg i32 %inc.4 to i64
  %arrayidx12.5 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y.coerce, i64 %idxprom11.5
  %17 = load float, ptr addrspace(1) %arrayidx12.5, align 4, !tbaa !18
  %mul13.5 = fmul contract float %mul10.5, %17
  %add16.5 = fadd contract float %add16.4, %mul13.5
  store float %add16.5, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %j.038, 6
  %mul8.6 = shl nuw nsw i32 %inc.5, 12
  %add9.6 = add nsw i32 %mul8.6, %add
  %idxprom.6 = sext i32 %add9.6 to i64
  %arrayidx.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.6
  %18 = load float, ptr addrspace(1) %arrayidx.6, align 4, !tbaa !18
  %mul10.6 = fmul contract float %beta, %18
  %idxprom11.6 = zext nneg i32 %inc.5 to i64
  %arrayidx12.6 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y.coerce, i64 %idxprom11.6
  %19 = load float, ptr addrspace(1) %arrayidx12.6, align 4, !tbaa !18
  %mul13.6 = fmul contract float %mul10.6, %19
  %add16.6 = fadd contract float %add16.5, %mul13.6
  store float %add16.6, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %j.038, 7
  %mul8.7 = shl nuw nsw i32 %inc.6, 12
  %add9.7 = add nsw i32 %mul8.7, %add
  %idxprom.7 = sext i32 %add9.7 to i64
  %arrayidx.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.7
  %20 = load float, ptr addrspace(1) %arrayidx.7, align 4, !tbaa !18
  %mul10.7 = fmul contract float %beta, %20
  %idxprom11.7 = zext nneg i32 %inc.6 to i64
  %arrayidx12.7 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y.coerce, i64 %idxprom11.7
  %21 = load float, ptr addrspace(1) %arrayidx12.7, align 4, !tbaa !18
  %mul13.7 = fmul contract float %mul10.7, %21
  %add16.7 = fadd contract float %add16.6, %mul13.7
  store float %add16.7, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %j.038, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !20

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.preheader
  %.epil.init = phi float [ %arrayidx15.promoted, %for.body.preheader ], [ %add16.7, %for.end.loopexit.unr-lcssa ]
  %j.038.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod40 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod40)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %22 = phi float [ %add16.epil, %for.body.epil ], [ %.epil.init, %for.body.epil.preheader ]
  %j.038.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %j.038.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %mul8.epil = shl nuw nsw i32 %j.038.epil, 12
  %add9.epil = add nsw i32 %mul8.epil, %add
  %idxprom.epil = sext i32 %add9.epil to i64
  %arrayidx.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.epil
  %23 = load float, ptr addrspace(1) %arrayidx.epil, align 4, !tbaa !18
  %mul10.epil = fmul contract float %beta, %23
  %idxprom11.epil = zext nneg i32 %j.038.epil to i64
  %arrayidx12.epil = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %y.coerce, i64 %idxprom11.epil
  %24 = load float, ptr addrspace(1) %arrayidx12.epil, align 4, !tbaa !18
  %mul13.epil = fmul contract float %mul10.epil, %24
  %add16.epil = fadd contract float %22, %mul13.epil
  store float %add16.epil, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %j.038.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body.epil, !llvm.loop !22

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil, %for.cond.preheader
  %25 = phi float [ %arrayidx15.promoted, %for.cond.preheader ], [ %add16.7, %for.end.loopexit.unr-lcssa ], [ %add16.epil, %for.body.epil ]
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr addrspace(1) %z.coerce, i64 %idxprom14
  %26 = load float, ptr addrspace(1) %arrayidx18, align 4, !tbaa !18
  %arrayidx20 = getelementptr inbounds [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom14
  %add21 = fadd contract float %26, %25
  store float %add21, ptr addrspace(1) %arrayidx20, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z14gemver_kernel3iffPfS_S_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr addrspace(1) nofree noundef readonly captures(none) %a.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %x.coerce, ptr addrspace(1) nofree noundef captures(none) %w.coerce) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i27 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i27
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %cmp = icmp sgt i32 %add, -1
  %cmp6 = icmp slt i32 %add, %n
  %or.cond = and i1 %cmp, %cmp6
  %cmp730 = icmp sgt i32 %n, 0
  %or.cond32 = and i1 %or.cond, %cmp730
  br i1 %or.cond32, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %entry
  %mul8 = shl nsw i32 %add, 12
  %idxprom14 = zext nneg i32 %add to i64
  %arrayidx15 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %w.coerce, i64 %idxprom14
  %arrayidx15.promoted = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %xtraiter = and i32 %n, 7
  %4 = icmp ult i32 %n, 8
  br i1 %4, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %n, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %5 = phi float [ %arrayidx15.promoted, %for.body.lr.ph.new ], [ %add16.7, %for.body ]
  %j.031 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.7, %for.body ]
  %add9 = add nuw nsw i32 %j.031, %mul8
  %idxprom = zext nneg i32 %add9 to i64
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom
  %6 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul10 = fmul contract float %alpha, %6
  %idxprom11 = zext nneg i32 %j.031 to i64
  %arrayidx12 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11
  %7 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %mul13 = fmul contract float %mul10, %7
  %add16 = fadd contract float %5, %mul13
  store float %add16, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc = or disjoint i32 %j.031, 1
  %add9.1 = add nuw nsw i32 %inc, %mul8
  %idxprom.1 = zext nneg i32 %add9.1 to i64
  %arrayidx.1 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.1
  %8 = load float, ptr addrspace(1) %arrayidx.1, align 4, !tbaa !18
  %mul10.1 = fmul contract float %alpha, %8
  %idxprom11.1 = zext nneg i32 %inc to i64
  %arrayidx12.1 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.1
  %9 = load float, ptr addrspace(1) %arrayidx12.1, align 4, !tbaa !18
  %mul13.1 = fmul contract float %mul10.1, %9
  %add16.1 = fadd contract float %add16, %mul13.1
  store float %add16.1, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %j.031, 2
  %add9.2 = add nuw nsw i32 %inc.1, %mul8
  %idxprom.2 = zext nneg i32 %add9.2 to i64
  %arrayidx.2 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.2
  %10 = load float, ptr addrspace(1) %arrayidx.2, align 4, !tbaa !18
  %mul10.2 = fmul contract float %alpha, %10
  %idxprom11.2 = zext nneg i32 %inc.1 to i64
  %arrayidx12.2 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.2
  %11 = load float, ptr addrspace(1) %arrayidx12.2, align 4, !tbaa !18
  %mul13.2 = fmul contract float %mul10.2, %11
  %add16.2 = fadd contract float %add16.1, %mul13.2
  store float %add16.2, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %j.031, 3
  %add9.3 = add nuw nsw i32 %inc.2, %mul8
  %idxprom.3 = zext nneg i32 %add9.3 to i64
  %arrayidx.3 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.3
  %12 = load float, ptr addrspace(1) %arrayidx.3, align 4, !tbaa !18
  %mul10.3 = fmul contract float %alpha, %12
  %idxprom11.3 = zext nneg i32 %inc.2 to i64
  %arrayidx12.3 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.3
  %13 = load float, ptr addrspace(1) %arrayidx12.3, align 4, !tbaa !18
  %mul13.3 = fmul contract float %mul10.3, %13
  %add16.3 = fadd contract float %add16.2, %mul13.3
  store float %add16.3, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %j.031, 4
  %add9.4 = add nuw nsw i32 %inc.3, %mul8
  %idxprom.4 = zext nneg i32 %add9.4 to i64
  %arrayidx.4 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.4
  %14 = load float, ptr addrspace(1) %arrayidx.4, align 4, !tbaa !18
  %mul10.4 = fmul contract float %alpha, %14
  %idxprom11.4 = zext nneg i32 %inc.3 to i64
  %arrayidx12.4 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.4
  %15 = load float, ptr addrspace(1) %arrayidx12.4, align 4, !tbaa !18
  %mul13.4 = fmul contract float %mul10.4, %15
  %add16.4 = fadd contract float %add16.3, %mul13.4
  store float %add16.4, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %j.031, 5
  %add9.5 = add nuw nsw i32 %inc.4, %mul8
  %idxprom.5 = zext nneg i32 %add9.5 to i64
  %arrayidx.5 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.5
  %16 = load float, ptr addrspace(1) %arrayidx.5, align 4, !tbaa !18
  %mul10.5 = fmul contract float %alpha, %16
  %idxprom11.5 = zext nneg i32 %inc.4 to i64
  %arrayidx12.5 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.5
  %17 = load float, ptr addrspace(1) %arrayidx12.5, align 4, !tbaa !18
  %mul13.5 = fmul contract float %mul10.5, %17
  %add16.5 = fadd contract float %add16.4, %mul13.5
  store float %add16.5, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %j.031, 6
  %add9.6 = add nuw nsw i32 %inc.5, %mul8
  %idxprom.6 = zext nneg i32 %add9.6 to i64
  %arrayidx.6 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.6
  %18 = load float, ptr addrspace(1) %arrayidx.6, align 4, !tbaa !18
  %mul10.6 = fmul contract float %alpha, %18
  %idxprom11.6 = zext nneg i32 %inc.5 to i64
  %arrayidx12.6 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.6
  %19 = load float, ptr addrspace(1) %arrayidx12.6, align 4, !tbaa !18
  %mul13.6 = fmul contract float %mul10.6, %19
  %add16.6 = fadd contract float %add16.5, %mul13.6
  store float %add16.6, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %j.031, 7
  %add9.7 = add nuw nsw i32 %inc.6, %mul8
  %idxprom.7 = zext nneg i32 %add9.7 to i64
  %arrayidx.7 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.7
  %20 = load float, ptr addrspace(1) %arrayidx.7, align 4, !tbaa !18
  %mul10.7 = fmul contract float %alpha, %20
  %idxprom11.7 = zext nneg i32 %inc.6 to i64
  %arrayidx12.7 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.7
  %21 = load float, ptr addrspace(1) %arrayidx12.7, align 4, !tbaa !18
  %mul13.7 = fmul contract float %mul10.7, %21
  %add16.7 = fadd contract float %add16.6, %mul13.7
  store float %add16.7, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %j.031, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !24

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.lr.ph
  %.epil.init = phi float [ %arrayidx15.promoted, %for.body.lr.ph ], [ %add16.7, %if.end.loopexit.unr-lcssa ]
  %j.031.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.7, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod33 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod33)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %22 = phi float [ %.epil.init, %for.body.epil.preheader ], [ %add16.epil, %for.body.epil ]
  %j.031.epil = phi i32 [ %j.031.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %add9.epil = add nuw nsw i32 %j.031.epil, %mul8
  %idxprom.epil = zext nneg i32 %add9.epil to i64
  %arrayidx.epil = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.epil
  %23 = load float, ptr addrspace(1) %arrayidx.epil, align 4, !tbaa !18
  %mul10.epil = fmul contract float %alpha, %23
  %idxprom11.epil = zext nneg i32 %j.031.epil to i64
  %arrayidx12.epil = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.epil
  %24 = load float, ptr addrspace(1) %arrayidx12.epil, align 4, !tbaa !18
  %mul13.epil = fmul contract float %mul10.epil, %24
  %add16.epil = fadd contract float %22, %mul13.epil
  store float %add16.epil, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %j.031.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !25

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

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
