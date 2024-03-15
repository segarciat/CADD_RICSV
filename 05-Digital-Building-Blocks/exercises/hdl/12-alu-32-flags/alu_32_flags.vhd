library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity alu_32_flags is
  port(a, b:        in  STD_LOGIC_VECTOR(31 downto 0);
       control:     in  STD_LOGIC_VECTOR(1 downto 0);
		 result:      out STD_LOGIC_VECTOR(31 downto 0);
		 N, Z, C, V:  out  STD_LOGIC);
end;

architecture synth of alu_32_flags is
  signal preresult: STD_LOGIC_VECTOR(31 downto 0);
  signal sum: STD_LOGIC_VECTOR(32 downto 0); -- extra bit for the carry

  signal a_opp_sum, can_overflow: STD_LOGIC;
begin
  process(all) begin
	 if control(0) = '0' then
	   sum <= '0' & STD_LOGIC_VECTOR(signed(a) + signed(b));
	 else
	   sum <= '0' & STD_LOGIC_VECTOR(signed(a) - signed(b));
	 end if;
	 	 
    case control is
	   when "00" => preresult <= sum(31 downto 0);
		when "01" => preresult <= sum(31 downto 0);
		when "10" => preresult <= a and b;
		when "11" => preresult <= a or b;
		when others => preresult <= (others => '0');
	 end case;
	 
	 C <= (not control(1)) and sum(32); -- carry bit.
	 N <= preresult(31);
	 gen: for i in 0 to 31 loop
	   Z <= Z and not preresult(i);
	 end loop;
	 
	 a_opp_sum <= sum(31) xor a(31);
    can_overflow <= not (control(0) xor a(31) xor b(31));
  
    V <= a_opp_sum and can_overflow and (not control(1));
	 result <= preresult;
  end process;
end;