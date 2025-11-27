; dado01 % 2
LDA dado01
ANI 01h
MOV B, A		; B = dado01 % 2

; dado02 / 4
LDA dado02
MOV C, A		; valor para dividir
MVI A, 00h		; quociente

div4:
CMP C
JC fimdiv4
INR A
SUI 04h
JMP div4

fimdiv4:
; soma
ADD B
STA dado03
HLT

dado01: DB 03h
dado02: DB 09h
dado03: DB 00h