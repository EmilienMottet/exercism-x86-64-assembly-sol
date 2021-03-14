default rel
section .rodata
black: db "black", 0
brown: db "brown", 0
red: db "red", 0
orange: db "orange", 0
yellow: db "yellow", 0
green: db "green", 0
blue: db "blue", 0
violet: db "violet", 0
grey: db "grey", 0
white: db "white", 0

section .data
all_colors: dq black, brown, red, orange, yellow, green, blue, violet, grey, white, 0

section .text
global color_code
color_code:
    lea rdx, [ all_colors ]
    xor rcx, rcx
_while:
    mov rsi, rdx[rcx * 8]
    call _strcmp
    test rax, rax
    jnz _end
    inc rcx
    jmp _while
_end:
    mov rax, rcx
    ret


_strcmp:
    mov al, byte[rsi]
    cmp	al, byte[rdi]
    jnz	_strcmp_false
_strcmp_while:
    cmp	[rdi], byte 0
    je	_strcmp_true
    inc	rdi
    inc	rsi
    mov al, byte[rsi]
    cmp	al, byte[rdi]
    jne	_strcmp_false
    jmp _strcmp_while
_strcmp_true:
    mov   rax, 1
    ret
_strcmp_false:
    xor   rax, rax
    ret

global colors
colors:
    lea rax, [all_colors]
    ret
    
