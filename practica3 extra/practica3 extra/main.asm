INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 03 EXTRA
; Descripción:

 ; COMPARACION MAYOR O IGUAL
 ; escanear del teclado dos numeros y compararlos

.data
	msgEntrada BYTE "Introduce un numero: ",0
	msgEntrada2 BYTE "Introduce otro numero: ",0
	msgIgual BYTE "Los numeros son iguales",0
	msgMayor BYTE "el primer numero es mayor", 0
	msgMenor BYTE "el primer numero es menor", 0
.code
main PROC
	mov edx, OFFSET msgEntrada
	call WriteString							; Imprime msgEntrada
	call ReadInt								; Lee un numero entero del teclado y lo guarda en eax
	call crlf									; Salto de Linea
	mov ebx, eax								; guarda el valor escaneado en ebx
	mov edx, OFFSET msgEntrada2
	call WriteString
	call ReadInt								; se guarda otro valor en eax

	CMP ebx, eax								; compara ebx con eax
	JE iguales									; si son iguales entra a iguales

	CMP ebx, eax								; compara ebx con eax
	JG mayor									; si ebx es mayor entra a mayor

	CMP ebx, eax								; compara ebx con eax
	JL menor									; si ebx es menor a eax entra a menor

	; A partir de aqui solo entra a cada bloque e imprime su respectivo mensaje y termina el programa

	iguales:
		mov edx, OFFSET msgIgual
		call WriteString
		exit
	mayor:
		mov edx, OFFSET msgMayor
		call WriteString
		exit
	menor:
		mov edx, OFFSET msgMenor
		call WriteString
		exit
main ENDP
END main