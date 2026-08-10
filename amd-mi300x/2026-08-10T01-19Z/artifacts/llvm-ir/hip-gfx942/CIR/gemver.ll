; ModuleID = '/root/polybenchGpu/HIP/GEMVER/gemver.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/GEMVER/gemver.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_29e4be3e54f9a756 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_29e4be3e54f9a756 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z14gemver_kernel1iffPfS_S_S_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr nofree noundef captures(none) %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef readonly captures(none) %7) local_unnamed_addr #0 {
  %9 = addrspacecast ptr %7 to ptr addrspace(1)
  %10 = addrspacecast ptr %6 to ptr addrspace(1)
  %11 = addrspacecast ptr %5 to ptr addrspace(1)
  %12 = addrspacecast ptr %4 to ptr addrspace(1)
  %13 = addrspacecast ptr %3 to ptr addrspace(1)
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %16 = getelementptr inbounds nuw i8, ptr addrspace(4) %15, i64 12
  %.in.i = load i16, ptr addrspace(4) %16, align 4, !tbaa !10
  %17 = zext i16 %.in.i to i32
  %18 = mul i32 %14, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr inbounds nuw i8, ptr addrspace(4) %15, i64 14
  %.in.i15 = load i16, ptr addrspace(4) %22, align 2, !tbaa !10
  %23 = zext i16 %.in.i15 to i32
  %24 = mul i32 %21, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %26, %0
  %28 = icmp slt i32 %20, %0
  %29 = and i1 %28, %27
  br i1 %29, label %30, label %50

30:                                               ; preds = %8
  %31 = sext i32 %26 to i64
  %32 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 4
  %34 = sext i32 %20 to i64
  %35 = getelementptr [4 x i8], ptr addrspace(1) %12, i64 %34
  %36 = load float, ptr addrspace(1) %35, align 4
  %37 = fmul float %33, %36
  %38 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %31
  %39 = load float, ptr addrspace(1) %38, align 4
  %40 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %34
  %41 = load float, ptr addrspace(1) %40, align 4
  %42 = fmul float %39, %41
  %43 = fadd float %37, %42
  %44 = shl nsw i32 %26, 12
  %45 = add nsw i32 %44, %20
  %46 = sext i32 %45 to i64
  %47 = getelementptr [4 x i8], ptr addrspace(1) %13, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4
  %49 = fadd float %48, %43
  store float %49, ptr addrspace(1) %47, align 4
  br label %50

50:                                               ; preds = %8, %30
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z14gemver_kernel2iffPfS_S_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef captures(none) %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6) local_unnamed_addr #1 {
  %8 = addrspacecast ptr %6 to ptr addrspace(1)
  %9 = addrspacecast ptr %5 to ptr addrspace(1)
  %10 = addrspacecast ptr %4 to ptr addrspace(1)
  %11 = addrspacecast ptr %3 to ptr addrspace(1)
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %14 = getelementptr inbounds nuw i8, ptr addrspace(4) %13, i64 12
  %.in.i = load i16, ptr addrspace(4) %14, align 4, !tbaa !10
  %15 = zext i16 %.in.i to i32
  %16 = mul i32 %12, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %18 = add i32 %16, %17
  %19 = icmp slt i32 %18, %0
  br i1 %19, label %.preheader, label %139

