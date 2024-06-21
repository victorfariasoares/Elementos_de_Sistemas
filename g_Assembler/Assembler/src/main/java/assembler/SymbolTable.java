/**
 * Curso: Elementos de Sistemas
 * Arquivo: SymbolTable.java
 */

package assembler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Mantém uma tabela com a correspondência entre os rótulos simbólicos e endereços numéricos de memória.
 */
public class SymbolTable {

    private HashMap<String, Integer> symbolTable;

    /**
     * Cria a tabela de símbolos.
     */
    public SymbolTable() {
        symbolTable = new HashMap<String, Integer>();
        initialize();
    }

    /**
     * Insere uma entrada de um símbolo com seu endereço numérico na tabela de símbolos.
     * @param  symbol símbolo a ser armazenado na tabela de símbolos.
     * @param  address símbolo a ser armazenado na tabela de símbolos.
     */
    public void addEntry(String symbol, int address) {
        /* TODO: implementar */
        symbolTable.put(symbol, address);
    }

    /**
     * Confere se o símbolo informado já foi inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return Verdadeiro se símbolo está na tabela de símbolos, Falso se não está na tabela de símbolos.
     */
    public Boolean contains(String symbol) {
        /* TODO: implementar */
        for (String symb : symbolTable.keySet()) {
            if (symb.equals(symbol)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Retorna o valor númerico associado a um símbolo já inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return valor numérico associado ao símbolo procurado.
     */
    public Integer getAddress(String symbol) {
        /* TODO: implementar */
    	return symbolTable.get(symbol);
    }

    /**
     *  Inicializa a tabela de simbolos com os simbolos pre definidos
     *  exemplo: R0, R1, ...
     *  SP, LCL, ARG, THIS, THAT
     *  SCREEN, KBD, ..
     */
    //
    public void initialize() {
        // Exemplo: Registradores Virtuais
        this.addEntry("R0", 0);
        for (int i = 1; i <= 15; i++) {
            String comeco = "R";
            this.addEntry(comeco + (i), i);
        }
        /* TODO: implementar */
        
        this.addEntry("X", 16);
        this.addEntry("SCREEN", 16384);
        this.addEntry("SP", 0);
        this.addEntry("LCL", 1);
        this.addEntry("ARG", 2);
        this.addEntry("THIS", 3);
        this.addEntry("THAT", 4);

    }
}
