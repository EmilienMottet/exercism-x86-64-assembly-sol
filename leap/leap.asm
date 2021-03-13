section .text
global leap_year
leap_year:
    ; year % 4 == 0 
    mov rsi, 4
    call modulo
    test rax, rax
    jnz is_no_leap
    ; year % 100 != 0
    mov rsi, 100
    call modulo
    test rax, rax
    jnz is_leap
    ; year % 400 == 0
    mov rsi, 400
    call modulo
    test rax, rax
    jz is_leap
is_no_leap:
    xor rax, rax
    ret
is_leap:
    mov al, 1
    ret

modulo:
    xor edx, edx
    mov rax, rdi
    div rsi
    mov rax, rdx
    ret
