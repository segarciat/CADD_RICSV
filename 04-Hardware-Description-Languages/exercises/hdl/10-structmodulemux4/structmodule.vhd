library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity structmodule is
  port(a, b, c: in  STD_LOGIC;
       y:       out STD_LOGIC);
end;

architecture synth of structmodule is
  component mux4
    generic(N: integer := 2);
	 port (d0, d1, d2, d3: in  STD_LOGIC_VECTOR(N-1 downto 0);
	       s:              in  STD_LOGIC_VECTOR(1 downto 0);
			 y:              out STD_LOGIC_VECTOR(N-1 downto 0));
	end component;
	signal mux_out: STD_LOGIC_VECTOR(0 downto 0);
begin
  mux4_1: mux4 generic map(1)
               port map((0 => not C), (0 => C), "1", "0", (a, b), mux_out);
  y <= mux_out(0);
end;
