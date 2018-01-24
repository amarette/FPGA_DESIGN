--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.5
--  \   \         Application : xaw2vhdl
--  /   /         Filename : clk1.vhd
-- /___/   /\     Timestamp : 01/15/2018 09:47:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: xaw2vhdl-intstyle C:/Users/alexm_000/Documents/GitHub/FPGA_DESIGN/DIGITAL_SYTH_JAMMER/ipcore_dir/clk1.xaw -st clk1.vhd
--Design Name: clk1
--Device: xc3s200a-4vq100
--
-- Module clk1
-- Generated by Xilinx Architecture Wizard
-- Written for synthesis tool: XST
-- Period Jitter (unit interval) for block DCM_SP_INST = 0.17 UI
-- Period Jitter (Peak-to-Peak) for block DCM_SP_INST = 0.79 ns

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity clk1 is
   port ( CLKIN_IN     : in    std_logic; 
          RST_IN       : in    std_logic; 
          CLKFX_OUT    : out   std_logic; 
          CLKFX180_OUT : out   std_logic);
end clk1;

architecture BEHAVIORAL of clk1 is
   signal CLKFX_BUF    : std_logic;
   signal CLKFX180_BUF : std_logic;
   signal GND_BIT      : std_logic;
begin
   GND_BIT <= '0';
   CLKFX_BUFG_INST : BUFG
      port map (I=>CLKFX_BUF,
                O=>CLKFX_OUT);
   
   CLKFX180_BUFG_INST : BUFG
      port map (I=>CLKFX180_BUF,
                O=>CLKFX180_OUT);
   
   DCM_SP_INST : DCM_SP
   generic map( CLK_FEEDBACK => "NONE",
            CLKDV_DIVIDE => 2.0,
            CLKFX_DIVIDE => 4,
            CLKFX_MULTIPLY => 21,
            CLKIN_DIVIDE_BY_2 => FALSE,
            CLKIN_PERIOD => 25.000,
            CLKOUT_PHASE_SHIFT => "NONE",
            DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
            DFS_FREQUENCY_MODE => "LOW",
            DLL_FREQUENCY_MODE => "LOW",
            DUTY_CYCLE_CORRECTION => TRUE,
            FACTORY_JF => x"C080",
            PHASE_SHIFT => 0,
            STARTUP_WAIT => FALSE)
      port map (CLKFB=>GND_BIT,
                CLKIN=>CLKIN_IN,
                DSSEN=>GND_BIT,
                PSCLK=>GND_BIT,
                PSEN=>GND_BIT,
                PSINCDEC=>GND_BIT,
                RST=>RST_IN,
                CLKDV=>open,
                CLKFX=>CLKFX_BUF,
                CLKFX180=>CLKFX180_BUF,
                CLK0=>open,
                CLK2X=>open,
                CLK2X180=>open,
                CLK90=>open,
                CLK180=>open,
                CLK270=>open,
                LOCKED=>open,
                PSDONE=>open,
                STATUS=>open);
   
end BEHAVIORAL;


