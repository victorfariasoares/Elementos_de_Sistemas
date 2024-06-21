; Arquivo: stringLength.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi 
; Data: 28/03/2018
;
; Assuma que uma string é um conjunto de caracteres terminado
; em NULL (0).
; 
; Supondo que temos uma string que começa no endereço 8 da RAM.
; Calcule o seu tamanho e salve o resultado na RAM[0].
;
; Os caracteres estão formatados em ASCII
; http://sticksandstones.kstrom.com/appen.html
; 
; Exemplo:
;
;   Convertido para ASCII
;             |
;             v
;  RAM[8]  = `o`
;  RAM[9]  = `i`
;  RAM[10] = ` `
;  RAM[11] = `b`
;  RAM[12] =  l`
;  RAM[13] = `z`
;  RAM[14] = `?`
;  RAM[15] = NULL = 0x0000


; If RAM [8] not NUll, RAM[8] = add1"

leaw $8, %A ; %A aponta para RAM[8]
movw %A, %D ; move para %D o valor 8
leaw $0, %A ; aponta para RAM[0]
movw %D, (%A) ; D tinha valor 8, esse valor é passado para ram[0] = 8

WHILE:
    leaw $0, %A ; aponta para RAM[0]
    movw (%A), %A ; move memoria A = ram[0]  então A tem valor 8
    movw (%A), %D ; move memoria A para %D = ram[A] portanto D = ram[8]
    leaw $FINAL, %A ; adiciona endereço do FINAL
    je %D ; se a for igual a zero vai pro endereço FINAL
    nop
    leaw $0, %A ; aponta para RAM[0]
    movw (%A), %A ; move memoria para A do ram[0] (A = 8)
    incw %A ; faz A = A + 1 (A = 8 + 1)
    movw %A, %D ; copia o valor do %A para %D portanto D = 9
    leaw $0, %A ; aponta para RAM[0]
    movw %D, (%A) ; ram[A] = D (ram[0] = 9)
    leaw $WHILE, %A ; endereça o WHILE
    jmp ;faz o jump pro WHILE
    nop
FINAL:
    nop
    leaw $8, %A ; aponta para RAM[8]
    movw %A, %D ; move valor de %A para %D
    leaw $0, %A ; aponta para RAM[0]
    rsubw %D, (%A), %A ;faz a subtração reversa
    movw %A, %D ; copia %A para %D
    leaw $0, %A ; aponta para RAM[0] 
    movw %D, (%A) ; faz memoria de ram[0] = D

END: 
    