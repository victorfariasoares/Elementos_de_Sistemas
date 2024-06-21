; Arquivo: Max.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares 
; Data: 27/03/2017
; Log :
;     - Rafael Corsi portado para Z01
;
; Calcula R2 = max(R0, R1)
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2


 leaw $1,%A         
 movw (%A),%D      

 leaw $0,%A         
 subw %D, (%A), %D
 leaw $ELSE, %A 
 jle %D 
 nop

 leaw $1, %A 
 movw (%A), %D 
 leaw $2, %A 
 movw %D, (%A)
 leaw $END, %A 
 jmp 
 nop

 ELSE: 
 
 leaw $0, %A  
 movw (%A), %D 
 leaw $2, %A 
 movw %D, (%A)

 END:
 

; Subtrair um numero pelo outro, se for positivo, o primeiro é o maior, se for negativo o segundo era maior

