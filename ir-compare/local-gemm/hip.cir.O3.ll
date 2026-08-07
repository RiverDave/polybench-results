; ModuleID = '/Users/davidfeliperiveraguerra/dev/polybench-results/ir-compare/gemm_minimal.cpp'
source_filename = "/Users/davidfeliperiveraguerra/dev/polybench-results/ir-compare/gemm_minimal.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_d221fc8a527e7627 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_d221fc8a527e7627 to ptr)], section "llvm.metadata"

; Function Attrs: convergent
declare i32 @__ockl_get_group_id(i32 noundef) local_unnamed_addr #0

; Function Attrs: convergent
declare i32 @__ockl_get_local_size(i32 noundef) local_unnamed_addr #0

; Function Attrs: convergent
declare i32 @__ockl_get_local_id(i32 noundef) local_unnamed_addr #0

; Function Attrs: convergent
define protected amdgpu_kernel void @gemm_kernel(i32 noundef %0, i32 noundef %1, i32 noundef %2, float noundef %3, float noundef %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef readonly captures(none) %6, ptr nofree noundef captures(none) %7) local_unnamed_addr #1 {
  %9 = addrspacecast ptr %6 to ptr addrspace(1)
  %10 = addrspacecast ptr %5 to ptr addrspace(1)
  %11 = addrspacecast ptr %7 to ptr addrspace(1)
  %12 = tail call noundef i32 @__ockl_get_group_id(i32 noundef 0) #0
  %13 = tail call noundef i32 @__ockl_get_local_size(i32 noundef 0) #0
  %14 = mul i32 %13, %12
  %15 = tail call noundef i32 @__ockl_get_local_id(i32 noundef 0) #0
  %16 = add i32 %14, %15
  %17 = tail call noundef i32 @__ockl_get_group_id(i32 noundef 1) #0
  %18 = tail call noundef i32 @__ockl_get_local_size(i32 noundef 1) #0
  %19 = mul i32 %18, %17
  %20 = tail call noundef i32 @__ockl_get_local_id(i32 noundef 1) #0
  %21 = add i32 %19, %20
  %22 = icmp sge i32 %21, %0
  %23 = icmp sge i32 %16, %1
  %24 = or i1 %23, %22
  br i1 %24, label %common.ret, label %40

common.ret.loopexit.unr-lcssa:                    ; preds = %50
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %common.ret, label %.epil.preheader

.epil.preheader:                                  ; preds = %common.ret.loopexit.unr-lcssa, %.lr.ph
  %.epil.init = phi float [ %46, %.lr.ph ], [ %154, %common.ret.loopexit.unr-lcssa ]
  %.031.epil.init = phi i32 [ 0, %.lr.ph ], [ %155, %common.ret.loopexit.unr-lcssa ]
  %lcmp.mod35 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod35)
  br label %25

25:                                               ; preds = %25, %.epil.preheader
  %26 = phi float [ %.epil.init, %.epil.preheader ], [ %38, %25 ]
  %.031.epil = phi i32 [ %.031.epil.init, %.epil.preheader ], [ %39, %25 ]
  %epil.iter = phi i32 [ 0, %.epil.preheader ], [ %epil.iter.next, %25 ]
  %27 = add nsw i32 %.031.epil, %48
  %28 = sext i32 %27 to i64
  %29 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4
  %31 = fmul float %3, %30
  %32 = mul nsw i32 %.031.epil, %1
  %33 = add nsw i32 %32, %16
  %34 = sext i32 %33 to i64
  %35 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %34
  %36 = load float, ptr addrspace(1) %35, align 4
  %37 = fmul float %31, %36
  %38 = fadd float %26, %37
  store float %38, ptr addrspace(1) %44, align 4
  %39 = add nuw nsw i32 %.031.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %common.ret, label %25, !llvm.loop !5

common.ret:                                       ; preds = %common.ret.loopexit.unr-lcssa, %25, %40, %8
  ret void

40:                                               ; preds = %8
  %41 = mul nsw i32 %21, %1
  %42 = add nsw i32 %41, %16
  %43 = sext i32 %42 to i64
  %44 = getelementptr [4 x i8], ptr addrspace(1) %11, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 4
  %46 = fmul float %4, %45
  store float %46, ptr addrspace(1) %44, align 4
  %47 = icmp sgt i32 %2, 0
  br i1 %47, label %.lr.ph, label %common.ret

.lr.ph:                                           ; preds = %40
  %48 = mul nsw i32 %21, %2
  %xtraiter = and i32 %2, 7
  %49 = icmp ult i32 %2, 8
  br i1 %49, label %.epil.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph
  %unroll_iter = and i32 %2, 2147483640
  br label %50

