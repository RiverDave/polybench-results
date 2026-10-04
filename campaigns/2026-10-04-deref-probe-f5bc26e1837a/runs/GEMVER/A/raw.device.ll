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
define dso_local ptx_kernel void @_Z14gemver_kernel1iffPfS_S_S_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, ptr %9, align 4
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  store ptr %6, ptr %13, align 8
  store ptr %7, ptr %14, align 8
  call void @llvm.lifetime.start.p0(ptr %15)
  br label %17

17:                                               ; preds = %8
  %18 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %19 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %20 = mul i32 %18, %19
  %21 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %22 = add i32 %20, %21
  store i32 %22, ptr %15, align 4
  call void @llvm.lifetime.start.p0(ptr %16)
  br label %23

23:                                               ; preds = %17
  %24 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %25 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %26 = mul i32 %24, %25
  %27 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %28 = add i32 %26, %27
  store i32 %28, ptr %16, align 4
  br label %29

29:                                               ; preds = %23
  %30 = load i32, ptr %16, align 4
  %31 = load i32, ptr %9, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %37

33:                                               ; preds = %29
  %34 = load i32, ptr %15, align 4
  %35 = load i32, ptr %9, align 4
  %36 = icmp slt i32 %34, %35
  br label %38

37:                                               ; preds = %29
  br label %38

38:                                               ; preds = %33, %37
  %39 = phi i1 [ false, %37 ], [ %36, %33 ]
  br label %40

40:                                               ; preds = %38
  br i1 %39, label %41, label %74

41:                                               ; preds = %40
  %42 = load i32, ptr %16, align 4
  %43 = sext i32 %42 to i64
  %44 = load ptr, ptr %13, align 8
  %45 = getelementptr float, ptr %44, i64 %43
  %46 = load float, ptr %45, align 4
  %47 = load i32, ptr %15, align 4
  %48 = sext i32 %47 to i64
  %49 = load ptr, ptr %11, align 8
  %50 = getelementptr float, ptr %49, i64 %48
  %51 = load float, ptr %50, align 4
  %52 = fmul contract float %46, %51
  %53 = load i32, ptr %16, align 4
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %14, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = load i32, ptr %15, align 4
  %59 = sext i32 %58 to i64
  %60 = load ptr, ptr %12, align 8
  %61 = getelementptr float, ptr %60, i64 %59
  %62 = load float, ptr %61, align 4
  %63 = fmul contract float %57, %62
  %64 = fadd contract float %52, %63
  %65 = load i32, ptr %16, align 4
  %66 = mul nsw i32 %65, 4096
  %67 = load i32, ptr %15, align 4
  %68 = add nsw i32 %66, %67
  %69 = sext i32 %68 to i64
  %70 = load ptr, ptr %10, align 8
  %71 = getelementptr float, ptr %70, i64 %69
  %72 = load float, ptr %71, align 4
  %73 = fadd contract float %72, %64
  store float %73, ptr %71, align 4
  br label %74

74:                                               ; preds = %41, %40
  br label %75

75:                                               ; preds = %74
  br label %76

76:                                               ; preds = %75
  call void @llvm.lifetime.end.p0(ptr %16)
  br label %77

77:                                               ; preds = %76
  br label %78

78:                                               ; preds = %77
  br label %79

79:                                               ; preds = %78
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %80

80:                                               ; preds = %79
  br label %81

