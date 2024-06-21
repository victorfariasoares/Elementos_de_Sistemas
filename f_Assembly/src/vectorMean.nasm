; ------------------------------------
; Calcule a média dos valores de um vetor
; que possui inicio em RAM[5] e tamanho
; defindo em RAM[4],
;
; 1. Salve a soma em RAM[1]
; 2. Salve a média em RAM[0]
; 
; ------------------------------------
; antes       | depois
;             |
; RAM[0]:     | RAM[0]:  2  : média 
; RAM[1]:     | RAM[1]:  8  : soma
; RAM[2]:     | RAM[2]:  
; RAM[3]:     | RAM[3]:  
; RAM[4]:  4  | RAM[4]:  4 
; RAM[5]:  1  | RAM[5]:  1 - 
; RAM[6]:  2  | RAM[6]:  2 | vetor
; RAM[7]:  1  | RAM[7]:  1 |
; RAM[8]:  4  | RAM[8]:  4 -
; ------------------------------------


; Inicializando RAM[1] = 0
movw $0, %D
leaw $1, %A
movw %D, (%A)

; Contador na RAM[3]
leaw $4, %A
movw (%A), %D
leaw $3, %A
movw %D, (%A)

; Percorrer na RAM[2]; ; RAM[2] = 4
leaw $4, %A
movw %A, %D
leaw $2, %A
movw %D, (%A)

; Vai começar a soma caso RAM[4] for maior que 0
leaw $4, %A
movw (%A), %D
leaw $SOMA, %A
jg %D
nop

PULADOR:
    leaw $FINALIZA, %A
    jmp
    nop

SOMA:
    ; Somar 1 na RAM[2] para obter RAM[5], 6, etc..
    leaw $2, %A              ; reg.A = 2
    movw (%A), %D            ; reg.D = RAM[2]
    incw %D                  ; reg.D += 1
    movw %D, (%A)            ; RAM[2] = reg.D

    ; Somar RAM[1] com RAM[RAM[2]] e salvar em RAM[1]
    leaw $2, %A              ; reg.A = 2
    movw (%A), %A            ; reg.A = RAM[2]
    movw (%A), %D            ; reg.D = RAM[RAM[2]]
    leaw $1, %A              ; reg.A = 1
    addw (%A), %D, %D        ; reg.D = RAM[1] + reg.D
    leaw $1, %A              ; reg.A = 1
    movw %D, (%A)            ; RAM[1] = reg.D

    ; Decrescer 1 de RAM[3]
    leaw $3, %A             ; Carrega 3 pro reg.A
    movw (%A), %D           ; reg.D = RAM[3]
    decw %D                 ; reg.D -= 1
    leaw $3, %A             ; Carrega 3 pro reg.A
    movw %D, (%A)           ; RAM[3] = reg.D
    leaw $SOMA, %A 
    jg %D
    nop

INICIALIZACAO_2:
    ; RAM[2] deve ser igual à RAM[1]
    leaw $1, %A             ; Carrega 1 pro reg.A
    movw (%A), %D           ; reg.D = RAM[1]
    leaw $2, %A             ; Carrega 2 pro reg.A
    movw %D, (%A)           ; RAM[2] = RAM[1]


MEDIA:
    ; RAM[2] = RAM[2] - RAM[4]
    leaw $4, %A             ; Carrega 4 pro reg.A
    movw (%A), %D           ; reg.D = RAM[4]
    leaw $2, %A             ; Carrega 2 pro reg.A
    subw (%A), %D, %D       ; reg.D = RAM[2] - RAM[4]
    leaw $2, %A             ; Carrega 2 pro reg.A
    movw %D, (%A)           ; RAM[2] = reg.D

    leaw $FINALIZA, %A
    jl %D
    nop

INCREMENTA_1:
    ; RAM[0] += 1
    leaw $0, %A             ; Carrega 0 pro reg.A
    movw (%A), %D           ; reg.D = RAM[0]
    incw %D                 ; reg.D += 1
    leaw $0, %A             ; Carrega 0 pro reg.A
    movw %D, (%A)           ; RAM[0] = reg.D
    
    leaw $MEDIA, %A
    jmp
    nop

FINALIZA: