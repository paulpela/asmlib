%define ASMLIB_DRAW_RECT

%ifndef ASMLIB_XY_TO_ADDR
    %include "asmlib/graphics/xy_to_addr.asm"
%endif

; rdi - x
; rsi - y
; rdx - length
; rcx - height
; r8 - RR
; r9 - GG
; r10 - BB
; TODO: complete this
draw_rect:
    call xy_to_addr
    mov r12, rax
.rows:
    push rcx
    mov rcx, rdx
    mov rax, r12
.row:
    mov byte [rax], r10b
    mov byte [rax+1], r9b
    mov byte [rax+2], r8b
    
    loop .row
    pop rcx
    loop .rows

    ret
