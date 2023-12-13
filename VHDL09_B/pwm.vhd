library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm is
port
(
	clk:in std_logic;
	count:in unsigned(7 downto 0);
	pwm_out:out std_logic
);
end pwm;

architecture pwm_arch of pwm is
signal fcont: unsigned(7 downto 0);
begin
process(clk)
	variable clk_div:integer range 0 to 50000000;
	begin
		if(clk'event and clk='0') then
			clk_div:=clk_div+1;
			if clk_div=50 then
				clk_div:=0;
				fcont<=fcont+1;
			end if;
			if(fcont="01100100") then
				fcont<="00000000";
			end if;
			if(fcont<count) then
				pwm_out<='1';
			else
				pwm_out<='0';
			end if;
		end if;
	end process;
end architecture;