%define ASMLIB_SPRITE_UNPACK

; rdi: * to packed data
; rsi: * to buffer
sprite_unpack:
    push rax
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi

    call sprite_unpack_header
    call sprite_unpack_data

    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret

sprite_unpack_data:
.unpack:
    xor rax, rax
    xor rcx, rcx
    mov cl, byte [rdi]
    cmp cl, 0x00
    je .end
    inc rdi
    mov al, byte [rdi]
    inc rdi
.write_unpacked:
    mov byte [rsi], al
    inc rsi
    loop .write_unpacked
    jmp .unpack
    
.end:
    ret

sprite_unpack_header:
    push rax

    mov ax, word [rdi]
    mov word [rsi], ax
    add rsi, 2
    add rdi, 2
    mov ax, word [rdi]
    mov word [rsi], ax
    add rsi, 2
    add rdi, 2
    
    pop rax
    ret

tp: istruc point
    at point.x,     dw 500
    at point.y,     dw 500
iend

tpc: istruc color
    at color.r,     db 0x00
    at color.g,     db 0x00
    at color.b,     db 0x00
iend
