;c2.asm
section .data
section .bss
section .text
	global main
main:

	;call clean exit
	mov rax, 60 ; 60 = exit 
	mov rdi, 0 ; 0 = success exit code
	syscall ; quit application
