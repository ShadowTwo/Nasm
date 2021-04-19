;c1.asm
section .data
	msg db "Hello, world",10,0
section .bss
section .text
	global main
main:
	mov rax, 1 ; 1 = write
	mov rdi, 1 ; 1 = to stdout
	mov rsi, msg ; string to display in rsi
	mov rdx, 13 ; length of string without the 0
	syscall ; display string to stdout
	mov rax, 60 ; 60 = exit 
	mov rdi, 0 ; 0 = success exit code
	syscall ; quit application
