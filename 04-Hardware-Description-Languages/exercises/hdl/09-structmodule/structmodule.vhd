library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity structmodule is
  port (a, b, c: in  STD_LOGIC;
        y:       out STD_LOGIC);
end;

architecture struct of structmodule is
  component mux8
    generic(N: integer := 2);
    port(d0, d1, d2, d3, d4, d5, d6, d7: in STD_LOGIC_VECTOR(N-1 downto 0);
	      s: in  STD_LOGIC_VECTOR(2 downto 0);
			y: out STD_LOGIC_VECTOR(N-1 downto 0));
  end component;
  signal mux_out: STD_LOGIC_VECTOR(0 downto 0);
begin
  mux8_1:  mux8 generic map(1)
               port map("1", "0", "0", "1", "1", "1", "0", "0", (a, b, c), mux_out);
  y <= mux_out(0);
end;