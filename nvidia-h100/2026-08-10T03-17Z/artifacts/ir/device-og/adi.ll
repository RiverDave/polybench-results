; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11adi_kernel1iPfS_S_(i32 noundef %n, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef captures(none) %B, ptr nofree noundef captures(none) %X) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %n
  %cmp378 = icmp sgt i32 %n, 1
  %or.cond = and i1 %cmp, %cmp378
  br i1 %or.cond, label %for.body.lver.check, label %if.end

for.body.lver.check:                              ; preds = %entry
  %mul4 = shl nsw i32 %add, 10
  %invariant.op = add i32 %mul4, -1
  %3 = sext i32 %mul4 to i64
  %4 = shl nsw i64 %3, 2
  %scevgep = getelementptr i8, ptr %X, i64 %4
  %5 = add nsw i32 %n, -2
  %6 = zext i32 %5 to i64
  %7 = add nsw i64 %3, %6
  %8 = shl nsw i64 %7, 2
  %9 = add nsw i64 %8, 8
  %scevgep80 = getelementptr i8, ptr %X, i64 %9
  %scevgep81 = getelementptr i8, ptr %B, i64 %4
  %scevgep82 = getelementptr i8, ptr %B, i64 %9
  %bound0 = icmp ult ptr %scevgep, %scevgep82
  %bound1 = icmp ult ptr %scevgep81, %scevgep80
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.lver.orig.preheader, label %for.body.ph

for.body.lver.orig.preheader:                     ; preds = %for.body.lver.check
  %10 = add nsw i32 %n, -1
  %xtraiter92 = and i32 %10, 1
  %11 = icmp eq i32 %5, 0
  br i1 %11, label %for.body.lver.orig.epil.preheader, label %for.body.lver.orig.preheader.new

for.body.lver.orig.preheader.new:                 ; preds = %for.body.lver.orig.preheader
  %unroll_iter95 = and i32 %10, -2
  %invariant.op98 = add i32 1, %mul4
  br label %for.body.lver.orig

