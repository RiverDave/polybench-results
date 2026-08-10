; ModuleID = '/root/polybenchGpu/HIP/MVT/mvt.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/MVT/mvt.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_1f7eec72a6fe93a0 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_1f7eec72a6fe93a0 to ptr)], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11mvt_kernel1iPfS_S_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #0 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %10 = getelementptr inbounds nuw i8, ptr addrspace(4) %9, i64 12
  %11 = load i16, ptr addrspace(4) %10, align 4, !tbaa !10
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %0
  %17 = icmp sgt i32 %0, 0
  %or.cond = and i1 %16, %17
  br i1 %or.cond, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %4
  %18 = shl nsw i32 %15, 12
  %19 = sext i32 %15 to i64
  %20 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %19
  %.promoted = load float, ptr addrspace(1) %20, align 4
  %xtraiter = and i32 %0, 7
  %21 = icmp ult i32 %0, 8
  br i1 %21, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %0, 2147483640
  br label %22

22:                                               ; preds = %22, %.lr.ph.new
  %23 = phi float [ %.promoted, %.lr.ph.new ], [ %102, %22 ]
  %.017 = phi i32 [ 0, %.lr.ph.new ], [ %103, %22 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.7, %22 ]
  %24 = add nsw i32 %.017, %18
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4
  %28 = zext nneg i32 %.017 to i64
  %29 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4
  %31 = fmul float %27, %30
  %32 = fadd float %23, %31
  store float %32, ptr addrspace(1) %20, align 4
  %33 = or disjoint i32 %.017, 1
  %34 = add nsw i32 %33, %18
  %35 = sext i32 %34 to i64
  %36 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %35
  %37 = load float, ptr addrspace(1) %36, align 4
  %38 = zext nneg i32 %33 to i64
  %39 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %38
  %40 = load float, ptr addrspace(1) %39, align 4
  %41 = fmul float %37, %40
  %42 = fadd float %32, %41
  store float %42, ptr addrspace(1) %20, align 4
  %43 = or disjoint i32 %.017, 2
  %44 = add nsw i32 %43, %18
  %45 = sext i32 %44 to i64
  %46 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %45
  %47 = load float, ptr addrspace(1) %46, align 4
  %48 = zext nneg i32 %43 to i64
  %49 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %48
  %50 = load float, ptr addrspace(1) %49, align 4
  %51 = fmul float %47, %50
  %52 = fadd float %42, %51
  store float %52, ptr addrspace(1) %20, align 4
  %53 = or disjoint i32 %.017, 3
  %54 = add nsw i32 %53, %18
  %55 = sext i32 %54 to i64
  %56 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %55
  %57 = load float, ptr addrspace(1) %56, align 4
  %58 = zext nneg i32 %53 to i64
  %59 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %58
  %60 = load float, ptr addrspace(1) %59, align 4
  %61 = fmul float %57, %60
  %62 = fadd float %52, %61
  store float %62, ptr addrspace(1) %20, align 4
  %63 = or disjoint i32 %.017, 4
  %64 = add nsw i32 %63, %18
  %65 = sext i32 %64 to i64
  %66 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = zext nneg i32 %63 to i64
  %69 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %68
  %70 = load float, ptr addrspace(1) %69, align 4
  %71 = fmul float %67, %70
  %72 = fadd float %62, %71
  store float %72, ptr addrspace(1) %20, align 4
  %73 = or disjoint i32 %.017, 5
  %74 = add nsw i32 %73, %18
  %75 = sext i32 %74 to i64
  %76 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %75
  %77 = load float, ptr addrspace(1) %76, align 4
  %78 = zext nneg i32 %73 to i64
  %79 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %78
  %80 = load float, ptr addrspace(1) %79, align 4
  %81 = fmul float %77, %80
  %82 = fadd float %72, %81
  store float %82, ptr addrspace(1) %20, align 4
  %83 = or disjoint i32 %.017, 6
  %84 = add nsw i32 %83, %18
  %85 = sext i32 %84 to i64
  %86 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %85
  %87 = load float, ptr addrspace(1) %86, align 4
  %88 = zext nneg i32 %83 to i64
  %89 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %88
  %90 = load float, ptr addrspace(1) %89, align 4
  %91 = fmul float %87, %90
  %92 = fadd float %82, %91
  store float %92, ptr addrspace(1) %20, align 4
  %93 = or disjoint i32 %.017, 7
  %94 = add nsw i32 %93, %18
  %95 = sext i32 %94 to i64
  %96 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %95
  %97 = load float, ptr addrspace(1) %96, align 4
  %98 = zext nneg i32 %93 to i64
  %99 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %98
  %100 = load float, ptr addrspace(1) %99, align 4
  %101 = fmul float %97, %100
  %102 = fadd float %92, %101
  store float %102, ptr addrspace(1) %20, align 4
  %103 = add nuw nsw i32 %.017, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %22

