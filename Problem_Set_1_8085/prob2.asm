; Add A5H + 20H, store result in B | Subtract A5H - 20H, store result in D

        MVI A, 0A5H       ; First number
        MVI C, 20H        ; Second number

; Addition
        ADD C             ; A = A5H + 20H
        MOV B, A          ; Store addition result in B

; Subtraction
        MVI A, 0A5H       ; Reload first number
        SUB C             ; A = A5H - 20H
        MOV D, A          ; Store subtraction result in D

        HLT
