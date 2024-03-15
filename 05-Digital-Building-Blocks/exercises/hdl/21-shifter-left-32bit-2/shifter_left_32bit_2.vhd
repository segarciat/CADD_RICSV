library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity shifter_left_32bit_2 is
  port(a: in  STD_LOGIC_VECTOR(31 downto 0);
       y: out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture synth of shifter_left_32bit_2 is
begin
  y <= a(29 downto 0) & "00";
end;