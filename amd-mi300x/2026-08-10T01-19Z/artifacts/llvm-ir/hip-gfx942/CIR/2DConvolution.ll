; ModuleID = '/root/polybenchGpu/HIP/2DCONV/2DConvolution.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/2DCONV/2DConvolution.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_e9a9979e3dd7e091 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_e9a9979e3dd7e091 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z20convolution2D_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef writeonly captures(none) %3) local_unnamed_addr #0 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %9 = getelementptr inbounds nuw i8, ptr addrspace(4) %8, i64 12
  %.in.i = load i16, ptr addrspace(4) %9, align 4, !tbaa !10
  %10 = zext i16 %.in.i to i32
  %11 = mul i32 %7, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr inbounds nuw i8, ptr addrspace(4) %8, i64 14
  %.in.i45 = load i16, ptr addrspace(4) %15, align 2, !tbaa !10
  %16 = zext i16 %.in.i45 to i32
  %17 = mul i32 %14, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %19 = add i32 %17, %18
  %20 = add nsw i32 %0, -1
  %21 = icmp slt i32 %19, %20
  %22 = add nsw i32 %1, -1
  %23 = icmp slt i32 %13, %22
  %24 = select i1 %21, i1 %23, i1 false
  %25 = icmp sgt i32 %19, 0
  %26 = and i1 %25, %24
  %27 = icmp sgt i32 %13, 0
  %28 = and i1 %27, %26
  br i1 %28, label %29, label %92

29:                                               ; preds = %4
  %30 = shl i32 %19, 12
  %31 = add i32 %30, -4096
  %32 = add nsw i32 %13, -1
  %33 = add nuw nsw i32 %31, %32
  %34 = zext nneg i32 %33 to i64
  %35 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %34
  %36 = load float, ptr addrspace(1) %35, align 4
  %37 = add nuw nsw i32 %31, %13
  %38 = zext nneg i32 %37 to i64
  %39 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %38
  %40 = load float, ptr addrspace(1) %39, align 4
  %41 = insertelement <2 x float> poison, float %36, i64 0
  %42 = insertelement <2 x float> %41, float %40, i64 1
  %43 = fmul <2 x float> %42, <float 2.000000e-01, float 5.000000e-01>
  %shift = shufflevector <2 x float> %43, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop = fadd <2 x float> %43, %shift
  %44 = add nuw nsw i32 %13, 1
  %45 = add nuw nsw i32 %31, %44
  %46 = zext nneg i32 %45 to i64
  %47 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4
  %49 = add nuw nsw i32 %30, %32
  %50 = zext nneg i32 %49 to i64
  %51 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %50
  %52 = load float, ptr addrspace(1) %51, align 4
  %53 = insertelement <2 x float> poison, float %48, i64 0
  %54 = insertelement <2 x float> %53, float %52, i64 1
  %55 = fmul <2 x float> %54, <float 8.000000e-01, float 3.000000e-01>
  %foldExtExtBinop50 = fsub <2 x float> %foldExtExtBinop, %55
  %shift52 = shufflevector <2 x float> %55, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop53 = fsub <2 x float> %foldExtExtBinop50, %shift52
  %56 = add nuw nsw i32 %30, %13
  %57 = zext nneg i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = add nuw nsw i32 %30, %44
  %61 = zext nneg i32 %60 to i64
  %62 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = insertelement <2 x float> poison, float %59, i64 0
  %65 = insertelement <2 x float> %64, float %63, i64 1
  %66 = fmul <2 x float> %65, <float 6.000000e-01, float f0x3F666666>
  %foldExtExtBinop55 = fadd <2 x float> %foldExtExtBinop53, %66
  %67 = add i32 %30, 4096
  %68 = add nuw nsw i32 %67, %32
  %69 = zext nneg i32 %68 to i64
  %70 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %69
  %71 = load float, ptr addrspace(1) %70, align 4
  %72 = add nuw nsw i32 %67, %13
  %73 = zext nneg i32 %72 to i64
  %74 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %73
  %75 = load float, ptr addrspace(1) %74, align 4
  %76 = add nuw nsw i32 %67, %44
  %77 = zext nneg i32 %76 to i64
  %78 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %77
  %79 = load float, ptr addrspace(1) %78, align 4
  %shift57 = shufflevector <2 x float> %66, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop58 = fsub <2 x float> %foldExtExtBinop55, %shift57
  %80 = extractelement <2 x float> %foldExtExtBinop58, i64 0
  %81 = insertelement <4 x float> poison, float %71, i64 0
  %82 = insertelement <4 x float> %81, float %75, i64 1
  %83 = insertelement <4 x float> %82, float %79, i64 2
  %84 = fmul <4 x float> %83, <float 4.000000e-01, float f0x3F333333, float 1.000000e-01, float poison>
  %85 = extractelement <4 x float> %84, i64 0
  %86 = fadd float %80, %85
  %87 = extractelement <4 x float> %84, i64 1
  %88 = fadd float %86, %87
  %89 = extractelement <4 x float> %84, i64 2
  %90 = fadd float %88, %89
  %91 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %57
  store float %90, ptr addrspace(1) %91, align 4
  br label %92

92:                                               ; preds = %4, %29
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
