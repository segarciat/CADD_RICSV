library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity exercise2_35 is
  port(a:    in  STD_LOGIC_VECTOR(3 downto 0);
       p, d: out  STD_LOGIC);
end;

architecture synth of exercise2_35 is
begin
  process(all) begin
    case a is
	   when 4D"0"  => p <= '0'; d <= '1';
		when 4D"1"  => p <= '0'; d <= '0';
		when 4D"2"  => p <= '1'; d <= '0';
		when 4D"3"  => p <= '1'; d <= '1';
		when 4D"4"  => p <= '0'; d <= '0';
		when 4D"5"  => p <= '1'; d <= '0';
		when 4D"6"  => p <= '0'; d <= '1';
		when 4D"7"  => p <= '1'; d <= '0';
		when 4D"8"  => p <= '0'; d <= '0';
		when 4D"9"  => p <= '0'; d <= '1';
		when 4D"10" => p <= '0'; d <= '0';
		when 4D"11" => p <= '1'; d <= '0';
		when 4D"12" => p <= '0'; d <= '1';
		when 4D"13" => p <= '1'; d <= '0';
		when 4D"14" => p <= '0'; d <= '0';
		when 4D"15" => p <= '0'; d <= '1';
	 end case;
  end process;
end;
