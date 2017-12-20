----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2017 01:04:36 PM
-- Design Name: 
-- Module Name: CONTROLLER - Behavioral
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
           PRE_FULL  : in STD_LOGIC;
           FIFO_FULL : in STD_LOGIC;
           FIFO_CTRL : out STD_LOGIC:='0';
           ADDR      : out STD_LOGIC_VECTOR (5 downto 0) := "000000";
           PRE_RE    : out STD_LOGIC:='0';
           PRE_WE    : out STD_LOGIC:='0';
           FIFO_RE   : out STD_LOGIC:='0';
           FIFO_WE   : out STD_LOGIC:='0';
           FIFO_LOOP : out STD_LOGIC:='0';
           FIFO_RST  : out STD_LOGIC:='0');
end CONTROLLER;

architecture Behavioral of CONTROLLER is

signal counter_sig : STD_LOGIC_VECTOR (5 downto 0) := "000000";

begin

counter: process(CLK)
begin
    if(rising_edge(CLK)) then
        if(RST='1') then
            counter_sig <= "000000";
            PRE_RE<='0';
            PRE_WE<='0';
            FIFO_RE<='0';
            FIFO_WE<='0';
            FIFO_LOOP<='0';
            FIFO_RST<='1';
        elsif(PRE_FULL='1') then
            counter_sig <= counter_sig;
            PRE_RE<='1';
            PRE_WE<='0';
            FIFO_RE<='0';
            FIFO_WE<='1';
            FIFO_LOOP<='0';
            FIFO_RST<='0';
        elsif(FIFO_FULL='1') then
            counter_sig <= counter_sig;
            PRE_RE<='0';
            PRE_WE<='0';
            FIFO_RE<='1';
            FIFO_WE<='1';
            FIFO_LOOP<='1';
            FIFO_RST<='0';
        else
            counter_sig <= counter_sig + '1';
            PRE_RE<='0';
            PRE_WE<='1';
            FIFO_RE<='0';
            FIFO_WE<='0';
            FIFO_LOOP<='0';
            FIFO_RST<='0';
        end if ;
    end if;
end process counter;

ADDR<=counter_sig;
end Behavioral;
