; ModuleID = '/root/polybenchGpu/HIP/GRAMSCHM/gramschmidt.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/GRAMSCHM/gramschmidt.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_1733ca7ff7685be0 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_1733ca7ff7685be0 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z19gramschmidt_kernel1iiPfS_S_i(i32 noundef %ni, i32 noundef %nj, ptr addrspace(1) nofree noundef readonly captures(none) %a.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %r.coerce, ptr addrspace(1) nofree noundef readnone captures(none) %q.coerce, i32 noundef %k) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i32 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i32
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = sub nsw i32 0, %4
  %cmp = icmp eq i32 %mul, %add
  br i1 %cmp, label %for.cond.preheader, label %if.end

for.cond.preheader:                               ; preds = %entry
  %cmp635 = icmp sgt i32 %ni, 0
  br i1 %cmp635, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %for.cond.preheader
  %xtraiter = and i32 %ni, 7
  %5 = icmp ult i32 %ni, 8
  br i1 %5, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %ni, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %i.037 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %nrm.036 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add14.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %mul7 = shl nuw nsw i32 %i.037, 11
  %add8 = add nsw i32 %mul7, %k
  %idxprom = sext i32 %add8 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom
  %6 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul13 = fmul contract float %6, %6
  %add14 = fadd contract float %nrm.036, %mul13
  %inc = shl i32 %i.037, 11
  %mul7.1 = or disjoint i32 %inc, 2048
  %add8.1 = add nsw i32 %mul7.1, %k
  %idxprom.1 = sext i32 %add8.1 to i64
  %arrayidx.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.1
  %7 = load float, ptr addrspace(1) %arrayidx.1, align 4, !tbaa !18
  %mul13.1 = fmul contract float %7, %7
  %add14.1 = fadd contract float %add14, %mul13.1
  %inc.1 = shl i32 %i.037, 11
  %mul7.2 = or disjoint i32 %inc.1, 4096
  %add8.2 = add nsw i32 %mul7.2, %k
  %idxprom.2 = sext i32 %add8.2 to i64
  %arrayidx.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.2
  %8 = load float, ptr addrspace(1) %arrayidx.2, align 4, !tbaa !18
  %mul13.2 = fmul contract float %8, %8
  %add14.2 = fadd contract float %add14.1, %mul13.2
  %inc.2 = shl i32 %i.037, 11
  %mul7.3 = or disjoint i32 %inc.2, 6144
  %add8.3 = add nsw i32 %mul7.3, %k
  %idxprom.3 = sext i32 %add8.3 to i64
  %arrayidx.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.3
  %9 = load float, ptr addrspace(1) %arrayidx.3, align 4, !tbaa !18
  %mul13.3 = fmul contract float %9, %9
  %add14.3 = fadd contract float %add14.2, %mul13.3
  %inc.3 = shl i32 %i.037, 11
  %mul7.4 = or disjoint i32 %inc.3, 8192
  %add8.4 = add nsw i32 %mul7.4, %k
  %idxprom.4 = sext i32 %add8.4 to i64
  %arrayidx.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.4
  %10 = load float, ptr addrspace(1) %arrayidx.4, align 4, !tbaa !18
  %mul13.4 = fmul contract float %10, %10
  %add14.4 = fadd contract float %add14.3, %mul13.4
  %inc.4 = shl i32 %i.037, 11
  %mul7.5 = or disjoint i32 %inc.4, 10240
  %add8.5 = add nsw i32 %mul7.5, %k
  %idxprom.5 = sext i32 %add8.5 to i64
  %arrayidx.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.5
  %11 = load float, ptr addrspace(1) %arrayidx.5, align 4, !tbaa !18
  %mul13.5 = fmul contract float %11, %11
  %add14.5 = fadd contract float %add14.4, %mul13.5
  %inc.5 = shl i32 %i.037, 11
  %mul7.6 = or disjoint i32 %inc.5, 12288
  %add8.6 = add nsw i32 %mul7.6, %k
  %idxprom.6 = sext i32 %add8.6 to i64
  %arrayidx.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.6
  %12 = load float, ptr addrspace(1) %arrayidx.6, align 4, !tbaa !18
  %mul13.6 = fmul contract float %12, %12
  %add14.6 = fadd contract float %add14.5, %mul13.6
  %inc.6 = shl i32 %i.037, 11
  %mul7.7 = or disjoint i32 %inc.6, 14336
  %add8.7 = add nsw i32 %mul7.7, %k
  %idxprom.7 = sext i32 %add8.7 to i64
  %arrayidx.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.7
  %13 = load float, ptr addrspace(1) %arrayidx.7, align 4, !tbaa !18
  %mul13.7 = fmul contract float %13, %13
  %add14.7 = fadd contract float %add14.6, %mul13.7
  %inc.7 = add nuw nsw i32 %i.037, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !20

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.end.loopexit, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.preheader
  %i.037.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %for.end.loopexit.unr-lcssa ]
  %nrm.036.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add14.7, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod39 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod39)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %i.037.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %i.037.epil.init, %for.body.epil.preheader ]
  %nrm.036.epil = phi float [ %add14.epil, %for.body.epil ], [ %nrm.036.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %mul7.epil = shl nuw nsw i32 %i.037.epil, 11
  %add8.epil = add nsw i32 %mul7.epil, %k
  %idxprom.epil = sext i32 %add8.epil to i64
  %arrayidx.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom.epil
  %14 = load float, ptr addrspace(1) %arrayidx.epil, align 4, !tbaa !18
  %mul13.epil = fmul contract float %14, %14
  %add14.epil = fadd contract float %nrm.036.epil, %mul13.epil
  %inc.epil = add nuw nsw i32 %i.037.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end.loopexit, label %for.body.epil, !llvm.loop !22

for.end.loopexit:                                 ; preds = %for.body.epil, %for.end.loopexit.unr-lcssa
  %add14.lcssa = phi float [ %add14.7, %for.end.loopexit.unr-lcssa ], [ %add14.epil, %for.body.epil ]
  %15 = tail call contract float @llvm.sqrt.f32(float %add14.lcssa)
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond.preheader
  %nrm.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %15, %for.end.loopexit ]
  %add17 = mul nsw i32 %k, 2049
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [4 x i8], ptr addrspace(1) %r.coerce, i64 %idxprom18
  store float %nrm.0.lcssa, ptr addrspace(1) %arrayidx19, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z19gramschmidt_kernel2iiPfS_S_i(i32 noundef %ni, i32 noundef %nj, ptr addrspace(1) nofree noundef readonly captures(none) %a.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %r.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %q.coerce, i32 noundef %k) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i24 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i24
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %4
  %cmp = icmp slt i32 %add, %ni
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul6 = shl nsw i32 %add, 11
  %add7 = add nsw i32 %mul6, %k
  %idxprom = sext i32 %add7 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom
  %5 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %add9 = mul nsw i32 %k, 2049
  %idxprom10 = sext i32 %add9 to i64
  %arrayidx11 = getelementptr inbounds [4 x i8], ptr addrspace(1) %r.coerce, i64 %idxprom10
  %6 = load float, ptr addrspace(1) %arrayidx11, align 4, !tbaa !18
  %div = fdiv contract float %5, %6
  %arrayidx15 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom
  store float %div, ptr addrspace(1) %arrayidx15, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z19gramschmidt_kernel3iiPfS_S_i(i32 noundef %ni, i32 noundef %nj, ptr addrspace(1) nofree noundef captures(none) %a.coerce, ptr addrspace(1) nofree noundef captures(none) %r.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %q.coerce, i32 noundef %k) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %3 = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i69 = zext i16 %3 to i32
  %mul = mul i32 %0, %conv.i69
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %4
  %cmp = icmp sgt i32 %add, %k
  %cmp6 = icmp slt i32 %add, %nj
  %or.cond = and i1 %cmp, %cmp6
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul7 = shl nsw i32 %k, 11
  %add8 = add nsw i32 %add, %mul7
  %idxprom = sext i32 %add8 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %r.coerce, i64 %idxprom
  store float 0.000000e+00, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %cmp972 = icmp sgt i32 %ni, 0
  br i1 %cmp972, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %ni, 7
  %5 = icmp ult i32 %ni, 8
  br i1 %5, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %ni, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %add2374 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add23.7, %for.body ]
  %i.073 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %mul10 = shl nuw nsw i32 %i.073, 11
  %add11 = add nsw i32 %mul10, %k
  %idxprom12 = sext i32 %add11 to i64
  %arrayidx13 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom12
  %6 = load float, ptr addrspace(1) %arrayidx13, align 4, !tbaa !18
  %add15 = add nsw i32 %mul10, %add
  %idxprom16 = sext i32 %add15 to i64
  %arrayidx17 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom16
  %7 = load float, ptr addrspace(1) %arrayidx17, align 4, !tbaa !18
  %mul18 = fmul contract float %6, %7
  %add23 = fadd contract float %add2374, %mul18
  store float %add23, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = shl i32 %i.073, 11
  %mul10.1 = or disjoint i32 %inc, 2048
  %add11.1 = add nsw i32 %mul10.1, %k
  %idxprom12.1 = sext i32 %add11.1 to i64
  %arrayidx13.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom12.1
  %8 = load float, ptr addrspace(1) %arrayidx13.1, align 4, !tbaa !18
  %add15.1 = add nsw i32 %mul10.1, %add
  %idxprom16.1 = sext i32 %add15.1 to i64
  %arrayidx17.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom16.1
  %9 = load float, ptr addrspace(1) %arrayidx17.1, align 4, !tbaa !18
  %mul18.1 = fmul contract float %8, %9
  %add23.1 = fadd contract float %add23, %mul18.1
  store float %add23.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = shl i32 %i.073, 11
  %mul10.2 = or disjoint i32 %inc.1, 4096
  %add11.2 = add nsw i32 %mul10.2, %k
  %idxprom12.2 = sext i32 %add11.2 to i64
  %arrayidx13.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom12.2
  %10 = load float, ptr addrspace(1) %arrayidx13.2, align 4, !tbaa !18
  %add15.2 = add nsw i32 %mul10.2, %add
  %idxprom16.2 = sext i32 %add15.2 to i64
  %arrayidx17.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom16.2
  %11 = load float, ptr addrspace(1) %arrayidx17.2, align 4, !tbaa !18
  %mul18.2 = fmul contract float %10, %11
  %add23.2 = fadd contract float %add23.1, %mul18.2
  store float %add23.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = shl i32 %i.073, 11
  %mul10.3 = or disjoint i32 %inc.2, 6144
  %add11.3 = add nsw i32 %mul10.3, %k
  %idxprom12.3 = sext i32 %add11.3 to i64
  %arrayidx13.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom12.3
  %12 = load float, ptr addrspace(1) %arrayidx13.3, align 4, !tbaa !18
  %add15.3 = add nsw i32 %mul10.3, %add
  %idxprom16.3 = sext i32 %add15.3 to i64
  %arrayidx17.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom16.3
  %13 = load float, ptr addrspace(1) %arrayidx17.3, align 4, !tbaa !18
  %mul18.3 = fmul contract float %12, %13
  %add23.3 = fadd contract float %add23.2, %mul18.3
  store float %add23.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = shl i32 %i.073, 11
  %mul10.4 = or disjoint i32 %inc.3, 8192
  %add11.4 = add nsw i32 %mul10.4, %k
  %idxprom12.4 = sext i32 %add11.4 to i64
  %arrayidx13.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom12.4
  %14 = load float, ptr addrspace(1) %arrayidx13.4, align 4, !tbaa !18
  %add15.4 = add nsw i32 %mul10.4, %add
  %idxprom16.4 = sext i32 %add15.4 to i64
  %arrayidx17.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom16.4
  %15 = load float, ptr addrspace(1) %arrayidx17.4, align 4, !tbaa !18
  %mul18.4 = fmul contract float %14, %15
  %add23.4 = fadd contract float %add23.3, %mul18.4
  store float %add23.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = shl i32 %i.073, 11
  %mul10.5 = or disjoint i32 %inc.4, 10240
  %add11.5 = add nsw i32 %mul10.5, %k
  %idxprom12.5 = sext i32 %add11.5 to i64
  %arrayidx13.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom12.5
  %16 = load float, ptr addrspace(1) %arrayidx13.5, align 4, !tbaa !18
  %add15.5 = add nsw i32 %mul10.5, %add
  %idxprom16.5 = sext i32 %add15.5 to i64
  %arrayidx17.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom16.5
  %17 = load float, ptr addrspace(1) %arrayidx17.5, align 4, !tbaa !18
  %mul18.5 = fmul contract float %16, %17
  %add23.5 = fadd contract float %add23.4, %mul18.5
  store float %add23.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = shl i32 %i.073, 11
  %mul10.6 = or disjoint i32 %inc.5, 12288
  %add11.6 = add nsw i32 %mul10.6, %k
  %idxprom12.6 = sext i32 %add11.6 to i64
  %arrayidx13.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom12.6
  %18 = load float, ptr addrspace(1) %arrayidx13.6, align 4, !tbaa !18
  %add15.6 = add nsw i32 %mul10.6, %add
  %idxprom16.6 = sext i32 %add15.6 to i64
  %arrayidx17.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom16.6
  %19 = load float, ptr addrspace(1) %arrayidx17.6, align 4, !tbaa !18
  %mul18.6 = fmul contract float %18, %19
  %add23.6 = fadd contract float %add23.5, %mul18.6
  store float %add23.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = shl i32 %i.073, 11
  %mul10.7 = or disjoint i32 %inc.6, 14336
  %add11.7 = add nsw i32 %mul10.7, %k
  %idxprom12.7 = sext i32 %add11.7 to i64
  %arrayidx13.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom12.7
  %20 = load float, ptr addrspace(1) %arrayidx13.7, align 4, !tbaa !18
  %add15.7 = add nsw i32 %mul10.7, %add
  %idxprom16.7 = sext i32 %add15.7 to i64
  %arrayidx17.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom16.7
  %21 = load float, ptr addrspace(1) %arrayidx17.7, align 4, !tbaa !18
  %mul18.7 = fmul contract float %20, %21
  %add23.7 = fadd contract float %add23.6, %mul18.7
  store float %add23.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %i.073, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.body26.preheader.unr-lcssa, label %for.body, !llvm.loop !24

