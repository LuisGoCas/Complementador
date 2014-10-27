library ieee;
use ieee.std_logic_1164.all;
entity comp_ser is
	port(
		X : in std_logic;
		Y : in std_logic;
		Z : out std_logic
	);
end comp_ser;
architecture arch_compser of comp_ser is
begin
Z <= X xor Y;
end arch_compser;