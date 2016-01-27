USE64

%define ASMLIB_RESTORE_BG_BUFFER

%ifndef ASMLIB_GET_SCREEN_SIZE
    %include "asmlib/graphics/get_screen_size.asm"
%endif

%ifndef ASMLIB_GET_BYTES_PER_PIXEL
    %include "asmlib/graphics/get_bytes_per_pixel.asm"
%endif

; rdi - buffer address
restore_bg_buffer:
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi

    mov rsi, rdi

    call get_screen_size
    mov rbx, rax

    call get_bytes_per_pixel
    mul rbx ; rax now holds buffer size in bytes

    mov rcx, rax
    xor rax, rax
    xor rdi, rdi
    mov edi, dword [VBEModeInfoBlock.PhysBasePtr]
.copy:
    lodsb
    stosb
    loop .copy

    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret
