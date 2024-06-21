library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity impressora is
	port (
    SW1,SW2,SW3,SW4 : in  STD_LOGIC;
    x : out STD_LOGIC );
end entity;

architecture arch of impressora is
    signal and1, and2, and3, and4, and5: STD_LOGIC;
begin
    and1 <= (not SW4) and (not SW3);
    and2 <= (not SW4) and (not SW2);
    and3 <= (not SW3) and (not SW2);
    and4 <= (not SW2) and (not SW4);
    and5 <= (not SW3) and (not SW1);

    x <= '1' when (and1 or and2 or and3 or and4 or and5) = '1' else
        '0';
        
end architecture;