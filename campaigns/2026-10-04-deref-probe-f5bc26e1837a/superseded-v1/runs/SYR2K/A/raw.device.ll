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
define dso_local ptx_kernel void @_Z12syr2k_kerneliiffPfS_S_(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store float %2, ptr %9, align 4
  store float %3, ptr %10, align 4
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  store ptr %6, ptr %13, align 8
  call void @llvm.lifetime.start.p0(ptr %14)
  br label %16

16:                                               ; preds = %7
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
  %30 = icmp slt i32 %29, 1024
  br i1 %30, label %31, label %34

31:                                               ; preds = %28
  %32 = load i32, ptr %14, align 4
  %33 = icmp slt i32 %32, 1024
  br label %35

34:                                               ; preds = %28
  br label %35

35:                                               ; preds = %31, %34
  %36 = phi i1 [ false, %34 ], [ %33, %31 ]
  br label %37

37:                                               ; preds = %35
  br i1 %36, label %38, label %113

38:                                               ; preds = %37
  %39 = load float, ptr %10, align 4
  %40 = load i32, ptr %15, align 4
  %41 = mul nsw i32 %40, 1024
  %42 = load i32, ptr %14, align 4
  %43 = add nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = load ptr, ptr %13, align 8
  %46 = getelementptr float, ptr %45, i64 %44
  %47 = load float, ptr %46, align 4
  %48 = fmul contract float %47, %39
  store float %48, ptr %46, align 4
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %49

49:                                               ; preds = %38
  br label %50

50:                                               ; preds = %49
  store i32 0, ptr %8, align 4
  br label %51

51:                                               ; preds = %105, %50
  %52 = load i32, ptr %8, align 4
  %53 = icmp slt i32 %52, 1024
  br i1 %53, label %54, label %108

54:                                               ; preds = %51
  br label %55

55:                                               ; preds = %54
  %56 = load float, ptr %9, align 4
  %57 = load i32, ptr %15, align 4
  %58 = mul nsw i32 %57, 1024
  %59 = load i32, ptr %8, align 4
  %60 = add nsw i32 %58, %59
  %61 = sext i32 %60 to i64
  %62 = load ptr, ptr %11, align 8
  %63 = getelementptr float, ptr %62, i64 %61
  %64 = load float, ptr %63, align 4
  %65 = fmul contract float %56, %64
  %66 = load i32, ptr %14, align 4
  %67 = mul nsw i32 %66, 1024
  %68 = load i32, ptr %8, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %12, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fmul contract float %65, %73
  %75 = load float, ptr %9, align 4
  %76 = load i32, ptr %15, align 4
  %77 = mul nsw i32 %76, 1024
  %78 = load i32, ptr %8, align 4
  %79 = add nsw i32 %77, %78
  %80 = sext i32 %79 to i64
  %81 = load ptr, ptr %12, align 8
  %82 = getelementptr float, ptr %81, i64 %80
  %83 = load float, ptr %82, align 4
  %84 = fmul contract float %75, %83
  %85 = load i32, ptr %14, align 4
  %86 = mul nsw i32 %85, 1024
  %87 = load i32, ptr %8, align 4
  %88 = add nsw i32 %86, %87
  %89 = sext i32 %88 to i64
  %90 = load ptr, ptr %11, align 8
  %91 = getelementptr float, ptr %90, i64 %89
  %92 = load float, ptr %91, align 4
  %93 = fmul contract float %84, %92
  %94 = fadd contract float %74, %93
  %95 = load i32, ptr %15, align 4
  %96 = mul nsw i32 %95, 1024
  %97 = load i32, ptr %14, align 4
  %98 = add nsw i32 %96, %97
  %99 = sext i32 %98 to i64
  %100 = load ptr, ptr %13, align 8
  %101 = getelementptr float, ptr %100, i64 %99
  %102 = load float, ptr %101, align 4
  %103 = fadd contract float %102, %94
  store float %103, ptr %101, align 4
  br label %104

104:                                              ; preds = %55
  br label %105

105:                                              ; preds = %104
  %106 = load i32, ptr %8, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, ptr %8, align 4
  br label %51

108:                                              ; preds = %51
  br label %109

109:                                              ; preds = %108
  br label %110

110:                                              ; preds = %109
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %111

111:                                              ; preds = %110
  br label %112

112:                                              ; preds = %111
  br label %113

113:                                              ; preds = %112, %37
  br label %114

114:                                              ; preds = %113
  br label %115

115:                                              ; preds = %114
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %116

116:                                              ; preds = %115
  br label %117

117:                                              ; preds = %116
  br label %118

118:                                              ; preds = %117
  call void @llvm.lifetime.end.p0(ptr %14)
  br label %119

119:                                              ; preds = %118
  br label %120

120:                                              ; preds = %119
  ret void
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @_Z12syr2k_kerneliiffPfS_S___noalias(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr noalias noundef %4, ptr noalias noundef %5, ptr noalias noundef %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store float %2, ptr %9, align 4
  store float %3, ptr %10, align 4
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  store ptr %6, ptr %13, align 8
  call void @llvm.lifetime.start.p0(ptr %14)
  br label %16

16:                                               ; preds = %7
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
  %30 = icmp slt i32 %29, 1024
  br i1 %30, label %31, label %34

31:                                               ; preds = %28
  %32 = load i32, ptr %14, align 4
  %33 = icmp slt i32 %32, 1024
  br label %35

34:                                               ; preds = %28
  br label %35

35:                                               ; preds = %31, %34
  %36 = phi i1 [ false, %34 ], [ %33, %31 ]
  br label %37

37:                                               ; preds = %35
  br i1 %36, label %38, label %113

38:                                               ; preds = %37
  %39 = load float, ptr %10, align 4
  %40 = load i32, ptr %15, align 4
  %41 = mul nsw i32 %40, 1024
  %42 = load i32, ptr %14, align 4
  %43 = add nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = load ptr, ptr %13, align 8
  %46 = getelementptr float, ptr %45, i64 %44
  %47 = load float, ptr %46, align 4
  %48 = fmul contract float %47, %39
  store float %48, ptr %46, align 4
  call void @llvm.lifetime.start.p0(ptr %8)
  br label %49

49:                                               ; preds = %38
  br label %50

50:                                               ; preds = %49
  store i32 0, ptr %8, align 4
  br label %51

51:                                               ; preds = %105, %50
  %52 = load i32, ptr %8, align 4
  %53 = icmp slt i32 %52, 1024
  br i1 %53, label %54, label %108

54:                                               ; preds = %51
  br label %55

55:                                               ; preds = %54
  %56 = load float, ptr %9, align 4
  %57 = load i32, ptr %15, align 4
  %58 = mul nsw i32 %57, 1024
  %59 = load i32, ptr %8, align 4
  %60 = add nsw i32 %58, %59
  %61 = sext i32 %60 to i64
  %62 = load ptr, ptr %11, align 8
  %63 = getelementptr float, ptr %62, i64 %61
  %64 = load float, ptr %63, align 4
  %65 = fmul contract float %56, %64
  %66 = load i32, ptr %14, align 4
  %67 = mul nsw i32 %66, 1024
  %68 = load i32, ptr %8, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %12, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fmul contract float %65, %73
  %75 = load float, ptr %9, align 4
  %76 = load i32, ptr %15, align 4
  %77 = mul nsw i32 %76, 1024
  %78 = load i32, ptr %8, align 4
  %79 = add nsw i32 %77, %78
  %80 = sext i32 %79 to i64
  %81 = load ptr, ptr %12, align 8
  %82 = getelementptr float, ptr %81, i64 %80
  %83 = load float, ptr %82, align 4
  %84 = fmul contract float %75, %83
  %85 = load i32, ptr %14, align 4
  %86 = mul nsw i32 %85, 1024
  %87 = load i32, ptr %8, align 4
  %88 = add nsw i32 %86, %87
  %89 = sext i32 %88 to i64
  %90 = load ptr, ptr %11, align 8
  %91 = getelementptr float, ptr %90, i64 %89
  %92 = load float, ptr %91, align 4
  %93 = fmul contract float %84, %92
  %94 = fadd contract float %74, %93
  %95 = load i32, ptr %15, align 4
  %96 = mul nsw i32 %95, 1024
  %97 = load i32, ptr %14, align 4
  %98 = add nsw i32 %96, %97
  %99 = sext i32 %98 to i64
  %100 = load ptr, ptr %13, align 8
  %101 = getelementptr float, ptr %100, i64 %99
  %102 = load float, ptr %101, align 4
  %103 = fadd contract float %102, %94
  store float %103, ptr %101, align 4
  br label %104

104:                                              ; preds = %55
  br label %105

105:                                              ; preds = %104
  %106 = load i32, ptr %8, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, ptr %8, align 4
  br label %51

108:                                              ; preds = %51
  br label %109

109:                                              ; preds = %108
  br label %110

110:                                              ; preds = %109
  call void @llvm.lifetime.end.p0(ptr %8)
  br label %111

111:                                              ; preds = %110
  br label %112

112:                                              ; preds = %111
  br label %113

113:                                              ; preds = %112, %37
  br label %114

114:                                              ; preds = %113
  br label %115

115:                                              ; preds = %114
  call void @llvm.lifetime.end.p0(ptr %15)
  br label %116

116:                                              ; preds = %115
  br label %117

117:                                              ; preds = %116
  br label %118

118:                                              ; preds = %117
  call void @llvm.lifetime.end.p0(ptr %14)
  br label %119

119:                                              ; preds = %118
  br label %120

120:                                              ; preds = %119
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
