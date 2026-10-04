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
define dso_local ptx_kernel void @_Z19gramschmidt_kernel1iiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #0 {
  %7 = alloca float, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %9, align 4
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store i32 %5, ptr %12, align 4
  call void @llvm.lifetime.start.p0(ptr %13)
  br label %14

14:                                               ; preds = %6
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #5
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #5
  %17 = mul i32 %15, %16
  %18 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #5
  %19 = add i32 %17, %18
  store i32 %19, ptr %13, align 4
  br label %20

20:                                               ; preds = %14
  %21 = load i32, ptr %13, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %73

23:                                               ; preds = %20
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %24

24:                                               ; preds = %23
  store float 0.000000e+00, ptr %7, align 4
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %25

25:                                               ; preds = %24
  br label %26

26:                                               ; preds = %25
  store i32 0, ptr %8, align 4
  br label %27

27:                                               ; preds = %53, %26
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %9, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %56

31:                                               ; preds = %27
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %8, align 4
  %34 = mul nsw i32 %33, 2048
  %35 = load i32, ptr %12, align 4
  %36 = add nsw i32 %34, %35
  %37 = sext i32 %36 to i64
  %38 = load ptr, ptr %10, align 8
  %39 = getelementptr float, ptr %38, i64 %37
  %40 = load float, ptr %39, align 4
  %41 = load i32, ptr %8, align 4
  %42 = mul nsw i32 %41, 2048
  %43 = load i32, ptr %12, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %10, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fmul contract float %40, %48
  %50 = load float, ptr %7, align 4
  %51 = fadd contract float %50, %49
  store float %51, ptr %7, align 4
  br label %52

52:                                               ; preds = %32
  br label %53

53:                                               ; preds = %52
  %54 = load i32, ptr %8, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %8, align 4
  br label %27

56:                                               ; preds = %27
  br label %57

57:                                               ; preds = %56
  %58 = load float, ptr %7, align 4
  %59 = call noundef float @_ZL4sqrtf(float noundef %58) #5
  %60 = load i32, ptr %12, align 4
  %61 = mul nsw i32 %60, 2048
  %62 = load i32, ptr %12, align 4
  %63 = add nsw i32 %61, %62
  %64 = sext i32 %63 to i64
  %65 = load ptr, ptr %11, align 8
  %66 = getelementptr float, ptr %65, i64 %64
  store float %59, ptr %66, align 4
  br label %67

67:                                               ; preds = %57
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %68

68:                                               ; preds = %67
  br label %69

69:                                               ; preds = %68
  br label %70

70:                                               ; preds = %69
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %71

71:                                               ; preds = %70
  br label %72

72:                                               ; preds = %71
  br label %73

73:                                               ; preds = %72, %20
  br label %74

74:                                               ; preds = %73
  br label %75

75:                                               ; preds = %74
  call void @llvm.lifetime.end.p0(ptr %13)
  br label %76

76:                                               ; preds = %75
  br label %77

77:                                               ; preds = %76
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z19gramschmidt_kernel1iiPfS_S_i__noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, i32 noundef %5) #0 {
  %7 = alloca float, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %9, align 4
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store i32 %5, ptr %12, align 4
  call void @llvm.lifetime.start.p0(ptr %13)
  br label %14

14:                                               ; preds = %6
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #5
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #5
  %17 = mul i32 %15, %16
  %18 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #5
  %19 = add i32 %17, %18
  store i32 %19, ptr %13, align 4
  br label %20

20:                                               ; preds = %14
  %21 = load i32, ptr %13, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %73

23:                                               ; preds = %20
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %24

24:                                               ; preds = %23
  store float 0.000000e+00, ptr %7, align 4
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %25

25:                                               ; preds = %24
  br label %26

26:                                               ; preds = %25
  store i32 0, ptr %8, align 4
  br label %27

27:                                               ; preds = %53, %26
  %28 = load i32, ptr %8, align 4
  %29 = load i32, ptr %9, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %56

