library IEEE;
use IEEE.std_logic_1164.all;

entity sum_of_minterms is

port( a,b,c : in std_logic; output : out std_logic);

end sum_of_minterms;

architecture sum of sum_of_minterms is

signal NOTA, NOTB: std_logic;

begin

NOTA <= not a;
NOTB <= not b;
output <= (NOTA AND NOTB AND c) OR (NOTA AND b AND c) OR (a AND b AND c);

end sum;



