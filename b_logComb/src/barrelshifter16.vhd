library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all; -- Necessário para operações de deslocamento

entity barrelshifter16 is
    Port (
        a : in STD_LOGIC_VECTOR(15 downto 0); 
        size : in std_logic_vector(3 downto 0);  -- Correção para uma entrada de 4 bits
        dir : in std_logic; -- 0 => left, 1 => right
        q : out STD_LOGIC_VECTOR(15 downto 0)  -- output vector (shifted)
    );
end entity;

architecture rtl of barrelshifter16 is
begin
    process(a, size, dir)
    begin
        if dir = '0' then
            -- Deslocamento à esquerda
            q <= std_logic_vector(shift_left(unsigned(a), to_integer(unsigned(size))));
        else
            -- Deslocamento à direita
            q <= std_logic_vector(shift_right(unsigned(a), to_integer(unsigned(size))));
        end if;
    end process;
end architecture;