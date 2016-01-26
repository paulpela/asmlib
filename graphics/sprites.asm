USE64
%define ASMLIB_SPRITES

%ifndef ASMLIB_PUT_PIXEL
    %include "asmlib/graphics/put_pixel.asm"
%endif

; rdi: * to sprite binary
; rsi: * to color map region (16*qw = 128bytes)
; rdx: width
; rcx: length
; r8: * struct point origin
draw_sprite:
    push rdi
    push rsi
    push rax
    push rbx
    push rcx
    push rdx

    copy_point r8, _sprite_origin

.draw_row:
    call sprite_draw_row
    sub word [_sprite_origin+point.x], rdx
    add word [_sprite_origin+point.y], 1
    loop .draw_row

    pop rdx
    pop rcx
    pop rbx
    pop rax
    pop rsi
    pop rdi
    ret
    
sprite_draw_row:
    push rax
    push rbx
    push rcx
    push rdx

    xor rcx, rcx
    xor rax, rax
    mov rcx, rdx
.loop:
    mov al, byte [rdi]
    add rdi, 1
    call sprite_parse_color_data
    loop .loop

    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret

sprite_parse_color_data:
    push rax
    push rbx
    push rcx
    push r14
    push rdi
    push rsi

    xor rbx, rbx
    mov rcx, 2
.loop:
    mov bl, al
    and bl, 0000_1111b
    cmp bl, 0x00
    je .skip
    mov rdi, qword [rsi+8*bl]
    push rsi
    mov rsi, _sprite_origin
    call put_pixel
    pop rsi

.skip:
    shr al, 4
    add word [_sprite_origin+point.x], 1
    loop .loop

    pop rsi
    pop rdi
    pop r14
    pop rcx
    pop rbx
    pop rax
    ret

;example_color_map_region:
;dq null_color
;dq color_1
;dq color_2
;dq color_3

_sprite_origin: istruc point
    at point.x,     dw  0
    at point.y,     dw  0
iend
