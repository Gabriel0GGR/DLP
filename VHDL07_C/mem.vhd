library ieee;
use ieee.std_logic_1164.all;

entity mem is
port
(
	clk: in std_logic;
	sel: in std_logic_vector (1 downto 0);
	--address: in integer range 0 to 7;
	output: out std_logic_vector (7 downto 0)
);
end entity;

architecture mem_arch of mem is
signal div_clk: integer range 0 to 50000000;
signal reg_address: integer range 0 to 31:=0;
type memory is array(0 to 31) of std_logic_vector(7 downto 0);
signal rom: memory;
attribute ram_init_file: string;
attribute ram_init_file of rom: signal is "mem.mif";
begin
	process(clk)
	begin
		if(clk'event and clk='1') then
			case sel is
			when "00"=>
				reg_address<=0;
			when "01"=>
				div_clk<=div_clk+1;
				if(reg_address=0) then
					reg_address<=0;
				end if;
				if(reg_address=7) then
					reg_address<=0;
				end if;
				if(div_clk=25000000) then
					if(reg_address<7) then
						reg_address<=reg_address+1;
					end if;
					if(reg_address=7) then
						div_clk<=0;
					end if;
				end if;
			when "10"=>
				if(reg_address=0) then
					reg_address<=8;
				end if;
				if(reg_address=15) then
					reg_address<=0;
				end if;
				div_clk<=div_clk+1;
				if(div_clk=25000000) then
					if(reg_address<15) then
						reg_address<=reg_address+1;
					end if;
					if(reg_address=15) then
						div_clk<=0;
					end if;
				end if;
			when "11"=>
				if(reg_address=0) then
					reg_address<=16;
				end if;
				if(reg_address=31) then
					reg_address<=0;
				end if;
				div_clk<=div_clk+1;
				if(div_clk=25000000) then
					if(reg_address<31) then
						reg_address<=reg_address+1;
					end if;
					if(reg_address=31) then
						div_clk<=0;
					end if;
				end if;
			end case;
		end if;
	end process;
	output<=rom(reg_address);
end mem_arch;

