default rel
section .text
global two_fer
two_fer:
    mov rax, rdi
    mov rdi, rsi
    lea rsi, [first]
    mov rcx, first_len
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
    mov rcx, last_len
    rep movsb
    xor rax, rax
    ret

_strlen:
    xor rcx, rcx
    cmp   [rdi], byte 0
    jz    _strlen_end
_strlen_while:
    inc   rcx
    inc   rdi
    cmp   [rdi], byte 0
    jne    _strlen_while

_strlen_end:
    mov   rax, rcx
    ret




section .rodata
first: db "One for "            ; no need to \0 because string will write after
first_len: equ $-first
you:   db "you", 0
last:  db ", one for me.", 0
last_len: equ $-last

