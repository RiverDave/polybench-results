; ModuleID = '/root/polybenchGpu/HIP/GRAMSCHM/gramschmidt.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/GRAMSCHM/gramschmidt.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_2489c87f79c47ffb = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_2489c87f79c47ffb to ptr)], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z19gramschmidt_kernel1iiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef writeonly captures(none) %3, ptr nofree noundef readnone captures(none) %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %3 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %11 = getelementptr inbounds nuw i8, ptr addrspace(4) %10, i64 12
  %12 = load i16, ptr addrspace(4) %11, align 4, !tbaa !10
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %16 = sub nsw i32 0, %15
  %17 = icmp eq i32 %14, %16
  br i1 %17, label %.preheader, label %96

.preheader:                                       ; preds = %6
  %18 = icmp sgt i32 %0, 0
  br i1 %18, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i32 %0, 7
  %19 = icmp ult i32 %0, 8
  br i1 %19, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %0, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %.018 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %82, %.lr.ph ]
  %.01417 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %83, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %20 = shl nuw nsw i32 %.01417, 11
  %21 = add nsw i32 %20, %5
  %22 = sext i32 %21 to i64
  %23 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %22
  %24 = load float, ptr addrspace(1) %23, align 4
  %25 = fmul float %24, %24
  %26 = fadd float %.018, %25
  %27 = shl i32 %.01417, 11
  %28 = or disjoint i32 %27, 2048
  %29 = add nsw i32 %28, %5
  %30 = sext i32 %29 to i64
  %31 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4
  %33 = fmul float %32, %32
  %34 = fadd float %26, %33
  %35 = shl i32 %.01417, 11
  %36 = or disjoint i32 %35, 4096
  %37 = add nsw i32 %36, %5
  %38 = sext i32 %37 to i64
  %39 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %38
  %40 = load float, ptr addrspace(1) %39, align 4
  %41 = fmul float %40, %40
  %42 = fadd float %34, %41
  %43 = shl i32 %.01417, 11
  %44 = or disjoint i32 %43, 6144
  %45 = add nsw i32 %44, %5
  %46 = sext i32 %45 to i64
  %47 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4
  %49 = fmul float %48, %48
  %50 = fadd float %42, %49
  %51 = shl i32 %.01417, 11
  %52 = or disjoint i32 %51, 8192
  %53 = add nsw i32 %52, %5
  %54 = sext i32 %53 to i64
  %55 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %54
  %56 = load float, ptr addrspace(1) %55, align 4
  %57 = fmul float %56, %56
  %58 = fadd float %50, %57
  %59 = shl i32 %.01417, 11
  %60 = or disjoint i32 %59, 10240
  %61 = add nsw i32 %60, %5
  %62 = sext i32 %61 to i64
  %63 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %62
  %64 = load float, ptr addrspace(1) %63, align 4
  %65 = fmul float %64, %64
  %66 = fadd float %58, %65
  %67 = shl i32 %.01417, 11
  %68 = or disjoint i32 %67, 12288
  %69 = add nsw i32 %68, %5
  %70 = sext i32 %69 to i64
  %71 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %70
  %72 = load float, ptr addrspace(1) %71, align 4
  %73 = fmul float %72, %72
  %74 = fadd float %66, %73
  %75 = shl i32 %.01417, 11
  %76 = or disjoint i32 %75, 14336
  %77 = add nsw i32 %76, %5
  %78 = sext i32 %77 to i64
  %79 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %78
  %80 = load float, ptr addrspace(1) %79, align 4
  %81 = fmul float %80, %80
  %82 = fadd float %74, %81
  %83 = add nuw nsw i32 %.01417, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge.loopexit, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.preheader
  %.018.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %82, %._crit_edge.loopexit.unr-lcssa ]
  %.01417.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %83, %._crit_edge.loopexit.unr-lcssa ]
  %lcmp.mod20 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod20)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %.018.epil = phi float [ %90, %.lr.ph.epil ], [ %.018.epil.init, %.lr.ph.epil.preheader ]
  %.01417.epil = phi i32 [ %91, %.lr.ph.epil ], [ %.01417.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %84 = shl nuw nsw i32 %.01417.epil, 11
  %85 = add nsw i32 %84, %5
  %86 = sext i32 %85 to i64
  %87 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4
  %89 = fmul float %88, %88
  %90 = fadd float %.018.epil, %89
  %91 = add nuw nsw i32 %.01417.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge.loopexit, label %.lr.ph.epil, !llvm.loop !12

._crit_edge.loopexit:                             ; preds = %.lr.ph.epil, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi float [ %82, %._crit_edge.loopexit.unr-lcssa ], [ %90, %.lr.ph.epil ]
  %92 = tail call float @llvm.sqrt.f32(float %.lcssa)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.0.lcssa = phi float [ 0.000000e+00, %.preheader ], [ %92, %._crit_edge.loopexit ]
  %93 = mul nsw i32 %5, 2049
  %94 = sext i32 %93 to i64
  %95 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %94
  store float %.0.lcssa, ptr addrspace(1) %95, align 4
  br label %96

96:                                               ; preds = %6, %._crit_edge
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z19gramschmidt_kernel2iiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4, i32 noundef %5) local_unnamed_addr #1 {
  %7 = addrspacecast ptr %4 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = addrspacecast ptr %2 to ptr addrspace(1)
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %12 = getelementptr inbounds nuw i8, ptr addrspace(4) %11, i64 12
  %13 = load i16, ptr addrspace(4) %12, align 4, !tbaa !10
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %31

