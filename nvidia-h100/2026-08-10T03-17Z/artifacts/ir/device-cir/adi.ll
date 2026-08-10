; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/ADI/adi.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11adi_kernel1iPfS_S_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef captures(none) %2, ptr nofree noundef captures(none) %3) local_unnamed_addr #0 {
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %7 = mul i32 %5, %6
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = add i32 %7, %8
  %10 = icmp slt i32 %9, %0
  %11 = icmp sgt i32 %0, 1
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.lver.check, label %.loopexit

.lver.check:                                      ; preds = %4
  %12 = shl nsw i32 %9, 10
  %invariant.op = add i32 %12, -1
  %13 = sext i32 %12 to i64
  %14 = shl nsw i64 %13, 2
  %scevgep = getelementptr i8, ptr %3, i64 %14
  %15 = add nsw i32 %0, -2
  %16 = zext i32 %15 to i64
  %17 = add nsw i64 %13, %16
  %18 = shl nsw i64 %17, 2
  %19 = add nsw i64 %18, 8
  %scevgep38 = getelementptr i8, ptr %3, i64 %19
  %scevgep39 = getelementptr i8, ptr %2, i64 %14
  %scevgep40 = getelementptr i8, ptr %2, i64 %19
  %bound0 = icmp ult ptr %scevgep, %scevgep40
  %bound1 = icmp ult ptr %scevgep39, %scevgep38
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  %20 = add nsw i32 %0, -1
  %xtraiter50 = and i32 %20, 1
  %21 = icmp eq i32 %15, 0
  br i1 %21, label %.ph.lver.orig.epil.preheader, label %.ph.lver.orig.preheader.new

.ph.lver.orig.preheader.new:                      ; preds = %.ph.lver.orig.preheader
  %unroll_iter53 = and i32 %20, -2
  %invariant.op59 = add i32 1, %12
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig, %.ph.lver.orig.preheader.new
  %.036.lver.orig = phi i32 [ 1, %.ph.lver.orig.preheader.new ], [ %63, %.ph.lver.orig ]
  %niter54 = phi i32 [ 0, %.ph.lver.orig.preheader.new ], [ %niter54.next.1, %.ph.lver.orig ]
  %22 = add nsw i32 %.036.lver.orig, %12
  %23 = sext i32 %22 to i64
  %24 = getelementptr [4 x i8], ptr %3, i64 %23
  %25 = load float, ptr %24, align 4
  %.reass.lver.orig = add i32 %.036.lver.orig, %invariant.op
  %26 = sext i32 %.reass.lver.orig to i64
  %27 = getelementptr [4 x i8], ptr %3, i64 %26
  %28 = load float, ptr %27, align 4
  %29 = getelementptr [4 x i8], ptr %1, i64 %23
  %30 = load float, ptr %29, align 4
  %31 = fmul float %28, %30
  %32 = getelementptr [4 x i8], ptr %2, i64 %26
  %33 = load float, ptr %32, align 4
  %34 = fdiv float %31, %33
  %35 = fsub float %25, %34
  store float %35, ptr %24, align 4
  %36 = getelementptr [4 x i8], ptr %2, i64 %23
  %37 = load float, ptr %36, align 4
  %38 = load float, ptr %29, align 4
  %39 = fmul float %38, %38
  %40 = load float, ptr %32, align 4
  %41 = fdiv float %39, %40
  %42 = fsub float %37, %41
  store float %42, ptr %36, align 4
  %.reass60 = add i32 %.036.lver.orig, %invariant.op59
  %43 = sext i32 %.reass60 to i64
  %44 = getelementptr [4 x i8], ptr %3, i64 %43
  %45 = load float, ptr %44, align 4
  %.reass.lver.orig.1 = add i32 %.036.lver.orig, %12
  %46 = sext i32 %.reass.lver.orig.1 to i64
  %47 = getelementptr [4 x i8], ptr %3, i64 %46
  %48 = load float, ptr %47, align 4
  %49 = getelementptr [4 x i8], ptr %1, i64 %43
  %50 = load float, ptr %49, align 4
  %51 = fmul float %48, %50
  %52 = getelementptr [4 x i8], ptr %2, i64 %46
  %53 = load float, ptr %52, align 4
  %54 = fdiv float %51, %53
  %55 = fsub float %45, %54
  store float %55, ptr %44, align 4
  %56 = getelementptr [4 x i8], ptr %2, i64 %43
  %57 = load float, ptr %56, align 4
  %58 = load float, ptr %49, align 4
  %59 = fmul float %58, %58
  %60 = load float, ptr %52, align 4
  %61 = fdiv float %59, %60
  %62 = fsub float %57, %61
  store float %62, ptr %56, align 4
  %63 = add nuw nsw i32 %.036.lver.orig, 2
  %niter54.next.1 = add nuw i32 %niter54, 2
  %niter54.ncmp.1 = icmp eq i32 %niter54.next.1, %unroll_iter53
  br i1 %niter54.ncmp.1, label %.loopexit.loopexit.unr-lcssa, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %64 = sext i32 %12 to i64
  %65 = shl nsw i64 %64, 2
  %scevgep42 = getelementptr i8, ptr %3, i64 %65
  %load_initial = load float, ptr %scevgep42, align 4
  %scevgep43 = getelementptr i8, ptr %2, i64 %65
  %load_initial44 = load float, ptr %scevgep43, align 4
  %66 = add nsw i32 %0, -1
  %xtraiter = and i32 %66, 1
  %67 = icmp eq i32 %15, 0
  br i1 %67, label %.epil.preheader, label %.ph.new

