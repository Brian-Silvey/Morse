    AREA asm_func, CODE, READONLY
    EXPORT init_table
init_table                  ; initialize the ledtable with proper values for displaying chars
    MOV R1, #0              ; set offset (element number) to 0 (first element)
    ADD R2, R0, R1, LSL#2   ; table[0] + offset with logical shift left by 2 = table[offset]
    MOV R3, #0x6            ; #0x6 = value of A in morse code bit string representation
    STR R3, [R2]            ; put value of A into ledtable[offset]
    
    ADD R1, R1, #1          ; set offset to 1
    ADD R2, R0, R1, LSL#2   ; table[1]
    MOV R3, #0x11           ; value of B
    STR R3, [R2]            ; table[1] = value of B
    
        ; this pattern continues until END
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x15           ; value of C
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x9            ; value of D
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x2            ; value of E
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x14           ; value of F
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0xB            ; value of G
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x10           ; value of H
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x4            ; value of I
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x1E           ; value of J
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0xD            ; value of K
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3,#0x12            ; value of L
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x7            ; value of M
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x5            ; value of N
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0xF            ; value of O
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x16           ; value of P
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x1B           ; value of Q
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0xA            ; value of R
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x8            ; value of S
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x3            ; value of T
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0xC            ; value of U
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x18           ; value of V
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0xE            ; value of W
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x19           ; value of X
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x1D           ; value of Y
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x13           ; value of Z
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x3E           ; value of 1
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x3C           ; value of 2
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x38           ; value of 3
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x30           ; value of 4
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x20           ; value of 5
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x21           ; value of 6
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x23           ; value of 7
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x27           ; value of 8
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x2F           ; value of 9
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x3F           ; value of 0
    STR R3, [R2]
    
    BX  LR                  ; branch and change instruction set
    END