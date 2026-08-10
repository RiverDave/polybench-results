; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/CORR/correlation.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/CORR/correlation.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11mean_kerneliiPfS_(i32 noundef %m, i32 noundef %n, ptr nofree noundef writeonly captures(none) %mean, ptr nofree noundef readonly captures(none) %data) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %m
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %mean, i64 %idxprom
  store float 0.000000e+00, ptr %arrayidx, align 4, !tbaa !11
  %cmp321 = icmp sgt i32 %n, 0
  br i1 %cmp321, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %n, 7
  %3 = icmp ult i32 %n, 8
  br i1 %3, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %n, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %4 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add10.7, %for.body ]
  %i.022 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %mul4 = shl nuw nsw i32 %i.022, 11
  %add5 = add nsw i32 %mul4, %add
  %idxprom6 = sext i32 %add5 to i64
  %arrayidx7 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6
  %5 = load float, ptr %arrayidx7, align 4, !tbaa !11
  %add10 = fadd contract float %5, %4
  store float %add10, ptr %arrayidx, align 4, !tbaa !11
  %inc = shl i32 %i.022, 11
  %mul4.1 = or disjoint i32 %inc, 2048
  %add5.1 = add nsw i32 %mul4.1, %add
  %idxprom6.1 = sext i32 %add5.1 to i64
  %arrayidx7.1 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6.1
  %6 = load float, ptr %arrayidx7.1, align 4, !tbaa !11
  %add10.1 = fadd contract float %6, %add10
  store float %add10.1, ptr %arrayidx, align 4, !tbaa !11
  %inc.1 = shl i32 %i.022, 11
  %mul4.2 = or disjoint i32 %inc.1, 4096
  %add5.2 = add nsw i32 %mul4.2, %add
  %idxprom6.2 = sext i32 %add5.2 to i64
  %arrayidx7.2 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6.2
  %7 = load float, ptr %arrayidx7.2, align 4, !tbaa !11
  %add10.2 = fadd contract float %7, %add10.1
  store float %add10.2, ptr %arrayidx, align 4, !tbaa !11
  %inc.2 = shl i32 %i.022, 11
  %mul4.3 = or disjoint i32 %inc.2, 6144
  %add5.3 = add nsw i32 %mul4.3, %add
  %idxprom6.3 = sext i32 %add5.3 to i64
  %arrayidx7.3 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6.3
  %8 = load float, ptr %arrayidx7.3, align 4, !tbaa !11
  %add10.3 = fadd contract float %8, %add10.2
  store float %add10.3, ptr %arrayidx, align 4, !tbaa !11
  %inc.3 = shl i32 %i.022, 11
  %mul4.4 = or disjoint i32 %inc.3, 8192
  %add5.4 = add nsw i32 %mul4.4, %add
  %idxprom6.4 = sext i32 %add5.4 to i64
  %arrayidx7.4 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6.4
  %9 = load float, ptr %arrayidx7.4, align 4, !tbaa !11
  %add10.4 = fadd contract float %9, %add10.3
  store float %add10.4, ptr %arrayidx, align 4, !tbaa !11
  %inc.4 = shl i32 %i.022, 11
  %mul4.5 = or disjoint i32 %inc.4, 10240
  %add5.5 = add nsw i32 %mul4.5, %add
  %idxprom6.5 = sext i32 %add5.5 to i64
  %arrayidx7.5 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6.5
  %10 = load float, ptr %arrayidx7.5, align 4, !tbaa !11
  %add10.5 = fadd contract float %10, %add10.4
  store float %add10.5, ptr %arrayidx, align 4, !tbaa !11
  %inc.5 = shl i32 %i.022, 11
  %mul4.6 = or disjoint i32 %inc.5, 12288
  %add5.6 = add nsw i32 %mul4.6, %add
  %idxprom6.6 = sext i32 %add5.6 to i64
  %arrayidx7.6 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6.6
  %11 = load float, ptr %arrayidx7.6, align 4, !tbaa !11
  %add10.6 = fadd contract float %11, %add10.5
  store float %add10.6, ptr %arrayidx, align 4, !tbaa !11
  %inc.6 = shl i32 %i.022, 11
  %mul4.7 = or disjoint i32 %inc.6, 14336
  %add5.7 = add nsw i32 %mul4.7, %add
  %idxprom6.7 = sext i32 %add5.7 to i64
  %arrayidx7.7 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6.7
  %12 = load float, ptr %arrayidx7.7, align 4, !tbaa !11
  %add10.7 = fadd contract float %12, %add10.6
  store float %add10.7, ptr %arrayidx, align 4, !tbaa !11
  %inc.7 = add nuw nsw i32 %i.022, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !13

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.preheader
  %.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add10.7, %for.end.loopexit.unr-lcssa ]
  %i.022.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod24 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod24)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %13 = phi float [ %add10.epil, %for.body.epil ], [ %.epil.init, %for.body.epil.preheader ]
  %i.022.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %i.022.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %mul4.epil = shl nuw nsw i32 %i.022.epil, 11
  %add5.epil = add nsw i32 %mul4.epil, %add
  %idxprom6.epil = sext i32 %add5.epil to i64
  %arrayidx7.epil = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6.epil
  %14 = load float, ptr %arrayidx7.epil, align 4, !tbaa !11
  %add10.epil = fadd contract float %14, %13
  store float %add10.epil, ptr %arrayidx, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %i.022.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body.epil, !llvm.loop !15

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil, %if.then
  %15 = phi float [ 0.000000e+00, %if.then ], [ %add10.7, %for.end.loopexit.unr-lcssa ], [ %add10.epil, %for.body.epil ]
  %div = fdiv contract float %15, f0x4A442E10
  store float %div, ptr %arrayidx, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z10std_kerneliiPfS_S_(i32 noundef %m, i32 noundef %n, ptr nofree noundef readonly captures(none) %mean, ptr nofree noundef writeonly captures(none) %std, ptr nofree noundef readonly captures(none) %data) local_unnamed_addr #1 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %m
  br i1 %cmp, label %if.then, label %if.end34

