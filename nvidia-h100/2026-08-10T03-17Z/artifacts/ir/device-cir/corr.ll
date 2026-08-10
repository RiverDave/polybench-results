; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/CORR/correlation.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/CORR/correlation.cu"
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

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z10std_kerneliiPfS_S_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef writeonly captures(none) %3, ptr nofree noundef readonly captures(none) %4) local_unnamed_addr #0 {
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %8 = mul i32 %6, %7
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = add i32 %8, %9
  %11 = icmp slt i32 %10, %0
  br i1 %11, label %12, label %77

12:                                               ; preds = %5
  %13 = sext i32 %10 to i64
  %14 = getelementptr [4 x i8], ptr %3, i64 %13
  store float 0.000000e+00, ptr %14, align 4
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %12
  %16 = getelementptr [4 x i8], ptr %2, i64 %13
  %xtraiter = and i32 %1, 3
  %17 = icmp ult i32 %1, 4
  br i1 %17, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %1, 2147483644
  br label %18

18:                                               ; preds = %18, %.lr.ph.new
  %19 = phi float [ 0.000000e+00, %.lr.ph.new ], [ %58, %18 ]
  %.029 = phi i32 [ 0, %.lr.ph.new ], [ %59, %18 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.3, %18 ]
  %20 = shl nuw nsw i32 %.029, 11
  %21 = add nsw i32 %20, %10
  %22 = sext i32 %21 to i64
  %23 = getelementptr [4 x i8], ptr %4, i64 %22
  %24 = load float, ptr %23, align 4
  %25 = load float, ptr %16, align 4
  %26 = fsub float %24, %25
  %27 = fmul float %26, %26
  %28 = fadd float %19, %27
  store float %28, ptr %14, align 4
  %29 = shl i32 %.029, 11
  %30 = or disjoint i32 %29, 2048
  %31 = add nsw i32 %30, %10
  %32 = sext i32 %31 to i64
  %33 = getelementptr [4 x i8], ptr %4, i64 %32
  %34 = load float, ptr %33, align 4
  %35 = load float, ptr %16, align 4
  %36 = fsub float %34, %35
  %37 = fmul float %36, %36
  %38 = fadd float %28, %37
  store float %38, ptr %14, align 4
  %39 = shl i32 %.029, 11
  %40 = or disjoint i32 %39, 4096
  %41 = add nsw i32 %40, %10
  %42 = sext i32 %41 to i64
  %43 = getelementptr [4 x i8], ptr %4, i64 %42
  %44 = load float, ptr %43, align 4
  %45 = load float, ptr %16, align 4
  %46 = fsub float %44, %45
  %47 = fmul float %46, %46
  %48 = fadd float %38, %47
  store float %48, ptr %14, align 4
  %49 = shl i32 %.029, 11
  %50 = or disjoint i32 %49, 6144
  %51 = add nsw i32 %50, %10
  %52 = sext i32 %51 to i64
  %53 = getelementptr [4 x i8], ptr %4, i64 %52
  %54 = load float, ptr %53, align 4
  %55 = load float, ptr %16, align 4
  %56 = fsub float %54, %55
  %57 = fmul float %56, %56
  %58 = fadd float %48, %57
  store float %58, ptr %14, align 4
  %59 = add nuw nsw i32 %.029, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %._crit_edge.loopexit.unr-lcssa, label %18

._crit_edge.loopexit.unr-lcssa:                   ; preds = %18
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph ], [ %58, %._crit_edge.loopexit.unr-lcssa ]
  %.029.epil.init = phi i32 [ 0, %.lr.ph ], [ %59, %._crit_edge.loopexit.unr-lcssa ]
  %lcmp.mod32 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod32)
  br label %60

