; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GRAMSCHM/gramschmidt.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z19gramschmidt_kernel1iiPfS_S_i(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef readonly captures(none) %a, ptr nofree noundef writeonly captures(none) %r, ptr nofree noundef readnone captures(none) %q, i32 noundef %k) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = sub nsw i32 0, %2
  %cmp = icmp eq i32 %mul, %add
  br i1 %cmp, label %for.cond.preheader, label %if.end

for.cond.preheader:                               ; preds = %entry
  %cmp326 = icmp sgt i32 %ni, 0
  br i1 %cmp326, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %for.cond.preheader
  %xtraiter = and i32 %ni, 7
  %3 = icmp ult i32 %ni, 8
  br i1 %3, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %ni, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %i.028 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %nrm.027 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add11.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %mul4 = shl nuw nsw i32 %i.028, 11
  %add5 = add nsw i32 %mul4, %k
  %idxprom = sext i32 %add5 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom
  %4 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul10 = fmul contract float %4, %4
  %add11 = fadd contract float %nrm.027, %mul10
  %inc = shl i32 %i.028, 11
  %mul4.1 = or disjoint i32 %inc, 2048
  %add5.1 = add nsw i32 %mul4.1, %k
  %idxprom.1 = sext i32 %add5.1 to i64
  %arrayidx.1 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom.1
  %5 = load float, ptr %arrayidx.1, align 4, !tbaa !11
  %mul10.1 = fmul contract float %5, %5
  %add11.1 = fadd contract float %add11, %mul10.1
  %inc.1 = shl i32 %i.028, 11
  %mul4.2 = or disjoint i32 %inc.1, 4096
  %add5.2 = add nsw i32 %mul4.2, %k
  %idxprom.2 = sext i32 %add5.2 to i64
  %arrayidx.2 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom.2
  %6 = load float, ptr %arrayidx.2, align 4, !tbaa !11
  %mul10.2 = fmul contract float %6, %6
  %add11.2 = fadd contract float %add11.1, %mul10.2
  %inc.2 = shl i32 %i.028, 11
  %mul4.3 = or disjoint i32 %inc.2, 6144
  %add5.3 = add nsw i32 %mul4.3, %k
  %idxprom.3 = sext i32 %add5.3 to i64
  %arrayidx.3 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom.3
  %7 = load float, ptr %arrayidx.3, align 4, !tbaa !11
  %mul10.3 = fmul contract float %7, %7
  %add11.3 = fadd contract float %add11.2, %mul10.3
  %inc.3 = shl i32 %i.028, 11
  %mul4.4 = or disjoint i32 %inc.3, 8192
  %add5.4 = add nsw i32 %mul4.4, %k
  %idxprom.4 = sext i32 %add5.4 to i64
  %arrayidx.4 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom.4
  %8 = load float, ptr %arrayidx.4, align 4, !tbaa !11
  %mul10.4 = fmul contract float %8, %8
  %add11.4 = fadd contract float %add11.3, %mul10.4
  %inc.4 = shl i32 %i.028, 11
  %mul4.5 = or disjoint i32 %inc.4, 10240
  %add5.5 = add nsw i32 %mul4.5, %k
  %idxprom.5 = sext i32 %add5.5 to i64
  %arrayidx.5 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom.5
  %9 = load float, ptr %arrayidx.5, align 4, !tbaa !11
  %mul10.5 = fmul contract float %9, %9
  %add11.5 = fadd contract float %add11.4, %mul10.5
  %inc.5 = shl i32 %i.028, 11
  %mul4.6 = or disjoint i32 %inc.5, 12288
  %add5.6 = add nsw i32 %mul4.6, %k
  %idxprom.6 = sext i32 %add5.6 to i64
  %arrayidx.6 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom.6
  %10 = load float, ptr %arrayidx.6, align 4, !tbaa !11
  %mul10.6 = fmul contract float %10, %10
  %add11.6 = fadd contract float %add11.5, %mul10.6
  %inc.6 = shl i32 %i.028, 11
  %mul4.7 = or disjoint i32 %inc.6, 14336
  %add5.7 = add nsw i32 %mul4.7, %k
  %idxprom.7 = sext i32 %add5.7 to i64
  %arrayidx.7 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom.7
  %11 = load float, ptr %arrayidx.7, align 4, !tbaa !11
  %mul10.7 = fmul contract float %11, %11
  %add11.7 = fadd contract float %add11.6, %mul10.7
  %inc.7 = add nuw nsw i32 %i.028, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !13

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.preheader
  %i.028.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %for.end.loopexit.unr-lcssa ]
  %nrm.027.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add11.7, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod30 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod30)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %i.028.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %i.028.epil.init, %for.body.epil.preheader ]
  %nrm.027.epil = phi float [ %add11.epil, %for.body.epil ], [ %nrm.027.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %mul4.epil = shl nuw nsw i32 %i.028.epil, 11
  %add5.epil = add nsw i32 %mul4.epil, %k
  %idxprom.epil = sext i32 %add5.epil to i64
  %arrayidx.epil = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom.epil
  %12 = load float, ptr %arrayidx.epil, align 4, !tbaa !11
  %mul10.epil = fmul contract float %12, %12
  %add11.epil = fadd contract float %nrm.027.epil, %mul10.epil
  %inc.epil = add nuw nsw i32 %i.028.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body.epil, !llvm.loop !15

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil, %for.cond.preheader
  %nrm.0.lcssa = phi float [ 0.000000e+00, %for.cond.preheader ], [ %add11.7, %for.end.loopexit.unr-lcssa ], [ %add11.epil, %for.body.epil ]
  %13 = tail call noundef float @llvm.nvvm.sqrt.approx.f(float %nrm.0.lcssa) #6
  %add14 = mul nsw i32 %k, 2049
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds [4 x i8], ptr %r, i64 %idxprom15
  store float %13, ptr %arrayidx16, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z19gramschmidt_kernel2iiPfS_S_i(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef readonly captures(none) %a, ptr nofree noundef readonly captures(none) %r, ptr nofree noundef writeonly captures(none) %q, i32 noundef %k) local_unnamed_addr #1 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %ni
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul3 = shl nsw i32 %add, 11
  %add4 = add nsw i32 %k, %mul3
  %idxprom = sext i32 %add4 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom
  %3 = load float, ptr %arrayidx, align 4, !tbaa !11
  %add6 = mul nsw i32 %k, 2049
  %idxprom7 = sext i32 %add6 to i64
  %arrayidx8 = getelementptr inbounds [4 x i8], ptr %r, i64 %idxprom7
  %4 = load float, ptr %arrayidx8, align 4, !tbaa !11
  %div = fdiv contract float %3, %4
  %arrayidx12 = getelementptr inbounds [4 x i8], ptr %q, i64 %idxprom
  store float %div, ptr %arrayidx12, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z19gramschmidt_kernel3iiPfS_S_i(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef captures(none) %a, ptr nofree noundef captures(none) %r, ptr nofree noundef readonly captures(none) %q, i32 noundef %k) local_unnamed_addr #2 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp sgt i32 %add, %k
  %cmp3 = icmp slt i32 %add, %nj
  %or.cond = and i1 %cmp3, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul4 = shl nsw i32 %k, 11
  %add5 = add nsw i32 %mul4, %add
  %idxprom = sext i32 %add5 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %r, i64 %idxprom
  store float 0.000000e+00, ptr %arrayidx, align 4, !tbaa !11
  %cmp663 = icmp sgt i32 %ni, 0
  br i1 %cmp663, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %ni, 3
  %3 = icmp ult i32 %ni, 4
  br i1 %3, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %ni, 2147483644
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %4 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add20.3, %for.body ]
  %i.064 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.3, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.3, %for.body ]
  %mul7 = shl nuw nsw i32 %i.064, 11
  %add8 = add nsw i32 %mul7, %k
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds [4 x i8], ptr %q, i64 %idxprom9
  %5 = load float, ptr %arrayidx10, align 4, !tbaa !11
  %add12 = add nsw i32 %mul7, %add
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom13
  %6 = load float, ptr %arrayidx14, align 4, !tbaa !11
  %mul15 = fmul contract float %5, %6
  %add20 = fadd contract float %4, %mul15
  store float %add20, ptr %arrayidx, align 4, !tbaa !11
  %inc = shl i32 %i.064, 11
  %mul7.1 = or disjoint i32 %inc, 2048
  %add8.1 = add nsw i32 %mul7.1, %k
  %idxprom9.1 = sext i32 %add8.1 to i64
  %arrayidx10.1 = getelementptr inbounds [4 x i8], ptr %q, i64 %idxprom9.1
  %7 = load float, ptr %arrayidx10.1, align 4, !tbaa !11
  %add12.1 = add nsw i32 %mul7.1, %add
  %idxprom13.1 = sext i32 %add12.1 to i64
  %arrayidx14.1 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom13.1
  %8 = load float, ptr %arrayidx14.1, align 4, !tbaa !11
  %mul15.1 = fmul contract float %7, %8
  %add20.1 = fadd contract float %add20, %mul15.1
  store float %add20.1, ptr %arrayidx, align 4, !tbaa !11
  %inc.1 = shl i32 %i.064, 11
  %mul7.2 = or disjoint i32 %inc.1, 4096
  %add8.2 = add nsw i32 %mul7.2, %k
  %idxprom9.2 = sext i32 %add8.2 to i64
  %arrayidx10.2 = getelementptr inbounds [4 x i8], ptr %q, i64 %idxprom9.2
  %9 = load float, ptr %arrayidx10.2, align 4, !tbaa !11
  %add12.2 = add nsw i32 %mul7.2, %add
  %idxprom13.2 = sext i32 %add12.2 to i64
  %arrayidx14.2 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom13.2
  %10 = load float, ptr %arrayidx14.2, align 4, !tbaa !11
  %mul15.2 = fmul contract float %9, %10
  %add20.2 = fadd contract float %add20.1, %mul15.2
  store float %add20.2, ptr %arrayidx, align 4, !tbaa !11
  %inc.2 = shl i32 %i.064, 11
  %mul7.3 = or disjoint i32 %inc.2, 6144
  %add8.3 = add nsw i32 %mul7.3, %k
  %idxprom9.3 = sext i32 %add8.3 to i64
  %arrayidx10.3 = getelementptr inbounds [4 x i8], ptr %q, i64 %idxprom9.3
  %11 = load float, ptr %arrayidx10.3, align 4, !tbaa !11
  %add12.3 = add nsw i32 %mul7.3, %add
  %idxprom13.3 = sext i32 %add12.3 to i64
  %arrayidx14.3 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom13.3
  %12 = load float, ptr %arrayidx14.3, align 4, !tbaa !11
  %mul15.3 = fmul contract float %11, %12
  %add20.3 = fadd contract float %add20.2, %mul15.3
  store float %add20.3, ptr %arrayidx, align 4, !tbaa !11
  %inc.3 = add nuw nsw i32 %i.064, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %for.body23.preheader.unr-lcssa, label %for.body, !llvm.loop !17

