library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- Bibliothek für das "+"

entity cntHierarch is                   -- Zähler regulär
  port (
    CLRN        : in  std_logic;
    CLK        : in  std_logic;
    HOLD        : in  std_logic;
    UP          : in  std_logic;
    count       : out std_logic_vector (2 downto 0));
end cntHierarch ;

architecture verhalten of  cntHierarch is
signal mux43_out : std_logic_vector (2 downto 0);
signal reg_out : std_logic_vector (2 downto 0) ;
signal add_out : std_logic_vector (3 downto 0) ;
signal sub_out : std_logic_vector (3 downto 0) ;
signal holdupvector : std_logic_vector (1 downto 0) ;
signal deco_out     : std_logic_vector (2 downto 0);
begin 
holdupvector<=HOLD & UP;

va3_1: entity work.va3
port map(
A=>reg_out,
B =>"001",
S=>add_out );

va3_2:entity work.va3
port map (
A =>reg_out,
B =>"111",
S=>sub_out);
mux43 : entity work.mux43
port map(
d0 =>sub_out(2 downto 0),
d1 =>add_out (2 downto 0),
d2 =>reg_out,
d3 =>reg_out,
sel =>holdupvector,
Y  =>mux43_out);

dff3:entity work.dff3
port map(
CLK =>CLK,
CLRN =>CLRN,
D=>mux43_out,
Q=>reg_out);

deco:entity work.Dekoder 
port map(
s  => reg_out,
q  => count );





end verhalten;