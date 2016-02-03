%define ASMLIB_DRAW_RECT
; rdi: origin x
; rsi: origin y
; rdx: color
; rcx: length
; r8: height
draw_rect:
    push rdi
    push rsi
    push rcx
    push rdx
    push r8

    cmp rcx, 0
    jle .skip

    cmp r8, 0
    jle .skip

.draw_lines:
    call draw_hline
    inc rsi
    dec r8
    cmp r8, 0
    jle .skip
    loop .draw_lines

.skip:
    pop r8
    pop rdx
    pop rcx
    pop rsi
    pop rdi
    ret
