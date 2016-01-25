%define ASMLIB_PUT_PIXEL_AT_OFFSET

%ifndef ASMLIB_OFFSET_TO_ADDR
    %include "asmlib/graphics/offset_to_addr.asm"
%endif

; rdi - offset
; rsi - RR
; dl - GG
; cl - BB
put_pixel_at_offset:
    call offset_to_addr
    mov byte [rax+2], sil
    mov byte [rax+1], dl
    mov byte [rax], cl
    ret
