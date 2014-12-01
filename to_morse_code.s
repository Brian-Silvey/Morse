    AREA asm_func, CODE, READONLY
    EXPORT to_morse_code
to_morse_code
    CMP R0, #57
    BGT next0
    SUB R0, R0, #23
    B   next1
next0
    SUB R0, R0, #97
next1
    BX  LR
    END