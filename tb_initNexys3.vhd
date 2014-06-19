--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:07:31 06/04/2014
-- Design Name:   
-- Module Name:   /home/amer/Nexys3/TCP_2/tb_initNexys3.vhd
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
 
ENTITY tb_initNexys3 IS
END tb_initNexys3;
 
ARCHITECTURE behavior OF tb_initNexys3 IS 
 
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
   constant clk_period : time := 10 ns;
 
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

      wait for clk_period*10;

      -- insert stimulus here 
wait for 1 ms;
  reset <= '0';

wait for 1 ms;
  reset <= '1';

wait for 60 ns;
  reset <= '0';

wait for 50 ms;
  reset <= '1';
 
wait for 40 ns;
  reset <= '0'; 
      wait;
   end process;

END;
