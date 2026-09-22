; Factorial of 1 to 5 (modified: 5! = 120 = 78H fits in 8 bits)
; Store results at 4000H (1!) through 4004H (5!)

        LXI H, 4000H      ; Memory pointer
        MVI E, 01H        ; Running factorial (seed = 1)
        MVI B, 01H        ; Current multiplier

OUTER:  MVI A, 00H        ; Clear accumulator for this multiply
        MOV C, B          ; Inner loop count = current multiplier

INNER:  ADD E             ; A += running factorial (repeated addition = multiply)
        DCR C
        JNZ INNER

        MOV E, A          ; Update running factorial
        MOV M, A          ; Store factorial value
        INX H
        INR B             ; Next multiplier
        MOV A, B
        CPI 06H           ; Stop after 5! (B would become 6)
        JNZ OUTER

        HLT
