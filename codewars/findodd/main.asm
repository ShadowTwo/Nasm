global main
section .data
	TestData dd 20,1,-1,2,-2,3,3,20,5,1,2,4,20,4,-1,-2,5
	length dd 17
section .text
main:
	push rbp
	mov rbp,rsp

	;move my test data into place
	mov edi, TestData ; array of data
	mov esi, [length] ; legth of array

	xor eax,eax
	.loop:
	xor eax,[rdi]
	add edi, 4
	dec esi
	jnz .loop
	ret
