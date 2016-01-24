%define ASMLIB_PUT_PIXEL

%ifndef ASMLIB_XY_TO_ADDR
    %include "asmlib/graphics/xy_to_addr.asm"
%endif

; rdi - x
; rsi - y
; rdx - color
put_pixel:
    call xy_to_addr
    mov byte [rax], dl
    shr rdx, 8
    mov word [rax+1], dx
    ret
