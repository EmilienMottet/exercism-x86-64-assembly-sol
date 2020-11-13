default rel
section .text
global is_pangram
is_pangram:
check_freq:
    mov r8d, [alphabet]
while:
    cmp [rdi],byte 0
    jz end
    mov cl, [rdi]
    sub cl, 'a'
    mov eax, 1
    shl eax, cl
    not eax
    and r8d, eax
    inc rdi
    jmp while
end:
    xor rax,rax
    test r8d, r8d ; set ZF to 1 if r8d == 0
    setz al
    ret

section .rodata
alphabet: dd 0b11111111111111111111111111 ; frequency array
