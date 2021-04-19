;c2.asm
section .data
	bNum db 123
	wNum dw 12345
	dNum dd 1234567890
	qNum1 dq 1234567890123456789
	qNum2 dq 123456
	qNum3 dq 3.14
section .bss
section .text
	global main
main:
	push rbp
	mov rbp,rsp

	mov rax, -1
	mov al, byte [bNum]
	xor rax,rax
	mov al, vyte [bNum]

	mov rax,-1
	mov ax, word [wNum]
	xor rax,rax
	mav ax, word [wNum]

	mov rax,-1
	mov eax, dword [dNum]

	mov rax, -1
	mov rax, qword [qNum1]
	mov qword [qNum2], rax
	mov rax, 123456

	movq xmm0, [qNum3]

	#call clean exit
	mov rax, 60 ; 60 = exit 
	mov rdi, 0 ; 0 = success exit code
	syscall ; quit application
