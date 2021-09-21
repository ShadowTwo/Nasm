global main
section .data
	TestData dd 20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5
	length dd 17
section .text
main:
	;move my test data into place
	mov rdi, TestData ; array of data
	mov rsi, length ; legth of array

	xor eax,eax
	.loop
	xor eax,[rdi]
	add rdi, 4
	dec rsi
	jnz .loop
	ret
