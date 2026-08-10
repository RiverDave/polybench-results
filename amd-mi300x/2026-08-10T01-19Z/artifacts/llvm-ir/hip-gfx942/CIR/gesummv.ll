; ModuleID = '/root/polybenchGpu/HIP/GESUMMV/gesummv.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/GESUMMV/gesummv.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_86472ea91bd034e5 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_86472ea91bd034e5 to ptr)], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z14gesummv_kerneliffPfS_S_S_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef captures(none) %7) local_unnamed_addr #0 {
  %9 = addrspacecast ptr %7 to ptr addrspace(1)
  %10 = addrspacecast ptr %6 to ptr addrspace(1)
  %11 = addrspacecast ptr %5 to ptr addrspace(1)
  %12 = addrspacecast ptr %4 to ptr addrspace(1)
  %13 = addrspacecast ptr %3 to ptr addrspace(1)
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %16 = getelementptr inbounds nuw i8, ptr addrspace(4) %15, i64 12
  %17 = load i16, ptr addrspace(4) %16, align 4, !tbaa !10
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %21, %0
  br i1 %22, label %.preheader, label %123

.preheader:                                       ; preds = %8
  %23 = icmp sgt i32 %0, 0
  br i1 %23, label %.lr.ph, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  %.phi.trans.insert = sext i32 %21 to i64
  %.phi.trans.insert37 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %.phi.trans.insert
  %.pre = load float, ptr addrspace(1) %.phi.trans.insert37, align 4
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %24 = shl nsw i32 %21, 12
  %25 = sext i32 %21 to i64
  %26 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %25
  %27 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %25
  %xtraiter = and i32 %0, 3
  %28 = icmp ult i32 %0, 4
  br i1 %28, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %0, 2147483644
  br label %29

29:                                               ; preds = %29, %.lr.ph.new
  %.036 = phi i32 [ 0, %.lr.ph.new ], [ %97, %29 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.3, %29 ]
  %30 = add nsw i32 %.036, %24
  %31 = sext i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr addrspace(1) %13, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 4
  %34 = zext nneg i32 %.036 to i64
  %35 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %34
  %36 = load float, ptr addrspace(1) %35, align 4
  %37 = fmul float %33, %36
  %38 = load float, ptr addrspace(1) %26, align 4
  %39 = fadd float %38, %37
  store float %39, ptr addrspace(1) %26, align 4
  %40 = getelementptr [4 x i8], ptr addrspace(1) %12, i64 %31
  %41 = load float, ptr addrspace(1) %40, align 4
  %42 = load float, ptr addrspace(1) %35, align 4
  %43 = fmul float %41, %42
  %44 = load float, ptr addrspace(1) %27, align 4
  %45 = fadd float %44, %43
  store float %45, ptr addrspace(1) %27, align 4
  %46 = or disjoint i32 %.036, 1
  %47 = add nsw i32 %46, %24
  %48 = sext i32 %47 to i64
  %49 = getelementptr [4 x i8], ptr addrspace(1) %13, i64 %48
  %50 = load float, ptr addrspace(1) %49, align 4
  %51 = zext nneg i32 %46 to i64
  %52 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %51
  %53 = load float, ptr addrspace(1) %52, align 4
  %54 = fmul float %50, %53
  %55 = load float, ptr addrspace(1) %26, align 4
  %56 = fadd float %55, %54
  store float %56, ptr addrspace(1) %26, align 4
  %57 = getelementptr [4 x i8], ptr addrspace(1) %12, i64 %48
  %58 = load float, ptr addrspace(1) %57, align 4
  %59 = load float, ptr addrspace(1) %52, align 4
  %60 = fmul float %58, %59
  %61 = load float, ptr addrspace(1) %27, align 4
  %62 = fadd float %61, %60
  store float %62, ptr addrspace(1) %27, align 4
  %63 = or disjoint i32 %.036, 2
  %64 = add nsw i32 %63, %24
  %65 = sext i32 %64 to i64
  %66 = getelementptr [4 x i8], ptr addrspace(1) %13, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = zext nneg i32 %63 to i64
  %69 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %68
  %70 = load float, ptr addrspace(1) %69, align 4
  %71 = fmul float %67, %70
  %72 = load float, ptr addrspace(1) %26, align 4
  %73 = fadd float %72, %71
  store float %73, ptr addrspace(1) %26, align 4
  %74 = getelementptr [4 x i8], ptr addrspace(1) %12, i64 %65
  %75 = load float, ptr addrspace(1) %74, align 4
  %76 = load float, ptr addrspace(1) %69, align 4
  %77 = fmul float %75, %76
  %78 = load float, ptr addrspace(1) %27, align 4
  %79 = fadd float %78, %77
  store float %79, ptr addrspace(1) %27, align 4
  %80 = or disjoint i32 %.036, 3
  %81 = add nsw i32 %80, %24
  %82 = sext i32 %81 to i64
  %83 = getelementptr [4 x i8], ptr addrspace(1) %13, i64 %82
  %84 = load float, ptr addrspace(1) %83, align 4
  %85 = zext nneg i32 %80 to i64
  %86 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %85
  %87 = load float, ptr addrspace(1) %86, align 4
  %88 = fmul float %84, %87
  %89 = load float, ptr addrspace(1) %26, align 4
  %90 = fadd float %89, %88
  store float %90, ptr addrspace(1) %26, align 4
  %91 = getelementptr [4 x i8], ptr addrspace(1) %12, i64 %82
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = load float, ptr addrspace(1) %86, align 4
  %94 = fmul float %92, %93
  %95 = load float, ptr addrspace(1) %27, align 4
  %96 = fadd float %95, %94
  store float %96, ptr addrspace(1) %27, align 4
  %97 = add nuw nsw i32 %.036, 4
  %niter.next.3 = add nuw nsw i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %._crit_edge.loopexit.unr-lcssa, label %29

