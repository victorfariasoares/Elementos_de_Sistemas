-- Elementos de Sistemas
-- FlipFlopJK.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopJK is
	port(
		clock:  in std_logic;
		J:      in std_logic;
		K:      in std_logic;
		q:      out std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopJK is
	signal q_internal : std_logic:= '0';
	signal q_internal0 : std_logic:= '0';

begin
	process(clock, J, K)
	begin
		if(rising_edge(clock)) then
			if(K = '1') then
				if(J = '0') then
					q_internal <= '0';

				elsif(J = '1') then
					q_internal <= not(q_internal0);
					q_internal0 <= not(q_internal);
				end if;

			elsif(K = '0') then
				if(J = '1') then
					q_internal <= '1';
					q_internal0 <= '1';

				end if;
			end if;
		end if;

	end process;
			
	q <= q_internal;
	notq <= not(q_internal);

end architecture;
