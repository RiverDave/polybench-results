; ModuleID = '/root/polybenchGpu/HIP/ADI/adi.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/ADI/adi.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_5afadc9281497e7 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_5afadc9281497e7 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11adi_kernel1iPfS_S_(i32 noundef %n, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef captures(none) %B.coerce, ptr addrspace(1) nofree noundef captures(none) %X.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i84 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i84
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %4
  %cmp = icmp slt i32 %add, %n
  %cmp687 = icmp sgt i32 %n, 1
  %or.cond = and i1 %cmp, %cmp687
  br i1 %or.cond, label %for.body.lver.check, label %if.end

for.body.lver.check:                              ; preds = %entry
  %mul7 = shl nsw i32 %add, 10
  %invariant.op = add i32 %mul7, -1
  %5 = sext i32 %mul7 to i64
  %6 = shl nsw i64 %5, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %X.coerce, i64 %6
  %7 = add nsw i32 %n, -2
  %8 = zext i32 %7 to i64
  %9 = add nsw i64 %5, %8
  %10 = shl nsw i64 %9, 2
  %11 = add nsw i64 %10, 8
  %scevgep89 = getelementptr i8, ptr addrspace(1) %X.coerce, i64 %11
  %scevgep90 = getelementptr i8, ptr addrspace(1) %B.coerce, i64 %6
  %scevgep91 = getelementptr i8, ptr addrspace(1) %B.coerce, i64 %11
  %bound0 = icmp ult ptr addrspace(1) %scevgep, %scevgep91
  %bound1 = icmp ult ptr addrspace(1) %scevgep90, %scevgep89
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.lver.orig.preheader, label %for.body.ph

for.body.lver.orig.preheader:                     ; preds = %for.body.lver.check
  %12 = add nsw i32 %n, -1
  %xtraiter101 = and i32 %12, 1
  %13 = icmp eq i32 %7, 0
  br i1 %13, label %for.body.lver.orig.epil.preheader, label %for.body.lver.orig.preheader.new

for.body.lver.orig.preheader.new:                 ; preds = %for.body.lver.orig.preheader
  %unroll_iter104 = and i32 %12, -2
  %invariant.op107 = add i32 1, %mul7
  br label %for.body.lver.orig

