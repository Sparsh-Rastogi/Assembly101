ORG 100H
MOV DI, 3000H    ; Set base memory address in DI
MOV AL, 08H      ; Load first given number (8)
MOV BL, 02H      ; Load second given number (2)

; Multiplication
MUL BL           ; AX = AL * BL
MOV [DI], AX     ; Store 16-bit multiplication result at [DI]

; Division
MOV AX, 0008H    ; Reload first number into AX (16-bit dividend)
DIV BL           ; AL = AX / BL (Quotient), AH = Remainder
MOV [DI+2], AX   ; Store division result in next consecutive memory location
RET