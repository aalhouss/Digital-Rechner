LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity std10_12_tb  is


end entity std10_12_tb;

    architecture dut of std10_12_tb is
        signal reset : std_logic;
        signal clk  : std_logic;      
        signal a,b,c   : std_logic;
        signal ov : std_logic_vector(1 downto 0);
      

BEGIN

DUT1 : ENTITY work.std10_12
PORT MAP(
    reset => reset,
    clk => clk,
    a => a,
    b => b,
    c => c,
    ov => ov
    );

WaveGen_Proc : PROCESS
BEGIN
          
a <= '0' ; b <= '0' ; c <= '0';
reset <= '0';
wait for 4 ns;
reset <= '1'; wait for 3 ns;
reset <= '0';
wait for 30 ns;
a <= '1' ; b <='1' ; wait for 30 ns;
a <= '1' ; b <= '0' ; wait for 30 ns;
reset <= '1'; wait for 8 ns;
reset <= '0';
a <= '0' ; b <= '1' ; c <= '0'; wait for 30 ns;
b <= '0' ; c <= '0' ; wait for 30 ns;


END PROCESS WaveGen_Proc;

WaveGen_Proc1 : PROCESS
BEGIN
   clk <= '0';
    WAIT FOR 10 ns;
    clk <= '1';
    WAIT FOR 10 ns;
END PROCESS WaveGen_Proc1;

END ARCHITECTURE dut;