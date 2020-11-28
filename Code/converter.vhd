library IEEE; 
use IEEE.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 
entity converter is 
	port( sign_mag : in std_logic_vector(3 downto 0) ; 
	twos_comp : out std_logic_vector(3 downto 0) ); 
end; 

architecture behave of converter is 
begin 
process(sign_mag) 
begin 
if sign_mag(3) = ‘0’ then 
	twos_comp <= sign_mag; 
else 
	twos_comp <= sign mag(3) & (not (Sign_mag(2 downto 0)) + “001”); 
end if; 
end process; 
end behave;

