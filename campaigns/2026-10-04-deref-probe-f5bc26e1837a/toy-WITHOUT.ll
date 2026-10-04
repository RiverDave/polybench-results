define float @probe(ptr noalias align 4 %p, i1 %c) {
entry:
  br i1 %c, label %read, label %exit
read:
  %v = load float, ptr %p, align 4
  br label %exit
exit:
  %r = phi float [ 0.0, %entry ], [ %v, %read ]
  ret float %r
}
