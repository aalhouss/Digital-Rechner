library ieee;
use ieee.std_logic_1164.all;

-- Beschreibung der Schnittstelle
entity Dekoder is
  port (
    s     : in  std_logic_vector(2 downto 0);         
    q     : out std_logic_vector(2 downto 0));        
end Dekoder ;

-- Beschreibung des Verhaltens
architecture behv of Dekoder is
  --------------------------------------------
  -- Definition der drei genutzten Komponenten
  --------------------------------------------
begin

 q <=  "111"  when s = "000" else
       "101"  when s = "001" else
       "100"  when s = "010" else
       "010"  when s = "011" else
       "000"  when s = "100" else
       "011"  when s = "101" else
       "001"  when s = "110" else
       "110"  when s = "111" else
        "000"; 
   
end behv;  -- Ende des Abschnitts  architecture behv of...