.ph.new:                                          ; preds = %.ph
  %unroll_iter = and i32 %66, -2
  %invariant.op58 = add i32 1, %12
  br label %68

68:                                               ; preds = %68, %.ph.new
  %store_forwarded45 = phi float [ %load_initial44, %.ph.new ], [ %97, %68 ]
  %store_forwarded = phi float [ %load_initial, %.ph.new ], [ %91, %68 ]
  %.036 = phi i32 [ 1, %.ph.new ], [ %98, %68 ]
  %niter = phi i32 [ 0, %.ph.new ], [ %niter.next.1, %68 ]
  %69 = add nsw i32 %.036, %12
  %70 = sext i32 %69 to i64
  %71 = getelementptr [4 x i8], ptr %3, i64 %70
  %72 = load float, ptr %71, align 4
  %73 = getelementptr [4 x i8], ptr %1, i64 %70
  %74 = load float, ptr %73, align 4
  %75 = fmul float %store_forwarded, %74
  %76 = fdiv float %75, %store_forwarded45
  %77 = fsub float %72, %76
  store float %77, ptr %71, align 4
  %78 = getelementptr [4 x i8], ptr %2, i64 %70
  %79 = load float, ptr %78, align 4
  %80 = load float, ptr %73, align 4
  %81 = fmul float %80, %80
  %82 = fdiv float %81, %store_forwarded45
  %83 = fsub float %79, %82
  store float %83, ptr %78, align 4
  %.reass = add i32 %.036, %invariant.op58
  %84 = sext i32 %.reass to i64
  %85 = getelementptr [4 x i8], ptr %3, i64 %84
  %86 = load float, ptr %85, align 4
  %87 = getelementptr [4 x i8], ptr %1, i64 %84
  %88 = load float, ptr %87, align 4
  %89 = fmul float %77, %88
  %90 = fdiv float %89, %83
  %91 = fsub float %86, %90
  store float %91, ptr %85, align 4
  %92 = getelementptr [4 x i8], ptr %2, i64 %84
  %93 = load float, ptr %92, align 4
  %94 = load float, ptr %87, align 4
  %95 = fmul float %94, %94
  %96 = fdiv float %95, %83
  %97 = fsub float %93, %96
  store float %97, ptr %92, align 4
  %98 = add nuw nsw i32 %.036, 2
  %niter.next.1 = add nuw i32 %niter, 2
  %niter.ncmp.1 = icmp eq i32 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %.loopexit.loopexit48.unr-lcssa, label %68

