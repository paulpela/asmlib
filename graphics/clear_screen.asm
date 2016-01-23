%include "asmlib/graphics/get_screen_size.asm"

; rdi: color 0x00rrggbb
clear_screen:
    push rdi

    xor rdi, rdi
    mov edi, dword [VBEModeInfoBlock.PhysBasePtr]

    call get_screen_size
    mov rcx, rax

;    xor rdx, rdx
;    mov dl, byte [VBEModeInfoBlock.BitsPerPixel] ; not working for some reason
;    shr dl, 8
    mov rdx, 3 ; had to hardcode then...

    pop rax
    mov rbx, rax
    shr rbx, 8
.clear:
    mov byte [rdi], al
    mov word [rdi+1], bx
    add rdi, rdx
    loop .clear

    ret
    