for.body.lver.orig:                               ; preds = %for.body.lver.orig, %for.body.lver.orig.preheader.new
  %i2.079.lver.orig = phi i32 [ 1, %for.body.lver.orig.preheader.new ], [ %inc.lver.orig.1, %for.body.lver.orig ]
  %niter96 = phi i32 [ 0, %for.body.lver.orig.preheader.new ], [ %niter96.next.1, %for.body.lver.orig ]
  %add5.lver.orig = add nsw i32 %i2.079.lver.orig, %mul4
  %idxprom.lver.orig = sext i32 %add5.lver.orig to i64
  %arrayidx.lver.orig = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom.lver.orig
  %12 = load float, ptr %arrayidx.lver.orig, align 4, !tbaa !11
  %add7.reass.lver.orig = add i32 %i2.079.lver.orig, %invariant.op
  %idxprom8.lver.orig = sext i32 %add7.reass.lver.orig to i64
  %arrayidx9.lver.orig = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom8.lver.orig
  %13 = load float, ptr %arrayidx9.lver.orig, align 4, !tbaa !11
  %arrayidx13.lver.orig = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom.lver.orig
  %14 = load float, ptr %arrayidx13.lver.orig, align 4, !tbaa !11
  %mul14.lver.orig = fmul contract float %13, %14
  %arrayidx19.lver.orig = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom8.lver.orig
  %15 = load float, ptr %arrayidx19.lver.orig, align 4, !tbaa !11
  %div.lver.orig = fdiv contract float %mul14.lver.orig, %15
  %sub20.lver.orig = fsub contract float %12, %div.lver.orig
  store float %sub20.lver.orig, ptr %arrayidx.lver.orig, align 4, !tbaa !11
  %arrayidx28.lver.orig = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom.lver.orig
  %16 = load float, ptr %arrayidx28.lver.orig, align 4, !tbaa !11
  %17 = load float, ptr %arrayidx13.lver.orig, align 4, !tbaa !11
  %mul37.lver.orig = fmul contract float %17, %17
  %18 = load float, ptr %arrayidx19.lver.orig, align 4, !tbaa !11
  %div43.lver.orig = fdiv contract float %mul37.lver.orig, %18
  %sub44.lver.orig = fsub contract float %16, %div43.lver.orig
  store float %sub44.lver.orig, ptr %arrayidx28.lver.orig, align 4, !tbaa !11
  %add5.lver.orig.1.reass = add i32 %i2.079.lver.orig, %invariant.op98
  %idxprom.lver.orig.1 = sext i32 %add5.lver.orig.1.reass to i64
  %arrayidx.lver.orig.1 = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom.lver.orig.1
  %19 = load float, ptr %arrayidx.lver.orig.1, align 4, !tbaa !11
  %add7.reass.lver.orig.1 = add i32 %i2.079.lver.orig, %mul4
  %idxprom8.lver.orig.1 = sext i32 %add7.reass.lver.orig.1 to i64
  %arrayidx9.lver.orig.1 = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom8.lver.orig.1
  %20 = load float, ptr %arrayidx9.lver.orig.1, align 4, !tbaa !11
  %arrayidx13.lver.orig.1 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom.lver.orig.1
  %21 = load float, ptr %arrayidx13.lver.orig.1, align 4, !tbaa !11
  %mul14.lver.orig.1 = fmul contract float %20, %21
  %arrayidx19.lver.orig.1 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom8.lver.orig.1
  %22 = load float, ptr %arrayidx19.lver.orig.1, align 4, !tbaa !11
  %div.lver.orig.1 = fdiv contract float %mul14.lver.orig.1, %22
  %sub20.lver.orig.1 = fsub contract float %19, %div.lver.orig.1
  store float %sub20.lver.orig.1, ptr %arrayidx.lver.orig.1, align 4, !tbaa !11
  %arrayidx28.lver.orig.1 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom.lver.orig.1
  %23 = load float, ptr %arrayidx28.lver.orig.1, align 4, !tbaa !11
  %24 = load float, ptr %arrayidx13.lver.orig.1, align 4, !tbaa !11
  %mul37.lver.orig.1 = fmul contract float %24, %24
  %25 = load float, ptr %arrayidx19.lver.orig.1, align 4, !tbaa !11
  %div43.lver.orig.1 = fdiv contract float %mul37.lver.orig.1, %25
  %sub44.lver.orig.1 = fsub contract float %23, %div43.lver.orig.1
  store float %sub44.lver.orig.1, ptr %arrayidx28.lver.orig.1, align 4, !tbaa !11
  %inc.lver.orig.1 = add nuw nsw i32 %i2.079.lver.orig, 2
  %niter96.next.1 = add nuw i32 %niter96, 2
  %niter96.ncmp.1 = icmp eq i32 %niter96.next.1, %unroll_iter95
  br i1 %niter96.ncmp.1, label %if.end.loopexit.unr-lcssa, label %for.body.lver.orig, !llvm.loop !13

for.body.ph:                                      ; preds = %for.body.lver.check
  %26 = sext i32 %mul4 to i64
  %27 = shl nsw i64 %26, 2
  %scevgep84 = getelementptr i8, ptr %X, i64 %27
  %load_initial = load float, ptr %scevgep84, align 4
  %scevgep85 = getelementptr i8, ptr %B, i64 %27
  %load_initial86 = load float, ptr %scevgep85, align 4
  %28 = add nsw i32 %n, -1
  %xtraiter = and i32 %28, 1
  %29 = icmp eq i32 %5, 0
  br i1 %29, label %for.body.epil.preheader, label %for.body.ph.new

