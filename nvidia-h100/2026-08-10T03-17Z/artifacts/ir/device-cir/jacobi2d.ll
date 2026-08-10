; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/JACOBI2D/jacobi2D.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/JACOBI2D/jacobi2D.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel1iPfS_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef writeonly captures(none) %2) local_unnamed_addr #0 {
  %4 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %6 = mul nuw nsw i32 %4, %5
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %8 = add nuw nsw i32 %6, %7
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %11 = mul i32 %9, %10
  %12 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %13 = add i32 %11, %12
  %14 = icmp ne i32 %8, 0
  %15 = add nsw i32 %0, -1
  %16 = icmp slt i32 %8, %15
  %17 = select i1 %14, i1 %16, i1 false
  %18 = icmp sgt i32 %13, 0
  %19 = and i1 %18, %17
  %20 = icmp slt i32 %13, %15
  %21 = select i1 %19, i1 %20, i1 false
  br i1 %21, label %22, label %54

22:                                               ; preds = %3
  %23 = mul nuw nsw i32 %8, 1000
  %24 = add nuw nsw i32 %23, %13
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %1, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = add nsw i32 %13, -1
  %29 = add nuw nsw i32 %28, %23
  %30 = zext nneg i32 %29 to i64
  %31 = getelementptr [4 x i8], ptr %1, i64 %30
  %32 = load float, ptr %31, align 4
  %33 = fadd float %27, %32
  %34 = add nuw nsw i32 %13, 1
  %35 = add nuw nsw i32 %34, %23
  %36 = zext nneg i32 %35 to i64
  %37 = getelementptr [4 x i8], ptr %1, i64 %36
  %38 = load float, ptr %37, align 4
  %39 = fadd float %33, %38
  %40 = add nuw i32 %13, 1000
  %41 = add nuw i32 %40, %23
  %42 = zext nneg i32 %41 to i64
  %43 = getelementptr [4 x i8], ptr %1, i64 %42
  %44 = load float, ptr %43, align 4
  %45 = fadd float %39, %44
  %46 = add nsw i32 %13, -1000
  %47 = add i32 %46, %23
  %48 = zext nneg i32 %47 to i64
  %49 = getelementptr [4 x i8], ptr %1, i64 %48
  %50 = load float, ptr %49, align 4
  %51 = fadd float %45, %50
  %52 = fmul float %51, 2.000000e-01
  %53 = getelementptr [4 x i8], ptr %2, i64 %25
  store float %52, ptr %53, align 4
  br label %54

54:                                               ; preds = %3, %22
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel2iPfS_(i32 noundef %0, ptr nofree noundef writeonly captures(none) %1, ptr nofree noundef readonly captures(none) %2) local_unnamed_addr #0 {
  %4 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %6 = mul nuw nsw i32 %4, %5
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %8 = add nuw nsw i32 %6, %7
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %11 = mul i32 %9, %10
  %12 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %13 = add i32 %11, %12
  %14 = icmp ne i32 %8, 0
  %15 = add nsw i32 %0, -1
  %16 = icmp slt i32 %8, %15
  %17 = select i1 %14, i1 %16, i1 false
  %18 = icmp sgt i32 %13, 0
  %19 = and i1 %18, %17
  %20 = icmp slt i32 %13, %15
  %21 = select i1 %19, i1 %20, i1 false
  br i1 %21, label %22, label %29

22:                                               ; preds = %3
  %23 = mul nuw nsw i32 %8, 1000
  %24 = add nuw nsw i32 %23, %13
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %1, i64 %25
  %27 = getelementptr [4 x i8], ptr %2, i64 %25
  %28 = load float, ptr %27, align 4
  store float %28, ptr %26, align 4
  br label %29

29:                                               ; preds = %3, %22
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}
!nvvmir.version = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!2 = !{i32 2, i32 0}
