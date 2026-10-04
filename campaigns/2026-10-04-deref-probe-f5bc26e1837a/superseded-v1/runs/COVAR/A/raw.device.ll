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
define dso_local ptx_kernel void @_Z11mean_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
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
define dso_local ptx_kernel void @_Z11mean_kerneliiPfS___noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef %2, ptr noalias noundef %3) #0 {
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
define dso_local ptx_kernel void @_Z13reduce_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %11

11:                                               ; preds = %4
  %12 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %14 = mul i32 %12, %13
  %15 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %16 = add i32 %14, %15
  store i32 %16, ptr %9, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %17

17:                                               ; preds = %11
  %18 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %19 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %20 = mul i32 %18, %19
  %21 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %22 = add i32 %20, %21
  store i32 %22, ptr %10, align 4
  br label %23

23:                                               ; preds = %17
  %24 = load i32, ptr %10, align 4
  %25 = load i32, ptr %6, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %31

27:                                               ; preds = %23
  %28 = load i32, ptr %9, align 4
  %29 = load i32, ptr %5, align 4
  %30 = icmp slt i32 %28, %29
  br label %32

31:                                               ; preds = %23
  br label %32

32:                                               ; preds = %27, %31
  %33 = phi i1 [ false, %31 ], [ %30, %27 ]
  br label %34

34:                                               ; preds = %32
  br i1 %33, label %35, label %50

35:                                               ; preds = %34
  %36 = load i32, ptr %9, align 4
  %37 = sext i32 %36 to i64
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr float, ptr %38, i64 %37
  %40 = load float, ptr %39, align 4
  %41 = load i32, ptr %10, align 4
  %42 = mul nsw i32 %41, 2048
  %43 = load i32, ptr %9, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %8, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fsub contract float %48, %40
  store float %49, ptr %47, align 4
  br label %50

50:                                               ; preds = %35, %34
  br label %51

51:                                               ; preds = %50
  br label %52

52:                                               ; preds = %51
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %53

53:                                               ; preds = %52
  br label %54

54:                                               ; preds = %53
  br label %55

55:                                               ; preds = %54
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %56

56:                                               ; preds = %55
  br label %57

57:                                               ; preds = %56
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z13reduce_kerneliiPfS___noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef %2, ptr noalias noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %11

11:                                               ; preds = %4
  %12 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %14 = mul i32 %12, %13
  %15 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %16 = add i32 %14, %15
  store i32 %16, ptr %9, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  br label %17

17:                                               ; preds = %11
  %18 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %19 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %20 = mul i32 %18, %19
  %21 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %22 = add i32 %20, %21
  store i32 %22, ptr %10, align 4
  br label %23

23:                                               ; preds = %17
  %24 = load i32, ptr %10, align 4
  %25 = load i32, ptr %6, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %31

27:                                               ; preds = %23
  %28 = load i32, ptr %9, align 4
  %29 = load i32, ptr %5, align 4
  %30 = icmp slt i32 %28, %29
  br label %32

31:                                               ; preds = %23
  br label %32

32:                                               ; preds = %27, %31
  %33 = phi i1 [ false, %31 ], [ %30, %27 ]
  br label %34

34:                                               ; preds = %32
  br i1 %33, label %35, label %50

35:                                               ; preds = %34
  %36 = load i32, ptr %9, align 4
  %37 = sext i32 %36 to i64
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr float, ptr %38, i64 %37
  %40 = load float, ptr %39, align 4
  %41 = load i32, ptr %10, align 4
  %42 = mul nsw i32 %41, 2048
  %43 = load i32, ptr %9, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = load ptr, ptr %8, align 8
  %47 = getelementptr float, ptr %46, i64 %45
  %48 = load float, ptr %47, align 4
  %49 = fsub contract float %48, %40
  store float %49, ptr %47, align 4
  br label %50

50:                                               ; preds = %35, %34
  br label %51

51:                                               ; preds = %50
  br label %52

52:                                               ; preds = %51
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %53

53:                                               ; preds = %52
  br label %54

54:                                               ; preds = %53
  br label %55

55:                                               ; preds = %54
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %56

