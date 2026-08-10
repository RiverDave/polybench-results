; ModuleID = '/root/polybenchGpu/HIP/ADI/adi.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/ADI/adi.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_1b6f6897c86fa36c = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_1b6f6897c86fa36c to ptr)], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11adi_kernel1iPfS_S_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef captures(none) %2, ptr nofree noundef captures(none) %3) local_unnamed_addr #0 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %10 = getelementptr inbounds nuw i8, ptr addrspace(4) %9, i64 12
  %11 = load i16, ptr addrspace(4) %10, align 4, !tbaa !10
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %0
  %17 = icmp sgt i32 %0, 1
  %or.cond = and i1 %16, %17
  br i1 %or.cond, label %.lver.check, label %.loopexit

.lver.check:                                      ; preds = %4
  %18 = shl nsw i32 %15, 10
  %invariant.op = add i32 %18, -1
  %19 = sext i32 %18 to i64
  %20 = shl nsw i64 %19, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %5, i64 %20
  %21 = add nsw i32 %0, -2
  %22 = zext i32 %21 to i64
  %23 = add nsw i64 %19, %22
  %24 = shl nsw i64 %23, 2
  %25 = add nsw i64 %24, 8
  %scevgep42 = getelementptr i8, ptr addrspace(1) %5, i64 %25
  %scevgep43 = getelementptr i8, ptr addrspace(1) %6, i64 %20
  %scevgep44 = getelementptr i8, ptr addrspace(1) %6, i64 %25
  %bound0 = icmp ult ptr addrspace(1) %scevgep, %scevgep44
  %bound1 = icmp ult ptr addrspace(1) %scevgep43, %scevgep42
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  %26 = add nsw i32 %0, -1
  %xtraiter54 = and i32 %26, 1
  %27 = icmp eq i32 %21, 0
  br i1 %27, label %.ph.lver.orig.epil.preheader, label %.ph.lver.orig.preheader.new

.ph.lver.orig.preheader.new:                      ; preds = %.ph.lver.orig.preheader
  %unroll_iter57 = and i32 %26, -2
  %invariant.op63 = add i32 1, %18
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig, %.ph.lver.orig.preheader.new
  %.040.lver.orig = phi i32 [ 1, %.ph.lver.orig.preheader.new ], [ %69, %.ph.lver.orig ]
  %niter58 = phi i32 [ 0, %.ph.lver.orig.preheader.new ], [ %niter58.next.1, %.ph.lver.orig ]
  %28 = add nsw i32 %.040.lver.orig, %18
  %29 = sext i32 %28 to i64
  %30 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %29
  %31 = load float, ptr addrspace(1) %30, align 4
  %.reass.lver.orig = add i32 %.040.lver.orig, %invariant.op
  %32 = sext i32 %.reass.lver.orig to i64
  %33 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %32
  %34 = load float, ptr addrspace(1) %33, align 4
  %35 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %29
  %36 = load float, ptr addrspace(1) %35, align 4
  %37 = fmul float %34, %36
  %38 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %32
  %39 = load float, ptr addrspace(1) %38, align 4
  %40 = fdiv float %37, %39
  %41 = fsub float %31, %40
  store float %41, ptr addrspace(1) %30, align 4
  %42 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %29
  %43 = load float, ptr addrspace(1) %42, align 4
  %44 = load float, ptr addrspace(1) %35, align 4
  %45 = fmul float %44, %44
  %46 = load float, ptr addrspace(1) %38, align 4
  %47 = fdiv float %45, %46
  %48 = fsub float %43, %47
  store float %48, ptr addrspace(1) %42, align 4
  %.reass64 = add i32 %.040.lver.orig, %invariant.op63
  %49 = sext i32 %.reass64 to i64
  %50 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %49
  %51 = load float, ptr addrspace(1) %50, align 4
  %.reass.lver.orig.1 = add i32 %.040.lver.orig, %18
  %52 = sext i32 %.reass.lver.orig.1 to i64
  %53 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %52
  %54 = load float, ptr addrspace(1) %53, align 4
  %55 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %49
  %56 = load float, ptr addrspace(1) %55, align 4
  %57 = fmul float %54, %56
  %58 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %52
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = fdiv float %57, %59
  %61 = fsub float %51, %60
  store float %61, ptr addrspace(1) %50, align 4
  %62 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %49
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = load float, ptr addrspace(1) %55, align 4
  %65 = fmul float %64, %64
  %66 = load float, ptr addrspace(1) %58, align 4
  %67 = fdiv float %65, %66
  %68 = fsub float %63, %67
  store float %68, ptr addrspace(1) %62, align 4
  %69 = add nuw nsw i32 %.040.lver.orig, 2
  %niter58.next.1 = add nuw i32 %niter58, 2
  %niter58.ncmp.1 = icmp eq i32 %niter58.next.1, %unroll_iter57
  br i1 %niter58.ncmp.1, label %.loopexit.loopexit.unr-lcssa, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %70 = sext i32 %18 to i64
  %71 = shl nsw i64 %70, 2
  %scevgep46 = getelementptr i8, ptr addrspace(1) %5, i64 %71
  %load_initial = load float, ptr addrspace(1) %scevgep46, align 4
  %scevgep47 = getelementptr i8, ptr addrspace(1) %6, i64 %71
  %load_initial48 = load float, ptr addrspace(1) %scevgep47, align 4
  %72 = add nsw i32 %0, -1
  %xtraiter = and i32 %72, 1
  %73 = icmp eq i32 %21, 0
  br i1 %73, label %.epil.preheader, label %.ph.new

