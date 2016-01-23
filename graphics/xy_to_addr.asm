%include "asmlib/graphics/xy_to_offset.asm"


; rdi - x
; rsi - y
xy_to_addr:
    call xy_to_offset
    xor rbx, rbx
    mov ebx, dword [VBEModeInfoBlock.PhysBasePtr]
    add rax, rbx
    ret ; rax holds the address
