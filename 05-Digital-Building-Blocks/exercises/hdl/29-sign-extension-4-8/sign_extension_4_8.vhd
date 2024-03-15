library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sign_extension_4_8 is
  port(a: in  STD_LOGIC_VECTOR(3 downto 0);
       y: out STD_LOGIC_VECTOR(7 downto 0));
end;

architecture synth of sign_extension_4_8 is
begin
  y(3 downto 0) <= a;
  y(7 downto 4) <= (others => a(3));
end;