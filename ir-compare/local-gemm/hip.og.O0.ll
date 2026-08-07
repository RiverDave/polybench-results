; ModuleID = 'ir-compare/gemm_minimal.cpp'
source_filename = "ir-compare/gemm_minimal.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_a97bc8cec111cf2e = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_a97bc8cec111cf2e to ptr)], section "llvm.metadata"

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone uwtable
define protected amdgpu_kernel void @gemm_kernel(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, float noundef %alpha, float noundef %beta, ptr addrspace(1) noundef %a.coerce, ptr addrspace(1) noundef %b.coerce, ptr addrspace(1) noundef %c.coerce) #0 {
entry:
  %a = alloca ptr, align 8, addrspace(5)
  %b = alloca ptr, align 8, addrspace(5)
  %c = alloca ptr, align 8, addrspace(5)
  %ni.addr = alloca i32, align 4, addrspace(5)
  %nj.addr = alloca i32, align 4, addrspace(5)
  %nk.addr = alloca i32, align 4, addrspace(5)
  %alpha.addr = alloca float, align 4, addrspace(5)
  %beta.addr = alloca float, align 4, addrspace(5)
  %a.addr = alloca ptr, align 8, addrspace(5)
  %b.addr = alloca ptr, align 8, addrspace(5)
  %c.addr = alloca ptr, align 8, addrspace(5)
  %j = alloca i32, align 4, addrspace(5)
  %i = alloca i32, align 4, addrspace(5)
  %c_index = alloca i32, align 4, addrspace(5)
  %k = alloca i32, align 4, addrspace(5)
  %ni.addr.ascast = addrspacecast ptr addrspace(5) %ni.addr to ptr
  %nj.addr.ascast = addrspacecast ptr addrspace(5) %nj.addr to ptr
  %nk.addr.ascast = addrspacecast ptr addrspace(5) %nk.addr to ptr
  %alpha.addr.ascast = addrspacecast ptr addrspace(5) %alpha.addr to ptr
  %beta.addr.ascast = addrspacecast ptr addrspace(5) %beta.addr to ptr
  %a.addr.ascast = addrspacecast ptr addrspace(5) %a.addr to ptr
  %b.addr.ascast = addrspacecast ptr addrspace(5) %b.addr to ptr
  %c.addr.ascast = addrspacecast ptr addrspace(5) %c.addr to ptr
  %j.ascast = addrspacecast ptr addrspace(5) %j to ptr
  %i.ascast = addrspacecast ptr addrspace(5) %i to ptr
  %c_index.ascast = addrspacecast ptr addrspace(5) %c_index to ptr
  %k.ascast = addrspacecast ptr addrspace(5) %k to ptr
  store ptr addrspace(1) %a.coerce, ptr addrspace(5) %a, align 8
  %a1 = load ptr, ptr addrspace(5) %a, align 8
  store ptr addrspace(1) %b.coerce, ptr addrspace(5) %b, align 8
  %b2 = load ptr, ptr addrspace(5) %b, align 8
  store ptr addrspace(1) %c.coerce, ptr addrspace(5) %c, align 8
  %c3 = load ptr, ptr addrspace(5) %c, align 8
  store i32 %ni, ptr %ni.addr.ascast, align 4
  store i32 %nj, ptr %nj.addr.ascast, align 4
  store i32 %nk, ptr %nk.addr.ascast, align 4
  store float %alpha, ptr %alpha.addr.ascast, align 4
  store float %beta, ptr %beta.addr.ascast, align 4
  store ptr %a1, ptr %a.addr.ascast, align 8
  store ptr %b2, ptr %b.addr.ascast, align 8
  store ptr %c3, ptr %c.addr.ascast, align 8
  %call = call noundef i32 @_ZL8block_idj(i32 noundef 0) #3
  %call4 = call noundef i32 @_ZL10block_sizej(i32 noundef 0) #3
  %mul = mul i32 %call, %call4
  %call5 = call noundef i32 @_ZL9thread_idj(i32 noundef 0) #3
  %add = add i32 %mul, %call5
  store i32 %add, ptr %j.ascast, align 4
  %call6 = call noundef i32 @_ZL8block_idj(i32 noundef 1) #3
  %call7 = call noundef i32 @_ZL10block_sizej(i32 noundef 1) #3
  %mul8 = mul i32 %call6, %call7
  %call9 = call noundef i32 @_ZL9thread_idj(i32 noundef 1) #3
  %add10 = add i32 %mul8, %call9
  store i32 %add10, ptr %i.ascast, align 4
  %0 = load i32, ptr %i.ascast, align 4
  %1 = load i32, ptr %ni.addr.ascast, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, ptr %j.ascast, align 4
  %3 = load i32, ptr %nj.addr.ascast, align 4
  %cmp11 = icmp sge i32 %2, %3
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %for.end

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i32, ptr %i.ascast, align 4
  %5 = load i32, ptr %nj.addr.ascast, align 4
  %mul12 = mul nsw i32 %4, %5
  %6 = load i32, ptr %j.ascast, align 4
  %add13 = add nsw i32 %mul12, %6
  store i32 %add13, ptr %c_index.ascast, align 4
  %7 = load float, ptr %beta.addr.ascast, align 4
  %8 = load ptr, ptr %c.addr.ascast, align 8
  %9 = load i32, ptr %c_index.ascast, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds float, ptr %8, i64 %idxprom
  %10 = load float, ptr %arrayidx, align 4
  %mul14 = fmul contract float %10, %7
  store float %mul14, ptr %arrayidx, align 4
  store i32 0, ptr %k.ascast, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load i32, ptr %k.ascast, align 4
  %12 = load i32, ptr %nk.addr.ascast, align 4
  %cmp15 = icmp slt i32 %11, %12
  br i1 %cmp15, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load float, ptr %alpha.addr.ascast, align 4
  %14 = load ptr, ptr %a.addr.ascast, align 8
  %15 = load i32, ptr %i.ascast, align 4
  %16 = load i32, ptr %nk.addr.ascast, align 4
  %mul16 = mul nsw i32 %15, %16
  %17 = load i32, ptr %k.ascast, align 4
  %add17 = add nsw i32 %mul16, %17
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds float, ptr %14, i64 %idxprom18
  %18 = load float, ptr %arrayidx19, align 4
  %mul20 = fmul contract float %13, %18
  %19 = load ptr, ptr %b.addr.ascast, align 8
  %20 = load i32, ptr %k.ascast, align 4
  %21 = load i32, ptr %nj.addr.ascast, align 4
  %mul21 = mul nsw i32 %20, %21
  %22 = load i32, ptr %j.ascast, align 4
  %add22 = add nsw i32 %mul21, %22
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds float, ptr %19, i64 %idxprom23
  %23 = load float, ptr %arrayidx24, align 4
  %mul25 = fmul contract float %mul20, %23
  %24 = load ptr, ptr %c.addr.ascast, align 8
  %25 = load i32, ptr %c_index.ascast, align 4
  %idxprom26 = sext i32 %25 to i64
  %arrayidx27 = getelementptr inbounds float, ptr %24, i64 %idxprom26
  %26 = load float, ptr %arrayidx27, align 4
  %add28 = fadd contract float %26, %mul25
  store float %add28, ptr %arrayidx27, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %27 = load i32, ptr %k.ascast, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, ptr %k.ascast, align 4
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %if.then, %for.cond
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone uwtable
define internal noundef i32 @_ZL8block_idj(i32 noundef %dimension) #1 {
entry:
  %dimension.addr = alloca i32, align 4, addrspace(5)
  %dimension.addr.ascast = addrspacecast ptr addrspace(5) %dimension.addr to ptr
  store i32 %dimension, ptr %dimension.addr.ascast, align 4
  %0 = load i32, ptr %dimension.addr.ascast, align 4
  %call = call i32 @__ockl_get_group_id(i32 noundef %0) #3
  ret i32 %call
}

