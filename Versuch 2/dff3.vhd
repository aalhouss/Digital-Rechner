
library ieee;
use ieee.std_logic_1164.all;

entity dff3 is
port (

    D       : in  std_logic_vector(2 downto 0);     -- Data
    clk     : in  std_logic;                        -- Clock
    CLRN    : in  std_logic;                        -- Reset Eingang
    Q       : out std_logic_vector(2 downto 0));    -- Q
end dff3;

architecture behv of dff3 is
signal internes_Q : std_logic_vector(2 downto 0);
begin

  process(CLK, D,CLRN) is 
begin
if CLRN = '0' then
internes_Q <="000";
elsif CLK'event and CLK='1' then
internes_Q <=D;
end if;
end process;

Q <= internes_Q;

 end behv;