31:                                               ; preds = %27
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %8, align 4
  %34 = mul nsw i32 %33, 2048
  %35 = load i32, ptr %12, align 4
  %36 = add nsw i32 %34, %35
  %37 = sext i32 %36 to i64
  %38 = load ptr, ptr %10, align 8
  %39 = getelementptr float, ptr %38, i64 %37
  %40 = load float, ptr %39, align 4
  %41 = load i32, ptr %8, align 4
  %42 = mul nsw i32 %41, 2048
  %43 = load i32, ptr %12, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %10, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fmul contract float %40, %48
  %50 = load float, ptr %7, align 4
  %51 = fadd contract float %50, %49
  store float %51, ptr %7, align 4
  br label %52

52:                                               ; preds = %32
  br label %53

53:                                               ; preds = %52
  %54 = load i32, ptr %8, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %8, align 4
  br label %27

56:                                               ; preds = %27
  br label %57

57:                                               ; preds = %56
  %58 = load float, ptr %7, align 4
  %59 = call noundef float @_ZL4sqrtf(float noundef %58) #5
  %60 = load i32, ptr %12, align 4
  %61 = mul nsw i32 %60, 2048
  %62 = load i32, ptr %12, align 4
  %63 = add nsw i32 %61, %62
  %64 = sext i32 %63 to i64
  %65 = load ptr, ptr %11, align 8
  %66 = getelementptr float, ptr %65, i64 %64
  store float %59, ptr %66, align 4
  br label %67

67:                                               ; preds = %57
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %68

68:                                               ; preds = %67
  br label %69

69:                                               ; preds = %68
  br label %70

70:                                               ; preds = %69
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %71

71:                                               ; preds = %70
  br label %72

72:                                               ; preds = %71
  br label %73

73:                                               ; preds = %72, %20
  br label %74

74:                                               ; preds = %73
  br label %75

75:                                               ; preds = %74
  call void @llvm.lifetime.end.p0(ptr %13)
  br label %76

76:                                               ; preds = %75
  br label %77

77:                                               ; preds = %76
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
define internal noundef float @_ZL4sqrtf(float noundef %0) #1 {
  %2 = call noundef float @_ZL5sqrtff(float noundef %0) #5
  ret float %2
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z19gramschmidt_kernel2iiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  store i32 %5, ptr %11, align 4
  call void @llvm.lifetime.start.p0(ptr %12)
  br label %13

13:                                               ; preds = %6
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
  br i1 %22, label %23, label %48

23:                                               ; preds = %19
  %24 = load i32, ptr %12, align 4
  %25 = mul nsw i32 %24, 2048
  %26 = load i32, ptr %11, align 4
  %27 = add nsw i32 %25, %26
  %28 = sext i32 %27 to i64
  %29 = load ptr, ptr %8, align 8
  %30 = getelementptr float, ptr %29, i64 %28
  %31 = load float, ptr %30, align 4
  %32 = load i32, ptr %11, align 4
  %33 = mul nsw i32 %32, 2048
  %34 = load i32, ptr %11, align 4
  %35 = add nsw i32 %33, %34
  %36 = sext i32 %35 to i64
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr float, ptr %37, i64 %36
  %39 = load float, ptr %38, align 4
  %40 = fdiv contract float %31, %39
  %41 = load i32, ptr %12, align 4
  %42 = mul nsw i32 %41, 2048
  %43 = load i32, ptr %11, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %10, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  store float %40, ptr %47, align 4
  br label %48

48:                                               ; preds = %23, %19
  br label %49

49:                                               ; preds = %48
  br label %50

50:                                               ; preds = %49
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %51

51:                                               ; preds = %50
  br label %52

52:                                               ; preds = %51
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z19gramschmidt_kernel2iiPfS_S_i__noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  store i32 %5, ptr %11, align 4
  call void @llvm.lifetime.start.p0(ptr %12)
  br label %13

13:                                               ; preds = %6
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
  br i1 %22, label %23, label %48

