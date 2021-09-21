section .text
global main

main:

  xor rdi, rdi

  mov rax, -10
 
  cmp rax, 3
  jle Done
  	mov rdi, 1

  Done:

  ;call clean exit
  mov rax, 60 ; 60 = exit 
  ;mov rdi, 0 ; 0 = success exit code
  syscall ; quit application
