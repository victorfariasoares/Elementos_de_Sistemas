; Arquivo: SWeLED.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Faça os LEDs exibirem 
; LED = ON ON ON ON ON !SW3 !SW2 !SW1 0
; Mesma questão da prova

leaw $500, %A ; 0b111110100 no endereço A
movw %A, %D ; Manda o 500 binário pro D
leaw $21184, %A ; Chama o LED no endereço A
movw %D, (%A) ; Liga os LEDS onde é 1
leaw $21185, %A ; Chama os SW pra bagunça
movw (%A), %D ; Os SW agora estão na orientação do binário
notw %D ; Inverte essa bomba
leaw $15, %A ; 15 em binario - 0000001111
andw %A, %D, %D ; faz um and entre o 496 com os SW invertidos, ai fica apenas a bronca do SW invertido;
leaw $0, %A ; carrega 0 em A
movw %D, (%A) ; agora o endereço A vai ter uma estrutura 00000!SW!SW!SWX
leaw $21184, %A ; vem ni mim novos leds
movw (%A), %D ; manda os leds para o D 
leaw $0, %A ; mais um 0 no A
orw (%A), %D, %D ; or entre A e D, registrando no D
decw %D  ; tirando 1 do resultado binario, estava diferente de zero o bit menos significativo
leaw $21184, %A ; carregando nosso heroi finalmente
movw %D, (%A) ; mandando o D para o led, acendendo conforme o que foi pedido 