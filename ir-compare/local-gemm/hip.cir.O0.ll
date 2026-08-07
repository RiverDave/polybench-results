; ModuleID = '/Users/davidfeliperiveraguerra/dev/polybench-results/ir-compare/gemm_minimal.cpp'
source_filename = "/Users/davidfeliperiveraguerra/dev/polybench-results/ir-compare/gemm_minimal.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_45e74cb13a028356 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_45e74cb13a028356 to ptr)], section "llvm.metadata"

; Function Attrs: convergent
declare i32 @__ockl_get_group_id(i32 noundef) #0

; Function Attrs: convergent noinline
define internal noundef i32 @_ZL8block_idj(i32 noundef %0) #1 {
  %2 = alloca i32, i64 1, align 4, addrspace(5)
  %3 = alloca i32, i64 1, align 4, addrspace(5)
  store i32 %0, ptr addrspace(5) %2, align 4
  %4 = load i32, ptr addrspace(5) %2, align 4
  %5 = call i32 @__ockl_get_group_id(i32 noundef %4) #0
  store i32 %5, ptr addrspace(5) %3, align 4
  %6 = load i32, ptr addrspace(5) %3, align 4
  ret i32 %6
}

; Function Attrs: convergent
declare i32 @__ockl_get_local_size(i32 noundef) #0

; Function Attrs: convergent noinline
define internal noundef i32 @_ZL10block_sizej(i32 noundef %0) #1 {
  %2 = alloca i32, i64 1, align 4, addrspace(5)
  %3 = alloca i32, i64 1, align 4, addrspace(5)
  store i32 %0, ptr addrspace(5) %2, align 4
  %4 = load i32, ptr addrspace(5) %2, align 4
  %5 = call i32 @__ockl_get_local_size(i32 noundef %4) #0
  store i32 %5, ptr addrspace(5) %3, align 4
  %6 = load i32, ptr addrspace(5) %3, align 4
  ret i32 %6
}

; Function Attrs: convergent
declare i32 @__ockl_get_local_id(i32 noundef) #0

; Function Attrs: convergent noinline
define internal noundef i32 @_ZL9thread_idj(i32 noundef %0) #1 {
  %2 = alloca i32, i64 1, align 4, addrspace(5)
  %3 = alloca i32, i64 1, align 4, addrspace(5)
  store i32 %0, ptr addrspace(5) %2, align 4
  %4 = load i32, ptr addrspace(5) %2, align 4
  %5 = call i32 @__ockl_get_local_id(i32 noundef %4) #0
  store i32 %5, ptr addrspace(5) %3, align 4
  %6 = load i32, ptr addrspace(5) %3, align 4
  ret i32 %6
}

; Function Attrs: convergent noinline
define protected amdgpu_kernel void @gemm_kernel(i32 noundef %0, i32 noundef %1, i32 noundef %2, float noundef %3, float noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) #2 {
  %9 = alloca i32, i64 1, align 4, addrspace(5)
  %10 = alloca i32, i64 1, align 4, addrspace(5)
  %11 = alloca i32, i64 1, align 4, addrspace(5)
  %12 = alloca i32, i64 1, align 4, addrspace(5)
  %13 = alloca float, i64 1, align 4, addrspace(5)
  %14 = alloca float, i64 1, align 4, addrspace(5)
  %15 = alloca ptr, i64 1, align 8, addrspace(5)
  %16 = alloca ptr, i64 1, align 8, addrspace(5)
  %17 = alloca ptr, i64 1, align 8, addrspace(5)
  %18 = alloca i32, i64 1, align 4, addrspace(5)
  %19 = alloca i32, i64 1, align 4, addrspace(5)
  %20 = alloca i32, i64 1, align 4, addrspace(5)
  %21 = addrspacecast ptr addrspace(5) %20 to ptr
  %22 = addrspacecast ptr addrspace(5) %19 to ptr
  %23 = addrspacecast ptr addrspace(5) %18 to ptr
  store i32 %0, ptr addrspace(5) %10, align 4
  store i32 %1, ptr addrspace(5) %11, align 4
  store i32 %2, ptr addrspace(5) %12, align 4
  store float %3, ptr addrspace(5) %13, align 4
  store float %4, ptr addrspace(5) %14, align 4
  store ptr %5, ptr addrspace(5) %15, align 8
  store ptr %6, ptr addrspace(5) %16, align 8
  store ptr %7, ptr addrspace(5) %17, align 8
  %24 = call noundef i32 @_ZL8block_idj(i32 noundef 0) #0
  %25 = call noundef i32 @_ZL10block_sizej(i32 noundef 0) #0
  %26 = mul i32 %24, %25
  %27 = call noundef i32 @_ZL9thread_idj(i32 noundef 0) #0
  %28 = add i32 %26, %27
  store i32 %28, ptr %23, align 4
  %29 = call noundef i32 @_ZL8block_idj(i32 noundef 1) #0
  %30 = call noundef i32 @_ZL10block_sizej(i32 noundef 1) #0
  %31 = mul i32 %29, %30
  %32 = call noundef i32 @_ZL9thread_idj(i32 noundef 1) #0
  %33 = add i32 %31, %32
  store i32 %33, ptr %22, align 4
  br label %34

34:                                               ; preds = %8
  %35 = load i32, ptr %22, align 4
  %36 = load i32, ptr addrspace(5) %10, align 4
  %37 = icmp sge i32 %35, %36
  br i1 %37, label %38, label %39

