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
define dso_local ptx_kernel void @_Z11syrk_kerneliiffPfS_(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr noundef dereferenceable(4194304) %4, ptr noundef dereferenceable(4194304) %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store float %2, ptr %10, align 4
  store float %3, ptr %11, align 4
  store ptr %4, ptr %12, align 8
  store ptr %5, ptr %13, align 8
  call void @llvm.lifetime.start.p0(ptr %14)
  br label %16

16:                                               ; preds = %6
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
  %34 = load i32, ptr %8, align 4
  %35 = icmp slt i32 %33, %34
  br label %37

36:                                               ; preds = %28
  br label %37

37:                                               ; preds = %32, %36
  %38 = phi i1 [ false, %36 ], [ %35, %32 ]
  br label %39

39:                                               ; preds = %37
  br i1 %38, label %40, label %96

40:                                               ; preds = %39
  %41 = load float, ptr %11, align 4
  %42 = load i32, ptr %15, align 4
  %43 = mul nsw i32 %42, 1024
  %44 = load i32, ptr %14, align 4
  %45 = add nsw i32 %43, %44
  %46 = sext i32 %45 to i64
  %47 = load ptr, ptr %13, align 8
  %48 = getelementptr float, ptr %47, i64 %46
  %49 = load float, ptr %48, align 4
  %50 = fmul contract float %49, %41
  store float %50, ptr %48, align 4
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %51

51:                                               ; preds = %40
  br label %52

52:                                               ; preds = %51
  store i32 0, ptr %7, align 4
  br label %53

53:                                               ; preds = %88, %52
  %54 = load i32, ptr %7, align 4
  %55 = load i32, ptr %9, align 4
  %56 = icmp slt i32 %54, %55
  br i1 %56, label %57, label %91

57:                                               ; preds = %53
  br label %58

58:                                               ; preds = %57
  %59 = load float, ptr %10, align 4
  %60 = load i32, ptr %15, align 4
  %61 = mul nsw i32 %60, 1024
  %62 = load i32, ptr %7, align 4
  %63 = add nsw i32 %61, %62
  %64 = sext i32 %63 to i64
  %65 = load ptr, ptr %12, align 8
  %66 = getelementptr float, ptr %65, i64 %64
  %67 = load float, ptr %66, align 4
  %68 = fmul contract float %59, %67
  %69 = load i32, ptr %14, align 4
  %70 = mul nsw i32 %69, 1024
  %71 = load i32, ptr %7, align 4
  %72 = add nsw i32 %70, %71
  %73 = sext i32 %72 to i64
  %74 = load ptr, ptr %12, align 8
  %75 = getelementptr float, ptr %74, i64 %73
  %76 = load float, ptr %75, align 4
  %77 = fmul contract float %68, %76
  %78 = load i32, ptr %15, align 4
  %79 = mul nsw i32 %78, 1024
  %80 = load i32, ptr %14, align 4
  %81 = add nsw i32 %79, %80
  %82 = sext i32 %81 to i64
  %83 = load ptr, ptr %13, align 8
  %84 = getelementptr float, ptr %83, i64 %82
  %85 = load float, ptr %84, align 4
  %86 = fadd contract float %85, %77
  store float %86, ptr %84, align 4
  br label %87

87:                                               ; preds = %58
  br label %88

88:                                               ; preds = %87
  %89 = load i32, ptr %7, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, ptr %7, align 4
  br label %53

91:                                               ; preds = %53
  br label %92

92:                                               ; preds = %91
  br label %93

93:                                               ; preds = %92
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %94

94:                                               ; preds = %93
  br label %95

95:                                               ; preds = %94
  br label %96

96:                                               ; preds = %95, %39
  br label %97

97:                                               ; preds = %96
  br label %98

98:                                               ; preds = %97
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  br label %101

101:                                              ; preds = %100
  call void @llvm.lifetime.end.p0(ptr %14)
  br label %102

102:                                              ; preds = %101
  br label %103

103:                                              ; preds = %102
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z11syrk_kerneliiffPfS___noalias(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr noalias noundef dereferenceable(4194304) %4, ptr noalias noundef dereferenceable(4194304) %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store float %2, ptr %10, align 4
  store float %3, ptr %11, align 4
  store ptr %4, ptr %12, align 8
  store ptr %5, ptr %13, align 8
  call void @llvm.lifetime.start.p0(ptr %14)
  br label %16

16:                                               ; preds = %6
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
  %34 = load i32, ptr %8, align 4
  %35 = icmp slt i32 %33, %34
  br label %37

36:                                               ; preds = %28
  br label %37

37:                                               ; preds = %32, %36
  %38 = phi i1 [ false, %36 ], [ %35, %32 ]
  br label %39

39:                                               ; preds = %37
  br i1 %38, label %40, label %96

40:                                               ; preds = %39
  %41 = load float, ptr %11, align 4
  %42 = load i32, ptr %15, align 4
  %43 = mul nsw i32 %42, 1024
  %44 = load i32, ptr %14, align 4
  %45 = add nsw i32 %43, %44
  %46 = sext i32 %45 to i64
  %47 = load ptr, ptr %13, align 8
  %48 = getelementptr float, ptr %47, i64 %46
  %49 = load float, ptr %48, align 4
  %50 = fmul contract float %49, %41
  store float %50, ptr %48, align 4
  call void @llvm.lifetime.start.p0(ptr %7)
  br label %51

51:                                               ; preds = %40
  br label %52

52:                                               ; preds = %51
  store i32 0, ptr %7, align 4
  br label %53

53:                                               ; preds = %88, %52
  %54 = load i32, ptr %7, align 4
  %55 = load i32, ptr %9, align 4
  %56 = icmp slt i32 %54, %55
  br i1 %56, label %57, label %91

57:                                               ; preds = %53
  br label %58

58:                                               ; preds = %57
  %59 = load float, ptr %10, align 4
  %60 = load i32, ptr %15, align 4
  %61 = mul nsw i32 %60, 1024
  %62 = load i32, ptr %7, align 4
  %63 = add nsw i32 %61, %62
  %64 = sext i32 %63 to i64
  %65 = load ptr, ptr %12, align 8
  %66 = getelementptr float, ptr %65, i64 %64
  %67 = load float, ptr %66, align 4
  %68 = fmul contract float %59, %67
  %69 = load i32, ptr %14, align 4
  %70 = mul nsw i32 %69, 1024
  %71 = load i32, ptr %7, align 4
  %72 = add nsw i32 %70, %71
  %73 = sext i32 %72 to i64
  %74 = load ptr, ptr %12, align 8
  %75 = getelementptr float, ptr %74, i64 %73
  %76 = load float, ptr %75, align 4
  %77 = fmul contract float %68, %76
  %78 = load i32, ptr %15, align 4
  %79 = mul nsw i32 %78, 1024
  %80 = load i32, ptr %14, align 4
  %81 = add nsw i32 %79, %80
  %82 = sext i32 %81 to i64
  %83 = load ptr, ptr %13, align 8
  %84 = getelementptr float, ptr %83, i64 %82
  %85 = load float, ptr %84, align 4
  %86 = fadd contract float %85, %77
  store float %86, ptr %84, align 4
  br label %87

87:                                               ; preds = %58
  br label %88

88:                                               ; preds = %87
  %89 = load i32, ptr %7, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, ptr %7, align 4
  br label %53

91:                                               ; preds = %53
  br label %92

92:                                               ; preds = %91
  br label %93

93:                                               ; preds = %92
  call void @llvm.lifetime.end.p0(ptr %7)
  br label %94

94:                                               ; preds = %93
  br label %95

95:                                               ; preds = %94
  br label %96

96:                                               ; preds = %95, %39
  br label %97

97:                                               ; preds = %96
  br label %98

98:                                               ; preds = %97
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  br label %101

101:                                              ; preds = %100
  call void @llvm.lifetime.end.p0(ptr %14)
  br label %102

102:                                              ; preds = %101
  br label %103

103:                                              ; preds = %102
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
