library IEEE;
use IEEE.std_logic_1164.all;

entity sum_of_minterms2 is
port( a,b,c : in BIT; output : out BIT);
end sum_of_minterms2;

architecture sum of sum_of_minterms2 is

component ted_and
port(A, B, C : in BIT; OUTPUT : out BIT);
end component;

component ted_or
port(A, B, C : in BIT; OUTPUT : out bit);
end component;

signal s1, s2, s3: BIT;
signal NOTA, NOTB: BIT;

for U1, U2, U3 : ted_and use entity WORK.ted_and(ted_arch);
for U4 : ted_or use entity WORK.ted_or(ted_arch);

begin
NOTA <= not a;
NOTB <= not b;

U1: ted_and port map(NOTA,NOTB,c,s1);
U2: ted_and port map(NOTA,b,c,s2);
U3: ted_and port map(a,b,c,s3);
U4: ted_or port map(U1,U2,U3,output);

end sum;
