; ModuleID = '/home/ubuntu/aa-deref-20261004/runs/GRAMSCHM/B/raw.device.ll'
source_filename = "device_cuda_nvptx64_nvidia_cuda__sm_86"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z19gramschmidt_kernel1iiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) dereferenceable(16777216) %2, ptr nofree noundef writeonly captures(none) dereferenceable(16777216) %3, ptr nofree noundef readnone captures(none) dereferenceable(16777216) %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %9 = mul i32 %7, %8
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = sub nsw i32 0, %10
  %12 = icmp eq i32 %9, %11
  br i1 %12, label %.preheader, label %91

.preheader:                                       ; preds = %6
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i32 %0, 7
  %14 = icmp ult i32 %0, 8
  br i1 %14, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %0, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %.016 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %77, %.lr.ph ]
  %.01415 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %78, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %15 = shl nuw nsw i32 %.01415, 11
  %16 = add nsw i32 %15, %5
  %17 = sext i32 %16 to i64
  %18 = getelementptr [4 x i8], ptr %2, i64 %17
  %19 = load float, ptr %18, align 4
  %20 = fmul contract float %19, %19
  %21 = fadd contract float %.016, %20
  %22 = shl i32 %.01415, 11
  %23 = or disjoint i32 %22, 2048
  %24 = add nsw i32 %23, %5
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %2, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = fmul contract float %27, %27
  %29 = fadd contract float %21, %28
  %30 = shl i32 %.01415, 11
  %31 = or disjoint i32 %30, 4096
  %32 = add nsw i32 %31, %5
  %33 = sext i32 %32 to i64
  %34 = getelementptr [4 x i8], ptr %2, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fmul contract float %35, %35
  %37 = fadd contract float %29, %36
  %38 = shl i32 %.01415, 11
  %39 = or disjoint i32 %38, 6144
  %40 = add nsw i32 %39, %5
  %41 = sext i32 %40 to i64
  %42 = getelementptr [4 x i8], ptr %2, i64 %41
  %43 = load float, ptr %42, align 4
  %44 = fmul contract float %43, %43
  %45 = fadd contract float %37, %44
  %46 = shl i32 %.01415, 11
  %47 = or disjoint i32 %46, 8192
  %48 = add nsw i32 %47, %5
  %49 = sext i32 %48 to i64
  %50 = getelementptr [4 x i8], ptr %2, i64 %49
  %51 = load float, ptr %50, align 4
  %52 = fmul contract float %51, %51
  %53 = fadd contract float %45, %52
  %54 = shl i32 %.01415, 11
  %55 = or disjoint i32 %54, 10240
  %56 = add nsw i32 %55, %5
  %57 = sext i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr %2, i64 %57
  %59 = load float, ptr %58, align 4
  %60 = fmul contract float %59, %59
  %61 = fadd contract float %53, %60
  %62 = shl i32 %.01415, 11
  %63 = or disjoint i32 %62, 12288
  %64 = add nsw i32 %63, %5
  %65 = sext i32 %64 to i64
  %66 = getelementptr [4 x i8], ptr %2, i64 %65
  %67 = load float, ptr %66, align 4
  %68 = fmul contract float %67, %67
  %69 = fadd contract float %61, %68
  %70 = shl i32 %.01415, 11
  %71 = or disjoint i32 %70, 14336
  %72 = add nsw i32 %71, %5
  %73 = sext i32 %72 to i64
  %74 = getelementptr [4 x i8], ptr %2, i64 %73
  %75 = load float, ptr %74, align 4
  %76 = fmul contract float %75, %75
  %77 = fadd contract float %69, %76
  %78 = add nuw nsw i32 %.01415, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.preheader
  %.016.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %77, %._crit_edge.loopexit.unr-lcssa ]
  %.01415.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %78, %._crit_edge.loopexit.unr-lcssa ]
  %lcmp.mod18 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod18)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %.016.epil = phi float [ %85, %.lr.ph.epil ], [ %.016.epil.init, %.lr.ph.epil.preheader ]
  %.01415.epil = phi i32 [ %86, %.lr.ph.epil ], [ %.01415.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %79 = shl nuw nsw i32 %.01415.epil, 11
  %80 = add nsw i32 %79, %5
  %81 = sext i32 %80 to i64
  %82 = getelementptr [4 x i8], ptr %2, i64 %81
  %83 = load float, ptr %82, align 4
  %84 = fmul contract float %83, %83
  %85 = fadd contract float %.016.epil, %84
  %86 = add nuw nsw i32 %.01415.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge.loopexit, label %.lr.ph.epil, !llvm.loop !1

._crit_edge.loopexit:                             ; preds = %.lr.ph.epil, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi float [ %77, %._crit_edge.loopexit.unr-lcssa ], [ %85, %.lr.ph.epil ]
  %87 = tail call float @llvm.sqrt.f32(float %.lcssa)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.0.lcssa = phi float [ 0.000000e+00, %.preheader ], [ %87, %._crit_edge.loopexit ]
  %88 = mul nsw i32 %5, 2049
  %89 = sext i32 %88 to i64
  %90 = getelementptr [4 x i8], ptr %3, i64 %89
  store float %.0.lcssa, ptr %90, align 4
  br label %91

91:                                               ; preds = %._crit_edge, %6
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z19gramschmidt_kernel1iiPfS_S_i__noalias(i32 noundef %0, i32 noundef %1, ptr noalias nofree noundef readonly captures(none) dereferenceable(16777216) %2, ptr noalias nofree noundef writeonly captures(none) dereferenceable(16777216) %3, ptr noalias nofree noundef readnone captures(none) dereferenceable(16777216) %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %9 = mul i32 %7, %8
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = sub nsw i32 0, %10
  %12 = icmp eq i32 %9, %11
  br i1 %12, label %.preheader, label %91

.preheader:                                       ; preds = %6
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i32 %0, 7
  %14 = icmp ult i32 %0, 8
  br i1 %14, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %0, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %.016 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %77, %.lr.ph ]
  %.01415 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %78, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %15 = shl nuw nsw i32 %.01415, 11
  %16 = add nsw i32 %15, %5
  %17 = sext i32 %16 to i64
  %18 = getelementptr [4 x i8], ptr %2, i64 %17
  %19 = load float, ptr %18, align 4
  %20 = fmul contract float %19, %19
  %21 = fadd contract float %.016, %20
  %22 = shl i32 %.01415, 11
  %23 = or disjoint i32 %22, 2048
  %24 = add nsw i32 %23, %5
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %2, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = fmul contract float %27, %27
  %29 = fadd contract float %21, %28
  %30 = shl i32 %.01415, 11
  %31 = or disjoint i32 %30, 4096
  %32 = add nsw i32 %31, %5
  %33 = sext i32 %32 to i64
  %34 = getelementptr [4 x i8], ptr %2, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fmul contract float %35, %35
  %37 = fadd contract float %29, %36
  %38 = shl i32 %.01415, 11
  %39 = or disjoint i32 %38, 6144
  %40 = add nsw i32 %39, %5
  %41 = sext i32 %40 to i64
  %42 = getelementptr [4 x i8], ptr %2, i64 %41
  %43 = load float, ptr %42, align 4
  %44 = fmul contract float %43, %43
  %45 = fadd contract float %37, %44
  %46 = shl i32 %.01415, 11
  %47 = or disjoint i32 %46, 8192
  %48 = add nsw i32 %47, %5
  %49 = sext i32 %48 to i64
  %50 = getelementptr [4 x i8], ptr %2, i64 %49
  %51 = load float, ptr %50, align 4
  %52 = fmul contract float %51, %51
  %53 = fadd contract float %45, %52
  %54 = shl i32 %.01415, 11
  %55 = or disjoint i32 %54, 10240
  %56 = add nsw i32 %55, %5
  %57 = sext i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr %2, i64 %57
  %59 = load float, ptr %58, align 4
  %60 = fmul contract float %59, %59
  %61 = fadd contract float %53, %60
  %62 = shl i32 %.01415, 11
  %63 = or disjoint i32 %62, 12288
  %64 = add nsw i32 %63, %5
  %65 = sext i32 %64 to i64
  %66 = getelementptr [4 x i8], ptr %2, i64 %65
  %67 = load float, ptr %66, align 4
  %68 = fmul contract float %67, %67
  %69 = fadd contract float %61, %68
  %70 = shl i32 %.01415, 11
  %71 = or disjoint i32 %70, 14336
  %72 = add nsw i32 %71, %5
  %73 = sext i32 %72 to i64
  %74 = getelementptr [4 x i8], ptr %2, i64 %73
  %75 = load float, ptr %74, align 4
  %76 = fmul contract float %75, %75
  %77 = fadd contract float %69, %76
  %78 = add nuw nsw i32 %.01415, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.preheader
  %.016.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %77, %._crit_edge.loopexit.unr-lcssa ]
  %.01415.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %78, %._crit_edge.loopexit.unr-lcssa ]
  %lcmp.mod18 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod18)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %.016.epil = phi float [ %85, %.lr.ph.epil ], [ %.016.epil.init, %.lr.ph.epil.preheader ]
  %.01415.epil = phi i32 [ %86, %.lr.ph.epil ], [ %.01415.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %79 = shl nuw nsw i32 %.01415.epil, 11
  %80 = add nsw i32 %79, %5
  %81 = sext i32 %80 to i64
  %82 = getelementptr [4 x i8], ptr %2, i64 %81
  %83 = load float, ptr %82, align 4
  %84 = fmul contract float %83, %83
  %85 = fadd contract float %.016.epil, %84
  %86 = add nuw nsw i32 %.01415.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge.loopexit, label %.lr.ph.epil, !llvm.loop !3

._crit_edge.loopexit:                             ; preds = %.lr.ph.epil, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi float [ %77, %._crit_edge.loopexit.unr-lcssa ], [ %85, %.lr.ph.epil ]
  %87 = tail call float @llvm.sqrt.f32(float %.lcssa)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.0.lcssa = phi float [ 0.000000e+00, %.preheader ], [ %87, %._crit_edge.loopexit ]
  %88 = mul nsw i32 %5, 2049
  %89 = sext i32 %88 to i64
  %90 = getelementptr [4 x i8], ptr %3, i64 %89
  store float %.0.lcssa, ptr %90, align 4
  br label %91

91:                                               ; preds = %._crit_edge, %6
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z19gramschmidt_kernel2iiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) dereferenceable(16777216) %2, ptr nofree noundef readonly captures(none) dereferenceable(16777216) %3, ptr nofree noundef writeonly captures(none) dereferenceable(16777216) %4, i32 noundef %5) local_unnamed_addr #1 {
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %9 = mul i32 %7, %8
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = add i32 %9, %10
  %12 = icmp slt i32 %11, %0
  br i1 %12, label %13, label %25

