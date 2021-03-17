default rel
section .rodata
;base: dd 31557600               ; 60 * 60 * 24 * 365.25

planets:
mercury: dd 7600543.81992       ; base * 0.2408467
venus: dd 19414149.052176       ; base * 0.61519726
earth: dd 31557600.             ; base * 1
mars: dd 59354032.690079994     ; base * 1.8808158
jupiter: dd 374355659.124       ; base * 11.862615
saturn: dd 929292362.8848       ; base * 29.447498
uranus: dd 2651370019.3296      ; base * 84.016846
neptune: dd 5200418560.032001   ; base * 164.79132


section .text
global age
age:
    lea rax, [planets]
    cvtsi2ss xmm0, esi
    movss    xmm1, [rax + rdi * 4]
    divss xmm0, xmm1 
    ret