for.body.ph.new:                                  ; preds = %for.body.ph
  %unroll_iter = and i32 %28, -2
  %invariant.op97 = add i32 1, %mul4
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.ph.new
  %store_forwarded87 = phi float [ %load_initial86, %for.body.ph.new ], [ %sub44.1, %for.body ]
  %store_forwarded = phi float [ %load_initial, %for.body.ph.new ], [ %sub20.1, %for.body ]
  %i2.079 = phi i32 [ 1, %for.body.ph.new ], [ %inc.1, %for.body ]
  %niter = phi i32 [ 0, %for.body.ph.new ], [ %niter.next.1, %for.body ]
  %add5 = add nsw i32 %i2.079, %mul4
  %idxprom = sext i32 %add5 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom
  %30 = load float, ptr %arrayidx, align 4, !tbaa !11
  %arrayidx13 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom
  %31 = load float, ptr %arrayidx13, align 4, !tbaa !11
  %mul14 = fmul contract float %store_forwarded, %31
  %div = fdiv contract float %mul14, %store_forwarded87
  %sub20 = fsub contract float %30, %div
  store float %sub20, ptr %arrayidx, align 4, !tbaa !11
  %arrayidx28 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom
  %32 = load float, ptr %arrayidx28, align 4, !tbaa !11
  %33 = load float, ptr %arrayidx13, align 4, !tbaa !11
  %mul37 = fmul contract float %33, %33
  %div43 = fdiv contract float %mul37, %store_forwarded87
  %sub44 = fsub contract float %32, %div43
  store float %sub44, ptr %arrayidx28, align 4, !tbaa !11
  %add5.1.reass = add i32 %i2.079, %invariant.op97
  %idxprom.1 = sext i32 %add5.1.reass to i64
  %arrayidx.1 = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom.1
  %34 = load float, ptr %arrayidx.1, align 4, !tbaa !11
  %arrayidx13.1 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom.1
  %35 = load float, ptr %arrayidx13.1, align 4, !tbaa !11
  %mul14.1 = fmul contract float %sub20, %35
  %div.1 = fdiv contract float %mul14.1, %sub44
  %sub20.1 = fsub contract float %34, %div.1
  store float %sub20.1, ptr %arrayidx.1, align 4, !tbaa !11
  %arrayidx28.1 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom.1
  %36 = load float, ptr %arrayidx28.1, align 4, !tbaa !11
  %37 = load float, ptr %arrayidx13.1, align 4, !tbaa !11
  %mul37.1 = fmul contract float %37, %37
  %div43.1 = fdiv contract float %mul37.1, %sub44
  %sub44.1 = fsub contract float %36, %div43.1
  store float %sub44.1, ptr %arrayidx28.1, align 4, !tbaa !11
  %inc.1 = add nuw nsw i32 %i2.079, 2
  %niter.next.1 = add nuw i32 %niter, 2
  %niter.ncmp.1 = icmp eq i32 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %if.end.loopexit90.unr-lcssa, label %for.body, !llvm.loop !13

if.end.loopexit.unr-lcssa:                        ; preds = %for.body.lver.orig
  %lcmp.mod93.not = icmp eq i32 %xtraiter92, 0
  br i1 %lcmp.mod93.not, label %if.end, label %for.body.lver.orig.epil.preheader

