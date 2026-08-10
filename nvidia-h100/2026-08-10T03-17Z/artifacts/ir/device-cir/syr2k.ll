; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/SYR2K/syr2k.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/SYR2K/syr2k.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z12syr2k_kerneliiffPfS_S_(i32 noundef %0, i32 noundef %1, float noundef %2, float noundef %3, ptr nofree noundef readonly captures(none) %4, ptr nofree noundef readonly captures(none) %5, ptr nofree noundef captures(none) %6) local_unnamed_addr #0 {
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
  %18 = icmp samesign ult i32 %17, 1024
  %19 = icmp slt i32 %12, 1024
  %20 = and i1 %18, %19
  br i1 %20, label %21, label %.loopexit

21:                                               ; preds = %7
  %22 = shl nuw nsw i32 %17, 10
  %23 = add nsw i32 %22, %12
  %24 = sext i32 %23 to i64
  %25 = getelementptr [4 x i8], ptr %6, i64 %24
  %26 = load float, ptr %25, align 4
  %27 = fmul float %3, %26
  store float %27, ptr %25, align 4
  %28 = shl nsw i32 %12, 10
  br label %29

29:                                               ; preds = %29, %21
  %.026 = phi i32 [ 0, %21 ], [ %68, %29 ]
  %30 = phi float [ %27, %21 ], [ %67, %29 ]
  %31 = or disjoint i32 %.026, %22
  %32 = zext nneg i32 %31 to i64
  %33 = getelementptr [4 x i8], ptr %4, i64 %32
  %34 = load float, ptr %33, align 4
  %35 = fmul float %2, %34
  %36 = add nuw nsw i32 %.026, %28
  %37 = sext i32 %36 to i64
  %38 = getelementptr [4 x i8], ptr %5, i64 %37
  %39 = load float, ptr %38, align 4
  %40 = fmul float %35, %39
  %41 = getelementptr [4 x i8], ptr %5, i64 %32
  %42 = load float, ptr %41, align 4
  %43 = fmul float %2, %42
  %44 = getelementptr [4 x i8], ptr %4, i64 %37
  %45 = load float, ptr %44, align 4
  %46 = fmul float %43, %45
  %47 = fadd float %40, %46
  %48 = fadd float %30, %47
  store float %48, ptr %25, align 4
  %49 = or disjoint i32 %.026, 1
  %50 = or disjoint i32 %49, %22
  %51 = zext nneg i32 %50 to i64
  %52 = getelementptr [4 x i8], ptr %4, i64 %51
  %53 = load float, ptr %52, align 4
  %54 = fmul float %2, %53
  %55 = add nuw nsw i32 %49, %28
  %56 = sext i32 %55 to i64
  %57 = getelementptr [4 x i8], ptr %5, i64 %56
  %58 = load float, ptr %57, align 4
  %59 = fmul float %54, %58
  %60 = getelementptr [4 x i8], ptr %5, i64 %51
  %61 = load float, ptr %60, align 4
  %62 = fmul float %2, %61
  %63 = getelementptr [4 x i8], ptr %4, i64 %56
  %64 = load float, ptr %63, align 4
  %65 = fmul float %62, %64
  %66 = fadd float %59, %65
  %67 = fadd float %48, %66
  store float %67, ptr %25, align 4
  %68 = add nuw nsw i32 %.026, 2
  %exitcond.not.1 = icmp eq i32 %68, 1024
  br i1 %exitcond.not.1, label %.loopexit, label %29

.loopexit:                                        ; preds = %29, %7
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

attributes #0 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}
!nvvmir.version = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!2 = !{i32 2, i32 0}
