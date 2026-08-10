; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/2DCONV/2DConvolution.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/2DCONV/2DConvolution.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z20convolution2D_kerneliiPfS_(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef writeonly captures(none) %3) local_unnamed_addr #0 {
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %6 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %7 = mul i32 %5, %6
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = add i32 %7, %8
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %11 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %12 = mul nuw nsw i32 %10, %11
  %13 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %14 = add nuw nsw i32 %12, %13
  %15 = add nsw i32 %0, -1
  %16 = icmp slt i32 %14, %15
  %17 = add nsw i32 %1, -1
  %18 = icmp slt i32 %9, %17
  %19 = select i1 %16, i1 %18, i1 false
  %20 = icmp ne i32 %14, 0
  %21 = and i1 %20, %19
  %22 = icmp sgt i32 %9, 0
  %23 = and i1 %22, %21
  br i1 %23, label %24, label %84

24:                                               ; preds = %4
  %25 = shl i32 %14, 12
  %26 = add i32 %25, -4096
  %27 = add nsw i32 %9, -1
  %28 = add nuw nsw i32 %26, %27
  %29 = zext nneg i32 %28 to i64
  %30 = getelementptr [4 x i8], ptr %2, i64 %29
  %31 = load float, ptr %30, align 4
  %32 = fmul float %31, 2.000000e-01
  %33 = add nuw nsw i32 %26, %9
  %34 = zext nneg i32 %33 to i64
  %35 = getelementptr [4 x i8], ptr %2, i64 %34
  %36 = load float, ptr %35, align 4
  %37 = fmul float %36, 5.000000e-01
  %38 = fadd float %32, %37
  %39 = add nuw nsw i32 %9, 1
  %40 = add nuw nsw i32 %26, %39
  %41 = zext nneg i32 %40 to i64
  %42 = getelementptr [4 x i8], ptr %2, i64 %41
  %43 = load float, ptr %42, align 4
  %44 = fmul float %43, 8.000000e-01
  %45 = fsub float %38, %44
  %46 = add nuw nsw i32 %25, %27
  %47 = zext nneg i32 %46 to i64
  %48 = getelementptr [4 x i8], ptr %2, i64 %47
  %49 = load float, ptr %48, align 4
  %50 = fmul float %49, 3.000000e-01
  %51 = fsub float %45, %50
  %52 = add nuw nsw i32 %25, %9
  %53 = zext nneg i32 %52 to i64
  %54 = getelementptr [4 x i8], ptr %2, i64 %53
  %55 = load float, ptr %54, align 4
  %56 = fmul float %55, 6.000000e-01
  %57 = fadd float %51, %56
  %58 = add nuw nsw i32 %25, %39
  %59 = zext nneg i32 %58 to i64
  %60 = getelementptr [4 x i8], ptr %2, i64 %59
  %61 = load float, ptr %60, align 4
  %62 = fmul float %61, f0x3F666666
  %63 = fsub float %57, %62
  %64 = add i32 %25, 4096
  %65 = add nuw nsw i32 %64, %27
  %66 = zext nneg i32 %65 to i64
  %67 = getelementptr [4 x i8], ptr %2, i64 %66
  %68 = load float, ptr %67, align 4
  %69 = fmul float %68, 4.000000e-01
  %70 = fadd float %63, %69
  %71 = add nuw nsw i32 %64, %9
  %72 = zext nneg i32 %71 to i64
  %73 = getelementptr [4 x i8], ptr %2, i64 %72
  %74 = load float, ptr %73, align 4
  %75 = fmul float %74, f0x3F333333
  %76 = fadd float %70, %75
  %77 = add nuw nsw i32 %64, %39
  %78 = zext nneg i32 %77 to i64
  %79 = getelementptr [4 x i8], ptr %2, i64 %78
  %80 = load float, ptr %79, align 4
  %81 = fmul float %80, 1.000000e-01
  %82 = fadd float %76, %81
  %83 = getelementptr [4 x i8], ptr %3, i64 %53
  store float %82, ptr %83, align 4
  br label %84

84:                                               ; preds = %4, %24
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