.loopexit.loopexit.unr-lcssa:                     ; preds = %.ph.lver.orig
  %lcmp.mod51.not = icmp eq i32 %xtraiter50, 0
  br i1 %lcmp.mod51.not, label %.loopexit, label %.ph.lver.orig.epil.preheader

.ph.lver.orig.epil.preheader:                     ; preds = %.loopexit.loopexit.unr-lcssa, %.ph.lver.orig.preheader
  %.036.lver.orig.epil.init = phi i32 [ 1, %.ph.lver.orig.preheader ], [ %63, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod52 = trunc i32 %20 to i1
  tail call void @llvm.assume(i1 %lcmp.mod52)
  %99 = add nsw i32 %.036.lver.orig.epil.init, %12
  %100 = sext i32 %99 to i64
  %101 = getelementptr [4 x i8], ptr %3, i64 %100
  %102 = load float, ptr %101, align 4
  %.reass.lver.orig.epil = add i32 %.036.lver.orig.epil.init, %invariant.op
  %103 = sext i32 %.reass.lver.orig.epil to i64
  %104 = getelementptr [4 x i8], ptr %3, i64 %103
  %105 = load float, ptr %104, align 4
  %106 = getelementptr [4 x i8], ptr %1, i64 %100
  %107 = load float, ptr %106, align 4
  %108 = fmul float %105, %107
  %109 = getelementptr [4 x i8], ptr %2, i64 %103
  %110 = load float, ptr %109, align 4
  %111 = fdiv float %108, %110
  %112 = fsub float %102, %111
  store float %112, ptr %101, align 4
  %113 = getelementptr [4 x i8], ptr %2, i64 %100
  %114 = load float, ptr %113, align 4
  %115 = load float, ptr %106, align 4
  %116 = fmul float %115, %115
  %117 = load float, ptr %109, align 4
  %118 = fdiv float %116, %117
  %119 = fsub float %114, %118
  store float %119, ptr %113, align 4
  br label %.loopexit

.loopexit.loopexit48.unr-lcssa:                   ; preds = %68
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit48.unr-lcssa, %.ph
  %store_forwarded45.epil.init = phi float [ %load_initial44, %.ph ], [ %97, %.loopexit.loopexit48.unr-lcssa ]
  %store_forwarded.epil.init = phi float [ %load_initial, %.ph ], [ %91, %.loopexit.loopexit48.unr-lcssa ]
  %.036.epil.init = phi i32 [ 1, %.ph ], [ %98, %.loopexit.loopexit48.unr-lcssa ]
  %lcmp.mod49 = trunc i32 %66 to i1
  tail call void @llvm.assume(i1 %lcmp.mod49)
  %120 = add nsw i32 %.036.epil.init, %12
  %121 = sext i32 %120 to i64
  %122 = getelementptr [4 x i8], ptr %3, i64 %121
  %123 = load float, ptr %122, align 4
  %124 = getelementptr [4 x i8], ptr %1, i64 %121
  %125 = load float, ptr %124, align 4
  %126 = fmul float %store_forwarded.epil.init, %125
  %127 = fdiv float %126, %store_forwarded45.epil.init
  %128 = fsub float %123, %127
  store float %128, ptr %122, align 4
  %129 = getelementptr [4 x i8], ptr %2, i64 %121
  %130 = load float, ptr %129, align 4
  %131 = load float, ptr %124, align 4
  %132 = fmul float %131, %131
  %133 = fdiv float %132, %store_forwarded45.epil.init
  %134 = fsub float %130, %133
  store float %134, ptr %129, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %.epil.preheader, %.loopexit.loopexit48.unr-lcssa, %.ph.lver.orig.epil.preheader, %.loopexit.loopexit.unr-lcssa, %4
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11adi_kernel2iPfS_S_(i32 noundef %0, ptr nofree noundef readnone captures(none) %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef captures(none) %3) local_unnamed_addr #1 {
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %7 = mul i32 %5, %6
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = add i32 %7, %8
  %10 = icmp slt i32 %9, %0
  br i1 %10, label %11, label %20

11:                                               ; preds = %4
  %12 = shl nsw i32 %9, 10
  %13 = or disjoint i32 %12, 1023
  %14 = sext i32 %13 to i64
  %15 = getelementptr [4 x i8], ptr %2, i64 %14
  %16 = getelementptr [4 x i8], ptr %3, i64 %14
  %17 = load float, ptr %16, align 4
  %18 = load float, ptr %15, align 4
  %19 = fdiv float %17, %18
  store float %19, ptr %16, align 4
  br label %20

20:                                               ; preds = %4, %11
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11adi_kernel3iPfS_S_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef captures(none) %3) local_unnamed_addr #0 {
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %7 = mul i32 %5, %6
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = add i32 %7, %8
  %10 = icmp slt i32 %9, %0
  %11 = icmp sgt i32 %0, 2
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %4
  %12 = shl nsw i32 %9, 10
  %xtraiter = and i32 %0, 1
  %13 = icmp eq i32 %0, 3
  br i1 %13, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %14 = and i32 %0, 2147483646
  %15 = add nsw i32 %14, -4
  br label %16

