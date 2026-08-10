; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/JACOBI1D/jacobi1D.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/JACOBI1D/jacobi1D.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel1iPfS_(i32 noundef %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef writeonly captures(none) %2) local_unnamed_addr #0 {
  %4 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %6 = mul i32 %4, %5
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %8 = add i32 %6, %7
  %9 = icmp sgt i32 %8, 0
  %10 = add nsw i32 %0, -1
  %11 = icmp slt i32 %8, %10
  %12 = select i1 %9, i1 %11, i1 false
  br i1 %12, label %13, label %27

13:                                               ; preds = %3
  %14 = zext nneg i32 %8 to i64
  %15 = getelementptr [4 x i8], ptr %1, i64 %14
  %16 = getelementptr i8, ptr %15, i64 -4
  %17 = load float, ptr %16, align 4
  %18 = load float, ptr %15, align 4
  %19 = fadd float %17, %18
  %20 = getelementptr i8, ptr %15, i64 4
  %21 = load float, ptr %20, align 4
  %22 = fadd float %19, %21
  %23 = fpext float %22 to double
  %24 = fmul double %23, 3.333300e-01
  %25 = fptrunc double %24 to float
  %26 = getelementptr [4 x i8], ptr %2, i64 %14
  store float %25, ptr %26, align 4
  br label %27

27:                                               ; preds = %3, %13
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z21runJacobiCUDA_kernel2iPfS_(i32 noundef %0, ptr nofree noundef writeonly captures(none) %1, ptr nofree noundef readonly captures(none) %2) local_unnamed_addr #0 {
  %4 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %5 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  %6 = mul i32 %4, %5
  %7 = tail call noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %8 = add i32 %6, %7
  %9 = icmp sgt i32 %8, 0
  %10 = add nsw i32 %0, -1
  %11 = icmp slt i32 %8, %10
  %12 = select i1 %9, i1 %11, i1 false
  br i1 %12, label %13, label %18

13:                                               ; preds = %3
  %14 = zext nneg i32 %8 to i64
  %15 = getelementptr [4 x i8], ptr %1, i64 %14
  %16 = getelementptr [4 x i8], ptr %2, i64 %14
  %17 = load float, ptr %16, align 4
  store float %17, ptr %15, align 4
  br label %18

18:                                               ; preds = %3, %13
  ret void
}

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
