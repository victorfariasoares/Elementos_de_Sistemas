; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

leaw $1, %A  ;leia porta 1
movw (%A), %D ;mova o valor da porta 1 para d
leaw $3, %A ; leia porta 3
addw (%A),%D,%D ;some RAM[3] com Ram[1]
movw %D, (%A)

leaw $0, %A
movw (%A), %D
decw %D
movw %D,(%A)


jg %D ;maior que zero



