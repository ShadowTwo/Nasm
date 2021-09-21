;c2.asm
extern printf

section .data
	fmt db	"Value: %d ",0
section .bss
section .text
	global main
main:
	;cmp rdi, 0 ; NUll reference
    ;je .end
	push rbp
	mov rbp,rsp

	move rsi, rsp
	push rsi



	sub rsp, 40

	xor rax, rax
	xor r9,r9	
	mov eax, [rsi]
					    
	.loop:
		mov [rdi+r9], eax
		add rax, rdx
		inc r9
		dec esi   
		jnz .loop
	.end:
	lea r10, [rdi]           ; copying <outp> to RAX as the result
	ret

	pop rcx
	xor r9,r9
	.print:
	mov rdi, fmt
	mov rsi, [r10+r9]
    xor rax,rax
	call printf
	dec rcx
	jnz .print

	pop rbp
	;call clean exit
	mov rax, 60 ; 60 = exit 
	mov rdi, 0 ; 0 = success exit code
	syscall ; quit application
