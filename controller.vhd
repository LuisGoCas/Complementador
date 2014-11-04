library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity controller is
	port(
		clk,rst : in std_logic;
		X	: in std_logic;
		Y	: out std_logic;
		ld_sh,stop	: out std_logic
		--ld_sh		: out std_logic
	);
end controller;

architecture archcon of controller is
	type estado is (s0,s1);
	signal pr,sg : estado;
	signal contador : integer range 0 to 15 := 0;
begin
	sec: process(rst,clk,contador)
	begin
		if (rst = '1') then
			contador <= 0;
			pr <= s0;
			ld_sh <= '1';
			stop <= '0';
		elsif(rising_edge(clk) and rst = '0') then
			contador <= contador + 1;
			ld_sh <= '0';
			pr <= sg;
			if(contador > 8) then
				stop <= '1';
			end if;
		end if;
	end process sec;
	
	comb: process(pr,X)
	begin
		sg <= s1;
		case pr is
			when s0 =>
				if(X = '0') then
					sg <= s0;
				end if;
				Y <= '0';
			when s1 =>
				Y <= '1';
		end case;
	end process comb;
end archcon;
