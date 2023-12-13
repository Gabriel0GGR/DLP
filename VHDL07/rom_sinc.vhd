library ieee;
use ieee.std_logic_1164.all;

entity rom_sinc is
port
(
	clk: in std_logic;
	address: in integer range 0 to 15;
	data_out: out std_logic_vector(7 downto 0)
);
end rom_sinc;

architecture rom_arch of rom_sinc is
signal reg_address: integer range 0 to 15;
type memory is array(0 to 15) of std_logic_vector(7 downto 0);
constant myrom: memory:=
(
	2=>"11111111",
	3=>"00011010",
	4=>"00000101",
	5=>"01010000",
	6=>"10110000",
	15=>"00010001",
	others=>"00000000"
);
begin
	process(clk)
	begin
		if(clk'event and clk='1') then
			reg_address<=address;
		end if;
	end process;
	data_out<=myrom(reg_address);
end rom_arch;