.preheader:                                       ; preds = %7
  %20 = icmp sgt i32 %0, 0
  %21 = sext i32 %18 to i64
  %22 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %21
  %.promoted = load float, ptr addrspace(1) %22, align 4
  br i1 %20, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i32 %0, 7
  %23 = icmp ult i32 %0, 8
  br i1 %23, label %.lr.ph.epil.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.preheader
  %unroll_iter = and i32 %0, 2147483640
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %24 = phi float [ %.promoted, %.lr.ph.preheader.new ], [ %119, %.lr.ph ]
  %.024 = phi i32 [ 0, %.lr.ph.preheader.new ], [ %120, %.lr.ph ]
  %niter = phi i32 [ 0, %.lr.ph.preheader.new ], [ %niter.next.7, %.lr.ph ]
  %25 = shl nuw nsw i32 %.024, 12
  %26 = add nsw i32 %25, %18
  %27 = sext i32 %26 to i64
  %28 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 4
  %30 = fmul float %2, %29
  %31 = zext nneg i32 %.024 to i64
  %32 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 4
  %34 = fmul float %30, %33
  %35 = fadd float %24, %34
  store float %35, ptr addrspace(1) %22, align 4
  %36 = or disjoint i32 %.024, 1
  %37 = shl nuw nsw i32 %36, 12
  %38 = add nsw i32 %37, %18
  %39 = sext i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %39
  %41 = load float, ptr addrspace(1) %40, align 4
  %42 = fmul float %2, %41
  %43 = zext nneg i32 %36 to i64
  %44 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 4
  %46 = fmul float %42, %45
  %47 = fadd float %35, %46
  store float %47, ptr addrspace(1) %22, align 4
  %48 = or disjoint i32 %.024, 2
  %49 = shl nuw nsw i32 %48, 12
  %50 = add nsw i32 %49, %18
  %51 = sext i32 %50 to i64
  %52 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %51
  %53 = load float, ptr addrspace(1) %52, align 4
  %54 = fmul float %2, %53
  %55 = zext nneg i32 %48 to i64
  %56 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %55
  %57 = load float, ptr addrspace(1) %56, align 4
  %58 = fmul float %54, %57
  %59 = fadd float %47, %58
  store float %59, ptr addrspace(1) %22, align 4
  %60 = or disjoint i32 %.024, 3
  %61 = shl nuw nsw i32 %60, 12
  %62 = add nsw i32 %61, %18
  %63 = sext i32 %62 to i64
  %64 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %63
  %65 = load float, ptr addrspace(1) %64, align 4
  %66 = fmul float %2, %65
  %67 = zext nneg i32 %60 to i64
  %68 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %67
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = fmul float %66, %69
  %71 = fadd float %59, %70
  store float %71, ptr addrspace(1) %22, align 4
  %72 = or disjoint i32 %.024, 4
  %73 = shl nuw nsw i32 %72, 12
  %74 = add nsw i32 %73, %18
  %75 = sext i32 %74 to i64
  %76 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %75
  %77 = load float, ptr addrspace(1) %76, align 4
  %78 = fmul float %2, %77
  %79 = zext nneg i32 %72 to i64
  %80 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %79
  %81 = load float, ptr addrspace(1) %80, align 4
  %82 = fmul float %78, %81
  %83 = fadd float %71, %82
  store float %83, ptr addrspace(1) %22, align 4
  %84 = or disjoint i32 %.024, 5
  %85 = shl nuw nsw i32 %84, 12
  %86 = add nsw i32 %85, %18
  %87 = sext i32 %86 to i64
  %88 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %87
  %89 = load float, ptr addrspace(1) %88, align 4
  %90 = fmul float %2, %89
  %91 = zext nneg i32 %84 to i64
  %92 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %91
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = fmul float %90, %93
  %95 = fadd float %83, %94
  store float %95, ptr addrspace(1) %22, align 4
  %96 = or disjoint i32 %.024, 6
  %97 = shl nuw nsw i32 %96, 12
  %98 = add nsw i32 %97, %18
  %99 = sext i32 %98 to i64
  %100 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %99
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = fmul float %2, %101
  %103 = zext nneg i32 %96 to i64
  %104 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %103
  %105 = load float, ptr addrspace(1) %104, align 4
  %106 = fmul float %102, %105
  %107 = fadd float %95, %106
  store float %107, ptr addrspace(1) %22, align 4
  %108 = or disjoint i32 %.024, 7
  %109 = shl nuw nsw i32 %108, 12
  %110 = add nsw i32 %109, %18
  %111 = sext i32 %110 to i64
  %112 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %111
  %113 = load float, ptr addrspace(1) %112, align 4
  %114 = fmul float %2, %113
  %115 = zext nneg i32 %108 to i64
  %116 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %115
  %117 = load float, ptr addrspace(1) %116, align 4
  %118 = fmul float %114, %117
  %119 = fadd float %107, %118
  store float %119, ptr addrspace(1) %22, align 4
  %120 = add nuw nsw i32 %.024, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %._crit_edge, label %.lr.ph.epil.preheader

