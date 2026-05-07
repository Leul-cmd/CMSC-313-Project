	.file	"hexdump.c"
	.text
	.globl	LINE
	.section	.rodata
	.align 8
	.type	LINE, @object
	.size	LINE, 8
LINE:
	.quad	16
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
.LFB0:
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
	subq	$104, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -132(%rbp)
	movq	%rsi, -144(%rbp)
	cmpl	$2, -132(%rbp)
	jne	.L2
	movq	-144(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	je	.L3
	movq	%rsp, %rax
	movq	%rax, %rbx
	movl	$16, %eax
	subq	$1, %rax
	movq	%rax, -120(%rbp)
	movl	$16, %eax
	movq	%rax, %r14
	movl	$0, %r15d
	movl	$16, %eax
	movq	%rax, %r12
	movl	$0, %r13d
	movl	$16, %edx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -128(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -64(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movl	%eax, -68(%rbp)
	jmp	.L4
.L12:
	movq	-56(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -56(%rbp)
	movl	-68(%rbp), %edx
	movl	%edx, %ecx
	movq	-128(%rbp), %rdx
	movb	%cl, (%rdx,%rax)
	movl	$16, %eax
	cmpq	%rax, -56(%rbp)
	jne	.L5
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	$0, -80(%rbp)
	jmp	.L6
.L7:
	movq	-128(%rbp), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	addq	$1, -80(%rbp)
.L6:
	movl	$16, %eax
	cmpq	%rax, -80(%rbp)
	jb	.L7
	movl	$124, %edi
	call	putchar
	movq	$0, -88(%rbp)
	jmp	.L8
.L11:
	call	__ctype_b_loc
	movq	(%rax), %rdx
	movq	-128(%rbp), %rcx
	movq	-88(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$16384, %eax
	testl	%eax, %eax
	je	.L9
	movq	-128(%rbp), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	jmp	.L10
.L9:
	movl	$46, %eax
.L10:
	movl	%eax, %edi
	call	putchar
	addq	$1, -88(%rbp)
.L8:
	movl	$16, %eax
	cmpq	%rax, -88(%rbp)
	jb	.L11
	movl	$.LC3, %edi
	call	puts
	movl	$16, %eax
	addq	%rax, -64(%rbp)
	movq	$0, -56(%rbp)
.L5:
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movl	%eax, -68(%rbp)
.L4:
	cmpl	$-1, -68(%rbp)
	jne	.L12
	cmpq	$0, -56(%rbp)
	je	.L13
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	$0, -96(%rbp)
	jmp	.L14
.L17:
	movq	-96(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jnb	.L15
	movq	-128(%rbp), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	jmp	.L16
.L15:
	movl	$32, %edi
	call	putchar
.L16:
	addq	$1, -96(%rbp)
.L14:
	movl	$16, %eax
	cmpq	%rax, -96(%rbp)
	jb	.L17
	movl	$124, %edi
	call	putchar
	movq	$0, -104(%rbp)
	jmp	.L18
.L21:
	call	__ctype_b_loc
	movq	(%rax), %rdx
	movq	-128(%rbp), %rcx
	movq	-104(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$16384, %eax
	testl	%eax, %eax
	je	.L19
	movq	-128(%rbp), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	jmp	.L20
.L19:
	movl	$46, %eax
.L20:
	movl	%eax, %edi
	call	putchar
	addq	$1, -104(%rbp)
.L18:
	movq	-104(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jb	.L21
	movl	$.LC3, %edi
	call	puts
.L13:
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	%rbx, %rsp
	jmp	.L22
.L3:
	movl	$.LC4, %edi
	call	puts
	jmp	.L22
.L2:
	movl	$.LC5, %edi
	call	puts
.L22:
	movl	$0, %eax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
