; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/3DCONV/3DConvolution.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/3DCONV/3DConvolution.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z20convolution3D_kerneliiiPfS_i(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, ptr nofree noundef readonly captures(none) %A, ptr nofree noundef writeonly captures(none) %B, i32 noundef %i) local_unnamed_addr #0 {
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
  %cmp = icmp slt i32 %i, %sub
  %sub8 = add nsw i32 %nj, -1
  %cmp9 = icmp slt i32 %add7, %sub8
  %or.cond260 = select i1 %cmp, i1 %cmp9, i1 false
  br i1 %or.cond260, label %land.lhs.true10, label %if.end

land.lhs.true10:                                  ; preds = %entry
  %sub11 = add nsw i32 %nk, -1
  %cmp12 = icmp slt i32 %add, %sub11
  %cmp14 = icmp sgt i32 %i, 0
  %or.cond = and i1 %cmp12, %cmp14
  %cmp16 = icmp ne i32 %add7, 0
  %or.cond187 = and i1 %cmp16, %or.cond
  %cmp18 = icmp sgt i32 %add, 0
  %or.cond188 = and i1 %cmp18, %or.cond187
  br i1 %or.cond188, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true10
  %sub19 = shl i32 %i, 16
  %mul20 = add i32 %sub19, -65536
  %sub21 = shl i32 %add7, 8
  %mul22 = add i32 %sub21, -256
  %add23 = add nuw nsw i32 %mul20, %mul22
  %sub24 = add nsw i32 %add, -1
  %add25 = add nuw nsw i32 %add23, %sub24
  %idxprom = zext nneg i32 %add25 to i64
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom
  %6 = load float, ptr %arrayidx, align 4, !tbaa !11
  %mul26 = fmul contract float %6, 2.000000e+00
  %mul28 = add i32 %sub19, 65536
  %add31 = add nuw nsw i32 %mul28, %mul22
  %add33 = add nuw nsw i32 %add31, %sub24
  %idxprom34 = zext nneg i32 %add33 to i64
  %arrayidx35 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom34
  %7 = load float, ptr %arrayidx35, align 4, !tbaa !11
  %mul36 = fmul contract float %7, 4.000000e+00
  %add37 = fadd contract float %mul26, %mul36
  %mul47 = fmul contract float %6, 5.000000e+00
  %add48 = fadd contract float %mul47, %add37
  %mul58 = fmul contract float %7, 7.000000e+00
  %add59 = fadd contract float %mul58, %add48
  %mul69 = fmul contract float %6, 8.000000e+00
  %8 = fsub contract float %add59, %mul69
  %mul80 = fmul contract float %7, 1.000000e+01
  %add81 = fadd contract float %mul80, %8
  %add86 = add nuw nsw i32 %add, %sub19
  %add88 = add nuw nsw i32 %add86, %mul22
  %idxprom89 = zext nneg i32 %add88 to i64
  %arrayidx90 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom89
  %9 = load float, ptr %arrayidx90, align 4, !tbaa !11
  %mul91 = fmul contract float %9, 3.000000e+00
  %10 = fsub contract float %add81, %mul91
  %add99 = add nuw nsw i32 %add86, %sub21
  %idxprom100 = zext nneg i32 %add99 to i64
  %arrayidx101 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom100
  %11 = load float, ptr %arrayidx101, align 4, !tbaa !11
  %mul102 = fmul contract float %11, 6.000000e+00
  %add103 = fadd contract float %mul102, %10
  %mul107 = add i32 %sub21, 256
  %add110 = add nuw nsw i32 %add86, %mul107
  %idxprom111 = zext nneg i32 %add110 to i64
  %arrayidx112 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom111
  %12 = load float, ptr %arrayidx112, align 4, !tbaa !11
  %mul113 = fmul contract float %12, 9.000000e+00
  %13 = fsub contract float %add103, %mul113
  %add120 = add nuw nsw i32 %add, 1
  %add121 = add nuw nsw i32 %add23, %add120
  %idxprom122 = zext nneg i32 %add121 to i64
  %arrayidx123 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom122
  %14 = load float, ptr %arrayidx123, align 4, !tbaa !11
  %mul124 = fmul contract float %14, 2.000000e+00
  %add125 = fadd contract float %mul124, %13
  %add132 = add nuw nsw i32 %add31, %add120
  %idxprom133 = zext nneg i32 %add132 to i64
  %arrayidx134 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom133
  %15 = load float, ptr %arrayidx134, align 4, !tbaa !11
  %mul135 = fmul contract float %15, 4.000000e+00
  %add136 = fadd contract float %mul135, %add125
  %add141 = add nuw nsw i32 %add120, %mul20
  %add143 = add nuw nsw i32 %add141, %sub21
  %idxprom144 = zext nneg i32 %add143 to i64
  %arrayidx145 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom144
  %16 = load float, ptr %arrayidx145, align 4, !tbaa !11
  %mul146 = fmul contract float %16, 5.000000e+00
  %add147 = fadd contract float %mul146, %add136
  %add152 = add nuw nsw i32 %add120, %mul28
  %add154 = add nuw nsw i32 %add152, %sub21
  %idxprom155 = zext nneg i32 %add154 to i64
  %arrayidx156 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom155
  %17 = load float, ptr %arrayidx156, align 4, !tbaa !11
  %mul157 = fmul contract float %17, 7.000000e+00
  %add158 = fadd contract float %mul157, %add147
  %add165 = add nuw nsw i32 %add141, %mul107
  %idxprom166 = zext nneg i32 %add165 to i64
  %arrayidx167 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom166
  %18 = load float, ptr %arrayidx167, align 4, !tbaa !11
  %mul168 = fmul contract float %18, 8.000000e+00
  %19 = fsub contract float %add158, %mul168
  %add176 = add nuw nsw i32 %add152, %mul107
  %idxprom177 = zext nneg i32 %add176 to i64
  %arrayidx178 = getelementptr inbounds nuw [4 x i8], ptr %A, i64 %idxprom177
  %20 = load float, ptr %arrayidx178, align 4, !tbaa !11
  %mul179 = fmul contract float %20, 1.000000e+01
  %add180 = fadd contract float %mul179, %19
  %arrayidx186 = getelementptr inbounds nuw [4 x i8], ptr %B, i64 %idxprom100
  store float %add180, ptr %arrayidx186, align 4, !tbaa !11
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true10, %entry
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
