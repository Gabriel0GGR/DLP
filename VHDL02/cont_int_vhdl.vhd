-- Contador Natural VHDL

library ieee;
use ieee.std_logic_1164.all;

entity cont_int_vhdl is
 port
 (
	clk,reset,ud:in std_logic;
	Q:out natural range 0 to 15
 );
end cont_int_vhdl;

architecture comportamento of cont_int_vhdl is
	signal cont:natural range 0 to 15;
	signal div_clk:integer range 0 to 50000000;
	signal sud:natural range 0 to 1;
begin
	process(ud) is
	begin
		if ud'event and ud='1' then
		sud<=sud+1;
		end if;
	end process;
	process(clk,reset) is
	begin
		if reset='0' then cont<=0;
		elsif clk'event and clk='0' then
			div_clk<=div_clk+1;
			if div_clk=50000000 then
				div_clk<=0;
				if sud=0 then
					if cont<15 then
						cont<=cont+1;
					else
						cont<=0;
					end if;
				end if;
				if sud=1 then
					if cont>0 then
						cont<=cont-1;
					else
						cont<=15;
					end if;
				end if;
			end if;
		end if;
	end process;
	Q<=cont;
end comportamento;