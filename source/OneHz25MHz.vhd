--This is a clock divider code, just set the max-count value as per your requirenment.
--
--For ex. If I want 1Hz freq. set the max count to i/p freq value viz.
--1sec = 1Hz
--Then, to get time period of 1sec i.e. 1 Hz frequency set max-count to 240000 as shown below:
--
--1sec  =  100000000  -- for i/p frequency of 100 MHz.
--
--To get your desired frequency just calculate the maxcount with the formula given below:
--
--max_count = 100000000 * (1/your required frequency)
library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
 use IEEE.numeric_std.all;

 entity OneHz25MHz is
    Port (
           Clk      : in  std_logic;
           op       : out std_logic

    );
 end OneHz25MHz;

 architecture RTC of OneHz25MHz is
   constant max_count : natural := 25000000;  -- for 1 mHz
-- I used 50 MHz clock
  
 begin
      
    compteur : process(Clk)
        variable count : natural range 0 to max_count;
    begin
        
        if rising_edge(Clk) then
            if count < max_count/2 then
                op    <='1';
                count := count + 1;
            elsif count < max_count then
                op    <='0';
                count := count + 1;
            else
                count := 0;
                op    <='0';
            end if;
        end if;
    end process compteur;
 end RTC;