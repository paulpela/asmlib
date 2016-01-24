%define ASMLIB_PUT_PIXEL

%ifndef ASMLIB_XY_TO_ADDR
    %include "asmlib/graphics/xy_to_addr.asm"
%endif

; rdi - x
; rsi - y
; dl - RR
; cl - GG
; r8b - BB
put_pixel:
    call xy_to_addr
    mov byte [rax+2], dl
    mov byte [rax+1], cl
    mov byte [rax], r8b
    ret
