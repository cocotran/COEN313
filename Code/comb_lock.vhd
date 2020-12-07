library IEEE;
use IEEE.std_logic_1164.all;

entity comb_lock is
	port (
		ld1:		in std_logic;
		ld2:		in std_logic;
		ld3:		in std_logic;
		value:		in std_logic_vector(3 downto 0);
		enter:		in std_logic;
		reset:		in std_logic;
		clock:		in std_logic;
		unlock:		out std_logic
	);
end entity comb_lock;

architecture mult_seg_arch of comb_lock is
	type state_type is (d1, d2, d3, cd1, cd2, cd3, ulk);
	signal state_reg, state_next : state_type;
	signal equal : std_logic;
	signal cmp_num : std_logic_vector(3 downto 0);
	signal c1, c2, c3 : std_logic_vector(3 downto 0);

begin
-- control path: state register
process(clock, reset)
begin
	if reset = '1' then
		state_reg <= d1;
	elsif (clock'event and clock = '1') then
		state_reg <= state_next;
	end if;
end process;

-- control path: next-state/output logic
process(state_reg, enter, equal)
begin
	case state_reg is
		when d1 => 
			if enter = '1' then
				state_next <= d2;
			else 
				state_next <= d1;
			end if;
		when d2 => 
			if enter = '1' then
				state_next <= d3;
			else
				state_next <= d2;
			end if;
		when d3 => 
			if enter = '1' then
				state_next <= cd1;
			else
				state_next <= d3;
			end if;
		when cd1 => 
			if equal = '1' then
				state_next <= cd2;
			else
				state_next <= d1;
			end if;
		when cd2 => 
			if equal = '1' then
				state_next <= cd3;
			else
				state_next <= d1;
			end if;
		when cd3 => 
			if equal = '1' then
				state_next <= ulk;
			else
				state_next <= d1;
			end if;
		when ulk => 
			state_next <= ulk;
	end case;
end process;

-- control path: output logic
unlock <= '1' when state_reg = ulk else '0';

-- data path: data register
process(clock, reset, ld1, ld2, ld3)
begin
	if reset = '1' then
		c1 <= (others => '0');
		c2 <= (others => '0');
		c3 <= (others => '0');
	elsif (clock'event and clock = '1') then
		if ld1 = '1' then
			c1 <= value;
			c2 <= (others => '0');
			c3 <= (others => '0');
		elsif ld2 = '1' then
			c2 <= value;
			c3 <= (others => '0');
		elsif ld3 = '1' then
			c3 <= value;
		end if;
	end if;
end process;
		

-- data path: multiplexer
process(state_reg)
begin 
	case state_reg is
		when d1 => 
			cmp_num <= "0000";
		when d2 => 
			cmp_num <= "0000";
		when d3 => 
			cmp_num <= "0000";
		when cd1 => 
			cmp_num <= c1;
		when cd2 => 
			cmp_num <= c2;
		when cd3 => 
			cmp_num <= c3;
		when ulk => 
			cmp_num <= "0000";
	end case;
end process;


-- data path: comparator
process(state_reg, cmp_num)
	constant cs1 : std_logic_vector(3 downto 0) := "0011";
	constant cs2 : std_logic_vector(3 downto 0) := "0001";
	constant cs3 : std_logic_vector(3 downto 0) := "0011";
begin 
	case state_reg is
		when d1 => 
			equal <= '0';
		when d2 => 
			equal <= '0';
		when d3 => 
			equal <= '0';
		when ulk => 
			equal <= '0';
		when cd1 => 
			if cmp_num = cs1 then
				equal <= '1';
			else 
				equal <= '0';
			end if;
		when cd2 => 
			if cmp_num = cs2 then
				equal <= '1';
			else 
				equal <= '0';
			end if;
		when cd3 => 
			if cmp_num = cs3 then
				equal <= '1';
			else 
				equal <= '0';
			end if;
	end case;
end process;

end architecture mult_seg_arch;
