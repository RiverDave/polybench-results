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
define dso_local ptx_kernel void @_Z11mm2_kernel1iiiiffPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, float noundef %4, float noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8) #0 {
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca float, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, ptr %11, align 4
  store i32 %1, ptr %12, align 4
  store i32 %2, ptr %13, align 4
  store float %4, ptr %14, align 4
  store ptr %6, ptr %15, align 8
  store ptr %7, ptr %16, align 8
  store ptr %8, ptr %17, align 8
  call void @llvm.lifetime.start.p0(ptr %18)
  br label %20

20:                                               ; preds = %9
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
  %34 = load i32, ptr %11, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %40

36:                                               ; preds = %32
  %37 = load i32, ptr %18, align 4
  %38 = load i32, ptr %12, align 4
  %39 = icmp slt i32 %37, %38
  br label %41

40:                                               ; preds = %32
  br label %41

41:                                               ; preds = %36, %40
  %42 = phi i1 [ false, %40 ], [ %39, %36 ]
  br label %43

43:                                               ; preds = %41
  br i1 %42, label %44, label %97

44:                                               ; preds = %43
  %45 = load i32, ptr %19, align 4
  %46 = mul nsw i32 %45, 1024
  %47 = load i32, ptr %18, align 4
  %48 = add nsw i32 %46, %47
  %49 = sext i32 %48 to i64
  %50 = load ptr, ptr %15, align 8
  %51 = getelementptr float, ptr %50, i64 %49
  store float 0.000000e+00, ptr %51, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %52

52:                                               ; preds = %44
  br label %53

53:                                               ; preds = %52
  store i32 0, ptr %10, align 4
  br label %54

54:                                               ; preds = %89, %53
  %55 = load i32, ptr %10, align 4
  %56 = load i32, ptr %13, align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %58, label %92

58:                                               ; preds = %54
  br label %59

59:                                               ; preds = %58
  %60 = load float, ptr %14, align 4
  %61 = load i32, ptr %19, align 4
  %62 = mul nsw i32 %61, 1024
  %63 = load i32, ptr %10, align 4
  %64 = add nsw i32 %62, %63
  %65 = sext i32 %64 to i64
  %66 = load ptr, ptr %16, align 8
  %67 = getelementptr float, ptr %66, i64 %65
  %68 = load float, ptr %67, align 4
  %69 = fmul contract float %60, %68
  %70 = load i32, ptr %10, align 4
  %71 = mul nsw i32 %70, 1024
  %72 = load i32, ptr %18, align 4
  %73 = add nsw i32 %71, %72
  %74 = sext i32 %73 to i64
  %75 = load ptr, ptr %17, align 8
  %76 = getelementptr float, ptr %75, i64 %74
  %77 = load float, ptr %76, align 4
  %78 = fmul contract float %69, %77
  %79 = load i32, ptr %19, align 4
  %80 = mul nsw i32 %79, 1024
  %81 = load i32, ptr %18, align 4
  %82 = add nsw i32 %80, %81
  %83 = sext i32 %82 to i64
  %84 = load ptr, ptr %15, align 8
  %85 = getelementptr float, ptr %84, i64 %83
  %86 = load float, ptr %85, align 4
  %87 = fadd contract float %86, %78
  store float %87, ptr %85, align 4
  br label %88

88:                                               ; preds = %59
  br label %89

89:                                               ; preds = %88
  %90 = load i32, ptr %10, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %10, align 4
  br label %54

92:                                               ; preds = %54
  br label %93

93:                                               ; preds = %92
  br label %94

94:                                               ; preds = %93
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %95

95:                                               ; preds = %94
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96, %43
  br label %98

98:                                               ; preds = %97
  br label %99

99:                                               ; preds = %98
  call void @llvm.lifetime.end.p0(ptr %19)
  br label %100

100:                                              ; preds = %99
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
  call void @llvm.lifetime.end.p0(ptr %18)
  br label %103

