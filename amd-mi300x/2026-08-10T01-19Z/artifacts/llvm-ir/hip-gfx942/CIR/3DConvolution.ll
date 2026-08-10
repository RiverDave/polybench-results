; ModuleID = '/root/polybenchGpu/HIP/3DCONV/3DConvolution.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/3DCONV/3DConvolution.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_824bce6d67c75640 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_824bce6d67c75640 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z20convolution3D_kerneliiiPfS_i(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %4 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
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
  %.in.i89 = load i16, ptr addrspace(4) %17, align 2, !tbaa !10
  %18 = zext i16 %.in.i89 to i32
  %19 = mul i32 %16, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %21 = add i32 %19, %20
  %22 = add nsw i32 %0, -1
  %23 = icmp slt i32 %5, %22
  %24 = add nsw i32 %1, -1
  %25 = icmp slt i32 %21, %24
  %26 = select i1 %23, i1 %25, i1 false
  %27 = add nsw i32 %2, -1
  %28 = icmp slt i32 %15, %27
  %29 = select i1 %26, i1 %28, i1 false
  %30 = icmp sgt i32 %5, 0
  %31 = and i1 %30, %29
  %32 = icmp sgt i32 %21, 0
  %33 = and i1 %32, %31
  %34 = icmp sgt i32 %15, 0
  %35 = and i1 %34, %33
  br i1 %35, label %36, label %142

36:                                               ; preds = %6
  %37 = shl i32 %5, 16
  %38 = add i32 %37, -65536
  %39 = shl i32 %21, 8
  %40 = add i32 %39, -256
  %41 = add nsw i32 %40, %38
  %42 = add nsw i32 %15, -1
  %43 = add nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %44
  %46 = load float, ptr addrspace(1) %45, align 4
  %47 = add i32 %37, 65536
  %48 = add nsw i32 %40, %47
  %49 = add nsw i32 %48, %42
  %50 = sext i32 %49 to i64
  %51 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %50
  %52 = load float, ptr addrspace(1) %51, align 4
  %53 = insertelement <4 x float> poison, float %46, i64 0
  %54 = insertelement <4 x float> %53, float %52, i64 1
  %55 = shufflevector <4 x float> %54, <4 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %56 = fmul <4 x float> %55, <float 2.000000e+00, float 4.000000e+00, float 5.000000e+00, float 7.000000e+00>
  %57 = extractelement <4 x float> %56, i64 0
  %58 = extractelement <4 x float> %56, i64 1
  %59 = fadd float %57, %58
  %60 = extractelement <4 x float> %56, i64 2
  %61 = fadd float %60, %59
  %62 = extractelement <4 x float> %56, i64 3
  %63 = fadd float %62, %61
  %64 = fmul float %46, 8.000000e+00
  %65 = fsub float %63, %64
  %66 = add i32 %15, %37
  %67 = add i32 %66, %40
  %68 = sext i32 %67 to i64
  %69 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %68
  %70 = load float, ptr addrspace(1) %69, align 4
  %71 = insertelement <2 x float> poison, float %52, i64 0
  %72 = insertelement <2 x float> %71, float %70, i64 1
  %73 = fmul <2 x float> %72, <float 1.000000e+01, float 3.000000e+00>
  %74 = extractelement <2 x float> %73, i64 0
  %75 = fadd float %74, %65
  %76 = extractelement <2 x float> %73, i64 1
  %77 = fsub float %75, %76
  %78 = add nuw nsw i32 %66, %39
  %79 = zext nneg i32 %78 to i64
  %80 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %79
  %81 = load float, ptr addrspace(1) %80, align 4
  %82 = add i32 %39, 256
  %83 = add i32 %66, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %84
  %86 = load float, ptr addrspace(1) %85, align 4
  %87 = insertelement <2 x float> poison, float %81, i64 0
  %88 = insertelement <2 x float> %87, float %86, i64 1
  %89 = fmul <2 x float> %88, <float 6.000000e+00, float 9.000000e+00>
  %90 = extractelement <2 x float> %89, i64 0
  %91 = fadd float %90, %77
  %92 = extractelement <2 x float> %89, i64 1
  %93 = fsub float %91, %92
  %94 = add nuw nsw i32 %15, 1
  %95 = add nsw i32 %41, %94
  %96 = sext i32 %95 to i64
  %97 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %96
  %98 = load float, ptr addrspace(1) %97, align 4
  %99 = add nsw i32 %48, %94
  %100 = sext i32 %99 to i64
  %101 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %100
  %102 = load float, ptr addrspace(1) %101, align 4
  %103 = add i32 %94, %38
  %104 = add i32 %103, %39
  %105 = sext i32 %104 to i64
  %106 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %105
  %107 = load float, ptr addrspace(1) %106, align 4
  %108 = add i32 %94, %47
  %109 = add i32 %108, %39
  %110 = sext i32 %109 to i64
  %111 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %110
  %112 = load float, ptr addrspace(1) %111, align 4
  %113 = insertelement <4 x float> poison, float %98, i64 0
  %114 = insertelement <4 x float> %113, float %102, i64 1
  %115 = insertelement <4 x float> %114, float %107, i64 2
  %116 = insertelement <4 x float> %115, float %112, i64 3
  %117 = fmul <4 x float> %116, <float 2.000000e+00, float 4.000000e+00, float 5.000000e+00, float 7.000000e+00>
  %118 = extractelement <4 x float> %117, i64 0
  %119 = fadd float %118, %93
  %120 = extractelement <4 x float> %117, i64 1
  %121 = fadd float %120, %119
  %122 = extractelement <4 x float> %117, i64 2
  %123 = fadd float %122, %121
  %124 = extractelement <4 x float> %117, i64 3
  %125 = fadd float %124, %123
  %126 = add i32 %103, %82
  %127 = sext i32 %126 to i64
  %128 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %127
  %129 = load float, ptr addrspace(1) %128, align 4
  %130 = add i32 %108, %82
  %131 = sext i32 %130 to i64
  %132 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %131
  %133 = load float, ptr addrspace(1) %132, align 4
  %134 = insertelement <2 x float> poison, float %133, i64 0
  %135 = insertelement <2 x float> %134, float %129, i64 1
  %136 = fmul <2 x float> %135, <float 1.000000e+01, float 8.000000e+00>
  %137 = extractelement <2 x float> %136, i64 1
  %138 = fsub float %125, %137
  %139 = extractelement <2 x float> %136, i64 0
  %140 = fadd float %139, %138
  %141 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %79
  store float %140, ptr addrspace(1) %141, align 4
  br label %142

142:                                              ; preds = %6, %36
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
