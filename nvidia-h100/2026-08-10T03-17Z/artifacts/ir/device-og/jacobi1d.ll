; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/JACOBI1D/jacobi1D.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/JACOBI1D/jacobi1D.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel1iPfS_(i32 noundef %n, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp sgt i32 %add, 0
  %sub = add nsw i32 %n, -1
  %cmp3 = icmp slt i32 %add, %sub
  %or.cond = select i1 %cmp, i1 %cmp3, i1 false
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = zext nneg i32 %add to i64
  %4 = getelementptr [4 x i8], ptr %A, i64 %3
  %arrayidx = getelementptr i8, ptr %4, i64 -4
  %5 = load float, ptr %arrayidx, align 4, !tbaa !11
  %6 = load float, ptr %4, align 4, !tbaa !11
  %add7 = fadd contract float %5, %6
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %7 = load float, ptr %arrayidx10, align 4, !tbaa !11
  %add11 = fadd contract float %add7, %7
  %conv = fpext contract float %add11 to double
  %mul12 = fmul contract double %conv, 3.333300e-01
  %conv13 = fptrunc contract double %mul12 to float
  %arrayidx15 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %3
  store float %conv13, ptr %arrayidx15, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel2iPfS_(i32 noundef %n, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef readonly captures(none) %B) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp sgt i32 %add, 0
  %sub = add nsw i32 %n, -1
  %cmp3 = icmp slt i32 %add, %sub
  %or.cond = select i1 %cmp, i1 %cmp3, i1 false
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %idxprom = zext nneg i32 %add to i64
  %arrayidx5 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %idxprom
  %3 = load float, ptr %arrayidx, align 4, !tbaa !11
  store float %3, ptr %arrayidx5, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

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
