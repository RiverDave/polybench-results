; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/COVAR/covariance.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/COVAR/covariance.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11mean_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #0 {
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %7 = mul i32 %5, %6
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = add i32 %7, %8
  %10 = icmp slt i32 %9, %0
  br i1 %10, label %11, label %83

11:                                               ; preds = %4
  %12 = sext i32 %9 to i64
  %13 = getelementptr [4 x i8], ptr %2, i64 %12
  store float 0.000000e+00, ptr %13, align 4
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %11
  %xtraiter = and i32 %1, 7
  %15 = icmp ult i32 %1, 8
  br i1 %15, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %1, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %16 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %71, %.lr.ph ]
  %.014 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %72, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %17 = shl nuw nsw i32 %.014, 11
  %18 = add nsw i32 %17, %9
  %19 = sext i32 %18 to i64
  %20 = getelementptr [4 x i8], ptr %3, i64 %19
  %21 = load float, ptr %20, align 4
  %22 = fadd float %21, %16
  store float %22, ptr %13, align 4
  %23 = shl i32 %.014, 11
  %24 = or disjoint i32 %23, 2048
  %25 = add nsw i32 %24, %9
  %26 = sext i32 %25 to i64
  %27 = getelementptr [4 x i8], ptr %3, i64 %26
  %28 = load float, ptr %27, align 4
  %29 = fadd float %28, %22
  store float %29, ptr %13, align 4
  %30 = shl i32 %.014, 11
  %31 = or disjoint i32 %30, 4096
  %32 = add nsw i32 %31, %9
  %33 = sext i32 %32 to i64
  %34 = getelementptr [4 x i8], ptr %3, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fadd float %35, %29
  store float %36, ptr %13, align 4
  %37 = shl i32 %.014, 11
  %38 = or disjoint i32 %37, 6144
  %39 = add nsw i32 %38, %9
  %40 = sext i32 %39 to i64
  %41 = getelementptr [4 x i8], ptr %3, i64 %40
  %42 = load float, ptr %41, align 4
  %43 = fadd float %42, %36
  store float %43, ptr %13, align 4
  %44 = shl i32 %.014, 11
  %45 = or disjoint i32 %44, 8192
  %46 = add nsw i32 %45, %9
  %47 = sext i32 %46 to i64
  %48 = getelementptr [4 x i8], ptr %3, i64 %47
  %49 = load float, ptr %48, align 4
  %50 = fadd float %49, %43
  store float %50, ptr %13, align 4
  %51 = shl i32 %.014, 11
  %52 = or disjoint i32 %51, 10240
  %53 = add nsw i32 %52, %9
  %54 = sext i32 %53 to i64
  %55 = getelementptr [4 x i8], ptr %3, i64 %54
  %56 = load float, ptr %55, align 4
  %57 = fadd float %56, %50
  store float %57, ptr %13, align 4
  %58 = shl i32 %.014, 11
  %59 = or disjoint i32 %58, 12288
  %60 = add nsw i32 %59, %9
  %61 = sext i32 %60 to i64
  %62 = getelementptr [4 x i8], ptr %3, i64 %61
  %63 = load float, ptr %62, align 4
  %64 = fadd float %63, %57
  store float %64, ptr %13, align 4
  %65 = shl i32 %.014, 11
  %66 = or disjoint i32 %65, 14336
  %67 = add nsw i32 %66, %9
  %68 = sext i32 %67 to i64
  %69 = getelementptr [4 x i8], ptr %3, i64 %68
  %70 = load float, ptr %69, align 4
  %71 = fadd float %70, %64
  store float %71, ptr %13, align 4
  %72 = add nuw nsw i32 %.014, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %71, %._crit_edge.loopexit.unr-lcssa ]
  %.014.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %72, %._crit_edge.loopexit.unr-lcssa ]
  %lcmp.mod17 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod17)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %73 = phi float [ %79, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.014.epil = phi i32 [ %80, %.lr.ph.epil ], [ %.014.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %74 = shl nuw nsw i32 %.014.epil, 11
  %75 = add nsw i32 %74, %9
  %76 = sext i32 %75 to i64
  %77 = getelementptr [4 x i8], ptr %3, i64 %76
  %78 = load float, ptr %77, align 4
  %79 = fadd float %78, %73
  store float %79, ptr %13, align 4
  %80 = add nuw nsw i32 %.014.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %.lr.ph.epil, !llvm.loop !3

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.epil, %11
  %81 = phi float [ 0.000000e+00, %11 ], [ %71, %._crit_edge.loopexit.unr-lcssa ], [ %79, %.lr.ph.epil ]
  %82 = fdiv float %81, f0x4A442E10
  store float %82, ptr %13, align 4
  br label %83

83:                                               ; preds = %4, %._crit_edge
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z13reduce_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef captures(none) %3) local_unnamed_addr #1 {
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %7 = mul i32 %5, %6
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = add i32 %7, %8
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %11 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %12 = mul nuw nsw i32 %10, %11
  %13 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %14 = add nuw nsw i32 %12, %13
  %15 = icmp slt i32 %14, %1
  %16 = icmp slt i32 %9, %0
  %17 = and i1 %16, %15
  br i1 %17, label %18, label %28

18:                                               ; preds = %4
  %19 = shl nsw i32 %14, 11
  %20 = add nsw i32 %19, %9
  %21 = sext i32 %20 to i64
  %22 = getelementptr [4 x i8], ptr %3, i64 %21
  %23 = sext i32 %9 to i64
  %24 = getelementptr [4 x i8], ptr %2, i64 %23
  %25 = load float, ptr %24, align 4
  %26 = load float, ptr %22, align 4
  %27 = fsub float %26, %25
  store float %27, ptr %22, align 4
  br label %28

28:                                               ; preds = %4, %18
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z12covar_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #0 {
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %7 = mul i32 %5, %6
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = add i32 %7, %8
  %10 = icmp slt i32 %9, %0
  br i1 %10, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %4
  %11 = shl nsw i32 %9, 11
  %12 = icmp sgt i32 %1, 0
  %xtraiter = and i32 %1, 3
  %13 = icmp ult i32 %1, 4
  %unroll_iter = and i32 %1, 2147483644
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  %lcmp.mod35 = icmp ne i32 %xtraiter, 0
  br label %14

14:                                               ; preds = %.preheader, %._crit_edge
  %.030 = phi i32 [ %9, %.preheader ], [ %85, %._crit_edge ]
  %15 = add nsw i32 %.030, %11
  %16 = sext i32 %15 to i64
  %17 = getelementptr [4 x i8], ptr %2, i64 %16
  store float 0.000000e+00, ptr %17, align 4
  br i1 %12, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %14
  br i1 %13, label %.lr.ph.epil.preheader, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %18 = phi float [ %65, %.lr.ph ], [ 0.000000e+00, %.lr.ph.preheader ]
  %.02629 = phi i32 [ %66, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %niter = phi i32 [ %niter.next.3, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %19 = shl nuw nsw i32 %.02629, 11
  %20 = add nsw i32 %19, %9
  %21 = sext i32 %20 to i64
  %22 = getelementptr [4 x i8], ptr %3, i64 %21
  %23 = load float, ptr %22, align 4
  %24 = add nsw i32 %19, %.030
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %3, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = fmul float %23, %27
  %29 = fadd float %18, %28
  store float %29, ptr %17, align 4
  %30 = shl i32 %.02629, 11
  %31 = or disjoint i32 %30, 2048
  %32 = add nsw i32 %31, %9
  %33 = sext i32 %32 to i64
  %34 = getelementptr [4 x i8], ptr %3, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = add nsw i32 %31, %.030
  %37 = sext i32 %36 to i64
  %38 = getelementptr [4 x i8], ptr %3, i64 %37
  %39 = load float, ptr %38, align 4
  %40 = fmul float %35, %39
  %41 = fadd float %29, %40
  store float %41, ptr %17, align 4
  %42 = shl i32 %.02629, 11
  %43 = or disjoint i32 %42, 4096
  %44 = add nsw i32 %43, %9
  %45 = sext i32 %44 to i64
  %46 = getelementptr [4 x i8], ptr %3, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = add nsw i32 %43, %.030
  %49 = sext i32 %48 to i64
  %50 = getelementptr [4 x i8], ptr %3, i64 %49
  %51 = load float, ptr %50, align 4
  %52 = fmul float %47, %51
  %53 = fadd float %41, %52
  store float %53, ptr %17, align 4
  %54 = shl i32 %.02629, 11
  %55 = or disjoint i32 %54, 6144
  %56 = add nsw i32 %55, %9
  %57 = sext i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr %3, i64 %57
  %59 = load float, ptr %58, align 4
  %60 = add nsw i32 %55, %.030
  %61 = sext i32 %60 to i64
  %62 = getelementptr [4 x i8], ptr %3, i64 %61
  %63 = load float, ptr %62, align 4
  %64 = fmul float %59, %63
  %65 = fadd float %53, %64
  store float %65, ptr %17, align 4
  %66 = add nuw nsw i32 %.02629, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br i1 %lcmp.mod.not, label %._crit_edge, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %65, %._crit_edge.loopexit.unr-lcssa ]
  %.02629.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %66, %._crit_edge.loopexit.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod35)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %67 = phi float [ %78, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.02629.epil = phi i32 [ %79, %.lr.ph.epil ], [ %.02629.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %68 = shl nuw nsw i32 %.02629.epil, 11
  %69 = add nsw i32 %68, %9
  %70 = sext i32 %69 to i64
  %71 = getelementptr [4 x i8], ptr %3, i64 %70
  %72 = load float, ptr %71, align 4
  %73 = add nsw i32 %68, %.030
  %74 = sext i32 %73 to i64
  %75 = getelementptr [4 x i8], ptr %3, i64 %74
  %76 = load float, ptr %75, align 4
  %77 = fmul float %72, %76
  %78 = fadd float %67, %77
  store float %78, ptr %17, align 4
  %79 = add nuw nsw i32 %.02629.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %.lr.ph.epil, !llvm.loop !5

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.epil, %14
  %80 = phi float [ 0.000000e+00, %14 ], [ %65, %._crit_edge.loopexit.unr-lcssa ], [ %78, %.lr.ph.epil ]
  %81 = shl nsw i32 %.030, 11
  %82 = add nsw i32 %81, %9
  %83 = sext i32 %82 to i64
  %84 = getelementptr [4 x i8], ptr %2, i64 %83
  store float %80, ptr %84, align 4
  %85 = add nsw i32 %.030, 1
  %86 = icmp slt i32 %85, %0
  br i1 %86, label %14, label %.loopexit

.loopexit:                                        ; preds = %._crit_edge, %4
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

attributes #0 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
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
