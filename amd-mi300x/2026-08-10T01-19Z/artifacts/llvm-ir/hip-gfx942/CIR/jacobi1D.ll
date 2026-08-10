; ModuleID = '/root/polybenchGpu/HIP/JACOBI1D/jacobi1D.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/JACOBI1D/jacobi1D.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_484fff2164b51e01 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_484fff2164b51e01 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z21runJacobiCUDA_kernel1iPfS_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef writeonly captures(none) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %8 = getelementptr inbounds nuw i8, ptr addrspace(4) %7, i64 12
  %9 = load i16, ptr addrspace(4) %8, align 4, !tbaa !10
  %10 = zext i16 %9 to i32
  %11 = mul i32 %6, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %13, 0
  %15 = add nsw i32 %0, -1
  %16 = icmp slt i32 %13, %15
  %17 = select i1 %14, i1 %16, i1 false
  br i1 %17, label %18, label %31

18:                                               ; preds = %3
  %19 = zext nneg i32 %13 to i64
  %20 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %19
  %21 = getelementptr i8, ptr addrspace(1) %20, i64 -4
  %22 = load <2 x float>, ptr addrspace(1) %21, align 4
  %shift = shufflevector <2 x float> %22, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop = fadd <2 x float> %22, %shift
  %23 = extractelement <2 x float> %foldExtExtBinop, i64 0
  %24 = getelementptr i8, ptr addrspace(1) %20, i64 4
  %25 = load float, ptr addrspace(1) %24, align 4
  %26 = fadd float %23, %25
  %27 = fpext float %26 to double
  %28 = fmul double %27, 3.333300e-01
  %29 = fptrunc double %28 to float
  %30 = getelementptr [4 x i8], ptr addrspace(1) %4, i64 %19
  store float %29, ptr addrspace(1) %30, align 4
  br label %31

31:                                               ; preds = %3, %18
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z21runJacobiCUDA_kernel2iPfS_(i32 noundef %0, ptr nofree noundef writeonly captures(none) %1, ptr nofree noundef readonly captures(none) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %8 = getelementptr inbounds nuw i8, ptr addrspace(4) %7, i64 12
  %9 = load i16, ptr addrspace(4) %8, align 4, !tbaa !10
  %10 = zext i16 %9 to i32
  %11 = mul i32 %6, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %13, 0
  %15 = add nsw i32 %0, -1
  %16 = icmp slt i32 %13, %15
  %17 = select i1 %14, i1 %16, i1 false
  br i1 %17, label %18, label %23

18:                                               ; preds = %3
  %19 = zext nneg i32 %13 to i64
  %20 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %19
  %21 = getelementptr [4 x i8], ptr addrspace(1) %4, i64 %19
  %22 = load float, ptr addrspace(1) %21, align 4
  store float %22, ptr addrspace(1) %20, align 4
  br label %23

23:                                               ; preds = %3, %18
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
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
