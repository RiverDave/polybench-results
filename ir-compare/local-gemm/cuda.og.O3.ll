; ModuleID = 'ir-compare/gemm_minimal.cpp'
source_filename = "ir-compare/gemm_minimal.cpp"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @gemm_kernel(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, float noundef %alpha, float noundef %beta, ptr nofree noundef readonly captures(none) %a, ptr nofree noundef readonly captures(none) %b, ptr nofree noundef captures(none) %c) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %mul5 = mul nuw nsw i32 %3, %4
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %add7 = add nuw nsw i32 %mul5, %5
  %cmp.not = icmp slt i32 %add7, %ni
  %cmp8.not = icmp slt i32 %add, %nj
  %or.cond = and i1 %cmp.not, %cmp8.not
  br i1 %or.cond, label %if.end, label %cleanup

if.end:                                           ; preds = %entry
  %mul9 = mul nsw i32 %nj, %add7
  %add10 = add nsw i32 %mul9, %add
  %idxprom = sext i32 %add10 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %c, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !7
  %mul11 = fmul contract float %beta, %6
  store float %mul11, ptr %arrayidx, align 4, !tbaa !7
  %cmp1239 = icmp sgt i32 %nk, 0
  br i1 %cmp1239, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.end
  %mul13 = mul nuw nsw i32 %nk, %add7
  %xtraiter = and i32 %nk, 3
  %7 = icmp ult i32 %nk, 4
  br i1 %7, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %nk, 2147483644
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %8 = phi float [ %mul11, %for.body.lr.ph.new ], [ %add25.3, %for.body ]
  %k.040 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.3, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.3, %for.body ]
  %add14 = add nuw nsw i32 %k.040, %mul13
  %idxprom15 = zext nneg i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom15
  %9 = load float, ptr %arrayidx16, align 4, !tbaa !7
  %mul17 = fmul contract float %alpha, %9
  %mul18 = mul nsw i32 %k.040, %nj
  %add19 = add nsw i32 %mul18, %add
  %idxprom20 = sext i32 %add19 to i64
  %arrayidx21 = getelementptr inbounds [4 x i8], ptr %b, i64 %idxprom20
  %10 = load float, ptr %arrayidx21, align 4, !tbaa !7
  %mul22 = fmul contract float %mul17, %10
  %add25 = fadd contract float %8, %mul22
  store float %add25, ptr %arrayidx, align 4, !tbaa !7
  %inc = or disjoint i32 %k.040, 1
  %add14.1 = add nuw nsw i32 %inc, %mul13
  %idxprom15.1 = zext nneg i32 %add14.1 to i64
  %arrayidx16.1 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom15.1
  %11 = load float, ptr %arrayidx16.1, align 4, !tbaa !7
  %mul17.1 = fmul contract float %alpha, %11
  %mul18.1 = mul nsw i32 %inc, %nj
  %add19.1 = add nsw i32 %mul18.1, %add
  %idxprom20.1 = sext i32 %add19.1 to i64
  %arrayidx21.1 = getelementptr inbounds [4 x i8], ptr %b, i64 %idxprom20.1
  %12 = load float, ptr %arrayidx21.1, align 4, !tbaa !7
  %mul22.1 = fmul contract float %mul17.1, %12
  %add25.1 = fadd contract float %add25, %mul22.1
  store float %add25.1, ptr %arrayidx, align 4, !tbaa !7
  %inc.1 = or disjoint i32 %k.040, 2
  %add14.2 = add nuw nsw i32 %inc.1, %mul13
  %idxprom15.2 = zext nneg i32 %add14.2 to i64
  %arrayidx16.2 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom15.2
  %13 = load float, ptr %arrayidx16.2, align 4, !tbaa !7
  %mul17.2 = fmul contract float %alpha, %13
  %mul18.2 = mul nsw i32 %inc.1, %nj
  %add19.2 = add nsw i32 %mul18.2, %add
  %idxprom20.2 = sext i32 %add19.2 to i64
  %arrayidx21.2 = getelementptr inbounds [4 x i8], ptr %b, i64 %idxprom20.2
  %14 = load float, ptr %arrayidx21.2, align 4, !tbaa !7
  %mul22.2 = fmul contract float %mul17.2, %14
  %add25.2 = fadd contract float %add25.1, %mul22.2
  store float %add25.2, ptr %arrayidx, align 4, !tbaa !7
  %inc.2 = or disjoint i32 %k.040, 3
  %add14.3 = add nuw nsw i32 %inc.2, %mul13
  %idxprom15.3 = zext nneg i32 %add14.3 to i64
  %arrayidx16.3 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom15.3
  %15 = load float, ptr %arrayidx16.3, align 4, !tbaa !7
  %mul17.3 = fmul contract float %alpha, %15
  %mul18.3 = mul nsw i32 %inc.2, %nj
  %add19.3 = add nsw i32 %mul18.3, %add
  %idxprom20.3 = sext i32 %add19.3 to i64
  %arrayidx21.3 = getelementptr inbounds [4 x i8], ptr %b, i64 %idxprom20.3
  %16 = load float, ptr %arrayidx21.3, align 4, !tbaa !7
  %mul22.3 = fmul contract float %mul17.3, %16
  %add25.3 = fadd contract float %add25.2, %mul22.3
  store float %add25.3, ptr %arrayidx, align 4, !tbaa !7
  %inc.3 = add nuw nsw i32 %k.040, 4
  %niter.next.3 = add i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %cleanup.loopexit.unr-lcssa, label %for.body, !llvm.loop !9

cleanup.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %cleanup, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %cleanup.loopexit.unr-lcssa, %for.body.lr.ph
  %.epil.init = phi float [ %mul11, %for.body.lr.ph ], [ %add25.3, %cleanup.loopexit.unr-lcssa ]
  %k.040.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.3, %cleanup.loopexit.unr-lcssa ]
  %lcmp.mod41 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod41)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %17 = phi float [ %.epil.init, %for.body.epil.preheader ], [ %add25.epil, %for.body.epil ]
  %k.040.epil = phi i32 [ %k.040.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %add14.epil = add nuw nsw i32 %k.040.epil, %mul13
  %idxprom15.epil = zext nneg i32 %add14.epil to i64
  %arrayidx16.epil = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom15.epil
  %18 = load float, ptr %arrayidx16.epil, align 4, !tbaa !7
  %mul17.epil = fmul contract float %alpha, %18
  %mul18.epil = mul nsw i32 %k.040.epil, %nj
  %add19.epil = add nsw i32 %mul18.epil, %add
  %idxprom20.epil = sext i32 %add19.epil to i64
  %arrayidx21.epil = getelementptr inbounds [4 x i8], ptr %b, i64 %idxprom20.epil
  %19 = load float, ptr %arrayidx21.epil, align 4, !tbaa !7
  %mul22.epil = fmul contract float %mul17.epil, %19
  %add25.epil = fadd contract float %17, %mul22.epil
  store float %add25.epil, ptr %arrayidx, align 4, !tbaa !7
  %inc.epil = add nuw nsw i32 %k.040.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %cleanup, label %for.body.epil, !llvm.loop !11

cleanup:                                          ; preds = %cleanup.loopexit.unr-lcssa, %for.body.epil, %if.end, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}
!llvm.errno.tbaa = !{!3}

!0 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 23.0.0git (git@github.com:llvm/llvm-project.git 4305591c30c8aa15a8adeff77d4cd4abc6f1ef9c)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !5, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
