%define ASMLIB_DRAW_HLINE

%ifndef ASMLIB_GRAPHICS_DATA_TYPES
    %include "asmlib/graphics/data_types.asm"
%endif

; rdi: *struc point origin
; rsi: *struc color
; rcx: length
draw_hline:
    push rdi
    push rsi
    push rcx

    cmp rcx, 0
    je .skip

    copy_point rdi, _hline_origin

    mov rdi, _hline_origin
.draw:
    call put_pixel
    inc qword [_hline_origin+point.x]
    loop .draw

.skip:
    pop rcx
    pop rsi
    pop rdi
    ret
    

_hline_origin: istruc point
    at point.x,     dq 0
    at point.y,     dq 0
iend
