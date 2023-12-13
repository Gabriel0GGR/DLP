-- Shifter em VHDL

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity project is
	port
	(
		sel:in bit_vector(1 downto 0);
		var:in bit_vector(7 downto 0);
		dir, clk, load:in std_logic;
		Q:out bit_vector(7 downto 0)
	);
end project;
architecture comportamento of project is
	signal varbuf: bit_vector(7 downto 0);
begin
	process(clk, dir, load) is
	begin
		if load='0' then varbuf<=var;
			elsif clk'event and clk='0' then
				if sel="01" then
					if dir='0' then varbuf<=varbuf SRL 1;
					else varbuf<=varbuf SLL 1;
					end if;
				end if;
				if sel="10" then
					if dir='0' then varbuf<=varbuf SRA 1;
					else varbuf<=varbuf SlA 1;
					end if;
				end if;
				if sel="11" then
					if dir='0' then varbuf<=varbuf ROR 1;
					else varbuf<=varbuf ROL 1;
					end if;
				end if;
		end if;
	end process;
	Q<=varbuf;
end comportamento;