13:                                               ; preds = %6
  %14 = shl nsw i32 %11, 11
  %15 = add nsw i32 %5, %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr [4 x i8], ptr %2, i64 %16
  %18 = load float, ptr %17, align 4
  %19 = mul nsw i32 %5, 2049
  %20 = sext i32 %19 to i64
  %21 = getelementptr [4 x i8], ptr %3, i64 %20
  %22 = load float, ptr %21, align 4
  %23 = fdiv contract float %18, %22
  %24 = getelementptr [4 x i8], ptr %4, i64 %16
  store float %23, ptr %24, align 4
  br label %25

25:                                               ; preds = %13, %6
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z19gramschmidt_kernel2iiPfS_S_i__noalias(i32 noundef %0, i32 noundef %1, ptr noalias nofree noundef readonly captures(none) dereferenceable(16777216) %2, ptr noalias nofree noundef readonly captures(none) dereferenceable(16777216) %3, ptr noalias nofree noundef writeonly captures(none) dereferenceable(16777216) %4, i32 noundef %5) local_unnamed_addr #1 {
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %9 = mul i32 %7, %8
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = add i32 %9, %10
  %12 = icmp slt i32 %11, %0
  br i1 %12, label %13, label %25

13:                                               ; preds = %6
  %14 = shl nsw i32 %11, 11
  %15 = add nsw i32 %5, %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr [4 x i8], ptr %2, i64 %16
  %18 = load float, ptr %17, align 4
  %19 = mul nsw i32 %5, 2049
  %20 = sext i32 %19 to i64
  %21 = getelementptr [4 x i8], ptr %3, i64 %20
  %22 = load float, ptr %21, align 4
  %23 = fdiv contract float %18, %22
  %24 = getelementptr [4 x i8], ptr %4, i64 %16
  store float %23, ptr %24, align 4
  br label %25

