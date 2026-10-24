INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 01
; Descripción: HOLA MUNDO CON IRVINE32
.data
	saludo BYTE "Hola Mundo",0
.code
main PROC
	mov edx, OFFSET saludo
	call WriteString
main ENDP
END main