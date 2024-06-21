-- Elementos de Sistemas
-- by Luciano Soares
-- Register8.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register8 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(7 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(7 downto 0)
	);
end entity;

architecture arch of Register8 is

	component BinaryDigit is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC;
			load:    in STD_LOGIC;
			output: out STD_LOGIC
		);
	end component;

begin
	
	A1 : Binarydigit port map (
		clock => clock,
		input => input(0),
		load => load,
		output => output(0)
	);

	A2 : Binarydigit port map (
		clock => clock,
		input => input(1),
		load => load,
		output => output(1)
	);

	A3 : Binarydigit port map (
		clock => clock,
		input => input(2),
		load => load,
		output => output(2)
	);

	A4 : Binarydigit port map (
		clock => clock,
		input => input(3),
		load => load,
		output => output(3)
	);

	A5 : Binarydigit port map (
		clock => clock,
		input => input(4),
		load => load,
		output => output(4)
	);

	A6 : Binarydigit port map (
		clock => clock,
		input => input(5),
		load => load,
		output => output(5)
	);

	A7 : Binarydigit port map (
		clock => clock,
		input => input(6),
		load => load,
		output => output(6)
	);

	A8 : Binarydigit port map (
		clock => clock,
		input => input(7),
		load => load,
		output => output(7)
	);



end architecture;
