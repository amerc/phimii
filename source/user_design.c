////////////////////////////////////////////////////////////////////////////////
//
//  CHIPS-2.0 USER DESIGN
//
//  :Author: Jonathan P Dawson
//  :Date: 17/10/2013
//  :email: chips@jondawson.org.uk
//  :license: MIT
//  :Revised by Amer Al-Canaan 2014
//  :Copyright: Copyright (C) Jonathan P Dawson 2013
//
//  Simple Web application demo.
//
////////////////////////////////////////////////////////////////////////////////

void put_socket(unsigned i){
	output_socket(i);
}
void stdout_put_char(unsigned i){
	output_rs232_tx(i);
}

#include "print.h"
#include "HTTP.h"

int find(unsigned string[], unsigned search, unsigned start, unsigned end){
	int value = start;
	while(string[value]){
	       print_decimal(string[value]); print_string("\n");
	       print_decimal(value); print_string("\n");
	       if(value == end) return -1;
	       if(string[value] == search) return value;
	       value++;
	}
	return -1;
}

void user_design()
{
	//simple echo application
	unsigned length, datout;
	unsigned i, index, pageint;
	unsigned data[1460];
	unsigned word;
	unsigned switches = 0;
	unsigned buttons = 0;
	unsigned leds = 0;
	unsigned start, end;

	unsigned page[] = 
"<html>\
<head>\
<title>Demo on NEXYS3 board using Chips-2.0</title>\
</head>\
<body>\
<h1>Welcome </h1>\
<p>Welcome to the simple Web application on FPGA Nexys3 board!</p>\
<p>By Amer Al-Canaan, June 2014</p>\
<form>\
	<input type=\"checkbox\" name=\"led1\" value=\"A\">led 0</input>\
	<input type=\"checkbox\" name=\"led2\" value=\"B\">led 1</input>\
	<input type=\"checkbox\" name=\"led3\" value=\"C\">led 2</input>\
	<input type=\"checkbox\" name=\"led4\" value=\"D\">led 3</input>\
	<button type=\"sumbit\" value=\"Submit\">Update LEDs</button>\
</form>\
<br><h3>Switch Status; 00000000   </h3>\
<h3>Button Status; 0000    </h3>\
<p>This        <a href=\"https:\/\/github.com\/amerc\/phimii\">project</a>\
 is powered by <a href=\"http://pyandchips.org\">Chips-2.0</a>.<br>\
Amer Al-Canaan<br><img src=\"data:image/gif;base64,R0lGODlhFAAdAMIGAAAAAIAAAICAAICA//+AAP+\
AgP///////yH+GkNyZWF0ZWQgd2l0aCBHSU1QIG9uIGEgTWFjACH5BAEKAAcALAAAAAAUAB0A\
AAOdGGrcNlBIASpZDMIwO71Bow2cJwHGsjEEwZQToMyhY8c0ZjdxB+2OwakDtBGGk6LjSCEqW\
UjJE9pMMgrYbJYJECgEjVagBfp+Xg0aw/Sb5gLt5zuurKXGYKPrTcsv93wKQn4GZCBeCmKDRW\
JfZItAjRxkVjtiEmNiYS1tlwKGhIVmEzOXRqOYiRehhasmMwJ0LCWDFV2xA5a0JxUCCQA7\" alt\
=\"AM9.gif\" WIDTH=60 HEIGHT=90/></p>\
</body>\
</html>";

	print_string("Welcome to the Nexys3 Chips-2.0 demo!\n");
	print_string("Connect your Web browser to 192.168.0.119\n");
	while(1){
		// Read request from socket
		length = input_socket();
		index = 0;
		for(i=0;i<length;i+=2){
			word = input_socket();
			data[index] = (word >> 8) & 0xff;
			index++;
			data[index] = (word) & 0xff;
			index++;
		}

		//Get LED values
		//==============

		if(    data[0] == 'G' 
		   &&  data[1] == 'E' 
		   &&  data[2] == 'T' 
		   &&  data[3] == ' ' 
		   &&  data[4] == '/'
		   && (data[5] == '?' || data[5] == ' ')){
			start=5;
			end=find(data, ' ', start, index);
			leds = 0;
			if(find(data, 'A', start, end) != -1) leds |= 1;
			if(find(data, 'B', start, end) != -1) leds |= 2;
			if(find(data, 'C', start, end) != -1) leds |= 4;
			if(find(data, 'D', start, end) != -1) leds |= 8;

			output_leds(leds);

			//read switch values
			//==================
			switches = ~input_switches();
			//find first ';'
			index = find(page, ';', 0, 1460);
			index+=2;
			//insert switch values
			if(switches & 128) page[index] = '0';
			else page[index] = '1';
			index ++;
			if(switches & 64) page[index] = '0';
			else page[index] = '1';
			index ++;
			if(switches & 32) page[index] = '0';
			else page[index] = '1';
			index ++;
			if(switches & 16) page[index] = '0';
			else page[index] = '1';
			index ++;
			if(switches & 8) page[index] = '0';
			else page[index] = '1';
			index ++;
			if(switches & 4) page[index] = '0';
			else page[index] = '1';
			index ++;
			if(switches & 2) page[index] = '0';
			else page[index] = '1';
			index ++;
			if(switches & 1) page[index] = '0';
			else page[index] = '1';

			//read button values
			//==================
			buttons = ~input_buttons();
			//find next ';'
			index = find(page, ';', index+1, 1460);
			index+=2;
			//insert button values
			if(buttons & 1) page[index] = '0';
			else page[index] = '1';
			index ++;
			if(buttons & 2) page[index] = '0';
			else page[index] = '1';
			index ++;
			if(buttons & 4) page[index] = '0';
			else page[index] = '1';
			index ++;
			if(buttons & 8) page[index] = '0';
			else page[index] = '1'; 
			index ++;   
			 page[index] = ' '; 
			 index ++;   
			 page[index] = ' '; 
			 index ++;  
			 //unsigned rem;
			 	//while (length > 0){
					//rem = length%16;
					//length = length/16;
					//page[index] = dec_hex(length, rem);
					//index++;
					////len++;
				//}                   
                        
			HTTP_OK(page);
                        
		}
		else {
			HTTP_Not_Found();
		}

	}

        //dummy access to peripherals
	index = input_rs232_rx();
}
