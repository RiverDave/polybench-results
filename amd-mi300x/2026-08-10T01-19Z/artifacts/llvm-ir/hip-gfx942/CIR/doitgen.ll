; ModuleID = '/root/polybenchGpu/HIP/DOITGEN/doitgen.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/DOITGEN/doitgen.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_ba17bf3f00ee2681 = addrspace(1) global i8 0
@llvm.compiler.used = appending global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_ba17bf3f00ee2681 to ptr)], section "llvm.metadata"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z15doitgen_kernel1PfS_S_i(ptr nofree noundef writeonly captures(none) %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = addrspacecast ptr %2 to ptr addrspace(1)
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %0 to ptr addrspace(1)
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %10 = getelementptr inbounds nuw i8, ptr addrspace(4) %9, i64 12
  %.in.i = load i16, ptr addrspace(4) %10, align 4, !tbaa !10
  %11 = zext i16 %.in.i to i32
  %12 = mul i32 %8, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr inbounds nuw i8, ptr addrspace(4) %9, i64 14
  %.in.i24 = load i16, ptr addrspace(4) %16, align 2, !tbaa !10
  %17 = zext i16 %.in.i24 to i32
  %18 = mul i32 %15, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %14, 128
  %22 = icmp slt i32 %20, 128
  %23 = and i1 %21, %22
  br i1 %23, label %24, label %.loopexit

24:                                               ; preds = %4
  %25 = shl nsw i32 %3, 14
  %26 = shl nsw i32 %20, 7
  %27 = add nsw i32 %26, %25
  %28 = add nsw i32 %27, %14
  %29 = sext i32 %28 to i64
  %30 = getelementptr [4 x i8], ptr addrspace(1) %7, i64 %29
  store float 0.000000e+00, ptr addrspace(1) %30, align 4
  br label %31

31:                                               ; preds = %31, %24
  %.029 = phi i32 [ 0, %24 ], [ %128, %31 ]
  %32 = phi float [ 0.000000e+00, %24 ], [ %127, %31 ]
  %33 = or disjoint i32 %.029, %27
  %34 = sext i32 %33 to i64
  %35 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %34
  %36 = load float, ptr addrspace(1) %35, align 4
  %37 = shl nuw nsw i32 %.029, 7
  %38 = add nsw i32 %37, %14
  %39 = sext i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %39
  %41 = load float, ptr addrspace(1) %40, align 4
  %42 = fmul float %36, %41
  %43 = fadd float %32, %42
  store float %43, ptr addrspace(1) %30, align 4
  %44 = or disjoint i32 %.029, 1
  %45 = or disjoint i32 %44, %27
  %46 = sext i32 %45 to i64
  %47 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4
  %49 = shl nuw nsw i32 %44, 7
  %50 = add nsw i32 %49, %14
  %51 = sext i32 %50 to i64
  %52 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %51
  %53 = load float, ptr addrspace(1) %52, align 4
  %54 = fmul float %48, %53
  %55 = fadd float %43, %54
  store float %55, ptr addrspace(1) %30, align 4
  %56 = or disjoint i32 %.029, 2
  %57 = or disjoint i32 %56, %27
  %58 = sext i32 %57 to i64
  %59 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %58
  %60 = load float, ptr addrspace(1) %59, align 4
  %61 = shl nuw nsw i32 %56, 7
  %62 = add nsw i32 %61, %14
  %63 = sext i32 %62 to i64
  %64 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %63
  %65 = load float, ptr addrspace(1) %64, align 4
  %66 = fmul float %60, %65
  %67 = fadd float %55, %66
  store float %67, ptr addrspace(1) %30, align 4
  %68 = or disjoint i32 %.029, 3
  %69 = or disjoint i32 %68, %27
  %70 = sext i32 %69 to i64
  %71 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %70
  %72 = load float, ptr addrspace(1) %71, align 4
  %73 = shl nuw nsw i32 %68, 7
  %74 = add nsw i32 %73, %14
  %75 = sext i32 %74 to i64
  %76 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %75
  %77 = load float, ptr addrspace(1) %76, align 4
  %78 = fmul float %72, %77
  %79 = fadd float %67, %78
  store float %79, ptr addrspace(1) %30, align 4
  %80 = or disjoint i32 %.029, 4
  %81 = or disjoint i32 %80, %27
  %82 = sext i32 %81 to i64
  %83 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %82
  %84 = load float, ptr addrspace(1) %83, align 4
  %85 = shl nuw nsw i32 %80, 7
  %86 = add nsw i32 %85, %14
  %87 = sext i32 %86 to i64
  %88 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %87
  %89 = load float, ptr addrspace(1) %88, align 4
  %90 = fmul float %84, %89
  %91 = fadd float %79, %90
  store float %91, ptr addrspace(1) %30, align 4
  %92 = or disjoint i32 %.029, 5
  %93 = or disjoint i32 %92, %27
  %94 = sext i32 %93 to i64
  %95 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %94
  %96 = load float, ptr addrspace(1) %95, align 4
  %97 = shl nuw nsw i32 %92, 7
  %98 = add nsw i32 %97, %14
  %99 = sext i32 %98 to i64
  %100 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %99
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = fmul float %96, %101
  %103 = fadd float %91, %102
  store float %103, ptr addrspace(1) %30, align 4
  %104 = or disjoint i32 %.029, 6
  %105 = or disjoint i32 %104, %27
  %106 = sext i32 %105 to i64
  %107 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %106
  %108 = load float, ptr addrspace(1) %107, align 4
  %109 = shl nuw nsw i32 %104, 7
  %110 = add nsw i32 %109, %14
  %111 = sext i32 %110 to i64
  %112 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %111
  %113 = load float, ptr addrspace(1) %112, align 4
  %114 = fmul float %108, %113
  %115 = fadd float %103, %114
  store float %115, ptr addrspace(1) %30, align 4
  %116 = or disjoint i32 %.029, 7
  %117 = or disjoint i32 %116, %27
  %118 = sext i32 %117 to i64
  %119 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %118
  %120 = load float, ptr addrspace(1) %119, align 4
  %121 = shl nuw nsw i32 %116, 7
  %122 = add nsw i32 %121, %14
  %123 = sext i32 %122 to i64
  %124 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %123
  %125 = load float, ptr addrspace(1) %124, align 4
  %126 = fmul float %120, %125
  %127 = fadd float %115, %126
  store float %127, ptr addrspace(1) %30, align 4
  %128 = add nuw nsw i32 %.029, 8
  %exitcond.not.7 = icmp eq i32 %128, 128
  br i1 %exitcond.not.7, label %.loopexit, label %31

.loopexit:                                        ; preds = %31, %4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define protected amdgpu_kernel void @_Z15doitgen_kernel2PfS_S_i(ptr nofree noundef readonly captures(none) %0, ptr nofree noundef writeonly captures(none) %1, ptr nofree noundef readnone captures(none) %2, i32 noundef %3) local_unnamed_addr #1 {
  %5 = addrspacecast ptr %0 to ptr addrspace(1)
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
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
  %.in.i10 = load i16, ptr addrspace(4) %15, align 2, !tbaa !10
  %16 = zext i16 %.in.i10 to i32
  %17 = mul i32 %14, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %13, 128
  %21 = icmp slt i32 %19, 128
  %22 = and i1 %20, %21
  br i1 %22, label %23, label %32

23:                                               ; preds = %4
  %24 = shl nsw i32 %3, 14
  %25 = shl nsw i32 %19, 7
  %26 = add i32 %13, %24
  %27 = add i32 %26, %25
  %28 = sext i32 %27 to i64
  %29 = getelementptr [4 x i8], ptr addrspace(1) %6, i64 %28
  %30 = getelementptr [4 x i8], ptr addrspace(1) %5, i64 %28
  %31 = load float, ptr addrspace(1) %30, align 4
  store float %31, ptr addrspace(1) %29, align 4
  br label %32

32:                                               ; preds = %4, %23
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

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "target-cpu"="gfx942" "uniform-work-group-size" }
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
