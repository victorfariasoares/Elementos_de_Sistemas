--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
    port(
        SW      : in  std_logic_vector(9 downto 0);
        HEX0    : out std_logic_vector(6 downto 0); -- 7seg0
        LEDR    : out std_logic_vector(9 downto 0)
    );
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is

component  ALU is
	port (
			x,y:   in STD_LOGIC_VECTOR(15 downto 0); -- entradas de dados da ALU
			zx:    in STD_LOGIC;                     -- zera a entrada x
			nx:    in STD_LOGIC;                     -- inverte a entrada x
			zy:    in STD_LOGIC;                     -- zera a entrada y
			ny:    in STD_LOGIC;                     -- inverte a entrada y
			f:     in STD_LOGIC_VECTOR(1 downto 0);                     -- se 0 calcula x & y, senão x + y
			no:    in STD_LOGIC;                     -- inverte o valor da saída
			zr:    out STD_LOGIC;                    -- setado se saída igual a zero
			ng:    out STD_LOGIC;                    -- setado se saída é negativa
			saida: out STD_LOGIC_VECTOR(15 downto 0); -- saída de dados da ALU
			estour: out STD_LOGIC
	);
end component;
--------------
-- signals
--------------

---------------
-- implementacao
---------------
begin
	LEDR(0) <= (NOT((SW(0) AND SW(1)) OR SW(1)) OR (NOT((SW(0) AND SW(1)) AND SW(2))));
	--LEDR(1) <= ((NOT SW(0)) AND SW(1) AND (NOT SW(2)) AND SW(3) AND (NOT SW(4)) AND SW(5) AND SW(6) AND (NOT SW(7)) AND (NOT SW(8)) AND SW(9));
	--LEDR(2) <= ((NOT SW(0)) AND SW(1) AND (NOT SW(2)) AND SW(3) AND (NOT SW(4)) AND SW(5) AND SW(6) AND (NOT SW(7)) AND (NOT SW(8)) AND SW(9));
	--LEDR(3) <= ((NOT SW(0)) AND SW(1) AND (NOT SW(2)) AND SW(3) AND (NOT SW(4)) AND SW(5) AND SW(6) AND (NOT SW(7)) AND (NOT SW(8)) AND SW(9));
	--LEDR(4) <= ((NOT SW(0)) AND SW(1) AND (NOT SW(2)) AND SW(3) AND (NOT SW(4)) AND SW(5) AND SW(6) AND (NOT SW(7)) AND (NOT SW(8)) AND SW(9));
	--LEDR(5) <= ((NOT SW(0)) AND SW(1) AND (NOT SW(2)) AND SW(3) AND (NOT SW(4)) AND SW(5) AND SW(6) AND (NOT SW(7)) AND (NOT SW(8)) AND SW(9));
	--LEDR(6) <= ((NOT SW(0)) AND SW(1) AND (NOT SW(2)) AND SW(3) AND (NOT SW(4)) AND SW(5) AND SW(6) AND (NOT SW(7)) AND (NOT SW(8)) AND SW(9));
	--LEDR(7) <= ((NOT SW(0)) AND SW(1) AND (NOT SW(2)) AND SW(3) AND (NOT SW(4)) AND SW(5) AND SW(6) AND (NOT SW(7)) AND (NOT SW(8)) AND SW(9));
	--LEDR(8) <= ((NOT SW(0)) AND SW(1) AND (NOT SW(2)) AND SW(3) AND (NOT SW(4)) AND SW(5) AND SW(6) AND (NOT SW(7)) AND (NOT SW(8)) AND SW(9));
	--LEDR(9) <= ((NOT SW(0)) AND SW(1) AND (NOT SW(2)) AND SW(3) AND (NOT SW(4)) AND SW(5) AND SW(6) AND (NOT SW(7)) AND (NOT SW(8)) AND SW(9));

LEDR(0) <= SW(0);


	ula : ALU port map(
	 x => x"8000",
	 y => x"8000",
	 zx => SW(0),
	 nx => SW(1),
	 zy => SW(2),
	 ny => SW(3),
	 f =>  SW(5 downto 4),
  	 no => SW(6),
	 zr => LEDR(0),
	 ng => LEDR(1),
	 saida(9 downto 8) => LEDR(8 downto 7),
	 estour => LEDR(9)
	
	);

end rtl;
