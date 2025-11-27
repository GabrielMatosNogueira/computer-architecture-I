; HL = dado01
LXI H, dado01
MOV A, M	; A = low1
INX H
MOV B, M	; B = high1

; Subtrai dado02
LXI H, dado02
SUB M		; low
MOV A, A
INX H
MOV C, M
SUB C		; high

; Soma dado03
LXI H, dado03
ADD M		 ; low
INX H
ADD M		 ; high

; Subtrai dado04
LXI H, dado04
SUB M		; low
INX H
SUB M		 ; high

; Armazena em dado05
STA dado05		; low
INX H
STA dado05+1	 ; high

HLT

; Dados (16 bits: low, high)
dado01: DB 01h, 00h
dado02: DB 02h, 00h
dado03: DB 03h, 00h
dado04: DB 04h, 00h
dado05: DB 00h, 00h
