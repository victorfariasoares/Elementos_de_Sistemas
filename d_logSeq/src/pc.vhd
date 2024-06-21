-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0) 
    );
end entity;

architecture arch of PC is

  signal muxOut0, muxOut1, muxOut2 : std_logic_vector(15 downto 0);
  signal muxin0 : std_logic_vector(15 downto 0);
  signal outputReg : std_logic_vector(15 downto 0);
  signal load_reg: std_logic;
  signal sel_mux: std_logic;

  component Inc16 is
      port(
          a   :  in STD_LOGIC_VECTOR(15 downto 0);
          q   : out STD_LOGIC_VECTOR(15 downto 0)
          );
  end component;

  component Register16 is
      port(
          clock:   in STD_LOGIC;
          input:   in STD_LOGIC_VECTOR(15 downto 0);
          load:    in STD_LOGIC;
          output: out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component Mux16 is
		port (
			a:   in STD_LOGIC_VECTOR(15 downto 0);
			b:   in STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC_VECTOR(15 downto 0)
            );
	end component;


begin
    I16: Inc16 port map (
        a => outputReg,
        q => muxin0
    );

    M16_0: Mux16 port map (
        a => outputReg,
        b => muxin0,
        sel => increment,
        q => muxOut0

    );

    M16_1: Mux16 port map (
        a => muxOut0,
        b => input,
        sel => load,
        q => muxOut1
    );

    M16_2: Mux16 port map (
        a => muxOut1,
        b => "0000000000000000",
        sel => reset,
        q => muxOut2
    );

    R16: Register16 port map (
        clock => clock,
        input => muxOut2,
        load => '1',
        output => outputReg
    );

    output <= outputReg;
end architecture;