.ph.new:                                          ; preds = %.ph
  %unroll_iter = and i32 %72, -2
  %invariant.op62 = add i32 1, %18
  br label %74

74:                                               ; preds = %74, %.ph.new
  %store_forwarded49 = phi float [ %load_initial48, %.ph.new ], [ %103, %74 ]
  %store_forwarded = phi float [ %load_initial, %.ph.new ], [ %97, %74 ]
  %.040 = phi i32 [ 1, %.ph.new ], [ %104, %74 ]
  %niter = phi i32 [ 0, %.ph.new ], [ %niter.next.1, %74 ]
  %75 = add nsw i32 %.040, %18
  %76 = sext i32 %75 to i64
  %77 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %76
  %78 = load float, ptr addrspace(1) %77, align 4
  %79 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %76
  %80 = load float, ptr addrspace(1) %79, align 4
  %81 = fmul float %store_forwarded, %80
  %82 = fdiv float %81, %store_forwarded49
  %83 = fsub float %78, %82
  store float %83, ptr addrspace(1) %77, align 4
  %84 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %76
  %85 = load float, ptr addrspace(1) %84, align 4
  %86 = load float, ptr addrspace(1) %79, align 4
  %87 = fmul float %86, %86
  %88 = fdiv float %87, %store_forwarded49
  %89 = fsub float %85, %88
  store float %89, ptr addrspace(1) %84, align 4
  %.reass = add i32 %.040, %invariant.op62
  %90 = sext i32 %.reass to i64
  %91 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %90
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %90
  %94 = load float, ptr addrspace(1) %93, align 4
  %95 = fmul float %83, %94
  %96 = fdiv float %95, %89
  %97 = fsub float %92, %96
  store float %97, ptr addrspace(1) %91, align 4
  %98 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %90
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = load float, ptr addrspace(1) %93, align 4
  %101 = fmul float %100, %100
  %102 = fdiv float %101, %89
  %103 = fsub float %99, %102
  store float %103, ptr addrspace(1) %98, align 4
  %104 = add nuw nsw i32 %.040, 2
  %niter.next.1 = add nuw i32 %niter, 2
  %niter.ncmp.1 = icmp eq i32 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %.loopexit.loopexit52.unr-lcssa, label %74

.loopexit.loopexit.unr-lcssa:                     ; preds = %.ph.lver.orig
  %lcmp.mod55.not = icmp eq i32 %xtraiter54, 0
  br i1 %lcmp.mod55.not, label %.loopexit, label %.ph.lver.orig.epil.preheader

