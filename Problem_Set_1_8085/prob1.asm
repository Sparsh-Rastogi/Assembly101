; Multiply 08H x 02H (repeated addition), Divide 08H / 02H (repeated subtraction)
; Mul: lo -> 3000H, hi -> 3001H | Div: quotient -> 3002H, remainder -> 3003H

        MVI C, 08H        ; Multiplicand
        MVI B, 02H        ; Multiplier
        MVI H, 00H        ; Result hi
        MVI L, 00H        ; Result lo

MUL:    MOV A, L
        ADD C             ; L += multiplicand
        MOV L, A
        JNC NCAR
        INR H             ; Carry to hi byte
NCAR:   DCR B
        JNZ MUL

        MOV A, L
        STA 3000H         ; Store product lo byte
        MOV A, H
        STA 3001H         ; Store product hi byte

; Division
        MVI A, 08H        ; Dividend
        MVI C, 02H        ; Divisor
        MVI B, 00H        ; Quotient

DIV:    CMP C             ; A < divisor?
        JC DONE
        SUB C             ; A -= divisor
        INR B             ; Quotient++
        JMP DIV

DONE:   STA 3003H         ; A = remainder, store it
        MOV A, B
        STA 3002H         ; Store quotient

        HLT
