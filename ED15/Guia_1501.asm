; Carrega dado01
LDA dado01
; A = dado01

; A = dado01 - dado02
SUB dado02

; A = (dado01 - dado02) - dado03
SUB dado03

; Salva o resultado
STA dado04

HLT

; Dados
dado01: DB 02h
dado02: DB 03h
dado03: DB 01h
dado04: DB 00h