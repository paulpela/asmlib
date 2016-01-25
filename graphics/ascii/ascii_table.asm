%define ASMLIB_ASCII_TABLE

ascii_table:
    .ascii_00:   dq      ascii_not_printable
    .ascii_01:   dq      ascii_not_printable
    .ascii_02:   dq      ascii_not_printable
    .ascii_03:   dq      ascii_not_printable
    .ascii_04:   dq      ascii_not_printable
    .ascii_05:   dq      ascii_not_printable
    .ascii_06:   dq      ascii_not_printable
    .ascii_07:   dq      ascii_not_printable
    .ascii_08:   dq      ascii_not_printable
    .ascii_09:   dq      ascii_not_printable
    .ascii_0a:   dq      ascii_not_printable
    .ascii_0b:   dq      ascii_not_printable
    .ascii_0c:   dq      ascii_not_printable
    .ascii_0d:   dq      ascii_not_printable
    .ascii_0e:   dq      ascii_not_printable
    .ascii_0f:   dq      ascii_not_printable
    .ascii_10:   dq      ascii_not_printable
    .ascii_11:   dq      ascii_not_printable
    .ascii_12:   dq      ascii_not_printable
    .ascii_13:   dq      ascii_not_printable
    .ascii_14:   dq      ascii_not_printable
    .ascii_15:   dq      ascii_not_printable
    .ascii_16:   dq      ascii_not_printable
    .ascii_17:   dq      ascii_not_printable
    .ascii_18:   dq      ascii_not_printable
    .ascii_19:   dq      ascii_not_printable
    .ascii_1a:   dq      ascii_not_printable
    .ascii_1b:   dq      ascii_not_printable
    .ascii_1c:   dq      ascii_not_printable
    .ascii_1d:   dq      ascii_not_printable
    .ascii_1e:   dq      ascii_not_printable
    .ascii_1f:   dq      ascii_not_printable
    .ascii_20:   dq      ascii_print_space
    .ascii_21:   dq      ascii_print_exclamation
    ; TODO: finish this


ascii_not_printable:
    ret
