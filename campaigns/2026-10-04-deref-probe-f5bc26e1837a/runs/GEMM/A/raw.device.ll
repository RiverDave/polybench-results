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

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv = comdat any

@blockIdx = extern_weak dso_local addrspace(1) constant %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) constant %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) constant %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11gemm_kerneliiiffPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, float noundef %3, float noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, ptr %10, align 4
  store i32 %1, ptr %11, align 4
  store i32 %2, ptr %12, align 4
  store float %3, ptr %13, align 4
  store float %4, ptr %14, align 4
  store ptr %5, ptr %15, align 8
  store ptr %6, ptr %16, align 8
  store ptr %7, ptr %17, align 8
  call void @llvm.lifetime.start.p0(ptr %18)
  br label %20

20:                                               ; preds = %8
  %21 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %22 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %23 = mul i32 %21, %22
  %24 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %25 = add i32 %23, %24
  store i32 %25, ptr %18, align 4
  call void @llvm.lifetime.start.p0(ptr %19)
  br label %26

26:                                               ; preds = %20
  %27 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %28 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %29 = mul i32 %27, %28
  %30 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %31 = add i32 %29, %30
  store i32 %31, ptr %19, align 4
  br label %32

32:                                               ; preds = %26
  %33 = load i32, ptr %19, align 4
  %34 = load i32, ptr %10, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %40

36:                                               ; preds = %32
  %37 = load i32, ptr %18, align 4
  %38 = load i32, ptr %11, align 4
  %39 = icmp slt i32 %37, %38
  br label %41

40:                                               ; preds = %32
  br label %41

41:                                               ; preds = %36, %40
  %42 = phi i1 [ false, %40 ], [ %39, %36 ]
  br label %43

43:                                               ; preds = %41
  br i1 %42, label %44, label %100

44:                                               ; preds = %43
  %45 = load float, ptr %14, align 4
  %46 = load i32, ptr %19, align 4
  %47 = mul nsw i32 %46, 512
  %48 = load i32, ptr %18, align 4
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = load ptr, ptr %17, align 8
  %52 = getelementptr float, ptr %51, i64 %50
  %53 = load float, ptr %52, align 4
  %54 = fmul contract float %53, %45
  store float %54, ptr %52, align 4
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %55

55:                                               ; preds = %44
  br label %56

56:                                               ; preds = %55
  store i32 0, ptr %9, align 4
  br label %57

57:                                               ; preds = %92, %56
  %58 = load i32, ptr %9, align 4
  %59 = load i32, ptr %12, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %95

61:                                               ; preds = %57
  br label %62

62:                                               ; preds = %61
  %63 = load float, ptr %13, align 4
  %64 = load i32, ptr %19, align 4
  %65 = mul nsw i32 %64, 512
  %66 = load i32, ptr %9, align 4
  %67 = add nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = load ptr, ptr %15, align 8
  %70 = getelementptr float, ptr %69, i64 %68
  %71 = load float, ptr %70, align 4
  %72 = fmul contract float %63, %71
  %73 = load i32, ptr %9, align 4
  %74 = mul nsw i32 %73, 512
  %75 = load i32, ptr %18, align 4
  %76 = add nsw i32 %74, %75
  %77 = sext i32 %76 to i64
  %78 = load ptr, ptr %16, align 8
  %79 = getelementptr float, ptr %78, i64 %77
  %80 = load float, ptr %79, align 4
  %81 = fmul contract float %72, %80
  %82 = load i32, ptr %19, align 4
  %83 = mul nsw i32 %82, 512
  %84 = load i32, ptr %18, align 4
  %85 = add nsw i32 %83, %84
  %86 = sext i32 %85 to i64
  %87 = load ptr, ptr %17, align 8
  %88 = getelementptr float, ptr %87, i64 %86
  %89 = load float, ptr %88, align 4
  %90 = fadd contract float %89, %81
  store float %90, ptr %88, align 4
  br label %91

91:                                               ; preds = %62
  br label %92

92:                                               ; preds = %91
  %93 = load i32, ptr %9, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, ptr %9, align 4
  br label %57

95:                                               ; preds = %57
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %98

98:                                               ; preds = %97
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99, %43
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
  call void @llvm.lifetime.end.p0(ptr %19)
  br label %103

103:                                              ; preds = %102
  br label %104

104:                                              ; preds = %103
  br label %105

105:                                              ; preds = %104
  call void @llvm.lifetime.end.p0(ptr %18)
  br label %106

106:                                              ; preds = %105
  br label %107

