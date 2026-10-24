INCLUDE Irvine32.inc

; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 2 - 1 en la lista del profe
; Descripción: Ciclo numerico

.data
.code
main PROC
	mov ecx, 5		; se inicializa ecx en 5, es el contador predeterminado

	ciclo:
	mov eax, ecx	; guarda el valor de ecx en eax porque ese es el registro que utiliza WriteDec
	call WriteDec
	call crlf		; salto de linea
	loop ciclo		; disminuye en 1 ecx y regresa al ciclo si no es igual a 0
	exit			; termina el programa

main ENDP
END main