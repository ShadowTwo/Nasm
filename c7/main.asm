;main.asm
; vim:ft=nasm
;external functions
extern printf

section .data
	number1 dq 42
	number2 dq 41
	fmt1 db "Number1 >= Number2",10,0
	fmt2 db "Number1 < Number2",10,0
section .bss
section .text
	global main
main:
	
	push rbp
	mov rbp, rsp

	mov rax, [number1]
	mov rbx, [number2]

	cmp rax,rbx
	jge greater

	mov rdi, fmt2
	jmp exit
greater:
	mov rdi, fmt1

exit:
	mov rax, 0
	call printf
	mov rsp, rbp
	pop rbp
	ret

	;call clean exit
	;mov rax, 60 ; 60 = exit 
	;mov rdi, 0 ; 0 = success exit code
	;syscall ; quit application
