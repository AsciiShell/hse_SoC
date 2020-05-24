// megafunction wizard: %LPM_MUX%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: LPM_MUX 

// ============================================================
// File Name: mux_my.v
// Megafunction Name(s):
// 			LPM_MUX
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 17.1.0 Build 590 10/25/2017 SJ Lite Edition
// ************************************************************

//Copyright (C) 2017  Intel Corporation. All rights reserved.
//Your use of Intel Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Intel Program License 
//Subscription Agreement, the Intel Quartus Prime License Agreement,
//the Intel FPGA IP License Agreement, or other applicable license
//agreement, including, without limitation, that your use is for
//the sole purpose of programming logic devices manufactured by
//Intel and sold by Intel or its authorized distributors.  Please
//refer to the applicable agreement for further details.

module mux_my (
	data0x,
	data10x,
	data11x,
	data12x,
	data13x,
	data14x,
	data15x,
	data1x,
	data2x,
	data3x,
	data4x,
	data5x,
	data6x,
	data7x,
	data8x,
	data9x,
	sel,
	result);

	input	[7:0]  data0x;
	input	[7:0]  data10x;
	input	[7:0]  data11x;
	input	[7:0]  data12x;
	input	[7:0]  data13x;
	input	[7:0]  data14x;
	input	[7:0]  data15x;
	input	[7:0]  data1x;
	input	[7:0]  data2x;
	input	[7:0]  data3x;
	input	[7:0]  data4x;
	input	[7:0]  data5x;
	input	[7:0]  data6x;
	input	[7:0]  data7x;
	input	[7:0]  data8x;
	input	[7:0]  data9x;
	input	[3:0]  sel;
	output	[7:0]  result;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "MAX 10"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: new_diagram STRING "1"
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: CONSTANT: LPM_SIZE NUMERIC "16"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_MUX"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "8"
// Retrieval info: CONSTANT: LPM_WIDTHS NUMERIC "4"
// Retrieval info: USED_PORT: data0x 0 0 8 0 INPUT NODEFVAL "data0x[7..0]"
// Retrieval info: USED_PORT: data10x 0 0 8 0 INPUT NODEFVAL "data10x[7..0]"
// Retrieval info: USED_PORT: data11x 0 0 8 0 INPUT NODEFVAL "data11x[7..0]"
// Retrieval info: USED_PORT: data12x 0 0 8 0 INPUT NODEFVAL "data12x[7..0]"
// Retrieval info: USED_PORT: data13x 0 0 8 0 INPUT NODEFVAL "data13x[7..0]"
// Retrieval info: USED_PORT: data14x 0 0 8 0 INPUT NODEFVAL "data14x[7..0]"
// Retrieval info: USED_PORT: data15x 0 0 8 0 INPUT NODEFVAL "data15x[7..0]"
// Retrieval info: USED_PORT: data1x 0 0 8 0 INPUT NODEFVAL "data1x[7..0]"
// Retrieval info: USED_PORT: data2x 0 0 8 0 INPUT NODEFVAL "data2x[7..0]"
// Retrieval info: USED_PORT: data3x 0 0 8 0 INPUT NODEFVAL "data3x[7..0]"
// Retrieval info: USED_PORT: data4x 0 0 8 0 INPUT NODEFVAL "data4x[7..0]"
// Retrieval info: USED_PORT: data5x 0 0 8 0 INPUT NODEFVAL "data5x[7..0]"
// Retrieval info: USED_PORT: data6x 0 0 8 0 INPUT NODEFVAL "data6x[7..0]"
// Retrieval info: USED_PORT: data7x 0 0 8 0 INPUT NODEFVAL "data7x[7..0]"
// Retrieval info: USED_PORT: data8x 0 0 8 0 INPUT NODEFVAL "data8x[7..0]"
// Retrieval info: USED_PORT: data9x 0 0 8 0 INPUT NODEFVAL "data9x[7..0]"
// Retrieval info: USED_PORT: result 0 0 8 0 OUTPUT NODEFVAL "result[7..0]"
// Retrieval info: USED_PORT: sel 0 0 4 0 INPUT NODEFVAL "sel[3..0]"
// Retrieval info: CONNECT: @data 0 0 8 0 data0x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 80 data10x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 88 data11x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 96 data12x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 104 data13x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 112 data14x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 120 data15x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 8 data1x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 16 data2x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 24 data3x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 32 data4x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 40 data5x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 48 data6x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 56 data7x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 64 data8x 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 72 data9x 0 0 8 0
// Retrieval info: CONNECT: @sel 0 0 4 0 sel 0 0 4 0
// Retrieval info: CONNECT: result 0 0 8 0 @result 0 0 8 0
// Retrieval info: GEN_FILE: TYPE_NORMAL mux_my.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mux_my.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL mux_my.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL mux_my.bsf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mux_my_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mux_my_bb.v TRUE
// Retrieval info: LIB_FILE: lpm
