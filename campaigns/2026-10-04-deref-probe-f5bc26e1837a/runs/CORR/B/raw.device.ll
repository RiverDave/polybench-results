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
define dso_local ptx_kernel void @_Z11mean_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr noundef dereferenceable(8192) %2, ptr noundef dereferenceable(16777216) %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %11

11:                                               ; preds = %4
  %12 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #5
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #5
  %14 = mul i32 %12, %13
  %15 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #5
  %16 = add i32 %14, %15
  store i32 %16, ptr %10, align 4
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %10, align 4
  %19 = load i32, ptr %6, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %63

21:                                               ; preds = %17
  %22 = load i32, ptr %10, align 4
  %23 = sext i32 %22 to i64
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr float, ptr %24, i64 %23
  store float 0.000000e+00, ptr %25, align 4
  call void @llvm.lifetime.start.p0(ptr %5)
  br label %26

26:                                               ; preds = %21
  br label %27

27:                                               ; preds = %26
  store i32 0, ptr %5, align 4
  br label %28

28:                                               ; preds = %49, %27
  %29 = load i32, ptr %5, align 4
  %30 = load i32, ptr %7, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %52

32:                                               ; preds = %28
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %5, align 4
  %35 = mul nsw i32 %34, 2048
  %36 = load i32, ptr %10, align 4
  %37 = add nsw i32 %35, %36
  %38 = sext i32 %37 to i64
  %39 = load ptr, ptr %9, align 8
  %40 = getelementptr float, ptr %39, i64 %38
  %41 = load float, ptr %40, align 4
  %42 = load i32, ptr %10, align 4
  %43 = sext i32 %42 to i64
  %44 = load ptr, ptr %8, align 8
  %45 = getelementptr float, ptr %44, i64 %43
  %46 = load float, ptr %45, align 4
  %47 = fadd contract float %46, %41
  store float %47, ptr %45, align 4
  br label %48

48:                                               ; preds = %33
  br label %49

49:                                               ; preds = %48
  %50 = load i32, ptr %5, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %5, align 4
  br label %28

52:                                               ; preds = %28
  br label %53

53:                                               ; preds = %52
  %54 = load i32, ptr %10, align 4
  %55 = sext i32 %54 to i64
  %56 = load ptr, ptr %8, align 8
  %57 = getelementptr float, ptr %56, i64 %55
  %58 = load float, ptr %57, align 4
  %59 = fdiv contract float %58, f0x4A442E10
  store float %59, ptr %57, align 4
  br label %60

60:                                               ; preds = %53
  call void @llvm.lifetime.end.p0(ptr %5)
  br label %61

61:                                               ; preds = %60
  br label %62

62:                                               ; preds = %61
  br label %63

63:                                               ; preds = %62, %17
  br label %64

64:                                               ; preds = %63
  br label %65

65:                                               ; preds = %64
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %66

66:                                               ; preds = %65
  br label %67

67:                                               ; preds = %66
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11mean_kerneliiPfS___noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef dereferenceable(8192) %2, ptr noalias noundef dereferenceable(16777216) %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %11

11:                                               ; preds = %4
  %12 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #5
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #5
  %14 = mul i32 %12, %13
  %15 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #5
  %16 = add i32 %14, %15
  store i32 %16, ptr %10, align 4
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %10, align 4
  %19 = load i32, ptr %6, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %63

21:                                               ; preds = %17
  %22 = load i32, ptr %10, align 4
  %23 = sext i32 %22 to i64
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr float, ptr %24, i64 %23
  store float 0.000000e+00, ptr %25, align 4
  call void @llvm.lifetime.start.p0(ptr %5)
  br label %26

26:                                               ; preds = %21
  br label %27

27:                                               ; preds = %26
  store i32 0, ptr %5, align 4
  br label %28

28:                                               ; preds = %49, %27
  %29 = load i32, ptr %5, align 4
  %30 = load i32, ptr %7, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %52

