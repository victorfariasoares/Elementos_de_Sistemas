-- Elementos de Sistemas
-- by Luciano Soares
-- Ram4K.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram4K is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(11 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram4K is

	component Ram512 is
		port(
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
			address: in  STD_LOGIC_VECTOR( 8 downto 0);
			output:  out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Mux8Way16 is
		port (
				a:   in  STD_LOGIC_VECTOR(15 downto 0);
				b:   in  STD_LOGIC_VECTOR(15 downto 0);
				c:   in  STD_LOGIC_VECTOR(15 downto 0);
				d:   in  STD_LOGIC_VECTOR(15 downto 0);
				e:   in  STD_LOGIC_VECTOR(15 downto 0);
				f:   in  STD_LOGIC_VECTOR(15 downto 0);
				g:   in  STD_LOGIC_VECTOR(15 downto 0);
				h:   in  STD_LOGIC_VECTOR(15 downto 0);
				sel: in  STD_LOGIC_VECTOR( 2 downto 0);
				q:   out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	component DMux8Way is
		port (
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC;
			q4:  out STD_LOGIC;
			q5:  out STD_LOGIC;
			q6:  out STD_LOGIC;
			q7:  out STD_LOGIC);
	end component;

	signal load0, load1, load2, load3, load4, load5, load6, load7 : STD_LOGIC;
	signal output0, output1, output2, output3, output4, output5, output6, output7 : STD_LOGIC_VECTOR(15 downto 0);

begin

	Load_1: DMux8Way
	port map(
		a => load,
		sel => address(9 downto 7),
		q0 => load0,
		q1 => load1,
		q2 => load2,
		q3 => load3,
		q4 => load4,
		q5 => load5,
		q6 => load6,
		q7 => load7
	);
	R8_1: Ram512
	port map(
		clock => clock,
		input => input,
		load => load,
		address => address(8 downto 0),
		output => output0
	);
	R8_2: Ram512
	port map(
		clock => clock,
		input => input,
		load => load,
		address => address(8 downto 0),
		output => output1
	);
	R8_3: Ram512
	port map(
		clock => clock,
		input => input,
		load => load,
		address => address(8 downto 0),
		output => output2
	);
	R8_4: Ram512
	port map(
		clock => clock,
		input => input,
		load => load,
		address => address(8 downto 0),
		output => output3
	);
	R8_5: Ram512
	port map(
		clock => clock,
		input => input,
		load => load,
		address => address(8 downto 0),
		output => output4
	);
	R8_6: Ram512
	port map(
		clock => clock,
		input => input,
		load => load,
		address => address(8 downto 0),
		output => output5
	);
	R8_7: Ram512
	port map(
		clock => clock,
		input => input,
		load => load,
		address => address(8 downto 0),
		output => output6
	);
	R8_8: Ram512
	port map(
		clock => clock,
		input => input,
		load => load,
		address => address(8 downto 0),
		output => output7
	);
	Output_0: Mux8Way16
	port map(
		a => output0,
		b => output1,
		c => output2,
		d => output3,
		e => output4,
		f => output5,
		g => output6,
		h => output7,
		sel => address(9 downto 7),
		q => output
	);

end architecture;