.ph.lver.orig.epil.preheader:                     ; preds = %.loopexit.loopexit.unr-lcssa, %.ph.lver.orig.preheader
  %.040.lver.orig.epil.init = phi i32 [ 1, %.ph.lver.orig.preheader ], [ %69, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod56 = trunc i32 %26 to i1
  tail call void @llvm.assume(i1 %lcmp.mod56)
  %105 = add nsw i32 %.040.lver.orig.epil.init, %18
  %106 = sext i32 %105 to i64
  %107 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %106
  %108 = load float, ptr addrspace(1) %107, align 4
  %.reass.lver.orig.epil = add i32 %.040.lver.orig.epil.init, %invariant.op
  %109 = sext i32 %.reass.lver.orig.epil to i64
  %110 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %109
  %111 = load float, ptr addrspace(1) %110, align 4
  %112 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %106
  %113 = load float, ptr addrspace(1) %112, align 4
  %114 = fmul float %111, %113
  %115 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %109
  %116 = load float, ptr addrspace(1) %115, align 4
  %117 = fdiv float %114, %116
  %118 = fsub float %108, %117
  store float %118, ptr addrspace(1) %107, align 4
  %119 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %106
  %120 = load float, ptr addrspace(1) %119, align 4
  %121 = load float, ptr addrspace(1) %112, align 4
  %122 = fmul float %121, %121
  %123 = load float, ptr addrspace(1) %115, align 4
  %124 = fdiv float %122, %123
  %125 = fsub float %120, %124
  store float %125, ptr addrspace(1) %119, align 4
  br label %.loopexit

.loopexit.loopexit52.unr-lcssa:                   ; preds = %74
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit52.unr-lcssa, %.ph
  %store_forwarded49.epil.init = phi float [ %load_initial48, %.ph ], [ %103, %.loopexit.loopexit52.unr-lcssa ]
  %store_forwarded.epil.init = phi float [ %load_initial, %.ph ], [ %97, %.loopexit.loopexit52.unr-lcssa ]
  %.040.epil.init = phi i32 [ 1, %.ph ], [ %104, %.loopexit.loopexit52.unr-lcssa ]
  %lcmp.mod53 = trunc i32 %72 to i1
  tail call void @llvm.assume(i1 %lcmp.mod53)
  %126 = add nsw i32 %.040.epil.init, %18
  %127 = sext i32 %126 to i64
  %128 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %127
  %129 = load float, ptr addrspace(1) %128, align 4
  %130 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %127
  %131 = load float, ptr addrspace(1) %130, align 4
  %132 = fmul float %store_forwarded.epil.init, %131
  %133 = fdiv float %132, %store_forwarded49.epil.init
  %134 = fsub float %129, %133
  store float %134, ptr addrspace(1) %128, align 4
  %135 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %127
  %136 = load float, ptr addrspace(1) %135, align 4
  %137 = load float, ptr addrspace(1) %130, align 4
  %138 = fmul float %137, %137
  %139 = fdiv float %138, %store_forwarded49.epil.init
  %140 = fsub float %136, %139
  store float %140, ptr addrspace(1) %135, align 4
  br label %.loopexit

.loopexit:                                        ; preds = %.epil.preheader, %.loopexit.loopexit52.unr-lcssa, %.ph.lver.orig.epil.preheader, %.loopexit.loopexit.unr-lcssa, %4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11adi_kernel2iPfS_S_(i32 noundef %0, ptr nofree noundef readnone captures(none) %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef captures(none) %3) local_unnamed_addr #1 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %9 = getelementptr inbounds nuw i8, ptr addrspace(4) %8, i64 12
  %10 = load i16, ptr addrspace(4) %9, align 4, !tbaa !10
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %0
  br i1 %15, label %16, label %25

16:                                               ; preds = %4
  %17 = shl nsw i32 %14, 10
  %18 = or disjoint i32 %17, 1023
  %19 = sext i32 %18 to i64
  %20 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %19
  %21 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %19
  %22 = load float, ptr addrspace(1) %21, align 4
  %23 = load float, ptr addrspace(1) %20, align 4
  %24 = fdiv float %22, %23
  store float %24, ptr addrspace(1) %21, align 4
  br label %25

25:                                               ; preds = %4, %16
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11adi_kernel3iPfS_S_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef captures(none) %3) local_unnamed_addr #0 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %10 = getelementptr inbounds nuw i8, ptr addrspace(4) %9, i64 12
  %11 = load i16, ptr addrspace(4) %10, align 4, !tbaa !10
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %0
  %17 = icmp sgt i32 %0, 2
  %or.cond = and i1 %16, %17
  br i1 %or.cond, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %4
  %18 = shl nsw i32 %15, 10
  %19 = add nsw i32 %0, -3
  %20 = add nsw i32 %0, -2
  %xtraiter = and i32 %20, 3
  %21 = icmp ult i32 %19, 3
  br i1 %21, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %20, -4
  br label %22

