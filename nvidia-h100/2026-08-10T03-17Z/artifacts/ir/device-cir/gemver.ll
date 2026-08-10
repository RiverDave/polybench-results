; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GEMVER/gemver.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GEMVER/gemver.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z14gemver_kernel1iffPfS_S_S_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr nofree noundef captures(none) %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef readonly captures(none) %7) local_unnamed_addr #0 {
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %11 = mul i32 %9, %10
  %12 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %13 = add i32 %11, %12
  %14 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %15 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %16 = mul nuw nsw i32 %14, %15
  %17 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %18 = add nuw nsw i32 %16, %17
  %19 = icmp slt i32 %18, %0
  %20 = icmp slt i32 %13, %0
  %21 = and i1 %19, %20
  br i1 %21, label %22, label %42

22:                                               ; preds = %8
  %23 = zext nneg i32 %18 to i64
  %24 = getelementptr [4 x i8], ptr %6, i64 %23
  %25 = load float, ptr %24, align 4
  %26 = sext i32 %13 to i64
  %27 = getelementptr [4 x i8], ptr %4, i64 %26
  %28 = load float, ptr %27, align 4
  %29 = fmul float %25, %28
  %30 = getelementptr [4 x i8], ptr %7, i64 %23
  %31 = load float, ptr %30, align 4
  %32 = getelementptr [4 x i8], ptr %5, i64 %26
  %33 = load float, ptr %32, align 4
  %34 = fmul float %31, %33
  %35 = fadd float %29, %34
  %36 = shl nsw i32 %18, 12
  %37 = add nsw i32 %36, %13
  %38 = sext i32 %37 to i64
  %39 = getelementptr [4 x i8], ptr %3, i64 %38
  %40 = load float, ptr %39, align 4
  %41 = fadd float %40, %35
  store float %41, ptr %39, align 4
  br label %42

42:                                               ; preds = %8, %22
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z14gemver_kernel2iffPfS_S_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef captures(none) %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6) local_unnamed_addr #1 {
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %10 = mul i32 %8, %9
  %11 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %0
  br i1 %13, label %.preheader, label %85

