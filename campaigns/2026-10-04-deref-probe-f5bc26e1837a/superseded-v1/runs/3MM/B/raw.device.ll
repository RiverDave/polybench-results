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
define dso_local ptx_kernel void @_Z11mm3_kernel1iiiiiPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef dereferenceable(1048576) %5, ptr noundef dereferenceable(1048576) %6, ptr noundef dereferenceable(1048576) %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, ptr %10, align 4
  store i32 %1, ptr %11, align 4
  store i32 %2, ptr %12, align 4
  store ptr %5, ptr %13, align 8
  store ptr %6, ptr %14, align 8
  store ptr %7, ptr %15, align 8
  call void @llvm.lifetime.start.p0(ptr %16)
  br label %18

18:                                               ; preds = %8
  %19 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %21 = mul i32 %19, %20
  %22 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %23 = add i32 %21, %22
  store i32 %23, ptr %16, align 4
  call void @llvm.lifetime.start.p0(ptr %17)
  br label %24

24:                                               ; preds = %18
  %25 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %26 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %27 = mul i32 %25, %26
  %28 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %29 = add i32 %27, %28
  store i32 %29, ptr %17, align 4
  br label %30

30:                                               ; preds = %24
  %31 = load i32, ptr %17, align 4
  %32 = load i32, ptr %10, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %38

34:                                               ; preds = %30
  %35 = load i32, ptr %16, align 4
  %36 = load i32, ptr %11, align 4
  %37 = icmp slt i32 %35, %36
  br label %39

38:                                               ; preds = %30
  br label %39

39:                                               ; preds = %34, %38
  %40 = phi i1 [ false, %38 ], [ %37, %34 ]
  br label %41

41:                                               ; preds = %39
  br i1 %40, label %42, label %93

42:                                               ; preds = %41
  %43 = load i32, ptr %17, align 4
  %44 = mul nsw i32 %43, 512
  %45 = load i32, ptr %16, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = load ptr, ptr %15, align 8
  %49 = getelementptr float, ptr %48, i64 %47
  store float 0.000000e+00, ptr %49, align 4
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %50

50:                                               ; preds = %42
  br label %51

51:                                               ; preds = %50
  store i32 0, ptr %9, align 4
  br label %52

52:                                               ; preds = %85, %51
  %53 = load i32, ptr %9, align 4
  %54 = load i32, ptr %12, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %88

56:                                               ; preds = %52
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %17, align 4
  %59 = mul nsw i32 %58, 512
  %60 = load i32, ptr %9, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %13, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = load i32, ptr %9, align 4
  %67 = mul nsw i32 %66, 512
  %68 = load i32, ptr %16, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %14, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fmul contract float %65, %73
  %75 = load i32, ptr %17, align 4
  %76 = mul nsw i32 %75, 512
  %77 = load i32, ptr %16, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = load ptr, ptr %15, align 8
  %81 = getelementptr float, ptr %80, i64 %79
  %82 = load float, ptr %81, align 4
  %83 = fadd contract float %82, %74
  store float %83, ptr %81, align 4
  br label %84

84:                                               ; preds = %57
  br label %85

85:                                               ; preds = %84
  %86 = load i32, ptr %9, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %9, align 4
  br label %52

88:                                               ; preds = %52
  br label %89

89:                                               ; preds = %88
  br label %90

90:                                               ; preds = %89
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %91

91:                                               ; preds = %90
  br label %92

92:                                               ; preds = %91
  br label %93

93:                                               ; preds = %92, %41
  br label %94

94:                                               ; preds = %93
  br label %95

95:                                               ; preds = %94
  call void @llvm.lifetime.end.p0(ptr %17)
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  br label %98

