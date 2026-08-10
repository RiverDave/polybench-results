; ModuleID = '/root/polybenchGpu/HIP/3MM/3mm.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/3MM/3mm.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_2322fb05e49f7f52 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_2322fb05e49f7f52 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11mm3_kernel1iiiiiPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %B.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %E.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i45 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i45
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i54 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i51 = zext i16 %.in.i54 to i32
  %mul8 = mul i32 %4, %conv.i51
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add10 = add i32 %mul8, %6
  %cmp = icmp slt i32 %add10, %ni
  %cmp11 = icmp slt i32 %add, %nj
  %or.cond = and i1 %cmp11, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul12 = shl nsw i32 %add10, 9
  %add13 = add nsw i32 %mul12, %add
  %idxprom = sext i32 %add13 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %E.coerce, i64 %idxprom
  store float 0.000000e+00, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %cmp1455 = icmp sgt i32 %nk, 0
  br i1 %cmp1455, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %nk, 7
  %7 = icmp ult i32 %nk, 8
  br i1 %7, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %nk, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %add2857 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add28.7, %for.body ]
  %k.056 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %add16 = add nsw i32 %k.056, %mul12
  %idxprom17 = sext i32 %add16 to i64
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17
  %8 = load float, ptr addrspace(1) %arrayidx18, align 4, !tbaa !18
  %mul19 = shl nuw nsw i32 %k.056, 9
  %add20 = add nsw i32 %mul19, %add
  %idxprom21 = sext i32 %add20 to i64
  %arrayidx22 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom21
  %9 = load float, ptr addrspace(1) %arrayidx22, align 4, !tbaa !18
  %mul23 = fmul contract float %8, %9
  %add28 = fadd contract float %add2857, %mul23
  store float %add28, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = or disjoint i32 %k.056, 1
  %add16.1 = add nsw i32 %inc, %mul12
  %idxprom17.1 = sext i32 %add16.1 to i64
  %arrayidx18.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.1
  %10 = load float, ptr addrspace(1) %arrayidx18.1, align 4, !tbaa !18
  %mul19.1 = shl nuw nsw i32 %inc, 9
  %add20.1 = add nsw i32 %mul19.1, %add
  %idxprom21.1 = sext i32 %add20.1 to i64
  %arrayidx22.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom21.1
  %11 = load float, ptr addrspace(1) %arrayidx22.1, align 4, !tbaa !18
  %mul23.1 = fmul contract float %10, %11
  %add28.1 = fadd contract float %add28, %mul23.1
  store float %add28.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %k.056, 2
  %add16.2 = add nsw i32 %inc.1, %mul12
  %idxprom17.2 = sext i32 %add16.2 to i64
  %arrayidx18.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.2
  %12 = load float, ptr addrspace(1) %arrayidx18.2, align 4, !tbaa !18
  %mul19.2 = shl nuw nsw i32 %inc.1, 9
  %add20.2 = add nsw i32 %mul19.2, %add
  %idxprom21.2 = sext i32 %add20.2 to i64
  %arrayidx22.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom21.2
  %13 = load float, ptr addrspace(1) %arrayidx22.2, align 4, !tbaa !18
  %mul23.2 = fmul contract float %12, %13
  %add28.2 = fadd contract float %add28.1, %mul23.2
  store float %add28.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %k.056, 3
  %add16.3 = add nsw i32 %inc.2, %mul12
  %idxprom17.3 = sext i32 %add16.3 to i64
  %arrayidx18.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.3
  %14 = load float, ptr addrspace(1) %arrayidx18.3, align 4, !tbaa !18
  %mul19.3 = shl nuw nsw i32 %inc.2, 9
  %add20.3 = add nsw i32 %mul19.3, %add
  %idxprom21.3 = sext i32 %add20.3 to i64
  %arrayidx22.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom21.3
  %15 = load float, ptr addrspace(1) %arrayidx22.3, align 4, !tbaa !18
  %mul23.3 = fmul contract float %14, %15
  %add28.3 = fadd contract float %add28.2, %mul23.3
  store float %add28.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %k.056, 4
  %add16.4 = add nsw i32 %inc.3, %mul12
  %idxprom17.4 = sext i32 %add16.4 to i64
  %arrayidx18.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.4
  %16 = load float, ptr addrspace(1) %arrayidx18.4, align 4, !tbaa !18
  %mul19.4 = shl nuw nsw i32 %inc.3, 9
  %add20.4 = add nsw i32 %mul19.4, %add
  %idxprom21.4 = sext i32 %add20.4 to i64
  %arrayidx22.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom21.4
  %17 = load float, ptr addrspace(1) %arrayidx22.4, align 4, !tbaa !18
  %mul23.4 = fmul contract float %16, %17
  %add28.4 = fadd contract float %add28.3, %mul23.4
  store float %add28.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %k.056, 5
  %add16.5 = add nsw i32 %inc.4, %mul12
  %idxprom17.5 = sext i32 %add16.5 to i64
  %arrayidx18.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.5
  %18 = load float, ptr addrspace(1) %arrayidx18.5, align 4, !tbaa !18
  %mul19.5 = shl nuw nsw i32 %inc.4, 9
  %add20.5 = add nsw i32 %mul19.5, %add
  %idxprom21.5 = sext i32 %add20.5 to i64
  %arrayidx22.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom21.5
  %19 = load float, ptr addrspace(1) %arrayidx22.5, align 4, !tbaa !18
  %mul23.5 = fmul contract float %18, %19
  %add28.5 = fadd contract float %add28.4, %mul23.5
  store float %add28.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %k.056, 6
  %add16.6 = add nsw i32 %inc.5, %mul12
  %idxprom17.6 = sext i32 %add16.6 to i64
  %arrayidx18.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.6
  %20 = load float, ptr addrspace(1) %arrayidx18.6, align 4, !tbaa !18
  %mul19.6 = shl nuw nsw i32 %inc.5, 9
  %add20.6 = add nsw i32 %mul19.6, %add
  %idxprom21.6 = sext i32 %add20.6 to i64
  %arrayidx22.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom21.6
  %21 = load float, ptr addrspace(1) %arrayidx22.6, align 4, !tbaa !18
  %mul23.6 = fmul contract float %20, %21
  %add28.6 = fadd contract float %add28.5, %mul23.6
  store float %add28.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %k.056, 7
  %add16.7 = add nsw i32 %inc.6, %mul12
  %idxprom17.7 = sext i32 %add16.7 to i64
  %arrayidx18.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.7
  %22 = load float, ptr addrspace(1) %arrayidx18.7, align 4, !tbaa !18
  %mul19.7 = shl nuw nsw i32 %inc.6, 9
  %add20.7 = add nsw i32 %mul19.7, %add
  %idxprom21.7 = sext i32 %add20.7 to i64
  %arrayidx22.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom21.7
  %23 = load float, ptr addrspace(1) %arrayidx22.7, align 4, !tbaa !18
  %mul23.7 = fmul contract float %22, %23
  %add28.7 = fadd contract float %add28.6, %mul23.7
  store float %add28.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %k.056, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !20

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.preheader
  %add2857.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add28.7, %if.end.loopexit.unr-lcssa ]
  %k.056.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod58 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod58)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add2857.epil = phi float [ %add28.epil, %for.body.epil ], [ %add2857.epil.init, %for.body.epil.preheader ]
  %k.056.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %k.056.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %add16.epil = add nsw i32 %k.056.epil, %mul12
  %idxprom17.epil = sext i32 %add16.epil to i64
  %arrayidx18.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.epil
  %24 = load float, ptr addrspace(1) %arrayidx18.epil, align 4, !tbaa !18
  %mul19.epil = shl nuw nsw i32 %k.056.epil, 9
  %add20.epil = add nsw i32 %mul19.epil, %add
  %idxprom21.epil = sext i32 %add20.epil to i64
  %arrayidx22.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom21.epil
  %25 = load float, ptr addrspace(1) %arrayidx22.epil, align 4, !tbaa !18
  %mul23.epil = fmul contract float %24, %25
  %add28.epil = fadd contract float %add2857.epil, %mul23.epil
  store float %add28.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %k.056.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !22

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11mm3_kernel2iiiiiPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr addrspace(1) nofree noundef readonly captures(none) %C.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %D.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %F.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i45 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i45
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i54 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i51 = zext i16 %.in.i54 to i32
  %mul8 = mul i32 %4, %conv.i51
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add10 = add i32 %mul8, %6
  %cmp = icmp slt i32 %add10, %nj
  %cmp11 = icmp slt i32 %add, %nl
  %or.cond = and i1 %cmp11, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul12 = shl nsw i32 %add10, 9
  %add13 = add nsw i32 %mul12, %add
  %idxprom = sext i32 %add13 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %F.coerce, i64 %idxprom
  store float 0.000000e+00, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %cmp1455 = icmp sgt i32 %nm, 0
  br i1 %cmp1455, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %nm, 7
  %7 = icmp ult i32 %nm, 8
  br i1 %7, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %nm, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %add2857 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add28.7, %for.body ]
  %k.056 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %add16 = add nsw i32 %k.056, %mul12
  %idxprom17 = sext i32 %add16 to i64
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom17
  %8 = load float, ptr addrspace(1) %arrayidx18, align 4, !tbaa !18
  %mul19 = shl nuw nsw i32 %k.056, 9
  %add20 = add nsw i32 %mul19, %add
  %idxprom21 = sext i32 %add20 to i64
  %arrayidx22 = getelementptr inbounds [4 x i8], ptr addrspace(1) %D.coerce, i64 %idxprom21
  %9 = load float, ptr addrspace(1) %arrayidx22, align 4, !tbaa !18
  %mul23 = fmul contract float %8, %9
  %add28 = fadd contract float %add2857, %mul23
  store float %add28, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = or disjoint i32 %k.056, 1
  %add16.1 = add nsw i32 %inc, %mul12
  %idxprom17.1 = sext i32 %add16.1 to i64
  %arrayidx18.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom17.1
  %10 = load float, ptr addrspace(1) %arrayidx18.1, align 4, !tbaa !18
  %mul19.1 = shl nuw nsw i32 %inc, 9
  %add20.1 = add nsw i32 %mul19.1, %add
  %idxprom21.1 = sext i32 %add20.1 to i64
  %arrayidx22.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %D.coerce, i64 %idxprom21.1
  %11 = load float, ptr addrspace(1) %arrayidx22.1, align 4, !tbaa !18
  %mul23.1 = fmul contract float %10, %11
  %add28.1 = fadd contract float %add28, %mul23.1
  store float %add28.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %k.056, 2
  %add16.2 = add nsw i32 %inc.1, %mul12
  %idxprom17.2 = sext i32 %add16.2 to i64
  %arrayidx18.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom17.2
  %12 = load float, ptr addrspace(1) %arrayidx18.2, align 4, !tbaa !18
  %mul19.2 = shl nuw nsw i32 %inc.1, 9
  %add20.2 = add nsw i32 %mul19.2, %add
  %idxprom21.2 = sext i32 %add20.2 to i64
  %arrayidx22.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %D.coerce, i64 %idxprom21.2
  %13 = load float, ptr addrspace(1) %arrayidx22.2, align 4, !tbaa !18
  %mul23.2 = fmul contract float %12, %13
  %add28.2 = fadd contract float %add28.1, %mul23.2
  store float %add28.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %k.056, 3
  %add16.3 = add nsw i32 %inc.2, %mul12
  %idxprom17.3 = sext i32 %add16.3 to i64
  %arrayidx18.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom17.3
  %14 = load float, ptr addrspace(1) %arrayidx18.3, align 4, !tbaa !18
  %mul19.3 = shl nuw nsw i32 %inc.2, 9
  %add20.3 = add nsw i32 %mul19.3, %add
  %idxprom21.3 = sext i32 %add20.3 to i64
  %arrayidx22.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %D.coerce, i64 %idxprom21.3
  %15 = load float, ptr addrspace(1) %arrayidx22.3, align 4, !tbaa !18
  %mul23.3 = fmul contract float %14, %15
  %add28.3 = fadd contract float %add28.2, %mul23.3
  store float %add28.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %k.056, 4
  %add16.4 = add nsw i32 %inc.3, %mul12
  %idxprom17.4 = sext i32 %add16.4 to i64
  %arrayidx18.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom17.4
  %16 = load float, ptr addrspace(1) %arrayidx18.4, align 4, !tbaa !18
  %mul19.4 = shl nuw nsw i32 %inc.3, 9
  %add20.4 = add nsw i32 %mul19.4, %add
  %idxprom21.4 = sext i32 %add20.4 to i64
  %arrayidx22.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %D.coerce, i64 %idxprom21.4
  %17 = load float, ptr addrspace(1) %arrayidx22.4, align 4, !tbaa !18
  %mul23.4 = fmul contract float %16, %17
  %add28.4 = fadd contract float %add28.3, %mul23.4
  store float %add28.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %k.056, 5
  %add16.5 = add nsw i32 %inc.4, %mul12
  %idxprom17.5 = sext i32 %add16.5 to i64
  %arrayidx18.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom17.5
  %18 = load float, ptr addrspace(1) %arrayidx18.5, align 4, !tbaa !18
  %mul19.5 = shl nuw nsw i32 %inc.4, 9
  %add20.5 = add nsw i32 %mul19.5, %add
  %idxprom21.5 = sext i32 %add20.5 to i64
  %arrayidx22.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %D.coerce, i64 %idxprom21.5
  %19 = load float, ptr addrspace(1) %arrayidx22.5, align 4, !tbaa !18
  %mul23.5 = fmul contract float %18, %19
  %add28.5 = fadd contract float %add28.4, %mul23.5
  store float %add28.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %k.056, 6
  %add16.6 = add nsw i32 %inc.5, %mul12
  %idxprom17.6 = sext i32 %add16.6 to i64
  %arrayidx18.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom17.6
  %20 = load float, ptr addrspace(1) %arrayidx18.6, align 4, !tbaa !18
  %mul19.6 = shl nuw nsw i32 %inc.5, 9
  %add20.6 = add nsw i32 %mul19.6, %add
  %idxprom21.6 = sext i32 %add20.6 to i64
  %arrayidx22.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %D.coerce, i64 %idxprom21.6
  %21 = load float, ptr addrspace(1) %arrayidx22.6, align 4, !tbaa !18
  %mul23.6 = fmul contract float %20, %21
  %add28.6 = fadd contract float %add28.5, %mul23.6
  store float %add28.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %k.056, 7
  %add16.7 = add nsw i32 %inc.6, %mul12
  %idxprom17.7 = sext i32 %add16.7 to i64
  %arrayidx18.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom17.7
  %22 = load float, ptr addrspace(1) %arrayidx18.7, align 4, !tbaa !18
  %mul19.7 = shl nuw nsw i32 %inc.6, 9
  %add20.7 = add nsw i32 %mul19.7, %add
  %idxprom21.7 = sext i32 %add20.7 to i64
  %arrayidx22.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %D.coerce, i64 %idxprom21.7
  %23 = load float, ptr addrspace(1) %arrayidx22.7, align 4, !tbaa !18
  %mul23.7 = fmul contract float %22, %23
  %add28.7 = fadd contract float %add28.6, %mul23.7
  store float %add28.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %k.056, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !24

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.preheader
  %add2857.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add28.7, %if.end.loopexit.unr-lcssa ]
  %k.056.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod58 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod58)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add2857.epil = phi float [ %add28.epil, %for.body.epil ], [ %add2857.epil.init, %for.body.epil.preheader ]
  %k.056.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %k.056.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %add16.epil = add nsw i32 %k.056.epil, %mul12
  %idxprom17.epil = sext i32 %add16.epil to i64
  %arrayidx18.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom17.epil
  %24 = load float, ptr addrspace(1) %arrayidx18.epil, align 4, !tbaa !18
  %mul19.epil = shl nuw nsw i32 %k.056.epil, 9
  %add20.epil = add nsw i32 %mul19.epil, %add
  %idxprom21.epil = sext i32 %add20.epil to i64
  %arrayidx22.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %D.coerce, i64 %idxprom21.epil
  %25 = load float, ptr addrspace(1) %arrayidx22.epil, align 4, !tbaa !18
  %mul23.epil = fmul contract float %24, %25
  %add28.epil = fadd contract float %add2857.epil, %mul23.epil
  store float %add28.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %k.056.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !25

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11mm3_kernel3iiiiiPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr addrspace(1) nofree noundef readonly captures(none) %E.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %F.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %G.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i45 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i45
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i54 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i51 = zext i16 %.in.i54 to i32
  %mul8 = mul i32 %4, %conv.i51
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add10 = add i32 %mul8, %6
  %cmp = icmp slt i32 %add10, %ni
  %cmp11 = icmp slt i32 %add, %nl
  %or.cond = and i1 %cmp11, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul12 = shl nsw i32 %add10, 9
  %add13 = add nsw i32 %mul12, %add
  %idxprom = sext i32 %add13 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %G.coerce, i64 %idxprom
  store float 0.000000e+00, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %cmp1455 = icmp sgt i32 %nj, 0
  br i1 %cmp1455, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %nj, 7
  %7 = icmp ult i32 %nj, 8
  br i1 %7, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %nj, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %add2857 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add28.7, %for.body ]
  %k.056 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %add16 = add nsw i32 %k.056, %mul12
  %idxprom17 = sext i32 %add16 to i64
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr addrspace(1) %E.coerce, i64 %idxprom17
  %8 = load float, ptr addrspace(1) %arrayidx18, align 4, !tbaa !18
  %mul19 = shl nuw nsw i32 %k.056, 9
  %add20 = add nsw i32 %mul19, %add
  %idxprom21 = sext i32 %add20 to i64
  %arrayidx22 = getelementptr inbounds [4 x i8], ptr addrspace(1) %F.coerce, i64 %idxprom21
  %9 = load float, ptr addrspace(1) %arrayidx22, align 4, !tbaa !18
  %mul23 = fmul contract float %8, %9
  %add28 = fadd contract float %add2857, %mul23
  store float %add28, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = or disjoint i32 %k.056, 1
  %add16.1 = add nsw i32 %inc, %mul12
  %idxprom17.1 = sext i32 %add16.1 to i64
  %arrayidx18.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %E.coerce, i64 %idxprom17.1
  %10 = load float, ptr addrspace(1) %arrayidx18.1, align 4, !tbaa !18
  %mul19.1 = shl nuw nsw i32 %inc, 9
  %add20.1 = add nsw i32 %mul19.1, %add
  %idxprom21.1 = sext i32 %add20.1 to i64
  %arrayidx22.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %F.coerce, i64 %idxprom21.1
  %11 = load float, ptr addrspace(1) %arrayidx22.1, align 4, !tbaa !18
  %mul23.1 = fmul contract float %10, %11
  %add28.1 = fadd contract float %add28, %mul23.1
  store float %add28.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %k.056, 2
  %add16.2 = add nsw i32 %inc.1, %mul12
  %idxprom17.2 = sext i32 %add16.2 to i64
  %arrayidx18.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %E.coerce, i64 %idxprom17.2
  %12 = load float, ptr addrspace(1) %arrayidx18.2, align 4, !tbaa !18
  %mul19.2 = shl nuw nsw i32 %inc.1, 9
  %add20.2 = add nsw i32 %mul19.2, %add
  %idxprom21.2 = sext i32 %add20.2 to i64
  %arrayidx22.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %F.coerce, i64 %idxprom21.2
  %13 = load float, ptr addrspace(1) %arrayidx22.2, align 4, !tbaa !18
  %mul23.2 = fmul contract float %12, %13
  %add28.2 = fadd contract float %add28.1, %mul23.2
  store float %add28.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %k.056, 3
  %add16.3 = add nsw i32 %inc.2, %mul12
  %idxprom17.3 = sext i32 %add16.3 to i64
  %arrayidx18.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %E.coerce, i64 %idxprom17.3
  %14 = load float, ptr addrspace(1) %arrayidx18.3, align 4, !tbaa !18
  %mul19.3 = shl nuw nsw i32 %inc.2, 9
  %add20.3 = add nsw i32 %mul19.3, %add
  %idxprom21.3 = sext i32 %add20.3 to i64
  %arrayidx22.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %F.coerce, i64 %idxprom21.3
  %15 = load float, ptr addrspace(1) %arrayidx22.3, align 4, !tbaa !18
  %mul23.3 = fmul contract float %14, %15
  %add28.3 = fadd contract float %add28.2, %mul23.3
  store float %add28.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %k.056, 4
  %add16.4 = add nsw i32 %inc.3, %mul12
  %idxprom17.4 = sext i32 %add16.4 to i64
  %arrayidx18.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %E.coerce, i64 %idxprom17.4
  %16 = load float, ptr addrspace(1) %arrayidx18.4, align 4, !tbaa !18
  %mul19.4 = shl nuw nsw i32 %inc.3, 9
  %add20.4 = add nsw i32 %mul19.4, %add
  %idxprom21.4 = sext i32 %add20.4 to i64
  %arrayidx22.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %F.coerce, i64 %idxprom21.4
  %17 = load float, ptr addrspace(1) %arrayidx22.4, align 4, !tbaa !18
  %mul23.4 = fmul contract float %16, %17
  %add28.4 = fadd contract float %add28.3, %mul23.4
  store float %add28.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %k.056, 5
  %add16.5 = add nsw i32 %inc.4, %mul12
  %idxprom17.5 = sext i32 %add16.5 to i64
  %arrayidx18.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %E.coerce, i64 %idxprom17.5
  %18 = load float, ptr addrspace(1) %arrayidx18.5, align 4, !tbaa !18
  %mul19.5 = shl nuw nsw i32 %inc.4, 9
  %add20.5 = add nsw i32 %mul19.5, %add
  %idxprom21.5 = sext i32 %add20.5 to i64
  %arrayidx22.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %F.coerce, i64 %idxprom21.5
  %19 = load float, ptr addrspace(1) %arrayidx22.5, align 4, !tbaa !18
  %mul23.5 = fmul contract float %18, %19
  %add28.5 = fadd contract float %add28.4, %mul23.5
  store float %add28.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %k.056, 6
  %add16.6 = add nsw i32 %inc.5, %mul12
  %idxprom17.6 = sext i32 %add16.6 to i64
  %arrayidx18.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %E.coerce, i64 %idxprom17.6
  %20 = load float, ptr addrspace(1) %arrayidx18.6, align 4, !tbaa !18
  %mul19.6 = shl nuw nsw i32 %inc.5, 9
  %add20.6 = add nsw i32 %mul19.6, %add
  %idxprom21.6 = sext i32 %add20.6 to i64
  %arrayidx22.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %F.coerce, i64 %idxprom21.6
  %21 = load float, ptr addrspace(1) %arrayidx22.6, align 4, !tbaa !18
  %mul23.6 = fmul contract float %20, %21
  %add28.6 = fadd contract float %add28.5, %mul23.6
  store float %add28.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %k.056, 7
  %add16.7 = add nsw i32 %inc.6, %mul12
  %idxprom17.7 = sext i32 %add16.7 to i64
  %arrayidx18.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %E.coerce, i64 %idxprom17.7
  %22 = load float, ptr addrspace(1) %arrayidx18.7, align 4, !tbaa !18
  %mul19.7 = shl nuw nsw i32 %inc.6, 9
  %add20.7 = add nsw i32 %mul19.7, %add
  %idxprom21.7 = sext i32 %add20.7 to i64
  %arrayidx22.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %F.coerce, i64 %idxprom21.7
  %23 = load float, ptr addrspace(1) %arrayidx22.7, align 4, !tbaa !18
  %mul23.7 = fmul contract float %22, %23
  %add28.7 = fadd contract float %add28.6, %mul23.7
  store float %add28.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %k.056, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !26

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.preheader
  %add2857.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add28.7, %if.end.loopexit.unr-lcssa ]
  %k.056.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod58 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod58)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add2857.epil = phi float [ %add28.epil, %for.body.epil ], [ %add2857.epil.init, %for.body.epil.preheader ]
  %k.056.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %k.056.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %add16.epil = add nsw i32 %k.056.epil, %mul12
  %idxprom17.epil = sext i32 %add16.epil to i64
  %arrayidx18.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %E.coerce, i64 %idxprom17.epil
  %24 = load float, ptr addrspace(1) %arrayidx18.epil, align 4, !tbaa !18
  %mul19.epil = shl nuw nsw i32 %k.056.epil, 9
  %add20.epil = add nsw i32 %mul19.epil, %add
  %idxprom21.epil = sext i32 %add20.epil to i64
  %arrayidx22.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %F.coerce, i64 %idxprom21.epil
  %25 = load float, ptr addrspace(1) %arrayidx22.epil, align 4, !tbaa !18
  %mul23.epil = fmul contract float %24, %25
  %add28.epil = fadd contract float %add2857.epil, %mul23.epil
  store float %add28.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %k.056.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !27

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
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
!26 = distinct !{!26, !21}
!27 = distinct !{!27, !23}
