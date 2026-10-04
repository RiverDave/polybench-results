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
define dso_local ptx_kernel void @_Z11adi_kernel1iPfS_S_(i32 noundef %0, ptr noundef dereferenceable(4194304) %1, ptr noundef dereferenceable(4194304) %2, ptr noundef dereferenceable(4194304) %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %11

11:                                               ; preds = %4
  %12 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %14 = mul i32 %12, %13
  %15 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %16 = add i32 %14, %15
  store i32 %16, ptr %10, align 4
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %10, align 4
  %19 = load i32, ptr %6, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %126

21:                                               ; preds = %17
  br label %22

22:                                               ; preds = %21
  call void @llvm.lifetime.start.p0(ptr %5)
  br label %23

23:                                               ; preds = %22
  store i32 1, ptr %5, align 4
  br label %24

24:                                               ; preds = %118, %23
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %121

28:                                               ; preds = %24
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %10, align 4
  %31 = mul nsw i32 %30, 1024
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = load ptr, ptr %9, align 8
  %36 = getelementptr float, ptr %35, i64 %34
  %37 = load float, ptr %36, align 4
  %38 = load i32, ptr %10, align 4
  %39 = mul nsw i32 %38, 1024
  %40 = load i32, ptr %5, align 4
  %41 = sub nsw i32 %40, 1
  %42 = add nsw i32 %39, %41
  %43 = sext i32 %42 to i64
  %44 = load ptr, ptr %9, align 8
  %45 = getelementptr float, ptr %44, i64 %43
  %46 = load float, ptr %45, align 4
  %47 = load i32, ptr %10, align 4
  %48 = mul nsw i32 %47, 1024
  %49 = load i32, ptr %5, align 4
  %50 = add nsw i32 %48, %49
  %51 = sext i32 %50 to i64
  %52 = load ptr, ptr %7, align 8
  %53 = getelementptr float, ptr %52, i64 %51
  %54 = load float, ptr %53, align 4
  %55 = fmul contract float %46, %54
  %56 = load i32, ptr %10, align 4
  %57 = mul nsw i32 %56, 1024
  %58 = load i32, ptr %5, align 4
  %59 = sub nsw i32 %58, 1
  %60 = add nsw i32 %57, %59
  %61 = sext i32 %60 to i64
  %62 = load ptr, ptr %8, align 8
  %63 = getelementptr float, ptr %62, i64 %61
  %64 = load float, ptr %63, align 4
  %65 = fdiv contract float %55, %64
  %66 = fsub contract float %37, %65
  %67 = load i32, ptr %10, align 4
  %68 = mul nsw i32 %67, 1024
  %69 = load i32, ptr %5, align 4
  %70 = add nsw i32 %68, %69
  %71 = sext i32 %70 to i64
  %72 = load ptr, ptr %9, align 8
  %73 = getelementptr float, ptr %72, i64 %71
  store float %66, ptr %73, align 4
  %74 = load i32, ptr %10, align 4
  %75 = mul nsw i32 %74, 1024
  %76 = load i32, ptr %5, align 4
  %77 = add nsw i32 %75, %76
  %78 = sext i32 %77 to i64
  %79 = load ptr, ptr %8, align 8
  %80 = getelementptr float, ptr %79, i64 %78
  %81 = load float, ptr %80, align 4
  %82 = load i32, ptr %10, align 4
  %83 = mul nsw i32 %82, 1024
  %84 = load i32, ptr %5, align 4
  %85 = add nsw i32 %83, %84
  %86 = sext i32 %85 to i64
  %87 = load ptr, ptr %7, align 8
  %88 = getelementptr float, ptr %87, i64 %86
  %89 = load float, ptr %88, align 4
  %90 = load i32, ptr %10, align 4
  %91 = mul nsw i32 %90, 1024
  %92 = load i32, ptr %5, align 4
  %93 = add nsw i32 %91, %92
  %94 = sext i32 %93 to i64
  %95 = load ptr, ptr %7, align 8
  %96 = getelementptr float, ptr %95, i64 %94
  %97 = load float, ptr %96, align 4
  %98 = fmul contract float %89, %97
  %99 = load i32, ptr %10, align 4
  %100 = mul nsw i32 %99, 1024
  %101 = load i32, ptr %5, align 4
  %102 = sub nsw i32 %101, 1
  %103 = add nsw i32 %100, %102
  %104 = sext i32 %103 to i64
  %105 = load ptr, ptr %8, align 8
  %106 = getelementptr float, ptr %105, i64 %104
  %107 = load float, ptr %106, align 4
  %108 = fdiv contract float %98, %107
  %109 = fsub contract float %81, %108
  %110 = load i32, ptr %10, align 4
  %111 = mul nsw i32 %110, 1024
  %112 = load i32, ptr %5, align 4
  %113 = add nsw i32 %111, %112
  %114 = sext i32 %113 to i64
  %115 = load ptr, ptr %8, align 8
  %116 = getelementptr float, ptr %115, i64 %114
  store float %109, ptr %116, align 4
  br label %117

117:                                              ; preds = %29
  br label %118

118:                                              ; preds = %117
  %119 = load i32, ptr %5, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, ptr %5, align 4
  br label %24

121:                                              ; preds = %24
  br label %122

122:                                              ; preds = %121
  call void @llvm.lifetime.end.p0(ptr %5)
  br label %123

123:                                              ; preds = %122
  br label %124

124:                                              ; preds = %123
  br label %125

125:                                              ; preds = %124
  br label %126

126:                                              ; preds = %125, %17
  br label %127

127:                                              ; preds = %126
  br label %128

128:                                              ; preds = %127
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %129

129:                                              ; preds = %128
  br label %130

130:                                              ; preds = %129
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11adi_kernel1iPfS_S___noalias(i32 noundef %0, ptr noalias noundef dereferenceable(4194304) %1, ptr noalias noundef dereferenceable(4194304) %2, ptr noalias noundef dereferenceable(4194304) %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %11

11:                                               ; preds = %4
  %12 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %14 = mul i32 %12, %13
  %15 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %16 = add i32 %14, %15
  store i32 %16, ptr %10, align 4
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %10, align 4
  %19 = load i32, ptr %6, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %126

21:                                               ; preds = %17
  br label %22

22:                                               ; preds = %21
  call void @llvm.lifetime.start.p0(ptr %5)
  br label %23

23:                                               ; preds = %22
  store i32 1, ptr %5, align 4
  br label %24

24:                                               ; preds = %118, %23
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %121

28:                                               ; preds = %24
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %10, align 4
  %31 = mul nsw i32 %30, 1024
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = load ptr, ptr %9, align 8
  %36 = getelementptr float, ptr %35, i64 %34
  %37 = load float, ptr %36, align 4
  %38 = load i32, ptr %10, align 4
  %39 = mul nsw i32 %38, 1024
  %40 = load i32, ptr %5, align 4
  %41 = sub nsw i32 %40, 1
  %42 = add nsw i32 %39, %41
  %43 = sext i32 %42 to i64
  %44 = load ptr, ptr %9, align 8
  %45 = getelementptr float, ptr %44, i64 %43
  %46 = load float, ptr %45, align 4
  %47 = load i32, ptr %10, align 4
  %48 = mul nsw i32 %47, 1024
  %49 = load i32, ptr %5, align 4
  %50 = add nsw i32 %48, %49
  %51 = sext i32 %50 to i64
  %52 = load ptr, ptr %7, align 8
  %53 = getelementptr float, ptr %52, i64 %51
  %54 = load float, ptr %53, align 4
  %55 = fmul contract float %46, %54
  %56 = load i32, ptr %10, align 4
  %57 = mul nsw i32 %56, 1024
  %58 = load i32, ptr %5, align 4
  %59 = sub nsw i32 %58, 1
  %60 = add nsw i32 %57, %59
  %61 = sext i32 %60 to i64
  %62 = load ptr, ptr %8, align 8
  %63 = getelementptr float, ptr %62, i64 %61
  %64 = load float, ptr %63, align 4
  %65 = fdiv contract float %55, %64
  %66 = fsub contract float %37, %65
  %67 = load i32, ptr %10, align 4
  %68 = mul nsw i32 %67, 1024
  %69 = load i32, ptr %5, align 4
  %70 = add nsw i32 %68, %69
  %71 = sext i32 %70 to i64
  %72 = load ptr, ptr %9, align 8
  %73 = getelementptr float, ptr %72, i64 %71
  store float %66, ptr %73, align 4
  %74 = load i32, ptr %10, align 4
  %75 = mul nsw i32 %74, 1024
  %76 = load i32, ptr %5, align 4
  %77 = add nsw i32 %75, %76
  %78 = sext i32 %77 to i64
  %79 = load ptr, ptr %8, align 8
  %80 = getelementptr float, ptr %79, i64 %78
  %81 = load float, ptr %80, align 4
  %82 = load i32, ptr %10, align 4
  %83 = mul nsw i32 %82, 1024
  %84 = load i32, ptr %5, align 4
  %85 = add nsw i32 %83, %84
  %86 = sext i32 %85 to i64
  %87 = load ptr, ptr %7, align 8
  %88 = getelementptr float, ptr %87, i64 %86
  %89 = load float, ptr %88, align 4
  %90 = load i32, ptr %10, align 4
  %91 = mul nsw i32 %90, 1024
  %92 = load i32, ptr %5, align 4
  %93 = add nsw i32 %91, %92
  %94 = sext i32 %93 to i64
  %95 = load ptr, ptr %7, align 8
  %96 = getelementptr float, ptr %95, i64 %94
  %97 = load float, ptr %96, align 4
  %98 = fmul contract float %89, %97
  %99 = load i32, ptr %10, align 4
  %100 = mul nsw i32 %99, 1024
  %101 = load i32, ptr %5, align 4
  %102 = sub nsw i32 %101, 1
  %103 = add nsw i32 %100, %102
  %104 = sext i32 %103 to i64
  %105 = load ptr, ptr %8, align 8
  %106 = getelementptr float, ptr %105, i64 %104
  %107 = load float, ptr %106, align 4
  %108 = fdiv contract float %98, %107
  %109 = fsub contract float %81, %108
  %110 = load i32, ptr %10, align 4
  %111 = mul nsw i32 %110, 1024
  %112 = load i32, ptr %5, align 4
  %113 = add nsw i32 %111, %112
  %114 = sext i32 %113 to i64
  %115 = load ptr, ptr %8, align 8
  %116 = getelementptr float, ptr %115, i64 %114
  store float %109, ptr %116, align 4
  br label %117

117:                                              ; preds = %29
  br label %118

118:                                              ; preds = %117
  %119 = load i32, ptr %5, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, ptr %5, align 4
  br label %24

121:                                              ; preds = %24
  br label %122

122:                                              ; preds = %121
  call void @llvm.lifetime.end.p0(ptr %5)
  br label %123

123:                                              ; preds = %122
  br label %124

124:                                              ; preds = %123
  br label %125

125:                                              ; preds = %124
  br label %126

126:                                              ; preds = %125, %17
  br label %127

127:                                              ; preds = %126
  br label %128

128:                                              ; preds = %127
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %129

129:                                              ; preds = %128
  br label %130

130:                                              ; preds = %129
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
define dso_local ptx_kernel void @_Z11adi_kernel2iPfS_S_(i32 noundef %0, ptr noundef dereferenceable(4194304) %1, ptr noundef dereferenceable(4194304) %2, ptr noundef dereferenceable(4194304) %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  store ptr %3, ptr %7, align 8
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %9

9:                                                ; preds = %4
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %11 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %12 = mul i32 %10, %11
  %13 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %14 = add i32 %12, %13
  store i32 %14, ptr %8, align 4
  br label %15

15:                                               ; preds = %9
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %5, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %41

19:                                               ; preds = %15
  %20 = load i32, ptr %8, align 4
  %21 = mul nsw i32 %20, 1024
  %22 = add nsw i32 %21, 1023
  %23 = sext i32 %22 to i64
  %24 = load ptr, ptr %7, align 8
  %25 = getelementptr float, ptr %24, i64 %23
  %26 = load float, ptr %25, align 4
  %27 = load i32, ptr %8, align 4
  %28 = mul nsw i32 %27, 1024
  %29 = add nsw i32 %28, 1023
  %30 = sext i32 %29 to i64
  %31 = load ptr, ptr %6, align 8
  %32 = getelementptr float, ptr %31, i64 %30
  %33 = load float, ptr %32, align 4
  %34 = fdiv contract float %26, %33
  %35 = load i32, ptr %8, align 4
  %36 = mul nsw i32 %35, 1024
  %37 = add nsw i32 %36, 1023
  %38 = sext i32 %37 to i64
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr float, ptr %39, i64 %38
  store float %34, ptr %40, align 4
  br label %41

41:                                               ; preds = %19, %15
  br label %42

42:                                               ; preds = %41
  br label %43

43:                                               ; preds = %42
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %44

44:                                               ; preds = %43
  br label %45

45:                                               ; preds = %44
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11adi_kernel2iPfS_S___noalias(i32 noundef %0, ptr noalias noundef dereferenceable(4194304) %1, ptr noalias noundef dereferenceable(4194304) %2, ptr noalias noundef dereferenceable(4194304) %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  store ptr %3, ptr %7, align 8
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %9

9:                                                ; preds = %4
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %11 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %12 = mul i32 %10, %11
  %13 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %14 = add i32 %12, %13
  store i32 %14, ptr %8, align 4
  br label %15

15:                                               ; preds = %9
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %5, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %41

19:                                               ; preds = %15
  %20 = load i32, ptr %8, align 4
  %21 = mul nsw i32 %20, 1024
  %22 = add nsw i32 %21, 1023
  %23 = sext i32 %22 to i64
  %24 = load ptr, ptr %7, align 8
  %25 = getelementptr float, ptr %24, i64 %23
  %26 = load float, ptr %25, align 4
  %27 = load i32, ptr %8, align 4
  %28 = mul nsw i32 %27, 1024
  %29 = add nsw i32 %28, 1023
  %30 = sext i32 %29 to i64
  %31 = load ptr, ptr %6, align 8
  %32 = getelementptr float, ptr %31, i64 %30
  %33 = load float, ptr %32, align 4
  %34 = fdiv contract float %26, %33
  %35 = load i32, ptr %8, align 4
  %36 = mul nsw i32 %35, 1024
  %37 = add nsw i32 %36, 1023
  %38 = sext i32 %37 to i64
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr float, ptr %39, i64 %38
  store float %34, ptr %40, align 4
  br label %41

41:                                               ; preds = %19, %15
  br label %42

42:                                               ; preds = %41
  br label %43

43:                                               ; preds = %42
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %44

44:                                               ; preds = %43
  br label %45

45:                                               ; preds = %44
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11adi_kernel3iPfS_S_(i32 noundef %0, ptr noundef dereferenceable(4194304) %1, ptr noundef dereferenceable(4194304) %2, ptr noundef dereferenceable(4194304) %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %11

11:                                               ; preds = %4
  %12 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %14 = mul i32 %12, %13
  %15 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %16 = add i32 %14, %15
  store i32 %16, ptr %10, align 4
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %10, align 4
  %19 = load i32, ptr %6, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %90

21:                                               ; preds = %17
  br label %22

22:                                               ; preds = %21
  call void @llvm.lifetime.start.p0(ptr %5)
  br label %23

23:                                               ; preds = %22
  store i32 0, ptr %5, align 4
  br label %24

24:                                               ; preds = %82, %23
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %6, align 4
  %27 = sub nsw i32 %26, 2
  %28 = icmp slt i32 %25, %27
  br i1 %28, label %29, label %85

29:                                               ; preds = %24
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %10, align 4
  %32 = mul nsw i32 %31, 1024
  %33 = load i32, ptr %5, align 4
  %34 = sub nsw i32 1022, %33
  %35 = add nsw i32 %32, %34
  %36 = sext i32 %35 to i64
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr float, ptr %37, i64 %36
  %39 = load float, ptr %38, align 4
  %40 = load i32, ptr %10, align 4
  %41 = mul nsw i32 %40, 1024
  %42 = load i32, ptr %5, align 4
  %43 = sub nsw i32 1022, %42
  %44 = sub nsw i32 %43, 1
  %45 = add nsw i32 %41, %44
  %46 = sext i32 %45 to i64
  %47 = load ptr, ptr %9, align 8
  %48 = getelementptr float, ptr %47, i64 %46
  %49 = load float, ptr %48, align 4
  %50 = load i32, ptr %10, align 4
  %51 = mul nsw i32 %50, 1024
  %52 = load i32, ptr %5, align 4
  %53 = sub nsw i32 1024, %52
  %54 = sub nsw i32 %53, 3
  %55 = add nsw i32 %51, %54
  %56 = sext i32 %55 to i64
  %57 = load ptr, ptr %7, align 8
  %58 = getelementptr float, ptr %57, i64 %56
  %59 = load float, ptr %58, align 4
  %60 = fmul contract float %49, %59
  %61 = fsub contract float %39, %60
  %62 = load i32, ptr %10, align 4
  %63 = mul nsw i32 %62, 1024
  %64 = load i32, ptr %5, align 4
  %65 = sub nsw i32 1021, %64
  %66 = add nsw i32 %63, %65
  %67 = sext i32 %66 to i64
  %68 = load ptr, ptr %8, align 8
  %69 = getelementptr float, ptr %68, i64 %67
  %70 = load float, ptr %69, align 4
  %71 = fdiv contract float %61, %70
  %72 = load i32, ptr %10, align 4
  %73 = mul nsw i32 %72, 1024
  %74 = load i32, ptr %5, align 4
  %75 = sub nsw i32 1024, %74
  %76 = sub nsw i32 %75, 2
  %77 = add nsw i32 %73, %76
  %78 = sext i32 %77 to i64
  %79 = load ptr, ptr %9, align 8
  %80 = getelementptr float, ptr %79, i64 %78
  store float %71, ptr %80, align 4
  br label %81

81:                                               ; preds = %30
  br label %82

82:                                               ; preds = %81
  %83 = load i32, ptr %5, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, ptr %5, align 4
  br label %24

85:                                               ; preds = %24
  br label %86

86:                                               ; preds = %85
  call void @llvm.lifetime.end.p0(ptr %5)
  br label %87

87:                                               ; preds = %86
  br label %88

88:                                               ; preds = %87
  br label %89

89:                                               ; preds = %88
  br label %90

90:                                               ; preds = %89, %17
  br label %91

91:                                               ; preds = %90
  br label %92

92:                                               ; preds = %91
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %93

93:                                               ; preds = %92
  br label %94

94:                                               ; preds = %93
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11adi_kernel3iPfS_S___noalias(i32 noundef %0, ptr noalias noundef dereferenceable(4194304) %1, ptr noalias noundef dereferenceable(4194304) %2, ptr noalias noundef dereferenceable(4194304) %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %11

11:                                               ; preds = %4
  %12 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %14 = mul i32 %12, %13
  %15 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %16 = add i32 %14, %15
  store i32 %16, ptr %10, align 4
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %10, align 4
  %19 = load i32, ptr %6, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %90

21:                                               ; preds = %17
  br label %22

22:                                               ; preds = %21
  call void @llvm.lifetime.start.p0(ptr %5)
  br label %23

23:                                               ; preds = %22
  store i32 0, ptr %5, align 4
  br label %24

24:                                               ; preds = %82, %23
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %6, align 4
  %27 = sub nsw i32 %26, 2
  %28 = icmp slt i32 %25, %27
  br i1 %28, label %29, label %85

29:                                               ; preds = %24
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %10, align 4
  %32 = mul nsw i32 %31, 1024
  %33 = load i32, ptr %5, align 4
  %34 = sub nsw i32 1022, %33
  %35 = add nsw i32 %32, %34
  %36 = sext i32 %35 to i64
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr float, ptr %37, i64 %36
  %39 = load float, ptr %38, align 4
  %40 = load i32, ptr %10, align 4
  %41 = mul nsw i32 %40, 1024
  %42 = load i32, ptr %5, align 4
  %43 = sub nsw i32 1022, %42
  %44 = sub nsw i32 %43, 1
  %45 = add nsw i32 %41, %44
  %46 = sext i32 %45 to i64
  %47 = load ptr, ptr %9, align 8
  %48 = getelementptr float, ptr %47, i64 %46
  %49 = load float, ptr %48, align 4
  %50 = load i32, ptr %10, align 4
  %51 = mul nsw i32 %50, 1024
  %52 = load i32, ptr %5, align 4
  %53 = sub nsw i32 1024, %52
  %54 = sub nsw i32 %53, 3
  %55 = add nsw i32 %51, %54
  %56 = sext i32 %55 to i64
  %57 = load ptr, ptr %7, align 8
  %58 = getelementptr float, ptr %57, i64 %56
  %59 = load float, ptr %58, align 4
  %60 = fmul contract float %49, %59
  %61 = fsub contract float %39, %60
  %62 = load i32, ptr %10, align 4
  %63 = mul nsw i32 %62, 1024
  %64 = load i32, ptr %5, align 4
  %65 = sub nsw i32 1021, %64
  %66 = add nsw i32 %63, %65
  %67 = sext i32 %66 to i64
  %68 = load ptr, ptr %8, align 8
  %69 = getelementptr float, ptr %68, i64 %67
  %70 = load float, ptr %69, align 4
  %71 = fdiv contract float %61, %70
  %72 = load i32, ptr %10, align 4
  %73 = mul nsw i32 %72, 1024
  %74 = load i32, ptr %5, align 4
  %75 = sub nsw i32 1024, %74
  %76 = sub nsw i32 %75, 2
  %77 = add nsw i32 %73, %76
  %78 = sext i32 %77 to i64
  %79 = load ptr, ptr %9, align 8
  %80 = getelementptr float, ptr %79, i64 %78
  store float %71, ptr %80, align 4
  br label %81

81:                                               ; preds = %30
  br label %82

82:                                               ; preds = %81
  %83 = load i32, ptr %5, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, ptr %5, align 4
  br label %24

85:                                               ; preds = %24
  br label %86

86:                                               ; preds = %85
  call void @llvm.lifetime.end.p0(ptr %5)
  br label %87

87:                                               ; preds = %86
  br label %88

88:                                               ; preds = %87
  br label %89

89:                                               ; preds = %88
  br label %90

90:                                               ; preds = %89, %17
  br label %91

91:                                               ; preds = %90
  br label %92

92:                                               ; preds = %91
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %93

93:                                               ; preds = %92
  br label %94

94:                                               ; preds = %93
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11adi_kernel4iPfS_S_i(i32 noundef %0, ptr noundef dereferenceable(4194304) %1, ptr noundef dereferenceable(4194304) %2, ptr noundef dereferenceable(4194304) %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store i32 %4, ptr %10, align 4
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %12

12:                                               ; preds = %5
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %15 = mul i32 %13, %14
  %16 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %17 = add i32 %15, %16
  store i32 %17, ptr %11, align 4
  br label %18

18:                                               ; preds = %12
  %19 = load i32, ptr %11, align 4
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %110

22:                                               ; preds = %18
  %23 = load i32, ptr %10, align 4
  %24 = mul nsw i32 %23, 1024
  %25 = load i32, ptr %11, align 4
  %26 = add nsw i32 %24, %25
  %27 = sext i32 %26 to i64
  %28 = load ptr, ptr %9, align 8
  %29 = getelementptr float, ptr %28, i64 %27
  %30 = load float, ptr %29, align 4
  %31 = load i32, ptr %10, align 4
  %32 = sub nsw i32 %31, 1
  %33 = mul nsw i32 %32, 1024
  %34 = load i32, ptr %11, align 4
  %35 = add nsw i32 %33, %34
  %36 = sext i32 %35 to i64
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr float, ptr %37, i64 %36
  %39 = load float, ptr %38, align 4
  %40 = load i32, ptr %10, align 4
  %41 = mul nsw i32 %40, 1024
  %42 = load i32, ptr %11, align 4
  %43 = add nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr float, ptr %45, i64 %44
  %47 = load float, ptr %46, align 4
  %48 = fmul contract float %39, %47
  %49 = load i32, ptr %10, align 4
  %50 = sub nsw i32 %49, 1
  %51 = mul nsw i32 %50, 1024
  %52 = load i32, ptr %11, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %8, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = fdiv contract float %48, %57
  %59 = fsub contract float %30, %58
  %60 = load i32, ptr %10, align 4
  %61 = mul nsw i32 %60, 1024
  %62 = load i32, ptr %11, align 4
  %63 = add nsw i32 %61, %62
  %64 = sext i32 %63 to i64
  %65 = load ptr, ptr %9, align 8
  %66 = getelementptr float, ptr %65, i64 %64
  store float %59, ptr %66, align 4
  %67 = load i32, ptr %10, align 4
  %68 = mul nsw i32 %67, 1024
  %69 = load i32, ptr %11, align 4
  %70 = add nsw i32 %68, %69
  %71 = sext i32 %70 to i64
  %72 = load ptr, ptr %8, align 8
  %73 = getelementptr float, ptr %72, i64 %71
  %74 = load float, ptr %73, align 4
  %75 = load i32, ptr %10, align 4
  %76 = mul nsw i32 %75, 1024
  %77 = load i32, ptr %11, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = load ptr, ptr %7, align 8
  %81 = getelementptr float, ptr %80, i64 %79
  %82 = load float, ptr %81, align 4
  %83 = load i32, ptr %10, align 4
  %84 = mul nsw i32 %83, 1024
  %85 = load i32, ptr %11, align 4
  %86 = add nsw i32 %84, %85
  %87 = sext i32 %86 to i64
  %88 = load ptr, ptr %7, align 8
  %89 = getelementptr float, ptr %88, i64 %87
  %90 = load float, ptr %89, align 4
  %91 = fmul contract float %82, %90
  %92 = load i32, ptr %10, align 4
  %93 = sub nsw i32 %92, 1
  %94 = mul nsw i32 %93, 1024
  %95 = load i32, ptr %11, align 4
  %96 = add nsw i32 %94, %95
  %97 = sext i32 %96 to i64
  %98 = load ptr, ptr %8, align 8
  %99 = getelementptr float, ptr %98, i64 %97
  %100 = load float, ptr %99, align 4
  %101 = fdiv contract float %91, %100
  %102 = fsub contract float %74, %101
  %103 = load i32, ptr %10, align 4
  %104 = mul nsw i32 %103, 1024
  %105 = load i32, ptr %11, align 4
  %106 = add nsw i32 %104, %105
  %107 = sext i32 %106 to i64
  %108 = load ptr, ptr %8, align 8
  %109 = getelementptr float, ptr %108, i64 %107
  store float %102, ptr %109, align 4
  br label %110

110:                                              ; preds = %22, %18
  br label %111

111:                                              ; preds = %110
  br label %112

112:                                              ; preds = %111
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %113

113:                                              ; preds = %112
  br label %114

114:                                              ; preds = %113
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11adi_kernel4iPfS_S_i__noalias(i32 noundef %0, ptr noalias noundef dereferenceable(4194304) %1, ptr noalias noundef dereferenceable(4194304) %2, ptr noalias noundef dereferenceable(4194304) %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store i32 %4, ptr %10, align 4
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %12

12:                                               ; preds = %5
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %15 = mul i32 %13, %14
  %16 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %17 = add i32 %15, %16
  store i32 %17, ptr %11, align 4
  br label %18

18:                                               ; preds = %12
  %19 = load i32, ptr %11, align 4
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %110

22:                                               ; preds = %18
  %23 = load i32, ptr %10, align 4
  %24 = mul nsw i32 %23, 1024
  %25 = load i32, ptr %11, align 4
  %26 = add nsw i32 %24, %25
  %27 = sext i32 %26 to i64
  %28 = load ptr, ptr %9, align 8
  %29 = getelementptr float, ptr %28, i64 %27
  %30 = load float, ptr %29, align 4
  %31 = load i32, ptr %10, align 4
  %32 = sub nsw i32 %31, 1
  %33 = mul nsw i32 %32, 1024
  %34 = load i32, ptr %11, align 4
  %35 = add nsw i32 %33, %34
  %36 = sext i32 %35 to i64
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr float, ptr %37, i64 %36
  %39 = load float, ptr %38, align 4
  %40 = load i32, ptr %10, align 4
  %41 = mul nsw i32 %40, 1024
  %42 = load i32, ptr %11, align 4
  %43 = add nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr float, ptr %45, i64 %44
  %47 = load float, ptr %46, align 4
  %48 = fmul contract float %39, %47
  %49 = load i32, ptr %10, align 4
  %50 = sub nsw i32 %49, 1
  %51 = mul nsw i32 %50, 1024
  %52 = load i32, ptr %11, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %8, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = fdiv contract float %48, %57
  %59 = fsub contract float %30, %58
  %60 = load i32, ptr %10, align 4
  %61 = mul nsw i32 %60, 1024
  %62 = load i32, ptr %11, align 4
  %63 = add nsw i32 %61, %62
  %64 = sext i32 %63 to i64
  %65 = load ptr, ptr %9, align 8
  %66 = getelementptr float, ptr %65, i64 %64
  store float %59, ptr %66, align 4
  %67 = load i32, ptr %10, align 4
  %68 = mul nsw i32 %67, 1024
  %69 = load i32, ptr %11, align 4
  %70 = add nsw i32 %68, %69
  %71 = sext i32 %70 to i64
  %72 = load ptr, ptr %8, align 8
  %73 = getelementptr float, ptr %72, i64 %71
  %74 = load float, ptr %73, align 4
  %75 = load i32, ptr %10, align 4
  %76 = mul nsw i32 %75, 1024
  %77 = load i32, ptr %11, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = load ptr, ptr %7, align 8
  %81 = getelementptr float, ptr %80, i64 %79
  %82 = load float, ptr %81, align 4
  %83 = load i32, ptr %10, align 4
  %84 = mul nsw i32 %83, 1024
  %85 = load i32, ptr %11, align 4
  %86 = add nsw i32 %84, %85
  %87 = sext i32 %86 to i64
  %88 = load ptr, ptr %7, align 8
  %89 = getelementptr float, ptr %88, i64 %87
  %90 = load float, ptr %89, align 4
  %91 = fmul contract float %82, %90
  %92 = load i32, ptr %10, align 4
  %93 = sub nsw i32 %92, 1
  %94 = mul nsw i32 %93, 1024
  %95 = load i32, ptr %11, align 4
  %96 = add nsw i32 %94, %95
  %97 = sext i32 %96 to i64
  %98 = load ptr, ptr %8, align 8
  %99 = getelementptr float, ptr %98, i64 %97
  %100 = load float, ptr %99, align 4
  %101 = fdiv contract float %91, %100
  %102 = fsub contract float %74, %101
  %103 = load i32, ptr %10, align 4
  %104 = mul nsw i32 %103, 1024
  %105 = load i32, ptr %11, align 4
  %106 = add nsw i32 %104, %105
  %107 = sext i32 %106 to i64
  %108 = load ptr, ptr %8, align 8
  %109 = getelementptr float, ptr %108, i64 %107
  store float %102, ptr %109, align 4
  br label %110

110:                                              ; preds = %22, %18
  br label %111

111:                                              ; preds = %110
  br label %112

112:                                              ; preds = %111
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %113

113:                                              ; preds = %112
  br label %114

114:                                              ; preds = %113
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11adi_kernel5iPfS_S_(i32 noundef %0, ptr noundef dereferenceable(4194304) %1, ptr noundef dereferenceable(4194304) %2, ptr noundef dereferenceable(4194304) %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  store ptr %3, ptr %7, align 8
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %9

9:                                                ; preds = %4
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %11 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %12 = mul i32 %10, %11
  %13 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %14 = add i32 %12, %13
  store i32 %14, ptr %8, align 4
  br label %15

15:                                               ; preds = %9
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %5, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %38

19:                                               ; preds = %15
  %20 = load i32, ptr %8, align 4
  %21 = add nsw i32 1047552, %20
  %22 = sext i32 %21 to i64
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr float, ptr %23, i64 %22
  %25 = load float, ptr %24, align 4
  %26 = load i32, ptr %8, align 4
  %27 = add nsw i32 1047552, %26
  %28 = sext i32 %27 to i64
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr float, ptr %29, i64 %28
  %31 = load float, ptr %30, align 4
  %32 = fdiv contract float %25, %31
  %33 = load i32, ptr %8, align 4
  %34 = add nsw i32 1047552, %33
  %35 = sext i32 %34 to i64
  %36 = load ptr, ptr %7, align 8
  %37 = getelementptr float, ptr %36, i64 %35
  store float %32, ptr %37, align 4
  br label %38

38:                                               ; preds = %19, %15
  br label %39

39:                                               ; preds = %38
  br label %40

40:                                               ; preds = %39
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %41

41:                                               ; preds = %40
  br label %42

42:                                               ; preds = %41
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11adi_kernel5iPfS_S___noalias(i32 noundef %0, ptr noalias noundef dereferenceable(4194304) %1, ptr noalias noundef dereferenceable(4194304) %2, ptr noalias noundef dereferenceable(4194304) %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  store ptr %3, ptr %7, align 8
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %9

9:                                                ; preds = %4
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %11 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %12 = mul i32 %10, %11
  %13 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %14 = add i32 %12, %13
  store i32 %14, ptr %8, align 4
  br label %15

15:                                               ; preds = %9
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %5, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %38

19:                                               ; preds = %15
  %20 = load i32, ptr %8, align 4
  %21 = add nsw i32 1047552, %20
  %22 = sext i32 %21 to i64
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr float, ptr %23, i64 %22
  %25 = load float, ptr %24, align 4
  %26 = load i32, ptr %8, align 4
  %27 = add nsw i32 1047552, %26
  %28 = sext i32 %27 to i64
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr float, ptr %29, i64 %28
  %31 = load float, ptr %30, align 4
  %32 = fdiv contract float %25, %31
  %33 = load i32, ptr %8, align 4
  %34 = add nsw i32 1047552, %33
  %35 = sext i32 %34 to i64
  %36 = load ptr, ptr %7, align 8
  %37 = getelementptr float, ptr %36, i64 %35
  store float %32, ptr %37, align 4
  br label %38

38:                                               ; preds = %19, %15
  br label %39

39:                                               ; preds = %38
  br label %40

40:                                               ; preds = %39
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %41

41:                                               ; preds = %40
  br label %42

42:                                               ; preds = %41
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11adi_kernel6iPfS_S_i(i32 noundef %0, ptr noundef dereferenceable(4194304) %1, ptr noundef dereferenceable(4194304) %2, ptr noundef dereferenceable(4194304) %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store i32 %4, ptr %10, align 4
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %12

12:                                               ; preds = %5
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %15 = mul i32 %13, %14
  %16 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %17 = add i32 %15, %16
  store i32 %17, ptr %11, align 4
  br label %18

18:                                               ; preds = %12
  %19 = load i32, ptr %11, align 4
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %71

22:                                               ; preds = %18
  %23 = load i32, ptr %10, align 4
  %24 = sub nsw i32 1022, %23
  %25 = mul nsw i32 %24, 1024
  %26 = load i32, ptr %11, align 4
  %27 = add nsw i32 %25, %26
  %28 = sext i32 %27 to i64
  %29 = load ptr, ptr %9, align 8
  %30 = getelementptr float, ptr %29, i64 %28
  %31 = load float, ptr %30, align 4
  %32 = load i32, ptr %10, align 4
  %33 = sub nsw i32 1024, %32
  %34 = sub nsw i32 %33, 3
  %35 = mul nsw i32 %34, 1024
  %36 = load i32, ptr %11, align 4
  %37 = add nsw i32 %35, %36
  %38 = sext i32 %37 to i64
  %39 = load ptr, ptr %9, align 8
  %40 = getelementptr float, ptr %39, i64 %38
  %41 = load float, ptr %40, align 4
  %42 = load i32, ptr %10, align 4
  %43 = sub nsw i32 1021, %42
  %44 = mul nsw i32 %43, 1024
  %45 = load i32, ptr %11, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = load ptr, ptr %7, align 8
  %49 = getelementptr float, ptr %48, i64 %47
  %50 = load float, ptr %49, align 4
  %51 = fmul contract float %41, %50
  %52 = fsub contract float %31, %51
  %53 = load i32, ptr %10, align 4
  %54 = sub nsw i32 1022, %53
  %55 = mul nsw i32 %54, 1024
  %56 = load i32, ptr %11, align 4
  %57 = add nsw i32 %55, %56
  %58 = sext i32 %57 to i64
  %59 = load ptr, ptr %8, align 8
  %60 = getelementptr float, ptr %59, i64 %58
  %61 = load float, ptr %60, align 4
  %62 = fdiv contract float %52, %61
  %63 = load i32, ptr %10, align 4
  %64 = sub nsw i32 1022, %63
  %65 = mul nsw i32 %64, 1024
  %66 = load i32, ptr %11, align 4
  %67 = add nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = load ptr, ptr %9, align 8
  %70 = getelementptr float, ptr %69, i64 %68
  store float %62, ptr %70, align 4
  br label %71

71:                                               ; preds = %22, %18
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
define dso_local ptx_kernel void @_Z11adi_kernel6iPfS_S_i__noalias(i32 noundef %0, ptr noalias noundef dereferenceable(4194304) %1, ptr noalias noundef dereferenceable(4194304) %2, ptr noalias noundef dereferenceable(4194304) %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store i32 %4, ptr %10, align 4
  call void @llvm.lifetime.start.p0(ptr %11)
  br label %12

12:                                               ; preds = %5
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %15 = mul i32 %13, %14
  %16 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %17 = add i32 %15, %16
  store i32 %17, ptr %11, align 4
  br label %18

18:                                               ; preds = %12
  %19 = load i32, ptr %11, align 4
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %71

22:                                               ; preds = %18
  %23 = load i32, ptr %10, align 4
  %24 = sub nsw i32 1022, %23
  %25 = mul nsw i32 %24, 1024
  %26 = load i32, ptr %11, align 4
  %27 = add nsw i32 %25, %26
  %28 = sext i32 %27 to i64
  %29 = load ptr, ptr %9, align 8
  %30 = getelementptr float, ptr %29, i64 %28
  %31 = load float, ptr %30, align 4
  %32 = load i32, ptr %10, align 4
  %33 = sub nsw i32 1024, %32
  %34 = sub nsw i32 %33, 3
  %35 = mul nsw i32 %34, 1024
  %36 = load i32, ptr %11, align 4
  %37 = add nsw i32 %35, %36
  %38 = sext i32 %37 to i64
  %39 = load ptr, ptr %9, align 8
  %40 = getelementptr float, ptr %39, i64 %38
  %41 = load float, ptr %40, align 4
  %42 = load i32, ptr %10, align 4
  %43 = sub nsw i32 1021, %42
  %44 = mul nsw i32 %43, 1024
  %45 = load i32, ptr %11, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = load ptr, ptr %7, align 8
  %49 = getelementptr float, ptr %48, i64 %47
  %50 = load float, ptr %49, align 4
  %51 = fmul contract float %41, %50
  %52 = fsub contract float %31, %51
  %53 = load i32, ptr %10, align 4
  %54 = sub nsw i32 1022, %53
  %55 = mul nsw i32 %54, 1024
  %56 = load i32, ptr %11, align 4
  %57 = add nsw i32 %55, %56
  %58 = sext i32 %57 to i64
  %59 = load ptr, ptr %8, align 8
  %60 = getelementptr float, ptr %59, i64 %58
  %61 = load float, ptr %60, align 4
  %62 = fdiv contract float %52, %61
  %63 = load i32, ptr %10, align 4
  %64 = sub nsw i32 1022, %63
  %65 = mul nsw i32 %64, 1024
  %66 = load i32, ptr %11, align 4
  %67 = add nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = load ptr, ptr %9, align 8
  %70 = getelementptr float, ptr %69, i64 %68
  store float %62, ptr %70, align 4
  br label %71

71:                                               ; preds = %22, %18
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