32:                                               ; preds = %28
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %5, align 4
  %35 = mul nsw i32 %34, 2048
  %36 = load i32, ptr %10, align 4
  %37 = add nsw i32 %35, %36
  %38 = sext i32 %37 to i64
  %39 = load ptr, ptr %9, align 8
  %40 = getelementptr float, ptr %39, i64 %38
  %41 = load float, ptr %40, align 4
  %42 = load i32, ptr %10, align 4
  %43 = sext i32 %42 to i64
  %44 = load ptr, ptr %8, align 8
  %45 = getelementptr float, ptr %44, i64 %43
  %46 = load float, ptr %45, align 4
  %47 = fadd contract float %46, %41
  store float %47, ptr %45, align 4
  br label %48

48:                                               ; preds = %33
  br label %49

49:                                               ; preds = %48
  %50 = load i32, ptr %5, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %5, align 4
  br label %28

52:                                               ; preds = %28
  br label %53

53:                                               ; preds = %52
  %54 = load i32, ptr %10, align 4
  %55 = sext i32 %54 to i64
  %56 = load ptr, ptr %8, align 8
  %57 = getelementptr float, ptr %56, i64 %55
  %58 = load float, ptr %57, align 4
  %59 = fdiv contract float %58, f0x4A442E10
  store float %59, ptr %57, align 4
  br label %60

60:                                               ; preds = %53
  call void @llvm.lifetime.end.p0(ptr %5)
  br label %61

61:                                               ; preds = %60
  br label %62

62:                                               ; preds = %61
  br label %63

63:                                               ; preds = %62, %17
  br label %64

64:                                               ; preds = %63
  br label %65

65:                                               ; preds = %64
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %66

66:                                               ; preds = %65
  br label %67

