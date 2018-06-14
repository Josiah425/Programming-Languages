	.file	"gcd.c"
	.text
	.globl	gcdI
	.type	gcdI, @function
gcdI:
.LFB0:
	.cfi_startproc
	pushq	%rbp //Creation of stack frame
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp //Creation of stack frame
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp) //Argument storage
	movl	%esi, -8(%rbp) //Argument storage
	jmp	.L2
.L4: //While loop
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L3
	//below is if part of statements
	movl	-8(%rbp), %eax
	subl	%eax, -4(%rbp) //Argument update
	jmp	.L2
.L3: //Else part of statements
	movl	-4(%rbp), %eax
	subl	%eax, -8(%rbp) //Argument update
.L2:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jne	.L4 //Jump to start of loop
	//End of loop
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret //Return result in %eax and exit function
	.cfi_endproc
.LFE0:
	.size	gcdI, .-gcdI
	.ident	"GCC: (Debian 6.3.0-18) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
