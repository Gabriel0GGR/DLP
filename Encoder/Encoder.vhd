library ieee;
use ieee.std_logic_1164.all;

entity Encoder is
	port
	(
		A:in std_logic_vector(7 downto 0);
		Z:out std_logic_vector(3 downto 0)
	);
end Encoder;

architecture Arch of Encoder is
begin
	Z<="0000" when A="00000001" else
	"0001" when A="00000010" else
	"0010" when A="00000100" else
	"0011" when A="00001000" else
	"0100" when A="00010000" else
	"0101" when A="00100000" else
	"0110" when A="01000000" else
	"0111" when A="10000000" else
	"1000";
end Arch;