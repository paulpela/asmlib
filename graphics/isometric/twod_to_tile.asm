; rdi: * cartesian point
twod_to_tile:
    mov r8, qword [rdi+point.x]
    shr r8, 4
    mov r9, qword [rdi+point.y]
    shr r9, 4

    mov qword [_twod_to_tile+point.x], r8
    mov qword [_twod_to_tile+point.y], r9

    mov rax, _twod_to_tile
    ret

_twod_to_tile: istruc point
    at point.x, dq  0
    at point.y, dq  0
iend
