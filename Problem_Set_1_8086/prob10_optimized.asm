ORG 100H

;=========================
; Copy NUMS -> 1000H
;=========================

MOV BX, OFFSET NUMS
MOV SI, 1000H
MOV CX, 5

COPY_TO_1000:
    MOV AX, [BX]
    MOV [SI], AX

    ADD BX, 2
    ADD SI, 2
LOOP COPY_TO_1000

;=========================
; Ascending Sort
;=========================

MOV CX, 4

OUTER_ASC:
    PUSH CX

    MOV SI, 1000H
    MOV CX, 4

INNER_ASC:
    MOV AX, [SI]

    CMP AX, [SI+2]
    JBE NEXT_ASC

    XCHG AX, [SI+2]
    MOV [SI], AX

NEXT_ASC:
    ADD SI, 2
    LOOP INNER_ASC

    POP CX
    LOOP OUTER_ASC

;=========================
; Copy Ascending -> 2000H
;=========================

MOV SI, 1000H
MOV DI, 2000H
MOV CX, 5

COPY_ASC:
    MOV AX, [SI]
    MOV [DI], AX

    ADD SI, 2
    ADD DI, 2
LOOP COPY_ASC

;=========================
; Descending Sort
;=========================

MOV CX, 4

OUTER_DESC:
    PUSH CX

    MOV SI, 1000H
    MOV CX, 4

INNER_DESC:
    MOV AX, [SI]

    CMP AX, [SI+2]
    JAE NEXT_DESC

    XCHG AX, [SI+2]
    MOV [SI], AX

NEXT_DESC:
    ADD SI, 2
    LOOP INNER_DESC

    POP CX
    LOOP OUTER_DESC

;=========================
; Copy Descending -> 3000H
;=========================

MOV SI, 1000H
MOV DI, 3000H
MOV CX, 5

COPY_DESC:
    MOV AX, [SI]
    MOV [DI], AX

    ADD SI, 2
    ADD DI, 2
LOOP COPY_DESC

HLT

NUMS DW 0F3F5H, 0FFF2H, 0104H, 0842H, 08468H