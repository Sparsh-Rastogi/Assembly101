include 'emu8086.inc'
ORG 100H

; Get User Inputs
PRINT 'Enter u: '
CALL scan_num
MOV BX, CX       ; Store 'u' in BX
PRINTN ''

PRINT 'Enter t: '
CALL scan_num
MOV DI, CX       ; Store 't' in DI (using DI as a generic register here)
PRINTN ''

PRINT 'Enter a: '
CALL scan_num
MOV SI, CX       ; Store 'a' in SI 
PRINTN ''

; Calculate (u * t)
MOV AX, BX
MUL DI           ; AX = u * t
MOV BP, AX       ; Temporarily save (u*t) in BP

; Calculate (1/2) * a * t^2
MOV AX, DI
MUL DI           ; AX = t^2
MUL SI           ; AX = a * t^2
SHR AX, 1        ; Divide by 2 by shifting right 1 bit

; Final Addition: s = ut + (1/2)at^2
ADD AX, BP       ; AX = (u*t) + (1/2 * a * t^2)

PRINT 'Displacement (s) = '
CALL print_num   ; Display the computed Displacement value

RET              ; Exit program

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS