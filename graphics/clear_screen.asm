%define ASMLIB_CLEAR_SCREEN

%ifndef ASMLIB_GRAPHICS_DATA_TYPES
    %include "asmlib/graphics/data_types.asm"
%endif

%ifndef ASMLIB_GET_SCREEN_SIZE
    %include "asmlib/graphics/get_screen_size.asm"
%endif

%ifndef ASMLIB_GET_BYTES_PER_PIXEL
    %include "asmlib/graphics/get_bytes_per_pixel.asm"
%endif

; rdi: *struc pixel
clear_screen:
    push rbx
    push rcx
    push rdx

    call get_screen_size
    mov rcx, rax

    call get_bytes_per_pixel
    mov rdx, rax

    xor rbx, rbx
    mov ebx, dword [VBEModeInfoBlock.PhysBasePtr]

.clear:
    mov sil, byte [rdi+color.b]
    mov byte [rbx], sil
    mov sil, byte [rdi+color.g]
    mov byte [rbx+1], sil
    mov sil, byte [rdi+color.r]
    mov byte [rbx+2], sil

    add rbx, rdx
    loop .clear

    pop rdx
    pop rcx
    pop rbx
    ret
    