.lr.ph.epil.preheader:                            ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.preheader
  %.epil.init = phi float [ %.promoted, %.lr.ph.preheader ], [ %119, %._crit_edge.loopexit.unr-lcssa ]
  %.024.epil.init = phi i32 [ 0, %.lr.ph.preheader ], [ %120, %._crit_edge.loopexit.unr-lcssa ]
  %lcmp.mod28 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod28)
  br label %.lr.ph.epil

.lr.ph.epil:                                      ; preds = %.lr.ph.epil, %.lr.ph.epil.preheader
  %121 = phi float [ %132, %.lr.ph.epil ], [ %.epil.init, %.lr.ph.epil.preheader ]
  %.024.epil = phi i32 [ %133, %.lr.ph.epil ], [ %.024.epil.init, %.lr.ph.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %.lr.ph.epil ], [ 0, %.lr.ph.epil.preheader ]
  %122 = shl nuw nsw i32 %.024.epil, 12
  %123 = add nsw i32 %122, %18
  %124 = sext i32 %123 to i64
  %125 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %124
  %126 = load float, ptr addrspace(1) %125, align 4
  %127 = fmul float %2, %126
  %128 = zext nneg i32 %.024.epil to i64
  %129 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %128
  %130 = load float, ptr addrspace(1) %129, align 4
  %131 = fmul float %127, %130
  %132 = fadd float %121, %131
  store float %132, ptr addrspace(1) %22, align 4
  %133 = add nuw nsw i32 %.024.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %._crit_edge, label %.lr.ph.epil, !llvm.loop !12

._crit_edge:                                      ; preds = %._crit_edge.loopexit.unr-lcssa, %.lr.ph.epil, %.preheader
  %134 = phi float [ %.promoted, %.preheader ], [ %119, %._crit_edge.loopexit.unr-lcssa ], [ %132, %.lr.ph.epil ]
  %135 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %21
  %136 = load float, ptr addrspace(1) %135, align 4
  %137 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %21
  %138 = fadd float %136, %134
  store float %138, ptr addrspace(1) %137, align 4
  br label %139

139:                                              ; preds = %7, %._crit_edge
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z14gemver_kernel3iffPfS_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef captures(none) %5) local_unnamed_addr #1 {
  %7 = addrspacecast ptr %4 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = addrspacecast ptr %5 to ptr addrspace(1)
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %12 = getelementptr inbounds nuw i8, ptr addrspace(4) %11, i64 12
  %.in.i = load i16, ptr addrspace(4) %12, align 4, !tbaa !10
  %13 = zext i16 %.in.i to i32
  %14 = mul i32 %10, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %16 = add i32 %14, %15
  %17 = icmp sgt i32 %16, -1
  %18 = icmp slt i32 %16, %0
  %19 = and i1 %17, %18
  %20 = icmp sgt i32 %0, 0
  %or.cond = and i1 %19, %20
  br i1 %or.cond, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %6
  %21 = shl nsw i32 %16, 12
  %22 = zext nneg i32 %16 to i64
  %23 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %22
  %.promoted = load float, ptr addrspace(1) %23, align 4
  %xtraiter = and i32 %0, 7
  %24 = icmp ult i32 %0, 8
  br i1 %24, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %0, 2147483640
  br label %25