98:                                               ; preds = %97
  call void @llvm.lifetime.end.p0(ptr %16)
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11mm3_kernel1iiiiiPfS_S___noalias(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noalias noundef dereferenceable(1048576) %5, ptr noalias noundef dereferenceable(1048576) %6, ptr noalias noundef dereferenceable(1048576) %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, ptr %10, align 4
  store i32 %1, ptr %11, align 4
  store i32 %2, ptr %12, align 4
  store ptr %5, ptr %13, align 8
  store ptr %6, ptr %14, align 8
  store ptr %7, ptr %15, align 8
  call void @llvm.lifetime.start.p0(ptr %16)
  br label %18

18:                                               ; preds = %8
  %19 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %21 = mul i32 %19, %20
  %22 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %23 = add i32 %21, %22
  store i32 %23, ptr %16, align 4
  call void @llvm.lifetime.start.p0(ptr %17)
  br label %24

24:                                               ; preds = %18
  %25 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %26 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %27 = mul i32 %25, %26
  %28 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %29 = add i32 %27, %28
  store i32 %29, ptr %17, align 4
  br label %30

30:                                               ; preds = %24
  %31 = load i32, ptr %17, align 4
  %32 = load i32, ptr %10, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %38

34:                                               ; preds = %30
  %35 = load i32, ptr %16, align 4
  %36 = load i32, ptr %11, align 4
  %37 = icmp slt i32 %35, %36
  br label %39

38:                                               ; preds = %30
  br label %39

39:                                               ; preds = %34, %38
  %40 = phi i1 [ false, %38 ], [ %37, %34 ]
  br label %41

41:                                               ; preds = %39
  br i1 %40, label %42, label %93

42:                                               ; preds = %41
  %43 = load i32, ptr %17, align 4
  %44 = mul nsw i32 %43, 512
  %45 = load i32, ptr %16, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = load ptr, ptr %15, align 8
  %49 = getelementptr float, ptr %48, i64 %47
  store float 0.000000e+00, ptr %49, align 4
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %50

50:                                               ; preds = %42
  br label %51

51:                                               ; preds = %50
  store i32 0, ptr %9, align 4
  br label %52

52:                                               ; preds = %85, %51
  %53 = load i32, ptr %9, align 4
  %54 = load i32, ptr %12, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %88

56:                                               ; preds = %52
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %17, align 4
  %59 = mul nsw i32 %58, 512
  %60 = load i32, ptr %9, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %13, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = load i32, ptr %9, align 4
  %67 = mul nsw i32 %66, 512
  %68 = load i32, ptr %16, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %14, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fmul contract float %65, %73
  %75 = load i32, ptr %17, align 4
  %76 = mul nsw i32 %75, 512
  %77 = load i32, ptr %16, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = load ptr, ptr %15, align 8
  %81 = getelementptr float, ptr %80, i64 %79
  %82 = load float, ptr %81, align 4
  %83 = fadd contract float %82, %74
  store float %83, ptr %81, align 4
  br label %84

84:                                               ; preds = %57
  br label %85

85:                                               ; preds = %84
  %86 = load i32, ptr %9, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %9, align 4
  br label %52

88:                                               ; preds = %52
  br label %89

89:                                               ; preds = %88
  br label %90

90:                                               ; preds = %89
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %91

91:                                               ; preds = %90
  br label %92

92:                                               ; preds = %91
  br label %93

93:                                               ; preds = %92, %41
  br label %94

94:                                               ; preds = %93
  br label %95

95:                                               ; preds = %94
  call void @llvm.lifetime.end.p0(ptr %17)
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  br label %98

98:                                               ; preds = %97
  call void @llvm.lifetime.end.p0(ptr %16)
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
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
define dso_local ptx_kernel void @_Z11mm3_kernel2iiiiiPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef dereferenceable(1048576) %5, ptr noundef dereferenceable(1048576) %6, ptr noundef dereferenceable(1048576) %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %1, ptr %10, align 4
  store i32 %3, ptr %11, align 4
  store i32 %4, ptr %12, align 4
  store ptr %5, ptr %13, align 8
  store ptr %6, ptr %14, align 8
  store ptr %7, ptr %15, align 8
  call void @llvm.lifetime.start.p0(ptr %16)
  br label %18

18:                                               ; preds = %8
  %19 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %21 = mul i32 %19, %20
  %22 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %23 = add i32 %21, %22
  store i32 %23, ptr %16, align 4
  call void @llvm.lifetime.start.p0(ptr %17)
  br label %24

24:                                               ; preds = %18
  %25 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %26 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %27 = mul i32 %25, %26
  %28 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %29 = add i32 %27, %28
  store i32 %29, ptr %17, align 4
  br label %30

30:                                               ; preds = %24
  %31 = load i32, ptr %17, align 4
  %32 = load i32, ptr %10, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %38

34:                                               ; preds = %30
  %35 = load i32, ptr %16, align 4
  %36 = load i32, ptr %11, align 4
  %37 = icmp slt i32 %35, %36
  br label %39

38:                                               ; preds = %30
  br label %39

39:                                               ; preds = %34, %38
  %40 = phi i1 [ false, %38 ], [ %37, %34 ]
  br label %41

41:                                               ; preds = %39
  br i1 %40, label %42, label %93

42:                                               ; preds = %41
  %43 = load i32, ptr %17, align 4
  %44 = mul nsw i32 %43, 512
  %45 = load i32, ptr %16, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = load ptr, ptr %15, align 8
  %49 = getelementptr float, ptr %48, i64 %47
  store float 0.000000e+00, ptr %49, align 4
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %50

50:                                               ; preds = %42
  br label %51

51:                                               ; preds = %50
  store i32 0, ptr %9, align 4
  br label %52

52:                                               ; preds = %85, %51
  %53 = load i32, ptr %9, align 4
  %54 = load i32, ptr %12, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %88

56:                                               ; preds = %52
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %17, align 4
  %59 = mul nsw i32 %58, 512
  %60 = load i32, ptr %9, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %13, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = load i32, ptr %9, align 4
  %67 = mul nsw i32 %66, 512
  %68 = load i32, ptr %16, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %14, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fmul contract float %65, %73
  %75 = load i32, ptr %17, align 4
  %76 = mul nsw i32 %75, 512
  %77 = load i32, ptr %16, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = load ptr, ptr %15, align 8
  %81 = getelementptr float, ptr %80, i64 %79
  %82 = load float, ptr %81, align 4
  %83 = fadd contract float %82, %74
  store float %83, ptr %81, align 4
  br label %84

84:                                               ; preds = %57
  br label %85

85:                                               ; preds = %84
  %86 = load i32, ptr %9, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %9, align 4
  br label %52

88:                                               ; preds = %52
  br label %89

89:                                               ; preds = %88
  br label %90

90:                                               ; preds = %89
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %91

91:                                               ; preds = %90
  br label %92

92:                                               ; preds = %91
  br label %93

93:                                               ; preds = %92, %41
  br label %94

94:                                               ; preds = %93
  br label %95

95:                                               ; preds = %94
  call void @llvm.lifetime.end.p0(ptr %17)
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  br label %98

98:                                               ; preds = %97
  call void @llvm.lifetime.end.p0(ptr %16)
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11mm3_kernel2iiiiiPfS_S___noalias(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noalias noundef dereferenceable(1048576) %5, ptr noalias noundef dereferenceable(1048576) %6, ptr noalias noundef dereferenceable(1048576) %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %1, ptr %10, align 4
  store i32 %3, ptr %11, align 4
  store i32 %4, ptr %12, align 4
  store ptr %5, ptr %13, align 8
  store ptr %6, ptr %14, align 8
  store ptr %7, ptr %15, align 8
  call void @llvm.lifetime.start.p0(ptr %16)
  br label %18

18:                                               ; preds = %8
  %19 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %21 = mul i32 %19, %20
  %22 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %23 = add i32 %21, %22
  store i32 %23, ptr %16, align 4
  call void @llvm.lifetime.start.p0(ptr %17)
  br label %24

24:                                               ; preds = %18
  %25 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %26 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %27 = mul i32 %25, %26
  %28 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %29 = add i32 %27, %28
  store i32 %29, ptr %17, align 4
  br label %30

30:                                               ; preds = %24
  %31 = load i32, ptr %17, align 4
  %32 = load i32, ptr %10, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %38

34:                                               ; preds = %30
  %35 = load i32, ptr %16, align 4
  %36 = load i32, ptr %11, align 4
  %37 = icmp slt i32 %35, %36
  br label %39

38:                                               ; preds = %30
  br label %39

39:                                               ; preds = %34, %38
  %40 = phi i1 [ false, %38 ], [ %37, %34 ]
  br label %41

41:                                               ; preds = %39
  br i1 %40, label %42, label %93

42:                                               ; preds = %41
  %43 = load i32, ptr %17, align 4
  %44 = mul nsw i32 %43, 512
  %45 = load i32, ptr %16, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = load ptr, ptr %15, align 8
  %49 = getelementptr float, ptr %48, i64 %47
  store float 0.000000e+00, ptr %49, align 4
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %50

50:                                               ; preds = %42
  br label %51

51:                                               ; preds = %50
  store i32 0, ptr %9, align 4
  br label %52

52:                                               ; preds = %85, %51
  %53 = load i32, ptr %9, align 4
  %54 = load i32, ptr %12, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %88

56:                                               ; preds = %52
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %17, align 4
  %59 = mul nsw i32 %58, 512
  %60 = load i32, ptr %9, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %13, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = load i32, ptr %9, align 4
  %67 = mul nsw i32 %66, 512
  %68 = load i32, ptr %16, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %14, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fmul contract float %65, %73
  %75 = load i32, ptr %17, align 4
  %76 = mul nsw i32 %75, 512
  %77 = load i32, ptr %16, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = load ptr, ptr %15, align 8
  %81 = getelementptr float, ptr %80, i64 %79
  %82 = load float, ptr %81, align 4
  %83 = fadd contract float %82, %74
  store float %83, ptr %81, align 4
  br label %84

84:                                               ; preds = %57
  br label %85

85:                                               ; preds = %84
  %86 = load i32, ptr %9, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %9, align 4
  br label %52

88:                                               ; preds = %52
  br label %89

89:                                               ; preds = %88
  br label %90

90:                                               ; preds = %89
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %91

91:                                               ; preds = %90
  br label %92

92:                                               ; preds = %91
  br label %93

93:                                               ; preds = %92, %41
  br label %94

94:                                               ; preds = %93
  br label %95

95:                                               ; preds = %94
  call void @llvm.lifetime.end.p0(ptr %17)
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  br label %98

98:                                               ; preds = %97
  call void @llvm.lifetime.end.p0(ptr %16)
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11mm3_kernel3iiiiiPfS_S_(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef dereferenceable(1048576) %5, ptr noundef dereferenceable(1048576) %6, ptr noundef dereferenceable(1048576) %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, ptr %10, align 4
  store i32 %1, ptr %11, align 4
  store i32 %3, ptr %12, align 4
  store ptr %5, ptr %13, align 8
  store ptr %6, ptr %14, align 8
  store ptr %7, ptr %15, align 8
  call void @llvm.lifetime.start.p0(ptr %16)
  br label %18

18:                                               ; preds = %8
  %19 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %21 = mul i32 %19, %20
  %22 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %23 = add i32 %21, %22
  store i32 %23, ptr %16, align 4
  call void @llvm.lifetime.start.p0(ptr %17)
  br label %24

24:                                               ; preds = %18
  %25 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %26 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %27 = mul i32 %25, %26
  %28 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %29 = add i32 %27, %28
  store i32 %29, ptr %17, align 4
  br label %30

30:                                               ; preds = %24
  %31 = load i32, ptr %17, align 4
  %32 = load i32, ptr %10, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %38

34:                                               ; preds = %30
  %35 = load i32, ptr %16, align 4
  %36 = load i32, ptr %12, align 4
  %37 = icmp slt i32 %35, %36
  br label %39

38:                                               ; preds = %30
  br label %39

39:                                               ; preds = %34, %38
  %40 = phi i1 [ false, %38 ], [ %37, %34 ]
  br label %41

41:                                               ; preds = %39
  br i1 %40, label %42, label %93

42:                                               ; preds = %41
  %43 = load i32, ptr %17, align 4
  %44 = mul nsw i32 %43, 512
  %45 = load i32, ptr %16, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = load ptr, ptr %15, align 8
  %49 = getelementptr float, ptr %48, i64 %47
  store float 0.000000e+00, ptr %49, align 4
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %50

50:                                               ; preds = %42
  br label %51

51:                                               ; preds = %50
  store i32 0, ptr %9, align 4
  br label %52

52:                                               ; preds = %85, %51
  %53 = load i32, ptr %9, align 4
  %54 = load i32, ptr %11, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %88

56:                                               ; preds = %52
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %17, align 4
  %59 = mul nsw i32 %58, 512
  %60 = load i32, ptr %9, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %13, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = load i32, ptr %9, align 4
  %67 = mul nsw i32 %66, 512
  %68 = load i32, ptr %16, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %14, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fmul contract float %65, %73
  %75 = load i32, ptr %17, align 4
  %76 = mul nsw i32 %75, 512
  %77 = load i32, ptr %16, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = load ptr, ptr %15, align 8
  %81 = getelementptr float, ptr %80, i64 %79
  %82 = load float, ptr %81, align 4
  %83 = fadd contract float %82, %74
  store float %83, ptr %81, align 4
  br label %84

84:                                               ; preds = %57
  br label %85

85:                                               ; preds = %84
  %86 = load i32, ptr %9, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %9, align 4
  br label %52

88:                                               ; preds = %52
  br label %89

89:                                               ; preds = %88
  br label %90

90:                                               ; preds = %89
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %91

91:                                               ; preds = %90
  br label %92

92:                                               ; preds = %91
  br label %93

93:                                               ; preds = %92, %41
  br label %94

94:                                               ; preds = %93
  br label %95

95:                                               ; preds = %94
  call void @llvm.lifetime.end.p0(ptr %17)
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  br label %98

98:                                               ; preds = %97
  call void @llvm.lifetime.end.p0(ptr %16)
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11mm3_kernel3iiiiiPfS_S___noalias(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noalias noundef dereferenceable(1048576) %5, ptr noalias noundef dereferenceable(1048576) %6, ptr noalias noundef dereferenceable(1048576) %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, ptr %10, align 4
  store i32 %1, ptr %11, align 4
  store i32 %3, ptr %12, align 4
  store ptr %5, ptr %13, align 8
  store ptr %6, ptr %14, align 8
  store ptr %7, ptr %15, align 8
  call void @llvm.lifetime.start.p0(ptr %16)
  br label %18

18:                                               ; preds = %8
  %19 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %21 = mul i32 %19, %20
  %22 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %23 = add i32 %21, %22
  store i32 %23, ptr %16, align 4
  call void @llvm.lifetime.start.p0(ptr %17)
  br label %24

24:                                               ; preds = %18
  %25 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %26 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %27 = mul i32 %25, %26
  %28 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %29 = add i32 %27, %28
  store i32 %29, ptr %17, align 4
  br label %30

30:                                               ; preds = %24
  %31 = load i32, ptr %17, align 4
  %32 = load i32, ptr %10, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %38

34:                                               ; preds = %30
  %35 = load i32, ptr %16, align 4
  %36 = load i32, ptr %12, align 4
  %37 = icmp slt i32 %35, %36
  br label %39

38:                                               ; preds = %30
  br label %39

39:                                               ; preds = %34, %38
  %40 = phi i1 [ false, %38 ], [ %37, %34 ]
  br label %41

41:                                               ; preds = %39
  br i1 %40, label %42, label %93

42:                                               ; preds = %41
  %43 = load i32, ptr %17, align 4
  %44 = mul nsw i32 %43, 512
  %45 = load i32, ptr %16, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = load ptr, ptr %15, align 8
  %49 = getelementptr float, ptr %48, i64 %47
  store float 0.000000e+00, ptr %49, align 4
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %50

50:                                               ; preds = %42
  br label %51

51:                                               ; preds = %50
  store i32 0, ptr %9, align 4
  br label %52

52:                                               ; preds = %85, %51
  %53 = load i32, ptr %9, align 4
  %54 = load i32, ptr %11, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %88

56:                                               ; preds = %52
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %17, align 4
  %59 = mul nsw i32 %58, 512
  %60 = load i32, ptr %9, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %13, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = load i32, ptr %9, align 4
  %67 = mul nsw i32 %66, 512
  %68 = load i32, ptr %16, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %14, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fmul contract float %65, %73
  %75 = load i32, ptr %17, align 4
  %76 = mul nsw i32 %75, 512
  %77 = load i32, ptr %16, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = load ptr, ptr %15, align 8
  %81 = getelementptr float, ptr %80, i64 %79
  %82 = load float, ptr %81, align 4
  %83 = fadd contract float %82, %74
  store float %83, ptr %81, align 4
  br label %84

84:                                               ; preds = %57
  br label %85

85:                                               ; preds = %84
  %86 = load i32, ptr %9, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %9, align 4
  br label %52

88:                                               ; preds = %52
  br label %89

89:                                               ; preds = %88
  br label %90

90:                                               ; preds = %89
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %91

91:                                               ; preds = %90
  br label %92

92:                                               ; preds = %91
  br label %93

93:                                               ; preds = %92, %41
  br label %94

94:                                               ; preds = %93
  br label %95

95:                                               ; preds = %94
  call void @llvm.lifetime.end.p0(ptr %17)
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  br label %98

98:                                               ; preds = %97
  call void @llvm.lifetime.end.p0(ptr %16)
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
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
