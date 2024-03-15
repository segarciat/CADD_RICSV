library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity alu_32 is
  port(a, b:    in  STD_LOGIC_VECTOR(31 downto 0);
       control: in  STD_LOGIC_VECTOR(1 downto 0);
		 result:  out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture synth of alu_32 is
begin
  process(all) begin
    case control is
	   when "11" => result <= (a or b);
		when "10" => result <= (a and b);
		when "01" => result <= STD_LOGIC_VECTOR(signed(a) - signed(b));
		when "00" => result <= STD_LOGIC_VECTOR(signed(a) + signed(b));
		when others => result <= (others => '0');
	 end case;
  end process;
end;