INCLUDE Irvine32.inc

; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 13
; Descripción: conversion de hexadecimal a string


.data
    numero DWORD 1234ABCDh
    mensaje BYTE "Numero hexadecimal: ", 0
    cadena  BYTE 9 DUP(0)     ; 8 digitos + terminador nulo

.code
main PROC
    mov eax, numero            ; EAX = numero a convertir
    mov esi, OFFSET cadena
    add esi, 8                 ; apuntar al final de los 8 caracteres
    mov BYTE PTR [esi], 0      ; terminador nulo
    dec esi

    mov ecx, 8                 ; 8 digitos hexadecimales

convertir:
    mov edx, eax
    and edx, 0Fh               ; extraer los 4 bits menos significativos

    cmp edx, 9
    jbe es_digito

    add edx, 37h               ; 10-15 -> A-F
    jmp guardar

es_digito:
    add edx, 30h               ; 0-9 -> '0'-'9'

guardar:
    mov BYTE PTR [esi], dl     ; guardar caracter ASCII
    dec esi

    shr eax, 4                 ; siguiente nibble
    loop convertir

    mov edx, OFFSET mensaje
    call WriteString

    mov edx, OFFSET cadena
    call WriteString
    call Crlf

    exit
main ENDP
END main
