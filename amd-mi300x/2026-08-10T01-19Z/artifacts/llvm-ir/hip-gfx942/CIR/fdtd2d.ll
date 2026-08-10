; ModuleID = '/root/polybenchGpu/HIP/FDTD-2D/fdtd2d.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/FDTD-2D/fdtd2d.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_109011cee3a995c7 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_109011cee3a995c7 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z17fdtd_step1_kerneliiPfS_S_S_i(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readnone captures(none) %3, ptr nofree noundef captures(none) %4, ptr nofree noundef readonly captures(none) %5, i32 noundef %6) local_unnamed_addr #0 {
  %8 = addrspacecast ptr %5 to ptr addrspace(1)
  %9 = addrspacecast ptr %4 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %13 = getelementptr inbounds nuw i8, ptr addrspace(4) %12, i64 12
  %.in.i = load i16, ptr addrspace(4) %13, align 4, !tbaa !10
  %14 = zext i16 %.in.i to i32
  %15 = mul i32 %11, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr inbounds nuw i8, ptr addrspace(4) %12, i64 14
  %.in.i22 = load i16, ptr addrspace(4) %19, align 2, !tbaa !10
  %20 = zext i16 %.in.i22 to i32
  %21 = mul i32 %18, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %23, %0
  %25 = icmp slt i32 %17, %1
  %26 = and i1 %25, %24
  br i1 %26, label %27, label %51

27:                                               ; preds = %7
  %28 = icmp eq i32 %23, 0
  br i1 %28, label %29, label %35

29:                                               ; preds = %27
  %30 = sext i32 %6 to i64
  %31 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4
  %33 = sext i32 %17 to i64
  %34 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %33
  store float %32, ptr addrspace(1) %34, align 4
  br label %51

35:                                               ; preds = %27
  %36 = shl nsw i32 %23, 11
  %37 = add nsw i32 %36, %17
  %38 = sext i32 %37 to i64
  %39 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %38
  %40 = load float, ptr addrspace(1) %39, align 4
  %41 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %38
  %42 = load float, ptr addrspace(1) %41, align 4
  %43 = add i32 %17, -2048
  %44 = add i32 %43, %36
  %45 = sext i32 %44 to i64
  %46 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %45
  %47 = load float, ptr addrspace(1) %46, align 4
  %48 = fsub float %42, %47
  %49 = fmul float %48, 5.000000e-01
  %50 = fsub float %40, %49
  store float %50, ptr addrspace(1) %39, align 4
  br label %51

51:                                               ; preds = %7, %35, %29
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z17fdtd_step2_kerneliiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr nofree noundef captures(none) %2, ptr nofree noundef readnone captures(none) %3, ptr nofree noundef readonly captures(none) %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %4 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %11 = getelementptr inbounds nuw i8, ptr addrspace(4) %10, i64 12
  %.in.i = load i16, ptr addrspace(4) %11, align 4, !tbaa !10
  %12 = zext i16 %.in.i to i32
  %13 = mul i32 %9, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr inbounds nuw i8, ptr addrspace(4) %10, i64 14
  %.in.i17 = load i16, ptr addrspace(4) %17, align 2, !tbaa !10
  %18 = zext i16 %.in.i17 to i32
  %19 = mul i32 %16, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %21, %0
  %23 = icmp slt i32 %15, %1
  %24 = and i1 %23, %22
  %25 = icmp sgt i32 %15, 0
  %26 = and i1 %25, %24
  br i1 %26, label %27, label %43

27:                                               ; preds = %6
  %28 = shl nsw i32 %21, 11
  %29 = add nsw i32 %28, %15
  %30 = sext i32 %29 to i64
  %31 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4
  %33 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %30
  %34 = load float, ptr addrspace(1) %33, align 4
  %35 = add nsw i32 %15, -1
  %36 = add nsw i32 %35, %28
  %37 = sext i32 %36 to i64
  %38 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 4
  %40 = fsub float %34, %39
  %41 = fmul float %40, 5.000000e-01
  %42 = fsub float %32, %41
  store float %42, ptr addrspace(1) %31, align 4
  br label %43

43:                                               ; preds = %6, %27
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z17fdtd_step3_kerneliiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef captures(none) %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %4 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = addrspacecast ptr %2 to ptr addrspace(1)
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %12 = getelementptr inbounds nuw i8, ptr addrspace(4) %11, i64 12
  %.in.i = load i16, ptr addrspace(4) %12, align 4, !tbaa !10
  %13 = zext i16 %.in.i to i32
  %14 = mul i32 %10, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr inbounds nuw i8, ptr addrspace(4) %11, i64 14
  %.in.i22 = load i16, ptr addrspace(4) %18, align 2, !tbaa !10
  %19 = zext i16 %.in.i22 to i32
  %20 = mul i32 %17, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %22 = add i32 %20, %21
  %23 = add nsw i32 %0, -1
  %24 = icmp slt i32 %22, %23
  %25 = add nsw i32 %1, -1
  %26 = icmp slt i32 %16, %25
  %27 = select i1 %24, i1 %26, i1 false
  br i1 %27, label %28, label %53

28:                                               ; preds = %6
  %29 = shl nsw i32 %22, 11
  %30 = add nsw i32 %29, %16
  %31 = sext i32 %30 to i64
  %32 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 4
  %34 = add nsw i32 %16, 1
  %35 = add nsw i32 %34, %29
  %36 = sext i32 %35 to i64
  %37 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %36
  %38 = load float, ptr addrspace(1) %37, align 4
  %39 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %31
  %40 = load float, ptr addrspace(1) %39, align 4
  %41 = fsub float %38, %40
  %42 = add i32 %16, 2048
  %43 = add i32 %42, %29
  %44 = sext i32 %43 to i64
  %45 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %44
  %46 = load float, ptr addrspace(1) %45, align 4
  %47 = fadd float %41, %46
  %48 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %31
  %49 = load float, ptr addrspace(1) %48, align 4
  %50 = fsub float %47, %49
  %51 = fmul float %50, f0x3F333333
  %52 = fsub float %33, %51
  store float %52, ptr addrspace(1) %32, align 4
  br label %53

53:                                               ; preds = %6, %28
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
