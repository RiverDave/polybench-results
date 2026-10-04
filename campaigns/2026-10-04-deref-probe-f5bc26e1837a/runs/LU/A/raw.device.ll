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
define dso_local ptx_kernel void @_Z10lu_kernel1iPfi(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
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
  %16 = load i32, ptr %6, align 4
  %17 = icmp sgt i32 %15, %16
  br i1 %17, label %18, label %22

18:                                               ; preds = %14
  %19 = load i32, ptr %7, align 4
  %20 = load i32, ptr %4, align 4
  %21 = icmp slt i32 %19, %20
  br label %23

22:                                               ; preds = %14
  br label %23

23:                                               ; preds = %18, %22
  %24 = phi i1 [ false, %22 ], [ %21, %18 ]
  br label %25

25:                                               ; preds = %23
  br i1 %24, label %26, label %51

26:                                               ; preds = %25
  %27 = load i32, ptr %6, align 4
  %28 = mul nsw i32 %27, 2048
  %29 = load i32, ptr %7, align 4
  %30 = add nsw i32 %28, %29
  %31 = sext i32 %30 to i64
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr float, ptr %32, i64 %31
  %34 = load float, ptr %33, align 4
  %35 = load i32, ptr %6, align 4
  %36 = mul nsw i32 %35, 2048
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %36, %37
  %39 = sext i32 %38 to i64
  %40 = load ptr, ptr %5, align 8
  %41 = getelementptr float, ptr %40, i64 %39
  %42 = load float, ptr %41, align 4
  %43 = fdiv contract float %34, %42
  %44 = load i32, ptr %6, align 4
  %45 = mul nsw i32 %44, 2048
  %46 = load i32, ptr %7, align 4
  %47 = add nsw i32 %45, %46
  %48 = sext i32 %47 to i64
  %49 = load ptr, ptr %5, align 8
  %50 = getelementptr float, ptr %49, i64 %48
  store float %43, ptr %50, align 4
  br label %51

51:                                               ; preds = %26, %25
  br label %52

52:                                               ; preds = %51
  br label %53

53:                                               ; preds = %52
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %54

54:                                               ; preds = %53
  br label %55

55:                                               ; preds = %54
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z10lu_kernel1iPfi__noalias(i32 noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
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
  %16 = load i32, ptr %6, align 4
  %17 = icmp sgt i32 %15, %16
  br i1 %17, label %18, label %22

18:                                               ; preds = %14
  %19 = load i32, ptr %7, align 4
  %20 = load i32, ptr %4, align 4
  %21 = icmp slt i32 %19, %20
  br label %23

22:                                               ; preds = %14
  br label %23

23:                                               ; preds = %18, %22
  %24 = phi i1 [ false, %22 ], [ %21, %18 ]
  br label %25

25:                                               ; preds = %23
  br i1 %24, label %26, label %51

26:                                               ; preds = %25
  %27 = load i32, ptr %6, align 4
  %28 = mul nsw i32 %27, 2048
  %29 = load i32, ptr %7, align 4
  %30 = add nsw i32 %28, %29
  %31 = sext i32 %30 to i64
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr float, ptr %32, i64 %31
  %34 = load float, ptr %33, align 4
  %35 = load i32, ptr %6, align 4
  %36 = mul nsw i32 %35, 2048
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %36, %37
  %39 = sext i32 %38 to i64
  %40 = load ptr, ptr %5, align 8
  %41 = getelementptr float, ptr %40, i64 %39
  %42 = load float, ptr %41, align 4
  %43 = fdiv contract float %34, %42
  %44 = load i32, ptr %6, align 4
  %45 = mul nsw i32 %44, 2048
  %46 = load i32, ptr %7, align 4
  %47 = add nsw i32 %45, %46
  %48 = sext i32 %47 to i64
  %49 = load ptr, ptr %5, align 8
  %50 = getelementptr float, ptr %49, i64 %48
  store float %43, ptr %50, align 4
  br label %51

51:                                               ; preds = %26, %25
  br label %52

52:                                               ; preds = %51
  br label %53

53:                                               ; preds = %52
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %54

54:                                               ; preds = %53
  br label %55

55:                                               ; preds = %54
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
define dso_local ptx_kernel void @_Z10lu_kernel2iPfi(i32 noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %9

9:                                                ; preds = %3
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %11 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %12 = mul i32 %10, %11
  %13 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %14 = add i32 %12, %13
  store i32 %14, ptr %7, align 4
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %15

15:                                               ; preds = %9
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %18 = mul i32 %16, %17
  %19 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %20 = add i32 %18, %19
  store i32 %20, ptr %8, align 4
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %8, align 4
  %23 = load i32, ptr %6, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %29

25:                                               ; preds = %21
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %6, align 4
  %28 = icmp sgt i32 %26, %27
  br label %30

29:                                               ; preds = %21
  br label %30

30:                                               ; preds = %25, %29
  %31 = phi i1 [ false, %29 ], [ %28, %25 ]
  br label %32

32:                                               ; preds = %30
  br i1 %31, label %33, label %37

33:                                               ; preds = %32
  %34 = load i32, ptr %8, align 4
  %35 = load i32, ptr %4, align 4
  %36 = icmp slt i32 %34, %35
  br label %38

37:                                               ; preds = %32
  br label %38

38:                                               ; preds = %33, %37
  %39 = phi i1 [ false, %37 ], [ %36, %33 ]
  br label %40

40:                                               ; preds = %38
  br i1 %39, label %41, label %45

41:                                               ; preds = %40
  %42 = load i32, ptr %7, align 4
  %43 = load i32, ptr %4, align 4
  %44 = icmp slt i32 %42, %43
  br label %46

45:                                               ; preds = %40
  br label %46

46:                                               ; preds = %41, %45
  %47 = phi i1 [ false, %45 ], [ %44, %41 ]
  br label %48

48:                                               ; preds = %46
  br i1 %47, label %49, label %83

49:                                               ; preds = %48
  %50 = load i32, ptr %8, align 4
  %51 = mul nsw i32 %50, 2048
  %52 = load i32, ptr %7, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = load i32, ptr %8, align 4
  %59 = mul nsw i32 %58, 2048
  %60 = load i32, ptr %6, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %5, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = load i32, ptr %6, align 4
  %67 = mul nsw i32 %66, 2048
  %68 = load i32, ptr %7, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %5, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fmul contract float %65, %73
  %75 = fsub contract float %57, %74
  %76 = load i32, ptr %8, align 4
  %77 = mul nsw i32 %76, 2048
  %78 = load i32, ptr %7, align 4
  %79 = add nsw i32 %77, %78
  %80 = sext i32 %79 to i64
  %81 = load ptr, ptr %5, align 8
  %82 = getelementptr float, ptr %81, i64 %80
  store float %75, ptr %82, align 4
  br label %83

83:                                               ; preds = %49, %48
  br label %84

84:                                               ; preds = %83
  br label %85

85:                                               ; preds = %84
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %86

86:                                               ; preds = %85
  br label %87

87:                                               ; preds = %86
  br label %88

88:                                               ; preds = %87
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %89

89:                                               ; preds = %88
  br label %90

90:                                               ; preds = %89
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z10lu_kernel2iPfi__noalias(i32 noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %9

9:                                                ; preds = %3
  %10 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #4
  %11 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #4
  %12 = mul i32 %10, %11
  %13 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #4
  %14 = add i32 %12, %13
  store i32 %14, ptr %7, align 4
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %15

15:                                               ; preds = %9
  %16 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #4
  %17 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_yEv() #4
  %18 = mul i32 %16, %17
  %19 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_yEv() #4
  %20 = add i32 %18, %19
  store i32 %20, ptr %8, align 4
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %8, align 4
  %23 = load i32, ptr %6, align 4
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %29

25:                                               ; preds = %21
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %6, align 4
  %28 = icmp sgt i32 %26, %27
  br label %30

29:                                               ; preds = %21
  br label %30

30:                                               ; preds = %25, %29
  %31 = phi i1 [ false, %29 ], [ %28, %25 ]
  br label %32

32:                                               ; preds = %30
  br i1 %31, label %33, label %37

33:                                               ; preds = %32
  %34 = load i32, ptr %8, align 4
  %35 = load i32, ptr %4, align 4
  %36 = icmp slt i32 %34, %35
  br label %38

37:                                               ; preds = %32
  br label %38

38:                                               ; preds = %33, %37
  %39 = phi i1 [ false, %37 ], [ %36, %33 ]
  br label %40

40:                                               ; preds = %38
  br i1 %39, label %41, label %45

41:                                               ; preds = %40
  %42 = load i32, ptr %7, align 4
  %43 = load i32, ptr %4, align 4
  %44 = icmp slt i32 %42, %43
  br label %46

45:                                               ; preds = %40
  br label %46

46:                                               ; preds = %41, %45
  %47 = phi i1 [ false, %45 ], [ %44, %41 ]
  br label %48

48:                                               ; preds = %46
  br i1 %47, label %49, label %83

49:                                               ; preds = %48
  %50 = load i32, ptr %8, align 4
  %51 = mul nsw i32 %50, 2048
  %52 = load i32, ptr %7, align 4
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr float, ptr %55, i64 %54
  %57 = load float, ptr %56, align 4
  %58 = load i32, ptr %8, align 4
  %59 = mul nsw i32 %58, 2048
  %60 = load i32, ptr %6, align 4
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = load ptr, ptr %5, align 8
  %64 = getelementptr float, ptr %63, i64 %62
  %65 = load float, ptr %64, align 4
  %66 = load i32, ptr %6, align 4
  %67 = mul nsw i32 %66, 2048
  %68 = load i32, ptr %7, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %5, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fmul contract float %65, %73
  %75 = fsub contract float %57, %74
  %76 = load i32, ptr %8, align 4
  %77 = mul nsw i32 %76, 2048
  %78 = load i32, ptr %7, align 4
  %79 = add nsw i32 %77, %78
  %80 = sext i32 %79 to i64
  %81 = load ptr, ptr %5, align 8
  %82 = getelementptr float, ptr %81, i64 %80
  store float %75, ptr %82, align 4
  br label %83

83:                                               ; preds = %49, %48
  br label %84

84:                                               ; preds = %83
  br label %85

85:                                               ; preds = %84
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %86

86:                                               ; preds = %85
  br label %87

87:                                               ; preds = %86
  br label %88

88:                                               ; preds = %87
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %89

89:                                               ; preds = %88
  br label %90

90:                                               ; preds = %89
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
