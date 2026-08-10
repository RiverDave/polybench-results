; ModuleID = '/root/polybenchGpu/HIP/3DCONV/3DConvolution.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/3DCONV/3DConvolution.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_23b13c53badecca = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_23b13c53badecca to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z20convolution3D_kerneliiiPfS_i(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, ptr addrspace(1) nofree noundef readonly captures(none) %A.coerce, ptr addrspace(1) nofree noundef writeonly captures(none) %B.coerce, i32 noundef %i) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i269 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i269
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i278 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i275 = zext i16 %.in.i278 to i32
  %mul7 = mul i32 %4, %conv.i275
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add9 = add i32 %mul7, %6
  %sub = add nsw i32 %ni, -1
  %cmp = icmp slt i32 %i, %sub
  %sub10 = add nsw i32 %nj, -1
  %cmp11 = icmp slt i32 %add9, %sub10
  %or.cond262 = select i1 %cmp, i1 %cmp11, i1 false
  br i1 %or.cond262, label %land.lhs.true12, label %if.end

land.lhs.true12:                                  ; preds = %entry
  %sub13 = add nsw i32 %nk, -1
  %cmp14 = icmp slt i32 %add, %sub13
  %cmp16 = icmp sgt i32 %i, 0
  %or.cond = and i1 %cmp16, %cmp14
  %cmp18 = icmp sgt i32 %add9, 0
  %or.cond189 = and i1 %or.cond, %cmp18
  %cmp20 = icmp sgt i32 %add, 0
  %or.cond190 = and i1 %cmp20, %or.cond189
  br i1 %or.cond190, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true12
  %sub21 = shl i32 %i, 16
  %mul22 = add i32 %sub21, -65536
  %sub23 = shl i32 %add9, 8
  %mul24 = add i32 %sub23, -256
  %add25 = add nuw nsw i32 %mul24, %mul22
  %sub26 = add nsw i32 %add, -1
  %add27 = add nuw nsw i32 %add25, %sub26
  %idxprom = zext nneg i32 %add27 to i64
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul30 = add i32 %sub21, 65536
  %add33 = add nuw nsw i32 %mul24, %mul30
  %add35 = add nuw nsw i32 %add33, %sub26
  %idxprom36 = zext nneg i32 %add35 to i64
  %arrayidx37 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom36
  %8 = load float, ptr addrspace(1) %arrayidx37, align 4, !tbaa !18
  %9 = insertelement <4 x float> poison, float %7, i64 0
  %10 = insertelement <4 x float> %9, float %8, i64 1
  %11 = shufflevector <4 x float> %10, <4 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %12 = fmul contract <4 x float> %11, <float 2.000000e+00, float 4.000000e+00, float 5.000000e+00, float 7.000000e+00>
  %13 = extractelement <4 x float> %12, i64 0
  %14 = extractelement <4 x float> %12, i64 1
  %add39 = fadd contract float %13, %14
  %15 = extractelement <4 x float> %12, i64 2
  %add50 = fadd contract float %15, %add39
  %16 = extractelement <4 x float> %12, i64 3
  %add61 = fadd contract float %16, %add50
  %mul71 = fmul contract float %7, 8.000000e+00
  %17 = fsub contract float %add61, %mul71
  %add88 = add nuw nsw i32 %add, %sub21
  %add90 = add nuw nsw i32 %add88, %mul24
  %idxprom91 = zext nneg i32 %add90 to i64
  %arrayidx92 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom91
  %18 = load float, ptr addrspace(1) %arrayidx92, align 4, !tbaa !18
  %19 = insertelement <2 x float> poison, float %8, i64 0
  %20 = insertelement <2 x float> %19, float %18, i64 1
  %21 = fmul contract <2 x float> %20, <float 1.000000e+01, float 3.000000e+00>
  %22 = extractelement <2 x float> %21, i64 0
  %add83 = fadd contract float %22, %17
  %23 = extractelement <2 x float> %21, i64 1
  %24 = fsub contract float %add83, %23
  %add101 = add nuw nsw i32 %add88, %sub23
  %idxprom102 = zext nneg i32 %add101 to i64
  %arrayidx103 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom102
  %25 = load float, ptr addrspace(1) %arrayidx103, align 4, !tbaa !18
  %mul109 = add i32 %sub23, 256
  %add112 = add nuw nsw i32 %add88, %mul109
  %idxprom113 = zext nneg i32 %add112 to i64
  %arrayidx114 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom113
  %26 = load float, ptr addrspace(1) %arrayidx114, align 4, !tbaa !18
  %27 = insertelement <2 x float> poison, float %25, i64 0
  %28 = insertelement <2 x float> %27, float %26, i64 1
  %29 = fmul contract <2 x float> %28, <float 6.000000e+00, float 9.000000e+00>
  %30 = extractelement <2 x float> %29, i64 0
  %add105 = fadd contract float %30, %24
  %31 = extractelement <2 x float> %29, i64 1
  %32 = fsub contract float %add105, %31
  %add122 = add nuw nsw i32 %add, 1
  %add123 = add nuw nsw i32 %add25, %add122
  %idxprom124 = zext nneg i32 %add123 to i64
  %arrayidx125 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom124
  %33 = load float, ptr addrspace(1) %arrayidx125, align 4, !tbaa !18
  %add134 = add nuw nsw i32 %add33, %add122
  %idxprom135 = zext nneg i32 %add134 to i64
  %arrayidx136 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom135
  %34 = load float, ptr addrspace(1) %arrayidx136, align 4, !tbaa !18
  %add143 = add nuw nsw i32 %add122, %mul22
  %add145 = add nuw nsw i32 %add143, %sub23
  %idxprom146 = zext nneg i32 %add145 to i64
  %arrayidx147 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom146
  %35 = load float, ptr addrspace(1) %arrayidx147, align 4, !tbaa !18
  %add154 = add nuw nsw i32 %add122, %mul30
  %add156 = add nuw nsw i32 %add154, %sub23
  %idxprom157 = zext nneg i32 %add156 to i64
  %arrayidx158 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom157
  %36 = load float, ptr addrspace(1) %arrayidx158, align 4, !tbaa !18
  %37 = insertelement <4 x float> poison, float %33, i64 0
  %38 = insertelement <4 x float> %37, float %34, i64 1
  %39 = insertelement <4 x float> %38, float %35, i64 2
  %40 = insertelement <4 x float> %39, float %36, i64 3
  %41 = fmul contract <4 x float> %40, <float 2.000000e+00, float 4.000000e+00, float 5.000000e+00, float 7.000000e+00>
  %42 = extractelement <4 x float> %41, i64 0
  %add127 = fadd contract float %42, %32
  %43 = extractelement <4 x float> %41, i64 1
  %add138 = fadd contract float %43, %add127
  %44 = extractelement <4 x float> %41, i64 2
  %add149 = fadd contract float %44, %add138
  %45 = extractelement <4 x float> %41, i64 3
  %add160 = fadd contract float %45, %add149
  %add167 = add nuw nsw i32 %add143, %mul109
  %idxprom168 = zext nneg i32 %add167 to i64
  %arrayidx169 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom168
  %46 = load float, ptr addrspace(1) %arrayidx169, align 4, !tbaa !18
  %add178 = add nuw nsw i32 %add154, %mul109
  %idxprom179 = zext nneg i32 %add178 to i64
  %arrayidx180 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %A.coerce, i64 %idxprom179
  %47 = load float, ptr addrspace(1) %arrayidx180, align 4, !tbaa !18
  %48 = insertelement <2 x float> poison, float %47, i64 0
  %49 = insertelement <2 x float> %48, float %46, i64 1
  %50 = fmul contract <2 x float> %49, <float 1.000000e+01, float 8.000000e+00>
  %51 = extractelement <2 x float> %50, i64 1
  %52 = fsub contract float %add160, %51
  %53 = extractelement <2 x float> %50, i64 0
  %add182 = fadd contract float %53, %52
  %arrayidx188 = getelementptr inbounds nuw [4 x i8], ptr addrspace(1) %B.coerce, i64 %idxprom102
  store float %add182, ptr addrspace(1) %arrayidx188, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true12, %entry
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
