%include "asmlib/graphics/xy_to_addr.asm"

; rdi - x
; rsi - y
put_pixel:
    call xy_to_addr
    ret
