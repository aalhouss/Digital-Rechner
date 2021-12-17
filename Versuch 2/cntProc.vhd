
 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
 -- Beschreibung der Schnittstelle
 entity cntProc is
 port
 (
 CLRN : in std_logic;
 CLK : in std_logic;
 UP : in std_logic;
 HOLD : in std_logic;
 zustandsvektor : out std_logic_vector (2 downto 0)
 );
 end cntProc;
 -- Beschreibung des Verhaltens
 architecture verhalten of cntProc is
 begin
 process (CLRN, CLK, UP, HOLD) is
 variable var_zustands_vektor : integer range 0 to 7;
 begin
 if CLRN = '0' then
 var_zustands_vektor := 0;
 elsif (CLK'event and CLK = '1') then
 if (HOLD = '0') then
 if (UP = '1') then
 if(var_zustands_vektor = 7) then
 var_zustands_vektor := 0;
 else
 var_zustands_vektor := var_zustands_vektor + 1;
 end if;
 else
 if(var_zustands_vektor = 0) then
 var_zustands_vektor := 7;
else
 var_zustands_vektor := var_zustands_vektor - 1;
 end if;
 end if;
 end if;
 end if;
 zustandsvektor <= std_logic_vector(to_unsigned(var_zustands_vektor,3));
 end process;
 end verhalten;