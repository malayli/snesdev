scope col_major_map: {
    variable map_size($400)
    variable tile0($1400)
    constant blank_tile($12a0)

    while map_size > $3c0 {
        dw $02a1
        variable map_size(map_size-1)
    }
    while map_size > $c1 {
        dw blank_tile
        dw blank_tile
        variable map_size(map_size-2)
        variable x(28)
        variable t_tile0(tile0)
        while x > 0 {
            dw t_tile0
            variable t_tile0(t_tile0+24)
            variable x(x-1)
            variable map_size(map_size-1)
        }
        variable tile0(t_tile0-671)
        variable map_size(map_size-1)
        dw blank_tile
        dw blank_tile
        variable map_size(map_size-2)
    }
    while map_size > 0 {
        dw $02a1
        variable map_size(map_size-1)
    }
    constant size(pc() - col_major_map)
}

scope singular_graphic: {
    variable x(0)
    while x < 128 {
        db 0, x&63
        variable x(x+2)
    }
    constant size(pc() - singular_graphic)
}

// vim:ft=bass
