default rel
section .text
global is_isogram
is_isogram:
    lea r8, [rel alphabet]
    mov r8d, [r8]
.while:
    cmp [rdi],byte 0
    jz .end_true
    cmp [rdi], byte ' '         ; skip space
    jz .next_char
    cmp [rdi], byte '-'         ; skip hyphen
    jz .next_char
    call .lower
    mov cl, al                  ; read nth char of input
    sub cl, 'a'                 ; find index of char in frequency array
    mov eax, 1                  ; create word : 0b0{31}1
    shl eax, cl                 ; set bit at char index
    and eax, r8d                ; check if the char is already used
    jz .end_false
    not eax                     ; set char index at 0 to set as visited
    and r8d, eax
.next_char:
    inc rdi
    jmp .while
.end_true:
    xor rax,rax
    setz al                     ; set boolean return
    ret
.end_false:
    xor rax,rax
    ret

.lower:
    mov al, byte[rdi]
    mov r9b, 'Z'
    cmp al, r9b
    jl .end_lower
    mov r9b, 'A'
    cmp  al, r9b,
    jg .end_lower
    add al, byte 'a' - 'A'
.end_lower:
    ret

section .rodata
alphabet: dd 0b11111111111111111111111111 ; one boolean whith frequency array