60:                                               ; preds = %60, %.epil.preheader
  %61 = phi float [ %.epil.init, %.epil.preheader ], [ %70, %60 ]
  %.029.epil = phi i32 [ %.029.epil.init, %.epil.preheader ], [ %71, %60 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %60 ]
  %62 = shl nuw nsw i32 %.029.epil, 11
  %63 = add nsw i32 %62, %10
  %64 = sext i32 %63 to i64
  %65 = getelementptr [4 x i8], ptr %4, i64 %64
  %66 = load float, ptr %65, align 4
  %67 = load float, ptr %16, align 4
  %68 = fsub float %66, %67
  %69 = fmul float %68, %68
  %70 = fadd float %61, %69
  store float %70, ptr %14, align 4
  %71 = add nuw nsw i32 %.029.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %60, !llvm.loop !5

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %60, %12
  %72 = phi float [ 0.000000e+00, %12 ], [ %58, %._crit_edge.loopexit.unr-lcssa ], [ %70, %60 ]
  %73 = fdiv float %72, f0x4A442E10
  %74 = tail call noundef float @llvm.nvvm.sqrt.approx.f(float %73) #5
  store float %74, ptr %14, align 4
  %75 = fcmp ugt float %74, 5.000000e-03
  br i1 %75, label %77, label %76

76:                                               ; preds = %._crit_edge
  store float 1.000000e+00, ptr %14, align 4
  br label %77

77:                                               ; preds = %5, %._crit_edge, %76
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z13reduce_kerneliiPfS_S_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef captures(none) %4) local_unnamed_addr #1 {
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %8 = mul i32 %6, %7
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = add i32 %8, %9
  %11 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %12 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %13 = mul nuw nsw i32 %11, %12
  %14 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %15 = add nuw nsw i32 %13, %14
  %16 = icmp slt i32 %15, %1
  %17 = icmp slt i32 %10, %0
  %18 = and i1 %17, %16
  br i1 %18, label %19, label %34

19:                                               ; preds = %5
  %20 = sext i32 %10 to i64
  %21 = getelementptr [4 x i8], ptr %2, i64 %20
  %22 = load float, ptr %21, align 4
  %23 = shl nsw i32 %15, 11
  %24 = add nsw i32 %23, %10
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %4, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = fsub float %27, %22
  store float %28, ptr %26, align 4
  %29 = tail call noundef float @llvm.nvvm.sqrt.approx.f(float f0x4A442E10) #5
  %30 = getelementptr [4 x i8], ptr %3, i64 %20
  %31 = load float, ptr %30, align 4
  %32 = fmul float %29, %31
  %33 = fdiv float %28, %32
  store float %33, ptr %26, align 4
  br label %34

34:                                               ; preds = %5, %19
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11corr_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #0 {
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %7 = mul i32 %5, %6
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = add i32 %7, %8
  %10 = add nsw i32 %0, -1
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %.loopexit

12:                                               ; preds = %4
  %13 = shl nsw i32 %9, 11
  %14 = mul i32 %9, 2049
  %15 = sext i32 %14 to i64
  %16 = getelementptr [4 x i8], ptr %2, i64 %15
  store float 1.000000e+00, ptr %16, align 4
  %.032 = add nsw i32 %9, 1
  %17 = icmp slt i32 %.032, %0
  br i1 %17, label %.lr.ph35, label %.loopexit

.lr.ph35:                                         ; preds = %12
  %18 = icmp sgt i32 %1, 0
  %xtraiter = and i32 %1, 3
  %19 = icmp ult i32 %1, 4
  %unroll_iter = and i32 %1, 2147483644
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  %lcmp.mod40 = icmp ne i32 %xtraiter, 0
  br label %20

