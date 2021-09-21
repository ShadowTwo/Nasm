extern printf
section .data
  fmt db "Returned: %d",0xa,0
section .text
global main

main:

  mov edi, 100

  xor eax, eax
  mov r9d,3 ; current multiple
  mov r10d,3 ; base multiple
  xor r11,r11 ; total
  xor r12, r12
  mov r12d, edi
  .loop:
    cmp r9d, r12d
    jg .Next
      add r11d, r9d
      add r9d,r10d
      jmp .loop
  .Next:
    ;cmp r10d, 5
    ;je .end
    mov r9d, 5
    mov r10d, 5
    ;xor r12,r12
    ;mov r12d,edi
    .loop2:
      cmp r9d, r12d
      jg .end
      ;Test for duplicate with 3
        mov eax, 3
        xor rdx,rdx ;Zero our the return for the remainder
        idiv r9d ;edx:eax / r9d.... order is important.
        cmp edx, 0 ;it is divisable by 3, ignore
        je .Skip
          add r11d, r9d
        ;good result add to total and move to next
        .Skip:
        add r9d,r10d
        jmp .loop2
  .end:
  push r11
  
  mov rdi, fmt
  mov esi, r11d
  xor rax,rax
  call printf
  
  pop r11
  mov eax, r11d
  ;call clean exit
  mov rax, 60 ; 60 = exit 
  mov rdi, 0 ; 0 = success exit code
  syscall ; quit application
