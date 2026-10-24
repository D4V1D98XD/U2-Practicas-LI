INCLUDE Irvine32.inc

; Materia: Lenguajes de Interfaz 
; Alumno: Leonardo David Garcia Leyva
; Horario: 9:00 - 10:00
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: 14
; Descripción: Captura y almacenamiento de datos

.data
    ; Variables solicitadas por la práctica
    existenciaInicial   DWORD 25
    cantidadRecibida    DWORD ?
    existenciaActual    DWORD ?

    ; Mensajes y textos en pantalla
    msgPrompt           BYTE "Ingrese la cantidad recibida (1-99): ", 0
    msgError            BYTE "Error: Cantidad invalida o fuera de rango. Intente de nuevo.", 0
    msgActual           BYTE "Existencia actual en almacen: ", 0
    
    ; Buffers para lectura de cadena y conversión
    bufferEntrada       BYTE 10 DUP(0)
    bufferDecimal       BYTE 11 DUP(0)

.code
main PROC
pedir_cantidad:
    ; 1. Mostrar mensaje inicial
    mov edx, OFFSET msgPrompt
    call WriteString

    ; 2. Capturar entrada mediante ReadString (sin usar ReadDec)
    mov edx, OFFSET bufferEntrada
    mov ecx, SIZEOF bufferEntrada
    call ReadString                 ; EAX devuelve la cantidad de caracteres leídos

    ; Validar que no esté vacía la entrada
    cmp eax, 0
    je error_entrada

    ; Validar que sea de 1 o 2 dígitos máximo
    cmp eax, 2
    ja error_entrada

    ; 3. Validar y convertir caracteres a número numérico
    mov esi, OFFSET bufferEntrada
    mov ecx, eax                    ; ECX será el contador de caracteres
    mov eax, 0                      ; Acumulador numérico en 0

validar_caracteres:
    mov edx, 0                      ; Limpiar EDX por completo para evitar basura en los bits altos
    mov dl, [esi]                   ; Cargar únicamente el carácter actual en DL
    
    ; Comprobar que sea un dígito válido ('0' a '9')
    cmp dl, '0'
    jb error_entrada
    cmp dl, '9'
    ja error_entrada

    ; Convertir carácter a su valor numérico restando '0' (30h)
    sub dl, '0'

    ; Acumulador = Acumulador * 10 + dígito
    push edx                        ; Guardar el dígito limpio temporalmente en la pila
    mov ebx, 10
    mul ebx                         ; EAX = EAX * 10 (Ojo: mul usa EDX, por eso guardamos el dígito antes)
    pop edx                         ; Recuperar nuestro dígito
    
    add eax, edx                    ; EAX = (EAX anterior * 10) + dígito actual

    inc esi                         ; Siguiente carácter
    loop validar_caracteres

    ; 4. Validar rango entre 1 y 99
    cmp eax, 1
    jb error_entrada
    cmp eax, 99
    ja error_entrada

    ; Guardar en la variable DWORD solicitada
    mov cantidadRecibida, eax

    ; 5. Sumar a la existencia inicial (25 + cantidadRecibida)
    mov eax, existenciaInicial
    add eax, cantidadRecibida
    mov existenciaActual, eax

    ; 6. Mostrar el resultado usando WriteString y el convertidor decimal
    call Crlf
    mov edx, OFFSET msgActual
    call WriteString

    mov eax, existenciaActual
    mov esi, OFFSET bufferDecimal
    call convertirDecimal
    mov edx, OFFSET bufferDecimal
    call WriteString
    call Crlf

    jmp fin_programa

error_entrada:
    call Crlf
    mov edx, OFFSET msgError
    call WriteString
    call Crlf
    call Crlf
    jmp pedir_cantidad              ; Solicitar nuevamente ante un error

convertirDecimal PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi

    mov ecx, 0                  

conversion_loop:
    mov edx, 0                  
    mov ebx, 10
    div ebx                     
    
    push edx                    
    inc ecx                     

    cmp eax, 0                  
    jne conversion_loop         

extrar_digitos_loop:
    pop edx                     
    add dl, '0'                 
    mov [esi], dl               
    inc esi                     
    loop extrar_digitos_loop

    mov BYTE PTR [esi], 0       

    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
convertirDecimal ENDP
fin_programa:
    exit
main ENDP
END main    ;