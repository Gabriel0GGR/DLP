--XOR em VHDL

library ieee;
use ieee.std_logic_1164.all;

entity my_xor_vhdl is
	port
	(
		A:in std_logic;
		B:in std_logic;
		S:out std_logic
	);
end my_xor_vhdl;

architecture logic_xor of my_xor_vhdl is
begin
	S<=(A AND NOT B)OR(B AND NOT A);
end logic_xor;