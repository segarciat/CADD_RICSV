library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity traffic_light is
  port(ta, tb:     in  STD_LOGIC;
       clk, reset: in  STD_LOGIC;
       la, lb:     out STD_LOGIC_VECTOR(1 downto 0));
end;

architecture synth of traffic_light is
  type statetype is (S0, S1, S2, S3);
  signal state, nextstate: statetype;
begin
  process(clk, reset) begin
    if reset then state <= S0;
    elsif rising_edge(clk) then
	    state <= nextstate;
	 end if;
  end process;
  
  -- green: 00, yellow: 01, red: 10
  process(all) begin
    case state is
	   when S0 => if ta then nextstate <= S0;
		           else       nextstate <= S1;
					  end if;
		when S1 => nextstate <= S2;
		when S2 => if tb then nextstate <= S2;
		           else       nextstate <= S3;
					  end if;
		when S3 => nextstate <= S0;
		when others => nextstate <= S0;
	 end case;
  end process;
  
  process(all) begin
    case state is
		 when S0 => la <= "00"; lb <= "10";
		 when S1 => la <= "01"; lb <= "00";
		 when S2 => la <= "10"; lb <= "00";
		 when S3 => la <= "10"; lb <= "01";
	 end case;
  end process;
end;