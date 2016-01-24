%define ASMLIB_GET_PIXEL

%ifndef ASMLIB_XY_TO_ADDR
    %include "asmlib/graphics/xy_to_addr.asm"
%endif

; rdi - x
; rsi - y
put_pixel:
    call xy_to_addr
    ret
