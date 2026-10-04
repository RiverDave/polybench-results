define void @probe(ptr noalias align 4 dereferenceable(4) %p, ptr noalias align 4 dereferenceable(4) %q, i1 %c) {
entry:
  br i1 %c, label %write, label %exit
write:
  %v = load float, ptr %p, align 4
  store float %v, ptr %q, align 4
  br label %exit
exit:
  ret void
}
