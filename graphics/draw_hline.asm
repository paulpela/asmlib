%define ASMLIB_DRAW_HLINE

%ifndef ASMLIB_GRAPHICS_DATA_TYPES
    %include "asmlib/graphics/data_types.asm"
%endif

; rdi: *struc point origin
; rsi: *struc color
; rcx: length
draw_hline:
    copy_point rdi, _hline_origin

    mov rdi, _hline_origin
.draw:
    call put_pixel
    inc word [_hline_origin+point.x]
    loop .draw

    ret
    

_hline_origin: istruc point
    at point.x,     dw 0
    at point.y,     dw 0
iend