16:                                               ; preds = %16, %.lr.ph.new
  %.025 = phi i32 [ 0, %.lr.ph.new ], [ %46, %16 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.1, %16 ]
  %reass.sub = sub i32 %12, %.025
  %17 = add i32 %reass.sub, 1022
  %18 = sext i32 %17 to i64
  %19 = getelementptr [4 x i8], ptr %3, i64 %18
  %20 = load float, ptr %19, align 4
  %21 = add i32 %reass.sub, 1021
  %22 = sext i32 %21 to i64
  %23 = getelementptr [4 x i8], ptr %3, i64 %22
  %24 = load float, ptr %23, align 4
  %25 = getelementptr [4 x i8], ptr %1, i64 %22
  %26 = load float, ptr %25, align 4
  %27 = fmul float %24, %26
  %28 = fsub float %20, %27
  %29 = getelementptr [4 x i8], ptr %2, i64 %22
  %30 = load float, ptr %29, align 4
  %31 = fdiv float %28, %30
  store float %31, ptr %19, align 4
  %.neg = xor i32 %.025, -1
  %reass.sub.1 = add i32 %12, %.neg
  %32 = add i32 %reass.sub.1, 1022
  %33 = sext i32 %32 to i64
  %34 = getelementptr [4 x i8], ptr %3, i64 %33
  %35 = add i32 %reass.sub.1, 1021
  %36 = sext i32 %35 to i64
  %37 = getelementptr [4 x i8], ptr %3, i64 %36
  %38 = load float, ptr %37, align 4
  %39 = getelementptr [4 x i8], ptr %1, i64 %36
  %40 = load float, ptr %39, align 4
  %41 = fmul float %38, %40
  %42 = fsub float %24, %41
  %43 = getelementptr [4 x i8], ptr %2, i64 %36
  %44 = load float, ptr %43, align 4
  %45 = fdiv float %42, %44
  store float %45, ptr %34, align 4
  %46 = add nuw nsw i32 %.025, 2
  %niter.next.1 = add i32 %niter, 2
  %niter.ncmp.1 = icmp eq i32 %niter, %15
  br i1 %niter.ncmp.1, label %.loopexit.loopexit.unr-lcssa, label %16

