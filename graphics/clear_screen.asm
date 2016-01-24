%define ASMLIB_CLEAR_SCREEN

%ifndef ASMLIB_GET_SCREEN_SIZE
    %include "asmlib/graphics/get_screen_size.asm"
%endif

%ifndef ASMLIB_GET_BYTES_PER_PIXEL
    %include "asmlib/graphics/get_bytes_per_pixel.asm"
%endif

; rdi: RR
; rsi: GG
; rdi: BB
clear_screen:
    push rdi
    push rsi
    push rdx

    call get_screen_size
    mov rcx, rax

    call get_bytes_per_pixel
    mov rdx, rax

    xor rdi, rdi
    mov edi, dword [VBEModeInfoBlock.PhysBasePtr]

    pop r8
    pop rbx
    pop rax
.clear:
    mov byte [rdi], al
    mov byte [rdi+1], bl
    mov byte [rdi+2], r8b
    add rdi, rdx
    loop .clear

    ret
    

