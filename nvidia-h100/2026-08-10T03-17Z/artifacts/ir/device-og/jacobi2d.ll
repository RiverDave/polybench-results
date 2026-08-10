; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/JACOBI2D/jacobi2D.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/JACOBI2D/jacobi2D.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel1iPfS_(i32 noundef %n, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %mul = mul nuw nsw i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %add = add nuw nsw i32 %mul, %2
  %3 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %4 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul5 = mul i32 %3, %4
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add7 = add i32 %mul5, %5
  %cmp.not = icmp eq i32 %add, 0
  br i1 %cmp.not, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp8 = icmp slt i32 %add, %sub
  %cmp10 = icmp sgt i32 %add7, 0
  %or.cond = and i1 %cmp10, %cmp8
  %cmp13 = icmp slt i32 %add7, %sub
  %or.cond64 = and i1 %cmp13, %or.cond
  br i1 %or.cond64, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %mul14 = mul nuw nsw i32 %add, 1000
  %add15 = add nuw nsw i32 %mul14, %add7
  %idxprom = zext nneg i32 %add15 to i64
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  %sub17 = add nsw i32 %add7, -1
  %add18 = add nuw nsw i32 %sub17, %mul14
  %idxprom19 = zext nneg i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom19
  %7 = load float, ptr %arrayidx20, align 4, !tbaa !11
  %add21 = fadd contract float %6, %7
  %add23 = add nuw nsw i32 %add7, 1
  %add24 = add nuw nsw i32 %add23, %mul14
  %idxprom25 = zext nneg i32 %add24 to i64
  %arrayidx26 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom25
  %8 = load float, ptr %arrayidx26, align 4, !tbaa !11
  %add27 = fadd contract float %add21, %8
  %mul29 = add nuw i32 %add7, 1000
  %add30 = add nuw i32 %mul29, %mul14
  %idxprom31 = zext nneg i32 %add30 to i64
  %arrayidx32 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom31
  %9 = load float, ptr %arrayidx32, align 4, !tbaa !11
  %add33 = fadd contract float %add27, %9
  %mul35 = add nsw i32 %add7, -1000
  %add36 = add i32 %mul35, %mul14
  %idxprom37 = zext nneg i32 %add36 to i64
  %arrayidx38 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom37
  %10 = load float, ptr %arrayidx38, align 4, !tbaa !11
  %add39 = fadd contract float %add33, %10
  %mul40 = fmul contract float %add39, 2.000000e-01
  %arrayidx44 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %idxprom
  store float %mul40, ptr %arrayidx44, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel2iPfS_(i32 noundef %n, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef readonly captures(none) %B) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %mul = mul nuw nsw i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %add = add nuw nsw i32 %mul, %2
  %cmp.not = icmp eq i32 %add, 0
  br i1 %cmp.not, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %3 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %4 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul5 = mul i32 %3, %4
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add7 = add i32 %mul5, %5
  %sub = add nsw i32 %n, -1
  %cmp8 = icmp slt i32 %add, %sub
  %cmp10 = icmp sgt i32 %add7, 0
  %or.cond = and i1 %cmp10, %cmp8
  %cmp13 = icmp slt i32 %add7, %sub
  %or.cond27 = and i1 %cmp13, %or.cond
  br i1 %or.cond27, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %mul14 = mul nuw nsw i32 %add, 1000
  %add15 = add nuw nsw i32 %mul14, %add7
  %idxprom = zext nneg i32 %add15 to i64
  %arrayidx19 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  store float %6, ptr %arrayidx19, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
