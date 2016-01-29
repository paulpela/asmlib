%define ASMLIB_DRAW_RECT

%ifndef ASMLIB_GRAPHICS_DATA_TYPES
    %include "asmlib/graphics/data_types.asm"
%endif

%ifndef ASMLIB_DRAW_HLINE
    %include "asmlib/graphics/draw_hline.asm"
%endif

; rdi: *struc point origin
; rsi: *struc color
; rdx: length
; rcx: height
draw_rect:
    copy_point rdi, _rect_origin
    mov rdi, _rect_origin

.draw_lines:
    push rcx
    mov rcx, rdx
    call draw_hline
    inc qword [rdi+point.y]
    push rax
    mov rax, qword [_rect_origin+point.x]
    mov qword [rdi+point.x], rax
    pop rax
    pop rcx
    loop .draw_lines

    ret

_rect_origin: istruc point
    at point.x,     dq 0
    at point.y,     dq 0
iend
