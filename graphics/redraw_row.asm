USE64

%define ASMLIB_REDRAW_ROW

%ifndef ASMLIB_GET_BYTES_PER_PIXEL
    %include "asmlib/graphics/get_bytes_per_pixel.asm"
%endif

; rdi - buffer address
; rsi - y row
redraw_row:
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi

    mov rbx, rsi
    xor rax, rax
    mov ax, word [VBEModeInfoBlock.XResolution]
    mov rcx, rax ; save for later
    mul rbx
    mov rbx, rax

    call get_bytes_per_pixel
    mul rbx ; rax now holds the offset

    mov rsi, rdi
    add rsi, rax

    xor rdi, rdi
    mov edi, dword [VBEModeInfoBlock.PhysBasePtr]
    add rdi, rax

    xor rax, rax
.copy:
    lodsq
    stosq
    loop .copy

    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret
