; ModuleID = '/root/polybenchGpu/HIP/GEMM/gemm.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/GEMM/gemm.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_3f5efa2547eb63c3 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_3f5efa2547eb63c3 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z11gemm_kerneliiiffPfS_S_(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, float noundef %alpha, float noundef %beta, ptr addrspace(1) nofree noundef readonly captures(none) %a.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %b.coerce, ptr addrspace(1) nofree noundef captures(none) %c.coerce) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i47 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i47
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i56 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i53 = zext i16 %.in.i56 to i32
  %mul8 = mul i32 %4, %conv.i53
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add10 = add i32 %mul8, %6
  %cmp = icmp slt i32 %add10, %ni
  %cmp11 = icmp slt i32 %add, %nj
  %or.cond = and i1 %cmp11, %cmp
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul12 = shl nsw i32 %add10, 9
  %add13 = add nsw i32 %mul12, %add
  %idxprom = sext i32 %add13 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %c.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %mul14 = fmul contract float %beta, %7
  store float %mul14, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %cmp1557 = icmp sgt i32 %nk, 0
  br i1 %cmp1557, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %xtraiter = and i32 %nk, 7
  %8 = icmp ult i32 %nk, 8
  br i1 %8, label %for.body.epil.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i32 %nk, 2147483640
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %add3059 = phi float [ %mul14, %for.body.preheader.new ], [ %add30.7, %for.body ]
  %k.058 = phi i32 [ 0, %for.body.preheader.new ], [ %inc.7, %for.body ]
  %niter = phi i32 [ 0, %for.body.preheader.new ], [ %niter.next.7, %for.body ]
  %add17 = add nsw i32 %k.058, %mul12
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18
  %9 = load float, ptr addrspace(1) %arrayidx19, align 4, !tbaa !18
  %mul20 = fmul contract float %alpha, %9
  %mul21 = shl nuw nsw i32 %k.058, 9
  %add22 = add nsw i32 %mul21, %add
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23
  %10 = load float, ptr addrspace(1) %arrayidx24, align 4, !tbaa !18
  %mul25 = fmul contract float %mul20, %10
  %add30 = fadd contract float %add3059, %mul25
  store float %add30, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc = or disjoint i32 %k.058, 1
  %add17.1 = add nsw i32 %inc, %mul12
  %idxprom18.1 = sext i32 %add17.1 to i64
  %arrayidx19.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.1
  %11 = load float, ptr addrspace(1) %arrayidx19.1, align 4, !tbaa !18
  %mul20.1 = fmul contract float %alpha, %11
  %mul21.1 = shl nuw nsw i32 %inc, 9
  %add22.1 = add nsw i32 %mul21.1, %add
  %idxprom23.1 = sext i32 %add22.1 to i64
  %arrayidx24.1 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.1
  %12 = load float, ptr addrspace(1) %arrayidx24.1, align 4, !tbaa !18
  %mul25.1 = fmul contract float %mul20.1, %12
  %add30.1 = fadd contract float %add30, %mul25.1
  store float %add30.1, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.1 = or disjoint i32 %k.058, 2
  %add17.2 = add nsw i32 %inc.1, %mul12
  %idxprom18.2 = sext i32 %add17.2 to i64
  %arrayidx19.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.2
  %13 = load float, ptr addrspace(1) %arrayidx19.2, align 4, !tbaa !18
  %mul20.2 = fmul contract float %alpha, %13
  %mul21.2 = shl nuw nsw i32 %inc.1, 9
  %add22.2 = add nsw i32 %mul21.2, %add
  %idxprom23.2 = sext i32 %add22.2 to i64
  %arrayidx24.2 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.2
  %14 = load float, ptr addrspace(1) %arrayidx24.2, align 4, !tbaa !18
  %mul25.2 = fmul contract float %mul20.2, %14
  %add30.2 = fadd contract float %add30.1, %mul25.2
  store float %add30.2, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.2 = or disjoint i32 %k.058, 3
  %add17.3 = add nsw i32 %inc.2, %mul12
  %idxprom18.3 = sext i32 %add17.3 to i64
  %arrayidx19.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.3
  %15 = load float, ptr addrspace(1) %arrayidx19.3, align 4, !tbaa !18
  %mul20.3 = fmul contract float %alpha, %15
  %mul21.3 = shl nuw nsw i32 %inc.2, 9
  %add22.3 = add nsw i32 %mul21.3, %add
  %idxprom23.3 = sext i32 %add22.3 to i64
  %arrayidx24.3 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.3
  %16 = load float, ptr addrspace(1) %arrayidx24.3, align 4, !tbaa !18
  %mul25.3 = fmul contract float %mul20.3, %16
  %add30.3 = fadd contract float %add30.2, %mul25.3
  store float %add30.3, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.3 = or disjoint i32 %k.058, 4
  %add17.4 = add nsw i32 %inc.3, %mul12
  %idxprom18.4 = sext i32 %add17.4 to i64
  %arrayidx19.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.4
  %17 = load float, ptr addrspace(1) %arrayidx19.4, align 4, !tbaa !18
  %mul20.4 = fmul contract float %alpha, %17
  %mul21.4 = shl nuw nsw i32 %inc.3, 9
  %add22.4 = add nsw i32 %mul21.4, %add
  %idxprom23.4 = sext i32 %add22.4 to i64
  %arrayidx24.4 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.4
  %18 = load float, ptr addrspace(1) %arrayidx24.4, align 4, !tbaa !18
  %mul25.4 = fmul contract float %mul20.4, %18
  %add30.4 = fadd contract float %add30.3, %mul25.4
  store float %add30.4, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.4 = or disjoint i32 %k.058, 5
  %add17.5 = add nsw i32 %inc.4, %mul12
  %idxprom18.5 = sext i32 %add17.5 to i64
  %arrayidx19.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.5
  %19 = load float, ptr addrspace(1) %arrayidx19.5, align 4, !tbaa !18
  %mul20.5 = fmul contract float %alpha, %19
  %mul21.5 = shl nuw nsw i32 %inc.4, 9
  %add22.5 = add nsw i32 %mul21.5, %add
  %idxprom23.5 = sext i32 %add22.5 to i64
  %arrayidx24.5 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.5
  %20 = load float, ptr addrspace(1) %arrayidx24.5, align 4, !tbaa !18
  %mul25.5 = fmul contract float %mul20.5, %20
  %add30.5 = fadd contract float %add30.4, %mul25.5
  store float %add30.5, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.5 = or disjoint i32 %k.058, 6
  %add17.6 = add nsw i32 %inc.5, %mul12
  %idxprom18.6 = sext i32 %add17.6 to i64
  %arrayidx19.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.6
  %21 = load float, ptr addrspace(1) %arrayidx19.6, align 4, !tbaa !18
  %mul20.6 = fmul contract float %alpha, %21
  %mul21.6 = shl nuw nsw i32 %inc.5, 9
  %add22.6 = add nsw i32 %mul21.6, %add
  %idxprom23.6 = sext i32 %add22.6 to i64
  %arrayidx24.6 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.6
  %22 = load float, ptr addrspace(1) %arrayidx24.6, align 4, !tbaa !18
  %mul25.6 = fmul contract float %mul20.6, %22
  %add30.6 = fadd contract float %add30.5, %mul25.6
  store float %add30.6, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.6 = or disjoint i32 %k.058, 7
  %add17.7 = add nsw i32 %inc.6, %mul12
  %idxprom18.7 = sext i32 %add17.7 to i64
  %arrayidx19.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.7
  %23 = load float, ptr addrspace(1) %arrayidx19.7, align 4, !tbaa !18
  %mul20.7 = fmul contract float %alpha, %23
  %mul21.7 = shl nuw nsw i32 %inc.6, 9
  %add22.7 = add nsw i32 %mul21.7, %add
  %idxprom23.7 = sext i32 %add22.7 to i64
  %arrayidx24.7 = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.7
  %24 = load float, ptr addrspace(1) %arrayidx24.7, align 4, !tbaa !18
  %mul25.7 = fmul contract float %mul20.7, %24
  %add30.7 = fadd contract float %add30.6, %mul25.7
  store float %add30.7, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.7 = add nuw nsw i32 %k.058, 8
  %niter.next.7 = add nuw nsw i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %if.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !20

