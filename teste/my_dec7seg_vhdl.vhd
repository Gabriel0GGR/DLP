library ieee;
use ieee.std_logic_1164.all;

entity my_dec7seg_vhdl is
	port
	(
		D0,D1,D2,D3:in std_logic;
		A,B,C,D,E,F,G:out std_logic
	);
end my_dec7seg_vhdl;
architecture comportamento of my_dec7seg_vhdl is
	signal S:std_logic_vector(6 downto 0);
	signal DADO:std_logic_vector(3 downto 0);
begin
	DADO(0)<=D0;
	DADO(1)<=D1;
	DADO(2)<=D2;
	DADO(3)<=D3;
	with DADO select
	S<="0000001" when "0000",
	"1001111" when "0001",
	"0010010" when "0010",
	"0000110" when "0011",
	"1001100" when "0100",
	"0100100" when "0101",
	"0100000" when "0110",
	"0001111" when "0111",
	"0000000" when "1000",
	"0000100" when "1001",
	"0001000" when "1010",
	"1100000" when "1011",
	"0110001" when "1100",
	"1000010" when "1101",
	"0110000" when "1110",
	"0111000" when "1111",
	"1111111" when others;
	A<=S(6);
	B<=S(5);
	C<=S(4);
	D<=S(3);
	E<=S(2);
	F<=S(1);
	G<=S(0);
end comportamento;