107:                                              ; preds = %106
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11gemm_kerneliiiffPfS_S___noalias(i32 noundef %0, i32 noundef %1, i32 noundef %2, float noundef %3, float noundef %4, ptr noalias noundef %5, ptr noalias noundef %6, ptr noalias noundef %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, ptr %10, align 4
  store i32 %1, ptr %11, align 4
  store i32 %2, ptr %12, align 4
  store float %3, ptr %13, align 4
  store float %4, ptr %14, align 4
  store ptr %5, ptr %15, align 8
  store ptr %6, ptr %16, align 8
  store ptr %7, ptr %17, align 8
  call void @llvm.lifetime.start.p0(ptr %18)
  br label %20

20:                                               ; preds = %8
  %21 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %22 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %23 = mul i32 %21, %22
  %24 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %25 = add i32 %23, %24
  store i32 %25, ptr %18, align 4
  call void @llvm.lifetime.start.p0(ptr %19)
  br label %26

26:                                               ; preds = %20
  %27 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %28 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %29 = mul i32 %27, %28
  %30 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %31 = add i32 %29, %30
  store i32 %31, ptr %19, align 4
  br label %32

32:                                               ; preds = %26
  %33 = load i32, ptr %19, align 4
  %34 = load i32, ptr %10, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %40

36:                                               ; preds = %32
  %37 = load i32, ptr %18, align 4
  %38 = load i32, ptr %11, align 4
  %39 = icmp slt i32 %37, %38
  br label %41

40:                                               ; preds = %32
  br label %41

41:                                               ; preds = %36, %40
  %42 = phi i1 [ false, %40 ], [ %39, %36 ]
  br label %43

43:                                               ; preds = %41
  br i1 %42, label %44, label %100

44:                                               ; preds = %43
  %45 = load float, ptr %14, align 4
  %46 = load i32, ptr %19, align 4
  %47 = mul nsw i32 %46, 512
  %48 = load i32, ptr %18, align 4
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = load ptr, ptr %17, align 8
  %52 = getelementptr float, ptr %51, i64 %50
  %53 = load float, ptr %52, align 4
  %54 = fmul contract float %53, %45
  store float %54, ptr %52, align 4
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %55

55:                                               ; preds = %44
  br label %56

56:                                               ; preds = %55
  store i32 0, ptr %9, align 4
  br label %57

57:                                               ; preds = %92, %56
  %58 = load i32, ptr %9, align 4
  %59 = load i32, ptr %12, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %95

61:                                               ; preds = %57
  br label %62

62:                                               ; preds = %61
  %63 = load float, ptr %13, align 4
  %64 = load i32, ptr %19, align 4
  %65 = mul nsw i32 %64, 512
  %66 = load i32, ptr %9, align 4
  %67 = add nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = load ptr, ptr %15, align 8
  %70 = getelementptr float, ptr %69, i64 %68
  %71 = load float, ptr %70, align 4
  %72 = fmul contract float %63, %71
  %73 = load i32, ptr %9, align 4
  %74 = mul nsw i32 %73, 512
  %75 = load i32, ptr %18, align 4
  %76 = add nsw i32 %74, %75
  %77 = sext i32 %76 to i64
  %78 = load ptr, ptr %16, align 8
  %79 = getelementptr float, ptr %78, i64 %77
  %80 = load float, ptr %79, align 4
  %81 = fmul contract float %72, %80
  %82 = load i32, ptr %19, align 4
  %83 = mul nsw i32 %82, 512
  %84 = load i32, ptr %18, align 4
  %85 = add nsw i32 %83, %84
  %86 = sext i32 %85 to i64
  %87 = load ptr, ptr %17, align 8
  %88 = getelementptr float, ptr %87, i64 %86
  %89 = load float, ptr %88, align 4
  %90 = fadd contract float %89, %81
  store float %90, ptr %88, align 4
  br label %91

91:                                               ; preds = %62
  br label %92

92:                                               ; preds = %91
  %93 = load i32, ptr %9, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, ptr %9, align 4
  br label %57

95:                                               ; preds = %57
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %98

98:                                               ; preds = %97
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99, %43
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
  call void @llvm.lifetime.end.p0(ptr %19)
  br label %103

103:                                              ; preds = %102
  br label %104

104:                                              ; preds = %103
  br label %105

105:                                              ; preds = %104
  call void @llvm.lifetime.end.p0(ptr %18)
  br label %106

106:                                              ; preds = %105
  br label %107

107:                                              ; preds = %106
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

; Function Attrs: alwaysinline convergent
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent
define linkonce_odr dso_local noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent
define linkonce_odr dso_local noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #1 comdat align 2 {
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y()
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

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3

attributes #0 = { convergent noinline "target-cpu"="sm_86" "target-features"="+ptx87" "uniform-work-group-size" }
attributes #1 = { alwaysinline convergent "target-cpu"="sm_86" "target-features"="+ptx87" "uniform-work-group-size" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { convergent "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