56:                                               ; preds = %55
  br label %57

57:                                               ; preds = %56
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
define dso_local ptx_kernel void @_Z12covar_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
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
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %15 = mul i32 %13, %14
  %16 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
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
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %100

24:                                               ; preds = %20
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %9, align 4
  store i32 %26, ptr %11, align 4
  br label %27

27:                                               ; preds = %95, %25
  %28 = load i32, ptr %11, align 4
  %29 = load i32, ptr %5, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %98

31:                                               ; preds = %27
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %9, align 4
  %34 = mul nsw i32 %33, 2048
  %35 = load i32, ptr %11, align 4
  %36 = add nsw i32 %34, %35
  %37 = sext i32 %36 to i64
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr float, ptr %38, i64 %37
  store float 0.000000e+00, ptr %39, align 4
  br label %40

40:                                               ; preds = %32
  store i32 0, ptr %10, align 4
  br label %41

41:                                               ; preds = %74, %40
  %42 = load i32, ptr %10, align 4
  %43 = load i32, ptr %6, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %77

45:                                               ; preds = %41
  br label %46

46:                                               ; preds = %45
  %47 = load i32, ptr %10, align 4
  %48 = mul nsw i32 %47, 2048
  %49 = load i32, ptr %9, align 4
  %50 = add nsw i32 %48, %49
  %51 = sext i32 %50 to i64
  %52 = load ptr, ptr %8, align 8
  %53 = getelementptr float, ptr %52, i64 %51
  %54 = load float, ptr %53, align 4
  %55 = load i32, ptr %10, align 4
  %56 = mul nsw i32 %55, 2048
  %57 = load i32, ptr %11, align 4
  %58 = add nsw i32 %56, %57
  %59 = sext i32 %58 to i64
  %60 = load ptr, ptr %8, align 8
  %61 = getelementptr float, ptr %60, i64 %59
  %62 = load float, ptr %61, align 4
  %63 = fmul contract float %54, %62
  %64 = load i32, ptr %9, align 4
  %65 = mul nsw i32 %64, 2048
  %66 = load i32, ptr %11, align 4
  %67 = add nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = load ptr, ptr %7, align 8
  %70 = getelementptr float, ptr %69, i64 %68
  %71 = load float, ptr %70, align 4
  %72 = fadd contract float %71, %63
  store float %72, ptr %70, align 4
  br label %73

73:                                               ; preds = %46
  br label %74

74:                                               ; preds = %73
  %75 = load i32, ptr %10, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %10, align 4
  br label %41

77:                                               ; preds = %41
  br label %78

78:                                               ; preds = %77
  %79 = load i32, ptr %9, align 4
  %80 = mul nsw i32 %79, 2048
  %81 = load i32, ptr %11, align 4
  %82 = add nsw i32 %80, %81
  %83 = sext i32 %82 to i64
  %84 = load ptr, ptr %7, align 8
  %85 = getelementptr float, ptr %84, i64 %83
  %86 = load float, ptr %85, align 4
  %87 = load i32, ptr %11, align 4
  %88 = mul nsw i32 %87, 2048
  %89 = load i32, ptr %9, align 4
  %90 = add nsw i32 %88, %89
  %91 = sext i32 %90 to i64
  %92 = load ptr, ptr %7, align 8
  %93 = getelementptr float, ptr %92, i64 %91
  store float %86, ptr %93, align 4
  br label %94

94:                                               ; preds = %78
  br label %95

95:                                               ; preds = %94
  %96 = load i32, ptr %11, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %11, align 4
  br label %27

98:                                               ; preds = %27
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99, %20
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %103

103:                                              ; preds = %102
  br label %104

104:                                              ; preds = %103
  br label %105

105:                                              ; preds = %104
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %106

106:                                              ; preds = %105
  br label %107

107:                                              ; preds = %106
  br label %108

108:                                              ; preds = %107
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %109

109:                                              ; preds = %108
  br label %110

110:                                              ; preds = %109
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z12covar_kerneliiPfS___noalias(i32 noundef %0, i32 noundef %1, ptr noalias noundef %2, ptr noalias noundef %3) #0 {
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
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %15 = mul i32 %13, %14
  %16 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
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
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %100

