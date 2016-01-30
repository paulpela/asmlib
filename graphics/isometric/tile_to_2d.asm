; rdi: * tile struct
tile_to_2d:
    mov r8, qword [rdi+point.x]
    shl r8, 4
    mov r9, qword [rdi+point.y]
    shl r9, 4

    mov qword [_tile_to_2d+point.x], r8
    mov qword [_tile_to_2d+point.y], r9

    mov rax, _tile_to_2d
    ret

_tile_to_2d: istruc point
    at point.x, dq  0
    at point.y, dq  0
iend
