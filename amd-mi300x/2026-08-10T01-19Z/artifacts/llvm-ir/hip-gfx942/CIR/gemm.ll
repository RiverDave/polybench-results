; ModuleID = '/root/polybenchGpu/HIP/GEMM/gemm.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/GEMM/gemm.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_2e6d79e9e8825e77 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_2e6d79e9e8825e77 to ptr)], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11gemm_kerneliiiffPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, float noundef %3, float noundef %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef captures(none) %7) local_unnamed_addr #0 {
  %9 = addrspacecast ptr %6 to ptr addrspace(1)
  %10 = addrspacecast ptr %5 to ptr addrspace(1)
  %11 = addrspacecast ptr %7 to ptr addrspace(1)
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %14 = getelementptr inbounds nuw i8, ptr addrspace(4) %13, i64 12
  %.in.i = load i16, ptr addrspace(4) %14, align 4, !tbaa !10
  %15 = zext i16 %.in.i to i32
  %16 = mul i32 %12, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr inbounds nuw i8, ptr addrspace(4) %13, i64 14
  %.in.i22 = load i16, ptr addrspace(4) %20, align 2, !tbaa !10
  %21 = zext i16 %.in.i22 to i32
  %22 = mul i32 %19, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %0
  %26 = icmp slt i32 %18, %1
  %27 = and i1 %26, %25
  br i1 %27, label %28, label %.loopexit

28:                                               ; preds = %8
  %29 = shl nsw i32 %24, 9
  %30 = add nsw i32 %29, %18
  %31 = sext i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 4
  %34 = fmul float %4, %33
  store float %34, ptr addrspace(1) %32, align 4
  %35 = icmp sgt i32 %2, 0
  br i1 %35, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %28
  %xtraiter = and i32 %2, 7
  %36 = icmp ult i32 %2, 8
  br i1 %36, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %2, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %37 = phi float [ %34, %.lr.ph.preheader.new ], [ %140, %.lr.ph ]
  %.027 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %141, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %38 = add nsw i32 %.027, %29
  %39 = sext i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %39
  %41 = load float, ptr addrspace(1) %40, align 4
  %42 = fmul float %3, %41
  %43 = shl nuw nsw i32 %.027, 9
  %44 = add nsw i32 %43, %18
  %45 = sext i32 %44 to i64
  %46 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %45
  %47 = load float, ptr addrspace(1) %46, align 4
  %48 = fmul float %42, %47
  %49 = fadd float %37, %48
  store float %49, ptr addrspace(1) %32, align 4
  %50 = or disjoint i32 %.027, 1
  %51 = add nsw i32 %50, %29
  %52 = sext i32 %51 to i64
  %53 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %52
  %54 = load float, ptr addrspace(1) %53, align 4
  %55 = fmul float %3, %54
  %56 = shl nuw nsw i32 %50, 9
  %57 = add nsw i32 %56, %18
  %58 = sext i32 %57 to i64
  %59 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %58
  %60 = load float, ptr addrspace(1) %59, align 4
  %61 = fmul float %55, %60
  %62 = fadd float %49, %61
  store float %62, ptr addrspace(1) %32, align 4
  %63 = or disjoint i32 %.027, 2
  %64 = add nsw i32 %63, %29
  %65 = sext i32 %64 to i64
  %66 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = fmul float %3, %67
  %69 = shl nuw nsw i32 %63, 9
  %70 = add nsw i32 %69, %18
  %71 = sext i32 %70 to i64
  %72 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %71
  %73 = load float, ptr addrspace(1) %72, align 4
  %74 = fmul float %68, %73
  %75 = fadd float %62, %74
  store float %75, ptr addrspace(1) %32, align 4
  %76 = or disjoint i32 %.027, 3
  %77 = add nsw i32 %76, %29
  %78 = sext i32 %77 to i64
  %79 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %78
  %80 = load float, ptr addrspace(1) %79, align 4
  %81 = fmul float %3, %80
  %82 = shl nuw nsw i32 %76, 9
  %83 = add nsw i32 %82, %18
  %84 = sext i32 %83 to i64
  %85 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %84
  %86 = load float, ptr addrspace(1) %85, align 4
  %87 = fmul float %81, %86
  %88 = fadd float %75, %87
  store float %88, ptr addrspace(1) %32, align 4
  %89 = or disjoint i32 %.027, 4
  %90 = add nsw i32 %89, %29
  %91 = sext i32 %90 to i64
  %92 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %91
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = fmul float %3, %93
  %95 = shl nuw nsw i32 %89, 9
  %96 = add nsw i32 %95, %18
  %97 = sext i32 %96 to i64
  %98 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = fmul float %94, %99
  %101 = fadd float %88, %100
  store float %101, ptr addrspace(1) %32, align 4
  %102 = or disjoint i32 %.027, 5
  %103 = add nsw i32 %102, %29
  %104 = sext i32 %103 to i64
  %105 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %104
  %106 = load float, ptr addrspace(1) %105, align 4
  %107 = fmul float %3, %106
  %108 = shl nuw nsw i32 %102, 9
  %109 = add nsw i32 %108, %18
  %110 = sext i32 %109 to i64
  %111 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %110
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = fmul float %107, %112
  %114 = fadd float %101, %113
  store float %114, ptr addrspace(1) %32, align 4
  %115 = or disjoint i32 %.027, 6
  %116 = add nsw i32 %115, %29
  %117 = sext i32 %116 to i64
  %118 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %117
  %119 = load float, ptr addrspace(1) %118, align 4
  %120 = fmul float %3, %119
  %121 = shl nuw nsw i32 %115, 9
  %122 = add nsw i32 %121, %18
  %123 = sext i32 %122 to i64
  %124 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %123
  %125 = load float, ptr addrspace(1) %124, align 4
  %126 = fmul float %120, %125
  %127 = fadd float %114, %126
  store float %127, ptr addrspace(1) %32, align 4
  %128 = or disjoint i32 %.027, 7
  %129 = add nsw i32 %128, %29
  %130 = sext i32 %129 to i64
  %131 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %130
  %132 = load float, ptr addrspace(1) %131, align 4
  %133 = fmul float %3, %132
  %134 = shl nuw nsw i32 %128, 9
  %135 = add nsw i32 %134, %18
  %136 = sext i32 %135 to i64
  %137 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %136
  %138 = load float, ptr addrspace(1) %137, align 4
  %139 = fmul float %133, %138
  %140 = fadd float %127, %139
  store float %140, ptr addrspace(1) %32, align 4
  %141 = add nuw nsw i32 %.027, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ %34, %.lr.ph.preheader ], [ %140, %.loopexit.loopexit.unr-lcssa ]
  %.027.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %141, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod30 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod30)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %142 = phi float [ %154, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.027.epil = phi i32 [ %155, %.lr.ph.epil ], [ %.027.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %143 = add nsw i32 %.027.epil, %29
  %144 = sext i32 %143 to i64
  %145 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %144
  %146 = load float, ptr addrspace(1) %145, align 4
  %147 = fmul float %3, %146
  %148 = shl nuw nsw i32 %.027.epil, 9
  %149 = add nsw i32 %148, %18
  %150 = sext i32 %149 to i64
  %151 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %150
  %152 = load float, ptr addrspace(1) %151, align 4
  %153 = fmul float %147, %152
  %154 = fadd float %142, %153
  store float %154, ptr addrspace(1) %32, align 4
  %155 = add nuw nsw i32 %.027.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !12

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.epil, %28, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
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
