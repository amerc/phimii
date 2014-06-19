--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:08:11 04/06/2014
-- Design Name:   
-- Module Name:   /home/amer/Nexys3/TCP/ininex.vhd
-- Project Name:  TCP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: initPhyNexys3
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ininex IS
END ininex;
 
ARCHITECTURE behavior OF ininex IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT initPhyNexys3
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         phy_reset : OUT  std_logic;
         out_en : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal phy_reset : std_logic;
   signal out_en : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: initPhyNexys3 PORT MAP (
          clk => clk,
          reset => reset,
          phy_reset => phy_reset,
          out_en => out_en
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*400;

      -- insert stimulus here 
--reset <= '1';
-----
--		when 320		  => tmpreset <= '1'; tmpouten <= '1';	(32.05 ns)	
--		when 131147   => tmpreset <= '0'; tmpouten <= '1';  (2.62 ms)
--		when 1250000  => tmpreset <= '0'; tmpouten <= '0';(25 ms)
--		when 1499900  => tmpreset <= '0'; tmpouten <= '0'; (30 ms)
--		when 1499998  => tmpreset <= '1'; tmpouten <= '0';  (40 ns)
--		when 1500000  => tmpreset <= '1'; tmpouten <= '1';  (20 ns)
wait for clk_period*4;
reset <= '0';
wait for 40 ns;
reset <= '0';
wait for 60 ms;
reset <= '0';
wait for 4 ns;
reset <= '0';
wait for 58 ms;
reset <= '0';
wait for 250 ms;
reset <= '1';
wait for 5 ms;
--reset <= '1';
wait for 6 ms;
reset <= '0';
wait for 45 ms;
      wait;
   end process;

END;
