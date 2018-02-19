----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2017 08:45:29 PM
-- Design Name: 
-- Module Name: TOP_DAWG - Behavioral
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
Library UNISIM;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_DAWG is
    Port ( SW      : in STD_LOGIC_VECTOR (15 downto 0);
           BUT     : in STD_LOGIC;
			  LED     : out STD_LOGIC;
           CLK_IN  : in STD_LOGIC;
           DAC_CLK : out STD_LOGIC;
			  TP      : out STD_LOGIC_VECTOR (5 downto 0);
			  DATA_OUT : out STD_LOGIC_VECTOR (9 downto 0));
end TOP_DAWG;

architecture Behavioral of TOP_DAWG is

component DEBOUNCE
	 PORT( clk     : IN  STD_LOGIC;  --input clock
	       Reset   : in std_logic;
			 button  : IN  STD_LOGIC;  --input signal to be debounced
          result  : OUT STD_LOGIC); --debounced signal
    END component;

component clk1 
   port ( CLKIN_IN        : in    std_logic; 
          RST_IN          : in    std_logic; 
          CLKFX_OUT       : out   std_logic; 
          CLKFX180_OUT    : out   std_logic);
   end component;
	
component clk2 
   port ( CLKIN_IN        : in    std_logic; 
          RST_IN          : in    std_logic; 
          CLKFX_OUT       : out   std_logic);
   end component;
	

component CONTROLLER_SLOW
    Port ( RST       : in STD_LOGIC;
           CLK       : in STD_LOGIC;
           PRE_FULL  : in STD_LOGIC;
           FIFO_FULL : in STD_LOGIC;
           ADDR      : out STD_LOGIC_VECTOR (5 downto 0) := "000000";
           PRE_WE    : out STD_LOGIC:='0';
			  PRE_RE    : out STD_LOGIC:='0';
			  LED			: out STD_LOGIC:='0';
			  STATE     : out STD_LOGIC_VECTOR (5 downto 0) := "000000";
           FIFO_RST  : out STD_LOGIC:='0');
    end component;
	 
component CONTROLLER_FAST
    Port ( RST       : in STD_LOGIC;
           CLK       : in STD_LOGIC;
           PRE_FULL  : in STD_LOGIC;
           FIFO_FULL : in STD_LOGIC;
           FIFO_RE   : out STD_LOGIC:='0';
           FIFO_WE   : out STD_LOGIC:='0';
           FIFO_LOOP : out STD_LOGIC:='0';
           FIFO_RST  : out STD_LOGIC:='0');
    end component;

component PRE_FIFO
    PORT (rst       : IN STD_LOGIC;
          wr_clk    : IN STD_LOGIC;
          rd_clk    : IN STD_LOGIC;
          din       : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
          wr_en     : IN STD_LOGIC;
          rd_en     : IN STD_LOGIC;
          dout      : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
          full      : OUT STD_LOGIC;
          empty     : OUT STD_LOGIC;
          prog_full : OUT STD_LOGIC);
END component;

component FIFO
  PORT ( clk       : IN  STD_LOGIC;
         rst       : IN  STD_LOGIC;
         din       : IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
         wr_en     : IN  STD_LOGIC;
         rd_en     : IN  STD_LOGIC;
         dout      : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
         full      : OUT STD_LOGIC;
         empty     : OUT STD_LOGIC;
         prog_full : OUT STD_LOGIC);
END component;

component SUM_NORM
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
           SW_TOT   : in STD_LOGIC_VECTOR (4 downto 0);
           Dout     : out STD_LOGIC_VECTOR(9 downto 0));
end component;

