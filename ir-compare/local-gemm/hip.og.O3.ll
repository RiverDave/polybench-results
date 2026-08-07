; ModuleID = 'ir-compare/gemm_minimal.cpp'
source_filename = "ir-compare/gemm_minimal.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_c6fe17baa34dc4c0 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_c6fe17baa34dc4c0 to ptr)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind uwtable
define protected amdgpu_kernel void @gemm_kernel(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, float noundef %alpha, float noundef %beta, ptr addrspace(1) nofree noundef readonly captures(none) %a.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %b.coerce, ptr addrspace(1) nofree noundef captures(none) %c.coerce) local_unnamed_addr #0 {
entry:
  %call.i = tail call noundef i32 @__ockl_get_group_id(i32 noundef 0) #3
  %call.i42 = tail call noundef i32 @__ockl_get_local_size(i32 noundef 0) #3
  %mul = mul i32 %call.i42, %call.i
  %call.i43 = tail call noundef i32 @__ockl_get_local_id(i32 noundef 0) #3
  %add = add i32 %mul, %call.i43
  %call.i44 = tail call noundef i32 @__ockl_get_group_id(i32 noundef 1) #3
  %call.i45 = tail call noundef i32 @__ockl_get_local_size(i32 noundef 1) #3
  %mul8 = mul i32 %call.i45, %call.i44
  %call.i46 = tail call noundef i32 @__ockl_get_local_id(i32 noundef 1) #3
  %add10 = add i32 %mul8, %call.i46
  %cmp.not = icmp slt i32 %add10, %ni
  %cmp11.not = icmp slt i32 %add, %nj
  %or.cond = and i1 %cmp11.not, %cmp.not
  br i1 %or.cond, label %if.end, label %cleanup

if.end:                                           ; preds = %entry
  %mul12 = mul nsw i32 %add10, %nj
  %add13 = add nsw i32 %mul12, %add
  %idxprom = sext i32 %add13 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %c.coerce, i64 %idxprom
  %0 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !11
  %mul14 = fmul contract float %beta, %0
  store float %mul14, ptr addrspace(1) %arrayidx, align 4, !tbaa !11
  %cmp1547 = icmp sgt i32 %nk, 0
  br i1 %cmp1547, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.end
  %mul16 = mul nsw i32 %add10, %nk
  %xtraiter = and i32 %nk, 7
  %1 = icmp ult i32 %nk, 8
  br i1 %1, label %for.body.epil.preheader, label %for.body.lr.ph.new

