; 2*dado01
LDA dado01
ADD A
MOV B, A		; B = 2*dado01

; 3*dado02
LDA dado02
ADD A			; 2*dado02
ADD dado02		; 3*dado02
MOV C, A		;C = 3*dado02

; resultado = B - C
MOV A, B
SUB C
STA dado03
HLT

dado01: DB 02h
dado02: DB 03h
dado03: DB 00h
