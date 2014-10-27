library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity controlador is
	port(
		clk,rst 	: in std_logic;
		X			: in std_logic;
		Y	: out std_logic;
		ld_sh,stop		: out std_logic
		--ld_sh		: out std_logic
	);
end controlador;
architecture archcon of controlador is
type estado is (s0,s1);
signal pr,sg : estado;
signal contador : integer := 0;
begin
	sec: process(rst,clk,contador)
	begin
		if (rst='1') then
			contador <= 0;
			pr<=s0;
			ld_sh <= '1';
			stop <= '0';
		elsif(rising_edge(clk) and rst = '0') then
			contador <= contador + 1;
			ld_sh <= '0';
			pr<=sg;
			if(contador > 8) then
				stop <= '1';
			end if;
		end if;
	end process sec;
	comb: process(pr,X)
	begin
		case pr is
			when s0 =>
				if(X = '0') then
					sg <= s0;
					Y <= '0';
				else
					sg <= s1;
					Y <= '0';
				end if;					
			when s1 =>
				if(X = '1') then
					sg <= s1;
					Y <= '1';
				else
					sg <= s1;
					Y <= '1';
				end if;
			end case;
	end process comb;
end archcon;