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
         DAC_CLK : OUT  std_logic;
         O_0 : OUT  std_logic;
         O_1 : OUT  std_logic;
         O_2 : OUT  std_logic;
         O_3 : OUT  std_logic;
         O_4 : OUT  std_logic;
         O_5 : OUT  std_logic;
         O_6 : OUT  std_logic;
         O_7 : OUT  std_logic;
         O_8 : OUT  std_logic;
         O_9 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SW : std_logic_vector(15 downto 0) := (others => '0');
   signal BUT : std_logic := '0';
   signal CLK_IN : std_logic := '0';

 	--Outputs
   signal DAC_CLK : std_logic;
   signal O_0 : std_logic;
   signal O_1 : std_logic;
   signal O_2 : std_logic;
   signal O_3 : std_logic;
   signal O_4 : std_logic;
   signal O_5 : std_logic;
   signal O_6 : std_logic;
   signal O_7 : std_logic;
   signal O_8 : std_logic;
   signal O_9 : std_logic;

   -- Clock period definitions
   constant CLK_IN_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TOP_DAWG PORT MAP (
          SW => SW,
          BUT => BUT,
          CLK_IN => CLK_IN,
          DAC_CLK => DAC_CLK,
          O_0 => O_0,
          O_1 => O_1,
          O_2 => O_2,
          O_3 => O_3,
          O_4 => O_4,
          O_5 => O_5,
          O_6 => O_6,
          O_7 => O_7,
          O_8 => O_8,
          O_9 => O_9
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

      wait for CLK_IN_period*10;

      -- insert stimulus here 
		SW<="1111111111111111";
		BUT<='1';
		wait for 20 ns;
		BUT<='0';
      wait;
   end process;

END;