20:                                               ; preds = %.lr.ph35, %._crit_edge
  %.033 = phi i32 [ %.032, %.lr.ph35 ], [ %.0, %._crit_edge ]
  %21 = add nsw i32 %.033, %13
  %22 = sext i32 %21 to i64
  %23 = getelementptr [4 x i8], ptr %2, i64 %22
  store float 0.000000e+00, ptr %23, align 4
  br i1 %18, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %20
  br i1 %19, label %.lr.ph.epil.preheader, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %24 = phi float [ %71, %.lr.ph ], [ 0.000000e+00, %.lr.ph.preheader ]
  %.02931 = phi i32 [ %72, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %niter = phi i32 [ %niter.next.3, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %25 = shl nuw nsw i32 %.02931, 11
  %26 = add nsw i32 %25, %9
  %27 = sext i32 %26 to i64
  %28 = getelementptr [4 x i8], ptr %3, i64 %27
  %29 = load float, ptr %28, align 4
  %30 = add nsw i32 %25, %.033
  %31 = sext i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr %3, i64 %31
  %33 = load float, ptr %32, align 4
  %34 = fmul float %29, %33
  %35 = fadd float %24, %34
  store float %35, ptr %23, align 4
  %36 = shl i32 %.02931, 11
  %37 = or disjoint i32 %36, 2048
  %38 = add nsw i32 %37, %9
  %39 = sext i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr %3, i64 %39
  %41 = load float, ptr %40, align 4
  %42 = add nsw i32 %37, %.033
  %43 = sext i32 %42 to i64
  %44 = getelementptr [4 x i8], ptr %3, i64 %43
  %45 = load float, ptr %44, align 4
  %46 = fmul float %41, %45
  %47 = fadd float %35, %46
  store float %47, ptr %23, align 4
  %48 = shl i32 %.02931, 11
  %49 = or disjoint i32 %48, 4096
  %50 = add nsw i32 %49, %9
  %51 = sext i32 %50 to i64
  %52 = getelementptr [4 x i8], ptr %3, i64 %51
  %53 = load float, ptr %52, align 4
  %54 = add nsw i32 %49, %.033
  %55 = sext i32 %54 to i64
  %56 = getelementptr [4 x i8], ptr %3, i64 %55
  %57 = load float, ptr %56, align 4
  %58 = fmul float %53, %57
  %59 = fadd float %47, %58
  store float %59, ptr %23, align 4
  %60 = shl i32 %.02931, 11
  %61 = or disjoint i32 %60, 6144
  %62 = add nsw i32 %61, %9
  %63 = sext i32 %62 to i64
  %64 = getelementptr [4 x i8], ptr %3, i64 %63
  %65 = load float, ptr %64, align 4
  %66 = add nsw i32 %61, %.033
  %67 = sext i32 %66 to i64
  %68 = getelementptr [4 x i8], ptr %3, i64 %67
  %69 = load float, ptr %68, align 4
  %70 = fmul float %65, %69
  %71 = fadd float %59, %70
  store float %71, ptr %23, align 4
  %72 = add nuw nsw i32 %.02931, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br i1 %lcmp.mod.not, label %._crit_edge, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %71, %._crit_edge.loopexit.unr-lcssa ]
  %.02931.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %72, %._crit_edge.loopexit.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod40)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %73 = phi float [ %84, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.02931.epil = phi i32 [ %85, %.lr.ph.epil ], [ %.02931.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %74 = shl nuw nsw i32 %.02931.epil, 11
  %75 = add nsw i32 %74, %9
  %76 = sext i32 %75 to i64
  %77 = getelementptr [4 x i8], ptr %3, i64 %76
  %78 = load float, ptr %77, align 4
  %79 = add nsw i32 %74, %.033
  %80 = sext i32 %79 to i64
  %81 = getelementptr [4 x i8], ptr %3, i64 %80
  %82 = load float, ptr %81, align 4
  %83 = fmul float %78, %82
  %84 = fadd float %73, %83
  store float %84, ptr %23, align 4
  %85 = add nuw nsw i32 %.02931.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %.lr.ph.epil, !llvm.loop !6

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.epil, %20
  %86 = phi float [ 0.000000e+00, %20 ], [ %71, %._crit_edge.loopexit.unr-lcssa ], [ %84, %.lr.ph.epil ]
  %87 = shl nsw i32 %.033, 11
  %88 = add nsw i32 %87, %9
  %89 = sext i32 %88 to i64
  %90 = getelementptr [4 x i8], ptr %2, i64 %89
  store float %86, ptr %90, align 4
  %.0 = add nsw i32 %.033, 1
  %91 = icmp slt i32 %.0, %0
  br i1 %91, label %20, label %.loopexit

.loopexit:                                        ; preds = %._crit_edge, %12, %4
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

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.sqrt.approx.f(float) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #4

attributes #0 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none) }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}
!nvvmir.version = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!2 = !{i32 2, i32 0}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.unroll.disable"}
!5 = distinct !{!5, !4}
!6 = distinct !{!6, !4}
