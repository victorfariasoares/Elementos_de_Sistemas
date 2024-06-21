; ------------------------------------------------------------
; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Calcula o resto da divisão (modulus) entre RAM[0] por RAM[1]
; e armazena o resultado na RAM[2].
;
; 4  % 3 = 1
; 10 % 7 = 3
; ------------------------------------------------------------





LOOP:
leaw $4 , %A ; leia 4
movw (%A),%D ;mova o valor de 4 a D
incw  %D ; some 1
movw %D, (%A) ; mova somado para o valor da porta 4

leaw $0, %A  ;leia porta 0
movw (%A),%D ;mova o valor de zero a D
leaw $1, %A ;leia 1
subw %D,(%A),%D ; sub de 0 o valor de 1
leaw $0, %A  ;leia porta 0
movw %D, (%A) ; mova a sub para o valor da porta 0
leaw $LOOP, %A ; precisamos carregar em %A o valor do salto
jg %D ;maior que zero
nop



leaw $0 , %A ; leia 0
movw (%A), %D ; mova o valor de 0 para D
leaw $SUB_RESTO, %A ; precisamos carregar em %A o valor do salto
jl %D
nop
leaw $2 , %A
movw $0, (%A) ; mova a sub para o valor da porta 0
leaw $END, %A ; precisamos carregar em %A o valor do salto
jmp
nop

SUB_RESTO:

leaw $0 , %A
movw (%A),%D ;mova o valor de zero a D

leaw $1 , %A
addw (%A),%D ,%D ;mova o valor de zero a D

leaw $2 , %A
movw %D, (%A) ; mova a sub para o valor da porta 0


END:



