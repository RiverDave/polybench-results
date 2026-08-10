; ModuleID = '/root/polybenchGpu/HIP/SYR2K/syr2k.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/SYR2K/syr2k.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_943dc871f7c68a08 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_943dc871f7c68a08 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z12syr2k_kerneliiffPfS_S_(i32 noundef %ni, i32 noundef %nj, float noundef %alpha, float noundef %beta, ptr addrspace(1) nofree noundef readonly captures(none) %a.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %b.coerce, ptr addrspace(1) nofree noundef captures(none) %c.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i65 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i65
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i74 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i71 = zext i16 %.in.i74 to i32
  %mul8 = mul i32 %4, %conv.i71
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add10 = add i32 %mul8, %6
  %cmp = icmp slt i32 %add10, 1024
  %cmp11 = icmp slt i32 %add, 1024
  %or.cond = and i1 %cmp11, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul12 = shl nsw i32 %add10, 10
  %add13 = add nsw i32 %mul12, %add
  %idxprom = sext i32 %add13 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %c.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul14 = fmul contract float %beta, %7
  store float %mul14, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul21 = shl nsw i32 %add, 10
  %8 = insertelement <2 x float> poison, float %alpha, i64 0
  %9 = shufflevector <2 x float> %8, <2 x float> poison, <2 x i32> zeroinitializer
  br label %for.body

for.body:                                         ; preds = %for.body, %if.then
  %k.077 = phi i32 [ 0, %if.then ], [ %inc.3, %for.body ]
  %add417576 = phi float [ %mul14, %if.then ], [ %add41.3, %for.body ]
  %add17 = or disjoint i32 %k.077, %mul12
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18
  %10 = load float, ptr addrspace(1) %arrayidx19, align 4, !tbaa !18
  %add22 = add nuw nsw i32 %k.077, %mul21
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23
  %11 = load float, ptr addrspace(1) %arrayidx24, align 4, !tbaa !18
  %arrayidx29 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom18
  %12 = load float, ptr addrspace(1) %arrayidx29, align 4, !tbaa !18
  %arrayidx34 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom23
  %13 = load float, ptr addrspace(1) %arrayidx34, align 4, !tbaa !18
  %14 = insertelement <2 x float> poison, float %10, i64 0
  %15 = insertelement <2 x float> %14, float %12, i64 1
  %16 = fmul contract <2 x float> %9, %15
  %17 = insertelement <2 x float> poison, float %11, i64 0
  %18 = insertelement <2 x float> %17, float %13, i64 1
  %19 = fmul contract <2 x float> %16, %18
  %shift = shufflevector <2 x float> %19, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop = fadd contract <2 x float> %19, %shift
  %add36 = extractelement <2 x float> %foldExtExtBinop, i64 0
  %add41 = fadd contract float %add417576, %add36
  store float %add41, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = or disjoint i32 %k.077, 1
  %add17.1 = or disjoint i32 %inc, %mul12
  %idxprom18.1 = sext i32 %add17.1 to i64
  %arrayidx19.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.1
  %20 = load float, ptr addrspace(1) %arrayidx19.1, align 4, !tbaa !18
  %add22.1 = add nuw nsw i32 %inc, %mul21
  %idxprom23.1 = sext i32 %add22.1 to i64
  %arrayidx24.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.1
  %21 = load float, ptr addrspace(1) %arrayidx24.1, align 4, !tbaa !18
  %arrayidx29.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom18.1
  %22 = load float, ptr addrspace(1) %arrayidx29.1, align 4, !tbaa !18
  %arrayidx34.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom23.1
  %23 = load float, ptr addrspace(1) %arrayidx34.1, align 4, !tbaa !18
  %24 = insertelement <2 x float> poison, float %20, i64 0
  %25 = insertelement <2 x float> %24, float %22, i64 1
  %26 = fmul contract <2 x float> %9, %25
  %27 = insertelement <2 x float> poison, float %21, i64 0
  %28 = insertelement <2 x float> %27, float %23, i64 1
  %29 = fmul contract <2 x float> %26, %28
  %shift.1 = shufflevector <2 x float> %29, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop.1 = fadd contract <2 x float> %29, %shift.1
  %add36.1 = extractelement <2 x float> %foldExtExtBinop.1, i64 0
  %add41.1 = fadd contract float %add41, %add36.1
  store float %add41.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %k.077, 2
  %add17.2 = or disjoint i32 %inc.1, %mul12
  %idxprom18.2 = sext i32 %add17.2 to i64
  %arrayidx19.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.2
  %30 = load float, ptr addrspace(1) %arrayidx19.2, align 4, !tbaa !18
  %add22.2 = add nuw nsw i32 %inc.1, %mul21
  %idxprom23.2 = sext i32 %add22.2 to i64
  %arrayidx24.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.2
  %31 = load float, ptr addrspace(1) %arrayidx24.2, align 4, !tbaa !18
  %arrayidx29.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom18.2
  %32 = load float, ptr addrspace(1) %arrayidx29.2, align 4, !tbaa !18
  %arrayidx34.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom23.2
  %33 = load float, ptr addrspace(1) %arrayidx34.2, align 4, !tbaa !18
  %34 = insertelement <2 x float> poison, float %30, i64 0
  %35 = insertelement <2 x float> %34, float %32, i64 1
  %36 = fmul contract <2 x float> %9, %35
  %37 = insertelement <2 x float> poison, float %31, i64 0
  %38 = insertelement <2 x float> %37, float %33, i64 1
  %39 = fmul contract <2 x float> %36, %38
  %shift.2 = shufflevector <2 x float> %39, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop.2 = fadd contract <2 x float> %39, %shift.2
  %add36.2 = extractelement <2 x float> %foldExtExtBinop.2, i64 0
  %add41.2 = fadd contract float %add41.1, %add36.2
  store float %add41.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %k.077, 3
  %add17.3 = or disjoint i32 %inc.2, %mul12
  %idxprom18.3 = sext i32 %add17.3 to i64
  %arrayidx19.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.3
  %40 = load float, ptr addrspace(1) %arrayidx19.3, align 4, !tbaa !18
  %add22.3 = add nuw nsw i32 %inc.2, %mul21
  %idxprom23.3 = sext i32 %add22.3 to i64
  %arrayidx24.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.3
  %41 = load float, ptr addrspace(1) %arrayidx24.3, align 4, !tbaa !18
  %arrayidx29.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom18.3
  %42 = load float, ptr addrspace(1) %arrayidx29.3, align 4, !tbaa !18
  %arrayidx34.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom23.3
  %43 = load float, ptr addrspace(1) %arrayidx34.3, align 4, !tbaa !18
  %44 = insertelement <2 x float> poison, float %40, i64 0
  %45 = insertelement <2 x float> %44, float %42, i64 1
  %46 = fmul contract <2 x float> %9, %45
  %47 = insertelement <2 x float> poison, float %41, i64 0
  %48 = insertelement <2 x float> %47, float %43, i64 1
  %49 = fmul contract <2 x float> %46, %48
  %shift.3 = shufflevector <2 x float> %49, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %foldExtExtBinop.3 = fadd contract <2 x float> %49, %shift.3
  %add36.3 = extractelement <2 x float> %foldExtExtBinop.3, i64 0
  %add41.3 = fadd contract float %add41.2, %add36.3
  store float %add41.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = add nuw nsw i32 %k.077, 4
  %exitcond.not.3 = icmp eq i32 %inc.3, 1024
  br i1 %exitcond.not.3, label %if.end, label %for.body, !llvm.loop !20

if.end:                                           ; preds = %for.body, %entry
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

attributes #0 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
