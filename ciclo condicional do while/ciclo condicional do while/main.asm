INCLUDE Irvine32.inc
.code
main PROC	
	mov ebx, 1

	ciclo:
		mov eax, ebx
		call WriteDec
		call crlf

		inc ebx
		CMP ebx, 100
		JLE ciclo

		exit
main ENDP
END main