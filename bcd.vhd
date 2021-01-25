----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:59:23 01/25/2021 
-- Design Name: 
-- Module Name:    bcd - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd is
Port (
BCDin : in STD_LOGIC_VECTOR (3 downto 0);  -- Slide Switch
digit : out STD_LOGIC_VECTOR (3 downto 0);        -- Enable 4 digit
Seven_Segment : out STD_LOGIC_VECTOR (7 downto 0)); -- 7 Segments and Dot LEDs
end bcd;

architecture Behavioral of bcd is

begin
digit <= "1111"; 
process(BCDin) begin
case BCDin is
when "0000" =>
Seven_Segment <= "00000011"; --0
when "0001" =>
Seven_Segment <= "10011111"; --1
when "0010" =>
Seven_Segment <= "00100101"; --2
when "0011" =>
Seven_Segment <= "00001101"; --3
when "0100" =>
Seven_Segment <= "10011001"; --4
when "0101" =>
Seven_Segment <= "01001001"; --5
when "0110" =>
Seven_Segment <= "01000001"; --6
when "0111" =>
Seven_Segment <= "00011111"; --7
when "1000" =>
Seven_Segment <= "00000001"; --8
when "1001" =>
Seven_Segment <= "00001001"; --9
when others =>
Seven_Segment <= "11111111"; --null
end case;
end process;
end Behavioral;

