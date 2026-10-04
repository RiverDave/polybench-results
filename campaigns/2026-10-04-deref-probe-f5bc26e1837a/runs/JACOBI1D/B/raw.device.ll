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
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel1iPfS_(i32 noundef %0, ptr noundef dereferenceable(16384) %1, ptr noundef dereferenceable(16384) %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %8

8:                                                ; preds = %3
  %9 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %11 = mul i32 %9, %10
  %12 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %13 = add i32 %11, %12
  store i32 %13, ptr %7, align 4
  br label %14

14:                                               ; preds = %8
  %15 = load i32, ptr %7, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %22

17:                                               ; preds = %14
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %4, align 4
  %20 = sub nsw i32 %19, 1
  %21 = icmp slt i32 %18, %20
  br label %23

22:                                               ; preds = %14
  br label %23

23:                                               ; preds = %17, %22
  %24 = phi i1 [ false, %22 ], [ %21, %17 ]
  br label %25

25:                                               ; preds = %23
  br i1 %24, label %26, label %53

26:                                               ; preds = %25
  %27 = load i32, ptr %7, align 4
  %28 = sub nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr float, ptr %30, i64 %29
  %32 = load float, ptr %31, align 4
  %33 = load i32, ptr %7, align 4
  %34 = sext i32 %33 to i64
  %35 = load ptr, ptr %5, align 8
  %36 = getelementptr float, ptr %35, i64 %34
  %37 = load float, ptr %36, align 4
  %38 = fadd contract float %32, %37
  %39 = load i32, ptr %7, align 4
  %40 = add nsw i32 %39, 1
  %41 = sext i32 %40 to i64
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr float, ptr %42, i64 %41
  %44 = load float, ptr %43, align 4
  %45 = fadd contract float %38, %44
  %46 = fpext float %45 to double
  %47 = fmul contract double 3.333300e-01, %46
  %48 = fptrunc double %47 to float
  %49 = load i32, ptr %7, align 4
  %50 = sext i32 %49 to i64
  %51 = load ptr, ptr %6, align 8
  %52 = getelementptr float, ptr %51, i64 %50
  store float %48, ptr %52, align 4
  br label %53

53:                                               ; preds = %26, %25
  br label %54

54:                                               ; preds = %53
  br label %55

55:                                               ; preds = %54
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %56

56:                                               ; preds = %55
  br label %57

57:                                               ; preds = %56
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel1iPfS___noalias(i32 noundef %0, ptr noalias noundef dereferenceable(16384) %1, ptr noalias noundef dereferenceable(16384) %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %8

8:                                                ; preds = %3
  %9 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %11 = mul i32 %9, %10
  %12 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %13 = add i32 %11, %12
  store i32 %13, ptr %7, align 4
  br label %14

14:                                               ; preds = %8
  %15 = load i32, ptr %7, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %22

17:                                               ; preds = %14
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %4, align 4
  %20 = sub nsw i32 %19, 1
  %21 = icmp slt i32 %18, %20
  br label %23

22:                                               ; preds = %14
  br label %23

23:                                               ; preds = %17, %22
  %24 = phi i1 [ false, %22 ], [ %21, %17 ]
  br label %25

25:                                               ; preds = %23
  br i1 %24, label %26, label %53

26:                                               ; preds = %25
  %27 = load i32, ptr %7, align 4
  %28 = sub nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr float, ptr %30, i64 %29
  %32 = load float, ptr %31, align 4
  %33 = load i32, ptr %7, align 4
  %34 = sext i32 %33 to i64
  %35 = load ptr, ptr %5, align 8
  %36 = getelementptr float, ptr %35, i64 %34
  %37 = load float, ptr %36, align 4
  %38 = fadd contract float %32, %37
  %39 = load i32, ptr %7, align 4
  %40 = add nsw i32 %39, 1
  %41 = sext i32 %40 to i64
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr float, ptr %42, i64 %41
  %44 = load float, ptr %43, align 4
  %45 = fadd contract float %38, %44
  %46 = fpext float %45 to double
  %47 = fmul contract double 3.333300e-01, %46
  %48 = fptrunc double %47 to float
  %49 = load i32, ptr %7, align 4
  %50 = sext i32 %49 to i64
  %51 = load ptr, ptr %6, align 8
  %52 = getelementptr float, ptr %51, i64 %50
  store float %48, ptr %52, align 4
  br label %53

53:                                               ; preds = %26, %25
  br label %54

54:                                               ; preds = %53
  br label %55

55:                                               ; preds = %54
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %56

56:                                               ; preds = %55
  br label %57

57:                                               ; preds = %56
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
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel2iPfS_(i32 noundef %0, ptr noundef dereferenceable(16384) %1, ptr noundef dereferenceable(16384) %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %8

8:                                                ; preds = %3
  %9 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %11 = mul i32 %9, %10
  %12 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %13 = add i32 %11, %12
  store i32 %13, ptr %7, align 4
  br label %14

14:                                               ; preds = %8
  %15 = load i32, ptr %7, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %22

17:                                               ; preds = %14
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %4, align 4
  %20 = sub nsw i32 %19, 1
  %21 = icmp slt i32 %18, %20
  br label %23

22:                                               ; preds = %14
  br label %23

23:                                               ; preds = %17, %22
  %24 = phi i1 [ false, %22 ], [ %21, %17 ]
  br label %25

25:                                               ; preds = %23
  br i1 %24, label %26, label %36

26:                                               ; preds = %25
  %27 = load i32, ptr %7, align 4
  %28 = sext i32 %27 to i64
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr float, ptr %29, i64 %28
  %31 = load float, ptr %30, align 4
  %32 = load i32, ptr %7, align 4
  %33 = sext i32 %32 to i64
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr float, ptr %34, i64 %33
  store float %31, ptr %35, align 4
  br label %36

36:                                               ; preds = %26, %25
  br label %37

37:                                               ; preds = %36
  br label %38

38:                                               ; preds = %37
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %39

39:                                               ; preds = %38
  br label %40

40:                                               ; preds = %39
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel2iPfS___noalias(i32 noundef %0, ptr noalias noundef dereferenceable(16384) %1, ptr noalias noundef dereferenceable(16384) %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %8

8:                                                ; preds = %3
  %9 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %11 = mul i32 %9, %10
  %12 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %13 = add i32 %11, %12
  store i32 %13, ptr %7, align 4
  br label %14

14:                                               ; preds = %8
  %15 = load i32, ptr %7, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %22

17:                                               ; preds = %14
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %4, align 4
  %20 = sub nsw i32 %19, 1
  %21 = icmp slt i32 %18, %20
  br label %23

22:                                               ; preds = %14
  br label %23

23:                                               ; preds = %17, %22
  %24 = phi i1 [ false, %22 ], [ %21, %17 ]
  br label %25

25:                                               ; preds = %23
  br i1 %24, label %26, label %36

26:                                               ; preds = %25
  %27 = load i32, ptr %7, align 4
  %28 = sext i32 %27 to i64
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr float, ptr %29, i64 %28
  %31 = load float, ptr %30, align 4
  %32 = load i32, ptr %7, align 4
  %33 = sext i32 %32 to i64
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr float, ptr %34, i64 %33
  store float %31, ptr %35, align 4
  br label %36

36:                                               ; preds = %26, %25
  br label %37

37:                                               ; preds = %36
  br label %38

38:                                               ; preds = %37
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %39

39:                                               ; preds = %38
  br label %40

40:                                               ; preds = %39
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
