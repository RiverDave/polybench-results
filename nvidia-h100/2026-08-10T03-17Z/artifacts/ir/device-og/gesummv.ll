; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GESUMMV/gesummv.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GESUMMV/gesummv.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z14gesummv_kerneliffPfS_S_S_S_(i32 noundef %n, float noundef %alpha, float noundef %beta, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %B, ptr nofree noundef captures(none) %tmp, ptr nofree noundef readonly captures(none) %x, ptr nofree noundef captures(none) %y) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %n
  br i1 %cmp, label %for.cond.preheader, label %if.end

for.cond.preheader:                               ; preds = %entry
  %cmp348 = icmp sgt i32 %n, 0
  br i1 %cmp348, label %for.body.lr.ph, label %for.cond.preheader.for.end_crit_edge

for.cond.preheader.for.end_crit_edge:             ; preds = %for.cond.preheader
  %idxprom22.phi.trans.insert = sext i32 %add to i64
  %arrayidx26.phi.trans.insert = getelementptr inbounds [4 x i8], ptr %y, i64 %idxprom22.phi.trans.insert
  %.pre = load float, ptr %arrayidx26.phi.trans.insert, align 4, !tbaa !11
  br label %for.end

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %mul4 = shl nsw i32 %add, 12
  %idxprom9 = sext i32 %add to i64
  %arrayidx10 = getelementptr inbounds [4 x i8], ptr %tmp, i64 %idxprom9
  %arrayidx20 = getelementptr inbounds [4 x i8], ptr %y, i64 %idxprom9
  %xtraiter = and i32 %n, 1
  %3 = icmp eq i32 %n, 1
  br i1 %3, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %n, 2147483646
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %j.049 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.1, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.1, %for.body ]
  %add5 = add nsw i32 %j.049, %mul4
  %idxprom = sext i32 %add5 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom
  %4 = load float, ptr %arrayidx, align 4, !tbaa !11
  %idxprom6 = zext nneg i32 %j.049 to i64
  %arrayidx7 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom6
  %5 = load float, ptr %arrayidx7, align 4, !tbaa !11
  %mul8 = fmul contract float %4, %5
  %6 = load float, ptr %arrayidx10, align 4, !tbaa !11
  %add11 = fadd contract float %6, %mul8
  store float %add11, ptr %arrayidx10, align 4, !tbaa !11
  %arrayidx15 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom
  %7 = load float, ptr %arrayidx15, align 4, !tbaa !11
  %8 = load float, ptr %arrayidx7, align 4, !tbaa !11
  %mul18 = fmul contract float %7, %8
  %9 = load float, ptr %arrayidx20, align 4, !tbaa !11
  %add21 = fadd contract float %9, %mul18
  store float %add21, ptr %arrayidx20, align 4, !tbaa !11
  %inc = or disjoint i32 %j.049, 1
  %add5.1 = add nsw i32 %inc, %mul4
  %idxprom.1 = sext i32 %add5.1 to i64
  %arrayidx.1 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom.1
  %10 = load float, ptr %arrayidx.1, align 4, !tbaa !11
  %idxprom6.1 = zext nneg i32 %inc to i64
  %arrayidx7.1 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom6.1
  %11 = load float, ptr %arrayidx7.1, align 4, !tbaa !11
  %mul8.1 = fmul contract float %10, %11
  %12 = load float, ptr %arrayidx10, align 4, !tbaa !11
  %add11.1 = fadd contract float %12, %mul8.1
  store float %add11.1, ptr %arrayidx10, align 4, !tbaa !11
  %arrayidx15.1 = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom.1
  %13 = load float, ptr %arrayidx15.1, align 4, !tbaa !11
  %14 = load float, ptr %arrayidx7.1, align 4, !tbaa !11
  %mul18.1 = fmul contract float %13, %14
  %15 = load float, ptr %arrayidx20, align 4, !tbaa !11
  %add21.1 = fadd contract float %15, %mul18.1
  store float %add21.1, ptr %arrayidx20, align 4, !tbaa !11
  %inc.1 = add nuw nsw i32 %j.049, 2
  %niter.next.1 = add nuw nsw i32 %niter, 2
  %niter.ncmp.1 = icmp eq i32 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !13

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.lr.ph
  %j.049.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.1, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod51 = trunc i32 %n to i1
  tail call void @llvm.assume(i1 %lcmp.mod51)
  %add5.epil = add nsw i32 %j.049.epil.init, %mul4
  %idxprom.epil = sext i32 %add5.epil to i64
  %arrayidx.epil = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom.epil
  %16 = load float, ptr %arrayidx.epil, align 4, !tbaa !11
  %idxprom6.epil = zext nneg i32 %j.049.epil.init to i64
  %arrayidx7.epil = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom6.epil
  %17 = load float, ptr %arrayidx7.epil, align 4, !tbaa !11
  %mul8.epil = fmul contract float %16, %17
  %18 = load float, ptr %arrayidx10, align 4, !tbaa !11
  %add11.epil = fadd contract float %18, %mul8.epil
  store float %add11.epil, ptr %arrayidx10, align 4, !tbaa !11
  %arrayidx15.epil = getelementptr inbounds [4 x i8], ptr %B, i64 %idxprom.epil
  %19 = load float, ptr %arrayidx15.epil, align 4, !tbaa !11
  %20 = load float, ptr %arrayidx7.epil, align 4, !tbaa !11
  %mul18.epil = fmul contract float %19, %20
  %21 = load float, ptr %arrayidx20, align 4, !tbaa !11
  %add21.epil = fadd contract float %21, %mul18.epil
  store float %add21.epil, ptr %arrayidx20, align 4, !tbaa !11
  br label %for.end

for.end:                                          ; preds = %for.body.epil.preheader, %for.end.loopexit.unr-lcssa, %for.cond.preheader.for.end_crit_edge
  %idxprom22.pre-phi = phi i64 [ %idxprom22.phi.trans.insert, %for.cond.preheader.for.end_crit_edge ], [ %idxprom9, %for.end.loopexit.unr-lcssa ], [ %idxprom9, %for.body.epil.preheader ]
  %22 = phi float [ %.pre, %for.cond.preheader.for.end_crit_edge ], [ %add21.1, %for.end.loopexit.unr-lcssa ], [ %add21.epil, %for.body.epil.preheader ]
  %arrayidx23 = getelementptr inbounds [4 x i8], ptr %tmp, i64 %idxprom22.pre-phi
  %23 = load float, ptr %arrayidx23, align 4, !tbaa !11
  %mul24 = fmul contract float %alpha, %23
  %arrayidx26 = getelementptr inbounds [4 x i8], ptr %y, i64 %idxprom22.pre-phi
  %mul27 = fmul contract float %beta, %22
  %add28 = fadd contract float %mul24, %mul27
  store float %add28, ptr %arrayidx26, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

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
