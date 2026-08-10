; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/ATAX/atax.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/ATAX/atax.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z12atax_kernel1iiPfS_S_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4) local_unnamed_addr #0 {
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %8 = mul i32 %6, %7
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = add i32 %8, %9
  %11 = icmp slt i32 %10, %0
  br i1 %11, label %12, label %.loopexit

12:                                               ; preds = %5
  %13 = sext i32 %10 to i64
  %14 = getelementptr [4 x i8], ptr %4, i64 %13
  store float 0.000000e+00, ptr %14, align 4
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %12
  %16 = shl nsw i32 %10, 12
  %xtraiter = and i32 %1, 3
  %17 = icmp ult i32 %1, 4
  br i1 %17, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %1, 2147483644
  br label %18

18:                                               ; preds = %18, %.lr.ph.new
  %19 = phi float [ 0.000000e+00, %.lr.ph.new ], [ %58, %18 ]
  %.014 = phi i32 [ 0, %.lr.ph.new ], [ %59, %18 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.3, %18 ]
  %20 = add nsw i32 %.014, %16
  %21 = sext i32 %20 to i64
  %22 = getelementptr [4 x i8], ptr %2, i64 %21
  %23 = load float, ptr %22, align 4
  %24 = zext nneg i32 %.014 to i64
  %25 = getelementptr [4 x i8], ptr %3, i64 %24
  %26 = load float, ptr %25, align 4
  %27 = fmul float %23, %26
  %28 = fadd float %19, %27
  store float %28, ptr %14, align 4
  %29 = or disjoint i32 %.014, 1
  %30 = add nsw i32 %29, %16
  %31 = sext i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr %2, i64 %31
  %33 = load float, ptr %32, align 4
  %34 = zext nneg i32 %29 to i64
  %35 = getelementptr [4 x i8], ptr %3, i64 %34
  %36 = load float, ptr %35, align 4
  %37 = fmul float %33, %36
  %38 = fadd float %28, %37
  store float %38, ptr %14, align 4
  %39 = or disjoint i32 %.014, 2
  %40 = add nsw i32 %39, %16
  %41 = sext i32 %40 to i64
  %42 = getelementptr [4 x i8], ptr %2, i64 %41
  %43 = load float, ptr %42, align 4
  %44 = zext nneg i32 %39 to i64
  %45 = getelementptr [4 x i8], ptr %3, i64 %44
  %46 = load float, ptr %45, align 4
  %47 = fmul float %43, %46
  %48 = fadd float %38, %47
  store float %48, ptr %14, align 4
  %49 = or disjoint i32 %.014, 3
  %50 = add nsw i32 %49, %16
  %51 = sext i32 %50 to i64
  %52 = getelementptr [4 x i8], ptr %2, i64 %51
  %53 = load float, ptr %52, align 4
  %54 = zext nneg i32 %49 to i64
  %55 = getelementptr [4 x i8], ptr %3, i64 %54
  %56 = load float, ptr %55, align 4
  %57 = fmul float %53, %56
  %58 = fadd float %48, %57
  store float %58, ptr %14, align 4
  %59 = add nuw nsw i32 %.014, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %18

.loopexit.loopexit.unr-lcssa:                     ; preds = %18
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph ], [ %58, %.loopexit.loopexit.unr-lcssa ]
  %.014.epil.init = phi i32 [ 0, %.lr.ph ], [ %59, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod16 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod16)
  br label %60

60:                                               ; preds = %60, %.epil.preheader
  %61 = phi float [ %.epil.init, %.epil.preheader ], [ %70, %60 ]
  %.014.epil = phi i32 [ %.014.epil.init, %.epil.preheader ], [ %71, %60 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %60 ]
  %62 = add nsw i32 %.014.epil, %16
  %63 = sext i32 %62 to i64
  %64 = getelementptr [4 x i8], ptr %2, i64 %63
  %65 = load float, ptr %64, align 4
  %66 = zext nneg i32 %.014.epil to i64
  %67 = getelementptr [4 x i8], ptr %3, i64 %66
  %68 = load float, ptr %67, align 4
  %69 = fmul float %65, %68
  %70 = fadd float %61, %69
  store float %70, ptr %14, align 4
  %71 = add nuw nsw i32 %.014.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %60, !llvm.loop !3

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %60, %12, %5
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z12atax_kernel2iiPfS_S_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef writeonly captures(none) %3, ptr nofree noundef readonly captures(none) %4) local_unnamed_addr #0 {
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %8 = mul i32 %6, %7
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = add i32 %8, %9
  %11 = icmp slt i32 %10, %1
  br i1 %11, label %12, label %.loopexit

