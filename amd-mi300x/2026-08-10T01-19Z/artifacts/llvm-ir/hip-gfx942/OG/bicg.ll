; ModuleID = '/root/polybenchGpu/HIP/BICG/bicg.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/BICG/bicg.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_41099ab5de1edac9 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_41099ab5de1edac9 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z12bicg_kernel1iiPfS_S_(i32 noundef %nx, i32 noundef %ny, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %r.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %s.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i27 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i27
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %4
  %cmp = icmp slt i32 %add, %ny
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %s.coerce, i64 %idxprom
  store float 0.000000e+00, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %cmp630 = icmp sgt i32 %nx, 0
  br i1 %cmp630, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %nx, 7
  %5 = icmp ult i32 %nx, 8
  br i1 %5, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %nx, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %add1632 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add16.7, %for.body ]
  %i.031 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %idxprom7 = zext nneg i32 %i.031 to i64
  %arrayidx8 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %r.coerce, i64 %idxprom7
  %6 = load float, ptr addrspace(1) %arrayidx8, align 4, !tbaa !18
  %mul9 = shl nuw nsw i32 %i.031, 12
  %add10 = add nsw i32 %mul9, %add
  %idxprom11 = sext i32 %add10 to i64
  %arrayidx12 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom11
  %7 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %mul13 = fmul contract float %6, %7
  %add16 = fadd contract float %add1632, %mul13
  store float %add16, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = or disjoint i32 %i.031, 1
  %idxprom7.1 = zext nneg i32 %inc to i64
  %arrayidx8.1 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %r.coerce, i64 %idxprom7.1
  %8 = load float, ptr addrspace(1) %arrayidx8.1, align 4, !tbaa !18
  %mul9.1 = shl nuw nsw i32 %inc, 12
  %add10.1 = add nsw i32 %mul9.1, %add
  %idxprom11.1 = sext i32 %add10.1 to i64
  %arrayidx12.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom11.1
  %9 = load float, ptr addrspace(1) %arrayidx12.1, align 4, !tbaa !18
  %mul13.1 = fmul contract float %8, %9
  %add16.1 = fadd contract float %add16, %mul13.1
  store float %add16.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %i.031, 2
  %idxprom7.2 = zext nneg i32 %inc.1 to i64
  %arrayidx8.2 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %r.coerce, i64 %idxprom7.2
  %10 = load float, ptr addrspace(1) %arrayidx8.2, align 4, !tbaa !18
  %mul9.2 = shl nuw nsw i32 %inc.1, 12
  %add10.2 = add nsw i32 %mul9.2, %add
  %idxprom11.2 = sext i32 %add10.2 to i64
  %arrayidx12.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom11.2
  %11 = load float, ptr addrspace(1) %arrayidx12.2, align 4, !tbaa !18
  %mul13.2 = fmul contract float %10, %11
  %add16.2 = fadd contract float %add16.1, %mul13.2
  store float %add16.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %i.031, 3
  %idxprom7.3 = zext nneg i32 %inc.2 to i64
  %arrayidx8.3 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %r.coerce, i64 %idxprom7.3
  %12 = load float, ptr addrspace(1) %arrayidx8.3, align 4, !tbaa !18
  %mul9.3 = shl nuw nsw i32 %inc.2, 12
  %add10.3 = add nsw i32 %mul9.3, %add
  %idxprom11.3 = sext i32 %add10.3 to i64
  %arrayidx12.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom11.3
  %13 = load float, ptr addrspace(1) %arrayidx12.3, align 4, !tbaa !18
  %mul13.3 = fmul contract float %12, %13
  %add16.3 = fadd contract float %add16.2, %mul13.3
  store float %add16.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %i.031, 4
  %idxprom7.4 = zext nneg i32 %inc.3 to i64
  %arrayidx8.4 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %r.coerce, i64 %idxprom7.4
  %14 = load float, ptr addrspace(1) %arrayidx8.4, align 4, !tbaa !18
  %mul9.4 = shl nuw nsw i32 %inc.3, 12
  %add10.4 = add nsw i32 %mul9.4, %add
  %idxprom11.4 = sext i32 %add10.4 to i64
  %arrayidx12.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom11.4
  %15 = load float, ptr addrspace(1) %arrayidx12.4, align 4, !tbaa !18
  %mul13.4 = fmul contract float %14, %15
  %add16.4 = fadd contract float %add16.3, %mul13.4
  store float %add16.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %i.031, 5
  %idxprom7.5 = zext nneg i32 %inc.4 to i64
  %arrayidx8.5 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %r.coerce, i64 %idxprom7.5
  %16 = load float, ptr addrspace(1) %arrayidx8.5, align 4, !tbaa !18
  %mul9.5 = shl nuw nsw i32 %inc.4, 12
  %add10.5 = add nsw i32 %mul9.5, %add
  %idxprom11.5 = sext i32 %add10.5 to i64
  %arrayidx12.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom11.5
  %17 = load float, ptr addrspace(1) %arrayidx12.5, align 4, !tbaa !18
  %mul13.5 = fmul contract float %16, %17
  %add16.5 = fadd contract float %add16.4, %mul13.5
  store float %add16.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %i.031, 6
  %idxprom7.6 = zext nneg i32 %inc.5 to i64
  %arrayidx8.6 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %r.coerce, i64 %idxprom7.6
  %18 = load float, ptr addrspace(1) %arrayidx8.6, align 4, !tbaa !18
  %mul9.6 = shl nuw nsw i32 %inc.5, 12
  %add10.6 = add nsw i32 %mul9.6, %add
  %idxprom11.6 = sext i32 %add10.6 to i64
  %arrayidx12.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom11.6
  %19 = load float, ptr addrspace(1) %arrayidx12.6, align 4, !tbaa !18
  %mul13.6 = fmul contract float %18, %19
  %add16.6 = fadd contract float %add16.5, %mul13.6
  store float %add16.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %i.031, 7
  %idxprom7.7 = zext nneg i32 %inc.6 to i64
  %arrayidx8.7 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %r.coerce, i64 %idxprom7.7
  %20 = load float, ptr addrspace(1) %arrayidx8.7, align 4, !tbaa !18
  %mul9.7 = shl nuw nsw i32 %inc.6, 12
  %add10.7 = add nsw i32 %mul9.7, %add
  %idxprom11.7 = sext i32 %add10.7 to i64
  %arrayidx12.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom11.7
  %21 = load float, ptr addrspace(1) %arrayidx12.7, align 4, !tbaa !18
  %mul13.7 = fmul contract float %20, %21
  %add16.7 = fadd contract float %add16.6, %mul13.7
  store float %add16.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %i.031, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !20

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.preheader
  %add1632.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add16.7, %if.end.loopexit.unr-lcssa ]
  %i.031.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod33 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod33)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add1632.epil = phi float [ %add16.epil, %for.body.epil ], [ %add1632.epil.init, %for.body.epil.preheader ]
  %i.031.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %i.031.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %idxprom7.epil = zext nneg i32 %i.031.epil to i64
  %arrayidx8.epil = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %r.coerce, i64 %idxprom7.epil
  %22 = load float, ptr addrspace(1) %arrayidx8.epil, align 4, !tbaa !18
  %mul9.epil = shl nuw nsw i32 %i.031.epil, 12
  %add10.epil = add nsw i32 %mul9.epil, %add
  %idxprom11.epil = sext i32 %add10.epil to i64
  %arrayidx12.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom11.epil
  %23 = load float, ptr addrspace(1) %arrayidx12.epil, align 4, !tbaa !18
  %mul13.epil = fmul contract float %22, %23
  %add16.epil = fadd contract float %add1632.epil, %mul13.epil
  store float %add16.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %i.031.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !22

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z12bicg_kernel2iiPfS_S_(i32 noundef %nx, i32 noundef %ny, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %p.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %q.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i27 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i27
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %4
  %cmp = icmp slt i32 %add, %nx
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom
  store float 0.000000e+00, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %cmp630 = icmp sgt i32 %ny, 0
  br i1 %cmp630, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %if.then
  %mul7 = shl nsw i32 %add, 12
  %xtraiter = and i32 %ny, 7
  %5 = icmp ult i32 %ny, 8
  br i1 %5, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %ny, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %add1632 = phi float [ 0.000000e+00, %for.body.lr.ph.new ], [ %add16.7, %for.body ]
  %j.031 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.7, %for.body ]
  %add8 = add nsw i32 %j.031, %mul7
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom9
  %6 = load float, ptr addrspace(1) %arrayidx10, align 4, !tbaa !18
  %idxprom11 = zext nneg i32 %j.031 to i64
  %arrayidx12 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %p.coerce, i64 %idxprom11
  %7 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %mul13 = fmul contract float %6, %7
  %add16 = fadd contract float %add1632, %mul13
  store float %add16, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = or disjoint i32 %j.031, 1
  %add8.1 = add nsw i32 %inc, %mul7
  %idxprom9.1 = sext i32 %add8.1 to i64
  %arrayidx10.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom9.1
  %8 = load float, ptr addrspace(1) %arrayidx10.1, align 4, !tbaa !18
  %idxprom11.1 = zext nneg i32 %inc to i64
  %arrayidx12.1 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %p.coerce, i64 %idxprom11.1
  %9 = load float, ptr addrspace(1) %arrayidx12.1, align 4, !tbaa !18
  %mul13.1 = fmul contract float %8, %9
  %add16.1 = fadd contract float %add16, %mul13.1
  store float %add16.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %j.031, 2
  %add8.2 = add nsw i32 %inc.1, %mul7
  %idxprom9.2 = sext i32 %add8.2 to i64
  %arrayidx10.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom9.2
  %10 = load float, ptr addrspace(1) %arrayidx10.2, align 4, !tbaa !18
  %idxprom11.2 = zext nneg i32 %inc.1 to i64
  %arrayidx12.2 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %p.coerce, i64 %idxprom11.2
  %11 = load float, ptr addrspace(1) %arrayidx12.2, align 4, !tbaa !18
  %mul13.2 = fmul contract float %10, %11
  %add16.2 = fadd contract float %add16.1, %mul13.2
  store float %add16.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %j.031, 3
  %add8.3 = add nsw i32 %inc.2, %mul7
  %idxprom9.3 = sext i32 %add8.3 to i64
  %arrayidx10.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom9.3
  %12 = load float, ptr addrspace(1) %arrayidx10.3, align 4, !tbaa !18
  %idxprom11.3 = zext nneg i32 %inc.2 to i64
  %arrayidx12.3 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %p.coerce, i64 %idxprom11.3
  %13 = load float, ptr addrspace(1) %arrayidx12.3, align 4, !tbaa !18
  %mul13.3 = fmul contract float %12, %13
  %add16.3 = fadd contract float %add16.2, %mul13.3
  store float %add16.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %j.031, 4
  %add8.4 = add nsw i32 %inc.3, %mul7
  %idxprom9.4 = sext i32 %add8.4 to i64
  %arrayidx10.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom9.4
  %14 = load float, ptr addrspace(1) %arrayidx10.4, align 4, !tbaa !18
  %idxprom11.4 = zext nneg i32 %inc.3 to i64
  %arrayidx12.4 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %p.coerce, i64 %idxprom11.4
  %15 = load float, ptr addrspace(1) %arrayidx12.4, align 4, !tbaa !18
  %mul13.4 = fmul contract float %14, %15
  %add16.4 = fadd contract float %add16.3, %mul13.4
  store float %add16.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %j.031, 5
  %add8.5 = add nsw i32 %inc.4, %mul7
  %idxprom9.5 = sext i32 %add8.5 to i64
  %arrayidx10.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom9.5
  %16 = load float, ptr addrspace(1) %arrayidx10.5, align 4, !tbaa !18
  %idxprom11.5 = zext nneg i32 %inc.4 to i64
  %arrayidx12.5 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %p.coerce, i64 %idxprom11.5
  %17 = load float, ptr addrspace(1) %arrayidx12.5, align 4, !tbaa !18
  %mul13.5 = fmul contract float %16, %17
  %add16.5 = fadd contract float %add16.4, %mul13.5
  store float %add16.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %j.031, 6
  %add8.6 = add nsw i32 %inc.5, %mul7
  %idxprom9.6 = sext i32 %add8.6 to i64
  %arrayidx10.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom9.6
  %18 = load float, ptr addrspace(1) %arrayidx10.6, align 4, !tbaa !18
  %idxprom11.6 = zext nneg i32 %inc.5 to i64
  %arrayidx12.6 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %p.coerce, i64 %idxprom11.6
  %19 = load float, ptr addrspace(1) %arrayidx12.6, align 4, !tbaa !18
  %mul13.6 = fmul contract float %18, %19
  %add16.6 = fadd contract float %add16.5, %mul13.6
  store float %add16.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %j.031, 7
  %add8.7 = add nsw i32 %inc.6, %mul7
  %idxprom9.7 = sext i32 %add8.7 to i64
  %arrayidx10.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom9.7
  %20 = load float, ptr addrspace(1) %arrayidx10.7, align 4, !tbaa !18
  %idxprom11.7 = zext nneg i32 %inc.6 to i64
  %arrayidx12.7 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %p.coerce, i64 %idxprom11.7
  %21 = load float, ptr addrspace(1) %arrayidx12.7, align 4, !tbaa !18
  %mul13.7 = fmul contract float %20, %21
  %add16.7 = fadd contract float %add16.6, %mul13.7
  store float %add16.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %j.031, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !24

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.lr.ph
  %add1632.epil.init = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %add16.7, %if.end.loopexit.unr-lcssa ]
  %j.031.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.7, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod33 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod33)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add1632.epil = phi float [ %add1632.epil.init, %for.body.epil.preheader ], [ %add16.epil, %for.body.epil ]
  %j.031.epil = phi i32 [ %j.031.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %add8.epil = add nsw i32 %j.031.epil, %mul7
  %idxprom9.epil = sext i32 %add8.epil to i64
  %arrayidx10.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom9.epil
  %22 = load float, ptr addrspace(1) %arrayidx10.epil, align 4, !tbaa !18
  %idxprom11.epil = zext nneg i32 %j.031.epil to i64
  %arrayidx12.epil = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %p.coerce, i64 %idxprom11.epil
  %23 = load float, ptr addrspace(1) %arrayidx12.epil, align 4, !tbaa !18
  %mul13.epil = fmul contract float %22, %23
  %add16.epil = fadd contract float %add1632.epil, %mul13.epil
  store float %add16.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %j.031.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !25

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %if.then, %entry
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
