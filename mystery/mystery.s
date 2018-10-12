    .file	"mystery.c"
    .comm	num,1600,32
    .text
    .globl	add
    .type	add, @function
add:
.LFB2:
    .cfi_startproc
    pushq	%rbp
    .cfi_def_cfa_offset 16
    .cfi_offset 6, -16
    movq	%rsp, %rbp
    .cfi_def_cfa_register 6
    movq	%rdi, -8(%rbp)
    movq	%rsi, -16(%rbp)
    movq	-16(%rbp), %rax
    movq	-8(%rbp), %rdx
    addq	%rdx, %rax
    popq	%rbp
    .cfi_def_cfa 7, 8
    ret
    .cfi_endproc
.LFE2:
    .size	add, .-add
    .globl	dothething
    .type	dothething, @function
dothething:
.LFB3:
    .cfi_startproc
    pushq	%rbp
    .cfi_def_cfa_offset 16
    .cfi_offset 6, -16
    movq	%rsp, %rbp
    .cfi_def_cfa_register 6
    pushq	%rbx
    subq	$40, %rsp # end function prologue
    .cfi_offset 3, -24
    movq	%rdi, -40(%rbp) # our int from argv... when dothething was called
    movq	-40(%rbp), %rax # back into %rax with you!
    movq	num(,%rax,8), %rax # perhaps I should research this... second time it has come up
    # above is saying move what is in %rax * 8 + num (which i assume from line 2 is 32...)
    # this was made to be $-1 earlier in .L12
    cmpq	$-1, %rax # so we compare whether .L12 was hit, by seeing if these are equal.
    je	.L4 # if so, go to .L4
    movq	-40(%rbp), %rax # else we move our arg back into %rax...
    movq	num(,%rax,8), %rax
    jmp	.L5
.L4:
    movq	$-1, -24(%rbp)
    cmpq	$0, -40(%rbp)
    jne	.L6
    movq	$0, -24(%rbp)
    jmp	.L7
.L6:
    cmpq	$1, -40(%rbp)
    jne	.L8
    movq	$1, -24(%rbp)
    jmp	.L7
.L8:
    movq	-40(%rbp), %rax
    subq	$2, %rax
    movq	%rax, %rdi
    call	dothething
    movq	%rax, %rbx
    movq	-40(%rbp), %rax
    subq	$1, %rax
    movq	%rax, %rdi
    call	dothething
    movq	%rbx, %rsi
    movq	%rax, %rdi
    call	add
    movq	%rax, -24(%rbp)
.L7:
    movq	-40(%rbp), %rax
    movq	num(,%rax,8), %rax
    cmpq	$-1, %rax
    jne	.L9
    movq	-40(%rbp), %rax
    movq	-24(%rbp), %rdx
    movq	%rdx, num(,%rax,8)
.L9:
    movq	-40(%rbp), %rax
    movq	num(,%rax,8), %rax
.L5:
    addq	$40, %rsp
    popq	%rbx
    popq	%rbp
    .cfi_def_cfa 7, 8
    ret
    .cfi_endproc
.LFE3:
    .size	dothething, .-dothething
    .section	.rodata
.LC0:
    .string	"Value:   %d\n"
    .text
    .globl	main
    .type	main, @function
main:
.LFB4:
    .cfi_startproc
    pushq	%rbp
    .cfi_def_cfa_offset 16
    .cfi_offset 6, -16
    movq	%rsp, %rbp
    .cfi_def_cfa_register 6
    subq	$32, %rsp
    movl	%edi, -20(%rbp) # I think this is storing the string from argv...
    movq	%rsi, -32(%rbp)
    movq	-32(%rbp), %rax
    addq	$8, %rax # add an immediate 0x0008 to %rax
    movq	(%rax), %rax
    movq	%rax, %rdi
    call	atoi # string to int function in C... so we have turned the arg into an int..
    movl	%eax, -8(%rbp) # make one more variable...
    movl	$0, -4(%rbp) # ...and an immediate 0x0000
    jmp	.L11
.L12:
    movl	-4(%rbp), %eax # as i suspected below, cltq operates on %eax, making an int to an int64
    cltq
    movq	$-1, num(,%rax,8) # not quite sure what this does..
    # after researching, this specific thing above moved $-1 into the space at %rax * 8 + 32(num)
    addl	$1, -4(%rbp) # this adds 0x0001 to that spot in memory where 0x0000 currently would be
.L11:
    cmpl	$199, -4(%rbp) # if arg <= 199 jump to .L12? or more likely it is comparing what is in the %eax register
    jle	.L12
    movl	-8(%rbp), %eax
    cltq    # again, making %eax a long int.
    movq	%rax, %rdi # here, %rax is our int from the argv, getting passed to %rdi to be accessed there...
    call	dothething
    movq	%rax, %rsi
    movl	$.LC0, %edi
    movl	$0, %eax
    call	printf
    movl	$0, %eax
    leave
    .cfi_def_cfa 7, 8
    ret
    .cfi_endproc
.LFE4:
    .size	main, .-main
    .ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-4)"
    .section	.note.GNU-stack,"",@progbits
