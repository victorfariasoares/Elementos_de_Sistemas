; Elementos de Sistemas : 2018a
; Rafael Corsi
; Hardware : Z0.1
;
; Data :
;    - Dez 2018
; Descrição :
;    - Movimentação de dados da memoria RAM
;
; RAM[0] = RAM[1]
; RAM[1] = RAM[0]
; RAM[3] = 1

leaw $0 , %A
movw (%A),%D  ; informação do 0 ta em D
leaw $2 , %A 
movw %D , (%A)  ; informação do 0 ta no 2
leaw $1 , %A    
movw (%A), %D    ;informação do 1 foi pro D
leaw $0 , %A
movw %D , (%A)      
leaw $2 , %A
movw (%A) , %D   ;informacao do 2 que é 0 ta no D
leaw $1 , %A
movw %D , (%A)

leaw $3 , %A
movw $1 , (%A)



