// Daniel Fajardo
// dfajardo@g.hmc.edu
// 09/22/2024
//
// utilizes HSOSC to regulate the frequency of the clock
module clockdivider(
	input logic reset,
	output logic clk,
	output logic [18:0] counter
);
	logic int_osc;

	// Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	// Simple clock divider
	always_ff @(posedge int_osc) begin
		if (!reset) 	counter <= 0;
		else 		counter <= counter + 1;
		end
	assign clk = counter[18];
endmodule