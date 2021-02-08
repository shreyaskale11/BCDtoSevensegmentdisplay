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
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd is
Port (
BCDin0 : in STD_LOGIC_VECTOR (3 downto 0);
BCDin1 : in STD_LOGIC_VECTOR (3 downto 0);  -- Slide Switch
BCDin2 : in STD_LOGIC_VECTOR (3 downto 0);
BCDin3 : in STD_LOGIC_VECTOR (3 downto 0);
--i : in std_logic;
reset: IN STD_LOGIC;
clk: IN STD_LOGIC;
sel: out STD_LOGIC;
digit : out STD_LOGIC_VECTOR (3 downto 0);  -- Enable 4 digit
Seven_Segment : out STD_ULOGIC_VECTOR (7 downto 0)); -- 7 Segments and Dot LEDs
end bcd;

architecture Behavioral of bcd is

signal counter :  unsigned(15 downto 0) := (others =>'0');

TYPE State_type is (A, B, C, D);  -- Define the states
SIGNAL State : State_Type :=A;    -- Create a signal that uses 
						      -- the different states
type array44 is array(0 to 3)of std_logic_vector(3 downto 0);
type array47 is array(0 to 3)of std_ulogic_vector(7 downto 0);
signal number :  array44 := (others =>(others =>'0'));
signal segment :  array47 := (others =>(others =>'0'));

begin
--digit <= "1111"; 
number(0) <= BCDin0;
number(1) <= BCDin1;
number(2) <= BCDin2;
number(3) <= BCDin3;
translate_loop: for I in 0 to 3 generate
begin
	with number(I) select segment(I) <=
		"00000011" when "0000",
		"10011111"when "0001",
		"00100101"when "0010",
		"00001101"when "0011",
		"10011001"when "0100",
		"01001001"when "0101",
		"01000001"when "0110",
		"00011111"when "0111",
		"00000001"when "1000",
		"00001001"when "1001",
		"11111111"when others;
end generate;
Seven_Segment(0) <= segment(0);
	process(clk) begin
--State <= A;
		if (rising_edge(clk)) then
			if (reset = '1') then
				counter<= (others =>'0');
			else
				if(counter = 50_000) then
					counter <= (others => '0');
					case State is
						when A => State <= B;
						when B => State <= C;
						when C => State <= D;
						when D => State <= A;
						when others => State <= A;
					end case;
				else
					counter <= counter + 1;
				end if;
			end if;
		end if;
	end process;
	
end Behavioral;

