; ModuleID = '/root/polybenchGpu/HIP/GESUMMV/gesummv.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/GESUMMV/gesummv.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_b8a58297322fe8c9 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_b8a58297322fe8c9 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z14gesummv_kerneliffPfS_S_S_S_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %B.coerce, ptr addrspace(1) nofree noundef captures(none) %tmp.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %x.coerce, ptr addrspace(1) nofree noundef captures(none) %y.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i56 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i56
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %4
  %cmp = icmp slt i32 %add, %n
  br i1 %cmp, label %for.cond.preheader, label %if.end

for.cond.preheader:                               ; preds = %entry
  %cmp859 = icmp sgt i32 %n, 0
  br i1 %cmp859, label %for.body.lr.ph, label %for.cond.preheader.for.end_crit_edge

for.cond.preheader.for.end_crit_edge:             ; preds = %for.cond.preheader
  %idxprom27.phi.trans.insert = sext i32 %add to i64
  %arrayidx31.phi.trans.insert = getelementptr inbounds [4 x i8], ptr addrspace(1) %y.coerce, i64 %idxprom27.phi.trans.insert
  %.pre = load float, ptr addrspace(1) %arrayidx31.phi.trans.insert, align 4, !tbaa !18
  br label %for.end

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %mul9 = shl nsw i32 %add, 12
  %idxprom14 = sext i32 %add to i64
  %arrayidx15 = getelementptr inbounds [4 x i8], ptr addrspace(1) %tmp.coerce, i64 %idxprom14
  %arrayidx25 = getelementptr inbounds [4 x i8], ptr addrspace(1) %y.coerce, i64 %idxprom14
  %xtraiter = and i32 %n, 7
  %5 = icmp ult i32 %n, 8
  br i1 %5, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %n, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %j.060 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.7, %for.body ]
  %add10 = add nsw i32 %j.060, %mul9
  %idxprom = sext i32 %add10 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom
  %6 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %idxprom11 = zext nneg i32 %j.060 to i64
  %arrayidx12 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11
  %7 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %mul13 = fmul contract float %6, %7
  %8 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %add16 = fadd contract float %8, %mul13
  store float %add16, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %arrayidx20 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom
  %9 = load float, ptr addrspace(1) %arrayidx20, align 4, !tbaa !18
  %10 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %mul23 = fmul contract float %9, %10
  %11 = load float, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %add26 = fadd contract float %11, %mul23
  store float %add26, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %inc = or disjoint i32 %j.060, 1
  %add10.1 = add nsw i32 %inc, %mul9
  %idxprom.1 = sext i32 %add10.1 to i64
  %arrayidx.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.1
  %12 = load float, ptr addrspace(1) %arrayidx.1, align 4, !tbaa !18
  %idxprom11.1 = zext nneg i32 %inc to i64
  %arrayidx12.1 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.1
  %13 = load float, ptr addrspace(1) %arrayidx12.1, align 4, !tbaa !18
  %mul13.1 = fmul contract float %12, %13
  %14 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %add16.1 = fadd contract float %14, %mul13.1
  store float %add16.1, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %arrayidx20.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.1
  %15 = load float, ptr addrspace(1) %arrayidx20.1, align 4, !tbaa !18
  %16 = load float, ptr addrspace(1) %arrayidx12.1, align 4, !tbaa !18
  %mul23.1 = fmul contract float %15, %16
  %17 = load float, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %add26.1 = fadd contract float %17, %mul23.1
  store float %add26.1, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %j.060, 2
  %add10.2 = add nsw i32 %inc.1, %mul9
  %idxprom.2 = sext i32 %add10.2 to i64
  %arrayidx.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.2
  %18 = load float, ptr addrspace(1) %arrayidx.2, align 4, !tbaa !18
  %idxprom11.2 = zext nneg i32 %inc.1 to i64
  %arrayidx12.2 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.2
  %19 = load float, ptr addrspace(1) %arrayidx12.2, align 4, !tbaa !18
  %mul13.2 = fmul contract float %18, %19
  %20 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %add16.2 = fadd contract float %20, %mul13.2
  store float %add16.2, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %arrayidx20.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.2
  %21 = load float, ptr addrspace(1) %arrayidx20.2, align 4, !tbaa !18
  %22 = load float, ptr addrspace(1) %arrayidx12.2, align 4, !tbaa !18
  %mul23.2 = fmul contract float %21, %22
  %23 = load float, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %add26.2 = fadd contract float %23, %mul23.2
  store float %add26.2, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %j.060, 3
  %add10.3 = add nsw i32 %inc.2, %mul9
  %idxprom.3 = sext i32 %add10.3 to i64
  %arrayidx.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.3
  %24 = load float, ptr addrspace(1) %arrayidx.3, align 4, !tbaa !18
  %idxprom11.3 = zext nneg i32 %inc.2 to i64
  %arrayidx12.3 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.3
  %25 = load float, ptr addrspace(1) %arrayidx12.3, align 4, !tbaa !18
  %mul13.3 = fmul contract float %24, %25
  %26 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %add16.3 = fadd contract float %26, %mul13.3
  store float %add16.3, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %arrayidx20.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.3
  %27 = load float, ptr addrspace(1) %arrayidx20.3, align 4, !tbaa !18
  %28 = load float, ptr addrspace(1) %arrayidx12.3, align 4, !tbaa !18
  %mul23.3 = fmul contract float %27, %28
  %29 = load float, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %add26.3 = fadd contract float %29, %mul23.3
  store float %add26.3, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %j.060, 4
  %add10.4 = add nsw i32 %inc.3, %mul9
  %idxprom.4 = sext i32 %add10.4 to i64
  %arrayidx.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.4
  %30 = load float, ptr addrspace(1) %arrayidx.4, align 4, !tbaa !18
  %idxprom11.4 = zext nneg i32 %inc.3 to i64
  %arrayidx12.4 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.4
  %31 = load float, ptr addrspace(1) %arrayidx12.4, align 4, !tbaa !18
  %mul13.4 = fmul contract float %30, %31
  %32 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %add16.4 = fadd contract float %32, %mul13.4
  store float %add16.4, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %arrayidx20.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.4
  %33 = load float, ptr addrspace(1) %arrayidx20.4, align 4, !tbaa !18
  %34 = load float, ptr addrspace(1) %arrayidx12.4, align 4, !tbaa !18
  %mul23.4 = fmul contract float %33, %34
  %35 = load float, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %add26.4 = fadd contract float %35, %mul23.4
  store float %add26.4, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %j.060, 5
  %add10.5 = add nsw i32 %inc.4, %mul9
  %idxprom.5 = sext i32 %add10.5 to i64
  %arrayidx.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.5
  %36 = load float, ptr addrspace(1) %arrayidx.5, align 4, !tbaa !18
  %idxprom11.5 = zext nneg i32 %inc.4 to i64
  %arrayidx12.5 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.5
  %37 = load float, ptr addrspace(1) %arrayidx12.5, align 4, !tbaa !18
  %mul13.5 = fmul contract float %36, %37
  %38 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %add16.5 = fadd contract float %38, %mul13.5
  store float %add16.5, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %arrayidx20.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.5
  %39 = load float, ptr addrspace(1) %arrayidx20.5, align 4, !tbaa !18
  %40 = load float, ptr addrspace(1) %arrayidx12.5, align 4, !tbaa !18
  %mul23.5 = fmul contract float %39, %40
  %41 = load float, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %add26.5 = fadd contract float %41, %mul23.5
  store float %add26.5, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %j.060, 6
  %add10.6 = add nsw i32 %inc.5, %mul9
  %idxprom.6 = sext i32 %add10.6 to i64
  %arrayidx.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.6
  %42 = load float, ptr addrspace(1) %arrayidx.6, align 4, !tbaa !18
  %idxprom11.6 = zext nneg i32 %inc.5 to i64
  %arrayidx12.6 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.6
  %43 = load float, ptr addrspace(1) %arrayidx12.6, align 4, !tbaa !18
  %mul13.6 = fmul contract float %42, %43
  %44 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %add16.6 = fadd contract float %44, %mul13.6
  store float %add16.6, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %arrayidx20.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.6
  %45 = load float, ptr addrspace(1) %arrayidx20.6, align 4, !tbaa !18
  %46 = load float, ptr addrspace(1) %arrayidx12.6, align 4, !tbaa !18
  %mul23.6 = fmul contract float %45, %46
  %47 = load float, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %add26.6 = fadd contract float %47, %mul23.6
  store float %add26.6, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %j.060, 7
  %add10.7 = add nsw i32 %inc.6, %mul9
  %idxprom.7 = sext i32 %add10.7 to i64
  %arrayidx.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.7
  %48 = load float, ptr addrspace(1) %arrayidx.7, align 4, !tbaa !18
  %idxprom11.7 = zext nneg i32 %inc.6 to i64
  %arrayidx12.7 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.7
  %49 = load float, ptr addrspace(1) %arrayidx12.7, align 4, !tbaa !18
  %mul13.7 = fmul contract float %48, %49
  %50 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %add16.7 = fadd contract float %50, %mul13.7
  store float %add16.7, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %arrayidx20.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.7
  %51 = load float, ptr addrspace(1) %arrayidx20.7, align 4, !tbaa !18
  %52 = load float, ptr addrspace(1) %arrayidx12.7, align 4, !tbaa !18
  %mul23.7 = fmul contract float %51, %52
  %53 = load float, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %add26.7 = fadd contract float %53, %mul23.7
  store float %add26.7, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %j.060, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !20

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.lr.ph
  %j.060.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.7, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod62 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod62)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %j.060.epil = phi i32 [ %j.060.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %add10.epil = add nsw i32 %j.060.epil, %mul9
  %idxprom.epil = sext i32 %add10.epil to i64
  %arrayidx.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.epil
  %54 = load float, ptr addrspace(1) %arrayidx.epil, align 4, !tbaa !18
  %idxprom11.epil = zext nneg i32 %j.060.epil to i64
  %arrayidx12.epil = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %x.coerce, i64 %idxprom11.epil
  %55 = load float, ptr addrspace(1) %arrayidx12.epil, align 4, !tbaa !18
  %mul13.epil = fmul contract float %54, %55
  %56 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %add16.epil = fadd contract float %56, %mul13.epil
  store float %add16.epil, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %arrayidx20.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.epil
  %57 = load float, ptr addrspace(1) %arrayidx20.epil, align 4, !tbaa !18
  %58 = load float, ptr addrspace(1) %arrayidx12.epil, align 4, !tbaa !18
  %mul23.epil = fmul contract float %57, %58
  %59 = load float, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %add26.epil = fadd contract float %59, %mul23.epil
  store float %add26.epil, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %j.060.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body.epil, !llvm.loop !22

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil, %for.cond.preheader.for.end_crit_edge
  %idxprom27.pre-phi = phi i64 [ %idxprom27.phi.trans.insert, %for.cond.preheader.for.end_crit_edge ], [ %idxprom14, %for.body.epil ], [ %idxprom14, %for.end.loopexit.unr-lcssa ]
  %60 = phi float [ %.pre, %for.cond.preheader.for.end_crit_edge ], [ %add26.7, %for.end.loopexit.unr-lcssa ], [ %add26.epil, %for.body.epil ]
  %arrayidx28 = getelementptr inbounds [4 x i8], ptr addrspace(1) %tmp.coerce, i64 %idxprom27.pre-phi
  %61 = load float, ptr addrspace(1) %arrayidx28, align 4, !tbaa !18
  %mul29 = fmul contract float %alpha, %61
  %arrayidx31 = getelementptr inbounds [4 x i8], ptr addrspace(1) %y.coerce, i64 %idxprom27.pre-phi
  %mul32 = fmul contract float %beta, %60
  %add33 = fadd contract float %mul29, %mul32
  store float %add33, ptr addrspace(1) %arrayidx31, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
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
