; ModuleID = '/root/polybenchGpu/HIP/3MM/3mm.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/3MM/3mm.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_d923fb7fe8ba9d0b = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_d923fb7fe8ba9d0b to ptr)], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11mm3_kernel1iiiiiPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef writeonly captures(none) %7) local_unnamed_addr #0 {
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
  %.in.i20 = load i16, ptr addrspace(4) %20, align 2, !tbaa !10
  %21 = zext i16 %.in.i20 to i32
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
  store float 0.000000e+00, ptr addrspace(1) %32, align 4
  %33 = icmp sgt i32 %2, 0
  br i1 %33, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %28
  %xtraiter = and i32 %2, 7
  %34 = icmp ult i32 %2, 8
  br i1 %34, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %2, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %35 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %130, %.lr.ph ]
  %.025 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %131, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %36 = add nsw i32 %.025, %29
  %37 = sext i32 %36 to i64
  %38 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 4
  %40 = shl nuw nsw i32 %.025, 9
  %41 = add nsw i32 %40, %18
  %42 = sext i32 %41 to i64
  %43 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %42
  %44 = load float, ptr addrspace(1) %43, align 4
  %45 = fmul float %39, %44
  %46 = fadd float %35, %45
  store float %46, ptr addrspace(1) %32, align 4
  %47 = or disjoint i32 %.025, 1
  %48 = add nsw i32 %47, %29
  %49 = sext i32 %48 to i64
  %50 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %49
  %51 = load float, ptr addrspace(1) %50, align 4
  %52 = shl nuw nsw i32 %47, 9
  %53 = add nsw i32 %52, %18
  %54 = sext i32 %53 to i64
  %55 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %54
  %56 = load float, ptr addrspace(1) %55, align 4
  %57 = fmul float %51, %56
  %58 = fadd float %46, %57
  store float %58, ptr addrspace(1) %32, align 4
  %59 = or disjoint i32 %.025, 2
  %60 = add nsw i32 %59, %29
  %61 = sext i32 %60 to i64
  %62 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = shl nuw nsw i32 %59, 9
  %65 = add nsw i32 %64, %18
  %66 = sext i32 %65 to i64
  %67 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %66
  %68 = load float, ptr addrspace(1) %67, align 4
  %69 = fmul float %63, %68
  %70 = fadd float %58, %69
  store float %70, ptr addrspace(1) %32, align 4
  %71 = or disjoint i32 %.025, 3
  %72 = add nsw i32 %71, %29
  %73 = sext i32 %72 to i64
  %74 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %73
  %75 = load float, ptr addrspace(1) %74, align 4
  %76 = shl nuw nsw i32 %71, 9
  %77 = add nsw i32 %76, %18
  %78 = sext i32 %77 to i64
  %79 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %78
  %80 = load float, ptr addrspace(1) %79, align 4
  %81 = fmul float %75, %80
  %82 = fadd float %70, %81
  store float %82, ptr addrspace(1) %32, align 4
  %83 = or disjoint i32 %.025, 4
  %84 = add nsw i32 %83, %29
  %85 = sext i32 %84 to i64
  %86 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %85
  %87 = load float, ptr addrspace(1) %86, align 4
  %88 = shl nuw nsw i32 %83, 9
  %89 = add nsw i32 %88, %18
  %90 = sext i32 %89 to i64
  %91 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %90
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = fmul float %87, %92
  %94 = fadd float %82, %93
  store float %94, ptr addrspace(1) %32, align 4
  %95 = or disjoint i32 %.025, 5
  %96 = add nsw i32 %95, %29
  %97 = sext i32 %96 to i64
  %98 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = shl nuw nsw i32 %95, 9
  %101 = add nsw i32 %100, %18
  %102 = sext i32 %101 to i64
  %103 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %102
  %104 = load float, ptr addrspace(1) %103, align 4
  %105 = fmul float %99, %104
  %106 = fadd float %94, %105
  store float %106, ptr addrspace(1) %32, align 4
  %107 = or disjoint i32 %.025, 6
  %108 = add nsw i32 %107, %29
  %109 = sext i32 %108 to i64
  %110 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %109
  %111 = load float, ptr addrspace(1) %110, align 4
  %112 = shl nuw nsw i32 %107, 9
  %113 = add nsw i32 %112, %18
  %114 = sext i32 %113 to i64
  %115 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %114
  %116 = load float, ptr addrspace(1) %115, align 4
  %117 = fmul float %111, %116
  %118 = fadd float %106, %117
  store float %118, ptr addrspace(1) %32, align 4
  %119 = or disjoint i32 %.025, 7
  %120 = add nsw i32 %119, %29
  %121 = sext i32 %120 to i64
  %122 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %121
  %123 = load float, ptr addrspace(1) %122, align 4
  %124 = shl nuw nsw i32 %119, 9
  %125 = add nsw i32 %124, %18
  %126 = sext i32 %125 to i64
  %127 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %126
  %128 = load float, ptr addrspace(1) %127, align 4
  %129 = fmul float %123, %128
  %130 = fadd float %118, %129
  store float %130, ptr addrspace(1) %32, align 4
  %131 = add nuw nsw i32 %.025, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %130, %.loopexit.loopexit.unr-lcssa ]
  %.025.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %131, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod28 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod28)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %132 = phi float [ %143, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.025.epil = phi i32 [ %144, %.lr.ph.epil ], [ %.025.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %133 = add nsw i32 %.025.epil, %29
  %134 = sext i32 %133 to i64
  %135 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %134
  %136 = load float, ptr addrspace(1) %135, align 4
  %137 = shl nuw nsw i32 %.025.epil, 9
  %138 = add nsw i32 %137, %18
  %139 = sext i32 %138 to i64
  %140 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %139
  %141 = load float, ptr addrspace(1) %140, align 4
  %142 = fmul float %136, %141
  %143 = fadd float %132, %142
  store float %143, ptr addrspace(1) %32, align 4
  %144 = add nuw nsw i32 %.025.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !12

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.epil, %28, %8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11mm3_kernel2iiiiiPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef writeonly captures(none) %7) local_unnamed_addr #0 {
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
  %.in.i20 = load i16, ptr addrspace(4) %20, align 2, !tbaa !10
  %21 = zext i16 %.in.i20 to i32
  %22 = mul i32 %19, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %1
  %26 = icmp slt i32 %18, %3
  %27 = and i1 %26, %25
  br i1 %27, label %28, label %.loopexit

28:                                               ; preds = %8
  %29 = shl nsw i32 %24, 9
  %30 = add nsw i32 %29, %18
  %31 = sext i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %31
  store float 0.000000e+00, ptr addrspace(1) %32, align 4
  %33 = icmp sgt i32 %4, 0
  br i1 %33, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %28
  %xtraiter = and i32 %4, 7
  %34 = icmp ult i32 %4, 8
  br i1 %34, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %4, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %35 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %130, %.lr.ph ]
  %.025 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %131, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %36 = add nsw i32 %.025, %29
  %37 = sext i32 %36 to i64
  %38 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 4
  %40 = shl nuw nsw i32 %.025, 9
  %41 = add nsw i32 %40, %18
  %42 = sext i32 %41 to i64
  %43 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %42
  %44 = load float, ptr addrspace(1) %43, align 4
  %45 = fmul float %39, %44
  %46 = fadd float %35, %45
  store float %46, ptr addrspace(1) %32, align 4
  %47 = or disjoint i32 %.025, 1
  %48 = add nsw i32 %47, %29
  %49 = sext i32 %48 to i64
  %50 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %49
  %51 = load float, ptr addrspace(1) %50, align 4
  %52 = shl nuw nsw i32 %47, 9
  %53 = add nsw i32 %52, %18
  %54 = sext i32 %53 to i64
  %55 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %54
  %56 = load float, ptr addrspace(1) %55, align 4
  %57 = fmul float %51, %56
  %58 = fadd float %46, %57
  store float %58, ptr addrspace(1) %32, align 4
  %59 = or disjoint i32 %.025, 2
  %60 = add nsw i32 %59, %29
  %61 = sext i32 %60 to i64
  %62 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = shl nuw nsw i32 %59, 9
  %65 = add nsw i32 %64, %18
  %66 = sext i32 %65 to i64
  %67 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %66
  %68 = load float, ptr addrspace(1) %67, align 4
  %69 = fmul float %63, %68
  %70 = fadd float %58, %69
  store float %70, ptr addrspace(1) %32, align 4
  %71 = or disjoint i32 %.025, 3
  %72 = add nsw i32 %71, %29
  %73 = sext i32 %72 to i64
  %74 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %73
  %75 = load float, ptr addrspace(1) %74, align 4
  %76 = shl nuw nsw i32 %71, 9
  %77 = add nsw i32 %76, %18
  %78 = sext i32 %77 to i64
  %79 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %78
  %80 = load float, ptr addrspace(1) %79, align 4
  %81 = fmul float %75, %80
  %82 = fadd float %70, %81
  store float %82, ptr addrspace(1) %32, align 4
  %83 = or disjoint i32 %.025, 4
  %84 = add nsw i32 %83, %29
  %85 = sext i32 %84 to i64
  %86 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %85
  %87 = load float, ptr addrspace(1) %86, align 4
  %88 = shl nuw nsw i32 %83, 9
  %89 = add nsw i32 %88, %18
  %90 = sext i32 %89 to i64
  %91 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %90
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = fmul float %87, %92
  %94 = fadd float %82, %93
  store float %94, ptr addrspace(1) %32, align 4
  %95 = or disjoint i32 %.025, 5
  %96 = add nsw i32 %95, %29
  %97 = sext i32 %96 to i64
  %98 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = shl nuw nsw i32 %95, 9
  %101 = add nsw i32 %100, %18
  %102 = sext i32 %101 to i64
  %103 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %102
  %104 = load float, ptr addrspace(1) %103, align 4
  %105 = fmul float %99, %104
  %106 = fadd float %94, %105
  store float %106, ptr addrspace(1) %32, align 4
  %107 = or disjoint i32 %.025, 6
  %108 = add nsw i32 %107, %29
  %109 = sext i32 %108 to i64
  %110 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %109
  %111 = load float, ptr addrspace(1) %110, align 4
  %112 = shl nuw nsw i32 %107, 9
  %113 = add nsw i32 %112, %18
  %114 = sext i32 %113 to i64
  %115 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %114
  %116 = load float, ptr addrspace(1) %115, align 4
  %117 = fmul float %111, %116
  %118 = fadd float %106, %117
  store float %118, ptr addrspace(1) %32, align 4
  %119 = or disjoint i32 %.025, 7
  %120 = add nsw i32 %119, %29
  %121 = sext i32 %120 to i64
  %122 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %121
  %123 = load float, ptr addrspace(1) %122, align 4
  %124 = shl nuw nsw i32 %119, 9
  %125 = add nsw i32 %124, %18
  %126 = sext i32 %125 to i64
  %127 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %126
  %128 = load float, ptr addrspace(1) %127, align 4
  %129 = fmul float %123, %128
  %130 = fadd float %118, %129
  store float %130, ptr addrspace(1) %32, align 4
  %131 = add nuw nsw i32 %.025, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %130, %.loopexit.loopexit.unr-lcssa ]
  %.025.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %131, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod28 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod28)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %132 = phi float [ %143, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.025.epil = phi i32 [ %144, %.lr.ph.epil ], [ %.025.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %133 = add nsw i32 %.025.epil, %29
  %134 = sext i32 %133 to i64
  %135 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %134
  %136 = load float, ptr addrspace(1) %135, align 4
  %137 = shl nuw nsw i32 %.025.epil, 9
  %138 = add nsw i32 %137, %18
  %139 = sext i32 %138 to i64
  %140 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %139
  %141 = load float, ptr addrspace(1) %140, align 4
  %142 = fmul float %136, %141
  %143 = fadd float %132, %142
  store float %143, ptr addrspace(1) %32, align 4
  %144 = add nuw nsw i32 %.025.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !14

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.epil, %28, %8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11mm3_kernel3iiiiiPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef writeonly captures(none) %7) local_unnamed_addr #0 {
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
  %.in.i20 = load i16, ptr addrspace(4) %20, align 2, !tbaa !10
  %21 = zext i16 %.in.i20 to i32
  %22 = mul i32 %19, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %0
  %26 = icmp slt i32 %18, %3
  %27 = and i1 %26, %25
  br i1 %27, label %28, label %.loopexit

28:                                               ; preds = %8
  %29 = shl nsw i32 %24, 9
  %30 = add nsw i32 %29, %18
  %31 = sext i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %31
  store float 0.000000e+00, ptr addrspace(1) %32, align 4
  %33 = icmp sgt i32 %1, 0
  br i1 %33, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %28
  %xtraiter = and i32 %1, 7
  %34 = icmp ult i32 %1, 8
  br i1 %34, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %1, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %35 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %130, %.lr.ph ]
  %.025 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %131, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %36 = add nsw i32 %.025, %29
  %37 = sext i32 %36 to i64
  %38 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 4
  %40 = shl nuw nsw i32 %.025, 9
  %41 = add nsw i32 %40, %18
  %42 = sext i32 %41 to i64
  %43 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %42
  %44 = load float, ptr addrspace(1) %43, align 4
  %45 = fmul float %39, %44
  %46 = fadd float %35, %45
  store float %46, ptr addrspace(1) %32, align 4
  %47 = or disjoint i32 %.025, 1
  %48 = add nsw i32 %47, %29
  %49 = sext i32 %48 to i64
  %50 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %49
  %51 = load float, ptr addrspace(1) %50, align 4
  %52 = shl nuw nsw i32 %47, 9
  %53 = add nsw i32 %52, %18
  %54 = sext i32 %53 to i64
  %55 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %54
  %56 = load float, ptr addrspace(1) %55, align 4
  %57 = fmul float %51, %56
  %58 = fadd float %46, %57
  store float %58, ptr addrspace(1) %32, align 4
  %59 = or disjoint i32 %.025, 2
  %60 = add nsw i32 %59, %29
  %61 = sext i32 %60 to i64
  %62 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = shl nuw nsw i32 %59, 9
  %65 = add nsw i32 %64, %18
  %66 = sext i32 %65 to i64
  %67 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %66
  %68 = load float, ptr addrspace(1) %67, align 4
  %69 = fmul float %63, %68
  %70 = fadd float %58, %69
  store float %70, ptr addrspace(1) %32, align 4
  %71 = or disjoint i32 %.025, 3
  %72 = add nsw i32 %71, %29
  %73 = sext i32 %72 to i64
  %74 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %73
  %75 = load float, ptr addrspace(1) %74, align 4
  %76 = shl nuw nsw i32 %71, 9
  %77 = add nsw i32 %76, %18
  %78 = sext i32 %77 to i64
  %79 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %78
  %80 = load float, ptr addrspace(1) %79, align 4
  %81 = fmul float %75, %80
  %82 = fadd float %70, %81
  store float %82, ptr addrspace(1) %32, align 4
  %83 = or disjoint i32 %.025, 4
  %84 = add nsw i32 %83, %29
  %85 = sext i32 %84 to i64
  %86 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %85
  %87 = load float, ptr addrspace(1) %86, align 4
  %88 = shl nuw nsw i32 %83, 9
  %89 = add nsw i32 %88, %18
  %90 = sext i32 %89 to i64
  %91 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %90
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = fmul float %87, %92
  %94 = fadd float %82, %93
  store float %94, ptr addrspace(1) %32, align 4
  %95 = or disjoint i32 %.025, 5
  %96 = add nsw i32 %95, %29
  %97 = sext i32 %96 to i64
  %98 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = shl nuw nsw i32 %95, 9
  %101 = add nsw i32 %100, %18
  %102 = sext i32 %101 to i64
  %103 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %102
  %104 = load float, ptr addrspace(1) %103, align 4
  %105 = fmul float %99, %104
  %106 = fadd float %94, %105
  store float %106, ptr addrspace(1) %32, align 4
  %107 = or disjoint i32 %.025, 6
  %108 = add nsw i32 %107, %29
  %109 = sext i32 %108 to i64
  %110 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %109
  %111 = load float, ptr addrspace(1) %110, align 4
  %112 = shl nuw nsw i32 %107, 9
  %113 = add nsw i32 %112, %18
  %114 = sext i32 %113 to i64
  %115 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %114
  %116 = load float, ptr addrspace(1) %115, align 4
  %117 = fmul float %111, %116
  %118 = fadd float %106, %117
  store float %118, ptr addrspace(1) %32, align 4
  %119 = or disjoint i32 %.025, 7
  %120 = add nsw i32 %119, %29
  %121 = sext i32 %120 to i64
  %122 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %121
  %123 = load float, ptr addrspace(1) %122, align 4
  %124 = shl nuw nsw i32 %119, 9
  %125 = add nsw i32 %124, %18
  %126 = sext i32 %125 to i64
  %127 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %126
  %128 = load float, ptr addrspace(1) %127, align 4
  %129 = fmul float %123, %128
  %130 = fadd float %118, %129
  store float %130, ptr addrspace(1) %32, align 4
  %131 = add nuw nsw i32 %.025, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %130, %.loopexit.loopexit.unr-lcssa ]
  %.025.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %131, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod28 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod28)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %132 = phi float [ %143, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.025.epil = phi i32 [ %144, %.lr.ph.epil ], [ %.025.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %133 = add nsw i32 %.025.epil, %29
  %134 = sext i32 %133 to i64
  %135 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %134
  %136 = load float, ptr addrspace(1) %135, align 4
  %137 = shl nuw nsw i32 %.025.epil, 9
  %138 = add nsw i32 %137, %18
  %139 = sext i32 %138 to i64
  %140 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %139
  %141 = load float, ptr addrspace(1) %140, align 4
  %142 = fmul float %136, %141
  %143 = fadd float %132, %142
  store float %143, ptr addrspace(1) %32, align 4
  %144 = add nuw nsw i32 %.025.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !15

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
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !13}
