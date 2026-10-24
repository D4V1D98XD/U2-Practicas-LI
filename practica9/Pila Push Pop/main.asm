INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 09
; Descripción: Demostracion del uso de la pila
.code
main PROC
	mov eax, 67
	
	push eax			; se muevve el valor de eax a la pila
	mov eax, 0			; reinicio del valor de eax
	
	pop ebx				; extraigo el el ultimo valor guardado en la pila y lo guardo en ebx

	mov eax, ebx		; guardo el valor de ebx en eax para imprimirlo en WriteDec
	call WriteDec

main ENDP
END main