; ModuleID = '/root/polybenchGpu/HIP/BICG/bicg.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/BICG/bicg.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_6f1d8ad3b1cbee7f = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_6f1d8ad3b1cbee7f to ptr)], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z12bicg_kernel1iiPfS_S_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4) local_unnamed_addr #0 {
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %11 = getelementptr inbounds nuw i8, ptr addrspace(4) %10, i64 12
  %12 = load i16, ptr addrspace(4) %11, align 4, !tbaa !10
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %1
  br i1 %17, label %18, label %.loopexit

18:                                               ; preds = %5
  %19 = sext i32 %16 to i64
  %20 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %19
  store float 0.000000e+00, ptr addrspace(1) %20, align 4
  %21 = icmp sgt i32 %0, 0
  br i1 %21, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %18
  %xtraiter = and i32 %0, 7
  %22 = icmp ult i32 %0, 8
  br i1 %22, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %0, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %23 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %110, %.lr.ph ]
  %.018 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %111, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %24 = zext nneg i32 %.018 to i64
  %25 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %24
  %26 = load float, ptr addrspace(1) %25, align 4
  %27 = shl nuw nsw i32 %.018, 12
  %28 = add nsw i32 %27, %16
  %29 = sext i32 %28 to i64
  %30 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %29
  %31 = load float, ptr addrspace(1) %30, align 4
  %32 = fmul float %26, %31
  %33 = fadd float %23, %32
  store float %33, ptr addrspace(1) %20, align 4
  %34 = or disjoint i32 %.018, 1
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %35
  %37 = load float, ptr addrspace(1) %36, align 4
  %38 = shl nuw nsw i32 %34, 12
  %39 = add nsw i32 %38, %16
  %40 = sext i32 %39 to i64
  %41 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %40
  %42 = load float, ptr addrspace(1) %41, align 4
  %43 = fmul float %37, %42
  %44 = fadd float %33, %43
  store float %44, ptr addrspace(1) %20, align 4
  %45 = or disjoint i32 %.018, 2
  %46 = zext nneg i32 %45 to i64
  %47 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4
  %49 = shl nuw nsw i32 %45, 12
  %50 = add nsw i32 %49, %16
  %51 = sext i32 %50 to i64
  %52 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %51
  %53 = load float, ptr addrspace(1) %52, align 4
  %54 = fmul float %48, %53
  %55 = fadd float %44, %54
  store float %55, ptr addrspace(1) %20, align 4
  %56 = or disjoint i32 %.018, 3
  %57 = zext nneg i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = shl nuw nsw i32 %56, 12
  %61 = add nsw i32 %60, %16
  %62 = sext i32 %61 to i64
  %63 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %62
  %64 = load float, ptr addrspace(1) %63, align 4
  %65 = fmul float %59, %64
  %66 = fadd float %55, %65
  store float %66, ptr addrspace(1) %20, align 4
  %67 = or disjoint i32 %.018, 4
  %68 = zext nneg i32 %67 to i64
  %69 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %68
  %70 = load float, ptr addrspace(1) %69, align 4
  %71 = shl nuw nsw i32 %67, 12
  %72 = add nsw i32 %71, %16
  %73 = sext i32 %72 to i64
  %74 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %73
  %75 = load float, ptr addrspace(1) %74, align 4
  %76 = fmul float %70, %75
  %77 = fadd float %66, %76
  store float %77, ptr addrspace(1) %20, align 4
  %78 = or disjoint i32 %.018, 5
  %79 = zext nneg i32 %78 to i64
  %80 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %79
  %81 = load float, ptr addrspace(1) %80, align 4
  %82 = shl nuw nsw i32 %78, 12
  %83 = add nsw i32 %82, %16
  %84 = sext i32 %83 to i64
  %85 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %84
  %86 = load float, ptr addrspace(1) %85, align 4
  %87 = fmul float %81, %86
  %88 = fadd float %77, %87
  store float %88, ptr addrspace(1) %20, align 4
  %89 = or disjoint i32 %.018, 6
  %90 = zext nneg i32 %89 to i64
  %91 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %90
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = shl nuw nsw i32 %89, 12
  %94 = add nsw i32 %93, %16
  %95 = sext i32 %94 to i64
  %96 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %95
  %97 = load float, ptr addrspace(1) %96, align 4
  %98 = fmul float %92, %97
  %99 = fadd float %88, %98
  store float %99, ptr addrspace(1) %20, align 4
  %100 = or disjoint i32 %.018, 7
  %101 = zext nneg i32 %100 to i64
  %102 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %101
  %103 = load float, ptr addrspace(1) %102, align 4
  %104 = shl nuw nsw i32 %100, 12
  %105 = add nsw i32 %104, %16
  %106 = sext i32 %105 to i64
  %107 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %106
  %108 = load float, ptr addrspace(1) %107, align 4
  %109 = fmul float %103, %108
  %110 = fadd float %99, %109
  store float %110, ptr addrspace(1) %20, align 4
  %111 = add nuw nsw i32 %.018, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %110, %.loopexit.loopexit.unr-lcssa ]
  %.018.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %111, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod20 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod20)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %112 = phi float [ %122, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.018.epil = phi i32 [ %123, %.lr.ph.epil ], [ %.018.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %113 = zext nneg i32 %.018.epil to i64
  %114 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %113
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = shl nuw nsw i32 %.018.epil, 12
  %117 = add nsw i32 %116, %16
  %118 = sext i32 %117 to i64
  %119 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %118
  %120 = load float, ptr addrspace(1) %119, align 4
  %121 = fmul float %115, %120
  %122 = fadd float %112, %121
  store float %122, ptr addrspace(1) %20, align 4
  %123 = add nuw nsw i32 %.018.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !12

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.epil, %18, %5
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z12bicg_kernel2iiPfS_S_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4) local_unnamed_addr #0 {
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %11 = getelementptr inbounds nuw i8, ptr addrspace(4) %10, i64 12
  %12 = load i16, ptr addrspace(4) %11, align 4, !tbaa !10
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %.loopexit

18:                                               ; preds = %5
  %19 = sext i32 %16 to i64
  %20 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %19
  store float 0.000000e+00, ptr addrspace(1) %20, align 4
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %18
  %22 = shl nsw i32 %16, 12
  %xtraiter = and i32 %1, 7
  %23 = icmp ult i32 %1, 8
  br i1 %23, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %1, 2147483640
  br label %24

24:                                               ; preds = %24, %.lr.ph.new
  %25 = phi float [ 0.000000e+00, %.lr.ph.new ], [ %104, %24 ]
  %.018 = phi i32 [ 0, %.lr.ph.new ], [ %105, %24 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.7, %24 ]
  %26 = add nsw i32 %.018, %22
  %27 = sext i32 %26 to i64
  %28 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 4
  %30 = zext nneg i32 %.018 to i64
  %31 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4
  %33 = fmul float %29, %32
  %34 = fadd float %25, %33
  store float %34, ptr addrspace(1) %20, align 4
  %35 = or disjoint i32 %.018, 1
  %36 = add nsw i32 %35, %22
  %37 = sext i32 %36 to i64
  %38 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 4
  %40 = zext nneg i32 %35 to i64
  %41 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %40
  %42 = load float, ptr addrspace(1) %41, align 4
  %43 = fmul float %39, %42
  %44 = fadd float %34, %43
  store float %44, ptr addrspace(1) %20, align 4
  %45 = or disjoint i32 %.018, 2
  %46 = add nsw i32 %45, %22
  %47 = sext i32 %46 to i64
  %48 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %47
  %49 = load float, ptr addrspace(1) %48, align 4
  %50 = zext nneg i32 %45 to i64
  %51 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %50
  %52 = load float, ptr addrspace(1) %51, align 4
  %53 = fmul float %49, %52
  %54 = fadd float %44, %53
  store float %54, ptr addrspace(1) %20, align 4
  %55 = or disjoint i32 %.018, 3
  %56 = add nsw i32 %55, %22
  %57 = sext i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = zext nneg i32 %55 to i64
  %61 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %60
  %62 = load float, ptr addrspace(1) %61, align 4
  %63 = fmul float %59, %62
  %64 = fadd float %54, %63
  store float %64, ptr addrspace(1) %20, align 4
  %65 = or disjoint i32 %.018, 4
  %66 = add nsw i32 %65, %22
  %67 = sext i32 %66 to i64
  %68 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %67
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = zext nneg i32 %65 to i64
  %71 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %70
  %72 = load float, ptr addrspace(1) %71, align 4
  %73 = fmul float %69, %72
  %74 = fadd float %64, %73
  store float %74, ptr addrspace(1) %20, align 4
  %75 = or disjoint i32 %.018, 5
  %76 = add nsw i32 %75, %22
  %77 = sext i32 %76 to i64
  %78 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %77
  %79 = load float, ptr addrspace(1) %78, align 4
  %80 = zext nneg i32 %75 to i64
  %81 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %80
  %82 = load float, ptr addrspace(1) %81, align 4
  %83 = fmul float %79, %82
  %84 = fadd float %74, %83
  store float %84, ptr addrspace(1) %20, align 4
  %85 = or disjoint i32 %.018, 6
  %86 = add nsw i32 %85, %22
  %87 = sext i32 %86 to i64
  %88 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %87
  %89 = load float, ptr addrspace(1) %88, align 4
  %90 = zext nneg i32 %85 to i64
  %91 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %90
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = fmul float %89, %92
  %94 = fadd float %84, %93
  store float %94, ptr addrspace(1) %20, align 4
  %95 = or disjoint i32 %.018, 7
  %96 = add nsw i32 %95, %22
  %97 = sext i32 %96 to i64
  %98 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = zext nneg i32 %95 to i64
  %101 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %100
  %102 = load float, ptr addrspace(1) %101, align 4
  %103 = fmul float %99, %102
  %104 = fadd float %94, %103
  store float %104, ptr addrspace(1) %20, align 4
  %105 = add nuw nsw i32 %.018, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %24

.loopexit.loopexit.unr-lcssa:                     ; preds = %24
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph ], [ %104, %.loopexit.loopexit.unr-lcssa ]
  %.018.epil.init = phi i32 [ 0, %.lr.ph ], [ %105, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod20 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod20)
  br label %106

106:                                              ; preds = %106, %.epil.preheader
  %107 = phi float [ %.epil.init, %.epil.preheader ], [ %116, %106 ]
  %.018.epil = phi i32 [ %.018.epil.init, %.epil.preheader ], [ %117, %106 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %106 ]
  %108 = add nsw i32 %.018.epil, %22
  %109 = sext i32 %108 to i64
  %110 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %109
  %111 = load float, ptr addrspace(1) %110, align 4
  %112 = zext nneg i32 %.018.epil to i64
  %113 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %112
  %114 = load float, ptr addrspace(1) %113, align 4
  %115 = fmul float %111, %114
  %116 = fadd float %107, %115
  store float %116, ptr addrspace(1) %20, align 4
  %117 = add nuw nsw i32 %.018.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %106, !llvm.loop !14

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %106, %18, %5
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
