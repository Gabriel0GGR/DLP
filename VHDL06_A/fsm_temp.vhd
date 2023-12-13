library ieee;
use ieee.std_logic_1164.all;

entity fsm_temp is
	port(clk, reset: in std_logic;
	saida: out std_logic_vector(17 downto 0));
end fsm_temp;

architecture fsm of fsm_temp is
	type state is(s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15);
	signal estado, prox_estado:state;
	signal tempo: integer range 0 to 50000000;
begin
process(clk,reset)
variable div_clock: integer range 0 to 50000000;
begin
	if(reset='0')then estado<=s0;
	elsif(clk'event and clk='1')then
		div_clock:=div_clock+1;
		if div_clock=tempo then
			div_clock:=0;
			estado<=prox_estado;
		end if;
	end if;
end process;
process(estado)
begin
	case estado is
	when s0=>
		saida<="100000000000000001";
		prox_estado<=s1;
		tempo<=25000000;
	when s1=>
		saida<="010000000000000010";
		prox_estado<=s2;
		tempo<=20000000;
	when s2=>
		saida<="001000000000000100";
		prox_estado<=s3;
		tempo<=15000000;
	when s3=>
		saida<="000100000000001000";
		prox_estado<=s4;
		tempo<=10000000;
	when s4=>
		saida<="000010000000010000";
		prox_estado<=s5;
		tempo<=5000000;
	when s5=>
		saida<="000001000000100000";
		prox_estado<=s6;
		tempo<=2500000;
	when s6=>
		saida<="000000100001000000";
		prox_estado<=s7;
		tempo<=1250000;
	when s7=>
		saida<="000000010010000000";
		prox_estado<=s8;
		tempo<=2500000;
	when s8=>
		saida<="000000001100000000";
		prox_estado<=s9;
		tempo<=5000000;
	when s9=>
		saida<="000000010010000000";
		prox_estado<=s10;
		tempo<=10000000;
	when s10=>
		saida<="000000100001000000";
		prox_estado<=s11;
		tempo<=15000000;
	when s11=>
		saida<="000001000000100000";
		prox_estado<=s12;
		tempo<=20000000;
	when s12=>
		saida<="000010000000010000";
		prox_estado<=s13;
		tempo<=25000000;
	when s13=>
		saida<="000100000000001000";
		prox_estado<=s14;
		tempo<=20000000;
	when s14=>
		saida<="001000000000000100";
		prox_estado<=s15;
		tempo<=15000000;
	when s15=>
		saida<="010000000000000010";
		prox_estado<=s0;
		tempo<=20000000;
	end case;
end process;
end fsm;