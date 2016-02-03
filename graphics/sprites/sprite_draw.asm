%ifndef ASMLIB_PUT_PIXEL
    %include "asmlib/graphics/put_pixel.asm"
%endif

; rdi: origin x
; rsi: origin y
; rdx: width
; rcx: length
; r8: sprite data
sprite_draw:
    push rdi
    push rsi
    push rax
    push rbx
    push rcx
    push rdx
    push r13

.draw_row:
    call sprite_draw_row
    inc rsi
    loop .draw_row

.skip:
    pop r13
    pop rdx
    pop rcx
    pop rbx
    pop rax
    pop rsi
    pop rdi
    ret
    
; rdi: row origin x
; rsi: row origin y
; rdx: row width
; r8: sprite data
sprite_draw_row:
    push rax
    push rbx
    push rcx
    push rdx
    push r8

    xor rcx, rcx
    xor rax, rax
    mov rcx, rdx
.loop:
    mov dl, byte [r8]
    cmp dl, 0
    je .skip
    call put_pixel
.skip:
    inc r8
    loop .loop

    pop r8
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret

