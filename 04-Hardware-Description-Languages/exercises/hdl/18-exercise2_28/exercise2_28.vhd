library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity exercise2_28 is
  port(v: in  STD_LOGIC_VECTOR(3 downto 0);
       y: out STD_LOGIC);
end;

architecture synth of exercise2_28 is
begin
  process(all) begin
    case v is
	   when "1000" => y <= '1';
		when "1011" => y <= '1';
		when "1100" => y <= '1';
		when "1101" => y <= '1';
		when "1111" => y <= '1';
		when others => y <= '0';
	 end case;
  end process;
end;