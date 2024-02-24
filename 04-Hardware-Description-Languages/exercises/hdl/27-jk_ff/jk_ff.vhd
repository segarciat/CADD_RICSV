library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity jk_ff is
  port(j, k:  in  STD_LOGIC;
       clk:   in  STD_LOGIC;
		 q:     out STD_LOGIC);
end;

architecture synth of jk_ff is
begin
  process(clk) begin
    if rising_edge(clk) then
	   if    j = '1' and k = '1' then q <= not q;
		elsif j = '1' and k = '0' then q <= '1';
		elsif j = '0' and k = '1' then q <= '0';
		end if;
	 end if;
  end process;
end;