; Store 8-bit number at 1000H, check odd/even, indicate in register B
; Odd -> B = 00H | Even -> B = FFH

        MVI A, 07H        ; Sample 8-bit number (change to test even/odd)
        STA 1000H         ; Store in RAM at 1000H

        LDA 1000H         ; Load number from memory
        ANI 01H           ; Test LSB: result 00H if even, 01H if odd
        JZ EVEN

        MVI B, 00H        ; Odd: B = 0000H (analog of CX = 0000H)
        JMP DONE

EVEN:   MVI B, 0FFH       ; Even: B = FFFFH (analog of CX = FFFFH)

DONE:   HLT
