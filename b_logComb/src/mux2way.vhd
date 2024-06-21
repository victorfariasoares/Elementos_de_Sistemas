library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2way is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC);
end entity;

architecture arch of mux2way is
begin
	with sel select
		q <= a when '0',
		b when others;
end architecture;
