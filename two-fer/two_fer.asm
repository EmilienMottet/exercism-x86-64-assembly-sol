default rel
section .text
global two_fer
two_fer:
    mov rax, rdi
    mov rdi, rsi
    lea rsi, [first]
    mov rcx, 8
    rep movsb

    cmp rax, 0
    jne end
    lea rax, [you]
end:
    mov rsi, rax
    push rdi
    mov rdi, rax
    call _strlen
    pop rdi
    mov rcx, rax
    rep movsb
    lea rsi, [last]
    mov rcx, 14                 ; 13 + \0
    rep movsb
    xor rax, rax
    ret

_strlen:
    xor rcx, rcx
_strlen_while:
    cmp   [rdi], byte 0
    jz    _strlen_end
    inc   rcx
    inc   rdi
    jmp   _strlen_while

_strlen_end:
    mov   rax, rcx
    ret

section .rodata
first: db "One for you, one for me.", 0
you:   db "you", 0
last:  db ", one for me.", 0
