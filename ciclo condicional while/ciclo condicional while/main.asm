INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica:
; Descripción: ciclo condicional While
.code
main PROC
	mov ebx, 1		; valor inicial de ebx en 1
ciclo:
	CMP ebx, 100	; si ebx alcanza el valor de 100 entra al JG
	jg fin			; salto a fin

	mov eax, ebx	; guarda el valor de ebx en eax porque WriteDec utiliza ese registro
	call WriteDec
	call crlf		; salto de linea

	inc ebx			; incrementa ebx en uno

	jmp ciclo		; salta de regreso a ciclo

fin:				; termina el codigo
	exit
main ENDP
END main