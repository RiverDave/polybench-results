; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/MVT/mvt.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/MVT/mvt.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11mvt_kernel1iPfS_S_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #0 {
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %7 = mul i32 %5, %6
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = add i32 %7, %8
  %10 = icmp slt i32 %9, %0
  %11 = icmp sgt i32 %0, 0
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %4
  %12 = shl nsw i32 %9, 12
  %13 = sext i32 %9 to i64
  %14 = getelementptr [4 x i8], ptr %2, i64 %13
  %.promoted = load float, ptr %14, align 4
  %xtraiter = and i32 %0, 3
  %15 = icmp ult i32 %0, 4
  br i1 %15, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %0, 2147483644
  br label %16

16:                                               ; preds = %16, %.lr.ph.new
  %17 = phi float [ %.promoted, %.lr.ph.new ], [ %56, %16 ]
  %.013 = phi i32 [ 0, %.lr.ph.new ], [ %57, %16 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.3, %16 ]
  %18 = add nsw i32 %.013, %12
  %19 = sext i32 %18 to i64
  %20 = getelementptr [4 x i8], ptr %1, i64 %19
  %21 = load float, ptr %20, align 4
  %22 = zext nneg i32 %.013 to i64
  %23 = getelementptr [4 x i8], ptr %3, i64 %22
  %24 = load float, ptr %23, align 4
  %25 = fmul float %21, %24
  %26 = fadd float %17, %25
  store float %26, ptr %14, align 4
  %27 = or disjoint i32 %.013, 1
  %28 = add nsw i32 %27, %12
  %29 = sext i32 %28 to i64
  %30 = getelementptr [4 x i8], ptr %1, i64 %29
  %31 = load float, ptr %30, align 4
  %32 = zext nneg i32 %27 to i64
  %33 = getelementptr [4 x i8], ptr %3, i64 %32
  %34 = load float, ptr %33, align 4
  %35 = fmul float %31, %34
  %36 = fadd float %26, %35
  store float %36, ptr %14, align 4
  %37 = or disjoint i32 %.013, 2
  %38 = add nsw i32 %37, %12
  %39 = sext i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr %1, i64 %39
  %41 = load float, ptr %40, align 4
  %42 = zext nneg i32 %37 to i64
  %43 = getelementptr [4 x i8], ptr %3, i64 %42
  %44 = load float, ptr %43, align 4
  %45 = fmul float %41, %44
  %46 = fadd float %36, %45
  store float %46, ptr %14, align 4
  %47 = or disjoint i32 %.013, 3
  %48 = add nsw i32 %47, %12
  %49 = sext i32 %48 to i64
  %50 = getelementptr [4 x i8], ptr %1, i64 %49
  %51 = load float, ptr %50, align 4
  %52 = zext nneg i32 %47 to i64
  %53 = getelementptr [4 x i8], ptr %3, i64 %52
  %54 = load float, ptr %53, align 4
  %55 = fmul float %51, %54
  %56 = fadd float %46, %55
  store float %56, ptr %14, align 4
  %57 = add nuw nsw i32 %.013, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %16

.loopexit.loopexit.unr-lcssa:                     ; preds = %16
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ %.promoted, %.lr.ph ], [ %56, %.loopexit.loopexit.unr-lcssa ]
  %.013.epil.init = phi i32 [ 0, %.lr.ph ], [ %57, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod15 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod15)
  br label %58

58:                                               ; preds = %58, %.epil.preheader
  %59 = phi float [ %.epil.init, %.epil.preheader ], [ %68, %58 ]
  %.013.epil = phi i32 [ %.013.epil.init, %.epil.preheader ], [ %69, %58 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %58 ]
  %60 = add nsw i32 %.013.epil, %12
  %61 = sext i32 %60 to i64
  %62 = getelementptr [4 x i8], ptr %1, i64 %61
  %63 = load float, ptr %62, align 4
  %64 = zext nneg i32 %.013.epil to i64
  %65 = getelementptr [4 x i8], ptr %3, i64 %64
  %66 = load float, ptr %65, align 4
  %67 = fmul float %63, %66
  %68 = fadd float %59, %67
  store float %68, ptr %14, align 4
  %69 = add nuw nsw i32 %.013.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %58, !llvm.loop !3

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %58, %4
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11mvt_kernel2iPfS_S_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #0 {
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %7 = mul i32 %5, %6
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = add i32 %7, %8
  %10 = icmp slt i32 %9, %0
  %11 = icmp sgt i32 %0, 0
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %4
  %12 = sext i32 %9 to i64
  %13 = getelementptr [4 x i8], ptr %2, i64 %12
  %.promoted = load float, ptr %13, align 4
  %xtraiter = and i32 %0, 3
  %14 = icmp ult i32 %0, 4
  br i1 %14, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %0, 2147483644
  br label %15

