module keypadinput_tb();
    logic clk, reset;
    logic [3:0] row, col, hex;

    keypadinput dut(.clk(clk), .reset(reset), .row(row), .col(col), .hex(hex));

    initial begin
        reset = 1; #5;
        reset = 0; #5;
        end
    always begin
        clk = 1; #5;
        clk = 0; #5;
        end
    initial begin
        row = 4'b0000; #100;
        row = 4'b0001; #500;
        row = 4'b0000; #300;
        row = 4'b0100; #500;
        row = 4'b0101; #200;
        row = 4'b0001; #300;
        row = 4'b0000; #200;
        row = 4'b1000; #300;


        end
endmodule