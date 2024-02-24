-- 4.39: testbench example 3, adapted for Exercise 4-4

library IEEE; use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_TEXTIO.ALL; use STD.TEXTIO.all;

entity tb_seven_segment_hex_decoder is -- no inputs or outputs
end;

architecture sim of tb_seven_segment_hex_decoder is
  component seven_segment_hex_decoder
    port(data:     in  STD_LOGIC_VECTOR(3 downto 0);
       segments:  out STD_LOGIC_VECTOR(6 downto 0));
  end component;
  signal data: STD_LOGIC_VECTOR(3 downto 0);
  signal segments: STD_LOGIC_VECTOR(6 downto 0);
  signal y_expected: STD_LOGIC_VECTOR(6 downto 0);
  signal match: STD_LOGIC;
  signal clk, reset: STD_LOGIC;
begin
  -- instantiate device under test
  dut: seven_segment_hex_decoder port map(data, segments);

  -- generate clock
  process begin
    clk <= '1'; wait for 5 ns;
    clk <= '0'; wait for 5 ns;
  end process;

  -- at start of test, pulse reset
  process begin
    reset <= '1'; wait for 22 ns; reset <= '0';
    wait;
  end process;

  -- run tests
  process is
    file tv: text;
    variable L: line;
    variable vector_in: std_logic_vector(3 downto 0);
    variable dummy: character;
    variable vector_out: std_logic_vector(6 downto 0);
    variable vectornum: integer := 0;
    variable errors: integer := 0;
  begin
    FILE_OPEN(tv, "../../testvectors.txt", READ_MODE);
    while not endfile(tv) loop

      -- change vectors on rising edge
      wait until rising_edge(clk);

      -- read the next line of testvectors and split into pieces
      readline(tv, L);
      read(L, vector_in);
      read(L, dummy); -- skip over underscore
      read(L, vector_out);
      data <= vector_in(3 downto 0) after 1 ns;
      y_expected <= vector_out(6 downto 0) after 1 ns; 

      -- check results on falling edge
      wait until falling_edge(clk);
      if (segments /= vector_out) then
        report "Error: data = ";
		  for i in 0 to data'length - 1 loop
		    report std_logic'image(segments(i));
		  end loop;
	     errors := errors + 1;
	   end if;

      vectornum := vectornum + 1;
    end loop;

    -- summarize results at end of simulation
    if (errors = 0) then
      report "NO ERRORS -- " &
	       integer'image(vectornum) &
	       " tests completed successfully."
		 severity failure;
    else
      report integer'image(vectornum) & 
	       " tests completed, errors = " &
	       integer'image(errors)
	       severity failure;
    end if;
  end process;
end;

  

