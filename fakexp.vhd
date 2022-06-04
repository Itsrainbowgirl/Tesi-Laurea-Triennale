----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2021 13:07:33
-- Design Name: 
-- Module Name: fakexp - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_unsigned.all;

entity fakexp is
    Port ( 
           deltac : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           ris : out STD_LOGIC_VECTOR (7 downto 0));
end fakexp;

architecture Behavioral of fakexp is
    signal Rdeltac : STD_LOGIC_VECTOR (7 downto 0);
    signal deltac_4 : STD_LOGIC_VECTOR (7 downto 0);
    signal temp : STD_LOGIC_VECTOR(7 downto 0);
    signal temp2 : STD_LOGIC_VECTOR(7 downto 0);
begin
    
    deltac_4(7 downto 0)<="00"&Rdeltac(7 downto 2);
    temp<= conv_std_logic_vector(0,8) when (deltac_4(4)='1' or deltac_4(5)='1') else
           conv_std_logic_vector(1,8) when (deltac_4(3)='1' and deltac_4(2)='1') else
           conv_std_logic_vector(2,8) when (deltac_4(3)='1' and deltac_4(2)='0') else
           conv_std_logic_vector(4,8) when (deltac_4(2)='1') else
           conv_std_logic_vector(8,8) when (deltac_4(1)='1') else
           conv_std_logic_vector(12,8) when (deltac_4(0)='1') else
           conv_std_logic_vector(16,8) when (deltac_4(0)='0') else
           "XXXXXXXX";
     temp2<=temp(5 downto 0)&"00";
     
     process(clk)
        begin
        if rising_edge(clk) then
            Rdeltac<=deltac;
            ris<=temp2;
        end if;
     end process;

end Behavioral;
