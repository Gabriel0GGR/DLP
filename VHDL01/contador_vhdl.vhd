-- Contador em VHDL

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_vhdl is
	port
	(
		clk, reset:in std_logic;
		Q0, Q1, Q2, Q3:out std_logic
	);
end contador_vhdl;
architecture comportamento of contador_vhdl is
	signal cont: unsigned(3 downto 0);
begin
	process(clk, reset) is
	begin
		if reset='0' then cont<="0000";
		elsif clk'event and clk='0' then
			if cont="1001" then cont<="0000";
			else cont<=cont+1;
			end if;
		end if;
	end process;
	Q0<=cont(0);
	Q1<=cont(1);
	Q2<=cont(2);
	Q3<=cont(3);
end comportamento;