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
define dso_local ptx_kernel void @_Z15doitgen_kernel1PfS_S_i(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %12

12:                                               ; preds = %4
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %15 = mul i32 %13, %14
  %16 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %17 = add i32 %15, %16
  store i32 %17, ptr %10, align 4
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %18

18:                                               ; preds = %12
  %19 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %21 = mul i32 %19, %20
  %22 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %23 = add i32 %21, %22
  store i32 %23, ptr %11, align 4
  br label %24

24:                                               ; preds = %18
  %25 = load i32, ptr %10, align 4
  %26 = icmp slt i32 %25, 128
  br i1 %26, label %27, label %30

27:                                               ; preds = %24
  %28 = load i32, ptr %11, align 4
  %29 = icmp slt i32 %28, 128
  br label %31

30:                                               ; preds = %24
  br label %31

31:                                               ; preds = %27, %30
  %32 = phi i1 [ false, %30 ], [ %29, %27 ]
  br label %33

33:                                               ; preds = %31
  br i1 %32, label %34, label %103

34:                                               ; preds = %33
  %35 = load i32, ptr %9, align 4
  %36 = mul nsw i32 %35, 16384
  %37 = load i32, ptr %11, align 4
  %38 = mul nsw i32 %37, 128
  %39 = add nsw i32 %36, %38
  %40 = load i32, ptr %10, align 4
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = load ptr, ptr %6, align 8
  %44 = getelementptr float, ptr %43, i64 %42
  store float 0.000000e+00, ptr %44, align 4
  br label %45

45:                                               ; preds = %34
  call void @llvm.lifetime.start.p0(ptr %5)
  br label %46

46:                                               ; preds = %45
  store i32 0, ptr %5, align 4
  br label %47

47:                                               ; preds = %95, %46
  %48 = load i32, ptr %5, align 4
  %49 = icmp slt i32 %48, 128
  br i1 %49, label %50, label %98

50:                                               ; preds = %47
  br label %51

51:                                               ; preds = %50
  %52 = load i32, ptr %9, align 4
  %53 = mul nsw i32 %52, 16384
  %54 = load i32, ptr %11, align 4
  %55 = mul nsw i32 %54, 128
  %56 = add nsw i32 %53, %55
  %57 = load i32, ptr %10, align 4
  %58 = add nsw i32 %56, %57
  %59 = sext i32 %58 to i64
  %60 = load ptr, ptr %6, align 8
  %61 = getelementptr float, ptr %60, i64 %59
  %62 = load float, ptr %61, align 4
  %63 = load i32, ptr %9, align 4
  %64 = mul nsw i32 %63, 16384
  %65 = load i32, ptr %11, align 4
  %66 = mul nsw i32 %65, 128
  %67 = add nsw i32 %64, %66
  %68 = load i32, ptr %5, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %7, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = load i32, ptr %5, align 4
  %75 = mul nsw i32 %74, 128
  %76 = load i32, ptr %10, align 4
  %77 = add nsw i32 %75, %76
  %78 = sext i32 %77 to i64
  %79 = load ptr, ptr %8, align 8
  %80 = getelementptr float, ptr %79, i64 %78
  %81 = load float, ptr %80, align 4
  %82 = fmul contract float %73, %81
  %83 = fadd contract float %62, %82
  %84 = load i32, ptr %9, align 4
  %85 = mul nsw i32 %84, 16384
  %86 = load i32, ptr %11, align 4
  %87 = mul nsw i32 %86, 128
  %88 = add nsw i32 %85, %87
  %89 = load i32, ptr %10, align 4
  %90 = add nsw i32 %88, %89
  %91 = sext i32 %90 to i64
  %92 = load ptr, ptr %6, align 8
  %93 = getelementptr float, ptr %92, i64 %91
  store float %83, ptr %93, align 4
  br label %94

94:                                               ; preds = %51
  br label %95

95:                                               ; preds = %94
  %96 = load i32, ptr %5, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %5, align 4
  br label %47

98:                                               ; preds = %47
  br label %99

99:                                               ; preds = %98
  call void @llvm.lifetime.end.p0(ptr %5)
  br label %100

100:                                              ; preds = %99
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
  br label %103

103:                                              ; preds = %102, %33
  br label %104

104:                                              ; preds = %103
  br label %105

105:                                              ; preds = %104
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %106

106:                                              ; preds = %105
  br label %107

107:                                              ; preds = %106
  br label %108

108:                                              ; preds = %107
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %109

109:                                              ; preds = %108
  br label %110

110:                                              ; preds = %109
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z15doitgen_kernel1PfS_S_i__noalias(ptr noalias noundef %0, ptr noalias noundef %1, ptr noalias noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %12

12:                                               ; preds = %4
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %15 = mul i32 %13, %14
  %16 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %17 = add i32 %15, %16
  store i32 %17, ptr %10, align 4
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %18

18:                                               ; preds = %12
  %19 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %21 = mul i32 %19, %20
  %22 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %23 = add i32 %21, %22
  store i32 %23, ptr %11, align 4
  br label %24

24:                                               ; preds = %18
  %25 = load i32, ptr %10, align 4
  %26 = icmp slt i32 %25, 128
  br i1 %26, label %27, label %30

27:                                               ; preds = %24
  %28 = load i32, ptr %11, align 4
  %29 = icmp slt i32 %28, 128
  br label %31

30:                                               ; preds = %24
  br label %31

31:                                               ; preds = %27, %30
  %32 = phi i1 [ false, %30 ], [ %29, %27 ]
  br label %33

33:                                               ; preds = %31
  br i1 %32, label %34, label %103

34:                                               ; preds = %33
  %35 = load i32, ptr %9, align 4
  %36 = mul nsw i32 %35, 16384
  %37 = load i32, ptr %11, align 4
  %38 = mul nsw i32 %37, 128
  %39 = add nsw i32 %36, %38
  %40 = load i32, ptr %10, align 4
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = load ptr, ptr %6, align 8
  %44 = getelementptr float, ptr %43, i64 %42
  store float 0.000000e+00, ptr %44, align 4
  br label %45

45:                                               ; preds = %34
  call void @llvm.lifetime.start.p0(ptr %5)
  br label %46

46:                                               ; preds = %45
  store i32 0, ptr %5, align 4
  br label %47

47:                                               ; preds = %95, %46
  %48 = load i32, ptr %5, align 4
  %49 = icmp slt i32 %48, 128
  br i1 %49, label %50, label %98

50:                                               ; preds = %47
  br label %51

51:                                               ; preds = %50
  %52 = load i32, ptr %9, align 4
  %53 = mul nsw i32 %52, 16384
  %54 = load i32, ptr %11, align 4
  %55 = mul nsw i32 %54, 128
  %56 = add nsw i32 %53, %55
  %57 = load i32, ptr %10, align 4
  %58 = add nsw i32 %56, %57
  %59 = sext i32 %58 to i64
  %60 = load ptr, ptr %6, align 8
  %61 = getelementptr float, ptr %60, i64 %59
  %62 = load float, ptr %61, align 4
  %63 = load i32, ptr %9, align 4
  %64 = mul nsw i32 %63, 16384
  %65 = load i32, ptr %11, align 4
  %66 = mul nsw i32 %65, 128
  %67 = add nsw i32 %64, %66
  %68 = load i32, ptr %5, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %7, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = load i32, ptr %5, align 4
  %75 = mul nsw i32 %74, 128
  %76 = load i32, ptr %10, align 4
  %77 = add nsw i32 %75, %76
  %78 = sext i32 %77 to i64
  %79 = load ptr, ptr %8, align 8
  %80 = getelementptr float, ptr %79, i64 %78
  %81 = load float, ptr %80, align 4
  %82 = fmul contract float %73, %81
  %83 = fadd contract float %62, %82
  %84 = load i32, ptr %9, align 4
  %85 = mul nsw i32 %84, 16384
  %86 = load i32, ptr %11, align 4
  %87 = mul nsw i32 %86, 128
  %88 = add nsw i32 %85, %87
  %89 = load i32, ptr %10, align 4
  %90 = add nsw i32 %88, %89
  %91 = sext i32 %90 to i64
  %92 = load ptr, ptr %6, align 8
  %93 = getelementptr float, ptr %92, i64 %91
  store float %83, ptr %93, align 4
  br label %94

94:                                               ; preds = %51
  br label %95

95:                                               ; preds = %94
  %96 = load i32, ptr %5, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %5, align 4
  br label %47

98:                                               ; preds = %47
  br label %99

99:                                               ; preds = %98
  call void @llvm.lifetime.end.p0(ptr %5)
  br label %100

100:                                              ; preds = %99
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
  br label %103

103:                                              ; preds = %102, %33
  br label %104

104:                                              ; preds = %103
  br label %105

105:                                              ; preds = %104
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %106

106:                                              ; preds = %105
  br label %107

107:                                              ; preds = %106
  br label %108

108:                                              ; preds = %107
  call void @llvm.lifetime.end.p0(ptr %10)
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
define dso_local ptx_kernel void @_Z15doitgen_kernel2PfS_S_i(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %3, ptr %7, align 4
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %10

10:                                               ; preds = %4
  %11 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %12 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %13 = mul i32 %11, %12
  %14 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %15 = add i32 %13, %14
  store i32 %15, ptr %8, align 4
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %16

16:                                               ; preds = %10
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %18 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %19 = mul i32 %17, %18
  %20 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %21 = add i32 %19, %20
  store i32 %21, ptr %9, align 4
  br label %22

22:                                               ; preds = %16
  %23 = load i32, ptr %8, align 4
  %24 = icmp slt i32 %23, 128
  br i1 %24, label %25, label %28

25:                                               ; preds = %22
  %26 = load i32, ptr %9, align 4
  %27 = icmp slt i32 %26, 128
  br label %29

28:                                               ; preds = %22
  br label %29

29:                                               ; preds = %25, %28
  %30 = phi i1 [ false, %28 ], [ %27, %25 ]
  br label %31

31:                                               ; preds = %29
  br i1 %30, label %32, label %54

32:                                               ; preds = %31
  %33 = load i32, ptr %7, align 4
  %34 = mul nsw i32 %33, 16384
  %35 = load i32, ptr %9, align 4
  %36 = mul nsw i32 %35, 128
  %37 = add nsw i32 %34, %36
  %38 = load i32, ptr %8, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr float, ptr %41, i64 %40
  %43 = load float, ptr %42, align 4
  %44 = load i32, ptr %7, align 4
  %45 = mul nsw i32 %44, 16384
  %46 = load i32, ptr %9, align 4
  %47 = mul nsw i32 %46, 128
  %48 = add nsw i32 %45, %47
  %49 = load i32, ptr %8, align 4
  %50 = add nsw i32 %48, %49
  %51 = sext i32 %50 to i64
  %52 = load ptr, ptr %6, align 8
  %53 = getelementptr float, ptr %52, i64 %51
  store float %43, ptr %53, align 4
  br label %54

54:                                               ; preds = %32, %31
  br label %55

55:                                               ; preds = %54
  br label %56

56:                                               ; preds = %55
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %57

57:                                               ; preds = %56
  br label %58

58:                                               ; preds = %57
  br label %59

59:                                               ; preds = %58
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %60

60:                                               ; preds = %59
  br label %61

61:                                               ; preds = %60
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z15doitgen_kernel2PfS_S_i__noalias(ptr noalias noundef %0, ptr noalias noundef %1, ptr noalias noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %3, ptr %7, align 4
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %10

10:                                               ; preds = %4
  %11 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %12 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %13 = mul i32 %11, %12
  %14 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %15 = add i32 %13, %14
  store i32 %15, ptr %8, align 4
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %16

16:                                               ; preds = %10
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %18 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %19 = mul i32 %17, %18
  %20 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %21 = add i32 %19, %20
  store i32 %21, ptr %9, align 4
  br label %22

22:                                               ; preds = %16
  %23 = load i32, ptr %8, align 4
  %24 = icmp slt i32 %23, 128
  br i1 %24, label %25, label %28

25:                                               ; preds = %22
  %26 = load i32, ptr %9, align 4
  %27 = icmp slt i32 %26, 128
  br label %29

28:                                               ; preds = %22
  br label %29

29:                                               ; preds = %25, %28
  %30 = phi i1 [ false, %28 ], [ %27, %25 ]
  br label %31

31:                                               ; preds = %29
  br i1 %30, label %32, label %54

32:                                               ; preds = %31
  %33 = load i32, ptr %7, align 4
  %34 = mul nsw i32 %33, 16384
  %35 = load i32, ptr %9, align 4
  %36 = mul nsw i32 %35, 128
  %37 = add nsw i32 %34, %36
  %38 = load i32, ptr %8, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr float, ptr %41, i64 %40
  %43 = load float, ptr %42, align 4
  %44 = load i32, ptr %7, align 4
  %45 = mul nsw i32 %44, 16384
  %46 = load i32, ptr %9, align 4
  %47 = mul nsw i32 %46, 128
  %48 = add nsw i32 %45, %47
  %49 = load i32, ptr %8, align 4
  %50 = add nsw i32 %48, %49
  %51 = sext i32 %50 to i64
  %52 = load ptr, ptr %6, align 8
  %53 = getelementptr float, ptr %52, i64 %51
  store float %43, ptr %53, align 4
  br label %54

54:                                               ; preds = %32, %31
  br label %55

55:                                               ; preds = %54
  br label %56

56:                                               ; preds = %55
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %57

57:                                               ; preds = %56
  br label %58

58:                                               ; preds = %57
  br label %59

59:                                               ; preds = %58
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %60

60:                                               ; preds = %59
  br label %61

61:                                               ; preds = %60
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