.loopexit.loopexit.unr-lcssa:                     ; preds = %16
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph
  %.025.epil.init = phi i32 [ 0, %.lr.ph ], [ %46, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod27 = trunc i32 %0 to i1
  tail call void @llvm.assume(i1 %lcmp.mod27)
  %reass.sub.epil = sub i32 %12, %.025.epil.init
  %47 = add i32 %reass.sub.epil, 1022
  %48 = sext i32 %47 to i64
  %49 = getelementptr [4 x i8], ptr %3, i64 %48
  %50 = load float, ptr %49, align 4
  %51 = add i32 %reass.sub.epil, 1021
  %52 = sext i32 %51 to i64
  %53 = getelementptr [4 x i8], ptr %3, i64 %52
  %54 = load float, ptr %53, align 4
  %55 = getelementptr [4 x i8], ptr %1, i64 %52
  %56 = load float, ptr %55, align 4
  %57 = fmul float %54, %56
  %58 = fsub float %50, %57
  %59 = getelementptr [4 x i8], ptr %2, i64 %52
  %60 = load float, ptr %59, align 4
  %61 = fdiv float %58, %60
  store float %61, ptr %49, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %.epil.preheader, %.loopexit.loopexit.unr-lcssa, %4
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11adi_kernel4iPfS_S_i(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef captures(none) %2, ptr nofree noundef captures(none) %3, i32 noundef %4) local_unnamed_addr #1 {
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %8 = mul i32 %6, %7
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = add i32 %8, %9
  %11 = icmp slt i32 %10, %0
  br i1 %11, label %12, label %37

12:                                               ; preds = %5
  %13 = shl nsw i32 %4, 10
  %14 = add nsw i32 %13, %10
  %15 = sext i32 %14 to i64
  %16 = getelementptr [4 x i8], ptr %3, i64 %15
  %17 = load float, ptr %16, align 4
  %18 = add i32 %13, -1024
  %19 = add nsw i32 %18, %10
  %20 = sext i32 %19 to i64
  %21 = getelementptr [4 x i8], ptr %3, i64 %20
  %22 = load float, ptr %21, align 4
  %23 = getelementptr [4 x i8], ptr %1, i64 %15
  %24 = load float, ptr %23, align 4
  %25 = fmul float %22, %24
  %26 = getelementptr [4 x i8], ptr %2, i64 %20
  %27 = load float, ptr %26, align 4
  %28 = fdiv float %25, %27
  %29 = fsub float %17, %28
  store float %29, ptr %16, align 4
  %30 = getelementptr [4 x i8], ptr %2, i64 %15
  %31 = load float, ptr %30, align 4
  %32 = load float, ptr %23, align 4
  %33 = fmul float %32, %32
  %34 = load float, ptr %26, align 4
  %35 = fdiv float %33, %34
  %36 = fsub float %31, %35
  store float %36, ptr %30, align 4
  br label %37

37:                                               ; preds = %5, %12
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11adi_kernel5iPfS_S_(i32 noundef %0, ptr nofree noundef readnone captures(none) %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef captures(none) %3) local_unnamed_addr #1 {
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %7 = mul i32 %5, %6
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = add i32 %7, %8
  %10 = icmp slt i32 %9, %0
  br i1 %10, label %11, label %19

11:                                               ; preds = %4
  %12 = add nsw i32 %9, 1047552
  %13 = sext i32 %12 to i64
  %14 = getelementptr [4 x i8], ptr %2, i64 %13
  %15 = getelementptr [4 x i8], ptr %3, i64 %13
  %16 = load float, ptr %15, align 4
  %17 = load float, ptr %14, align 4
  %18 = fdiv float %16, %17
  store float %18, ptr %15, align 4
  br label %19

19:                                               ; preds = %4, %11
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11adi_kernel6iPfS_S_i(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef captures(none) %3, i32 noundef %4) local_unnamed_addr #1 {
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %8 = mul i32 %6, %7
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = add i32 %8, %9
  %11 = icmp slt i32 %10, %0
  br i1 %11, label %12, label %29

12:                                               ; preds = %5
  %13 = shl i32 %4, 10
  %reass.sub = sub i32 %10, %13
  %14 = add i32 %reass.sub, 1046528
  %15 = sext i32 %14 to i64
  %16 = getelementptr [4 x i8], ptr %3, i64 %15
  %17 = load float, ptr %16, align 4
  %18 = add i32 %reass.sub, 1045504
  %19 = sext i32 %18 to i64
  %20 = getelementptr [4 x i8], ptr %3, i64 %19
  %21 = load float, ptr %20, align 4
  %22 = getelementptr [4 x i8], ptr %1, i64 %19
  %23 = load float, ptr %22, align 4
  %24 = fmul float %21, %23
  %25 = fsub float %17, %24
  %26 = getelementptr [4 x i8], ptr %2, i64 %15
  %27 = load float, ptr %26, align 4
  %28 = fdiv float %25, %27
  store float %28, ptr %16, align 4
  br label %29

29:                                               ; preds = %5, %12
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

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
