%define ASMLIB_DRAW_VLINE

; rdi: point origin x
; rsi: point origin y
; rdx: color
; rcx: length
draw_vline:
    push rdi
    push rsi
    push rcx
    push rdx

    cmp rcx, 0
    je .skip

.draw:
    call put_pixel
    inc rsi
    loop .draw

.skip:
    pop rdx
    pop rcx
    pop rsi
    pop rdi
    ret
