; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/LU/lu.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/LU/lu.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z10lu_kernel1iPfi(i32 noundef %n, ptr nofree noundef captures(none) %A, i32 noundef %k) local_unnamed_addr #0 {
entry:
  %0 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %1 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %mul = mul i32 %0, %1
  %2 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %add = add i32 %mul, %2
  %cmp = icmp sgt i32 %add, %k
  %cmp3 = icmp slt i32 %add, %n
  %or.cond = and i1 %cmp3, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %add7 = mul nsw i32 %k, 2049
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom8
  %mul4 = shl nsw i32 %k, 11
  %add5 = add nsw i32 %mul4, %add
  %idxprom = sext i32 %add5 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom
  %3 = load float, ptr %arrayidx, align 4, !tbaa !11
  %4 = load float, ptr %arrayidx9, align 4, !tbaa !11
  %div = fdiv contract float %3, %4
  store float %div, ptr %arrayidx, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z10lu_kernel2iPfi(i32 noundef %n, ptr nofree noundef captures(none) %A, i32 noundef %k) local_unnamed_addr #0 {
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
  %cmp = icmp sgt i32 %add7, %k
  %cmp8 = icmp sgt i32 %add, %k
  %or.cond = and i1 %cmp, %cmp8
  %cmp10 = icmp slt i32 %add7, %n
  %or.cond43 = and i1 %cmp10, %or.cond
  %cmp12 = icmp slt i32 %add, %n
  %or.cond44 = and i1 %cmp12, %or.cond43
  br i1 %or.cond44, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul13 = shl nsw i32 %add7, 11
  %add14 = add nsw i32 %mul13, %add
  %idxprom = sext i32 %add14 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  %add16 = add nsw i32 %k, %mul13
  %idxprom17 = sext i32 %add16 to i64
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom17
  %7 = load float, ptr %arrayidx18, align 4, !tbaa !11
  %mul19 = shl nsw i32 %k, 11
  %add20 = add nsw i32 %mul19, %add
  %idxprom21 = sext i32 %add20 to i64
  %arrayidx22 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom21
  %8 = load float, ptr %arrayidx22, align 4, !tbaa !11
  %mul23 = fmul contract float %7, %8
  %sub = fsub contract float %6, %mul23
  store float %sub, ptr %arrayidx, align 4, !tbaa !11
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

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
