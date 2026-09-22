; Fibonacci series - 10 terms (modified from 20 to fit 8-bit: max term = 34 = 22H)
; Terms: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34 stored at 3000H-3009H

        LXI H, 3000H      ; Memory pointer
        MVI B, 00H        ; F(n-2)
        MVI C, 01H        ; F(n-1)

        MVI M, 00H        ; Store F(0) = 0
        INX H
        MVI M, 01H        ; Store F(1) = 1
        INX H

        MVI D, 08H        ; Counter for remaining 8 terms

LOOP:   MOV A, B
        ADD C             ; A = F(n-2) + F(n-1)
        MOV M, A          ; Store next term
        INX H
        MOV B, C          ; Shift: F(n-2) = F(n-1)
        MOV C, A          ; Shift: F(n-1) = new term
        DCR D
        JNZ LOOP

        HLT
