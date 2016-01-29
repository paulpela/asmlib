%define ASMLIB_POINT_TO_OFFSET

%ifndef ASMLIB_GET_BYTES_PER_PIXEL
    %include "asmlib/graphics/get_bytes_per_pixel.asm"
%endif

; rdi: *struct point
point_to_offset:
    push rbx

    xor rbx, rbx
    mov bx, word [VBEModeInfoBlock.XResolution]

    xor rax, rax
    mov rax, qword [rdi+point.y]

    mul rbx ; rax now holds y*resolution

    xor rbx, rbx
    mov rbx, qword [rdi+point.x]
    add rbx, rax ; rbx now holds the pixel number

    call get_bytes_per_pixel
    mul rbx ; rax now holds (y*xres + x) * bpp

    pop rbx
    ret ; rax holds the offset
