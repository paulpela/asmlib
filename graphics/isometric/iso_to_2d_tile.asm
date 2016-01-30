; rdi: iso point *
iso_to_2d_tile:
    call iso_to_2d
    mov rdi, rax
    call twod_to_tile
    ret
