library ieee;
use ieee.std_logic_1164.all;

entity ram_sinc is
port
(
	clk, we: in std_logic;
	address: in integer range 0 to 15;
	data_in: in std_logic_vector(7 downto 0);
	data_out: out std_logic_vector(7 downto 0)
);
end ram_sinc;

architecture ram_arch of ram_sinc is
type memory is array(0 to 15) of std_logic_vector(7 downto 0);
signal myram: memory;
attribute ram_init_file: string;
attribute ram_init_file of myram: signal is "ram_sinc.mif";
begin
	process(clk)
	begin
		if(clk'event and clk='1') then
			if(we='0') then
				myram(address)<=data_in;
			end if;
		end if;
	end process;
	data_out<=myram(address);
end ram_arch;