67:                                               ; preds = %66
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

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z10std_kerneliiPfS_S_(i32 noundef %0, i32 noundef %1, ptr noundef dereferenceable(8192) %2, ptr noundef dereferenceable(8192) %3, ptr noundef dereferenceable(16777216) %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  call void @llvm.lifetime.start.p0(ptr %12)
  br label %13

13:                                               ; preds = %5
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #5
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #5
  %16 = mul i32 %14, %15
  %17 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #5
  %18 = add i32 %16, %17
  store i32 %18, ptr %12, align 4
  br label %19

19:                                               ; preds = %13
  %20 = load i32, ptr %12, align 4
  %21 = load i32, ptr %7, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %110

23:                                               ; preds = %19
  %24 = load i32, ptr %12, align 4
  %25 = sext i32 %24 to i64
  %26 = load ptr, ptr %10, align 8
  %27 = getelementptr float, ptr %26, i64 %25
  store float 0.000000e+00, ptr %27, align 4
  call void @llvm.lifetime.start.p0(ptr %6)
  br label %28

28:                                               ; preds = %23
  br label %29

29:                                               ; preds = %28
  store i32 0, ptr %6, align 4
  br label %30

30:                                               ; preds = %72, %29
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %8, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %75

34:                                               ; preds = %30
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %6, align 4
  %37 = mul nsw i32 %36, 2048
  %38 = load i32, ptr %12, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = load ptr, ptr %11, align 8
  %42 = getelementptr float, ptr %41, i64 %40
  %43 = load float, ptr %42, align 4
  %44 = load i32, ptr %12, align 4
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %9, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fsub contract float %43, %48
  %50 = load i32, ptr %6, align 4
  %51 = mul nsw i32 %50, 2048
  %52 = load i32, ptr %12, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %11, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = load i32, ptr %12, align 4
  %59 = sext i32 %58 to i64
  %60 = load ptr, ptr %9, align 8
  %61 = getelementptr float, ptr %60, i64 %59
  %62 = load float, ptr %61, align 4
  %63 = fsub contract float %57, %62
  %64 = fmul contract float %49, %63
  %65 = load i32, ptr %12, align 4
  %66 = sext i32 %65 to i64
  %67 = load ptr, ptr %10, align 8
  %68 = getelementptr float, ptr %67, i64 %66
  %69 = load float, ptr %68, align 4
  %70 = fadd contract float %69, %64
  store float %70, ptr %68, align 4
  br label %71

71:                                               ; preds = %35
  br label %72

72:                                               ; preds = %71
  %73 = load i32, ptr %6, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %6, align 4
  br label %30

75:                                               ; preds = %30
  br label %76

76:                                               ; preds = %75
  %77 = load i32, ptr %12, align 4
  %78 = sext i32 %77 to i64
  %79 = load ptr, ptr %10, align 8
  %80 = getelementptr float, ptr %79, i64 %78
  %81 = load float, ptr %80, align 4
  %82 = fdiv contract float %81, f0x4A442E10
  store float %82, ptr %80, align 4
  %83 = load i32, ptr %12, align 4
  %84 = sext i32 %83 to i64
  %85 = load ptr, ptr %10, align 8
  %86 = getelementptr float, ptr %85, i64 %84
  %87 = load float, ptr %86, align 4
  %88 = call noundef float @_ZL4sqrtf(float noundef %87) #5
  %89 = load i32, ptr %12, align 4
  %90 = sext i32 %89 to i64
  %91 = load ptr, ptr %10, align 8
  %92 = getelementptr float, ptr %91, i64 %90
  store float %88, ptr %92, align 4
  br label %93

93:                                               ; preds = %76
  %94 = load i32, ptr %12, align 4
  %95 = sext i32 %94 to i64
  %96 = load ptr, ptr %10, align 8
  %97 = getelementptr float, ptr %96, i64 %95
  %98 = load float, ptr %97, align 4
  %99 = fcmp ole float %98, 5.000000e-03
  br i1 %99, label %100, label %105

100:                                              ; preds = %93
  %101 = load i32, ptr %12, align 4
  %102 = sext i32 %101 to i64
  %103 = load ptr, ptr %10, align 8
  %104 = getelementptr float, ptr %103, i64 %102
  store float 1.000000e+00, ptr %104, align 4
  br label %105

105:                                              ; preds = %100, %93
  br label %106

106:                                              ; preds = %105
  br label %107

107:                                              ; preds = %106
  call void @llvm.lifetime.end.p0(ptr %6)
  br label %108

108:                                              ; preds = %107
  br label %109

109:                                              ; preds = %108
  br label %110

110:                                              ; preds = %109, %19
  br label %111

111:                                              ; preds = %110
  br label %112

112:                                              ; preds = %111
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %113

113:                                              ; preds = %112
  br label %114

114:                                              ; preds = %113
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z10std_kerneliiPfS_S___noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef dereferenceable(8192) %2, ptr noalias noundef dereferenceable(8192) %3, ptr noalias noundef dereferenceable(16777216) %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  call void @llvm.lifetime.start.p0(ptr %12)
  br label %13

13:                                               ; preds = %5
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #5
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #5
  %16 = mul i32 %14, %15
  %17 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #5
  %18 = add i32 %16, %17
  store i32 %18, ptr %12, align 4
  br label %19

19:                                               ; preds = %13
  %20 = load i32, ptr %12, align 4
  %21 = load i32, ptr %7, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %110

23:                                               ; preds = %19
  %24 = load i32, ptr %12, align 4
  %25 = sext i32 %24 to i64
  %26 = load ptr, ptr %10, align 8
  %27 = getelementptr float, ptr %26, i64 %25
  store float 0.000000e+00, ptr %27, align 4
  call void @llvm.lifetime.start.p0(ptr %6)
  br label %28

28:                                               ; preds = %23
  br label %29

29:                                               ; preds = %28
  store i32 0, ptr %6, align 4
  br label %30

30:                                               ; preds = %72, %29
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %8, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %75

34:                                               ; preds = %30
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %6, align 4
  %37 = mul nsw i32 %36, 2048
  %38 = load i32, ptr %12, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = load ptr, ptr %11, align 8
  %42 = getelementptr float, ptr %41, i64 %40
  %43 = load float, ptr %42, align 4
  %44 = load i32, ptr %12, align 4
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %9, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fsub contract float %43, %48
  %50 = load i32, ptr %6, align 4
  %51 = mul nsw i32 %50, 2048
  %52 = load i32, ptr %12, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %11, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = load i32, ptr %12, align 4
  %59 = sext i32 %58 to i64
  %60 = load ptr, ptr %9, align 8
  %61 = getelementptr float, ptr %60, i64 %59
  %62 = load float, ptr %61, align 4
  %63 = fsub contract float %57, %62
  %64 = fmul contract float %49, %63
  %65 = load i32, ptr %12, align 4
  %66 = sext i32 %65 to i64
  %67 = load ptr, ptr %10, align 8
  %68 = getelementptr float, ptr %67, i64 %66
  %69 = load float, ptr %68, align 4
  %70 = fadd contract float %69, %64
  store float %70, ptr %68, align 4
  br label %71

71:                                               ; preds = %35
  br label %72

72:                                               ; preds = %71
  %73 = load i32, ptr %6, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %6, align 4
  br label %30

75:                                               ; preds = %30
  br label %76

76:                                               ; preds = %75
  %77 = load i32, ptr %12, align 4
  %78 = sext i32 %77 to i64
  %79 = load ptr, ptr %10, align 8
  %80 = getelementptr float, ptr %79, i64 %78
  %81 = load float, ptr %80, align 4
  %82 = fdiv contract float %81, f0x4A442E10
  store float %82, ptr %80, align 4
  %83 = load i32, ptr %12, align 4
  %84 = sext i32 %83 to i64
  %85 = load ptr, ptr %10, align 8
  %86 = getelementptr float, ptr %85, i64 %84
  %87 = load float, ptr %86, align 4
  %88 = call noundef float @_ZL4sqrtf(float noundef %87) #5
  %89 = load i32, ptr %12, align 4
  %90 = sext i32 %89 to i64
  %91 = load ptr, ptr %10, align 8
  %92 = getelementptr float, ptr %91, i64 %90
  store float %88, ptr %92, align 4
  br label %93

93:                                               ; preds = %76
  %94 = load i32, ptr %12, align 4
  %95 = sext i32 %94 to i64
  %96 = load ptr, ptr %10, align 8
  %97 = getelementptr float, ptr %96, i64 %95
  %98 = load float, ptr %97, align 4
  %99 = fcmp ole float %98, 5.000000e-03
  br i1 %99, label %100, label %105

100:                                              ; preds = %93
  %101 = load i32, ptr %12, align 4
  %102 = sext i32 %101 to i64
  %103 = load ptr, ptr %10, align 8
  %104 = getelementptr float, ptr %103, i64 %102
  store float 1.000000e+00, ptr %104, align 4
  br label %105

105:                                              ; preds = %100, %93
  br label %106

106:                                              ; preds = %105
  br label %107

107:                                              ; preds = %106
  call void @llvm.lifetime.end.p0(ptr %6)
  br label %108

108:                                              ; preds = %107
  br label %109

109:                                              ; preds = %108
  br label %110

110:                                              ; preds = %109, %19
  br label %111

111:                                              ; preds = %110
  br label %112

112:                                              ; preds = %111
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %113

113:                                              ; preds = %112
  br label %114

114:                                              ; preds = %113
  ret void
}

