; ModuleID = '/root/polybenchGpu/HIP/2MM/2mm.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/2MM/2mm.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_3f4905b4d6855e3f = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_3f4905b4d6855e3f to ptr)], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11mm2_kernel1iiiiffPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, float noundef %4, float noundef %5, ptr nofree noundef writeonly captures(none) %6, ptr nofree noundef readonly captures(none) %7, ptr nofree noundef readonly captures(none) %8) local_unnamed_addr #0 {
  %10 = addrspacecast ptr %8 to ptr addrspace(1)
  %11 = addrspacecast ptr %7 to ptr addrspace(1)
  %12 = addrspacecast ptr %6 to ptr addrspace(1)
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %15 = getelementptr inbounds nuw i8, ptr addrspace(4) %14, i64 12
  %.in.i = load i16, ptr addrspace(4) %15, align 4, !tbaa !10
  %16 = zext i16 %.in.i to i32
  %17 = mul i32 %13, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr inbounds nuw i8, ptr addrspace(4) %14, i64 14
  %.in.i21 = load i16, ptr addrspace(4) %21, align 2, !tbaa !10
  %22 = zext i16 %.in.i21 to i32
  %23 = mul i32 %20, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %0
  %27 = icmp slt i32 %19, %1
  %28 = and i1 %27, %26
  br i1 %28, label %29, label %.loopexit

