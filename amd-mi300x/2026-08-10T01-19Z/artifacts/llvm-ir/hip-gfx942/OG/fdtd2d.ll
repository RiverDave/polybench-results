; ModuleID = '/root/polybenchGpu/HIP/FDTD-2D/fdtd2d.hip.cpp'
source_filename = "/root/polybenchGpu/HIP/FDTD-2D/fdtd2d.hip.cpp"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"
target triple = "amdgcn-amd-amdhsa"

@__hip_cuid_f1a58f66ff0aa0a5 = addrspace(1) global i8 0
@llvm.compiler.used = appending addrspace(1) global [1 x ptr] [ptr addrspacecast (ptr addrspace(1) @__hip_cuid_f1a58f66ff0aa0a5 to ptr)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z17fdtd_step1_kerneliiPfS_S_S_i(i32 noundef %nx, i32 noundef %ny, ptr addrspace(1) nofree noundef readonly captures(none) %_fict_.coerce, ptr addrspace(1) nofree noundef readnone captures(none) %ex.coerce, ptr addrspace(1) nofree noundef captures(none) %ey.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %hz.coerce, i32 noundef %t) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i59 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i59
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i68 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i65 = zext i16 %.in.i68 to i32
  %mul9 = mul i32 %4, %conv.i65
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add11 = add i32 %mul9, %6
  %cmp = icmp slt i32 %add11, %nx
  %cmp12 = icmp slt i32 %add, %ny
  %or.cond = and i1 %cmp12, %cmp
  br i1 %or.cond, label %if.then, label %if.end38

if.then:                                          ; preds = %entry
  %cmp13 = icmp eq i32 %add11, 0
  br i1 %cmp13, label %if.then14, label %if.else

if.then14:                                        ; preds = %if.then
  %idxprom = sext i32 %t to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %_fict_.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %idxprom17 = sext i32 %add to i64
  %arrayidx18 = getelementptr inbounds [4 x i8], ptr addrspace(1) %ey.coerce, i64 %idxprom17
  store float %7, ptr addrspace(1) %arrayidx18, align 4, !tbaa !18
  br label %if.end38

if.else:                                          ; preds = %if.then
  %mul19 = shl nsw i32 %add11, 11
  %add20 = add nsw i32 %mul19, %add
  %idxprom21 = sext i32 %add20 to i64
  %arrayidx22 = getelementptr inbounds [4 x i8], ptr addrspace(1) %ey.coerce, i64 %idxprom21
  %8 = load float, ptr addrspace(1) %arrayidx22, align 4, !tbaa !18
  %arrayidx26 = getelementptr inbounds [4 x i8], ptr addrspace(1) %hz.coerce, i64 %idxprom21
  %9 = load float, ptr addrspace(1) %arrayidx26, align 4, !tbaa !18
  %mul27 = add i32 %add, -2048
  %add28 = add i32 %mul27, %mul19
  %idxprom29 = sext i32 %add28 to i64
  %arrayidx30 = getelementptr inbounds [4 x i8], ptr addrspace(1) %hz.coerce, i64 %idxprom29
  %10 = load float, ptr addrspace(1) %arrayidx30, align 4, !tbaa !18
  %sub31 = fsub contract float %9, %10
  %mul32 = fmul contract float %sub31, 5.000000e-01
  %sub33 = fsub contract float %8, %mul32
  store float %sub33, ptr addrspace(1) %arrayidx22, align 4, !tbaa !18
  br label %if.end38

if.end38:                                         ; preds = %if.then14, %if.else, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z17fdtd_step2_kerneliiPfS_S_i(i32 noundef %nx, i32 noundef %ny, ptr addrspace(1) nofree noundef captures(none) %ex.coerce, ptr addrspace(1) nofree noundef readnone captures(none) %ey.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %hz.coerce, i32 noundef %t) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i48 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i48
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i57 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i54 = zext i16 %.in.i57 to i32
  %mul8 = mul i32 %4, %conv.i54
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add10 = add i32 %mul8, %6
  %cmp = icmp slt i32 %add10, %nx
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %cmp11 = icmp slt i32 %add, %ny
  %cmp13 = icmp sgt i32 %add, 0
  %or.cond = and i1 %cmp11, %cmp13
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %mul14 = shl nsw i32 %add10, 11
  %add15 = add nsw i32 %mul14, %add
  %idxprom = sext i32 %add15 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %ex.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %arrayidx19 = getelementptr inbounds [4 x i8], ptr addrspace(1) %hz.coerce, i64 %idxprom
  %8 = load float, ptr addrspace(1) %arrayidx19, align 4, !tbaa !18
  %sub = add nsw i32 %add, -1
  %add21 = add nsw i32 %sub, %mul14
  %idxprom22 = sext i32 %add21 to i64
  %arrayidx23 = getelementptr inbounds [4 x i8], ptr addrspace(1) %hz.coerce, i64 %idxprom22
  %9 = load float, ptr addrspace(1) %arrayidx23, align 4, !tbaa !18
  %sub24 = fsub contract float %8, %9
  %mul25 = fmul contract float %sub24, 5.000000e-01
  %sub26 = fsub contract float %7, %mul25
  store float %sub26, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define protected amdgpu_kernel void @_Z17fdtd_step3_kerneliiPfS_S_i(i32 noundef %nx, i32 noundef %ny, ptr addrspace(1) nofree noundef readonly captures(none) %ex.coerce, ptr addrspace(1) nofree noundef readonly captures(none) %ey.coerce, ptr addrspace(1) nofree noundef captures(none) %hz.coerce, i32 noundef %t) local_unnamed_addr #0 {
entry:
  %0 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %1 = tail call noundef dereferenceable(256) ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %2 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 12
  %.in.i = load i16, ptr addrspace(4) %2, align 4, !tbaa !16
  %conv.i63 = zext i16 %.in.i to i32
  %mul = mul i32 %0, %conv.i63
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %add = add i32 %mul, %3
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = getelementptr inbounds nuw i8, ptr addrspace(4) %1, i64 14
  %.in.i72 = load i16, ptr addrspace(4) %5, align 2, !tbaa !16
  %conv.i69 = zext i16 %.in.i72 to i32
  %mul8 = mul i32 %4, %conv.i69
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %add10 = add i32 %mul8, %6
  %sub = add nsw i32 %nx, -1
  %cmp = icmp slt i32 %add10, %sub
  %sub11 = add nsw i32 %ny, -1
  %cmp12 = icmp slt i32 %add, %sub11
  %or.cond = select i1 %cmp, i1 %cmp12, i1 false
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul13 = shl nsw i32 %add10, 11
  %add14 = add nsw i32 %mul13, %add
  %idxprom = sext i32 %add14 to i64
  %arrayidx = getelementptr inbounds [4 x i8], ptr addrspace(1) %hz.coerce, i64 %idxprom
  %7 = load float, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  %add16 = add nsw i32 %add, 1
  %add17 = add nsw i32 %add16, %mul13
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [4 x i8], ptr addrspace(1) %ex.coerce, i64 %idxprom18
  %8 = load float, ptr addrspace(1) %arrayidx19, align 4, !tbaa !18
  %arrayidx23 = getelementptr inbounds [4 x i8], ptr addrspace(1) %ex.coerce, i64 %idxprom
  %9 = load float, ptr addrspace(1) %arrayidx23, align 4, !tbaa !18
  %sub24 = fsub contract float %8, %9
  %mul26 = add i32 %add, 2048
  %add27 = add i32 %mul26, %mul13
  %idxprom28 = sext i32 %add27 to i64
  %arrayidx29 = getelementptr inbounds [4 x i8], ptr addrspace(1) %ey.coerce, i64 %idxprom28
  %10 = load float, ptr addrspace(1) %arrayidx29, align 4, !tbaa !18
  %add30 = fadd contract float %sub24, %10
  %arrayidx34 = getelementptr inbounds [4 x i8], ptr addrspace(1) %ey.coerce, i64 %idxprom
  %11 = load float, ptr addrspace(1) %arrayidx34, align 4, !tbaa !18
  %sub35 = fsub contract float %add30, %11
  %mul36 = fmul contract float %sub35, f0x3F333333
  %sub37 = fsub contract float %7, %mul36
  store float %sub37, ptr addrspace(1) %arrayidx, align 4, !tbaa !18
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
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
