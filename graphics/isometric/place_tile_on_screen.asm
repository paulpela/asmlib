; rdi: point x
; rsi: point y
; r8: tile data
place_tile_on_screen:
    push rdi
    push rsi
    push rdx
    push rcx
    push r8

    mov r8, rdx
    mov rdx, TILE_WIDTH
    mov rcx, TILE_HEIGHT
    add r8, 4 ; start of tile data
    call sprite_draw

    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    ret