for.body.lver.orig.epil.preheader:                ; preds = %if.end.loopexit.unr-lcssa, %for.body.lver.orig.preheader
  %i2.079.lver.orig.epil.init = phi i32 [ 1, %for.body.lver.orig.preheader ], [ %inc.lver.orig.1, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod94 = trunc i32 %10 to i1
  tail call void @llvm.assume(i1 %lcmp.mod94)
  %add5.lver.orig.epil = add nsw i32 %i2.079.lver.orig.epil.init, %mul4
  %idxprom.lver.orig.epil = sext i32 %add5.lver.orig.epil to i64
  %arrayidx.lver.orig.epil = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom.lver.orig.epil
  %38 = load float, ptr %arrayidx.lver.orig.epil, align 4, !tbaa !11
  %add7.reass.lver.orig.epil = add i32 %i2.079.lver.orig.epil.init, %invariant.op
  %idxprom8.lver.orig.epil = sext i32 %add7.reass.lver.orig.epil to i64
  %arrayidx9.lver.orig.epil = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom8.lver.orig.epil
  %39 = load float, ptr %arrayidx9.lver.orig.epil, align 4, !tbaa !11
  %arrayidx13.lver.orig.epil = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom.lver.orig.epil
  %40 = load float, ptr %arrayidx13.lver.orig.epil, align 4, !tbaa !11
  %mul14.lver.orig.epil = fmul contract float %39, %40
  %arrayidx19.lver.orig.epil = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom8.lver.orig.epil
  %41 = load float, ptr %arrayidx19.lver.orig.epil, align 4, !tbaa !11
  %div.lver.orig.epil = fdiv contract float %mul14.lver.orig.epil, %41
  %sub20.lver.orig.epil = fsub contract float %38, %div.lver.orig.epil
  store float %sub20.lver.orig.epil, ptr %arrayidx.lver.orig.epil, align 4, !tbaa !11
  %arrayidx28.lver.orig.epil = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom.lver.orig.epil
  %42 = load float, ptr %arrayidx28.lver.orig.epil, align 4, !tbaa !11
  %43 = load float, ptr %arrayidx13.lver.orig.epil, align 4, !tbaa !11
  %mul37.lver.orig.epil = fmul contract float %43, %43
  %44 = load float, ptr %arrayidx19.lver.orig.epil, align 4, !tbaa !11
  %div43.lver.orig.epil = fdiv contract float %mul37.lver.orig.epil, %44
  %sub44.lver.orig.epil = fsub contract float %42, %div43.lver.orig.epil
  store float %sub44.lver.orig.epil, ptr %arrayidx28.lver.orig.epil, align 4, !tbaa !11
  br label %if.end

if.end.loopexit90.unr-lcssa:                      ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit90.unr-lcssa, %for.body.ph
  %store_forwarded87.epil.init = phi float [ %load_initial86, %for.body.ph ], [ %sub44.1, %if.end.loopexit90.unr-lcssa ]
  %store_forwarded.epil.init = phi float [ %load_initial, %for.body.ph ], [ %sub20.1, %if.end.loopexit90.unr-lcssa ]
  %i2.079.epil.init = phi i32 [ 1, %for.body.ph ], [ %inc.1, %if.end.loopexit90.unr-lcssa ]
  %lcmp.mod91 = trunc i32 %28 to i1
  tail call void @llvm.assume(i1 %lcmp.mod91)
  %add5.epil = add nsw i32 %i2.079.epil.init, %mul4
  %idxprom.epil = sext i32 %add5.epil to i64
  %arrayidx.epil = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom.epil
  %45 = load float, ptr %arrayidx.epil, align 4, !tbaa !11
  %arrayidx13.epil = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom.epil
  %46 = load float, ptr %arrayidx13.epil, align 4, !tbaa !11
  %mul14.epil = fmul contract float %store_forwarded.epil.init, %46
  %div.epil = fdiv contract float %mul14.epil, %store_forwarded87.epil.init
  %sub20.epil = fsub contract float %45, %div.epil
  store float %sub20.epil, ptr %arrayidx.epil, align 4, !tbaa !11
  %arrayidx28.epil = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom.epil
  %47 = load float, ptr %arrayidx28.epil, align 4, !tbaa !11
  %48 = load float, ptr %arrayidx13.epil, align 4, !tbaa !11
  %mul37.epil = fmul contract float %48, %48
  %div43.epil = fdiv contract float %mul37.epil, %store_forwarded87.epil.init
  %sub44.epil = fsub contract float %47, %div43.epil
  store float %sub44.epil, ptr %arrayidx28.epil, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %for.body.epil.preheader, %if.end.loopexit90.unr-lcssa, %for.body.lver.orig.epil.preheader, %if.end.loopexit.unr-lcssa, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11adi_kernel2iPfS_S_(i32 noundef %n, ptr nofree noundef readnone captures(none) %A, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef captures(none) %X) local_unnamed_addr #1 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %n
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul3 = shl nsw i32 %add, 10
  %add4 = or disjoint i32 %mul3, 1023
  %idxprom = sext i32 %add4 to i64
  %arrayidx8 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom
  %arrayidx = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom
  %3 = load float, ptr %arrayidx, align 4, !tbaa !11
  %4 = load float, ptr %arrayidx8, align 4, !tbaa !11
  %div = fdiv contract float %3, %4
  store float %div, ptr %arrayidx, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11adi_kernel3iPfS_S_(i32 noundef %n, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef captures(none) %X) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %n
  %cmp350 = icmp sgt i32 %n, 2
  %or.cond = and i1 %cmp, %cmp350
  br i1 %or.cond, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %entry
  %mul4 = shl nsw i32 %add, 10
  %xtraiter = and i32 %n, 1
  %3 = icmp eq i32 %n, 3
  br i1 %3, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %4 = and i32 %n, 2147483646
  %5 = add nsw i32 %4, -4
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %i2.051 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.1, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.1, %for.body ]
  %reass.sub = sub i32 %mul4, %i2.051
  %add6 = add i32 %reass.sub, 1022
  %idxprom = sext i32 %add6 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  %add10 = add i32 %reass.sub, 1021
  %idxprom11 = sext i32 %add10 to i64
  %arrayidx12 = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom11
  %7 = load float, ptr %arrayidx12, align 4, !tbaa !11
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom11
  %8 = load float, ptr %arrayidx18, align 4, !tbaa !11
  %mul19 = fmul contract float %7, %8
  %sub20 = fsub contract float %6, %mul19
  %arrayidx25 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom11
  %9 = load float, ptr %arrayidx25, align 4, !tbaa !11
  %div = fdiv contract float %sub20, %9
  store float %div, ptr %arrayidx, align 4, !tbaa !11
  %inc.neg = xor i32 %i2.051, -1
  %reass.sub.1 = add i32 %mul4, %inc.neg
  %add6.1 = add i32 %reass.sub.1, 1022
  %idxprom.1 = sext i32 %add6.1 to i64
  %arrayidx.1 = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom.1
  %add10.1 = add i32 %reass.sub.1, 1021
  %idxprom11.1 = sext i32 %add10.1 to i64
  %arrayidx12.1 = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom11.1
  %10 = load float, ptr %arrayidx12.1, align 4, !tbaa !11
  %arrayidx18.1 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom11.1
  %11 = load float, ptr %arrayidx18.1, align 4, !tbaa !11
  %mul19.1 = fmul contract float %10, %11
  %sub20.1 = fsub contract float %7, %mul19.1
  %arrayidx25.1 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom11.1
  %12 = load float, ptr %arrayidx25.1, align 4, !tbaa !11
  %div.1 = fdiv contract float %sub20.1, %12
  store float %div.1, ptr %arrayidx.1, align 4, !tbaa !11
  %inc.1 = add nuw nsw i32 %i2.051, 2
  %niter.next.1 = add i32 %niter, 2
  %niter.ncmp.1 = icmp eq i32 %niter, %5
  br i1 %niter.ncmp.1, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !15

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.lr.ph
  %i2.051.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.1, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod52 = trunc i32 %n to i1
  tail call void @llvm.assume(i1 %lcmp.mod52)
  %reass.sub.epil = sub i32 %mul4, %i2.051.epil.init
  %add6.epil = add i32 %reass.sub.epil, 1022
  %idxprom.epil = sext i32 %add6.epil to i64
  %arrayidx.epil = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom.epil
  %13 = load float, ptr %arrayidx.epil, align 4, !tbaa !11
  %add10.epil = add i32 %reass.sub.epil, 1021
  %idxprom11.epil = sext i32 %add10.epil to i64
  %arrayidx12.epil = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom11.epil
  %14 = load float, ptr %arrayidx12.epil, align 4, !tbaa !11
  %arrayidx18.epil = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom11.epil
  %15 = load float, ptr %arrayidx18.epil, align 4, !tbaa !11
  %mul19.epil = fmul contract float %14, %15
  %sub20.epil = fsub contract float %13, %mul19.epil
  %arrayidx25.epil = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom11.epil
  %16 = load float, ptr %arrayidx25.epil, align 4, !tbaa !11
  %div.epil = fdiv contract float %sub20.epil, %16
  store float %div.epil, ptr %arrayidx.epil, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %for.body.epil.preheader, %if.end.loopexit.unr-lcssa, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11adi_kernel4iPfS_S_i(i32 noundef %n, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef captures(none) %B, ptr nofree noundef captures(none) %X, i32 noundef %i1) local_unnamed_addr #1 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %n
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul3 = shl nsw i32 %i1, 10
  %add4 = add nsw i32 %mul3, %add
  %idxprom = sext i32 %add4 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom
  %3 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul5 = add i32 %mul3, -1024
  %add6 = add nsw i32 %mul5, %add
  %idxprom7 = sext i32 %add6 to i64
  %arrayidx8 = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom7
  %4 = load float, ptr %arrayidx8, align 4, !tbaa !11
  %arrayidx12 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom
  %5 = load float, ptr %arrayidx12, align 4, !tbaa !11
  %mul13 = fmul contract float %4, %5
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom7
  %6 = load float, ptr %arrayidx18, align 4, !tbaa !11
  %div = fdiv contract float %mul13, %6
  %sub19 = fsub contract float %3, %div
  store float %sub19, ptr %arrayidx, align 4, !tbaa !11
  %arrayidx27 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom
  %7 = load float, ptr %arrayidx27, align 4, !tbaa !11
  %8 = load float, ptr %arrayidx12, align 4, !tbaa !11
  %mul36 = fmul contract float %8, %8
  %9 = load float, ptr %arrayidx18, align 4, !tbaa !11
  %div42 = fdiv contract float %mul36, %9
  %sub43 = fsub contract float %7, %div42
  store float %sub43, ptr %arrayidx27, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11adi_kernel5iPfS_S_(i32 noundef %n, ptr nofree noundef readnone captures(none) %A, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef captures(none) %X) local_unnamed_addr #1 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %n
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %add3 = add nsw i32 %add, 1047552
  %idxprom = sext i32 %add3 to i64
  %arrayidx6 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom
  %arrayidx = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom
  %3 = load float, ptr %arrayidx, align 4, !tbaa !11
  %4 = load float, ptr %arrayidx6, align 4, !tbaa !11
  %div = fdiv contract float %3, %4
  store float %div, ptr %arrayidx, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11adi_kernel6iPfS_S_i(i32 noundef %n, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef captures(none) %X, i32 noundef %i1) local_unnamed_addr #1 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %n
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = shl i32 %i1, 10
  %reass.sub = sub i32 %add, %3
  %add4 = add i32 %reass.sub, 1046528
  %idxprom = sext i32 %add4 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom
  %4 = load float, ptr %arrayidx, align 4, !tbaa !11
  %add8 = add i32 %reass.sub, 1045504
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds [4 x i8], ptr %X, i64 %idxprom9
  %5 = load float, ptr %arrayidx10, align 4, !tbaa !11
  %arrayidx15 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom9
  %6 = load float, ptr %arrayidx15, align 4, !tbaa !11
  %mul16 = fmul contract float %5, %6
  %sub17 = fsub contract float %4, %mul16
  %arrayidx22 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom
  %7 = load float, ptr %arrayidx22, align 4, !tbaa !11
  %div = fdiv contract float %sub17, %7
  store float %div, ptr %arrayidx, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

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
!15 = distinct !{!15, !14}
