library ieee;
use ieee.std_logic_1164.all; use ieee.numeric_std.all;
entity mux43 is
port (
d0   : in std_logic_vector(2 downto 0); -- d0 (sel="00")
d1   : in std_logic_vector(2 downto 0); -- d1 (sel="01")
d2   : in std_logic_vector(2 downto 0); -- d2 (sel="10")
d3   : in std_logic_vector(2 downto 0); -- d3 (sel="11")
sel :in std_logic_vector (1 downto 0);
Y   : out std_logic_vector(2 downto 0) -- Ausgang
);
end mux43;

architecture verhalten of mux43 is
begin

Y <=   d0 when  sel="00"   else  -- 0
       d1 when  sel="01"   else  -- 1
       d2 when  sel="10"   else  -- 2
       d3 when  sel="11";  -- 3
                                         -- sollte nicht eintreten
end verhalten;


