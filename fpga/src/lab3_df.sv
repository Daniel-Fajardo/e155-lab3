module top(
    input logic reset,
	input logic [3:0] row,
    output logic [6:0] seg,
    output logic anode1,
    output logic anode2,
    output logic [3:0] col
);
	logic clk;
	logic [3:0] hex, hex1, hex2, s;
	logic int_osc;
	logic [9:0] counter; 
	
	// Internal high-speed oscillator
//	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

	clockdivider clockdivider(reset, clk, counter[9:0]); // creates clock
	keypadinput keypadinput(clk, reset, row[3:0], col[3:0], hex[3:0]); // checks for keypad button press
	hex hexshift(clk, reset, hex[3:0], hex1[3:0], hex2[3:0]); // shifts hex input to first and second digit
	chooseanode chooseanode(clk, reset, hex1[3:0], hex2[3:0], anode1, anode2, s[3:0]); // alternates which display is active
	segmentlogic segmentlogic1(s[3:0], seg[6:0]); // logic for the segment display

endmodule