103:                                              ; preds = %102
  br label %104

104:                                              ; preds = %103
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11mm2_kernel1iiiiffPfS_S___noalias(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, float noundef %4, float noundef %5, ptr noalias noundef %6, ptr noalias noundef %7, ptr noalias noundef %8) #0 {
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca float, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, ptr %11, align 4
  store i32 %1, ptr %12, align 4
  store i32 %2, ptr %13, align 4
  store float %4, ptr %14, align 4
  store ptr %6, ptr %15, align 8
  store ptr %7, ptr %16, align 8
  store ptr %8, ptr %17, align 8
  call void @llvm.lifetime.start.p0(ptr %18)
  br label %20

20:                                               ; preds = %9
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
  %34 = load i32, ptr %11, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %40

36:                                               ; preds = %32
  %37 = load i32, ptr %18, align 4
  %38 = load i32, ptr %12, align 4
  %39 = icmp slt i32 %37, %38
  br label %41

40:                                               ; preds = %32
  br label %41

41:                                               ; preds = %36, %40
  %42 = phi i1 [ false, %40 ], [ %39, %36 ]
  br label %43

43:                                               ; preds = %41
  br i1 %42, label %44, label %97

44:                                               ; preds = %43
  %45 = load i32, ptr %19, align 4
  %46 = mul nsw i32 %45, 1024
  %47 = load i32, ptr %18, align 4
  %48 = add nsw i32 %46, %47
  %49 = sext i32 %48 to i64
  %50 = load ptr, ptr %15, align 8
  %51 = getelementptr float, ptr %50, i64 %49
  store float 0.000000e+00, ptr %51, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %52

52:                                               ; preds = %44
  br label %53

53:                                               ; preds = %52
  store i32 0, ptr %10, align 4
  br label %54

54:                                               ; preds = %89, %53
  %55 = load i32, ptr %10, align 4
  %56 = load i32, ptr %13, align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %58, label %92

58:                                               ; preds = %54
  br label %59

59:                                               ; preds = %58
  %60 = load float, ptr %14, align 4
  %61 = load i32, ptr %19, align 4
  %62 = mul nsw i32 %61, 1024
  %63 = load i32, ptr %10, align 4
  %64 = add nsw i32 %62, %63
  %65 = sext i32 %64 to i64
  %66 = load ptr, ptr %16, align 8
  %67 = getelementptr float, ptr %66, i64 %65
  %68 = load float, ptr %67, align 4
  %69 = fmul contract float %60, %68
  %70 = load i32, ptr %10, align 4
  %71 = mul nsw i32 %70, 1024
  %72 = load i32, ptr %18, align 4
  %73 = add nsw i32 %71, %72
  %74 = sext i32 %73 to i64
  %75 = load ptr, ptr %17, align 8
  %76 = getelementptr float, ptr %75, i64 %74
  %77 = load float, ptr %76, align 4
  %78 = fmul contract float %69, %77
  %79 = load i32, ptr %19, align 4
  %80 = mul nsw i32 %79, 1024
  %81 = load i32, ptr %18, align 4
  %82 = add nsw i32 %80, %81
  %83 = sext i32 %82 to i64
  %84 = load ptr, ptr %15, align 8
  %85 = getelementptr float, ptr %84, i64 %83
  %86 = load float, ptr %85, align 4
  %87 = fadd contract float %86, %78
  store float %87, ptr %85, align 4
  br label %88

88:                                               ; preds = %59
  br label %89

89:                                               ; preds = %88
  %90 = load i32, ptr %10, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %10, align 4
  br label %54

92:                                               ; preds = %54
  br label %93

93:                                               ; preds = %92
  br label %94

94:                                               ; preds = %93
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %95

95:                                               ; preds = %94
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96, %43
  br label %98

98:                                               ; preds = %97
  br label %99

99:                                               ; preds = %98
  call void @llvm.lifetime.end.p0(ptr %19)
  br label %100

