library IEEE;
use IEEE.std_logic_1164.all;

entity VA is
    port (
        A:    in std_logic;
        B:    in std_logic;
        Cin:  in std_logic;
        S:    out std_logic;
        Cout: out std_logic
            );
end entity VA;

architecture behv of VA is
signal invec : std_logic_vector(2 downto 0);

begin
    invec <= A & B & Cin;
    S <= '1' when invec="001" else
         '1' when invec="010" else 
         '1' when invec="100" else
         '1' when invec="111" else 
         '0';
      
   Cout <= '1' when invec="011" else
           '1' when invec="101" else 
           '1' when invec="110" else
           '1' when invec="111" else 
            '0';  
    
end behv;
