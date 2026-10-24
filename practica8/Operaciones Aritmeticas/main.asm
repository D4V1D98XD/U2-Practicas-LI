INCLUDE Irvine32.inc

; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 08
; Descripción:


.data
	
.code
main PROC
	mov eax, 50
	mov ebx, 50

	add eax, ebx
	sub eax, 15

	nop


	mov eax, 0
	mov al,255

	add al,1

	nop


	; 6 imul: PRODUCTO CON SIGNO

	mov eax, -5
	imul eax, eax, 3

	nop

	; 7. DIV: DIVIENDO VALORES PEQUEÑOS SIN SIGNO

	mov eax, 125
	mov edx, 0								; limpiar el registro para guardar el residuo
	mov ebx, 12

	div ebx									; siempre utiliza eax

	nop

	; 8 IDIV Y CDQ: DIVISION CON SIGNO

	mov eax, -125
	cdq										; es el que indica que el residuo será negativo
	mov ebx, 12

	idiv ebx

 	nop

	exit
main ENDP
END main