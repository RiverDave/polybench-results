; ModuleID = 'device_cuda_nvptx64_nvidia_cuda__sm_86'
source_filename = "device_cuda_nvptx64_nvidia_cuda__sm_86"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

@blockIdx = extern_weak dso_local addrspace(1) constant %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) constant %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) constant %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z14gesummv_kerneliffPfS_S_S_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr noundef dereferenceable(67108864) %3, ptr noundef dereferenceable(67108864) %4, ptr noundef dereferenceable(16384) %5, ptr noundef dereferenceable(16384) %6, ptr noundef dereferenceable(16384) %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  store i32 %0, ptr %10, align 4
  store float %1, ptr %11, align 4
  store float %2, ptr %12, align 4
  store ptr %3, ptr %13, align 8
  store ptr %4, ptr %14, align 8
  store ptr %5, ptr %15, align 8
  store ptr %6, ptr %16, align 8
  store ptr %7, ptr %17, align 8
  call void @llvm.lifetime.start.p0(ptr %18)
  br label %19

19:                                               ; preds = %8
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %21 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %22 = mul i32 %20, %21
  %23 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %24 = add i32 %22, %23
  store i32 %24, ptr %18, align 4
  br label %25

25:                                               ; preds = %19
  %26 = load i32, ptr %18, align 4
  %27 = load i32, ptr %10, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %106

29:                                               ; preds = %25
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %30

30:                                               ; preds = %29
  br label %31

31:                                               ; preds = %30
  store i32 0, ptr %9, align 4
  br label %32

32:                                               ; preds = %79, %31
  %33 = load i32, ptr %9, align 4
  %34 = load i32, ptr %10, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %82

36:                                               ; preds = %32
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %18, align 4
  %39 = mul nsw i32 %38, 4096
  %40 = load i32, ptr %9, align 4
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = load ptr, ptr %13, align 8
  %44 = getelementptr float, ptr %43, i64 %42
  %45 = load float, ptr %44, align 4
  %46 = load i32, ptr %9, align 4
  %47 = sext i32 %46 to i64
  %48 = load ptr, ptr %16, align 8
  %49 = getelementptr float, ptr %48, i64 %47
  %50 = load float, ptr %49, align 4
  %51 = fmul contract float %45, %50
  %52 = load i32, ptr %18, align 4
  %53 = sext i32 %52 to i64
  %54 = load ptr, ptr %15, align 8
  %55 = getelementptr float, ptr %54, i64 %53
  %56 = load float, ptr %55, align 4
  %57 = fadd contract float %56, %51
  store float %57, ptr %55, align 4
  %58 = load i32, ptr %18, align 4
  %59 = mul nsw i32 %58, 4096
  %60 = load i32, ptr %9, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %14, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = load i32, ptr %9, align 4
  %67 = sext i32 %66 to i64
  %68 = load ptr, ptr %16, align 8
  %69 = getelementptr float, ptr %68, i64 %67
  %70 = load float, ptr %69, align 4
  %71 = fmul contract float %65, %70
  %72 = load i32, ptr %18, align 4
  %73 = sext i32 %72 to i64
  %74 = load ptr, ptr %17, align 8
  %75 = getelementptr float, ptr %74, i64 %73
  %76 = load float, ptr %75, align 4
  %77 = fadd contract float %76, %71
  store float %77, ptr %75, align 4
  br label %78

78:                                               ; preds = %37
  br label %79

79:                                               ; preds = %78
  %80 = load i32, ptr %9, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr %9, align 4
  br label %32

82:                                               ; preds = %32
  br label %83

83:                                               ; preds = %82
  %84 = load float, ptr %11, align 4
  %85 = load i32, ptr %18, align 4
  %86 = sext i32 %85 to i64
  %87 = load ptr, ptr %15, align 8
  %88 = getelementptr float, ptr %87, i64 %86
  %89 = load float, ptr %88, align 4
  %90 = fmul contract float %84, %89
  %91 = load float, ptr %12, align 4
  %92 = load i32, ptr %18, align 4
  %93 = sext i32 %92 to i64
  %94 = load ptr, ptr %17, align 8
  %95 = getelementptr float, ptr %94, i64 %93
  %96 = load float, ptr %95, align 4
  %97 = fmul contract float %91, %96
  %98 = fadd contract float %90, %97
  %99 = load i32, ptr %18, align 4
  %100 = sext i32 %99 to i64
  %101 = load ptr, ptr %17, align 8
  %102 = getelementptr float, ptr %101, i64 %100
  store float %98, ptr %102, align 4
  br label %103

103:                                              ; preds = %83
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %104

104:                                              ; preds = %103
  br label %105

105:                                              ; preds = %104
  br label %106

106:                                              ; preds = %105, %25
  br label %107

107:                                              ; preds = %106
  br label %108

108:                                              ; preds = %107
  call void @llvm.lifetime.end.p0(ptr %18)
  br label %109

109:                                              ; preds = %108
  br label %110

