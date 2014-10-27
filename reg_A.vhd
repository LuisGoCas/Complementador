library ieee;
use ieee.std_logic_1164.all;
entity reg_A is
	port(
		clk,ld_sh,stop : in std_logic;
		para_In : in std_logic_vector(7 downto 0);
		X : out std_logic
	);
end reg_A;
--piso
--parallel in serial out
architecture arch of reg_A is
	signal temp : std_logic_vector(7 downto 0);
begin
	process(clk,para_In,ld_sh,stop)
	begin
		if(ld_sh = '1') then
			temp <= para_In;
		elsif (rising_edge(clk) and stop = '0') then
				X <= temp(0);
				temp(7 downto 0) <= '0' & temp(7 downto 1); 
		end if;
	end process;
end arch;