; ModuleID = '/home/ubuntu/aa-deref-20261004/runs/GESUMMV/A/raw.device.ll'
source_filename = "device_cuda_nvptx64_nvidia_cuda__sm_86"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z14gesummv_kerneliffPfS_S_S_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef captures(none) %7) local_unnamed_addr #0 {
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %11 = mul i32 %9, %10
  %12 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %.preheader, label %79

.preheader:                                       ; preds = %8
  %15 = icmp sgt i32 %0, 0
  br i1 %15, label %.lr.ph, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  %.phi.trans.insert = sext i32 %13 to i64
  %.phi.trans.insert29 = getelementptr [4 x i8], ptr %7, i64 %.phi.trans.insert
  %.pre = load float, ptr %.phi.trans.insert29, align 4
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %16 = shl nsw i32 %13, 12
  %17 = sext i32 %13 to i64
  %18 = getelementptr [4 x i8], ptr %5, i64 %17
  %19 = getelementptr [4 x i8], ptr %7, i64 %17
  %xtraiter = and i32 %0, 1
  %20 = icmp eq i32 %0, 1
  br i1 %20, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %0, 2147483646
  br label %21

21:                                               ; preds = %21, %.lr.ph.new
  %.028 = phi i32 [ 0, %.lr.ph.new ], [ %55, %21 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.1, %21 ]
  %22 = add nsw i32 %.028, %16
  %23 = sext i32 %22 to i64
  %24 = getelementptr [4 x i8], ptr %3, i64 %23
  %25 = load float, ptr %24, align 4
  %26 = zext nneg i32 %.028 to i64
  %27 = getelementptr [4 x i8], ptr %6, i64 %26
  %28 = load float, ptr %27, align 4
  %29 = fmul contract float %25, %28
  %30 = load float, ptr %18, align 4
  %31 = fadd contract float %30, %29
  store float %31, ptr %18, align 4
  %32 = getelementptr [4 x i8], ptr %4, i64 %23
  %33 = load float, ptr %32, align 4
  %34 = load float, ptr %27, align 4
  %35 = fmul contract float %33, %34
  %36 = load float, ptr %19, align 4
  %37 = fadd contract float %36, %35
  store float %37, ptr %19, align 4
  %38 = or disjoint i32 %.028, 1
  %39 = add nsw i32 %38, %16
  %40 = sext i32 %39 to i64
  %41 = getelementptr [4 x i8], ptr %3, i64 %40
  %42 = load float, ptr %41, align 4
  %43 = zext nneg i32 %38 to i64
  %44 = getelementptr [4 x i8], ptr %6, i64 %43
  %45 = load float, ptr %44, align 4
  %46 = fmul contract float %42, %45
  %47 = load float, ptr %18, align 4
  %48 = fadd contract float %47, %46
  store float %48, ptr %18, align 4
  %49 = getelementptr [4 x i8], ptr %4, i64 %40
  %50 = load float, ptr %49, align 4
  %51 = load float, ptr %44, align 4
  %52 = fmul contract float %50, %51
  %53 = load float, ptr %19, align 4
  %54 = fadd contract float %53, %52
  store float %54, ptr %19, align 4
  %55 = add nuw nsw i32 %.028, 2
  %niter.next.1 = add nuw nsw i32 %niter, 2
  %niter.ncmp.1 = icmp eq i32 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %._crit_edge.loopexit.unr-lcssa, label %21

