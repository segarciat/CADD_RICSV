library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sr_latch is
  port(s, r: in  STD_LOGIC;
		 q, notq:    out STD_LOGIC);
end;

architecture synth of sr_latch is
  signal qn, notqn: STD_LOGIC;
begin
  -- output
  q <= qn;
  notq <= notqn;
  -- inner nodes
  process(all) begin
    if    (s = '0' and r = '1') then qn <= '0'; notqn <= '1';
	 elsif (s = '1' and r = '0') then qn <= '1'; notqn <= '0';
	 elsif (s = '1' and r = '1') then qn <= '0'; notqn <= '0';
	 end if;
  end process;
end;