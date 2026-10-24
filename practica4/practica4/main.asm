INCLUDE Irvine32.inc

.data
	mensaje BYTE "Escribe tu nombre: ",0
	nombre BYTE 30 DUP(0)

.code
main PROC
	mov edx, OFFSET mensaje
	call WriteString

	mov edx, OFFSET nombre
	mov ecx, SIZEOF nombre

	call ReadString

	mov edx, OFFSET nombre
	call WriteString
	exit
main ENDP
END main