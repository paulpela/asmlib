; rdi: tile x
; rsi: tile y
tile_to_2d:
    shl rdi, 4
    shl rsi, 4
    ret