100:                                              ; preds = %99
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
  call void @llvm.lifetime.end.p0(ptr %18)
  br label %103

103:                                              ; preds = %102
  br label %104

104:                                              ; preds = %103
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
define dso_local ptx_kernel void @_Z11mm2_kernel2iiiiffPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, float noundef %4, float noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8) #0 {
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca float, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, ptr %11, align 4
  store i32 %1, ptr %12, align 4
  store i32 %3, ptr %13, align 4
  store float %5, ptr %14, align 4
  store ptr %6, ptr %15, align 8
  store ptr %7, ptr %16, align 8
  store ptr %8, ptr %17, align 8
  call void @llvm.lifetime.start.p0(ptr %18)
  br label %20

20:                                               ; preds = %9
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
  %34 = load i32, ptr %11, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %40

36:                                               ; preds = %32
  %37 = load i32, ptr %18, align 4
  %38 = load i32, ptr %13, align 4
  %39 = icmp slt i32 %37, %38
  br label %41

40:                                               ; preds = %32
  br label %41

41:                                               ; preds = %36, %40
  %42 = phi i1 [ false, %40 ], [ %39, %36 ]
  br label %43

43:                                               ; preds = %41
  br i1 %42, label %44, label %98

44:                                               ; preds = %43
  %45 = load float, ptr %14, align 4
  %46 = load i32, ptr %19, align 4
  %47 = mul nsw i32 %46, 1024
  %48 = load i32, ptr %18, align 4
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = load ptr, ptr %17, align 8
  %52 = getelementptr float, ptr %51, i64 %50
  %53 = load float, ptr %52, align 4
  %54 = fmul contract float %53, %45
  store float %54, ptr %52, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %55

55:                                               ; preds = %44
  br label %56

56:                                               ; preds = %55
  store i32 0, ptr %10, align 4
  br label %57

57:                                               ; preds = %90, %56
  %58 = load i32, ptr %10, align 4
  %59 = load i32, ptr %12, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %93

61:                                               ; preds = %57
  br label %62

62:                                               ; preds = %61
  %63 = load i32, ptr %19, align 4
  %64 = mul nsw i32 %63, 1024
  %65 = load i32, ptr %10, align 4
  %66 = add nsw i32 %64, %65
  %67 = sext i32 %66 to i64
  %68 = load ptr, ptr %15, align 8
  %69 = getelementptr float, ptr %68, i64 %67
  %70 = load float, ptr %69, align 4
  %71 = load i32, ptr %10, align 4
  %72 = mul nsw i32 %71, 1024
  %73 = load i32, ptr %18, align 4
  %74 = add nsw i32 %72, %73
  %75 = sext i32 %74 to i64
  %76 = load ptr, ptr %16, align 8
  %77 = getelementptr float, ptr %76, i64 %75
  %78 = load float, ptr %77, align 4
  %79 = fmul contract float %70, %78
  %80 = load i32, ptr %19, align 4
  %81 = mul nsw i32 %80, 1024
  %82 = load i32, ptr %18, align 4
  %83 = add nsw i32 %81, %82
  %84 = sext i32 %83 to i64
  %85 = load ptr, ptr %17, align 8
  %86 = getelementptr float, ptr %85, i64 %84
  %87 = load float, ptr %86, align 4
  %88 = fadd contract float %87, %79
  store float %88, ptr %86, align 4
  br label %89

89:                                               ; preds = %62
  br label %90

90:                                               ; preds = %89
  %91 = load i32, ptr %10, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %10, align 4
  br label %57

93:                                               ; preds = %57
  br label %94

94:                                               ; preds = %93
  br label %95

95:                                               ; preds = %94
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  br label %98

98:                                               ; preds = %97, %43
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  call void @llvm.lifetime.end.p0(ptr %19)
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
  br label %103

103:                                              ; preds = %102
  call void @llvm.lifetime.end.p0(ptr %18)
  br label %104

104:                                              ; preds = %103
  br label %105

