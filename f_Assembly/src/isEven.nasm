; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

leaw $5, %A               ; Carrega RAM[5] no A
movw (%A), %A 
movw $1, %D               ; Carrega 1 no D
andw %A, %D, %D           ; Faz andw com %D e %A

leaw $PAR, %A             ; Carrega condição PAR no reg.A
je %D                     ; Verifica se 0 no reg.D
nop

IMPAR:
    leaw $0, %A           ; Carrega RAM[0] no A
    movw $0, %D           ; Carrega 1 no D
    movw %D, (%A)         ; Define RAM[0] = 0
    leaw $CONTINUA, %A
    jmp
    nop

PAR:
    leaw $0, %A           ; Carrega RAM[0] no A
    movw $1, %D           ; Carrega 1 no D
    movw %D, (%A)         ; Define RAM[0] = 1

CONTINUA: