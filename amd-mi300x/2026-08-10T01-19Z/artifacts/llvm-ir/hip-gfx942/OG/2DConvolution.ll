; ModuleID = '/root/polybenchGpu/HIP/2DCONV/2DConvolution.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/2DCONV/2DConvolution.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_db7c76ff462e7891 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_db7c76ff462e7891 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z20convolution2D_kerneliiPfS_(i32 noundef %ni, i32 noundef %nj, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %B.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i126 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i126
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i135 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i132 = zext i16 %.in.i135 to i32
  %mul7 = mul i32 %4, %conv.i132
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add9 = add i32 %mul7, %6
  %sub = add nsw i32 %ni, -1
  %cmp = icmp slt i32 %add9, %sub
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %sub10 = add nsw i32 %nj, -1
  %cmp11 = icmp slt i32 %add, %sub10
  %cmp13 = icmp sgt i32 %add9, 0
  %or.cond = and i1 %cmp11, %cmp13
  %cmp15 = icmp sgt i32 %add, 0
  %or.cond89 = and i1 %cmp15, %or.cond
  br i1 %or.cond89, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %sub16 = shl i32 %add9, 12
  %mul17 = add i32 %sub16, -4096
  %sub18 = add nsw i32 %add, -1
  %add19 = add nuw nsw i32 %mul17, %sub18
  %idxprom = zext nneg i32 %add19 to i64
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %add24 = add nuw nsw i32 %mul17, %add
  %idxprom25 = zext nneg i32 %add24 to i64
  %arrayidx26 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom25
  %8 = load float, ptr addrspace(1) %arrayidx26, align 4, !tbaa !18
  %9 = insertelement <2 x float> poison, float %7, i64 0
  %10 = insertelement <2 x float> %9, float %8, i64 1
  %11 = fmul contract <2 x float> %10, <float 2.000000e-01, float 5.000000e-01>
  %shift = shufflevector <2 x float> %11, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop = fadd contract <2 x float> %11, %shift
  %add31 = add nuw nsw i32 %add, 1
  %add32 = add nuw nsw i32 %mul17, %add31
  %idxprom33 = zext nneg i32 %add32 to i64
  %arrayidx34 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom33
  %12 = load float, ptr addrspace(1) %arrayidx34, align 4, !tbaa !18
  %add40 = add nuw nsw i32 %sub16, %sub18
  %idxprom41 = zext nneg i32 %add40 to i64
  %arrayidx42 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom41
  %13 = load float, ptr addrspace(1) %arrayidx42, align 4, !tbaa !18
  %14 = insertelement <2 x float> poison, float %12, i64 0
  %15 = insertelement <2 x float> %14, float %13, i64 1
  %16 = fmul contract <2 x float> %15, <float 8.000000e-01, float 3.000000e-01>
  %foldExtExtBinop137 = fsub contract <2 x float> %foldExtExtBinop, %16
  %shift139 = shufflevector <2 x float> %16, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop140 = fsub contract <2 x float> %foldExtExtBinop137, %shift139
  %add48 = add nuw nsw i32 %sub16, %add
  %idxprom49 = zext nneg i32 %add48 to i64
  %arrayidx50 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom49
  %17 = load float, ptr addrspace(1) %arrayidx50, align 4, !tbaa !18
  %add56 = add nuw nsw i32 %sub16, %add31
  %idxprom57 = zext nneg i32 %add56 to i64
  %arrayidx58 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom57
  %18 = load float, ptr addrspace(1) %arrayidx58, align 4, !tbaa !18
  %19 = insertelement <2 x float> poison, float %17, i64 0
  %20 = insertelement <2 x float> %19, float %18, i64 1
  %21 = fmul contract <2 x float> %20, <float 6.000000e-01, float f0x3F666666>
  %foldExtExtBinop142 = fadd contract <2 x float> %foldExtExtBinop140, %21
  %mul62 = add i32 %sub16, 4096
  %add64 = add nuw nsw i32 %mul62, %sub18
  %idxprom65 = zext nneg i32 %add64 to i64
  %arrayidx66 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom65
  %22 = load float, ptr addrspace(1) %arrayidx66, align 4, !tbaa !18
  %add72 = add nuw nsw i32 %mul62, %add
  %idxprom73 = zext nneg i32 %add72 to i64
  %arrayidx74 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom73
  %23 = load float, ptr addrspace(1) %arrayidx74, align 4, !tbaa !18
  %add80 = add nuw nsw i32 %mul62, %add31
  %idxprom81 = zext nneg i32 %add80 to i64
  %arrayidx82 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom81
  %24 = load float, ptr addrspace(1) %arrayidx82, align 4, !tbaa !18
  %shift144 = shufflevector <2 x float> %21, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop145 = fsub contract <2 x float> %foldExtExtBinop142, %shift144
  %25 = extractelement <2 x float> %foldExtExtBinop145, i64 0
  %26 = insertelement <4 x float> poison, float %22, i64 0
  %27 = insertelement <4 x float> %26, float %23, i64 1
  %28 = insertelement <4 x float> %27, float %24, i64 2
  %29 = fmul contract <4 x float> %28, <float 4.000000e-01, float f0x3F333333, float 1.000000e-01, float poison>
  %30 = extractelement <4 x float> %29, i64 0
  %add68 = fadd contract float %25, %30
  %31 = extractelement <4 x float> %29, i64 1
  %add76 = fadd contract float %add68, %31
  %32 = extractelement <4 x float> %29, i64 2
  %add84 = fadd contract float %add76, %32
  %arrayidx88 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom49
  store float %add84, ptr addrspace(1) %arrayidx88, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef align 4 ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4, !5}
!llvm.errno.tbaa = !{!6, !11}
!opencl.ocl.version = !{!15}

!0 = !{i32 1, !"amdhsa_code_object_version", i32 600}
!1 = !{i32 1, !"amdgpu_printf_kind", !"hostcall"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 24.0.0git (https://github.com/llvm/llvm-project c45e6b9e4d95fb444eb1308416c10d95350d3c52)"}
!5 = !{!"AMD clang version 23.0.0git (https://github.com/ROCm/llvm-project.git 46fcb339fb61119b337f973c7ca9e710a319fdd0+PATCHED:440716f8b87be9d8e20ed910e10e5b6d14d57cf6)"}
!6 = !{!7, !8, i64 0}
!7 = !{!"__libc_errno", !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{i32 2, i32 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"short", !13, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !9, i64 0}
