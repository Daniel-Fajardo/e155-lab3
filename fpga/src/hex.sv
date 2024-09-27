// Daniel Fajardo
// dfajardo@g.hmc.edu
// 09/22/2024
//
// this module records the last two hex signals by recording the most recent input and shifting the other
module hex(
    input logic clk, reset, hexen,
    input logic [3:0] hex,
    output logic [3:0] hex1, hex2
);
    always_ff @(posedge clk)
        if (!reset) begin
            hex2 <= 4'b0000;
            hex1 <= 4'b0000;
            end
        else if (hexen) begin
            hex2 <= hex1;
            hex1 <= hex;
            end
        else begin
            hex2 <= hex2;
            hex1 <= hex1;
            end
endmodule