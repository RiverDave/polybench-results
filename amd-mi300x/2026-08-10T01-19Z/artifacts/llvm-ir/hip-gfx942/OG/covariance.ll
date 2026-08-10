; ModuleID = '/root/polybenchGpu/HIP/COVAR/covariance.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/COVAR/covariance.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_a59199c157bcf31f = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_a59199c157bcf31f to ptr)], section "llvm.metadata"

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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z13reduce_kerneliiPfS_(i32 noundef %m, i32 noundef %n, ptr addrspace(1) nofree noundef readonly captures(none) %mean.coerce, ptr addrspace(1) nofree noundef captures(none) %data.coerce) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i24 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i24
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i33 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i30 = zext i16 %.in.i33 to i32
  %mul7 = mul i32 %4, %conv.i30
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add9 = add i32 %mul7, %6
  %cmp = icmp slt i32 %add9, %n
  %cmp10 = icmp slt i32 %add, %m
  %or.cond = and i1 %cmp10, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul11 = shl nsw i32 %add9, 11
  %add12 = add nsw i32 %mul11, %add
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom13
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %mean.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %8 = load float, ptr addrspace(1) %arrayidx14, align 4, !tbaa !18
  %sub = fsub contract float %8, %7
  store float %sub, ptr addrspace(1) %arrayidx14, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z12covar_kerneliiPfS_(i32 noundef %m, i32 noundef %n, ptr addrspace(1) nofree noundef writeonly captures(none) %symmat.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %data.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i59 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i59
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %cmp = icmp slt i32 %add, %m
  br i1 %cmp, label %for.cond.preheader, label %if.end

for.cond.preheader:                               ; preds = %entry
  %mul6 = shl nsw i32 %add, 11
  %cmp962 = icmp sgt i32 %n, 0
  %xtraiter = and i32 %n, 7
  %4 = icmp ult i32 %n, 8
  %unroll_iter = and i32 %n, 2147483640
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  %lcmp.mod67 = icmp ne i32 %xtraiter, 0
  br label %for.body

for.body:                                         ; preds = %for.cond.preheader, %for.end
  %j2.065 = phi i32 [ %add, %for.cond.preheader ], [ %inc34, %for.end ]
  %add7 = add nsw i32 %j2.065, %mul6
  %idxprom = sext i32 %add7 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %symmat.coerce, i64 %idxprom
  store float 0.000000e+00, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  br i1 %cmp962, label %for.body10.preheader, label %for.end

for.body10.preheader:                             ; preds = %for.body
  br i1 %4, label %for.body10.epil.preheader, label %for.body10

for.body10:                                       ; preds = %for.body10.preheader, %for.body10
  %add2464 = phi float [ %add24.7, %for.body10 ], [ 0.000000e+00, %for.body10.preheader ]
  %i.063 = phi i32 [ %inc.7, %for.body10 ], [ 0, %for.body10.preheader ]
  %niter = phi i32 [ %niter.next.7, %for.body10 ], [ 0, %for.body10.preheader ]
  %mul11 = shl nuw nsw i32 %i.063, 11
  %add12 = add nsw i32 %mul11, %add
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom13
  %5 = load float, ptr addrspace(1) %arrayidx14, align 4, !tbaa !18
  %add16 = add nsw i32 %mul11, %j2.065
  %idxprom17 = sext i32 %add16 to i64
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom17
  %6 = load float, ptr addrspace(1) %arrayidx18, align 4, !tbaa !18
  %mul19 = fmul contract float %5, %6
  %add24 = fadd contract float %add2464, %mul19
  store float %add24, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = shl i32 %i.063, 11
  %mul11.1 = or disjoint i32 %inc, 2048
  %add12.1 = add nsw i32 %mul11.1, %add
  %idxprom13.1 = sext i32 %add12.1 to i64
  %arrayidx14.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom13.1
  %7 = load float, ptr addrspace(1) %arrayidx14.1, align 4, !tbaa !18
  %add16.1 = add nsw i32 %mul11.1, %j2.065
  %idxprom17.1 = sext i32 %add16.1 to i64
  %arrayidx18.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom17.1
  %8 = load float, ptr addrspace(1) %arrayidx18.1, align 4, !tbaa !18
  %mul19.1 = fmul contract float %7, %8
  %add24.1 = fadd contract float %add24, %mul19.1
  store float %add24.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = shl i32 %i.063, 11
  %mul11.2 = or disjoint i32 %inc.1, 4096
  %add12.2 = add nsw i32 %mul11.2, %add
  %idxprom13.2 = sext i32 %add12.2 to i64
  %arrayidx14.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom13.2
  %9 = load float, ptr addrspace(1) %arrayidx14.2, align 4, !tbaa !18
  %add16.2 = add nsw i32 %mul11.2, %j2.065
  %idxprom17.2 = sext i32 %add16.2 to i64
  %arrayidx18.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom17.2
  %10 = load float, ptr addrspace(1) %arrayidx18.2, align 4, !tbaa !18
  %mul19.2 = fmul contract float %9, %10
  %add24.2 = fadd contract float %add24.1, %mul19.2
  store float %add24.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = shl i32 %i.063, 11
  %mul11.3 = or disjoint i32 %inc.2, 6144
  %add12.3 = add nsw i32 %mul11.3, %add
  %idxprom13.3 = sext i32 %add12.3 to i64
  %arrayidx14.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom13.3
  %11 = load float, ptr addrspace(1) %arrayidx14.3, align 4, !tbaa !18
  %add16.3 = add nsw i32 %mul11.3, %j2.065
  %idxprom17.3 = sext i32 %add16.3 to i64
  %arrayidx18.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom17.3
  %12 = load float, ptr addrspace(1) %arrayidx18.3, align 4, !tbaa !18
  %mul19.3 = fmul contract float %11, %12
  %add24.3 = fadd contract float %add24.2, %mul19.3
  store float %add24.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = shl i32 %i.063, 11
  %mul11.4 = or disjoint i32 %inc.3, 8192
  %add12.4 = add nsw i32 %mul11.4, %add
  %idxprom13.4 = sext i32 %add12.4 to i64
  %arrayidx14.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom13.4
  %13 = load float, ptr addrspace(1) %arrayidx14.4, align 4, !tbaa !18
  %add16.4 = add nsw i32 %mul11.4, %j2.065
  %idxprom17.4 = sext i32 %add16.4 to i64
  %arrayidx18.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom17.4
  %14 = load float, ptr addrspace(1) %arrayidx18.4, align 4, !tbaa !18
  %mul19.4 = fmul contract float %13, %14
  %add24.4 = fadd contract float %add24.3, %mul19.4
  store float %add24.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = shl i32 %i.063, 11
  %mul11.5 = or disjoint i32 %inc.4, 10240
  %add12.5 = add nsw i32 %mul11.5, %add
  %idxprom13.5 = sext i32 %add12.5 to i64
  %arrayidx14.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom13.5
  %15 = load float, ptr addrspace(1) %arrayidx14.5, align 4, !tbaa !18
  %add16.5 = add nsw i32 %mul11.5, %j2.065
  %idxprom17.5 = sext i32 %add16.5 to i64
  %arrayidx18.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom17.5
  %16 = load float, ptr addrspace(1) %arrayidx18.5, align 4, !tbaa !18
  %mul19.5 = fmul contract float %15, %16
  %add24.5 = fadd contract float %add24.4, %mul19.5
  store float %add24.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = shl i32 %i.063, 11
  %mul11.6 = or disjoint i32 %inc.5, 12288
  %add12.6 = add nsw i32 %mul11.6, %add
  %idxprom13.6 = sext i32 %add12.6 to i64
  %arrayidx14.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom13.6
  %17 = load float, ptr addrspace(1) %arrayidx14.6, align 4, !tbaa !18
  %add16.6 = add nsw i32 %mul11.6, %j2.065
  %idxprom17.6 = sext i32 %add16.6 to i64
  %arrayidx18.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom17.6
  %18 = load float, ptr addrspace(1) %arrayidx18.6, align 4, !tbaa !18
  %mul19.6 = fmul contract float %17, %18
  %add24.6 = fadd contract float %add24.5, %mul19.6
  store float %add24.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = shl i32 %i.063, 11
  %mul11.7 = or disjoint i32 %inc.6, 14336
  %add12.7 = add nsw i32 %mul11.7, %add
  %idxprom13.7 = sext i32 %add12.7 to i64
  %arrayidx14.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom13.7
  %19 = load float, ptr addrspace(1) %arrayidx14.7, align 4, !tbaa !18
  %add16.7 = add nsw i32 %mul11.7, %j2.065
  %idxprom17.7 = sext i32 %add16.7 to i64
  %arrayidx18.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom17.7
  %20 = load float, ptr addrspace(1) %arrayidx18.7, align 4, !tbaa !18
  %mul19.7 = fmul contract float %19, %20
  %add24.7 = fadd contract float %add24.6, %mul19.7
  store float %add24.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %i.063, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.end.loopexit.unr-lcssa, label %for.body10, !llvm.loop !24

for.end.loopexit.unr-lcssa:                       ; preds = %for.body10
  br i1 %lcmp.mod.not, label %for.end, label %for.body10.epil.preheader

for.body10.epil.preheader:                        ; preds = %for.end.loopexit.unr-lcssa, %for.body10.preheader
  %add2464.epil.init = phi float [ 0.000000e+00, %for.body10.preheader ], [ %add24.7, %for.end.loopexit.unr-lcssa ]
  %i.063.epil.init = phi i32 [ 0, %for.body10.preheader ], [ %inc.7, %for.end.loopexit.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod67)
  br label %for.body10.epil

for.body10.epil:                                  ; preds = %for.body10.epil, %for.body10.epil.preheader
  %add2464.epil = phi float [ %add24.epil, %for.body10.epil ], [ %add2464.epil.init, %for.body10.epil.preheader ]
  %i.063.epil = phi i32 [ %inc.epil, %for.body10.epil ], [ %i.063.epil.init, %for.body10.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body10.epil ], [ 0, %for.body10.epil.preheader ]
  %mul11.epil = shl nuw nsw i32 %i.063.epil, 11
  %add12.epil = add nsw i32 %mul11.epil, %add
  %idxprom13.epil = sext i32 %add12.epil to i64
  %arrayidx14.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom13.epil
  %21 = load float, ptr addrspace(1) %arrayidx14.epil, align 4, !tbaa !18
  %add16.epil = add nsw i32 %mul11.epil, %j2.065
  %idxprom17.epil = sext i32 %add16.epil to i64
  %arrayidx18.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %data.coerce, i64 %idxprom17.epil
  %22 = load float, ptr addrspace(1) %arrayidx18.epil, align 4, !tbaa !18
  %mul19.epil = fmul contract float %21, %22
  %add24.epil = fadd contract float %add2464.epil, %mul19.epil
  store float %add24.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %i.063.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body10.epil, !llvm.loop !25

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body10.epil, %for.body
  %23 = phi float [ 0.000000e+00, %for.body ], [ %add24.7, %for.end.loopexit.unr-lcssa ], [ %add24.epil, %for.body10.epil ]
  %mul29 = shl nsw i32 %j2.065, 11
  %add30 = add nsw i32 %mul29, %add
  %idxprom31 = sext i32 %add30 to i64
  %arrayidx32 = getelementptr inbounds [4 x i8], ptr addrspace(1) %symmat.coerce, i64 %idxprom31
  store float %23, ptr addrspace(1) %arrayidx32, align 4, !tbaa !18
  %inc34 = add nsw i32 %j2.065, 1
  %cmp5 = icmp slt i32 %inc34, %m
  br i1 %cmp5, label %for.body, label %if.end, !llvm.loop !26

if.end:                                           ; preds = %for.end, %entry
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

attributes #0 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
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
!26 = distinct !{!26, !21}
