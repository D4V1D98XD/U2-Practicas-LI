INCLUDE Irvine32.inc

; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 06
; Descripción: Crear un pin de Acceso y si se equivoca con el pin 3 veces terminar el programa

.data
	msgPin BYTE "Ingrese PIN de accceso: ", 0
	msgError BYTE "PIN Incorrecto", 0
	msgAcceso BYTE "Acceso permitido", 0
	msgIntento BYTE "Intentos Restantes: ", 0
	msgBloqueo BYTE "Sistema bloqueado", 0

	pinCorrecto = 1234								; variable de pin de acceso

.code
main PROC
	mov ebx, 3										; numero de intentos permitidos


intentar:
	mov edx, OFFSET msgPin							; imprime el mensaje de ingresar pin
	call WriteString
	call ReadInt									; lee del teclado una combinacion numrica

	CMP eax, pinCorrecto							; compara el dato leido con nuestro pin de acceos
	JE acceso										; si es correcto salta a acceso

	mov edx, OFFSET msgError						; si no es correcto sse produce el mensaje de error
	call WriteString
	call crlf										; salto de linea
	
	dec ebx											; decrementa el numero de intentos
	jz bloqueo										; salta a bloqueo si ebx es igual a 0, osea se queda sin intentos

	mov edx, OFFSET msgIntento						; si todavia tiene intentos produce el mensaje de la cantidad de intentos
	call WriteString
	mov eax, ebx									; pasa el valor de intentos a eax porque ese registro utiliza WriteDec
	call WriteDec									; imprime el numero de intentos
	call crlf										; salto de linea

	JMP intentar									; regresa al inicio para que pueda intentar de nuevo

	acceso:											; bloque de codigo de acceso donde se ingreso correctamente, solo imprime el mensaje y termina el codigo
		mov edx, OFFSET msgAcceso
		call WriteString
		call crlf
		JMP fin

	bloqueo:										; bloque de codigo de bloque donde se ingreso de manera erronea, solo imprime el mensaje y termina el codigo
		mov edx, OFFSET msgBloqueo
		call WriteString
		call crlf
		JMP fin

	fin:											; termina el programa
		exit

main ENDP
END main