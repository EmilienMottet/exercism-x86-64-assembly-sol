section .text
global leap_year
leap_year:
    mov rsi, 400
    call modulo
    test rax, rax
    jz is_leap
    mov rsi, 100
    call modulo
    test rax, rax
    jz is_no_leap
    mov rsi, 4
    call modulo
    test rax, rax
    jz is_leap
is_no_leap:
    xor rax, rax
    ret
is_leap:
    setz al
    ret

modulo:
    xor edx, edx
    mov rax, rdi
    div rsi
    mov rax, rdx
    ret
