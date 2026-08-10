; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GEMVER/gemver.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GEMVER/gemver.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z14gemver_kernel1iffPfS_S_S_S_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr nofree noundef captures(none) %a, ptr nofree noundef readonly captures(none) %v1, ptr nofree noundef readonly captures(none) %v2, ptr nofree noundef readonly captures(none) %u1, ptr nofree noundef readonly captures(none) %u2) local_unnamed_addr #0 {
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
  %cmp8 = icmp slt i32 %add, %n
  %or.cond = and i1 %cmp, %cmp8
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %idxprom = zext nneg i32 %add7 to i64
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %u1, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  %idxprom9 = sext i32 %add to i64
  %arrayidx10 = getelementptr inbounds [4 x i8], ptr %v1, i64 %idxprom9
  %7 = load float, ptr %arrayidx10, align 4, !tbaa !11
  %mul11 = fmul contract float %6, %7
  %arrayidx13 = getelementptr inbounds nuw [4 x i8], ptr %u2, i64 %idxprom
  %8 = load float, ptr %arrayidx13, align 4, !tbaa !11
  %arrayidx15 = getelementptr inbounds [4 x i8], ptr %v2, i64 %idxprom9
  %9 = load float, ptr %arrayidx15, align 4, !tbaa !11
  %mul16 = fmul contract float %8, %9
  %add17 = fadd contract float %mul11, %mul16
  %mul18 = shl nsw i32 %add7, 12
  %add19 = add nsw i32 %mul18, %add
  %idxprom20 = sext i32 %add19 to i64
  %arrayidx21 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom20
  %10 = load float, ptr %arrayidx21, align 4, !tbaa !11
  %add22 = fadd contract float %10, %add17
  store float %add22, ptr %arrayidx21, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z14gemver_kernel2iffPfS_S_S_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr nofree noundef readonly captures(none) %a, ptr nofree noundef captures(none) %x, ptr nofree noundef readonly captures(none) %y, ptr nofree noundef readonly captures(none) %z) local_unnamed_addr #1 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %n
  br i1 %cmp, label %for.cond.preheader, label %if.end