component ROM_1
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_2
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_3
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_4
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_5
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_6
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_7
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_8
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_9
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_10
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_11
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_12
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_13
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_14
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_15
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_16
    PORT (CLK  : IN STD_LOGIC;
			 EN   : IN STD_LOGIC;
          ADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          DATA : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

--------------------SIGNALS----------------------
signal CLK				  : STD_LOGIC;
signal CLK_BUF  		  : STD_LOGIC;
signal s_addr          : STD_LOGIC_VECTOR(5 downto 0);
signal s_sw_tot        : STD_LOGIC_VECTOR(4 downto 0);
signal s_clk           : STD_LOGIC;
signal s_dac_clk       : STD_LOGIC;
signal s_dout_sum_norm : STD_LOGIC_VECTOR(9 downto 0);
signal s_pre_we        : STD_LOGIC;
signal s_pre_re        : STD_LOGIC;
signal s_pre_full      : STD_LOGIC;
signal s_pre_dout      : STD_LOGIC_VECTOR(9 downto 0);
signal s_we            : STD_LOGIC;
signal s_re            : STD_LOGIC;
signal s_full          : STD_LOGIC;
signal s_dout          : STD_LOGIC_VECTOR(9 downto 0);
signal s_fifo_rst      : STD_LOGIC;
signal s_pre_rst       : STD_LOGIC;
signal s_fifo_loop     : STD_LOGIC;
signal S_fifo_din      : STD_LOGIC_VECTOR(9downto 0);
signal s_led			  : STD_LOGIC;
signal s_but			  : STD_LOGIC;

--------------------ROM SIGNALS------------------
signal s_rom_1 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_2 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_3 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_4 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_5 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_6 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_7 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_8 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_9 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_10 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_11 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_12 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_13 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_14 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_15 : STD_LOGIC_VECTOR(9 downto 0);
signal s_rom_16 : STD_LOGIC_VECTOR(9 downto 0);

--------------------ROM SUM NORM SIGNALS------------------
signal s_sum_norm_1 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_2 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_3 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_4 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_5 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_6 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_7 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_8 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_9 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_10 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_11 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_12 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_13 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_14 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_15 : STD_LOGIC_VECTOR(9 downto 0);
signal s_sum_norm_16 : STD_LOGIC_VECTOR(9 downto 0);


begin
IBUFG_inst : IBUFG
	generic map (
		IBUF_DELAY_VALUE => "0", -- Specify the amount of added input delay for buffer, 
                               -- "0"-"16" 
		IOSTANDARD => "DEFAULT")
	port map (
		O => CLK_BUF, 
		I => CLK_IN);

BUFG_inst : BUFG
	port map (
		O => CLK, 
		I => CLK_BUF);

clk_1:clk1 
    Port MAP(
		  rst_in          => '0',
        clkin_in        => CLK,
        clkfx_out       => s_DAC_CLK,
        clkfx180_out    => DAC_CLK);
			
clk_2:clk2 
    Port MAP(
		  rst_in          => '0',
        clkin_in        => CLK,
        clkfx_out       => s_clk);

rom1:ROM_1
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_1);
rom2:ROM_2
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_2);
rom3:ROM_3
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_3);
rom4:ROM_4
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_4);
rom5:ROM_5
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_5);
rom6:ROM_6
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_6);
rom7:ROM_7
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_7);
rom8:ROM_8
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_8);
rom9:ROM_9
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_9);
rom10:ROM_10
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_10);
rom11:ROM_11
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_11);
rom12:ROM_12
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_12);
rom13:ROM_13
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_13);
rom14:ROM_14
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_14);
rom15:ROM_15
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_15);
rom16:ROM_16
    Port MAP(
        CLK  => s_CLK,
		  EN   => '1',
        ADDR => s_addr,
        DATA => S_rom_16);

cont1:CONTROLLER_SLOW
    Port MAP( 
        RST        => s_BUT,
        CLK        => s_CLK,
        ADDR       => s_addr,
        PRE_WE     => s_pre_we,
        PRE_RE     => s_pre_re,
        PRE_FULL   => s_pre_full,
        FIFO_FULL  => s_full,
        FIFO_RST   => s_pre_rst,
		  STATE      => TP,
		  LED        => s_LED);
		  
s_we<=s_pre_re;

cont2:CONTROLLER_FAST
    Port MAP( 
        RST        => s_BUT,
        CLK        => s_dac_CLK,
        PRE_FULL   => s_pre_full,
        FIFO_RE    => s_re,
        FIFO_WE    => open, --s_we,
        FIFO_FULL  => s_full,
        FIFO_LOOP  => s_fifo_loop,
        FIFO_RST   => s_fifo_rst);

