.386

; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 01 real real
; Descripción: Hola Mundo sin Irvine32

;nos permite usar trabajas con registros de 32 bits

.model flat, stdcall
; flat : utiliza un espacio de direcciones plano
; stdcall: define la forma de llamar a los procesos

.stack 4096

GetStdHandle PROTO,
	nStdHandle:DWORD

; PROTO declara el prototipo

WriteConsoleA PROTO,
	hConsoleOutput:DWORD,
	ipBuffer:PTR BYTE,
	nNumberOfCharsToWrite:DWORD,
	lpNumberOfCharsWritten:DWORD,
	lpReserved:DWORD

ExitProcess PROTO,
	dwExitCode:DWORD,

STD_OUTPUT_HANDLE EQU -11

.data
mensaje BYTE "Etesech!", 13, 10
;13 es carriage line
;10 es el feed line
;cuando 13 y 10 trabajan en conjunto funcionan como un salto de linea

longitud EQU ($ - mensaje)
; longitud nos va permitir conocer automaticamente la

CaracteresEscritos DWORD ?

.code
main PROC
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	;llamamos a la funcion GetStdHandle mandando el valor de la

	mov ebx, eax

	INVOKE WriteConsoleA,
		ebx,
		ADDR mensaje,
		longitud,
		ADDR CaracteresEscritos,
		0
	INVOKE ExitProcess, 0
main ENDP
END main