; ModuleID = '/root/polybenchGpu/HIP/SYR2K/syr2k.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/SYR2K/syr2k.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_45cd172df3287faf = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_45cd172df3287faf to ptr)], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z12syr2k_kerneliiffPfS_S_(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef captures(none) %6) local_unnamed_addr #0 {
  %8 = addrspacecast ptr %5 to ptr addrspace(1)
  %9 = addrspacecast ptr %4 to ptr addrspace(1)
  %10 = addrspacecast ptr %6 to ptr addrspace(1)
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
  %.in.i26 = load i16, ptr addrspace(4) %19, align 2, !tbaa !10
  %20 = zext i16 %.in.i26 to i32
  %21 = mul i32 %18, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %23, 1024
  %25 = icmp slt i32 %17, 1024
  %26 = and i1 %25, %24
  br i1 %26, label %27, label %.loopexit

27:                                               ; preds = %7
  %28 = shl nsw i32 %23, 10
  %29 = add nsw i32 %28, %17
  %30 = sext i32 %29 to i64
  %31 = getelementptr [4 x i8], ptr addrspace(1) %10, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4
  %33 = fmul float %3, %32
  store float %33, ptr addrspace(1) %31, align 4
  %34 = shl nsw i32 %17, 10
  %35 = insertelement <2 x float> poison, float %2, i64 0
  %36 = shufflevector <2 x float> %35, <2 x float> poison, <2 x i32> zeroinitializer
  br label %37

37:                                               ; preds = %37, %27
  %.031 = phi i32 [ 0, %27 ], [ %122, %37 ]
  %38 = phi float [ %33, %27 ], [ %121, %37 ]
  %39 = or disjoint i32 %.031, %28
  %40 = sext i32 %39 to i64
  %41 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %40
  %42 = load float, ptr addrspace(1) %41, align 4
  %43 = add nuw nsw i32 %.031, %34
  %44 = sext i32 %43 to i64
  %45 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %44
  %46 = load float, ptr addrspace(1) %45, align 4
  %47 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %40
  %48 = load float, ptr addrspace(1) %47, align 4
  %49 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %44
  %50 = load float, ptr addrspace(1) %49, align 4
  %51 = insertelement <2 x float> poison, float %42, i64 0
  %52 = insertelement <2 x float> %51, float %48, i64 1
  %53 = fmul <2 x float> %36, %52
  %54 = insertelement <2 x float> poison, float %46, i64 0
  %55 = insertelement <2 x float> %54, float %50, i64 1
  %56 = fmul <2 x float> %53, %55
  %shift = shufflevector <2 x float> %56, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop = fadd <2 x float> %56, %shift
  %57 = extractelement <2 x float> %foldExtExtBinop, i64 0
  %58 = fadd float %38, %57
  store float %58, ptr addrspace(1) %31, align 4
  %59 = or disjoint i32 %.031, 1
  %60 = or disjoint i32 %59, %28
  %61 = sext i32 %60 to i64
  %62 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4
  %64 = add nuw nsw i32 %59, %34
  %65 = sext i32 %64 to i64
  %66 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %61
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %65
  %71 = load float, ptr addrspace(1) %70, align 4
  %72 = insertelement <2 x float> poison, float %63, i64 0
  %73 = insertelement <2 x float> %72, float %69, i64 1
  %74 = fmul <2 x float> %36, %73
  %75 = insertelement <2 x float> poison, float %67, i64 0
  %76 = insertelement <2 x float> %75, float %71, i64 1
  %77 = fmul <2 x float> %74, %76
  %shift.1 = shufflevector <2 x float> %77, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop.1 = fadd <2 x float> %77, %shift.1
  %78 = extractelement <2 x float> %foldExtExtBinop.1, i64 0
  %79 = fadd float %58, %78
  store float %79, ptr addrspace(1) %31, align 4
  %80 = or disjoint i32 %.031, 2
  %81 = or disjoint i32 %80, %28
  %82 = sext i32 %81 to i64
  %83 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %82
  %84 = load float, ptr addrspace(1) %83, align 4
  %85 = add nuw nsw i32 %80, %34
  %86 = sext i32 %85 to i64
  %87 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4
  %89 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %82
  %90 = load float, ptr addrspace(1) %89, align 4
  %91 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %86
  %92 = load float, ptr addrspace(1) %91, align 4
  %93 = insertelement <2 x float> poison, float %84, i64 0
  %94 = insertelement <2 x float> %93, float %90, i64 1
  %95 = fmul <2 x float> %36, %94
  %96 = insertelement <2 x float> poison, float %88, i64 0
  %97 = insertelement <2 x float> %96, float %92, i64 1
  %98 = fmul <2 x float> %95, %97
  %shift.2 = shufflevector <2 x float> %98, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop.2 = fadd <2 x float> %98, %shift.2
  %99 = extractelement <2 x float> %foldExtExtBinop.2, i64 0
  %100 = fadd float %79, %99
  store float %100, ptr addrspace(1) %31, align 4
  %101 = or disjoint i32 %.031, 3
  %102 = or disjoint i32 %101, %28
  %103 = sext i32 %102 to i64
  %104 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %103
  %105 = load float, ptr addrspace(1) %104, align 4
  %106 = add nuw nsw i32 %101, %34
  %107 = sext i32 %106 to i64
  %108 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %107
  %109 = load float, ptr addrspace(1) %108, align 4
  %110 = getelementptr [4 x i8], ptr addrspace(1) %8, i64 %103
  %111 = load float, ptr addrspace(1) %110, align 4
  %112 = getelementptr [4 x i8], ptr addrspace(1) %9, i64 %107
  %113 = load float, ptr addrspace(1) %112, align 4
  %114 = insertelement <2 x float> poison, float %105, i64 0
  %115 = insertelement <2 x float> %114, float %111, i64 1
  %116 = fmul <2 x float> %36, %115
  %117 = insertelement <2 x float> poison, float %109, i64 0
  %118 = insertelement <2 x float> %117, float %113, i64 1
  %119 = fmul <2 x float> %116, %118
  %shift.3 = shufflevector <2 x float> %119, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop.3 = fadd <2 x float> %119, %shift.3
  %120 = extractelement <2 x float> %foldExtExtBinop.3, i64 0
  %121 = fadd float %100, %120
  store float %121, ptr addrspace(1) %31, align 4
  %122 = add nuw nsw i32 %.031, 4
  %exitcond.not.3 = icmp eq i32 %122, 1024
  br i1 %exitcond.not.3, label %.loopexit, label %37

.loopexit:                                        ; preds = %37, %7
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

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
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
