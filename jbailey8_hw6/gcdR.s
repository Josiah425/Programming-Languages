	.file	"gcdR.c"
	.text
	.globl	gcdR
	.type	gcdR, @function
gcdR:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)             # push first parameter i
	movl	%esi, -8(%rbp)             # push second parameter j
	cmpl	$0, -8(%rbp)
	jne	.L2
	movl	-4(%rbp), %eax             # return i by moving it to eax
	jmp	.L3
.L2:
	movl	-4(%rbp), %eax             # move i into eax
	cltd
	idivl	-8(%rbp)                   # divide i by j
	movl	-8(%rbp), %eax             # move j into eax
	movl	%edx, %esi                 # move remainder of edx into esi
	movl	%eax, %edi                 # move eax (j) into edi
	call	gcdR                       # call gcdR recursively
.L3:
	leave                              # exit out
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	gcdR, .-gcdR
	.ident	"GCC: (Debian 6.3.0-18) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