81:                                               ; preds = %80
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z14gemver_kernel1iffPfS_S_S_S___noalias(i32 noundef %0, float noundef %1, float noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, ptr noalias noundef %5, ptr noalias noundef %6, ptr noalias noundef %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, ptr %9, align 4
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  store ptr %6, ptr %13, align 8
  store ptr %7, ptr %14, align 8
  call void @llvm.lifetime.start.p0(ptr %15)
  br label %17

17:                                               ; preds = %8
  %18 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %19 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %20 = mul i32 %18, %19
  %21 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %22 = add i32 %20, %21
  store i32 %22, ptr %15, align 4
  call void @llvm.lifetime.start.p0(ptr %16)
  br label %23

23:                                               ; preds = %17
  %24 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %25 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %26 = mul i32 %24, %25
  %27 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %28 = add i32 %26, %27
  store i32 %28, ptr %16, align 4
  br label %29

29:                                               ; preds = %23
  %30 = load i32, ptr %16, align 4
  %31 = load i32, ptr %9, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %37

33:                                               ; preds = %29
  %34 = load i32, ptr %15, align 4
  %35 = load i32, ptr %9, align 4
  %36 = icmp slt i32 %34, %35
  br label %38

37:                                               ; preds = %29
  br label %38

38:                                               ; preds = %33, %37
  %39 = phi i1 [ false, %37 ], [ %36, %33 ]
  br label %40

40:                                               ; preds = %38
  br i1 %39, label %41, label %74

41:                                               ; preds = %40
  %42 = load i32, ptr %16, align 4
  %43 = sext i32 %42 to i64
  %44 = load ptr, ptr %13, align 8
  %45 = getelementptr float, ptr %44, i64 %43
  %46 = load float, ptr %45, align 4
  %47 = load i32, ptr %15, align 4
  %48 = sext i32 %47 to i64
  %49 = load ptr, ptr %11, align 8
  %50 = getelementptr float, ptr %49, i64 %48
  %51 = load float, ptr %50, align 4
  %52 = fmul contract float %46, %51
  %53 = load i32, ptr %16, align 4
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %14, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = load i32, ptr %15, align 4
  %59 = sext i32 %58 to i64
  %60 = load ptr, ptr %12, align 8
  %61 = getelementptr float, ptr %60, i64 %59
  %62 = load float, ptr %61, align 4
  %63 = fmul contract float %57, %62
  %64 = fadd contract float %52, %63
  %65 = load i32, ptr %16, align 4
  %66 = mul nsw i32 %65, 4096
  %67 = load i32, ptr %15, align 4
  %68 = add nsw i32 %66, %67
  %69 = sext i32 %68 to i64
  %70 = load ptr, ptr %10, align 8
  %71 = getelementptr float, ptr %70, i64 %69
  %72 = load float, ptr %71, align 4
  %73 = fadd contract float %72, %64
  store float %73, ptr %71, align 4
  br label %74

74:                                               ; preds = %41, %40
  br label %75

75:                                               ; preds = %74
  br label %76

76:                                               ; preds = %75
  call void @llvm.lifetime.end.p0(ptr %16)
  br label %77

77:                                               ; preds = %76
  br label %78

78:                                               ; preds = %77
  br label %79

79:                                               ; preds = %78
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %80

80:                                               ; preds = %79
  br label %81

81:                                               ; preds = %80
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

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z14gemver_kernel2iffPfS_S_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  store i32 %0, ptr %9, align 4
  store float %2, ptr %10, align 4
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store ptr %5, ptr %13, align 8
  store ptr %6, ptr %14, align 8
  call void @llvm.lifetime.start.p0(ptr %15)
  br label %16

16:                                               ; preds = %7
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %18 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %19 = mul i32 %17, %18
  %20 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %21 = add i32 %19, %20
  store i32 %21, ptr %15, align 4
  br label %22

22:                                               ; preds = %16
  %23 = load i32, ptr %15, align 4
  %24 = load i32, ptr %9, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %77

26:                                               ; preds = %22
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %27

27:                                               ; preds = %26
  br label %28

28:                                               ; preds = %27
  store i32 0, ptr %8, align 4
  br label %29

29:                                               ; preds = %58, %28
  %30 = load i32, ptr %8, align 4
  %31 = load i32, ptr %9, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %61

33:                                               ; preds = %29
  br label %34

34:                                               ; preds = %33
  %35 = load float, ptr %10, align 4
  %36 = load i32, ptr %8, align 4
  %37 = mul nsw i32 %36, 4096
  %38 = load i32, ptr %15, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = load ptr, ptr %11, align 8
  %42 = getelementptr float, ptr %41, i64 %40
  %43 = load float, ptr %42, align 4
  %44 = fmul contract float %35, %43
  %45 = load i32, ptr %8, align 4
  %46 = sext i32 %45 to i64
  %47 = load ptr, ptr %13, align 8
  %48 = getelementptr float, ptr %47, i64 %46
  %49 = load float, ptr %48, align 4
  %50 = fmul contract float %44, %49
  %51 = load i32, ptr %15, align 4
  %52 = sext i32 %51 to i64
  %53 = load ptr, ptr %12, align 8
  %54 = getelementptr float, ptr %53, i64 %52
  %55 = load float, ptr %54, align 4
  %56 = fadd contract float %55, %50
  store float %56, ptr %54, align 4
  br label %57

57:                                               ; preds = %34
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %8, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %8, align 4
  br label %29

61:                                               ; preds = %29
  br label %62

62:                                               ; preds = %61
  %63 = load i32, ptr %15, align 4
  %64 = sext i32 %63 to i64
  %65 = load ptr, ptr %14, align 8
  %66 = getelementptr float, ptr %65, i64 %64
  %67 = load float, ptr %66, align 4
  %68 = load i32, ptr %15, align 4
  %69 = sext i32 %68 to i64
  %70 = load ptr, ptr %12, align 8
  %71 = getelementptr float, ptr %70, i64 %69
  %72 = load float, ptr %71, align 4
  %73 = fadd contract float %72, %67
  store float %73, ptr %71, align 4
  br label %74

74:                                               ; preds = %62
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %75

75:                                               ; preds = %74
  br label %76

76:                                               ; preds = %75
  br label %77

77:                                               ; preds = %76, %22
  br label %78

78:                                               ; preds = %77
  br label %79

79:                                               ; preds = %78
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %80

80:                                               ; preds = %79
  br label %81

81:                                               ; preds = %80
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z14gemver_kernel2iffPfS_S_S___noalias(i32 noundef %0, float noundef %1, float noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, ptr noalias noundef %5, ptr noalias noundef %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  store i32 %0, ptr %9, align 4
  store float %2, ptr %10, align 4
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store ptr %5, ptr %13, align 8
  store ptr %6, ptr %14, align 8
  call void @llvm.lifetime.start.p0(ptr %15)
  br label %16

16:                                               ; preds = %7
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %18 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %19 = mul i32 %17, %18
  %20 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %21 = add i32 %19, %20
  store i32 %21, ptr %15, align 4
  br label %22

22:                                               ; preds = %16
  %23 = load i32, ptr %15, align 4
  %24 = load i32, ptr %9, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %77

26:                                               ; preds = %22
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %27

27:                                               ; preds = %26
  br label %28

28:                                               ; preds = %27
  store i32 0, ptr %8, align 4
  br label %29

29:                                               ; preds = %58, %28
  %30 = load i32, ptr %8, align 4
  %31 = load i32, ptr %9, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %61

33:                                               ; preds = %29
  br label %34

34:                                               ; preds = %33
  %35 = load float, ptr %10, align 4
  %36 = load i32, ptr %8, align 4
  %37 = mul nsw i32 %36, 4096
  %38 = load i32, ptr %15, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = load ptr, ptr %11, align 8
  %42 = getelementptr float, ptr %41, i64 %40
  %43 = load float, ptr %42, align 4
  %44 = fmul contract float %35, %43
  %45 = load i32, ptr %8, align 4
  %46 = sext i32 %45 to i64
  %47 = load ptr, ptr %13, align 8
  %48 = getelementptr float, ptr %47, i64 %46
  %49 = load float, ptr %48, align 4
  %50 = fmul contract float %44, %49
  %51 = load i32, ptr %15, align 4
  %52 = sext i32 %51 to i64
  %53 = load ptr, ptr %12, align 8
  %54 = getelementptr float, ptr %53, i64 %52
  %55 = load float, ptr %54, align 4
  %56 = fadd contract float %55, %50
  store float %56, ptr %54, align 4
  br label %57

57:                                               ; preds = %34
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %8, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %8, align 4
  br label %29

61:                                               ; preds = %29
  br label %62

62:                                               ; preds = %61
  %63 = load i32, ptr %15, align 4
  %64 = sext i32 %63 to i64
  %65 = load ptr, ptr %14, align 8
  %66 = getelementptr float, ptr %65, i64 %64
  %67 = load float, ptr %66, align 4
  %68 = load i32, ptr %15, align 4
  %69 = sext i32 %68 to i64
  %70 = load ptr, ptr %12, align 8
  %71 = getelementptr float, ptr %70, i64 %69
  %72 = load float, ptr %71, align 4
  %73 = fadd contract float %72, %67
  store float %73, ptr %71, align 4
  br label %74

74:                                               ; preds = %62
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %75

75:                                               ; preds = %74
  br label %76

76:                                               ; preds = %75
  br label %77

77:                                               ; preds = %76, %22
  br label %78

78:                                               ; preds = %77
  br label %79

79:                                               ; preds = %78
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %80

80:                                               ; preds = %79
  br label %81

81:                                               ; preds = %80
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z14gemver_kernel3iffPfS_S_(i32 noundef %0, float noundef %1, float noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca float, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store float %1, ptr %9, align 4
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  call void @llvm.lifetime.start.p0(ptr %13)
  br label %14

14:                                               ; preds = %6
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %17 = mul i32 %15, %16
  %18 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %19 = add i32 %17, %18
  store i32 %19, ptr %13, align 4
  br label %20

20:                                               ; preds = %14
  %21 = load i32, ptr %13, align 4
  %22 = icmp sge i32 %21, 0
  br i1 %22, label %23, label %27

23:                                               ; preds = %20
  %24 = load i32, ptr %13, align 4
  %25 = load i32, ptr %8, align 4
  %26 = icmp slt i32 %24, %25
  br label %28

27:                                               ; preds = %20
  br label %28

28:                                               ; preds = %23, %27
  %29 = phi i1 [ false, %27 ], [ %26, %23 ]
  br label %30

30:                                               ; preds = %28
  br i1 %29, label %31, label %71

31:                                               ; preds = %30
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %32

32:                                               ; preds = %31
  br label %33

33:                                               ; preds = %32
  store i32 0, ptr %7, align 4
  br label %34

34:                                               ; preds = %63, %33
  %35 = load i32, ptr %7, align 4
  %36 = load i32, ptr %8, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %66

38:                                               ; preds = %34
  br label %39

39:                                               ; preds = %38
  %40 = load float, ptr %9, align 4
  %41 = load i32, ptr %13, align 4
  %42 = mul nsw i32 %41, 4096
  %43 = load i32, ptr %7, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %10, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fmul contract float %40, %48
  %50 = load i32, ptr %7, align 4
  %51 = sext i32 %50 to i64
  %52 = load ptr, ptr %11, align 8
  %53 = getelementptr float, ptr %52, i64 %51
  %54 = load float, ptr %53, align 4
  %55 = fmul contract float %49, %54
  %56 = load i32, ptr %13, align 4
  %57 = sext i32 %56 to i64
  %58 = load ptr, ptr %12, align 8
  %59 = getelementptr float, ptr %58, i64 %57
  %60 = load float, ptr %59, align 4
  %61 = fadd contract float %60, %55
  store float %61, ptr %59, align 4
  br label %62

62:                                               ; preds = %39
  br label %63

63:                                               ; preds = %62
  %64 = load i32, ptr %7, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %7, align 4
  br label %34

66:                                               ; preds = %34
  br label %67

67:                                               ; preds = %66
  br label %68

68:                                               ; preds = %67
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %69

69:                                               ; preds = %68
  br label %70

70:                                               ; preds = %69
  br label %71

71:                                               ; preds = %70, %30
  br label %72

72:                                               ; preds = %71
  br label %73

73:                                               ; preds = %72
  call void @llvm.lifetime.end.p0(ptr %13)
  br label %74

74:                                               ; preds = %73
  br label %75

75:                                               ; preds = %74
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z14gemver_kernel3iffPfS_S___noalias(i32 noundef %0, float noundef %1, float noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, ptr noalias noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca float, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store float %1, ptr %9, align 4
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  call void @llvm.lifetime.start.p0(ptr %13)
  br label %14

14:                                               ; preds = %6
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %17 = mul i32 %15, %16
  %18 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %19 = add i32 %17, %18
  store i32 %19, ptr %13, align 4
  br label %20

20:                                               ; preds = %14
  %21 = load i32, ptr %13, align 4
  %22 = icmp sge i32 %21, 0
  br i1 %22, label %23, label %27

23:                                               ; preds = %20
  %24 = load i32, ptr %13, align 4
  %25 = load i32, ptr %8, align 4
  %26 = icmp slt i32 %24, %25
  br label %28

27:                                               ; preds = %20
  br label %28

28:                                               ; preds = %23, %27
  %29 = phi i1 [ false, %27 ], [ %26, %23 ]
  br label %30

30:                                               ; preds = %28
  br i1 %29, label %31, label %71

31:                                               ; preds = %30
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %32

32:                                               ; preds = %31
  br label %33

33:                                               ; preds = %32
  store i32 0, ptr %7, align 4
  br label %34

34:                                               ; preds = %63, %33
  %35 = load i32, ptr %7, align 4
  %36 = load i32, ptr %8, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %66

38:                                               ; preds = %34
  br label %39

39:                                               ; preds = %38
  %40 = load float, ptr %9, align 4
  %41 = load i32, ptr %13, align 4
  %42 = mul nsw i32 %41, 4096
  %43 = load i32, ptr %7, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %10, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fmul contract float %40, %48
  %50 = load i32, ptr %7, align 4
  %51 = sext i32 %50 to i64
  %52 = load ptr, ptr %11, align 8
  %53 = getelementptr float, ptr %52, i64 %51
  %54 = load float, ptr %53, align 4
  %55 = fmul contract float %49, %54
  %56 = load i32, ptr %13, align 4
  %57 = sext i32 %56 to i64
  %58 = load ptr, ptr %12, align 8
  %59 = getelementptr float, ptr %58, i64 %57
  %60 = load float, ptr %59, align 4
  %61 = fadd contract float %60, %55
  store float %61, ptr %59, align 4
  br label %62

62:                                               ; preds = %39
  br label %63

63:                                               ; preds = %62
  %64 = load i32, ptr %7, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %7, align 4
  br label %34

66:                                               ; preds = %34
  br label %67

67:                                               ; preds = %66
  br label %68

68:                                               ; preds = %67
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %69

69:                                               ; preds = %68
  br label %70

70:                                               ; preds = %69
  br label %71

71:                                               ; preds = %70, %30
  br label %72

72:                                               ; preds = %71
  br label %73

73:                                               ; preds = %72
  call void @llvm.lifetime.end.p0(ptr %13)
  br label %74

74:                                               ; preds = %73
  br label %75

75:                                               ; preds = %74
  ret void
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
