; ModuleID = '/Users/davidfeliperiveraguerra/dev/polybench-results/ir-compare/gemm_minimal.cpp'
source_filename = "/Users/davidfeliperiveraguerra/dev/polybench-results/ir-compare/gemm_minimal.cpp"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @gemm_kernel(i32 noundef %0, i32 noundef %1, i32 noundef %2, float noundef %3, float noundef %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef captures(none) %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %11 = mul i32 %9, %10
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %16 = mul nuw nsw i32 %14, %15
  %17 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %18 = add nuw nsw i32 %16, %17
  %19 = icmp sge i32 %18, %0
  %20 = icmp sge i32 %13, %1
  %21 = or i1 %19, %20
  br i1 %21, label %common.ret, label %37

common.ret.loopexit.unr-lcssa:                    ; preds = %47
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %common.ret, label %.epil.preheader

.epil.preheader:                                  ; preds = %common.ret.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ %43, %.lr.ph ], [ %99, %common.ret.loopexit.unr-lcssa ]
  %.027.epil.init = phi i32 [ 0, %.lr.ph ], [ %100, %common.ret.loopexit.unr-lcssa ]
  %lcmp.mod31 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod31)
  br label %22

22:                                               ; preds = %22, %.epil.preheader
  %23 = phi float [ %.epil.init, %.epil.preheader ], [ %35, %22 ]
  %.027.epil = phi i32 [ %.027.epil.init, %.epil.preheader ], [ %36, %22 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %22 ]
  %24 = add nuw nsw i32 %.027.epil, %45
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %5, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = fmul float %3, %27
  %29 = mul nsw i32 %.027.epil, %1
  %30 = add nsw i32 %29, %13
  %31 = sext i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr %6, i64 %31
  %33 = load float, ptr %32, align 4
  %34 = fmul float %28, %33
  %35 = fadd float %23, %34
  store float %35, ptr %41, align 4
  %36 = add nuw nsw i32 %.027.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %common.ret, label %22, !llvm.loop !1

common.ret:                                       ; preds = %common.ret.loopexit.unr-lcssa, %22, %37, %8
  ret void

37:                                               ; preds = %8
  %38 = mul nsw i32 %1, %18
  %39 = add nsw i32 %38, %13
  %40 = sext i32 %39 to i64
  %41 = getelementptr [4 x i8], ptr %7, i64 %40
  %42 = load float, ptr %41, align 4
  %43 = fmul float %4, %42
  store float %43, ptr %41, align 4
  %44 = icmp sgt i32 %2, 0
  br i1 %44, label %.lr.ph, label %common.ret

.lr.ph:                                           ; preds = %37
  %45 = mul nuw nsw i32 %2, %18
  %xtraiter = and i32 %2, 3
  %46 = icmp ult i32 %2, 4
  br i1 %46, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %2, 2147483644
  br label %47

47:                                               ; preds = %47, %.lr.ph.new
  %48 = phi float [ %43, %.lr.ph.new ], [ %99, %47 ]
  %.027 = phi i32 [ 0, %.lr.ph.new ], [ %100, %47 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.3, %47 ]
  %49 = add nuw nsw i32 %.027, %45
  %50 = zext nneg i32 %49 to i64
  %51 = getelementptr [4 x i8], ptr %5, i64 %50
  %52 = load float, ptr %51, align 4
  %53 = fmul float %3, %52
  %54 = mul nsw i32 %.027, %1
  %55 = add nsw i32 %54, %13
  %56 = sext i32 %55 to i64
  %57 = getelementptr [4 x i8], ptr %6, i64 %56
  %58 = load float, ptr %57, align 4
  %59 = fmul float %53, %58
  %60 = fadd float %48, %59
  store float %60, ptr %41, align 4
  %61 = or disjoint i32 %.027, 1
  %62 = add nuw nsw i32 %61, %45
  %63 = zext nneg i32 %62 to i64
  %64 = getelementptr [4 x i8], ptr %5, i64 %63
  %65 = load float, ptr %64, align 4
  %66 = fmul float %3, %65
  %67 = mul nsw i32 %61, %1
  %68 = add nsw i32 %67, %13
  %69 = sext i32 %68 to i64
  %70 = getelementptr [4 x i8], ptr %6, i64 %69
  %71 = load float, ptr %70, align 4
  %72 = fmul float %66, %71
  %73 = fadd float %60, %72
  store float %73, ptr %41, align 4
  %74 = or disjoint i32 %.027, 2
  %75 = add nuw nsw i32 %74, %45
  %76 = zext nneg i32 %75 to i64
  %77 = getelementptr [4 x i8], ptr %5, i64 %76
  %78 = load float, ptr %77, align 4
  %79 = fmul float %3, %78
  %80 = mul nsw i32 %74, %1
  %81 = add nsw i32 %80, %13
  %82 = sext i32 %81 to i64
  %83 = getelementptr [4 x i8], ptr %6, i64 %82
  %84 = load float, ptr %83, align 4
  %85 = fmul float %79, %84
  %86 = fadd float %73, %85
  store float %86, ptr %41, align 4
  %87 = or disjoint i32 %.027, 3
  %88 = add nuw nsw i32 %87, %45
  %89 = zext nneg i32 %88 to i64
  %90 = getelementptr [4 x i8], ptr %5, i64 %89
  %91 = load float, ptr %90, align 4
  %92 = fmul float %3, %91
  %93 = mul nsw i32 %87, %1
  %94 = add nsw i32 %93, %13
  %95 = sext i32 %94 to i64
  %96 = getelementptr [4 x i8], ptr %6, i64 %95
  %97 = load float, ptr %96, align 4
  %98 = fmul float %92, %97
  %99 = fadd float %86, %98
  store float %99, ptr %41, align 4
  %100 = add nuw nsw i32 %.027, 4
  %niter.next.3 = add i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %common.ret.loopexit.unr-lcssa, label %47
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+sm_90" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
