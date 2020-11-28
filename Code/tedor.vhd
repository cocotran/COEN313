entity ted_or is
port(A,B,C : in BIT ; 
     OUTPUT : out BIT);
end ted_or;

architecture ted_arch of ted_or is
begin

OUTPUT <= A or B or C;

end ted_arch;
