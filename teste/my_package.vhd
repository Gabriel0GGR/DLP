library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package my_package is

component contador is
	port
	(
		clk, up, down:in std_logic;
		cout:out unsigned(7 downto 0);
		A0,B0,C0,D0,E0,F0,G0,A1,B1,C1,D1,E1,F1,G1,A2,B2,C2,D2,E2,F2,G2,A3,B3,C3,D3,E3,F3,G3:out std_logic
	);
end component;

component pwm is
port
(
	clk:in std_logic;
	count:in unsigned(7 downto 0);
	pwm_out:out std_logic
);
end component;

component my_dec7seg_vhdl is
	port
	(
		D0,D1,D2,D3:in std_logic;
		A,B,C,D,E,F,G:out std_logic
	);
end component;

function byte_uni(signal byte:unsigned)
return unsigned;

function byte_dez(signal byte:unsigned)
return unsigned;

procedure bcd(
	signal byte:in unsigned;
	signal uni,dez,cen,mil:out unsigned);

end package;

package body my_package is

function byte_uni(signal byte:unsigned)
return unsigned is
	variable uni:unsigned(byte'length-1 downto 0);
begin
	uni:=byte mod 10;
	return uni(3 downto 0);
end function;

function byte_dez(signal byte:unsigned)
return unsigned is
	variable dez:unsigned(byte'length-1 downto 0);
begin
	dez:=(byte mod 100)/10;
	return dez(3 downto 0);
end function;

procedure bcd(
	signal byte:in unsigned;
	signal uni,dez,cen,mil:out unsigned)is
	variable u,d,c,m:unsigned(byte'length-1 downto 0);
begin
	u:=byte mod 10;
	d:=(byte mod 100)/10;
	c:=(byte mod 1000)/100;
	m:=byte/1000;
	uni<=u(3 downto 0);
	dez<=d(3 downto 0);
	cen<=c(3 downto 0);
	mil<=m(3 downto 0);
end procedure;

end package body;