; ModuleID = '/root/polybenchGpu/HIP/LU/lu.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/LU/lu.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_2030c9b236f6b266 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_2030c9b236f6b266 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z10lu_kernel1iPfi(i32 noundef %0, ptr nofree noundef captures(none) %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %7 = getelementptr inbounds nuw i8, ptr addrspace(4) %6, i64 12
  %.in.i = load i16, ptr addrspace(4) %7, align 4, !tbaa !10
  %8 = zext i16 %.in.i to i32
  %9 = mul i32 %5, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %11 = add i32 %9, %10
  %12 = icmp sgt i32 %11, %2
  %13 = icmp slt i32 %11, %0
  %14 = and i1 %12, %13
  br i1 %14, label %15, label %26

15:                                               ; preds = %3
  %16 = shl nsw i32 %2, 11
  %17 = add nsw i32 %11, %16
  %18 = sext i32 %17 to i64
  %19 = getelementptr [4 x i8], ptr addrspace(1) %4, i64 %18
  %20 = load float, ptr addrspace(1) %19, align 4
  %21 = mul nsw i32 %2, 2049
  %22 = sext i32 %21 to i64
  %23 = getelementptr [4 x i8], ptr addrspace(1) %4, i64 %22
  %24 = load float, ptr addrspace(1) %23, align 4
  %25 = fdiv float %20, %24
  store float %25, ptr addrspace(1) %19, align 4
  br label %26

26:                                               ; preds = %3, %15
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z10lu_kernel2iPfi(i32 noundef %0, ptr nofree noundef captures(none) %1, i32 noundef %2) local_unnamed_addr #1 {
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %7 = getelementptr inbounds nuw i8, ptr addrspace(4) %6, i64 12
  %.in.i = load i16, ptr addrspace(4) %7, align 4, !tbaa !10
  %8 = zext i16 %.in.i to i32
  %9 = mul i32 %5, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %11 = add i32 %9, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = getelementptr inbounds nuw i8, ptr addrspace(4) %6, i64 14
  %.in.i21 = load i16, ptr addrspace(4) %13, align 2, !tbaa !10
  %14 = zext i16 %.in.i21 to i32
  %15 = mul i32 %12, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %17 = add i32 %15, %16
  %18 = icmp sgt i32 %17, %2
  %19 = icmp sgt i32 %11, %2
  %20 = and i1 %19, %18
  %21 = icmp slt i32 %17, %0
  %22 = and i1 %21, %20
  %23 = icmp slt i32 %11, %0
  %24 = and i1 %23, %22
  br i1 %24, label %25, label %42

25:                                               ; preds = %3
  %26 = shl nsw i32 %17, 11
  %27 = add nsw i32 %26, %11
  %28 = sext i32 %27 to i64
  %29 = getelementptr [4 x i8], ptr addrspace(1) %4, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4
  %31 = add nsw i32 %26, %2
  %32 = sext i32 %31 to i64
  %33 = getelementptr [4 x i8], ptr addrspace(1) %4, i64 %32
  %34 = load float, ptr addrspace(1) %33, align 4
  %35 = shl nsw i32 %2, 11
  %36 = add nsw i32 %11, %35
  %37 = sext i32 %36 to i64
  %38 = getelementptr [4 x i8], ptr addrspace(1) %4, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 4
  %40 = fmul float %34, %39
  %41 = fsub float %30, %40
  store float %41, ptr addrspace(1) %29, align 4
  br label %42

42:                                               ; preds = %3, %25
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

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
