;c2.asm
extern printf
%macro Dis_R 2 ; %1 - String to be displated, %2 result to display
	section .data
	section .text
		mov rdi, fmtint
		mov rsi, %1
		mov rdx,[%2]
		mov rax,0
		call printf
%endmacro
section .data
	number1 dq 128
	number2 dq 19
	neg_num dq -12

	fmt db "The numbers are %ld and %ld",10,0
	fmtint db "%s %ld",10,0
	sumi db "The Sum is",0
	difi db "The Diff is",0
	inci db "Number1 1 inceremented:",0
	deci db "Number1 1 Decremented:",0
	sali db "Number1 1 Shift left 2 (x4):",0
	sari db "Number1 1 Shift right 2 (/4):",0
	sariex db "Number 1 Shift right 2(/4) with sign etension:",0
	;		db "sign etenstion:",0 ; error in book?
	multi db "The product is ",0
	divi db "The Interfer quotient is",0
	remi db "The Module is",0

section .bss
	resulti resq 1
	modulo resq 1
section .text
	global main
main:
	push rbp,
	mov rbp,rsp

	;Displaysing numbers
	mov rdi, fmt
	mov rsi, [number1]
	mov rdx, [number2]
	mov rax, 0
	call printf

	;Adding
	mov rax, [number1]
	add rax, [number2]
	mov [resulti],rax
	;Display results
	mov rdi, fmtint
	mov rsi, sumi
	mov rdx, [resulti]
	mov rax,0
	call printf
	;Subtracting
	mov rax, [number1]
	sub rax, [number2]
	mov [resulti],rax
	Dis_R difi, resulti

	;++
	mov rax, [number1]
	inc rax
	mov [resulti],rax
	Dis_R inci, resulti

	;--
	mov rax, [number1]
	dec rax
	mov [resulti], rax
	Dis_R deci, resulti

	;shift arithmetic left
	mov rax, [number1]
	sal rax,2
	mov [resulti],rax
	Dis_R sali, resulti

	;shift arthmetic right
	mov rax, [number1]
	sar rax, 2
	mov [resulti], rax
	Dis_R sari, resulti

	;shift right with sign
	mov rax, [neg_num]
	sar rax, 2
	mov [resulti], rax
	Dis_R sariex, resulti
	
	;multi
	mov rax, [number1]
	imul qword [number2]
	mov [resulti],rax
	Dis_R multi, resulti

	;divide
	mov rax, [number1]
	mov rdx, 0 ; rdx must be 0 if we want to use remander value as the commond only replaces the lower bits.
	idiv qword [number2]
	mov [resulti], rax
	mov [modulo], rdx
	Dis_R divi, resulti
	Dis_R remi, modulo

	;call clean exit
	mov rax, 60 ; 60 = exit 
	mov rdi, 0 ; 0 = success exit code
	syscall ; quit application
