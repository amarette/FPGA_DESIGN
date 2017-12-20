--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:12:11 12/19/2017
-- Design Name:   
-- Module Name:   C:/Users/Alex Maretee/Documents/Everything-S-Kewl/Thesis/DIGITAL_SYTH_JAMMER/sim.vhd
-- Project Name:  DIGITAL_SYTH_JAMMER
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM_1
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
 
ENTITY sim IS
END sim;
 
ARCHITECTURE behavior OF sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM_1
    PORT(
         CLK : IN  std_logic;
         EN : IN  std_logic;
         ADDR : IN  std_logic_vector(5 downto 0);
         DATA : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal EN : std_logic := '0';
   signal ADDR : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal DATA : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM_1 PORT MAP (
          CLK => CLK,
          EN => EN,
          ADDR => ADDR,
          DATA => DATA
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		EN <= '1';
		
		ADDR<=std_logic_vector(to_unsigned(0,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(1,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(2,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(3,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(4,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(5,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(6,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(7,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(8,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(9,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(10,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(11,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(12,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(13,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(14,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(15,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(16,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(17,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(18,ADDR'length));
		wait for 20 ns;
		ADDR<=std_logic_vector(to_unsigned(19,ADDR'length));
		wait for 20 ns;
		

      wait;
   end process;

END;
