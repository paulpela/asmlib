; rdi: tile.sprite addr
; rsi: tile colormap
; rdx: tile origin point on screen
place_tile_on_screen:
    push rdi
    push rsi
    push rdx

    mov r8, rdx
    mov rdx, TILE_WIDTH / 2
    mov rcx, TILE_HEIGHT
    add rdi, 4 ; start of tile data
    call sprite_draw

    pop rdx
    pop rsi
    pop rdi
    ret
