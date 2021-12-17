library IEEE;
use IEEE.std_logic_1164.all;

entity va3 is
    port (
        A: in std_logic_vector(2 downto 0);
        B: in std_logic_vector(2 downto 0);
        S: out std_logic_vector(3 downto 0)
    );
end entity va3;

architecture verhalten of va3 is

    component va is
        port (
        A:    in std_logic;
        B:    in std_logic;
        Cin:  in std_logic;
        S:    out std_logic;
        Cout: out std_logic
        );
    end component VA;

    signal s01, s02: std_logic;
begin
   
    va0: va port map (A => A(0), B => B(0), Cin => '0', S => S(0), Cout => s01);
    va1: va port map (A => A(1), B => B(1), Cin => s01, S => S(1), Cout => s02);
   va2: va port map (A => A(2), B => B(2), Cin => s02, S => S(2), Cout => S(3));
   

end architecture ;
