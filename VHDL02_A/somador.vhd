-- Somador

library ieee;
use ieee.std_logic_1164.all;

entity somador is
	port
	(
		A:in natural range 0 to 7;
		B:in natural range 0 to 7;
		Q:out natural range 0 to 15
	);
end somador;

architecture comportamento of somador is
begin
	Q<=A+B;
end comportamento;