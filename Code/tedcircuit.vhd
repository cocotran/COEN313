entity tedcircuit is
port(A,B,C,D : in BIT;
      E : out BIT);
end tedcircuit;

architecture ted_arch of tedcircuit is

-- declare the components found in our entity

component ted_and2
port(A, B : in BIT; OUTPUT : out BIT);
end component;

component ted_or2
port(A,B : in BIT; OUTPUT : out bit);
end component;

-- declare signals used to interconnect components

signal s1, s2 : BIT;

-- declare configuration specification

for U1, U3 : ted_and2 use entity WORK.ted_and(ted_arch);
for U2: ted_or2  use entity WORK.ted_or(ted_arch);

begin

U1 : ted_and2 port map(A => A , B => B , OUTPUT => s1 );
U2 : ted_or2  port map(A => C,  B => D,  OUTPUT => s2 );
U3 : ted_and2 port map(A => s1, B => s2, OUTPUT => E);

end ted_arch;
