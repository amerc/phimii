--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:48:07 05/19/2014
-- Design Name:   
-- Module Name:   /home/amer/Nexys3/TCP/testing_ethernet.vhd
-- Project Name:  TCP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ethernet
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
 
ENTITY testing_ethernet IS
END testing_ethernet;
 
ARCHITECTURE behavior OF testing_ethernet IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ethernet
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         TXCLK : IN  std_logic;
         TXER : OUT  std_logic;
         TXEN : OUT  std_logic;
         TXD : OUT  std_logic_vector(3 downto 0);
         PHY_RESET : OUT  std_logic;
         RXCLK : IN  std_logic;
         RXER : IN  std_logic;
         RXDV : IN  std_logic;
         RXD : IN  std_logic_vector(3 downto 0);
         COL : IN  std_logic;
         TX : IN  std_logic_vector(15 downto 0);
         TX_STB : IN  std_logic;
         TX_ACK : OUT  std_logic;
         RX : OUT  std_logic_vector(15 downto 0);
         RX_STB : OUT  std_logic;
         RX_ACK : IN  std_logic;
			PhyCRS : in std_logic;
			BtnL : in std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal TXCLK : std_logic := '0';
   signal RXCLK : std_logic := '0';
   signal RXER : std_logic := '0';
   signal RXDV : std_logic := '0';
   signal RXD : std_logic_vector(3 downto 0) := (others => '0');
   signal COL : std_logic := '0';
   signal TX : std_logic_vector(15 downto 0) := (others => '0');
   signal TX_STB : std_logic := '0';
   signal RX_ACK : std_logic := '0';

 	--Outputs
   signal TXER : std_logic;
   signal TXEN : std_logic;
   signal TXD : std_logic_vector(3 downto 0);
   signal PHY_RESET : std_logic;
   signal TX_ACK : std_logic;
   signal RX : std_logic_vector(15 downto 0);
   signal RX_STB : std_logic;
	signal PhyCRS : std_logic;
	signal btnL : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
   constant TXCLK_period : time := 40 ns;
   constant RXCLK_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ethernet PORT MAP (
          CLK => CLK,
          RST => RST,
          TXCLK => TXCLK,
          TXER => TXER,
          TXEN => TXEN,
          TXD => TXD,
          PHY_RESET => PHY_RESET,
          RXCLK => RXCLK,
          RXER => RXER,
          RXDV => RXDV,
          RXD => RXD,
          COL => COL,
          TX => TX,
          TX_STB => TX_STB,
          TX_ACK => TX_ACK,
          RX => RX,
          RX_STB => RX_STB,
			 PhyCRS => PhyCRS,
			 BtnL => BtnL,
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
      wait for 40 ms;	
      -- insert stimulus here 
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;      
         RX_ACK <= '0' ; --1
			      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"ad63" ;
         TX_STB <= '0' ;      
         RX_ACK <= '0' ; --2
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--3
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;         
         RX_ACK <= '0' ; --4
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;      
         RX_ACK <= '0' ;	--5
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;  --6
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;         
         RX_ACK <= '0' ;	--7
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;  --8
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;         
         RX_ACK <= '0' ;--9
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ; --10
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;       
         RX_ACK <= '0' ;	--11
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ; --12
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--13	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ; --14
      wait for 10 ns;    
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"D" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--15	
      wait for 10 ns;  --------------------------- Data
 --00-		
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ; --00
      wait for 10 ns;         
         RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8	-------------	
--			01 02 03 04 05 00 18 f3 52 f1 30 08 06 00 01
--08 
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"8" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ; --01
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"2" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;       
         RX_ACK <= '0' ;	--5
--00 
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ; -- 02
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--6
--06 			
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"6" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ; ---03
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--7
--04 			
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"4" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ; --04
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--8
--00 	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--05	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--01 					
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"1" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--00	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--00 		
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;       
         RX_ACK <= '0' ;	--18
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--18 			
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"8" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--f3	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"1" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--f3 		
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"3" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--52	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"f" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--52 	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"2" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--f1	-------------	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--f1 				
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"1" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;       
         RX_ACK <= '0' ;	--30
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"f" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--	30 	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--08	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"3" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--c0 
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--06	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"c" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--a8 				
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"8" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--00	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"a" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--7
--00 		
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--01
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	
--69	--
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"9" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ; --08
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"6" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
----00 						
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--00	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--01 			
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"1" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ; --06	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--02 			
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"2" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--04
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--03 			
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"3" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--00
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--04 			
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"4" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--01	
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--05 
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--00
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--c0 		
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--18
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"c" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--a8 		
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"8" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--f3
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"a" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--00 				
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--77				
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"7" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--f1
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"7" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
-- E9				
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"9" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--30
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"e" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--AC			
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"c" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--c0
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"a" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--AB			
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"b" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--a8
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"a" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
--61			
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"1" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--00
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"6" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;  ----------------- End of test Rx Fame -----       
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"6" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--69
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--00
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"1" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--01
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"2" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--02
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"3" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--03
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"4" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--04
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"5" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--05
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"c" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;	--c0
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"8" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"a" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--a8
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--00
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"7" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"7" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--77
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"9" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"e" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--e9
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"c" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"a" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--ac
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"b" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"a" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--ab
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"1" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '1' ;
         RXD <= x"6" ;
         COL <= '0' ;
         TX <= x"3263" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;--61	
-------------------- DONE frame--------------
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '0' ;        
         RX_ACK <= '1' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
 wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;----------------- Tx			
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '1' ;        
         RX_ACK <= '0' ;--------------------			
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3863" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;
      wait for 10 ns;         
          RST <= '0' ;
         RXER <= '0' ;
         RXDV <= '0' ;
         RXD <= x"0" ;
         COL <= '0' ;
         TX <= x"3244" ;
         TX_STB <= '0' ;        
         RX_ACK <= '0' ;			
      wait;
   end process;

END;
