%define ASMLIB_POINT_TO_ADDR

%ifndef ASMLIB_POINT_TO_OFFSET
    %include "asmlib/graphics/point_to_offset.asm"
%endif

%ifndef ASMLIB_OFFSET_TO_ADDR
    %include "asmlib/graphics/offset_to_addr.asm"
%endif

; rdi: *struct point
point_to_addr:
    call point_to_offset
    mov rdi, rax
    call offset_to_addr
    ret ; rax holds the address
