; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/LU/lu.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/LU/lu.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z10lu_kernel1iPfi(i32 noundef %0, ptr nofree noundef captures(none) %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %6 = mul i32 %4, %5
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %8 = add i32 %6, %7
  %9 = icmp sgt i32 %8, %2
  %10 = icmp slt i32 %8, %0
  %11 = and i1 %10, %9
  br i1 %11, label %12, label %23

12:                                               ; preds = %3
  %13 = mul nsw i32 %2, 2049
  %14 = sext i32 %13 to i64
  %15 = getelementptr [4 x i8], ptr %1, i64 %14
  %16 = shl nsw i32 %2, 11
  %17 = add nsw i32 %16, %8
  %18 = sext i32 %17 to i64
  %19 = getelementptr [4 x i8], ptr %1, i64 %18
  %20 = load float, ptr %19, align 4
  %21 = load float, ptr %15, align 4
  %22 = fdiv float %20, %21
  store float %22, ptr %19, align 4
  br label %23

23:                                               ; preds = %3, %12
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z10lu_kernel2iPfi(i32 noundef %0, ptr nofree noundef captures(none) %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %6 = mul i32 %4, %5
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %8 = add i32 %6, %7
  %9 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  %10 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  %11 = mul nuw nsw i32 %9, %10
  %12 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  %13 = add nuw nsw i32 %11, %12
  %14 = icmp sgt i32 %13, %2
  %15 = icmp sgt i32 %8, %2
  %16 = and i1 %14, %15
  %17 = icmp slt i32 %13, %0
  %18 = and i1 %17, %16
  %19 = icmp slt i32 %8, %0
  %20 = and i1 %19, %18
  br i1 %20, label %21, label %38

21:                                               ; preds = %3
  %22 = shl nsw i32 %13, 11
  %23 = add nsw i32 %22, %8
  %24 = sext i32 %23 to i64
  %25 = getelementptr [4 x i8], ptr %1, i64 %24
  %26 = load float, ptr %25, align 4
  %27 = add nsw i32 %2, %22
  %28 = sext i32 %27 to i64
  %29 = getelementptr [4 x i8], ptr %1, i64 %28
  %30 = load float, ptr %29, align 4
  %31 = shl nsw i32 %2, 11
  %32 = add nsw i32 %31, %8
  %33 = sext i32 %32 to i64
  %34 = getelementptr [4 x i8], ptr %1, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fmul float %30, %35
  %37 = fsub float %26, %36
  store float %37, ptr %25, align 4
  br label %38

38:                                               ; preds = %3, %21
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