23:                                               ; preds = %19
  %24 = load i32, ptr %12, align 4
  %25 = mul nsw i32 %24, 2048
  %26 = load i32, ptr %11, align 4
  %27 = add nsw i32 %25, %26
  %28 = sext i32 %27 to i64
  %29 = load ptr, ptr %8, align 8
  %30 = getelementptr float, ptr %29, i64 %28
  %31 = load float, ptr %30, align 4
  %32 = load i32, ptr %11, align 4
  %33 = mul nsw i32 %32, 2048
  %34 = load i32, ptr %11, align 4
  %35 = add nsw i32 %33, %34
  %36 = sext i32 %35 to i64
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr float, ptr %37, i64 %36
  %39 = load float, ptr %38, align 4
  %40 = fdiv contract float %31, %39
  %41 = load i32, ptr %12, align 4
  %42 = mul nsw i32 %41, 2048
  %43 = load i32, ptr %11, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %10, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  store float %40, ptr %47, align 4
  br label %48

48:                                               ; preds = %23, %19
  br label %49

49:                                               ; preds = %48
  br label %50

50:                                               ; preds = %49
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %51

51:                                               ; preds = %50
  br label %52

52:                                               ; preds = %51
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z19gramschmidt_kernel3iiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store i32 %5, ptr %13, align 4
  call void @llvm.lifetime.start.p0(ptr %14)
  br label %15

15:                                               ; preds = %6
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #5
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #5
  %18 = mul i32 %16, %17
  %19 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #5
  %20 = add i32 %18, %19
  store i32 %20, ptr %14, align 4
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %14, align 4
  %23 = load i32, ptr %13, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %29

25:                                               ; preds = %21
  %26 = load i32, ptr %14, align 4
  %27 = load i32, ptr %9, align 4
  %28 = icmp slt i32 %26, %27
  br label %30

29:                                               ; preds = %21
  br label %30

30:                                               ; preds = %25, %29
  %31 = phi i1 [ false, %29 ], [ %28, %25 ]
  br label %32

32:                                               ; preds = %30
  br i1 %31, label %33, label %123

33:                                               ; preds = %32
  %34 = load i32, ptr %13, align 4
  %35 = mul nsw i32 %34, 2048
  %36 = load i32, ptr %14, align 4
  %37 = add nsw i32 %35, %36
  %38 = sext i32 %37 to i64
  %39 = load ptr, ptr %11, align 8
  %40 = getelementptr float, ptr %39, i64 %38
  store float 0.000000e+00, ptr %40, align 4
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %41

41:                                               ; preds = %33
  br label %42

42:                                               ; preds = %41
  store i32 0, ptr %7, align 4
  br label %43

43:                                               ; preds = %76, %42
  %44 = load i32, ptr %7, align 4
  %45 = load i32, ptr %8, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %79

47:                                               ; preds = %43
  br label %48

48:                                               ; preds = %47
  %49 = load i32, ptr %7, align 4
  %50 = mul nsw i32 %49, 2048
  %51 = load i32, ptr %13, align 4
  %52 = add nsw i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = load ptr, ptr %12, align 8
  %55 = getelementptr float, ptr %54, i64 %53
  %56 = load float, ptr %55, align 4
  %57 = load i32, ptr %7, align 4
  %58 = mul nsw i32 %57, 2048
  %59 = load i32, ptr %14, align 4
  %60 = add nsw i32 %58, %59
  %61 = sext i32 %60 to i64
  %62 = load ptr, ptr %10, align 8
  %63 = getelementptr float, ptr %62, i64 %61
  %64 = load float, ptr %63, align 4
  %65 = fmul contract float %56, %64
  %66 = load i32, ptr %13, align 4
  %67 = mul nsw i32 %66, 2048
  %68 = load i32, ptr %14, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %11, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fadd contract float %73, %65
  store float %74, ptr %72, align 4
  br label %75

75:                                               ; preds = %48
  br label %76

