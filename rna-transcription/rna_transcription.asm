section .text
global to_rna
to_rna:
    cmp [rdi],byte 0
    je end
testC:
    cmp [rdi],byte 'C'
    jne testG
    mov al, 'G'
    mov [rsi], al
    jmp increment_register
testG:
    cmp [rdi],byte 'G'
    jne testT
    mov al, 'C'
    mov [rsi], al
    jmp increment_register
testT:
    cmp [rdi],byte 'T'
    jne testA
    mov al, 'A'
    mov [rsi], al
    jmp increment_register
testA:
    cmp [rdi],byte 'A'
    jne increment_register
    mov al, 'U'
    mov [rsi], al
    jmp increment_register
increment_register:
    add rsi, 1
    add rdi, 1
    jmp to_rna
end:
    mov al, 0
    mov [rsi], al
    ret