; Function Attrs: convergent mustprogress noinline nounwind optnone uwtable
define internal noundef i32 @_ZL10block_sizej(i32 noundef %dimension) #1 {
entry:
  %dimension.addr = alloca i32, align 4, addrspace(5)
  %dimension.addr.ascast = addrspacecast ptr addrspace(5) %dimension.addr to ptr
  store i32 %dimension, ptr %dimension.addr.ascast, align 4
  %0 = load i32, ptr %dimension.addr.ascast, align 4
  %call = call i32 @__ockl_get_local_size(i32 noundef %0) #3
  ret i32 %call
}

; Function Attrs: convergent mustprogress noinline nounwind optnone uwtable
define internal noundef i32 @_ZL9thread_idj(i32 noundef %dimension) #1 {
entry:
  %dimension.addr = alloca i32, align 4, addrspace(5)
  %dimension.addr.ascast = addrspacecast ptr addrspace(5) %dimension.addr to ptr
  store i32 %dimension, ptr %dimension.addr.ascast, align 4
  %0 = load i32, ptr %dimension.addr.ascast, align 4
  %call = call i32 @__ockl_get_local_id(i32 noundef %0) #3
  ret i32 %call
}

; Function Attrs: convergent nounwind
declare hidden i32 @__ockl_get_group_id(i32 noundef) #2

