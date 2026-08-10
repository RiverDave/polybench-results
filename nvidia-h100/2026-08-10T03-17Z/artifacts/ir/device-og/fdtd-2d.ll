; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/FDTD-2D/fdtd2d.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/FDTD-2D/fdtd2d.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z17fdtd_step1_kerneliiPfS_S_S_i(i32 noundef %nx, i32 noundef %ny, ptr nofree noundef readonly captures(none) %_fict_, ptr nofree noundef readnone captures(none) %ex, ptr nofree noundef captures(none) %ey, ptr nofree noundef readonly captures(none) %hz, i32 noundef %t) local_unnamed_addr #0 {
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
  %cmp = icmp slt i32 %add7, %nx
  %cmp8 = icmp slt i32 %add, %ny
  %or.cond = and i1 %cmp, %cmp8
  br i1 %or.cond, label %if.then, label %if.end34

if.then:                                          ; preds = %entry
  %cmp9 = icmp eq i32 %add7, 0
  br i1 %cmp9, label %if.then10, label %if.else

if.then10:                                        ; preds = %if.then
  %idxprom = sext i32 %t to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %_fict_, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  %idxprom13 = sext i32 %add to i64
  %arrayidx14 = getelementptr inbounds [4 x i8], ptr %ey, i64 %idxprom13
  store float %6, ptr %arrayidx14, align 4, !tbaa !11
  br label %if.end34

if.else:                                          ; preds = %if.then
  %mul15 = shl nsw i32 %add7, 11
  %add16 = add nsw i32 %mul15, %add
  %idxprom17 = sext i32 %add16 to i64
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr %ey, i64 %idxprom17
  %7 = load float, ptr %arrayidx18, align 4, !tbaa !11
  %arrayidx22 = getelementptr inbounds [4 x i8], ptr %hz, i64 %idxprom17
  %8 = load float, ptr %arrayidx22, align 4, !tbaa !11
  %mul23 = add i32 %add, -2048
  %add24 = add i32 %mul23, %mul15
  %idxprom25 = sext i32 %add24 to i64
  %arrayidx26 = getelementptr inbounds [4 x i8], ptr %hz, i64 %idxprom25
  %9 = load float, ptr %arrayidx26, align 4, !tbaa !11
  %sub27 = fsub contract float %8, %9
  %mul28 = fmul contract float %sub27, 5.000000e-01
  %sub29 = fsub contract float %7, %mul28
  store float %sub29, ptr %arrayidx18, align 4, !tbaa !11
  br label %if.end34

if.end34:                                         ; preds = %if.then10, %if.else, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z17fdtd_step2_kerneliiPfS_S_i(i32 noundef %nx, i32 noundef %ny, ptr nofree noundef captures(none) %ex, ptr nofree noundef readnone captures(none) %ey, ptr nofree noundef readonly captures(none) %hz, i32 noundef %t) local_unnamed_addr #0 {
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
  %cmp = icmp slt i32 %add7, %nx
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %cmp8 = icmp slt i32 %add, %ny
  %cmp10 = icmp sgt i32 %add, 0
  %or.cond = and i1 %cmp10, %cmp8
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %mul11 = shl nsw i32 %add7, 11
  %add12 = add nuw nsw i32 %mul11, %add
  %idxprom = zext nneg i32 %add12 to i64
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %ex, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  %arrayidx16 = getelementptr inbounds nuw [4 x i8], ptr %hz, i64 %idxprom
  %7 = load float, ptr %arrayidx16, align 4, !tbaa !11
  %sub = add nsw i32 %add, -1
  %add18 = add nuw nsw i32 %sub, %mul11
  %idxprom19 = zext nneg i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds nuw [4 x i8], ptr %hz, i64 %idxprom19
  %8 = load float, ptr %arrayidx20, align 4, !tbaa !11
  %sub21 = fsub contract float %7, %8
  %mul22 = fmul contract float %sub21, 5.000000e-01
  %sub23 = fsub contract float %6, %mul22
  store float %sub23, ptr %arrayidx, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z17fdtd_step3_kerneliiPfS_S_i(i32 noundef %nx, i32 noundef %ny, ptr nofree noundef readonly captures(none) %ex, ptr nofree noundef readonly captures(none) %ey, ptr nofree noundef captures(none) %hz, i32 noundef %t) local_unnamed_addr #0 {
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
  %sub = add nsw i32 %nx, -1
  %cmp = icmp slt i32 %add7, %sub
  %sub8 = add nsw i32 %ny, -1
  %cmp9 = icmp slt i32 %add, %sub8
  %or.cond = select i1 %cmp, i1 %cmp9, i1 false
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul10 = shl nsw i32 %add7, 11
  %add11 = add nsw i32 %mul10, %add
  %idxprom = sext i32 %add11 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %hz, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  %add13 = add nsw i32 %add, 1
  %add14 = add nsw i32 %add13, %mul10
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds [4 x i8], ptr %ex, i64 %idxprom15
  %7 = load float, ptr %arrayidx16, align 4, !tbaa !11
  %arrayidx20 = getelementptr inbounds [4 x i8], ptr %ex, i64 %idxprom
  %8 = load float, ptr %arrayidx20, align 4, !tbaa !11
  %sub21 = fsub contract float %7, %8
  %mul23 = add i32 %add, 2048
  %add24 = add i32 %mul23, %mul10
  %idxprom25 = sext i32 %add24 to i64
  %arrayidx26 = getelementptr inbounds [4 x i8], ptr %ey, i64 %idxprom25
  %9 = load float, ptr %arrayidx26, align 4, !tbaa !11
  %add27 = fadd contract float %sub21, %9
  %arrayidx31 = getelementptr inbounds [4 x i8], ptr %ey, i64 %idxprom
  %10 = load float, ptr %arrayidx31, align 4, !tbaa !11
  %sub32 = fsub contract float %add27, %10
  %mul33 = fmul contract float %sub32, f0x3F333333
  %sub34 = fsub contract float %6, %mul33
  store float %sub34, ptr %arrayidx, align 4, !tbaa !11
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