for.body26.preheader.unr-lcssa:                   ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body26.preheader, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.body26.preheader.unr-lcssa, %for.body.preheader
  %add2374.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add23.7, %for.body26.preheader.unr-lcssa ]
  %i.073.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %for.body26.preheader.unr-lcssa ]
  %lcmp.mod78 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod78)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add2374.epil = phi float [ %add23.epil, %for.body.epil ], [ %add2374.epil.init, %for.body.epil.preheader ]
  %i.073.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %i.073.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %mul10.epil = shl nuw nsw i32 %i.073.epil, 11
  %add11.epil = add nsw i32 %mul10.epil, %k
  %idxprom12.epil = sext i32 %add11.epil to i64
  %arrayidx13.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom12.epil
  %22 = load float, ptr addrspace(1) %arrayidx13.epil, align 4, !tbaa !18
  %add15.epil = add nsw i32 %mul10.epil, %add
  %idxprom16.epil = sext i32 %add15.epil to i64
  %arrayidx17.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom16.epil
  %23 = load float, ptr addrspace(1) %arrayidx17.epil, align 4, !tbaa !18
  %mul18.epil = fmul contract float %22, %23
  %add23.epil = fadd contract float %add2374.epil, %mul18.epil
  store float %add23.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %i.073.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.body26.preheader, label %for.body.epil, !llvm.loop !25

