; ModuleID = '/root/polybenchGpu/HIP/CORR/correlation.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/CORR/correlation.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_66ca9b82c26d426b = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_66ca9b82c26d426b to ptr)], section "llvm.metadata"

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

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z10std_kerneliiPfS_S_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef writeonly captures(none) %3, ptr nofree noundef readonly captures(none) %4) local_unnamed_addr #0 {
  %6 = addrspacecast ptr %4 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %11 = getelementptr inbounds nuw i8, ptr addrspace(4) %10, i64 12
  %.in.i = load i16, ptr addrspace(4) %11, align 4, !tbaa !10
  %12 = zext i16 %.in.i to i32
  %13 = mul i32 %9, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %0
  br i1 %16, label %17, label %122

17:                                               ; preds = %5
  %18 = sext i32 %15 to i64
  %19 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %18
  store float 0.000000e+00, ptr addrspace(1) %19, align 4
  %20 = icmp sgt i32 %1, 0
  br i1 %20, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %17
  %21 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %18
  %xtraiter = and i32 %1, 7
  %22 = icmp ult i32 %1, 8
  br i1 %22, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %1, 2147483640
  br label %23

23:                                               ; preds = %23, %.lr.ph.new
  %24 = phi float [ 0.000000e+00, %.lr.ph.new ], [ %103, %23 ]
  %.033 = phi i32 [ 0, %.lr.ph.new ], [ %104, %23 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.7, %23 ]
  %25 = shl nuw nsw i32 %.033, 11
  %26 = add nsw i32 %25, %15
  %27 = sext i32 %26 to i64
  %28 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 4
  %30 = load float, ptr addrspace(1) %21, align 4
  %31 = fsub float %29, %30
  %32 = fmul float %31, %31
  %33 = fadd float %24, %32
  store float %33, ptr addrspace(1) %19, align 4
  %34 = shl i32 %.033, 11
  %35 = or disjoint i32 %34, 2048
  %36 = add nsw i32 %35, %15
  %37 = sext i32 %36 to i64
  %38 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 4
  %40 = load float, ptr addrspace(1) %21, align 4
  %41 = fsub float %39, %40
  %42 = fmul float %41, %41
  %43 = fadd float %33, %42
  store float %43, ptr addrspace(1) %19, align 4
  %44 = shl i32 %.033, 11
  %45 = or disjoint i32 %44, 4096
  %46 = add nsw i32 %45, %15
  %47 = sext i32 %46 to i64
  %48 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %47
  %49 = load float, ptr addrspace(1) %48, align 4
  %50 = load float, ptr addrspace(1) %21, align 4
  %51 = fsub float %49, %50
  %52 = fmul float %51, %51
  %53 = fadd float %43, %52
  store float %53, ptr addrspace(1) %19, align 4
  %54 = shl i32 %.033, 11
  %55 = or disjoint i32 %54, 6144
  %56 = add nsw i32 %55, %15
  %57 = sext i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = load float, ptr addrspace(1) %21, align 4
  %61 = fsub float %59, %60
  %62 = fmul float %61, %61
  %63 = fadd float %53, %62
  store float %63, ptr addrspace(1) %19, align 4
  %64 = shl i32 %.033, 11
  %65 = or disjoint i32 %64, 8192
  %66 = add nsw i32 %65, %15
  %67 = sext i32 %66 to i64
  %68 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %67
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = load float, ptr addrspace(1) %21, align 4
  %71 = fsub float %69, %70
  %72 = fmul float %71, %71
  %73 = fadd float %63, %72
  store float %73, ptr addrspace(1) %19, align 4
  %74 = shl i32 %.033, 11
  %75 = or disjoint i32 %74, 10240
  %76 = add nsw i32 %75, %15
  %77 = sext i32 %76 to i64
  %78 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %77
  %79 = load float, ptr addrspace(1) %78, align 4
  %80 = load float, ptr addrspace(1) %21, align 4
  %81 = fsub float %79, %80
  %82 = fmul float %81, %81
  %83 = fadd float %73, %82
  store float %83, ptr addrspace(1) %19, align 4
  %84 = shl i32 %.033, 11
  %85 = or disjoint i32 %84, 12288
  %86 = add nsw i32 %85, %15
  %87 = sext i32 %86 to i64
  %88 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %87
  %89 = load float, ptr addrspace(1) %88, align 4
  %90 = load float, ptr addrspace(1) %21, align 4
  %91 = fsub float %89, %90
  %92 = fmul float %91, %91
  %93 = fadd float %83, %92
  store float %93, ptr addrspace(1) %19, align 4
  %94 = shl i32 %.033, 11
  %95 = or disjoint i32 %94, 14336
  %96 = add nsw i32 %95, %15
  %97 = sext i32 %96 to i64
  %98 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = load float, ptr addrspace(1) %21, align 4
  %101 = fsub float %99, %100
  %102 = fmul float %101, %101
  %103 = fadd float %93, %102
  store float %103, ptr addrspace(1) %19, align 4
  %104 = add nuw nsw i32 %.033, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %._crit_edge.loopexit.unr-lcssa, label %23

