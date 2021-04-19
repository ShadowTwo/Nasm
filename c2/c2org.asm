;c2.asm
section .data
	msg1 db "Hello, World!",10,0
	msg1Len equ $-msg1-1
	msg2 db "Alive and Kicking!",10,0
	msg2Len equ $-msg2-1
	radius dq 357
	pi dq 3.14

section .bss
section .text
	global main
main:
	;Function prologue
	push rbp
	mov rbp,rsp
	
	;Prep to sent to printf
	mov rax,1 ; 
	mov rdi,1
	mov rsi, msg1
	mov rdx, msg1Len
	syscall

	mov rax,1
	mov rdi,1
	mov rsi, msg2
	mov rdx, msg2Len
	syscall

	;Function epilogue
	mov rsp, rbp
	pop rbp

	;call clean exit
	mov rax, 60 ; 60 = exit 
	mov rdi, 0 ; 0 = success exit code
	syscall ; quit application
