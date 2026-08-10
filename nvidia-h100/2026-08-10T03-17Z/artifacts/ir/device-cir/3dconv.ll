; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/3DCONV/3DConvolution.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/3DCONV/3DConvolution.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z20convolution3D_kerneliiiPfS_i(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef writeonly captures(none) %4, i32 noundef %5) local_unnamed_addr #0 {
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %9 = mul i32 %7, %8
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %11 = add i32 %9, %10
  %12 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %13 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %14 = mul nuw nsw i32 %12, %13
  %15 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %16 = add nuw nsw i32 %14, %15
  %17 = add nsw i32 %0, -1
  %18 = icmp slt i32 %5, %17
  %19 = add nsw i32 %1, -1
  %20 = icmp slt i32 %16, %19
  %21 = select i1 %18, i1 %20, i1 false
  %22 = add nsw i32 %2, -1
  %23 = icmp slt i32 %11, %22
  %24 = select i1 %21, i1 %23, i1 false
  %25 = icmp sgt i32 %5, 0
  %26 = and i1 %25, %24
  %27 = icmp ne i32 %16, 0
  %28 = and i1 %27, %26
  %29 = icmp sgt i32 %11, 0
  %30 = and i1 %29, %28
  br i1 %30, label %31, label %119

31:                                               ; preds = %6
  %32 = shl i32 %5, 16
  %33 = add i32 %32, -65536
  %34 = shl i32 %16, 8
  %35 = add i32 %34, -256
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %11, -1
  %38 = add nsw i32 %36, %37
  %39 = sext i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr %3, i64 %39
  %41 = load float, ptr %40, align 4
  %42 = fmul float %41, 2.000000e+00
  %43 = add i32 %32, 65536
  %44 = add nsw i32 %43, %35
  %45 = add nsw i32 %44, %37
  %46 = sext i32 %45 to i64
  %47 = getelementptr [4 x i8], ptr %3, i64 %46
  %48 = load float, ptr %47, align 4
  %49 = fmul float %48, 4.000000e+00
  %50 = fadd float %42, %49
  %51 = fmul float %41, 5.000000e+00
  %52 = fadd float %51, %50
  %53 = fmul float %48, 7.000000e+00
  %54 = fadd float %53, %52
  %55 = fmul float %41, 8.000000e+00
  %56 = fsub float %54, %55
  %57 = fmul float %48, 1.000000e+01
  %58 = fadd float %57, %56
  %59 = add i32 %11, %32
  %60 = add i32 %59, %35
  %61 = sext i32 %60 to i64
  %62 = getelementptr [4 x i8], ptr %3, i64 %61
  %63 = load float, ptr %62, align 4
  %64 = fmul float %63, 3.000000e+00
  %65 = fsub float %58, %64
  %66 = add nuw nsw i32 %59, %34
  %67 = zext nneg i32 %66 to i64
  %68 = getelementptr [4 x i8], ptr %3, i64 %67
  %69 = load float, ptr %68, align 4
  %70 = fmul float %69, 6.000000e+00
  %71 = fadd float %70, %65
  %72 = add i32 %34, 256
  %73 = add i32 %59, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr [4 x i8], ptr %3, i64 %74
  %76 = load float, ptr %75, align 4
  %77 = fmul float %76, 9.000000e+00
  %78 = fsub float %71, %77
  %79 = add nuw nsw i32 %11, 1
  %80 = add nsw i32 %36, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr [4 x i8], ptr %3, i64 %81
  %83 = load float, ptr %82, align 4
  %84 = fmul float %83, 2.000000e+00
  %85 = fadd float %84, %78
  %86 = add nsw i32 %44, %79
  %87 = sext i32 %86 to i64
  %88 = getelementptr [4 x i8], ptr %3, i64 %87
  %89 = load float, ptr %88, align 4
  %90 = fmul float %89, 4.000000e+00
  %91 = fadd float %90, %85
  %92 = add i32 %79, %33
  %93 = add i32 %92, %34
  %94 = sext i32 %93 to i64
  %95 = getelementptr [4 x i8], ptr %3, i64 %94
  %96 = load float, ptr %95, align 4
  %97 = fmul float %96, 5.000000e+00
  %98 = fadd float %97, %91
  %99 = add i32 %79, %43
  %100 = add i32 %99, %34
  %101 = sext i32 %100 to i64
  %102 = getelementptr [4 x i8], ptr %3, i64 %101
  %103 = load float, ptr %102, align 4
  %104 = fmul float %103, 7.000000e+00
  %105 = fadd float %104, %98
  %106 = add i32 %92, %72
  %107 = sext i32 %106 to i64
  %108 = getelementptr [4 x i8], ptr %3, i64 %107
  %109 = load float, ptr %108, align 4
  %110 = fmul float %109, 8.000000e+00
  %111 = fsub float %105, %110
  %112 = add i32 %99, %72
  %113 = sext i32 %112 to i64
  %114 = getelementptr [4 x i8], ptr %3, i64 %113
  %115 = load float, ptr %114, align 4
  %116 = fmul float %115, 1.000000e+01
  %117 = fadd float %116, %111
  %118 = getelementptr [4 x i8], ptr %4, i64 %67
  store float %117, ptr %118, align 4
  br label %119

119:                                              ; preds = %6, %31
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}
!nvvmir.version = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!2 = !{i32 2, i32 0}
