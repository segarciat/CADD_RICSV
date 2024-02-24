library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity minority is
  port(a, b, c: in  STD_LOGIC;
       y:       out STD_LOGIC);
end;

architecture synth of minority is
begin
  y <= (not a and not b and not c) or
       (not a and not b and c) or
		 (not a and b and not c) or
		 (a and not b and not c);
end;