._crit_edge.loopexit.unr-lcssa:                   ; preds = %21
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph
  %.028.epil.init = phi i32 [ 0, %.lr.ph ], [ %55, %._crit_edge.loopexit.unr-lcssa ]
  %lcmp.mod32 = trunc i32 %0 to i1
  tail call void @llvm.assume(i1 %lcmp.mod32)
  %56 = add nsw i32 %.028.epil.init, %16
  %57 = sext i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr %3, i64 %57
  %59 = load float, ptr %58, align 4
  %60 = zext nneg i32 %.028.epil.init to i64
  %61 = getelementptr [4 x i8], ptr %6, i64 %60
  %62 = load float, ptr %61, align 4
  %63 = fmul contract float %59, %62
  %64 = load float, ptr %18, align 4
  %65 = fadd contract float %64, %63
  store float %65, ptr %18, align 4
  %66 = getelementptr [4 x i8], ptr %4, i64 %57
  %67 = load float, ptr %66, align 4
  %68 = load float, ptr %61, align 4
  %69 = fmul contract float %67, %68
  %70 = load float, ptr %19, align 4
  %71 = fadd contract float %70, %69
  store float %71, ptr %19, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %.epil.preheader, %._crit_edge.loopexit.unr-lcssa, %.preheader.._crit_edge_crit_edge
  %.pre-phi = phi i64 [ %.phi.trans.insert, %.preheader.._crit_edge_crit_edge ], [ %17, %._crit_edge.loopexit.unr-lcssa ], [ %17, %.epil.preheader ]
  %72 = phi float [ %.pre, %.preheader.._crit_edge_crit_edge ], [ %54, %._crit_edge.loopexit.unr-lcssa ], [ %71, %.epil.preheader ]
  %73 = getelementptr [4 x i8], ptr %5, i64 %.pre-phi
  %74 = load float, ptr %73, align 4
  %75 = fmul contract float %1, %74
  %76 = getelementptr [4 x i8], ptr %7, i64 %.pre-phi
  %77 = fmul contract float %2, %72
  %78 = fadd contract float %75, %77
  store float %78, ptr %76, align 4
  br label %79

79:                                               ; preds = %._crit_edge, %8
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z14gesummv_kerneliffPfS_S_S_S___noalias(i32 noundef %0, float noundef %1, float noundef %2, ptr noalias nofree noundef readonly captures(none) %3, ptr noalias nofree noundef readonly captures(none) %4, ptr noalias nofree noundef captures(none) %5, ptr noalias nofree noundef readonly captures(none) %6, ptr noalias nofree noundef captures(none) %7) local_unnamed_addr #0 {
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %11 = mul i32 %9, %10
  %12 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %.preheader, label %104

.preheader:                                       ; preds = %8
  %15 = icmp sgt i32 %0, 0
  br i1 %15, label %.lr.ph, label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader
  %.phi.trans.insert = sext i32 %13 to i64
  %.phi.trans.insert32 = getelementptr [4 x i8], ptr %5, i64 %.phi.trans.insert
  %.pre = load float, ptr %.phi.trans.insert32, align 4
  %.phi.trans.insert34 = getelementptr [4 x i8], ptr %7, i64 %.phi.trans.insert
  %.pre35 = load float, ptr %.phi.trans.insert34, align 4
  br label %97

.lr.ph:                                           ; preds = %.preheader
  %16 = shl nsw i32 %13, 12
  %17 = sext i32 %13 to i64
  %18 = getelementptr [4 x i8], ptr %5, i64 %17
  %19 = getelementptr [4 x i8], ptr %7, i64 %17
  %.promoted = load float, ptr %18, align 4
  %.promoted29 = load float, ptr %19, align 4
  %xtraiter = and i32 %0, 3
  %20 = icmp ult i32 %0, 4
  br i1 %20, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %0, 2147483644
  br label %21

21:                                               ; preds = %21, %.lr.ph.new
  %22 = phi float [ %.promoted29, %.lr.ph.new ], [ %78, %21 ]
  %23 = phi float [ %.promoted, %.lr.ph.new ], [ %74, %21 ]
  %.028 = phi i32 [ 0, %.lr.ph.new ], [ %79, %21 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.3, %21 ]
  %24 = add nsw i32 %.028, %16
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %3, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = zext nneg i32 %.028 to i64
  %29 = getelementptr [4 x i8], ptr %6, i64 %28
  %30 = load float, ptr %29, align 4
  %31 = fmul contract float %27, %30
  %32 = fadd contract float %23, %31
  %33 = getelementptr [4 x i8], ptr %4, i64 %25
  %34 = load float, ptr %33, align 4
  %35 = fmul contract float %30, %34
  %36 = fadd contract float %22, %35
  %37 = or disjoint i32 %.028, 1
  %38 = add nsw i32 %37, %16
  %39 = sext i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr %3, i64 %39
  %41 = load float, ptr %40, align 4
  %42 = zext nneg i32 %37 to i64
  %43 = getelementptr [4 x i8], ptr %6, i64 %42
  %44 = load float, ptr %43, align 4
  %45 = fmul contract float %41, %44
  %46 = fadd contract float %32, %45
  %47 = getelementptr [4 x i8], ptr %4, i64 %39
  %48 = load float, ptr %47, align 4
  %49 = fmul contract float %44, %48
  %50 = fadd contract float %36, %49
  %51 = or disjoint i32 %.028, 2
  %52 = add nsw i32 %51, %16
  %53 = sext i32 %52 to i64
  %54 = getelementptr [4 x i8], ptr %3, i64 %53
  %55 = load float, ptr %54, align 4
  %56 = zext nneg i32 %51 to i64
  %57 = getelementptr [4 x i8], ptr %6, i64 %56
  %58 = load float, ptr %57, align 4
  %59 = fmul contract float %55, %58
  %60 = fadd contract float %46, %59
  %61 = getelementptr [4 x i8], ptr %4, i64 %53
  %62 = load float, ptr %61, align 4
  %63 = fmul contract float %58, %62
  %64 = fadd contract float %50, %63
  %65 = or disjoint i32 %.028, 3
  %66 = add nsw i32 %65, %16
  %67 = sext i32 %66 to i64
  %68 = getelementptr [4 x i8], ptr %3, i64 %67
  %69 = load float, ptr %68, align 4
  %70 = zext nneg i32 %65 to i64
  %71 = getelementptr [4 x i8], ptr %6, i64 %70
  %72 = load float, ptr %71, align 4
  %73 = fmul contract float %69, %72
  %74 = fadd contract float %60, %73
  %75 = getelementptr [4 x i8], ptr %4, i64 %67
  %76 = load float, ptr %75, align 4
  %77 = fmul contract float %72, %76
  %78 = fadd contract float %64, %77
  %79 = add nuw nsw i32 %.028, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %._crit_edge.unr-lcssa, label %21

