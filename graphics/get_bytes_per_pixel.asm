%define ASMLIB_GET_BYTES_PER_PIXEL

get_bytes_per_pixel:
    xor rax, rax
    xor rbx, rbx
    mov al, byte [VBEModeInfoBlock.BitsPerPixel]
    shr rax, 3
    ret ; rax holds bytes per pixel