for.body23.preheader.unr-lcssa:                   ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body23.preheader, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.body23.preheader.unr-lcssa, %for.body.preheader
  %.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add20.3, %for.body23.preheader.unr-lcssa ]
  %i.064.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.3, %for.body23.preheader.unr-lcssa ]
  %lcmp.mod68 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod68)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %13 = phi float [ %add20.epil, %for.body.epil ], [ %.epil.init, %for.body.epil.preheader ]
  %i.064.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %i.064.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %mul7.epil = shl nuw nsw i32 %i.064.epil, 11
  %add8.epil = add nsw i32 %mul7.epil, %k
  %idxprom9.epil = sext i32 %add8.epil to i64
  %arrayidx10.epil = getelementptr inbounds [4 x i8], ptr %q, i64 %idxprom9.epil
  %14 = load float, ptr %arrayidx10.epil, align 4, !tbaa !11
  %add12.epil = add nsw i32 %mul7.epil, %add
  %idxprom13.epil = sext i32 %add12.epil to i64
  %arrayidx14.epil = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom13.epil
  %15 = load float, ptr %arrayidx14.epil, align 4, !tbaa !11
  %mul15.epil = fmul contract float %14, %15
  %add20.epil = fadd contract float %13, %mul15.epil
  store float %add20.epil, ptr %arrayidx, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %i.064.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.body23.preheader, label %for.body.epil, !llvm.loop !18

