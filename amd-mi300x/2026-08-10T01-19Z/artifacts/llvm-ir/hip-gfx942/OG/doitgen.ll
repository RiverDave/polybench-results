; ModuleID = '/root/polybenchGpu/HIP/DOITGEN/doitgen.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/DOITGEN/doitgen.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_1370174ba7ee3354 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_1370174ba7ee3354 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z15doitgen_kernel1PfS_S_i(ptr addrspace(1) nofree noundef writeonly captures(none) %sum.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %C4.coerce, i32 noundef %r) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i63 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i63
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i72 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i69 = zext i16 %.in.i72 to i32
  %mul8 = mul i32 %4, %conv.i69
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add10 = add i32 %mul8, %6
  %cmp = icmp slt i32 %add, 128
  %cmp11 = icmp slt i32 %add10, 128
  %or.cond = and i1 %cmp, %cmp11
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul12 = shl nsw i32 %r, 14
  %mul13 = shl nsw i32 %add10, 7
  %add14 = add nsw i32 %mul13, %mul12
  %add15 = add nsw i32 %add14, %add
  %idxprom = sext i32 %add15 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %sum.coerce, i64 %idxprom
  store float 0.000000e+00, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  br label %for.body

for.body:                                         ; preds = %for.body, %if.then
  %s.073 = phi i32 [ 0, %if.then ], [ %inc.7, %for.body ]
  %7 = phi float [ 0.000000e+00, %if.then ], [ %add34.7, %for.body ]
  %add26 = or disjoint i32 %s.073, %add14
  %idxprom27 = sext i32 %add26 to i64
  %arrayidx28 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom27
  %8 = load float, ptr addrspace(1) %arrayidx28, align 4, !tbaa !18
  %mul29 = shl nuw nsw i32 %s.073, 7
  %add30 = add nsw i32 %mul29, %add
  %idxprom31 = sext i32 %add30 to i64
  %arrayidx32 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C4.coerce, i64 %idxprom31
  %9 = load float, ptr addrspace(1) %arrayidx32, align 4, !tbaa !18
  %mul33 = fmul contract float %8, %9
  %add34 = fadd contract float %7, %mul33
  store float %add34, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = or disjoint i32 %s.073, 1
  %add26.1 = or disjoint i32 %inc, %add14
  %idxprom27.1 = sext i32 %add26.1 to i64
  %arrayidx28.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom27.1
  %10 = load float, ptr addrspace(1) %arrayidx28.1, align 4, !tbaa !18
  %mul29.1 = shl nuw nsw i32 %inc, 7
  %add30.1 = add nsw i32 %mul29.1, %add
  %idxprom31.1 = sext i32 %add30.1 to i64
  %arrayidx32.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C4.coerce, i64 %idxprom31.1
  %11 = load float, ptr addrspace(1) %arrayidx32.1, align 4, !tbaa !18
  %mul33.1 = fmul contract float %10, %11
  %add34.1 = fadd contract float %add34, %mul33.1
  store float %add34.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %s.073, 2
  %add26.2 = or disjoint i32 %inc.1, %add14
  %idxprom27.2 = sext i32 %add26.2 to i64
  %arrayidx28.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom27.2
  %12 = load float, ptr addrspace(1) %arrayidx28.2, align 4, !tbaa !18
  %mul29.2 = shl nuw nsw i32 %inc.1, 7
  %add30.2 = add nsw i32 %mul29.2, %add
  %idxprom31.2 = sext i32 %add30.2 to i64
  %arrayidx32.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C4.coerce, i64 %idxprom31.2
  %13 = load float, ptr addrspace(1) %arrayidx32.2, align 4, !tbaa !18
  %mul33.2 = fmul contract float %12, %13
  %add34.2 = fadd contract float %add34.1, %mul33.2
  store float %add34.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %s.073, 3
  %add26.3 = or disjoint i32 %inc.2, %add14
  %idxprom27.3 = sext i32 %add26.3 to i64
  %arrayidx28.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom27.3
  %14 = load float, ptr addrspace(1) %arrayidx28.3, align 4, !tbaa !18
  %mul29.3 = shl nuw nsw i32 %inc.2, 7
  %add30.3 = add nsw i32 %mul29.3, %add
  %idxprom31.3 = sext i32 %add30.3 to i64
  %arrayidx32.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C4.coerce, i64 %idxprom31.3
  %15 = load float, ptr addrspace(1) %arrayidx32.3, align 4, !tbaa !18
  %mul33.3 = fmul contract float %14, %15
  %add34.3 = fadd contract float %add34.2, %mul33.3
  store float %add34.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %s.073, 4
  %add26.4 = or disjoint i32 %inc.3, %add14
  %idxprom27.4 = sext i32 %add26.4 to i64
  %arrayidx28.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom27.4
  %16 = load float, ptr addrspace(1) %arrayidx28.4, align 4, !tbaa !18
  %mul29.4 = shl nuw nsw i32 %inc.3, 7
  %add30.4 = add nsw i32 %mul29.4, %add
  %idxprom31.4 = sext i32 %add30.4 to i64
  %arrayidx32.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C4.coerce, i64 %idxprom31.4
  %17 = load float, ptr addrspace(1) %arrayidx32.4, align 4, !tbaa !18
  %mul33.4 = fmul contract float %16, %17
  %add34.4 = fadd contract float %add34.3, %mul33.4
  store float %add34.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %s.073, 5
  %add26.5 = or disjoint i32 %inc.4, %add14
  %idxprom27.5 = sext i32 %add26.5 to i64
  %arrayidx28.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom27.5
  %18 = load float, ptr addrspace(1) %arrayidx28.5, align 4, !tbaa !18
  %mul29.5 = shl nuw nsw i32 %inc.4, 7
  %add30.5 = add nsw i32 %mul29.5, %add
  %idxprom31.5 = sext i32 %add30.5 to i64
  %arrayidx32.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C4.coerce, i64 %idxprom31.5
  %19 = load float, ptr addrspace(1) %arrayidx32.5, align 4, !tbaa !18
  %mul33.5 = fmul contract float %18, %19
  %add34.5 = fadd contract float %add34.4, %mul33.5
  store float %add34.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %s.073, 6
  %add26.6 = or disjoint i32 %inc.5, %add14
  %idxprom27.6 = sext i32 %add26.6 to i64
  %arrayidx28.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom27.6
  %20 = load float, ptr addrspace(1) %arrayidx28.6, align 4, !tbaa !18
  %mul29.6 = shl nuw nsw i32 %inc.5, 7
  %add30.6 = add nsw i32 %mul29.6, %add
  %idxprom31.6 = sext i32 %add30.6 to i64
  %arrayidx32.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C4.coerce, i64 %idxprom31.6
  %21 = load float, ptr addrspace(1) %arrayidx32.6, align 4, !tbaa !18
  %mul33.6 = fmul contract float %20, %21
  %add34.6 = fadd contract float %add34.5, %mul33.6
  store float %add34.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %s.073, 7
  %add26.7 = or disjoint i32 %inc.6, %add14
  %idxprom27.7 = sext i32 %add26.7 to i64
  %arrayidx28.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom27.7
  %22 = load float, ptr addrspace(1) %arrayidx28.7, align 4, !tbaa !18
  %mul29.7 = shl nuw nsw i32 %inc.6, 7
  %add30.7 = add nsw i32 %mul29.7, %add
  %idxprom31.7 = sext i32 %add30.7 to i64
  %arrayidx32.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %C4.coerce, i64 %idxprom31.7
  %23 = load float, ptr addrspace(1) %arrayidx32.7, align 4, !tbaa !18
  %mul33.7 = fmul contract float %22, %23
  %add34.7 = fadd contract float %add34.6, %mul33.7
  store float %add34.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %s.073, 8
  %exitcond.not.7 = icmp eq i32 %inc.7, 128
  br i1 %exitcond.not.7, label %if.end, label %for.body, !llvm.loop !20