._crit_edge.unr-lcssa:                            ; preds = %21
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ %.promoted29, %.lr.ph ], [ %78, %._crit_edge.unr-lcssa ]
  %.epil.init41 = phi float [ %.promoted, %.lr.ph ], [ %74, %._crit_edge.unr-lcssa ]
  %.028.epil.init = phi i32 [ 0, %.lr.ph ], [ %79, %._crit_edge.unr-lcssa ]
  %lcmp.mod44 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod44)
  br label %80

80:                                               ; preds = %80, %.epil.preheader
  %81 = phi float [ %.epil.init, %.epil.preheader ], [ %95, %80 ]
  %82 = phi float [ %.epil.init41, %.epil.preheader ], [ %91, %80 ]
  %.028.epil = phi i32 [ %.028.epil.init, %.epil.preheader ], [ %96, %80 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %80 ]
  %83 = add nsw i32 %.028.epil, %16
  %84 = sext i32 %83 to i64
  %85 = getelementptr [4 x i8], ptr %3, i64 %84
  %86 = load float, ptr %85, align 4
  %87 = zext nneg i32 %.028.epil to i64
  %88 = getelementptr [4 x i8], ptr %6, i64 %87
  %89 = load float, ptr %88, align 4
  %90 = fmul contract float %86, %89
  %91 = fadd contract float %82, %90
  %92 = getelementptr [4 x i8], ptr %4, i64 %84
  %93 = load float, ptr %92, align 4
  %94 = fmul contract float %89, %93
  %95 = fadd contract float %81, %94
  %96 = add nuw nsw i32 %.028.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %80, !llvm.loop !1

._crit_edge:                                      ; preds = %80, %._crit_edge.unr-lcssa
  %.lcssa39 = phi float [ %74, %._crit_edge.unr-lcssa ], [ %91, %80 ]
  %.lcssa = phi float [ %78, %._crit_edge.unr-lcssa ], [ %95, %80 ]
  store float %.lcssa39, ptr %18, align 4
  store float %.lcssa, ptr %19, align 4
  br label %97

97:                                               ; preds = %.preheader._crit_edge, %._crit_edge
  %98 = phi float [ %.pre35, %.preheader._crit_edge ], [ %.lcssa, %._crit_edge ]
  %.pre-phi = phi i64 [ %.phi.trans.insert, %.preheader._crit_edge ], [ %17, %._crit_edge ]
  %99 = phi float [ %.pre, %.preheader._crit_edge ], [ %.lcssa39, %._crit_edge ]
  %100 = fmul contract float %1, %99
  %101 = getelementptr [4 x i8], ptr %7, i64 %.pre-phi
  %102 = fmul contract float %2, %98
  %103 = fadd contract float %100, %102
  store float %103, ptr %101, align 4
  br label %104

104:                                              ; preds = %97, %8
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

attributes #0 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="sm_86" "target-features"="+ptx87,+ptx80" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) "target-cpu"="sm_86" "target-features"="+ptx80" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
