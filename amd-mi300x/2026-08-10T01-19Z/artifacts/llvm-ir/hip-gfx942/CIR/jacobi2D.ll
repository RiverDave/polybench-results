; ModuleID = '/root/polybenchGpu/HIP/JACOBI2D/jacobi2D.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/JACOBI2D/jacobi2D.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_e7748acfab78eb19 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_e7748acfab78eb19 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z21runJacobiCUDA_kernel1iPfS_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef writeonly captures(none) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %8 = getelementptr inbounds nuw i8, ptr addrspace(4) %7, i64 14
  %.in.i = load i16, ptr addrspace(4) %8, align 2, !tbaa !10
  %9 = zext i16 %.in.i to i32
  %10 = mul i32 %6, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr inbounds nuw i8, ptr addrspace(4) %7, i64 12
  %.in.i24 = load i16, ptr addrspace(4) %14, align 4, !tbaa !10
  %15 = zext i16 %.in.i24 to i32
  %16 = mul i32 %13, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %18 = add i32 %16, %17
  %19 = icmp sgt i32 %12, 0
  %20 = add nsw i32 %0, -1
  %21 = icmp slt i32 %12, %20
  %22 = select i1 %19, i1 %21, i1 false
  %23 = icmp sgt i32 %18, 0
  %24 = and i1 %22, %23
  %25 = icmp slt i32 %18, %20
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %59

27:                                               ; preds = %3
  %28 = mul nuw nsw i32 %12, 1000
  %29 = add nuw nsw i32 %28, %18
  %30 = zext nneg i32 %29 to i64
  %31 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4
  %33 = add nsw i32 %18, -1
  %34 = add nuw nsw i32 %33, %28
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %35
  %37 = load float, ptr addrspace(1) %36, align 4
  %38 = fadd float %32, %37
  %39 = add nuw nsw i32 %18, 1
  %40 = add nuw nsw i32 %39, %28
  %41 = zext nneg i32 %40 to i64
  %42 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %41
  %43 = load float, ptr addrspace(1) %42, align 4
  %44 = fadd float %38, %43
  %45 = add nuw i32 %28, 1000
  %46 = add nuw nsw i32 %45, %18
  %47 = zext nneg i32 %46 to i64
  %48 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %47
  %49 = load float, ptr addrspace(1) %48, align 4
  %50 = fadd float %44, %49
  %51 = add nsw i32 %28, -1000
  %52 = add nuw nsw i32 %51, %18
  %53 = zext nneg i32 %52 to i64
  %54 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %53
  %55 = load float, ptr addrspace(1) %54, align 4
  %56 = fadd float %50, %55
  %57 = fmul float %56, 2.000000e-01
  %58 = getelementptr [4 x i8], ptr addrspace(1) %4, i64 %30
  store float %57, ptr addrspace(1) %58, align 4
  br label %59

59:                                               ; preds = %3, %27
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z21runJacobiCUDA_kernel2iPfS_(i32 noundef %0, ptr nofree noundef writeonly captures(none) %1, ptr nofree noundef readonly captures(none) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %8 = getelementptr inbounds nuw i8, ptr addrspace(4) %7, i64 14
  %.in.i = load i16, ptr addrspace(4) %8, align 2, !tbaa !10
  %9 = zext i16 %.in.i to i32
  %10 = mul i32 %6, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr inbounds nuw i8, ptr addrspace(4) %7, i64 12
  %.in.i12 = load i16, ptr addrspace(4) %14, align 4, !tbaa !10
  %15 = zext i16 %.in.i12 to i32
  %16 = mul i32 %13, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %18 = add i32 %16, %17
  %19 = icmp sgt i32 %12, 0
  %20 = add nsw i32 %0, -1
  %21 = icmp slt i32 %12, %20
  %22 = select i1 %19, i1 %21, i1 false
  %23 = icmp sgt i32 %18, 0
  %24 = and i1 %22, %23
  %25 = icmp slt i32 %18, %20
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %34

27:                                               ; preds = %3
  %28 = mul nuw nsw i32 %12, 1000
  %29 = add nuw nsw i32 %28, %18
  %30 = zext nneg i32 %29 to i64
  %31 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %30
  %32 = getelementptr [4 x i8], ptr addrspace(1) %4, i64 %30
  %33 = load float, ptr addrspace(1) %32, align 4
  store float %33, ptr addrspace(1) %31, align 4
  br label %34

34:                                               ; preds = %3, %27
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

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
