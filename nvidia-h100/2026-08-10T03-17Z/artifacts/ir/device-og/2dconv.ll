; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/2DCONV/2DConvolution.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/2DCONV/2DConvolution.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z20convolution2D_kerneliiPfS_(i32 noundef %ni, i32 noundef %nj, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B) local_unnamed_addr #0 {
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
  %sub = add nsw i32 %ni, -1
  %cmp = icmp slt i32 %add7, %sub
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %sub8 = add nsw i32 %nj, -1
  %cmp9 = icmp slt i32 %add, %sub8
  %cmp11 = icmp ne i32 %add7, 0
  %or.cond = and i1 %cmp11, %cmp9
  %cmp13 = icmp sgt i32 %add, 0
  %or.cond87 = and i1 %cmp13, %or.cond
  br i1 %or.cond87, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %sub14 = shl i32 %add7, 12
  %mul15 = add i32 %sub14, -4096
  %sub16 = add nsw i32 %add, -1
  %add17 = add nuw nsw i32 %mul15, %sub16
  %idxprom = zext nneg i32 %add17 to i64
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul18 = fmul contract float %6, 2.000000e-01
  %add22 = add nuw nsw i32 %mul15, %add
  %idxprom23 = zext nneg i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom23
  %7 = load float, ptr %arrayidx24, align 4, !tbaa !11
  %mul25 = fmul contract float %7, 5.000000e-01
  %add26 = fadd contract float %mul18, %mul25
  %add29 = add nuw nsw i32 %add, 1
  %add30 = add nuw nsw i32 %mul15, %add29
  %idxprom31 = zext nneg i32 %add30 to i64
  %arrayidx32 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom31
  %8 = load float, ptr %arrayidx32, align 4, !tbaa !11
  %mul33 = fmul contract float %8, 8.000000e-01
  %9 = fsub contract float %add26, %mul33
  %add38 = add nuw nsw i32 %sub14, %sub16
  %idxprom39 = zext nneg i32 %add38 to i64
  %arrayidx40 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom39
  %10 = load float, ptr %arrayidx40, align 4, !tbaa !11
  %mul41 = fmul contract float %10, 3.000000e-01
  %11 = fsub contract float %9, %mul41
  %add46 = add nuw nsw i32 %sub14, %add
  %idxprom47 = zext nneg i32 %add46 to i64
  %arrayidx48 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom47
  %12 = load float, ptr %arrayidx48, align 4, !tbaa !11
  %mul49 = fmul contract float %12, 6.000000e-01
  %add50 = fadd contract float %11, %mul49
  %add54 = add nuw nsw i32 %sub14, %add29
  %idxprom55 = zext nneg i32 %add54 to i64
  %arrayidx56 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom55
  %13 = load float, ptr %arrayidx56, align 4, !tbaa !11
  %mul57 = fmul contract float %13, f0x3F666666
  %14 = fsub contract float %add50, %mul57
  %mul60 = add i32 %sub14, 4096
  %add62 = add nuw nsw i32 %mul60, %sub16
  %idxprom63 = zext nneg i32 %add62 to i64
  %arrayidx64 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom63
  %15 = load float, ptr %arrayidx64, align 4, !tbaa !11
  %mul65 = fmul contract float %15, 4.000000e-01
  %add66 = fadd contract float %14, %mul65
  %add70 = add nuw nsw i32 %mul60, %add
  %idxprom71 = zext nneg i32 %add70 to i64
  %arrayidx72 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom71
  %16 = load float, ptr %arrayidx72, align 4, !tbaa !11
  %mul73 = fmul contract float %16, f0x3F333333
  %add74 = fadd contract float %add66, %mul73
  %add78 = add nuw nsw i32 %mul60, %add29
  %idxprom79 = zext nneg i32 %add78 to i64
  %arrayidx80 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom79
  %17 = load float, ptr %arrayidx80, align 4, !tbaa !11
  %mul81 = fmul contract float %17, 1.000000e-01
  %add82 = fadd contract float %add74, %mul81
  %arrayidx86 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %idxprom47
  store float %add82, ptr %arrayidx86, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
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