19:                                               ; preds = %6
  %20 = shl nsw i32 %17, 11
  %21 = add nsw i32 %20, %5
  %22 = sext i32 %21 to i64
  %23 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %22
  %24 = load float, ptr addrspace(1) %23, align 4
  %25 = mul nsw i32 %5, 2049
  %26 = sext i32 %25 to i64
  %27 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %26
  %28 = load float, ptr addrspace(1) %27, align 4
  %29 = fdiv float %24, %28
  %30 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %22
  store float %29, ptr addrspace(1) %30, align 4
  br label %31

31:                                               ; preds = %6, %19
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z19gramschmidt_kernel3iiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr nofree noundef captures(none) %2, ptr nofree noundef captures(none) %3, ptr nofree noundef readonly captures(none) %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %4 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %12 = getelementptr inbounds nuw i8, ptr addrspace(4) %11, i64 12
  %13 = load i16, ptr addrspace(4) %12, align 4, !tbaa !10
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %17 = add i32 %15, %16
  %18 = icmp sgt i32 %17, %5
  %19 = icmp slt i32 %17, %1
  %20 = and i1 %18, %19
  br i1 %20, label %21, label %.loopexit

21:                                               ; preds = %6
  %22 = shl nsw i32 %5, 11
  %23 = add nsw i32 %17, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %24
  store float 0.000000e+00, ptr addrspace(1) %25, align 4
  %26 = icmp sgt i32 %0, 0
  br i1 %26, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %21
  %xtraiter = and i32 %0, 7
  %27 = icmp ult i32 %0, 8
  br i1 %27, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %0, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %28 = phi float [ 0.000000e+00, %.lr.ph.preheader.new ], [ %123, %.lr.ph ]
  %.037 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %124, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %29 = shl nuw nsw i32 %.037, 11
  %30 = add nsw i32 %29, %5
  %31 = sext i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 4
  %34 = add nsw i32 %29, %17
  %35 = sext i32 %34 to i64
  %36 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %35
  %37 = load float, ptr addrspace(1) %36, align 4
  %38 = fmul float %33, %37
  %39 = fadd float %28, %38
  store float %39, ptr addrspace(1) %25, align 4
  %40 = shl i32 %.037, 11
  %41 = or disjoint i32 %40, 2048
  %42 = add nsw i32 %41, %5
  %43 = sext i32 %42 to i64
  %44 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 4
  %46 = add nsw i32 %41, %17
  %47 = sext i32 %46 to i64
  %48 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %47
  %49 = load float, ptr addrspace(1) %48, align 4
  %50 = fmul float %45, %49
  %51 = fadd float %39, %50
  store float %51, ptr addrspace(1) %25, align 4
  %52 = shl i32 %.037, 11
  %53 = or disjoint i32 %52, 4096
  %54 = add nsw i32 %53, %5
  %55 = sext i32 %54 to i64
  %56 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %55
  %57 = load float, ptr addrspace(1) %56, align 4
  %58 = add nsw i32 %53, %17
  %59 = sext i32 %58 to i64
  %60 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %59
  %61 = load float, ptr addrspace(1) %60, align 4
  %62 = fmul float %57, %61
  %63 = fadd float %51, %62
  store float %63, ptr addrspace(1) %25, align 4
  %64 = shl i32 %.037, 11
  %65 = or disjoint i32 %64, 6144
  %66 = add nsw i32 %65, %5
  %67 = sext i32 %66 to i64
  %68 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %67
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = add nsw i32 %65, %17
  %71 = sext i32 %70 to i64
  %72 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %71
  %73 = load float, ptr addrspace(1) %72, align 4
  %74 = fmul float %69, %73
  %75 = fadd float %63, %74
  store float %75, ptr addrspace(1) %25, align 4
  %76 = shl i32 %.037, 11
  %77 = or disjoint i32 %76, 8192
  %78 = add nsw i32 %77, %5
  %79 = sext i32 %78 to i64
  %80 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %79
  %81 = load float, ptr addrspace(1) %80, align 4
  %82 = add nsw i32 %77, %17
  %83 = sext i32 %82 to i64
  %84 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %83
  %85 = load float, ptr addrspace(1) %84, align 4
  %86 = fmul float %81, %85
  %87 = fadd float %75, %86
  store float %87, ptr addrspace(1) %25, align 4
  %88 = shl i32 %.037, 11
  %89 = or disjoint i32 %88, 10240
  %90 = add nsw i32 %89, %5
  %91 = sext i32 %90 to i64
  %92 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %91
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = add nsw i32 %89, %17
  %95 = sext i32 %94 to i64
  %96 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %95
  %97 = load float, ptr addrspace(1) %96, align 4
  %98 = fmul float %93, %97
  %99 = fadd float %87, %98
  store float %99, ptr addrspace(1) %25, align 4
  %100 = shl i32 %.037, 11
  %101 = or disjoint i32 %100, 12288
  %102 = add nsw i32 %101, %5
  %103 = sext i32 %102 to i64
  %104 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %103
  %105 = load float, ptr addrspace(1) %104, align 4
  %106 = add nsw i32 %101, %17
  %107 = sext i32 %106 to i64
  %108 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %107
  %109 = load float, ptr addrspace(1) %108, align 4
  %110 = fmul float %105, %109
  %111 = fadd float %99, %110
  store float %111, ptr addrspace(1) %25, align 4
  %112 = shl i32 %.037, 11
  %113 = or disjoint i32 %112, 14336
  %114 = add nsw i32 %113, %5
  %115 = sext i32 %114 to i64
  %116 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %115
  %117 = load float, ptr addrspace(1) %116, align 4
  %118 = add nsw i32 %113, %17
  %119 = sext i32 %118 to i64
  %120 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %119
  %121 = load float, ptr addrspace(1) %120, align 4
  %122 = fmul float %117, %121
  %123 = fadd float %111, %122
  store float %123, ptr addrspace(1) %25, align 4
  %124 = add nuw nsw i32 %.037, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.lr.ph39.preheader.unr-lcssa, label %.lr.ph

