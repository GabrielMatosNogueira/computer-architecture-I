; 4*dado02 = dado02 *2 *2
LDA dado02
ADD A
ADD A
MOV B, A		;B = 4*dado02

; dado01 - 4*dado02
LDA dado01
SUB B
MOV C, A		;C = (dado01 - 4*dado02)

; 3 * C
ADD C			; A = C + C = 2C
ADD C			; A = 3C
STA dado03
HLT

dado01: DB 08h
dado02: DB 02h
dado03: DB 00h
