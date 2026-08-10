; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/2MM/2mm.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/2MM/2mm.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11mm2_kernel1iiiiffPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, float noundef %4, float noundef %5, ptr nofree noundef writeonly captures(none) %6, ptr nofree noundef readonly captures(none) %7, ptr nofree noundef readonly captures(none) %8) local_unnamed_addr #0 {
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %11 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %12 = mul i32 %10, %11
  %13 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %14 = add i32 %12, %13
  %15 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %16 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %17 = mul nuw nsw i32 %15, %16
  %18 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %19 = add nuw nsw i32 %17, %18
  %20 = icmp slt i32 %19, %0
  %21 = icmp slt i32 %14, %1
  %22 = and i1 %20, %21
  br i1 %22, label %23, label %.loopexit

23:                                               ; preds = %9
  %24 = shl nsw i32 %19, 10
  %25 = add nsw i32 %24, %14
  %26 = sext i32 %25 to i64
  %27 = getelementptr [4 x i8], ptr %6, i64 %26
  store float 0.000000e+00, ptr %27, align 4
  %28 = icmp sgt i32 %2, 0
  br i1 %28, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %23
  %xtraiter = and i32 %2, 3
  %29 = icmp ult i32 %2, 4
  br i1 %29, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %2, 2147483644
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %30 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %81, %.lr.ph ]
  %.021 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %82, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.3, %.lr.ph ]
  %31 = add nuw nsw i32 %.021, %24
  %32 = zext nneg i32 %31 to i64
  %33 = getelementptr [4 x i8], ptr %7, i64 %32
  %34 = load float, ptr %33, align 4
  %35 = fmul float %4, %34
  %36 = shl nuw nsw i32 %.021, 10
  %37 = add nsw i32 %36, %14
  %38 = sext i32 %37 to i64
  %39 = getelementptr [4 x i8], ptr %8, i64 %38
  %40 = load float, ptr %39, align 4
  %41 = fmul float %35, %40
  %42 = fadd float %30, %41
  store float %42, ptr %27, align 4
  %43 = or disjoint i32 %.021, 1
  %44 = add nuw nsw i32 %43, %24
  %45 = zext nneg i32 %44 to i64
  %46 = getelementptr [4 x i8], ptr %7, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = fmul float %4, %47
  %49 = shl nuw nsw i32 %43, 10
  %50 = add nsw i32 %49, %14
  %51 = sext i32 %50 to i64
  %52 = getelementptr [4 x i8], ptr %8, i64 %51
  %53 = load float, ptr %52, align 4
  %54 = fmul float %48, %53
  %55 = fadd float %42, %54
  store float %55, ptr %27, align 4
  %56 = or disjoint i32 %.021, 2
  %57 = add nuw nsw i32 %56, %24
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr [4 x i8], ptr %7, i64 %58
  %60 = load float, ptr %59, align 4
  %61 = fmul float %4, %60
  %62 = shl nuw nsw i32 %56, 10
  %63 = add nsw i32 %62, %14
  %64 = sext i32 %63 to i64
  %65 = getelementptr [4 x i8], ptr %8, i64 %64
  %66 = load float, ptr %65, align 4
  %67 = fmul float %61, %66
  %68 = fadd float %55, %67
  store float %68, ptr %27, align 4
  %69 = or disjoint i32 %.021, 3
  %70 = add nuw nsw i32 %69, %24
  %71 = zext nneg i32 %70 to i64
  %72 = getelementptr [4 x i8], ptr %7, i64 %71
  %73 = load float, ptr %72, align 4
  %74 = fmul float %4, %73
  %75 = shl nuw nsw i32 %69, 10
  %76 = add nsw i32 %75, %14
  %77 = sext i32 %76 to i64
  %78 = getelementptr [4 x i8], ptr %8, i64 %77
  %79 = load float, ptr %78, align 4
  %80 = fmul float %74, %79
  %81 = fadd float %68, %80
  store float %81, ptr %27, align 4
  %82 = add nuw nsw i32 %.021, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %81, %.loopexit.loopexit.unr-lcssa ]
  %.021.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %82, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod24 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod24)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %83 = phi float [ %95, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.021.epil = phi i32 [ %96, %.lr.ph.epil ], [ %.021.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %84 = add nuw nsw i32 %.021.epil, %24
  %85 = zext nneg i32 %84 to i64
  %86 = getelementptr [4 x i8], ptr %7, i64 %85
  %87 = load float, ptr %86, align 4
  %88 = fmul float %4, %87
  %89 = shl nuw nsw i32 %.021.epil, 10
  %90 = add nsw i32 %89, %14
  %91 = sext i32 %90 to i64
  %92 = getelementptr [4 x i8], ptr %8, i64 %91
  %93 = load float, ptr %92, align 4
  %94 = fmul float %88, %93
  %95 = fadd float %83, %94
  store float %95, ptr %27, align 4
  %96 = add nuw nsw i32 %.021.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !3

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.epil, %23, %9
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11mm2_kernel2iiiiffPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, float noundef %4, float noundef %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef readonly captures(none) %7, ptr nofree noundef captures(none) %8) local_unnamed_addr #0 {
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %11 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %12 = mul i32 %10, %11
  %13 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %14 = add i32 %12, %13
  %15 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %16 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %17 = mul nuw nsw i32 %15, %16
  %18 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %19 = add nuw nsw i32 %17, %18
  %20 = icmp slt i32 %19, %0
  %21 = icmp slt i32 %14, %3
  %22 = and i1 %20, %21
  br i1 %22, label %23, label %.loopexit

23:                                               ; preds = %9
  %24 = shl nsw i32 %19, 10
  %25 = add nsw i32 %24, %14
  %26 = sext i32 %25 to i64
  %27 = getelementptr [4 x i8], ptr %8, i64 %26
  %28 = load float, ptr %27, align 4
  %29 = fmul float %5, %28
  store float %29, ptr %27, align 4
  %30 = icmp sgt i32 %1, 0
  br i1 %30, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %23
  %xtraiter = and i32 %1, 3
  %31 = icmp ult i32 %1, 4
  br i1 %31, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %1, 2147483644
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %32 = phi float [ %29, %.lr.ph.preheader.new ], [ %79, %.lr.ph ]
  %.021 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %80, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.3, %.lr.ph ]
  %33 = add nuw nsw i32 %.021, %24
  %34 = zext nneg i32 %33 to i64
  %35 = getelementptr [4 x i8], ptr %6, i64 %34
  %36 = load float, ptr %35, align 4
  %37 = shl nuw nsw i32 %.021, 10
  %38 = add nsw i32 %37, %14
  %39 = sext i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr %7, i64 %39
  %41 = load float, ptr %40, align 4
  %42 = fmul float %36, %41
  %43 = fadd float %32, %42
  store float %43, ptr %27, align 4
  %44 = or disjoint i32 %.021, 1
  %45 = add nuw nsw i32 %44, %24
  %46 = zext nneg i32 %45 to i64
  %47 = getelementptr [4 x i8], ptr %6, i64 %46
  %48 = load float, ptr %47, align 4
  %49 = shl nuw nsw i32 %44, 10
  %50 = add nsw i32 %49, %14
  %51 = sext i32 %50 to i64
  %52 = getelementptr [4 x i8], ptr %7, i64 %51
  %53 = load float, ptr %52, align 4
  %54 = fmul float %48, %53
  %55 = fadd float %43, %54
  store float %55, ptr %27, align 4
  %56 = or disjoint i32 %.021, 2
  %57 = add nuw nsw i32 %56, %24
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr [4 x i8], ptr %6, i64 %58
  %60 = load float, ptr %59, align 4
  %61 = shl nuw nsw i32 %56, 10
  %62 = add nsw i32 %61, %14
  %63 = sext i32 %62 to i64
  %64 = getelementptr [4 x i8], ptr %7, i64 %63
  %65 = load float, ptr %64, align 4
  %66 = fmul float %60, %65
  %67 = fadd float %55, %66
  store float %67, ptr %27, align 4
  %68 = or disjoint i32 %.021, 3
  %69 = add nuw nsw i32 %68, %24
  %70 = zext nneg i32 %69 to i64
  %71 = getelementptr [4 x i8], ptr %6, i64 %70
  %72 = load float, ptr %71, align 4
  %73 = shl nuw nsw i32 %68, 10
  %74 = add nsw i32 %73, %14
  %75 = sext i32 %74 to i64
  %76 = getelementptr [4 x i8], ptr %7, i64 %75
  %77 = load float, ptr %76, align 4
  %78 = fmul float %72, %77
  %79 = fadd float %67, %78
  store float %79, ptr %27, align 4
  %80 = add nuw nsw i32 %.021, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ %29, %.lr.ph.preheader ], [ %79, %.loopexit.loopexit.unr-lcssa ]
  %.021.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %80, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod24 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod24)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %81 = phi float [ %92, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.021.epil = phi i32 [ %93, %.lr.ph.epil ], [ %.021.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %82 = add nuw nsw i32 %.021.epil, %24
  %83 = zext nneg i32 %82 to i64
  %84 = getelementptr [4 x i8], ptr %6, i64 %83
  %85 = load float, ptr %84, align 4
  %86 = shl nuw nsw i32 %.021.epil, 10
  %87 = add nsw i32 %86, %14
  %88 = sext i32 %87 to i64
  %89 = getelementptr [4 x i8], ptr %7, i64 %88
  %90 = load float, ptr %89, align 4
  %91 = fmul float %85, %90
  %92 = fadd float %81, %91
  store float %92, ptr %27, align 4
  %93 = add nuw nsw i32 %.021.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !5

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.epil, %23, %9
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