.preheader:                                       ; preds = %7
  %14 = icmp sgt i32 %0, 0
  %15 = sext i32 %12 to i64
  %16 = getelementptr [4 x i8], ptr %4, i64 %15
  %.promoted = load float, ptr %16, align 4
  br i1 %14, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i32 %0, 3
  %17 = icmp ult i32 %0, 4
  br i1 %17, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %0, 2147483644
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %18 = phi float [ %.promoted, %.lr.ph.preheader.new ], [ %65, %.lr.ph ]
  %.018 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %66, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.3, %.lr.ph ]
  %19 = shl nuw nsw i32 %.018, 12
  %20 = add nsw i32 %19, %12
  %21 = sext i32 %20 to i64
  %22 = getelementptr [4 x i8], ptr %3, i64 %21
  %23 = load float, ptr %22, align 4
  %24 = fmul float %2, %23
  %25 = zext nneg i32 %.018 to i64
  %26 = getelementptr [4 x i8], ptr %5, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = fmul float %24, %27
  %29 = fadd float %18, %28
  store float %29, ptr %16, align 4
  %30 = or disjoint i32 %.018, 1
  %31 = shl nuw nsw i32 %30, 12
  %32 = add nsw i32 %31, %12
  %33 = sext i32 %32 to i64
  %34 = getelementptr [4 x i8], ptr %3, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fmul float %2, %35
  %37 = zext nneg i32 %30 to i64
  %38 = getelementptr [4 x i8], ptr %5, i64 %37
  %39 = load float, ptr %38, align 4
  %40 = fmul float %36, %39
  %41 = fadd float %29, %40
  store float %41, ptr %16, align 4
  %42 = or disjoint i32 %.018, 2
  %43 = shl nuw nsw i32 %42, 12
  %44 = add nsw i32 %43, %12
  %45 = sext i32 %44 to i64
  %46 = getelementptr [4 x i8], ptr %3, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = fmul float %2, %47
  %49 = zext nneg i32 %42 to i64
  %50 = getelementptr [4 x i8], ptr %5, i64 %49
  %51 = load float, ptr %50, align 4
  %52 = fmul float %48, %51
  %53 = fadd float %41, %52
  store float %53, ptr %16, align 4
  %54 = or disjoint i32 %.018, 3
  %55 = shl nuw nsw i32 %54, 12
  %56 = add nsw i32 %55, %12
  %57 = sext i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr %3, i64 %57
  %59 = load float, ptr %58, align 4
  %60 = fmul float %2, %59
  %61 = zext nneg i32 %54 to i64
  %62 = getelementptr [4 x i8], ptr %5, i64 %61
  %63 = load float, ptr %62, align 4
  %64 = fmul float %60, %63
  %65 = fadd float %53, %64
  store float %65, ptr %16, align 4
  %66 = add nuw nsw i32 %.018, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ %.promoted, %.lr.ph.preheader ], [ %65, %._crit_edge.loopexit.unr-lcssa ]
  %.018.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %66, %._crit_edge.loopexit.unr-lcssa ]
  %lcmp.mod22 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod22)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %67 = phi float [ %78, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.018.epil = phi i32 [ %79, %.lr.ph.epil ], [ %.018.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %68 = shl nuw nsw i32 %.018.epil, 12
  %69 = add nsw i32 %68, %12
  %70 = sext i32 %69 to i64
  %71 = getelementptr [4 x i8], ptr %3, i64 %70
  %72 = load float, ptr %71, align 4
  %73 = fmul float %2, %72
  %74 = zext nneg i32 %.018.epil to i64
  %75 = getelementptr [4 x i8], ptr %5, i64 %74
  %76 = load float, ptr %75, align 4
  %77 = fmul float %73, %76
  %78 = fadd float %67, %77
  store float %78, ptr %16, align 4
  %79 = add nuw nsw i32 %.018.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %.lr.ph.epil, !llvm.loop !3

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.epil, %.preheader
  %80 = phi float [ %.promoted, %.preheader ], [ %65, %._crit_edge.loopexit.unr-lcssa ], [ %78, %.lr.ph.epil ]
  %81 = getelementptr [4 x i8], ptr %6, i64 %15
  %82 = load float, ptr %81, align 4
  %83 = getelementptr [4 x i8], ptr %4, i64 %15
  %84 = fadd float %82, %80
  store float %84, ptr %83, align 4
  br label %85

85:                                               ; preds = %7, %._crit_edge
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z14gemver_kernel3iffPfS_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef captures(none) %5) local_unnamed_addr #1 {
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %9 = mul i32 %7, %8
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = add i32 %9, %10
  %12 = icmp sgt i32 %11, -1
  %13 = icmp slt i32 %11, %0
  %14 = and i1 %12, %13
  %15 = icmp sgt i32 %0, 0
  %or.cond = and i1 %14, %15
  br i1 %or.cond, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %6
  %16 = shl nsw i32 %11, 12
  %17 = zext nneg i32 %11 to i64
  %18 = getelementptr [4 x i8], ptr %5, i64 %17
  %.promoted = load float, ptr %18, align 4
  %xtraiter = and i32 %0, 3
  %19 = icmp ult i32 %0, 4
  br i1 %19, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %0, 2147483644
  br label %20

20:                                               ; preds = %20, %.lr.ph.new
  %21 = phi float [ %.promoted, %.lr.ph.new ], [ %64, %20 ]
  %.015 = phi i32 [ 0, %.lr.ph.new ], [ %65, %20 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.3, %20 ]
  %22 = add nuw nsw i32 %.015, %16
  %23 = zext nneg i32 %22 to i64
  %24 = getelementptr [4 x i8], ptr %3, i64 %23
  %25 = load float, ptr %24, align 4
  %26 = fmul float %1, %25
  %27 = zext nneg i32 %.015 to i64
  %28 = getelementptr [4 x i8], ptr %4, i64 %27
  %29 = load float, ptr %28, align 4
  %30 = fmul float %26, %29
  %31 = fadd float %21, %30
  store float %31, ptr %18, align 4
  %32 = or disjoint i32 %.015, 1
  %33 = add nuw nsw i32 %32, %16
  %34 = zext nneg i32 %33 to i64
  %35 = getelementptr [4 x i8], ptr %3, i64 %34
  %36 = load float, ptr %35, align 4
  %37 = fmul float %1, %36
  %38 = zext nneg i32 %32 to i64
  %39 = getelementptr [4 x i8], ptr %4, i64 %38
  %40 = load float, ptr %39, align 4
  %41 = fmul float %37, %40
  %42 = fadd float %31, %41
  store float %42, ptr %18, align 4
  %43 = or disjoint i32 %.015, 2
  %44 = add nuw nsw i32 %43, %16
  %45 = zext nneg i32 %44 to i64
  %46 = getelementptr [4 x i8], ptr %3, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = fmul float %1, %47
  %49 = zext nneg i32 %43 to i64
  %50 = getelementptr [4 x i8], ptr %4, i64 %49
  %51 = load float, ptr %50, align 4
  %52 = fmul float %48, %51
  %53 = fadd float %42, %52
  store float %53, ptr %18, align 4
  %54 = or disjoint i32 %.015, 3
  %55 = add nuw nsw i32 %54, %16
  %56 = zext nneg i32 %55 to i64
  %57 = getelementptr [4 x i8], ptr %3, i64 %56
  %58 = load float, ptr %57, align 4
  %59 = fmul float %1, %58
  %60 = zext nneg i32 %54 to i64
  %61 = getelementptr [4 x i8], ptr %4, i64 %60
  %62 = load float, ptr %61, align 4
  %63 = fmul float %59, %62
  %64 = fadd float %53, %63
  store float %64, ptr %18, align 4
  %65 = add nuw nsw i32 %.015, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %20

.loopexit.loopexit.unr-lcssa:                     ; preds = %20
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ %.promoted, %.lr.ph ], [ %64, %.loopexit.loopexit.unr-lcssa ]
  %.015.epil.init = phi i32 [ 0, %.lr.ph ], [ %65, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod17 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod17)
  br label %66

66:                                               ; preds = %66, %.epil.preheader
  %67 = phi float [ %.epil.init, %.epil.preheader ], [ %77, %66 ]
  %.015.epil = phi i32 [ %.015.epil.init, %.epil.preheader ], [ %78, %66 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %66 ]
  %68 = add nuw nsw i32 %.015.epil, %16
  %69 = zext nneg i32 %68 to i64
  %70 = getelementptr [4 x i8], ptr %3, i64 %69
  %71 = load float, ptr %70, align 4
  %72 = fmul float %1, %71
  %73 = zext nneg i32 %.015.epil to i64
  %74 = getelementptr [4 x i8], ptr %4, i64 %73
  %75 = load float, ptr %74, align 4
  %76 = fmul float %72, %75
  %77 = fadd float %67, %76
  store float %77, ptr %18, align 4
  %78 = add nuw nsw i32 %.015.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %66, !llvm.loop !5

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %66, %6
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

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}
!nvvmir.version = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!2 = !{i32 2, i32 0}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.unroll.disable"}
!5 = distinct !{!5, !4}