for.body26.preheader:                             ; preds = %for.body.epil, %for.body26.preheader.unr-lcssa
  %xtraiter79 = and i32 %ni, 7
  %24 = icmp ult i32 %ni, 8
  br i1 %24, label %for.body26.epil.preheader, label %for.body26.preheader.new

for.body26.preheader.new:                         ; preds = %for.body26.preheader
  %unroll_iter83 = and i32 %ni, 2147483640
  br label %for.body26

for.body26:                                       ; preds = %for.body26, %for.body26.preheader.new
  %i.176 = phi i32 [ 0, %for.body26.preheader.new ], [ %inc41.7, %for.body26 ]
  %niter84 = phi i32 [ 0, %for.body26.preheader.new ], [ %niter84.next.7, %for.body26 ]
  %mul27 = shl nuw nsw i32 %i.176, 11
  %add28 = add nsw i32 %mul27, %k
  %idxprom29 = sext i32 %add28 to i64
  %arrayidx30 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom29
  %25 = load float, ptr addrspace(1) %arrayidx30, align 4, !tbaa !18
  %26 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul35 = fmul contract float %25, %26
  %add37 = add nsw i32 %mul27, %add
  %idxprom38 = sext i32 %add37 to i64
  %arrayidx39 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom38
  %27 = load float, ptr addrspace(1) %arrayidx39, align 4, !tbaa !18
  %sub = fsub contract float %27, %mul35
  store float %sub, ptr addrspace(1) %arrayidx39, align 4, !tbaa !18
  %inc41 = shl i32 %i.176, 11
  %mul27.1 = or disjoint i32 %inc41, 2048
  %add28.1 = add nsw i32 %mul27.1, %k
  %idxprom29.1 = sext i32 %add28.1 to i64
  %arrayidx30.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom29.1
  %28 = load float, ptr addrspace(1) %arrayidx30.1, align 4, !tbaa !18
  %29 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul35.1 = fmul contract float %28, %29
  %add37.1 = add nsw i32 %mul27.1, %add
  %idxprom38.1 = sext i32 %add37.1 to i64
  %arrayidx39.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom38.1
  %30 = load float, ptr addrspace(1) %arrayidx39.1, align 4, !tbaa !18
  %sub.1 = fsub contract float %30, %mul35.1
  store float %sub.1, ptr addrspace(1) %arrayidx39.1, align 4, !tbaa !18
  %inc41.1 = shl i32 %i.176, 11
  %mul27.2 = or disjoint i32 %inc41.1, 4096
  %add28.2 = add nsw i32 %mul27.2, %k
  %idxprom29.2 = sext i32 %add28.2 to i64
  %arrayidx30.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom29.2
  %31 = load float, ptr addrspace(1) %arrayidx30.2, align 4, !tbaa !18
  %32 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul35.2 = fmul contract float %31, %32
  %add37.2 = add nsw i32 %mul27.2, %add
  %idxprom38.2 = sext i32 %add37.2 to i64
  %arrayidx39.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom38.2
  %33 = load float, ptr addrspace(1) %arrayidx39.2, align 4, !tbaa !18
  %sub.2 = fsub contract float %33, %mul35.2
  store float %sub.2, ptr addrspace(1) %arrayidx39.2, align 4, !tbaa !18
  %inc41.2 = shl i32 %i.176, 11
  %mul27.3 = or disjoint i32 %inc41.2, 6144
  %add28.3 = add nsw i32 %mul27.3, %k
  %idxprom29.3 = sext i32 %add28.3 to i64
  %arrayidx30.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom29.3
  %34 = load float, ptr addrspace(1) %arrayidx30.3, align 4, !tbaa !18
  %35 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul35.3 = fmul contract float %34, %35
  %add37.3 = add nsw i32 %mul27.3, %add
  %idxprom38.3 = sext i32 %add37.3 to i64
  %arrayidx39.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom38.3
  %36 = load float, ptr addrspace(1) %arrayidx39.3, align 4, !tbaa !18
  %sub.3 = fsub contract float %36, %mul35.3
  store float %sub.3, ptr addrspace(1) %arrayidx39.3, align 4, !tbaa !18
  %inc41.3 = shl i32 %i.176, 11
  %mul27.4 = or disjoint i32 %inc41.3, 8192
  %add28.4 = add nsw i32 %mul27.4, %k
  %idxprom29.4 = sext i32 %add28.4 to i64
  %arrayidx30.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom29.4
  %37 = load float, ptr addrspace(1) %arrayidx30.4, align 4, !tbaa !18
  %38 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul35.4 = fmul contract float %37, %38
  %add37.4 = add nsw i32 %mul27.4, %add
  %idxprom38.4 = sext i32 %add37.4 to i64
  %arrayidx39.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom38.4
  %39 = load float, ptr addrspace(1) %arrayidx39.4, align 4, !tbaa !18
  %sub.4 = fsub contract float %39, %mul35.4
  store float %sub.4, ptr addrspace(1) %arrayidx39.4, align 4, !tbaa !18
  %inc41.4 = shl i32 %i.176, 11
  %mul27.5 = or disjoint i32 %inc41.4, 10240
  %add28.5 = add nsw i32 %mul27.5, %k
  %idxprom29.5 = sext i32 %add28.5 to i64
  %arrayidx30.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom29.5
  %40 = load float, ptr addrspace(1) %arrayidx30.5, align 4, !tbaa !18
  %41 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul35.5 = fmul contract float %40, %41
  %add37.5 = add nsw i32 %mul27.5, %add
  %idxprom38.5 = sext i32 %add37.5 to i64
  %arrayidx39.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom38.5
  %42 = load float, ptr addrspace(1) %arrayidx39.5, align 4, !tbaa !18
  %sub.5 = fsub contract float %42, %mul35.5
  store float %sub.5, ptr addrspace(1) %arrayidx39.5, align 4, !tbaa !18
  %inc41.5 = shl i32 %i.176, 11
  %mul27.6 = or disjoint i32 %inc41.5, 12288
  %add28.6 = add nsw i32 %mul27.6, %k
  %idxprom29.6 = sext i32 %add28.6 to i64
  %arrayidx30.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom29.6
  %43 = load float, ptr addrspace(1) %arrayidx30.6, align 4, !tbaa !18
  %44 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul35.6 = fmul contract float %43, %44
  %add37.6 = add nsw i32 %mul27.6, %add
  %idxprom38.6 = sext i32 %add37.6 to i64
  %arrayidx39.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom38.6
  %45 = load float, ptr addrspace(1) %arrayidx39.6, align 4, !tbaa !18
  %sub.6 = fsub contract float %45, %mul35.6
  store float %sub.6, ptr addrspace(1) %arrayidx39.6, align 4, !tbaa !18
  %inc41.6 = shl i32 %i.176, 11
  %mul27.7 = or disjoint i32 %inc41.6, 14336
  %add28.7 = add nsw i32 %mul27.7, %k
  %idxprom29.7 = sext i32 %add28.7 to i64
  %arrayidx30.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom29.7
  %46 = load float, ptr addrspace(1) %arrayidx30.7, align 4, !tbaa !18
  %47 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul35.7 = fmul contract float %46, %47
  %add37.7 = add nsw i32 %mul27.7, %add
  %idxprom38.7 = sext i32 %add37.7 to i64
  %arrayidx39.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom38.7
  %48 = load float, ptr addrspace(1) %arrayidx39.7, align 4, !tbaa !18
  %sub.7 = fsub contract float %48, %mul35.7
  store float %sub.7, ptr addrspace(1) %arrayidx39.7, align 4, !tbaa !18
  %inc41.7 = add nuw nsw i32 %i.176, 8
  %niter84.next.7 = add i32 %niter84, 8
  %niter84.ncmp.7 = icmp eq i32 %niter84.next.7, %unroll_iter83
  br i1 %niter84.ncmp.7, label %if.end.loopexit.unr-lcssa, label %for.body26, !llvm.loop !26

