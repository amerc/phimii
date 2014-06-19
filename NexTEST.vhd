--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:20:44 04/10/2014
-- Design Name:   
-- Module Name:   /home/amer/Nexys3/TCP/NexTEST.vhd
-- Project Name:  TCP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NEXYS3
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
 
ENTITY NexTEST IS
END NexTEST;
 
ARCHITECTURE behavior OF NexTEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NEXYS3
    PORT(
         CLK_IN : IN  std_logic;
         RST : IN  std_logic;
         TX : OUT  std_logic;
         RX : IN  std_logic;
         PHY_RESET : OUT  std_logic;
         RXDV : IN  std_logic;
         RXER : INOUT  std_logic;
         RXCLK : INOUT  std_logic;
         RXD : INOUT  std_logic_vector(3 downto 0);
         TXCLK : IN  std_logic;
         TXD : OUT  std_logic_vector(3 downto 0);
         TXEN : OUT  std_logic;
         TXER : INOUT  std_logic;
         PhyCol : INOUT  std_logic;
         GPIO_LEDS : OUT  std_logic_vector(7 downto 0);
         GPIO_SWITCHES : IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS : IN  std_logic_vector(3 downto 0);
         RS232_RX : IN  std_logic;
         RS232_TX : OUT  std_logic;
			CRS			  : in    	std_logic;
			fx2Clk_pin	  : in    std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_IN : std_logic := '0';
   signal RST : std_logic := '0';
   signal RX : std_logic := '0';
   signal RXDV : std_logic := '0';
   signal TXCLK : std_logic := '0';
   signal GPIO_SWITCHES : std_logic_vector(7 downto 0) := (others => '0');
   signal GPIO_BUTTONS : std_logic_vector(3 downto 0) := (others => '0');
   signal RS232_RX : std_logic := '0';

	--BiDirs
   signal RXER : std_logic;
   signal RXCLK : std_logic;
   signal RXD : std_logic_vector(3 downto 0);
   signal TXER : std_logic;
   signal PhyCol : std_logic;

 	--Outputs
   signal TX : std_logic;
   signal PHY_RESET : std_logic;
   signal TXD : std_logic_vector(3 downto 0);
   signal TXEN : std_logic;
   signal GPIO_LEDS : std_logic_vector(7 downto 0);
   signal RS232_TX : std_logic;
	signal CRS	: 	std_logic;
	signal fx2Clk_pin	: 	std_logic;
   -- Clock period definitions
   constant CLK_IN_period : time := 10 ns;
   constant RXCLK_period : time := 40 ns;
   constant TXCLK_period : time := 40 ns;
	constant fx2Clk_pin_period : time := 20.8 ns;
	--
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NEXYS3 PORT MAP (
          CLK_IN => CLK_IN,
          RST => RST,
          TX => TX,
          RX => RX,
          PHY_RESET => PHY_RESET,
          RXDV => RXDV,
          RXER => RXER,
          RXCLK => RXCLK,
          RXD => RXD,
          TXCLK => TXCLK,
          TXD => TXD,
			 CRS => CRS,
          TXEN => TXEN,
          TXER => TXER,
          PhyCol => PhyCol,
          GPIO_LEDS => GPIO_LEDS,
          GPIO_SWITCHES => GPIO_SWITCHES,
          GPIO_BUTTONS => GPIO_BUTTONS,
          RS232_RX => RS232_RX,
          RS232_TX => RS232_TX,
			 fx2Clk_pin => fx2Clk_pin
        );

   -- Clock process definitions
   CLK_IN_process :process
   begin
		CLK_IN <= '0';
		wait for CLK_IN_period/2;
		CLK_IN <= '1';
		wait for CLK_IN_period/2;
   end process;
	
    fx2clk_process :process
   begin
		fx2Clk_pin <= '0';
		wait for fx2Clk_pin_period/2;
		fx2Clk_pin <= '1';
		wait for fx2Clk_pin_period/2;
   end process;
	
   RXCLK_process :process
   begin
		RXCLK <= '0';
		wait for RXCLK_period/2;
		RXCLK <= '1';
		wait for RXCLK_period/2;
   end process;
 
   TXCLK_process :process
   begin
		TXCLK <= '0';
		wait for TXCLK_period/2;
		TXCLK <= '1';
		wait for TXCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;
      -- insert stimulus here          
         RST <= '0';--: IN  std_logic;
         RX <= '0';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"8";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"da";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"f";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '0';--: IN  std_logic;
			wait for 40 ns;
			RST <= '0';--: IN  std_logic;
         RX <= '1';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"3";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"da";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"b";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '1';--: IN  std_logic;
			wait for 10 ms;
			RST <= '1';--: IN  std_logic;
         RX <= '0';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"5";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"da";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"e";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '1';--: IN  std_logic;
			wait for 5 ms;
			RST <= '1';--: IN  std_logic;
         RX <= '1';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"d";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"d6";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"f";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '0';--: IN  std_logic;
			wait for 10 ms;
			RST <= '1';--: IN  std_logic;
         RX <= '0';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"0";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"da";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"2";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '1';--: IN  std_logic;
			wait for 10 ms;
			RST <= '1';--: IN  std_logic;
         RX <= '0';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"1";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"da";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"0";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '1';--: IN  std_logic;
			
			wait for 10 ms;
			RST <= '0';--: IN  std_logic;
         RX <= '0';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"5";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"da";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"e";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '1';--: IN  std_logic;
			wait for 5 ms;
			RST <= '0';--: IN  std_logic;
         RX <= '1';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"d";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"d6";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"f";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '0';--: IN  std_logic;
			wait for 10 ms;
			RST <= '0';--: IN  std_logic;
         RX <= '0';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"0";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"da";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"2";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '1';--: IN  std_logic;
			wait for 10 ms;
			RST <= '1';--: IN  std_logic;
         RX <= '0';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"1";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"da";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"0";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '1';--: IN  std_logic;
			
			wait for 10 ms;
			RST <= '1';--: IN  std_logic;
         RX <= '0';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"3";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"da";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"e";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '1';--: IN  std_logic;
			wait for 5 ms;
			RST <= '0';--: IN  std_logic;
         RX <= '1';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"5";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"d6";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"f";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '0';--: IN  std_logic;
			wait for 10 ms;
			RST <= '0';--: IN  std_logic;
         RX <= '0';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"7";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"da";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"2";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '1';--: IN  std_logic;
			wait for 10 ms;
			RST <= '0';--: IN  std_logic;
         RX <= '0';--: IN  std_logic;
         RXDV <= '1';--: IN  std_logic;
         RXER <= '0';--: INOUT  std_logic;         
         RXD <= x"8";--: INOUT  std_logic_vector(3 downto 0);             
         TXER <= '0';--: INOUT  std_logic;
         PhyCol <= '0';--: INOUT  std_logic;         
         GPIO_SWITCHES <= x"da";--: IN  std_logic_vector(7 downto 0);
         GPIO_BUTTONS <= x"0";--: IN  std_logic_vector(3 downto 0);
         RS232_RX <= '1';--: IN  std_logic;
      wait;
   end process;

END;