; Function Attrs: convergent nounwind
declare hidden i32 @__ockl_get_local_size(i32 noundef) #2

; Function Attrs: convergent nounwind
declare hidden i32 @__ockl_get_local_id(i32 noundef) #2

attributes #0 = { convergent mustprogress noinline norecurse nounwind optnone uwtable "amdgpu-flat-work-group-size"="1,1024" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { convergent mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #2 = { convergent nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #3 = { convergent nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 1, !"ThinLTO", i32 0}
!6 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!7 = !{!"clang version 23.0.0git (git@github.com:llvm/llvm-project.git 4305591c30c8aa15a8adeff77d4cd4abc6f1ef9c)"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}

^0 = module: (path: "[Regular LTO]", hash: (0, 0, 0, 0, 0))
^1 = gv: (name: "gemm_kernel", summaries: (function: (module: ^0, flags: (linkage: external, visibility: protected, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 116, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^7), (callee: ^6), (callee: ^2))))) ; guid = 7836464057821857671
^2 = gv: (name: "_ZL9thread_idj", summaries: (function: (module: ^0, flags: (linkage: internal, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 6, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^3))))) ; guid = 8000422168468496046
^3 = gv: (name: "__ockl_get_local_id") ; guid = 8161193753194270576
^4 = gv: (name: "__ockl_get_local_size") ; guid = 8246985667220920188
^5 = gv: (name: "llvm.compiler.used", summaries: (variable: (module: ^0, flags: (linkage: appending, visibility: default, notEligibleToImport: 1, live: 1, dsoLocal: 0, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), varFlags: (readonly: 0, writeonly: 0, constant: 0), refs: (^8)))) ; guid = 9610627770985738006
^6 = gv: (name: "_ZL10block_sizej", summaries: (function: (module: ^0, flags: (linkage: internal, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 6, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^4))))) ; guid = 13089887938497021939
^7 = gv: (name: "_ZL8block_idj", summaries: (function: (module: ^0, flags: (linkage: internal, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 6, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^9))))) ; guid = 16830379881413579639
^8 = gv: (name: "__hip_cuid_a97bc8cec111cf2e", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 0, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 18228452972954340716
^9 = gv: (name: "__ockl_get_group_id") ; guid = 18245337435198022983
^10 = flags: 8
^11 = blockcount: 0