if.end.loopexit.unr-lcssa:                        ; preds = %for.body
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %if.end, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %if.end.loopexit.unr-lcssa, %for.body.preheader
  %add3059.epil.init = phi float [ %mul14, %for.body.preheader ], [ %add30.7, %if.end.loopexit.unr-lcssa ]
  %k.058.epil.init = phi i32 [ 0, %for.body.preheader ], [ %inc.7, %if.end.loopexit.unr-lcssa ]
  %lcmp.mod60 = icmp ne i32 %xtraiter, 0
  tail call void @llvm.assume(i1 %lcmp.mod60)
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %add3059.epil = phi float [ %add30.epil, %for.body.epil ], [ %add3059.epil.init, %for.body.epil.preheader ]
  %k.058.epil = phi i32 [ %inc.epil, %for.body.epil ], [ %k.058.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
  %add17.epil = add nsw i32 %k.058.epil, %mul12
  %idxprom18.epil = sext i32 %add17.epil to i64
  %arrayidx19.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %a.coerce, i64 %idxprom18.epil
  %25 = load float, ptr addrspace(1) %arrayidx19.epil, align 4, !tbaa !18
  %mul20.epil = fmul contract float %alpha, %25
  %mul21.epil = shl nuw nsw i32 %k.058.epil, 9
  %add22.epil = add nsw i32 %mul21.epil, %add
  %idxprom23.epil = sext i32 %add22.epil to i64
  %arrayidx24.epil = getelementptr inbounds [4 x i8], ptr addrspace(1) %b.coerce, i64 %idxprom23.epil
  %26 = load float, ptr addrspace(1) %arrayidx24.epil, align 4, !tbaa !18
  %mul25.epil = fmul contract float %mul20.epil, %26
  %add30.epil = fadd contract float %add3059.epil, %mul25.epil
  store float %add30.epil, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %inc.epil = add nuw nsw i32 %k.058.epil, 1
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %if.end, label %for.body.epil, !llvm.loop !22

if.end:                                           ; preds = %if.end.loopexit.unr-lcssa, %for.body.epil, %if.then, %entry
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

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="1,1024" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-z" "amdgpu-no-wwm" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx942" "uniform-work-group-size" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }

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
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
