--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:13:22 05/19/2014
-- Design Name:   
-- Module Name:   /home/amer/Nexys3/TCP/testingGBIT.vhd
-- Project Name:  TCP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gigabit_ethernet
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
 
ENTITY testingGBIT IS
END testingGBIT;
 
ARCHITECTURE behavior OF testingGBIT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gigabit_ethernet
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         CLK_125_MHZ : IN  std_logic;
         GTXCLK : OUT  std_logic;
         TXCLK : IN  std_logic;
         TXER : OUT  std_logic;
         TXEN : OUT  std_logic;
         TXD : OUT  std_logic_vector(7 downto 0);
         PHY_RESET : OUT  std_logic;
         RXCLK : IN  std_logic;
         RXER : IN  std_logic;
         RXDV : IN  std_logic;
         RXD : IN  std_logic_vector(7 downto 0);
         TX : IN  std_logic_vector(15 downto 0);
         TX_STB : IN  std_logic;
         TX_ACK : OUT  std_logic;
         RX : OUT  std_logic_vector(15 downto 0);
         RX_STB : OUT  std_logic;
         RX_ACK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal CLK_125_MHZ : std_logic := '0';
   signal TXCLK : std_logic := '0';
   signal RXCLK : std_logic := '0';
   signal RXER : std_logic := '0';
   signal RXDV : std_logic := '0';
   signal RXD : std_logic_vector(7 downto 0) := (others => '0');
   signal TX : std_logic_vector(15 downto 0) := (others => '0');
   signal TX_STB : std_logic := '0';
   signal RX_ACK : std_logic := '0';

 	--Outputs
   signal GTXCLK : std_logic;
   signal TXER : std_logic;
   signal TXEN : std_logic;
   signal TXD : std_logic_vector(7 downto 0);
   signal PHY_RESET : std_logic;
   signal TX_ACK : std_logic;
   signal RX : std_logic_vector(15 downto 0);
   signal RX_STB : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
   constant CLK_125_MHZ_period : time := 8 ns;
   constant GTXCLK_period : time := 10 ns;
   constant TXCLK_period : time := 10 ns;
   constant RXCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gigabit_ethernet PORT MAP (
          CLK => CLK,
          RST => RST,
          CLK_125_MHZ => CLK_125_MHZ,
          GTXCLK => GTXCLK,
          TXCLK => TXCLK,
          TXER => TXER,
          TXEN => TXEN,
          TXD => TXD,
          PHY_RESET => PHY_RESET,
          RXCLK => RXCLK,
          RXER => RXER,
          RXDV => RXDV,
          RXD => RXD,
          TX => TX,
          TX_STB => TX_STB,
          TX_ACK => TX_ACK,
          RX => RX,
          RX_STB => RX_STB,
          RX_ACK => RX_ACK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   CLK_125_MHZ_process :process
   begin
		CLK_125_MHZ <= '0';
		wait for CLK_125_MHZ_period/2;
		CLK_125_MHZ <= '1';
		wait for CLK_125_MHZ_period/2;
   end process;
 
   GTXCLK_process :process
   begin
		GTXCLK <= '0';
		wait for GTXCLK_period/2;
		GTXCLK <= '1';
		wait for GTXCLK_period/2;
   end process;
 
   TXCLK_process :process
   begin
		TXCLK <= '0';
		wait for TXCLK_period/2;
		TXCLK <= '1';
		wait for TXCLK_period/2;
   end process;
 
   RXCLK_process :process
   begin
		RXCLK <= '0';
		wait for RXCLK_period/2;
		RXCLK <= '1';
		wait for RXCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;      
         RX_ACK <= '0' ;
			      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;      
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--1
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;         
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;      
         RX_ACK <= '0' ;	--2
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;         
         RX_ACK <= '0' ;	--3
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"D5" ; --Preamble----------------------
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
			--00 
      wait for 10 ns;   -------------data-----------------      
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;--00
          
         TX <= x"3263" ;
         TX_STB <= '0' ;         
         RX_ACK <= '0' ;--4
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"01" ;--01 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"02" ;--02
          
         TX <= x"3263" ;
         TX_STB <= '1' ;       
         RX_ACK <= '0' ;	--5
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"03" ;-- 03 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"04" ;--04 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--6	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"05" ;--05 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;--00 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--7	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"18" ;--18 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"f3" ;--f3
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8	-------------	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"52" ;-- 52 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;--52
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"f1" ;--f1 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;       
         RX_ACK <= '0' ;	--5
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"30" ;--30 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;--30
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"08" ;--08 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--08	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"06" ;--06 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;--06
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;--00 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--01	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"01" ;--01          
         TX <= x"6a92" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"08" ;----08 
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--00	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;--00
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--06	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"06" ;-- 
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--04
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"06" ;--06 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--00			
			---
			wait for 30 ms;
wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"04" ;--04 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;      
         RX_ACK <= '0' ;--01
			      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;--00 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;      
         RX_ACK <= '0' ;--00
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"01" ;--01 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--18
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;--00 
          
         TX <= x"3263" ;
         TX_STB <= '0' ;         
         RX_ACK <= '0' ;--f3
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"18" ;--18 
          
         TX <= x"3263" ;
         TX_STB <= '0' ;      
         RX_ACK <= '0' ;	--52
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"f3" ;--f3 
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--f1
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"52" ;--52 
          
         TX <= x"3263" ;
         TX_STB <= '0' ;         
         RX_ACK <= '0' ;	--30
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"f1" ;--f1 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;--c0
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"30" ;--30 
          
         TX <= x"3263" ;
         TX_STB <= '0' ;         
         RX_ACK <= '0' ;--a8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"c0" ;--c0 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;--00
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"a8" ;--a8 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;       
         RX_ACK <= '0' ;	--69
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;--00 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;--00
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"69" ;--69
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--01	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;----00 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;--02
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"01" ;--01 
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--03	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"02" ;--02         
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;--04
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"03" ;-- 03 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--05	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"04" ;--04 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;--c0
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"05" ;--05 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;       
         RX_ACK <= '0' ;	--a8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"c0" ;--c0 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;--00
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"a8" ;--a8 
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--77	
      wait for 10 ns; ----- end Frame       
         RST <= '0' ;--- CRC
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;--00
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--e9 
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"77" ;-- 77 
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--ac	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"e9" ;--E9
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ; --ab
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"ac" ;--AC
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '1' ;	--61	
      wait for 10 ns;     
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"ab" ;--AB
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--7	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"61" ;--61
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 100 ns;------------- End of CRC ----------------------         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"22" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '1' ;	--8	
wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;      
         RX_ACK <= '0' ;
			      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;      
         RX_ACK <= '0' ;
      wait for 10 ns; ------Tx        
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--1
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;         
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;      
         RX_ACK <= '0' ;	--2
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"55" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;         
         RX_ACK <= '0' ;	--3
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"D5" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;         
         RX_ACK <= '0' ;--4
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"10" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"20" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;       
         RX_ACK <= '0' ;	--5
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"30" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"40" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--6	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"50" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--7	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"81" ;
          
         TX <= x"3d63" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"3f" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--8	-------------	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"25" ;
          
         TX <= x"3a63" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"1f" ;
          
         TX <= x"1766" ;
         TX_STB <= '1' ;       
         RX_ACK <= '0' ;	--5
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"03" ;
          
         TX <= x"ddee" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"80" ;
          
         TX <= x"d4e6" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--6	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"60" ;
          
         TX <= x"b7b8" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;
          
         TX <= x"326e" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--7	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"10" ;
          
         TX <= x"3ca3" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"80" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--8	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"60" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;	--7	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"40" ;
          
         TX <= x"3263" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"10" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8			
---------------------------------------
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"81" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"3f" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8	
----------
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"25" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"1f" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"03" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0c" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"8a" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"96" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"10" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"20" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"30" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"40" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"50" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0c" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"8a" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"77" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"e9" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"ac" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"ab" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"61" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;
          
         TX <= x"dac8" ;
         TX_STB <= '0' ;        
         RX_ACK <= '1' ;	--8	
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"00" ;
          
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"10" ;
          
         TX <= x"897d" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8			
      wait;
   end process;

END;
