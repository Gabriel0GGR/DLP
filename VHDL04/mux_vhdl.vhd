library ieee;
use ieee.std_logic_1164.all;

entity mux_vhdl is
	port
	(
		a:in std_logic_vector(2 downto 0);
		b:in std_logic_vector(2 downto 0);
		c:in std_logic_vector(2 downto 0);
		d:in std_logic_vector(2 downto 0);
		s:in std_logic_vector(1 downto 0);
		q:out std_logic_vector(2 downto 0)
	);
end mux_vhdl;
architecture op of mux_vhdl is
begin
	with s select
	q<=a when "00",
	b when "01",
	c when "10",
	d when "11";
end op;