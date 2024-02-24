library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity exercise31 is
  port(a, b, c, d: in  STD_LOGIC;
       clk:        in  STD_LOGIC;
		 x, y:       out STD_LOGIC);
end;

architecture synth of exercise31 is
  signal aa, bb, cc, dd, n2: STD_LOGIC;
begin
  process(clk) begin
    if rising_edge(clk) then
	   aa <= a;
		bb <= b;
		cc <= c;
		dd <= d;
		x <= n2;
		y <= not (n2 or dd);
	 end if;
  end process;
  n2 <= (aa and bb) or cc;
end;