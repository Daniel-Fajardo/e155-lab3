module hex(
    input logic clk, reset,
    input logic [3:0] hex,
    output logic [3:0] hex1, hex2
);
    always_ff @(posedge clk, posedge reset) begin
        if (reset) begin
            hex2 <= 4'b0000;
            hex1 <= 4'b0000;
            end
        else if (hex != hex1) begin
            hex2 <= hex1;
            hex1 <= hex;
            end
        else begin
            hex2 <= hex2;
            hex1 <= hex1;
            end
        end
endmodule