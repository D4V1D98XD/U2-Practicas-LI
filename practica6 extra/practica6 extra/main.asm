INCLUDE Irvine32.inc

; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 06 EXTRA
; Descripción: Crear un sistema de estacionaminto donde tenemos cierto numero de espacios y vehiculos entran y salen

.data
	msgAcceso BYTE "vehiculo entra", 0
	msgSalida BYTE "vehiculo sale", 0
	msgNumVehiculos BYTE "Numero de Vehiculos: ", 0
	msgLleno BYTE "Estacionamiento lleno", 0
	msgComprueba BYTE "Vehiculo entra o sale? 0.Fin	 1. Entra 2. Sale	: ", 0
	msgVacio BYTE "Estacionamiento vacio, no pueden salir vehiculos", 0
	espacios = 10							; numero de espacios en el estacionamiento

.code
main PROC
mov ebx, 0
estacionamiento:
	mov edx, OFFSET msgComprueba
	call WriteString
	call readInt							; escanea del teclado y se guarda en eax

	CMP ebx, espacios						; si ebx es igual al numero de espacios entra al JE
	JE lleno								; si esta lleno salta a lleno

	CMP eax, 1								; compara lo escaneado con el numero indicado al acceso
	JE acceso								; si es igual la comparacion, el jump entra a acceso

	CMP eax, 2								; compara lo escaneado con el numero indicado a la salida
	JE salida								; si es igual la comparacion, el jump entra a salida

	CMP eax, 0								; Compara lo escaneado con el numero indicado a fin
	JE fin									; si es igual la comparacion, el jump va a salida

	
	acceso:
		inc ebx								; incrementa ebx, osea hay un vehiculo mas
		mov edx, OFFSET msgAcceso
		call WriteString
		call crlf							; salto de linea
		mov edx, OFFSET msgNumVehiculos
		call WriteString
		mov eax, ebx						; guarda el valor de ebx en eax porque ese registro utiliza WriteDec
		call WriteDec
		call crlf
		JMP estacionamiento					; regresa a estacionamiento

	salida:
		mov edx, OFFSET msgSalida
		call WriteString
		call crlf

		dec ebx								; decrementar ebx
		mov edx, OFFSET msgNumVehiculos
		call WriteString
		mov eax, ebx
		call WriteDec
		call crlf
		JMP estacionamiento

		lleno:
			mov edx, OFFSET msgLleno
			call WriteString
			JMP estacionamiento
			call crlf


	fin:
		exit
main ENDP
END main