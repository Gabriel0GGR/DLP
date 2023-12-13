library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library teste;
use teste.my_package.all;
entity contador is
	port
	(
		clk:in std_logic;
		A0,B0,C0,D0,E0,F0,G0,A1,B1,C1,D1,E1,F1,G1:out std_logic
	);
end contador;
architecture contador_arch of contador is
signal count,uni,dez:unsigned(3 downto 0);
begin
	process(clk)
	begin
		if(clk'event and clk='0') then
			count<=count+1;
			uni<=count mod 10;
			dez<=count/10;
		end if;
	end process;
dec1:my_dec7seg_vhdl
	port map(uni(0),uni(1),uni(2),uni(3),A0,B0,C0,D0,E0,F0,G0);
dec2:my_dec7seg_vhdl
	port map(dez(0),dez(1),dez(2),dez(3),A1,B1,C1,D1,E1,F1,G1);
end architecture;