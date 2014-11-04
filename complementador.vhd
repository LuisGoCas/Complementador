library ieee;
use ieee.std_logic_1164.all;

entity complementador is
	port(
		rst,clk : in std_logic;
		I : in std_logic_vector(7 downto 0);
		O : out std_logic_vector(7 downto 0)
	);
end complementador;

architecture structural of complementador is	
	----------- reg_piso --------------
	component reg_piso is
	port(
		clk,ld_sh,stop : in std_logic;
		--clk,ld_sh : in std_logic;
		para_In : in std_logic_vector(7 downto 0);
		X : out std_logic
	);
	end component;
	--------- reg_sipo ----------------
	component reg_sipo is
	port(
		clk,ld_sh,stop : in std_logic;
		--clk,ld_sh : in std_logic;
		Z : in std_logic;
		X : out std_logic_vector(7 downto 0)
	);
	end component;
	-------- comp_serial ----------
	component comp_ser is
	port(
		X : in std_logic;
		Y : in std_logic;
		Z : out std_logic
	);
	end component;
	-------- Controller -----------
	component controller is
	port(
		clk,rst 	: in std_logic;
		X			: in std_logic;
		Y	      : out std_logic;
		ld_sh,stop		: out std_logic
		--ld_sh		: out std_logic
	);
	end component;
	-- intermediate signal declaration
	signal X_out, Z_out, Y_out, ld_sh_out, stop_out : std_logic;
begin	
	u1	: controller	port map(clk, rst, X_out, Y_out, ld_sh_out, stop_out);
	u2	: reg_piso		port map(clk, ld_sh_out, stop_out, I, X_out);
	u3	: comp_ser		port map(X_out, Y_out, Z_out);
	u4	: reg_sipo		port map(clk, ld_sh_out,stop_out, Z_out, O);
end structural;