for.cond.preheader:                               ; preds = %entry
  %cmp327 = icmp sgt i32 %n, 0
  %idxprom10 = sext i32 %add to i64
  %arrayidx11 = getelementptr inbounds [4 x i8], ptr %x, i64 %idxprom10
  %arrayidx11.promoted = load float, ptr %arrayidx11, align 4, !tbaa !11
  br i1 %cmp327, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %for.cond.preheader
  %xtraiter = and i32 %n, 3
  %3 = icmp ult i32 %n, 4
  br i1 %3, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %n, 2147483644
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %add1229 = phi float [ %arrayidx11.promoted, %for.body.preheader.new ], [ %add12.3, %for.body ]
  %j.028 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.3, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.3, %for.body ]
  %mul4 = shl nuw nsw i32 %j.028, 12
  %add5 = add nsw i32 %mul4, %add
  %idxprom = sext i32 %add5 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom
  %4 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul6 = fmul contract float %beta, %4
  %idxprom7 = zext nneg i32 %j.028 to i64
  %arrayidx8 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %idxprom7
  %5 = load float, ptr %arrayidx8, align 4, !tbaa !11
  %mul9 = fmul contract float %mul6, %5
  %add12 = fadd contract float %add1229, %mul9
  store float %add12, ptr %arrayidx11, align 4, !tbaa !11
  %inc = or disjoint i32 %j.028, 1
  %mul4.1 = shl nuw nsw i32 %inc, 12
  %add5.1 = add nsw i32 %mul4.1, %add
  %idxprom.1 = sext i32 %add5.1 to i64
  %arrayidx.1 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom.1
  %6 = load float, ptr %arrayidx.1, align 4, !tbaa !11
  %mul6.1 = fmul contract float %beta, %6
  %idxprom7.1 = zext nneg i32 %inc to i64
  %arrayidx8.1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %idxprom7.1
  %7 = load float, ptr %arrayidx8.1, align 4, !tbaa !11
  %mul9.1 = fmul contract float %mul6.1, %7
  %add12.1 = fadd contract float %add12, %mul9.1
  store float %add12.1, ptr %arrayidx11, align 4, !tbaa !11
  %inc.1 = or disjoint i32 %j.028, 2
  %mul4.2 = shl nuw nsw i32 %inc.1, 12
  %add5.2 = add nsw i32 %mul4.2, %add
  %idxprom.2 = sext i32 %add5.2 to i64
  %arrayidx.2 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom.2
  %8 = load float, ptr %arrayidx.2, align 4, !tbaa !11
  %mul6.2 = fmul contract float %beta, %8
  %idxprom7.2 = zext nneg i32 %inc.1 to i64
  %arrayidx8.2 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %idxprom7.2
  %9 = load float, ptr %arrayidx8.2, align 4, !tbaa !11
  %mul9.2 = fmul contract float %mul6.2, %9
  %add12.2 = fadd contract float %add12.1, %mul9.2
  store float %add12.2, ptr %arrayidx11, align 4, !tbaa !11
  %inc.2 = or disjoint i32 %j.028, 3
  %mul4.3 = shl nuw nsw i32 %inc.2, 12
  %add5.3 = add nsw i32 %mul4.3, %add
  %idxprom.3 = sext i32 %add5.3 to i64
  %arrayidx.3 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom.3
  %10 = load float, ptr %arrayidx.3, align 4, !tbaa !11
  %mul6.3 = fmul contract float %beta, %10
  %idxprom7.3 = zext nneg i32 %inc.2 to i64
  %arrayidx8.3 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %idxprom7.3
  %11 = load float, ptr %arrayidx8.3, align 4, !tbaa !11
  %mul9.3 = fmul contract float %mul6.3, %11
  %add12.3 = fadd contract float %add12.2, %mul9.3
  store float %add12.3, ptr %arrayidx11, align 4, !tbaa !11
  %inc.3 = add nuw nsw i32 %j.028, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !13

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.preheader
  %add1229.epil.init = phi float [ %arrayidx11.promoted, %for.body.preheader ], [ %add12.3, %for.end.loopexit.unr-lcssa ]
  %j.028.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.3, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod31 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod31)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add1229.epil = phi float [ %add12.epil, %for.body.epil ], [ %add1229.epil.init, %for.body.epil.preheader ]
  %j.028.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %j.028.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %mul4.epil = shl nuw nsw i32 %j.028.epil, 12
  %add5.epil = add nsw i32 %mul4.epil, %add
  %idxprom.epil = sext i32 %add5.epil to i64
  %arrayidx.epil = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom.epil
  %12 = load float, ptr %arrayidx.epil, align 4, !tbaa !11
  %mul6.epil = fmul contract float %beta, %12
  %idxprom7.epil = zext nneg i32 %j.028.epil to i64
  %arrayidx8.epil = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %idxprom7.epil
  %13 = load float, ptr %arrayidx8.epil, align 4, !tbaa !11
  %mul9.epil = fmul contract float %mul6.epil, %13
  %add12.epil = fadd contract float %add1229.epil, %mul9.epil
  store float %add12.epil, ptr %arrayidx11, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %j.028.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body.epil, !llvm.loop !15

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil, %for.cond.preheader
  %14 = phi float [ %arrayidx11.promoted, %for.cond.preheader ], [ %add12.3, %for.end.loopexit.unr-lcssa ], [ %add12.epil, %for.body.epil ]
  %arrayidx14 = getelementptr inbounds [4 x i8], ptr %z, i64 %idxprom10
  %15 = load float, ptr %arrayidx14, align 4, !tbaa !11
  %arrayidx16 = getelementptr inbounds [4 x i8], ptr %x, i64 %idxprom10
  %add17 = fadd contract float %15, %14
  store float %add17, ptr %arrayidx16, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z14gemver_kernel3iffPfS_S_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr nofree noundef readonly captures(none) %a, ptr nofree noundef readonly captures(none) %x, ptr nofree noundef captures(none) %w) local_unnamed_addr #1 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp sgt i32 %add, -1
  %cmp3 = icmp slt i32 %add, %n
  %or.cond = and i1 %cmp, %cmp3
  %cmp421 = icmp sgt i32 %n, 0
  %or.cond24 = and i1 %or.cond, %cmp421
  br i1 %or.cond24, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %entry
  %mul5 = shl nsw i32 %add, 12
  %idxprom11 = zext nneg i32 %add to i64
  %arrayidx12 = getelementptr inbounds nuw [4 x i8], ptr %w, i64 %idxprom11
  %arrayidx12.promoted = load float, ptr %arrayidx12, align 4, !tbaa !11
  %xtraiter = and i32 %n, 3
  %3 = icmp ult i32 %n, 4
  br i1 %3, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %n, 2147483644
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %add1323 = phi float [ %arrayidx12.promoted, %for.body.lr.ph.new ], [ %add13.3, %for.body ]
  %j.022 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.3, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.3, %for.body ]
  %add6 = add nuw nsw i32 %j.022, %mul5
  %idxprom = zext nneg i32 %add6 to i64
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom
  %4 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul7 = fmul contract float %alpha, %4
  %idxprom8 = zext nneg i32 %j.022 to i64
  %arrayidx9 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom8
  %5 = load float, ptr %arrayidx9, align 4, !tbaa !11
  %mul10 = fmul contract float %mul7, %5
  %add13 = fadd contract float %add1323, %mul10
  store float %add13, ptr %arrayidx12, align 4, !tbaa !11
  %inc = or disjoint i32 %j.022, 1
  %add6.1 = add nuw nsw i32 %inc, %mul5
  %idxprom.1 = zext nneg i32 %add6.1 to i64
  %arrayidx.1 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom.1
  %6 = load float, ptr %arrayidx.1, align 4, !tbaa !11
  %mul7.1 = fmul contract float %alpha, %6
  %idxprom8.1 = zext nneg i32 %inc to i64
  %arrayidx9.1 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom8.1
  %7 = load float, ptr %arrayidx9.1, align 4, !tbaa !11
  %mul10.1 = fmul contract float %mul7.1, %7
  %add13.1 = fadd contract float %add13, %mul10.1
  store float %add13.1, ptr %arrayidx12, align 4, !tbaa !11
  %inc.1 = or disjoint i32 %j.022, 2
  %add6.2 = add nuw nsw i32 %inc.1, %mul5
  %idxprom.2 = zext nneg i32 %add6.2 to i64
  %arrayidx.2 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom.2
  %8 = load float, ptr %arrayidx.2, align 4, !tbaa !11
  %mul7.2 = fmul contract float %alpha, %8
  %idxprom8.2 = zext nneg i32 %inc.1 to i64
  %arrayidx9.2 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom8.2
  %9 = load float, ptr %arrayidx9.2, align 4, !tbaa !11
  %mul10.2 = fmul contract float %mul7.2, %9
  %add13.2 = fadd contract float %add13.1, %mul10.2
  store float %add13.2, ptr %arrayidx12, align 4, !tbaa !11
  %inc.2 = or disjoint i32 %j.022, 3
  %add6.3 = add nuw nsw i32 %inc.2, %mul5
  %idxprom.3 = zext nneg i32 %add6.3 to i64
  %arrayidx.3 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom.3
  %10 = load float, ptr %arrayidx.3, align 4, !tbaa !11
  %mul7.3 = fmul contract float %alpha, %10
  %idxprom8.3 = zext nneg i32 %inc.2 to i64
  %arrayidx9.3 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom8.3
  %11 = load float, ptr %arrayidx9.3, align 4, !tbaa !11
  %mul10.3 = fmul contract float %mul7.3, %11
  %add13.3 = fadd contract float %add13.2, %mul10.3
  store float %add13.3, ptr %arrayidx12, align 4, !tbaa !11
  %inc.3 = add nuw nsw i32 %j.022, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !17

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.lr.ph
  %add1323.epil.init = phi float [ %arrayidx12.promoted, %for.body.lr.ph ], [ %add13.3, %if.end.loopexit.unr-lcssa ]
  %j.022.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.3, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod25 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod25)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add1323.epil = phi float [ %add1323.epil.init, %for.body.epil.preheader ], [ %add13.epil, %for.body.epil ]
  %j.022.epil = phi i32 [ %j.022.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %add6.epil = add nuw nsw i32 %j.022.epil, %mul5
  %idxprom.epil = zext nneg i32 %add6.epil to i64
  %arrayidx.epil = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom.epil
  %12 = load float, ptr %arrayidx.epil, align 4, !tbaa !11
  %mul7.epil = fmul contract float %alpha, %12
  %idxprom8.epil = zext nneg i32 %j.022.epil to i64
  %arrayidx9.epil = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom8.epil
  %13 = load float, ptr %arrayidx9.epil, align 4, !tbaa !11
  %mul10.epil = fmul contract float %mul7.epil, %13
  %add13.epil = fadd contract float %add1323.epil, %mul10.epil
  store float %add13.epil, ptr %arrayidx12, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %j.022.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !18

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
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
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !16}