for.body.lr.ph.new:                               ; preds = %for.body.lr.ph
  %unroll_iter = and i32 %nk, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph.new
  %add2849 = phi float [ %mul14, %for.body.lr.ph.new ], [ %add28.7, %for.body ]
  %k.048 = phi i32 [ 0, %for.body.lr.ph.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.lr.ph.new ], [ %niter.next.7, %for.body ]
  %add17 = add nsw i32 %k.048, %mul16
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18
  %2 = load float, ptr addrspace(1) %arrayidx19, align 4, !tbaa !11
  %mul20 = fmul contract float %alpha, %2
  %mul21 = mul nsw i32 %k.048, %nj
  %add22 = add nsw i32 %mul21, %add
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23
  %3 = load float, ptr addrspace(1) %arrayidx24, align 4, !tbaa !11
  %mul25 = fmul contract float %mul20, %3
  %add28 = fadd contract float %add2849, %mul25
  store float %add28, ptr addrspace(1) %arrayidx, align 4, !tbaa !11
  %inc = or disjoint i32 %k.048, 1
  %add17.1 = add nsw i32 %inc, %mul16
  %idxprom18.1 = sext i32 %add17.1 to i64
  %arrayidx19.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.1
  %4 = load float, ptr addrspace(1) %arrayidx19.1, align 4, !tbaa !11
  %mul20.1 = fmul contract float %alpha, %4
  %mul21.1 = mul nsw i32 %inc, %nj
  %add22.1 = add nsw i32 %mul21.1, %add
  %idxprom23.1 = sext i32 %add22.1 to i64
  %arrayidx24.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.1
  %5 = load float, ptr addrspace(1) %arrayidx24.1, align 4, !tbaa !11
  %mul25.1 = fmul contract float %mul20.1, %5
  %add28.1 = fadd contract float %add28, %mul25.1
  store float %add28.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !11
  %inc.1 = or disjoint i32 %k.048, 2
  %add17.2 = add nsw i32 %inc.1, %mul16
  %idxprom18.2 = sext i32 %add17.2 to i64
  %arrayidx19.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.2
  %6 = load float, ptr addrspace(1) %arrayidx19.2, align 4, !tbaa !11
  %mul20.2 = fmul contract float %alpha, %6
  %mul21.2 = mul nsw i32 %inc.1, %nj
  %add22.2 = add nsw i32 %mul21.2, %add
  %idxprom23.2 = sext i32 %add22.2 to i64
  %arrayidx24.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.2
  %7 = load float, ptr addrspace(1) %arrayidx24.2, align 4, !tbaa !11
  %mul25.2 = fmul contract float %mul20.2, %7
  %add28.2 = fadd contract float %add28.1, %mul25.2
  store float %add28.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !11
  %inc.2 = or disjoint i32 %k.048, 3
  %add17.3 = add nsw i32 %inc.2, %mul16
  %idxprom18.3 = sext i32 %add17.3 to i64
  %arrayidx19.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.3
  %8 = load float, ptr addrspace(1) %arrayidx19.3, align 4, !tbaa !11
  %mul20.3 = fmul contract float %alpha, %8
  %mul21.3 = mul nsw i32 %inc.2, %nj
  %add22.3 = add nsw i32 %mul21.3, %add
  %idxprom23.3 = sext i32 %add22.3 to i64
  %arrayidx24.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.3
  %9 = load float, ptr addrspace(1) %arrayidx24.3, align 4, !tbaa !11
  %mul25.3 = fmul contract float %mul20.3, %9
  %add28.3 = fadd contract float %add28.2, %mul25.3
  store float %add28.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !11
  %inc.3 = or disjoint i32 %k.048, 4
  %add17.4 = add nsw i32 %inc.3, %mul16
  %idxprom18.4 = sext i32 %add17.4 to i64
  %arrayidx19.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.4
  %10 = load float, ptr addrspace(1) %arrayidx19.4, align 4, !tbaa !11
  %mul20.4 = fmul contract float %alpha, %10
  %mul21.4 = mul nsw i32 %inc.3, %nj
  %add22.4 = add nsw i32 %mul21.4, %add
  %idxprom23.4 = sext i32 %add22.4 to i64
  %arrayidx24.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.4
  %11 = load float, ptr addrspace(1) %arrayidx24.4, align 4, !tbaa !11
  %mul25.4 = fmul contract float %mul20.4, %11
  %add28.4 = fadd contract float %add28.3, %mul25.4
  store float %add28.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !11
  %inc.4 = or disjoint i32 %k.048, 5
  %add17.5 = add nsw i32 %inc.4, %mul16
  %idxprom18.5 = sext i32 %add17.5 to i64
  %arrayidx19.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.5
  %12 = load float, ptr addrspace(1) %arrayidx19.5, align 4, !tbaa !11
  %mul20.5 = fmul contract float %alpha, %12
  %mul21.5 = mul nsw i32 %inc.4, %nj
  %add22.5 = add nsw i32 %mul21.5, %add
  %idxprom23.5 = sext i32 %add22.5 to i64
  %arrayidx24.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.5
  %13 = load float, ptr addrspace(1) %arrayidx24.5, align 4, !tbaa !11
  %mul25.5 = fmul contract float %mul20.5, %13
  %add28.5 = fadd contract float %add28.4, %mul25.5
  store float %add28.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !11
  %inc.5 = or disjoint i32 %k.048, 6
  %add17.6 = add nsw i32 %inc.5, %mul16
  %idxprom18.6 = sext i32 %add17.6 to i64
  %arrayidx19.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.6
  %14 = load float, ptr addrspace(1) %arrayidx19.6, align 4, !tbaa !11
  %mul20.6 = fmul contract float %alpha, %14
  %mul21.6 = mul nsw i32 %inc.5, %nj
  %add22.6 = add nsw i32 %mul21.6, %add
  %idxprom23.6 = sext i32 %add22.6 to i64
  %arrayidx24.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.6
  %15 = load float, ptr addrspace(1) %arrayidx24.6, align 4, !tbaa !11
  %mul25.6 = fmul contract float %mul20.6, %15
  %add28.6 = fadd contract float %add28.5, %mul25.6
  store float %add28.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !11
  %inc.6 = or disjoint i32 %k.048, 7
  %add17.7 = add nsw i32 %inc.6, %mul16
  %idxprom18.7 = sext i32 %add17.7 to i64
  %arrayidx19.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.7
  %16 = load float, ptr addrspace(1) %arrayidx19.7, align 4, !tbaa !11
  %mul20.7 = fmul contract float %alpha, %16
  %mul21.7 = mul nsw i32 %inc.6, %nj
  %add22.7 = add nsw i32 %mul21.7, %add
  %idxprom23.7 = sext i32 %add22.7 to i64
  %arrayidx24.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.7
  %17 = load float, ptr addrspace(1) %arrayidx24.7, align 4, !tbaa !11
  %mul25.7 = fmul contract float %mul20.7, %17
  %add28.7 = fadd contract float %add28.6, %mul25.7
  store float %add28.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !11
  %inc.7 = add nuw nsw i32 %k.048, 8
  %niter.next.7 = add i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %cleanup.loopexit.unr-lcssa, label %for.body, !llvm.loop !13