.lr.ph39.preheader.unr-lcssa:                     ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.lr.ph39.preheader, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %.lr.ph39.preheader.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ 0.000000e+00, %.lr.ph.preheader ], [ %123, %.lr.ph39.preheader.unr-lcssa ]
  %.037.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %124, %.lr.ph39.preheader.unr-lcssa ]
  %lcmp.mod43 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod43)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %125 = phi float [ %136, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.037.epil = phi i32 [ %137, %.lr.ph.epil ], [ %.037.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %126 = shl nuw nsw i32 %.037.epil, 11
  %127 = add nsw i32 %126, %5
  %128 = sext i32 %127 to i64
  %129 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %128
  %130 = load float, ptr addrspace(1) %129, align 4
  %131 = add nsw i32 %126, %17
  %132 = sext i32 %131 to i64
  %133 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %132
  %134 = load float, ptr addrspace(1) %133, align 4
  %135 = fmul float %130, %134
  %136 = fadd float %125, %135
  store float %136, ptr addrspace(1) %25, align 4
  %137 = add nuw nsw i32 %.037.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.lr.ph39.preheader, label %.lr.ph.epil, !llvm.loop !14

.lr.ph39.preheader:                               ; preds = %.lr.ph.epil, %.lr.ph39.preheader.unr-lcssa
  %xtraiter44 = and i32 %0, 7
  %138 = icmp ult i32 %0, 8
  br i1 %138, label %.lr.ph39.epil.preheader, label %.lr.ph39.preheader.new

.lr.ph39.preheader.new:                           ; preds = %.lr.ph39.preheader
  %unroll_iter48 = and i32 %0, 2147483640
  br label %.lr.ph39

.lr.ph39:                                         ; preds = %.lr.ph39, %.lr.ph39.preheader.new
  %.138 = phi i32 [ 0, %.lr.ph39.preheader.new ], [ %242, %.lr.ph39 ]
  %niter49 = phi i32 [ 0, %.lr.ph39.preheader.new ], [ %niter49.next.7, %.lr.ph39 ]
  %139 = shl nuw nsw i32 %.138, 11
  %140 = add nsw i32 %139, %5
  %141 = sext i32 %140 to i64
  %142 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %141
  %143 = load float, ptr addrspace(1) %142, align 4
  %144 = load float, ptr addrspace(1) %25, align 4
  %145 = fmul float %143, %144
  %146 = add nsw i32 %139, %17
  %147 = sext i32 %146 to i64
  %148 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %147
  %149 = load float, ptr addrspace(1) %148, align 4
  %150 = fsub float %149, %145
  store float %150, ptr addrspace(1) %148, align 4
  %151 = shl i32 %.138, 11
  %152 = or disjoint i32 %151, 2048
  %153 = add nsw i32 %152, %5
  %154 = sext i32 %153 to i64
  %155 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %154
  %156 = load float, ptr addrspace(1) %155, align 4
  %157 = load float, ptr addrspace(1) %25, align 4
  %158 = fmul float %156, %157
  %159 = add nsw i32 %152, %17
  %160 = sext i32 %159 to i64
  %161 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %160
  %162 = load float, ptr addrspace(1) %161, align 4
  %163 = fsub float %162, %158
  store float %163, ptr addrspace(1) %161, align 4
  %164 = shl i32 %.138, 11
  %165 = or disjoint i32 %164, 4096
  %166 = add nsw i32 %165, %5
  %167 = sext i32 %166 to i64
  %168 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %167
  %169 = load float, ptr addrspace(1) %168, align 4
  %170 = load float, ptr addrspace(1) %25, align 4
  %171 = fmul float %169, %170
  %172 = add nsw i32 %165, %17
  %173 = sext i32 %172 to i64
  %174 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %173
  %175 = load float, ptr addrspace(1) %174, align 4
  %176 = fsub float %175, %171
  store float %176, ptr addrspace(1) %174, align 4
  %177 = shl i32 %.138, 11
  %178 = or disjoint i32 %177, 6144
  %179 = add nsw i32 %178, %5
  %180 = sext i32 %179 to i64
  %181 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %180
  %182 = load float, ptr addrspace(1) %181, align 4
  %183 = load float, ptr addrspace(1) %25, align 4
  %184 = fmul float %182, %183
  %185 = add nsw i32 %178, %17
  %186 = sext i32 %185 to i64
  %187 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %186
  %188 = load float, ptr addrspace(1) %187, align 4
  %189 = fsub float %188, %184
  store float %189, ptr addrspace(1) %187, align 4
  %190 = shl i32 %.138, 11
  %191 = or disjoint i32 %190, 8192
  %192 = add nsw i32 %191, %5
  %193 = sext i32 %192 to i64
  %194 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %193
  %195 = load float, ptr addrspace(1) %194, align 4
  %196 = load float, ptr addrspace(1) %25, align 4
  %197 = fmul float %195, %196
  %198 = add nsw i32 %191, %17
  %199 = sext i32 %198 to i64
  %200 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %199
  %201 = load float, ptr addrspace(1) %200, align 4
  %202 = fsub float %201, %197
  store float %202, ptr addrspace(1) %200, align 4
  %203 = shl i32 %.138, 11
  %204 = or disjoint i32 %203, 10240
  %205 = add nsw i32 %204, %5
  %206 = sext i32 %205 to i64
  %207 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %206
  %208 = load float, ptr addrspace(1) %207, align 4
  %209 = load float, ptr addrspace(1) %25, align 4
  %210 = fmul float %208, %209
  %211 = add nsw i32 %204, %17
  %212 = sext i32 %211 to i64
  %213 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %212
  %214 = load float, ptr addrspace(1) %213, align 4
  %215 = fsub float %214, %210
  store float %215, ptr addrspace(1) %213, align 4
  %216 = shl i32 %.138, 11
  %217 = or disjoint i32 %216, 12288
  %218 = add nsw i32 %217, %5
  %219 = sext i32 %218 to i64
  %220 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %219
  %221 = load float, ptr addrspace(1) %220, align 4
  %222 = load float, ptr addrspace(1) %25, align 4
  %223 = fmul float %221, %222
  %224 = add nsw i32 %217, %17
  %225 = sext i32 %224 to i64
  %226 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %225
  %227 = load float, ptr addrspace(1) %226, align 4
  %228 = fsub float %227, %223
  store float %228, ptr addrspace(1) %226, align 4
  %229 = shl i32 %.138, 11
  %230 = or disjoint i32 %229, 14336
  %231 = add nsw i32 %230, %5
  %232 = sext i32 %231 to i64
  %233 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %232
  %234 = load float, ptr addrspace(1) %233, align 4
  %235 = load float, ptr addrspace(1) %25, align 4
  %236 = fmul float %234, %235
  %237 = add nsw i32 %230, %17
  %238 = sext i32 %237 to i64
  %239 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %238
  %240 = load float, ptr addrspace(1) %239, align 4
  %241 = fsub float %240, %236
  store float %241, ptr addrspace(1) %239, align 4
  %242 = add nuw nsw i32 %.138, 8
  %niter49.next.7 = add i32 %niter49, 8
  %niter49.ncmp.7 = icmp eq i32 %niter49.next.7, %unroll_iter48
  br i1 %niter49.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %.lr.ph39

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph39
  %lcmp.mod46.not = icmp eq i32 %xtraiter44, 0
  br i1 %lcmp.mod46.not, label %.loopexit, label %.lr.ph39.epil.preheader

.lr.ph39.epil.preheader:                          ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph39.preheader
  %.138.epil.init = phi i32 [ 0, %.lr.ph39.preheader ], [ %242, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod47 = icmp ne i32 %xtraiter44, 0
  tail call void @llvm.assume(i1 %lcmp.mod47)
  br label %.lr.ph39.epil

.lr.ph39.epil:                                    ; preds = %.lr.ph39.epil, %.lr.ph39.epil.preheader
  %.138.epil = phi i32 [ %255, %.lr.ph39.epil ], [ %.138.epil.init, %.lr.ph39.epil.preheader ]
  %epil.iter45 = phi i32 [ %epil.iter45.next, %.lr.ph39.epil ], [ 0, %.lr.ph39.epil.preheader ]
  %243 = shl nuw nsw i32 %.138.epil, 11
  %244 = add nsw i32 %243, %5
  %245 = sext i32 %244 to i64
  %246 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %245
  %247 = load float, ptr addrspace(1) %246, align 4
  %248 = load float, ptr addrspace(1) %25, align 4
  %249 = fmul float %247, %248
  %250 = add nsw i32 %243, %17
  %251 = sext i32 %250 to i64
  %252 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %251
  %253 = load float, ptr addrspace(1) %252, align 4
  %254 = fsub float %253, %249
  store float %254, ptr addrspace(1) %252, align 4
  %255 = add nuw nsw i32 %.138.epil, 1
  %epil.iter45.next = add i32 %epil.iter45, 1
  %epil.iter45.cmp.not = icmp eq i32 %epil.iter45.next, %xtraiter44
  br i1 %epil.iter45.cmp.not, label %.loopexit, label %.lr.ph39.epil, !llvm.loop !15

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph39.epil, %21, %6
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #4

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
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
