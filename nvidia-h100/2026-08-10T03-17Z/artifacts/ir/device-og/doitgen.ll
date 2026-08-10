; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/DOITGEN/doitgen.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/DOITGEN/doitgen.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z15doitgen_kernel1PfS_S_i(ptr nofree noundef writeonly captures(none) %sum, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef readonly captures(none) %C4, i32 noundef %r) local_unnamed_addr #0 {
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
  %cmp = icmp slt i32 %add, 128
  %cmp8 = icmp samesign ult i32 %add7, 128
  %or.cond = and i1 %cmp, %cmp8
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul9 = shl nsw i32 %r, 14
  %mul10 = shl nuw nsw i32 %add7, 7
  %add11 = or disjoint i32 %mul9, %mul10
  %add12 = add nsw i32 %add11, %add
  %idxprom = sext i32 %add12 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr %sum, i64 %idxprom
  store float 0.000000e+00, ptr %arrayidx, align 4, !tbaa !11
  br label %for.body

for.body:                                         ; preds = %for.body, %if.then
  %s.056 = phi i32 [ 0, %if.then ], [ %inc.3, %for.body ]
  %add315455 = phi float [ 0.000000e+00, %if.then ], [ %add31.3, %for.body ]
  %add23 = or disjoint i32 %s.056, %add11
  %idxprom24 = sext i32 %add23 to i64
  %arrayidx25 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom24
  %6 = load float, ptr %arrayidx25, align 4, !tbaa !11
  %mul26 = shl nuw nsw i32 %s.056, 7
  %add27 = add nsw i32 %mul26, %add
  %idxprom28 = sext i32 %add27 to i64
  %arrayidx29 = getelementptr inbounds [4 x i8], ptr %C4, i64 %idxprom28
  %7 = load float, ptr %arrayidx29, align 4, !tbaa !11
  %mul30 = fmul contract float %6, %7
  %add31 = fadd contract float %add315455, %mul30
  store float %add31, ptr %arrayidx, align 4, !tbaa !11
  %inc = or disjoint i32 %s.056, 1
  %add23.1 = or disjoint i32 %inc, %add11
  %idxprom24.1 = sext i32 %add23.1 to i64
  %arrayidx25.1 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom24.1
  %8 = load float, ptr %arrayidx25.1, align 4, !tbaa !11
  %mul26.1 = shl nuw nsw i32 %inc, 7
  %add27.1 = add nsw i32 %mul26.1, %add
  %idxprom28.1 = sext i32 %add27.1 to i64
  %arrayidx29.1 = getelementptr inbounds [4 x i8], ptr %C4, i64 %idxprom28.1
  %9 = load float, ptr %arrayidx29.1, align 4, !tbaa !11
  %mul30.1 = fmul contract float %8, %9
  %add31.1 = fadd contract float %add31, %mul30.1
  store float %add31.1, ptr %arrayidx, align 4, !tbaa !11
  %inc.1 = or disjoint i32 %s.056, 2
  %add23.2 = or disjoint i32 %inc.1, %add11
  %idxprom24.2 = sext i32 %add23.2 to i64
  %arrayidx25.2 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom24.2
  %10 = load float, ptr %arrayidx25.2, align 4, !tbaa !11
  %mul26.2 = shl nuw nsw i32 %inc.1, 7
  %add27.2 = add nsw i32 %mul26.2, %add
  %idxprom28.2 = sext i32 %add27.2 to i64
  %arrayidx29.2 = getelementptr inbounds [4 x i8], ptr %C4, i64 %idxprom28.2
  %11 = load float, ptr %arrayidx29.2, align 4, !tbaa !11
  %mul30.2 = fmul contract float %10, %11
  %add31.2 = fadd contract float %add31.1, %mul30.2
  store float %add31.2, ptr %arrayidx, align 4, !tbaa !11
  %inc.2 = or disjoint i32 %s.056, 3
  %add23.3 = or disjoint i32 %inc.2, %add11
  %idxprom24.3 = sext i32 %add23.3 to i64
  %arrayidx25.3 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom24.3
  %12 = load float, ptr %arrayidx25.3, align 4, !tbaa !11
  %mul26.3 = shl nuw nsw i32 %inc.2, 7
  %add27.3 = add nsw i32 %mul26.3, %add
  %idxprom28.3 = sext i32 %add27.3 to i64
  %arrayidx29.3 = getelementptr inbounds [4 x i8], ptr %C4, i64 %idxprom28.3
  %13 = load float, ptr %arrayidx29.3, align 4, !tbaa !11
  %mul30.3 = fmul contract float %12, %13
  %add31.3 = fadd contract float %add31.2, %mul30.3
  store float %add31.3, ptr %arrayidx, align 4, !tbaa !11
  %inc.3 = add nuw nsw i32 %s.056, 4
  %exitcond.not.3 = icmp eq i32 %inc.3, 128
  br i1 %exitcond.not.3, label %if.end, label %for.body, !llvm.loop !13

if.end:                                           ; preds = %for.body, %entry
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z15doitgen_kernel2PfS_S_i(ptr nofree noundef readonly captures(none) %sum, ptr nofree noundef writeonly captures(none) %A, ptr nofree noundef readnone captures(none) %C4, i32 noundef %r) local_unnamed_addr #1 {
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
  %cmp = icmp slt i32 %add, 128
  %cmp8 = icmp samesign ult i32 %add7, 128
  %or.cond = and i1 %cmp, %cmp8
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul9 = shl nsw i32 %r, 14
  %mul10 = shl nuw nsw i32 %add7, 7
  %add11 = add nsw i32 %mul10, %add
  %add12 = add i32 %add11, %mul9
  %idxprom = sext i32 %add12 to i64
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr %A, i64 %idxprom
  %arrayidx = getelementptr inbounds [4 x i8], ptr %sum, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  store float %6, ptr %arrayidx18, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #2

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