for.body.lver.orig:                               ; preds = %for.body.lver.orig, %for.body.lver.orig.preheader.new
  %i2.088.lver.orig = phi i32 [ 1, %for.body.lver.orig.preheader.new ], [ %inc.lver.orig.1, %for.body.lver.orig ]
  %niter105 = phi i32 [ 0, %for.body.lver.orig.preheader.new ], [ %niter105.next.1, %for.body.lver.orig ]
  %add8.lver.orig = add nsw i32 %i2.088.lver.orig, %mul7
  %idxprom.lver.orig = sext i32 %add8.lver.orig to i64
  %arrayidx.lver.orig = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom.lver.orig
  %14 = load float, ptr addrspace(1) %arrayidx.lver.orig, align 4, !tbaa !18
  %add10.reass.lver.orig = add i32 %i2.088.lver.orig, %invariant.op
  %idxprom11.lver.orig = sext i32 %add10.reass.lver.orig to i64
  %arrayidx12.lver.orig = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom11.lver.orig
  %15 = load float, ptr addrspace(1) %arrayidx12.lver.orig, align 4, !tbaa !18
  %arrayidx16.lver.orig = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.lver.orig
  %16 = load float, ptr addrspace(1) %arrayidx16.lver.orig, align 4, !tbaa !18
  %mul17.lver.orig = fmul contract float %15, %16
  %arrayidx22.lver.orig = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom11.lver.orig
  %17 = load float, ptr addrspace(1) %arrayidx22.lver.orig, align 4, !tbaa !18
  %div.lver.orig = fdiv contract float %mul17.lver.orig, %17
  %sub23.lver.orig = fsub contract float %14, %div.lver.orig
  store float %sub23.lver.orig, ptr addrspace(1) %arrayidx.lver.orig, align 4, !tbaa !18
  %arrayidx31.lver.orig = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.lver.orig
  %18 = load float, ptr addrspace(1) %arrayidx31.lver.orig, align 4, !tbaa !18
  %19 = load float, ptr addrspace(1) %arrayidx16.lver.orig, align 4, !tbaa !18
  %mul40.lver.orig = fmul contract float %19, %19
  %20 = load float, ptr addrspace(1) %arrayidx22.lver.orig, align 4, !tbaa !18
  %div46.lver.orig = fdiv contract float %mul40.lver.orig, %20
  %sub47.lver.orig = fsub contract float %18, %div46.lver.orig
  store float %sub47.lver.orig, ptr addrspace(1) %arrayidx31.lver.orig, align 4, !tbaa !18
  %add8.lver.orig.1.reass = add i32 %i2.088.lver.orig, %invariant.op107
  %idxprom.lver.orig.1 = sext i32 %add8.lver.orig.1.reass to i64
  %arrayidx.lver.orig.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom.lver.orig.1
  %21 = load float, ptr addrspace(1) %arrayidx.lver.orig.1, align 4, !tbaa !18
  %add10.reass.lver.orig.1 = add i32 %i2.088.lver.orig, %mul7
  %idxprom11.lver.orig.1 = sext i32 %add10.reass.lver.orig.1 to i64
  %arrayidx12.lver.orig.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom11.lver.orig.1
  %22 = load float, ptr addrspace(1) %arrayidx12.lver.orig.1, align 4, !tbaa !18
  %arrayidx16.lver.orig.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.lver.orig.1
  %23 = load float, ptr addrspace(1) %arrayidx16.lver.orig.1, align 4, !tbaa !18
  %mul17.lver.orig.1 = fmul contract float %22, %23
  %arrayidx22.lver.orig.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom11.lver.orig.1
  %24 = load float, ptr addrspace(1) %arrayidx22.lver.orig.1, align 4, !tbaa !18
  %div.lver.orig.1 = fdiv contract float %mul17.lver.orig.1, %24
  %sub23.lver.orig.1 = fsub contract float %21, %div.lver.orig.1
  store float %sub23.lver.orig.1, ptr addrspace(1) %arrayidx.lver.orig.1, align 4, !tbaa !18
  %arrayidx31.lver.orig.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.lver.orig.1
  %25 = load float, ptr addrspace(1) %arrayidx31.lver.orig.1, align 4, !tbaa !18
  %26 = load float, ptr addrspace(1) %arrayidx16.lver.orig.1, align 4, !tbaa !18
  %mul40.lver.orig.1 = fmul contract float %26, %26
  %27 = load float, ptr addrspace(1) %arrayidx22.lver.orig.1, align 4, !tbaa !18
  %div46.lver.orig.1 = fdiv contract float %mul40.lver.orig.1, %27
  %sub47.lver.orig.1 = fsub contract float %25, %div46.lver.orig.1
  store float %sub47.lver.orig.1, ptr addrspace(1) %arrayidx31.lver.orig.1, align 4, !tbaa !18
  %inc.lver.orig.1 = add nuw nsw i32 %i2.088.lver.orig, 2
  %niter105.next.1 = add nuw i32 %niter105, 2
  %niter105.ncmp.1 = icmp eq i32 %niter105.next.1, %unroll_iter104
  br i1 %niter105.ncmp.1, label %if.end.loopexit.unr-lcssa, label %for.body.lver.orig, !llvm.loop !20

for.body.ph:                                      ; preds = %for.body.lver.check
  %28 = sext i32 %mul7 to i64
  %29 = shl nsw i64 %28, 2
  %scevgep93 = getelementptr i8, ptr addrspace(1) %X.coerce, i64 %29
  %load_initial = load float, ptr addrspace(1) %scevgep93, align 4
  %scevgep94 = getelementptr i8, ptr addrspace(1) %B.coerce, i64 %29
  %load_initial95 = load float, ptr addrspace(1) %scevgep94, align 4
  %30 = add nsw i32 %n, -1
  %xtraiter = and i32 %30, 1
  %31 = icmp eq i32 %7, 0
  br i1 %31, label %for.body.epil.preheader, label %for.body.ph.new

