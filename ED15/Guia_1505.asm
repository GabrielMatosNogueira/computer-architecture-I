; dado01 * 4
LDA dado01
ADD A			; *2
ADD A			; *4
MOV B, A		;B = dado01 * 4

; dado02 / 2
LDA dado02
MOV C, A
MVI A, 00h		;A será o quociente

div2:
CMP C
JC fimdiv2
INR A
SUI 02h
JMP div2

fimdiv2:
; soma
ADD B
STA dado03
HLT

dado01: DB 03h
dado02: DB 06h
dado03: DB 00h
