// Daniel Fajardo
// dfajardo@g.hmc.edu
// 09/22/2024
//
// this module simply updates column output when enabled
module colenable(
    input logic clk,
    input logic reset,
	input logic colen,
    input logic [3:0] colin,
    output logic [3:0] colout
);
    always_ff @(posedge clk)
        if (!reset) colout <= 4'b0000;
        else if (colen) colout <= colin;
endmodule