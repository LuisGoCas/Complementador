library ieee;
use ieee.std_logic_1164.all;
--sipo shift register
--Serial In Parallel Out
entity reg_sipo is
	port(
		clk,ld_sh,stop : in std_logic;
		--clk,ld_sh : in std_logic;
		Z : in std_logic;
		X : buffer std_logic_vector(7 downto 0)
	);
end reg_sipo;

architecture arch of reg_sipo is
begin
	process(clk,ld_sh,stop,Z,X)
	begin
		if (rising_edge(clk) and stop = '0') then
			if(ld_sh = '0') then
				X <= Z & X(7 downto 1);
			else 
				X <= "00000000";
			end if;
		end if;
	end process;
end arch;