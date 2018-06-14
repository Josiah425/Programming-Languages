	.file	"gcdR.c"
	.text
	.p2align 4,,15
	.globl	gcdR
	.type	gcdR, @function
gcdR:
.LFB11:
	.cfi_startproc
	testl	%esi, %esi
	movl	%edi, %eax
	jne	.L3
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L5:
	movl	%edx, %esi
.L3:
	cltd
	idivl	%esi
	movl	%esi, %eax
	testl	%edx, %edx
	jne	.L5
.L1:
	movl	%esi, %eax
	ret
.L7:
	movl	%edi, %esi
	jmp	.L1
	.cfi_endproc
.LFE11:
	.size	gcdR, .-gcdR
	.ident	"GCC: (Debian 6.3.0-18) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
