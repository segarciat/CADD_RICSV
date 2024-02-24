library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity seven_segment_hex_decoder is
  port(data:     in  STD_LOGIC_VECTOR(3 downto 0);
       segments: out STD_LOGIC_VECTOR(6 downto 0));
end;

architecture synth of seven_segment_hex_decoder is
begin
  process(all) begin
    case data is  --            abcdefg
	   when X"0"   => segments <= "1111110";
		when X"1"   => segments <= "0110000";
		when X"2"   => segments <= "1101101";
		when X"3"   => segments <= "1111001";
		when X"4"   => segments <= "0110011";
		when X"5"   => segments <= "1011011";
		when X"6"   => segments <= "1011111";
		when X"7"   => segments <= "1110000";
		when X"8"   => segments <= "1111111";
		when X"9"   => segments <= "1110011";
		when X"A"   => segments <= "1110111";
		when X"b"   => segments <= "0011111";
		when X"C"   => segments <= "1001110";
		when X"d"   => segments <= "0111101";
		when X"E"   => segments <= "1001111";
		when X"F"   => segments <= "1000111";
		when others => segments <= "0000000";
	 end case;
  end process;
end;