.loopexit.loopexit.unr-lcssa:                     ; preds = %22
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ %.promoted, %.lr.ph ], [ %102, %.loopexit.loopexit.unr-lcssa ]
  %.017.epil.init = phi i32 [ 0, %.lr.ph ], [ %103, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod19 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod19)
  br label %104

104:                                              ; preds = %104, %.epil.preheader
  %105 = phi float [ %.epil.init, %.epil.preheader ], [ %114, %104 ]
  %.017.epil = phi i32 [ %.017.epil.init, %.epil.preheader ], [ %115, %104 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %104 ]
  %106 = add nsw i32 %.017.epil, %18
  %107 = sext i32 %106 to i64
  %108 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %107
  %109 = load float, ptr addrspace(1) %108, align 4
  %110 = zext nneg i32 %.017.epil to i64
  %111 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %110
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = fmul float %109, %112
  %114 = fadd float %105, %113
  store float %114, ptr addrspace(1) %20, align 4
  %115 = add nuw nsw i32 %.017.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %104, !llvm.loop !12

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %104, %4
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11mvt_kernel2iPfS_S_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #0 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %10 = getelementptr inbounds nuw i8, ptr addrspace(4) %9, i64 12
  %11 = load i16, ptr addrspace(4) %10, align 4, !tbaa !10
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %0
  %17 = icmp sgt i32 %0, 0
  %or.cond = and i1 %16, %17
  br i1 %or.cond, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %4
  %18 = sext i32 %15 to i64
  %19 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %18
  %.promoted = load float, ptr addrspace(1) %19, align 4
  %xtraiter = and i32 %0, 7
  %20 = icmp ult i32 %0, 8
  br i1 %20, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %0, 2147483640
  br label %21

