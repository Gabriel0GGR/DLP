library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library teste;
use teste.my_package.all;

entity pwm_auto is
	port
	(
		clk:in std_logic;
		count:buffer unsigned(7 downto 0);
		pwm_out:out std_logic
	);
end pwm_auto;

architecture pwm_auto_arch of pwm_auto is
	begin
		process(clk)
		variable clk_div:integer range 0 to 50000000;
		variable up:std_logic:='0';
		begin
			if(clk'event and clk='0') then
				clk_div:=clk_div+1;
				if clk_div=1500000 then
					if up='0' then
						count<=count+1;
						clk_div:=0;
						if(count="01100100") then
							up:='1';
						end if;
					end if;
					if up='1' then
						count<=count-1;
						clk_div:=0;
						if(count="00000000") then
							up:='0';
						end if;
					end if;
				end if;
			end if;
		end process;
		
		inst0: pwm
		port map
		(
			clk => clk,
			count => count,
			pwm_out => pwm_out
		);
end architecture;