._crit_edge.loopexit.unr-lcssa:                   ; preds = %23
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge, label %.epil.preheader

.epil.preheader:                                  ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph ], [ %103, %._crit_edge.loopexit.unr-lcssa ]
  %.033.epil.init = phi i32 [ 0, %.lr.ph ], [ %104, %._crit_edge.loopexit.unr-lcssa ]
  %lcmp.mod36 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod36)
  br label %105

105:                                              ; preds = %105, %.epil.preheader
  %106 = phi float [ %.epil.init, %.epil.preheader ], [ %115, %105 ]
  %.033.epil = phi i32 [ %.033.epil.init, %.epil.preheader ], [ %116, %105 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %105 ]
  %107 = shl nuw nsw i32 %.033.epil, 11
  %108 = add nsw i32 %107, %15
  %109 = sext i32 %108 to i64
  %110 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %109
  %111 = load float, ptr addrspace(1) %110, align 4
  %112 = load float, ptr addrspace(1) %21, align 4
  %113 = fsub float %111, %112
  %114 = fmul float %113, %113
  %115 = fadd float %106, %114
  store float %115, ptr addrspace(1) %19, align 4
  %116 = add nuw nsw i32 %.033.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %105, !llvm.loop !14

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %105, %17
  %117 = phi float [ 0.000000e+00, %17 ], [ %103, %._crit_edge.loopexit.unr-lcssa ], [ %115, %105 ]
  %118 = fdiv float %117, f0x4A442E10
  %119 = tail call noundef float @llvm.sqrt.f32(float %118)
  store float %119, ptr addrspace(1) %19, align 4
  %120 = fcmp ugt float %119, 5.000000e-03
  br i1 %120, label %122, label %121

121:                                              ; preds = %._crit_edge
  store float 1.000000e+00, ptr addrspace(1) %19, align 4
  br label %122

122:                                              ; preds = %5, %._crit_edge, %121
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z13reduce_kerneliiPfS_S_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef captures(none) %4) local_unnamed_addr #1 {
  %6 = addrspacecast ptr %4 to ptr addrspace(1)
  %7 = addrspacecast ptr %3 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
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
  %.in.i14 = load i16, ptr addrspace(4) %17, align 2, !tbaa !10
  %18 = zext i16 %.in.i14 to i32
  %19 = mul i32 %16, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %21, %1
  %23 = icmp slt i32 %15, %0
  %24 = and i1 %23, %22
  br i1 %24, label %25, label %39

25:                                               ; preds = %5
  %26 = sext i32 %15 to i64
  %27 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %26
  %28 = load float, ptr addrspace(1) %27, align 4
  %29 = shl nsw i32 %21, 11
  %30 = add nsw i32 %29, %15
  %31 = sext i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 4
  %34 = fsub float %33, %28
  store float %34, ptr addrspace(1) %32, align 4
  %35 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %26
  %36 = load float, ptr addrspace(1) %35, align 4
  %37 = fmul float %36, f0x44E01A51
  %38 = fdiv float %34, %37
  store float %38, ptr addrspace(1) %32, align 4
  br label %39