if.end:                                           ; preds = %for.body, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z15doitgen_kernel2PfS_S_i(ptr addrspace(1) nofree noundef readonly captures(none) %sum.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef readnone captures(none) %C4.coerce, i32 noundef %r) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i33 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i33
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i42 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i39 = zext i16 %.in.i42 to i32
  %mul8 = mul i32 %4, %conv.i39
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add10 = add i32 %mul8, %6
  %cmp = icmp slt i32 %add, 128
  %cmp11 = icmp slt i32 %add10, 128
  %or.cond = and i1 %cmp, %cmp11
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul12 = shl nsw i32 %r, 14
  %mul13 = shl nsw i32 %add10, 7
  %add14 = add i32 %add, %mul12
  %add15 = add i32 %add14, %mul13
  %idxprom = sext i32 %add15 to i64
  %arrayidx21 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %sum.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  store float %7, ptr addrspace(1) %arrayidx21, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
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

attributes #0 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4, !5}
!llvm.errno.tbaa = !{!6, !11}
!opencl.ocl.version = !{!15}

!0 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 24.0.0git (https://github.com/llvm/llvm-project c45e6b9e4d95fb444eb1308416c10d95350d3c52)"}
!5 = !{!"AMD clang version 23.0.0git (https://github.com/ROCm/llvm-project.git 46fcb339fb61119b337f973c7ca9e710a319fdd0+PATCHED:440716f8b87be9d8e20ed910e10e5b6d14d57cf6)"}
!6 = !{!7, !8, i64 0}
!7 = !{!"__libc_errno", !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{i32 2, i32 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"short", !13, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !9, i64 0}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
