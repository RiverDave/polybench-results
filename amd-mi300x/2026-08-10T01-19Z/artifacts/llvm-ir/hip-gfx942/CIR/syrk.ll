; ModuleID = '/root/polybenchGpu/HIP/SYRK/syrk.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/SYRK/syrk.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_8d0c3ad4c34e1ff1 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_8d0c3ad4c34e1ff1 to ptr)], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11syrk_kerneliiffPfS_(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef captures(none) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %4 to ptr addrspace(1)
  %8 = addrspacecast ptr %5 to ptr addrspace(1)
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %11 = getelementptr inbounds nuw i8, ptr addrspace(4) %10, i64 12
  %.in.i = load i16, ptr addrspace(4) %11, align 4, !tbaa !10
  %12 = zext i16 %.in.i to i32
  %13 = mul i32 %9, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr inbounds nuw i8, ptr addrspace(4) %10, i64 14
  %.in.i22 = load i16, ptr addrspace(4) %17, align 2, !tbaa !10
  %18 = zext i16 %.in.i22 to i32
  %19 = mul i32 %16, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %21, %0
  %23 = icmp slt i32 %15, %0
  %24 = and i1 %23, %22
  br i1 %24, label %25, label %.loopexit

25:                                               ; preds = %6
  %26 = shl nsw i32 %21, 10
  %27 = add nsw i32 %26, %15
  %28 = sext i32 %27 to i64
  %29 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4
  %31 = fmul float %3, %30
  store float %31, ptr addrspace(1) %29, align 4
  %32 = icmp sgt i32 %1, 0
  br i1 %32, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %25
  %33 = shl nsw i32 %15, 10
  %xtraiter = and i32 %1, 7
  %34 = icmp ult i32 %1, 8
  br i1 %34, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %1, 2147483640
  br label %35

35:                                               ; preds = %35, %.lr.ph.new
  %36 = phi float [ %31, %.lr.ph.new ], [ %131, %35 ]
  %.025 = phi i32 [ 0, %.lr.ph.new ], [ %132, %35 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.7, %35 ]
  %37 = add nsw i32 %.025, %26
  %38 = sext i32 %37 to i64
  %39 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %38
  %40 = load float, ptr addrspace(1) %39, align 4
  %41 = fmul float %2, %40
  %42 = add nsw i32 %.025, %33
  %43 = sext i32 %42 to i64
  %44 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 4
  %46 = fmul float %41, %45
  %47 = fadd float %36, %46
  store float %47, ptr addrspace(1) %29, align 4
  %48 = or disjoint i32 %.025, 1
  %49 = add nsw i32 %48, %26
  %50 = sext i32 %49 to i64
  %51 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %50
  %52 = load float, ptr addrspace(1) %51, align 4
  %53 = fmul float %2, %52
  %54 = add nsw i32 %48, %33
  %55 = sext i32 %54 to i64
  %56 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %55
  %57 = load float, ptr addrspace(1) %56, align 4
  %58 = fmul float %53, %57
  %59 = fadd float %47, %58
  store float %59, ptr addrspace(1) %29, align 4
  %60 = or disjoint i32 %.025, 2
  %61 = add nsw i32 %60, %26
  %62 = sext i32 %61 to i64
  %63 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %62
  %64 = load float, ptr addrspace(1) %63, align 4
  %65 = fmul float %2, %64
  %66 = add nsw i32 %60, %33
  %67 = sext i32 %66 to i64
  %68 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %67
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = fmul float %65, %69
  %71 = fadd float %59, %70
  store float %71, ptr addrspace(1) %29, align 4
  %72 = or disjoint i32 %.025, 3
  %73 = add nsw i32 %72, %26
  %74 = sext i32 %73 to i64
  %75 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %74
  %76 = load float, ptr addrspace(1) %75, align 4
  %77 = fmul float %2, %76
  %78 = add nsw i32 %72, %33
  %79 = sext i32 %78 to i64
  %80 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %79
  %81 = load float, ptr addrspace(1) %80, align 4
  %82 = fmul float %77, %81
  %83 = fadd float %71, %82
  store float %83, ptr addrspace(1) %29, align 4
  %84 = or disjoint i32 %.025, 4
  %85 = add nsw i32 %84, %26
  %86 = sext i32 %85 to i64
  %87 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4
  %89 = fmul float %2, %88
  %90 = add nsw i32 %84, %33
  %91 = sext i32 %90 to i64
  %92 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %91
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = fmul float %89, %93
  %95 = fadd float %83, %94
  store float %95, ptr addrspace(1) %29, align 4
  %96 = or disjoint i32 %.025, 5
  %97 = add nsw i32 %96, %26
  %98 = sext i32 %97 to i64
  %99 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %98
  %100 = load float, ptr addrspace(1) %99, align 4
  %101 = fmul float %2, %100
  %102 = add nsw i32 %96, %33
  %103 = sext i32 %102 to i64
  %104 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %103
  %105 = load float, ptr addrspace(1) %104, align 4
  %106 = fmul float %101, %105
  %107 = fadd float %95, %106
  store float %107, ptr addrspace(1) %29, align 4
  %108 = or disjoint i32 %.025, 6
  %109 = add nsw i32 %108, %26
  %110 = sext i32 %109 to i64
  %111 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %110
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = fmul float %2, %112
  %114 = add nsw i32 %108, %33
  %115 = sext i32 %114 to i64
  %116 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %115
  %117 = load float, ptr addrspace(1) %116, align 4
  %118 = fmul float %113, %117
  %119 = fadd float %107, %118
  store float %119, ptr addrspace(1) %29, align 4
  %120 = or disjoint i32 %.025, 7
  %121 = add nsw i32 %120, %26
  %122 = sext i32 %121 to i64
  %123 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %122
  %124 = load float, ptr addrspace(1) %123, align 4
  %125 = fmul float %2, %124
  %126 = add nsw i32 %120, %33
  %127 = sext i32 %126 to i64
  %128 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %127
  %129 = load float, ptr addrspace(1) %128, align 4
  %130 = fmul float %125, %129
  %131 = fadd float %119, %130
  store float %131, ptr addrspace(1) %29, align 4
  %132 = add nuw nsw i32 %.025, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %35

.loopexit.loopexit.unr-lcssa:                     ; preds = %35
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ %31, %.lr.ph ], [ %131, %.loopexit.loopexit.unr-lcssa ]
  %.025.epil.init = phi i32 [ 0, %.lr.ph ], [ %132, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod28 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod28)
  br label %133

133:                                              ; preds = %133, %.epil.preheader
  %134 = phi float [ %.epil.init, %.epil.preheader ], [ %145, %133 ]
  %.025.epil = phi i32 [ %.025.epil.init, %.epil.preheader ], [ %146, %133 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %133 ]
  %135 = add nsw i32 %.025.epil, %26
  %136 = sext i32 %135 to i64
  %137 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %136
  %138 = load float, ptr addrspace(1) %137, align 4
  %139 = fmul float %2, %138
  %140 = add nsw i32 %.025.epil, %33
  %141 = sext i32 %140 to i64
  %142 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %141
  %143 = load float, ptr addrspace(1) %142, align 4
  %144 = fmul float %139, %143
  %145 = fadd float %134, %144
  store float %145, ptr addrspace(1) %29, align 4
  %146 = add nuw nsw i32 %.025.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %133, !llvm.loop !12

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %133, %25, %6
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
