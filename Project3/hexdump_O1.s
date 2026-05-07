	.file	"hexdump.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"rb"
.LC1:
	.string	"%08zx "
.LC2:
	.string	"%02x "
.LC3:
	.string	"|"
.LC4:
	.string	"File doesn't exist"
.LC5:
	.string	"No attached file"
	.text
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	cmpl	$2, %edi
	je	.L26
	movl	$.LC5, %edi
	call	puts
.L24:
	movl	$0, %eax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L26:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movl	$.LC0, %esi
	call	fopen
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L3
	movq	%rsp, -72(%rbp)
	movq	%rax, %rdi
	call	fgetc
	cmpl	$-1, %eax
	je	.L5
	movb	%al, -64(%rbp)
	movl	$0, %r15d
	movl	$1, %ebx
	jmp	.L17
.L28:
	movl	$.LC3, %edi
	call	puts
	addq	$16, %r15
	movl	$0, %edx
.L6:
	movq	%rdx, %rbx
.L17:
	movq	%r12, %rdi
	call	fgetc
	cmpl	$-1, %eax
	je	.L27
	leaq	1(%rbx), %rdx
	movb	%al, -64(%rbp,%rbx)
	cmpq	$15, %rbx
	jne	.L6
	movq	%r15, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	leaq	-64(%rbp), %rbx
	movq	%rbx, %r13
.L7:
	movzbl	0(%r13), %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	addq	$1, %r13
	leaq	-48(%rbp), %rax
	cmpq	%r13, %rax
	jne	.L7
	movl	$124, %edi
	call	putchar
	call	__ctype_b_loc
	movq	%rax, %r13
	movl	$46, %r14d
.L9:
	movzbl	(%rbx), %edi
	movzbl	%dil, %edx
	movq	0(%r13), %rax
	testb	$64, 1(%rax,%rdx,2)
	cmove	%r14d, %edi
	movzbl	%dil, %edi
	call	putchar
	addq	$1, %rbx
	leaq	-48(%rbp), %rax
	cmpq	%rbx, %rax
	jne	.L9
	jmp	.L28
.L27:
	testq	%rbx, %rbx
	jne	.L29
.L5:
	movq	%r12, %rdi
	call	fclose
	movq	-72(%rbp), %rsp
	jmp	.L24
.L29:
	movq	%r15, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %r14d
	jmp	.L13
.L11:
	movl	$32, %edi
	call	putchar
.L12:
	movq	%r14, %rax
	addq	$1, %rax
	movq	%rax, %r14
	cmpq	$16, %rax
	je	.L30
.L13:
	cmpq	%r14, %rbx
	jbe	.L11
	movzbl	-64(%r14,%rbp), %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	jmp	.L12
.L30:
	movl	$124, %edi
	call	putchar
	call	__ctype_b_loc
	movq	%rax, %r13
	leaq	-64(%rbp), %rax
	addq	%rax, %rbx
	movl	$46, %r14d
.L15:
	movq	%rax, %r15
	movzbl	(%rax), %edi
	movzbl	%dil, %edx
	movq	0(%r13), %rax
	testb	$64, 1(%rax,%rdx,2)
	cmove	%r14d, %edi
	movzbl	%dil, %edi
	call	putchar
	addq	$1, %r15
	movq	%r15, %rax
	cmpq	%rbx, %r15
	jne	.L15
	movl	$.LC3, %edi
	call	puts
	jmp	.L5
.L3:
	movl	$.LC4, %edi
	call	puts
	jmp	.L24
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.globl	LINE
	.section	.rodata
	.align 8
	.type	LINE, @object
	.size	LINE, 8
LINE:
	.quad	16
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
