entity ted_and is
port(A,B,C : in BIT ; 
     OUTPUT : out BIT);
end ted_and;

architecture ted_arch of ted_and is
begin

OUTPUT <= A and B and C;

end ted_arch;