if.end.loopexit.unr-lcssa:                        ; preds = %for.body26
  %lcmp.mod81.not = icmp eq i32 %xtraiter79, 0
  br i1 %lcmp.mod81.not, label %if.end, label %for.body26.epil.preheader

for.body26.epil.preheader:                        ; preds = %if.end.loopexit.unr-lcssa, %for.body26.preheader
  %i.176.epil.init = phi i32 [ 0, %for.body26.preheader ], [ %inc41.7, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod82 = icmp ne i32 %xtraiter79, 0
  tail call void @llvm.assume(i1 %lcmp.mod82)
  br label %for.body26.epil

for.body26.epil:                                  ; preds = %for.body26.epil, %for.body26.epil.preheader
  %i.176.epil = phi i32 [ %inc41.epil, %for.body26.epil ], [ %i.176.epil.init, %for.body26.epil.preheader ]
  %epil.iter80 = phi i32 [ %epil.iter80.next, %for.body26.epil ], [ 0, %for.body26.epil.preheader ]
  %mul27.epil = shl nuw nsw i32 %i.176.epil, 11
  %add28.epil = add nsw i32 %mul27.epil, %k
  %idxprom29.epil = sext i32 %add28.epil to i64
  %arrayidx30.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %q.coerce, i64 %idxprom29.epil
  %49 = load float, ptr addrspace(1) %arrayidx30.epil, align 4, !tbaa !18
  %50 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul35.epil = fmul contract float %49, %50
  %add37.epil = add nsw i32 %mul27.epil, %add
  %idxprom38.epil = sext i32 %add37.epil to i64
  %arrayidx39.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom38.epil
  %51 = load float, ptr addrspace(1) %arrayidx39.epil, align 4, !tbaa !18
  %sub.epil = fsub contract float %51, %mul35.epil
  store float %sub.epil, ptr addrspace(1) %arrayidx39.epil, align 4, !tbaa !18
  %inc41.epil = add nuw nsw i32 %i.176.epil, 1
  %epil.iter80.next = add i32 %epil.iter80, 1
  %epil.iter80.cmp.not = icmp eq i32 %epil.iter80.next, %xtraiter79
  br i1 %epil.iter80.cmp.not, label %if.end, label %for.body26.epil, !llvm.loop !27

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body26.epil, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #4

attributes #0 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
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