; Function Attrs: alwaysinline convergent
define internal noundef float @_ZL4sqrtf(float noundef %0) #1 {
  %2 = call noundef float @_ZL5sqrtff(float noundef %0) #5
  ret float %2
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z13reduce_kerneliiPfS_S_(i32 noundef %0, i32 noundef %1, ptr noundef dereferenceable(8192) %2, ptr noundef dereferenceable(8192) %3, ptr noundef dereferenceable(16777216) %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %13

13:                                               ; preds = %5
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #5
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #5
  %16 = mul i32 %14, %15
  %17 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #5
  %18 = add i32 %16, %17
  store i32 %18, ptr %11, align 4
  call void @llvm.lifetime.start.p0(ptr %12)
  br label %19

19:                                               ; preds = %13
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #5
  %21 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #5
  %22 = mul i32 %20, %21
  %23 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #5
  %24 = add i32 %22, %23
  store i32 %24, ptr %12, align 4
  br label %25

25:                                               ; preds = %19
  %26 = load i32, ptr %12, align 4
  %27 = load i32, ptr %7, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %33

29:                                               ; preds = %25
  %30 = load i32, ptr %11, align 4
  %31 = load i32, ptr %6, align 4
  %32 = icmp slt i32 %30, %31
  br label %34

33:                                               ; preds = %25
  br label %34

34:                                               ; preds = %29, %33
  %35 = phi i1 [ false, %33 ], [ %32, %29 ]
  br label %36

36:                                               ; preds = %34
  br i1 %35, label %37, label %68

37:                                               ; preds = %36
  %38 = load i32, ptr %11, align 4
  %39 = sext i32 %38 to i64
  %40 = load ptr, ptr %8, align 8
  %41 = getelementptr float, ptr %40, i64 %39
  %42 = load float, ptr %41, align 4
  %43 = load i32, ptr %12, align 4
  %44 = mul nsw i32 %43, 2048
  %45 = load i32, ptr %11, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = load ptr, ptr %10, align 8
  %49 = getelementptr float, ptr %48, i64 %47
  %50 = load float, ptr %49, align 4
  %51 = fsub contract float %50, %42
  store float %51, ptr %49, align 4
  %52 = call noundef float @_ZL4sqrtf(float noundef f0x4A442E10) #5
  %53 = load i32, ptr %11, align 4
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %9, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = fmul contract float %52, %57
  %59 = load i32, ptr %12, align 4
  %60 = mul nsw i32 %59, 2048
  %61 = load i32, ptr %11, align 4
  %62 = add nsw i32 %60, %61
  %63 = sext i32 %62 to i64
  %64 = load ptr, ptr %10, align 8
  %65 = getelementptr float, ptr %64, i64 %63
  %66 = load float, ptr %65, align 4
  %67 = fdiv contract float %66, %58
  store float %67, ptr %65, align 4
  br label %68

68:                                               ; preds = %37, %36
  br label %69

69:                                               ; preds = %68
  br label %70

70:                                               ; preds = %69
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %71

71:                                               ; preds = %70
  br label %72

72:                                               ; preds = %71
  br label %73

73:                                               ; preds = %72
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %74

74:                                               ; preds = %73
  br label %75

75:                                               ; preds = %74
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z13reduce_kerneliiPfS_S___noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef dereferenceable(8192) %2, ptr noalias noundef dereferenceable(8192) %3, ptr noalias noundef dereferenceable(16777216) %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %13

13:                                               ; preds = %5
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #5
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #5
  %16 = mul i32 %14, %15
  %17 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #5
  %18 = add i32 %16, %17
  store i32 %18, ptr %11, align 4
  call void @llvm.lifetime.start.p0(ptr %12)
  br label %19

19:                                               ; preds = %13
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #5
  %21 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #5
  %22 = mul i32 %20, %21
  %23 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #5
  %24 = add i32 %22, %23
  store i32 %24, ptr %12, align 4
  br label %25

25:                                               ; preds = %19
  %26 = load i32, ptr %12, align 4
  %27 = load i32, ptr %7, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %33

29:                                               ; preds = %25
  %30 = load i32, ptr %11, align 4
  %31 = load i32, ptr %6, align 4
  %32 = icmp slt i32 %30, %31
  br label %34

33:                                               ; preds = %25
  br label %34

34:                                               ; preds = %29, %33
  %35 = phi i1 [ false, %33 ], [ %32, %29 ]
  br label %36

36:                                               ; preds = %34
  br i1 %35, label %37, label %68

37:                                               ; preds = %36
  %38 = load i32, ptr %11, align 4
  %39 = sext i32 %38 to i64
  %40 = load ptr, ptr %8, align 8
  %41 = getelementptr float, ptr %40, i64 %39
  %42 = load float, ptr %41, align 4
  %43 = load i32, ptr %12, align 4
  %44 = mul nsw i32 %43, 2048
  %45 = load i32, ptr %11, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = load ptr, ptr %10, align 8
  %49 = getelementptr float, ptr %48, i64 %47
  %50 = load float, ptr %49, align 4
  %51 = fsub contract float %50, %42
  store float %51, ptr %49, align 4
  %52 = call noundef float @_ZL4sqrtf(float noundef f0x4A442E10) #5
  %53 = load i32, ptr %11, align 4
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %9, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = fmul contract float %52, %57
  %59 = load i32, ptr %12, align 4
  %60 = mul nsw i32 %59, 2048
  %61 = load i32, ptr %11, align 4
  %62 = add nsw i32 %60, %61
  %63 = sext i32 %62 to i64
  %64 = load ptr, ptr %10, align 8
  %65 = getelementptr float, ptr %64, i64 %63
  %66 = load float, ptr %65, align 4
  %67 = fdiv contract float %66, %58
  store float %67, ptr %65, align 4
  br label %68

68:                                               ; preds = %37, %36
  br label %69

69:                                               ; preds = %68
  br label %70

70:                                               ; preds = %69
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %71

71:                                               ; preds = %70
  br label %72

72:                                               ; preds = %71
  br label %73

73:                                               ; preds = %72
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %74

74:                                               ; preds = %73
  br label %75

75:                                               ; preds = %74
  ret void
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
define dso_local ptx_kernel void @_Z11corr_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr noundef dereferenceable(16777216) %2, ptr noundef dereferenceable(16777216) %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %12

12:                                               ; preds = %4
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #5
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #5
  %15 = mul i32 %13, %14
  %16 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #5
  %17 = add i32 %15, %16
  store i32 %17, ptr %9, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %18

18:                                               ; preds = %12
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %19

19:                                               ; preds = %18
  br label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %9, align 4
  %22 = load i32, ptr %5, align 4
  %23 = sub nsw i32 %22, 1
  %24 = icmp slt i32 %21, %23
  br i1 %24, label %25, label %109

25:                                               ; preds = %20
  %26 = load i32, ptr %9, align 4
  %27 = mul nsw i32 %26, 2048
  %28 = load i32, ptr %9, align 4
  %29 = add nsw i32 %27, %28
  %30 = sext i32 %29 to i64
  %31 = load ptr, ptr %7, align 8
  %32 = getelementptr float, ptr %31, i64 %30
  store float 1.000000e+00, ptr %32, align 4
  br label %33

33:                                               ; preds = %25
  %34 = load i32, ptr %9, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %11, align 4
  br label %36

36:                                               ; preds = %104, %33
  %37 = load i32, ptr %11, align 4
  %38 = load i32, ptr %5, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %40, label %107

40:                                               ; preds = %36
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %9, align 4
  %43 = mul nsw i32 %42, 2048
  %44 = load i32, ptr %11, align 4
  %45 = add nsw i32 %43, %44
  %46 = sext i32 %45 to i64
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr float, ptr %47, i64 %46
  store float 0.000000e+00, ptr %48, align 4
  br label %49

49:                                               ; preds = %41
  store i32 0, ptr %10, align 4
  br label %50

50:                                               ; preds = %83, %49
  %51 = load i32, ptr %10, align 4
  %52 = load i32, ptr %6, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %86

54:                                               ; preds = %50
  br label %55

55:                                               ; preds = %54
  %56 = load i32, ptr %10, align 4
  %57 = mul nsw i32 %56, 2048
  %58 = load i32, ptr %9, align 4
  %59 = add nsw i32 %57, %58
  %60 = sext i32 %59 to i64
  %61 = load ptr, ptr %8, align 8
  %62 = getelementptr float, ptr %61, i64 %60
  %63 = load float, ptr %62, align 4
  %64 = load i32, ptr %10, align 4
  %65 = mul nsw i32 %64, 2048
  %66 = load i32, ptr %11, align 4
  %67 = add nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = load ptr, ptr %8, align 8
  %70 = getelementptr float, ptr %69, i64 %68
  %71 = load float, ptr %70, align 4
  %72 = fmul contract float %63, %71
  %73 = load i32, ptr %9, align 4
  %74 = mul nsw i32 %73, 2048
  %75 = load i32, ptr %11, align 4
  %76 = add nsw i32 %74, %75
  %77 = sext i32 %76 to i64
  %78 = load ptr, ptr %7, align 8
  %79 = getelementptr float, ptr %78, i64 %77
  %80 = load float, ptr %79, align 4
  %81 = fadd contract float %80, %72
  store float %81, ptr %79, align 4
  br label %82

82:                                               ; preds = %55
  br label %83

83:                                               ; preds = %82
  %84 = load i32, ptr %10, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %10, align 4
  br label %50

86:                                               ; preds = %50
  br label %87

87:                                               ; preds = %86
  %88 = load i32, ptr %9, align 4
  %89 = mul nsw i32 %88, 2048
  %90 = load i32, ptr %11, align 4
  %91 = add nsw i32 %89, %90
  %92 = sext i32 %91 to i64
  %93 = load ptr, ptr %7, align 8
  %94 = getelementptr float, ptr %93, i64 %92
  %95 = load float, ptr %94, align 4
  %96 = load i32, ptr %11, align 4
  %97 = mul nsw i32 %96, 2048
  %98 = load i32, ptr %9, align 4
  %99 = add nsw i32 %97, %98
  %100 = sext i32 %99 to i64
  %101 = load ptr, ptr %7, align 8
  %102 = getelementptr float, ptr %101, i64 %100
  store float %95, ptr %102, align 4
  br label %103

103:                                              ; preds = %87
  br label %104

104:                                              ; preds = %103
  %105 = load i32, ptr %11, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %11, align 4
  br label %36

107:                                              ; preds = %36
  br label %108

108:                                              ; preds = %107
  br label %109

109:                                              ; preds = %108, %20
  br label %110

110:                                              ; preds = %109
  br label %111

111:                                              ; preds = %110
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %112

112:                                              ; preds = %111
  br label %113

113:                                              ; preds = %112
  br label %114

114:                                              ; preds = %113
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %115

115:                                              ; preds = %114
  br label %116

116:                                              ; preds = %115
  br label %117

117:                                              ; preds = %116
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %118

118:                                              ; preds = %117
  br label %119

119:                                              ; preds = %118
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11corr_kerneliiPfS___noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef dereferenceable(16777216) %2, ptr noalias noundef dereferenceable(16777216) %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %12

12:                                               ; preds = %4
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #5
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #5
  %15 = mul i32 %13, %14
  %16 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #5
  %17 = add i32 %15, %16
  store i32 %17, ptr %9, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %18

18:                                               ; preds = %12
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %19

19:                                               ; preds = %18
  br label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %9, align 4
  %22 = load i32, ptr %5, align 4
  %23 = sub nsw i32 %22, 1
  %24 = icmp slt i32 %21, %23
  br i1 %24, label %25, label %109

25:                                               ; preds = %20
  %26 = load i32, ptr %9, align 4
  %27 = mul nsw i32 %26, 2048
  %28 = load i32, ptr %9, align 4
  %29 = add nsw i32 %27, %28
  %30 = sext i32 %29 to i64
  %31 = load ptr, ptr %7, align 8
  %32 = getelementptr float, ptr %31, i64 %30
  store float 1.000000e+00, ptr %32, align 4
  br label %33

33:                                               ; preds = %25
  %34 = load i32, ptr %9, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %11, align 4
  br label %36

36:                                               ; preds = %104, %33
  %37 = load i32, ptr %11, align 4
  %38 = load i32, ptr %5, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %40, label %107

40:                                               ; preds = %36
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %9, align 4
  %43 = mul nsw i32 %42, 2048
  %44 = load i32, ptr %11, align 4
  %45 = add nsw i32 %43, %44
  %46 = sext i32 %45 to i64
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr float, ptr %47, i64 %46
  store float 0.000000e+00, ptr %48, align 4
  br label %49

49:                                               ; preds = %41
  store i32 0, ptr %10, align 4
  br label %50

50:                                               ; preds = %83, %49
  %51 = load i32, ptr %10, align 4
  %52 = load i32, ptr %6, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %86

54:                                               ; preds = %50
  br label %55

55:                                               ; preds = %54
  %56 = load i32, ptr %10, align 4
  %57 = mul nsw i32 %56, 2048
  %58 = load i32, ptr %9, align 4
  %59 = add nsw i32 %57, %58
  %60 = sext i32 %59 to i64
  %61 = load ptr, ptr %8, align 8
  %62 = getelementptr float, ptr %61, i64 %60
  %63 = load float, ptr %62, align 4
  %64 = load i32, ptr %10, align 4
  %65 = mul nsw i32 %64, 2048
  %66 = load i32, ptr %11, align 4
  %67 = add nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = load ptr, ptr %8, align 8
  %70 = getelementptr float, ptr %69, i64 %68
  %71 = load float, ptr %70, align 4
  %72 = fmul contract float %63, %71
  %73 = load i32, ptr %9, align 4
  %74 = mul nsw i32 %73, 2048
  %75 = load i32, ptr %11, align 4
  %76 = add nsw i32 %74, %75
  %77 = sext i32 %76 to i64
  %78 = load ptr, ptr %7, align 8
  %79 = getelementptr float, ptr %78, i64 %77
  %80 = load float, ptr %79, align 4
  %81 = fadd contract float %80, %72
  store float %81, ptr %79, align 4
  br label %82

82:                                               ; preds = %55
  br label %83

83:                                               ; preds = %82
  %84 = load i32, ptr %10, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %10, align 4
  br label %50

86:                                               ; preds = %50
  br label %87

87:                                               ; preds = %86
  %88 = load i32, ptr %9, align 4
  %89 = mul nsw i32 %88, 2048
  %90 = load i32, ptr %11, align 4
  %91 = add nsw i32 %89, %90
  %92 = sext i32 %91 to i64
  %93 = load ptr, ptr %7, align 8
  %94 = getelementptr float, ptr %93, i64 %92
  %95 = load float, ptr %94, align 4
  %96 = load i32, ptr %11, align 4
  %97 = mul nsw i32 %96, 2048
  %98 = load i32, ptr %9, align 4
  %99 = add nsw i32 %97, %98
  %100 = sext i32 %99 to i64
  %101 = load ptr, ptr %7, align 8
  %102 = getelementptr float, ptr %101, i64 %100
  store float %95, ptr %102, align 4
  br label %103

103:                                              ; preds = %87
  br label %104

104:                                              ; preds = %103
  %105 = load i32, ptr %11, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %11, align 4
  br label %36

107:                                              ; preds = %36
  br label %108

108:                                              ; preds = %107
  br label %109

109:                                              ; preds = %108, %20
  br label %110

110:                                              ; preds = %109
  br label %111

111:                                              ; preds = %110
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %112

112:                                              ; preds = %111
  br label %113

113:                                              ; preds = %112
  br label %114

114:                                              ; preds = %113
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %115

115:                                              ; preds = %114
  br label %116

116:                                              ; preds = %115
  br label %117

117:                                              ; preds = %116
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %118

118:                                              ; preds = %117
  br label %119

119:                                              ; preds = %118
  ret void
}

; Function Attrs: alwaysinline convergent
define internal noundef float @_ZL5sqrtff(float noundef %0) #1 {
  %2 = call float @llvm.sqrt.f32(float %0)
  ret float %2
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

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #4

attributes #0 = { convergent noinline "target-cpu"="sm_86" "target-features"="+ptx87" "uniform-work-group-size" }
attributes #1 = { alwaysinline convergent "target-cpu"="sm_86" "target-features"="+ptx87" "uniform-work-group-size" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { convergent "uniform-work-group-size" }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