76:                                               ; preds = %75
  %77 = load i32, ptr %7, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %7, align 4
  br label %43

79:                                               ; preds = %43
  br label %80

80:                                               ; preds = %79
  br label %81

81:                                               ; preds = %80
  store i32 0, ptr %7, align 4
  br label %82

82:                                               ; preds = %115, %81
  %83 = load i32, ptr %7, align 4
  %84 = load i32, ptr %8, align 4
  %85 = icmp slt i32 %83, %84
  br i1 %85, label %86, label %118

86:                                               ; preds = %82
  br label %87

87:                                               ; preds = %86
  %88 = load i32, ptr %7, align 4
  %89 = mul nsw i32 %88, 2048
  %90 = load i32, ptr %13, align 4
  %91 = add nsw i32 %89, %90
  %92 = sext i32 %91 to i64
  %93 = load ptr, ptr %12, align 8
  %94 = getelementptr float, ptr %93, i64 %92
  %95 = load float, ptr %94, align 4
  %96 = load i32, ptr %13, align 4
  %97 = mul nsw i32 %96, 2048
  %98 = load i32, ptr %14, align 4
  %99 = add nsw i32 %97, %98
  %100 = sext i32 %99 to i64
  %101 = load ptr, ptr %11, align 8
  %102 = getelementptr float, ptr %101, i64 %100
  %103 = load float, ptr %102, align 4
  %104 = fmul contract float %95, %103
  %105 = load i32, ptr %7, align 4
  %106 = mul nsw i32 %105, 2048
  %107 = load i32, ptr %14, align 4
  %108 = add nsw i32 %106, %107
  %109 = sext i32 %108 to i64
  %110 = load ptr, ptr %10, align 8
  %111 = getelementptr float, ptr %110, i64 %109
  %112 = load float, ptr %111, align 4
  %113 = fsub contract float %112, %104
  store float %113, ptr %111, align 4
  br label %114

114:                                              ; preds = %87
  br label %115

115:                                              ; preds = %114
  %116 = load i32, ptr %7, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %7, align 4
  br label %82

118:                                              ; preds = %82
  br label %119

119:                                              ; preds = %118
  br label %120

120:                                              ; preds = %119
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %121

121:                                              ; preds = %120
  br label %122

122:                                              ; preds = %121
  br label %123

123:                                              ; preds = %122, %32
  br label %124

124:                                              ; preds = %123
  br label %125

125:                                              ; preds = %124
  call void @llvm.lifetime.end.p0(ptr %14)
  br label %126

126:                                              ; preds = %125
  br label %127

127:                                              ; preds = %126
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z19gramschmidt_kernel3iiPfS_S_i__noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store i32 %5, ptr %13, align 4
  call void @llvm.lifetime.start.p0(ptr %14)
  br label %15

15:                                               ; preds = %6
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #5
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #5
  %18 = mul i32 %16, %17
  %19 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #5
  %20 = add i32 %18, %19
  store i32 %20, ptr %14, align 4
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %14, align 4
  %23 = load i32, ptr %13, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %29

25:                                               ; preds = %21
  %26 = load i32, ptr %14, align 4
  %27 = load i32, ptr %9, align 4
  %28 = icmp slt i32 %26, %27
  br label %30

29:                                               ; preds = %21
  br label %30

30:                                               ; preds = %25, %29
  %31 = phi i1 [ false, %29 ], [ %28, %25 ]
  br label %32

32:                                               ; preds = %30
  br i1 %31, label %33, label %123

33:                                               ; preds = %32
  %34 = load i32, ptr %13, align 4
  %35 = mul nsw i32 %34, 2048
  %36 = load i32, ptr %14, align 4
  %37 = add nsw i32 %35, %36
  %38 = sext i32 %37 to i64
  %39 = load ptr, ptr %11, align 8
  %40 = getelementptr float, ptr %39, i64 %38
  store float 0.000000e+00, ptr %40, align 4
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %41

41:                                               ; preds = %33
  br label %42

