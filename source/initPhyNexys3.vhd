----------------------------------------------------------------------------------
-- Initialise the Nexys3 board Phy (smcs 8710A)
-- Author: Amer Al-Canaan
--
---
--- E-mail: amer_c1@hotmail.com
--- License: MIT
--- Copyright: Copyright (C) Amer Al-Canaan 2014
-- Create Date:    06:40:19 04/05/2014 
-- Design Name: 
-- Module Name:    initPhyNexys3 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: This module provides the necessary timing signals to
-- initialise the Phy chip LAN8710A (Nexys3 board) during POR (Power 
-- On Reset) with adequate configuration modes. The minimum time for 
-- this operation is 25 ms, but since the input signals for the 
-- configurations are provided by the FPGA it seems that the minmum 
-- time needed is around 50 ms.
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

entity initPhyNexys3 is
port (clk 			: in std_logic;
		reset			: in std_logic; -- Global reset
		
		phy_reset	: out std_logic; -- To PhyReset pin
		out_en  		: out std_logic);
		
end initPhyNexys3;

architecture Behavioral of initPhyNexys3 is
signal tmpreset : std_logic := '1';
signal tmpouten : std_logic := '0';

begin

process (clk)
variable Cnt : natural range 0 to 1004000:=0; ---Around 20 when clock is 50 MHz

begin

if rising_edge(clk) then
	
	if (reset = '1') then
		Cnt := 0;
		tmpreset <= '1';
		tmpouten <= '1';
	else
	
   if (Cnt <= 1004000) then	
		Cnt := Cnt + 1;
		else Cnt := Cnt;
	end if;
	
	case Cnt is			
		
		when 0800000  => tmpreset <= '0'; tmpouten <= '1';  --(16 ms)
		when 0800100  => tmpreset <= '0'; tmpouten <= '0';  --(16.002 ms)
		when 1000000  => tmpreset <= '1'; tmpouten <= '0';  --(20 ms)
		when 1004000  => tmpreset <= '1'; tmpouten <= '1';  --(20.08 ms)		
		when others   => tmpreset <= tmpreset; tmpouten <= tmpouten;
	end case;

	end if;
end if;
end process;
	phy_reset <= tmpreset;
	out_en 	 <= tmpouten;
end Behavioral;