; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/ATAX/atax.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/ATAX/atax.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z12atax_kernel1iiPfS_S_(i32 noundef %nx, i32 noundef %ny, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %x, ptr nofree noundef writeonly captures(none) %tmp) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %nx
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %tmp, i64 %idxprom
  store float 0.000000e+00, ptr %arrayidx, align 4, !tbaa !11
  %cmp321 = icmp sgt i32 %ny, 0
  br i1 %cmp321, label %for.body.lr.ph, label %if.end

for.body.lr.ph:                                   ; preds = %if.then
  %mul4 = shl nsw i32 %add, 12
  %xtraiter = and i32 %ny, 3
  %3 = icmp ult i32 %ny, 4
  br i1 %3, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %ny, 2147483644
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %4 = phi float [ 0.000000e+00, %for.body.lr.ph.new ], [ %add13.3, %for.body ]
  %j.022 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.3, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.3, %for.body ]
  %add5 = add nsw i32 %j.022, %mul4
  %idxprom6 = sext i32 %add5 to i64
  %arrayidx7 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom6
  %5 = load float, ptr %arrayidx7, align 4, !tbaa !11
  %idxprom8 = zext nneg i32 %j.022 to i64
  %arrayidx9 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom8
  %6 = load float, ptr %arrayidx9, align 4, !tbaa !11
  %mul10 = fmul contract float %5, %6
  %add13 = fadd contract float %4, %mul10
  store float %add13, ptr %arrayidx, align 4, !tbaa !11
  %inc = or disjoint i32 %j.022, 1
  %add5.1 = add nsw i32 %inc, %mul4
  %idxprom6.1 = sext i32 %add5.1 to i64
  %arrayidx7.1 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom6.1
  %7 = load float, ptr %arrayidx7.1, align 4, !tbaa !11
  %idxprom8.1 = zext nneg i32 %inc to i64
  %arrayidx9.1 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom8.1
  %8 = load float, ptr %arrayidx9.1, align 4, !tbaa !11
  %mul10.1 = fmul contract float %7, %8
  %add13.1 = fadd contract float %add13, %mul10.1
  store float %add13.1, ptr %arrayidx, align 4, !tbaa !11
  %inc.1 = or disjoint i32 %j.022, 2
  %add5.2 = add nsw i32 %inc.1, %mul4
  %idxprom6.2 = sext i32 %add5.2 to i64
  %arrayidx7.2 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom6.2
  %9 = load float, ptr %arrayidx7.2, align 4, !tbaa !11
  %idxprom8.2 = zext nneg i32 %inc.1 to i64
  %arrayidx9.2 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom8.2
  %10 = load float, ptr %arrayidx9.2, align 4, !tbaa !11
  %mul10.2 = fmul contract float %9, %10
  %add13.2 = fadd contract float %add13.1, %mul10.2
  store float %add13.2, ptr %arrayidx, align 4, !tbaa !11
  %inc.2 = or disjoint i32 %j.022, 3
  %add5.3 = add nsw i32 %inc.2, %mul4
  %idxprom6.3 = sext i32 %add5.3 to i64
  %arrayidx7.3 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom6.3
  %11 = load float, ptr %arrayidx7.3, align 4, !tbaa !11
  %idxprom8.3 = zext nneg i32 %inc.2 to i64
  %arrayidx9.3 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom8.3
  %12 = load float, ptr %arrayidx9.3, align 4, !tbaa !11
  %mul10.3 = fmul contract float %11, %12
  %add13.3 = fadd contract float %add13.2, %mul10.3
  store float %add13.3, ptr %arrayidx, align 4, !tbaa !11
  %inc.3 = add nuw nsw i32 %j.022, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !13

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.lr.ph
  %.epil.init = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %add13.3, %if.end.loopexit.unr-lcssa ]
  %j.022.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.3, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod23 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod23)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %13 = phi float [ %.epil.init, %for.body.epil.preheader ], [ %add13.epil, %for.body.epil ]
  %j.022.epil = phi i32 [ %j.022.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %add5.epil = add nsw i32 %j.022.epil, %mul4
  %idxprom6.epil = sext i32 %add5.epil to i64
  %arrayidx7.epil = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom6.epil
  %14 = load float, ptr %arrayidx7.epil, align 4, !tbaa !11
  %idxprom8.epil = zext nneg i32 %j.022.epil to i64
  %arrayidx9.epil = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %idxprom8.epil
  %15 = load float, ptr %arrayidx9.epil, align 4, !tbaa !11
  %mul10.epil = fmul contract float %14, %15
  %add13.epil = fadd contract float %13, %mul10.epil
  store float %add13.epil, ptr %arrayidx, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %j.022.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !15

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z12atax_kernel2iiPfS_S_(i32 noundef %nx, i32 noundef %ny, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef writeonly captures(none) %y, ptr nofree noundef readonly captures(none) %tmp) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp slt i32 %add, %ny
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %y, i64 %idxprom
  store float 0.000000e+00, ptr %arrayidx, align 4, !tbaa !11
  %cmp321 = icmp sgt i32 %nx, 0
  br i1 %cmp321, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %nx, 3
  %3 = icmp ult i32 %nx, 4
  br i1 %3, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %nx, 2147483644
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %4 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %add13.3, %for.body ]
  %i.022 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.3, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.3, %for.body ]
  %mul4 = shl nuw nsw i32 %i.022, 12
  %add5 = add nsw i32 %mul4, %add
  %idxprom6 = sext i32 %add5 to i64
  %arrayidx7 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom6
  %5 = load float, ptr %arrayidx7, align 4, !tbaa !11
  %idxprom8 = zext nneg i32 %i.022 to i64
  %arrayidx9 = getelementptr inbounds nuw [4 x i8], ptr %tmp, i64 %idxprom8
  %6 = load float, ptr %arrayidx9, align 4, !tbaa !11
  %mul10 = fmul contract float %5, %6
  %add13 = fadd contract float %4, %mul10
  store float %add13, ptr %arrayidx, align 4, !tbaa !11
  %inc = or disjoint i32 %i.022, 1
  %mul4.1 = shl nuw nsw i32 %inc, 12
  %add5.1 = add nsw i32 %mul4.1, %add
  %idxprom6.1 = sext i32 %add5.1 to i64
  %arrayidx7.1 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom6.1
  %7 = load float, ptr %arrayidx7.1, align 4, !tbaa !11
  %idxprom8.1 = zext nneg i32 %inc to i64
  %arrayidx9.1 = getelementptr inbounds nuw [4 x i8], ptr %tmp, i64 %idxprom8.1
  %8 = load float, ptr %arrayidx9.1, align 4, !tbaa !11
  %mul10.1 = fmul contract float %7, %8
  %add13.1 = fadd contract float %add13, %mul10.1
  store float %add13.1, ptr %arrayidx, align 4, !tbaa !11
  %inc.1 = or disjoint i32 %i.022, 2
  %mul4.2 = shl nuw nsw i32 %inc.1, 12
  %add5.2 = add nsw i32 %mul4.2, %add
  %idxprom6.2 = sext i32 %add5.2 to i64
  %arrayidx7.2 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom6.2
  %9 = load float, ptr %arrayidx7.2, align 4, !tbaa !11
  %idxprom8.2 = zext nneg i32 %inc.1 to i64
  %arrayidx9.2 = getelementptr inbounds nuw [4 x i8], ptr %tmp, i64 %idxprom8.2
  %10 = load float, ptr %arrayidx9.2, align 4, !tbaa !11
  %mul10.2 = fmul contract float %9, %10
  %add13.2 = fadd contract float %add13.1, %mul10.2
  store float %add13.2, ptr %arrayidx, align 4, !tbaa !11
  %inc.2 = or disjoint i32 %i.022, 3
  %mul4.3 = shl nuw nsw i32 %inc.2, 12
  %add5.3 = add nsw i32 %mul4.3, %add
  %idxprom6.3 = sext i32 %add5.3 to i64
  %arrayidx7.3 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom6.3
  %11 = load float, ptr %arrayidx7.3, align 4, !tbaa !11
  %idxprom8.3 = zext nneg i32 %inc.2 to i64
  %arrayidx9.3 = getelementptr inbounds nuw [4 x i8], ptr %tmp, i64 %idxprom8.3
  %12 = load float, ptr %arrayidx9.3, align 4, !tbaa !11
  %mul10.3 = fmul contract float %11, %12
  %add13.3 = fadd contract float %add13.2, %mul10.3
  store float %add13.3, ptr %arrayidx, align 4, !tbaa !11
  %inc.3 = add nuw nsw i32 %i.022, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !17

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.preheader
  %.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %add13.3, %if.end.loopexit.unr-lcssa ]
  %i.022.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.3, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod23 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod23)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %13 = phi float [ %add13.epil, %for.body.epil ], [ %.epil.init, %for.body.epil.preheader ]
  %i.022.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %i.022.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %mul4.epil = shl nuw nsw i32 %i.022.epil, 12
  %add5.epil = add nsw i32 %mul4.epil, %add
  %idxprom6.epil = sext i32 %add5.epil to i64
  %arrayidx7.epil = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom6.epil
  %14 = load float, ptr %arrayidx7.epil, align 4, !tbaa !11
  %idxprom8.epil = zext nneg i32 %i.022.epil to i64
  %arrayidx9.epil = getelementptr inbounds nuw [4 x i8], ptr %tmp, i64 %idxprom8.epil
  %15 = load float, ptr %arrayidx9.epil, align 4, !tbaa !11
  %mul10.epil = fmul contract float %14, %15
  %add13.epil = fadd contract float %13, %mul10.epil
  store float %add13.epil, ptr %arrayidx, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %i.022.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !18

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %if.then, %entry
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
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !16}