._crit_edge.loopexit.unr-lcssa:                   ; preds = %29
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph
  %.036.epil.init = phi i32 [ 0, %.lr.ph ], [ %97, %._crit_edge.loopexit.unr-lcssa ]
  %lcmp.mod40 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod40)
  br label %98

98:                                               ; preds = %98, %.epil.preheader
  %.036.epil = phi i32 [ %.036.epil.init, %.epil.preheader ], [ %115, %98 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %98 ]
  %99 = add nsw i32 %.036.epil, %24
  %100 = sext i32 %99 to i64
  %101 = getelementptr [4 x i8], ptr addrspace(1) %13, i64 %100
  %102 = load float, ptr addrspace(1) %101, align 4
  %103 = zext nneg i32 %.036.epil to i64
  %104 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %103
  %105 = load float, ptr addrspace(1) %104, align 4
  %106 = fmul float %102, %105
  %107 = load float, ptr addrspace(1) %26, align 4
  %108 = fadd float %107, %106
  store float %108, ptr addrspace(1) %26, align 4
  %109 = getelementptr [4 x i8], ptr addrspace(1) %12, i64 %100
  %110 = load float, ptr addrspace(1) %109, align 4
  %111 = load float, ptr addrspace(1) %104, align 4
  %112 = fmul float %110, %111
  %113 = load float, ptr addrspace(1) %27, align 4
  %114 = fadd float %113, %112
  store float %114, ptr addrspace(1) %27, align 4
  %115 = add nuw nsw i32 %.036.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %98, !llvm.loop !12

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %98, %.preheader.._crit_edge_crit_edge
  %.pre-phi = phi i64 [ %.phi.trans.insert, %.preheader.._crit_edge_crit_edge ], [ %25, %98 ], [ %25, %._crit_edge.loopexit.unr-lcssa ]
  %116 = phi float [ %.pre, %.preheader.._crit_edge_crit_edge ], [ %96, %._crit_edge.loopexit.unr-lcssa ], [ %114, %98 ]
  %117 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %.pre-phi
  %118 = load float, ptr addrspace(1) %117, align 4
  %119 = fmul float %1, %118
  %120 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %.pre-phi
  %121 = fmul float %2, %116
  %122 = fadd float %119, %121
  store float %122, ptr addrspace(1) %120, align 4
  br label %123

123:                                              ; preds = %8, %._crit_edge
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!llvm.module.flags = !{!0, !1, !2, !3}
!opencl.ocl.version = !{!4}
!llvm.ident = !{!5}
!llvm.errno.tbaa = !{!6}

!0 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 8, !"PIC Level", i32 0}
!4 = !{i32 2, i32 0}
!5 = !{!"AMD clang version 23.0.0git (https://github.com/ROCm/llvm-project.git 46fcb339fb61119b337f973c7ca9e710a319fdd0+PATCHED:440716f8b87be9d8e20ed910e10e5b6d14d57cf6)"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"short", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
