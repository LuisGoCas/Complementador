entity comp_ser is
	port(
		X, Y: in  bit;
		Z   : out bit
	);
end comp_ser;

architecture arch_compser of comp_ser is
begin
	Z <= X xor Y;
end arch_compser;