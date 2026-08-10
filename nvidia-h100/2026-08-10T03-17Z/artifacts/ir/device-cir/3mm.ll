; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/3MM/3mm.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/3MM/3mm.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11mm3_kernel1iiiiiPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef writeonly captures(none) %7) local_unnamed_addr #0 {
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
  %20 = icmp slt i32 %13, %1
  %21 = and i1 %19, %20
  br i1 %21, label %22, label %.loopexit

22:                                               ; preds = %8
  %23 = shl nsw i32 %18, 9
  %24 = add nsw i32 %23, %13
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %7, i64 %25
  store float 0.000000e+00, ptr %26, align 4
  %27 = icmp sgt i32 %2, 0
  br i1 %27, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %22
  %xtraiter = and i32 %2, 3
  %28 = icmp ult i32 %2, 4
  br i1 %28, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %2, 2147483644
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %29 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %76, %.lr.ph ]
  %.020 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %77, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.3, %.lr.ph ]
  %30 = add nuw nsw i32 %.020, %23
  %31 = zext nneg i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr %5, i64 %31
  %33 = load float, ptr %32, align 4
  %34 = shl nuw nsw i32 %.020, 9
  %35 = add nsw i32 %34, %13
  %36 = sext i32 %35 to i64
  %37 = getelementptr [4 x i8], ptr %6, i64 %36
  %38 = load float, ptr %37, align 4
  %39 = fmul float %33, %38
  %40 = fadd float %29, %39
  store float %40, ptr %26, align 4
  %41 = or disjoint i32 %.020, 1
  %42 = add nuw nsw i32 %41, %23
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr [4 x i8], ptr %5, i64 %43
  %45 = load float, ptr %44, align 4
  %46 = shl nuw nsw i32 %41, 9
  %47 = add nsw i32 %46, %13
  %48 = sext i32 %47 to i64
  %49 = getelementptr [4 x i8], ptr %6, i64 %48
  %50 = load float, ptr %49, align 4
  %51 = fmul float %45, %50
  %52 = fadd float %40, %51
  store float %52, ptr %26, align 4
  %53 = or disjoint i32 %.020, 2
  %54 = add nuw nsw i32 %53, %23
  %55 = zext nneg i32 %54 to i64
  %56 = getelementptr [4 x i8], ptr %5, i64 %55
  %57 = load float, ptr %56, align 4
  %58 = shl nuw nsw i32 %53, 9
  %59 = add nsw i32 %58, %13
  %60 = sext i32 %59 to i64
  %61 = getelementptr [4 x i8], ptr %6, i64 %60
  %62 = load float, ptr %61, align 4
  %63 = fmul float %57, %62
  %64 = fadd float %52, %63
  store float %64, ptr %26, align 4
  %65 = or disjoint i32 %.020, 3
  %66 = add nuw nsw i32 %65, %23
  %67 = zext nneg i32 %66 to i64
  %68 = getelementptr [4 x i8], ptr %5, i64 %67
  %69 = load float, ptr %68, align 4
  %70 = shl nuw nsw i32 %65, 9
  %71 = add nsw i32 %70, %13
  %72 = sext i32 %71 to i64
  %73 = getelementptr [4 x i8], ptr %6, i64 %72
  %74 = load float, ptr %73, align 4
  %75 = fmul float %69, %74
  %76 = fadd float %64, %75
  store float %76, ptr %26, align 4
  %77 = add nuw nsw i32 %.020, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %76, %.loopexit.loopexit.unr-lcssa ]
  %.020.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %77, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod23 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod23)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %78 = phi float [ %89, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.020.epil = phi i32 [ %90, %.lr.ph.epil ], [ %.020.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %79 = add nuw nsw i32 %.020.epil, %23
  %80 = zext nneg i32 %79 to i64
  %81 = getelementptr [4 x i8], ptr %5, i64 %80
  %82 = load float, ptr %81, align 4
  %83 = shl nuw nsw i32 %.020.epil, 9
  %84 = add nsw i32 %83, %13
  %85 = sext i32 %84 to i64
  %86 = getelementptr [4 x i8], ptr %6, i64 %85
  %87 = load float, ptr %86, align 4
  %88 = fmul float %82, %87
  %89 = fadd float %78, %88
  store float %89, ptr %26, align 4
  %90 = add nuw nsw i32 %.020.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !3

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.epil, %22, %8
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11mm3_kernel2iiiiiPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef writeonly captures(none) %7) local_unnamed_addr #0 {
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
  %19 = icmp slt i32 %18, %1
  %20 = icmp slt i32 %13, %3
  %21 = and i1 %19, %20
  br i1 %21, label %22, label %.loopexit

22:                                               ; preds = %8
  %23 = shl nsw i32 %18, 9
  %24 = add nsw i32 %23, %13
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %7, i64 %25
  store float 0.000000e+00, ptr %26, align 4
  %27 = icmp sgt i32 %4, 0
  br i1 %27, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %22
  %xtraiter = and i32 %4, 3
  %28 = icmp ult i32 %4, 4
  br i1 %28, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %4, 2147483644
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %29 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %76, %.lr.ph ]
  %.020 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %77, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.3, %.lr.ph ]
  %30 = add nuw nsw i32 %.020, %23
  %31 = zext nneg i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr %5, i64 %31
  %33 = load float, ptr %32, align 4
  %34 = shl nuw nsw i32 %.020, 9
  %35 = add nsw i32 %34, %13
  %36 = sext i32 %35 to i64
  %37 = getelementptr [4 x i8], ptr %6, i64 %36
  %38 = load float, ptr %37, align 4
  %39 = fmul float %33, %38
  %40 = fadd float %29, %39
  store float %40, ptr %26, align 4
  %41 = or disjoint i32 %.020, 1
  %42 = add nuw nsw i32 %41, %23
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr [4 x i8], ptr %5, i64 %43
  %45 = load float, ptr %44, align 4
  %46 = shl nuw nsw i32 %41, 9
  %47 = add nsw i32 %46, %13
  %48 = sext i32 %47 to i64
  %49 = getelementptr [4 x i8], ptr %6, i64 %48
  %50 = load float, ptr %49, align 4
  %51 = fmul float %45, %50
  %52 = fadd float %40, %51
  store float %52, ptr %26, align 4
  %53 = or disjoint i32 %.020, 2
  %54 = add nuw nsw i32 %53, %23
  %55 = zext nneg i32 %54 to i64
  %56 = getelementptr [4 x i8], ptr %5, i64 %55
  %57 = load float, ptr %56, align 4
  %58 = shl nuw nsw i32 %53, 9
  %59 = add nsw i32 %58, %13
  %60 = sext i32 %59 to i64
  %61 = getelementptr [4 x i8], ptr %6, i64 %60
  %62 = load float, ptr %61, align 4
  %63 = fmul float %57, %62
  %64 = fadd float %52, %63
  store float %64, ptr %26, align 4
  %65 = or disjoint i32 %.020, 3
  %66 = add nuw nsw i32 %65, %23
  %67 = zext nneg i32 %66 to i64
  %68 = getelementptr [4 x i8], ptr %5, i64 %67
  %69 = load float, ptr %68, align 4
  %70 = shl nuw nsw i32 %65, 9
  %71 = add nsw i32 %70, %13
  %72 = sext i32 %71 to i64
  %73 = getelementptr [4 x i8], ptr %6, i64 %72
  %74 = load float, ptr %73, align 4
  %75 = fmul float %69, %74
  %76 = fadd float %64, %75
  store float %76, ptr %26, align 4
  %77 = add nuw nsw i32 %.020, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %76, %.loopexit.loopexit.unr-lcssa ]
  %.020.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %77, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod23 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod23)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %78 = phi float [ %89, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.020.epil = phi i32 [ %90, %.lr.ph.epil ], [ %.020.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %79 = add nuw nsw i32 %.020.epil, %23
  %80 = zext nneg i32 %79 to i64
  %81 = getelementptr [4 x i8], ptr %5, i64 %80
  %82 = load float, ptr %81, align 4
  %83 = shl nuw nsw i32 %.020.epil, 9
  %84 = add nsw i32 %83, %13
  %85 = sext i32 %84 to i64
  %86 = getelementptr [4 x i8], ptr %6, i64 %85
  %87 = load float, ptr %86, align 4
  %88 = fmul float %82, %87
  %89 = fadd float %78, %88
  store float %89, ptr %26, align 4
  %90 = add nuw nsw i32 %.020.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !5

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.epil, %22, %8
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11mm3_kernel3iiiiiPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef writeonly captures(none) %7) local_unnamed_addr #0 {
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
  %20 = icmp slt i32 %13, %3
  %21 = and i1 %19, %20
  br i1 %21, label %22, label %.loopexit

22:                                               ; preds = %8
  %23 = shl nsw i32 %18, 9
  %24 = add nsw i32 %23, %13
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %7, i64 %25
  store float 0.000000e+00, ptr %26, align 4
  %27 = icmp sgt i32 %1, 0
  br i1 %27, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %22
  %xtraiter = and i32 %1, 3
  %28 = icmp ult i32 %1, 4
  br i1 %28, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %1, 2147483644
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %29 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %76, %.lr.ph ]
  %.020 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %77, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.3, %.lr.ph ]
  %30 = add nuw nsw i32 %.020, %23
  %31 = zext nneg i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr %5, i64 %31
  %33 = load float, ptr %32, align 4
  %34 = shl nuw nsw i32 %.020, 9
  %35 = add nsw i32 %34, %13
  %36 = sext i32 %35 to i64
  %37 = getelementptr [4 x i8], ptr %6, i64 %36
  %38 = load float, ptr %37, align 4
  %39 = fmul float %33, %38
  %40 = fadd float %29, %39
  store float %40, ptr %26, align 4
  %41 = or disjoint i32 %.020, 1
  %42 = add nuw nsw i32 %41, %23
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr [4 x i8], ptr %5, i64 %43
  %45 = load float, ptr %44, align 4
  %46 = shl nuw nsw i32 %41, 9
  %47 = add nsw i32 %46, %13
  %48 = sext i32 %47 to i64
  %49 = getelementptr [4 x i8], ptr %6, i64 %48
  %50 = load float, ptr %49, align 4
  %51 = fmul float %45, %50
  %52 = fadd float %40, %51
  store float %52, ptr %26, align 4
  %53 = or disjoint i32 %.020, 2
  %54 = add nuw nsw i32 %53, %23
  %55 = zext nneg i32 %54 to i64
  %56 = getelementptr [4 x i8], ptr %5, i64 %55
  %57 = load float, ptr %56, align 4
  %58 = shl nuw nsw i32 %53, 9
  %59 = add nsw i32 %58, %13
  %60 = sext i32 %59 to i64
  %61 = getelementptr [4 x i8], ptr %6, i64 %60
  %62 = load float, ptr %61, align 4
  %63 = fmul float %57, %62
  %64 = fadd float %52, %63
  store float %64, ptr %26, align 4
  %65 = or disjoint i32 %.020, 3
  %66 = add nuw nsw i32 %65, %23
  %67 = zext nneg i32 %66 to i64
  %68 = getelementptr [4 x i8], ptr %5, i64 %67
  %69 = load float, ptr %68, align 4
  %70 = shl nuw nsw i32 %65, 9
  %71 = add nsw i32 %70, %13
  %72 = sext i32 %71 to i64
  %73 = getelementptr [4 x i8], ptr %6, i64 %72
  %74 = load float, ptr %73, align 4
  %75 = fmul float %69, %74
  %76 = fadd float %64, %75
  store float %76, ptr %26, align 4
  %77 = add nuw nsw i32 %.020, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %76, %.loopexit.loopexit.unr-lcssa ]
  %.020.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %77, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod23 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod23)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %78 = phi float [ %89, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.020.epil = phi i32 [ %90, %.lr.ph.epil ], [ %.020.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %79 = add nuw nsw i32 %.020.epil, %23
  %80 = zext nneg i32 %79 to i64
  %81 = getelementptr [4 x i8], ptr %5, i64 %80
  %82 = load float, ptr %81, align 4
  %83 = shl nuw nsw i32 %.020.epil, 9
  %84 = add nsw i32 %83, %13
  %85 = sext i32 %84 to i64
  %86 = getelementptr [4 x i8], ptr %6, i64 %85
  %87 = load float, ptr %86, align 4
  %88 = fmul float %82, %87
  %89 = fadd float %78, %88
  store float %89, ptr %26, align 4
  %90 = add nuw nsw i32 %.020.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !6

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.epil, %22, %8
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

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

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
