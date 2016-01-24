%define ASMLIB_GET_BYTES_PER_PIXEL

get_bytes_per_pixel:
    xor rax, rax
    xor rbx, rbx
    mov al, byte [VBEModeInfoBlock.BitsPerPixel]
    mov rbx, 8
    div rbx
    ret ; rax holds bytes per pixel
