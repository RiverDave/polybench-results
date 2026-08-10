; ModuleID = '/root/polybenchGpu/HIP/CORR/correlation.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/CORR/correlation.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_e178712342060e78 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_e178712342060e78 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11mean_kerneliiPfS_(i32 noundef %m, i32 noundef %n, ptr addrspace(1) nofree noundef writeonly captures(none) %mean.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %data.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i26 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i26
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %cmp = icmp slt i32 %add, %m
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %mean.coerce, i64 %idxprom
  store float 0.000000e+00, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %cmp529 = icmp sgt i32 %n, 0
  br i1 %cmp529, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %n, 7
  %4 = icmp ult i32 %n, 8
  br i1 %4, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %n, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %add1231 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add12.7, %for.body ]
  %i.030 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %mul6 = shl nuw nsw i32 %i.030, 11
  %add7 = add nsw i32 %mul6, %add
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom8
  %5 = load float, ptr addrspace(1) %arrayidx9, align 4, !tbaa !18
  %add12 = fadd contract float %5, %add1231
  store float %add12, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = shl i32 %i.030, 11
  %mul6.1 = or disjoint i32 %inc, 2048
  %add7.1 = add nsw i32 %mul6.1, %add
  %idxprom8.1 = sext i32 %add7.1 to i64
  %arrayidx9.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom8.1
  %6 = load float, ptr addrspace(1) %arrayidx9.1, align 4, !tbaa !18
  %add12.1 = fadd contract float %6, %add12
  store float %add12.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = shl i32 %i.030, 11
  %mul6.2 = or disjoint i32 %inc.1, 4096
  %add7.2 = add nsw i32 %mul6.2, %add
  %idxprom8.2 = sext i32 %add7.2 to i64
  %arrayidx9.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom8.2
  %7 = load float, ptr addrspace(1) %arrayidx9.2, align 4, !tbaa !18
  %add12.2 = fadd contract float %7, %add12.1
  store float %add12.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = shl i32 %i.030, 11
  %mul6.3 = or disjoint i32 %inc.2, 6144
  %add7.3 = add nsw i32 %mul6.3, %add
  %idxprom8.3 = sext i32 %add7.3 to i64
  %arrayidx9.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom8.3
  %8 = load float, ptr addrspace(1) %arrayidx9.3, align 4, !tbaa !18
  %add12.3 = fadd contract float %8, %add12.2
  store float %add12.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = shl i32 %i.030, 11
  %mul6.4 = or disjoint i32 %inc.3, 8192
  %add7.4 = add nsw i32 %mul6.4, %add
  %idxprom8.4 = sext i32 %add7.4 to i64
  %arrayidx9.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom8.4
  %9 = load float, ptr addrspace(1) %arrayidx9.4, align 4, !tbaa !18
  %add12.4 = fadd contract float %9, %add12.3
  store float %add12.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = shl i32 %i.030, 11
  %mul6.5 = or disjoint i32 %inc.4, 10240
  %add7.5 = add nsw i32 %mul6.5, %add
  %idxprom8.5 = sext i32 %add7.5 to i64
  %arrayidx9.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom8.5
  %10 = load float, ptr addrspace(1) %arrayidx9.5, align 4, !tbaa !18
  %add12.5 = fadd contract float %10, %add12.4
  store float %add12.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = shl i32 %i.030, 11
  %mul6.6 = or disjoint i32 %inc.5, 12288
  %add7.6 = add nsw i32 %mul6.6, %add
  %idxprom8.6 = sext i32 %add7.6 to i64
  %arrayidx9.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom8.6
  %11 = load float, ptr addrspace(1) %arrayidx9.6, align 4, !tbaa !18
  %add12.6 = fadd contract float %11, %add12.5
  store float %add12.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = shl i32 %i.030, 11
  %mul6.7 = or disjoint i32 %inc.6, 14336
  %add7.7 = add nsw i32 %mul6.7, %add
  %idxprom8.7 = sext i32 %add7.7 to i64
  %arrayidx9.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom8.7
  %12 = load float, ptr addrspace(1) %arrayidx9.7, align 4, !tbaa !18
  %add12.7 = fadd contract float %12, %add12.6
  store float %add12.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %i.030, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !20

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.preheader
  %add1231.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add12.7, %for.end.loopexit.unr-lcssa ]
  %i.030.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod33 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod33)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add1231.epil = phi float [ %add12.epil, %for.body.epil ], [ %add1231.epil.init, %for.body.epil.preheader ]
  %i.030.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %i.030.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %mul6.epil = shl nuw nsw i32 %i.030.epil, 11
  %add7.epil = add nsw i32 %mul6.epil, %add
  %idxprom8.epil = sext i32 %add7.epil to i64
  %arrayidx9.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom8.epil
  %13 = load float, ptr addrspace(1) %arrayidx9.epil, align 4, !tbaa !18
  %add12.epil = fadd contract float %13, %add1231.epil
  store float %add12.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %i.030.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body.epil, !llvm.loop !22

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil, %if.then
  %14 = phi float [ 0.000000e+00, %if.then ], [ %add12.7, %for.end.loopexit.unr-lcssa ], [ %add12.epil, %for.body.epil ]
  %div = fdiv contract float %14, f0x4A442E10
  store float %div, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z10std_kerneliiPfS_S_(i32 noundef %m, i32 noundef %n, ptr addrspace(1) nofree noundef readonly captures(none) %mean.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %std.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %data.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i64 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i64
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %cmp = icmp slt i32 %add, %m
  br i1 %cmp, label %if.then, label %if.end37

if.then:                                          ; preds = %entry
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %std.coerce, i64 %idxprom
  store float 0.000000e+00, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %cmp667 = icmp sgt i32 %n, 0
  br i1 %cmp667, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %if.then
  %arrayidx12 = getelementptr inbounds [4 x i8], ptr addrspace(1) %mean.coerce, i64 %idxprom
  %xtraiter = and i32 %n, 7
  %4 = icmp ult i32 %n, 8
  br i1 %4, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %n, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %5 = phi float [ 0.000000e+00, %for.body.lr.ph.new ], [ %add23.7, %for.body ]
  %i.068 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.7, %for.body ]
  %mul7 = shl nuw nsw i32 %i.068, 11
  %add8 = add nsw i32 %mul7, %add
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom9
  %6 = load float, ptr addrspace(1) %arrayidx10, align 4, !tbaa !18
  %7 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %sub = fsub contract float %6, %7
  %mul20 = fmul contract float %sub, %sub
  %add23 = fadd contract float %5, %mul20
  store float %add23, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = shl i32 %i.068, 11
  %mul7.1 = or disjoint i32 %inc, 2048
  %add8.1 = add nsw i32 %mul7.1, %add
  %idxprom9.1 = sext i32 %add8.1 to i64
  %arrayidx10.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom9.1
  %8 = load float, ptr addrspace(1) %arrayidx10.1, align 4, !tbaa !18
  %9 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %sub.1 = fsub contract float %8, %9
  %mul20.1 = fmul contract float %sub.1, %sub.1
  %add23.1 = fadd contract float %add23, %mul20.1
  store float %add23.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = shl i32 %i.068, 11
  %mul7.2 = or disjoint i32 %inc.1, 4096
  %add8.2 = add nsw i32 %mul7.2, %add
  %idxprom9.2 = sext i32 %add8.2 to i64
  %arrayidx10.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom9.2
  %10 = load float, ptr addrspace(1) %arrayidx10.2, align 4, !tbaa !18
  %11 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %sub.2 = fsub contract float %10, %11
  %mul20.2 = fmul contract float %sub.2, %sub.2
  %add23.2 = fadd contract float %add23.1, %mul20.2
  store float %add23.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = shl i32 %i.068, 11
  %mul7.3 = or disjoint i32 %inc.2, 6144
  %add8.3 = add nsw i32 %mul7.3, %add
  %idxprom9.3 = sext i32 %add8.3 to i64
  %arrayidx10.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom9.3
  %12 = load float, ptr addrspace(1) %arrayidx10.3, align 4, !tbaa !18
  %13 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %sub.3 = fsub contract float %12, %13
  %mul20.3 = fmul contract float %sub.3, %sub.3
  %add23.3 = fadd contract float %add23.2, %mul20.3
  store float %add23.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = shl i32 %i.068, 11
  %mul7.4 = or disjoint i32 %inc.3, 8192
  %add8.4 = add nsw i32 %mul7.4, %add
  %idxprom9.4 = sext i32 %add8.4 to i64
  %arrayidx10.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom9.4
  %14 = load float, ptr addrspace(1) %arrayidx10.4, align 4, !tbaa !18
  %15 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %sub.4 = fsub contract float %14, %15
  %mul20.4 = fmul contract float %sub.4, %sub.4
  %add23.4 = fadd contract float %add23.3, %mul20.4
  store float %add23.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = shl i32 %i.068, 11
  %mul7.5 = or disjoint i32 %inc.4, 10240
  %add8.5 = add nsw i32 %mul7.5, %add
  %idxprom9.5 = sext i32 %add8.5 to i64
  %arrayidx10.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom9.5
  %16 = load float, ptr addrspace(1) %arrayidx10.5, align 4, !tbaa !18
  %17 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %sub.5 = fsub contract float %16, %17
  %mul20.5 = fmul contract float %sub.5, %sub.5
  %add23.5 = fadd contract float %add23.4, %mul20.5
  store float %add23.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = shl i32 %i.068, 11
  %mul7.6 = or disjoint i32 %inc.5, 12288
  %add8.6 = add nsw i32 %mul7.6, %add
  %idxprom9.6 = sext i32 %add8.6 to i64
  %arrayidx10.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom9.6
  %18 = load float, ptr addrspace(1) %arrayidx10.6, align 4, !tbaa !18
  %19 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %sub.6 = fsub contract float %18, %19
  %mul20.6 = fmul contract float %sub.6, %sub.6
  %add23.6 = fadd contract float %add23.5, %mul20.6
  store float %add23.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = shl i32 %i.068, 11
  %mul7.7 = or disjoint i32 %inc.6, 14336
  %add8.7 = add nsw i32 %mul7.7, %add
  %idxprom9.7 = sext i32 %add8.7 to i64
  %arrayidx10.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom9.7
  %20 = load float, ptr addrspace(1) %arrayidx10.7, align 4, !tbaa !18
  %21 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %sub.7 = fsub contract float %20, %21
  %mul20.7 = fmul contract float %sub.7, %sub.7
  %add23.7 = fadd contract float %add23.6, %mul20.7
  store float %add23.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %i.068, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !24

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.lr.ph
  %.epil.init = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %add23.7, %for.end.loopexit.unr-lcssa ]
  %i.068.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.7, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod70 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod70)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %22 = phi float [ %.epil.init, %for.body.epil.preheader ], [ %add23.epil, %for.body.epil ]
  %i.068.epil = phi i32 [ %i.068.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %mul7.epil = shl nuw nsw i32 %i.068.epil, 11
  %add8.epil = add nsw i32 %mul7.epil, %add
  %idxprom9.epil = sext i32 %add8.epil to i64
  %arrayidx10.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom9.epil
  %23 = load float, ptr addrspace(1) %arrayidx10.epil, align 4, !tbaa !18
  %24 = load float, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %sub.epil = fsub contract float %23, %24
  %mul20.epil = fmul contract float %sub.epil, %sub.epil
  %add23.epil = fadd contract float %22, %mul20.epil
  store float %add23.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %i.068.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body.epil, !llvm.loop !25

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil, %if.then
  %25 = phi float [ 0.000000e+00, %if.then ], [ %add23.7, %for.end.loopexit.unr-lcssa ], [ %add23.epil, %for.body.epil ]
  %div = fdiv contract float %25, f0x4A442E10
  %26 = tail call contract noundef float @llvm.sqrt.f32(float %div)
  %cmp33 = fcmp contract ugt float %26, 5.000000e-03
  %storemerge = select i1 %cmp33, float %26, float 1.000000e+00
  store float %storemerge, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  br label %if.end37

if.end37:                                         ; preds = %for.end, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z13reduce_kerneliiPfS_S_(i32 noundef %m, i32 noundef %n, ptr addrspace(1) nofree noundef readonly captures(none) %mean.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %std.coerce, ptr addrspace(1) nofree noundef captures(none) %data.coerce) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i38 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i38
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i47 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i44 = zext i16 %.in.i47 to i32
  %mul8 = mul i32 %4, %conv.i44
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add10 = add i32 %mul8, %6
  %cmp = icmp slt i32 %add10, %n
  %cmp11 = icmp slt i32 %add, %m
  %or.cond = and i1 %cmp11, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %mean.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul12 = shl nsw i32 %add10, 11
  %add13 = add nsw i32 %mul12, %add
  %idxprom14 = sext i32 %add13 to i64
  %arrayidx15 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom14
  %8 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %sub = fsub contract float %8, %7
  store float %sub, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr addrspace(1) %std.coerce, i64 %idxprom
  %9 = load float, ptr addrspace(1) %arrayidx18, align 4, !tbaa !18
  %mul19 = fmul contract float %9, f0x44E01A51
  %div = fdiv contract float %sub, %mul19
  store float %div, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11corr_kerneliiPfS_(i32 noundef %m, i32 noundef %n, ptr addrspace(1) nofree noundef writeonly captures(none) %symmat.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %data.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i67 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i67
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %sub = add nsw i32 %m, -1
  %cmp = icmp slt i32 %add, %sub
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul5 = shl nsw i32 %add, 11
  %add6 = mul i32 %add, 2049
  %idxprom = sext i32 %add6 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %symmat.coerce, i64 %idxprom
  store float 1.000000e+00, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %j2.073 = add nsw i32 %add, 1
  %cmp874 = icmp slt i32 %j2.073, %m
  br i1 %cmp874, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %if.then
  %cmp1470 = icmp sgt i32 %n, 0
  %xtraiter = and i32 %n, 7
  %4 = icmp ult i32 %n, 8
  %unroll_iter = and i32 %n, 2147483640
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  %lcmp.mod77 = icmp ne i32 %xtraiter, 0
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.end
  %j2.075 = phi i32 [ %j2.073, %for.body.lr.ph ], [ %j2.0, %for.end ]
  %add10 = add nsw i32 %j2.075, %mul5
  %idxprom11 = sext i32 %add10 to i64
  %arrayidx12 = getelementptr inbounds [4 x i8], ptr addrspace(1) %symmat.coerce, i64 %idxprom11
  store float 0.000000e+00, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  br i1 %cmp1470, label %for.body15.preheader, label %for.end

for.body15.preheader:                             ; preds = %for.body
  br i1 %4, label %for.body15.epil.preheader, label %for.body15

for.body15:                                       ; preds = %for.body15.preheader, %for.body15
  %add2972 = phi float [ %add29.7, %for.body15 ], [ 0.000000e+00, %for.body15.preheader ]
  %i.071 = phi i32 [ %inc.7, %for.body15 ], [ 0, %for.body15.preheader ]
  %niter = phi i32 [ %niter.next.7, %for.body15 ], [ 0, %for.body15.preheader ]
  %mul16 = shl nuw nsw i32 %i.071, 11
  %add17 = add nsw i32 %mul16, %add
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom18
  %5 = load float, ptr addrspace(1) %arrayidx19, align 4, !tbaa !18
  %add21 = add nsw i32 %mul16, %j2.075
  %idxprom22 = sext i32 %add21 to i64
  %arrayidx23 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom22
  %6 = load float, ptr addrspace(1) %arrayidx23, align 4, !tbaa !18
  %mul24 = fmul contract float %5, %6
  %add29 = fadd contract float %add2972, %mul24
  store float %add29, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %inc = shl i32 %i.071, 11
  %mul16.1 = or disjoint i32 %inc, 2048
  %add17.1 = add nsw i32 %mul16.1, %add
  %idxprom18.1 = sext i32 %add17.1 to i64
  %arrayidx19.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom18.1
  %7 = load float, ptr addrspace(1) %arrayidx19.1, align 4, !tbaa !18
  %add21.1 = add nsw i32 %mul16.1, %j2.075
  %idxprom22.1 = sext i32 %add21.1 to i64
  %arrayidx23.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom22.1
  %8 = load float, ptr addrspace(1) %arrayidx23.1, align 4, !tbaa !18
  %mul24.1 = fmul contract float %7, %8
  %add29.1 = fadd contract float %add29, %mul24.1
  store float %add29.1, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %inc.1 = shl i32 %i.071, 11
  %mul16.2 = or disjoint i32 %inc.1, 4096
  %add17.2 = add nsw i32 %mul16.2, %add
  %idxprom18.2 = sext i32 %add17.2 to i64
  %arrayidx19.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom18.2
  %9 = load float, ptr addrspace(1) %arrayidx19.2, align 4, !tbaa !18
  %add21.2 = add nsw i32 %mul16.2, %j2.075
  %idxprom22.2 = sext i32 %add21.2 to i64
  %arrayidx23.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom22.2
  %10 = load float, ptr addrspace(1) %arrayidx23.2, align 4, !tbaa !18
  %mul24.2 = fmul contract float %9, %10
  %add29.2 = fadd contract float %add29.1, %mul24.2
  store float %add29.2, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %inc.2 = shl i32 %i.071, 11
  %mul16.3 = or disjoint i32 %inc.2, 6144
  %add17.3 = add nsw i32 %mul16.3, %add
  %idxprom18.3 = sext i32 %add17.3 to i64
  %arrayidx19.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom18.3
  %11 = load float, ptr addrspace(1) %arrayidx19.3, align 4, !tbaa !18
  %add21.3 = add nsw i32 %mul16.3, %j2.075
  %idxprom22.3 = sext i32 %add21.3 to i64
  %arrayidx23.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom22.3
  %12 = load float, ptr addrspace(1) %arrayidx23.3, align 4, !tbaa !18
  %mul24.3 = fmul contract float %11, %12
  %add29.3 = fadd contract float %add29.2, %mul24.3
  store float %add29.3, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %inc.3 = shl i32 %i.071, 11
  %mul16.4 = or disjoint i32 %inc.3, 8192
  %add17.4 = add nsw i32 %mul16.4, %add
  %idxprom18.4 = sext i32 %add17.4 to i64
  %arrayidx19.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom18.4
  %13 = load float, ptr addrspace(1) %arrayidx19.4, align 4, !tbaa !18
  %add21.4 = add nsw i32 %mul16.4, %j2.075
  %idxprom22.4 = sext i32 %add21.4 to i64
  %arrayidx23.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom22.4
  %14 = load float, ptr addrspace(1) %arrayidx23.4, align 4, !tbaa !18
  %mul24.4 = fmul contract float %13, %14
  %add29.4 = fadd contract float %add29.3, %mul24.4
  store float %add29.4, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %inc.4 = shl i32 %i.071, 11
  %mul16.5 = or disjoint i32 %inc.4, 10240
  %add17.5 = add nsw i32 %mul16.5, %add
  %idxprom18.5 = sext i32 %add17.5 to i64
  %arrayidx19.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom18.5
  %15 = load float, ptr addrspace(1) %arrayidx19.5, align 4, !tbaa !18
  %add21.5 = add nsw i32 %mul16.5, %j2.075
  %idxprom22.5 = sext i32 %add21.5 to i64
  %arrayidx23.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom22.5
  %16 = load float, ptr addrspace(1) %arrayidx23.5, align 4, !tbaa !18
  %mul24.5 = fmul contract float %15, %16
  %add29.5 = fadd contract float %add29.4, %mul24.5
  store float %add29.5, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %inc.5 = shl i32 %i.071, 11
  %mul16.6 = or disjoint i32 %inc.5, 12288
  %add17.6 = add nsw i32 %mul16.6, %add
  %idxprom18.6 = sext i32 %add17.6 to i64
  %arrayidx19.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom18.6
  %17 = load float, ptr addrspace(1) %arrayidx19.6, align 4, !tbaa !18
  %add21.6 = add nsw i32 %mul16.6, %j2.075
  %idxprom22.6 = sext i32 %add21.6 to i64
  %arrayidx23.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom22.6
  %18 = load float, ptr addrspace(1) %arrayidx23.6, align 4, !tbaa !18
  %mul24.6 = fmul contract float %17, %18
  %add29.6 = fadd contract float %add29.5, %mul24.6
  store float %add29.6, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %inc.6 = shl i32 %i.071, 11
  %mul16.7 = or disjoint i32 %inc.6, 14336
  %add17.7 = add nsw i32 %mul16.7, %add
  %idxprom18.7 = sext i32 %add17.7 to i64
  %arrayidx19.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom18.7
  %19 = load float, ptr addrspace(1) %arrayidx19.7, align 4, !tbaa !18
  %add21.7 = add nsw i32 %mul16.7, %j2.075
  %idxprom22.7 = sext i32 %add21.7 to i64
  %arrayidx23.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom22.7
  %20 = load float, ptr addrspace(1) %arrayidx23.7, align 4, !tbaa !18
  %mul24.7 = fmul contract float %19, %20
  %add29.7 = fadd contract float %add29.6, %mul24.7
  store float %add29.7, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %i.071, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.end.loopexit.unr-lcssa, label %for.body15, !llvm.loop !26

for.end.loopexit.unr-lcssa:                       ; preds = %for.body15
  br i1 %lcmp.mod.not, label %for.end, label %for.body15.epil.preheader

for.body15.epil.preheader:                        ; preds = %for.end.loopexit.unr-lcssa, %for.body15.preheader
  %add2972.epil.init = phi float [ 0.000000e+00, %for.body15.preheader ], [ %add29.7, %for.end.loopexit.unr-lcssa ]
  %i.071.epil.init = phi i32 [ 0, %for.body15.preheader ], [ %inc.7, %for.end.loopexit.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod77)
  br label %for.body15.epil

for.body15.epil:                                  ; preds = %for.body15.epil, %for.body15.epil.preheader
  %add2972.epil = phi float [ %add29.epil, %for.body15.epil ], [ %add2972.epil.init, %for.body15.epil.preheader ]
  %i.071.epil = phi i32 [ %inc.epil, %for.body15.epil ], [ %i.071.epil.init, %for.body15.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body15.epil ], [ 0, %for.body15.epil.preheader ]
  %mul16.epil = shl nuw nsw i32 %i.071.epil, 11
  %add17.epil = add nsw i32 %mul16.epil, %add
  %idxprom18.epil = sext i32 %add17.epil to i64
  %arrayidx19.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom18.epil
  %21 = load float, ptr addrspace(1) %arrayidx19.epil, align 4, !tbaa !18
  %add21.epil = add nsw i32 %mul16.epil, %j2.075
  %idxprom22.epil = sext i32 %add21.epil to i64
  %arrayidx23.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom22.epil
  %22 = load float, ptr addrspace(1) %arrayidx23.epil, align 4, !tbaa !18
  %mul24.epil = fmul contract float %21, %22
  %add29.epil = fadd contract float %add2972.epil, %mul24.epil
  store float %add29.epil, ptr addrspace(1) %arrayidx12, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %i.071.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body15.epil, !llvm.loop !27

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body15.epil, %for.body
  %23 = phi float [ 0.000000e+00, %for.body ], [ %add29.7, %for.end.loopexit.unr-lcssa ], [ %add29.epil, %for.body15.epil ]
  %mul34 = shl nsw i32 %j2.075, 11
  %add35 = add nsw i32 %mul34, %add
  %idxprom36 = sext i32 %add35 to i64
  %arrayidx37 = getelementptr inbounds [4 x i8], ptr addrspace(1) %symmat.coerce, i64 %idxprom36
  store float %23, ptr addrspace(1) %arrayidx37, align 4, !tbaa !18
  %j2.0 = add nsw i32 %j2.075, 1
  %cmp8 = icmp slt i32 %j2.0, %m
  br i1 %cmp8, label %for.body, label %if.end, !llvm.loop !28

if.end:                                           ; preds = %for.end, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #4

attributes #0 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

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
!28 = distinct !{!28, !21}