22:                                               ; preds = %22, %.lr.ph.new
  %.029 = phi i32 [ 0, %.lr.ph.new ], [ %82, %22 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.3, %22 ]
  %reass.sub = sub i32 %18, %.029
  %23 = add i32 %reass.sub, 1022
  %24 = sext i32 %23 to i64
  %25 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %24
  %26 = load float, ptr addrspace(1) %25, align 4
  %27 = add i32 %reass.sub, 1021
  %28 = sext i32 %27 to i64
  %29 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4
  %31 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %28
  %32 = load float, ptr addrspace(1) %31, align 4
  %33 = fmul float %30, %32
  %34 = fsub float %26, %33
  %35 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %28
  %36 = load float, ptr addrspace(1) %35, align 4
  %37 = fdiv float %34, %36
  store float %37, ptr addrspace(1) %25, align 4
  %.neg = xor i32 %.029, -1
  %reass.sub.1 = add i32 %18, %.neg
  %38 = add i32 %reass.sub.1, 1022
  %39 = sext i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %39
  %41 = add i32 %reass.sub.1, 1021
  %42 = sext i32 %41 to i64
  %43 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %42
  %44 = load float, ptr addrspace(1) %43, align 4
  %45 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %42
  %46 = load float, ptr addrspace(1) %45, align 4
  %47 = fmul float %44, %46
  %48 = fsub float %30, %47
  %49 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %42
  %50 = load float, ptr addrspace(1) %49, align 4
  %51 = fdiv float %48, %50
  store float %51, ptr addrspace(1) %40, align 4
  %52 = or disjoint i32 %.029, 2
  %reass.sub.2 = sub i32 %18, %52
  %53 = add i32 %reass.sub.2, 1022
  %54 = sext i32 %53 to i64
  %55 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %54
  %56 = add i32 %reass.sub.2, 1021
  %57 = sext i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %57
  %61 = load float, ptr addrspace(1) %60, align 4
  %62 = fmul float %59, %61
  %63 = fsub float %44, %62
  %64 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %57
  %65 = load float, ptr addrspace(1) %64, align 4
  %66 = fdiv float %63, %65
  store float %66, ptr addrspace(1) %55, align 4
  %67 = or disjoint i32 %.029, 3
  %reass.sub.3 = sub i32 %18, %67
  %68 = add i32 %reass.sub.3, 1022
  %69 = sext i32 %68 to i64
  %70 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %69
  %71 = add i32 %reass.sub.3, 1021
  %72 = sext i32 %71 to i64
  %73 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %72
  %74 = load float, ptr addrspace(1) %73, align 4
  %75 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %72
  %76 = load float, ptr addrspace(1) %75, align 4
  %77 = fmul float %74, %76
  %78 = fsub float %59, %77
  %79 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %72
  %80 = load float, ptr addrspace(1) %79, align 4
  %81 = fdiv float %78, %80
  store float %81, ptr addrspace(1) %70, align 4
  %82 = add nuw nsw i32 %.029, 4
  %niter.next.3 = add i32 %niter, 4
  %niter.ncmp.3 = icmp eq i32 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.loopexit.loopexit.unr-lcssa, label %22

.loopexit.loopexit.unr-lcssa:                     ; preds = %22
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %.loopexit, label %.epil.preheader

.epil.preheader:                                  ; preds = %.loopexit.loopexit.unr-lcssa, %.lr.ph
  %.029.epil.init = phi i32 [ 0, %.lr.ph ], [ %82, %.loopexit.loopexit.unr-lcssa ]
  %lcmp.mod31 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod31)
  br label %83

