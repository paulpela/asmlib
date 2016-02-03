; rdi: point x
; rsi: point y
iso_to_2d_tile:
    call iso_to_2d
    call twod_to_tile
    ret