105:                                              ; preds = %104
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11mm2_kernel2iiiiffPfS_S___noalias(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, float noundef %4, float noundef %5, ptr noalias noundef %6, ptr noalias noundef %7, ptr noalias noundef %8) #0 {
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca float, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, ptr %11, align 4
  store i32 %1, ptr %12, align 4
  store i32 %3, ptr %13, align 4
  store float %5, ptr %14, align 4
  store ptr %6, ptr %15, align 8
  store ptr %7, ptr %16, align 8
  store ptr %8, ptr %17, align 8
  call void @llvm.lifetime.start.p0(ptr %18)
  br label %20

20:                                               ; preds = %9
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
  %34 = load i32, ptr %11, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %40

36:                                               ; preds = %32
  %37 = load i32, ptr %18, align 4
  %38 = load i32, ptr %13, align 4
  %39 = icmp slt i32 %37, %38
  br label %41

40:                                               ; preds = %32
  br label %41

41:                                               ; preds = %36, %40
  %42 = phi i1 [ false, %40 ], [ %39, %36 ]
  br label %43

43:                                               ; preds = %41
  br i1 %42, label %44, label %98

44:                                               ; preds = %43
  %45 = load float, ptr %14, align 4
  %46 = load i32, ptr %19, align 4
  %47 = mul nsw i32 %46, 1024
  %48 = load i32, ptr %18, align 4
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = load ptr, ptr %17, align 8
  %52 = getelementptr float, ptr %51, i64 %50
  %53 = load float, ptr %52, align 4
  %54 = fmul contract float %53, %45
  store float %54, ptr %52, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %55

55:                                               ; preds = %44
  br label %56

56:                                               ; preds = %55
  store i32 0, ptr %10, align 4
  br label %57

57:                                               ; preds = %90, %56
  %58 = load i32, ptr %10, align 4
  %59 = load i32, ptr %12, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %93

61:                                               ; preds = %57
  br label %62

62:                                               ; preds = %61
  %63 = load i32, ptr %19, align 4
  %64 = mul nsw i32 %63, 1024
  %65 = load i32, ptr %10, align 4
  %66 = add nsw i32 %64, %65
  %67 = sext i32 %66 to i64
  %68 = load ptr, ptr %15, align 8
  %69 = getelementptr float, ptr %68, i64 %67
  %70 = load float, ptr %69, align 4
  %71 = load i32, ptr %10, align 4
  %72 = mul nsw i32 %71, 1024
  %73 = load i32, ptr %18, align 4
  %74 = add nsw i32 %72, %73
  %75 = sext i32 %74 to i64
  %76 = load ptr, ptr %16, align 8
  %77 = getelementptr float, ptr %76, i64 %75
  %78 = load float, ptr %77, align 4
  %79 = fmul contract float %70, %78
  %80 = load i32, ptr %19, align 4
  %81 = mul nsw i32 %80, 1024
  %82 = load i32, ptr %18, align 4
  %83 = add nsw i32 %81, %82
  %84 = sext i32 %83 to i64
  %85 = load ptr, ptr %17, align 8
  %86 = getelementptr float, ptr %85, i64 %84
  %87 = load float, ptr %86, align 4
  %88 = fadd contract float %87, %79
  store float %88, ptr %86, align 4
  br label %89

89:                                               ; preds = %62
  br label %90

90:                                               ; preds = %89
  %91 = load i32, ptr %10, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %10, align 4
  br label %57

93:                                               ; preds = %57
  br label %94

94:                                               ; preds = %93
  br label %95

95:                                               ; preds = %94
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  br label %98

98:                                               ; preds = %97, %43
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  call void @llvm.lifetime.end.p0(ptr %19)
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
  br label %103

103:                                              ; preds = %102
  call void @llvm.lifetime.end.p0(ptr %18)
  br label %104

104:                                              ; preds = %103
  br label %105

105:                                              ; preds = %104
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
