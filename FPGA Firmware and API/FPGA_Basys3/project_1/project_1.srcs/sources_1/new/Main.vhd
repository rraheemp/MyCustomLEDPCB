----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2022 12:50:19 AM
-- Design Name: 
-- Module Name: Main - Behavioral
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY Main IS
    PORT (
        a, b, c, d   : IN STD_LOGIC;
        UsrSelection : IN STD_LOGIC_VECTOR  (3 DOWNTO 0);
                  an : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END Main;

ARCHITECTURE Behavioral OF Main IS

BEGIN

    PROCESS (UsrSelection)
    BEGIN
        CASE UsrSelection IS
            WHEN "0000" =>
                seg <= "0000001"; --0

            WHEN "0001" =>
                seg <= "1001111"; --1

            WHEN "0010" =>
                seg <= "0010010"; --2

            WHEN "0011" =>
                seg <= "0000110"; --3

            WHEN "0100" =>
                seg <= "1001100"; --4

            WHEN "0101" =>
                seg <= "0100100"; --5

            WHEN "0110" =>
                seg <= "0100000"; --6

            WHEN "0111" =>
                seg <= "0001111"; --7

            WHEN "1000" =>
                seg <= "0000000"; --8

            WHEN "1001" =>
                seg <= "0000100"; --9

            WHEN OTHERS =>
                seg <= "1111111"; --null
        END CASE;

    END PROCESS;

END Behavioral;