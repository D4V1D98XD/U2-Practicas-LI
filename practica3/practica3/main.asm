INCLUDE Irvine32.inc

; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 03
; Descripción: Comparar dos registros e imprimir un mensaje dedicado a cada posible resultado

.data
	msgIguales BYTE "Los valores son iguales", 0
	msgDiferentes BYTE "los valores son diferentes", 0
															; mensajes para mostrar dependiendo el resultado
.code
main PROC
	mov eax, 10												; le asigno el valor de 10 a eax
	mov ebx, 10												; le asigno el valor de 10 a ebx
	CMP eax, ebx											; se enciende zeroflag = 1
	
	JE iguales												; salta si ZeroFlag (ZF) esta enecendida
	mov edx, OFFSET msgDiferentes							; como se hace un salto antes si son iguales, solo entra aqui si son diferentes
	call writeString
	jmp fin													; salta de manera incondicional a fin

	iguales:												; bloque de codigo si son iguales
		mov edx, OFFSET msgIguales
		call writeString
		jmp fin
	
	fin:													; salto a fin y termina el programa
		call crlf											; salto de linea
		exit												; cierra el programa


main ENDP
END main