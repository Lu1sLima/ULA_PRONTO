library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.p_ula.all;

entity alu is

 port( op1, op2 : in std_logic_vector(11 downto 0);
 opmode : in op_alu;
 z, cout, ov: out std_logic;
 outalu : out std_logic_vector(11 downto 0)
 );
end alu;

architecture alu of alu is
 signal aa, bb, soma: std_logic_vector(11 downto 0) ;
 signal mode: std_logic ;

 signal  outalu_int : std_logic_vector(11 downto 0); -- criei sinal interno pq nao posso fazer comparação com pinos de saida

begin
outalu <= outalu_int; -- criei sinal interno pq nao posso fazer comparação com pinos de saida

 z <= '1' when outalu_int = x"000" else '0';
 ---
 --- instancia a soma
 --- uAND (op1 and op2)
 --- uOR (op1 or op2)
 --- uXOR (op1 xnor op2)	
 --- uSLL
 --- uSRL
 --- uADD (op1 + op2)
 --- uSUB (op1 - op2)
 --- uSUB2 (op2 - op1)
 --- uOP1 (0 + op1)
 --- uNEG (0 - op1)
 mode <= '0' when opmode=uADD or opmode=uOP1 else '1';
 
 aa <= x"000" when opmode=uOP1 or opmode=uNEG else op2
when opmode=uSUB2 else op1;

 bb <=  op1 when opmode=uSUB2 else op1 when opmode=uNEG 
 else op1 when opmode=uOP1 else op2;
 
 sb: entity work.soma_sub
 generic map(12) -- Aqui é 12 mesmo?
 port map( a=> aa, b=> bb, mode=>mode, S=> soma, cout=> cout, ov=>ov);
 ---
 --- ULA
 ---
 outalu_int <=
 op1 and op2 when opmode=uAND else
 op1 or op2 when opmode=uOR else
 op1 xnor op2 when opmode=uXNOR else
 to_StdLogicVector( to_bitvector(op1) sll CONV_INTEGER(op2(3 downto 0)) ) when opmode=uSLL else
 to_StdLogicVector( to_bitvector(op1) srl CONV_INTEGER(op2(3 downto 0)) ) when opmode=uSRL else  
 soma; --- uADD, uSUB, uSUB2, uOP1, uNEG
end alu;
