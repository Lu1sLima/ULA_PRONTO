library ieee,work;
use ieee.std_logic_1164.all;
use work.p_ula.all;

entity tb is
end tb;

architecture a1 of tb is 

   signal op1, op2, outalu: std_logic_vector(11 downto 0);
   signal z, cout, ov  : std_logic;
   signal opmode : op_alu;

--   type test_record is record
 --      a, b :  std_logic_vector(11 downto 0);
  -- end record;

--   type padroes is array(natural range <>) of test_record;

 --  constant padrao_de_teste : padroes := (
 --       (a => x"AAA",  b => x"555"),
  --      (a => x"FFF",  b => x"FFF"),
  --      (a => x"345",  b => x"200"),
  --      (a => x"003",  b => x"227"),
  --      (a => x"56D",  b => x"401"),
   --     (a => x"051",  b => x"30A"),
--		(a => x"CCC",  b => x"111"),
--		(a => x"AFF",  b => x"333"),
----		(a => x"EEE",  b => x"AAA"),
--		(a => x"800",  b => x"001")
  --  );

 begin
--teste: apaga e escreve oq quer
op1 <= x"CAA", x"01A" after 20ns;
op2 <= x"23F", x"33B" after 20ns;
opmode <= uSUB2;




    sb: entity work.alu
             port map( op1=> op1, op2=> op2, outalu=>outalu, z=>z, cout=>cout, ov=>ov, opmode=>opmode);   
   
   -- test: process
 --    begin       

   --   for op in op_alu loop    --  percorre o tipo enumerado

     --       opmode <= op;         

  --          for i in 0 to padrao_de_teste'high loop    
--                op1 <= padrao_de_teste(i).a; -- nesse padrão de teste, oq eu coloco?
    --            op2 <= padrao_de_teste(i).b;
      --          wait for 10 ns;
        --    end loop;

  --  end loop;
     
  --  end process; 
        
end architecture;