for.body23.preheader:                             ; preds = %for.body.epil, %for.body23.preheader.unr-lcssa
  %xtraiter69 = and i32 %ni, 3
  %16 = icmp ult i32 %ni, 4
  br i1 %16, label %for.body23.epil.preheader, label %for.body23.preheader.new

for.body23.preheader.new:                         ; preds = %for.body23.preheader
  %unroll_iter73 = and i32 %ni, 2147483644
  br label %for.body23

for.body23:                                       ; preds = %for.body23, %for.body23.preheader.new
  %i.166 = phi i32 [ 0, %for.body23.preheader.new ], [ %inc38.3, %for.body23 ]
  %niter74 = phi i32 [ 0, %for.body23.preheader.new ], [ %niter74.next.3, %for.body23 ]
  %mul24 = shl nuw nsw i32 %i.166, 11
  %add25 = add nsw i32 %mul24, %k
  %idxprom26 = sext i32 %add25 to i64
  %arrayidx27 = getelementptr inbounds [4 x i8], ptr %q, i64 %idxprom26
  %17 = load float, ptr %arrayidx27, align 4, !tbaa !11
  %18 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul32 = fmul contract float %17, %18
  %add34 = add nsw i32 %mul24, %add
  %idxprom35 = sext i32 %add34 to i64
  %arrayidx36 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom35
  %19 = load float, ptr %arrayidx36, align 4, !tbaa !11
  %sub = fsub contract float %19, %mul32
  store float %sub, ptr %arrayidx36, align 4, !tbaa !11
  %inc38 = shl i32 %i.166, 11
  %mul24.1 = or disjoint i32 %inc38, 2048
  %add25.1 = add nsw i32 %mul24.1, %k
  %idxprom26.1 = sext i32 %add25.1 to i64
  %arrayidx27.1 = getelementptr inbounds [4 x i8], ptr %q, i64 %idxprom26.1
  %20 = load float, ptr %arrayidx27.1, align 4, !tbaa !11
  %21 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul32.1 = fmul contract float %20, %21
  %add34.1 = add nsw i32 %mul24.1, %add
  %idxprom35.1 = sext i32 %add34.1 to i64
  %arrayidx36.1 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom35.1
  %22 = load float, ptr %arrayidx36.1, align 4, !tbaa !11
  %sub.1 = fsub contract float %22, %mul32.1
  store float %sub.1, ptr %arrayidx36.1, align 4, !tbaa !11
  %inc38.1 = shl i32 %i.166, 11
  %mul24.2 = or disjoint i32 %inc38.1, 4096
  %add25.2 = add nsw i32 %mul24.2, %k
  %idxprom26.2 = sext i32 %add25.2 to i64
  %arrayidx27.2 = getelementptr inbounds [4 x i8], ptr %q, i64 %idxprom26.2
  %23 = load float, ptr %arrayidx27.2, align 4, !tbaa !11
  %24 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul32.2 = fmul contract float %23, %24
  %add34.2 = add nsw i32 %mul24.2, %add
  %idxprom35.2 = sext i32 %add34.2 to i64
  %arrayidx36.2 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom35.2
  %25 = load float, ptr %arrayidx36.2, align 4, !tbaa !11
  %sub.2 = fsub contract float %25, %mul32.2
  store float %sub.2, ptr %arrayidx36.2, align 4, !tbaa !11
  %inc38.2 = shl i32 %i.166, 11
  %mul24.3 = or disjoint i32 %inc38.2, 6144
  %add25.3 = add nsw i32 %mul24.3, %k
  %idxprom26.3 = sext i32 %add25.3 to i64
  %arrayidx27.3 = getelementptr inbounds [4 x i8], ptr %q, i64 %idxprom26.3
  %26 = load float, ptr %arrayidx27.3, align 4, !tbaa !11
  %27 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul32.3 = fmul contract float %26, %27
  %add34.3 = add nsw i32 %mul24.3, %add
  %idxprom35.3 = sext i32 %add34.3 to i64
  %arrayidx36.3 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom35.3
  %28 = load float, ptr %arrayidx36.3, align 4, !tbaa !11
  %sub.3 = fsub contract float %28, %mul32.3
  store float %sub.3, ptr %arrayidx36.3, align 4, !tbaa !11
  %inc38.3 = add nuw nsw i32 %i.166, 4
  %niter74.next.3 = add i32 %niter74, 4
  %niter74.ncmp.3 = icmp eq i32 %niter74.next.3, %unroll_iter73
  br i1 %niter74.ncmp.3, label %if.end.loopexit.unr-lcssa, label %for.body23, !llvm.loop !19

