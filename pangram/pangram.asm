default rel
section .text
global is_pangram
is_pangram:
    lea r8d, [rel alphabet]     ; put alphabet in r8d
.while:
    cmp [rdi],byte 0            ; rdi have first param, the tested word
    jz .end                     ; break while when '\0' is reached 
    mov cl, [rdi]               ; read nth char of input
    sub cl, 'a'                 ; find index of char in frequency array
    mov eax, 1                  ; create word : 0b0{31}1
    shl eax, cl                 ; set bit at char index
    not eax                     ; create a word like : 0b1.*01.*
    and r8d, eax                ; set bit index at 0 in frequency array
    inc rdi                     ; inc for read next char
    jmp .while                  ; go to begin of loop
.end:
    xor rax,rax                 ; ensure 0 on rax (clean byte at 8..63)
    test r8d, r8d               ; set ZF to 1 if r8d == 0
    setz al                     ; set boolean return
    ret                         ; return function

section .rodata
alphabet: dd 0b11111111111111111111111111 ; frequency array
