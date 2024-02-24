library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder6_64 is
  port(d: in  STD_LOGIC_VECTOR(5 downto 0);
       y: out STD_LOGIC_VECTOR(63 downto 0));
end;

architecture synth of decoder6_64 is
  component decoder2_4
    port(a: in  STD_LOGIC_VECTOR(1 downto 0);
	      y: out STD_LOGIC_VECTOR(3 downto 0));
  end component;
  signal a: STD_LOGIC_VECTOR(3 downto 0);
  signal b: STD_LOGIC_VECTOR(3 downto 0);
  signal c: STD_LOGIC_VECTOR(3 downto 0);
begin
  dec2_4a: decoder2_4 port map(d(5 downto 4), a);
  dec2_4b: decoder2_4 port map(d(3 downto 2), b);
  dec2_4c: decoder2_4 port map(d(1 downto 0), c);
  gen: for i in 0 to 3 generate
    gen: for j in 0 to 3 generate
	   gen: for k in 0 to 3 generate
		  y((16 * i) + (4 * j) + k) <= a(i) and b(j) and c(k);
		end generate;
	 end generate;
  end generate;
end;