39:                                               ; preds = %5, %25
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11corr_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr nofree noundef writeonly captures(none) %2, ptr nofree noundef readonly captures(none) %3) local_unnamed_addr #0 {
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
  %14 = add nsw i32 %0, -1
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %.loopexit

16:                                               ; preds = %4
  %17 = shl nsw i32 %13, 11
  %18 = mul i32 %13, 2049
  %19 = sext i32 %18 to i64
  %20 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %19
  store float 1.000000e+00, ptr addrspace(1) %20, align 4
  %.034 = add nsw i32 %13, 1
  %21 = icmp slt i32 %.034, %0
  br i1 %21, label %.lr.ph37, label %.loopexit

.lr.ph37:                                         ; preds = %16
  %22 = icmp sgt i32 %1, 0
  %xtraiter = and i32 %1, 7
  %23 = icmp ult i32 %1, 8
  %unroll_iter = and i32 %1, 2147483640
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  %lcmp.mod42 = icmp ne i32 %xtraiter, 0
  br label %24

24:                                               ; preds = %.lr.ph37, %._crit_edge
  %.035 = phi i32 [ %.034, %.lr.ph37 ], [ %.0, %._crit_edge ]
  %25 = add nsw i32 %.035, %17
  %26 = sext i32 %25 to i64
  %27 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %26
  store float 0.000000e+00, ptr addrspace(1) %27, align 4
  br i1 %22, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %24
  br i1 %23, label %.lr.ph.epil.preheader, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %28 = phi float [ %123, %.lr.ph ], [ 0.000000e+00, %.lr.ph.preheader ]
  %.02933 = phi i32 [ %124, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %niter = phi i32 [ %niter.next.7, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %29 = shl nuw nsw i32 %.02933, 11
  %30 = add nsw i32 %29, %13
  %31 = sext i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 4
  %34 = add nsw i32 %29, %.035
  %35 = sext i32 %34 to i64
  %36 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %35
  %37 = load float, ptr addrspace(1) %36, align 4
  %38 = fmul float %33, %37
  %39 = fadd float %28, %38
  store float %39, ptr addrspace(1) %27, align 4
  %40 = shl i32 %.02933, 11
  %41 = or disjoint i32 %40, 2048
  %42 = add nsw i32 %41, %13
  %43 = sext i32 %42 to i64
  %44 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 4
  %46 = add nsw i32 %41, %.035
  %47 = sext i32 %46 to i64
  %48 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %47
  %49 = load float, ptr addrspace(1) %48, align 4
  %50 = fmul float %45, %49
  %51 = fadd float %39, %50
  store float %51, ptr addrspace(1) %27, align 4
  %52 = shl i32 %.02933, 11
  %53 = or disjoint i32 %52, 4096
  %54 = add nsw i32 %53, %13
  %55 = sext i32 %54 to i64
  %56 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %55
  %57 = load float, ptr addrspace(1) %56, align 4
  %58 = add nsw i32 %53, %.035
  %59 = sext i32 %58 to i64
  %60 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %59
  %61 = load float, ptr addrspace(1) %60, align 4
  %62 = fmul float %57, %61
  %63 = fadd float %51, %62
  store float %63, ptr addrspace(1) %27, align 4
  %64 = shl i32 %.02933, 11
  %65 = or disjoint i32 %64, 6144
  %66 = add nsw i32 %65, %13
  %67 = sext i32 %66 to i64
  %68 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %67
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = add nsw i32 %65, %.035
  %71 = sext i32 %70 to i64
  %72 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %71
  %73 = load float, ptr addrspace(1) %72, align 4
  %74 = fmul float %69, %73
  %75 = fadd float %63, %74
  store float %75, ptr addrspace(1) %27, align 4
  %76 = shl i32 %.02933, 11
  %77 = or disjoint i32 %76, 8192
  %78 = add nsw i32 %77, %13
  %79 = sext i32 %78 to i64
  %80 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %79
  %81 = load float, ptr addrspace(1) %80, align 4
  %82 = add nsw i32 %77, %.035
  %83 = sext i32 %82 to i64
  %84 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %83
  %85 = load float, ptr addrspace(1) %84, align 4
  %86 = fmul float %81, %85
  %87 = fadd float %75, %86
  store float %87, ptr addrspace(1) %27, align 4
  %88 = shl i32 %.02933, 11
  %89 = or disjoint i32 %88, 10240
  %90 = add nsw i32 %89, %13
  %91 = sext i32 %90 to i64
  %92 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %91
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = add nsw i32 %89, %.035
  %95 = sext i32 %94 to i64
  %96 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %95
  %97 = load float, ptr addrspace(1) %96, align 4
  %98 = fmul float %93, %97
  %99 = fadd float %87, %98
  store float %99, ptr addrspace(1) %27, align 4
  %100 = shl i32 %.02933, 11
  %101 = or disjoint i32 %100, 12288
  %102 = add nsw i32 %101, %13
  %103 = sext i32 %102 to i64
  %104 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %103
  %105 = load float, ptr addrspace(1) %104, align 4
  %106 = add nsw i32 %101, %.035
  %107 = sext i32 %106 to i64
  %108 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %107
  %109 = load float, ptr addrspace(1) %108, align 4
  %110 = fmul float %105, %109
  %111 = fadd float %99, %110
  store float %111, ptr addrspace(1) %27, align 4
  %112 = shl i32 %.02933, 11
  %113 = or disjoint i32 %112, 14336
  %114 = add nsw i32 %113, %13
  %115 = sext i32 %114 to i64
  %116 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %115
  %117 = load float, ptr addrspace(1) %116, align 4
  %118 = add nsw i32 %113, %.035
  %119 = sext i32 %118 to i64
  %120 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %119
  %121 = load float, ptr addrspace(1) %120, align 4
  %122 = fmul float %117, %121
  %123 = fadd float %111, %122
  store float %123, ptr addrspace(1) %27, align 4
  %124 = add nuw nsw i32 %.02933, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br i1 %lcmp.mod.not, label %._crit_edge, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %123, %._crit_edge.loopexit.unr-lcssa ]
  %.02933.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %124, %._crit_edge.loopexit.unr-lcssa ]
  tail call void @llvm.assume(i1 %lcmp.mod42)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %125 = phi float [ %136, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.02933.epil = phi i32 [ %137, %.lr.ph.epil ], [ %.02933.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %126 = shl nuw nsw i32 %.02933.epil, 11
  %127 = add nsw i32 %126, %13
  %128 = sext i32 %127 to i64
  %129 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %128
  %130 = load float, ptr addrspace(1) %129, align 4
  %131 = add nsw i32 %126, %.035
  %132 = sext i32 %131 to i64
  %133 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %132
  %134 = load float, ptr addrspace(1) %133, align 4
  %135 = fmul float %130, %134
  %136 = fadd float %125, %135
  store float %136, ptr addrspace(1) %27, align 4
  %137 = add nuw nsw i32 %.02933.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %.lr.ph.epil, !llvm.loop !15

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.epil, %24
  %138 = phi float [ 0.000000e+00, %24 ], [ %123, %._crit_edge.loopexit.unr-lcssa ], [ %136, %.lr.ph.epil ]
  %139 = shl nsw i32 %.035, 11
  %140 = add nsw i32 %139, %13
  %141 = sext i32 %140 to i64
  %142 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %141
  store float %138, ptr addrspace(1) %142, align 4
  %.0 = add nsw i32 %.035, 1
  %143 = icmp slt i32 %.0, %0
  br i1 %143, label %24, label %.loopexit

.loopexit:                                        ; preds = %._crit_edge, %16, %4
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #4

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

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
!15 = distinct !{!15, !13}
