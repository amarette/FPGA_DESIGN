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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_DAWG is
    Port ( SW      : in STD_LOGIC_VECTOR (15 downto 0);
           BUT     : in STD_LOGIC;
           CLK_IN  : in STD_LOGIC;
           DAC_CLK : out STD_LOGIC;
           O_0     : out STD_LOGIC;
           O_1     : out STD_LOGIC;
           O_2     : out STD_LOGIC;
           O_3     : out STD_LOGIC;
           O_4     : out STD_LOGIC;
           O_5     : out STD_LOGIC;
           O_6     : out STD_LOGIC;
           O_7     : out STD_LOGIC;
           O_8     : out STD_LOGIC;
           O_9     : out STD_LOGIC);
end TOP_DAWG;

architecture Behavioral of TOP_DAWG is

component clk_wiz_0 
    Port ( reset    : in  STD_LOGIC;
           clk_in1  : in  STD_LOGIC;
           clk_out1 : out STD_LOGIC;
           clk_out2 : out STD_LOGIC);
    end component;

component CONTROLLER
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
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_2
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_3
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_4
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_5
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_6
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_7
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_8
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_9
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_10
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_11
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_12
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_13
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_14
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_15
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

component ROM_16
    PORT (clka  : IN STD_LOGIC;
          addra : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
end component;

--------------------SIGNALS----------------------
signal s_addr          : STD_LOGIC_VECTOR(5 downto 0);
signal s_sw_tot        : STD_LOGIC_VECTOR(4 downto 0);
signal s_clk           : STD_LOGIC;
signal s_dac_clk       : STD_LOGIC;
signal s_fifo_ctrl     : STD_LOGIC;
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
signal s_fifo_loop     : STD_LOGIC;
signal S_din_pre_fifo  : STD_LOGIC_VECTOR(9downto 0);

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

signal i : integer:=0;

begin

clk1:clk1 
    Port MAP( 
        reset    => '0',
        clk_in1  => CLK_IN,
        clk_out1 => s_CLK,
        clk_out2 => s_DAC_CLK);

rom1:ROM_1
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_1);
rom2:ROM_2
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_2);
rom3:ROM_3
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_3);
rom4:ROM_4
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_4);
rom5:ROM_5
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_5);
rom6:ROM_6
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_6);
rom7:ROM_7
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_7);
rom8:ROM_8
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_8);
rom9:ROM_9
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_9);
rom10:ROM_10
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_10);
rom11:ROM_11
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_11);
rom12:ROM_12
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_12);
rom13:ROM_13
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_13);
rom14:ROM_14
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_14);
rom15:ROM_15
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_15);
rom16:ROM_16
    Port MAP(
        clka  => s_CLK,
        addra => s_addr,
        douta => S_rom_16);

cont1:CONTROLLER
    Port MAP( 
        RST        => BUT,
        CLK        => s_dac_CLK, 
        FIFO_CTRL  => s_fifo_ctrl,
        ADDR       => s_addr,
        PRE_RE     => s_pre_re,
        PRE_WE     => s_pre_we,
        PRE_FULL   => s_pre_full,
        FIFO_RE    => s_re,
        FIFO_WE    => s_we,
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
        din       =>s_pre_dout,
        wr_en     =>s_we,
        rd_en     =>s_re,
        dout      =>s_dout,
        full      => open,
        empty     => OPEN,
        prog_full =>s_full);
        
fifo2: PRE_FIFO
    PORT MAP(
        rst       =>s_fifo_rst,
        wr_clk    =>s_clk,
        rd_clk    =>s_dac_clk,
        din       =>s_din_pre_fifo,
        wr_en     =>s_pre_we,
        rd_en     =>s_pre_re,
        dout      =>s_pre_dout,
        full      =>open,
        empty     =>open,
        prog_full =>s_pre_full);
 
Process (BUT)
begin
    if (BUT = '1') then
        s_sw_tot <= "00000";
    else
        if(SW(0)='1') then
            s_sum_norm_1<=s_rom_1;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_1<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(1)='1') then
            s_sum_norm_2<=s_rom_2;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_2<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(2)='1') then
            s_sum_norm_3<=s_rom_3;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_3<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(3)='1') then
            s_sum_norm_4<=s_rom_4;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_4<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(4)='1') then
            s_sum_norm_5<=s_rom_5;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_5<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(5)='1') then
            s_sum_norm_6<=s_rom_6;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_6<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(6)='1') then
            s_sum_norm_7<=s_rom_7;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_7<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(7)='1') then
            s_sum_norm_8<=s_rom_8;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_8<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(8)='1') then
            s_sum_norm_9<=s_rom_9;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_9<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(9)='1') then
            s_sum_norm_10<=s_rom_10;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_10<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(10)='1') then
            s_sum_norm_11<=s_rom_11;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_11<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(11)='1') then
            s_sum_norm_12<=s_rom_12;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_12<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(12)='1') then
            s_sum_norm_13<=s_rom_13;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_13<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(13)='1') then
            s_sum_norm_14<=s_rom_14;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_14<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(14)='1') then
            s_sum_norm_15<=s_rom_15;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_15<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
        if(SW(15)='1') then
            s_sum_norm_16<=s_rom_16;
            s_sw_tot<=s_sw_tot+1;
        else
            s_sum_norm_16<="0000000000";
            s_sw_tot<=s_sw_tot;
        end if;
    end if;
end process;

process (s_fifo_loop)
begin
    if (s_fifo_loop='1') then s_din_pre_fifo<=s_dout;
    else s_din_pre_fifo<=s_dout_sum_norm;
    end if;
end process;
DAC_CLK<=s_dac_clk;  

O_0<=s_dout(0);
O_1<=s_dout(1);
O_2<=s_dout(2);
O_3<=s_dout(3);
O_4<=s_dout(4);
O_5<=s_dout(5);
O_6<=s_dout(6);
O_7<=s_dout(7);
O_8<=s_dout(8);
O_9<=s_dout(9);

end Behavioral;
