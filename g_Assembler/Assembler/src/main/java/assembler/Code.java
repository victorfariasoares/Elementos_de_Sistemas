/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

 package assembler;

 /**
  * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
  */
 public class Code {
 
     /**
      * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
      * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
      * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
      **/
     public static String dest(String[] mnemnonic) {
         switch (mnemnonic[mnemnonic.length -1]) {
             case "%A":
                 return "0001";
 
             case "%D":
                 return "0010";
 
             case "(%A)":
                 if(mnemnonic.length == 4){
                     return "0110";
                 }
                 else {
                     return "0100";
                 }
             default:
                 return "0000";
 
         }
 
     }
 
     /**
      * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
      * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
      * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
      */
     public static String comp(String[] mnemnonic) {
        switch (mnemnonic[0]) {
            case "movw":
                if (mnemnonic[1].equals("%A")) { /** serve tanto para (%A) */
                    return "000110000";
                } else if (mnemnonic[1].equals("%D")) { /** serve tanto para (%A), quanto %A */
                    return "000001100";
                } else if (mnemnonic[1].equals("(%A)")) { /** serve tanto para (%A), quanto %A */
                    return "001110000";
                }
                else if (mnemnonic[1].equals("$1")) { /**"$1", "(%A)", "%D" */
                    return "000111111";
                }
                else if (mnemnonic[1].equals("$0")) { /**"$1", "(%A)", "%D" */
                return "000101010";
                }
                
                break;
        
            case "addw":
                if (mnemnonic[1].equals("%A")) { /** "addw", "%A", "%D", "%D" */
                    return "000000010";
                } else if (mnemnonic[1].equals("(%A)")) { /** addw", "(%A)", "%D", "%D */
                    return "001000010";
                } else if (mnemnonic[1].equals("$1")) { /**"$1", "(%A)", "%D" */
                    return "001110111";
                }
                break;
        
            case "incw":
                if (mnemnonic[1].equals("%A")) { /* "incw", "%A" */
                    return "000110111";
                } else if (mnemnonic[1].equals("%D")) { /** addw", "(%A)", "%D", "%D */
                    return "000011111";
                } else if (mnemnonic[1].equals("(%A)")) { /** addw", "(%A)", "%D", "%D */
                    return "001110111";
                }
                break;
        
            case "subw":
                if (mnemnonic[1].equals("%D")) { /* subw", "%D", "(%A)", "%A" */
                    return "001010011";
                } else if (mnemnonic[1].equals("(%A)")) { /** addw", "(%A)", "%D", "%D */
                    return "001110010";
                }
                break;
        
            case "rsubw":
                if (mnemnonic[1].equals("%D")) { /* subw", "%D", "(%A)", "%A" */
                    return "001000111";
                }
                break;
        
            case "decw":
                if (mnemnonic[1].equals("%A")) { /*"decw", "%A"*/
                    return "000110010";
                } else if (mnemnonic[1].equals("%D")) { /* "decw", "%A"*/
                    return "000001110";
                }
                break;
        
            case "notw":
                if (mnemnonic[1].equals("%A")) { /*"notw", "%A"*/
                    return "000110001";
                } else if (mnemnonic[1].equals("%D")) { /* "notw", "%A"*/
                    return "000001101";
                }
                break;
        
            case "negw":
                if (mnemnonic[1].equals("%A")) { /*"negw", "%A"*/
                    return "000110011";
                } else if (mnemnonic[1].equals("%D")) { /* "negw", "%A"*/
                    return "000001111";
                }
                break;
        
            case "andw":
                if (mnemnonic[1].equals("(%A)")) { /*andw", "(%A)", "%D", "%D"*/
                    return "001000000";
                } else if (mnemnonic[1].equals("%D")) { /* "andw", "%D", "%A", "%A" */
                    return "000000000";
                }
                else{
                    return "000000000";
                }
        
            case "orw":
                if (mnemnonic[1].equals("(%A)")) { /*"orw", "(%A)", "%D", "%D"*/
                    return "001010101";
                } else if (mnemnonic[1].equals("%D")) { /* "orw", "%D", "%A", "%A"*/
                    return "000010101";
                }
                break;
        

            default:
                return "000001100";
        }
        
         return "";
     }
 
     /**
      * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
      * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
      * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
      */
     public static String jump(String[] mnemnonic) {switch (mnemnonic[0]) {
         case "jmp":
             return "111";
         case "jg":
             return "001";
         case "je":
             return "010";
         case "jge":
             return "011";
         case "jl":
             return "100";
         case "jle":
             return "110";
         case "jne":  return "101";
         default:
         return "000";}
     }
 
     /**
      * Retorna o código binário de um valor decimal armazenado numa String.
      * @param  symbol valor numérico decimal armazenado em uma String.
      * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
      */
     public static String toBinary(String symbol) {
         // Converter a String para um inteiro
         int number = Integer.parseInt(symbol);
 
         // Converter o inteiro para binário
         String binaryString = Integer.toBinaryString(number);
 
         // Preencher com zeros à esquerda para garantir que o resultado tenha 15 bits
         while (binaryString.length() <=15) {
             binaryString = "0" + binaryString;
         }
 
         return binaryString;
     }
 
 
 }