for.body.ph.new:                                  ; preds = %for.body.ph
  %unroll_iter = and i32 %30, -2
  %invariant.op106 = add i32 1, %mul7
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.ph.new
  %store_forwarded96 = phi float [ %load_initial95, %for.body.ph.new ], [ %sub47.1, %for.body ]
  %store_forwarded = phi float [ %load_initial, %for.body.ph.new ], [ %sub23.1, %for.body ]
  %i2.088 = phi i32 [ 1, %for.body.ph.new ], [ %inc.1, %for.body ]
  %niter = phi i32 [ 0, %for.body.ph.new ], [ %niter.next.1, %for.body ]
  %add8 = add nsw i32 %i2.088, %mul7
  %idxprom = sext i32 %add8 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom
  %32 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %arrayidx16 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom
  %33 = load float, ptr addrspace(1) %arrayidx16, align 4, !tbaa !18
  %mul17 = fmul contract float %store_forwarded, %33
  %div = fdiv contract float %mul17, %store_forwarded96
  %sub23 = fsub contract float %32, %div
  store float %sub23, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %arrayidx31 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom
  %34 = load float, ptr addrspace(1) %arrayidx31, align 4, !tbaa !18
  %35 = load float, ptr addrspace(1) %arrayidx16, align 4, !tbaa !18
  %mul40 = fmul contract float %35, %35
  %div46 = fdiv contract float %mul40, %store_forwarded96
  %sub47 = fsub contract float %34, %div46
  store float %sub47, ptr addrspace(1) %arrayidx31, align 4, !tbaa !18
  %add8.1.reass = add i32 %i2.088, %invariant.op106
  %idxprom.1 = sext i32 %add8.1.reass to i64
  %arrayidx.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom.1
  %36 = load float, ptr addrspace(1) %arrayidx.1, align 4, !tbaa !18
  %arrayidx16.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.1
  %37 = load float, ptr addrspace(1) %arrayidx16.1, align 4, !tbaa !18
  %mul17.1 = fmul contract float %sub23, %37
  %div.1 = fdiv contract float %mul17.1, %sub47
  %sub23.1 = fsub contract float %36, %div.1
  store float %sub23.1, ptr addrspace(1) %arrayidx.1, align 4, !tbaa !18
  %arrayidx31.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.1
  %38 = load float, ptr addrspace(1) %arrayidx31.1, align 4, !tbaa !18
  %39 = load float, ptr addrspace(1) %arrayidx16.1, align 4, !tbaa !18
  %mul40.1 = fmul contract float %39, %39
  %div46.1 = fdiv contract float %mul40.1, %sub47
  %sub47.1 = fsub contract float %38, %div46.1
  store float %sub47.1, ptr addrspace(1) %arrayidx31.1, align 4, !tbaa !18
  %inc.1 = add nuw nsw i32 %i2.088, 2
  %niter.next.1 = add nuw i32 %niter, 2
  %niter.ncmp.1 = icmp eq i32 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %if.end.loopexit99.unr-lcssa, label %for.body, !llvm.loop !20

if.end.loopexit.unr-lcssa:                        ; preds = %for.body.lver.orig
  %lcmp.mod102.not = icmp eq i32 %xtraiter101, 0
  br i1 %lcmp.mod102.not, label %if.end, label %for.body.lver.orig.epil.preheader

