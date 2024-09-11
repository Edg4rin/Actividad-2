;Edgar Oclica Martinez
.org 0000h         ; Indica que el código comienza en la dirección 0000h

    ld b,25        ; Carga el valor 81h en el registro B
    ld c,0         ; Carga el valor 0 en el registro C
    ld a,b         ; Carga el valor de B en el registro A

    cp 0           ; Compara el contenido de A con 0
    jr Z, definitivo   ; Si A es igual a 0, salta a la etiqueta "ultimo"
    cp 1           ; Compara el contenido de A con 1
    jr Z, definitivo   ; Si A es igual a 1, salta a la etiqueta "ultimo"

    ld d,1         ; Carga el valor 1 en el registro D
    ld e,1         ; Carga el valor 1 en el registro E
ciclo:
    ld a,b         ; Carga el valor de B en el registro A
    cp d           ; Compara el contenido de A con D
    jr c, definitivo1 ; Si A < D, salta a la etiqueta "ultimo_1"
    inc e          ; Incrementa E en 1
    ld h,0         ; Carga 0 en el registro H
    ld l,0         ; Carga 0 en el registro L
multiplicacion:
    ld a,l         ; Carga el valor de L en el registro A
    add a,e        ; Suma A y E, resultado en A
    ld l,a         ; Guarda el resultado de A en L
    inc h          ; Incrementa H en 1
    ld a,e         ; Carga el valor de E en el registro A
    cp h           ; Compara el valor de A con H
    jr nz, multiplicacion ; Si A no es igual a H, repite la multiplicación
    ld d,l         ; Guarda el valor de L en D
    jr ciclo       ; Repite el ciclo

definitivo:
    ld c,a         ; Guarda el valor de A en C
    jr convertir   ; Salta a la etiqueta "convertir"

definitivo1:
    dec e          ; Decrementa E en 1
    ld c,e         ; Guarda el valor de E en C
    jr convertir   ; Salta a la etiqueta "convertir"

convertir:
    ld a,b         ; Carga el valor de B en el registro A
    ld l,0         ; Carga 0 en L
curl:
    cp 10          ; Compara el valor de A con 10
    jr c, acabado     ; Si A < 10, salta a "done"
    sub 10         ; Resta 10 de A
    inc l          ; Incrementa L en 1
    jr curl        ; Repite el ciclo hasta que A < 10
acabado:
    sla l          ; Desplaza L a la izquierda 1 bit (L * 2)
    sla l          ; Desplaza L a la izquierda 1 bit (L * 4)
    sla l          ; Desplaza L a la izquierda 1 bit (L * 8)
    sla l          ; Desplaza L a la izquierda 1 bit (L * 16)
    or l           ; Realiza un OR entre A y L (concatenación)
    ld B,A         ; Guarda el valor de A en B
    halt           ; Detiene la ejecución

.end               ; Finaliza el código fuente