21:                                               ; preds = %21, %.lr.ph.new
  %22 = phi float [ %.promoted, %.lr.ph.new ], [ %109, %21 ]
  %.017 = phi i32 [ 0, %.lr.ph.new ], [ %110, %21 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.7, %21 ]
  %23 = shl nuw nsw i32 %.017, 12
  %24 = add nsw i32 %23, %15
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4
  %28 = zext nneg i32 %.017 to i64
  %29 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4
  %31 = fmul float %27, %30
  %32 = fadd float %22, %31
  store float %32, ptr addrspace(1) %19, align 4
  %33 = or disjoint i32 %.017, 1
  %34 = shl nuw nsw i32 %33, 12
  %35 = add nsw i32 %34, %15
  %36 = sext i32 %35 to i64
  %37 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %36
  %38 = load float, ptr addrspace(1) %37, align 4
  %39 = zext nneg i32 %33 to i64
  %40 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %39
  %41 = load float, ptr addrspace(1) %40, align 4
  %42 = fmul float %38, %41
  %43 = fadd float %32, %42
  store float %43, ptr addrspace(1) %19, align 4
  %44 = or disjoint i32 %.017, 2
  %45 = shl nuw nsw i32 %44, 12
  %46 = add nsw i32 %45, %15
  %47 = sext i32 %46 to i64
  %48 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %47
  %49 = load float, ptr addrspace(1) %48, align 4
  %50 = zext nneg i32 %44 to i64
  %51 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %50
  %52 = load float, ptr addrspace(1) %51, align 4
  %53 = fmul float %49, %52
  %54 = fadd float %43, %53
  store float %54, ptr addrspace(1) %19, align 4
  %55 = or disjoint i32 %.017, 3
  %56 = shl nuw nsw i32 %55, 12
  %57 = add nsw i32 %56, %15
  %58 = sext i32 %57 to i64
  %59 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %58
  %60 = load float, ptr addrspace(1) %59, align 4
  %61 = zext nneg i32 %55 to i64
  %62 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = fmul float %60, %63
  %65 = fadd float %54, %64
  store float %65, ptr addrspace(1) %19, align 4
  %66 = or disjoint i32 %.017, 4
  %67 = shl nuw nsw i32 %66, 12
  %68 = add nsw i32 %67, %15
  %69 = sext i32 %68 to i64
  %70 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %69
  %71 = load float, ptr addrspace(1) %70, align 4
  %72 = zext nneg i32 %66 to i64
  %73 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %72
  %74 = load float, ptr addrspace(1) %73, align 4
  %75 = fmul float %71, %74
  %76 = fadd float %65, %75
  store float %76, ptr addrspace(1) %19, align 4
  %77 = or disjoint i32 %.017, 5
  %78 = shl nuw nsw i32 %77, 12
  %79 = add nsw i32 %78, %15
  %80 = sext i32 %79 to i64
  %81 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %80
  %82 = load float, ptr addrspace(1) %81, align 4
  %83 = zext nneg i32 %77 to i64
  %84 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %83
  %85 = load float, ptr addrspace(1) %84, align 4
  %86 = fmul float %82, %85
  %87 = fadd float %76, %86
  store float %87, ptr addrspace(1) %19, align 4
  %88 = or disjoint i32 %.017, 6
  %89 = shl nuw nsw i32 %88, 12
  %90 = add nsw i32 %89, %15
  %91 = sext i32 %90 to i64
  %92 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %91
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = zext nneg i32 %88 to i64
  %95 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %94
  %96 = load float, ptr addrspace(1) %95, align 4
  %97 = fmul float %93, %96
  %98 = fadd float %87, %97
  store float %98, ptr addrspace(1) %19, align 4
  %99 = or disjoint i32 %.017, 7
  %100 = shl nuw nsw i32 %99, 12
  %101 = add nsw i32 %100, %15
  %102 = sext i32 %101 to i64
  %103 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %102
  %104 = load float, ptr addrspace(1) %103, align 4
  %105 = zext nneg i32 %99 to i64
  %106 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %105
  %107 = load float, ptr addrspace(1) %106, align 4
  %108 = fmul float %104, %107
  %109 = fadd float %98, %108
  store float %109, ptr addrspace(1) %19, align 4
  %110 = add nuw nsw i32 %.017, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %21

.loopexit.loopexit.unr-lcssa:                     ; preds = %21
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ %.promoted, %.lr.ph ], [ %109, %.loopexit.loopexit.unr-lcssa ]
  %.017.epil.init = phi i32 [ 0, %.lr.ph ], [ %110, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod19 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod19)
  br label %111

111:                                              ; preds = %111, %.epil.preheader
  %112 = phi float [ %.epil.init, %.epil.preheader ], [ %122, %111 ]
  %.017.epil = phi i32 [ %.017.epil.init, %.epil.preheader ], [ %123, %111 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %111 ]
  %113 = shl nuw nsw i32 %.017.epil, 12
  %114 = add nsw i32 %113, %15
  %115 = sext i32 %114 to i64
  %116 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %115
  %117 = load float, ptr addrspace(1) %116, align 4
  %118 = zext nneg i32 %.017.epil to i64
  %119 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %118
  %120 = load float, ptr addrspace(1) %119, align 4
  %121 = fmul float %117, %120
  %122 = fadd float %112, %121
  store float %122, ptr addrspace(1) %19, align 4
  %123 = add nuw nsw i32 %.017.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %111, !llvm.loop !14

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %111, %4
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
!14 = distinct !{!14, !13}
