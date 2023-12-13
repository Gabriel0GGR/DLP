library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library teste;
use teste.my_package.all;
entity contador is
	port
	(
		clk, up, down:in std_logic;
		cout:out unsigned(7 downto 0);
		A0,B0,C0,D0,E0,F0,G0,A1,B1,C1,D1,E1,F1,G1,A2,B2,C2,D2,E2,F2,G2,A3,B3,C3,D3,E3,F3,G3:out std_logic
	);
end contador;
architecture contador_arch of contador is
signal count:unsigned(7 downto 0);
signal uni,dez,cen,mil:unsigned(3 downto 0);
begin
	process(clk)
	variable clk_div:integer range 0 to 50000000;
	begin
		if(clk'event and clk='0') then
			if(up='0' and count<100) then
				clk_div:=clk_div+1;
				if clk_div=5000000 then
					clk_div:=0;
					count<=count+1;
				end if;
			end if;
			if(down='0' and count>0) then
				clk_div:=clk_div+1;
				if clk_div=5000000 then
					clk_div:=0;
					count<=count-1;
				end if;
			end if;
		end if;
	end process;
	
	cout<=count;
	bcd(count,uni,dez,cen,mil);
	
dec1:my_dec7seg_vhdl
	port map(uni(0),uni(1),uni(2),uni(3),A0,B0,C0,D0,E0,F0,G0);
dec2:my_dec7seg_vhdl
	port map(dez(0),dez(1),dez(2),dez(3),A1,B1,C1,D1,E1,F1,G1);
dec3:my_dec7seg_vhdl
	port map(cen(0),cen(1),cen(2),cen(3),A2,B2,C2,D2,E2,F2,G2);
dec4:my_dec7seg_vhdl
	port map(mil(0),mil(1),mil(2),mil(3),A3,B3,C3,D3,E3,F3,G3);
end architecture;