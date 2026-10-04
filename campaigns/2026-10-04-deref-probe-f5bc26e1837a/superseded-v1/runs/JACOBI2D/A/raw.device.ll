; ModuleID = 'device_cuda_nvptx64_nvidia_cuda__sm_86'
source_filename = "device_cuda_nvptx64_nvidia_cuda__sm_86"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

@blockIdx = extern_weak dso_local addrspace(1) constant %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak dso_local addrspace(1) constant %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak dso_local addrspace(1) constant %struct.__cuda_builtin_threadIdx_t, align 1

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel1iPfS_(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %9

9:                                                ; preds = %3
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %11 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %12 = mul i32 %10, %11
  %13 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %14 = add i32 %12, %13
  store i32 %14, ptr %7, align 4
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %15

15:                                               ; preds = %9
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %18 = mul i32 %16, %17
  %19 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %20 = add i32 %18, %19
  store i32 %20, ptr %8, align 4
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %7, align 4
  %23 = icmp sge i32 %22, 1
  br i1 %23, label %24, label %29

24:                                               ; preds = %21
  %25 = load i32, ptr %7, align 4
  %26 = load i32, ptr %4, align 4
  %27 = sub nsw i32 %26, 1
  %28 = icmp slt i32 %25, %27
  br label %30

29:                                               ; preds = %21
  br label %30

30:                                               ; preds = %24, %29
  %31 = phi i1 [ false, %29 ], [ %28, %24 ]
  br label %32

32:                                               ; preds = %30
  br i1 %31, label %33, label %36

33:                                               ; preds = %32
  %34 = load i32, ptr %8, align 4
  %35 = icmp sge i32 %34, 1
  br label %37

36:                                               ; preds = %32
  br label %37

37:                                               ; preds = %33, %36
  %38 = phi i1 [ false, %36 ], [ %35, %33 ]
  br label %39

39:                                               ; preds = %37
  br i1 %38, label %40, label %45

40:                                               ; preds = %39
  %41 = load i32, ptr %8, align 4
  %42 = load i32, ptr %4, align 4
  %43 = sub nsw i32 %42, 1
  %44 = icmp slt i32 %41, %43
  br label %46

45:                                               ; preds = %39
  br label %46

46:                                               ; preds = %40, %45
  %47 = phi i1 [ false, %45 ], [ %44, %40 ]
  br label %48

48:                                               ; preds = %46
  br i1 %47, label %49, label %106

49:                                               ; preds = %48
  %50 = load i32, ptr %7, align 4
  %51 = mul nsw i32 %50, 1000
  %52 = load i32, ptr %8, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = load i32, ptr %7, align 4
  %59 = mul nsw i32 %58, 1000
  %60 = load i32, ptr %8, align 4
  %61 = sub nsw i32 %60, 1
  %62 = add nsw i32 %59, %61
  %63 = sext i32 %62 to i64
  %64 = load ptr, ptr %5, align 8
  %65 = getelementptr float, ptr %64, i64 %63
  %66 = load float, ptr %65, align 4
  %67 = fadd contract float %57, %66
  %68 = load i32, ptr %7, align 4
  %69 = mul nsw i32 %68, 1000
  %70 = load i32, ptr %8, align 4
  %71 = add nsw i32 1, %70
  %72 = add nsw i32 %69, %71
  %73 = sext i32 %72 to i64
  %74 = load ptr, ptr %5, align 8
  %75 = getelementptr float, ptr %74, i64 %73
  %76 = load float, ptr %75, align 4
  %77 = fadd contract float %67, %76
  %78 = load i32, ptr %7, align 4
  %79 = add nsw i32 1, %78
  %80 = mul nsw i32 %79, 1000
  %81 = load i32, ptr %8, align 4
  %82 = add nsw i32 %80, %81
  %83 = sext i32 %82 to i64
  %84 = load ptr, ptr %5, align 8
  %85 = getelementptr float, ptr %84, i64 %83
  %86 = load float, ptr %85, align 4
  %87 = fadd contract float %77, %86
  %88 = load i32, ptr %7, align 4
  %89 = sub nsw i32 %88, 1
  %90 = mul nsw i32 %89, 1000
  %91 = load i32, ptr %8, align 4
  %92 = add nsw i32 %90, %91
  %93 = sext i32 %92 to i64
  %94 = load ptr, ptr %5, align 8
  %95 = getelementptr float, ptr %94, i64 %93
  %96 = load float, ptr %95, align 4
  %97 = fadd contract float %87, %96
  %98 = fmul contract float 2.000000e-01, %97
  %99 = load i32, ptr %7, align 4
  %100 = mul nsw i32 %99, 1000
  %101 = load i32, ptr %8, align 4
  %102 = add nsw i32 %100, %101
  %103 = sext i32 %102 to i64
  %104 = load ptr, ptr %6, align 8
  %105 = getelementptr float, ptr %104, i64 %103
  store float %98, ptr %105, align 4
  br label %106

106:                                              ; preds = %49, %48
  br label %107

107:                                              ; preds = %106
  br label %108

108:                                              ; preds = %107
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %109

109:                                              ; preds = %108
  br label %110

110:                                              ; preds = %109
  br label %111

111:                                              ; preds = %110
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %112

112:                                              ; preds = %111
  br label %113

113:                                              ; preds = %112
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel1iPfS___noalias(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %9

9:                                                ; preds = %3
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %11 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %12 = mul i32 %10, %11
  %13 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %14 = add i32 %12, %13
  store i32 %14, ptr %7, align 4
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %15

15:                                               ; preds = %9
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %18 = mul i32 %16, %17
  %19 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %20 = add i32 %18, %19
  store i32 %20, ptr %8, align 4
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %7, align 4
  %23 = icmp sge i32 %22, 1
  br i1 %23, label %24, label %29

24:                                               ; preds = %21
  %25 = load i32, ptr %7, align 4
  %26 = load i32, ptr %4, align 4
  %27 = sub nsw i32 %26, 1
  %28 = icmp slt i32 %25, %27
  br label %30

29:                                               ; preds = %21
  br label %30

30:                                               ; preds = %24, %29
  %31 = phi i1 [ false, %29 ], [ %28, %24 ]
  br label %32

32:                                               ; preds = %30
  br i1 %31, label %33, label %36

33:                                               ; preds = %32
  %34 = load i32, ptr %8, align 4
  %35 = icmp sge i32 %34, 1
  br label %37

36:                                               ; preds = %32
  br label %37

37:                                               ; preds = %33, %36
  %38 = phi i1 [ false, %36 ], [ %35, %33 ]
  br label %39

39:                                               ; preds = %37
  br i1 %38, label %40, label %45

40:                                               ; preds = %39
  %41 = load i32, ptr %8, align 4
  %42 = load i32, ptr %4, align 4
  %43 = sub nsw i32 %42, 1
  %44 = icmp slt i32 %41, %43
  br label %46

45:                                               ; preds = %39
  br label %46

46:                                               ; preds = %40, %45
  %47 = phi i1 [ false, %45 ], [ %44, %40 ]
  br label %48

48:                                               ; preds = %46
  br i1 %47, label %49, label %106

49:                                               ; preds = %48
  %50 = load i32, ptr %7, align 4
  %51 = mul nsw i32 %50, 1000
  %52 = load i32, ptr %8, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = load i32, ptr %7, align 4
  %59 = mul nsw i32 %58, 1000
  %60 = load i32, ptr %8, align 4
  %61 = sub nsw i32 %60, 1
  %62 = add nsw i32 %59, %61
  %63 = sext i32 %62 to i64
  %64 = load ptr, ptr %5, align 8
  %65 = getelementptr float, ptr %64, i64 %63
  %66 = load float, ptr %65, align 4
  %67 = fadd contract float %57, %66
  %68 = load i32, ptr %7, align 4
  %69 = mul nsw i32 %68, 1000
  %70 = load i32, ptr %8, align 4
  %71 = add nsw i32 1, %70
  %72 = add nsw i32 %69, %71
  %73 = sext i32 %72 to i64
  %74 = load ptr, ptr %5, align 8
  %75 = getelementptr float, ptr %74, i64 %73
  %76 = load float, ptr %75, align 4
  %77 = fadd contract float %67, %76
  %78 = load i32, ptr %7, align 4
  %79 = add nsw i32 1, %78
  %80 = mul nsw i32 %79, 1000
  %81 = load i32, ptr %8, align 4
  %82 = add nsw i32 %80, %81
  %83 = sext i32 %82 to i64
  %84 = load ptr, ptr %5, align 8
  %85 = getelementptr float, ptr %84, i64 %83
  %86 = load float, ptr %85, align 4
  %87 = fadd contract float %77, %86
  %88 = load i32, ptr %7, align 4
  %89 = sub nsw i32 %88, 1
  %90 = mul nsw i32 %89, 1000
  %91 = load i32, ptr %8, align 4
  %92 = add nsw i32 %90, %91
  %93 = sext i32 %92 to i64
  %94 = load ptr, ptr %5, align 8
  %95 = getelementptr float, ptr %94, i64 %93
  %96 = load float, ptr %95, align 4
  %97 = fadd contract float %87, %96
  %98 = fmul contract float 2.000000e-01, %97
  %99 = load i32, ptr %7, align 4
  %100 = mul nsw i32 %99, 1000
  %101 = load i32, ptr %8, align 4
  %102 = add nsw i32 %100, %101
  %103 = sext i32 %102 to i64
  %104 = load ptr, ptr %6, align 8
  %105 = getelementptr float, ptr %104, i64 %103
  store float %98, ptr %105, align 4
  br label %106

106:                                              ; preds = %49, %48
  br label %107

107:                                              ; preds = %106
  br label %108

108:                                              ; preds = %107
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %109

109:                                              ; preds = %108
  br label %110

110:                                              ; preds = %109
  br label %111

111:                                              ; preds = %110
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %112

112:                                              ; preds = %111
  br label %113

113:                                              ; preds = %112
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
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel2iPfS_(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %9

9:                                                ; preds = %3
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %11 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %12 = mul i32 %10, %11
  %13 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %14 = add i32 %12, %13
  store i32 %14, ptr %7, align 4
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %15

15:                                               ; preds = %9
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %18 = mul i32 %16, %17
  %19 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %20 = add i32 %18, %19
  store i32 %20, ptr %8, align 4
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %7, align 4
  %23 = icmp sge i32 %22, 1
  br i1 %23, label %24, label %29

24:                                               ; preds = %21
  %25 = load i32, ptr %7, align 4
  %26 = load i32, ptr %4, align 4
  %27 = sub nsw i32 %26, 1
  %28 = icmp slt i32 %25, %27
  br label %30

29:                                               ; preds = %21
  br label %30

30:                                               ; preds = %24, %29
  %31 = phi i1 [ false, %29 ], [ %28, %24 ]
  br label %32

32:                                               ; preds = %30
  br i1 %31, label %33, label %36

33:                                               ; preds = %32
  %34 = load i32, ptr %8, align 4
  %35 = icmp sge i32 %34, 1
  br label %37

36:                                               ; preds = %32
  br label %37

37:                                               ; preds = %33, %36
  %38 = phi i1 [ false, %36 ], [ %35, %33 ]
  br label %39

39:                                               ; preds = %37
  br i1 %38, label %40, label %45

40:                                               ; preds = %39
  %41 = load i32, ptr %8, align 4
  %42 = load i32, ptr %4, align 4
  %43 = sub nsw i32 %42, 1
  %44 = icmp slt i32 %41, %43
  br label %46

45:                                               ; preds = %39
  br label %46

46:                                               ; preds = %40, %45
  %47 = phi i1 [ false, %45 ], [ %44, %40 ]
  br label %48

48:                                               ; preds = %46
  br i1 %47, label %49, label %65

49:                                               ; preds = %48
  %50 = load i32, ptr %7, align 4
  %51 = mul nsw i32 %50, 1000
  %52 = load i32, ptr %8, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %6, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = load i32, ptr %7, align 4
  %59 = mul nsw i32 %58, 1000
  %60 = load i32, ptr %8, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %5, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  store float %57, ptr %64, align 4
  br label %65

65:                                               ; preds = %49, %48
  br label %66

66:                                               ; preds = %65
  br label %67

67:                                               ; preds = %66
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
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel2iPfS___noalias(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %9

9:                                                ; preds = %3
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %11 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %12 = mul i32 %10, %11
  %13 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %14 = add i32 %12, %13
  store i32 %14, ptr %7, align 4
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %15

15:                                               ; preds = %9
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %18 = mul i32 %16, %17
  %19 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %20 = add i32 %18, %19
  store i32 %20, ptr %8, align 4
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %7, align 4
  %23 = icmp sge i32 %22, 1
  br i1 %23, label %24, label %29

24:                                               ; preds = %21
  %25 = load i32, ptr %7, align 4
  %26 = load i32, ptr %4, align 4
  %27 = sub nsw i32 %26, 1
  %28 = icmp slt i32 %25, %27
  br label %30

29:                                               ; preds = %21
  br label %30

30:                                               ; preds = %24, %29
  %31 = phi i1 [ false, %29 ], [ %28, %24 ]
  br label %32

32:                                               ; preds = %30
  br i1 %31, label %33, label %36

33:                                               ; preds = %32
  %34 = load i32, ptr %8, align 4
  %35 = icmp sge i32 %34, 1
  br label %37

36:                                               ; preds = %32
  br label %37

37:                                               ; preds = %33, %36
  %38 = phi i1 [ false, %36 ], [ %35, %33 ]
  br label %39

39:                                               ; preds = %37
  br i1 %38, label %40, label %45

40:                                               ; preds = %39
  %41 = load i32, ptr %8, align 4
  %42 = load i32, ptr %4, align 4
  %43 = sub nsw i32 %42, 1
  %44 = icmp slt i32 %41, %43
  br label %46

45:                                               ; preds = %39
  br label %46

46:                                               ; preds = %40, %45
  %47 = phi i1 [ false, %45 ], [ %44, %40 ]
  br label %48

48:                                               ; preds = %46
  br i1 %47, label %49, label %65

49:                                               ; preds = %48
  %50 = load i32, ptr %7, align 4
  %51 = mul nsw i32 %50, 1000
  %52 = load i32, ptr %8, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %6, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = load i32, ptr %7, align 4
  %59 = mul nsw i32 %58, 1000
  %60 = load i32, ptr %8, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %5, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  store float %57, ptr %64, align 4
  br label %65

65:                                               ; preds = %49, %48
  br label %66

66:                                               ; preds = %65
  br label %67

67:                                               ; preds = %66
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
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #3

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