38:                                               ; preds = %34
  br label %43

39:                                               ; preds = %34
  %40 = load i32, ptr %23, align 4
  %41 = load i32, ptr addrspace(5) %11, align 4
  %42 = icmp sge i32 %40, %41
  br label %43

43:                                               ; preds = %38, %39
  %44 = phi i1 [ %42, %39 ], [ true, %38 ]
  br label %45

45:                                               ; preds = %43
  br i1 %44, label %46, label %47

46:                                               ; preds = %45
  ret void

47:                                               ; preds = %45
  br label %48

48:                                               ; preds = %47
  %49 = load i32, ptr %22, align 4
  %50 = load i32, ptr addrspace(5) %11, align 4
  %51 = mul nsw i32 %49, %50
  %52 = load i32, ptr %23, align 4
  %53 = add nsw i32 %51, %52
  store i32 %53, ptr %21, align 4
  %54 = load float, ptr addrspace(5) %14, align 4
  %55 = load i32, ptr %21, align 4
  %56 = sext i32 %55 to i64
  %57 = load ptr, ptr addrspace(5) %17, align 8
  %58 = getelementptr float, ptr %57, i64 %56
  %59 = load float, ptr %58, align 4
  %60 = fmul float %59, %54
  store float %60, ptr %58, align 4
  br label %61

61:                                               ; preds = %48
  %62 = addrspacecast ptr addrspace(5) %9 to ptr
  store i32 0, ptr %62, align 4
  br label %63

63:                                               ; preds = %95, %61
  %64 = load i32, ptr %62, align 4
  %65 = load i32, ptr addrspace(5) %12, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %98

67:                                               ; preds = %63
  %68 = load float, ptr addrspace(5) %13, align 4
  %69 = load i32, ptr %22, align 4
  %70 = load i32, ptr addrspace(5) %12, align 4
  %71 = mul nsw i32 %69, %70
  %72 = load i32, ptr %62, align 4
  %73 = add nsw i32 %71, %72
  %74 = sext i32 %73 to i64
  %75 = load ptr, ptr addrspace(5) %15, align 8
  %76 = getelementptr float, ptr %75, i64 %74
  %77 = load float, ptr %76, align 4
  %78 = fmul float %68, %77
  %79 = load i32, ptr %62, align 4
  %80 = load i32, ptr addrspace(5) %11, align 4
  %81 = mul nsw i32 %79, %80
  %82 = load i32, ptr %23, align 4
  %83 = add nsw i32 %81, %82
  %84 = sext i32 %83 to i64
  %85 = load ptr, ptr addrspace(5) %16, align 8
  %86 = getelementptr float, ptr %85, i64 %84
  %87 = load float, ptr %86, align 4
  %88 = fmul float %78, %87
  %89 = load i32, ptr %21, align 4
  %90 = sext i32 %89 to i64
  %91 = load ptr, ptr addrspace(5) %17, align 8
  %92 = getelementptr float, ptr %91, i64 %90
  %93 = load float, ptr %92, align 4
  %94 = fadd float %93, %88
  store float %94, ptr %92, align 4
  br label %95

95:                                               ; preds = %67
  %96 = load i32, ptr %62, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %62, align 4
  br label %63

98:                                               ; preds = %63
  br label %99

99:                                               ; preds = %98
  ret void
}

attributes #0 = { convergent }
attributes #1 = { convergent noinline "target-cpu"="gfx942" }
attributes #2 = { convergent noinline "amdgpu-flat-work-group-size"="1,1024" "target-cpu"="gfx942" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}

!0 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"ThinLTO", i32 0}
!4 = !{i32 1, !"EnableSplitLTOUnit", i32 1}

^0 = module: (path: "[Regular LTO]", hash: (0, 0, 0, 0, 0))
^1 = gv: (name: "_ZL8block_idj", summaries: (function: (module: ^0, flags: (linkage: internal, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 8, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 0, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^9))))) ; guid = 1073353223068330279
^2 = gv: (name: "gemm_kernel", summaries: (function: (module: ^0, flags: (linkage: external, visibility: protected, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 107, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 0, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^1), (callee: ^5), (callee: ^6))))) ; guid = 7836464057821857671
^3 = gv: (name: "__ockl_get_local_id") ; guid = 8161193753194270576
^4 = gv: (name: "__ockl_get_local_size") ; guid = 8246985667220920188
^5 = gv: (name: "_ZL10block_sizej", summaries: (function: (module: ^0, flags: (linkage: internal, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 8, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 0, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^4))))) ; guid = 8753963037014082072
^6 = gv: (name: "_ZL9thread_idj", summaries: (function: (module: ^0, flags: (linkage: internal, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 8, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 0, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^3))))) ; guid = 9033756325318578480
^7 = gv: (name: "llvm.compiler.used", summaries: (variable: (module: ^0, flags: (linkage: appending, visibility: default, notEligibleToImport: 1, live: 1, dsoLocal: 0, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), varFlags: (readonly: 0, writeonly: 0, constant: 0), refs: (^8)))) ; guid = 9610627770985738006
^8 = gv: (name: "__hip_cuid_45e74cb13a028356", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 0, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 14800278924630156287
^9 = gv: (name: "__ockl_get_group_id") ; guid = 18245337435198022983
^10 = flags: 8
^11 = blockcount: 0
