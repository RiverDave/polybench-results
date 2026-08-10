; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/SYRK/syrk.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/SYRK/syrk.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z11syrk_kerneliiffPfS_(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef captures(none) %5) local_unnamed_addr #0 {
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %9 = mul i32 %7, %8
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = add i32 %9, %10
  %12 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %13 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %14 = mul nuw nsw i32 %12, %13
  %15 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %16 = add nuw nsw i32 %14, %15
  %17 = icmp slt i32 %16, %0
  %18 = icmp slt i32 %11, %0
  %19 = and i1 %17, %18
  br i1 %19, label %20, label %.loopexit

20:                                               ; preds = %6
  %21 = shl nsw i32 %16, 10
  %22 = add nsw i32 %21, %11
  %23 = sext i32 %22 to i64
  %24 = getelementptr [4 x i8], ptr %5, i64 %23
  %25 = load float, ptr %24, align 4
  %26 = fmul float %3, %25
  store float %26, ptr %24, align 4
  %27 = icmp sgt i32 %1, 0
  br i1 %27, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %20
  %28 = shl nsw i32 %11, 10
  %xtraiter = and i32 %1, 3
  %29 = icmp ult i32 %1, 4
  br i1 %29, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %1, 2147483644
  br label %30

30:                                               ; preds = %30, %.lr.ph.new
  %31 = phi float [ %26, %.lr.ph.new ], [ %78, %30 ]
  %.022 = phi i32 [ 0, %.lr.ph.new ], [ %79, %30 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.3, %30 ]
  %32 = add nuw nsw i32 %.022, %21
  %33 = zext nneg i32 %32 to i64
  %34 = getelementptr [4 x i8], ptr %4, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fmul float %2, %35
  %37 = add nsw i32 %.022, %28
  %38 = sext i32 %37 to i64
  %39 = getelementptr [4 x i8], ptr %4, i64 %38
  %40 = load float, ptr %39, align 4
  %41 = fmul float %36, %40
  %42 = fadd float %31, %41
  store float %42, ptr %24, align 4
  %43 = or disjoint i32 %.022, 1
  %44 = add nuw nsw i32 %43, %21
  %45 = zext nneg i32 %44 to i64
  %46 = getelementptr [4 x i8], ptr %4, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = fmul float %2, %47
  %49 = add nsw i32 %43, %28
  %50 = sext i32 %49 to i64
  %51 = getelementptr [4 x i8], ptr %4, i64 %50
  %52 = load float, ptr %51, align 4
  %53 = fmul float %48, %52
  %54 = fadd float %42, %53
  store float %54, ptr %24, align 4
  %55 = or disjoint i32 %.022, 2
  %56 = add nuw nsw i32 %55, %21
  %57 = zext nneg i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr %4, i64 %57
  %59 = load float, ptr %58, align 4
  %60 = fmul float %2, %59
  %61 = add nsw i32 %55, %28
  %62 = sext i32 %61 to i64
  %63 = getelementptr [4 x i8], ptr %4, i64 %62
  %64 = load float, ptr %63, align 4
  %65 = fmul float %60, %64
  %66 = fadd float %54, %65
  store float %66, ptr %24, align 4
  %67 = or disjoint i32 %.022, 3
  %68 = add nuw nsw i32 %67, %21
  %69 = zext nneg i32 %68 to i64
  %70 = getelementptr [4 x i8], ptr %4, i64 %69
  %71 = load float, ptr %70, align 4
  %72 = fmul float %2, %71
  %73 = add nsw i32 %67, %28
  %74 = sext i32 %73 to i64
  %75 = getelementptr [4 x i8], ptr %4, i64 %74
  %76 = load float, ptr %75, align 4
  %77 = fmul float %72, %76
  %78 = fadd float %66, %77
  store float %78, ptr %24, align 4
  %79 = add nuw nsw i32 %.022, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %30

.loopexit.loopexit.unr-lcssa:                     ; preds = %30
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ %26, %.lr.ph ], [ %78, %.loopexit.loopexit.unr-lcssa ]
  %.022.epil.init = phi i32 [ 0, %.lr.ph ], [ %79, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod25 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod25)
  br label %80

80:                                               ; preds = %80, %.epil.preheader
  %81 = phi float [ %.epil.init, %.epil.preheader ], [ %92, %80 ]
  %.022.epil = phi i32 [ %.022.epil.init, %.epil.preheader ], [ %93, %80 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %80 ]
  %82 = add nuw nsw i32 %.022.epil, %21
  %83 = zext nneg i32 %82 to i64
  %84 = getelementptr [4 x i8], ptr %4, i64 %83
  %85 = load float, ptr %84, align 4
  %86 = fmul float %2, %85
  %87 = add nsw i32 %.022.epil, %28
  %88 = sext i32 %87 to i64
  %89 = getelementptr [4 x i8], ptr %4, i64 %88
  %90 = load float, ptr %89, align 4
  %91 = fmul float %86, %90
  %92 = fadd float %81, %91
  store float %92, ptr %24, align 4
  %93 = add nuw nsw i32 %.022.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %80, !llvm.loop !3

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %80, %20, %6
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