25:                                               ; preds = %25, %.lr.ph.new
  %26 = phi float [ %.promoted, %.lr.ph.new ], [ %113, %25 ]
  %.019 = phi i32 [ 0, %.lr.ph.new ], [ %114, %25 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.7, %25 ]
  %27 = add nuw nsw i32 %.019, %21
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4
  %31 = fmul float %1, %30
  %32 = zext nneg i32 %.019 to i64
  %33 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %32
  %34 = load float, ptr addrspace(1) %33, align 4
  %35 = fmul float %31, %34
  %36 = fadd float %26, %35
  store float %36, ptr addrspace(1) %23, align 4
  %37 = or disjoint i32 %.019, 1
  %38 = add nuw nsw i32 %37, %21
  %39 = zext nneg i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %39
  %41 = load float, ptr addrspace(1) %40, align 4
  %42 = fmul float %1, %41
  %43 = zext nneg i32 %37 to i64
  %44 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 4
  %46 = fmul float %42, %45
  %47 = fadd float %36, %46
  store float %47, ptr addrspace(1) %23, align 4
  %48 = or disjoint i32 %.019, 2
  %49 = add nuw nsw i32 %48, %21
  %50 = zext nneg i32 %49 to i64
  %51 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %50
  %52 = load float, ptr addrspace(1) %51, align 4
  %53 = fmul float %1, %52
  %54 = zext nneg i32 %48 to i64
  %55 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %54
  %56 = load float, ptr addrspace(1) %55, align 4
  %57 = fmul float %53, %56
  %58 = fadd float %47, %57
  store float %58, ptr addrspace(1) %23, align 4
  %59 = or disjoint i32 %.019, 3
  %60 = add nuw nsw i32 %59, %21
  %61 = zext nneg i32 %60 to i64
  %62 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = fmul float %1, %63
  %65 = zext nneg i32 %59 to i64
  %66 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = fmul float %64, %67
  %69 = fadd float %58, %68
  store float %69, ptr addrspace(1) %23, align 4
  %70 = or disjoint i32 %.019, 4
  %71 = add nuw nsw i32 %70, %21
  %72 = zext nneg i32 %71 to i64
  %73 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %72
  %74 = load float, ptr addrspace(1) %73, align 4
  %75 = fmul float %1, %74
  %76 = zext nneg i32 %70 to i64
  %77 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %76
  %78 = load float, ptr addrspace(1) %77, align 4
  %79 = fmul float %75, %78
  %80 = fadd float %69, %79
  store float %80, ptr addrspace(1) %23, align 4
  %81 = or disjoint i32 %.019, 5
  %82 = add nuw nsw i32 %81, %21
  %83 = zext nneg i32 %82 to i64
  %84 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %83
  %85 = load float, ptr addrspace(1) %84, align 4
  %86 = fmul float %1, %85
  %87 = zext nneg i32 %81 to i64
  %88 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %87
  %89 = load float, ptr addrspace(1) %88, align 4
  %90 = fmul float %86, %89
  %91 = fadd float %80, %90
  store float %91, ptr addrspace(1) %23, align 4
  %92 = or disjoint i32 %.019, 6
  %93 = add nuw nsw i32 %92, %21
  %94 = zext nneg i32 %93 to i64
  %95 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %94
  %96 = load float, ptr addrspace(1) %95, align 4
  %97 = fmul float %1, %96
  %98 = zext nneg i32 %92 to i64
  %99 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %98
  %100 = load float, ptr addrspace(1) %99, align 4
  %101 = fmul float %97, %100
  %102 = fadd float %91, %101
  store float %102, ptr addrspace(1) %23, align 4
  %103 = or disjoint i32 %.019, 7
  %104 = add nuw nsw i32 %103, %21
  %105 = zext nneg i32 %104 to i64
  %106 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %105
  %107 = load float, ptr addrspace(1) %106, align 4
  %108 = fmul float %1, %107
  %109 = zext nneg i32 %103 to i64
  %110 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %109
  %111 = load float, ptr addrspace(1) %110, align 4
  %112 = fmul float %108, %111
  %113 = fadd float %102, %112
  store float %113, ptr addrspace(1) %23, align 4
  %114 = add nuw nsw i32 %.019, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %.loopexit.loopexit.unr-lcssa, label %25

.loopexit.loopexit.unr-lcssa:                     ; preds = %25
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ %.promoted, %.lr.ph ], [ %113, %.loopexit.loopexit.unr-lcssa ]
  %.019.epil.init = phi i32 [ 0, %.lr.ph ], [ %114, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod21 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod21)
  br label %115

115:                                              ; preds = %115, %.epil.preheader
  %116 = phi float [ %.epil.init, %.epil.preheader ], [ %126, %115 ]
  %.019.epil = phi i32 [ %.019.epil.init, %.epil.preheader ], [ %127, %115 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %115 ]
  %117 = add nuw nsw i32 %.019.epil, %21
  %118 = zext nneg i32 %117 to i64
  %119 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %118
  %120 = load float, ptr addrspace(1) %119, align 4
  %121 = fmul float %1, %120
  %122 = zext nneg i32 %.019.epil to i64
  %123 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %122
  %124 = load float, ptr addrspace(1) %123, align 4
  %125 = fmul float %121, %124
  %126 = fadd float %116, %125
  store float %126, ptr addrspace(1) %23, align 4
  %127 = add nuw nsw i32 %.019.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %115, !llvm.loop !14

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %115, %6
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

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
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
