--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:11:12 05/19/2014
-- Design Name:   
-- Module Name:   /home/amer/Nexys3/TCP/testing_gbitethernet.vhd
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
 
ENTITY testing_gbitethernet IS
END testing_gbitethernet;
 
ARCHITECTURE behavior OF testing_gbitethernet IS 
 
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
         RS232_TX : OUT  std_logic
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

   -- Clock period definitions
   constant CLK_IN_period : time := 10 ns;
   constant RXCLK_period : time := 10 ns;
   constant TXCLK_period : time := 10 ns;
 
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
          TXEN => TXEN,
          TXER => TXER,
          PhyCol => PhyCol,
          GPIO_LEDS => GPIO_LEDS,
          GPIO_SWITCHES => GPIO_SWITCHES,
          GPIO_BUTTONS => GPIO_BUTTONS,
          RS232_RX => RS232_RX,
          RS232_TX => RS232_TX
        );

   -- Clock process definitions
   CLK_IN_process :process
   begin
		CLK_IN <= '0';
		wait for CLK_IN_period/2;
		CLK_IN <= '1';
		wait for CLK_IN_period/2;
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
      wait for 100 ns;	

      wait for 30 ms;

      -- insert stimulus here 
wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;      
         RX_ACK <= '0' ;
			      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;      
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--1
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;         
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;      
         RX_ACK <= '0' ;	--2
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;         
         RX_ACK <= '0' ;	--3
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;         
         RX_ACK <= '0' ;--4
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;       
         RX_ACK <= '0' ;	--5
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--6	
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--7	
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"D" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--8	-------------	
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"a" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"b" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;       
         RX_ACK <= '0' ;	--5
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"c" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"d" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--6	
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"e" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"f" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--7	
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"1" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"2" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '1' ;	--8	
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"f" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--7	
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"1" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '1' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"2" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '1' ;	--8			
      wait;
   end process;

END;
