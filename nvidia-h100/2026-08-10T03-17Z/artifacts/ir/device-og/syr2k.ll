; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/SYR2K/syr2k.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/SYR2K/syr2k.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z12syr2k_kerneliiffPfS_S_(i32 noundef %ni, i32 noundef %nj, float noundef %alpha, float noundef %beta, ptr nofree noundef readonly captures(none) %a, ptr nofree noundef readonly captures(none) %b, ptr nofree noundef captures(none) %c) local_unnamed_addr #0 {
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
  %cmp = icmp samesign ult i32 %add7, 1024
  %cmp8 = icmp slt i32 %add, 1024
  %or.cond = and i1 %cmp, %cmp8
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul9 = shl nuw nsw i32 %add7, 10
  %add10 = add nsw i32 %mul9, %add
  %idxprom = sext i32 %add10 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %c, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul11 = fmul contract float %beta, %6
  store float %mul11, ptr %arrayidx, align 4, !tbaa !11
  %mul18 = shl nsw i32 %add, 10
  br label %for.body

for.body:                                         ; preds = %for.body, %if.then
  %k.056 = phi i32 [ 0, %if.then ], [ %inc.1, %for.body ]
  %7 = phi float [ %mul11, %if.then ], [ %add38.1, %for.body ]
  %add14 = or disjoint i32 %k.056, %mul9
  %idxprom15 = zext nneg i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom15
  %8 = load float, ptr %arrayidx16, align 4, !tbaa !11
  %mul17 = fmul contract float %alpha, %8
  %add19 = add nuw nsw i32 %k.056, %mul18
  %idxprom20 = sext i32 %add19 to i64
  %arrayidx21 = getelementptr inbounds [4 x i8], ptr %b, i64 %idxprom20
  %9 = load float, ptr %arrayidx21, align 4, !tbaa !11
  %mul22 = fmul contract float %mul17, %9
  %arrayidx26 = getelementptr inbounds nuw [4 x i8], ptr %b, i64 %idxprom15
  %10 = load float, ptr %arrayidx26, align 4, !tbaa !11
  %mul27 = fmul contract float %alpha, %10
  %arrayidx31 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom20
  %11 = load float, ptr %arrayidx31, align 4, !tbaa !11
  %mul32 = fmul contract float %mul27, %11
  %add33 = fadd contract float %mul22, %mul32
  %add38 = fadd contract float %7, %add33
  store float %add38, ptr %arrayidx, align 4, !tbaa !11
  %inc = or disjoint i32 %k.056, 1
  %add14.1 = or disjoint i32 %inc, %mul9
  %idxprom15.1 = zext nneg i32 %add14.1 to i64
  %arrayidx16.1 = getelementptr inbounds nuw [4 x i8], ptr %a, i64 %idxprom15.1
  %12 = load float, ptr %arrayidx16.1, align 4, !tbaa !11
  %mul17.1 = fmul contract float %alpha, %12
  %add19.1 = add nuw nsw i32 %inc, %mul18
  %idxprom20.1 = sext i32 %add19.1 to i64
  %arrayidx21.1 = getelementptr inbounds [4 x i8], ptr %b, i64 %idxprom20.1
  %13 = load float, ptr %arrayidx21.1, align 4, !tbaa !11
  %mul22.1 = fmul contract float %mul17.1, %13
  %arrayidx26.1 = getelementptr inbounds nuw [4 x i8], ptr %b, i64 %idxprom15.1
  %14 = load float, ptr %arrayidx26.1, align 4, !tbaa !11
  %mul27.1 = fmul contract float %alpha, %14
  %arrayidx31.1 = getelementptr inbounds [4 x i8], ptr %a, i64 %idxprom20.1
  %15 = load float, ptr %arrayidx31.1, align 4, !tbaa !11
  %mul32.1 = fmul contract float %mul27.1, %15
  %add33.1 = fadd contract float %mul22.1, %mul32.1
  %add38.1 = fadd contract float %add38, %add33.1
  store float %add38.1, ptr %arrayidx, align 4, !tbaa !11
  %inc.1 = add nuw nsw i32 %k.056, 2
  %exitcond.not.1 = icmp eq i32 %inc.1, 1024
  br i1 %exitcond.not.1, label %if.end, label %for.body, !llvm.loop !13

if.end:                                           ; preds = %for.body, %entry
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

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
