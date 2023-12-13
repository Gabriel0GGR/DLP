library ieee;
use ieee.std_logic_1164.all;

entity gray_fsm is
	port(clk, reset, up:in std_logic; saida:out std_logic_vector(3 downto 0));
end gray_fsm;

architecture fsm of gray_fsm is
	type state is(S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15);
	signal estado, prox_estado:state;
begin
	process(clk,reset)
		begin
			if(reset='0')
				then estado<=S0;
			elsif(clk'event and clk='1')
				then estado<=prox_estado;
			end if;
	end process;
	process(estado)
	begin
		case estado is
			when S0=>
				saida<="0000";
				if(up='1') then prox_estado<=S1;
				else prox_estado<=S15;
				end if;
			when S1=>
				saida<="0001";
				if(up='1') then prox_estado<=S2;
				else prox_estado<=S0;
				end if;
			when S2=>
				saida<="0011";
				if(up='1') then prox_estado<=S3;
				else prox_estado<=S1;
				end if;
			when S3=>
				saida<="0010";
				if(up='1') then prox_estado<=S4;
				else prox_estado<=S2;
				end if;
			when S4=>
				saida<="0110";
				if(up='1') then prox_estado<=S5;
				else prox_estado<=S3;
				end if;
			when S5=>
				saida<="0111";
				if(up='1') then prox_estado<=S6;
				else prox_estado<=S4;
				end if;
			when S6=>
				saida<="0101";
				if(up='1') then prox_estado<=S7;
				else prox_estado<=S5;
				end if;
			when S7=>
				saida<="0100";
				if(up='1') then prox_estado<=S8;
				else prox_estado<=S6;
				end if;
			when S8=>
				saida<="1100";
				if(up='1') then prox_estado<=S9;
				else prox_estado<=S7;
				end if;
			when S9=>
				saida<="1101";
				if(up='1') then prox_estado<=S10;
				else prox_estado<=S8;
				end if;
			when S10=>
				saida<="1111";
				if(up='1') then prox_estado<=S11;
				else prox_estado<=S9;
				end if;
			when S11=>
				saida<="1110";
				if(up='1') then prox_estado<=S12;
				else prox_estado<=S10;
				end if;
			when S12=>
				saida<="1010";
				if(up='1') then prox_estado<=S13;
				else prox_estado<=S11;
				end if;
			when S13=>
				saida<="1011";
				if(up='1') then prox_estado<=S14;
				else prox_estado<=S12;
				end if;
			when S14=>
				saida<="1001";
				if(up='1') then prox_estado<=S15;
				else prox_estado<=S13;
				end if;
			when S15=>
				saida<="1000";
				if(up='1') then prox_estado<=S0;
				else prox_estado<=S14;
				end if;
		end case;
	end process;
end fsm;
				