83:                                               ; preds = %83, %.epil.preheader
  %.029.epil = phi i32 [ %.029.epil.init, %.epil.preheader ], [ %99, %83 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %83 ]
  %reass.sub.epil = sub i32 %18, %.029.epil
  %84 = add i32 %reass.sub.epil, 1022
  %85 = sext i32 %84 to i64
  %86 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %85
  %87 = load float, ptr addrspace(1) %86, align 4
  %88 = add i32 %reass.sub.epil, 1021
  %89 = sext i32 %88 to i64
  %90 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %89
  %91 = load float, ptr addrspace(1) %90, align 4
  %92 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %89
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = fmul float %91, %93
  %95 = fsub float %87, %94
  %96 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %89
  %97 = load float, ptr addrspace(1) %96, align 4
  %98 = fdiv float %95, %97
  store float %98, ptr addrspace(1) %86, align 4
  %99 = add nuw nsw i32 %.029.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %.loopexit, label %83, !llvm.loop !12

.loopexit:                                        ; preds = %.loopexit.loopexit.unr-lcssa, %83, %4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11adi_kernel4iPfS_S_i(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef captures(none) %2, ptr nofree noundef captures(none) %3, i32 noundef %4) local_unnamed_addr #1 {
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %1 to ptr addrspace(1)
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %11 = getelementptr inbounds nuw i8, ptr addrspace(4) %10, i64 12
  %12 = load i16, ptr addrspace(4) %11, align 4, !tbaa !10
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %43

18:                                               ; preds = %5
  %19 = shl nsw i32 %4, 10
  %20 = add nsw i32 %16, %19
  %21 = sext i32 %20 to i64
  %22 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 4
  %24 = add i32 %19, -1024
  %25 = add nsw i32 %24, %16
  %26 = sext i32 %25 to i64
  %27 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %26
  %28 = load float, ptr addrspace(1) %27, align 4
  %29 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %21
  %30 = load float, ptr addrspace(1) %29, align 4
  %31 = fmul float %28, %30
  %32 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %26
  %33 = load float, ptr addrspace(1) %32, align 4
  %34 = fdiv float %31, %33
  %35 = fsub float %23, %34
  store float %35, ptr addrspace(1) %22, align 4
  %36 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %21
  %37 = load float, ptr addrspace(1) %36, align 4
  %38 = load float, ptr addrspace(1) %29, align 4
  %39 = fmul float %38, %38
  %40 = load float, ptr addrspace(1) %32, align 4
  %41 = fdiv float %39, %40
  %42 = fsub float %37, %41
  store float %42, ptr addrspace(1) %36, align 4
  br label %43

43:                                               ; preds = %5, %18
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11adi_kernel5iPfS_S_(i32 noundef %0, ptr nofree noundef readnone captures(none) %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef captures(none) %3) local_unnamed_addr #1 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %9 = getelementptr inbounds nuw i8, ptr addrspace(4) %8, i64 12
  %10 = load i16, ptr addrspace(4) %9, align 4, !tbaa !10
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %0
  br i1 %15, label %16, label %24

16:                                               ; preds = %4
  %17 = add nsw i32 %14, 1047552
  %18 = sext i32 %17 to i64
  %19 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %18
  %20 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %18
  %21 = load float, ptr addrspace(1) %20, align 4
  %22 = load float, ptr addrspace(1) %19, align 4
  %23 = fdiv float %21, %22
  store float %23, ptr addrspace(1) %20, align 4
  br label %24

24:                                               ; preds = %4, %16
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z11adi_kernel6iPfS_S_i(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef captures(none) %3, i32 noundef %4) local_unnamed_addr #1 {
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %1 to ptr addrspace(1)
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %11 = getelementptr inbounds nuw i8, ptr addrspace(4) %10, i64 12
  %12 = load i16, ptr addrspace(4) %11, align 4, !tbaa !10
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %35

18:                                               ; preds = %5
  %19 = shl i32 %4, 10
  %reass.sub = sub i32 %16, %19
  %20 = add i32 %reass.sub, 1046528
  %21 = sext i32 %20 to i64
  %22 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 4
  %24 = add i32 %reass.sub, 1045504
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4
  %28 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %25
  %29 = load float, ptr addrspace(1) %28, align 4
  %30 = fmul float %27, %29
  %31 = fsub float %23, %30
  %32 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %21
  %33 = load float, ptr addrspace(1) %32, align 4
  %34 = fdiv float %31, %33
  store float %34, ptr addrspace(1) %22, align 4
  br label %35

35:                                               ; preds = %5, %18
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
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