12:                                               ; preds = %5
  %13 = sext i32 %10 to i64
  %14 = getelementptr [4 x i8], ptr %3, i64 %13
  store float 0.000000e+00, ptr %14, align 4
  %15 = icmp sgt i32 %0, 0
  br i1 %15, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %12
  %xtraiter = and i32 %0, 3
  %16 = icmp ult i32 %0, 4
  br i1 %16, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %0, 2147483644
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %17 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %60, %.lr.ph ]
  %.014 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %61, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.3, %.lr.ph ]
  %18 = shl nuw nsw i32 %.014, 12
  %19 = add nsw i32 %18, %10
  %20 = sext i32 %19 to i64
  %21 = getelementptr [4 x i8], ptr %2, i64 %20
  %22 = load float, ptr %21, align 4
  %23 = zext nneg i32 %.014 to i64
  %24 = getelementptr [4 x i8], ptr %4, i64 %23
  %25 = load float, ptr %24, align 4
  %26 = fmul float %22, %25
  %27 = fadd float %17, %26
  store float %27, ptr %14, align 4
  %28 = or disjoint i32 %.014, 1
  %29 = shl nuw nsw i32 %28, 12
  %30 = add nsw i32 %29, %10
  %31 = sext i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr %2, i64 %31
  %33 = load float, ptr %32, align 4
  %34 = zext nneg i32 %28 to i64
  %35 = getelementptr [4 x i8], ptr %4, i64 %34
  %36 = load float, ptr %35, align 4
  %37 = fmul float %33, %36
  %38 = fadd float %27, %37
  store float %38, ptr %14, align 4
  %39 = or disjoint i32 %.014, 2
  %40 = shl nuw nsw i32 %39, 12
  %41 = add nsw i32 %40, %10
  %42 = sext i32 %41 to i64
  %43 = getelementptr [4 x i8], ptr %2, i64 %42
  %44 = load float, ptr %43, align 4
  %45 = zext nneg i32 %39 to i64
  %46 = getelementptr [4 x i8], ptr %4, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = fmul float %44, %47
  %49 = fadd float %38, %48
  store float %49, ptr %14, align 4
  %50 = or disjoint i32 %.014, 3
  %51 = shl nuw nsw i32 %50, 12
  %52 = add nsw i32 %51, %10
  %53 = sext i32 %52 to i64
  %54 = getelementptr [4 x i8], ptr %2, i64 %53
  %55 = load float, ptr %54, align 4
  %56 = zext nneg i32 %50 to i64
  %57 = getelementptr [4 x i8], ptr %4, i64 %56
  %58 = load float, ptr %57, align 4
  %59 = fmul float %55, %58
  %60 = fadd float %49, %59
  store float %60, ptr %14, align 4
  %61 = add nuw nsw i32 %.014, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %60, %.loopexit.loopexit.unr-lcssa ]
  %.014.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %61, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod16 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod16)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %62 = phi float [ %72, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.014.epil = phi i32 [ %73, %.lr.ph.epil ], [ %.014.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %63 = shl nuw nsw i32 %.014.epil, 12
  %64 = add nsw i32 %63, %10
  %65 = sext i32 %64 to i64
  %66 = getelementptr [4 x i8], ptr %2, i64 %65
  %67 = load float, ptr %66, align 4
  %68 = zext nneg i32 %.014.epil to i64
  %69 = getelementptr [4 x i8], ptr %4, i64 %68
  %70 = load float, ptr %69, align 4
  %71 = fmul float %67, %70
  %72 = fadd float %62, %71
  store float %72, ptr %14, align 4
  %73 = add nuw nsw i32 %.014.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !5

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.epil, %12, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

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
