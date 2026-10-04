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
define dso_local ptx_kernel void @_Z12atax_kernel1iiPfS_S_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 {
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
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %16 = mul i32 %14, %15
  %17 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %18 = add i32 %16, %17
  store i32 %18, ptr %12, align 4
  br label %19

19:                                               ; preds = %13
  %20 = load i32, ptr %12, align 4
  %21 = load i32, ptr %7, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %65

23:                                               ; preds = %19
  %24 = load i32, ptr %12, align 4
  %25 = sext i32 %24 to i64
  %26 = load ptr, ptr %11, align 8
  %27 = getelementptr float, ptr %26, i64 %25
  store float 0.000000e+00, ptr %27, align 4
  call void @llvm.lifetime.start.p0(ptr %6)
  br label %28

28:                                               ; preds = %23
  br label %29

29:                                               ; preds = %28
  store i32 0, ptr %6, align 4
  br label %30

30:                                               ; preds = %57, %29
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %8, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %60

34:                                               ; preds = %30
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %12, align 4
  %37 = mul nsw i32 %36, 4096
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = load ptr, ptr %9, align 8
  %42 = getelementptr float, ptr %41, i64 %40
  %43 = load float, ptr %42, align 4
  %44 = load i32, ptr %6, align 4
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %10, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fmul contract float %43, %48
  %50 = load i32, ptr %12, align 4
  %51 = sext i32 %50 to i64
  %52 = load ptr, ptr %11, align 8
  %53 = getelementptr float, ptr %52, i64 %51
  %54 = load float, ptr %53, align 4
  %55 = fadd contract float %54, %49
  store float %55, ptr %53, align 4
  br label %56

56:                                               ; preds = %35
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %6, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %6, align 4
  br label %30

60:                                               ; preds = %30
  br label %61

61:                                               ; preds = %60
  br label %62

62:                                               ; preds = %61
  call void @llvm.lifetime.end.p0(ptr %6)
  br label %63

63:                                               ; preds = %62
  br label %64

64:                                               ; preds = %63
  br label %65

65:                                               ; preds = %64, %19
  br label %66

66:                                               ; preds = %65
  br label %67

67:                                               ; preds = %66
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %68

68:                                               ; preds = %67
  br label %69

69:                                               ; preds = %68
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z12atax_kernel1iiPfS_S___noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef %2, ptr noalias noundef %3, ptr noalias noundef %4) #0 {
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
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %16 = mul i32 %14, %15
  %17 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %18 = add i32 %16, %17
  store i32 %18, ptr %12, align 4
  br label %19

19:                                               ; preds = %13
  %20 = load i32, ptr %12, align 4
  %21 = load i32, ptr %7, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %65

23:                                               ; preds = %19
  %24 = load i32, ptr %12, align 4
  %25 = sext i32 %24 to i64
  %26 = load ptr, ptr %11, align 8
  %27 = getelementptr float, ptr %26, i64 %25
  store float 0.000000e+00, ptr %27, align 4
  call void @llvm.lifetime.start.p0(ptr %6)
  br label %28

28:                                               ; preds = %23
  br label %29

29:                                               ; preds = %28
  store i32 0, ptr %6, align 4
  br label %30

30:                                               ; preds = %57, %29
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %8, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %60

34:                                               ; preds = %30
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %12, align 4
  %37 = mul nsw i32 %36, 4096
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = load ptr, ptr %9, align 8
  %42 = getelementptr float, ptr %41, i64 %40
  %43 = load float, ptr %42, align 4
  %44 = load i32, ptr %6, align 4
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %10, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fmul contract float %43, %48
  %50 = load i32, ptr %12, align 4
  %51 = sext i32 %50 to i64
  %52 = load ptr, ptr %11, align 8
  %53 = getelementptr float, ptr %52, i64 %51
  %54 = load float, ptr %53, align 4
  %55 = fadd contract float %54, %49
  store float %55, ptr %53, align 4
  br label %56

56:                                               ; preds = %35
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %6, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %6, align 4
  br label %30

60:                                               ; preds = %30
  br label %61

61:                                               ; preds = %60
  br label %62

