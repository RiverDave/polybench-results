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
define dso_local ptx_kernel void @_Z11mvt_kernel1iPfS_S_(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
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
  br i1 %20, label %21, label %59

21:                                               ; preds = %17
  call void @llvm.lifetime.start.p0(ptr %5)
  br label %22

22:                                               ; preds = %21
  br label %23

23:                                               ; preds = %22
  store i32 0, ptr %5, align 4
  br label %24

24:                                               ; preds = %51, %23
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %54

28:                                               ; preds = %24
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %10, align 4
  %31 = mul nsw i32 %30, 4096
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr float, ptr %35, i64 %34
  %37 = load float, ptr %36, align 4
  %38 = load i32, ptr %5, align 4
  %39 = sext i32 %38 to i64
  %40 = load ptr, ptr %9, align 8
  %41 = getelementptr float, ptr %40, i64 %39
  %42 = load float, ptr %41, align 4
  %43 = fmul contract float %37, %42
  %44 = load i32, ptr %10, align 4
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %8, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fadd contract float %48, %43
  store float %49, ptr %47, align 4
  br label %50

50:                                               ; preds = %29
  br label %51

51:                                               ; preds = %50
  %52 = load i32, ptr %5, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %5, align 4
  br label %24

54:                                               ; preds = %24
  br label %55

55:                                               ; preds = %54
  br label %56

56:                                               ; preds = %55
  call void @llvm.lifetime.end.p0(ptr %5)
  br label %57

57:                                               ; preds = %56
  br label %58

58:                                               ; preds = %57
  br label %59

59:                                               ; preds = %58, %17
  br label %60

60:                                               ; preds = %59
  br label %61

61:                                               ; preds = %60
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %62

62:                                               ; preds = %61
  br label %63

63:                                               ; preds = %62
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11mvt_kernel1iPfS_S___noalias(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2, ptr noalias noundef %3) #0 {
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
  br i1 %20, label %21, label %59

21:                                               ; preds = %17
  call void @llvm.lifetime.start.p0(ptr %5)
  br label %22

22:                                               ; preds = %21
  br label %23

23:                                               ; preds = %22
  store i32 0, ptr %5, align 4
  br label %24

24:                                               ; preds = %51, %23
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %54

28:                                               ; preds = %24
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %10, align 4
  %31 = mul nsw i32 %30, 4096
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr float, ptr %35, i64 %34
  %37 = load float, ptr %36, align 4
  %38 = load i32, ptr %5, align 4
  %39 = sext i32 %38 to i64
  %40 = load ptr, ptr %9, align 8
  %41 = getelementptr float, ptr %40, i64 %39
  %42 = load float, ptr %41, align 4
  %43 = fmul contract float %37, %42
  %44 = load i32, ptr %10, align 4
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %8, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fadd contract float %48, %43
  store float %49, ptr %47, align 4
  br label %50

50:                                               ; preds = %29
  br label %51

51:                                               ; preds = %50
  %52 = load i32, ptr %5, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %5, align 4
  br label %24

54:                                               ; preds = %24
  br label %55

55:                                               ; preds = %54
  br label %56

56:                                               ; preds = %55
  call void @llvm.lifetime.end.p0(ptr %5)
  br label %57

57:                                               ; preds = %56
  br label %58

58:                                               ; preds = %57
  br label %59

59:                                               ; preds = %58, %17
  br label %60

60:                                               ; preds = %59
  br label %61

61:                                               ; preds = %60
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %62

62:                                               ; preds = %61
  br label %63

63:                                               ; preds = %62
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
define dso_local ptx_kernel void @_Z11mvt_kernel2iPfS_S_(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
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
  br i1 %20, label %21, label %59

21:                                               ; preds = %17
  call void @llvm.lifetime.start.p0(ptr %5)
  br label %22

22:                                               ; preds = %21
  br label %23

23:                                               ; preds = %22
  store i32 0, ptr %5, align 4
  br label %24

24:                                               ; preds = %51, %23
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %54

28:                                               ; preds = %24
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %5, align 4
  %31 = mul nsw i32 %30, 4096
  %32 = load i32, ptr %10, align 4
  %33 = add nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr float, ptr %35, i64 %34
  %37 = load float, ptr %36, align 4
  %38 = load i32, ptr %5, align 4
  %39 = sext i32 %38 to i64
  %40 = load ptr, ptr %9, align 8
  %41 = getelementptr float, ptr %40, i64 %39
  %42 = load float, ptr %41, align 4
  %43 = fmul contract float %37, %42
  %44 = load i32, ptr %10, align 4
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %8, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fadd contract float %48, %43
  store float %49, ptr %47, align 4
  br label %50

50:                                               ; preds = %29
  br label %51

51:                                               ; preds = %50
  %52 = load i32, ptr %5, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %5, align 4
  br label %24

54:                                               ; preds = %24
  br label %55

55:                                               ; preds = %54
  br label %56

56:                                               ; preds = %55
  call void @llvm.lifetime.end.p0(ptr %5)
  br label %57

57:                                               ; preds = %56
  br label %58

58:                                               ; preds = %57
  br label %59

59:                                               ; preds = %58, %17
  br label %60

60:                                               ; preds = %59
  br label %61

61:                                               ; preds = %60
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %62

62:                                               ; preds = %61
  br label %63

63:                                               ; preds = %62
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11mvt_kernel2iPfS_S___noalias(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2, ptr noalias noundef %3) #0 {
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
  br i1 %20, label %21, label %59

21:                                               ; preds = %17
  call void @llvm.lifetime.start.p0(ptr %5)
  br label %22

22:                                               ; preds = %21
  br label %23

23:                                               ; preds = %22
  store i32 0, ptr %5, align 4
  br label %24

24:                                               ; preds = %51, %23
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %54

28:                                               ; preds = %24
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %5, align 4
  %31 = mul nsw i32 %30, 4096
  %32 = load i32, ptr %10, align 4
  %33 = add nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr float, ptr %35, i64 %34
  %37 = load float, ptr %36, align 4
  %38 = load i32, ptr %5, align 4
  %39 = sext i32 %38 to i64
  %40 = load ptr, ptr %9, align 8
  %41 = getelementptr float, ptr %40, i64 %39
  %42 = load float, ptr %41, align 4
  %43 = fmul contract float %37, %42
  %44 = load i32, ptr %10, align 4
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %8, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fadd contract float %48, %43
  store float %49, ptr %47, align 4
  br label %50

50:                                               ; preds = %29
  br label %51

51:                                               ; preds = %50
  %52 = load i32, ptr %5, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %5, align 4
  br label %24

54:                                               ; preds = %24
  br label %55

55:                                               ; preds = %54
  br label %56

56:                                               ; preds = %55
  call void @llvm.lifetime.end.p0(ptr %5)
  br label %57

57:                                               ; preds = %56
  br label %58

58:                                               ; preds = %57
  br label %59

59:                                               ; preds = %58, %17
  br label %60

60:                                               ; preds = %59
  br label %61

61:                                               ; preds = %60
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %62

62:                                               ; preds = %61
  br label %63

63:                                               ; preds = %62
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
