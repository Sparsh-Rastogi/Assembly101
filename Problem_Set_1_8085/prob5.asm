; s = u*t + (1/2)*a*t^2   (all values chosen to stay 8-bit)
; Inputs: u=02H, t=03H, a=04H -> s = 6 + 18 = 24 = 18H
; Result stored at 5000H

        MVI B, 02H        ; u = initial velocity
        MVI C, 03H        ; t = time
        MVI D, 04H        ; a = acceleration

; Compute u*t (repeated addition)
        MVI A, 00H
        MVI E, C          ; Loop count = t

UT:     ADD B             ; A += u
        DCR E
        JNZ UT
        MOV H, A          ; Save u*t in H

; Compute t^2 (repeated addition)
        MVI A, 00H
        MVI E, C

TT:     ADD C             ; A += t
        DCR E
        JNZ TT
        MOV L, A          ; Save t^2 in L

; Compute a*t^2 (repeated addition)
        MVI A, 00H
        MOV E, D          ; Loop count = a

AT2:    ADD L             ; A += t^2
        DCR E
        JNZ AT2
        RRC               ; Divide by 2 (right shift)
        ANI 7FH           ; Clear carry-in bit

; s = u*t + (1/2)*a*t^2
        ADD H             ; A = (1/2)*a*t^2 + u*t
        STA 5000H         ; Store displacement s

        HLT
