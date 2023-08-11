#################################
##  SP701 Rev1.0 XDC 
##  05/08/2019
################################

## Timing constraints
set_property PACKAGE_PIN D9       [get_ports "clk"] ;# Bank  33 VCCO - VCCO_2V5 - IO_L18N_T2_33
set_property IOSTANDARD  LVCMOS25 [get_ports "clk"] ;# Bank  33 VCCO - VCCO_2V5 - IO_L18N_T2_33

create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports {clk}]

set_input_delay -clock [get_clocks clk] -min -add_delay 1.0 [get_ports {ascii_char_in[*]}]
set_input_delay -clock [get_clocks clk] -max -add_delay 1.5 [get_ports {ascii_char_in[*]}]
set_input_delay -clock [get_clocks clk] -min -add_delay 1.0 [get_ports rst_n]
set_input_delay -clock [get_clocks clk] -max -add_delay 1.5 [get_ports rst_n]
set_input_delay -clock [get_clocks clk] -min -add_delay 1.0 [get_ports valid_in]
set_input_delay -clock [get_clocks clk] -max -add_delay 1.5 [get_ports valid_in]


# IO connections
set_property PACKAGE_PIN E20      [get_ports "rst_n"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L17P_T2_16
set_property IOSTANDARD  LVCMOS33 [get_ports "rst_n"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L17P_T2_16
set_property PACKAGE_PIN D19      [get_ports "valid_in"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L17N_T2_16
set_property IOSTANDARD  LVCMOS33 [get_ports "valid_in"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L17N_T2_16
set_property PACKAGE_PIN D20      [get_ports "busy_out"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L18P_T2_16
set_property IOSTANDARD  LVCMOS33 [get_ports "busy_out"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L18P_T2_16

set_property PACKAGE_PIN A13      [get_ports "binary_data_out[0]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_0_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[0]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_0_16
set_property PACKAGE_PIN A14      [get_ports "binary_data_out[1]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L1P_T0_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[1]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L1P_T0_16
set_property PACKAGE_PIN A15      [get_ports "binary_data_out[2]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L1N_T0_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[2]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L1N_T0_16
set_property PACKAGE_PIN A17      [get_ports "binary_data_out[3]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L2P_T0_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[3]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L2P_T0_16
set_property PACKAGE_PIN A18      [get_ports "binary_data_out[4]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L2N_T0_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[4]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L2N_T0_16
set_property PACKAGE_PIN A19      [get_ports "binary_data_out[5]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L3P_T0_DQS_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[5]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L3P_T0_DQS_16
set_property PACKAGE_PIN A20      [get_ports "binary_data_out[6]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L3N_T0_DQS_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[6]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L3N_T0_DQS_16
set_property PACKAGE_PIN A22      [get_ports "binary_data_out[7]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L4P_T0_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[7]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L4P_T0_16
set_property PACKAGE_PIN A23      [get_ports "binary_data_out[8]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L4N_T0_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[8]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L4N_T0_16
set_property PACKAGE_PIN A24      [get_ports "binary_data_out[9]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L5P_T0_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[9]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L5P_T0_16
set_property PACKAGE_PIN A25      [get_ports "binary_data_out[10]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L5N_T0_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[10]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L5N_T0_16
set_property PACKAGE_PIN B14      [get_ports "binary_data_out[11]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L6P_T0_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[11]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L6P_T0_16
set_property PACKAGE_PIN B15      [get_ports "binary_data_out[12]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L6N_T0_VREF_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[12]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L6N_T0_VREF_16
set_property PACKAGE_PIN B16      [get_ports "binary_data_out[13]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L7P_T1_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[13]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L7N_T1_16
set_property PACKAGE_PIN B19      [get_ports "binary_data_out[14]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L8P_T1_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[14]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L8P_T1_16
set_property PACKAGE_PIN B20      [get_ports "binary_data_out[15]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L8N_T1_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[15]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L8N_T1_16
set_property PACKAGE_PIN B21      [get_ports "binary_data_out[16]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L9P_T1_DQS_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[16]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L9P_T1_DQS_16
set_property PACKAGE_PIN B22      [get_ports "binary_data_out[17]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L9N_T1_DQS_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[17]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L9N_T1_DQS_16
set_property PACKAGE_PIN B24      [get_ports "binary_data_out[18]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L10P_T1_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[18]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L10P_T1_16
set_property PACKAGE_PIN C13      [get_ports "binary_data_out[19]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L10N_T1_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[19]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L10N_T1_16
set_property PACKAGE_PIN C14      [get_ports "binary_data_out[20]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L11P_T1_SRCC_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[20]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L11P_T1_SRCC_16
set_property PACKAGE_PIN C16      [get_ports "binary_data_out[21]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L11N_T1_SRCC_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[21]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L11N_T1_SRCC_16
set_property PACKAGE_PIN C17      [get_ports "binary_data_out[22]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L12P_T1_MRCC_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[22]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L12P_T1_MRCC_16
set_property PACKAGE_PIN C18      [get_ports "binary_data_out[23]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L12N_T1_MRCC_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[23]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L12N_T1_MRCC_16
set_property PACKAGE_PIN C19      [get_ports "binary_data_out[24]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L13P_T2_MRCC_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[24]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L13P_T2_MRCC_16
set_property PACKAGE_PIN C21      [get_ports "binary_data_out[25]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L13N_T2_MRCC_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[25]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L13N_T2_MRCC_16
set_property PACKAGE_PIN C22      [get_ports "binary_data_out[26]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L14P_T2_SRCC_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[26]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L14P_T2_SRCC_16
set_property PACKAGE_PIN C23      [get_ports "binary_data_out[27]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L14N_T2_SRCC_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[27]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L14N_T2_SRCC_16
set_property PACKAGE_PIN C24      [get_ports "binary_data_out[28]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L15P_T2_DQS_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[28]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L15P_T2_DQS_16
set_property PACKAGE_PIN D14      [get_ports "binary_data_out[29]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L15N_T2_DQS_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[29]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L15N_T2_DQS_16
set_property PACKAGE_PIN D15      [get_ports "binary_data_out[30]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L16P_T2_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[30]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L16P_T2_16
set_property PACKAGE_PIN D16      [get_ports "binary_data_out[31]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L16N_T2_16
set_property IOSTANDARD  LVCMOS33 [get_ports "binary_data_out[31]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L16N_T2_16

set_property PACKAGE_PIN E15      [get_ports "ascii_char_in[0]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L17P_T2_16
set_property IOSTANDARD  LVCMOS33 [get_ports "ascii_char_in[0]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L17P_T2_16
set_property PACKAGE_PIN E16      [get_ports "ascii_char_in[1]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L17N_T2_16
set_property IOSTANDARD  LVCMOS33 [get_ports "ascii_char_in[1]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L17N_T2_16
set_property PACKAGE_PIN E17      [get_ports "ascii_char_in[2]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L18P_T2_16
set_property IOSTANDARD  LVCMOS33 [get_ports "ascii_char_in[2]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L18P_T2_16
set_property PACKAGE_PIN E18      [get_ports "ascii_char_in[3]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L18N_T2_16
set_property IOSTANDARD  LVCMOS33 [get_ports "ascii_char_in[3]"] ;# Bank  16 VCCO - VCCO_3V3 - IO_L18N_T2_16
