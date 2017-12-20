
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_3 is
port (CLK : in std_logic;
      EN : in std_logic;
      ADDR : in std_logic_vector(5 downto 0);
      DATA : out std_logic_vector(9 downto 0));
end ROM_3;

architecture syn of ROM_3 is
    type rom_type is array (0 to 41) of std_logic_vector (9 downto 0);                 
    signal ROM : rom_type:= ( "1000000000", "1011011101", "1110001111", "1111110010", "1111110010",
										"1110001111", "1011011101", "1000000000", "0100100010", "0001110000", 
										"0000001101", "0000001101", "0001110000", "0100100010", "0111111111", 
										"1011011101", "1110001111", "1111110010", "1111110010", "1110001111", 
										"1011011101", "1000000000", "0100100010", "0001110000", "0000001101", 
										"0000001101", "0001110000", "0100100010", "0111111111", "1011011101", 
										"1110001111", "1111110010", "1111110010", "1110001111", "1011011101", 
										"1000000000", "0100100010", "0001110000", "0000001101", "0000001101", 
										"0001110000", "0100100010");
	 
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

				