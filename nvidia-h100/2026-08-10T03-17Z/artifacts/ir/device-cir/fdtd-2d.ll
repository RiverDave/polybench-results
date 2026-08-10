; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/FDTD-2D/fdtd2d.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/FDTD-2D/fdtd2d.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z17fdtd_step1_kerneliiPfS_S_S_i(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readnone captures(none) %3, ptr nofree noundef captures(none) %4, ptr nofree noundef readonly captures(none) %5, i32 noundef %6) local_unnamed_addr #0 {
  %8 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %10 = mul i32 %8, %9
  %11 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %12 = add i32 %10, %11
  %13 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %14 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %15 = mul nuw nsw i32 %13, %14
  %16 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %17 = add nuw nsw i32 %15, %16
  %18 = icmp slt i32 %17, %0
  %19 = icmp slt i32 %12, %1
  %20 = and i1 %18, %19
  br i1 %20, label %21, label %45

21:                                               ; preds = %7
  %22 = icmp eq i32 %17, 0
  br i1 %22, label %23, label %29

23:                                               ; preds = %21
  %24 = sext i32 %6 to i64
  %25 = getelementptr [4 x i8], ptr %2, i64 %24
  %26 = load float, ptr %25, align 4
  %27 = sext i32 %12 to i64
  %28 = getelementptr [4 x i8], ptr %4, i64 %27
  store float %26, ptr %28, align 4
  br label %45

29:                                               ; preds = %21
  %30 = shl nsw i32 %17, 11
  %31 = add nsw i32 %30, %12
  %32 = sext i32 %31 to i64
  %33 = getelementptr [4 x i8], ptr %4, i64 %32
  %34 = load float, ptr %33, align 4
  %35 = getelementptr [4 x i8], ptr %5, i64 %32
  %36 = load float, ptr %35, align 4
  %37 = add i32 %12, -2048
  %38 = add i32 %37, %30
  %39 = sext i32 %38 to i64
  %40 = getelementptr [4 x i8], ptr %5, i64 %39
  %41 = load float, ptr %40, align 4
  %42 = fsub float %36, %41
  %43 = fmul float %42, 5.000000e-01
  %44 = fsub float %34, %43
  store float %44, ptr %33, align 4
  br label %45

45:                                               ; preds = %7, %29, %23
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z17fdtd_step2_kerneliiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr nofree noundef captures(none) %2, ptr nofree noundef readnone captures(none) %3, ptr nofree noundef readonly captures(none) %4, i32 noundef %5) local_unnamed_addr #0 {
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
  %17 = icmp slt i32 %16, %0
  %18 = icmp slt i32 %11, %1
  %19 = and i1 %17, %18
  %20 = icmp sgt i32 %11, 0
  %21 = and i1 %20, %19
  br i1 %21, label %22, label %38

22:                                               ; preds = %6
  %23 = shl nsw i32 %16, 11
  %24 = add nuw nsw i32 %23, %11
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %2, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = getelementptr [4 x i8], ptr %4, i64 %25
  %29 = load float, ptr %28, align 4
  %30 = add nsw i32 %11, -1
  %31 = add nuw nsw i32 %30, %23
  %32 = zext nneg i32 %31 to i64
  %33 = getelementptr [4 x i8], ptr %4, i64 %32
  %34 = load float, ptr %33, align 4
  %35 = fsub float %29, %34
  %36 = fmul float %35, 5.000000e-01
  %37 = fsub float %27, %36
  store float %37, ptr %26, align 4
  br label %38

38:                                               ; preds = %6, %22
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z17fdtd_step3_kerneliiPfS_S_i(i32 noundef %0, i32 noundef %1, ptr nofree noundef readonly captures(none) %2, ptr nofree noundef readonly captures(none) %3, ptr nofree noundef captures(none) %4, i32 noundef %5) local_unnamed_addr #0 {
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
  %18 = icmp slt i32 %16, %17
  %19 = add nsw i32 %1, -1
  %20 = icmp slt i32 %11, %19
  %21 = select i1 %18, i1 %20, i1 false
  br i1 %21, label %22, label %47

22:                                               ; preds = %6
  %23 = shl nsw i32 %16, 11
  %24 = add nsw i32 %23, %11
  %25 = sext i32 %24 to i64
  %26 = getelementptr [4 x i8], ptr %4, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = add nsw i32 %11, 1
  %29 = add nsw i32 %28, %23
  %30 = sext i32 %29 to i64
  %31 = getelementptr [4 x i8], ptr %2, i64 %30
  %32 = load float, ptr %31, align 4
  %33 = getelementptr [4 x i8], ptr %2, i64 %25
  %34 = load float, ptr %33, align 4
  %35 = fsub float %32, %34
  %36 = add i32 %11, 2048
  %37 = add i32 %36, %23
  %38 = sext i32 %37 to i64
  %39 = getelementptr [4 x i8], ptr %3, i64 %38
  %40 = load float, ptr %39, align 4
  %41 = fadd float %35, %40
  %42 = getelementptr [4 x i8], ptr %3, i64 %25
  %43 = load float, ptr %42, align 4
  %44 = fsub float %41, %43
  %45 = fmul float %44, f0x3F333333
  %46 = fsub float %27, %45
  store float %46, ptr %26, align 4
  br label %47

47:                                               ; preds = %6, %22
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