24:                                               ; preds = %20
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %9, align 4
  store i32 %26, ptr %11, align 4
  br label %27

27:                                               ; preds = %95, %25
  %28 = load i32, ptr %11, align 4
  %29 = load i32, ptr %5, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %98

31:                                               ; preds = %27
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %9, align 4
  %34 = mul nsw i32 %33, 2048
  %35 = load i32, ptr %11, align 4
  %36 = add nsw i32 %34, %35
  %37 = sext i32 %36 to i64
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr float, ptr %38, i64 %37
  store float 0.000000e+00, ptr %39, align 4
  br label %40

40:                                               ; preds = %32
  store i32 0, ptr %10, align 4
  br label %41

41:                                               ; preds = %74, %40
  %42 = load i32, ptr %10, align 4
  %43 = load i32, ptr %6, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %77

45:                                               ; preds = %41
  br label %46

46:                                               ; preds = %45
  %47 = load i32, ptr %10, align 4
  %48 = mul nsw i32 %47, 2048
  %49 = load i32, ptr %9, align 4
  %50 = add nsw i32 %48, %49
  %51 = sext i32 %50 to i64
  %52 = load ptr, ptr %8, align 8
  %53 = getelementptr float, ptr %52, i64 %51
  %54 = load float, ptr %53, align 4
  %55 = load i32, ptr %10, align 4
  %56 = mul nsw i32 %55, 2048
  %57 = load i32, ptr %11, align 4
  %58 = add nsw i32 %56, %57
  %59 = sext i32 %58 to i64
  %60 = load ptr, ptr %8, align 8
  %61 = getelementptr float, ptr %60, i64 %59
  %62 = load float, ptr %61, align 4
  %63 = fmul contract float %54, %62
  %64 = load i32, ptr %9, align 4
  %65 = mul nsw i32 %64, 2048
  %66 = load i32, ptr %11, align 4
  %67 = add nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = load ptr, ptr %7, align 8
  %70 = getelementptr float, ptr %69, i64 %68
  %71 = load float, ptr %70, align 4
  %72 = fadd contract float %71, %63
  store float %72, ptr %70, align 4
  br label %73

73:                                               ; preds = %46
  br label %74

74:                                               ; preds = %73
  %75 = load i32, ptr %10, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %10, align 4
  br label %41

77:                                               ; preds = %41
  br label %78

78:                                               ; preds = %77
  %79 = load i32, ptr %9, align 4
  %80 = mul nsw i32 %79, 2048
  %81 = load i32, ptr %11, align 4
  %82 = add nsw i32 %80, %81
  %83 = sext i32 %82 to i64
  %84 = load ptr, ptr %7, align 8
  %85 = getelementptr float, ptr %84, i64 %83
  %86 = load float, ptr %85, align 4
  %87 = load i32, ptr %11, align 4
  %88 = mul nsw i32 %87, 2048
  %89 = load i32, ptr %9, align 4
  %90 = add nsw i32 %88, %89
  %91 = sext i32 %90 to i64
  %92 = load ptr, ptr %7, align 8
  %93 = getelementptr float, ptr %92, i64 %91
  store float %86, ptr %93, align 4
  br label %94

94:                                               ; preds = %78
  br label %95

95:                                               ; preds = %94
  %96 = load i32, ptr %11, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %11, align 4
  br label %27

98:                                               ; preds = %27
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99, %20
  br label %101

101:                                              ; preds = %100
  br label %102

102:                                              ; preds = %101
  call void @llvm.lifetime.end.p0(ptr %11)
  br label %103

103:                                              ; preds = %102
  br label %104

104:                                              ; preds = %103
  br label %105

105:                                              ; preds = %104
  call void @llvm.lifetime.end.p0(ptr %10)
  br label %106

106:                                              ; preds = %105
  br label %107

107:                                              ; preds = %106
  br label %108

108:                                              ; preds = %107
  call void @llvm.lifetime.end.p0(ptr %9)
  br label %109

109:                                              ; preds = %108
  br label %110

110:                                              ; preds = %109
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
