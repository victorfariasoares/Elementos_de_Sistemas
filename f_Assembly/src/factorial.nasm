; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017



; Calcula o fatorial do número em R0 e armazena o valor em R1.



leaw $1,%A 
movw %A,%D
leaw $7,%A 
movw %D,(%A)

leaw $0,%A 
movw (%A),%D
decw %D

leaw $FIM,%A
jle %D
nop




leaw $0,%A 
movw (%A),%D
leaw $5,%A ; valor de RAM [0] ;4
movw %D,(%A)
leaw $7,%A ; valor de RAM [0] ;4
movw %D,(%A)

DECREMENTAR:
leaw $5,%A ; valor de RAM [5] ;4
movw (%A),%D 
decw %D ;DECREMENTE 5 
leaw $20,%A ; valor de RAM [0] ; 3
movw %D,(%A)

MULTIPLICADOR:
leaw $7, %A  ;leia porta 7
movw (%A), %D ;mova o valor da porta 7 para d
leaw $6, %A ; leia porta 6 ;0 ; 4
addw (%A),%D,%D ;some RAM[6] com Ram[7] 
movw %D, (%A) 

leaw $20, %A ; 3 ; 2
movw (%A), %D 
decw %D ; 2 ;1
movw %D,(%A) 
leaw $MULTIPLICADOR,%A
jg %D ;maior que zero
nop

leaw $6, %A ; leia porta 6 ; 12
movw (%A), %D ;mova o valor da porta 6 para d
movw $0, (%A)
leaw $7, %A  ;leia porta 7 ;4
movw %D, (%A) ;mova o valor da porta 6 para 7 ; 12

leaw $5,%A ; 4
movw (%A),%D
decw %D ; 4
movw %D,(%A)
leaw $DECREMENTAR,%A
jg %D
nop


FIM:
leaw $7, %A  ;leia porta 7
movw (%A) ,%D ;mova o valor da porta 7 para d

leaw $1,%A
movw %D,(%A)