library IEEE;
use IEEE.std_logic_1164.all;

entity soma_sub is
generic(N : integer := 12);
port( A, B : in std_logic_vector(N-1 downto 0);
	S : out std_logic_vector(N-1 downto 0);
	mode : in std_logic; --- modo
	Cout : out std_logic;
	OV : out std_logic
);
end entity;

architecture a1 of soma_sub is
signal c : std_logic_vector(N downto 0);
signal bb : std_logic_vector(N-1 downto 0);
begin
	c(0) <= mode; -- se o cin for 0 é soma, senão é subtração
	Cout <= c(N);
	OV <= c(N) xor c(N-1);
	add: for i in 0 to N-1 generate
begin
	bb(i) <= b(i) xor mode;
	S(i) <= c(i) xor A(i) xor bb(i);
	c(i+1) <= (c(i) and A(i)) or (c(i) and bb(i)) or (A(i) and bb(i));
end generate;
end architecture a1;