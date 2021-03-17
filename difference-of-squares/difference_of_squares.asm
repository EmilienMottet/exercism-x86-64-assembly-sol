section .text
global square_of_sum
square_of_sum:
    xor rax, rax
_while_square_of_sum:
    add rax, rdi
    dec rdi
    test rdi, rdi
    jnz _while_square_of_sum
    mul rax
    ret

global sum_of_squares
sum_of_squares:
    xor r8, r8
_while_sum_of_square:
    mov rax, rdi
    mul rax
    add r8, rax
    dec rdi
    test rdi, rdi
    jnz _while_sum_of_square
    mov rax, r8
    ret

global difference_of_squares
difference_of_squares:
    mov r9, rdi
    call square_of_sum
    mov rdi, r9
    mov r9, rax
    call sum_of_squares
    sub r9, rax
    mov rax, r9
    ret
