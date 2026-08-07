; ModuleID = '/Users/davidfeliperiveraguerra/dev/polybench-results/ir-compare/gemm_minimal.cpp'
source_filename = "/Users/davidfeliperiveraguerra/dev/polybench-results/ir-compare/gemm_minimal.cpp"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: convergent noinline
define internal noundef i32 @_ZL8block_idj(i32 noundef %0) #0 {
  %2 = alloca i32, i64 1, align 4
  %3 = alloca i32, i64 1, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  br label %10

8:                                                ; preds = %1
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  br label %10

10:                                               ; preds = %6, %8
  %11 = phi i32 [ %9, %8 ], [ %7, %6 ]
  br label %12

12:                                               ; preds = %10
  store i32 %11, ptr %3, align 4
  %13 = load i32, ptr %3, align 4
  ret i32 %13
}

; Function Attrs: convergent noinline
define internal noundef i32 @_ZL10block_sizej(i32 noundef %0) #0 {
  %2 = alloca i32, i64 1, align 4
  %3 = alloca i32, i64 1, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  br label %10

8:                                                ; preds = %1
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  br label %10

10:                                               ; preds = %6, %8
  %11 = phi i32 [ %9, %8 ], [ %7, %6 ]
  br label %12

12:                                               ; preds = %10
  store i32 %11, ptr %3, align 4
  %13 = load i32, ptr %3, align 4
  ret i32 %13
}

; Function Attrs: convergent noinline
define internal noundef i32 @_ZL9thread_idj(i32 noundef %0) #0 {
  %2 = alloca i32, i64 1, align 4
  %3 = alloca i32, i64 1, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  br label %10

8:                                                ; preds = %1
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  br label %10

10:                                               ; preds = %6, %8
  %11 = phi i32 [ %9, %8 ], [ %7, %6 ]
  br label %12

12:                                               ; preds = %10
  store i32 %11, ptr %3, align 4
  %13 = load i32, ptr %3, align 4
  ret i32 %13
}

; Function Attrs: convergent noinline
define dso_local ptx_kernel void @gemm_kernel(i32 noundef %0, i32 noundef %1, i32 noundef %2, float noundef %3, float noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7) #0 {
  %9 = alloca i32, i64 1, align 4
  %10 = alloca i32, i64 1, align 4
  %11 = alloca i32, i64 1, align 4
  %12 = alloca i32, i64 1, align 4
  %13 = alloca float, i64 1, align 4
  %14 = alloca float, i64 1, align 4
  %15 = alloca ptr, i64 1, align 8
  %16 = alloca ptr, i64 1, align 8
  %17 = alloca ptr, i64 1, align 8
  %18 = alloca i32, i64 1, align 4
  %19 = alloca i32, i64 1, align 4
  %20 = alloca i32, i64 1, align 4
  store i32 %0, ptr %10, align 4
  store i32 %1, ptr %11, align 4
  store i32 %2, ptr %12, align 4
  store float %3, ptr %13, align 4
  store float %4, ptr %14, align 4
  store ptr %5, ptr %15, align 8
  store ptr %6, ptr %16, align 8
  store ptr %7, ptr %17, align 8
  %21 = call noundef i32 @_ZL8block_idj(i32 noundef 0) #2
  %22 = call noundef i32 @_ZL10block_sizej(i32 noundef 0) #2
  %23 = mul i32 %21, %22
  %24 = call noundef i32 @_ZL9thread_idj(i32 noundef 0) #2
  %25 = add i32 %23, %24
  store i32 %25, ptr %18, align 4
  %26 = call noundef i32 @_ZL8block_idj(i32 noundef 1) #2
  %27 = call noundef i32 @_ZL10block_sizej(i32 noundef 1) #2
  %28 = mul i32 %26, %27
  %29 = call noundef i32 @_ZL9thread_idj(i32 noundef 1) #2
  %30 = add i32 %28, %29
  store i32 %30, ptr %19, align 4
  br label %31

31:                                               ; preds = %8
  %32 = load i32, ptr %19, align 4
  %33 = load i32, ptr %10, align 4
  %34 = icmp sge i32 %32, %33
  br i1 %34, label %35, label %36

35:                                               ; preds = %31
  br label %40

36:                                               ; preds = %31
  %37 = load i32, ptr %18, align 4
  %38 = load i32, ptr %11, align 4
  %39 = icmp sge i32 %37, %38
  br label %40

40:                                               ; preds = %35, %36
  %41 = phi i1 [ %39, %36 ], [ true, %35 ]
  br label %42

42:                                               ; preds = %40
  br i1 %41, label %43, label %44

43:                                               ; preds = %42
  ret void

44:                                               ; preds = %42
  br label %45

45:                                               ; preds = %44
  %46 = load i32, ptr %19, align 4
  %47 = load i32, ptr %11, align 4
  %48 = mul nsw i32 %46, %47
  %49 = load i32, ptr %18, align 4
  %50 = add nsw i32 %48, %49
  store i32 %50, ptr %20, align 4
  %51 = load float, ptr %14, align 4
  %52 = load i32, ptr %20, align 4
  %53 = sext i32 %52 to i64
  %54 = load ptr, ptr %17, align 8
  %55 = getelementptr float, ptr %54, i64 %53
  %56 = load float, ptr %55, align 4
  %57 = fmul float %56, %51
  store float %57, ptr %55, align 4
  br label %58

58:                                               ; preds = %45
  store i32 0, ptr %9, align 4
  br label %59

59:                                               ; preds = %91, %58
  %60 = load i32, ptr %9, align 4
  %61 = load i32, ptr %12, align 4
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %63, label %94

63:                                               ; preds = %59
  %64 = load float, ptr %13, align 4
  %65 = load i32, ptr %19, align 4
  %66 = load i32, ptr %12, align 4
  %67 = mul nsw i32 %65, %66
  %68 = load i32, ptr %9, align 4
  %69 = add nsw i32 %67, %68
  %70 = sext i32 %69 to i64
  %71 = load ptr, ptr %15, align 8
  %72 = getelementptr float, ptr %71, i64 %70
  %73 = load float, ptr %72, align 4
  %74 = fmul float %64, %73
  %75 = load i32, ptr %9, align 4
  %76 = load i32, ptr %11, align 4
  %77 = mul nsw i32 %75, %76
  %78 = load i32, ptr %18, align 4
  %79 = add nsw i32 %77, %78
  %80 = sext i32 %79 to i64
  %81 = load ptr, ptr %16, align 8
  %82 = getelementptr float, ptr %81, i64 %80
  %83 = load float, ptr %82, align 4
  %84 = fmul float %74, %83
  %85 = load i32, ptr %20, align 4
  %86 = sext i32 %85 to i64
  %87 = load ptr, ptr %17, align 8
  %88 = getelementptr float, ptr %87, i64 %86
  %89 = load float, ptr %88, align 4
  %90 = fadd float %89, %84
  store float %90, ptr %88, align 4
  br label %91

91:                                               ; preds = %63
  %92 = load i32, ptr %9, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, ptr %9, align 4
  br label %59

94:                                               ; preds = %59
  br label %95

95:                                               ; preds = %94
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { convergent noinline "target-cpu"="sm_90" "target-features"="+sm_90" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { convergent }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
