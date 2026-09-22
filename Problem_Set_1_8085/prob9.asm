; OR of values at 1000H and 1001H, result stored at address in DE (= 1002H)

        MVI A, 19H
        STA 1000H         ; Store first number

        MVI A, 06H
        STA 1001H         ; Store second number

        LXI D, 1002H      ; DE = destination address (analog of DI)

        LDA 1000H         ; Load first number
        MOV H, A          ; Save in H

        LDA 1001H         ; Load second number
        ORA H             ; A = A OR H

        STAX D            ; Store result at [DE] = 1002H

        HLT
