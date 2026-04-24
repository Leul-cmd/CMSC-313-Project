.section .bss
input_buffer:
	.skip 100
.section .data
input_message:
	.ascii "Please enter the number: "
output_message:
	.ascii "The double is: "
newline:
	.ascii "\n"
.section .text	
.globl _start

_start:
	mov $1, %rax 			# syscall number 1 (sys_write)
	mov $1, %rdi			# file descriptor 1 (stdout)
	lea input_message(%rip), %rsi	# pointer to input_message
	mov $25, %rdx			# length of input message
	syscall				# trigger syscall
	
	mov $0, %rax			# syscall number 0 (sys_read)
	mov $0, %rdi			# file descriptor 0 (stdin)
	lea input_buffer(%rip), %rsi	# address of input_buffer
	mov $100, %rdx			# maximum bytes to read
	syscall				# trigger syscall
	
	xor %rax, %rax			# set result to 0
	lea input_buffer(%rip), %rsi	# pointer to input_buffer

.convert:
	movzbq (%rsi), %rcx		# load current character
	cmp $'0', %cl			# check if it is less than '0'
	jl .conversion_done		# stop conversion if less than '0'
	cmp $'9', %cl			# check if it is greater than '9'
	jg .conversion_done		# stop conversion if greater than '9'
	sub $'0', %rcx			# convert the ascii character to digit
	imul $10, %rax, %rax		# result = result * 10
	add %rcx, %rax			# result = result + digit
	inc %rsi			# advance to next character
	jmp .convert			# repeat

.conversion_done:
	imul $2, %rax, %rax		# multiply by 2	
	lea input_buffer+99(%rip), %rdi	# point to the end of the buffer
	mov %rdi, %r8			# save the end pointer
	cmp $0, %rax			# check if number is not equal to 0
	jne .convert_back		# convert back if not equal to zero  
	dec %rdi
	movb $'0', (%rdi)		# handle zero case
	jmp .print			

.convert_back:
	mov $10, %rbx			# divisor for decimal conversion

.loop_back:
	xor %rdx, %rdx			# clear remainder
	div %rbx			# divide rax by 10
	add $'0', %dl			# convert remainder
	dec %rdi			# move backward in buffer
	mov %dl, (%rdi)			# store digit
	cmp $0, %rax			# check if quotient is zero
	jne .loop_back			# continue if not
	
.print:
	mov %rdi, %r9			# set pointer to start of string
	mov $1, %rax			# syscall number 1 (sys_write)
	mov $1, %rdi			# file descriptor 1 (stdout)
	lea output_message(%rip), %rsi	# address to output_message
	mov $15, %rdx			# length of output message
	syscall				# trigger syscall

	mov %r9, %rsi			# pointer to result string
	mov %r8, %rdx			# end pointer
	sub %rsi, %rdx			# calculate length
	mov $1, %rax			# syscall number 1 (sys_write)
	mov $1, %rdi			# file descriptor 1 (stdout)
	syscall				# trigger syscall

	mov $1, %rax			# syscall number 1 (sys_write)
	mov $1, %rdi			# file descriptor 1 (stdout)
	lea newline(%rip), %rsi		# pointer to newline character
	mov $1, %rdx			# length of newline character
	syscall				# trigger syscall
	jmp .exit			# proceed to exit

.exit:	
	mov $60, %rax			# syscall number 60 (sys_exit)
	xor %rdi, %rdi			# exit status 0
	syscall				# trigger syscall
