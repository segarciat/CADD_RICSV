library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity alu_32_slt is
  port(   a, b: in  STD_LOGIC_VECTOR(31 downto 0);
       control: in  STD_LOGIC_VECTOR(2 downto 0);
		 result:  out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture synth of alu_32_slt is
begin
  process(all) begin
    case control is
	   when "000" => result <= STD_LOGIC_VECTOR(signed(a) + signed(b));
		when "001" => result <= STD_LOGIC_VECTOR(signed(a) - signed(b));
		when "010" => result <= a and b;
		when "011" => result <= a or b;
		when "101" => if a < b then result <= (0 => '1', others => '0');
		              else          result <= (others => '0');
						  end if;
		when others => result <= (others => '0');
	 end case;
  end process;
end;