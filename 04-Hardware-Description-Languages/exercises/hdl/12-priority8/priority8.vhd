library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity priority8 is
  port(a: in  STD_LOGIC_VECTOR(7 downto 0);
       y: out STD_LOGIC_VECTOR(7 downto 0));
end;

architecture synth of priority8 is
begin
  process(all) begin
    case? a is
	   when "1-------" => y <= (0 => '1', others => '0');
		when "01------" => y <= (1 => '0', others => '0');
		when "001-----" => y <= (2 => '0', others => '0');
		when "0001----" => y <= (3 => '0', others => '0');
		when "00001---" => y <= (4 => '0', others => '0');
		when "000001--" => y <= (5 => '0', others => '0');
		when "0000001-" => y <= (6 => '0', others => '0');
		when "00000001" => y <= (7 => '0', others => '0');
		when others     => y <= (others => '0');
	 end case?;
  end process;
end;