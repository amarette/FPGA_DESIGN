----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2017 03:51:02 PM
-- Design Name: 
-- Module Name: SUM_NORM - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SUM_NORM is
    Port ( C1       : in STD_LOGIC_VECTOR (9 downto 0);
           C2       : in STD_LOGIC_VECTOR (9 downto 0);
           C3       : in STD_LOGIC_VECTOR (9 downto 0);
           C4       : in STD_LOGIC_VECTOR (9 downto 0);
           C5       : in STD_LOGIC_VECTOR (9 downto 0);
           C6       : in STD_LOGIC_VECTOR (9 downto 0);
           C7       : in STD_LOGIC_VECTOR (9 downto 0);
           C8       : in STD_LOGIC_VECTOR (9 downto 0);
           C9       : in STD_LOGIC_VECTOR (9 downto 0);
           C10      : in STD_LOGIC_VECTOR (9 downto 0);
           C11      : in STD_LOGIC_VECTOR (9 downto 0);
           C12      : in STD_LOGIC_VECTOR (9 downto 0);
           C13      : in STD_LOGIC_VECTOR (9 downto 0);
           C14      : in STD_LOGIC_VECTOR (9 downto 0);
           C15      : in STD_LOGIC_VECTOR (9 downto 0);
           C16      : in STD_LOGIC_VECTOR (9 downto 0);
           Dout     : out STD_LOGIC_VECTOR (13 downto 0));
end SUM_NORM;

architecture Behavioral of SUM_NORM is
signal sum : STD_LOGIC_VECTOR (13 downto 0);

begin

sum<=("0000"&C1)+("0000"&C2)+("0000"&C3)+("0000"&C4)+("0000"&C5)+("0000"&C6)+("0000"&C7)+("0000"&C8)+("0000"&C9)+("0000"&C10)+("0000"&C11)+("0000"&C12)+("0000"&C13)+("0000"&C14)+("0000"&C15)+("0000"&C16);
Dout<=sum;

end Behavioral;
