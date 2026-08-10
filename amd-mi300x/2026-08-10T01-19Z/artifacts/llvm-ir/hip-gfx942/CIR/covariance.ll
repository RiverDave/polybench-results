; ModuleID = '/root/polybenchGpu/HIP/COVAR/covariance.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/COVAR/covariance.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_e436a62ebcc01b5d = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_e436a62ebcc01b5d to ptr)], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11mean_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #0 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %9 = getelementptr inbounds nuw i8, ptr addrspace(4) %8, i64 12
  %.in.i = load i16, ptr addrspace(4) %9, align 4, !tbaa !10
  %10 = zext i16 %.in.i to i32
  %11 = mul i32 %7, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %15, label %87

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %16
  store float 0.000000e+00, ptr addrspace(1) %17, align 4
  %18 = icmp sgt i32 %1, 0
  br i1 %18, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %15
  %xtraiter = and i32 %1, 7
  %19 = icmp ult i32 %1, 8
  br i1 %19, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %1, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %20 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %75, %.lr.ph ]
  %.016 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %76, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %21 = shl nuw nsw i32 %.016, 11
  %22 = add nsw i32 %21, %13
  %23 = sext i32 %22 to i64
  %24 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %23
  %25 = load float, ptr addrspace(1) %24, align 4
  %26 = fadd float %25, %20
  store float %26, ptr addrspace(1) %17, align 4
  %27 = shl i32 %.016, 11
  %28 = or disjoint i32 %27, 2048
  %29 = add nsw i32 %28, %13
  %30 = sext i32 %29 to i64
  %31 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4
  %33 = fadd float %32, %26
  store float %33, ptr addrspace(1) %17, align 4
  %34 = shl i32 %.016, 11
  %35 = or disjoint i32 %34, 4096
  %36 = add nsw i32 %35, %13
  %37 = sext i32 %36 to i64
  %38 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 4
  %40 = fadd float %39, %33
  store float %40, ptr addrspace(1) %17, align 4
  %41 = shl i32 %.016, 11
  %42 = or disjoint i32 %41, 6144
  %43 = add nsw i32 %42, %13
  %44 = sext i32 %43 to i64
  %45 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %44
  %46 = load float, ptr addrspace(1) %45, align 4
  %47 = fadd float %46, %40
  store float %47, ptr addrspace(1) %17, align 4
  %48 = shl i32 %.016, 11
  %49 = or disjoint i32 %48, 8192
  %50 = add nsw i32 %49, %13
  %51 = sext i32 %50 to i64
  %52 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %51
  %53 = load float, ptr addrspace(1) %52, align 4
  %54 = fadd float %53, %47
  store float %54, ptr addrspace(1) %17, align 4
  %55 = shl i32 %.016, 11
  %56 = or disjoint i32 %55, 10240
  %57 = add nsw i32 %56, %13
  %58 = sext i32 %57 to i64
  %59 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %58
  %60 = load float, ptr addrspace(1) %59, align 4
  %61 = fadd float %60, %54
  store float %61, ptr addrspace(1) %17, align 4
  %62 = shl i32 %.016, 11
  %63 = or disjoint i32 %62, 12288
  %64 = add nsw i32 %63, %13
  %65 = sext i32 %64 to i64
  %66 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = fadd float %67, %61
  store float %68, ptr addrspace(1) %17, align 4
  %69 = shl i32 %.016, 11
  %70 = or disjoint i32 %69, 14336
  %71 = add nsw i32 %70, %13
  %72 = sext i32 %71 to i64
  %73 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %72
  %74 = load float, ptr addrspace(1) %73, align 4
  %75 = fadd float %74, %68
  store float %75, ptr addrspace(1) %17, align 4
  %76 = add nuw nsw i32 %.016, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %75, %._crit_edge.loopexit.unr-lcssa ]
  %.016.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %76, %._crit_edge.loopexit.unr-lcssa ]
  %lcmp.mod19 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod19)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %77 = phi float [ %83, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.016.epil = phi i32 [ %84, %.lr.ph.epil ], [ %.016.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %78 = shl nuw nsw i32 %.016.epil, 11
  %79 = add nsw i32 %78, %13
  %80 = sext i32 %79 to i64
  %81 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %80
  %82 = load float, ptr addrspace(1) %81, align 4
  %83 = fadd float %82, %77
  store float %83, ptr addrspace(1) %17, align 4
  %84 = add nuw nsw i32 %.016.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %.lr.ph.epil, !llvm.loop !12

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.epil, %15
  %85 = phi float [ 0.000000e+00, %15 ], [ %75, %._crit_edge.loopexit.unr-lcssa ], [ %83, %.lr.ph.epil ]
  %86 = fdiv float %85, f0x4A442E10
  store float %86, ptr addrspace(1) %17, align 4
  br label %87

87:                                               ; preds = %4, %._crit_edge
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z13reduce_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef captures(none) %3) local_unnamed_addr #1 {
  %5 = addrspacecast ptr %2 to ptr addrspace(1)
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %9 = getelementptr inbounds nuw i8, ptr addrspace(4) %8, i64 12
  %.in.i = load i16, ptr addrspace(4) %9, align 4, !tbaa !10
  %10 = zext i16 %.in.i to i32
  %11 = mul i32 %7, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr inbounds nuw i8, ptr addrspace(4) %8, i64 14
  %.in.i9 = load i16, ptr addrspace(4) %15, align 2, !tbaa !10
  %16 = zext i16 %.in.i9 to i32
  %17 = mul i32 %14, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %1
  %21 = icmp slt i32 %13, %0
  %22 = and i1 %21, %20
  br i1 %22, label %23, label %33

23:                                               ; preds = %4
  %24 = shl nsw i32 %19, 11
  %25 = add nsw i32 %24, %13
  %26 = sext i32 %25 to i64
  %27 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %26
  %28 = sext i32 %13 to i64
  %29 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4
  %31 = load float, ptr addrspace(1) %27, align 4
  %32 = fsub float %31, %30
  store float %32, ptr addrspace(1) %27, align 4
  br label %33

33:                                               ; preds = %4, %23
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z12covar_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #0 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %9 = getelementptr inbounds nuw i8, ptr addrspace(4) %8, i64 12
  %.in.i = load i16, ptr addrspace(4) %9, align 4, !tbaa !10
  %10 = zext i16 %.in.i to i32
  %11 = mul i32 %7, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %4
  %15 = shl nsw i32 %13, 11
  %16 = icmp sgt i32 %1, 0
  %xtraiter = and i32 %1, 7
  %17 = icmp ult i32 %1, 8
  %unroll_iter = and i32 %1, 2147483640
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  %lcmp.mod37 = icmp ne i32 %xtraiter, 0
  br label %18

18:                                               ; preds = %.preheader, %._crit_edge
  %.032 = phi i32 [ %13, %.preheader ], [ %137, %._crit_edge ]
  %19 = add nsw i32 %.032, %15
  %20 = sext i32 %19 to i64
  %21 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %20
  store float 0.000000e+00, ptr addrspace(1) %21, align 4
  br i1 %16, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %18
  br i1 %17, label %.lr.ph.epil.preheader, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %22 = phi float [ %117, %.lr.ph ], [ 0.000000e+00, %.lr.ph.preheader ]
  %.02631 = phi i32 [ %118, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %niter = phi i32 [ %niter.next.7, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %23 = shl nuw nsw i32 %.02631, 11
  %24 = add nsw i32 %23, %13
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4
  %28 = add nsw i32 %23, %.032
  %29 = sext i32 %28 to i64
  %30 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %29
  %31 = load float, ptr addrspace(1) %30, align 4
  %32 = fmul float %27, %31
  %33 = fadd float %22, %32
  store float %33, ptr addrspace(1) %21, align 4
  %34 = shl i32 %.02631, 11
  %35 = or disjoint i32 %34, 2048
  %36 = add nsw i32 %35, %13
  %37 = sext i32 %36 to i64
  %38 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 4
  %40 = add nsw i32 %35, %.032
  %41 = sext i32 %40 to i64
  %42 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %41
  %43 = load float, ptr addrspace(1) %42, align 4
  %44 = fmul float %39, %43
  %45 = fadd float %33, %44
  store float %45, ptr addrspace(1) %21, align 4
  %46 = shl i32 %.02631, 11
  %47 = or disjoint i32 %46, 4096
  %48 = add nsw i32 %47, %13
  %49 = sext i32 %48 to i64
  %50 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %49
  %51 = load float, ptr addrspace(1) %50, align 4
  %52 = add nsw i32 %47, %.032
  %53 = sext i32 %52 to i64
  %54 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %53
  %55 = load float, ptr addrspace(1) %54, align 4
  %56 = fmul float %51, %55
  %57 = fadd float %45, %56
  store float %57, ptr addrspace(1) %21, align 4
  %58 = shl i32 %.02631, 11
  %59 = or disjoint i32 %58, 6144
  %60 = add nsw i32 %59, %13
  %61 = sext i32 %60 to i64
  %62 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = add nsw i32 %59, %.032
  %65 = sext i32 %64 to i64
  %66 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = fmul float %63, %67
  %69 = fadd float %57, %68
  store float %69, ptr addrspace(1) %21, align 4
  %70 = shl i32 %.02631, 11
  %71 = or disjoint i32 %70, 8192
  %72 = add nsw i32 %71, %13
  %73 = sext i32 %72 to i64
  %74 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %73
  %75 = load float, ptr addrspace(1) %74, align 4
  %76 = add nsw i32 %71, %.032
  %77 = sext i32 %76 to i64
  %78 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %77
  %79 = load float, ptr addrspace(1) %78, align 4
  %80 = fmul float %75, %79
  %81 = fadd float %69, %80
  store float %81, ptr addrspace(1) %21, align 4
  %82 = shl i32 %.02631, 11
  %83 = or disjoint i32 %82, 10240
  %84 = add nsw i32 %83, %13
  %85 = sext i32 %84 to i64
  %86 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %85
  %87 = load float, ptr addrspace(1) %86, align 4
  %88 = add nsw i32 %83, %.032
  %89 = sext i32 %88 to i64
  %90 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %89
  %91 = load float, ptr addrspace(1) %90, align 4
  %92 = fmul float %87, %91
  %93 = fadd float %81, %92
  store float %93, ptr addrspace(1) %21, align 4
  %94 = shl i32 %.02631, 11
  %95 = or disjoint i32 %94, 12288
  %96 = add nsw i32 %95, %13
  %97 = sext i32 %96 to i64
  %98 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = add nsw i32 %95, %.032
  %101 = sext i32 %100 to i64
  %102 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %101
  %103 = load float, ptr addrspace(1) %102, align 4
  %104 = fmul float %99, %103
  %105 = fadd float %93, %104
  store float %105, ptr addrspace(1) %21, align 4
  %106 = shl i32 %.02631, 11
  %107 = or disjoint i32 %106, 14336
  %108 = add nsw i32 %107, %13
  %109 = sext i32 %108 to i64
  %110 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %109
  %111 = load float, ptr addrspace(1) %110, align 4
  %112 = add nsw i32 %107, %.032
  %113 = sext i32 %112 to i64
  %114 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %113
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = fmul float %111, %115
  %117 = fadd float %105, %116
  store float %117, ptr addrspace(1) %21, align 4
  %118 = add nuw nsw i32 %.02631, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br i1 %lcmp.mod.not, label %._crit_edge, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %117, %._crit_edge.loopexit.unr-lcssa ]
  %.02631.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %118, %._crit_edge.loopexit.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod37)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %119 = phi float [ %130, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.02631.epil = phi i32 [ %131, %.lr.ph.epil ], [ %.02631.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %120 = shl nuw nsw i32 %.02631.epil, 11
  %121 = add nsw i32 %120, %13
  %122 = sext i32 %121 to i64
  %123 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %122
  %124 = load float, ptr addrspace(1) %123, align 4
  %125 = add nsw i32 %120, %.032
  %126 = sext i32 %125 to i64
  %127 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %126
  %128 = load float, ptr addrspace(1) %127, align 4
  %129 = fmul float %124, %128
  %130 = fadd float %119, %129
  store float %130, ptr addrspace(1) %21, align 4
  %131 = add nuw nsw i32 %.02631.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %.lr.ph.epil, !llvm.loop !14

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.epil, %18
  %132 = phi float [ 0.000000e+00, %18 ], [ %117, %._crit_edge.loopexit.unr-lcssa ], [ %130, %.lr.ph.epil ]
  %133 = shl nsw i32 %.032, 11
  %134 = add nsw i32 %133, %13
  %135 = sext i32 %134 to i64
  %136 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %135
  store float %132, ptr addrspace(1) %136, align 4
  %137 = add nsw i32 %.032, 1
  %138 = icmp slt i32 %137, %0
  br i1 %138, label %18, label %.loopexit

.loopexit:                                        ; preds = %._crit_edge, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

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
