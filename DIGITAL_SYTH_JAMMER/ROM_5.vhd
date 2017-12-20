
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_5 is
port (CLK : in std_logic;
      EN : in std_logic;
      ADDR : in std_logic_vector(5 downto 0);
      DATA : out std_logic_vector(9 downto 0));
end ROM_5;

architecture syn of ROM_5 is
    type rom_type is array (0 to 41) of std_logic_vector (9 downto 0);                 
    signal ROM : rom_type:= ( "1000000000", "1101011011", "1111111110", "1110001111", "1001001100", 
										"0011011111", "0000001101", "0001000101", "0101101001", "1011011101", 
										"1111011100", "1111011100", "1011011101", "0101101001", "0001000101", 
										"0000001101", "0011011111", "1001001100", "1110001111", "1111111110", 
										"1101011011", "1000000000", "0010100100", "0000000001", "0001110000", 
										"0110110011", "1100100000", "1111110010", "1110111010", "1010010110", 
										"0100100010", "0000100011", "0000100011", "0100100010", "1010010110", 
										"1110111010", "1111110010", "1100100000", "0110110011", "0001110000", 
										"0000000001", "0010100100");
	 
    signal rdata : std_logic_vector(9 downto 0);
begin

    rdata <= ROM(conv_integer(ADDR));

    process (CLK)
    begin
        if (CLK'event and CLK = '1') then
            if (EN = '1') then
                DATA <= rdata;
            end if;
        end if;
    end process;

end syn;

				