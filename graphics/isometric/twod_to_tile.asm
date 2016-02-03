; rdi: * cartesian point x
; rsi: * cartesian point y
twod_to_tile:
    shr rdi, 4
    shr rsi, 4
    ret