25:                                               ; preds = %13, %6
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z19gramschmidt_kernel3iiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr nofree noundef captures(none) dereferenceable(16777216) %2, ptr nofree noundef captures(none) dereferenceable(16777216) %3, ptr nofree noundef readonly captures(none) dereferenceable(16777216) %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %9 = mul i32 %7, %8
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = add i32 %9, %10
  %12 = icmp sgt i32 %11, %5
  %13 = icmp slt i32 %11, %1
  %14 = and i1 %13, %12
  br i1 %14, label %15, label %.loopexit

15:                                               ; preds = %6
  %16 = shl nsw i32 %5, 11
  %17 = add nsw i32 %16, %11
  %18 = sext i32 %17 to i64
  %19 = getelementptr [4 x i8], ptr %3, i64 %18
  store float 0.000000e+00, ptr %19, align 4
  %20 = icmp sgt i32 %0, 0
  br i1 %20, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %15
  %xtraiter = and i32 %0, 3
  %21 = icmp ult i32 %0, 4
  br i1 %21, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %0, 2147483644
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %22 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %69, %.lr.ph ]
  %.033 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %70, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.3, %.lr.ph ]
  %23 = shl nuw nsw i32 %.033, 11
  %24 = add nsw i32 %23, %5
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %4, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = add nsw i32 %23, %11
  %29 = sext i32 %28 to i64
  %30 = getelementptr [4 x i8], ptr %2, i64 %29
  %31 = load float, ptr %30, align 4
  %32 = fmul contract float %27, %31
  %33 = fadd contract float %22, %32
  store float %33, ptr %19, align 4
  %34 = shl i32 %.033, 11
  %35 = or disjoint i32 %34, 2048
  %36 = add nsw i32 %35, %5
  %37 = sext i32 %36 to i64
  %38 = getelementptr [4 x i8], ptr %4, i64 %37
  %39 = load float, ptr %38, align 4
  %40 = add nsw i32 %35, %11
  %41 = sext i32 %40 to i64
  %42 = getelementptr [4 x i8], ptr %2, i64 %41
  %43 = load float, ptr %42, align 4
  %44 = fmul contract float %39, %43
  %45 = fadd contract float %33, %44
  store float %45, ptr %19, align 4
  %46 = shl i32 %.033, 11
  %47 = or disjoint i32 %46, 4096
  %48 = add nsw i32 %47, %5
  %49 = sext i32 %48 to i64
  %50 = getelementptr [4 x i8], ptr %4, i64 %49
  %51 = load float, ptr %50, align 4
  %52 = add nsw i32 %47, %11
  %53 = sext i32 %52 to i64
  %54 = getelementptr [4 x i8], ptr %2, i64 %53
  %55 = load float, ptr %54, align 4
  %56 = fmul contract float %51, %55
  %57 = fadd contract float %45, %56
  store float %57, ptr %19, align 4
  %58 = shl i32 %.033, 11
  %59 = or disjoint i32 %58, 6144
  %60 = add nsw i32 %59, %5
  %61 = sext i32 %60 to i64
  %62 = getelementptr [4 x i8], ptr %4, i64 %61
  %63 = load float, ptr %62, align 4
  %64 = add nsw i32 %59, %11
  %65 = sext i32 %64 to i64
  %66 = getelementptr [4 x i8], ptr %2, i64 %65
  %67 = load float, ptr %66, align 4
  %68 = fmul contract float %63, %67
  %69 = fadd contract float %57, %68
  store float %69, ptr %19, align 4
  %70 = add nuw nsw i32 %.033, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.lr.ph35.preheader.unr-lcssa, label %.lr.ph

