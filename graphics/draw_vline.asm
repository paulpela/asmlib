%define ASMLIB_DRAW_VLINE

%ifndef ASMLIB_GRAPHICS_DATA_TYPES
    %include "asmlib/graphics/data_types.asm"
%endif

; rdi: *struc point origin
; rsi: *struc color
; rcx: length
draw_vline:
    push rdi
    push rsi
    push rcx

    cmp rcx, 0
    je .skip

    copy_point rdi, _vline_origin

    mov rdi, _vline_origin
.draw:
    call put_pixel
    inc qword [_vline_origin+point.y]
    loop .draw

.skip:
    pop rcx
    pop rsi
    pop rdi
    ret
    

_vline_origin: istruc point
    at point.x,     dq 0
    at point.y,     dq 0
iend