cleanup.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %cleanup, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %cleanup.loopexit.unr-lcssa, %for.body.lr.ph
  %add2849.epil.init = phi float [ %mul14, %for.body.lr.ph ], [ %add28.7, %cleanup.loopexit.unr-lcssa ]
  %k.048.epil.init = phi i32 [ 0, %for.body.lr.ph ], [ %inc.7, %cleanup.loopexit.unr-lcssa ]
  %lcmp.mod50 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod50)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add2849.epil = phi float [ %add2849.epil.init, %for.body.epil.preheader ], [ %add28.epil, %for.body.epil ]
  %k.048.epil = phi i32 [ %k.048.epil.init, %for.body.epil.preheader ], [ %inc.epil, %for.body.epil ]
  %epil.iter = phi i32 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %add17.epil = add nsw i32 %k.048.epil, %mul16
  %idxprom18.epil = sext i32 %add17.epil to i64
  %arrayidx19.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.epil
  %18 = load float, ptr addrspace(1) %arrayidx19.epil, align 4, !tbaa !11
  %mul20.epil = fmul contract float %alpha, %18
  %mul21.epil = mul nsw i32 %k.048.epil, %nj
  %add22.epil = add nsw i32 %mul21.epil, %add
  %idxprom23.epil = sext i32 %add22.epil to i64
  %arrayidx24.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.epil
  %19 = load float, ptr addrspace(1) %arrayidx24.epil, align 4, !tbaa !11
  %mul25.epil = fmul contract float %mul20.epil, %19
  %add28.epil = fadd contract float %add2849.epil, %mul25.epil
  store float %add28.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !11
  %inc.epil = add nuw nsw i32 %k.048.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %cleanup, label %for.body.epil, !llvm.loop !15

cleanup:                                          ; preds = %cleanup.loopexit.unr-lcssa, %for.body.epil, %if.end, %entry
  ret void
}

; Function Attrs: convergent nounwind
declare hidden i32 @__ockl_get_group_id(i32 noundef) local_unnamed_addr #1

; Function Attrs: convergent nounwind
declare hidden i32 @__ockl_get_local_size(i32 noundef) local_unnamed_addr #1

; Function Attrs: convergent nounwind
declare hidden i32 @__ockl_get_local_id(i32 noundef) local_unnamed_addr #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { convergent mustprogress norecurse nounwind uwtable "amdgpu-flat-work-group-size"="1,1024" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { convergent nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { convergent nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}
!llvm.errno.tbaa = !{!7}

!0 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 1, !"ThinLTO", i32 0}
!5 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!6 = !{!"clang version 23.0.0git (git@github.com:llvm/llvm-project.git 4305591c30c8aa15a8adeff77d4cd4abc6f1ef9c)"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}

^0 = module: (path: "[Regular LTO]", hash: (0, 0, 0, 0, 0))
^1 = gv: (name: "__hip_cuid_c6fe17baa34dc4c0", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 0, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 2973095952437667724
^2 = gv: (name: "gemm_kernel", summaries: (function: (module: ^0, flags: (linkage: external, visibility: protected, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), insts: 175, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 1, returnDoesNotAlias: 0, noInline: 0, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^6, tail: 1), (callee: ^4, tail: 1), (callee: ^3, tail: 1))))) ; guid = 7836464057821857671
^3 = gv: (name: "__ockl_get_local_id") ; guid = 8161193753194270576
^4 = gv: (name: "__ockl_get_local_size") ; guid = 8246985667220920188
^5 = gv: (name: "llvm.compiler.used", summaries: (variable: (module: ^0, flags: (linkage: appending, visibility: default, notEligibleToImport: 1, live: 1, dsoLocal: 0, canAutoHide: 0, importType: definition, noRenameOnPromotion: 0), varFlags: (readonly: 0, writeonly: 0, constant: 0), refs: (^1)))) ; guid = 9610627770985738006
^6 = gv: (name: "__ockl_get_group_id") ; guid = 18245337435198022983
^7 = flags: 8
^8 = blockcount: 0