62:                                               ; preds = %61
  call void @llvm.lifetime.end.p0(ptr %6)
  br label %63

63:                                               ; preds = %62
  br label %64

64:                                               ; preds = %63
  br label %65

65:                                               ; preds = %64, %19
  br label %66

66:                                               ; preds = %65
  br label %67

67:                                               ; preds = %66
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %68

68:                                               ; preds = %67
  br label %69

69:                                               ; preds = %68
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
define dso_local ptx_kernel void @_Z12atax_kernel2iiPfS_S_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 {
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
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %16 = mul i32 %14, %15
  %17 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %18 = add i32 %16, %17
  store i32 %18, ptr %12, align 4
  br label %19

19:                                               ; preds = %13
  %20 = load i32, ptr %12, align 4
  %21 = load i32, ptr %8, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %65

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

30:                                               ; preds = %57, %29
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %7, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %60

34:                                               ; preds = %30
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %6, align 4
  %37 = mul nsw i32 %36, 4096
  %38 = load i32, ptr %12, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = load ptr, ptr %9, align 8
  %42 = getelementptr float, ptr %41, i64 %40
  %43 = load float, ptr %42, align 4
  %44 = load i32, ptr %6, align 4
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %11, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fmul contract float %43, %48
  %50 = load i32, ptr %12, align 4
  %51 = sext i32 %50 to i64
  %52 = load ptr, ptr %10, align 8
  %53 = getelementptr float, ptr %52, i64 %51
  %54 = load float, ptr %53, align 4
  %55 = fadd contract float %54, %49
  store float %55, ptr %53, align 4
  br label %56

56:                                               ; preds = %35
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %6, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %6, align 4
  br label %30

60:                                               ; preds = %30
  br label %61

61:                                               ; preds = %60
  br label %62

62:                                               ; preds = %61
  call void @llvm.lifetime.end.p0(ptr %6)
  br label %63

63:                                               ; preds = %62
  br label %64

64:                                               ; preds = %63
  br label %65

65:                                               ; preds = %64, %19
  br label %66

66:                                               ; preds = %65
  br label %67

67:                                               ; preds = %66
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %68

68:                                               ; preds = %67
  br label %69

69:                                               ; preds = %68
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z12atax_kernel2iiPfS_S___noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef %2, ptr noalias noundef %3, ptr noalias noundef %4) #0 {
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
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %15 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %16 = mul i32 %14, %15
  %17 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %18 = add i32 %16, %17
  store i32 %18, ptr %12, align 4
  br label %19

19:                                               ; preds = %13
  %20 = load i32, ptr %12, align 4
  %21 = load i32, ptr %8, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %65

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

30:                                               ; preds = %57, %29
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %7, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %60

34:                                               ; preds = %30
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %6, align 4
  %37 = mul nsw i32 %36, 4096
  %38 = load i32, ptr %12, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = load ptr, ptr %9, align 8
  %42 = getelementptr float, ptr %41, i64 %40
  %43 = load float, ptr %42, align 4
  %44 = load i32, ptr %6, align 4
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %11, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fmul contract float %43, %48
  %50 = load i32, ptr %12, align 4
  %51 = sext i32 %50 to i64
  %52 = load ptr, ptr %10, align 8
  %53 = getelementptr float, ptr %52, i64 %51
  %54 = load float, ptr %53, align 4
  %55 = fadd contract float %54, %49
  store float %55, ptr %53, align 4
  br label %56

56:                                               ; preds = %35
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %6, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %6, align 4
  br label %30

60:                                               ; preds = %30
  br label %61

61:                                               ; preds = %60
  br label %62

62:                                               ; preds = %61
  call void @llvm.lifetime.end.p0(ptr %6)
  br label %63

63:                                               ; preds = %62
  br label %64

64:                                               ; preds = %63
  br label %65

65:                                               ; preds = %64, %19
  br label %66

66:                                               ; preds = %65
  br label %67

67:                                               ; preds = %66
  call void @llvm.lifetime.end.p0(ptr %12)
  br label %68

68:                                               ; preds = %67
  br label %69

69:                                               ; preds = %68
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
