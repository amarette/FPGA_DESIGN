
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_11 is
port (CLK : in std_logic;
      EN : in std_logic;
      ADDR : in std_logic_vector(5 downto 0);
      DATA : out std_logic_vector(9 downto 0));
end ROM_11;

architecture syn of ROM_11 is
    type rom_type is array (0 to 41) of std_logic_vector (9 downto 0);                 
    signal ROM : rom_type:= ( "1000000000", "1111111110", "0110110011", "0000001101", "1010010110", 
										"1111011100", "0100100010", "0001000101", "1100100000", "1110001111", 
										"0010100100", "0010100100", "1110001111", "1100100000", "0001000101", 
										"0100100010", "1111011100", "1010010110", "0000001101", "0110110011", 
										"1111111110", "1000000000", "0000000001", "1001001100", "1111110010", 
										"0101101001", "0000100011", "1011011101", "1110111010", "0011011111", 
										"0001110000", "1101011011", "1101011011", "0001110000", "0011011111", 
										"1110111010", "1011011101", "0000100011", "0101101001", "1111110010", 
										"1001001100", "0000000001");
	 
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

				