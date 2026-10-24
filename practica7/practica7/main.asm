TITLE ValidarCadena

; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 07
; Descripción:

INCLUDE Irvine32.inc

.data
    mensaje     BYTE "Ingrese un codigo (AAA-999): ",0
    valido      BYTE "Formato valido.",0
    invalido    BYTE "Formato invalido.",0

    cadena      BYTE 20 DUP(?)

.code

main PROC

    ; Mostrar mensaje
    mov edx, OFFSET mensaje
    call WriteString

    ; Leer cadena
    mov edx, OFFSET cadena
    mov ecx, SIZEOF cadena - 1
    call ReadString

    ; EAX contiene la longitud
    cmp eax, 7
    jne FORMATO_INVALIDO

    ; --------------------------------
    ; Posicion 0: letra A-Z
    ; --------------------------------
    mov esi, OFFSET cadena

    mov al, [esi]
    cmp al, 'A'
    jb FORMATO_INVALIDO
    cmp al, 'Z'
    ja FORMATO_INVALIDO

    ; --------------------------------
    ; Posicion 1: letra A-Z
    ; --------------------------------
    mov al, [esi + 1]
    cmp al, 'A'
    jb FORMATO_INVALIDO
    cmp al, 'Z'
    ja FORMATO_INVALIDO

    ; --------------------------------
    ; Posicion 2: letra A-Z
    ; --------------------------------
    mov al, [esi + 2]
    cmp al, 'A'
    jb FORMATO_INVALIDO
    cmp al, 'Z'
    ja FORMATO_INVALIDO

    ; --------------------------------
    ; Posicion 3: separador '-'
    ; --------------------------------
    mov al, [esi + 3]
    cmp al, '-'
    jne FORMATO_INVALIDO

    ; --------------------------------
    ; Posicion 4: digito 0-9
    ; --------------------------------
    mov al, [esi + 4]
    cmp al, '0'
    jb FORMATO_INVALIDO
    cmp al, '9'
    ja FORMATO_INVALIDO

    ; --------------------------------
    ; Posicion 5: digito 0-9
    ; --------------------------------
    mov al, [esi + 5]
    cmp al, '0'
    jb FORMATO_INVALIDO
    cmp al, '9'
    ja FORMATO_INVALIDO

    ; --------------------------------
    ; Posicion 6: digito 0-9
    ; --------------------------------
    mov al, [esi + 6]
    cmp al, '0'
    jb FORMATO_INVALIDO
    cmp al, '9'
    ja FORMATO_INVALIDO

    ; Si llegó hasta aquí, es válido
    mov edx, OFFSET valido
    call WriteString
    jmp FIN

FORMATO_INVALIDO:

    mov edx, OFFSET invalido
    call WriteString

FIN:
    call Crlf
    exit

main ENDP
END main