; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/3MM/3mm.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/3MM/3mm.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11mm3_kernel1iiiiiPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef writeonly captures(none) %E) local_unnamed_addr #0 {
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
  %cmp = icmp slt i32 %add7, %ni
  %cmp8 = icmp slt i32 %add, %nj
  %or.cond = and i1 %cmp, %cmp8
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul9 = shl nsw i32 %add7, 9
  %add10 = add nsw i32 %mul9, %add
  %idxprom = sext i32 %add10 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %E, i64 %idxprom
  store float 0.000000e+00, ptr %arrayidx, align 4, !tbaa !11
  %cmp1136 = icmp sgt i32 %nk, 0
  br i1 %cmp1136, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %nk, 3
  %6 = icmp ult i32 %nk, 4
  br i1 %6, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %nk, 2147483644
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %7 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add25.3, %for.body ]
  %k.037 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.3, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.3, %for.body ]
  %add13 = add nuw nsw i32 %k.037, %mul9
  %idxprom14 = zext nneg i32 %add13 to i64
  %arrayidx15 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom14
  %8 = load float, ptr %arrayidx15, align 4, !tbaa !11
  %mul16 = shl nuw nsw i32 %k.037, 9
  %add17 = add nsw i32 %mul16, %add
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom18
  %9 = load float, ptr %arrayidx19, align 4, !tbaa !11
  %mul20 = fmul contract float %8, %9
  %add25 = fadd contract float %7, %mul20
  store float %add25, ptr %arrayidx, align 4, !tbaa !11
  %inc = or disjoint i32 %k.037, 1
  %add13.1 = add nuw nsw i32 %inc, %mul9
  %idxprom14.1 = zext nneg i32 %add13.1 to i64
  %arrayidx15.1 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom14.1
  %10 = load float, ptr %arrayidx15.1, align 4, !tbaa !11
  %mul16.1 = shl nuw nsw i32 %inc, 9
  %add17.1 = add nsw i32 %mul16.1, %add
  %idxprom18.1 = sext i32 %add17.1 to i64
  %arrayidx19.1 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom18.1
  %11 = load float, ptr %arrayidx19.1, align 4, !tbaa !11
  %mul20.1 = fmul contract float %10, %11
  %add25.1 = fadd contract float %add25, %mul20.1
  store float %add25.1, ptr %arrayidx, align 4, !tbaa !11
  %inc.1 = or disjoint i32 %k.037, 2
  %add13.2 = add nuw nsw i32 %inc.1, %mul9
  %idxprom14.2 = zext nneg i32 %add13.2 to i64
  %arrayidx15.2 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom14.2
  %12 = load float, ptr %arrayidx15.2, align 4, !tbaa !11
  %mul16.2 = shl nuw nsw i32 %inc.1, 9
  %add17.2 = add nsw i32 %mul16.2, %add
  %idxprom18.2 = sext i32 %add17.2 to i64
  %arrayidx19.2 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom18.2
  %13 = load float, ptr %arrayidx19.2, align 4, !tbaa !11
  %mul20.2 = fmul contract float %12, %13
  %add25.2 = fadd contract float %add25.1, %mul20.2
  store float %add25.2, ptr %arrayidx, align 4, !tbaa !11
  %inc.2 = or disjoint i32 %k.037, 3
  %add13.3 = add nuw nsw i32 %inc.2, %mul9
  %idxprom14.3 = zext nneg i32 %add13.3 to i64
  %arrayidx15.3 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom14.3
  %14 = load float, ptr %arrayidx15.3, align 4, !tbaa !11
  %mul16.3 = shl nuw nsw i32 %inc.2, 9
  %add17.3 = add nsw i32 %mul16.3, %add
  %idxprom18.3 = sext i32 %add17.3 to i64
  %arrayidx19.3 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom18.3
  %15 = load float, ptr %arrayidx19.3, align 4, !tbaa !11
  %mul20.3 = fmul contract float %14, %15
  %add25.3 = fadd contract float %add25.2, %mul20.3
  store float %add25.3, ptr %arrayidx, align 4, !tbaa !11
  %inc.3 = add nuw nsw i32 %k.037, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !13

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.preheader
  %.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add25.3, %if.end.loopexit.unr-lcssa ]
  %k.037.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.3, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod38 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod38)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %16 = phi float [ %add25.epil, %for.body.epil ], [ %.epil.init, %for.body.epil.preheader ]
  %k.037.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %k.037.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %add13.epil = add nuw nsw i32 %k.037.epil, %mul9
  %idxprom14.epil = zext nneg i32 %add13.epil to i64
  %arrayidx15.epil = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom14.epil
  %17 = load float, ptr %arrayidx15.epil, align 4, !tbaa !11
  %mul16.epil = shl nuw nsw i32 %k.037.epil, 9
  %add17.epil = add nsw i32 %mul16.epil, %add
  %idxprom18.epil = sext i32 %add17.epil to i64
  %arrayidx19.epil = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom18.epil
  %18 = load float, ptr %arrayidx19.epil, align 4, !tbaa !11
  %mul20.epil = fmul contract float %17, %18
  %add25.epil = fadd contract float %16, %mul20.epil
  store float %add25.epil, ptr %arrayidx, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %k.037.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !15

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11mm3_kernel2iiiiiPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr nofree noundef readonly captures(none) %C, ptr nofree noundef readonly captures(none) %D, ptr nofree noundef writeonly captures(none) %F) local_unnamed_addr #0 {
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
  %cmp = icmp slt i32 %add7, %nj
  %cmp8 = icmp slt i32 %add, %nl
  %or.cond = and i1 %cmp, %cmp8
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul9 = shl nsw i32 %add7, 9
  %add10 = add nsw i32 %mul9, %add
  %idxprom = sext i32 %add10 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %F, i64 %idxprom
  store float 0.000000e+00, ptr %arrayidx, align 4, !tbaa !11
  %cmp1136 = icmp sgt i32 %nm, 0
  br i1 %cmp1136, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %nm, 3
  %6 = icmp ult i32 %nm, 4
  br i1 %6, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %nm, 2147483644
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %7 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add25.3, %for.body ]
  %k.037 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.3, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.3, %for.body ]
  %add13 = add nuw nsw i32 %k.037, %mul9
  %idxprom14 = zext nneg i32 %add13 to i64
  %arrayidx15 = getelementptr inbounds nuw [4 x i8], ptr %C, i64 %idxprom14
  %8 = load float, ptr %arrayidx15, align 4, !tbaa !11
  %mul16 = shl nuw nsw i32 %k.037, 9
  %add17 = add nsw i32 %mul16, %add
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [4 x i8], ptr %D, i64 %idxprom18
  %9 = load float, ptr %arrayidx19, align 4, !tbaa !11
  %mul20 = fmul contract float %8, %9
  %add25 = fadd contract float %7, %mul20
  store float %add25, ptr %arrayidx, align 4, !tbaa !11
  %inc = or disjoint i32 %k.037, 1
  %add13.1 = add nuw nsw i32 %inc, %mul9
  %idxprom14.1 = zext nneg i32 %add13.1 to i64
  %arrayidx15.1 = getelementptr inbounds nuw [4 x i8], ptr %C, i64 %idxprom14.1
  %10 = load float, ptr %arrayidx15.1, align 4, !tbaa !11
  %mul16.1 = shl nuw nsw i32 %inc, 9
  %add17.1 = add nsw i32 %mul16.1, %add
  %idxprom18.1 = sext i32 %add17.1 to i64
  %arrayidx19.1 = getelementptr inbounds [4 x i8], ptr %D, i64 %idxprom18.1
  %11 = load float, ptr %arrayidx19.1, align 4, !tbaa !11
  %mul20.1 = fmul contract float %10, %11
  %add25.1 = fadd contract float %add25, %mul20.1
  store float %add25.1, ptr %arrayidx, align 4, !tbaa !11
  %inc.1 = or disjoint i32 %k.037, 2
  %add13.2 = add nuw nsw i32 %inc.1, %mul9
  %idxprom14.2 = zext nneg i32 %add13.2 to i64
  %arrayidx15.2 = getelementptr inbounds nuw [4 x i8], ptr %C, i64 %idxprom14.2
  %12 = load float, ptr %arrayidx15.2, align 4, !tbaa !11
  %mul16.2 = shl nuw nsw i32 %inc.1, 9
  %add17.2 = add nsw i32 %mul16.2, %add
  %idxprom18.2 = sext i32 %add17.2 to i64
  %arrayidx19.2 = getelementptr inbounds [4 x i8], ptr %D, i64 %idxprom18.2
  %13 = load float, ptr %arrayidx19.2, align 4, !tbaa !11
  %mul20.2 = fmul contract float %12, %13
  %add25.2 = fadd contract float %add25.1, %mul20.2
  store float %add25.2, ptr %arrayidx, align 4, !tbaa !11
  %inc.2 = or disjoint i32 %k.037, 3
  %add13.3 = add nuw nsw i32 %inc.2, %mul9
  %idxprom14.3 = zext nneg i32 %add13.3 to i64
  %arrayidx15.3 = getelementptr inbounds nuw [4 x i8], ptr %C, i64 %idxprom14.3
  %14 = load float, ptr %arrayidx15.3, align 4, !tbaa !11
  %mul16.3 = shl nuw nsw i32 %inc.2, 9
  %add17.3 = add nsw i32 %mul16.3, %add
  %idxprom18.3 = sext i32 %add17.3 to i64
  %arrayidx19.3 = getelementptr inbounds [4 x i8], ptr %D, i64 %idxprom18.3
  %15 = load float, ptr %arrayidx19.3, align 4, !tbaa !11
  %mul20.3 = fmul contract float %14, %15
  %add25.3 = fadd contract float %add25.2, %mul20.3
  store float %add25.3, ptr %arrayidx, align 4, !tbaa !11
  %inc.3 = add nuw nsw i32 %k.037, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !17

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.preheader
  %.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add25.3, %if.end.loopexit.unr-lcssa ]
  %k.037.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.3, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod38 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod38)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %16 = phi float [ %add25.epil, %for.body.epil ], [ %.epil.init, %for.body.epil.preheader ]
  %k.037.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %k.037.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %add13.epil = add nuw nsw i32 %k.037.epil, %mul9
  %idxprom14.epil = zext nneg i32 %add13.epil to i64
  %arrayidx15.epil = getelementptr inbounds nuw [4 x i8], ptr %C, i64 %idxprom14.epil
  %17 = load float, ptr %arrayidx15.epil, align 4, !tbaa !11
  %mul16.epil = shl nuw nsw i32 %k.037.epil, 9
  %add17.epil = add nsw i32 %mul16.epil, %add
  %idxprom18.epil = sext i32 %add17.epil to i64
  %arrayidx19.epil = getelementptr inbounds [4 x i8], ptr %D, i64 %idxprom18.epil
  %18 = load float, ptr %arrayidx19.epil, align 4, !tbaa !11
  %mul20.epil = fmul contract float %17, %18
  %add25.epil = fadd contract float %16, %mul20.epil
  store float %add25.epil, ptr %arrayidx, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %k.037.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !18

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11mm3_kernel3iiiiiPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, i32 noundef %nl, i32 noundef %nm, ptr nofree noundef readonly captures(none) %E, ptr nofree noundef readonly captures(none) %F, ptr nofree noundef writeonly captures(none) %G) local_unnamed_addr #0 {
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
  %cmp = icmp slt i32 %add7, %ni
  %cmp8 = icmp slt i32 %add, %nl
  %or.cond = and i1 %cmp, %cmp8
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul9 = shl nsw i32 %add7, 9
  %add10 = add nsw i32 %mul9, %add
  %idxprom = sext i32 %add10 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %G, i64 %idxprom
  store float 0.000000e+00, ptr %arrayidx, align 4, !tbaa !11
  %cmp1136 = icmp sgt i32 %nj, 0
  br i1 %cmp1136, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %nj, 3
  %6 = icmp ult i32 %nj, 4
  br i1 %6, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %nj, 2147483644
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %7 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add25.3, %for.body ]
  %k.037 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.3, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.3, %for.body ]
  %add13 = add nuw nsw i32 %k.037, %mul9
  %idxprom14 = zext nneg i32 %add13 to i64
  %arrayidx15 = getelementptr inbounds nuw [4 x i8], ptr %E, i64 %idxprom14
  %8 = load float, ptr %arrayidx15, align 4, !tbaa !11
  %mul16 = shl nuw nsw i32 %k.037, 9
  %add17 = add nsw i32 %mul16, %add
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [4 x i8], ptr %F, i64 %idxprom18
  %9 = load float, ptr %arrayidx19, align 4, !tbaa !11
  %mul20 = fmul contract float %8, %9
  %add25 = fadd contract float %7, %mul20
  store float %add25, ptr %arrayidx, align 4, !tbaa !11
  %inc = or disjoint i32 %k.037, 1
  %add13.1 = add nuw nsw i32 %inc, %mul9
  %idxprom14.1 = zext nneg i32 %add13.1 to i64
  %arrayidx15.1 = getelementptr inbounds nuw [4 x i8], ptr %E, i64 %idxprom14.1
  %10 = load float, ptr %arrayidx15.1, align 4, !tbaa !11
  %mul16.1 = shl nuw nsw i32 %inc, 9
  %add17.1 = add nsw i32 %mul16.1, %add
  %idxprom18.1 = sext i32 %add17.1 to i64
  %arrayidx19.1 = getelementptr inbounds [4 x i8], ptr %F, i64 %idxprom18.1
  %11 = load float, ptr %arrayidx19.1, align 4, !tbaa !11
  %mul20.1 = fmul contract float %10, %11
  %add25.1 = fadd contract float %add25, %mul20.1
  store float %add25.1, ptr %arrayidx, align 4, !tbaa !11
  %inc.1 = or disjoint i32 %k.037, 2
  %add13.2 = add nuw nsw i32 %inc.1, %mul9
  %idxprom14.2 = zext nneg i32 %add13.2 to i64
  %arrayidx15.2 = getelementptr inbounds nuw [4 x i8], ptr %E, i64 %idxprom14.2
  %12 = load float, ptr %arrayidx15.2, align 4, !tbaa !11
  %mul16.2 = shl nuw nsw i32 %inc.1, 9
  %add17.2 = add nsw i32 %mul16.2, %add
  %idxprom18.2 = sext i32 %add17.2 to i64
  %arrayidx19.2 = getelementptr inbounds [4 x i8], ptr %F, i64 %idxprom18.2
  %13 = load float, ptr %arrayidx19.2, align 4, !tbaa !11
  %mul20.2 = fmul contract float %12, %13
  %add25.2 = fadd contract float %add25.1, %mul20.2
  store float %add25.2, ptr %arrayidx, align 4, !tbaa !11
  %inc.2 = or disjoint i32 %k.037, 3
  %add13.3 = add nuw nsw i32 %inc.2, %mul9
  %idxprom14.3 = zext nneg i32 %add13.3 to i64
  %arrayidx15.3 = getelementptr inbounds nuw [4 x i8], ptr %E, i64 %idxprom14.3
  %14 = load float, ptr %arrayidx15.3, align 4, !tbaa !11
  %mul16.3 = shl nuw nsw i32 %inc.2, 9
  %add17.3 = add nsw i32 %mul16.3, %add
  %idxprom18.3 = sext i32 %add17.3 to i64
  %arrayidx19.3 = getelementptr inbounds [4 x i8], ptr %F, i64 %idxprom18.3
  %15 = load float, ptr %arrayidx19.3, align 4, !tbaa !11
  %mul20.3 = fmul contract float %14, %15
  %add25.3 = fadd contract float %add25.2, %mul20.3
  store float %add25.3, ptr %arrayidx, align 4, !tbaa !11
  %inc.3 = add nuw nsw i32 %k.037, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !19

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.preheader
  %.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add25.3, %if.end.loopexit.unr-lcssa ]
  %k.037.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.3, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod38 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod38)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %16 = phi float [ %add25.epil, %for.body.epil ], [ %.epil.init, %for.body.epil.preheader ]
  %k.037.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %k.037.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %add13.epil = add nuw nsw i32 %k.037.epil, %mul9
  %idxprom14.epil = zext nneg i32 %add13.epil to i64
  %arrayidx15.epil = getelementptr inbounds nuw [4 x i8], ptr %E, i64 %idxprom14.epil
  %17 = load float, ptr %arrayidx15.epil, align 4, !tbaa !11
  %mul16.epil = shl nuw nsw i32 %k.037.epil, 9
  %add17.epil = add nsw i32 %mul16.epil, %add
  %idxprom18.epil = sext i32 %add17.epil to i64
  %arrayidx19.epil = getelementptr inbounds [4 x i8], ptr %F, i64 %idxprom18.epil
  %18 = load float, ptr %arrayidx19.epil, align 4, !tbaa !11
  %mul20.epil = fmul contract float %17, %18
  %add25.epil = fadd contract float %16, %mul20.epil
  store float %add25.epil, ptr %arrayidx, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %k.037.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !20

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

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