for.body.lver.orig.epil.preheader:                ; preds = %if.end.loopexit.unr-lcssa, %for.body.lver.orig.preheader
  %i2.088.lver.orig.epil.init = phi i32 [ 1, %for.body.lver.orig.preheader ], [ %inc.lver.orig.1, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod103 = trunc i32 %12 to i1
  tail call void @llvm.assume(i1 %lcmp.mod103)
  %add8.lver.orig.epil = add nsw i32 %i2.088.lver.orig.epil.init, %mul7
  %idxprom.lver.orig.epil = sext i32 %add8.lver.orig.epil to i64
  %arrayidx.lver.orig.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom.lver.orig.epil
  %40 = load float, ptr addrspace(1) %arrayidx.lver.orig.epil, align 4, !tbaa !18
  %add10.reass.lver.orig.epil = add i32 %i2.088.lver.orig.epil.init, %invariant.op
  %idxprom11.lver.orig.epil = sext i32 %add10.reass.lver.orig.epil to i64
  %arrayidx12.lver.orig.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom11.lver.orig.epil
  %41 = load float, ptr addrspace(1) %arrayidx12.lver.orig.epil, align 4, !tbaa !18
  %arrayidx16.lver.orig.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.lver.orig.epil
  %42 = load float, ptr addrspace(1) %arrayidx16.lver.orig.epil, align 4, !tbaa !18
  %mul17.lver.orig.epil = fmul contract float %41, %42
  %arrayidx22.lver.orig.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom11.lver.orig.epil
  %43 = load float, ptr addrspace(1) %arrayidx22.lver.orig.epil, align 4, !tbaa !18
  %div.lver.orig.epil = fdiv contract float %mul17.lver.orig.epil, %43
  %sub23.lver.orig.epil = fsub contract float %40, %div.lver.orig.epil
  store float %sub23.lver.orig.epil, ptr addrspace(1) %arrayidx.lver.orig.epil, align 4, !tbaa !18
  %arrayidx31.lver.orig.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.lver.orig.epil
  %44 = load float, ptr addrspace(1) %arrayidx31.lver.orig.epil, align 4, !tbaa !18
  %45 = load float, ptr addrspace(1) %arrayidx16.lver.orig.epil, align 4, !tbaa !18
  %mul40.lver.orig.epil = fmul contract float %45, %45
  %46 = load float, ptr addrspace(1) %arrayidx22.lver.orig.epil, align 4, !tbaa !18
  %div46.lver.orig.epil = fdiv contract float %mul40.lver.orig.epil, %46
  %sub47.lver.orig.epil = fsub contract float %44, %div46.lver.orig.epil
  store float %sub47.lver.orig.epil, ptr addrspace(1) %arrayidx31.lver.orig.epil, align 4, !tbaa !18
  br label %if.end

if.end.loopexit99.unr-lcssa:                      ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit99.unr-lcssa, %for.body.ph
  %store_forwarded96.epil.init = phi float [ %load_initial95, %for.body.ph ], [ %sub47.1, %if.end.loopexit99.unr-lcssa ]
  %store_forwarded.epil.init = phi float [ %load_initial, %for.body.ph ], [ %sub23.1, %if.end.loopexit99.unr-lcssa ]
  %i2.088.epil.init = phi i32 [ 1, %for.body.ph ], [ %inc.1, %if.end.loopexit99.unr-lcssa ]
  %lcmp.mod100 = trunc i32 %30 to i1
  tail call void @llvm.assume(i1 %lcmp.mod100)
  %add8.epil = add nsw i32 %i2.088.epil.init, %mul7
  %idxprom.epil = sext i32 %add8.epil to i64
  %arrayidx.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom.epil
  %47 = load float, ptr addrspace(1) %arrayidx.epil, align 4, !tbaa !18
  %arrayidx16.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom.epil
  %48 = load float, ptr addrspace(1) %arrayidx16.epil, align 4, !tbaa !18
  %mul17.epil = fmul contract float %store_forwarded.epil.init, %48
  %div.epil = fdiv contract float %mul17.epil, %store_forwarded96.epil.init
  %sub23.epil = fsub contract float %47, %div.epil
  store float %sub23.epil, ptr addrspace(1) %arrayidx.epil, align 4, !tbaa !18
  %arrayidx31.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom.epil
  %49 = load float, ptr addrspace(1) %arrayidx31.epil, align 4, !tbaa !18
  %50 = load float, ptr addrspace(1) %arrayidx16.epil, align 4, !tbaa !18
  %mul40.epil = fmul contract float %50, %50
  %div46.epil = fdiv contract float %mul40.epil, %store_forwarded96.epil.init
  %sub47.epil = fsub contract float %49, %div46.epil
  store float %sub47.epil, ptr addrspace(1) %arrayidx31.epil, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %for.body.epil.preheader, %if.end.loopexit99.unr-lcssa, %for.body.lver.orig.epil.preheader, %if.end.loopexit.unr-lcssa, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11adi_kernel2iPfS_S_(i32 noundef %n, ptr addrspace(1) nofree noundef readnone captures(none) %A.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %B.coerce, ptr addrspace(1) nofree noundef captures(none) %X.coerce) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i23 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i23
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %4
  %cmp = icmp slt i32 %add, %n
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul6 = shl nsw i32 %add, 10
  %add7 = or disjoint i32 %mul6, 1023
  %idxprom = sext i32 %add7 to i64
  %arrayidx11 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom
  %5 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %6 = load float, ptr addrspace(1) %arrayidx11, align 4, !tbaa !18
  %div = fdiv contract float %5, %6
  store float %div, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11adi_kernel3iPfS_S_(i32 noundef %n, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %B.coerce, ptr addrspace(1) nofree noundef captures(none) %X.coerce) local_unnamed_addr #0 {
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
  %cmp659 = icmp sgt i32 %n, 2
  %or.cond = and i1 %cmp, %cmp659
  br i1 %or.cond, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %entry
  %mul7 = shl nsw i32 %add, 10
  %5 = add nsw i32 %n, -3
  %6 = add nsw i32 %n, -2
  %xtraiter = and i32 %6, 3
  %7 = icmp ult i32 %5, 3
  br i1 %7, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %6, -4
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %i2.060 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.3, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.3, %for.body ]
  %reass.sub = sub i32 %mul7, %i2.060
  %add9 = add i32 %reass.sub, 1022
  %idxprom = sext i32 %add9 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom
  %8 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %add13 = add i32 %reass.sub, 1021
  %idxprom14 = sext i32 %add13 to i64
  %arrayidx15 = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom14
  %9 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %arrayidx21 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom14
  %10 = load float, ptr addrspace(1) %arrayidx21, align 4, !tbaa !18
  %mul22 = fmul contract float %9, %10
  %sub23 = fsub contract float %8, %mul22
  %arrayidx28 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom14
  %11 = load float, ptr addrspace(1) %arrayidx28, align 4, !tbaa !18
  %div = fdiv contract float %sub23, %11
  store float %div, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.neg = xor i32 %i2.060, -1
  %reass.sub.1 = add i32 %mul7, %inc.neg
  %add9.1 = add i32 %reass.sub.1, 1022
  %idxprom.1 = sext i32 %add9.1 to i64
  %arrayidx.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom.1
  %add13.1 = add i32 %reass.sub.1, 1021
  %idxprom14.1 = sext i32 %add13.1 to i64
  %arrayidx15.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom14.1
  %12 = load float, ptr addrspace(1) %arrayidx15.1, align 4, !tbaa !18
  %arrayidx21.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom14.1
  %13 = load float, ptr addrspace(1) %arrayidx21.1, align 4, !tbaa !18
  %mul22.1 = fmul contract float %12, %13
  %sub23.1 = fsub contract float %9, %mul22.1
  %arrayidx28.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom14.1
  %14 = load float, ptr addrspace(1) %arrayidx28.1, align 4, !tbaa !18
  %div.1 = fdiv contract float %sub23.1, %14
  store float %div.1, ptr addrspace(1) %arrayidx.1, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %i2.060, 2
  %reass.sub.2 = sub i32 %mul7, %inc.1
  %add9.2 = add i32 %reass.sub.2, 1022
  %idxprom.2 = sext i32 %add9.2 to i64
  %arrayidx.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom.2
  %add13.2 = add i32 %reass.sub.2, 1021
  %idxprom14.2 = sext i32 %add13.2 to i64
  %arrayidx15.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom14.2
  %15 = load float, ptr addrspace(1) %arrayidx15.2, align 4, !tbaa !18
  %arrayidx21.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom14.2
  %16 = load float, ptr addrspace(1) %arrayidx21.2, align 4, !tbaa !18
  %mul22.2 = fmul contract float %15, %16
  %sub23.2 = fsub contract float %12, %mul22.2
  %arrayidx28.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom14.2
  %17 = load float, ptr addrspace(1) %arrayidx28.2, align 4, !tbaa !18
  %div.2 = fdiv contract float %sub23.2, %17
  store float %div.2, ptr addrspace(1) %arrayidx.2, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %i2.060, 3
  %reass.sub.3 = sub i32 %mul7, %inc.2
  %add9.3 = add i32 %reass.sub.3, 1022
  %idxprom.3 = sext i32 %add9.3 to i64
  %arrayidx.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom.3
  %add13.3 = add i32 %reass.sub.3, 1021
  %idxprom14.3 = sext i32 %add13.3 to i64
  %arrayidx15.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom14.3
  %18 = load float, ptr addrspace(1) %arrayidx15.3, align 4, !tbaa !18
  %arrayidx21.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom14.3
  %19 = load float, ptr addrspace(1) %arrayidx21.3, align 4, !tbaa !18
  %mul22.3 = fmul contract float %18, %19
  %sub23.3 = fsub contract float %15, %mul22.3
  %arrayidx28.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom14.3
  %20 = load float, ptr addrspace(1) %arrayidx28.3, align 4, !tbaa !18
  %div.3 = fdiv contract float %sub23.3, %20
  store float %div.3, ptr addrspace(1) %arrayidx.3, align 4, !tbaa !18
  %inc.3 = add nuw nsw i32 %i2.060, 4
  %niter.next.3 = add i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !22

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.lr.ph
  %i2.060.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.3, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod61 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod61)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %i2.060.epil = phi i32 [ %i2.060.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %reass.sub.epil = sub i32 %mul7, %i2.060.epil
  %add9.epil = add i32 %reass.sub.epil, 1022
  %idxprom.epil = sext i32 %add9.epil to i64
  %arrayidx.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom.epil
  %21 = load float, ptr addrspace(1) %arrayidx.epil, align 4, !tbaa !18
  %add13.epil = add i32 %reass.sub.epil, 1021
  %idxprom14.epil = sext i32 %add13.epil to i64
  %arrayidx15.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom14.epil
  %22 = load float, ptr addrspace(1) %arrayidx15.epil, align 4, !tbaa !18
  %arrayidx21.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom14.epil
  %23 = load float, ptr addrspace(1) %arrayidx21.epil, align 4, !tbaa !18
  %mul22.epil = fmul contract float %22, %23
  %sub23.epil = fsub contract float %21, %mul22.epil
  %arrayidx28.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom14.epil
  %24 = load float, ptr addrspace(1) %arrayidx28.epil, align 4, !tbaa !18
  %div.epil = fdiv contract float %sub23.epil, %24
  store float %div.epil, ptr addrspace(1) %arrayidx.epil, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %i2.060.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !23

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11adi_kernel4iPfS_S_i(i32 noundef %n, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef captures(none) %B.coerce, ptr addrspace(1) nofree noundef captures(none) %X.coerce, i32 noundef %i1) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i80 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i80
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %4
  %cmp = icmp slt i32 %add, %n
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul6 = shl nsw i32 %i1, 10
  %add7 = add nsw i32 %add, %mul6
  %idxprom = sext i32 %add7 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom
  %5 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul8 = add i32 %mul6, -1024
  %add9 = add nsw i32 %mul8, %add
  %idxprom10 = sext i32 %add9 to i64
  %arrayidx11 = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom10
  %6 = load float, ptr addrspace(1) %arrayidx11, align 4, !tbaa !18
  %arrayidx15 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %mul16 = fmul contract float %6, %7
  %arrayidx21 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom10
  %8 = load float, ptr addrspace(1) %arrayidx21, align 4, !tbaa !18
  %div = fdiv contract float %mul16, %8
  %sub22 = fsub contract float %5, %div
  store float %sub22, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %arrayidx30 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom
  %9 = load float, ptr addrspace(1) %arrayidx30, align 4, !tbaa !18
  %10 = load float, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  %mul39 = fmul contract float %10, %10
  %11 = load float, ptr addrspace(1) %arrayidx21, align 4, !tbaa !18
  %div45 = fdiv contract float %mul39, %11
  %sub46 = fsub contract float %9, %div45
  store float %sub46, ptr addrspace(1) %arrayidx30, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11adi_kernel5iPfS_S_(i32 noundef %n, ptr addrspace(1) nofree noundef readnone captures(none) %A.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %B.coerce, ptr addrspace(1) nofree noundef captures(none) %X.coerce) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i20 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i20
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %4
  %cmp = icmp slt i32 %add, %n
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %add6 = add nsw i32 %add, 1047552
  %idxprom = sext i32 %add6 to i64
  %arrayidx9 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom
  %5 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %6 = load float, ptr addrspace(1) %arrayidx9, align 4, !tbaa !18
  %div = fdiv contract float %5, %6
  store float %div, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11adi_kernel6iPfS_S_i(i32 noundef %n, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %B.coerce, ptr addrspace(1) nofree noundef captures(none) %X.coerce, i32 noundef %i1) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i47 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i47
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %4
  %cmp = icmp slt i32 %add, %n
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = shl i32 %i1, 10
  %reass.sub = sub i32 %add, %5
  %add7 = add i32 %reass.sub, 1046528
  %idxprom = sext i32 %add7 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom
  %6 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %add11 = add i32 %reass.sub, 1045504
  %idxprom12 = sext i32 %add11 to i64
  %arrayidx13 = getelementptr inbounds [4 x i8], ptr addrspace(1) %X.coerce, i64 %idxprom12
  %7 = load float, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom12
  %8 = load float, ptr addrspace(1) %arrayidx18, align 4, !tbaa !18
  %mul19 = fmul contract float %7, %8
  %sub20 = fsub contract float %6, %mul19
  %arrayidx25 = getelementptr inbounds [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom
  %9 = load float, ptr addrspace(1) %arrayidx25, align 4, !tbaa !18
  %div = fdiv contract float %sub20, %9
  store float %div, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
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
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
