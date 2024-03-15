library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity alu_32_slt_overflow is
  port(   a, b: in  STD_LOGIC_VECTOR(31 downto 0);
       control: in  STD_LOGIC_VECTOR(2 downto 0);
		 result:  out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture synth of alu_32_slt_overflow is
  signal tempsum: STD_LOGIC_VECTOR(31 downto 0);
  signal can_overflow, a_opp_sum, V: STD_LOGIC;
begin
  process(all) begin
    case control is
	   when "000" => result <= STD_LOGIC_VECTOR(signed(a) + signed(b));
		when "001" => result <= STD_LOGIC_VECTOR(signed(a) - signed(b));
		when "010" => result <= a and b;
		when "011" => result <= a or b;
		when "101" => tempsum <= STD_LOGIC_VECTOR(signed(a) - signed(b));
		              can_overflow <= not (control(0) xor a(31) xor b(31));
		              a_opp_sum <= a(31) xor tempsum(31);
						  V <= can_overflow and a_opp_sum and not control(1);
						  result <= (0 => V and tempsum(31), others => '0');
		when others => result <= (others => '0');
		              
	 end case;
  end process;
end;