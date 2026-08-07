; ModuleID = 'ir-compare/gemm_minimal.cpp'
source_filename = "ir-compare/gemm_minimal.cpp"
target datalayout = "e-p6:32:32-i64:64-i128:128-i256:256-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define dso_local ptx_kernel void @gemm_kernel(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, float noundef %alpha, float noundef %beta, ptr noundef %a, ptr noundef %b, ptr noundef %c) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca float, align 4
  %beta.addr = alloca float, align 4
  %a.addr = alloca ptr, align 8
  %b.addr = alloca ptr, align 8
  %c.addr = alloca ptr, align 8
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %c_index = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, ptr %ni.addr, align 4
  store i32 %nj, ptr %nj.addr, align 4
  store i32 %nk, ptr %nk.addr, align 4
  store float %alpha, ptr %alpha.addr, align 4
  store float %beta, ptr %beta.addr, align 4
  store ptr %a, ptr %a.addr, align 8
  store ptr %b, ptr %b.addr, align 8
  store ptr %c, ptr %c.addr, align 8
  %call = call noundef i32 @_ZL8block_idj(i32 noundef 0) #3
  %call1 = call noundef i32 @_ZL10block_sizej(i32 noundef 0) #3
  %mul = mul i32 %call, %call1
  %call2 = call noundef i32 @_ZL9thread_idj(i32 noundef 0) #3
  %add = add i32 %mul, %call2
  store i32 %add, ptr %j, align 4
  %call3 = call noundef i32 @_ZL8block_idj(i32 noundef 1) #3
  %call4 = call noundef i32 @_ZL10block_sizej(i32 noundef 1) #3
  %mul5 = mul i32 %call3, %call4
  %call6 = call noundef i32 @_ZL9thread_idj(i32 noundef 1) #3
  %add7 = add i32 %mul5, %call6
  store i32 %add7, ptr %i, align 4
  %0 = load i32, ptr %i, align 4
  %1 = load i32, ptr %ni.addr, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, ptr %j, align 4
  %3 = load i32, ptr %nj.addr, align 4
  %cmp8 = icmp sge i32 %2, %3
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %for.end

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i32, ptr %i, align 4
  %5 = load i32, ptr %nj.addr, align 4
  %mul9 = mul nsw i32 %4, %5
  %6 = load i32, ptr %j, align 4
  %add10 = add nsw i32 %mul9, %6
  store i32 %add10, ptr %c_index, align 4
  %7 = load float, ptr %beta.addr, align 4
  %8 = load ptr, ptr %c.addr, align 8
  %9 = load i32, ptr %c_index, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds float, ptr %8, i64 %idxprom
  %10 = load float, ptr %arrayidx, align 4
  %mul11 = fmul contract float %10, %7
  store float %mul11, ptr %arrayidx, align 4
  store i32 0, ptr %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load i32, ptr %k, align 4
  %12 = load i32, ptr %nk.addr, align 4
  %cmp12 = icmp slt i32 %11, %12
  br i1 %cmp12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load float, ptr %alpha.addr, align 4
  %14 = load ptr, ptr %a.addr, align 8
  %15 = load i32, ptr %i, align 4
  %16 = load i32, ptr %nk.addr, align 4
  %mul13 = mul nsw i32 %15, %16
  %17 = load i32, ptr %k, align 4
  %add14 = add nsw i32 %mul13, %17
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds float, ptr %14, i64 %idxprom15
  %18 = load float, ptr %arrayidx16, align 4
  %mul17 = fmul contract float %13, %18
  %19 = load ptr, ptr %b.addr, align 8
  %20 = load i32, ptr %k, align 4
  %21 = load i32, ptr %nj.addr, align 4
  %mul18 = mul nsw i32 %20, %21
  %22 = load i32, ptr %j, align 4
  %add19 = add nsw i32 %mul18, %22
  %idxprom20 = sext i32 %add19 to i64
  %arrayidx21 = getelementptr inbounds float, ptr %19, i64 %idxprom20
  %23 = load float, ptr %arrayidx21, align 4
  %mul22 = fmul contract float %mul17, %23
  %24 = load ptr, ptr %c.addr, align 8
  %25 = load i32, ptr %c_index, align 4
  %idxprom23 = sext i32 %25 to i64
  %arrayidx24 = getelementptr inbounds float, ptr %24, i64 %idxprom23
  %26 = load float, ptr %arrayidx24, align 4
  %add25 = fadd contract float %26, %mul22
  store float %add25, ptr %arrayidx24, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %27 = load i32, ptr %k, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, ptr %k, align 4
  br label %for.cond, !llvm.loop !3

for.end:                                          ; preds = %if.then, %for.cond
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal noundef i32 @_ZL8block_idj(i32 noundef %dimension) #1 {
entry:
  %dimension.addr = alloca i32, align 4
  store i32 %dimension, ptr %dimension.addr, align 4
  %0 = load i32, ptr %dimension.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %2, %cond.false ]
  ret i32 %cond
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal noundef i32 @_ZL10block_sizej(i32 noundef %dimension) #1 {
entry:
  %dimension.addr = alloca i32, align 4
  store i32 %dimension, ptr %dimension.addr, align 4
  %0 = load i32, ptr %dimension.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %2, %cond.false ]
  ret i32 %cond
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal noundef i32 @_ZL9thread_idj(i32 noundef %dimension) #1 {
entry:
  %dimension.addr = alloca i32, align 4
  store i32 %dimension, ptr %dimension.addr, align 4
  %0 = load i32, ptr %dimension.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y()
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %2, %cond.false ]
  ret i32 %cond
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 65535) i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 1, 1025) i32 @llvm.nvvm.read.ptx.sreg.ntid.y() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.y() #2

attributes #0 = { convergent mustprogress noinline norecurse nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+sm_90" "uniform-work-group-size" }
attributes #1 = { convergent mustprogress noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_90" "target-features"="+sm_90" "uniform-work-group-size" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { convergent nounwind "uniform-work-group-size" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 23.0.0git (git@github.com:llvm/llvm-project.git 4305591c30c8aa15a8adeff77d4cd4abc6f1ef9c)"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
