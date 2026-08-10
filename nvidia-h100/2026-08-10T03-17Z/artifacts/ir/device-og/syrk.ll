; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/SYRK/syrk.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/SYRK/syrk.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11syrk_kerneliiffPfS_(i32 noundef %ni, i32 noundef %nj, float noundef %alpha, float noundef %beta, ptr nofree noundef readonly captures(none) %a, ptr nofree noundef captures(none) %c) local_unnamed_addr #0 {
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
  %cmp8 = icmp slt i32 %add, %ni
  %or.cond = and i1 %cmp, %cmp8
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul9 = shl nsw i32 %add7, 10
  %add10 = add nsw i32 %mul9, %add
  %idxprom = sext i32 %add10 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %c, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul11 = fmul contract float %beta, %6
  store float %mul11, ptr %arrayidx, align 4, !tbaa !11
  %cmp1240 = icmp sgt i32 %nj, 0
  br i1 %cmp1240, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %if.then
  %mul18 = shl nsw i32 %add, 10
  %xtraiter = and i32 %nj, 3
  %7 = icmp ult i32 %nj, 4
  br i1 %7, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %nj, 2147483644
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %8 = phi float [ %mul11, %for.body.lr.ph.new ], [ %add27.3, %for.body ]
  %k.041 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.3, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.3, %for.body ]
  %add14 = add nuw nsw i32 %k.041, %mul9
  %idxprom15 = zext nneg i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom15
  %9 = load float, ptr %arrayidx16, align 4, !tbaa !11
  %mul17 = fmul contract float %alpha, %9
  %add19 = add nsw i32 %k.041, %mul18
  %idxprom20 = sext i32 %add19 to i64
  %arrayidx21 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom20
  %10 = load float, ptr %arrayidx21, align 4, !tbaa !11
  %mul22 = fmul contract float %mul17, %10
  %add27 = fadd contract float %8, %mul22
  store float %add27, ptr %arrayidx, align 4, !tbaa !11
  %inc = or disjoint i32 %k.041, 1
  %add14.1 = add nuw nsw i32 %inc, %mul9
  %idxprom15.1 = zext nneg i32 %add14.1 to i64
  %arrayidx16.1 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom15.1
  %11 = load float, ptr %arrayidx16.1, align 4, !tbaa !11
  %mul17.1 = fmul contract float %alpha, %11
  %add19.1 = add nsw i32 %inc, %mul18
  %idxprom20.1 = sext i32 %add19.1 to i64
  %arrayidx21.1 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom20.1
  %12 = load float, ptr %arrayidx21.1, align 4, !tbaa !11
  %mul22.1 = fmul contract float %mul17.1, %12
  %add27.1 = fadd contract float %add27, %mul22.1
  store float %add27.1, ptr %arrayidx, align 4, !tbaa !11
  %inc.1 = or disjoint i32 %k.041, 2
  %add14.2 = add nuw nsw i32 %inc.1, %mul9
  %idxprom15.2 = zext nneg i32 %add14.2 to i64
  %arrayidx16.2 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom15.2
  %13 = load float, ptr %arrayidx16.2, align 4, !tbaa !11
  %mul17.2 = fmul contract float %alpha, %13
  %add19.2 = add nsw i32 %inc.1, %mul18
  %idxprom20.2 = sext i32 %add19.2 to i64
  %arrayidx21.2 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom20.2
  %14 = load float, ptr %arrayidx21.2, align 4, !tbaa !11
  %mul22.2 = fmul contract float %mul17.2, %14
  %add27.2 = fadd contract float %add27.1, %mul22.2
  store float %add27.2, ptr %arrayidx, align 4, !tbaa !11
  %inc.2 = or disjoint i32 %k.041, 3
  %add14.3 = add nuw nsw i32 %inc.2, %mul9
  %idxprom15.3 = zext nneg i32 %add14.3 to i64
  %arrayidx16.3 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom15.3
  %15 = load float, ptr %arrayidx16.3, align 4, !tbaa !11
  %mul17.3 = fmul contract float %alpha, %15
  %add19.3 = add nsw i32 %inc.2, %mul18
  %idxprom20.3 = sext i32 %add19.3 to i64
  %arrayidx21.3 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom20.3
  %16 = load float, ptr %arrayidx21.3, align 4, !tbaa !11
  %mul22.3 = fmul contract float %mul17.3, %16
  %add27.3 = fadd contract float %add27.2, %mul22.3
  store float %add27.3, ptr %arrayidx, align 4, !tbaa !11
  %inc.3 = add nuw nsw i32 %k.041, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !13

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.lr.ph
  %.epil.init = phi float [ %mul11, %for.body.lr.ph ], [ %add27.3, %if.end.loopexit.unr-lcssa ]
  %k.041.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.3, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod42 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod42)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %17 = phi float [ %.epil.init, %for.body.epil.preheader ], [ %add27.epil, %for.body.epil ]
  %k.041.epil = phi i32 [ %k.041.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %add14.epil = add nuw nsw i32 %k.041.epil, %mul9
  %idxprom15.epil = zext nneg i32 %add14.epil to i64
  %arrayidx16.epil = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom15.epil
  %18 = load float, ptr %arrayidx16.epil, align 4, !tbaa !11
  %mul17.epil = fmul contract float %alpha, %18
  %add19.epil = add nsw i32 %k.041.epil, %mul18
  %idxprom20.epil = sext i32 %add19.epil to i64
  %arrayidx21.epil = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom20.epil
  %19 = load float, ptr %arrayidx21.epil, align 4, !tbaa !11
  %mul22.epil = fmul contract float %mul17.epil, %19
  %add27.epil = fadd contract float %17, %mul22.epil
  store float %add27.epil, ptr %arrayidx, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %k.041.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !15

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
