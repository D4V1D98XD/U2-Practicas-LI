INCLUDE Irvine32.inc

; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 15
; Descripción: Crear, escribir, guardar y cerrar archivos

.data
	nombreArchivo BYTE "Inventario.txt", 0
	texto BYTE "125", 0
	archivoHandle DWORD ?

	mensajeExito BYTE "Archivo guardado.", 0
	mensajeError BYTE "Error al guardar el Archivo.", 0
	mensajeErrorEscritura BYTE "Error escribiendo el archivo", 0

.code
main PROC
	; 1 Crear el archivo txt
	mov edx, OFFSET nombreArchivo
	call CreateOutputFile						; crea el archivo 

	CMP eax, INVALID_HANDLE_VALUE				; en caso de fallar entra el JE
	je error									; salto a error al crear el archivo

	mov archivoHandle, eax						; guardamos el Handle en nuestra variable especial para ello, en caso de usar eax para otra cosa

	; 2 Escribir los caracteres

	mov eax, archivoHandle						; siempre que se quiera hacer algo, se debe inicializar el Handle en eax
	mov edx, OFFSET texto						
	mov ecx, SIZEOF texto - 1
	call WriteToFile							; escribe nuestro texto en el archivo

	JC errorEscritura							; salta en caso de fallar

	CMP eax, SIZEOF texto - 1
	JMP error

	; 3 Guardar el archivo/Cerrar el Archivo
	mov eax, archivoHandle				; se tiene que recuperar el identificador en caso de hacer operaciones previas
	call CloseFile						; cierra el archivo
	test eax, eax
	JZ error

	mov edx, OFFSET mensajeExito
	call WriteString

	JMP fin

	error:
		mov edx, OFFSET mensajeError
		call WriteString
	exit

	errorEscritura:
		mov edx, OFFSET mensajeErrorEscritura
		call WriteString
		mov eax, archivoHandle
		call CloseFile

	fin:
		exit
main ENDP
END main