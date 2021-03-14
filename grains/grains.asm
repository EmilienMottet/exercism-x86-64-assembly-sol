section .text
global square
square:
    cmp rdi, 0
    jle raise_exception
    cmp rdi, 64
    jg raise_exception
    mov rax, 1
    mov rcx, rdi
    sub rcx, 1
    shl rax, cl
    ret
raise_exception:
    xor rax, rax
    ret

global total
total:
    mov rdi, 64
    xor r8, r8
_while: 
    call square
    add r8, rax
    dec rdi
    test rdi, rdi
    jnz _while
    mov rax, r8
    ret
