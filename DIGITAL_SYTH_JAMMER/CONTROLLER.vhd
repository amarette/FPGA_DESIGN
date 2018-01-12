----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2017 01:04:36 PM
-- Design Name: 
-- Module Name: CONTROLLER_SLOW - Behavioral
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

entity CONTROLLER is
    Port ( RST       : in STD_LOGIC;
           CLK       : in STD_LOGIC;
           FIFO_FULL : in STD_LOGIC;
           ADDR      : out STD_LOGIC_VECTOR (5 downto 0) := "000000";
           FIFO_WE   : out STD_LOGIC:='0';
			  FIFO_RE	: out STD_LOGIC:='0';
			  FIFO_LOOP : out STD_LOGIC:='0';
           FIFO_RST  : out STD_LOGIC:='0');
end CONTROLLER;

architecture Behavioral of CONTROLLER is

type state_type is (IDLESTATE, LOADSTATE, LOOPSTATE);
signal PS     : state_type:=IDLESTATE;
signal NS     : state_type;

signal counter_sig : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal d_fifo_loop : STD_LOGIC :='0';
signal count_on	 : STD_LOGIC :='0';
signal count_rst	 : STD_LOGIC :='0';

begin

	sync_proc: process(CLK)
	begin
		if (count_on = '1') then	
			if (rising_edge(CLK)) then
				counter_sig<=counter_sig+1;
			end if;
		else
			counter_sig<=counter_sig;
		end if;
		if (count_rst = '1') then
			counter_sig<="000000";
		end if;
		if (rising_edge(CLK)) then
			PS <= NS;
			FIFO_LOOP<=d_fifo_loop;
		end if;
	end process;

	comb_proc: process(PS, FIFO_FULL, RST, CLK)
	begin
		case PS is
			when IDLESTATE =>
				count_on    <='0';
				count_rst   <='1';
				FIFO_RST    <='0';
				FIFO_RE     <='0';
				FIFO_WE     <='0';
				d_fifo_loop <='0';
				if (RST = '1') then 
					NS         <= LOADSTATE;
					count_rst  <='0';
					count_on   <='1';
            else 
					NS         <= IDLESTATE;
				end if;
							
			when LOADSTATE =>
				count_on    <='1';
				count_rst   <='0';
				FIFO_RST    <='0';
				FIFO_RE     <='0';
				FIFO_WE     <='1';
				d_fifo_loop <='0';
				if (FIFO_FULL = '1') then 
					NS       <= LOOPSTATE;
					count_on <='0';
				else 
					NS       <= LOADSTATE;
				end if;

				
			when LOOPSTATE =>
			   count_on    <='0';
				count_rst   <='0';
				FIFO_RST    <='0';
				FIFO_RE     <='1';
				FIFO_WE     <='1';
				d_fifo_loop <='1';
				if (RST = '1') then
					NS       <= IDLESTATE;
					FIFO_RST <='1';
				else 
					NS       <= LOOPSTATE;
				end if;
		end case;
		end process;


ADDR<=counter_sig;
end Behavioral;