50:                                               ; preds = %50, %.lr.ph.new
  %51 = phi float [ %46, %.lr.ph.new ], [ %154, %50 ]
  %.031 = phi i32 [ 0, %.lr.ph.new ], [ %155, %50 ]
  %niter = phi i32 [ 0, %.lr.ph.new ], [ %niter.next.7, %50 ]
  %52 = add nsw i32 %.031, %48
  %53 = sext i32 %52 to i64
  %54 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %53
  %55 = load float, ptr addrspace(1) %54, align 4
  %56 = fmul float %3, %55
  %57 = mul nsw i32 %.031, %1
  %58 = add nsw i32 %57, %16
  %59 = sext i32 %58 to i64
  %60 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %59
  %61 = load float, ptr addrspace(1) %60, align 4
  %62 = fmul float %56, %61
  %63 = fadd float %51, %62
  store float %63, ptr addrspace(1) %44, align 4
  %64 = or disjoint i32 %.031, 1
  %65 = add nsw i32 %64, %48
  %66 = sext i32 %65 to i64
  %67 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %66
  %68 = load float, ptr addrspace(1) %67, align 4
  %69 = fmul float %3, %68
  %70 = mul nsw i32 %64, %1
  %71 = add nsw i32 %70, %16
  %72 = sext i32 %71 to i64
  %73 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %72
  %74 = load float, ptr addrspace(1) %73, align 4
  %75 = fmul float %69, %74
  %76 = fadd float %63, %75
  store float %76, ptr addrspace(1) %44, align 4
  %77 = or disjoint i32 %.031, 2
  %78 = add nsw i32 %77, %48
  %79 = sext i32 %78 to i64
  %80 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %79
  %81 = load float, ptr addrspace(1) %80, align 4
  %82 = fmul float %3, %81
  %83 = mul nsw i32 %77, %1
  %84 = add nsw i32 %83, %16
  %85 = sext i32 %84 to i64
  %86 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %85
  %87 = load float, ptr addrspace(1) %86, align 4
  %88 = fmul float %82, %87
  %89 = fadd float %76, %88
  store float %89, ptr addrspace(1) %44, align 4
  %90 = or disjoint i32 %.031, 3
  %91 = add nsw i32 %90, %48
  %92 = sext i32 %91 to i64
  %93 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %92
  %94 = load float, ptr addrspace(1) %93, align 4
  %95 = fmul float %3, %94
  %96 = mul nsw i32 %90, %1
  %97 = add nsw i32 %96, %16
  %98 = sext i32 %97 to i64
  %99 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %98
  %100 = load float, ptr addrspace(1) %99, align 4
  %101 = fmul float %95, %100
  %102 = fadd float %89, %101
  store float %102, ptr addrspace(1) %44, align 4
  %103 = or disjoint i32 %.031, 4
  %104 = add nsw i32 %103, %48
  %105 = sext i32 %104 to i64
  %106 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %105
  %107 = load float, ptr addrspace(1) %106, align 4
  %108 = fmul float %3, %107
  %109 = mul nsw i32 %103, %1
  %110 = add nsw i32 %109, %16
  %111 = sext i32 %110 to i64
  %112 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %111
  %113 = load float, ptr addrspace(1) %112, align 4
  %114 = fmul float %108, %113
  %115 = fadd float %102, %114
  store float %115, ptr addrspace(1) %44, align 4
  %116 = or disjoint i32 %.031, 5
  %117 = add nsw i32 %116, %48
  %118 = sext i32 %117 to i64
  %119 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %118
  %120 = load float, ptr addrspace(1) %119, align 4
  %121 = fmul float %3, %120
  %122 = mul nsw i32 %116, %1
  %123 = add nsw i32 %122, %16
  %124 = sext i32 %123 to i64
  %125 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %124
  %126 = load float, ptr addrspace(1) %125, align 4
  %127 = fmul float %121, %126
  %128 = fadd float %115, %127
  store float %128, ptr addrspace(1) %44, align 4
  %129 = or disjoint i32 %.031, 6
  %130 = add nsw i32 %129, %48
  %131 = sext i32 %130 to i64
  %132 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %131
  %133 = load float, ptr addrspace(1) %132, align 4
  %134 = fmul float %3, %133
  %135 = mul nsw i32 %129, %1
  %136 = add nsw i32 %135, %16
  %137 = sext i32 %136 to i64
  %138 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %137
  %139 = load float, ptr addrspace(1) %138, align 4
  %140 = fmul float %134, %139
  %141 = fadd float %128, %140
  store float %141, ptr addrspace(1) %44, align 4
  %142 = or disjoint i32 %.031, 7
  %143 = add nsw i32 %142, %48
  %144 = sext i32 %143 to i64
  %145 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %144
  %146 = load float, ptr addrspace(1) %145, align 4
  %147 = fmul float %3, %146
  %148 = mul nsw i32 %142, %1
  %149 = add nsw i32 %148, %16
  %150 = sext i32 %149 to i64
  %151 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %150
  %152 = load float, ptr addrspace(1) %151, align 4
  %153 = fmul float %147, %152
  %154 = fadd float %141, %153
  store float %154, ptr addrspace(1) %44, align 4
  %155 = add nuw nsw i32 %.031, 8
  %niter.next.7 = add i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %common.ret.loopexit.unr-lcssa, label %50
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { convergent }
attributes #1 = { convergent "amdgpu-flat-work-group-size"="1,1024" "target-cpu"="gfx942" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}

!0 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"ThinLTO", i32 0}
!4 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}

^0 = module: (path: "[Regular LTO]", hash: (0, 0, 0, 0, 0))
^1 = gv: (name: "gemm_kernel", summaries: (function: (module: ^0, flags: (linkage: external, visibility: protected, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 178, calls: ((callee: ^6, tail: 1), (callee: ^3, tail: 1), (callee: ^2, tail: 1))))) ; guid = 7836464057821857671
^2 = gv: (name: "__ockl_get_local_id") ; guid = 8161193753194270576
^3 = gv: (name: "__ockl_get_local_size") ; guid = 8246985667220920188
^4 = gv: (name: "llvm.compiler.used", summaries: (variable: (module: ^0, flags: (linkage: appending, visibility: default, notEligibleToImport: 1, live: 1, dsoLocal: 0, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), varFlags: (readonly: 0, writeonly: 0, constant: 0), refs: (^5)))) ; guid = 9610627770985738006
^5 = gv: (name: "__hip_cuid_d221fc8a527e7627", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 0, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 10557697809264738111
^6 = gv: (name: "__ockl_get_group_id") ; guid = 18245337435198022983
^7 = flags: 8
^8 = blockcount: 0
