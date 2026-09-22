; Store 5 hex numbers at 1000H-1004H via SI (HL), then bubble sort:
; Ascending  -> 2000H-2004H | Descending -> 3000H-3004H
; Numbers (modified to 8-bit): F5H, F2H, 04H, 42H, 68H
; (Concept identical to 16-bit sort; 8-bit used to fit 8085 natively)

        LXI H, 1000H      ; Source index (SI equivalent)

        MVI M, 0F5H       ; [1000H]
        INX H
        MVI M, 0F2H       ; [1001H]
        INX H
        MVI M, 04H        ; [1002H]
        INX H
        MVI M, 42H        ; [1003H]
        INX H
        MVI M, 68H        ; [1004H]

; Copy to 2000H for ascending sort
        LXI H, 1000H
        LXI D, 2000H
        MVI C, 05H
CPY1:   MOV A, M
        STAX D
        INX H
        INX D
        DCR C
        JNZ CPY1

; Ascending bubble sort at 2000H
        MVI B, 04H        ; 4 outer passes

ASCO:   LXI H, 2000H
        MOV C, B
ASCI:   MOV A, M
        INX H
        CMP M             ; A vs next element
        JC ASNO           ; A < [HL], no swap needed
        MOV D, M          ; D = [HL]
        MOV M, A          ; [HL] = A (larger)
        DCX H
        MOV M, D          ; [HL-1] = D (smaller)
        INX H
ASNO:   DCR C
        JNZ ASCI
        DCR B
        JNZ ASCO

; Copy to 3000H for descending sort
        LXI H, 1000H
        LXI D, 3000H
        MVI C, 05H
CPY2:   MOV A, M
        STAX D
        INX H
        INX D
        DCR C
        JNZ CPY2

; Descending bubble sort at 3000H
        MVI B, 04H

DESO:   LXI H, 3000H
        MOV C, B
DESI:   MOV A, M
        INX H
        CMP M             ; A vs next element
        JNC DSNO          ; A >= [HL], no swap needed
        MOV D, M          ; D = [HL]
        MOV M, A          ; [HL] = A (smaller)
        DCX H
        MOV M, D          ; [HL-1] = D (larger)
        INX H
DSNO:   DCR C
        JNZ DESI
        DCR B
        JNZ DESO

        HLT