sum_norm1:SUM_NORM
    Port Map( 
        C1      =>  s_sum_norm_1,
        C2      =>  s_sum_norm_2,
        C3      =>  s_sum_norm_3,
        C4      =>  s_sum_norm_4,
        C5      =>  s_sum_norm_5,
        C6      =>  s_sum_norm_6,
        C7      =>  s_sum_norm_7,
        C8      =>  s_sum_norm_8,
        C9      =>  s_sum_norm_9,
        C10     =>  s_sum_norm_10,
        C11     =>  s_sum_norm_11,
        C12     =>  s_sum_norm_12,
        C13     =>  s_sum_norm_13,
        C14     =>  s_sum_norm_14,
        C15     =>  s_sum_norm_15,
        C16     =>  s_sum_norm_16,
        SW_TOT  =>  s_sw_tot,
        Dout    =>  s_dout_sum_norm);        
 
fifo1:FIFO
    PORT MAP(
        clk       =>s_dac_clk,
        rst       =>s_fifo_rst,
        din       =>s_fifo_din,
        wr_en     =>s_we,
        rd_en     =>s_re,
        dout      =>s_dout,
        full      => open,
        empty     => OPEN,
        prog_full =>s_full);
        
fifo2: PRE_FIFO
    PORT MAP(
        rst       =>s_pre_rst,
        wr_clk    =>s_clk,
        rd_clk    =>s_dac_clk,
        din       =>s_dout_sum_norm,
        wr_en     =>s_pre_we,
        rd_en     =>s_pre_re,
        dout      =>s_pre_dout,
        full      =>open,
        empty     =>open,
        prog_full =>s_pre_full);
		  
dbnc: DEBOUNCE
	port map(
		  clk			=> s_CLK,
		  reset     => '0',
		  button		=> BUT,
		  result    => s_BUT);
 
	with SW(15) select
		s_sum_norm_1 <= s_rom_1      when '1',
						    "0000000000" when others; 
	with SW(14) select
		s_sum_norm_2 <= s_rom_2      when '1',
						    "0000000000" when others; 
	with SW(13) select
		s_sum_norm_3 <= s_rom_3      when '1',
						    "0000000000" when others; 
	with SW(12) select
		s_sum_norm_4 <= s_rom_4      when '1',
						    "0000000000" when others; 
	with SW(11) select
		s_sum_norm_5 <= s_rom_5      when '1',
						    "0000000000" when others; 
	with SW(10) select
		s_sum_norm_6 <= s_rom_6      when '1',
						    "0000000000" when others; 
	with SW(9) select
		s_sum_norm_7 <= s_rom_7      when '1',
						    "0000000000" when others; 
	with SW(8) select
		s_sum_norm_8 <= s_rom_8      when '1',
						    "0000000000" when others; 
	with SW(7) select
		s_sum_norm_9 <= s_rom_9      when '1',
						    "0000000000" when others; 
	with SW(6) select
		s_sum_norm_10 <= s_rom_10    when '1',
						    "0000000000" when others; 
	with SW(5) select
		s_sum_norm_11 <= s_rom_11    when '1',
						    "0000000000" when others; 
	with SW(4) select
		s_sum_norm_12 <= s_rom_12    when '1',
						    "0000000000" when others; 
	with SW(3) select
		s_sum_norm_13 <= s_rom_13    when '1',
						    "0000000000" when others; 
	with SW(2) select
		s_sum_norm_14 <= s_rom_14    when '1',
						    "0000000000" when others; 
	with SW(1) select
		s_sum_norm_15 <= s_rom_15    when '1',
						    "0000000000" when others; 
	with SW(0) select
		s_sum_norm_16 <= s_rom_16    when '1',
						    "0000000000" when others;

	s_sw_tot<=("0000"&SW(0))+("0000"&SW(1))+("0000"&SW(2))+("0000"&SW(3))+("0000"&SW(4))+("0000"&SW(5))+("0000"&SW(6))+("0000"&SW(7))+("0000"&SW(8))+("0000"&SW(9))+("0000"&SW(10))+("0000"&SW(11))+("0000"&SW(12))+("0000"&SW(13))+("0000"&SW(14))+("0000"&SW(15));

	with s_fifo_loop select
		s_fifo_din<=s_dout     when '1',
					   s_pre_dout when others;
  
LED<=s_led;
DATA_OUT<=s_dout;

end Behavioral;
