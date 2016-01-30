; rdi: tile.sprite addr
; rsi: tile colormap
; rdx: tile origin point on screen
place_tile_on_screen:
    push rdi
    push rsi
    push rdx

    mov r8, rdx
    movzx rdx, word [rdi+0] ; tile width
    movzx rcx, word [rdi+2] ; tile height
    add rdi, 4 ; start of tile data
    call sprite_draw

    pop rdx
    pop rsi
    pop rdi
    ret
