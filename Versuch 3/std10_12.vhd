 library ieee;
 use ieee.std_logic_1164.all;

 entity std10_12 is

 port(
        reset : in std_logic;

        clk : in std_logic;

        a,b,c : in std_logic;

        ov : out std_logic_vector(1 downto 0)
        );

 end std10_12;

 architecture verhalten of std10_12 is
 -- Definition eines eigenen, neuen Datentypes

 type my_state_t is (Z1, Z2, Z3);
 signal sig_zustands_vektor : my_state_t;
 begin

 process (reset, clk, a,b,c) is
 begin
        if reset = '1' then
        sig_zustands_vektor <= Z1;
        elsif (clk'event and clk = '1') then
        case sig_zustands_vektor is

 when Z1 =>
       if ((a = '1') and (b = '1') ) then
       sig_zustands_vektor <= Z2;
       elsif ((b = '1') and (c = '0') ) then
        sig_zustands_vektor <= Z3;
 end if;

 when Z2 =>
       if ((a = '1') and (b = '0') ) then
       sig_zustands_vektor <= Z1;
 end if;

 when Z3 =>
       if ((b = '0') and (c = '0') ) then
        sig_zustands_vektor <= Z2;
 end if;

 when others =>
 sig_zustands_vektor <= Z1;

 end case;
 end if;
 end process;

 process (sig_zustands_vektor) is
 begin
 case sig_zustands_vektor is
       when Z1 => ov <= "01";
       when Z2 => ov <= "10";
       when Z3 => ov <= "11";
       when others => ov <= "00";
 end case;


 end process;
 end verhalten;
