default rel
section .text
global reverse
reverse:
    push rdi
    call _strlen
    pop rdi
    dec rax
    xor rcx, rcx
while:
    cmp rax, rcx
    jl end
    mov r8b, [rdi + rcx]
    mov r9b, [rdi + rax]
    mov [rdi + rcx], r9b
    mov [rdi + rax], r8b
    inc rcx
    dec rax
    jmp while
end:
    ret

_strlen:
    xor rcx, rcx                ; init counter to 0
_strlen_while:
    cmp   [rdi], byte 0
    jz    _strlen_end
    inc   rcx
    inc   rdi
    jmp   _strlen_while

_strlen_end:
    mov   rax, rcx
    ret
