// Daniel Fajardo
// dfajardo@g.hmc.edu
// 09/22/2024
//
// top level module for lab 3: Keypad Scanner
module top(
    input logic reset,
	input logic [3:0] row,
    output logic [6:0] seg,
    output logic anode1,
    output logic anode2,
    output logic [3:0] col,
	output logic clk_test
);
	logic clk, hexen, colen;
	logic [3:0] hex, hex1, hex2, s, colin;
	logic int_osc;
	logic [18:0] counter; 
	
	assign clk_test = clk;

	clockdivider clockdivider1(reset, clk, counter[18:0]); // creates clock
	keypadinput keypadinput1(clk, reset, row[3:0], colin[3:0], hex[3:0], hexen, colen); // checks for keypad button press
	colenable colenable1(clk, reset, colen, colin[3:0], col[3:0]);
	hex hexshift(clk, reset, hexen, hex[3:0], hex1[3:0], hex2[3:0]); // shifts hex input to first and second digit
	chooseanode chooseanode(clk, reset, hex1[3:0], hex2[3:0], anode1, anode2, s[3:0]); // alternates which display is active
	segmentlogic segmentlogic1(s[3:0], seg[6:0]); // logic for the segment display

endmodule