; Store 10 temperatures at 2000H using immediate addressing, then find maximum
; Temperatures: 20,24,32,34,38,42,45,36,33,23 (degrees Celsius)

        LXI H, 2000H      ; Base memory address

        MVI M, 14H        ; [2000H] = 20 (Jan-23)
        INX H
        MVI M, 18H        ; [2001H] = 24 (Jan-31)
        INX H
        MVI M, 20H        ; [2002H] = 32 (Feb-21)
        INX H
        MVI M, 22H        ; [2003H] = 34 (Feb-28)
        INX H
        MVI M, 26H        ; [2004H] = 38 (Mar-23)
        INX H
        MVI M, 2AH        ; [2005H] = 42 (May-24)
        INX H
        MVI M, 2DH        ; [2006H] = 45 (May-31)
        INX H
        MVI M, 24H        ; [2007H] = 36 (Jul-24)
        INX H
        MVI M, 21H        ; [2008H] = 33 (Aug-24)
        INX H
        MVI M, 17H        ; [2009H] = 23 (Dec-13)

; Find maximum
        LXI H, 2000H      ; Reset pointer
        MOV A, M          ; Assume first element is max
        MVI C, 09H        ; 9 comparisons remaining

LOOP:   INX H
        CMP M             ; A vs [HL]
        JNC SKIP
        MOV A, M          ; New max found
SKIP:   DCR C
        JNZ LOOP

        STA 200AH         ; Store maximum temperature

        HLT
