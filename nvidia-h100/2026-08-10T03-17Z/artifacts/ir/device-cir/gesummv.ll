; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/GESUMMV/gesummv.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/GESUMMV/gesummv.cu"
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
  %29 = fmul float %25, %28
  %30 = load float, ptr %18, align 4
  %31 = fadd float %30, %29
  store float %31, ptr %18, align 4
  %32 = getelementptr [4 x i8], ptr %4, i64 %23
  %33 = load float, ptr %32, align 4
  %34 = load float, ptr %27, align 4
  %35 = fmul float %33, %34
  %36 = load float, ptr %19, align 4
  %37 = fadd float %36, %35
  store float %37, ptr %19, align 4
  %38 = or disjoint i32 %.028, 1
  %39 = add nsw i32 %38, %16
  %40 = sext i32 %39 to i64
  %41 = getelementptr [4 x i8], ptr %3, i64 %40
  %42 = load float, ptr %41, align 4
  %43 = zext nneg i32 %38 to i64
  %44 = getelementptr [4 x i8], ptr %6, i64 %43
  %45 = load float, ptr %44, align 4
  %46 = fmul float %42, %45
  %47 = load float, ptr %18, align 4
  %48 = fadd float %47, %46
  store float %48, ptr %18, align 4
  %49 = getelementptr [4 x i8], ptr %4, i64 %40
  %50 = load float, ptr %49, align 4
  %51 = load float, ptr %44, align 4
  %52 = fmul float %50, %51
  %53 = load float, ptr %19, align 4
  %54 = fadd float %53, %52
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
  %63 = fmul float %59, %62
  %64 = load float, ptr %18, align 4
  %65 = fadd float %64, %63
  store float %65, ptr %18, align 4
  %66 = getelementptr [4 x i8], ptr %4, i64 %57
  %67 = load float, ptr %66, align 4
  %68 = load float, ptr %61, align 4
  %69 = fmul float %67, %68
  %70 = load float, ptr %19, align 4
  %71 = fadd float %70, %69
  store float %71, ptr %19, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %.epil.preheader, %._crit_edge.loopexit.unr-lcssa, %.preheader.._crit_edge_crit_edge
  %.pre-phi = phi i64 [ %.phi.trans.insert, %.preheader.._crit_edge_crit_edge ], [ %17, %._crit_edge.loopexit.unr-lcssa ], [ %17, %.epil.preheader ]
  %72 = phi float [ %.pre, %.preheader.._crit_edge_crit_edge ], [ %54, %._crit_edge.loopexit.unr-lcssa ], [ %71, %.epil.preheader ]
  %73 = getelementptr [4 x i8], ptr %5, i64 %.pre-phi
  %74 = load float, ptr %73, align 4
  %75 = fmul float %1, %74
  %76 = getelementptr [4 x i8], ptr %7, i64 %.pre-phi
  %77 = fmul float %2, %72
  %78 = fadd float %75, %77
  store float %78, ptr %76, align 4
  br label %79

79:                                               ; preds = %8, %._crit_edge
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
