library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity exercise2_26 is
  port(a, b, c, d, e: in  STD_LOGIC;
       y            : out STD_LOGIC);
end;

architecture synth of exercise2_26 is
begin
  y <= not (
         not (
			  (not (a and b))
			   and (not (c and d)))
         and e
		 );
end;