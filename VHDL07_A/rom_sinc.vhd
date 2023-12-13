library ieee;
use ieee.std_logic_1164.all;

entity rom_sinc is
port
(
	clk, we: in std_logic;
	address: in integer range 0 to 15;
	data_out: out std_logic_vector(7 downto 0)
);
end rom_sinc;

architecture rom_arch of rom_sinc is
signal reg_address: integer range 0 to 15;
type memory is array(0 to 15) of std_logic_vector(7 downto 0);
signal myrom: memory;
attribute ram_init_file: string;
attribute ram_init_file of myrom: signal is "rom_sinc.mif";
begin
	process(clk)
	begin
		if(clk'event and clk='1') then
			reg_address<=address;
		end if;
	end process;
	data_out<=myrom(reg_address);
end rom_arch;