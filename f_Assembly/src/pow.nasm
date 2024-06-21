; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

leaw $1, %A      ;pega informacao do RAM[1]
movw (%A), %D   ; joga RAM[1] pro D

leaw $0,%A     ;ENTRA NO RAM[0]
movw %D , (%A)  ;GUARDA RAM[1] NO RAM[0]

leaw $2 , %A 
movw %D , (%A) ;REGISTRA RAM[1] NA RAM[2]
subw (%A) , $1 , %D 
movw %D , (%A)

Loop:
    leaw $1, %A      ;ENTRA NO RAM[1]
    movw (%A), %D    ; JOGA RAM[1] PRO D 
    leaw $0 , %A       ;ENTRA NA RAM[0]
    addw (%A), %D , %D    ; SOMA VALOR DE RAM[1] NA RAM[0] E ARMAZENA EM D
    movw %D , (%A)      ; GUARDA D NO RAM[0]
    leaw $2 , %A            ;ENTRA NA RAM[2] QUE É O VALOR DE RAM[1]
    subw (%A) , $1 , %D    ;SUBTRAI 1 E ARMAZENA EM D
    movw %D , (%A)
    leaw $Loop , %A     ; ENTRA NO LOOP
    jg %D           ;VOLTA NO LOOP SE D FOR MAIOR QUE 0
    nop
