; ModuleID = '/root/polybenchGpu/HIP/2MM/2mm.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/2MM/2mm.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_1b860aa85a8105e0 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_1b860aa85a8105e0 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11mm2_kernel1iiiiffPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, float noundef %alpha, float noundef %beta, ptr addrspace(1) nofree noundef writeonly captures(none) %tmp.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %B.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i46 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i46
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i55 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i52 = zext i16 %.in.i55 to i32
  %mul8 = mul i32 %4, %conv.i52
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add10 = add i32 %mul8, %6
  %cmp = icmp slt i32 %add10, %ni
  %cmp11 = icmp slt i32 %add, %nj
  %or.cond = and i1 %cmp11, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul12 = shl nsw i32 %add10, 10
  %add13 = add nsw i32 %mul12, %add
  %idxprom = sext i32 %add13 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %tmp.coerce, i64 %idxprom
  store float 0.000000e+00, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %cmp1456 = icmp sgt i32 %nk, 0
  br i1 %cmp1456, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %nk, 7
  %7 = icmp ult i32 %nk, 8
  br i1 %7, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %nk, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %add2958 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add29.7, %for.body ]
  %k.057 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %add16 = add nsw i32 %k.057, %mul12
  %idxprom17 = sext i32 %add16 to i64
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17
  %8 = load float, ptr addrspace(1) %arrayidx18, align 4, !tbaa !18
  %mul19 = fmul contract float %alpha, %8
  %mul20 = shl nuw nsw i32 %k.057, 10
  %add21 = add nsw i32 %mul20, %add
  %idxprom22 = sext i32 %add21 to i64
  %arrayidx23 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom22
  %9 = load float, ptr addrspace(1) %arrayidx23, align 4, !tbaa !18
  %mul24 = fmul contract float %mul19, %9
  %add29 = fadd contract float %add2958, %mul24
  store float %add29, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = or disjoint i32 %k.057, 1
  %add16.1 = add nsw i32 %inc, %mul12
  %idxprom17.1 = sext i32 %add16.1 to i64
  %arrayidx18.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.1
  %10 = load float, ptr addrspace(1) %arrayidx18.1, align 4, !tbaa !18
  %mul19.1 = fmul contract float %alpha, %10
  %mul20.1 = shl nuw nsw i32 %inc, 10
  %add21.1 = add nsw i32 %mul20.1, %add
  %idxprom22.1 = sext i32 %add21.1 to i64
  %arrayidx23.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom22.1
  %11 = load float, ptr addrspace(1) %arrayidx23.1, align 4, !tbaa !18
  %mul24.1 = fmul contract float %mul19.1, %11
  %add29.1 = fadd contract float %add29, %mul24.1
  store float %add29.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %k.057, 2
  %add16.2 = add nsw i32 %inc.1, %mul12
  %idxprom17.2 = sext i32 %add16.2 to i64
  %arrayidx18.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.2
  %12 = load float, ptr addrspace(1) %arrayidx18.2, align 4, !tbaa !18
  %mul19.2 = fmul contract float %alpha, %12
  %mul20.2 = shl nuw nsw i32 %inc.1, 10
  %add21.2 = add nsw i32 %mul20.2, %add
  %idxprom22.2 = sext i32 %add21.2 to i64
  %arrayidx23.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom22.2
  %13 = load float, ptr addrspace(1) %arrayidx23.2, align 4, !tbaa !18
  %mul24.2 = fmul contract float %mul19.2, %13
  %add29.2 = fadd contract float %add29.1, %mul24.2
  store float %add29.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %k.057, 3
  %add16.3 = add nsw i32 %inc.2, %mul12
  %idxprom17.3 = sext i32 %add16.3 to i64
  %arrayidx18.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.3
  %14 = load float, ptr addrspace(1) %arrayidx18.3, align 4, !tbaa !18
  %mul19.3 = fmul contract float %alpha, %14
  %mul20.3 = shl nuw nsw i32 %inc.2, 10
  %add21.3 = add nsw i32 %mul20.3, %add
  %idxprom22.3 = sext i32 %add21.3 to i64
  %arrayidx23.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom22.3
  %15 = load float, ptr addrspace(1) %arrayidx23.3, align 4, !tbaa !18
  %mul24.3 = fmul contract float %mul19.3, %15
  %add29.3 = fadd contract float %add29.2, %mul24.3
  store float %add29.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %k.057, 4
  %add16.4 = add nsw i32 %inc.3, %mul12
  %idxprom17.4 = sext i32 %add16.4 to i64
  %arrayidx18.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.4
  %16 = load float, ptr addrspace(1) %arrayidx18.4, align 4, !tbaa !18
  %mul19.4 = fmul contract float %alpha, %16
  %mul20.4 = shl nuw nsw i32 %inc.3, 10
  %add21.4 = add nsw i32 %mul20.4, %add
  %idxprom22.4 = sext i32 %add21.4 to i64
  %arrayidx23.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom22.4
  %17 = load float, ptr addrspace(1) %arrayidx23.4, align 4, !tbaa !18
  %mul24.4 = fmul contract float %mul19.4, %17
  %add29.4 = fadd contract float %add29.3, %mul24.4
  store float %add29.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %k.057, 5
  %add16.5 = add nsw i32 %inc.4, %mul12
  %idxprom17.5 = sext i32 %add16.5 to i64
  %arrayidx18.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.5
  %18 = load float, ptr addrspace(1) %arrayidx18.5, align 4, !tbaa !18
  %mul19.5 = fmul contract float %alpha, %18
  %mul20.5 = shl nuw nsw i32 %inc.4, 10
  %add21.5 = add nsw i32 %mul20.5, %add
  %idxprom22.5 = sext i32 %add21.5 to i64
  %arrayidx23.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom22.5
  %19 = load float, ptr addrspace(1) %arrayidx23.5, align 4, !tbaa !18
  %mul24.5 = fmul contract float %mul19.5, %19
  %add29.5 = fadd contract float %add29.4, %mul24.5
  store float %add29.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %k.057, 6
  %add16.6 = add nsw i32 %inc.5, %mul12
  %idxprom17.6 = sext i32 %add16.6 to i64
  %arrayidx18.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.6
  %20 = load float, ptr addrspace(1) %arrayidx18.6, align 4, !tbaa !18
  %mul19.6 = fmul contract float %alpha, %20
  %mul20.6 = shl nuw nsw i32 %inc.5, 10
  %add21.6 = add nsw i32 %mul20.6, %add
  %idxprom22.6 = sext i32 %add21.6 to i64
  %arrayidx23.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom22.6
  %21 = load float, ptr addrspace(1) %arrayidx23.6, align 4, !tbaa !18
  %mul24.6 = fmul contract float %mul19.6, %21
  %add29.6 = fadd contract float %add29.5, %mul24.6
  store float %add29.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %k.057, 7
  %add16.7 = add nsw i32 %inc.6, %mul12
  %idxprom17.7 = sext i32 %add16.7 to i64
  %arrayidx18.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.7
  %22 = load float, ptr addrspace(1) %arrayidx18.7, align 4, !tbaa !18
  %mul19.7 = fmul contract float %alpha, %22
  %mul20.7 = shl nuw nsw i32 %inc.6, 10
  %add21.7 = add nsw i32 %mul20.7, %add
  %idxprom22.7 = sext i32 %add21.7 to i64
  %arrayidx23.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom22.7
  %23 = load float, ptr addrspace(1) %arrayidx23.7, align 4, !tbaa !18
  %mul24.7 = fmul contract float %mul19.7, %23
  %add29.7 = fadd contract float %add29.6, %mul24.7
  store float %add29.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %k.057, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !20

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.preheader
  %add2958.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add29.7, %if.end.loopexit.unr-lcssa ]
  %k.057.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod59 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod59)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add2958.epil = phi float [ %add29.epil, %for.body.epil ], [ %add2958.epil.init, %for.body.epil.preheader ]
  %k.057.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %k.057.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %add16.epil = add nsw i32 %k.057.epil, %mul12
  %idxprom17.epil = sext i32 %add16.epil to i64
  %arrayidx18.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom17.epil
  %24 = load float, ptr addrspace(1) %arrayidx18.epil, align 4, !tbaa !18
  %mul19.epil = fmul contract float %alpha, %24
  %mul20.epil = shl nuw nsw i32 %k.057.epil, 10
  %add21.epil = add nsw i32 %mul20.epil, %add
  %idxprom22.epil = sext i32 %add21.epil to i64
  %arrayidx23.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom22.epil
  %25 = load float, ptr addrspace(1) %arrayidx23.epil, align 4, !tbaa !18
  %mul24.epil = fmul contract float %mul19.epil, %25
  %add29.epil = fadd contract float %add2958.epil, %mul24.epil
  store float %add29.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %k.057.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !22

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11mm2_kernel2iiiiffPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, float noundef %alpha, float noundef %beta, ptr addrspace(1) nofree noundef readonly captures(none) %tmp.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %C.coerce, ptr addrspace(1) nofree noundef captures(none) %D.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i46 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i46
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i55 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i52 = zext i16 %.in.i55 to i32
  %mul8 = mul i32 %4, %conv.i52
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add10 = add i32 %mul8, %6
  %cmp = icmp slt i32 %add10, %ni
  %cmp11 = icmp slt i32 %add, %nl
  %or.cond = and i1 %cmp11, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul12 = shl nsw i32 %add10, 10
  %add13 = add nsw i32 %mul12, %add
  %idxprom = sext i32 %add13 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %D.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul14 = fmul contract float %beta, %7
  store float %mul14, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %cmp1556 = icmp sgt i32 %nj, 0
  br i1 %cmp1556, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %nj, 7
  %8 = icmp ult i32 %nj, 8
  br i1 %8, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %nj, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %add2958 = phi float [ %mul14, %for.body.preheader.new ], [ %add29.7, %for.body ]
  %k.057 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %add17 = add nsw i32 %k.057, %mul12
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [4 x i8], ptr addrspace(1) %tmp.coerce, i64 %idxprom18
  %9 = load float, ptr addrspace(1) %arrayidx19, align 4, !tbaa !18
  %mul20 = shl nuw nsw i32 %k.057, 10
  %add21 = add nsw i32 %mul20, %add
  %idxprom22 = sext i32 %add21 to i64
  %arrayidx23 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom22
  %10 = load float, ptr addrspace(1) %arrayidx23, align 4, !tbaa !18
  %mul24 = fmul contract float %9, %10
  %add29 = fadd contract float %add2958, %mul24
  store float %add29, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = or disjoint i32 %k.057, 1
  %add17.1 = add nsw i32 %inc, %mul12
  %idxprom18.1 = sext i32 %add17.1 to i64
  %arrayidx19.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %tmp.coerce, i64 %idxprom18.1
  %11 = load float, ptr addrspace(1) %arrayidx19.1, align 4, !tbaa !18
  %mul20.1 = shl nuw nsw i32 %inc, 10
  %add21.1 = add nsw i32 %mul20.1, %add
  %idxprom22.1 = sext i32 %add21.1 to i64
  %arrayidx23.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom22.1
  %12 = load float, ptr addrspace(1) %arrayidx23.1, align 4, !tbaa !18
  %mul24.1 = fmul contract float %11, %12
  %add29.1 = fadd contract float %add29, %mul24.1
  store float %add29.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %k.057, 2
  %add17.2 = add nsw i32 %inc.1, %mul12
  %idxprom18.2 = sext i32 %add17.2 to i64
  %arrayidx19.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %tmp.coerce, i64 %idxprom18.2
  %13 = load float, ptr addrspace(1) %arrayidx19.2, align 4, !tbaa !18
  %mul20.2 = shl nuw nsw i32 %inc.1, 10
  %add21.2 = add nsw i32 %mul20.2, %add
  %idxprom22.2 = sext i32 %add21.2 to i64
  %arrayidx23.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom22.2
  %14 = load float, ptr addrspace(1) %arrayidx23.2, align 4, !tbaa !18
  %mul24.2 = fmul contract float %13, %14
  %add29.2 = fadd contract float %add29.1, %mul24.2
  store float %add29.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %k.057, 3
  %add17.3 = add nsw i32 %inc.2, %mul12
  %idxprom18.3 = sext i32 %add17.3 to i64
  %arrayidx19.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %tmp.coerce, i64 %idxprom18.3
  %15 = load float, ptr addrspace(1) %arrayidx19.3, align 4, !tbaa !18
  %mul20.3 = shl nuw nsw i32 %inc.2, 10
  %add21.3 = add nsw i32 %mul20.3, %add
  %idxprom22.3 = sext i32 %add21.3 to i64
  %arrayidx23.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom22.3
  %16 = load float, ptr addrspace(1) %arrayidx23.3, align 4, !tbaa !18
  %mul24.3 = fmul contract float %15, %16
  %add29.3 = fadd contract float %add29.2, %mul24.3
  store float %add29.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %k.057, 4
  %add17.4 = add nsw i32 %inc.3, %mul12
  %idxprom18.4 = sext i32 %add17.4 to i64
  %arrayidx19.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %tmp.coerce, i64 %idxprom18.4
  %17 = load float, ptr addrspace(1) %arrayidx19.4, align 4, !tbaa !18
  %mul20.4 = shl nuw nsw i32 %inc.3, 10
  %add21.4 = add nsw i32 %mul20.4, %add
  %idxprom22.4 = sext i32 %add21.4 to i64
  %arrayidx23.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom22.4
  %18 = load float, ptr addrspace(1) %arrayidx23.4, align 4, !tbaa !18
  %mul24.4 = fmul contract float %17, %18
  %add29.4 = fadd contract float %add29.3, %mul24.4
  store float %add29.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %k.057, 5
  %add17.5 = add nsw i32 %inc.4, %mul12
  %idxprom18.5 = sext i32 %add17.5 to i64
  %arrayidx19.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %tmp.coerce, i64 %idxprom18.5
  %19 = load float, ptr addrspace(1) %arrayidx19.5, align 4, !tbaa !18
  %mul20.5 = shl nuw nsw i32 %inc.4, 10
  %add21.5 = add nsw i32 %mul20.5, %add
  %idxprom22.5 = sext i32 %add21.5 to i64
  %arrayidx23.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom22.5
  %20 = load float, ptr addrspace(1) %arrayidx23.5, align 4, !tbaa !18
  %mul24.5 = fmul contract float %19, %20
  %add29.5 = fadd contract float %add29.4, %mul24.5
  store float %add29.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %k.057, 6
  %add17.6 = add nsw i32 %inc.5, %mul12
  %idxprom18.6 = sext i32 %add17.6 to i64
  %arrayidx19.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %tmp.coerce, i64 %idxprom18.6
  %21 = load float, ptr addrspace(1) %arrayidx19.6, align 4, !tbaa !18
  %mul20.6 = shl nuw nsw i32 %inc.5, 10
  %add21.6 = add nsw i32 %mul20.6, %add
  %idxprom22.6 = sext i32 %add21.6 to i64
  %arrayidx23.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom22.6
  %22 = load float, ptr addrspace(1) %arrayidx23.6, align 4, !tbaa !18
  %mul24.6 = fmul contract float %21, %22
  %add29.6 = fadd contract float %add29.5, %mul24.6
  store float %add29.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %k.057, 7
  %add17.7 = add nsw i32 %inc.6, %mul12
  %idxprom18.7 = sext i32 %add17.7 to i64
  %arrayidx19.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %tmp.coerce, i64 %idxprom18.7
  %23 = load float, ptr addrspace(1) %arrayidx19.7, align 4, !tbaa !18
  %mul20.7 = shl nuw nsw i32 %inc.6, 10
  %add21.7 = add nsw i32 %mul20.7, %add
  %idxprom22.7 = sext i32 %add21.7 to i64
  %arrayidx23.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom22.7
  %24 = load float, ptr addrspace(1) %arrayidx23.7, align 4, !tbaa !18
  %mul24.7 = fmul contract float %23, %24
  %add29.7 = fadd contract float %add29.6, %mul24.7
  store float %add29.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %k.057, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !24

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.preheader
  %add2958.epil.init = phi float [ %mul14, %for.body.preheader ], [ %add29.7, %if.end.loopexit.unr-lcssa ]
  %k.057.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod59 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod59)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add2958.epil = phi float [ %add29.epil, %for.body.epil ], [ %add2958.epil.init, %for.body.epil.preheader ]
  %k.057.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %k.057.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %add17.epil = add nsw i32 %k.057.epil, %mul12
  %idxprom18.epil = sext i32 %add17.epil to i64
  %arrayidx19.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %tmp.coerce, i64 %idxprom18.epil
  %25 = load float, ptr addrspace(1) %arrayidx19.epil, align 4, !tbaa !18
  %mul20.epil = shl nuw nsw i32 %k.057.epil, 10
  %add21.epil = add nsw i32 %mul20.epil, %add
  %idxprom22.epil = sext i32 %add21.epil to i64
  %arrayidx23.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %C.coerce, i64 %idxprom22.epil
  %26 = load float, ptr addrspace(1) %arrayidx23.epil, align 4, !tbaa !18
  %mul24.epil = fmul contract float %25, %26
  %add29.epil = fadd contract float %add2958.epil, %mul24.epil
  store float %add29.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %k.057.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !25

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
