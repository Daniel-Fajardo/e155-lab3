module top(
    input logic reset,
	input logic [3:0] row,
    output logic [6:0] seg,
    output logic anode1,
    output logic anode2,
    output logic [3:0] col
);
	logic clk;
	logic [3:0] hex;
	logic int_osc;
	logic [9:0] counter; 
	
	// Internal high-speed oscillator
//	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

	clockdivider clockdivider(reset, clk, counter[9:0]);
	keypadinput keypadinput(clk, reset, row[3:0], col[3:0], hex[3:0])
    segmentlogic segmentlogic(hex[3:0], seg[6:0])

endmodule