library ieee;
use ieee.std_logic_1164.all;
--sipo shift register
--Serial In Parallel Out
entity reg_B is
	port(
		clk,ld_sh,stop : in std_logic;
		--clk,ld_sh : in std_logic;
		Z : in std_logic;
		X : out std_logic_vector(7 downto 0)
	);
end reg_B;
architecture arch of reg_B is
signal temp : std_logic_vector(7 downto 0);
begin
	process(clk,ld_sh,stop,temp,Z)
	begin
		if (rising_edge(clk) and stop = '0') then
				if(ld_sh = '0') then
					temp(7 downto 0) <= Z & temp(7 downto 1);
					X <= temp;	
				else 
					temp <= "00000000";
				end if;
		end if;
	X <= temp;
	end process;
end arch;