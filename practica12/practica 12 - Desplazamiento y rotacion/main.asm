INCLUDE Irvine32.inc

; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 12
; Descripción: Desplazamiento y Rotacion

.data
	saludo BYTE "Hola Mundo",0
.code
main PROC

	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

; 1 SHL: DESPLAZAR UN BIT HACIA LA IZQUIERDA
	mov al, 10000110b
	SHL al, 1						; se recorren los bits en uno hacia la izquierda
	call DumpRegs					; imprime las bandeeras
	call WriteBin					; imprime los bits
	call crlf
	call crlf

; 2 SHR: DESPLAZAAR UN BIT HACIA LA DERECHA
	mov al, 00011001b
	SHR al, 1						; se recorren los bits hacia la derecha
	call DumpRegs
	call WriteBin
	call crlf
	
; 3 SAR: DESPLAZAMIENTO CON SIGNO
	mov eax, 0
	mov al, 0
	SAR al, 1
	
; 4 SAR: DESPLAZAMIENTO CON VALORES IMAPRES
	mov eax,0
	mov al, 0
	SAR al, 1

; 5 CONTEO CONSTANTE: DESPLAZAR DOS POSICIONES
	mov al, 00001100b
	SHL al, 2

	call DumpRegs
	call WriteBin

	exit


; 6 CONTEO CON CL: DESPLAZAR UTILIZANDO REGISTRO
	mov al, 00001100b
	mov cl, 2
	SHR al, cl

; 7 ROR, ROL, RCR, RCL

	mov edx, OFFSET saludo
	call WriteString
	call crlf
	call crlf

	mov eax, 0
	mov AL, 10000000b
	ROR AL, 1

	call DumpRegs
	call WriteBin

	mov eax, 0
	mov AL, 00000001b
	ROL AL, 1

	call DumpRegs
	call WriteBin

	mov eax, 0
	mov AL, 10000000b
	RCR AL, 1

	call DumpRegs
	call WriteBin

	mov eax, 0
	mov AL, 00000001b
	RCL AL, 1

	call DumpRegs
	call WriteBin

	

main ENDP
END main