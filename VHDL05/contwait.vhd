library ieee;
use ieee.std_logic_1164.all;

entity contwait is
port
(
	clk: in std_logic;
	ud: in std_logic_vector (1 downto 0);
	q: out integer range 0 to 6
);
end;
architecture contarch of contwait is
begin
	process
	variable num: integer range -1 to 6;
	begin
	wait until(clk'event and clk='1');
	case ud is
	when "00" => num:=num+1;
	if(num>=6) then num:=0;
	end if;
	when "01" => num:=num-1;
	if(num=-1) then num:=5;
	if(num<=0) then num:=0;
	end if;
	end if;
	when "10" => num:=num;
	when "11" => num:=0;
	end case;
	q<=num;
end process;
end architecture;
	