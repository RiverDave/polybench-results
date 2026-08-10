; ModuleID = '/root/polybenchGpu/HIP/JACOBI2D/jacobi2D.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/JACOBI2D/jacobi2D.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_23978880c26f0ec4 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_23978880c26f0ec4 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z21runJacobiCUDA_kernel1iPfS_(i32 noundef %n, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %B.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i = load i16, ptr addrspace(4) %2, align 2, !tbaa !16
  %conv.i73 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i73
  %3 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i82 = load i16, ptr addrspace(4) %5, align 4, !tbaa !16
  %conv.i79 = zext i16 %.in.i82 to i32
  %mul7 = mul i32 %4, %conv.i79
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add9 = add i32 %mul7, %6
  %cmp = icmp sgt i32 %add, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp10 = icmp slt i32 %add, %sub
  %cmp12 = icmp sgt i32 %add9, 0
  %or.cond = and i1 %cmp10, %cmp12
  %cmp15 = icmp slt i32 %add9, %sub
  %or.cond66 = and i1 %cmp15, %or.cond
  br i1 %or.cond66, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %mul16 = mul nuw nsw i32 %add, 1000
  %add17 = add nuw nsw i32 %mul16, %add9
  %idxprom = zext nneg i32 %add17 to i64
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %sub19 = add nsw i32 %add9, -1
  %add20 = add nuw nsw i32 %sub19, %mul16
  %idxprom21 = zext nneg i32 %add20 to i64
  %arrayidx22 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom21
  %8 = load float, ptr addrspace(1) %arrayidx22, align 4, !tbaa !18
  %add23 = fadd contract float %7, %8
  %add25 = add nuw nsw i32 %add9, 1
  %add26 = add nuw nsw i32 %add25, %mul16
  %idxprom27 = zext nneg i32 %add26 to i64
  %arrayidx28 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom27
  %9 = load float, ptr addrspace(1) %arrayidx28, align 4, !tbaa !18
  %add29 = fadd contract float %add23, %9
  %mul31 = add nuw i32 %mul16, 1000
  %add32 = add nuw nsw i32 %mul31, %add9
  %idxprom33 = zext nneg i32 %add32 to i64
  %arrayidx34 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom33
  %10 = load float, ptr addrspace(1) %arrayidx34, align 4, !tbaa !18
  %add35 = fadd contract float %add29, %10
  %mul37 = add nsw i32 %mul16, -1000
  %add38 = add nuw nsw i32 %mul37, %add9
  %idxprom39 = zext nneg i32 %add38 to i64
  %arrayidx40 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom39
  %11 = load float, ptr addrspace(1) %arrayidx40, align 4, !tbaa !18
  %add41 = fadd contract float %add35, %11
  %mul42 = fmul contract float %add41, 2.000000e-01
  %arrayidx46 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom
  store float %mul42, ptr addrspace(1) %arrayidx46, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z21runJacobiCUDA_kernel2iPfS_(i32 noundef %n, ptr addrspace(1) nofree noundef writeonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %B.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i = load i16, ptr addrspace(4) %2, align 2, !tbaa !16
  %conv.i36 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i36
  %3 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add = add i32 %mul, %3
  %cmp = icmp sgt i32 %add, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i45 = load i16, ptr addrspace(4) %5, align 4, !tbaa !16
  %conv.i42 = zext i16 %.in.i45 to i32
  %mul7 = mul i32 %4, %conv.i42
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add9 = add i32 %mul7, %6
  %sub = add nsw i32 %n, -1
  %cmp10 = icmp slt i32 %add, %sub
  %cmp12 = icmp sgt i32 %add9, 0
  %or.cond = and i1 %cmp10, %cmp12
  %cmp15 = icmp slt i32 %add9, %sub
  %or.cond29 = and i1 %cmp15, %or.cond
  br i1 %or.cond29, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %mul16 = mul nuw nsw i32 %add, 1000
  %add17 = add nuw nsw i32 %add9, %mul16
  %idxprom = zext nneg i32 %add17 to i64
  %arrayidx21 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  store float %7, ptr addrspace(1) %arrayidx21, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
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

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
