library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library teste;
use teste.my_package.all;

entity pwm_tri is
	port
	(
		clk:in std_logic;
		count0, count1, count2:buffer unsigned(7 downto 0);
		pwm0, pwm1, pwm2:out std_logic
	);
end pwm_tri;

architecture pwm_tri_arch of pwm_tri is
	begin
		process(clk)
		variable clk_div:integer range 0 to 50000000;
		variable up:std_logic:='0';
		begin
			if(clk'event and clk='0') then
				clk_div:=clk_div+1;
				if clk_div=(50000000*2)/200 then
					if up='0' then
						count0<=count0+1;
						clk_div:=0;
						if(count0="01100100") then
							up:='1';
						end if;
					end if;
					if up='1' then
						count0<=count0-1;
						clk_div:=0;
						if(count0="00000001") then
							up:='0';
						end if;
					end if;
				end if;
			end if;
		end process;
		
		process(clk)
		variable clk_div:integer range 0 to 50000000;
		variable up:std_logic:='0';
		begin
			if(clk'event and clk='0') then
				clk_div:=clk_div+1;
				if clk_div=(50000000*4)/200 then
					if up='0' then
						count1<=count1+1;
						clk_div:=0;
						if(count1="01100100") then
							up:='1';
						end if;
					end if;
					if up='1' then
						count1<=count1-1;
						clk_div:=0;
						if(count1="00000001") then
							up:='0';
						end if;
					end if;
				end if;
			end if;
		end process;
		
		process(clk)
		variable clk_div:integer range 0 to 50000000;
		variable up:std_logic:='0';
		begin
			if(clk'event and clk='0') then
				clk_div:=clk_div+1;
				if clk_div=(50000000*6)/200 then
					if up='0' then
						count2<=count2+1;
						clk_div:=0;
						if(count2="01100100") then
							up:='1';
						end if;
					end if;
					if up='1' then
						count2<=count2-1;
						clk_div:=0;
						if(count2="00000001") then
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
			count => count0,
			pwm_out => pwm0
		);
		
		inst1: pwm
		port map
		(
			clk => clk,
			count => count1,
			pwm_out => pwm1
		);
		
		inst2: pwm
		port map
		(
			clk => clk,
			count => count2,
			pwm_out => pwm2
		);
end architecture;