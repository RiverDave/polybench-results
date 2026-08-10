; ModuleID = '/root/polybenchGpu/HIP/LU/lu.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/LU/lu.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_c8579c64d4a318fd = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_c8579c64d4a318fd to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z10lu_kernel1iPfi(i32 noundef %n, ptr addrspace(1) nofree noundef captures(none) %A.coerce, i32 noundef %k) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i27 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i27
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %cmp = icmp sgt i32 %add, %k
  %cmp4 = icmp slt i32 %add, %n
  %or.cond = and i1 %cmp, %cmp4
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul5 = shl nsw i32 %k, 11
  %add6 = add nsw i32 %add, %mul5
  %idxprom = sext i32 %add6 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom
  %4 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %add8 = mul nsw i32 %k, 2049
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom9
  %5 = load float, ptr addrspace(1) %arrayidx10, align 4, !tbaa !18
  %div = fdiv contract float %4, %5
  store float %div, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z10lu_kernel2iPfi(i32 noundef %n, ptr addrspace(1) nofree noundef captures(none) %A.coerce, i32 noundef %k) local_unnamed_addr #1 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i52 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i52
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i61 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i58 = zext i16 %.in.i61 to i32
  %mul6 = mul i32 %4, %conv.i58
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add8 = add i32 %mul6, %6
  %cmp = icmp sgt i32 %add8, %k
  %cmp9 = icmp sgt i32 %add, %k
  %or.cond = and i1 %cmp9, %cmp
  %cmp11 = icmp slt i32 %add8, %n
  %or.cond44 = and i1 %cmp11, %or.cond
  %cmp13 = icmp slt i32 %add, %n
  %or.cond45 = and i1 %cmp13, %or.cond44
  br i1 %or.cond45, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul14 = shl nsw i32 %add8, 11
  %add15 = add nsw i32 %mul14, %add
  %idxprom = sext i32 %add15 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %add17 = add nsw i32 %mul14, %k
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom18
  %8 = load float, ptr addrspace(1) %arrayidx19, align 4, !tbaa !18
  %mul20 = shl nsw i32 %k, 11
  %add21 = add nsw i32 %add, %mul20
  %idxprom22 = sext i32 %add21 to i64
  %arrayidx23 = getelementptr inbounds [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom22
  %9 = load float, ptr addrspace(1) %arrayidx23, align 4, !tbaa !18
  %mul24 = fmul contract float %8, %9
  %sub = fsub contract float %7, %mul24
  store float %sub, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
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

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
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
