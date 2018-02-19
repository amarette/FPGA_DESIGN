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

entity CONTROLLER_SLOW is
    Port ( RST       : in STD_LOGIC;
           CLK       : in STD_LOGIC;
           PRE_FULL  : in STD_LOGIC;
           FIFO_FULL : in STD_LOGIC;
           ADDR      : out STD_LOGIC_VECTOR (5 downto 0) := "000000";
           PRE_WE    : out STD_LOGIC:='0';
			  PRE_RE    : out STD_LOGIC:='0';
			  LED			: out STD_LOGIC:='0';
			  STATE     : out STD_LOGIC_VECTOR (5 downto 0) := "000000";
			  FIFO_RST  : out STD_LOGIC:='1');
end CONTROLLER_SLOW;

architecture Behavioral of CONTROLLER_SLOW is

type state_type is (IDLESTATE, LOADSTATE_1, LOADSTATE_2, LOOPSTATE);
signal PS     : state_type:=IDLESTATE;
signal NS     : state_type;

signal counter_sig : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal d_pre_we	 : STD_LOGIC :='0';
signal d_pre_re	 : STD_LOGIC :='0';
signal d_2_pre_re	 : STD_LOGIC :='0';
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
			PRE_WE<=d_PRE_WE;
			PRE_RE<=d_PRE_RE;
			d_PRE_RE<=d_2_PRE_RE;
		end if;
	end process;

	comb_proc: process(PS, PRE_FULL, FIFO_FULL, RST, CLK)
	begin
		case PS is
			when IDLESTATE =>
            d_PRE_WE<='0';
				d_2_PRE_RE<='0';
				count_on<='0';
				count_rst<='1';
				FIFO_RST<='0';
				STATE<="000000";
				LED<='0';
				if (RST = '1') then 
				NS <= LOADSTATE_1;
				count_rst<='0';
            else NS <= IDLESTATE;
				end if;
							
			when LOADSTATE_1 =>
				count_on<='1';
				count_rst<='0';
            d_PRE_WE<='1';
				d_2_PRE_RE<='0';
				FIFO_RST<='0';
				STATE<="000001";
				LED<='0';
				if (PRE_FULL = '1') then 
					NS <= LOADSTATE_2;
					count_on<='0';
				else NS    <= LOADSTATE_1;
				end if;
								
			when LOADSTATE_2 =>
			   count_on<='0';
				count_rst<='0';
            d_PRE_WE<='0';
				d_2_PRE_RE<='1';
				FIFO_RST<='0';
				STATE<="000010";
				LED<='0';
				if (FIFO_FULL = '1') then
				NS <= LOOPSTATE;
				else NS <= LOADSTATE_2;
				end if;
				
			when LOOPSTATE =>
			   count_on<='0';
				count_rst<='0';
            d_PRE_WE<='0';
				d_2_PRE_RE<='1';
				FIFO_RST<='0';
				STATE<="000011";
				LED<='1';
				if (RST = '1') then
				NS <= IDLESTATE;
				FIFO_RST<='1';
				d_2_PRE_RE<='0';
				else NS <= LOOPSTATE;
				end if;
		end case;
		end process;


ADDR<=counter_sig;
end Behavioral;
