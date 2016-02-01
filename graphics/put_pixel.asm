%define ASMLIB_PUT_PIXEL

%ifndef ASMLIB_GRAPHICS_DATA_TYPES
    %include "asmlib/graphics/data_types.asm"
%endif

%ifndef ASMLIB_POINT_TO_ADDR
    %include "asmlib/graphics/point_to_addr.asm"
%endif

; rdi - *struct point
; rsi - *struct color
put_pixel:
    push r8
    push r9
    push r10
    push rax
    push rcx
    push rdx
    push rdi
    push rsi
    
    mov rax, qword [rdi+point.x]
    mov r9, rax
    cmp rax, 0
    jl .skip
    cmp rax, SCREEN_RES_X
    jge .skip

    mov rax, qword [rdi+point.y]
    mov r10, rax
    cmp rax, 0
    jl .skip
    cmp rax, SCREEN_RES_Y
    jge .skip

;    call point_to_addr
    mov rbx, SCREEN_RES_X ; rax = y * resx
    mul rbx
    add rax, r9
    mov rbx, BYTES_PER_PIXEL
    mul rbx
    
    mov ebx, dword [VBEModeInfoBlock.PhysBasePtr]
    add rax, rbx

    mov r8b, byte [rsi+color.b]
    mov cl, byte [rsi+color.g]
    mov dl, byte [rsi+color.r]
    mov byte [rax], r8b
    mov byte [rax+1], cl
    mov byte [rax+2], dl

.skip:
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rax
    pop r10
    pop r9
    pop r8
    ret
