; ModuleID = '/home/ubuntu/polybenchGpu/CUDA/DOITGEN/doitgen.cu'
source_filename = "/home/ubuntu/polybenchGpu/CUDA/DOITGEN/doitgen.cu"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z15doitgen_kernel1PfS_S_i(ptr nofree noundef writeonly captures(none) %0, ptr nofree noundef readonly captures(none) %1, ptr nofree noundef readonly captures(none) %2, i32 noundef %3) local_unnamed_addr #0 {
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
  %15 = icmp slt i32 %9, 128
  %16 = icmp samesign ult i32 %14, 128
  %17 = and i1 %15, %16
  br i1 %17, label %18, label %.loopexit

18:                                               ; preds = %4
  %19 = shl nsw i32 %3, 14
  %20 = shl nuw nsw i32 %14, 7
  %21 = or disjoint i32 %19, %20
  %22 = add nsw i32 %21, %9
  %23 = sext i32 %22 to i64
  %24 = getelementptr [4 x i8], ptr %0, i64 %23
  store float 0.000000e+00, ptr %24, align 4
  br label %25

25:                                               ; preds = %25, %18
  %.024 = phi i32 [ 0, %18 ], [ %74, %25 ]
  %26 = phi float [ 0.000000e+00, %18 ], [ %73, %25 ]
  %27 = or disjoint i32 %.024, %21
  %28 = sext i32 %27 to i64
  %29 = getelementptr [4 x i8], ptr %1, i64 %28
  %30 = load float, ptr %29, align 4
  %31 = shl nuw nsw i32 %.024, 7
  %32 = add nsw i32 %31, %9
  %33 = sext i32 %32 to i64
  %34 = getelementptr [4 x i8], ptr %2, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fmul float %30, %35
  %37 = fadd float %26, %36
  store float %37, ptr %24, align 4
  %38 = or disjoint i32 %.024, 1
  %39 = or disjoint i32 %38, %21
  %40 = sext i32 %39 to i64
  %41 = getelementptr [4 x i8], ptr %1, i64 %40
  %42 = load float, ptr %41, align 4
  %43 = shl nuw nsw i32 %38, 7
  %44 = add nsw i32 %43, %9
  %45 = sext i32 %44 to i64
  %46 = getelementptr [4 x i8], ptr %2, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = fmul float %42, %47
  %49 = fadd float %37, %48
  store float %49, ptr %24, align 4
  %50 = or disjoint i32 %.024, 2
  %51 = or disjoint i32 %50, %21
  %52 = sext i32 %51 to i64
  %53 = getelementptr [4 x i8], ptr %1, i64 %52
  %54 = load float, ptr %53, align 4
  %55 = shl nuw nsw i32 %50, 7
  %56 = add nsw i32 %55, %9
  %57 = sext i32 %56 to i64
  %58 = getelementptr [4 x i8], ptr %2, i64 %57
  %59 = load float, ptr %58, align 4
  %60 = fmul float %54, %59
  %61 = fadd float %49, %60
  store float %61, ptr %24, align 4
  %62 = or disjoint i32 %.024, 3
  %63 = or disjoint i32 %62, %21
  %64 = sext i32 %63 to i64
  %65 = getelementptr [4 x i8], ptr %1, i64 %64
  %66 = load float, ptr %65, align 4
  %67 = shl nuw nsw i32 %62, 7
  %68 = add nsw i32 %67, %9
  %69 = sext i32 %68 to i64
  %70 = getelementptr [4 x i8], ptr %2, i64 %69
  %71 = load float, ptr %70, align 4
  %72 = fmul float %66, %71
  %73 = fadd float %61, %72
  store float %73, ptr %24, align 4
  %74 = add nuw nsw i32 %.024, 4
  %exitcond.not.3 = icmp eq i32 %74, 128
  br i1 %exitcond.not.3, label %.loopexit, label %25

.loopexit:                                        ; preds = %25, %4
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local ptx_kernel void @_Z15doitgen_kernel2PfS_S_i(ptr nofree noundef readonly captures(none) %0, ptr nofree noundef writeonly captures(none) %1, ptr nofree noundef readnone captures(none) %2, i32 noundef %3) local_unnamed_addr #1 {
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
  %15 = icmp slt i32 %9, 128
  %16 = icmp samesign ult i32 %14, 128
  %17 = and i1 %15, %16
  br i1 %17, label %18, label %27

18:                                               ; preds = %4
  %19 = shl nsw i32 %3, 14
  %20 = shl nuw nsw i32 %14, 7
  %21 = add nsw i32 %20, %9
  %22 = add i32 %21, %19
  %23 = sext i32 %22 to i64
  %24 = getelementptr [4 x i8], ptr %1, i64 %23
  %25 = getelementptr [4 x i8], ptr %0, i64 %23
  %26 = load float, ptr %25, align 4
  store float %26, ptr %24, align 4
  br label %27

27:                                               ; preds = %4, %18
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #2

attributes #0 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(argmem: readwrite) "target-cpu"="sm_90" "target-features"="+ptx87,+sm_90" "uniform-work-group-size" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}
!nvvmir.version = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!2 = !{i32 2, i32 0}
