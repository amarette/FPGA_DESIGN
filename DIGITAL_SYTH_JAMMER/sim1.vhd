--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:11:13 12/20/2017
-- Design Name:   
-- Module Name:   C:/Users/alexm_000/Documents/GitHub/FPGA_DESIGN/DIGITAL_SYTH_JAMMER/sim1.vhd
-- Project Name:  DIGITAL_SYTH_JAMMER
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TOP_DAWG
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY sim1 IS
END sim1;
 
ARCHITECTURE behavior OF sim1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TOP_DAWG
    PORT(
         SW : IN  std_logic_vector(15 downto 0);
         BUT : IN  std_logic;
         CLK_IN : IN  std_logic;
         LED    : out std_logic;
			DAC_CLK : OUT  std_logic;
			TP      : out STD_LOGIC_VECTOR (5 downto 0);
			DATA_OUT : out STD_LOGIC_VECTOR (9 downto 0));
    END COMPONENT;
    

   --Inputs
   signal SW : std_logic_vector(15 downto 0) := (others => '0');
   signal BUT : std_logic := '0';
   signal CLK_IN : std_logic := '0';
 	--Outputs
   signal DAC_CLK  : std_logic;
   signal LED : std_logic;
   signal DATA_OUT : STD_LOGIC_VECTOR (9 downto 0);
   signal TP       : STD_LOGIC_VECTOR (5 downto 0);
   -- Clock period definitions
   constant CLK_IN_period : time := 25 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TOP_DAWG PORT MAP (
          SW => SW,
          BUT => BUT,
			 LED=>LED,
          CLK_IN => CLK_IN,
          DAC_CLK => DAC_CLK,
			 TP=>TP,
          DATA_OUT => DATA_OUT
        );

   -- Clock process definitions
   CLK_IN_process :process
   begin
		CLK_IN <= '0';
		wait for CLK_IN_period/2;
		CLK_IN <= '1';
		wait for CLK_IN_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_IN_period*20;

      -- insert stimulus here 
		SW<="1111111111111111";
		wait for 100 ns;
		BUT<='1';
		wait for 2 us;
		BUT<='0';
      wait;
   end process;

END;
