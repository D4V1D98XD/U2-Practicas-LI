INCLUDE Irvine32.inc

.data
	msgEntrada BYTE "Introduce un numero (introducir 0 para salir): ",0

.code
main PROC
ciclo:
	mov edx, OFFSET msgEntrada
	call ReadInt
	call crlf
	call WriteDec
	call crlf
	CMP eax, 0
	JLE ciclo

	exit
main ENDP
END main