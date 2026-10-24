INCLUDE Irvine32.inc

.data
	msgIguales BYTE "Los valores son iguales", 0
	msgDiferentes BYTE "los valores son diferentes", 0

.code
main PROC
	mov eax, 10
	mov ebx, 10
	CMP eax, ebx ; se enciende zeroflag = 1
	
	JE iguales
	mov edx, OFFSET msgDiferentes
	call writeString
	jmp fin

	iguales:
		mov edx, OFFSET msgIguales
		call writeString
		jmp fin
	
	fin:
		call crlf
		exit


main ENDP
END main