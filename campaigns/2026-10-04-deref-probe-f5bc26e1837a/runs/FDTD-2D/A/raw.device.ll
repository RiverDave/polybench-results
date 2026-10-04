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
define dso_local ptx_kernel void @_Z17fdtd_step1_kerneliiPfS_S_S_i(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, i32 noundef %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store ptr %2, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  store i32 %6, ptr %13, align 4
  call void @llvm.lifetime.start.p0(ptr %14)
  br label %16

16:                                               ; preds = %7
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %18 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %19 = mul i32 %17, %18
  %20 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %21 = add i32 %19, %20
  store i32 %21, ptr %14, align 4
  call void @llvm.lifetime.start.p0(ptr %15)
  br label %22

22:                                               ; preds = %16
  %23 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %24 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %25 = mul i32 %23, %24
  %26 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %27 = add i32 %25, %26
  store i32 %27, ptr %15, align 4
  br label %28

28:                                               ; preds = %22
  %29 = load i32, ptr %15, align 4
  %30 = load i32, ptr %8, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %36

32:                                               ; preds = %28
  %33 = load i32, ptr %14, align 4
  %34 = load i32, ptr %9, align 4
  %35 = icmp slt i32 %33, %34
  br label %37

36:                                               ; preds = %28
  br label %37

37:                                               ; preds = %32, %36
  %38 = phi i1 [ false, %36 ], [ %35, %32 ]
  br label %39

39:                                               ; preds = %37
  br i1 %38, label %40, label %95

40:                                               ; preds = %39
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %15, align 4
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %57

44:                                               ; preds = %41
  %45 = load i32, ptr %13, align 4
  %46 = sext i32 %45 to i64
  %47 = load ptr, ptr %10, align 8
  %48 = getelementptr float, ptr %47, i64 %46
  %49 = load float, ptr %48, align 4
  %50 = load i32, ptr %15, align 4
  %51 = mul nsw i32 %50, 2048
  %52 = load i32, ptr %14, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %11, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  store float %49, ptr %56, align 4
  br label %93

57:                                               ; preds = %41
  %58 = load i32, ptr %15, align 4
  %59 = mul nsw i32 %58, 2048
  %60 = load i32, ptr %14, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %11, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = load i32, ptr %15, align 4
  %67 = mul nsw i32 %66, 2048
  %68 = load i32, ptr %14, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %12, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = load i32, ptr %15, align 4
  %75 = sub nsw i32 %74, 1
  %76 = mul nsw i32 %75, 2048
  %77 = load i32, ptr %14, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = load ptr, ptr %12, align 8
  %81 = getelementptr float, ptr %80, i64 %79
  %82 = load float, ptr %81, align 4
  %83 = fsub contract float %73, %82
  %84 = fmul contract float 5.000000e-01, %83
  %85 = fsub contract float %65, %84
  %86 = load i32, ptr %15, align 4
  %87 = mul nsw i32 %86, 2048
  %88 = load i32, ptr %14, align 4
  %89 = add nsw i32 %87, %88
  %90 = sext i32 %89 to i64
  %91 = load ptr, ptr %11, align 8
  %92 = getelementptr float, ptr %91, i64 %90
  store float %85, ptr %92, align 4
  br label %93

93:                                               ; preds = %44, %57
  br label %94

94:                                               ; preds = %93
  br label %95

95:                                               ; preds = %94, %39
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %98

98:                                               ; preds = %97
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  call void @llvm.lifetime.end.p0(ptr %14)
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z17fdtd_step1_kerneliiPfS_S_S_i__noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, ptr noalias noundef %5, i32 noundef %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store ptr %2, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  store i32 %6, ptr %13, align 4
  call void @llvm.lifetime.start.p0(ptr %14)
  br label %16

16:                                               ; preds = %7
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %18 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %19 = mul i32 %17, %18
  %20 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %21 = add i32 %19, %20
  store i32 %21, ptr %14, align 4
  call void @llvm.lifetime.start.p0(ptr %15)
  br label %22

22:                                               ; preds = %16
  %23 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %24 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %25 = mul i32 %23, %24
  %26 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %27 = add i32 %25, %26
  store i32 %27, ptr %15, align 4
  br label %28

28:                                               ; preds = %22
  %29 = load i32, ptr %15, align 4
  %30 = load i32, ptr %8, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %36

32:                                               ; preds = %28
  %33 = load i32, ptr %14, align 4
  %34 = load i32, ptr %9, align 4
  %35 = icmp slt i32 %33, %34
  br label %37

36:                                               ; preds = %28
  br label %37

37:                                               ; preds = %32, %36
  %38 = phi i1 [ false, %36 ], [ %35, %32 ]
  br label %39

39:                                               ; preds = %37
  br i1 %38, label %40, label %95

40:                                               ; preds = %39
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %15, align 4
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %57

44:                                               ; preds = %41
  %45 = load i32, ptr %13, align 4
  %46 = sext i32 %45 to i64
  %47 = load ptr, ptr %10, align 8
  %48 = getelementptr float, ptr %47, i64 %46
  %49 = load float, ptr %48, align 4
  %50 = load i32, ptr %15, align 4
  %51 = mul nsw i32 %50, 2048
  %52 = load i32, ptr %14, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %11, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  store float %49, ptr %56, align 4
  br label %93

57:                                               ; preds = %41
  %58 = load i32, ptr %15, align 4
  %59 = mul nsw i32 %58, 2048
  %60 = load i32, ptr %14, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %11, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = load i32, ptr %15, align 4
  %67 = mul nsw i32 %66, 2048
  %68 = load i32, ptr %14, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %12, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = load i32, ptr %15, align 4
  %75 = sub nsw i32 %74, 1
  %76 = mul nsw i32 %75, 2048
  %77 = load i32, ptr %14, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = load ptr, ptr %12, align 8
  %81 = getelementptr float, ptr %80, i64 %79
  %82 = load float, ptr %81, align 4
  %83 = fsub contract float %73, %82
  %84 = fmul contract float 5.000000e-01, %83
  %85 = fsub contract float %65, %84
  %86 = load i32, ptr %15, align 4
  %87 = mul nsw i32 %86, 2048
  %88 = load i32, ptr %14, align 4
  %89 = add nsw i32 %87, %88
  %90 = sext i32 %89 to i64
  %91 = load ptr, ptr %11, align 8
  %92 = getelementptr float, ptr %91, i64 %90
  store float %85, ptr %92, align 4
  br label %93

93:                                               ; preds = %44, %57
  br label %94

94:                                               ; preds = %93
  br label %95

95:                                               ; preds = %94, %39
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %98

98:                                               ; preds = %97
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  call void @llvm.lifetime.end.p0(ptr %14)
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
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
define dso_local ptx_kernel void @_Z17fdtd_step2_kerneliiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %13

13:                                               ; preds = %6
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %16 = mul i32 %14, %15
  %17 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %18 = add i32 %16, %17
  store i32 %18, ptr %11, align 4
  call void @llvm.lifetime.start.p0(ptr %12)
  br label %19

19:                                               ; preds = %13
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %21 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %22 = mul i32 %20, %21
  %23 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
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
  %31 = load i32, ptr %8, align 4
  %32 = icmp slt i32 %30, %31
  br label %34

33:                                               ; preds = %25
  br label %34

34:                                               ; preds = %29, %33
  %35 = phi i1 [ false, %33 ], [ %32, %29 ]
  br label %36

36:                                               ; preds = %34
  br i1 %35, label %37, label %40

37:                                               ; preds = %36
  %38 = load i32, ptr %11, align 4
  %39 = icmp sgt i32 %38, 0
  br label %41

40:                                               ; preds = %36
  br label %41

41:                                               ; preds = %37, %40
  %42 = phi i1 [ false, %40 ], [ %39, %37 ]
  br label %43

43:                                               ; preds = %41
  br i1 %42, label %44, label %80

44:                                               ; preds = %43
  %45 = load i32, ptr %12, align 4
  %46 = mul nsw i32 %45, 2048
  %47 = load i32, ptr %11, align 4
  %48 = add nsw i32 %46, %47
  %49 = sext i32 %48 to i64
  %50 = load ptr, ptr %9, align 8
  %51 = getelementptr float, ptr %50, i64 %49
  %52 = load float, ptr %51, align 4
  %53 = load i32, ptr %12, align 4
  %54 = mul nsw i32 %53, 2048
  %55 = load i32, ptr %11, align 4
  %56 = add nsw i32 %54, %55
  %57 = sext i32 %56 to i64
  %58 = load ptr, ptr %10, align 8
  %59 = getelementptr float, ptr %58, i64 %57
  %60 = load float, ptr %59, align 4
  %61 = load i32, ptr %12, align 4
  %62 = mul nsw i32 %61, 2048
  %63 = load i32, ptr %11, align 4
  %64 = sub nsw i32 %63, 1
  %65 = add nsw i32 %62, %64
  %66 = sext i32 %65 to i64
  %67 = load ptr, ptr %10, align 8
  %68 = getelementptr float, ptr %67, i64 %66
  %69 = load float, ptr %68, align 4
  %70 = fsub contract float %60, %69
  %71 = fmul contract float 5.000000e-01, %70
  %72 = fsub contract float %52, %71
  %73 = load i32, ptr %12, align 4
  %74 = mul nsw i32 %73, 2048
  %75 = load i32, ptr %11, align 4
  %76 = add nsw i32 %74, %75
  %77 = sext i32 %76 to i64
  %78 = load ptr, ptr %9, align 8
  %79 = getelementptr float, ptr %78, i64 %77
  store float %72, ptr %79, align 4
  br label %80

80:                                               ; preds = %44, %43
  br label %81

81:                                               ; preds = %80
  br label %82

82:                                               ; preds = %81
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %83

83:                                               ; preds = %82
  br label %84

84:                                               ; preds = %83
  br label %85

85:                                               ; preds = %84
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %86

86:                                               ; preds = %85
  br label %87

87:                                               ; preds = %86
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z17fdtd_step2_kerneliiPfS_S_i__noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %13

13:                                               ; preds = %6
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %16 = mul i32 %14, %15
  %17 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %18 = add i32 %16, %17
  store i32 %18, ptr %11, align 4
  call void @llvm.lifetime.start.p0(ptr %12)
  br label %19

19:                                               ; preds = %13
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %21 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %22 = mul i32 %20, %21
  %23 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
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
  %31 = load i32, ptr %8, align 4
  %32 = icmp slt i32 %30, %31
  br label %34

33:                                               ; preds = %25
  br label %34

34:                                               ; preds = %29, %33
  %35 = phi i1 [ false, %33 ], [ %32, %29 ]
  br label %36

36:                                               ; preds = %34
  br i1 %35, label %37, label %40

37:                                               ; preds = %36
  %38 = load i32, ptr %11, align 4
  %39 = icmp sgt i32 %38, 0
  br label %41

40:                                               ; preds = %36
  br label %41

41:                                               ; preds = %37, %40
  %42 = phi i1 [ false, %40 ], [ %39, %37 ]
  br label %43

43:                                               ; preds = %41
  br i1 %42, label %44, label %80

44:                                               ; preds = %43
  %45 = load i32, ptr %12, align 4
  %46 = mul nsw i32 %45, 2048
  %47 = load i32, ptr %11, align 4
  %48 = add nsw i32 %46, %47
  %49 = sext i32 %48 to i64
  %50 = load ptr, ptr %9, align 8
  %51 = getelementptr float, ptr %50, i64 %49
  %52 = load float, ptr %51, align 4
  %53 = load i32, ptr %12, align 4
  %54 = mul nsw i32 %53, 2048
  %55 = load i32, ptr %11, align 4
  %56 = add nsw i32 %54, %55
  %57 = sext i32 %56 to i64
  %58 = load ptr, ptr %10, align 8
  %59 = getelementptr float, ptr %58, i64 %57
  %60 = load float, ptr %59, align 4
  %61 = load i32, ptr %12, align 4
  %62 = mul nsw i32 %61, 2048
  %63 = load i32, ptr %11, align 4
  %64 = sub nsw i32 %63, 1
  %65 = add nsw i32 %62, %64
  %66 = sext i32 %65 to i64
  %67 = load ptr, ptr %10, align 8
  %68 = getelementptr float, ptr %67, i64 %66
  %69 = load float, ptr %68, align 4
  %70 = fsub contract float %60, %69
  %71 = fmul contract float 5.000000e-01, %70
  %72 = fsub contract float %52, %71
  %73 = load i32, ptr %12, align 4
  %74 = mul nsw i32 %73, 2048
  %75 = load i32, ptr %11, align 4
  %76 = add nsw i32 %74, %75
  %77 = sext i32 %76 to i64
  %78 = load ptr, ptr %9, align 8
  %79 = getelementptr float, ptr %78, i64 %77
  store float %72, ptr %79, align 4
  br label %80

80:                                               ; preds = %44, %43
  br label %81

81:                                               ; preds = %80
  br label %82

82:                                               ; preds = %81
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %83

83:                                               ; preds = %82
  br label %84

84:                                               ; preds = %83
  br label %85

85:                                               ; preds = %84
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %86

86:                                               ; preds = %85
  br label %87

87:                                               ; preds = %86
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z17fdtd_step3_kerneliiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  call void @llvm.lifetime.start.p0(ptr %12)
  br label %14

14:                                               ; preds = %6
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %17 = mul i32 %15, %16
  %18 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %19 = add i32 %17, %18
  store i32 %19, ptr %12, align 4
  call void @llvm.lifetime.start.p0(ptr %13)
  br label %20

20:                                               ; preds = %14
  %21 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %22 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %23 = mul i32 %21, %22
  %24 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %25 = add i32 %23, %24
  store i32 %25, ptr %13, align 4
  br label %26

26:                                               ; preds = %20
  %27 = load i32, ptr %13, align 4
  %28 = load i32, ptr %7, align 4
  %29 = sub nsw i32 %28, 1
  %30 = icmp slt i32 %27, %29
  br i1 %30, label %31, label %36

31:                                               ; preds = %26
  %32 = load i32, ptr %12, align 4
  %33 = load i32, ptr %8, align 4
  %34 = sub nsw i32 %33, 1
  %35 = icmp slt i32 %32, %34
  br label %37

36:                                               ; preds = %26
  br label %37

37:                                               ; preds = %31, %36
  %38 = phi i1 [ false, %36 ], [ %35, %31 ]
  br label %39

39:                                               ; preds = %37
  br i1 %38, label %40, label %95

40:                                               ; preds = %39
  %41 = load i32, ptr %13, align 4
  %42 = mul nsw i32 %41, 2048
  %43 = load i32, ptr %12, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %11, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = load i32, ptr %13, align 4
  %50 = mul nsw i32 %49, 2048
  %51 = load i32, ptr %12, align 4
  %52 = add nsw i32 %51, 1
  %53 = add nsw i32 %50, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %9, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = load i32, ptr %13, align 4
  %59 = mul nsw i32 %58, 2048
  %60 = load i32, ptr %12, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %9, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = fsub contract float %57, %65
  %67 = load i32, ptr %13, align 4
  %68 = add nsw i32 %67, 1
  %69 = mul nsw i32 %68, 2048
  %70 = load i32, ptr %12, align 4
  %71 = add nsw i32 %69, %70
  %72 = sext i32 %71 to i64
  %73 = load ptr, ptr %10, align 8
  %74 = getelementptr float, ptr %73, i64 %72
  %75 = load float, ptr %74, align 4
  %76 = fadd contract float %66, %75
  %77 = load i32, ptr %13, align 4
  %78 = mul nsw i32 %77, 2048
  %79 = load i32, ptr %12, align 4
  %80 = add nsw i32 %78, %79
  %81 = sext i32 %80 to i64
  %82 = load ptr, ptr %10, align 8
  %83 = getelementptr float, ptr %82, i64 %81
  %84 = load float, ptr %83, align 4
  %85 = fsub contract float %76, %84
  %86 = fmul contract float f0x3F333333, %85
  %87 = fsub contract float %48, %86
  %88 = load i32, ptr %13, align 4
  %89 = mul nsw i32 %88, 2048
  %90 = load i32, ptr %12, align 4
  %91 = add nsw i32 %89, %90
  %92 = sext i32 %91 to i64
  %93 = load ptr, ptr %11, align 8
  %94 = getelementptr float, ptr %93, i64 %92
  store float %87, ptr %94, align 4
  br label %95

95:                                               ; preds = %40, %39
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  call void @llvm.lifetime.end.p0(ptr %13)
  br label %98

98:                                               ; preds = %97
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z17fdtd_step3_kerneliiPfS_S_i__noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  call void @llvm.lifetime.start.p0(ptr %12)
  br label %14

14:                                               ; preds = %6
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %17 = mul i32 %15, %16
  %18 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %19 = add i32 %17, %18
  store i32 %19, ptr %12, align 4
  call void @llvm.lifetime.start.p0(ptr %13)
  br label %20

20:                                               ; preds = %14
  %21 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %22 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %23 = mul i32 %21, %22
  %24 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %25 = add i32 %23, %24
  store i32 %25, ptr %13, align 4
  br label %26

26:                                               ; preds = %20
  %27 = load i32, ptr %13, align 4
  %28 = load i32, ptr %7, align 4
  %29 = sub nsw i32 %28, 1
  %30 = icmp slt i32 %27, %29
  br i1 %30, label %31, label %36

31:                                               ; preds = %26
  %32 = load i32, ptr %12, align 4
  %33 = load i32, ptr %8, align 4
  %34 = sub nsw i32 %33, 1
  %35 = icmp slt i32 %32, %34
  br label %37

36:                                               ; preds = %26
  br label %37

37:                                               ; preds = %31, %36
  %38 = phi i1 [ false, %36 ], [ %35, %31 ]
  br label %39

39:                                               ; preds = %37
  br i1 %38, label %40, label %95

40:                                               ; preds = %39
  %41 = load i32, ptr %13, align 4
  %42 = mul nsw i32 %41, 2048
  %43 = load i32, ptr %12, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %11, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = load i32, ptr %13, align 4
  %50 = mul nsw i32 %49, 2048
  %51 = load i32, ptr %12, align 4
  %52 = add nsw i32 %51, 1
  %53 = add nsw i32 %50, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %9, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = load i32, ptr %13, align 4
  %59 = mul nsw i32 %58, 2048
  %60 = load i32, ptr %12, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %9, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = fsub contract float %57, %65
  %67 = load i32, ptr %13, align 4
  %68 = add nsw i32 %67, 1
  %69 = mul nsw i32 %68, 2048
  %70 = load i32, ptr %12, align 4
  %71 = add nsw i32 %69, %70
  %72 = sext i32 %71 to i64
  %73 = load ptr, ptr %10, align 8
  %74 = getelementptr float, ptr %73, i64 %72
  %75 = load float, ptr %74, align 4
  %76 = fadd contract float %66, %75
  %77 = load i32, ptr %13, align 4
  %78 = mul nsw i32 %77, 2048
  %79 = load i32, ptr %12, align 4
  %80 = add nsw i32 %78, %79
  %81 = sext i32 %80 to i64
  %82 = load ptr, ptr %10, align 8
  %83 = getelementptr float, ptr %82, i64 %81
  %84 = load float, ptr %83, align 4
  %85 = fsub contract float %76, %84
  %86 = fmul contract float f0x3F333333, %85
  %87 = fsub contract float %48, %86
  %88 = load i32, ptr %13, align 4
  %89 = mul nsw i32 %88, 2048
  %90 = load i32, ptr %12, align 4
  %91 = add nsw i32 %89, %90
  %92 = sext i32 %91 to i64
  %93 = load ptr, ptr %11, align 8
  %94 = getelementptr float, ptr %93, i64 %92
  store float %87, ptr %94, align 4
  br label %95

95:                                               ; preds = %40, %39
  br label %96

96:                                               ; preds = %95
  br label %97

97:                                               ; preds = %96
  call void @llvm.lifetime.end.p0(ptr %13)
  br label %98

98:                                               ; preds = %97
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
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
