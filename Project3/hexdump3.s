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
	.section	.text.startup,"ax",@progbits
	.p2align 4
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
	je	.L32
	movl	$.LC5, %edi
	call	puts
.L28:
	leaq	-40(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L32:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movl	$.LC0, %esi
	call	fopen
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L3
	movq	%rax, %rdi
	movq	%rsp, %r14
	call	fgetc
	cmpl	$-1, %eax
	je	.L5
	movb	%al, -64(%rbp)
	xorl	%r13d, %r13d
	movl	$1, %ebx
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L12:
	movb	%al, -64(%rbp,%rbx)
	leaq	1(%rbx), %rdx
	cmpq	$15, %rbx
	je	.L33
.L6:
	movq	%rdx, %rbx
.L22:
	movq	%r12, %rdi
	call	fgetc
	cmpl	$-1, %eax
	jne	.L12
	testq	%rbx, %rbx
	jne	.L34
.L5:
	movq	%r12, %rdi
	call	fclose
	movq	%r14, %rsp
	jmp	.L28
.L33:
	movq	%r13, %rsi
	movl	$.LC1, %edi
	leaq	-48(%rbp), %r15
	xorl	%eax, %eax
	call	printf
	leaq	-64(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L7:
	movzbl	(%rbx), %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpq	%rbx, %r15
	jne	.L7
	movl	$124, %edi
	call	putchar
	call	__ctype_b_loc
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L11:
	movq	-72(%rbp), %rax
	movzbl	(%rax), %edx
	movq	(%rbx), %rax
	movq	%rdx, %rdi
	testb	$64, 1(%rax,%rdx,2)
	jne	.L30
	movl	$46, %edi
.L30:
	call	putchar
	addq	$1, -72(%rbp)
	movq	-72(%rbp), %rax
	cmpq	%rax, %r15
	jne	.L11
	movl	$.LC3, %edi
	addq	$16, %r13
	call	puts
	xorl	%edx, %edx
	jmp	.L6
.L34:
	movq	%r13, %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	call	printf
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L36:
	movzbl	-64(%r15,%rbp), %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	movq	%r15, %rax
	addq	$1, %rax
	movq	%rax, %r15
	cmpq	$16, %rax
	je	.L35
.L16:
	cmpq	%r15, %rbx
	ja	.L36
	movl	$32, %edi
	call	putchar
	movq	%r15, %rax
	addq	$1, %rax
	movq	%rax, %r15
	cmpq	$16, %rax
	jne	.L16
.L35:
	movl	$124, %edi
	call	putchar
	call	__ctype_b_loc
	movq	%rax, %r13
	leaq	-64(%rbp), %rax
	movq	%rax, %r15
	addq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L20:
	movzbl	(%r15), %edx
	movq	0(%r13), %rax
	movq	%rdx, %rdi
	testb	$64, 1(%rax,%rdx,2)
	jne	.L17
	movl	$46, %edi
	addq	$1, %r15
	call	putchar
	cmpq	%r15, %rbx
	jne	.L20
.L19:
	movl	$.LC3, %edi
	call	puts
	jmp	.L5
.L17:
	call	putchar
	movq	%r15, %rax
	addq	$1, %rax
	movq	%rax, %r15
	cmpq	%rax, %rbx
	jne	.L20
	jmp	.L19
.L3:
	movl	$.LC4, %edi
	call	puts
	jmp	.L28
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
