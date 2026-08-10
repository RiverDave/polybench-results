; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GEMM/gemm.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GEMM/gemm.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11gemm_kerneliiiffPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, float noundef %3, float noundef %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef captures(none) %7) local_unnamed_addr #0 {
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
  %27 = load float, ptr %26, align 4
  %28 = fmul float %4, %27
  store float %28, ptr %26, align 4
  %29 = icmp sgt i32 %2, 0
  br i1 %29, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %22
  %xtraiter = and i32 %2, 3
  %30 = icmp ult i32 %2, 4
  br i1 %30, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %2, 2147483644
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %31 = phi float [ %28, %.lr.ph.preheader.new ], [ %82, %.lr.ph ]
  %.022 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %83, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.3, %.lr.ph ]
  %32 = add nuw nsw i32 %.022, %23
  %33 = zext nneg i32 %32 to i64
  %34 = getelementptr [4 x i8], ptr %5, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fmul float %3, %35
  %37 = shl nuw nsw i32 %.022, 9
  %38 = add nsw i32 %37, %13
  %39 = sext i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr %6, i64 %39
  %41 = load float, ptr %40, align 4
  %42 = fmul float %36, %41
  %43 = fadd float %31, %42
  store float %43, ptr %26, align 4
  %44 = or disjoint i32 %.022, 1
  %45 = add nuw nsw i32 %44, %23
  %46 = zext nneg i32 %45 to i64
  %47 = getelementptr [4 x i8], ptr %5, i64 %46
  %48 = load float, ptr %47, align 4
  %49 = fmul float %3, %48
  %50 = shl nuw nsw i32 %44, 9
  %51 = add nsw i32 %50, %13
  %52 = sext i32 %51 to i64
  %53 = getelementptr [4 x i8], ptr %6, i64 %52
  %54 = load float, ptr %53, align 4
  %55 = fmul float %49, %54
  %56 = fadd float %43, %55
  store float %56, ptr %26, align 4
  %57 = or disjoint i32 %.022, 2
  %58 = add nuw nsw i32 %57, %23
  %59 = zext nneg i32 %58 to i64
  %60 = getelementptr [4 x i8], ptr %5, i64 %59
  %61 = load float, ptr %60, align 4
  %62 = fmul float %3, %61
  %63 = shl nuw nsw i32 %57, 9
  %64 = add nsw i32 %63, %13
  %65 = sext i32 %64 to i64
  %66 = getelementptr [4 x i8], ptr %6, i64 %65
  %67 = load float, ptr %66, align 4
  %68 = fmul float %62, %67
  %69 = fadd float %56, %68
  store float %69, ptr %26, align 4
  %70 = or disjoint i32 %.022, 3
  %71 = add nuw nsw i32 %70, %23
  %72 = zext nneg i32 %71 to i64
  %73 = getelementptr [4 x i8], ptr %5, i64 %72
  %74 = load float, ptr %73, align 4
  %75 = fmul float %3, %74
  %76 = shl nuw nsw i32 %70, 9
  %77 = add nsw i32 %76, %13
  %78 = sext i32 %77 to i64
  %79 = getelementptr [4 x i8], ptr %6, i64 %78
  %80 = load float, ptr %79, align 4
  %81 = fmul float %75, %80
  %82 = fadd float %69, %81
  store float %82, ptr %26, align 4
  %83 = add nuw nsw i32 %.022, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ %28, %.lr.ph.preheader ], [ %82, %.loopexit.loopexit.unr-lcssa ]
  %.022.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %83, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod25 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod25)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %84 = phi float [ %96, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.022.epil = phi i32 [ %97, %.lr.ph.epil ], [ %.022.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %85 = add nuw nsw i32 %.022.epil, %23
  %86 = zext nneg i32 %85 to i64
  %87 = getelementptr [4 x i8], ptr %5, i64 %86
  %88 = load float, ptr %87, align 4
  %89 = fmul float %3, %88
  %90 = shl nuw nsw i32 %.022.epil, 9
  %91 = add nsw i32 %90, %13
  %92 = sext i32 %91 to i64
  %93 = getelementptr [4 x i8], ptr %6, i64 %92
  %94 = load float, ptr %93, align 4
  %95 = fmul float %89, %94
  %96 = fadd float %84, %95
  store float %96, ptr %26, align 4
  %97 = add nuw nsw i32 %.022.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !3

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