110:                                              ; preds = %109
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z14gesummv_kerneliffPfS_S_S_S___noalias(i32 noundef %0, float noundef %1, float noundef %2, ptr noalias noundef dereferenceable(67108864) %3, ptr noalias noundef dereferenceable(67108864) %4, ptr noalias noundef dereferenceable(16384) %5, ptr noalias noundef dereferenceable(16384) %6, ptr noalias noundef dereferenceable(16384) %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  store i32 %0, ptr %10, align 4
  store float %1, ptr %11, align 4
  store float %2, ptr %12, align 4
  store ptr %3, ptr %13, align 8
  store ptr %4, ptr %14, align 8
  store ptr %5, ptr %15, align 8
  store ptr %6, ptr %16, align 8
  store ptr %7, ptr %17, align 8
  call void @llvm.lifetime.start.p0(ptr %18)
  br label %19

19:                                               ; preds = %8
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %21 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %22 = mul i32 %20, %21
  %23 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %24 = add i32 %22, %23
  store i32 %24, ptr %18, align 4
  br label %25

25:                                               ; preds = %19
  %26 = load i32, ptr %18, align 4
  %27 = load i32, ptr %10, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %106

29:                                               ; preds = %25
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %30

30:                                               ; preds = %29
  br label %31

31:                                               ; preds = %30
  store i32 0, ptr %9, align 4
  br label %32

32:                                               ; preds = %79, %31
  %33 = load i32, ptr %9, align 4
  %34 = load i32, ptr %10, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %82

36:                                               ; preds = %32
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %18, align 4
  %39 = mul nsw i32 %38, 4096
  %40 = load i32, ptr %9, align 4
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = load ptr, ptr %13, align 8
  %44 = getelementptr float, ptr %43, i64 %42
  %45 = load float, ptr %44, align 4
  %46 = load i32, ptr %9, align 4
  %47 = sext i32 %46 to i64
  %48 = load ptr, ptr %16, align 8
  %49 = getelementptr float, ptr %48, i64 %47
  %50 = load float, ptr %49, align 4
  %51 = fmul contract float %45, %50
  %52 = load i32, ptr %18, align 4
  %53 = sext i32 %52 to i64
  %54 = load ptr, ptr %15, align 8
  %55 = getelementptr float, ptr %54, i64 %53
  %56 = load float, ptr %55, align 4
  %57 = fadd contract float %56, %51
  store float %57, ptr %55, align 4
  %58 = load i32, ptr %18, align 4
  %59 = mul nsw i32 %58, 4096
  %60 = load i32, ptr %9, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %14, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = load i32, ptr %9, align 4
  %67 = sext i32 %66 to i64
  %68 = load ptr, ptr %16, align 8
  %69 = getelementptr float, ptr %68, i64 %67
  %70 = load float, ptr %69, align 4
  %71 = fmul contract float %65, %70
  %72 = load i32, ptr %18, align 4
  %73 = sext i32 %72 to i64
  %74 = load ptr, ptr %17, align 8
  %75 = getelementptr float, ptr %74, i64 %73
  %76 = load float, ptr %75, align 4
  %77 = fadd contract float %76, %71
  store float %77, ptr %75, align 4
  br label %78

78:                                               ; preds = %37
  br label %79

79:                                               ; preds = %78
  %80 = load i32, ptr %9, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr %9, align 4
  br label %32

82:                                               ; preds = %32
  br label %83

83:                                               ; preds = %82
  %84 = load float, ptr %11, align 4
  %85 = load i32, ptr %18, align 4
  %86 = sext i32 %85 to i64
  %87 = load ptr, ptr %15, align 8
  %88 = getelementptr float, ptr %87, i64 %86
  %89 = load float, ptr %88, align 4
  %90 = fmul contract float %84, %89
  %91 = load float, ptr %12, align 4
  %92 = load i32, ptr %18, align 4
  %93 = sext i32 %92 to i64
  %94 = load ptr, ptr %17, align 8
  %95 = getelementptr float, ptr %94, i64 %93
  %96 = load float, ptr %95, align 4
  %97 = fmul contract float %91, %96
  %98 = fadd contract float %90, %97
  %99 = load i32, ptr %18, align 4
  %100 = sext i32 %99 to i64
  %101 = load ptr, ptr %17, align 8
  %102 = getelementptr float, ptr %101, i64 %100
  store float %98, ptr %102, align 4
  br label %103

103:                                              ; preds = %83
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %104

104:                                              ; preds = %103
  br label %105

105:                                              ; preds = %104
  br label %106

106:                                              ; preds = %105, %25
  br label %107

107:                                              ; preds = %106
  br label %108

108:                                              ; preds = %107
  call void @llvm.lifetime.end.p0(ptr %18)
  br label %109

109:                                              ; preds = %108
  br label %110

110:                                              ; preds = %109
  ret void
}

; Function Attrs: alwaysinline convergent
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent
define linkonce_odr dso_local noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  ret i32 %1
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #3

attributes #0 = { convergent noinline "target-cpu"="sm_86" "target-features"="+ptx87" "uniform-work-group-size" }
attributes #1 = { alwaysinline convergent "target-cpu"="sm_86" "target-features"="+ptx87" "uniform-work-group-size" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { convergent "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
