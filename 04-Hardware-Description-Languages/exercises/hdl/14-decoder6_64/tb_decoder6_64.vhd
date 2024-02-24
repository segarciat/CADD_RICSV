library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity tb_decoder6_64 is -- no inputs
end;

architecture sim of tb_decoder6_64 is
  component decoder6_64
    port(d: in  STD_LOGIC_VECTOR(5 downto 0);
         y: out STD_LOGIC_VECTOR(63 downto 0));
	end component;
	signal d: STD_LOGIC_VECTOR(5 downto 0);
	signal y, y_expected: STD_LOGIC_VECTOR(63 downto 0);
begin
  dut: decoder6_64 port map(d, y);
  process begin
    for i in 0 to 63 loop
	   y_expected <= (i => '1', others => '0');
	   d <= STD_LOGIC_VECTOR(to_unsigned(i, d'length)); wait for 5 ns;
		if y /= y_expected then
		  report "Assertion error";
		end if;
	 end loop;
	wait; -- wait forever; 
  end process;
end;