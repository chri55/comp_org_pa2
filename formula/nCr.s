	.text
	.globl	Factorial
	.type	Factorial, @function
Factorial:
.LFB0:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %eax
	cltq
	movq	%rax, -8(%rbp)
	movl	$1, -12(%rbp)
	jmp	.L2	#
.L3:
	movl	-12(%rbp), %eax
	cltq
	movq	-8(%rbp), %rdx
	imulq	%rdx, %rax
	movq	%rax, -8(%rbp)
	addl	$1, -12(%rbp)
.L2:
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L3	#,
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	Factorial, .-Factorial
	.globl	nCr
	.type	nCr, @function

nCr:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	Factorial
	movq	%rax, %rbx
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	call	Factorial
	movq	%rax, %r12
	movl	-36(%rbp), %eax
	subl	-40(%rbp), %eax
	movl	%eax, %edi
	call	Factorial
	movq	%r12, %rdx
	imulq	%rax, %rdx
	movq	%rdx, %rcx
	movq	%rbx, %rax
	cqto
	idivq	%rcx
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	nCr, .-nCr
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	" + %lix^%d"
.LC2:
	.string	" + x^%d"
.LC3:
	.string	"%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$312, %rsp	#,
	.cfi_offset 3, -24
	movl	%edi, -308(%rbp)
	movq	%rsi, -320(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	-320(%rbp), %rax
	addq	$8, %rax	#, D.2504
	movq	(%rax), %rax
	leaq	-304(%rbp), %rdx
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	leaq	-288(%rbp), %rax
	movw	$8241, (%rax)
	movb	$0, 2(%rax)
	movq	$0, -296(%rbp)
	movl	$1, -300(%rbp)
	jmp	.L8
.L9:
	movl	-304(%rbp), %eax
	movl	-300(%rbp), %edx
	movl	%edx, %esi
	movl	%eax, %edi
	call	nCr
	movq	%rax, -296(%rbp)
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	leaq	-288(%rbp), %rax
	leaq	(%rax,%rdx), %rdi
	movl	-300(%rbp), %edx
	movq	-296(%rbp), %rax
	movl	%edx, %ecx
	movq	%rax, %rdx
	movl	$.LC1, %esi
	movl	$0, %eax
	call	sprintf
	movq	$0, -296(%rbp)
	addl	$1, -300(%rbp)
.L8:
	movl	-304(%rbp), %eax
	cmpl	%eax, -300(%rbp)
	jl	.L9	#,
	movl	-304(%rbp), %ebx
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	leaq	-288(%rbp), %rax
	addq	%rdx, %rax
	movl	%ebx, %edx
	movl	$.LC2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-288(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L11
	call	__stack_chk_fail
.L11:
	addq	$312, %rsp	#,
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
