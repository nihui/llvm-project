; RUN: llc < %s
; PR5703
target datalayout = "e-p:16:8:8-i8:8:8-i16:8:8-i32:8:8"
target triple = "msp430-unknown-linux-gnu"

define msp430_intrcc void @foo() nounwind #0 {
entry:
	%fa = call ptr @llvm.frameaddress(i32 0)
	store i8 0, ptr %fa
	ret void
}

declare ptr @llvm.frameaddress(i32)

attributes #0 = { noinline nounwind optnone "interrupt"="2" }