if.then:                                          ; preds = %entry
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %std, i64 %idxprom
  store float 0.000000e+00, ptr %arrayidx, align 4, !tbaa !11
  %cmp358 = icmp sgt i32 %n, 0
  br i1 %cmp358, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %if.then
  %arrayidx9 = getelementptr inbounds [4 x i8], ptr %mean, i64 %idxprom
  %xtraiter = and i32 %n, 3
  %3 = icmp ult i32 %n, 4
  br i1 %3, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %n, 2147483644
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %4 = phi float [ 0.000000e+00, %for.body.lr.ph.new ], [ %add20.3, %for.body ]
  %i.059 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.3, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.3, %for.body ]
  %mul4 = shl nuw nsw i32 %i.059, 11
  %add5 = add nsw i32 %mul4, %add
  %idxprom6 = sext i32 %add5 to i64
  %arrayidx7 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6
  %5 = load float, ptr %arrayidx7, align 4, !tbaa !11
  %6 = load float, ptr %arrayidx9, align 4, !tbaa !11
  %sub = fsub contract float %5, %6
  %mul17 = fmul contract float %sub, %sub
  %add20 = fadd contract float %4, %mul17
  store float %add20, ptr %arrayidx, align 4, !tbaa !11
  %inc = shl i32 %i.059, 11
  %mul4.1 = or disjoint i32 %inc, 2048
  %add5.1 = add nsw i32 %mul4.1, %add
  %idxprom6.1 = sext i32 %add5.1 to i64
  %arrayidx7.1 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6.1
  %7 = load float, ptr %arrayidx7.1, align 4, !tbaa !11
  %8 = load float, ptr %arrayidx9, align 4, !tbaa !11
  %sub.1 = fsub contract float %7, %8
  %mul17.1 = fmul contract float %sub.1, %sub.1
  %add20.1 = fadd contract float %add20, %mul17.1
  store float %add20.1, ptr %arrayidx, align 4, !tbaa !11
  %inc.1 = shl i32 %i.059, 11
  %mul4.2 = or disjoint i32 %inc.1, 4096
  %add5.2 = add nsw i32 %mul4.2, %add
  %idxprom6.2 = sext i32 %add5.2 to i64
  %arrayidx7.2 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6.2
  %9 = load float, ptr %arrayidx7.2, align 4, !tbaa !11
  %10 = load float, ptr %arrayidx9, align 4, !tbaa !11
  %sub.2 = fsub contract float %9, %10
  %mul17.2 = fmul contract float %sub.2, %sub.2
  %add20.2 = fadd contract float %add20.1, %mul17.2
  store float %add20.2, ptr %arrayidx, align 4, !tbaa !11
  %inc.2 = shl i32 %i.059, 11
  %mul4.3 = or disjoint i32 %inc.2, 6144
  %add5.3 = add nsw i32 %mul4.3, %add
  %idxprom6.3 = sext i32 %add5.3 to i64
  %arrayidx7.3 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6.3
  %11 = load float, ptr %arrayidx7.3, align 4, !tbaa !11
  %12 = load float, ptr %arrayidx9, align 4, !tbaa !11
  %sub.3 = fsub contract float %11, %12
  %mul17.3 = fmul contract float %sub.3, %sub.3
  %add20.3 = fadd contract float %add20.2, %mul17.3
  store float %add20.3, ptr %arrayidx, align 4, !tbaa !11
  %inc.3 = add nuw nsw i32 %i.059, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !17

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.lr.ph
  %.epil.init = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %add20.3, %for.end.loopexit.unr-lcssa ]
  %i.059.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.3, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod61 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod61)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %13 = phi float [ %.epil.init, %for.body.epil.preheader ], [ %add20.epil, %for.body.epil ]
  %i.059.epil = phi i32 [ %i.059.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %mul4.epil = shl nuw nsw i32 %i.059.epil, 11
  %add5.epil = add nsw i32 %mul4.epil, %add
  %idxprom6.epil = sext i32 %add5.epil to i64
  %arrayidx7.epil = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom6.epil
  %14 = load float, ptr %arrayidx7.epil, align 4, !tbaa !11
  %15 = load float, ptr %arrayidx9, align 4, !tbaa !11
  %sub.epil = fsub contract float %14, %15
  %mul17.epil = fmul contract float %sub.epil, %sub.epil
  %add20.epil = fadd contract float %13, %mul17.epil
  store float %add20.epil, ptr %arrayidx, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %i.059.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body.epil, !llvm.loop !18

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil, %if.then
  %16 = phi float [ 0.000000e+00, %if.then ], [ %add20.3, %for.end.loopexit.unr-lcssa ], [ %add20.epil, %for.body.epil ]
  %div = fdiv contract float %16, f0x4A442E10
  %17 = tail call noundef float @llvm.nvvm.sqrt.approx.f(float %div) #6
  %cmp30 = fcmp contract ugt float %17, 5.000000e-03
  %storemerge = select i1 %cmp30, float %17, float 1.000000e+00
  store float %storemerge, ptr %arrayidx, align 4, !tbaa !11
  br label %if.end34

if.end34:                                         ; preds = %for.end, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z13reduce_kerneliiPfS_S_(i32 noundef %m, i32 noundef %n, ptr nofree noundef readonly captures(none) %mean, ptr nofree noundef readonly captures(none) %std, ptr nofree noundef captures(none) %data) local_unnamed_addr #2 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %3 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %4 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %mul5 = mul nuw nsw i32 %3, %4
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %add7 = add nuw nsw i32 %mul5, %5
  %cmp = icmp slt i32 %add7, %n
  %cmp8 = icmp slt i32 %add, %m
  %or.cond = and i1 %cmp8, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %mean, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul9 = shl nsw i32 %add7, 11
  %add10 = add nsw i32 %mul9, %add
  %idxprom11 = sext i32 %add10 to i64
  %arrayidx12 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom11
  %7 = load float, ptr %arrayidx12, align 4, !tbaa !11
  %sub = fsub contract float %7, %6
  store float %sub, ptr %arrayidx12, align 4, !tbaa !11
  %8 = tail call noundef float @llvm.nvvm.sqrt.approx.f(float f0x4A442E10) #6
  %arrayidx15 = getelementptr inbounds [4 x i8], ptr %std, i64 %idxprom
  %9 = load float, ptr %arrayidx15, align 4, !tbaa !11
  %mul16 = fmul contract float %8, %9
  %div = fdiv contract float %sub, %mul16
  store float %div, ptr %arrayidx12, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11corr_kerneliiPfS_(i32 noundef %m, i32 noundef %n, ptr nofree noundef writeonly captures(none) %symmat, ptr nofree noundef readonly captures(none) %data) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %sub = add nsw i32 %m, -1
  %cmp = icmp slt i32 %add, %sub
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul3 = shl nsw i32 %add, 11
  %add4 = mul i32 %add, 2049
  %idxprom = sext i32 %add4 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %symmat, i64 %idxprom
  store float 1.000000e+00, ptr %arrayidx, align 4, !tbaa !11
  %j2.064 = add nsw i32 %add, 1
  %cmp665 = icmp slt i32 %j2.064, %m
  br i1 %cmp665, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %if.then
  %cmp1262 = icmp sgt i32 %n, 0
  %xtraiter = and i32 %n, 3
  %3 = icmp ult i32 %n, 4
  %unroll_iter = and i32 %n, 2147483644
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  %lcmp.mod68 = icmp ne i32 %xtraiter, 0
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.end
  %j2.066 = phi i32 [ %j2.064, %for.body.lr.ph ], [ %j2.0, %for.end ]
  %add8 = add nsw i32 %j2.066, %mul3
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds [4 x i8], ptr %symmat, i64 %idxprom9
  store float 0.000000e+00, ptr %arrayidx10, align 4, !tbaa !11
  br i1 %cmp1262, label %for.body13.preheader, label %for.end

for.body13.preheader:                             ; preds = %for.body
  br i1 %3, label %for.body13.epil.preheader, label %for.body13

for.body13:                                       ; preds = %for.body13.preheader, %for.body13
  %4 = phi float [ %add27.3, %for.body13 ], [ 0.000000e+00, %for.body13.preheader ]
  %i.063 = phi i32 [ %inc.3, %for.body13 ], [ 0, %for.body13.preheader ]
  %niter = phi i32 [ %niter.next.3, %for.body13 ], [ 0, %for.body13.preheader ]
  %mul14 = shl nuw nsw i32 %i.063, 11
  %add15 = add nsw i32 %mul14, %add
  %idxprom16 = sext i32 %add15 to i64
  %arrayidx17 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom16
  %5 = load float, ptr %arrayidx17, align 4, !tbaa !11
  %add19 = add nsw i32 %mul14, %j2.066
  %idxprom20 = sext i32 %add19 to i64
  %arrayidx21 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom20
  %6 = load float, ptr %arrayidx21, align 4, !tbaa !11
  %mul22 = fmul contract float %5, %6
  %add27 = fadd contract float %4, %mul22
  store float %add27, ptr %arrayidx10, align 4, !tbaa !11
  %inc = shl i32 %i.063, 11
  %mul14.1 = or disjoint i32 %inc, 2048
  %add15.1 = add nsw i32 %mul14.1, %add
  %idxprom16.1 = sext i32 %add15.1 to i64
  %arrayidx17.1 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom16.1
  %7 = load float, ptr %arrayidx17.1, align 4, !tbaa !11
  %add19.1 = add nsw i32 %mul14.1, %j2.066
  %idxprom20.1 = sext i32 %add19.1 to i64
  %arrayidx21.1 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom20.1
  %8 = load float, ptr %arrayidx21.1, align 4, !tbaa !11
  %mul22.1 = fmul contract float %7, %8
  %add27.1 = fadd contract float %add27, %mul22.1
  store float %add27.1, ptr %arrayidx10, align 4, !tbaa !11
  %inc.1 = shl i32 %i.063, 11
  %mul14.2 = or disjoint i32 %inc.1, 4096
  %add15.2 = add nsw i32 %mul14.2, %add
  %idxprom16.2 = sext i32 %add15.2 to i64
  %arrayidx17.2 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom16.2
  %9 = load float, ptr %arrayidx17.2, align 4, !tbaa !11
  %add19.2 = add nsw i32 %mul14.2, %j2.066
  %idxprom20.2 = sext i32 %add19.2 to i64
  %arrayidx21.2 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom20.2
  %10 = load float, ptr %arrayidx21.2, align 4, !tbaa !11
  %mul22.2 = fmul contract float %9, %10
  %add27.2 = fadd contract float %add27.1, %mul22.2
  store float %add27.2, ptr %arrayidx10, align 4, !tbaa !11
  %inc.2 = shl i32 %i.063, 11
  %mul14.3 = or disjoint i32 %inc.2, 6144
  %add15.3 = add nsw i32 %mul14.3, %add
  %idxprom16.3 = sext i32 %add15.3 to i64
  %arrayidx17.3 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom16.3
  %11 = load float, ptr %arrayidx17.3, align 4, !tbaa !11
  %add19.3 = add nsw i32 %mul14.3, %j2.066
  %idxprom20.3 = sext i32 %add19.3 to i64
  %arrayidx21.3 = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom20.3
  %12 = load float, ptr %arrayidx21.3, align 4, !tbaa !11
  %mul22.3 = fmul contract float %11, %12
  %add27.3 = fadd contract float %add27.2, %mul22.3
  store float %add27.3, ptr %arrayidx10, align 4, !tbaa !11
  %inc.3 = add nuw nsw i32 %i.063, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %for.end.loopexit.unr-lcssa, label %for.body13, !llvm.loop !19

for.end.loopexit.unr-lcssa:                       ; preds = %for.body13
  br i1 %lcmp.mod.not, label %for.end, label %for.body13.epil.preheader

for.body13.epil.preheader:                        ; preds = %for.end.loopexit.unr-lcssa, %for.body13.preheader
  %.epil.init = phi float [ 0.000000e+00, %for.body13.preheader ], [ %add27.3, %for.end.loopexit.unr-lcssa ]
  %i.063.epil.init = phi i32 [ 0, %for.body13.preheader ], [ %inc.3, %for.end.loopexit.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod68)
  br label %for.body13.epil

for.body13.epil:                                  ; preds = %for.body13.epil, %for.body13.epil.preheader
  %13 = phi float [ %add27.epil, %for.body13.epil ], [ %.epil.init, %for.body13.epil.preheader ]
  %i.063.epil = phi i32 [ %inc.epil, %for.body13.epil ], [ %i.063.epil.init, %for.body13.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body13.epil ], [ 0, %for.body13.epil.preheader ]
  %mul14.epil = shl nuw nsw i32 %i.063.epil, 11
  %add15.epil = add nsw i32 %mul14.epil, %add
  %idxprom16.epil = sext i32 %add15.epil to i64
  %arrayidx17.epil = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom16.epil
  %14 = load float, ptr %arrayidx17.epil, align 4, !tbaa !11
  %add19.epil = add nsw i32 %mul14.epil, %j2.066
  %idxprom20.epil = sext i32 %add19.epil to i64
  %arrayidx21.epil = getelementptr inbounds [4 x i8], ptr %data, i64 %idxprom20.epil
  %15 = load float, ptr %arrayidx21.epil, align 4, !tbaa !11
  %mul22.epil = fmul contract float %14, %15
  %add27.epil = fadd contract float %13, %mul22.epil
  store float %add27.epil, ptr %arrayidx10, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %i.063.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body13.epil, !llvm.loop !20

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body13.epil, %for.body
  %16 = phi float [ 0.000000e+00, %for.body ], [ %add27.3, %for.end.loopexit.unr-lcssa ], [ %add27.epil, %for.body13.epil ]
  %mul32 = shl nsw i32 %j2.066, 11
  %add33 = add nsw i32 %mul32, %add
  %idxprom34 = sext i32 %add33 to i64
  %arrayidx35 = getelementptr inbounds [4 x i8], ptr %symmat, i64 %idxprom34
  store float %16, ptr %arrayidx35, align 4, !tbaa !11
  %j2.0 = add nsw i32 %j2.066, 1
  %cmp6 = icmp slt i32 %j2.0, %m
  br i1 %cmp6, label %for.body, label %if.end, !llvm.loop !21

if.end:                                           ; preds = %for.end, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.sqrt.approx.f(float) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #5

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #2 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3, !4}
!llvm.errno.tbaa = !{!5}
!nvvmir.version = !{!10}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 12, i32 8]}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 24.0.0git (https://github.com/llvm/llvm-project c45e6b9e4d95fb444eb1308416c10d95350d3c52)"}
!4 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!5 = !{!6, !7, i64 0}
!6 = !{!"__libc_errno", !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{i32 2, i32 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !8, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !16}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !16}
!21 = distinct !{!21, !14}
