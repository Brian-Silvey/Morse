    AREA asm_func, CODE, READONLY
    EXPORT init_ledtable
init_ledtable               ; initialize the ledtable with proper values for displaying chars
    MOV R1, #0              ; set offset (element number) to 0 (first element)
    ADD R2, R0, R1, LSL#2   ; ledtable[0] + offset with logical shift left by 2 = ledtable[offset]
    MOV R3, #62815          ; #62815 = value of A in the 4x4 led grid
    STR R3, [R2]            ; put value of A into ledtable[offset]
    
    ADD R1, R1, #1          ; set offset to 1
    ADD R2, R0, R1, LSL#2   ; ledtable[1]
    MOV R3, #64959          ; value of B
    STR R3, [R2]            ; ledtable[1] = value of B
    
        ; this pattern continues until END
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #63897          ; value of C
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #63894          ; value of D
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #64409          ; value of E
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #62801          ; value of F
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #63900          ; value of G
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #61999          ; value of H
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #40953          ; value of I
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #22935          ; value of J
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #63209          ; value of K
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3,#63624           ; value of L
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #63039          ; value of M
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #62031          ; value of N
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #63903          ; value of O
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #62807          ; value of P
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #63967          ; value of Q
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #62939          ; value of R
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #48093          ; value of S
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #8177           ; value of T
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #63631          ; value of U
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #30855          ; value of V
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #64623          ; value of W
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #38505          ; value of X
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #16099          ; value of Y
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #56763          ; value of Z
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #43512          ; value of 1
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #43354          ; value of 2
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #39359          ; value of 3
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #12847          ; value of 4
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #48605          ; value of 5
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #60892          ; value of 6
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #6483           ; value of 7
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #32190          ; value of 8
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #30047          ; value of 9
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #27030          ; value of 0
    STR R3, [R2]
   
    BX  LR                  ; branch and change instruction set
    END