.lr.ph35.preheader.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.lr.ph35.preheader, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.lr.ph35.preheader.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %69, %.lr.ph35.preheader.unr-lcssa ]
  %.033.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %70, %.lr.ph35.preheader.unr-lcssa ]
  %lcmp.mod39 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod39)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %71 = phi float [ %82, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.033.epil = phi i32 [ %83, %.lr.ph.epil ], [ %.033.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %72 = shl nuw nsw i32 %.033.epil, 11
  %73 = add nsw i32 %72, %5
  %74 = sext i32 %73 to i64
  %75 = getelementptr [4 x i8], ptr %4, i64 %74
  %76 = load float, ptr %75, align 4
  %77 = add nsw i32 %72, %11
  %78 = sext i32 %77 to i64
  %79 = getelementptr [4 x i8], ptr %2, i64 %78
  %80 = load float, ptr %79, align 4
  %81 = fmul contract float %76, %80
  %82 = fadd contract float %71, %81
  store float %82, ptr %19, align 4
  %83 = add nuw nsw i32 %.033.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.lr.ph35.preheader, label %.lr.ph.epil, !llvm.loop !4

.lr.ph35.preheader:                               ; preds = %.lr.ph.epil, %.lr.ph35.preheader.unr-lcssa
  %xtraiter40 = and i32 %0, 3
  %84 = icmp ult i32 %0, 4
  br i1 %84, label %.lr.ph35.epil.preheader, label %.lr.ph35.preheader.new

.lr.ph35.preheader.new:                           ; preds = %.lr.ph35.preheader
  %unroll_iter44 = and i32 %0, 2147483644
  br label %.lr.ph35

.lr.ph35:                                         ; preds = %.lr.ph35, %.lr.ph35.preheader.new
  %.134 = phi i32 [ 0, %.lr.ph35.preheader.new ], [ %136, %.lr.ph35 ]
  %niter45 = phi i32 [ 0, %.lr.ph35.preheader.new ], [ %niter45.next.3, %.lr.ph35 ]
  %85 = shl nuw nsw i32 %.134, 11
  %86 = add nsw i32 %85, %5
  %87 = sext i32 %86 to i64
  %88 = getelementptr [4 x i8], ptr %4, i64 %87
  %89 = load float, ptr %88, align 4
  %90 = load float, ptr %19, align 4
  %91 = fmul contract float %89, %90
  %92 = add nsw i32 %85, %11
  %93 = sext i32 %92 to i64
  %94 = getelementptr [4 x i8], ptr %2, i64 %93
  %95 = load float, ptr %94, align 4
  %96 = fsub contract float %95, %91
  store float %96, ptr %94, align 4
  %97 = shl i32 %.134, 11
  %98 = or disjoint i32 %97, 2048
  %99 = add nsw i32 %98, %5
  %100 = sext i32 %99 to i64
  %101 = getelementptr [4 x i8], ptr %4, i64 %100
  %102 = load float, ptr %101, align 4
  %103 = load float, ptr %19, align 4
  %104 = fmul contract float %102, %103
  %105 = add nsw i32 %98, %11
  %106 = sext i32 %105 to i64
  %107 = getelementptr [4 x i8], ptr %2, i64 %106
  %108 = load float, ptr %107, align 4
  %109 = fsub contract float %108, %104
  store float %109, ptr %107, align 4
  %110 = shl i32 %.134, 11
  %111 = or disjoint i32 %110, 4096
  %112 = add nsw i32 %111, %5
  %113 = sext i32 %112 to i64
  %114 = getelementptr [4 x i8], ptr %4, i64 %113
  %115 = load float, ptr %114, align 4
  %116 = load float, ptr %19, align 4
  %117 = fmul contract float %115, %116
  %118 = add nsw i32 %111, %11
  %119 = sext i32 %118 to i64
  %120 = getelementptr [4 x i8], ptr %2, i64 %119
  %121 = load float, ptr %120, align 4
  %122 = fsub contract float %121, %117
  store float %122, ptr %120, align 4
  %123 = shl i32 %.134, 11
  %124 = or disjoint i32 %123, 6144
  %125 = add nsw i32 %124, %5
  %126 = sext i32 %125 to i64
  %127 = getelementptr [4 x i8], ptr %4, i64 %126
  %128 = load float, ptr %127, align 4
  %129 = load float, ptr %19, align 4
  %130 = fmul contract float %128, %129
  %131 = add nsw i32 %124, %11
  %132 = sext i32 %131 to i64
  %133 = getelementptr [4 x i8], ptr %2, i64 %132
  %134 = load float, ptr %133, align 4
  %135 = fsub contract float %134, %130
  store float %135, ptr %133, align 4
  %136 = add nuw nsw i32 %.134, 4
  %niter45.next.3 = add i32 %niter45, 4
  %niter45.ncmp.3 = icmp eq i32 %niter45.next.3, %unroll_iter44
  br i1 %niter45.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph35

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph35
  %lcmp.mod42.not = icmp eq i32 %xtraiter40, 0
  br i1 %lcmp.mod42.not, label %.loopexit, label %.lr.ph35.epil.preheader

.lr.ph35.epil.preheader:                          ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph35.preheader
  %.134.epil.init = phi i32 [ 0, %.lr.ph35.preheader ], [ %136, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod43 = icmp ne i32 %xtraiter40, 0
  tail call void @llvm.assume(i1 %lcmp.mod43)
  br label %.lr.ph35.epil

.lr.ph35.epil:                                    ; preds = %.lr.ph35.epil, %.lr.ph35.epil.preheader
  %.134.epil = phi i32 [ %149, %.lr.ph35.epil ], [ %.134.epil.init, %.lr.ph35.epil.preheader ]
  %epil.iter41 = phi i32 [ %epil.iter41.next, %.lr.ph35.epil ], [ 0, %.lr.ph35.epil.preheader ]
  %137 = shl nuw nsw i32 %.134.epil, 11
  %138 = add nsw i32 %137, %5
  %139 = sext i32 %138 to i64
  %140 = getelementptr [4 x i8], ptr %4, i64 %139
  %141 = load float, ptr %140, align 4
  %142 = load float, ptr %19, align 4
  %143 = fmul contract float %141, %142
  %144 = add nsw i32 %137, %11
  %145 = sext i32 %144 to i64
  %146 = getelementptr [4 x i8], ptr %2, i64 %145
  %147 = load float, ptr %146, align 4
  %148 = fsub contract float %147, %143
  store float %148, ptr %146, align 4
  %149 = add nuw nsw i32 %.134.epil, 1
  %epil.iter41.next = add i32 %epil.iter41, 1
  %epil.iter41.cmp.not = icmp eq i32 %epil.iter41.next, %xtraiter40
  br i1 %epil.iter41.cmp.not, label %.loopexit, label %.lr.ph35.epil, !llvm.loop !5

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph35.epil, %15, %6
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z19gramschmidt_kernel3iiPfS_S_i__noalias(i32 noundef %0, i32 noundef %1, ptr noalias nofree noundef captures(none) dereferenceable(16777216) %2, ptr noalias nofree noundef writeonly captures(none) dereferenceable(16777216) %3, ptr noalias nofree noundef readonly captures(none) dereferenceable(16777216) %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %9 = mul i32 %7, %8
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = add i32 %9, %10
  %12 = icmp sgt i32 %11, %5
  %13 = icmp slt i32 %11, %1
  %14 = and i1 %13, %12
  br i1 %14, label %15, label %.loopexit

15:                                               ; preds = %6
  %16 = shl nsw i32 %5, 11
  %17 = add nsw i32 %16, %11
  %18 = sext i32 %17 to i64
  %19 = getelementptr [4 x i8], ptr %3, i64 %18
  store float 0.000000e+00, ptr %19, align 4
  %20 = icmp sgt i32 %0, 0
  br i1 %20, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %15
  %xtraiter = and i32 %0, 3
  %21 = icmp ult i32 %0, 4
  br i1 %21, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %0, 2147483644
  br label %.lr.ph

..preheader_crit_edge.unr-lcssa:                  ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %..preheader_crit_edge, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %..preheader_crit_edge.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %83, %..preheader_crit_edge.unr-lcssa ]
  %.033.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %84, %..preheader_crit_edge.unr-lcssa ]
  %lcmp.mod40 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod40)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %22 = phi float [ %33, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.033.epil = phi i32 [ %34, %.lr.ph.epil ], [ %.033.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %23 = shl nuw nsw i32 %.033.epil, 11
  %24 = add nsw i32 %23, %5
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %4, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = add nsw i32 %23, %11
  %29 = sext i32 %28 to i64
  %30 = getelementptr [4 x i8], ptr %2, i64 %29
  %31 = load float, ptr %30, align 4
  %32 = fmul contract float %27, %31
  %33 = fadd contract float %22, %32
  %34 = add nuw nsw i32 %.033.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %..preheader_crit_edge, label %.lr.ph.epil, !llvm.loop !6

..preheader_crit_edge:                            ; preds = %.lr.ph.epil, %..preheader_crit_edge.unr-lcssa
  %.lcssa = phi float [ %83, %..preheader_crit_edge.unr-lcssa ], [ %33, %.lr.ph.epil ]
  store float %.lcssa, ptr %19, align 4
  %xtraiter41 = and i32 %0, 3
  %35 = icmp ult i32 %0, 4
  br i1 %35, label %.lr.ph35.epil.preheader, label %..preheader_crit_edge.new

..preheader_crit_edge.new:                        ; preds = %..preheader_crit_edge
  %unroll_iter45 = and i32 %0, 2147483644
  br label %.lr.ph35

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %36 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %83, %.lr.ph ]
  %.033 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %84, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.3, %.lr.ph ]
  %37 = shl nuw nsw i32 %.033, 11
  %38 = add nsw i32 %37, %5
  %39 = sext i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr %4, i64 %39
  %41 = load float, ptr %40, align 4
  %42 = add nsw i32 %37, %11
  %43 = sext i32 %42 to i64
  %44 = getelementptr [4 x i8], ptr %2, i64 %43
  %45 = load float, ptr %44, align 4
  %46 = fmul contract float %41, %45
  %47 = fadd contract float %36, %46
  %48 = shl i32 %.033, 11
  %49 = or disjoint i32 %48, 2048
  %50 = add nsw i32 %49, %5
  %51 = sext i32 %50 to i64
  %52 = getelementptr [4 x i8], ptr %4, i64 %51
  %53 = load float, ptr %52, align 4
  %54 = add nsw i32 %49, %11
  %55 = sext i32 %54 to i64
  %56 = getelementptr [4 x i8], ptr %2, i64 %55
  %57 = load float, ptr %56, align 4
  %58 = fmul contract float %53, %57
  %59 = fadd contract float %47, %58
  %60 = shl i32 %.033, 11
  %61 = or disjoint i32 %60, 4096
  %62 = add nsw i32 %61, %5
  %63 = sext i32 %62 to i64
  %64 = getelementptr [4 x i8], ptr %4, i64 %63
  %65 = load float, ptr %64, align 4
  %66 = add nsw i32 %61, %11
  %67 = sext i32 %66 to i64
  %68 = getelementptr [4 x i8], ptr %2, i64 %67
  %69 = load float, ptr %68, align 4
  %70 = fmul contract float %65, %69
  %71 = fadd contract float %59, %70
  %72 = shl i32 %.033, 11
  %73 = or disjoint i32 %72, 6144
  %74 = add nsw i32 %73, %5
  %75 = sext i32 %74 to i64
  %76 = getelementptr [4 x i8], ptr %4, i64 %75
  %77 = load float, ptr %76, align 4
  %78 = add nsw i32 %73, %11
  %79 = sext i32 %78 to i64
  %80 = getelementptr [4 x i8], ptr %2, i64 %79
  %81 = load float, ptr %80, align 4
  %82 = fmul contract float %77, %81
  %83 = fadd contract float %71, %82
  %84 = add nuw nsw i32 %.033, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %..preheader_crit_edge.unr-lcssa, label %.lr.ph

.lr.ph35:                                         ; preds = %.lr.ph35, %..preheader_crit_edge.new
  %.134 = phi i32 [ 0, %..preheader_crit_edge.new ], [ %132, %.lr.ph35 ]
  %niter46 = phi i32 [ 0, %..preheader_crit_edge.new ], [ %niter46.next.3, %.lr.ph35 ]
  %85 = shl nuw nsw i32 %.134, 11
  %86 = add nsw i32 %85, %5
  %87 = sext i32 %86 to i64
  %88 = getelementptr [4 x i8], ptr %4, i64 %87
  %89 = load float, ptr %88, align 4
  %90 = fmul contract float %89, %.lcssa
  %91 = add nsw i32 %85, %11
  %92 = sext i32 %91 to i64
  %93 = getelementptr [4 x i8], ptr %2, i64 %92
  %94 = load float, ptr %93, align 4
  %95 = fsub contract float %94, %90
  store float %95, ptr %93, align 4
  %96 = shl i32 %.134, 11
  %97 = or disjoint i32 %96, 2048
  %98 = add nsw i32 %97, %5
  %99 = sext i32 %98 to i64
  %100 = getelementptr [4 x i8], ptr %4, i64 %99
  %101 = load float, ptr %100, align 4
  %102 = fmul contract float %101, %.lcssa
  %103 = add nsw i32 %97, %11
  %104 = sext i32 %103 to i64
  %105 = getelementptr [4 x i8], ptr %2, i64 %104
  %106 = load float, ptr %105, align 4
  %107 = fsub contract float %106, %102
  store float %107, ptr %105, align 4
  %108 = shl i32 %.134, 11
  %109 = or disjoint i32 %108, 4096
  %110 = add nsw i32 %109, %5
  %111 = sext i32 %110 to i64
  %112 = getelementptr [4 x i8], ptr %4, i64 %111
  %113 = load float, ptr %112, align 4
  %114 = fmul contract float %113, %.lcssa
  %115 = add nsw i32 %109, %11
  %116 = sext i32 %115 to i64
  %117 = getelementptr [4 x i8], ptr %2, i64 %116
  %118 = load float, ptr %117, align 4
  %119 = fsub contract float %118, %114
  store float %119, ptr %117, align 4
  %120 = shl i32 %.134, 11
  %121 = or disjoint i32 %120, 6144
  %122 = add nsw i32 %121, %5
  %123 = sext i32 %122 to i64
  %124 = getelementptr [4 x i8], ptr %4, i64 %123
  %125 = load float, ptr %124, align 4
  %126 = fmul contract float %125, %.lcssa
  %127 = add nsw i32 %121, %11
  %128 = sext i32 %127 to i64
  %129 = getelementptr [4 x i8], ptr %2, i64 %128
  %130 = load float, ptr %129, align 4
  %131 = fsub contract float %130, %126
  store float %131, ptr %129, align 4
  %132 = add nuw nsw i32 %.134, 4
  %niter46.next.3 = add i32 %niter46, 4
  %niter46.ncmp.3 = icmp eq i32 %niter46.next.3, %unroll_iter45
  br i1 %niter46.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph35

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph35
  %lcmp.mod43.not = icmp eq i32 %xtraiter41, 0
  br i1 %lcmp.mod43.not, label %.loopexit, label %.lr.ph35.epil.preheader

.lr.ph35.epil.preheader:                          ; preds = %.loopexit.loopexit.unr-lcssa, %..preheader_crit_edge
  %.134.epil.init = phi i32 [ 0, %..preheader_crit_edge ], [ %132, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod44 = icmp ne i32 %xtraiter41, 0
  tail call void @llvm.assume(i1 %lcmp.mod44)
  br label %.lr.ph35.epil

.lr.ph35.epil:                                    ; preds = %.lr.ph35.epil, %.lr.ph35.epil.preheader
  %.134.epil = phi i32 [ %144, %.lr.ph35.epil ], [ %.134.epil.init, %.lr.ph35.epil.preheader ]
  %epil.iter42 = phi i32 [ %epil.iter42.next, %.lr.ph35.epil ], [ 0, %.lr.ph35.epil.preheader ]
  %133 = shl nuw nsw i32 %.134.epil, 11
  %134 = add nsw i32 %133, %5
  %135 = sext i32 %134 to i64
  %136 = getelementptr [4 x i8], ptr %4, i64 %135
  %137 = load float, ptr %136, align 4
  %138 = fmul contract float %137, %.lcssa
  %139 = add nsw i32 %133, %11
  %140 = sext i32 %139 to i64
  %141 = getelementptr [4 x i8], ptr %2, i64 %140
  %142 = load float, ptr %141, align 4
  %143 = fsub contract float %142, %138
  store float %143, ptr %141, align 4
  %144 = add nuw nsw i32 %.134.epil, 1
  %epil.iter42.next = add i32 %epil.iter42, 1
  %epil.iter42.cmp.not = icmp eq i32 %epil.iter42.next, %xtraiter41
  br i1 %epil.iter42.cmp.not, label %.loopexit, label %.lr.ph35.epil, !llvm.loop !7

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph35.epil, %15, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #4

attributes #0 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="sm_86" "target-features"="+ptx87,+ptx80" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "target-cpu"="sm_86" "target-features"="+ptx87,+ptx80" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) "target-cpu"="sm_86" "target-features"="+ptx80" }
attributes #3 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) "target-cpu"="sm_86" "target-features"="+ptx80" }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !2}