if.end.loopexit.unr-lcssa:                        ; preds = %for.body23
  %lcmp.mod71.not = icmp eq i32 %xtraiter69, 0
  br i1 %lcmp.mod71.not, label %if.end, label %for.body23.epil.preheader

for.body23.epil.preheader:                        ; preds = %if.end.loopexit.unr-lcssa, %for.body23.preheader
  %i.166.epil.init = phi i32 [ 0, %for.body23.preheader ], [ %inc38.3, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod72 = icmp ne i32 %xtraiter69, 0
  tail call void @llvm.assume(i1 %lcmp.mod72)
  br label %for.body23.epil

for.body23.epil:                                  ; preds = %for.body23.epil, %for.body23.epil.preheader
  %i.166.epil = phi i32 [ %inc38.epil, %for.body23.epil ], [ %i.166.epil.init, %for.body23.epil.preheader ]
  %epil.iter70 = phi i32 [ %epil.iter70.next, %for.body23.epil ], [ 0, %for.body23.epil.preheader ]
  %mul24.epil = shl nuw nsw i32 %i.166.epil, 11
  %add25.epil = add nsw i32 %mul24.epil, %k
  %idxprom26.epil = sext i32 %add25.epil to i64
  %arrayidx27.epil = getelementptr inbounds [4 x i8], ptr %q, i64 %idxprom26.epil
  %29 = load float, ptr %arrayidx27.epil, align 4, !tbaa !11
  %30 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul32.epil = fmul contract float %29, %30
  %add34.epil = add nsw i32 %mul24.epil, %add
  %idxprom35.epil = sext i32 %add34.epil to i64
  %arrayidx36.epil = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom35.epil
  %31 = load float, ptr %arrayidx36.epil, align 4, !tbaa !11
  %sub.epil = fsub contract float %31, %mul32.epil
  store float %sub.epil, ptr %arrayidx36.epil, align 4, !tbaa !11
  %inc38.epil = add nuw nsw i32 %i.166.epil, 1
  %epil.iter70.next = add i32 %epil.iter70, 1
  %epil.iter70.cmp.not = icmp eq i32 %epil.iter70.next, %xtraiter69
  br i1 %epil.iter70.cmp.not, label %if.end, label %for.body23.epil, !llvm.loop !20

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body23.epil, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.sqrt.approx.f(float) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #5

attributes #0 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #2 = { mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
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
