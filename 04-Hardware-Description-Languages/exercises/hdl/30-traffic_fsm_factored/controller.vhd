library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity controller is
  port(p, r, ta, tb:  in  STD_LOGIC;
       clk, reset:    in  STD_LOGIC;
       la, lb:        out STD_LOGIC_VECTOR(1 downto 0));
end;

architecture synth of controller is
  component lights
    port(ta, tb, m:  in  STD_LOGIC;
	      clk, reset: in  STD_LOGIC;
			la, lb:     out STD_LOGIC_VECTOR(1 downto 0));
  end component;
  component mode
    port(p, r:       in  STD_LOGIC;
	      clk, reset: in STD_LOGIC;
	      m:          out STD_LOGIC);
  end component;
  signal m: STD_LOGIC;
begin
  mode_fsm: mode port map(p, r, clk, reset, m);
  lights_fsm: lights port map(ta, tb, clk, reset, m);
end;
