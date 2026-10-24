INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 10

; Descripción:
;	un archivo tiene  un tamaño de 100000 bytes. se han recibido 125 bloques de 512 bytes

;	calcula descargados y pendientes
;	porcentaje entero de avance
;	grupos completos de 1024 bytes y residuo del agrupamiento

;	realiza los calculos en main y guarda los resultados en variables DWORD. Crea un procedimiento
;	convierteDecimal que reciba el numero en EAX, y la direccion del buffer en ESI. Utiliza DIV, Residuos
;	PUSH/POP y ASCII. reserva 11 bytes y agrega 00h, Muestra cada resultado con WriteString, sin usar WriteDec


.data
    totalBytes          DWORD 100000
    bloque              DWORD 125
    tamanioBloque       DWORD 512
    bytesDescargados    DWORD ?
    bytesPendientes     DWORD ?
    porcentaje          DWORD ?
    grupos1024          DWORD ?
    residuo1024         DWORD ?

    buffer BYTE 11 DUP(0) ; Un único buffer reutilizable para todas las conversiones[cite: 77]

    mensajeDescarga BYTE "Bytes descargados: ", 0
    mensajePendiente BYTE "Bytes pendientes: ", 0
    mensajeAvance BYTE "Porcentaje de avance: ", 0
    mensajePorcentaje BYTE "%", 0
    mensajeBytes BYTE "Grupos completos de 1024 bytes: ", 0
    mensajeGrupo BYTE "Residuo del agrupamiento: ", 0

.code
main PROC
    ; 1. Descargados
    mov eax, bloque
    mov ebx, tamanioBloque
    mul ebx
    mov bytesDescargados, eax

    ; 2. Pendientes
    mov eax, totalBytes
    sub eax, bytesDescargados
    mov bytesPendientes, eax

    ; 3. Porcentaje
    mov eax, bytesDescargados
    mov edx, 0
    mov ebx, 100
    mul ebx
    mov ebx, totalBytes
    div ebx
    mov porcentaje, eax

    ; 4. Grupos y Residuo (1024)
    mov eax, bytesDescargados
    mov edx, 0
    mov ebx, 1024
    div ebx
    mov grupos1024, eax
    mov residuo1024, edx

    ; --- Impresiones reutilizando el único buffer ---
    mov edx, OFFSET mensajeDescarga                     ; mensaje Descarga
    call WriteString
    mov eax, bytesDescargados
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    mov edx, OFFSET mensajePendiente
    call WriteString
    mov eax, bytesPendientes
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    mov edx, OFFSET mensajeAvance
    call WriteString
    mov eax, porcentaje
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    mov edx, OFFSET mensajePorcentaje
    call WriteString
    call Crlf

    mov edx, OFFSET mensajeBytes
    call WriteString
    mov eax, grupos1024
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    mov edx, OFFSET mensajeGrupo
    call WriteString
    mov eax, residuo1024
    mov esi, OFFSET buffer
    call convertirDecimal
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    exit
main ENDP

convertirDecimal PROC
    push ecx
    push edx
    push ebx
    push esi
    mov ecx, 0
    
    cmp eax, 0
    jne ciclo
    mov dl, '0'
    mov [esi], dl
    mov BYTE PTR [esi+1], 0
    jmp fin

ciclo:
    cmp eax, 0
    je sacar
    mov edx, 0
    mov ebx, 10
    div ebx
    push edx
    inc ecx
    jmp ciclo

sacar:
    cmp ecx, 0
    je finStr
    pop edx
    add dl, '0'
    mov [esi], dl
    inc esi
    dec ecx
    jmp sacar

finStr:
    mov BYTE PTR [esi], 0

fin:
    pop esi
    pop ebx
    pop edx
    pop ecx
    ret
convertirDecimal ENDP

END main