15:                                               ; preds = %15, %.lr.ph.new
  %16 = phi float [ %.promoted, %.lr.ph.new ], [ %59, %15 ]
  %.013 = phi i32 [ 0, %.lr.ph.new ], [ %60, %15 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.3, %15 ]
  %17 = shl nuw nsw i32 %.013, 12
  %18 = add nsw i32 %17, %9
  %19 = sext i32 %18 to i64
  %20 = getelementptr [4 x i8], ptr %1, i64 %19
  %21 = load float, ptr %20, align 4
  %22 = zext nneg i32 %.013 to i64
  %23 = getelementptr [4 x i8], ptr %3, i64 %22
  %24 = load float, ptr %23, align 4
  %25 = fmul float %21, %24
  %26 = fadd float %16, %25
  store float %26, ptr %13, align 4
  %27 = or disjoint i32 %.013, 1
  %28 = shl nuw nsw i32 %27, 12
  %29 = add nsw i32 %28, %9
  %30 = sext i32 %29 to i64
  %31 = getelementptr [4 x i8], ptr %1, i64 %30
  %32 = load float, ptr %31, align 4
  %33 = zext nneg i32 %27 to i64
  %34 = getelementptr [4 x i8], ptr %3, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fmul float %32, %35
  %37 = fadd float %26, %36
  store float %37, ptr %13, align 4
  %38 = or disjoint i32 %.013, 2
  %39 = shl nuw nsw i32 %38, 12
  %40 = add nsw i32 %39, %9
  %41 = sext i32 %40 to i64
  %42 = getelementptr [4 x i8], ptr %1, i64 %41
  %43 = load float, ptr %42, align 4
  %44 = zext nneg i32 %38 to i64
  %45 = getelementptr [4 x i8], ptr %3, i64 %44
  %46 = load float, ptr %45, align 4
  %47 = fmul float %43, %46
  %48 = fadd float %37, %47
  store float %48, ptr %13, align 4
  %49 = or disjoint i32 %.013, 3
  %50 = shl nuw nsw i32 %49, 12
  %51 = add nsw i32 %50, %9
  %52 = sext i32 %51 to i64
  %53 = getelementptr [4 x i8], ptr %1, i64 %52
  %54 = load float, ptr %53, align 4
  %55 = zext nneg i32 %49 to i64
  %56 = getelementptr [4 x i8], ptr %3, i64 %55
  %57 = load float, ptr %56, align 4
  %58 = fmul float %54, %57
  %59 = fadd float %48, %58
  store float %59, ptr %13, align 4
  %60 = add nuw nsw i32 %.013, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %15

.loopexit.loopexit.unr-lcssa:                     ; preds = %15
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ %.promoted, %.lr.ph ], [ %59, %.loopexit.loopexit.unr-lcssa ]
  %.013.epil.init = phi i32 [ 0, %.lr.ph ], [ %60, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod15 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod15)
  br label %61

61:                                               ; preds = %61, %.epil.preheader
  %62 = phi float [ %.epil.init, %.epil.preheader ], [ %72, %61 ]
  %.013.epil = phi i32 [ %.013.epil.init, %.epil.preheader ], [ %73, %61 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %61 ]
  %63 = shl nuw nsw i32 %.013.epil, 12
  %64 = add nsw i32 %63, %9
  %65 = sext i32 %64 to i64
  %66 = getelementptr [4 x i8], ptr %1, i64 %65
  %67 = load float, ptr %66, align 4
  %68 = zext nneg i32 %.013.epil to i64
  %69 = getelementptr [4 x i8], ptr %3, i64 %68
  %70 = load float, ptr %69, align 4
  %71 = fmul float %67, %70
  %72 = fadd float %62, %71
  store float %72, ptr %13, align 4
  %73 = add nuw nsw i32 %.013.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %61, !llvm.loop !5

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %61, %4
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