42:                                               ; preds = %41
  store i32 0, ptr %7, align 4
  br label %43

43:                                               ; preds = %76, %42
  %44 = load i32, ptr %7, align 4
  %45 = load i32, ptr %8, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %79

47:                                               ; preds = %43
  br label %48

48:                                               ; preds = %47
  %49 = load i32, ptr %7, align 4
  %50 = mul nsw i32 %49, 2048
  %51 = load i32, ptr %13, align 4
  %52 = add nsw i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = load ptr, ptr %12, align 8
  %55 = getelementptr float, ptr %54, i64 %53
  %56 = load float, ptr %55, align 4
  %57 = load i32, ptr %7, align 4
  %58 = mul nsw i32 %57, 2048
  %59 = load i32, ptr %14, align 4
  %60 = add nsw i32 %58, %59
  %61 = sext i32 %60 to i64
  %62 = load ptr, ptr %10, align 8
  %63 = getelementptr float, ptr %62, i64 %61
  %64 = load float, ptr %63, align 4
  %65 = fmul contract float %56, %64
  %66 = load i32, ptr %13, align 4
  %67 = mul nsw i32 %66, 2048
  %68 = load i32, ptr %14, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %11, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fadd contract float %73, %65
  store float %74, ptr %72, align 4
  br label %75

75:                                               ; preds = %48
  br label %76

76:                                               ; preds = %75
  %77 = load i32, ptr %7, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %7, align 4
  br label %43

79:                                               ; preds = %43
  br label %80

80:                                               ; preds = %79
  br label %81

81:                                               ; preds = %80
  store i32 0, ptr %7, align 4
  br label %82

82:                                               ; preds = %115, %81
  %83 = load i32, ptr %7, align 4
  %84 = load i32, ptr %8, align 4
  %85 = icmp slt i32 %83, %84
  br i1 %85, label %86, label %118

86:                                               ; preds = %82
  br label %87

87:                                               ; preds = %86
  %88 = load i32, ptr %7, align 4
  %89 = mul nsw i32 %88, 2048
  %90 = load i32, ptr %13, align 4
  %91 = add nsw i32 %89, %90
  %92 = sext i32 %91 to i64
  %93 = load ptr, ptr %12, align 8
  %94 = getelementptr float, ptr %93, i64 %92
  %95 = load float, ptr %94, align 4
  %96 = load i32, ptr %13, align 4
  %97 = mul nsw i32 %96, 2048
  %98 = load i32, ptr %14, align 4
  %99 = add nsw i32 %97, %98
  %100 = sext i32 %99 to i64
  %101 = load ptr, ptr %11, align 8
  %102 = getelementptr float, ptr %101, i64 %100
  %103 = load float, ptr %102, align 4
  %104 = fmul contract float %95, %103
  %105 = load i32, ptr %7, align 4
  %106 = mul nsw i32 %105, 2048
  %107 = load i32, ptr %14, align 4
  %108 = add nsw i32 %106, %107
  %109 = sext i32 %108 to i64
  %110 = load ptr, ptr %10, align 8
  %111 = getelementptr float, ptr %110, i64 %109
  %112 = load float, ptr %111, align 4
  %113 = fsub contract float %112, %104
  store float %113, ptr %111, align 4
  br label %114

114:                                              ; preds = %87
  br label %115

115:                                              ; preds = %114
  %116 = load i32, ptr %7, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %7, align 4
  br label %82

118:                                              ; preds = %82
  br label %119

119:                                              ; preds = %118
  br label %120

120:                                              ; preds = %119
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %121

121:                                              ; preds = %120
  br label %122

122:                                              ; preds = %121
  br label %123

123:                                              ; preds = %122, %32
  br label %124

124:                                              ; preds = %123
  br label %125

125:                                              ; preds = %124
  call void @llvm.lifetime.end.p0(ptr %14)
  br label %126

126:                                              ; preds = %125
  br label %127

127:                                              ; preds = %126
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