29:                                               ; preds = %9
  %30 = shl nsw i32 %25, 10
  %31 = add nsw i32 %30, %19
  %32 = sext i32 %31 to i64
  %33 = getelementptr [4 x i8], ptr addrspace(1) %12, i64 %32
  store float 0.000000e+00, ptr addrspace(1) %33, align 4
  %34 = icmp sgt i32 %2, 0
  br i1 %34, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %29
  %xtraiter = and i32 %2, 7
  %35 = icmp ult i32 %2, 8
  br i1 %35, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %2, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %36 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %139, %.lr.ph ]
  %.026 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %140, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %37 = add nsw i32 %.026, %30
  %38 = sext i32 %37 to i64
  %39 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %38
  %40 = load float, ptr addrspace(1) %39, align 4
  %41 = fmul float %4, %40
  %42 = shl nuw nsw i32 %.026, 10
  %43 = add nsw i32 %42, %19
  %44 = sext i32 %43 to i64
  %45 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %44
  %46 = load float, ptr addrspace(1) %45, align 4
  %47 = fmul float %41, %46
  %48 = fadd float %36, %47
  store float %48, ptr addrspace(1) %33, align 4
  %49 = or disjoint i32 %.026, 1
  %50 = add nsw i32 %49, %30
  %51 = sext i32 %50 to i64
  %52 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %51
  %53 = load float, ptr addrspace(1) %52, align 4
  %54 = fmul float %4, %53
  %55 = shl nuw nsw i32 %49, 10
  %56 = add nsw i32 %55, %19
  %57 = sext i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = fmul float %54, %59
  %61 = fadd float %48, %60
  store float %61, ptr addrspace(1) %33, align 4
  %62 = or disjoint i32 %.026, 2
  %63 = add nsw i32 %62, %30
  %64 = sext i32 %63 to i64
  %65 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %64
  %66 = load float, ptr addrspace(1) %65, align 4
  %67 = fmul float %4, %66
  %68 = shl nuw nsw i32 %62, 10
  %69 = add nsw i32 %68, %19
  %70 = sext i32 %69 to i64
  %71 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %70
  %72 = load float, ptr addrspace(1) %71, align 4
  %73 = fmul float %67, %72
  %74 = fadd float %61, %73
  store float %74, ptr addrspace(1) %33, align 4
  %75 = or disjoint i32 %.026, 3
  %76 = add nsw i32 %75, %30
  %77 = sext i32 %76 to i64
  %78 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %77
  %79 = load float, ptr addrspace(1) %78, align 4
  %80 = fmul float %4, %79
  %81 = shl nuw nsw i32 %75, 10
  %82 = add nsw i32 %81, %19
  %83 = sext i32 %82 to i64
  %84 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %83
  %85 = load float, ptr addrspace(1) %84, align 4
  %86 = fmul float %80, %85
  %87 = fadd float %74, %86
  store float %87, ptr addrspace(1) %33, align 4
  %88 = or disjoint i32 %.026, 4
  %89 = add nsw i32 %88, %30
  %90 = sext i32 %89 to i64
  %91 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %90
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = fmul float %4, %92
  %94 = shl nuw nsw i32 %88, 10
  %95 = add nsw i32 %94, %19
  %96 = sext i32 %95 to i64
  %97 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %96
  %98 = load float, ptr addrspace(1) %97, align 4
  %99 = fmul float %93, %98
  %100 = fadd float %87, %99
  store float %100, ptr addrspace(1) %33, align 4
  %101 = or disjoint i32 %.026, 5
  %102 = add nsw i32 %101, %30
  %103 = sext i32 %102 to i64
  %104 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %103
  %105 = load float, ptr addrspace(1) %104, align 4
  %106 = fmul float %4, %105
  %107 = shl nuw nsw i32 %101, 10
  %108 = add nsw i32 %107, %19
  %109 = sext i32 %108 to i64
  %110 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %109
  %111 = load float, ptr addrspace(1) %110, align 4
  %112 = fmul float %106, %111
  %113 = fadd float %100, %112
  store float %113, ptr addrspace(1) %33, align 4
  %114 = or disjoint i32 %.026, 6
  %115 = add nsw i32 %114, %30
  %116 = sext i32 %115 to i64
  %117 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %116
  %118 = load float, ptr addrspace(1) %117, align 4
  %119 = fmul float %4, %118
  %120 = shl nuw nsw i32 %114, 10
  %121 = add nsw i32 %120, %19
  %122 = sext i32 %121 to i64
  %123 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %122
  %124 = load float, ptr addrspace(1) %123, align 4
  %125 = fmul float %119, %124
  %126 = fadd float %113, %125
  store float %126, ptr addrspace(1) %33, align 4
  %127 = or disjoint i32 %.026, 7
  %128 = add nsw i32 %127, %30
  %129 = sext i32 %128 to i64
  %130 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %129
  %131 = load float, ptr addrspace(1) %130, align 4
  %132 = fmul float %4, %131
  %133 = shl nuw nsw i32 %127, 10
  %134 = add nsw i32 %133, %19
  %135 = sext i32 %134 to i64
  %136 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %135
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = fmul float %132, %137
  %139 = fadd float %126, %138
  store float %139, ptr addrspace(1) %33, align 4
  %140 = add nuw nsw i32 %.026, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %139, %.loopexit.loopexit.unr-lcssa ]
  %.026.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %140, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod29 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod29)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %141 = phi float [ %153, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.026.epil = phi i32 [ %154, %.lr.ph.epil ], [ %.026.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %142 = add nsw i32 %.026.epil, %30
  %143 = sext i32 %142 to i64
  %144 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %143
  %145 = load float, ptr addrspace(1) %144, align 4
  %146 = fmul float %4, %145
  %147 = shl nuw nsw i32 %.026.epil, 10
  %148 = add nsw i32 %147, %19
  %149 = sext i32 %148 to i64
  %150 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %149
  %151 = load float, ptr addrspace(1) %150, align 4
  %152 = fmul float %146, %151
  %153 = fadd float %141, %152
  store float %153, ptr addrspace(1) %33, align 4
  %154 = add nuw nsw i32 %.026.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !12

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.epil, %29, %9
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11mm2_kernel2iiiiffPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, float noundef %4, float noundef %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef readonly captures(none) %7, ptr nofree noundef captures(none) %8) local_unnamed_addr #0 {
  %10 = addrspacecast ptr %7 to ptr addrspace(1)
  %11 = addrspacecast ptr %6 to ptr addrspace(1)
  %12 = addrspacecast ptr %8 to ptr addrspace(1)
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %15 = getelementptr inbounds nuw i8, ptr addrspace(4) %14, i64 12
  %.in.i = load i16, ptr addrspace(4) %15, align 4, !tbaa !10
  %16 = zext i16 %.in.i to i32
  %17 = mul i32 %13, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr inbounds nuw i8, ptr addrspace(4) %14, i64 14
  %.in.i21 = load i16, ptr addrspace(4) %21, align 2, !tbaa !10
  %22 = zext i16 %.in.i21 to i32
  %23 = mul i32 %20, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %0
  %27 = icmp slt i32 %19, %3
  %28 = and i1 %27, %26
  br i1 %28, label %29, label %.loopexit

29:                                               ; preds = %9
  %30 = shl nsw i32 %25, 10
  %31 = add nsw i32 %30, %19
  %32 = sext i32 %31 to i64
  %33 = getelementptr [4 x i8], ptr addrspace(1) %12, i64 %32
  %34 = load float, ptr addrspace(1) %33, align 4
  %35 = fmul float %5, %34
  store float %35, ptr addrspace(1) %33, align 4
  %36 = icmp sgt i32 %1, 0
  br i1 %36, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %29
  %xtraiter = and i32 %1, 7
  %37 = icmp ult i32 %1, 8
  br i1 %37, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %1, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %38 = phi float [ %35, %.lr.ph.preheader.new ], [ %133, %.lr.ph ]
  %.026 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %134, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %39 = add nsw i32 %.026, %30
  %40 = sext i32 %39 to i64
  %41 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %40
  %42 = load float, ptr addrspace(1) %41, align 4
  %43 = shl nuw nsw i32 %.026, 10
  %44 = add nsw i32 %43, %19
  %45 = sext i32 %44 to i64
  %46 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %45
  %47 = load float, ptr addrspace(1) %46, align 4
  %48 = fmul float %42, %47
  %49 = fadd float %38, %48
  store float %49, ptr addrspace(1) %33, align 4
  %50 = or disjoint i32 %.026, 1
  %51 = add nsw i32 %50, %30
  %52 = sext i32 %51 to i64
  %53 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %52
  %54 = load float, ptr addrspace(1) %53, align 4
  %55 = shl nuw nsw i32 %50, 10
  %56 = add nsw i32 %55, %19
  %57 = sext i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = fmul float %54, %59
  %61 = fadd float %49, %60
  store float %61, ptr addrspace(1) %33, align 4
  %62 = or disjoint i32 %.026, 2
  %63 = add nsw i32 %62, %30
  %64 = sext i32 %63 to i64
  %65 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %64
  %66 = load float, ptr addrspace(1) %65, align 4
  %67 = shl nuw nsw i32 %62, 10
  %68 = add nsw i32 %67, %19
  %69 = sext i32 %68 to i64
  %70 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %69
  %71 = load float, ptr addrspace(1) %70, align 4
  %72 = fmul float %66, %71
  %73 = fadd float %61, %72
  store float %73, ptr addrspace(1) %33, align 4
  %74 = or disjoint i32 %.026, 3
  %75 = add nsw i32 %74, %30
  %76 = sext i32 %75 to i64
  %77 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %76
  %78 = load float, ptr addrspace(1) %77, align 4
  %79 = shl nuw nsw i32 %74, 10
  %80 = add nsw i32 %79, %19
  %81 = sext i32 %80 to i64
  %82 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %81
  %83 = load float, ptr addrspace(1) %82, align 4
  %84 = fmul float %78, %83
  %85 = fadd float %73, %84
  store float %85, ptr addrspace(1) %33, align 4
  %86 = or disjoint i32 %.026, 4
  %87 = add nsw i32 %86, %30
  %88 = sext i32 %87 to i64
  %89 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %88
  %90 = load float, ptr addrspace(1) %89, align 4
  %91 = shl nuw nsw i32 %86, 10
  %92 = add nsw i32 %91, %19
  %93 = sext i32 %92 to i64
  %94 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %93
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = fmul float %90, %95
  %97 = fadd float %85, %96
  store float %97, ptr addrspace(1) %33, align 4
  %98 = or disjoint i32 %.026, 5
  %99 = add nsw i32 %98, %30
  %100 = sext i32 %99 to i64
  %101 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %100
  %102 = load float, ptr addrspace(1) %101, align 4
  %103 = shl nuw nsw i32 %98, 10
  %104 = add nsw i32 %103, %19
  %105 = sext i32 %104 to i64
  %106 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %105
  %107 = load float, ptr addrspace(1) %106, align 4
  %108 = fmul float %102, %107
  %109 = fadd float %97, %108
  store float %109, ptr addrspace(1) %33, align 4
  %110 = or disjoint i32 %.026, 6
  %111 = add nsw i32 %110, %30
  %112 = sext i32 %111 to i64
  %113 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %112
  %114 = load float, ptr addrspace(1) %113, align 4
  %115 = shl nuw nsw i32 %110, 10
  %116 = add nsw i32 %115, %19
  %117 = sext i32 %116 to i64
  %118 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %117
  %119 = load float, ptr addrspace(1) %118, align 4
  %120 = fmul float %114, %119
  %121 = fadd float %109, %120
  store float %121, ptr addrspace(1) %33, align 4
  %122 = or disjoint i32 %.026, 7
  %123 = add nsw i32 %122, %30
  %124 = sext i32 %123 to i64
  %125 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %124
  %126 = load float, ptr addrspace(1) %125, align 4
  %127 = shl nuw nsw i32 %122, 10
  %128 = add nsw i32 %127, %19
  %129 = sext i32 %128 to i64
  %130 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %129
  %131 = load float, ptr addrspace(1) %130, align 4
  %132 = fmul float %126, %131
  %133 = fadd float %121, %132
  store float %133, ptr addrspace(1) %33, align 4
  %134 = add nuw nsw i32 %.026, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ %35, %.lr.ph.preheader ], [ %133, %.loopexit.loopexit.unr-lcssa ]
  %.026.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %134, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod29 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod29)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %135 = phi float [ %146, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.026.epil = phi i32 [ %147, %.lr.ph.epil ], [ %.026.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %136 = add nsw i32 %.026.epil, %30
  %137 = sext i32 %136 to i64
  %138 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %137
  %139 = load float, ptr addrspace(1) %138, align 4
  %140 = shl nuw nsw i32 %.026.epil, 10
  %141 = add nsw i32 %140, %19
  %142 = sext i32 %141 to i64
  %143 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %142
  %144 = load float, ptr addrspace(1) %143, align 4
  %145 = fmul float %139, %144
  %146 = fadd float %135, %145
  store float %146, ptr addrspace(1) %33, align 4
  %147 = add nuw nsw i32 %.026.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %.lr.ph.epil, !llvm.loop !14

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph.epil, %29, %9
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
