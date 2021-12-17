library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cntTB is
    -- LEER
end entity cntTB;

architecture dut of cntTB is
    -- component ports
    signal CLRN                 : std_logic;
    signal CLK                  : std_logic;
    signal UP                   : std_logic;
    signal HOLD                 : std_logic;
    signal zustandsvektor_Norm  : std_logic_vector(2 downto 0);
    signal count_hier           : std_logic_vector(2 downto 0);

begin
    
    DUT1: entity work.cntProc
        port map (
            CLRN            => CLRN,
            CLK             => CLK,
            UP              => UP,
            HOLD            => HOLD,
            zustandsvektor  => zustandsvektor_Norm
        );
    
    DUT2: entity work.cntHierarch
        port map (
            CLRN            => CLRN,
            CLK             => CLK,
            UP              => UP,
            HOLD            => HOLD,
            count           => count_hier
        );
    
    -- CLOCK
    WaveGen_Clock: process
    begin
        CLK <= '1'; wait for 10 ns;
        CLK <= '0'; wait for 10 ns; 
    end process WaveGen_Clock;


    -- Tests
    WaveGen_Proc: process
    begin
        -- Zurücksetzen
        CLRN <= '0'; wait for 10 ns;
        CLRN <= '1';


        -- Durchlauf - UP=1 - HOLD=0
        HOLD <= '0';
        UP <= '1';
        wait for 230 ns;
        CLRN <= '0'; wait for 30 ns;
        CLRN <= '1';


        -- Durchlauf - UP=1 - HOLD=1
        HOLD <= '1';
        UP <= '1'; 
        wait for 230 ns;
        CLRN <= '0'; wait for 30 ns;
        CLRN <= '1';


        -- Durchlauf - UP=0 - HOLD=0
        HOLD <= '0';
        UP <= '0'; 
        wait for 230 ns;
        CLRN <= '0'; wait for 30 ns;
        CLRN <= '1';
 

        -- Durchlauf - UP=0 - HOLD=1
        HOLD <= '1';
        UP <= '0'; 
        wait for 230 ns;


        -- Ende
        CLRN <= '0';
        wait;
    end process WaveGen_Proc;
    
end architecture dut;
