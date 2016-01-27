USE64

%define ASMLIB_REDRAW_ROW_RANGE

%ifndef ASMLIB_REDRAW_ROW
    %include "asmlib/graphics/redraw_row.asm"
%endif

; rdi - buffer address
; rsi - start y row
; rdx - # of rows
redraw_row_range:
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi

    mov rcx, rdx
.loop:
    call redraw_row
    inc rsi
    loop .loop

    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret
