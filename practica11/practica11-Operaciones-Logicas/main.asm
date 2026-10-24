INCLUDE Irvine32.inc

; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 11
; Descripción: Operaciones logicas

;	ESTADOS DE COMPUTADORA
;	0 Computadora Encendida	0: No 1: Si
;	1 Alarma				0: No 1: Si
;	2 Computadora Conectada	0: No 1: Si
;	Condiciones Iniciales: 0000 0101
.data
	mensaje1 BYTE "COMPUTADORA APAGADO", 0
	mensaje2 BYTE "COMPUTADORA ENCENDIDO", 0
	mensaje3 BYTE "ALARMA ENCENDIDA", 0
	mensaje4 BYTE "ALARMA APAGADA", 0

.code
main PROC
; 1	AND: Evaluacion de Alarma
	mov eax, 0
	mov AL, 00000111b				;la b al final indica que son bytes
	AND AL, 00000010b				; evaluar alarma
	call WriteBin					; WriteBin imprime los bits

	call crlf

; 2 OR: ENCENDER ALARMA
	mov eax, 0
	mov AL, 00000101b
	OR AL,  00000010b
	call WriteBin
	call crlf

; 3 XOR:Apagar computadora y encenderla
; Estado inicial: 0000 0101

	mov edx, OFFSET mensaje1
	call WriteString
	
	call  crlf
	mov eax, 0
	mov AL, 00000101b
	XOR AL, 00000001b		; XOR modifica los bits haciendo que se apgue
	call WriteBin
	call crlf

	mov edx, OFFSET mensaje2
	call WriteString
	call crlf
	XOR AL, 00000001b		; al pasar por el proceso otra vez, se enciende la computadora
	call WriteBin
	call crlf


; 4 - TEST: Evaluar Alarma encendida y apagada
; Realizar salto y mostrar mensaje de "Alarma esta encendida"
; o "Alarma esta apagada"

	mov eax, 0
	mov AL, 00000000b
	TEST AL,00000010b
	JZ apagado

	encendido:
		mov edx, OFFSET mensaje3
		call WriteString
		exit

	apagado:
		mov edx, OFFSET mensaje4
		call WriteString
		exit


main ENDP
END main