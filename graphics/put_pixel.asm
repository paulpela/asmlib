%include "asmlib/graphics/xy_to_addr.asm"

; rdi - x
; rsi - y
; rdx - color
put_pixel:
    call xy_to_addr
    mov byte [rax], dl
    shr rdx, 8
    mov word [rax+1], dx
    ret
