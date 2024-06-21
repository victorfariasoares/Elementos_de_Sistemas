
```
export SIM=ghdl
pip3 install -r requirements.txt
cd b_logComb
SIM=ghdl pytest -s
```

Agora vai abrir uma pagina para voce autenticar via github e vai gerar um 
token que voce deve colar no terminal

## Rodando apenas um teste

Para executar apenas um teste voce pode passar o nome deles usando `-k` 

```
SIM=ghdl pytest -k and16
```

Apenas o `and16` sera testado.

## Dica

Digite no terminal uma unica vez para habilitar o uso do simulador ghdl

```bash
echo 'export SIM=ghdl' >> $HOME/elementos.sh
```
