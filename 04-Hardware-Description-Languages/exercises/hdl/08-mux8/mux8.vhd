library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux8 is
  generic (N: integer := 2);
  port(d0, d1, d2, d3, d4, d5, d6, d7: in STD_LOGIC_VECTOR(N-1 downto 0);
       s: in  STD_LOGIC_VECTOR(2 downto 0);
		 y: out STD_LOGIC_VECTOR(N-1 downto 0));
end;

architecture synth of mux8 is
begin
  process(all) begin
    case s is
	   when "000"  => y <= d0;
		when "001"  => y <= d1;
		when "010"  => y <= d2;
		when "011"  => y <= d3;
		when "100"  => y <= d4;
		when "101"  => y <= d5;
		when "110"  => y <= d6;
		when "111"  => y <= d7;
		when others => y <= (others => '0');
	 end case;
  end process;
end;