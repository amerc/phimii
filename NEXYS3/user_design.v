//////////////////////////////////////////////////////////////////////////////
//name : user_design
//input : input_switches:16
//input : input_buttons:16
//input : input_socket:16
//input : input_rs232_rx:16
//output : output_rs232_tx:16
//output : output_leds:16
//output : output_socket:16
//source_file : ../source/user_design.c
///===========
///
///Created by C2CHIP

//////////////////////////////////////////////////////////////////////////////
// Register Allocation
// ===================
//         Register                 Name                   Size          
//            0               variable digit_4              2            
//            1             variable significant            2            
//            2             HTTP_Not_Found return address            2            
//            3             variable header_length            2            
//            4                    array                    2            
//            5             HTTP_OK return address            2            
//            6                    array                    2            
//            7             variable header_length            2            
//            8             variable body_length            2            
//            9               variable length               2            
//            10               variable index               2            
//            11            variable packet_count            2            
//            12                   array                    2            
//            13                   array                    2            
//            14            find return address             2            
//            15            variable find return value            2            
//            16                   array                    2            
//            17              variable search               2            
//            18               variable start               2            
//            19                variable end                2            
//            20               variable value               2            
//            21                   array                    2            
//            22                   array                    2            
//            23            user_design return address            2            
//            24              variable length               2            
//            25                 variable i                 2            
//            26               variable index               2            
//            27                   array                    2            
//            28               variable word                2            
//            29             variable switches              2            
//            30              variable buttons              2            
//            31               variable leds                2            
//            32               variable start               2            
//            33                variable end                2            
//            34                   array                    2            
//            35                   array                    2            
//            36                   array                    2            
//            37             temporary_register             2            
//            38             temporary_register             2            
//            39             temporary_register             2            
//            40             temporary_register             4            
//            41             temporary_register             2            
//            42             temporary_register            252           
//            43             temporary_register            228           
//            44             temporary_register             10           
//            45             temporary_register             78           
//            46             temporary_register             86           
//            47             temporary_register             2            
//            48             temporary_register            2920          
//            49             temporary_register            2284          
//            50            put_socket return address            2            
//            51                 variable i                 2            
//            52            stdout_put_char return address            2            
//            53                 variable i                 2            
//            54            print_string return address            2            
//            55                   array                    2            
//            56                 variable i                 2            
//            57            print_udecimal return address            2            
//            58             variable udecimal              2            
//            59               variable digit               2            
//            60            variable significant            2            
//            61            print_decimal return address            2            
//            62              variable decimal              2            
//            63            variable socket_high            2            
//            64            variable socket_data            2            
//            65            socket_put_char return address            2            
//            66                 variable x                 2            
//            67            socket_flush return address            2            
//            68            socket_put_string return address            2            
//            69                   array                    2            
//            70                 variable i                 2            
//            71            socket_put_decimal return address            2            
//            72               variable value               2            
//            73              variable digit_0              2            
//            74              variable digit_1              2            
//            75              variable digit_2              2            
//            76              variable digit_3              2            
module user_design(input_switches,input_buttons,input_socket,input_rs232_rx,input_switches_stb,input_buttons_stb,input_socket_stb,input_rs232_rx_stb,output_rs232_tx_ack,output_leds_ack,output_socket_ack,clk,rst,output_rs232_tx,output_leds,output_socket,output_rs232_tx_stb,output_leds_stb,output_socket_stb,input_switches_ack,input_buttons_ack,input_socket_ack,input_rs232_rx_ack);
  integer file_count;
  real fp_value;
  input [15:0] input_switches;
  input [15:0] input_buttons;
  input [15:0] input_socket;
  input [15:0] input_rs232_rx;
  input input_switches_stb;
  input input_buttons_stb;
  input input_socket_stb;
  input input_rs232_rx_stb;
  input output_rs232_tx_ack;
  input output_leds_ack;
  input output_socket_ack;
  input clk;
  input rst;
  output [15:0] output_rs232_tx;
  output [15:0] output_leds;
  output [15:0] output_socket;
  output output_rs232_tx_stb;
  output output_leds_stb;
  output output_socket_stb;
  output input_switches_ack;
  output input_buttons_ack;
  output input_socket_ack;
  output input_rs232_rx_ack;
  reg [15:0] timer;
  reg timer_enable;
  reg stage_0_enable;
  reg stage_1_enable;
  reg stage_2_enable;
  reg [10:0] program_counter;
  reg [10:0] program_counter_0;
  reg [51:0] instruction_0;
  reg [5:0] opcode_0;
  reg [6:0] dest_0;
  reg [6:0] src_0;
  reg [6:0] srcb_0;
  reg [31:0] literal_0;
  reg [10:0] program_counter_1;
  reg [5:0] opcode_1;
  reg [6:0] dest_1;
  reg [31:0] register_1;
  reg [31:0] registerb_1;
  reg [31:0] literal_1;
  reg [6:0] dest_2;
  reg [31:0] result_2;
  reg write_enable_2;
  reg [15:0] address_2;
  reg [15:0] data_out_2;
  reg [15:0] data_in_2;
  reg memory_enable_2;
  reg [15:0] address_4;
  reg [31:0] data_out_4;
  reg [31:0] data_in_4;
  reg memory_enable_4;
  reg [15:0] s_output_rs232_tx_stb;
  reg [15:0] s_output_leds_stb;
  reg [15:0] s_output_socket_stb;
  reg [15:0] s_output_rs232_tx;
  reg [15:0] s_output_leds;
  reg [15:0] s_output_socket;
  reg [15:0] s_input_switches_ack;
  reg [15:0] s_input_buttons_ack;
  reg [15:0] s_input_socket_ack;
  reg [15:0] s_input_rs232_rx_ack;
  reg [15:0] memory_2 [2940:0];
  reg [51:0] instructions [1717:0];
  reg [31:0] registers [76:0];

  //////////////////////////////////////////////////////////////////////////////
  // MEMORY INITIALIZATION                                                      
  //                                                                            
  // In order to reduce program size, array contents have been stored into      
  // memory at initialization. In an FPGA, this will result in the memory being 
  // initialized when the FPGA configures.                                      
  // Memory will not be re-initialized at reset.                                
  // Dissable this behaviour using the no_initialize_memory switch              
  
  initial
  begin
    memory_2[4] = 72;
    memory_2[5] = 84;
    memory_2[6] = 84;
    memory_2[7] = 80;
    memory_2[8] = 47;
    memory_2[9] = 49;
    memory_2[10] = 46;
    memory_2[11] = 49;
    memory_2[12] = 32;
    memory_2[13] = 52;
    memory_2[14] = 48;
    memory_2[15] = 52;
    memory_2[16] = 32;
    memory_2[17] = 78;
    memory_2[18] = 111;
    memory_2[19] = 116;
    memory_2[20] = 32;
    memory_2[21] = 70;
    memory_2[22] = 111;
    memory_2[23] = 117;
    memory_2[24] = 110;
    memory_2[25] = 100;
    memory_2[26] = 13;
    memory_2[27] = 10;
    memory_2[28] = 68;
    memory_2[29] = 97;
    memory_2[30] = 116;
    memory_2[31] = 101;
    memory_2[32] = 58;
    memory_2[33] = 32;
    memory_2[34] = 84;
    memory_2[35] = 104;
    memory_2[36] = 117;
    memory_2[37] = 32;
    memory_2[38] = 79;
    memory_2[39] = 99;
    memory_2[40] = 116;
    memory_2[41] = 32;
    memory_2[42] = 51;
    memory_2[43] = 49;
    memory_2[44] = 32;
    memory_2[45] = 49;
    memory_2[46] = 57;
    memory_2[47] = 58;
    memory_2[48] = 49;
    memory_2[49] = 54;
    memory_2[50] = 58;
    memory_2[51] = 48;
    memory_2[52] = 48;
    memory_2[53] = 32;
    memory_2[54] = 50;
    memory_2[55] = 48;
    memory_2[56] = 49;
    memory_2[57] = 51;
    memory_2[58] = 13;
    memory_2[59] = 10;
    memory_2[60] = 83;
    memory_2[61] = 101;
    memory_2[62] = 114;
    memory_2[63] = 118;
    memory_2[64] = 101;
    memory_2[65] = 114;
    memory_2[66] = 58;
    memory_2[67] = 32;
    memory_2[68] = 99;
    memory_2[69] = 104;
    memory_2[70] = 105;
    memory_2[71] = 112;
    memory_2[72] = 115;
    memory_2[73] = 45;
    memory_2[74] = 119;
    memory_2[75] = 101;
    memory_2[76] = 98;
    memory_2[77] = 47;
    memory_2[78] = 48;
    memory_2[79] = 46;
    memory_2[80] = 48;
    memory_2[81] = 13;
    memory_2[82] = 10;
    memory_2[83] = 67;
    memory_2[84] = 111;
    memory_2[85] = 110;
    memory_2[86] = 116;
    memory_2[87] = 101;
    memory_2[88] = 110;
    memory_2[89] = 116;
    memory_2[90] = 45;
    memory_2[91] = 84;
    memory_2[92] = 121;
    memory_2[93] = 112;
    memory_2[94] = 101;
    memory_2[95] = 58;
    memory_2[96] = 32;
    memory_2[97] = 116;
    memory_2[98] = 101;
    memory_2[99] = 120;
    memory_2[100] = 116;
    memory_2[101] = 47;
    memory_2[102] = 104;
    memory_2[103] = 116;
    memory_2[104] = 109;
    memory_2[105] = 108;
    memory_2[106] = 13;
    memory_2[107] = 10;
    memory_2[108] = 67;
    memory_2[109] = 111;
    memory_2[110] = 110;
    memory_2[111] = 116;
    memory_2[112] = 101;
    memory_2[113] = 110;
    memory_2[114] = 116;
    memory_2[115] = 45;
    memory_2[116] = 76;
    memory_2[117] = 101;
    memory_2[118] = 110;
    memory_2[119] = 103;
    memory_2[120] = 116;
    memory_2[121] = 104;
    memory_2[122] = 58;
    memory_2[123] = 32;
    memory_2[124] = 48;
    memory_2[125] = 13;
    memory_2[126] = 10;
    memory_2[127] = 13;
    memory_2[128] = 10;
    memory_2[129] = 0;
    memory_2[132] = 72;
    memory_2[133] = 84;
    memory_2[134] = 84;
    memory_2[135] = 80;
    memory_2[136] = 47;
    memory_2[137] = 49;
    memory_2[138] = 46;
    memory_2[139] = 49;
    memory_2[140] = 32;
    memory_2[141] = 50;
    memory_2[142] = 48;
    memory_2[143] = 48;
    memory_2[144] = 32;
    memory_2[145] = 79;
    memory_2[146] = 75;
    memory_2[147] = 13;
    memory_2[148] = 10;
    memory_2[149] = 68;
    memory_2[150] = 97;
    memory_2[151] = 116;
    memory_2[152] = 101;
    memory_2[153] = 58;
    memory_2[154] = 32;
    memory_2[155] = 84;
    memory_2[156] = 104;
    memory_2[157] = 117;
    memory_2[158] = 32;
    memory_2[159] = 79;
    memory_2[160] = 99;
    memory_2[161] = 116;
    memory_2[162] = 32;
    memory_2[163] = 51;
    memory_2[164] = 49;
    memory_2[165] = 32;
    memory_2[166] = 49;
    memory_2[167] = 57;
    memory_2[168] = 58;
    memory_2[169] = 49;
    memory_2[170] = 54;
    memory_2[171] = 58;
    memory_2[172] = 48;
    memory_2[173] = 48;
    memory_2[174] = 32;
    memory_2[175] = 50;
    memory_2[176] = 48;
    memory_2[177] = 49;
    memory_2[178] = 51;
    memory_2[179] = 13;
    memory_2[180] = 10;
    memory_2[181] = 83;
    memory_2[182] = 101;
    memory_2[183] = 114;
    memory_2[184] = 118;
    memory_2[185] = 101;
    memory_2[186] = 114;
    memory_2[187] = 58;
    memory_2[188] = 32;
    memory_2[189] = 99;
    memory_2[190] = 104;
    memory_2[191] = 105;
    memory_2[192] = 112;
    memory_2[193] = 115;
    memory_2[194] = 45;
    memory_2[195] = 119;
    memory_2[196] = 101;
    memory_2[197] = 98;
    memory_2[198] = 47;
    memory_2[199] = 48;
    memory_2[200] = 46;
    memory_2[201] = 48;
    memory_2[202] = 13;
    memory_2[203] = 10;
    memory_2[204] = 67;
    memory_2[205] = 111;
    memory_2[206] = 110;
    memory_2[207] = 116;
    memory_2[208] = 101;
    memory_2[209] = 110;
    memory_2[210] = 116;
    memory_2[211] = 45;
    memory_2[212] = 84;
    memory_2[213] = 121;
    memory_2[214] = 112;
    memory_2[215] = 101;
    memory_2[216] = 58;
    memory_2[217] = 32;
    memory_2[218] = 116;
    memory_2[219] = 101;
    memory_2[220] = 120;
    memory_2[221] = 116;
    memory_2[222] = 47;
    memory_2[223] = 104;
    memory_2[224] = 116;
    memory_2[225] = 109;
    memory_2[226] = 108;
    memory_2[227] = 13;
    memory_2[228] = 10;
    memory_2[229] = 67;
    memory_2[230] = 111;
    memory_2[231] = 110;
    memory_2[232] = 116;
    memory_2[233] = 101;
    memory_2[234] = 110;
    memory_2[235] = 116;
    memory_2[236] = 45;
    memory_2[237] = 76;
    memory_2[238] = 101;
    memory_2[239] = 110;
    memory_2[240] = 103;
    memory_2[241] = 116;
    memory_2[242] = 104;
    memory_2[243] = 58;
    memory_2[244] = 32;
    memory_2[245] = 0;
    memory_2[246] = 13;
    memory_2[247] = 10;
    memory_2[248] = 13;
    memory_2[249] = 10;
    memory_2[250] = 0;
    memory_2[253] = 10;
    memory_2[254] = 0;
    memory_2[255] = 10;
    memory_2[256] = 0;
    memory_2[1717] = 60;
    memory_2[1718] = 104;
    memory_2[1719] = 116;
    memory_2[1720] = 109;
    memory_2[1721] = 108;
    memory_2[1722] = 62;
    memory_2[1723] = 60;
    memory_2[1724] = 104;
    memory_2[1725] = 101;
    memory_2[1726] = 97;
    memory_2[1727] = 100;
    memory_2[1728] = 62;
    memory_2[1729] = 60;
    memory_2[1730] = 116;
    memory_2[1731] = 105;
    memory_2[1732] = 116;
    memory_2[1733] = 108;
    memory_2[1734] = 101;
    memory_2[1735] = 62;
    memory_2[1736] = 68;
    memory_2[1737] = 101;
    memory_2[1738] = 109;
    memory_2[1739] = 111;
    memory_2[1740] = 32;
    memory_2[1741] = 111;
    memory_2[1742] = 110;
    memory_2[1743] = 32;
    memory_2[1744] = 78;
    memory_2[1745] = 69;
    memory_2[1746] = 88;
    memory_2[1747] = 89;
    memory_2[1748] = 83;
    memory_2[1749] = 51;
    memory_2[1750] = 32;
    memory_2[1751] = 98;
    memory_2[1752] = 111;
    memory_2[1753] = 97;
    memory_2[1754] = 114;
    memory_2[1755] = 100;
    memory_2[1756] = 32;
    memory_2[1757] = 117;
    memory_2[1758] = 115;
    memory_2[1759] = 105;
    memory_2[1760] = 110;
    memory_2[1761] = 103;
    memory_2[1762] = 32;
    memory_2[1763] = 67;
    memory_2[1764] = 104;
    memory_2[1765] = 105;
    memory_2[1766] = 112;
    memory_2[1767] = 115;
    memory_2[1768] = 45;
    memory_2[1769] = 50;
    memory_2[1770] = 46;
    memory_2[1771] = 48;
    memory_2[1772] = 60;
    memory_2[1773] = 47;
    memory_2[1774] = 116;
    memory_2[1775] = 105;
    memory_2[1776] = 116;
    memory_2[1777] = 108;
    memory_2[1778] = 101;
    memory_2[1779] = 62;
    memory_2[1780] = 60;
    memory_2[1781] = 47;
    memory_2[1782] = 104;
    memory_2[1783] = 101;
    memory_2[1784] = 97;
    memory_2[1785] = 100;
    memory_2[1786] = 62;
    memory_2[1787] = 60;
    memory_2[1788] = 98;
    memory_2[1789] = 111;
    memory_2[1790] = 100;
    memory_2[1791] = 121;
    memory_2[1792] = 62;
    memory_2[1793] = 60;
    memory_2[1794] = 104;
    memory_2[1795] = 49;
    memory_2[1796] = 62;
    memory_2[1797] = 87;
    memory_2[1798] = 101;
    memory_2[1799] = 108;
    memory_2[1800] = 99;
    memory_2[1801] = 111;
    memory_2[1802] = 109;
    memory_2[1803] = 101;
    memory_2[1804] = 32;
    memory_2[1805] = 60;
    memory_2[1806] = 47;
    memory_2[1807] = 104;
    memory_2[1808] = 49;
    memory_2[1809] = 62;
    memory_2[1810] = 60;
    memory_2[1811] = 112;
    memory_2[1812] = 62;
    memory_2[1813] = 87;
    memory_2[1814] = 101;
    memory_2[1815] = 108;
    memory_2[1816] = 99;
    memory_2[1817] = 111;
    memory_2[1818] = 109;
    memory_2[1819] = 101;
    memory_2[1820] = 32;
    memory_2[1821] = 116;
    memory_2[1822] = 111;
    memory_2[1823] = 32;
    memory_2[1824] = 116;
    memory_2[1825] = 104;
    memory_2[1826] = 101;
    memory_2[1827] = 32;
    memory_2[1828] = 115;
    memory_2[1829] = 105;
    memory_2[1830] = 109;
    memory_2[1831] = 112;
    memory_2[1832] = 108;
    memory_2[1833] = 101;
    memory_2[1834] = 32;
    memory_2[1835] = 87;
    memory_2[1836] = 101;
    memory_2[1837] = 98;
    memory_2[1838] = 32;
    memory_2[1839] = 97;
    memory_2[1840] = 112;
    memory_2[1841] = 112;
    memory_2[1842] = 108;
    memory_2[1843] = 105;
    memory_2[1844] = 99;
    memory_2[1845] = 97;
    memory_2[1846] = 116;
    memory_2[1847] = 105;
    memory_2[1848] = 111;
    memory_2[1849] = 110;
    memory_2[1850] = 32;
    memory_2[1851] = 111;
    memory_2[1852] = 110;
    memory_2[1853] = 32;
    memory_2[1854] = 70;
    memory_2[1855] = 80;
    memory_2[1856] = 71;
    memory_2[1857] = 65;
    memory_2[1858] = 32;
    memory_2[1859] = 78;
    memory_2[1860] = 101;
    memory_2[1861] = 120;
    memory_2[1862] = 121;
    memory_2[1863] = 115;
    memory_2[1864] = 51;
    memory_2[1865] = 32;
    memory_2[1866] = 98;
    memory_2[1867] = 111;
    memory_2[1868] = 97;
    memory_2[1869] = 114;
    memory_2[1870] = 100;
    memory_2[1871] = 33;
    memory_2[1872] = 60;
    memory_2[1873] = 47;
    memory_2[1874] = 112;
    memory_2[1875] = 62;
    memory_2[1876] = 60;
    memory_2[1877] = 112;
    memory_2[1878] = 62;
    memory_2[1879] = 66;
    memory_2[1880] = 121;
    memory_2[1881] = 32;
    memory_2[1882] = 65;
    memory_2[1883] = 109;
    memory_2[1884] = 101;
    memory_2[1885] = 114;
    memory_2[1886] = 32;
    memory_2[1887] = 65;
    memory_2[1888] = 108;
    memory_2[1889] = 45;
    memory_2[1890] = 67;
    memory_2[1891] = 97;
    memory_2[1892] = 110;
    memory_2[1893] = 97;
    memory_2[1894] = 97;
    memory_2[1895] = 110;
    memory_2[1896] = 44;
    memory_2[1897] = 32;
    memory_2[1898] = 74;
    memory_2[1899] = 117;
    memory_2[1900] = 110;
    memory_2[1901] = 101;
    memory_2[1902] = 32;
    memory_2[1903] = 50;
    memory_2[1904] = 48;
    memory_2[1905] = 49;
    memory_2[1906] = 52;
    memory_2[1907] = 60;
    memory_2[1908] = 47;
    memory_2[1909] = 112;
    memory_2[1910] = 62;
    memory_2[1911] = 60;
    memory_2[1912] = 102;
    memory_2[1913] = 111;
    memory_2[1914] = 114;
    memory_2[1915] = 109;
    memory_2[1916] = 62;
    memory_2[1917] = 9;
    memory_2[1918] = 60;
    memory_2[1919] = 105;
    memory_2[1920] = 110;
    memory_2[1921] = 112;
    memory_2[1922] = 117;
    memory_2[1923] = 116;
    memory_2[1924] = 32;
    memory_2[1925] = 116;
    memory_2[1926] = 121;
    memory_2[1927] = 112;
    memory_2[1928] = 101;
    memory_2[1929] = 61;
    memory_2[1930] = 34;
    memory_2[1931] = 99;
    memory_2[1932] = 104;
    memory_2[1933] = 101;
    memory_2[1934] = 99;
    memory_2[1935] = 107;
    memory_2[1936] = 98;
    memory_2[1937] = 111;
    memory_2[1938] = 120;
    memory_2[1939] = 34;
    memory_2[1940] = 32;
    memory_2[1941] = 110;
    memory_2[1942] = 97;
    memory_2[1943] = 109;
    memory_2[1944] = 101;
    memory_2[1945] = 61;
    memory_2[1946] = 34;
    memory_2[1947] = 108;
    memory_2[1948] = 101;
    memory_2[1949] = 100;
    memory_2[1950] = 49;
    memory_2[1951] = 34;
    memory_2[1952] = 32;
    memory_2[1953] = 118;
    memory_2[1954] = 97;
    memory_2[1955] = 108;
    memory_2[1956] = 117;
    memory_2[1957] = 101;
    memory_2[1958] = 61;
    memory_2[1959] = 34;
    memory_2[1960] = 65;
    memory_2[1961] = 34;
    memory_2[1962] = 62;
    memory_2[1963] = 108;
    memory_2[1964] = 101;
    memory_2[1965] = 100;
    memory_2[1966] = 32;
    memory_2[1967] = 48;
    memory_2[1968] = 60;
    memory_2[1969] = 47;
    memory_2[1970] = 105;
    memory_2[1971] = 110;
    memory_2[1972] = 112;
    memory_2[1973] = 117;
    memory_2[1974] = 116;
    memory_2[1975] = 62;
    memory_2[1976] = 9;
    memory_2[1977] = 60;
    memory_2[1978] = 105;
    memory_2[1979] = 110;
    memory_2[1980] = 112;
    memory_2[1981] = 117;
    memory_2[1982] = 116;
    memory_2[1983] = 32;
    memory_2[1984] = 116;
    memory_2[1985] = 121;
    memory_2[1986] = 112;
    memory_2[1987] = 101;
    memory_2[1988] = 61;
    memory_2[1989] = 34;
    memory_2[1990] = 99;
    memory_2[1991] = 104;
    memory_2[1992] = 101;
    memory_2[1993] = 99;
    memory_2[1994] = 107;
    memory_2[1995] = 98;
    memory_2[1996] = 111;
    memory_2[1997] = 120;
    memory_2[1998] = 34;
    memory_2[1999] = 32;
    memory_2[2000] = 110;
    memory_2[2001] = 97;
    memory_2[2002] = 109;
    memory_2[2003] = 101;
    memory_2[2004] = 61;
    memory_2[2005] = 34;
    memory_2[2006] = 108;
    memory_2[2007] = 101;
    memory_2[2008] = 100;
    memory_2[2009] = 50;
    memory_2[2010] = 34;
    memory_2[2011] = 32;
    memory_2[2012] = 118;
    memory_2[2013] = 97;
    memory_2[2014] = 108;
    memory_2[2015] = 117;
    memory_2[2016] = 101;
    memory_2[2017] = 61;
    memory_2[2018] = 34;
    memory_2[2019] = 66;
    memory_2[2020] = 34;
    memory_2[2021] = 62;
    memory_2[2022] = 108;
    memory_2[2023] = 101;
    memory_2[2024] = 100;
    memory_2[2025] = 32;
    memory_2[2026] = 49;
    memory_2[2027] = 60;
    memory_2[2028] = 47;
    memory_2[2029] = 105;
    memory_2[2030] = 110;
    memory_2[2031] = 112;
    memory_2[2032] = 117;
    memory_2[2033] = 116;
    memory_2[2034] = 62;
    memory_2[2035] = 9;
    memory_2[2036] = 60;
    memory_2[2037] = 105;
    memory_2[2038] = 110;
    memory_2[2039] = 112;
    memory_2[2040] = 117;
    memory_2[2041] = 116;
    memory_2[2042] = 32;
    memory_2[2043] = 116;
    memory_2[2044] = 121;
    memory_2[2045] = 112;
    memory_2[2046] = 101;
    memory_2[2047] = 61;
    memory_2[2048] = 34;
    memory_2[2049] = 99;
    memory_2[2050] = 104;
    memory_2[2051] = 101;
    memory_2[2052] = 99;
    memory_2[2053] = 107;
    memory_2[2054] = 98;
    memory_2[2055] = 111;
    memory_2[2056] = 120;
    memory_2[2057] = 34;
    memory_2[2058] = 32;
    memory_2[2059] = 110;
    memory_2[2060] = 97;
    memory_2[2061] = 109;
    memory_2[2062] = 101;
    memory_2[2063] = 61;
    memory_2[2064] = 34;
    memory_2[2065] = 108;
    memory_2[2066] = 101;
    memory_2[2067] = 100;
    memory_2[2068] = 51;
    memory_2[2069] = 34;
    memory_2[2070] = 32;
    memory_2[2071] = 118;
    memory_2[2072] = 97;
    memory_2[2073] = 108;
    memory_2[2074] = 117;
    memory_2[2075] = 101;
    memory_2[2076] = 61;
    memory_2[2077] = 34;
    memory_2[2078] = 67;
    memory_2[2079] = 34;
    memory_2[2080] = 62;
    memory_2[2081] = 108;
    memory_2[2082] = 101;
    memory_2[2083] = 100;
    memory_2[2084] = 32;
    memory_2[2085] = 50;
    memory_2[2086] = 60;
    memory_2[2087] = 47;
    memory_2[2088] = 105;
    memory_2[2089] = 110;
    memory_2[2090] = 112;
    memory_2[2091] = 117;
    memory_2[2092] = 116;
    memory_2[2093] = 62;
    memory_2[2094] = 9;
    memory_2[2095] = 60;
    memory_2[2096] = 105;
    memory_2[2097] = 110;
    memory_2[2098] = 112;
    memory_2[2099] = 117;
    memory_2[2100] = 116;
    memory_2[2101] = 32;
    memory_2[2102] = 116;
    memory_2[2103] = 121;
    memory_2[2104] = 112;
    memory_2[2105] = 101;
    memory_2[2106] = 61;
    memory_2[2107] = 34;
    memory_2[2108] = 99;
    memory_2[2109] = 104;
    memory_2[2110] = 101;
    memory_2[2111] = 99;
    memory_2[2112] = 107;
    memory_2[2113] = 98;
    memory_2[2114] = 111;
    memory_2[2115] = 120;
    memory_2[2116] = 34;
    memory_2[2117] = 32;
    memory_2[2118] = 110;
    memory_2[2119] = 97;
    memory_2[2120] = 109;
    memory_2[2121] = 101;
    memory_2[2122] = 61;
    memory_2[2123] = 34;
    memory_2[2124] = 108;
    memory_2[2125] = 101;
    memory_2[2126] = 100;
    memory_2[2127] = 52;
    memory_2[2128] = 34;
    memory_2[2129] = 32;
    memory_2[2130] = 118;
    memory_2[2131] = 97;
    memory_2[2132] = 108;
    memory_2[2133] = 117;
    memory_2[2134] = 101;
    memory_2[2135] = 61;
    memory_2[2136] = 34;
    memory_2[2137] = 68;
    memory_2[2138] = 34;
    memory_2[2139] = 62;
    memory_2[2140] = 108;
    memory_2[2141] = 101;
    memory_2[2142] = 100;
    memory_2[2143] = 32;
    memory_2[2144] = 51;
    memory_2[2145] = 60;
    memory_2[2146] = 47;
    memory_2[2147] = 105;
    memory_2[2148] = 110;
    memory_2[2149] = 112;
    memory_2[2150] = 117;
    memory_2[2151] = 116;
    memory_2[2152] = 62;
    memory_2[2153] = 9;
    memory_2[2154] = 60;
    memory_2[2155] = 98;
    memory_2[2156] = 117;
    memory_2[2157] = 116;
    memory_2[2158] = 116;
    memory_2[2159] = 111;
    memory_2[2160] = 110;
    memory_2[2161] = 32;
    memory_2[2162] = 116;
    memory_2[2163] = 121;
    memory_2[2164] = 112;
    memory_2[2165] = 101;
    memory_2[2166] = 61;
    memory_2[2167] = 34;
    memory_2[2168] = 115;
    memory_2[2169] = 117;
    memory_2[2170] = 109;
    memory_2[2171] = 98;
    memory_2[2172] = 105;
    memory_2[2173] = 116;
    memory_2[2174] = 34;
    memory_2[2175] = 32;
    memory_2[2176] = 118;
    memory_2[2177] = 97;
    memory_2[2178] = 108;
    memory_2[2179] = 117;
    memory_2[2180] = 101;
    memory_2[2181] = 61;
    memory_2[2182] = 34;
    memory_2[2183] = 83;
    memory_2[2184] = 117;
    memory_2[2185] = 98;
    memory_2[2186] = 109;
    memory_2[2187] = 105;
    memory_2[2188] = 116;
    memory_2[2189] = 34;
    memory_2[2190] = 62;
    memory_2[2191] = 85;
    memory_2[2192] = 112;
    memory_2[2193] = 100;
    memory_2[2194] = 97;
    memory_2[2195] = 116;
    memory_2[2196] = 101;
    memory_2[2197] = 32;
    memory_2[2198] = 76;
    memory_2[2199] = 69;
    memory_2[2200] = 68;
    memory_2[2201] = 115;
    memory_2[2202] = 60;
    memory_2[2203] = 47;
    memory_2[2204] = 98;
    memory_2[2205] = 117;
    memory_2[2206] = 116;
    memory_2[2207] = 116;
    memory_2[2208] = 111;
    memory_2[2209] = 110;
    memory_2[2210] = 62;
    memory_2[2211] = 60;
    memory_2[2212] = 47;
    memory_2[2213] = 102;
    memory_2[2214] = 111;
    memory_2[2215] = 114;
    memory_2[2216] = 109;
    memory_2[2217] = 62;
    memory_2[2218] = 60;
    memory_2[2219] = 98;
    memory_2[2220] = 114;
    memory_2[2221] = 62;
    memory_2[2222] = 60;
    memory_2[2223] = 104;
    memory_2[2224] = 51;
    memory_2[2225] = 62;
    memory_2[2226] = 83;
    memory_2[2227] = 119;
    memory_2[2228] = 105;
    memory_2[2229] = 116;
    memory_2[2230] = 99;
    memory_2[2231] = 104;
    memory_2[2232] = 32;
    memory_2[2233] = 83;
    memory_2[2234] = 116;
    memory_2[2235] = 97;
    memory_2[2236] = 116;
    memory_2[2237] = 117;
    memory_2[2238] = 115;
    memory_2[2239] = 59;
    memory_2[2240] = 32;
    memory_2[2241] = 48;
    memory_2[2242] = 48;
    memory_2[2243] = 48;
    memory_2[2244] = 48;
    memory_2[2245] = 48;
    memory_2[2246] = 48;
    memory_2[2247] = 48;
    memory_2[2248] = 48;
    memory_2[2249] = 32;
    memory_2[2250] = 32;
    memory_2[2251] = 32;
    memory_2[2252] = 60;
    memory_2[2253] = 47;
    memory_2[2254] = 104;
    memory_2[2255] = 51;
    memory_2[2256] = 62;
    memory_2[2257] = 60;
    memory_2[2258] = 104;
    memory_2[2259] = 51;
    memory_2[2260] = 62;
    memory_2[2261] = 66;
    memory_2[2262] = 117;
    memory_2[2263] = 116;
    memory_2[2264] = 116;
    memory_2[2265] = 111;
    memory_2[2266] = 110;
    memory_2[2267] = 32;
    memory_2[2268] = 83;
    memory_2[2269] = 116;
    memory_2[2270] = 97;
    memory_2[2271] = 116;
    memory_2[2272] = 117;
    memory_2[2273] = 115;
    memory_2[2274] = 59;
    memory_2[2275] = 32;
    memory_2[2276] = 48;
    memory_2[2277] = 48;
    memory_2[2278] = 48;
    memory_2[2279] = 48;
    memory_2[2280] = 32;
    memory_2[2281] = 32;
    memory_2[2282] = 32;
    memory_2[2283] = 32;
    memory_2[2284] = 60;
    memory_2[2285] = 47;
    memory_2[2286] = 104;
    memory_2[2287] = 51;
    memory_2[2288] = 62;
    memory_2[2289] = 60;
    memory_2[2290] = 112;
    memory_2[2291] = 62;
    memory_2[2292] = 84;
    memory_2[2293] = 104;
    memory_2[2294] = 105;
    memory_2[2295] = 115;
    memory_2[2296] = 32;
    memory_2[2297] = 32;
    memory_2[2298] = 32;
    memory_2[2299] = 32;
    memory_2[2300] = 32;
    memory_2[2301] = 32;
    memory_2[2302] = 32;
    memory_2[2303] = 32;
    memory_2[2304] = 60;
    memory_2[2305] = 97;
    memory_2[2306] = 32;
    memory_2[2307] = 104;
    memory_2[2308] = 114;
    memory_2[2309] = 101;
    memory_2[2310] = 102;
    memory_2[2311] = 61;
    memory_2[2312] = 34;
    memory_2[2313] = 104;
    memory_2[2314] = 116;
    memory_2[2315] = 116;
    memory_2[2316] = 112;
    memory_2[2317] = 115;
    memory_2[2318] = 58;
    memory_2[2319] = 92;
    memory_2[2320] = 47;
    memory_2[2321] = 92;
    memory_2[2322] = 47;
    memory_2[2323] = 103;
    memory_2[2324] = 105;
    memory_2[2325] = 116;
    memory_2[2326] = 104;
    memory_2[2327] = 117;
    memory_2[2328] = 98;
    memory_2[2329] = 46;
    memory_2[2330] = 99;
    memory_2[2331] = 111;
    memory_2[2332] = 109;
    memory_2[2333] = 92;
    memory_2[2334] = 47;
    memory_2[2335] = 97;
    memory_2[2336] = 109;
    memory_2[2337] = 101;
    memory_2[2338] = 114;
    memory_2[2339] = 99;
    memory_2[2340] = 92;
    memory_2[2341] = 47;
    memory_2[2342] = 112;
    memory_2[2343] = 104;
    memory_2[2344] = 105;
    memory_2[2345] = 109;
    memory_2[2346] = 105;
    memory_2[2347] = 105;
    memory_2[2348] = 34;
    memory_2[2349] = 62;
    memory_2[2350] = 112;
    memory_2[2351] = 114;
    memory_2[2352] = 111;
    memory_2[2353] = 106;
    memory_2[2354] = 101;
    memory_2[2355] = 99;
    memory_2[2356] = 116;
    memory_2[2357] = 60;
    memory_2[2358] = 47;
    memory_2[2359] = 97;
    memory_2[2360] = 62;
    memory_2[2361] = 32;
    memory_2[2362] = 105;
    memory_2[2363] = 115;
    memory_2[2364] = 32;
    memory_2[2365] = 112;
    memory_2[2366] = 111;
    memory_2[2367] = 119;
    memory_2[2368] = 101;
    memory_2[2369] = 114;
    memory_2[2370] = 101;
    memory_2[2371] = 100;
    memory_2[2372] = 32;
    memory_2[2373] = 98;
    memory_2[2374] = 121;
    memory_2[2375] = 32;
    memory_2[2376] = 60;
    memory_2[2377] = 97;
    memory_2[2378] = 32;
    memory_2[2379] = 104;
    memory_2[2380] = 114;
    memory_2[2381] = 101;
    memory_2[2382] = 102;
    memory_2[2383] = 61;
    memory_2[2384] = 34;
    memory_2[2385] = 104;
    memory_2[2386] = 116;
    memory_2[2387] = 116;
    memory_2[2388] = 112;
    memory_2[2389] = 58;
    memory_2[2390] = 47;
    memory_2[2391] = 47;
    memory_2[2392] = 112;
    memory_2[2393] = 121;
    memory_2[2394] = 97;
    memory_2[2395] = 110;
    memory_2[2396] = 100;
    memory_2[2397] = 99;
    memory_2[2398] = 104;
    memory_2[2399] = 105;
    memory_2[2400] = 112;
    memory_2[2401] = 115;
    memory_2[2402] = 46;
    memory_2[2403] = 111;
    memory_2[2404] = 114;
    memory_2[2405] = 103;
    memory_2[2406] = 34;
    memory_2[2407] = 62;
    memory_2[2408] = 67;
    memory_2[2409] = 104;
    memory_2[2410] = 105;
    memory_2[2411] = 112;
    memory_2[2412] = 115;
    memory_2[2413] = 45;
    memory_2[2414] = 50;
    memory_2[2415] = 46;
    memory_2[2416] = 48;
    memory_2[2417] = 60;
    memory_2[2418] = 47;
    memory_2[2419] = 97;
    memory_2[2420] = 62;
    memory_2[2421] = 46;
    memory_2[2422] = 60;
    memory_2[2423] = 98;
    memory_2[2424] = 114;
    memory_2[2425] = 62;
    memory_2[2426] = 65;
    memory_2[2427] = 109;
    memory_2[2428] = 101;
    memory_2[2429] = 114;
    memory_2[2430] = 32;
    memory_2[2431] = 65;
    memory_2[2432] = 108;
    memory_2[2433] = 45;
    memory_2[2434] = 67;
    memory_2[2435] = 97;
    memory_2[2436] = 110;
    memory_2[2437] = 97;
    memory_2[2438] = 97;
    memory_2[2439] = 110;
    memory_2[2440] = 60;
    memory_2[2441] = 98;
    memory_2[2442] = 114;
    memory_2[2443] = 62;
    memory_2[2444] = 60;
    memory_2[2445] = 105;
    memory_2[2446] = 109;
    memory_2[2447] = 103;
    memory_2[2448] = 32;
    memory_2[2449] = 115;
    memory_2[2450] = 114;
    memory_2[2451] = 99;
    memory_2[2452] = 61;
    memory_2[2453] = 34;
    memory_2[2454] = 100;
    memory_2[2455] = 97;
    memory_2[2456] = 116;
    memory_2[2457] = 97;
    memory_2[2458] = 58;
    memory_2[2459] = 105;
    memory_2[2460] = 109;
    memory_2[2461] = 97;
    memory_2[2462] = 103;
    memory_2[2463] = 101;
    memory_2[2464] = 47;
    memory_2[2465] = 103;
    memory_2[2466] = 105;
    memory_2[2467] = 102;
    memory_2[2468] = 59;
    memory_2[2469] = 98;
    memory_2[2470] = 97;
    memory_2[2471] = 115;
    memory_2[2472] = 101;
    memory_2[2473] = 54;
    memory_2[2474] = 52;
    memory_2[2475] = 44;
    memory_2[2476] = 82;
    memory_2[2477] = 48;
    memory_2[2478] = 108;
    memory_2[2479] = 71;
    memory_2[2480] = 79;
    memory_2[2481] = 68;
    memory_2[2482] = 108;
    memory_2[2483] = 104;
    memory_2[2484] = 70;
    memory_2[2485] = 65;
    memory_2[2486] = 65;
    memory_2[2487] = 100;
    memory_2[2488] = 65;
    memory_2[2489] = 77;
    memory_2[2490] = 73;
    memory_2[2491] = 71;
    memory_2[2492] = 65;
    memory_2[2493] = 65;
    memory_2[2494] = 65;
    memory_2[2495] = 65;
    memory_2[2496] = 65;
    memory_2[2497] = 73;
    memory_2[2498] = 65;
    memory_2[2499] = 65;
    memory_2[2500] = 65;
    memory_2[2501] = 73;
    memory_2[2502] = 67;
    memory_2[2503] = 65;
    memory_2[2504] = 65;
    memory_2[2505] = 73;
    memory_2[2506] = 67;
    memory_2[2507] = 65;
    memory_2[2508] = 47;
    memory_2[2509] = 47;
    memory_2[2510] = 43;
    memory_2[2511] = 65;
    memory_2[2512] = 65;
    memory_2[2513] = 80;
    memory_2[2514] = 43;
    memory_2[2515] = 65;
    memory_2[2516] = 103;
    memory_2[2517] = 80;
    memory_2[2518] = 47;
    memory_2[2519] = 47;
    memory_2[2520] = 47;
    memory_2[2521] = 47;
    memory_2[2522] = 47;
    memory_2[2523] = 47;
    memory_2[2524] = 47;
    memory_2[2525] = 121;
    memory_2[2526] = 72;
    memory_2[2527] = 43;
    memory_2[2528] = 71;
    memory_2[2529] = 107;
    memory_2[2530] = 78;
    memory_2[2531] = 121;
    memory_2[2532] = 90;
    memory_2[2533] = 87;
    memory_2[2534] = 70;
    memory_2[2535] = 48;
    memory_2[2536] = 90;
    memory_2[2537] = 87;
    memory_2[2538] = 81;
    memory_2[2539] = 103;
    memory_2[2540] = 100;
    memory_2[2541] = 50;
    memory_2[2542] = 108;
    memory_2[2543] = 48;
    memory_2[2544] = 97;
    memory_2[2545] = 67;
    memory_2[2546] = 66;
    memory_2[2547] = 72;
    memory_2[2548] = 83;
    memory_2[2549] = 85;
    memory_2[2550] = 49;
    memory_2[2551] = 81;
    memory_2[2552] = 73;
    memory_2[2553] = 71;
    memory_2[2554] = 57;
    memory_2[2555] = 117;
    memory_2[2556] = 73;
    memory_2[2557] = 71;
    memory_2[2558] = 69;
    memory_2[2559] = 103;
    memory_2[2560] = 84;
    memory_2[2561] = 87;
    memory_2[2562] = 70;
    memory_2[2563] = 106;
    memory_2[2564] = 65;
    memory_2[2565] = 67;
    memory_2[2566] = 72;
    memory_2[2567] = 53;
    memory_2[2568] = 66;
    memory_2[2569] = 65;
    memory_2[2570] = 69;
    memory_2[2571] = 75;
    memory_2[2572] = 65;
    memory_2[2573] = 65;
    memory_2[2574] = 99;
    memory_2[2575] = 65;
    memory_2[2576] = 76;
    memory_2[2577] = 65;
    memory_2[2578] = 65;
    memory_2[2579] = 65;
    memory_2[2580] = 65;
    memory_2[2581] = 65;
    memory_2[2582] = 65;
    memory_2[2583] = 85;
    memory_2[2584] = 65;
    memory_2[2585] = 66;
    memory_2[2586] = 48;
    memory_2[2587] = 65;
    memory_2[2588] = 65;
    memory_2[2589] = 65;
    memory_2[2590] = 79;
    memory_2[2591] = 100;
    memory_2[2592] = 71;
    memory_2[2593] = 71;
    memory_2[2594] = 114;
    memory_2[2595] = 99;
    memory_2[2596] = 78;
    memory_2[2597] = 108;
    memory_2[2598] = 66;
    memory_2[2599] = 73;
    memory_2[2600] = 65;
    memory_2[2601] = 83;
    memory_2[2602] = 112;
    memory_2[2603] = 90;
    memory_2[2604] = 68;
    memory_2[2605] = 77;
    memory_2[2606] = 73;
    memory_2[2607] = 119;
    memory_2[2608] = 79;
    memory_2[2609] = 55;
    memory_2[2610] = 49;
    memory_2[2611] = 66;
    memory_2[2612] = 111;
    memory_2[2613] = 119;
    memory_2[2614] = 50;
    memory_2[2615] = 99;
    memory_2[2616] = 74;
    memory_2[2617] = 119;
    memory_2[2618] = 72;
    memory_2[2619] = 71;
    memory_2[2620] = 115;
    memory_2[2621] = 106;
    memory_2[2622] = 69;
    memory_2[2623] = 69;
    memory_2[2624] = 119;
    memory_2[2625] = 90;
    memory_2[2626] = 81;
    memory_2[2627] = 84;
    memory_2[2628] = 111;
    memory_2[2629] = 77;
    memory_2[2630] = 121;
    memory_2[2631] = 104;
    memory_2[2632] = 89;
    memory_2[2633] = 56;
    memory_2[2634] = 99;
    memory_2[2635] = 48;
    memory_2[2636] = 90;
    memory_2[2637] = 106;
    memory_2[2638] = 100;
    memory_2[2639] = 120;
    memory_2[2640] = 66;
    memory_2[2641] = 43;
    memory_2[2642] = 50;
    memory_2[2643] = 79;
    memory_2[2644] = 119;
    memory_2[2645] = 97;
    memory_2[2646] = 107;
    memory_2[2647] = 68;
    memory_2[2648] = 116;
    memory_2[2649] = 66;
    memory_2[2650] = 71;
    memory_2[2651] = 71;
    memory_2[2652] = 107;
    memory_2[2653] = 54;
    memory_2[2654] = 76;
    memory_2[2655] = 106;
    memory_2[2656] = 83;
    memory_2[2657] = 67;
    memory_2[2658] = 69;
    memory_2[2659] = 113;
    memory_2[2660] = 87;
    memory_2[2661] = 85;
    memory_2[2662] = 106;
    memory_2[2663] = 74;
    memory_2[2664] = 69;
    memory_2[2665] = 57;
    memory_2[2666] = 112;
    memory_2[2667] = 77;
    memory_2[2668] = 77;
    memory_2[2669] = 103;
    memory_2[2670] = 114;
    memory_2[2671] = 89;
    memory_2[2672] = 98;
    memory_2[2673] = 74;
    memory_2[2674] = 89;
    memory_2[2675] = 74;
    memory_2[2676] = 69;
    memory_2[2677] = 67;
    memory_2[2678] = 103;
    memory_2[2679] = 69;
    memory_2[2680] = 106;
    memory_2[2681] = 86;
    memory_2[2682] = 97;
    memory_2[2683] = 103;
    memory_2[2684] = 66;
    memory_2[2685] = 102;
    memory_2[2686] = 112;
    memory_2[2687] = 43;
    memory_2[2688] = 88;
    memory_2[2689] = 103;
    memory_2[2690] = 48;
    memory_2[2691] = 97;
    memory_2[2692] = 119;
    memory_2[2693] = 47;
    memory_2[2694] = 83;
    memory_2[2695] = 98;
    memory_2[2696] = 53;
    memory_2[2697] = 103;
    memory_2[2698] = 76;
    memory_2[2699] = 116;
    memory_2[2700] = 53;
    memory_2[2701] = 122;
    memory_2[2702] = 117;
    memory_2[2703] = 117;
    memory_2[2704] = 114;
    memory_2[2705] = 75;
    memory_2[2706] = 88;
    memory_2[2707] = 71;
    memory_2[2708] = 89;
    memory_2[2709] = 75;
    memory_2[2710] = 80;
    memory_2[2711] = 114;
    memory_2[2712] = 84;
    memory_2[2713] = 99;
    memory_2[2714] = 115;
    memory_2[2715] = 118;
    memory_2[2716] = 57;
    memory_2[2717] = 51;
    memory_2[2718] = 119;
    memory_2[2719] = 75;
    memory_2[2720] = 81;
    memory_2[2721] = 110;
    memory_2[2722] = 52;
    memory_2[2723] = 71;
    memory_2[2724] = 90;
    memory_2[2725] = 67;
    memory_2[2726] = 66;
    memory_2[2727] = 101;
    memory_2[2728] = 67;
    memory_2[2729] = 109;
    memory_2[2730] = 75;
    memory_2[2731] = 68;
    memory_2[2732] = 82;
    memory_2[2733] = 87;
    memory_2[2734] = 74;
    memory_2[2735] = 102;
    memory_2[2736] = 90;
    memory_2[2737] = 73;
    memory_2[2738] = 116;
    memory_2[2739] = 65;
    memory_2[2740] = 106;
    memory_2[2741] = 82;
    memory_2[2742] = 120;
    memory_2[2743] = 107;
    memory_2[2744] = 86;
    memory_2[2745] = 106;
    memory_2[2746] = 116;
    memory_2[2747] = 105;
    memory_2[2748] = 69;
    memory_2[2749] = 109;
    memory_2[2750] = 78;
    memory_2[2751] = 105;
    memory_2[2752] = 89;
    memory_2[2753] = 83;
    memory_2[2754] = 49;
    memory_2[2755] = 116;
    memory_2[2756] = 108;
    memory_2[2757] = 119;
    memory_2[2758] = 75;
    memory_2[2759] = 71;
    memory_2[2760] = 104;
    memory_2[2761] = 73;
    memory_2[2762] = 86;
    memory_2[2763] = 109;
    memory_2[2764] = 69;
    memory_2[2765] = 122;
    memory_2[2766] = 79;
    memory_2[2767] = 88;
    memory_2[2768] = 82;
    memory_2[2769] = 113;
    memory_2[2770] = 79;
    memory_2[2771] = 89;
    memory_2[2772] = 105;
    memory_2[2773] = 82;
    memory_2[2774] = 101;
    memory_2[2775] = 104;
    memory_2[2776] = 104;
    memory_2[2777] = 97;
    memory_2[2778] = 115;
    memory_2[2779] = 109;
    memory_2[2780] = 77;
    memory_2[2781] = 119;
    memory_2[2782] = 74;
    memory_2[2783] = 48;
    memory_2[2784] = 76;
    memory_2[2785] = 67;
    memory_2[2786] = 87;
    memory_2[2787] = 68;
    memory_2[2788] = 70;
    memory_2[2789] = 86;
    memory_2[2790] = 50;
    memory_2[2791] = 120;
    memory_2[2792] = 65;
    memory_2[2793] = 53;
    memory_2[2794] = 97;
    memory_2[2795] = 48;
    memory_2[2796] = 74;
    memory_2[2797] = 120;
    memory_2[2798] = 85;
    memory_2[2799] = 67;
    memory_2[2800] = 67;
    memory_2[2801] = 81;
    memory_2[2802] = 65;
    memory_2[2803] = 55;
    memory_2[2804] = 34;
    memory_2[2805] = 32;
    memory_2[2806] = 97;
    memory_2[2807] = 108;
    memory_2[2808] = 116;
    memory_2[2809] = 61;
    memory_2[2810] = 34;
    memory_2[2811] = 65;
    memory_2[2812] = 77;
    memory_2[2813] = 57;
    memory_2[2814] = 46;
    memory_2[2815] = 103;
    memory_2[2816] = 105;
    memory_2[2817] = 102;
    memory_2[2818] = 34;
    memory_2[2819] = 32;
    memory_2[2820] = 87;
    memory_2[2821] = 73;
    memory_2[2822] = 68;
    memory_2[2823] = 84;
    memory_2[2824] = 72;
    memory_2[2825] = 61;
    memory_2[2826] = 54;
    memory_2[2827] = 48;
    memory_2[2828] = 32;
    memory_2[2829] = 72;
    memory_2[2830] = 69;
    memory_2[2831] = 73;
    memory_2[2832] = 71;
    memory_2[2833] = 72;
    memory_2[2834] = 84;
    memory_2[2835] = 61;
    memory_2[2836] = 57;
    memory_2[2837] = 48;
    memory_2[2838] = 47;
    memory_2[2839] = 62;
    memory_2[2840] = 60;
    memory_2[2841] = 47;
    memory_2[2842] = 112;
    memory_2[2843] = 62;
    memory_2[2844] = 60;
    memory_2[2845] = 47;
    memory_2[2846] = 98;
    memory_2[2847] = 111;
    memory_2[2848] = 100;
    memory_2[2849] = 121;
    memory_2[2850] = 62;
    memory_2[2851] = 60;
    memory_2[2852] = 47;
    memory_2[2853] = 104;
    memory_2[2854] = 116;
    memory_2[2855] = 109;
    memory_2[2856] = 108;
    memory_2[2857] = 62;
    memory_2[2858] = 0;
    memory_2[2859] = 87;
    memory_2[2860] = 101;
    memory_2[2861] = 108;
    memory_2[2862] = 99;
    memory_2[2863] = 111;
    memory_2[2864] = 109;
    memory_2[2865] = 101;
    memory_2[2866] = 32;
    memory_2[2867] = 116;
    memory_2[2868] = 111;
    memory_2[2869] = 32;
    memory_2[2870] = 116;
    memory_2[2871] = 104;
    memory_2[2872] = 101;
    memory_2[2873] = 32;
    memory_2[2874] = 78;
    memory_2[2875] = 101;
    memory_2[2876] = 120;
    memory_2[2877] = 121;
    memory_2[2878] = 115;
    memory_2[2879] = 51;
    memory_2[2880] = 32;
    memory_2[2881] = 67;
    memory_2[2882] = 104;
    memory_2[2883] = 105;
    memory_2[2884] = 112;
    memory_2[2885] = 115;
    memory_2[2886] = 45;
    memory_2[2887] = 50;
    memory_2[2888] = 46;
    memory_2[2889] = 48;
    memory_2[2890] = 32;
    memory_2[2891] = 100;
    memory_2[2892] = 101;
    memory_2[2893] = 109;
    memory_2[2894] = 111;
    memory_2[2895] = 33;
    memory_2[2896] = 10;
    memory_2[2897] = 0;
    memory_2[2898] = 67;
    memory_2[2899] = 111;
    memory_2[2900] = 110;
    memory_2[2901] = 110;
    memory_2[2902] = 101;
    memory_2[2903] = 99;
    memory_2[2904] = 116;
    memory_2[2905] = 32;
    memory_2[2906] = 121;
    memory_2[2907] = 111;
    memory_2[2908] = 117;
    memory_2[2909] = 114;
    memory_2[2910] = 32;
    memory_2[2911] = 87;
    memory_2[2912] = 101;
    memory_2[2913] = 98;
    memory_2[2914] = 32;
    memory_2[2915] = 98;
    memory_2[2916] = 114;
    memory_2[2917] = 111;
    memory_2[2918] = 119;
    memory_2[2919] = 115;
    memory_2[2920] = 101;
    memory_2[2921] = 114;
    memory_2[2922] = 32;
    memory_2[2923] = 116;
    memory_2[2924] = 111;
    memory_2[2925] = 32;
    memory_2[2926] = 49;
    memory_2[2927] = 57;
    memory_2[2928] = 50;
    memory_2[2929] = 46;
    memory_2[2930] = 49;
    memory_2[2931] = 54;
    memory_2[2932] = 56;
    memory_2[2933] = 46;
    memory_2[2934] = 48;
    memory_2[2935] = 46;
    memory_2[2936] = 49;
    memory_2[2937] = 49;
    memory_2[2938] = 57;
    memory_2[2939] = 10;
    memory_2[2940] = 0;
  end


  //////////////////////////////////////////////////////////////////////////////
  // INSTRUCTION INITIALIZATION                                                 
  //                                                                            
  // Initialise the contents of the instruction memory                          
  //
  // Intruction Set
  // ==============
  // 0 {'float': False, 'literal': True, 'right': False, 'unsigned': False, 'op': 'literal'}
  // 1 {'float': False, 'literal': True, 'right': False, 'unsigned': False, 'op': 'jmp_and_link'}
  // 2 {'float': False, 'literal': False, 'right': False, 'unsigned': False, 'op': 'stop'}
  // 3 {'float': False, 'literal': False, 'right': False, 'unsigned': False, 'op': 'move'}
  // 4 {'float': False, 'literal': False, 'right': False, 'unsigned': False, 'op': 'nop'}
  // 5 {'right': False, 'float': False, 'unsigned': False, 'literal': False, 'output': 'socket', 'op': 'write'}
  // 6 {'float': False, 'literal': False, 'right': False, 'unsigned': False, 'op': 'jmp_to_reg'}
  // 7 {'right': False, 'float': False, 'unsigned': False, 'literal': False, 'output': 'rs232_tx', 'op': 'write'}
  // 8 {'float': False, 'literal': False, 'right': False, 'unsigned': True, 'op': '+'}
  // 9 {'right': False, 'element_size': 2, 'float': False, 'unsigned': False, 'literal': False, 'op': 'memory_read_request'}
  // 10 {'right': False, 'element_size': 2, 'float': False, 'unsigned': False, 'literal': False, 'op': 'memory_read_wait'}
  // 11 {'right': False, 'element_size': 2, 'float': False, 'unsigned': False, 'literal': False, 'op': 'memory_read'}
  // 12 {'float': False, 'literal': True, 'right': False, 'unsigned': False, 'op': 'jmp_if_false'}
  // 13 {'float': False, 'literal': True, 'right': True, 'unsigned': True, 'op': '+'}
  // 14 {'float': False, 'literal': True, 'right': False, 'unsigned': False, 'op': 'goto'}
  // 15 {'float': False, 'literal': True, 'right': True, 'unsigned': True, 'op': '>='}
  // 16 {'float': False, 'literal': True, 'right': True, 'unsigned': True, 'op': '-'}
  // 17 {'float': False, 'literal': False, 'right': False, 'unsigned': True, 'op': '|'}
  // 18 {'float': False, 'literal': True, 'right': True, 'unsigned': True, 'op': '|'}
  // 19 {'float': False, 'literal': True, 'right': True, 'unsigned': False, 'op': '>='}
  // 20 {'float': False, 'literal': True, 'right': False, 'unsigned': False, 'op': '-'}
  // 21 {'float': False, 'literal': True, 'right': True, 'unsigned': False, 'op': '<<'}
  // 22 {'float': False, 'literal': True, 'right': True, 'unsigned': False, 'op': '&'}
  // 23 {'float': False, 'literal': True, 'right': True, 'unsigned': True, 'op': '=='}
  // 24 {'float': False, 'literal': True, 'right': False, 'unsigned': True, 'op': '|'}
  // 25 {'float': False, 'literal': True, 'right': True, 'unsigned': True, 'op': '>'}
  // 26 {'float': False, 'literal': True, 'right': True, 'unsigned': True, 'op': '<'}
  // 27 {'float': False, 'literal': False, 'right': False, 'unsigned': True, 'op': '<'}
  // 28 {'float': False, 'literal': False, 'right': False, 'unsigned': True, 'op': '=='}
  // 29 {'float': False, 'literal': True, 'right': True, 'unsigned': False, 'op': '+'}
  // 30 {'right': False, 'float': False, 'unsigned': False, 'literal': False, 'input': 'socket', 'op': 'read'}
  // 31 {'float': False, 'literal': True, 'right': True, 'unsigned': True, 'op': '>>'}
  // 32 {'float': False, 'literal': True, 'right': True, 'unsigned': True, 'op': '&'}
  // 33 {'right': False, 'element_size': 2, 'float': False, 'unsigned': False, 'literal': False, 'op': 'memory_write'}
  // 34 {'float': False, 'literal': True, 'right': False, 'unsigned': False, 'op': 'jmp_if_true'}
  // 35 {'float': False, 'literal': True, 'right': True, 'unsigned': False, 'op': '!='}
  // 36 {'right': False, 'float': False, 'unsigned': False, 'literal': False, 'output': 'leds', 'op': 'write'}
  // 37 {'right': False, 'float': False, 'unsigned': False, 'literal': False, 'input': 'switches', 'op': 'read'}
  // 38 {'float': False, 'literal': False, 'right': False, 'unsigned': False, 'op': '~'}
  // 39 {'float': False, 'literal': False, 'right': False, 'unsigned': False, 'op': '+'}
  // 40 {'right': False, 'float': False, 'unsigned': False, 'literal': False, 'input': 'buttons', 'op': 'read'}
  // 41 {'right': False, 'float': False, 'unsigned': False, 'literal': False, 'input': 'rs232_rx', 'op': 'read'}
  // Intructions
  // ===========
  
  initial
  begin
    instructions[0] = {6'd0, 7'd63, 7'd0, 32'd1};//{'dest': 63, 'literal': 1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1] = {6'd0, 7'd64, 7'd0, 32'd0};//{'dest': 64, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[2] = {6'd1, 7'd23, 7'd0, 32'd930};//{'dest': 23, 'label': 930, 'op': 'jmp_and_link'}
    instructions[3] = {6'd2, 7'd0, 7'd0, 32'd0};//{'op': 'stop'}
    instructions[4] = {6'd3, 7'd37, 7'd51, 32'd0};//{'dest': 37, 'src': 51, 'op': 'move'}
    instructions[5] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[6] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[7] = {6'd5, 7'd0, 7'd37, 32'd0};//{'src': 37, 'output': 'socket', 'op': 'write'}
    instructions[8] = {6'd6, 7'd0, 7'd50, 32'd0};//{'src': 50, 'op': 'jmp_to_reg'}
    instructions[9] = {6'd3, 7'd37, 7'd53, 32'd0};//{'dest': 37, 'src': 53, 'op': 'move'}
    instructions[10] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[11] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[12] = {6'd7, 7'd0, 7'd37, 32'd0};//{'src': 37, 'output': 'rs232_tx', 'op': 'write'}
    instructions[13] = {6'd6, 7'd0, 7'd52, 32'd0};//{'src': 52, 'op': 'jmp_to_reg'}
    instructions[14] = {6'd0, 7'd56, 7'd0, 32'd0};//{'dest': 56, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[15] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[16] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[17] = {6'd3, 7'd38, 7'd56, 32'd0};//{'dest': 38, 'src': 56, 'op': 'move'}
    instructions[18] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[19] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[20] = {6'd8, 7'd39, 7'd38, 32'd55};//{'dest': 39, 'src': 38, 'srcb': 55, 'signed': False, 'op': '+'}
    instructions[21] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[22] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[23] = {6'd9, 7'd0, 7'd39, 32'd0};//{'element_size': 2, 'src': 39, 'sequence': 140361208806720, 'op': 'memory_read_request'}
    instructions[24] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[25] = {6'd10, 7'd0, 7'd39, 32'd0};//{'element_size': 2, 'src': 39, 'sequence': 140361208806720, 'op': 'memory_read_wait'}
    instructions[26] = {6'd11, 7'd37, 7'd39, 32'd0};//{'dest': 37, 'src': 39, 'sequence': 140361208806720, 'element_size': 2, 'op': 'memory_read'}
    instructions[27] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[28] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[29] = {6'd12, 7'd0, 7'd37, 32'd47};//{'src': 37, 'label': 47, 'op': 'jmp_if_false'}
    instructions[30] = {6'd3, 7'd39, 7'd56, 32'd0};//{'dest': 39, 'src': 56, 'op': 'move'}
    instructions[31] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[32] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[33] = {6'd8, 7'd41, 7'd39, 32'd55};//{'dest': 41, 'src': 39, 'srcb': 55, 'signed': False, 'op': '+'}
    instructions[34] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[35] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[36] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361208827776, 'op': 'memory_read_request'}
    instructions[37] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[38] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361208827776, 'op': 'memory_read_wait'}
    instructions[39] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361208827776, 'element_size': 2, 'op': 'memory_read'}
    instructions[40] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[41] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[42] = {6'd3, 7'd53, 7'd38, 32'd0};//{'dest': 53, 'src': 38, 'op': 'move'}
    instructions[43] = {6'd1, 7'd52, 7'd0, 32'd9};//{'dest': 52, 'label': 9, 'op': 'jmp_and_link'}
    instructions[44] = {6'd3, 7'd37, 7'd56, 32'd0};//{'dest': 37, 'src': 56, 'op': 'move'}
    instructions[45] = {6'd13, 7'd56, 7'd56, 32'd1};//{'src': 56, 'right': 1, 'dest': 56, 'signed': False, 'op': '+', 'size': 2}
    instructions[46] = {6'd14, 7'd0, 7'd0, 32'd48};//{'label': 48, 'op': 'goto'}
    instructions[47] = {6'd14, 7'd0, 7'd0, 32'd49};//{'label': 49, 'op': 'goto'}
    instructions[48] = {6'd14, 7'd0, 7'd0, 32'd15};//{'label': 15, 'op': 'goto'}
    instructions[49] = {6'd6, 7'd0, 7'd54, 32'd0};//{'src': 54, 'op': 'jmp_to_reg'}
    instructions[50] = {6'd0, 7'd59, 7'd0, 32'd0};//{'dest': 59, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[51] = {6'd0, 7'd60, 7'd0, 32'd0};//{'dest': 60, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[52] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[53] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[54] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[55] = {6'd3, 7'd59, 7'd37, 32'd0};//{'dest': 59, 'src': 37, 'op': 'move'}
    instructions[56] = {6'd3, 7'd38, 7'd58, 32'd0};//{'dest': 38, 'src': 58, 'op': 'move'}
    instructions[57] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[58] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[59] = {6'd15, 7'd37, 7'd38, 32'd10000};//{'src': 38, 'right': 10000, 'dest': 37, 'signed': False, 'op': '>=', 'type': 'int', 'size': 2}
    instructions[60] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[61] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[62] = {6'd12, 7'd0, 7'd37, 32'd78};//{'src': 37, 'label': 78, 'op': 'jmp_if_false'}
    instructions[63] = {6'd3, 7'd38, 7'd58, 32'd0};//{'dest': 38, 'src': 58, 'op': 'move'}
    instructions[64] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[65] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[66] = {6'd16, 7'd37, 7'd38, 32'd10000};//{'src': 38, 'right': 10000, 'dest': 37, 'signed': False, 'op': '-', 'type': 'int', 'size': 2}
    instructions[67] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[68] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[69] = {6'd3, 7'd58, 7'd37, 32'd0};//{'dest': 58, 'src': 37, 'op': 'move'}
    instructions[70] = {6'd3, 7'd38, 7'd59, 32'd0};//{'dest': 38, 'src': 59, 'op': 'move'}
    instructions[71] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[72] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[73] = {6'd13, 7'd37, 7'd38, 32'd1};//{'src': 38, 'right': 1, 'dest': 37, 'signed': False, 'op': '+', 'type': 'int', 'size': 2}
    instructions[74] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[75] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[76] = {6'd3, 7'd59, 7'd37, 32'd0};//{'dest': 59, 'src': 37, 'op': 'move'}
    instructions[77] = {6'd14, 7'd0, 7'd0, 32'd79};//{'label': 79, 'op': 'goto'}
    instructions[78] = {6'd14, 7'd0, 7'd0, 32'd80};//{'label': 80, 'op': 'goto'}
    instructions[79] = {6'd14, 7'd0, 7'd0, 32'd56};//{'label': 56, 'op': 'goto'}
    instructions[80] = {6'd3, 7'd38, 7'd59, 32'd0};//{'dest': 38, 'src': 59, 'op': 'move'}
    instructions[81] = {6'd3, 7'd39, 7'd60, 32'd0};//{'dest': 39, 'src': 60, 'op': 'move'}
    instructions[82] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[83] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[84] = {6'd17, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[85] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[86] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[87] = {6'd12, 7'd0, 7'd37, 32'd101};//{'src': 37, 'label': 101, 'op': 'jmp_if_false'}
    instructions[88] = {6'd3, 7'd39, 7'd59, 32'd0};//{'dest': 39, 'src': 59, 'op': 'move'}
    instructions[89] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[90] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[91] = {6'd18, 7'd38, 7'd39, 32'd48};//{'src': 39, 'right': 48, 'dest': 38, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[92] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[93] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[94] = {6'd3, 7'd53, 7'd38, 32'd0};//{'dest': 53, 'src': 38, 'op': 'move'}
    instructions[95] = {6'd1, 7'd52, 7'd0, 32'd9};//{'dest': 52, 'label': 9, 'op': 'jmp_and_link'}
    instructions[96] = {6'd0, 7'd37, 7'd0, 32'd1};//{'dest': 37, 'literal': 1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[97] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[98] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[99] = {6'd3, 7'd60, 7'd37, 32'd0};//{'dest': 60, 'src': 37, 'op': 'move'}
    instructions[100] = {6'd14, 7'd0, 7'd0, 32'd101};//{'label': 101, 'op': 'goto'}
    instructions[101] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[102] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[103] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[104] = {6'd3, 7'd59, 7'd37, 32'd0};//{'dest': 59, 'src': 37, 'op': 'move'}
    instructions[105] = {6'd3, 7'd38, 7'd58, 32'd0};//{'dest': 38, 'src': 58, 'op': 'move'}
    instructions[106] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[107] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[108] = {6'd15, 7'd37, 7'd38, 32'd1000};//{'src': 38, 'right': 1000, 'dest': 37, 'signed': False, 'op': '>=', 'type': 'int', 'size': 2}
    instructions[109] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[110] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[111] = {6'd12, 7'd0, 7'd37, 32'd127};//{'src': 37, 'label': 127, 'op': 'jmp_if_false'}
    instructions[112] = {6'd3, 7'd38, 7'd58, 32'd0};//{'dest': 38, 'src': 58, 'op': 'move'}
    instructions[113] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[114] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[115] = {6'd16, 7'd37, 7'd38, 32'd1000};//{'src': 38, 'right': 1000, 'dest': 37, 'signed': False, 'op': '-', 'type': 'int', 'size': 2}
    instructions[116] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[117] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[118] = {6'd3, 7'd58, 7'd37, 32'd0};//{'dest': 58, 'src': 37, 'op': 'move'}
    instructions[119] = {6'd3, 7'd38, 7'd59, 32'd0};//{'dest': 38, 'src': 59, 'op': 'move'}
    instructions[120] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[121] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[122] = {6'd13, 7'd37, 7'd38, 32'd1};//{'src': 38, 'right': 1, 'dest': 37, 'signed': False, 'op': '+', 'type': 'int', 'size': 2}
    instructions[123] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[124] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[125] = {6'd3, 7'd59, 7'd37, 32'd0};//{'dest': 59, 'src': 37, 'op': 'move'}
    instructions[126] = {6'd14, 7'd0, 7'd0, 32'd128};//{'label': 128, 'op': 'goto'}
    instructions[127] = {6'd14, 7'd0, 7'd0, 32'd129};//{'label': 129, 'op': 'goto'}
    instructions[128] = {6'd14, 7'd0, 7'd0, 32'd105};//{'label': 105, 'op': 'goto'}
    instructions[129] = {6'd3, 7'd38, 7'd59, 32'd0};//{'dest': 38, 'src': 59, 'op': 'move'}
    instructions[130] = {6'd3, 7'd39, 7'd60, 32'd0};//{'dest': 39, 'src': 60, 'op': 'move'}
    instructions[131] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[132] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[133] = {6'd17, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[134] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[135] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[136] = {6'd12, 7'd0, 7'd37, 32'd150};//{'src': 37, 'label': 150, 'op': 'jmp_if_false'}
    instructions[137] = {6'd3, 7'd39, 7'd59, 32'd0};//{'dest': 39, 'src': 59, 'op': 'move'}
    instructions[138] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[139] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[140] = {6'd18, 7'd38, 7'd39, 32'd48};//{'src': 39, 'right': 48, 'dest': 38, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[141] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[142] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[143] = {6'd3, 7'd53, 7'd38, 32'd0};//{'dest': 53, 'src': 38, 'op': 'move'}
    instructions[144] = {6'd1, 7'd52, 7'd0, 32'd9};//{'dest': 52, 'label': 9, 'op': 'jmp_and_link'}
    instructions[145] = {6'd0, 7'd37, 7'd0, 32'd1};//{'dest': 37, 'literal': 1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[146] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[147] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[148] = {6'd3, 7'd60, 7'd37, 32'd0};//{'dest': 60, 'src': 37, 'op': 'move'}
    instructions[149] = {6'd14, 7'd0, 7'd0, 32'd150};//{'label': 150, 'op': 'goto'}
    instructions[150] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[151] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[152] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[153] = {6'd3, 7'd59, 7'd37, 32'd0};//{'dest': 59, 'src': 37, 'op': 'move'}
    instructions[154] = {6'd3, 7'd38, 7'd58, 32'd0};//{'dest': 38, 'src': 58, 'op': 'move'}
    instructions[155] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[156] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[157] = {6'd15, 7'd37, 7'd38, 32'd100};//{'src': 38, 'right': 100, 'dest': 37, 'signed': False, 'op': '>=', 'type': 'int', 'size': 2}
    instructions[158] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[159] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[160] = {6'd12, 7'd0, 7'd37, 32'd176};//{'src': 37, 'label': 176, 'op': 'jmp_if_false'}
    instructions[161] = {6'd3, 7'd38, 7'd58, 32'd0};//{'dest': 38, 'src': 58, 'op': 'move'}
    instructions[162] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[163] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[164] = {6'd16, 7'd37, 7'd38, 32'd100};//{'src': 38, 'right': 100, 'dest': 37, 'signed': False, 'op': '-', 'type': 'int', 'size': 2}
    instructions[165] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[166] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[167] = {6'd3, 7'd58, 7'd37, 32'd0};//{'dest': 58, 'src': 37, 'op': 'move'}
    instructions[168] = {6'd3, 7'd38, 7'd59, 32'd0};//{'dest': 38, 'src': 59, 'op': 'move'}
    instructions[169] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[170] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[171] = {6'd13, 7'd37, 7'd38, 32'd1};//{'src': 38, 'right': 1, 'dest': 37, 'signed': False, 'op': '+', 'type': 'int', 'size': 2}
    instructions[172] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[173] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[174] = {6'd3, 7'd59, 7'd37, 32'd0};//{'dest': 59, 'src': 37, 'op': 'move'}
    instructions[175] = {6'd14, 7'd0, 7'd0, 32'd177};//{'label': 177, 'op': 'goto'}
    instructions[176] = {6'd14, 7'd0, 7'd0, 32'd178};//{'label': 178, 'op': 'goto'}
    instructions[177] = {6'd14, 7'd0, 7'd0, 32'd154};//{'label': 154, 'op': 'goto'}
    instructions[178] = {6'd3, 7'd38, 7'd59, 32'd0};//{'dest': 38, 'src': 59, 'op': 'move'}
    instructions[179] = {6'd3, 7'd39, 7'd60, 32'd0};//{'dest': 39, 'src': 60, 'op': 'move'}
    instructions[180] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[181] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[182] = {6'd17, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[183] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[184] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[185] = {6'd12, 7'd0, 7'd37, 32'd199};//{'src': 37, 'label': 199, 'op': 'jmp_if_false'}
    instructions[186] = {6'd3, 7'd39, 7'd59, 32'd0};//{'dest': 39, 'src': 59, 'op': 'move'}
    instructions[187] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[188] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[189] = {6'd18, 7'd38, 7'd39, 32'd48};//{'src': 39, 'right': 48, 'dest': 38, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[190] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[191] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[192] = {6'd3, 7'd53, 7'd38, 32'd0};//{'dest': 53, 'src': 38, 'op': 'move'}
    instructions[193] = {6'd1, 7'd52, 7'd0, 32'd9};//{'dest': 52, 'label': 9, 'op': 'jmp_and_link'}
    instructions[194] = {6'd0, 7'd37, 7'd0, 32'd1};//{'dest': 37, 'literal': 1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[195] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[196] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[197] = {6'd3, 7'd60, 7'd37, 32'd0};//{'dest': 60, 'src': 37, 'op': 'move'}
    instructions[198] = {6'd14, 7'd0, 7'd0, 32'd199};//{'label': 199, 'op': 'goto'}
    instructions[199] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[200] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[201] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[202] = {6'd3, 7'd59, 7'd37, 32'd0};//{'dest': 59, 'src': 37, 'op': 'move'}
    instructions[203] = {6'd3, 7'd38, 7'd58, 32'd0};//{'dest': 38, 'src': 58, 'op': 'move'}
    instructions[204] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[205] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[206] = {6'd15, 7'd37, 7'd38, 32'd10};//{'src': 38, 'right': 10, 'dest': 37, 'signed': False, 'op': '>=', 'type': 'int', 'size': 2}
    instructions[207] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[208] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[209] = {6'd12, 7'd0, 7'd37, 32'd225};//{'src': 37, 'label': 225, 'op': 'jmp_if_false'}
    instructions[210] = {6'd3, 7'd38, 7'd58, 32'd0};//{'dest': 38, 'src': 58, 'op': 'move'}
    instructions[211] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[212] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[213] = {6'd16, 7'd37, 7'd38, 32'd10};//{'src': 38, 'right': 10, 'dest': 37, 'signed': False, 'op': '-', 'type': 'int', 'size': 2}
    instructions[214] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[215] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[216] = {6'd3, 7'd58, 7'd37, 32'd0};//{'dest': 58, 'src': 37, 'op': 'move'}
    instructions[217] = {6'd3, 7'd38, 7'd59, 32'd0};//{'dest': 38, 'src': 59, 'op': 'move'}
    instructions[218] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[219] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[220] = {6'd13, 7'd37, 7'd38, 32'd1};//{'src': 38, 'right': 1, 'dest': 37, 'signed': False, 'op': '+', 'type': 'int', 'size': 2}
    instructions[221] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[222] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[223] = {6'd3, 7'd59, 7'd37, 32'd0};//{'dest': 59, 'src': 37, 'op': 'move'}
    instructions[224] = {6'd14, 7'd0, 7'd0, 32'd226};//{'label': 226, 'op': 'goto'}
    instructions[225] = {6'd14, 7'd0, 7'd0, 32'd227};//{'label': 227, 'op': 'goto'}
    instructions[226] = {6'd14, 7'd0, 7'd0, 32'd203};//{'label': 203, 'op': 'goto'}
    instructions[227] = {6'd3, 7'd38, 7'd59, 32'd0};//{'dest': 38, 'src': 59, 'op': 'move'}
    instructions[228] = {6'd3, 7'd39, 7'd60, 32'd0};//{'dest': 39, 'src': 60, 'op': 'move'}
    instructions[229] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[230] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[231] = {6'd17, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[232] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[233] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[234] = {6'd12, 7'd0, 7'd37, 32'd248};//{'src': 37, 'label': 248, 'op': 'jmp_if_false'}
    instructions[235] = {6'd3, 7'd39, 7'd59, 32'd0};//{'dest': 39, 'src': 59, 'op': 'move'}
    instructions[236] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[237] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[238] = {6'd18, 7'd38, 7'd39, 32'd48};//{'src': 39, 'right': 48, 'dest': 38, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[239] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[240] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[241] = {6'd3, 7'd53, 7'd38, 32'd0};//{'dest': 53, 'src': 38, 'op': 'move'}
    instructions[242] = {6'd1, 7'd52, 7'd0, 32'd9};//{'dest': 52, 'label': 9, 'op': 'jmp_and_link'}
    instructions[243] = {6'd0, 7'd37, 7'd0, 32'd1};//{'dest': 37, 'literal': 1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[244] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[245] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[246] = {6'd3, 7'd60, 7'd37, 32'd0};//{'dest': 60, 'src': 37, 'op': 'move'}
    instructions[247] = {6'd14, 7'd0, 7'd0, 32'd248};//{'label': 248, 'op': 'goto'}
    instructions[248] = {6'd3, 7'd39, 7'd58, 32'd0};//{'dest': 39, 'src': 58, 'op': 'move'}
    instructions[249] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[250] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[251] = {6'd18, 7'd38, 7'd39, 32'd48};//{'src': 39, 'right': 48, 'dest': 38, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[252] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[253] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[254] = {6'd3, 7'd53, 7'd38, 32'd0};//{'dest': 53, 'src': 38, 'op': 'move'}
    instructions[255] = {6'd1, 7'd52, 7'd0, 32'd9};//{'dest': 52, 'label': 9, 'op': 'jmp_and_link'}
    instructions[256] = {6'd6, 7'd0, 7'd57, 32'd0};//{'src': 57, 'op': 'jmp_to_reg'}
    instructions[257] = {6'd3, 7'd38, 7'd62, 32'd0};//{'dest': 38, 'src': 62, 'op': 'move'}
    instructions[258] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[259] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[260] = {6'd19, 7'd37, 7'd38, 32'd0};//{'src': 38, 'right': 0, 'dest': 37, 'signed': True, 'op': '>=', 'type': 'int', 'size': 2}
    instructions[261] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[262] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[263] = {6'd12, 7'd0, 7'd37, 32'd270};//{'src': 37, 'label': 270, 'op': 'jmp_if_false'}
    instructions[264] = {6'd3, 7'd38, 7'd62, 32'd0};//{'dest': 38, 'src': 62, 'op': 'move'}
    instructions[265] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[266] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[267] = {6'd3, 7'd58, 7'd38, 32'd0};//{'dest': 58, 'src': 38, 'op': 'move'}
    instructions[268] = {6'd1, 7'd57, 7'd0, 32'd50};//{'dest': 57, 'label': 50, 'op': 'jmp_and_link'}
    instructions[269] = {6'd14, 7'd0, 7'd0, 32'd283};//{'label': 283, 'op': 'goto'}
    instructions[270] = {6'd0, 7'd38, 7'd0, 32'd45};//{'dest': 38, 'literal': 45, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[271] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[272] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[273] = {6'd3, 7'd53, 7'd38, 32'd0};//{'dest': 53, 'src': 38, 'op': 'move'}
    instructions[274] = {6'd1, 7'd52, 7'd0, 32'd9};//{'dest': 52, 'label': 9, 'op': 'jmp_and_link'}
    instructions[275] = {6'd3, 7'd39, 7'd62, 32'd0};//{'dest': 39, 'src': 62, 'op': 'move'}
    instructions[276] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[277] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[278] = {6'd20, 7'd38, 7'd39, 32'd0};//{'src': 39, 'dest': 38, 'signed': True, 'op': '-', 'size': 2, 'type': 'int', 'left': 0}
    instructions[279] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[280] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[281] = {6'd3, 7'd58, 7'd38, 32'd0};//{'dest': 58, 'src': 38, 'op': 'move'}
    instructions[282] = {6'd1, 7'd57, 7'd0, 32'd50};//{'dest': 57, 'label': 50, 'op': 'jmp_and_link'}
    instructions[283] = {6'd6, 7'd0, 7'd61, 32'd0};//{'src': 61, 'op': 'jmp_to_reg'}
    instructions[284] = {6'd3, 7'd37, 7'd63, 32'd0};//{'dest': 37, 'src': 63, 'op': 'move'}
    instructions[285] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[286] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[287] = {6'd12, 7'd0, 7'd37, 32'd300};//{'src': 37, 'label': 300, 'op': 'jmp_if_false'}
    instructions[288] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[289] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[290] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[291] = {6'd3, 7'd63, 7'd37, 32'd0};//{'dest': 63, 'src': 37, 'op': 'move'}
    instructions[292] = {6'd3, 7'd38, 7'd66, 32'd0};//{'dest': 38, 'src': 66, 'op': 'move'}
    instructions[293] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[294] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[295] = {6'd21, 7'd37, 7'd38, 32'd8};//{'src': 38, 'right': 8, 'dest': 37, 'signed': True, 'op': '<<', 'type': 'int', 'size': 2}
    instructions[296] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[297] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[298] = {6'd3, 7'd64, 7'd37, 32'd0};//{'dest': 64, 'src': 37, 'op': 'move'}
    instructions[299] = {6'd14, 7'd0, 7'd0, 32'd322};//{'label': 322, 'op': 'goto'}
    instructions[300] = {6'd0, 7'd37, 7'd0, 32'd1};//{'dest': 37, 'literal': 1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[301] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[302] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[303] = {6'd3, 7'd63, 7'd37, 32'd0};//{'dest': 63, 'src': 37, 'op': 'move'}
    instructions[304] = {6'd3, 7'd38, 7'd64, 32'd0};//{'dest': 38, 'src': 64, 'op': 'move'}
    instructions[305] = {6'd3, 7'd41, 7'd66, 32'd0};//{'dest': 41, 'src': 66, 'op': 'move'}
    instructions[306] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[307] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[308] = {6'd22, 7'd39, 7'd41, 32'd255};//{'src': 41, 'right': 255, 'dest': 39, 'signed': True, 'op': '&', 'type': 'int', 'size': 2}
    instructions[309] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[310] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[311] = {6'd17, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[312] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[313] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[314] = {6'd3, 7'd64, 7'd37, 32'd0};//{'dest': 64, 'src': 37, 'op': 'move'}
    instructions[315] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[316] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[317] = {6'd3, 7'd38, 7'd64, 32'd0};//{'dest': 38, 'src': 64, 'op': 'move'}
    instructions[318] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[319] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[320] = {6'd3, 7'd51, 7'd38, 32'd0};//{'dest': 51, 'src': 38, 'op': 'move'}
    instructions[321] = {6'd1, 7'd50, 7'd0, 32'd4};//{'dest': 50, 'label': 4, 'op': 'jmp_and_link'}
    instructions[322] = {6'd6, 7'd0, 7'd65, 32'd0};//{'src': 65, 'op': 'jmp_to_reg'}
    instructions[323] = {6'd3, 7'd38, 7'd63, 32'd0};//{'dest': 38, 'src': 63, 'op': 'move'}
    instructions[324] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[325] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[326] = {6'd23, 7'd37, 7'd38, 32'd0};//{'src': 38, 'right': 0, 'dest': 37, 'signed': False, 'op': '==', 'type': 'int', 'size': 2}
    instructions[327] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[328] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[329] = {6'd12, 7'd0, 7'd37, 32'd336};//{'src': 37, 'label': 336, 'op': 'jmp_if_false'}
    instructions[330] = {6'd3, 7'd38, 7'd64, 32'd0};//{'dest': 38, 'src': 64, 'op': 'move'}
    instructions[331] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[332] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[333] = {6'd3, 7'd51, 7'd38, 32'd0};//{'dest': 51, 'src': 38, 'op': 'move'}
    instructions[334] = {6'd1, 7'd50, 7'd0, 32'd4};//{'dest': 50, 'label': 4, 'op': 'jmp_and_link'}
    instructions[335] = {6'd14, 7'd0, 7'd0, 32'd336};//{'label': 336, 'op': 'goto'}
    instructions[336] = {6'd0, 7'd37, 7'd0, 32'd1};//{'dest': 37, 'literal': 1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[337] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[338] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[339] = {6'd3, 7'd63, 7'd37, 32'd0};//{'dest': 63, 'src': 37, 'op': 'move'}
    instructions[340] = {6'd6, 7'd0, 7'd67, 32'd0};//{'src': 67, 'op': 'jmp_to_reg'}
    instructions[341] = {6'd0, 7'd70, 7'd0, 32'd0};//{'dest': 70, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[342] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[343] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[344] = {6'd3, 7'd38, 7'd70, 32'd0};//{'dest': 38, 'src': 70, 'op': 'move'}
    instructions[345] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[346] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[347] = {6'd8, 7'd39, 7'd38, 32'd69};//{'dest': 39, 'src': 38, 'srcb': 69, 'signed': False, 'op': '+'}
    instructions[348] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[349] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[350] = {6'd9, 7'd0, 7'd39, 32'd0};//{'element_size': 2, 'src': 39, 'sequence': 140361208960208, 'op': 'memory_read_request'}
    instructions[351] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[352] = {6'd10, 7'd0, 7'd39, 32'd0};//{'element_size': 2, 'src': 39, 'sequence': 140361208960208, 'op': 'memory_read_wait'}
    instructions[353] = {6'd11, 7'd37, 7'd39, 32'd0};//{'dest': 37, 'src': 39, 'sequence': 140361208960208, 'element_size': 2, 'op': 'memory_read'}
    instructions[354] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[355] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[356] = {6'd12, 7'd0, 7'd37, 32'd374};//{'src': 37, 'label': 374, 'op': 'jmp_if_false'}
    instructions[357] = {6'd3, 7'd39, 7'd70, 32'd0};//{'dest': 39, 'src': 70, 'op': 'move'}
    instructions[358] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[359] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[360] = {6'd8, 7'd41, 7'd39, 32'd69};//{'dest': 41, 'src': 39, 'srcb': 69, 'signed': False, 'op': '+'}
    instructions[361] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[362] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[363] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361208968976, 'op': 'memory_read_request'}
    instructions[364] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[365] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361208968976, 'op': 'memory_read_wait'}
    instructions[366] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361208968976, 'element_size': 2, 'op': 'memory_read'}
    instructions[367] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[368] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[369] = {6'd3, 7'd66, 7'd38, 32'd0};//{'dest': 66, 'src': 38, 'op': 'move'}
    instructions[370] = {6'd1, 7'd65, 7'd0, 32'd284};//{'dest': 65, 'label': 284, 'op': 'jmp_and_link'}
    instructions[371] = {6'd3, 7'd37, 7'd70, 32'd0};//{'dest': 37, 'src': 70, 'op': 'move'}
    instructions[372] = {6'd13, 7'd70, 7'd70, 32'd1};//{'src': 70, 'right': 1, 'dest': 70, 'signed': False, 'op': '+', 'size': 2}
    instructions[373] = {6'd14, 7'd0, 7'd0, 32'd375};//{'label': 375, 'op': 'goto'}
    instructions[374] = {6'd14, 7'd0, 7'd0, 32'd376};//{'label': 376, 'op': 'goto'}
    instructions[375] = {6'd14, 7'd0, 7'd0, 32'd342};//{'label': 342, 'op': 'goto'}
    instructions[376] = {6'd6, 7'd0, 7'd68, 32'd0};//{'src': 68, 'op': 'jmp_to_reg'}
    instructions[377] = {6'd0, 7'd73, 7'd0, 32'd0};//{'dest': 73, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[378] = {6'd0, 7'd74, 7'd0, 32'd0};//{'dest': 74, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[379] = {6'd0, 7'd75, 7'd0, 32'd0};//{'dest': 75, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[380] = {6'd0, 7'd76, 7'd0, 32'd0};//{'dest': 76, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[381] = {6'd0, 7'd0, 7'd0, 32'd0};//{'dest': 0, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[382] = {6'd0, 7'd1, 7'd0, 32'd0};//{'dest': 1, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[383] = {6'd3, 7'd38, 7'd72, 32'd0};//{'dest': 38, 'src': 72, 'op': 'move'}
    instructions[384] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[385] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[386] = {6'd15, 7'd37, 7'd38, 32'd10000};//{'src': 38, 'right': 10000, 'dest': 37, 'signed': False, 'op': '>=', 'type': 'int', 'size': 2}
    instructions[387] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[388] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[389] = {6'd12, 7'd0, 7'd37, 32'd400};//{'src': 37, 'label': 400, 'op': 'jmp_if_false'}
    instructions[390] = {6'd3, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'src': 0, 'op': 'move'}
    instructions[391] = {6'd13, 7'd0, 7'd0, 32'd1};//{'src': 0, 'right': 1, 'dest': 0, 'signed': False, 'op': '+', 'size': 2}
    instructions[392] = {6'd3, 7'd38, 7'd72, 32'd0};//{'dest': 38, 'src': 72, 'op': 'move'}
    instructions[393] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[394] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[395] = {6'd16, 7'd37, 7'd38, 32'd10000};//{'src': 38, 'right': 10000, 'dest': 37, 'signed': False, 'op': '-', 'type': 'int', 'size': 2}
    instructions[396] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[397] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[398] = {6'd3, 7'd72, 7'd37, 32'd0};//{'dest': 72, 'src': 37, 'op': 'move'}
    instructions[399] = {6'd14, 7'd0, 7'd0, 32'd401};//{'label': 401, 'op': 'goto'}
    instructions[400] = {6'd14, 7'd0, 7'd0, 32'd402};//{'label': 402, 'op': 'goto'}
    instructions[401] = {6'd14, 7'd0, 7'd0, 32'd383};//{'label': 383, 'op': 'goto'}
    instructions[402] = {6'd3, 7'd38, 7'd0, 32'd0};//{'dest': 38, 'src': 0, 'op': 'move'}
    instructions[403] = {6'd3, 7'd39, 7'd1, 32'd0};//{'dest': 39, 'src': 1, 'op': 'move'}
    instructions[404] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[405] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[406] = {6'd17, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[407] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[408] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[409] = {6'd12, 7'd0, 7'd37, 32'd423};//{'src': 37, 'label': 423, 'op': 'jmp_if_false'}
    instructions[410] = {6'd3, 7'd39, 7'd0, 32'd0};//{'dest': 39, 'src': 0, 'op': 'move'}
    instructions[411] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[412] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[413] = {6'd24, 7'd38, 7'd39, 32'd48};//{'src': 39, 'dest': 38, 'signed': False, 'op': '|', 'size': 2, 'type': 'int', 'left': 48}
    instructions[414] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[415] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[416] = {6'd3, 7'd66, 7'd38, 32'd0};//{'dest': 66, 'src': 38, 'op': 'move'}
    instructions[417] = {6'd1, 7'd65, 7'd0, 32'd284};//{'dest': 65, 'label': 284, 'op': 'jmp_and_link'}
    instructions[418] = {6'd0, 7'd37, 7'd0, 32'd1};//{'dest': 37, 'literal': 1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[419] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[420] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[421] = {6'd3, 7'd1, 7'd37, 32'd0};//{'dest': 1, 'src': 37, 'op': 'move'}
    instructions[422] = {6'd14, 7'd0, 7'd0, 32'd423};//{'label': 423, 'op': 'goto'}
    instructions[423] = {6'd3, 7'd38, 7'd72, 32'd0};//{'dest': 38, 'src': 72, 'op': 'move'}
    instructions[424] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[425] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[426] = {6'd15, 7'd37, 7'd38, 32'd1000};//{'src': 38, 'right': 1000, 'dest': 37, 'signed': False, 'op': '>=', 'type': 'int', 'size': 2}
    instructions[427] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[428] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[429] = {6'd12, 7'd0, 7'd37, 32'd440};//{'src': 37, 'label': 440, 'op': 'jmp_if_false'}
    instructions[430] = {6'd3, 7'd37, 7'd76, 32'd0};//{'dest': 37, 'src': 76, 'op': 'move'}
    instructions[431] = {6'd13, 7'd76, 7'd76, 32'd1};//{'src': 76, 'right': 1, 'dest': 76, 'signed': False, 'op': '+', 'size': 2}
    instructions[432] = {6'd3, 7'd38, 7'd72, 32'd0};//{'dest': 38, 'src': 72, 'op': 'move'}
    instructions[433] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[434] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[435] = {6'd16, 7'd37, 7'd38, 32'd1000};//{'src': 38, 'right': 1000, 'dest': 37, 'signed': False, 'op': '-', 'type': 'int', 'size': 2}
    instructions[436] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[437] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[438] = {6'd3, 7'd72, 7'd37, 32'd0};//{'dest': 72, 'src': 37, 'op': 'move'}
    instructions[439] = {6'd14, 7'd0, 7'd0, 32'd441};//{'label': 441, 'op': 'goto'}
    instructions[440] = {6'd14, 7'd0, 7'd0, 32'd442};//{'label': 442, 'op': 'goto'}
    instructions[441] = {6'd14, 7'd0, 7'd0, 32'd423};//{'label': 423, 'op': 'goto'}
    instructions[442] = {6'd3, 7'd38, 7'd76, 32'd0};//{'dest': 38, 'src': 76, 'op': 'move'}
    instructions[443] = {6'd3, 7'd39, 7'd1, 32'd0};//{'dest': 39, 'src': 1, 'op': 'move'}
    instructions[444] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[445] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[446] = {6'd17, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[447] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[448] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[449] = {6'd12, 7'd0, 7'd37, 32'd463};//{'src': 37, 'label': 463, 'op': 'jmp_if_false'}
    instructions[450] = {6'd3, 7'd39, 7'd76, 32'd0};//{'dest': 39, 'src': 76, 'op': 'move'}
    instructions[451] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[452] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[453] = {6'd24, 7'd38, 7'd39, 32'd48};//{'src': 39, 'dest': 38, 'signed': False, 'op': '|', 'size': 2, 'type': 'int', 'left': 48}
    instructions[454] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[455] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[456] = {6'd3, 7'd66, 7'd38, 32'd0};//{'dest': 66, 'src': 38, 'op': 'move'}
    instructions[457] = {6'd1, 7'd65, 7'd0, 32'd284};//{'dest': 65, 'label': 284, 'op': 'jmp_and_link'}
    instructions[458] = {6'd0, 7'd37, 7'd0, 32'd1};//{'dest': 37, 'literal': 1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[459] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[460] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[461] = {6'd3, 7'd1, 7'd37, 32'd0};//{'dest': 1, 'src': 37, 'op': 'move'}
    instructions[462] = {6'd14, 7'd0, 7'd0, 32'd463};//{'label': 463, 'op': 'goto'}
    instructions[463] = {6'd3, 7'd38, 7'd72, 32'd0};//{'dest': 38, 'src': 72, 'op': 'move'}
    instructions[464] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[465] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[466] = {6'd15, 7'd37, 7'd38, 32'd100};//{'src': 38, 'right': 100, 'dest': 37, 'signed': False, 'op': '>=', 'type': 'int', 'size': 2}
    instructions[467] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[468] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[469] = {6'd12, 7'd0, 7'd37, 32'd480};//{'src': 37, 'label': 480, 'op': 'jmp_if_false'}
    instructions[470] = {6'd3, 7'd37, 7'd75, 32'd0};//{'dest': 37, 'src': 75, 'op': 'move'}
    instructions[471] = {6'd13, 7'd75, 7'd75, 32'd1};//{'src': 75, 'right': 1, 'dest': 75, 'signed': False, 'op': '+', 'size': 2}
    instructions[472] = {6'd3, 7'd38, 7'd72, 32'd0};//{'dest': 38, 'src': 72, 'op': 'move'}
    instructions[473] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[474] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[475] = {6'd16, 7'd37, 7'd38, 32'd100};//{'src': 38, 'right': 100, 'dest': 37, 'signed': False, 'op': '-', 'type': 'int', 'size': 2}
    instructions[476] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[477] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[478] = {6'd3, 7'd72, 7'd37, 32'd0};//{'dest': 72, 'src': 37, 'op': 'move'}
    instructions[479] = {6'd14, 7'd0, 7'd0, 32'd481};//{'label': 481, 'op': 'goto'}
    instructions[480] = {6'd14, 7'd0, 7'd0, 32'd482};//{'label': 482, 'op': 'goto'}
    instructions[481] = {6'd14, 7'd0, 7'd0, 32'd463};//{'label': 463, 'op': 'goto'}
    instructions[482] = {6'd3, 7'd38, 7'd75, 32'd0};//{'dest': 38, 'src': 75, 'op': 'move'}
    instructions[483] = {6'd3, 7'd39, 7'd1, 32'd0};//{'dest': 39, 'src': 1, 'op': 'move'}
    instructions[484] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[485] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[486] = {6'd17, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[487] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[488] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[489] = {6'd12, 7'd0, 7'd37, 32'd503};//{'src': 37, 'label': 503, 'op': 'jmp_if_false'}
    instructions[490] = {6'd3, 7'd39, 7'd75, 32'd0};//{'dest': 39, 'src': 75, 'op': 'move'}
    instructions[491] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[492] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[493] = {6'd24, 7'd38, 7'd39, 32'd48};//{'src': 39, 'dest': 38, 'signed': False, 'op': '|', 'size': 2, 'type': 'int', 'left': 48}
    instructions[494] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[495] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[496] = {6'd3, 7'd66, 7'd38, 32'd0};//{'dest': 66, 'src': 38, 'op': 'move'}
    instructions[497] = {6'd1, 7'd65, 7'd0, 32'd284};//{'dest': 65, 'label': 284, 'op': 'jmp_and_link'}
    instructions[498] = {6'd0, 7'd37, 7'd0, 32'd1};//{'dest': 37, 'literal': 1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[499] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[500] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[501] = {6'd3, 7'd1, 7'd37, 32'd0};//{'dest': 1, 'src': 37, 'op': 'move'}
    instructions[502] = {6'd14, 7'd0, 7'd0, 32'd503};//{'label': 503, 'op': 'goto'}
    instructions[503] = {6'd3, 7'd38, 7'd72, 32'd0};//{'dest': 38, 'src': 72, 'op': 'move'}
    instructions[504] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[505] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[506] = {6'd15, 7'd37, 7'd38, 32'd10};//{'src': 38, 'right': 10, 'dest': 37, 'signed': False, 'op': '>=', 'type': 'int', 'size': 2}
    instructions[507] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[508] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[509] = {6'd12, 7'd0, 7'd37, 32'd520};//{'src': 37, 'label': 520, 'op': 'jmp_if_false'}
    instructions[510] = {6'd3, 7'd37, 7'd74, 32'd0};//{'dest': 37, 'src': 74, 'op': 'move'}
    instructions[511] = {6'd13, 7'd74, 7'd74, 32'd1};//{'src': 74, 'right': 1, 'dest': 74, 'signed': False, 'op': '+', 'size': 2}
    instructions[512] = {6'd3, 7'd38, 7'd72, 32'd0};//{'dest': 38, 'src': 72, 'op': 'move'}
    instructions[513] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[514] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[515] = {6'd16, 7'd37, 7'd38, 32'd10};//{'src': 38, 'right': 10, 'dest': 37, 'signed': False, 'op': '-', 'type': 'int', 'size': 2}
    instructions[516] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[517] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[518] = {6'd3, 7'd72, 7'd37, 32'd0};//{'dest': 72, 'src': 37, 'op': 'move'}
    instructions[519] = {6'd14, 7'd0, 7'd0, 32'd521};//{'label': 521, 'op': 'goto'}
    instructions[520] = {6'd14, 7'd0, 7'd0, 32'd522};//{'label': 522, 'op': 'goto'}
    instructions[521] = {6'd14, 7'd0, 7'd0, 32'd503};//{'label': 503, 'op': 'goto'}
    instructions[522] = {6'd3, 7'd38, 7'd74, 32'd0};//{'dest': 38, 'src': 74, 'op': 'move'}
    instructions[523] = {6'd3, 7'd39, 7'd1, 32'd0};//{'dest': 39, 'src': 1, 'op': 'move'}
    instructions[524] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[525] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[526] = {6'd17, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[527] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[528] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[529] = {6'd12, 7'd0, 7'd37, 32'd543};//{'src': 37, 'label': 543, 'op': 'jmp_if_false'}
    instructions[530] = {6'd3, 7'd39, 7'd74, 32'd0};//{'dest': 39, 'src': 74, 'op': 'move'}
    instructions[531] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[532] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[533] = {6'd24, 7'd38, 7'd39, 32'd48};//{'src': 39, 'dest': 38, 'signed': False, 'op': '|', 'size': 2, 'type': 'int', 'left': 48}
    instructions[534] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[535] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[536] = {6'd3, 7'd66, 7'd38, 32'd0};//{'dest': 66, 'src': 38, 'op': 'move'}
    instructions[537] = {6'd1, 7'd65, 7'd0, 32'd284};//{'dest': 65, 'label': 284, 'op': 'jmp_and_link'}
    instructions[538] = {6'd0, 7'd37, 7'd0, 32'd1};//{'dest': 37, 'literal': 1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[539] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[540] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[541] = {6'd3, 7'd1, 7'd37, 32'd0};//{'dest': 1, 'src': 37, 'op': 'move'}
    instructions[542] = {6'd14, 7'd0, 7'd0, 32'd543};//{'label': 543, 'op': 'goto'}
    instructions[543] = {6'd3, 7'd38, 7'd72, 32'd0};//{'dest': 38, 'src': 72, 'op': 'move'}
    instructions[544] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[545] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[546] = {6'd15, 7'd37, 7'd38, 32'd1};//{'src': 38, 'right': 1, 'dest': 37, 'signed': False, 'op': '>=', 'type': 'int', 'size': 2}
    instructions[547] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[548] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[549] = {6'd12, 7'd0, 7'd37, 32'd560};//{'src': 37, 'label': 560, 'op': 'jmp_if_false'}
    instructions[550] = {6'd3, 7'd37, 7'd73, 32'd0};//{'dest': 37, 'src': 73, 'op': 'move'}
    instructions[551] = {6'd13, 7'd73, 7'd73, 32'd1};//{'src': 73, 'right': 1, 'dest': 73, 'signed': False, 'op': '+', 'size': 2}
    instructions[552] = {6'd3, 7'd38, 7'd72, 32'd0};//{'dest': 38, 'src': 72, 'op': 'move'}
    instructions[553] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[554] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[555] = {6'd16, 7'd37, 7'd38, 32'd1};//{'src': 38, 'right': 1, 'dest': 37, 'signed': False, 'op': '-', 'type': 'int', 'size': 2}
    instructions[556] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[557] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[558] = {6'd3, 7'd72, 7'd37, 32'd0};//{'dest': 72, 'src': 37, 'op': 'move'}
    instructions[559] = {6'd14, 7'd0, 7'd0, 32'd561};//{'label': 561, 'op': 'goto'}
    instructions[560] = {6'd14, 7'd0, 7'd0, 32'd562};//{'label': 562, 'op': 'goto'}
    instructions[561] = {6'd14, 7'd0, 7'd0, 32'd543};//{'label': 543, 'op': 'goto'}
    instructions[562] = {6'd3, 7'd39, 7'd73, 32'd0};//{'dest': 39, 'src': 73, 'op': 'move'}
    instructions[563] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[564] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[565] = {6'd24, 7'd38, 7'd39, 32'd48};//{'src': 39, 'dest': 38, 'signed': False, 'op': '|', 'size': 2, 'type': 'int', 'left': 48}
    instructions[566] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[567] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[568] = {6'd3, 7'd66, 7'd38, 32'd0};//{'dest': 66, 'src': 38, 'op': 'move'}
    instructions[569] = {6'd1, 7'd65, 7'd0, 32'd284};//{'dest': 65, 'label': 284, 'op': 'jmp_and_link'}
    instructions[570] = {6'd6, 7'd0, 7'd71, 32'd0};//{'src': 71, 'op': 'jmp_to_reg'}
    instructions[571] = {6'd0, 7'd3, 7'd0, 32'd0};//{'dest': 3, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[572] = {6'd0, 7'd4, 7'd0, 32'd4};//{'dest': 4, 'literal': 4, 'op': 'literal'}
    instructions[573] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[574] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[575] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[576] = {6'd3, 7'd3, 7'd37, 32'd0};//{'dest': 3, 'src': 37, 'op': 'move'}
    instructions[577] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[578] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[579] = {6'd3, 7'd38, 7'd3, 32'd0};//{'dest': 38, 'src': 3, 'op': 'move'}
    instructions[580] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[581] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[582] = {6'd8, 7'd39, 7'd38, 32'd4};//{'dest': 39, 'src': 38, 'srcb': 4, 'signed': False, 'op': '+'}
    instructions[583] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[584] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[585] = {6'd9, 7'd0, 7'd39, 32'd0};//{'element_size': 2, 'src': 39, 'sequence': 140361208526320, 'op': 'memory_read_request'}
    instructions[586] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[587] = {6'd10, 7'd0, 7'd39, 32'd0};//{'element_size': 2, 'src': 39, 'sequence': 140361208526320, 'op': 'memory_read_wait'}
    instructions[588] = {6'd11, 7'd37, 7'd39, 32'd0};//{'dest': 37, 'src': 39, 'sequence': 140361208526320, 'element_size': 2, 'op': 'memory_read'}
    instructions[589] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[590] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[591] = {6'd12, 7'd0, 7'd37, 32'd595};//{'src': 37, 'label': 595, 'op': 'jmp_if_false'}
    instructions[592] = {6'd3, 7'd37, 7'd3, 32'd0};//{'dest': 37, 'src': 3, 'op': 'move'}
    instructions[593] = {6'd13, 7'd3, 7'd3, 32'd1};//{'src': 3, 'right': 1, 'dest': 3, 'signed': False, 'op': '+', 'size': 2}
    instructions[594] = {6'd14, 7'd0, 7'd0, 32'd596};//{'label': 596, 'op': 'goto'}
    instructions[595] = {6'd14, 7'd0, 7'd0, 32'd597};//{'label': 597, 'op': 'goto'}
    instructions[596] = {6'd14, 7'd0, 7'd0, 32'd577};//{'label': 577, 'op': 'goto'}
    instructions[597] = {6'd3, 7'd38, 7'd3, 32'd0};//{'dest': 38, 'src': 3, 'op': 'move'}
    instructions[598] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[599] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[600] = {6'd3, 7'd51, 7'd38, 32'd0};//{'dest': 51, 'src': 38, 'op': 'move'}
    instructions[601] = {6'd1, 7'd50, 7'd0, 32'd4};//{'dest': 50, 'label': 4, 'op': 'jmp_and_link'}
    instructions[602] = {6'd3, 7'd42, 7'd4, 32'd0};//{'dest': 42, 'src': 4, 'op': 'move'}
    instructions[603] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[604] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[605] = {6'd3, 7'd69, 7'd42, 32'd0};//{'dest': 69, 'src': 42, 'op': 'move'}
    instructions[606] = {6'd1, 7'd68, 7'd0, 32'd341};//{'dest': 68, 'label': 341, 'op': 'jmp_and_link'}
    instructions[607] = {6'd1, 7'd67, 7'd0, 32'd323};//{'dest': 67, 'label': 323, 'op': 'jmp_and_link'}
    instructions[608] = {6'd6, 7'd0, 7'd2, 32'd0};//{'src': 2, 'op': 'jmp_to_reg'}
    instructions[609] = {6'd0, 7'd7, 7'd0, 32'd0};//{'dest': 7, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[610] = {6'd0, 7'd8, 7'd0, 32'd0};//{'dest': 8, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[611] = {6'd0, 7'd9, 7'd0, 32'd0};//{'dest': 9, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[612] = {6'd0, 7'd10, 7'd0, 32'd0};//{'dest': 10, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[613] = {6'd0, 7'd11, 7'd0, 32'd0};//{'dest': 11, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[614] = {6'd0, 7'd12, 7'd0, 32'd132};//{'dest': 12, 'literal': 132, 'op': 'literal'}
    instructions[615] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[616] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[617] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[618] = {6'd3, 7'd8, 7'd37, 32'd0};//{'dest': 8, 'src': 37, 'op': 'move'}
    instructions[619] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[620] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[621] = {6'd3, 7'd38, 7'd8, 32'd0};//{'dest': 38, 'src': 8, 'op': 'move'}
    instructions[622] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[623] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[624] = {6'd8, 7'd39, 7'd38, 32'd6};//{'dest': 39, 'src': 38, 'srcb': 6, 'signed': False, 'op': '+'}
    instructions[625] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[626] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[627] = {6'd9, 7'd0, 7'd39, 32'd0};//{'element_size': 2, 'src': 39, 'sequence': 140361208550392, 'op': 'memory_read_request'}
    instructions[628] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[629] = {6'd10, 7'd0, 7'd39, 32'd0};//{'element_size': 2, 'src': 39, 'sequence': 140361208550392, 'op': 'memory_read_wait'}
    instructions[630] = {6'd11, 7'd37, 7'd39, 32'd0};//{'dest': 37, 'src': 39, 'sequence': 140361208550392, 'element_size': 2, 'op': 'memory_read'}
    instructions[631] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[632] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[633] = {6'd12, 7'd0, 7'd37, 32'd637};//{'src': 37, 'label': 637, 'op': 'jmp_if_false'}
    instructions[634] = {6'd3, 7'd37, 7'd8, 32'd0};//{'dest': 37, 'src': 8, 'op': 'move'}
    instructions[635] = {6'd13, 7'd8, 7'd8, 32'd1};//{'src': 8, 'right': 1, 'dest': 8, 'signed': False, 'op': '+', 'size': 2}
    instructions[636] = {6'd14, 7'd0, 7'd0, 32'd638};//{'label': 638, 'op': 'goto'}
    instructions[637] = {6'd14, 7'd0, 7'd0, 32'd639};//{'label': 639, 'op': 'goto'}
    instructions[638] = {6'd14, 7'd0, 7'd0, 32'd619};//{'label': 619, 'op': 'goto'}
    instructions[639] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[640] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[641] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[642] = {6'd3, 7'd7, 7'd37, 32'd0};//{'dest': 7, 'src': 37, 'op': 'move'}
    instructions[643] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[644] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[645] = {6'd3, 7'd38, 7'd7, 32'd0};//{'dest': 38, 'src': 7, 'op': 'move'}
    instructions[646] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[647] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[648] = {6'd8, 7'd39, 7'd38, 32'd12};//{'dest': 39, 'src': 38, 'srcb': 12, 'signed': False, 'op': '+'}
    instructions[649] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[650] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[651] = {6'd9, 7'd0, 7'd39, 32'd0};//{'element_size': 2, 'src': 39, 'sequence': 140361208551256, 'op': 'memory_read_request'}
    instructions[652] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[653] = {6'd10, 7'd0, 7'd39, 32'd0};//{'element_size': 2, 'src': 39, 'sequence': 140361208551256, 'op': 'memory_read_wait'}
    instructions[654] = {6'd11, 7'd37, 7'd39, 32'd0};//{'dest': 37, 'src': 39, 'sequence': 140361208551256, 'element_size': 2, 'op': 'memory_read'}
    instructions[655] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[656] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[657] = {6'd12, 7'd0, 7'd37, 32'd661};//{'src': 37, 'label': 661, 'op': 'jmp_if_false'}
    instructions[658] = {6'd3, 7'd37, 7'd7, 32'd0};//{'dest': 37, 'src': 7, 'op': 'move'}
    instructions[659] = {6'd13, 7'd7, 7'd7, 32'd1};//{'src': 7, 'right': 1, 'dest': 7, 'signed': False, 'op': '+', 'size': 2}
    instructions[660] = {6'd14, 7'd0, 7'd0, 32'd662};//{'label': 662, 'op': 'goto'}
    instructions[661] = {6'd14, 7'd0, 7'd0, 32'd663};//{'label': 663, 'op': 'goto'}
    instructions[662] = {6'd14, 7'd0, 7'd0, 32'd643};//{'label': 643, 'op': 'goto'}
    instructions[663] = {6'd3, 7'd38, 7'd7, 32'd0};//{'dest': 38, 'src': 7, 'op': 'move'}
    instructions[664] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[665] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[666] = {6'd13, 7'd37, 7'd38, 32'd5};//{'src': 38, 'right': 5, 'dest': 37, 'signed': False, 'op': '+', 'type': 'int', 'size': 2}
    instructions[667] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[668] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[669] = {6'd3, 7'd9, 7'd37, 32'd0};//{'dest': 9, 'src': 37, 'op': 'move'}
    instructions[670] = {6'd3, 7'd38, 7'd8, 32'd0};//{'dest': 38, 'src': 8, 'op': 'move'}
    instructions[671] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[672] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[673] = {6'd25, 7'd37, 7'd38, 32'd9};//{'src': 38, 'right': 9, 'dest': 37, 'signed': False, 'op': '>', 'type': 'int', 'size': 2}
    instructions[674] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[675] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[676] = {6'd12, 7'd0, 7'd37, 32'd680};//{'src': 37, 'label': 680, 'op': 'jmp_if_false'}
    instructions[677] = {6'd3, 7'd37, 7'd9, 32'd0};//{'dest': 37, 'src': 9, 'op': 'move'}
    instructions[678] = {6'd13, 7'd9, 7'd9, 32'd1};//{'src': 9, 'right': 1, 'dest': 9, 'signed': False, 'op': '+', 'size': 2}
    instructions[679] = {6'd14, 7'd0, 7'd0, 32'd680};//{'label': 680, 'op': 'goto'}
    instructions[680] = {6'd3, 7'd38, 7'd8, 32'd0};//{'dest': 38, 'src': 8, 'op': 'move'}
    instructions[681] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[682] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[683] = {6'd25, 7'd37, 7'd38, 32'd99};//{'src': 38, 'right': 99, 'dest': 37, 'signed': False, 'op': '>', 'type': 'int', 'size': 2}
    instructions[684] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[685] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[686] = {6'd12, 7'd0, 7'd37, 32'd690};//{'src': 37, 'label': 690, 'op': 'jmp_if_false'}
    instructions[687] = {6'd3, 7'd37, 7'd9, 32'd0};//{'dest': 37, 'src': 9, 'op': 'move'}
    instructions[688] = {6'd13, 7'd9, 7'd9, 32'd1};//{'src': 9, 'right': 1, 'dest': 9, 'signed': False, 'op': '+', 'size': 2}
    instructions[689] = {6'd14, 7'd0, 7'd0, 32'd690};//{'label': 690, 'op': 'goto'}
    instructions[690] = {6'd3, 7'd38, 7'd8, 32'd0};//{'dest': 38, 'src': 8, 'op': 'move'}
    instructions[691] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[692] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[693] = {6'd25, 7'd37, 7'd38, 32'd999};//{'src': 38, 'right': 999, 'dest': 37, 'signed': False, 'op': '>', 'type': 'int', 'size': 2}
    instructions[694] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[695] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[696] = {6'd12, 7'd0, 7'd37, 32'd700};//{'src': 37, 'label': 700, 'op': 'jmp_if_false'}
    instructions[697] = {6'd3, 7'd37, 7'd9, 32'd0};//{'dest': 37, 'src': 9, 'op': 'move'}
    instructions[698] = {6'd13, 7'd9, 7'd9, 32'd1};//{'src': 9, 'right': 1, 'dest': 9, 'signed': False, 'op': '+', 'size': 2}
    instructions[699] = {6'd14, 7'd0, 7'd0, 32'd700};//{'label': 700, 'op': 'goto'}
    instructions[700] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[701] = {6'd3, 7'd38, 7'd9, 32'd0};//{'dest': 38, 'src': 9, 'op': 'move'}
    instructions[702] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[703] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[704] = {6'd3, 7'd51, 7'd38, 32'd0};//{'dest': 51, 'src': 38, 'op': 'move'}
    instructions[705] = {6'd1, 7'd50, 7'd0, 32'd4};//{'dest': 50, 'label': 4, 'op': 'jmp_and_link'}
    instructions[706] = {6'd3, 7'd43, 7'd12, 32'd0};//{'dest': 43, 'src': 12, 'op': 'move'}
    instructions[707] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[708] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[709] = {6'd3, 7'd69, 7'd43, 32'd0};//{'dest': 69, 'src': 43, 'op': 'move'}
    instructions[710] = {6'd1, 7'd68, 7'd0, 32'd341};//{'dest': 68, 'label': 341, 'op': 'jmp_and_link'}
    instructions[711] = {6'd3, 7'd38, 7'd8, 32'd0};//{'dest': 38, 'src': 8, 'op': 'move'}
    instructions[712] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[713] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[714] = {6'd3, 7'd72, 7'd38, 32'd0};//{'dest': 72, 'src': 38, 'op': 'move'}
    instructions[715] = {6'd1, 7'd71, 7'd0, 32'd377};//{'dest': 71, 'label': 377, 'op': 'jmp_and_link'}
    instructions[716] = {6'd0, 7'd13, 7'd0, 32'd246};//{'dest': 13, 'literal': 246, 'op': 'literal'}
    instructions[717] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[718] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[719] = {6'd3, 7'd44, 7'd13, 32'd0};//{'dest': 44, 'src': 13, 'op': 'move'}
    instructions[720] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[721] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[722] = {6'd3, 7'd69, 7'd44, 32'd0};//{'dest': 69, 'src': 44, 'op': 'move'}
    instructions[723] = {6'd1, 7'd68, 7'd0, 32'd341};//{'dest': 68, 'label': 341, 'op': 'jmp_and_link'}
    instructions[724] = {6'd1, 7'd67, 7'd0, 32'd323};//{'dest': 67, 'label': 323, 'op': 'jmp_and_link'}
    instructions[725] = {6'd3, 7'd37, 7'd8, 32'd0};//{'dest': 37, 'src': 8, 'op': 'move'}
    instructions[726] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[727] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[728] = {6'd3, 7'd9, 7'd37, 32'd0};//{'dest': 9, 'src': 37, 'op': 'move'}
    instructions[729] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[730] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[731] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[732] = {6'd3, 7'd10, 7'd37, 32'd0};//{'dest': 10, 'src': 37, 'op': 'move'}
    instructions[733] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[734] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[735] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[736] = {6'd3, 7'd11, 7'd37, 32'd0};//{'dest': 11, 'src': 37, 'op': 'move'}
    instructions[737] = {6'd3, 7'd38, 7'd9, 32'd0};//{'dest': 38, 'src': 9, 'op': 'move'}
    instructions[738] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[739] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[740] = {6'd15, 7'd37, 7'd38, 32'd1046};//{'src': 38, 'right': 1046, 'dest': 37, 'signed': False, 'op': '>=', 'type': 'int', 'size': 2}
    instructions[741] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[742] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[743] = {6'd12, 7'd0, 7'd37, 32'd790};//{'src': 37, 'label': 790, 'op': 'jmp_if_false'}
    instructions[744] = {6'd3, 7'd38, 7'd9, 32'd0};//{'dest': 38, 'src': 9, 'op': 'move'}
    instructions[745] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[746] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[747] = {6'd16, 7'd37, 7'd38, 32'd1046};//{'src': 38, 'right': 1046, 'dest': 37, 'signed': False, 'op': '-', 'type': 'int', 'size': 2}
    instructions[748] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[749] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[750] = {6'd3, 7'd9, 7'd37, 32'd0};//{'dest': 9, 'src': 37, 'op': 'move'}
    instructions[751] = {6'd0, 7'd38, 7'd0, 32'd1046};//{'dest': 38, 'literal': 1046, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[752] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[753] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[754] = {6'd3, 7'd51, 7'd38, 32'd0};//{'dest': 51, 'src': 38, 'op': 'move'}
    instructions[755] = {6'd1, 7'd50, 7'd0, 32'd4};//{'dest': 50, 'label': 4, 'op': 'jmp_and_link'}
    instructions[756] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[757] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[758] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[759] = {6'd3, 7'd11, 7'd37, 32'd0};//{'dest': 11, 'src': 37, 'op': 'move'}
    instructions[760] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[761] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[762] = {6'd3, 7'd38, 7'd11, 32'd0};//{'dest': 38, 'src': 11, 'op': 'move'}
    instructions[763] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[764] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[765] = {6'd26, 7'd37, 7'd38, 32'd1046};//{'src': 38, 'right': 1046, 'dest': 37, 'signed': False, 'op': '<', 'type': 'int', 'size': 2}
    instructions[766] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[767] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[768] = {6'd12, 7'd0, 7'd37, 32'd788};//{'src': 37, 'label': 788, 'op': 'jmp_if_false'}
    instructions[769] = {6'd3, 7'd39, 7'd10, 32'd0};//{'dest': 39, 'src': 10, 'op': 'move'}
    instructions[770] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[771] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[772] = {6'd8, 7'd41, 7'd39, 32'd6};//{'dest': 41, 'src': 39, 'srcb': 6, 'signed': False, 'op': '+'}
    instructions[773] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[774] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[775] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361208599544, 'op': 'memory_read_request'}
    instructions[776] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[777] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361208599544, 'op': 'memory_read_wait'}
    instructions[778] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361208599544, 'element_size': 2, 'op': 'memory_read'}
    instructions[779] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[780] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[781] = {6'd3, 7'd66, 7'd38, 32'd0};//{'dest': 66, 'src': 38, 'op': 'move'}
    instructions[782] = {6'd1, 7'd65, 7'd0, 32'd284};//{'dest': 65, 'label': 284, 'op': 'jmp_and_link'}
    instructions[783] = {6'd3, 7'd37, 7'd10, 32'd0};//{'dest': 37, 'src': 10, 'op': 'move'}
    instructions[784] = {6'd13, 7'd10, 7'd10, 32'd1};//{'src': 10, 'right': 1, 'dest': 10, 'signed': False, 'op': '+', 'size': 2}
    instructions[785] = {6'd3, 7'd37, 7'd11, 32'd0};//{'dest': 37, 'src': 11, 'op': 'move'}
    instructions[786] = {6'd13, 7'd11, 7'd11, 32'd1};//{'src': 11, 'right': 1, 'dest': 11, 'signed': False, 'op': '+', 'size': 2}
    instructions[787] = {6'd14, 7'd0, 7'd0, 32'd760};//{'label': 760, 'op': 'goto'}
    instructions[788] = {6'd1, 7'd67, 7'd0, 32'd323};//{'dest': 67, 'label': 323, 'op': 'jmp_and_link'}
    instructions[789] = {6'd14, 7'd0, 7'd0, 32'd791};//{'label': 791, 'op': 'goto'}
    instructions[790] = {6'd14, 7'd0, 7'd0, 32'd792};//{'label': 792, 'op': 'goto'}
    instructions[791] = {6'd14, 7'd0, 7'd0, 32'd737};//{'label': 737, 'op': 'goto'}
    instructions[792] = {6'd3, 7'd38, 7'd9, 32'd0};//{'dest': 38, 'src': 9, 'op': 'move'}
    instructions[793] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[794] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[795] = {6'd3, 7'd51, 7'd38, 32'd0};//{'dest': 51, 'src': 38, 'op': 'move'}
    instructions[796] = {6'd1, 7'd50, 7'd0, 32'd4};//{'dest': 50, 'label': 4, 'op': 'jmp_and_link'}
    instructions[797] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[798] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[799] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[800] = {6'd3, 7'd11, 7'd37, 32'd0};//{'dest': 11, 'src': 37, 'op': 'move'}
    instructions[801] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[802] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[803] = {6'd3, 7'd38, 7'd11, 32'd0};//{'dest': 38, 'src': 11, 'op': 'move'}
    instructions[804] = {6'd3, 7'd39, 7'd9, 32'd0};//{'dest': 39, 'src': 9, 'op': 'move'}
    instructions[805] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[806] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[807] = {6'd27, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '<', 'type': 'int', 'size': 2}
    instructions[808] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[809] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[810] = {6'd12, 7'd0, 7'd37, 32'd830};//{'src': 37, 'label': 830, 'op': 'jmp_if_false'}
    instructions[811] = {6'd3, 7'd39, 7'd10, 32'd0};//{'dest': 39, 'src': 10, 'op': 'move'}
    instructions[812] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[813] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[814] = {6'd8, 7'd41, 7'd39, 32'd6};//{'dest': 41, 'src': 39, 'srcb': 6, 'signed': False, 'op': '+'}
    instructions[815] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[816] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[817] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361208601704, 'op': 'memory_read_request'}
    instructions[818] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[819] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361208601704, 'op': 'memory_read_wait'}
    instructions[820] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361208601704, 'element_size': 2, 'op': 'memory_read'}
    instructions[821] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[822] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[823] = {6'd3, 7'd66, 7'd38, 32'd0};//{'dest': 66, 'src': 38, 'op': 'move'}
    instructions[824] = {6'd1, 7'd65, 7'd0, 32'd284};//{'dest': 65, 'label': 284, 'op': 'jmp_and_link'}
    instructions[825] = {6'd3, 7'd37, 7'd10, 32'd0};//{'dest': 37, 'src': 10, 'op': 'move'}
    instructions[826] = {6'd13, 7'd10, 7'd10, 32'd1};//{'src': 10, 'right': 1, 'dest': 10, 'signed': False, 'op': '+', 'size': 2}
    instructions[827] = {6'd3, 7'd37, 7'd11, 32'd0};//{'dest': 37, 'src': 11, 'op': 'move'}
    instructions[828] = {6'd13, 7'd11, 7'd11, 32'd1};//{'src': 11, 'right': 1, 'dest': 11, 'signed': False, 'op': '+', 'size': 2}
    instructions[829] = {6'd14, 7'd0, 7'd0, 32'd801};//{'label': 801, 'op': 'goto'}
    instructions[830] = {6'd1, 7'd67, 7'd0, 32'd323};//{'dest': 67, 'label': 323, 'op': 'jmp_and_link'}
    instructions[831] = {6'd6, 7'd0, 7'd5, 32'd0};//{'src': 5, 'op': 'jmp_to_reg'}
    instructions[832] = {6'd3, 7'd20, 7'd18, 32'd0};//{'dest': 20, 'src': 18, 'op': 'move'}
    instructions[833] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[834] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[835] = {6'd3, 7'd38, 7'd20, 32'd0};//{'dest': 38, 'src': 20, 'op': 'move'}
    instructions[836] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[837] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[838] = {6'd8, 7'd39, 7'd38, 32'd16};//{'dest': 39, 'src': 38, 'srcb': 16, 'signed': False, 'op': '+'}
    instructions[839] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[840] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[841] = {6'd9, 7'd0, 7'd39, 32'd0};//{'element_size': 2, 'src': 39, 'sequence': 140361208568576, 'op': 'memory_read_request'}
    instructions[842] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[843] = {6'd10, 7'd0, 7'd39, 32'd0};//{'element_size': 2, 'src': 39, 'sequence': 140361208568576, 'op': 'memory_read_wait'}
    instructions[844] = {6'd11, 7'd37, 7'd39, 32'd0};//{'dest': 37, 'src': 39, 'sequence': 140361208568576, 'element_size': 2, 'op': 'memory_read'}
    instructions[845] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[846] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[847] = {6'd12, 7'd0, 7'd37, 32'd923};//{'src': 37, 'label': 923, 'op': 'jmp_if_false'}
    instructions[848] = {6'd3, 7'd39, 7'd20, 32'd0};//{'dest': 39, 'src': 20, 'op': 'move'}
    instructions[849] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[850] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[851] = {6'd8, 7'd41, 7'd39, 32'd16};//{'dest': 41, 'src': 39, 'srcb': 16, 'signed': False, 'op': '+'}
    instructions[852] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[853] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[854] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361208628864, 'op': 'memory_read_request'}
    instructions[855] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[856] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361208628864, 'op': 'memory_read_wait'}
    instructions[857] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361208628864, 'element_size': 2, 'op': 'memory_read'}
    instructions[858] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[859] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[860] = {6'd3, 7'd62, 7'd38, 32'd0};//{'dest': 62, 'src': 38, 'op': 'move'}
    instructions[861] = {6'd1, 7'd61, 7'd0, 32'd257};//{'dest': 61, 'label': 257, 'op': 'jmp_and_link'}
    instructions[862] = {6'd0, 7'd21, 7'd0, 32'd253};//{'dest': 21, 'literal': 253, 'op': 'literal'}
    instructions[863] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[864] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[865] = {6'd3, 7'd40, 7'd21, 32'd0};//{'dest': 40, 'src': 21, 'op': 'move'}
    instructions[866] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[867] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[868] = {6'd3, 7'd55, 7'd40, 32'd0};//{'dest': 55, 'src': 40, 'op': 'move'}
    instructions[869] = {6'd1, 7'd54, 7'd0, 32'd14};//{'dest': 54, 'label': 14, 'op': 'jmp_and_link'}
    instructions[870] = {6'd3, 7'd38, 7'd20, 32'd0};//{'dest': 38, 'src': 20, 'op': 'move'}
    instructions[871] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[872] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[873] = {6'd3, 7'd62, 7'd38, 32'd0};//{'dest': 62, 'src': 38, 'op': 'move'}
    instructions[874] = {6'd1, 7'd61, 7'd0, 32'd257};//{'dest': 61, 'label': 257, 'op': 'jmp_and_link'}
    instructions[875] = {6'd0, 7'd22, 7'd0, 32'd255};//{'dest': 22, 'literal': 255, 'op': 'literal'}
    instructions[876] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[877] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[878] = {6'd3, 7'd40, 7'd22, 32'd0};//{'dest': 40, 'src': 22, 'op': 'move'}
    instructions[879] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[880] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[881] = {6'd3, 7'd55, 7'd40, 32'd0};//{'dest': 55, 'src': 40, 'op': 'move'}
    instructions[882] = {6'd1, 7'd54, 7'd0, 32'd14};//{'dest': 54, 'label': 14, 'op': 'jmp_and_link'}
    instructions[883] = {6'd3, 7'd38, 7'd20, 32'd0};//{'dest': 38, 'src': 20, 'op': 'move'}
    instructions[884] = {6'd3, 7'd39, 7'd19, 32'd0};//{'dest': 39, 'src': 19, 'op': 'move'}
    instructions[885] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[886] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[887] = {6'd28, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '==', 'type': 'int', 'size': 2}
    instructions[888] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[889] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[890] = {6'd12, 7'd0, 7'd37, 32'd897};//{'src': 37, 'label': 897, 'op': 'jmp_if_false'}
    instructions[891] = {6'd0, 7'd37, 7'd0, -32'd1};//{'dest': 37, 'literal': -1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[892] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[893] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[894] = {6'd3, 7'd15, 7'd37, 32'd0};//{'dest': 15, 'src': 37, 'op': 'move'}
    instructions[895] = {6'd6, 7'd0, 7'd14, 32'd0};//{'src': 14, 'op': 'jmp_to_reg'}
    instructions[896] = {6'd14, 7'd0, 7'd0, 32'd897};//{'label': 897, 'op': 'goto'}
    instructions[897] = {6'd3, 7'd39, 7'd20, 32'd0};//{'dest': 39, 'src': 20, 'op': 'move'}
    instructions[898] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[899] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[900] = {6'd8, 7'd41, 7'd39, 32'd16};//{'dest': 41, 'src': 39, 'srcb': 16, 'signed': False, 'op': '+'}
    instructions[901] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[902] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[903] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361208550464, 'op': 'memory_read_request'}
    instructions[904] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[905] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361208550464, 'op': 'memory_read_wait'}
    instructions[906] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361208550464, 'element_size': 2, 'op': 'memory_read'}
    instructions[907] = {6'd3, 7'd39, 7'd17, 32'd0};//{'dest': 39, 'src': 17, 'op': 'move'}
    instructions[908] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[909] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[910] = {6'd28, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '==', 'type': 'int', 'size': 2}
    instructions[911] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[912] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[913] = {6'd12, 7'd0, 7'd37, 32'd920};//{'src': 37, 'label': 920, 'op': 'jmp_if_false'}
    instructions[914] = {6'd3, 7'd37, 7'd20, 32'd0};//{'dest': 37, 'src': 20, 'op': 'move'}
    instructions[915] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[916] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[917] = {6'd3, 7'd15, 7'd37, 32'd0};//{'dest': 15, 'src': 37, 'op': 'move'}
    instructions[918] = {6'd6, 7'd0, 7'd14, 32'd0};//{'src': 14, 'op': 'jmp_to_reg'}
    instructions[919] = {6'd14, 7'd0, 7'd0, 32'd920};//{'label': 920, 'op': 'goto'}
    instructions[920] = {6'd3, 7'd37, 7'd20, 32'd0};//{'dest': 37, 'src': 20, 'op': 'move'}
    instructions[921] = {6'd29, 7'd20, 7'd20, 32'd1};//{'src': 20, 'right': 1, 'dest': 20, 'signed': True, 'op': '+', 'size': 2}
    instructions[922] = {6'd14, 7'd0, 7'd0, 32'd924};//{'label': 924, 'op': 'goto'}
    instructions[923] = {6'd14, 7'd0, 7'd0, 32'd925};//{'label': 925, 'op': 'goto'}
    instructions[924] = {6'd14, 7'd0, 7'd0, 32'd833};//{'label': 833, 'op': 'goto'}
    instructions[925] = {6'd0, 7'd37, 7'd0, -32'd1};//{'dest': 37, 'literal': -1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[926] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[927] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[928] = {6'd3, 7'd15, 7'd37, 32'd0};//{'dest': 15, 'src': 37, 'op': 'move'}
    instructions[929] = {6'd6, 7'd0, 7'd14, 32'd0};//{'src': 14, 'op': 'jmp_to_reg'}
    instructions[930] = {6'd0, 7'd24, 7'd0, 32'd0};//{'dest': 24, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[931] = {6'd0, 7'd25, 7'd0, 32'd0};//{'dest': 25, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[932] = {6'd0, 7'd26, 7'd0, 32'd0};//{'dest': 26, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[933] = {6'd0, 7'd27, 7'd0, 32'd257};//{'dest': 27, 'literal': 257, 'op': 'literal'}
    instructions[934] = {6'd0, 7'd28, 7'd0, 32'd0};//{'dest': 28, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[935] = {6'd0, 7'd29, 7'd0, 32'd0};//{'dest': 29, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[936] = {6'd0, 7'd30, 7'd0, 32'd0};//{'dest': 30, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[937] = {6'd0, 7'd31, 7'd0, 32'd0};//{'dest': 31, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[938] = {6'd0, 7'd32, 7'd0, 32'd0};//{'dest': 32, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[939] = {6'd0, 7'd33, 7'd0, 32'd0};//{'dest': 33, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[940] = {6'd0, 7'd34, 7'd0, 32'd1717};//{'dest': 34, 'literal': 1717, 'op': 'literal'}
    instructions[941] = {6'd0, 7'd35, 7'd0, 32'd2859};//{'dest': 35, 'literal': 2859, 'op': 'literal'}
    instructions[942] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[943] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[944] = {6'd3, 7'd45, 7'd35, 32'd0};//{'dest': 45, 'src': 35, 'op': 'move'}
    instructions[945] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[946] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[947] = {6'd3, 7'd55, 7'd45, 32'd0};//{'dest': 55, 'src': 45, 'op': 'move'}
    instructions[948] = {6'd1, 7'd54, 7'd0, 32'd14};//{'dest': 54, 'label': 14, 'op': 'jmp_and_link'}
    instructions[949] = {6'd0, 7'd36, 7'd0, 32'd2898};//{'dest': 36, 'literal': 2898, 'op': 'literal'}
    instructions[950] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[951] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[952] = {6'd3, 7'd46, 7'd36, 32'd0};//{'dest': 46, 'src': 36, 'op': 'move'}
    instructions[953] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[954] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[955] = {6'd3, 7'd55, 7'd46, 32'd0};//{'dest': 55, 'src': 46, 'op': 'move'}
    instructions[956] = {6'd1, 7'd54, 7'd0, 32'd14};//{'dest': 54, 'label': 14, 'op': 'jmp_and_link'}
    instructions[957] = {6'd30, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'input': 'socket', 'op': 'read'}
    instructions[958] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[959] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[960] = {6'd3, 7'd24, 7'd37, 32'd0};//{'dest': 24, 'src': 37, 'op': 'move'}
    instructions[961] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[962] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[963] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[964] = {6'd3, 7'd26, 7'd37, 32'd0};//{'dest': 26, 'src': 37, 'op': 'move'}
    instructions[965] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[966] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[967] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[968] = {6'd3, 7'd25, 7'd37, 32'd0};//{'dest': 25, 'src': 37, 'op': 'move'}
    instructions[969] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[970] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[971] = {6'd3, 7'd38, 7'd25, 32'd0};//{'dest': 38, 'src': 25, 'op': 'move'}
    instructions[972] = {6'd3, 7'd39, 7'd24, 32'd0};//{'dest': 39, 'src': 24, 'op': 'move'}
    instructions[973] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[974] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[975] = {6'd27, 7'd37, 7'd38, 32'd39};//{'srcb': 39, 'src': 38, 'dest': 37, 'signed': False, 'op': '<', 'type': 'int', 'size': 2}
    instructions[976] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[977] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[978] = {6'd12, 7'd0, 7'd37, 32'd1022};//{'src': 37, 'label': 1022, 'op': 'jmp_if_false'}
    instructions[979] = {6'd30, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'input': 'socket', 'op': 'read'}
    instructions[980] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[981] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[982] = {6'd3, 7'd28, 7'd37, 32'd0};//{'dest': 28, 'src': 37, 'op': 'move'}
    instructions[983] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[984] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[985] = {6'd3, 7'd47, 7'd28, 32'd0};//{'dest': 47, 'src': 28, 'op': 'move'}
    instructions[986] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[987] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[988] = {6'd31, 7'd41, 7'd47, 32'd8};//{'src': 47, 'right': 8, 'dest': 41, 'signed': False, 'op': '>>', 'type': 'int', 'size': 2}
    instructions[989] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[990] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[991] = {6'd32, 7'd37, 7'd41, 32'd255};//{'src': 41, 'right': 255, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[992] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[993] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[994] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[995] = {6'd8, 7'd39, 7'd38, 32'd27};//{'dest': 39, 'src': 38, 'srcb': 27, 'signed': False, 'op': '+'}
    instructions[996] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[997] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[998] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[999] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1000] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1001] = {6'd3, 7'd41, 7'd28, 32'd0};//{'dest': 41, 'src': 28, 'op': 'move'}
    instructions[1002] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1003] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1004] = {6'd32, 7'd37, 7'd41, 32'd255};//{'src': 41, 'right': 255, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1005] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1006] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1007] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1008] = {6'd8, 7'd39, 7'd38, 32'd27};//{'dest': 39, 'src': 38, 'srcb': 27, 'signed': False, 'op': '+'}
    instructions[1009] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1010] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1011] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1012] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1013] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1014] = {6'd3, 7'd38, 7'd25, 32'd0};//{'dest': 38, 'src': 25, 'op': 'move'}
    instructions[1015] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1016] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1017] = {6'd13, 7'd37, 7'd38, 32'd2};//{'src': 38, 'right': 2, 'dest': 37, 'signed': False, 'op': '+', 'type': 'int', 'size': 2}
    instructions[1018] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1019] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1020] = {6'd3, 7'd25, 7'd37, 32'd0};//{'dest': 25, 'src': 37, 'op': 'move'}
    instructions[1021] = {6'd14, 7'd0, 7'd0, 32'd969};//{'label': 969, 'op': 'goto'}
    instructions[1022] = {6'd0, 7'd39, 7'd0, 32'd0};//{'dest': 39, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1023] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1024] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1025] = {6'd8, 7'd41, 7'd39, 32'd27};//{'dest': 41, 'src': 39, 'srcb': 27, 'signed': False, 'op': '+'}
    instructions[1026] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1027] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1028] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209467464, 'op': 'memory_read_request'}
    instructions[1029] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1030] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209467464, 'op': 'memory_read_wait'}
    instructions[1031] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361209467464, 'element_size': 2, 'op': 'memory_read'}
    instructions[1032] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1033] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1034] = {6'd23, 7'd37, 7'd38, 32'd71};//{'src': 38, 'right': 71, 'dest': 37, 'signed': False, 'op': '==', 'type': 'int', 'size': 2}
    instructions[1035] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1036] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1037] = {6'd12, 7'd0, 7'd37, 32'd1051};//{'src': 37, 'label': 1051, 'op': 'jmp_if_false'}
    instructions[1038] = {6'd0, 7'd39, 7'd0, 32'd1};//{'dest': 39, 'literal': 1, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1039] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1040] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1041] = {6'd8, 7'd41, 7'd39, 32'd27};//{'dest': 41, 'src': 39, 'srcb': 27, 'signed': False, 'op': '+'}
    instructions[1042] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1043] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1044] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209467752, 'op': 'memory_read_request'}
    instructions[1045] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1046] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209467752, 'op': 'memory_read_wait'}
    instructions[1047] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361209467752, 'element_size': 2, 'op': 'memory_read'}
    instructions[1048] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1049] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1050] = {6'd23, 7'd37, 7'd38, 32'd69};//{'src': 38, 'right': 69, 'dest': 37, 'signed': False, 'op': '==', 'type': 'int', 'size': 2}
    instructions[1051] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1052] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1053] = {6'd12, 7'd0, 7'd37, 32'd1067};//{'src': 37, 'label': 1067, 'op': 'jmp_if_false'}
    instructions[1054] = {6'd0, 7'd39, 7'd0, 32'd2};//{'dest': 39, 'literal': 2, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1055] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1056] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1057] = {6'd8, 7'd41, 7'd39, 32'd27};//{'dest': 41, 'src': 39, 'srcb': 27, 'signed': False, 'op': '+'}
    instructions[1058] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1059] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1060] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209468112, 'op': 'memory_read_request'}
    instructions[1061] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1062] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209468112, 'op': 'memory_read_wait'}
    instructions[1063] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361209468112, 'element_size': 2, 'op': 'memory_read'}
    instructions[1064] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1065] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1066] = {6'd23, 7'd37, 7'd38, 32'd84};//{'src': 38, 'right': 84, 'dest': 37, 'signed': False, 'op': '==', 'type': 'int', 'size': 2}
    instructions[1067] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1068] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1069] = {6'd12, 7'd0, 7'd37, 32'd1083};//{'src': 37, 'label': 1083, 'op': 'jmp_if_false'}
    instructions[1070] = {6'd0, 7'd39, 7'd0, 32'd3};//{'dest': 39, 'literal': 3, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1071] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1072] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1073] = {6'd8, 7'd41, 7'd39, 32'd27};//{'dest': 41, 'src': 39, 'srcb': 27, 'signed': False, 'op': '+'}
    instructions[1074] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1075] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1076] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209468472, 'op': 'memory_read_request'}
    instructions[1077] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1078] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209468472, 'op': 'memory_read_wait'}
    instructions[1079] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361209468472, 'element_size': 2, 'op': 'memory_read'}
    instructions[1080] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1081] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1082] = {6'd23, 7'd37, 7'd38, 32'd32};//{'src': 38, 'right': 32, 'dest': 37, 'signed': False, 'op': '==', 'type': 'int', 'size': 2}
    instructions[1083] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1084] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1085] = {6'd12, 7'd0, 7'd37, 32'd1099};//{'src': 37, 'label': 1099, 'op': 'jmp_if_false'}
    instructions[1086] = {6'd0, 7'd39, 7'd0, 32'd4};//{'dest': 39, 'literal': 4, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1087] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1088] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1089] = {6'd8, 7'd41, 7'd39, 32'd27};//{'dest': 41, 'src': 39, 'srcb': 27, 'signed': False, 'op': '+'}
    instructions[1090] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1091] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1092] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209468832, 'op': 'memory_read_request'}
    instructions[1093] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1094] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209468832, 'op': 'memory_read_wait'}
    instructions[1095] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361209468832, 'element_size': 2, 'op': 'memory_read'}
    instructions[1096] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1097] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1098] = {6'd23, 7'd37, 7'd38, 32'd47};//{'src': 38, 'right': 47, 'dest': 37, 'signed': False, 'op': '==', 'type': 'int', 'size': 2}
    instructions[1099] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1100] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1101] = {6'd12, 7'd0, 7'd37, 32'd1131};//{'src': 37, 'label': 1131, 'op': 'jmp_if_false'}
    instructions[1102] = {6'd0, 7'd39, 7'd0, 32'd5};//{'dest': 39, 'literal': 5, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1103] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1104] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1105] = {6'd8, 7'd41, 7'd39, 32'd27};//{'dest': 41, 'src': 39, 'srcb': 27, 'signed': False, 'op': '+'}
    instructions[1106] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1107] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1108] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209473432, 'op': 'memory_read_request'}
    instructions[1109] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1110] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209473432, 'op': 'memory_read_wait'}
    instructions[1111] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361209473432, 'element_size': 2, 'op': 'memory_read'}
    instructions[1112] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1113] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1114] = {6'd23, 7'd37, 7'd38, 32'd63};//{'src': 38, 'right': 63, 'dest': 37, 'signed': False, 'op': '==', 'type': 'int', 'size': 2}
    instructions[1115] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1116] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1117] = {6'd34, 7'd0, 7'd37, 32'd1131};//{'src': 37, 'label': 1131, 'op': 'jmp_if_true'}
    instructions[1118] = {6'd0, 7'd39, 7'd0, 32'd5};//{'dest': 39, 'literal': 5, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1119] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1120] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1121] = {6'd8, 7'd41, 7'd39, 32'd27};//{'dest': 41, 'src': 39, 'srcb': 27, 'signed': False, 'op': '+'}
    instructions[1122] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1123] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1124] = {6'd9, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209473720, 'op': 'memory_read_request'}
    instructions[1125] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1126] = {6'd10, 7'd0, 7'd41, 32'd0};//{'element_size': 2, 'src': 41, 'sequence': 140361209473720, 'op': 'memory_read_wait'}
    instructions[1127] = {6'd11, 7'd38, 7'd41, 32'd0};//{'dest': 38, 'src': 41, 'sequence': 140361209473720, 'element_size': 2, 'op': 'memory_read'}
    instructions[1128] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1129] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1130] = {6'd23, 7'd37, 7'd38, 32'd32};//{'src': 38, 'right': 32, 'dest': 37, 'signed': False, 'op': '==', 'type': 'int', 'size': 2}
    instructions[1131] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1132] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1133] = {6'd12, 7'd0, 7'd37, 32'd1711};//{'src': 37, 'label': 1711, 'op': 'jmp_if_false'}
    instructions[1134] = {6'd0, 7'd37, 7'd0, 32'd5};//{'dest': 37, 'literal': 5, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1135] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1136] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1137] = {6'd3, 7'd32, 7'd37, 32'd0};//{'dest': 32, 'src': 37, 'op': 'move'}
    instructions[1138] = {6'd3, 7'd48, 7'd27, 32'd0};//{'dest': 48, 'src': 27, 'op': 'move'}
    instructions[1139] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1140] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1141] = {6'd3, 7'd16, 7'd48, 32'd0};//{'dest': 16, 'src': 48, 'op': 'move'}
    instructions[1142] = {6'd0, 7'd38, 7'd0, 32'd32};//{'dest': 38, 'literal': 32, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1143] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1144] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1145] = {6'd3, 7'd17, 7'd38, 32'd0};//{'dest': 17, 'src': 38, 'op': 'move'}
    instructions[1146] = {6'd3, 7'd38, 7'd32, 32'd0};//{'dest': 38, 'src': 32, 'op': 'move'}
    instructions[1147] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1148] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1149] = {6'd3, 7'd18, 7'd38, 32'd0};//{'dest': 18, 'src': 38, 'op': 'move'}
    instructions[1150] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1151] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1152] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1153] = {6'd3, 7'd19, 7'd38, 32'd0};//{'dest': 19, 'src': 38, 'op': 'move'}
    instructions[1154] = {6'd1, 7'd14, 7'd0, 32'd832};//{'dest': 14, 'label': 832, 'op': 'jmp_and_link'}
    instructions[1155] = {6'd3, 7'd37, 7'd15, 32'd0};//{'dest': 37, 'src': 15, 'op': 'move'}
    instructions[1156] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1157] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1158] = {6'd3, 7'd33, 7'd37, 32'd0};//{'dest': 33, 'src': 37, 'op': 'move'}
    instructions[1159] = {6'd0, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1160] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1161] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1162] = {6'd3, 7'd31, 7'd37, 32'd0};//{'dest': 31, 'src': 37, 'op': 'move'}
    instructions[1163] = {6'd3, 7'd48, 7'd27, 32'd0};//{'dest': 48, 'src': 27, 'op': 'move'}
    instructions[1164] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1165] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1166] = {6'd3, 7'd16, 7'd48, 32'd0};//{'dest': 16, 'src': 48, 'op': 'move'}
    instructions[1167] = {6'd0, 7'd39, 7'd0, 32'd65};//{'dest': 39, 'literal': 65, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1168] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1169] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1170] = {6'd3, 7'd17, 7'd39, 32'd0};//{'dest': 17, 'src': 39, 'op': 'move'}
    instructions[1171] = {6'd3, 7'd39, 7'd32, 32'd0};//{'dest': 39, 'src': 32, 'op': 'move'}
    instructions[1172] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1173] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1174] = {6'd3, 7'd18, 7'd39, 32'd0};//{'dest': 18, 'src': 39, 'op': 'move'}
    instructions[1175] = {6'd3, 7'd39, 7'd33, 32'd0};//{'dest': 39, 'src': 33, 'op': 'move'}
    instructions[1176] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1177] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1178] = {6'd3, 7'd19, 7'd39, 32'd0};//{'dest': 19, 'src': 39, 'op': 'move'}
    instructions[1179] = {6'd1, 7'd14, 7'd0, 32'd832};//{'dest': 14, 'label': 832, 'op': 'jmp_and_link'}
    instructions[1180] = {6'd3, 7'd38, 7'd15, 32'd0};//{'dest': 38, 'src': 15, 'op': 'move'}
    instructions[1181] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1182] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1183] = {6'd35, 7'd37, 7'd38, -32'd1};//{'src': 38, 'right': -1, 'dest': 37, 'signed': True, 'op': '!=', 'type': 'int', 'size': 2}
    instructions[1184] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1185] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1186] = {6'd12, 7'd0, 7'd37, 32'd1195};//{'src': 37, 'label': 1195, 'op': 'jmp_if_false'}
    instructions[1187] = {6'd3, 7'd38, 7'd31, 32'd0};//{'dest': 38, 'src': 31, 'op': 'move'}
    instructions[1188] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1189] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1190] = {6'd18, 7'd37, 7'd38, 32'd1};//{'src': 38, 'right': 1, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[1191] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1192] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1193] = {6'd3, 7'd31, 7'd37, 32'd0};//{'dest': 31, 'src': 37, 'op': 'move'}
    instructions[1194] = {6'd14, 7'd0, 7'd0, 32'd1195};//{'label': 1195, 'op': 'goto'}
    instructions[1195] = {6'd3, 7'd48, 7'd27, 32'd0};//{'dest': 48, 'src': 27, 'op': 'move'}
    instructions[1196] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1197] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1198] = {6'd3, 7'd16, 7'd48, 32'd0};//{'dest': 16, 'src': 48, 'op': 'move'}
    instructions[1199] = {6'd0, 7'd39, 7'd0, 32'd66};//{'dest': 39, 'literal': 66, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1200] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1201] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1202] = {6'd3, 7'd17, 7'd39, 32'd0};//{'dest': 17, 'src': 39, 'op': 'move'}
    instructions[1203] = {6'd3, 7'd39, 7'd32, 32'd0};//{'dest': 39, 'src': 32, 'op': 'move'}
    instructions[1204] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1205] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1206] = {6'd3, 7'd18, 7'd39, 32'd0};//{'dest': 18, 'src': 39, 'op': 'move'}
    instructions[1207] = {6'd3, 7'd39, 7'd33, 32'd0};//{'dest': 39, 'src': 33, 'op': 'move'}
    instructions[1208] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1209] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1210] = {6'd3, 7'd19, 7'd39, 32'd0};//{'dest': 19, 'src': 39, 'op': 'move'}
    instructions[1211] = {6'd1, 7'd14, 7'd0, 32'd832};//{'dest': 14, 'label': 832, 'op': 'jmp_and_link'}
    instructions[1212] = {6'd3, 7'd38, 7'd15, 32'd0};//{'dest': 38, 'src': 15, 'op': 'move'}
    instructions[1213] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1214] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1215] = {6'd35, 7'd37, 7'd38, -32'd1};//{'src': 38, 'right': -1, 'dest': 37, 'signed': True, 'op': '!=', 'type': 'int', 'size': 2}
    instructions[1216] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1217] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1218] = {6'd12, 7'd0, 7'd37, 32'd1227};//{'src': 37, 'label': 1227, 'op': 'jmp_if_false'}
    instructions[1219] = {6'd3, 7'd38, 7'd31, 32'd0};//{'dest': 38, 'src': 31, 'op': 'move'}
    instructions[1220] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1221] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1222] = {6'd18, 7'd37, 7'd38, 32'd2};//{'src': 38, 'right': 2, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[1223] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1224] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1225] = {6'd3, 7'd31, 7'd37, 32'd0};//{'dest': 31, 'src': 37, 'op': 'move'}
    instructions[1226] = {6'd14, 7'd0, 7'd0, 32'd1227};//{'label': 1227, 'op': 'goto'}
    instructions[1227] = {6'd3, 7'd48, 7'd27, 32'd0};//{'dest': 48, 'src': 27, 'op': 'move'}
    instructions[1228] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1229] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1230] = {6'd3, 7'd16, 7'd48, 32'd0};//{'dest': 16, 'src': 48, 'op': 'move'}
    instructions[1231] = {6'd0, 7'd39, 7'd0, 32'd67};//{'dest': 39, 'literal': 67, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1232] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1233] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1234] = {6'd3, 7'd17, 7'd39, 32'd0};//{'dest': 17, 'src': 39, 'op': 'move'}
    instructions[1235] = {6'd3, 7'd39, 7'd32, 32'd0};//{'dest': 39, 'src': 32, 'op': 'move'}
    instructions[1236] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1237] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1238] = {6'd3, 7'd18, 7'd39, 32'd0};//{'dest': 18, 'src': 39, 'op': 'move'}
    instructions[1239] = {6'd3, 7'd39, 7'd33, 32'd0};//{'dest': 39, 'src': 33, 'op': 'move'}
    instructions[1240] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1241] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1242] = {6'd3, 7'd19, 7'd39, 32'd0};//{'dest': 19, 'src': 39, 'op': 'move'}
    instructions[1243] = {6'd1, 7'd14, 7'd0, 32'd832};//{'dest': 14, 'label': 832, 'op': 'jmp_and_link'}
    instructions[1244] = {6'd3, 7'd38, 7'd15, 32'd0};//{'dest': 38, 'src': 15, 'op': 'move'}
    instructions[1245] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1246] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1247] = {6'd35, 7'd37, 7'd38, -32'd1};//{'src': 38, 'right': -1, 'dest': 37, 'signed': True, 'op': '!=', 'type': 'int', 'size': 2}
    instructions[1248] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1249] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1250] = {6'd12, 7'd0, 7'd37, 32'd1259};//{'src': 37, 'label': 1259, 'op': 'jmp_if_false'}
    instructions[1251] = {6'd3, 7'd38, 7'd31, 32'd0};//{'dest': 38, 'src': 31, 'op': 'move'}
    instructions[1252] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1253] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1254] = {6'd18, 7'd37, 7'd38, 32'd4};//{'src': 38, 'right': 4, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[1255] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1256] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1257] = {6'd3, 7'd31, 7'd37, 32'd0};//{'dest': 31, 'src': 37, 'op': 'move'}
    instructions[1258] = {6'd14, 7'd0, 7'd0, 32'd1259};//{'label': 1259, 'op': 'goto'}
    instructions[1259] = {6'd3, 7'd48, 7'd27, 32'd0};//{'dest': 48, 'src': 27, 'op': 'move'}
    instructions[1260] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1261] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1262] = {6'd3, 7'd16, 7'd48, 32'd0};//{'dest': 16, 'src': 48, 'op': 'move'}
    instructions[1263] = {6'd0, 7'd39, 7'd0, 32'd68};//{'dest': 39, 'literal': 68, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1264] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1265] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1266] = {6'd3, 7'd17, 7'd39, 32'd0};//{'dest': 17, 'src': 39, 'op': 'move'}
    instructions[1267] = {6'd3, 7'd39, 7'd32, 32'd0};//{'dest': 39, 'src': 32, 'op': 'move'}
    instructions[1268] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1269] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1270] = {6'd3, 7'd18, 7'd39, 32'd0};//{'dest': 18, 'src': 39, 'op': 'move'}
    instructions[1271] = {6'd3, 7'd39, 7'd33, 32'd0};//{'dest': 39, 'src': 33, 'op': 'move'}
    instructions[1272] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1273] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1274] = {6'd3, 7'd19, 7'd39, 32'd0};//{'dest': 19, 'src': 39, 'op': 'move'}
    instructions[1275] = {6'd1, 7'd14, 7'd0, 32'd832};//{'dest': 14, 'label': 832, 'op': 'jmp_and_link'}
    instructions[1276] = {6'd3, 7'd38, 7'd15, 32'd0};//{'dest': 38, 'src': 15, 'op': 'move'}
    instructions[1277] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1278] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1279] = {6'd35, 7'd37, 7'd38, -32'd1};//{'src': 38, 'right': -1, 'dest': 37, 'signed': True, 'op': '!=', 'type': 'int', 'size': 2}
    instructions[1280] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1281] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1282] = {6'd12, 7'd0, 7'd37, 32'd1291};//{'src': 37, 'label': 1291, 'op': 'jmp_if_false'}
    instructions[1283] = {6'd3, 7'd38, 7'd31, 32'd0};//{'dest': 38, 'src': 31, 'op': 'move'}
    instructions[1284] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1285] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1286] = {6'd18, 7'd37, 7'd38, 32'd8};//{'src': 38, 'right': 8, 'dest': 37, 'signed': False, 'op': '|', 'type': 'int', 'size': 2}
    instructions[1287] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1288] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1289] = {6'd3, 7'd31, 7'd37, 32'd0};//{'dest': 31, 'src': 37, 'op': 'move'}
    instructions[1290] = {6'd14, 7'd0, 7'd0, 32'd1291};//{'label': 1291, 'op': 'goto'}
    instructions[1291] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1292] = {6'd3, 7'd37, 7'd31, 32'd0};//{'dest': 37, 'src': 31, 'op': 'move'}
    instructions[1293] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1294] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1295] = {6'd36, 7'd0, 7'd37, 32'd0};//{'src': 37, 'output': 'leds', 'op': 'write'}
    instructions[1296] = {6'd37, 7'd38, 7'd0, 32'd0};//{'dest': 38, 'input': 'switches', 'op': 'read'}
    instructions[1297] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1298] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1299] = {6'd38, 7'd37, 7'd38, 32'd0};//{'dest': 37, 'src': 38, 'op': '~'}
    instructions[1300] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1301] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1302] = {6'd3, 7'd29, 7'd37, 32'd0};//{'dest': 29, 'src': 37, 'op': 'move'}
    instructions[1303] = {6'd3, 7'd49, 7'd34, 32'd0};//{'dest': 49, 'src': 34, 'op': 'move'}
    instructions[1304] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1305] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1306] = {6'd3, 7'd16, 7'd49, 32'd0};//{'dest': 16, 'src': 49, 'op': 'move'}
    instructions[1307] = {6'd0, 7'd38, 7'd0, 32'd59};//{'dest': 38, 'literal': 59, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1308] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1309] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1310] = {6'd3, 7'd17, 7'd38, 32'd0};//{'dest': 17, 'src': 38, 'op': 'move'}
    instructions[1311] = {6'd0, 7'd38, 7'd0, 32'd0};//{'dest': 38, 'literal': 0, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1312] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1313] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1314] = {6'd3, 7'd18, 7'd38, 32'd0};//{'dest': 18, 'src': 38, 'op': 'move'}
    instructions[1315] = {6'd0, 7'd38, 7'd0, 32'd1460};//{'dest': 38, 'literal': 1460, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1316] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1317] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1318] = {6'd3, 7'd19, 7'd38, 32'd0};//{'dest': 19, 'src': 38, 'op': 'move'}
    instructions[1319] = {6'd1, 7'd14, 7'd0, 32'd832};//{'dest': 14, 'label': 832, 'op': 'jmp_and_link'}
    instructions[1320] = {6'd3, 7'd37, 7'd15, 32'd0};//{'dest': 37, 'src': 15, 'op': 'move'}
    instructions[1321] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1322] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1323] = {6'd3, 7'd26, 7'd37, 32'd0};//{'dest': 26, 'src': 37, 'op': 'move'}
    instructions[1324] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1325] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1326] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1327] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1328] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1329] = {6'd13, 7'd37, 7'd38, 32'd2};//{'src': 38, 'right': 2, 'dest': 37, 'signed': False, 'op': '+', 'type': 'int', 'size': 2}
    instructions[1330] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1331] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1332] = {6'd3, 7'd26, 7'd37, 32'd0};//{'dest': 26, 'src': 37, 'op': 'move'}
    instructions[1333] = {6'd3, 7'd38, 7'd29, 32'd0};//{'dest': 38, 'src': 29, 'op': 'move'}
    instructions[1334] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1335] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1336] = {6'd32, 7'd37, 7'd38, 32'd128};//{'src': 38, 'right': 128, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1337] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1338] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1339] = {6'd12, 7'd0, 7'd37, 32'd1349};//{'src': 37, 'label': 1349, 'op': 'jmp_if_false'}
    instructions[1340] = {6'd0, 7'd37, 7'd0, 32'd48};//{'dest': 37, 'literal': 48, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1341] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1342] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1343] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1344] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1345] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1346] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1347] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1348] = {6'd14, 7'd0, 7'd0, 32'd1357};//{'label': 1357, 'op': 'goto'}
    instructions[1349] = {6'd0, 7'd37, 7'd0, 32'd49};//{'dest': 37, 'literal': 49, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1350] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1351] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1352] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1353] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1354] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1355] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1356] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1357] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1358] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1359] = {6'd3, 7'd38, 7'd29, 32'd0};//{'dest': 38, 'src': 29, 'op': 'move'}
    instructions[1360] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1361] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1362] = {6'd32, 7'd37, 7'd38, 32'd64};//{'src': 38, 'right': 64, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1363] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1364] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1365] = {6'd12, 7'd0, 7'd37, 32'd1375};//{'src': 37, 'label': 1375, 'op': 'jmp_if_false'}
    instructions[1366] = {6'd0, 7'd37, 7'd0, 32'd48};//{'dest': 37, 'literal': 48, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1367] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1368] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1369] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1370] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1371] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1372] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1373] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1374] = {6'd14, 7'd0, 7'd0, 32'd1383};//{'label': 1383, 'op': 'goto'}
    instructions[1375] = {6'd0, 7'd37, 7'd0, 32'd49};//{'dest': 37, 'literal': 49, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1376] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1377] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1378] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1379] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1380] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1381] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1382] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1383] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1384] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1385] = {6'd3, 7'd38, 7'd29, 32'd0};//{'dest': 38, 'src': 29, 'op': 'move'}
    instructions[1386] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1387] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1388] = {6'd32, 7'd37, 7'd38, 32'd32};//{'src': 38, 'right': 32, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1389] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1390] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1391] = {6'd12, 7'd0, 7'd37, 32'd1401};//{'src': 37, 'label': 1401, 'op': 'jmp_if_false'}
    instructions[1392] = {6'd0, 7'd37, 7'd0, 32'd48};//{'dest': 37, 'literal': 48, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1393] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1394] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1395] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1396] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1397] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1398] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1399] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1400] = {6'd14, 7'd0, 7'd0, 32'd1409};//{'label': 1409, 'op': 'goto'}
    instructions[1401] = {6'd0, 7'd37, 7'd0, 32'd49};//{'dest': 37, 'literal': 49, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1402] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1403] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1404] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1405] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1406] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1407] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1408] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1409] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1410] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1411] = {6'd3, 7'd38, 7'd29, 32'd0};//{'dest': 38, 'src': 29, 'op': 'move'}
    instructions[1412] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1413] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1414] = {6'd32, 7'd37, 7'd38, 32'd16};//{'src': 38, 'right': 16, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1415] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1416] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1417] = {6'd12, 7'd0, 7'd37, 32'd1427};//{'src': 37, 'label': 1427, 'op': 'jmp_if_false'}
    instructions[1418] = {6'd0, 7'd37, 7'd0, 32'd48};//{'dest': 37, 'literal': 48, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1419] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1420] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1421] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1422] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1423] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1424] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1425] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1426] = {6'd14, 7'd0, 7'd0, 32'd1435};//{'label': 1435, 'op': 'goto'}
    instructions[1427] = {6'd0, 7'd37, 7'd0, 32'd49};//{'dest': 37, 'literal': 49, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1428] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1429] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1430] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1431] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1432] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1433] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1434] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1435] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1436] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1437] = {6'd3, 7'd38, 7'd29, 32'd0};//{'dest': 38, 'src': 29, 'op': 'move'}
    instructions[1438] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1439] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1440] = {6'd32, 7'd37, 7'd38, 32'd8};//{'src': 38, 'right': 8, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1441] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1442] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1443] = {6'd12, 7'd0, 7'd37, 32'd1453};//{'src': 37, 'label': 1453, 'op': 'jmp_if_false'}
    instructions[1444] = {6'd0, 7'd37, 7'd0, 32'd48};//{'dest': 37, 'literal': 48, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1445] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1446] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1447] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1448] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1449] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1450] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1451] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1452] = {6'd14, 7'd0, 7'd0, 32'd1461};//{'label': 1461, 'op': 'goto'}
    instructions[1453] = {6'd0, 7'd37, 7'd0, 32'd49};//{'dest': 37, 'literal': 49, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1454] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1455] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1456] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1457] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1458] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1459] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1460] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1461] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1462] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1463] = {6'd3, 7'd38, 7'd29, 32'd0};//{'dest': 38, 'src': 29, 'op': 'move'}
    instructions[1464] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1465] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1466] = {6'd32, 7'd37, 7'd38, 32'd4};//{'src': 38, 'right': 4, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1467] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1468] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1469] = {6'd12, 7'd0, 7'd37, 32'd1479};//{'src': 37, 'label': 1479, 'op': 'jmp_if_false'}
    instructions[1470] = {6'd0, 7'd37, 7'd0, 32'd48};//{'dest': 37, 'literal': 48, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1471] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1472] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1473] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1474] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1475] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1476] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1477] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1478] = {6'd14, 7'd0, 7'd0, 32'd1487};//{'label': 1487, 'op': 'goto'}
    instructions[1479] = {6'd0, 7'd37, 7'd0, 32'd49};//{'dest': 37, 'literal': 49, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1480] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1481] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1482] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1483] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1484] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1485] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1486] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1487] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1488] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1489] = {6'd3, 7'd38, 7'd29, 32'd0};//{'dest': 38, 'src': 29, 'op': 'move'}
    instructions[1490] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1491] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1492] = {6'd32, 7'd37, 7'd38, 32'd2};//{'src': 38, 'right': 2, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1493] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1494] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1495] = {6'd12, 7'd0, 7'd37, 32'd1505};//{'src': 37, 'label': 1505, 'op': 'jmp_if_false'}
    instructions[1496] = {6'd0, 7'd37, 7'd0, 32'd48};//{'dest': 37, 'literal': 48, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1497] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1498] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1499] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1500] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1501] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1502] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1503] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1504] = {6'd14, 7'd0, 7'd0, 32'd1513};//{'label': 1513, 'op': 'goto'}
    instructions[1505] = {6'd0, 7'd37, 7'd0, 32'd49};//{'dest': 37, 'literal': 49, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1506] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1507] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1508] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1509] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1510] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1511] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1512] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1513] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1514] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1515] = {6'd3, 7'd38, 7'd29, 32'd0};//{'dest': 38, 'src': 29, 'op': 'move'}
    instructions[1516] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1517] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1518] = {6'd32, 7'd37, 7'd38, 32'd1};//{'src': 38, 'right': 1, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1519] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1520] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1521] = {6'd12, 7'd0, 7'd37, 32'd1531};//{'src': 37, 'label': 1531, 'op': 'jmp_if_false'}
    instructions[1522] = {6'd0, 7'd37, 7'd0, 32'd48};//{'dest': 37, 'literal': 48, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1523] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1524] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1525] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1526] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1527] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1528] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1529] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1530] = {6'd14, 7'd0, 7'd0, 32'd1539};//{'label': 1539, 'op': 'goto'}
    instructions[1531] = {6'd0, 7'd37, 7'd0, 32'd49};//{'dest': 37, 'literal': 49, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1532] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1533] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1534] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1535] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1536] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1537] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1538] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1539] = {6'd40, 7'd38, 7'd0, 32'd0};//{'dest': 38, 'input': 'buttons', 'op': 'read'}
    instructions[1540] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1541] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1542] = {6'd38, 7'd37, 7'd38, 32'd0};//{'dest': 37, 'src': 38, 'op': '~'}
    instructions[1543] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1544] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1545] = {6'd3, 7'd30, 7'd37, 32'd0};//{'dest': 30, 'src': 37, 'op': 'move'}
    instructions[1546] = {6'd3, 7'd49, 7'd34, 32'd0};//{'dest': 49, 'src': 34, 'op': 'move'}
    instructions[1547] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1548] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1549] = {6'd3, 7'd16, 7'd49, 32'd0};//{'dest': 16, 'src': 49, 'op': 'move'}
    instructions[1550] = {6'd0, 7'd38, 7'd0, 32'd59};//{'dest': 38, 'literal': 59, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1551] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1552] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1553] = {6'd3, 7'd17, 7'd38, 32'd0};//{'dest': 17, 'src': 38, 'op': 'move'}
    instructions[1554] = {6'd3, 7'd39, 7'd26, 32'd0};//{'dest': 39, 'src': 26, 'op': 'move'}
    instructions[1555] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1556] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1557] = {6'd13, 7'd38, 7'd39, 32'd1};//{'src': 39, 'right': 1, 'dest': 38, 'signed': False, 'op': '+', 'type': 'int', 'size': 2}
    instructions[1558] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1559] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1560] = {6'd3, 7'd18, 7'd38, 32'd0};//{'dest': 18, 'src': 38, 'op': 'move'}
    instructions[1561] = {6'd0, 7'd38, 7'd0, 32'd1460};//{'dest': 38, 'literal': 1460, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1562] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1563] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1564] = {6'd3, 7'd19, 7'd38, 32'd0};//{'dest': 19, 'src': 38, 'op': 'move'}
    instructions[1565] = {6'd1, 7'd14, 7'd0, 32'd832};//{'dest': 14, 'label': 832, 'op': 'jmp_and_link'}
    instructions[1566] = {6'd3, 7'd37, 7'd15, 32'd0};//{'dest': 37, 'src': 15, 'op': 'move'}
    instructions[1567] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1568] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1569] = {6'd3, 7'd26, 7'd37, 32'd0};//{'dest': 26, 'src': 37, 'op': 'move'}
    instructions[1570] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1571] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1572] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1573] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1574] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1575] = {6'd13, 7'd37, 7'd38, 32'd2};//{'src': 38, 'right': 2, 'dest': 37, 'signed': False, 'op': '+', 'type': 'int', 'size': 2}
    instructions[1576] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1577] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1578] = {6'd3, 7'd26, 7'd37, 32'd0};//{'dest': 26, 'src': 37, 'op': 'move'}
    instructions[1579] = {6'd3, 7'd38, 7'd30, 32'd0};//{'dest': 38, 'src': 30, 'op': 'move'}
    instructions[1580] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1581] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1582] = {6'd32, 7'd37, 7'd38, 32'd1};//{'src': 38, 'right': 1, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1583] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1584] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1585] = {6'd12, 7'd0, 7'd37, 32'd1595};//{'src': 37, 'label': 1595, 'op': 'jmp_if_false'}
    instructions[1586] = {6'd0, 7'd37, 7'd0, 32'd48};//{'dest': 37, 'literal': 48, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1587] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1588] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1589] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1590] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1591] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1592] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1593] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1594] = {6'd14, 7'd0, 7'd0, 32'd1603};//{'label': 1603, 'op': 'goto'}
    instructions[1595] = {6'd0, 7'd37, 7'd0, 32'd49};//{'dest': 37, 'literal': 49, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1596] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1597] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1598] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1599] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1600] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1601] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1602] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1603] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1604] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1605] = {6'd3, 7'd38, 7'd30, 32'd0};//{'dest': 38, 'src': 30, 'op': 'move'}
    instructions[1606] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1607] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1608] = {6'd32, 7'd37, 7'd38, 32'd2};//{'src': 38, 'right': 2, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1609] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1610] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1611] = {6'd12, 7'd0, 7'd37, 32'd1621};//{'src': 37, 'label': 1621, 'op': 'jmp_if_false'}
    instructions[1612] = {6'd0, 7'd37, 7'd0, 32'd48};//{'dest': 37, 'literal': 48, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1613] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1614] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1615] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1616] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1617] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1618] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1619] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1620] = {6'd14, 7'd0, 7'd0, 32'd1629};//{'label': 1629, 'op': 'goto'}
    instructions[1621] = {6'd0, 7'd37, 7'd0, 32'd49};//{'dest': 37, 'literal': 49, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1622] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1623] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1624] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1625] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1626] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1627] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1628] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1629] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1630] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1631] = {6'd3, 7'd38, 7'd30, 32'd0};//{'dest': 38, 'src': 30, 'op': 'move'}
    instructions[1632] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1633] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1634] = {6'd32, 7'd37, 7'd38, 32'd4};//{'src': 38, 'right': 4, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1635] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1636] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1637] = {6'd12, 7'd0, 7'd37, 32'd1647};//{'src': 37, 'label': 1647, 'op': 'jmp_if_false'}
    instructions[1638] = {6'd0, 7'd37, 7'd0, 32'd48};//{'dest': 37, 'literal': 48, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1639] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1640] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1641] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1642] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1643] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1644] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1645] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1646] = {6'd14, 7'd0, 7'd0, 32'd1655};//{'label': 1655, 'op': 'goto'}
    instructions[1647] = {6'd0, 7'd37, 7'd0, 32'd49};//{'dest': 37, 'literal': 49, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1648] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1649] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1650] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1651] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1652] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1653] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1654] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1655] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1656] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1657] = {6'd3, 7'd38, 7'd30, 32'd0};//{'dest': 38, 'src': 30, 'op': 'move'}
    instructions[1658] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1659] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1660] = {6'd32, 7'd37, 7'd38, 32'd8};//{'src': 38, 'right': 8, 'dest': 37, 'signed': False, 'op': '&', 'type': 'int', 'size': 2}
    instructions[1661] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1662] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1663] = {6'd12, 7'd0, 7'd37, 32'd1673};//{'src': 37, 'label': 1673, 'op': 'jmp_if_false'}
    instructions[1664] = {6'd0, 7'd37, 7'd0, 32'd48};//{'dest': 37, 'literal': 48, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1665] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1666] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1667] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1668] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1669] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1670] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1671] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1672] = {6'd14, 7'd0, 7'd0, 32'd1681};//{'label': 1681, 'op': 'goto'}
    instructions[1673] = {6'd0, 7'd37, 7'd0, 32'd49};//{'dest': 37, 'literal': 49, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1674] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1675] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1676] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1677] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1678] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1679] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1680] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1681] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1682] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1683] = {6'd0, 7'd37, 7'd0, 32'd32};//{'dest': 37, 'literal': 32, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1684] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1685] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1686] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1687] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1688] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1689] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1690] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1691] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1692] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1693] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1694] = {6'd0, 7'd37, 7'd0, 32'd32};//{'dest': 37, 'literal': 32, 'size': 2, 'signed': 2, 'op': 'literal'}
    instructions[1695] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1696] = {6'd3, 7'd38, 7'd26, 32'd0};//{'dest': 38, 'src': 26, 'op': 'move'}
    instructions[1697] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1698] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1699] = {6'd39, 7'd39, 7'd38, 32'd34};//{'dest': 39, 'src': 38, 'srcb': 34, 'signed': True, 'op': '+'}
    instructions[1700] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1701] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1702] = {6'd33, 7'd0, 7'd39, 32'd37};//{'srcb': 37, 'src': 39, 'element_size': 2, 'op': 'memory_write'}
    instructions[1703] = {6'd3, 7'd37, 7'd26, 32'd0};//{'dest': 37, 'src': 26, 'op': 'move'}
    instructions[1704] = {6'd13, 7'd26, 7'd26, 32'd1};//{'src': 26, 'right': 1, 'dest': 26, 'signed': False, 'op': '+', 'size': 2}
    instructions[1705] = {6'd3, 7'd49, 7'd34, 32'd0};//{'dest': 49, 'src': 34, 'op': 'move'}
    instructions[1706] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1707] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1708] = {6'd3, 7'd6, 7'd49, 32'd0};//{'dest': 6, 'src': 49, 'op': 'move'}
    instructions[1709] = {6'd1, 7'd5, 7'd0, 32'd609};//{'dest': 5, 'label': 609, 'op': 'jmp_and_link'}
    instructions[1710] = {6'd14, 7'd0, 7'd0, 32'd1712};//{'label': 1712, 'op': 'goto'}
    instructions[1711] = {6'd1, 7'd2, 7'd0, 32'd571};//{'dest': 2, 'label': 571, 'op': 'jmp_and_link'}
    instructions[1712] = {6'd14, 7'd0, 7'd0, 32'd957};//{'label': 957, 'op': 'goto'}
    instructions[1713] = {6'd41, 7'd37, 7'd0, 32'd0};//{'dest': 37, 'input': 'rs232_rx', 'op': 'read'}
    instructions[1714] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1715] = {6'd4, 7'd0, 7'd0, 32'd0};//{'op': 'nop'}
    instructions[1716] = {6'd3, 7'd26, 7'd37, 32'd0};//{'dest': 26, 'src': 37, 'op': 'move'}
    instructions[1717] = {6'd6, 7'd0, 7'd23, 32'd0};//{'src': 23, 'op': 'jmp_to_reg'}
  end


  //////////////////////////////////////////////////////////////////////////////
  // CPU IMPLEMENTAION OF C PROCESS                                             
  //                                                                            
  // This section of the file contains a CPU implementing the C process.        
  
  always @(posedge clk)
  begin

    //implement memory for 2 byte x n arrays
    if (memory_enable_2 == 1'b1) begin
      memory_2[address_2] <= data_in_2;
    end
    data_out_2 <= memory_2[address_2];
    memory_enable_2 <= 1'b0;

    write_enable_2 <= 0;
    //stage 0 instruction fetch
    if (stage_0_enable) begin
      stage_1_enable <= 1;
      instruction_0 <= instructions[program_counter];
      opcode_0 = instruction_0[51:46];
      dest_0 = instruction_0[45:39];
      src_0 = instruction_0[38:32];
      srcb_0 = instruction_0[6:0];
      literal_0 = instruction_0[31:0];
      if(write_enable_2) begin
        registers[dest_2] <= result_2;
      end
      program_counter_0 <= program_counter;
      program_counter <= program_counter + 1;
    end

    //stage 1 opcode fetch
    if (stage_1_enable) begin
      stage_2_enable <= 1;
      register_1 <= registers[src_0];
      registerb_1 <= registers[srcb_0];
      dest_1 <= dest_0;
      literal_1 <= literal_0;
      opcode_1 <= opcode_0;
      program_counter_1 <= program_counter_0;
    end

    //stage 2 opcode fetch
    if (stage_2_enable) begin
      dest_2 <= dest_1;
      case(opcode_1)

        16'd0:
        begin
          result_2 <= literal_1;
          write_enable_2 <= 1;
        end

        16'd1:
        begin
          program_counter <= literal_1;
          result_2 <= program_counter_1 + 1;
          write_enable_2 <= 1;
          stage_0_enable <= 1;
          stage_1_enable <= 0;
          stage_2_enable <= 0;
        end

        16'd2:
        begin
          stage_0_enable <= 0;
          stage_1_enable <= 0;
          stage_2_enable <= 0;
        end

        16'd3:
        begin
          result_2 <= register_1;
          write_enable_2 <= 1;
        end

        16'd5:
        begin
          stage_0_enable <= 0;
          stage_1_enable <= 0;
          stage_2_enable <= 0;
          s_output_socket_stb <= 1'b1;
          s_output_socket <= register_1;
        end

        16'd6:
        begin
          program_counter <= register_1;
          stage_0_enable <= 1;
          stage_1_enable <= 0;
          stage_2_enable <= 0;
        end

        16'd7:
        begin
          stage_0_enable <= 0;
          stage_1_enable <= 0;
          stage_2_enable <= 0;
          s_output_rs232_tx_stb <= 1'b1;
          s_output_rs232_tx <= register_1;
        end

        16'd8:
        begin
          result_2 <= $unsigned(register_1) + $unsigned(registerb_1);
          write_enable_2 <= 1;
        end

        16'd9:
        begin
          address_2 <= register_1;
        end

        16'd11:
        begin
          result_2 <= data_out_2;
          write_enable_2 <= 1;
        end

        16'd12:
        begin
          if (register_1 == 0) begin
            program_counter <= literal_1;
            stage_0_enable <= 1;
            stage_1_enable <= 0;
            stage_2_enable <= 0;
          end
        end

        16'd13:
        begin
          result_2 <= $unsigned(register_1) + $unsigned(literal_1);
          write_enable_2 <= 1;
        end

        16'd14:
        begin
          program_counter <= literal_1;
          stage_0_enable <= 1;
          stage_1_enable <= 0;
          stage_2_enable <= 0;
        end

        16'd15:
        begin
          result_2 <= $unsigned(register_1) >= $unsigned(literal_1);
          write_enable_2 <= 1;
        end

        16'd16:
        begin
          result_2 <= $unsigned(register_1) - $unsigned(literal_1);
          write_enable_2 <= 1;
        end

        16'd17:
        begin
          result_2 <= $unsigned(register_1) | $unsigned(registerb_1);
          write_enable_2 <= 1;
        end

        16'd18:
        begin
          result_2 <= $unsigned(register_1) | $unsigned(literal_1);
          write_enable_2 <= 1;
        end

        16'd19:
        begin
          result_2 <= $signed(register_1) >= $signed(literal_1);
          write_enable_2 <= 1;
        end

        16'd20:
        begin
          result_2 <= $signed(literal_1) - $signed(register_1);
          write_enable_2 <= 1;
        end

        16'd21:
        begin
          result_2 <= $signed(register_1) << $signed(literal_1);
          write_enable_2 <= 1;
        end

        16'd22:
        begin
          result_2 <= $signed(register_1) & $signed(literal_1);
          write_enable_2 <= 1;
        end

        16'd23:
        begin
          result_2 <= $unsigned(register_1) == $unsigned(literal_1);
          write_enable_2 <= 1;
        end

        16'd24:
        begin
          result_2 <= $unsigned(literal_1) | $unsigned(register_1);
          write_enable_2 <= 1;
        end

        16'd25:
        begin
          result_2 <= $unsigned(register_1) > $unsigned(literal_1);
          write_enable_2 <= 1;
        end

        16'd26:
        begin
          result_2 <= $unsigned(register_1) < $unsigned(literal_1);
          write_enable_2 <= 1;
        end

        16'd27:
        begin
          result_2 <= $unsigned(register_1) < $unsigned(registerb_1);
          write_enable_2 <= 1;
        end

        16'd28:
        begin
          result_2 <= $unsigned(register_1) == $unsigned(registerb_1);
          write_enable_2 <= 1;
        end

        16'd29:
        begin
          result_2 <= $signed(register_1) + $signed(literal_1);
          write_enable_2 <= 1;
        end

        16'd30:
        begin
          stage_0_enable <= 0;
          stage_1_enable <= 0;
          stage_2_enable <= 0;
          s_input_socket_ack <= 1'b1;
        end

        16'd31:
        begin
          result_2 <= $unsigned(register_1) >> $unsigned(literal_1);
          write_enable_2 <= 1;
        end

        16'd32:
        begin
          result_2 <= $unsigned(register_1) & $unsigned(literal_1);
          write_enable_2 <= 1;
        end

        16'd33:
        begin
          address_2 <= register_1;
          data_in_2 <= registerb_1;
          memory_enable_2 <= 1'b1;
        end

        16'd34:
        begin
          if (register_1 != 0) begin
            program_counter <= literal_1;
            stage_0_enable <= 1;
            stage_1_enable <= 0;
            stage_2_enable <= 0;
          end
        end

        16'd35:
        begin
          result_2 <= $signed(register_1) != $signed(literal_1);
          write_enable_2 <= 1;
        end

        16'd36:
        begin
          stage_0_enable <= 0;
          stage_1_enable <= 0;
          stage_2_enable <= 0;
          s_output_leds_stb <= 1'b1;
          s_output_leds <= register_1;
        end

        16'd37:
        begin
          stage_0_enable <= 0;
          stage_1_enable <= 0;
          stage_2_enable <= 0;
          s_input_switches_ack <= 1'b1;
        end

        16'd38:
        begin
          result_2 <= ~register_1;
          write_enable_2 <= 1;
        end

        16'd39:
        begin
          result_2 <= $signed(register_1) + $signed(registerb_1);
          write_enable_2 <= 1;
        end

        16'd40:
        begin
          stage_0_enable <= 0;
          stage_1_enable <= 0;
          stage_2_enable <= 0;
          s_input_buttons_ack <= 1'b1;
        end

        16'd41:
        begin
          stage_0_enable <= 0;
          stage_1_enable <= 0;
          stage_2_enable <= 0;
          s_input_rs232_rx_ack <= 1'b1;
        end

       endcase
    end
     if (s_output_socket_stb == 1'b1 && output_socket_ack == 1'b1) begin
       s_output_socket_stb <= 1'b0;
       stage_0_enable <= 1;
       stage_1_enable <= 1;
       stage_2_enable <= 1;
     end

     if (s_output_rs232_tx_stb == 1'b1 && output_rs232_tx_ack == 1'b1) begin
       s_output_rs232_tx_stb <= 1'b0;
       stage_0_enable <= 1;
       stage_1_enable <= 1;
       stage_2_enable <= 1;
     end

    if (s_input_socket_ack == 1'b1 && input_socket_stb == 1'b1) begin
       result_2 <= input_socket;
       write_enable_2 <= 1;
       s_input_socket_ack <= 1'b0;
       stage_0_enable <= 1;
       stage_1_enable <= 1;
       stage_2_enable <= 1;
     end

     if (s_output_leds_stb == 1'b1 && output_leds_ack == 1'b1) begin
       s_output_leds_stb <= 1'b0;
       stage_0_enable <= 1;
       stage_1_enable <= 1;
       stage_2_enable <= 1;
     end

    if (s_input_switches_ack == 1'b1 && input_switches_stb == 1'b1) begin
       result_2 <= input_switches;
       write_enable_2 <= 1;
       s_input_switches_ack <= 1'b0;
       stage_0_enable <= 1;
       stage_1_enable <= 1;
       stage_2_enable <= 1;
     end

    if (s_input_buttons_ack == 1'b1 && input_buttons_stb == 1'b1) begin
       result_2 <= input_buttons;
       write_enable_2 <= 1;
       s_input_buttons_ack <= 1'b0;
       stage_0_enable <= 1;
       stage_1_enable <= 1;
       stage_2_enable <= 1;
     end

    if (s_input_rs232_rx_ack == 1'b1 && input_rs232_rx_stb == 1'b1) begin
       result_2 <= input_rs232_rx;
       write_enable_2 <= 1;
       s_input_rs232_rx_ack <= 1'b0;
       stage_0_enable <= 1;
       stage_1_enable <= 1;
       stage_2_enable <= 1;
     end

    if (timer == 0) begin
      if (timer_enable) begin
         stage_0_enable <= 1;
         stage_1_enable <= 1;
         stage_2_enable <= 1;
         timer_enable <= 0;
      end
    end else begin
      timer <= timer - 1;
    end

    if (rst == 1'b1) begin
      stage_0_enable <= 1;
      stage_1_enable <= 0;
      stage_2_enable <= 0;
      timer <= 0;
      timer_enable <= 0;
      program_counter <= 0;
      s_input_switches_ack <= 0;
      s_input_buttons_ack <= 0;
      s_input_socket_ack <= 0;
      s_input_rs232_rx_ack <= 0;
      s_output_rs232_tx_stb <= 0;
      s_output_leds_stb <= 0;
      s_output_socket_stb <= 0;
    end
  end
  assign input_switches_ack = s_input_switches_ack;
  assign input_buttons_ack = s_input_buttons_ack;
  assign input_socket_ack = s_input_socket_ack;
  assign input_rs232_rx_ack = s_input_rs232_rx_ack;
  assign output_rs232_tx_stb = s_output_rs232_tx_stb;
  assign output_rs232_tx = s_output_rs232_tx;
  assign output_leds_stb = s_output_leds_stb;
  assign output_leds = s_output_leds;
  assign output_socket_stb = s_output_socket_stb;
  assign output_socket = s_output_socket;

endmodule
